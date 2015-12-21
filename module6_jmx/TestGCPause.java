//TestGCPause.java

import java.util.*;

public class TestGCPause {

    /*
     * ëÓ ÄÑÏÇÎÚÃÉÏÍÎ ÓÏÝÎÑÉ     */
    static class Message {
        private long sendTime;

        private long maxPause;

        private boolean messageSent;

        private boolean messageReceived;

        public long getMaxPause() {
            return maxPause;
        }

        public synchronized void sendMessage() throws InterruptedException {
            // ÏÐÁÉØÓÏÝÎÅÉÓÈÁÉØ×ÅÑÏÐÁË
            messageSent = true;
            sendTime = System.currentTimeMillis();
            notify();

            // ÖÁØÐË ÓÏÝÎÅÎ ÂÄÔÐÌÞÎ
            while (!messageReceived)
                wait();

            messageReceived = false;
        }

        public synchronized void waitMessage() throws InterruptedException {
            // ÖÁØÓÏÝÎÅ
            while (!messageSent)
                wait();
            
            // ÏÒÄÌÔ ×ÅÑÍÖÕÏÐÁËÊÉÐÌÞÎÅ ÓÏÝÎÑ            long receiveTime = System.currentTimeMillis();
            messageSent = false;

            // ÓÈÁÉØÍËÉÁØÏ ÚÁÅÉ pause
            long pause = receiveTime - sendTime;
            if (pause > maxPause) {
                maxPause = pause;
            }

            // ÓÏÝÔ ÞÏÓÏÝÎÅÂÌ ÐÌÞÎ
            messageReceived = true;
            notify();
        }
    }

    // ËÌÞÓ× ÓÏÝÎÊÐÒÄ×ÅÏ × ×ÅÑÔÓÉÏÁÉ
    static final int MESSAGE_NUMBER = 2000000;

    /*
     * ðËÏÐÁÌÀÉ ÓÏÝÎÑ     */
    static class MessageSender extends Thread {
        private Message message;

        public MessageSender(Message message) {
            this.message = message;
        }

        public void run() {
            try {
                for (int i = 0; i < MESSAGE_NUMBER; i++) {
                    message.sendMessage();
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    /*
     * ðËÐÌÞÀÉ ÓÏÝÎÑ     */
    static class MessageReceiver extends Thread {
        private Message message;

        public MessageReceiver(Message message) {
            this.message = message;
        }

        public void run() {
            try {
                for (int i = 0; i < MESSAGE_NUMBER; i++) {
                    message.waitMessage();
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    // ëÓ 'ÍÓÒ, ÓÚÁÝÊ×ËÎÔÕÔÒ ÎÓÏØÏÏßËÏ
    static class Garbage {
        private List list = new LinkedList();

        Garbage() {
            for (int i = 0; i < 5; i++)
                list.add(new byte[1]);
        }
    }

    static List garbageStorage = new ArrayList();

    /*
     * ðËÐÏÏÉÕÝÊÓÏË ÍÓÒ
     */
    static class GarbageProducer extends Thread {

        private volatile boolean stopped;

        public void run() {
            try {
                // ÐÒÏ ÕÁÅÉ ÓÚÁÎÇ ÍÓÒ
                long garbageRemovePeriod = 100;
                long lastGarbageRemoveTime = System.currentTimeMillis();

                // ËÌÞÓ× ÍÓÒ, ÓÚÁÁÍÇ Ú ÏÎ ÉÅÁÉ 
                int garbageAmount = 50000;

                while (!stopped) {
                    for (int i = 0; i < garbageAmount; i++)
                        garbageStorage.add(new Garbage());

                    // ÐÒÏÉÅË ÕÁÑÍÓÚÁÎÊÍÓÒÉÄ£Í×ÚÏÎÓØÓÏÝË ÍÓÒ ÏÉÔÔ ÐÍÔ
                    if (System.currentTimeMillis() > (lastGarbageRemoveTime + garbageRemovePeriod)) {
                        garbageStorage.clear();
                        Thread.sleep(100);
                        lastGarbageRemoveTime = System.currentTimeMillis();
                    }
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        
        public void stopGarbageProducer() {
            stopped = true;
        }
    }

    static List oldGenGarbageStorage = new ArrayList();

    public static void main(String[] args) throws Exception {
        /*
         * úÎÅ ÐÍÔ ÏßËÁÉ ËÔÒÅÎ ÍÇÔÂÔ ÕÁÅÙ× ×ÅÑ         * ÒÂÔ ÐÉÏÅÉ
         */
        long maxMemory = Runtime.getRuntime().maxMemory();
        long targetFreeMem = maxMemory / 2;
        while (Runtime.getRuntime().freeMemory() > targetFreeMem)
            oldGenGarbageStorage.add(new Garbage());

        Message message = new Message();

        GarbageProducer garbageProducer = new GarbageProducer();
        MessageSender messageSender = new MessageSender(message);
        MessageReceiver messageReceiver = new MessageReceiver(message);

        garbageProducer.start();
        messageReceiver.start();
        messageSender.start();

        messageReceiver.join();
        messageSender.join();

        garbageProducer.stopGarbageProducer();
        garbageProducer.join();

        System.out.println("Max pause: " + message.getMaxPause() + "ms");
    }
}


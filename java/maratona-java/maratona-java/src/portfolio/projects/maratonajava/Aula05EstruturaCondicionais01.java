package portfolio.projects.maratonajava;

public class Aula05EstruturaCondicionais01 {
    public static void main(String[] args) {
        int age = 20;
        boolean isAuthorized = age>=21;

        System.out.println("Processing...");

        if (isAuthorized) {
            System.out.println("Authorized!");
        }else {
            System.out.println("Denied.");
        }


        // !
        if (!isAuthorized) {
            System.out.println("Denied.");
        }

    }
}

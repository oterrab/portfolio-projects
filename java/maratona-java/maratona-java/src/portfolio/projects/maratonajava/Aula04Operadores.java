package portfolio.projects.maratonajava;

public class Aula04Operadores {
    public static void main(String[] args) {
        int number01 = 10;
        int number02 = 20;

        double results = 10+20;

        //System.out.println("Results " + number02 + number01); // bizarro, java acha que é concatenação pq tem uma string no sout
        System.out.println("Results " + results);

        // %
        int leftover = 20 % 2;
        System.out.println(leftover);

        // < > <= >= == != -- Restorna valores booleanos
        boolean isTenbiggerthanTwenty = 10 > 20;
        System.out.println("isTenbiggerthanTwenty " + isTenbiggerthanTwenty );

    }
}

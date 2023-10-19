package portfolio.projects.maratonajava;

public class Aula05EstruturaCondicionais03 {
    public static void main(String[] args) {
        double salary =3000;
        String doar = "Pode doar!";
        String ndoar = "Não pode doar";
        // String nomedastring = (condicao) ? verdadeiro : falso;
        String resultado = salary > 5000 ? doar : ndoar;

        // String nomedastring = (condicao) ? verdadeiro : (condicao) ? verdadeiro : falso;
        System.out.println(resultado);
    }
}

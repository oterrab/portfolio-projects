package portfolio.projects.maratonajava;

public class Aula05EstruturaCondicionais02 {
    public static void main(String[] args) {
        int age = 15;
        String league; // inicializando a string

        if(age < 15){
            league = "Categoria Infantil";
        } else if (age >= 15 && age < 18) {
            league = "Categoria Juvenil";
        } else {
            league = "Categoria Adulto";
        }

        // Using ternary
//        league = age < 15 ? "Categoria Infantil":age >= 15 && age < 18 ? "Categoria Juvenil":"Categoria Adulto";
        System.out.println(league);
    }
}

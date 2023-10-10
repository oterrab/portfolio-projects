package portfolio.projects.maratonajava;

public class Aula02TiposPrimitivos {
    public static void main(String[] args) {
        // int, double, flat, char, byte, short, long, boolean
        int age = 34;
        System.out.println(age); // prints 34
        System.out.println("age"); // prints age
        System.out.println("The age is " + age + " years."); // prints "The age is 34 years."

        double incomeDouble = 2000;
        float incomeFloat = 2500;
        byte ageByte = 10; // até 127
        long ageLong = 100000;
        short ageShort = 10; // até 32767

        boolean bTrue = true;
        boolean bFalse = false;

        System.out.println(bTrue);
        System.out.println(bFalse);

        char gender = 'M'; // Character
        //char gender = 77; // ASCII
        //char gender = '\u004D'; // Unicode

        System.out.println("Char na ASCII: " + gender);

        // String não são tipos primitivos no Java.
        String name ="Jiraya";
        System.out.println("My name is " + name);

        // var name2 ="Jiraya"; // Adicionado no Java 10 onde é possível omitir o nome da variável.
    }
}

package portfolio.projects.maratonajava;

import javax.sound.midi.Soundbank;
import java.sql.SQLOutput;

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
        System.out.println("isTenbiggerthanTwenty -> " + isTenbiggerthanTwenty );

        // && (AND) || (OR) ! (NOT)
        int age = 34;
        float salary = 3500F;
        boolean isLaw = age >30 && salary >= 4612;

        System.out.println("isLaw -> " + isLaw);

        // = += -= *= /= %=
        double bonus = 1800;
        bonus += 1000; // bonus = bonus + 1000;
        System.out.println(bonus);

        // ++ --
        int count = 0;
        count++; //count +=1;

        System.out.println(count);

        int count2 =0;
        int count3 =0;
        System.out.println(++count2); // primeiro incrementa e depois executa
        System.out.println(count3++); // primeiro executa e depois incrementa
    }
}

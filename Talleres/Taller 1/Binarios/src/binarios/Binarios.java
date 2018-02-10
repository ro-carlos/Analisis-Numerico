/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package binarios;

/**
 *
 * @author carlos
 */
public class Binarios {

    /**
     * @param args the command line arguments
     */
     private final static int MAX = 15;
     private final static int BASE = 2;
    
    public static void main(String[] args) {
        // TODO code application logic here

        double caso1 = binToDec("1010101");
        double caso2 = binToDec("1011,101");
        double caso3 = binToDec(",1011");
        
        String caso4 = decToBin(3.14);
        String caso5 = decToBin(11.25);
        String caso6 = decToBin(0.666666666666666666666666666666666666666666666666666666666666666667);
        String caso7 = decToBin(30.6);
        String caso8 = decToBin(99.9);

        System.out.println("1010101 a decimal es = " + caso1);
        System.out.println("1011.101 a decimal es =  " + caso2);
        System.out.println(".1011 a decimal es = " + caso3);
        System.out.println("\n\n3.14 a binario = " + caso4);
        System.out.println("11.25 a binario = " + caso5);
        System.out.println("2/3 a binario = " + caso6);
        System.out.println("30.6 a binario = " + caso7);
        System.out.println("99.9 a binario = " + caso8);
    }

    public static double binToDec(String bin) {

        String[] aux;
        String aux2;
        int i;
        double res;
        boolean real;
        real = false;

        aux = bin.split(",");
        res = 0;
        
        for (i = 0; i < aux.length; ++i) {
            char a;
            int tam, pos, j;

            aux2 = aux[i];

            pos = 0;
            tam = aux2.length();

            for (j = 0; j < tam; j++) {
                a = aux2.charAt(j);

                if (a == '1') {
                    if (real) {
                        res += 1 / (Math.pow(BASE, pos+1));
                    } else {
                        res += Math.pow(BASE,(tam-j-1));
                    }
                }
                
                ++pos;
            }
            real = true;
        }
        return res;
    }
    
    public static String decToBin(double dec){
        String res;
        int i, j, entero, residuo;
        double real, producto;
        
        
        entero = (int) dec;
        real = dec - entero;
        res = ""; 

        while(entero!=0){
            residuo = entero % BASE;
            entero /= BASE;
            res += residuo;
        }
        
        if(real!=0){
            res += ",";
            for(i=0; i<MAX; i++){
            
                producto = real * BASE;
                entero = (int) producto;
                //System.out.println("real: " + real + "  prod: "+producto + "  entero: " + entero);
                real = producto - entero;                
                res += entero;                
            }            
        }        
        return res;
    }

}

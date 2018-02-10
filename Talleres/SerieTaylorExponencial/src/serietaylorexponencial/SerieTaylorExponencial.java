/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serietaylorexponencial;

import static java.lang.Math.exp;

/**
 *
 * @author Carlos Rodríguez
 */
public class SerieTaylorExponencial {

    /**
     * @param args the command line arguments
     */
    final static int CIFRAS = 5;
    final static int CENTRO = 0;
    final static double EXP = -5;

    public static void main(String[] args) {
        // TODO code application logic here
        double criterioError, valorReal;

        criterioError = 0.5 * Math.pow(10, (2 - CIFRAS));
        valorReal = Math.exp(EXP);
        calcular(criterioError, valorReal);

    }

    public static void calcular(double criterioError, double valorReal) {

        double aprox, errorRelativo, errorNormalizado, errorAbsoluto;
        int it;
        
        it = 1;
        errorNormalizado = 1000000;
        aprox = 1;

        System.out.println("Iteración\tAprox\t\tEr(%)\t\tEn(%)\t\tEa(%)");
        while (it < 6) { //(errorNormalizado < criterioError)

            errorRelativo = Math.abs((aprox - valorReal)/valorReal)*100;
            errorNormalizado = Math.abs((0)*100);
            errorAbsoluto = Math.abs(aprox - valorReal)*100;

            System.out.format("%d\t\t%.5f\t\t%.5f\t\t%.5f\t\t%.5f\n",
                    it, aprox, errorRelativo, errorNormalizado, errorAbsoluto);
            aprox += (Math.pow(EXP, it)) / fact(it);
            ++it;
        }

    }
    
    public static int fact(int n){
        int res  = 1;
        
        for (int i=1; i<=n; ++i){
            res *= i;
        }
        return res;
    }

}

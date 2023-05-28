using System;
public class Class {
    public static void Main() {
        ulong num = 0uL;
        Console.WriteLine(num);
        ulong num2 = 1uL;
        Console.WriteLine(num2);
        
        while(true) {
            ulong num3 = num + num2;
            if(num3 < num2) {
                Console.WriteLine("Overflowed!");
            }
            
            Console.WriteLine(num3);
            num = num2;
            num2 = num3;
        }
    }
}

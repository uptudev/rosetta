using System;
public class Class {
    public static void Main() {
        ulong a = 0uL;
        Console.WriteLine(a);
        ulong b = 1uL;
        Console.WriteLine(b);
        ulong c = a + b;
        
        do {
            Console.WriteLine(c);
            a = b;
            b = c;
            c = a + b;
        } while (c >= b);

        Console.WriteLine("Overflowed!");
    }
}

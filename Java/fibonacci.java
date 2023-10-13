public class Main {
    public static void main(String[] args) {
        long a = Long.parseUnsignedLong("0");
        System.out.println(a);
        long b = Long.parseUnsignedLong("1");
        System.out.println(b);
        long c = a + b;

        do {
            System.out.println(Long.toUnsignedString(c));
            a = b;
            b = c;
            c = a + b;
        } while (Long.compareUnsigned(c, b) >= 0);

        System.out.println("Overflowed!");
    }
}

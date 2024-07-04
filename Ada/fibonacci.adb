with Ada.Text_IO; use Ada.Text_IO;

procedure Fibonacci is
   type u64 is mod 2**64;
      package u64_io is new Ada.Text_IO.Modular_IO (u64);
      use u64_io;
   a : u64;
   b : u64;
   c : u64;
begin
   a := 0;
   u64_io.put(a);
   New_Line(1);
   b := 1;
   u64_io.put(b);
   New_Line(1);
   while True loop
      c := a + b;
      if  c < a then
         Put_Line("Overflowed!");
         return;
      end if;
      u64_io.put(c);
      New_Line(1);
      a := b;
      b := c;
   end loop;
end Fibonacci;

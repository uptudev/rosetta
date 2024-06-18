with Ada.Text_IO; use Ada.Text_IO;

procedure Fibonacci is
   type u64 is mod 2**64;
      -- having to define a new type for 64-bit unsigned integers is terrible
      -- even worse is having to define a new package for I/O
      package u64_io is new Ada.Text_IO.Modular_IO (u64);
      use u64_io;
      -- like why can't I just use Ada.Text_IO.Modular_IO directly instead of instantiating it?
      -- `use Ada.Text_IO.Modular_IO(u64, a);` doesn't work because Ada is a terrible language.
      -- furthermore, why can't it just be inferred from the type being a modular number?
      -- `Put_Line(a);` (or the equivalent) would work in any other language with integers.
      -- Haskell prints the number because why wouldn't it?
      -- OCaml prints the number because why wouldn't it?
      -- Pascal prints the number because why wouldn't it?
      -- Ada requires you to define a new package for I/O **as a generic**, so why even bother instantiating it?
      -- Ada requires you to use the package, **so why even bother instantiating it?**
      -- Like just make it a function in the standard library, Ada. It's not that hard.
      -- Ada genuinely has the worst I/O system of any language I've ever used tacked onto Pascal syntax like a tumour.
      -- C# is only worse because it's not portable in the slightest and barely works on Linux without eldrich incantations.
      -- C# is only worse because it's a Microsoft product and Microsoft is a cancer on the software industry.
      -- So what is Ada's excuse?

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

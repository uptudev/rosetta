let rec fibonacci a b =
  match Int64.add a b with
  | c when Int64.unsigned_compare c b < 0 ->
      print_endline "Overflowed!"
  | c ->
      Printf.printf "%Lu\n" c;
      fibonacci b c

let () = 
  let a = 0L in
  Printf.printf "%Lu\n" a;
  let b = 1L in
  Printf.printf "%Lu\n" b;
  fibonacci a b;
  exit(0)

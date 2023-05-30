(* declaring recursive function `fibonacci` *)
let rec fibonacci a b =
  (* pattern match based on the sum of a and b, returning the result as `c` *)
  match Int64.add a b with
  (* using unsigned comparison, ensure `c` hasn't overflowed *)
  | c when Int64.unsigned_compare c b < 0 ->
      print_endline "Overflowed!"
  (* else just print c and recurse *)
  | c ->
      Printf.printf "%Lu\n" c;
      fibonacci b c

let () = 
  let a = 0L in
  let b = 1L in
  fibonacci a b

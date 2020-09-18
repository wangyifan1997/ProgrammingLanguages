val a = 10;
(* dynamic: a -> 10 *)

val b = a * 2;
(* dynamic: a -> 10, b -> 20 *)

val a = 5;
(* this is not an assignment, we are not mutating a's value in the last environment
   instead we are just "creating" a new environment *)
(* dynamic: a -> 5, b -> 20 *)

val c = b;
(* dynamic: a -> 5, b -> 20, c -> 20 *)

val d = a;
(* dynamic: a -> 5, b -> 20, c -> 20, d -> 5 *)

val a = a + 1;
(* dynamic: a -> 6, b -> 20, c -> 20, d -> 5 *)

val f = a * 2;
(* dynamic: a -> 6, b -> 20, c -> 20, d -> 5, f -> 12 *)
(* we have an awesome way to make one-of types: *)

datatype my_type = TwoInts of int * int
                 | Str of string
                 | Pizza

(* The environment now has a new type: my_type *)
(* Three constructors are also added to the environment: TwoInts, Str and Pizza *)
(* A constructor is a function that makes values of the new type 
    TwoInts : int * int -> my_type
    Str : string -> my_type
    Pizza : my_type
*)

val a = Str "hi"
val b = Str
val c = Pizza
val d = TwoInts(1 + 2, 4)

(* but given a val, how do we know what type it is and how to access it? *)
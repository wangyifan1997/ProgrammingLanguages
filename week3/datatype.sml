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

(* a multi-branch conditional to pick branch based on variant *)
(* Extracts data and binds to variables local to that branch *)
(* Type-checking: all branches must have same type *)
(* Evaluation: evaluate between case ... of and the correct branch *)

fun f (x: my_type) = 
    case x of
        Pizza => 3
    |   Str s => 8
    |   TwoInts (i1, i2) => i1 + i2

(* You can neither leave out (compile time warning) nor duplicate a case (compile time error) *)

(* we can even use self-reference to make more expressive datatype *)

datatype exp = Constant of int
                |   Negate of exp
                |   Add of exp * exp
                |   Multiply of exp * exp

fun eval e =
    case e of
        Constant i => i
    |   Negate e2 => ~ (eval e2)
    |   Add (e1, e2) => (eval e1) + (eval e2)
    |   Multiply (e1, e2) => (eval e1) * (eval e2)

(* write a function called max_constant that finds the maximum constant in an exp *)
fun max_constant e =
    case e of
        Constant i => i
    |   Negate e2 => max_constant e2
    |   Add(e1, e2) => Int.max(max_constant e1, max_constant e2)
    |   Multiply(e1, e2) => Int.max(max_constant e1, max_constant e2)


(* recursive data types *)
datatype my_int_list = Empty
                    |   Cons of int * my_int_list

val x = Cons(4, Cons(23, Cons(2008, Empty)))

fun append_my_list (xs, ys) =
    case xs of
        Empty => ys
    |   Cons(x, xs') => Cons(x, append_my_list(xs', ys))

(* actually Options are just a predefined datatype binding *)
(* NONE and SOME are constructors, not just functions *)

fun inc_or_zero int_option = 
    case int_option of
        NONE => 0
    |   SOME i => i + 1

(* Lists are datatypes, [] and :: are constructors too *)

fun sum_list xs =
    case xs of
        [] => 0
    |   x :: xs' => x + sum_list xs'

fun append_list (xs, ys) =
    case xs of
        [] => ys
    |   x :: xs' => x :: append_list(xs', ys)

(* pattern matching can actually be applied to tuples *)

(* extracting the value of the tuple to x, y, and z *)
fun sum_triple_1 triple = 
    case triple of
        (x, y, z) => x + y + z 

(* we can also use val pattern = expression to extract data from bindings *)
(* semantically identical to one-branch case expressions *)

fun sum_triple_2 triple =
    let
      val (x, y, z) = triple
    in
      x + y + z
    end

(* A function argument can also be a pattern *)
(* fun f p = e *)

fun sum_triple_3 (x, y, z) =
    x + y + z

(* actually, all functions in ML takes only one argument. what we call multi-argument 
    functions are just functions taking one tuple argument, implemented with a tuple 
    pattern in the function binding *)
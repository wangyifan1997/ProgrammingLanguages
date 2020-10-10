(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

(* 1 *)
fun only_capitals(xs: string list) =
    List.filter (fn x => Char.isUpper(String.sub(x, 0))) xs

(* 2 *)
fun longest_string1(xs: string list) = 
    List.foldl (fn (x, longest) => if String.size(x) > String.size(longest) then x else longest) "" xs

(* 3 *)
fun longest_string2(xs: string list) =
    List.foldl (fn (x, longest) => if String.size(x) >= String.size(longest) then x else longest) "" xs

(* 4 *)
fun longest_string_helper(f) = List.foldl (fn (x, longest) => if f(x, longest) then x else longest) ""

val longest_string3 = longest_string_helper(fn (x, y) => x > y)

val longest_string4 = longest_string_helper(fn (x, y) => x >= y)

(* 5 *)
fun longest_capitalized(xs: string list) = longest_string1 o only_capitals

(* 6 *)
fun rev_string(x: string) = String.implode o rev o String.explode




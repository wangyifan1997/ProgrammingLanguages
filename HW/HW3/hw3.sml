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

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

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
fun longest_string_helper(f) = List.foldl (fn (x, longest) => if f((String.size x), (String.size longest)) then x else longest) ""

val longest_string3 = longest_string_helper(fn (x, y) => x > y)

val longest_string4 = longest_string_helper(fn (x, y) => x >= y)

(* 5 *)
fun longest_capitalized (xs: string list) = (longest_string1 o only_capitals) xs

(* 6 *)
fun rev_string (x: string) = (String.implode o List.rev o String.explode) x

(* 7 *)
fun first_answer(f: ('a -> 'b option)) =
    let 
        fun helper xs =
            case xs of
                [] => raise NoAnswer
            |   x :: xs' =>
                    case f x of
                        SOME v => v
                    |   NONE => helper(xs')
    in
        helper
    end     

(* 8 *)
fun all_answers f =
    let
        fun helper (xs, acc) =
            case xs of
                [] => acc
            |   x :: xs' => 
                case f x of
                    SOME lst => helper(xs', lst @ acc)
                |   _ => helper(xs', acc)
    in
        fn xs =>
            if List.all (fn a => case f a of SOME lst => true | NONE => false) xs
            then SOME (helper(xs, []))
            else NONE
    end

(* 9 *)
fun count_wildcards (p: pattern) = g (fn () => 1) (fn x => 0) p

fun count_wild_and_variable_lengths (p: pattern) = g (fn () => 1) (fn x => String.size x) p

fun count_some_var (x: string, p: pattern) = g (fn () => 0) (fn s => if s = x then 1 else 0) p

(* 10 *)
fun check_pat (p: pattern) =
    let
        fun all_strings (p: pattern) =
            case p of
                Wildcard => []
            |   Variable x => [x]    
            |   TupleP ps => (List.foldl (fn (p', rtn) => (all_strings p') @ rtn) [] ps)
            |   ConstructorP(_, p) => all_strings(p)
            |   _ => []
        fun all_unique (xs: string list) =
            case xs of
                [] => true
            |   x :: xs' => 
                    if List.exists (fn x' => (x' = x)) xs'
                    then false
                    else all_unique(xs')
    in
        (all_unique o all_strings) p
    end

(* 11 *)
fun match (v: valu, p: pattern) = 
    case (v, p) of
        (_, Wildcard) => SOME []
    |   (_, Variable s) => SOME [(s, v)]
    |   (Unit, UnitP) => SOME []
    |   (Const a, ConstP b) => if a = b then SOME [] else NONE
    |   (Tuple vs, TupleP ps) => 
            if (List.length vs) = (List.length ps)
            then all_answers (fn (v', p') => match (v', p')) (ListPair.zip (vs, ps))
            else NONE
    |   (Constructor(s2, v), ConstructorP(s1, p)) => if s1 = s2 then match(v, p) else NONE
    |   _ => NONE

(* 12 *)
fun first_match (v: valu) =
    fn ps =>
        SOME (first_answer (fn p => match (v, p)) ps)
        handle NoAnswer => NONE 
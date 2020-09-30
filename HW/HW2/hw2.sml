(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* 1a *)
fun all_except_option (x: string, xs: string list) =
    case xs of
        [] => NONE
    |   y :: ys => 
            case all_except_option(x, ys) of
                NONE => if same_string(x, y) then SOME ys else SOME (x :: ys)
            |   SOME lst => SOME (x :: lst)

(* 1b *)
fun get_substitutions1 (xs: string list list, x: string) =
    case xs of
        [] => []
    |   y :: ys =>  
            case all_except_option(x, y) of
                NONE => get_substitutions1(ys, x)
            |   SOME lst => lst @ get_substitutions1(ys, x)

(* 1c *)
fun get_substitutions2 (xs: string list list, x: string) =
    let
        fun helper(xs: string list list, x: string, acc: string list) =
            case xs of
                [] => []
            |   y :: ys =>
                    case all_except_option(x, y) of
                        NONE => helper(ys, x, acc)
                    |   SOME lst => helper(ys, x, lst @ acc)
    in
        helper(xs, x, [])
    end

(* 1d *)
fun similar_names(xs: string list list, name: {first: string, middle: string, last: string}) =
    let
        fun map_to_fullname(xs: string list, name: {first: string, middle: string, last: string}) =
            case xs of
                [] => []
            |   y :: ys => 
                    case name of
                        {first = f', middle = m, last = l} => {first = y, middle = m, last = l} :: (map_to_fullname(ys, name))
    in
        case name of
            {first = f, middle = m', last = l'} =>
                name :: (map_to_fullname (get_substitutions2(xs, f), name))
    end


(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

(* 2a *)

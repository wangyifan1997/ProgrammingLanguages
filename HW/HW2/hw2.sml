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
                NONE => if same_string(x, y) then SOME ys else NONE
            |   SOME lst => SOME (y :: lst)

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
                [] => acc
            |   y :: ys =>
                    case all_except_option(x, y) of
                        NONE => helper(ys, x, acc)
                    |   SOME lst => helper(ys, x, (acc @ lst))
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
                        {first = _, middle = m, last = l} => {first = y, middle = m, last = l} :: (map_to_fullname(ys, name))
    in
        case name of
            {first = f, middle = _, last = _} =>
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
fun card_color(cd: card) =
    case cd of
        (Clubs, _) => Black
    |   (Spades, _) => Black
    |   _ => Red

 (* 2b *)
 fun card_value(cd: card) =
    case cd of
        (_, Num x) => x
    |   (_, Ace) => 11
    |   _ => 10

(* 2c *)
fun remove_card(cs: card list, c: card, e: exn) =
    let
        fun remove_card_helper(cs: card list, c: card, e: exn, removed: bool) =
            case cs of
                [] => if removed then [] else raise e
            |   y :: ys => if y = c andalso not removed
                            then remove_card_helper(ys, c, e, true)
                            else y :: remove_card_helper(ys, c, e, removed)
    in
        remove_card_helper(cs, c, e, false)
    end

(* 2d *)
(* assume vacuously true when there is no card *)
fun all_same_color(cs: card list) =
    case cs of
        [] => true
    |   x :: [] => true
    |   x :: (y :: zs) => card_color(x) = card_color(y) andalso all_same_color(y :: zs)

(* 2e *)
fun sum_cards(cs: card list) =
    let
        fun sum_cards_helper(cs: card list, sum: int) =
            case cs of
                [] => sum
            |   y :: ys => sum_cards_helper(ys, sum + card_value(y))
    in
        sum_cards_helper(cs, 0)
    end

(* 2f *)
fun score(cs: card list, goal: int) = 
    let
        val sum = sum_cards(cs)
        val same_color = all_same_color(cs)
    in
        if sum > goal
        then
            if same_color then 3 * (sum - goal) div 2 else 3 * (sum - goal)
        else
            if same_color then (goal - sum) div 2 else (goal - sum)
    end 

(* 2g *)
fun officiate(cs: card list, ms: move list, goal: int) =
    let
        fun game_state_helper(hd: card list, cs: card list, ms: move list, goal: int) =
            case ms of
                [] => score(hd, goal)
            |   x :: xs =>
                    case x of
                        Discard c => game_state_helper(remove_card(hd, c, IllegalMove), cs, xs, goal)
                    |   Draw => 
                            case cs of
                                [] => score(hd, goal)
                            |   y :: ys =>
                                    if sum_cards(y :: hd) > goal
                                    then score(y :: hd, goal)
                                    else game_state_helper(y :: hd, ys, xs, goal)       
    in
        game_state_helper([], cs, ms, goal)
    end
                
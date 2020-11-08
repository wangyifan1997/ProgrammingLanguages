fun swap(pr: int * bool) =
    (#2 pr, #1 pr)

fun sum_pairs(pr1: int * int, pr2: int * int) =
    (#1 pr1 + #1 pr2, #2 pr1 + #2 pr2)

fun div_mod(x: int, y: int) = 
    (x div y, x mod y)

fun sort_pair(pr: int * int) =
    if (#1 pr < #2 pr)
    then pr
    else (#2 pr, #1 pr)

val x = (4, 1)
val sorted_pr = sort_pair x

(* actually you can have tuples with more than two parts *)
val long_tuple = (1, true, 2, false)

(* tuples can be nested *)
val nested_tuple = (1, (2, false)) (* int * (int * bool) *)

val first_of_second = #1 (#2 nested_tuple) (* bool *)
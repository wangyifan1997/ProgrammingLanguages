fun sum_list (xs: int list) = 
    if null xs
    then 0
    else hd xs + sum_list(tl xs)

fun prod_list (xs: int list) = 
    if null xs
    then 1
    else hd xs * prod_list(tl xs)

fun countdown (start: int) = 
    if start = 0
    then []
    else start::countdown(start - 1)

fun append(xs: int list, ys: int list) = 
    if null xs
    then ys
    else hd xs :: append(tl xs, ys)

fun sum_pair_list (xs: (int * int) list) = 
    if null xs
    then 0
    else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs)

fun firsts (xs: (int * int) list) =
    if null xs
    then []
    else #1 (hd xs):: firsts(tl xs)

fun seconds (xs: (int * int) list) =
    if null xs
    then []
    else #2 (hd xs):: seconds(tl xs)

fun sum_pair_list2 (xs: (int * int) list) = 
    (sum_list (firsts xs)) + (sum_list (seconds xs))
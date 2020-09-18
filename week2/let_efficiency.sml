(* Suppose we have a incrementing list such as [1, 2, 3...30], then
    bad_max([1...30]) is going to call bad_max([2...30]) twice, and each
    bad_max([2...30]) would call bad_max([3...30]) twice... Exponential!*)

(* one bad thing about this algo is that it returns 0 for empty list*)
fun bad_max(xs:int list)=
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else if hd xs > bad_max(tl xs)
    then hd xs
    else bad_max(tl xs)

fun good_max(xs:int list)=
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else
        let
          val max = good_max(tl xs)
          val head = hd xs
        in
          if head > max
          then head
          else max
        end
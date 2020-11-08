(* one bad thing about this algo is that it returns 0 for empty list*)
fun not_so_good_max(xs:int list)=
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else
        let
          val max = not_so_good_max(tl xs)
          val head = hd xs
        in
          if head > max
          then head
          else max
        end

(* good_max: int list -> int option*)
fun good_max(xs:int list)=
    if null xs
    then NONE
    else
        let
          val max=good_max(tl xs)
          val head=hd xs
        in
          if isSome max andalso valOf max>head
          then max
          else SOME head
        end

fun best_max(xs:int list)=
    if null xs
    then NONE
    else
        let
          fun max_nonempty(xs:int list)=
            if null (tl xs)
            then hd xs
            else
                let
                  val max = max_nonempty(tl xs)
                  val head = hd xs
                in
                  if max>head
                  then max
                  else head
                end  
        in
          SOME (max_nonempty(xs))
        end
(* 
fun count_from_1(to:int)= 
    let
      fun count_from_to(from:int,to:int)= 
        if from=to
        then to::[]
        else from::count_from_to(from+1,to)
    in
      count_from_to(1,to)
    end
    *)

(* since the helper function in "let" has access to its outer environment
    we can make it more concise by discard the "to" param of count_from_to*)
fun count_from_1(to:int)= 
    let
      fun count_from_to(from:int)= 
        if from=to
        then to::[]
        else from::count_from_to(from+1)
    in
      count_from_to(1)
    end
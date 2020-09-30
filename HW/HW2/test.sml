fun same_string(s1 : string, s2 : string) =
    s1 = s2

fun all_except_option (x: string, xs: string list) =
    let
        fun contains_x (x: string, xs: string list) =
            case xs of
                [] => NONE
            |   y :: ys =>
                    let
                        val res = contains_x(x, ys)
                    in 
                        case res of
                            NONE => if same_string(x, y) then SOME true else NONE
                        |   SOME x' => SOME true
                    end
        val is_in_lst = contains_x(x, xs)
        fun helper(x: string, xs: string list) =
            case xs of
                [] => []
            |   y :: ys => if same_string(x, y) then helper(x, ys) else x :: helper(x, ys)
    in
        case is_in_lst of
            NONE => NONE
        |   SOME bool' => SOME (helper(x, xs))  
    end 
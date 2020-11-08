(* empty list has type of 'a list, which means any list,
   so we can :: anything onto it *)
val l1 = []

val l2 = [1, 2, 3]

val l3 = [(1 + 2), 3, 5]

val l4 = [true, true, false, true]

val l5 = [(1, 3), (2, 2), (3, 5)]

val l6 = 4::l2

(* attention, you cannot do l2::l3, because you are appending a list (as an element) 
    to a list of ints*)


(* null : a' list -> bool *)
val is_l1_empty = null l1

val is_l2_empty = null l2

(* hd : a' list -> a' *)
val one = hd l2

(* tl : a' list -> a' list *)
val two = hd (tl l2)

val three = hd (tl (tl l2))

val empty_list = tl (tl (tl l2))

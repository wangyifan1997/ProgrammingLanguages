(* "andalso" and "orelse"*)

(* short-circuiting evaluation rule means that "andalso" and "orelse" are 
    not functions. but "not" is a pre-defined function *)


(* use "if then else" to implement "andalso", "orelse" and "not" *)

(*
if e1
then e2
else false
*)

(*
if e1
then true
else e2
*)

(*
if e
then not e
else e
*)

(* for comparing int values, use = <> < > <= >=*)
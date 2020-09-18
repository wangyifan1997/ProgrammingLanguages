(* This is a comment *)

(* We don't have anything yet *)

val x = 34; 
(* static environment: x --> int *)
(* dynamic environment: x --> 34 *)

val y = 17;
(* static environment: x --> int, y --> int *)
(* dynamic environment: x --> 34, y --> 17 *)

(* You can use earlier bindings, but not late bindings *)
val z = (x + y) + (y + 2);
(* static environment: x --> int, y --> int, z --> int*)
(* dynamic environment: x --> 34, y --> 17, z --> 70 *)

(* First do type check, if it passes, then evaluate *)

val abs_of_z = if z < 0 then 0 - z else z;
(* static environment: ..., abs_of_z --> int *)
(* dynamic environment: ..., abs_of_z --> 70 *)

val abs_of_z_simple = abs z;
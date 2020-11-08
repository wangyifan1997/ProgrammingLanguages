(* to form a record, use the {} notation *)
val myself = {name: "Eric", age: 23}
(* myself now have type {name: string, age: int} *)


(* to retrieve element from a record, use #key *)
val my_name = #name myself

val my_age = #age myself

(* trying to retrieve a key that does not exist will lead to a type check error *)

(* actually, tuple is a syntactic sugar of records *)

val record_as_tuple = {1: "tony", 2: "eric"}

(* this "becomes" a tuple when being evaluated. 
actually, tuples are essentially records with keys being
consecutive integers starting from one. You can make a 
tuple using the notation above, but this is very bad style *)
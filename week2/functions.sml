fun pow(x: int, y: int) =
    if y=0
    then 1
    else x * pow(x, y-1)

fun cube(x: int) = 
    pow(x, 3)

val sixtyfour = cube(4)

(* you can call function with out parens if it only takes one param *)
val also_sixtyfour = cube 4

(* does not matter if there is space between func name and parens *)
val still_sixtyfour = cube (4)

(* you can even do this *)
val x = (2, 3)
val gotcha = pow x

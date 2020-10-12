use "hw3.sml";

val test1_1 = only_capitals([]) = []

val test1_2 = only_capitals(["Abc", "bbc"]) = ["Abc"]

val test1_3 = only_capitals(["abc", "bbc", "cbc"]) = []

val test1_4 = only_capitals(["Abc", "Bbc", "CBC"]) = ["Abc", "Bbc", "CBC"]

val test2_1 = longest_string1([]) = ""

val test2_2 = longest_string1(["a", "bcbbsb", "sasas"]) = "bcbbsb"

val test2_3 = longest_string1(["abc", "bbc", "sa", "ddd", "a"]) = "abc"

val test3_1 = longest_string2([]) = ""

val test3_2 = longest_string2(["a", "bcbbsb", "sasas"]) = "bcbbsb"

val test3_3 = longest_string2(["abc", "bbc", "sa", "ddd", "a"]) = "ddd"

val test4_1 = longest_string3(["abc", "bbc", "sa", "ddd", "a"]) = "abc"

val test4_2 = longest_string4(["abc", "bbc", "sa", "ddd", "a"]) = "ddd"

val test5_1 = longest_capitalized(["Ab", "abcc", "Cba", "Dba"]) = "Cba"

val test5_2 = longest_capitalized(["a", "ab", "abc"]) = ""

val test6_1 = (rev_string "") = ""

val test6_2 = (rev_string "abc") = "cba"

fun num_greater_than3 x = if x > 3 then SOME x else NONE

val test7_1 = first_answer (num_greater_than3) [1, 4, 3, 5, 2] = 4

val test7_2 = first_answer (num_greater_than3) [1, 2, 3, 4] = 4

val test10_1 = check_pat (TupleP[Variable "x",Variable "x"]) = false

val test10_2 = check_pat (TupleP[ConstP 17,Wildcard,ConstP 4,ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstructorP ("egg",ConstP 4))]) = true

val test10_3 = check_pat (TupleP[TupleP[TupleP[Variable "x",ConstructorP ("wild",Wildcard)],Wildcard],Variable "x"]) = false

val test11_1 = match (Const 17, Variable "abc") = SOME [("abc", Const 17)]

val test11_2 = match (Tuple[Const 17,Unit,Const 4,Constructor ("egg",Const 4),Constructor ("egg",Constructor ("egg",Const 4))], Variable "abc")
             = SOME [("abc", Tuple[Const 17,Unit,Const 4,Constructor ("egg",Const 4),Constructor ("egg",Constructor ("egg",Const 4))])]

val test11_3 = match (Tuple[Const 15, Constructor ("egg", Const 4)], TupleP[Variable "abc", ConstructorP("egg", ConstP 4)]) = SOME[("abc", Const 15)]

val test11_4 = match ((Tuple[Const 15, Constructor ("egg", Const 4)], TupleP[ConstP 12, ConstructorP("egg", ConstP 4)])) = NONE

val test11_5 = match (Tuple[Const 15, Constructor ("egg", Const 4)], TupleP[ConstP 15, ConstructorP("egg", ConstP 4)]) = SOME[]

val test11_6 = match (Tuple[Const 15, Constructor ("egg", Tuple[Const 15, Constructor ("egg", Const 4)])], TupleP[ConstP 15, ConstructorP("egg", TupleP[Variable "abc", ConstructorP("egg", ConstP 4)])]) = SOME [("abc", Const 15)] 

val test12_1 = first_match (Const 17) [Wildcard,ConstP 17] = SOME []

val test12_2 = first_match (Const 17) [ConstP 17,Wildcard] = SOME []

val test12_3 = first_match (Constructor ("egg",Const 4)) [ConstructorP ("egg",ConstP 4)] = SOME []

val test12_4 = first_match (Tuple[Const 17,Unit,Const 4,Constructor ("egg",Const 4),Constructor ("egg",Constructor ("egg",Const 4)),Tuple[Const 17,Unit,Const 4,Constructor ("egg",Const 4),Constructor ("egg",Constructor ("egg",Const 4))],Tuple[Unit,Unit],Tuple[Const 17,Const 4],Tuple[Constructor ("egg",Const 4),Constructor ("egg",Const 4)]]) [ConstP 17,ConstP 4,ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstructorP ("egg",ConstP 4)),TupleP[ConstP 17,Wildcard,ConstP 4,ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstructorP ("egg",ConstP 4))],TupleP[Wildcard,Wildcard],TupleP[ConstP 17,ConstP 4],TupleP[ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstP 4)],TupleP[ConstP 17,Wildcard,ConstP 4,ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstructorP ("egg",ConstP 4)),TupleP[ConstP 17,Wildcard,ConstP 4,ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstructorP ("egg",ConstP 4))],TupleP[Wildcard,Wildcard],TupleP[ConstP 17,ConstP 4],TupleP[ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstP 4)]]] = SOME []

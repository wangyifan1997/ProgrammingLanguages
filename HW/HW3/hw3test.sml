use "hw3.sml";

val test1_1 = only_capitals([]) = []

val test1_2 = only_capitals(["Abc", "bbc"]) = ["Abc"]

val test1_3 = only_capitals(["abc", "bbc", "cbc"]) = []

val test1_4 = only_capitals(["Abc", "Bbc", "CBC"]) = ["Abc", "Bbc", "CBC"]

val test2_1 = longest_string1([]) = ""

val test2_2 = longest_string1(["a", "bcbbsb", "sasas"]) = "bcbbsb"

val test2_3 = longest_string1(["abc", "bbc", "sa", "ddd", "a"]) = "abc"
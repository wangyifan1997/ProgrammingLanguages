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
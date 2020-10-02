use "hw2.sml";

val test1a_1 = all_except_option("abc", []) = NONE

val test1a_2 = all_except_option("abc", ["abc"]) = SOME []

val test1a_3 = all_except_option("abc", ["abc", "bcd"]) = SOME ["bcd"]

val test1a_4 = all_except_option("abc", ["c", "abc", "d"]) = SOME ["c", "d"]

val test1b_1 = get_substitutions1([["Fred", "Fredrick"], ["Elizabeth", "Betty"], ["Freddie", "Fred", "F"]], "Fred") =  ["Fredrick", "Freddie", "F"]

val test1b_2 = get_substitutions1([["Fred", "Fredrick"], ["Jeff", "Jeffrey"], ["Geoff", "Jeff", "Jeffrey"]], "Jeff") = ["Jeffrey", "Geoff", "Jeffrey"]

val test1c_1 = get_substitutions2([["Fred", "Fredrick"], ["Elizabeth", "Betty"], ["Freddie", "Fred", "F"]], "Fred") =  ["Fredrick", "Freddie", "F"]

val test1c_2 = get_substitutions2([["Fred", "Fredrick"], ["Jeff", "Jeffrey"], ["Geoff", "Jeff", "Jeffrey"]], "Jeff") = ["Jeffrey", "Geoff", "Jeffrey"]

val test1d_1 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],{first="Fred", middle="W", last="Smith"}) 
= [{first="Fred", last="Smith", middle="W"},
{first="Fredrick", last="Smith", middle="W"},
{first="Freddie", last="Smith", middle="W"},
{first="F", last="Smith", middle="W"}]
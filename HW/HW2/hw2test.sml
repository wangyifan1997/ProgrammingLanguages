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

val card1 = (Clubs, Jack)

val card2 = (Diamonds, Num 8)

val card3 = (Hearts, Ace)

val test2a_1 = card_color(card1) = Black

val test2a_2 = card_color(card2) = Red

val test2a_3 = card_color(card3) = Red

val test2b_1 = card_value(card1) = 10

val test2b_2 = card_value(card2) = 8

val test2b_3 = card_value(card3) = 11

val test2c_1 = remove_card([card3, card2, card1], card2, IllegalMove) = [card3, card1]

val test2c_2 = remove_card([card3, card3, card1], card3, IllegalMove) = [card3, card1]

val test2d_1 = all_same_color([]) = true

val test2d_2 = all_same_color([card1]) = true

val test2d_3 = all_same_color([card2, card3]) = true

val test2d_4 = all_same_color([card1, card2]) = false

val test2d_5 = all_same_color([card1, card1, card2]) = false

val test2d_6 = all_same_color([card2, card3, card2]) = true
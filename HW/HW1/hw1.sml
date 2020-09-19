(* #1 *)
fun is_older(date1: int*int*int, date2: int*int*int) =
    if #1 date1 < #1 date2
    then true
    else if #1 date1 > #1 date2
    then false
    else
        if #2 date1 < #2 date2
        then true
        else if #2 date1 > #2 date2
        then false
        else
            if #3 date1 < #3 date2
            then true
            else false

(* #2 *)
fun number_in_month(dates: (int*int*int) list, month: int) =
    if null dates
    then 0
    else
        if #2 (hd dates) = month
        then 1 + number_in_month(tl dates, month)
        else number_in_month(tl dates, month)

(* #3 *)
fun number_in_months(dates: (int*int*int) list, months: int list) =
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

(* #4 *)
fun dates_in_month(dates: (int*int*int) list, month: int) =
    if null dates
    then []
    else
        if #2 (hd dates) = month
        then (hd dates) :: dates_in_month(tl dates, month)
        else dates_in_month(tl dates, month)

(* #5 *)
fun dates_in_months(dates: (int*int*int) list, months: int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

(* #6 *)
fun get_nth(strings: string list, n: int) =
    if n = 1
    then hd strings
    else get_nth(tl strings, n - 1)

(* #7 *)
fun date_to_string(date: int*int*int) =
    let
      val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
      get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end

(* #8 *)
fun number_before_reaching_sum(sum: int, nums: int list) =
    if hd nums >= sum
    then 0
    else 1 + number_before_reaching_sum(sum - hd nums, tl nums)


(* #9 *)
fun what_month(day: int) =
    let
      val months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
      1 + number_before_reaching_sum(day, months)
    end

(* #10 *)
fun month_range(day1: int, day2: int) = 
	if day1 > day2
	then []
	else what_month(day1) :: month_range(day1 + 1, day2)

(* #11 *)
fun oldest(dates: (int*int*int) list) = 
	if null dates
	then NONE
	else
		let
		  val old = oldest(tl dates)
		  val curr = hd dates
		in
		  if isSome old andalso is_older(valOf old, curr)
		  then old
		  else SOME curr
		end

(* #12 assume months are sorted *)
fun remove_duplicates(xs: int list) = 
	if null xs
	then []
	else
		let
			val res = remove_duplicates(tl xs)
			val curr = hd xs
			val next = hd res
		in
		  	if null res orelse curr <> next
			then curr :: res
			else res
		end

fun number_in_months_challenge(dates: (int*int*int) list, months: int list) =
	number_in_months(dates, remove_duplicates(months))

fun dates_in_months_challenge(dates: (int*int*int) list, months: int list) = 
	dates_in_months(dates, remove_duplicates(months))

(* #13 *)
fun reasonable_date(date: int*int*int) =
	let
		val year = #1 date
		val month = #2 date
		val day = #3 date

		fun is_leap_year() =
			year mod 400 = 0 orelse (year mod 4 = 0 andalso year mod 100 <> 0)
		
		val leap_year_days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
		val non_leap_year_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
		fun get_nth_month(n: int, months: int list) = 
			if n = 1
    		then hd months
    		else get_nth_month(n - 1, tl months)
	in
		if year <= 0
	  	then false
	  	else
		  	if month > 12 orelse month < 1
			then false
			else
				if is_leap_year()
				then day <= get_nth_month(month, leap_year_days) andalso day > 0
				else day <= get_nth_month(month, non_leap_year_days) andalso day > 0
	end

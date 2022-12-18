year = int(input("Year: "))
month = int(input("Month: "))

if month in [1, 3, 5, 7, 8, 10, 12]:
    msg = "31"
elif month in [4, 6, 9, 11]:
    msg = "30"
elif month == 2:
    isLeapYear = year % 4 == 0 and year % 100 != 0 or year % 400 == 0
    msg = "29" if isLeapYear else "28"
else:
    msg = "Invalid month number"

print(msg)
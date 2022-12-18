month = int(input("Enter the month number: "))
match month:
    case 1:
        msg = "January"
    case 2:
        msg = "February"
    case 3:
        msg = "March"
    case 4:
        msg = "April"
    case 5:
        msg = "May"
    case 6:
        msg = "June"
    case 7:
        msg = "July"
    case 8:
        msg = "August"
    case 9:
        msg = "September"
    case 10:
        msg = "October"
    case 11:
        msg = "November"
    case 12:
        msg = "December"
    case _:
        msg = "Invalid month number"

print(msg)

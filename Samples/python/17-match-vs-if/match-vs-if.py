import random

random = random.Random()

rankID = random.randint(1, 13)
match rankID:
    case 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10:
        rank = f"{rankID}"
    case 1:
        rank = "Ace"
    case 11:
        rank = "Jack"
    case 12:
        rank = "King"
    case 13:
        rank = "Queen"

suitID = random.randint(1, 4)
if suitID == 1:
    suit = "club"
elif suitID == 2:
    suit = "diamonds"
elif suitID == 3:
    suit = "hearts"
elif suitID == 4:
    suit = "spades"

print(f'You have selected "{rank} of {suit}".')
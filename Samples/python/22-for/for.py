from random import Random

MIN_TEST_VALUE = 0
MAX_TEST_VALUE = 10

test_count = int(input("Enter the number of tests: "))

correct_answer_count = 0
incorrect_answer_count = 0

rand = Random()
for i in range(test_count):
    num1 = rand.randint(MIN_TEST_VALUE, MAX_TEST_VALUE)
    num2 = rand.randint(MIN_TEST_VALUE, MAX_TEST_VALUE)
    print(f"{num1} + {num2} = ", end="")
    answer = int(input())
    if num1 + num2 == answer:
        correct_answer_count += 1
    else:
        incorrect_answer_count += 1

print(f"Correct answers: {correct_answer_count}")
print(f"Incorrect answers: {incorrect_answer_count}")

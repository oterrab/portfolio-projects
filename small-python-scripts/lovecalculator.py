print("Welcome to the Love Calculator!")
name1 = input("What is your name? \n")
name2 = input("What is their name? \n")

name1_lower_case = name1.lower()
name2_lower_case = name2.lower()

name1_true = name1_lower_case.count("t") + name1_lower_case.count("r") + name1_lower_case.count("u") + name1_lower_case.count("e")

name1_love = name1_lower_case.count("l") + name1_lower_case.count("o") + name1_lower_case.count("v") + name1_lower_case.count("e")

name2_true = name2_lower_case.count("t") + name2_lower_case.count("r") + name2_lower_case.count("u") + name2_lower_case.count("e")

name2_love = name2_lower_case.count("l") + name2_lower_case.count("o") + name2_lower_case.count("v") + name2_lower_case.count("e")

true_score = name1_true + name2_true
love_score = name1_love + name2_love

final_score = 0
final_score = int(str(true_score) + str(love_score))
## int('{}{}'.format(a, b))

if final_score < 10 or final_score > 90:
    print(f"Your score is {final_score}, you go together like coke and mentos.")
elif final_score >= 40 and final_score <= 50:
    print(f"Your score is {final_score}, you are alright together.")
else:
    print(f"Your score is {final_score}.")

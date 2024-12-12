from python import Python, PythonObject

var EASY_LEVEL_TURNS: PythonObject = 10
var HARD_LEVEL_TURNS: PythonObject = 5

def main():

    game()

def check_answer(guess: PythonObject, answer: PythonObject, turns: PythonObject) -> PythonObject:
    if guess > answer:
        print("Too high.")
        return turns - 1
    elif guess < answer:
        print("Too low.")
        return turns - 1
    else:
        print("You got it! The answer was:", answer)
        return

def set_difficulty() -> PythonObject:
    level = input("Choose a difficulty. Type 'easy' or 'hard': ")
    if level == "easy":
        return EASY_LEVEL_TURNS
    else:
        return HARD_LEVEL_TURNS

def game():
    random = Python.import_module("random")
    print("Welcome to the Number Guessing Game!")
    print("I'm thinking of a number between 1 and 100.")
    answer = random.randint(1, 100)
    print("Pssst, the correct answer is:", answer) 

    turns = set_difficulty()
    guess = 0
    while guess != answer:
        print("You have", turns, "attempts remaining to guess the number.")

        guess = int(input("Make a guess: "))

        turns = check_answer(guess, answer, turns)
        if turns == 0:
            print("You've run out of guesses, you lose.")
            return
        elif guess != answer:
            print("Guess again.")


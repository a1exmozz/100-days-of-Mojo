from python import Python, PythonObject

def main():
    var stages: PythonObject = ['\n  +---+\n  |   |\n  O   |\n /|\\  |\n / \\  |\n      |\n=========\n', 
        '\n  +---+\n  |   |\n  O   |\n /|\\  |\n /    |\n      |\n=========\n', 
        '\n  +---+\n  |   |\n  O   |\n /|\\  |\n      |\n      |\n=========\n', 
        '\n  +---+\n  |   |\n  O   |\n /|   |\n      |\n      |\n=========\n', 
        '\n  +---+\n  |   |\n  O   |\n  |   |\n      |\n      |\n=========\n', 
        '\n  +---+\n  |   |\n  O   |\n      |\n      |\n      |\n=========\n', 
        '\n  +---+\n  |   |\n      |\n      |\n      |\n      |\n=========\n']

    var logo: PythonObject = '''\n _                                             \n| |                                            \n| |__   __ _ _ __   __ _ _ __ ___   __ _ _ __  \n| \'_ \\ / _` | \'_ \\ / _` | \'_ ` _ \\ / _` | \'_ \\ \n| | | | (_| | | | | (_| | | | | | | (_| | | | |\n|_| |_|\\__,_|_| |_|\\__, |_| |_| |_|\\__,_|_| |_|\n                    __/ |                      \n                   |___/    '''


    var chosen_word: PythonObject = "tester"
    var chosen_word_length: PythonObject = len(chosen_word)

    end_of_game = False
    lives = 6

    print(logo)

    print("Pssst, the solution is:", chosen_word)

    var display: PythonObject = []
    var underscore_string: PythonObject = "_"

    for _ in chosen_word:
        display.append(underscore_string)

    while not end_of_game:
        var guess: PythonObject = input("Guess a letter: ").lower()

        if guess in display:
            print("You've already guessed:", guess)

        n = 0
        while n < chosen_word_length:
            letter = chosen_word[n]
            if letter == guess:
                display[n] = letter
            n += 1

        if guess not in chosen_word:
            print(guess + " is not in the word")
            lives -= 1
            if lives == 0:
                end_of_game = True
                print("You lose.")

        var joined_display: PythonObject = " ".join(display)

        print(joined_display)

        if "_" not in display:
            end_of_game = True
            print("You win.")

        print(stages[lives])
from python import Python, PythonObject

def main():
    while input("Do you want to play a game of Blackjack? Type 'y' or 'n': ") == "y":
        play_game()

def deal_card()-> PythonObject:
    random = Python.import_module("random")
    var cards: PythonObject = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
    var card: PythonObject = random.choice(cards)
    return card

def calculate_score(cards: PythonObject) -> PythonObject:
    bi = Python.import_module("builtins")
    if bi.sum(cards) == 21 and len(cards) == 2:
        return 0
    if 11 in cards and bi.sum(cards) > 21:
        cards.remove(11)
        cards.append(1)
    return bi.sum(cards)

def compare(user_score: PythonObject, computer_score: PythonObject) -> PythonObject:
    if user_score == computer_score:
        return "Draw 🙃"
    elif computer_score == 0:
        return "Lose, opponent has Blackjack 😱"
    elif user_score == 0:
        return "Win with a Blackjack 😎"
    elif user_score > 21:
        return "You went over. You lose 😭"
    elif computer_score > 21:
        return "Opponent went over. You win 😁"
    elif user_score > computer_score:
        return "You win 😃"
    else:
        return "You lose 😤"

def play_game():
    print("### BLACKJACK ###")
    var user_cards: PythonObject = []
    var computer_cards: PythonObject = []
    is_game_over = False

    for _ in range(2):
        user_cards.append(deal_card())
        computer_cards.append(deal_card())

    while not is_game_over:
        user_score = calculate_score(user_cards)
        computer_score = calculate_score(computer_cards)
        print("Your cards:", user_cards, "current score:", user_score)
        print("Computer's first card:", computer_cards[0])
        if user_score == 0 or computer_score == 0 or user_score > 21:
            is_game_over = True
        else: 
            user_should_deal = input("Type 'y' to get another card, type 'n' to pass: ")
            if user_should_deal == "y":
                user_cards.append(deal_card())
            else:
                is_game_over = True
                
        while computer_score != 0 and computer_score < 17:
            computer_cards.append(deal_card())
            computer_score = calculate_score(computer_cards)
            print("Your final hand:", user_cards, "final score:", user_score)
            print("Computer's final hand:", computer_cards, "final score:", computer_score)
            print(compare(user_score, computer_score))
                


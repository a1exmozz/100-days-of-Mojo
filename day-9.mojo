from python import Python, PythonObject

def main():
    print("BLIND AUCTION")

    var bids = Python.dict()
    var bidding_finished = False

    while not bidding_finished:
        name = input("What is your name?: ")
        price = int(input("What is your bid?: $"))
        bids[name] = price
        should_continue = input("Are there any other bidders? Type 'yes or 'no'.\n")

        if should_continue == "no":
            bidding_finished = True
            find_highest_bidder(bids)
        elif should_continue == "yes":
            print("Next bid...")

def find_highest_bidder(bidding_record: PythonObject):
    highest_bid = 0
    var winner: PythonObject = ""

    for bidder in bidding_record:
        var bid_amount: PythonObject = bidding_record[bidder]

        if bid_amount > highest_bid: 
            highest_bid = bid_amount
            winner = bidder
    print("The winner is:", winner, "with a bid of:", highest_bid)
    

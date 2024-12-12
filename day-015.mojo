from python import Python, PythonObject

def main():
    var MENU = Python.evaluate("""{
        "espresso": {
            "ingredients": {
                "water": 50,
                "coffee": 18,
            },
            "cost": 1.5,
        },
        "latte": {
            "ingredients": {
                "water": 200,
                "milk": 150,
                "coffee": 24,
            },
            "cost": 2.5,
        },
        "cappuccino": {
            "ingredients": {
                "water": 250,
                "milk": 100,
                "coffee": 24,
            },
            "cost": 3.0,
        }
        }""")

    profit = 0

    resources = Python.evaluate("""{
        "water": 300,
        "milk": 200,
        "coffee": 100,
    }""")

    is_on = True

    while is_on:
        choice = input("​What would you like? (espresso/latte/cappuccino): ")
        if choice == "off":
            is_on = False
        elif choice == "report":
            print("Water:", resources['water'], "ml")
            print("Milk:", resources['milk'], "ml")
            print("Coffee:", resources['coffee'], "ml")
            print("Money:", profit, "ml")
        else:
            drink = MENU[choice]
            if is_resource_sufficient(drink["ingredients"]):
                var payment: PythonObject = process_coins()
                if is_transaction_successful(payment, drink["cost"]):
                    make_coffee(choice, drink["ingredients"])


def is_resource_sufficient(order_ingredients: PythonObject):
    resources = Python.evaluate("""{
        "water": 300,
        "milk": 200,
        "coffee": 100,
    }""")

    for item in order_ingredients:
        if order_ingredients[item] > resources[item]:
            print("​Sorry there is not enough:", item)
            return False
    return True


def process_coins() -> PythonObject:
    """Returns the total calculated from coins inserted."""
    print("Please insert coins.")
    total = int(input("how many quarters?: ")) * 0.25
    total += int(input("how many dimes?: ")) * 0.1
    total += int(input("how many nickles?: ")) * 0.05
    total += int(input("how many pennies?: ")) * 0.01
    return total


def is_transaction_successful(money_received: PythonObject, drink_cost: PythonObject) -> PythonObject:
    var bi = Python.import_module("builtins")
    if money_received >= drink_cost:
        change = bi.round(money_received - drink_cost, 2)
        var profit: PythonObject = 0
        print("Here is", change, "in change.")
        profit += drink_cost
        return True
    else:
        print("Sorry that's not enough money. Money refunded.")
        return False


def make_coffee(drink_name: PythonObject, order_ingredients: PythonObject):
    resources = Python.evaluate("""{
        "water": 300,
        "milk": 200,
        "coffee": 100,
    }""")
    for item in order_ingredients:
        resources[item] -= order_ingredients[item]
    print("Here is your", drink_name, "☕️. Enjoy!")



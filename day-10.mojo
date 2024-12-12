from python import Python, PythonObject

def main():
      calculator()

def calculator():
    print("CALCULATOR")
    var operations = Python.dict()

    operations["+"] = Python.evaluate("lambda n1, n2: n1 + n2")
    operations["-"] = Python.evaluate("lambda n1, n2: n1 - n2")
    operations["*"] = Python.evaluate("lambda n1, n2: n1 * n2")
    operations["/"] = Python.evaluate("lambda n1, n2: n1 / n2")

    var bi = Python.import_module("builtins")
    num1 = bi.float(input("What's the first number?: "))

    for symbol in operations:
        print(symbol)

    should_continue = True
    
    while should_continue:
        operation_symbol = input("Pick an operation: ")
        num2 = bi.float(input("What's the next number?: "))
        calculation_function = operations[operation_symbol]
        answer = calculation_function(num1, num2)
        print(num1, operation_symbol, num2, "=", answer)

        answer_string = str(answer)

        if input("Type 'y' to continue calculating with " + answer_string + " or type 'n' to start a new calculation") == 'y':
            num1 = answer
        else:
            should_continue = False
            calculator()

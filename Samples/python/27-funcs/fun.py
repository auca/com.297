def function_that_does_nothing():
    pass

def print_string(string):
    """
        This is a documentation string for the method. It can be accesses with
        print_string.__doc__
    """
    print(string)

def add_numbers(num1, num2):
    return num1 + num2

def average_numbers(numbers):
    return sum(numbers) / len(numbers)

def average_vararg_numbers(*numbers):
    return sum(numbers) / len(numbers)

# https://docs.python.org/3/tutorial/controlflow.html#positional-or-keyword-arguments
def parrot(voltage, state='a stiff', action='voom', type='Norwegian Blue'):
    print("-- This parrot wouldn't", action, end=' ')
    print("if you put", voltage, "volts through it.")
    print("-- Lovely plumage, the", type)
    print("-- It's", state, "!")

def report(**keywords):
    for key in keywords:
        print(key, ":", keywords[key])

def restrict_params(pos_only, /, standard, *, kwd_only):
    print(pos_only, standard, kwd_only)

def scope_test():
    def do_local():
        spam = "local spam"

    def do_nonlocal():
        nonlocal spam
        spam = "nonlocal spam"

    def do_global():
        global spam
        spam = "global spam"

    spam = "test spam"
    do_local()
    print("After local assignment:", spam)
    do_nonlocal()
    print("After nonlocal assignment:", spam)
    do_global()
    print("After global assignment:", spam)

def main():
    function_that_does_nothing()

    print_string("Hello, world!")
    print(print_string.__doc__)

    result = add_numbers(3, 5)
    print(result)

    result = average_numbers([1, 2, 3, 4, 5])
    print(result)

    result = average_vararg_numbers(1, 2, 3, 4, 5)
    print(result)

    parrot(1000)                                          # 1 positional argument
    parrot(voltage=1000)                                  # 1 keyword argument
    parrot(voltage=1000000, action='VOOOOOM')             # 2 keyword arguments
    parrot(action='VOOOOOM', voltage=1000000)             # 2 keyword arguments
    parrot('a million', 'bereft of life', 'jump')         # 3 positional arguments
    parrot('a thousand', state='pushing up the daisies')  # 1 positional, 1 keyword
    # parrot()                     # required argument missing
    # parrot(voltage=5.0, 'dead')  # non-keyword argument after a keyword argument
    # parrot(110, voltage=220)     # duplicate value for the same argument
    # parrot(actor='John Cleese')  # unknown keyword argument

    report(name="Joe", age=19, isRegistered=True)

    restrict_params('positional arg', standard="key or positional args", kwd_only="keyword only arg")
    restrict_params('positional arg', "key or positional args", kwd_only="keyword only arg")
    restrict_params(pos_only='positional arg', standard="key or positional args", kwd_only="keyword only arg")
    restrict_params('positional arg', standard="key or positional args", "keyword only arg")

    print("In main func scope:", spam)
    scope_test()
    print("In main func scope:", spam)

if __name__ == '__main__':
    main()

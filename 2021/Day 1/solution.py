from functools import reduce


def numbers(f):
    return (int(i) for i in f.readlines())


def process_file(file_name, func):
    with open(file_name) as f:
        return func(numbers(f))


def number_increases(numbers):
    # tuples contain number of increased values and the previous value
    # initialized with -1 and 0 because the first value will always be greater than 0 but it must be excluded
    return reduce(lambda p, n: (p[0] + 1, n) if n > p[1] else (p[0], n), numbers, (-1, 0))[0]


def window_increases(window_size):
    # tuples contain number of increased values and an array with current window values
    return lambda numbers: reduce(lambda p, n: (p[0] + 1, [n] + p[1][:window_size - 1]) if len(p[1]) == window_size and sum([n] + p[1][:window_size - 1]) > sum(p[1]) else (p[0], [n] + p[1][:window_size - 1]), numbers, (0, []))[0]


def main():
    result = process_file('input.txt', number_increases)
    print(result)

    result = process_file('input.txt', window_increases(3))
    print(result)


if __name__ == '__main__':
    main()

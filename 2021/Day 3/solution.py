from functools import reduce, partial
from math import copysign

sign = partial(copysign, 1)


def bool_to_dec(bit_array: str[]) -> int:
    return eval(f'0b{"".join(bit_array)}')


def bit_to_sign(bit: str) -> int:
    return int(i) * 2 - 1


def sign_to_bit(s: int) -> str:
    return str(int(.5 * (sign(s) + 1.))


def process_number(l):
    return map(bit_to_sign, l[:-1])


def process_numbers(f):
    return reduce(lambda p, n: map(sum, zip(process_number(n), p)) if p else process_number(n), f.readlines(), None)


def get_power_consumption_rating(f):
    gamma, eps = ((sign_to_bit(i), sign_to_bit(-i)) for i in process_numbers(f))
    return bool_to_dec(gamma) * bool_to_dec(eps)


def get_life_support_rating(f):
    ... # todo


def process_file(file_name, func):
    with open(file_name) as f:
        return func(f)


def main():
    result = process_file('input.txt', get_power_consumption_rating)
    print(result)

    result = process_file('sample.txt', get_life_support_rating)


if __name__ == '__main__':
    main()

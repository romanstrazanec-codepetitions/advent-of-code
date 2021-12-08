import re

from functools import reduce
from math import prod


def process_command(command):
    if match := re.match(r'forward (\d+)', command):
        return (int(match.group(1)), 0)  # horizontal increase, depth/aim remains the same
    if match := re.match(r'up (\d+)', command):
        return (0, -int(match.group(1)))  # depth/aim decrease
    if match := re.match(r'down (\d+)', command):
        return (0, int(match.group(1)))  # depth/aim increase
    return (0, 0)


def process_commands(f):
    return prod(reduce(lambda p, n: map(sum, zip(p, process_command(n))), f.readlines(), (0, 0)))


def process_command_with_aim(p, n):
    cmd = process_command(n) # (horizontal, aim)
    # (horizontal, depth, aim)
    return (p[0] + cmd[0], p[1] + p[2] * cmd[0], p[2] + cmd[1])


def process_commands_with_aim(f):
    return prod(reduce(process_command_with_aim, f.readlines(), (0, 0, 0))[:2])


def process_file(file_name, func):
    with open(file_name) as f:
        return func(f)


def main():
    result = process_file('input.txt', process_commands)
    print(result)

    result = process_file('input.txt', process_commands_with_aim)
    print(result)

if __name__ == '__main__':
    main()

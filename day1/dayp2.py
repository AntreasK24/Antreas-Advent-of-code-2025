import re

def spltInput(line):
    output = re.split(r'(\d+)', line.strip())
    return output

head = 50
number_of_zeros = 0

with open("input.txt") as file:
    for line in file:
        line = line.strip()
        output = spltInput(line)
        direction = output[0]
        steps = int(output[1])

        step_dir = 1 if direction == "R" else -1

        for _ in range(steps):
            head += step_dir

            if head > 99:
                head = 0
            elif head < 0:
                head = 99

            if head == 0:
                number_of_zeros += 1

print("Number of zeros:", number_of_zeros)

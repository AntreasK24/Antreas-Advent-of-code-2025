import numpy as np
import re


def spltInput(line):
    output = re.split('(\d+)', line)
    return output
    
head = 50

number_of_zeros = 0

with open("input.txt") as file:
    for line in file:
        output = spltInput(line)
        direction = output[0]
        steps = int(output[1])

        if(direction == "R"):
            head = head + steps
            while(head > 99):
                head = head - 100
        elif(direction == "L"):
            head = head - steps
            while(head < 0):
                head = head + 100

        print(head)

        if(head == 0):
            number_of_zeros += 1


print("Number of zeros: ",number_of_zeros)




#########################################################################################
# Utility functions for trees - used for Tree Edit Distance calculation  .                     
#
#########################################################################################

import sys
#########################################################################################


def pop_till_bracket(stack):
    #print(stack, len(stack))
    new_stack, text = None, None
    for i in range(len(stack)-1, -1, -1):
        if stack[i] == "(":
            text = stack[i+1:]
            new_stack = stack[:i]
            break
    #print(new_stack)
    return new_stack, text


def prune(tree, max_height):
    current_height = 0
    stack = []
    i = 0
    while(1):
        if i == len(tree):
            break
        if tree[i] == "(":
            stack.append(tree[i])
            current_height += 1
        elif tree[i] == ")":
            if current_height > max_height:
                stack, text = pop_till_bracket(stack)
            else:
                stack.append(tree[i])
            current_height -= 1
        else:
            stack.append(tree[i])
        i+= 1

    return "".join(stack)


def remove_terminals(tree):
    last_bracket = -1
    stack = []
    i = 0
    while(1):
        if i == len(tree):
            break
        if tree[i] == "(":
            stack.append(tree[i])
            last_bracket = (len(stack)-1)
        elif tree[i] == ")":
            if last_bracket == -1:
                stack.append(tree[i])
            else:
                stack, text = pop_till_bracket(stack)
                non_term = "".join(text).split()[0].strip()
                if non_term not in [",", ",", ";", "-", ":", "!", "?", "\""]:
                	stack += "(" + non_term + ")"
                last_bracket = -1
        else:
            stack.append(tree[i])
        i+= 1

    return "".join(stack)
#########################################################################################


# Test the functions
a = prune(sys.argv[1], 3)
print(a)
b = remove_terminals(a)
print(b)
#########################################################################################

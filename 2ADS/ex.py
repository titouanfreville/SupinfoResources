def solution_n(n):
    if n < 3:
        return 1
    if n == 3:
        return 2
    return solution_n(n-1) + (n-1)

print(solution_n(8))
print(solution_n(100))

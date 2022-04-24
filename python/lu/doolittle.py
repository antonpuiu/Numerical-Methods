import numpy as np

def lu(A: np.matrix):
    (m, n) = A.shape

    if m != n:
        print('Wrong matrix.')
        return

    L = np.eye(n)
    U = np.zeros(A.shape)

    for i in range(n):
        for j in range(i, n):
            U[i, j] = A[i, j] - L[i, 0:i] @ U[0:i, j]

            if i == j:
                continue

            L[j, i] = 1 / U[i, i] * (A[j, i] - L[j, 0:i] @ U[0:i, i])

    return (L, U)

def test():
    A = np.random.randint(1, 9, (3, 3))

    print(A)

    (L, U) = lu(A)
    print(np.matmul(L, U))


if __name__ == '__main__':
    test()

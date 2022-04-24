import numpy as np

def lu(A: np.matrix):
    (m, n) = A.shape

    if m != n:
        print('Wrong matrix.')
        return

    L = np.zeros(A.shape)
    U = np.eye(n)

    for j in range(n):
        for i in range(j, n):
            L[i, j] = A[i, j] - L[i, 0:j] @ U[0:j, j]

            if i == j:
                continue

            U[j, i] = 1 / L[j, j] * (A[j, i] - L[j, 0:j] @ U[0:j, i])

    return (L, U)

def test():
    A = np.matrix('[2 -1 3; 4 5 1; 2 1 2]')

    print(A)

    (L, U) = lu(A)
    print(np.matmul(L, U))


if __name__ == '__main__':
    test()

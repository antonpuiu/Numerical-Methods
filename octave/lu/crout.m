function [L, U] = crout(A = [2 -1 3; 4 5 1; 2 1 2])
  [m, n] = size(A);
  L = zeros(n, n);
  U = eye(n);

  if m != n
    return
  end

  for j = 1:n
    L(j:n, j) = A(j:n, j) - L(j:n, 1:j-1) * U(1:j-1, j);
    U(j, j:n) = 1 / L(j, j) * (A(j, j:n) - L(j, 1:j-1) * U(1:j-1, j:n));
  end
end

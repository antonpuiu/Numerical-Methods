function [L, U] = crout(A = [2 -1 3; 4 5 1; 2 1 2])
  [m, n] = size(A);
  L = zeros(n, n);
  U = eye(n);

  if m != n
    return
  end

  for j = 1:n
    for i = j:n
      L(i, j) = A(i, j) - L(i,1:j-1) * U(1:j-1, j);

      if i == j
        continue
      end

      U(j, i) = 1 / L(j, j) * (A(j, i) - L(j, 1:j-1) * U(1:j-1, i));
    end
  end
end

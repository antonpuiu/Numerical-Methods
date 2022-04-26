function [L, U] = doolittle_opt(A)
  n = length(A);
  L = eye(n);
  U = zeros(n, n);

  for i = 1:n
    for j = i:n
      U(i, j) = A(i, j) - L(i, 1:i-1) * U(1:i-1, j);
    end

    for j = i+1:n
      L(j, i) = 1 / U(i, i) * (A(j, i) - L(j, 1:i-1) * U(1:i-1, i));
    end
  end
end

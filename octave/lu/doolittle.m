function [L, U] = doolittle(A = magic(3))
  [m, n] = size(A);
  L = eye(n);
  U = zeros(m, n);

  for i = 1:n
    for j = i:n
      U(i, j) = A(i, j) - L(i, 1:i-1) * U(1:i-1, j);

      if i == j
        continue
      end

      L(j, i) = 1/U(i, i) * (A(j, i) - L(j, 1:i-1) * U(1:i-1, i));
    endfor
  endfor
endfunction

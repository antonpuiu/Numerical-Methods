function [L, U] = doolittle(A = magic(3))
  [m, n] = size(A);
  L = eye(n);
  U = zeros(m, n);

  for i = 1:n
    for j = 1:n
      U(i, j) = A(i, j) - L(i, 1:i-1) * U(1:i-1, j);

      if i != j
        L(j, i) = 1/U(i, i) * (A(j, i) - L(j, 1:i-1) * U(1:i-1, i));
      endif
    endfor
  endfor

  for i = 1:n-1
    cols = i+1:n;
    L(i, cols) = 0;
  endfor
endfunction

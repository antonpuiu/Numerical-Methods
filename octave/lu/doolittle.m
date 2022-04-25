function [L, U] = doolittle(A = magic(15))
  % t = time(); [l,u]=doolittle(magic(500)); disp(time() - t)
  % 0.2525
  [m, n] = size(A);
  L = eye(n);
  U = zeros(m, n);

  for i = 1:n
    U(i, i:n) = A(i, i:n) - L(i, 1:i-1) * U(1:i-1, i:n);
    ## for j = i:n
    ##   U(i, j) = A(i, j) - L(i, 1:i-1) * U(1:i-1, j);
    ## end

    L(i+1:n, i) = 1/U(i, i) * (A(i+1:n, i) - L(i+1:n, 1:i-1) * U(1:i-1, i));
    ## for j=i+1:n
    ##   L(j, i) = 1/U(i, i) * (A(j, i) - L(j, 1:i-1) * U(1:i-1, i));
    ## end
  end
end

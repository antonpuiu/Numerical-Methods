function [L, U] = doolittle_normal(A)
  n = length(A);
  L = eye(n);
  U = zeros(n, n);

  for i = 1:n
    for j = i:n
      sum = 0;

      for k = 1:i-1
        sum += L(i, k) * U(k, j);
      end

      U(i, j) = A(i, j) - sum;
    end

    for j = i+1:n
      sum = 0;

      for k = 1:i-1
        sum += L(j, k) * U(k, i);
      end

      L(j, i) = 1 / U(i, i) * (A(j, i) - sum);
    end
  end
end

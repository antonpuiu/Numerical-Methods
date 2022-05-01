function L = cholesky(A)
  [m, n] = size(A);
  L = zeros(n, n);

  assert(m == n);

  for i = 1:n
    for j = i+1:n
      assert(A(i, j) == A(j, i));
    end
  end

  assert(sum(eigs(A) > 0) == n);

  for i = 1:n
    for j = 1:i-1
      L(i, j) = 1 / L(j, j) * (A(i, j) - L(i, 1:j-1) * L(j, 1:j-1)');
    end

    L(i, i) = sqrt(A(i, i) - L(i, 1:i-1) * L(i, 1:i-1)');
  end
end

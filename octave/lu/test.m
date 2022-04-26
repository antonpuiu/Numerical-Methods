function test()
  interval = 0:200;
  t_normal = zeros(1, length(interval));
  t_opt = zeros(1, length(interval));
  t_fast = zeros(1, length(interval));
  t_super = zeros(1, length(interval));

  for i = interval
    printf("fourth loop:i = %d\n", i);
    A = magic(i);
    [Q, _] = qr(A);

    t = time(); lu(Q); t_super(i+1) = time() - t;
  end


  for i = interval
    printf("third loop:i = %d\n", i);
    A = magic(i);
    [Q, _] = qr(A);

    t = time(); doolittle(Q); t_fast(i+1) = time() - t;
  end

  for i = interval
    printf("second loop:i = %d\n", i);
    A = magic(i);
    [Q, _] = qr(A);

    t = time(); doolittle_opt(Q); t_opt(i+1) = time() - t;
  end

  for i = interval
    printf("first loop:i = %d\n", i);
    A = magic(i);
    [Q, _] = qr(A);

    t = time(); doolittle_normal(Q); t_normal(i+1) = time() - t;
  end

  figure;
  plot(interval, t_normal, ";normal;");
  hold on;
  plot(interval, t_opt, ";opt;");
  hold on;
  plot(interval, t_fast, ";fast;");
  hold on;
  plot(interval, t_super, ";octave-lu;");
  title("LU computation time over dimension");
  legend("show");
  xlabel("Dimension");
  ylabel("Time[s]")
end

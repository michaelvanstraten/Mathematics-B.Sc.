ns = round(logspace(1, 3, 50));

conds = arrayfun(@(n) ...
    cond(fliplr(vander(linspace(0, 1, n + 1))), 2), ...
    ns);

loglog(ns, conds, 'o-')
xlabel('n')
ylabel('cond_2(V_n)')
grid on

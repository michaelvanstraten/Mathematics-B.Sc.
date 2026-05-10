bounds = {-5, 5};
xs = linspace(bounds{:}, 250);

f = @(x) 1 ./ (1 + 25*x.^2);

figure("Name", "Äquidistanten Stützstellen", "NumberTitle", "off");

hold on;
grid on;
ylim([-2, 2]);

plot(xs, arrayfun(f, xs), "DisplayName", "f(x)");

for n = (2 .^ (1:5))
    sp = linspace(bounds{:}, n);
    plot(xs,
        arrayfun(@(x) NevilleSchema(sp, f(sp), x), xs),
        "DisplayName",
        sprintf("p_{%d}(x)", n)
    );
end

legend;

figure("Name", "Tschebyscheff-Knoten", "NumberTitle", "off");

hold on;
grid on;
ylim([-2, 2]);

plot(xs, arrayfun(f, xs), "DisplayName", "f(x)");

for n = (2 .^ (1:5))
    k = n-1:-1:0;
    sp = (bounds{1}+bounds{2})./2 + ((bounds{2}-bounds{1})./2)*cos(pi.*k./(n-1));
    plot(xs,
        arrayfun(@(x) NevilleSchema(sp, f(sp), x), xs),
        "DisplayName",
        sprintf("p_{%d}(x)", n)
    );
end

legend;

pause

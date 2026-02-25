function [] = open_random_figures(number_max, n_figures)

    assert(number_max >= n_figures);

    for i = randperm(number_max, n_figures)
        figure(i);
        hold on
        tiledlayout(1,1, 'Padding', 'none', 'TileSpacing', 'compact');

        plot(randn(100,1));
        ylabel("Some ylabel left");

        yyaxis right
        plot(randn(100,1));
        ylabel("Some ylabel right");

        title("Some Title");
        xlabel("Some xlabel");
        grid minor
    end
end
function [] = open_exemplary_figures(figure_number_max, n_figures)

    assert(figure_number_max >= n_figures);

    % open all figures
    for i = randperm(figure_number_max, n_figures)
        figure(i);
    end

    % fill all figures
    callable = @() fill_figure(100);
    figure_misc.apply_to_all_figures(callable);
end

function [] = fill_figure(n_points)
    hold on
    tiledlayout(1,1, 'Padding', 'none', 'TileSpacing', 'compact')
    
    plot(randn(n_points,1), 'DisplayName', "entry A")
    ylabel("Some ylabel left")
    ylim([-4 4])
    
    yyaxis right
    plot(randn(n_points,1), 'DisplayName', "entry B")
    ylabel("Some ylabel right")
    ylim([-4 4])

    figure_misc.annotation(0.3, 0.75, "some annotation");
    
    title("Some Title")
    xlabel("Some xlabel")
    grid minor

    legend
end
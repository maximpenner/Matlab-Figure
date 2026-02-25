function [] = example()
    close all;
    rng("shuffle");
    figure_misc.undock_all();
    figure_misc.open_random_figures(48, 8);
    figure_arrange.arrange();
end
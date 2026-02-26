function [] = grid()
    close all;
    rng("shuffle");
    figure_misc.docking.undock_from_now_on();
    figure_misc.open_exemplary_figures(48, 11);
    figure_arrange.grid();
end
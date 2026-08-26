function [] = cascade()
    close all;
    rng("shuffle");
    figure_common.docking.undock_from_now_on();
    figure_common.open_exemplary_figures(48, 11);
    figure_arrange.cascade();
end
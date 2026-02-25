function [] = apply_to_all_figures(callable)

    fig_handles = figure_misc.get_all_fig_handles();

    for i=1:numel(fig_handles)
        fig_handle = fig_handles(i);
        figure(fig_handle.Number);
        callable();
    end
end
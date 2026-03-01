function [] = cascade(cascade_config)

    if nargin == 0
        cascade_config = figure_arrange.cascade_config();
    else
        assert(isa(cascade_config, "figure_arrange.cascade_config"));
    end

    fig_handles = figure_misc.get_all_fig_handles(cascade_config.is_sorted_by_number);

    if isempty(fig_handles)
        return;
    end

    % determine grid size
    n_fig = numel(fig_handles);

    % monitor sizes
    dim = get(cascade_config.monitor, 'screensize');
    size_monitor = figure_misc.size(figure_misc.unit.pixels, dim(3), dim(4));

    % margins
    margin_monitor = cascade_config.margin_monitor.convert_to(figure_misc.unit.pixels, size_monitor);

    % total draw area
    size_monitor_margin = figure_misc.size(figure_misc.unit.pixels, ...
                                           size_monitor.x - margin_monitor.left - margin_monitor.right, ...
                                           size_monitor.y - margin_monitor.top - margin_monitor.bottom);

    % area per figure
    size_figure = cascade_config.size_figure.convert_to(figure_misc.unit.pixels, size_monitor);

    % offset per figure
    if n_fig == 1
        offset = figure_misc.size(figure_mics.unit.pixels, 0, 0);
    else
        offset = figure_misc.size(figure_misc.unit.pixels, ...
                                  floor((size_monitor_margin.x - size_figure.x) / (n_fig-1)), ...
                                  floor((size_monitor_margin.y - size_figure.y) / (n_fig-1)));
    end

    assert(offset.x >= 0);
    assert(offset.y >= 0);

    % arrange all figures
    for cnt = 1:n_fig
        % determine absolute offsets on monitor
        offset_of_this_figure = figure_misc.size(figure_misc.unit.pixels, ...
                                                 offset.x * (cnt-1) + margin_monitor.left, ...
                                                 size_monitor.y - (offset.y * (cnt-1) + size_figure.y + margin_monitor.top));

        fig_handle = fig_handles(cnt);

        if cascade_config.is_toolbar_menubar_classic
            set(fig_handle, 'Toolbar', 'figure', 'Menubar', 'figure');
        end
        
        % set position and size of single figure
        fig_handle.Units = "pixels";
        fig_handle.OuterPosition = [offset_of_this_figure.x, ...
                                    offset_of_this_figure.y, ...
                                    size_figure.x, ...
                                    size_figure.y];
        
        % bring into focus
        figure(fig_handle.Number);
    end
end
function [] = grid(grid_config)

    if nargin == 0
        grid_config = figure_arrange.grid_config();
    else
        assert(isa(grid_config, "figure_arrange.grid_config"));
    end

    fig_handles = figure_misc.get_all_fig_handles(grid_config.is_sorted_by_number);

    if isempty(fig_handles)
        return;
    end

    % determine grid size
    n_fig = numel(fig_handles);
    n_row = ceil(n_fig / grid_config.n_col);

    % monitor sizes
    dim = get(grid_config.monitor, 'screensize');
    size_monitor = figure_misc.size(figure_misc.unit.pixels, dim(3), dim(4));

    % margins
    margin_monitor = grid_config.margin_monitor.convert_to(figure_misc.unit.pixels, size_monitor);
    margin_figure = grid_config.margin_figure.convert_to(figure_misc.unit.pixels, size_monitor);

    % total draw area
    size_monitor_margin = figure_misc.size(figure_misc.unit.pixels, ...
                                           size_monitor.x - margin_monitor.left - margin_monitor.right, ...
                                           size_monitor.y - margin_monitor.top - margin_monitor.bottom);

    % area per figure
    size_area_per_fig = figure_misc.size(figure_misc.unit.pixels, ...
                                         floor(size_monitor_margin.x / grid_config.n_col), ...
                                         floor(size_monitor_margin.y / n_row));

    % figure grid size
    grid_size = [n_row, grid_config.n_col];

    % arrange all figures
    for cnt = 1:n_fig
        if grid_config.is_row_major
            [col, row] = ind2sub(flip(grid_size), cnt);
        else
            [row, col] = ind2sub(grid_size, cnt);
        end

        % determine absolute offsets on monitor
        offset = figure_misc.size(figure_misc.unit.pixels, ...
                                  margin_monitor.left + (col-1) * size_area_per_fig.x + margin_figure.left, ...
                                  size_monitor.y - (margin_monitor.top + row * size_area_per_fig.y - margin_figure.bottom));

        fig_handle = fig_handles(cnt);

        if grid_config.is_toolbar_menubar_classic
            set(fig_handle, 'Toolbar', 'figure', 'Menubar', 'figure');
        end
        
        % set position and size of single figure
        fig_handle.Units = "pixels";
        fig_handle.OuterPosition = [offset.x, ...
                                    offset.y, ...
                                    size_area_per_fig.x - margin_figure.left - margin_figure.right, ...
                                    size_area_per_fig.y - margin_figure.top - margin_figure.bottom];
        
        % bring into focus
        figure(fig_handle.Number);
    end
end
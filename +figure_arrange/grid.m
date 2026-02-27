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
    x_monitor = dim(3);
    y_monitor = dim(4);

    margin_monitor_px = figure_arrange.convert(grid_config.margin_monitor, x_monitor, y_monitor);
    margin_figure_px = figure_arrange.convert(grid_config.margin_figure, x_monitor, y_monitor);

    x_monitor_margin = x_monitor - margin_monitor_px.left - margin_monitor_px.right;
    y_monitor_margin = y_monitor - margin_monitor_px.top - margin_monitor_px.bottom;

    % area per figure
    x_area_per_fig = floor(x_monitor_margin / grid_config.n_col);
    y_area_per_fig = floor(y_monitor_margin / n_row);

    % figure grid size
    grid_size = [n_row, grid_config.n_col];

    % arrange all figures
    for cnt = 1:n_fig
        if grid_config.row_major
            [col, row] = ind2sub(flip(grid_size), cnt);
        else
            [row, col] = ind2sub(grid_size, cnt);
        end

        % determine absolute offsets on monitor
        y_monitor_offset = y_monitor - (margin_monitor_px.top + row * y_area_per_fig - margin_figure_px.bottom);
        x_monitor_offset = margin_monitor_px.left + (col-1) * x_area_per_fig + margin_figure_px.left;

        fig_handle = fig_handles(cnt);

        if grid_config.is_toolbar_menubar_classic
            set(fig_handle, 'Toolbar', 'figure', 'Menubar', 'figure');
        end
        
        % set position and size of single figure
        fig_handle.Units = "pixels";
        fig_handle.OuterPosition = [x_monitor_offset, ...
                                    y_monitor_offset, ...
                                    x_area_per_fig - margin_figure_px.left - margin_figure_px.right, ...
                                    y_area_per_fig - margin_figure_px.top - margin_figure_px.bottom];
        
        % bring into focus
        figure(fig_handle.Number);
    end
end
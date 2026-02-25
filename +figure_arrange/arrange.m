function [] = arrange(config)

    if nargin == 0
        config = figure_arrange.config();
    end

    fig_handles = figure_misc.get_all_fig_handles(config.is_sorted_by_number);

    if isempty(fig_handles)
        return;
    end

    % determine grid size
    n_fig = numel(fig_handles);
    n_row = ceil(n_fig / config.n_col);

    % monitor sizes
    dim = get(config.monitor, 'screensize');
    x_monitor = dim(3);
    y_monitor = dim(4);
    x_monitor_margin = x_monitor - config.margin_monitor.left - config.margin_monitor.right;
    y_monitor_margin = y_monitor - config.margin_monitor.top - config.margin_monitor.bottom;

    % area per figure
    x_area_per_fig = floor(x_monitor_margin / config.n_col);
    y_area_per_fig = floor(y_monitor_margin / n_row);

    % arrange all figures
    cnt = 1;
    for row = 1:n_row
    
        y_offset = y_monitor - (config.margin_monitor.top + row * y_area_per_fig - config.margin_figure.bottom);
    
        for col = 1:config.n_col
        
            x_offset = config.margin_monitor.left + (col-1) * x_area_per_fig + config.margin_figure.left;

            % grid may no be filled completely
            if cnt <= n_fig
                fig_handle = fig_handles(cnt);

                if config.is_toolbar_menubar_classic
                    set(fig_handle, 'Toolbar', 'figure', 'Menubar', 'figure');
                end

                % set position
                fig_handle.Units = "pixels";
                fig_handle.OuterPosition = [x_offset, ...
                                            y_offset, ...
                                            x_area_per_fig - config.margin_figure.left - config.margin_figure.right, ...
                                            y_area_per_fig - config.margin_figure.top - config.margin_figure.bottom];

                % bring into focus
                figure(fig_handle.Number);
            end

            cnt = cnt + 1;
        end
    end
end
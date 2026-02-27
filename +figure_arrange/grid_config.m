classdef grid_config
    properties
        monitor (1,1) double
        is_sorted_by_number (1,1) logical
        n_col (1,1) double
        is_toolbar_menubar_classic (1,1) logical
        is_row_major (1,1) logical
        margin_monitor (1,1) figure_misc.margin
        margin_figure (1,1) figure_misc.margin
    end

    methods
        function obj = grid_config()
            obj.monitor = 0;
            obj.is_sorted_by_number = true;
            obj.n_col = 3;
            obj.is_toolbar_menubar_classic = false;
            obj.is_row_major = true;
    
            obj.margin_monitor.unit = figure_misc.unit.percent;
            obj.margin_monitor.top = 10;
            obj.margin_monitor.bottom = 10;
            obj.margin_monitor.left = 5;
            obj.margin_monitor.right = 5;
    
            % can be negative to overlap figures in any direction
            obj.margin_figure.unit = figure_misc.unit.percent;
            obj.margin_figure.top = 0.25;
            obj.margin_figure.bottom = 0.25;
            obj.margin_figure.left = 0.25;
            obj.margin_figure.right = 0.25;
        end
    end
end
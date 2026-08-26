classdef grid_config
    properties
        monitor (1,1) double
        is_sorted_by_number (1,1) logical
        n_col (1,1) double
        is_toolbar_menubar_classic (1,1) logical
        is_row_major (1,1) logical
        margin_monitor (1,1) figure_common.margin
        margin_figure (1,1) figure_common.margin
    end

    methods
        function obj = grid_config()
            obj.monitor = 0;
            obj.is_sorted_by_number = true;
            obj.n_col = 3;
            obj.is_toolbar_menubar_classic = false;
            obj.is_row_major = true;
            obj.margin_monitor = figure_common.margin(figure_common.unit.percent_of_screen, 10, 10, 5, 5);
            obj.margin_figure = figure_common.margin(figure_common.unit.percent_of_screen, 0.25, 0.25, 0.25, 0.25);
        end
    end
end
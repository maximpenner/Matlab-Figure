classdef grid_config
    properties
        monitor
        is_sorted_by_number
        n_col
        is_toolbar_menubar_classic
        row_major
        margin_monitor
        margin_figure
    end

    methods
        function obj = grid_config()
            obj.monitor = 0;
            obj.is_sorted_by_number = true;
            obj.n_col = 3;
            obj.is_toolbar_menubar_classic = false;
            obj.row_major = true;
    
            obj.margin_monitor.top = 10;
            obj.margin_monitor.bottom = 10;
            obj.margin_monitor.left = 5;
            obj.margin_monitor.right = 5;
            % relative or pixels
            obj.margin_monitor.units = 'percent';
    
            % can be negative to overlap figures
            obj.margin_figure.top = 0.25;
            obj.margin_figure.bottom = 0.25;
            obj.margin_figure.left = 0.25;
            obj.margin_figure.right = 0.25;
            % relative or pixels
            obj.margin_figure.units = 'percent';
        end
    end
end
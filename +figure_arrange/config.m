classdef config
    properties
        monitor
        is_sorted_by_number
        n_col
        is_toolbar_menubar_classic
        margin_monitor
        margin_figure
    end

    methods
        function obj = config()
            obj.monitor = 0;
            obj.is_sorted_by_number = true;
            obj.n_col = 3;

            obj.is_toolbar_menubar_classic = false;
    
            obj.margin_monitor.top = 150;
            obj.margin_monitor.bottom = 150;
            obj.margin_monitor.left = 50;
            obj.margin_monitor.right = 50;
    
            obj.margin_figure.top = 5;
            obj.margin_figure.bottom = 5;
            obj.margin_figure.left = 5;
            obj.margin_figure.right = 5;
        end
    end
end
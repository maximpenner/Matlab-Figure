classdef cascade_config
    properties
        monitor (1,1) double
        is_sorted_by_number (1,1) logical
        is_toolbar_menubar_classic (1,1) logical
        margin_monitor (1,1) figure_misc.margin
        size_figure (1,1) figure_misc.size
    end

    methods
        function obj = cascade_config()
            obj.monitor = 0;
            obj.is_sorted_by_number = true;
            obj.is_toolbar_menubar_classic = false;
            obj.margin_monitor = figure_misc.margin(figure_misc.unit.percent_of_screen, 10, 10, 5, 5);
            obj.size_figure = figure_misc.size(figure_misc.unit.percent_of_screen, 60, 60);
        end
    end
end
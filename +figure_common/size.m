classdef size
    properties
        unit (1,1) figure_common.unit
        x (1,1) double
        y (1,1) double
    end

    methods
        function obj = size(unit, x, y)
            if nargin == 0
                obj.unit = figure_common.unit.percent_of_screen;
                obj.x = 0;
                obj.y = 0;
                return;
            end

            obj.unit = unit;
            obj.x = x;
            obj.y = y;
        end

        function obj = convert_to(obj, target_unit, size_monitor)
            arguments
                obj (1,1) figure_common.size
                target_unit (1,1) figure_common.unit
                size_monitor (1,1) figure_common.size
            end

            assert(size_monitor.unit == figure_common.unit.pixels);

            if obj.unit == target_unit
                return
            end

            switch obj.unit
                case figure_common.unit.percent_of_screen
                    % convert to pixels
                    obj.x = floor(obj.x / 100 * size_monitor.x);
                    obj.y = floor(obj.y / 100 * size_monitor.y);
                case figure_common.unit.pixels
                    % convert to percent
                    obj.x = obj.x * 100 / size_monitor.x;
                    obj.y = obj.y * 100 / size_monitor.y;
            end

            obj.unit = target_unit;
        end
    end
end
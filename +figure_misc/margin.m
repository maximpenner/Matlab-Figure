classdef margin
    properties
        unit (1,1) figure_misc.unit
        top (1,1) double
        bottom (1,1) double
        left (1,1) double
        right (1,1) double
    end

    methods
        function obj = margin(unit, top, bottom, left, right)
            if nargin == 0
                obj.unit = figure_misc.unit.percent_of_screen;
                obj.top = 0;
                obj.bottom = 0;
                obj.left = 0;
                obj.left = 0;
                return;
            end

            obj.unit = unit;
            obj.top = top;
            obj.bottom = bottom;
            obj.left = left;
            obj.right = right;
        end

        function obj = convert_to(obj, unit, size_monitor)
            arguments
                obj (1,1) figure_misc.margin
                unit (1,1) figure_misc.unit
                size_monitor (1,1) figure_misc.size
            end

            assert(size_monitor.unit == figure_misc.unit.pixels);

            if obj.unit == unit
                return
            end

            switch obj.unit
                case figure_misc.unit.percent_of_screen
                    % convert to pixels
                    obj.top    = floor(obj.top    / 100 * size_monitor.y);
                    obj.bottom = floor(obj.bottom / 100 * size_monitor.y);
                    obj.left   = floor(obj.left   / 100 * size_monitor.x);
                    obj.right  = floor(obj.right  / 100 * size_monitor.x);
                case figure_misc.unit.pixels
                    % convert to percent
                    obj.top    = obj.top    * 100 / size_monitor.y;
                    obj.bottom = obj.bottom * 100 / size_monitor.y;
                    obj.left   = obj.left   * 100 / size_monitor.x;
                    obj.right  = obj.right  * 100 / size_monitor.x;
            end

            obj.unit = unit;
        end
    end
end
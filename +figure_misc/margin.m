classdef margin
    properties
        unit (1,1) figure_misc.unit
        top (1,1) double
        bottom (1,1) double
        left (1,1) double
        right (1,1) double
    end

    methods
        function obj = convert_to(obj, unit, x_monitor, y_monitor)
            arguments
                obj (1,1) figure_misc.margin
                unit (1,1) figure_misc.unit
                x_monitor (1,1) double
                y_monitor (1,1) double
            end

            if obj.unit == unit
                return
            end

            switch obj.unit
                case figure_misc.unit.percent
                    % convert to pixels
                    obj.top    = floor(obj.top    / 100 * y_monitor);
                    obj.bottom = floor(obj.bottom / 100 * y_monitor);
                    obj.left   = floor(obj.left   / 100 * x_monitor);
                    obj.right  = floor(obj.right  / 100 * x_monitor);
                case figure_misc.unit.pixels
                    % convert to percent
                    obj.top    = obj.top    * 100 / y_monitor;
                    obj.bottom = obj.bottom * 100 / y_monitor;
                    obj.left   = obj.left   * 100 / x_monitor;
                    obj.right  = obj.right  * 100 / x_monitor;
            end

            obj.unit = unit;
        end
    end
end
function [margins_converted] = convert(margins, x_monitor, y_monitor)
    if strcmp(margins.units, "pixels")
        margins_converted = margins;
        return;
    end

    assert(strcmp(margins.units, "percent"));

    margins_converted.top    = floor(margins.top    / 100 * y_monitor);
    margins_converted.bottom = floor(margins.bottom / 100 * y_monitor);
    margins_converted.left   = floor(margins.left   / 100 * x_monitor);
    margins_converted.right  = floor(margins.right  / 100 * x_monitor);
end
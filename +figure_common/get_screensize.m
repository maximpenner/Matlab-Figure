function [dim] = get_screensize()
    ge = java.awt.GraphicsEnvironment.getLocalGraphicsEnvironment;
    gd = ge.getDefaultScreenDevice;
    dim = zeros(4,1);
    dim(3) = gd.getDisplayMode.getWidth;
    dim(4) = gd.getDisplayMode.getHeight;
end
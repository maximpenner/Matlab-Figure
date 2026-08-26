function [] = annotation(x_pos, y_pos, str)
    dim = [x_pos, y_pos, 0.1, 0.1];
    annotation('textbox', dim, 'String', str, 'FitBoxToText', 'on', LineStyle='none', Interpreter='none', FontName='FixedWidth');
end
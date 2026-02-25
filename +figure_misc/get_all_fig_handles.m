function [fig_handles] = get_all_fig_handles(is_sorted_by_number)

    if nargin == 0
        is_sorted_by_number = false;
    end

    fig_handles = get(groot, 'Children');

    if is_sorted_by_number
        [~, idx] = sort([fig_handles.Number]);
        fig_handles = fig_handles(idx);
    end
end
function [fig_handles] = get_all_fig_handles(is_sorted_by_number)

    if nargin == 0
        is_sorted_by_number = false;
    else
        assert(isa(is_sorted_by_number, 'logical'));
    end

    fig_handles = get(groot, 'Children');

    if isempty(fig_handles)
        return;
    end

    if is_sorted_by_number
        [~, idx] = sort([fig_handles.Number]);
        fig_handles = fig_handles(idx);
    end
end
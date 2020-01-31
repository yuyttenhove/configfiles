# Defined in - @ line 2
function _truncated_ls
	set -l ls_lines 7
    set -l reserved_lines 5

    if test (math $LINES - $reserved_lines) -lt $ls_lines
        set -l ls_lines (math $LINES - $reserved_lines)
    end

    set -l raw_ls_lines (gls -C --format=across --width=$COLUMNS | wc -l)
    if test $raw_ls_lines -gt $ls_lines
        set -l hidden_lines (math $raw_ls_lines - $ls_lines)
        gls -C --color=always --format=across --width=$COLUMNS | head -n $ls_lines
        _right_align "... $hidden_lines lines hidden"
    else
        gls -C --color=always --format=across --width=$COLUMNS
    end
end

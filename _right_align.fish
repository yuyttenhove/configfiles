# Defined in - @ line 2
function _right_align
	set -l arglength (string length $argv[1])
    set -l padding (math $COLUMNS - $arglength - 1)
    if test $padding -gt 0
        builtin printf "%"$padding"s"
    end
    builtin echo "$argv[1]"
end

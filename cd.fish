function cd
	set -l arg $argv[1]
    if test -d $arg
        builtin cd $arg
    else
        set list (find ~/dev ~/data ~/Documents -type d -name "*$arg*" 2>/dev/null)
        if test (count $list) -gt 1
            set -l dest (echo -e (string join "\n" $list) | rofi -dmenu -font "Noto sans 16")
            if test -n "$dest"
                builtin cd $dest
            end
        else if test (count $list) -eq 1
            builtin cd $list[1]
        else
            echo " No matching directories found..."
        end
    end
    _truncated_ls
end

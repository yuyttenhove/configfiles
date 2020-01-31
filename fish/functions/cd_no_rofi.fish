function cd
	set -l arg $argv[1]
    if test -d $arg
        builtin cd $arg
    else
        set -l list (find ~/dev ~/data ~/Documents -type d -name "*$arg*" 2>/dev/null)
        if test (count $list) -gt 1
            echo "Multiple hits, please select a location below..."
            for counter in (seq (count $list))
                echo "$counter) $list[$counter]"
            end
            read -P "Enter the number of the desired location: " dest_idx
            while test (count $list) -lt $dest_idx
                read -P "Invalid input, please try again: " dest_idx
            end
            set -l dest $list[$dest_idx]
            if test -n "$dest"
                builtin cd $dest
            end
            echo ""
            set -e dest_idx
        else if test (count $list) -eq 1
            builtin cd $list[1]
        else
            echo " No matching directories found..."
        end
    end
    _truncated_ls
end

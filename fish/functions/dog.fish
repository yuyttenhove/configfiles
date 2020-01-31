# deprecated by bat
function _dog
    for f in $argv
        echo "Displaying contents of \"$f\":"
        echo ""
        highlight -O ansi $f --force
        echo ""
    end
end

function dog
    _dog $argv | less -R
end

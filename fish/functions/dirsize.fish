function dirsize
	if test (count $argv) -eq 1
du -hc $argv[1] | sort -rh | head -10
else if test (count $argv) -eq 2
du -hc $argv[1] | sort -rh | head -$argv[2]
else 
echo "Illegal argument count (should be 1 or 2)"
end
end

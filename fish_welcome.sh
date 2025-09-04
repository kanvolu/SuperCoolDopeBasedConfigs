
function fish_greeting
	set number $(math $(random) % 4)
	switch $number
		case 0
			cbonsai -m $(fortune -s) -p
		case 1
			fortune -s | cowsay -r | lolcat
		case 2
			colorscript random
		case 3
			fastfetch

	# if test $number -lt 25
	# 	cbonsai -m $(fortune -s) -p
	# else if test $number -lt 50
	# 	fortune -s | cowsay -r | lolcat
	# else if test $number -lt 75
	# 	colorscript random
	# else 		
	# 	fastfetch
	end
end

#source /usr/share/cachyos-fish-config/cachyos-config.fish
# overwrite greeting
# potentially disabling fastfetch

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
	end
end

# Set up fzf key bindings
fzf --fish | source

# Set default fzf bevior
export FZF_DEFAULT_OPTS="--layout reverse --style full"
export EDITOR=micro

# Set yazi to cd into selected directory
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end 

#aliases
alias sudo="sudo -E"
alias KQuantizer="/home/kanvolu/Documents/Dev_Projects/kquantizer/build/KQuantizer"
#export CONDA_AUTO_ACTIVATE_BASE=false
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /home/kanvolu/anaconda3/bin/conda
#     eval /home/kanvolu/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# else
#     if test -f "/home/kanvolu/anaconda3/etc/fish/conf.d/conda.fish"
#         . "/home/kanvolu/anaconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH "/home/kanvolu/anaconda3/bin" $PATH
#     end
# end

# <<< conda initialize <<<


# Created by `pipx` on 2025-09-05 22:43:22
set PATH $PATH /home/kanvolu/.local/bin

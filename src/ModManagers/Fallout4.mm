. ~/bin/data/modli/functions

validatemod(){
	modcontents=$(7z l "$MOD" | grep -A 1000 "^----" | grep -B 1000 "^----" | grep -v "^----" | egrep "^([^/]*/?){1}$" | awk '{print $6}')
        for path in $modcontents; do
		if [[ $path != Data ]]; then
			#mod is invalid
                	return 1
		fi
        done
        #mod is valid
	return 0
}

#process the options
case "$1" in 
	--Installmod)
		Installmod
		if [[ $? -ne 0 ]]; then
			echo "modli: ERR: $mod was not installed."
			return 1
		else
			echo "modli: mod was successfully installed"
		fi
		shift 2
		;;
	--Uninstallmod)
		Uninstallmod
		if [[ $? -ne 0 ]]; then
			echo "modli: ERR: mod was not removed"
			return 1
		else
			echo "modli: $mod was successfully removed"
		fi
		shift 2
		;;
	--Installscript)
		Installscript
		if [[ $? -ne 0 ]]; then
			echo "modli: ERR: mod not installed properly"
		fi
		shift 2
		;;
	-i)
		install
		if [[ $? -ne 0 ]]; then
			echo "modli: ERR: $mod was not installed to $GAME_NAME"
		fi
		return 0
		shift 2
		;;
	-r)
		remove
		if [[ $? -ne 0 ]]; then
			echo "modli: ERR: $mod was not removed from $GAME_NAME"
			return 1
		else
			echo "modli: $mod was removed from mods.stage but is still launched to $GAME_NAME"
		fi
		return 0
		shift 2
		;;
	--Launch)
		Launch
		shift 2
		;;
	*)
		echo "Invalid option"
		return 1
	;;
esac

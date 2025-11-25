##Checks whether the mod may be a script extender or an ENB mod
checkTrivialMod() {
	##Check if MOD is an ENB mod
	7z l "$MOD" | grep -iq enb
	if [ $? -eq 0 ]; then
		echo "modli: WARNING: This mod may be an ENB mod and cannot be installed as a raw mod. It must be installed with a custom script"
		return 1
	fi
	##Check if MOD is a script extender
	7z l "$MOD" | grep -q 'f4se_loader.exe'
	if [ $? -eq 0 ]; then
		echo "modli: WARNING: this is a script extender and cannot be installed as a raw mod It must be installed with a custom script"
		return 1
	fi
	
}

validatemod() {
	##Matches 'yyyy-mm-dd hh:mm:ss D' at the start of each line. Example match: 2000-01-01 00:00:00 D 
	regex="^[[:digit:]]\{4\}\(-[[:digit:]]\{2\}\)\{2\} [[:digit:]]\{2\}:[[:digit:]]\{2\}:[[:digit:]]\{2\} [D.]"
	contents="$(7z l "$MOD" | tac | grep -e "$regex" | awk '{print $NF}')"
	##Ensures MOD is a 7z file
	if [[ "${MOD##*.}" != 7z ]]; then
		return 1
	fi
	##Checks that root Data has no siblings
	if [ $(echo "$contents" | grep -vc '/') -gt 1 ]; then
		return 2
	fi
	##Checks that root file is named Data
	if [[ ! "$(echo "$contents" | sed -n 1p)" == "Data" ]]; then
		return 3
	fi
	
        #mod is valid
	return 0
}

#process the options
case $cmd in 
	-i)
		install
		if [[ $? -ne 0 ]]; then
			echo "modli: ERR: $mod was not installed." >&2
			return 1
		else
			echo "modli: $mod was installed to $GAME_NAME"
		fi
		shift 2
		;;
	-u)
		uninstall
		if [[ $? -ne 0 ]]; then
			echo "modli: ERR: mod was not removed" >&2
			return 1
		else
			echo "modli: $mod was removed from $GAME_NAME"
		fi
		shift 2
		;;
	-rs)
		runScript
		if [[ $? -ne 0 ]]; then
			echo "modli: ERR: mod not installed properly"
		fi

		shift 2
		;;
	-a)
		addToStage
		if [[ $? -ne 0 ]]; then
			echo "modli: ERR: $mod was not installed to $GAME_NAME"
		fi
		return 0
		shift 2
		;;
	-r)
		removeFromStage
		if [[ $? -ne 0 ]]; then
			echo "modli: ERR: $mod was not removed from $GAME_NAME's stage"
			return 1
		else
			echo "modli: $mod was removed from mods.stage"
		fi
		return 0
		shift 2
		;;
	--Launch)
		Launch
		shift 2
		;;
	*)
		echo "modli: ERR: Invalid option $cmd" >&2
		return 1
	;;
esac

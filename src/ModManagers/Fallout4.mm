. ~/bin/data/modli/functions

#process the options
case "$1" in 
	-l)
	listmods 
	shift 2
	;;
	-c)
	check
	shift 2
	;;
	-i)
	installmod
	shift 2
	;;
	--Launch) #launch the stage
	for file in "$GAMEPATH/mods.stage"/*; do
                cp -r "$file"/* "$GAMEPATH"/
                if [[ $? -ne 0 ]]; then
			7z x "$MOD" -o"$MODPATH/$mod" -y &> /dev/null
                        echo "modli: ERR in launching stage folder"
                        return 1
                fi
        done
        echo "modli: Stage file was successfully launched"
        return 0
	shift 2
	;;
	-u)
	uninstallmods	
	shift 2
	;;
	--Remove) #Remove the stage
	for mod in "$GAMEPATH/mods.stage"/*; do
                find "$mod"/Data -type f -exec rm -fr "$GAMEPATH/{}" \;
        done
        echo "modli: Stage file removed from $GAME_NAME. Empty directories may exist"
        return 0
	shift 2
	;;
	--Installscript) #Install a script extender. Should be called once per and immediately following a launch call
	if [[ $SCRIPTEXTENDER != "none" ]]; then
		echo "modli: WARNING: CANNOT CHANGE MOD MANAGER WITHOUT REMOVING THE STAGE"
		return 1
	fi
	if [[ ! -f "$MOD" ]]; then
		echo "modli: ERR: $MOD was not found"
		return 1
        fi
	mkdir $root/tmp
		cp $MOD $root/tmp/$(basename "$MOD")
		mod=$(basename "$mod")
        	7z x $root/tmp/$(basename "$MOD") -o$root/tmp/"$mod" -y &> /dev/null
		mv $root/tmp/"$mod"/f4se_0_07_02/f4se_1_10_984.dll "$GAMEPATH"/
		rm "$GAMEPATH"/Fallout4Launcher.exe &> /dev/null
		mv $root/tmp/"$mod"/f4se_0_07_02/f4se_loader.exe "$GAMEPATH"/Fallout4Launcher.exe
		mv $root/tmp/"$mod"/f4se_0_07_02/Data/Scripts "$GAMEPATH"/Data/
	rm -dR $root/tmp
	SCRIPTEXTENDER=$(basename "$mod")
	updatestatus
	
	echo "modli: $mod Script Extender installed."
	return 0
	shift 2
	;;
	--Install)
	Install
	shift 2
	;;
	--Uninstall)
	Uninstall
	shift 2
	;;
	*)
	echo "Invalid option"
	return 1
	;;
esac

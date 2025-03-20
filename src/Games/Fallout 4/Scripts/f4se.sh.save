##Custom script example that installs the Fallout 4 Script Extender. 

##Check if script extender is already installed	
if [[ -f "$GAMEPATH/f4se_1_10_984.dll" ]]; then
	echo "modli: F4SE is already installed"
	return 0
fi

##extract and copy the files
7z x "$root/Games/$GAME_NAME/Scripts/data/F4SE.7z" -o"$root/Games/$GAME_NAME/Scripts/data/" &>/dev/null
cp -r "$root/Games/$GAME_NAME/Scripts/data/F4SE/f4se_0_07_02/Data" "$GAMEPATH/"
cp "$root/Games/$GAME_NAME/Scripts/data/F4SE/f4se_0_07_02/f4se_1_10_984.dll" "$GAMEPATH/"

##THIS WORKS WITH PROTON 9.0.3; CHANGE HOW TO IMPLEMENT THE LAUNCHER IF NECESSARY IN THE FUTURE##
##Proton runs the file named Fallout4Launcher.exe, so to run the script extender, the default game launcher must be deleted and the script extender renamed to Fallout4Launcher.exe
##The problem is this does not replace the default launcher, or even preserve this. Users are encouraged to replace the following line with code that preserves the original
##launcher and allow for installation. It might be a good idea to create a new script for installing the default launcher.
rm "$GAMEPATH/Fallout4Launcher.exe"
cp "$root/Games/$GAME_NAME/Scripts/data/F4SE/f4se_0_07_02/f4se_loader.exe" "$GAMEPATH/Fallout4Launcher.exe"

#Delete the files
rm -dR "$root/Games/$GAME_NAME/Scripts/data/F4SE"

return 0

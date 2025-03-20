##Custom script example that installs the Fallout 4 Script Extender.
. "$root/Games/script-functions" 

##Check if script extender is already installed	
#if [[ -f "$GAMEPATH/f4se_1_10_984.dll" ]]; then
#	echo "modli: F4SE is already installed"
#	return 0
#fi

##THIS WORKS WITH PROTON 9.0.3; CHANGE HOW TO IMPLEMENT THE LAUNCHER IF NECESSARY IN THE FUTURE##
##Proton runs the file named Fallout4Launcher.exe, so to run the script extender, the default game launcher must be deleted and the script extender renamed to Fallout4Launcher.exe
##The script extender exe has already been renamed.
##The problem is this does not replace the default launcher, or even preserve it. Users are encouraged to replace the following line with code that preserves the original
##launcher and allow for installation. It might be a good idea to create a new script for installing the default launcher.
rm "$GAMEPATH/Fallout4Launcher.exe"

##extract and copy the files
extract F4SE.7z #f4se
install  "F4SE/Data"
install "F4SE/f4se_1_10_984.dll"
install "F4SE/Fallout4Launcher.exe"
remove F4SE
return 0

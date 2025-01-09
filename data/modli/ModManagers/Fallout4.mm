. ~/bin/.data/modli/.functions

#process the options
case "$1" in 
	-l|--list)
	listmods 
	shift 2
	;;
	-c|--check)
	check
	shift 2
	;;
	-i|--install)
	installmod
	shift 2
	;;
	-I|--Launch)
	launch
	shift 2
	;;
	-u|--uninstall)
	uninstallmods	
	shift 2
	;;
	-R|--Remove)
	removestage
	shift 2
	;;
	*)
	echo "Invalid option"
	#exit 1
	;;
esac

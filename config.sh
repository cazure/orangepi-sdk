#!/bin/bash
echo "config Orange Pi SDK "
echo ""
sleep 0.3
echo "##########################################"
echo "The optional board has "
#echo "	[1].orange pi zero 32bit"
#echo "	[2].orange pi zero 64bit"
echo "	[3].orange pi lite" 
echo "	[4].orange pi one" 
echo "	[5].orange pi pc"
echo "	[6].orange pi puls" 
echo "	[7].orange pi 2"
echo ""
read -p "Please enter the board model : " model
echo "##########################################"
case "$model" in
	1 ) 
		board=orangepi-zero
		platform=sun8iw7p1				
	;;
	3 ) 
		board=orangepi-lite
		platform=sun8iw7p1	
	;;
	4 ) 
		board=orangepi-one
		platform=sun8iw7p1		
	;;
	5 ) 
		board=orangepi-pc
		platform=sun8iw7p1		
	;;
	6 ) 
		board=orangepi-puls
		platform=sun8iw7p1
	;;
	7 ) 
		board=orangepi-2
		platform=sun8iw7p1
	;;
	* ) 
		echo "you No choice !!!"
		echo "default config"	
		board=orangepi
		platform=sun8iw7p1	
	;;
esac

echo ""
echo "##########################################"
echo "The optional system has"
echo "	[1].debian 8 - jessie"
echo "	[2].debian 7 - wheezy"
echo "	[3].ubuntu 16.04 - xenial"
echo "	[4].ubuntu 15.10 - willy"
echo " "
read -p "Please enter the linux system type  : " model
echo "##########################################"
case "$model" in
	1 ) 
		system_type=debian
		system_version=jessie	
	;;
	2 ) 
		system_type=debian
		system_version=wheezy		
	;;
	3 ) 
		system_type=ubuntu
		system_version=xenial		
	;;
	4 ) 
		system_type=ubuntu
		system_version=willy
	;;		
	* ) 
		echo "you No choice !!!"
		echo "default config"
		system_type=debian
		system_version=jessie		
	;;
esac

touch ./board_config
chmod a+x ./board_config
echo "#!/bin/bash" > ./board_config
echo "export BOARD=$board" >> ./board_config
echo "export PLATFORM=$platform" >> ./board_config
echo "export OPI_SYSTEM_TYPE=$system_type" >> ./board_config
echo "export OPI_SYSTEM_VERSION=$system_version" >> ./board_config

echo ""
echo "you choice $board $system_type-$system_version linux"
echo ""
echo "Please run ./orangepi.sh make|build|inatll "
echo ""




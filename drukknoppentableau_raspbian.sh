#!/bin/bash

GPIO_EXPORT="/sys/class/gpio/export"
GPIO2="/sys/class/gpio/gpio2"
GPIO3="/sys/class/gpio/gpio3"
GPIO4="/sys/class/gpio/gpio4"
GPIO7="/sys/class/gpio/gpio7"
GPIO8="/sys/class/gpio/gpio8"
GPIO9="/sys/class/gpio/gpio9"
GPIO10="/sys/class/gpio/gpio10"
GPIO11="/sys/class/gpio/gpio11"
GPIO14="/sys/class/gpio/gpio14"
GPIO15="/sys/class/gpio/gpio15"
GPIO17="/sys/class/gpio/gpio17"
GPIO18="/sys/class/gpio/gpio18"
GPIO22="/sys/class/gpio/gpio22"
GPIO23="/sys/class/gpio/gpio23"
GPIO24="/sys/class/gpio/gpio24"
GPIO25="/sys/class/gpio/gpio25"
GPIO27="/sys/class/gpio/gpio27"


initalize() {
	echo "2" > $GPIO_EXPORT
	echo "3" > $GPIO_EXPORT
	echo "4" > $GPIO_EXPORT
	echo "7" > $GPIO_EXPORT
	echo "8" > $GPIO_EXPORT
	echo "9" > $GPIO_EXPORT
	echo "10" > $GPIO_EXPORT
	echo "11" > $GPIO_EXPORT
	echo "14" > $GPIO_EXPORT
	echo "15" > $GPIO_EXPORT
	echo "17" > $GPIO_EXPORT
	echo "18" > $GPIO_EXPORT
	echo "22" > $GPIO_EXPORT
	echo "23" > $GPIO_EXPORT
	echo "24" > $GPIO_EXPORT
	echo "25" > $GPIO_EXPORT
	echo "27" > $GPIO_EXPORT


	echo "in"  > "$GPIO2/direction"
	echo "in"  > "$GPIO3/direction"
	echo "in"  > "$GPIO4/direction"
	echo "out" > "$GPIO7/direction"
	echo "in"  > "$GPIO8/direction"
	echo "in"  > "$GPIO9/direction"
	echo "in"  > "$GPIO10/direction"
	echo "in"  > "$GPIO11/direction"
	echo "in"  > "$GPIO14/direction"
	echo "in"  > "$GPIO15/direction"
	echo "in"  > "$GPIO17/direction"
	echo "in"  > "$GPIO18/direction"
	echo "in"  > "$GPIO22/direction"
	echo "in"  > "$GPIO23/direction"
	echo "in"  > "$GPIO24/direction"
	echo "in"  > "$GPIO25/direction"
	echo "in"  > "$GPIO27/direction"

	echo "0" > $GPIO7/value
}

speel_een_track() {
	TRACK_FILE=$1
	sudo -u pi mplayer $TRACK_FILE
}

speel_tracks() {
	TRACKNR=$1

	echo "1" > $GPIO7/value
	case $1 in
		1) speel_een_track /tmp/track1.m4v ;;
		2) speel_een_track /tmp/track2.m4v ;;
		3) speel_een_track /tmp/track3.m4v ;;
		4) speel_een_track /tmp/track4.m4v ;;
		5) speel_een_track /tmp/track5.m4v ;;
		6) speel_een_track /tmp/track6.m4v ;;
		7) speel_een_track /tmp/track7.m4v ;;
		8) speel_een_track /tmp/track8.m4v ;;
		9) speel_een_track /tmp/track9.m4v ;;
		10) speel_een_track /tmp/track10.m4v ;;
		11) speel_een_track /tmp/track11.m4v ;;
		12) speel_een_track /tmp/track12.m4v ;;
		13) speel_een_track /tmp/track13.m4v ;;
		14) speel_een_track /tmp/track14.m4v ;;
		15) speel_een_track /tmp/track15.m4v ;;
		16) speel_een_track /tmp/track16.m4v ;;
		*) echo "Geen idee wat ik moet doen" ;;
	esac
	echo "0" > $GPIO7/value
}

debug() {
	cat $GPIO2/value
	cat $GPIO3/value
	cat $GPIO4/value
	cat $GPIO8/value
	cat $GPIO9/value
	cat $GPIO10/value
	cat $GPIO11/value
	cat $GPIO14/value
	cat $GPIO15/value
	cat $GPIO17/value
	cat $GPIO18/value
	cat $GPIO22/value
	cat $GPIO23/value
	cat $GPIO24/value
	cat $GPIO25/value
	cat $GPIO27/value
}

initalize
echo "Initialized..."
# debug


while [ true ]; do
	PIN2=$(cat $GPIO2/value)
	if [ $PIN2 -eq 1 ]; then
		speel_tracks 1
	fi
	PIN3=$(cat $GPIO3/value)
	if [ $PIN3 -eq 1 ]; then
		speel_tracks 2
	fi
	PIN4=$(cat $GPIO4/value)
	if [ $PIN4 -eq 1 ]; then
		speel_tracks 3
	fi
	PIN8=$(cat $GPIO8/value)
	if [ $PIN8 -eq 1 ]; then
		speel_tracks 4
	fi
	PIN9=$(cat $GPIO9/value)
	if [ $PIN9 -eq 1 ]; then
		speel_tracks 5
	fi
	PIN10=$(cat $GPIO10/value)
	if [ $PIN10 -eq 1 ]; then
		speel_tracks 6
	fi
	PIN11=$(cat $GPIO11/value)
	if [ $PIN11 -eq 1 ]; then
		speel_tracks 7
	fi
	PIN14=$(cat $GPIO14/value)
	if [ $PIN14 -eq 1 ]; then
		speel_tracks 8
	fi
	PIN15=$(cat $GPIO15/value)
	if [ $PIN15 -eq 1 ]; then
		speel_tracks 9
	fi
	PIN17=$(cat $GPIO17/value)
	if [ $PIN17 -eq 1 ]; then
		speel_tracks 10
	fi
	PIN18=$(cat $GPIO18/value)
	if [ $PIN18 -eq 1 ]; then
		speel_tracks 11
	fi
	PIN22=$(cat $GPIO22/value)
	if [ $PIN22 -eq 1 ]; then
		speel_tracks 12
	fi
	PIN23=$(cat $GPIO23/value)
	if [ $PIN23 -eq 1 ]; then
		speel_tracks 13
	fi
	PIN24=$(cat $GPIO24/value)
	if [ $PIN24 -eq 1 ]; then
		speel_tracks 14
	fi
	PIN25=$(cat $GPIO25/value)
	if [ $PIN25 -eq 1 ]; then
		speel_tracks 15
	fi
	PIN27=$(cat $GPIO27/value)
	if [ $PIN27 -eq 1 ]; then
		speel_tracks 16
	fi
done


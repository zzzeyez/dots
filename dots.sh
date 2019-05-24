#!/usr/bin/env bash
# author daniel neemann (@zzzeyez)
# symlink my dotfiles
# get dotfiles directory, even if this script is symlinked

# screenshot()
wallpaper=/tmp/wallpaper.png

# list files
lists_directory=install

# install()
brew_packages=brew_packages
python_packages=python_packages
macos_settings=macos_settings

# copy()
my_github=zzzeyez
git_clones=git_clones
dotfiles=dotfiles

# remove()
save_home=save_home
save_library=save_library

# recreate()
make_directories=make_directories

# backup()
SSD=xanthia
backup_exclude=backup_exclude

screenshot() {
	# screenshot
	screencapture "$dots/screenshot/screenshot.png"
		
	# wallpaper
	cp "$wallpaper" "$dots/screenshot/wallpaper.png"
		
	# wal colors
	cp "${HOME}/.cache/wal/colors.json" "$dots/screenshot/colors.json"
		
	# notify
	if [[ "$notify" ]] ; then
		notify-send -m "dotfiles updated" -i "$dots/screenshot/screenshot.png"
	fi
}

setup() {
	
	# get absolute path of dots folder
	source="${BASH_SOURCE[0]}"
	while [ -h "$source" ]; do
		dots="$( cd -P "$( dirname "$source" )" >/dev/null 2>&1 && pwd )"
		source="$(readlink "$source")"
		[[ $source != /* ]] && source="$dots/$source"
	done
		
	# dots is now an absolute path
	dots="$( cd -P "$( dirname "$source" )" >/dev/null 2>&1 && pwd )"
		
	# escape sequences
	red="\e[31m"
	grn="\e[32m"
	ylw="\e[33m"
	blu="\e[34m"
	pur="\e[35m"
	cyn="\e[36m"
	gry="\e[90m"
	rst="\e[0m"
		
	# build the bar
	bar="▔▔▔▔▔▔"
	bar="$red$bar$grn$bar$ylw$bar$blu$bar$pur$bar$cyn$bar$rst"
		
	# clear the screen
	clear
}

get_password() {
	title="sudo"
	title
		
	question 'some features require sudo.  log in for the duration of this installation?'
	if [[ "$answer" ]] ; then
			
		# log in and stay logged in
		sudo -v
		while true; do sudo -n true; sleep 60; kill -0 "$$"\
			|| exit; done 2>/dev/null &
			
	fi
}

title() {
	if [[ $# -ne 0 ]] ; then
		printf "%s\n$bar\n" "$1"
	else
		printf "%s\n$bar\n" "$title"
	fi
}

message() {
	if [[ $# -ne 0 ]] ; then
		echo "$1"
		echo ""
	else
		echo "$message"
		echo ""
	fi
}

question() {
	printf "%s\n(y/n) " "$1"
	unset answer
	read -r in
	if [[ "$in" = y* ]] ; then
		answer=true
	else
		unset answer
	fi
	echo ""
}

# turn lists into variables ($list, $line, $entry) 
get_list() {
	echo ""
}

install() {
	mode="$1"
	title "$mode"
	question "do you want to install $mode?"
	if [[ "$answer" ]] ; then
		$test bash "$dots/$lists_directory/$mode"
#	else
#		 if [[ ! "$answer" ]] ; then
#			answer=skipped
#		fi
		
	fi
}

# delete everything except those defined in list file $1
remove() {
	mode="$1"
	title "$mode"
	
	# check which folder to delete and ask to delete
	if [[ "$mode" == $save_home ]] ; then
		question "do you want to delete your home?"
	elif [[ "$mode" == $save_library ]] ; then
		library="/Library"
		question "do you want to delete ~/Library?"
		sudo=sudo
	fi

	# permission granted
	if [[ "$answer" ]] ; then
		# get a list from $1
		list=(); while read -r; do list+=("$REPLY"); done < "$dots/$lists_directory/$mode"
			
		# pretty title
		title 'delete these'
		
		# turn array into `find` format
		for line in "${!list[@]}"
		do
			# ignore commented and empty lines
			if [[ ! "${list[line]}" == \#* ]] && [[ ! -z "${list[line]}" ]] ; then
				exclude[line]="-not -name ${list[line]}"
				include[line]="-or -name ${list[line]}"
			fi
		done

		# create list of files found that are not listed in $1
		deleted="$(find "${HOME}$library" -maxdepth 1\
			${exclude[@]}\
			-not -name "." -not -name "..")"
			
		# create list of files found that are also listed in $1
		# can't start `find` with `-or` 'til -name has been ran
		not_deleted="$(find "${HOME}$library" -maxdepth 1\
			-name dummy ${include[@]}\
			-not -name "." -not -name "..")"
			
		# confirm list
		printf "$gry$deleted$rst\n\n"
		title 'and keep these'
		printf "$gry$not_deleted$rst\n"
		question ''
			
		# permission granted
		if [[ "$answer" ]] ; then
			message 'deleting..'
			$sudo echo "$deleted" | $test awk '{system ("rm -rf \""$0"\"")}' &&
			message "finished"
		else
			message skipping..
		fi

		# DS Store
		if [[ "$mode" = save_home ]] ; then
			title DS_Store
			question 'do you want to delete all your DS_Store files?'
			if [[ "$answer" ]] ; then
				 $test find ${HOME}/.  -not -name Library -name '*.DS_Store' -type f -delete &&
				message finished
			fi
		fi
	fi
}

# recreate folders in home director (sourced from $1)
recreate() {
	title recreate
	question "do you want to rebuild your home?"

	# permission granted
	if [[ "$answer" ]] ; then
		mode=$1
		list=(); while read -r; do list+=("$REPLY"); done < "$dots/$lists_directory/$mode"

		# turn array into `find` format
		for line in "${!list[@]}"
		do
			# ignore commented and empty lines
			if [[ ! "${list[line]}" == \#* ]] && [[ ! -z "${list[line]}" ]] ; then
				directories[line]="${HOME}/${list[line]}"
			fi
		done

		# ask permission
		printf "$gry%s$rst\n" "${directories[@]}"
		echo ""
		question "do you want to recreate these?"

		# permission granted
		if [[ "$answer" ]] ; then
			$test mkdir -p "${directories[@]}" &&
			message "directories created"
		else

			# denied
			message "skipping.."
		fi
	fi
}

# two-argument functions
# called by git_clones, dotfiles
copy() {
	mode=$1
	# perform task?
	if [[ "$mode" == $git_clones ]] ; then
		title "github repositories"
		question "do you want to clone your github repos?"
	elif [[ "$mode" == $dotfiles ]] ; then
		title "symlink dotfiles"
		question "do you want to symlink your dotfiles?"
	fi
		
	# permission granted
	if [[ "$answer" ]] ; then
		
		# get variables from list file
		list=(); while read -r; do list+=("$REPLY"); done < "$dots/$lists_directory/$mode"
		# separate the lines
		for line in "${list[@]}"
		do
				
			# turn string into array
			read -r -a entry <<< "$line"
				
			# check for titles
			if [[ $line == title* ]] ; then
				title=${line##*=}
				title
				
			# check for messages	
			elif [[ $line == message* ]] ; then
				message="${line##*=}"
				message
				
			# check for commands
			elif [[ $line == bash* ]] ; then
				command="${line##*bash }"
				$test $command
				
			# ignore comments and blank lines
			elif [[ ! "$line" == \#* ]] && [[ ! -z "$line" ]] ; then
				
				# answered yes..
				if [[ "$answer" ]] ; then
						
					# define vars
					if [[ "$mode" == $git_clones ]] ; then
						source="https://github.com/${entry[0]}"
						dest="${HOME}/${entry[1]}"
					elif [[ "$mode" == $dotfiles ]] ; then
						source="$dots/${entry[0]}"
						dest="${HOME}/${entry[1]}"
					fi
						
					# ask for permission
					echo "$source ->"
					question "$dest"
					if [[ "$answer" ]] ; then
						
						# ask to overwrite
						if [[ -d "$dest" ]] || [[ -f "$dest" ]] || [[ -L "$dest" ]] ; then
							question "$dest exists..  overwrite?"
								
							# overwrite
							if [[ "$answer" ]] ; then
								$test rm -rf "$dest"
							fi
						fi
							
						# tasks
						# git_clones
						if [[ "$mode" == $git_clones ]] ; then
							$test git clone "$source" "$dest" &&
							message "cloned repo"
							
						# dotfiles
						elif [[ "$mode" == $dotfiles ]] ; then
							$test ln -s "$source" "$dest" &&
							message "created symlink"
						fi
							
					# skip
					# if we don't turn $answer back on then it skips all other questions too
					else
						message "skipping.."
						if [[ ! "$answer" ]] ; then
							answer=skipped
						fi
					fi 
				else
					
				# skip
				# if we don't turn $answer back on then it skips all other questions too
				message "skipping.."
				if [[ ! "$answer" ]] ; then
					answer=skipped
				fi
			fi
		fi
		done
	fi
}

update() {
		
	# homebrew update
	$test brew update
	$test brew upgrade
	$test brew cleanup
		
	# python update
	# get variables from list file
	list=(); while read -r; do list+=("$REPLY"); done < "$dots/$lists_directory/$python_packages"
		
	# separate the lines
	for line in "${list[@]}"
	do
			
		# turn string into array
		read -r -a entry <<< "$line"
			
		# ignore commented or empty lines
		if [[ ! "$line" == \#* ]] && [[ ! -z "$line" ]] ; then
				
			# pip3 -q install --upgrade package
			$test ${entry[0]} -q ${entry[1]} --upgrade ${entry[2]}
		fi
			
	done
		
	# github update
	# get variables from list file
	list=(); while read -r; do list+=("$REPLY"); done < "$dots/$lists_directory/$git_clones"
		
	# separate the lines
	for line in "${list[@]}"
	do
			
		# turn string into array
		read -r -a entry <<< "$line"
			
		# ignore my packages and commented or empty
		if [[ ! "${entry[0]}" == $my_github* ]] && [[ ! "$line" == \#* ]] && [[ ! -z "$line" ]]
		then
			
		# move to the directory and pull it
		echo ""
		message "updating ${entry[0]}.."
		$test cd "${HOME}/${entry[1]}" &&
		$test git pull origin master
			
		fi
	done
	
	# conclude
	$test cd "${HOME}"
	notify-send "finished updating system"
}

backup() {
	title backup
	# check for ssd
	if [[ -d /Volumes/$SSD ]] ; then
		
		# ask permission
		question 'do you want to backup your home?'

		#  permission granted
		if [[ "$answer" ]] ; then
			mode="$1"

			# create variables
			SRC="${HOME}"
			DST="/Volumes/$SSD"

			# create array from file $1
			list=(); while read -r; do list+=("$REPLY"); done < "$dots/$lists_directory/$mode"
			
			# pretty title
			message 'this will backup everything from home except:'
			printf "$gry%s\n$rst" "${list[@]}"
			question ''

			# permission granted
			if [[ "$answer" ]] ; then
				$test message "backing up $SRC to $DST"
				$test notify-send "backing up $SRC to $DST"

				# append rsync flags
				for i in "${!list[@]}"
				do
					exclude[i]="--exclude ${list[i]}"
				done

				# exclude those defined in file $1
				# copy and clean (add --dry-run to beginning to test)
				$test rsync -avrh --stats                          \
					--delete                                       \
					--log-file="${HOME}/downloads/.backup.log"     \
					${exclude[@]}                                  \
					$SRC                                           \
					$DST &&

				# unmount xanthia
				message "could not unmount ssd.  finished syncing $SRC to $DST" &&
				notify-send "could not unmount ssd.  finished syncing $SRC to $DST"
				$test diskutil umount "$SSD" &&
				message "$SSD unmounted.  finished syncing $SRC to $DST" &&
				notify-send "$SSD unmounted.  finished syncing $SRC to $DST"

			fi
		fi
	else
		echo "xanthia was not found"
		notify-send "xanthia was not found"
	fi
}

flags() {
	while getopts snxbu opt; do
		case $opt in
			s) screenshot ; exit
			;;
			n) notify=on
			;;
			# $test is slipped in before all commands
			x) test=echo
			;;
			b) backup ; exit
			;;
			u)
				title "update"
				message "looking for updates.."
				notify-send "starting update"
				yes | remove "$save_home"
				yes | recreate "$make_directories"
				yes | copy "$dotfiles"
				yes | update
				yes | backup "$backup_exclude"
			exit
			;;
		esac
	done
}

setup
flags $@
get_password
remove "$save_home"
remove "$save_library"
recreate "$make_directories"
install "$brew_packages"
install "$python_packages"
install "$macos_settings"
copy "$git_clones"
copy "$dotfiles"
# needs prompt
# update
backup "$backup_exclude"

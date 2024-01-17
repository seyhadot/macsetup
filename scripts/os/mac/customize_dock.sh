#!/usr/bin/env bash
#
# ░█▀▄░█▀█░█▀▀░█░█░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀
# ░█░█░█░█░█░░░█▀▄░░░█░░░█░█░█░█░█▀▀░░█░░█░█
# ░▀▀░░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀
#
create_items() {

	large_blank='{tile-data={}; tile-type="spacer-tile";}'

	small_blank='{tile-data={}; tile-type="small-spacer-tile";}'

	launchpad=$(dock_item "/System/Applications/Launchpad.app")

	settings=$(dock_item "/System/Applications/System Settings.app")

	appstore=$(dock_item "/System/Applications/App Store.app")

	notes=$(dock_item "/System/Applications/Notes.app")

	firefox=$(dock_item "/Applications/Firefox Developer Edition.app")

	mail=$(dock_item "/Applications/Google Chrome.app")

	messages=$(dock_item "/System/Applications/Messages.app")

	messenger=$(dock_item "/Applications/Caprine.app")

	teams=$(dock_item "/Applications/Telegram.app")

	safari=$(dock_item "/Applications/Safari.app")

	fantastical=$(dock_item "/Applications/Github Desktop.app")

	reminders=$(dock_item "/System/Applications/Reminders.app")

	music=$(dock_item "/System/Applications/Music.app")

	plex=$(dock_item "/Applications")

	code=$(dock_item "/Applications/Visual Studio Code.app")

	# visualstudio=$(dock_item "/Application/Visual Studio (Preview).app")

	github=$(dock_item "/Applications/GitHub Desktop.app")

	gitkraken=$(dock_item "/Applications/GitKraken.app")

	alacritty=$(dock_item "/Applications/Alacritty.app")

	kitty=$(dock_item "/Applications/kitty.app")

	spotify=$(dock_item "/Applications/Spotify.app")

	discord=$(dock_item "/Applications/Discord.app")

}

dock_item() {
	printf "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>%s</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>" "$1"
}

customize_dock() {
	message "Customizing the dock"
	warning_message "Enter password to delete contents of dock and replace with new setup"

	create_items

	sudo su "$USER" -c 'defaults delete com.apple.dock persistent-apps'

	sudo su "$USER" -c "defaults write com.apple.dock persistent-apps -array 	\
'$launchpad' '$settings' '$appstore' '$small_blank' 																		\
'$messenger' '$teams' '$discord' '$mail' '$small_blank' 										\
'$safari' '$fantastical' '$notes' '$small_blank' 								\
 '$spotify' '$plex' '$small_blank' 																							\
'$code' '$github' '$small_blank' 													\
'$kitty'"

	success_message "Dock contents were updated. Restarting dock..."

	killall Dock
}

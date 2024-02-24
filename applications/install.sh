#!/usr/bin/env bash

FedoraApps=(
	"thunderbird"
	"shellcheck installName=ShellCheck"
)
LinuxApps=(
	"steam askConfirm"
	"inkscape"
	"vlc"
	"gimp"
)
MacApps=(
	"inkscape installOpt=--cask"
	"vlc installOpt=--cask"
	"gimp installOpt=--cask"
	"shellcheck"
)


# FIXME: installCommand can be the only option. E.g. askConfirm would be ignored if later.
AllOSApps=(
	"ffmpeg"
	"cmake"
	"fzf installCommand=\"git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --key-bindings --completion --no-update-rc --no-zsh --no-bash\""
)

echo
echo "Running applications install script"
echo

kernel="$(uname -s)"
case $kernel in
	"Linux")
		distro="$(grep "^NAME=" /etc/os-release)"
		case $distro in
			*"Fedora"*)
				installer="dnf"
				;;
			*"Mint"* | *"Ubuntu"*)
				installer="apt-get"
				;;
			*)
				>&2 echo "Unrecognised distro: $distro"
				exit 1
				;;
		esac
		;;
	"Darwin")
		installer="brew"
		;;
	*)
		>&2 echo "Unrecognised kernel: $kernel"
		exit 1
		;;
esac


needs_installed () {
	appRunName=$1
	if which "$appRunName" > /dev/null 2>&1
	then
		echo "$appRunName is already installed"
		return 1
	fi
	return 0
}


parse_app () {
	appArray=($@)
	runName=${appArray[0]}
	elements=("${appArray[@]:1}")
	installName="$runName"
	installOptionsArr=()
	if [[ ${elements[*]} == "installCommand="* ]]
	then
		echo "$runName" installComand="$installCommand"
	else
		for el in "${elements[@]}"
		do
			case $el in
				"installName="*)
					installName=${el:12}
					;;
				"askConfirm")
					askConfirm="confirm"
					;;
				"installOpt="*)
					installOptionsArr+=("${el:11}")
					;;
				*)
					>&2 echo "Bad element \"$el\" in (${appArray[*]})"
					exit 1
					;;
			esac
		done
		echo "$runName" "$installName" "$askConfirm" \""${installOptionsArr[*]}"\"
	fi
}


install_list () {
	appList=("$@")
	for app in "${appList[@]}"
	do
		appArray=("$app")
		appArrayStr=$(parse_app "${appArray[@]}")
		read -ra appArray <<< $appArrayStr
		appRunName="${appArray[0]}"
		if needs_installed "$appRunName"
		then
			if [[ ${appArray[1]} == "installCommand="* ]]
			then
				installCommand="${appArray[2]}"
				installCommand="${installCommand:15}"
				$installCommand
			else
				appInstallName="${appArray[1]}"

				if [[ "${appArray[2]}" == "confirm" ]]
				then
					confirm="${appArray[2]}"
					installOptions="${appArray[3]}"
				else
					installOptions="${appArray[2]}"
				fi


				if [ -n "${confirm+x}" ]
				then
					read -n1 -p "Do you want to install ${appRunName}? y/[n]" doit 
					case $doit in  
						y|Y)
							sudo $installer install "$installOptions" "$appInstallName"
							;;
						*)
							echo Skipping installing "$appRunName"
							;;
					esac
				else
					sudo $installer install "$installOptions" "$appInstallName"
				fi
			fi
		fi
	done
}

case $kernel in
	"Linux")
		install_list "${LinuxApps[@]}"
		if [[ $distro == *"Fedora"* ]]
		then
			install_list "${FedoraApps[@]}"
		fi
		;;
	"Darwin")
		install_list "${MacApps[@]}"
		;;
esac
install_list "${AllOSApps[@]}"


#!/bin/bash

if ( which wine );then
	echo wine installed
else
	echo Run brew install wine@staging
	exit -1
fi

rm -rf "${HOME}/YoiTV"
YOITV_SETUP_PATH="$(find $HOME -name 'YoiTV_1.0.0.2.exe.exe' -type f | tail -n 1)"
rm -rf "$HOME/.wine-YoiTV"
WINEPREFIX="${HOME}/.wine-YoiTV" wine "${YOITV_SETUP_PATH}"
YOITV_PATH="$(find $HOME -name 'YoiTV.exe' -type f | tail -n 1)"
WINEPREFIX="${HOME}/.wine-YoiTV" wine "${YOITV_PATH}"
cp -R "${HOME}/.wine-YoiTV/drive_c/users/$USER/AppData/Local/YoiTV" "${HOME}/YoiTV"

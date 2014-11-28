#!/bin/bash -e

if [[ $# -ne 3 ]]; then
	echo "Usage: $0 <first name> <last name> <email prefix>";
	exit 1;
fi

FIRSTNAME="$1"
LASTNAME="$2"
EMAIL="$3"

sed -e "s/FIRSTNAME/$FIRSTNAME/g" peerlibrary_card_front.svg | sed -e "s/LASTNAME/$LASTNAME/g" | sed -e "s/EMAIL/$EMAIL/g" > front.svg

/Applications/Inkscape.app/Contents/Resources/bin/inkscape --without-gui --export-pdf="$EMAIL.pdf" front.svg
/Applications/Inkscape.app/Contents/Resources/bin/inkscape --without-gui --export-pdf="back.pdf" peerlibrary_card_back.svg

rm -f front.svg

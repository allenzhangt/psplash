#!/bin/sh

set -e

if [ $# -lt 1 ]; then
    echo "Usage:"
    echo "$0 a.bmp"
    exit
fi

original_file='psplash-poky-img.h'
back_file=$original_file.bak

if [ ! -f $back_file ]; then
    cp $original_file $back_file
fi

input_file=$1

image_header_file="${input_file%%.*}"-img.h

echo $image_header_file

name="POKY_IMG"
gdk-pixbuf-csource --macros $input_file > $image_header_file.tmp
sed -e "s/MY_PIXBUF/${name}/g" -e "s/guint8/uint8/g" $image_header_file.tmp > $image_header_file && rm $image_header_file.tmp

cp $image_header_file $original_file

sed -i 1i"/* from $image_header_file */" $original_file

echo "Done..."
echo "You can start to build psplash."



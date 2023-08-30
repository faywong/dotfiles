ffmpeg_transform() {
    set -x
    filename=$(basename -- "$1")
    extension="${filename##*.}"
    filename="${filename%.*}"
    ffmpeg -i $1 -vf "transpose=2" "${filename}_cc90.${extension}"
}

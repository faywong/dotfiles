ffmpeg_transform() {
    # ref: https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
    filename=$(basename -- "$1")
    extension="${filename##*.}"
    filename="${filename%.*}"
    ffmpeg -i $1 -vf "transpose=2" "${filename}_cc90.${extension}"
}

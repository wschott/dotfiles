# open either a given folder or the current in Sublime Text
subl() {
    command subl -n "${1:-"."}"
}

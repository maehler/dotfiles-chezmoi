INTERNAL_DISPLAY=eDP-1
INTERNAL_DISPLAY_SCALE=1.33

function mode_close() {
    N_MONITORS=$(hyprctl monitors -j | jq '. | length')
    if [[ N_MONITORS -gt 1 ]]; then
        hyprctl keyword monitor "$INTERNAL_DISPLAY, disable"
    fi
}

function mode_open() {
    hyprctl keyword monitor "$INTERNAL_DISPLAY, 2944x1840@90, auto, $INTERNAL_DISPLAY_SCALE"
}

function notify_user() {
    notify-send -u low -t 2000 "$1" "$2"
}

case $1 in
    close)
        mode_close
        notify_user "Clamshell Mode" "Laptop screen disabled"
        ;;
    open)
        mode_open
        notify_user "Laptop Mode" "Laptop screen enabled"
        ;;
    *)
        echo "usage: $0 [open|close]"
        exit 1
        ;;
esac

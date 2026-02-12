n_monitors=$(hyprctl monitors -j | jq '. | length')

current_workspace=$(hyprctl activeworkspace -j | jq .id)
current_monitor=$(hyprctl activeworkspace -j | jq .monitorID)
next_monitor=$((($current_monitor + 1) % (n_monitors)))

echo "switching workspace ${current_workspace} to next monitor (current monitor: ${current_monitor}, next monitor: ${next_monitor})"

hyprctl dispatch moveworkspacetomonitor ${current_workspace} ${next_monitor}

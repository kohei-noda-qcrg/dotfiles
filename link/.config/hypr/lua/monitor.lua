hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

hl.on("monitor.layout_changed", function()
    hl.exec_cmd("bash -c '(flock -n 9 || exit 0; killall -q waybar; while pgrep -x waybar >/dev/null; do sleep 0.1; done; exec waybar 9>&-) 9>/tmp/waybar_restart.lock &'")
end)

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

hl.on("monitor.layout_changed", function()
    hl.exec_cmd("pkill -USR2 waybar")
end)

local programs = require("lua.programs")

hl.on("hyprland.start", function()
    hl.exec_cmd(programs.terminal)
    hl.exec_cmd("waybar & hypridle & fcitx5 -d & swaync")
end)

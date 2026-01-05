-- Always show device selection for kde-connect plugin
require("kdeconnect-send"):setup({
    auto_select_single = false,
})

require("git"):setup()

require("custom-shell"):setup({
    history_path = "default",
    save_history = true,
    interactive = true,
})

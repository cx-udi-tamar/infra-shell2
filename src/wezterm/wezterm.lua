local wezterm = require 'wezterm'
local commands = require 'commands'
local constants = require 'constants'
local config = wezterm.config_builder()

-- Font settings
config.font_size = 20
config.line_height = 1.2
config.font = wezterm.font 'Hack Nerd Font'
config.font_rules = {
  {
    italic = true,
    intensity = 'Bold',
    font = wezterm.font('Hack Nerd Font', {
      italic = true,
      weight = 'Regular',
    }),
  },
}

-- Set the built-in color scheme
config.color_scheme = "Catppuccin Mocha"  -- or Macchiato, Frappe, Latte

-- Appearance
config.default_cursor_style = "BlinkingUnderline"
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.window_background_image = constants.bg_image
config.macos_window_background_blur = 40

-- Miscellaneous settings
config.max_fps = 120
config.prefer_egl = true

-- Skip confirmation on quitting
config.window_close_confirmation = "NeverPrompt"

-- Add keyboard shortcut to reload the config
config.keys = config.keys or {}
table.insert(config.keys, {
  key = "r",
  mods = "CMD",
  action = wezterm.action.ReloadConfiguration,
})

-- Custom commands
wezterm.on('augment-command-palette', function()
  return commands
end)

-- Maximize the window on startup
wezterm.on("gui-startup", function(cmd)
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config

---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")

local themes_path = "~/.config/awesome/tema/"
local theme = {}

theme.font          = "sans 8"
theme.bg_normal     = "#151515"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal
theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"
theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#000000"
theme.border_focus  = "#000000"
theme.border_marked = "#000000"

local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

theme.wallpaper = themes_path.. "wallpaper.jpg" --themes_path.."default/background.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

theme.layout_fairh      = themes_path.. "layouts/fairh.png"
theme.layout_fairv      = themes_path.. "layouts/fairv.png"
theme.layout_floating   = themes_path.. "layouts/floating.png"
theme.layout_magnifier  = themes_path.. "layouts/magnifier.png"
theme.layout_max        = themes_path.. "layouts/max.png"
theme.layout_fullscreen = themes_path.. "layouts/fullscreen.png"
theme.layout_tilebottom = themes_path.. "layouts/tilebottom.png"
theme.layout_tileleft   = themes_path.. "layouts/tileleft.png"
theme.layout_tile       = themes_path.. "layouts/tile.png"
theme.layout_tiletop    = themes_path.. "layouts/tiletop.png"
theme.layout_spiral     = themes_path.. "layouts/spiral.png"
theme.layout_dwindle    = themes_path.. "layouts/dwindle.png"
theme.layout_cornernw   = themes_path.. "layouts/cornernw.png"
theme.layout_cornerne   = themes_path.. "layouts/cornerne.png"
theme.layout_cornersw   = themes_path.. "layouts/cornersw.png"
theme.layout_cornerse   = themes_path.. "layouts/cornerse.png"

theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)
theme.icon_theme = nil

return theme
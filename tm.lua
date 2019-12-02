local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local os, math, string = os, math, string

---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}
theme.dir           = os.getenv("HOME") .. "/.config/awesome/themes/darkblue"
theme.wallpaper     = theme.dir .. "/wallpapers/wall_0.png"
theme.font          = "sans 8"
--theme.wallpaper = "~/.config/awesome/src/aestetica3.jpg"


-- -- VENTANAS
-- theme.bg_normal     = "#151515" 
-- theme.bg_focus      = "#151515" 
-- theme.bg_urgent     = "#9e0000" 
-- theme.bg_minimize   = "#444444"
-- theme.bg_systray    = theme.bg_normal

-- -- COLOR DE FUENTES
-- theme.fg_normal     = "#ffffff"
-- theme.fg_focus      = "#ffffff"
-- theme.fg_urgent     = "#ffffff"
-- theme.fg_minimize   = "#ffffff"

-- -- BORDES
-- theme.useless_gap   = dpi(0)
-- theme.border_width  = dpi(1)
-- theme.border_normal = "#222222"
-- theme.border_focus  = "#222222"
-- theme.border_marked = "#222222"

-- -- TAGLIST
-- -- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- theme.taglist_bg_focus = "#555555";
-- theme.taglist_fg_focus = "#ffffff";
-- theme.taglist_bg_urgent = "#ff0000";
-- theme.taglist_fg_urgent = "#ffffff";
-- theme.taglist_bg_occupied = "#151515";
-- theme.taglist_fg_occupied = "#ffffff";
-- theme.taglist_bg_empty = "#151515";
-- theme.taglist_fg_empty = "#555555";

-- -- tasklist_[bg|fg]_[focus|urgent]

-- -- titlebar_[bg|fg]_[normal|focus]
-- theme.titlebar_bg_focus = "#151515";
-- theme.titlebar_fg_focus = "#ffffff";

-- -- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- -- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- theme.mouse_finder_color = "#ff0000";
-- theme.mouse_finder_timeout = "#ff0000";
-- theme.mouse_finder_animate_timeout = "#ff0000";
-- theme.mouse_finder_radius = "#ff0000";
-- theme.mouse_finder_factor = "#ff0000";

-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

theme.bg_normal                                 = "#32302f"
theme.fg_normal                                 = "#a89984"
theme.bg_focus                                  = "#32302f"
theme.fg_focus                                  = "#232323"
theme.bg_urgent                                 = "#C92132"
theme.fg_urgent                                 = "#282828"
theme.fg_widget                                 = "#32302f"
theme.taglist_bg_focus                          = "#4e9699" 
theme.taglist_fg_focus                          = "#282828"
theme.taglist_bg_occupied                       = "#2b5355"
theme.taglist_fg_occupied                       = "#282828"
theme.taglist_bg_empty                          = "#32302f"
theme.taglist_fg_empty                          = "#ebdbb2"
theme.taglist_bg_urgent                         = "#C92132"
theme.taglist_fg_urgent                         = "#282828"
theme.tasklist_bg_normal                        = "#32302f"
theme.tasklist_fg_normal                        = "#ebdbb2"
theme.tasklist_bg_focus                         = "#32302f"
theme.tasklist_fg_focus                         = "#ebdbb2"
theme.tasklist_bg_urgent                        = "#C92132"
theme.tasklist_fg_urgent                        = "#32302f"
theme.border_width                              = 0
theme.border_normal                             = "#32302f"
theme.border_focus                              = "#3f3f3f"
theme.border_marked                             = "#CC9393"
theme.titlebar_bg_normal                        = "#3f3f3f"
theme.titlebar_fg_normal                        = "#282828"
theme.titlebar_bg_focus                         = "#2b5355"
theme.titlebar_fg_focus                         = "#282828"
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
theme.menu_height                               = dpi(15)
theme.menu_width                                = dpi(100)

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Layout icons
theme.layout_tile                               = theme.dir .. "/icons/layouts/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/layouts/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/layouts/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/layouts/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/layouts/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/layouts/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/layouts/spiral.png"
theme.layout_centerwork                         = theme.dir .. "/icons/layouts/centerwork.png"
theme.layout_dwindle                            = theme.dir .. "/icons/layouts/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/layouts/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/layouts/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/layouts/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/layouts/floating.png"

--Widget icons
theme.widget_ac                                 = theme.dir .. "/icons/widgets/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/widgets/battery.png"
theme.widget_battery_medium                     = theme.dir .. "/icons/widgets/battery_medium.png"
theme.widget_battery_low                        = theme.dir .. "/icons/widgets/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/widgets/battery_empty.png"
theme.widget_battery_no                         = theme.dir .. "/icons/widgets/battery_no.png"

theme.widget_cpu                                = theme.dir .. "/icons/widgets/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/widgets/temp.png"
theme.widget_net                                = theme.dir .. "/icons/widgets/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/widgets/ssd.png"
theme.widget_clock                              = theme.dir .. "/icons/widgets/clock.png" 
theme.widget_music                              = theme.dir .. "/icons/widgets/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/widgets/note_on.png"
theme.widget_music_pause                        = theme.dir .. "/icons/widgets/pause.png"
theme.widget_music_stop                         = theme.dir .. "/icons/widgets/stop.png"

theme.widget_vol                                = theme.dir .. "/icons/widgets/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/widgets/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/widgets/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/widgets/vol_mute.png"

theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 7

theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"

theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
--theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"

theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
--theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
--theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"

theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
--theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
--theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"

theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
--theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
--theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"

theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
--theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"


-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
--theme.icon_theme = nil

-- colors
theme.green          = "#00b159"
theme.red            = "#d64d4d"
theme.yellow         = "#cc9c00"
theme.blue           = "#428bca"
theme.darkred        = "#c92132"
theme.darkgreen      = "#4d7358"
theme.darkyellow     = "#f18e38" 
theme.gray           = "#5e5e5e"
theme.violet         = "#8c8ccd"
theme.pink           = "#B85C8A"
theme.black          = theme.bg_normal

-- Widgets
local clock_icon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.textclock("<span font=\"Meslo LGS Regular 10\" color=\"#32302f\"> %a %d %b  %H:%M </span>")
local clock_widget = wibox.container.background(wibox.container.margin(wibox.widget {clock_icon, clock, layout = wibox.layout.align.horizontal }, 0, 1), theme.violet)

-- Calendar
local calendar = lain.widget.calendar({
    cal = "cal --color=always",
    attach_to = { clock_widget },
    notification_preset = {
        font = "Meslo LGS Regular 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})



return theme
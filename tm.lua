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
theme.font          = "sans 8"
theme.fontBat       = "Meslo LGS Regular 12"
theme.wallpaper = "~/.config/awesome/src/aestetica3.jpg"
--theme.wallpaper     = theme.dir .. "/wallpapers/wall_0.png"

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
theme.green                                     = "#00b159"
theme.red                                       = "#d64d4d"
theme.yellow                                    = "#cc9c00"
theme.blue                                      = "#428bca"
theme.darkred                                   = "#c92132"
theme.darkgreen                                 = "#4d7358"
theme.darkyellow                                = "#f18e38" 
theme.gray                                      = "#5e5e5e"
theme.violet                                    = "#8c8ccd"
theme.pink                                      = "#B85C8A"
theme.black                                     = theme.bg_normal

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
theme.widget_mem                                = theme.dir .. "/icons/widgets/mem.png"
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
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"

theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

theme.w1 = theme.dir .. "/icons/display/1.png"
theme.w2 = theme.dir .. "/icons/display/2.png"
theme.w3 = theme.dir .. "/icons/display/3.png"
theme.w4 = theme.dir .. "/icons/display/4.png"
theme.w5 = theme.dir .. "/icons/display/5.png"
theme.w6 = theme.dir .. "/icons/display/6.png"
theme.w7 = theme.dir .. "/icons/display/7.png"
theme.w8 = theme.dir .. "/icons/display/8.png"
theme.w9 = theme.dir .. "/icons/display/9.png"
theme.w10 = theme.dir .. "/icons/display/10.png"
theme.w11 = theme.dir .. "/icons/display/11.png"
theme.w12 = theme.dir .. "/icons/display/12.png"
theme.w13 = theme.dir .. "/icons/display/13.png"
theme.w14 = theme.dir .. "/icons/display/14.png"
theme.w15 = theme.dir .. "/icons/display/15.png"
theme.w16 = theme.dir .. "/icons/display/16.png"
theme.w17 = theme.dir .. "/icons/display/17.png"

return theme
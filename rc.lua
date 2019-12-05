local gears         =   require("gears")
local awful         =   require("awful")
                        require("awful.autofocus")
local wibox         =   require("wibox")
local beautiful     =   require("beautiful")
local naughty       =   require("naughty")
local menubar       =   require("menubar")
local hotkeys_popup =   require("awful.hotkeys_popup").widget
                        require("awful.hotkeys_popup.keys")
local lain          =   require("lain")

-- Esta condición comprueba si ha habido errores al inicio y muestra mensaje en caso de haber.
-- Si hubiera algún error se cargará la configuración del sistema en lugar de la del usuario.
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Al igual que en el caso anterior, se comprueban diferentes errores con el fin de controlarlos
-- y mostrar una notificación informativa.
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end

-- Helper functions
local function client_menu_toggle_fn()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end

-- Variables locales
awful.spawn.with_shell("~/.config/awesome/scripts/autorun.sh") -- Autorun mediante script
beautiful.init("~/.config/awesome/tm.lua")
terminal = "urxvtc"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

-- Clase de definición de layouts, gestionando el orden y los layouts que forman
-- parte del entorno. Se puede reordenar, añadir o eliminar layouts a gusto.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

-- Menu
myawesomemenu = {
   { "hotkeys", function() return false, hotkeys_popup.show_help end},
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end}
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal 
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                  awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() and c.first_tag then
                                                      c.first_tag:view_only()
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, client_menu_toggle_fn()),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

w1 = wibox.widget.imagebox(beautiful.w1)
w2 = wibox.widget.imagebox(beautiful.w2)
w3 = wibox.widget.imagebox(beautiful.w3)
w4 = wibox.widget.imagebox(beautiful.w4)
w5 = wibox.widget.imagebox(beautiful.w5)
w6 = wibox.widget.imagebox(beautiful.w6)
w7 = wibox.widget.imagebox(beautiful.w7)
w8 = wibox.widget.imagebox(beautiful.w8)
w9 = wibox.widget.imagebox(beautiful.w9)
w10 = wibox.widget.imagebox(beautiful.w10)
w11 = wibox.widget.imagebox(beautiful.w11)
w12 = wibox.widget.imagebox(beautiful.w12)
w13 = wibox.widget.imagebox(beautiful.w13)
w14 = wibox.widget.imagebox(beautiful.w14)
w15 = wibox.widget.imagebox(beautiful.w15)
w16 = wibox.widget.imagebox(beautiful.w16)
w17 = wibox.widget.imagebox(beautiful.w17)


-- Widgets
local clock_icon = wibox.widget.imagebox(beautiful.widget_clock)
local clock = awful.widget.textclock("<span font=\"Meslo LGS Regular 10\" color=\"#32302f\"> %d/%m/%y  %H:%M </span>")
local clock_widget = wibox.container.background(wibox.container.margin(wibox.widget {clock_icon, clock, layout = wibox.layout.align.horizontal }, 0, 1), beautiful.violet)

-- Calendar
local calendar = lain.widget.calendar({
    cal = "cal --color=always",
    attach_to = { clock_widget },
    notification_preset = {
        font = "Meslo LGS Regular 10",
        fg   = beautiful.fg_normal,
        bg   = beautiful.bg_normal
    }
})
local markup = lain.util.markup
-- Battery
local bat_icon = wibox.widget.imagebox(beautiful.widget_battery)
local batspr_l = wibox.widget.imagebox(beautiful.w8)
local batspr_r = wibox.widget.imagebox(beautiful.w9)
local bat = lain.widget.bat({
    battery = "BAT0",
    timeout = 1,
    notify = "on",
    n_perc = {5,15},
    settings = function()
        bat_notification_low_preset = {
            title = "Battery low",
            text = "Plug the cable!",
            timeout = 15,
            fg = "#232323",
            bg = "#f18e38"
        }
        bat_notification_critical_preset = {
            title = "Battery exhausted",
            text = "Shutdown imminent",
            timeout = 15,
            fg = "#232323",
            bg = "#c92132"
        }

        if bat_now.status ~= "N/A" then
            if bat_now.status == "Charging" then
                bat_icon:set_image(beautiful.widget_ac)
                batspr_l:set_image(beautiful.w12)
                batspr_r:set_image(beautiful.w10)
                widget:set_markup(markup.font(beautiful.fontBat, markup.bg.color(beautiful.blue, markup.fg.color(beautiful.fg_widget," +" .. bat_now.perc .. "% [" .. bat_now.watt .. "W][" .. bat_now.time .. "]"))))
            elseif bat_now.status == "Full" then
                bat_icon:set_image(beautiful.widget_ac)
                batspr_l:set_image(beautiful.w8)
                batspr_r:set_image(beautiful.w9)
                widget:set_markup(markup.font(beautiful.fontBat, markup.fg.color("#232323", " ~" .. bat_now.perc .. "% [" .. bat_now.watt .. "W][" .. bat_now.time .. "]")))
            elseif tonumber(bat_now.perc) <= 35 then
                bat_icon:set_image(beautiful.widget_battery_empty)
                batspr_l:set_image(beautiful.w13)
                batspr_r:set_image(beautiful.w11)
                widget:set_markup(markup.font(beautiful.fontBat, markup.bg.color(beautiful.red, markup.fg.color(beautiful.fg_widget, " -" .. bat_now.perc .. "% [" .. bat_now.watt .. "W][" .. bat_now.time .. "]"))))     
            elseif tonumber(bat_now.perc) <= 70 then
                bat_icon:set_image(beautiful.widget_battery_medium)
                batspr_l:set_image(beautiful.w16)
                batspr_r:set_image(beautiful.w14)
                widget:set_markup(markup.font(beautiful.fontBat, markup.bg.color(beautiful.yellow, markup.fg.color(beautiful.fg_widget, " -" .. bat_now.perc .. "% [" .. bat_now.watt .. "W][" .. bat_now.time .. "]"))))
            elseif tonumber(bat_now.perc) <= 90 then
                bat_icon:set_image(beautiful.widget_battery)
                batspr_l:set_image(beautiful.w17)
                batspr_r:set_image(beautiful.w15)
                widget:set_markup(markup.font(beautiful.fontBat, markup.bg.color(beautiful.green, markup.fg.color(beautiful.fg_widget, " -" .. bat_now.perc .. "% [" .. bat_now.watt .. "W][" .. bat_now.time .. "]"))))
            else
                bat_icon:set_image(beautiful.widget_battery)
                batspr_l:set_image(beautiful.w12)
                batspr_r:set_image(beautiful.w10)
                widget:set_markup(markup.font(beautiful.fontBat, markup.bg.color(beautiful.blue, markup.fg.color(beautiful.fg_widget, " -" .. bat_now.perc .. "% [" .. bat_now.watt .. "W][" .. bat_now.time .. "]"))))
            end
        else
            widget:set_markup(markup.font(beautiful.fontBat, markup.bg.color(beautiful.red, markup.fg.color(beautiful.fg_widget, " AC "))))
            bat_icon:set_image(beautiful.widget_battery_no)
            batspr_l:set_image(beautiful.w13)
            batspr_r:set_image(beautiful.w11)
        end
    end
})

-- Battery
local batbar = wibox.widget {
    forced_height    = 1,
    forced_width     = 45,
    color            = "#232323",
    background_color = "#232323",
    margins          = 1,
    paddings         = 1,
    ticks            = true,
    ticks_size       = 5,
    widget           = wibox.widget.progressbar,
}

local batupd = lain.widget.bat({
    battery = "BAT0",
    timeout = 1,
    settings = function()
        if bat_now.status ~= "N/A" then
            if bat_now.status == "Charging" then
                batbar:set_color(beautiful.blue)
            elseif bat_now.status == "Full" then
                batbar:set_color(beautiful.gray)
            elseif tonumber(bat_now.perc) <= 35 then
                batbar:set_color(beautiful.red)
            elseif tonumber(bat_now.perc) <= 70 then
                batbar:set_color(beautiful.yellow)
            elseif tonumber(bat_now.perc) <= 90 then
                batbar:set_color(beautiful.green)
            else
                batbar:set_color(beautiful.blue)
            end
            batbar:set_value(bat_now.perc / 100)
        else
            return
        end
    end
})
local batbg = wibox.container.background(batbar, "#474747", gears.shape.rectangle)
local bat_widget = wibox.container.margin(batbg, 2, 7, 4, 4)

local battery_widget1 = wibox.container.background(wibox.container.margin(wibox.widget { bat_icon, bat_widget,  layout = wibox.layout.align.horizontal }, 1, 1), beautiful.gray)
local battery_widget2 = wibox.container.background(wibox.container.margin(wibox.widget { batspr_l, bat.widget, batspr_r, layout = wibox.layout.align.horizontal }, 0, 0), beautiful.gray)

-- MEM
local mem_icon = wibox.widget.imagebox(beautiful.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, markup.fg.color(beautiful.fg_widget, " " .. mem_now.used .. "MB [" .. mem_now.perc .. "%]")))
    end
})
local mem_widget =  wibox.container.background(wibox.container.margin(wibox.widget { mem_icon, mem.widget, layout = wibox.layout.align.horizontal }, 0, 0), beautiful.pink)


-- CPU
local cpu_icon = wibox.widget.imagebox(beautiful.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, markup.fg.color(beautiful.fg_widget, " " .. cpu_now.usage .. "% ")))
    end
})
local cpu_widget =  wibox.container.background(wibox.container.margin(wibox.widget { cpu_icon, cpu.widget, layout = wibox.layout.align.horizontal }, 0, 0), beautiful.blue)


-- Coretemp (lain, average)
local temp_icon = wibox.widget.imagebox(beautiful.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, markup.fg.color(beautiful.fg_widget, " " .. coretemp_now .. "° ")))
    end
})
local temp_widget =  wibox.container.background(wibox.container.margin(wibox.widget { temp_icon, temp.widget, layout = wibox.layout.align.horizontal }, 0, 0), beautiful.red)

-- FS
local fs_icon = wibox.widget.imagebox(beautiful.widget_hdd)
local fs = lain.widget.fs({
    notification_preset = { fg = beautiful.fg_normal, bg = beautiful.bg_normal, font = beautiful.fs_font },
    settings = function()
        local fsp = string.format(" %3.2f %s ", fs_now["/home"].free, fs_now["/home"].units)
        widget:set_markup(markup.font(beautiful.font, markup.fg.color(beautiful.fg_widget, fsp)))
    end
})
local fs_widget =  wibox.container.background(wibox.container.margin(wibox.widget { fs_icon, fs.widget, layout = wibox.layout.align.horizontal }, 0, 0), beautiful.yellow)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "α", "β", "λ", "μ", "π", "Σ", "γ", "φ", "Ω" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        nil, --s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            w1,
            w2,
            w3,
            fs_widget,
            w4,
            temp_widget,
            w5,
            cpu_widget,
            w6,
            mem_widget,
            w7,
            battery_widget1,
            battery_widget2,
            clock_widget,
            s.mylayoutbox,
        },
    }
end)

-- Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)

-- Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     size_hints_honor = false,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
        },
        class = {
          "Arandr",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Wpa_gui",
          "pinentry",
          "veromix",
          "xtightvncviewer"},

        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}

-- Signals
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            client.focus = c
            c:raise()
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

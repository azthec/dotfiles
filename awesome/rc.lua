pcall(require, 'luarocks.loader')

local gears = require('gears')
local awful = require('awful')
require('awful.autofocus')
local wibox = require('wibox')
local beautiful = require('beautiful')
local naughty = require('naughty')
local ruled = require('ruled')

local dpi = beautiful.xresources.apply_dpi

naughty.connect_signal('request::display_error', function(message, startup)
  naughty.notification {
    urgency = 'critical',
    title   = 'Oops, an error happened' .. (startup and ' during startup!' or '!'),
    message = message
  }
end)

beautiful.init('~/.config/awesome/theme-def.lua')

wiki_path = '~/Personal/armadiki/README.md'
scripts_path = '~/.config/scripts/'
terminal = 'alacritty'
editor = 'nvim'
editor_cmd = terminal .. ' -e ' .. editor

-- Set fast keyboard repeat settings
os.execute('xset r rate 150 100')

modkey = 'Mod4'

-- {{{ Menu
awesome_menu = {
  { 'Edit',    editor_cmd .. ' ' .. awesome.conffile },
  { 'Restart', awesome.restart },
  { 'Quit',    function() awesome.quit() end },
}

menu = awful.menu({
  items = { { 'Awesome', awesome_menu, beautiful.awesome_icon },
    { 'Terminal', terminal },
  }
})

mylauncher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = menu
})
-- Menu }}}

screen.connect_signal('request::desktop_decoration', function(s)
  awful.layout.layouts = { awful.layout.suit.spiral.dwindle }
  awful.tag({ '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' }, s, awful.layout.layouts[1])
end)

awful.mouse.append_global_mousebindings({
  awful.button({}, 3, function() menu:toggle() end),
  awful.button({}, 4, awful.tag.viewprev),
  awful.button({}, 5, awful.tag.viewnext),
})

-- General device controls
awful.keyboard.append_global_keybindings({
  awful.key({}, 'XF86AudioLowerVolume', function()
    awful.util.spawn('amixer set Master 2%-')
  end),
  awful.key({}, 'XF86AudioRaiseVolume', function()
    awful.util.spawn('amixer set Master 2%+')
  end),
  awful.key({}, 'XF86AudioMute', function()
    awful.util.spawn('amixer sset Master toggle')
  end),
  awful.key({}, 'XF86AudioMicMute', function()
    awful.spawn.with_shell(scripts_path .. 'mic-mute')
  end),
  awful.key({}, 'XF86MonBrightnessDown', function()
    awful.spawn.with_shell(scripts_path .. 'monitor-brightness decrease')
  end),
  awful.key({}, 'XF86MonBrightnessUp', function()
    awful.spawn.with_shell(scripts_path .. 'monitor-brightness increase')
  end),
  awful.key({}, 'XF86KbdBrightnessDown', function()
    awful.spawn.with_shell('asusctl -p')
  end),
  awful.key({}, 'XF86KbdBrightnessUp', function()
    awful.spawn.with_shell('asusctl -n')
  end),

})

-- Status key bindings
awful.keyboard.append_global_keybindings({
  awful.key({ modkey }, ',',
    function() awful.spawn.with_shell(scripts_path .. 'battery' .. '|' .. scripts_path .. 'send') end,
    { description = 'print battery statistics', group = 'info' }),
})

-- Application key bindings
awful.keyboard.append_global_keybindings({
  awful.key({ modkey, 'Control' }, 'r', awesome.restart,
    { description = 'reload awesome', group = 'awesome' }),
  awful.key({ modkey, 'Control' }, 'q', awesome.quit,
    { description = 'quit awesome', group = 'awesome' }),
  awful.key({ modkey }, 'Return', function() awful.spawn('alacritty') end,
    { description = 'open a terminal', group = 'launcher' }),
  awful.key({ modkey, 'Control' }, 'Return', function() awful.spawn('alacritty -e zellij') end,
    { description = 'open a multiplexed terminal', group = 'launcher' }),
  awful.key({ modkey }, 'y', function() awful.spawn('alacritty -e yazi') end,
    { description = 'open file explorer', group = 'launcher' }),
  awful.key({ modkey, }, 'r', function() awful.spawn.with_shell(scripts_path .. 'drun') end,
    { description = 'launcher', group = 'launcher' }),
  awful.key({ modkey, }, 's', function() awful.spawn.with_shell('scrot -s "%Y-%m-%d_%H-%M-%S.png"') end,
    { description = 'screenshot', group = 'launcher' }),
  awful.key({ modkey, 'Control' }, 'p', function() awful.spawn.with_shell(scripts_path .. 'lock --lock') end,
    { description = 'lock screen', group = 'launcher' }),
  awful.key({ modkey, 'Control', 'Shift' }, 'p', function() awful.spawn.with_shell(scripts_path .. 'lock --sleep') end,
    { description = 'lock screen and sleep', group = 'launcher' }),
  awful.key({ modkey }, 'w', function() awful.spawn.with_shell('alacritty -e ' .. editor .. ' ' .. wiki_path) end,
    { description = 'open personal wiki', group = 'launcher' }),
  awful.key({ modkey }, 't', function() awful.spawn.with_shell('alacritty -e btop') end,
    { description = 'show processes and resources', group = 'launcher' }),
  awful.key({ modkey, }, 'b', function() awful.spawn.with_shell('firefox -P default') end,
    { description = 'default firefox', group = 'launcher' }),
  awful.key({ modkey, 'Control' }, 'b', function() awful.spawn.with_shell('firefox -P work') end,
    { description = 'work firefox', group = 'launcher' }),
  awful.key({ modkey, }, 'c', function() awful.spawn.with_shell('alacritty -e tclock') end,
    { description = 'start stopwatch', group = 'launcher' }),
  awful.key({ modkey, 'Control' }, 'c', function() awful.spawn.with_shell('alacritty -e tclock stopwatch') end,
    { description = 'start stopwatch', group = 'launcher' }),
})

-- Client navigation
awful.keyboard.append_global_keybindings({
  awful.key({ modkey }, 'j', function()
    awful.client.focus.global_bydirection('down')
    if client.focus then client.focus:raise() end
  end),
  awful.key({ modkey }, 'k', function()
    awful.client.focus.global_bydirection('up')
    if client.focus then client.focus:raise() end
  end),
  awful.key({ modkey }, 'h', function()
    awful.client.focus.global_bydirection('left')
    if client.focus then client.focus:raise() end
  end),
  awful.key({ modkey }, 'l', function()
    awful.client.focus.global_bydirection('right')
    if client.focus then client.focus:raise() end
  end),
  awful.key({ modkey, 'Control' }, 'j', function()
    awful.client.swap.global_bydirection('down')
    if client.focus then client.focus:raise() end
  end),
  awful.key({ modkey, 'Control' }, 'k', function()
    awful.client.swap.global_bydirection('up')
    if client.focus then client.focus:raise() end
  end),
  awful.key({ modkey, 'Control' }, 'h', function()
    awful.client.swap.global_bydirection('left')
    if client.focus then client.focus:raise() end
  end),
  awful.key({ modkey, 'Control' }, 'l', function()
    awful.client.swap.global_bydirection('right')
    if client.focus then client.focus:raise() end
  end),
})

-- Tag navigation
awful.keyboard.append_global_keybindings({
  awful.key({ modkey, }, 'o', awful.tag.viewprev,
    { description = 'view previous', group = 'tag' }),
  awful.key({ modkey, }, 'i', awful.tag.viewnext,
    { description = 'view next', group = 'tag' }),
  awful.key({ modkey, }, 'Left', awful.tag.viewprev,
    { description = 'view previous', group = 'tag' }),
  awful.key({ modkey, }, 'Right', awful.tag.viewnext,
    { description = 'view next', group = 'tag' }),
  awful.key {
    modifiers   = { modkey },
    keygroup    = 'numrow',
    description = 'only view tag',
    group       = 'tag',
    on_press    = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
  },
  awful.key {
    modifiers   = { modkey, 'Control' },
    keygroup    = 'numrow',
    description = 'move focused client to tag',
    group       = 'tag',
    on_press    = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  },
})

client.connect_signal('request::default_mousebindings', function()
  awful.mouse.append_client_mousebindings({
    awful.button({}, 1, function(c)
      c:activate { context = 'mouse_click' }
    end),
    awful.button({ modkey }, 1, function(c)
      c:activate { context = 'mouse_click', action = 'mouse_move' }
    end),
    awful.button({ modkey }, 3, function(c)
      c:activate { context = 'mouse_click', action = 'mouse_resize' }
    end),
  })
end)

client.connect_signal('request::default_keybindings', function()
  awful.keyboard.append_client_keybindings({
    awful.key({ modkey }, 'Escape', function(c) c:kill() end,
      { description = 'close', group = 'client' }),
    awful.key({ modkey }, 'q', function(c) c:kill() end,
      { description = 'close', group = 'client' }),
    awful.key({ modkey }, 'space', awful.client.floating.toggle,
      { description = 'toggle floating', group = 'client' }),
    awful.key({ modkey, }, 'm',
      function(c)
        c.maximized = not c.maximized
        c:raise()
      end,
      { description = '(un)maximize', group = 'client' }),
    awful.key({ modkey, }, 'f',
      function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
      end,
      { description = 'toggle fullscreen', group = 'client' }),
  })
end)

ruled.client.connect_signal('request::rules', function()
  ruled.client.append_rule {
    id         = 'global',
    rule       = {},
    properties = {
      focus     = awful.client.focus.filter,
      raise     = true,
      screen    = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  }

  -- Floating clients.
  ruled.client.append_rule {
    id         = 'floating',
    rule_any   = {
      name = {
        'Event Tester', -- xev.
      },
      role = {
        'pop-up', -- e.g. Google Chrome's (detached) Developer Tools.
      }
    },
    properties = { floating = true }
  }

  ruled.client.append_rule {
    id         = 'ignored',
    rule_any   = {
      name = {
        'bevy-game',
        'vncviewer',
      },
    },
    properties = {
      screen = 1,
      focus = false,
      tag = '1',
      fullscreen = true,
      gaps = 0
    }
  }
end)

ruled.notification.connect_signal('request::rules', function()
  ruled.notification.append_rule {
    rule       = {},
    properties = {
      screen           = awful.screen.preferred,
      implicit_timeout = 5,
    }
  }
end)

naughty.connect_signal('request::display', function(n)
  naughty.layout.box { notification = n }
end)

client.connect_signal('mouse::enter', function(c)
  c:activate { context = 'mouse_enter', raise = false }
end)

-- Timers
gears.timer {
    timeout   = 60,
    call_now  = true,
    autostart = true,
    callback  = function()
        awful.spawn.with_shell(scripts_path .. 'battery-alert')
    end
}

-- Autostart
awful.spawn.with_shell(scripts_path .. 'monitor-configure')
awful.spawn.with_shell('picom')

-- Garbage collection
collectgarbage('setpause', 110)
collectgarbage('setstepmul', 1000)
gears.timer({
  timeout = 5,
  autostart = true,
  call_now = true,
  callback = function()
    collectgarbage('collect')
  end,
})

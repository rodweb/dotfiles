# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile.config import Key, Screen, Group, Drag, Click, Match
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

try:
    from typing import List  # noqa: F401
except ImportError:
    pass

mod = "mod4"
alt = "mod1"

keys = [
    # Fullscreen
    Key([mod], "f", lazy.window.toggle_fullscreen()),

    # MonadTall
    Key([mod], "h", lazy.layout.shrink_main()),
    Key([mod], "l", lazy.layout.grow_main()),

    # Switch between windows in current stack pane
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),

    # Move windows up or down in current stack
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Switch window focus to other pane(s) of stack

    # Switch between groups
    Key([alt], "Tab", lazy.screen.toggle_group()),
    Key([mod], "Tab", lazy.screen.next_group(skip_empty=True)),
    Key([mod, "shift"], "Tab", lazy.screen.prev_group(skip_empty=True)),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "Return", lazy.spawn("urxvtc")),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout()),

    # Kill
    Key([mod, "shift"], "q", lazy.window.kill()),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd()),

    Key([mod, "control"], "Down", lazy.spawn("playerctl play-pause")),
    Key([mod, "control"], "Right", lazy.spawn("playerctl next")),
    Key([mod, "control"], "Left", lazy.spawn("playerctl previous")),

    Key([alt], "space", lazy.spawn("SEARCH")),
    Key([mod], "g", lazy.spawn("menu.sh")),
Key([mod], "Right", lazy.layout.increase_ratio()),
    Key([mod], "Left", lazy.layout.decrease_ratio()),
]


groups = [
    Group('', spawn="google-chrome-stable", layout="monadtall"),
    Group(''),
    Group(''),
    Group('', layout="max", matches=[Match(wm_class=["Slack", "TelegramDesktop", "Whatsie"])]),
    Group('', layout="max", spawn="spotify"),
    Group('', matches=[Match(wm_class=["Java", "DBeaver"])]),
    Group('', matches=[Match(wm_class=["Postman"])]),
    Group(''),
    Group('', layout="matrix"),
    Group('')
]

for index, grp in enumerate(groups):
    i = 0 if index == 9 else index+1
    keys.extend([
        # mod1 + number of group = switch to group
        Key([mod], str(i), lazy.group[grp.name].toscreen()),

        # mod1 + shift + nmber of group = switch to & move focused window to group
        Key([mod, "shift"], str(i), lazy.window.togroup(grp.name)),
    ])

focus_color="#dc143c"
urgent_color="#ff4500"

layouts = [
    layout.xmonad.MonadTall(
        margin=5,
        single_margin=0,
        border_focus=focus_color,
        border_width=1,
        single_border_width=0,
    ),
    layout.Max(),
    layout.Tile(),
    layout.Matrix()
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox(
                    hide_unused=False,
                    highlight_method="text",
                    this_current_screen_border=focus_color,
                    urgent_alert_method="text",
                    urgent_text=urgent_color,
                ),
                widget.Prompt(prompt="run: "),
                widget.DebugInfo(),
                widget.Spacer(),
                widget.CurrentLayout(),
                widget.Systray(),
                widget.Clock(format='%d/%m %H:%M'),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
    {'wname': 'Tip of the day '},
    {'wname': 'Exit DBeaver '},
    {'wname': 'Version update '},
    {'wname': 'Can\'t connect to database '}
])
auto_fullscreen = True
focus_on_window_activation = "focus"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, github issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

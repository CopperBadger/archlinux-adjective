# Usage

Being an i3 setup, the system is primarily keyboard-driven. The super
(GUI / Meta / "Windows") key is used as the system-wide modifier, and will
be referenced here as `mod`.

## Starting a Graphical Session + Exiting

This configuration does not use a display manager. Instead, you should be
dropped into a simple terminal login after boot. To start a graphical session,
simply run the `startx` command after logging in. To exit, use `mod+Shift+e`.

## Workspaces

Out of the box, you will get ten workspaces. Active workspaces are shown in
the bar, with the currently selected workspace highlighted and underlined.
The workspaces are configured as follows:

1. Web
2. Textual Shell (sh)
3. Generic Graphical Application (app)
4. Mail and Messaging (mail)
5. Extra Shell
6. Extra Shell
7. Extra Shell
8. Extra Shell
9. Music
10. Game

Switch between these workspaces with `mod+Number`.

## Launching and Exiting Applications (rofi)

Press `mod+enter` to spawn a terminal emulator.

Press `mod+p` to bring up the launcher, `rofi`. Simply type the name of the
application you want and press enter to start it. Rofi configuration can be
adjusted by editing `~/sbin/myrofi`.

## Managing Windows

Window management is all vim-iffied! Use `mod+[h/j/k/l]` to change
the focused window left, down, up, and right, respectively. Use
`shift+mod+[h/j/k/l]` to move the active window in the same way. Enter window
resizing mode by pressing `mod+r`, using `h/j/k/l` to make adjustments, and
`enter` when you are done.

`mod+f` toggles fullscreen on the active window. There are more complicated
and amazing things you can do with i3, but they are beyond the scope of this
readme-- if you want to know more, check out the
[official documentation](https://i3wm.org/docs/userguide.html).

## Gaps

I've included a `gaps` command that lets you quickly adjust the window gaps
on the display. Simply run `gaps` in the workspace you'd like it to apply to
with either one of `none`, `focus`, `work`, or `pretty`, or two positive
integers specifying the width of the outer and inner gaps you want
(e.g., `gaps work`, or `gaps 4 16`).

## What To Do If Things Blow Up

Sometimes the bar will throw a threading exception and stop working. If this
happens, you can easily restart it by running the `lb-restart` command from
the launcher (`mod+p`).

Even more rarely, i3 will seize up and throw an epic CPU party. If this
happens, pop open a separate TTY (`Ctrl+Alt+F2`), log in, and kill it off
(`pkill i3`).

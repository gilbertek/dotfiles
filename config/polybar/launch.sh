#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut downl
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

desktop=$(echo $DESKTOP_SESSION)

case $desktop in
  xmonad )
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-xmonad -c ~/.config/polybar/config &
      done
    else
      polybar --reload mainbar-xmonad -c ~/.config/polybar/config &
    fi
    ;;
  herbstluftwm )
    # Launch bars
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload topbar -c ~/.config/polybar/config &
      done
    else
      polybar --reload topbar -c ~/.config/polybar/config &
    fi
    ;;
esac


echo "Bars launched..."

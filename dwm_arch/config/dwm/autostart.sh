

# pkill picom && picom -f &

# urxvtd -q &

# Terminate already running bar instances
if pgrep -x flameshot >/dev/null
   then :
else
   flameshot &
fi

if pgrep -x pasystray >/dev/null
   then :
else
   pasystray &
fi

if pgrep -x imwheel >/dev/null
   then :
else
   imwheel &
fi

if pgrep -x unclutter >/dev/null
   then :
else
   unclutter &
fi

if pgrep -x copyq >/dev/null
   then :
else
   copyq &
fi

if pgrep -x picom >/dev/null
   then :
else
   picom -f &
fi

if pgrep -x nm-applet >/dev/null
   then :
else
   nm-applet -f &
fi

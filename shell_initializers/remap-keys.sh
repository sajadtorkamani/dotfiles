# Remap caps lock to act as Escape when short-pressed and as Ctrl when long-pressed.
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'

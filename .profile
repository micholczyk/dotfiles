# Change CapsLock behavior to be Ctrl when held down, Esc when pressed.
# On GNOME I suggest setting CapsLock to Esc in Tweaks.

setxkbmap -option ctrl:nocaps
xcape -e "Control_L=Escape"

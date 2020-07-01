# Change CapsLock behavior to be Ctrl when held down, Esc when pressed.

setxkbmap -option ctrl:nocaps
xcape -e "Control_L=Escape"

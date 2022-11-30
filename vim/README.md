# VIM
Some tips to work wit VIM

## Command Mode
### Movement
```
j       Up
k       Down
h       Left
l       Right
w       Forward Word 
b       Backward Word

```

### Copy & Paste
```
yy      Copy a line
yw      Copy a word
yg      Copy line + (up or down) from the cursor 
p       Paste qaline bellow
shift+p Paste a line above
y+i+p   Copy all inside a paragraphe
Y+i+{   Copy all inside curly brackets (could be (),[])
```

### Delete
```
d+d        Delete line (Throw in the clipboard)
d+w        Delete a word
c+w        Delete a word and go to insert mode
d+g        Delete line + (up or down) 
d+{line_number}+d Delete until the line number
x      	   Delete single character
s      	   Delete single character and go to insert mode
d+t+{char} Delete all before to the char
c+t+{char} Delete all before to the char and go to insert mode
shift+d    Delete from to the rest of line
shift+c    Delete from to the rest of line and go to insert mode
d+i+{	     Delete all inside {} (could be (),[])
d+{number_of_times}+i+{ Delete all inside {} x number_of_time (could be (),[])
c+i+p      Delete all inside a paragrafe
```

### Un & Re do
```
u       Undo
crtl+R  Redo
```

### Search
```
/       Open search
n       Go forward in the matchs
shift+n Go back in the matchs
shift+* Search based where the cursor is on top, forward
shift+# Search based where the cursor is on top, backward 
```

### Inline movement
```
f+{char} Forward on top of char
t+{char} Forward one before char
shift+f+{char} Backward on top of char
shift+t+{char} Backward one before char
; Forward after t+{char}
, Backward after t+{char}
```

### Vertical movement
```
gg Go to the top, first line
G  Go to the bottom, last line
{line_number}+G Go to the line number
{ Go to the empty line above
} Go to the empty line below
% Go between {},(),[]
{line_number}+k Go up number times of line number
{line_number}+j Go down number times of line number
```

## Visual Mode
```
shift+v Visual mode to select a line
v       Visual mode to select from the cursor
crtl+v  Visual block mode
```

## Insert Mode
```
i       Insert mode
o       Insert mode at line bellow the cursor
shift+o Insert mode at line above the cursor
shift+i Insert mode at begning of line
shift+a Insert mode at end of line
crtl+c  Exit insert mode
```

## Edit
~ Turn the camel case

## Window
```
crtl+w+o   Close all splited windows but the current buffer
crtl+w+v   Split window verticaly
crtl+w+n   Split window horizontaly
crtl+w+r   Rotate the splited windows
crtl+w+=   Reset resize equal to all splited windows
crtl+w+q   Close splited
:Ex        Go to explorer mode (Like nerd tree)
:resize 10 Horizontal resize
:vertical  Resize 10 Vertical resize
```

### File
```
w       Save file
wq      Save and quit
```


---------------------
Mario Custom Palettes
Version 1.5
By Roy.
Update by Erik.
---------------------

Q: What will this patch do?
A: This will enable you to add custom palettes for Mario and Luigi, on a per-level basis. You can also customize the palettes of Mario on the overworld border.
Not only can you specify palettes for normal (small) and Fiery Mario and Luigi, you can also make seperate palettes for Big and Caped Mario.
This will only affect colours 6-F ; you can affect all other colours from palette 8 with Lunar Magic.
By default, you only have 16 custom palettes to choose from - you'll have to edit these, though -, but you can easily make more of them yourself.

How to use this patch: Open cusmarpal_tables.asm and...

1. Edit the pointer tables.
Do you see all those dl !DefaultMarSm, dl !DefaultLuiCp, etc.?
Well, these point to the default palettes of Mario and Luigi per level.
As you can see in the beginning, these defines return.

!DefaultMarSm = $00B2C8   ; \ You may not want to change these.
!DefaultLuiSm = $00B2DC   ;  |
!DefaultMarBg = $00B2C8   ;  |
!DefaultLuiBg = $00B2DC   ;  |
!DefaultMarCp = $00B2C8   ;  |
!DefaultLuiCp = $00B2DC   ;  |
!DefaultMarFr = $00B2F0   ;  |
!DefaultLuiFr = $00B304   ; /

!DefaultMarSm is the default palette Mario uses when he's small.
The colours are located at SNES $00B2C8.
!DefaultLuiSm is for Luigi, at SNES $00B2DC.
!DefaultMarBg for Big Mario, at SNES $00B2C8 again.
As you can see, the Fiery player pointers point to other palette tables - $00B2F0 and $00B304.

Now, this isn't really important. Let's get back to the huge pointer tables.

dl !DefaultMarSm,!DefaultMarSm,!DefaultMarSm,!DefaultMarSm,!DefaultMarSm,!DefaultMarSm,!DefaultMarSm,!DefaultMarSm,!DefaultMarSm,!DefaultMarSm,!DefaultMarSm,!DefaultMarSm,!DefaultMarSm,!DefaultMarSm,!DefaultMarSm,!DefaultMarSm ; Levels 0-F

Notice this. For each level from level 0 up to F, you can see a slot in this line. They all point to the default palette for when Mario is small.
Say, you want to use a custom palette for Mario in level 9. You want to use the custom palette at 'Pal0:', which you can find in the bottom of this patch.
What you do, is get to the tenth value here (the tenth !DefaultMarSm).
There, change !DefaultMarSm to Pal0 (yes, without the exclaimation mark).
Now, you have successfully pointed to Pal0.
You can also point to Pal1, Pal2, etc. And if you make your own palettes with their own labels, you can also point to Pal10, Spaghetti, Loldead, as long as the labels match.

You can also edit the palettes of Mario/Luigi on the overworld border (not the one that's on the overworld itself). To do that, edit the table under "OwPalPtr:". In that table, the row specifies the powerup status (there are comments on the side) and the column is the overworld submap (the order is shown above the table).

2. Edit the actual palettes.

Pal0:
dw $635F,$581D,$000A,$391F,$44C4,$4E08,$6770,$30B6,$35DF,$03FF

The format is SNES RGB value - this is kind of tedious, but with the help of the Live Palette Editor by JackTheSpades (https://www.smwcentral.net/?p=section&a=details&id=5713), it's an easier task.
Alternatively, you can use LM's paletter viewer to get your SNES RGB values eventually.
Anyway, here's where you edit your actual palette. Yes, in hex... but it's not hard. As I said, you can use the palette viewer of LM to get your values.
The leftmost value is colour 6, after that it just counts up.
It stops at colour F - therefore, the table should only contain 10 values.

If you changed all these values to $0000, Mario would go black entirely (well, except for colours 0-5).
Changing them to $7FFF makes him completely white, minus colours 0-5... well, you get it. Palette editing through hex isn't hard at all.
The format (if you need to know) is quite simple: -bbbbbgg gggrrrr, where b = blue, g = green and r = red. - is unused so don't worry.

Q: How do I make a new custom palette? I need more than 16 custom palettes.
A: Simple. The setup is exactly the same as with others. Just, you add another palette to the list.
Easiest to remember is to name it Pal10: and count up after that.
Then, you code the colours in hex, just like you did with custom palettes 0-F, and you point to Pal10, just like you did with the other palettes.

Q: I found a bug.
A: Please report them to me!

Q: Credit needed?
A: No.
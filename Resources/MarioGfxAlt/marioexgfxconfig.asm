@includefrom marioexgfxalt.asm

; RAM for determining which GFX file to use.
!Freeram = $1DEF|!addr


; To add additional graphics files, just add another %gfx($bank, file) macro where $bank is the bank (only bank) where you want to insert the graphics and file the file you want to insert.

%gfx($11, mario.bin)
%gfx($12, luigi.bin)

Mario ExGFX Alt - Readme

This patch is one of the may ways to use mutliple player graphics. Unlike Mario + Animated Tile ExGFX, this allows you to change the graphics on the fly, unlike Separate Luigi Graphics, this patch is much simpler as it only changes the player graphics but allows you to handle the complimentary graphics (most notably, GFX00) manually and is less tasking towards NMI.

How to use it: Ignore marioexgfxalt.asm and open marioexgfxconf.asm. 
You can do two things: Set freeRAM (the default one is cleared only at reset) and add graphics.
In order to insert graphics, you are free to use the macro %gfx($bank, file) where $bank is the bank to insert (load up the ROM with Slogger to search for freespace).
Make sure, $xx:9FF8-$xx:FCFF (where $xx is the bank you want to insert the graphics) is free, the patch inserts the graphics in those areas only.

Take a look at the example:
%gfx($11, mario.bin)
%gfx($12, luigi.bin)

This inserts the graphics mario.bin and luigi.bin at $109FF8 and $119FF8, respectively. Set $1DEF (if not changed) to $00 for Mario, and $01 for Luigi.

This patch handles only graphics. For custom player palettes, use a separate patch. Neither does it handle 8x8 tiles.

Warning: Old graphics still stays in the ROM even if you remove it from the list. The graphics are all added manually and therefore needs to be removed manually also. One way to remove the unused graphics is to create an empty ASM file with the content "autoclean $xx9FF8" where $xx is the bank where the graphics have been inserted. Alternatively, remove the graphics manually with a hex edit.

Warning: Due to the nature, this patch is incompatible with any patch which changes how the player graphics are handled (most notably, 32x32 Player Tilemap).

Warning: All the graphics are uncompressed. Using too many player graphics will easily fill up your ROM.

Warning: This patch hasn't been tested with big SA-1 ROMs (i.e. larger than 4 MiB). Use it at your own risks!

Changelog (dd/mm/yyyy):
 - 14.08.2011: First release by Alcaro
 - 20.08.2010: Update by Thomas: Converted to Asar, fixed bug with dynamic sprites
 - 20.08.2020: Update by MarioFanGamer: Added Asar support, changed to a more user-friendly insertion, added a README.

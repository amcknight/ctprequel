@includefrom "LevelDependingOnRAM.asm"

;========================================================;
; Edit this list.                                        ;
; Format: %entry(level1, level2, ram) (a few examples    ;
;  are provided, feel free to remove them and add your   ;
;  own (keep each %entry(...) on a separate line).       ;
;  The level will change when the RAM address specified  ;
;  is different than 0.                                  ;
;                                                        ;
; NOTE 1: if you're on SA-1, you'll need to put the      ;
;  remapped addresses in the entries! To do this, add    ;
;  6000 to absolute (2 bytes) addresses, and 3000 to     ;
;  direct page (1 byte) addresses (in the example        ;
;  below, 0019 becomes 3019 and 13C7 becomes 73C7).      ;
;                                                        ;
; NOTE 1: use only levels 000-024 and 101-13B!           ;
;                                                        ;
; NOTE 2: it's better not to put a level with number 0XX ;
;  and one with number 1XX in the same entry, as that    ;
;  can mess up the exits that are in the level (although ;
;  it only seems to mess up for original exits, while    ;
;  the ones made in Lunar Magic seem to work fine).      ;
;========================================================;

%entry(105, 107, 0019) ; Level 105 becomes level 13B when RAM address $0019 is not #$00 (Player is not small)
%entry(001, 010, 13C7) ; Level 001 becomes level 010 when RAM address $13C7 is not #$00 (Player has Yoshi)
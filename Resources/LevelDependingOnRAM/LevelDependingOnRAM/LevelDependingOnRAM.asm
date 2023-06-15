;========================;
; Level Depending On RAM ;
; made by Deflaktor      ;
;========================;

if read1($00FFD5) == $23
    sa1rom
    !sa1 = 1
    !addr = $6000
	!bank = $000000
else
    lorom
    !sa1 = 0
    !addr = $0000
	!bank = $800000
endif

; Hijack level loading routine
org $05DCE2
	autoclean jml Main

freedata

Main:
	PHY
	PHX
	PHP
	LDA $13BF|!addr		; load the level number

; Remod note: I don't know why this code was here in the first place, and it messed up levels with a "No Yoshi" intro, so I commented it out.
;	PHA
;	LDA $141D|!addr		; load the "Disable Mario Start! Flag"
;	BEQ GoOn			; if the flag is 1 (because it is only 0 while loading the overworld level)
;	PLA
;	BRA Ret2	; return
;GoOn:
;	PLA

	REP #$30			; let A,X and Y go 16 bit, since we deal with large numbers > FF
	JSR LevelToRoom		; convert the level number to a room number
	LDX #$0000			; load zero to X (the index for the table)

Loop:
	PHA
	LDA.l Table,x	
	TAY
	PLA
	CPY #$FFFF			; end of table reached?
	BEQ Return			; return
	CMP.l Table,x
	BEQ RAM				; we found an entry, check RAM address
	INX #6				; increase index by 6
	BRA Loop			; loop

RAM:
	INX #4				; increase X by 4 to get the RAM address
	LDA.l Table,x		; load RAM address
	STA $0E				; store the pointer into the scratch ram
	LDA ($0E)			; load RAM address from the pointer
	BNE SetLvl			; if the address is not zero, set the new level number

; else load the level number and jump back to the loop
	SEP #$20			; let A go back to 8 bit
	LDA $13BF|!addr		; load the level number
	JSR LevelToRoom 	; convert the level number to a room number
	INX #2				; increase X by 2 to get the next row of the table
	BRA Loop

; now that we know the event is set, change the level number

SetLvl:
	DEX #2				; decrease index X by 2 to get the new level number
	LDA.l Table,x
Return:
	JSR RoomToLevel		; convert the room number to the level number
	SEP #$20			; let A go back to 8 bit

Ret2:
	PLP
	PLX
	PLY
	BCC .skip
	SBC #$24
	INY
.skip
	STA $17BB|!addr
	JML $05DCEA|!bank

; Subroutine that converts overworld level numbers to room numbers
LevelToRoom:
	REP #$20			; let A go 16 bit, since we deal with large numbers > FF
	AND #$00FF			; mask the high byte
	CMP #$0025
	BCC ReturnLR		; if level number is greater than #$025
	CLC
	ADC #$00DC			; subtract #$0DC from it
ReturnLR:
	RTS

; Subroutine that converts room numbers to overworld level numbers
RoomToLevel:
	CMP #$0025
	BCC ReturnRL		; if level number is greater than #$025
	SEC
	SBC #$00DC			; add #$0DC to it
ReturnRL:
	RTS

macro entry(level1, level2, ram)
	dw $<level1>, $<level2>, $<ram>
endmacro

Table:
	incsrc "LevelTable.asm"
	dw #$FFFF			; table end (necessary)

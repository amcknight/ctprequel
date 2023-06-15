@asar 1.40

; Technical stuff, don't edit unless you know what you're doing.

macro gfx(bank, file)
	Freespace!{id} = (<bank>*65536)|$9FF8|!bank
	org Freespace!{id}
		db "ST","AR"
		dw rat!{id}A-rat!{id}B-$01
		dw rat!{id}A-rat!{id}B-$01^$FFFF
	rat!{id}B:
		incbin <file>
	rat!{id}A:
	!id #= !id+1
endmacro

lorom
!sa1 = 0
!addr = $0000
!bank = $800000

if read1($00FFD5) == $23
	sa1rom
	!sa1 = 1
	!addr = $6000
	!bank = $000000
endif

!id = 1

incsrc marioexgfxconfig.asm

freedata
BankTable:
; Weird stuff but it works
!lc = 1
while less(!lc, !id)
	db Freespace!{lc}/65536
	!lc #= !lc+1
endif

Code1:
	LDA $0D99|!addr
	ORA #$8000
	STA $4322
	LDX !Freeram
	LDA.l BankTable,x
	TAY
	STY $00
	LDX #$04
	JML $00A341|!bank

Code2:
	LDY #$7E
	LDA $0D85|!addr,x
	CPX #$06
	BCS +
	ORA #$8000
  + STA $4322
	BCS +
	LDY $00
  +	STY $4324
	JML $00A35B|!bank

Code3:
	LDY #$7E
	LDA $0D8F|!addr,x
	CPX #$06
	BCS +
	ORA #$8000
  + STA $4322
	BCS +
	LDY $00
  +	STY $4324
	JML $00A37B|!bank

org $00A339
	autoclean JML Code1

org $00A355
	JML Code2

org $00A375
	JML Code3
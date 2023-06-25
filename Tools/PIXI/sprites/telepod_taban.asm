print "INIT ",pc
RTL

print "MAIN ",pc
PHB : PHK : PLB
	JSR Graphics
PLB : RTL

Graphics:
	%GetDrawInfo()

	LDA $00
	STA $0300,y	; X position
	LDA $01
	STA $0301,y	; Y position
	LDA #$00
	STA $0302,y	; Tile number
	LDA #$39
	STA $0303,y	; Properties

	LDA $00
	ADC #$0F
	STA $0304,y	; X position
	LDA $01
	STA $0305,y	; Y position
	LDA #$02
	STA $0306,y	; Tile number
	LDA #$39
	STA $0307,y	; Properties

	LDA $00
	STA $0308,y	; X position
	LDA $01
	ADC #$0F
	STA $0309,y	; Y position
	LDA #$20
	STA $030A,y	; Tile number
	LDA #$39
	STA $030B,y	; Properties

	LDA $00
	ADC #$0F
	STA $030C,y	; X position
	LDA $01
	ADC #$0F
	STA $030D,y	; Y position
	LDA #$22
	STA $030E,y	; Tile number
	LDA #$39
	STA $030F,y	; Properties

	; Draw it

	LDA #$03	; Draw 16 tiles
	LDY #$02	; 16x16 tilesize
	JSL $01B7B3
	RTS
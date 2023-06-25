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
	LDA #$40
	STA $0302,y	; Tile number
	LDA #$37
	STA $0303,y	; Properties

	LDA $00
	STA $0304,y	; X position
	LDA $01
	ADC #$0F
	STA $0305,y	; Y position
	LDA #$60
	STA $0306,y	; Tile number
	LDA #$37
	STA $0307,y	; Properties

	; Draw it

	LDA #$01	; Draw 16 tiles
	LDY #$02	; 16x16 tilesize
	JSL $01B7B3
	RTS
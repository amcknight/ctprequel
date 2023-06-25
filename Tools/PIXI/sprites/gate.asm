print "INIT ",pc
RTL

print "MAIN ",pc
PHB : PHK : PLB
	JSR Graphics
PLB : RTL

;Main:
;RTS

Graphics:
	%GetDrawInfo()
	
	; First row

	LDA $00
	STA $0300,y	; X position
	LDA $01
	STA $0301,y	; Y position
	LDA #$80
	STA $0302,y	; Tile number
	LDA #$3B
	STA $0303,y	; Properties

	LDA $00
	ADC #$0F
	STA $0304,y	; X position
	LDA $01
	STA $0305,y	; Y position
	LDA #$82
	STA $0306,y	; Tile number
	LDA #$3B
	STA $0307,y	; Properties

	LDA $00
	ADC #$1F
	STA $0308,y	; X position
	LDA $01
	STA $0309,y	; Y position
	LDA #$84
	STA $030A,y	; Tile number
	LDA #$3B
	STA $030B,y	; Properties

	LDA $00
	ADC #$2F
	STA $030C,y	; X position
	LDA $01
	STA $030D,y	; Y position
	LDA #$86
	STA $030E,y	; Tile number
	LDA #$3B
	STA $030F,y	; Properties

	; Second row

	LDA $00
	STA $0310,y	; X position
	LDA $01
	ADC #$0F
	STA $0311,y	; Y position
	LDA #$A0
	STA $0312,y	; Tile number
	LDA #$3B
	STA $0313,y	; Properties

	LDA $00
	ADC #$0F
	STA $0314,y	; X position
	LDA $01
	ADC #$0F
	STA $0315,y	; Y position
	LDA #$A2
	STA $0316,y	; Tile number
	LDA #$3B
	STA $0317,y	; Properties

	LDA $00
	ADC #$1F
	STA $0318,y	; X position
	LDA $01
	ADC #$0F
	STA $0319,y	; Y position
	LDA #$A4
	STA $031A,y	; Tile number
	LDA #$3B
	STA $031B,y	; Properties

	LDA $00
	ADC #$2F
	STA $031C,y	; X position
	LDA $01
	ADC #$0F
	STA $031D,y	; Y position
	LDA #$A6
	STA $031E,y	; Tile number
	LDA #$3B
	STA $031F,y	; Properties

	; Third row

	LDA $00
	STA $0320,y	; X position
	LDA $01
	ADC #$1F
	STA $0321,y	; Y position
	LDA #$C0
	STA $0322,y	; Tile number
	LDA #$3B
	STA $0323,y	; Properties

	LDA $00
	ADC #$0F
	STA $0324,y	; X position
	LDA $01
	ADC #$1F
	STA $0325,y	; Y position
	LDA #$C2
	STA $0326,y	; Tile number
	LDA #$3B
	STA $0327,y	; Properties

	LDA $00
	ADC #$1F
	STA $0328,y	; X position
	LDA $01
	ADC #$1F
	STA $0329,y	; Y position
	LDA #$C4
	STA $032A,y	; Tile number
	LDA #$3B
	STA $032B,y	; Properties

	LDA $00
	ADC #$2F
	STA $032C,y	; X position
	LDA $01
	ADC #$1F
	STA $032D,y	; Y position
	LDA #$C6
	STA $032E,y	; Tile number
	LDA #$3B
	STA $032F,y	; Properties

	; Fourth row

	LDA $00
	STA $0330,y	; X position
	LDA $01
	ADC #$2F
	STA $0331,y	; Y position
	LDA #$E0
	STA $0332,y	; Tile number
	LDA #$3B
	STA $0333,y	; Properties

	LDA $00
	ADC #$0F
	STA $0334,y	; X position
	LDA $01
	ADC #$2F
	STA $0335,y	; Y position
	LDA #$E2
	STA $0336,y	; Tile number
	LDA #$3B
	STA $0337,y	; Properties

	LDA $00
	ADC #$1F
	STA $0338,y	; X position
	LDA $01
	ADC #$2F
	STA $0339,y	; Y position
	LDA #$E4
	STA $033A,y	; Tile number
	LDA #$3B
	STA $033B,y	; Properties

	LDA $00
	ADC #$2F
	STA $033C,y	; X position
	LDA $01
	ADC #$2F
	STA $033D,y	; Y position
	LDA #$E6
	STA $033E,y	; Tile number
	LDA #$3B
	STA $033F,y	; Properties

	; Draw it

	LDA #$0F	; Draw 16 tiles
	LDY #$02	; 16x16 tilesize
	JSL $01B7B3
	RTS
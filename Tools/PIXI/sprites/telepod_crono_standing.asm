print "INIT ",pc
RTL

print "MAIN ",pc
PHB : PHK : PLB
	JSR Graphics
PLB : RTL

Tiles: db #$0E,#$0C,#$2C

Graphics:
	%GetDrawInfo()

  PHX
  JSR WriteTiles
  PLX

	LDA #$02	; Draw 3 tiles
	LDY #$02	; 16x16 tilesize
	JSL $01B7B3
	
  RTS

WriteTiles:
	%GetDrawInfo()

  ; X positions
  LDA $00
  STA $0300,y
  STA $0304,y
  STA $0308,y

  ; Y positions
  LDA $01
  STA $0301,y
  ADC #$0F
  STA $0305,y
  ADC #$0F
  STA $0309,y

  ; Tiles
  LDX #$00
  LDA Tiles,x
  STA $0302,y
  INX
  LDA Tiles,x
  STA $0306,y
  INX
  LDA Tiles,x
  STA $030A,y

  ; Properties
  LDA #$35 ; YXPPCCCT
  STA $0303,y
  STA $0307,y
  STA $030B,y
  
  RTS
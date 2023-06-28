print "INIT ",pc
RTL

print "MAIN ",pc
PHB : PHK : PLB
	JSR Graphics
PLB : RTL

Tiles: db #$40,#$60,
          #$42,#$62,
          #$44,#$64,
          #$42,#$62

Graphics:
	%GetDrawInfo()

  PHX
  JSR WriteTiles
  PLX

	LDA #$01	; Draw 2 tiles
	LDY #$02	; 16x16 tilesize
	JSL $01B7B3
	
  RTS

WriteTiles:
	%GetDrawInfo()

  ; X positions
  LDA $00
  STA $0300,y
  STA $0304,y

  ; Y positions
  LDA $01
  STA $0301,y
  ADC #$0F
  STA $0305,y

  ; Tiles
  LDA $14        ; Counter for frame switching
  AND #$08       ; Every 2^3 frames
  LSR : LSR : LSR; Move bit to lowest bit
  ASL            ; Multiply by 2 because 2 tiles per frame
  TAX            ; Set masked counter in X register for indexing (0 or 4)
  LDA Tiles,x
  STA $0302,y
  INX
  LDA Tiles,x
  STA $0306,y

  ; Properties
  LDA #$37
  STA $0303,y
  STA $0307,y
  
  RTS
print "INIT ",pc
RTL

print "MAIN ",pc
PHB : PHK : PLB
	JSR Graphics
PLB : RTL

Tiles: db #$00,#$02,#$20,#$22,
          #$04,#$06,#$24,#$26

Graphics:
	%GetDrawInfo()

  PHX
  JSR WriteTiles
  PLX

	LDA #$03	; Draw 4 tiles
	LDY #$02	; 16x16 tilesize
	JSL $01B7B3
	
  RTS

WriteTiles:
  ; X positions
  LDA $00
  STA $0300,y
  ADC #$0F
  STA $0304,y
  LDA $00
  STA $0308,y
  ADC #$0F
  STA $030C,y

  ; Y positions
  LDA $01
  STA $0301,y
  STA $0305,y
  ADC #$0F
  STA $0309,y
  STA $030D,y

  ; Tiles
  LDA $14        ; Counter for frame switching
  AND #$10       ; Every 2^4 frames
  LSR : LSR : LSR : LSR; Move bit to lowest bit
  ASL : ASL      ; Multiply by 4 because 4 tiles per frame
  TAX            ; Set masked counter in X register for indexing (0 or 4)
  LDA Tiles,x
  STA $0302,y
  INX
  LDA Tiles,x
  STA $0306,y
  INX
  LDA Tiles,x
  STA $030A,Y
  INX
  LDA Tiles,x
  STA $030E,y

  ; Properties
  LDA #$39
  STA $0303,y
  STA $0307,y
  STA $030B,y
  STA $030F,y
  
  RTS
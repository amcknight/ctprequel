print "INIT ",pc
RTL

print "MAIN ",pc
PHB : PHK : PLB
	JSR Graphics
PLB : RTL

; Tiles:
;   db #$00,#$02,#$20,#$22 ;,#$40,#$42,#$60,#$62

NumFrames = 2
FrameMask = 1
NumTilesPerFrame = 4

Properties = $39 ; YXPPCCCT = 00111001

Graphics:
	%GetDrawInfo()

  LDA $00
  STA $0300,y    ; X position
  LDA $01
  STA $0301,y    ; Y position

  LDA $00
  STA $0304,y    ; X position
  LDA $01
  ADC #$0F
  STA $0305,y    ; Y position

  LDA $00
  ADC #$0F
  STA $0308,y    ; X position
  LDA $01
  STA $0309,y    ; Y position

  LDA $00
  ADC #$0F
  STA $030C,y    ; X position
  LDA $01
  ADC #$0F
  STA $030D,y    ; Y position
  
  LDA Properties
  STA $0303,y
  STA $0307,y
  STA $030B,y
  STA $030F,y

  ; LDA $14        ; Counter for frame switching
  ; AND FrameMask  ; Replace everything above 4 with zeroes 
  ; ASL A          ; Multiply by 4 because 4 tiles per frame 
  ; ASL A          ;
  ; TAX            ; Set masked counter in X register for indexing
  LDX #$00

  ; LDA Tiles,x
  ; STA $0302,y
  ; INC
  ; STA $0306,y
  ; INC
  ; STA $030A,y
  ; INC
  ; STA $030E,y

  LDA #$00
  STA $0302,y
  LDA #$02
  STA $0306,y
  LDA #$20
  STA $030A,y
  LDA #$22
  STA $030E,y

	; Draw it

	LDA #$03	; Draw 4 tiles
	LDY #$02	; 16x16 tilesize
	JSL $01B7B3
	RTS
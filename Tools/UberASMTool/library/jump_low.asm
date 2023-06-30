main:
  LDA $7D		      ; \ if positive y speed, return
  BPL .skiplimit	; /
  CMP #$C8	      ; \ if speed is low enough, return
  BCS .skiplimit	; /
  LDA #$C8	      ; \ limit to $C8 (or -$38)
  STA $7D		      ; /
  .skiplimit:
  rtl
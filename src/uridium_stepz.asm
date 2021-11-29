* = $0800 "Base Address"


    L_0800:
        BasicUpstart2($0900)

* = $0820

    L_0820:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_0880:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_0900:
        sei 
        lda #$0b
        sta L_d010 + $1
        lda #$f0
        sta L_d020 + $1
        sta L_d020
        lda #$24
        sta $01
        ldy #$fe
        lda #$00

    L_0916:
         .byte $99,$01,$00

        dey 
        bne L_0916
        ldx #$00
        ldy #$80
        stx $b2
        sty $b3
        ldx #$00
        ldy #$e0
        stx $b0
        sty $b1
        ldx #$20
        jsr L_b2f5 + $d
        ldx #$00
        ldy #$c0
        stx $b0
        sty $b1
        ldx #$10
        jsr L_b2f5 + $d
        ldx #$00
        ldy #$7c
        stx $b2
        sty $b3
        ldx #$00
        ldy #$d2
        stx $b0
        sty $b1
        ldx #$02
        jsr L_b2f5 + $d
        ldx #$00
        ldy #$5c
        stx $b2
        sty $b3
        ldx #$0c
        jsr L_b2f5 + $d
        ldx #$00
        ldy #$48
        stx $b2
        sty $b3
        ldx #$00
        ldy #$a6
        stx $b0
        sty $b1
        ldx #$04
        jsr L_b2f5 + $d
        ldx #$00
        ldy #$74
        stx $b2
        sty $b3
        ldx #$04
        jsr L_b2f5 + $d
        ldx #$00
        ldy #$10
        stx $b2
        sty $b3
        ldx #$00
        ldy #$08
        stx $b0
        sty $b1
        ldy #$00
        jsr L_b305 + $a
        jsr L_30a0
        jsr L_138e
        sei 
        lda #$25
        sta $01
        lda L_dd00 + $2
        ora #$03
        sta L_dd00 + $2
        lda L_dd00
        and #$fc
        ora #$02
        sta L_dd00
        jsr L_aff6 + $a
        ldx #$93
        ldy #$3f
        stx $fffe
        sty $ffff
        ldx #$9d
        ldy #$09
        stx L_7ff7 + $9
        sty L_7ff7 + $a
        stx L_7ff7 + $b
        sty L_7ff7 + $c
        stx $fffc
        sty $fffd
        ldx #$d6
        ldy #$3f
        stx $fffa
        sty $fffb
        lda #$01
        sta L_d010 + $a
        lda #$80
        sta L_d010 + $2
        lda #$7f
        sta L_dc00 + $d
        sta L_dd00 + $d
        lda L_dc00 + $d
        lda L_dd00 + $d
        jsr L_25e5
        ldx #$00
        ldy #$48
        stx $1c
        sty $1d
        ldx #$04
        lda #$30
        jsr L_b189
        lda #$1f
        sta $b1b9
        jsr L_b1b4
        lda #$01
        sta $b1b9
        jsr L_b1b4
        lda #$01
        sta $5c
        cli 
    L_0a20:
        ldx #$ff
        txs 
        lda #$f0
        sta $4a
        ldx #$00
        ldy #$dc
        stx L_b016 + $f
        sty L_b026
        ldx #$01
        ldy #$dc
        stx L_b026 + $2
        sty L_b026 + $3
        ldy #$26
    L_0a3d:
        lda L_315e + $c,y
        sta L_d800,y
        and #$f7
        sta L_d820 + $8,y
        lda L_318e + $4,y
        sta L_d850,y
        lda L_31ae + $c,y
        sta L_d870 + $8,y
        dey 
        bpl L_0a3d
        ldx #$26
        ldy #$31
        jsr L_b295
        ldx #$30
        ldy #$31
        jsr L_b295
        jsr L_23ef
        jsr L_2415
        lda #$03
        sta $5b
    L_0a6f:
        jsr L_17cc
        lda #$00
        sta L_d010 + $5
        sta $5a
        sta $28
        lda #$11
        sta $90
        lda #$30
        jsr L_2397
        ldx #$a0
        ldy #$d8
        stx $1c
        sty $1d
        ldx #$78
        ldy #$37
        stx $1a
        sty $1b
        ldy #$14
        jsr L_23a5
        ldx #$76
        ldy #$35
        jsr L_b295
        ldx #$7f
        ldy #$35
        jsr L_b295
        ldx #$8a
        ldy #$35
        jsr L_b295
        ldx #$97
        ldy #$35
        jsr L_b295
        ldx #$b0
        ldy #$35
        jsr L_b295
        ldx #$cd
        ldy #$35
        jsr L_b295
        ldx #$50
        ldy #$31
        jsr L_b295
        jsr L_2150
        lda $18
        bne L_0ad4
        jmp L_0b65
    L_0ad4:
        lda #$00
        sta $26
        lda #$0f
        sta $8d
        jsr L_20ec
        lda #$fc
        sta $2e
        jsr L_217e
        lda $18
        bne L_0aed
        jmp L_0b65
    L_0aed:
        jsr L_17cc
        lda #$30
        jsr L_2397
        ldx #$a0
        ldy #$d8
        stx $1c
        sty $1d
        ldx #$63
        ldy #$37
        stx $1a
        sty $1b
        ldy #$14
        jsr L_23a5
        ldx #$e1
        ldy #$35
        jsr L_b295
        ldx #$f0
        ldy #$35
        jsr L_b295
        ldx #$06
        ldy #$36
        jsr L_b295
        ldx #$1c
        ldy #$36
        jsr L_b295
        ldx #$32
        ldy #$36
        jsr L_b295
        ldx #$48
        ldy #$36
        jsr L_b295
        ldx #$5e
        ldy #$36
        jsr L_b295
        ldx #$74
        ldy #$36
        jsr L_b295
        ldx #$8a
        ldy #$36
        jsr L_b295
        jsr L_2150
        lda $18
        beq L_0b65
        ldx #$b9
        ldy #$36
        jsr L_b295
        lda #$13
        sta $90
        jsr L_21b5
        lda $18
        beq L_0b65
        jmp L_0a6f
    L_0b65:
        ldx #$08
    L_0b67:
        lda L_348e + $8,x
        sta $0250,x
        sta $0260,x
        sta $20,x
        dex 
        bpl L_0b67
        lda #$12
        sta $90
        lda #$02
        sta $5d
        jsr L_19b7
        lda #$2f
        sta L_3f49 + $1
        lda #$01
        sta $5d
        lda #$02
        sta $5a
        lda #$09
        sta $8d
        lda #$1f
        sta $b1b9
        jsr L_b1b4
        lda #$01
        sta $b1b9
        jsr L_b1b4
    L_0ba1:
        ldx #$08
        lda $5c
        cmp #$01
        beq L_0bcc
        lda $5d
        cmp #$01
        beq L_0bcc
    L_0baf:
        lda $0260,x
        sta $20,x
        dex 
        bpl L_0baf
        lda #$1f
        sta $b1b9
        lda $25
        bne L_0bf2
        ldx #$08
        dec $5d
        lda $0255
        bne L_0bcc
        jmp L_0a20
    L_0bcc:
        lda $0250,x
        sta $20,x
        dex 
        bpl L_0bcc
        lda #$01
        sta $b1b9
        lda $25
        bne L_0bf2
        ldx #$08
        lda $5c
        cmp #$01
        bne L_0be8
        jmp L_0a20
    L_0be8:
        inc $5d
        lda $0265
        bne L_0baf
        jmp L_0a20
    L_0bf2:
        lda $5c
        bne L_0c19
        lda $5d
        cmp #$01
        beq L_0c09
        ldx #$00
        ldy #$dc
        stx L_b016 + $f
        sty L_b026
        jmp L_0c13
    L_0c09:
        ldx #$01
        ldy #$dc
        stx L_b016 + $f
        sty L_b026
    L_0c13:
        stx L_b026 + $2
        sty L_b026 + $3
    L_0c19:
        jsr L_17cc
        ldx #$50
        ldy #$31
        jsr L_b295
        jsr L_19b7
        jsr L_3008
        lda #$00
        sta L_d010 + $5
        lda #$30
        jsr L_2397
        ldx #$bf
        ldy #$37
        stx $1a
        sty $1b
        ldx #$a0
        ldy #$d8
        stx $1c
        sty $1d
        ldy #$0d
        jsr L_23a5
        ldx #$ee
        ldy #$37
        jsr L_b295
        lda $5d
        cmp #$01
        beq L_0c5f
        ldx #$e3
        ldy #$37
        jsr L_b295
        jmp L_0c66
    L_0c5f:
        ldx #$d8
        ldy #$37
        jsr L_b295
    L_0c66:
        lda $25
        ldx #$30
        lsr 
        lsr 
        lsr 
        lsr 
        beq L_0c71
        tax 
    L_0c71:
        stx L_37f9 + $2
        lda $25
        and #$0f
        sta L_37f9 + $3
        ldx #$f9
        ldy #$37
        jsr L_b295
        ldx #$f9
        ldy #$34
        jsr L_b295
        lda #$f1
        sta L_d020 + $6
        lda #$fe
        sta L_d020 + $5
        ldx #$cc
        ldy #$32
        stx $1a
        sty $1b
        jsr L_b285 + $2
        jsr L_b265 + $d
        jsr L_3086
        lda #$03
        sta $91
        lda #$04
        sta $92
        lda #$05
        sta $93
        lda #$bf
        sta $62
    L_0cb4:
        jsr L_13b1
        lda $18
        beq L_0cd7
        lda $62
        beq L_0cd7
        jsr L_2b6d
        jsr L_b05d
        inc $0e
        lda $0e
        cmp #$50
        bcc L_0cd1
        lda #$40
        sta $0e
    L_0cd1:
        jsr L_b13f
        jmp L_0cb4
    L_0cd7:
        lda #$12
        sta $90
        sei 
        jsr L_0e23
        cli 
        jsr L_20ec
        jsr L_1a38
        jsr L_2839
        lda $4b
        sta L_d020 + $e
        ldy #$07
    L_0cf0:
        lda L_32e0 + $d,y

        .byte $99,$35,$00

        dey 
        bpl L_0cf0
    L_0cf9:
        lda $2f
        bne L_0cf9
        jsr L_2a17
        jsr L_2b40
        jsr L_2beb
        jsr L_2ed7
        jsr L_2fc8
        jsr L_1bfd
        inc $62
        jsr L_b016 + $3
        lda $62
        and #$07
        tay 
        lda L_36cd + $8,y
        sta $0d27
        lda L_36cd,y
        sta $0d26
        jsr L_22d3
        jsr L_292f
        jsr L_2576
        jsr L_2635
        jsr L_268c
        jsr L_2713
        jsr L_166d
        lda $85
        bpl L_0d41
        jmp L_0e19
    L_0d41:
        lda $32
        beq L_0cf9
    L_0d45:
        lda $27
        cmp $26
        beq L_0d69
        sta $26
        cmp #$10
        bcc L_0d62
        lda #$01
        sta $27
        sta $26
        lda $28
        clc 
        adc #$10
        cmp #$40
        bcs L_0d62
        sta $28
    L_0d62:
        lda #$00
        sta $24
        jmp L_0c19
    L_0d69:
        jsr L_245b
        lda $24
        sec 
        sbc #$04
        bpl L_0d75
        lda #$00
    L_0d75:
        sta $24
        sed 
        sec 
        lda $25
        sbc #$01
        sta $25
        cld 
        bne L_0de8
        jsr L_19b7
        jsr L_17cc
        lda #$30
        jsr L_2397
        ldx #$a0
        ldy #$d8
        stx $1c
        sty $1d
        ldx #$cd
        ldy #$37
        stx $1a
        sty $1b
        ldy #$0a
        jsr L_23a5
        lda $5d
        cmp #$01
        beq L_0db2
        ldx #$e3
        ldy #$37
        jsr L_b295
        jmp L_0db9
    L_0db2:
        ldx #$d8
        ldy #$37
        jsr L_b295
    L_0db9:
        ldx #$08
        ldy #$38
        jsr L_b295
        ldx #$50
        ldy #$31
        jsr L_b295
        lda #$1c
        sta $91
        lda #$1d
        sta $92
        lda #$1e
        sta $93
        lda #$90
        sta $62
    L_0dd7:
        jsr L_13b1
        lda $18
        beq L_0de2
        lda $62
        bne L_0dd7
    L_0de2:
        jsr L_b265 + $d
        jsr L_17f8
    L_0de8:
        jsr L_19b7
        ldx #$08
        lda $5d
        cmp #$01
        beq L_0e02
    L_0df3:
        lda $20,x
        sta $0260,x
        dex 
        bpl L_0df3
        lda #$01
        sta $5d
        jmp L_0ba1
    L_0e02:
        lda $20,x
        sta $0250,x
        dex 
        bpl L_0e02
        lda $5c
        sta $5d
        cmp #$01
        beq L_0e16
        lda #$02
        sta $5d
    L_0e16:
        jmp L_0ba1
    L_0e19:
        jsr L_1413
        lda #$00
        sta $32
        jmp L_0d45
    L_0e23:
        lda $90
        beq L_0e67
        cmp #$02
        bne L_0e2e
        jmp L_0f5c
    L_0e2e:
        cmp #$01
        bne L_0e35
        jmp L_0e6b
    L_0e35:
        cmp #$03
        bne L_0e3c
        jmp L_0f5c
    L_0e3c:
        cmp #$11
        beq L_0e49
        cmp #$12
        beq L_0e5f
        cmp #$13
        beq L_0e49
        rts 
    L_0e49:
        jsr L_1108
        lda $95
        sta $ef
        lda #$01
        sta $f2
        lda #$00
        sta L_3e99
        lda #$fe
        sta L_3e99 + $1
        rts 
    L_0e5f:
        jsr L_1108
        lda #$0f
        sta $ef
        rts 
    L_0e67:
        jsr L_1108
    L_0e6a:
        rts 
    L_0e6b:
        dec $f2
        beq L_0e72
        jmp L_0f5c
    L_0e72:
        lda #$05
        sta $f2
        lda L_3e99 + $1
        cmp #$ff
        beq L_0e6a
        cmp #$fe
        bne L_0eb3
    L_0e81:
        lda L_3e99
        asl 
        clc 
        adc L_3e99
        tay 
        lda L_3d29 + $3,y
        sta L_3e99 + $1
        ldx #$00
        cmp #$ff
        bne L_0e97
        rts 
    L_0e97:
        lda L_3d29 + $3,y
        sty $a0
        tay 
        lda L_3d69 + $8,y
        sta $f3,x
        lda L_3d89 + $7,y
        sta $fc,x
        lda #$01
        sta $f6,x
        ldy $a0
        iny 
        inx 
        cpx #$03
        bne L_0e97
    L_0eb3:
        lda #$00
        sta $9f
    L_0eb7:
        tax 
        dec $f6,x
        beq L_0ebf
        jmp L_0f51
    L_0ebf:
        lda $fc,x
        sta $a3
        lda $f3,x
        sta $a2
        ldy #$00
        lda ($a2),y
        bne L_0ee4
        iny 
        lda ($a2),y
        and #$07
        eor #$ff
        sec 
        adc #$07
        sta $f9,x
        lda ($a2),y
        iny 
        and #$f0
        lsr 
        lsr 
        lsr 
        lsr 
        sta $a4,x
    L_0ee4:
        lda ($a2),y
        cmp #$ff
        bne L_0ef5
        ldy #$fe
        sty L_3e99 + $1
        inc L_3e99
        jmp L_0e81
    L_0ef5:
        tya 
        sec 
        adc $f3,x
        sta $f3,x
        lda #$00
        adc $fc,x
        sta $fc,x
        lda ($a2),y
        and #$f0
        bne L_0f0c
        lda #$10
        jmp L_0f10
    L_0f0c:
        lsr 
        lsr 
    L_0f0e:
        lsr 
    L_0f0f:
        lsr 
    L_0f10:
        sta $f6,x
        lda $f9,x
        tax 
        lda ($a2),y
        and #$0f
        tay 
        lda L_3d09 + $7,y
        sta $f0
        lda L_3cf9 + $7,y
    L_0f22:
        lsr 
        ror $f0
        dex 
        bne L_0f22
        sta $f1
        ldx $9f
        lda $a4,x
        tay 
        clc 
        adc #$27
        sta $91,x
        lda L_3d19 + $5,y
        sta $a3
        lda L_3d19 + $c,y
        sta $a2
        lda $f0
        ldy #$01
        sta ($a2),y
        ldy #$0d
        sta ($a2),y
        lda $f1
        iny 
        sta ($a2),y
        ldy #$02
        sta ($a2),y
    L_0f51:
        inc $9f
        lda $9f
        cmp #$03
        beq L_0f5c
        jmp L_0eb7
    L_0f5c:
        lda $ef
        ora #$80
        sta L_d410 + $8
        ldy #$00
        sty $9f

    L_0f67:
         .byte $b9,$91,$00

        beq L_0f78
        bmi L_0f72
        ldx $96,y
        bmi L_0f78

    L_0f72:
         .byte $99,$96,$00

        jsr L_105d
    L_0f78:
        ldy $9f
        lda #$00

        .byte $99,$91,$00

        iny 
        sty $9f
        cpy #$03
        bcc L_0f67
        ldx #$00
        stx $a0
        stx $9f
    L_0f8c:
        jsr L_1100
        ldx $a0
        lda $c6,x
        bne L_0f98
        jmp L_103f
    L_0f98:
        lda $c0,x
        clc 
        adc $c2,x
        sta $c0,x
    L_0f9f:
        ldy $a1
        sta L_d400,y
        lda $c1,x
        adc $c3,x
        sta $c1,x
        sta L_d400 + $1,y
        lda $c7,x
        clc 
        adc $c9,x
        sta $c7,x
        sta L_d400 + $2,y
        lda $c8,x
        adc $ca,x
        sta $c8,x
        sta L_d400 + $3,y
        beq L_0fc6
        cmp #$0f
        bcc L_0fd7
    L_0fc6:
        lda $c9,x
        eor #$ff
        clc 
        adc #$01
        sta $c9,x
        lda $ca,x
        eor #$ff
        adc #$00
        sta $ca,x
    L_0fd7:
        ldx $9f
        ldy $99,x
        beq L_0fed
        dey 
        sty $99,x
        bne L_0fed
        ldx $9f
        lda $9c,x
        and #$fe
        ldy $a1
        sta L_d400 + $4,y
    L_0fed:
        ldx $a0
        ldy $c4,x
        dey 
        sty $c4,x
        bne L_104c
        lda $c5,x
        sta $c4,x
        lda $cb,x
        cmp #$01
        beq L_1025
        lda $c2,x
        eor #$ff
        clc 
        adc #$01
        sta $c2,x
        lda $c3,x
        eor #$ff
        adc #$00
        sta $c3,x
        lda $c9,x
        eor #$ff
        clc 
        adc #$01
        sta $c9,x
        lda $ca,x
        eor #$ff
        adc #$00
        sta $ca,x
        jmp L_102d
    L_1025:
        lda $cc,x
        sta $c0,x
        lda $cd,x
        sta $c1,x
    L_102d:
        ldy $c6,x
        dey 
        sty $c6,x
        bne L_104c
        jsr L_10a5
        lda $ce,x
        beq L_103f
        ldx $9f
        sta $91,x
    L_103f:
        ldx $9f
    L_1041:
        lda #$00
        sta $96,x
        cpx #$02
        bne L_104c
        jsr L_112b
    L_104c:
        inc $9f
        ldy $9f
        cpy #$03
        bcs L_105c
        lda L_1141 + $3,y
        sta $a0
        jmp L_0f8c
    L_105c:
        rts 
    L_105d:
        jsr L_1100
        lda #$00
        sta $a3

        .byte $b9,$96,$00

        sec 
        sbc #$01
        and #$7f
        asl 
        rol $a3
        asl 
        rol $a3
        asl 
        rol $a3
        asl 
        rol $a3
        clc 
        adc #$ab
        sta $a2
        lda #$39
        adc $a3
        sta $a3
        ldy #$00
        lda ($a2),y
        jsr L_10ba
        ldy $9f
        ldx L_1141 + $6,y
        ldy #$0f
    L_1091:
        lda ($a2),y
        sta $c0,x
    L_1095:
        dex 
        dey 
        bne L_1091
        lda $9f
        cmp #$02
        bne L_10a4
        lda #$00
        sta $0f5f
    L_10a4:
        rts 
    L_10a5:
        ldy $a1
        lda #$00
        sta L_d400 + $6,y
        sta L_d400 + $5,y
        lda #$08
        sta L_d400 + $4,y
        lda #$00
        sta L_d400 + $4,y
        rts 
    L_10ba:
        asl 
        asl 
        sta $a0
        jsr L_10a5
        ldx #$03
        ldy $a1
    L_10c5:
        lda L_1141 + $9,x
        sta L_d400,y
        iny 
        dex 
        bpl L_10c5
        sty $a1
        ldx #$03
    L_10d3:
        ldy $a0
        lda L_3938 + $f,y
        inc $a0
        ldy $a1
        sta L_d400,y
        inc $a1
        dex 
        bne L_10d3
        ldy $a0
        lda L_3938 + $f,y
        ldx $9f
        sta $99,x
        dey 
        dey 
        dey 
        lda L_3938 + $f,y
        sta $9c,x
        ora #$01
        ldy $a1
        dey 
        dey 
        dey 
        sta L_d400,y
        rts 
    L_1100:
        ldx $9f
        lda L_1141,x
        sta $a1
        rts 
    L_1108:
        and #$0f
        sta $90
        ldy #$18
        lda #$00
    L_1110:
        sta L_d400,y
        dey 
        bpl L_1110
        sta $96
        sta $97
        sta $98
        sta $91
        sta $92
        sta $93
        lda #$80
        sta $0f5f
        jsr L_112b
        rts 
    L_112b:
        lda #$ff
        sta L_d400 + $e
        sta L_d400 + $f
        lda #$00
        sta L_d410 + $3
        sta L_d410 + $4
        lda #$81
        sta L_d410 + $2
        rts 

    L_1141:
         .byte $00,$07,$0e,$00,$0f,$1e,$0e,$1d,$2c,$08,$00,$00,$00

    L_114e:
        lda #$f0
        sta $4a
        sta L_d020 + $2
        sta L_d020 + $3
        ldx #$a0
        ldy #$a6
        stx $b2
        sty $b3
        ldx #$a0
        ldy #$48
        stx $b0
        sty $b1
    L_1168:
        lda $2f
        bne L_1168
    L_116c:
        lda $2f
        beq L_116c
        ldx #$03
        jsr L_b2f5 + $d
        ldy #$50
        jsr L_b305 + $a
        ldx #$00
        ldy #$d2
        stx $b2
        sty $b3
        ldx #$00
        ldy #$7c
        stx $b0
        sty $b1
        sei 
        lda #$24
        sta $01
        ldx #$02
        jsr L_b2f5 + $d
        lda #$25
        sta $01
        cli 
        lda #$04
        sta $8f
    L_119d:
        lda $2f
        beq L_119d
    L_11a1:
        lda $2f
        bne L_11a1
        jsr L_2b6d
        ldy $8f
        lda L_38d8 + $6,y
        sta $4a
        lda L_38d8 + $b,y
        sta L_d020 + $2
        lda L_38e8,y
        sta L_d020 + $3
        dec $8f
        bpl L_119d
        ldy #$00
        jsr L_b244
        jsr L_b244
        lda $26
        sta $ad
        lda #$06
        sta $a9
        lda #$09
        sta $a8
        lda $28
        lsr 
        lsr 
        lsr 
        lsr 
        adc $26
        tay 
        lda L_310a,y
        sta $ae
        sta $62
    L_11e3:
        jsr L_b265 + $d
        lda L_d410 + $b
        and #$01
        sta $ac
        lda $a8
        clc 
        adc $ad
        sta $aa
        jsr L_12f2
        lda L_d410 + $b
        and #$01
        sta $ab
        lda #$01
        sta $a7
    L_1202:
        lda $2f
        beq L_1202
    L_1206:
        lda $2f
        bne L_1206
        jsr L_b016 + $3
        jsr L_1347
        jsr L_2b6d
        dec $a7
        bne L_1237
        lda $ab
        eor #$01
        sta $ab
        ldy $a9
        lda $3921,y
        sta $a7
        ldy $a9
        lda L_3c8e + $7,y
        ldx $ab
        cpx $ac
        bne L_1230
        lsr 
    L_1230:
        sta L_3af1 + $c
        lda #$16
        sta $92
    L_1237:
        lda $ab
        beq L_1284
        ldy $a9
        ldx L_3910 + $3,y
        lda L_b355 + $b,x
        sta $15
        lda L_340e + $1,x
        sta $1d
        lda L_b375 + $4,x
        clc 
        adc L_3910 + $a,y
        sta $14
        sta $1c
        bcc L_125b
        inc $15
        inc $1d
    L_125b:
        jsr L_1313
        ldy $a9
        ldx L_3900 + $5,y
        lda L_b355 + $b,x
        sta $15
        lda L_340e + $1,x
        sta $1d
        lda L_b375 + $4,x
        clc 
        adc L_3900 + $c,y
        sta $14
        sta $1c
        bcc L_127e
        inc $15
        inc $1d
    L_127e:
        jsr L_1339
        jmp L_12ca
    L_1284:
        ldy $a9
        ldx L_3900 + $5,y
        lda L_b355 + $b,x
        sta $15
        lda L_340e + $1,x
        sta $1d
        lda L_b375 + $4,x
        clc 
        adc L_3900 + $c,y
        sta $14
        sta $1c
        bcc L_12a4
        inc $15
        inc $1d
    L_12a4:
        jsr L_1313
        ldy $a9
        ldx L_3910 + $3,y
        lda L_b355 + $b,x
        sta $15
        lda L_340e + $1,x
        sta $1d
        lda L_b375 + $4,x
        clc 
        adc L_3910 + $a,y
        sta $14
        sta $1c
        bcc L_12c7
        inc $15
        inc $1d
    L_12c7:
        jsr L_1339
    L_12ca:
        lda $a8
        beq L_12e6
        lda $18
        beq L_12d5
        jmp L_1202
    L_12d5:
        lda $ab
        cmp $ac
        beq L_12e6
        lda $aa
        sta $ad
        dec $a9
        beq L_12e6
        jmp L_11e3
    L_12e6:
        ldy #$00
        jsr L_b244
        jsr L_b244
        jsr L_b244
        rts 
    L_12f2:
        lda #$80
        sta L_3928
        sta L_3928 + $1
        lda $aa
        sec 
    L_12fd:
        sbc #$0a
        bcc L_1306
        inc L_3928
        bne L_12fd
    L_1306:
        adc #$0a
        sec 
    L_1309:
        sbc #$01
        bcc L_1312
        inc L_3928 + $1
        bne L_1309
    L_1312:
        rts 
    L_1313:
        ldy #$03
        ldx $a9
        lda $ab
        cmp $ac
        beq L_132b
    L_131d:
        lda L_3928,y
        sta ($14),y
        lda L_3928 + $8,x
        sta ($1c),y
        dey 
        bpl L_131d
        rts 
    L_132b:
        lda L_3928 + $4,y
        sta ($14),y
        lda L_3928 + $8,x
        sta ($1c),y
        dey 
        bpl L_132b
        rts 
    L_1339:
        ldy #$03
    L_133b:
        lda #$20
        sta ($14),y
        lda #$f0
        sta ($1c),y
        dey 
        bpl L_133b
        rts 
    L_1347:
        inc $62
        bne L_138d
        dec $a8
        ldy $a8
        lda L_3c8b,y
        sta L_3ae1 + $c
        lda #$15
        sta $91
        lda $ae
        sta $62
        lda L_491a + $2
        sec 
        sbc #$02
        sta L_491a + $2
        sta L_493a
        lda L_491a + $3
        sec 
        sbc #$02
        sta L_491a + $3
        sta L_493a + $1
        lda L_4942 + $2
        sec 
        sbc #$02
        sta L_4942 + $2
        sta L_4962
        lda L_4942 + $3
        sec 
        sbc #$02
        sta L_4942 + $3
        sta $4963
    L_138d:
        rts 
    L_138e:
        ldy #$47
    L_1390:
        lda L_77fd + $3,y
        sta L_7180 + $8,y
        lda L_7845 + $b,y
        sta L_7588,y
        dey 
        bpl L_1390
        ldy #$07
    L_13a1:
        lda L_7845 + $3,y
        sta L_73df + $9,y
        lda L_7897 + $1,y
        sta L_77dd + $b,y
        dey 
        bpl L_13a1
        rts 
    L_13b1:
        jsr L_b016 + $3
        jsr L_22d3
        ldy #$18
        jsr L_b244
        inc $62
        rts 
    L_13bf:
        lda $2f
        bne L_13bf
        jsr L_2a17
        jsr L_2b40
        jsr L_2beb
        jsr L_2ed7
        jsr L_2fc8
        jsr L_b016 + $3
        jsr L_2b6d
        lda $5f
        sta $17
        jsr L_22d3
        inc $62
        jsr L_292f
        jsr L_2576
        jsr L_2635
        rts 
    L_13eb:
        lda $2f
        bne L_13eb
        jsr L_2a17
        jsr L_2b40
        jsr L_2beb
        jsr L_2ed7
        jsr L_2fc8
        jsr L_b016 + $3
        lda #$00
        sta $16
        sta $17
        inc $62
        jsr L_2576
        jsr L_2635
        jsr L_27d5
        rts 
    L_1413:
        lda #$00
        sta $16
        lda #$ff
        sta $5f
        lda #$92
        sta $91
        lda #$93
        sta $92
    L_1423:
        jsr L_13bf
        jsr L_2713
        jsr L_1bfd
        lda $2936
        sta $49
        lda $2e
        beq L_1437
        bne L_143b
    L_1437:
        lda #$00
        sta $5f
    L_143b:
        lda $62
        and #$03
        bne L_1423
        dec $3d
        lda $3d
        cmp #$05
        bcs L_1423
        lda #$00
        sta $5f
        lda #$a0
        sta $62
    L_1451:
        jsr L_13bf
        jsr L_2713
        lda $62
        bne L_1451
        lda L_d010 + $5
        sta $85
        lda #$00
        sta L_d010 + $5
        lda #$1f
        sta $0f
        lda #$14
        sta $91
        sta $93
        lda #$06
        sta $92
    L_1473:
        jsr L_15d4
        jsr L_1627
        dec $0f
        bne L_1473
        jsr L_114e
        lda $a8
        bne L_1487
        jmp L_15bd
    L_1487:
        jsr L_17cc
        lda #$30
        jsr L_2397
        ldx #$a0
        ldy #$d8
        stx $1c
        sty $1d
        ldx #$8d
        ldy #$37
        stx $1a
        sty $1b
        ldy #$14
        jsr L_23a5
        ldx #$15
        ldy #$38
        jsr L_b295
        lda #$17
        sta $91
        ldy #$00
        jsr L_b244
        jsr L_b244
        jsr L_b244
        ldx #$31
        ldy #$38
        jsr L_b295
        lda #$18
        sta $92
        ldy #$00
        jsr L_b244
        jsr L_b244
        lda #$0d
        sta L_3859 + $f
        lda $87
        sta $8f
        lda #$00
        sta $59
        jsr L_176e
        ldx #$51
        ldy #$38
        jsr L_b295
        lda #$19
        sta $92
        ldy #$00
        jsr L_b244
        jsr L_b244
        lda #$13
        sta L_3859 + $f
        lda $ad
        sta $8f
        lda #$00
        sta $59
        jsr L_176e
        lda #$c0
        sta $62
    L_1504:
        jsr L_13b1
        lda $18
        beq L_150f
        lda $62
        bmi L_1504
    L_150f:
        lda #$ff
        sta $54
        jsr L_1a54
        jsr L_173b
        jsr L_2532
        jsr L_2f33
        jsr L_17e2
        lda #$c0
        sta L_d010 + $5
        lda #$22
        sta $91
        lda #$23
        sta $92
        jsr L_13bf
        jsr L_2713
        lda #$01
        sta $5f
        ldy #$80
        jsr L_b244
    L_153e:
        jsr L_13bf
        jsr L_2713
        lda $2936
        sta $49
        lda $2e
        cmp #$fb
        bcs L_153e
        lda $3d
        cmp #$18
        bcs L_155a
        inc $3d
        jmp L_153e
    L_155a:
        jsr L_13bf
        jsr L_268c
        jsr L_2713
        lda $45
        and #$04
        beq L_155a
        lda #$ff
        sta $5f
    L_156d:
        jsr L_13bf
        jsr L_268c
        jsr L_2713
        jsr L_b1b4
        lda $2a
        cmp #$0e
        bcs L_1582
        jsr L_16d2
    L_1582:
        lda L_d410 + $b
        and #$3f
        bne L_1593
        lda $45
        cmp #$05
        bne L_1593
        ora #$80
        sta $46
    L_1593:
        lda $2e
        cmp #$07
        bcc L_15a3
        lda #$07
        sta $2e
        lda #$00
        sta $2d
        sta $5f
    L_15a3:
        lda L_d410 + $b
        cmp #$f0
        bcc L_15b2
        and #$01
        tay 
        lda #$1a

        .byte $99,$91,$00

    L_15b2:
        lda $2a
        cmp #$02
        bcs L_156d
        inc $27
        inc $32
        rts 
    L_15bd:
        jsr L_19b7
        jsr L_2532
        jsr L_1a54
        jsr L_2f33
        jsr L_2beb
        lda #$c0
        sta L_d010 + $5
        inc $32
        rts 
    L_15d4:
        lda $2f
        bne L_15d4
        ldx #$a0
        ldy #$48
        stx $1a
        sty $1b
        ldx #$a0
        ldy #$d8
        stx $12
        sty $13
        lda #$1e
        sta $8f
    L_15ec:
        ldy #$01
    L_15ee:
        lda ($1a),y
        dey 
        sta ($1a),y
        iny 
        lda ($12),y
        dey 
        sta ($12),y
        iny 
        iny 
        cpy $8f
        bcc L_15ee
        dey 
        lda #$20
        sta ($1a),y
        lda #$f8
        sta ($12),y
        clc 
        lda $1a
        adc #$28
        sta $1a
        bcc L_1613
        inc $1b
    L_1613:
        clc 
        lda $12
        adc #$28
        sta $12
    L_161a:
        bcc L_161e
        inc $13
    L_161e:
        dec $8f
        lda $8f
        cmp #$09
        bcs L_15ec
        rts 
    L_1627:
        ldx #$a0
        ldy #$48
        stx $1a
        sty $1b
        ldx #$a0
        ldy #$d8
        stx $12
        sty $13
        lda #$1d
        sta $8f
    L_163b:
        ldy #$26
    L_163d:
        lda ($1a),y
        iny 
        sta ($1a),y
        dey 
        lda ($12),y
        iny 
        sta ($12),y
        dey 
        dey 
        cpy $8f
        bcs L_163d
        clc 
        lda $1a
        adc #$28
        sta $1a
        bcc L_1659
        inc $1b
    L_1659:
        clc 
        lda $12
        adc #$28
        sta $12
        bcc L_1664
        inc $13
    L_1664:
        dec $8f
        lda $8f
        cmp #$09
        bcs L_163b
        rts 
    L_166d:
        lda $85
        beq L_1676
        cmp #$01
        beq L_1683
    L_1675:
        rts 
    L_1676:
        ldy $24
        lda ($6d),y
        cmp #$ff
        bne L_1675
        lda #$01
        sta $85
        rts 
    L_1683:
        lda $86
        cmp #$6f
        bne L_16b4
        lda $45
        cmp #$01
        bne L_16b4
        lda #$80
        sta $85
        lda $2936
        sta $49
        ldy #$05
    L_169a:
        lda L_a489 + $7,y
        beq L_16a9
    L_169f:
        lda #$06
        sta L_a489 + $7,y
        lda #$14
        sta L_4be9 + $f,y
    L_16a9:
        dey 
        bpl L_169a
    L_16ac:
        ldx #$50
        ldy #$31
        jsr L_b295
        rts 
    L_16b4:
        lda $88
        bne L_16bc
        lda #$ff
        sta $88
    L_16bc:
        lda $62
        and #$1f
        beq L_16ac
        cmp #$10
        bne L_1675
        ldx #$5e
        ldy #$31
        jsr L_b295
        lda #$8f
        sta $91
        rts 
    L_16d2:
        lda $89
        sta $12
        lda $8a
        sta $13
        cmp #$82
        bne L_16e4
        lda $89
        cmp #$20
        bcc L_173a
    L_16e4:
        ldx #$11
    L_16e6:
        ldy L_a4c9 + $7,x
        lda ($12),y
        cmp #$20
        beq L_16f9
        lda L_d410 + $b
        and #$01
        clc 
        adc #$f9
        sta ($12),y
    L_16f9:
        iny 
        lda ($12),y
        cmp #$20
        beq L_170a
        lda L_d410 + $b
        and #$01
        clc 
        adc #$fb
        sta ($12),y
    L_170a:
        iny 
        lda ($12),y
        cmp #$20
        beq L_171b
        lda L_d410 + $b
        and #$01
        clc 
        adc #$fd
        sta ($12),y
    L_171b:
        iny 
        lda #$20
        sta ($12),y
        iny 
        sta ($12),y
        iny 
        sta ($12),y
        inc $13
        inc $13
        dex 
        bne L_16e6
        lda $89
        sec 
        sbc #$01
        sta $89
        lda $8a
        sbc #$00
        sta $8a
    L_173a:
        rts 
    L_173b:
        ldx #$e0
        ldy #$83
        stx $89
        sty $8a
        ldx #$11
        lda #$08
        sta $0f
    L_1749:
        lda L_d410 + $b
        cmp #$55
        bcc L_1765
        cmp #$aa
        bcc L_175d
        lda $0f
        beq L_1765
        dec $0f
        jmp L_1765
    L_175d:
        lda $0f
        cmp #$10
        bcs L_1765
        inc $0f
    L_1765:
        lda $0f
        sta L_a4c9 + $7,x
        dex 
        bne L_1749
        rts 
    L_176e:
        lda #$00
        sta $3870
        sta L_3871
        sta $3875
        sta L_3876
        lda $8f
    L_177e:
        sec 
        sbc #$0a
        bcc L_178c
        inc $3870
        inc $3875
        jmp L_177e
    L_178c:
        clc 
        adc #$0a
    L_178f:
        sec 
        sbc #$01
        bcc L_179d
        inc L_3871
        inc L_3876
        jmp L_178f
    L_179d:
        ldx #$68
        ldy #$38
        jsr L_b295
        lda $59
        bne L_17b3
        ldy #$00
        jsr L_b244
        jsr L_b244
        jsr L_b244
    L_17b3:
        inc $59
        lda $8f
        beq L_17cb
        ldy #$04
        jsr L_19f5
        jsr L_b1b4
        ldy #$20
        jsr L_b244
        dec $8f
        jmp L_176e
    L_17cb:
        rts 
    L_17cc:
        lda $2f
        bne L_17cc
        lda #$f0
        sta L_d020 + $1
        sei 
        ldx #$93
        ldy #$3f
        stx $fffe
        sty $ffff
        cli 
        rts 
    L_17e2:
        lda $2f
        bne L_17e2
        lda #$fc
        sta L_d010 + $2
        sei 
        ldx #$00
        ldy #$3f
        stx $fffe
        sty $ffff
        cli 
        rts 
    L_17f8:
        lda #$09
        sta $85
        ldx #$8a
        ldy #$36
        stx $1a
        sty $1b
        ldx #$00
    L_1806:
        ldy #$a4
        stx $14
        sty $15
    L_180c:
        ldy #$12
    L_180e:
        lda ($1a),y

        .byte $d9,$0e,$00

        bcc L_181f
        beq L_181a
        jmp L_184a
    L_181a:
        iny 
        cmp #$16
        bcc L_180e
    L_181f:
        ldy #$05
    L_1821:
        lda ($1a),y
        sta ($14),y
        iny 
        cpy #$16
        bcc L_1821
        dec $85
        ldx $1a
        ldy $1b
        stx $14
        sty $15
        lda $1a
        sec 
        sbc #$16
        sta $1a
        lda $1b
        sbc #$00
        sta $1b
        lda $85
        cmp #$01
        beq L_1851
        jmp L_180c
    L_184a:
        lda $85
        cmp #$09
        bne L_1851
        rts 
    L_1851:
        ldx #$00
        stx $10
        lda #$28
        sta L_38bd
        sta L_38be
        ldx #$50
        ldy #$31
        jsr L_b295
        ldx #$9c
        ldy #$38
        jsr L_b295
        ldx #$7a
        ldy #$38
        jsr L_b295
        lda #$1f
        sta $91
        sta $93
        lda #$20
        sta $92
        lda #$00
        sta $62
        lda #$05
        sta $59
        jsr L_191a
        jsr L_191a
        jsr L_191a
        ldx #$02
        ldy #$0e
    L_1891:
        lda L_38b6 + $4,x
        sta ($14),y
        iny 
        inx 
        cpx #$05
        bcc L_1891
        ldx #$03
        ldy #$15
    L_18a0:
        lda $20,x
        sta ($14),y
        dey 
        dex 
        bpl L_18a0
        ldy #$05
        lda #$30
        sta $0f
        ldx #$00
        stx $10
    L_18b2:
        ldx $10
        lda $20,x
        lsr 
        lsr 
        lsr 
        lsr 
        bne L_18d9
        lda $0f
    L_18be:
        sta ($14),y
        iny 
        ldx $10
        lda $20,x
        and #$0f
        bne L_18e0
        lda $0f
    L_18cb:
        sta ($14),y
        iny 
        inc $10
        ldx $10
        cpx #$04
        bne L_18b2
        jmp L_18e7
    L_18d9:
        ldx #$00
        stx $0f
        jmp L_18be
    L_18e0:
        ldx #$00
        stx $0f
        jmp L_18cb
    L_18e7:
        lda $85
        cmp #$01
        beq L_18ee
        rts 
    L_18ee:
        ldx #$0c
    L_18f0:
        lda L_35e9 + $c,x
        sta L_352a,x
        dex 
        bpl L_18f0
        ldx #$00
        ldy #$00
    L_18fd:
        lda L_35e9 + $c,x
        cmp #$30
        beq L_1908
        sta $34c3,y
        iny 
    L_1908:
        inx 
        cpx #$07
        bcc L_18fd
    L_190d:
        lda L_35e9 + $c,x
        sta $34c3,y
        iny 
        inx 
        cpx #$0c
        bcc L_190d
        rts 
    L_191a:
        lda $59
        beq L_1973
        ldy #$00
        sty $11
    L_1922:
        jsr L_13b1
        jsr L_13b1
        jsr L_1974
        lda $16
        ora $17
        clc 
        adc $11
        bmi L_193c
        cmp #$1b
        bcc L_193e
        lda #$00
        beq L_193e
    L_193c:
        lda #$1a
    L_193e:
        sta $11
        tay 
        lda L_38c3,y
        ldx $10
        sta $38bc,x
        ldx #$ba
        ldy #$38
        jsr L_b295
        lda $62
        bne L_1958
        dec $59
        beq L_1973
    L_1958:
        lda $18
        bne L_1922
    L_195c:
        jsr L_13b1
        jsr L_13b1
        jsr L_1974
        lda $62
        bne L_196d
        dec $59
        beq L_1973
    L_196d:
        lda $18
        beq L_195c
        inc $10
    L_1973:
        rts 
    L_1974:
        lda $62
        and #$0e
        lsr 
        tax 
        lda L_37aa + $9,x
        sta L_37aa + $2
        lda L_37aa + $a,x
        sta L_37aa + $1
        sta L_379a + $f
        lda L_37aa + $b,x
        sta L_379a + $e
        sta L_379a + $c
        lda L_37aa + $c,x
        sta L_379a + $b
        sta L_379a + $9
        lda L_37aa + $d,x
        sta L_379a + $8
        ldx #$a2
        ldy #$37
        stx $1a
        sty $1b
        ldx #$a0
        ldy #$d8
        stx $1c
        sty $1d
        ldy #$10
        jsr L_23a5
        rts 
    L_19b7:
        ldx #$30
        lda $5d
        cmp #$01
        bne L_19da
        lda $25
        lsr 
        lsr 
        lsr 
        lsr 
        beq L_19c8
        tax 
    L_19c8:
        stx L_313a + $8
        lda $25
        and #$0f
        sta L_313a + $9
        ldx #$3a
        ldy #$31
        jsr L_b295
        rts 
    L_19da:
        lda $25
        lsr 
        lsr 
        lsr 
        lsr 
        beq L_19e3
        tax 
    L_19e3:
        stx L_313a + $f
        lda $25
        and #$0f
        sta L_314a
        ldx #$45
        ldy #$31
        jsr L_b295
        rts 
    L_19f5:
        sed 
        lda $38f9,y
        clc 
        adc $23
        sta $23
        lda $38ed,y
        adc $22
        sta $22
        php 
        lda $21
        adc #$00
        sta $21
        lda $20
        adc #$00
        sta $20
        bcc L_1a21
        lda #$99
        sta $20
        sta $21
        sta $22
        sta $23
        plp 
        cld 
        rts 
    L_1a21:
        plp 
        bcc L_1a36
        clc 
        lda $25
        adc #$01
        bcs L_1a36
        sta $25
        cld 
        jsr L_19b7
        lda #$81
        sta $91
        rts 
    L_1a36:
        cld 
        rts 
    L_1a38:
        ldy $26
        lda L_c0fa + $6,y
        sta $6d
        lda $c110,y
        sta $6e
        lda #$00
        sta $87
        sta $85
        lda #$80
        sta $6c
        sta $68
        jsr L_1a54
        rts 
    L_1a54:
        sei 
        lda #$24
        sta $01
        ldy $26
        lda L_e040,y
        sta $b3
        lda #$00
        sta $b2
        sta $b0
        lda #$7c
        sta $b1
        ldx #$04
        jsr L_b2f5 + $d
        lda #$25
        sta $01
        cli 
        rts 
    L_1a75:
        lda $62
        and #$3f
        cmp #$21
        bne L_1a97
        lda $6c
        beq L_1a98
        cmp #$80
        bne L_1a97
        lda #$00
        sta $6c
        lda $88
        bne L_1a93
        lda $68
        bne L_1a93
        inc $87
    L_1a93:
        lda #$00
        sta $88
    L_1a97:
        rts 
    L_1a98:
        lda #$00
        sta $1b
        lda #$80
        sta $6c
        lda #$ae
        sta $92
        ldy $24
        lda ($6d),y
        cmp #$ff
        bne L_1ab9
        lda L_d410 + $b
        and #$03
        clc 
        adc #$12
        sta $68
        jmp L_1abf
    L_1ab9:
        inc $24
        ldx #$00
        stx $68
    L_1abf:
        asl 
        rol $1b
        asl 
        rol $1b
        asl 
        rol $1b
        asl 
        rol $1b
        sta $1a
        lda $1b
        adc #$c2
        sta $1b
        lda #$ff
        sta $08
        sta $0b
        sta $06
        lda $4f
        sta $0d
        ldy #$0e
        lda ($1a),y
        sta $7e
        tax 
        lda L_36ed + $6,x
        sta $66
        eor #$ff
        clc 
        adc #$01
        sta $63
        lda #$00
        sta $6b
        sta $67
        sta $83
        lda #$ff
        sta $64
        sta $81
        lda L_3703,x
        sta $82
        eor #$ff
        clc 
        adc #$01
        sta $80
        lda $25
        lsr 
        clc 
        adc $26
        adc $28
        adc L_3713,x
        sta $69
        lda L_3720 + $3,x
        sta $6a
        lda L_372d + $6,x
        sta $7f
        lda L_373d + $6,x
        sta $65
        dey 
        lda ($1a),y
        beq L_1b45
        cmp #$ff
        beq L_1b36
        lda L_d410 + $b
        bpl L_1b45
    L_1b36:
        lda $2e
        eor #$ff
        clc 
        adc #$01
        sta $84
        lda $2e
        bmi L_1b4d
        bpl L_1b5b
    L_1b45:
        lda #$00
        sta $84
        lda $2e
        bmi L_1b5b
    L_1b4d:
        lda #$a4
        sta $05
        lda $7e
        clc 
        adc #$a0
        sta $0e
        jmp L_1b83
    L_1b5b:
        lda #$a2
        sta $05
        lda $7e
        clc 
        adc #$b0
        sta $0e
        lda $63
        ldx $66
        stx $63
        sta $66
        lda $64
        ldx $67
        stx $64
        sta $67
        lda $65
        eor #$ff
        clc 
        adc #$01
        sta $65
        lda #$ff
        sta $6b
    L_1b83:
        ldy #$0c
        lda ($1a),y
        sta $7c
        lda #$00
        sta $7d
        ldy #$05
        sty $11
        ldx #$0a
        stx $10
    L_1b95:
        ldy $11
        sty $04
        lda ($1a),y
        beq L_1bc0
        ldx $10
        tay 
        lda L_c112 + $e,y
        sta $70,x
        inx 
        lda $c190,y
        sta $70,x
        ldy $11
        lda #$02
        sta L_a489 + $7,y
        inc $6c
        inc $88
        lda $7d
        sta L_a4a9 + $7,y
        clc 
        adc $7c
        sta $7d
    L_1bc0:
        tya 
        clc 
        adc #$06
        tay 
        lda ($1a),y
        bne L_1bcb
        lda $33
    L_1bcb:
        sta $07
        jsr L_b0e3
        ldy $11
        lda $6b
        sta L_a4d9 + $f,y
        lda #$00
        sta L_a4a9 + $f,y
        sta L_a499 + $f,y
        sta L_a4b9 + $7,y
        sta L_a499 + $7,y
        sta L_a4b9 + $f,y
        lda $84
        sta L_a489 + $f,y
        bpl L_1bf4
        lda #$ff
        sta L_a499 + $f,y
    L_1bf4:
        dec $10
        dec $10
        dec $11
        bpl L_1b95
        rts 
    L_1bfd:
        lda #$0a
        sta $10
        lsr 
        sta $11
        lda #$ff
        sta $0b
        sta $08
        lda #$00
        sta $0a
    L_1c0e:
        ldy $11
        sty $04
        lda L_a489 + $7,y
        and #$0e
        beq L_1c2e
        tax 
        lda L_36dd + $8,x
        sta $1c2c
        lda L_36dd + $9,x
        sta $1c2d
        jsr L_b05d
        ldy $11
        jsr L_1c73
    L_1c2e:
        dec $10
        dec $10
        dec $11
        bpl L_1c0e
        rts 
        jsr L_1c5a
        lda $62
        and #$01
        bne L_1c57
        inc $0e
        lda $0e
        cmp #$1e
        bcc L_1c57
        lda #$00
        sta $08
        ldy $11
        sta L_a489 + $7,y
        dec $6c
        jsr L_b13f
        rts 
    L_1c57:
        jmp L_1ea6
    L_1c5a:
        clc 
        lda $2e
        bmi L_1c68
        adc $05
        sta $05
        bcc L_1c67
        inc $06
    L_1c67:
        rts 
    L_1c68:
        adc $05
        sta $05
        lda $06
        adc #$ff
        sta $06
        rts 
    L_1c73:
        jsr L_1c5a
        jsr L_1ef4
        lda L_a4a9 + $7,y
        bne L_1ca7
        ldx $10
        lda ($70,x)
        cmp #$ff
        beq L_1ca7
        inc $70,x
        bne L_1c8c
        inc $71,x
    L_1c8c:
        pha 
        and #$7f
        sta L_a4a9 + $f,y
        pla 
        bmi L_1c9c
        lda #$01
        sta L_a4a9 + $7,y
        bne L_1ca7
    L_1c9c:
        lda ($70,x)
        sta L_a4a9 + $7,y
        inc $70,x
        bne L_1ca7
        inc $71,x
    L_1ca7:
        lda L_a4a9 + $7,y
        sec 
        sbc #$01
        sta L_a4a9 + $7,y
        lda L_a4a9 + $f,y
        sta $6f
        bne L_1cba
        jmp L_1db0
    L_1cba:
        and #$0f
        beq L_1d31
        and #$01
        beq L_1cde
        lda L_a4b9 + $7,y
        clc 
        adc $63
        sta L_a4b9 + $7,y
        lda L_a489 + $f,y
        adc $64
        sta L_a489 + $f,y
        lda L_a499 + $f,y
        adc $64
        sta L_a499 + $f,y
        jmp L_1cfd
    L_1cde:
        lda $6f
        and #$02
        beq L_1cfd
        lda L_a4b9 + $7,y
        clc 
        adc $66
        sta L_a4b9 + $7,y
        lda L_a489 + $f,y
        adc $67
        sta L_a489 + $f,y
        lda L_a499 + $f,y
        adc $67
        sta L_a499 + $f,y
    L_1cfd:
        lda $6f
        and #$04
        beq L_1d17
        lda L_a4b9 + $f,y
        clc 
        adc $82
        sta L_a4b9 + $f,y
        lda L_a499 + $7,y
        adc $83
        sta L_a499 + $7,y
        jmp L_1db0
    L_1d17:
        lda $6f
        and #$08
        beq L_1d2e
        lda L_a4b9 + $f,y
        clc 
        adc $80
        sta L_a4b9 + $f,y
        lda L_a499 + $7,y
        adc $81
        sta L_a499 + $7,y
    L_1d2e:
        jmp L_1db0
    L_1d31:
        lda $6f
        and #$10
        beq L_1d44
        lda L_a4d9 + $f,y
        cmp #$80
        bne L_1d41
        jsr L_1f0f
    L_1d41:
        jmp L_1dcb
    L_1d44:
        lda $6f
        and #$20
        beq L_1d5e
        lda #$00
        sta L_a4b9 + $7,y
        sta L_a489 + $f,y
        sta L_a499 + $f,y
        sta L_a4b9 + $f,y
        sta L_a499 + $7,y
        jmp L_1dcb
    L_1d5e:
        lda $6f
        and #$40
        beq L_1db0
        lda $07
        cmp $33
        beq L_1da8
        bcc L_1d8b
        lda L_a499 + $7,y
        beq L_1d77
        bpl L_1da8
        cmp #$fc
        bcc L_1db0
    L_1d77:
        lda L_a4b9 + $f,y
        clc 
        adc $80
        sta L_a4b9 + $f,y
        lda L_a499 + $7,y
        adc $81
        sta L_a499 + $7,y
        jmp L_1db0
    L_1d8b:
        lda L_a499 + $7,y
        bmi L_1da8
        cmp #$05
        bcs L_1db0
        lda L_a4b9 + $f,y
        clc 
        adc $82
        sta L_a4b9 + $f,y
        lda L_a499 + $7,y
        adc $83
        sta L_a499 + $7,y
        jmp L_1db0
    L_1da8:
        lda #$00
        sta L_a4b9 + $f,y
        sta L_a499 + $7,y
    L_1db0:
        lda $62
        and #$07
        cmp $04
        bne L_1dcb
        lda L_a4d9 + $f,y
        cmp #$80
        bne L_1dcb
        lda $69
        beq L_1dcb
        cmp L_d410 + $b
        bcc L_1dcb
        jsr L_1f0f
    L_1dcb:
        lda $06
        ror 
        lda $05
        ror 
        lsr 
        lsr 
        sec 
        sbc #$02
        cmp #$27
        bcc L_1ddd
        jmp L_1e68
    L_1ddd:
        sta $0f
        lda #$80
        sta L_a4d9 + $f,y
        lda $07
        lsr 
        lsr 
        lsr 
        sec 
        sbc #$05
        cmp #$17
        bcc L_1df3
        jmp L_1ea2
    L_1df3:
        cmp #$06
        bcs L_1dfa
        jmp L_1ea2
    L_1dfa:
        tax 
        lda L_b355 + $b,x
        sta $1b
        lda L_b375 + $4,x
        clc 
        adc $0f
        sta $1a
        bcc L_1e0c
        inc $1b
    L_1e0c:
        ldy #$00
        lda ($1a),y
        cmp #$20
        bcc L_1e2d
        iny 
        lda ($1a),y
        cmp #$20
        bcc L_1e2d
        ldy #$28
        lda ($1a),y
        cmp #$20
        bcc L_1e2d
        iny 
        lda ($1a),y
        cmp #$20
        bcc L_1e2d
        jmp L_1ea2
    L_1e2d:
        and #$0f
        tax 
        lda L_a459 + $7,x
        beq L_1e4b
        lda L_a429 + $7,x
        sta $1c
        lda L_a439 + $7,x
        sta $1d
        ldy #$00
        lda L_a449 + $7,x
        sta ($1c),y
        lda #$00
        sta L_a459 + $7,x
    L_1e4b:
        lda $68
        bne L_1e54
        ldy $7f
        jsr L_19f5
    L_1e54:
        lda #$26
        sta $92
        ldy $11
        lda #$06
        sta L_a489 + $7,y
        lda #$14
        sta $0e
        dec $88
        jmp L_1ea2
    L_1e68:
        lda $06
        and #$01
        beq L_1ea2
        lda L_a4d9 + $f,y
        cmp #$80
        bne L_1e87
        lda $05
        bmi L_1e80
        lda #$ff
        sta L_a4d9 + $f,y
        bne L_1ea2
    L_1e80:
        lda #$00
        sta L_a4d9 + $f,y
        beq L_1ea2
    L_1e87:
        cmp #$ff
        bne L_1e93
        lda $05
        cmp #$e8
        bcc L_1ea2
        bcs L_1e99
    L_1e93:
        lda $05
        cmp #$78
        bcs L_1ea2
    L_1e99:
        lda #$00
        sta $08
        sta L_a489 + $7,y
        dec $6c
    L_1ea2:
        jsr L_b13f
        rts 
    L_1ea6:
        lda $06
        and #$01
        beq L_1ebf
        lda $05
        cmp #$9c
        bcc L_1ebf
        cmp #$c4
        bcs L_1ebf
        lda #$00
        sta $08
        sta L_a489 + $7,y
        dec $6c
    L_1ebf:
        jsr L_b13f
        rts 
        jsr L_1c5a
        jsr L_1ef4
        lda L_a4a9 + $7,y
        sec 
        sbc #$01
        sta L_a4a9 + $7,y
        beq L_1ee4
        jsr L_1ff0
        bcc L_1ee1
        lda $3d
        cmp #$14
        bcs L_1ee1
        inc $32
    L_1ee1:
        jmp L_1ea6
    L_1ee4:
        lda #$14
        sta $0e
        lda #$06
        sta L_a489 + $7,y
        lda #$0a
        sta $92
        jmp L_1ea6
    L_1ef4:
        lda L_a489 + $f,y
        clc 
        adc $05
        sta $05
        lda L_a499 + $f,y
        adc $06
        sta $06
        lda L_a4b9 + $f,y
        asl 
        lda L_a499 + $7,y
        adc $07
        sta $07
        rts 
    L_1f0f:
        ldy #$05
    L_1f11:
        lda L_a489 + $7,y
        beq L_1f1c
        dey 
        bpl L_1f11
        ldy $11
        rts 
    L_1f1c:
        sty $04
        lda $0e
        pha 
        lda #$ff
        sta $08
        lda $6a
        sta $0e
        jsr L_b13f
        ldy $11
        lda L_a489 + $f,y
        ldx L_a499 + $f,y
        ldy $04
        clc 
        adc $65
        sta L_a489 + $f,y
        txa 
        adc $6b
        sta L_a499 + $f,y
        lda #$00
        sta L_a499 + $7,y
        sta L_a4b9 + $f,y
        lda #$04
        sta L_a489 + $7,y
        lda #$a0
        sta L_a4a9 + $7,y
        pla 
        sta $0e
        inc $6c
        ldy $11
        sty $04
        lda #$0b
        sta $92
        rts 
        jsr L_1c5a
        lda $62
        and #$03
        bne L_1f7c
        dec $0e
        lda $0e
        cmp #$14
        bcs L_1f7c
        lda #$0a
        sta L_a489 + $7,y
        lda #$11
        sta $0e
    L_1f7c:
        jmp L_1ea6
        lda $6c
        bpl L_1f9a
        lda $69
        beq L_1f9a
        lsr 
        lsr 
        cmp L_d410 + $b
        bcc L_1f9a
        ldx $54
        bmi L_1f9a
    L_1f92:
        lda $0240,x
        bpl L_1f9b
        dex 
        bpl L_1f92
    L_1f9a:
        rts 
    L_1f9b:
        ldy #$05
    L_1f9d:
        lda L_a489 + $7,y
        beq L_1fa6
        dey 
        bpl L_1f9d
        rts 
    L_1fa6:
        sty $04
        lda #$ff
        sta $08
        lda #$1d
        sta $0e
        lda #$0d
        sta $92
        lda #$08
        sta L_a489 + $7,y
        lda $26
        asl 
        asl 
        adc $28
        ora #$80
        sta L_a4a9 + $7,y
        lda #$00
        sta L_a489 + $f,y
        sta L_a499 + $f,y
        sta L_a499 + $7,y
        lda $0220,x
        asl 
        asl 
        asl 
        clc 
        adc #$2c
        sta $07
        lda $0240,x
        clc 
        adc #$02
        asl 
        asl 
        asl 
        sta $05
        lda #$00
        rol 
        sta $06
        jsr L_b13f
        inc $6c
        rts 
    L_1ff0:
        lda $06
        and #$01
        bne L_201f
        lda $05
        cmp #$a2
        bcc L_201f
        cmp #$b2
        bcs L_201f
        lda $07
        sec 
        sbc $33
        sta $0f
        clc 
        ldx $0e
    L_200a:
        adc L_374d + $2,x
        sec 
        sbc #$05
        bmi L_201f
        lda $0f
        clc 
        adc L_373d + $a,x
        sec 
        sbc #$0f
        bpl L_201f
        sec 
        rts 
    L_201f:
        clc 
    L_2020:
        rts 
        jsr L_1c5a
        jsr L_1ef4
        jsr L_205f
        lda L_a4a9 + $7,y
        sec 
        sbc #$01
        sta L_a4a9 + $7,y
        beq L_204f
        and #$0f
        cmp $04
        bne L_203f
        lda #$0e
        sta $92
    L_203f:
        jsr L_1ff0
        bcc L_204c
        lda $3d
        cmp #$14
        bcs L_204c
        inc $32
    L_204c:
        jmp L_1ea6
    L_204f:
        lda #$14
        sta $0e
        lda #$06
        sta L_a489 + $7,y
        lda #$0a
        sta $91
        jmp L_1ea6
    L_205f:
        lda $62
        and #$03
        bne L_20d2
        lda $07
        cmp $33
        bcc L_2074
        lda L_a499 + $7,y
        sec 
        sbc #$01
        jmp L_207a
    L_2074:
        lda L_a499 + $7,y
        clc 
        adc #$01
    L_207a:
        sta L_a499 + $7,y
        lda $06
        and #$01
        bne L_208b
        lda $05
        cmp #$aa
        bcc L_2091
        bcs L_20a5
    L_208b:
        lda $05
        cmp #$a0
        bcc L_20a5
    L_2091:
        lda L_a489 + $f,y
        clc 
        adc #$01
        sta L_a489 + $f,y
        lda L_a499 + $f,y
        adc #$00
        sta L_a499 + $f,y
        jmp L_20b6
    L_20a5:
        lda L_a489 + $f,y
        clc 
        adc #$ff
        sta L_a489 + $f,y
    L_20ae:
        lda L_a499 + $f,y
        adc #$ff
        sta L_a499 + $f,y
    L_20b6:
        bpl L_20de
        lda L_a489 + $f,y
        cmp #$fa
        bcs L_20c4
        lda #$fa
        sta L_a489 + $f,y
    L_20c4:
        lda L_a499 + $7,y
        bpl L_20d3
        cmp #$fc
        bcs L_20d2
        lda #$fc
        sta L_a499 + $7,y
    L_20d2:
        rts 
    L_20d3:
        cmp #$04
        bcc L_20d2
        lda #$04
        sta L_a499 + $7,y
        bne L_20d2
    L_20de:
        lda L_a489 + $f,y
        cmp #$06
        bcc L_20c4
        lda #$06
        sta L_a489 + $f,y
        bne L_20c4
    L_20ec:
        jsr L_2c66
        lda #$40
        sta $29
        lda #$f1
        sta $4a
        lda #$00
        sta $2a
        jsr L_2cb2
        jsr L_2ca5
        jsr L_2f33
        jsr L_2e17
        jsr L_2beb
        jsr L_2ed7
        jsr L_2532
        lda #$fb
        sta L_d020 + $5
        lda #$00
        sta $34
        sta $2e
        sta $3f
        sta $47
        sta $46
        sta $3e
        sta $32
        lda #$ff
        sta $2d
        lda #$10
        sta $3d
        lda #$05
        sta $45
        lda #$59
        sta $40
        lda #$98
        sta $33
        lda #$01
        sta $48
        lda $2936
        sta $49
        lda $4b
        sta L_d020 + $e
        lda #$2f
        sta L_3f49 + $1
        jsr L_17e2
        rts 
    L_2150:
        lda #$02
        sta $59
        lda #$00
        sta $62
    L_2158:
        jsr L_b016 + $3
        jsr L_b1fd
        jsr L_b315 + $6
        jsr L_22d3
        jsr L_2342
        jsr L_23b5
        ldy #$0c
        jsr L_b244
        inc $62
        lda $18
        beq L_217d
        lda $62
        bne L_2158
        dec $59
        bne L_2158
    L_217d:
        rts 
    L_217e:
        lda #$00
        sta $62
    L_2182:
        lda $2f
        bne L_2182
        jsr L_2b40
        jsr L_2beb
        jsr L_2ed7
        jsr L_2fc8
        jsr L_b016 + $3
        jsr L_b1fd
        jsr L_22d3
        jsr L_b315 + $6
        jsr L_23b5
        jsr L_2342
        inc $62
        lda $18
        beq L_21b4
        lda $2a
        cmp #$0e
        bcc L_2182
        lda $29
        bpl L_2182
    L_21b4:
        rts 
    L_21b5:
        lda #$01
        sta $5a
        lda #$00
        sta $5f
        sta $5e
        sta $20
        sta $21
        sta $22
        sta $23
        sta $24
        lda #$07
        sta $8d
        lda #$10
        sta $8e
        lda L_0800
        and #$07
        clc 
        adc #$01
        sta $26
        jsr L_20ec
        jsr L_1a38
        lda #$08
        sta $59
        ldx #$c1
        ldy #$32
        stx $1a
        sty $1b
        jsr L_b285 + $2
        lda L_3315 + $4
        sta $1b
        lda L_3305 + $a
        sta $1a
        jsr L_b285 + $2
        lda $4e
        sta L_d020 + $5
        lda $4b
        sta L_d020 + $e
        lda #$ff
        sta $55
        ldy #$07
    L_220d:
        lda L_32e0 + $d,y

        .byte $99,$35,$00

        dey 
        bpl L_220d
    L_2216:
        lda $2f
        bne L_2216
        jsr L_2a17
        jsr L_2b40
    L_2220:
        jsr L_2beb
        jsr L_2ed7
        jsr L_2fc8
        jsr L_1bfd
        jsr L_1a75
        jsr L_b016 + $3
        jsr L_b1fd
        jsr L_b315 + $6
        lda $18
        beq L_227b
        lda #$00
        sta $22
        inc $62
        lda $62
        and #$03
        tay 
        lda L_36dd,y
        sta $2254
        lda L_36dd + $4,y
        sta $2255
        jsr L_22d3
        jsr L_2287
        jsr L_292f
        jsr L_2576
        jsr L_2635
        jsr L_268c
        jsr L_2713
        lda $32
        bne L_227c
        lda $62
        bne L_2216
        dec $59
        bne L_2216
        lda #$10
        sta $18
        jsr L_3086
    L_227b:
        rts 
    L_227c:
        lda #$10
        sta $18
        jsr L_245b
        jsr L_3086
        rts 
    L_2287:
        lda $8e
        sta $18
        lda L_d410 + $b
        cmp #$be
        bcc L_229a
        lda $18
        eor #$10
        sta $18
        sta $8e
    L_229a:
        lda $5e
        sta $16
        lda L_d410 + $b
        cmp #$b4
        bcc L_22b6
        ldy #$00
        cmp #$dc
        bcc L_22b2
        iny 
        cmp #$ee
        bcc L_22b2
        dey 
        dey 
    L_22b2:
        sty $16
        sty $5e
    L_22b6:
        lda $5f
        sta $17
        lda L_d410 + $b
        cmp #$b4
    L_22bf:
        bcc L_22d2
        ldy #$00
        cmp #$dc
        bcc L_22ce
        iny 
        cmp #$ee
        bcc L_22ce
        dey 
        dey 
    L_22ce:
        sty $17
        sty $5f
    L_22d2:
        rts 
    L_22d3:
        lda $62
        and #$7f
        bne L_231c
        lda $5b
        sta $0f
        clc 
        adc #$01
        and #$03
        sta $5b
        beq L_231d
        lda $5a
        cmp #$03
        beq L_231d
        lda $5b
        cmp #$01
        beq L_2325
        cmp #$02
        beq L_232d
        lda $5a
        cmp #$02
        beq L_2335
    L_22fc:
        lda $5c
        tay 
        lda L_356d + $6,y
        ldx L_356d + $3,y
        tay 
        jsr L_b295
        lda $61
        beq L_2315
        ldx #$f5
        ldy #$34
        jsr L_b295
        rts 
    L_2315:
        ldx #$f1
        ldy #$34
        jsr L_b295
    L_231c:
        rts 
    L_231d:
        ldx #$f9
        ldy #$34
        jsr L_b295
        rts 
    L_2325:
        ldx #$10
        ldy #$35
        jsr L_b295
        rts 
    L_232d:
        ldx #$26
        ldy #$35
        jsr L_b295
        rts 
    L_2335:
        ldy $26
        ldx L_e050,y
        lda L_e060,y
        tay 
        jsr L_b295
        rts 
    L_2342:
        lda $19
        and #$10
        beq L_2351
        lda $19
        and #$a0
        cmp #$80
        beq L_237b
        rts 
    L_2351:
        ldx #$00
        ldy #$dc
        stx L_b016 + $f
        sty L_b026
        ldx #$01
        ldy #$dc
        stx L_b026 + $2
        sty L_b026 + $3
        lda $19
        bmi L_2389
        lda #$02
        sta $5c
        ldx #$d0
        ldy #$34
        jsr L_b295
    L_2374:
        lda $5b
        cmp #$03
        beq L_22fc
        rts 
    L_237b:
        lda #$00
        sta $5c
        ldx #$db
        ldy #$34
        jsr L_b295
        jmp L_2374
    L_2389:
        lda #$01
    L_238b:
        sta $5c
        ldx #$e5
        ldy #$34
        jsr L_b295
        jmp L_2374
    L_2397:
        ldx #$a0
        ldy #$48
        stx $1c
        sty $1d
    L_239f:
        ldx #$15
        jsr L_b189
        rts 
    L_23a5:
        sty $8f
    L_23a7:
        ldy $8f
        lda ($1a),y
        ldx #$01
        jsr L_b189
        dec $8f
        bpl L_23a7
        rts 
    L_23b5:
        lda $19
        and #$08
        bne L_23d6
        lda $19
        bpl L_23d7
        ldx #$a0
        ldy #$36
        jsr L_b295
        lda #$00
        sta $61
        jsr L_23ef
        lda $5b
        cmp #$03
        bne L_23d6
        jmp L_22fc
    L_23d6:
        rts 
    L_23d7:
        ldx #$ad
        ldy #$36
        jsr L_b295
        lda #$ff
        sta $61
        jsr L_23ef
        lda $5b
        cmp #$03
        bne L_23d6
        jmp L_22fc
        rts 
    L_23ef:
        lda $61
        beq L_2402
        lda #$f1
        sta L_d850 + $a
        sta L_d850 + $b
        sta L_d880 + $2
        sta L_d880 + $3
        rts 
    L_2402:
        lda #$f2
        sta L_d850 + $a
        sta L_d850 + $b
        lda #$f5
        sta L_d880 + $2
        lda #$f6
        sta L_d880 + $3
        rts 
    L_2415:
        ldx #$00
        stx $10
        stx $11
    L_241b:
        ldy L_349e + $1,x
        bmi L_244d
    L_2420:
        lda L_c000,y
        clc 
        adc #$60
        sta $1a
        lda #$c0
        adc #$00
        sta $1b
        ldy #$00
        ldx $11
    L_2432:
        lda ($1a),y
        beq L_243a
        sta L_8007 + $9,x
        inx 
    L_243a:
        iny 
        cpy #$04
        bcc L_2432
        lda #$01
        sta L_8007 + $9,x
        inx 
        stx $11
        inc $10
        ldx $10
        bpl L_241b
    L_244d:
        ldx $11
        ldy #$03
        lda #$00
    L_2453:
        sta L_8007 + $9,x
        inx 
        dey 
        bpl L_2453
        rts 
    L_245b:
        lda #$00
        sta L_d010 + $5
        sta $3f
        lda #$06
        sta $8f
        lda #$0c
        sta $91
        sta $92
        lda #$f8
        sta L_d020 + $6
        lda #$f0
        sta L_d020 + $5
        ldx #$e2
        ldy #$32
        stx $1a
        sty $1b
        jsr L_b285 + $2
        lda $33
        sta $07
        jsr L_b13f
    L_2488:
        lda $32
        bpl L_2490
        lda #$00
        sta $2e
    L_2490:
        lda $8f
        bmi L_24bf
        lda #$07
        sta $04
        jsr L_b092
        lda $8f
        sta $04
        lda L_d410 + $b
        and #$0f
        sec 
        sbc #$08
        clc 
        adc $05
        sta $05
        lda #$30
        sta $0e
        lda L_d410 + $b
        and #$0f
        sbc #$08
        clc 
        adc $07
        sta $07
        jsr L_b0e3
    L_24bf:
        jsr L_13eb
        lda #$07
        sta $04
    L_24c6:
        jsr L_b092
        inc $0e
        lda $0e
        cmp #$3b
        bcc L_24d5
        lda #$00
        sta $08
    L_24d5:
        jsr L_b0e3
        dec $04
        bpl L_24c6
        jsr L_13eb
        jsr L_13eb
        lda $2e
        beq L_2506
        bmi L_24f8
        lda $2d
        sec 
        sbc #$80
        sta $2d
        lda $2e
        sbc #$00
        sta $2e
        jmp L_2508
    L_24f8:
        clc 
        lda $2d
        adc #$80
        sta $2d
        bcc L_2503
        inc $2e
    L_2503:
        jmp L_2508
    L_2506:
        sta $2d
    L_2508:
        lda $5a
        cmp #$02
        beq L_2515
        lda $18
        beq L_2523
        jmp L_2518
    L_2515:
        jsr L_b1b4
    L_2518:
        dec $8f
        lda $8f
        cmp #$f0
        beq L_2523
        jmp L_2488
    L_2523:
        rts 
        lda $62
        and #$38
    L_2528:
        lsr 
        lsr 
        lsr 
        tax 
        lda L_36bd + $8,x
        sta $55
        rts 
    L_2532:
        ldx #$a0
        ldy #$48
        stx $1c
        sty $1d
        lda #$30
        sta $10
        jsr L_2f15
        clc 
        lda $1c
        adc #$28
        sta $1c
        bcc L_254c
        inc $1d
    L_254c:
        jsr L_2f15
        ldx #$98
        ldy #$4b
        stx $1c
        sty $1d
        jsr L_2f15
        clc 
        lda $1c
        adc #$28
        sta $1c
        bcc L_2565
        inc $1d
    L_2565:
        jsr L_2f15
        ldy #$05
        lda #$20
    L_256c:
        sta L_4ba1 + $b,y
        sta L_4bd4,y
        dey 
        bpl L_256c
        rts 
    L_2576:
        lda $49
        beq L_25b0
    L_257a:
        lda $16
        beq L_259e
        bmi L_258f
        inc $34
        lda $34
        bmi L_258e
        cmp $36
        bcc L_258e
        lda $36
        sta $34
    L_258e:
        rts 
    L_258f:
        dec $34
        lda $34
        bpl L_258e
        cmp $35
        bcs L_258e
        lda $35
        sta $34
        rts 
    L_259e:
        lda $34
        cmp #$ff
        beq L_25ab
        rol 
        lda $34
        ror 
        sta $34
        rts 
    L_25ab:
        lda #$00
        sta $34
        rts 
    L_25b0:
        lda $16
        bne L_25b9
        inc $49
        jmp L_259e
    L_25b9:
        lda $3f
        bne L_257a
        lda $45
        bmi L_257a
        and #$03
        cmp #$01
        bne L_25df
        clc 
        adc $16
        and #$03
        ora #$80
        sta $0f
        lda $3e
        cmp #$03
        bcc L_257a
    L_25d6:
        lda $45
        and #$fc
        ora $0f
        sta $46
        rts 
    L_25df:
        lda #$81
        sta $0f
        bne L_25d6
    L_25e5:
        ldx #$00
        ldy #$50
        stx $1a
        sty $1b
        ldx #$00
        ldy #$5c
        stx $1c
        sty $1d
        ldy #$00
    L_25f7:
        lda ($1a),y
        and #$aa
        lsr 
        sta $0f
        lda ($1a),y
        and #$55
        asl 
        ora $0f
        ora ($1a),y
        sta ($1c),y
        iny 
        bne L_25f7
        inc $1b
        inc $1d
        lda $1b
        cmp #$5c
        bcc L_25f7
        rts 
    L_2617:
        bmi L_2627
        clc 
        adc $2d
        sta $2d
        lda $2e
        adc #$00
        bmi L_2650
    L_2624:
        jmp L_2679
    L_2627:
        clc 
        adc $2d
        sta $2d
        lda $2e
        adc #$ff
        bmi L_2650
        jmp L_2679
    L_2635:
        lda $3f
        bne L_2617
        lda $45
        and #$04
        bne L_2668
        lda $17
        beq L_2659
        bmi L_265a
        lda $2d
        clc 
        adc $39
        sta $2d
        lda $2e
        adc #$ff
    L_2650:
        sta $2e
        eor #$ff
        clc 
        adc #$01
        sta $3e
    L_2659:
        rts 
    L_265a:
        lda $2d
        clc 
        adc $3a
        sta $2d
        lda $2e
        adc #$00
        jmp L_2650
    L_2668:
        lda $17
        beq L_2659
        bpl L_267e
        lda $2d
        clc 
        adc $3b
        sta $2d
        lda $2e
        adc #$00
    L_2679:
        sta $2e
        sta $3e
        rts 
    L_267e:
        lda $2d
        clc 
        adc $3c
        sta $2d
        lda $2e
        adc #$ff
        jmp L_2679
    L_268c:
        lda $34
        clc 
        adc $33
        cmp #$62
        bcs L_2697
        lda #$62
    L_2697:
        cmp #$d7
        bcc L_269d
        lda #$d7
    L_269d:
        sta $33
        lda $2e
        bmi L_26d1
        cmp $38
        bcc L_26ab
        lda $38
        sta $2e
    L_26ab:
        lda $45
        bmi L_26eb
        lda $2a
        bne L_26ba
        lda #$c8
        sta $3f
        jmp L_26eb
    L_26ba:
        cmp #$0e
        bcc L_26eb
        lda $29
        bpl L_26eb
    L_26c2:
        lda $45
        ora #$80
        sta $46
        jmp L_26eb
    L_26cb:
        lda $29
        bmi L_26eb
        bpl L_26c2
    L_26d1:
        cmp $37
        bcs L_26d9
        lda $37
        sta $2e
    L_26d9:
        lda $45
        bmi L_26eb
        lda $2a
        bmi L_26eb
        beq L_26cb
        cmp #$0e
        bcc L_26eb
        lda #$38
        sta $3f
    L_26eb:
        lda $3e
        cmp #$03
        bcs L_26ff
        cmp #$02
        bcs L_2700
        lda $45
        bmi L_26ff
        eor #$04
        ora #$80
        sta $46
    L_26ff:
        rts 
    L_2700:
        lda $45
        bmi L_26ff
        and #$03
        cmp #$01
        beq L_26ff
        lda $45
        and #$fc
        ora #$81
        sta $46
        rts 
    L_2713:
        lda $46
        bpl L_2774
        lda $45
        and #$04
        beq L_2757
        lda $45
        asl 
    L_2720:
        asl 
        asl 
        and #$18
        sta $0f
        lda $46
        and #$07
        ora $0f
        tax 
        lda L_3264 + $2,x
        sta $42
        lda L_3270 + $c,x
        sta $43
    L_2737:
        ldy #$00
        lda ($42),y
        sta $44
        tay 
        iny 
        lda ($42),y
        sta $47
        bne L_2749
        lda $3f
        bne L_274e
    L_2749:
        iny 
        lda ($42),y
        sta $3f
    L_274e:
        lda $46
        sta $45
        lda #$00
        sta $46
        rts 
    L_2757:
        lda $45
        asl 
        asl 
        asl 
        and #$18
        sta $0f
        lda $46
        and #$07
        ora $0f
        tax 
        lda L_3290 + $2,x
        sta $42
        lda L_32a0 + $4,x
        sta $43
        jmp L_2737
    L_2774:
        lda $45
        bmi L_277b
        jmp L_27a3
    L_277b:
        lda $62
        and #$01
        bne L_27a3
        ldy $44
        lda ($42),y
        sta $40
        lda $47
        beq L_2793
        lda L_32f5,y
        clc 
        adc $3d
        sta $3d
    L_2793:
        dec $44
        bne L_27a3
        lda $45
        and #$7f
        sta $45
        lda #$00
        sta $3f
        sta $47
    L_27a3:
        lda #$06
        sta $04
        jsr L_b05d
        lda $40
        sta $0e
        clc 
        adc #$30
        sta $41
        lda $33
        sta $07
        jsr L_b13f
        inc $04
        jsr L_b05d
        lda $41
        sta $0e
        lda $3d
        lsr 
        clc 
        adc $33
        sta $07
        lda #$aa
        clc 
        adc $3d
        sta $05
        jsr L_b13f
    L_27d5:
        ldy $40
        lda L_33de + $a,y
        sta $56
        and #$01
        sta $57
        tay 
        bne L_27fd
        lda ($52),y
        bpl L_27ef
        cmp #$90
        bcs L_27ef
        lda #$80
        sta $32
    L_27ef:
        ldy #$02
        lda ($52),y
        bpl L_27fd
        cmp #$90
        bcs L_27fd
        lda #$80
        sta $32
    L_27fd:
        ldy #$01
        lda ($52),y
        sta $86
        bpl L_280d
        cmp #$90
        bcs L_280d
        lda #$80
        sta $32
    L_280d:
        lda $56
        bpl L_2838
        dec $53
        dec $53
        lda ($52),y
        bpl L_2821
        cmp #$90
    L_281b:
        bcs L_2821
        lda #$80
        sta $32
    L_2821:
        lda $53
        clc 
        adc #$04
        sta $53
    L_2828:
        lda ($52),y
        bpl L_2834
        cmp #$90
        bcs L_2834
        lda #$80
        sta $32
    L_2834:
        dec $53
        dec $53
    L_2838:
        rts 
    L_2839:
        jsr L_2918
        ldx #$07
    L_283e:
        lda L_3305 + $1,x
        sta $1a
        lda L_3305 + $b,x
        sta $1b
        lda L_3305 + $1,x
        jsr L_b285 + $2
        dex 
        bpl L_283e
        lda #$10
        sta $59
    L_2855:
        jsr L_2918
        dec $59
        bne L_2855
        lda #$06
        sta $91
    L_2860:
        lda #$06
        sta $04
        jsr L_b05d
        inc $0e
        jsr L_b13f
        jsr L_2918
        jsr L_2918
        jsr L_2918
        lda $0e
        cmp #$0b
        bcc L_2860
        jsr L_2918
        lda L_3315 + $3
        sta $1b
        lda L_3305 + $9
        sta $1a
        jsr L_b285 + $2
        lda #$07
        sta $92
    L_288f:
        lda #$06
        sta $04
        jsr L_b05d
        inc $05
        jsr L_b13f
        jsr L_2918
        jsr L_2918
        lda $05
        cmp #$aa
        bcc L_288f
        lda #$00
        sta $42
        sta $43
        jsr L_2918
        lda #$08
        sta $91
        sta $92
        sta $93
    L_28b8:
        lda #$80
        clc 
        adc $42
        sta $42
        lda $43
        adc #$ff
        sta $43
        lda #$07
        sta $04
        jsr L_b05d
        lda $05
        clc 
        adc $43
        sta $05
        lda $06
        adc #$ff
        sta $06
        jsr L_b13f
        lda #$05
        sta $04
    L_28e0:
        jsr L_b05d
        lda $05
        clc 
        adc $43
        sta $05
        lda $06
        adc #$ff
        sta $06
        jsr L_b13f
        dec $04
        bpl L_28e0
        jsr L_2918
        lda $05
        cmp #$84
        bcc L_28b8
        lda #$40
        sta L_d010 + $5
        lda L_3315 + $4
        sta $1b
        lda L_3305 + $a
        sta $1a
        jsr L_b285 + $2
        lda $4e
        sta L_d020 + $5
        rts 
    L_2918:
        lda $2f
        bne L_2918
        jsr L_b016 + $3
        jsr L_2b6d
        jsr L_b1fd
        jsr L_22d3
        inc $62
    L_292a:
        lda $2f
        beq L_292a
        rts 
    L_292f:
        lda $48
        bmi L_2954
        beq L_2943
        lda #$07
        sta $49
        lda $18
        bne L_2942
        sta $48
        jsr L_2959
    L_2942:
        rts 
    L_2943:
        lda $18
        beq L_294d
        inc $48
        jsr L_2959
        rts 
    L_294d:
        lda $49
        bmi L_2942
        dec $49
        rts 
    L_2954:
        and #$7f
        sta $48
        rts 
    L_2959:
        lda $48
        ora #$80
        sta $48
        ldx $40
        lda L_3365 + $e,x
        beq L_2993
        clc 
        adc $33
        sec 
        sbc #$62
        sta $0f
        ldx #$00
        jsr L_2994
        bcs L_2993
        stx $10
        jsr L_29a1
        ldx $40
        lda L_339e + $3,x
        beq L_2993
        clc 
        adc $33
        sec 
        sbc #$62
        sta $0f
        ldx $10
    L_298b:
        jsr L_2994
        bcs L_2993
        jsr L_29a1
    L_2993:
        rts 
    L_2994:
        lda L_a459 + $7,x
        beq L_299f
        inx 
        cpx #$06
        bcc L_2994
        rts 
    L_299f:
        clc 
        rts 
    L_29a1:
        lda #$09
        sta $91
        lda #$02
        ldy $2e
        beq L_29df
        bmi L_29df
        lda #$fe
        sta L_a459 + $7,x
        lda $52
        sta L_a429 + $7,x
        sta $12
        lda $0f
        and #$07
        cmp #$07
        bne L_29c3
        lda #$06
    L_29c3:
        sta L_a469 + $7,x
        lda $0f
        lsr 
        lsr 
        and #$fe
        sta $0f
        lda $53
        and #$01
        clc 
        adc $0f
        adc #$82
        sta L_a439 + $7,x
        sta $13
        jmp L_2a0f
    L_29df:
        sta L_a459 + $7,x
        clc 
        adc $52
        sta L_a429 + $7,x
        sta $12
        php 
        lda $0f
        and #$07
        cmp #$07
        bne L_29f5
        lda #$06
    L_29f5:
        sta L_a469 + $7,x
        lda $0f
        lsr 
        lsr 
        and #$fe
        sta $0f
        lda $53
        and #$01
        clc 
        adc $0f
        plp 
        adc #$82
        sta L_a439 + $7,x
        sta $13
    L_2a0f:
        ldy #$00
        lda ($12),y
        sta L_a449 + $7,x
        rts 
    L_2a17:
        ldy #$00
        ldx #$05
    L_2a1b:
        lda L_a459 + $7,x
        beq L_2a2f
        lda L_a429 + $7,x
        sta $1c
        lda L_a439 + $7,x
        sta $1d
        lda L_a449 + $7,x
        sta ($1c),y
    L_2a2f:
        dex 
        bpl L_2a1b
        inx 
    L_2a33:
        lda L_a459 + $7,x
        beq L_2aa3
        jsr L_2ac9
        sta L_a439 + $7,x
        sta $1d
        ror 
        lda $1c
        ror 
        cmp $50
        bcc L_2abd
        cmp $51
        bcs L_2abd
        lda ($1c),y
        bpl L_2a5e
        cmp #$90
        bcc L_2ab9
        cmp #$a0
        bcs L_2a5e
        jsr L_2ae9
        jmp L_2abd
    L_2a5e:
        sta L_a449 + $7,x
        sty $2a8a
        asl 
        rol $2a8a
        asl 
        rol $2a8a
        asl 
        rol $2a8a
        sta $2a89
        lda $2a8a
        adc #$78
        sta $2a8a
        lda L_3928 + $f,x
        ora #$80
        sta $14
        lda #$78
        sta $15
        ldy #$07
    L_2a88:
        lda L_77fd + $3,y
        sta ($14),y
        dey 
        bpl L_2a88
        ldy L_a469 + $7,x
        lda #$00
        sta ($14),y
        iny 
        lda #$aa
        sta ($14),y
        ldy #$00
        txa 
    L_2a9f:
        ora #$10
        sta ($1c),y
    L_2aa3:
        inx 
        cpx #$06
        bcc L_2a33
        lda $2a7f
        eor #$80
        sta $2a7f
        lda $2aa0
        eor #$10
        sta $2aa0
        rts 
    L_2ab9:
        lda #$21
        sta $91
    L_2abd:
        lda L_a459 + $7,x
        beq L_2aa3
        lda #$00
        sta L_a459 + $7,x
        beq L_2aa3
    L_2ac9:
        bmi L_2ada
        clc 
        adc L_a429 + $7,x
        sta L_a429 + $7,x
        sta $1c
        lda L_a439 + $7,x
        adc #$00
        rts 
    L_2ada:
        clc 
        adc L_a429 + $7,x
        sta L_a429 + $7,x
        sta $1c
        lda L_a439 + $7,x
        adc #$ff
        rts 
    L_2ae9:
        tay 
        lda L_a429 + $7,x
        sec 
        sbc L_33be + $8,y
        sta $1a
        lda L_a439 + $7,x
        sbc L_33ce + $8,y
        sta $1b
        lda L_33de + $8,y
        sta $11
        sta $8f
        lda L_33ee + $8,y
        tay 
        stx $10
        jsr L_19f5
        ldx $10
        lda #$1b
        sta $92
    L_2b11:
        ldy $11
    L_2b13:
        lda ($1a),y
        cmp #$20
        bcc L_2b33
        cmp #$f0
        bcs L_2b22
        sec 
        sbc #$20
    L_2b20:
        sta ($1a),y
    L_2b22:
        dey 
        bpl L_2b13
        dec $8f
        bmi L_2b30
        inc $1b
        inc $1b
        jmp L_2b11
    L_2b30:
        ldy #$00
        rts 
    L_2b33:
        stx $10
        tax 
        lda #$00
        sta L_a459 + $7,x
        ldx $10
        jmp L_2b22
    L_2b40:
        lda $2e
        beq L_2b53
        bpl L_2b5d
        lda $29
        sec 
        sbc $2e
        sta $29
        lda $2a
        sbc #$ff
        sta $2a
    L_2b53:
        lda #$08
        sec 
        sbc $29
        and #$07
        sta $2c
        rts 
    L_2b5d:
        lda $29
        sec 
        sbc $2e
        sta $29
        lda $2a
        sbc #$00
        sta $2a
        jmp L_2b53
    L_2b6d:
        jsr L_2f9d
        lda $60
        and #$80
        bne L_2bbe
        ldx #$65
        ldy #$b2
        jsr L_b295
        lda #$00
        sta $90
        lda #$03
        sta $5a
    L_2b85:
        ldy #$1c
        jsr L_b244
        jsr L_2f9d
        lda $60
        and #$80
        beq L_2b85
        lda $62
        sta $2b
        lda #$00
        sta $62
    L_2b9b:
        jsr L_2f9d
        lda $60
        and #$08
        beq L_2bbf
        jsr L_b016 + $3
        jsr L_22d3
        ldy #$18
        jsr L_b244
        inc $62
        lda $60
        and #$80
        beq L_2bc2
        lda $18
        beq L_2bc2
        jmp L_2b9b
    L_2bbe:
        rts 
    L_2bbf:
        jmp L_0a20
    L_2bc2:
        jsr L_b016 + $3
        jsr L_2f9d
        ldx #$50
        ldy #$31
        jsr L_b295
        ldy #$1c
        jsr L_b244
        lda $60
        and #$80
        beq L_2bc2
        lda $18
        beq L_2bc2
        lda $2b
        sta $62
        lda #$12
        sta $90
        lda #$02
        sta $5a
        rts 
    L_2beb:
        lda $29
        clc 
        adc #$07
        sta $31
        lda $2a
        adc #$00
        lsr 
        ror $31
        lsr 
        ror $31
        lsr 
        ror $31
        and #$01
        sta $0f
        lda #$82
        ora $0f
        sta $30
        sta $2c21
        lda $31
        sta $2c20
        lda #$48
        sta $2c24
        lda #$f0
        sta $2c23
        ldx #$11
    L_2c1d:
        ldy #$26
    L_2c1f:
        lda L_81f1 + $f,y
        sta $48f0,y
        dey 
        bpl L_2c1f
        dex 
        beq L_2c42
        inc $2c21
        inc $2c21
        lda $2c23
        clc 
        adc #$28
        sta $2c23
        bcc L_2c1d
        inc $2c24
        jmp L_2c1d
    L_2c42:
        lda $31
        clc 
        adc #$12
        sta $52
        php 
        lda $33
        sec 
        sbc #$58
        and #$f8
        lsr 
        lsr 
        plp 
        adc $30
        sta $53
        lda $30
        ror 
        lda $31
        ror 
        sta $50
        clc 
        adc #$14
        sta $51
        rts 
    L_2c66:
        ldx #$00
        ldy #$e1
        stx $1a
        sty $1b
        ldx #$01
    L_2c70:
        ldy #$00
        sty $11
        lda $1a
        sta L_a3f9 + $7,x
        lda $1b
        sta L_a4f9 + $7,x
        inx 
        beq L_2ca4
        lda ($1a),y
        beq L_2ca4
        sta $8f
        inc $11
    L_2c89:
        ldy $11
        lda ($1a),y
        sec 
        adc $11
        sta $11
        dec $8f
        bne L_2c89
        lda $1a
        clc 
        adc $11
        sta $1a
        bcc L_2c70
        inc $1b
        jmp L_2c70
    L_2ca4:
        rts 
    L_2ca5:
        lda #$00
        tay 
    L_2ca8:
        sta L_a3f9 + $7,y
        sta L_a4f9 + $7,y
        iny 
        bne L_2ca8
        rts 
    L_2cb2:
        lda #$ff
        sta $54
        lda $26
        and #$0f
        tay 
        lda L_e010,y
        sta $12
        lda L_e020,y
        sta $13
        lda #$a2
        sta $15
        lda #$00
        sta $14
    L_2ccd:
        ldy #$3f
        lda #$20
    L_2cd1:
        sta ($14),y
        dey 
        bpl L_2cd1
        dec $15
        dec $15
        lda $15
        cmp #$82
        bcs L_2ccd
        ldx #$40
        ldy #$a2
        stx $14
        sty $15
    L_2ce8:
        ldy #$00
        lda ($12),y
        beq L_2d57
        tax 
        lda L_a4f9 + $7,x
        sta $1b
        lda L_a3f9 + $7,x
        sta $1a
        clc 
        lda $12
        adc #$01
        sta $12
        bcc L_2d04
        inc $13
    L_2d04:
        lda ($1a),y
        iny 
        sta $8f
    L_2d09:
        lda $14
        sta $1c
        lda $15
        sta $1d
        lda ($1a),y
        iny 
        and #$1f
        tax 
    L_2d17:
        lda ($1a),y
        iny 
        sty $11
        ldy #$00
        sta ($1c),y
        ldy $11
        dec $1d
        dec $1d
        dex 
        bne L_2d17
    L_2d29:
        lda $1d
        cmp #$82
        bcc L_2d40
        sty $11
        ldy #$00
        lda #$20
        sta ($1c),y
        ldy $11
        dec $1d
        dec $1d
        jmp L_2d29
    L_2d40:
        clc 
        lda $14
        adc #$01
        sta $14
        bcc L_2d4b
        inc $15
    L_2d4b:
        lda $15
        cmp #$a4
        bcs L_2d66
        dec $8f
        bne L_2d09
        beq L_2ce8
    L_2d57:
        lda L_a3f9 + $8
        sta $1a
        lda L_a4f9 + $8
        sta $1b
        ldy #$00
        jmp L_2d04
    L_2d66:
        ldy #$00
        clc 
        lda $12
        adc #$01
        sta $12
        bcc L_2d73
        inc $13
    L_2d73:
        lda ($12),y
        ora #$80
        and #$bf
        sta $15
        cmp #$a4
        bcs L_2de3
        iny 
        lda ($12),y
        sta $14
        iny 
        lda ($12),y
        beq L_2de3
        tax 
        lda L_a4f9 + $7,x
        sta $1b
        lda L_a3f9 + $7,x
        sta $1a
        clc 
        lda $12
        adc #$03
        sta $12
        bcc L_2d9f
        inc $13
    L_2d9f:
        ldy #$00
        lda ($1a),y
        iny 
        sta $8f
    L_2da6:
        lda $14
        sta $1c
        lda $15
        sta $1d
        lda ($1a),y
        iny 
        and #$1f
        tax 
    L_2db4:
        lda ($1a),y
        iny 
        sty $11
        ldy #$00
        cmp #$20
        beq L_2dc1
        sta ($1c),y
    L_2dc1:
        jsr L_2de4
        ldy $11
        dec $1d
        dec $1d
        bpl L_2de3
        dex 
        bne L_2db4
        clc 
        lda $14
        adc #$01
        sta $14
        bcc L_2dda
        inc $15
    L_2dda:
        dec $8f
        bne L_2da6
        ldy #$00
        jmp L_2d73
    L_2de3:
        rts 
    L_2de4:
        cmp #$59
        bcc L_2e16
        cmp #$5c
        bcs L_2e16
        ldy $54
        iny 
        cpy #$10
        bcs L_2e16
        sty $54
        lda $1d
        and #$01
        sta $0230,y
        lda $1d
        sec 
        sbc #$82
        clc 
        adc #$0c
        lsr 
        sta $0220,y
        lda $1c
        sta $0210,y
        ror 
        sta $0200,y
        lda #$ff
        sta $0240,y
    L_2e16:
        rts 
    L_2e17:
        ldy #$18
        lda #$01
    L_2e1b:
        sta L_a509 + $f,y
        dey 
        cpy #$14
        bcs L_2e1b
        ldy #$0f
        lda #$00
        sta $10
    L_2e29:
        ldx $10
        lda L_0800,x
    L_2e2e:
        inc $10
        and #$0f
        clc 
        adc #$07
        tax 
        lda L_a4f9 + $7,x
        beq L_2e3e
        jsr L_2ea5
    L_2e3e:
        lda L_b355 + $b,x
        sta L_a3f9 + $7,y
        lda L_b375 + $4,x
        sta L_a409 + $7,y
        lda L_340e + $1,x
        sta L_a479 + $7,y
        inc L_a4f9 + $7,x
        ldx $10
        lda L_0800,x
        inc $10
        and #$1f
        cmp #$14
        bcc L_2e62
        adc #$04
    L_2e62:
        tax 
        lda L_a509 + $f,x
        beq L_2e6b
        jsr L_2ebe
    L_2e6b:
        inc L_a509 + $f,x
        txa 
        clc 
        adc L_a409 + $7,y
        sta L_a409 + $7,y
        php 
        lda L_a3f9 + $7,y
        adc #$00
        sta L_a3f9 + $7,y
        plp 
        lda L_a479 + $7,y
        adc #$00
        sta L_a479 + $7,y
        ldx $10
        lda L_0800,x
        inc $10
        and #$01
        clc 
        adc #$42
        sta L_a419 + $7,y
        dey 
        bpl L_2e29
        lda #$00
        ldy #$40
    L_2e9e:
        sta L_a4f9 + $7,y
        dey 
        bpl L_2e9e
        rts 
    L_2ea5:
        lda $8d
        sta $8f
    L_2ea9:
        txa 
        clc 
        adc #$07
        cmp #$17
        bcc L_2eb3
        sbc #$10
    L_2eb3:
        tax 
        dec $8f
        beq L_2ebd
        lda L_a4f9 + $7,x
        bne L_2ea9
    L_2ebd:
        rts 
    L_2ebe:
        lda $8d
        sta $8f
    L_2ec2:
        txa 
        clc 
        adc #$07
        cmp #$27
        bcc L_2ecc
        sbc #$27
    L_2ecc:
        tax 
        dec $8f
        beq L_2ed6
        lda L_a509 + $f,x
        bne L_2ec2
    L_2ed6:
        rts 
    L_2ed7:
        ldx $8d
    L_2ed9:
        lda L_a3f9 + $7,x
        sta $15
        lda L_a409 + $7,x
        sta $14
        ldy #$00
        lda ($14),y
        cmp #$20
        bne L_2f0b
        lda L_a419 + $7,x
        sta ($14),y
        lda L_a479 + $7,x
        sta $15
        lda $58
    L_2ef7:
        sta ($14),y
        dex 
        bpl L_2ed9
        ldx $2c
        lda L_311a + $4,x
        sta L_7a07 + $e
        sta L_7a17 + $3
        sta L_7a17 + $4
        rts 
    L_2f0b:
        lda L_a479 + $7,x
        sta $15
        lda $4d
        jmp L_2ef7
    L_2f15:
        ldy #$26
    L_2f17:
        ldx $10
        lda L_0800,x
        inc $10
        tax 
        lda #$20
        cpx #$f0
        bcc L_2f2d
        lda #$42
        cpx #$f8
        bcs L_2f2d
        adc #$01
    L_2f2d:
        sta ($1c),y
        dey 
        bpl L_2f17
        rts 
    L_2f33:
        ldx #$72
        ldy #$33
        stx $1c
        sty $1d
        lda #$00
        sta $8f
        lda $61
        bne L_2f5b
        ldy $26
        lda L_e030,y
        beq L_2f5b
        sta $8f
    L_2f4c:
        clc 
        lda $1c
        adc #$05
        sta $1c
        bcc L_2f57
        inc $1d
    L_2f57:
        dec $8f
        bne L_2f4c
    L_2f5b:
        ldy #$04
    L_2f5d:
        lda ($1c),y

        .byte $99,$4b,$00

        dey 
        bpl L_2f5d
        lda $4b
        sta L_d020 + $3
        lda $4c
        sta L_d020 + $2
        lda $4e
        sta L_d020 + $5
        lda #$f1
        sta L_d020 + $6
        lda $4d
        and #$f7
        sta $58
        ldx #$a0
        ldy #$d8
        stx $1c
        sty $1d
        ldx #$02
        lda $58
        jsr L_b189
        ldx #$11
        lda $4d
        jsr L_b189
        ldx #$02
        lda $58
        jsr L_b189
        rts 
    L_2f9d:
        lda #$ff
        sta $60
        sta L_dc00
        lda L_dc00 + $1
        and #$08
        cmp #$08
        bne L_2fc7
        lda #$7f
        sta L_dc00
        lda L_dc00 + $1
        ora #$7f
        sta $60
        lda #$bf
        sta L_dc00
        lda L_dc00 + $1
        ora #$f7
        and $60
        sta $60
    L_2fc7:
        rts 
    L_2fc8:
        ldx $54
        bmi L_3000
    L_2fcc:
        ldy $0220,x
        lda L_340e + $1,y
        sta $1f
        lda L_b375 + $4,y
        sta $1e
        ldy $0240,x
        bmi L_2fe2
        lda $4d
        sta ($1e),y
    L_2fe2:
        lda $0200,x
        cmp $50
        bcc L_3001
        cmp $51
        bcs L_3001
        lda $0210,x
        sec 
        sbc $31
        sta $0240,x
        bmi L_3001
        tay 
        lda $55
        sta ($1e),y
    L_2ffd:
        dex 
        bpl L_2fcc
    L_3000:
        rts 
    L_3001:
        lda #$ff
        sta $0240,x
        bne L_2ffd
    L_3008:
        ldx #$09
        lda $5c
        cmp #$01
        beq L_3062
        lda $5d
        cmp #$01
        beq L_303c
    L_3016:
        lda #$f1
        sta L_d810 + $e,x
    L_301b:
        sta L_d860 + $e,x
        lda #$fe
    L_3020:
        sta L_d800,x
        sta L_d840 + $6,x
        lda #$f6
        sta L_d820 + $8,x
        lda #$f5
        sta L_d870 + $8,x
    L_3030:
        lda #$fd
        sta L_d850,x
        sta L_d890 + $6,x
        dex 
        bpl L_3016
    L_303b:
        rts 
    L_303c:
        lda #$f1
        sta L_d800,x
        sta L_d850,x
        lda #$fe
        sta L_d810 + $e,x
        sta L_d820 + $8,x
        lda #$f6
        sta L_d840 + $6,x
        lda #$fd
        sta L_d860 + $e,x
        sta L_d870 + $8,x
        lda #$f5
        sta L_d890 + $6,x
        dex 
        bpl L_303c
        rts 
    L_3062:
        lda #$f1
        sta L_d800,x
        sta L_d850,x
        lda #$fe
        sta L_d820 + $8,x
        lda #$fd
        sta L_d870 + $8,x
        lda #$f0
        sta L_d810 + $e,x
        sta L_d840 + $6,x
        sta L_d860 + $e,x
        sta L_d890 + $6,x
        dex 
        bpl L_3062
        rts 
    L_3086:
        ldx #$00
        stx $10
    L_308a:
        lda L_d410 + $b
        ldx $10
        eor L_0800,x
        sta L_0800,x
        rol L_8007 + $8
        ror L_8007 + $8
        inc $10
        bne L_308a
        rts 
    L_30a0:
        ldx #$00
        ldy #$74
        stx $14
        sty $15
        ldx #$00
        ldy #$70
        stx $12
        sty $13
        lda #$80
        sta $8f
    L_30b4:
        ldx #$07
        stx $10
        ldy #$07
    L_30ba:
        lda #$00
        sta ($14),y
        dey 
        sty $11
        ldy $10
        lda ($12),y
        dey 
        sty $10
        ldy $11
        sta ($14),y
        dey 
        bpl L_30ba
        lda $15
        sec 
        sbc #$04
        sta $15
        ldy #$07
    L_30d8:
        lda #$00
        sta ($14),y
        dey 
        sty $11
        ldy $10
        lda ($12),y
        dey 
        sty $10
        ldy $11
        sta ($14),y
        dey 
        bpl L_30d8
        lda $14
        clc 
        adc #$08
        sta $14
        lda $15
        adc #$04
        sta $15
        clc 
        lda $12
        adc #$08
        sta $12
        bcc L_3105
        inc $13
    L_3105:
        dec $8f
        bne L_30b4
        rts 

    L_310a:
         .byte $00,$90,$98,$a0,$a8,$b0,$b8,$c0,$c4,$c8,$cc,$d0,$d4,$d8,$dc,$e0

    L_311a:
        .byte $e4,$e8,$ec,$f0
        .byte $fe,$fd,$fb,$f7,$ef,$df,$bf,$7f
        .byte $00,$01
        .byte $49,$15   //player1

    L_312a:
        .byte $0a,$22,$0e,$1b,$01
        .byte $ff,$00,$1f
        .byte $49,$15,$0a,$22,$0e,$1b,$02   //player2
        .byte $ff

    L_313a:
        .byte $00,$01
        .byte $01,$1e,$19,$30   //'1UP '
        .byte $7a,$7b
        .byte $30
        .byte $03,$ff
        .byte $00,$1f
        .byte $7a,$7b
        .byte $30

    L_314a:
        .byte $03,$30,$02,$1e,$19//' 3 2UP'
        .byte $ff
        .byte $00,$0f
        .byte $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30   //spaces
        .byte $ff

    L_315e:
         .byte $00,$0f
         .byte $45,$0a,$17,$0d,$30,$17,$18,$54,$25  //land now!
         .byte $ff
         .byte $0e,$0e,$0e,$0e
        .byte $0e,$0e,$0e,$0e,$0e,$0e,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a

    L_317e:
        .byte $0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0e,$0e,$0e,$0e,$0e,$0e

    L_318e:
        .byte $0e,$0e,$0e,$0e,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$01,$01
        .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

    L_31ae:
        .byte $01,$01,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$05,$05,$05,$05
        .byte $05,$05,$05,$05,$05,$05,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
        .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$05,$05,$05,$05,$05,$05
        .byte $05,$05,$05,$05,$04

        eor L_4f4e
        rti 

        .byte $00,$ff,$04,$45,$44,$43,$42,$00,$ff,$04,$41,$42,$43,$44,$00,$ff
        .byte $04,$41,$42,$43,$44,$00,$ff,$10,$59,$58,$57,$56,$55,$54,$53,$52
        .byte $51,$66,$65,$64,$63,$62

        adc ($60,x)
        plp 
        plp 
        bpl L_3254
        rti 

    L_3214:
         .byte $4f,$4e,$4d,$4c,$4b,$4a,$49,$48,$47,$46,$45,$44,$43,$42,$00,$ff
        .byte $04,$55,$56,$57,$58,$00,$01,$04,$5d,$5c,$5b,$5a,$00,$01,$04,$59
        .byte $58,$57,$56,$00,$01,$04,$59,$5a,$5b,$5c,$00,$01,$10,$41,$40,$4f
        .byte $4e,$4d,$4c,$4b,$4a,$49,$67,$68,$69,$6a,$6b,$6c,$6d,$d8,$d8,$10

    L_3254:
        .byte $59,$58,$57,$56,$55,$54,$53,$52,$51,$50,$5f,$5e,$5d,$5c,$5b,$5a

    L_3264:
        .byte $00,$01,$00,$00,$00,$00,$00,$32,$00,$00,$00

        rti 

    L_3270:
         .byte $00,$00,$24,$53,$2b,$00,$00,$00,$00,$00,$00,$39,$00,$00,$00,$00
        .byte $00,$32,$00,$00,$00,$32,$00,$00,$32,$32,$32,$00,$00,$00,$00,$00

    L_3290:
        .byte $00,$32,$00,$f0,$00,$00,$00,$00,$00,$00,$e2,$11,$e9,$00,$00,$fe

    L_32a0:
        .byte $00,$00,$00,$f7,$00,$31,$00,$00,$00,$00,$00,$00,$31,$32,$31,$00

    L_32b0:
        .byte $00,$31,$00,$00,$00,$31,$06,$70,$00,$98,$ff,$00,$00,$ff,$00,$f0
        .byte $59,$06,$aa,$00,$98,$ff,$00,$00,$ff,$00,$f0,$59,$06,$a0,$00,$ae
        .byte $ff,$00,$00,$ff,$00,$f0,$41,$07,$ba,$00,$a8,$ff,$00,$ff,$00,$00

    L_32e0:
        .byte $fb,$89,$07,$aa,$00,$00,$ff,$00,$00,$ff,$00,$f7,$30,$fd,$03

        sed 
        php 
        bcs L_3325 + $e
        bvc L_32b0 + $5

    L_32f5:
         .byte $00,$00,$ff,$fe,$fd,$fd,$fe,$fe,$ff,$00,$01,$02,$03,$03,$02,$02

    L_3305:
        .byte $01,$1a,$25,$30,$3b,$46,$51,$5c,$67,$b6,$d7,$33,$33,$33,$33,$33

    L_3315:
        .byte $33,$33,$33,$32,$32,$00,$82,$00,$8d,$ff,$00,$00,$ff,$00,$fc,$00

    L_3325:
        .byte $01,$6a,$00,$8d,$ff,$00,$00,$ff,$00,$fc,$01,$02,$52,$00,$8d,$ff
        .byte $00,$00,$ff,$00,$fc,$02,$03,$82,$00,$a2,$ff,$00,$00,$ff,$00,$fc
        .byte $03,$04,$6a,$00,$a2,$ff,$00,$00,$ff,$00,$fc,$04,$05,$52,$00,$a2
        .byte $ff,$00,$00,$ff,$00,$fc,$05,$06,$82,$00,$8e,$ff,$ff,$00,$00,$00

    L_3365:
        .byte $fb,$07,$07,$82,$00,$8e,$ff,$ff,$00,$ff,$00,$fe,$06,$fb,$ff,$f8
        .byte $fc,$fb

        beq L_3365 + $f
        inc $f2fa,x
        beq $337a

        .byte $fa,$fe,$f6,$f5,$fd,$f8,$fe,$f6,$f2,$fa,$f8,$f7,$f8,$fb,$fc,$fc
        .byte $fa,$f2,$f6,$fe,$f8,$fd,$f5,$f8,$f7,$f8,$fc,$f0,$fb,$f3,$fd,$fa

    L_339e:
        .byte $f2,$f9,$f8,$f8,$fd,$f5,$fb,$ff,$f8,$f7,$f8,$f6,$f3,$f8,$fc,$fb
        .byte $fb,$ff,$f8,$fe,$f6,$04,$02,$03,$06,$07,$08,$08,$06,$05,$02,$03

    L_33be:
        .byte $06,$08,$0b,$07,$06,$05,$02,$03,$06,$08,$0b,$07,$06,$04,$02,$03

    L_33ce:
        .byte $06,$07,$08,$08,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_33de:
        .byte $00,$00,$00,$10,$11,$0f,$0d,$0c,$00,$0b,$0d,$10,$11,$0e,$0d,$0b

    L_33ee:
        .byte $00,$0c,$0d,$10,$11,$0e,$0d,$0b,$00,$0c,$0d,$10,$11,$0f,$0d,$0c
        .byte $00,$0b,$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_340e:
        .byte $00,$d8,$d8,$d8,$d8,$d8,$d8,$d8,$d9,$d9,$d9,$d9,$d9,$d9,$da,$da
        .byte $da,$da,$da,$da,$da,$db,$db,$db,$db,$db,$80,$80,$80,$80,$00,$00
        .byte $00,$80,$80,$80,$80,$80,$00,$00,$00,$80,$80,$80,$80,$80,$00,$00
        .byte $00,$80,$80,$80,$80,$80,$00,$00,$00,$80,$80,$80,$81,$81,$81,$80
        .byte $80,$80,$80,$81,$81,$81,$80,$80,$00,$01,$00,$01,$00,$01,$02,$00
        .byte $01,$02,$00,$01,$02,$00,$00,$00,$00,$00,$02,$02,$00,$00,$00,$02
        .byte $02,$02,$04,$04,$04,$00,$00,$00,$01,$01,$01,$01,$02,$02,$02,$02
        .byte $02,$02,$02,$02,$02,$00,$00,$00,$02,$02,$02,$02,$04,$04,$04,$04

    L_348e:
        .byte $04,$04,$04,$04,$04,$01,$01,$01,$00,$00,$00,$00,$00,$03,$01,$01

    L_349e:
        .byte $00,$4e,$1b,$12,$0d,$12,$1e,$42,$30,$0b,$22,$30,$3a,$17,$0d,$1b
        .byte $0e,$54,$30,$3b,$1b,$0a,$22,$0b,$1b,$18,$18,$14

        plp 
        bmi $34fe

        .byte $12

        bpl L_34c4 + $d
        bmi $34f0
        bmi L_34c4 + $1

    L_34c4:
         .byte $02,$00,$00,$00,$30,$3a,$3e,$3b  //' 12000 aeb'
         .byte $ff,$ff,$ff,$ff
         .byte $00,$0f

        bmi L_3501 + $3
        eor $55,x
        bmi L_352e
        bmi $350a

        .byte $ff,$00,$0f

        bmi L_3534
        eor $30,x
        lsr $56,x
        bmi $34e4

        .byte $00,$0f

        bmi L_3518 + $1
        bmi L_3539 + $7
        bmi L_3539 + $a
        bmi $351f
        bmi $34f0

        .byte $02,$0a,$57,$ff,$02,$0a,$58,$ff,$02

        asl 
        bmi $352d
        bmi L_352e + $1
        bmi L_3532

    L_3501:
         .byte $32,$33,$34,$35,$36,$37

        sec 
        and $307d,y
        bmi L_3539 + $4
        bmi L_3539 + $6

        .byte $ff,$02

        asl 
        bmi L_3539 + $b
        bmi L_3539 + $d
        bmi L_3559

    L_3518:
         .byte $12,$2e,$1c,$0c,$18,$1b

        asl L_3030
        bmi L_3553
        bmi L_3555

        .byte $ff,$02

        asl 
        bmi $355a
    L_352a:
        bmi $355c
        bmi L_352e + $1

    L_352e:
         .byte $02,$00,$00,$00

    L_3532:
        bmi L_356d + $1
    L_3534:
        rol L_303b,x
        bmi L_355d + $c

    L_3539:
         .byte $ff,$02,$0c,$30,$30,$30,$30,$30,$55,$55,$30,$30,$30,$30,$30,$56
        .byte $56,$ff,$02,$0c

        bmi L_357d + $2
        bmi L_357d + $4
        bmi L_359d + $b
    L_3553:
        bmi L_357d + $8
    L_3555:
        bmi L_357d + $a
        bmi L_357d + $c
    L_3559:
        bmi L_357d + $e
        bmi L_35ad + $6

    L_355d:
         .byte $ff,$02,$0c,$30,$30,$30,$30,$30,$55,$55,$30,$30,$30,$30,$30,$30

    L_356d:
        .byte $30,$56,$ff,$3a,$4b,$5e,$35,$35,$35,$06,$0e,$41,$3e,$50,$4c,$48

    L_357d:
        .byte $47,$ff,$09,$10,$19,$1b,$0e,$1c,$0e,$17,$1d,$1c,$ff,$0c,$0f,$31
        .byte $32,$33,$34,$35,$36,$37,$38,$39,$7d,$ff,$0f,$07,$59,$30,$40,$1b

    L_359d:
        .byte $0a,$0f,$1d,$10,$18,$15,$0d,$30,$45,$1d,$0d,$28,$30,$01,$09,$08

    L_35ad:
        .byte $06,$28,$ff,$12,$05,$3d,$0e,$1c,$12,$10,$17,$0e,$0d,$30,$0a,$17
        .byte $0d,$30,$19,$1b,$18,$10,$1b,$0a,$42,$42,$0e,$0d,$30,$0b,$22,$ff
        .byte $15,$0b,$3a,$17,$0d,$1b,$0e,$54,$30,$3b,$1b,$0a,$22,$0b,$1b,$18
        .byte $18,$14,$28,$ff

        asl $0c
        eor ($0a,x)
        ora $15,x
        bmi L_35f9 + $8

    L_35e9:
         .byte $0f,$30,$3f,$0a,$42,$0e,$ff,$09,$0b,$01,$28,$30,$30,$30,$30,$01

    L_35f9:
        .byte $02,$00,$00,$00,$30,$3a,$3e,$3b,$ff,$00,$01,$20,$00,$0b,$0b,$02
        .byte $28,$30,$30,$30,$30,$01,$01,$00,$00,$00

        bmi L_3643 + $2
        bmi $3647

        .byte $ff,$00,$01,$10,$00,$0d,$0b,$03,$28,$30,$30,$30,$30,$01,$00,$00
        .byte $00,$00

        bmi L_3659 + $2
        bmi L_3659 + $4

        .byte $ff,$00,$01,$00,$00,$0f,$0b,$04

        plp 
        bmi L_3668
        bmi L_3668 + $2
        bmi L_3643 + $2

        .byte $00,$00,$00

        bmi L_366f + $2
        bmi L_366f + $4

    L_3643:
         .byte $ff,$00,$00

        bcc L_3648
    L_3648:
        ora ($0b),y
        ora $28
        bmi L_367e
        bmi L_367e + $2
        bmi L_3659 + $1

        .byte $00,$00,$00

        bmi L_3685 + $2
        bmi L_3689

    L_3659:
         .byte $ff,$00,$00,$80,$00,$13,$0b

        asl $28
        bmi L_3694
        bmi L_3694 + $2
        bmi L_366f

    L_3668:
         .byte $00,$00,$00

        bmi L_369b + $2
        bmi L_369b + $4

    L_366f:
         .byte $ff,$00,$00,$70,$00,$15,$0b,$07

        plp 
        bmi $36aa
        bmi $36ac
        bmi $3684

    L_367e:
         .byte $00,$00,$00

        bmi L_36ad + $6
        bmi L_36ad + $8

    L_3685:
         .byte $ff,$00,$00

        rts 

    L_3689:
         .byte $00,$17,$0b

        php 
        plp 
        bmi L_36bd + $3
        bmi L_36bd + $5
        bmi L_3699

    L_3694:
         .byte $00,$00,$00

        bmi L_36bd + $c
    L_3699:
        bmi L_36bd + $e

    L_369b:
         .byte $ff,$00,$00,$50,$00,$00,$0f,$30,$30,$3c

        clc 
        ora $18,x
        asl L_301b,x
        bmi $36ac

    L_36ad:
         .byte $00,$0f,$3b,$15,$0c,$14,$2e,$50,$11,$1d,$0e,$ff,$00,$0f,$30,$30

    L_36bd:
        .byte $3d,$0e,$42,$18,$30,$30,$30,$ff,$fe,$fc,$fb,$fd,$ff,$fd,$fb,$fc

    L_36cd:
        .byte $d3,$75,$b4,$6d,$be,$7f,$24,$6d,$22,$1a,$b1,$2b,$2b,$1f,$25,$2b

    L_36dd:
        .byte $d3,$7f,$b5,$42,$22,$1f,$23,$23,$be,$2b,$73,$1c,$c3,$1e,$37,$1c

    L_36ed:
        .byte $62,$1f,$21,$20,$be,$2b,$a0,$80,$80

        rts 
        ldy #$a0
        cpy #$b0
        ldy #$40
        bvs L_375d + $2

        .byte $80,$90,$70,$80

    L_3703:
        adc ($61,x)
        sta ($71,x)
        sta ($91,x)
        sta ($91,x)
        lda ($21),y
        adc ($51,x)
        eor ($71,x)
        adc ($41,x)
    L_3713:
        bpl L_3725

        .byte $14,$18,$1c,$0c,$18,$1c,$0c

        asl 
        clc 
        bpl $372c

    L_3720:
         .byte $14,$0e,$18,$0d,$12

    L_3725:
        ora $120c
        ora $0d0e
        bpl L_372d + $f

    L_372d:
         .byte $0c,$0c,$0e,$0d,$0d,$0c,$06,$05,$06,$07,$07,$05,$09,$08,$04,$04

    L_373d:
        .byte $08,$06,$04,$06,$05,$07,$05,$04,$06,$07,$06,$04,$06,$06,$04,$05

    L_374d:
        .byte $06,$06,$05,$06,$06,$07,$00,$02,$05,$09,$09,$09,$02,$00,$14,$12

    L_375d:
        .byte $0f,$0c,$0c,$0c,$12,$00,$fd,$f5,$f5,$f3,$f3,$fe,$fe,$f4,$f4,$f2
        .byte $f2,$f8,$f8,$f7,$f7

        sbc ($f0),y
        sbc $f0f5,x
    L_3777:
        beq L_3777
    L_3779:
        inc $fef3,x
    L_377c:
        beq L_377c
        inc $f0,x
        inc $f4,x
    L_3782:
        beq $3778

        .byte $f2

        beq L_3779
        sed 
        beq L_3782

        .byte $f7,$f0,$f0,$fe,$fe,$fe,$fe,$f7,$f5,$f0,$f5,$fd,$f0,$fd,$f3,$f0

    L_379a:
        .byte $f3,$fe,$f0,$fe,$f6,$f0,$f0,$f0,$f1,$f1,$f0,$f1,$f1,$f0,$f1,$f1

    L_37aa:
        .byte $f0,$f1,$f1,$f0,$f0,$f0,$f0,$f0,$f0,$f7,$f8,$f2,$f4,$fe,$f3,$fd

    L_37ba:
        .byte $f5,$f7,$f8,$f2,$f4,$ff

        sbc ($f0),y
        sbc ($ff),y
        beq $37c5

        .byte $fc

    L_37c7:
        beq L_37aa + $f
        beq L_37ba + $1
        beq L_37ba + $3

        .byte $f3

        sbc $fdf0,x
        sbc $f0,x
        beq $37c5
        beq L_37c7
        beq L_37d9 + $a

    L_37d9:
         .byte $0f,$49,$15,$0a,$22,$0e,$1b,$30,$01,$ff,$0a,$0f,$49,$15,$0a,$22
        .byte $0e,$1b,$30,$02,$ff,$0d,$0e,$40,$0a,$42,$0e,$30,$48,$17,$25,$ff

    L_37f9:
        .byte $10,$0e,$30,$03,$30,$30,$30,$30,$30,$15,$0e,$0f,$1d,$28,$ff,$0d
        .byte $0d,$40,$0a,$42,$0e,$30,$48,$1f,$0e,$1b,$25,$ff,$07,$07,$3d,$0e

    L_3819:
        .byte $1c,$1d,$1b,$1e,$0c,$1d,$30,$1c,$0e,$1a,$1e,$0e,$17,$0c,$0e,$30
        .byte $19,$1b,$12,$42,$0e,$0d,$25,$ff,$0a,$05,$3f,$18,$1b,$42,$0a,$1d
        .byte $12,$18,$17,$30,$0a,$17,$17,$12,$11,$12,$15,$0a,$1d,$12,$18,$17
        .byte $30,$0b,$18,$17,$1e,$1c,$2a,$ff,$10,$0a,$4c,$11,$12,$19,$30,$0d

    L_3859:
        .byte $0e,$1c,$1d,$1b,$1e,$0c,$1d,$30,$0b,$18,$17,$1e,$1c,$2a,$ff,$0d
        .byte $0d,$01,$00,$00

        bmi $38c0
        bmi L_3871

    L_3871:
         .byte $00

        bmi L_3896 + $d
        bmi L_3876

    L_3876:
         .byte $00,$00,$00,$ff,$0d,$04,$52,$18,$1e,$30,$11,$0a,$1f,$0e,$30,$0a
        .byte $42,$0a,$1c,$1c

        asl $300d
        asl 
        bmi L_3896 + $a

        .byte $1b

        asl $1d0a
        bmi L_38a6 + $c

    L_3896:
         .byte $0c,$18,$1b,$0e,$25,$ff,$10,$06,$49,$15,$0e,$0a,$1c,$0e,$30,$0e

    L_38a6:
        .byte $17,$1d,$0e,$1b,$30,$22,$18,$1e,$1b,$30,$12,$17,$12,$1d,$12,$0a

    L_38b6:
        .byte $15,$1c,$28,$ff,$13

        ora ($3a),y
    L_38bd:
        plp 
    L_38be:
        plp 
        bmi L_38ee + $3
        bmi $38c2

    L_38c3:
         .byte $3a,$3b,$3c,$3d,$3e,$3f,$40,$41,$16,$43,$44,$45,$46,$47,$48,$49
        .byte $4a,$4b

        jmp L_4e3e + $f

    L_38d8:
         .byte $4f,$50,$51,$52,$53,$30,$f1,$ff,$fc,$fb,$f0,$ff,$fc,$fb,$f0,$f0

    L_38e8:
        .byte $fb,$fb

        beq L_38d8 + $4
        beq L_38ee

    L_38ee:
         .byte $00,$00,$00,$01,$01,$02

        ora $07
        bpl L_3910 + $8
        bvc L_38fa
    L_38fa:
        bpl $3921
        bvc L_38fe
    L_38fe:
        bvc L_3948 + $8

    L_3900:
         .byte $00,$50,$00,$00,$00,$04,$06,$09,$0c,$0f,$12,$15,$04,$0d,$0b,$09

    L_3910:
        .byte $07,$05,$03,$04,$06,$09,$0c,$0f,$12,$15,$04,$17,$19,$1b,$1d,$1f

        and ($03,x)
        ora $07
        ora #$0c
        bpl L_3938 + $6

    L_3928:
         .byte $80,$80,$80,$80,$a0,$a1,$a2,$a3,$f2,$f2,$f7,$f6,$f4,$f3,$f5,$00

    L_3938:
        .byte $08,$10,$18,$20,$28,$30,$38,$40,$48,$50,$58,$60,$68,$70,$78,$10

    L_3948:
        .byte $55,$f8,$08,$20,$55,$f8,$08,$40,$55,$f8,$08,$10,$00,$56,$80,$80
        .byte $00,$cf,$ff,$80,$00,$fa

        php 
        jsr L_cd50 + $5

        .byte $80,$10,$55,$cd,$80,$40,$55,$cd,$80,$10,$33,$fc,$10,$10,$80

        beq L_39a3
        rti 

        .byte $00

        sbc L_7ff7 + $b,y
        bcc $3976
        bpl L_399c
        bvs L_3928 + $2

        .byte $04,$80,$a0,$cd,$18,$80,$00,$00,$01,$20,$00,$cc,$30,$10,$c0,$4c

    L_398e:
        .byte $08,$80

        bcc L_398e
        rti 
        rti 
        ora L_4077 + $5,x
        rti 

        .byte $7c,$00

        rti 
        rti 
    L_399c:
        bpl L_3938 + $8
        jsr $0980

        .byte $00

        rti 

    L_39a3:
         .byte $80,$07,$00

        rti 

        .byte $80,$19,$4c,$24,$08,$00,$10,$00,$f2,$4b,$00

        ora ($00,x)
        php 
        rti 

        .byte $00,$00,$00,$00,$00,$0f,$ff,$ff,$00,$00,$05,$00,$01,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$08,$00,$05,$00,$00,$80,$80,$04,$00

        php 
        rti 

        .byte $00,$00,$00,$00,$00,$08,$08,$05,$00,$00,$80,$80,$04,$00

        php 
        bvc L_39e7

    L_39e7:
         .byte $00,$00,$00,$00

        php 
        bpl L_39ee + $5

    L_39ee:
         .byte $00,$00,$80,$80,$04,$00

        php 
        rts 

        .byte $00,$00,$00,$00,$00,$05,$00,$10,$00,$05,$30,$00,$01,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$12,$00,$01,$01,$00,$18,$80,$02,$00,$00,$00
        .byte $00,$01,$04,$02,$00,$0c,$00,$02,$fc,$ff

        rti 

        .byte $00,$01,$00,$00,$00,$00,$00,$00,$00,$00

        ora $1400
        rti 

        .byte $ff,$0c,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00
        .byte $14,$0c,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$05,$00,$80,$00
        .byte $ff,$01,$08,$02,$00,$00,$00,$00,$01,$00,$08,$00,$05,$00,$02,$ff
        .byte $ff,$10,$50,$02,$00,$00,$00,$00,$00,$00,$00,$00,$12,$80,$01,$20
        .byte $00,$18,$28,$02,$00,$00,$00,$00,$01,$80,$02,$00,$00,$00,$12,$00
        .byte $0f,$05,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$01,$00
        .byte $05,$0c,$04,$05,$00,$03,$c0,$00,$00,$00,$00,$00,$09,$00,$05,$f0
        .byte $ff,$38,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$09,$00,$07,$ee
        .byte $ff,$40,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$0e,$40,$02,$fc
        .byte $ff

        rts 

        .byte $00,$01,$00,$00,$00,$00,$00,$00,$00,$90,$0e,$a0,$03,$fa,$ff

        rts 

        .byte $00,$01,$00,$00,$00,$00,$00,$00,$00

        sta ($08),y
        rti 

        .byte $02,$00,$00

        rti 

    L_3ae1:
         .byte $00,$01,$00,$08,$00,$00,$00,$00,$00,$00,$02,$00,$08,$e0,$00,$06

    L_3af1:
        .byte $06,$01,$00,$08,$04,$00,$00,$00,$00,$00,$00,$00,$16,$00,$01,$03
        .byte $03,$08,$00,$00,$00,$00,$00,$00,$00,$00,$07,$00,$0c,$00

        php 
        php 
        php 
        rti 

        .byte $00,$00,$00,$00,$01,$00,$0c,$00,$10,$00,$04,$00,$0c,$0c,$08,$18
        .byte $00,$00,$00,$00,$01,$00,$04,$00,$10,$00,$04,$00,$10,$0c,$05,$20
        .byte $00,$00,$00,$00,$01,$00,$04,$00

        ora $00
        jsr $f600

        .byte $04,$06,$0e,$00,$00,$00,$00

        ora ($00,x)
        jsr $0500

        .byte $00,$02,$f6,$ff,$18,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$08
        .byte $00,$06,$fc,$ff

        cpy #$00
        ora ($00,x)
        php 
        bpl L_3b67

    L_3b67:
         .byte $00,$00,$00,$00,$08,$00,$06,$fb,$ff

        cpy #$00
        ora ($00,x)
        php 
        bpl L_3b77

    L_3b77:
         .byte $00,$00,$00,$00,$08,$00,$06,$fa,$ff

        cpy #$00
        ora ($00,x)
        php 
        bpl L_3b87

    L_3b87:
         .byte $00,$00,$00,$00,$07,$00,$04,$00,$42,$60,$20,$20,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$07,$00,$04,$00,$81,$40,$18,$20,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$05,$00,$03,$00,$03,$02,$02,$04,$00,$00,$00,$00
        .byte $00,$00,$00,$00

        ora ($00),y
        pha 
        rts 

        .byte $02,$10,$00,$01,$00,$00,$00,$00,$00,$00,$00,$24,$11,$00,$10,$00
        .byte $06,$10,$00,$01,$00,$00,$00,$00,$00,$00,$00,$25,$0c,$00,$05,$30
        .byte $00,$80,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$0c,$00,$05,$50
        .byte $00,$80,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$04,$00
        .byte $12,$05,$0c,$02,$00,$05,$50,$00,$01,$00,$04,$00,$13,$00,$00,$00
        .byte $00

        beq $3c13
        ora ($00,x)
        php 
        bpl L_3c17

    L_3c17:
         .byte $00,$00,$00,$00,$14,$00,$00,$00,$00,$ff,$00,$01,$80,$07,$04,$00
        .byte $00,$00,$00,$00,$15,$00,$00,$10,$00,$03,$06,$ff,$00,$08,$00,$00
        .byte $00,$00,$00,$00,$16,$00,$00,$00,$00

        rti 

        .byte $00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$17,$00,$00,$00,$00

        jsr $0100

        .byte $00,$00,$00,$00,$00,$00,$00,$00,$18,$00,$00,$03,$09,$ff,$00,$01
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$00,$08,$00,$03,$06,$ff
        .byte $00,$06,$d0,$00,$00,$00,$00,$00,$08,$00,$18,$00,$02,$09,$09,$03
        .byte $00,$07,$50,$00,$01,$00,$18,$00

    L_3c8b:
        jsr L_161a

    L_3c8e:
         .byte $14,$12,$10,$0e,$0c,$0a,$08,$00

        jsr $1c1e

        .byte $1a,$18,$16,$00,$00,$63,$09,$ff,$00,$64,$69,$00,$65,$44,$00,$64
        .byte $29,$00,$65,$24,$29,$ff,$49,$28,$00,$64,$29,$00,$65,$26,$00,$64
        .byte $29,$00,$65,$28,$24,$ff,$2d,$21,$2b,$21,$29,$28,$46,$ff,$00,$65
        .byte $01,$ff,$00,$64,$06,$ff,$00,$24,$4d,$2b,$2d,$00,$25,$26,$24,$23
        .byte $24,$ff,$00,$24,$4d,$2b,$2d,$00,$25,$46,$24,$23,$ff,$28,$2b,$2d
        .byte $2b,$1d,$1b,$18,$14,$11,$00,$64,$1b,$19,$14,$ff,$61,$21,$41,$41

    L_3cf9:
        .byte $ff,$61,$21,$44,$29,$28,$ff,$6a,$70,$77,$7e,$86,$8e,$96,$9f,$a8

    L_3d09:
        .byte $b3,$bd,$c8,$d4,$e1,$ee,$fd,$73,$c7,$7c,$97,$1e,$18,$8b,$7e,$fa

    L_3d19:
        .byte $06,$ac,$f3,$e6,$85,$3c,$3c,$3c,$3c,$3c,$3c,$3c,$0b,$1b,$2b,$3b

    L_3d29:
        .byte $4b,$5b,$6b,$00,$0c,$17,$00,$0c,$17,$01,$0d,$18,$02,$0d,$18,$01
        .byte $0d,$18,$02,$0e,$18,$03,$0f,$18,$04,$10,$18,$03,$0f,$18,$04,$10
        .byte $18,$05,$11,$18,$06,$10,$19,$07,$12,$19,$08,$13,$18,$05,$11,$1a
        .byte $06,$10,$18,$07,$12,$18,$08,$0f,$1b,$09,$14,$1c,$01,$15,$1d,$0a

    L_3d69:
        .byte $16,$1d,$0b,$11,$1e,$ff,$ff,$ff,$b0,$b4,$b9,$c7,$e0,$e7,$f8,$09
        .byte $18,$27,$2e,$35,$9d,$a1,$af,$bf,$c7,$cb,$cf,$db,$e6,$f5,$fa,$38

    L_3d89:
        .byte $3c,$4d,$5f,$6d,$87,$8e,$95,$3d,$3d,$3d,$3d,$3d,$3d,$3d,$3e,$3e
        .byte $3e,$3e,$3e,$3c,$3c,$3c,$3c,$3c,$3c,$3c,$3c,$3c,$3c,$3c,$3e,$3e
        .byte $3e,$3e,$3e,$3e,$3e,$3e,$00,$00,$11,$09,$ff,$69,$29,$49,$49,$ff
        .byte $00,$11,$69,$00,$12,$29,$00,$13,$24,$29,$00,$12,$44,$ff,$00,$11
        .byte $29,$00,$12,$29,$00,$11,$29,$00,$13,$24,$00,$11,$2b,$00,$12,$2b
        .byte $00,$11,$2b,$00,$13,$26,$ff,$00,$12,$61,$21,$41,$41,$ff,$00,$12
        .byte $66,$00,$13,$16,$38,$00,$12,$26,$00,$13,$26,$00,$12,$26,$ff,$00
        .byte $12,$66,$00,$13,$16,$38,$00,$12,$26,$00,$13,$26,$00,$12,$28,$ff
        .byte $69,$00,$13,$19,$3b,$00,$12,$29,$00,$13,$29,$00,$12,$29,$ff,$69
        .byte $00,$13,$19,$3b,$00,$12,$29,$00,$13,$29,$00,$12,$2b,$ff,$2d,$2b
        .byte $28,$21,$44,$44,$ff,$00,$12,$66,$26,$46,$46,$ff,$06,$ff,$00,$00
        .byte $01,$09,$ff,$00,$33,$46,$00,$45,$29,$29,$00,$32,$46,$00,$45,$19
        .byte $19,$1f,$1f,$ff,$00,$33,$46,$00,$45,$19,$19,$19,$19,$00,$33,$26
        .byte $26,$00,$45,$29,$29,$ff,$00,$45,$19,$19,$13,$13,$00,$33,$46,$26
        .byte $26,$26,$26,$ff,$00,$33,$26,$00,$45,$19,$19,$00,$33,$26,$00,$45
        .byte $19,$19,$00,$33,$26,$00,$45,$19,$19,$00,$33,$26,$26,$ff,$00,$03
        .byte $6d,$2d,$4d,$4d,$ff,$00,$03,$69,$29,$49,$49,$ff,$00,$03,$06,$ff

    L_3e99:
        .byte $00,$fe,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$48,$a9,$c0,$8d,$16,$d0,$a9,$2d,$8d
        .byte $18,$d0,$a9,$01,$8d,$19,$d0,$a9,$52,$8d,$12,$d0,$a9,$1b,$8d,$11
        .byte $d0,$a9,$f0,$8d,$21,$d0,$e6,$2f,$a9,$38,$8d,$fe,$ff,$a9,$3f,$8d

    L_3f29:
        .byte $ff,$ff,$8a,$48,$98,$48,$20,$23,$0e,$68,$a8,$68,$aa,$68,$40,$48
        .byte $38,$a9,$06,$e9,$01,$d0,$fc,$a5,$2c,$29,$07,$09,$d0,$8d,$16,$d0

    L_3f49:
        .byte $a9,$2f,$8d,$18,$d0,$a5,$4a,$8d,$21,$d0,$a9,$01,$8d,$19,$d0,$a9
        .byte $61,$8d,$12,$d0,$a9,$1b,$8d,$11,$d0,$e6,$2f,$a9,$73,$8d,$fe,$ff
        .byte $a9,$3f,$8d,$ff,$ff,$20,$4b,$b2,$68,$40,$48,$a9,$01,$8d,$19,$d0
        .byte $a9,$fc,$8d,$12,$d0,$a9,$1b,$8d,$11,$d0,$a9,$00,$85,$2f,$a9,$00
        .byte $8d,$fe,$ff,$a9,$3f,$8d,$ff,$ff,$68,$40,$48,$a9,$07,$38,$e9,$01
        .byte $d0,$fc,$a9,$2d,$8d,$18,$d0,$a9,$f0,$8d,$21,$d0,$a9,$1b,$8d,$11
        .byte $d0,$a9,$c8,$8d,$16,$d0,$a9,$00,$85,$2f,$a9,$01,$8d,$19,$d0,$ad
        .byte $b0,$3f,$8d,$12,$d0,$49,$80,$8d,$b0,$3f,$20,$4b,$b2,$a5,$2f,$f0
        .byte $0b,$8a,$48,$98,$48,$20,$23,$0e,$68,$a8,$68,$aa,$68,$40,$41,$42
        .byte $41,$4e,$44,$4f,$4e,$20,$41,$4c,$4c,$20,$48,$4f,$50,$45,$2c,$20
        .byte $59,$45,$20,$57,$48,$4f,$45,$4e,$54

        eor $52
        jsr L_453d + $b

        .byte $52,$45,$2e,$00,$00,$00,$00,$00,$00,$00,$00,$00,$ff,$ff,$f4,$ff
        .byte $ff,$64,$aa,$a9,$54,$aa,$a5,$00,$aa,$9a,$d4,$aa,$6f,$51,$ff,$fd

    L_4017:
        .byte $40,$aa,$a9,$00,$af,$e9,$00,$ba,$99,$00,$ea,$99,$00,$aa,$99,$00

    L_4027:
        .byte $6a,$99,$00,$5a,$99,$00,$95,$59,$00,$a5,$69,$00,$aa,$a9,$00,$aa
        .byte $a9,$00,$ff,$e9,$00,$aa,$99,$00,$00,$00,$00,$00,$ff,$ff,$ff,$aa
        .byte $ab,$ff,$55,$7e,$aa,$03,$ea,$aa,$3e,$aa,$aa,$ea,$aa,$aa,$ff,$ff
        .byte $ff,$aa,$aa,$aa,$aa,$bf,$aa,$aa,$ff,$6a,$ab,$ea,$6a,$af,$aa,$6b
        .byte $be,$aa,$69,$ba,$a9,$6a,$ba,$a5,$aa,$ba,$96,$aa,$ba,$9a,$aa,$ba

    L_4077:
        .byte $9a,$aa,$ba,$9a,$af,$ba,$9a,$fa,$00,$00,$0f,$f0,$00,$3a,$af,$00
        .byte $2a,$aa,$00,$1a,$a5,$00,$05,$50,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $03,$00,$00,$0f,$00,$00,$3e,$00,$00,$fa,$00,$03,$ea,$00,$0f,$aa
        .byte $03,$fe,$96,$0f,$fa,$9e,$3e,$aa,$be,$fa,$aa,$aa,$fa,$af,$aa,$fb
        .byte $fa,$6a,$f9,$5a,$6a,$fa,$ba,$6a,$00,$aa,$99,$00,$55,$69,$00,$aa
        .byte $a9,$00,$aa,$a9,$00,$aa,$a9,$00,$af,$e9,$00,$ba,$99,$00,$ea,$99
        .byte $00,$aa,$99,$00,$6a,$99,$00,$5a,$99,$00,$95,$59,$00,$a5,$69,$00
        .byte $55,$55,$40,$aa,$55,$51,$aa,$95,$54,$aa,$a5,$00,$aa,$a9,$5c,$55
        .byte $55,$64,$55,$55,$54,$00,$00,$00,$00,$ba,$9a,$5a,$ba,$9a,$a5,$ba
        .byte $9a,$aa,$ba,$9a,$aa,$ba,$96,$aa,$ba,$a5,$aa,$ba,$a9,$6a,$b6,$aa
        .byte $6a,$a5,$aa,$6b,$a9,$6a,$69,$aa,$55,$6a,$aa,$95,$aa,$aa,$aa,$aa
        .byte $55,$55,$55,$6a,$aa,$aa,$16,$aa,$aa,$01,$6a,$aa,$ff,$d6,$aa,$aa
        .byte $a9,$55,$55,$55,$55,$00,$00,$00,$00,$fa,$ba,$6a,$fb,$fa,$6a,$f9
        .byte $5a,$6a,$fa,$a5,$aa,$fa,$aa,$aa,$3a,$aa,$96,$05,$5a,$9e,$01,$56
        .byte $be,$00,$05,$aa,$00,$01,$6a,$00,$00,$5a,$00,$00,$16,$00,$00,$05
        .byte $00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$0f,$f0,$00,$3a,$af,$00
        .byte $2a,$aa,$00,$1a,$a5,$00,$05,$50,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$09,$00,$00,$a9,$00,$00,$ed,$00,$00,$a9,$00,$00,$a9,$00,$00
        .byte $fe,$00,$00,$a9,$00,$00,$a9,$00,$00,$a9,$00,$00,$a9,$00,$00,$fe
        .byte $00,$00,$a9,$00,$00,$a9,$00,$00,$ed,$00,$00,$a9,$00,$00,$09,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$0f,$00,$00,$ff,$00,$00,$ff,$00,$00,$ff,$00,$00,$ff,$00,$00
        .byte $ff,$00,$00,$ff,$00,$00,$ff,$00,$00,$ff,$00,$00,$ff,$00,$00,$ff
        .byte $00,$00,$ff,$00,$00,$ff,$00,$00,$ff,$00,$00,$ff,$00,$00,$0f,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$0f,$00,$00,$ef,$00,$00,$ff,$00,$00,$f7,$00,$00,$ff,$00,$00
        .byte $ef,$00,$00,$ff,$00,$00,$f7,$00,$00,$ff,$00,$00,$ef,$00,$00,$ff
        .byte $00,$00,$f7,$00,$00,$ff,$00,$00,$ef,$00,$00,$ff,$00,$00,$07,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$03,$00,$00,$c7,$00,$00,$c7,$00,$00,$e3,$00,$00,$e3,$00,$00
        .byte $c7,$00,$00,$c7,$00,$00,$e3,$00,$00,$e3,$00,$00,$c7,$00,$00,$c7
        .byte $00,$00,$e3,$00,$00,$e3,$00,$00,$c7,$00,$00,$c7,$00,$00,$03,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$01,$00,$00,$83,$00,$00,$83,$00,$00,$c1,$00,$00,$c1,$00,$00
        .byte $83,$00,$00,$83,$00,$00,$c1,$00,$00,$c1,$00,$00,$83,$00,$00,$83
        .byte $00,$00,$c1,$00,$00,$c1,$00,$00,$83,$00,$00,$83,$00,$00,$01,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$01,$00,$00,$01,$00,$00,$80,$00,$00,$80,$00,$00
        .byte $01,$00,$00,$01,$00,$00,$80,$00,$00,$80,$00,$00,$01,$00,$00,$01
        .byte $00,$00,$80,$00,$00,$80,$00,$00,$01,$00,$00,$01,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$03,$ff,$c0,$01,$55,$40,$02
        .byte $aa,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_4317:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$03
        .byte $ff,$c0,$01,$55,$40,$02,$aa,$80,$00,$00,$00,$00,$00,$00,$00,$03
        .byte $ff,$c0,$01,$55,$40,$02,$aa,$80,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$03,$ff,$c0,$01,$55,$40,$02
        .byte $aa,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$03,$ff,$c0,$01,$55,$40,$02,$aa
        .byte $80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $03,$ff,$c0,$01,$55,$40,$02,$aa,$80,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$03,$ff,$c0,$01,$55,$40,$02,$aa,$80,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$3c,$00,$00,$f5,$00,$00,$d6,$00,$00,$5a,$00,$00,$28,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_4437:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$ff,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$30,$0c,$00,$e0,$07,$03
        .byte $80,$01,$fe,$00,$00,$f5,$00,$00,$d6,$00,$00,$5a,$00,$03,$aa,$40
        .byte $0e,$00,$90,$38,$00,$24,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$ff,$00,$00,$00,$00,$3c,$00,$00
        .byte $f5,$00,$00,$d6,$00,$00,$5a,$00,$00,$28,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$3c,$00,$00,$f5,$00,$00,$d6,$00,$00
        .byte $5a,$00,$00,$28,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$03,$3c,$c0,$01,$fb

        rti 

        .byte $00,$69,$00,$03,$ff,$c0,$01,$79,$40,$02,$aa,$80,$00,$ff,$00,$03

        adc $01c0,y
        plp 
        rti 

        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_453d:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $3c,$00,$0c

        sec 
        bmi L_4558 + $2
        plp 
        bne L_4557

        .byte $00

    L_4557:
        rti 

    L_4558:
         .byte $00,$00,$00,$0f,$3c,$f0,$05,$38,$50,$0a,$28,$a0,$00,$00,$00,$03
        .byte $00,$c0,$0d,$3c,$70,$04,$38,$10,$00,$28,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3c
        .byte $00,$00,$38,$00,$30,$28,$0c,$1c,$00,$34,$04,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$3c,$3c,$3c,$14,$38,$14,$28,$28,$28,$00,$00,$00,$00
        .byte $00,$00,$0c,$00,$30,$34,$00,$1c,$10,$3c,$04,$00,$38,$00,$00,$28
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$3c,$00,$00,$38,$00,$00,$28
        .byte $00,$c0,$00,$03

        rti 

        .byte $00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$f0,$3c
        .byte $0f,$50,$38,$05,$a0,$28,$0a,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$c0,$00,$03

        rti 

        .byte $00,$01,$00,$3c,$00,$00,$38,$00,$00,$28,$00,$00,$00,$30,$00,$00
        .byte $10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$c3,$00,$00,$41,$00,$00,$3c,$03,$c0,$38,$01,$40,$28,$00
        .byte $00,$c3,$00,$00,$41,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$0c,$00,$00,$04,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$03,$3c
        .byte $c0,$01,$fb

        rti 

        .byte $00,$69,$00,$03,$c3,$c0,$01,$41,$40,$02,$82,$80,$00,$ff,$00,$03

        adc $01c0,y
        plp 
        rti 

        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $3c,$00,$0c

        sec 
        bmi L_4698 + $2
        plp 
        bne L_4697

        .byte $00

    L_4697:
        rti 

    L_4698:
         .byte $00,$00,$00,$0f,$00,$f0,$05,$00,$50,$0a,$00,$a0,$00,$00,$00,$03
        .byte $00,$c0,$0d,$3c,$70,$04,$38,$10,$00,$28,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3c
        .byte $00,$00,$38,$00,$30,$28,$0c,$1c,$00,$34,$04,$00,$10,$00,$00,$00
        .byte $00,$00,$00,$3c,$00,$3c,$14,$00,$14,$28,$00,$28,$00,$00,$00,$00
        .byte $00,$00,$0c,$00,$30,$34,$00,$1c,$10,$3c,$04,$00,$38,$00,$00,$28
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$3c,$00,$00,$38,$00,$00,$28
        .byte $00,$c0,$00,$03,$70,$00,$0d,$10,$00,$04,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$f0,$00,$0f,$50,$00,$05,$a0,$00,$0a,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$30,$00,$0c,$d0,$00,$07

        rti 

        .byte $00,$01,$00,$3c,$00,$00,$38,$00,$00,$28,$00,$00,$00,$30,$00,$00
        .byte $10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$03,$c0,$00,$01,$40,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$0c,$00,$00,$04,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

        jsr $2623
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $29
        jsr L_2220

        .byte $23,$26,$26,$26,$26,$29,$25,$25,$25,$25,$40,$24,$24,$24,$24,$3e
        .byte $25,$25,$25,$25,$40,$24,$24,$24,$24,$3e,$25,$25,$25,$25,$23

        rol $26
        rol $26
        and #$28
        jsr L_2220

        .byte $22

        rti 
        bit $24
        rol L_2528,x
        and $25
        and $28
        jsr L_2020
        jsr L_571e + $4
        eor $55,x
        lsr $28,x
        jsr L_2020
        jsr $2522
        and $25
        and $22
        rti 
        bit $24
        rol L_2828,x
        jsr L_2220

    L_491a:
         .byte $22,$28,$9e,$9f,$22,$28,$25,$25,$25,$25,$41,$26,$26,$26,$26,$3f
        .byte $25,$25,$25,$25,$41,$26,$26,$26,$26,$3f,$25,$25,$25,$25,$22,$28

    L_493a:
        .byte $9e,$9f,$22

        plp 
        plp 
        jsr L_2220

    L_4942:
         .byte $22,$28,$be,$bf,$22,$28,$25,$25,$40,$24,$24,$24,$24,$3e,$25,$25
        .byte $25,$25,$25,$25,$25,$25,$40,$24,$24,$24,$24,$3e,$25,$25,$22

        plp 
    L_4962:
        ldx L_22bf,y
        plp 
        plp 
        jsr L_2220

        .byte $22

        eor ($26,x)
        rol $3f
        plp 
        and $25
        plp 
        jsr L_2020
        jsr L_571e + $4

        .byte $57

        eor $55,x
        eor $55,x
        lsr $56,x
        plp 
        jsr L_2020
        jsr $2522
        and $22
        eor ($26,x)
        rol $3f
        plp 
        plp 
        jsr L_2220
        and ($24,x)
        bit $24
        bit $27
        and $25
        eor ($26,x)
        rol $26
        rol $3f
        and $25
        and $25
        and $25
        and $25
        eor ($26,x)
        rol $26
        rol $3f
        and $25
        and ($24,x)
        bit $24
        bit $27
        plp 
        jsr L_2220
        and $25
        and $25
        and $25
        rti 
        bit $24
        bit $24
        rol $2525,x
        and $25
        and $25
        and $25
        and $25
        and $25
        rti 
        bit $24
        bit $24
        rol $2525,x
        and $25
        and $25
        plp 
        jsr L_2220
        and $25
        and $25
        and $25
        plp 
        jsr L_2020
        jsr L_571e + $4

        .byte $57,$57

        eor $55,x
        eor $55,x
        eor $55,x
        lsr $56,x
        lsr $28,x
        jsr L_2020
        jsr $2522
        and $25
        and $25
        and $28
        jsr L_2220
        and $25
        and $25
        and $25
        eor ($26,x)
        rol $26
        rol $3f
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        eor ($26,x)
        rol $26
        rol $3f
        and $25
        and $25
        and $25
        plp 
        jsr L_2220
        and $25
        and $25
        rti 
        bit $24
        bit $24
        rol $2525,x
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        rti 
        bit $24
        bit $24
        rol $2525,x
        and $25
        plp 
        jsr L_2220
        and $25
        and $25
        plp 
        jsr L_2020
        jsr L_571e + $4

        .byte $57,$57,$57

        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        lsr $56,x
        lsr $56,x
        plp 
        jsr L_2020
        jsr $2522
        and $25
        and $28
        jsr L_2220
        and $25
        and $25
        eor ($26,x)
        rol $26
        rol $3f
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        eor ($26,x)
        rol $26
        rol $3f
        and $25
        and $25
        plp 
        jsr L_2220
        and $25
        rti 
        bit $24
        bit $24
        rol $2525,x
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        rti 
        bit $24
        bit $24
        rol $2525,x
        plp 
        jsr L_2220
        and $25
        plp 
        jsr L_2020
        jsr L_571e + $4

        .byte $57,$57,$57,$57

        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        lsr $56,x
        lsr $56,x
        lsr $28,x
        jsr L_2020
        jsr $2522
        and $28
        jsr L_2220
        and $25
        eor ($26,x)
        rol $26
        rol $3f
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        eor ($26,x)
        rol $26
        rol $3f
        and $25
        plp 
        jsr L_2220
        rti 
        bit $24
        bit $24
        rol $2525,x
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        and $25
        rti 
        bit $24
        bit $24
        rol $2028,x
        jsr $2822
        jsr L_2020
        jsr L_571e + $4

        .byte $57,$57,$57,$57,$57,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55
        .byte $55,$56,$56,$56,$56,$56,$56,$28,$20,$20,$20,$20,$22,$28,$20,$20
        .byte $22,$41,$26,$26,$26,$26,$3f,$25,$25,$25,$25,$25,$25,$25,$25,$25
        .byte $25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$41
        .byte $26,$26,$26,$26,$3f,$28,$20,$20,$21,$24,$24,$24,$24,$24,$24,$24

    L_4ba1:
        .byte $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
        .byte $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$27

        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
    L_4bd4:
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr $ff20

    L_4be9:
         .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$8e
        .byte $8f,$ff,$00,$ff,$00,$ff,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$f0,$00,$03,$ac,$00,$03
        .byte $ab,$00,$0e,$9c,$00,$0e,$6b,$00,$03,$9b,$00,$0e,$aa,$c0,$03,$9a
        .byte $c0,$00,$eb,$00,$03,$ac,$00,$00,$f0,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $03,$00,$00,$0e,$cc,$00,$0e,$bb,$c0,$03,$aa,$b0,$0e,$99,$b0,$3a
        .byte $aa,$c0,$3a,$a6,$c0,$0e,$6a,$b0,$0e,$a6,$c0,$0e,$9a,$f0,$03,$aa
        .byte $b0,$0e,$aa,$c0,$0e,$bf,$00,$0f,$b0,$00,$00,$c0,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3c,$00,$00
        .byte $eb,$00,$00,$e6,$c0,$3c,$2a,$cc,$ec,$3e,$bb,$eb,$03,$6a,$ab,$3e
        .byte $aa,$ac,$ea,$66,$f0,$fa,$aa,$c0,$0e,$69,$b0,$0e,$a6,$c0,$0e,$aa
        .byte $f0,$0f,$9a,$ac,$3e,$aa,$6c,$3a,$be,$ac,$39,$b3,$b0,$3a,$c0,$ec
        .byte $0f,$00,$30,$00,$00,$00,$00,$00,$00,$00,$0c,$00,$0c,$3b,$00,$3c
        .byte $ea,$c0,$eb,$e6,$b0,$db,$ea,$b3,$ab,$3a,$be,$9c,$0e,$ea,$6c,$03
        .byte $6a,$ac,$0e,$a6,$b0,$3a,$9a,$f0,$0e,$aa,$c0,$0d,$a9,$b0,$0e,$9a
        .byte $c0,$03

        tax 
        beq $4d2d

        .byte $fa,$ec,$3a,$fb,$ac,$e6,$bf,$6f,$e9,$b3,$ab,$ea,$c0,$ef,$3f,$00
        .byte $3c,$00,$00,$00,$00,$00,$00,$0c,$0c,$00,$3c,$3b,$00,$eb,$36,$c0
        .byte $eb,$3a,$b3,$bb,$0e,$fe,$ac,$03,$ab

        cpx L_aaff + $4
        ldy $ee0e
        bcs $4ced

        .byte $ab,$f0,$0e,$ba,$c0,$03,$ab,$00,$0e,$ee,$c0,$03

        tax 
        beq L_4d2e + $3

    L_4d2e:
         .byte $fb,$c0,$0e,$ff,$bc,$3a,$bc,$ec,$ea,$c0,$eb,$fb,$30,$ef,$3c,$00
        .byte $3c,$00,$00,$00,$0c,$00,$00,$3c,$0c,$00,$ff,$3b,$00,$fb,$3a,$c0
        .byte $eb,$3a,$c0,$fc,$0e,$c0,$ec,$03,$c3,$f0,$03,$b3,$80,$00,$ee,$cc
        .byte $00,$eb,$c0,$03,$ba,$c0,$03,$ab,$00,$0e,$ee,$c0,$03,$eb,$f0,$00
        .byte $3b,$00,$0f,$fc,$0c,$3a,$b0,$3b,$3a,$c0,$3b,$0f,$30,$3c,$00,$00
        .byte $0c,$00,$00,$00,$00,$00,$00,$0c,$00,$00,$3c,$0f,$00,$3f,$3a,$c0
        .byte $3b,$0e,$c0,$3c,$0e,$c0,$ec,$03,$03,$f0,$00,$33,$03,$00,$ee,$c0
        .byte $00,$eb,$c0,$03,$ae,$c0,$03,$bb,$00,$03,$ea,$c0,$00,$eb,$03,$00
        .byte $3f,$00,$03,$0c,$0c,$0e,$c0,$0f,$0e,$c0,$3b,$03,$30,$0c,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0c,$03,$00,$0c,$0e,$c0
        .byte $3c,$0e,$c0,$3c,$03,$c0,$30,$00,$00,$f0,$00,$03,$00,$00,$3f,$00
        .byte $00,$eb,$00,$00,$ee,$c0,$03,$bb,$00,$03,$ff,$00,$00,$eb,$00,$00
        .byte $3c,$00,$00,$0c,$00,$03,$00,$0c,$03,$c0,$0c,$03,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0c,$03,$00
        .byte $0c,$0e,$c0,$3c,$03,$00,$30,$00,$00,$30,$00,$00,$00,$00,$3c,$00
        .byte $00,$3f,$00,$00,$ef,$00,$00,$fb,$00,$00,$ff,$00,$00,$ec,$00,$00
        .byte $3c,$00,$00,$00,$00,$00,$00,$00,$03,$00,$00,$00,$00,$00,$00,$00

    L_4e3e:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $0c,$03,$00,$3c,$00,$00,$30,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$3c,$00,$00,$3f,$00,$00,$eb,$00,$00,$ef,$00,$00,$3c,$00,$00
        .byte $0c,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$0c,$00,$00,$3f,$00,$00,$3b,$00,$00,$3c,$00,$00,$0c,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_4f4e:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0f,$ff,$00,$35,$55
        .byte $ff,$37,$7f,$f5,$dd,$ff,$fc,$d5,$fa,$bc,$d7,$ff,$ad,$f5,$eb,$ef
        .byte $ff,$eb,$bd,$d5,$ff,$af,$dd,$ea,$ad,$dd,$fa,$fc,$dd,$ff,$f0,$37
        .byte $55,$ff,$3d,$57,$d5,$0f,$ff,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$0f,$ff,$00,$3d,$57,$ff,$37,$fd,$d5,$f7,$d5
        .byte $70,$df,$7f,$fc,$dd,$fa,$bc,$dd,$ea,$ec,$d5,$ff,$ad,$ff,$eb,$af
        .byte $d5,$eb,$fd,$ff,$eb,$af,$d5,$ff,$ad,$dd,$ea,$ec,$dd,$fa,$bc,$df
        .byte $7f,$fc,$f7,$d5,$70,$37,$fd,$ff,$3d,$57,$d5,$0f,$ff,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0f,$ff,$00,$3d,$57
        .byte $ff,$37,$55,$f5,$dd,$ff,$f0,$dd,$fa,$fc,$dd,$ea,$ad,$d5,$ff,$af
        .byte $ff,$eb,$bd,$f5,$eb,$ef,$d7,$ff,$ad,$d5,$fa,$bc,$dd,$ff,$fc,$37
        .byte $7f,$ff,$35,$55,$d5,$0f,$ff,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$0f,$ff,$00,$3d,$57,$ff,$37,$d5,$f5,$df,$7f,$fc,$dd,$fa,$bd
        .byte $d5,$ea,$ef,$ff,$ff,$ad,$fd,$eb,$ac,$f7,$ff,$ff,$dd,$57,$d5,$3f
        .byte $ff,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$3f,$ff,$00,$f5,$57,$ff,$df,$d5,$f5,$df,$7f,$fc
        .byte $dd,$fa,$bf,$d5,$ea,$ec,$ff,$ff,$af,$fd,$eb,$bd,$37,$ff,$c0,$10
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$ff,$ff,$3e,$55,$55
        .byte $ff,$ff,$fc,$df,$7e,$ac,$dd,$fa,$b0,$d5,$ff,$c0,$3f,$c0,$00,$3f
        .byte $00,$00,$3c,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$3f,$fc,$00,$ff,$95,$54,$ff,$ff,$f0
        .byte $ff,$ff,$fc,$fe,$ff,$ff,$fe,$55,$55,$3f,$eb,$00,$3f,$fc,$00,$30
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$0f,$bf,$fc,$3f,$d5,$54,$3f,$ff,$f0,$f5,$55,$74
        .byte $ff,$ff,$fc,$d5,$55,$5d,$ff,$ff,$fc,$fe,$ff,$ff,$fe,$55,$55,$3f
        .byte $fc,$00,$0c,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$3e,$ff,$fc,$3e,$55,$54,$ff,$ff,$f0,$d5,$55,$fc,$d5,$55,$5d
        .byte $ff,$ff,$ff,$ff,$ff,$ff,$d5,$55,$5d,$f7,$ff,$7c

        sbc $55,x
        beq $522d

        .byte $ff,$f0,$3e,$ff,$ff,$3e,$55,$55,$0f,$fc,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$0f,$ff,$00,$3e,$ff,$ff,$3e,$55,$55,$ff,$ff

    L_524e:
        .byte $f0,$d5,$57,$fc,$df,$fd,$fc,$df,$ff,$7c,$d5,$55,$5d,$ff,$ff,$ff
        .byte $ff,$ff,$fd,$ff,$ff,$ff,$d5,$55,$5d,$df,$ff,$7c,$df,$fd,$fc,$d5
        .byte $57,$fc,$ff,$ff,$f0,$3e,$ff,$ff,$3e,$55,$55,$0f,$ff,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$0f,$ff,$00,$3e,$ff,$ff,$3e,$55
        .byte $55,$ff,$ff,$f0,$f5,$55,$f0,$f7,$ff,$7c,$d5,$55,$5d,$ff,$ff,$ff
        .byte $ff,$ff,$ff,$d5,$55,$5d,$d5,$55,$fc,$ff,$ff,$f0,$3f,$bf,$fc,$3f
        .byte $95,$54,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0c,$00
        .byte $00,$3f,$ff,$00,$fe,$ff,$ff,$fe,$55,$55,$ff,$ff,$fc,$d5,$55,$5d
        .byte $ff,$ff,$fc,$f5,$55,$74,$3f,$ff,$f0,$3f,$ff,$fc,$0f,$95,$54,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$30,$00,$00,$3f,$fc,$00,$3f,$eb,$00,$fe,$ff,$ff,$fe,$55,$55
        .byte $ff,$ff,$fc,$ff,$ff,$f0,$ff,$95,$54,$3f,$fc,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3c,$00
        .byte $00,$3f,$00,$00,$3f,$c0,$00,$d5,$ff,$c0,$dd,$fa,$b0,$df,$7e,$ac
        .byte $ff,$ff,$fc,$3e,$ff,$ff,$02,$55,$55,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$10,$00,$00,$37,$ff,$c0,$fd,$eb,$bf,$ff,$ff,$ad,$d5,$ea,$ec
        .byte $dd,$fa,$bf,$dd,$7f,$fc,$df,$d5,$ff,$f5,$57,$d5,$3f,$ff,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$3f,$ff,$00,$dd,$7f,$ff,$f7,$ff,$f5,$fd,$eb,$ac,$ff,$ff,$ad
        .byte $d5,$ea,$ef,$dd,$fa,$bd,$df,$7f,$fc,$37,$55,$ff,$3d,$57,$d5,$0f
        .byte $ff,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$3f,$ff,$bc,$15,$55,$bc,$0f,$ff,$ff,$3f,$55,$57,$75,$55,$57
        .byte $ff,$ff,$ff,$ff,$ff,$ff,$75,$55,$57,$3d,$ff,$df,$0f,$55,$5f,$0f
        .byte $ff,$ff,$ff,$ff

        ldy L_554e + $7,x
        ldy $ff00,x
        beq L_543a

    L_543a:
         .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$ff,$f0,$ff,$ff,$bc,$55
        .byte $55,$bc,$0f,$ff,$ff,$3f,$d5,$57,$3f,$7f,$f7,$3d,$ff,$f7,$75,$55
        .byte $57,$ff,$ff,$ff,$7f,$ff,$ff,$ff,$ff,$ff,$75,$55,$57,$3d,$ff,$f7
        .byte $3f,$7f,$f7,$3f,$d5,$57,$0f,$ff,$ff,$ff,$ff

        ldy L_554e + $7,x
        ldy $ff00,x
        beq L_547d

    L_547d:
         .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$ff,$f0,$ff,$ff,$bc,$55
        .byte $55,$bc,$0f,$ff,$ff,$0f,$55,$5f,$3d,$ff,$df,$75,$55,$57,$ff,$ff
        .byte $ff,$ff,$ff,$ff,$75,$55,$57,$3f,$55,$57,$0f,$ff,$ff,$3f,$ff,$bc
        .byte $15,$55,$bc,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$30,$00,$ff,$fc,$ff,$ff,$bf,$55,$55,$bf,$3f,$ff,$ff,$75,$55
        .byte $57,$3f,$ff,$ff,$1d,$55,$5f,$0f,$ff,$fc,$3f,$ff,$fc

        ora $56,x
        beq L_54ee

    L_54ee:
         .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$0c,$00,$3f,$fc,$00,$eb,$fc,$ff,$ff,$bf,$55,$55,$bf
        .byte $3f,$ff,$ff,$0f,$ff,$ff,$15,$56,$ff,$00,$3f,$fc,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_553e:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_554e:
        .byte $3c,$00,$00,$fc,$00,$03,$fc,$03,$ff,$57,$0e,$af,$77,$3a,$bd,$f7
        .byte $3f,$ff,$ff,$ff,$ff,$bc,$55,$55,$80,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$04,$03,$ff,$dc,$fe,$eb,$7f,$7a,$ff,$ff,$3b,$ab,$57
        .byte $fe,$af,$77,$3f,$fd,$f7,$ff,$57,$f7,$57,$d5,$5f,$00,$ff,$fc,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_55ce:
        .byte $00,$00,$ff,$fc,$ff,$d5,$77,$5f,$ff,$df,$3a,$eb,$7f,$7a,$ff,$ff
        .byte $fb,$ab,$57,$7e,$af,$77,$3f,$fd,$f7,$ff,$57,$dc,$57,$d5,$7c,$00
        .byte $ff,$f0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$ff,$f0,$ff,$55
        .byte $5c,$5f,$fd,$dc,$3f,$ff,$77,$3e,$af,$57,$7a,$ff,$d7,$fb,$eb,$5f
        .byte $7e,$eb,$ff,$fa,$ff,$57,$7a,$ab,$77,$3f,$af,$77,$0f,$ff,$77,$ff
        .byte $55,$dc,$57,$d5,$7c,$00,$ff,$f0,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$ff,$f0,$ff,$d5,$7c,$57,$7f,$dc,$0d,$57
        .byte $df,$3f,$fd,$f7,$3e,$af,$77,$3b,$ab,$77,$7a,$ff,$57,$fa,$eb,$ff
        .byte $7f,$eb,$57,$fa,$eb,$ff,$7a,$ff,$57,$3b,$ab,$77,$3e,$af,$77,$3f
        .byte $fd,$f7,$0d,$57,$df,$ff,$7f,$dc,$57,$d5,$7c,$00,$ff,$f0,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$ff,$f0,$ff,$d5

    L_568e:
        .byte $7c,$5f,$55,$dc,$0f,$ff,$77,$3f,$af,$77,$7a,$ab,$77,$fa,$ff,$57
        .byte $7e,$eb,$ff,$fb,$eb,$5f,$7a,$ff,$d7,$3e,$af,$57,$3f,$ff,$77,$ff
        .byte $fd,$dc,$57,$55,$5c,$00,$ff,$f0,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$ff,$f0,$ff,$d5,$7c,$5f,$57,$dc,$3f,$fd,$f7,$7e,$af,$77
        .byte $fb,$ab,$57,$7a,$ff,$ff,$3a,$eb,$7f,$ff,$ff,$df,$5f,$d5,$77,$00
        .byte $ff,$fc,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$ff,$fc,$ff,$d5,$5f,$5f,$57,$f7,$0f,$fd,$f7

    L_571e:
        .byte $fe,$af,$77,$3b,$ab,$57,$fa,$ff,$ff,$5e,$eb,$7f,$03,$ff,$dc,$00
        .byte $00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$ff,$ff,$80,$55,$55,$bc
        .byte $3f,$ff,$ff,$3a,$bd,$f7,$0e,$af,$77,$03,$ff,$57,$00,$03,$fc,$00
        .byte $00,$fc,$00,$00,$3c,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$3f,$fc,$15,$56,$ff,$0f,$ff,$ff
        .byte $3f,$ff,$ff,$ff,$ff,$bf,$55,$55,$bf,$00,$eb,$fc,$00,$3f,$fc,$00
        .byte $00,$0c,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00

        ora $56,x
        beq L_5806 + $f

        .byte $ff,$fc,$0f,$ff,$fc,$1d,$55,$5f,$3f,$ff,$ff,$75,$55,$57,$3f,$ff
        .byte $ff,$ff,$ff,$bf,$55,$55,$bf,$00,$3f,$fc,$00,$00,$30,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$ff,$00

    L_5806:
        .byte $03,$5f,$fc,$0f,$77,$d4,$0d,$d5,$c0,$3d,$7f,$f0,$35,$fa,$f0,$35
        .byte $ea,$f0,$35,$fe,$b4,$3f,$ee,$bc,$35,$ef,$f4,$3f

        inc L_35ad + $f
        inc L_35ad + $7,x
        nop 
        beq L_585b + $5

        .byte $fa,$f0,$3d,$7f,$f0,$0d,$d5,$c0,$0f,$77,$fc,$03,$57,$d4,$00,$ff
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$f0,$00,$03,$ff,$c0,$03,$5d
        .byte $40,$0d,$dc,$00,$0d,$7f,$00,$0d,$fe,$c0,$0d,$ea,$c0,$0d,$fe,$d0

    L_585b:
        .byte $3f,$ee,$f0,$15,$ef,$d0,$3f,$ee,$f0,$0d,$fe,$d0,$0d,$ea,$c0,$0d
        .byte $fe,$c0,$0d,$7f,$00,$0d,$dc,$00,$03,$5f,$c0,$03,$fd,$40,$00,$f0
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$f0,$00,$00,$ff,$00,$03,$5d
        .byte $00,$03,$5c,$00,$01,$7c,$00,$01,$fb,$00,$01,$eb,$00,$03,$fb

        rti 

        .byte $3f,$eb,$c0,$15,$ef

        rti 

        .byte $3f,$eb,$c0,$03,$fb,$40,$01,$eb,$00,$01,$fb,$00,$01,$7c,$00,$03
        .byte $5c,$00,$03,$5f,$00,$00,$fd,$00,$00,$f0,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$30,$00,$00,$3c,$00,$00,$f4,$00,$00,$f0,$00,$03,$70
        .byte $00,$01,$70,$00,$03,$f0,$00,$03,$b4,$00,$3e,$bc,$00,$17,$f4,$00
        .byte $3e,$bc,$00,$03,$b4,$00,$03,$f0,$00,$01,$70,$00,$03,$70,$00,$00
        .byte $f0,$00,$00,$fc,$00,$00,$34,$00,$00,$30,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$3c,$00,$00,$fc,$00,$00,$5f,$00,$00,$3f,$00,$00,$3f
        .byte $00,$00,$3d,$00,$00,$fd,$00,$00,$dd,$00,$00,$ff,$00,$00,$df,$00

    L_5921:
        .byte $00,$ff,$00,$00,$dd,$00,$00,$fd,$00,$00,$3d,$00,$00,$3f,$00,$00
        .byte $3f,$00,$00,$ff,$00,$00,$5c,$00,$00,$3c,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$3c,$00,$0f,$fb,$00,$05,$5b,$00,$00,$3f,$c0,$00,$f5
        .byte $c0,$00,$f5,$c0,$00,$dd,$c0,$01,$d5,$c0,$03,$ff,$c0,$01,$ff,$c0
        .byte $03,$ff,$c0,$01,$d5,$c0,$00,$dd,$c0,$00,$f5,$c0,$00,$f5,$c0,$00
        .byte $3f,$c0,$0f,$fb,$00,$05,$5b,$00,$00,$3c,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$3f,$c0,$3f,$fe,$f0,$15,$56,$f0,$00,$ff,$fc,$00,$fd
        .byte $5c,$03,$f7,$dc,$03,$df,$dc,$07,$55,$5c,$0f,$ff,$fc,$07,$ff,$fc
        .byte $0f,$ff,$fc,$07,$55,$5c,$03,$df,$dc,$03,$f7,$dc,$00,$fd,$5c,$00
        .byte $ff,$fc,$3f,$fe,$f0,$15,$56,$f0,$00,$3f,$c0,$00,$00,$00,$00,$00
        .byte $00,$00,$03,$fc,$00,$0f,$bf,$fc,$0f,$95,$54,$3f,$ff,$00,$35,$7f
        .byte $00,$37,$df,$c0,$37,$f7,$c0,$35,$55,$d0,$3f,$ff,$f0,$3f,$ff,$d0
        .byte $3f,$ff,$f0,$35,$55,$d0,$37,$f7,$c0,$37,$df,$c0,$35,$7f,$00,$3f
        .byte $ff,$00,$0f,$bf,$fc,$0f,$95,$54,$03,$fc,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$3c,$00,$00,$ef,$f0,$00,$e5,$50,$03,$fc,$00,$03,$5f
        .byte $00,$03,$5f,$00,$03,$77,$00,$03,$57

        rti 

        .byte $03,$ff,$c0,$03,$ff

        rti 

        .byte $03,$ff,$c0,$03,$57

        rti 

        .byte $03,$77,$00,$03,$5f,$00,$03,$5f,$00,$03,$fc,$00,$00,$ef,$f0,$00
        .byte $e5,$50,$00,$3c,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3c,$00,$00
        .byte $3f,$00,$00,$f5,$00,$00,$fc,$00,$00,$fc,$00,$00,$7c,$00,$00,$7f
        .byte $00,$00,$77,$00,$00,$ff,$00,$00,$f7,$00,$00,$ff,$00,$00,$77,$00
        .byte $00,$7f,$00,$00,$7c,$00,$00,$fc,$00,$00,$fc,$00,$00,$ff,$00,$00
        .byte $35,$00,$00,$3c,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0c,$00,$00
        .byte $3c,$00,$00,$1f,$00,$00,$0f,$00,$00,$0d,$c0,$00,$0d,$40,$00,$0f
        .byte $c0,$00,$1e,$c0,$00,$3e,$bc,$00,$1f,$d4,$00,$3e,$bc,$00,$1e,$c0
        .byte $00,$0f,$c0,$00,$0d,$40,$00,$0d,$c0,$00,$0f,$00,$00,$3f,$00,$00
        .byte $1c,$00,$00,$0c,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0f,$00,$00
        .byte $ff,$00,$00,$75,$c0,$00,$35,$c0,$00,$3d,$40,$00,$ef

        rti 

        .byte $00,$eb,$40,$01,$ef,$c0,$03,$eb,$fc,$01,$fb,$54,$03,$eb,$fc,$01
        .byte $ef,$c0,$00,$eb

        rti 

        .byte $00,$ef

        rti 

        .byte $00,$3d,$40,$00,$35,$c0,$00,$f5,$c0,$00,$7f,$00,$00,$0f,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$0f,$00,$03,$ff,$c0,$01,$75,$c0,$00
        .byte $37,$70,$00,$fd,$70,$03,$bf,$70,$03,$ab,$70,$07,$bf,$70,$0f,$bb
        .byte $fc,$07,$fb,$54,$0f,$bb,$fc,$07,$bf,$70,$03,$ab,$70,$03,$bf,$70
        .byte $00,$fd,$70,$00,$37,$70,$03,$f5,$c0,$01,$7f,$c0,$00,$0f,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$ff,$00,$3f,$f5,$c0,$17,$dd,$f0,$03
        .byte $57,$70,$0f,$fd,$7c,$0f,$af,$5c,$0f,$ab,$5c,$1e,$bf,$5c,$3e,$bb
        .byte $fc,$1f,$fb,$5c,$3e,$bb,$fc,$1e,$bf,$5c,$0f,$ab,$5c,$0f,$af,$5c
        .byte $0f,$fd,$7c,$03,$57,$70,$3f,$dd,$f0,$17,$d5,$c0,$00,$ff,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_5bfd:
        .byte $00,$00,$00,$00,$00,$2e,$3b,$2e,$3b,$2e,$3b,$00,$00,$ee,$bb,$ee
        .byte $bb,$ee,$bb,$00,$02,$ee,$ba,$ee,$ba,$ee,$ba,$2e,$3b,$2e,$3b,$2e
        .byte $3b,$2e,$3b,$ee,$bb,$ee,$bb,$ee,$bb,$ee,$bb,$ee,$ba,$ee,$ba,$ee
        .byte $ba,$ee,$ba,$2e,$3b,$2e,$3b,$2e,$3b,$2a,$aa,$ee,$bb,$ee,$bb,$ee
        .byte $bb,$aa,$aa,$ee,$ba,$ee,$ba,$ee,$ba,$aa,$aa,$05,$00,$0a,$4a,$4a
        .byte $49,$49,$49,$52,$02,$9a,$49,$89,$89,$49,$4a,$49,$49,$49,$49,$49
        .byte $04,$2a,$a5,$4a,$4a,$4a,$4a,$4a,$0a,$aa,$52,$55,$55,$d6,$bb,$6d
        .byte $79,$6d,$79,$6d,$79,$41,$16,$16,$6a,$6e,$79,$6d,$79,$6d,$79,$ee
        .byte $97,$55,$55,$55,$40,$4a,$49,$49,$49,$49,$44,$55,$05,$99,$49,$49

    L_5c8d:
        .byte $49,$49,$09,$4a,$49,$49,$49,$49,$44,$5a,$55,$99,$49,$49,$49,$49

    L_5c9d:
        .byte $09,$a9,$55,$55,$01,$41,$04,$c5,$45,$45,$45,$55,$11,$55,$00,$3f
        .byte $4a,$51,$54,$55,$11,$55,$05,$f9,$a9,$55,$55,$45,$40,$15,$00,$aa
        .byte $6a,$5a,$45,$55,$00,$55,$15,$a5,$aa,$aa,$56,$15,$05,$51,$74,$5a
        .byte $aa,$a9,$a5,$45,$45,$05,$c6,$4a,$6a,$11,$55,$5a,$6a,$90,$ff,$aa
        .byte $55,$11,$55,$95,$55,$05,$f9,$a9,$55,$11,$55,$00,$02,$16,$16,$16
        .byte $16,$2a,$aa,$55,$55,$69,$bc,$bc,$41,$55,$55,$55,$41,$16,$16,$16
        .byte $16,$69,$55,$00,$55,$55,$aa,$ff,$3f,$4d,$51,$1a,$6e,$bf,$ff,$00
        .byte $55,$55,$aa,$94,$a5,$69,$7e,$ff,$00,$55,$55,$55,$55,$aa,$ff,$bf
        .byte $9c,$d1,$c6,$00,$55,$55,$52,$94,$a5,$a9,$7e,$ff,$bc,$51,$46,$14
        .byte $55,$55,$aa,$ff,$3f,$4e,$52,$94,$00,$55,$55,$55,$55,$aa,$c6,$1b
        .byte $6f,$bf,$ff,$a4,$a9,$a9,$aa,$a8,$a9,$a9,$be,$ff,$bc,$a9,$a6,$a8
        .byte $a9,$a9,$aa,$ff,$bf,$ae,$a2,$a4,$a0,$a5,$a5,$e5,$a5,$aa,$e6,$ab
        .byte $af,$bf,$ff,$00,$00,$15,$15,$15,$15,$2a,$aa,$00,$00,$55,$55,$55
        .byte $55,$aa,$aa,$00,$02,$56,$56,$56,$56,$aa,$aa,$a5,$a5,$a5,$a5,$a5
        .byte $a5,$a5,$a5,$b3,$b7,$8c,$9d,$b3,$b7,$80,$00,$b3,$b7,$8c,$9d,$b3
        .byte $b7,$8c,$9d,$aa,$aa,$8c,$9d,$b3,$b7,$8c,$9d,$33,$77,$cc,$dd,$33
        .byte $77,$00,$00,$33,$77,$cc,$dd,$33,$77,$cc,$dd,$aa,$aa,$cc,$dd,$33
        .byte $77,$cc,$dd,$30,$74,$cc,$dc,$30,$74,$00,$00,$30,$74,$cc,$dc,$30
        .byte $74,$cc,$dc,$aa,$a8,$cc,$dc,$30,$74

        cpy L_55ce + $e
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        ror 
        jmp (L_6c63 + $9)
        jmp (L_553e + $2)

        .byte $00,$02,$16,$16,$16,$16,$2a,$aa,$aa,$a8,$94,$94,$94,$94,$80,$00
        .byte $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$41,$4a,$4a,$6a,$5a,$55
        .byte $55,$55,$55,$15,$65,$a9,$6a,$5a,$00,$00,$15,$15,$15,$15,$15,$15
        .byte $14,$14,$69,$69,$69,$69,$96,$96,$00,$02,$56,$56,$56,$56,$56,$56
        .byte $16,$16,$69,$69,$69,$69,$16,$16,$55,$55,$69,$69,$69,$69,$55,$55
        .byte $96,$96,$6a,$6a,$6a,$6a,$96,$96,$15,$15,$15,$15,$15,$15,$2a,$aa
        .byte $96,$96,$69,$69,$69,$69,$aa,$aa,$56,$56,$56,$56,$56,$56,$aa,$aa
        .byte $55,$95,$a5,$a9,$aa,$aa,$aa,$aa,$55,$55,$55,$55,$55,$95,$a5,$a9

    L_5e58:
        .byte $6a,$5a,$56,$55,$55,$55,$55,$55,$aa,$aa,$aa,$aa,$6a,$5a,$56,$55
        .byte $aa,$aa,$aa,$aa,$aa,$aa,$a9,$a5,$a9,$a9,$aa,$aa,$aa,$aa,$aa,$aa
        .byte $6a,$5a,$56,$55,$55,$55,$aa,$aa,$aa,$aa,$aa,$aa,$6a,$5a,$aa,$aa
        .byte $00,$40,$a5,$a9,$aa,$aa,$aa,$aa,$00,$00,$55,$55,$55,$95,$a5,$a9
        .byte $55,$55,$54,$50,$40,$40,$41,$41,$55,$00,$00,$01,$15,$55,$55,$55
        .byte $55,$55,$55,$55,$55,$59,$69,$69,$41,$41,$41,$41,$41,$41,$41,$41
        .byte $55,$aa,$bc,$bc,$bc,$bc,$00,$55,$69,$69,$69,$69,$69,$69,$69,$69
        .byte $41,$41,$45,$55,$55,$55,$55,$55,$55,$55,$55,$56,$6a,$aa,$aa,$55
        .byte $69,$69,$a9,$a9,$a5,$95,$55,$55,$00,$15,$15,$15,$15,$15,$15,$aa
        .byte $00,$55,$55,$55,$55,$55,$55,$aa,$00,$56,$56,$56,$56,$56,$56,$aa
        .byte $00,$16,$16,$16,$16,$16,$16,$16,$16,$16,$16,$16,$16,$16,$16,$16
        .byte $16,$16,$16,$16,$16,$16,$16,$aa,$16,$55,$55,$55,$55,$55,$55,$16
        .byte $16,$56,$56,$56,$56,$56,$56,$aa,$14,$15,$15,$15,$15,$15,$15,$aa
        .byte $00,$15,$15,$15,$15,$15,$15,$16,$00,$56,$56,$56,$56,$56,$56,$16
        .byte $16,$56,$56,$56,$56,$56,$56,$16,$16,$55,$55,$55,$55,$55,$55,$aa
        .byte $16,$15,$15,$15,$15,$15,$15,$16,$00,$55,$55,$55,$55,$55,$55,$16

    L_5f58:
        .byte $00,$16,$16,$16,$16,$16,$16,$aa,$69,$5a,$56,$55,$55,$55,$55,$55
        .byte $56,$56,$96,$a6,$6a,$5a,$56,$55,$96,$96,$a6,$aa,$9a,$96,$aa,$aa
        .byte $95,$95,$95,$95,$95,$95,$95,$95,$aa,$96,$96,$96,$96,$96,$96,$96
        .byte $95,$95,$95,$95,$95,$95,$95,$95,$55,$95,$95,$a5,$65,$69,$59,$aa
        .byte $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$95,$a5,$a9
        .byte $6a,$5a,$56,$55,$55,$55,$55,$55,$69,$a9,$a9,$a9,$6a,$6a,$6a,$69
        .byte $55,$55,$96,$aa,$69,$69,$69,$69,$69,$69,$69,$69,$aa,$96,$55,$55
        .byte $51,$19,$95,$51,$48,$66,$54,$56,$55,$54,$46,$65,$15,$91,$58,$56
        .byte $13,$98,$5a,$45,$21,$89,$64,$5e,$53,$18,$86,$61,$18,$92,$48,$6e
        .byte $ff,$cf,$ec,$3e,$8f,$23,$bb,$ff,$cf,$2f,$bc,$ce,$ef,$f3,$3b,$bf
        .byte $2a,$1a,$16,$15,$15,$15,$15,$15,$00,$00,$2e,$3b,$3b,$3b,$2e,$3b
        .byte $00,$00,$ee,$bb,$bb,$bb,$ee,$bb,$00,$02,$ee,$ba,$ba,$ba,$ee,$ba
        .byte $3b,$3b,$2e,$3b,$3b,$3b,$2e,$3b,$bb,$bb,$ee,$bb,$bb,$bb,$ee,$bb
        .byte $ba,$ba,$ee,$ba,$ba,$ba,$ee,$ba,$3b,$3b,$2e,$3b,$3b,$3b,$2a,$aa
        .byte $bb,$bb,$ee,$bb,$bb,$bb

        tax 
        tax 
        tsx 
        tsx 
        inc L_baba
        tsx 
        tax 
        tax 
        ora $29
        tax 
        ror L_5f58 + $1,x
        lsr $57,x
        bvc L_60a2 + $2

        .byte $5a,$99,$bd,$69,$fa,$d6,$57,$56,$5f,$59,$7d,$05,$25,$a5,$95,$f5
        .byte $65,$7d,$59,$50,$52,$5a,$55,$55,$01,$39,$39,$39,$39,$39,$39,$39
        .byte $39,$3a,$3a,$3a,$39,$39,$39,$39,$39,$39,$39,$a9,$55,$55,$55,$55
        .byte $55,$55,$45,$51,$54,$51,$55,$55,$55,$55,$51,$4a,$16,$6a,$51,$52
        .byte $49,$6a,$5a,$55,$55,$55,$69,$85,$a1,$9a,$56,$55,$55,$55,$55,$11

    L_60a2:
        .byte $40,$45,$05,$c5,$45,$45,$55,$11,$15,$65,$64,$6f,$6a,$69,$55,$11
        .byte $55,$55,$01,$fe,$aa,$15,$45,$80,$15,$80,$2a,$aa,$5a,$45,$69,$00
        .byte $55,$15,$a5,$aa,$aa,$69,$25,$05,$51,$54,$5a,$aa,$a9,$29,$45,$05
        .byte $c5,$45,$6a,$5a,$11,$55,$69,$64,$6f,$6a,$a5,$95,$11,$55,$65,$01
        .byte $fe,$aa,$55,$55,$11,$55,$00,$02,$16,$16,$16,$16,$2a,$aa,$55,$55
        .byte $69,$bc,$bc,$41,$55,$55,$55,$41,$16,$16,$16,$16,$69,$55,$03,$02
        .byte $56,$02,$56,$5a,$5a,$5a,$fa,$fa,$fa,$fa,$fa,$f9,$fe,$fe,$5a,$5a
        .byte $5a,$55,$59,$69,$6a,$6a,$6a,$54,$69,$a5,$aa,$fa,$fa,$fa,$fc,$fc
        .byte $fc,$fc,$f0,$f1,$f1,$f1,$15,$55,$15,$57,$ab,$57,$ab,$ab,$f1,$f1
        .byte $f1,$01,$51,$45,$85,$85,$85,$45,$45,$15,$15,$15,$15,$15,$fc,$fc
        .byte $fd,$fc,$f8,$f9,$f9,$f9,$a9,$a9,$a9,$ab,$ab,$ab,$ab,$ab,$f9,$f9
        .byte $f9,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$00,$00
        .byte $15,$1a,$10,$15,$2a,$aa,$00,$00,$55,$aa,$00,$55,$aa,$aa,$00,$02
        .byte $56,$a6,$06,$56,$aa,$aa,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$b0,$b5
        .byte $b5,$ba,$8f,$9f,$80,$00,$b0,$b5,$b5,$ba,$8f,$9f,$9f,$af,$aa,$aa
        .byte $ba,$ba,$8f,$9f,$9f,$af,$f0,$f5,$f5,$fa,$0f,$5f,$00,$00,$f0,$f5
        .byte $f5,$fa,$0f,$5f,$5f,$af,$aa,$aa,$fa,$fa,$0f,$5f,$5f,$af,$c0,$d4
        .byte $d4,$e8,$0c,$5c,$00,$00,$f0,$f4,$f4,$f8,$0c,$5c,$5c,$ac,$aa,$a8
        .byte $f8,$f8,$0c,$5c,$5c,$ac,$85,$85,$05,$45,$45,$85,$85,$85,$6a,$6a
        .byte $54,$69,$65,$6a,$6a,$6a,$55,$55,$55,$55,$55,$55,$55,$55,$88,$16
        .byte $94,$16,$94,$16,$94,$22,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55
        .byte $41,$4a,$4a,$6a,$5a,$55,$55,$55,$55,$15,$65,$a9,$6a,$5a,$00,$00
        .byte $15,$15,$14,$15,$16,$15,$00,$00,$55,$55,$00,$55,$aa,$a5,$00,$02
        .byte $56,$56,$16,$66,$aa,$5a,$15,$15,$15,$15,$15,$15,$15,$15,$6a,$5a
        .byte $55,$55,$55,$55,$55,$55,$aa,$aa,$56,$56,$56,$56,$56,$56,$15,$14
        .byte $15,$16,$15,$15,$2a,$aa,$55,$00,$55,$aa,$a5,$6a,$aa,$aa,$56,$16
        .byte $66,$aa,$5a,$aa,$aa,$aa,$55,$95,$a5,$a9,$aa,$aa,$aa,$aa,$55,$55
        .byte $55,$55,$55,$95,$a5,$a9,$6a,$5a,$56,$55,$55,$55,$55,$55,$aa,$aa
        .byte $aa,$aa,$6a,$5a,$56,$55,$aa,$aa,$aa,$aa,$aa,$aa,$a9,$a5,$a9,$a9
        .byte $aa,$aa,$aa,$aa,$aa,$aa,$6a,$5a,$56,$55,$55,$55,$aa,$aa,$aa,$aa
        .byte $aa,$aa,$6a,$5a,$aa,$aa,$00,$40,$a5,$a9,$aa,$aa,$aa,$aa,$00,$00
        .byte $55,$55,$55,$95,$a5,$a9,$55,$40,$40,$40,$41,$41,$41,$41,$55,$00
        .byte $00,$00,$55,$55,$aa,$bc,$55,$01,$09,$29,$69,$69,$69,$69,$41,$41
        .byte $41,$41,$41,$41,$41,$41,$bc,$bc,$bc,$bc,$bc,$bc,$bc,$bc,$69,$69
        .byte $69,$69,$69,$69,$69,$69,$41,$41,$41,$41,$42,$4a,$6a,$55,$bc,$00
        .byte $55,$55,$aa,$aa,$aa,$55,$69,$69,$69,$69,$a9,$a9,$a9,$55,$55,$55
        .byte $05,$10,$1a,$a5,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55
        .byte $50,$06,$a6,$5a,$55,$55,$00,$16,$16,$16,$49,$49,$49,$49,$49,$49
        .byte $49,$49,$49,$49,$49,$49,$49,$49,$49,$49,$16,$16,$16,$2a,$49,$49

    L_6312:
        .byte $49,$04,$9a,$49,$49,$49,$49,$49,$49,$09,$a9,$55,$55,$55,$49,$49
        .byte $49,$44,$5a,$55,$55,$55,$55,$55,$55,$40,$4a,$49,$49,$49,$55,$55
        .byte $55,$05,$99,$49,$49,$49,$49,$49,$49,$09,$99,$49,$49,$49,$49,$49
        .byte $49,$04,$aa,$55,$55,$55,$49,$49,$49,$44,$4a,$49,$49,$49,$55,$55
        .byte $55,$00,$9a,$49,$49,$49,$55,$55,$55,$41,$69,$55,$55,$55,$69,$5a
        .byte $56,$55,$55,$55,$55,$55,$56,$55,$95,$a5,$69,$5a,$56,$55,$a9,$a9
        .byte $6a,$aa,$96,$95,$95,$95,$55,$55,$55,$95,$95,$a5,$69,$59,$95,$95
        .byte $a5,$65,$66,$6a,$5a,$99,$69,$65,$a5,$95,$95,$55,$55,$55,$55,$95
        .byte $a5,$69,$5a,$56,$55,$95,$55,$55,$55,$55,$55,$95,$a5,$69,$55,$55
        .byte $55,$55,$95,$a5,$a9,$6a,$5a,$56,$55,$55,$55,$55,$55,$55,$aa,$aa
        .byte $aa,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a
        .byte $6a,$55,$55,$55,$55,$55,$54,$56,$51,$19,$95,$51,$48,$66,$15,$91
        .byte $58,$56,$55,$55,$44,$66,$47,$21,$89,$64,$56,$11,$98,$5a,$84,$62
        .byte $19,$91,$48,$66,$52,$1b,$ff,$cf,$ec,$3e,$8f,$23,$bb,$ff,$cf,$2f
        .byte $bc,$ce,$ef,$f3,$3b,$bf,$2a,$1a,$16,$15,$15,$15,$15,$15,$00,$00
        .byte $2e,$2e,$3b,$3b,$2e,$2e,$00,$00,$ee,$ee,$bb,$bb,$ee,$ee,$00,$02
        .byte $ee,$ee,$ba,$ba,$ee,$ee,$3b,$3b,$2e,$2e,$3b,$3b,$2e,$2e,$bb,$bb
        .byte $ee,$ee,$bb,$bb,$ee,$ee,$ba,$ba,$ee,$ee,$ba,$ba,$ee,$ee,$3b,$3b
        .byte $2e,$2e,$3b,$3b,$2a,$aa,$bb,$bb,$ee,$ee,$bb,$bb,$aa,$aa,$ba,$ba
        .byte $ee,$ee,$ba,$ba,$aa,$aa,$05,$3a,$3a,$39,$b9,$6e,$5b,$54,$41,$4e

    L_6452:
        .byte $8e,$8e,$4e,$3a,$e6,$95,$54,$53,$4e,$39,$39,$39,$39,$69,$a5,$c9
        .byte $72,$4e,$4e,$4e,$4e,$5a,$55,$55,$41,$39,$4e,$39,$4e,$39,$4e,$39
        .byte $4e,$3a,$4e,$3a,$4e,$39,$4e,$39,$4e,$39,$4e,$a9,$55,$55,$55,$55
        .byte $54,$54,$54,$50,$41,$06,$55,$55,$95,$95,$55,$65,$59,$96,$14,$45
        .byte $51,$55,$54,$54,$55,$55,$1a,$69,$a5,$95,$95,$95,$55,$55,$55,$00
        .byte $c4,$45,$45,$45,$40,$15,$55,$01,$fe,$2a,$45,$51,$00,$55,$55,$11
        .byte $55,$55,$55,$55,$15,$65,$95,$15,$40,$45,$6a,$2a,$a9,$25,$55,$55
        .byte $54,$94,$a4,$95,$55,$55,$65,$01,$56,$56,$56,$aa,$6a,$69,$6a,$5a
        .byte $45,$45,$06,$eb,$2a,$55,$aa,$aa,$69,$a5,$01,$fe,$aa,$55,$a9,$a9
        .byte $55,$55,$55,$55,$11,$55,$00,$02,$16,$16,$16,$16,$2a,$aa,$55,$55
        .byte $41,$16,$16,$69,$55,$55,$55,$69,$bc,$80,$a8,$bc,$41,$55,$00,$15
        .byte $15,$9a,$03,$5b,$5b,$ab,$00,$56,$56,$aa,$c0,$c5,$c5,$ea,$10,$15
        .byte $15,$aa,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$c0,$c5,$c5,$ea,$03,$5b
        .byte $5b,$9b,$00,$15,$15,$aa,$c0,$c5,$c5,$ea,$06,$56,$56,$aa,$1b,$5b
        .byte $5b,$ab,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$00,$56,$56,$a6,$57,$ab
        .byte $ab,$ab,$54,$69,$69,$aa,$d4,$d9,$d9,$ea,$5a,$aa,$aa,$aa,$6b,$ab
        .byte $ab,$ab,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$54,$aa,$aa,$aa,$00,$00
        .byte $15,$10,$1a,$15,$2a,$aa,$00,$00,$55,$00,$aa,$55,$aa,$aa,$00,$02
        .byte $56,$06,$a6,$56,$aa,$aa,$ff,$7f,$9c,$e5,$d8,$6e,$bf,$ff,$a5,$aa
        .byte $bc,$bc,$bc,$bc,$80,$00,$a5,$aa,$bd,$bc,$bc,$bc,$90,$a5,$aa,$aa
        .byte $bd,$bd,$bc,$bc,$90,$a5,$55,$aa,$bd,$bc,$bc,$bc,$00,$00,$55,$aa
        .byte $bd,$bc,$bc,$bc,$00,$55,$aa,$aa,$bd,$bd,$bc,$bc,$00,$55,$54,$a8
        .byte $bc,$bc,$bc,$bc,$00,$00,$54,$a8,$bc,$bc,$bc,$bc,$00,$54,$aa,$a8
        .byte $bc,$bc,$bc,$bc,$00,$54,$ff,$3f,$8c,$e1,$c4,$1e,$7f,$ff,$ff,$3f
        .byte $4c,$d2,$c8,$2d,$bf,$ff,$55,$55,$55,$55,$55,$55,$55,$55,$96,$14
        .byte $55,$55,$55,$55,$96,$14,$88,$16,$94,$16,$94,$16,$94,$22,$55,$55
        .byte $41,$4a,$4a,$6a,$5a,$55,$55,$55,$55,$15,$65,$a9,$6a,$5a,$55,$55
        .byte $6a,$6a,$65,$65,$65,$65,$55,$55,$aa,$aa,$55,$55,$55,$55,$55,$55
        .byte $a9,$a1,$51,$51,$51,$51,$65,$65,$50,$55,$55,$6a,$65,$65,$55,$55
        .byte $00,$55,$55,$aa,$55,$55,$51,$51,$01,$55,$55,$a5,$51,$51,$65,$65
        .byte $65,$65,$60,$40,$55,$55,$55,$55,$55,$55,$00,$00,$55,$55,$51,$51
        .byte $51,$51,$01,$01,$55,$55,$55,$95,$a5,$a9,$aa,$aa,$aa,$aa,$55,$55
        .byte $55,$55,$55,$95,$a5,$a9,$6a,$5a,$56,$55,$55,$55,$55,$55,$aa,$aa
        .byte $aa,$aa,$6a,$5a,$56,$55,$aa,$aa,$aa,$aa,$aa,$aa,$a9,$a5,$a9,$a9
        .byte $aa,$aa,$aa,$aa,$aa,$aa,$6a,$5a,$56,$55,$55,$55,$aa,$aa,$aa,$aa
        .byte $aa,$aa,$6a,$5a,$aa,$aa,$00,$40,$a5,$a9,$aa,$aa,$aa,$aa,$00,$00
        .byte $55,$55,$55,$95,$a5,$a9,$55,$40,$45,$45,$05,$25,$25,$a5,$55,$14
        .byte $61,$61,$61,$61,$61,$61,$55,$01,$59,$59,$50,$52,$52,$5a,$45,$45
        .byte $45,$45,$45,$45,$45,$45,$61,$61,$61,$61,$61,$61,$61,$61,$59,$59
        .byte $59,$59,$59,$59,$59,$59,$05,$25,$25,$a5,$45,$45,$6a,$55,$61,$61
        .byte $61,$61,$61,$61,$96,$55,$50,$52,$52,$5a,$59,$59,$a9,$55,$55,$55
        .byte $05,$1a,$10,$a5,$55,$55,$55,$55,$55,$aa,$00,$55,$55,$55,$55,$55
        .byte $50,$a6,$06,$5a,$55,$55,$00,$16,$16,$16,$61,$61,$61,$61,$61,$61
        .byte $61,$61,$61,$61,$61,$61,$61,$61,$61,$61,$16,$16,$16,$2a,$61,$61
        .byte $61,$a6,$18,$61,$61,$61,$61,$61,$61,$a1,$01,$55,$55,$55,$61,$61
        .byte $61,$66,$50,$55,$55,$55,$55,$55,$55,$6a,$60,$61,$61,$61,$55,$55
        .byte $55,$a5,$11,$61,$61,$61,$61,$61,$61,$a1,$11,$61,$61,$61,$61,$61
        .byte $61,$a6,$00,$55,$55,$55,$61,$61,$61,$66,$60,$61,$61,$61,$55,$55
        .byte $55,$aa,$10,$61,$61,$61,$55,$55,$55,$69,$41,$55,$55,$55,$69,$5a
        .byte $56,$55,$55,$55,$55,$55,$5a,$56,$95,$a5,$69,$5a,$56,$55,$56,$9a
        .byte $aa,$a9,$aa,$aa,$a9,$a9,$95,$a5,$a9,$6a,$6a,$aa,$aa,$6a,$a9,$a9
        .byte $a9,$a9,$a9,$6a,$5a,$56,$6a,$6a,$6a,$6a,$6a,$a9,$a5,$95,$55,$95

    L_6792:
        .byte $a5,$69,$5a,$56,$95,$a5,$55,$55,$55,$55,$55,$95,$a5,$69,$55,$55
        .byte $55,$55,$95,$a5,$a9,$6a,$5a,$56,$55,$55,$55,$55,$55,$55,$aa,$a9
        .byte $6a,$a9,$6a,$a9,$6a,$a9,$69,$a9,$6a,$a9,$6a,$a9,$6a,$a9,$6a,$a9
        .byte $6a,$55,$55,$55,$55,$55,$54,$56,$51,$19,$95,$51,$48,$66,$15,$91
        .byte $58,$56,$55,$55,$44,$66,$47,$21,$89,$64,$56,$11,$98,$5a,$84,$62
        .byte $19,$91,$48,$66,$52,$1b,$ff,$cf,$ec,$3e,$8f,$23,$bb,$ff,$cf,$2f
        .byte $bc,$ce,$ef,$f3,$3b,$bf,$2a,$1a,$16,$15,$15,$15,$15,$15,$00,$00
        .byte $00,$00,$00,$00,$ff,$ff,$fc,$a9,$a9,$a8,$0d,$8d,$80,$0d,$8d,$80
        .byte $0d,$8d,$80,$fd,$bd,$b0,$7d,$fd,$dc,$5f,$ff,$57,$55,$55,$55,$5a
        .byte $aa,$56,$69,$a9,$98,$ad,$ad,$a0,$0d,$8d,$80,$0d,$8d,$80,$0d,$8d
        .byte $80,$fd,$fd,$fc,$aa,$aa,$a8,$00,$00,$00,$00,$00,$00,$00,$03,$ff
        .byte $c0,$0d,$55,$7f,$35,$aa,$55,$d6,$a5,$6a,$da,$96,$80,$da,$58,$00
        .byte $d5,$60,$00,$25,$80,$00,$0a,$03,$00,$0e,$fd,$c0,$0e,$55,$70,$0e
        .byte $a9,$80,$0f,$02,$00,$35,$c0,$00,$d5,$70,$00,$da,$5c,$00,$da,$97
        .byte $c0,$d6,$a5,$7f,$25,$aa,$55,$09,$55,$6a,$02,$aa,$80,$00,$00,$03
        .byte $f0,$00,$0d,$60,$0f,$f5,$67,$0a,$d5,$aa,$03,$55,$80,$0d,$56,$00

    L_6892:
        .byte $35,$56,$00,$ff,$ff,$c0,$d5,$55,$70,$fd,$57,$5c,$57,$5d,$97,$a9
        .byte $56,$58,$d5,$55,$60,$aa,$aa,$80,$2a,$a9,$00,$09,$55,$00,$02,$55
        .byte $40,$0f,$95,$5f,$0a,$a5,$5a,$00,$09,$50,$00,$02,$a0,$00,$3f,$ff

    L_68c2:
        .byte $f0,$2a,$aa,$a0,$03,$8e,$00,$03,$8e,$00,$03,$ff,$00,$0f,$ff,$c0
        .byte $3d,$57,$f0,$f5,$55,$fc,$75,$f5,$7f,$b7,$5d,$5f,$37,$55,$55,$f6
        .byte $59,$5a,$75,$a5,$6a,$b5,$55,$a8,$19,$56,$a0,$0a,$aa,$80,$02,$aa
        .byte $00,$03,$8e,$00,$03,$8e,$00,$3f,$ff,$f0,$2a,$aa,$a0,$00,$0f,$f0
        .byte $00,$3f,$fc,$00

        sbc $57,x
        beq L_6892 + $d

        .byte $5a,$a0,$2a,$a8,$00,$0a,$a0,$00,$01,$80,$c0,$03,$80,$d0,$ff,$9f
        .byte $d4,$97,$a5,$d5,$d7,$a5,$d5,$97,$a5,$d6,$eb,$aa,$d8,$03,$80,$e0
        .byte $03,$80,$80,$0f,$f0,$00,$3f,$fc,$00

        sbc $57,x
        beq L_68c2 + $a

        .byte $5a,$a0,$2a,$a8,$00,$0a,$a0,$00,$00,$0f,$fc,$00,$35,$57,$c0,$d6
        .byte $95,$7c,$97,$d5,$68,$25,$56,$80,$0a,$a8,$00,$03

        rts 

        .byte $00,$03

        rts 

        .byte $00,$03,$63,$c0,$3f,$fd,$70,$35,$55,$5c,$2a,$a9,$60,$03,$62,$80
        .byte $03

        rts 

        .byte $00,$03

        rts 

        .byte $00,$0f,$fc,$00,$35,$57,$c0,$d6,$95,$7c,$97,$d5,$68,$25,$56,$80
        .byte $0a,$a8,$00,$00,$00,$00,$00,$00,$00,$00,$f0,$00,$00,$a0,$00,$00
        .byte $e9,$00,$00,$d5,$5f,$fc,$d5,$56,$a8,$d5,$55,$00

        cmp $55,x
        rti 

        .byte $ff,$ff,$fc,$ff,$55,$56,$aa,$aa,$a8,$6a,$aa,$80,$d5,$56,$00,$d5
        .byte $59,$fc,$d5,$aa,$a8,$da,$00,$00,$f0,$00,$00,$a0,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$ff,$ff,$00,$aa,$aa
        .byte $00,$35,$00,$00,$35,$40,$00,$35,$50,$00,$35,$54,$00,$35,$55,$00
        .byte $3f,$ff,$fc,$ff,$55,$56,$2a,$aa,$a8,$1a,$aa,$00,$35,$58,$00,$35
        .byte $60,$00,$35,$80,$00,$36,$00,$00,$ff,$ff,$00,$aa,$aa,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$ff,$00,$03,$fd,$40,$0f,$fd
        .byte $50,$3f,$d5,$54,$3f,$55,$58,$3d,$55,$68,$3d,$69,$68,$3d,$a7,$68
        .byte $3d,$83,$68,$3d,$83,$68,$3d,$83,$68,$3d,$9f,$68,$3d,$7d,$68,$3d
        .byte $55,$68,$35,$55,$a8,$15,$56,$a8,$05,$6a,$a0,$01,$aa,$80,$00,$aa
        .byte $00,$00,$00,$00,$01,$00,$55,$00,$01,$aa,$40,$06,$a9,$50,$1a,$a9
        .byte $54,$6a,$95,$55,$6a,$55,$5d,$69,$55,$7d,$6b,$f5,$7d,$6d,$5d,$7d
        .byte $75,$97,$ff,$55,$55,$55,$55,$d6,$aa,$69,$5a,$96,$6a,$aa,$7d,$6a
        .byte $a9,$7d,$65,$a5,$fd,$55,$57,$fd,$15,$7f,$f4

        ora $ff
        bne L_6a7b

        .byte $ff

    L_6a7b:
        rti 

        .byte $00,$55,$00,$00,$ff,$ff,$fc,$b5,$6a,$a8,$35,$60,$00,$1a,$a0,$c0
        .byte $1a,$a0,$d0,$35,$60,$d8,$35,$60,$d8,$3f,$ff,$f8,$d5,$55,$5c,$ff
        .byte $55,$a7,$55,$95,$56,$aa,$95,$a6,$aa,$55,$58,$2a,$aa,$a8,$1a,$a0
        .byte $68,$35,$60,$d8,$1a,$a0,$e0,$1a,$a0,$80,$35,$60,$00,$f5,$67,$fc
        .byte $aa,$aa,$a8,$00,$ff,$ff,$ff,$aa,$aa,$aa,$24,$00,$38,$09,$00,$e0
        .byte $02,$43,$80,$00,$9e,$00,$0f,$ff,$c0,$35,$55,$50,$d5,$7f,$54,$95
        .byte $75,$d5,$d5,$75,$66,$95,$75,$96,$d5,$6a,$58,$25,$55,$60,$0a,$aa
        .byte $80,$00,$e7,$00,$03,$81,$c0,$0e,$00,$70,$38,$00,$1c,$ff,$ff,$ff
        .byte $aa,$aa,$aa,$00,$3f,$f0,$00,$35,$54,$00,$35,$55,$00,$3f,$ff,$f0
        .byte $d5,$55,$5c,$d9,$99,$97,$dd,$dd,$d6,$d5,$55,$58,$2a,$aa,$a0,$15
        .byte $55,$80,$35,$55,$80,$35,$55,$80,$3f,$ff,$f0,$d5,$55,$5c,$d9,$99
        .byte $97,$dd,$dd,$d6,$d5,$55,$58,$2a,$aa,$a0,$35,$56,$00,$35,$58,$00
        .byte $3a,$a0,$00,$00,$c0,$00,$00,$d0,$00,$00,$d7,$ff,$fc,$d5,$aa,$a8
        .byte $55,$40,$00,$e5,$50,$00,$d9,$54,$00,$d6,$55,$00,$6a,$9d,$7c,$d5
        .byte $59,$75,$d5,$55,$e9,$d5,$5d,$66,$6a,$99,$a8,$d6,$56,$00,$d9,$58
        .byte $00,$e5,$60,$00,$55,$80,$00,$d6,$7f,$fc,$da,$aa,$a8,$e0,$00,$00
        .byte $c0,$00,$00,$00,$c0,$00,$00,$d0,$00,$00,$d7,$ff,$00,$d5,$aa,$00
        .byte $95,$40,$00,$25,$50,$00,$09,$54,$00,$c2,$55,$00,$ff,$ff,$c0,$dd
        .byte $55,$7c,$d7,$55,$a7,$d9,$55,$68,$ea,$aa,$80,$83,$56,$00,$0d,$58
        .byte $00,$35,$60,$00,$d5,$80,$00,$d6,$7f,$00,$da,$aa,$00,$e0,$00,$00
        .byte $80,$00,$00,$00,$00,$ff,$fc,$00,$d5,$a8,$00,$d5,$40,$00,$d5,$50
        .byte $00,$d5,$54,$03,$ff,$fc,$f3,$55,$58,$e3,$55,$58,$e3,$55,$ff,$ff
        .byte $d5,$d6,$ea,$a5,$d6,$e2,$a5,$aa,$e2,$95,$58,$a1,$55,$58,$02,$aa
        .byte $a8,$00,$d5,$58,$00,$d5,$60,$00,$d5,$80,$00,$d6,$7c,$00,$aa,$a8
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3f,$ff,$ff

        rol 
        ror 
        ror 
        ora ($61,x)
        rts 

        .byte $03,$63

        rts 

        .byte $03,$63

        rts 

        .byte $0f,$6f,$6f,$37,$7f,$7d,$d5,$ff,$f5,$55,$55,$55,$95,$aa,$a5,$26
        .byte $6a,$69,$0b,$6b,$6a,$03,$63

        rts 

        .byte $03,$63

        rts 

        .byte $03,$63

        rts 

        .byte $3f,$7f,$7f,$2a,$aa,$aa,$00,$00,$00,$00,$00,$00,$00,$03,$ff,$c0
        .byte $fd,$55,$50,$55,$aa,$54,$a9,$5a,$96,$02,$96,$a6,$00,$25,$a6,$00
        .byte $09,$56,$00,$02,$58,$00,$c0,$e0,$03,$7f,$e0,$0d,$55,$e0,$02,$6a

    L_6c63:
        .byte $e0,$00,$80,$f0,$00,$03,$54,$00,$0d,$56,$00,$35,$a6,$03

        dec $a6,x
        sbc L_964f + $b,x
        eor $aa,x
        cli 
        lda #$55
        rts 

        .byte $02,$aa,$80,$00,$0f,$c0,$00,$09,$50,$00,$f9,$57,$f0,$aa,$55,$a0
        .byte $02,$55,$40,$00,$95,$50,$00,$95,$54,$03,$ff,$ff,$0d,$55,$56,$35
        .byte $d5,$7f,$d7,$65,$d5,$25,$95,$6a,$09,$55,$5a,$02,$aa,$aa,$00,$6a
        .byte $a8,$00,$d5,$60,$03,$55,$80,$ff,$56,$70,$ad,$5a,$a0,$0d,$60,$00
        .byte $0a,$80,$00,$00,$0f,$ff,$fc,$0a,$aa,$a8,$00,$e3,$80,$00,$e3,$80
        .byte $00,$ff,$c0,$03,$ff,$f0,$0f,$d5,$7c,$3f,$55,$57,$fd,$5f,$59,$f5
        .byte $75,$da,$55,$55,$d8,$a5,$65,$9b,$a9,$5a,$59,$2a,$55,$5a,$0a,$95
        .byte $68,$02,$aa,$a0,$00,$aa,$80,$00,$61,$80,$00,$e3,$80,$0f,$ff,$fc
        .byte $0a,$aa,$a8,$00,$00,$0f,$f0,$00,$3f,$fc,$0f,$d5,$5f,$0a,$a5,$56
        .byte $00,$2a,$a8,$00,$0a,$a0,$03,$01,$80,$0e,$03,$80,$36,$ff,$9f,$d6
        .byte $57,$a6,$56,$57,$a7,$96,$57,$a6,$26,$ab,$ab,$0a,$03,$80,$02,$03
        .byte $80,$00,$0f,$f0,$00,$3f,$fc,$0f,$d5,$5f,$0a,$a5,$56,$00,$2a,$a8
        .byte $00,$0a,$a0,$00,$00,$3f,$f0,$03,$d5,$5c,$3d,$56,$97,$29,$57,$d6
        .byte $02,$95,$58,$00,$2a,$a0,$00,$0d,$80,$00,$0d,$80,$03,$cd,$80,$0d
        .byte $7f,$fc,$35,$55,$58,$09,$6a,$a8,$02,$8d,$80,$00,$0d,$80,$00,$0d
        .byte $80,$00,$3f,$f0,$03,$d5,$5c,$3d,$56,$97,$29,$57,$d6,$02,$95,$58
        .byte $00,$2a,$a0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0f,$00,$00,$0a
        .byte $00,$00,$f6,$3f,$ff,$56,$2a,$b5,$56,$00,$d5,$56,$03,$55,$56,$3f
        .byte $ff,$ff,$d5,$55,$ff,$2a,$aa,$aa,$02,$aa,$aa,$00,$95,$56,$3f,$e5
        .byte $56,$2a,$aa,$56,$00,$00,$a6,$00,$00,$0f,$00,$00,$0a,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$ff,$ff,$00,$aa,$aa
        .byte $00,$00,$d8,$00,$03,$58,$00,$0d,$58,$00,$35,$58,$00,$d5,$58,$3f
        .byte $ff,$fc,$d5,$55,$ff,$2a,$aa,$a8,$00,$aa,$a8,$00,$25,$58,$00,$09
        .byte $58,$00,$02,$58,$00,$00,$98,$00,$ff,$ff,$00,$aa,$aa,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$ff,$00,$03,$fd,$40,$0f,$fd,$50
        .byte $3f,$d5,$54,$3f,$55,$58,$3d,$55,$68,$3d,$69,$68,$3d,$a7,$68,$3d
        .byte $83,$68,$3d,$83,$68,$3d,$83,$68,$3d,$9f,$68,$3d,$7d,$68,$3d,$55
        .byte $68,$35,$55,$a8,$15,$56,$a8,$05,$6a,$a0,$01,$aa,$80,$00,$aa,$00
        .byte $00,$00,$00,$01,$00,$55,$00,$01,$aa,$40,$06,$aa,$50,$1a,$a9,$54
        .byte $6a,$95,$5d,$6a,$55,$5d,$69,$55,$7d,$69,$5f,$fd,$69,$75,$7d,$ff
        .byte $d6,$5d,$55,$55,$55,$aa,$97,$55,$aa,$a5,$69,$69,$aa,$a9,$69,$6a
        .byte $ad,$69,$5a,$bd,$65,$57,$fd,$15,$5f,$f4

        ora $7f
        bne L_6e7b

        .byte $ff

    L_6e7b:
        rti 

    L_6e7c:
         .byte $00,$55,$00,$00,$3f,$ff,$ff,$2a,$ad,$5a,$00,$0d,$58,$03,$06,$a8
        .byte $0e,$06,$a8,$36,$0d,$58,$36,$0d,$58,$3f,$ff,$fc,$35,$55,$57,$da

    L_6e9c:
        .byte $55,$ff,$d5,$57,$55,$9a,$56,$aa,$25,$55,$aa,$2a,$aa,$a8,$3a,$0a
        .byte $a8,$26,$0d,$58,$0a,$06,$a8,$02,$06,$a8,$00,$0d,$58,$3f,$fd,$59
        .byte $2a,$aa,$aa,$00,$ff,$ff,$ff,$aa,$aa,$aa,$24,$00,$38,$09,$00,$e0
        .byte $02,$43,$80,$00,$9e,$00,$03,$ff,$f0,$0d,$55,$54,$35,$fd,$57,$d7
        .byte $59,$56,$dd,$59,$57,$96,$59,$56,$25,$a9,$57,$09,$55,$58,$02,$aa
        .byte $a0,$00,$e7,$00,$03,$81,$c0,$0e,$00,$70,$38,$00,$1c,$ff,$ff,$ff
        .byte $aa,$aa,$aa,$00,$00,$0f,$fc,$00,$35,$58,$00,$d5,$58,$0f,$ff,$fc
        .byte $35,$55,$56,$d6,$66,$66,$97,$77,$76,$25,$55,$56,$0a,$aa,$a8,$01
        .byte $55,$58,$03,$55,$58,$03,$55,$58,$0f,$ff,$fc,$35,$55,$56,$d6,$66
        .byte $66,$97,$77,$76,$25,$55,$56,$0a,$aa,$a8,$00,$95,$58,$00,$25,$58
        .byte $00,$0a,$a8,$00,$00,$00,$03,$00,$00,$0e,$3f,$ff,$f6,$2a,$aa,$d6
        .byte $00,$03,$56,$00,$0d,$5a,$00,$35,$66,$00,$d5,$96,$3f,$76,$aa,$dd
        .byte $65,$56,$7a,$55,$56,$99,$75,$56,$2a,$66,$aa,$00,$95,$96,$00,$25
        .byte $66,$00,$09,$5a,$00,$02,$56,$3f,$ff,$96,$2a,$aa,$a6,$00,$00,$0a
        .byte $00,$00,$02,$00,$00,$00,$03,$00,$00,$0e,$00,$ff,$f6,$00,$aa,$d6
        .byte $00,$03,$56,$00,$0d,$58,$00,$35,$60,$00,$d5,$83,$03,$ff,$fe,$3d
        .byte $55,$76,$da,$55,$d6,$29,$55,$66,$02,$aa,$aa,$00,$95,$42,$00,$25
        .byte $50,$00,$09,$54,$00,$02,$55,$00,$ff,$96,$00,$aa,$a6,$00,$00,$0a
        .byte $00,$00,$02,$00,$3f,$ff,$00,$2a,$d6,$00,$03,$56,$00,$0d,$56,$00
        .byte $35,$56,$00,$3f,$ff,$c0,$35,$55,$8f,$35,$55,$8e,$ff,$55,$8e,$d6
        .byte $5f,$fe,$d6,$5a,$aa,$aa,$5a,$8e,$35,$56,$8e,$35,$55,$8e,$2a,$aa
        .byte $80,$25,$56,$00,$09,$56,$00,$02,$56,$00,$3f,$96,$00,$2a,$aa,$00
        .byte $00,$00,$00,$00,$00,$3c,$66,$66,$66,$3c,$00,$00,$00,$0c,$3c,$0c
        .byte $0c,$0c,$00,$00,$00,$7c,$0e,$1c,$38,$7e,$00,$00,$00,$3c,$66,$0c
        .byte $66,$3c,$00,$00,$00,$1e,$3e,$66,$7e,$06,$00,$00,$00,$7e,$60,$7c
        .byte $06,$7c,$00,$00,$00,$0c,$18,$3c,$66,$3c,$00,$00,$00

        ror L_180c,x
        bmi L_709b + $3

        .byte $00,$00,$00,$3c,$66,$3c,$66,$3c,$00,$00,$00,$3c

        ror $3c
        clc 
        bmi L_704f

    L_704f:
         .byte $00,$00,$00,$00,$3c,$66,$3e,$00,$00,$00

        rts 
        rts 

        .byte $7c,$66,$7c,$00,$00,$00,$00,$00,$3c

        rts 

        .byte $3c,$00,$00,$00,$06,$06,$3e,$66,$3e,$00,$00,$00,$00,$00,$3e,$78
        .byte $3e,$00,$00,$00,$0c

        clc 
        ror $1818,x
        bmi L_7080

    L_7080:
         .byte $00,$00,$00,$3c,$66,$3e,$06,$3c,$00

        rts 
        rts 

        .byte $7c,$66,$66,$00,$00,$00,$18,$00,$18,$18,$18,$00,$00,$00,$0c,$00

    L_709b:
        .byte $0c,$0c,$0c,$38,$00,$00,$60,$60,$66,$78,$66,$00,$00,$00

        bmi L_70d0 + $b
        bmi L_70d0 + $d

        .byte $1c,$00,$00,$00,$1c,$1c,$1c,$1c,$1c,$00,$00,$00,$00,$00,$7c,$66
        .byte $66,$00,$00,$00,$00,$00,$3c,$66,$3c,$00,$00,$00,$00,$00,$7c

        ror $7c
        rts 
        rts 

    L_70d0:
         .byte $00,$00,$00,$3e,$66,$3e,$06,$06,$00,$00,$00,$7c,$66,$60,$00,$00
        .byte $00,$00,$00,$3e,$7e,$7c,$00,$00,$00,$00,$18,$7e,$18,$0e,$00,$00
        .byte $00,$00,$00,$66,$66,$3c,$00,$00,$00,$00,$00,$66,$3c,$18,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$66,$18,$66,$00,$00
        .byte $00,$00,$00,$66,$66,$3e,$06,$3c,$00,$00,$00,$7e,$18,$7e,$00,$00
        .byte $00,$7c,$06,$7c,$00,$18,$00,$00,$00,$18,$18,$18,$00,$18,$00,$00
        .byte $00,$18,$30,$30,$30,$30,$18,$00,$00,$18,$0c,$0c,$0c,$0c,$18,$00
        .byte $00,$00,$00,$00,$00,$18,$00,$00,$00,$00,$00,$00,$00

        clc 
        bmi L_7150

    L_7150:
         .byte $00,$00,$00,$18,$00,$18,$00,$00,$00,$00,$00,$18,$00

        clc 
        bmi L_7160

    L_7160:
         .byte $00,$00,$6c,$36,$00,$00,$00,$00,$00,$00,$30,$18,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$7e,$00,$00,$00,$00,$00,$7e,$00,$7e,$00,$00,$00

    L_7180:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$07,$0e,$1f,$1c,$1c,$00,$00,$00,$1f,$1c,$1f,$1c,$1f,$00,$00
        .byte $00,$07,$0e,$1c,$0e,$07,$00,$00,$00,$1f,$1c,$1c,$1c,$1f,$00,$00
        .byte $00,$1f,$1c,$1f,$1c,$1f,$00,$00,$00,$1f,$1c,$1f,$1c,$1c,$00,$00
        .byte $00,$07,$0e,$1c,$0e,$07,$00,$00,$00,$1c,$1c,$1f,$1c,$1c,$00,$00
        .byte $00,$00,$00,$1f,$19,$19,$00,$00,$00,$00,$00,$00,$1c,$0f,$00,$00
        .byte $00,$1c,$1c,$1f,$1c,$1c,$00,$00,$00,$1c,$1c,$1c,$1c,$1f,$00,$00
        .byte $00,$f8,$fc,$ee,$e7,$e3,$00,$00,$00,$3f,$3b,$39,$38,$38,$00,$00
        .byte $00,$07,$0e,$1c,$0e,$07,$00,$00,$00,$1f,$1c,$1f,$1c,$1c,$00,$00
        .byte $00,$07,$0e,$1c,$0e,$07,$00,$00,$00,$1f,$1c,$1f,$1c,$1c,$00,$00
        .byte $00,$0f,$1c,$0f,$00,$1f,$00,$00,$00,$3f,$01,$01,$01,$01,$00,$00
        .byte $00,$1c,$1c,$1c,$0e,$07,$00,$00,$00,$1c,$0e,$07,$03,$01,$00,$00
        .byte $00,$70,$73,$73,$76,$3c,$00,$00,$00,$1c,$07,$01,$07,$1c,$00,$00
        .byte $00,$38,$0e,$03,$01,$01,$00,$00,$00,$0f,$00,$00,$03,$0f,$00,$00
        .byte $00,$00,$00,$19,$19,$0e,$00,$00,$00,$07,$0f,$03,$1f,$7f,$67,$00
        .byte $00,$01,$03,$03,$03,$01,$1f,$00,$00,$01,$07,$01,$18,$7e,$18,$00
        .byte $00,$07,$3f,$7f,$7f,$3f,$07,$00,$00,$0f,$33,$66,$33,$0f,$00,$00
        .byte $00,$f8,$1c,$fe,$0e,$0e,$00,$00,$00,$fc,$0e,$fc,$0e,$fc,$00,$00
        .byte $00,$fc,$0e,$00,$0e,$fc,$00,$00,$00,$f8,$1c,$0e,$1c,$f8,$00,$00
        .byte $00,$fe,$00,$e0,$00,$fe,$00,$00,$00,$fe,$00,$e0,$00,$00,$00,$00
        .byte $00,$f8,$00,$7e,$1c,$f8,$00,$00,$00,$0e,$0e,$fe,$0e,$0e,$00,$00
        .byte $00,$00,$00,$f0,$98,$98,$00,$00,$00,$0e,$0e,$0e,$0e,$fc,$00,$00
        .byte $00,$0e,$38,$e0,$38,$0e,$00,$00,$00,$00,$00,$00,$00,$fe,$00,$00
        .byte $00,$3e,$7e,$ee,$ce,$8e,$00,$00,$00,$0e,$8e,$ce,$ee,$7e,$00,$00
        .byte $00,$f8,$1c,$0e,$1c,$f8,$00,$00,$00,$fc,$0e,$fc,$00,$00,$00,$00

    L_7350:
        .byte $00,$f8,$1c,$0e,$7c,$f8,$1c,$00,$00,$f8,$1c,$f8,$1c,$0e,$00,$00
        .byte $00,$fe,$00,$fc,$0e,$fc,$00,$00,$00,$fe,$c0,$c0,$c0,$c0,$00,$00
        .byte $00,$0e,$0e,$0e,$1c,$f8,$00,$00,$00

        asl L_3819 + $3
        beq L_7350 + $e

        .byte $00,$00,$00,$0e,$8e,$8e,$dc,$78,$00,$00,$00,$0e,$38,$e0,$38,$0e

    L_738e:
        .byte $00,$00,$00,$0e,$38,$e0,$c0,$c0,$00,$00,$00,$fe,$38,$e0,$80,$fe
        .byte $00,$00,$00,$00,$00

        tya 
        tya 
        bvs L_73a7

    L_73a7:
         .byte $00,$00,$e0,$f0,$c0,$f8,$fe,$e6,$00,$00,$80,$c0,$c0,$c0,$80,$f8
        .byte $00,$00,$80,$e0,$80,$18,$7e,$18,$00,$00

        rts 

        .byte $0c,$06,$06,$0c,$e0,$00,$00

        beq L_738e + $9
        asl $cc
        beq L_73cf

    L_73cf:
         .byte $00,$30,$33,$7f,$7f,$7f,$7f,$1f,$00,$0c,$cc,$fe,$fe,$fe,$fe,$f8

    L_73df:
        .byte $00,$1c,$30,$fe,$fe,$60,$c6,$fc,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00

        jsr L_2020
        jsr L_5bfd + $8

        .byte $5c,$5c,$09,$0b,$05,$5c,$04,$0e,$0f,$0f,$05,$5c,$06,$06,$06,$06
        .byte $06,$5c,$07,$0e,$0f,$0f,$02,$5c,$04,$0e,$0f,$0f,$05,$5c,$06,$06
        .byte $06,$06,$06,$5c,$07,$0e,$0f,$0f,$02,$5c,$04,$0e,$0f,$0f,$05,$5c
        .byte $06,$06,$06,$06,$06,$5c,$07,$0e,$0f,$0f,$02,$5c,$04,$0e,$0f,$0f
        .byte $05,$5c,$06,$06,$06,$06,$06,$5c,$07,$0e,$0f,$0f,$02,$5c,$04,$0e
        .byte $0f,$0f,$05,$5c,$06,$06,$06,$06,$06,$5c,$07,$0e,$0f,$0f,$0f,$0f

        jsr L_2020
        jsr L_5bfd + $8

        .byte $5c,$5c,$5c,$5c,$09,$0a,$0a,$0a,$67,$09,$0a,$0a,$0a,$67,$09,$0a
        .byte $0a,$0a,$67,$09,$0a,$0a,$0a,$67,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$07
        .byte $0c,$05,$07,$00,$9f,$59,$8b,$9f,$b6,$8c,$9e

        rti 

    L_7498:
         .byte $8b,$98,$46,$0d,$94,$42,$14,$8a,$4f,$10,$8a,$55,$10,$9e,$4f,$10
        .byte $9e,$55,$10,$96,$4f,$69,$96,$55,$69,$90,$60,$15,$96,$60,$16,$9c
        .byte $60,$16,$8e,$7d,$10,$94,$7a,$14,$9a,$74,$10,$9a,$71,$1f,$8e,$83
        .byte $1f,$88,$92,$1d,$a2,$92,$1e,$9a,$a2,$1f,$9a,$a5,$10,$94,$ab,$14
        .byte $8e,$ae,$10,$8e,$b4,$1f,$90,$c3,$15,$9c,$c3,$15,$9a,$d3,$1f,$9a
        .byte $d6,$10,$94,$dc,$14,$8e,$df,$10,$8e,$e5,$1f,$88,$f4,$1d,$96,$f4
        .byte $15,$a2,$f4,$1e,$9b,$04,$1f,$9b,$07

        bpl L_7498
        ora L_8f0a + $a
        bpl L_7518

        .byte $8f,$16,$1f,$89,$25,$1d,$8f,$25,$16,$9f,$25,$15,$a3,$25,$51,$9b

    L_7518:
        .byte $35,$1f,$9b,$38,$10,$95,$3e,$14,$8f,$41,$10,$8f,$47,$1f,$91,$5c
        .byte $18,$8f,$5e,$18,$8d,$60,$18,$8b,$62,$18,$89,$64,$18,$87,$66,$18
        .byte $97,$5c,$18,$99,$5e,$18,$9b,$60,$18,$9d,$62,$18,$9f,$64,$18,$a1
        .byte $66,$18,$95,$60,$55,$95,$65,$56,$95,$6d,$56,$91,$65,$56,$91,$6d
        .byte $56,$95,$74,$55,$8b,$6c,$11,$9f,$6c,$11,$8b,$71,$11,$8b,$76,$11
        .byte $8b,$7b,$11,$8b,$80,$11,$8b,$85,$11,$8b,$8a,$11,$8b,$8f,$53,$9f
        .byte $71,$11,$9f,$76,$11,$9f,$7b,$11,$9f,$80,$11,$9f,$85,$11,$9f,$8a

    L_7588:
        .byte $11,$9f,$8f,$53,$8b,$70,$19,$8b,$78,$19,$8b,$83,$19,$9f,$6d,$19
        .byte $9f,$76,$19,$9f,$7f,$19,$9f,$89,$19,$95,$8e,$6a,$95,$93,$11,$95
        .byte $98,$11,$95,$9d,$11,$95,$a2,$11,$95,$a7,$53,$a1,$98,$6b,$8f,$98
        .byte $6b,$8d,$a2,$68,$9f,$a2,$68,$8d,$a7,$68,$9f,$a7,$68,$99,$b5,$5f
        .byte $99,$b4,$8a,$95,$b5,$65,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $20,$20,$20,$20,$05,$07,$20,$20,$20,$20,$05,$07,$05,$07,$20,$20
        .byte $20,$20,$05,$07,$20,$20,$20,$20,$0c,$08,$08,$08,$08,$08,$02,$06
        .byte $04,$0c,$08,$08,$08,$08,$08,$02,$06,$04,$0c

        php 
        php 
        php 
        php 
        php 
        jsr L_2020
        jsr L_5bfd + $8

        .byte $5c,$06,$06,$06,$5c,$5c,$07,$05,$5c,$5c,$06,$06,$06,$5c,$5c,$5c
        .byte $5c,$5c,$09,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0b

        lsr L_5e58 + $6,x
        lsr L_5e58 + $6,x
        lsr L_5e58 + $6,x
        lsr $2092,x
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr $0405
        jsr L_2020
        jsr $0405

        .byte $7a,$7b,$7b,$02,$06,$06,$06,$04,$7a,$7b,$7b,$02,$07,$20,$20,$20
        .byte $20,$0c,$08,$08,$08,$08,$02,$09,$0a,$0a,$0a,$67,$09,$0a,$0a,$0a
        .byte $67,$09,$0a,$0a,$0a,$67,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$07,$00
        .byte $9e

        rti 

        .byte $8b,$9e,$50,$8b,$9e,$67,$8c,$9e,$77,$8c,$9e,$ae,$8b,$a3,$09,$5e
        .byte $a3,$0b,$5e,$9f,$48,$8b,$9f,$55,$8b,$9f,$7d,$8c,$98,$49,$0d,$94
        .byte $44,$14,$88,$4b,$18,$9e,$4b

        clc 
        bcc L_7709 + $3
        adc L_5c9d + $3
        adc L_568e + $4
        jmp (L_5c8d + $7)

        .byte $73,$90,$58,$68,$9a,$58,$68,$90,$63,$6d,$a0,$63,$6d,$92,$63,$6c
        .byte $94,$63,$75,$90,$66,$68,$9a,$66,$68,$94,$72,$55,$90,$72,$61,$9e
        .byte $72,$61,$92,$77,$56,$8c,$75,$52,$9c,$75,$52,$88,$8d,$13,$9a,$9e
        .byte $14,$88,$bc,$1d,$8e,$bc,$16,$9e,$bc,$15,$a2,$bc,$51,$96,$b2,$15
        .byte $94,$c5,$65,$88,$cf,$1d,$8e,$cf,$16,$94,$cf,$16,$9a,$cf,$16,$92

    L_7709:
        .byte $dd,$15,$98,$dd,$16,$9e,$dd,$16,$a2,$dd,$51,$8a,$ed,$11,$8a,$f2
        .byte $11,$8a,$f7,$11,$8a,$fc,$11,$8b,$01,$11,$8b,$06,$53,$96,$ed,$54
        .byte $98,$f3,$54,$96,$f9,$54,$9e,$f0,$55,$8a,$ef,$19,$8a,$f9,$19,$8b
        .byte $01,$19,$9e,$f7,$11,$9e,$fc,$11,$9f,$01,$11,$9f,$06,$11,$9f,$0b

        ora ($9f),y
        bpl L_775d + $1

        .byte $9f,$15,$11,$9e,$fa,$19,$9f,$03,$19,$9f,$0d,$19,$9f,$1a,$53,$91

    L_775d:
        .byte $49,$18,$8f,$4b,$18,$8d,$4d,$18,$8b,$4f,$18,$89,$51,$18,$97,$49
        .byte $18,$99,$4b,$18,$9b,$4d,$18,$9d,$4f,$18,$9f,$51,$18,$95,$4e,$91
        .byte $95,$4b,$14,$97,$59,$66,$8f,$69,$13,$a1,$6c,$14,$97,$7d,$66,$8f
        .byte $5e,$69,$9f,$5e,$69,$8f,$7a,$69,$9f,$7a,$69,$8b,$94,$6a,$8b,$99
        .byte $11,$8b,$9e,$11,$8b,$a3,$11,$8b,$a8,$11,$8b,$ad,$11,$8b,$b2,$11
        .byte $8b,$b7,$11,$8b,$bc,$53,$9f,$94,$6a,$9f,$99,$11,$9f,$a3,$11,$9f
        .byte $a8,$11,$9f,$ad,$11,$9f,$b2,$11,$9f,$b7,$11,$9f,$bc,$53,$97,$a0
        .byte $6b,$9f,$9e,$11,$99,$a8,$6b,$97,$b1,$69,$97,$b6,$69,$97,$bb,$69

    L_77dd:
        .byte $95,$be,$14,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_77fd:
        .byte $00,$00,$00,$00,$00,$fc,$fe,$0e,$06,$06,$06,$00,$00,$03,$03,$03
        .byte $03,$03,$03,$00,$00,$3f,$3f

        sec 
        bmi L_7845 + $2

        .byte $33,$00,$00,$f1,$fa,$3a,$19,$38,$f9,$00,$00,$9f,$5f

        rti 

        .byte $80,$00,$98,$00,$00,$f8,$fd,$1d,$0c,$0c,$0c,$00,$00,$cc,$2c,$2c
        .byte $cc,$0c,$cc,$00,$00,$06,$06,$06,$06,$06,$06,$00,$00,$3c,$7e,$77

    L_7845:
        .byte $63,$61,$60,$00,$00,$3c,$7e,$ee,$c6,$86,$06,$07,$07,$03,$00,$00
        .byte $ff,$ff,$00,$07,$ff,$fe,$00,$00,$ff,$ff,$00,$33

        and ($30),y
        bmi L_78c7 + $e
        beq L_7845 + $2

        .byte $00,$f1,$e1,$f1,$79,$3d,$1f,$0f,$00,$9c,$9f,$8f,$80,$80,$ff,$ff
        .byte $00,$1c,$fc,$f8,$00,$01,$ff,$ff,$00,$ce,$cf,$c7,$c0,$c0,$c3,$83
        .byte $00,$0e,$fe,$fc,$00,$00,$ff,$ff,$00,$60,$60,$60,$60,$e0,$e0,$c0

    L_7897:
        .byte $00,$06,$06,$06,$06,$06,$06,$06,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_78c7:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$ff,$ff,$ff,$ff,$ff,$ff,$ff
        .byte $ff,$15,$15,$15,$15,$15,$15,$2a,$aa,$15,$15,$15,$15,$15,$15,$15
        .byte $15,$00,$00,$15,$15,$15,$15,$15,$15,$55,$55,$55,$55,$55,$55,$aa
        .byte $aa,$55,$55,$55,$55,$55,$55,$55,$55,$00,$00,$55,$55,$55,$55,$55
        .byte $55,$56,$56,$56,$56,$56,$56,$aa,$aa,$56,$56,$56,$56,$56,$56,$56
        .byte $56,$00,$02,$56,$56,$56,$56,$56,$56,$15,$55,$55,$55,$55,$55,$55
        .byte $55,$ff,$ff,$ff,$ff,$fc,$f0,$c1,$05,$fc,$f0,$c1,$05,$15,$55,$55
        .byte $55,$54,$55,$55,$55,$55,$55,$55,$55,$ff,$ff,$ff,$ff,$ff,$3f,$4f
        .byte $53,$ff,$3f,$4f,$53,$54,$55,$55,$55,$e5,$f9,$fe,$ff,$ff,$ff,$ff
        .byte $ff,$55,$55,$55,$55,$55,$55,$55,$95,$55,$55,$55,$95,$e5,$f9,$fe
        .byte $ff,$5a,$6b,$af,$bf,$ff,$ff,$ff,$ff,$55,$55,$55,$55,$55,$55,$55
        .byte $56,$55,$55,$55,$56,$5a,$6b,$af,$bf,$55,$55,$55,$55,$54,$50,$41
        .byte $05,$54,$50,$41,$05,$15,$55,$55,$55,$55,$55,$55,$55,$55,$15,$45
        .byte $51,$55,$15,$45,$51,$54,$55,$55,$55,$65,$59,$56,$55,$55,$55,$55
        .byte $55,$55,$55,$55,$95,$65,$59,$56,$55,$5a,$69,$a5,$95,$55,$55,$55
        .byte $55,$55,$55,$55,$56,$5a,$69,$a5,$95,$55,$55,$55,$55,$55,$55,$95
        .byte $15,$15,$15,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$56

    L_7a07:
        .byte $56,$56,$54,$55,$55,$55,$55,$55,$55,$ff,$ff,$ff,$ff,$ff,$3f,$ff

    L_7a17:
        .byte $ff,$ff,$ff,$3f,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$a8,$a0,$80
        .byte $00,$af,$af,$af,$af,$af,$af,$af,$af,$fa,$f2,$f0,$f0,$f0,$f0,$f0
        .byte $f0,$aa,$aa,$aa,$aa,$ff,$ff,$ff,$ff,$55,$55,$95,$a5,$a8,$a0,$80
        .byte $00,$aa,$aa,$a5,$a5,$a5,$a5,$a5,$a5,$6a,$58,$50,$50,$50,$50,$50
        .byte $50,$aa,$aa,$aa,$aa,$aa,$aa,$aa,$a5,$55,$95,$a5,$a5,$a5,$a5,$a5
        .byte $a5,$a5,$a5,$a5,$a5,$a5,$a5,$a5,$a5,$6a,$5a,$55,$55,$55,$55,$55
        .byte $55,$aa,$aa,$55,$55,$55,$55,$55,$55,$a5,$a5,$55,$55,$55,$55,$55
        .byte $55,$a0,$a8,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$a9,$a9
        .byte $a9,$a9,$a9,$a9,$a9,$a9,$a9,$aa,$aa,$55,$11,$55,$55,$55,$55,$55
        .byte $55,$55,$55,$55,$01,$01,$55,$55,$55,$55,$15,$05,$01,$01,$05,$15
        .byte $55,$55,$51,$41,$01,$01,$41,$51,$55,$55,$55,$55,$55,$55,$55,$11
        .byte $55,$aa,$a8,$bc,$bc,$bc,$bc,$80,$00,$ff,$ff,$ff,$ff,$ff,$ff,$ff
        .byte $ff,$ff,$ff,$40,$95,$95,$aa,$ff,$ff,$aa,$aa,$aa,$aa,$aa,$aa,$aa
        .byte $aa,$aa,$a8,$a0,$80,$55,$55,$55,$55,$00,$00,$00,$00,$55,$55,$55
        .byte $55,$55,$55,$55,$55,$aa,$aa,$aa,$aa,$55,$55,$55,$55,$a8,$a0,$80
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$aa,$aa,$a5,$a5,$a5,$a5,$a5
        .byte $a5,$55,$55,$50,$4a,$29,$25,$25,$25,$55,$55,$00,$aa,$55,$56,$58
        .byte $62,$55,$55,$05,$a9,$8a,$22,$92,$52,$25,$26,$28,$22,$68,$5a,$55
        .byte $55,$89,$25,$95,$55,$00,$aa,$55,$55,$52,$52,$52,$42,$09,$a5,$55
        .byte $55,$49,$49,$61,$61,$49,$49,$61,$61,$55,$55,$22,$22,$88,$88,$55
        .byte $55,$55,$55,$62,$62,$48,$48,$61,$61,$55,$55,$21,$21,$89,$89,$61
        .byte $61,$49,$49,$62,$62,$48,$48,$55,$55,$49,$49,$21,$21,$89,$89,$55
        .byte $55,$55,$15,$05,$01,$01,$05,$15,$55,$51,$58,$56,$4e,$61,$da,$9e
        .byte $8a,$55,$59,$31,$b9,$95,$b9,$ac,$66,$6d,$66,$e9,$0a,$a6,$72,$29
        .byte $65,$a5,$31,$89,$a2,$d9,$9d,$e5,$55,$59,$12,$56,$56,$a6,$6b,$5a
        .byte $65,$55,$12,$5a,$9a,$97,$ee,$df,$7f,$a5,$a1,$95,$55,$55,$95,$66
        .byte $e9,$6a,$ab,$46,$29,$ae,$6b,$54,$5a,$af,$fd,$be,$bf,$0f,$e7,$7b
        .byte $ff,$a5,$95,$aa,$e9,$01,$a5,$29,$ca,$5a,$6b,$aa,$96,$56,$57,$1b
        .byte $68,$7f,$9f,$ef,$dc,$eb,$19,$92,$56,$d9,$d9,$65,$d9,$a6,$65,$29
        .byte $55,$44,$26,$04,$91,$6a,$06,$1a,$a4,$45,$2d,$8d,$e1,$38,$be,$65
        .byte $49,$61,$95,$25,$99,$51,$16,$a4,$45,$ff,$c3,$99,$99,$99,$99,$c3
        .byte $ff,$ff,$e3,$c3,$f3,$f3,$f3,$c1,$ff,$ff,$c1,$9c,$f9,$c3,$9f,$80
        .byte $ff,$ff,$c1,$9c,$f1,$f1,$9c,$c1,$ff,$ff,$e1,$c9,$99,$99,$80,$f9
        .byte $ff,$ff,$80,$9f,$81,$fc,$9c,$c1,$ff,$ff,$e0,$cf,$81,$9c,$9c,$c1
        .byte $ff,$ff,$80,$fc,$f9,$f3,$f3,$f3,$ff,$ff,$c1,$9c,$c1,$c1,$9c,$c1
        .byte $ff,$ff,$c1,$9c,$9c,$c0,$f9,$83,$ff,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$55,$55,$50,$45,$46,$46,$46
        .byte $46,$55,$55,$05,$99,$49,$49,$49,$49,$55,$55,$54,$50,$58,$54,$54
        .byte $54,$55,$55,$25,$65,$65,$65,$65,$65,$55,$55,$50,$4a,$49,$55,$55
        .byte $54,$55,$55,$05,$99,$49,$49,$19,$65,$55,$55,$50,$4a,$65,$54,$56
        .byte $55,$55,$55,$05,$59,$19,$65,$45,$19,$55,$55,$40,$46,$46,$46,$46
        .byte $45,$55,$55,$55,$55,$55,$55,$55,$01,$55,$55,$40,$4a,$49,$44,$6a
        .byte $55,$55,$55,$01,$a9,$55,$15,$45,$19,$55,$55,$50,$4a,$49,$44,$45
        .byte $46,$55,$55,$01,$a9,$55,$05,$99,$49,$55,$55,$40,$6a,$55,$55,$54
        .byte $51,$55,$55,$01,$99,$49,$19,$65,$95,$55,$55,$50,$46,$49,$54,$51
        .byte $46,$55,$55,$05,$99,$49,$25,$95,$49,$55,$55,$50,$4a,$49,$44,$5a
        .byte $55,$55,$55,$05,$59,$19,$19,$59,$19,$ff,$c1,$9c,$9c,$90,$99,$c0
        .byte $ff,$ff,$9c,$9c,$9c,$9c,$9c,$c1,$ff,$ff,$e1,$f3,$f3,$f3,$f3,$e1
        .byte $ff,$ff,$81,$e7,$e7,$e7,$e7,$e7,$ff,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$46,$45,$45,$45,$45,$5a,$55
        .byte $55,$49,$19,$59,$59,$59,$a5,$55,$55,$54,$50,$55,$55,$55,$5a,$55
        .byte $55,$65,$51,$59,$59,$59,$a9,$55,$55,$51,$45,$45,$45,$45,$6a,$55
        .byte $55,$95,$01,$59,$59,$59,$a9,$55,$55,$45,$40,$45,$45,$65,$5a,$55
        .byte $55,$19,$59,$59,$59,$65,$95,$55,$55,$45,$45,$45,$6a,$55,$55,$55
        .byte $55,$59,$59,$59,$99,$49,$69,$55,$55,$45,$40,$45,$45,$65,$5a,$55
        .byte $55,$19,$59,$59,$59,$65,$95,$55,$55,$46,$45,$45,$45,$65,$5a,$55
        .byte $55,$49,$19,$59,$59,$59,$a5,$55,$55,$51,$51,$51,$51,$51,$5a,$55
        .byte $55,$95,$95,$95,$95,$95,$95,$55,$55,$46,$45,$45,$45,$45,$5a,$55
        .byte $55,$49,$19,$59,$59,$59,$a5,$55,$55,$55,$40,$45,$45,$45,$6a,$55
        .byte $55,$19,$19,$59,$59,$59,$a5,$55,$55,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_7ff7:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$09,$00,$09,$c3,$c2,$cd

    L_8007:
        .byte $38,$30,$00,$00,$00,$00,$00,$00,$00,$10,$18,$e8,$00,$d0,$10,$28
        .byte $00

        cld 
        jsr $30d0

    L_801c:
         .byte $00,$b0,$d0,$00,$80,$f4,$f1,$f0,$f8,$fb,$fd,$aa,$ab,$f6,$ba,$b8
        .byte $b6,$bc,$b3,$ce,$00,$0a,$01,$09,$0c,$03,$07,$08,$02,$06,$05,$09
        .byte $0b,$01,$06,$04,$d8,$dc,$d4,$dc,$d4,$d8,$dc,$d8,$d4,$d8,$dc,$d4
        .byte $dc,$d8,$d4,$dc,$df,$70,$84,$98,$ac,$c0,$d5,$e9,$55,$69,$7e,$92
        .byte $a6,$b8,$cc,$df,$ef,$e0,$e0,$e0,$e0,$e0,$e0,$e0,$ef,$ef,$ef,$ef
        .byte $ef,$ef,$ef,$ef,$02,$0c

        bmi L_809e + $6
        bmi L_809e + $8

        .byte $00

        ora ($28,x)
        bmi L_80ce

        .byte $12,$17,$0c

        plp 
        bmi $80b1
        bmi L_80b3

        .byte $ff,$02,$0c

        bmi $80b8
        bmi $80ba

        .byte $00,$02

        plp 
        bmi $80d4
        asl $0d0a
        plp 
        bmi $80c5
        bmi L_80c7

        .byte $ff,$02,$0c

        bmi L_80cb + $1
        bmi L_809e

    L_809e:
         .byte $03,$28,$30,$3c,$18,$19,$19,$0e,$1b

        plp 
        bmi $80da
        bmi $80ab

        .byte $02,$0c

        bmi L_80e0
        bmi L_80b2

    L_80b2:
         .byte $04

    L_80b3:
        plp 
        bmi L_80fc + $6

        .byte $12

        ora $1f,x
        asl L_281b
        bmi L_80e8 + $6
        bmi $80bf

        .byte $02,$0c

        bmi L_80f4
        bmi $80f6

        .byte $00

    L_80c7:
        ora $28
        bmi L_80e1

    L_80cb:
         .byte $1b,$18,$17

    L_80ce:
        plp 
        bmi L_80fc + $5
        bmi L_80fc + $7
        bmi $80d4

        .byte $02,$0c

        bmi L_80fc + $d
        bmi L_80fc + $f

        .byte $00

        asl $28
        bmi L_8120
    L_80e0:
        clc 
    L_80e1:
        ora $0d,x
        plp 
        bmi L_8116
        bmi L_8118

    L_80e8:
         .byte $ff,$02,$0c,$30,$30,$00,$07

        plp 
        bmi L_813b
        ora $0a,x
    L_80f4:
        ora $1712,x
        asl $2842,x
        bmi $80fb

    L_80fc:
         .byte $00,$ff,$00,$ff,$01,$01,$20,$01,$11,$21,$22,$22,$22,$22,$22,$22
        .byte $22,$22,$22,$22,$22,$22,$22,$22,$22,$23

    L_8116:
        ora ($11,x)
    L_8118:
        bit $25
        and $25
        and $25
        and $25
    L_8120:
        and $25
        and $25
        and $25
        and $25
        rol $01
        ora ($27),y
        plp 
        plp 
        plp 
        plp 
        plp 
        plp 
        plp 
        plp 
        plp 
        plp 
        plp 
        plp 
        plp 
        plp 
        plp 
    L_813b:
        and #$04
        bpl L_8151 + $e
        bmi L_8161 + $2

        .byte $22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$2b,$10,$20,$32

    L_8151:
        .byte $25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$2c,$11,$30

    L_8161:
        .byte $31,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$2a,$2b
        .byte $11,$32,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25
        .byte $25,$2c,$03,$11,$24,$21,$22,$23,$21,$22,$23,$21,$22,$23,$21,$22
        .byte $23,$21,$22,$23,$26,$11,$24,$24,$25,$26,$24,$25,$26,$24,$25,$26
        .byte $24,$25,$26,$24,$25,$26,$26,$11,$24,$27,$28,$29,$27,$28,$29,$27
        .byte $28,$29,$27,$28,$29,$27,$28,$29,$26,$04,$11,$35,$25,$25,$25,$25
        .byte $25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$2f,$11,$33,$34,$25
        .byte $25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$2d,$2e,$10,$20
        .byte $35,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$2f,$10

    L_81f1:
        .byte $20,$33,$28,$28,$28,$28,$28,$28,$28,$28,$28,$28,$28,$28,$28,$2e
        .byte $02,$0b,$20,$20,$20,$20,$20,$20,$21,$22,$22,$22,$23,$0b

        jsr L_2020
        jsr L_2020

        .byte $27,$28,$28,$28,$29,$01,$11,$24,$25,$25,$25,$25,$25,$41,$28,$28
        .byte $28,$40,$25,$25,$25,$25,$25,$26,$01,$11,$24,$25,$25,$25,$25,$25
        .byte $26,$20,$20,$20,$24,$25,$25,$25,$25,$25,$26,$04,$11,$35,$25,$25
        .byte $25,$25,$25,$2f,$20,$20,$20,$35,$25,$25,$25,$25,$25,$2f,$11,$33
        .byte $34,$25,$25,$25,$2d,$2e,$20,$20,$20,$33,$34,$25,$25,$25,$2d,$2e
        .byte $10,$20,$35,$25,$25,$25,$2f

        jsr L_2020
        jsr $3520
        and $25
        and $2f
        bpl L_8298

        .byte $33

        plp 
        plp 
        plp 
        rol L_2020
        jsr L_2020

        .byte $33

        plp 
        plp 
        plp 
        rol $0b02
        jsr L_2020
        jsr L_2020

        .byte $53,$52,$52,$52

        eor ($0b),y
        jsr L_2020
    L_8298:
        jsr L_2020

        .byte $27,$28,$28,$28,$29,$06,$06,$4e,$21,$23,$4a,$21,$23,$06,$4f,$27

    L_82ab:
        .byte $25,$25,$25,$29,$06,$50,$4b,$25,$9d,$25,$48,$06,$4e,$21,$25,$25
        .byte $25,$23,$06,$4f,$27,$29,$49,$27,$29,$06,$50,$4d,$4c,$50,$4d,$4c
        .byte $02,$0b,$20,$20,$20,$20,$20,$20,$a9,$ab,$af,$aa,$a8,$0b,$20,$20
        .byte $20,$20,$20,$20,$a1,$a3,$ba,$a2,$a0,$02,$0b,$20,$20,$20,$20,$20
        .byte $20,$a5,$a7,$b9,$a6,$a4,$0b

        jsr L_2020
        jsr L_2020
        lda ($a3,x)
        tsx 
        ldx #$a0
        asl $03
        bcs L_82ab + $7

        .byte $b2,$03,$b3,$b4,$b5,$03,$b3,$b4,$b5,$03,$b3,$b4,$b5,$03,$b3,$b4
        .byte $b5,$03,$b6,$b7,$b8,$05,$03,$58,$55,$54,$03,$58,$55,$54,$03,$58
        .byte $55,$54,$03,$58,$55,$54,$03,$58,$56,$54,$06,$01,$ac,$01,$ad,$01
        .byte $ad,$01,$ad,$01,$ad,$01,$ae,$03,$03,$c6,$c3,$c0,$03,$c7,$c4,$c1
        .byte $03,$c8,$c5,$c2,$03,$03

        eor ($28,x)
        rti 

        .byte $03,$26,$5a,$24,$03,$3f,$22,$3e,$04,$04,$cb,$86,$83,$80,$04,$cc
        .byte $88,$85,$82,$04,$5c,$5c,$5c,$c9,$04,$cd,$5c,$ce,$ca,$04,$04,$cb
        .byte $86,$83,$80,$04,$cc,$88,$85,$82,$04,$5c,$5c,$5c,$5c,$04,$cd,$5c
        .byte $ce,$cd,$04,$04,$cf,$86,$83,$80,$04,$d0,$88,$85,$82,$04,$5c,$5c
        .byte $5c,$5c,$04,$5c,$5c,$ce,$cd,$02,$02,$92,$90,$02,$93,$91,$03,$03
        .byte $9a,$97,$94,$03,$9b,$98,$95,$03,$9c,$99,$96,$01,$01,$9d,$01,$01
        .byte $9e,$01,$01,$9f,$04,$04,$cb,$86,$83,$80,$04,$cc,$88,$85,$82,$04
        .byte $5c,$5c,$5c,$d1,$04,$cd,$5c,$ce,$d2,$04,$03,$86,$83,$80,$03,$88
        .byte $85,$82,$03,$5c,$5c,$c9,$03,$5c,$ce,$ca,$03,$03,$21,$22,$23,$03
        .byte $24,$25,$26,$03,$27,$28,$29,$02,$01,$20,$01,$20,$03,$08,$21,$22
        .byte $22,$22,$22,$22,$22,$23,$08,$24,$25,$25,$25,$25,$25,$25,$26,$08
        .byte $24,$25,$25,$25,$25,$25,$25,$26,$03,$08,$27,$28,$28,$40,$41,$28
        .byte $40,$26,$08,$20,$20,$20,$24,$26,$20,$24,$26,$08,$20,$20,$20,$24
        .byte $26,$20,$24,$26,$01,$08,$27

        plp 
        plp 
        plp 
        plp 
        plp 
        plp 
        and #$01
        php 
        bit $41
        plp 
        rti 
        eor ($28,x)
        rti 
        rol $02
        php 
        bit $26
        jsr L_2624
        jsr L_2624
        php 
        bit $26
        jsr L_2624
        jsr L_2624

        .byte $02,$08,$35,$3f,$22,$3e,$3f,$22,$3e,$2f,$08,$33

        plp 
        plp 
        and #$27
        plp 
        plp 
        rol L_0800 + $3
        bmi L_847c + $2

        .byte $22,$22,$22,$22,$22,$2b,$08,$32,$25,$25,$25,$25,$25,$25,$2c,$08
        .byte $24,$25,$25,$25,$25,$25,$25,$26,$01,$08,$24,$41,$28,$28,$28,$28

    L_847c:
        .byte $40,$26,$02,$08,$24,$26,$20,$20,$20,$20,$24,$26,$08,$27

        and #$20
        jsr L_2020

        .byte $27,$29,$02,$08,$35,$3f,$22,$22,$22,$22,$3e,$2f,$08,$33,$28,$28
        .byte $28,$28,$28,$28,$2e,$02,$08,$24,$26,$20,$24,$26,$20,$24,$26,$08
        .byte $27,$29,$20,$27,$29,$20,$27

        and #$02
        php 
        jsr L_2020
        bit $26
        jsr L_2624
        php 
        jsr L_2020

        .byte $27,$29,$20,$27,$29,$04,$08,$24,$26,$20,$20,$20,$20,$24,$26,$08
        .byte $24,$26,$20,$21,$23,$20,$24,$26,$08,$35,$3f,$22,$3e,$26,$20,$24
        .byte $2f,$08,$33,$28,$28,$28,$29,$20,$27,$2e,$04,$08,$27,$28,$28,$40
        .byte $41,$28,$28,$29,$05,$20,$20,$20,$24,$26,$05,$20,$20,$20,$24,$26
        .byte $08,$21,$22,$22,$3e,$3f,$22,$22,$23,$04,$03,$30,$22,$23,$03,$32
        .byte $25,$26,$03,$24,$25,$26,$03,$24,$41,$29,$04,$02,$24,$26,$02,$24
        .byte $26,$08,$35,$3f,$22,$22,$22,$22,$22,$23,$08,$33,$28,$28,$28,$28
        .byte $28,$28,$29,$02,$02,$24,$26,$02,$24,$26,$05,$08,$27,$25,$25,$28
        .byte $28,$28,$28,$29,$04,$30,$25,$25,$2b,$04,$32,$25,$25,$2c,$06,$24
        .byte $2f,$35,$25,$22,$23,$06,$27,$2e,$33,$28,$28,$29,$01,$08,$24,$41
        .byte $28,$28,$28,$28,$28,$29,$02,$02,$24,$26,$02,$27,$29,$01,$08,$27
        .byte $28,$28,$28,$28,$28,$40,$26,$04,$08,$20,$20,$20,$20,$20,$20,$24
        .byte $26,$08,$20,$20,$20,$20,$20,$20,$24,$26,$08,$21,$22,$22,$22,$22
        .byte $22,$3e,$26,$08,$27,$28,$28,$28,$28,$28,$40,$26,$04,$08,$20,$20
        .byte $20,$20,$20,$20,$24,$26,$08,$20,$20,$20,$20,$20,$20,$24,$26,$08
        .byte $21,$22,$22,$22,$22,$22,$3e,$2f,$08,$27,$28,$28,$28,$28,$28,$28
        .byte $2e,$02,$08,$20,$20,$20,$35,$3f,$22

        rol L_0820 + $f,x
        jsr L_2020

        .byte $33,$28,$28,$28,$2e,$04,$08,$35,$25,$2b,$20,$20,$20,$24,$26,$08
        .byte $33,$25,$2c,$20,$20,$20,$24,$26,$08,$21,$25,$3f,$22,$22,$22,$3e
        .byte $2f,$08,$27,$28,$28,$28,$28,$28,$28,$2e,$05,$08,$27,$25,$25,$25
        .byte $41,$28,$40,$26,$08,$30,$25,$25,$25,$26,$20,$24,$26,$08,$32,$25
        .byte $25,$25,$26,$20,$24,$26,$08,$24,$25,$2f,$35,$3f,$22,$3e,$2f,$08
        .byte $27

        plp 
        rol $2833
        plp 
        plp 
        rol L_0800 + $2
        and ($23,x)
        jsr $2230

        .byte $22,$22,$2b,$08,$24,$26,$20,$32,$25,$25,$25,$2c,$02,$08,$35,$3f
        .byte $22,$3e,$2f,$20,$24,$26,$08,$33,$28,$28,$28,$2e,$20,$27,$29,$02
        .byte $08,$20,$20,$20,$20,$20,$20,$21,$23,$08,$20,$20,$20,$20,$20,$20
        .byte $24,$26,$03

        php 
        bmi L_8686 + $5

        .byte $22,$22,$22,$22,$22,$23,$08,$32

        and $25
        and $25
        and $25
        rol $08
        bit $25
        and $25
        and $25
        and $26
        php 
        php 
        jsr $2230

    L_8686:
         .byte $22,$22,$22,$22,$23,$08,$20,$32,$25,$25,$25,$25,$25,$26,$08,$30
        .byte $31,$25,$25,$25,$25,$25,$26,$08,$32,$25,$28,$28,$28,$28,$28,$29
        .byte $03,$35,$25,$2b,$03,$33,$34,$2c,$08,$20,$35,$25,$22,$22,$22,$22
        .byte $23,$08,$20,$33,$28,$28,$28,$28,$28,$29,$04,$02,$24,$26,$02,$24
        .byte $26,$08,$24,$3f,$22,$22,$22,$22,$22,$23,$08,$24,$41,$28,$28,$28
        .byte $28,$28,$29,$08,$08,$21,$22,$22,$23,$21,$22,$22,$23,$08,$27,$28
        .byte $28,$40,$25,$25,$25,$26,$08,$20,$20,$20,$24,$25,$25,$25,$26,$08
        .byte $20,$20,$20,$24,$41,$28,$28,$29,$05,$21,$22,$22,$3e,$26,$05,$24
        .byte $25,$25,$25,$26,$08,$24,$25,$25,$25,$3f,$22,$22,$23,$08,$27

        plp 
        plp 
        and #$27
        plp 
        plp 
        and #$08
        php 
        jsr L_3020

        .byte $22,$22,$22,$22,$23,$08,$20,$20,$32,$25,$25,$25,$25,$26,$08,$21
        .byte $22,$25,$25,$25,$25,$25,$26,$08,$24,$25,$25,$25,$41,$28,$28,$29
        .byte $05,$24,$25,$25,$25,$26,$05,$27,$28,$25,$25,$26,$08,$20,$20,$35
        .byte $25,$3f,$22,$22,$23,$08,$20,$20,$33,$28,$28,$28,$28,$29,$04,$08
        .byte $21,$22,$22,$22,$2b,$20,$21,$23,$08,$24,$25,$25,$25,$2c,$20,$24
        .byte $26,$08,$24,$25,$25,$25,$26,$20,$24,$26,$08,$24,$41,$28,$40,$26
        .byte $20,$24,$26,$02

        php 
        bit $26
        jsr L_3f29 + $c

        .byte $22,$3e,$26,$08,$27,$29,$20,$33,$28,$28,$28,$29,$03,$08,$21,$22
        .byte $22,$22,$22,$22,$22,$2b,$08,$24,$25,$25,$25,$25,$25,$25,$2c,$08
        .byte $24,$25,$25,$25,$25,$25,$25,$26,$02

        php 
        bit $26
        jsr L_3f29 + $c

        .byte $22,$3e,$2f,$08,$27,$29,$20,$33,$28,$28,$28,$2e,$02,$08,$21,$23
        .byte $20,$21,$23,$20,$21,$23,$08,$24,$26,$20,$24,$26,$20,$24,$26,$08
        .byte $08,$20,$20,$20,$21,$22,$22,$22,$2b,$08,$20,$20,$20,$24,$41,$28
        .byte $40,$2c,$08,$21,$22,$22,$3e,$26,$20,$24,$26,$08,$24,$25,$25,$25
        .byte $26,$20,$24,$26,$08,$24,$25,$25,$25,$3f,$22,$3e,$26,$08,$27

        plp 
        plp 
        rti 
        eor ($28,x)
        plp 
        and #$05
        jsr L_2020
        bit $26
        ora $20
        jsr L_2720
        and #$02
        php 
        and ($23,x)
        jsr $2221

        .byte $22,$22,$23,$08,$24,$26,$20,$24,$25,$25,$25,$26,$02,$08,$24,$26
        .byte $20,$24,$25,$25,$25,$26,$08,$24,$26,$20,$24,$41,$28,$40,$26,$06
        .byte $08,$21,$22,$22,$22,$22,$22,$3e,$26,$08,$24,$25,$25,$25,$25,$25
        .byte $25,$26,$08,$24,$25,$25,$25,$25,$25,$25,$26,$08,$27

        plp 
        plp 
        plp 
        plp 
        plp 
        rti 
        rol $08
        jsr L_2020
        jsr L_2020
        bit $26
        php 
        jsr L_2020
        jsr L_2020

        .byte $27,$29,$06,$08,$21,$22,$22,$22,$2b,$20,$24,$26,$08,$24,$25,$25
        .byte $25,$2c,$20,$24,$26,$08,$24,$25,$25,$25,$2a,$2b,$24,$26,$08,$27

        plp 
        plp 
        and $25
        bit L_2624
        php 
        jsr L_2020
        and $25,x
        and $25
        rol $08
        jsr L_2020

        .byte $33

        plp 
        plp 
        plp 
        and #$03
        php 
        bmi L_88d4 + $2

        .byte $22,$23,$21,$22,$22,$2b,$08,$32,$25,$25,$25,$25,$25,$25,$2c,$08
        .byte $24,$25,$25,$25,$25,$25,$25,$26,$02,$08,$35,$3f,$22,$3e,$3f,$22

    L_88d4:
        .byte $3e,$2f,$08,$33

        plp 
        plp 
        plp 
        plp 
        plp 
        plp 
        rol $0504
        jsr L_2020
        and ($23,x)
        ora $20
        jsr L_2420
        rol $05
        jsr L_2020
        bit $26
        ora $20
        jsr L_2720
        and #$02
        php 
        bit $26
        jsr L_2020
        jsr L_2624
        php 
        bit $26
        jsr L_2020
        jsr L_2624

        .byte $04,$03,$86,$83,$80,$03,$88,$85,$82,$03,$5c,$5c,$5c,$03,$5c,$ce
        .byte $cd,$03,$03,$d9,$d6,$d3,$03,$da,$d7,$d4,$03,$db,$d8,$d5,$05,$03
        .byte $58,$55,$54,$03,$58,$55,$54,$03,$58,$56,$54,$03,$58,$56,$54,$03
        .byte $58,$56,$54,$05,$05,$4e,$21,$22,$22,$23,$05,$4f,$24,$25,$25,$26
        .byte $05,$4f,$24,$25,$25,$26,$05,$4f,$27,$28,$28,$29,$05,$50,$4d,$4d
        .byte $4d,$4c,$05,$03,$bf,$bf,$bf,$03,$bf,$25,$bf,$03,$bf,$59,$bf,$03
        .byte $bf,$25,$bf,$03,$bf,$bf,$bf,$08,$01,$bf,$01,$bf,$01,$bf,$01,$bf
        .byte $01,$bf,$01,$bf,$01,$bf,$01,$bf,$01,$08,$21,$22,$22,$3e,$3f,$22
        .byte $3e,$26,$01,$05,$40,$25,$25,$25,$41,$02,$05,$24,$25,$25,$25,$26
        .byte $05,$24,$25,$25,$25,$26,$02,$05,$35,$25,$25,$25,$2f,$05,$33,$28
        .byte $28,$28,$2e,$02,$05,$3d,$25,$25,$25,$39,$05,$3c,$28,$28,$28,$38
        .byte $04,$11,$24,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25
        .byte $25,$25,$26,$11,$24,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25
        .byte $25,$25,$25,$25,$26,$11,$24,$25,$25,$25,$25,$25,$25,$25,$25,$25
        .byte $25,$25,$25,$25,$25,$25,$26,$11,$24,$25,$25,$25,$25,$25,$25,$25
        .byte $25,$25,$25,$25,$25,$25,$25,$25,$26,$01,$0d,$21,$22,$22,$22,$22
        .byte $22,$22,$22,$22,$22,$22,$22,$23,$02,$07,$24,$25,$25,$25,$25,$25
        .byte $26,$07,$24,$25,$25,$25,$25,$25,$26,$06,$07,$3d,$25,$25,$25,$25
        .byte $25,$39,$07,$3c,$34,$25,$25,$25,$2d,$38,$06,$20,$3d,$25,$25,$25
        .byte $39,$06,$20,$3c,$34,$25,$2d,$38,$05,$20,$20,$3d,$25,$39,$05,$20
        .byte $20,$3c,$28,$38,$01,$0d,$27,$28,$28,$28,$28,$28,$28,$28,$28,$28
        .byte $28,$28,$29,$01,$06,$bf,$bf,$bf,$bf,$bf,$bf,$01,$07,$27,$28,$28
        .byte $28,$28,$28,$40,$08,$01,$26,$01,$26,$01,$26,$01,$26,$01,$26,$01
        .byte $26,$01,$26,$01,$26,$08,$01,$24,$01,$24,$01,$24,$01,$24,$01,$24
        .byte $01,$24,$01,$24,$01,$24,$03,$03,$5d,$5c,$5f,$03,$5e,$5b,$5f,$03
        .byte $5e,$61,$60,$05,$05,$41,$28,$28,$28,$40,$05,$26,$20,$20,$20,$24
        .byte $05,$26,$20,$20,$20,$24,$05,$26,$20,$20,$20,$24,$05,$3f,$22,$22
        .byte $22,$3e,$01,$11,$24,$25,$25,$25,$25,$25,$3f,$22,$22,$22,$3e,$25
        .byte $25,$25,$25,$25,$26,$04,$03,$ec,$8b,$89,$03,$ed,$8c,$8a,$03,$ee
        .byte $f0,$f2,$03,$ef,$f1,$f3,$03,$04,$20,$8f,$8e,$8d,$03,$20,$f5,$f4
        .byte $03,$f8,$f6,$f7,$05,$03,$6f,$6f,$6f,$03,$58,$55,$54,$03,$58,$6f
        .byte $54,$03,$58,$55,$54,$03,$58,$6f,$54,$07,$06,$6d,$69,$69,$69,$69
        .byte $6b,$06,$6a,$25,$25,$25,$25,$6a,$06,$6a,$25,$66,$63,$25,$6a,$06
        .byte $6a,$25,$67,$64

        and $6a
        asl $6a
        and $68
        adc $25
        ror 
        asl $6a
        and $25
        and $25
        ror 
        asl $6e
        adc #$69
        adc #$69
        jmp ($0107)

        .byte $dc,$01,$dd,$01,$dd,$01,$dd,$01,$dd,$01,$dd,$01,$de,$01,$07,$e1
        .byte $e0,$e0,$e0,$e0,$e0,$df,$07,$01,$dc,$01,$dd,$01,$dd,$01,$e2,$01
        .byte $dd,$01,$dd,$01,$de,$01,$07,$e1,$e0,$e0,$e2,$e0,$e0,$df,$05,$01

    L_8b68:
        .byte $dd,$01,$dd,$01,$dd,$01,$dd,$01,$dd,$01,$05,$e0,$e0,$e0,$e0,$e0
        .byte $03,$01,$dd,$01,$ea,$01,$dd,$01,$03,$e0,$e7,$e0,$03,$01,$dd,$01
        .byte $e8,$01,$dd,$01,$03,$e0,$e9,$e0,$03,$01,$dc,$01,$dd,$01,$dd,$01
        .byte $03,$e0,$e0,$df,$03,$01,$dd,$01,$dd,$01,$de,$01,$03,$e1,$e0,$e0
        .byte $02,$10,$20,$a9,$ab,$af

        tax 
        tay 
        jsr L_2020
        jsr L_a91f + $1

        .byte $ab,$af

        tax 
        tay 
        bpl $8bdc
        lda ($a3,x)
        tsx 
        ldx #$a0
        jsr L_2020
        jsr L_a115 + $b

        .byte $a3,$ba,$a2,$a0,$02

        bpl L_8bea + $4
        lda $a7
        lda L_a499 + $d,y
        jsr L_2020
        jsr L_a519 + $7

        .byte $a7

        lda L_a499 + $d,y
        bpl $8bff
        lda ($a3,x)
        tsx 
        ldx #$a0
        jsr L_2020
        jsr L_a115 + $b

    L_8bea:
         .byte $a3,$ba,$a2,$a0,$04,$01,$bc,$04,$20,$20,$20,$be,$01,$20,$03

        jsr L_9d1c + $4

        .byte $04,$02

        jsr $019e
        jsr L_bbf8 + $9

        .byte $04

        jsr L_2020

        .byte $bb,$04,$03,$20,$20,$bc,$01,$9f,$01,$20,$02

        jsr $04bb

        .byte $04,$20,$20,$20,$9d,$03,$20,$20,$bb,$01,$bc,$02,$20,$bd,$02,$11
        .byte $86,$83,$80,$86,$83,$80,$25,$25,$25,$25,$5c,$86,$83,$80,$86,$83
        .byte $80,$11,$88,$85,$82,$88,$85,$82,$25,$25,$25,$25,$5c,$88,$85,$82
        .byte $88,$85,$82,$02,$11,$86,$83,$80,$86,$83,$80,$86,$83,$80,$86,$83
        .byte $80,$25,$25,$25,$25,$26,$11,$88,$85,$82,$88,$85,$82,$88,$85,$82
        .byte $88,$85,$82,$25,$25,$25,$25,$26,$02,$11,$24,$25,$25,$25,$5c,$86
        .byte $83,$80,$86,$83,$80,$86,$83,$80,$86,$83,$80,$11,$24,$25,$25,$25
        .byte $5c,$88,$85,$82,$88,$85,$82,$88,$85,$82,$88,$85,$82,$03,$11,$24
        .byte $25,$25,$5c,$86,$80,$25,$25,$25,$25,$5c,$86,$80,$25,$25,$25,$26
        .byte $11,$24,$25,$25,$5c,$87,$81,$25,$25,$25,$25,$5c,$87,$81,$25,$25
        .byte $25,$26,$11,$24,$25,$25,$5c,$88,$82,$25,$25,$25,$25,$5c,$88,$82
        .byte $25,$25,$25,$26,$03,$11,$24,$25,$25,$25,$25,$25,$25,$25,$25,$5c
        .byte $86,$80,$25,$25,$25,$25,$26,$11,$24,$25,$25,$25,$25,$25,$25,$25
        .byte $25,$5c,$87,$81,$25,$25,$25,$25,$26,$11,$24,$25,$25,$25,$25,$25
        .byte $25,$25,$25,$5c,$88,$82,$25,$25,$25,$25,$26,$03,$11,$24,$25,$25
        .byte $25,$5c,$86,$80,$25,$25,$25,$25,$25,$25,$25,$25,$25,$26,$11,$24
        .byte $25,$25,$25,$5c,$87,$81,$25,$25,$25,$25,$25,$25,$25,$25,$25,$26
        .byte $11,$24,$25,$25,$25,$5c,$88,$82,$25,$25,$25,$25,$25,$25,$25,$25
        .byte $25,$26,$02,$01,$cb,$01,$cc,$01,$07,$21,$22,$22,$22,$22,$22,$3e
        .byte $01,$07,$3f,$22,$22,$22,$22,$22,$23,$01,$07,$41,$28,$28,$28,$28
        .byte $28,$29,$01,$07,$21,$22,$22,$22,$22,$22,$23

        ora #$0a
        jsr L_2020
        bmi L_8d81 + $9

        .byte $22,$22,$22,$22,$2b

        asl 
        jsr L_2020

        .byte $32,$25,$25,$25,$25,$25,$2c,$0b,$20,$20,$30,$31,$25,$25,$25,$25

    L_8d81:
        .byte $25,$2a,$2b,$0b,$20,$20,$32,$25,$25,$25,$25,$25,$25,$25,$2c,$0c

    L_8d91:
        .byte $20,$30,$31,$25,$25,$25,$25,$25,$25,$25,$2a,$2b,$0c,$20,$32,$25
        .byte $25,$25,$25,$25,$25,$25,$25,$25,$2c,$0d,$30,$31,$25,$25,$25,$25
        .byte $25,$25,$25,$25,$25,$2a,$2b,$0d,$32,$25,$25,$25,$25,$25,$25,$25
        .byte $25,$25,$25,$25,$2c,$0d,$31,$25,$25,$25,$25,$25,$25,$25,$25,$25
        .byte $25,$25,$2a,$09,$0d,$34,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25
        .byte $25,$2d,$0d,$35,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$2f
        .byte $0d,$33,$34,$25,$25,$25,$25,$25,$25,$25,$25,$25,$2d,$2e,$0c,$20
        .byte $35,$25,$25,$25,$25,$25,$25,$25,$25,$25,$2f,$0c,$20,$33,$34,$25
        .byte $25,$25,$25,$25,$25,$25,$2d,$2e,$0b,$20,$20,$35,$25,$25,$25,$25
        .byte $25,$25,$25,$2f,$0b

        jsr L_3315 + $b

        .byte $34

        and $25
        and $25
        and $2d
        rol L_200a
        jsr $3520
        and $25
        and $25
        and $2f
        asl 
        jsr L_2020

        .byte $33,$28,$28,$28,$28,$28,$2e,$02,$04,$5c,$5c,$5c,$d1,$04,$cd,$5c
        .byte $ce,$d2,$02,$03,$5c,$5c,$c9,$03,$cd,$ce,$ca,$04,$04,$5c,$86,$83
        .byte $80,$04,$5c,$88,$85,$82,$04,$5c,$5c,$5c,$5c,$04,$cd,$5c,$ce,$cd
        .byte $02,$01,$5c,$01,$5c,$05,$03,$9d,$9d,$9d,$03,$9d,$9e,$9d,$03,$9d
        .byte $9e,$9d,$03,$9d,$9e,$9d,$03,$9d,$9d,$9d,$01,$07,$27,$28,$28,$28
        .byte $28,$28,$29,$08,$01,$20,$01,$20,$01,$20,$01,$20,$01,$20,$01,$20
        .byte $01,$20,$01,$20,$0f

        php 
        jsr L_2020
        jsr L_3020

        .byte $22,$2b,$08,$20,$20,$20,$20,$20,$32,$25,$2c,$09,$20,$20,$20,$20
        .byte $30,$31,$25,$2a,$2b

        ora #$20
        jsr L_2020

        .byte $32

        and $25
        and $2c
        asl 
        jsr L_2020
        bmi L_8efa + $8

        .byte $3a,$22,$36,$2a,$2b

        asl 
        jsr L_2020

        .byte $32,$25,$3b,$25,$37,$25,$2c,$0a,$20,$20,$20,$24,$25,$27,$28,$29
        .byte $25,$26,$0d,$ac,$20,$20,$24,$25,$25,$25,$25,$25,$26,$20,$20,$ac

    L_8efa:
        .byte $0d,$ad,$20,$20,$24,$25,$25,$25,$25,$25,$26,$20,$20,$ad,$0d,$ad

    L_8f0a:
        .byte $21,$ff,$24,$9d,$cb,$ac,$25,$9d,$26,$22,$23,$ad,$0d,$ad,$24,$cc
        .byte $24,$25,$cc,$ad,$25,$25,$26,$25,$26,$ad,$0d,$ad,$27,$5c,$24,$9d
        .byte $5c

        lda L_9d1c + $9
        rol $28
        and #$ad
        ora L_20ae
        jsr $2827

        .byte $5c

        ldx L_2828
        and #$20
        jsr $09ae
        jsr L_2020
        jsr L_524e + $5

        .byte $52,$52,$51,$09,$20,$20,$20,$20,$27,$28,$28,$28,$29,$00,$02,$0c
        .byte $30,$30,$00,$08,$28,$30,$4d,$1e,$17,$10,$1c

        ora $170e,x
        plp 
        bmi L_8f98

        .byte $ff,$02,$0c

        bmi L_8f9a + $3
        bmi L_8f6f
    L_8f6f:
        ora #$28
        bmi L_8f7d + $c

        .byte $1b,$12

        ora $1718
        plp 
        bmi L_8fa5 + $6
        bmi L_8fa5 + $8

    L_8f7d:
         .byte $ff,$02,$0c,$30,$30,$01,$00,$28,$30,$44,$0a,$15,$15,$12,$1c

        ora $2818,x
        bmi L_8fc1

        .byte $ff,$02,$0c

        bmi $8f97
        ora ($28,x)
    L_8f98:
        bmi $8fe7

    L_8f9a:
         .byte $1b,$12,$2e,$0a,$15,$15,$18,$22

        plp 
        bmi L_8fcb + $a

    L_8fa5:
         .byte $ff,$02,$0c,$30,$01,$02,$28,$30,$4a,$1e,$0a,$0d,$42,$12

        asl $2842,x
        bmi $8fb7

        .byte $02,$0c

        bmi L_8fe8 + $4
        ora ($03,x)
        plp 
        bmi L_8ff1 + $e

    L_8fc1:
         .byte $1b,$10,$18,$17,$12

        ora $280e,x
        bmi L_8ff1 + $a

    L_8fcb:
         .byte $ff,$02,$0c,$30,$01,$04,$28,$30,$40,$0a,$15,$0a,$0c,$1d,$12,$1e
        .byte $42

        plp 
        bmi $8fde

        .byte $02,$0c

        bmi L_9011 + $2
        ora ($05,x)
        plp 
        bmi L_9031 + $5

    L_8fe8:
         .byte $1b,$12,$0d,$12,$1e,$42

        plp 
        bmi L_9021

    L_8ff1:
         .byte $ff,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$05
        .byte $5c,$5c,$04,$02,$5c,$06,$5c,$5c,$5c,$06,$5c,$07,$0c,$08,$08,$08

    L_9011:
        .byte $08,$08,$08,$02,$5c,$04,$0c,$08,$08,$08,$08,$08,$08,$02,$5c,$06

    L_9021:
        .byte $06,$06,$06,$06,$06,$5c,$09,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a

    L_9031:
        .byte $0a,$0a,$0a,$0a,$0a,$0a,$0b

        jsr L_2020
        jsr L_2020
        jsr $0520

        .byte $5c,$5c,$5c,$5c,$5c,$5c,$5c,$04,$0e,$0f,$0f,$0f,$0f,$0f,$0f,$05
        .byte $06,$06,$06,$06,$06,$06,$06,$06,$07,$0e,$0f,$0f,$0f,$0f,$0f,$02
        .byte $5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$07,$0e,$0f,$0f,$0f,$05,$5c

    L_9071:
        .byte $07,$0e,$0f,$0f,$0f,$02,$5c,$06,$06,$06,$06,$06,$06,$06,$04,$7a
        .byte $7b,$7b,$7b,$7b,$02,$03,$03,$04,$7a,$7b,$7b,$7b,$7b,$02,$5c,$5c
        .byte $5c,$5c,$5c,$5c,$5c,$07,$00,$98,$44,$0d,$8e,$55,$13,$94,$58,$1f
        .byte $a0,$58,$1f,$88,$7b,$1d,$a2,$7b,$1e,$96,$7b,$18,$90,$7b,$18,$8e
        .byte $96,$14,$8e,$a5,$54,$a0,$a5,$54,$8a,$aa,$11,$8a,$af,$11,$8a,$b4
        .byte $53,$9e,$aa,$11,$9e,$af,$11,$9e,$b4,$53,$8a,$ae,$19,$8a,$b2,$19
        .byte $9e,$ab,$19,$94,$a5,$52,$88,$d1,$1d,$8e,$d1,$16,$94,$d1,$16,$9a
        .byte $d1,$16,$8e,$d5,$11,$8e,$da,$11,$8e,$df,$11,$8e,$e4,$53,$86,$d5
        .byte $56,$86,$dd,$56,$92,$dd,$56,$96,$e5,$55,$9a,$d6,$54,$86,$e2,$56
        .byte $8e,$d7,$19,$8e,$df,$19,$a0,$dd,$10,$a0,$e4,$10,$8a,$44,$10,$9e
        .byte $44,$10,$9b,$00,$13,$9b,$03,$13,$95,$03,$13,$95,$06,$14,$89,$12
        .byte $13,$93,$29,$15,$99,$29,$16,$9f,$29,$16,$a3,$29,$51,$8b,$30,$11
        .byte $8b,$35,$11,$8b,$3a,$11,$8b,$3f,$11,$8b,$44,$11,$8b,$49,$53,$95
        .byte $30,$11,$95,$35,$11,$95,$3a,$11,$95,$3f,$11,$95,$44,$11,$95,$49
        .byte $53,$9f,$30,$11,$9f,$35,$11,$9f,$3a,$11,$9f,$3f,$11,$9f,$44,$11
        .byte $9f,$49,$53,$8b,$2d,$19,$95,$2d,$19,$9f,$2d,$19,$8b,$37,$19,$8b
        .byte $45,$19,$95,$39,$19,$95,$4a,$19,$9f,$3d,$19,$91,$5e,$15,$9d,$5e
        .byte $15,$9b,$75,$13,$91,$a8,$6b,$91,$a7,$61,$91,$af,$61,$85,$a8,$56
        .byte $99,$ac,$11,$8e,$5b,$1f,$8e,$5e,$1f,$8e,$64,$14,$92,$46,$1c,$95
        .byte $81,$14,$85,$a7,$56,$99,$a7,$11,$99,$bb,$53,$99,$b1,$11,$99,$b6
        .byte $11,$89,$b2,$68,$8f,$a2,$69,$93,$b2,$68,$99,$a2,$6a,$8d,$ba,$65
        .byte $9d,$a2,$56,$9d,$aa,$56,$9d,$b2,$56,$9d,$b8,$56,$91,$b8,$56,$91
        .byte $b7,$61,$8b,$af,$56,$8f,$b7,$61,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$05,$5c,$5c,$02,$5c,$5c,$5c,$5c,$04
        .byte $0c,$02,$5c,$5c,$5c,$5c,$5c,$06,$06,$06,$06,$06,$06,$06,$06,$03
        .byte $06,$06,$06,$06,$06,$06,$04,$0c,$08,$08,$08,$08,$02,$5c,$5c,$5c
        .byte $5c,$5c,$5c,$5c,$5c,$09,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$67,$5c
        .byte $5c,$09,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$67,$04,$0c
        .byte $08,$08,$08,$02,$04,$0c,$08,$08,$08,$02,$04,$0c,$08,$08,$08,$05
        .byte $06,$06,$06,$06,$07,$0c,$05,$06,$06,$06,$06,$04,$7a,$7b,$7b,$7b
        .byte $7b,$7b,$7b,$02,$5c,$5c,$5c,$5c,$5c,$5c,$04,$7a,$7b,$7b,$02,$5c
        .byte $5c,$5c,$5c,$5c,$5c,$07,$0e,$0f,$0f,$0f,$0f,$0f,$0f,$05,$5c,$5c
        .byte $5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$07,$00,$98,$44
        .byte $0d,$a0,$45,$10,$8a,$45,$10,$8a,$4e,$14,$96,$4d,$54,$96,$52,$54
        .byte $96,$57,$54,$a0,$4d,$11,$a0,$52,$11,$a0,$57,$11,$a0,$5a,$19,$88
        .byte $53,$6c,$a0,$51,$19,$88,$63,$1d,$8e,$63,$16,$94,$68,$65,$8a,$67
        .byte $56,$94,$6f,$61,$a0,$6f,$61,$a0,$68,$56,$a0,$63,$56,$88,$72,$13
        .byte $9c,$63,$7f,$9c,$67,$7c,$8e,$81,$52,$94,$94,$14,$94,$ae,$10,$94
        .byte $b5,$10,$94,$bc,$55,$94,$c3,$10,$8a,$ac,$11,$8a,$b1,$11,$8a,$b6
        .byte $11,$8a,$bb,$11,$8a,$c0,$11,$8a,$c5,$11,$8a,$ca,$11,$8a,$cf,$11
        .byte $8a,$d4,$11,$8a,$d9,$11,$8a,$de,$11,$8a,$e3,$53,$9e,$ac,$11,$9e
        .byte $b1,$11,$9e,$b6,$11,$9e,$bb,$11,$9e,$c0,$11,$9e,$c5,$11,$9e,$ca
        .byte $11,$9e,$cf,$11,$9e,$d4,$11,$9e,$d9,$11,$9e,$de,$11,$9e,$e3,$53
        .byte $8a,$b0,$19,$8a,$ba,$19,$8a,$c4,$19,$8a,$c9,$19,$8a,$d5,$19,$9e

    L_9331:
        .byte $b2,$19,$9e,$b9,$19,$9e,$bf,$19,$9e,$c9,$19,$9e,$e2,$19,$96,$d9
        .byte $15,$9f,$40,$15,$a3,$40,$51,$9f,$51,$15,$a3,$51,$51,$a1,$44,$18
        .byte $a1,$47,$18,$a1,$4a,$18,$93,$3f,$55,$8f,$44,$56,$8f,$4c,$56,$8b
        .byte $3e,$11,$8b,$43,$11,$8b,$48,$11,$8b,$4d,$11,$8b,$52,$19,$8b,$42
        .byte $19,$93,$45,$76,$93,$48,$72,$93,$4b,$78,$99,$49,$79,$97,$5e,$69
        .byte $97,$64

        adc #$97
        ror 
        adc #$97
        bvs L_93ef + $4

    L_938a:
         .byte $97,$76,$69,$8b,$60,$65,$8b,$68,$10,$9f,$5e,$11,$9f,$63,$11,$9f
        .byte $68,$11,$9f,$6d,$11,$9f,$72,$53,$9f,$5f

        ora L_6792 + $d,y
        ora L_6e9c + $3,y
        ora L_6e7c + $f,y
        bpl L_9331 + $9

        .byte $89,$6a,$8b,$8e,$11,$8b,$93,$11,$8b,$98,$11,$8b,$9d,$11,$8b,$a2
        .byte $11,$8b,$a7,$11,$8b,$aa,$53,$8f,$89,$56,$8f,$91,$56,$8f,$a0,$56
        .byte $8f,$a1,$56,$8f,$a9,$56,$9b,$b0,$61,$a1,$b0,$61,$9d,$99,$6b,$99
        .byte $90,$68,$99,$a7,$68,$9f,$8f,$14,$97,$c7,$58,$97,$c8,$59,$97,$ca

    L_93ef:
        .byte $5a,$95,$b2,$11,$95,$b7,$11,$95,$bc,$11,$95,$c1,$11,$95,$c6,$53
        .byte $95,$b7,$19,$8b,$ba,$65,$a1,$bc,$54,$a1,$b6,$54,$92,$46,$1a,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$05,$5c,$5c,$06,$06,$06,$06
        .byte $5c,$5c,$07,$0c,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$05,$5c
        .byte $09,$0a,$0a,$0a,$67,$5c,$5c,$5c,$09,$0a,$0a,$0a,$0a,$0a,$0a,$0a
        .byte $0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0b,$20,$20,$20,$20,$20,$20,$20

    L_944f:
        .byte $20,$0c,$08,$08,$08,$08,$08,$08,$08,$05,$5c,$06,$06,$06,$5c,$5c
        .byte $5c,$06,$06,$06,$06,$06,$06,$06,$06,$07,$0e,$0f,$0f,$0f,$02,$5c
        .byte $04,$0e,$0f,$0f,$0f,$02,$5c,$04,$0e,$0f,$0f,$0f,$02,$5c,$04,$0e
        .byte $0f,$0f,$0f,$02,$5c,$06,$5c,$5c,$5c,$5c,$04,$7a,$7b,$7b,$7b,$7b
        .byte $7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$02,$5c,$5c,$5c
        .byte $5c,$5c,$5c,$5c,$5c,$04,$0c,$08,$08,$02,$5c,$5c,$5c,$5c,$5c,$5c
        .byte $5c,$5c,$5c,$5c,$07,$00,$98,$44,$0d,$8e,$4c,$14,$94,$58,$1f,$94
        .byte $5b,$1f,$9a,$5b,$1f,$a0,$5b,$13,$94,$5e,$13,$8a,$7e,$11,$8a,$83
        .byte $11,$8a,$88,$11,$8a,$8d,$11,$8a,$92,$11,$8a,$97,$11,$8a,$9c,$11
        .byte $8a,$a1,$53,$9e,$7e,$11,$9e,$83,$11,$9e,$88,$11,$9e,$8d,$11,$9e
        .byte $92,$11,$9e,$97,$11,$9e,$9c,$11,$9e,$a1,$53,$94,$7c,$55,$96,$88
        .byte $54,$98,$8e,$54,$8a,$81,$19,$8a,$8e,$19,$8a,$97,$19,$8a,$9c,$19
        .byte $9e,$80,$19,$9e,$8a,$19,$9e,$91,$19,$9e,$b5,$5d,$9e,$b6,$60,$96
        .byte $c9,$66,$a0,$d5,$65,$8e,$d8,$52,$8e,$db,$1f,$8e,$de,$1f,$8e,$e1
        .byte $1f,$a0,$d9,$61,$96,$da,$56,$a0,$e2,$61,$a0,$dd,$68,$89,$09,$1d
        .byte $a3,$09,$1e,$89,$17,$1d,$a3,$17,$1e,$89,$25,$1d,$a3,$25,$1e,$95
        .byte $37,$14,$9f,$3d,$5d,$9f,$3e,$64,$87,$3e,$63,$9f,$46,$60,$9d,$3e
        .byte $18,$9d,$44,$18,$8b,$44,$18,$8b,$3e,$18,$86,$46,$18,$a0,$46,$18
        .byte $95,$41,$52,$97,$70,$15,$97,$8a,$15,$97,$79,$69,$97,$82,$69,$8b
        .byte $6f,$11,$8b,$74,$11,$8b,$79,$11,$8b,$7e,$11,$8b,$83,$11,$8b,$88
        .byte $53,$9f,$6f,$11,$9f,$74,$11,$9f,$79,$11,$9f,$7e,$11,$9f,$83,$11
        .byte $9f,$88,$53,$8b,$72,$19,$8b,$7a,$19,$8b,$83,$19,$8b,$89,$19,$9f
        .byte $70,$19,$9f,$79,$19,$9f,$86,$19,$89,$9e,$1d,$8f,$9e,$16,$8b,$97
        .byte $65,$8f,$96,$56,$a1,$a2,$5e,$a1,$a4,$64,$a1,$ac,$64,$95,$a8,$6b
        .byte $a1,$b4,$5e,$a1,$b6,$5e,$a1,$b8,$5e,$95,$a3,$88,$a1,$ba,$5f,$89
        .byte $a4,$63,$89,$ac,$63,$95,$b3,$89,$a1,$a0,$5e,$a1,$9e,$5e,$a1,$9c
        .byte $5e,$a1,$9a,$5e,$a1,$98,$5e,$9d,$98,$6a,$9d,$9d,$11,$9d,$a2,$11
        .byte $9d,$a7,$11,$9d,$aa,$11,$9d,$af,$11,$9d,$b4,$11,$9d,$b8,$53,$8d
        .byte $b8,$14,$a1,$97,$8a,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$05,$5c,$5c,$5c,$02,$5c,$5c,$06,$06,$06,$06,$06,$5c,$5c,$80
        .byte $83,$83,$83,$83,$83,$83,$80,$5c,$5c,$5c,$5c,$81,$84,$84,$84,$84
        .byte $84,$84,$84,$84,$5c,$5c,$5c,$5c,$5c,$82,$85,$85,$85,$85,$85,$85

    L_964f:
        .byte $85,$85,$82,$5c,$5c,$04,$0c,$08,$08,$08,$08,$08,$08,$05,$06,$06
        .byte $06,$03,$80,$83,$5c,$5c,$5c,$5c,$09,$0a,$0a,$0a,$67,$5c,$5c,$5c
        .byte $5c,$5c,$09,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0b,$20,$20,$20
        .byte $20,$20,$20,$05,$06,$06,$06,$06,$06,$06,$06,$07,$0e,$0f,$0f,$0f
        .byte $02,$5c,$04,$0e,$0f,$0f,$0f,$05,$5c,$82,$85,$85,$85,$85,$5c,$5c
        .byte $5c,$81,$84,$84,$84,$84,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$04,$00,$98
        .byte $46,$0d,$9e,$48,$10,$8a,$48,$10,$94,$41,$14,$9a,$56,$1f,$94,$56
        .byte $1f,$8e,$56,$1f,$94,$53,$1f,$94,$68,$13,$8e,$62,$65,$8e,$70,$86
        .byte $88,$72,$8d,$a2,$70,$51,$88,$84,$1d,$8e,$84,$8f,$9e,$84,$15,$a2
        .byte $84,$51,$96,$96,$51,$9c,$96,$51,$a2,$96,$51,$90,$b0,$8e,$88,$c4
        .byte $1d,$8c,$c4,$51,$92,$c4,$51,$94,$c6,$90,$9a,$c4,$86,$88,$de,$1d
        .byte $8c,$de,$51,$92,$de,$51,$9a,$de,$8f,$8f,$0a,$8e,$9d,$0a,$8e,$89
        .byte $07,$8d,$a3,$05,$51,$89,$8a,$8d,$8d,$88,$51,$93,$88,$51,$95,$8a
        .byte $90,$9b,$96,$8e,$97,$a2,$51,$9d,$a2,$51,$a3,$a2,$51,$91,$b0,$8e
        .byte $8f,$05,$86,$9b,$88,$86,$86,$78,$6c,$9e,$78,$6c,$94,$6c,$11,$94

    L_973f:
        .byte $71,$11,$94,$76,$11,$94,$7b,$11,$94,$80,$11,$94,$85,$53,$94,$71

    L_974f:
        .byte $19,$94,$7b,$19,$9e,$8c,$55,$98,$90,$61,$90,$90,$61,$86,$91,$56
        .byte $86,$99,$56,$8e,$89,$54,$86,$a1,$56,$86,$a9,$56,$86,$b1,$56,$86

    L_976f:
        .byte $b9,$56,$a0,$9c,$11,$a0,$a1,$11,$a0,$a6,$11,$a0,$ab,$11,$a0,$b0
        .byte $11,$a0,$b5,$11,$a0,$ba,$11,$a0,$bf,$11,$a0,$c4,$11,$a0,$c9,$11

    L_978f:
        .byte $a0,$ce,$11,$a0,$d3,$11,$a0,$d8,$11,$a0,$dd,$11,$a0,$e2,$53,$a0
        .byte $a1,$19,$a0,$ae,$19,$a0,$b4,$19,$a0,$bf,$19,$a0,$ca,$19,$9a,$9c
        .byte $54

        txs 
        ldy $54
        txs 
        ldy L_944f + $5
        ldx $14,y
        bcc L_976f + $6

    L_97bb:
         .byte $7f,$8a,$c9,$10,$8a,$cf

        bpl L_973f + $e
        cmp $10,x
        bcc L_978f + $1
        bpl L_974f + $a

        .byte $cf,$10,$90,$d5,$10,$a0,$fe,$65,$8b,$0d,$11,$9f,$0d,$11,$8b,$12
        .byte $11,$9f,$12,$11,$8b,$17,$11,$9f,$17,$11,$8b,$1c,$11,$9f,$1c,$11
        .byte $8b,$21,$11,$9f,$21,$11,$8b,$26,$11,$9f,$26,$11,$8b,$2b,$11,$9f
        .byte $2b

        ora ($8b),y
        bmi L_980f

        .byte $9f,$30,$11,$8b,$35,$11,$9f,$35,$11,$8b,$3a,$53,$9f,$3a,$53,$8b
        .byte $14

    L_980f:
        ora L_238b,y
        ora L_298b,y
        ora L_317e + $d,y
        ora L_0f9f,y
        ora L_169f,y
        ora L_239f,y
        ora L_2a9f,y
        ora L_1095,y
        bpl L_97bb + $5

        .byte $23,$69,$97,$29,$69,$97,$2f

        adc #$9b
        rts 

        .byte $14,$89,$74,$18,$9f,$74,$18,$8f,$5a,$13,$9b,$85,$6d,$a1,$85,$79
        .byte $89,$84,$14,$9f,$85,$75,$9d,$86,$70,$9d,$8b,$70,$9d,$90,$70,$9d
        .byte $95,$70,$9d,$9a,$78,$89,$95,$6a,$89,$95,$6a,$89,$9a,$11,$89,$9f
        .byte $11,$89,$a4,$11,$89,$a9,$11,$89,$ae,$11,$89,$b3,$11,$89,$b8,$11
        .byte $89,$bd,$11,$89,$c2,$11,$89,$c7,$53,$97,$99,$6b,$a1,$a8,$68,$97
        .byte $a8,$68,$a1,$b0,$68,$a1,$b8,$68,$a1,$c0,$68,$a1,$c8,$68,$93,$94
        .byte $18,$93,$90,$18,$93,$8c,$18,$99,$cc,$58,$99,$cd,$59,$99,$cf,$59
        .byte $99,$d1,$5a,$97,$af,$11,$97,$b4,$11,$97,$b9,$11,$97,$be,$11,$97
        .byte $c3,$11,$97,$c8,$11,$97,$cd,$53,$97,$b7,$19,$97,$bf,$19,$91,$c9
        .byte $65,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

        jsr L_2020
        jsr L_5bfd + $8

        .byte $5c,$04,$7a,$02,$5c,$06,$06,$06,$06,$06,$5c,$07

        jsr L_2020
        jsr L_0800 + $c
        php 
        php 
        php 
        php 
        php 
        php 
        jsr L_2020
        jsr $0705
        jsr L_2020
        jsr L_0800 + $c
        php 
        php 
        php 
        php 
        php 
        php 
        jsr L_2020
        jsr L_5bfd + $8

        .byte $5c,$5c,$5c,$09,$0a,$0a,$0a,$67,$5c,$5c,$5c,$5c,$5c,$5c,$09,$0a
        .byte $0a,$0a,$0a,$0a,$0a,$0a,$0a,$0b

        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr $0705
        jsr L_2020
        jsr L_0f0e

        .byte $0f,$0f,$0f,$0f,$02,$5c,$04,$0e,$0f,$0f,$0f,$0f,$0f,$20,$20,$20
        .byte $20,$05,$06,$06,$06,$06,$06,$07

        jsr L_2020
        jsr L_0f0e

        .byte $0f,$02,$04,$0e,$0f,$0f,$02,$04

        asl L_0f0f
        jsr L_2020
        jsr L_5bfd + $8

    L_995f:
         .byte $5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$04
        .byte $00,$9e

        rti 

        .byte $8b,$9e,$72,$8c,$9e,$8b,$8b,$9e,$9a,$8c,$9e,$b3,$8b,$9f,$05,$8b
        .byte $9f,$14,$8c,$9f,$3b,$8b,$9f,$59,$8c,$9f,$78,$8b,$98,$45,$0d,$94
        .byte $41,$65,$88,$4d,$10,$94,$4d,$10,$a0,$4d,$10,$8e,$5f,$13,$94,$68
        .byte $13,$a0,$65,$13,$8e,$6b,$14,$8e,$6e,$1f,$94,$6e,$52,$a0,$6e,$18
        .byte $9e,$70,$18,$9c,$72,$18,$9a,$74,$18,$98,$76,$18,$94,$8e,$15,$90
        .byte $92,$15,$8c,$96,$15,$9c,$94,$55,$94,$97,$1f,$94,$9a,$1f,$94,$9d
        .byte $1f

        sty $b6,x
        bpl L_995f + $c

        .byte $c3,$10,$8a,$c0,$11,$8a,$c5,$11,$8a,$ca,$11,$8a,$cf,$11,$8a,$d4
        .byte $11,$8a,$d9,$11,$8a,$de,$11,$8a,$e3,$11,$8a,$e8,$11,$8a,$ed,$11
        .byte $8a,$f2,$53,$9e,$c0,$11,$9e,$c5,$11,$9e,$ca,$11,$9e,$cf,$11,$9e
        .byte $d4,$11,$9e,$d9,$11,$9e,$de,$11,$9e,$e3,$11,$9e,$e8,$11,$9e,$ed
        .byte $11,$9e,$f2,$53,$8a,$c2,$19,$8a,$ce,$19,$8a,$d5,$19,$8a,$e2,$19
        .byte $9e,$c0,$19,$9e,$ca,$19,$9e,$d6,$19,$96,$d5,$69,$96,$da,$69,$96
        .byte $df,$69,$96,$e4,$69,$96,$e9,$69,$99,$08,$8a,$99,$09,$64,$99,$0e
        .byte $64,$8d,$09,$63,$8d,$0e,$63,$99,$16,$5f,$95,$09,$11,$95,$0e,$11
        .byte $95,$13,$53,$95,$0a,$19,$89,$2a,$1d,$a3,$2a,$1e,$8b,$0f,$14,$9b
        .byte $44,$14,$95,$44,$13,$8f,$44,$1f,$95,$41,$1f,$8f,$56,$1f,$95,$56
        .byte $13,$9b,$56,$1f,$95,$59,$52,$95,$7c,$6a,$95,$81,$11,$95,$86,$11
        .byte $95,$8b,$11,$95,$90,$11,$95,$95,$11,$95,$9a,$11,$95,$9f,$11,$95
        .byte $a4,$11,$95,$a9,$53,$8f,$90,$6b,$8d,$7f,$56,$8d,$87,$56,$8f,$8f
        .byte $61,$8f,$97,$61,$8d,$98,$56,$8d,$a0,$56,$8d,$a8,$56,$9d,$7f,$55
        .byte $99,$84,$56,$99,$8c,$56,$99,$94,$56,$99,$98,$56,$99,$a0,$56,$99
        .byte $a8,$56,$8b,$86,$68,$8b,$a0,$68,$8b,$a8,$68,$8b,$b0,$68,$8b,$b8
        .byte $68,$8b,$c0,$68,$93,$b3,$10,$93,$b9,$10,$99,$b3,$10,$99,$b9,$10
        .byte $9f,$b3,$10,$9f,$b9,$10,$9d,$ab,$55,$a1,$98,$68,$a1,$a0,$68,$97
        .byte $c0,$69,$a1,$c0,$68,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$05,$5c,$5c,$5c,$04,$05,$5c
        .byte $06,$06,$06,$06,$04,$7a,$02,$5c,$04,$7a,$02,$5c,$04,$7a,$02,$5c
        .byte $06,$06,$06,$5c,$5c,$5c,$5c,$09,$0a,$67,$5c,$5c,$5c,$5c,$5c,$5c
        .byte $5c,$07,$0c,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
        .byte $08,$08,$08,$08,$08,$08,$08,$05,$80,$83,$83,$83,$83,$83,$83,$83
        .byte $83,$83,$5c,$5c,$5c,$5c,$5c,$07,$20,$20,$20,$20,$0c,$08,$08,$08

    L_9b67:
        .byte $08,$20,$20,$20,$20,$05,$06,$06,$06,$06,$06,$06,$04,$7a,$7b,$7b
        .byte $7b,$02,$06,$06,$06,$06,$06,$06,$07,$0c,$08,$08,$08,$08,$05,$5c
        .byte $5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$09,$0a,$0a
        .byte $0a,$0a,$0a,$0a,$0a,$0a,$0a,$0b,$00,$98,$44,$0d,$9e,$45,$91,$8a
        .byte $45,$91,$8a,$4a,$91,$9e,$4a,$91,$94,$4c,$14,$9a,$56,$13,$94,$56
        .byte $1f,$8e,$56,$1f,$8e,$5c,$52,$96,$69,$15,$96,$71,$15,$94,$7a,$65
        .byte $8a,$88,$11,$8a,$8d,$11,$8a,$92,$11,$8a,$97,$11,$8a,$9c,$11,$8a
        .byte $a1,$11,$8a,$a6,$11,$8a,$ab

        ora ($8a),y
        bcs L_9c32 + $3

        .byte $9e,$88,$11,$9e,$8d,$11,$9e,$92,$11,$9e,$97,$11,$9e,$9c,$11,$9e
        .byte $a1,$11,$9e,$a6,$11,$9e,$ab,$11,$9e,$b0,$53,$8a,$8d,$19,$8a,$95
        .byte $19,$8a,$9f,$19,$8a,$a7,$19,$9e,$8d,$19,$9e,$97,$19,$9e,$a2,$19
        .byte $96,$8a,$54,$98,$90,$54,$96,$9c,$69,$96,$a4,$69,$96,$ac,$69,$96
        .byte $b4,$69,$8e,$e7,$86,$a2,$e7,$51,$88,$e9,$8d,$8f,$04,$8e,$9d,$04

    L_9c32:
        .byte $8e,$94,$e5,$11,$94,$ea,$11,$94,$ef,$11,$94,$f4,$11,$94,$f9,$11
        .byte $94,$fe,$11,$95,$03,$11,$95,$08,$11,$95,$0d,$11,$95,$12,$53,$88
        .byte $f0,$14,$94,$e9,$19,$94,$f5,$19,$94,$ff,$19,$95,$04,$19,$86,$f4
        .byte $18,$86,$fc,$18,$87,$04,$18,$87,$0c,$18,$a0,$f4,$18,$a0,$fc,$18
        .byte $a1,$04,$18,$a1,$0c,$18,$87,$14,$18,$a1,$14,$18,$9f,$1b,$8c,$9f

    L_9c82:
        .byte $2e,$8b,$9b,$18,$14,$8d,$19,$7e,$95,$1e,$1f,$95,$37,$1f,$9b,$37
        .byte $13,$8f,$37,$13,$95,$34,$13,$9b

        rti 

    L_9c9b:
         .byte $14,$95,$31,$1f,$89,$65,$14,$89,$7c,$1d,$a3,$7c,$1e,$8f,$7c,$16

    L_9cab:
        .byte $95,$7c,$16,$9b,$7c,$16,$8b,$84,$55,$97

        dey 
        adc ($99,x)
        dey 
        lsr $99,x
        bcc L_9d0c + $7

    L_9cbd:
         .byte $9b,$86,$6d,$a1,$86,$79,$9f,$86,$75,$9d,$87,$70,$9d,$8c,$70,$9d
        .byte $91,$78,$8b,$90,$6a,$8b,$95,$11,$8b,$9a,$11,$8b,$9f,$11,$8b,$a4
        .byte $11,$8b,$a9,$11,$8b,$ae,$11,$8b,$b3,$11,$8b,$b8,$53,$97,$8a,$54
        .byte $97,$92,$54,$99,$a4,$6b,$97,$9a,$54,$95,$af,$65,$99,$98,$56,$9b
        .byte $a0,$56,$9b,$a7,$56,$99,$af,$56,$9f,$94,$6c,$9f

        txs 
        bvs L_9cab

    L_9d0c:
         .byte $9f,$70,$9f,$a4,$70,$9f,$a9,$70,$9f,$ae,$78,$a1,$b6,$68,$00,$00

    L_9d1c:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

        jsr L_2020
        jsr $0405
        jsr L_2020
        jsr $0405

        .byte $7a,$7b,$7b,$7b,$02,$5c,$06,$06,$06,$5c,$04,$7a,$7b,$7b,$7b,$02
        .byte $07

        jsr L_2020
        jsr L_0f0e

        .byte $0f,$0f,$02,$5c,$04,$0e,$0f,$0f,$0f,$02,$5c,$04,$0e,$0f,$0f,$0f
        .byte $20,$20,$20,$20,$05,$81,$84,$84,$84,$84,$84,$84,$5c,$5c,$82,$85
        .byte $85,$85,$85,$85,$85,$5c,$5c,$5c,$5c,$5c,$07,$0c,$08,$08,$08,$08
        .byte $08,$08,$08,$08,$05,$5c,$5c,$5c,$5c,$09,$0a,$0a,$0a,$0a,$0a,$0a
        .byte $0a,$0a,$0a,$0a,$67,$5c,$09,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a
        .byte $0b

        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr $0520

        .byte $07,$20,$20,$20,$20,$0c,$08,$08,$08,$08,$08,$20,$20,$20,$20,$05

    L_9db8:
        .byte $5c,$06,$06,$06,$06,$06,$06,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c
        .byte $04,$00,$9e

        rti 

        .byte $8b,$9e,$4d,$8b,$9e,$81,$8c,$9e,$ae,$8b,$a2,$ba,$51,$9c,$ba,$51
        .byte $96,$ba,$51,$90,$ce,$8e,$88,$d8,$8d,$8c,$d6,$51,$92,$d6,$51,$94
        .byte $d8,$90,$9a,$d6,$86,$9a,$ea,$8e,$9f,$54,$8b,$9f,$63,$8c,$9f,$78
        .byte $8b,$98,$46,$0d,$94,$42,$14,$88,$4a,$18,$9e,$4a,$18,$94,$52,$10
        .byte $8e,$50,$18,$8c,$52,$18,$8a,$54,$18,$88,$56,$18,$98,$50,$18,$9a
        .byte $52,$18,$9c,$54,$18,$9e,$56,$18,$9a,$64,$1f,$8e,$64,$14,$a0,$70
        .byte $1f

        dey 
        bvs L_9e34 + $f
        sty $7f,x
        bpl L_9db8 + $4

    L_9e34:
         .byte $7f,$18,$8a,$81,$18,$8c,$83,$18,$8e,$85,$18,$9e,$7f,$18,$9c,$81

    L_9e44:
        .byte $18,$9a,$83,$18,$98,$85,$18,$94,$86,$65,$88,$93,$1d,$a2,$93,$1e
        .byte $96,$a1,$15,$94,$b3,$55,$9a,$b7,$61,$90,$b7,$61,$86,$b8,$56,$86
        .byte $c0,$56,$86,$c8,$56,$98,$c0,$10,$98,$c6,$10,$9e,$c0,$10,$9e,$c6
        .byte $10,$8a,$d0,$52,$98,$d1,$6d,$9c,$d1,$71,$9e,$d0,$74,$9e,$ce,$76
        .byte $9e,$d3,$70,$9e,$d8,$70,$9e,$dd,$70,$9e,$e2,$70,$9e,$e7,$78,$88
        .byte $dc,$11,$92,$dc,$11,$88,$e1,$11,$88,$e6,$11,$88,$eb,$11,$88,$f0
        .byte $11,$88,$f5,$11,$88,$fa,$53,$92,$e1,$11,$92,$e6,$11,$92,$eb

        ora ($92),y
        beq L_9ec7 + $1

        .byte $92,$f5,$11,$92,$fa,$53,$88,$df,$19,$88,$e9,$19,$88,$f2,$19,$92

    L_9ec7:
        .byte $dc,$19,$92,$e7,$19,$92,$ef,$19,$9e,$f0,$54,$9e,$f8,$54,$8b,$18
        .byte $11,$9f,$18,$11,$8b,$1d,$11,$8b,$22,$11,$8b,$27,$11,$8b,$2c,$11
        .byte $8b,$31,$11,$8b,$36,$11,$8b,$3b

        ora ($8b),y
        rti 

        .byte $53,$9f,$1d,$11,$9f,$22,$11,$9f,$27,$11,$9f,$2c,$11,$9f,$31,$11
        .byte $9f,$36,$11,$9f,$3b

        ora ($9f),y
        rti 

    L_9f0a:
         .byte $53,$8b,$1c,$19,$8b,$23,$19,$8b,$2c,$19,$8b,$37,$19,$9f,$20,$19
        .byte $9f,$29,$19,$9f,$34,$19,$9f,$3f,$19,$99,$18,$54,$97,$23,$54,$95
        .byte $1e,$14,$95,$35,$14,$9a,$fe,$65,$97,$56,$15,$9b,$5a,$15,$9f,$5e
        .byte $15,$8f,$5f,$15,$93,$63,$15,$97,$67,$15,$95,$5e,$65,$9d,$9d,$5d
        .byte $9d,$9e,$64,$9d,$a5,$64,$9d,$ad,$62,$91,$ae,$64,$91,$b6,$64,$85
        .byte $9e,$63,$85,$a6,$63,$85,$ae,$63,$85,$b6,$63,$91,$bd,$92,$9b,$9e
        .byte $08,$87,$9f,$63,$8f,$9f,$64,$87,$a7,$63,$87,$af,$63,$87,$b7,$63
        .byte $8f,$a7,$64,$8f,$af,$64,$8f,$b7,$64,$8f,$bf,$59,$8d,$9f,$6a,$8f
        .byte $c1,$59,$8f,$c3,$5a,$9b,$a2,$6b,$8d,$a4,$11,$8d,$a9,$11,$8d,$ae
        .byte $11,$8d,$b3,$11,$8d,$b8,$11,$8d,$bd,$53,$99,$9e,$68,$99,$a9,$68
        .byte $99,$af,$65,$99,$b8,$91,$95,$85,$1f,$95,$82,$1f,$95,$7f,$1f,$95
        .byte $7c,$1f,$95,$79,$14,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_9fda:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_9fea:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$04,$08,$0c,$10,$14,$18,$1c,$20,$24
        .byte $28,$2c,$30,$34,$38,$3c

        rti 

        .byte $44,$48,$4c,$50,$54,$48,$5c

        rts 

        .byte $64,$68,$6c,$70,$74,$78,$7c,$90,$84,$88,$8c,$90,$90,$90,$90,$94
        .byte $90,$90,$90,$90,$90,$98,$90,$90,$90,$90,$90,$90,$90,$90,$90,$90
        .byte $90,$28,$2c,$30,$34,$38,$3c

        rti 

        .byte $44,$58,$4c,$50,$54,$58,$5c

        rts 

        .byte $64,$68,$6c,$70,$74,$78,$7c,$80

        sty $88
        sty L_9071 + $f
        bcc L_9fda + $e
        bcc L_9fea
        bcc L_9fea + $2
        bcc L_9fea + $4
        bcc L_9fea + $6

        .byte $27,$28,$50,$2a,$45,$23,$00,$00,$43,$25,$46,$00,$47,$25,$25,$26
        .byte $48,$00,$00,$00,$49,$4a,$25,$3c,$27,$24,$25,$3c,$3d,$4c,$00,$00
        .byte $4d,$24,$25,$26,$3b,$4a,$25,$4e,$21,$22,$57,$23,$21,$24,$25,$26
        .byte $27,$28,$50,$29,$21,$28,$50,$2a,$21,$24,$25,$2b,$21,$22,$2c,$00
        .byte $27,$28,$2d,$00,$21,$2e,$23,$00,$21,$23,$00,$00,$2f,$30,$00,$00
        .byte $21,$32,$00,$00,$21,$33,$31,$34,$21,$35,$36,$37,$21,$35,$37,$00
        .byte $27,$28,$50,$2a,$21,$22,$38,$00,$27,$28,$39,$00,$21,$3a,$00,$00
        .byte $3b,$4a,$25,$3c,$3d,$4b,$00,$00,$3e,$30,$00,$00,$3f,$00,$00,$00

        rol L_4027 + $c,x
        bmi L_a125 + $1

        .byte $00,$00,$00,$42,$00,$00,$00,$43,$25,$44,$00,$20,$20,$20,$20,$1f
        .byte $00,$00,$00,$4f,$00,$00,$00,$00,$00,$00,$00,$00,$90,$99,$a2,$ac
        .byte $b6,$c1,$cc,$d8,$e4,$f1,$fe,$0c,$1a,$29,$38,$00,$c5,$c5,$c5,$c5

    L_a115:
        .byte $c5,$c5,$c5,$c5,$c5,$c5,$c5,$c6,$c6,$c6,$c6,$00,$48,$4c,$5e,$6a

    L_a125:
        .byte $76,$82,$8e,$9c,$aa,$b8,$c6,$de,$ec,$04,$18,$2c,$40,$54,$74,$78
        .byte $88,$9a,$ba,$c2

        cld 
        inc $1a04
        bit L_4437 + $1
        jmp L_6452 + $6
        ror 
        bvs L_a1b6 + $6

        .byte $7c,$8e,$a0,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$c6,$c6,$c6,$c6,$c6
        .byte $c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7
        .byte $c7,$c7,$c7,$c7,$c7,$c8,$c8,$c8,$c8,$c8,$c8,$c8,$c8,$c8,$c8,$c8

    L_a1b6:
        .byte $c8,$c8,$c8,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$01,$01,$01,$01,$01,$00
        .byte $9c,$6c,$b4,$84,$cc,$00,$05,$00,$09,$00,$02,$02,$02,$00,$00,$00
        .byte $9c,$9c,$9c,$00,$00,$00,$09,$80,$0e,$00,$0b,$0b,$0b,$00,$00,$00
        .byte $cc,$cc,$cc,$00,$00,$00,$06,$ff,$08,$00,$03,$01,$05,$00,$00,$00
        .byte $84,$9c,$b4,$00,$00,$00,$00,$00,$03,$00,$01,$04,$06,$03,$05,$00
        .byte $9c,$9c,$9c,$9c,$9c,$00,$06,$80,$01,$00,$05,$06,$01,$04,$03,$00

    L_a256:
        .byte $6c,$84,$9c,$b4,$cc,$00,$05,$80,$04,$00,$01,$01,$01,$01,$01,$00
        .byte $6c,$b4,$9c,$cc,$84,$00,$05,$80,$00,$00,$01,$04,$06,$03,$05,$00
        .byte $9c,$9c,$9c,$9c,$9c,$00,$06,$80,$0d,$00,$0c,$08,$0a,$07,$09,$00
        .byte $9c,$9c,$9c,$9c,$9c,$00,$08,$00,$05,$00,$0d,$0d,$0d,$00,$00,$00

        jmp (L_9c82 + $2)

        .byte $00,$00,$00,$06,$00,$08,$00

        ora ($0f,x)
        ora ($0e),y
        bpl L_a2a6

    L_a2a6:
         .byte $9c,$9c,$9c,$9c,$9c,$00,$08,$80,$03,$00,$10,$11,$01,$0f,$0e,$00
        .byte $6c,$84,$9c,$b4,$cc,$00,$07,$80,$0b,$00,$05,$06,$01,$04,$03,$00
        .byte $6c,$84,$9c,$b4,$cc,$00,$08,$80,$0c,$00,$0f,$11,$00,$00,$00,$00
        .byte $b4,$84,$00,$00,$00,$00,$08,$ff,$0a,$00,$13,$00,$00,$00,$00,$00
        .byte $6c,$00,$00,$00,$00,$00,$00,$ff,$07,$00,$12,$12,$00,$00,$00,$00
        .byte $b4,$cc,$00,$00,$00,$00,$07,$80,$08,$00,$13,$13,$00,$00,$00,$00
        .byte $84,$b4,$00,$00,$00,$00,$09,$ff,$06,$00,$11,$11,$01,$0f,$0f,$00
        .byte $6c,$84,$9c,$b4,$cc,$00,$0c,$80,$0a,$00,$26,$27,$00,$00,$00,$00
        .byte $00,$b4,$00,$00,$00,$00,$08,$80,$0a,$00,$26,$27,$00,$00,$00,$00
        .byte $84,$00,$00,$00,$00,$00,$08,$ff,$06,$00,$26,$27,$00,$00,$00,$00
        .byte $9c,$00,$00,$00,$00,$00,$08,$80,$07,$00,$26,$27,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$08,$ff,$04,$00,$14,$00,$00,$00,$00,$00
        .byte $9c,$00,$00,$00,$00,$00,$00,$ff,$0f,$00,$11,$11,$01,$0f,$0f,$00
        .byte $6c,$84,$9c,$b4,$cc,$00,$0a,$80,$0f,$00

        ora ($0f,x)
        ora ($0e),y
        bpl L_a386

    L_a386:
         .byte $9c,$9c,$9c,$9c,$9c,$00,$08,$80,$02,$00,$12,$12,$12,$12,$12,$00
        .byte $cc,$cc,$cc,$cc,$cc,$00,$05,$80,$08,$00,$15,$15,$15,$15,$15,$00
        .byte $9c,$6c,$b4,$84,$cc,$00,$0c,$00,$09,$00,$16,$12,$01,$00,$00,$00

        jmp (L_9cbd + $f)

        .byte $00,$00,$00,$00,$80,$08,$00,$16,$12,$16,$12,$16,$00,$84,$b4,$84
        .byte $b4,$84,$00,$08,$80,$08,$00,$09,$0a,$0c,$08,$07,$00,$6c,$84,$9c
        .byte $b4,$cc,$00,$08,$00,$05,$00,$17,$19,$17,$1b,$17,$00

        jmp (L_9c9b + $1)

        .byte $9c,$cc,$00,$08,$80,$0b,$00,$19,$18,$17,$1a,$1b,$00,$6c,$84,$9c

    L_a3f9:
        .byte $b4,$cc,$00,$08,$80,$09,$00,$02,$1c,$02,$1c,$00,$00,$9c,$9c,$9c

    L_a409:
        .byte $9c,$00,$00,$06,$80,$0e,$00,$02,$02,$1c,$1c,$17,$00,$84,$84,$b4

    L_a419:
        .byte $b4,$9c,$00,$07,$80,$0e,$00,$1d,$1e,$1f,$21,$20,$00,$6c,$84,$9c

    L_a429:
        .byte $b4,$cc,$00,$00,$00,$08,$00,$02,$1c,$02,$1c,$00,$00,$9c,$9c,$9c

    L_a439:
        .byte $9c,$00,$00,$06,$80,$00,$00,$01,$04,$06,$03,$05,$00,$9c,$9c,$9c

    L_a449:
        .byte $9c,$9c,$00,$07,$80,$02,$00,$05,$06,$01,$04,$03,$00,$6c,$84,$9c

    L_a459:
        .byte $b4,$cc,$00,$06,$80,$0d,$00,$01,$22,$22,$23,$00,$00,$9c,$84,$b4

    L_a469:
        .byte $9c,$00,$00,$00,$80,$01,$00,$01,$04,$06,$03,$05,$00,$9c,$9c,$9c

    L_a479:
        .byte $9c,$9c,$00,$07,$80,$0c,$00,$01,$22,$22,$23,$23,$00,$9c,$84,$b4

    L_a489:
        .byte $6c,$cc,$00,$00,$80,$02,$00,$01,$01,$01,$22,$23,$00,$84,$9c,$b4

    L_a499:
        .byte $9c,$9c,$00,$00,$80,$00,$00,$01,$01,$22,$23,$23,$00,$84,$b4,$9c

    L_a4a9:
        .byte $84,$b4,$00,$00,$80,$0c,$00,$10,$11,$01,$0f,$0e,$00,$6c,$84,$9c

    L_a4b9:
        .byte $b4,$cc,$00,$05,$80,$06,$00,$02,$1c,$17,$02,$1c,$00,$6c,$b4,$9c

    L_a4c9:
        .byte $84,$cc,$00,$07,$00,$06,$00,$01,$04,$06,$03,$05,$00,$9c,$9c,$9c

    L_a4d9:
        .byte $9c,$9c,$00,$06,$80,$07,$00,$10,$11,$01,$0f,$0e,$00,$6c,$84,$9c
        .byte $b4,$cc,$00,$07,$80,$0d,$00,$03,$01,$05,$00,$00,$00,$84,$9c,$b4

    L_a4f9:
        .byte $00,$00,$00,$00,$80,$0f,$00,$05,$06,$01,$04,$03,$00,$6c,$84,$9c

    L_a509:
        .byte $b4,$cc,$00,$07,$80,$0b,$00,$01,$02,$01,$1c,$01,$00,$6c,$84,$9c

    L_a519:
        .byte $b4,$cc,$00,$07,$80,$04,$00,$0a,$0c,$08,$00,$00,$00,$84,$9c,$b4
        .byte $00,$00,$00,$00,$00,$05,$00,$05,$06,$01,$04,$03,$00,$6c,$84,$9c
        .byte $b4,$cc,$00,$07,$80,$01,$00,$16,$16,$16,$16,$16,$00,$6c,$6c,$6c
        .byte $6c,$6c,$00,$05,$80,$08,$00,$06,$01,$04,$00,$00,$00,$84,$9c,$b4
        .byte $00,$00,$00,$00,$80,$07,$00,$06,$01,$04,$00,$00,$00,$84,$9c,$b4
        .byte $00,$00,$00,$00,$80,$06,$00,$10,$11,$01,$0f,$0e,$00,$6c,$84,$9c
        .byte $b4,$cc,$00,$07,$80,$03,$00,$01,$22,$22,$28,$00,$00,$9c,$84,$b4
        .byte $9c,$00,$00,$00,$ff,$0a,$00,$00,$19,$04,$0c,$01,$29,$02,$00,$ff
        .byte $0c,$2f,$22,$08,$1e,$20,$02,$0c,$ff,$21,$06,$1f,$1c,$25,$0f,$31
        .byte $26,$21,$ff,$1d,$07,$1a,$0a,$34,$0b,$0d,$31,$1d,$ff,$04,$0e,$2a
        .byte $1c,$37,$32,$23,$17,$2e,$04,$ff,$29,$1e,$0d,$2c,$0f,$1f,$2d,$2f
        .byte $0a,$29,$ff,$0b,$05,$1c,$0c,$16,$2e,$36,$11,$02,$0a,$0b,$ff,$07
        .byte $19,$03,$17,$24,$1d,$02,$21,$0e,$0d,$07,$ff,$18,$09,$11,$30,$0a
        .byte $35,$0d,$26,$2b,$23,$17,$18,$ff,$2f,$1b,$11,$25,$2a,$33,$31,$08
        .byte $1c,$10,$06,$2f,$ff,$05,$16,$35,$27,$0d,$22,$0a,$00,$36,$1d,$2f
        .byte $19,$05,$ff,$37,$1c,$08,$1e,$2f,$2c,$28,$20,$34,$16,$2d,$1f,$37
        .byte $ff,$35,$18,$33,$09,$0b,$2a,$00,$0e,$31,$16,$2c,$29,$37,$35,$ff
        .byte $36,$2e,$0d,$16,$1b,$1a

        ora $2004,x
        plp 
        bmi L_a64f + $d

        .byte $03

        rol $ff,x
        sec 
        ora L_312a + $a,y
        jsr L_1806

        .byte $32,$30,$16,$16,$1f,$0c,$35,$38,$ff,$82,$08,$00,$ff,$82,$08,$80

    L_a64f:
        .byte $10,$84,$08,$80,$10,$88,$10,$80,$10,$84,$08,$82,$08,$00,$ff,$82
        .byte $08,$80,$10,$88,$06,$80,$08,$84,$06,$00,$ff,$82,$08,$80,$10,$88
        .byte $06,$80,$0c,$84,$06,$00,$ff,$82,$08,$80,$10,$84,$06,$80,$08,$88
        .byte $06,$00,$ff,$82,$08,$80,$10,$84,$06,$80,$0c,$88,$06,$00,$ff,$82
        .byte $08,$80,$10,$20,$89,$06,$80,$06,$20,$82,$08,$00,$ff,$82,$08,$80
        .byte $10,$20,$89,$08,$80,$06,$20,$82,$08,$00,$ff,$82,$08,$80,$10,$20
        .byte $85,$06,$80,$06,$20,$82,$08,$00,$ff,$82,$08,$80,$10,$20,$85,$08
        .byte $80,$06,$20,$82,$08,$00,$ff,$82,$08,$80,$28,$89,$0a,$85,$0a,$86
        .byte $0a,$8a,$0a,$80,$28,$89,$0a,$85,$0a,$86,$0a,$8a,$0a,$00,$ff,$82
        .byte $08,$80,$10,$20,$81,$07,$80

        php 
        jsr L_0880 + $2

        .byte $00,$ff,$82,$08,$80,$28,$85,$0a,$89,$0a,$8a,$0a,$86,$0a,$80,$28

    L_a6fa:
        .byte $85,$0a,$89,$0a,$8a,$0a,$86,$0a,$00,$ff,$82,$08,$80,$10,$88,$06
        .byte $80,$08,$84,$06,$80,$40,$84,$06,$80,$03,$88,$06,$00,$ff,$82,$08
        .byte $80,$10,$88,$06,$80,$0c,$84,$06,$80,$40,$84,$06,$80,$06,$88,$06
        .byte $00,$ff,$82,$08,$80,$10,$84,$06,$80,$08,$88,$06,$80,$40,$88,$06
        .byte $80,$03,$84,$06,$00,$ff,$82,$08,$80,$10,$84,$06,$80,$0c,$88,$06
        .byte $80,$40,$88,$06,$80,$06,$84,$06,$00,$ff,$82,$08,$80,$28,$89,$0a
        .byte $85,$0a,$86,$0a,$8a,$0a,$80,$14,$88,$06,$80,$0c,$84,$06,$80,$14
        .byte $85,$0a,$89,$0a,$8a,$0a,$86,$0a,$00,$ff,$82,$06,$40,$ff,$82

        asl $c0
        plp 
        sta ($06,x)
        jsr $2880
        bpl L_a6fa + $9

        .byte $14,$82,$06,$40,$ff,$82,$08,$80,$14,$81,$08,$20,$80,$3c,$10,$82
        .byte $08,$80,$28,$82,$06,$00,$ff,$82,$08,$80,$28,$85,$0a,$89,$0a,$8a
        .byte $0a,$86,$0a,$80,$14,$84,$06,$80,$0c,$88,$06,$80,$14,$89,$0a,$85
        .byte $0a,$86,$0a,$8a,$0a,$00,$ff,$82,$08,$80,$50,$82,$04,$00,$ff,$82
        .byte $08,$80,$14,$88,$08,$80,$08,$84,$08,$80,$24,$86,$04,$84,$08,$80
        .byte $10,$88,$0c,$00,$ff,$82,$08,$80,$14,$88,$0a,$80,$0a,$84,$0a,$80
        .byte $1e,$86,$04,$84,$06,$80,$0a,$88,$0a,$00,$ff,$82,$08,$80,$14,$84
        .byte $08,$80,$08,$88,$08,$80,$24,$8a,$04,$88,$08,$80,$10,$84,$0c,$00

    L_a803:
        .byte $ff,$82,$08,$80,$14,$84,$0a,$80,$0a,$88,$0a,$80,$1e,$8a,$04,$88

    L_a813:
        .byte $06,$80,$0a,$84,$0a,$00,$ff,$82,$08,$80,$10,$88,$08,$80,$10,$84
        .byte $10,$80,$10,$88,$08,$82,$08,$00,$ff,$82,$08,$80,$1e,$85,$08,$80
        .byte $08,$89,$08,$00,$ff,$82,$08,$80,$24,$85,$08,$80,$02,$89,$08,$00
        .byte $ff,$82,$08,$80

        rol $81
        bpl L_a84b

    L_a84b:
         .byte $ff,$82,$08,$80,$1e,$89,$08,$80,$08,$85,$08,$00,$ff,$82,$08,$80
        .byte $24,$89,$08,$80,$02,$85,$08,$00,$ff,$80,$06,$82,$08,$00,$ff,$80
        .byte $0c,$82,$08,$00,$ff,$80,$12,$82,$08,$00,$ff,$82,$08,$80,$50,$40
        .byte $ff,$82,$08,$c0,$1e,$10,$c0,$1e,$10,$c0,$14

        bpl L_a803 + $6
        php 
        jsr $0a82

        .byte $00,$ff,$82

        php 
        cpy #$1e
        bpl L_a813 + $2
        php 
        jsr L_1e80
        bpl L_a813 + $9
        php 
        cpy #$28
        bpl L_a8df

        .byte $ff,$80,$0c,$82,$08,$80,$1e,$81,$02,$c0,$10,$82,$02,$10,$40,$ff
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_a8df:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_a91f:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_aaff:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$05,$07,$0c,$05,$06,$06,$06,$06,$06,$07,$0c,$08,$08,$08,$08
        .byte $05,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$09,$0a,$0a,$0a,$0a,$0a,$0a,$0b
        .byte $93,$93,$93,$93,$08,$08,$08,$08,$08,$05,$5c,$5c,$5c,$5c,$5c,$5c
        .byte $5c,$5c,$5c,$5c,$5c,$5c,$5c,$04,$93,$93,$93,$05,$5c,$07,$93,$93

        ora ($27,x)
        plp 
        and $2701
        plp 
        bvc L_ae72
        ora ($27,x)
        plp 
        bvc L_ae72 + $5
        ora ($21,x)
        plp 
        bvc L_ae72 + $a

        .byte $93,$43,$25,$44,$01,$21,$22,$57,$23,$01,$21,$22,$38,$01,$21,$22
        .byte $38,$01,$21,$23,$01,$21,$35,$37,$01,$27,$28,$2d,$01,$1f,$01,$1f

    L_ae72:
        .byte $01,$1f,$93,$3d,$4b,$01,$3e,$33,$30,$01,$21,$3a,$01,$21,$32,$01
        .byte $21,$24,$25,$2b,$01,$42,$01,$1f,$00,$9e,$38,$8b,$9e,$a7,$94,$98
        .byte $40,$0d,$94,$3b,$65,$8c,$43,$68,$9e,$43,$68,$94,$4e,$13,$94,$51
        .byte $13,$8e,$54,$13,$8e,$5a,$14,$9a,$57,$13,$8a,$70,$11,$8a,$75,$11
        .byte $8a,$7a,$11,$8a,$7f,$11,$8a,$84,$11,$8a,$89

        ora ($8a),y
        stx L_9e44 + $f
        bvs L_aed4 + $1

        .byte $9e,$75,$11,$9e,$7a,$11,$9e,$7f,$11,$9e,$84,$11,$9e,$89,$11,$9e

    L_aed4:
        .byte $8e,$53,$8a,$72,$19,$8a,$7b,$19,$8a,$83,$19,$9e,$73,$19,$9e,$7a
        .byte $19,$9e,$86,$19,$94,$6e,$55,$94,$74,$10,$96,$7c,$69,$94,$7f,$10

    L_aef4:
        .byte $96,$87,$69,$94,$c2,$65,$94,$ab,$14,$92,$c7,$8a,$92,$c8,$64,$92
        .byte $d0,$64,$9e,$d8,$87,$9e,$d9,$64,$9e,$e0,$64,$9e,$e8,$62,$92,$e9
        .byte $64,$86,$c8,$63,$86,$d0,$63,$86,$d8,$63,$86,$e0,$63,$86,$e8,$63
        .byte $86,$ec,$63,$92,$ec,$64,$92,$f4,$92,$90,$f4,$58,$90,$f5,$59,$90
        .byte $f7,$59,$90,$f9,$59,$90,$fb,$59,$90,$fd,$5a,$8e,$c8,$6a,$8e,$cd
        .byte $11,$8e,$d2,$11,$8e,$d7,$11,$8e,$dc,$11,$8e,$e1,$11,$8e,$e6,$11
        .byte $8e,$eb,$11,$8e,$f0,$11,$8e,$f5,$11,$8e,$f9,$53,$9c

        dex 
        bpl L_aef4 + $c
        bne L_af76

        .byte $9c,$eb,$10,$9c,$f1,$10,$9c,$dd,$6b,$9a,$d9,$1f,$9a,$e5,$14,$93

    L_af76:
        .byte $13,$15,$89,$15,$1d,$8f,$15,$8f,$9b,$13,$15,$97,$15,$15,$9f,$15
        .byte $15,$a3,$15,$51,$97,$15,$90,$93,$17,$8f,$9b,$17,$8f,$91,$19,$8e
        .byte $99,$19,$8e,$91,$19,$90,$99,$19,$90,$9e,$c4,$68,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_aff6:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$a9,$01,$85,$bc,$a9,$80
        .byte $85,$bb,$a2,$10,$a0,$00,$86,$b7,$84,$b8,$a9,$00,$85,$94,$a9,$05

    L_b016:
        .byte $85,$95,$60,$a9,$00,$85,$16,$85,$17,$a9,$ff,$8d,$00,$dc,$ad,$00

    L_b026:
        .byte $dc,$2d,$01,$dc,$2c,$57,$b0,$f0,$08,$2c,$58,$b0,$f0,$07,$4c,$3d
        .byte $b0,$c6,$17,$d0,$02,$e6,$17,$2c,$55,$b0,$f0,$08,$2c,$56,$b0,$f0

    L_b046:
        .byte $07,$4c,$50,$b0,$c6,$16,$d0,$02,$e6,$16,$29,$10,$85,$18,$60,$01
        .byte $02,$04

        php 
        bpl $b07b
        rti 

        .byte $80

    L_b05d:
        ldy $04
        lda L_b046 + $f,y
        sta $02
        eor #$ff
        sta $03
        lda L_d020 + $7,y
        sta $0d
        lda L_4be9 + $f,y
        sta $0e
        tya 
        asl 
        tay 
        lda L_d000,y
        sta $05
        lda L_d000 + $1,y
        sta $07
        lda L_d010
        and $02
        beq L_b088
        lda #$ff
    L_b088:
        sta $06
        lda L_d010 + $5
        and $02
        sta $08
        rts 
    L_b092:
        ldy $04
        lda L_b046 + $f,y
        sta $02
        eor #$ff
        sta $03
        lda L_d020 + $7,y
        sta $0d
        lda L_4be9 + $f,y
        sta $0e
        tya 
        asl 
        tay 
        lda L_d000,y
        sta $05
        lda L_d000 + $1,y
        sta $07
        lda L_d010
        and $02
        beq L_b0bd
        lda #$ff
    L_b0bd:
        sta $06
        lda L_d010 + $5
        and $02
        sta $08
        lda L_d010 + $7
        and $02
        sta $09
        lda L_d010 + $b
        and $02
        sta $0a
        lda L_d010 + $c
        and $02
        sta $0b
        lda L_d010 + $d
        and $02
        sta $0c
        rts 
    L_b0e3:
        ldy $04
        lda L_b046 + $f,y
        sta $02
        eor #$ff
        sta $03
        lda $0d
        sta L_d020 + $7,y
        lda $0b
        beq L_b0fe
        lda $02
        ora L_d010 + $c
        bne L_b103
    L_b0fe:
        lda L_d010 + $c
        and $03
    L_b103:
        sta L_d010 + $c
        lda $09
        beq L_b111
        lda $02
        ora L_d010 + $7
        bne L_b116
    L_b111:
        lda L_d010 + $7
        and $03
    L_b116:
        sta L_d010 + $7
        lda $0c
        beq L_b124
        lda $02
        ora L_d010 + $d
        bne L_b129
    L_b124:
        lda L_d010 + $d
        and $03
    L_b129:
        sta L_d010 + $d
        lda $0a
        beq L_b137
        lda $02
        ora L_d010 + $b
        bne L_b13c
    L_b137:
        lda L_d010 + $b
        and $03
    L_b13c:
        sta L_d010 + $b
    L_b13f:
        ldy $04
        lda L_b046 + $f,y
        sta $02
        eor #$ff
        sta $03
        lda $0e
        sta L_4be9 + $f,y
        tya 
        asl 
        tay 
        lda $05
        sta L_d000,y
        lda $07
        sta L_d000 + $1,y
        lda $06
        and #$01
        sta $06
        lda $06
        beq L_b16d
        lda $02
        ora L_d010
        bne L_b172
    L_b16d:
        lda L_d010
        and $03
    L_b172:
        sta L_d010
        lda $08
        beq L_b180
        lda $02
        ora L_d010 + $5
        bne L_b185
    L_b180:
        lda L_d010 + $5
        and $03
    L_b185:
        sta L_d010 + $5
        rts 
    L_b189:
        sta $0d
    L_b18b:
        ldy #$00
    L_b18d:
        sta ($1c),y
        iny 
        cpy #$28
        bcc L_b18d
        dex 
        beq L_b1a7
        clc 
        lda $1c
        adc #$28
        sta $1c
        bcc L_b1a2
        inc $1d
    L_b1a2:
        lda $0d
        jmp L_b18b
    L_b1a7:
        clc 
        clc 
        lda $1c
        adc #$28
        sta $1c
        bcc L_b1b3
        inc $1d
    L_b1b3:
        rts 
    L_b1b4:
        lda #$02
        sta $b4
        lda #$02
        sta $b5
        ldx #$00
        stx $10
        lda #$30
        sta $0f
    L_b1c4:
        lda $20,x
        lsr 
        lsr 
        lsr 
        lsr 
        bne L_b1ef
        lda $0f
    L_b1ce:
        sta $b6
        jsr L_b2c5 + $1
        ldx $10
        lda $20,x
        and #$0f
        bne L_b1f6
        cpx #$03
        beq L_b1f6
        lda $0f
    L_b1e1:
        sta $b6
        jsr L_b2c5 + $1
        inc $10
        ldx $10
        cpx #$04
        bne L_b1c4
        rts 
    L_b1ef:
        ldy #$00
        sty $0f
        jmp L_b1ce
    L_b1f6:
        ldy #$00
        sty $0f
        jmp L_b1e1
    L_b1fd:
        lda #$ff
        sta L_dc00 + $2
        lda #$00
        sta L_dc00 + $3
        lda #$fe
        sta L_dc00
        lda L_dc00 + $1
        and #$78
        sta $19
        lda #$fd
        sta L_dc00
        lda L_dc00 + $1
        and #$80
        ora $19
        sta $19
        lda #$bf
        sta L_dc00
        lda L_dc00 + $1
        and #$10
        bne L_b233
        lda $19
        and #$7f
        sta $19
    L_b233:
        lda #$ff
        sta L_dc00
        lda L_dc00 + $1
        ora #$e0
        eor #$ff
        ora $19
        sta $19
        rts 
    L_b244:
        dex 
        bne L_b244
        dey 
        bne L_b244
        rts 
        lda $01
        and #$10
        beq L_b25a
        lda $01
        ora #$20
        sta $01
        sta $94
    L_b259:
        rts 
    L_b25a:
        lda $94
        beq L_b259
        lda $01
        and #$df
        sta $01
        rts 

    L_b265:
         .byte $00,$0f,$30,$30,$49,$0a,$1e,$1c,$0e,$30,$30,$30,$ff,$a9,$08,$85
        .byte $8f,$20,$19,$b0,$a0,$08,$20,$44,$b2,$a5,$18,$f0,$f0,$c6,$8f,$d0

    L_b285:
        .byte $f0,$60,$a0,$0a,$b1,$1a,$99,$04,$00,$88,$10,$f8,$20,$e3,$b0,$60

    L_b295:
        .byte $86,$be,$84,$bf,$a0,$00,$b1,$be,$85,$b4,$c9,$18,$b0,$22,$c8,$b1
        .byte $be,$85,$b5,$c8,$b1,$be,$29,$7f,$4c,$b4,$b2,$a4,$ba,$b1,$be,$c8
        .byte $84,$ba,$30,$0c,$c9,$00,$30,$08,$85,$b6,$20,$c6,$b2,$4c,$b0,$b2

    L_b2c5:
        .byte $60,$a4,$b4,$b9,$60,$b3,$85,$b1,$b9,$79,$b3,$18,$65,$b5,$85,$b0
        .byte $a9,$00,$65,$b1,$85,$b1,$a5,$b6,$a0,$00,$91,$b0,$09,$80,$a0,$28
        .byte $91,$b0,$e6,$b5,$29,$7f,$c9,$3a,$90,$12,$c9,$5a,$b0,$0e,$a0,$01

    L_b2f5:
        .byte $69,$20,$91,$b0,$09,$80,$a0,$29,$91,$b0,$e6,$b5,$60,$a0,$00,$20

    L_b305:
        .byte $0f,$b3,$e6,$b3,$e6,$b1,$ca,$d0,$f4,$60,$b1,$b2,$91,$b0,$88,$d0

    L_b315:
        .byte $f9,$b1,$b2,$91,$b0,$60,$a5,$62,$29,$03,$d0,$3e,$a5,$19,$29,$40
        .byte $d0,$38,$a5,$19,$10,$0b,$a5,$95,$c9,$0f,$b0,$0d,$e6,$95,$4c,$3e

    L_b335:
        .byte $b3,$a5,$95,$c9,$00,$f0,$02,$c6,$95,$a5,$95,$c9,$0a,$90,$07,$e9
        .byte $0a,$a0,$01,$4c,$4d,$b3,$a0,$30,$8c,$c1,$b3,$8d,$c2,$b3,$a5,$95

    L_b355:
        .byte $85,$ef,$ea,$a2,$b8,$a0,$b3,$20,$95,$b2,$60,$48,$48,$48,$48,$48
        .byte $48,$48,$49,$49,$49,$49,$49,$49,$4a,$4a,$4a,$4a,$4a,$4a,$4a,$4b

    L_b375:
        .byte $4b,$4b,$4b,$4b,$00

        plp 
        bvc L_b3f1 + $4
        ldy #$c8
        beq L_b399
        rti 
        pla 
        bcc L_b335 + $8
        cpx #$08
        bmi L_b3e1

        .byte $80,$a8,$d0,$f8,$20,$48,$70,$98,$c0,$02,$0c,$0a,$0b,$42,$18,$17

    L_b399:
        bmi L_b3c1 + $4
        bmi L_b39d

    L_b39d:
         .byte $00,$00,$00

        bmi L_b3c1 + $f
        bmi L_b3a4

    L_b3a4:
         .byte $00,$ff,$fd,$fb,$df,$df,$f7,$ef

        jsr L_801c + $4
        bpl L_b3d1

        .byte $80,$53,$46,$9d,$1d,$91,$11,$00,$0f,$4f,$18,$15,$1e,$42,$0e,$30

    L_b3c1:
        .byte $00,$05,$ff,$20,$44,$b5,$85,$bd,$c9,$46,$f0,$0d,$c9,$53,$d0,$93

    L_b3d1:
        .byte $05,$04,$0e,$0f,$0f,$0f,$02,$5c,$5c,$5c,$5c,$5c,$5c,$06,$06,$06

    L_b3e1:
        .byte $04,$7a,$02,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$04

    L_b3f1:
        .byte $7a,$02,$5c,$5c,$5c,$09,$0a,$0a,$0a,$67,$09,$0a,$0a,$0a,$67,$09
        .byte $0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$92,$93,$93,$93,$93,$05
        .byte $07,$0c,$08,$08,$08,$05,$07,$0c,$08,$08,$08,$05,$06,$06,$06,$06
        .byte $06,$04,$7a,$02,$06,$06,$06,$06,$06,$07,$0c,$08,$08,$08,$02,$5c
        .byte $5c,$5c,$5c,$5c,$5c,$5c,$04,$0c,$08,$08,$08,$05,$06,$06,$06,$5c
        .byte $5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$07,$0c,$08,$08,$08,$08,$08,$08
        .byte $08,$08,$08,$08,$08,$08,$08,$08,$00,$9e

        rti 

        .byte $8b,$9f,$bc,$8c,$9f,$bc,$5d,$8e,$d0,$5e,$8e,$d2,$5e,$8e,$d4,$5e
        .byte $8e,$d6,$5e,$8e,$d8,$92,$98,$46,$0d,$94,$42,$14,$8a,$48,$7d,$9e
        .byte $48,$7e,$88,$58,$1d,$8e,$58,$16,$94,$58,$16,$9a,$58,$16,$a2,$58

    L_b48c:
        .byte $1e,$88,$68,$1d,$92,$68,$15,$98,$68,$16,$9e,$68,$16,$a2,$68,$51
        .byte $94,$5e,$55,$9e,$62,$61,$90,$5e,$61,$9a,$6e,$13,$9a,$71,$13,$94
        .byte $71,$13,$8e,$71,$13,$8e,$74,$13,$88,$7e,$1d,$96,$7e,$15,$a2,$7e
        .byte $1e,$8a,$83,$15,$8c,$88,$15,$8e,$8d,$15,$90,$92,$15,$a2,$83,$17
        .byte $a0,$83,$1e,$a0,$88,$15,$9e,$8d,$15,$9c,$92,$15,$8e,$97,$15,$8c
        .byte $9c,$15,$8a,$a1,$15,$88,$a6,$1d,$96,$a6,$15,$9e,$97,$15,$a2,$a1
        .byte $17,$a0,$a1,$1e,$a2,$a6,$1e,$a0,$9c,$15,$94,$83,$65,$92,$87

        jmp (L_8d91 + $1)
        bvs L_b48c + $6

        .byte $92,$70,$92,$97,$70,$92,$9c

        sei 
        sty $a0,x
        adc $8a
        bcs L_b51e + $1

        .byte $9e,$b0,$11,$94,$b2,$10,$9e,$b5,$11,$8a,$b5,$11,$8a,$ba,$11,$8a

    L_b51e:
        .byte $bf,$11,$8a,$c4,$11,$8a,$c9,$11,$8a,$ce,$11,$8a,$d3,$53,$9e,$ba
        .byte $11,$9e,$bf,$11,$9e,$c4,$11,$9e,$c9,$53,$8e,$f4,$69,$94,$f4,$14
        .byte $9e,$f4,$69,$97,$04,$69,$8d,$02,$91,$9d,$02,$91,$8f,$18,$14,$95
        .byte $1b,$13,$9b,$1e,$13,$9b,$2b,$13,$95,$2e,$13,$8f,$31,$14,$89,$44
        .byte $1d,$89,$5c,$1d,$a3,$44,$1e,$a3,$5c,$1e,$8f,$48,$15,$9f,$48,$15
        .byte $8b,$4c,$15,$95,$4c,$15,$91,$50,$15,$a1,$50,$15,$8d,$54,$15,$9b
        .byte $54,$15,$93,$5c,$15,$9f,$58,$15,$8a,$b4,$19,$8a,$bb,$19,$8a,$c6
        .byte $19,$9e,$b2,$19,$9e,$bd,$19,$a1,$6d,$14,$95,$70,$13,$9b,$73,$52
        .byte $9f,$77,$5d,$9f,$78,$64,$9f,$80,$64,$9f,$88,$62,$87,$78,$63,$87
        .byte $80,$63,$87,$88,$63,$87,$8e,$63,$93,$89,$64,$93,$8e,$64,$93,$96
        .byte $5f,$8f,$78,$6a,$8f,$7d,$11,$8f,$82,$11,$8f,$87,$11,$8f,$8c,$11
        .byte $8f,$91,$11,$8f,$93,$53,$9d,$81,$6b,$99,$78,$68,$9d,$7c,$68,$a1
        .byte $8c,$68,$a1,$92,$68,$a1,$98,$68,$9b,$8c,$68,$9b,$92,$68,$9b,$98
        .byte $68,$95,$be,$65,$8d,$be,$18,$9b,$be,$18,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$08,$08,$08,$08,$02,$06,$04,$0c,$08,$08,$08,$05,$5c,$5c
        .byte $5c,$06,$06,$5c,$5c,$5c,$5c,$07,$0c,$08,$08,$08,$02,$5c,$83,$83
        .byte $83,$83,$83,$83,$83,$83,$83,$83,$83,$83,$83,$83,$83,$83,$5c,$06
        .byte $06,$06,$07,$0c,$08,$08,$08,$93,$05,$5c,$07,$93,$0c,$08,$08,$08
        .byte $02,$5c,$83,$83,$83,$83,$83,$83,$83,$83,$83,$83,$83,$83,$83,$83
        .byte $83,$83,$5c,$06,$06,$06,$07,$0c,$08,$08,$08,$05,$07,$0c,$08,$08
        .byte $08,$05,$07,$0c,$08,$08,$08,$05,$80,$83,$83,$83,$83,$83,$83,$83
        .byte $83,$83,$83,$83,$83,$83,$83,$83,$83,$5c,$5c,$5c,$5c,$5c,$5c,$06
        .byte $06,$07,$00,$9e,$d5,$8b,$9e,$e8,$8c,$94,$49,$14,$88,$5c,$1d,$92
        .byte $5c,$15,$98,$5c,$16,$9e,$5c,$16,$a2,$5c,$51,$88,$73,$1d,$9a,$68
        .byte $14,$8e,$73,$16,$94,$73,$16,$9a,$73,$16,$a2,$73,$1e,$9c,$57,$68
        .byte $8a,$6e,$68,$90,$7a,$18,$8c,$7a,$18,$88,$7a,$18,$94,$8b,$11,$94
        .byte $90,$11,$94,$95,$11,$94,$9a,$11,$94,$9f,$11,$94,$a4,$11,$94,$a9
        .byte $11,$94,$ae,$11,$94,$b3,$11,$94,$8d,$19,$94,$98,$19,$94,$a6,$19
        .byte $86,$90,$18,$86,$98,$18,$86,$a0,$18,$86,$a8,$18,$a0,$90,$18,$a0
        .byte $98,$18,$a0,$a0,$18,$a0,$a8,$18,$94,$b8,$53,$86,$b0,$18,$a0,$b0
        .byte $18,$86,$b8,$18,$a0,$b8,$18,$8e,$8c,$86,$9c,$8c,$86,$8e,$bc,$8e
        .byte $9c,$bc,$8e,$8e,$c0,$65,$9a,$c6,$13,$88,$e1,$1d,$8e,$dd,$15,$94
        .byte $d9,$15,$a2,$e1,$1e,$9e,$e5,$15,$98,$e9,$15,$9e,$e7,$90,$94,$e2
        .byte $14,$94,$fc,$11,$95,$01,$11,$95,$06,$11,$95,$0b,$11,$95,$10,$11
        .byte $95,$15,$11,$95,$1a,$11,$95,$1f,$53,$8e,$fe,$86,$9c,$fe,$86,$95
        .byte $02,$19,$95,$0e,$19,$87,$04,$18,$87,$0c,$18,$87,$14,$18,$87,$1c
        .byte $18,$87,$24,$18,$a1,$04,$18,$a1,$0c,$18,$a1,$14,$18,$a1,$1c,$18
        .byte $a1,$24,$18,$97,$2c,$69,$8f,$2e,$8e,$9d,$2e,$8e,$89,$35,$14,$9b
        .byte $38,$52,$8d,$49,$69,$97,$49,$69,$a1,$49,$69,$91,$59,$69,$9d,$59
        .byte $69,$89,$6d,$8d,$8f,$6b,$86,$a3,$6b,$51,$95,$6a,$11,$95,$6f,$11
        .byte $95,$74,$11,$95,$79,$11,$95,$7e,$11,$95,$83,$11,$95,$88,$11,$95
        .byte $8d,$11,$95,$92,$11,$95,$97,$11,$95,$9c,$53,$95,$6b,$19,$95,$75
        .byte $19,$95,$7f,$19,$95,$89,$19,$95,$92,$19,$8f,$9d,$8e,$9d,$9d,$8e
        .byte $89,$70,$68,$89,$76,$68,$89,$7c,$68,$89,$82,$68,$89,$8f,$6a,$89
        .byte $94,$11,$89,$99,$11,$89,$9e,$11,$89,$a3,$11,$89,$a8,$11,$89,$ad
        .byte $53,$97,$a4,$6b,$a1,$70,$18,$a1,$76,$18,$a1,$7c,$18,$a1,$82,$18
        .byte $a1,$88,$18,$a1,$8e,$18,$a1,$94,$18,$a1,$9a,$18,$a1,$a0,$18,$95
        .byte $59,$14,$a1,$a6,$18,$a1,$ac,$18,$a1,$b2,$18,$97,$a3,$61,$99,$a3
        .byte $56,$97,$ab,$61,$99,$ab,$55,$9b,$b2,$13,$9e,$31,$94,$00,$00,$00
        .byte $00,$00,$93,$05,$04,$93,$05,$04,$7a,$7b,$7b,$02,$06,$06,$06,$04
        .byte $7a,$7b,$7b,$02,$07,$93,$02,$07,$93,$0e,$0f,$0f,$0f,$0f,$02,$5c
        .byte $04,$0e,$0f,$0f,$0f,$0f,$93,$05,$5c,$03,$07,$93,$0e,$0f,$0f,$0f
        .byte $0f,$93,$05,$5c,$03,$07,$93,$0e,$0f,$0f,$0f,$0f,$05,$5c,$5c,$5c
        .byte $5c,$5c,$09,$0a,$0a,$0a,$67,$09,$0a,$0a,$0a,$67,$09,$0a,$0a,$0a
        .byte $67,$5c,$5c,$5c,$5c,$04,$0c,$02,$5c,$5c,$5c,$5c,$07,$93,$0e,$0f
        .byte $0f,$0f,$0f,$02,$5c,$04,$7a,$7b,$7b,$7b,$02,$5c,$04,$0e,$0f,$0f

    L_b89e:
        .byte $0f,$05,$83,$83,$83,$83,$83,$83,$83,$83,$83,$5c,$5c,$03,$04,$0c
        .byte $02,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$04,$00,$9e

        rti 

    L_b8bd:
         .byte $8b,$9e,$4d,$8b,$9e,$75,$8c,$9e,$82,$8c,$9e,$a5,$8b,$9e,$b9,$8c
        .byte $9e,$cc,$8b,$9e,$e0,$8c,$9f,$41,$8c,$8f,$74,$86,$9d,$74,$86,$91
        .byte $8f,$15,$97,$8f,$16,$9d,$8f,$8f,$98,$46,$0d,$94,$41,$14,$88,$4a
        .byte $18,$9e,$4a,$18,$90,$4e,$18,$8e,$50,$18,$8c,$52,$18,$8a,$54,$18
        .byte $88,$56,$18,$96,$4e,$18,$98,$50,$18,$9a,$52,$18,$9c,$54,$18,$9e

        lsr $18,x
        sty $52,x
        bpl L_b89e + $3

        .byte $64,$65,$9a,$64,$13,$88,$73,$18,$8a,$75,$18,$8c,$77,$18,$8e,$79
        .byte $18,$90,$7b,$18,$9e,$73,$18,$9c,$75,$18,$9a,$77,$18,$98,$79,$18
        .byte $96,$7b

        clc 
        sty $73,x
        bpl L_b8bd + $5

        .byte $7f,$18,$9e,$7f,$18,$98,$80,$0d,$94,$87,$14,$88,$96,$1d,$8e,$96
        .byte $16,$94,$96,$16,$9a,$96,$16,$96,$a6,$15,$9a,$aa,$15,$9e,$ae,$15
        .byte $a2,$b2,$17,$a0,$b4,$8e,$8a,$b1,$15,$8e,$b5,$15,$92,$b9,$15,$96
        .byte $bd,$15,$a0,$b4,$90,$94,$b2,$65,$96,$cd,$15,$92,$d1,$15,$8e,$d5
        .byte $15,$8a,$d9,$15,$a2,$d8,$17,$9e,$dc,$15,$9a,$e0,$15,$96,$e4,$15
        .byte $a0,$da,$8e,$a0,$da,$90,$94,$d9,$65,$8a,$f6,$11,$8a,$fb,$11,$8b
        .byte $00,$11,$8b,$05,$11,$8b,$0a,$11,$8b,$0f,$11,$8b,$14,$11,$8b,$19
        .byte $11,$8b,$1e,$11,$8b,$23,$53,$8a,$f9,$19,$8b,$02,$19,$8b,$0f,$19
        .byte $8b,$19,$19,$8b,$1f,$19,$9e,$f6,$11,$9e,$fb,$11,$9f,$00,$11,$9f
        .byte $05,$11,$9f,$0a,$11,$9f,$0f,$11,$9f,$14,$11,$9f,$19,$11,$9f,$1e
        .byte $11,$9f,$23,$53,$9e,$fa,$19,$9f,$06,$19,$9f,$0f,$19,$9f,$1b,$19
        .byte $94,$f7,$10,$94,$fe,$14,$95,$03,$10,$95,$1d,$91,$95,$21,$91,$99
        .byte $2e,$8a,$99,$2f,$64,$99,$37,$64,$99,$3b,$64,$99,$43,$5f,$8d,$2f
        .byte $63,$8d,$37,$63,$8d,$3b,$63,$95,$2f,$11,$95,$34,$11,$95,$39,$11
        .byte $95,$3e,$11,$95,$41,$53,$95,$30,$19,$89,$2e,$68,$89,$34,$68,$89
        .byte $3a,$68,$a1,$2e,$68,$a1,$34,$68,$a1,$3a,$68,$95,$27,$14,$8b,$56
        .byte $69,$8b,$64,$69,$a1,$56,$69,$a1,$64,$69,$95,$72,$11,$95,$77,$11
        .byte $95,$7c,$11,$95,$81,$11,$95,$86,$53,$87,$72,$56,$87,$7a,$56,$87
        .byte $82,$56,$87,$8a,$56,$9f,$72,$56,$9f,$7a,$56,$9f,$82,$56,$9f,$8a
        .byte $56,$95,$93,$55,$87,$8d,$56,$9f,$8d,$56,$9f,$95,$61,$91,$95,$61
        .byte $93,$9e,$8a,$93,$9f,$64,$87,$9f,$63,$87,$a7,$63,$87,$af,$63,$87
        .byte $b7,$63,$9f,$a7,$87,$9f,$a8,$64,$9f,$af,$62,$93,$b0,$64,$93,$b6
        .byte $64,$93,$be,$5f,$9d,$a8,$6b,$8f,$a0,$6a,$8f,$a5,$11,$8f,$aa,$11
        .byte $8f,$af,$11,$8f,$b4,$11,$8f,$b9,$53,$9f,$c0,$65,$95,$74,$19,$95

    L_baba:
        .byte $80,$19,$9f,$9e,$69,$9f,$a4,$69,$9f,$b2,$69,$9f,$b8,$69,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$93,$05,$0b,$05,$06,$06,$06,$07,$0e,$0f
        .byte $0f,$0f,$02,$06,$06,$06,$5c,$5c,$5c,$5c,$04,$7a,$7b,$7b,$7b,$7b
        .byte $7b,$7b,$02,$06,$06,$06,$5c,$5c,$5c,$5c,$04,$7a,$7b,$7b,$7b,$7b
        .byte $7b,$7b,$02,$06,$06,$06,$5c,$5c,$5c,$5c,$04,$7a,$7b,$7b,$7b,$7b
        .byte $7b,$7b,$02,$06,$06,$06,$5c,$5c,$5c,$5c,$04,$7a,$7b,$7b,$7b,$7b
        .byte $7b,$7b,$02,$06,$06,$06,$5c,$5c,$5c,$5c,$04,$7a,$7b,$7b,$7b,$7b
        .byte $7b,$7b,$02,$06,$06,$06,$5c,$5c,$5c,$5c,$04,$0e,$0f,$0f,$0f,$0f
        .byte $0f,$0f,$0f,$93,$05,$5c,$5c,$5c,$04,$0c,$02,$5c,$5c,$5c,$5c,$5c
        .byte $5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$07,$0c,$00,$9e

        rti 

        .byte $8b,$9f,$61,$8b,$9f,$bf,$8c,$9f,$bf,$5d,$98,$45,$0d,$88,$4b,$18

    L_bb69:
        .byte $9e,$4b,$18,$a0,$54,$65,$8e,$57,$52,$94,$70,$14,$8e,$76,$10,$9a
        .byte $76,$10,$88,$7f,$68,$a0,$7f,$68,$94,$7f,$13,$94,$99,$14,$8e,$9f
        .byte $10,$9a,$9f,$10,$8e,$a9,$69,$9e,$a9,$69,$96,$a9,$69,$94,$c2,$14
        .byte $8e,$c8,$10,$9a,$c8,$10,$8a,$d1,$68,$90,$d1,$68,$a0,$d1,$68,$9a
        .byte $d1,$68,$94,$eb,$14,$8e,$f1,$10,$9a,$f1,$10,$8a,$fb,$69,$90,$fb
        .byte $69,$96,$fb,$69,$9c,$fb,$69,$95,$14,$14,$8f,$1a,$10,$9b,$1a,$10
        .byte $89,$23,$68,$91,$23,$68,$99,$23,$68,$a1,$23,$68,$95,$3d,$14,$8f
        .byte $43,$10,$9b,$43

        bpl L_bb69 + $d
        eor L_8b68 + $1
        jmp L_9f0a + $9
        jmp L_9f0a + $9

        .byte $73,$55,$9b,$6b,$56,$9b,$77,$61,$91,$77,$61,$9b,$6a,$61,$93,$6a

    L_bbf8:
        .byte $61,$87,$6a,$56,$87,$6f,$56,$95,$65,$52,$91,$6d,$6e,$91,$70,$70
        .byte $91,$75,$77,$99,$75,$79,$93,$75,$73,$97,$70,$6f,$9f,$7e,$5d,$9f
        .byte $7f,$64,$9f,$87,$64,$9f,$8f,$64,$87,$7f,$63,$87,$87,$63,$87,$8f
        .byte $63,$9f,$97,$60,$91,$97,$58,$91,$98,$64,$91,$a0,$64,$91,$a8,$64
        .byte $89,$98,$63,$91,$b0,$64,$89,$a0,$63,$89,$a8,$63,$89,$b0,$63,$91
        .byte $b8,$5b,$8f,$81,$6a,$8f,$86,$11,$8f,$8b

        ora ($8f),y
        bcc L_bc66 + $1

        .byte $8f,$95,$11,$8f,$9a,$11,$8f,$9f,$11,$8f,$a4,$11,$8f,$a9,$11,$8f

    L_bc66:
        .byte $ae,$11,$8f,$b3,$53,$9d,$90,$6b,$9d,$8f,$61,$93,$80,$56,$93,$88
        .byte $56,$9b,$82,$10,$9b,$87,$10,$9b,$9a,$11,$9b,$9f,$11,$9b,$a4,$11
        .byte $9b,$a9,$11,$9b,$ae,$11,$9b,$b3,$53,$9b,$9c,$19,$9b,$a5,$19,$9b
        .byte $ad,$19,$95,$c2,$65,$a3,$9a,$1e,$a3,$a2,$1e,$a3,$aa,$1e,$a3,$b2
        .byte $1e,$00,$00,$00,$00,$00,$00,$00,$00,$00,$94,$93,$93,$93,$93,$93
        .byte $94,$93,$93,$05,$06,$07,$0c,$05,$06,$07,$93,$0c,$08,$08,$08,$08
        .byte $08,$02,$80,$83,$83,$83,$80,$5c,$5c,$5c,$82,$85,$85,$85,$82,$5c
        .byte $5c,$5c,$81,$84,$84,$84,$81,$5c,$04,$0c,$02,$82,$85,$85,$85,$82
        .byte $5c,$5c,$5c,$5c,$5c,$5c,$5c,$04,$7a,$7b,$7b,$02,$09,$0a,$67,$04
        .byte $7a,$7b,$7b,$02,$5c,$5c,$5c,$5c,$09,$0a,$0a,$0a,$0a,$0a,$0a,$0a
        .byte $0a,$5e,$5e,$5e,$5e,$5e,$5e,$92

        jsr L_938a + $9

        .byte $93,$93,$93,$93,$93,$02,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$5c,$04,$00
        .byte $9a,$53,$94,$a0,$67,$94,$98,$44,$14,$9e,$8e,$8b,$9e,$ad,$8c,$8e
        .byte $c3,$86,$88,$c5,$8d,$a2,$c3,$51,$88,$d0,$8d,$8e,$ce,$8f,$9e,$ce

    L_bd41:
        .byte $15,$a2,$ce,$51,$9a,$dc,$86,$94,$de,$8d,$8e,$de,$8d,$88,$de,$8d
        .byte $9a,$e9,$8d,$94,$e9,$8d,$8e,$e9,$8d,$88,$e9,$8d,$9c,$f5,$51,$a2
        .byte $f5,$51,$96,$f5,$51,$93,$00,$15,$97,$00,$51,$9d,$00,$51,$a3,$00
        .byte $51,$9b,$0a,$86,$95,$0c,$8d,$8f,$0c,$8d,$89,$0c,$8d,$9b,$17,$8d
        .byte $95,$17,$8d,$8f,$17,$8d,$89,$17,$8d,$8f,$5e,$92,$9f,$97,$94,$96
        .byte $6b,$14,$98,$93,$0d,$9a,$9a,$13,$94,$a7,$65,$98,$ac,$0d,$88,$d5
        .byte $18,$90,$d5,$18,$96,$d5,$18,$9e,$d5,$18,$92,$c4,$6c,$92

        dex 
        bvs L_bd41 + $3

        .byte $cf,$78,$90,$e0,$7e,$8a,$e2,$7d,$8e,$ec,$10,$94,$ec,$10,$9a,$ec
        .byte $10,$a0,$e1,$65,$9e,$fb,$7e,$98,$f9,$7c,$88,$ec,$10,$88,$f2,$10
        .byte $88,$f8,$10,$88,$fe,$10,$a0,$ec,$10,$a0,$e6,$10,$93,$10,$7d,$8b
        .byte $11,$7e,$a1,$0b,$11,$a1,$10,$11,$a1,$15,$11,$a1,$1a,$11,$a1,$1f
        .byte $11,$a1,$24,$11,$a1,$29,$11,$a1,$2e,$53,$a1,$0e,$19,$a1,$15,$19
        .byte $a1,$1d,$19,$a1,$24,$19,$95,$1a,$11,$95,$1f,$11,$95,$24,$11,$95
        .byte $29,$11,$95,$2e,$53,$95,$1d,$19,$95,$25,$19,$89,$1a,$11,$89,$1f
        .byte $11,$89,$24,$11,$89,$29,$11,$89,$2e,$53,$89,$20,$19,$89,$26,$19
        .byte $8b,$3b,$14,$9f,$3b,$52,$93,$46,$56,$93,$49,$56,$95,$51,$55,$99
        .byte $46,$08,$85,$47,$63,$85,$4f,$63,$8d,$47,$64,$8d,$4f,$64,$8b,$47
        .byte $11,$8b,$4c,$11,$8b,$51,$11,$8b,$56,$53,$8d,$53,$64,$85,$53,$63
        .byte $8d,$5b,$5b,$8b,$49,$19,$8b,$52,$19,$9f,$47,$11,$9f,$4c,$11,$9f
        .byte $51,$11,$9f,$56,$11,$9f,$5b,$11,$9f,$60,$11,$9f,$65,$53,$9f,$49
        .byte $19,$9f,$4f,$19,$9f,$56,$19,$9f,$5e,$19,$95,$9b,$14,$91,$ae,$6a
        .byte $91,$b3,$11,$91,$b8,$11,$91,$bd,$11,$91,$c2,$53,$8d,$a8,$69,$93

        tay 
        adc #$99
        tay 
        adc #$8b
        ldy L_8b68 + $1
        bcs L_bf0f + $7

        .byte $8b,$b4,$69,$8b,$b8,$69,$8b,$bc,$69,$8b,$c0,$69,$9b

        ldy L_9b67 + $2
        bcs L_bf1f + $9

        .byte $9f,$b3,$6b,$9b,$bc,$69,$9b,$c0,$69,$a1,$c2,$55,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$ff,$ff,$ff,$ff,$00,$00,$00,$00,$ff,$ff,$ff,$ff,$00
        .byte $00,$00,$00,$f0,$ff,$ff,$ff,$00,$00,$0b,$00,$f0,$f0,$ff,$f0,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_bf0f:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_bf1f:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00

    L_c000:
        eor $12,x
        ora #$04
        ora #$15
        ora L_2b20
        and ($20),y
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_4017 + $9
        rti 
        rti 
        rti 
        rti 
        rti 
        rti 
        rti 
        rti 
        rti 
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr $0f43
        bpl $c095

        .byte $12,$09,$07,$08,$14,$20,$28,$03,$29,$20,$31,$39,$38,$36,$20,$47
        .byte $12,$01,$06,$14,$07,$0f,$0c,$04

        jsr $144c

        .byte $04,$2e,$2f,$48,$05,$17,$13,$0f

        asl L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_4317 + $9

        .byte $12,$01,$03,$0b

        ora $04
        jsr L_1206

        .byte $0f,$0d,$20,$14,$01,$10,$05,$20,$02,$19,$20,$44,$05,$01,$04,$02
        .byte $05,$01,$14,$2f,$54,$08,$05,$20,$53,$08,$01,$12,$0b,$13,$0f

        asl L_3214 + $c
        and $14,x
        php 
        jsr L_1041

    L_c0fa:
         .byte $12,$09,$0c,$20,$31,$39,$39,$35,$20,$28,$46,$0f,$12,$20,$27,$50
        .byte $56,$4f,$43,$47,$27

        jsr $0513

    L_c112:
         .byte $12,$09,$05,$13,$29,$2e,$64,$64,$64,$64,$64,$64,$64,$64,$64,$64
        .byte $64,$64,$64,$64,$64,$64,$64,$64,$64,$64,$64,$64,$64,$64,$64,$64
        .byte $64,$64,$64,$64,$64,$64,$64,$64,$64,$64,$64,$64,$64,$64,$20,$20
        .byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
        .byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
        .byte $20,$20,$20,$20,$20,$20,$49,$0e,$06,$09,$0e,$09,$14,$05,$20,$0c

        ora #$16
        ora $13
        jsr L_5921 + $7

        .byte $2f

        lsr L_3f29
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_6312 + $e

        .byte $63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63
        .byte $63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63
        .byte $63,$63,$63,$63,$63,$63,$63

        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_2020
        jsr L_a256 + $2

        .byte $00

        lda #$80
        sta $0291
        lda #$17
        sta L_d010 + $8
        lda #$1b
        sta L_d010 + $1
        lda #$03
        sta L_dd00
        lda #$c8
        sta L_d010 + $6
        ldx #$00
        stx L_d020
        stx L_d020 + $1
        stx L_d030
        stx L_d010 + $5
        txa 
    L_c2ab:
        sta L_d800,x
        sta L_d900,x
        sta L_da00,x
        sta L_db00,x
        inx 
        bne L_c2ab
        ldx #$00
    L_c2bc:
        lda #$03
        sta L_d800,x
        lda #$06
        jsr L_c3f0
        sta L_d910 + $8,x
        sta L_d9b0 + $8,x
        lda #$04
        sta L_d870 + $8,x
        lda #$0e
        sta L_d8c0 + $8,x
        inx 
        cpx #$28
        bne L_c2bc
        jsr $0774
        ldx #$00
    L_c2e0:
        lda #$0f
        sta L_d960 + $8,x
        inx 
        cpx #$28
        bne L_c2e0
        jsr $075f
        cmp #$00
        beq L_c300
        cmp #$01
        beq L_c2f6
        rts 
    L_c2f6:
        lda #$00
        sta $0d7c
        lda #$59
        jmp $0702
    L_c300:
        lda #$4e
        sta $057e
        jsr $0774
        jmp L_0900

        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00

    L_c35f:
        jsr $ffe4
        cmp #$00
        beq L_c35f
        cmp #$59
        beq L_c371
        cmp #$d9
        beq L_c371
        lda #$00
        rts 
    L_c371:
        lda #$01
        rts 
        ldx #$40
    L_c376:
        ldy #$ff
    L_c378:
        dey 
        bne L_c378
        dex 
        bne L_c376
        rts 

        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00

    L_c3f0:
        sta L_d820 + $8,x
        lda #$0e
        sta L_d8f0,x
        lda #$0c
        rts 

        .byte $00,$00,$00,$00,$00

        ldx #$00
    L_c402:
        lda L_c000,x
        sta $0400,x
        lda L_c0fa + $6,x
        sta $0500,x
        lda $c200,x
        sta $0600,x
        lda L_c300,x
        sta $0700,x
        inx 
        bne L_c402
        jmp $0680

        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_cd50:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d000:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d010:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d020:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d030:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d400:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d410:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d800:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d810:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d820:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d840:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d850:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d860:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d870:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d880:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d890:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d8c0:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d8f0:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d900:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d910:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d960:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_d9b0:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_da00:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_db00:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_dc00:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_dd00:
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $ad,$02,$dd,$09,$03,$8d,$02,$dd,$ad,$00,$dd,$29,$fc,$8d,$00,$dd

    L_e010:
        .byte $a9,$9b,$8d,$18,$d0,$a9,$d8,$8d,$16,$d0,$a9,$f0,$8d,$20,$d0,$a9

    L_e020:
        .byte $f8,$a0,$00,$99,$00,$d8,$99,$00,$d9,$99,$00,$da,$99,$f0,$da,$88

    L_e030:
        .byte $d0,$f1,$a9,$00,$8d,$e1,$e0,$a5,$fb,$29,$07,$aa,$bd,$c9,$e0,$8d

    L_e040:
        .byte $21,$d0,$bd,$d1,$e0,$8d,$22,$d0,$bd,$d9,$e0,$8d,$23,$d0,$ee,$e1

    L_e050:
        .byte $e0,$ad,$e1,$e0,$29,$01,$d0,$12,$ad,$21,$d0,$ae,$22,$d0,$ac,$23

    L_e060:
        .byte $d0,$8d,$23,$d0,$8e,$21,$d0,$8c,$22,$d0,$ad,$12,$d0,$c9,$b0,$90
        .byte $f9,$ac,$21,$d0,$8c,$e4,$e0,$a9,$f7,$8d,$21,$d0,$a5,$fc,$c9,$d0
        .byte $b0,$25,$4a,$8d,$e3,$e0,$29,$03,$18,$69,$56,$8d,$e2,$e0,$ad,$e3
        .byte $e0,$4a,$4a,$aa,$ad,$e2,$e0,$9d,$50,$e7,$a9,$55,$ca,$9d,$50,$e7
        .byte $ca,$10,$fa,$a5,$02,$d0,$15,$ad,$12,$d0,$c9,$30,$b0,$f9,$ac,$e4
        .byte $e0,$8c,$21,$d0,$ad,$e1,$e0,$d0,$95,$4c,$37,$e0,$a9,$0b,$8d,$11
        .byte $d0,$a9,$f0,$8d,$20,$d0,$6c,$00,$80,$01,$07,$01,$0f,$01,$07,$01
        .byte $03,$0f,$08,$0e,$0c,$0a,$08,$0d,$05,$0b,$02,$06,$0b,$02,$09,$05
        .byte $06,$00,$00,$00,$00,$92,$02,$90,$08,$ba,$fc,$00,$89,$32,$89,$00
        .byte $fd,$12,$00,$fe,$8d,$76,$c9,$7e,$00,$02,$00,$76,$fd,$fc,$ff,$cc
        .byte $bf,$03,$02,$00,$ff,$01,$02,$89,$7e,$8f,$ff,$80,$12,$26,$ed,$9b
        .byte $12,$9b,$fe,$01,$22,$81,$bf,$02,$ff,$00,$fd,$24,$ff,$00,$c9,$00
        .byte $02,$89,$ef,$89,$76,$00,$ff,$89,$32,$8c,$fd,$00,$76,$00,$ff,$00
        .byte $fd,$89,$ff,$01,$ff,$89,$12,$00,$12,$0c,$ff,$00,$02,$00,$ef,$1a
        .byte $12,$08,$ff,$00,$56,$00,$00,$ed,$8b,$cb,$00,$fd,$12,$df,$fd,$9b
        .byte $ff,$ed,$ff,$08,$ff,$81,$ff,$04,$12,$00,$7b,$01,$7f,$00,$fe,$00
        .byte $ff,$00,$ff,$ec,$02,$88,$fd,$48,$74,$04,$02,$d9,$fe,$8d,$f2,$8d
        .byte $02,$89,$ff,$00,$32,$81,$32,$00,$fb,$c9,$ff,$00,$02,$00,$00,$11
        .byte $00,$14,$fd,$74,$00,$76,$fd,$34,$01,$10,$00,$10,$cd,$d9,$10,$00
        .byte $cd,$00,$81,$72

        bcc L_e1c7 + $5
        rti 

        .byte $7c,$00,$de,$00,$da,$00,$ae,$36,$74,$fc,$36,$10,$32,$88,$92,$00
        .byte $02,$89,$22,$02,$fe,$89,$fe,$00,$fc,$00,$32,$00,$32,$00,$32,$cd
        .byte $fe,$48,$ab,$00,$be,$dc,$be,$10,$e4,$cd,$83,$00,$ff,$a8,$ff,$fd

    L_e1c7:
        .byte $00,$10,$00,$fd,$00,$cd,$00,$02,$00,$00,$12,$00,$36,$00,$36,$00
        .byte $f9,$ed,$ff,$c0,$7e,$08,$fe,$00,$78,$00,$ff,$00,$11,$fc,$02,$02
        .byte $80,$08,$ba,$fc,$00,$89,$32,$89,$00,$fd,$02,$00,$de,$8d,$72,$89
        .byte $76,$00,$02,$00,$76,$fd,$f4,$ff,$44,$9f,$03,$02,$00,$ff,$01,$02
        .byte $8d,$7e,$8f,$ff,$88,$12,$26,$ed,$db,$12,$9d,$7a,$01,$0a,$81,$bf
        .byte $02,$ff,$00,$fd,$24,$ff,$00,$c9,$00,$02,$09,$ef,$89,$76,$00,$ff
        .byte $89,$76,$cc,$fd,$00,$76,$00,$ff,$00,$fd,$0d,$ff,$01,$ff,$89,$12
        .byte $00,$12,$4c,$ff,$00,$02,$00,$ef,$1a,$12,$6c,$ff,$00,$56,$00,$00
        .byte $ed,$8b,$cb,$00,$fd,$12,$df,$fd,$9b,$ff,$ed,$ff,$08,$ff,$01,$ff
        .byte $04,$12,$00,$7b,$01,$7f,$00,$fe,$00,$ff,$00,$ff,$ec,$02,$08,$fd
        .byte $48,$74,$04,$02,$fd,$7e,$8d,$72,$cd,$02,$8d,$ff,$00,$32,$89,$32
        .byte $00,$fb,$c9,$ff,$00,$02,$00,$00,$11,$00,$14,$fd,$74,$00,$76,$fd
        .byte $34,$01,$10,$00,$00,$cd,$d9,$10,$00,$cd,$00,$81,$72

        sty $36,x
        rti 

        .byte $f4,$00,$de,$00,$da,$00,$8c,$36,$74,$fc,$36,$10,$32,$80,$90,$00
        .byte $02,$89,$22,$02,$fe,$89,$fe,$00,$fc,$00,$32,$00,$36,$00,$32,$c5
        .byte $fe,$48,$8b,$00,$be,$dc,$be,$10,$e4,$cd,$81,$00,$ff,$a0,$ff,$fd
        .byte $00,$10,$00,$fd,$00,$cd,$00,$02,$00,$00,$12,$00,$36,$00,$36,$00
        .byte $f9,$ed,$ff,$c0,$76,$00,$fe,$00,$7c,$00,$ff,$00,$11,$fc,$02,$02
        .byte $80,$08,$9a,$fc,$00,$89,$32,$81,$00,$fd,$02,$00,$de,$8d,$76,$89
        .byte $74,$00,$00,$00,$76,$fd,$f4,$fd,$44,$bf,$03,$02,$00,$ff,$00,$02
        .byte $04,$7e,$8f,$ff,$00,$12,$26,$ed,$9b,$12,$dd,$fe,$01,$6e,$00,$bf
        .byte $02,$ff,$00,$fd,$24,$ff,$00,$c9,$00,$02,$09,$ef,$89,$76,$00,$ff
        .byte $89,$76,$cc,$fd,$00,$76,$00,$ff,$00,$fd,$05,$ff,$01,$ff,$89,$12
        .byte $00,$36,$00,$ff,$00,$02,$00,$ef,$1a,$12,$08,$ff,$00,$d6,$00,$02
        .byte $ed,$cb,$cb,$02,$fd,$12,$df,$fd,$93,$ff,$ed,$ff,$08,$ff,$81,$ff
        .byte $04,$12,$00,$7b,$01,$7f,$00,$fe,$00,$ff,$00,$ff,$ec,$02,$08,$fd
        .byte $48,$74,$04,$02,$cd,$fe,$cd,$f6,$8d,$02,$8d,$ff,$00,$72,$81,$76
        .byte $00,$fb,$c9,$ff,$00,$02,$00,$00,$11,$00,$14,$fd,$74,$00,$76,$fd
        .byte $74,$01,$10,$00,$10,$cd,$d9,$10,$00,$cd,$00,$81,$76,$90,$36,$40
        .byte $fc,$00,$de,$00,$da,$00,$8e,$36,$74,$dc,$36,$10,$32,$8c,$96,$00
        .byte $12,$8c,$22,$00,$fe,$81,$fe,$00,$fc,$00,$32,$00,$16,$00,$36,$cd
        .byte $fe,$48,$8b,$00,$be,$dc,$be,$10,$e5,$cd,$83,$00,$ff,$80,$ff,$fd
        .byte $00,$10,$00,$fd,$00,$cd,$00,$02,$00,$00,$12,$00,$b6,$00,$36,$00
        .byte $f9,$cd,$ff,$80,$7e,$0c,$fe,$00,$7c,$00,$ff,$00,$11,$fc,$12,$02
        .byte $90,$88,$9a,$fc,$02,$81,$32,$81,$00,$fd,$02,$00,$de,$cd,$76,$89
        .byte $76,$00,$02,$00,$76,$fd,$f4,$fd,$44,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$0c,$0d,$0e,$0e,$0e
        .byte $0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e
        .byte $0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0f,$10
        .byte $3f,$3f,$3f,$31,$32,$05,$06,$07,$07,$07,$07,$07,$07,$07,$07,$07
        .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
        .byte $07,$07,$07,$07,$08,$09,$11,$12,$3f,$3f,$3f,$31,$32,$2a,$2b,$00
        .byte $01,$02,$02,$02,$40,$41,$43,$44,$45,$43,$42,$43,$46,$47,$43,$42
        .byte $43,$40,$41,$43,$48,$49,$4a,$02,$02,$02,$03,$04,$0a,$0b,$11,$12
        .byte $3f,$3f,$3f,$31,$32,$2a,$2b

        jsr $2221

        .byte $22,$22,$60,$61,$63,$64,$65,$63,$62,$63,$66,$67,$63,$62,$63,$60
        .byte $61,$63,$68,$69,$6a,$22,$22,$22,$23,$24,$0a,$0b,$11,$12,$3f,$3f
        .byte $3f,$31,$32,$25,$26,$27,$27,$27,$27,$27,$27,$27,$27,$27,$27,$27
        .byte $27,$27,$27,$27,$27,$27,$27,$27,$27,$27,$27,$27,$27,$27,$27,$27
        .byte $27,$27,$28,$29,$11,$12,$3f,$3f,$3f

        bit $2e2d
        rol L_2e2e
        rol L_2e2e
        rol L_2e2e
        rol L_2e2e
        rol L_2e2e
        rol L_2e2e
        rol L_2e2e
        rol L_2e2e
        rol L_2e2e
        rol L_2e2e
        rol $2f2e
        bmi L_e570 + $f

        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f

    L_e570:
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$13,$14,$15,$16,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$33,$34,$35,$36,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$17,$18,$19,$1a
        .byte $1b,$1c,$1d,$1e,$4d,$4e,$4f,$50,$3f,$3f,$3f,$13,$14,$1d,$1e,$17
        .byte $18,$15,$16,$13,$14,$1d,$1e,$51,$52,$51,$52,$53,$54,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$37,$38,$39,$3a,$3b,$3c,$3d,$3e,$6d,$6e,$6f,$70
        .byte $3f,$3f,$3f,$33,$34,$3d,$3e,$37,$38,$35,$36,$33,$34,$3d,$3e,$71
        .byte $72,$71,$72,$73,$74,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$5a,$5b,$5b,$5b,$5b,$5b,$5b,$5b,$5b
        .byte $5b,$5b,$5b,$5b,$5b,$5b,$5b,$5b,$5b,$5b,$5b,$5b,$5b,$5b,$5b,$5b
        .byte $5c,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$75
        .byte $55,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$76,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$7a,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b
        .byte $7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b
        .byte $7c,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
        .byte $55,$6a,$60,$61,$61,$61,$61,$61,$55,$aa,$00,$55,$aa,$80,$85,$86
        .byte $55,$aa,$00,$55,$aa,$00,$55,$aa,$55,$aa,$00,$55,$aa,$02,$52,$92
        .byte $55,$a9,$09,$49,$49,$49,$49,$49,$00,$00,$05,$05,$05,$05,$05,$05
        .byte $00,$00,$55,$55,$aa,$aa,$a0,$a0,$00,$00,$55,$55,$aa,$aa,$00,$00
        .byte $00,$00,$55,$55,$aa,$aa,$0a,$0a,$00,$00

        bvc L_e898 + $4
        bvc L_e898 + $6
        bvc L_e898 + $8
        asl 
        asl 
        asl 
        asl 
        asl 
        asl 
        asl 
        asl 
        bvc L_e8a8 + $2
        bvc L_e8a8 + $4
        bvc L_e8a8 + $6
        bvc L_e8a8 + $8

        .byte $00,$00,$05,$05,$05,$05,$05,$05,$00,$00,$55,$55,$55,$6a,$6a,$6a
        .byte $00,$00,$55,$55,$55,$aa,$aa,$aa,$00,$00,$55,$55,$55,$a9,$a9,$a9
        .byte $00,$00

        bvc L_e8c8 + $c
        bvc L_e8c8 + $e
        bvc L_e8d8
        lda #$a9
        lda #$a9
        lda #$a9
        lda #$a9
        bvc L_e8d8 + $a
        bvc L_e8d8 + $c
        bvc L_e8d8 + $e
        bvc L_e8e8

    L_e898:
         .byte $ff,$c0,$d5,$eb,$c3,$d7,$ea,$c3,$ff,$0f,$57,$eb,$c3,$5f,$af,$0f

    L_e8a8:
        .byte $ff,$c3,$d7,$eb,$c3,$d7,$fa,$f0,$ff,$c3,$d7,$eb,$c3,$d7,$af,$0f
        .byte $ff,$fc,$f5,$ea,$c3,$d7,$ea,$c0,$ff,$3f,$5f,$ab,$c3,$d7,$ab,$03

    L_e8c8:
        .byte $ff,$c3,$d7,$ea,$c0,$d5,$ea,$c0,$ff,$c3,$d7,$eb,$c3,$57,$ab,$03

    L_e8d8:
        .byte $ff,$c0,$d5,$eb,$c3,$d7,$eb,$c3,$ff,$3f,$5f,$ab,$c3,$d7,$eb,$c3

    L_e8e8:
        .byte $ff,$c0,$d5,$eb,$c3,$d7,$ea,$c0,$ff,$0f,$57,$eb,$c3,$d7,$af,$0f
        .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$61,$61,$61,$61,$61,$60,$6a,$55
        .byte $86,$85,$80,$aa,$55,$00,$aa,$55,$aa,$55,$00,$aa,$55,$00,$aa,$55
        .byte $92,$52,$02,$aa,$55,$00,$aa,$55,$49,$49,$49,$49,$49,$09,$a9,$55
        .byte $05,$05,$05,$05,$05,$05,$00,$00,$a0,$a0,$aa,$aa,$55,$55,$00,$00
        .byte $00,$00,$aa,$aa,$55,$55,$00,$00,$0a,$0a,$aa,$aa,$55,$55,$00,$00

        bvc L_e996 + $4
        bvc L_e996 + $6
        bvc L_e996 + $8

        .byte $00,$00,$05,$05,$05,$05,$05,$05,$05,$05,$a0,$a0,$a0,$a0,$a0,$a0
        .byte $a0,$a0,$05,$05,$05,$05,$05,$05,$00,$00,$6a,$6a,$6a,$55,$55,$55
        .byte $00,$00,$aa,$aa,$aa,$55,$55,$55,$00,$00,$a9,$a9,$a9,$55,$55,$55
        .byte $00,$00

        bvc L_e9c6 + $c
        bvc L_e9c6 + $e
        bvc L_e9d6

        .byte $00,$00,$05,$05,$05,$05,$05,$05,$05,$05,$6a,$6a,$6a,$6a,$6a,$6a

    L_e996:
        .byte $6a,$6a,$d7,$eb,$c0,$d5,$ff,$ff,$ff,$ff,$d7,$eb,$03,$5f,$ff,$ff
        .byte $ff,$ff,$fd,$fe,$fc,$fd,$ff,$ff,$ff,$ff,$7f,$bf,$3f,$7f,$ff,$ff
        .byte $ff,$ff,$d7,$eb,$c3,$d7,$ff,$ff,$ff,$ff,$d7,$eb,$c3,$d7,$ff,$ff

    L_e9c6:
        .byte $ff,$ff,$d7,$eb,$c3,$d7,$ff,$ff,$ff,$ff,$57,$ab,$c3,$d7,$ff,$ff

    L_e9d6:
        .byte $ff,$ff,$d7,$eb,$c0,$d5,$ff,$ff,$ff,$ff,$d7,$ab,$0f,$7f,$ff,$ff
        .byte $ff,$ff,$d7,$eb,$c3,$d7,$ff,$ff,$ff,$ff,$d7,$eb,$c3,$d7,$ff,$ff
        .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$55,$be,$3c,$7d,$be,$3c
        .byte $7d,$be,$55,$af,$0f,$5f,$af,$0f,$5f,$af,$55,$be,$3c,$7d,$be,$3c
        .byte $7d,$be,$55,$aa,$00,$55,$aa,$00,$55,$aa,$55,$bf,$3f,$7d,$be,$3c
        .byte $7d,$bf,$55,$fa,$fc,$7f,$af,$0f,$7f,$fe,$55,$bf,$3f,$7d,$be,$3c
        .byte $7d,$be,$55,$fe,$ff,$7f,$af,$0f,$5f,$af,$55,$ab,$0f,$7f,$be,$3c
        .byte $7d,$be,$55,$ff,$ff,$7d,$be,$3c,$7d,$be,$55,$ea,$f0,$fd,$be,$3c

    L_ea56:
        .byte $7d,$be,$55,$aa,$00,$55,$aa,$00,$55,$aa,$55,$aa,$00,$55,$aa,$00
        .byte $55,$aa,$ff,$c0,$d5,$eb,$c3,$d5,$ea,$c0,$ff,$03,$57,$ff,$ff,$5f
        .byte $af,$0f,$ff,$c3,$d7,$eb,$c3,$d7,$eb,$c3,$ff,$f0,$f5,$fa

        bmi L_eafb
        tsx 
        bmi $ea88
        beq L_ea56 + $a

        .byte $eb,$c3,$d7,$eb,$c3,$ff,$0f,$57,$eb,$c3,$d7,$eb,$c3,$ff,$c3,$d7
        .byte $eb,$c3,$d5,$ea,$c0,$ff,$c3,$d7,$af,$0f,$7f,$bf,$3f,$ff,$c0,$30
        .byte $0c,$03,$0c,$30,$c0,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$3f
        .byte $3f,$3f,$3f,$3f,$ff,$ff,$cf,$3f,$0f,$0f,$0f,$3f,$cf,$ff,$c3,$33
        .byte $0f,$03,$0f,$33,$c3,$ff,$ff,$ff,$ff,$ff,$f0,$f0,$f3,$ff,$ff,$ff
        .byte $ff,$ff,$00,$00,$ff,$ff,$ff,$ff,$ff,$ff,$0f,$0f,$cf,$ff,$ff,$ff
        .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

    L_eafb:
        .byte $ff,$ff,$ff,$ff,$ff,$be,$7d,$3c,$bf,$5f,$03,$aa,$55,$af,$5f,$0f
        .byte $bf,$fd,$f0,$aa,$55,$be,$7d,$3c,$be,$7d,$3c,$aa,$55,$aa,$55,$00
        .byte $aa,$55,$00,$aa,$55,$bf,$7f,$3c,$be,$7d,$3c,$aa,$55,$fa,$fd,$3f
        .byte $af,$5f,$0f,$aa,$55,$be,$7d,$3c,$be,$7f,$3f,$aa,$55,$af,$5f,$0f
        .byte $bf,$ff,$fc,$aa,$55,$be,$7d,$3c,$be,$7d,$3c,$aa,$55,$be,$7d,$3c
        .byte $be,$7d,$3c,$aa,$55,$be,$7d,$3c,$be,$7d,$3c,$aa,$55,$aa,$55,$00
        .byte $aa,$55,$00,$aa,$55,$aa,$55,$00,$aa,$55,$00,$aa,$55,$d7,$eb,$c0
        .byte $d5,$ff,$ff,$ff,$ff,$ff,$ff,$03,$57,$ff,$ff,$ff,$ff,$d7

    L_eb79:
        nop 
        beq L_eb79

        .byte $ff,$ff,$ff,$ff,$75,$aa,$03,$5f,$ff,$ff,$ff,$ff,$d7,$eb,$c0,$f5
        .byte $ff,$ff,$ff,$ff,$d7,$eb,$03,$5f,$ff,$ff,$ff,$ff,$d7,$eb,$c3,$d7
        .byte $ff,$ff,$ff,$ff,$5f,$af,$c3,$d7,$ff,$ff,$ff,$ff,$f3,$f3,$f3,$f3
        .byte $f3,$f3,$f3,$f3,$cf,$cf,$cf,$cf,$cf,$cf,$cf,$cf,$ff,$ff,$ff,$ff
        .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
        .byte $ff,$ff,$ff,$ff,$f3,$f3,$f0,$f0,$ff,$ff,$ff,$ff,$ff,$ff,$00,$00
        .byte $ff,$ff,$ff,$ff,$cf,$cf,$0f,$0f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
        .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
        .byte $ff,$ff,$ff

        beq $ec01

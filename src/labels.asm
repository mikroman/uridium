//labels.asm
.label playerscore = $20
.label f52 = $52
.label f70 = $70
.label f71 = $71
.label f90 = $90
.label f91 = $91
.label f96 = $96
.label f99 = $99
.label f9c = $9c
.label fa4 = $a4
.label fad = $ad
.label fc0 = $c0
.label fc1 = $c1
.label fc2 = $c2
.label fc3 = $c3
.label fc4 = $c4
.label fc5 = $c5
.label fc6 = $c6
.label fc7 = $c7
.label fc8 = $c8
.label fc9 = $c9
.label fca = $ca
.label fcb = $cb
.label fcc = $cc
.label fcd = $cd
.label fce = $ce
.label ff3 = $f3
.label ff6 = $f6
.label ff9 = $f9
.label ffc = $fc
//
// **** zp absolute adresses **** 
//
.label a01 = $01
.label currentspritemsb = $02
.label a03 = $03
.label spriteindex = $04
.label currentspritexpos = $05
.label a06 = $06
.label currentspriteypos = $07
.label currentspritedisplayenable = $08
.label currentspriteexpandvertical = $09
.label currentspritebackgrounddisplaypriority = $0a
.label currentspritemulticolormode = $0b
.label currentspriteexpandhorizontal = $0c
.label currentspritecolor = $0d
.label currentspritevalue = $0e
.label a0f = $0f
.label a10 = $10
.label a11 = $11
.label a12 = $12
.label a13 = $13
.label somedataloptr = $14
.label somedatahiptr = $15
.label a16 = $16
.label a17 = $17
.label firepressed = $18
.label a19 = $19
.label srcloptr = $1a
.label srchiptr = $1b
.label ramloptr = $1c
.label ramhiptr = $1d
.label a1e = $1e
.label a1f = $1f
.label a20 = $20
.label a21 = $21
.label a22 = $22
.label a23 = $23
.label a24 = $24
.label a25 = $25
.label indextocurrentleveltexturedata = $26
.label a27 = $27
.label a28 = $28
.label a29 = $29
.label a2a = $2a
.label a2b = $2b
.label multicolormodeenabled = $2c
.label a2d = $2d
.label a2e = $2e
.label shouldwaituntilready = $2f
.label a30 = $30
.label a31 = $31
.label a32 = $32
.label a33 = $33
.label a34 = $34
.label a35 = $35
.label a36 = $36
.label a37 = $37
.label a38 = $38
.label a39 = $39
.label a3a = $3a
.label a3b = $3b
.label a3c = $3c
.label a3d = $3d
.label a3e = $3e
.label a3f = $3f
.label newspritevalue = $40
.label a41 = $41
.label spritevalueloptr = $42
.label spritevaluehiptr = $43
.label offsetinspritevaluearray = $44
.label a45 = $45
.label a46 = $46
.label a47 = $47
.label a48 = $48
.label a49 = $49
.label a4a = $4a
.label a4b = $4b
.label a4c = $4c
.label a4d = $4d
.label a4e = $4e
.label a4f = $4f
.label a50 = $50
.label a51 = $51
.label a52 = $52
.label a53 = $53
.label a54 = $54
.label currentcolorvalue = $55
.label a56 = $56
.label a57 = $57
.label a58 = $58
.label a59 = $59
.label a5a = $5a
.label a5b = $5b
.label a5c = $5c
.label currentplayer = $5d
.label a5e = $5e
.label a5f = $5f
.label a60 = $60
.label monochromenabled = $61
.label a62 = $62
.label a63 = $63
.label a64 = $64
.label a65 = $65
.label a66 = $66
.label a67 = $67
.label a68 = $68
.label a69 = $69
.label a6a = $6a
.label a6b = $6b
.label a6c = $6c
.label a6d = $6d
.label a6e = $6e
.label a6f = $6f
.label a7c = $7c
.label a7d = $7d
.label a7e = $7e
.label a7f = $7f
.label a80 = $80
.label a81 = $81
.label a82 = $82
.label a83 = $83
.label a84 = $84
.label a85 = $85
.label a86 = $86
.label a87 = $87
.label a88 = $88
.label a89 = $89
.label a8a = $8a
.label indextotexturesegment = $8d
.label a8e = $8e
.label initialvalueofy = $8f
.label a90 = $90
.label a91 = $91
.label a92 = $92
.label a93 = $93
.label a94 = $94
.label a95 = $95
.label a96 = $96
.label a97 = $97
.label a98 = $98
.label a9d = $9d
.label a9f = $9f
.label aa0 = $a0
.label soundptr = $a1
.label aa2 = $a2
.label aa3 = $a3
.label aa7 = $a7
.label aa8 = $a8
.label aa9 = $a9
.label aaa = $aa
.label anotherrandomnumberbetween0and1 = $ab
.label randomnumberbetween0and1 = $ac
.label aad = $ad
.label aae = $ae
.label temploptrcopyto = $b0
.label temphiptrcopyto = $b1
.label temploptrcopyfrom = $b2
.label temphiptrcopyfrom = $b3
.label currentcharypos = $b4
.label currentcharxpos = $b5
.label chartowrite = $b6
.label ab7 = $b7
.label ab8 = $b8
.label aba = $ba
.label abb = $bb
.label abc = $bc
.label datahiptr = $bf
.label ae8 = $e8
.label aef = $ef
.label af0 = $f0
.label af1 = $f1
.label af2 = $f2
.label afb = $fb
.label afc = $fc
.label afe = $fe
.label aff = $ff
//
// **** zp pointers **** 
//
.label p04 = $04
.label p12 = $12
.label p1e = $1e
.label p52 = $52
.label p6d = $6d
.label p70 = $70
.label pa2 = $a2
.label dataloptr = $be
//
// **** fields **** 
//
.label f0001 = $0001
.label f000e = $000e
.label f0035 = $0035
.label f004b = $004b
.label f0091 = $0091
.label f0096 = $0096
.label f00fc = $00fc
//
// **** pointers **** 
//
.label p10 = $0010
.label p30 = $0030
//
// **** external jumps **** 
//
.label e00fd = $00fd
.label color_ram = $d800
.label screen_ram = $0400
.label screen_ram_hibank = $4800
.label sprite0ptr = screen_ram_hibank + $03f8

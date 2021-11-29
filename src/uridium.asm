//This is the KICKASS version of Uridium. See credits below.
//This Kick version was rebuilt by mikroman
// this is the reverse-engineered source code for the game 'uridium'
// written by andrew braybrook in 1986.
//
// the original code from which this source is derived is the copyright of andrew braybrook.
//
// the original home of this file is at: https://github.com/mwenge/uridium
//
// to the extent to which any copyright may apply to the act of disassembling and reconstructing
// the code from its binary, the author disclaims copyright to this source code.  in place of
// a legal notice, here is a blessing:
//
//    may you do good and not evil.
//    may you find forgiveness for yourself and forgive others.
//    may you share freely, never taking more than you give.
//

//
// **** zp fields **** 
//

BasicUpstart2(launchuridium)

#import "labels.asm"
#import "constants.asm"

*=$0900 "0900"
//-------------------------------------------------------------------
// launchuridium
//-------------------------------------------------------------------
launchuridium:
        sei 

        lda #$0b
        sta $d011    //vic control register 1

        lda #$f0
        sta $d021    //background color 0
        sta $d020    //border color

        lda #$24
        sta a01

        ldy #$fe
        lda #$00
b0916:   sta .a f0001,y
        dey 
        bne b0916

b091c:   ldx #<p8000
        ldy #>p8000
        stx temploptrcopyfrom
        sty temphiptrcopyfrom
        ldx #<$e000
        ldy #>$e000
        stx temploptrcopyto
        sty temphiptrcopyto
        ldx #$20
        jsr copydatauntilxiszero

        ldx #<pc000
        ldy #>pc000
        stx temploptrcopyto
        sty temphiptrcopyto
        ldx #$10
        jsr copydatauntilxiszero

        ldx #<p7c00
        ldy #>p7c00
        stx temploptrcopyfrom
        sty temphiptrcopyfrom
        ldx #<$d200
        ldy #>$d200
        stx temploptrcopyto
        sty temphiptrcopyto
        ldx #$02
        jsr copydatauntilxiszero

        ldx #<p5c00
        ldy #>p5c00
        stx temploptrcopyfrom
        sty temphiptrcopyfrom
        ldx #$0c
        jsr copydatauntilxiszero

        ldx #<screen_ram_hibank + $0000
        ldy #>screen_ram_hibank + $0000
        stx temploptrcopyfrom
        sty temphiptrcopyfrom
        ldx #<pa600
        ldy #>pa600
        stx temploptrcopyto
        sty temphiptrcopyto
        ldx #$04
        jsr copydatauntilxiszero

        ldx #<p7400
        ldy #>p7400
        stx temploptrcopyfrom
        sty temphiptrcopyfrom
        ldx #$04
        jsr copydatauntilxiszero

        // copy code from p1000 to updatesoundptr to randomdatastorage to launchuridium.
        ldx #<p1000
        ldy #>p1000
        stx temploptrcopyfrom
        sty temphiptrcopyfrom
        ldx #<randomdatastorage
        ldy #>randomdatastorage
        stx temploptrcopyto
        sty temphiptrcopyto
        ldy #$00
        jsr copydatauntilyiszero

        jsr copydatafrommaincharactersettop7400
        jsr copydatawithin71007800

//-------------------------------------------------------------------
// drawtitlescreen
//-------------------------------------------------------------------
drawtitlescreen:
        sei 

        lda #$25
        sta a01

        // switch bank to bank 1 ($4000)
        lda $dd02    //cia2: data direction register a
        ora #$03
        sta $dd02    //cia2: data direction register a
        lda $dd00    //cia2: data port register a
        and #$fc
        ora #$02
        sta $dd00    //cia2: data port register a

        jsr initializesomepointers
        ldx #<irqinterrupt1
        ldy #>irqinterrupt1
        stx $fffe    //irq
        sty $ffff    //irq
        ldx #<drawtitlescreen
        ldy #>drawtitlescreen
        stx p8000
        sty a8001
        stx a8002
        sty a8003
        stx $fffc    //hardware reset
        sty $fffd    //hardware reset
        ldx #<p3fd6
        ldy #>p3fd6
        stx $fffa    //nmi
        sty $fffb    //nmi
        lda #$01
        sta $d01a    //vic interrupt mask register (imr)
        lda #$80
        sta $d012    //raster position
        lda #$7f
        sta $dc0d    //cia1: cia interrupt control register
        sta $dd0d    //cia2: cia interrupt control register
        lda $dc0d    //cia1: cia interrupt control register
        lda $dd0d    //cia2: cia interrupt control register
        jsr copyshipspritestop5c00

        // write 4 zeroes to the top left?
        ldx #<screen_ram_hibank
        ldy #>screen_ram_hibank
        stx ramloptr
        sty ramhiptr
        ldx #$04
        lda #$30
        jsr writetoram

        lda #$1f
        sta ab1b9
        jsr updateplayerscore
        lda #$01
        sta ab1b9
        jsr updateplayerscore

        lda #$01
        sta a5c
        cli 

//--------------------------------------------------------------------
// preparetitlescreen   
//--------------------------------------------------------------------
preparetitlescreen: 
        ldx #$ff
        txs 
        lda #$f0
        sta a4a

        // store pointers to joysticks 1 and 2
        ldx #<$dc00
        ldy #>$dc00
        stx joystick1loptr
        sty joystick1hiptr
        ldx #<$dc01
        ldy #>$dc01
        stx joystick2loptr
        sty joystick2hiptr

        ldy #$26
b0a3d:   lda playerlinescolorscheme1,y
        sta color_ram + $0000,y
        and #$f7
        sta color_ram + $0028,y
        lda playerlinescolorscheme2,y
        sta color_ram + $0050,y
        lda playerlinescolorscheme3,y
        sta color_ram + $0078,y
        dey 
        bpl b0a3d

        ldx #<player1text
        ldy #>player1text
        jsr writetoscreen
        ldx #<player2text
        ldy #>player2text
        jsr writetoscreen
        jsr paintplayerscorecolors

        jsr setupsomedata

        lda #$03
        sta a5b

//--------------------------------------------------------------------
// titlescreenloop   
//--------------------------------------------------------------------
titlescreenloop:   
        jsr setinterrupttoirqinterrupt1

        lda #$00
        sta $d015    //sprite display enable
        sta a5a
        sta a28

        lda #$11
        sta a90

        lda #$30
        jsr write21linesofaccumulatorvaltoscreen

        ldx #<color_ram + $00a0
        ldy #>color_ram + $00a0
        stx ramloptr
        sty ramhiptr
        ldx #<colorsforsomething1
        ldy #>colorsforsomething1
        stx srcloptr
        sty srchiptr
        ldy #$14
        jsr writesourcevaluetoram

        ldx #<hewson
        ldy #>hewson
        jsr writetoscreen
        ldx #<presents
        ldy #>presents
        jsr writetoscreen
        ldx #<uridiumtitleplaceholder
        ldy #>uridiumtitleplaceholder
        jsr writetoscreen
        ldx #<graftgoldltd
        ldy #>graftgoldltd
        jsr writetoscreen
        ldx #<designedandprogrammedby
        ldy #>designedandprogrammedby
        jsr writetoscreen
        ldx #<andrewbraybrook
        ldy #>andrewbraybrook
        jsr writetoscreen
        ldx #<spaces
        ldy #>spaces
        jsr writetoscreen

        jsr titlescreenwaitforfiretobepressed
        lda firepressed
        bne preparelargescrollingcreditandhiscore

        // player has pressed fire. start the game.
        jmp drawenterlevelsequence

//--------------------------------------------------------------------
// preparelargescrollingcreditandhiscore   
//--------------------------------------------------------------------
preparelargescrollingcreditandhiscore:   
        lda #$00
        sta indextocurrentleveltexturedata
        lda #$0f
        sta indextotexturesegment
        jsr setupscreenforscrolling
        lda #$fc
        sta a2e
        jsr showlargescrollingcreditandhiscore
        lda firepressed
        bne drawhiscorescreen
        jmp drawenterlevelsequence

//--------------------------------------------------------------------
// drawhiscorescreen   
//--------------------------------------------------------------------
drawhiscorescreen:   
        jsr setinterrupttoirqinterrupt1
        lda #$30
        jsr write21linesofaccumulatorvaltoscreen

        ldx #<color_ram + $00a0
        ldy #>color_ram + $00a0
        stx ramloptr
        sty ramhiptr
        ldx #<p3763
        ldy #>p3763
        stx srcloptr
        sty srchiptr
        ldy #$14
        jsr writesourcevaluetoram

        ldx #<halloffame
        ldy #>halloffame
        jsr writetoscreen
        ldx #<firstinhalloffame
        ldy #>firstinhalloffame
        jsr writetoscreen
        ldx #<secondinhalloffame
        ldy #>secondinhalloffame
        jsr writetoscreen
        ldx #<thirdinhalloffame
        ldy #>thirdinhalloffame
        jsr writetoscreen
        ldx #<fourthinhalloffame
        ldy #>fourthinhalloffame
        jsr writetoscreen
        ldx #<fifthinhalloffame
        ldy #>fifthinhalloffame
        jsr writetoscreen
        ldx #<sixthinhalloffame
        ldy #>sixthinhalloffame
        jsr writetoscreen
        ldx #<seventhinhalloffame
        ldy #>seventhinhalloffame
        jsr writetoscreen
        ldx #<eighthinhalloffame
        ldy #>eighthinhalloffame
        jsr writetoscreen
        jsr titlescreenwaitforfiretobepressed

        lda firepressed
        beq drawenterlevelsequence

        ldx #<demolabel
        ldy #>demolabel
        jsr writetoscreen
        lda #$13
        sta a90
        jsr enterdemomodeuntildeadorplayerpressesfire
        lda firepressed
        beq drawenterlevelsequence
        jmp titlescreenloop

//--------------------------------------------------------------------
// drawenterlevelsequence   
//--------------------------------------------------------------------
drawenterlevelsequence:  
        ldx #$08
b0b67:   lda f3496,x
        sta $0250,x
        sta $0260,x
        sta playerscore,x
        dex 
        bpl b0b67
        lda #$12
        sta a90
        lda #$02
        sta currentplayer
        jsr updateoneuportwouptext
        lda #$2f
        sta a3f4a
        lda #$01
        sta currentplayer
        lda #$02
        sta a5a
        lda #$09
        sta indextotexturesegment
        lda #$1f
        sta ab1b9
        jsr updateplayerscore
        lda #$01
        sta ab1b9
        jsr updateplayerscore

//--------------------------------------------------------------------
// restartlevel   
//--------------------------------------------------------------------
restartlevel:   
        ldx #$08
        lda a5c
        cmp #$01
        beq b0bcc
        lda currentplayer
        cmp #$01
        beq b0bcc
b0baf:   lda $0260,x
        sta playerscore,x
        dex 
        bpl b0baf
        lda #$1f
        sta ab1b9
        lda a25
        bne b0bf2
        ldx #$08
        dec currentplayer
        lda $0255
        bne b0bcc
        jmp jc909

b0bcc:   lda $0250,x
        sta playerscore,x
        dex 
        bpl b0bcc
        lda #$01
        sta ab1b9
        lda a25
        bne b0bf2
        ldx #$08
        lda a5c
        cmp #$01
        bne b0be8
        jmp jc909

b0be8:   inc currentplayer
        lda $0265
        bne b0baf
        jmp jc909

b0bf2:   lda a5c
        bne enternewlevel
        lda currentplayer
        cmp #$01
        beq b0c09
        ldx #<$dc00
        ldy #>$dc00
        stx joystick1loptr
        sty joystick1hiptr
        jmp j0c13

b0c09:   ldx #<$dc01
        ldy #>$dc01
        stx joystick1loptr
        sty joystick1hiptr
j0c13:   stx joystick2loptr
        sty joystick2hiptr

//--------------------------------------------------------------------
// enternewlevel   
//--------------------------------------------------------------------
enternewlevel:   
        jsr setinterrupttoirqinterrupt1
        ldx #<spaces
        ldy #>spaces
        jsr writetoscreen
        jsr updateoneuportwouptext
        jsr updateplayerdecalcolors
        lda #$00
        sta $d015    //sprite display enable
        lda #$30
        jsr write21linesofaccumulatorvaltoscreen

        ldx #<p37bf
        ldy #>p37bf
        stx srcloptr
        sty srchiptr
        ldx #<color_ram + $00a0
        ldy #>color_ram + $00a0
        stx ramloptr
        sty ramhiptr
        ldy #$0d
        jsr writesourcevaluetoram

        ldx #<gameon
        ldy #>gameon
        jsr writetoscreen
        lda currentplayer
        cmp #$01
        beq b0c5f
        ldx #<player2
        ldy #>player2
        jsr writetoscreen
        jmp j0c66

b0c5f:   ldx #<player1
        ldy #>player1
        jsr writetoscreen
j0c66:   lda a25
        ldx #$30
        lsr 
        lsr 
        lsr 
        lsr 
        beq b0c71
        tax 
b0c71:   stx tenslivesleftdisplayed
        lda a25
        and #$0f
        sta livesleftdisplayed
        ldx #<liveslefttext
        ldy #>liveslefttext
        jsr writetoscreen
        ldx #<uridiumdecal
        ldy #>uridiumdecal
        jsr writetoscreen
        lda #$f1
        sta $d026    //sprite multi-color register 1
        lda #$fe
        sta $d025    //sprite multi-color register 0
        ldx #<p32cc
        ldy #>p32cc
        stx srcloptr
        sty srchiptr
        jsr updatespriteindicesandthenredrawsprites
        jsr spinwaitingforjoystickinput
        jsr generaterandomdatafromrng

        lda #<screen_ram + $0003
        sta a91
        lda #>screen_ram + $0003
        sta a92
        lda #$05
        sta a93
        lda #$bf
        sta a62

spinningshipanimationloop:
        jsr checkinputmaybeupdatedecal
        lda firepressed
        beq b0cd7
        lda a62
        beq b0cd7
        jsr maybeshowpausescreen
        jsr storespritecontentcolorandposition
        inc currentspritevalue
        lda currentspritevalue
        cmp #$50
        bcc b0cd1
        lda #$40
        sta currentspritevalue
b0cd1:   jsr updatespritecontentandposition
        jmp spinningshipanimationloop

        // the spinning ship sequence is over, or the user has pressed
        // fire so start the ship deployment sequence.
b0cd7:   lda #$12
        sta a90
        sei 
        jsr playtitletune
        cli 
        jsr setupscreenforscrolling
        jsr updatepointersandfetchsurfacedata
        jsr playshipdeploymentsequence

        lda a4b
        sta $d02e    //sprite 7 color
        ldy #$07
b0cf0:   lda f32ed,y
        sta .a f0035,y
        dey 
        bpl b0cf0

//--------------------------------------------------------------------
// maingameloop   
//--------------------------------------------------------------------
maingameloop:   
        lda shouldwaituntilready
        bne maingameloop

        jsr s2a17
        jsr s2b40
        jsr scrollshipsurface
        jsr s2ed7
        jsr updatecolorsonscreen
        jsr updatespriteandrunfunctionpersprite
        inc a62
        jsr getjoystickinput

        lda a62
        and #$07
        tay 
        lda screenwritejumptablehiptr,y
        sta a0d27
        lda screenwritejumptableloptr,y
        sta a0d26
.label a0d26   =*+$01
.label a0d27   =*+$02   
        jsr maybechangetitledecal

        jsr maybefirebullets
        jsr s2576
        jsr s2635
        jsr s268c
        jsr s2713
        jsr checklandnowwarning
        lda a85
        bpl b0d41
        jmp startlandingsequence

b0d41:   lda a32
        beq maingameloop

//--------------------------------------------------------------------
// maybestartnewlevel   
//--------------------------------------------------------------------
maybestartnewlevel:   
        lda a27
        cmp indextocurrentleveltexturedata
        beq b0d69
        sta indextocurrentleveltexturedata
        cmp #$10
        bcc b0d62
        lda #$01
        sta a27
        sta indextocurrentleveltexturedata
        lda a28
        clc 
        adc #$10
        cmp #$40
        bcs b0d62
        sta a28
b0d62:   lda #$00
        sta a24
        jmp enternewlevel

b0d69:   jsr shiphasbeenhit
        lda a24
        sec 
        sbc #$04
        bpl b0d75
        lda #$00
b0d75:   sta a24
        sed 
        sec 
        lda a25
.label a0d7c =*+$01
        sbc #$01
        sta a25
        cld 
        bne b0de8
        jsr updateoneuportwouptext
        jsr setinterrupttoirqinterrupt1
        lda #$30
        jsr write21linesofaccumulatorvaltoscreen
        ldx #<color_ram + $00a0
        ldy #>color_ram + $00a0
        stx ramloptr
        sty ramhiptr
        ldx #<p37cd
        ldy #>p37cd
        stx srcloptr
        sty srchiptr
        ldy #$0a
        jsr writesourcevaluetoram

        lda currentplayer
        cmp #$01
        beq updateplayeranddrawgameoverscreen
        ldx #<player2
        ldy #>player2
        jsr writetoscreen
        jmp drawgameoverscreen
        //returns

//--------------------------------------------------------------------
// updateplayeranddrawgameoverscreen   
//--------------------------------------------------------------------
updateplayeranddrawgameoverscreen:   
        ldx #<player1
        ldy #>player1
        jsr writetoscreen
        // falls through

//--------------------------------------------------------------------
// drawgameoverscreen   
//--------------------------------------------------------------------
drawgameoverscreen:   
        ldx #<gameover
        ldy #>gameover
        jsr writetoscreen
        ldx #<spaces
        ldy #>spaces
        jsr writetoscreen
        lda #<p1d1c
        sta a91
        lda #>p1d1c
        sta a92
        lda #$1e
        sta a93
        lda #$90
        sta a62
b0dd7:   jsr checkinputmaybeupdatedecal
        lda firepressed
        beq b0de2
        lda a62
        bne b0dd7
b0de2:   jsr spinwaitingforjoystickinput
        jsr displayhiscoreinputscreen
b0de8:   jsr updateoneuportwouptext
        ldx #$08
        lda currentplayer
        cmp #$01
        beq b0e02
b0df3:  lda playerscore,x
        sta $0260,x
        dex 
        bpl b0df3
        lda #$01
        sta currentplayer
        jmp restartlevel

b0e02:   lda playerscore,x
        sta $0250,x
        dex 
        bpl b0e02
        lda a5c
        sta currentplayer
        cmp #$01
        beq b0e16
        lda #$02
        sta currentplayer
b0e16:   jmp restartlevel

//--------------------------------------------------------------------
// startlandingsequence   
//--------------------------------------------------------------------
startlandingsequence:
        jsr landonshipandmayberunminigame
        lda #$00
        sta a32
        jmp maybestartnewlevel

//-------------------------------------------------------------------
// playtitletune
//-------------------------------------------------------------------
playtitletune:   
        lda a90
        beq b0e67
        cmp #$02
        bne b0e2e
        jmp playsomeofthetitletune

b0e2e:   cmp #$01
        bne b0e35
        jmp j0e6b

b0e35:   cmp #$03
        bne b0e3c
        jmp playsomeofthetitletune

b0e3c:   cmp #$11
        beq b0e49
        cmp #$12
        beq b0e5f
        cmp #$13
        beq b0e49
        rts 

b0e49:   jsr playsound
        lda a95
        sta aef
        lda #$01
        sta af2
        lda #<$ffba
        sta a3e99
        lda #>$ffba
        sta a3e9a
        rts 

b0e5f:   jsr playsound
        lda #$0f
        sta aef
        rts 

b0e67:   jsr playsound
b0e6a:   rts 

j0e6b:   dec af2
        beq b0e72
        jmp playsomeofthetitletune

b0e72:   lda #$05
        sta af2
        lda a3e9a
        cmp #$ff
        beq b0e6a
        cmp #$fe
        bne b0eb3
j0e81:   lda a3e99
        asl 
        clc 
        adc a3e99
        tay 
        lda f3d2c,y
        sta a3e9a
        ldx #$00
        cmp #$ff
        bne b0e97
        rts 

b0e97:   lda f3d2c,y
        sty aa0
        tay 
        lda f3d71,y
        sta ff3,x
        lda f3d90,y
        sta ffc,x
        lda #$01
        sta ff6,x
        ldy aa0
        iny 
        inx 
        cpx #$03
        bne b0e97
b0eb3:   lda #$00
        sta a9f
j0eb7:   tax 
        dec ff6,x
        beq b0ebf
        jmp j0f51

b0ebf:   lda ffc,x
        sta aa3
        lda ff3,x
        sta aa2
        ldy #$00
        lda (pa2),y
        bne b0ee4
        iny 
        lda (pa2),y
        and #$07
        eor #$ff
        sec 
        adc #$07
        sta ff9,x
        lda (pa2),y
        iny 
        and #$f0
        lsr 
        lsr 
        lsr 
        lsr 
        sta fa4,x
b0ee4:   lda (pa2),y
        cmp #$ff
        bne b0ef5
        ldy #$fe
        sty a3e9a
        inc a3e99
        jmp j0e81

b0ef5:   tya 
        sec 
        adc ff3,x
        sta ff3,x
        lda #$00
        adc ffc,x
        sta ffc,x
        lda (pa2),y
        and #$f0
        bne b0f0c
        lda #$10
        jmp j0f10

b0f0c:   lsr 
        lsr 
        lsr 
        lsr 
j0f10:   sta ff6,x
        lda ff9,x
        tax 
        lda (pa2),y
        and #$0f
        tay 
        lda f3d10,y
        sta af0
        lda f3d00,y
b0f22:   lsr 
        ror af0
        dex 
        bne b0f22
        sta af1
        ldx a9f
        lda fa4,x
        tay 
        clc 
        adc #$27
        sta f91,x
        lda f3d1e,y
        sta aa3
        lda f3d25,y
        sta aa2
        lda af0
        ldy #$01
        sta (pa2),y
        ldy #$0d
        sta (pa2),y
        lda af1
        iny 
        sta (pa2),y
        ldy #$02
        sta (pa2),y
j0f51:   inc a9f
        lda a9f
        cmp #$03
        beq playsomeofthetitletune
        jmp j0eb7

//--------------------------------------------------------------------
// playsomeofthetitletune   
//--------------------------------------------------------------------
playsomeofthetitletune:   
        lda aef
.label a0f5f =*+$01
        ora #$80
        sta $d418    //select filter mode and volume
        ldy #$00
        sty a9f
b0f67:   lda .a f0091,y
        beq b0f78
        bmi b0f72
        ldx f96,y
        bmi b0f78
b0f72:   sta .a f0096,y
        jsr s105d
b0f78:   ldy a9f
        lda #$00
        sta .a f0091,y
        iny 
        sty a9f
        cpy #$03
        bcc b0f67
        ldx #$00
        stx aa0
        stx a9f
j0f8c:   jsr updatesoundptr
        ldx aa0
        lda fc6,x
        bne b0f98
        jmp j103f

b0f98:   lda fc0,x
        clc 
        adc fc2,x
        sta fc0,x
        ldy soundptr
        sta $d400,y  //voice 1: frequency control - low-byte
        lda fc1,x
        adc fc3,x
        sta fc1,x
        sta $d401,y  //voice 1: frequency control - high-byte
        lda fc7,x
        clc 
        adc fc9,x
        sta fc7,x
        sta $d402,y  //voice 1: pulse waveform width - low-byte
        lda fc8,x
        adc fca,x
        sta fc8,x
        sta $d403,y  //voice 1: pulse waveform width - high-nybble
        beq b0fc6
        cmp #$0f
        bcc b0fd7
b0fc6:   lda fc9,x
        eor #$ff
        clc 
        adc #$01
        sta fc9,x
        lda fca,x
        eor #$ff
        adc #$00
        sta fca,x
b0fd7:   ldx a9f
        ldy f99,x
        beq b0fed
        dey 
        sty f99,x
        bne b0fed
        ldx a9f
        lda f9c,x
        and #$fe
        ldy soundptr
        sta $d404,y  //voice 1: control register
b0fed:   ldx aa0
        ldy fc4,x
        dey 
        sty fc4,x
        bne b104c
        lda fc5,x
        sta fc4,x
        lda fcb,x
        cmp #$01
        beq b1025

//--------------------------------------------------------------------
// p1000   
//--------------------------------------------------------------------
p1000:   
        lda fc2,x
        eor #$ff
        clc 
        adc #$01
p1007:   sta fc2,x
        lda fc3,x
        eor #$ff
        adc #$00
        sta fc3,x
        lda fc9,x
        eor #$ff
        clc 
        adc #$01
        sta fc9,x
        lda fca,x
        eor #$ff
        adc #$00
        sta fca,x
        jmp j102d

b1025:   lda fcc,x
        sta fc0,x
        lda fcd,x
        sta fc1,x
j102d:   ldy fc6,x
        dey 
        sty fc6,x
        bne b104c
        jsr updatesoundsettings
        lda fce,x
        beq j103f
        ldx a9f
        sta f91,x
j103f:   ldx a9f
        lda #$00
        sta f96,x
        cpx #$02
        bne b104c
        jsr playnote
b104c:   inc a9f
        ldy a9f
        cpy #$03
        bcs b105c
        lda f1144,y
        sta aa0
        jmp j0f8c

b105c:   rts 

//-------------------------------------------------------------------
// s105d
//-------------------------------------------------------------------
s105d:   
        jsr updatesoundptr
        lda #$00
        sta aa3
        lda .a f0096,y
        sec 
        sbc #$01
        and #$7f
        asl 
        rol aa3
        asl 
        rol aa3
        asl 
        rol aa3
        asl 
        rol aa3
        clc 
        adc #$ab
        sta aa2
        lda #$39
        adc aa3
        sta aa3
        ldy #$00
        lda (pa2),y
        jsr playsomesound
        ldy a9f
        ldx f1147,y
        ldy #$0f
b1091:   lda (pa2),y
        sta fc0,x
        dex 
        dey 
        bne b1091
        lda a9f
        cmp #$02
        bne b10a4
        lda #$00
        sta a0f5f
b10a4:   rts 

//-------------------------------------------------------------------
// updatesoundsettings
//-------------------------------------------------------------------
updatesoundsettings:   
        ldy soundptr
        lda #$00
        sta $d406,y  //voice 1: sustain / release cycle control
        sta $d405,y  //voice 1: attack / decay cycle control
        lda #$08
        sta $d404,y  //voice 1: control register
        lda #$00
        sta $d404,y  //voice 1: control register
        rts 

//-------------------------------------------------------------------
// playsomesound
//-------------------------------------------------------------------
playsomesound:
        asl 
        asl 
        sta aa0
        jsr updatesoundsettings
        ldx #$03
        ldy soundptr
b10c5:  lda f114a,x
        sta $d400,y  //voice 1: frequency control - low-byte
        iny 
        dex 
        bpl b10c5
        sty soundptr
        ldx #$03
b10d3:   ldy aa0
        lda f3947,y
        inc aa0
        ldy soundptr
        sta $d400,y  //voice 1: frequency control - low-byte
        inc soundptr
        dex 
        bne b10d3
        ldy aa0
        lda f3947,y
        ldx a9f
        sta f99,x
        dey 
        dey 
        dey 
        lda f3947,y
        sta f9c,x
        ora #$01
        ldy soundptr
        dey 
        dey 
        dey 
        sta $d400,y  //voice 1: frequency control - low-byte
        rts 

//-------------------------------------------------------------------
// updatesoundptr
//-------------------------------------------------------------------
updatesoundptr:
        ldx a9f
        lda f1141,x
        sta soundptr
        rts 

//-------------------------------------------------------------------
// playsound
//-------------------------------------------------------------------
playsound:
        and #$0f
        sta a90
        ldy #$18
        lda #$00
b1110:   sta $d400,y  //voice 1: frequency control - low-byte
        dey 
        bpl b1110
        sta a96
        sta a97
        sta a98
        sta a91
        sta a92
        sta a93
        lda #$80
        sta a0f5f
        jsr playnote
        rts 

//-------------------------------------------------------------------
// playnote
//-------------------------------------------------------------------
playnote:
        lda #$ff
        sta $d40e    //voice 3: frequency control - low-byte
        sta $d40f    //voice 3: frequency control - high-byte
        lda #$00
        sta $d413    //voice 3: attack / decay cycle control
        sta $d414    //voice 3: sustain / release cycle control
        lda #$81
        sta $d412    //voice 3: control register
        rts 

f1141:   .byte $00,$07,$0e
f1144:   .byte $00,$0f,$1e
f1147:   .byte $0e,$1d,$2c
f114a:   .byte $08,$00,$00,$00
//-------------------------------------------------------------------
// destructsequenceminigame
//-------------------------------------------------------------------
destructsequenceminigame:
        lda #$f0
        sta a4a
        sta $d021    //background color 0
        sta $d022    //background color 1, multi-color register 0
        sta $d023    //background color 2, multi-color register 1
        ldx #<pa6a0
        ldy #>pa6a0
        stx temploptrcopyfrom
        sty temphiptrcopyfrom
        ldx #<screen_ram_hibank + $00a0
        ldy #>screen_ram_hibank + $00a0
        stx temploptrcopyto
        sty temphiptrcopyto
b116b:   lda shouldwaituntilready
        bne b116b
b116f:   lda shouldwaituntilready
        beq b116f
        ldx #$03
        jsr copydatauntilxiszero
        ldy #$50
        jsr copydatauntilyiszero
        ldx #<$d200
        ldy #>$d200
        stx temploptrcopyfrom
        sty temphiptrcopyfrom
        ldx #<p7c00
        ldy #>p7c00
        stx temploptrcopyto
        sty temphiptrcopyto
        sei 
        lda #$24
        sta a01
        ldx #$02
        jsr copydatauntilxiszero
        lda #$25
        sta a01
        cli 
        lda #$04
        sta initialvalueofy
b11a0:   lda shouldwaituntilready
        beq b11a0
b11a4:   lda shouldwaituntilready
        bne b11a4
        jsr maybeshowpausescreen
        ldy initialvalueofy
        lda f38de,y
        sta a4a
        lda f38e3,y
        sta $d022    //background color 1, multi-color register 0
        lda f38e8,y
        sta $d023    //background color 2, multi-color register 1
        dec initialvalueofy
        bpl b11a0
        ldy #$00
        jsr wastecyclesusingxandy
        jsr wastecyclesusingxandy
        lda indextocurrentleveltexturedata
        sta aad
        lda #>screen_ram + $0209
        sta aa9
        lda #<screen_ram + $0209
        sta aa8
        lda a28
        lsr 
        lsr 
        lsr 
        lsr 
        adc indextocurrentleveltexturedata
        tay 
        lda f310a,y
        sta aae
        sta a62
//--------------------------------------------------------------------
// destructsequenceminigameloop   
//--------------------------------------------------------------------
destructsequenceminigameloop:
        jsr spinwaitingforjoystickinput
        lda $d41b    // random number generator
        and #$01
        sta randomnumberbetween0and1
        lda aa8
        clc 
        adc aad
        sta aaa
        jsr updatesomedataforminigame
        lda $d41b    // random number generator
        and #$01
        sta anotherrandomnumberbetween0and1
        lda #$01
        sta aa7
b1205:   lda shouldwaituntilready
        beq b1205
b1209:   lda shouldwaituntilready
        bne b1209
        jsr getjoystickinput
        jsr updateminigamedisplay
        dec aa7
        bne b1237
        lda anotherrandomnumberbetween0and1
        eor #$01
        sta anotherrandomnumberbetween0and1
        ldy aa9
        lda f3921,y
        sta aa7
        ldy aa9
        lda f3c95,y
        ldx anotherrandomnumberbetween0and1
        cpx randomnumberbetween0and1
        bne b1230
        lsr 
b1230:   sta a3afd
        lda #$16
        sta a92
b1237:   lda anotherrandomnumberbetween0and1
        beq b1284
        ldy aa9
        ldx f3913,y
        lda screenlinehiptrarray,x
        sta somedatahiptr
        lda colorlinehiptrarray,x
        sta ramhiptr
        lda screenlineloptrarray,x
        clc 
        adc f391a,y
        sta somedataloptr
        sta ramloptr
        bcc b125b
        inc somedatahiptr
        inc ramhiptr
b125b:   jsr s1313
        ldy aa9
        ldx f3905,y
        lda screenlinehiptrarray,x
        sta somedatahiptr
        lda colorlinehiptrarray,x
        sta ramhiptr
        lda screenlineloptrarray,x
        clc 
        adc f390c,y
        sta somedataloptr
        sta ramloptr
        bcc b127e
        inc somedatahiptr
        inc ramhiptr
b127e:   jsr clearloptrs
        jmp j12ca

b1284:   ldy aa9
        ldx f3905,y
        lda screenlinehiptrarray,x
        sta somedatahiptr
        lda colorlinehiptrarray,x
        sta ramhiptr
        lda screenlineloptrarray,x
        clc 
        adc f390c,y
        sta somedataloptr
        sta ramloptr
        bcc b12a4
        inc somedatahiptr
        inc ramhiptr
b12a4:   jsr s1313
        ldy aa9
        ldx f3913,y
        lda screenlinehiptrarray,x
        sta somedatahiptr
        lda colorlinehiptrarray,x
        sta ramhiptr
        lda screenlineloptrarray,x
        clc 
        adc f391a,y
        sta somedataloptr
        sta ramloptr
        bcc b12c7
        inc somedatahiptr
        inc ramhiptr
b12c7:   jsr clearloptrs
j12ca:   lda aa8
        beq b12e6
        lda firepressed
        beq b12d5
        jmp b1205

b12d5:   lda anotherrandomnumberbetween0and1
        cmp randomnumberbetween0and1
        beq b12e6
        lda aaa
        sta aad
        dec aa9
        beq b12e6
        jmp destructsequenceminigameloop

b12e6:   ldy #$00
        jsr wastecyclesusingxandy
        jsr wastecyclesusingxandy
        jsr wastecyclesusingxandy
        rts 

//-------------------------------------------------------------------
// updatesomedataforminigame
//-------------------------------------------------------------------
updatesomedataforminigame:
        lda #$80
        sta a3928
        sta a3929
        lda aaa
        sec 
b12fd:   sbc #$0a
        bcc b1306
        inc a3928
        bne b12fd
b1306:   adc #$0a
        sec 
b1309:   sbc #$01
        bcc b1312
        inc a3929
        bne b1309
b1312:  rts 

//-------------------------------------------------------------------
// s1313
//-------------------------------------------------------------------
s1313:   
        ldy #$03
        ldx aa9
        lda anotherrandomnumberbetween0and1
        cmp randomnumberbetween0and1
        beq b132b
b131d:   lda a3928,y
        sta (somedataloptr),y
        lda f3930,x
        sta (ramloptr),y
        dey 
        bpl b131d
        rts 

b132b:   lda f392c,y
        sta (somedataloptr),y
        lda f3930,x
        sta (ramloptr),y
        dey 
        bpl b132b
        rts 

//-------------------------------------------------------------------
// clearloptrs
//-------------------------------------------------------------------
clearloptrs:
        ldy #$03
b133b:   lda #$20
        sta (somedataloptr),y
        lda #$f0
        sta (ramloptr),y
        dey 
        bpl b133b
        rts 

//-------------------------------------------------------------------
// updateminigamedisplay
//-------------------------------------------------------------------
updateminigamedisplay:
        inc a62
        bne b138d
a134b:  dec aa8
        ldy aa8
        lda f3c8b,y
        sta a3aed
        lda #$15
        sta a91
        lda aae
        sta a62
        lda screen_ram_hibank + $011c
        sec 
        sbc #$02
        sta screen_ram_hibank + $011c
        sta screen_ram_hibank + $013a
        lda screen_ram_hibank + $011d
        sec 
        sbc #$02
        sta screen_ram_hibank + $011d
        sta screen_ram_hibank + $013b
        lda screen_ram_hibank + $0144
        sec 
        sbc #$02
        sta screen_ram_hibank + $0144
        sta screen_ram_hibank + $0162
        lda screen_ram_hibank + $0145
        sec 
        sbc #$02
        sta screen_ram_hibank + $0145
        sta screen_ram_hibank + $0163
b138d:   rts 

//-------------------------------------------------------------------
// copydatawithin71007800
//-------------------------------------------------------------------
copydatawithin71007800:
        ldy #$47
b1390:   lda surfacetexturecharacterset,y
        sta f7188,y
        lda f7850,y
        sta f7588,y
        dey 
        bpl b1390

        ldy #$07
b13a1:   lda f7848,y
        sta f73e8,y
        lda f7898,y
        sta f77e8,y
        dey 
        bpl b13a1

        rts 

//-------------------------------------------------------------------
// checkinputmaybeupdatedecal
//-------------------------------------------------------------------
checkinputmaybeupdatedecal:
        jsr getjoystickinput
        jsr maybechangetitledecal
        ldy #$18
        jsr wastecyclesusingxandy
        inc a62
        rts 

//--------------------------------------------------------------------
// processgameframe   
//--------------------------------------------------------------------
processgameframe:
        lda shouldwaituntilready
        bne processgameframe
        jsr s2a17
        jsr s2b40
        jsr scrollshipsurface
        jsr s2ed7
        jsr updatecolorsonscreen
        jsr getjoystickinput
        jsr maybeshowpausescreen
        lda a5f
        sta a17
        jsr maybechangetitledecal
        inc a62
        jsr maybefirebullets
        jsr s2576
        jsr s2635
        rts 

//--------------------------------------------------------------------
// processgameframewithoutcheckingpause   
//--------------------------------------------------------------------
processgameframewithoutcheckingpause:
        lda shouldwaituntilready
        bne processgameframewithoutcheckingpause
        jsr s2a17
        jsr s2b40
        jsr scrollshipsurface
        jsr s2ed7
        jsr updatecolorsonscreen
        jsr getjoystickinput
        lda #$00
        sta a16
        sta a17
        inc a62
        jsr s2576
        jsr s2635
        jsr s27d5
        rts 

//-------------------------------------------------------------------
// landonshipandmayberunminigame
//-------------------------------------------------------------------
landonshipandmayberunminigame:
        lda #$00
        sta a16
        lda #$ff
        sta a5f
        lda #<p9392
        sta a91
        lda #>p9392
        sta a92
b1423:   jsr processgameframe
        jsr s2713
        jsr updatespriteandrunfunctionpersprite
        lda a2936
        sta a49
        lda a2e
        beq b1437
        bne b143b
b1437:   lda #$00
        sta a5f
b143b:   lda a62
        and #$03
        bne b1423
        dec a3d
        lda a3d
        cmp #$05
        bcs b1423
        lda #$00
        sta a5f
        lda #$a0
        sta a62
b1451:   jsr processgameframe
        jsr s2713
        lda a62
        bne b1451
        lda $d015    //sprite display enable
        sta a85
        lda #$00
        sta $d015    //sprite display enable
        lda #$1f
        sta a0f
        lda #$14
        sta a91
        sta a93
        lda #$06
        sta a92
b1473:   jsr scrollscreenright
        jsr scrollscreenleft
        dec a0f
        bne b1473
        jsr destructsequenceminigame
        lda aa8
        bne awardbonuses
        jmp refreshdisplayandreturn
        // returns

//--------------------------------------------------------------------
// awardbonuses   
//--------------------------------------------------------------------
awardbonuses:
        jsr setinterrupttoirqinterrupt1
        lda #$30
        jsr write21linesofaccumulatorvaltoscreen
        ldx #<color_ram + $00a0
        ldy #>color_ram + $00a0
        stx ramloptr
        sty ramhiptr
        ldx #<p378d
        ldy #>p378d
        stx srcloptr
        sty srchiptr
        ldy #$14
        jsr writesourcevaluetoram
        ldx #<destructsequenceprimed
        ldy #>destructsequenceprimed
        jsr writetoscreen
        lda #$17
        sta a91
        ldy #$00
        jsr wastecyclesusingxandy
        jsr wastecyclesusingxandy
        jsr wastecyclesusingxandy
        ldx #<formationannihilationbonus
        ldy #>formationannihilationbonus
        jsr writetoscreen
        lda #$18
        sta a92
        ldy #$00
        jsr wastecyclesusingxandy
        jsr wastecyclesusingxandy
        lda #$0d
        sta scorebonus
        lda a87
        sta initialvalueofy
        lda #$00
        sta a59
        jsr writebonusvaluetoscreen
        ldx #<shipdestructbonus
        ldy #>shipdestructbonus
        jsr writetoscreen
        lda #$19
        sta a92
        ldy #$00
        jsr wastecyclesusingxandy
        jsr wastecyclesusingxandy
        lda #$13
        sta scorebonus
        lda aad
        sta initialvalueofy
        lda #$00
        sta a59
        jsr writebonusvaluetoscreen
        lda #$c0
        sta a62
b1504:   jsr checkinputmaybeupdatedecal
        lda firepressed
        beq b150f
        lda a62
        bmi b1504
b150f:   lda #$ff
        sta a54
        jsr fetchcurrentsurfacedata
        jsr s173b
        jsr generatestarfield
        jsr updatescreencolors
        jsr setinterruptoirqinterrupt2
        lda #$c0
        sta $d015    //sprite display enable
        lda #<p2322
        sta a91
        lda #>p2322
        sta a92
        jsr processgameframe
        jsr s2713
        lda #$01
        sta a5f
        ldy #$80
        jsr wastecyclesusingxandy
b153e:   jsr processgameframe
        jsr s2713
        lda a2936
        sta a49
        lda a2e
        cmp #$fb
        bcs b153e
        lda a3d
        cmp #$18
        bcs b155a
        inc a3d
        jmp b153e

        // start ship destruct sequence
b155a:   jsr processgameframe
        jsr s268c
        jsr s2713
        lda a45
        and #$04
        beq b155a

        lda #$ff
        sta a5f

//--------------------------------------------------------------------
// shipdestructsequence   
//--------------------------------------------------------------------
shipdestructsequence:
        jsr processgameframe
        jsr s268c
        jsr s2713
        jsr updateplayerscore
        lda a2a
        cmp #$0e
        bcs b1582
        jsr s16d2
b1582:   lda $d41b    // random number generator
        and #$3f
        bne b1593
        lda a45
        cmp #$05
        bne b1593
        ora #$80
        sta a46
b1593:   lda a2e
        cmp #$07
        bcc b15a3
        lda #>screen_ram + $0300
        sta a2e
        lda #<screen_ram + $0300
        sta a2d
        sta a5f
b15a3:   lda $d41b    // random number generator
        cmp #$f0
        bcc b15b2
        and #$01
        tay 
        lda #$1a
        sta .a f0091,y
b15b2:   lda a2a
        cmp #$02
        bcs shipdestructsequence
        // falls through

//-------------------------------------------------------------------
// incrementtwovalues
//-------------------------------------------------------------------
incrementtwovalues:
        inc a27
        inc a32
        rts 

//--------------------------------------------------------------------
// refreshdisplayandreturn   
//--------------------------------------------------------------------
refreshdisplayandreturn:
        jsr updateoneuportwouptext
        jsr generatestarfield
        jsr fetchcurrentsurfacedata
        jsr updatescreencolors
        jsr scrollshipsurface
        lda #$c0
        sta $d015    //sprite display enable
a15d1:   inc a32
        rts 

//-------------------------------------------------------------------
// scrollscreenright
//-------------------------------------------------------------------
scrollscreenright:
        lda shouldwaituntilready
        bne scrollscreenright
        ldx #<screen_ram_hibank + $00a0
        ldy #>screen_ram_hibank + $00a0
        stx srcloptr
        sty srchiptr
        ldx #<color_ram + $00a0
        ldy #>color_ram + $00a0
        stx a12
        sty a13

        lda #$1e
        sta initialvalueofy
b15ec:   ldy #$01
b15ee:   lda (srcloptr),y
        dey 
        sta (srcloptr),y
        iny 
        lda (p12),y
        dey 
        sta (p12),y
        iny 
        iny 
        cpy initialvalueofy
        bcc b15ee
        dey 
        lda #$20
        sta (srcloptr),y
        lda #$f8
        sta (p12),y
        clc 
        lda srcloptr
        adc #$28
        sta srcloptr
        bcc b1613
        inc srchiptr
b1613:   clc 
        lda a12
        adc #$28
        sta a12
        bcc b161e
        inc a13
b161e:   dec initialvalueofy
        lda initialvalueofy
        cmp #$09
        bcs b15ec
        rts 

//-------------------------------------------------------------------
// scrollscreenleft
//-------------------------------------------------------------------
scrollscreenleft:
        ldx #<screen_ram_hibank + $00a0
        ldy #>screen_ram_hibank + $00a0
        stx srcloptr
        sty srchiptr
        ldx #<color_ram + $00a0
        ldy #>color_ram + $00a0
        stx a12
        sty a13
        lda #$1d
        sta initialvalueofy
b163b:   ldy #$26
b163d:   lda (srcloptr),y
        iny 
        sta (srcloptr),y
        dey 
        lda (p12),y
        iny 
        sta (p12),y
        dey 
        dey 
        cpy initialvalueofy
        bcs b163d
        clc 
        lda srcloptr
        adc #$28
        sta srcloptr
        bcc b1659
        inc srchiptr
b1659:   clc 
        lda a12
        adc #$28
        sta a12
        bcc b1664
        inc a13
b1664:   dec initialvalueofy
        lda initialvalueofy
        cmp #$09
        bcs b163b
        rts 

//-------------------------------------------------------------------
// maybedisplaylandnowwarning
//-------------------------------------------------------------------
maybedisplaylandnowwarning:
        lda a85
        beq b1676
        cmp #$01
        beq b1683
b1675:   rts 

b1676:   ldy a24
        lda (p6d),y
        cmp #$ff
        bne b1675
        lda #$01
        sta a85
        rts 

b1683:   lda a86
        cmp #$6f
        bne b16bc
        lda a45
        cmp #$01
        bne b16bc
        lda #$80
        sta a85
        lda a2936
        sta a49
        ldy #$05
b169a:   lda indextofunctionptrarray,y
        beq b16a9
        lda #$06
        sta indextofunctionptrarray,y
        lda #$14
        sta sprite0ptr,y
b16a9:   dey 
        bpl b169a
b16ac:   ldx #<spaces
        ldy #>spaces
        jsr writetoscreen
        rts 

        lda a88
        bne b16bc
        lda #$ff
        sta a88
b16bc:   lda a62
        and #$1f
        beq b16ac
        cmp #$10
        bne b1675
        ldx #<landnowtext
        ldy #>landnowtext
        jsr writetoscreen
        lda #$8f
        sta a91
        rts 

//-------------------------------------------------------------------
// s16d2
//-------------------------------------------------------------------
s16d2:   
        lda a89
        sta a12
        lda a8a
        sta a13
        cmp #$82
        bne b16e4
        lda a89
        cmp #$20
        bcc b173a
b16e4:   ldx #$11
b16e6:   ldy fa4d0,x
        lda (p12),y
        cmp #$20
        beq b16f9
        lda $d41b    // random number generator
        and #$01
        clc 
        adc #$f9
        sta (p12),y
b16f9:   iny 
        lda (p12),y
        cmp #$20
        beq b170a
        lda $d41b    // random number generator
        and #$01
        clc 
        adc #$fb
        sta (p12),y
b170a:   iny 
        lda (p12),y
        cmp #$20
        beq b171b
        lda $d41b    // random number generator
        and #$01
        clc 
        adc #$fd
        sta (p12),y
b171b:   iny 
        lda #$20
        sta (p12),y
        iny 
        sta (p12),y
        iny 
        sta (p12),y
        inc a13
        inc a13
        dex 
        bne b16e6
        lda a89
        sec 
        sbc #$01
        sta a89
        lda a8a
        sbc #$00
        sta a8a
b173a:   rts 

//-------------------------------------------------------------------
// s173b
//-------------------------------------------------------------------
s173b:   
        ldx #<p83e0
        ldy #>p83e0
        stx a89
        sty a8a
        ldx #$11
        lda #$08
        sta a0f
b1749:   lda $d41b    // random number generator
        cmp #$55
        bcc b1765
        cmp #$aa
        bcc b175d
        lda a0f
        beq b1765
        dec a0f
        jmp b1765

b175d:   lda a0f
        cmp #$10
        bcs b1765
        inc a0f
b1765:   lda a0f
        sta fa4d0,x
        dex 
        bne b1749
        rts 

//-------------------------------------------------------------------
// writebonusvaluetoscreen
//-------------------------------------------------------------------
writebonusvaluetoscreen:
        lda #$00
        sta a3870
        sta a3871
        sta a3875
        sta a3876
        lda initialvalueofy
j177e:   sec 
        sbc #$0a
        bcc b178c
        inc a3870
        inc a3875
        jmp j177e

b178c:   clc 
        adc #$0a
j178f:   sec 
        sbc #$01
        bcc b179d
        inc a3871
        inc a3876
        jmp j178f

b179d:   ldx #<scorebonus
        ldy #>scorebonus
        jsr writetoscreen
        lda a59
        bne b17b3
        ldy #$00
        jsr wastecyclesusingxandy
        jsr wastecyclesusingxandy
        jsr wastecyclesusingxandy
b17b3:   inc a59
        lda initialvalueofy
        beq b17cb
        ldy #$04
        jsr maybeupdateoneuportwouptext
        jsr updateplayerscore
        ldy #$20
        jsr wastecyclesusingxandy
        dec initialvalueofy
        jmp writebonusvaluetoscreen

b17cb:   rts 

//-------------------------------------------------------------------
// setinterrupttoirqinterrupt1
//-------------------------------------------------------------------
setinterrupttoirqinterrupt1:
        lda shouldwaituntilready
        bne setinterrupttoirqinterrupt1
        lda #$f0
        sta $d021    //background color 0
        sei 
        ldx #<irqinterrupt1
        ldy #>irqinterrupt1
        stx $fffe    //irq
        sty $ffff    //irq
        cli 
        rts 

//-------------------------------------------------------------------
// setinterruptoirqinterrupt2
//-------------------------------------------------------------------
setinterruptoirqinterrupt2:
        lda shouldwaituntilready
        bne setinterruptoirqinterrupt2
        lda #$fc
        sta $d012    //raster position
        sei 
        ldx #<irqinterrupt2
        ldy #>irqinterrupt2
        stx $fffe    //irq
        sty $ffff    //irq
        cli 
        rts 

//-------------------------------------------------------------------
// displayhiscoreinputscreen
//-------------------------------------------------------------------
displayhiscoreinputscreen:
        lda #$09
        sta a85
        ldx #<eighthinhalloffame
        ldy #>eighthinhalloffame
        stx srcloptr
        sty srchiptr
        ldx #<somedatahiptrarray
        ldy #>somedatahiptrarray
        stx somedataloptr
        sty somedatahiptr
j180c:   ldy #$12
b180e:   lda (srcloptr),y
        cmp .a f000e,y
        bcc b181f
        beq b181a
        jmp j184a

b181a:   iny 
        cmp #$16
        bcc b180e
b181f:   ldy #$05
b1821:   lda (srcloptr),y
        sta (somedataloptr),y
        iny 
        cpy #$16
        bcc b1821
        dec a85
        ldx srcloptr
        ldy srchiptr
        stx somedataloptr
        sty somedatahiptr
        lda srcloptr
        sec 
        sbc #$16
        sta srcloptr
        lda srchiptr
        sbc #$00
        sta srchiptr
        lda a85
        cmp #$01
        beq b1851
        jmp j180c

j184a:   lda a85
        cmp #$09
        bne b1851
        rts 

b1851:   ldx #$00
        stx a10
        lda #$28
        sta initial2
        jsr sc900
        ldx #<spaces
        ldy #>spaces
        jsr writetoscreen
        ldx #<pleaseenteryourinitials
        ldy #>pleaseenteryourinitials
        jsr writetoscreen
        ldx #<youveamassedahighscore
        ldy #>youveamassedahighscore
        jsr writetoscreen
        lda #$1f
        sta a91
        sta a93
        lda #$20
        sta a92
        lda #$00
        sta a62
        lda #$05
        sta a59
        jsr checkinitialsinput
        jsr checkinitialsinput
        jsr checkinitialsinput
        ldx #$02
        ldy #$0e
b1891:   lda initialsinputfield,x
        sta (somedataloptr),y
        iny 
        inx 
        cpx #$05
        bcc b1891
        ldx #$03
        ldy #$15
b18a0:   lda playerscore,x
        sta (somedataloptr),y
        dey 
        dex 
        bpl b18a0
        ldy #$05
        lda #<p30
        sta a0f
        ldx #>p30
        stx a10
b18b2:   ldx a10
        lda playerscore,x
        lsr 
        lsr 
        lsr 
        lsr 
        bne b18d9
        lda a0f
j18be:   sta (somedataloptr),y
        iny 
        ldx a10
        lda playerscore,x
        and #$0f
        bne b18e0
        lda a0f
j18cb:   sta (somedataloptr),y
        iny 
        inc a10
        ldx a10
        cpx #$04
        bne b18b2
        jmp j18e7

b18d9:   ldx #$00
        stx a0f
        jmp j18be

b18e0:   ldx #$00
        stx a0f
        jmp j18cb

j18e7:   lda a85
        cmp #$01
        beq b18ee
        rts 

b18ee:   ldx #$0c
b18f0:   lda currenthighestscore,x
        sta ingamehiscoredisplay,x
        dex 
        bpl b18f0
        ldx #$00
        ldy #$00
b18fd:   lda currenthighestscore,x
        cmp #$30
        beq b1908
        sta f34c3,y
        iny 
b1908:   inx 
        cpx #$07
        bcc b18fd
b190d:   lda currenthighestscore,x
        sta f34c3,y
        iny 
        inx 
        cpx #$0c
        bcc b190d
        rts 

//-------------------------------------------------------------------
// checkinitialsinput
//-------------------------------------------------------------------
checkinitialsinput:
        lda a59
        beq b1973
        ldy #$00
        sty a11
b1922:   jsr checkinputmaybeupdatedecal
        jsr checkinputmaybeupdatedecal
        jsr updatecolorsofinitials
        lda a16
        ora a17
        clc 
        adc a11
        bmi b193c
        cmp #$1b
        bcc b193e
        lda #$00
        beq b193e
b193c:   lda #$1a
b193e:   sta a11
        tay 
        lda f38c3,y
        ldx a10
        sta initialone,x
        ldx #<initialsinputfield
        ldy #>initialsinputfield
        jsr writetoscreen
        lda a62
        bne b1958
        dec a59
        beq b1973
b1958:   lda firepressed
        bne b1922
b195c:   jsr checkinputmaybeupdatedecal
        jsr checkinputmaybeupdatedecal
        jsr updatecolorsofinitials
        lda a62
        bne b196d
        dec a59
        beq b1973
b196d:   lda firepressed
        beq b195c
        inc a10
b1973:   rts 

//-------------------------------------------------------------------
// updatecolorsofinitials
//-------------------------------------------------------------------
updatecolorsofinitials:
        lda a62
        and #$0e
        lsr 
        tax 
        lda f37b3,x
        sta a37ac
        lda f37b4,x
        sta a37ab
        sta a37a9
        lda f37b5,x
        sta a37a8
        sta a37a6
        lda f37b6,x
        sta a37a5
        sta a37a3
        lda f37b7,x
        sta a37a2
        ldx #<a37a2
        ldy #>a37a2
        stx srcloptr
        sty srchiptr
        ldx #<color_ram + $00a0
        ldy #>color_ram + $00a0
        stx ramloptr
        sty ramhiptr
        ldy #$10
        jsr writesourcevaluetoram
        rts 

//-------------------------------------------------------------------
// updateoneuportwouptext
//-------------------------------------------------------------------
updateoneuportwouptext:
        ldx #$30
        lda currentplayer
        cmp #$01
        bne b19da
        lda a25
        lsr 
        lsr 
        lsr 
        lsr 
        beq b19c8
        tax 
b19c8:   stx a3142
        lda a25
        and #$0f
        sta a3143
        ldx #<oneuptext
        ldy #>oneuptext
        jsr writetoscreen
        rts 

b19da:   lda a25
        lsr 
        lsr 
        lsr 
        lsr 
        beq b19e3
        tax 
b19e3:   stx a3149
        lda a25
        and #$0f
        sta a314a
        ldx #<twouptext
        ldy #>twouptext
        jsr writetoscreen
        rts 

//-------------------------------------------------------------------
// maybeupdateoneuportwouptext
//-------------------------------------------------------------------
maybeupdateoneuportwouptext:
        sed 
        lda f38f9,y
        clc 
        adc a23
        sta a23
        lda f38ed,y
        adc a22
        sta a22
        php 
        lda a21
        adc #$00
        sta a21
        lda a20
        adc #$00
        sta a20
        bcc b1a21
        lda #$99
        sta a20
        sta a21
        sta a22
        sta a23
        plp 
        cld 
        rts 

b1a21:   plp 
        bcc b1a36
        clc 
        lda a25
        adc #$01
        bcs b1a36
        sta a25
        cld 
        jsr updateoneuportwouptext
        lda #$81
        sta a91
        rts 

b1a36:   cld 
        rts 

//-------------------------------------------------------------------
// updatepointersandfetchsurfacedata
//-------------------------------------------------------------------
updatepointersandfetchsurfacedata:
        ldy indextocurrentleveltexturedata
        lda fc100,y
        sta a6d
        lda fc110,y
        sta a6e
        lda #$00
        sta a87
        sta a85
        lda #$80
        sta a6c
        sta a68
        jsr fetchcurrentsurfacedata
        rts 

//.label fe040 = $e040
//-------------------------------------------------------------------
// fetchcurrentsurfacedata
//-------------------------------------------------------------------
fetchcurrentsurfacedata:
        sei 
        lda #$24
        sta a01
        ldy indextocurrentleveltexturedata
        lda fe040,y
        sta temphiptrcopyfrom
        lda #$00
        sta temploptrcopyfrom
        sta temploptrcopyto
        lda #>p7c00
        sta temphiptrcopyto
        ldx #$04
        jsr copydatauntilxiszero
        lda #$25
        sta a01
        cli 
        rts 

//-------------------------------------------------------------------
// updateanddisplaysomesprites
//-------------------------------------------------------------------
updateanddisplaysomesprites:
        lda a62
        and #$3f
        cmp #$21
        bne b1a97
        lda a6c
        beq b1a98
        cmp #$80
        bne b1a97
        lda #$00
        sta a6c
        lda a88
        bne b1a93
        lda a68
        bne b1a93
        inc a87
b1a93:   lda #$00
        sta a88
b1a97:   rts 

b1a98:   lda #$00
        sta srchiptr
        lda #$80
        sta a6c
        lda #$ae
        sta a92
        ldy a24
        lda (p6d),y
        cmp #$ff
        bne b1ab9
        lda $d41b    // random number generator
        and #$03
        clc 
        adc #$12
        sta a68
        jmp j1abf

b1ab9:   inc a24
        ldx #$00
        stx a68
j1abf:  asl 
        rol srchiptr
        asl 
        rol srchiptr
        asl 
        rol srchiptr
        asl 
        rol srchiptr
        sta srcloptr
        lda srchiptr
        adc #$c2
        sta srchiptr
        lda #$ff
        sta currentspritedisplayenable
        sta currentspritemulticolormode
        sta a06
        lda a4f
        sta currentspritecolor
        ldy #$0e
        lda (srcloptr),y
        sta a7e
        tax 
        lda f36f3,x
        sta a66
        eor #$ff
        clc 
        adc #$01
        sta a63
        lda #$00
        sta a6b
        sta a67
        sta a83
        lda #$ff
        sta a64
        sta a81
        lda f3703,x
        sta a82
        eor #$ff
        clc 
        adc #$01
        sta a80
        lda a25
        lsr 
        clc 
        adc indextocurrentleveltexturedata
        adc a28
        adc f3713,x
        sta a69
        lda f3723,x
        sta a6a
        lda f3733,x
        sta a7f
        lda f3743,x
        sta a65
        dey 
        lda (srcloptr),y
        beq b1b45
        cmp #$ff
        beq b1b36
        lda $d41b    // random number generator
        bpl b1b45
b1b36:   lda a2e
        eor #$ff
        clc 
        adc #$01
        sta a84
        lda a2e
        bmi b1b4d
        bpl b1b5b
b1b45:   lda #$00
        sta a84
        lda a2e
        bmi b1b5b
b1b4d:   lda #$a4
        sta currentspritexpos
        lda a7e
        clc 
        adc #$a0
        sta currentspritevalue
        jmp j1b83

b1b5b:   lda #$a2
        sta currentspritexpos
        lda a7e
        clc 
        adc #$b0
        sta currentspritevalue
        lda a63
        ldx a66
        stx a63
        sta a66
        lda a64
        ldx a67
        stx a64
        sta a67
        lda a65
        eor #$ff
        clc 
        adc #$01
        sta a65
        lda #$ff
        sta a6b
j1b83:   ldy #$0c
        lda (srcloptr),y
        sta a7c
        lda #$00
        sta a7d
        ldy #>screen_ram + $010a
        sty a11
        ldx #<screen_ram + $010a
        stx a10
b1b95:   ldy a11
        sty spriteindex
        lda (srcloptr),y
        beq b1bc0
        ldx a10
        tay 
        lda fc120,y
        sta f70,x
        inx 
        lda fc190,y
        sta f70,x
        ldy a11
        lda #$02
        sta indextofunctionptrarray,y
        inc a6c
        inc a88
        lda a7d
        sta fa4b0,y
        clc 
        adc a7c
        sta a7d
b1bc0:   tya 
        clc 
        adc #$06
        tay 
        lda (srcloptr),y
        bne b1bcb
        lda a33
b1bcb:   sta currentspriteypos
        jsr updatespritesizecolorandpriority
        ldy a11
        lda a6b
        sta fa4e8,y
        lda #$00
        sta fa4b8,y
        sta fa4a8,y
        sta fa4c0,y
        sta fa4a0,y
        sta fa4c8,y
        lda a84
        sta fa498,y
        bpl b1bf4
        lda #$ff
        sta fa4a8,y
b1bf4:   dec a10
        dec a10
        dec a11
        bpl b1b95
        rts 

//-------------------------------------------------------------------
// updatespriteandrunfunctionpersprite
//-------------------------------------------------------------------
updatespriteandrunfunctionpersprite:
        lda #$0a
        sta a10
        lsr 
        sta a11
        lda #$ff
        sta currentspritemulticolormode
        sta currentspritedisplayenable
        lda #$00
        sta currentspritebackgrounddisplaypriority
b1c0e:   ldy a11
        sty spriteindex
        lda indextofunctionptrarray,y
        and #$0e
        beq b1c2e

        // run a function for the sprite.
        tax 
        lda functionptrarray,x
        sta functionhiptr
        lda functionptrarray + $01,x
        sta functionloptr
        jsr storespritecontentcolorandposition
        ldy a11
.label functionhiptr =*+$01
.label functionloptr =*+$02
        jsr performdetailedupdateforsprite

b1c2e:   dec a10
        dec a10
        dec a11
        bpl b1c0e
        rts 

//--------------------------------------------------------------------
// updatespritepositionvalueandfunctionptrindex   
//--------------------------------------------------------------------
updatespritepositionvalueandfunctionptrindex:
        jsr incrementspritexpos
        lda a62
        and #$01
        bne b1c57
        inc currentspritevalue
        lda currentspritevalue
        cmp #$1e
        bcc b1c57
        lda #$00
        sta currentspritedisplayenable
        ldy a11
        sta indextofunctionptrarray,y
        dec a6c
        jsr updatespritecontentandposition
        rts 

b1c57:   jmp detectspriteleavingscreen

//-------------------------------------------------------------------
// incrementspritexpos
//-------------------------------------------------------------------
incrementspritexpos:
        clc 
        lda a2e
        bmi b1c68
        adc currentspritexpos
        sta currentspritexpos
        bcc b1c67
        inc a06
b1c67:   rts 

b1c68:  adc currentspritexpos
        sta currentspritexpos
        lda a06
        adc #$ff
        sta a06
        rts 

//-------------------------------------------------------------------
// performdetailedupdateforsprite
//-------------------------------------------------------------------
performdetailedupdateforsprite:
        jsr incrementspritexpos
        jsr calculatespritexypos
        lda fa4b0,y
        bne b1ca7
        ldx a10
        lda (p70,x)
        cmp #$ff
        beq b1ca7
        inc f70,x
        bne b1c8c
        inc f71,x
b1c8c:   pha 
        and #$7f
        sta fa4b8,y
        pla 
        bmi b1c9c
        lda #$01
        sta fa4b0,y
        bne b1ca7
b1c9c:   lda (p70,x)
        sta fa4b0,y
        inc f70,x
        bne b1ca7
        inc f71,x
b1ca7:   lda fa4b0,y
        sec 
        sbc #$01
        sta fa4b0,y
        lda fa4b8,y
        sta a6f
        bne b1cba
        jmp j1db0

b1cba:   and #$0f
        beq b1d31
        and #$01
        beq b1cde
        lda fa4c0,y
        clc 
        adc a63
        sta fa4c0,y
        lda fa498,y
        adc a64
        sta fa498,y
        lda fa4a8,y
        adc a64
        sta fa4a8,y
        jmp j1cfd

b1cde:   lda a6f
        and #$02
        beq j1cfd
        lda fa4c0,y
        clc 
        adc a66
        sta fa4c0,y
        lda fa498,y
        adc a67
        sta fa498,y
        lda fa4a8,y
        adc a67
        sta fa4a8,y
j1cfd:  lda a6f
        and #$04
        beq b1d17
        lda fa4c8,y
        clc 
        adc a82
        sta fa4c8,y
        lda fa4a0,y
        adc a83
        sta fa4a0,y
        jmp j1db0

b1d17:   lda a6f
        and #$08
.label p1d1c =*+$01
        beq b1d2e
        lda fa4c8,y
        clc 

        adc a80
        sta fa4c8,y
        lda fa4a0,y
        adc a81
        sta fa4a0,y
b1d2e:   jmp j1db0

b1d31:   lda a6f
        and #$10
        beq b1d44
        lda fa4e8,y
        cmp #$80
        bne b1d41
        jsr maybefireenemyshipbullet
b1d41:   jmp j1dcb

b1d44:   lda a6f
        and #$20
        beq b1d5e
        lda #$00
        sta fa4c0,y
        sta fa498,y
        sta fa4a8,y
        sta fa4c8,y
        sta fa4a0,y
        jmp j1dcb

b1d5e:   lda a6f
        and #$40
        beq j1db0
        lda currentspriteypos
        cmp a33
        beq b1da8
        bcc b1d8b
        lda fa4a0,y
        beq b1d77
        bpl b1da8
        cmp #$fc
        bcc j1db0
b1d77:   lda fa4c8,y
        clc 
        adc a80
        sta fa4c8,y
        lda fa4a0,y
        adc a81
        sta fa4a0,y
        jmp j1db0

b1d8b:   lda fa4a0,y
        bmi b1da8
        cmp #$05
        bcs j1db0
        lda fa4c8,y
        clc 
        adc a82
        sta fa4c8,y
        lda fa4a0,y
        adc a83
        sta fa4a0,y
        jmp j1db0

b1da8:   lda #$00
        sta fa4c8,y
        sta fa4a0,y
j1db0:   lda a62
        and #$07
        cmp spriteindex
        bne j1dcb
        lda fa4e8,y
        cmp #$80
        bne j1dcb
        lda a69
        beq j1dcb
        cmp $d41b    // random number generator
        bcc j1dcb
        jsr maybefireenemyshipbullet
j1dcb:   lda a06
        ror 
        lda currentspritexpos
        ror 
        lsr 
        lsr 
        sec 
        sbc #$02
        cmp #$27
        bcc b1ddd
        jmp animateenemyships

b1ddd:   sta a0f
        lda #$80
        sta fa4e8,y
        lda currentspriteypos
        lsr 
        lsr 
        lsr 
        sec 
        sbc #$05
        cmp #$17
        bcc b1df3
        jmp j1ea2

b1df3:   cmp #$06
        bcs b1dfa
        jmp j1ea2

b1dfa:   tax 
        lda screenlinehiptrarray,x
        sta srchiptr
        lda screenlineloptrarray,x
        clc 
        adc a0f
        sta srcloptr
        bcc b1e0c
        inc srchiptr
b1e0c:   ldy #$00
        lda (srcloptr),y
        cmp #$20
        bcc b1e2d
        iny 
        lda (srcloptr),y
        cmp #$20
        bcc b1e2d
        ldy #$28
        lda (srcloptr),y
        cmp #$20
        bcc b1e2d
        iny 
        lda (srcloptr),y
        cmp #$20
        bcc b1e2d
        jmp j1ea2

b1e2d:   and #$0f
        tax 
        lda fa460,x
        beq b1e4b
        lda fa430,x
        sta ramloptr
        lda fa440,x
        sta ramhiptr
        ldy #$00
        lda fa450,x
        sta (ramloptr),y
        lda #$00
        sta fa460,x
b1e4b:   lda a68
        bne b1e54
        ldy a7f
        jsr maybeupdateoneuportwouptext
b1e54:   lda #$26
        sta a92
        ldy a11
        lda #$06
        sta indextofunctionptrarray,y
        lda #$14
        sta currentspritevalue
        dec a88
        jmp j1ea2

//--------------------------------------------------------------------
// animateenemyships   
//--------------------------------------------------------------------
animateenemyships:
        lda a06
        and #$01
        beq j1ea2
        lda fa4e8,y
        cmp #$80
        bne b1e87
        lda currentspritexpos
        bmi b1e80
        lda #$ff
        sta fa4e8,y
        bne j1ea2
b1e80:   lda #$00
        sta fa4e8,y
        beq j1ea2
b1e87:   cmp #$ff
        bne b1e93
        lda currentspritexpos
        cmp #$e8
        bcc j1ea2
        bcs b1e99
b1e93:   lda currentspritexpos
        cmp #$78
        bcs j1ea2
b1e99:   lda #$00
        sta currentspritedisplayenable
        sta indextofunctionptrarray,y
        dec a6c
j1ea2:   jsr updatespritecontentandposition
        rts 

//--------------------------------------------------------------------
// detectspriteleavingscreen   
//--------------------------------------------------------------------
detectspriteleavingscreen:
        lda a06
        and #$01
        beq b1ebf
        lda currentspritexpos
        cmp #$9c
        bcc b1ebf
        cmp #$c4
        bcs b1ebf
        lda #$00
        sta currentspritedisplayenable
        sta indextofunctionptrarray,y
        dec a6c
b1ebf:  jsr updatespritecontentandposition
        rts 

//--------------------------------------------------------------------
// maybeanimateenemybullet   
//--------------------------------------------------------------------
maybeanimateenemybullet:
        jsr incrementspritexpos
        jsr calculatespritexypos
        lda fa4b0,y
        sec 
        sbc #$01
        sta fa4b0,y
        beq enemybulletisoffscreen
        jsr animateenemybullet
        bcc b1ee1
        lda a3d
        cmp #$14
        bcs b1ee1
a1edf:   inc a32
b1ee1:   jmp detectspriteleavingscreen
        // returns

//--------------------------------------------------------------------
// enemybulletisoffscreen   
//--------------------------------------------------------------------
enemybulletisoffscreen:
        lda #$14
        sta currentspritevalue
        lda #$06
        sta indextofunctionptrarray,y
        lda #$0a
        sta a92
        jmp detectspriteleavingscreen
        // returns

//-------------------------------------------------------------------
// calculatespritexypos
//-------------------------------------------------------------------
calculatespritexypos:
        lda fa498,y
        clc 
        adc currentspritexpos
        sta currentspritexpos
        lda fa4a8,y
        adc a06
        sta a06
        lda fa4c8,y
        asl 
        lda fa4a0,y
        adc currentspriteypos
        sta currentspriteypos
        rts 

//-------------------------------------------------------------------
// maybefireenemyshipbullet
//-------------------------------------------------------------------
maybefireenemyshipbullet:
        ldy #$05
b1f11:   lda indextofunctionptrarray,y
        beq firebulletfromenemyship
        dey 
        bpl b1f11
        ldy a11
        rts 

//--------------------------------------------------------------------
// firebulletfromenemyship   
//--------------------------------------------------------------------
firebulletfromenemyship:
        sty spriteindex
        lda currentspritevalue
        pha 
        lda #$ff
        sta currentspritedisplayenable
        lda a6a
        sta currentspritevalue
        jsr updatespritecontentandposition
        ldy a11
        lda fa498,y
        ldx fa4a8,y
        ldy spriteindex
        clc 
        adc a65
        sta fa498,y
        txa 
        adc a6b
        sta fa4a8,y
        lda #$00
        sta fa4a0,y
        sta fa4c8,y
        lda #$04 // maybeanimateenemybullet
        sta indextofunctionptrarray,y
        lda #$a0
        sta fa4b0,y
        pla 
        sta currentspritevalue
        inc a6c
        ldy a11
        sty spriteindex
        lda #$0b
        sta a92
        rts 

//--------------------------------------------------------------------
// maybeanimateminecreation  
//--------------------------------------------------------------------
maybeanimateminecreation:
        jsr incrementspritexpos
        lda a62
        and #$03
        bne b1f7c
        dec currentspritevalue
        lda currentspritevalue
        cmp #$14
        bcs b1f7c
        lda #$0a
        sta indextofunctionptrarray,y
        lda #$11
        sta currentspritevalue
b1f7c:   jmp detectspriteleavingscreen

//--------------------------------------------------------------------
// maybelaunchmine   
//--------------------------------------------------------------------
maybelaunchmine:
        lda a6c
        bpl b1f9a
        lda a69
        beq b1f9a
        lsr 
        lsr 
        cmp $d41b    // random number generator
        bcc b1f9a
        ldx a54
        bmi b1f9a
b1f92:   lda $0240,x
        bpl launchmine
        dex 
        bpl b1f92
b1f9a:   rts 

//--------------------------------------------------------------------
// launchmine   
//--------------------------------------------------------------------
launchmine:
        ldy #$05
b1f9d:   lda indextofunctionptrarray,y
        beq b1fa6
        dey 
        bpl b1f9d
        rts 

b1fa6:   sty spriteindex
        lda #$ff
        sta currentspritedisplayenable
        lda #$1d
        sta currentspritevalue
        lda #$0d
        sta a92
        lda #$08
        sta indextofunctionptrarray,y
        lda indextocurrentleveltexturedata
        asl 
        asl 
        adc a28
        ora #$80
        sta fa4b0,y
        lda #$00
        sta fa498,y
        sta fa4a8,y
        sta fa4a0,y
        lda $0220,x
        asl 
        asl 
        asl 
        clc 
        adc #$2c
        sta currentspriteypos
        lda $0240,x
        clc 
        adc #$02
        asl 
        asl 
        asl 
        sta currentspritexpos
        lda #$00
        rol 
        sta a06
        jsr updatespritecontentandposition
        inc a6c
        rts 

//-------------------------------------------------------------------
// animateenemybullet
//-------------------------------------------------------------------
animateenemybullet:
        lda a06
        and #$01
        bne b201f
        lda currentspritexpos
        cmp #$a2
        bcc b201f
        cmp #$b2
        bcs b201f
        lda currentspriteypos
        sec 
        sbc a33
        sta a0f
        clc 
        ldx currentspritevalue
        adc f374f,x
        sec 
        sbc #$05
        bmi b201f
        lda a0f
        clc 
        adc f3747,x
        sec 
        sbc #$0f
        bpl b201f
        sec 
        rts 

b201f:   clc 
        rts 

//--------------------------------------------------------------------
// maybemineexplodes   
//--------------------------------------------------------------------
maybemineexplodes:
        jsr incrementspritexpos
        jsr calculatespritexypos
        jsr animateminemovememnt
        lda fa4b0,y
        sec 
        sbc #$01
        sta fa4b0,y
        beq b204f
        and #$0f
        cmp spriteindex
        bne b203f
        lda #$0e
        sta a92
b203f:   jsr animateenemybullet
        bcc b204c
        lda a3d
        cmp #$14
        bcs b204c
a204a:   inc a32
b204c:   jmp detectspriteleavingscreen

b204f:   lda #$14
        sta currentspritevalue
        lda #$06
        sta indextofunctionptrarray,y
        lda #$0a
        sta a91
        jmp detectspriteleavingscreen

//-------------------------------------------------------------------
// animateminemovememnt
//-------------------------------------------------------------------
animateminemovememnt:
        lda a62
        and #$03
        bne b20d2
        lda currentspriteypos
        cmp a33
        bcc b2074
        lda fa4a0,y
        sec 
        sbc #$01
        jmp j207a

b2074:   lda fa4a0,y
        clc 
        adc #$01
j207a:   sta fa4a0,y
        lda a06
        and #$01
        bne b208b
        lda currentspritexpos
        cmp #$aa
        bcc b2091
        bcs b20a5
b208b:   lda currentspritexpos
        cmp #$a0
        bcc b20a5
b2091:   lda fa498,y
        clc 
        adc #$01
        sta fa498,y
        lda fa4a8,y
        adc #$00
        sta fa4a8,y
        jmp j20b6

b20a5:   lda fa498,y
        clc 
        adc #$ff
        sta fa498,y
        lda fa4a8,y
        adc #$ff
        sta fa4a8,y
j20b6:   bpl b20de
        lda fa498,y
        cmp #$fa
        bcs b20c4
        lda #$fa
        sta fa498,y
b20c4:   lda fa4a0,y
        bpl b20d3
        cmp #$fc
        bcs b20d2
        lda #$fc
        sta fa4a0,y
b20d2:   rts 

b20d3:   cmp #$04
        bcc b20d2
        lda #$04
        sta fa4a0,y
        bne b20d2
b20de:   lda fa498,y
        cmp #$06
        bcc b20c4
        lda #$06
        sta fa498,y
        bne b20c4

//-------------------------------------------------------------------
// setupscreenforscrolling
//-------------------------------------------------------------------
setupscreenforscrolling:
        jsr updatepositionofpointerstotexturedata
        lda #$40
        sta a29
        lda #$f1
        sta a4a
        lda #$00
        sta a2a
        jsr updatetexturedataforcurrentship
        jsr clearanotherdataptrarray
        jsr updatescreencolors
        jsr s2e17
        jsr scrollshipsurface
        jsr s2ed7
        jsr generatestarfield
        lda #$fb
        sta $d025    //sprite multi-color register 0
        lda #$00
        sta a34
        sta a2e
        sta a3f
        sta a47
        sta a46
        sta a3e
        sta a32
        lda #$ff
        sta a2d
        lda #$10
        sta a3d
        lda #$05
        sta a45
        lda #$59
        sta newspritevalue
        lda #$98
        sta a33
        lda #$01
        sta a48
        lda a2936
        sta a49
        lda a4b
        sta $d02e    //sprite 7 color
        lda #$2f
        sta a3f4a
        jsr setinterruptoirqinterrupt2
        rts 

//-------------------------------------------------------------------
// titlescreenwaitforfiretobepressed
//-------------------------------------------------------------------
titlescreenwaitforfiretobepressed:
        lda #$02
        sta a59
        lda #$00
        sta a62
b2158:  jsr getjoystickinput
        jsr domorewithjoystickinput
        jsr updatevolumesetting
        jsr maybechangetitledecal
        jsr updateplayerandjoystickdisplay
        jsr maybeupdatecolorscheme
        ldy #$0c
        jsr wastecyclesusingxandy
        inc a62
        lda firepressed
        beq b217d
        lda a62
        bne b2158
        dec a59
        bne b2158
b217d:   rts 

//-------------------------------------------------------------------
// showlargescrollingcreditandhiscore
//-------------------------------------------------------------------
showlargescrollingcreditandhiscore:
        lda #$00
        sta a62
b2182:   lda shouldwaituntilready
        bne b2182
        jsr s2b40
        jsr scrollshipsurface
        jsr s2ed7
        jsr updatecolorsonscreen
        jsr getjoystickinput
        jsr domorewithjoystickinput
        jsr maybechangetitledecal
        jsr updatevolumesetting
        jsr maybeupdatecolorscheme
        jsr updateplayerandjoystickdisplay
        inc a62
        lda firepressed
        beq b21b4
        lda a2a
        cmp #$0e
        bcc b2182
        lda a29
        bpl b2182
b21b4:   rts 

//-------------------------------------------------------------------
// enterdemomodeuntildeadorplayerpressesfire
//-------------------------------------------------------------------
enterdemomodeuntildeadorplayerpressesfire:
        lda #$01
        sta a5a
        lda #$00
        sta a5f
        sta a5e
        sta a20
        sta a21
        sta a22
        sta a23
        sta a24
        lda #$07
        sta indextotexturesegment
        lda #$10
        sta a8e
        lda randomdatastorage
        and #$07
        clc 
        adc #$01
        sta indextocurrentleveltexturedata
        jsr setupscreenforscrolling
        jsr updatepointersandfetchsurfacedata
        lda #$08
        sta a59
        ldx #<p32c1
        ldy #>p32c1
        stx srcloptr
        sty srchiptr
        jsr updatespriteindicesandthenredrawsprites
        lda a3319
        sta srchiptr
        lda a330f
        sta srcloptr
        jsr updatespriteindicesandthenredrawsprites
        lda a4e
        sta $d025    //sprite multi-color register 0
        lda a4b
        sta $d02e    //sprite 7 color
        lda #$ff
        sta currentcolorvalue
        ldy #$07
b220d:   lda f32ed,y
        sta .a f0035,y
        dey 
        bpl b220d
b2216:   lda shouldwaituntilready
        bne b2216
        jsr s2a17
        jsr s2b40
        jsr scrollshipsurface
        jsr s2ed7
        jsr updatecolorsonscreen
        jsr updatespriteandrunfunctionpersprite
        jsr updateanddisplaysomesprites
        jsr getjoystickinput
        jsr domorewithjoystickinput
        jsr updatevolumesetting
        lda firepressed
        beq b227b
        lda #$00
        sta a22
        inc a62
        lda a62
        and #$03
        tay 
        lda f36dd,y
        sta a2254
        lda f36e1,y
        sta a2255

.label a2254 =*+$01
.label a2255 =*+$02
        jsr maybechangetitledecal
        jsr randomlymanipulatejoystick
        jsr maybefirebullets
        jsr s2576
        jsr s2635
        jsr s268c
        jsr s2713
        lda a32
        bne b227c
        lda a62
        bne b2216
        dec a59
        bne b2216
        lda #$10
        sta firepressed
        jsr generaterandomdatafromrng
b227b:   rts 

b227c:   lda #$10
        sta firepressed
        jsr shiphasbeenhit
        jsr generaterandomdatafromrng
        rts 

//-------------------------------------------------------------------
// randomlymanipulatejoystick
//-------------------------------------------------------------------
randomlymanipulatejoystick:
        lda a8e
        sta firepressed
        lda $d41b    // random number generator
        cmp #$be
        bcc b229a
        lda firepressed
        eor #$10
        sta firepressed
        sta a8e
b229a:   lda a5e
        sta a16
        lda $d41b    // random number generator
        cmp #$b4
        bcc b22b6
        ldy #$00
        cmp #$dc
        bcc b22b2
        iny 
        cmp #$ee
        bcc b22b2
        dey 
        dey 
b22b2:   sty a16
        sty a5e
b22b6:   lda a5f
        sta a17
        lda $d41b    // random number generator
        cmp #$b4
        bcc b22d2
        ldy #$00
        cmp #$dc
        bcc b22ce
        iny 
        cmp #$ee
        bcc b22ce
        dey 
        dey 
b22ce:   sty a17
        sty a5f
b22d2:   rts 

//-------------------------------------------------------------------
// maybechangetitledecal
//-------------------------------------------------------------------
maybechangetitledecal:
        lda a62
        and #$7f
        bne b231c
        lda a5b
        sta a0f
        clc 
        adc #$01
        and #$03
        sta a5b
        beq b231d
        lda a5a
        cmp #$03
        beq b231d
        lda a5b
        cmp #$01
        beq b2325
        cmp #$02
        beq b232d
        lda a5a
        cmp #$02
        beq b2335
b22fc:   lda a5c
        tay 
        lda scrollingtitlescreendatahiptrarray,y
        ldx scrollingtitlescreendataloptrarray,y
        tay 
        jsr writetoscreen
        lda monochromenabled
        beq b2315

        ldx #<f34f5
        ldy #>f34f5
        jsr writetoscreen
        rts 

b2315:   ldx #<arrowkeyssymbol
        ldy #>arrowkeyssymbol
        jsr writetoscreen
b231c:   rts 

b231d:   ldx #$f9
        ldy #$34
.label p2322 =*+$01
        jsr writetoscreen
        rts 

b2325:   ldx #<hiscorelabel
        ldy #>hiscorelabel
        jsr writetoscreen
        rts 

b232d:   ldx #<ingamebanner
        ldy #>ingamebanner
        jsr writetoscreen
        rts 

b2335:   ldy indextocurrentleveltexturedata
        ldx $e050,y
        lda $e060,y
        tay 
        jsr writetoscreen
        rts 

//-------------------------------------------------------------------
// updateplayerandjoystickdisplay
//-------------------------------------------------------------------
updateplayerandjoystickdisplay:
        lda a19
        and #$10
        beq b2351
        lda a19
        and #$a0
        cmp #$80
        beq b237b
        rts 

b2351:   ldx #<$dc00
        ldy #>$dc00
        stx joystick1loptr
        sty joystick1hiptr
        ldx #<$dc01
        ldy #>$dc01
        stx joystick2loptr
        sty joystick2hiptr
        lda a19
        bmi b2389
        lda #$02
        sta a5c
        ldx #<player1symbol
        ldy #>player1symbol
        jsr writetoscreen
j2374:   lda a5b
        cmp #$03
        beq b22fc
        rts 

b237b:   lda #$00
        sta a5c
        ldx #<player2symbol
        ldy #>player2symbol
        jsr writetoscreen
        jmp j2374

b2389:   lda #$01
        sta a5c
        ldx #<playerandjoysticksymbol
        ldy #>playerandjoysticksymbol
        jsr writetoscreen
        jmp j2374

//-------------------------------------------------------------------
// write21linesofaccumulatorvaltoscreen
//-------------------------------------------------------------------
write21linesofaccumulatorvaltoscreen:
        ldx #<screen_ram_hibank + $00a0
        ldy #>screen_ram_hibank + $00a0
        stx ramloptr
        sty ramhiptr
        ldx #$15
        jsr writetoram
        rts 

//-------------------------------------------------------------------
// writesourcevaluetoram
//-------------------------------------------------------------------
writesourcevaluetoram:
        sty initialvalueofy
b23a7:   ldy initialvalueofy
        lda (srcloptr),y
        ldx #$01
        jsr writetoram
        dec initialvalueofy
        bpl b23a7
        rts 

//-------------------------------------------------------------------
// maybeupdatecolorscheme
//-------------------------------------------------------------------
maybeupdatecolorscheme:
        lda a19
        and #$08
        bne b23d6
        lda a19
        bpl b23d7
        ldx #<colorlabel
        ldy #>colorlabel
        jsr writetoscreen
        lda #$00
        sta monochromenabled
        jsr paintplayerscorecolors
        lda a5b
        cmp #$03
        bne b23d6
        jmp b22fc

b23d6:   rts 

b23d7:   ldx #<blckwhitelabel
        ldy #>blckwhitelabel
        jsr writetoscreen
        lda #$ff
        sta monochromenabled
        jsr paintplayerscorecolors
        lda a5b
        cmp #$03
        bne b23d6
        jmp b22fc

        rts 

//-------------------------------------------------------------------
// paintplayerscorecolors
//-------------------------------------------------------------------
paintplayerscorecolors:
        lda monochromenabled
        beq b2402
        lda #$f1
        sta color_ram + $005a
        sta color_ram + $005b
        sta color_ram + $0082
        sta color_ram + $0083
        rts 

b2402:   lda #$f2
        sta color_ram + $005a
        sta color_ram + $005b
        lda #<$f6f5
        sta color_ram + $0082
        lda #>$f6f5
        sta color_ram + $0083
        rts 

//-------------------------------------------------------------------
// setupsomedata
//-------------------------------------------------------------------
setupsomedata:
        ldx #$00
        stx a10
        stx a11
b241b:   ldy f349f,x
        bmi b244d
        lda pc000,y
        clc 
        adc #$60
        sta srcloptr
        lda #$c0
        adc #$00
        sta srchiptr
        ldy #$00
        ldx a11
b2432:   lda (srcloptr),y
        beq b243a
        sta f8010,x
        inx 
b243a:   iny 
        cpy #$04
        bcc b2432
        lda #$01
        sta f8010,x
        inx 
        stx a11
        inc a10
        ldx a10
        bpl b241b

b244d:   ldx a11
        ldy #$03
        lda #$00
b2453:   sta f8010,x
        inx 
        dey 
        bpl b2453
        rts 

//-------------------------------------------------------------------
// shiphasbeenhit
//-------------------------------------------------------------------
shiphasbeenhit:
        lda #$00
        sta $d015    //sprite display enable
        sta a3f
        lda #$06
        sta a59
        lda #$0c
        sta a91
        sta a92
        lda #$f8
        sta $d026    //sprite multi-color register 1
        lda #$f0
        sta $d025    //sprite multi-color register 0
        ldx #<p32e2
        ldy #>p32e2
        stx srcloptr
        sty srchiptr
        jsr updatespriteindicesandthenredrawsprites
        lda a33
        sta currentspriteypos
        jsr updatespritecontentandposition
j2488:   lda a32
        bpl b2490
        lda #$00
        sta a2e
b2490:   lda a59
        bmi b24bf
        lda #$07
        sta spriteindex
        jsr storeshipspritestate
        lda a59
        sta spriteindex
        lda $d41b    // random number generator
        and #$0f
        sec 
        sbc #$08
        clc 
        adc currentspritexpos
        sta currentspritexpos
        lda #$30
        sta currentspritevalue
        lda $d41b    // random number generator
        and #$0f
        sbc #$08
        clc 
        adc currentspriteypos
        sta currentspriteypos
        jsr updatespritesizecolorandpriority
b24bf:   jsr processgameframewithoutcheckingpause

        lda #$07
        sta spriteindex
b24c6:   jsr storeshipspritestate
        inc currentspritevalue
        lda currentspritevalue
        cmp #$3b
        bcc b24d5
        lda #$00
        sta currentspritedisplayenable
b24d5:   jsr updatespritesizecolorandpriority
        dec spriteindex
        bpl b24c6

        jsr processgameframewithoutcheckingpause
        jsr processgameframewithoutcheckingpause

        lda a2e
        beq b2506
        bmi b24f8
        lda a2d
        sec 
        sbc #$80
        sta a2d
        lda a2e
        sbc #$00
        sta a2e
        jmp j2508

b24f8:   clc 
        lda a2d
        adc #$80
        sta a2d
        bcc b2503
        inc a2e
b2503:   jmp j2508

b2506:   sta a2d
j2508:   lda a5a
        cmp #$02
        beq b2515
        lda firepressed
        beq b2523
        jmp j2518

b2515:   jsr updateplayerscore
j2518:   dec a59
        lda a59
        cmp #$f0
        beq b2523
        jmp j2488

b2523:   rts 

//--------------------------------------------------------------------
// updatecurrentcolorvalue   
//--------------------------------------------------------------------
updatecurrentcolorvalue:
        lda a62
        and #$38
        lsr 
        lsr 
        lsr 
        tax 
        lda currentcolorvaluearray,x
        sta currentcolorvalue
        rts 

//-------------------------------------------------------------------
// generatestarfield
//-------------------------------------------------------------------
generatestarfield:
        ldx #<screen_ram_hibank + $00a0
        ldy #>screen_ram_hibank + $00a0
        stx ramloptr
        sty ramhiptr
        lda #$30
        sta a10
        jsr writestufftoscreen
        clc 
        lda ramloptr
        adc #$28
        sta ramloptr
        bcc b254c
        inc ramhiptr
b254c:   jsr writestufftoscreen
        ldx #<screen_ram_hibank + $0398
        ldy #>screen_ram_hibank + $0398
        stx ramloptr
        sty ramhiptr
        jsr writestufftoscreen
        clc 
        lda ramloptr
        adc #$28
        sta ramloptr
        bcc b2565
        inc ramhiptr
b2565:   jsr writestufftoscreen

        ldy #$05
        lda #$20
b256c:   sta screen_ram_hibank + $03ac,y
        sta screen_ram_hibank + $03d4,y
        dey 
        bpl b256c
        rts 

//-------------------------------------------------------------------
// s2576
//-------------------------------------------------------------------
s2576:   
        lda a49
        beq b25b0
b257a:   lda a16
        beq b259e
        bmi b258f
        inc a34
        lda a34
        bmi b258e
        cmp a36
        bcc b258e
        lda a36
        sta a34
b258e:   rts 

b258f:   dec a34
        lda a34
        bpl b258e
        cmp a35
        bcs b258e
        lda a35
        sta a34
        rts 

b259e:  lda a34
        cmp #$ff
        beq b25ab
        rol 
        lda a34
        ror 
        sta a34
        rts 

b25ab:   lda #$00
        sta a34
        rts 

b25b0:   lda a16
        bne b25b9
        inc a49
        jmp b259e

b25b9:   lda a3f
        bne b257a
        lda a45
        bmi b257a
        and #$03
        cmp #$01
        bne b25df
        clc 
        adc a16
        and #$03
        ora #$80
        sta a0f
        lda a3e
        cmp #$03
        bcc b257a
b25d6:   lda a45
        and #$fc
        ora a0f
        sta a46
        rts 

b25df:   lda #$81
        sta a0f
        bne b25d6
        // never falls through

//-------------------------------------------------------------------
// copyshipspritestop5c00
//-------------------------------------------------------------------
copyshipspritestop5c00:
        ldx #<mantashipsprites
        ldy #>mantashipsprites
        stx srcloptr
        sty srchiptr
        ldx #<p5c00
        ldy #>p5c00
        stx ramloptr
        sty ramhiptr
        ldy #$00
b25f7:   lda (srcloptr),y
        and #$aa
        lsr 
        sta a0f
        lda (srcloptr),y
        and #$55
        asl 
        ora a0f
        ora (srcloptr),y
        sta (ramloptr),y
        iny 
        bne b25f7
        inc srchiptr
        inc ramhiptr
        lda srchiptr
        cmp #$5c
        bcc b25f7
        rts 

//--------------------------------------------------------------------
// b2617   
//--------------------------------------------------------------------
b2617:   
        bmi b2627
        clc 
        adc a2d
        sta a2d
        lda a2e
        adc #$00
        bmi b2650
        jmp j2679

b2627:   clc 
        adc a2d
        sta a2d
        lda a2e
        adc #$ff
        bmi b2650
        jmp j2679

//-------------------------------------------------------------------
// s2635
//-------------------------------------------------------------------
s2635:   
        lda a3f
        bne b2617
        lda a45
        and #$04
        bne b2668
        lda a17
        beq b2659
        bmi b265a
        lda a2d
        clc 
        adc a39
        sta a2d
        lda a2e
        adc #$ff
b2650:   sta a2e
        eor #$ff
        clc 
        adc #$01
        sta a3e
b2659:   rts 

b265a:   lda a2d
        clc 
        adc a3a
        sta a2d
        lda a2e
        adc #$00
        jmp b2650

b2668:   lda a17
        beq b2659
        bpl b267e
        lda a2d
        clc 
        adc a3b
        sta a2d
        lda a2e
        adc #$00

//--------------------------------------------------------------------
// j2679   
//--------------------------------------------------------------------
j2679:
        sta a2e
        sta a3e
        rts 

b267e:   lda a2d
        clc 
        adc a3c
        sta a2d
        lda a2e
        adc #$ff
        jmp j2679

//-------------------------------------------------------------------
// s268c
//-------------------------------------------------------------------
s268c:
        lda a34
        clc 
        adc a33
        cmp #$62
        bcs b2697
        lda #$62
b2697:   cmp #$d7
        bcc b269d
        lda #$d7
b269d:   sta a33
        lda a2e
        bmi b26d1
        cmp a38
        bcc b26ab
        lda a38
        sta a2e
b26ab:  lda a45
        bmi b26eb
        lda a2a
        bne b26ba
        lda #$c8
        sta a3f
        jmp b26eb

b26ba:   cmp #$0e
        bcc b26eb
        lda a29
        bpl b26eb
b26c2:   lda a45
        ora #$80
        sta a46
        jmp b26eb

b26cb:   lda a29
        bmi b26eb
        bpl b26c2
b26d1:   cmp a37
        bcs b26d9
        lda a37
        sta a2e
b26d9:   lda a45
        bmi b26eb
        lda a2a
        bmi b26eb
        beq b26cb
        cmp #$0e
        bcc b26eb
        lda #$38
        sta a3f
b26eb:   lda a3e
        cmp #$03
        bcs b26ff
        cmp #$02
        bcs b2700
        lda a45
        bmi b26ff
        eor #$04
        ora #$80
        sta a46
b26ff:   rts 

b2700:  lda a45
        bmi b26ff
        and #$03
        cmp #$01
        beq b26ff
        lda a45
        and #$fc
        ora #$81
        sta a46
        rts 

//-------------------------------------------------------------------
// s2713
//-------------------------------------------------------------------
s2713:
        lda a46
        bpl b2774
        lda a45
        and #$04
        beq b2757
        lda a45
        asl 
        asl 
        asl 
        and #$18
        sta a0f
        lda a46
        and #$07
        ora a0f
        tax 
        lda spritevalueoffsetloptrarray,x
        sta spritevalueloptr
        lda spritevalueoffsethiptrarray,x
        sta spritevaluehiptr
j2737:   ldy #$00
        lda (spritevalueloptr),y
        sta offsetinspritevaluearray
        tay 
        iny 
        lda (spritevalueloptr),y
        sta a47
        bne b2749
        lda a3f
        bne b274e
b2749:   iny 
        lda (spritevalueloptr),y
        sta a3f
b274e:   lda a46
        sta a45
        lda #$00
        sta a46
        rts 

b2757:   lda a45
        asl 
        asl 
        asl 
        and #$18
        sta a0f
        lda a46
        and #$07
        ora a0f
        tax 
        lda spritevalueloptrarray,x
        sta spritevalueloptr
        lda spritevaluehiptrarray,x
        sta spritevaluehiptr
        jmp j2737

b2774:   lda a45
        bmi b277b
        jmp j27a3

b277b:   lda a62
        and #$01
        bne j27a3
        ldy offsetinspritevaluearray
        lda (spritevalueloptr),y
        sta newspritevalue
        lda a47
        beq b2793
        lda f32f5,y
        clc 
        adc a3d
        sta a3d
b2793:   dec offsetinspritevaluearray
        bne j27a3
        lda a45
        and #$7f
        sta a45
        lda #$00
        sta a3f
        sta a47
j27a3:   lda #$06
        sta spriteindex
        jsr storespritecontentcolorandposition
        lda newspritevalue
        sta currentspritevalue
        clc 
        adc #$30
        sta a41
        lda a33
        sta currentspriteypos
        jsr updatespritecontentandposition
        inc spriteindex
        jsr storespritecontentcolorandposition
        lda a41
        sta currentspritevalue
        lda a3d
        lsr 
        clc 
        adc a33
        sta currentspriteypos
        lda #$aa
        clc 
        adc a3d
        sta currentspritexpos
        jsr updatespritecontentandposition
        // falls through
//-------------------------------------------------------------------
// s27d5
//-------------------------------------------------------------------
s27d5:
        ldy newspritevalue
        lda f33e8,y
        sta a56
        and #$01
        sta a57
        tay 
        bne b27fd
        lda (p52),y
        bpl b27ef
        cmp #$90
        bcs b27ef
.label a27ec =*+$01
        lda #$80
        sta a32
b27ef:   ldy #$02
        lda (p52),y
        bpl b27fd
        cmp #$90
        bcs b27fd
.label a27fa =*+$01
        lda #$80
        sta a32
b27fd:   ldy #$01
        lda (p52),y
        sta a86
        bpl b280d
        cmp #$90
        bcs b280d
.label a280a =*+$01
        lda #$80
        sta a32
b280d:   lda a56
        bpl b2838
        dec a53
        dec a53
        lda (p52),y
        bpl b2821
        cmp #$90
        bcs b2821
.label a281e =*+$01
        lda #$80
        sta a32
b2821:   lda a53
        clc 
        adc #$04
        sta a53
        lda (p52),y
        bpl b2834
        cmp #$90
        bcs b2834
.label a2831 =*+$01
        lda #$80
        sta a32
b2834:   dec a53
        dec a53
b2838:   rts 

//-------------------------------------------------------------------
// playshipdeploymentsequence
//-------------------------------------------------------------------
playshipdeploymentsequence:
        jsr checkinputduringdeploymentsequence
        ldx #$07
b283e:  lda f3306,x
        sta srcloptr
        lda f3310,x
        sta srchiptr
        lda f3306,x
        jsr updatespriteindicesandthenredrawsprites
        dex 
        bpl b283e
        lda #$10
        sta a59
b2855:   jsr checkinputduringdeploymentsequence
        dec a59
        bne b2855
        lda #$06
        sta a91
b2860:   lda #$06
        sta spriteindex
        jsr storespritecontentcolorandposition
        inc currentspritevalue
        jsr updatespritecontentandposition
        jsr checkinputduringdeploymentsequence
        jsr checkinputduringdeploymentsequence
        jsr checkinputduringdeploymentsequence
        lda currentspritevalue
        cmp #$0b
        bcc b2860
        jsr checkinputduringdeploymentsequence
        lda a3318
        sta srchiptr
        lda a330e
        sta srcloptr
        jsr updatespriteindicesandthenredrawsprites
        lda #$07
        sta a92
b288f:   lda #$06
        sta spriteindex
        jsr storespritecontentcolorandposition
        inc currentspritexpos
        jsr updatespritecontentandposition
        jsr checkinputduringdeploymentsequence
        jsr checkinputduringdeploymentsequence
        lda currentspritexpos
        cmp #$aa
        bcc b288f
        lda #$00
        sta spritevalueloptr
        sta spritevaluehiptr
        jsr checkinputduringdeploymentsequence
        lda #$08
        sta a91
        sta a92
        sta a93
b28b8:   lda #$80
        clc 
        adc spritevalueloptr
        sta spritevalueloptr
        lda spritevaluehiptr
        adc #$ff
        sta spritevaluehiptr
        lda #$07
        sta spriteindex
        jsr storespritecontentcolorandposition
        lda currentspritexpos
        clc 
        adc spritevaluehiptr
        sta currentspritexpos
        lda a06
        adc #$ff
        sta a06
        jsr updatespritecontentandposition

        lda #$05
        sta spriteindex
b28e0:   jsr storespritecontentcolorandposition
        lda currentspritexpos
        clc 
        adc spritevaluehiptr
        sta currentspritexpos
        lda a06
        adc #$ff
        sta a06
        jsr updatespritecontentandposition
        dec spriteindex
        bpl b28e0

        jsr checkinputduringdeploymentsequence
        lda currentspritexpos
        cmp #$84
        bcc b28b8
        lda #$40
        sta $d015    //sprite display enable
        lda a3319
        sta srchiptr
        lda a330f
        sta srcloptr
        jsr updatespriteindicesandthenredrawsprites
        lda a4e
        sta $d025    //sprite multi-color register 0
        rts 

//-------------------------------------------------------------------
// checkinputduringdeploymentsequence
//-------------------------------------------------------------------
checkinputduringdeploymentsequence:
        lda shouldwaituntilready
        bne checkinputduringdeploymentsequence
        jsr getjoystickinput
        jsr maybeshowpausescreen
        jsr domorewithjoystickinput
        jsr maybechangetitledecal
        inc a62
b292a:   lda shouldwaituntilready
        beq b292a
        rts 

//-------------------------------------------------------------------
// maybefirebullets
//-------------------------------------------------------------------
maybefirebullets:
        lda a48
        bmi b2954
        beq b2943
.label a2936 =*+$01
        lda #$07
        sta a49
        lda firepressed
        bne b2942
        sta a48
        jsr firebullets
b2942:   rts 

b2943:   lda firepressed
        beq b294d
        inc a48
        jsr firebullets
        rts 

b294d:   lda a49
        bmi b2942
        dec a49
        rts 

b2954:   and #$7f
        sta a48
        rts 

//-------------------------------------------------------------------
// firebullets
//-------------------------------------------------------------------
firebullets:
        lda a48
        ora #$80
        sta a48
        ldx newspritevalue
        lda f3373,x
        beq b2993
        clc 
        adc a33
        sec 
        sbc #$62
        sta a0f
        ldx #$00
        jsr getfreeslotforbullets
        bcs b2993
        stx a10
        jsr updatebulletarrays
        ldx newspritevalue
        lda f33a1,x
        beq b2993
        clc 
        adc a33
        sec 
        sbc #$62
        sta a0f
        ldx a10
        jsr getfreeslotforbullets
        bcs b2993
        jsr updatebulletarrays
b2993:   rts 

//-------------------------------------------------------------------
// getfreeslotforbullets
//-------------------------------------------------------------------
getfreeslotforbullets:
        lda fa460,x
        beq b299f
        inx 
        cpx #$06
        bcc getfreeslotforbullets
        rts 

b299f:   clc 
        rts 

//-------------------------------------------------------------------
// updatebulletarrays
//-------------------------------------------------------------------
updatebulletarrays:
        lda #$09
        sta a91
        lda #$02
        ldy a2e
        beq b29df
        bmi b29df
        lda #$fe
        sta fa460,x
        lda a52
        sta fa430,x
        sta a12
        lda a0f
        and #$07
        cmp #$07
        bne b29c3
        lda #$06
b29c3:   sta fa470,x
        lda a0f
        lsr 
        lsr 
        and #$fe
        sta a0f
        lda a53
        and #$01
        clc 
        adc a0f
        adc #$82
        sta fa440,x
        sta a13
        jmp j2a0f

b29df:   sta fa460,x
        clc 
        adc a52
        sta fa430,x
        sta a12
        php 
        lda a0f
        and #$07
        cmp #$07
        bne b29f5
        lda #$06
b29f5:   sta fa470,x
        lda a0f
        lsr 
        lsr 
        and #$fe
        sta a0f
        lda a53
        and #$01
        clc 
        adc a0f
        plp 
        adc #$82
        sta fa440,x
        sta a13
j2a0f:   ldy #$00
        lda (p12),y
        sta fa450,x
        rts 

//-------------------------------------------------------------------
// s2a17
//-------------------------------------------------------------------
s2a17:
        ldy #$00
        ldx #$05
b2a1b:   lda fa460,x
        beq b2a2f
        lda fa430,x
        sta ramloptr
        lda fa440,x
        sta ramhiptr
        lda fa450,x
        sta (ramloptr),y
b2a2f:   dex 
        bpl b2a1b

        inx 
b2a33:   lda fa460,x
        beq b2aa3
        jsr s2ac9
        sta fa440,x
        sta ramhiptr
        ror 
        lda ramloptr
        ror 
        cmp a50
        bcc b2abd
        cmp a51
        bcs b2abd
        lda (ramloptr),y
        bpl b2a5e
        cmp #$90
        bcc b2ab9
        cmp #$a0
        bcs b2a5e
        jsr s2ae9
        jmp b2abd

b2a5e:   sta fa450,x
        sty a2a8a
        asl 
        rol a2a8a
        asl 
        rol a2a8a
        asl 
        rol a2a8a
        sta a2a89
        lda a2a8a
        adc #$78
        sta a2a8a
        lda f3937,x
.label a2a7f =*+$01
        ora #$80
        sta somedataloptr
        lda #$78
        sta somedatahiptr
        ldy #$07
.label a2a89   =*+$01
.label a2a8a   =*+$02        
b2a88:  lda surfacetexturecharacterset,y
        sta (somedataloptr),y
        dey 
        bpl b2a88
        ldy fa470,x
        lda #$00
        sta (somedataloptr),y
        iny 
        lda #$aa
        sta (somedataloptr),y
        ldy #$00
        txa 
.label a2aa0 =*+$01
        ora #$10
        sta (ramloptr),y
b2aa3:   inx 
        cpx #$06
        bcc b2a33
        lda a2a7f
        eor #$80
        sta a2a7f
        lda a2aa0
        eor #$10
        sta a2aa0
        rts 

b2ab9:   lda #$21
        sta a91
b2abd:   lda fa460,x
        beq b2aa3
        lda #$00
        sta fa460,x
        beq b2aa3
        // falls through

//-------------------------------------------------------------------
// s2ac9
//-------------------------------------------------------------------
s2ac9:
        bmi b2ada
        clc 
        adc fa430,x
        sta fa430,x
        sta ramloptr
        lda fa440,x
        adc #$00
        rts 

b2ada:   clc 
        adc fa430,x
        sta fa430,x
        sta ramloptr
        lda fa440,x
        adc #$ff
        rts 

//-------------------------------------------------------------------
// s2ae9
//-------------------------------------------------------------------
s2ae9:
        tay 
        lda fa430,x
        sec 
        sbc f33c6,y
        sta srcloptr
        lda fa440,x
        sbc f33d6,y
        sta srchiptr
        lda f33e6,y
        sta a11
        sta initialvalueofy
        lda f33f6,y
        tay 
        stx a10
        jsr maybeupdateoneuportwouptext
        ldx a10
        lda #$1b
        sta a92
j2b11:   ldy a11
b2b13:   lda (srcloptr),y
        cmp #$20
        bcc b2b33
        cmp #$f0
        bcs b2b22
        sec 
        sbc #$20
        sta (srcloptr),y
b2b22:   dey 
        bpl b2b13
        dec initialvalueofy
        bmi b2b30
        inc srchiptr
        inc srchiptr
        jmp j2b11

b2b30:   ldy #$00
        rts 

b2b33:   stx a10
        tax 
        lda #$00
        sta fa460,x
        ldx a10
        jmp b2b22

//-------------------------------------------------------------------
// s2b40
//-------------------------------------------------------------------
s2b40:
        lda a2e
        beq b2b53
        bpl b2b5d
        lda a29
        sec 
        sbc a2e
        sta a29
        lda a2a
        sbc #$ff
        sta a2a
b2b53:   lda #$08
        sec 
        sbc a29
        and #$07
        sta multicolormodeenabled
        rts 

b2b5d:   lda a29
        sec 
        sbc a2e
        sta a29
        lda a2a
        sbc #$00
        sta a2a
        jmp b2b53

//-------------------------------------------------------------------
// maybeshowpausescreen
//-------------------------------------------------------------------
maybeshowpausescreen:
        jsr checkifpauseorfirehasbeenpressed
        lda a60
        and #$80
        bne returnearly
        ldx #<pausetext
        ldy #>pausetext
        jsr writetoscreen
        lda #$00
        sta a90
        lda #$03
        sta a5a
b2b85:   ldy #$1c
        jsr wastecyclesusingxandy
        jsr checkifpauseorfirehasbeenpressed
        lda a60
        and #$80
        beq b2b85
        lda a62
        sta a2b
        lda #$00
        sta a62
j2b9b:   jsr checkifpauseorfirehasbeenpressed
        lda a60
        and #$08
        beq b2bbf
        jsr getjoystickinput
        jsr maybechangetitledecal
        ldy #$18
        jsr wastecyclesusingxandy
        inc a62
        lda a60
        and #$80
        beq exitpausescreen
        lda firepressed
        beq exitpausescreen
        jmp j2b9b

//--------------------------------------------------------------------
// returnearly 
//--------------------------------------------------------------------
returnearly:
        rts 

//--------------------------------------------------------------------
// b2bbf   
//--------------------------------------------------------------------
b2bbf:
        jmp jc909

//--------------------------------------------------------------------
// exitpausescreen   
//--------------------------------------------------------------------
exitpausescreen:
        jsr getjoystickinput
        jsr checkifpauseorfirehasbeenpressed
        ldx #<spaces
        ldy #>spaces
        jsr writetoscreen
        ldy #$1c
        jsr wastecyclesusingxandy
        lda a60
        and #$80
        beq exitpausescreen
        lda firepressed
        beq exitpausescreen
        lda a2b
        sta a62
        lda #$12
        sta a90
        lda #$02
        sta a5a
        rts 

//-------------------------------------------------------------------
// scrollshipsurface
//-------------------------------------------------------------------
scrollshipsurface:   
        lda a29
        clc 
        adc #$07
        sta a31
        lda a2a
        adc #$00
        lsr 
        ror a31
        lsr 
        ror a31
        lsr 
        ror a31
        and #$01
        sta a0f
        lda #>surfaceforcurrentlevel
        ora a0f
        sta a30
        sta a2c21
        lda a31
        sta a2c20
        lda #>screen_ram_hibank + $00f0
        sta a2c24
        lda #<screen_ram_hibank + $00f0
        sta a2c23

        ldx #$11
b2c1d:   ldy #$26
.label a2c20 =*+$01
.label a2c21 =*+$02
b2c1f:   lda surfaceforcurrentlevel,y
.label a2c23 =*+$01
.label a2c24 =*+$02
        sta screen_ram_hibank + $00f0,y
        dey 
        bpl b2c1f
        dex 
        beq b2c42
        inc a2c21
        inc a2c21
        lda a2c23
        clc 
        adc #$28
        sta a2c23
        bcc b2c1d
        inc a2c24
        jmp b2c1d

b2c42:   lda a31
        clc 
        adc #$12
        sta a52
        php 
        lda a33
        sec 
        sbc #$58
        and #$f8
        lsr 
        lsr 
        plp 
        adc a30
        sta a53
        lda a30
        ror 
        lda a31
        ror 
        sta a50
        clc 
        adc #$14
        sta a51
        rts 

//.label pe100 = $e100
.label anotherdataloptrarray = somedatahiptrarray
.label newvalueofsrcloptr = $11
//-------------------------------------------------------------------
// updatepositionofpointerstotexturedata
// updates the position of srcloptr and srchiptr to the right spot
// for the scrolling surface.
//-------------------------------------------------------------------
updatepositionofpointerstotexturedata:
        ldx #<pe100
        ldy #>pe100
        stx srcloptr
        sty srchiptr

        ldx #$01
b2c70:   ldy #$00
        sty newvalueofsrcloptr
        lda srcloptr
        sta anotherdataloptrarray,x
        lda srchiptr
        sta anotherdatahiptrarray,x
        inx 
        beq b2ca4
        lda (srcloptr),y
        beq b2ca4
        sta initialvalueofy
        inc newvalueofsrcloptr
b2c89:   ldy newvalueofsrcloptr
        lda (srcloptr),y
        sec 
        adc newvalueofsrcloptr
        sta newvalueofsrcloptr
        dec initialvalueofy
        bne b2c89
        lda srcloptr
        clc 
        adc newvalueofsrcloptr
        sta srcloptr
        bcc b2c70
        inc srchiptr
        jmp b2c70

b2ca4:   rts 

//-------------------------------------------------------------------
// clearanotherdataptrarray
//-------------------------------------------------------------------
clearanotherdataptrarray:
        lda #$00
        tay 
b2ca8:  sta anotherdataloptrarray,y
        sta anotherdatahiptrarray,y
        iny 
        bne b2ca8
        rts 

//-------------------------------------------------------------------
// updatetexturedataforcurrentship
//-------------------------------------------------------------------
updatetexturedataforcurrentship:
        lda #$ff
        sta a54
        lda indextocurrentleveltexturedata
        and #$0f
        tay 
        lda $e010,y
        sta a12
        lda $e020,y
        sta a13
        
        // clear down the surface data first.
        lda #>endofsurfacedataforcurrentlevel
        sta somedatahiptr
        lda #<endofsurfacedataforcurrentlevel
        sta somedataloptr
b2ccd:   ldy #$3f
        lda #$20
b2cd1:   sta (somedataloptr),y
        dey 
        bpl b2cd1
        dec somedatahiptr
        dec somedatahiptr
        lda somedatahiptr
        cmp #>surfaceforcurrentlevel
        bcs b2ccd

        ldx #<pa240
        ldy #>pa240
        stx somedataloptr
        sty somedatahiptr
b2ce8:   ldy #$00
        lda (p12),y
        beq b2d57
        tax 
        lda anotherdatahiptrarray,x
        sta srchiptr
        lda anotherdataloptrarray,x
        sta srcloptr
        clc 
        lda a12
        adc #$01
        sta a12
        bcc b2d04
        inc a13
b2d04:   lda (srcloptr),y
        iny 
        sta initialvalueofy
b2d09:   lda somedataloptr
        sta ramloptr
        lda somedatahiptr
        sta ramhiptr
        lda (srcloptr),y
        iny 
        and #$1f
        tax 
b2d17:   lda (srcloptr),y
        iny 
        sty a11
        ldy #$00
        sta (ramloptr),y
        ldy a11
        dec ramhiptr
        dec ramhiptr
        dex 
        bne b2d17

        // clear more data down again with $20.
j2d29:   lda ramhiptr
        cmp #>surfaceforcurrentlevel
        bcc b2d40
        sty a11
        ldy #$00
        lda #$20
        sta (ramloptr),y
        ldy a11
        dec ramhiptr
        dec ramhiptr
        jmp j2d29

b2d40:   clc 
        lda somedataloptr
        adc #$01
        sta somedataloptr
        bcc b2d4b
        inc somedatahiptr
b2d4b:   lda somedatahiptr
        cmp #$a4
        bcs b2d66
        dec initialvalueofy
        bne b2d09
        beq b2ce8
b2d57:   lda aa401
        sta srcloptr
        lda aa501
        sta srchiptr
        ldy #$00
        jmp b2d04

b2d66:   ldy #$00
        clc 
        lda a12
        adc #$01
        sta a12
        bcc b2d73
        inc a13
b2d73:   lda (p12),y
        ora #$80
        and #$bf
        sta somedatahiptr
        cmp #$a4
        bcs b2de3
        iny 
        lda (p12),y
        sta somedataloptr
        iny 
        lda (p12),y
        beq b2de3
        tax 
        lda anotherdatahiptrarray,x
        sta srchiptr
        lda anotherdataloptrarray,x
        sta srcloptr
        clc 
        lda a12
        adc #$03
        sta a12
        bcc b2d9f
        inc a13
b2d9f:   ldy #$00
        lda (srcloptr),y
        iny 
        sta initialvalueofy
b2da6:   lda somedataloptr
        sta ramloptr
        lda somedatahiptr
        sta ramhiptr
        lda (srcloptr),y
        iny 
        and #$1f
        tax 

        // main loop for populating the surface data.
b2db4:   lda (srcloptr),y
        iny 
        sty a11
        ldy #$00
        cmp #$20
        beq b2dc1
        sta (ramloptr),y
b2dc1:   jsr s2de4
        ldy a11
        dec ramhiptr
        dec ramhiptr
        bpl b2de3
        dex 
        bne b2db4

        clc 
        lda somedataloptr
        adc #$01
        sta somedataloptr
        bcc b2dda
        inc somedatahiptr
b2dda:   dec initialvalueofy
        bne b2da6
        ldy #$00
        jmp b2d73

b2de3:   rts 

//-------------------------------------------------------------------
// s2de4
//-------------------------------------------------------------------
s2de4:   
        cmp #$59
        bcc b2e16
        cmp #$5c
        bcs b2e16
        ldy a54
        iny 
        cpy #$10
        bcs b2e16
        sty a54
        lda ramhiptr
        and #$01
        sta $0230,y
        lda ramhiptr
        sec 
        sbc #$82
        clc 
        adc #$0c
        lsr 
        sta $0220,y
        lda ramloptr
        sta $0210,y
        ror 
        sta $0200,y
        lda #$ff
        sta $0240,y
b2e16:   rts 

//-------------------------------------------------------------------
// s2e17
//-------------------------------------------------------------------
s2e17:   
        ldy #$18
        lda #$01
b2e1b:   sta fa518,y
        dey 
        cpy #$14
        bcs b2e1b
        ldy #$0f
        lda #$00
        sta a10
b2e29:   ldx a10
        lda randomdatastorage,x
        inc a10
        and #$0f
        clc 
        adc #$07
        tax 
        lda anotherdatahiptrarray,x
        beq b2e3e
        jsr s2ea5
b2e3e:   lda screenlinehiptrarray,x
        sta somedatahiptrarray,y
        lda screenlineloptrarray,x
        sta somedataloptrarray,y
        lda colorlinehiptrarray,x
        sta fa480,y
        inc anotherdatahiptrarray,x
        ldx a10
        lda randomdatastorage,x
        inc a10
        and #$1f
        cmp #$14
        bcc b2e62
        adc #$04
b2e62:   tax 
        lda fa518,x
        beq b2e6b
        jsr s2ebe
b2e6b:   inc fa518,x
        txa 
        clc 
        adc somedataloptrarray,y
        sta somedataloptrarray,y
        php 
        lda somedatahiptrarray,y
        adc #$00
        sta somedatahiptrarray,y
        plp 
        lda fa480,y
        adc #$00
        sta fa480,y
        ldx a10
        lda randomdatastorage,x
        inc a10
        and #$01
        clc 
        adc #$42
        sta fa420,y
        dey 
        bpl b2e29
        lda #$00
        ldy #$40
b2e9e:   sta anotherdatahiptrarray,y
        dey 
        bpl b2e9e
        rts 

.label initialvalueofindextotexturesegment = initialvalueofy
//-------------------------------------------------------------------
// s2ea5
//-------------------------------------------------------------------
s2ea5:
        lda indextotexturesegment
        sta initialvalueofindextotexturesegment
b2ea9:  txa 
        clc 
        adc #$07
        cmp #$17
        bcc b2eb3
        sbc #$10
b2eb3:   tax 
        dec initialvalueofindextotexturesegment
        beq b2ebd
        lda anotherdatahiptrarray,x
        bne b2ea9
b2ebd:   rts 

//-------------------------------------------------------------------
// s2ebe
//-------------------------------------------------------------------
s2ebe:
        lda indextotexturesegment
        sta initialvalueofindextotexturesegment
b2ec2:   txa 
        clc 
        adc #$07
        cmp #$27
        bcc b2ecc
        sbc #$27
b2ecc:   tax 
        dec initialvalueofindextotexturesegment
        beq b2ed6
        lda fa518,x
        bne b2ec2
b2ed6:   rts 

//-------------------------------------------------------------------
// s2ed7
//-------------------------------------------------------------------
s2ed7:
        ldx indextotexturesegment
b2ed9:   lda somedatahiptrarray,x
        sta somedatahiptr
        lda somedataloptrarray,x
        sta somedataloptr
        ldy #$00
        lda (somedataloptr),y
        cmp #$20
        bne b2f0b
        lda fa420,x
        sta (somedataloptr),y
        lda fa480,x
        sta somedatahiptr
        lda a58
j2ef7:   sta (somedataloptr),y
        dex 
        bpl b2ed9

        ldx multicolormodeenabled
        lda f311e,x
        sta a7a15
        sta a7a1a
        sta a7a1b
        rts 

b2f0b:   lda fa480,x
        sta somedatahiptr
        lda a4d
        jmp j2ef7

//-------------------------------------------------------------------
// writestufftoscreen
//-------------------------------------------------------------------
writestufftoscreen:
        ldy #$26
b2f17:   ldx a10
        lda randomdatastorage,x
        inc a10
        tax 
        lda #$20
        cpx #$f0
        bcc b2f2d
        lda #$42
        cpx #$f8
        bcs b2f2d
        adc #$01
b2f2d:   sta (ramloptr),y
        dey 
        bpl b2f17
        rts 

//-------------------------------------------------------------------
// updatescreencolors
//-------------------------------------------------------------------
updatescreencolors:
        ldx #<p3372
        ldy #>p3372
        stx ramloptr
        sty ramhiptr
        lda #$00
        sta initialvalueofy
        lda monochromenabled
        bne b2f5b
        ldy indextocurrentleveltexturedata
        lda $e030,y
        beq b2f5b
        sta initialvalueofy
b2f4c:  clc 
        lda ramloptr
        adc #$05
        sta ramloptr
        bcc b2f57
        inc ramhiptr
b2f57:   dec initialvalueofy
        bne b2f4c
b2f5b:   ldy #$04
b2f5d:
        lda (ramloptr),y
        sta .a f004b,y
        dey 
        bpl b2f5d
        lda a4b
        sta $d023    //background color 2, multi-color register 1
        lda a4c
        sta $d022    //background color 1, multi-color register 0
        lda a4e
        sta $d025    //sprite multi-color register 0
        lda #$f1
        sta $d026    //sprite multi-color register 1
        lda a4d
        and #$f7
        sta a58
        ldx #<color_ram + $00a0
        ldy #>color_ram + $00a0
        stx ramloptr
        sty ramhiptr
        ldx #$02
        lda a58
        jsr writetoram
        ldx #$11
        lda a4d
        jsr writetoram
        ldx #$02
        lda a58
        jsr writetoram
        rts 

//-------------------------------------------------------------------
// checkifpauseorfirehasbeenpressed
//-------------------------------------------------------------------
checkifpauseorfirehasbeenpressed:
        lda #$ff
        sta a60
        sta $dc00    //cia1: data port register a
        lda $dc01    //cia1: data port register b
        and #$08
        cmp #$08
        bne b2fc7
        lda #$7f
        sta $dc00    //cia1: data port register a
        lda $dc01    //cia1: data port register b
        ora #$7f
        sta a60
        lda #$bf
        sta $dc00    //cia1: data port register a
        lda $dc01    //cia1: data port register b
        ora #$f7
        and a60
        sta a60
b2fc7:   rts 

//-------------------------------------------------------------------
// updatecolorsonscreen
//-------------------------------------------------------------------
updatecolorsonscreen:
        ldx a54
        bmi b3000
b2fcc:   ldy $0220,x
        lda colorlinehiptrarray,y
        sta a1f
        lda screenlineloptrarray,y
        sta a1e
        ldy $0240,x
        bmi b2fe2
        lda a4d
        sta (p1e),y
b2fe2:   lda $0200,x
        cmp a50
        bcc b3001
        cmp a51
        bcs b3001
        lda $0210,x
        sec 
        sbc a31
        sta $0240,x
        bmi b3001
        tay 
        lda currentcolorvalue
        sta (p1e),y
b2ffd:   dex 
        bpl b2fcc
b3000:   rts 

b3001:   lda #$ff
        sta $0240,x
        bne b2ffd

//-------------------------------------------------------------------
// updateplayerdecalcolors
//-------------------------------------------------------------------
updateplayerdecalcolors:
        ldx #$09
        lda a5c
        cmp #$01
        beq b3062
        lda currentplayer
        cmp #$01
        beq b303c
b3016:   lda #$f1
        sta color_ram + $001e,x
        sta color_ram + $006e,x
        lda #$fe
        sta color_ram + $0000,x
        sta color_ram + $0046,x
        lda #$f6
        sta color_ram + $0028,x
        lda #$f5
        sta color_ram + $0078,x
        lda #$fd
        sta color_ram + $0050,x
        sta color_ram + $0096,x
        dex 
        bpl b3016
        rts 

b303c:   lda #$f1
        sta color_ram + $0000,x
        sta color_ram + $0050,x
        lda #$fe
        sta color_ram + $001e,x
        sta color_ram + $0028,x
        lda #$f6
        sta color_ram + $0046,x
        lda #$fd
        sta color_ram + $006e,x
        sta color_ram + $0078,x
        lda #$f5
        sta color_ram + $0096,x
        dex 
        bpl b303c
        rts 

b3062:   lda #$f1
        sta color_ram + $0000,x
        sta color_ram + $0050,x
        lda #$fe
        sta color_ram + $0028,x
        lda #$fd
        sta color_ram + $0078,x
        lda #$f0
        sta color_ram + $001e,x
        sta color_ram + $0046,x
        sta color_ram + $006e,x
        sta color_ram + $0096,x
        dex 
        bpl b3062
        rts 

//-------------------------------------------------------------------
// generaterandomdatafromrng
//-------------------------------------------------------------------
generaterandomdatafromrng:
        ldx #$00
        stx a10
b308a:  lda $d41b    // random number generator
        ldx a10
        eor randomdatastorage,x
        sta randomdatastorage,x
        rol a800f
        ror a800f
        inc a10
        bne b308a
        rts 

//-------------------------------------------------------------------
// copydatafrommaincharactersettop7400
//-------------------------------------------------------------------
copydatafrommaincharactersettop7400:
        ldx #<p7400
        ldy #>p7400
        stx somedataloptr
        sty somedatahiptr
        ldx #<maincharacterset
        ldy #>maincharacterset
        stx a12
        sty a13

        lda #$80
        sta initialvalueofy
b30b4:   ldx #$07
        stx a10

        ldy #$07
b30ba:   lda #$00
        sta (somedataloptr),y
        dey 
        sty a11
        ldy a10
        lda (p12),y
        dey 
        sty a10
        ldy a11
        sta (somedataloptr),y
        dey 
        bpl b30ba

        lda somedatahiptr
        sec 
        sbc #$04
        sta somedatahiptr

        ldy #$07
b30d8:   lda #$00
        sta (somedataloptr),y
        dey 
        sty a11
        ldy a10
        lda (p12),y
        dey 
        sty a10
        ldy a11
        sta (somedataloptr),y
        dey 
        bpl b30d8

        lda somedataloptr
        clc 
        adc #$08
        sta somedataloptr

        lda somedatahiptr
        adc #$04
        sta somedatahiptr

        clc 
        lda a12
        adc #$08
        sta a12

        bcc b3105
        inc a13
b3105:   dec initialvalueofy
        bne b30b4

        rts 
//.encoding "petscii_upper"

// .enc "petscii"  //define an ascii->petscii encoding
//         .cdef "  ", $30  //characters
//         .cdef "..", $28  //characters
//         .cdef ",,", $29  //characters
//         .cdef "::", $2a  //characters
//         .cdef "!!", $25  //characters
//         .cdef "??", $24  //characters
//         .cdef "--", $2e  //characters
//         .cdef "==", $2f  //characters
//         .cdef "ah", $3a
//         .cdef "ii", $16
//         .cdef "lz", $45
//         .cdef "mm", $42
//         .cdef "al", $0a
//         .cdef "nv", $17
//         .cdef "ww", $54
//         .cdef "xz", $21
//         .cdef "09", $00

f310a:   .byte $00,$90,$98,$a0,$a8,$b0,$b8,$c0
        .byte $c4,$c8,$cc,$d0,$d4,$d8,$dc,$e0
        .byte $e4,$e8,$ec,$f0
f311e:   .byte $fe,$fd,$fb,$f7,$ef,$df,$bf,$7f

player1text:
        .byte $00,$01
//        .text "player1"
        .byte $49,$15,$0a,$22,$0e,$1b,$01
        .byte $ff
player2text:
        .byte $00,$1f
//        .text "player2"
       .byte $49,$15,$0a,$22,$0e,$1b,$02
        .byte $ff
oneuptext:
        .byte $00,$01
//        .text "1up "
        .byte $01,$1e,$19,$30
        .byte $7a, $7b
a3142:   .byte $30
a3143:   .byte $03,$ff

.label a3149 =*+$04
.label a314a =*+$05
twouptext:
        .byte $00,$1f
        .byte $7a, $7b
//        .text " 3 2up"
        .byte $30,$03,$30,$02,$1e,$19
        .byte $ff
spaces:
        .byte $00,$0f
//        .text "           "
        .byte $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30
        .byte $ff
landnowtext:
        .byte $00,$0f
//        .text "land now!"
        .byte $45,$0a,$17,$0d,$30,$17,$18,$54,$25
        .byte $ff

playerlinescolorscheme1:   
        .byte ltblue,ltblue,ltblue,ltblue,ltblue,ltblue,ltblue,ltblue
        .byte ltblue,ltblue,ltred,ltred,ltred,ltred,ltred,ltred
        .byte ltred,ltred,ltred,ltred,ltred,ltred,ltred,ltred
        .byte ltred,ltred,ltred,ltred,ltred,ltred,ltblue,ltblue
        .byte ltblue,ltblue,ltblue,ltblue,ltblue,ltblue,ltblue,ltblue
playerlinescolorscheme2:   
        .byte ltgreen,ltgreen,ltgreen,ltgreen,ltgreen,ltgreen,ltgreen,ltgreen
        .byte ltgreen,ltgreen,white,white,white,white,white,white
        .byte white,white,white,white,white,white,white,white
        .byte white,white,white,white,white,white,ltgreen,ltgreen
        .byte ltgreen,ltgreen,ltgreen,ltgreen,ltgreen,ltgreen,ltgreen,ltgreen
playerlinescolorscheme3:   
        .byte green,green,green,green,green,green,green,green
        .byte green,green,yellow,yellow,yellow,yellow,yellow,yellow
        .byte yellow,yellow,yellow,yellow,yellow,yellow,yellow,yellow
        .byte yellow,yellow,yellow,yellow,yellow,yellow,green,green
        .byte green,green,green,green,green,green,green,green

        .byte $04,$4d,$4e,$4f,$40,$00,$ff,$04
        .byte $45,$44,$43,$42,$00,$ff,$04,$41
        .byte $42,$43,$44,$00,$ff,$04,$41,$42
        .byte $43,$44,$00,$ff,$10,$59,$58,$57
        .byte $56,$55,$54,$53,$52,$51,$66,$65
        .byte $64,$63,$62,$61,$60,$28,$28,$10
        .byte $41,$40,$4f,$4e,$4d,$4c,$4b,$4a
        .byte $49,$48,$47,$46,$45,$44,$43,$42
        .byte $00,$ff,$04,$55,$56,$57,$58,$00
        .byte $01,$04,$5d,$5c,$5b,$5a,$00,$01
        .byte $04,$59,$58,$57,$56,$00,$01,$04
        .byte $59,$5a,$5b,$5c,$00,$01,$10,$41
        .byte $40,$4f,$4e,$4d,$4c,$4b,$4a,$49
        .byte $67,$68,$69,$6a,$6b,$6c,$6d,$d8
        .byte $d8,$10,$59,$58,$57,$56,$55,$54
        .byte $53,$52,$51,$50,$5f,$5e,$5d,$5c
        .byte $5b,$5a,$00,$01
spritevalueoffsetloptrarray:   .byte $00,$00,$00,$00,$00,$32,$00,$00
        .byte $00,$40,$00,$00,$24,$53,$2b,$00
        .byte $00,$00,$00,$00,$00,$39
spritevalueoffsethiptrarray:   .byte $00,$00,$00,$00,$00,$32,$00,$00
        .byte $00,$32,$00,$00,$32,$32,$32,$00
        .byte $00,$00,$00,$00,$00,$32
spritevalueloptrarray:   .byte $00,$f0,$00,$00,$00,$00,$00,$00
        .byte $e2,$11,$e9,$00,$00,$fe,$00,$00
        .byte $00,$f7
spritevaluehiptrarray:   .byte $00,$31,$00,$00,$00,$00,$00,$00
        .byte $31,$32,$31,$00,$00,$31,$00,$00
        .byte $00,$31,$06,$70,$00,$98,$ff,$00
        .byte $00,$ff,$00,$f0,$59
p32c1:   .byte $06,$aa,$00,$98,$ff,$00,$00,$ff
        .byte $00,$f0,$59
p32cc:   .byte $06,$a0,$00,$ae,$ff,$00,$00,$ff
        .byte $00,$f0,$41,$07,$ba,$00,$a8,$ff
        .byte $00,$ff,$00,$00,$fb,$89
p32e2:   .byte $07,$aa,$00,$00,$ff,$00,$00,$ff
        .byte $00,$f7,$30
f32ed:   .byte $fd,$03,$f8,$08,$b0,$40,$50,$c0
f32f5:   .byte $00,$00,$ff,$fe,$fd,$fd,$fe,$fe
        .byte $ff,$00,$01,$02,$03,$03,$02,$02
        .byte $01
f3306:   .byte $1a,$25,$30,$3b,$46,$51,$5c,$67
a330e:   .byte $b6
a330f:   .byte $d7
f3310:   .byte $33,$33,$33,$33,$33,$33,$33,$33
a3318:   .byte $32
a3319:   .byte $32,$00,$82,$00,$8d,$ff,$00,$00
        .byte $ff,$00,$fc,$00,$01,$6a,$00,$8d
        .byte $ff,$00,$00,$ff,$00,$fc,$01,$02
        .byte $52,$00,$8d,$ff,$00,$00,$ff,$00
        .byte $fc,$02,$03,$82,$00,$a2,$ff,$00
        .byte $00,$ff,$00,$fc,$03,$04,$6a,$00
        .byte $a2,$ff,$00,$00,$ff,$00,$fc,$04
        .byte $05,$52,$00,$a2,$ff,$00,$00,$ff
        .byte $00,$fc,$05,$06,$82,$00,$8e,$ff
        .byte $ff,$00,$00,$00,$fb,$07,$07,$82
        .byte $00,$8e,$ff,$ff,$00,$ff,$00,$fe
        .byte $06
p3372:   .byte $fb
f3373:   .byte $ff,$f8,$fc,$fb,$f0,$fb,$fe,$fa
        .byte $f2,$f0,$fc,$fa,$fe,$f6,$f5,$fd
        .byte $f8,$fe,$f6,$f2,$fa,$f8,$f7,$f8
        .byte $fb,$fc,$fc,$fa,$f2,$f6,$fe,$f8
        .byte $fd,$f5,$f8,$f7,$f8,$fc,$f0,$fb
        .byte $f3,$fd,$fa,$f2,$f9,$f8
f33a1:   .byte $f8,$fd,$f5,$fb,$ff,$f8,$f7,$f8
        .byte $f6,$f3,$f8,$fc,$fb,$fb,$ff,$f8
        .byte $fe,$f6,$04,$02,$03,$06,$07,$08
        .byte $08,$06,$05,$02,$03,$06,$08,$0b
        .byte $07,$06,$05,$02,$03
f33c6:   .byte $06,$08,$0b,$07,$06,$04,$02,$03
        .byte $06,$07,$08,$08,$06,$00,$00,$00
f33d6:   .byte $00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$10,$11,$0f,$0d,$0c
f33e6:   .byte $00,$0b
f33e8:  .byte $0d,$10,$11,$0e,$0d,$0b,$00,$0c
        .byte $0d,$10,$11,$0e,$0d,$0b
f33f6:   .byte $00,$0c,$0d,$10,$11,$0f,$0d,$0c
        .byte $00,$0b,$0d,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00
        .byte $00
colorlinehiptrarray:
        .byte $d8,$d8,$d8,$d8,$d8,$d8,$d8,$d9
        .byte $d9,$d9,$d9,$d9,$d9,$da,$da,$da
        .byte $da,$da,$da,$da,$db,$db,$db,$db
        .byte $db,$80,$80,$80,$80,$00,$00,$00
        .byte $80,$80,$80,$80,$80,$00,$00,$00
        .byte $80,$80,$80,$80,$80,$00,$00,$00
        .byte $80,$80,$80,$80,$80,$00,$00,$00
        .byte $80,$80,$80,$81,$81,$81,$80,$80
        .byte $80,$80,$81,$81,$81,$80,$80,$00
        .byte $01,$00,$01,$00,$01,$02,$00,$01
        .byte $02,$00,$01,$02,$00,$00,$00,$00
        .byte $00,$02,$02,$00,$00,$00,$02,$02
        .byte $02,$04,$04,$04,$00,$00,$00,$01
        .byte $01,$01,$01,$02,$02,$02,$02,$02
        .byte $02,$02,$02,$02,$00,$00,$00,$02
        .byte $02,$02,$02,$04,$04,$04,$04,$04
        .byte $04,$04,$04,$04,$01,$01,$01
f3496:   .byte $00,$00,$00,$00,$00,$03
a349c:   .byte $01
a349d:   .byte $01,$00
f349f:  .byte $4e,$1b,$12,$0d,$12,$1e,$42,$30
        .byte $0b,$22,$30,$3a,$17,$0d,$1b,$0e
        .byte $54,$30,$3b,$1b,$0a,$22,$0b,$1b
        .byte $18,$18,$14,$28,$30,$41,$12,$10
        .byte $11,$30,$2e
.label f34c3 =*+$01
hiscoreforscrollingbanner:
//        .text " 12000 aeb"
        .byte $30,$01,$02,$00,$00,$00,$30,$3a,$3e,$3b
        .byte $ff, $ff, $ff, $ff
player1symbol:
        .byte $00,$0f
//        .text "  "
        .byte $30,$30
        .byte $55, $55
//        .text " "
        .byte $30
        .byte$56
//        .text "  "
        .byte $30,$30
        .byte $ff
player2symbol:
        .byte $00,$0f
//        .text " "
        .byte $30
        .byte $55, $55
//        .text " "
        .byte $30
        .byte$56, $56
//        .text " "
        .byte $30        
        .byte$ff
playerandjoysticksymbol:
        .byte $00,$0f
//        .text "   "
        .byte $30,$30,$30
        .byte $55
//        .text " "
        .byte $30        
        .byte $56
//        .text "   "
        .byte $30,$30,$30
        .byte $ff
arrowkeyssymbol:
        .byte $02,$0a,$57,$ff
f34f5:
        .byte $02,$0a,$58,$ff
uridiumdecal:
        .byte $02,$0a
        .byte $30,$30,$30,$30,$30,$31,$32,$33
        .byte $34,$35,$36,$37,$38,$39,$7d,$30
        .byte $30,$30,$30,$30,$ff
hiscorelabel:
        .byte $02,$0a
//        .text "     hi-score      "
        .byte $30,$30,$30,$30,$30,$41,$12,$2e,$1c,$0c,$18,$1b,$0e,$30,$30,$30,$30,$30,$30
        .byte $ff
.label ingamehiscoredisplay =*+$04
ingamebanner:
        .byte $02,$0a
//        .text "     12000 aeb   "
        .byte $30,$30,$30,$30,$30,$01,$02,$00,$00,$00,$30,$3a,$3e,$3b,$30,$30,$30
        .byte $ff
//        .text "2c    "
//        .text " "
        .byte $02,$0c,$30,$30,$30,$30,$30
        .byte $55, $55
//        .text "     "
        .byte $30,$30,$30,$30,$30
        .byte $56,$56,$ff
//        .text "2c     "
        .byte $02,$0c,$30,$30,$30,$30,$30
        .byte $55
//        .text "         "
        .byte $30,$30,$30,$30,$30,$30,$30,$30,$30
        .byte $56, $ff
//        .text "2c     "
        .byte $02,$0c,$30,$30,$30,$30,$30
        .byte $55, $55
//        .text "       "
        .byte $30,$30,$30,$30,$30,$30,$30
        .byte $56, $ff
scrollingtitlescreendataloptrarray:   .byte $3a,$4b,$5e//$3570
scrollingtitlescreendatahiptrarray:   .byte $35,$35,$35

hewson:
        .byte $06,$0e
//        .text "hewson"
        .byte $41,$3e,$50,$4c,$48,$47
        .byte $ff
presents:
        .byte $09,$10
//        .text "presents"
        .byte $19,$1b,$0e,$1c,$0e,$17,$1d,$1c
        .byte $ff
uridiumtitleplaceholder:
        .byte $0c,$0f
//        .text ""
        .byte $31,$32,$33,$34,$35,$36,$37,$38,$39,$7d,$ff
graftgoldltd:
        .byte $0f,$07
//        .text ""
        .byte $59
//        .text " graftgold ltd. 1986."
        .byte $30,$40,$1b,$0a,$0f,$1d,$10,$18,$15,$0d,$30,$45,$1d,$0d,$28,$30,$01,$09,$08,$06,$28
        .byte $ff
designedandprogrammedby:
        .byte $12,$05
//        .text "designed and programmed by"
        .byte $3d, $0e, $1c, $12, $10, $17, $0e, $0d, $30, $0a, $17
        .byte $0d, $30, $19, $1b, $18, $10, $1b, $0a, $42, $42, $0e, $0d, $30, $0b, $22
        .byte $ff
andrewbraybrook:
        .byte $15,$0b
//        .text "andrew braybrook."
        .byte $3a, $17, $0d, $1b, $0e, $54, $30, $3b
        .byte $1b, $0a, $22, $0b, $1b, $18, $18, $14, $28
        .byte $ff
halloffame://$35E1
        .byte $06,$0c
//        .text "hall of fame"
        .byte $41,$0a,$15,$15,$30,$18,$0f,$30,$3f,$0a,$42,$0e
        .byte $ff

.label currenthighestscore =*+$05
firstinhalloffame:
        .byte $09,$0b
//        .text "1.    12000 aeb"
        .byte $01,$28,$30,$30,$30,$30,$01,$02,$00,$00,$00,$30,$3a,$3e,$3b
        .byte $ff
        .byte $00,$01,$20,$00
secondinhalloffame:
        .byte $0b,$0b
//        .text "2.    11000    "
        .byte $02,$28,$30,$30,$30,$30,$01,$01,$00,$00,$00,$30,$30,$30,$30
        .byte $ff
        .byte $00,$01,$10,$00
thirdinhalloffame:
        .byte $0d,$0b
//        .text "3.    10000    "
        .byte $03,$28,$30,$30,$30,$30,$01,$00,$00,$00,$00,$30,$30,$30,$30
        .byte $ff
        .byte $00,$01,$00,$00
fourthinhalloffame:
        .byte $0f,$0b
//        .text "4.     9000    "
        .byte $04,$28,$30,$30,$30,$30,$30,$09,$00,$00,$00,$30,$30,$30,$30
        .byte $ff
        .byte $00,$00,$90,$00
fifthinhalloffame:
        .byte $11,$0b
//        .text "5.     8000    "
        .byte $05,$28,$30,$30,$30,$30,$30,$08,$00,$00,$00,$30,$30,$30,$30
        .byte $ff
        .byte $00,$00,$80,$00
sixthinhalloffame:
        .byte $13,$0b
//        .text "6.     7000    "
        .byte $06,$28,$30,$30,$30,$30,$30,$07,$00,$00,$00,$30,$30,$30,$30
        .byte $ff
        .byte $00,$00,$70,$00
seventhinhalloffame:
        .byte $15,$0b
//        .text "7.     6000    "
        .byte $07,$28,$30,$30,$30,$30,$30,$06,$00,$00,$00,$30,$30,$30,$30
        .byte $ff
        .byte $00,$00,$60,$00
eighthinhalloffame:
        .byte $17,$0b
//        .text "8.     5000    "
        .byte $08,$28,$30,$30,$30,$30,$30,$05,$00,$00,$00,$30,$30,$30,$30
        .byte $ff
        .byte $00,$00,$50,$00
colorlabel:
        .byte $00,$0f
//        .text "  colour  "
        .byte $30,$30,$3c,$18,$15,$18,$1e,$1b,$30,$30
        .byte $ff
blckwhitelabel:
        .byte $00,$0f
//        .text "blck-whte"
        .byte $3b, $15, $0c, $14, $2e, $50, $11, $1d, $0e 
        .byte $ff
demolabel:
        .byte $00,$0f
//        .text "  demo   "
        .byte $30,$30,$3d, $0e, $42, $18, $30, $30, $30
        .byte $ff
currentcolorvaluearray:  .byte m_ltblue,m_gray2,m_gray1,m_ltgreen,m_gray3,m_ltgreen,m_gray1,m_gray2


screenwritejumptableloptr:   .byte <maybechangetitledecal,<updateanddisplaysomesprites,<updateplayerscore,<maybeshowpausescreen
                            .byte <returnearly,<maybelaunchmine,<updatecurrentcolorvalue,<maybeshowpausescreen
screenwritejumptablehiptr:  .byte >maybechangetitledecal,>updateanddisplaysomesprites,>updateplayerscore,>maybeshowpausescreen
                            .byte >returnearly,>maybelaunchmine,>updatecurrentcolorvalue,>maybeshowpausescreen


f36dd:   .byte $d3,$7f,$b5,$42
f36e1:   .byte $22,$1f,$23,$23

functionptrarray:
        .byte <returnearly,>returnearly,<performdetailedupdateforsprite,>performdetailedupdateforsprite
        .byte <maybeanimateenemybullet,>maybeanimateenemybullet
        .byte <updatespritepositionvalueandfunctionptrindex,>updatespritepositionvalueandfunctionptrindex
        .byte <maybeanimateminecreation,>maybeanimateminecreation,<maybemineexplodes,>maybemineexplodes
        .byte <returnearly,>returnearly
f36f3:  .byte $a0,$80,$80,$60,$a0,$a0,$c0,$b0
        .byte $a0,$40,$70,$60,$80,$90,$70,$80
f3703:  .byte $61,$61,$81,$71,$81,$91,$81,$91
        .byte $b1,$21,$61,$51,$41,$71,$61,$41
f3713:   .byte $10,$10,$14,$18,$1c,$0c,$18,$1c
        .byte $0c,$0a,$18,$10,$0c,$14,$0e,$18
f3723:   .byte $0d,$12,$0d,$0c,$12,$0d,$0e,$0d
        .byte $10,$0f,$0c,$0c,$0e,$0d,$0d,$0c
f3733:   .byte $06,$05,$06,$07,$07,$05,$09,$08
        .byte $04,$04,$08,$06,$04,$06,$05,$07
f3743:   .byte $05,$04,$06,$07
f3747:   .byte $06,$04,$06,$06,$04,$05,$06,$06
f374f:   .byte $05,$06,$06,$07,$00,$02,$05,$09
        .byte $09,$09,$02,$00,$14,$12,$0f,$0c
        .byte $0c,$0c,$12,$00
p3763:   .byte m_ltgreen,m_green,m_green,m_cyan,m_cyan,m_ltblue,m_ltblue,m_purple
        .byte m_purple,m_red,m_red,m_orange,m_orange,m_yellow,m_yellow,m_white
        .byte m_black,m_ltgreen,m_green,m_black,m_black
colorsforsomething1:   .byte m_ltblue,m_ltblue,m_cyan,m_ltblue,m_black,m_ltblue,m_blue,m_black
        .byte m_blue,m_purple,m_black,m_purple,m_red,m_black,m_red,m_orange
        .byte m_black,m_orange,m_yellow,m_black,m_black
p378d:   .byte m_ltblue,m_ltblue,m_ltblue,m_ltblue,m_yellow,m_green,m_black,m_green
        .byte m_ltgreen,m_black,m_ltgreen,m_cyan,m_black,m_cyan,m_ltblue,m_black
        .byte m_ltblue,m_blue,m_black,m_black,m_black
a37a2:   .byte m_white
a37a3:   .byte m_white,m_black
a37a5:   .byte m_white
a37a6:   .byte m_white,m_black
a37a8:   .byte m_white
a37a9:   .byte m_white,m_black
a37ab:   .byte m_white
a37ac:   .byte m_white,m_black,m_black,m_black,m_black,m_black,m_black
f37b3:   .byte m_yellow
f37b4:   .byte m_orange
f37b5:   .byte m_red
f37b6:   .byte m_purple
f37b7:   .byte m_ltblue,m_cyan,m_ltgreen,m_green,m_yellow,m_orange,m_red,m_purple

p37bf:   .byte m_gray3,m_white,m_black,m_white,m_gray3,m_black,m_gray3,m_gray2
        .byte m_black,m_black,m_black,m_black,m_black,m_black

p37cd:   .byte m_cyan,m_ltgreen,m_black,m_ltgreen,m_green,m_black,m_black,m_black
        .byte m_black,m_black,m_black

player1:
        .byte $0a,$0f
//        .text "player 1"
        .byte $49, $15, $0a, $22, $0e, $1b, $30, $01
        .byte $ff
player2:
        .byte $0a,$0f
//        .text "player 2"
        .byte $49, $15, $0a, $22, $0e, $1b, $30, $02
        .byte $ff
gameon:
        .byte $0d,$0e
//        .text "game on!"
        .byte $40, $0a, $42, $0e, $30, $48, $17, $25
        .byte $ff

.label tenslivesleftdisplayed =*+$02
.label livesleftdisplayed =*+$03
liveslefttext:
        .byte $10,$0e
//        .text " 3     left."
        .byte $30,$03,$30,$30,$30,$30,$30,$15,$0e,$0f,$1d,$28
        .byte $ff
gameover:
        .byte $0d,$0d
//        .text "game over!"
        .byte $40,$0a,$42,$0e,$30,$48,$1f,$0e,$1b,$25
        .byte $ff

destructsequenceprimed:
        .byte $07,$07
//        .text "destruct sequence primed!"
        .byte $3d,$0e,$1c,$1d,$1b,$1e,$0c,$1d,$30,$1c,$0e,$1a,$1e,$0e
        .byte $17,$0c,$0e,$30,$19,$1b,$12,$42,$0e,$0d,$25,$ff
formationannihilationbonus:
        .byte $0a,$05
//        .text "formation annihilation bonus:"
        .byte $3f,$18,$1b,$42,$0a,$1d,$12,$18,$17,$30,$0a,$17,$17,$12,$11
        .byte $12,$15,$0a,$1d,$12,$18,$17,$30,$0b,$18,$17,$1e,$1c,$2a
        .byte $ff
shipdestructbonus:
        .byte $10,$0a
//        .text "ship destruct bonus:"
//        .text ""
        .byte $4c,$11,$12,$19,$30,$0d,$0e,$1c,$1d,$1b,$1e,$0c,$1d,$30,$0b,$18,$17,$1e,$1c,$2a
        .byte $ff

.label a3870 =*+$08
.label a3871 =*+$09
.label a3875 =*+$0d
.label a3876 =*+$0e
scorebonus:
        .byte $0d,$0d
//        .text "100 x 00 = 0000"
        .byte $01,$00,$00,$30,$51,$30,$00,$00,$30,$2f,$30,$00,$00,$00,$00
        .byte $ff
youveamassedahighscore:
        .byte $0d,$04
//        .text "you have amassed a great score!"
        .byte $52, $18, $1e, $30, $11, $0a, $1f, $0e, $30, $0a, $42, $0a, $1c, $1c, $0e, $0d
        .byte $30, $0a, $30, $10, $1b, $0e, $0a, $1d, $30, $1c, $0c, $18, $1b, $0e, $25
        .byte $ff
pleaseenteryourinitials:
        .byte $10,$06
//        .text "please enter your initials."
        .byte $49,$15,$0e,$0a,$1c,$0e,$30,$0e,$17,$1d,$0e,$1b,$30,$22,$18,$1e,$1b,$30,$12,$17,$12,$1d,$12,$0a,$15,$1c,$28,$ff
.label initialone =*+$02
.label initial2 =*+$03
.label initial3 =*+$04
initialsinputfield:
        .byte $13,$11
//        .text "a..   "
        .byte $3a,$28,$28,$30,$30,$30
        .byte $ff
f38c3:   .byte $3a,$3b,$3c,$3d,$3e,$3f,$40,$41
        .byte $16,$43,$44,$45,$46,$47,$48,$49
        .byte $4a,$4b,$4c,$4d,$4e,$4f,$50,$51
        .byte $52,$53,$30
f38de:   .byte $f1,$ff,$fc,$fb,$f0
f38e3:   .byte $ff,$fc,$fb,$f0,$f0
f38e8:   .byte $fb,$fb,$f0,$f0,$f0
f38ed:   .byte $00,$00,$00,$00,$01,$01,$02,$05
        .byte $07,$10,$20,$50
f38f9:   .byte $00,$10,$25,$50,$00,$50,$50,$00
        .byte $50,$00,$00,$00
f3905:   .byte $04,$06,$09,$0c,$0f,$12,$15
f390c:   .byte $04,$0d,$0b,$09,$07,$05,$03
f3913:   .byte $04,$06,$09,$0c,$0f,$12,$15
f391a:   .byte $04,$17,$19,$1b,$1d,$1f,$21
f3921:   .byte $03
a3922:   .byte $05
a3923:   .byte $07
a3924:   .byte $09
a3925:   .byte $0c
a3926:   .byte $10,$16
a3928:   .byte $80
a3929:   .byte $80,$80,$80
f392c:   .byte $a0,$a1,$a2,$a3
f3930:   .byte $f2,$f2,$f7,$f6,$f4,$f3,$f5

#import "game_data.asm"

*=$3f00 "3F00"
//---------------------------------------------------------------------------------
// irqinterrupt2   
//---------------------------------------------------------------------------------
irqinterrupt2:
        pha 
        lda #$c0
        sta $d016    //vic control register 2

        // switch charset to maincharacterset
        lda #$2d
        sta $d018    //vic memory control register
        lda #$01
        sta $d019    //vic interrupt request register (irr)
        lda #$52
        sta $d012    //raster position
        lda #$1b
        sta $d011    //vic control register 1
        lda #$f0
        sta $d021    //background color 0
        inc shouldwaituntilready
        lda #<irqinterrupt3
        sta $fffe    //irq
        lda #>irqinterrupt3
        sta $ffff    //irq
        txa 
        pha 
        tya 
        pha 
        jsr playtitletune
        pla 
        tay 
        pla 
        tax 
        pla 
        rti 

//--------------------------------------------------------------------
// irqinterrupt3   
//--------------------------------------------------------------------
irqinterrupt3:
        pha 
        sec 
        lda #$06
b3f3c:   sbc #$01
        bne b3f3c

        // turn on charset multi-color mode if enabled
        lda multicolormodeenabled
        and #$07
        ora #$d0
        sta $d016    //vic control register 2

        // switch charset to surfacetexturecharacterset
.label a3f4a =*+$01
        lda #$2f
        sta $d018    //vic memory control register

        lda a4a
        sta $d021    //background color 0
        lda #$01
        sta $d019    //vic interrupt request register (irr)
        lda #$61
        sta $d012    //raster position
        lda #$1b
        sta $d011    //vic control register 1
        inc shouldwaituntilready
        lda #<irqinterrupt4
        sta $fffe    //irq
        lda #>irqinterrupt4
        sta $ffff    //irq
        jsr sb24b
        pla 
        rti 

//--------------------------------------------------------------------
// irqinterrupt4   
//--------------------------------------------------------------------
irqinterrupt4:
        pha 
        lda #$01
        sta $d019    //vic interrupt request register (irr)
        lda #$fc
        sta $d012    //raster position
        lda #$1b
        sta $d011    //vic control register 1
        lda #$00
        sta shouldwaituntilready
        lda #<irqinterrupt2
        sta $fffe    //irq
        lda #>irqinterrupt2
        sta $ffff    //irq
        pla 
        rti 

//-------------------------------------------------------------------
// irqinterrupt1   
//-------------------------------------------------------------------
irqinterrupt1:
        pha 
        lda #$07
        sec 
b3f97:  sbc #$01
        bne b3f97

        // switch charset to maincharacterset
        lda #$2d
        sta $d018    //vic memory control register
        lda #$f0
        sta $d021    //background color 0
        lda #$1b
        sta $d011    //vic control register 1
        lda #$c8
        sta $d016    //vic control register 2
        
.label a3fb0 =*+$01
        lda #$00
        sta shouldwaituntilready

        lda #$01
        sta $d019    //vic interrupt request register (irr)

        lda a3fb0
        sta $d012    //raster position

        eor #$80
        sta a3fb0

        jsr sb24b
        lda shouldwaituntilready
        beq b3fd5
        txa 
        pha 
        tya 
        pha 
        jsr playtitletune
        pla 
        tay 
        pla 
        tax 
b3fd5:   pla 
p3fd6:   rti 

        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00,$ff,$00,$ff,$00,$ff,$00,$ff
        .byte $00

#import "explosion_sprites.asm"
#import "ship_sprites.asm"
#import "enemy_sprites.asm"
#import "charset.asm"

*=$a900 "A900"
fa900:   
//--------------------------------------------------------------------
// sa900   
//--------------------------------------------------------------------
sa900:
        sta initial3
.label aa904 =*+$01
        lda #$01
        sta ac90a
        rts 

//--------------------------------------------------------------------
// ja909   jc909
//--------------------------------------------------------------------
ja909:
        lda #$01
        beq ba910
        jmp jc9b1

//--------------------------------------------------------------------
// ba910   
//--------------------------------------------------------------------
ba910:  ldx #$00
ba912:   lda firstinhalloffame,x
        sta fca00,x
        inx 
        cpx #$ac
        bne ba912
        ldx #$13
ba91f:   lda ingamebanner,x
        sta fcaac,x
        dex 
        bpl ba91f
        ldx #$0d
ba92a:   lda hiscoreforscrollingbanner,x
        sta fcac0,x
        dex 
        bpl ba92a

        ldx #$6f

//--------------------------------------------------------------------
// ba935   
//--------------------------------------------------------------------
ba935:
        lda f90,x
        sta screen_ram + $0000,x
        dex 
        bpl ba935
        sei 
        lda #$f0
        sta $d01a    //vic interrupt mask register (imr)
        lda #$00
        sta $dc0d    //cia1: cia interrupt control register
        lda #$0b
        sta $d011    //vic control register 1
        lda #$37
        sta a01
        jsr $fda3 //(jmp) - initialize cia & irq             
        cli 
        ldx #$00
        stx $02a1
        txa 
ba95b:   sta f90,x
        inx 
        cpx #$70
        bne ba95b

//-------------------------------------------------------------------
// sc962 sa962
//-------------------------------------------------------------------
        lda #$01
        tay 
        ldx #$08
        jsr $ffba //- set file parameters              
        lda #$13
        ldx #$bf
        ldy #$c9
        jsr $ffbd //- set file name                    
        lda #<fca00
        sta afb
        ldy #>fca00
        sty afc
        ldx #$ce
        lda #$fb
        jsr $ffd8 //- save after call setlfs,setnam    
        sei 
        lda #$35
        sta a01
        ldx #$6f
ba989:   lda screen_ram + $0000,x
        sta f90,x
        dex 
        bpl ba989

        // switch bank to bank 1 ($4000)
        lda $dd02    //cia2: data direction register a
        ora #$03
        sta $dd02    //cia2: data direction register a
        lda $dd00    //cia2: data port register a
        and #$fc
        ora #$02
        sta $dd00    //cia2: data port register a

        lda #$01
        sta $d01a    //vic interrupt mask register (imr)
        lda #$7f
        sta $dc0d    //cia1: cia interrupt control register
        sta $dd0d    //cia2: cia interrupt control register
        cli 
        lda #$01
        sta ac90a
        sta a349c
        sta a349d
        jmp preparetitlescreen

        rti 

fa9c0:
//.enc "none"
        .text "s:uridium high/rem"
//.enc "petscii"

//--------------------------------------------------------------------
// sa9d2   
//--------------------------------------------------------------------
sa9d2:
        jsr maybedisplaylandnowwarning
        lda $dc00    //cia1: data port register a
        sta ac9ec
        lda #$7f
        sta $dc00    //cia1: data port register a
        lda $dc01    //cia1: data port register b
aa9e3:  lda #$df
        beq ba9f1
aa9e7:   lda #$bf
        beq ba9f7
        lda #$ff
        sta $dc00    //cia1: data port register a
        rts 

ba9f1:   jsr incrementtwovalues
        jmp jc9eb

ba9f7:   lda #$01
        sta a85
        jmp jc9eb


*=$b000 "B000"
//-------------------------------------------------------------------
// initializesomepointers
//-------------------------------------------------------------------
initializesomepointers:
        lda #>$0180
        sta abc
        lda #<$0180
        sta abb
        ldx #<p10
        ldy #>p10
        stx ab7
        sty ab8
        lda #<screen_ram + $0100
        sta a94
        lda #>screen_ram + $0100
        sta a95
        rts 

//-------------------------------------------------------------------
// getjoystickinput
//-------------------------------------------------------------------
getjoystickinput:
        lda #$00
        sta a16
        sta a17
        lda #$ff
        sta $dc00    //cia1: data port register a
.label joystick1loptr =*+$01
.label joystick1hiptr =*+$02
        lda $dc00    //cia1: data port register a
.label joystick2loptr =*+$01
.label joystick2hiptr =*+$02
        and $dc01    //cia1: data port register b
        bit msbforspritearray + $02
        beq bb037
        bit msbforspritearray + $03
        beq bb03b
        jmp jb03d

bb037:   dec a17
        bne jb03d
bb03b:   inc a17
jb03d:   bit msbforspritearray
        beq bb04a
        bit msbforspritearray + $01
        beq bb04e
        jmp jb050

bb04a:  dec a16
        bne jb050
bb04e:  inc a16
jb050:   and #$10
        sta firepressed
        rts 

msbforspritearray:   .byte $01,$02,$04,$08,$10,$20,$40,$80
//-------------------------------------------------------------------
// storespritecontentcolorandposition
//-------------------------------------------------------------------
storespritecontentcolorandposition:
        ldy spriteindex
        lda msbforspritearray,y
        sta currentspritemsb
        eor #$ff
        sta a03
        lda $d027,y  //sprite 0 color
        sta currentspritecolor
        lda sprite0ptr,y
        sta currentspritevalue
        tya 
        asl 
        tay 
        lda $d000,y  //sprite 0 x pos
        sta currentspritexpos
        lda $d001,y  //sprite 0 y pos
        sta currentspriteypos
        lda $d010    //sprites 0-7 msb of x coordinate
        and currentspritemsb
        beq bb088
        lda #$ff
bb088:   sta a06
        lda $d015    //sprite display enable
        and currentspritemsb
        sta currentspritedisplayenable
        rts 

//-------------------------------------------------------------------
// storeshipspritestate
//-------------------------------------------------------------------
storeshipspritestate:
        ldy spriteindex
        lda msbforspritearray,y
        sta currentspritemsb
        eor #$ff
        sta a03
        lda $d027,y  //sprite 0 color
        sta currentspritecolor
        lda sprite0ptr,y
        sta currentspritevalue
        tya 
        asl 
        tay 
        lda $d000,y  //sprite 0 x pos
        sta currentspritexpos
        lda $d001,y  //sprite 0 y pos
        sta currentspriteypos
        lda $d010    //sprites 0-7 msb of x coordinate
        and currentspritemsb
        beq bb0bd
        lda #$ff
bb0bd:   sta a06
        lda $d015    //sprite display enable
        and currentspritemsb
        sta currentspritedisplayenable
        lda $d017    //sprites expand 2x vertical (y)
        and currentspritemsb
        sta currentspriteexpandvertical
        lda $d01b    //sprite to background display priority
        and currentspritemsb
        sta currentspritebackgrounddisplaypriority
        lda $d01c    //sprites multi-color mode select
        and currentspritemsb
        sta currentspritemulticolormode
        lda $d01d    //sprites expand 2x horizontal (x)
        and currentspritemsb
        sta currentspriteexpandhorizontal
        rts 

//-------------------------------------------------------------------
// updatespritesizecolorandpriority
//-------------------------------------------------------------------
updatespritesizecolorandpriority:
        ldy spriteindex
        lda msbforspritearray,y
        sta currentspritemsb
        eor #$ff
        sta a03
        lda currentspritecolor
        sta $d027,y  //sprite 0 color
        lda currentspritemulticolormode
        beq bb0fe
        lda currentspritemsb
        ora $d01c    //sprites multi-color mode select
        bne bb103
bb0fe:  lda $d01c    //sprites multi-color mode select
        and a03
bb103:   sta $d01c    //sprites multi-color mode select
        lda currentspriteexpandvertical
        beq bb111
        lda currentspritemsb
        ora $d017    //sprites expand 2x vertical (y)
        bne bb116
bb111:   lda $d017    //sprites expand 2x vertical (y)
        and a03
bb116:   sta $d017    //sprites expand 2x vertical (y)
        lda currentspriteexpandhorizontal
        beq bb124
        lda currentspritemsb
        ora $d01d    //sprites expand 2x horizontal (x)
        bne bb129
bb124:  lda $d01d    //sprites expand 2x horizontal (x)
        and a03
bb129:   sta $d01d    //sprites expand 2x horizontal (x)
        lda currentspritebackgrounddisplaypriority
        beq bb137
        lda currentspritemsb
        ora $d01b    //sprite to background display priority
        bne bb13c
bb137:   lda $d01b    //sprite to background display priority
        and a03
bb13c:   sta $d01b    //sprite to background display priority

//-------------------------------------------------------------------
// updatespritecontentandposition
//-------------------------------------------------------------------
updatespritecontentandposition:
        ldy spriteindex
        lda msbforspritearray,y
        sta currentspritemsb
        eor #$ff
        sta a03
        lda currentspritevalue
        sta sprite0ptr,y
        tya 
        asl 
        tay 
        lda currentspritexpos
        sta $d000,y  //sprite 0 x pos
        lda currentspriteypos
        sta $d001,y  //sprite 0 y pos
        lda a06
        and #$01
        sta a06
        lda a06
        beq bb16d
        lda currentspritemsb
        ora $d010    //sprites 0-7 msb of x coordinate
        bne bb172
bb16d:   lda $d010    //sprites 0-7 msb of x coordinate
        and a03
bb172:   sta $d010    //sprites 0-7 msb of x coordinate
        lda currentspritedisplayenable
        beq bb180
        lda currentspritemsb
        ora $d015    //sprite display enable
        bne bb185
bb180:   lda $d015    //sprite display enable
        and a03
bb185:  sta $d015    //sprite display enable
        rts 

//-------------------------------------------------------------------
// writetoram
//-------------------------------------------------------------------
writetoram:
        sta currentspritecolor
jb18b:   ldy #$00
bb18d:   sta (ramloptr),y
        iny 
        cpy #$28
        bcc bb18d
        dex 
        beq bb1a7
        clc 
        lda ramloptr
        adc #$28
        sta ramloptr
        bcc bb1a2
        inc ramhiptr
bb1a2:   lda currentspritecolor
        jmp jb18b

bb1a7:   clc 
        clc 
        lda ramloptr
        adc #$28
        sta ramloptr
        bcc bb1b3
        inc ramhiptr
bb1b3:   rts 

//-------------------------------------------------------------------
// updateplayerscore
//-------------------------------------------------------------------
updateplayerscore:
        lda #$02
        sta currentcharypos
.label ab1b9 =*+$01
        lda #$02
        sta currentcharxpos
        ldx #$00
        stx a10
        lda #$30
        sta a0f
bb1c4:  lda playerscore,x
        lsr 
        lsr 
        lsr 
        lsr 
        bne bb1ef
        lda a0f
jb1ce:   sta chartowrite
        jsr writecharactertoscreen
        ldx a10
        lda playerscore,x
        and #$0f
        bne bb1f6
        cpx #$03
        beq bb1f6
        lda a0f
jb1e1:   sta chartowrite
        jsr writecharactertoscreen
        inc a10
        ldx a10
        cpx #$04
        bne bb1c4
        rts 

bb1ef:   ldy #$00
        sty a0f
        jmp jb1ce

bb1f6:  ldy #$00
        sty a0f
        jmp jb1e1

//-------------------------------------------------------------------
// domorewithjoystickinput
//-------------------------------------------------------------------
domorewithjoystickinput:   
        lda #$ff
        sta $dc02    //cia1: data direction register a
        lda #$00
        sta $dc03    //cia1: data direction register b
        lda #$fe
        sta $dc00    //cia1: data port register a
        lda $dc01    //cia1: data port register b
        and #$78
        sta a19
        lda #$fd
        sta $dc00    //cia1: data port register a
        lda $dc01    //cia1: data port register b
        and #$80
        ora a19
        sta a19
        lda #$bf
        sta $dc00    //cia1: data port register a
        lda $dc01    //cia1: data port register b
        and #$10
        bne bb233
        lda a19
        and #$7f
        sta a19
bb233:  lda #$ff
        sta $dc00    //cia1: data port register a
        lda $dc01    //cia1: data port register b
        ora #$e0
        eor #$ff
        ora a19
        sta a19
        rts 

//-------------------------------------------------------------------
// wastecyclesusingxandy
//-------------------------------------------------------------------
wastecyclesusingxandy:
        dex 
        bne wastecyclesusingxandy
        dey 
        bne wastecyclesusingxandy
        rts 

//-------------------------------------------------------------------
// sb24b
//-------------------------------------------------------------------
sb24b:
        lda a01
        and #$10
        beq bb25a
        lda a01
        ora #$20
        sta a01
        sta a94
bb259:   rts 

bb25a:   lda a94
        beq bb259
        lda a01
        and #$df
        sta a01
        rts 

pausetext:
        .byte $00,$0f
//        .text "  pause   "
        .byte $30,$30,$49,$0a,$1e,$1c,$0e,$30,$30,$30
        .byte $ff
//-------------------------------------------------------------------
// spinwaitingforjoystickinput
//-------------------------------------------------------------------
spinwaitingforjoystickinput:
        lda #$08
        sta initialvalueofy
bb276:   jsr getjoystickinput
        ldy #$08
        jsr wastecyclesusingxandy
        lda firepressed
        beq spinwaitingforjoystickinput
        dec initialvalueofy
        bne bb276
        rts 

//-------------------------------------------------------------------
// updatespriteindicesandthenredrawsprites
//-------------------------------------------------------------------
updatespriteindicesandthenredrawsprites:
        ldy #$0a
bb289:   lda (srcloptr),y
        sta .a spriteindex,y
        dey 
        bpl bb289
        jsr updatespritesizecolorandpriority
        rts 

//-------------------------------------------------------------------
// writetoscreen
//-------------------------------------------------------------------
writetoscreen:
        stx dataloptr
        sty datahiptr

        //get the y pos from the first byte
bb299:   ldy #$00
        lda (dataloptr),y
        sta currentcharypos
.label bb2a0 =*+$01
        // return early if the y pos is invalid
        cmp #$18
        bcs bb2c5

        // get the x pos from the second byte
        iny 
        lda (dataloptr),y
        sta currentcharxpos

        // get the character to write. only use the lowest 7 bits for
        // some reason.
        iny 
        lda (dataloptr),y
        and #$7f
        // skip to the entry point of the loop for reading in the
        // characters to write.
        jmp jb2b4

writecharsloop:
        ldy aba
        lda (dataloptr),y
jb2b4:   iny 
        sty aba

        // stop writing if the leftmost bit is set on aba. this means
        // the most bytes we'll write is 128.
        bmi bb2c5
        // stop writing if the leftmost bit is set on the char to write.
        cmp #$00
        bmi bb2c5

        // write the character to screen.
        sta chartowrite
        jsr writecharactertoscreen
        jmp writecharsloop

bb2c5:  rts 

//-------------------------------------------------------------------
// writecharactertoscreen
//-------------------------------------------------------------------
writecharactertoscreen:
        // move the ptr to the x/y position.
        ldy currentcharypos
        lda screenlinehiptrarray,y
        sta temphiptrcopyto
        lda screenlineloptrarray,y
        clc 
        adc currentcharxpos
        sta temploptrcopyto

        lda #$00
        adc temphiptrcopyto
        sta temphiptrcopyto

        // write the top half of the character
        lda chartowrite
        ldy #$00
        sta (temploptrcopyto),y

        // write the bottom half of the character
        ora #$80
        ldy #$28
        sta (temploptrcopyto),y

        // check if the byte encodes a second half.
        inc currentcharxpos
        and #$7f
        cmp #$3a
        bcc bb301

        cmp #$5a
        bcs bb301

        // the byte encodes a second half. write the top half of it.
        ldy #$01
        adc #$20
        sta (temploptrcopyto),y

        // write the bottom half of it.
        ora #$80
        ldy #$29
        sta (temploptrcopyto),y

        inc currentcharxpos
bb301:   rts 

//-------------------------------------------------------------------
// copydatauntilxiszero
//-------------------------------------------------------------------
copydatauntilxiszero:
        ldy #$00
        jsr copydatauntilyiszero
        inc temphiptrcopyfrom
        inc temphiptrcopyto
        dex 
        bne copydatauntilxiszero
        rts 

//-------------------------------------------------------------------
// copydatauntilyiszero
//-------------------------------------------------------------------
copydatauntilyiszero:
        lda (temploptrcopyfrom),y
        sta (temploptrcopyto),y
        dey 
        bne copydatauntilyiszero
        lda (temploptrcopyfrom),y
        sta (temploptrcopyto),y
        rts 

//-------------------------------------------------------------------
// updatevolumesetting
//-------------------------------------------------------------------
updatevolumesetting:
        lda a62
        and #$03
        bne bb35f
        lda a19
        and #$40
        bne bb35f
        lda a19
        bpl bb336
        lda a95
        cmp #$0f
        bcs bb33e
        inc a95
        jmp bb33e

bb336:   lda a95
        cmp #$00
        beq bb33e
        dec a95
bb33e:   lda a95
        cmp #$0a
        bcc bb34b
        sbc #$0a
        ldy #$01
        jmp jb34d

bb34b:   ldy #$30
jb34d:   sty volumetens
        sta volumeones
        lda a95
        sta aef
        nop 
        ldx #<volumetext
        ldy #>volumetext
        jsr writetoscreen
bb35f:   rts 


*=$c1b8 "C1B8"

.label dreadnoughtloptr = spriteindex
.label dreadnoughthiptr = currentspritexpos
//-------------------------------------------------------------------
// notthedreadnoughdestructionsequence   
//-------------------------------------------------------------------
notthedreadnoughdestructionsequence:
        jsr $e544
        // switch charset to $1800?
        lda #$16
        sta $d018    //vic memory control register
        lda #$80
        sta $d020    //border color
        sta $d021    //background color 0
        sta $0291

jc1cb:   lda #>pc800
        sta dreadnoughthiptr
        ldx #<pc800
        stx dreadnoughtloptr

        txa 
bc1d4:   sta color_ram + $0000,x
        sta color_ram + $0100,x
        sta color_ram + $0200,x
        sta color_ram + $0300,x
        inx 
        bne bc1d4

bc1e3:   lda #$0b
        sta $d011    //vic control register 1
bc1e8:   lda $d011    //vic control register 1
        bpl bc1e8

        sei 
        lda #$34
        sta a01

        ldy #$00
bc1f4:   lda (dreadnoughtloptr),y
        eor #$80
        sta screen_ram + $0000,y
        iny 
        bne bc1f4

        inc dreadnoughthiptr
bc200:   lda (dreadnoughtloptr),y
        eor #$80
        sta screen_ram + $0100,y
        iny 
        bne bc200

        inc dreadnoughthiptr
bc20c:   lda (dreadnoughtloptr),y
        eor #$80
        sta screen_ram + $0200,y
        iny 
        bne bc20c

        inc dreadnoughthiptr
bc218:  lda (dreadnoughtloptr),y
        eor #$80
        sta screen_ram + $0300,y
        iny 
        cpy #$e8
        bne bc218
        lda #$37
        sta a01
        cli 
        lda dreadnoughtloptr
        clc 
        adc #$e8
        sta dreadnoughtloptr
        lda dreadnoughthiptr
        adc #$00
        sta dreadnoughthiptr
bc236:   lda $d011    //vic control register 1
        bpl bc236
        lda #$1b
        sta $d011    //vic control register 1
        ldx #$00
        jsr flashbackgroundduringdreadnoughtdestruction
bc245:   lda $dc01    //cia1: data port register b
        cmp #$7f
        beq bc2a2
        cmp #$ef
        bne bc245
        ldx #$0c
        jsr flashbackgroundduringdreadnoughtdestruction
        lda dreadnoughthiptr
        cmp #$df
        bne bc1e3
        lda dreadnoughtloptr
        cmp #$70
        bne bc1e3
        jmp jc1cb

//-------------------------------------------------------------------
// flashbackgroundduringdreadnoughtdestruction
//-------------------------------------------------------------------
flashbackgroundduringdreadnoughtdestruction:
        ldy #$00
bc266:   sty currentspritemsb
        stx a03
        ldx #$10
        ldy #$00
bc26e:   dey 
        bne bc26e
        dex 
        bne bc26e
        ldx a03
        ldy currentspritemsb
bc278:  lda $d011    //vic control register 1
        bpl bc278
        lda backgroundcolors,x
        sta $d021    //background color 0
        inx 
        iny 
        cpy #$0c
        bne bc266
        rts 

backgroundcolors:
        .byte brown,brown,red,red,orange,orange,ltred,ltred
        .byte gray3,gray3,gray3,gray3,gray3,gray3,gray3,gray3
        .byte gray2,gray2,orange,orange,gray1,gray1,brown,brown

//--------------------------------------------------------------------
// bc2a2   
//--------------------------------------------------------------------
bc2a2:
        ldx #$0c
        jsr flashbackgroundduringdreadnoughtdestruction
        lda #$00
        sta currentspritemsb
        sta $d021    //background color 0
        jsr $e544
        sei 
        lda #$35
        sta a01
        jmp jc4cd

//-------------------------------------------------------------------
// jc2b9   
//-------------------------------------------------------------------
jc2b9:
        sei 
        lda #$0b
        sta $d011    //vic control register 1
bc2bf:   lda $d011    //vic control register 1
        bpl bc2bf
        lda #$00
        sta $d021    //background color 0
        lda #$c8
        sta $d016    //vic control register 2

        // switch bank to $0000
        lda #$97
        sta $dd00    //cia2: data port register a

        // switch charset to $1800?
        lda #$16
        sta $d018    //vic memory control register

        ldx #$00
bc2da:   lda fa900,x
        sta sc900,x
        lda #$00
        sta fca00,x
        inx 
        bne bc2da
        lda #$37
        sta a01
        cli 
        ldx #$1f
bc2ef:   lda $fd30,x
        sta $0314,x  //irq
        dex 
        bpl bc2ef
        ldx #$27
bc2fa:   lda #$0e
        sta color_ram + $0000,x
        lda #$06
        sta color_ram + $0028,x
        lda #$03
        sta color_ram + $0050,x
        dex 
        bpl bc2fa
        ldx #$77
bc30e:   lda pc000,x
        sta screen_ram + $0000,x
        dex 
        bpl bc30e
        lda #$1b
        sta $d011    //vic control register 1
bc31c:   jsr $ffe4 // - get a byte from channel          
        cmp #$54
        beq bc32a
        cmp #$48
        bne bc31c
        jmp jc455

bc32a:   lda #$01
        sta aa904
        ldx #$27
bc331:   lda fc078,x
        sta screen_ram + $0050,x
        dex 
        bpl bc331
bc33a:   jsr $ffe4 //- get a byte from channel          
        cmp #$4e
        beq bc34a
        cmp #$59
        bne bc33a
        lda #$00
        sta a0d7c
bc34a:   ldx #$27
bc34c:   lda fc0a0,x
        sta screen_ram + $0050,x
        dex 
        bpl bc34c
bc355:   jsr $ffe4 //- get a byte from channel          
        cmp #$4e
        beq bc37c
        cmp #$59
        bne bc355
        lda #$a5
        sta a15d1
        sta a1edf
        sta a204a
        lda #$00
        sta a27ec
        sta a27fa
        sta a280a
        sta a281e
        sta a2831
bc37c:   ldx #$27
bc37e:   lda fc0c8,x
        sta screen_ram + $0050,x
        dex 
        bpl bc37e
bc387:   jsr $ffe4 //- get a byte from channel          
        cmp #$4e
        beq bc397
        cmp #$59
        bne bc387
        lda #$60
        sta a134b
bc397:   ldx #$27
bc399:   lda fc0f0,x
        sta screen_ram + $0050,x
        dex 
        bpl bc399
bc3a2:  jsr $ffe4 //- get a byte from channel          
        cmp #$4e
        beq bc3be
        cmp #$59
        bne bc3a2
        lda #$16
        sta a3922
        sta a3923
        sta a3924
        sta a3925
        sta a3926
bc3be:   ldx #$27
bc3c0:  lda fc118,x
        sta screen_ram + $0050,x
        dex 
        bpl bc3c0
bc3c9:   jsr $ffe4 //- get a byte from channel          
        cmp #$4e
        beq bc3d9
        cmp #$59
        bne bc3c9
        lda #$c9
        sta aa9e7
bc3d9:   ldx #$27
bc3db:   lda fc140,x
        sta screen_ram + $0050,x
        dex 
        bpl bc3db
bc3e4:   jsr $ffe4 //- get a byte from channel          
        cmp #$0d
        beq bc434
        cmp #$11
        beq bc415
        cmp #$91
        bne bc3e4
        lda a349c
        cmp #$0f
        beq bc3e4
        inc a349c
        lda screen_ram + $0061
        cmp #$39
        beq bc40a
        inc screen_ram + $0061
        jmp bc3e4

bc40a:   inc screen_ram + $0060
        lda #$30
jc40f:   sta screen_ram + $0061
        jmp bc3e4

bc415:   lda a349c
        cmp #$01
        beq bc3e4
        dec a349c
        lda screen_ram + $0061
        cmp #$30
        beq bc42c
        dec screen_ram + $0061
        jmp bc3e4

bc42c:   dec screen_ram + $0060
        lda #$39
        jmp jc40f

bc434:   lda a349c
        sta a349d
        ldx #$27
bc43c:   lda fc168,x
        sta screen_ram + $0050,x
        dex 
        bpl bc43c
bc445:   jsr $ffe4 //- get a byte from channel          
        cmp #$4e
        beq jc455
        cmp #$59
        bne bc445
        lda #$c9
        sta aa9e3
jc455:   ldx #$27
bc457:   lda fc190,x
        sta screen_ram + $0050,x
        dex 
        bpl bc457
        lda #$00
        sta a9d
bc464:  jsr $ffe4 //- get a byte from channel          
        cmp #$52
        beq bc4b4
        cmp #$4c
        bne bc464
        jsr $e544
        jsr sc4c5
        lda #$01
        tay 
        ldx #$08
        jsr $ffba// - set file parameters              
        lda #$10
        ldx #$c2
        ldy #$c9
        jsr $ffbd //- set file name                    
        lda #$00
        tax 
        ldy #$ca
        jsr $ffd5// - load after call setlfs,setnam    
        ldx #$00
bc490:   lda fca00,x
        sta firstinhalloffame,x
        inx 
        cpx #$ac
        bne bc490
        ldx #$13
bc49d:   lda fcaac,x
        sta ingamebanner,x
        dex 
        bpl bc49d
        ldx #$0d
bc4a8:   lda fcac0,x
        sta hiscoreforscrollingbanner,x
        dex 
        bpl bc4a8
        jmp launchuridium

bc4b4:   jsr $e544
        jsr sc4c5
        lda #$60
        sta ac982
        jsr sc962
        jmp launchuridium

//-------------------------------------------------------------------
// sc4c5
//-------------------------------------------------------------------
sc4c5:
        lda #$60
        sta ac933
        jmp jc910

//--------------------------------------------------------------------
// jc4cd   
//--------------------------------------------------------------------
jc4cd:
        lda #<pc4da
        sta $fffa    //nmi
        lda #>pc4da
        sta $fffb    //nmi
        jmp $e000

pc4da:   rti 



*=$c900 "C900"
//-------------------------------------------------------------------
// sc900
//-------------------------------------------------------------------
sc900:
        sta initial3
        lda #$00
        sta ac90a
        rts 

//--------------------------------------------------------------------
// jc909   
//--------------------------------------------------------------------
jc909:

.label ac90a =*+$01
        lda #$01
        beq jc910
        jmp jc9b1

//--------------------------------------------------------------------
// jc910   
//--------------------------------------------------------------------
jc910:
        ldx #$00
bc912:   lda firstinhalloffame,x
        sta fca00,x
        inx 
        cpx #$ac
        bne bc912
        ldx #$13
bc91f:  lda ingamebanner,x
        sta fcaac,x
        dex 
        bpl bc91f
        ldx #$0d
bc92a:   lda hiscoreforscrollingbanner,x
        sta fcac0,x
        dex 
        bpl bc92a
ac933:   rts 

        .byte $6f

//--------------------------------------------------------------------
// bc935   
//--------------------------------------------------------------------
bc935:
        lda f90,x
        sta screen_ram + $0000,x
        dex 
        bpl bc935
        sei 
        lda #$f0
        sta $d01a    //vic interrupt mask register (imr)
        lda #$00
        sta $dc0d    //cia1: cia interrupt control register
        lda #$0b
        sta $d011    //vic control register 1
        lda #$37
        sta a01
        jsr $fda3 //(jmp) - initialize cia & irq             
        cli 
        ldx #$00
        stx $02a1
        txa 
bc95b:
        sta f90,x
        inx 
        cpx #$70
        bne bc95b
//-------------------------------------------------------------------
// sc962
//-------------------------------------------------------------------
sc962:
        lda #$01
        tay 
        ldx #$08
        jsr $ffba //- set file parameters              
        lda #$13
        ldx #$bf
        ldy #$c9
        jsr $ffbd //- set file name                    
        lda #<fca00
        sta afb
        ldy #>fca00
        sty afc
        ldx #$ce
        lda #$fb
        jsr $ffd8 //- save after call setlfs,setnam    
ac982:  rts 

        lda #$35
        sta a01
        ldx #$6f
bc989:   lda screen_ram + $0000,x
        sta f90,x
        dex 
        bpl bc989

        // switch bank to bank 1 ($4000)
        lda $dd02    //cia2: data direction register a
        ora #$03
        sta $dd02    //cia2: data direction register a
        lda $dd00    //cia2: data port register a
        and #$fc
        ora #$02
        sta $dd00    //cia2: data port register a

        lda #$01
        sta $d01a    //vic interrupt mask register (imr)
        lda #$7f
        sta $dc0d    //cia1: cia interrupt control register
        sta $dd0d    //cia2: cia interrupt control register
        cli 
jc9b1:   lda #$01
        sta ac90a
        sta a349c
        sta a349d
        jmp preparetitlescreen

        rti 

//.enc "none"
        .text "s:uridium high/rem"
//-------------------------------------------------------------------
// checklandnowwarning
//-------------------------------------------------------------------
checklandnowwarning:
        jsr maybedisplaylandnowwarning
        lda $dc00    //cia1: data port register a
        sta ac9ec
        lda #$7f
        sta $dc00    //cia1: data port register a
        lda $dc01    //cia1: data port register b
        lda #$df
        beq bc9f1
        lda #$bf
        beq bc9f7
.label ac9ec =*+$01
jc9eb:   lda #$ff
        sta $dc00    //cia1: data port register a
        rts 

bc9f1:   jsr incrementtwovalues
        jmp jc9eb

bc9f7:   lda #$01
        sta a85
        jmp jc9eb

        .byte $00,$00
*=$e000 "data"
#import "data.asm"

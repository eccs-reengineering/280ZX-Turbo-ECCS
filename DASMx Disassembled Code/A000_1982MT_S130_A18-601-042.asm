;
;	Disassembled by:
;		DASMx object code disassembler
;		(c) Copyright 1996-2003   Conquest Consultants
;		Version 1.40 (Oct 18 2003)
;
;	File:		.\A000_1982MT_S130_A18-601-042.BIN
;
;	Size:		8192 bytes
;	Checksum:	60B1
;	CRC-32:		B55C7F27
;
;	Date:		Wed May 29 09:02:55 2024
;
;	CPU:		Motorola 6802 (6800/6802/6808 family)
;
;
;
	org	$A000
;
LA000:
	sei
	staa	X009A
	stab	X009B
	nop
	nop
	nop
	nop
	nop
	ldaa	X009A
	ldab	X009B
	rts
;
Divide64ShiftAB:
	lsra
	rorb
	lsra
	rorb
Divide16ShiftAB:
	lsra
	rorb
Divide8ShiftAB:
	lsra
	rorb
Divide4ShiftAB:
	lsra
	rorb
	lsra
	rorb
	rts
;
Multiply16ShiftBA:
	aslb
	rola
	aslb
	rola
Multiply8ShiftBA:
	aslb
	rola
	aslb
	rola
	rts
;
SRA025:
	staa	X002A
	staa	X009A
	ldaa	X0028
	staa	X009B
	nop
	nop
	nop
	nop
	nop
	staa	X002B
	ldaa	X009A
	staa	X0028
	ldaa	X002B
	staa	X009A
	ldaa	X009B
	stab	X002B
	stab	X009B
	nop
	nop
	nop
	nop
	nop
	ldab	X0028
	adda	X009A
	adcb	#$00
	stab	X0028
	ldab	X002A
	stab	X009A
	ldab	X009B
	stab	X002A
	ldab	X0029
	stab	X009B
	nop
	nop
	nop
	nop
	nop
	ldab	X009B
	addb	X002A
	adca	X009A
	stab	X002A
	ldab	X0028
	adcb	#$00
	stab	X0028
	ldab	X0029
	stab	X009A
	ldab	X002B
	stab	X009B
	nop
	nop
	nop
	nop
	nop
	ldab	X009B
	stab	X002B
	ldab	X002A
	addb	X009A
	adca	#$00
	stab	X002A
	staa	X0029
	tab
	ldaa	X0028
	adca	#$00
	staa	X0028
	rts
;
LA091:
	staa	X002A
	stab	X002B
	ldaa	#$11
	staa	X0030
	ldaa	X0000
	bita	#$08
	beq	LA0A5
	ldaa	#$03
	ldab	#$E8
	bra	LA0A8
;
LA0A5:
	clra
	ldab	#$FA
LA0A8:
	tst	X002A
	bmi	LA0C0
	asl	X002B
	rol	X002A
	aslb
	rola
	bcc	LA0A8
LA0B7:
	pula
	pulb
	addb	#$04
	adca	#$00
	pshb
	psha
	rts
;
LA0C0:
	subb	X002B
	sbca	X002A
	bcc	LA0DE
	addb	X002B
	adca	X002A
	clc
LA0CB:
	rol	X0029
	rol	X0028
	dec	X0030
	beq	LA0E1
	aslb
	rola
	bcc	LA0C0
	subb	X002B
	sbca	X002A
LA0DE:
	sec
	bra	LA0CB
;
LA0E1:
	bcs	LA0B7
	ldaa	X0028
	ldab	X0029
	rts
;
LA0E8:
	ldaa	#$11
	staa	X0030
	ldaa	X0028
	ldab	X0029
LA0F0:
	tst	X002D
	bmi	LA10F
	asl	X002F
	rol	X002E
	rol	X002D
	asl	X002C
	rol	X002B
	rol	X002A
	rolb
	rola
	bcc	LA0F0
LA10B:
	ldaa	#$FF
	tab
	rts
;
LA10F:
	subb	X002E
	sbca	X002D
	bcc	LA130
	addb	X002E
	adca	X002D
	clc
LA11A:
	rol	X002C
	rol	X002B
	dec	X0030
	beq	LA133
	rol	X002A
	rolb
	rola
	bcc	LA10F
	subb	X002E
	sbca	X002D
LA130:
	sec
	bra	LA11A
;
LA133:
	bcs	LA10B
	ldaa	X002B
	ldab	X002C
	rts
;
LA13A:
	cmpa	#$F0
	bls	LA140
	ldaa	#$F0
LA140:
	clrb
	lsra
	rorb
	bra	LA14C
;
LA145:
	cmpa	#$F8
	bls	LA14B
	ldaa	#$F8
LA14B:
	clrb
LA14C:
	lsra
	rorb
	lsra
	rorb
	lsra
	rorb
	sei
	stx	X0053
	adda	X0054
	staa	X0054
	ldaa	#$00
	adca	X0053
	staa	X0053
	ldx	X0053
	cli
	tstb
	beq	LA17D
	ldaa	$01,x
	suba	$00,x
	beq	LA17D
	bcc	LA176
	nega
	negb
	jsr	LA000
	cli
	adda	$01,x
	rts
;
LA176:
	jsr	LA000
	cli
	adda	$00,x
	rts
;
LA17D:
	ldaa	$00,x
	rts
;
LA180:
	ldaa	X0057
	ldab	X0058
	jsr	Divide64ShiftAB
	staa	X0057
	stab	X0058
	ldx	X0071
	ldaa	X0079
	bpl	LA195
	ldab	#$07
	bra	LA197
;
LA195:
	ldab	#$0F
LA197:
	ldaa	X0058
	suba	$03,x
	ldaa	X0057
	sbca	$02,x
	bcs	LA1A6
	inx
	inx
	decb
	bne	LA197
LA1A6:
	ldaa	X0079
	bpl	LA1AE
	ldaa	#$07
	bra	LA1B0
;
LA1AE:
	ldaa	#$0F
LA1B0:
	sba
	staa	X0068
	ldaa	$03,x
	staa	X006C
	ldaa	$01,x
	staa	X006B
	ldx	X0071
	ldaa	X0057
	ldab	X0058
	subb	$01,x
	sbca	$00,x
	bcs	LA1E5
	ldaa	X0079
	bpl	LA1D5
	ldaa	X0057
	ldab	X0058
	subb	$0F,x
	sbca	$0E,x
	bra	LA1DD
;
LA1D5:
	ldaa	X0057
	ldab	X0058
	subb	$1F,x
	sbca	$1E,x
LA1DD:
	bcs	LA1EB
	ldaa	X0079
	oraa	#$20
	staa	X0079
LA1E5:
	ldaa	X0058
	staa	X006B
	staa	X006C
LA1EB:
	ldx	X000F
	stx	X0055
	ldx	X006F
	ldaa	X0079
	bpl	LA1F9
	ldab	#$07
	bra	LA1FB
;
LA1F9:
	ldab	#$0F
LA1FB:
	ldaa	X0056
	suba	$03,x
	ldaa	X0055
	sbca	$02,x
	bcs	LA20A
	inx
	inx
	decb
	bne	LA1FB
LA20A:
	ldaa	X0079
	bpl	LA213
	ldaa	#$07
	sba
	bra	LA217
;
LA213:
	ldaa	#$0F
	sba
	asla
LA217:
	asla
	asla
	asla
	adda	X0068
	staa	X0068
	ldaa	$03,x
	staa	X006A
	ldaa	$01,x
	staa	X0069
	ldx	X006F
	ldaa	X0055
	ldab	X0056
	subb	$01,x
	sbca	$00,x
	bcs	LA250
	ldaa	X0079
	bpl	LA240
	ldaa	X0055
	ldab	X0056
	subb	$0F,x
	sbca	$0E,x
	bra	LA248
;
LA240:
	ldaa	X0055
	ldab	X0056
	subb	$1F,x
	sbca	$1E,x
LA248:
	bcs	LA256
	ldaa	X0079
	oraa	#$10
	staa	X0079
LA250:
	ldaa	X0056
	staa	X0069
	staa	X006A
LA256:
	ldaa	X0068
	clrb
	adda	X006E
	staa	X006E
	adcb	X006D
	stab	X006D
	ldx	X006D
	ldaa	X0058
	suba	X006B
	staa	X0076
	beq	LA2C1
	staa	X0059
	clr	X005A
	ldaa	X006C
	suba	X006B
	staa	X005B
	jsr	LA307
	staa	X001C
	ldaa	$01,x
	ldab	$00,x
	cba
	bcs	LA289
	stab	X0075
	sba
	ldab	X001C
	bra	LA290
;
LA289:
	staa	X0075
	sba
	nega
	ldab	X001C
	negb
LA290:
	jsr	LA000
	cli
	adda	X0075
	staa	X0073
	ldaa	X0079
	bpl	LA2A2
	ldaa	$09,x
	ldab	$08,x
	bra	LA2A6
;
LA2A2:
	ldaa	$11,x
	ldab	$10,x
LA2A6:
	cba
	bcs	LA2B0
	stab	X0075
	sba
	ldab	X001C
	bra	LA2B7
;
LA2B0:
	staa	X0075
	sba
	nega
	ldab	X001C
	negb
LA2B7:
	jsr	LA000
	cli
	adda	X0075
	staa	X0074
	bra	LA2D1
;
LA2C1:
	ldaa	$00,x
	staa	X0073
	ldaa	X0079
	bpl	LA2CD
	ldaa	$08,x
	bra	LA2CF
;
LA2CD:
	ldaa	$10,x
LA2CF:
	staa	X0074
LA2D1:
	ldaa	X0056
	suba	X0069
	staa	X0076
	ldaa	X0074
	ldab	X0073
	stab	X0075
	cba
	bcc	LA2F0
	ldaa	X0076
	beq	LA2F0
	ldaa	X006A
	suba	X0056
	staa	X0076
	ldaa	X0073
	ldab	X0074
	stab	X0075
LA2F0:
	sba
	ldab	X0076
	jsr	LA000
	cli
	staa	X0059
	stab	X005A
	ldaa	X006A
	suba	X0069
	staa	X005B
	jsr	LA307
	adda	X0075
	rts
;
LA307:
	ldaa	#$01
	ldab	X005B
	cmpb	#$01
	bls	LA35A
	clr	X005B
	stab	X005C
LA314:
	ldab	X005A
	subb	X005C
	ldab	X0059
	sbcb	X005B
	bcs	LA32B
	inca
	asl	X005C
	rol	X005B
	cmpa	#$09
	bls	LA314
	bra	LA356
;
LA32B:
	staa	X005D
	ldaa	X0059
	ldab	X005A
	clr	X0059
LA334:
	subb	X005C
	sbca	X005B
	bcc	LA341
	addb	X005C
	adca	X005B
	clc
	bra	LA342
;
LA341:
	sec
LA342:
	rol	X0059
	bcs	LA356
	lsr	X005B
	ror	X005C
	dec	X005D
	bne	LA334
	ldaa	X0059
	bra	LA35C
;
LA356:
	ldaa	#$FF
	bra	LA35C
;
LA35A:
	ldaa	X005A
LA35C:
	rts
;
LA35D:
	staa	X0112
	ldaa	#$0A
	staa	X0113
	ldaa	#$20
	staa	X0111
LA36A:
	ldaa	X007F
	anda	#$20
	bne	LA3A0
	ldab	X0124
	bne	LA37A
	ldaa	X0123
	beq	LA3A0
LA37A:
	ldaa	X0125
	ldab	X0126
	subb	X0124
	sbca	X0123
	bcc	LA38E
	negb
	bcc	LA38D
	adda	#$01
LA38D:
	nega
LA38E:
	bne	LA395
	cmpb	X0111
	bcs	LA3A0
LA395:
	inc	X0112
	ldaa	X0112
	cmpa	X0113
	bcs	LA3AA
LA3A0:
	clr	X0112
	ldaa	X0125
	ldab	X0126
	rts
;
LA3AA:
	ldaa	X0123
	ldab	X0124
	rts
;
LA3B1:
	ldaa	X0005
	oraa	#$10
	staa	X0005
	staa	X0099
	ldaa	X0060
	cmpa	#$0B
	beq	LA42F
	cmpa	#$0A
	beq	LA426
	ldx	#$FFFF
LA3C6:
	inx
	dec	X0060
	bne	LA3C6
	ldaa	X0000
	anda	#$C0
	bne	LA428
	ldaa	X007F
	anda	#$20
	bne	LA3DE
	ldaa	X0047
	bita	#$20
	bne	LA428
LA3DE:
	ldaa	X001D
	adda	#$01
	staa	X001D
	bcs	LA422
	cmpa	#$80
	beq	LA41E
	bita	#$01
	bne	LA416
	bita	#$02
	bne	LA412
	bita	#$04
	bne	LA40E
	bita	#$08
	bne	LA40A
	bita	#$10
	bne	LA406
	bita	#$20
	bne	LA41A
	ldaa	#$05
	bra	LA479
;
LA406:
	ldaa	#$04
	bra	LA479
;
LA40A:
	ldaa	#$02
	bra	LA479
;
LA40E:
	ldaa	#$01
	bra	LA479
;
LA412:
	ldaa	#$06
	bra	LA479
;
LA416:
	ldaa	#$07
	bra	LA479
;
LA41A:
	ldaa	#$03
	bra	LA479
;
LA41E:
	ldaa	#$0B
	bra	LA479
;
LA422:
	ldaa	#$0A
	bra	LA479
LA426:
	bra	LA452
;
LA428:
	cpx	#$0001
	beq	LA40E
	bra	LA41E
;
LA42F:
	ldab	X0000
	andb	#$C0
	bne	LA44B
	ldaa	X007F
	anda	#$20
	bne	LA441
	ldaa	X0047
	bita	#$20
	bne	LA44B
LA441:
	inc	X001D
	ldab	#$07
	stab	X0060
	jmp	LA532
;
LA44B:
	ldab	#$0A
	stab	X0060
	jmp	LA532
;
LA452:
	ldab	X0000
	andb	#$C0
	bne	LA46E
	ldaa	X007F
	anda	#$20
	bne	LA464
	ldaa	X0047
	bita	#$20
	bne	LA46E
LA464:
	inc	X001D
	ldab	#$07
	stab	X0060
	jmp	LA4F7
;
LA46E:
	ldab	#$08
	stab	X001D
	ldab	#$02
	stab	X0060
	jmp	LA4F7
;
LA479:
	staa	X0060
	ldaa	X0061
	ldab	X0062
	subb	X0064
	sbca	X0063
	bcc	LA488
	clrb
	bra	LA49D
;
LA488:
	staa	X0028
	stab	X0029
	ldaa	X007D
	ldab	X007E
	jsr	SRA025
	ldaa	X0028
	ldab	X0029
	anda	#$FF
	beq	LA49D
	ldab	#$FF
LA49D:
	cpx	#$0000
	beq	LA4B6
	cpx	#$0001
	bne	LA4E8
	ldaa	#$0A
	staa	X0113
	ldaa	#$08
	staa	X0111
	ldaa	X012A
	bra	LA4C3
;
LA4B6:
	ldaa	#$0A
	staa	X0113
	ldaa	#$4B
	staa	X0111
	ldaa	X012B
LA4C3:
	staa	X0112
	clra
	staa	X0123
	staa	X0125
	stab	X0126
	ldab	$06,x
	stab	X0124
	jsr	LA36A
	ldaa	X0112
	cpx	#$0000
	beq	LA4E5
	staa	X012A
	bra	LA4E8
;
LA4E5:
	staa	X012B
LA4E8:
	stab	$06,x
LA4EA:
	ldaa	X0007
	ldx	#$BB30
	jsr	LA145
	staa	X0004
	jmp	LAFAE
;
LA4F7:
	ldx	X0063
	stx	X0123
	ldx	X0061
	stx	X0125
	ldaa	X0127
	jsr	LA35D
	staa	X0063
	stab	X0064
	ldaa	X0112
	staa	X0127
	ldaa	X0065
	ldab	X0066
	subb	X0064
	sbca	X0063
	jsr	LA091
	staa	X007D
	stab	X007E
	ldaa	X0025
	bne	LA528
	ldaa	X0026
	beq	LA4EA
LA528:
	ldaa	X0000
	bpl	LA530
	oraa	#$C0
	staa	X0000
LA530:
	bra	LA4EA
;
LA532:
	ldx	X0065
	stx	X0123
	ldx	X0061
	stx	X0125
	ldaa	X0128
	jsr	LA35D
	staa	X0065
	stab	X0066
	ldaa	X0112
	staa	X0128
	bra	LA4EA
;
LA54E:
	ldaa	X001E
	cmpa	#$03
	beq	LA583
	cmpa	#$02
	beq	LA57C
	ldaa	X0000
	anda	#$C0
	bne	LA574
	ldaa	X0047
	bita	#$20
	bne	LA574
	ldaa	X0027
	adda	#$01
	staa	X0027
	bcs	LA578
	cmpa	#$80
	beq	LA574
	ldaa	#$01
	bra	LA59D
;
LA574:
	ldaa	#$03
	bra	LA59D
;
LA578:
	ldaa	#$02
	bra	LA59D
;
LA57C:
	ldaa	#$01
	staa	X001E
	jmp	LA5C7
;
LA583:
	ldab	X0000
	andb	#$C0
	bne	LA596
	ldab	X0047
	bitb	#$20
	bne	LA596
	ldab	#$01
	stab	X001E
	jmp	LA602
;
LA596:
	ldab	#$02
	stab	X001E
	jmp	LA602
;
LA59D:
	staa	X001E
	ldaa	X001F
	ldab	X0020
	subb	X0022
	sbca	X0021
	bcs	LA5C4
	staa	X0028
	stab	X0029
	ldaa	X0025
	ldab	X0026
	jsr	SRA025
	ldaa	X0028
	ldab	X0029
	cmpa	#$03
	bls	LA5C0
	ldaa	#$03
	ldab	#$FF
LA5C0:
	staa	X0011
	stab	X0012
LA5C4:
	jmp	LA814
;
LA5C7:
	ldx	X0021
	stx	X0123
	ldx	X001F
	stx	X0125
	ldaa	X012C
	jsr	LA35D
	staa	X0021
	stab	X0022
	ldaa	X0112
	staa	X012C
	ldaa	X0023
	ldab	X0024
	subb	X0022
	sbca	X0021
	jsr	LA091
	staa	X0025
	stab	X0026
	ldaa	X007D
	bne	LA5F8
	ldaa	X007E
	beq	LA5C4
LA5F8:
	ldaa	X0000
	bpl	LA600
	oraa	#$C0
	staa	X0000
LA600:
	bra	LA5C4
;
LA602:
	ldx	X0023
	stx	X0123
	ldx	X001F
	stx	X0125
	ldaa	X012D
	jsr	LA35D
	staa	X0023
	stab	X0024
	ldaa	X0112
	staa	X012D
	bra	LA5C4
;
LA61E:
	inc	X0001
	ldaa	X0067
	bmi	LA639
	ldaa	X0001
	anda	#$0F
	cmpa	#$03
	bcs	LA645
	ldaa	X0001
	anda	#$F0
	staa	X0001
	ldaa	#$03
	staa	X0081
	bra	LA65B
;
LA639:
	ldaa	X0001
	anda	#$0F
	cmpa	#$06
	bcc	LA651
	cmpa	#$04
	beq	LA649
LA645:
	cmpa	#$02
	bne	LA64F
LA649:
	ldaa	X0000
	oraa	#$20
	staa	X0000
LA64F:
	bra	LA663
;
LA651:
	ldaa	X0001
	anda	#$F0
	staa	X0001
	ldaa	#$06
	staa	X0081
LA65B:
	ldaa	X0017
	staa	X009C
	ldx	X0019
	stx	X0086
LA663:
	jmp	LA78F
;
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	ldab	X009F
	nop
	nop
	stab	X009F
	bitb	#$10
	bne	LA6B9
	jmp	LA6F2
;
LA6B9:
	ldaa	X0060
	staa	X0094
	ldaa	X001E
	staa	X0096
	jsr	LAD05
	ldaa	X0099
	bita	#$80
	bne	LA6E1
	jmp	LBEB0
;
	nop
LA6CE:
	cmpa	#$FF
	bcs	LA6DC
	ldaa	#$01
	staa	X0081
	ldaa	X0001
	oraa	#$80
	staa	X0001
LA6DC:
	clr	X007C
	bra	LA6F2
;
LA6E1:
	ldaa	X007C
	bpl	LA6EE
	cmpa	#$FF
	bcc	LA6F2
	inc	X007C
	bra	LA6F2
;
LA6EE:
	ldaa	#$80
	staa	X007C
LA6F2:
	bitb	#$80
	bne	LA6F9
	jmp	LA78F
;
LA6F9:
	ldaa	X0099
	anda	#$0E
	staa	X0120
	bita	#$02
	bne	LA70C
	inc	X0121
	bne	LA70C
	dec	X0121
LA70C:
	ldaa	X0131
	pshb
	clrb
	stab	X0088
	staa	X0089
	pulb
	staa	X0132
	ldaa	X0000
	anda	#$FC
	staa	X0000
	ldaa	X0001
	bmi	LA74F
	bita	#$20
	bne	LA72D
	oraa	#$20
	staa	X0001
	bra	LA743
;
LA72D:
	bita	#$10
	bne	LA743
	oraa	#$10
	staa	X0001
	ldaa	X007F
	anda	#$40
	bne	LA73F
	ldaa	#$03
	bra	LA741
;
LA73F:
	ldaa	#$0B
LA741:
	staa	X009D
LA743:
	ldaa	X0000
	bita	#$40
	beq	LA757
	anda	#$3F
	staa	X0000
	bra	LA757
;
LA74F:
	ldaa	X0001
	anda	#$78
	oraa	#$02
	staa	X0001
LA757:
	jmp	LA61E
;
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
LA78F:
	bitb	#$20
	beq	LA7A3
	ldaa	X0000
	anda	#$18
	bne	LA7A3
	ldx	X0096
	stx	X001F
	ldaa	X0000
	oraa	#$10
	staa	X0000
LA7A3:
	bitb	#$40
	beq	LA7B7
	ldaa	X0000
	anda	#$04
	bne	LA7B7
	ldx	X0094
	stx	X0061
	ldaa	X0000
	oraa	#$04
	staa	X0000
LA7B7:
	ldaa	X0000
	bmi	LA7D1
	bitb	#$08
	beq	LA7D1
	tab
	anda	#$03
	cmpa	#$03
	bne	LA7CD
	sei
	clr	X007F
	jmp	LA84C
;
LA7CD:
	addb	#$01
	stab	X0000
LA7D1:
	ldaa	X0001
	bita	#$40
	beq	LA7D8
	rti
;
LA7D8:
	ldaa	X0000
	bita	#$20
	bne	LA7EB
	ldaa	X0000
	bita	#$18
	bne	LA804
	ldaa	X0000
	bita	#$04
	bne	LA82A
	rti
;
LA7EB:
	ldaa	X0001
	oraa	#$40
	staa	X0001
	cli
	jmp	LB796
;
LA7F5:
	sei
	ldaa	X0000
	anda	#$DF
	staa	X0000
	ldaa	X0001
	anda	#$BF
	staa	X0001
	bra	LA7D8
;
LA804:
	ldaa	X0001
	oraa	#$40
	staa	X0001
	ldaa	X0000
	oraa	#$18
	staa	X0000
	cli
	jmp	LA54E
;
LA814:
	ldaa	X0000
	bmi	LA81B
	jmp	LB1F9
;
LA81B:
	sei
	ldaa	X0000
	anda	#$E7
	staa	X0000
	ldaa	X0001
	anda	#$BF
	staa	X0001
	bra	LA7D8
;
LA82A:
	ldaa	X0001
	oraa	#$40
	staa	X0001
	cli
	jmp	LA3B1
;
LA834:
	sei
	ldaa	X0000
	anda	#$FB
	staa	X0000
	ldaa	X0001
	anda	#$BF
	staa	X0001
	bra	LA7D8
;
	ldaa	#$80
	staa	X0000
	ldx	#$007F
	bra	LA852
;
LA84C:
	clr	X0000
	ldx	#$007E
LA852:
	clra
LA853:
	staa	$00,x
	dex
	bne	LA853
	ldx	#$017F
LA85B:
	staa	$00,x
	dex
	cpx	#$00FF
	bne	LA85B
	lds	#$017F
	ldaa	X0000
	bpl	LA86E
	ldaa	#$01
	bra	LA870
;
LA86E:
	ldaa	#$00
LA870:
	staa	X0099
	staa	X0005
	ldaa	#$80
	staa	X0000
	clra
	staa	X0045
	staa	X0048
	staa	X0014
	ldaa	#$47
	ldab	#$64
	staa	X0046
	staa	X0049
	stab	X0013
	ldaa	XBF6F
	staa	X004B
	ldaa	#$04
	staa	X0080
	ldaa	#$01
	staa	X0081
	ldaa	#$02
	staa	X0001
	ldx	#$000A
	stx	X0082
	ldx	#$00F4
	stx	X0084
	ldx	#$0036
	stx	X0088
	ldx	#$0060
	stx	X008A
	ldaa	#$C8
	staa	X008C
	staa	X008D
	staa	X008E
	clr	X008F
	ldx	#$02B2
	stx	X0092
	ldx	#$0068
	stx	X0090
	ldaa	ByteBFF7
	lsra
	bcs	LA8CD
	ldaa	#$59
	bra	LA8CF
;
LA8CD:
	ldaa	#$51
LA8CF:
	staa	X0098
	ldaa	#$0B
	staa	X0060
	ldaa	#$03
	staa	X001E
	ldaa	#$36
	staa	X0131
	com	X0115
	ldaa	#$AF
	staa	X0006
	ldaa	#$B0
	staa	X0008
	ldaa	#$58
	staa	X0009
	ldaa	#$18
	staa	X0041
	ldaa	#$F8
	staa	X009E
LA8F5:
	ldaa	X009F
	nop
	nop
	staa	X009F
	bita	#$04
	beq	LA8F5
	ldaa	#$09
	staa	X009D
	cli
LA904:
	ldaa	X0116
	cmpa	#$32
	bcs	LA913
	ldaa	X0005
	anda	#$FE
	staa	X0005
	staa	X0099
LA913:
	ldaa	X0000
	bpl	LA94C
	ldaa	X0007
	bne	LA91F
	clra
	clrb
	bra	LA92B
;
LA91F:
	ldx	#$BE20
	jsr	LA145
	ldab	#$04
	jsr	LA000
	cli
LA92B:
	staa	X003E
	stab	X003F
	sei
	ldaa	#$05
	staa	X0017
	staa	X009C
	ldx	X003E
	stx	X0019
	stx	X0086
	cli
	ldaa	X0005
	anda	#$EF
	staa	X0005
	staa	X0099
	ldaa	X007F
	bpl	LA904
	jmp	LADF8
;
LA94C:
	ldaa	X0004
	cmpa	XBF7C
	bhi	LA95E
	cmpa	XBF7B
	bls	LA95E
	ldab	X0047
	bitb	#$20
	beq	LA961
LA95E:
	jmp	LA9CA
;
LA961:
	bitb	#$80
	beq	LA975
	clr	X010E
	ldaa	X010F
	oraa	#$01
	staa	X010F
	ldaa	#$C6
	jmp	LAA83
;
LA975:
	ldx	X003A
	stx	X0057
	ldx	X000F
	stx	X0055
	ldab	X0079
	andb	#$0F
	orab	#$C0
	stab	X0079
	ldx	#$BFC0
	stx	X006F
	ldx	#$BF30
	stx	X0071
	ldx	#$BEF0
	stx	X006D
	ldx	X0071
	ldaa	X0057
	cmpa	$10,x
	bls	LA9CA
	cmpa	$11,x
	bcc	LA9CA
	ldx	X006F
	ldaa	X0055
	ldab	X0056
	subb	$11,x
	sbca	$10,x
	bcs	LA9CA
	ldaa	X0055
	ldab	X0056
	subb	$13,x
	sbca	$12,x
	bcc	LA9CA
	jsr	LA180
	staa	X005E
	ldab	X006C
	cmpb	X006B
	beq	LA9CE
	ldab	X006A
	cmpb	X0069
	beq	LA9FC
LA9C7:
	jmp	LAA38
;
LA9CA:
	ldaa	#$C6
	bra	LA9C7
;
LA9CE:
	ldx	X0071
	ldaa	X0079
	bita	#$20
	bne	LA9E8
	ldaa	$10,x
	clrb
	jsr	Divide64ShiftAB
	stab	X006B
	ldaa	$01,x
	staa	X006C
	suba	X0058
	staa	X0059
	bra	LAA20
;
LA9E8:
	ldaa	$11,x
	clrb
	jsr	Divide64ShiftAB
	stab	X006C
	ldaa	$0F,x
	staa	X006B
	ldaa	X0058
	suba	X006B
	staa	X0059
	bra	LAA20
;
LA9FC:
	ldx	X006F
	ldaa	X0079
	bita	#$10
	bne	LAA12
	ldaa	$11,x
	staa	X006B
	ldaa	$01,x
	staa	X006C
	suba	X0056
	staa	X0059
	bra	LAA20
;
LAA12:
	ldaa	$0F,x
	staa	X006B
	ldaa	$13,x
	staa	X006C
	ldaa	X0056
	suba	X006B
	staa	X0059
LAA20:
	clr	X005A
	ldaa	X006C
	suba	X006B
	staa	X005B
	jsr	LA307
	ldab	#$C8
	subb	X005E
	jsr	LA000
	cli
	adda	X005E
	staa	X005E
LAA38:
	cmpa	#$BE
	bcc	LAA56
	cmpa	#$14
	bls	LAA56
	ldab	#$37
	ldaa	#$A2
	suba	X0006
	bcc	LAA50
	nega
	jsr	LA000
	cli
	nega
	bra	LAA54
;
LAA50:
	jsr	LA000
	cli
LAA54:
	adda	X005E
LAA56:
	cmpa	#$C6
	bcs	LAA5C
	ldaa	#$C6
LAA5C:
	cmpa	#$02
	bcc	LAA62
	ldaa	#$02
LAA62:
	ldab	X010F
	lsrb
	bcc	LAA83
	ldab	X010E
	cmpb	XBF7D
	bcc	LAA7B
	ldab	X000D
	cmpb	#$04
	bcs	LAA7B
	ldaa	XBF7E
	bra	LAA83
;
LAA7B:
	ldab	X010F
	andb	#$FE
	stab	X010F
LAA83:
	staa	X008D
	sei
	ldaa	X0005
	anda	#$EF
	staa	X0005
	staa	X0099
	cli
	ldaa	X007F
	anda	#$20
	beq	LAA98
	jmp	LB9DE
;
LAA98:
	ldaa	X010F
	ldab	X0047
	bitb	#$40
	beq	LAAED
	ldab	X0047
	bpl	LAABE
	bita	#$40
	beq	LAAB5
	ldab	X0129
	bpl	LAABA
	ldab	#$C8
	stab	X0129
	bra	LAABA
;
LAAB5:
	clr	X0129
	oraa	#$40
LAABA:
	anda	#$7F
	bra	LAAE2
;
LAABE:
	bita	#$40
	beq	LAAD4
	anda	#$BF
	ldab	X0129
	cmpb	#$64
	bcc	LAACF
	oraa	#$80
	bra	LAAD1
;
LAACF:
	anda	#$7F
LAAD1:
	clr	X0129
LAAD4:
	bita	#$80
	beq	LAAE2
	ldab	X0129
	cmpb	XBF7F
	bcs	LAAE2
	anda	#$7F
LAAE2:
	ldab	X000F
	beq	LAAE8
	anda	#$7F
LAAE8:
	staa	X010F
	bra	LAB1A
;
LAAED:
	bitb	#$08
	beq	LAB16
	ldab	X000D
	cmpb	#$17
	bcc	LAB16
	bita	#$04
	bne	LAB04
	clr	X0129
	oraa	#$04
LAB00:
	oraa	#$80
	bra	LAAE8
;
LAB04:
	ldab	X0129
	cmpb	XBF7F
	bcs	LAB00
	ldab	XBF7F
	stab	X0129
	anda	#$7F
	bra	LAAE8
;
LAB16:
	anda	#$7B
	bra	LAAE8
;
LAB1A:
	ldx	X003A
	stx	X0057
	ldx	X000F
	stx	X0055
	ldaa	X0079
	anda	#$7F
	staa	X0079
	ldx	#$BD00
	stx	X006D
	ldx	#$BBA0
	stx	X006F
	ldx	#$BB80
	stx	X0071
	jsr	LA180
	ldab	X010F
	bitb	#$08
	beq	LAB4A
	cmpa	#$01
	bcc	LAB4E
LAB45:
	andb	#$F7
	clra
	bra	LAB54
;
LAB4A:
	cmpa	#$02
	bcs	LAB45
LAB4E:
	orab	#$08
	bitb	#$80
	bne	LAB45
LAB54:
	staa	X004A
	stab	X010F
	ldx	X000F
	stx	X0055
	ldab	X0047
	bitb	#$20
	beq	LAB8B
	ldaa	X0007
	cmpa	#$A0
	bcc	LAB6B
	ldaa	#$A0
LAB6B:
	ldx	#$BFC0
	jsr	LA145
	ldab	X0055
	bne	LAB83
	ldab	X0056
	cmpb	#$08
	bcc	LAB83
	jsr	LA000
	cli
	jsr	Divide8ShiftAB
	tba
LAB83:
	staa	X0018
	clr	X0036
	jmp	LAC89
;
LAB8B:
	bitb	#$80
	beq	LABB9
	ldab	X0004
	ldaa	X0055
	beq	LAB99
	ldaa	#$F0
	bra	LAB9B
;
LAB99:
	ldaa	X0056
LAB9B:
	cmpb	TempSwitchCold
	bcc	LABAE
	ldx	#$BFE0
	jsr	LA13A
	adda	IgnIdleValue
	adda	IgnColdAdder
	bra	LAB83
;
LABAE:
	ldx	#$BFE0
	jsr	LA13A
	adda	IgnIdleValue
	bra	LAB83
;
LABB9:
	ldaa	X0055
	ldab	X0056
	cmpa	XBF8B
	bhi	LABC9
	bne	LABD7
	cmpb	XBF8C
	bcs	LABD7
LABC9:
	cmpa	XBF8D
	bhi	LAC0D
	bne	LABF2
	cmpb	XBF8E
	bcc	LAC0D
	bra	LABF2
;
LABD7:
	ldaa	X003A
	cmpa	XBF89
	bcc	LABE3
	ldaa	XBF8F
	bra	LAC26
;
LABE3:
	cmpa	XBF8A
	bcc	LABED
	ldaa	XBF90
	bra	LAC26
;
LABED:
	ldaa	XBF91
	bra	LAC26
;
LABF2:
	ldaa	X003A
	cmpa	XBF89
	bcc	LABFE
	ldaa	XBF92
	bra	LAC26
;
LABFE:
	cmpa	XBF8A
	bcc	LAC08
	ldaa	XBF93
	bra	LAC26
;
LAC08:
	ldaa	XBF94
	bra	LAC26
;
LAC0D:
	ldaa	X003A
	cmpa	XBF89
	bcc	LAC19
	ldaa	XBF95
	bra	LAC26
;
LAC19:
	cmpa	XBF8A
	bcc	LAC23
	ldaa	XBF96
	bra	LAC26
;
LAC23:
	ldaa	XBF97
LAC26:
	staa	X0036
	ldab	X0004
	cmpb	XBF83
	bcc	LAC60
	cmpb	TempSwitchCold
	bcs	LAC60
	ldab	X003A
	cmpb	XBF84
	bcc	LAC60
	ldaa	X0055
	cmpa	XBF85
	beq	LAC59
	bcc	LAC60
	ldaa	X0055
	beq	LAC4C
	ldaa	#$F0
	bra	LAC4E
;
LAC4C:
	ldaa	X0056
LAC4E:
	ldx	#$BFE0
	jsr	LA13A
	adda	XBF81
	bra	LAC87
;
LAC59:
	ldaa	X0056
	cmpa	XBF86
	bcs	LAC4E
LAC60:
	ldx	X010B
	stx	X0057
	ldaa	X0079
	anda	#$7F
	staa	X0079
	ldx	#$BC00
	stx	X006D
	ldx	#$BBE0
	stx	X006F
	ldx	#$BBC0
	stx	X0071
	jsr	LA180
	ldab	X0004
	cmpb	TempSwitchCold
	bcc	LAC87
	adda	IgnColdAdder
LAC87:
	staa	X0018
LAC89:
	ldaa	X0006
	ldx	#$BB50
	jsr	LA13A
	psha
	ldaa	X0055
	ldab	X0056
	lsra
	rorb
	tsta
	beq	LAC9D
	ldab	#$FF
LAC9D:
	tba
	ldx	#$BFB0
	jsr	LA13A
	pulb
	jsr	LA000
	cli
	aslb
	rola
	bcs	LACC4
	adda	XBF87
	bcs	LACC4
	ldab	#$05
	addb	XBF87
	cba
	bcs	LACBF
	cmpa	#$60
	bhi	LACC4
	tab
LACBF:
	ldaa	#$78
	sba
	bra	LACC6
;
LACC4:
	ldaa	#$18
LACC6:
	clrb
	sei
	stab	X008A
	staa	X008B
	cli
	ldaa	X0047
	bita	#$20
	bne	LACF1
	ldaa	X0004
	cmpa	XBF98
	bhi	LACF1
	cmpa	XBF99
	bcs	LACF1
	ldaa	X000F
	bne	LACF1
	ldaa	X003A
	cmpa	XBF9A
	bcc	LACF1
	sei
	ldaa	X0005
	oraa	#$40
	bra	LACF6
;
LACF1:
	sei
	ldaa	X0005
	anda	#$BF
LACF6:
	staa	X0005
	staa	X0099
	cli
	ldaa	X007F
	bpl	LAD02
	jmp	LAE9A
LAD02:
	jmp	LA94C
;
LAD05:
	inc	X0129
	inc	X010E
	tst	X0122
	beq	LAD13
	dec	X0122
LAD13:
	ldaa	X004E
	adda	#$01
	daa
	staa	X004E
	bita	#$0F
	bne	LAD69
	bita	#$FF
	bne	LAD23
	nop
LAD23:
	inc	X0115
	bne	LAD2B
	com	X0115
LAD2B:
	inc	X0116
	bne	LAD33
	com	X0116
LAD33:
	inc	X004D
	bne	LAD3B
	com	X004D
LAD3B:
	pshb
	ldaa	X012E
	ldab	X012F
	addb	XBF9F
	adca	XBF9E
	staa	X012E
	stab	X012F
	pulb
	ldaa	X0004
	cmpa	XBF9D
	bcs	LAD62
	ldaa	X0078
	suba	XBF9B
LAD5B:
	bcc	LAD5E
	clra
LAD5E:
	staa	X0078
	bra	LAD69
;
LAD62:
	ldaa	X0078
	suba	XBF9C
	bra	LAD5B
;
LAD69:
	pshb
	jmp	LAF77
;
LAD6D:
	clr	X0121
	ldaa	X0120
	bita	#$04
	bne	LAD8C
	ldaa	X000F
	bne	LAD81
	ldaa	X0010
	cmpa	#$A0
	bcs	LAD8C
LAD81:
	ldaa	XBFA3
	staa	X012E
	clr	X012F
	bra	LADA6
;
LAD8C:
	tstb
	beq	LADA6
	decb
	pshb
	ldaa	X012E
	ldab	X012F
	subb	XBFA1
	sbca	UnknownData
	staa	X012E
	stab	X012F
	pulb
	bra	LAD8C
;
LADA6:
	tst	X012E
	bmi	LADB1
	clr	X012E
	clr	X012F
LADB1:
	ldab	X0036
	negb
	cmpb	X012E
	ble	LADBF
	stab	X012E
	clr	X012F
LADBF:
	ldab	X0018
	addb	X012E
	cmpb	#$42
	bcs	LADCA
	ldab	#$42
LADCA:
	ldaa	#$42
	sba
	ldab	X0132
	subb	XBF87
	bcc	LADD6
	clrb
LADD6:
	cba
	bcc	LADDE
	stab	X0131
	bra	LADEF
;
LADDE:
	ldab	X0132
	addb	XBFA2
	cba
	bcs	LADEC
	stab	X0131
	bra	LADEF
;
LADEC:
	staa	X0131
LADEF:
	ldaa	X012E
	adda	#$19
	psha
	pula
	pulb
	rts
;
LADF8:
	ldaa	X0000
	anda	#$3C
	staa	X0000
	clrb
	ldaa	#$20
	stab	X008A
	staa	X008B
	ldaa	X0099
	anda	#$20
	beq	LAE0C
LAE0B:
	swi
LAE0C:
	ldaa	X007F
	anda	#$BF
	staa	X007F
	bita	#$20
	bne	LAE0B
	anda	#$1F
	ldab	X0005
	cmpa	#$02
	beq	LAE20
	andb	#$EE
LAE20:
	andb	#$EF
	stab	X0005
	stab	X0099
	cmpa	#$03
	bne	LAE38
	ldaa	#$C0
	ldab	#$10
	jsr	LAF20
	staa	X008D
	clr	X008F
	bra	LAE84
;
LAE38:
	clr	X008D
	cmpa	#$04
	bne	LAE41
	bra	LAE84
;
LAE41:
	clr	X008F
	cmpa	#$02
	bne	LAE56
	tba
	oraa	#$01
	andb	#$FE
	jsr	LAF20
	staa	X0005
	staa	X0099
	bra	LAE84
;
LAE56:
	cmpa	#$06
	bne	LAE6B
	ldx	#$0006
	stx	X011A
	ldx	#$BB10
	stx	X0118
	jsr	LAF36
	bra	LAE84
;
LAE6B:
	ldab	#$03
	cmpa	#$01
	bls	LAE94
	cmpa	#$10
	bne	LAE84
	ldx	#$0011
	stx	X011A
	ldx	#$BB12
	stx	X0118
	jsr	LAF48
LAE84:
	ldaa	X000F
	oraa	X0010
	bne	LAE99
	ldaa	X007F
	ldab	#$01
	bita	#$40
	beq	LAE94
	ldab	#$09
LAE94:
	stab	X009D
	jmp	LADF8
;
LAE99:
	swi
LAE9A:
	ldaa	X007F
	tab
	andb	#$1F
	cmpb	#$05
	beq	LAEA8
	tab
	andb	#$BF
	stab	X007F
LAEA8:
	bita	#$40
	bne	LAEB0
	ldab	#$03
	bra	LAEB2
;
LAEB0:
	ldab	#$0B
LAEB2:
	stab	X009D
	anda	#$1F
	cmpa	#$05
	bcs	LAF0B
	bne	LAECB
	ldaa	X007F
	ldab	X0120
	bitb	#$02
	bne	LAEC7
	oraa	#$40
LAEC7:
	staa	X007F
	bra	LAF08
;
LAECB:
	ldx	#$BB16
	tab
	subb	#$06
	aslb
	sei
	stx	X0053
	addb	X0054
	stab	X0054
	ldab	#$00
	adcb	X0053
	stab	X0053
	cli
	ldx	X0053
	stx	X0118
	staa	X011B
	clr	X011A
	cmpa	#$0F
	bcs	LAF05
	beq	LAF00
	ldx	X011A
	inx
	stx	X011A
	ldx	X0118
	inx
	inx
	stx	X0118
LAF00:
	jsr	LAF48
	bra	LAF08
;
LAF05:
	jsr	LAF36
LAF08:
	jmp	LA94C
;
LAF0B:
	cmpa	#$03
	bhi	LAF08
	bcs	LAF1B
	ldaa	#$B0
	ldab	#$20
	jsr	LAF20
	jmp	LAA83
;
LAF1B:
	clr	X007F
	bra	LAF08
;
LAF20:
	psha
	pshb
	ldaa	X0130
	bne	LAF2C
	ldab	#$FF
	stab	X0130
LAF2C:
	cmpa	#$80
	bcs	LAF33
	pulb
	pula
	rts
;
LAF33:
	pula
	pulb
	rts
;
LAF36:
	ldx	X011A
	ldaa	$00,x
	ldx	X0118
	cmpa	$00,x
	bcs	LAF70
	cmpa	$01,x
	bhi	LAF70
	bra	LAF6A
;
LAF48:
	ldx	X011A
	ldaa	$00,x
	ldab	$01,x
	ldx	X0118
	cmpa	$00,x
	beq	LAF5A
	bcc	LAF5E
	bra	LAF70
;
LAF5A:
	cmpb	$01,x
	bcs	LAF70
LAF5E:
	cmpa	$02,x
	beq	LAF66
	bcs	LAF6A
	bra	LAF70
;
LAF66:
	cmpb	$03,x
	bhi	LAF70
LAF6A:
	ldaa	X007F
	oraa	#$40
	bra	LAF74
;
LAF70:
	ldaa	X007F
	anda	#$BF
LAF74:
	staa	X007F
	rts
;
LAF77:
	dec	X0130
	ldaa	X007F
	cmpa	#$85
	beq	LAF8A
	cmpa	#$C5
	beq	LAF8A
LAF84:
	ldab	X0121
	jmp	LAD6D
;
LAF8A:
	ldaa	X0047
	bita	#$80
	beq	LAF9A
	ldaa	#$C7
	staa	X0130
LAF95:
	inc	X0130
	bra	LAF84
;
LAF9A:
	ldaa	X0130
	beq	LAF95
	ldab	#$0A
	stab	X012E
	ldaa	#$42
	addb	X0018
	sba
	staa	X0131
	pulb
	rts
;
LAFAE:
	ldaa	X007F
	bpl	LAFD9
	bita	#$20
	bne	LAFD9
	anda	#$E0
	ldab	X000A
	subb	#$08
LAFBC:
	bls	LAFC3
	inca
	subb	#$0F
	bra	LAFBC
;
LAFC3:
	staa	X007F
	cmpa	#$84
	beq	LAFCF
	cmpa	#$C4
	beq	LAFCF
	bra	LAFD9
;
LAFCF:
	ldaa	#$B0
	ldab	#$20
	jsr	LAF20
	jmp	LB1EF
;
LAFD9:
	ldx	X000F
	bne	LAFE0
	jmp	LA834
;
LAFE0:
	ldab	X0047
	inc	X0050
	bne	LAFEA
	inc	X004F
LAFEA:
	ldaa	X004F
	bmi	LAFFD
	bitb	#$20
	bne	LB005
	ldaa	X0006
	cmpa	#$96
	bhi	LB005
	inc	X004F
	bra	LB008
;
LAFFD:
	cmpa	#$F5
	bhi	LB005
	orab	#$02
	bra	LB00B
;
LB005:
	clr	X004F
LB008:
	clr	X0050
LB00B:
	stab	X0047
	ldaa	X0007
	ldx	#$BEA0
	jsr	LA13A
	ldab	X0047
	bitb	#$40
	bne	LB031
	bitb	#$04
	bne	LB029
	cmpa	XBF54
	bcs	LB031
	ldaa	XBF54
	bra	LB031
;
LB029:
	cmpa	XBF55
	bcc	LB031
	ldaa	XBF55
LB031:
	bitb	#$10
	beq	LB04F
	bitb	#$40
	bne	LB047
	bitb	#$04
	bne	LB047
	cmpa	XBF56
	bcc	LB04F
	ldaa	XBF56
	bra	LB04F
;
LB047:
	cmpa	XBF57
	bcc	LB04F
	ldaa	XBF57
LB04F:
	bitb	#$02
	beq	LB059
	cmpa	#$40
	bcc	LB059
	ldaa	#$40
LB059:
	ldab	X0047
	bitb	#$01
	bne	LB06A
	ldab	X000A
	andb	#$E0
	lsrb
	lsrb
	lsrb
	lsrb
	aba
	bra	LB074
;
LB06A:
	ldab	X0120
	bitb	#$08
	bne	LB07C
	adda	XBF65
LB074:
	bcs	LB07A
	cmpa	#$70
	bcs	LB07C
LB07A:
	ldaa	#$70
LB07C:
	staa	X0015
	ldaa	X007B
	adda	#$80
	staa	X007B
	ldab	X0047
	bitb	#$20
	bne	LB098
	ldaa	X0004
	cmpa	XBF63
	bcs	LB09B
	ldaa	X0115
	cmpa	#$64
	bcc	LB09B
LB098:
	jmp	LB189
;
LB09B:
	bitb	#$40
	bne	LB0A8
	bitb	#$04
	bne	LB0A8
	ldaa	XBF58
	bra	LB0A9
;
LB0A8:
	clra
LB0A9:
	staa	X0051
	ldaa	X000F
	beq	LB0B3
	ldaa	#$FF
	bra	LB0B5
;
LB0B3:
	ldaa	X0010
LB0B5:
	staa	X0052
	ldab	X0047
	bitb	#$80
	bne	LB0CE
LB0BD:
	ldaa	X0052
	ldx	#$BE90
	jsr	LA13A
	staa	X0100
LB0C8:
	clr	X0102
	jmp	LB189
;
LB0CE:
	bitb	#$04
	bne	LB0D9
	ldaa	X000D
	cmpa	XBF64
	bcc	LB0BD
LB0D9:
	ldaa	X0100
	beq	LB100
	ldab	X0101
	beq	LB0E8
	dec	X0101
	bra	LB0F1
;
LB0E8:
	ldaa	XBF5B
	staa	X0101
	dec	X0100
LB0F1:
	ldaa	X0052
	cmpa	X0015
	bcc	LB0C8
LB0F7:
	suba	X0015
	nega
	cmpa	#$02
	bhi	LB10F
	bra	LB0C8
;
LB100:
	ldaa	X0052
	cmpa	X0015
	bls	LB0F7
	suba	X0015
	cmpa	#$02
	bls	LB0C8
	jmp	LB156
;
LB10F:
	lsra
	lsra
	tab
	jsr	LA000
	cli
	tsta
	bne	LB11D
	cmpb	#$40
	bcs	LB11F
LB11D:
	ldab	#$40
LB11F:
	ldaa	XBF67
	jsr	LA000
	cli
	aslb
	rola
	staa	X0102
	ldab	X010D
	bne	LB148
	inc	X007B
	ldaa	X0015
	suba	X0052
	cmpa	#$0C
	bls	LB140
	ldab	XBF5C
	bra	LB143
;
LB140:
	ldab	XBF5D
LB143:
	stab	X010D
	bra	LB14B
;
LB148:
	dec	X010D
LB14B:
	ldab	X007B
	cmpb	#$FF
	bne	LB154
	dec	X007B
LB154:
	bra	LB189
;
LB156:
	clr	X0102
	ldab	X010D
	bne	LB17F
	dec	X007B
	ldaa	X0052
	suba	X0015
	cmpa	#$0C
	bls	LB172
	cmpa	#$18
	bls	LB177
	ldab	XBF5E
	bra	LB17A
;
LB172:
	ldab	XBF60
	bra	LB17A
;
LB177:
	ldab	XBF5F
LB17A:
	stab	X010D
	bra	LB182
;
LB17F:
	dec	X010D
LB182:
	ldab	X007B
	bne	LB189
	inc	X007B
LB189:
	ldaa	X007B
	suba	#$80
	staa	X007B
	bmi	LB1A3
	adda	XBF66
	cmpa	XBF61
	bcs	LB1B3
	ldab	XBF61
	subb	XBF66
	stab	X007B
	bra	LB1B3
;
LB1A3:
	adda	XBF66
	cmpa	XBF62
	bhi	LB1B3
	ldab	XBF62
	subb	XBF66
	stab	X007B
LB1B3:
	ldab	X0047
	bitb	#$80
	bne	LB1D4
	ldaa	X007B
	adda	XBF66
	cmpa	XBF59
	bcc	LB1D4
	ldab	X007A
	bne	LB1D1
	ldab	XBF5A
	stab	X007A
	inc	X007B
	bra	LB1D4
;
LB1D1:
	dec	X007A
LB1D4:
	adda	X0051
	bcs	LB1F4
	adda	X0102
	bcs	LB1F4
	adda	X0100
	bcs	LB1F4
	cmpa	XBF61
	bcc	LB1F4
	cmpa	XBF62
	bcc	LB1EF
	ldaa	XBF62
LB1EF:
	staa	X008F
	jmp	LA834
;
LB1F4:
	ldaa	XBF61
	bra	LB1EF
;
LB1F9:
	ldab	X007F
	bpl	LB211
	andb	#$3F
	cmpb	#$02
	bhi	LB20B
	clra
	staa	X0019
	staa	X001A
	jmp	LA81B
;
LB20B:
	ldaa	X000F
	oraa	X0010
	beq	LB219
LB211:
	ldaa	X0005
	oraa	#$01
	staa	X0005
	staa	X0099
LB219:
	sei
	ldaa	X0090
	ldab	X0091
	cli
	aslb
	rola
	staa	X0028
	stab	X0029
	ldaa	#$80
	ldab	#$35
	jsr	SRA025
	staa	X000F
	stab	X0010
	ldaa	X0099
	anda	#$A0
	ldab	X000B
	cmpb	#$80
	bls	LB242
	oraa	#$10
	cmpb	#$D0
	bhi	LB248
	bra	LB246
;
LB242:
	cmpb	#$40
	bhi	LB248
LB246:
	oraa	#$04
LB248:
	oraa	ByteBFF7
	staa	X0047
	ldaa	X0092
	ldaa	X0093
	staa	X000D
	ldab	XBF42
	jsr	LA000
	cli
	jsr	Divide8ShiftAB
	cmpa	X000F
	bcs	LB271
	bne	LB267
	cmpb	X0010
	bcs	LB271
LB267:
	ldaa	X0047
	bita	#$04
	bne	LB271
	oraa	#$08
	staa	X0047
LB271:
	ldaa	X000D
	cmpa	#$19
	bcs	LB281
	ldaa	X0047
	bita	#$04
	beq	LB281
	oraa	#$10
	staa	X0047
LB281:
	ldab	X0012
	ldaa	X0011
	bne	LB28F
	cmpb	XBF43
	bcc	LB28F
	ldab	XBF43
LB28F:
	staa	X0028
	stab	X0029
	ldaa	X000F
	ldab	X0010
	tsta
	bne	LB2A0
	cmpb	#$10
	bcc	LB2A0
	ldab	#$10
LB2A0:
	jsr	SRA025
	ldaa	X0029
	staa	X002D
	ldaa	X002A
	staa	X002E
	ldaa	X002B
	staa	X002F
	ldaa	KValue
	staa	X0029
	ldaa	XBF45
	staa	X002A
	ldaa	XBF46
	staa	X002B
	ldaa	#$00
	staa	X0028
	staa	X002C
	jsr	LA0E8
	staa	X0028
	stab	X0029
	ldaa	X0008
	ldx	#$BB70
	jsr	LA13A
	clrb
	jsr	SRA025
	ldaa	X0009
	ldx	#$BB60
	jsr	LA13A
	clrb
	jsr	SRA025
	bita	#$C0
	bne	LB34C
	jsr	Multiply8ShiftBA
	psha
	pshb
	ldab	X0047
	ldaa	X0067
	bmi	LB31F
	bitb	#$80
	bne	LB2F8
	bra	LB323
;
LB2F8:
	bita	#$01
	bne	LB326
	oraa	#$01
	staa	X0067
	ldab	X0004
	cmpb	XBFA4
	bcs	LB326
	oraa	#$80
	staa	X0067
LB30B:
	pulb
	pula
	staa	X003A
	stab	X003B
	aslb
	rola
	staa	X0133
	stab	X0134
	ldaa	X003A
	ldab	X003B
	bra	LB32E
;
LB31F:
	bitb	#$80
	bne	LB30B
LB323:
	clr	X0067
LB326:
	pulb
	pula
	staa	X0133
	stab	X0134
LB32E:
	cmpa	XBF47
	bhi	LB340
	bne	LB33A
	cmpb	XBF48
	bcc	LB340
LB33A:
	ldaa	XBF47
	ldab	XBF48
LB340:
	cmpa	XBF49
	bcs	LB352
	bne	LB34C
	cmpb	XBF4A
	bls	LB352
LB34C:
	ldaa	XBF49
	ldab	XBF4A
LB352:
	staa	X003A
	stab	X003B
	ldaa	X0133
	ldab	X0134
	cmpa	XBF47
	bhi	LB36E
	bne	LB368
	cmpb	XBF48
	bcc	LB36E
LB368:
	ldx	XBF47
	stx	X0133
LB36E:
	ldaa	X003A
	ldab	X003B
	jsr	LB728
	ldaa	X000F
	bne	LB3BE
	ldaa	X0010
	cmpa	#$24
	bcc	LB3BE
	ldaa	X0133
	ldab	X0134
	ldx	X0109
	beq	LB3B2
	ldaa	X0109
	ldab	X010A
	jsr	Divide8ShiftAB
	negb
	adca	#$00
	nega
	addb	X010A
	adca	X0109
	staa	X0109
	stab	X010A
	ldaa	X0133
	ldab	X0134
	jsr	Divide8ShiftAB
	addb	X010A
	adca	X0109
LB3B2:
	staa	X0109
	stab	X010A
	staa	X0133
	stab	X0134
LB3BE:
	ldab	XBF4B
	ldaa	#$AF
	suba	X0006
	bcc	LB3CF
	nega
	jsr	LA000
	cli
	nega
	bra	LB3D3
;
LB3CF:
	jsr	LA000
	cli
LB3D3:
	adda	XBF4C
	staa	X003C
	ldaa	#$00
	staa	X0038
	staa	X0039
	ldaa	X0007
	ldx	#$BE00
	jsr	LA145
	staa	X0037
	clrb
	jsr	Divide4ShiftAB
	addb	X0039
	adca	X0038
	staa	X0038
	stab	X0039
	ldaa	X0047
	anda	#$20
	beq	LB408
	ldaa	X0007
	ldx	#$BE40
	jsr	LA13A
	staa	X0034
	ldaa	#$FF
	staa	X0078
LB408:
	ldaa	X0078
	beq	LB41E
	ldab	X0034
	jsr	LA000
	cli
	clrb
	jsr	Divide4ShiftAB
	addb	X0039
	adca	X0038
	staa	X0038
	stab	X0039
LB41E:
	ldaa	X0047
	anda	#$20
	bne	LB427
	jmp	LB4D1
;
LB427:
	ldaa	X0031
	anda	#$01
	bne	LB436
	clr	X0115
	ldaa	X0031
	oraa	#$01
	staa	X0031
LB436:
	ldaa	X0004
	staa	X0110
	ldaa	X0133
	ldab	X0134
	staa	X0028
	stab	X0029
	ldaa	X0038
	ldab	X0039
	jsr	SRA025
	staa	X0028
	stab	X0029
	ldaa	#$82
	ldab	#$00
	jsr	SRA025
	addb	X003C
	adca	#$00
	staa	X003E
	stab	X003F
LB45F:
	ldaa	XBF4D
	adda	#$32
	bcc	LB468
	ldaa	#$FF
LB468:
	cmpa	X0115
	bcc	LB470
	jmp	LB4CE
;
LB470:
	ldaa	X0007
	ldx	#$BE20
	jsr	LA145
	staa	X003D
	ldaa	X000F
	bne	LB495
	ldab	X0010
	cmpb	#$0C
	bls	LB49F
	cmpb	XBF4E
	bcc	LB495
	subb	#$0C
	ldaa	XBF4F
	jsr	LA000
	cli
	negb
	bra	LB497
;
LB495:
	ldab	#$1A
LB497:
	ldaa	X003D
	jsr	LA000
	cli
	staa	X003D
LB49F:
	ldab	X0115
	subb	XBF4D
	bls	LB4AD
	aslb
	negb
	addb	#$64
	bra	LB4AF
;
LB4AD:
	ldab	#$64
LB4AF:
	ldaa	X003D
	jsr	LA000
	cli
	psha
	ldaa	X0067
	bpl	LB4BF
	pula
	aslb
	rola
	bra	LB4C0
;
LB4BF:
	pula
LB4C0:
	cmpa	X003E
	bhi	LB4CA
	bne	LB4CE
	cmpb	X003F
	bls	LB4CE
LB4CA:
	staa	X003E
	stab	X003F
LB4CE:
	jmp	LB65C
;
LB4D1:
	ldab	X0031
	andb	#$FE
	stab	X0031
	bitb	#$80
	bne	LB4F2
	ldaa	X000F
	cmpa	FuelCutRPM
	bcs	LB50F
	bne	LB4EB
	ldaa	X0010
	cmpa	XBF51
	bcs	LB50F
LB4EB:
	orab	#$80
	stab	X0031
LB4EF:
	jmp	LB5D7
;
LB4F2:
	ldaa	XBF51
	suba	#$28
	ldaa	FuelCutRPM
	sbca	#$00
	cmpa	X000F
	bhi	LB50B
	bne	LB4EF
	ldaa	XBF51
	suba	#$28
	cmpa	X0010
	bcs	LB4EF
LB50B:
	andb	#$7F
	stab	X0031
LB50F:
	ldaa	X0047
	bita	#$80
	bne	LB542
	bitb	#$02
	beq	LB530
	andb	#$FD
	stab	X0031
	ldx	#$BE50
	ldaa	X0007
	jsr	LA13A
	staa	X0032
	clr	X0033
	ldaa	#$C8
	staa	X0035
	bra	LB53F
;
LB530:
	ldaa	X0032
	beq	LB53F
	ldab	X0033
	subb	XBF52
	sbca	#$00
	staa	X0032
	stab	X0033
LB53F:
	jmp	LB5BF
;
LB542:
	clr	X0035
	clr	X0032
	clr	X0033
	ldaa	X000D
	cmpa	XBF53
	bcc	LB558
	orab	#$02
	stab	X0031
	bra	LB53F
;
LB558:
	bitb	#$02
	bne	LB58E
	orab	#$02
	stab	X0031
	ldab	X0047
	bitb	#$40
	beq	LB56D
LB566:
	bitb	#$08
	bne	LB56D
LB56A:
	jmp	LB5BF
;
LB56D:
	ldx	#$BE70
	jsr	LB578
	bcs	LB56A
	jmp	LB5CC
;
LB578:
	ldaa	X0007
	jsr	LA13A
LB57D:
	clrb
	asla
	rolb
	cmpb	X000F
	bcs	LB58C
	bne	LB58A
	cmpa	X0010
	bcs	LB58C
LB58A:
	coma
	rts
;
LB58C:
	clra
	rts
;
LB58E:
	bitb	#$0C
	bne	LB5A5
	ldx	#$BE60
	jsr	LB578
	bcs	LB59D
	jmp	LB5CC
;
LB59D:
	ldab	X0047
	bitb	#$40
	bne	LB566
	bra	LB56A
;
LB5A5:
	ldaa	X0047
	bita	#$40
	beq	LB5AF
	bita	#$08
	beq	LB5B8
LB5AF:
	ldx	#$BE80
	bsr	LB578
	bcc	LB5CC
	bra	LB5BF
;
LB5B8:
	ldaa	#$50
	jsr	LB57D
	bcc	LB5CC
LB5BF:
	ldaa	#$3C
	staa	X0122
	ldaa	X0031
	anda	#$F3
	staa	X0031
	bra	LB5DD
;
LB5CC:
	ldaa	X0031
	oraa	#$0C
	staa	X0031
	ldaa	X0122
	bne	LB5DD
LB5D7:
	clra
	ldab	X003C
	jmp	LB4CA
;
LB5DD:
	ldaa	X0032
	beq	LB5ED
	clrb
	jsr	Divide4ShiftAB
	addb	X0039
	adca	X0038
	staa	X0038
	stab	X0039
LB5ED:
	ldaa	X004A
	clrb
	jsr	Divide16ShiftAB
	addb	X0039
	adca	X0038
	staa	X0038
	stab	X0039
	ldab	X000F
	bne	LB60F
	ldab	X0035
	beq	LB60F
	ldaa	X0038
	ldab	X0039
	subb	X0035
	sbca	#$00
	staa	X0038
	stab	X0039
LB60F:
	ldaa	X0038
	cmpa	#$40
	bcs	LB61D
	ldaa	#$40
	ldab	#$00
	staa	X0038
	stab	X0039
LB61D:
	ldaa	X0133
	ldab	X0134
	staa	X0028
	stab	X0029
	ldaa	X0038
	ldab	X0039
	jsr	SRA025
	staa	X0028
	stab	X0029
	ldaa	X0013
	ldab	X0014
	jsr	SRA025
	staa	X003E
	stab	X003F
	ldaa	X0047
	bita	#$01
	bne	LB646
	jsr	LA61E
LB646:
	ldaa	X003E
	ldab	X003F
	addb	X003C
	adca	#$00
	staa	X003E
	stab	X003F
	ldaa	X0110
	cmpa	#$3C
	bcc	LB65C
	jmp	LB45F
;
LB65C:
	ldaa	X003E
	ldab	X003F
	cmpa	#$03
	bcs	LB6A6
	bne	LB66A
	cmpb	#$33
	bls	LB6A6
LB66A:
	cmpa	#$06
	bcs	LB6BA
	bne	LB674
	cmpb	#$66
	bls	LB6BA
LB674:
	cmpa	#$0C
	bcs	LB6C1
	bne	LB67E
	cmpb	#$CC
	bls	LB6C1
LB67E:
	cmpa	#$19
	bcs	LB6C8
	bne	LB688
	cmpb	#$99
	bls	LB6C8
LB688:
	cmpa	#$33
	bcs	LB6CF
	bne	LB692
	cmpb	#$33
	bls	LB6CF
LB692:
	cmpa	#$66
	bcs	LB6D6
	bne	LB69C
	cmpb	#$66
	bls	LB6D6
LB69C:
	ldaa	#$66
	ldab	#$66
	staa	X003E
	stab	X003F
	bra	LB6D6
;
LB6A6:
	staa	X0028
	stab	X0029
	ldaa	#$40
	ldab	#$00
	jsr	SRA025
	addb	X003F
	adca	X003E
	ldx	#$0000
	bra	LB6E8
;
LB6BA:
	ldaa	#$A0
	ldx	#$0001
	bra	LB6DB
;
LB6C1:
	ldaa	#$50
	ldx	#$0002
	bra	LB6DB
;
LB6C8:
	ldaa	#$28
	ldx	#$0003
	bra	LB6DB
;
LB6CF:
	ldaa	#$14
	ldx	#$0004
	bra	LB6DB
;
LB6D6:
	ldaa	#$0A
	ldx	#$0005
LB6DB:
	ldab	#$00
	staa	X0028
	stab	X0029
	ldaa	X003E
	ldab	X003F
	jsr	SRA025
LB6E8:
	sei
	staa	X0019
	stab	X001A
	stx	X0028
	ldaa	X0029
	staa	X0017
	ldx	X0104
	stx	X0106
	cli
	jmp	LA81B
;
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
LB728:
	ldx	X010B
	beq	LB777
	subb	X010C
	sbca	X010B
	bcs	LB754
	jsr	LB77E
	bcc	LB740
LB73A:
	ldaa	X003A
	ldab	X003B
	bra	LB777
;
LB740:
	tsta
	bne	LB749
	cmpb	#$40
	bcc	LB749
	bra	LB73A
;
LB749:
	jsr	Divide64ShiftAB
	addb	X010C
	adca	X010B
	bra	LB777
;
LB754:
	coma
	comb
	addb	#$01
	adca	#$00
	jsr	LB77E
	bcs	LB73A
	tsta
	bne	LB768
	cmpb	#$40
	bcc	LB768
	bra	LB73A
;
LB768:
	jsr	Divide64ShiftAB
	subb	X010C
	sbca	X010B
	coma
	comb
	addb	#$01
	adca	#$00
LB777:
	staa	X010B
	stab	X010C
	rts
;
LB77E:
	pshb
	psha
	ldaa	X000F
	bne	LB790
	ldaa	X0010
	cmpa	XBF68
	bhi	LB790
	ldaa	XBF69
	bra	LB791
;
LB790:
	clra
LB791:
	pulb
	cba
	tba
	pulb
	rts
;
LB796:
	ldaa	X0035
	beq	LB7A0
	suba	#$14
	bcc	LB7A0
	ldaa	#$00
LB7A0:
	staa	X0035
	ldaa	X000C
	ldab	X0041
	bitb	#$20
	beq	LB7F7
	ldaa	X0047
	bita	#$80
	beq	LB7D6
	ldaa	X000F
	bne	LB7BA
	ldaa	X0010
	cmpa	#$50
	bcs	LB7D6
LB7BA:
	ldaa	X000D
	cmpa	#$04
	bcs	LB7D6
	clr	X0044
	bitb	#$80
	bne	LB7F0
	inc	X0043
	ldaa	X0043
	cmpa	#$14
	bcs	LB7F7
	orab	#$80
	stab	X0041
	bra	LB7F7
;
LB7D6:
	clr	X0043
	bitb	#$80
	beq	LB7F7
	inc	X0044
	ldaa	X0044
	cmpa	#$0F
	bcs	LB7EA
	andb	#$7F
	stab	X0041
LB7EA:
	clr	X004D
	jmp	LB9D9
;
LB7F0:
	ldaa	XBF75
	clrb
	jmp	LB999
;
LB7F7:
	bitb	#$20
	bne	LB84F
	ldaa	X0047
	bita	#$20
	beq	LB807
	clr	X004D
LB804:
	jmp	LB9BF
;
LB807:
	ldaa	X004D
	cmpa	#$28
	bcc	LB810
	jmp	LB9BF
;
LB810:
	ldaa	#$28
	staa	X004D
	ldaa	X0004
	cmpa	XBF6A
	bcs	LB804
	ldaa	X000C
	cmpa	XBF6B
	bcc	LB830
	cmpa	#$03
	bcs	LB804
	cmpa	UnknownBF6C
	bcs	LB835
	clr	X004C
	bra	LB804
;
LB830:
	inc	X004C
	bra	LB838
;
LB835:
	dec	X004C
LB838:
	ldaa	X004C
	bmi	LB844
	cmpa	#$0A
	bcs	LB804
	orab	#$40
	bra	LB848
;
LB844:
	cmpa	#$F6
	bcc	LB804
LB848:
	orab	#$28
	stab	X0041
	clr	X004D
LB84F:
	ldaa	X010F
	bita	#$08
	beq	LB866
	ldaa	X000F
	bne	LB863
	ldaa	X0010
	cmpa	#$30
	bhi	LB863
	jmp	LB9BF
LB863:
	jmp	LB9BC
;
LB866:
	ldaa	X000D
	cmpa	#$02
	bcs	LB87B
	ldaa	X000F
	bne	LB876
	ldaa	X0010
	cmpa	#$28
	bcs	LB87B
LB876:
	ldx	#$3D70
	bra	LB87E
;
LB87B:
	ldx	#$1E38
LB87E:
	stx	X0028
	ldaa	X0041
	ldab	X000C
	cmpb	X004B
	bcs	LB8D7
	bita	#$08
	bne	LB8B5
	ldab	X007F
	bmi	LB894
	ldab	#$03
	stab	X009D
LB894:
	oraa	#$08
	staa	X0041
	ldaa	XBF6D
	staa	X004B
	clra
	ldab	XBF71
	jsr	Multiply16ShiftBA
	staa	X002A
	stab	X002B
	ldaa	X0013
	ldab	X0014
	subb	X002B
	sbca	X002A
	clr	X004D
	bra	LB8C8
;
LB8B5:
	ldaa	X003E
	ldab	X003F
	jsr	SRA025
	staa	X0045
	stab	X0046
	ldaa	X0013
	ldab	X0014
	subb	X0046
	sbca	X0045
LB8C8:
	staa	X0013
	stab	X0014
	ldaa	X000C
	cmpa	X005F
	bcs	LB8D4
	staa	X005F
LB8D4:
	jmp	LB977
;
LB8D7:
	bita	#$08
	beq	LB956
	ldab	X007F
	bmi	LB8E3
	ldab	#$0B
	stab	X009D
LB8E3:
	anda	#$F7
	staa	X0041
	ldab	X0047
	bitb	#$01
	bne	LB8FE
	ldab	X003A
	cmpb	XBF74
	bcs	LB8F9
	ldab	XBF73
	bra	LB90D
;
LB8F9:
	ldab	XBF72
	bra	LB90D
;
LB8FE:
	ldab	X0009
	cmpb	XBF74
	bcs	LB90A
	ldab	XBF73
	bra	LB90D
;
LB90A:
	ldab	XBF72
LB90D:
	clra
	jsr	Multiply16ShiftBA
	addb	X0014
	adca	X0013
	stab	X0014
	staa	X0013
	ldaa	X0041
	bita	#$40
	bne	LB924
	ldab	XBF6E
	bra	LB92B
;
LB924:
	anda	#$BF
	staa	X0041
	ldab	XBF70
LB92B:
	stab	X004B
	ldaa	X005F
	cmpa	XBF76
	bcc	LB94A
	clr	X005F
	ldaa	X0077
	inca
	staa	X0077
	cmpa	XBF77
	bcs	LB977
	ldaa	X004D
	cmpa	XBF78
	bcs	LB951
	bra	LB97E
;
LB94A:
	clra
	staa	X005F
	staa	X0077
	bra	LB977
;
LB951:
	dec	X0077
	bra	LB977
;
LB956:
	ldaa	X003E
	ldab	X003F
	jsr	SRA025
	staa	X0048
	stab	X0049
	addb	X0014
	adca	X0013
	staa	X0013
	stab	X0014
	ldaa	X0077
	cmpa	XBF77
	bcs	LB977
	ldaa	X004D
	cmpa	XBF79
	bcc	LB97E
LB977:
	ldaa	X004D
	cmpa	XBF7A
	bcs	LB984
LB97E:
	clr	X0077
	jmp	LB9AE
;
LB984:
	ldaa	X0013
	ldab	X0014
	cmpa	#$4B
	bcs	LB992
	cmpa	#$7D
	bcc	LB996
	bra	LB999
;
LB992:
	ldaa	#$4B
	bra	LB998
;
LB996:
	ldaa	#$7D
LB998:
	clrb
LB999:
	staa	X0013
	stab	X0014
	ldaa	X0041
	ldaa	X000C
	ldaa	X005F
	ldaa	X0013
	ldaa	X0014
	ldaa	X004B
	ldaa	X004D
	jmp	LA7F5
;
LB9AE:
	ldaa	XBF6F
	staa	X004B
	ldaa	X0041
	anda	#$DF
	staa	X0041
	clr	X004C
LB9BC:
	clr	X004D
LB9BF:
	ldaa	X0013
	ldab	X0014
	cmpa	#$64
	bcc	LB9D1
	addb	X0049
	adca	X0048
	cmpa	#$64
	bcc	LB9D9
	bra	LB9DC
;
LB9D1:
	subb	X0046
	sbca	X0045
	cmpa	#$64
	bcc	LB9DC
LB9D9:
	ldaa	#$64
	clrb
LB9DC:
	bra	LB999
;
LB9DE:
	ldaa	X0099
	bita	#$20
	bne	LB9ED
	ldaa	X007F
	anda	#$DF
	staa	X007F
LB9EA:
	jmp	LAA98
;
LB9ED:
	bita	#$80
	beq	LBA0C
	ldaa	X007F
	bita	#$02
	bne	LB9EA
	oraa	#$02
	staa	X007F
	jsr	LBA8B
	bita	#$40
	bne	LBA07
	jsr	LBA86
	bra	LB9EA
;
LBA07:
	jsr	LBA82
	bra	LB9EA
;
LBA0C:
	ldaa	X0090
	ldab	X0091
	tsta
	beq	LB9EA
	ldaa	X007F
	bita	#$01
	bne	LB9EA
	sei
	ldab	X0005
	ldaa	#$AA
LBA1E:
	ldx	#$017F
LBA21:
	coma
	staa	$00,x
	dex
	coma
	staa	$00,x
	dex
	cpx	#$00FF
	beq	LBA35
	cpx	#$FFFF
	bne	LBA21
	bra	LBA3E
;
LBA35:
	eorb	#$10
	stab	X0099
	ldx	#$007F
	bra	LBA21
;
LBA3E:
	eorb	#$10
	stab	X0099
	ldx	#$017F
LBA45:
	coma
	cmpa	$00,x
	bne	LBA77
	dex
	coma
	cmpa	$00,x
	bne	LBA77
	dex
	cpx	#$00FF
	beq	LBA66
	cpx	#$FFFF
	bne	LBA45
	eorb	#$10
	stab	X0099
	cmpa	#$55
	beq	LBA6F
	coma
	bra	LBA1E
;
LBA66:
	eorb	#$10
	stab	X0099
	ldx	#$007F
	bra	LBA45
;
LBA6F:
	eorb	#$10
	stab	X0099
	ldaa	#$21
	bra	LBA7D
;
LBA77:
	eorb	#$10
	stab	X0099
	ldaa	#$61
LBA7D:
	staa	X007F
	jmp	LA84C
;
LBA82:
	ldab	#$0B
	bra	LBA88
;
LBA86:
	ldab	#$03
LBA88:
	stab	X009D
	rts
;
LBA8B:
	ldx	#$DFFF
LBA8E:
	clra
	clrb
LBA90:
	inx
	eora	$00,x
	addb	$00,x
	psha
	ldaa	X0005
	anda	#$EF
	staa	X0005
	staa	X0099
	pula
	cpx	#$EFFF
	beq	LBAAB
	cpx	#$FFFF
	bne	LBA90
	bra	LBABD
;
LBAAB:
	staa	X011C
	stab	X011D
	cmpa	DwordBFF3
	bne	LBAD4
	cmpb	XBFF4
	bne	LBAD4
	bra	LBA8E
;
LBABD:
	staa	X011E
	stab	X011F
	cmpa	DwordBFF5
	bne	LBAD4
	cmpb	XBFF6
	bne	LBAD4
	ldaa	X007F
	anda	#$BF
LBAD1:
	staa	X007F
	rts
;
LBAD4:
	ldaa	X007F
	oraa	#$40
	bra	LBAD1
;
	ldab	ByteBFF7
	lsrb
	bcc	LBAFB
	ldab	X0099
	bitb	#$20
	bne	LBAFB
	bitb	#$80
	beq	LBB03
	ldab	X0000
	bitb	#$C0
	bne	LBAF6
	ldab	X000A
	cmpb	#$28
	bcs	LBB03
LBAF6:
	ldaa	#$8A
LBAF8:
	staa	X007F
	rti
;
LBAFB:
	ldaa	X007F
	anda	#$7F
	oraa	#$20
	bra	LBAF8
;
LBB03:
	clra
	bra	LBAF8
;
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
;
dataUnknownBB10:
	db	$7D
	db	$A9
	db	$02
	db	$D0
	db	$04
	db	$B0
	db	$A2
	db	$CE
	db	$1C
	db	$46
	db	$1C
	db	$E9
	db	$30
	db	$D0
	db	$8F
	db	$9D
UnknownDataBB20:
	db	$3F
	db	$3F
	db	$3F
	db	$3F
	db	$05
	db	$0F
	db	$3F
	db	$3F
	db	$00
	db	$90
	db	$00
	db	$B0
	db	$01
	db	$30
	db	$02
	db	$00
ChtsConversion:
	db	$FF
	db	$C8
	db	$B6
	db	$A7
	db	$9A
	db	$90
	db	$88
	db	$82
	db	$7C
	db	$77
	db	$72
	db	$6E
	db	$6A
	db	$66
	db	$62
	db	$5E
	db	$5B
	db	$57
	db	$53
	db	$50
	db	$4C
	db	$48
	db	$44
	db	$40
	db	$3C
	db	$38
	db	$33
	db	$2E
	db	$28
	db	$20
	db	$14
	db	$00
IgnDwellDutyVolts:
	db	$FF
	db	$FF
	db	$FF
	db	$FF
	db	$FF
	db	$FF
	db	$A2
	db	$6F
	db	$55
	db	$46
	db	$3A
	db	$33
	db	$2D
	db	$28
	db	$25
	db	$21
BaroTable:
	db	$8D
	db	$8B
	db	$89
	db	$86
	db	$84
	db	$81
	db	$7F
	db	$7C
	db	$79
	db	$77
	db	$74
	db	$71
	db	$6E
	db	$6B
	db	$68
	db	$65
IATTable:
	db	$80
	db	$80
	db	$80
	db	$80
	db	$80
	db	$80
	db	$80
	db	$80
	db	$80
	db	$80
	db	$80
	db	$80
	db	$82
	db	$84
	db	$87
	db	$8D
AfrScaleTP:
	dw	$0040
	dw	X0060
	dw	X0080
	dw	$00A0
	dw	$00C0
	dw	$00E0
	dw	X0100
	dw	X0120
	dw	$0140
	dw	$0150
	dw	$0160
	dw	$0170
	dw	$0180
	dw	$01A0
	dw	$01E0
	dw	$0200
AfrScaleRPM:
	dw	X0020
	dw	X0028
	dw	$0040
	dw	X0060
	dw	X0080
	dw	$00A0
	dw	$00C0
	dw	$00E0
	dw	X0100
	dw	X0120
	dw	$0140
	dw	$0160
	dw	$0180
	dw	$01A0
	dw	$01C0
	dw	$01E0
IgnSaleTP:
	dw	$0040
	dw	X0050
	dw	X0060
	dw	$0070
	dw	X0080
	dw	X0090
	dw	$00A0
	dw	$00B0
	dw	$00C0
	dw	$00E0
	dw	X0100
	dw	X0120
	dw	$0140
	dw	$0180
	dw	$01C0
	dw	$0200
IgnScaleRPM:
	dw	$0040
	dw	X0050
	dw	X0060
	dw	$0070
	dw	X0080
	dw	$00A0
	dw	$00C0
	dw	$00E0
	dw	X0100
	dw	X0120
	dw	$0140
	dw	$0160
	dw	$0180
	dw	$01A0
	dw	$01C0
	dw	$01E0
IgnTable:
	db	$14
	db	$1E
	db	$23
	db	$28
	db	$23
	db	$21
	db	$1E
	db	$1A
	db	$16
	db	$12
	db	$10
	db	$10
	db	$10
	db	$10
	db	$10
	db	$10
	db	$1A
	db	$24
	db	$2D
	db	$2D
	db	$2D
	db	$29
	db	$25
	db	$22
	db	$1F
	db	$18
	db	$12
	db	$12
	db	$12
	db	$12
	db	$12
	db	$12
	db	$1F
	db	$29
	db	$2E
	db	$2E
	db	$2E
	db	$2B
	db	$27
	db	$25
	db	$22
	db	$1B
	db	$15
	db	$15
	db	$15
	db	$15
	db	$15
	db	$15
	db	$20
	db	$2A
	db	$31
	db	$33
	db	$33
	db	$2F
	db	$2B
	db	$27
	db	$24
	db	$1F
	db	$1A
	db	$12
	db	$12
	db	$12
	db	$12
	db	$12
	db	$21
	db	$2B
	db	$35
	db	$35
	db	$35
	db	$33
	db	$2E
	db	$29
	db	$27
	db	$22
	db	$1A
	db	$12
	db	$0F
	db	$0F
	db	$0F
	db	$0F
	db	$25
	db	$2F
	db	$36
	db	$39
	db	$39
	db	$35
	db	$32
	db	$2D
	db	$28
	db	$23
	db	$1C
	db	$19
	db	$0F
	db	$0D
	db	$0D
	db	$0D
	db	$25
	db	$2F
	db	$39
	db	$39
	db	$39
	db	$36
	db	$32
	db	$2D
	db	$2A
	db	$24
	db	$1E
	db	$1B
	db	$19
	db	$12
	db	$12
	db	$12
	db	$25
	db	$2F
	db	$39
	db	$39
	db	$39
	db	$37
	db	$32
	db	$2D
	db	$2A
	db	$25
	db	$1F
	db	$1B
	db	$19
	db	$16
	db	$16
	db	$16
	db	$26
	db	$30
	db	$38
	db	$3A
	db	$38
	db	$35
	db	$31
	db	$2E
	db	$2B
	db	$26
	db	$1F
	db	$1D
	db	$19
	db	$17
	db	$17
	db	$17
	db	$26
	db	$30
	db	$35
	db	$35
	db	$35
	db	$33
	db	$31
	db	$2E
	db	$2B
	db	$26
	db	$21
	db	$1D
	db	$19
	db	$19
	db	$19
	db	$19
	db	$27
	db	$31
	db	$36
	db	$36
	db	$36
	db	$33
	db	$31
	db	$2F
	db	$2C
	db	$27
	db	$22
	db	$1E
	db	$1A
	db	$1A
	db	$1A
	db	$1A
	db	$27
	db	$31
	db	$36
	db	$36
	db	$36
	db	$33
	db	$31
	db	$2F
	db	$2C
	db	$27
	db	$22
	db	$1E
	db	$1A
	db	$17
	db	$17
	db	$17
	db	$27
	db	$31
	db	$35
	db	$36
	db	$36
	db	$36
	db	$31
	db	$2F
	db	$2C
	db	$27
	db	$22
	db	$1E
	db	$1A
	db	$17
	db	$17
	db	$17
	db	$28
	db	$32
	db	$36
	db	$37
	db	$37
	db	$37
	db	$34
	db	$30
	db	$2D
	db	$26
	db	$23
	db	$20
	db	$1E
	db	$1D
	db	$1D
	db	$1D
	db	$28
	db	$32
	db	$36
	db	$37
	db	$37
	db	$37
	db	$33
	db	$30
	db	$2D
	db	$25
	db	$21
	db	$1F
	db	$1F
	db	$1F
	db	$1F
	db	$1F
	db	$29
	db	$33
	db	$37
	db	$38
	db	$38
	db	$38
	db	$34
	db	$31
	db	$2E
	db	$26
	db	$22
	db	$20
	db	$1F
	db	$1F
	db	$1F
	db	$1F
FuelTable:
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$00
	db	$00
	db	$00
	db	$00
	db	$14
	db	$20
	db	$23
	db	$23
	db	$23
	db	$23
	db	$23
	db	$23
	db	$23
	db	$23
	db	$23
	db	$23
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$2C
	db	$2C
	db	$2C
	db	$2C
	db	$2C
	db	$2C
	db	$2C
	db	$2C
	db	$2C
	db	$2C
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$30
	db	$48
	db	$48
	db	$48
	db	$48
	db	$48
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$14
	db	$44
	db	$44
	db	$44
	db	$44
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$14
	db	$30
	db	$40
	db	$40
	db	$40
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$14
	db	$14
	db	$26
	db	$38
	db	$4C
	db	$4C
	db	$4C
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$14
	db	$14
	db	$14
	db	$26
	db	$3C
	db	$58
	db	$58
	db	$58
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$26
	db	$26
	db	$26
	db	$30
	db	$30
	db	$3C
	db	$3C
	db	$58
	db	$58
	db	$58
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$26
	db	$26
	db	$26
	db	$30
	db	$30
	db	$3C
	db	$3C
	db	$58
	db	$58
	db	$58
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$26
	db	$26
	db	$26
	db	$30
	db	$30
	db	$40
	db	$40
	db	$60
	db	$60
	db	$60
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$26
	db	$26
	db	$26
	db	$30
	db	$30
	db	$40
	db	$50
	db	$70
	db	$70
	db	$70
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$26
	db	$26
	db	$26
	db	$30
	db	$30
	db	$40
	db	$60
	db	$60
	db	$60
	db	$60
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$26
	db	$26
	db	$26
	db	$30
	db	$30
	db	$40
	db	$64
	db	$64
	db	$64
	db	$64
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$14
	db	$26
	db	$2F
	db	$38
	db	$64
	db	$64
	db	$64
	db	$64
	db	$64
	db	$64
	db	$64
ChtsEnrichment:
	db	$40
	db	$40
	db	$40
	db	$40
	db	$40
	db	$40
	db	$40
	db	$40
	db	$40
	db	$40
	db	$40
	db	$40
	db	$40
	db	$40
	db	$40
	db	$40
	db	$40
	db	$41
	db	$42
	db	$44
	db	$46
	db	$47
	db	$4C
	db	$4F
	db	$53
	db	$58
	db	$5F
	db	$61
	db	$64
	db	$66
	db	$6A
	db	$6A
CrankingEnrichment:
	db	$04
	db	$04
	db	$04
	db	$04
	db	$04
	db	$04
	db	$04
	db	$04
	db	$04
	db	$04
	db	$04
	db	$04
	db	$04
	db	$05
	db	$06
	db	$06
	db	$06
	db	$06
	db	$06
	db	$06
	db	$06
	db	$06
	db	$06
	db	$0C
	db	$13
	db	$19
	db	$1F
	db	$27
	db	$30
	db	$3A
	db	$4F
	db	$4F
AfterStartEnrichment:
	db	$06
	db	$06
	db	$06
	db	$06
	db	$06
	db	$06
	db	$06
	db	$06
	db	$06
	db	$06
	db	$06
	db	$10
	db	$23
	db	$28
	db	$2C
	db	$32
UnknownBE50:
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$03
	db	$09
	db	$0E
	db	$11
	db	$14
	db	$16
	db	$1F
	db	$33
	db	$39
	db	$40
	db	$4D
UnknownBE60:
	db	$44
	db	$44
	db	$44
	db	$44
	db	$44
	db	$45
	db	$46
	db	$48
	db	$4A
	db	$4B
	db	$4D
	db	$4E
	db	$4E
	db	$4E
	db	$4E
	db	$4E
UnknownBE70:
	db	$32
	db	$32
	db	$32
	db	$32
	db	$32
	db	$35
	db	$38
	db	$3B
	db	$3E
	db	$40
	db	$43
	db	$46
	db	$46
	db	$46
	db	$46
	db	$46
UnknownBE80:
	db	$30
	db	$30
	db	$30
	db	$30
	db	$30
	db	$33
	db	$37
	db	$39
	db	$3C
	db	$3E
	db	$41
	db	$44
	db	$44
	db	$44
	db	$44
	db	$44
UnknownBE90:
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$08
	db	$10
	db	$18
	db	$20
	db	$20
	db	$20
	db	$20
	db	$20
	db	$20
	db	$20
UnknownBEA0:
	db	$34
	db	$34
	db	$34
	db	$34
	db	$34
	db	$3E
	db	$44
	db	$4A
	db	$50
	db	$5B
	db	$67
	db	$70
	db	$70
	db	$70
	db	$70
	db	$70
;
LBEB0:
	ldaa	X0047
	bita	#$40
	beq	LBEBC
	ldaa	X0004
	cmpa	#$78
	bcc	LBEC3
LBEBC:
	ldaa	X007C
	bpl	LBEC3
	jmp	LA6CE
LBEC3:
	jmp	LA6F2
;
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
	swi
;
EgrTable:
	db	$C8
	db	$C8
	db	$C8
	db	$9C
	db	$88
	db	$7C
	db	$6E
	db	$C8
	db	$C8
	db	$C8
	db	$90
	db	$86
	db	$78
	db	$6C
	db	$64
	db	$C8
	db	$C8
	db	$92
	db	$88
	db	$7E
	db	$74
	db	$56
	db	$46
	db	$00
	db	$AA
	db	$86
	db	$7C
	db	$78
	db	$6E
	db	$44
	db	$28
	db	$00
	db	$90
	db	$82
	db	$7A
	db	$74
	db	$68
	db	$32
	db	$00
	db	$00
	db	$86
	db	$78
	db	$72
	db	$6A
	db	$58
	db	$00
	db	$00
	db	$00
	db	$80
	db	$6A
	db	$62
	db	$5A
	db	$3C
	db	$00
	db	$00
	db	$00
	db	$84
	db	$72
	db	$62
	db	$5A
	db	$3C
	db	$00
	db	$00
	db	$00
EgrLoadTP:
	db	$00
	db	$5C
	db	$00
	db	$6C
	db	$00
	db	$7B
	db	$00
	db	$8A
	db	$00
	db	$9A
	db	$00
	db	$C0
	db	$00
	db	$E0
	db	$01
	db	$20
DataUnknown:
	db	$10
	db	$60
	db	$FF
	db	$12
	db	$0C
	db	$63
	db	$33
	db	$08
	db	$CD
	db	$C0
	db	$00
	db	$B8
	db	$38
	db	$3C
	db	$30
	db	$06
	db	$02
	db	$08
	db	$21
	db	$04
	db	$40
	db	$38
	db	$3C
	db	$40
	db	$0C
	db	$46
	db	$7D
	db	$0A
	db	$19
	db	$32
	db	$19
	db	$24
	db	$32
	db	$82
	db	$1E
	db	$A0
	db	$04
	db	$08
	db	$3C
	db	$80
	db	$A0
	db	$10
	db	$3C
	db	$3D
	db	$17
	db	$2B
	db	$30
	db	$35
	db	$3A
	db	$48
	db	$70
	db	$78
	db	$80
	db	$5A
	db	$3A
	db	$03
	db	$14
	db	$32
	db	$64
	db	$6C
	db	$A5
	db	$00
	db	$00
	db	$C8
	db	$14
	db	$0A
	db	$61
	db	$6C
	db	$50
	db	$01
	db	$00
	db	$04
	db	$05
	db	$3D
	db	$50
	db	$00
	db	$A0
	db	$01
	db	$40
	db	$00
	db	$05
	db	$0A
	db	$00
	db	$05
	db	$0A
	db	$00
	db	$05
	db	$05
	db	$96
	db	$3C
	db	$38
	db	$02
	db	$01
	db	$41
	db	$00
	db	$1A
UnknownData:
	db	$01
	db	$33
	db	$0A
	db	$FB
	db	$FF
	db	$3F
	db	$3F
	db	$3F
	db	$3F
	db	$3F
	db	$3F
	db	$3F
	db	$3F
	db	$3F
	db	$3F
	db	$3F
IgnDwellDuty%:
	db	$0B
	db	$0F
	db	$27
	db	$3E
	db	$5B
	db	$72
	db	$89
	db	$A0
	db	$B6
	db	$CD
	db	$D2
	db	$DD
	db	$E8
	db	$E8
	db	$E8
	db	$E8
EgrLoadRPM:
	db	$00
	db	$60
	db	$00
	db	$70
	db	$00
	db	$80
	db	$00
	db	$90
	db	$00
	db	$A0
	db	$00
	db	$C0
	db	$00
	db	$E0
	db	$00
	db	$F0
UnknownBFD0:
	db	$00
	db	$50
	db	$01
	db	$00
	db	$10
	db	$10
	db	$10
	db	$10
	db	$10
	db	$10
	db	$10
	db	$12
	db	$14
	db	$16
	db	$19
	db	$19
IgnIdleSwitch:
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$00
	db	$02
	db	$04
	db	$06
	db	$08
	db	$0A
	db	$0C
	db	$0E
	db	$10
	db	$10
	db	$10
SWI:
	db	$3F
	db	$3F
	db	$3F
DwordBFF3:
	dw	$3066
DwordBFF5:
	dw	$894B
ByteBFF7:
	db	$01
IRQMaybe:
	dw	$A6AC
SWIMaybe:
	dw	$A843
NMIMaybe:
	dw	$BADA
RSTMaybe:
	dw	$A843

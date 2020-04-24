	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"queenBee.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStingers.part.0, %function
drawStingers.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, [r0, #36]
	ldr	r2, [r0]
	ldr	r1, [r0, #52]
	ldrb	ip, [r0, #4]	@ zero_extendqisi2
	ldr	lr, .L4
	add	r3, r3, #71
	lsl	r2, r2, #23
	lsl	r4, r3, #3
	orr	r0, ip, #16384
	add	r3, lr, r3, lsl #3
	lsr	r2, r2, #23
	lsl	r1, r1, #5
	strh	r0, [lr, r4]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	shadowOAM
	.size	drawStingers.part.0, .-drawStingers.part.0
	.align	2
	.global	initStingers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initStingers, %function
initStingers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #5
	mov	r7, r2
	mov	r6, #16
	mov	r5, #2
	mov	r4, #30
	ldr	r3, .L10
	ldr	ip, .L10+4
	ldr	r0, .L10+8
	ldr	r1, [r3, #12]
	ldr	lr, [r3, #8]
	ldr	ip, [ip]
	ldr	r0, [r0]
	add	r1, r1, #64
	ldr	r3, .L10+12
	sub	ip, r1, ip
	sub	r0, lr, r0
.L7:
	str	r2, [r3, #36]
	add	r2, r2, #1
	cmp	r2, #3
	stm	r3, {r0, ip}
	str	r8, [r3, #24]
	str	r6, [r3, #28]
	str	lr, [r3, #8]
	str	r1, [r3, #12]
	str	r5, [r3, #16]
	str	r7, [r3, #32]
	str	r4, [r3, #52]
	add	r3, r3, #56
	bne	.L7
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	queenBee
	.word	vOff
	.word	hOff
	.word	stingers
	.size	initStingers, .-initStingers
	.align	2
	.global	initQueenBee
	.syntax unified
	.arm
	.fpu softvfp
	.type	initQueenBee, %function
initQueenBee:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #167
	mov	r4, #500
	mov	lr, #16
	mov	r2, #0
	mov	ip, #64
	mov	r0, #1
	ldr	r3, .L14
	ldr	r1, [r3]
	ldr	r3, .L14+4
	sub	r1, r5, r1
	str	r1, [r3, #4]
	ldr	r1, .L14+8
	str	r1, [r3, #8]
	ldr	r1, .L14+12
	str	r5, [r3, #12]
	str	r4, [r3, #40]
	str	lr, [r3, #52]
	pop	{r4, r5, lr}
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #44]
	str	r2, [r3, #56]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r1]
	b	initStingers
.L15:
	.align	2
.L14:
	.word	vOff
	.word	queenBee
	.word	394
	.word	attackTimer
	.size	initQueenBee, .-initQueenBee
	.align	2
	.global	drawQueenBee
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawQueenBee, %function
drawQueenBee:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L24
	ldr	r3, [r2, #32]
	cmp	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	beq	.L17
	ldr	r3, [r2]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	add	r0, r2, #52
	ldm	r0, {r0, lr}
	ldrb	ip, [r2, #4]	@ zero_extendqisi2
	ldr	r1, .L24+4
	add	r2, r0, lr, lsl #5
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	r2, [r1, #4]	@ movhi
.L19:
	mov	r6, #512
	ldr	r4, .L24+8
	ldr	r7, .L24+12
	add	r5, r4, #168
.L18:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L20
	mov	r0, r4
	bl	drawStingers.part.0
.L21:
	add	r4, r4, #56
	cmp	r4, r5
	bne	.L18
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L20:
	ldr	r3, [r4, #36]
	add	r3, r3, #71
	lsl	r3, r3, #3
	strh	r6, [r7, r3]	@ movhi
	b	.L21
.L17:
	mov	r2, #512
	ldr	r3, .L24+4
	strh	r2, [r3]	@ movhi
	b	.L19
.L25:
	.align	2
.L24:
	.word	queenBee
	.word	shadowOAM+560
	.word	stingers
	.word	shadowOAM
	.size	drawQueenBee, .-drawQueenBee
	.align	2
	.global	drawStingers
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStingers, %function
drawStingers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #32]
	cmp	r2, #0
	bne	drawStingers.part.0
.L27:
	mov	r1, #512
	ldr	r3, [r0, #36]
	ldr	r2, .L28
	add	r3, r3, #71
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L29:
	.align	2
.L28:
	.word	shadowOAM
	.size	drawStingers, .-drawStingers
	.align	2
	.global	animateQueenBee
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateQueenBee, %function
animateQueenBee:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L33
	ldr	r2, [r3, #44]
	cmp	r2, #0
	bne	.L31
	mov	r2, #16
	str	r2, [r3, #52]
	bx	lr
.L31:
	cmp	r2, #1
	moveq	r2, #24
	streq	r2, [r3, #52]
	bx	lr
.L34:
	.align	2
.L33:
	.word	queenBee
	.size	animateQueenBee, .-animateQueenBee
	.align	2
	.global	updateStingers
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStingers, %function
updateStingers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #48]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #16
	ldr	r0, [r0, #8]
	bne	.L37
	ldr	r2, [r4, #40]
	sub	r2, r2, r0
	cmp	r2, #100
	strgt	r3, [r4, #32]
	ble	.L53
.L39:
	ldr	r5, .L55
	ldr	r3, [r5, #12]
	ldr	r1, [r5, #28]
	ldr	r2, [r5, #8]
	ldr	ip, [r5, #24]
	asr	r3, r3, #8
	str	r3, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp]
	ldr	r6, .L55+4
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	ldr	r1, [r4, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L54
.L42:
	ldr	r2, .L55+8
	ldr	r3, .L55+12
	ldr	r0, [r2]
	ldr	r1, [r3]
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #12]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L37:
	cmp	r3, #1
	bne	.L39
	ldr	r3, [r4, #40]
	sub	r3, r0, r3
	cmp	r3, #100
	movgt	r3, #0
	strgt	r3, [r4, #32]
	bgt	.L39
.L53:
	ldr	r3, [r4, #16]
	add	r0, r0, r3
	str	r0, [r4, #8]
	b	.L39
.L54:
	mov	r2, #0
	ldr	r3, [r5, #68]
	str	r2, [r4, #32]
	sub	r3, r3, #10
	ldr	r2, .L55+16
	str	r3, [r5, #68]
	mov	lr, pc
	bx	r2
	b	.L42
.L56:
	.align	2
.L55:
	.word	player
	.word	collision
	.word	hOff
	.word	vOff
	.word	updateHearts
	.size	updateStingers, .-updateStingers
	.align	2
	.global	updateStingerPosition
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStingerPosition, %function
updateStingerPosition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L62
	ldr	r1, [r2, #44]
	cmp	r1, #0
	push	{r4, lr}
	bne	.L58
	mvn	lr, #1
	mov	ip, #30
	add	r2, r2, #8
	ldm	r2, {r2, r3}
	add	r3, r3, #64
	str	lr, [r0, #16]
	str	r1, [r0, #48]
	str	r3, [r0, #12]
	str	r2, [r0, #8]
	str	ip, [r0, #52]
	str	r2, [r0, #40]
	str	r3, [r0, #44]
	pop	{r4, lr}
	bx	lr
.L58:
	cmp	r1, #1
	beq	.L60
	add	r2, r0, #8
	ldm	r2, {r2, r3}
	pop	{r4, lr}
	str	r2, [r0, #40]
	str	r3, [r0, #44]
	bx	lr
.L60:
	mov	r4, #2
	mov	lr, #31
	ldr	r3, [r2, #12]
	ldr	ip, [r2, #8]
	add	r3, r3, #64
	add	r2, ip, #64
	str	r4, [r0, #16]
	str	lr, [r0, #52]
	str	r1, [r0, #48]
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	str	r2, [r0, #40]
	str	r3, [r0, #44]
	pop	{r4, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	queenBee
	.size	updateStingerPosition, .-updateStingerPosition
	.align	2
	.global	attackQueenBee
	.syntax unified
	.arm
	.fpu softvfp
	.type	attackQueenBee, %function
attackQueenBee:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L70
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L67
	ldr	r2, [r3, #88]
	cmp	r2, #0
	beq	.L68
	ldr	r2, [r3, #144]
	cmp	r2, #0
	moveq	r2, #2
	addeq	r0, r3, #112
	bxne	lr
.L65:
	mov	r1, #1
	rsb	r2, r2, r2, lsl #3
	add	r3, r3, r2, lsl #3
	str	r1, [r3, #32]
	b	updateStingerPosition
.L67:
	mov	r0, r3
	b	.L65
.L68:
	mov	r2, #1
	add	r0, r3, #56
	b	.L65
.L71:
	.align	2
.L70:
	.word	stingers
	.size	attackQueenBee, .-attackQueenBee
	.align	2
	.global	updateQueenBee
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateQueenBee, %function
updateQueenBee:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L107
	ldr	r7, .L107+4
	ldr	r2, [r4, #8]
	ldr	r5, [r7]
	sub	r5, r2, r5
	cmp	r5, #239
	mov	r6, r0
	bhi	.L73
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L103
.L73:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	ldr	r0, [r4, #12]
	bne	.L75
.L76:
	ldr	r1, [r4, #44]
.L83:
	ldr	r3, .L107+8
	ldr	r3, [r3]
	cmp	r1, #0
	sub	r3, r0, r3
	str	r3, [r4, #4]
	moveq	r3, #16
	str	r5, [r4]
	streq	r3, [r4, #52]
	beq	.L82
	cmp	r1, #1
	moveq	r3, #24
	streq	r3, [r4, #52]
.L82:
	ldr	r0, .L107+12
	bl	updateStingers
	ldr	r0, .L107+16
	bl	updateStingers
	ldr	r0, .L107+20
	pop	{r4, r5, r6, r7, r8, lr}
	b	updateStingers
.L103:
	ldr	r8, .L107+24
	ldr	r3, [r8]
	cmp	r3, #0
	bne	.L74
	ldr	r3, .L107+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L107+32
	ldr	r1, .L107+36
	ldr	r0, .L107+40
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r2, [r4, #8]
	str	r3, [r8]
.L74:
	mov	r3, #1
	str	r5, [r4]
	str	r3, [r4, #32]
	ldr	r0, [r4, #12]
.L75:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	ble	.L104
	ldr	r3, .L107+44
	ldr	r3, [r3, #8]
	cmp	r3, r2
	movgt	r1, #1
	movle	r1, #0
	lsl	r3, r0, #9
	str	r1, [r4, #44]
	bgt	.L105
	sub	ip, r2, #1
	add	r3, ip, r3
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	cmp	r3, #0
	beq	.L78
	ldr	r3, [r4, #24]
	add	r3, r0, r3
	sub	r3, r3, #1
	add	ip, ip, r3, lsl #9
	lsl	ip, ip, #1
	ldrh	r3, [r6, ip]
	cmp	r3, #0
	ldrne	r3, [r4, #16]
	subne	r2, r2, r3
	strne	r2, [r4, #8]
.L78:
	ldr	r6, .L107+48
	ldr	ip, .L107+52
	ldr	r3, [r6]
	ldr	r2, .L107+56
	mla	r2, r3, r2, ip
	ldr	ip, .L107+60
	cmp	ip, r2, ror #2
	addcc	r3, r3, #1
	bcs	.L106
.L80:
	ldr	r2, [r7]
	ldr	r5, [r4, #8]
	str	r3, [r6]
	sub	r5, r5, r2
	b	.L83
.L104:
	mov	r3, #0
	mov	ip, #1
	ldr	r1, .L107+64
	str	r3, [r4, #32]
	ldr	r3, [r1]
	ldr	r5, [r7]
	sub	r3, r3, #1
	str	r3, [r1]
	str	ip, [r4, #36]
	sub	r5, r2, r5
	b	.L76
.L105:
	ldr	ip, [r4, #28]
	add	ip, r2, ip
	add	r3, ip, r3
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	cmp	r3, #0
	beq	.L78
	ldr	r3, [r4, #24]
	add	r3, r0, r3
	sub	r3, r3, #1
	add	r3, ip, r3, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	cmp	r3, #0
	ldrne	r3, [r4, #16]
	addne	r2, r3, r2
	strne	r2, [r4, #8]
	b	.L78
.L106:
	bl	attackQueenBee
	mov	r3, #1
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #44]
	b	.L80
.L108:
	.align	2
.L107:
	.word	queenBee
	.word	hOff
	.word	vOff
	.word	stingers
	.word	stingers+56
	.word	stingers+112
	.word	.LANCHOR0
	.word	stopSound
	.word	playSoundA
	.word	989182
	.word	fastGame2
	.word	player
	.word	attackTimer
	.word	85899344
	.word	-1030792151
	.word	42949672
	.word	remainingEnemiesL2
	.size	updateQueenBee, .-updateQueenBee
	.comm	attackTimer,4,4
	.global	queenBeeSpawned
	.comm	stingers,168,4
	.comm	queenBee,64,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	queenBeeSpawned, %object
	.size	queenBeeSpawned, 4
queenBeeSpawned:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

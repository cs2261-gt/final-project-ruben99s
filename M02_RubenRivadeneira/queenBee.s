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
	ldr	r3, [r0]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r0, #36]
	ldr	r1, [r0, #40]
	ldr	ip, .L4
	str	lr, [sp, #-4]!
	add	r2, r2, #71
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	lsl	r1, r1, #5
	lsl	r0, r2, #3
	add	r2, ip, r2, lsl #3
	strh	lr, [ip, r0]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	ldr	lr, [sp], #4
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
	str	r4, [r3, #40]
	add	r3, r3, #44
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
	str	r5, [r3, #12]
	str	r4, [r3, #40]
	str	lr, [r3, #52]
	pop	{r4, r5, lr}
	str	r1, [r3, #8]
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #44]
	str	r2, [r3, #56]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	b	initStingers
.L15:
	.align	2
.L14:
	.word	vOff
	.word	queenBee
	.word	394
	.size	initQueenBee, .-initQueenBee
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
	ldr	r4, .L60
	ldr	r6, .L60+4
	ldr	r3, [r4, #8]
	ldr	r2, [r6]
	sub	r5, r3, r2
	cmp	r5, #239
	mov	r7, r0
	bhi	.L17
	ldr	r1, [r4, #36]
	cmp	r1, #0
	bne	.L17
	ldr	r8, .L60+8
	ldr	r1, [r8]
	cmp	r1, #0
	beq	.L57
.L18:
	mov	r1, #1
	str	r5, [r4]
	str	r1, [r4, #32]
	ldr	r1, [r4, #12]
.L19:
	ldr	r0, [r4, #40]
	cmp	r0, #0
	ble	.L58
	ldr	r0, .L60+12
	ldr	r0, [r0, #8]
	cmp	r0, #320
	blt	.L59
	cmp	r0, r3
	movle	r0, #0
	strle	r0, [r4, #44]
	ble	.L23
.L22:
	mov	r0, #1
	str	r0, [r4, #44]
.L25:
	ldr	r0, [r4, #28]
	add	r0, r3, r0
	add	ip, r0, r1, lsl #9
	lsl	ip, ip, #1
	ldrh	ip, [r7, ip]
	cmp	ip, #0
	beq	.L31
	ldr	ip, [r4, #24]
	add	ip, r1, ip
	sub	ip, ip, #1
	add	r0, r0, ip, lsl #9
	lsl	r0, r0, #1
	ldrh	r0, [r7, r0]
	cmp	r0, #0
	beq	.L31
	ldr	r5, [r4, #16]
	add	r3, r3, r5
	str	r3, [r4, #8]
	ldr	ip, [r4, #44]
	sub	r5, r3, r2
	b	.L28
.L17:
	ldr	r1, [r4, #32]
	cmp	r1, #0
	ldr	r1, [r4, #12]
	bne	.L19
.L20:
	ldr	ip, [r4, #44]
.L28:
	ldr	r3, .L60+16
	ldr	r3, [r3]
	cmp	ip, #0
	sub	r1, r1, r3
	str	r5, [r4]
	str	r1, [r4, #4]
	bne	.L30
.L32:
	mov	r3, #16
	str	r3, [r4, #52]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L59:
	cmp	r0, r3
	bgt	.L22
	ldr	ip, [r4, #44]
	cmp	ip, #0
	beq	.L23
	cmp	ip, #1
	beq	.L25
	ldr	r0, .L60+16
	ldr	r0, [r0]
	sub	r3, r3, r2
	sub	r1, r1, r0
	str	r3, [r4]
	str	r1, [r4, #4]
.L30:
	cmp	ip, #1
	beq	.L29
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L58:
	mov	lr, #0
	mov	ip, #1
	ldr	r0, .L60+20
	sub	r5, r3, r2
	ldr	r3, [r0]
	sub	r3, r3, #1
	str	r3, [r0]
	str	lr, [r4, #32]
	str	ip, [r4, #36]
	b	.L20
.L23:
	sub	r0, r3, #1
	add	ip, r0, r1, lsl #9
	lsl	ip, ip, #1
	ldrh	ip, [r7, ip]
	cmp	ip, #0
	beq	.L27
	ldr	ip, [r4, #24]
	add	ip, r1, ip
	sub	ip, ip, #1
	add	r0, r0, ip, lsl #9
	lsl	r0, r0, #1
	ldrh	r0, [r7, r0]
	cmp	r0, #0
	beq	.L27
	ldr	r5, [r4, #16]
	sub	r3, r3, r5
	str	r3, [r4, #8]
	ldr	ip, [r4, #44]
	sub	r5, r3, r2
	b	.L28
.L27:
	mov	ip, #1
	ldr	r0, .L60+16
	ldr	r0, [r0]
	sub	r3, r3, r2
	sub	r1, r1, r0
	str	r3, [r4]
	str	r1, [r4, #4]
	str	ip, [r4, #44]
.L29:
	mov	r3, #24
	str	r3, [r4, #52]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L57:
	ldr	r3, .L60+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L60+28
	ldr	r1, .L60+32
	ldr	r0, .L60+36
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r2, [r6]
	str	r3, [r8]
	ldr	r3, [r4, #8]
	b	.L18
.L31:
	mov	ip, #0
	ldr	r0, .L60+16
	ldr	r0, [r0]
	sub	r3, r3, r2
	sub	r1, r1, r0
	str	r3, [r4]
	str	r1, [r4, #4]
	str	ip, [r4, #44]
	b	.L32
.L61:
	.align	2
.L60:
	.word	queenBee
	.word	hOff
	.word	.LANCHOR0
	.word	player
	.word	vOff
	.word	remainingEnemiesL2
	.word	stopSound
	.word	playSoundA
	.word	989182
	.word	fastGame2
	.size	updateQueenBee, .-updateQueenBee
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
	ldr	r2, .L70
	ldr	r3, [r2, #32]
	cmp	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	beq	.L63
	ldr	r3, [r2]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	add	r0, r2, #52
	ldm	r0, {r0, lr}
	ldrb	ip, [r2, #4]	@ zero_extendqisi2
	ldr	r1, .L70+4
	add	r2, r0, lr, lsl #5
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	r2, [r1, #4]	@ movhi
.L65:
	mov	r6, #512
	ldr	r4, .L70+8
	ldr	r7, .L70+12
	add	r5, r4, #132
.L64:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L66
	mov	r0, r4
	bl	drawStingers.part.0
.L67:
	add	r4, r4, #44
	cmp	r4, r5
	bne	.L64
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L66:
	ldr	r3, [r4, #36]
	add	r3, r3, #71
	lsl	r3, r3, #3
	strh	r6, [r7, r3]	@ movhi
	b	.L67
.L63:
	mov	r2, #512
	ldr	r3, .L70+4
	strh	r2, [r3]	@ movhi
	b	.L65
.L71:
	.align	2
.L70:
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
.L73:
	mov	r1, #512
	ldr	r3, [r0, #36]
	ldr	r2, .L74
	add	r3, r3, #71
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L75:
	.align	2
.L74:
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
	ldr	r3, .L79
	ldr	r2, [r3, #44]
	cmp	r2, #0
	bne	.L77
	mov	r2, #16
	str	r2, [r3, #52]
	bx	lr
.L77:
	cmp	r2, #1
	moveq	r2, #24
	streq	r2, [r3, #52]
	bx	lr
.L80:
	.align	2
.L79:
	.word	queenBee
	.size	animateQueenBee, .-animateQueenBee
	.global	queenBeeSpawned
	.comm	stingers,132,4
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

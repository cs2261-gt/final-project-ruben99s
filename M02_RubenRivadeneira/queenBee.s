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
	ldr	r3, .L46
	ldr	r2, .L46+4
	push	{r4, r5, lr}
	ldr	r2, [r2]
	ldr	lr, [r3, #8]
	sub	r1, lr, r2
	cmp	r1, #239
	ldr	r4, [r3, #12]
	bhi	.L17
	ldr	ip, [r3, #36]
	cmp	ip, #0
	bne	.L17
	mov	ip, #1
	str	r1, [r3]
	str	ip, [r3, #32]
.L18:
	ldr	ip, [r3, #40]
	cmp	ip, #0
	ble	.L44
	ldr	ip, .L46+8
	ldr	ip, [ip, #8]
	cmp	lr, ip
	movlt	ip, #1
	movge	ip, #0
	str	ip, [r3, #44]
	lsl	ip, r4, #9
	blt	.L45
	sub	r5, lr, #1
	add	ip, ip, r5
	lsl	ip, ip, #1
	ldrh	ip, [r0, ip]
	cmp	ip, #0
	beq	.L21
	ldr	ip, [r3, #24]
	add	ip, r4, ip
	sub	ip, ip, #1
	add	r5, r5, ip, lsl #9
	lsl	r5, r5, #1
	ldrh	r0, [r0, r5]
	cmp	r0, #0
	beq	.L21
	ldr	r1, [r3, #16]
	sub	r1, lr, r1
	str	r1, [r3, #8]
	sub	r1, r1, r2
.L22:
	ldr	r0, .L46+12
	ldr	r2, [r0]
	sub	r2, r4, r2
	stm	r3, {r1, r2}
	pop	{r4, r5, lr}
	bx	lr
.L17:
	ldr	ip, [r3, #32]
	cmp	ip, #0
	beq	.L22
	b	.L18
.L44:
	mov	lr, #0
	mov	ip, #1
	ldr	r0, .L46+16
	ldr	r2, [r0]
	sub	r2, r2, #1
	str	r2, [r0]
	str	lr, [r3, #32]
	str	ip, [r3, #36]
	b	.L22
.L45:
	ldr	r5, [r3, #28]
	add	r5, lr, r5
	add	ip, ip, r5
	lsl	ip, ip, #1
	ldrh	ip, [r0, ip]
	cmp	ip, #0
	beq	.L23
	ldr	ip, [r3, #24]
	add	ip, r4, ip
	sub	ip, ip, #1
	add	r5, r5, ip, lsl #9
	lsl	r5, r5, #1
	ldrh	r0, [r0, r5]
	cmp	r0, #0
	beq	.L23
	ldr	r1, [r3, #16]
	add	r1, lr, r1
	str	r1, [r3, #8]
	sub	r1, r1, r2
	b	.L22
.L21:
	mov	r2, #1
	str	r2, [r3, #44]
	b	.L22
.L23:
	mov	r2, #0
	str	r2, [r3, #44]
	b	.L22
.L47:
	.align	2
.L46:
	.word	queenBee
	.word	hOff
	.word	player
	.word	vOff
	.word	remainingEnemiesL2
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
	ldr	r2, .L56
	ldr	r3, [r2, #32]
	cmp	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	beq	.L49
	ldr	r3, [r2]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	add	r0, r2, #52
	ldm	r0, {r0, lr}
	ldrb	ip, [r2, #4]	@ zero_extendqisi2
	ldr	r1, .L56+4
	add	r2, r0, lr, lsl #5
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	r2, [r1, #4]	@ movhi
.L51:
	mov	r6, #512
	ldr	r4, .L56+8
	ldr	r7, .L56+12
	add	r5, r4, #132
.L50:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L52
	mov	r0, r4
	bl	drawStingers.part.0
.L53:
	add	r4, r4, #44
	cmp	r4, r5
	bne	.L50
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L52:
	ldr	r3, [r4, #36]
	add	r3, r3, #71
	lsl	r3, r3, #3
	strh	r6, [r7, r3]	@ movhi
	b	.L53
.L49:
	mov	r2, #512
	ldr	r3, .L56+4
	strh	r2, [r3]	@ movhi
	b	.L51
.L57:
	.align	2
.L56:
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
.L59:
	mov	r1, #512
	ldr	r3, [r0, #36]
	ldr	r2, .L60
	add	r3, r3, #71
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L61:
	.align	2
.L60:
	.word	shadowOAM
	.size	drawStingers, .-drawStingers
	.comm	stingers,132,4
	.comm	queenBee,64,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

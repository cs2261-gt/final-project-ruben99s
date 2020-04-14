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
	.file	"player.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #10
	mov	ip, #212
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	lr, #2
	mov	r7, #30
	mov	r6, #20
	mov	r5, #112
	mov	r4, #4
	ldr	r3, .L4
	ldr	r0, [r3]
	ldr	r3, .L4+4
	sub	r0, r1, r0
	str	r0, [r3]
	ldr	r0, .L4+8
	ldr	r0, [r0]
	sub	r0, ip, r0
	str	r7, [r3, #24]
	str	r6, [r3, #28]
	str	r5, [r3, #36]
	str	r4, [r3, #76]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r0, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #32]
	str	r1, [r3, #56]
	str	ip, [r3, #12]
	str	ip, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #60]
	str	r2, [r3, #72]
	str	r2, [r3, #64]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hOff
	.word	player
	.word	vOff
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L28
	ldr	r3, .L28+4
	ldr	r5, [r4, #60]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #64]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #68]
	str	r1, [r4, #64]
	bne	.L7
	ldr	r0, [r4, #72]
	ldr	r3, .L28+8
	ldr	r1, [r4, #76]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #72]
.L7:
	ldr	r3, .L28+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	moveq	r1, #1
	ldreq	r2, .L28+16
	streq	r3, [r2]
	ldr	r2, .L28+12
	ldrh	r3, [r2, #48]
	streq	r1, [r4, #64]
	ands	r3, r3, #16
	bne	.L9
	mov	r0, #1
	ldrh	r2, [r2, #48]
	ldr	r1, .L28+16
	tst	r2, #64
	str	r0, [r1]
	str	r3, [r4, #64]
	beq	.L10
.L11:
	ldr	r3, .L28+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	beq	.L14
	ldr	r3, [r4, #64]
.L15:
	cmp	r3, #4
	bne	.L17
	mov	r3, #0
	str	r6, [r4, #64]
	str	r3, [r4, #72]
	str	r3, [r4, #60]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	ldr	r2, .L28+16
	ldr	r2, [r2]
	cmp	r2, #1
	moveq	r2, #5
	streq	r3, [r4, #64]
	streq	r2, [r4, #72]
	beq	.L17
	cmp	r2, #0
	bne	.L27
	mov	r2, #1
	mov	r3, #5
	str	r2, [r4, #64]
	str	r3, [r4, #72]
.L17:
	add	r5, r5, #1
	str	r5, [r4, #60]
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	ldrh	r3, [r2, #48]
	tst	r3, #64
	bne	.L11
	ldr	r3, .L28+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L10
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #64]
.L12:
	mov	r3, #4
	str	r3, [r4, #72]
	b	.L11
.L10:
	mov	r3, #0
	str	r3, [r4, #64]
	b	.L12
.L27:
	mov	r2, #5
	ldr	r3, [r4, #64]
	str	r2, [r4, #72]
	b	.L15
.L29:
	.align	2
.L28:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.word	direction
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L31
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #72]
	ldr	r2, [r1, #64]
	ldr	r0, .L31+4
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	lsl	r2, r2, #2
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L32:
	.align	2
.L31:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L78
	ldr	r3, .L78+4
	ldrh	r2, [r2, #48]
	ldr	r0, [r3, #8]
	tst	r2, #16
	push	{r4, r5, r6, r7, lr}
	str	r0, [r3, #32]
	beq	.L34
	ldr	r5, .L78+8
.L35:
	ldr	r2, .L78
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L38
	ldr	r2, [r3, #8]
	cmp	r2, #0
	blt	.L38
	ldr	ip, [r3, #16]
	ldr	r1, [r5]
	sub	r2, r2, ip
	cmp	r1, #0
	str	r2, [r3, #8]
	ble	.L38
	ldr	r2, [r3]
	cmp	r2, #59
	suble	r1, r1, ip
	strle	r1, [r5]
.L38:
	ldr	r2, .L78
	ldrh	r2, [r2, #48]
	tst	r2, #128
	moveq	r2, #22
	movne	r2, #30
	moveq	r1, #1
	movne	r1, #0
	streq	r2, [r3, #24]
	strne	r2, [r3, #24]
	ldr	r2, .L78
	ldrh	r2, [r2, #48]
	streq	r1, [r3, #48]
	strne	r1, [r3, #48]
	streq	r0, [r3, #8]
	ldrne	r0, [r3, #8]
	tst	r2, #64
	ldr	r1, [r3, #12]
	bne	.L42
	ldr	r2, [r3, #40]
	cmp	r2, r1
	movle	r4, #1
	ldrgt	r4, [r3, #44]
	strle	r4, [r3, #44]
.L44:
	ldr	r2, .L78+12
	ldrh	lr, [r2]
	tst	lr, #1
	ldr	r2, [r3, #52]
	beq	.L75
	ldr	ip, .L78+16
	ldrh	ip, [ip]
	ands	ip, ip, #1
	beq	.L47
.L75:
	add	r2, r2, #1
.L46:
	tst	lr, #2
	str	r2, [r3, #52]
	beq	.L55
	ldr	r2, .L78+16
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L55
	mov	r6, #1
	ldr	r2, .L78+20
	add	lr, r2, #640
.L57:
	ldr	ip, [r2, #32]
	cmp	ip, #0
	beq	.L56
	ldr	ip, [r2]
	cmp	ip, #239
	strls	r6, [r2, #52]
.L56:
	add	r2, r2, #80
	cmp	r2, lr
	bne	.L57
.L55:
	cmp	r4, #0
	bne	.L76
	ldr	r2, [r3, #40]
	cmp	r2, r1
	ldrgt	r2, [r3, #20]
	addgt	r1, r1, r2
	strgt	r1, [r3, #12]
.L58:
	ldr	r2, .L78+24
	ldr	ip, [r5]
	ldr	r2, [r2]
	sub	r0, r0, ip
	sub	r1, r1, r2
	pop	{r4, r5, r6, r7, lr}
	stm	r3, {r0, r1}
	b	animatePlayer
.L42:
	mov	r2, #0
	mov	r4, r2
	str	r2, [r3, #44]
	b	.L44
.L34:
	ldr	r2, [r3, #28]
	add	r2, r0, r2
	cmp	r2, #512
	ldr	r5, .L78+8
	bgt	.L35
	ldr	ip, .L78+28
	ldr	r1, [r5]
	ldr	r2, [r3, #16]
	cmp	r1, ip
	add	ip, r0, r2
	str	ip, [r3, #8]
	bgt	.L35
	ldr	ip, [r3]
	cmp	ip, #60
	addgt	r2, r2, r1
	strgt	r2, [r5]
	b	.L35
.L76:
	ldr	ip, [r3, #20]
	ldr	r2, [r3, #36]
	sub	r1, r1, ip
	cmp	r1, r2
	movle	r2, #0
	str	r1, [r3, #12]
	strle	r2, [r3, #44]
	b	.L58
.L47:
	cmp	r2, #9
	ble	.L75
	ldr	r7, .L78+32
	mov	r2, ip
	mov	ip, r7
.L51:
	ldr	r6, [ip, #40]
	cmp	r6, #0
	beq	.L49
	ldr	r6, [ip, #48]
	cmp	r6, #0
	bne	.L77
.L49:
	add	r2, r2, #1
	cmp	r2, #5
	add	ip, ip, #56
	bne	.L51
.L50:
	mov	r2, #1
	b	.L46
.L77:
	mov	ip, #0
	rsb	r2, r2, r2, lsl #3
	add	r2, r7, r2, lsl #3
	str	ip, [r2, #48]
	b	.L50
.L79:
	.align	2
.L78:
	.word	67109120
	.word	player
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	bees
	.word	vOff
	.word	270
	.word	balloons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	playerAttack
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerAttack, %function
playerAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L92
	mov	r2, #0
	mov	r3, r0
.L83:
	ldr	r1, [r3, #40]
	cmp	r1, #0
	beq	.L81
	ldr	r1, [r3, #48]
	cmp	r1, #0
	bne	.L91
.L81:
	add	r2, r2, #1
	cmp	r2, #5
	add	r3, r3, #56
	bne	.L83
	bx	lr
.L91:
	mov	r3, #0
	rsb	r2, r2, r2, lsl #3
	add	r2, r0, r2, lsl #3
	str	r3, [r2, #48]
	bx	lr
.L93:
	.align	2
.L92:
	.word	balloons
	.size	playerAttack, .-playerAttack
	.comm	player,80,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

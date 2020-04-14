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
	push	{r4, r5, r6, r7, lr}
	mov	lr, #212
	mov	r2, #0
	mov	r4, #2
	mov	r7, #30
	mov	r6, #20
	mov	r5, #112
	mov	ip, #4
	ldr	r3, .L4
	ldr	r0, [r3]
	ldr	r3, .L4+4
	sub	r0, r1, r0
	str	r0, [r3]
	ldr	r0, .L4+8
	ldr	r0, [r0]
	sub	r0, lr, r0
	str	r7, [r3, #24]
	str	r6, [r3, #28]
	str	r5, [r3, #36]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	lr, [r3, #12]
	str	lr, [r3, #40]
	str	r0, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #32]
	str	r1, [r3, #68]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #56]
	str	r2, [r3, #64]
	str	r2, [r3, #72]
	str	r2, [r3, #84]
	str	r2, [r3, #76]
	str	ip, [r3, #60]
	str	ip, [r3, #88]
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
	ldr	r5, [r4, #72]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #76]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #80]
	str	r1, [r4, #76]
	bne	.L7
	ldr	r0, [r4, #84]
	ldr	r3, .L28+8
	ldr	r1, [r4, #88]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #84]
.L7:
	ldr	r3, .L28+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	moveq	r1, #1
	ldreq	r2, .L28+16
	streq	r3, [r2]
	ldr	r2, .L28+12
	ldrh	r3, [r2, #48]
	streq	r1, [r4, #76]
	ands	r3, r3, #16
	bne	.L9
	mov	r0, #1
	ldrh	r2, [r2, #48]
	ldr	r1, .L28+16
	tst	r2, #64
	str	r0, [r1]
	str	r3, [r4, #76]
	beq	.L10
.L11:
	ldr	r3, .L28+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	beq	.L14
	ldr	r3, [r4, #76]
.L15:
	cmp	r3, #4
	bne	.L17
	mov	r3, #0
	str	r6, [r4, #76]
	str	r3, [r4, #84]
	str	r3, [r4, #72]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	ldr	r2, .L28+16
	ldr	r2, [r2]
	cmp	r2, #1
	moveq	r2, #5
	streq	r3, [r4, #76]
	streq	r2, [r4, #84]
	beq	.L17
	cmp	r2, #0
	bne	.L27
	mov	r2, #1
	mov	r3, #5
	str	r2, [r4, #76]
	str	r3, [r4, #84]
.L17:
	add	r5, r5, #1
	str	r5, [r4, #72]
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
	streq	r3, [r4, #76]
.L12:
	mov	r3, #4
	str	r3, [r4, #84]
	b	.L11
.L10:
	mov	r3, #0
	str	r3, [r4, #76]
	b	.L12
.L27:
	mov	r2, #5
	ldr	r3, [r4, #76]
	str	r2, [r4, #84]
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
	ldr	ip, [r1, #84]
	ldr	r2, [r1, #76]
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
	ldr	r3, .L57
	ldr	r3, [r3, #56]
	cmp	r3, #0
	bne	.L34
	ldr	ip, .L57+4
	mov	r2, ip
.L37:
	ldr	r1, [r2, #40]
	cmp	r1, #0
	beq	.L35
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L55
.L35:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #76
	bne	.L37
	bx	lr
.L34:
	cmp	r3, #1
	bxne	lr
	ldr	ip, .L57+4
	mov	r1, #5
	mov	r2, ip
.L39:
	ldr	r0, [r2, #420]
	cmp	r0, #0
	beq	.L38
	ldr	r3, [r2, #428]
	cmp	r3, #0
	bne	.L56
.L38:
	add	r1, r1, #1
	cmp	r1, #10
	add	r2, r2, #76
	bne	.L39
	bx	lr
.L55:
	mov	r2, #0
	add	r1, r3, r3, lsl #3
	add	r3, r3, r1, lsl #1
	add	r3, ip, r3, lsl #2
	str	r2, [r3, #48]
	bx	lr
.L56:
	mov	r3, #0
	add	r2, r1, r1, lsl #3
	add	r1, r1, r2, lsl #1
	add	r1, ip, r1, lsl #2
	str	r3, [r1, #48]
	bx	lr
.L58:
	.align	2
.L57:
	.word	player
	.word	allBalloons
	.size	playerAttack, .-playerAttack
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
	ldr	r3, .L121
	push	{r4, r5, r6, lr}
	ldr	r4, .L121+4
	ldrh	r2, [r3, #48]
	ldr	r3, [r4, #8]
	tst	r2, #16
	str	r3, [r4, #32]
	beq	.L60
	ldr	r5, .L121+8
.L61:
	ldr	r2, .L121
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L64
	ldr	r2, [r4, #8]
	cmp	r2, #0
	blt	.L64
	ldr	r0, [r4, #16]
	ldr	r1, [r5]
	sub	r2, r2, r0
	cmp	r1, #0
	str	r2, [r4, #8]
	ble	.L64
	ldr	r2, [r4]
	cmp	r2, #59
	suble	r1, r1, r0
	strle	r1, [r5]
.L64:
	ldr	r2, .L121
	ldrh	r2, [r2, #48]
	tst	r2, #128
	movne	r3, #30
	moveq	r1, #1
	moveq	r2, #22
	movne	r2, #0
	streq	r3, [r4, #8]
	strne	r3, [r4, #24]
	ldr	r3, .L121
	ldrh	r3, [r3, #48]
	streq	r1, [r4, #48]
	streq	r2, [r4, #24]
	strne	r2, [r4, #48]
	tst	r3, #64
	movne	r3, #0
	strne	r3, [r4, #44]
	bne	.L69
	ldr	r3, [r4, #40]
	ldr	r2, [r4, #12]
	cmp	r2, r3
	movge	r3, #1
	strge	r3, [r4, #44]
.L69:
	ldr	r6, .L121+12
	ldrh	r2, [r6]
	tst	r2, #1
	ldr	r3, [r4, #52]
	beq	.L115
	ldr	r1, .L121+16
	ldrh	r1, [r1]
	tst	r1, #1
	beq	.L72
.L115:
	add	r3, r3, #1
.L71:
	tst	r2, #2
	str	r3, [r4, #52]
	beq	.L77
	ldr	r3, .L121+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L77
	mov	ip, #1
	ldr	r3, .L121+20
	add	r0, r3, #672
.L79:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L78
	ldr	r1, [r3]
	cmp	r1, #239
	strls	ip, [r3, #52]
.L78:
	add	r3, r3, #84
	cmp	r3, r0
	bne	.L79
.L77:
	tst	r2, #512
	ldr	r3, [r4, #56]
	and	r2, r2, #256
	beq	.L76
	ldr	r1, .L121+16
	ldrh	r1, [r1]
	ands	ip, r1, #512
	bne	.L76
	cmp	r3, #0
	bne	.L80
	mov	ip, #1
	mov	lr, #3
	ldr	r0, .L121+24
	str	r3, [r4, #60]
	str	lr, [r4, #56]
	str	ip, [r0, #876]
	str	r3, [r0, #40]
	str	r3, [r0, #48]
	str	r3, [r0, #116]
	str	r3, [r0, #124]
	str	r3, [r0, #192]
	str	r3, [r0, #200]
	str	r3, [r0, #268]
	str	r3, [r0, #276]
	str	r3, [r0, #344]
	str	r3, [r0, #352]
	str	ip, [r0, #884]
.L81:
	cmp	r2, #0
	beq	.L88
	ands	r1, r1, #256
	ldr	r3, [r4, #56]
	beq	.L116
.L86:
	cmp	r3, #2
	beq	.L83
.L88:
	mov	r2, #150
.L90:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	str	r2, [r4, #36]
	ldr	r3, [r4, #12]
	bne	.L92
	ldr	r2, [r4, #40]
	cmp	r2, r3
	ldrgt	r2, [r4, #20]
	addgt	r3, r3, r2
	strgt	r3, [r4, #12]
.L93:
	ldr	r1, .L121+28
	ldr	r0, [r5]
	ldr	r2, [r4, #8]
	ldr	r1, [r1]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	pop	{r4, r5, r6, lr}
	b	animatePlayer
.L76:
	cmp	r2, #0
	beq	.L86
	ldr	r2, .L121+16
	ldrh	r1, [r2]
	ands	r1, r1, #256
	bne	.L86
.L116:
	cmp	r3, #0
	bne	.L87
	mov	r1, #1
	ldr	r2, .L121+24
	str	r3, [r4, #60]
	str	r1, [r4, #56]
	str	r1, [r2, #420]
	str	r3, [r2, #40]
	str	r3, [r2, #48]
	str	r3, [r2, #116]
	str	r3, [r2, #124]
	str	r3, [r2, #192]
	str	r3, [r2, #200]
	str	r3, [r2, #268]
	str	r3, [r2, #276]
	str	r3, [r2, #344]
	str	r3, [r2, #352]
	str	r1, [r2, #428]
	b	.L88
.L60:
	ldr	r2, [r4, #28]
	add	r2, r3, r2
	cmp	r2, #512
	ldr	r5, .L121+8
	bgt	.L61
	ldr	r0, .L121+32
	ldr	r1, [r5]
	ldr	r2, [r4, #16]
	cmp	r1, r0
	add	r0, r3, r2
	str	r0, [r4, #8]
	bgt	.L61
	ldr	r0, [r4]
	cmp	r0, #60
	addgt	r2, r2, r1
	strgt	r2, [r5]
	b	.L61
.L92:
	ldr	r1, [r4, #20]
	sub	r3, r3, r1
	cmp	r3, r2
	movle	r2, #0
	str	r3, [r4, #12]
	strle	r2, [r4, #44]
	b	.L93
.L83:
	mov	r2, #100
	b	.L90
.L72:
	cmp	r3, #9
	ble	.L115
	bl	playerAttack
	mov	r3, #1
	ldrh	r2, [r6]
	b	.L71
.L80:
	cmp	r3, #3
	beq	.L117
	cmp	r3, #2
	beq	.L118
	cmp	r3, #1
	bne	.L81
	ldr	r0, .L121+24
	str	r3, [r4, #60]
	str	ip, [r4, #56]
	str	ip, [r0, #420]
	str	ip, [r0, #428]
	str	ip, [r0, #496]
	str	ip, [r0, #504]
	str	ip, [r0, #572]
	str	ip, [r0, #580]
	str	ip, [r0, #648]
	str	ip, [r0, #656]
	str	ip, [r0, #724]
	str	ip, [r0, #732]
	str	r3, [r0, #40]
	str	r3, [r0, #48]
	b	.L81
.L87:
	cmp	r3, #1
	beq	.L119
	cmp	r3, #2
	beq	.L120
	cmp	r3, #3
	bne	.L88
	mov	r0, #1
	ldr	r2, .L121+24
	str	r3, [r4, #60]
	str	r1, [r4, #56]
	str	r0, [r2, #40]
	str	r1, [r2, #876]
	str	r1, [r2, #884]
	str	r0, [r2, #48]
	b	.L88
.L119:
	mov	r0, #2
	ldr	r2, .L121+24
	str	r3, [r4, #60]
	str	r0, [r4, #56]
	str	r1, [r2, #420]
	str	r1, [r2, #428]
	str	r1, [r2, #496]
	str	r1, [r2, #504]
	str	r1, [r2, #572]
	str	r1, [r2, #580]
	str	r1, [r2, #648]
	str	r1, [r2, #656]
	str	r1, [r2, #724]
	str	r1, [r2, #732]
	str	r3, [r2, #800]
	str	r3, [r2, #808]
	mov	r2, #100
	b	.L90
.L117:
	mov	lr, #1
	mov	r6, #2
	ldr	r0, .L121+24
	cmp	r2, #0
	str	r3, [r4, #60]
	str	r6, [r4, #56]
	str	lr, [r0, #800]
	str	ip, [r0, #876]
	str	ip, [r0, #884]
	str	lr, [r0, #808]
	beq	.L83
	tst	r1, #256
	bne	.L83
.L84:
	mov	r2, #0
	mov	r3, #1
	mov	ip, #2
	mov	r1, #3
	str	r2, [r0, #800]
	str	r2, [r0, #808]
	str	ip, [r4, #60]
	str	r1, [r4, #56]
	str	r3, [r0, #876]
	str	r3, [r0, #884]
	b	.L88
.L118:
	mov	lr, #1
	ldr	r0, .L121+24
	str	r3, [r4, #60]
	str	lr, [r4, #56]
	str	lr, [r0, #420]
	str	ip, [r0, #800]
	str	ip, [r0, #808]
	str	lr, [r0, #428]
	b	.L81
.L120:
	ldr	r0, .L121+24
	b	.L84
.L122:
	.align	2
.L121:
	.word	67109120
	.word	player
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	bees
	.word	allBalloons
	.word	vOff
	.word	270
	.size	updatePlayer, .-updatePlayer
	.comm	player,92,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

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
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, #10
	mov	r4, #212
	mov	r5, #2
	mov	r8, #30
	mov	r7, #20
	mov	r6, #112
	mov	r2, #0
	mov	lr, #4
	ldr	r3, .L4
	str	r8, [r3, #24]
	str	r7, [r3, #28]
	str	r6, [r3, #36]
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	str	r4, [r3, #12]
	str	r4, [r3, #40]
	str	ip, [r3, #8]
	str	ip, [r3, #32]
	ldr	r0, [r0]
	sub	r0, ip, r0
	str	r0, [r3]
	ldr	r1, [r1]
	sub	r1, r4, r1
	str	lr, [r3, #60]
	str	lr, [r3, #88]
	str	r1, [r3, #4]
	str	ip, [r3, #68]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #56]
	str	r2, [r3, #64]
	str	r2, [r3, #72]
	str	r2, [r3, #84]
	str	r2, [r3, #76]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
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
	ldr	r3, .L144
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L144+4
	ldrh	r3, [r3, #48]
	ldr	ip, [r4, #8]
	tst	r3, #16
	mov	r5, r1
	mov	r6, r2
	str	ip, [r4, #32]
	bne	.L61
	ldr	r3, [r4, #28]
	add	r3, ip, r3
	cmp	r3, #500
	ble	.L132
.L61:
	ldr	r3, .L144
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L65
	ldr	r3, [r4, #8]
	cmp	r3, #5
	bgt	.L133
.L65:
	ldr	r3, .L144
	ldrh	r3, [r3, #48]
	tst	r3, #128
	moveq	r3, #1
	movne	r3, #30
	moveq	r2, #22
	movne	r2, #0
	streq	r3, [r4, #48]
	ldreq	r3, [r4, #32]
	strne	r3, [r4, #24]
	streq	r3, [r4, #8]
	ldr	r3, .L144
	ldrh	r3, [r3, #48]
	streq	r2, [r4, #24]
	strne	r2, [r4, #48]
	ands	r3, r3, #64
	ldr	r1, [r4, #12]
	bne	.L70
	ldr	r2, [r4, #36]
	cmp	r2, r1
	blt	.L71
	ldr	r2, [r4, #56]
	cmp	r2, #2
	str	r3, [r4, #44]
	beq	.L72
.L142:
	mov	r3, #150
	ldr	ip, [r4, #20]
	str	r3, [r4, #36]
	ldr	r2, [r4, #8]
.L77:
	ldr	r3, [r4, #24]
	add	r3, r1, r3
	sub	r3, r3, #1
	add	r3, r3, ip
	add	lr, r2, r3, lsl #9
	lsl	lr, lr, #1
	ldrh	lr, [r0, lr]
	cmp	lr, #0
	lsl	r3, r3, #9
	beq	.L79
	ldr	lr, [r4, #28]
	add	r3, r3, lr
	add	r3, r3, r2
	add	r3, r0, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	addne	r1, r1, ip
	strne	r1, [r4, #12]
.L79:
	ldr	r7, .L144+8
	ldrh	r1, [r7]
	tst	r1, #1
	ldr	r3, [r4, #52]
	beq	.L129
	ldr	r0, .L144+12
	ldrh	r0, [r0]
	tst	r0, #1
	bne	.L129
	cmp	r3, #9
	bgt	.L83
.L129:
	add	r3, r3, #1
.L81:
	tst	r1, #2
	str	r3, [r4, #52]
	beq	.L87
	ldr	r3, .L144+12
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L87
	mov	lr, #1
	ldr	r3, .L144+16
	add	ip, r3, #672
.L89:
	ldr	r0, [r3, #32]
	cmp	r0, #0
	beq	.L88
	ldr	r0, [r3]
	cmp	r0, #239
	strls	lr, [r3, #52]
.L88:
	add	r3, r3, #84
	cmp	r3, ip
	bne	.L89
.L87:
	tst	r1, #512
	beq	.L86
	ldr	r3, .L144+12
	ldrh	r3, [r3]
	ands	r3, r3, #512
	bne	.L86
	ldr	r0, [r4, #56]
	cmp	r0, #0
	beq	.L134
	cmp	r0, #3
	beq	.L135
	cmp	r0, #2
	beq	.L136
	cmp	r0, #1
	beq	.L137
.L86:
	tst	r1, #256
	beq	.L93
	ldr	r3, .L144+12
	ldrh	r3, [r3]
	ands	r3, r3, #256
	bne	.L93
	ldr	r1, [r4, #56]
	cmp	r1, #0
	beq	.L138
	cmp	r1, #1
	beq	.L139
	cmp	r1, #2
	beq	.L140
	cmp	r1, #3
	beq	.L141
.L93:
	ldr	r3, [r5]
	sub	r2, r2, r3
	str	r2, [r4]
	ldr	r3, [r4, #12]
	ldr	r2, [r6]
	sub	r3, r3, r2
	str	r3, [r4, #4]
	pop	{r4, r5, r6, r7, r8, lr}
	b	animatePlayer
.L70:
	mov	r3, #0
	ldr	r2, [r4, #56]
	cmp	r2, #2
	str	r3, [r4, #44]
	bne	.L142
.L72:
	mov	r3, #90
	ldr	ip, [r4, #20]
	str	r3, [r4, #36]
	ldr	r2, [r4, #8]
	b	.L77
.L133:
	ldr	r1, [r4, #12]
	sub	r2, r3, #1
	add	ip, r2, r1, lsl #9
	lsl	ip, ip, #1
	ldrh	ip, [r0, ip]
	cmp	ip, #0
	beq	.L67
	ldr	ip, [r4, #24]
	add	r1, r1, ip
	sub	r1, r1, #1
	add	r2, r2, r1, lsl #9
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	ldrne	r2, [r4, #16]
	subne	r3, r3, r2
	strne	r3, [r4, #8]
.L67:
	ldr	r3, [r5]
	cmp	r3, #0
	ble	.L65
	ldr	r2, [r4]
	cmp	r2, #59
	ldrle	r2, [r4, #16]
	suble	r3, r3, r2
	strle	r3, [r5]
	b	.L65
.L132:
	ldr	r2, [r4, #12]
	add	r1, r3, r2, lsl #9
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	cmp	r1, #0
	beq	.L63
	ldr	r1, [r4, #24]
	add	r2, r2, r1
	sub	r2, r2, #1
	add	r3, r3, r2, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r0, r3]
	cmp	r3, #0
	ldrne	r3, [r4, #16]
	addne	ip, r3, ip
	strne	ip, [r4, #8]
.L63:
	ldr	r3, [r5]
	ldr	r2, .L144+20
	cmp	r3, r2
	bgt	.L61
	ldr	r2, [r4]
	cmp	r2, #60
	ldrgt	r2, [r4, #16]
	addgt	r3, r2, r3
	strgt	r3, [r5]
	b	.L61
.L71:
	mov	r3, #1
	ldr	r2, [r4, #56]
	cmp	r2, #2
	str	r3, [r4, #44]
	beq	.L143
	mov	r2, #150
	ldr	r3, [r4, #20]
	str	r2, [r4, #36]
	ldr	r2, [r4, #8]
.L78:
	sub	r1, r1, r3
	add	r3, r2, r1, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r0, r3]
	cmp	r3, #0
	lsl	r3, r1, #9
	beq	.L79
	ldr	ip, [r4, #28]
	add	r3, r3, ip
	add	r3, r3, r2
	add	r3, r0, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	strne	r1, [r4, #12]
	b	.L79
.L134:
	mov	ip, #1
	mov	lr, #3
	ldr	r3, .L144+24
	str	r0, [r4, #60]
	str	lr, [r4, #56]
	str	ip, [r3, #876]
	str	r0, [r3, #40]
	str	r0, [r3, #48]
	str	r0, [r3, #116]
	str	r0, [r3, #124]
	str	r0, [r3, #192]
	str	r0, [r3, #200]
	str	r0, [r3, #268]
	str	r0, [r3, #276]
	str	r0, [r3, #344]
	str	r0, [r3, #352]
	str	ip, [r3, #884]
	b	.L86
.L138:
	mov	r0, #1
	ldr	r3, .L144+24
	str	r1, [r4, #60]
	str	r0, [r4, #56]
	str	r0, [r3, #420]
	str	r1, [r3, #40]
	str	r1, [r3, #48]
	str	r1, [r3, #116]
	str	r1, [r3, #124]
	str	r1, [r3, #192]
	str	r1, [r3, #200]
	str	r1, [r3, #268]
	str	r1, [r3, #276]
	str	r1, [r3, #344]
	str	r1, [r3, #352]
	str	r0, [r3, #428]
	b	.L93
.L143:
	mov	r2, #90
	ldr	r3, [r4, #20]
	str	r2, [r4, #36]
	ldr	r2, [r4, #8]
	b	.L78
.L83:
	bl	playerAttack
	mov	r3, #1
	ldrh	r1, [r7]
	ldr	r2, [r4, #8]
	b	.L81
.L141:
	mov	ip, #1
	ldr	r0, .L144+24
	str	r1, [r4, #60]
	str	r3, [r4, #56]
	str	ip, [r0, #40]
	str	r3, [r0, #876]
	str	r3, [r0, #884]
	str	ip, [r0, #48]
	b	.L93
.L137:
	ldr	ip, .L144+24
	str	r0, [r4, #60]
	str	r3, [r4, #56]
	str	r3, [ip, #420]
	str	r3, [ip, #428]
	str	r3, [ip, #496]
	str	r3, [ip, #504]
	str	r3, [ip, #572]
	str	r3, [ip, #580]
	str	r3, [ip, #648]
	str	r3, [ip, #656]
	str	r3, [ip, #724]
	str	r3, [ip, #732]
	str	r0, [ip, #40]
	str	r0, [ip, #48]
	b	.L86
.L139:
	mov	ip, #2
	ldr	r0, .L144+24
	str	r1, [r4, #60]
	str	ip, [r4, #56]
	str	r3, [r0, #420]
	str	r3, [r0, #428]
	str	r3, [r0, #496]
	str	r3, [r0, #504]
	str	r3, [r0, #572]
	str	r3, [r0, #580]
	str	r3, [r0, #648]
	str	r3, [r0, #656]
	str	r3, [r0, #724]
	str	r3, [r0, #732]
	str	r1, [r0, #800]
	str	r1, [r0, #808]
	b	.L93
.L135:
	mov	ip, #1
	mov	lr, #2
	str	r0, [r4, #60]
	ldr	r0, .L144+24
	str	lr, [r4, #56]
	str	ip, [r0, #800]
	str	r3, [r0, #876]
	str	r3, [r0, #884]
	str	ip, [r0, #808]
	b	.L86
.L140:
	mov	r0, #1
	mov	ip, #3
	str	r1, [r4, #60]
	ldr	r1, .L144+24
	str	ip, [r4, #56]
	str	r0, [r1, #876]
	str	r3, [r1, #800]
	str	r3, [r1, #808]
	str	r0, [r1, #884]
	b	.L93
.L136:
	mov	lr, #1
	ldr	ip, .L144+24
	str	r0, [r4, #60]
	str	lr, [r4, #56]
	str	lr, [ip, #420]
	str	r3, [ip, #800]
	str	r3, [ip, #808]
	str	lr, [ip, #428]
	b	.L86
.L145:
	.align	2
.L144:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	bees
	.word	270
	.word	allBalloons
	.size	updatePlayer, .-updatePlayer
	.comm	player,92,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

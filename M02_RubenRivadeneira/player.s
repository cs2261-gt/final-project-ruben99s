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
	ldr	r3, .L145
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L145+4
	ldrh	r3, [r3, #48]
	ldr	ip, [r4, #8]
	tst	r3, #16
	mov	r7, r0
	mov	r5, r1
	mov	r6, r2
	str	ip, [r4, #32]
	bne	.L61
	ldr	r3, [r4, #28]
	add	r3, ip, r3
	cmp	r3, #500
	ble	.L138
.L61:
	ldr	r3, .L145
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L65
	ldr	r3, [r4, #8]
	cmp	r3, #5
	bgt	.L139
.L65:
	ldr	r3, .L145
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
	ldr	r3, .L145
	ldrh	r3, [r3, #48]
	streq	r2, [r4, #24]
	strne	r2, [r4, #48]
	tst	r3, #64
	bne	.L70
	ldr	r3, [r4, #36]
	ldr	r2, [r4, #12]
	cmp	r2, r3
	movgt	r3, #1
	strgt	r3, [r4, #44]
	ble	.L70
.L72:
	ldr	r8, .L145+8
	ldrh	ip, [r8]
	tst	ip, #1
	ldr	r3, [r4, #52]
	beq	.L137
	ldr	r2, .L145+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L75
.L137:
	add	r3, r3, #1
.L74:
	tst	ip, #2
	str	r3, [r4, #52]
	beq	.L80
	ldr	r3, .L145+12
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L80
	mov	r0, #1
	ldr	r3, .L145+16
	add	r1, r3, #672
.L82:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L81
	ldr	r2, [r3]
	cmp	r2, #239
	strls	r0, [r3, #52]
.L81:
	add	r3, r3, #84
	cmp	r3, r1
	bne	.L82
.L80:
	tst	ip, #512
	ldr	r3, [r4, #56]
	and	ip, ip, #256
	beq	.L79
	ldr	r2, .L145+12
	ldrh	r2, [r2]
	ands	r0, r2, #512
	bne	.L79
	cmp	r3, #0
	bne	.L83
	mov	r0, #1
	mov	lr, #3
	ldr	r1, .L145+20
	str	r3, [r4, #60]
	str	lr, [r4, #56]
	str	r0, [r1, #876]
	str	r3, [r1, #40]
	str	r3, [r1, #48]
	str	r3, [r1, #116]
	str	r3, [r1, #124]
	str	r3, [r1, #192]
	str	r3, [r1, #200]
	str	r3, [r1, #268]
	str	r3, [r1, #276]
	str	r3, [r1, #344]
	str	r3, [r1, #352]
	str	r0, [r1, #884]
.L84:
	cmp	ip, #0
	beq	.L91
	ands	r2, r2, #256
	ldr	r3, [r4, #56]
	beq	.L140
.L89:
	cmp	r3, #2
	beq	.L86
.L91:
	mov	r2, #150
.L93:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	str	r2, [r4, #36]
	ldr	ip, [r4, #12]
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #8]
	bne	.L95
	ldr	r3, [r4, #24]
	add	r3, ip, r3
	sub	r3, r3, #1
	add	r3, r3, r2
	add	r0, r1, r3, lsl #9
	lsl	r0, r0, #1
	ldrh	r0, [r7, r0]
	cmp	r0, #0
	lsl	r3, r3, #9
	beq	.L96
	ldr	r0, [r4, #28]
	add	r3, r3, r0
	add	r3, r3, r1
	add	r3, r7, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	addne	ip, ip, r2
	strne	ip, [r4, #12]
.L96:
	ldr	r3, [r5]
	sub	r1, r1, r3
	str	r1, [r4]
	ldr	r3, [r6]
	sub	ip, ip, r3
	str	ip, [r4, #4]
	pop	{r4, r5, r6, r7, r8, lr}
	b	animatePlayer
.L79:
	cmp	ip, #0
	beq	.L89
	ldr	r2, .L145+12
	ldrh	r2, [r2]
	ands	r2, r2, #256
	bne	.L89
.L140:
	cmp	r3, #0
	bne	.L90
	mov	r1, #1
	ldr	r2, .L145+20
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
	b	.L91
.L70:
	mov	r3, #0
	str	r3, [r4, #44]
	b	.L72
.L95:
	sub	r2, ip, r2
	add	r3, r1, r2, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r7, r3]
	cmp	r3, #0
	lsl	r3, r2, #9
	beq	.L96
	ldr	r0, [r4, #28]
	add	r3, r3, r0
	add	r3, r3, r1
	add	r3, r7, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	movne	ip, r2
	strne	r2, [r4, #12]
	b	.L96
.L86:
	mov	r2, #90
	b	.L93
.L138:
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
	ldr	r2, .L145+24
	cmp	r3, r2
	bgt	.L61
	ldr	r2, [r4]
	cmp	r2, #60
	ldrgt	r2, [r4, #16]
	addgt	r3, r2, r3
	strgt	r3, [r5]
	b	.L61
.L75:
	cmp	r3, #9
	ble	.L137
	bl	playerAttack
	mov	r3, #1
	ldrh	ip, [r8]
	b	.L74
.L139:
	ldr	r1, [r4, #12]
	sub	r2, r3, #1
	add	r0, r2, r1, lsl #9
	lsl	r0, r0, #1
	ldrh	r0, [r7, r0]
	cmp	r0, #0
	beq	.L67
	ldr	r0, [r4, #24]
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, lsl #9
	lsl	r2, r2, #1
	ldrh	r2, [r7, r2]
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
.L83:
	cmp	r3, #3
	beq	.L141
	cmp	r3, #2
	beq	.L142
	cmp	r3, #1
	bne	.L84
	ldr	r1, .L145+20
	str	r3, [r4, #60]
	str	r0, [r4, #56]
	str	r0, [r1, #420]
	str	r0, [r1, #428]
	str	r0, [r1, #496]
	str	r0, [r1, #504]
	str	r0, [r1, #572]
	str	r0, [r1, #580]
	str	r0, [r1, #648]
	str	r0, [r1, #656]
	str	r0, [r1, #724]
	str	r0, [r1, #732]
	str	r3, [r1, #40]
	str	r3, [r1, #48]
	b	.L84
.L90:
	cmp	r3, #1
	beq	.L143
	cmp	r3, #2
	beq	.L144
	cmp	r3, #3
	bne	.L91
	mov	r0, #1
	ldr	r1, .L145+20
	str	r3, [r4, #60]
	str	r2, [r4, #56]
	str	r0, [r1, #40]
	str	r2, [r1, #876]
	str	r2, [r1, #884]
	str	r0, [r1, #48]
	b	.L91
.L143:
	mov	r0, #2
	ldr	r1, .L145+20
	str	r3, [r4, #60]
	str	r0, [r4, #56]
	str	r2, [r1, #420]
	str	r2, [r1, #428]
	str	r2, [r1, #496]
	str	r2, [r1, #504]
	str	r2, [r1, #572]
	str	r2, [r1, #580]
	str	r2, [r1, #648]
	str	r2, [r1, #656]
	str	r2, [r1, #724]
	str	r2, [r1, #732]
	str	r3, [r1, #800]
	mov	r2, #90
	str	r3, [r1, #808]
	b	.L93
.L141:
	mov	lr, #1
	mov	r8, #2
	ldr	r1, .L145+20
	cmp	ip, #0
	str	r3, [r4, #60]
	str	r8, [r4, #56]
	str	lr, [r1, #800]
	str	r0, [r1, #876]
	str	r0, [r1, #884]
	str	lr, [r1, #808]
	beq	.L86
	tst	r2, #256
	bne	.L86
.L87:
	mov	r2, #0
	mov	r3, #1
	mov	ip, #2
	mov	r0, #3
	str	r2, [r1, #800]
	str	r2, [r1, #808]
	str	ip, [r4, #60]
	str	r0, [r4, #56]
	str	r3, [r1, #876]
	str	r3, [r1, #884]
	b	.L91
.L142:
	mov	lr, #1
	ldr	r1, .L145+20
	str	r3, [r4, #60]
	str	lr, [r4, #56]
	str	lr, [r1, #420]
	str	r0, [r1, #800]
	str	r0, [r1, #808]
	str	lr, [r1, #428]
	b	.L84
.L144:
	ldr	r1, .L145+20
	b	.L87
.L146:
	.align	2
.L145:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	bees
	.word	allBalloons
	.word	270
	.size	updatePlayer, .-updatePlayer
	.comm	player,92,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

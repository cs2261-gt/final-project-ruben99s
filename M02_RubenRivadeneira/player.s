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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHearts.part.0, %function
drawHearts.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0]
	ldr	r3, [r0, #12]
	ldr	r1, [r0, #16]
	ldr	ip, .L4
	lsl	r2, r2, #23
	str	lr, [sp, #-4]!
	add	r3, r3, #13
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	lsr	r2, r2, #23
	lsl	r0, r3, #3
	orr	r2, r2, #16384
	add	r3, ip, r3, lsl #3
	add	r1, r1, #960
	strh	lr, [ip, r0]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	shadowOAM
	.size	drawHearts.part.0, .-drawHearts.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #212
	mov	r6, #10
	mov	r7, #2
	mov	r10, #30
	mov	r9, #20
	mov	r8, #112
	mov	r2, #0
	mov	lr, #4
	mov	ip, #100
	mov	r4, #7
	ldr	r5, .L12
	str	r10, [r5, #24]
	str	r9, [r5, #28]
	str	r8, [r5, #36]
	str	r7, [r5, #16]
	str	r7, [r5, #20]
	str	r6, [r5, #8]
	str	r6, [r5, #32]
	str	r3, [r5, #12]
	str	r3, [r5, #40]
	ldr	r3, [r0]
	sub	r3, r6, r3
	str	r3, [r5]
	ldr	r1, [r1]
	ldr	r3, .L12+4
	rsb	r1, r1, #212
	mov	r0, lr
	str	r1, [r5, #4]
	str	ip, [r5, #68]
	mov	r1, ip
	str	lr, [r5, #60]
	mov	ip, r4
	str	lr, [r5, #88]
	str	r4, [r3, #8]
	mov	lr, #1
	mov	r4, #5
	str	r2, [r5, #44]
	str	r2, [r5, #48]
	str	r2, [r5, #52]
	str	r2, [r5, #56]
	str	r2, [r5, #64]
	str	r2, [r5, #72]
	str	r2, [r5, #84]
	str	r2, [r5, #76]
	str	r2, [r3, #12]
	b	.L7
.L9:
	tst	r2, #1
	movne	r0, #6
	moveq	r0, #4
	str	r2, [r3, #36]
	str	ip, [r3, #32]
	add	r1, r1, #7
	add	r3, r3, #24
.L7:
	add	r2, r2, #1
	cmp	r2, #20
	stm	r3, {r1, r4}
	str	r0, [r3, #16]
	str	lr, [r3, #20]
	bne	.L9
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	player
	.word	healthMeter
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
	ldr	r4, .L36
	ldr	r3, .L36+4
	ldr	r5, [r4, #72]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #76]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #80]
	str	r1, [r4, #76]
	bne	.L15
	ldr	r0, [r4, #84]
	ldr	r3, .L36+8
	ldr	r1, [r4, #88]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #84]
.L15:
	ldr	r3, .L36+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	moveq	r1, #1
	ldreq	r2, .L36+16
	streq	r3, [r2]
	ldr	r2, .L36+12
	ldrh	r3, [r2, #48]
	streq	r1, [r4, #76]
	ands	r3, r3, #16
	bne	.L17
	mov	r0, #1
	ldrh	r2, [r2, #48]
	ldr	r1, .L36+16
	tst	r2, #64
	str	r0, [r1]
	str	r3, [r4, #76]
	beq	.L18
.L19:
	ldr	r3, .L36+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	beq	.L22
	ldr	r3, [r4, #76]
.L23:
	cmp	r3, #4
	bne	.L25
	mov	r3, #0
	str	r6, [r4, #76]
	str	r3, [r4, #84]
	str	r3, [r4, #72]
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	ldr	r2, .L36+16
	ldr	r2, [r2]
	cmp	r2, #1
	moveq	r2, #5
	streq	r3, [r4, #76]
	streq	r2, [r4, #84]
	beq	.L25
	cmp	r2, #0
	bne	.L35
	mov	r2, #1
	mov	r3, #5
	str	r2, [r4, #76]
	str	r3, [r4, #84]
.L25:
	add	r5, r5, #1
	str	r5, [r4, #72]
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	ldrh	r3, [r2, #48]
	tst	r3, #64
	bne	.L19
	ldr	r3, .L36+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L18
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #76]
.L20:
	mov	r3, #4
	str	r3, [r4, #84]
	b	.L19
.L18:
	mov	r3, #0
	str	r3, [r4, #76]
	b	.L20
.L35:
	mov	r2, #5
	ldr	r3, [r4, #76]
	str	r2, [r4, #84]
	b	.L23
.L37:
	.align	2
.L36:
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
	ldr	r1, .L46
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, [r1, #84]
	ldr	r2, [r1, #76]
	push	{r4, r5, r6, r7, r8, lr}
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	ldr	r6, .L46+4
	ldr	r4, .L46+8
	add	r2, r2, r0, lsl #5
	lsl	r2, r2, #2
	mov	r7, #512
	strh	r3, [r6, #2]	@ movhi
	strh	r1, [r6]	@ movhi
	strh	r2, [r6, #4]	@ movhi
	add	r5, r4, #480
	b	.L41
.L45:
	mov	r0, r4
	add	r4, r4, #24
	bl	drawHearts.part.0
	cmp	r4, r5
	beq	.L44
.L41:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L45
	ldr	r3, [r4, #12]
	add	r4, r4, #24
	add	r3, r6, r3, lsl #3
	cmp	r4, r5
	strh	r7, [r3, #104]	@ movhi
	bne	.L41
.L44:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	player
	.word	shadowOAM
	.word	healthMeter
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
	ldr	r3, .L72
	ldr	r3, [r3, #56]
	cmp	r3, #0
	bne	.L49
	ldr	ip, .L72+4
	mov	r2, ip
.L52:
	ldr	r1, [r2, #40]
	cmp	r1, #0
	beq	.L50
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L70
.L50:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #76
	bne	.L52
	bx	lr
.L49:
	cmp	r3, #1
	bxne	lr
	ldr	ip, .L72+4
	mov	r1, #5
	mov	r2, ip
.L54:
	ldr	r0, [r2, #420]
	cmp	r0, #0
	beq	.L53
	ldr	r3, [r2, #428]
	cmp	r3, #0
	bne	.L71
.L53:
	add	r1, r1, #1
	cmp	r1, #10
	add	r2, r2, #76
	bne	.L54
	bx	lr
.L70:
	mov	r2, #0
	add	r1, r3, r3, lsl #3
	add	r3, r3, r1, lsl #1
	add	r3, ip, r3, lsl #2
	str	r2, [r3, #48]
	bx	lr
.L71:
	mov	r3, #0
	add	r2, r1, r1, lsl #3
	add	r1, r1, r2, lsl #1
	add	r1, ip, r1, lsl #2
	str	r3, [r1, #48]
	bx	lr
.L73:
	.align	2
.L72:
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
	ldr	r3, .L159
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L159+4
	ldrh	r3, [r3, #48]
	ldr	ip, [r4, #8]
	tst	r3, #16
	mov	r5, r1
	mov	r6, r2
	str	ip, [r4, #32]
	bne	.L76
	ldr	r3, [r4, #28]
	add	r3, ip, r3
	cmp	r3, #500
	ble	.L147
.L76:
	ldr	r3, .L159
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L80
	ldr	r3, [r4, #8]
	cmp	r3, #5
	bgt	.L148
.L80:
	ldr	r3, .L159
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
	ldr	r3, .L159
	ldrh	r3, [r3, #48]
	streq	r2, [r4, #24]
	strne	r2, [r4, #48]
	ands	r3, r3, #64
	ldr	r2, [r4, #12]
	bne	.L85
	ldr	r1, [r4, #36]
	cmp	r1, r2
	blt	.L86
	ldr	r1, [r4, #56]
	cmp	r1, #2
	str	r3, [r4, #44]
	beq	.L87
.L157:
	mov	r3, #150
	ldr	ip, [r4, #20]
	str	r3, [r4, #36]
	ldr	r1, [r4, #8]
.L92:
	ldr	r3, [r4, #24]
	add	r3, r2, r3
	sub	r3, r3, #1
	add	r3, r3, ip
	add	lr, r1, r3, lsl #9
	lsl	lr, lr, #1
	ldrh	lr, [r0, lr]
	cmp	lr, #0
	lsl	r3, r3, #9
	beq	.L94
	ldr	lr, [r4, #28]
	add	r3, r3, lr
	add	r3, r3, r1
	add	r3, r0, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	addne	r2, r2, ip
	strne	r2, [r4, #12]
.L94:
	ldr	r7, .L159+8
	ldrh	r0, [r7]
	tst	r0, #1
	ldr	r3, [r4, #52]
	beq	.L144
	ldr	r2, .L159+12
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L144
	cmp	r3, #9
	bgt	.L98
.L144:
	add	r3, r3, #1
.L96:
	tst	r0, #2
	str	r3, [r4, #52]
	beq	.L102
	ldr	r3, .L159+12
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L102
	mov	lr, #1
	ldr	r3, .L159+16
	add	ip, r3, #1088
	add	ip, ip, #4
.L104:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L103
	ldr	r2, [r3]
	cmp	r2, #239
	strls	lr, [r3, #52]
.L103:
	add	r3, r3, #84
	cmp	r3, ip
	bne	.L104
.L102:
	tst	r0, #512
	beq	.L101
	ldr	r3, .L159+12
	ldrh	r3, [r3]
	ands	r3, r3, #512
	bne	.L101
	ldr	r2, [r4, #56]
	cmp	r2, #0
	beq	.L149
	cmp	r2, #3
	beq	.L150
	cmp	r2, #2
	beq	.L151
	cmp	r2, #1
	beq	.L152
.L101:
	tst	r0, #256
	beq	.L108
	ldr	r3, .L159+12
	ldrh	r3, [r3]
	ands	r3, r3, #256
	bne	.L108
	ldr	r2, [r4, #56]
	cmp	r2, #0
	beq	.L153
	cmp	r2, #1
	beq	.L154
	cmp	r2, #2
	beq	.L155
	cmp	r2, #3
	beq	.L156
.L108:
	ldr	r3, [r5]
	sub	r1, r1, r3
	str	r1, [r4]
	ldr	r3, [r4, #12]
	ldr	r2, [r6]
	sub	r3, r3, r2
	str	r3, [r4, #4]
	pop	{r4, r5, r6, r7, r8, lr}
	b	animatePlayer
.L85:
	mov	r3, #0
	ldr	r1, [r4, #56]
	cmp	r1, #2
	str	r3, [r4, #44]
	bne	.L157
.L87:
	mov	r3, #90
	ldr	ip, [r4, #20]
	str	r3, [r4, #36]
	ldr	r1, [r4, #8]
	b	.L92
.L148:
	ldr	r1, [r4, #12]
	sub	r2, r3, #1
	add	ip, r2, r1, lsl #9
	lsl	ip, ip, #1
	ldrh	ip, [r0, ip]
	cmp	ip, #0
	beq	.L82
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
.L82:
	ldr	r3, [r5]
	cmp	r3, #0
	ble	.L80
	ldr	r2, [r4]
	cmp	r2, #59
	ldrle	r2, [r4, #16]
	suble	r3, r3, r2
	strle	r3, [r5]
	b	.L80
.L147:
	ldr	r2, [r4, #12]
	add	r1, r3, r2, lsl #9
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	cmp	r1, #0
	beq	.L78
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
.L78:
	ldr	r3, [r5]
	ldr	r2, .L159+20
	cmp	r3, r2
	bgt	.L76
	ldr	r2, [r4]
	cmp	r2, #60
	ldrgt	r2, [r4, #16]
	addgt	r3, r2, r3
	strgt	r3, [r5]
	b	.L76
.L86:
	mov	r3, #1
	ldr	r1, [r4, #56]
	cmp	r1, #2
	str	r3, [r4, #44]
	beq	.L158
	mov	r1, #150
	ldr	r3, [r4, #20]
	str	r1, [r4, #36]
	ldr	r1, [r4, #8]
.L93:
	sub	r2, r2, r3
	add	r3, r1, r2, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r0, r3]
	cmp	r3, #0
	lsl	r3, r2, #9
	beq	.L94
	ldr	ip, [r4, #28]
	add	r3, r3, ip
	add	r3, r3, r1
	add	r3, r0, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	strne	r2, [r4, #12]
	b	.L94
.L149:
	mov	ip, #1
	mov	lr, #3
	ldr	r3, .L159+24
	str	r2, [r4, #60]
	str	lr, [r4, #56]
	str	ip, [r3, #876]
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	str	r2, [r3, #116]
	str	r2, [r3, #124]
	str	r2, [r3, #192]
	str	r2, [r3, #200]
	str	r2, [r3, #268]
	str	r2, [r3, #276]
	str	r2, [r3, #344]
	str	r2, [r3, #352]
	str	ip, [r3, #884]
	b	.L101
.L153:
	mov	r0, #1
	ldr	r3, .L159+24
	str	r2, [r4, #60]
	str	r0, [r4, #56]
	str	r0, [r3, #420]
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	str	r2, [r3, #116]
	str	r2, [r3, #124]
	str	r2, [r3, #192]
	str	r2, [r3, #200]
	str	r2, [r3, #268]
	str	r2, [r3, #276]
	str	r2, [r3, #344]
	str	r2, [r3, #352]
	str	r0, [r3, #428]
	b	.L108
.L158:
	mov	r1, #90
	ldr	r3, [r4, #20]
	str	r1, [r4, #36]
	ldr	r1, [r4, #8]
	b	.L93
.L98:
	bl	playerAttack
	mov	r3, #1
	ldrh	r0, [r7]
	ldr	r1, [r4, #8]
	b	.L96
.L156:
	mov	ip, #1
	ldr	r0, .L159+24
	str	r2, [r4, #60]
	str	r3, [r4, #56]
	str	ip, [r0, #40]
	str	r3, [r0, #876]
	str	r3, [r0, #884]
	str	ip, [r0, #48]
	b	.L108
.L152:
	ldr	ip, .L159+24
	str	r2, [r4, #60]
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
	str	r2, [ip, #40]
	str	r2, [ip, #48]
	b	.L101
.L154:
	mov	ip, #2
	ldr	r0, .L159+24
	str	r2, [r4, #60]
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
	str	r2, [r0, #800]
	str	r2, [r0, #808]
	b	.L108
.L150:
	mov	ip, #1
	mov	lr, #2
	str	r2, [r4, #60]
	ldr	r2, .L159+24
	str	lr, [r4, #56]
	str	ip, [r2, #800]
	str	r3, [r2, #876]
	str	r3, [r2, #884]
	str	ip, [r2, #808]
	b	.L101
.L155:
	mov	r0, #1
	mov	ip, #3
	str	r2, [r4, #60]
	ldr	r2, .L159+24
	str	ip, [r4, #56]
	str	r0, [r2, #876]
	str	r3, [r2, #800]
	str	r3, [r2, #808]
	str	r0, [r2, #884]
	b	.L108
.L151:
	mov	lr, #1
	ldr	ip, .L159+24
	str	r2, [r4, #60]
	str	lr, [r4, #56]
	str	lr, [ip, #420]
	str	r3, [ip, #800]
	str	r3, [ip, #808]
	str	lr, [ip, #428]
	b	.L101
.L160:
	.align	2
.L159:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	bees
	.word	270
	.word	allBalloons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	initHearts
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHearts, %function
initHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	mov	ip, #7
	ldr	r3, .L167
	push	{r4, lr}
	mov	r2, r1
	str	r1, [r3, #12]
	mov	r0, #4
	mov	r1, #100
	mov	r4, #5
	mov	lr, #1
	str	ip, [r3, #8]
	b	.L162
.L164:
	tst	r2, #1
	movne	r0, #6
	moveq	r0, #4
	str	r2, [r3, #36]
	str	ip, [r3, #32]
	add	r1, r1, #7
	add	r3, r3, #24
.L162:
	add	r2, r2, #1
	cmp	r2, #20
	stm	r3, {r1, r4}
	str	r0, [r3, #16]
	str	lr, [r3, #20]
	bne	.L164
	pop	{r4, lr}
	bx	lr
.L168:
	.align	2
.L167:
	.word	healthMeter
	.size	initHearts, .-initHearts
	.align	2
	.global	drawHearts
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHearts, %function
drawHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #20]
	cmp	r2, #0
	bne	drawHearts.part.0
.L170:
	mov	r2, #512
	ldr	r1, [r0, #12]
	ldr	r3, .L171
	add	r3, r3, r1, lsl #3
	strh	r2, [r3, #104]	@ movhi
	bx	lr
.L172:
	.align	2
.L171:
	.word	shadowOAM
	.size	drawHearts, .-drawHearts
	.align	2
	.global	updateHearts
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHearts, %function
updateHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L180
	ldr	r3, [r3, #68]
	cmp	r3, #100
	bxeq	lr
	ldr	r2, .L180+4
	smull	r1, r2, r3, r2
	asr	r3, r3, #31
	sub	r2, r3, r2, asr #1
	add	r3, r2, #20
	ldr	r1, .L180+8
	cmp	r3, #0
	str	r3, [r1]
	bxle	lr
	mov	r0, #0
	ldr	r3, .L180+12
	add	r2, r2, r2, lsl #1
	add	r1, r3, #480
	add	r2, r1, r2, lsl #3
.L175:
	str	r0, [r3, #20]
	add	r3, r3, #24
	cmp	r3, r2
	bne	.L175
	bx	lr
.L181:
	.align	2
.L180:
	.word	player
	.word	1717986919
	.word	.LANCHOR0
	.word	healthMeter
	.size	updateHearts, .-updateHearts
	.global	lostHearts
	.comm	healthMeter,480,4
	.comm	player,92,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	lostHearts, %object
	.size	lostHearts, 4
lostHearts:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

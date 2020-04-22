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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #212
	mov	r4, #10
	mov	r5, #2
	mov	r8, #30
	mov	r7, #20
	mov	r6, #112
	mov	lr, #0
	ldr	ip, .L15
	str	r8, [ip, #24]
	str	r7, [ip, #28]
	str	r6, [ip, #36]
	str	r5, [ip, #16]
	str	r5, [ip, #20]
	str	r4, [ip, #8]
	str	r4, [ip, #32]
	str	r3, [ip, #12]
	str	r3, [ip, #40]
	ldr	r3, [r0]
	sub	r3, r4, r3
	str	r3, [ip]
	ldr	r3, [r1]
	cmp	r2, #0
	rsb	r3, r3, #212
	str	r3, [ip, #4]
	str	lr, [ip, #44]
	str	lr, [ip, #48]
	bne	.L11
	mov	r1, #100
	mov	lr, #7
	ldr	r3, .L15+4
	mov	r0, #4
	mov	r5, #5
	mov	r4, #1
	str	r1, [ip, #68]
	str	lr, [r3, #8]
	str	r2, [r3, #12]
	b	.L8
.L10:
	tst	r2, #1
	movne	r0, #6
	moveq	r0, #4
	str	r2, [r3, #36]
	str	lr, [r3, #32]
	add	r1, r1, #7
	add	r3, r3, #24
.L8:
	add	r2, r2, #1
	cmp	r2, #20
	stm	r3, {r1, r5}
	str	r0, [r3, #16]
	str	r4, [r3, #20]
	bne	.L10
.L11:
	mov	r3, #0
	mov	r2, #4
	str	r3, [ip, #52]
	str	r3, [ip, #56]
	str	r3, [ip, #64]
	str	r3, [ip, #72]
	str	r3, [ip, #84]
	str	r3, [ip, #76]
	str	r2, [ip, #60]
	str	r2, [ip, #88]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L16:
	.align	2
.L15:
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
	ldr	r4, .L39
	ldr	r3, .L39+4
	ldr	r5, [r4, #72]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #76]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #80]
	str	r1, [r4, #76]
	bne	.L18
	ldr	r0, [r4, #84]
	ldr	r3, .L39+8
	ldr	r1, [r4, #88]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #84]
.L18:
	ldr	r3, .L39+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	moveq	r1, #1
	ldreq	r2, .L39+16
	streq	r3, [r2]
	ldr	r2, .L39+12
	ldrh	r3, [r2, #48]
	streq	r1, [r4, #76]
	ands	r3, r3, #16
	bne	.L20
	mov	r0, #1
	ldrh	r2, [r2, #48]
	ldr	r1, .L39+16
	tst	r2, #64
	str	r0, [r1]
	str	r3, [r4, #76]
	beq	.L21
.L22:
	ldr	r3, .L39+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	beq	.L25
	ldr	r3, [r4, #76]
.L26:
	cmp	r3, #4
	bne	.L28
	mov	r3, #0
	str	r6, [r4, #76]
	str	r3, [r4, #84]
	str	r3, [r4, #72]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	ldr	r2, .L39+16
	ldr	r2, [r2]
	cmp	r2, #1
	moveq	r2, #5
	streq	r3, [r4, #76]
	streq	r2, [r4, #84]
	beq	.L28
	cmp	r2, #0
	bne	.L38
	mov	r2, #1
	mov	r3, #5
	str	r2, [r4, #76]
	str	r3, [r4, #84]
.L28:
	add	r5, r5, #1
	str	r5, [r4, #72]
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	ldrh	r3, [r2, #48]
	tst	r3, #64
	bne	.L22
	ldr	r3, .L39+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L21
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #76]
.L23:
	mov	r3, #4
	str	r3, [r4, #84]
	b	.L22
.L21:
	mov	r3, #0
	str	r3, [r4, #76]
	b	.L23
.L38:
	mov	r2, #5
	ldr	r3, [r4, #76]
	str	r2, [r4, #84]
	b	.L26
.L40:
	.align	2
.L39:
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
	ldr	r1, .L49
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, [r1, #84]
	ldr	r2, [r1, #76]
	push	{r4, r5, r6, r7, r8, lr}
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	ldr	r6, .L49+4
	ldr	r4, .L49+8
	add	r2, r2, r0, lsl #5
	lsl	r2, r2, #2
	mov	r7, #512
	strh	r3, [r6, #2]	@ movhi
	strh	r1, [r6]	@ movhi
	strh	r2, [r6, #4]	@ movhi
	add	r5, r4, #480
	b	.L44
.L48:
	mov	r0, r4
	add	r4, r4, #24
	bl	drawHearts.part.0
	cmp	r4, r5
	beq	.L47
.L44:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L48
	ldr	r3, [r4, #12]
	add	r4, r4, #24
	add	r3, r6, r3, lsl #3
	cmp	r4, r5
	strh	r7, [r3, #104]	@ movhi
	bne	.L44
.L47:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L50:
	.align	2
.L49:
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
	ldr	r3, .L101
	ldr	r3, [r3, #56]
	cmp	r3, #0
	bne	.L52
	ldr	ip, .L101+4
	mov	r2, ip
.L55:
	ldr	r1, [r2, #40]
	cmp	r1, #0
	beq	.L53
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L97
.L53:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #76
	bne	.L55
	bx	lr
.L52:
	cmp	r3, #1
	bne	.L98
	ldr	ip, .L101+4
	mov	r1, #5
	mov	r2, ip
.L60:
	ldr	r0, [r2, #420]
	cmp	r0, #0
	beq	.L58
	ldr	r3, [r2, #428]
	cmp	r3, #0
	bne	.L99
.L58:
	add	r1, r1, #1
	cmp	r1, #10
	add	r2, r2, #76
	bne	.L60
	bx	lr
.L98:
	cmp	r3, #3
	bxne	lr
	bics	r3, r0, #2
	beq	.L100
	cmp	r0, #1
	bxne	lr
.L67:
	mov	r0, #0
	ldr	r3, .L101+8
	add	r1, r3, #1136
	add	r1, r1, #4
.L66:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L65
	ldr	r2, [r3]
	cmp	r2, #239
	strls	r0, [r3, #56]
.L65:
	add	r3, r3, #76
	cmp	r1, r3
	bne	.L66
	bx	lr
.L100:
	mov	ip, r3
	ldr	r3, .L101+12
	add	r1, r3, #1088
	add	r1, r1, #4
.L63:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L62
	ldr	r2, [r3]
	cmp	r2, #239
	strls	ip, [r3, #60]
.L62:
	add	r3, r3, #84
	cmp	r3, r1
	bne	.L63
	cmp	r0, #1
	beq	.L67
	cmp	r0, #2
	moveq	r2, #0
	ldreq	r3, .L101+16
	streq	r2, [r3, #40]
	bx	lr
.L97:
	mov	r2, #0
	add	r1, r3, r3, lsl #3
	add	r3, r3, r1, lsl #1
	add	r3, ip, r3, lsl #2
	str	r2, [r3, #48]
	bx	lr
.L99:
	mov	r3, #0
	add	r2, r1, r1, lsl #3
	add	r1, r1, r2, lsl #1
	add	r1, ip, r1, lsl #2
	str	r3, [r1, #48]
	bx	lr
.L102:
	.align	2
.L101:
	.word	player
	.word	allBalloons
	.word	ants
	.word	bees
	.word	queenBee
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
	ldr	ip, .L188
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L188+4
	ldrh	ip, [ip, #48]
	ldr	lr, [r4, #8]
	tst	ip, #16
	mov	r5, r1
	mov	r6, r2
	str	lr, [r4, #32]
	bne	.L105
	ldr	r2, [r4, #28]
	add	r2, lr, r2
	cmp	r2, #500
	ble	.L176
.L105:
	ldr	r2, .L188
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L109
	ldr	r2, [r4, #8]
	cmp	r2, #5
	bgt	.L177
.L109:
	ldr	r2, .L188
	ldrh	r2, [r2, #48]
	tst	r2, #128
	movne	r2, #0
	moveq	r1, #1
	ldreq	r2, [r4, #32]
	strne	r2, [r4, #48]
	streq	r2, [r4, #8]
	ldr	r2, .L188
	ldrh	r2, [r2, #48]
	streq	r1, [r4, #48]
	ands	r2, r2, #64
	ldr	r1, [r4, #12]
	bne	.L114
	ldr	ip, [r4, #36]
	cmp	ip, r1
	blt	.L115
	ldr	ip, [r4, #56]
	cmp	ip, #2
	str	r2, [r4, #44]
	beq	.L116
.L186:
	mov	r2, #150
	ldr	lr, [r4, #20]
	str	r2, [r4, #36]
	ldr	r2, [r4, #8]
.L121:
	ldr	ip, [r4, #24]
	add	ip, r1, ip
	sub	ip, ip, #1
	add	ip, ip, lr
	add	r7, r2, ip, lsl #9
	lsl	r7, r7, #1
	ldrh	r7, [r0, r7]
	cmp	r7, #0
	lsl	ip, ip, #9
	beq	.L123
	ldr	r7, [r4, #28]
	add	ip, ip, r7
	add	ip, ip, r2
	add	ip, r0, ip, lsl #1
	ldrh	r0, [ip, #-2]
	cmp	r0, #0
	addne	r1, r1, lr
	strne	r1, [r4, #12]
.L123:
	ldr	r7, .L188+8
	ldrh	r0, [r7]
	tst	r0, #1
	ldr	r1, [r4, #52]
	beq	.L173
	ldr	ip, .L188+12
	ldrh	ip, [ip]
	tst	ip, #1
	bne	.L173
	cmp	r1, #9
	bgt	.L127
.L173:
	add	r1, r1, #1
.L125:
	tst	r0, #2
	str	r1, [r4, #52]
	beq	.L131
	ldr	r3, .L188+12
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L131
	mov	lr, #1
	ldr	r3, .L188+16
	add	ip, r3, #1088
	add	ip, ip, #4
.L133:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L132
	ldr	r1, [r3]
	cmp	r1, #239
	strls	lr, [r3, #52]
.L132:
	add	r3, r3, #84
	cmp	r3, ip
	bne	.L133
.L131:
	tst	r0, #512
	beq	.L130
	ldr	r3, .L188+12
	ldrh	r3, [r3]
	ands	r3, r3, #512
	bne	.L130
	ldr	r1, [r4, #56]
	cmp	r1, #0
	beq	.L178
	cmp	r1, #3
	beq	.L179
	cmp	r1, #2
	beq	.L180
	cmp	r1, #1
	beq	.L181
.L130:
	tst	r0, #256
	beq	.L137
	ldr	r3, .L188+12
	ldrh	r3, [r3]
	ands	r3, r3, #256
	bne	.L137
	ldr	r1, [r4, #56]
	cmp	r1, #0
	beq	.L182
	cmp	r1, #1
	beq	.L183
	cmp	r1, #2
	beq	.L184
	cmp	r1, #3
	beq	.L185
.L137:
	ldr	r3, [r5]
	sub	r2, r2, r3
	str	r2, [r4]
	ldr	r3, [r4, #12]
	ldr	r2, [r6]
	sub	r3, r3, r2
	str	r3, [r4, #4]
	pop	{r4, r5, r6, r7, r8, lr}
	b	animatePlayer
.L114:
	mov	r2, #0
	ldr	ip, [r4, #56]
	cmp	ip, #2
	str	r2, [r4, #44]
	bne	.L186
.L116:
	mov	r2, #90
	ldr	lr, [r4, #20]
	str	r2, [r4, #36]
	ldr	r2, [r4, #8]
	b	.L121
.L177:
	ldr	ip, [r4, #12]
	sub	r1, r2, #1
	add	lr, r1, ip, lsl #9
	lsl	lr, lr, #1
	ldrh	lr, [r0, lr]
	cmp	lr, #0
	beq	.L111
	ldr	lr, [r4, #24]
	add	ip, ip, lr
	sub	ip, ip, #1
	add	r1, r1, ip, lsl #9
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	cmp	r1, #0
	ldrne	r1, [r4, #16]
	subne	r2, r2, r1
	strne	r2, [r4, #8]
.L111:
	ldr	r2, [r5]
	cmp	r2, #0
	ble	.L109
	ldr	r1, [r4]
	cmp	r1, #59
	ldrle	r1, [r4, #16]
	suble	r2, r2, r1
	strle	r2, [r5]
	b	.L109
.L176:
	ldr	r1, [r4, #12]
	add	ip, r2, r1, lsl #9
	lsl	ip, ip, #1
	ldrh	ip, [r0, ip]
	cmp	ip, #0
	beq	.L107
	ldr	ip, [r4, #24]
	add	r1, r1, ip
	sub	r1, r1, #1
	add	r2, r2, r1, lsl #9
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	ldrne	r2, [r4, #16]
	addne	lr, r2, lr
	strne	lr, [r4, #8]
.L107:
	ldr	r2, [r5]
	ldr	r1, .L188+20
	cmp	r2, r1
	bgt	.L105
	ldr	r1, [r4]
	cmp	r1, #60
	ldrgt	r1, [r4, #16]
	addgt	r2, r1, r2
	strgt	r2, [r5]
	b	.L105
.L115:
	mov	r2, #1
	ldr	ip, [r4, #56]
	cmp	ip, #2
	str	r2, [r4, #44]
	beq	.L187
	mov	r2, #150
	ldr	ip, [r4, #20]
	str	r2, [r4, #36]
	ldr	r2, [r4, #8]
.L122:
	sub	r1, r1, ip
	add	ip, r2, r1, lsl #9
	lsl	ip, ip, #1
	ldrh	ip, [r0, ip]
	cmp	ip, #0
	lsl	ip, r1, #9
	beq	.L123
	ldr	lr, [r4, #28]
	add	ip, ip, lr
	add	ip, ip, r2
	add	r0, r0, ip, lsl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	strne	r1, [r4, #12]
	b	.L123
.L178:
	mov	ip, #1
	mov	lr, #3
	ldr	r3, .L188+24
	str	r1, [r4, #60]
	str	lr, [r4, #56]
	str	ip, [r3, #876]
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
	str	ip, [r3, #884]
	b	.L130
.L182:
	mov	r0, #1
	ldr	r3, .L188+24
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
	b	.L137
.L187:
	mov	r2, #90
	ldr	ip, [r4, #20]
	str	r2, [r4, #36]
	ldr	r2, [r4, #8]
	b	.L122
.L127:
	mov	r0, r3
	bl	playerAttack
	mov	r1, #1
	ldrh	r0, [r7]
	ldr	r2, [r4, #8]
	b	.L125
.L185:
	mov	ip, #1
	ldr	r0, .L188+24
	str	r1, [r4, #60]
	str	r3, [r4, #56]
	str	ip, [r0, #40]
	str	r3, [r0, #876]
	str	r3, [r0, #884]
	str	ip, [r0, #48]
	b	.L137
.L181:
	ldr	ip, .L188+24
	str	r1, [r4, #60]
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
	str	r1, [ip, #40]
	str	r1, [ip, #48]
	b	.L130
.L183:
	mov	ip, #2
	ldr	r0, .L188+24
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
	b	.L137
.L179:
	mov	ip, #1
	mov	lr, #2
	str	r1, [r4, #60]
	ldr	r1, .L188+24
	str	lr, [r4, #56]
	str	ip, [r1, #800]
	str	r3, [r1, #876]
	str	r3, [r1, #884]
	str	ip, [r1, #808]
	b	.L130
.L184:
	mov	r0, #1
	mov	ip, #3
	str	r1, [r4, #60]
	ldr	r1, .L188+24
	str	ip, [r4, #56]
	str	r0, [r1, #876]
	str	r3, [r1, #800]
	str	r3, [r1, #808]
	str	r0, [r1, #884]
	b	.L137
.L180:
	mov	lr, #1
	ldr	ip, .L188+24
	str	r1, [r4, #60]
	str	lr, [r4, #56]
	str	lr, [ip, #420]
	str	r3, [ip, #800]
	str	r3, [ip, #808]
	str	lr, [ip, #428]
	b	.L130
.L189:
	.align	2
.L188:
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
	ldr	r3, .L196
	push	{r4, lr}
	mov	r2, r1
	str	r1, [r3, #12]
	mov	r0, #4
	mov	r1, #100
	mov	r4, #5
	mov	lr, #1
	str	ip, [r3, #8]
	b	.L191
.L193:
	tst	r2, #1
	movne	r0, #6
	moveq	r0, #4
	str	r2, [r3, #36]
	str	ip, [r3, #32]
	add	r1, r1, #7
	add	r3, r3, #24
.L191:
	add	r2, r2, #1
	cmp	r2, #20
	stm	r3, {r1, r4}
	str	r0, [r3, #16]
	str	lr, [r3, #20]
	bne	.L193
	pop	{r4, lr}
	bx	lr
.L197:
	.align	2
.L196:
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
.L199:
	mov	r2, #512
	ldr	r1, [r0, #12]
	ldr	r3, .L200
	add	r3, r3, r1, lsl #3
	strh	r2, [r3, #104]	@ movhi
	bx	lr
.L201:
	.align	2
.L200:
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
	ldr	r3, .L209
	ldr	r3, [r3, #68]
	cmp	r3, #100
	bxeq	lr
	ldr	r2, .L209+4
	smull	r1, r2, r3, r2
	asr	r3, r3, #31
	sub	r2, r3, r2, asr #1
	add	r3, r2, #20
	ldr	r1, .L209+8
	cmp	r3, #0
	str	r3, [r1]
	bxle	lr
	mov	r0, #0
	ldr	r3, .L209+12
	add	r2, r2, r2, lsl #1
	add	r1, r3, #480
	add	r2, r1, r2, lsl #3
.L204:
	str	r0, [r3, #20]
	add	r3, r3, #24
	cmp	r3, r2
	bne	.L204
	bx	lr
.L210:
	.align	2
.L209:
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

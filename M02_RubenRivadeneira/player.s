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
	mov	r3, #10
	mov	r6, #208
	mov	r4, #2
	mov	r9, #30
	mov	r8, #20
	mov	r7, #53248
	mov	r10, #108
	mov	r5, #0
	mov	lr, #1
	ldr	ip, .L15
	str	r9, [ip, #24]
	str	r8, [ip, #28]
	str	r7, [ip, #12]
	str	r10, [ip, #36]
	str	r6, [ip, #40]
	str	r4, [ip, #16]
	str	r4, [ip, #20]
	str	r3, [ip, #8]
	str	r3, [ip, #32]
	ldr	r3, [r0]
	rsb	r3, r3, #10
	str	r3, [ip]
	ldr	r3, [r1]
	cmp	r2, #0
	sub	r3, r6, r3
	str	r3, [ip, #4]
	str	r5, [ip, #48]
	str	lr, [ip, #44]
	bne	.L11
	mov	r1, #100
	mov	r4, #7
	ldr	r3, .L15+4
	mov	r0, #4
	mov	r5, #5
	str	r1, [ip, #68]
	str	r4, [r3, #8]
	str	r2, [r3, #12]
	b	.L8
.L10:
	tst	r2, #1
	movne	r0, #6
	moveq	r0, #4
	str	r2, [r3, #36]
	str	r4, [r3, #32]
	add	r1, r1, #7
	add	r3, r3, #24
.L8:
	add	r2, r2, #1
	cmp	r2, #20
	stm	r3, {r1, r5}
	str	r0, [r3, #16]
	str	lr, [r3, #20]
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
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
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
	ldr	ip, .L183
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L183+4
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
	ble	.L173
.L105:
	ldr	r2, .L183
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L109
	ldr	lr, [r4, #8]
	cmp	lr, #5
	bgt	.L174
.L109:
	ldr	r2, .L183
	ldrh	r2, [r2, #48]
	tst	r2, #128
	moveq	r2, #1
	movne	r2, #0
	ldreq	lr, [r4, #32]
	streq	r2, [r4, #48]
	strne	r2, [r4, #48]
	ldr	r2, [r4, #20]
	ldrne	lr, [r4, #8]
	ldr	r1, [r4, #12]
	streq	lr, [r4, #8]
	cmp	r2, #500
	addlt	r2, r2, #100
	ldr	ip, [r4, #24]
	strlt	r2, [r4, #20]
	add	r2, r2, r1
	add	ip, ip, r2, asr #8
	sub	ip, ip, #1
	add	r1, lr, ip, lsl #9
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	cmp	r1, #0
	lsl	ip, ip, #9
	beq	.L115
	ldr	r1, [r4, #28]
	add	lr, lr, r1
	add	ip, lr, ip
	add	ip, r0, ip, lsl #1
	ldrh	r1, [ip, #-2]
	cmp	r1, #0
	strne	r2, [r4, #12]
	beq	.L115
.L116:
	ldr	r7, .L183+8
	ldrh	r2, [r7]
	tst	r2, #64
	beq	.L171
	ldr	r1, .L183+12
	ldrh	r1, [r1]
	tst	r1, #64
	beq	.L167
.L171:
	ldr	lr, .L183+16
.L117:
	ldr	r0, [r4, #56]
	ldr	ip, .L183+20
	sub	r0, r0, #2
	cmp	r0, #1
	ldr	r1, .L183+24
	movhi	r1, ip
	tst	r2, #1
	str	r1, [lr]
	ldr	r1, [r4, #52]
	beq	.L172
	ldr	r0, .L183+12
	ldrh	r0, [r0]
	tst	r0, #1
	beq	.L121
.L172:
	add	r1, r1, #1
.L120:
	tst	r2, #2
	str	r1, [r4, #52]
	beq	.L126
	ldr	r3, .L183+12
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L126
	mov	ip, #1
	ldr	r3, .L183+28
	add	r1, r3, #1088
	add	r1, r1, #4
.L128:
	ldr	r0, [r3, #32]
	cmp	r0, #0
	beq	.L127
	ldr	r0, [r3]
	cmp	r0, #239
	strls	ip, [r3, #52]
.L127:
	add	r3, r3, #84
	cmp	r3, r1
	bne	.L128
.L126:
	tst	r2, #512
	beq	.L125
	ldr	r3, .L183+12
	ldrh	r3, [r3]
	ands	r3, r3, #512
	beq	.L175
.L125:
	tst	r2, #256
	beq	.L132
	ldr	r3, .L183+12
	ldrh	r3, [r3]
	ands	r3, r3, #256
	bne	.L132
	ldr	r2, [r4, #56]
	cmp	r2, #0
	beq	.L176
	cmp	r2, #1
	beq	.L177
	cmp	r2, #2
	beq	.L178
	cmp	r2, #3
	beq	.L179
.L132:
	ldr	r2, [r5]
	ldr	r3, [r4, #8]
	sub	r3, r3, r2
	str	r3, [r4]
	ldr	r2, [r4, #12]
	ldr	r3, [r6]
	rsb	r3, r3, r2, asr #8
	str	r3, [r4, #4]
	pop	{r4, r5, r6, r7, r8, lr}
	b	animatePlayer
.L115:
	mov	r2, #0
	str	r2, [r4, #20]
	str	r2, [r4, #44]
	b	.L116
.L175:
	ldr	r1, [r4, #56]
	cmp	r1, #0
	beq	.L180
	cmp	r1, #3
	beq	.L181
	cmp	r1, #2
	beq	.L182
	cmp	r1, #1
	bne	.L125
	ldr	r0, .L183+32
	str	r1, [r4, #60]
	str	r3, [r4, #56]
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
	str	r1, [r0, #40]
	str	r1, [r0, #48]
	b	.L125
.L121:
	cmp	r1, #9
	ble	.L172
	mov	r0, r3
	bl	playerAttack
	mov	r1, #1
	ldrh	r2, [r7]
	b	.L120
.L167:
	ldr	r1, [r4, #44]
	cmp	r1, #0
	bne	.L171
	mov	r0, #1
	ldr	lr, .L183+16
	ldr	r1, [r4, #20]
	ldr	ip, [lr]
	sub	r1, r1, ip
	str	r1, [r4, #20]
	str	r0, [r4, #44]
	b	.L117
.L174:
	ldr	r2, [r4, #12]
	sub	r1, lr, #1
	asr	r2, r2, #8
	add	ip, r1, r2, lsl #9
	lsl	ip, ip, #1
	ldrh	ip, [r0, ip]
	cmp	ip, #0
	beq	.L111
	ldr	ip, [r4, #24]
	add	r2, r2, ip
	sub	r2, r2, #1
	add	r2, r1, r2, lsl #9
	lsl	r1, r2, #1
	ldrh	r2, [r0, r1]
	cmp	r2, #0
	ldrne	r2, [r4, #16]
	subne	r2, lr, r2
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
.L173:
	ldr	r1, [r4, #12]
	asr	r1, r1, #8
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
	ldr	r1, .L183+36
	cmp	r2, r1
	bgt	.L105
	ldr	r1, [r4]
	cmp	r1, #60
	ldrgt	r1, [r4, #16]
	addgt	r2, r1, r2
	strgt	r2, [r5]
	b	.L105
.L180:
	mov	r0, #1
	mov	ip, #3
	ldr	r3, .L183+32
	str	r1, [r4, #60]
	str	ip, [r4, #56]
	str	r0, [r3, #876]
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
	str	r0, [r3, #884]
	b	.L125
.L176:
	mov	r1, #1
	ldr	r3, .L183+32
	str	r2, [r4, #60]
	str	r1, [r4, #56]
	str	r1, [r3, #420]
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
	str	r1, [r3, #428]
	b	.L132
.L179:
	mov	r0, #1
	ldr	r1, .L183+32
	str	r2, [r4, #60]
	str	r3, [r4, #56]
	str	r0, [r1, #40]
	str	r3, [r1, #876]
	str	r3, [r1, #884]
	str	r0, [r1, #48]
	b	.L132
.L177:
	mov	r0, #2
	ldr	r1, .L183+32
	str	r2, [r4, #60]
	str	r0, [r4, #56]
	str	r3, [r1, #420]
	str	r3, [r1, #428]
	str	r3, [r1, #496]
	str	r3, [r1, #504]
	str	r3, [r1, #572]
	str	r3, [r1, #580]
	str	r3, [r1, #648]
	str	r3, [r1, #656]
	str	r3, [r1, #724]
	str	r3, [r1, #732]
	str	r2, [r1, #800]
	str	r2, [r1, #808]
	b	.L132
.L181:
	mov	r0, #1
	mov	ip, #2
	str	r1, [r4, #60]
	ldr	r1, .L183+32
	str	ip, [r4, #56]
	str	r0, [r1, #800]
	str	r3, [r1, #876]
	str	r3, [r1, #884]
	str	r0, [r1, #808]
	b	.L125
.L178:
	mov	r1, #1
	mov	r0, #3
	str	r2, [r4, #60]
	ldr	r2, .L183+32
	str	r0, [r4, #56]
	str	r1, [r2, #876]
	str	r3, [r2, #800]
	str	r3, [r2, #808]
	str	r1, [r2, #884]
	b	.L132
.L182:
	mov	ip, #1
	ldr	r0, .L183+32
	str	r1, [r4, #60]
	str	ip, [r4, #56]
	str	ip, [r0, #420]
	str	r3, [r0, #800]
	str	r3, [r0, #808]
	str	ip, [r0, #428]
	b	.L125
.L184:
	.align	2
.L183:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	1500
	.word	2200
	.word	bees
	.word	allBalloons
	.word	270
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
	ldr	r3, .L191
	push	{r4, lr}
	mov	r2, r1
	str	r1, [r3, #12]
	mov	r0, #4
	mov	r1, #100
	mov	r4, #5
	mov	lr, #1
	str	ip, [r3, #8]
	b	.L186
.L188:
	tst	r2, #1
	movne	r0, #6
	moveq	r0, #4
	str	r2, [r3, #36]
	str	ip, [r3, #32]
	add	r1, r1, #7
	add	r3, r3, #24
.L186:
	add	r2, r2, #1
	cmp	r2, #20
	stm	r3, {r1, r4}
	str	r0, [r3, #16]
	str	lr, [r3, #20]
	bne	.L188
	pop	{r4, lr}
	bx	lr
.L192:
	.align	2
.L191:
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
.L194:
	mov	r2, #512
	ldr	r1, [r0, #12]
	ldr	r3, .L195
	add	r3, r3, r1, lsl #3
	strh	r2, [r3, #104]	@ movhi
	bx	lr
.L196:
	.align	2
.L195:
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
	ldr	r3, .L204
	ldr	r3, [r3, #68]
	cmp	r3, #100
	bxeq	lr
	ldr	r2, .L204+4
	smull	r1, r2, r3, r2
	asr	r3, r3, #31
	sub	r2, r3, r2, asr #1
	add	r3, r2, #20
	ldr	r1, .L204+8
	cmp	r3, #0
	str	r3, [r1]
	bxle	lr
	mov	r0, #0
	ldr	r3, .L204+12
	add	r2, r2, r2, lsl #1
	add	r1, r3, #480
	add	r2, r1, r2, lsl #3
.L199:
	str	r0, [r3, #20]
	add	r3, r3, #24
	cmp	r3, r2
	bne	.L199
	bx	lr
.L205:
	.align	2
.L204:
	.word	player
	.word	1717986919
	.word	.LANCHOR1
	.word	healthMeter
	.size	updateHearts, .-updateHearts
	.global	jumpPower
	.global	lostHearts
	.comm	healthMeter,480,4
	.comm	player,92,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	jumpPower, %object
	.size	jumpPower, 4
jumpPower:
	.word	1500
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	lostHearts, %object
	.size	lostHearts, 4
lostHearts:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

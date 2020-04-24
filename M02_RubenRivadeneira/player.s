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
	ldr	r3, .L102
	ldr	r3, [r3, #56]
	cmp	r3, #0
	bne	.L52
	ldr	ip, .L102+4
	mov	r2, ip
.L55:
	ldr	r1, [r2, #40]
	cmp	r1, #0
	beq	.L53
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L99
.L53:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #76
	bne	.L55
	bx	lr
.L52:
	cmp	r3, #1
	bne	.L100
	ldr	ip, .L102+4
	mov	r1, #5
	mov	r2, ip
.L60:
	ldr	r0, [r2, #420]
	cmp	r0, #0
	beq	.L58
	ldr	r3, [r2, #428]
	cmp	r3, #0
	bne	.L101
.L58:
	add	r1, r1, #1
	cmp	r1, #10
	add	r2, r2, #76
	bne	.L60
	bx	lr
.L100:
	cmp	r3, #3
	bxne	lr
	push	{r4, lr}
	mov	r4, r0
	ldr	r3, .L102+8
	mov	r2, #0
	mov	r1, #3248
	ldr	r0, .L102+12
	mov	lr, pc
	bx	r3
	bics	r3, r4, #2
	bne	.L61
	mov	r0, r3
	ldr	r3, .L102+16
	add	r1, r3, #1088
	add	r1, r1, #4
.L63:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L62
	ldr	r2, [r3]
	cmp	r2, #239
	strls	r0, [r3, #60]
.L62:
	add	r3, r3, #84
	cmp	r3, r1
	bne	.L63
	cmp	r4, #1
	beq	.L67
	cmp	r4, #2
	bne	.L51
	ldr	r3, .L102+20
	ldr	r2, [r3]
	cmp	r2, #239
	movls	r2, #0
	strls	r2, [r3, #40]
	b	.L51
.L61:
	cmp	r4, #1
	beq	.L67
.L51:
	pop	{r4, lr}
	bx	lr
.L67:
	mov	r0, #0
	ldr	r3, .L102+24
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
	b	.L51
.L99:
	mov	r2, #0
	add	r1, r3, r3, lsl #3
	add	r3, r3, r1, lsl #1
	add	r3, ip, r3, lsl #2
	str	r2, [r3, #48]
	bx	lr
.L101:
	mov	r3, #0
	add	r2, r1, r1, lsl #3
	add	r1, r1, r2, lsl #1
	add	r1, ip, r1, lsl #2
	str	r3, [r1, #48]
	bx	lr
.L103:
	.align	2
.L102:
	.word	player
	.word	allBalloons
	.word	playSoundB
	.word	pop
	.word	bees
	.word	queenBee
	.word	ants
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
	ldr	ip, .L189
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L189+4
	ldrh	ip, [ip, #48]
	ldr	lr, [r4, #8]
	tst	ip, #16
	mov	r5, r1
	mov	r6, r2
	str	lr, [r4, #32]
	bne	.L106
	ldr	r2, [r4, #28]
	add	r2, lr, r2
	cmp	r2, #500
	ble	.L178
.L106:
	ldr	r2, .L189
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L110
	ldr	lr, [r4, #8]
	cmp	lr, #5
	bgt	.L179
.L110:
	ldr	r2, .L189
	ldrh	r2, [r2, #48]
	tst	r2, #128
	moveq	r1, #1
	movne	r2, #0
	ldreq	r2, [r4, #32]
	streq	r1, [r4, #48]
	ldr	r1, [r4, #20]
	strne	r2, [r4, #48]
	ldr	lr, [r4, #12]
	ldrne	r2, [r4, #8]
	streq	r2, [r4, #8]
	cmp	r1, #500
	addlt	r1, r1, #100
	ldr	ip, [r4, #24]
	strlt	r1, [r4, #20]
	add	r1, r1, lr
	add	ip, ip, r1, asr #8
	sub	ip, ip, #1
	add	lr, r2, ip, lsl #9
	lsl	lr, lr, #1
	ldrh	lr, [r0, lr]
	cmp	lr, #0
	lsl	ip, ip, #9
	beq	.L116
	ldr	lr, [r4, #28]
	add	r2, r2, lr
	add	ip, r2, ip
	add	ip, r0, ip, lsl #1
	ldrh	r2, [ip, #-2]
	cmp	r2, #0
	strne	r1, [r4, #12]
	beq	.L116
.L117:
	ldr	r7, .L189+8
	ldrh	ip, [r7]
	tst	ip, #64
	beq	.L176
	ldr	r2, .L189+12
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L172
.L176:
	ldr	lr, .L189+16
.L118:
	ldr	r0, [r4, #56]
	ldr	r1, .L189+20
	cmp	r0, #2
	ldr	r2, .L189+24
	movne	r2, r1
	tst	ip, #1
	str	r2, [lr]
	ldr	r2, [r4, #52]
	beq	.L177
	ldr	r1, .L189+12
	ldrh	r1, [r1]
	tst	r1, #1
	beq	.L122
.L177:
	add	r2, r2, #1
.L121:
	tst	ip, #2
	str	r2, [r4, #52]
	beq	.L124
	ldr	r3, .L189+12
	ldrh	r2, [r3]
	ands	r2, r2, #2
	beq	.L180
.L124:
	tst	ip, #512
	beq	.L127
	ldr	r3, .L189+12
	ldrh	r3, [r3]
	ands	r3, r3, #512
	beq	.L181
.L127:
	tst	ip, #256
	beq	.L131
	ldr	r3, .L189+12
	ldrh	r3, [r3]
	ands	r3, r3, #256
	bne	.L131
	ldr	r2, [r4, #56]
	cmp	r2, #0
	beq	.L182
	cmp	r2, #1
	beq	.L183
	cmp	r2, #2
	beq	.L184
	cmp	r2, #3
	beq	.L185
.L131:
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
.L116:
	mov	r2, #0
	str	r2, [r4, #20]
	str	r2, [r4, #44]
	b	.L117
.L181:
	ldr	r2, [r4, #56]
	cmp	r2, #0
	beq	.L186
	cmp	r2, #3
	beq	.L187
	cmp	r2, #2
	beq	.L188
	cmp	r2, #1
	bne	.L127
	ldr	r1, .L189+28
	str	r2, [r4, #60]
	str	r3, [r4, #56]
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
	str	r2, [r1, #40]
	str	r2, [r1, #48]
	b	.L127
.L122:
	cmp	r2, #9
	ble	.L177
	mov	r0, r3
	bl	playerAttack
	mov	r2, #1
	ldrh	ip, [r7]
	b	.L121
.L172:
	ldr	r2, [r4, #44]
	cmp	r2, #0
	bne	.L176
	mov	r1, #1
	ldr	lr, .L189+16
	ldr	r2, [r4, #20]
	ldr	r0, [lr]
	sub	r2, r2, r0
	str	r2, [r4, #20]
	str	r1, [r4, #44]
	b	.L118
.L179:
	ldr	r2, [r4, #12]
	sub	r1, lr, #1
	asr	r2, r2, #8
	add	ip, r1, r2, lsl #9
	lsl	ip, ip, #1
	ldrh	ip, [r0, ip]
	cmp	ip, #0
	beq	.L112
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
.L112:
	ldr	r2, [r5]
	cmp	r2, #0
	ble	.L110
	ldr	r1, [r4]
	cmp	r1, #59
	ldrle	r1, [r4, #16]
	suble	r2, r2, r1
	strle	r2, [r5]
	b	.L110
.L178:
	ldr	r1, [r4, #12]
	asr	r1, r1, #8
	add	ip, r2, r1, lsl #9
	lsl	ip, ip, #1
	ldrh	ip, [r0, ip]
	cmp	ip, #0
	beq	.L108
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
.L108:
	ldr	r2, [r5]
	ldr	r1, .L189+32
	cmp	r2, r1
	bgt	.L106
	ldr	r1, [r4]
	cmp	r1, #60
	ldrgt	r1, [r4, #16]
	addgt	r2, r1, r2
	strgt	r2, [r5]
	b	.L106
.L180:
	ldr	r1, .L189+36
	ldr	r0, .L189+40
	ldr	r3, .L189+44
	mov	lr, pc
	bx	r3
	mov	r0, #1
	ldr	r3, .L189+48
	add	r1, r3, #1088
	add	r1, r1, #4
.L126:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L125
	ldr	r2, [r3]
	cmp	r2, #239
	strls	r0, [r3, #52]
.L125:
	add	r3, r3, #84
	cmp	r3, r1
	bne	.L126
	ldrh	ip, [r7]
	b	.L124
.L182:
	mov	r1, #1
	ldr	r3, .L189+28
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
	b	.L131
.L186:
	mov	r1, #1
	mov	r0, #3
	ldr	r3, .L189+28
	str	r2, [r4, #60]
	str	r0, [r4, #56]
	str	r1, [r3, #876]
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
	str	r1, [r3, #884]
	b	.L127
.L185:
	mov	r0, #1
	ldr	r1, .L189+28
	str	r2, [r4, #60]
	str	r3, [r4, #56]
	str	r0, [r1, #40]
	str	r3, [r1, #876]
	str	r3, [r1, #884]
	str	r0, [r1, #48]
	b	.L131
.L187:
	mov	r1, #1
	mov	r0, #2
	str	r2, [r4, #60]
	ldr	r2, .L189+28
	str	r0, [r4, #56]
	str	r1, [r2, #800]
	str	r3, [r2, #876]
	str	r3, [r2, #884]
	str	r1, [r2, #808]
	b	.L127
.L183:
	mov	r0, #2
	ldr	r1, .L189+28
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
	b	.L131
.L188:
	mov	r0, #1
	ldr	r1, .L189+28
	str	r2, [r4, #60]
	str	r0, [r4, #56]
	str	r0, [r1, #420]
	str	r3, [r1, #800]
	str	r3, [r1, #808]
	str	r0, [r1, #428]
	b	.L127
.L184:
	mov	r1, #1
	mov	r0, #3
	str	r2, [r4, #60]
	ldr	r2, .L189+28
	str	r0, [r4, #56]
	str	r1, [r2, #876]
	str	r3, [r2, #800]
	str	r3, [r2, #808]
	str	r1, [r2, #884]
	b	.L131
.L190:
	.align	2
.L189:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	1500
	.word	2200
	.word	allBalloons
	.word	270
	.word	21227
	.word	dadWhistle
	.word	playSoundB
	.word	bees
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
	ldr	r3, .L197
	push	{r4, lr}
	mov	r2, r1
	str	r1, [r3, #12]
	mov	r0, #4
	mov	r1, #100
	mov	r4, #5
	mov	lr, #1
	str	ip, [r3, #8]
	b	.L192
.L194:
	tst	r2, #1
	movne	r0, #6
	moveq	r0, #4
	str	r2, [r3, #36]
	str	ip, [r3, #32]
	add	r1, r1, #7
	add	r3, r3, #24
.L192:
	add	r2, r2, #1
	cmp	r2, #20
	stm	r3, {r1, r4}
	str	r0, [r3, #16]
	str	lr, [r3, #20]
	bne	.L194
	pop	{r4, lr}
	bx	lr
.L198:
	.align	2
.L197:
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
.L200:
	mov	r2, #512
	ldr	r1, [r0, #12]
	ldr	r3, .L201
	add	r3, r3, r1, lsl #3
	strh	r2, [r3, #104]	@ movhi
	bx	lr
.L202:
	.align	2
.L201:
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
	ldr	r3, .L210
	ldr	r3, [r3, #68]
	cmp	r3, #100
	bxeq	lr
	ldr	r2, .L210+4
	smull	r1, r2, r3, r2
	asr	r3, r3, #31
	sub	r2, r3, r2, asr #1
	add	r3, r2, #20
	ldr	r1, .L210+8
	cmp	r3, #0
	str	r3, [r1]
	bxle	lr
	mov	r0, #0
	ldr	r3, .L210+12
	add	r2, r2, r2, lsl #1
	add	r1, r3, #480
	add	r2, r1, r2, lsl #3
.L205:
	str	r0, [r3, #20]
	add	r3, r3, #24
	cmp	r3, r2
	bne	.L205
	bx	lr
.L211:
	.align	2
.L210:
	.word	player
	.word	1717986919
	.word	.LANCHOR1
	.word	healthMeter
	.size	updateHearts, .-updateHearts
	.global	jumpPower
	.global	lostHearts
	.comm	healthMeter,480,4
	.comm	player,92,4
	.comm	soundB,32,4
	.comm	soundA,32,4
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

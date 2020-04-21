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
	.file	"ant.c"
	.text
	.global	__aeabi_idivmod
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateAnts.part.0, %function
animateAnts.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L7
	ldr	r5, [r0, #60]
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #1
	mov	r4, r0
	bne	.L2
	add	r0, r0, #68
	ldm	r0, {r0, r1}
	ldr	r3, .L7+4
	sub	r0, r0, #22
	lsl	r1, r1, #1
	mov	lr, pc
	bx	r3
	add	r1, r1, #24
	str	r1, [r4, #68]
.L2:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	moveq	r3, #10
	streq	r3, [r4, #64]
	beq	.L4
	cmp	r3, #1
	moveq	r3, #8
	streq	r3, [r4, #64]
.L4:
	add	r5, r5, #1
	str	r5, [r4, #60]
	pop	{r4, r5, r6, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateAnts.part.0, .-animateAnts.part.0
	.align	2
	.global	initAnts
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAnts, %function
initAnts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #180
	mov	r0, #50
	mov	fp, #14
	mov	r10, #15
	mov	r9, #1
	mov	r8, #2
	mov	r7, #30
	mov	r5, #10
	mov	r4, #24
	ldr	lr, .L13
	ldr	ip, .L13+4
	ldr	lr, [lr]
	mov	r2, r3
	mov	r1, r3
	str	r3, [ip]
	ldr	r3, .L13+8
	sub	lr, r6, lr
.L10:
	mov	ip, #3
	str	r2, [r3, #52]
	add	r2, r2, #1
	cmp	r2, #15
	str	r0, [r3, #8]
	str	fp, [r3, #24]
	str	r10, [r3, #28]
	str	r9, [r3, #16]
	str	r8, [r3, #20]
	str	r7, [r3, #56]
	str	r1, [r3, #48]
	str	r6, [r3, #12]
	str	lr, [r3, #4]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r1, [r3, #60]
	str	r5, [r3, #64]
	str	r4, [r3, #68]
	str	ip, [r3, #72]
	add	r0, r0, #25
	add	r3, r3, #76
	bne	.L10
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	vOff
	.word	healthTimer
	.word	ants
	.size	initAnts, .-initAnts
	.align	2
	.global	updateAnts
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAnts, %function
updateAnts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r8, .L73
	ldr	r2, [r0, #8]
	ldr	r3, [r8]
	sub	r3, r2, r3
	cmp	r3, #239
	mov	r5, r0
	sub	sp, sp, #16
	ldr	r0, [r0, #12]
	bhi	.L16
	ldr	ip, [r5, #36]
	cmp	ip, #0
	beq	.L69
.L16:
	ldr	ip, [r5, #32]
	cmp	ip, #0
	bne	.L17
	ldr	r2, .L73+4
	ldr	r2, [r2]
	sub	r0, r0, r2
	str	r3, [r5]
	str	r0, [r5, #4]
.L15:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L69:
	mov	ip, #1
	str	r3, [r5]
	str	ip, [r5, #32]
.L17:
	ldr	ip, [r5, #56]
	cmp	ip, #0
	ble	.L70
	ldr	r7, .L73+8
	ldr	r3, [r7, #8]
	cmp	r2, r3
	movlt	lr, #1
	movge	lr, #0
	ldr	ip, [r5, #24]
	add	r3, ip, r0
	str	lr, [r5, #48]
	sub	r3, r3, #1
	ldr	lr, [r5, #28]
	lsl	r4, r0, #9
	bge	.L35
	add	r6, r2, lr
	add	r4, r6, r4
	lsl	r4, r4, #1
	ldrh	r4, [r1, r4]
	cmp	r4, #0
	beq	.L21
	add	r4, r6, r3, lsl #9
	lsl	r4, r4, #1
	ldrh	r4, [r1, r4]
	cmp	r4, #0
	ldrne	r4, [r5, #16]
	addne	r2, r2, r4
	strne	r2, [r5, #8]
.L21:
	ldr	r4, [r5, #20]
	add	r3, r4, r3
	add	r3, r2, r3, lsl #9
	lsl	r6, r3, #1
	ldrh	r6, [r1, r6]
	cmp	r6, #0
	beq	.L22
	add	r3, r3, lr
	add	r3, r1, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	addne	r0, r0, r4
	strne	r0, [r5, #12]
.L22:
	ldr	r4, .L73+12
	mov	r10, #0
	ldr	r9, .L73+16
	add	r6, r4, #912
	b	.L31
.L23:
	add	r4, r4, #76
	cmp	r4, r6
	beq	.L71
.L31:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L23
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L23
	stmib	sp, {r0, lr}
	str	ip, [sp, #12]
	str	r2, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L68
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L25
	ldr	r3, [r5, #56]
	sub	r3, r3, #100
	str	r3, [r5, #56]
.L26:
	str	r10, [r4, #32]
.L68:
	add	r4, r4, #76
	add	ip, r5, #24
	cmp	r4, r6
	ldr	r2, [r5, #8]
	ldr	r0, [r5, #12]
	ldm	ip, {ip, lr}
	bne	.L31
.L71:
	stmib	sp, {r0, lr}
	str	r2, [sp]
	str	ip, [sp, #12]
	add	r0, r7, #8
	ldr	r3, [r7, #24]
	ldr	r2, [r7, #28]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L32
	ldr	r3, [r8]
	ldr	r2, [r5, #8]
	ldr	r0, [r5, #32]
	sub	r2, r2, r3
	ldr	r3, [r5, #12]
.L33:
	ldr	r1, .L73+4
	ldr	r1, [r1]
	cmp	r0, #0
	sub	r3, r3, r1
	stm	r5, {r2, r3}
	beq	.L15
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animateAnts.part.0
.L35:
	sub	r6, r2, #1
	add	r4, r6, r4
	lsl	r4, r4, #1
	ldrh	r4, [r1, r4]
	cmp	r4, #0
	beq	.L21
	add	r6, r6, r3, lsl #9
	lsl	r6, r6, #1
	ldrh	r4, [r1, r6]
	cmp	r4, #0
	ldrne	r4, [r5, #16]
	subne	r2, r2, r4
	strne	r2, [r5, #8]
	b	.L21
.L70:
	mov	r4, #0
	mov	lr, #1
	ldr	ip, .L73+20
	ldr	r2, .L73+4
	ldr	r1, [ip]
	ldr	r2, [r2]
	sub	r1, r1, #1
	sub	r0, r0, r2
	str	r1, [ip]
	str	r0, [r5, #4]
	str	r3, [r5]
	str	r4, [r5, #32]
	str	lr, [r5, #36]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L32:
	ldr	r4, .L73+24
	ldr	r1, .L73+28
	ldr	r2, .L73+32
	ldr	r3, [r4]
	mla	r2, r3, r2, r1
	ldr	r1, .L73+36
	cmp	r1, r2, ror #2
	bcs	.L72
.L34:
	ldr	r1, [r8]
	ldr	r2, [r5, #8]
	add	r3, r3, #1
	str	r3, [r4]
	ldr	r0, [r5, #32]
	ldr	r3, [r5, #12]
	sub	r2, r2, r1
	b	.L33
.L25:
	cmp	r3, #1
	bne	.L26
	ldr	ip, [r4]
	ldr	r0, [r4, #20]
	ldr	r3, .L73+40
	ldr	r2, [r4, #48]
	add	r0, ip, r0
	add	lr, r3, #1136
	add	r0, r0, r2
	sub	ip, ip, r2
	add	lr, lr, #4
.L29:
	ldr	r2, [r3, #8]
	cmp	r2, r0
	movlt	r1, #1
	movge	r1, #0
	cmp	r2, ip
	movlt	r1, #0
	cmp	r1, #0
	ldrne	r2, [r3, #56]
	subne	r2, r2, #34
	strne	r2, [r3, #56]
	add	r3, r3, #76
	cmp	lr, r3
	bne	.L29
	b	.L26
.L72:
	mov	r2, #0
	ldr	r3, [r7, #68]
	sub	r3, r3, #5
	str	r3, [r7, #68]
	ldr	r3, .L73+44
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	b	.L34
.L74:
	.align	2
.L73:
	.word	hOff
	.word	vOff
	.word	player
	.word	allBalloons+8
	.word	collision
	.word	remainingEnemiesL1
	.word	healthTimer
	.word	28633112
	.word	-1775253149
	.word	14316556
	.word	ants
	.word	updateHearts
	.size	updateAnts, .-updateAnts
	.align	2
	.global	animateAnts
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateAnts, %function
animateAnts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	animateAnts.part.0
	.size	animateAnts, .-animateAnts
	.align	2
	.global	drawAnt
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAnt, %function
drawAnt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #32]
	ldr	r3, [r0, #52]
	cmp	r2, #0
	add	r3, r3, #52
	beq	.L78
	push	{r4, lr}
	ldr	r2, [r0]
	ldr	r4, [r0, #68]
	ldr	r1, [r0, #64]
	ldr	ip, .L84
	lsl	r2, r2, #23
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	lsr	r2, r2, #23
	lsl	r0, r3, #3
	add	r1, r1, r4, lsl #5
	add	r3, ip, r3, lsl #3
	orr	r2, r2, #16384
	strh	lr, [ip, r0]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L78:
	mov	r1, #512
	ldr	r2, .L84
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L85:
	.align	2
.L84:
	.word	shadowOAM
	.size	drawAnt, .-drawAnt
	.comm	healthTimer,4,4
	.comm	ants,1140,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

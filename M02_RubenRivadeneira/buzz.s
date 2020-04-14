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
	.file	"buzz.c"
	.text
	.align	2
	.global	initBuzz
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBuzz, %function
initBuzz:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, #203
	mov	r1, #240
	mov	r10, #20
	mov	r9, #23
	mov	ip, #1
	mov	r8, #100
	mov	r6, #3
	ldr	r4, .L6
	ldr	lr, .L6+4
	ldr	r5, [r4]
	mov	r0, r3
	mov	r2, r3
	str	r3, [lr]
	ldr	r3, .L6+8
	sub	r5, r7, r5
.L2:
	str	r0, [r3, #56]
	add	r0, r0, #1
	add	r4, r1, #58
	sub	lr, r1, #35
	cmp	r0, #8
	str	r1, [r3, #8]
	str	r10, [r3, #24]
	str	r9, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #52]
	str	r2, [r3, #48]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r2, [r3, #36]
	str	r8, [r3, #60]
	str	r7, [r3, #12]
	str	r5, [r3, #4]
	str	r6, [r3, #68]
	str	r2, [r3, #76]
	str	r4, [r3, #40]
	str	lr, [r3, #44]
	add	r1, r1, #30
	add	r3, r3, #84
	bne	.L2
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	vOff
	.word	healthTimer
	.word	bees
	.size	initBuzz, .-initBuzz
	.align	2
	.global	drawBuzz
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBuzz, %function
drawBuzz:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #32]
	ldr	r3, [r0, #56]
	cmp	r2, #0
	add	r3, r3, #37
	beq	.L9
	ldr	r2, [r0]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	push	{r4, lr}
	ldr	r1, [r0, #68]
	ldr	r4, [r0, #76]
	ldr	ip, .L15
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	add	r1, r1, r4, lsl #5
	add	r0, ip, r3, lsl #3
	lsl	r1, r1, #2
	lsl	r3, r3, #3
	strh	lr, [ip, r3]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L9:
	mov	r1, #512
	ldr	r2, .L15
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L16:
	.align	2
.L15:
	.word	shadowOAM
	.size	drawBuzz, .-drawBuzz
	.align	2
	.global	animateBuzz
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBuzz, %function
animateBuzz:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #48]
	cmp	r3, #0
	moveq	r3, #3
	streq	r3, [r0, #68]
	beq	.L21
	cmp	r3, #1
	moveq	r3, #2
	streq	r3, [r0, #68]
.L21:
	ldr	r3, [r0, #52]
	cmp	r3, #1
	moveq	r3, #3
	streq	r3, [r0, #76]
	bx	lr
	.size	animateBuzz, .-animateBuzz
	.align	2
	.global	updateBuzz
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBuzz, %function
updateBuzz:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r8, .L69
	ldr	r2, [r0, #8]
	ldr	r3, [r8]
	sub	r3, r2, r3
	cmp	r3, #239
	mov	r5, r0
	sub	sp, sp, #16
	bhi	.L24
	ldr	r1, [r0, #36]
	cmp	r1, #0
	beq	.L67
.L24:
	ldr	r1, [r5, #32]
	cmp	r1, #0
	bne	.L25
.L26:
	mov	r0, r5
	ldr	r1, .L69+4
	ldr	r2, [r5, #12]
	ldr	r1, [r1]
	sub	r2, r2, r1
	str	r3, [r5]
	str	r2, [r5, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animateBuzz
.L67:
	mov	r1, #1
	str	r3, [r0]
	str	r1, [r0, #32]
.L25:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	bne	.L27
	ldr	r3, [r5, #48]
	cmp	r3, #0
	bne	.L28
	ldr	r3, [r5, #44]
	cmp	r2, r3
	ble	.L29
	ldr	r3, [r5, #16]
	sub	r2, r2, r3
	str	r2, [r5, #8]
	ldr	r7, .L69+8
.L30:
	ldr	r4, .L69+12
	mov	r10, #0
	ldr	r1, [r5, #12]
	ldr	r0, [r5, #28]
	ldr	ip, [r5, #24]
	ldr	r9, .L69+16
	add	r6, r4, #912
	b	.L42
.L34:
	add	r4, r4, #76
	cmp	r6, r4
	beq	.L68
.L42:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L34
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L34
	str	ip, [sp, #12]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r2, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L66
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L36
	ldr	r3, [r5, #60]
	sub	r3, r3, #100
	str	r3, [r5, #60]
.L37:
	str	r10, [r4, #32]
.L66:
	add	r4, r4, #76
	cmp	r6, r4
	ldr	r2, [r5, #8]
	ldr	r1, [r5, #12]
	ldr	r0, [r5, #28]
	ldr	ip, [r5, #24]
	bne	.L42
.L68:
	ldr	r3, [r5, #60]
	cmp	r3, #0
	bgt	.L43
	mov	r6, #0
	mov	r4, #1
	ldr	lr, .L69+20
	ldr	r3, [lr]
	sub	r3, r3, #1
	str	r3, [lr]
	str	r6, [r5, #32]
	str	r4, [r5, #36]
.L43:
	str	r0, [sp, #8]
	str	r2, [sp]
	str	ip, [sp, #12]
	str	r1, [sp, #4]
	add	r0, r7, #8
	ldr	r3, [r7, #24]
	ldr	r2, [r7, #28]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L44
	ldr	r1, .L69+24
	ldr	r0, .L69+28
	ldr	r3, [r1]
	ldr	r2, .L69+32
	mla	r2, r3, r2, r0
	cmp	r0, r2, ror #1
	movcs	r3, #1
	ldrcs	r2, [r7, #68]
	addcc	r3, r3, #1
	subcs	r2, r2, #5
	strcs	r2, [r7, #68]
	str	r3, [r1]
.L44:
	ldr	r2, [r7, #8]
	ldr	r0, [r5, #44]
	ldr	r1, [r8]
	ldr	r3, [r5, #8]
	cmp	r2, r0
	sub	r3, r3, r1
	blt	.L26
	ldr	r1, [r5, #40]
	cmp	r2, r1
	movle	r2, #1
	strle	r2, [r5, #52]
	b	.L26
.L27:
	cmp	r3, #1
	ldr	r7, .L69+8
	bne	.L30
	ldr	r3, [r7, #8]
	cmp	r2, r3
	movlt	r3, #1
	movge	r3, #0
	str	r3, [r5, #48]
	ldr	r3, [r5, #16]
	subge	r2, r2, r3
	addlt	r2, r2, r3
	str	r2, [r5, #8]
	b	.L30
.L36:
	cmp	r3, #1
	bne	.L37
	ldr	ip, [r4]
	ldr	r0, [r4, #20]
	ldr	r2, [r4, #48]
	ldr	r3, .L69+36
	add	r0, ip, r0
	add	r0, r0, r2
	sub	ip, ip, r2
	add	lr, r3, #672
.L40:
	ldr	r2, [r3, #8]
	cmp	r2, r0
	movlt	r1, #1
	movge	r1, #0
	cmp	r2, ip
	movlt	r1, #0
	cmp	r1, #0
	ldrne	r2, [r3, #60]
	subne	r2, r2, #34
	strne	r2, [r3, #60]
	add	r3, r3, #84
	cmp	lr, r3
	bne	.L40
	b	.L37
.L28:
	cmp	r3, #1
	beq	.L31
.L65:
	ldr	r7, .L69+8
	b	.L30
.L29:
	mov	r3, #1
	str	r3, [r5, #48]
.L31:
	ldr	r3, [r5, #40]
	cmp	r2, r3
	ldrlt	r3, [r5, #16]
	addlt	r2, r2, r3
	strlt	r2, [r5, #8]
	blt	.L65
.L32:
	mov	r3, #0
	ldr	r7, .L69+8
	str	r3, [r5, #48]
	b	.L30
.L70:
	.align	2
.L69:
	.word	hOff
	.word	vOff
	.word	player
	.word	allBalloons+8
	.word	collision
	.word	remainingEnemies
	.word	healthTimer
	.word	17179868
	.word	652835029
	.word	bees
	.size	updateBuzz, .-updateBuzz
	.comm	healthTimer,4,4
	.comm	bees,672,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

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
	mov	ip, #240
	mov	r10, #20
	mov	r9, #23
	mov	lr, #1
	mov	r8, #100
	mov	r6, #3
	ldr	r4, .L7
	ldr	r0, .L7+4
	ldr	r5, [r4]
	mov	r2, r3
	mov	r1, r3
	str	r3, [r0]
	ldr	r3, .L7+8
	sub	r5, r7, r5
.L3:
	cmp	r2, #7
	addgt	r0, r2, r2, lsl #1
	stmib	r3, {r5, ip}
	rsbgt	r0, r2, r0, lsl #3
	strgt	r0, [r3, #8]
	ldr	r0, [r3, #8]
	str	r2, [r3, #56]
	add	r2, r2, #1
	str	r1, [r3, #52]
	add	r4, r0, #58
	strgt	lr, [r3, #52]
	sub	r0, r0, #35
	cmp	r2, #13
	str	r10, [r3, #24]
	str	r9, [r3, #28]
	str	r1, [r3, #32]
	str	r1, [r3, #48]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r1, [r3, #36]
	str	r8, [r3, #60]
	str	r7, [r3, #12]
	str	r6, [r3, #68]
	str	r4, [r3, #40]
	str	r0, [r3, #44]
	str	r1, [r3, #76]
	add	ip, ip, #30
	add	r3, r3, #84
	bne	.L3
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L8:
	.align	2
.L7:
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
	beq	.L10
	ldr	r2, [r0]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	push	{r4, lr}
	ldr	r1, [r0, #68]
	ldr	r4, [r0, #76]
	ldr	ip, .L16
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	add	r1, r1, r4, lsl #5
	lsl	r0, r3, #3
	lsl	r1, r1, #2
	add	r3, ip, r3, lsl #3
	strh	lr, [ip, r0]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L10:
	mov	r1, #512
	ldr	r2, .L16
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L17:
	.align	2
.L16:
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
	beq	.L22
	cmp	r3, #1
	moveq	r3, #2
	streq	r3, [r0, #68]
.L22:
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
	ldr	r3, [r0, #56]
	cmp	r3, #7
	mov	r5, r0
	ldr	r8, .L72
	ldr	r2, [r0, #8]
	sub	sp, sp, #16
	bgt	.L25
	ldr	r3, [r8]
	sub	r3, r2, r3
	cmp	r3, #239
	bls	.L70
.L25:
	ldr	r3, [r5, #32]
	cmp	r3, #0
	bne	.L26
.L27:
	ldr	r0, [r8]
	sub	r2, r2, r0
	mov	r0, r5
	ldr	r3, .L72+4
	ldr	r1, [r3]
	ldr	r3, [r5, #12]
	sub	r3, r3, r1
	stm	r5, {r2, r3}
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animateBuzz
.L70:
	ldr	r1, [r0, #36]
	cmp	r1, #0
	bne	.L25
	mov	r1, #1
	str	r3, [r0]
	str	r1, [r0, #32]
.L26:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	bne	.L28
	ldr	r3, [r5, #48]
	cmp	r3, #0
	bne	.L29
	ldr	r3, [r5, #44]
	cmp	r3, r2
	bge	.L30
	ldr	r3, [r5, #16]
	sub	r2, r2, r3
	str	r2, [r5, #8]
	ldr	r7, .L72+8
.L31:
	ldr	r4, .L72+12
	mov	r10, #0
	ldr	r1, [r5, #12]
	ldr	r0, [r5, #28]
	ldr	ip, [r5, #24]
	ldr	r9, .L72+16
	add	r6, r4, #912
	b	.L43
.L35:
	add	r4, r4, #76
	cmp	r6, r4
	beq	.L71
.L43:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L35
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L35
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
	beq	.L69
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L37
	ldr	r3, [r5, #60]
	sub	r3, r3, #100
	str	r3, [r5, #60]
.L38:
	str	r10, [r4, #32]
.L69:
	add	r4, r4, #76
	cmp	r6, r4
	ldr	r2, [r5, #8]
	ldr	r1, [r5, #12]
	ldr	r0, [r5, #28]
	ldr	ip, [r5, #24]
	bne	.L43
.L71:
	ldr	r3, [r5, #60]
	cmp	r3, #0
	bgt	.L44
	mov	r6, #0
	mov	r4, #1
	ldr	lr, .L72+20
	ldr	r3, [lr]
	sub	r3, r3, #1
	str	r3, [lr]
	str	r6, [r5, #32]
	str	r4, [r5, #36]
.L44:
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
	beq	.L45
	ldr	r1, .L72+24
	ldr	r0, .L72+28
	ldr	r3, [r1]
	ldr	r2, .L72+32
	mla	r2, r3, r2, r0
	cmp	r0, r2, ror #1
	movcs	r3, #1
	ldrcs	r2, [r7, #68]
	addcc	r3, r3, #1
	subcs	r2, r2, #5
	strcs	r2, [r7, #68]
	str	r3, [r1]
.L45:
	ldr	r2, [r5, #44]
	ldr	r3, [r7, #8]
	cmp	r3, r2
	ldr	r2, [r5, #8]
	blt	.L27
	ldr	r1, [r5, #40]
	cmp	r3, r1
	movle	r3, #1
	strle	r3, [r5, #52]
	b	.L27
.L28:
	cmp	r3, #1
	ldr	r7, .L72+8
	bne	.L31
	ldr	r3, [r7, #8]
	cmp	r3, r2
	movgt	r3, #1
	movle	r3, #0
	str	r3, [r5, #48]
	ldr	r3, [r5, #16]
	suble	r2, r2, r3
	addgt	r2, r2, r3
	str	r2, [r5, #8]
	b	.L31
.L37:
	cmp	r3, #1
	bne	.L38
	ldr	ip, [r4]
	ldr	r0, [r4, #20]
	ldr	r3, .L72+36
	ldr	r2, [r4, #48]
	add	r0, ip, r0
	add	lr, r3, #1088
	add	r0, r0, r2
	sub	ip, ip, r2
	add	lr, lr, #4
.L41:
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
	bne	.L41
	b	.L38
.L29:
	cmp	r3, #1
	beq	.L32
.L68:
	ldr	r7, .L72+8
	b	.L31
.L30:
	mov	r3, #1
	str	r3, [r5, #48]
.L32:
	ldr	r3, [r5, #40]
	cmp	r3, r2
	ldrgt	r3, [r5, #16]
	addgt	r2, r2, r3
	strgt	r2, [r5, #8]
	bgt	.L68
.L33:
	mov	r3, #0
	ldr	r7, .L72+8
	str	r3, [r5, #48]
	b	.L31
.L73:
	.align	2
.L72:
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
	.comm	bees,1092,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

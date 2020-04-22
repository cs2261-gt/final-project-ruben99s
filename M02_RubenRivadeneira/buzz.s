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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, [r0, #56]
	cmp	r3, #7
	mov	r5, r0
	ldr	r8, .L80
	ldr	r2, [r0, #8]
	sub	sp, sp, #20
	bgt	.L25
	ldr	r3, [r8]
	sub	r3, r2, r3
	cmp	r3, #239
	bls	.L74
.L25:
	ldr	r3, [r5, #32]
	cmp	r3, #0
	bne	.L26
.L48:
	ldr	r3, .L80+4
	ldr	r0, [r3]
	ldr	r3, [r5, #12]
	sub	r3, r3, r0
	mov	r0, r5
	ldr	r1, [r8]
	sub	r2, r2, r1
	stm	r5, {r2, r3}
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateBuzz
.L74:
	ldr	r0, [r0, #36]
	cmp	r0, #0
	bne	.L25
	mov	r0, #1
	str	r3, [r5]
	str	r0, [r5, #32]
.L26:
	ldr	r3, [r5, #60]
	cmp	r3, #0
	ble	.L75
	ldr	r3, [r5, #52]
	cmp	r3, #0
	bne	.L76
	ldr	r3, [r5, #48]
	cmp	r3, #0
	bne	.L31
	ldr	r3, [r5, #44]
	cmp	r3, r2
	bge	.L32
	ldr	r3, [r5, #16]
	sub	r2, r2, r3
	str	r2, [r5, #8]
	ldr	r7, .L80+8
.L33:
	ldr	r4, .L80+12
	ldr	r1, [r5, #12]
	ldr	r0, [r5, #28]
	ldr	ip, [r5, #24]
	ldr	r9, .L80+16
	ldr	fp, .L80+20
	ldr	r10, .L80+24
	add	r6, r4, #912
	b	.L45
.L37:
	add	r4, r4, #76
	cmp	r6, r4
	beq	.L77
.L45:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L37
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L37
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
	beq	.L73
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L39
	ldr	r3, [r5, #60]
	sub	r3, r3, #100
	str	r3, [r5, #60]
.L40:
	mov	r2, #0
	mov	r1, fp
	mov	r0, r10
	str	r2, [r4, #32]
	ldr	r3, .L80+28
	mov	lr, pc
	bx	r3
.L73:
	add	r4, r4, #76
	cmp	r6, r4
	ldr	r2, [r5, #8]
	ldr	r1, [r5, #12]
	ldr	r0, [r5, #28]
	ldr	ip, [r5, #24]
	bne	.L45
.L77:
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
	beq	.L46
	ldr	r4, .L80+32
	ldr	r1, .L80+36
	ldr	r2, .L80+40
	ldr	r3, [r4]
	mla	r2, r3, r2, r1
	ldr	r1, .L80+44
	cmp	r2, r1
	bls	.L78
.L47:
	add	r3, r3, #1
	str	r3, [r4]
.L46:
	ldr	r2, [r5, #44]
	ldr	r3, [r7, #8]
	cmp	r3, r2
	ldr	r2, [r5, #8]
	blt	.L48
	ldr	r1, [r5, #40]
	cmp	r3, r1
	movle	r3, #1
	strle	r3, [r5, #52]
	b	.L48
.L76:
	cmp	r3, #1
	ldr	r7, .L80+8
	bne	.L33
	ldr	r3, [r7, #8]
	cmp	r3, r2
	movgt	r3, #1
	movle	r3, #0
	str	r3, [r5, #48]
	ldr	r3, [r5, #16]
	suble	r2, r2, r3
	addgt	r2, r2, r3
	str	r2, [r5, #8]
	b	.L33
.L75:
	mov	r0, #0
	mov	r3, #1
	cmp	r1, r0
	str	r0, [r5, #32]
	str	r3, [r5, #36]
	beq	.L79
	cmp	r1, #2
	ldreq	r1, .L80+48
	ldreq	r3, [r1]
	subeq	r3, r3, #1
	streq	r3, [r1]
	b	.L48
.L39:
	cmp	r3, #1
	bne	.L40
	ldr	ip, [r4]
	ldr	r0, [r4, #20]
	ldr	r3, .L80+52
	ldr	r2, [r4, #48]
	add	r0, ip, r0
	add	lr, r3, #1088
	add	r0, r0, r2
	sub	ip, ip, r2
	add	lr, lr, #4
.L43:
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
	bne	.L43
	b	.L40
.L31:
	cmp	r3, #1
	beq	.L34
.L72:
	ldr	r7, .L80+8
	b	.L33
.L79:
	ldr	r1, .L80+56
	ldr	r3, [r1]
	sub	r3, r3, #1
	str	r3, [r1]
	b	.L48
.L78:
	mov	r2, #0
	ldr	r3, [r7, #68]
	sub	r3, r3, #5
	str	r3, [r7, #68]
	ldr	r3, .L80+60
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	b	.L47
.L32:
	mov	r3, #1
	str	r3, [r5, #48]
.L34:
	ldr	r3, [r5, #40]
	cmp	r3, r2
	ldrgt	r3, [r5, #16]
	addgt	r2, r2, r3
	strgt	r2, [r5, #8]
	bgt	.L72
.L35:
	mov	r3, #0
	ldr	r7, .L80+8
	str	r3, [r5, #48]
	b	.L33
.L81:
	.align	2
.L80:
	.word	hOff
	.word	vOff
	.word	player
	.word	allBalloons+8
	.word	collision
	.word	8997
	.word	pop
	.word	playSoundB
	.word	healthTimer
	.word	28633115
	.word	-1775253149
	.word	57266230
	.word	remainingEnemiesL2
	.word	bees
	.word	remainingEnemies
	.word	updateHearts
	.size	updateBuzz, .-updateBuzz
	.comm	healthTimer,4,4
	.comm	bees,1092,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

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
	mov	r0, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r7, #203
	mov	r1, #240
	mov	r2, r0
	mov	r9, #20
	mov	r8, #23
	mov	ip, #1
	mov	r6, #3
	ldr	r3, .L6
	ldr	r5, [r3]
	ldr	r3, .L6+4
	sub	r5, r7, r5
.L2:
	str	r0, [r3, #56]
	add	r0, r0, #1
	add	r4, r1, #58
	sub	lr, r1, #35
	cmp	r0, #8
	str	r1, [r3, #8]
	str	r9, [r3, #24]
	str	r8, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #52]
	str	r2, [r3, #48]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r2, [r3, #36]
	str	r7, [r3, #12]
	str	r5, [r3, #4]
	str	r6, [r3, #64]
	str	r2, [r3, #72]
	str	r4, [r3, #40]
	str	lr, [r3, #44]
	add	r1, r1, #30
	add	r3, r3, #80
	bne	.L2
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	vOff
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
	add	r3, r3, #1
	beq	.L9
	ldr	r2, [r0]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	push	{r4, lr}
	ldr	r1, [r0, #64]
	ldr	r4, [r0, #72]
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
	streq	r3, [r0, #64]
	beq	.L21
	cmp	r3, #1
	moveq	r3, #2
	streq	r3, [r0, #64]
.L21:
	ldr	r3, [r0, #52]
	cmp	r3, #1
	moveq	r3, #3
	streq	r3, [r0, #72]
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
	ldr	r9, .L55
	ldr	r2, [r0, #8]
	ldr	r3, [r9]
	sub	r3, r2, r3
	cmp	r3, #239
	mov	r4, r0
	sub	sp, sp, #20
	bhi	.L24
	ldr	r1, [r0, #36]
	cmp	r1, #0
	bne	.L24
	mov	r1, #1
	str	r3, [r0]
	str	r1, [r0, #32]
.L25:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L27
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L28
	ldr	r3, [r4, #44]
	cmp	r2, r3
	ble	.L29
	ldr	r3, [r4, #16]
	sub	r2, r2, r3
	str	r2, [r4, #8]
	ldr	r6, .L55+4
.L30:
	ldr	r5, .L55+8
	ldr	r1, [r4, #12]
	ldr	r0, [r4, #28]
	ldr	ip, [r4, #24]
	ldr	r10, .L55+12
	ldr	fp, .L55+16
	add	r7, r5, #280
.L36:
	ldr	r3, [r5, #40]
	cmp	r3, #0
	beq	.L34
	ldr	r8, [r5, #48]
	cmp	r8, #0
	beq	.L54
.L34:
	add	r5, r5, #56
	cmp	r5, r7
	bne	.L36
	str	r0, [sp, #8]
	str	r2, [sp]
	str	ip, [sp, #12]
	str	r1, [sp, #4]
	add	r0, r6, #8
	ldr	r3, [r6, #24]
	ldr	r2, [r6, #28]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	movne	r3, #0
	ldr	r2, [r6, #8]
	ldr	r0, [r4, #44]
	strne	r3, [r6, #56]
	ldr	r1, [r9]
	ldr	r3, [r4, #8]
	cmp	r2, r0
	sub	r3, r3, r1
	blt	.L26
	ldr	r1, [r4, #40]
	cmp	r2, r1
	movle	r2, #1
	strle	r2, [r4, #52]
.L26:
	mov	r0, r4
	ldr	r1, .L55+20
	ldr	r2, [r4, #12]
	ldr	r1, [r1]
	sub	r2, r2, r1
	str	r3, [r4]
	str	r2, [r4, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateBuzz
.L24:
	ldr	r1, [r4, #32]
	cmp	r1, #0
	beq	.L26
	b	.L25
.L27:
	cmp	r3, #1
	ldr	r6, .L55+4
	bne	.L30
	ldr	r3, [r6, #8]
	cmp	r2, r3
	movlt	r3, #1
	movge	r3, #0
	str	r3, [r4, #48]
	ldr	r3, [r4, #16]
	subge	r2, r2, r3
	addlt	r2, r2, r3
	str	r2, [r4, #8]
	b	.L30
.L54:
	str	ip, [sp, #12]
	str	r0, [sp, #8]
	str	r2, [sp]
	str	r1, [sp, #4]
	add	r0, r5, #8
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #28]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, [fp]
	strne	r8, [r5, #40]
	subne	r3, r3, #1
	strne	r2, [r4, #36]
	strne	r8, [r4, #32]
	strne	r3, [fp]
	ldr	r2, [r4, #8]
	ldr	r1, [r4, #12]
	ldr	r0, [r4, #28]
	ldr	ip, [r4, #24]
	b	.L34
.L28:
	cmp	r3, #1
	beq	.L31
.L52:
	ldr	r6, .L55+4
	b	.L30
.L29:
	mov	r3, #1
	str	r3, [r4, #48]
.L31:
	ldr	r3, [r4, #40]
	cmp	r2, r3
	ldrlt	r3, [r4, #16]
	addlt	r2, r2, r3
	strlt	r2, [r4, #8]
	blt	.L52
.L32:
	mov	r3, #0
	ldr	r6, .L55+4
	str	r3, [r4, #48]
	b	.L30
.L56:
	.align	2
.L55:
	.word	hOff
	.word	player
	.word	balloons
	.word	collision
	.word	remainingEnemies
	.word	vOff
	.size	updateBuzz, .-updateBuzz
	.comm	bees,640,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

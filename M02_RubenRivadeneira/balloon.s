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
	.file	"balloon.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHeldBalloon.part.0, %function
updateHeldBalloon.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L16
	ldr	r2, [r3, #64]
	cmp	r2, #0
	bne	.L2
	ldr	r2, [r3, #72]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L1
.L4:
	.word	.L6
	.word	.L7
	.word	.L5
	.word	.L6
	.word	.L5
	.word	.L3
.L9:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #3
	add	r3, r3, #16
	str	r2, [r0, #8]
	str	r3, [r0, #12]
.L1:
	bx	lr
.L2:
	cmp	r2, #1
	bxne	lr
	ldr	r2, [r3, #72]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L1
.L10:
	.word	.L12
	.word	.L13
	.word	.L11
	.word	.L12
	.word	.L11
	.word	.L9
.L5:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #18
	sub	r3, r3, #6
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L6:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	add	r3, r2, #16
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L11:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	sub	r2, r2, #2
	sub	r3, r3, #6
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L12:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L7:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	add	r3, r2, #18
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L3:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #13
	add	r3, r3, #16
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L13:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	sub	r3, r2, #2
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L17:
	.align	2
.L16:
	.word	player
	.size	updateHeldBalloon.part.0, .-updateHeldBalloon.part.0
	.align	2
	.global	initBalloons
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalloons, %function
initBalloons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, #16
	ldr	r9, .L24
	mov	r1, r2
	mov	r3, r9
	mov	r8, #12
	mov	r10, #1
	ldr	r5, .L24+4
	ldr	ip, .L24+8
	ldr	lr, .L24+12
	ldr	r0, [r5, #8]
	ldr	r4, [ip]
	ldr	lr, [lr]
	ldr	ip, [r5, #12]
	ldr	r6, [r5, #16]
	add	r0, r0, r7
	ldr	r5, [r5, #20]
	sub	r4, r0, r4
	sub	lr, ip, lr
.L22:
	cmp	r2, #0
	stm	r3, {r4, lr}
	str	r8, [r3, #28]
	str	r7, [r3, #24]
	str	r1, [r3, #44]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r1, [r3, #48]
	str	r1, [r3, #40]
	str	r2, [r3, #52]
	str	r0, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #32]
	str	ip, [r3, #36]
	streq	r10, [r9, #40]
	streq	r10, [r9, #48]
	beq	.L20
	cmp	r2, #4
	beq	.L18
.L20:
	add	r2, r2, #1
	add	r3, r3, #56
	b	.L22
.L18:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	balloons
	.word	player
	.word	hOff
	.word	vOff
	.size	initBalloons, .-initBalloons
	.align	2
	.global	updateBalloons
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBalloons, %function
updateBalloons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #40]
	cmp	r3, #0
	push	{r4, lr}
	mov	r4, r0
	beq	.L34
	ldr	r3, [r0]
	cmp	r3, #239
	bls	.L29
	mov	r1, #0
	ldr	r2, .L35
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #16
	str	r3, [r0, #8]
	str	r3, [r0, #32]
	str	r2, [r0, #12]
	str	r2, [r0, #36]
	str	r1, [r0, #40]
	str	r1, [r0, #48]
	b	.L28
.L29:
	ldr	r1, [r0, #48]
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
	cmp	r1, #0
	str	r3, [r0, #32]
	str	r2, [r0, #36]
	beq	.L28
	bl	updateHeldBalloon.part.0
.L34:
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
.L28:
	ldr	r0, .L35+4
	ldr	r1, .L35+8
	ldr	r0, [r0]
	ldr	r1, [r1]
	sub	r3, r3, r0
	sub	r2, r2, r1
	str	r3, [r4]
	str	r2, [r4, #4]
	pop	{r4, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	player
	.word	hOff
	.word	vOff
	.size	updateBalloons, .-updateBalloons
	.align	2
	.global	drawBalloons
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBalloons, %function
drawBalloons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #40]
	ldr	r3, [r0, #52]
	cmp	r2, #0
	add	r3, r3, #10
	beq	.L38
	str	lr, [sp, #-4]!
	mov	lr, #768
	ldr	r2, [r0]
	ldr	ip, .L44
	lsl	r2, r2, #23
	ldrb	r0, [r0, #4]	@ zero_extendqisi2
	lsr	r2, r2, #23
	add	r1, ip, r3, lsl #3
	orr	r2, r2, #16384
	lsl	r3, r3, #3
	strh	lr, [r1, #4]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r0, [ip, r3]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L38:
	mov	r1, #512
	ldr	r2, .L44
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L45:
	.align	2
.L44:
	.word	shadowOAM
	.size	drawBalloons, .-drawBalloons
	.align	2
	.global	updateHeldBalloon
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHeldBalloon, %function
updateHeldBalloon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #48]
	cmp	r2, #0
	bxeq	lr
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bxeq	lr
	b	updateHeldBalloon.part.0
	.size	updateHeldBalloon, .-updateHeldBalloon
	.comm	balloons,280,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

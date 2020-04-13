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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBalloons.part.0, %function
drawBalloons.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #768
	ldr	r3, [r0]
	ldr	r2, [r0, #52]
	ldr	ip, .L4
	lsl	r3, r3, #23
	ldrb	r0, [r0, #4]	@ zero_extendqisi2
	add	r2, r2, #10
	lsr	r3, r3, #23
	add	r1, ip, r2, lsl #3
	orr	r3, r3, #16384
	lsl	r2, r2, #3
	strh	lr, [r1, #4]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [ip, r2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	shadowOAM
	.size	drawBalloons.part.0, .-drawBalloons.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHeldBalloon.part.0, %function
updateHeldBalloon.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L20
	ldr	r2, [r3, #64]
	cmp	r2, #0
	bne	.L7
	ldr	r2, [r3, #72]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L6
.L9:
	.word	.L11
	.word	.L12
	.word	.L10
	.word	.L11
	.word	.L10
	.word	.L8
.L14:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #3
	add	r3, r3, #16
	str	r2, [r0, #8]
	str	r3, [r0, #12]
.L6:
	bx	lr
.L7:
	cmp	r2, #1
	bxne	lr
	ldr	r2, [r3, #72]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L6
.L15:
	.word	.L17
	.word	.L18
	.word	.L16
	.word	.L17
	.word	.L16
	.word	.L14
.L10:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #18
	sub	r3, r3, #6
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L11:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	add	r3, r2, #16
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L16:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	sub	r2, r2, #2
	sub	r3, r3, #6
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L17:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L12:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	add	r3, r2, #18
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L8:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #13
	add	r3, r3, #16
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L18:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	sub	r3, r2, #2
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L21:
	.align	2
.L20:
	.word	player
	.size	updateHeldBalloon.part.0, .-updateHeldBalloon.part.0
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #512
	ldr	r3, .L28
	mov	lr, pc
	bx	r3
	ldr	r4, .L28+4
	ldr	r0, .L28+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L28+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L28+16
	mov	lr, pc
	bx	r4
	ldr	r4, .L28+20
	ldr	r6, .L28+24
	add	r5, r4, #280
.L25:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L23
	mov	r0, r4
	bl	drawBalloons.part.0
.L24:
	add	r4, r4, #56
	cmp	r5, r4
	bne	.L25
	ldr	r3, .L28+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L28+32
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L28+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r3, .L28+36
	ldr	r2, [r3]
	add	r3, r2, r2, lsr #31
	asr	r3, r3, #1
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r1, #16]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r3, [r1, #20]	@ movhi
	bx	lr
.L23:
	ldr	r3, [r4, #52]
	add	r3, r6, r3, lsl #3
	strh	r7, [r3, #80]	@ movhi
	b	.L24
.L29:
	.align	2
.L28:
	.word	drawPlayer
	.word	drawBuzz
	.word	bees
	.word	bees+80
	.word	bees+160
	.word	balloons
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.size	drawGame, .-drawGame
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
	ldr	r9, .L36
	mov	r1, r2
	mov	r3, r9
	mov	r8, #12
	mov	r10, #1
	ldr	r5, .L36+4
	ldr	ip, .L36+8
	ldr	lr, .L36+12
	ldr	r0, [r5, #8]
	ldr	r4, [ip]
	ldr	lr, [lr]
	ldr	ip, [r5, #12]
	ldr	r6, [r5, #16]
	add	r0, r0, r7
	ldr	r5, [r5, #20]
	sub	r4, r0, r4
	sub	lr, ip, lr
.L34:
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
	beq	.L32
	cmp	r2, #4
	beq	.L30
.L32:
	add	r2, r2, #1
	add	r3, r3, #56
	b	.L34
.L30:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	balloons
	.word	player
	.word	hOff
	.word	vOff
	.size	initBalloons, .-initBalloons
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #96
	mov	r1, #0
	push	{r4, lr}
	mov	r2, #67108864
	mov	lr, #1
	mov	r0, #3
	ldr	ip, .L40
	str	r3, [ip]
	ldr	ip, .L40+4
	str	r1, [ip]
	ldr	ip, .L40+8
	str	r1, [ip]
	ldr	ip, .L40+12
	ldr	r1, .L40+16
	str	lr, [ip]
	str	r0, [r1]
	strh	r3, [r2, #18]	@ movhi
	ldr	r1, .L40+20
	strh	r3, [r2, #22]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L40+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	initBalloons
.L41:
	.align	2
.L40:
	.word	vOff
	.word	hOff
	.word	numBalloons
	.word	direction
	.word	remainingEnemies
	.word	initPlayer
	.word	initBuzz
	.size	initGame, .-initGame
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
	beq	.L50
	ldr	r3, [r0]
	cmp	r3, #239
	bls	.L45
	mov	r1, #0
	ldr	r2, .L51
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #16
	str	r3, [r0, #8]
	str	r3, [r0, #32]
	str	r2, [r0, #12]
	str	r2, [r0, #36]
	str	r1, [r0, #40]
	str	r1, [r0, #48]
	b	.L44
.L45:
	ldr	r1, [r0, #48]
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
	cmp	r1, #0
	str	r3, [r0, #32]
	str	r2, [r0, #36]
	beq	.L44
	bl	updateHeldBalloon.part.0
.L50:
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
.L44:
	ldr	r0, .L51+4
	ldr	r1, .L51+8
	ldr	r0, [r0]
	ldr	r1, [r1]
	sub	r3, r3, r0
	sub	r2, r2, r1
	str	r3, [r4]
	str	r2, [r4, #4]
	pop	{r4, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	player
	.word	hOff
	.word	vOff
	.size	updateBalloons, .-updateBalloons
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	ldr	r4, .L66+4
	ldr	r0, .L66+8
	mov	lr, pc
	bx	r4
	ldr	r5, .L66+12
	ldr	r0, .L66+16
	mov	lr, pc
	bx	r4
	ldr	r0, .L66+20
	mov	lr, pc
	bx	r4
	mov	r8, r5
	mov	r4, r5
	mov	r6, #0
	add	r7, r5, #280
.L55:
	mov	r0, r4
	bl	updateBalloons
	ldr	r3, [r4, #40]
	add	r4, r4, #56
	cmp	r3, #0
	addne	r6, r6, #1
	cmp	r7, r4
	bne	.L55
	cmp	r6, #4
	bgt	.L53
	mov	r3, #0
.L58:
	ldr	r2, [r5, #40]
	cmp	r2, #0
	beq	.L65
	add	r3, r3, #1
	cmp	r3, #5
	add	r5, r5, #56
	bne	.L58
.L53:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L65:
	mov	r2, #1
	rsb	r3, r3, r3, lsl #3
	add	r3, r8, r3, lsl #3
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	updatePlayer
	.word	updateBuzz
	.word	bees
	.word	balloons
	.word	bees+80
	.word	bees+160
	.size	updateGame, .-updateGame
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
	@ link register save eliminated.
	ldr	r2, [r0, #40]
	cmp	r2, #0
	bne	drawBalloons.part.0
.L69:
	mov	r2, #512
	ldr	r1, [r0, #52]
	ldr	r3, .L70
	add	r3, r3, r1, lsl #3
	strh	r2, [r3, #80]	@ movhi
	bx	lr
.L71:
	.align	2
.L70:
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
	.comm	numBalloons,4,4
	.comm	remainingEnemies,4,4
	.comm	balloons,280,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

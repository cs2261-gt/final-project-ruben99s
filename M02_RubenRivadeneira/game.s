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
	.global	initGame
	.arch armv4t
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
	mov	r0, #8
	ldr	ip, .L4
	str	r3, [ip]
	ldr	ip, .L4+4
	str	r1, [ip]
	ldr	ip, .L4+8
	str	r1, [ip]
	ldr	ip, .L4+12
	ldr	r1, .L4+16
	str	lr, [ip]
	str	r0, [r1]
	strh	r3, [r2, #18]	@ movhi
	ldr	r1, .L4+20
	strh	r3, [r2, #22]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	vOff
	.word	hOff
	.word	numBalloons
	.word	direction
	.word	remainingEnemies
	.word	initPlayer
	.word	initBuzz
	.word	initBalloons
	.size	initGame, .-initGame
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	ldr	r4, .L21+4
	ldr	r6, .L21+8
	add	r5, r4, #640
.L7:
	mov	r0, r4
	add	r4, r4, #80
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L7
	ldr	r5, .L21+12
	mov	r6, #0
	mov	r8, r5
	mov	r4, r5
	ldr	r9, .L21+16
	add	r7, r5, #280
.L9:
	mov	r0, r4
	mov	lr, pc
	bx	r9
	ldr	r3, [r4, #40]
	add	r4, r4, #56
	cmp	r3, #0
	addne	r6, r6, #1
	cmp	r4, r7
	bne	.L9
	cmp	r6, #4
	bgt	.L6
	mov	r3, #0
.L12:
	ldr	r2, [r5, #40]
	cmp	r2, #0
	beq	.L20
	add	r3, r3, #1
	cmp	r3, #5
	add	r5, r5, #56
	bne	.L12
.L6:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L20:
	mov	r2, #1
	rsb	r3, r3, r3, lsl #3
	add	r3, r8, r3, lsl #3
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	updatePlayer
	.word	bees
	.word	updateBuzz
	.word	balloons
	.word	updateBalloons
	.size	updateGame, .-updateGame
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L27
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+4
	ldr	r6, .L27+8
	add	r5, r4, #640
.L24:
	mov	r0, r4
	add	r4, r4, #80
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L24
	ldr	r4, .L27+12
	ldr	r0, .L27+16
	mov	lr, pc
	bx	r4
	ldr	r0, .L27+20
	mov	lr, pc
	bx	r4
	ldr	r0, .L27+24
	mov	lr, pc
	bx	r4
	ldr	r0, .L27+28
	mov	lr, pc
	bx	r4
	ldr	r0, .L27+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+36
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+40
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L27+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r3, .L27+48
	ldr	r2, [r3]
	add	r3, r2, r2, lsr #31
	asr	r3, r3, #1
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r1, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r3, [r1, #20]	@ movhi
	bx	lr
.L28:
	.align	2
.L27:
	.word	drawPlayer
	.word	bees
	.word	drawBuzz
	.word	drawBalloons
	.word	balloons
	.word	balloons+56
	.word	balloons+112
	.word	balloons+168
	.word	balloons+224
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff
	.size	drawGame, .-drawGame
	.comm	numBalloons,4,4
	.comm	remainingEnemies,4,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

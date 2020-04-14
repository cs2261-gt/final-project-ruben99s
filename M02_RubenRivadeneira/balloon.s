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
	.global	initBalloonsSingle
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalloonsSingle, %function
initBalloonsSingle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #16
	ldr	fp, .L8
	mov	r2, r1
	mov	r3, fp
	mov	r10, #12
	mov	r8, #24
	ldr	r5, .L8+4
	ldr	ip, .L8+8
	ldr	lr, .L8+12
	ldr	r0, [r5, #8]
	ldr	r4, [ip]
	ldr	lr, [lr]
	ldr	ip, [r5, #12]
	ldr	r6, [r5, #16]
	add	r0, r0, r9
	ldr	r5, [r5, #20]
	sub	r4, r0, r4
	sub	lr, ip, lr
.L5:
	mov	r7, #3
	cmp	r1, #0
	str	r7, [r3, #72]
	moveq	r7, #1
	stm	r3, {r4, lr}
	str	r10, [r3, #28]
	str	r9, [r3, #24]
	str	r2, [r3, #44]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r2, [r3, #48]
	str	r2, [r3, #40]
	str	r1, [r3, #52]
	str	r0, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #32]
	str	ip, [r3, #36]
	str	r2, [r3, #60]
	str	r8, [r3, #64]
	str	r2, [r3, #68]
	streq	r7, [fp, #40]
	streq	r7, [fp, #48]
	beq	.L3
	cmp	r1, #4
	beq	.L1
.L3:
	add	r1, r1, #1
	add	r3, r3, #76
	b	.L5
.L1:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	allBalloons
	.word	player
	.word	hOff
	.word	vOff
	.size	initBalloonsSingle, .-initBalloonsSingle
	.align	2
	.global	initBalloonsAOE
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalloonsAOE, %function
initBalloonsAOE:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, #16
	mov	r2, #5
	mov	fp, #12
	mov	lr, #1
	mov	r1, #0
	mov	r9, #50
	ldr	r6, .L17
	ldr	r0, .L17+4
	ldr	ip, .L17+8
	ldr	r7, [r6, #8]
	ldr	r5, [r0]
	ldr	r4, [ip]
	ldr	r0, [r6, #12]
	add	ip, r7, r10
	ldr	r3, .L17+12
	ldr	r7, [r6, #16]
	ldr	r6, [r6, #20]
	sub	r5, ip, r5
	sub	r4, r0, r4
.L14:
	mov	r8, #2
	str	r8, [r3, #440]
	mov	r8, #24
	str	r8, [r3, #444]
	mov	r8, #3
	cmp	r2, #5
	str	r2, [r3, #432]
	str	fp, [r3, #408]
	str	r10, [r3, #404]
	str	lr, [r3, #424]
	str	r7, [r3, #396]
	str	r6, [r3, #400]
	str	r1, [r3, #428]
	str	r1, [r3, #420]
	str	r9, [r3, #436]
	str	ip, [r3, #388]
	str	r0, [r3, #392]
	str	r5, [r3, #380]
	str	r4, [r3, #384]
	str	ip, [r3, #412]
	str	r0, [r3, #416]
	str	r1, [r3, #448]
	str	r8, [r3, #452]
	add	r2, r2, #1
	beq	.L16
	cmp	r2, #10
	beq	.L10
.L12:
	add	r3, r3, #76
	b	.L14
.L16:
	ldr	r8, .L17+12
	str	lr, [r8, #420]
	str	lr, [r8, #428]
	b	.L12
.L10:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	player
	.word	hOff
	.word	vOff
	.word	allBalloons
	.size	initBalloonsAOE, .-initBalloonsAOE
	.align	2
	.global	initJumpBalloon
	.syntax unified
	.arm
	.fpu softvfp
	.type	initJumpBalloon, %function
initJumpBalloon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #16
	mov	r7, #10
	mov	r10, #12
	mov	r8, #2
	mov	r6, #4
	mov	r5, #24
	mov	r4, #0
	mov	lr, #3
	mov	ip, #1
	ldr	r2, .L21
	ldr	r3, .L21+4
	ldr	r1, [r2, #8]
	ldr	r0, [r3]
	add	r1, r1, r9
	ldr	r3, .L21+8
	sub	r0, r1, r0
	str	r0, [r3, #760]
	str	r1, [r3, #768]
	ldr	r0, [r2, #16]
	ldr	r1, .L21+12
	str	r0, [r3, #776]
	ldr	r1, [r1]
	ldr	r0, [r2, #12]
	str	r7, [r3, #812]
	ldr	r7, [r2, #20]
	sub	r2, r0, r1
	str	r10, [r3, #788]
	str	r9, [r3, #784]
	str	r8, [r3, #804]
	str	r7, [r3, #780]
	str	r6, [r3, #820]
	str	r5, [r3, #824]
	str	r4, [r3, #828]
	str	lr, [r3, #832]
	str	r0, [r3, #772]
	str	r2, [r3, #764]
	str	ip, [r3, #808]
	str	ip, [r3, #800]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	player
	.word	hOff
	.word	allBalloons
	.word	vOff
	.size	initJumpBalloon, .-initJumpBalloon
	.align	2
	.global	initCheatBalloon
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCheatBalloon, %function
initCheatBalloon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r8, #16
	mov	r7, #11
	mov	lr, #3
	mov	r9, #12
	mov	r6, #6
	mov	r5, #24
	mov	r4, #0
	mov	ip, #1
	ldr	r2, .L25
	ldr	r3, .L25+4
	ldr	r1, [r2, #8]
	ldr	r0, [r3]
	add	r1, r1, r8
	ldr	r3, .L25+8
	sub	r0, r1, r0
	str	r0, [r3, #836]
	str	r1, [r3, #844]
	ldr	r0, [r2, #16]
	ldr	r1, .L25+12
	str	r0, [r3, #852]
	ldr	r1, [r1]
	ldr	r0, [r2, #12]
	str	r7, [r3, #888]
	ldr	r7, [r2, #20]
	sub	r2, r0, r1
	str	r9, [r3, #864]
	str	r8, [r3, #860]
	str	r7, [r3, #856]
	str	r6, [r3, #896]
	str	r5, [r3, #900]
	str	r4, [r3, #904]
	str	lr, [r3, #880]
	str	lr, [r3, #908]
	str	r0, [r3, #848]
	str	r2, [r3, #840]
	str	ip, [r3, #884]
	str	ip, [r3, #876]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	player
	.word	hOff
	.word	allBalloons
	.word	vOff
	.size	initCheatBalloon, .-initCheatBalloon
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
	push	{r4, lr}
	bl	initBalloonsSingle
	bl	initBalloonsAOE
	bl	initJumpBalloon
	pop	{r4, lr}
	b	initCheatBalloon
	.size	initBalloons, .-initBalloons
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
	add	r3, r3, #1
	beq	.L30
	push	{r4, lr}
	ldr	r2, [r0]
	ldr	r4, [r0, #64]
	ldr	r1, [r0, #60]
	ldr	ip, .L36
	lsl	r2, r2, #23
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	lsr	r2, r2, #23
	add	r0, ip, r3, lsl #3
	add	r1, r1, r4, lsl #5
	orr	r2, r2, #16384
	lsl	r3, r3, #3
	strh	lr, [ip, r3]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L30:
	mov	r1, #512
	ldr	r2, .L36
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L37:
	.align	2
.L36:
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
	ldr	r3, .L52
	ldr	r2, [r3, #76]
	cmp	r2, #0
	bne	.L39
	ldr	r2, [r3, #84]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L38
.L41:
	.word	.L43
	.word	.L44
	.word	.L42
	.word	.L43
	.word	.L42
	.word	.L40
.L46:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #3
	add	r3, r3, #16
	str	r2, [r0, #8]
	str	r3, [r0, #12]
.L38:
	bx	lr
.L39:
	cmp	r2, #1
	bxne	lr
	ldr	r2, [r3, #84]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L38
.L47:
	.word	.L49
	.word	.L50
	.word	.L48
	.word	.L49
	.word	.L48
	.word	.L46
.L42:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #18
	sub	r3, r3, #6
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L43:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	add	r3, r2, #16
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L48:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	sub	r2, r2, #2
	sub	r3, r3, #6
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L49:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L44:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	add	r3, r2, #18
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L40:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #13
	add	r3, r3, #16
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L50:
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	sub	r3, r2, #2
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
.L53:
	.align	2
.L52:
	.word	player
	.size	updateHeldBalloon, .-updateHeldBalloon
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
	beq	.L62
	ldr	r3, [r0]
	cmp	r3, #239
	bls	.L57
	mov	r1, #0
	ldr	r2, .L63
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #16
	str	r3, [r0, #8]
	str	r3, [r0, #32]
	str	r2, [r0, #12]
	str	r2, [r0, #36]
	str	r1, [r0, #40]
	str	r1, [r0, #48]
	b	.L56
.L57:
	ldr	r1, [r0, #48]
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
	cmp	r1, #0
	str	r3, [r0, #32]
	str	r2, [r0, #36]
	beq	.L56
	bl	updateHeldBalloon
.L62:
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
.L56:
	ldr	r0, .L63+4
	ldr	r1, .L63+8
	ldr	r0, [r0]
	ldr	r1, [r1]
	sub	r3, r3, r0
	sub	r2, r2, r1
	str	r3, [r4]
	str	r2, [r4, #4]
	pop	{r4, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	player
	.word	hOff
	.word	vOff
	.size	updateBalloons, .-updateBalloons
	.align	2
	.global	updateDropBalloon
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDropBalloon, %function
updateDropBalloon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r0, #32
	ldm	r2, {r2, r3}
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
	.size	updateDropBalloon, .-updateDropBalloon
	.comm	allBalloons,912,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

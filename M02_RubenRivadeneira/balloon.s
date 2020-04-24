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
	.global	__aeabi_idivmod
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBalloons.part.0, %function
animateBalloons.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L5
	ldr	r4, [r0, #68]
	smull	r1, r2, r3, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #1
	mov	r5, r0
	bne	.L2
	ldr	r0, [r0, #64]
	ldr	r1, [r5, #72]
	ldr	r3, .L5+4
	sub	r0, r0, #22
	lsl	r1, r1, #1
	mov	lr, pc
	bx	r3
	add	r1, r1, #24
	str	r1, [r5, #64]
.L2:
	add	r4, r4, #1
	str	r4, [r5, #68]
	pop	{r4, r5, r6, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateBalloons.part.0, .-animateBalloons.part.0
	.align	2
	.global	initBalloonsSingle
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
	ldr	fp, .L13
	mov	r2, r1
	mov	r3, fp
	mov	r10, #12
	mov	r8, #24
	ldr	ip, .L13+4
	ldr	r4, .L13+8
	ldr	lr, .L13+12
	ldr	r0, [ip, #8]
	ldr	r7, [ip, #12]
	ldr	r4, [r4]
	ldr	lr, [lr]
	add	r0, r0, r9
	ldr	r6, [ip, #16]
	ldr	r5, [ip, #20]
	sub	r4, r0, r4
	asr	ip, r7, #8
	rsb	lr, lr, r7, asr #8
.L11:
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
	beq	.L9
	cmp	r1, #4
	beq	.L7
.L9:
	add	r1, r1, #1
	add	r3, r3, #76
	b	.L11
.L7:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
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
	mov	r9, #16
	mov	r2, #5
	mov	r10, #12
	mov	lr, #1
	mov	r1, #0
	mov	fp, #3
	ldr	ip, .L22
	ldr	r4, .L22+4
	ldr	r0, .L22+8
	ldr	r6, [ip, #8]
	ldr	r5, [r4]
	ldr	r8, [ip, #12]
	ldr	r4, [r0]
	ldr	r3, .L22+12
	add	r0, r6, r9
	ldr	r7, [ip, #16]
	ldr	r6, [ip, #20]
	sub	r5, r0, r5
	asr	ip, r8, #8
	rsb	r4, r4, r8, asr #8
.L19:
	mov	r8, #35
	str	r8, [r3, #436]
	mov	r8, #2
	str	r8, [r3, #440]
	mov	r8, #24
	cmp	r2, #5
	str	r2, [r3, #432]
	str	r10, [r3, #408]
	str	r9, [r3, #404]
	str	lr, [r3, #424]
	str	r7, [r3, #396]
	str	r6, [r3, #400]
	str	r1, [r3, #428]
	str	r1, [r3, #420]
	str	r0, [r3, #388]
	str	ip, [r3, #392]
	str	r5, [r3, #380]
	str	r4, [r3, #384]
	str	r0, [r3, #412]
	str	ip, [r3, #416]
	str	r8, [r3, #444]
	str	r1, [r3, #448]
	str	fp, [r3, #452]
	add	r2, r2, #1
	beq	.L21
	cmp	r2, #10
	beq	.L15
.L17:
	add	r3, r3, #76
	b	.L19
.L21:
	ldr	r8, .L22+12
	str	lr, [r8, #420]
	str	lr, [r8, #428]
	b	.L17
.L15:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L23:
	.align	2
.L22:
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
	mov	r10, #12
	mov	r8, #2
	mov	r7, #10
	mov	r6, #4
	mov	r5, #24
	mov	r4, #0
	mov	lr, #3
	mov	ip, #1
	ldr	r2, .L26
	ldr	r3, .L26+4
	ldr	r1, [r2, #8]
	ldr	r0, [r3]
	add	r1, r1, r9
	ldr	r3, .L26+8
	sub	r0, r1, r0
	str	r0, [r3, #760]
	ldr	r0, [r2, #16]
	str	r1, [r3, #768]
	ldr	r1, .L26+12
	str	r0, [r3, #776]
	ldr	r0, [r2, #20]
	ldr	r2, [r2, #12]
	ldr	r1, [r1]
	asr	r2, r2, #8
	sub	r1, r2, r1
	str	r10, [r3, #788]
	str	r9, [r3, #784]
	str	r8, [r3, #804]
	str	r7, [r3, #812]
	str	r6, [r3, #820]
	str	r5, [r3, #824]
	str	r4, [r3, #828]
	str	lr, [r3, #832]
	str	r0, [r3, #780]
	str	r2, [r3, #772]
	str	r1, [r3, #764]
	str	ip, [r3, #808]
	str	ip, [r3, #800]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L27:
	.align	2
.L26:
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
	mov	lr, #3
	mov	r9, #12
	mov	r7, #11
	mov	r6, #6
	mov	r5, #24
	mov	r4, #0
	mov	ip, #1
	ldr	r2, .L30
	ldr	r3, .L30+4
	ldr	r1, [r2, #8]
	ldr	r0, [r3]
	add	r1, r1, r8
	ldr	r3, .L30+8
	sub	r0, r1, r0
	str	r0, [r3, #836]
	ldr	r0, [r2, #16]
	str	r1, [r3, #844]
	ldr	r1, .L30+12
	str	r0, [r3, #852]
	ldr	r0, [r2, #20]
	ldr	r2, [r2, #12]
	ldr	r1, [r1]
	asr	r2, r2, #8
	sub	r1, r2, r1
	str	r9, [r3, #864]
	str	r8, [r3, #860]
	str	r7, [r3, #888]
	str	r6, [r3, #896]
	str	r5, [r3, #900]
	str	r4, [r3, #904]
	str	lr, [r3, #880]
	str	lr, [r3, #908]
	str	r0, [r3, #856]
	str	r2, [r3, #848]
	str	r1, [r3, #840]
	str	ip, [r3, #884]
	str	ip, [r3, #876]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L31:
	.align	2
.L30:
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
	beq	.L35
	push	{r4, lr}
	ldr	r2, [r0]
	ldr	r4, [r0, #64]
	ldr	r1, [r0, #60]
	ldr	ip, .L41
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
.L35:
	mov	r1, #512
	ldr	r2, .L41
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L42:
	.align	2
.L41:
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
	ldr	r3, .L57
	ldr	r2, [r3, #76]
	cmp	r2, #0
	bne	.L44
	ldr	r2, [r3, #84]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L43
.L46:
	.word	.L48
	.word	.L49
	.word	.L47
	.word	.L48
	.word	.L47
	.word	.L45
.L51:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	asr	r3, r2, #8
	add	r3, r3, #16
	add	r2, r1, #3
	str	r3, [r0, #12]
	str	r2, [r0, #8]
.L43:
	bx	lr
.L44:
	cmp	r2, #1
	bxne	lr
	ldr	r2, [r3, #84]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L43
.L52:
	.word	.L54
	.word	.L55
	.word	.L53
	.word	.L54
	.word	.L53
	.word	.L51
.L47:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	asr	r3, r2, #8
	sub	r3, r3, #6
	add	r2, r1, #18
	str	r3, [r0, #12]
	str	r2, [r0, #8]
	bx	lr
.L48:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #16
	asr	r3, r3, #8
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L53:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	asr	r3, r2, #8
	sub	r3, r3, #6
	sub	r2, r1, #2
	str	r3, [r0, #12]
	str	r2, [r0, #8]
	bx	lr
.L54:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	asr	r3, r2, #8
	str	r3, [r0, #12]
	str	r1, [r0, #8]
	bx	lr
.L49:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #18
	asr	r3, r3, #8
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L45:
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	asr	r3, r2, #8
	add	r3, r3, #16
	add	r2, r1, #13
	str	r3, [r0, #12]
	str	r2, [r0, #8]
	bx	lr
.L55:
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	sub	r2, r2, #2
	asr	r3, r3, #8
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bx	lr
.L58:
	.align	2
.L57:
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
	bne	.L60
	add	r2, r0, #8
	ldm	r2, {r2, r3}
.L61:
	ldr	r0, .L71
	ldr	r1, .L71+4
	ldr	r0, [r0]
	ldr	r1, [r1]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
.L59:
	pop	{r4, lr}
	bx	lr
.L60:
	ldr	r3, [r0]
	cmp	r3, #239
	bls	.L62
	mov	r1, #0
	ldr	r3, .L71+8
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #16
	asr	r3, r3, #8
	str	r2, [r0, #8]
	str	r2, [r0, #32]
	str	r3, [r0, #12]
	str	r3, [r0, #36]
	str	r1, [r0, #40]
	str	r1, [r0, #48]
	b	.L61
.L62:
	ldr	r1, [r0, #48]
	add	r2, r0, #8
	ldm	r2, {r2, r3}
	cmp	r1, #0
	str	r2, [r0, #32]
	str	r3, [r0, #36]
	bne	.L70
	ldr	r0, .L71
	ldr	r1, .L71+4
	ldr	r0, [r0]
	ldr	r1, [r1]
	sub	r2, r2, r0
	sub	r3, r3, r1
	mov	r0, r4
	stm	r4, {r2, r3}
	pop	{r4, lr}
	b	animateBalloons.part.0
.L70:
	bl	updateHeldBalloon
	ldr	r2, .L71
	ldr	r3, .L71+4
	ldr	ip, [r2]
	ldr	r1, [r4, #40]
	ldr	r2, [r0, #8]
	ldr	r0, [r3]
	ldr	r3, [r4, #12]
	sub	r2, r2, ip
	sub	r3, r3, r0
	cmp	r1, #0
	stm	r4, {r2, r3}
	beq	.L59
	mov	r0, r4
	pop	{r4, lr}
	b	animateBalloons.part.0
.L72:
	.align	2
.L71:
	.word	hOff
	.word	vOff
	.word	player
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
	.align	2
	.global	animateBalloons
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBalloons, %function
animateBalloons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bxeq	lr
	b	animateBalloons.part.0
	.size	animateBalloons, .-animateBalloons
	.comm	allBalloons,912,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

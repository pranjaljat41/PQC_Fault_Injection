
elf/test_glitch.elf:     file format elf32-littlearm


Disassembly of section .text:

08000000 <vector_table>:
 8000000:	00 a0 00 20 5d 75 00 08 5b 75 00 08 59 75 00 08     ... ]u..[u..Yu..
 8000010:	59 75 00 08 59 75 00 08 59 75 00 08 00 00 00 00     Yu..Yu..Yu......
	...
 800002c:	5b 75 00 08 5b 75 00 08 00 00 00 00 5b 75 00 08     [u..[u......[u..
 800003c:	b1 2a 00 08 59 75 00 08 59 75 00 08 59 75 00 08     .*..Yu..Yu..Yu..
 800004c:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 800005c:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 800006c:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 800007c:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 800008c:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 800009c:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 80000ac:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 80000bc:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 80000cc:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 80000dc:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 80000ec:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 80000fc:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 800010c:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 800011c:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 800012c:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 800013c:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 800014c:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 800015c:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 800016c:	59 75 00 08 59 75 00 08 59 75 00 08 59 75 00 08     Yu..Yu..Yu..Yu..
 800017c:	59 75 00 08 59 75 00 08                             Yu..Yu..

08000184 <main>:
 8000184:	b580      	push	{r7, lr}
 8000186:	f5ad 5d94 	sub.w	sp, sp, #4736	@ 0x1280
 800018a:	b086      	sub	sp, #24
 800018c:	2000      	movs	r0, #0
 800018e:	af00      	add	r7, sp, #0
 8000190:	f002 fc16 	bl	80029c0 <hal_setup>
 8000194:	482d      	ldr	r0, [pc, #180]	@ (800024c <main+0xc8>)
 8000196:	f8df 90c0 	ldr.w	r9, [pc, #192]	@ 8000258 <main+0xd4>
 800019a:	f8df 80c0 	ldr.w	r8, [pc, #192]	@ 800025c <main+0xd8>
 800019e:	f002 fc69 	bl	8002a74 <hal_send_str>
 80001a2:	f607 1138 	addw	r1, r7, #2360	@ 0x938
 80001a6:	f507 6093 	add.w	r0, r7, #1176	@ 0x498
 80001aa:	f000 fb7b 	bl	80008a4 <crypto_kem_keypair>
 80001ae:	4828      	ldr	r0, [pc, #160]	@ (8000250 <main+0xcc>)
 80001b0:	f002 fc60 	bl	8002a74 <hal_send_str>
 80001b4:	f507 6293 	add.w	r2, r7, #1176	@ 0x498
 80001b8:	f107 0138 	add.w	r1, r7, #56	@ 0x38
 80001bc:	f107 0058 	add.w	r0, r7, #88	@ 0x58
 80001c0:	f000 fba4 	bl	800090c <crypto_kem_enc>
 80001c4:	f8b7 3058 	ldrh.w	r3, [r7, #88]	@ 0x58
 80001c8:	f483 432a 	eor.w	r3, r3, #43520	@ 0xaa00
 80001cc:	f083 0355 	eor.w	r3, r3, #85	@ 0x55
 80001d0:	f8a7 3058 	strh.w	r3, [r7, #88]	@ 0x58
 80001d4:	1d3c      	adds	r4, r7, #4
 80001d6:	4648      	mov	r0, r9
 80001d8:	f002 fc4c 	bl	8002a74 <hal_send_str>
 80001dc:	f607 1238 	addw	r2, r7, #2360	@ 0x938
 80001e0:	f107 0158 	add.w	r1, r7, #88	@ 0x58
 80001e4:	f107 0018 	add.w	r0, r7, #24
 80001e8:	f000 fbc6 	bl	8000978 <crypto_kem_dec>
 80001ec:	f8df c070 	ldr.w	ip, [pc, #112]	@ 8000260 <main+0xdc>
 80001f0:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 80001f4:	46a6      	mov	lr, r4
 80001f6:	e8ae 000f 	stmia.w	lr!, {r0, r1, r2, r3}
 80001fa:	466e      	mov	r6, sp
 80001fc:	f8dc 3000 	ldr.w	r3, [ip]
 8000200:	f88e 3000 	strb.w	r3, [lr]
 8000204:	b092      	sub	sp, #72	@ 0x48
 8000206:	466d      	mov	r5, sp
 8000208:	f107 0117 	add.w	r1, r7, #23
 800020c:	f10d 0201 	add.w	r2, sp, #1
 8000210:	f107 0c37 	add.w	ip, r7, #55	@ 0x37
 8000214:	f811 3f01 	ldrb.w	r3, [r1, #1]!
 8000218:	0918      	lsrs	r0, r3, #4
 800021a:	f003 030f 	and.w	r3, r3, #15
 800021e:	5c20      	ldrb	r0, [r4, r0]
 8000220:	5ce3      	ldrb	r3, [r4, r3]
 8000222:	f802 0c01 	strb.w	r0, [r2, #-1]
 8000226:	4561      	cmp	r1, ip
 8000228:	f802 3b02 	strb.w	r3, [r2], #2
 800022c:	d1f2      	bne.n	8000214 <main+0x90>
 800022e:	2300      	movs	r3, #0
 8000230:	f885 3040 	strb.w	r3, [r5, #64]	@ 0x40
 8000234:	4640      	mov	r0, r8
 8000236:	f002 fc1d 	bl	8002a74 <hal_send_str>
 800023a:	4628      	mov	r0, r5
 800023c:	f002 fc1a 	bl	8002a74 <hal_send_str>
 8000240:	4804      	ldr	r0, [pc, #16]	@ (8000254 <main+0xd0>)
 8000242:	f002 fc17 	bl	8002a74 <hal_send_str>
 8000246:	46b5      	mov	sp, r6
 8000248:	e7c5      	b.n	80001d6 <main+0x52>
 800024a:	bf00      	nop
 800024c:	08007654 	.word	0x08007654
 8000250:	0800765c 	.word	0x0800765c
 8000254:	0800767c 	.word	0x0800767c
 8000258:	0800766c 	.word	0x0800766c
 800025c:	08007674 	.word	0x08007674
 8000260:	08007680 	.word	0x08007680

08000264 <cbd>:
 8000264:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8000268:	2a00      	cmp	r2, #0
 800026a:	d065      	beq.n	8000338 <cbd+0xd4>
 800026c:	4602      	mov	r2, r0
 800026e:	460d      	mov	r5, r1
 8000270:	f500 7600 	add.w	r6, r0, #512	@ 0x200
 8000274:	f855 1b04 	ldr.w	r1, [r5], #4
 8000278:	f8b2 a004 	ldrh.w	sl, [r2, #4]
 800027c:	8810      	ldrh	r0, [r2, #0]
 800027e:	f8b2 8008 	ldrh.w	r8, [r2, #8]
 8000282:	f8b2 e002 	ldrh.w	lr, [r2, #2]
 8000286:	88d4      	ldrh	r4, [r2, #6]
 8000288:	f8b2 b00a 	ldrh.w	fp, [r2, #10]
 800028c:	f8b2 900c 	ldrh.w	r9, [r2, #12]
 8000290:	084b      	lsrs	r3, r1, #1
 8000292:	f003 3355 	and.w	r3, r3, #1431655765	@ 0x55555555
 8000296:	f001 3155 	and.w	r1, r1, #1431655765	@ 0x55555555
 800029a:	440b      	add	r3, r1
 800029c:	f3c3 2c01 	ubfx	ip, r3, #8, #2
 80002a0:	f003 0103 	and.w	r1, r3, #3
 80002a4:	44d4      	add	ip, sl
 80002a6:	f3c3 4a01 	ubfx	sl, r3, #16, #2
 80002aa:	44c2      	add	sl, r8
 80002ac:	4401      	add	r1, r0
 80002ae:	f3c3 0881 	ubfx	r8, r3, #2, #2
 80002b2:	f3c3 2081 	ubfx	r0, r3, #10, #2
 80002b6:	ebac 0c00 	sub.w	ip, ip, r0
 80002ba:	eba1 0108 	sub.w	r1, r1, r8
 80002be:	2700      	movs	r7, #0
 80002c0:	f3c3 3001 	ubfx	r0, r3, #12, #2
 80002c4:	f3c3 1801 	ubfx	r8, r3, #4, #2
 80002c8:	4420      	add	r0, r4
 80002ca:	44f0      	add	r8, lr
 80002cc:	f3c3 3481 	ubfx	r4, r3, #14, #2
 80002d0:	46be      	mov	lr, r7
 80002d2:	1b00      	subs	r0, r0, r4
 80002d4:	f36c 0e0f 	bfi	lr, ip, #0, #16
 80002d8:	89d4      	ldrh	r4, [r2, #14]
 80002da:	f361 070f 	bfi	r7, r1, #0, #16
 80002de:	f3c3 4181 	ubfx	r1, r3, #18, #2
 80002e2:	ebaa 0c01 	sub.w	ip, sl, r1
 80002e6:	f360 4e1f 	bfi	lr, r0, #16, #16
 80002ea:	f3c3 6101 	ubfx	r1, r3, #24, #2
 80002ee:	f3c3 5001 	ubfx	r0, r3, #20, #2
 80002f2:	eba4 7493 	sub.w	r4, r4, r3, lsr #30
 80002f6:	4458      	add	r0, fp
 80002f8:	4449      	add	r1, r9
 80002fa:	f3c3 5b81 	ubfx	fp, r3, #22, #2
 80002fe:	f3c3 6a81 	ubfx	sl, r3, #26, #2
 8000302:	f3c3 7901 	ubfx	r9, r3, #28, #2
 8000306:	f3c3 1381 	ubfx	r3, r3, #6, #2
 800030a:	eba8 0803 	sub.w	r8, r8, r3
 800030e:	eba0 000b 	sub.w	r0, r0, fp
 8000312:	f368 471f 	bfi	r7, r8, #16, #16
 8000316:	eba1 010a 	sub.w	r1, r1, sl
 800031a:	eb04 0309 	add.w	r3, r4, r9
 800031e:	6017      	str	r7, [r2, #0]
 8000320:	f8c2 e004 	str.w	lr, [r2, #4]
 8000324:	f8a2 c008 	strh.w	ip, [r2, #8]
 8000328:	8150      	strh	r0, [r2, #10]
 800032a:	8191      	strh	r1, [r2, #12]
 800032c:	81d3      	strh	r3, [r2, #14]
 800032e:	3210      	adds	r2, #16
 8000330:	42b2      	cmp	r2, r6
 8000332:	d19f      	bne.n	8000274 <cbd+0x10>
 8000334:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8000338:	4602      	mov	r2, r0
 800033a:	468c      	mov	ip, r1
 800033c:	f500 7600 	add.w	r6, r0, #512	@ 0x200
 8000340:	f85c 0b04 	ldr.w	r0, [ip], #4
 8000344:	0843      	lsrs	r3, r0, #1
 8000346:	f003 3355 	and.w	r3, r3, #1431655765	@ 0x55555555
 800034a:	f000 3055 	and.w	r0, r0, #1431655765	@ 0x55555555
 800034e:	4403      	add	r3, r0
 8000350:	f3c3 0e81 	ubfx	lr, r3, #2, #2
 8000354:	f3c3 2081 	ubfx	r0, r3, #10, #2
 8000358:	2100      	movs	r1, #0
 800035a:	f003 0503 	and.w	r5, r3, #3
 800035e:	f3c3 2401 	ubfx	r4, r3, #8, #2
 8000362:	eba5 050e 	sub.w	r5, r5, lr
 8000366:	f3c3 1981 	ubfx	r9, r3, #6, #2
 800036a:	1a24      	subs	r4, r4, r0
 800036c:	f3c3 3e81 	ubfx	lr, r3, #14, #2
 8000370:	460f      	mov	r7, r1
 8000372:	f3c3 1801 	ubfx	r8, r3, #4, #2
 8000376:	f3c3 3001 	ubfx	r0, r3, #12, #2
 800037a:	eba8 0809 	sub.w	r8, r8, r9
 800037e:	eba0 000e 	sub.w	r0, r0, lr
 8000382:	f365 010f 	bfi	r1, r5, #0, #16
 8000386:	f364 070f 	bfi	r7, r4, #0, #16
 800038a:	f3c3 4a01 	ubfx	sl, r3, #16, #2
 800038e:	f3c3 4581 	ubfx	r5, r3, #18, #2
 8000392:	f3c3 5401 	ubfx	r4, r3, #20, #2
 8000396:	f3c3 5981 	ubfx	r9, r3, #22, #2
 800039a:	f3c3 6e01 	ubfx	lr, r3, #24, #2
 800039e:	f368 411f 	bfi	r1, r8, #16, #16
 80003a2:	f360 471f 	bfi	r7, r0, #16, #16
 80003a6:	f3c3 6881 	ubfx	r8, r3, #26, #2
 80003aa:	f3c3 7001 	ubfx	r0, r3, #28, #2
 80003ae:	ebaa 0505 	sub.w	r5, sl, r5
 80003b2:	eba4 0409 	sub.w	r4, r4, r9
 80003b6:	ebae 0e08 	sub.w	lr, lr, r8
 80003ba:	eba0 7393 	sub.w	r3, r0, r3, lsr #30
 80003be:	6011      	str	r1, [r2, #0]
 80003c0:	6057      	str	r7, [r2, #4]
 80003c2:	8115      	strh	r5, [r2, #8]
 80003c4:	8154      	strh	r4, [r2, #10]
 80003c6:	f8a2 e00c 	strh.w	lr, [r2, #12]
 80003ca:	81d3      	strh	r3, [r2, #14]
 80003cc:	3210      	adds	r2, #16
 80003ce:	4296      	cmp	r6, r2
 80003d0:	d1b6      	bne.n	8000340 <cbd+0xdc>
 80003d2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 80003d6:	bf00      	nop

080003d8 <indcpa_keypair_derand>:
 80003d8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80003dc:	4696      	mov	lr, r2
 80003de:	f6ad 6d48 	subw	sp, sp, #3656	@ 0xe48
 80003e2:	f8de 300c 	ldr.w	r3, [lr, #12]
 80003e6:	4605      	mov	r5, r0
 80003e8:	ac02      	add	r4, sp, #8
 80003ea:	6810      	ldr	r0, [r2, #0]
 80003ec:	460f      	mov	r7, r1
 80003ee:	6851      	ldr	r1, [r2, #4]
 80003f0:	6892      	ldr	r2, [r2, #8]
 80003f2:	46a4      	mov	ip, r4
 80003f4:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
 80003f8:	f8de 0010 	ldr.w	r0, [lr, #16]
 80003fc:	f8de 1014 	ldr.w	r1, [lr, #20]
 8000400:	f8de 2018 	ldr.w	r2, [lr, #24]
 8000404:	f8de 301c 	ldr.w	r3, [lr, #28]
 8000408:	f04f 0803 	mov.w	r8, #3
 800040c:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
 8000410:	4621      	mov	r1, r4
 8000412:	4620      	mov	r0, r4
 8000414:	2221      	movs	r2, #33	@ 0x21
 8000416:	f88d 8028 	strb.w	r8, [sp, #40]	@ 0x28
 800041a:	f002 f895 	bl	8002548 <sha3_512>
 800041e:	2300      	movs	r3, #0
 8000420:	461a      	mov	r2, r3
 8000422:	a90a      	add	r1, sp, #40	@ 0x28
 8000424:	a892      	add	r0, sp, #584	@ 0x248
 8000426:	f000 ff61 	bl	80012ec <poly_noise>
 800042a:	a90a      	add	r1, sp, #40	@ 0x28
 800042c:	f50d 6089 	add.w	r0, sp, #1096	@ 0x448
 8000430:	2300      	movs	r3, #0
 8000432:	2201      	movs	r2, #1
 8000434:	f000 ff5a 	bl	80012ec <poly_noise>
 8000438:	a90a      	add	r1, sp, #40	@ 0x28
 800043a:	2300      	movs	r3, #0
 800043c:	2202      	movs	r2, #2
 800043e:	f50d 60c9 	add.w	r0, sp, #1608	@ 0x648
 8000442:	f000 ff53 	bl	80012ec <poly_noise>
 8000446:	2600      	movs	r6, #0
 8000448:	a892      	add	r0, sp, #584	@ 0x248
 800044a:	f001 f92f 	bl	80016ac <polyvec_ntt>
 800044e:	4633      	mov	r3, r6
 8000450:	f60d 0248 	addw	r2, sp, #2120	@ 0x848
 8000454:	a992      	add	r1, sp, #584	@ 0x248
 8000456:	a812      	add	r0, sp, #72	@ 0x48
 8000458:	9400      	str	r4, [sp, #0]
 800045a:	9601      	str	r6, [sp, #4]
 800045c:	f000 fad8 	bl	8000a10 <matacc_cache32>
 8000460:	a812      	add	r0, sp, #72	@ 0x48
 8000462:	f000 ff5d 	bl	8001320 <poly_invntt>
 8000466:	4642      	mov	r2, r8
 8000468:	2301      	movs	r3, #1
 800046a:	a90a      	add	r1, sp, #40	@ 0x28
 800046c:	a812      	add	r0, sp, #72	@ 0x48
 800046e:	f000 ff3d 	bl	80012ec <poly_noise>
 8000472:	a812      	add	r0, sp, #72	@ 0x48
 8000474:	f000 ff52 	bl	800131c <poly_ntt>
 8000478:	a912      	add	r1, sp, #72	@ 0x48
 800047a:	4628      	mov	r0, r5
 800047c:	f000 fee0 	bl	8001240 <poly_tobytes>
 8000480:	f60d 0248 	addw	r2, sp, #2120	@ 0x848
 8000484:	a992      	add	r1, sp, #584	@ 0x248
 8000486:	2301      	movs	r3, #1
 8000488:	a812      	add	r0, sp, #72	@ 0x48
 800048a:	e9cd 4600 	strd	r4, r6, [sp]
 800048e:	f000 fb45 	bl	8000b1c <matacc_opt32>
 8000492:	a812      	add	r0, sp, #72	@ 0x48
 8000494:	f000 ff44 	bl	8001320 <poly_invntt>
 8000498:	2301      	movs	r3, #1
 800049a:	2204      	movs	r2, #4
 800049c:	a90a      	add	r1, sp, #40	@ 0x28
 800049e:	a812      	add	r0, sp, #72	@ 0x48
 80004a0:	f000 ff24 	bl	80012ec <poly_noise>
 80004a4:	a812      	add	r0, sp, #72	@ 0x48
 80004a6:	f000 ff39 	bl	800131c <poly_ntt>
 80004aa:	a912      	add	r1, sp, #72	@ 0x48
 80004ac:	f505 70c0 	add.w	r0, r5, #384	@ 0x180
 80004b0:	f000 fec6 	bl	8001240 <poly_tobytes>
 80004b4:	f60d 0248 	addw	r2, sp, #2120	@ 0x848
 80004b8:	a992      	add	r1, sp, #584	@ 0x248
 80004ba:	2302      	movs	r3, #2
 80004bc:	a812      	add	r0, sp, #72	@ 0x48
 80004be:	e9cd 4600 	strd	r4, r6, [sp]
 80004c2:	f000 fb2b 	bl	8000b1c <matacc_opt32>
 80004c6:	a812      	add	r0, sp, #72	@ 0x48
 80004c8:	f000 ff2a 	bl	8001320 <poly_invntt>
 80004cc:	2301      	movs	r3, #1
 80004ce:	2205      	movs	r2, #5
 80004d0:	a90a      	add	r1, sp, #40	@ 0x28
 80004d2:	a812      	add	r0, sp, #72	@ 0x48
 80004d4:	f000 ff0a 	bl	80012ec <poly_noise>
 80004d8:	a812      	add	r0, sp, #72	@ 0x48
 80004da:	f000 ff1f 	bl	800131c <poly_ntt>
 80004de:	a912      	add	r1, sp, #72	@ 0x48
 80004e0:	f505 7040 	add.w	r0, r5, #768	@ 0x300
 80004e4:	f000 feac 	bl	8001240 <poly_tobytes>
 80004e8:	a992      	add	r1, sp, #584	@ 0x248
 80004ea:	4638      	mov	r0, r7
 80004ec:	f001 f8b6 	bl	800165c <polyvec_tobytes>
 80004f0:	46a4      	mov	ip, r4
 80004f2:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 80004f6:	f8c5 0480 	str.w	r0, [r5, #1152]	@ 0x480
 80004fa:	f8c5 1484 	str.w	r1, [r5, #1156]	@ 0x484
 80004fe:	f8c5 2488 	str.w	r2, [r5, #1160]	@ 0x488
 8000502:	f8c5 348c 	str.w	r3, [r5, #1164]	@ 0x48c
 8000506:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 800050a:	f8c5 0490 	str.w	r0, [r5, #1168]	@ 0x490
 800050e:	f8c5 1494 	str.w	r1, [r5, #1172]	@ 0x494
 8000512:	f8c5 2498 	str.w	r2, [r5, #1176]	@ 0x498
 8000516:	f8c5 349c 	str.w	r3, [r5, #1180]	@ 0x49c
 800051a:	f60d 6d48 	addw	sp, sp, #3656	@ 0xe48
 800051e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000522:	bf00      	nop

08000524 <indcpa_enc>:
 8000524:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8000528:	f5ad 5d90 	sub.w	sp, sp, #4608	@ 0x1200
 800052c:	b083      	sub	sp, #12
 800052e:	461d      	mov	r5, r3
 8000530:	2300      	movs	r3, #0
 8000532:	4606      	mov	r6, r0
 8000534:	f502 6a90 	add.w	sl, r2, #1152	@ 0x480
 8000538:	f50d 60c1 	add.w	r0, sp, #1544	@ 0x608
 800053c:	4617      	mov	r7, r2
 800053e:	4689      	mov	r9, r1
 8000540:	461a      	mov	r2, r3
 8000542:	4629      	mov	r1, r5
 8000544:	f000 fed2 	bl	80012ec <poly_noise>
 8000548:	2300      	movs	r3, #0
 800054a:	2201      	movs	r2, #1
 800054c:	4629      	mov	r1, r5
 800054e:	f60d 0008 	addw	r0, sp, #2056	@ 0x808
 8000552:	f000 fecb 	bl	80012ec <poly_noise>
 8000556:	2300      	movs	r3, #0
 8000558:	2202      	movs	r2, #2
 800055a:	4629      	mov	r1, r5
 800055c:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
 8000560:	f000 fec4 	bl	80012ec <poly_noise>
 8000564:	2401      	movs	r4, #1
 8000566:	f50d 60c1 	add.w	r0, sp, #1544	@ 0x608
 800056a:	f001 f89f 	bl	80016ac <polyvec_ntt>
 800056e:	2300      	movs	r3, #0
 8000570:	f60d 4208 	addw	r2, sp, #3080	@ 0xc08
 8000574:	f50d 61c1 	add.w	r1, sp, #1544	@ 0x608
 8000578:	a802      	add	r0, sp, #8
 800057a:	f8cd a000 	str.w	sl, [sp]
 800057e:	9401      	str	r4, [sp, #4]
 8000580:	f000 fa46 	bl	8000a10 <matacc_cache32>
 8000584:	a802      	add	r0, sp, #8
 8000586:	f000 fecb 	bl	8001320 <poly_invntt>
 800058a:	4623      	mov	r3, r4
 800058c:	2203      	movs	r2, #3
 800058e:	4629      	mov	r1, r5
 8000590:	a802      	add	r0, sp, #8
 8000592:	f000 feab 	bl	80012ec <poly_noise>
 8000596:	a802      	add	r0, sp, #8
 8000598:	f000 fec6 	bl	8001328 <poly_reduce>
 800059c:	2200      	movs	r2, #0
 800059e:	a902      	add	r1, sp, #8
 80005a0:	4630      	mov	r0, r6
 80005a2:	f000 fc43 	bl	8000e2c <poly_packcompress>
 80005a6:	46a3      	mov	fp, r4
 80005a8:	fa5f f884 	uxtb.w	r8, r4
 80005ac:	4643      	mov	r3, r8
 80005ae:	f60d 4208 	addw	r2, sp, #3080	@ 0xc08
 80005b2:	f50d 61c1 	add.w	r1, sp, #1544	@ 0x608
 80005b6:	a802      	add	r0, sp, #8
 80005b8:	e9cd ab00 	strd	sl, fp, [sp]
 80005bc:	f000 faae 	bl	8000b1c <matacc_opt32>
 80005c0:	a802      	add	r0, sp, #8
 80005c2:	f000 fead 	bl	8001320 <poly_invntt>
 80005c6:	2301      	movs	r3, #1
 80005c8:	f108 0203 	add.w	r2, r8, #3
 80005cc:	4629      	mov	r1, r5
 80005ce:	a802      	add	r0, sp, #8
 80005d0:	f000 fe8c 	bl	80012ec <poly_noise>
 80005d4:	a802      	add	r0, sp, #8
 80005d6:	f000 fea7 	bl	8001328 <poly_reduce>
 80005da:	4622      	mov	r2, r4
 80005dc:	a902      	add	r1, sp, #8
 80005de:	4630      	mov	r0, r6
 80005e0:	f000 fc24 	bl	8000e2c <poly_packcompress>
 80005e4:	2c01      	cmp	r4, #1
 80005e6:	d101      	bne.n	80005ec <indcpa_enc+0xc8>
 80005e8:	2402      	movs	r4, #2
 80005ea:	e7dd      	b.n	80005a8 <indcpa_enc+0x84>
 80005ec:	ac82      	add	r4, sp, #520	@ 0x208
 80005ee:	4639      	mov	r1, r7
 80005f0:	a802      	add	r0, sp, #8
 80005f2:	f000 fe45 	bl	8001280 <poly_frombytes>
 80005f6:	f60d 4308 	addw	r3, sp, #3080	@ 0xc08
 80005fa:	aa02      	add	r2, sp, #8
 80005fc:	f50d 61c1 	add.w	r1, sp, #1544	@ 0x608
 8000600:	4620      	mov	r0, r4
 8000602:	f000 fe85 	bl	8001310 <poly_basemul_opt_16_32>
 8000606:	f507 71c0 	add.w	r1, r7, #384	@ 0x180
 800060a:	a802      	add	r0, sp, #8
 800060c:	f000 fe38 	bl	8001280 <poly_frombytes>
 8000610:	f60d 6308 	addw	r3, sp, #3592	@ 0xe08
 8000614:	aa02      	add	r2, sp, #8
 8000616:	f60d 0108 	addw	r1, sp, #2056	@ 0x808
 800061a:	4620      	mov	r0, r4
 800061c:	f000 fe7a 	bl	8001314 <poly_basemul_acc_opt_32_32>
 8000620:	f507 7140 	add.w	r1, r7, #768	@ 0x300
 8000624:	a802      	add	r0, sp, #8
 8000626:	f000 fe2b 	bl	8001280 <poly_frombytes>
 800062a:	f50d 5380 	add.w	r3, sp, #4096	@ 0x1000
 800062e:	f60d 2108 	addw	r1, sp, #2568	@ 0xa08
 8000632:	aa02      	add	r2, sp, #8
 8000634:	3308      	adds	r3, #8
 8000636:	f50d 60c1 	add.w	r0, sp, #1544	@ 0x608
 800063a:	9400      	str	r4, [sp, #0]
 800063c:	f000 fe6c 	bl	8001318 <poly_basemul_acc_opt_32_16>
 8000640:	f50d 60c1 	add.w	r0, sp, #1544	@ 0x608
 8000644:	f000 fe6c 	bl	8001320 <poly_invntt>
 8000648:	2301      	movs	r3, #1
 800064a:	4629      	mov	r1, r5
 800064c:	2206      	movs	r2, #6
 800064e:	f50d 60c1 	add.w	r0, sp, #1544	@ 0x608
 8000652:	f000 fe4b 	bl	80012ec <poly_noise>
 8000656:	4649      	mov	r1, r9
 8000658:	a802      	add	r0, sp, #8
 800065a:	f000 fe6b 	bl	8001334 <poly_frommsg>
 800065e:	f50d 61c1 	add.w	r1, sp, #1544	@ 0x608
 8000662:	aa02      	add	r2, sp, #8
 8000664:	4608      	mov	r0, r1
 8000666:	f000 fe61 	bl	800132c <poly_add>
 800066a:	f50d 60c1 	add.w	r0, sp, #1544	@ 0x608
 800066e:	f000 fe5b 	bl	8001328 <poly_reduce>
 8000672:	f50d 61c1 	add.w	r1, sp, #1544	@ 0x608
 8000676:	f506 7070 	add.w	r0, r6, #960	@ 0x3c0
 800067a:	f000 fad5 	bl	8000c28 <poly_compress>
 800067e:	f50d 5d90 	add.w	sp, sp, #4608	@ 0x1200
 8000682:	b003      	add	sp, #12
 8000684:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

08000688 <indcpa_enc_cmp>:
 8000688:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 800068c:	f5ad 5d90 	sub.w	sp, sp, #4608	@ 0x1200
 8000690:	b085      	sub	sp, #20
 8000692:	461f      	mov	r7, r3
 8000694:	2300      	movs	r3, #0
 8000696:	4680      	mov	r8, r0
 8000698:	468a      	mov	sl, r1
 800069a:	f502 6b90 	add.w	fp, r2, #1152	@ 0x480
 800069e:	4639      	mov	r1, r7
 80006a0:	f50d 60c2 	add.w	r0, sp, #1552	@ 0x610
 80006a4:	4691      	mov	r9, r2
 80006a6:	461a      	mov	r2, r3
 80006a8:	f000 fe20 	bl	80012ec <poly_noise>
 80006ac:	2300      	movs	r3, #0
 80006ae:	2201      	movs	r2, #1
 80006b0:	4639      	mov	r1, r7
 80006b2:	f50d 6001 	add.w	r0, sp, #2064	@ 0x810
 80006b6:	f000 fe19 	bl	80012ec <poly_noise>
 80006ba:	2300      	movs	r3, #0
 80006bc:	2202      	movs	r2, #2
 80006be:	4639      	mov	r1, r7
 80006c0:	f50d 6021 	add.w	r0, sp, #2576	@ 0xa10
 80006c4:	f000 fe12 	bl	80012ec <poly_noise>
 80006c8:	2501      	movs	r5, #1
 80006ca:	f50d 60c2 	add.w	r0, sp, #1552	@ 0x610
 80006ce:	f000 ffed 	bl	80016ac <polyvec_ntt>
 80006d2:	2300      	movs	r3, #0
 80006d4:	f50d 6241 	add.w	r2, sp, #3088	@ 0xc10
 80006d8:	f50d 61c2 	add.w	r1, sp, #1552	@ 0x610
 80006dc:	a804      	add	r0, sp, #16
 80006de:	f8cd b000 	str.w	fp, [sp]
 80006e2:	9501      	str	r5, [sp, #4]
 80006e4:	f000 f994 	bl	8000a10 <matacc_cache32>
 80006e8:	a804      	add	r0, sp, #16
 80006ea:	f000 fe19 	bl	8001320 <poly_invntt>
 80006ee:	462b      	mov	r3, r5
 80006f0:	2203      	movs	r2, #3
 80006f2:	4639      	mov	r1, r7
 80006f4:	a804      	add	r0, sp, #16
 80006f6:	f000 fdf9 	bl	80012ec <poly_noise>
 80006fa:	a804      	add	r0, sp, #16
 80006fc:	f000 fe14 	bl	8001328 <poly_reduce>
 8000700:	2200      	movs	r2, #0
 8000702:	a904      	add	r1, sp, #16
 8000704:	4640      	mov	r0, r8
 8000706:	f000 fd05 	bl	8001114 <cmp_poly_packcompress>
 800070a:	f8cd a00c 	str.w	sl, [sp, #12]
 800070e:	4604      	mov	r4, r0
 8000710:	17c6      	asrs	r6, r0, #31
 8000712:	fa5f fa85 	uxtb.w	sl, r5
 8000716:	2301      	movs	r3, #1
 8000718:	f50d 6241 	add.w	r2, sp, #3088	@ 0xc10
 800071c:	f50d 61c2 	add.w	r1, sp, #1552	@ 0x610
 8000720:	e9cd b300 	strd	fp, r3, [sp]
 8000724:	a804      	add	r0, sp, #16
 8000726:	4653      	mov	r3, sl
 8000728:	f000 f9f8 	bl	8000b1c <matacc_opt32>
 800072c:	a804      	add	r0, sp, #16
 800072e:	f000 fdf7 	bl	8001320 <poly_invntt>
 8000732:	2301      	movs	r3, #1
 8000734:	f10a 0203 	add.w	r2, sl, #3
 8000738:	4639      	mov	r1, r7
 800073a:	a804      	add	r0, sp, #16
 800073c:	f000 fdd6 	bl	80012ec <poly_noise>
 8000740:	a804      	add	r0, sp, #16
 8000742:	f000 fdf1 	bl	8001328 <poly_reduce>
 8000746:	462a      	mov	r2, r5
 8000748:	a904      	add	r1, sp, #16
 800074a:	4640      	mov	r0, r8
 800074c:	f000 fce2 	bl	8001114 <cmp_poly_packcompress>
 8000750:	2d01      	cmp	r5, #1
 8000752:	ea44 0400 	orr.w	r4, r4, r0
 8000756:	ea46 76e0 	orr.w	r6, r6, r0, asr #31
 800075a:	d101      	bne.n	8000760 <indcpa_enc_cmp+0xd8>
 800075c:	2502      	movs	r5, #2
 800075e:	e7d8      	b.n	8000712 <indcpa_enc_cmp+0x8a>
 8000760:	ad84      	add	r5, sp, #528	@ 0x210
 8000762:	4649      	mov	r1, r9
 8000764:	a804      	add	r0, sp, #16
 8000766:	f8dd a00c 	ldr.w	sl, [sp, #12]
 800076a:	f000 fd89 	bl	8001280 <poly_frombytes>
 800076e:	f50d 6341 	add.w	r3, sp, #3088	@ 0xc10
 8000772:	aa04      	add	r2, sp, #16
 8000774:	f50d 61c2 	add.w	r1, sp, #1552	@ 0x610
 8000778:	4628      	mov	r0, r5
 800077a:	f000 fdc9 	bl	8001310 <poly_basemul_opt_16_32>
 800077e:	f509 71c0 	add.w	r1, r9, #384	@ 0x180
 8000782:	a804      	add	r0, sp, #16
 8000784:	f000 fd7c 	bl	8001280 <poly_frombytes>
 8000788:	f50d 6361 	add.w	r3, sp, #3600	@ 0xe10
 800078c:	aa04      	add	r2, sp, #16
 800078e:	f50d 6101 	add.w	r1, sp, #2064	@ 0x810
 8000792:	4628      	mov	r0, r5
 8000794:	f000 fdbe 	bl	8001314 <poly_basemul_acc_opt_32_32>
 8000798:	f509 7140 	add.w	r1, r9, #768	@ 0x300
 800079c:	a804      	add	r0, sp, #16
 800079e:	f000 fd6f 	bl	8001280 <poly_frombytes>
 80007a2:	f50d 5380 	add.w	r3, sp, #4096	@ 0x1000
 80007a6:	f50d 6121 	add.w	r1, sp, #2576	@ 0xa10
 80007aa:	aa04      	add	r2, sp, #16
 80007ac:	3310      	adds	r3, #16
 80007ae:	f50d 60c2 	add.w	r0, sp, #1552	@ 0x610
 80007b2:	9500      	str	r5, [sp, #0]
 80007b4:	f000 fdb0 	bl	8001318 <poly_basemul_acc_opt_32_16>
 80007b8:	f50d 60c2 	add.w	r0, sp, #1552	@ 0x610
 80007bc:	f000 fdb0 	bl	8001320 <poly_invntt>
 80007c0:	2301      	movs	r3, #1
 80007c2:	4639      	mov	r1, r7
 80007c4:	2206      	movs	r2, #6
 80007c6:	f50d 60c2 	add.w	r0, sp, #1552	@ 0x610
 80007ca:	f000 fd8f 	bl	80012ec <poly_noise>
 80007ce:	4651      	mov	r1, sl
 80007d0:	a804      	add	r0, sp, #16
 80007d2:	f000 fdaf 	bl	8001334 <poly_frommsg>
 80007d6:	f50d 61c2 	add.w	r1, sp, #1552	@ 0x610
 80007da:	aa04      	add	r2, sp, #16
 80007dc:	4608      	mov	r0, r1
 80007de:	f000 fda5 	bl	800132c <poly_add>
 80007e2:	f50d 60c2 	add.w	r0, sp, #1552	@ 0x610
 80007e6:	f000 fd9f 	bl	8001328 <poly_reduce>
 80007ea:	f50d 61c2 	add.w	r1, sp, #1552	@ 0x610
 80007ee:	f508 7070 	add.w	r0, r8, #960	@ 0x3c0
 80007f2:	f000 fbdd 	bl	8000fb0 <cmp_poly_compress>
 80007f6:	4304      	orrs	r4, r0
 80007f8:	4264      	negs	r4, r4
 80007fa:	ea46 70e0 	orr.w	r0, r6, r0, asr #31
 80007fe:	eb60 0040 	sbc.w	r0, r0, r0, lsl #1
 8000802:	0fc0      	lsrs	r0, r0, #31
 8000804:	f50d 5d90 	add.w	sp, sp, #4608	@ 0x1200
 8000808:	b005      	add	sp, #20
 800080a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 800080e:	bf00      	nop

08000810 <indcpa_dec>:
 8000810:	b570      	push	{r4, r5, r6, lr}
 8000812:	f5ad 6d00 	sub.w	sp, sp, #2048	@ 0x800
 8000816:	4615      	mov	r5, r2
 8000818:	4606      	mov	r6, r0
 800081a:	2200      	movs	r2, #0
 800081c:	4668      	mov	r0, sp
 800081e:	460c      	mov	r4, r1
 8000820:	f000 fb7e 	bl	8000f20 <poly_unpackdecompress>
 8000824:	4668      	mov	r0, sp
 8000826:	f000 fd79 	bl	800131c <poly_ntt>
 800082a:	462a      	mov	r2, r5
 800082c:	4669      	mov	r1, sp
 800082e:	f50d 6080 	add.w	r0, sp, #1024	@ 0x400
 8000832:	f000 fd43 	bl	80012bc <poly_frombytes_mul_16_32>
 8000836:	4621      	mov	r1, r4
 8000838:	2201      	movs	r2, #1
 800083a:	a880      	add	r0, sp, #512	@ 0x200
 800083c:	f000 fb70 	bl	8000f20 <poly_unpackdecompress>
 8000840:	a880      	add	r0, sp, #512	@ 0x200
 8000842:	f000 fd6b 	bl	800131c <poly_ntt>
 8000846:	f505 72c0 	add.w	r2, r5, #384	@ 0x180
 800084a:	a980      	add	r1, sp, #512	@ 0x200
 800084c:	f50d 6080 	add.w	r0, sp, #1024	@ 0x400
 8000850:	f000 fd3a 	bl	80012c8 <poly_frombytes_mul_32_32>
 8000854:	4621      	mov	r1, r4
 8000856:	2202      	movs	r2, #2
 8000858:	a880      	add	r0, sp, #512	@ 0x200
 800085a:	f000 fb61 	bl	8000f20 <poly_unpackdecompress>
 800085e:	a880      	add	r0, sp, #512	@ 0x200
 8000860:	f000 fd5c 	bl	800131c <poly_ntt>
 8000864:	f50d 6380 	add.w	r3, sp, #1024	@ 0x400
 8000868:	f505 7240 	add.w	r2, r5, #768	@ 0x300
 800086c:	a980      	add	r1, sp, #512	@ 0x200
 800086e:	4668      	mov	r0, sp
 8000870:	f000 fd30 	bl	80012d4 <poly_frombytes_mul_32_16>
 8000874:	4668      	mov	r0, sp
 8000876:	f000 fd53 	bl	8001320 <poly_invntt>
 800087a:	f504 7170 	add.w	r1, r4, #960	@ 0x3c0
 800087e:	a880      	add	r0, sp, #512	@ 0x200
 8000880:	f000 fa7e 	bl	8000d80 <poly_decompress>
 8000884:	466a      	mov	r2, sp
 8000886:	a980      	add	r1, sp, #512	@ 0x200
 8000888:	4668      	mov	r0, sp
 800088a:	f000 fd51 	bl	8001330 <poly_sub>
 800088e:	4668      	mov	r0, sp
 8000890:	f000 fd4a 	bl	8001328 <poly_reduce>
 8000894:	4669      	mov	r1, sp
 8000896:	4630      	mov	r0, r6
 8000898:	f000 fd6e 	bl	8001378 <poly_tomsg>
 800089c:	f50d 6d00 	add.w	sp, sp, #2048	@ 0x800
 80008a0:	bd70      	pop	{r4, r5, r6, pc}
 80008a2:	bf00      	nop

080008a4 <crypto_kem_keypair>:
 80008a4:	b570      	push	{r4, r5, r6, lr}
 80008a6:	b090      	sub	sp, #64	@ 0x40
 80008a8:	460c      	mov	r4, r1
 80008aa:	4605      	mov	r5, r0
 80008ac:	2140      	movs	r1, #64	@ 0x40
 80008ae:	4668      	mov	r0, sp
 80008b0:	f002 fae8 	bl	8002e84 <PQCLEAN_randombytes>
 80008b4:	f44f 6694 	mov.w	r6, #1184	@ 0x4a0
 80008b8:	466a      	mov	r2, sp
 80008ba:	4621      	mov	r1, r4
 80008bc:	4628      	mov	r0, r5
 80008be:	f7ff fd8b 	bl	80003d8 <indcpa_keypair_derand>
 80008c2:	4632      	mov	r2, r6
 80008c4:	4629      	mov	r1, r5
 80008c6:	f504 6090 	add.w	r0, r4, #1152	@ 0x480
 80008ca:	f006 fbbb 	bl	8007044 <memcpy>
 80008ce:	4632      	mov	r2, r6
 80008d0:	4629      	mov	r1, r5
 80008d2:	f504 6012 	add.w	r0, r4, #2336	@ 0x920
 80008d6:	f001 fc39 	bl	800214c <sha3_256>
 80008da:	f10d 0c20 	add.w	ip, sp, #32
 80008de:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 80008e2:	f8c4 0940 	str.w	r0, [r4, #2368]	@ 0x940
 80008e6:	f8c4 1944 	str.w	r1, [r4, #2372]	@ 0x944
 80008ea:	f8c4 2948 	str.w	r2, [r4, #2376]	@ 0x948
 80008ee:	f8c4 394c 	str.w	r3, [r4, #2380]	@ 0x94c
 80008f2:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 80008f6:	f8c4 0950 	str.w	r0, [r4, #2384]	@ 0x950
 80008fa:	2000      	movs	r0, #0
 80008fc:	f8c4 1954 	str.w	r1, [r4, #2388]	@ 0x954
 8000900:	f8c4 2958 	str.w	r2, [r4, #2392]	@ 0x958
 8000904:	f8c4 395c 	str.w	r3, [r4, #2396]	@ 0x95c
 8000908:	b010      	add	sp, #64	@ 0x40
 800090a:	bd70      	pop	{r4, r5, r6, pc}

0800090c <crypto_kem_enc>:
 800090c:	b570      	push	{r4, r5, r6, lr}
 800090e:	b0a8      	sub	sp, #160	@ 0xa0
 8000910:	460c      	mov	r4, r1
 8000912:	4606      	mov	r6, r0
 8000914:	2120      	movs	r1, #32
 8000916:	4668      	mov	r0, sp
 8000918:	4615      	mov	r5, r2
 800091a:	f002 fab3 	bl	8002e84 <PQCLEAN_randombytes>
 800091e:	46ec      	mov	ip, sp
 8000920:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 8000924:	f10d 0e20 	add.w	lr, sp, #32
 8000928:	e8ae 000f 	stmia.w	lr!, {r0, r1, r2, r3}
 800092c:	e89c 000f 	ldmia.w	ip, {r0, r1, r2, r3}
 8000930:	e88e 000f 	stmia.w	lr, {r0, r1, r2, r3}
 8000934:	4629      	mov	r1, r5
 8000936:	a810      	add	r0, sp, #64	@ 0x40
 8000938:	f44f 6294 	mov.w	r2, #1184	@ 0x4a0
 800093c:	f001 fc06 	bl	800214c <sha3_256>
 8000940:	a908      	add	r1, sp, #32
 8000942:	a818      	add	r0, sp, #96	@ 0x60
 8000944:	2240      	movs	r2, #64	@ 0x40
 8000946:	f001 fdff 	bl	8002548 <sha3_512>
 800094a:	462a      	mov	r2, r5
 800094c:	a908      	add	r1, sp, #32
 800094e:	4630      	mov	r0, r6
 8000950:	ab20      	add	r3, sp, #128	@ 0x80
 8000952:	f7ff fde7 	bl	8000524 <indcpa_enc>
 8000956:	f10d 0c60 	add.w	ip, sp, #96	@ 0x60
 800095a:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 800095e:	6020      	str	r0, [r4, #0]
 8000960:	6061      	str	r1, [r4, #4]
 8000962:	60a2      	str	r2, [r4, #8]
 8000964:	60e3      	str	r3, [r4, #12]
 8000966:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 800096a:	6120      	str	r0, [r4, #16]
 800096c:	2000      	movs	r0, #0
 800096e:	6161      	str	r1, [r4, #20]
 8000970:	61a2      	str	r2, [r4, #24]
 8000972:	61e3      	str	r3, [r4, #28]
 8000974:	b028      	add	sp, #160	@ 0xa0
 8000976:	bd70      	pop	{r4, r5, r6, pc}

08000978 <crypto_kem_dec>:
 8000978:	b5f0      	push	{r4, r5, r6, r7, lr}
 800097a:	4614      	mov	r4, r2
 800097c:	b0a9      	sub	sp, #164	@ 0xa4
 800097e:	4605      	mov	r5, r0
 8000980:	a808      	add	r0, sp, #32
 8000982:	460e      	mov	r6, r1
 8000984:	f7ff ff44 	bl	8000810 <indcpa_dec>
 8000988:	f8d4 0920 	ldr.w	r0, [r4, #2336]	@ 0x920
 800098c:	f8d4 1924 	ldr.w	r1, [r4, #2340]	@ 0x924
 8000990:	f8d4 2928 	ldr.w	r2, [r4, #2344]	@ 0x928
 8000994:	f8d4 392c 	ldr.w	r3, [r4, #2348]	@ 0x92c
 8000998:	f10d 0c40 	add.w	ip, sp, #64	@ 0x40
 800099c:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
 80009a0:	f8d4 0930 	ldr.w	r0, [r4, #2352]	@ 0x930
 80009a4:	f8d4 1934 	ldr.w	r1, [r4, #2356]	@ 0x934
 80009a8:	f8d4 2938 	ldr.w	r2, [r4, #2360]	@ 0x938
 80009ac:	f8d4 393c 	ldr.w	r3, [r4, #2364]	@ 0x93c
 80009b0:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
 80009b4:	a908      	add	r1, sp, #32
 80009b6:	4660      	mov	r0, ip
 80009b8:	2240      	movs	r2, #64	@ 0x40
 80009ba:	f001 fdc5 	bl	8002548 <sha3_512>
 80009be:	ab20      	add	r3, sp, #128	@ 0x80
 80009c0:	a908      	add	r1, sp, #32
 80009c2:	f504 6290 	add.w	r2, r4, #1152	@ 0x480
 80009c6:	4630      	mov	r0, r6
 80009c8:	f7ff fe5e 	bl	8000688 <indcpa_enc_cmp>
 80009cc:	4632      	mov	r2, r6
 80009ce:	4607      	mov	r7, r0
 80009d0:	f504 6114 	add.w	r1, r4, #2368	@ 0x940
 80009d4:	4668      	mov	r0, sp
 80009d6:	f000 feed 	bl	80017b4 <kyber_shake256_rkprf>
 80009da:	f10d 0c60 	add.w	ip, sp, #96	@ 0x60
 80009de:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 80009e2:	6028      	str	r0, [r5, #0]
 80009e4:	6069      	str	r1, [r5, #4]
 80009e6:	60aa      	str	r2, [r5, #8]
 80009e8:	60eb      	str	r3, [r5, #12]
 80009ea:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 80009ee:	6128      	str	r0, [r5, #16]
 80009f0:	6169      	str	r1, [r5, #20]
 80009f2:	61aa      	str	r2, [r5, #24]
 80009f4:	61eb      	str	r3, [r5, #28]
 80009f6:	f002 f855 	bl	8002aa4 <hal_trigger_toggle>
 80009fa:	4628      	mov	r0, r5
 80009fc:	463b      	mov	r3, r7
 80009fe:	2220      	movs	r2, #32
 8000a00:	4669      	mov	r1, sp
 8000a02:	f000 ff13 	bl	800182c <cmov>
 8000a06:	f002 f84d 	bl	8002aa4 <hal_trigger_toggle>
 8000a0a:	2000      	movs	r0, #0
 8000a0c:	b029      	add	sp, #164	@ 0xa4
 8000a0e:	bdf0      	pop	{r4, r5, r6, r7, pc}

08000a10 <matacc_cache32>:
 8000a10:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8000a14:	ed2d 8b06 	vpush	{d8-d10}
 8000a18:	ed2d db04 	vpush	{d13-d14}
 8000a1c:	f2ad 5d94 	subw	sp, sp, #1428	@ 0x594
 8000a20:	4683      	mov	fp, r0
 8000a22:	f8dd 85e4 	ldr.w	r8, [sp, #1508]	@ 0x5e4
 8000a26:	460e      	mov	r6, r1
 8000a28:	4615      	mov	r5, r2
 8000a2a:	461f      	mov	r7, r3
 8000a2c:	ac32      	add	r4, sp, #200	@ 0xc8
 8000a2e:	f1b8 0f00 	cmp.w	r8, #0
 8000a32:	d059      	beq.n	8000ae8 <matacc_cache32+0xd8>
 8000a34:	f8dd 15e0 	ldr.w	r1, [sp, #1504]	@ 0x5e0
 8000a38:	2300      	movs	r3, #0
 8000a3a:	463a      	mov	r2, r7
 8000a3c:	4620      	mov	r0, r4
 8000a3e:	f000 fe6f 	bl	8001720 <kyber_shake128_absorb>
 8000a42:	4622      	mov	r2, r4
 8000a44:	2101      	movs	r1, #1
 8000a46:	a807      	add	r0, sp, #28
 8000a48:	f001 fa34 	bl	8001eb4 <shake128_squeezeblocks>
 8000a4c:	f8df 90c8 	ldr.w	r9, [pc, #200]	@ 8000b18 <matacc_cache32+0x108>
 8000a50:	f8cd 9000 	str.w	r9, [sp]
 8000a54:	f50d 7ac8 	add.w	sl, sp, #400	@ 0x190
 8000a58:	e9cd 4501 	strd	r4, r5, [sp, #4]
 8000a5c:	ab07      	add	r3, sp, #28
 8000a5e:	aa05      	add	r2, sp, #20
 8000a60:	4631      	mov	r1, r6
 8000a62:	4650      	mov	r0, sl
 8000a64:	f003 faa0 	bl	8003fa8 <matacc_asm_cache_16_32>
 8000a68:	f1b8 0f00 	cmp.w	r8, #0
 8000a6c:	d043      	beq.n	8000af6 <matacc_cache32+0xe6>
 8000a6e:	f8dd 15e0 	ldr.w	r1, [sp, #1504]	@ 0x5e0
 8000a72:	2301      	movs	r3, #1
 8000a74:	463a      	mov	r2, r7
 8000a76:	4620      	mov	r0, r4
 8000a78:	f000 fe52 	bl	8001720 <kyber_shake128_absorb>
 8000a7c:	4622      	mov	r2, r4
 8000a7e:	2101      	movs	r1, #1
 8000a80:	a807      	add	r0, sp, #28
 8000a82:	f001 fa17 	bl	8001eb4 <shake128_squeezeblocks>
 8000a86:	f505 7300 	add.w	r3, r5, #512	@ 0x200
 8000a8a:	9302      	str	r3, [sp, #8]
 8000a8c:	e9cd 9400 	strd	r9, r4, [sp]
 8000a90:	ab07      	add	r3, sp, #28
 8000a92:	aa05      	add	r2, sp, #20
 8000a94:	f506 7100 	add.w	r1, r6, #512	@ 0x200
 8000a98:	4650      	mov	r0, sl
 8000a9a:	f003 fb83 	bl	80041a4 <matacc_asm_cache_32_32>
 8000a9e:	f1b8 0f00 	cmp.w	r8, #0
 8000aa2:	d030      	beq.n	8000b06 <matacc_cache32+0xf6>
 8000aa4:	f8dd 15e0 	ldr.w	r1, [sp, #1504]	@ 0x5e0
 8000aa8:	463a      	mov	r2, r7
 8000aaa:	2302      	movs	r3, #2
 8000aac:	4620      	mov	r0, r4
 8000aae:	f000 fe37 	bl	8001720 <kyber_shake128_absorb>
 8000ab2:	4622      	mov	r2, r4
 8000ab4:	2101      	movs	r1, #1
 8000ab6:	a807      	add	r0, sp, #28
 8000ab8:	f001 f9fc 	bl	8001eb4 <shake128_squeezeblocks>
 8000abc:	f505 6580 	add.w	r5, r5, #1024	@ 0x400
 8000ac0:	e9cd 9400 	strd	r9, r4, [sp]
 8000ac4:	f8cd a00c 	str.w	sl, [sp, #12]
 8000ac8:	9502      	str	r5, [sp, #8]
 8000aca:	ab07      	add	r3, sp, #28
 8000acc:	aa05      	add	r2, sp, #20
 8000ace:	f506 6180 	add.w	r1, r6, #1024	@ 0x400
 8000ad2:	4658      	mov	r0, fp
 8000ad4:	f003 fc70 	bl	80043b8 <matacc_asm_cache_32_16>
 8000ad8:	f20d 5d94 	addw	sp, sp, #1428	@ 0x594
 8000adc:	ecbd db04 	vpop	{d13-d14}
 8000ae0:	ecbd 8b06 	vpop	{d8-d10}
 8000ae4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8000ae8:	f8dd 15e0 	ldr.w	r1, [sp, #1504]	@ 0x5e0
 8000aec:	4642      	mov	r2, r8
 8000aee:	4620      	mov	r0, r4
 8000af0:	f000 fe16 	bl	8001720 <kyber_shake128_absorb>
 8000af4:	e7a5      	b.n	8000a42 <matacc_cache32+0x32>
 8000af6:	f8dd 15e0 	ldr.w	r1, [sp, #1504]	@ 0x5e0
 8000afa:	463b      	mov	r3, r7
 8000afc:	2201      	movs	r2, #1
 8000afe:	4620      	mov	r0, r4
 8000b00:	f000 fe0e 	bl	8001720 <kyber_shake128_absorb>
 8000b04:	e7ba      	b.n	8000a7c <matacc_cache32+0x6c>
 8000b06:	f8dd 15e0 	ldr.w	r1, [sp, #1504]	@ 0x5e0
 8000b0a:	463b      	mov	r3, r7
 8000b0c:	2202      	movs	r2, #2
 8000b0e:	4620      	mov	r0, r4
 8000b10:	f000 fe06 	bl	8001720 <kyber_shake128_absorb>
 8000b14:	e7cd      	b.n	8000ab2 <matacc_cache32+0xa2>
 8000b16:	bf00      	nop
 8000b18:	08007c94 	.word	0x08007c94

08000b1c <matacc_opt32>:
 8000b1c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8000b20:	ed2d 8b06 	vpush	{d8-d10}
 8000b24:	ed2d db04 	vpush	{d13-d14}
 8000b28:	f2ad 5d94 	subw	sp, sp, #1428	@ 0x594
 8000b2c:	4681      	mov	r9, r0
 8000b2e:	f8dd 85e4 	ldr.w	r8, [sp, #1508]	@ 0x5e4
 8000b32:	f8dd b5e0 	ldr.w	fp, [sp, #1504]	@ 0x5e0
 8000b36:	460e      	mov	r6, r1
 8000b38:	4615      	mov	r5, r2
 8000b3a:	461f      	mov	r7, r3
 8000b3c:	ac32      	add	r4, sp, #200	@ 0xc8
 8000b3e:	f1b8 0f00 	cmp.w	r8, #0
 8000b42:	d050      	beq.n	8000be6 <matacc_opt32+0xca>
 8000b44:	2300      	movs	r3, #0
 8000b46:	463a      	mov	r2, r7
 8000b48:	4659      	mov	r1, fp
 8000b4a:	4620      	mov	r0, r4
 8000b4c:	f000 fde8 	bl	8001720 <kyber_shake128_absorb>
 8000b50:	4622      	mov	r2, r4
 8000b52:	2101      	movs	r1, #1
 8000b54:	a807      	add	r0, sp, #28
 8000b56:	f001 f9ad 	bl	8001eb4 <shake128_squeezeblocks>
 8000b5a:	f50d 7ac8 	add.w	sl, sp, #400	@ 0x190
 8000b5e:	e9cd 4500 	strd	r4, r5, [sp]
 8000b62:	ab07      	add	r3, sp, #28
 8000b64:	aa05      	add	r2, sp, #20
 8000b66:	4631      	mov	r1, r6
 8000b68:	4650      	mov	r0, sl
 8000b6a:	f003 fd63 	bl	8004634 <matacc_asm_opt_16_32>
 8000b6e:	f1b8 0f00 	cmp.w	r8, #0
 8000b72:	d03e      	beq.n	8000bf2 <matacc_opt32+0xd6>
 8000b74:	2301      	movs	r3, #1
 8000b76:	463a      	mov	r2, r7
 8000b78:	4659      	mov	r1, fp
 8000b7a:	4620      	mov	r0, r4
 8000b7c:	f000 fdd0 	bl	8001720 <kyber_shake128_absorb>
 8000b80:	4622      	mov	r2, r4
 8000b82:	2101      	movs	r1, #1
 8000b84:	a807      	add	r0, sp, #28
 8000b86:	f001 f995 	bl	8001eb4 <shake128_squeezeblocks>
 8000b8a:	f505 7300 	add.w	r3, r5, #512	@ 0x200
 8000b8e:	9301      	str	r3, [sp, #4]
 8000b90:	9400      	str	r4, [sp, #0]
 8000b92:	ab07      	add	r3, sp, #28
 8000b94:	aa05      	add	r2, sp, #20
 8000b96:	f506 7100 	add.w	r1, r6, #512	@ 0x200
 8000b9a:	4650      	mov	r0, sl
 8000b9c:	f003 fe1e 	bl	80047dc <matacc_asm_opt_32_32>
 8000ba0:	f1b8 0f00 	cmp.w	r8, #0
 8000ba4:	d02c      	beq.n	8000c00 <matacc_opt32+0xe4>
 8000ba6:	463a      	mov	r2, r7
 8000ba8:	4659      	mov	r1, fp
 8000baa:	2302      	movs	r3, #2
 8000bac:	4620      	mov	r0, r4
 8000bae:	f000 fdb7 	bl	8001720 <kyber_shake128_absorb>
 8000bb2:	4622      	mov	r2, r4
 8000bb4:	2101      	movs	r1, #1
 8000bb6:	a807      	add	r0, sp, #28
 8000bb8:	f001 f97c 	bl	8001eb4 <shake128_squeezeblocks>
 8000bbc:	f505 6580 	add.w	r5, r5, #1024	@ 0x400
 8000bc0:	f8cd a008 	str.w	sl, [sp, #8]
 8000bc4:	9400      	str	r4, [sp, #0]
 8000bc6:	9501      	str	r5, [sp, #4]
 8000bc8:	ab07      	add	r3, sp, #28
 8000bca:	aa05      	add	r2, sp, #20
 8000bcc:	f506 6180 	add.w	r1, r6, #1024	@ 0x400
 8000bd0:	4648      	mov	r0, r9
 8000bd2:	f003 fee5 	bl	80049a0 <matacc_asm_opt_32_16>
 8000bd6:	f20d 5d94 	addw	sp, sp, #1428	@ 0x594
 8000bda:	ecbd db04 	vpop	{d13-d14}
 8000bde:	ecbd 8b06 	vpop	{d8-d10}
 8000be2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8000be6:	4642      	mov	r2, r8
 8000be8:	4659      	mov	r1, fp
 8000bea:	4620      	mov	r0, r4
 8000bec:	f000 fd98 	bl	8001720 <kyber_shake128_absorb>
 8000bf0:	e7ae      	b.n	8000b50 <matacc_opt32+0x34>
 8000bf2:	463b      	mov	r3, r7
 8000bf4:	2201      	movs	r2, #1
 8000bf6:	4659      	mov	r1, fp
 8000bf8:	4620      	mov	r0, r4
 8000bfa:	f000 fd91 	bl	8001720 <kyber_shake128_absorb>
 8000bfe:	e7bf      	b.n	8000b80 <matacc_opt32+0x64>
 8000c00:	463b      	mov	r3, r7
 8000c02:	4659      	mov	r1, fp
 8000c04:	2202      	movs	r2, #2
 8000c06:	4620      	mov	r0, r4
 8000c08:	f000 fd8a 	bl	8001720 <kyber_shake128_absorb>
 8000c0c:	e7d1      	b.n	8000bb2 <matacc_opt32+0x96>
 8000c0e:	bf00      	nop

08000c10 <ntt>:
 8000c10:	4901      	ldr	r1, [pc, #4]	@ (8000c18 <ntt+0x8>)
 8000c12:	f002 be7b 	b.w	800390c <ntt_fast>
 8000c16:	bf00      	nop
 8000c18:	08007694 	.word	0x08007694

08000c1c <invntt>:
 8000c1c:	4901      	ldr	r1, [pc, #4]	@ (8000c24 <invntt+0x8>)
 8000c1e:	f002 ba35 	b.w	800308c <invntt_fast>
 8000c22:	bf00      	nop
 8000c24:	08007894 	.word	0x08007894

08000c28 <poly_compress>:
 8000c28:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 8000c2c:	460c      	mov	r4, r1
 8000c2e:	1d06      	adds	r6, r0, #4
 8000c30:	f501 7700 	add.w	r7, r1, #512	@ 0x200
 8000c34:	f640 5501 	movw	r5, #3329	@ 0xd01
 8000c38:	f9b4 9000 	ldrsh.w	r9, [r4]
 8000c3c:	f9b4 8002 	ldrsh.w	r8, [r4, #2]
 8000c40:	f9b4 1004 	ldrsh.w	r1, [r4, #4]
 8000c44:	f9b4 e006 	ldrsh.w	lr, [r4, #6]
 8000c48:	f9b4 2008 	ldrsh.w	r2, [r4, #8]
 8000c4c:	f9b4 000a 	ldrsh.w	r0, [r4, #10]
 8000c50:	f9b4 c00c 	ldrsh.w	ip, [r4, #12]
 8000c54:	f9b4 a00e 	ldrsh.w	sl, [r4, #14]
 8000c58:	ea05 73e9 	and.w	r3, r5, r9, asr #31
 8000c5c:	444b      	add	r3, r9
 8000c5e:	ea05 79e8 	and.w	r9, r5, r8, asr #31
 8000c62:	44c1      	add	r9, r8
 8000c64:	ea05 78e1 	and.w	r8, r5, r1, asr #31
 8000c68:	4488      	add	r8, r1
 8000c6a:	ea05 71ee 	and.w	r1, r5, lr, asr #31
 8000c6e:	4471      	add	r1, lr
 8000c70:	ea05 7ee2 	and.w	lr, r5, r2, asr #31
 8000c74:	4496      	add	lr, r2
 8000c76:	b21b      	sxth	r3, r3
 8000c78:	ea05 72e0 	and.w	r2, r5, r0, asr #31
 8000c7c:	4402      	add	r2, r0
 8000c7e:	fa0f f989 	sxth.w	r9, r9
 8000c82:	ea05 70ec 	and.w	r0, r5, ip, asr #31
 8000c86:	011b      	lsls	r3, r3, #4
 8000c88:	4460      	add	r0, ip
 8000c8a:	f203 6381 	addw	r3, r3, #1665	@ 0x681
 8000c8e:	ea05 7cea 	and.w	ip, r5, sl, asr #31
 8000c92:	fa0f f888 	sxth.w	r8, r8
 8000c96:	ea4f 1909 	mov.w	r9, r9, lsl #4
 8000c9a:	44d4      	add	ip, sl
 8000c9c:	f209 6981 	addw	r9, r9, #1665	@ 0x681
 8000ca0:	ebc3 1a83 	rsb	sl, r3, r3, lsl #6
 8000ca4:	b209      	sxth	r1, r1
 8000ca6:	ea4f 1808 	mov.w	r8, r8, lsl #4
 8000caa:	f208 6881 	addw	r8, r8, #1665	@ 0x681
 8000cae:	ebc3 230a 	rsb	r3, r3, sl, lsl #8
 8000cb2:	fa0f fe8e 	sxth.w	lr, lr
 8000cb6:	ebc9 1a89 	rsb	sl, r9, r9, lsl #6
 8000cba:	0109      	lsls	r1, r1, #4
 8000cbc:	f201 6181 	addw	r1, r1, #1665	@ 0x681
 8000cc0:	ebc9 290a 	rsb	r9, r9, sl, lsl #8
 8000cc4:	b212      	sxth	r2, r2
 8000cc6:	ebc8 1a88 	rsb	sl, r8, r8, lsl #6
 8000cca:	ea4f 1e0e 	mov.w	lr, lr, lsl #4
 8000cce:	f20e 6e81 	addw	lr, lr, #1665	@ 0x681
 8000cd2:	ebc8 280a 	rsb	r8, r8, sl, lsl #8
 8000cd6:	b200      	sxth	r0, r0
 8000cd8:	ebc1 1a81 	rsb	sl, r1, r1, lsl #6
 8000cdc:	0112      	lsls	r2, r2, #4
 8000cde:	f202 6281 	addw	r2, r2, #1665	@ 0x681
 8000ce2:	ebc1 210a 	rsb	r1, r1, sl, lsl #8
 8000ce6:	fa0f fc8c 	sxth.w	ip, ip
 8000cea:	ebce 1a8e 	rsb	sl, lr, lr, lsl #6
 8000cee:	0100      	lsls	r0, r0, #4
 8000cf0:	f200 6081 	addw	r0, r0, #1665	@ 0x681
 8000cf4:	ebce 2e0a 	rsb	lr, lr, sl, lsl #8
 8000cf8:	ea4f 1c0c 	mov.w	ip, ip, lsl #4
 8000cfc:	ebc2 1a82 	rsb	sl, r2, r2, lsl #6
 8000d00:	f20c 6c81 	addw	ip, ip, #1665	@ 0x681
 8000d04:	ebc2 2a0a 	rsb	sl, r2, sl, lsl #8
 8000d08:	ebc0 1280 	rsb	r2, r0, r0, lsl #6
 8000d0c:	ebc0 2202 	rsb	r2, r0, r2, lsl #8
 8000d10:	ebcc 108c 	rsb	r0, ip, ip, lsl #6
 8000d14:	ebcc 2000 	rsb	r0, ip, r0, lsl #8
 8000d18:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 8000d1c:	eb09 0989 	add.w	r9, r9, r9, lsl #2
 8000d20:	eb08 0888 	add.w	r8, r8, r8, lsl #2
 8000d24:	eb01 0181 	add.w	r1, r1, r1, lsl #2
 8000d28:	eb0e 0e8e 	add.w	lr, lr, lr, lsl #2
 8000d2c:	eb0a 0a8a 	add.w	sl, sl, sl, lsl #2
 8000d30:	eb02 0282 	add.w	r2, r2, r2, lsl #2
 8000d34:	eb00 0080 	add.w	r0, r0, r0, lsl #2
 8000d38:	0f1b      	lsrs	r3, r3, #28
 8000d3a:	3410      	adds	r4, #16
 8000d3c:	ea4f 7919 	mov.w	r9, r9, lsr #28
 8000d40:	0f09      	lsrs	r1, r1, #28
 8000d42:	ea4f 7818 	mov.w	r8, r8, lsr #28
 8000d46:	ea4f 7a1a 	mov.w	sl, sl, lsr #28
 8000d4a:	ea4f 7e1e 	mov.w	lr, lr, lsr #28
 8000d4e:	0f00      	lsrs	r0, r0, #28
 8000d50:	0f12      	lsrs	r2, r2, #28
 8000d52:	ea43 1309 	orr.w	r3, r3, r9, lsl #4
 8000d56:	ea48 1801 	orr.w	r8, r8, r1, lsl #4
 8000d5a:	ea4e 1e0a 	orr.w	lr, lr, sl, lsl #4
 8000d5e:	ea42 1200 	orr.w	r2, r2, r0, lsl #4
 8000d62:	42a7      	cmp	r7, r4
 8000d64:	f806 3c04 	strb.w	r3, [r6, #-4]
 8000d68:	f806 8c03 	strb.w	r8, [r6, #-3]
 8000d6c:	f806 ec02 	strb.w	lr, [r6, #-2]
 8000d70:	f806 2c01 	strb.w	r2, [r6, #-1]
 8000d74:	f106 0604 	add.w	r6, r6, #4
 8000d78:	f47f af5e 	bne.w	8000c38 <poly_compress+0x10>
 8000d7c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

08000d80 <poly_decompress>:
 8000d80:	1d0b      	adds	r3, r1, #4
 8000d82:	f101 0c84 	add.w	ip, r1, #132	@ 0x84
 8000d86:	f640 5101 	movw	r1, #3329	@ 0xd01
 8000d8a:	f813 2c04 	ldrb.w	r2, [r3, #-4]
 8000d8e:	f002 020f 	and.w	r2, r2, #15
 8000d92:	fb01 f202 	mul.w	r2, r1, r2
 8000d96:	3208      	adds	r2, #8
 8000d98:	3304      	adds	r3, #4
 8000d9a:	1112      	asrs	r2, r2, #4
 8000d9c:	8002      	strh	r2, [r0, #0]
 8000d9e:	f813 2c08 	ldrb.w	r2, [r3, #-8]
 8000da2:	0912      	lsrs	r2, r2, #4
 8000da4:	fb01 f202 	mul.w	r2, r1, r2
 8000da8:	3010      	adds	r0, #16
 8000daa:	3208      	adds	r2, #8
 8000dac:	1112      	asrs	r2, r2, #4
 8000dae:	f820 2c0e 	strh.w	r2, [r0, #-14]
 8000db2:	f813 2c07 	ldrb.w	r2, [r3, #-7]
 8000db6:	f002 020f 	and.w	r2, r2, #15
 8000dba:	fb01 f202 	mul.w	r2, r1, r2
 8000dbe:	3208      	adds	r2, #8
 8000dc0:	1112      	asrs	r2, r2, #4
 8000dc2:	f820 2c0c 	strh.w	r2, [r0, #-12]
 8000dc6:	f813 2c07 	ldrb.w	r2, [r3, #-7]
 8000dca:	0912      	lsrs	r2, r2, #4
 8000dcc:	fb01 f202 	mul.w	r2, r1, r2
 8000dd0:	3208      	adds	r2, #8
 8000dd2:	1112      	asrs	r2, r2, #4
 8000dd4:	f820 2c0a 	strh.w	r2, [r0, #-10]
 8000dd8:	f813 2c06 	ldrb.w	r2, [r3, #-6]
 8000ddc:	f002 020f 	and.w	r2, r2, #15
 8000de0:	fb01 f202 	mul.w	r2, r1, r2
 8000de4:	3208      	adds	r2, #8
 8000de6:	1112      	asrs	r2, r2, #4
 8000de8:	f820 2c08 	strh.w	r2, [r0, #-8]
 8000dec:	f813 2c06 	ldrb.w	r2, [r3, #-6]
 8000df0:	0912      	lsrs	r2, r2, #4
 8000df2:	fb01 f202 	mul.w	r2, r1, r2
 8000df6:	3208      	adds	r2, #8
 8000df8:	1112      	asrs	r2, r2, #4
 8000dfa:	f820 2c06 	strh.w	r2, [r0, #-6]
 8000dfe:	f813 2c05 	ldrb.w	r2, [r3, #-5]
 8000e02:	f002 020f 	and.w	r2, r2, #15
 8000e06:	fb01 f202 	mul.w	r2, r1, r2
 8000e0a:	3208      	adds	r2, #8
 8000e0c:	1112      	asrs	r2, r2, #4
 8000e0e:	f820 2c04 	strh.w	r2, [r0, #-4]
 8000e12:	f813 2c05 	ldrb.w	r2, [r3, #-5]
 8000e16:	0912      	lsrs	r2, r2, #4
 8000e18:	fb01 f202 	mul.w	r2, r1, r2
 8000e1c:	3208      	adds	r2, #8
 8000e1e:	1112      	asrs	r2, r2, #4
 8000e20:	4563      	cmp	r3, ip
 8000e22:	f820 2c02 	strh.w	r2, [r0, #-2]
 8000e26:	d1b0      	bne.n	8000d8a <poly_decompress+0xa>
 8000e28:	4770      	bx	lr
 8000e2a:	bf00      	nop

08000e2c <poly_packcompress>:
 8000e2c:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 8000e30:	eb02 0282 	add.w	r2, r2, r2, lsl #2
 8000e34:	f500 76a0 	add.w	r6, r0, #320	@ 0x140
 8000e38:	468e      	mov	lr, r1
 8000e3a:	4938      	ldr	r1, [pc, #224]	@ (8000f1c <poly_packcompress+0xf0>)
 8000e3c:	eb00 1482 	add.w	r4, r0, r2, lsl #6
 8000e40:	eb06 1682 	add.w	r6, r6, r2, lsl #6
 8000e44:	f640 5501 	movw	r5, #3329	@ 0xd01
 8000e48:	f240 6c81 	movw	ip, #1665	@ 0x681
 8000e4c:	f9be 0000 	ldrsh.w	r0, [lr]
 8000e50:	f9be 7002 	ldrsh.w	r7, [lr, #2]
 8000e54:	f9be 3004 	ldrsh.w	r3, [lr, #4]
 8000e58:	f9be 9006 	ldrsh.w	r9, [lr, #6]
 8000e5c:	ea05 72e0 	and.w	r2, r5, r0, asr #31
 8000e60:	4402      	add	r2, r0
 8000e62:	ea05 70e7 	and.w	r0, r5, r7, asr #31
 8000e66:	4438      	add	r0, r7
 8000e68:	b292      	uxth	r2, r2
 8000e6a:	ea05 77e3 	and.w	r7, r5, r3, asr #31
 8000e6e:	441f      	add	r7, r3
 8000e70:	0292      	lsls	r2, r2, #10
 8000e72:	ea05 73e9 	and.w	r3, r5, r9, asr #31
 8000e76:	b280      	uxth	r0, r0
 8000e78:	eb12 020c 	adds.w	r2, r2, ip
 8000e7c:	444b      	add	r3, r9
 8000e7e:	f04f 0800 	mov.w	r8, #0
 8000e82:	ea4f 2080 	mov.w	r0, r0, lsl #10
 8000e86:	b2bf      	uxth	r7, r7
 8000e88:	f04f 0a00 	mov.w	sl, #0
 8000e8c:	f148 0800 	adc.w	r8, r8, #0
 8000e90:	02bf      	lsls	r7, r7, #10
 8000e92:	eb10 000c 	adds.w	r0, r0, ip
 8000e96:	b29b      	uxth	r3, r3
 8000e98:	fba0 0901 	umull	r0, r9, r0, r1
 8000e9c:	ea4f 2383 	mov.w	r3, r3, lsl #10
 8000ea0:	fba2 2001 	umull	r2, r0, r2, r1
 8000ea4:	f14a 0200 	adc.w	r2, sl, #0
 8000ea8:	eb17 070c 	adds.w	r7, r7, ip
 8000eac:	fb01 0808 	mla	r8, r1, r8, r0
 8000eb0:	fb01 9202 	mla	r2, r1, r2, r9
 8000eb4:	fba7 7001 	umull	r7, r0, r7, r1
 8000eb8:	f14a 0900 	adc.w	r9, sl, #0
 8000ebc:	eb13 030c 	adds.w	r3, r3, ip
 8000ec0:	f3c2 0209 	ubfx	r2, r2, #0, #10
 8000ec4:	fb01 0009 	mla	r0, r1, r9, r0
 8000ec8:	f14a 0a00 	adc.w	sl, sl, #0
 8000ecc:	fba3 7301 	umull	r7, r3, r3, r1
 8000ed0:	f3c8 0809 	ubfx	r8, r8, #0, #10
 8000ed4:	f3c0 0009 	ubfx	r0, r0, #0, #10
 8000ed8:	ea4f 0982 	mov.w	r9, r2, lsl #2
 8000edc:	fb01 330a 	mla	r3, r1, sl, r3
 8000ee0:	2700      	movs	r7, #0
 8000ee2:	f3c3 0309 	ubfx	r3, r3, #0, #10
 8000ee6:	f368 0707 	bfi	r7, r8, #0, #8
 8000eea:	ea49 2918 	orr.w	r9, r9, r8, lsr #8
 8000eee:	ea4f 1800 	mov.w	r8, r0, lsl #4
 8000ef2:	ea48 1892 	orr.w	r8, r8, r2, lsr #6
 8000ef6:	f369 270f 	bfi	r7, r9, #8, #8
 8000efa:	019a      	lsls	r2, r3, #6
 8000efc:	f368 4717 	bfi	r7, r8, #16, #8
 8000f00:	ea42 1210 	orr.w	r2, r2, r0, lsr #4
 8000f04:	f362 671f 	bfi	r7, r2, #24, #8
 8000f08:	089b      	lsrs	r3, r3, #2
 8000f0a:	6027      	str	r7, [r4, #0]
 8000f0c:	7123      	strb	r3, [r4, #4]
 8000f0e:	3405      	adds	r4, #5
 8000f10:	42b4      	cmp	r4, r6
 8000f12:	f10e 0e08 	add.w	lr, lr, #8
 8000f16:	d199      	bne.n	8000e4c <poly_packcompress+0x20>
 8000f18:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 8000f1c:	0013afb7 	.word	0x0013afb7

08000f20 <poly_unpackdecompress>:
 8000f20:	b500      	push	{lr}
 8000f22:	eb02 0282 	add.w	r2, r2, r2, lsl #2
 8000f26:	f501 7ca0 	add.w	ip, r1, #320	@ 0x140
 8000f2a:	eb0c 1c82 	add.w	ip, ip, r2, lsl #6
 8000f2e:	eb01 1182 	add.w	r1, r1, r2, lsl #6
 8000f32:	f640 5201 	movw	r2, #3329	@ 0xd01
 8000f36:	784b      	ldrb	r3, [r1, #1]
 8000f38:	f891 e000 	ldrb.w	lr, [r1]
 8000f3c:	021b      	lsls	r3, r3, #8
 8000f3e:	f403 7340 	and.w	r3, r3, #768	@ 0x300
 8000f42:	ea43 030e 	orr.w	r3, r3, lr
 8000f46:	fb02 f303 	mul.w	r3, r2, r3
 8000f4a:	f503 7300 	add.w	r3, r3, #512	@ 0x200
 8000f4e:	0a9b      	lsrs	r3, r3, #10
 8000f50:	8003      	strh	r3, [r0, #0]
 8000f52:	788b      	ldrb	r3, [r1, #2]
 8000f54:	f891 e001 	ldrb.w	lr, [r1, #1]
 8000f58:	019b      	lsls	r3, r3, #6
 8000f5a:	f403 7370 	and.w	r3, r3, #960	@ 0x3c0
 8000f5e:	ea43 039e 	orr.w	r3, r3, lr, lsr #2
 8000f62:	fb02 f303 	mul.w	r3, r2, r3
 8000f66:	f503 7300 	add.w	r3, r3, #512	@ 0x200
 8000f6a:	0a9b      	lsrs	r3, r3, #10
 8000f6c:	8043      	strh	r3, [r0, #2]
 8000f6e:	78cb      	ldrb	r3, [r1, #3]
 8000f70:	f891 e002 	ldrb.w	lr, [r1, #2]
 8000f74:	011b      	lsls	r3, r3, #4
 8000f76:	f403 737c 	and.w	r3, r3, #1008	@ 0x3f0
 8000f7a:	ea43 131e 	orr.w	r3, r3, lr, lsr #4
 8000f7e:	fb02 f303 	mul.w	r3, r2, r3
 8000f82:	f503 7300 	add.w	r3, r3, #512	@ 0x200
 8000f86:	0a9b      	lsrs	r3, r3, #10
 8000f88:	8083      	strh	r3, [r0, #4]
 8000f8a:	790b      	ldrb	r3, [r1, #4]
 8000f8c:	f891 e003 	ldrb.w	lr, [r1, #3]
 8000f90:	009b      	lsls	r3, r3, #2
 8000f92:	ea43 139e 	orr.w	r3, r3, lr, lsr #6
 8000f96:	fb02 f303 	mul.w	r3, r2, r3
 8000f9a:	f503 7300 	add.w	r3, r3, #512	@ 0x200
 8000f9e:	3105      	adds	r1, #5
 8000fa0:	0a9b      	lsrs	r3, r3, #10
 8000fa2:	458c      	cmp	ip, r1
 8000fa4:	80c3      	strh	r3, [r0, #6]
 8000fa6:	f100 0008 	add.w	r0, r0, #8
 8000faa:	d1c4      	bne.n	8000f36 <poly_unpackdecompress+0x16>
 8000fac:	f85d fb04 	ldr.w	pc, [sp], #4

08000fb0 <cmp_poly_compress>:
 8000fb0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8000fb4:	460d      	mov	r5, r1
 8000fb6:	4607      	mov	r7, r0
 8000fb8:	f501 7900 	add.w	r9, r1, #512	@ 0x200
 8000fbc:	f04f 0800 	mov.w	r8, #0
 8000fc0:	f640 5601 	movw	r6, #3329	@ 0xd01
 8000fc4:	f9b5 2000 	ldrsh.w	r2, [r5]
 8000fc8:	f9b5 b004 	ldrsh.w	fp, [r5, #4]
 8000fcc:	f9b5 4006 	ldrsh.w	r4, [r5, #6]
 8000fd0:	f9b5 a008 	ldrsh.w	sl, [r5, #8]
 8000fd4:	f9b5 000a 	ldrsh.w	r0, [r5, #10]
 8000fd8:	f9b5 e00c 	ldrsh.w	lr, [r5, #12]
 8000fdc:	f9b5 100e 	ldrsh.w	r1, [r5, #14]
 8000fe0:	ea06 73e2 	and.w	r3, r6, r2, asr #31
 8000fe4:	4413      	add	r3, r2
 8000fe6:	b21b      	sxth	r3, r3
 8000fe8:	011b      	lsls	r3, r3, #4
 8000fea:	f203 6381 	addw	r3, r3, #1665	@ 0x681
 8000fee:	ebc3 1283 	rsb	r2, r3, r3, lsl #6
 8000ff2:	ebc3 2302 	rsb	r3, r3, r2, lsl #8
 8000ff6:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 8000ffa:	ea4f 7c13 	mov.w	ip, r3, lsr #28
 8000ffe:	ea06 73eb 	and.w	r3, r6, fp, asr #31
 8001002:	445b      	add	r3, fp
 8001004:	ea06 7be4 	and.w	fp, r6, r4, asr #31
 8001008:	445c      	add	r4, fp
 800100a:	ea06 7bea 	and.w	fp, r6, sl, asr #31
 800100e:	44da      	add	sl, fp
 8001010:	ea06 7be0 	and.w	fp, r6, r0, asr #31
 8001014:	f9b5 2002 	ldrsh.w	r2, [r5, #2]
 8001018:	4458      	add	r0, fp
 800101a:	b21b      	sxth	r3, r3
 800101c:	ea06 7bee 	and.w	fp, r6, lr, asr #31
 8001020:	44de      	add	lr, fp
 8001022:	011b      	lsls	r3, r3, #4
 8001024:	ea06 7be1 	and.w	fp, r6, r1, asr #31
 8001028:	b224      	sxth	r4, r4
 800102a:	f203 6381 	addw	r3, r3, #1665	@ 0x681
 800102e:	4459      	add	r1, fp
 8001030:	0124      	lsls	r4, r4, #4
 8001032:	ea06 7be2 	and.w	fp, r6, r2, asr #31
 8001036:	f204 6481 	addw	r4, r4, #1665	@ 0x681
 800103a:	445a      	add	r2, fp
 800103c:	ebc3 1b83 	rsb	fp, r3, r3, lsl #6
 8001040:	ebc3 230b 	rsb	r3, r3, fp, lsl #8
 8001044:	ebc4 1b84 	rsb	fp, r4, r4, lsl #6
 8001048:	ebc4 240b 	rsb	r4, r4, fp, lsl #8
 800104c:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 8001050:	eb04 0484 	add.w	r4, r4, r4, lsl #2
 8001054:	0f24      	lsrs	r4, r4, #28
 8001056:	fa0f fa8a 	sxth.w	sl, sl
 800105a:	0f1b      	lsrs	r3, r3, #28
 800105c:	ea43 1304 	orr.w	r3, r3, r4, lsl #4
 8001060:	ea4f 1a0a 	mov.w	sl, sl, lsl #4
 8001064:	787c      	ldrb	r4, [r7, #1]
 8001066:	f897 b003 	ldrb.w	fp, [r7, #3]
 800106a:	b200      	sxth	r0, r0
 800106c:	f20a 6a81 	addw	sl, sl, #1665	@ 0x681
 8001070:	0100      	lsls	r0, r0, #4
 8001072:	fa0f fe8e 	sxth.w	lr, lr
 8001076:	f200 6081 	addw	r0, r0, #1665	@ 0x681
 800107a:	4063      	eors	r3, r4
 800107c:	ea4f 1e0e 	mov.w	lr, lr, lsl #4
 8001080:	ebca 148a 	rsb	r4, sl, sl, lsl #6
 8001084:	b209      	sxth	r1, r1
 8001086:	f20e 6e81 	addw	lr, lr, #1665	@ 0x681
 800108a:	ebca 2404 	rsb	r4, sl, r4, lsl #8
 800108e:	0109      	lsls	r1, r1, #4
 8001090:	ebc0 1a80 	rsb	sl, r0, r0, lsl #6
 8001094:	f201 6181 	addw	r1, r1, #1665	@ 0x681
 8001098:	ebc0 200a 	rsb	r0, r0, sl, lsl #8
 800109c:	ebce 1a8e 	rsb	sl, lr, lr, lsl #6
 80010a0:	ebce 2e0a 	rsb	lr, lr, sl, lsl #8
 80010a4:	eb04 0484 	add.w	r4, r4, r4, lsl #2
 80010a8:	ebc1 1a81 	rsb	sl, r1, r1, lsl #6
 80010ac:	eb00 0080 	add.w	r0, r0, r0, lsl #2
 80010b0:	ebc1 2a0a 	rsb	sl, r1, sl, lsl #8
 80010b4:	0f00      	lsrs	r0, r0, #28
 80010b6:	0f24      	lsrs	r4, r4, #28
 80010b8:	ea44 1400 	orr.w	r4, r4, r0, lsl #4
 80010bc:	eb0e 0e8e 	add.w	lr, lr, lr, lsl #2
 80010c0:	78b8      	ldrb	r0, [r7, #2]
 80010c2:	eb0a 0a8a 	add.w	sl, sl, sl, lsl #2
 80010c6:	b212      	sxth	r2, r2
 80010c8:	ea4f 7a1a 	mov.w	sl, sl, lsr #28
 80010cc:	ea4f 711e 	mov.w	r1, lr, lsr #28
 80010d0:	4044      	eors	r4, r0
 80010d2:	0112      	lsls	r2, r2, #4
 80010d4:	ea41 110a 	orr.w	r1, r1, sl, lsl #4
 80010d8:	f202 6281 	addw	r2, r2, #1665	@ 0x681
 80010dc:	ea81 010b 	eor.w	r1, r1, fp
 80010e0:	4323      	orrs	r3, r4
 80010e2:	430b      	orrs	r3, r1
 80010e4:	ebc2 1182 	rsb	r1, r2, r2, lsl #6
 80010e8:	ebc2 2201 	rsb	r2, r2, r1, lsl #8
 80010ec:	eb02 0282 	add.w	r2, r2, r2, lsl #2
 80010f0:	f817 0b04 	ldrb.w	r0, [r7], #4
 80010f4:	0f12      	lsrs	r2, r2, #28
 80010f6:	ea4c 1c02 	orr.w	ip, ip, r2, lsl #4
 80010fa:	3510      	adds	r5, #16
 80010fc:	ea8c 0c00 	eor.w	ip, ip, r0
 8001100:	ea43 030c 	orr.w	r3, r3, ip
 8001104:	45a9      	cmp	r9, r5
 8001106:	ea48 0803 	orr.w	r8, r8, r3
 800110a:	f47f af5b 	bne.w	8000fc4 <cmp_poly_compress+0x14>
 800110e:	4640      	mov	r0, r8
 8001110:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

08001114 <cmp_poly_packcompress>:
 8001114:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 8001118:	4684      	mov	ip, r0
 800111a:	eb02 0282 	add.w	r2, r2, r2, lsl #2
 800111e:	f500 75a0 	add.w	r5, r0, #320	@ 0x140
 8001122:	4608      	mov	r0, r1
 8001124:	4945      	ldr	r1, [pc, #276]	@ (800123c <cmp_poly_packcompress+0x128>)
 8001126:	eb0c 1c82 	add.w	ip, ip, r2, lsl #6
 800112a:	eb05 1582 	add.w	r5, r5, r2, lsl #6
 800112e:	2600      	movs	r6, #0
 8001130:	f640 5401 	movw	r4, #3329	@ 0xd01
 8001134:	f240 6e81 	movw	lr, #1665	@ 0x681
 8001138:	f9b0 7000 	ldrsh.w	r7, [r0]
 800113c:	f9b0 2002 	ldrsh.w	r2, [r0, #2]
 8001140:	f9b0 9004 	ldrsh.w	r9, [r0, #4]
 8001144:	ea04 73e7 	and.w	r3, r4, r7, asr #31
 8001148:	443b      	add	r3, r7
 800114a:	ea04 78e2 	and.w	r8, r4, r2, asr #31
 800114e:	4490      	add	r8, r2
 8001150:	b29b      	uxth	r3, r3
 8001152:	ea04 72e9 	and.w	r2, r4, r9, asr #31
 8001156:	029b      	lsls	r3, r3, #10
 8001158:	fa1f f888 	uxth.w	r8, r8
 800115c:	444a      	add	r2, r9
 800115e:	f04f 0a00 	mov.w	sl, #0
 8001162:	eb13 090e 	adds.w	r9, r3, lr
 8001166:	ea4f 2388 	mov.w	r3, r8, lsl #10
 800116a:	b292      	uxth	r2, r2
 800116c:	f14a 0800 	adc.w	r8, sl, #0
 8001170:	eb13 030e 	adds.w	r3, r3, lr
 8001174:	fba3 3a01 	umull	r3, sl, r3, r1
 8001178:	ea4f 2282 	mov.w	r2, r2, lsl #10
 800117c:	fba9 3901 	umull	r3, r9, r9, r1
 8001180:	f04f 0300 	mov.w	r3, #0
 8001184:	f143 0300 	adc.w	r3, r3, #0
 8001188:	eb12 020e 	adds.w	r2, r2, lr
 800118c:	f9b0 7006 	ldrsh.w	r7, [r0, #6]
 8001190:	fb01 9908 	mla	r9, r1, r8, r9
 8001194:	fba2 2801 	umull	r2, r8, r2, r1
 8001198:	f04f 0200 	mov.w	r2, #0
 800119c:	f142 0200 	adc.w	r2, r2, #0
 80011a0:	fb01 8802 	mla	r8, r1, r2, r8
 80011a4:	ea04 72e7 	and.w	r2, r4, r7, asr #31
 80011a8:	443a      	add	r2, r7
 80011aa:	b292      	uxth	r2, r2
 80011ac:	0292      	lsls	r2, r2, #10
 80011ae:	eb12 020e 	adds.w	r2, r2, lr
 80011b2:	f04f 0700 	mov.w	r7, #0
 80011b6:	f147 0700 	adc.w	r7, r7, #0
 80011ba:	fb01 a303 	mla	r3, r1, r3, sl
 80011be:	fba2 a201 	umull	sl, r2, r2, r1
 80011c2:	fb01 2207 	mla	r2, r1, r7, r2
 80011c6:	f3c2 0709 	ubfx	r7, r2, #0, #10
 80011ca:	f89c a000 	ldrb.w	sl, [ip]
 80011ce:	f3c8 0809 	ubfx	r8, r8, #0, #10
 80011d2:	01bf      	lsls	r7, r7, #6
 80011d4:	f3c9 0909 	ubfx	r9, r9, #0, #10
 80011d8:	f3c3 0309 	ubfx	r3, r3, #0, #10
 80011dc:	ea47 1718 	orr.w	r7, r7, r8, lsr #4
 80011e0:	ea4f 1808 	mov.w	r8, r8, lsl #4
 80011e4:	ea8a 0a09 	eor.w	sl, sl, r9
 80011e8:	ea48 1893 	orr.w	r8, r8, r3, lsr #6
 80011ec:	009b      	lsls	r3, r3, #2
 80011ee:	ea46 060a 	orr.w	r6, r6, sl
 80011f2:	ea43 2319 	orr.w	r3, r3, r9, lsr #8
 80011f6:	f89c a002 	ldrb.w	sl, [ip, #2]
 80011fa:	f89c 9001 	ldrb.w	r9, [ip, #1]
 80011fe:	ea88 080a 	eor.w	r8, r8, sl
 8001202:	ea83 0309 	eor.w	r3, r3, r9
 8001206:	f89c 9004 	ldrb.w	r9, [ip, #4]
 800120a:	ea43 0308 	orr.w	r3, r3, r8
 800120e:	f3c2 0287 	ubfx	r2, r2, #2, #8
 8001212:	f89c 8003 	ldrb.w	r8, [ip, #3]
 8001216:	ea82 0209 	eor.w	r2, r2, r9
 800121a:	4313      	orrs	r3, r2
 800121c:	ea87 0708 	eor.w	r7, r7, r8
 8001220:	433b      	orrs	r3, r7
 8001222:	f10c 0c05 	add.w	ip, ip, #5
 8001226:	4333      	orrs	r3, r6
 8001228:	45ac      	cmp	ip, r5
 800122a:	f003 06ff 	and.w	r6, r3, #255	@ 0xff
 800122e:	f100 0008 	add.w	r0, r0, #8
 8001232:	d181      	bne.n	8001138 <cmp_poly_packcompress+0x24>
 8001234:	4630      	mov	r0, r6
 8001236:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800123a:	bf00      	nop
 800123c:	0013afb7 	.word	0x0013afb7

08001240 <poly_tobytes>:
 8001240:	b538      	push	{r3, r4, r5, lr}
 8001242:	460d      	mov	r5, r1
 8001244:	4604      	mov	r4, r0
 8001246:	4608      	mov	r0, r1
 8001248:	f003 fdd0 	bl	8004dec <asm_barrett_reduce>
 800124c:	4628      	mov	r0, r5
 800124e:	f003 fdcd 	bl	8004dec <asm_barrett_reduce>
 8001252:	2300      	movs	r3, #0
 8001254:	4620      	mov	r0, r4
 8001256:	1ca9      	adds	r1, r5, #2
 8001258:	f935 c023 	ldrsh.w	ip, [r5, r3, lsl #2]
 800125c:	f931 2023 	ldrsh.w	r2, [r1, r3, lsl #2]
 8001260:	f880 c000 	strb.w	ip, [r0]
 8001264:	f3cc 2407 	ubfx	r4, ip, #8, #8
 8001268:	3301      	adds	r3, #1
 800126a:	ea44 1402 	orr.w	r4, r4, r2, lsl #4
 800126e:	2b80      	cmp	r3, #128	@ 0x80
 8001270:	f3c2 120b 	ubfx	r2, r2, #4, #12
 8001274:	7044      	strb	r4, [r0, #1]
 8001276:	7082      	strb	r2, [r0, #2]
 8001278:	f100 0003 	add.w	r0, r0, #3
 800127c:	d1ec      	bne.n	8001258 <poly_tobytes+0x18>
 800127e:	bd38      	pop	{r3, r4, r5, pc}

08001280 <poly_frombytes>:
 8001280:	b500      	push	{lr}
 8001282:	2200      	movs	r2, #0
 8001284:	f100 0e02 	add.w	lr, r0, #2
 8001288:	784b      	ldrb	r3, [r1, #1]
 800128a:	f891 c000 	ldrb.w	ip, [r1]
 800128e:	021b      	lsls	r3, r3, #8
 8001290:	f403 6370 	and.w	r3, r3, #3840	@ 0xf00
 8001294:	ea4c 0303 	orr.w	r3, ip, r3
 8001298:	f820 3022 	strh.w	r3, [r0, r2, lsl #2]
 800129c:	788b      	ldrb	r3, [r1, #2]
 800129e:	f891 c001 	ldrb.w	ip, [r1, #1]
 80012a2:	011b      	lsls	r3, r3, #4
 80012a4:	ea43 131c 	orr.w	r3, r3, ip, lsr #4
 80012a8:	f82e 3022 	strh.w	r3, [lr, r2, lsl #2]
 80012ac:	3201      	adds	r2, #1
 80012ae:	2a80      	cmp	r2, #128	@ 0x80
 80012b0:	f101 0103 	add.w	r1, r1, #3
 80012b4:	d1e8      	bne.n	8001288 <poly_frombytes+0x8>
 80012b6:	f85d fb04 	ldr.w	pc, [sp], #4
 80012ba:	bf00      	nop

080012bc <poly_frombytes_mul_16_32>:
 80012bc:	4b01      	ldr	r3, [pc, #4]	@ (80012c4 <poly_frombytes_mul_16_32+0x8>)
 80012be:	f003 bc83 	b.w	8004bc8 <frombytes_mul_asm_16_32>
 80012c2:	bf00      	nop
 80012c4:	08007c94 	.word	0x08007c94

080012c8 <poly_frombytes_mul_32_32>:
 80012c8:	4b01      	ldr	r3, [pc, #4]	@ (80012d0 <poly_frombytes_mul_32_32+0x8>)
 80012ca:	f003 bccb 	b.w	8004c64 <frombytes_mul_asm_acc_32_32>
 80012ce:	bf00      	nop
 80012d0:	08007c94 	.word	0x08007c94

080012d4 <poly_frombytes_mul_32_16>:
 80012d4:	b500      	push	{lr}
 80012d6:	b083      	sub	sp, #12
 80012d8:	9300      	str	r3, [sp, #0]
 80012da:	4b03      	ldr	r3, [pc, #12]	@ (80012e8 <poly_frombytes_mul_32_16+0x14>)
 80012dc:	f003 fd14 	bl	8004d08 <frombytes_mul_asm_acc_32_16>
 80012e0:	b003      	add	sp, #12
 80012e2:	f85d fb04 	ldr.w	pc, [sp], #4
 80012e6:	bf00      	nop
 80012e8:	08007c94 	.word	0x08007c94

080012ec <poly_noise>:
 80012ec:	b530      	push	{r4, r5, lr}
 80012ee:	4614      	mov	r4, r2
 80012f0:	b0a1      	sub	sp, #132	@ 0x84
 80012f2:	461d      	mov	r5, r3
 80012f4:	460a      	mov	r2, r1
 80012f6:	4623      	mov	r3, r4
 80012f8:	2180      	movs	r1, #128	@ 0x80
 80012fa:	4604      	mov	r4, r0
 80012fc:	4668      	mov	r0, sp
 80012fe:	f000 fa35 	bl	800176c <kyber_shake256_prf>
 8001302:	462a      	mov	r2, r5
 8001304:	4669      	mov	r1, sp
 8001306:	4620      	mov	r0, r4
 8001308:	f7fe ffac 	bl	8000264 <cbd>
 800130c:	b021      	add	sp, #132	@ 0x84
 800130e:	bd30      	pop	{r4, r5, pc}

08001310 <poly_basemul_opt_16_32>:
 8001310:	f001 be20 	b.w	8002f54 <basemul_asm_opt_16_32>

08001314 <poly_basemul_acc_opt_32_32>:
 8001314:	f001 be44 	b.w	8002fa0 <basemul_asm_acc_opt_32_32>

08001318 <poly_basemul_acc_opt_32_16>:
 8001318:	f001 be70 	b.w	8002ffc <basemul_asm_acc_opt_32_16>

0800131c <poly_ntt>:
 800131c:	f7ff bc78 	b.w	8000c10 <ntt>

08001320 <poly_invntt>:
 8001320:	f7ff bc7c 	b.w	8000c1c <invntt>

08001324 <poly_fromplant>:
 8001324:	f003 bdf4 	b.w	8004f10 <asm_fromplant>

08001328 <poly_reduce>:
 8001328:	f003 bd60 	b.w	8004dec <asm_barrett_reduce>

0800132c <poly_add>:
 800132c:	f001 bdf0 	b.w	8002f10 <pointwise_add>

08001330 <poly_sub>:
 8001330:	f001 bdcc 	b.w	8002ecc <pointwise_sub>

08001334 <poly_frommsg>:
 8001334:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8001338:	f04f 0800 	mov.w	r8, #0
 800133c:	1e87      	subs	r7, r0, #2
 800133e:	460e      	mov	r6, r1
 8001340:	46c1      	mov	r9, r8
 8001342:	463d      	mov	r5, r7
 8001344:	2400      	movs	r4, #0
 8001346:	f825 9f02 	strh.w	r9, [r5, #2]!
 800134a:	7832      	ldrb	r2, [r6, #0]
 800134c:	4122      	asrs	r2, r4
 800134e:	f240 6181 	movw	r1, #1665	@ 0x681
 8001352:	4628      	mov	r0, r5
 8001354:	f002 0201 	and.w	r2, r2, #1
 8001358:	3401      	adds	r4, #1
 800135a:	f001 fdad 	bl	8002eb8 <cmov_int16>
 800135e:	2c08      	cmp	r4, #8
 8001360:	d1f1      	bne.n	8001346 <poly_frommsg+0x12>
 8001362:	f108 0808 	add.w	r8, r8, #8
 8001366:	f5b8 7f80 	cmp.w	r8, #256	@ 0x100
 800136a:	f107 0710 	add.w	r7, r7, #16
 800136e:	f106 0601 	add.w	r6, r6, #1
 8001372:	d1e6      	bne.n	8001342 <poly_frommsg+0xe>
 8001374:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}

08001378 <poly_tomsg>:
 8001378:	b510      	push	{r4, lr}
 800137a:	1e42      	subs	r2, r0, #1
 800137c:	f501 7c00 	add.w	ip, r1, #512	@ 0x200
 8001380:	2000      	movs	r0, #0
 8001382:	f802 0f01 	strb.w	r0, [r2, #1]!
 8001386:	f9b1 3000 	ldrsh.w	r3, [r1]
 800138a:	005b      	lsls	r3, r3, #1
 800138c:	f203 6381 	addw	r3, r3, #1665	@ 0x681
 8001390:	ebc3 1483 	rsb	r4, r3, r3, lsl #6
 8001394:	ebc3 2304 	rsb	r3, r3, r4, lsl #8
 8001398:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 800139c:	f3c3 7300 	ubfx	r3, r3, #28, #1
 80013a0:	7013      	strb	r3, [r2, #0]
 80013a2:	f9b1 e002 	ldrsh.w	lr, [r1, #2]
 80013a6:	ea4f 0e4e 	mov.w	lr, lr, lsl #1
 80013aa:	f20e 6e81 	addw	lr, lr, #1665	@ 0x681
 80013ae:	ebce 148e 	rsb	r4, lr, lr, lsl #6
 80013b2:	ebce 2e04 	rsb	lr, lr, r4, lsl #8
 80013b6:	eb0e 0e8e 	add.w	lr, lr, lr, lsl #2
 80013ba:	ea4f 6ede 	mov.w	lr, lr, lsr #27
 80013be:	f00e 0e02 	and.w	lr, lr, #2
 80013c2:	ea43 030e 	orr.w	r3, r3, lr
 80013c6:	7013      	strb	r3, [r2, #0]
 80013c8:	f9b1 e004 	ldrsh.w	lr, [r1, #4]
 80013cc:	ea4f 0e4e 	mov.w	lr, lr, lsl #1
 80013d0:	f20e 6e81 	addw	lr, lr, #1665	@ 0x681
 80013d4:	ebce 148e 	rsb	r4, lr, lr, lsl #6
 80013d8:	ebce 2e04 	rsb	lr, lr, r4, lsl #8
 80013dc:	eb0e 0e8e 	add.w	lr, lr, lr, lsl #2
 80013e0:	ea4f 6e9e 	mov.w	lr, lr, lsr #26
 80013e4:	f00e 0e04 	and.w	lr, lr, #4
 80013e8:	ea43 030e 	orr.w	r3, r3, lr
 80013ec:	7013      	strb	r3, [r2, #0]
 80013ee:	f9b1 e006 	ldrsh.w	lr, [r1, #6]
 80013f2:	ea4f 0e4e 	mov.w	lr, lr, lsl #1
 80013f6:	f20e 6e81 	addw	lr, lr, #1665	@ 0x681
 80013fa:	ebce 148e 	rsb	r4, lr, lr, lsl #6
 80013fe:	ebce 2e04 	rsb	lr, lr, r4, lsl #8
 8001402:	eb0e 0e8e 	add.w	lr, lr, lr, lsl #2
 8001406:	ea4f 6e5e 	mov.w	lr, lr, lsr #25
 800140a:	f00e 0e08 	and.w	lr, lr, #8
 800140e:	ea43 030e 	orr.w	r3, r3, lr
 8001412:	7013      	strb	r3, [r2, #0]
 8001414:	f9b1 e008 	ldrsh.w	lr, [r1, #8]
 8001418:	ea4f 0e4e 	mov.w	lr, lr, lsl #1
 800141c:	f20e 6e81 	addw	lr, lr, #1665	@ 0x681
 8001420:	ebce 148e 	rsb	r4, lr, lr, lsl #6
 8001424:	ebce 2e04 	rsb	lr, lr, r4, lsl #8
 8001428:	eb0e 0e8e 	add.w	lr, lr, lr, lsl #2
 800142c:	ea4f 6e1e 	mov.w	lr, lr, lsr #24
 8001430:	f00e 0e10 	and.w	lr, lr, #16
 8001434:	ea43 030e 	orr.w	r3, r3, lr
 8001438:	7013      	strb	r3, [r2, #0]
 800143a:	f9b1 e00a 	ldrsh.w	lr, [r1, #10]
 800143e:	ea4f 0e4e 	mov.w	lr, lr, lsl #1
 8001442:	f20e 6e81 	addw	lr, lr, #1665	@ 0x681
 8001446:	ebce 148e 	rsb	r4, lr, lr, lsl #6
 800144a:	ebce 2e04 	rsb	lr, lr, r4, lsl #8
 800144e:	eb0e 0e8e 	add.w	lr, lr, lr, lsl #2
 8001452:	ea4f 5ede 	mov.w	lr, lr, lsr #23
 8001456:	f00e 0e20 	and.w	lr, lr, #32
 800145a:	3110      	adds	r1, #16
 800145c:	ea43 030e 	orr.w	r3, r3, lr
 8001460:	7013      	strb	r3, [r2, #0]
 8001462:	f931 ec04 	ldrsh.w	lr, [r1, #-4]
 8001466:	ea4f 0e4e 	mov.w	lr, lr, lsl #1
 800146a:	f20e 6e81 	addw	lr, lr, #1665	@ 0x681
 800146e:	ebce 148e 	rsb	r4, lr, lr, lsl #6
 8001472:	ebce 2e04 	rsb	lr, lr, r4, lsl #8
 8001476:	eb0e 0e8e 	add.w	lr, lr, lr, lsl #2
 800147a:	ea4f 5e9e 	mov.w	lr, lr, lsr #22
 800147e:	f00e 0e40 	and.w	lr, lr, #64	@ 0x40
 8001482:	ea43 030e 	orr.w	r3, r3, lr
 8001486:	7013      	strb	r3, [r2, #0]
 8001488:	f931 ec02 	ldrsh.w	lr, [r1, #-2]
 800148c:	ea4f 0e4e 	mov.w	lr, lr, lsl #1
 8001490:	f20e 6e81 	addw	lr, lr, #1665	@ 0x681
 8001494:	ebce 148e 	rsb	r4, lr, lr, lsl #6
 8001498:	ebce 2e04 	rsb	lr, lr, r4, lsl #8
 800149c:	eb0e 0e8e 	add.w	lr, lr, lr, lsl #2
 80014a0:	ea4f 7e1e 	mov.w	lr, lr, lsr #28
 80014a4:	ea43 13ce 	orr.w	r3, r3, lr, lsl #7
 80014a8:	458c      	cmp	ip, r1
 80014aa:	7013      	strb	r3, [r2, #0]
 80014ac:	f47f af69 	bne.w	8001382 <poly_tomsg+0xa>
 80014b0:	bd10      	pop	{r4, pc}
 80014b2:	bf00      	nop

080014b4 <poly_zeroize>:
 80014b4:	f44f 7200 	mov.w	r2, #512	@ 0x200
 80014b8:	2100      	movs	r1, #0
 80014ba:	f005 bd71 	b.w	8006fa0 <memset>
 80014be:	bf00      	nop

080014c0 <polyvec_compress>:
 80014c0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80014c4:	f500 76a0 	add.w	r6, r0, #320	@ 0x140
 80014c8:	f500 68a0 	add.w	r8, r0, #1280	@ 0x500
 80014cc:	483d      	ldr	r0, [pc, #244]	@ (80015c4 <polyvec_compress+0x104>)
 80014ce:	460f      	mov	r7, r1
 80014d0:	f640 5501 	movw	r5, #3329	@ 0xd01
 80014d4:	f240 6c81 	movw	ip, #1665	@ 0x681
 80014d8:	f5a6 74a0 	sub.w	r4, r6, #320	@ 0x140
 80014dc:	46be      	mov	lr, r7
 80014de:	f9be 1000 	ldrsh.w	r1, [lr]
 80014e2:	f9be 2002 	ldrsh.w	r2, [lr, #2]
 80014e6:	f9be 9004 	ldrsh.w	r9, [lr, #4]
 80014ea:	f9be b006 	ldrsh.w	fp, [lr, #6]
 80014ee:	ea05 73e1 	and.w	r3, r5, r1, asr #31
 80014f2:	440b      	add	r3, r1
 80014f4:	ea05 71e2 	and.w	r1, r5, r2, asr #31
 80014f8:	4411      	add	r1, r2
 80014fa:	b29b      	uxth	r3, r3
 80014fc:	ea05 72e9 	and.w	r2, r5, r9, asr #31
 8001500:	029b      	lsls	r3, r3, #10
 8001502:	b289      	uxth	r1, r1
 8001504:	444a      	add	r2, r9
 8001506:	f04f 0a00 	mov.w	sl, #0
 800150a:	eb13 090c 	adds.w	r9, r3, ip
 800150e:	ea4f 2181 	mov.w	r1, r1, lsl #10
 8001512:	ea05 73eb 	and.w	r3, r5, fp, asr #31
 8001516:	f14a 0a00 	adc.w	sl, sl, #0
 800151a:	445b      	add	r3, fp
 800151c:	eb11 010c 	adds.w	r1, r1, ip
 8001520:	b292      	uxth	r2, r2
 8001522:	fba1 1b00 	umull	r1, fp, r1, r0
 8001526:	ea4f 2282 	mov.w	r2, r2, lsl #10
 800152a:	fba9 9100 	umull	r9, r1, r9, r0
 800152e:	b29b      	uxth	r3, r3
 8001530:	f04f 0900 	mov.w	r9, #0
 8001534:	fb00 110a 	mla	r1, r0, sl, r1
 8001538:	f149 0900 	adc.w	r9, r9, #0
 800153c:	029b      	lsls	r3, r3, #10
 800153e:	eb12 020c 	adds.w	r2, r2, ip
 8001542:	f04f 0a00 	mov.w	sl, #0
 8001546:	f14a 0a00 	adc.w	sl, sl, #0
 800154a:	fb00 b909 	mla	r9, r0, r9, fp
 800154e:	eb13 030c 	adds.w	r3, r3, ip
 8001552:	fba2 2b00 	umull	r2, fp, r2, r0
 8001556:	f04f 0200 	mov.w	r2, #0
 800155a:	f142 0200 	adc.w	r2, r2, #0
 800155e:	f3c9 0909 	ubfx	r9, r9, #0, #10
 8001562:	fb00 bb0a 	mla	fp, r0, sl, fp
 8001566:	fba3 a300 	umull	sl, r3, r3, r0
 800156a:	f3c1 0109 	ubfx	r1, r1, #0, #10
 800156e:	fb00 3302 	mla	r3, r0, r2, r3
 8001572:	ea4f 0a89 	mov.w	sl, r9, lsl #2
 8001576:	2200      	movs	r2, #0
 8001578:	f3cb 0b09 	ubfx	fp, fp, #0, #10
 800157c:	f361 0207 	bfi	r2, r1, #0, #8
 8001580:	ea4a 2111 	orr.w	r1, sl, r1, lsr #8
 8001584:	f3c3 0309 	ubfx	r3, r3, #0, #10
 8001588:	f361 220f 	bfi	r2, r1, #8, #8
 800158c:	ea4f 110b 	mov.w	r1, fp, lsl #4
 8001590:	ea41 1999 	orr.w	r9, r1, r9, lsr #6
 8001594:	0199      	lsls	r1, r3, #6
 8001596:	f369 4217 	bfi	r2, r9, #16, #8
 800159a:	ea41 111b 	orr.w	r1, r1, fp, lsr #4
 800159e:	f361 621f 	bfi	r2, r1, #24, #8
 80015a2:	089b      	lsrs	r3, r3, #2
 80015a4:	6022      	str	r2, [r4, #0]
 80015a6:	7123      	strb	r3, [r4, #4]
 80015a8:	3405      	adds	r4, #5
 80015aa:	42b4      	cmp	r4, r6
 80015ac:	f10e 0e08 	add.w	lr, lr, #8
 80015b0:	d195      	bne.n	80014de <polyvec_compress+0x1e>
 80015b2:	f504 76a0 	add.w	r6, r4, #320	@ 0x140
 80015b6:	4546      	cmp	r6, r8
 80015b8:	f507 7700 	add.w	r7, r7, #512	@ 0x200
 80015bc:	d18c      	bne.n	80014d8 <polyvec_compress+0x18>
 80015be:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 80015c2:	bf00      	nop
 80015c4:	0013afb7 	.word	0x0013afb7

080015c8 <polyvec_decompress>:
 80015c8:	b570      	push	{r4, r5, r6, lr}
 80015ca:	f501 74a0 	add.w	r4, r1, #320	@ 0x140
 80015ce:	46a6      	mov	lr, r4
 80015d0:	f501 7570 	add.w	r5, r1, #960	@ 0x3c0
 80015d4:	f640 5c01 	movw	ip, #3329	@ 0xd01
 80015d8:	4602      	mov	r2, r0
 80015da:	784b      	ldrb	r3, [r1, #1]
 80015dc:	780e      	ldrb	r6, [r1, #0]
 80015de:	021b      	lsls	r3, r3, #8
 80015e0:	f403 7340 	and.w	r3, r3, #768	@ 0x300
 80015e4:	4333      	orrs	r3, r6
 80015e6:	fb0c f303 	mul.w	r3, ip, r3
 80015ea:	f503 7300 	add.w	r3, r3, #512	@ 0x200
 80015ee:	0a9b      	lsrs	r3, r3, #10
 80015f0:	8013      	strh	r3, [r2, #0]
 80015f2:	788b      	ldrb	r3, [r1, #2]
 80015f4:	784e      	ldrb	r6, [r1, #1]
 80015f6:	019b      	lsls	r3, r3, #6
 80015f8:	f403 7370 	and.w	r3, r3, #960	@ 0x3c0
 80015fc:	ea43 0396 	orr.w	r3, r3, r6, lsr #2
 8001600:	fb0c f303 	mul.w	r3, ip, r3
 8001604:	f503 7300 	add.w	r3, r3, #512	@ 0x200
 8001608:	0a9b      	lsrs	r3, r3, #10
 800160a:	8053      	strh	r3, [r2, #2]
 800160c:	78cb      	ldrb	r3, [r1, #3]
 800160e:	788e      	ldrb	r6, [r1, #2]
 8001610:	011b      	lsls	r3, r3, #4
 8001612:	f403 737c 	and.w	r3, r3, #1008	@ 0x3f0
 8001616:	ea43 1316 	orr.w	r3, r3, r6, lsr #4
 800161a:	fb0c f303 	mul.w	r3, ip, r3
 800161e:	f503 7300 	add.w	r3, r3, #512	@ 0x200
 8001622:	0a9b      	lsrs	r3, r3, #10
 8001624:	8093      	strh	r3, [r2, #4]
 8001626:	790b      	ldrb	r3, [r1, #4]
 8001628:	78ce      	ldrb	r6, [r1, #3]
 800162a:	009b      	lsls	r3, r3, #2
 800162c:	ea43 1396 	orr.w	r3, r3, r6, lsr #6
 8001630:	fb0c f303 	mul.w	r3, ip, r3
 8001634:	f503 7300 	add.w	r3, r3, #512	@ 0x200
 8001638:	3105      	adds	r1, #5
 800163a:	0a9b      	lsrs	r3, r3, #10
 800163c:	4571      	cmp	r1, lr
 800163e:	80d3      	strh	r3, [r2, #6]
 8001640:	f102 0208 	add.w	r2, r2, #8
 8001644:	d1c9      	bne.n	80015da <polyvec_decompress+0x12>
 8001646:	42ac      	cmp	r4, r5
 8001648:	4621      	mov	r1, r4
 800164a:	f50e 7ea0 	add.w	lr, lr, #320	@ 0x140
 800164e:	f500 7000 	add.w	r0, r0, #512	@ 0x200
 8001652:	d002      	beq.n	800165a <polyvec_decompress+0x92>
 8001654:	f504 74a0 	add.w	r4, r4, #320	@ 0x140
 8001658:	e7be      	b.n	80015d8 <polyvec_decompress+0x10>
 800165a:	bd70      	pop	{r4, r5, r6, pc}

0800165c <polyvec_tobytes>:
 800165c:	b538      	push	{r3, r4, r5, lr}
 800165e:	4604      	mov	r4, r0
 8001660:	460d      	mov	r5, r1
 8001662:	f7ff fded 	bl	8001240 <poly_tobytes>
 8001666:	f505 7100 	add.w	r1, r5, #512	@ 0x200
 800166a:	f504 70c0 	add.w	r0, r4, #384	@ 0x180
 800166e:	f7ff fde7 	bl	8001240 <poly_tobytes>
 8001672:	f505 6180 	add.w	r1, r5, #1024	@ 0x400
 8001676:	f504 7040 	add.w	r0, r4, #768	@ 0x300
 800167a:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 800167e:	f7ff bddf 	b.w	8001240 <poly_tobytes>
 8001682:	bf00      	nop

08001684 <polyvec_frombytes>:
 8001684:	b538      	push	{r3, r4, r5, lr}
 8001686:	4604      	mov	r4, r0
 8001688:	460d      	mov	r5, r1
 800168a:	f7ff fdf9 	bl	8001280 <poly_frombytes>
 800168e:	f505 71c0 	add.w	r1, r5, #384	@ 0x180
 8001692:	f504 7000 	add.w	r0, r4, #512	@ 0x200
 8001696:	f7ff fdf3 	bl	8001280 <poly_frombytes>
 800169a:	f505 7140 	add.w	r1, r5, #768	@ 0x300
 800169e:	f504 6080 	add.w	r0, r4, #1024	@ 0x400
 80016a2:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80016a6:	f7ff bdeb 	b.w	8001280 <poly_frombytes>
 80016aa:	bf00      	nop

080016ac <polyvec_ntt>:
 80016ac:	b510      	push	{r4, lr}
 80016ae:	4604      	mov	r4, r0
 80016b0:	f7ff fe34 	bl	800131c <poly_ntt>
 80016b4:	f504 7000 	add.w	r0, r4, #512	@ 0x200
 80016b8:	f7ff fe30 	bl	800131c <poly_ntt>
 80016bc:	f504 6080 	add.w	r0, r4, #1024	@ 0x400
 80016c0:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80016c4:	f7ff be2a 	b.w	800131c <poly_ntt>

080016c8 <polyvec_invntt>:
 80016c8:	b510      	push	{r4, lr}
 80016ca:	4604      	mov	r4, r0
 80016cc:	f7ff fe28 	bl	8001320 <poly_invntt>
 80016d0:	f504 7000 	add.w	r0, r4, #512	@ 0x200
 80016d4:	f7ff fe24 	bl	8001320 <poly_invntt>
 80016d8:	f504 6080 	add.w	r0, r4, #1024	@ 0x400
 80016dc:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80016e0:	f7ff be1e 	b.w	8001320 <poly_invntt>

080016e4 <polyvec_reduce>:
 80016e4:	b510      	push	{r4, lr}
 80016e6:	4604      	mov	r4, r0
 80016e8:	f7ff fe1e 	bl	8001328 <poly_reduce>
 80016ec:	f504 7000 	add.w	r0, r4, #512	@ 0x200
 80016f0:	f7ff fe1a 	bl	8001328 <poly_reduce>
 80016f4:	f504 6080 	add.w	r0, r4, #1024	@ 0x400
 80016f8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80016fc:	f7ff be14 	b.w	8001328 <poly_reduce>

08001700 <polyvec_add>:
 8001700:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001702:	4607      	mov	r7, r0
 8001704:	460e      	mov	r6, r1
 8001706:	4615      	mov	r5, r2
 8001708:	2400      	movs	r4, #0
 800170a:	192a      	adds	r2, r5, r4
 800170c:	1931      	adds	r1, r6, r4
 800170e:	1938      	adds	r0, r7, r4
 8001710:	f504 7400 	add.w	r4, r4, #512	@ 0x200
 8001714:	f7ff fe0a 	bl	800132c <poly_add>
 8001718:	f5b4 6fc0 	cmp.w	r4, #1536	@ 0x600
 800171c:	d1f5      	bne.n	800170a <polyvec_add+0xa>
 800171e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

08001720 <kyber_shake128_absorb>:
 8001720:	b570      	push	{r4, r5, r6, lr}
 8001722:	468e      	mov	lr, r1
 8001724:	b08a      	sub	sp, #40	@ 0x28
 8001726:	4606      	mov	r6, r0
 8001728:	4615      	mov	r5, r2
 800172a:	6808      	ldr	r0, [r1, #0]
 800172c:	f8de 2008 	ldr.w	r2, [lr, #8]
 8001730:	6849      	ldr	r1, [r1, #4]
 8001732:	461c      	mov	r4, r3
 8001734:	f8de 300c 	ldr.w	r3, [lr, #12]
 8001738:	f10d 0c04 	add.w	ip, sp, #4
 800173c:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
 8001740:	f8de 0010 	ldr.w	r0, [lr, #16]
 8001744:	f8de 1014 	ldr.w	r1, [lr, #20]
 8001748:	f8de 2018 	ldr.w	r2, [lr, #24]
 800174c:	f8de 301c 	ldr.w	r3, [lr, #28]
 8001750:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
 8001754:	2222      	movs	r2, #34	@ 0x22
 8001756:	a901      	add	r1, sp, #4
 8001758:	4630      	mov	r0, r6
 800175a:	f88d 5024 	strb.w	r5, [sp, #36]	@ 0x24
 800175e:	f88d 4025 	strb.w	r4, [sp, #37]	@ 0x25
 8001762:	f000 fb97 	bl	8001e94 <shake128_absorb>
 8001766:	b00a      	add	sp, #40	@ 0x28
 8001768:	bd70      	pop	{r4, r5, r6, pc}
 800176a:	bf00      	nop

0800176c <kyber_shake256_prf>:
 800176c:	b570      	push	{r4, r5, r6, lr}
 800176e:	4696      	mov	lr, r2
 8001770:	b08a      	sub	sp, #40	@ 0x28
 8001772:	4605      	mov	r5, r0
 8001774:	460e      	mov	r6, r1
 8001776:	6810      	ldr	r0, [r2, #0]
 8001778:	6851      	ldr	r1, [r2, #4]
 800177a:	6892      	ldr	r2, [r2, #8]
 800177c:	461c      	mov	r4, r3
 800177e:	f8de 300c 	ldr.w	r3, [lr, #12]
 8001782:	f10d 0c04 	add.w	ip, sp, #4
 8001786:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
 800178a:	f8de 0010 	ldr.w	r0, [lr, #16]
 800178e:	f8de 1014 	ldr.w	r1, [lr, #20]
 8001792:	f8de 2018 	ldr.w	r2, [lr, #24]
 8001796:	f8de 301c 	ldr.w	r3, [lr, #28]
 800179a:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
 800179e:	2321      	movs	r3, #33	@ 0x21
 80017a0:	aa01      	add	r2, sp, #4
 80017a2:	4631      	mov	r1, r6
 80017a4:	4628      	mov	r0, r5
 80017a6:	f88d 4024 	strb.w	r4, [sp, #36]	@ 0x24
 80017aa:	f000 fc45 	bl	8002038 <shake256>
 80017ae:	b00a      	add	sp, #40	@ 0x28
 80017b0:	bd70      	pop	{r4, r5, r6, pc}
 80017b2:	bf00      	nop

080017b4 <kyber_shake256_rkprf>:
 80017b4:	b570      	push	{r4, r5, r6, lr}
 80017b6:	b0b4      	sub	sp, #208	@ 0xd0
 80017b8:	4604      	mov	r4, r0
 80017ba:	460e      	mov	r6, r1
 80017bc:	4668      	mov	r0, sp
 80017be:	4615      	mov	r5, r2
 80017c0:	f000 f9da 	bl	8001b78 <shake256_inc_init>
 80017c4:	4631      	mov	r1, r6
 80017c6:	4668      	mov	r0, sp
 80017c8:	2220      	movs	r2, #32
 80017ca:	f000 f9e1 	bl	8001b90 <shake256_inc_absorb>
 80017ce:	4629      	mov	r1, r5
 80017d0:	f44f 6288 	mov.w	r2, #1088	@ 0x440
 80017d4:	4668      	mov	r0, sp
 80017d6:	f000 f9db 	bl	8001b90 <shake256_inc_absorb>
 80017da:	4668      	mov	r0, sp
 80017dc:	f000 fa14 	bl	8001c08 <shake256_inc_finalize>
 80017e0:	466a      	mov	r2, sp
 80017e2:	2120      	movs	r1, #32
 80017e4:	4620      	mov	r0, r4
 80017e6:	f000 fa3b 	bl	8001c60 <shake256_inc_squeeze>
 80017ea:	4668      	mov	r0, sp
 80017ec:	f000 fa82 	bl	8001cf4 <shake256_inc_ctx_release>
 80017f0:	b034      	add	sp, #208	@ 0xd0
 80017f2:	bd70      	pop	{r4, r5, r6, pc}

080017f4 <verify>:
 80017f4:	b1ba      	cbz	r2, 8001826 <verify+0x32>
 80017f6:	f100 3cff 	add.w	ip, r0, #4294967295	@ 0xffffffff
 80017fa:	b500      	push	{lr}
 80017fc:	3901      	subs	r1, #1
 80017fe:	4462      	add	r2, ip
 8001800:	f04f 0e00 	mov.w	lr, #0
 8001804:	f81c 3f01 	ldrb.w	r3, [ip, #1]!
 8001808:	f811 0f01 	ldrb.w	r0, [r1, #1]!
 800180c:	4562      	cmp	r2, ip
 800180e:	ea83 0300 	eor.w	r3, r3, r0
 8001812:	ea43 0e0e 	orr.w	lr, r3, lr
 8001816:	d1f5      	bne.n	8001804 <verify+0x10>
 8001818:	f1de 0e00 	rsbs	lr, lr, #0
 800181c:	eb62 0202 	sbc.w	r2, r2, r2
 8001820:	0fd0      	lsrs	r0, r2, #31
 8001822:	f85d fb04 	ldr.w	pc, [sp], #4
 8001826:	4610      	mov	r0, r2
 8001828:	4770      	bx	lr
 800182a:	bf00      	nop

0800182c <cmov>:
 800182c:	2a00      	cmp	r2, #0
 800182e:	d05e      	beq.n	80018ee <cmov+0xc2>
 8001830:	425b      	negs	r3, r3
 8001832:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8001836:	fa5f fe83 	uxtb.w	lr, r3
 800183a:	1e53      	subs	r3, r2, #1
 800183c:	2b02      	cmp	r3, #2
 800183e:	d903      	bls.n	8001848 <cmov+0x1c>
 8001840:	1c4b      	adds	r3, r1, #1
 8001842:	1ac3      	subs	r3, r0, r3
 8001844:	2b02      	cmp	r3, #2
 8001846:	d813      	bhi.n	8001870 <cmov+0x44>
 8001848:	4402      	add	r2, r0
 800184a:	3901      	subs	r1, #1
 800184c:	3801      	subs	r0, #1
 800184e:	3a01      	subs	r2, #1
 8001850:	f810 cf01 	ldrb.w	ip, [r0, #1]!
 8001854:	f811 3f01 	ldrb.w	r3, [r1, #1]!
 8001858:	ea8c 0303 	eor.w	r3, ip, r3
 800185c:	ea0e 0303 	and.w	r3, lr, r3
 8001860:	ea8c 0c03 	eor.w	ip, ip, r3
 8001864:	4290      	cmp	r0, r2
 8001866:	f880 c000 	strb.w	ip, [r0]
 800186a:	d1f1      	bne.n	8001850 <cmov+0x24>
 800186c:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001870:	2500      	movs	r5, #0
 8001872:	f36e 0507 	bfi	r5, lr, #0, #8
 8001876:	f36e 250f 	bfi	r5, lr, #8, #8
 800187a:	f36e 4517 	bfi	r5, lr, #16, #8
 800187e:	f022 0603 	bic.w	r6, r2, #3
 8001882:	f36e 651f 	bfi	r5, lr, #24, #8
 8001886:	4684      	mov	ip, r0
 8001888:	460c      	mov	r4, r1
 800188a:	ea4f 0892 	mov.w	r8, r2, lsr #2
 800188e:	1987      	adds	r7, r0, r6
 8001890:	f8dc 9000 	ldr.w	r9, [ip]
 8001894:	f854 3b04 	ldr.w	r3, [r4], #4
 8001898:	ea83 0309 	eor.w	r3, r3, r9
 800189c:	402b      	ands	r3, r5
 800189e:	ea83 0309 	eor.w	r3, r3, r9
 80018a2:	f84c 3b04 	str.w	r3, [ip], #4
 80018a6:	45bc      	cmp	ip, r7
 80018a8:	d1f2      	bne.n	8001890 <cmov+0x64>
 80018aa:	42b2      	cmp	r2, r6
 80018ac:	d0de      	beq.n	800186c <cmov+0x40>
 80018ae:	f810 4028 	ldrb.w	r4, [r0, r8, lsl #2]
 80018b2:	f811 3028 	ldrb.w	r3, [r1, r8, lsl #2]
 80018b6:	4063      	eors	r3, r4
 80018b8:	ea0e 0303 	and.w	r3, lr, r3
 80018bc:	405c      	eors	r4, r3
 80018be:	f800 4028 	strb.w	r4, [r0, r8, lsl #2]
 80018c2:	1c74      	adds	r4, r6, #1
 80018c4:	42a2      	cmp	r2, r4
 80018c6:	d9d1      	bls.n	800186c <cmov+0x40>
 80018c8:	5d05      	ldrb	r5, [r0, r4]
 80018ca:	5d0b      	ldrb	r3, [r1, r4]
 80018cc:	406b      	eors	r3, r5
 80018ce:	3602      	adds	r6, #2
 80018d0:	ea0e 0303 	and.w	r3, lr, r3
 80018d4:	405d      	eors	r5, r3
 80018d6:	42b2      	cmp	r2, r6
 80018d8:	5505      	strb	r5, [r0, r4]
 80018da:	d9c7      	bls.n	800186c <cmov+0x40>
 80018dc:	5d82      	ldrb	r2, [r0, r6]
 80018de:	5d8b      	ldrb	r3, [r1, r6]
 80018e0:	4053      	eors	r3, r2
 80018e2:	ea0e 0303 	and.w	r3, lr, r3
 80018e6:	405a      	eors	r2, r3
 80018e8:	5582      	strb	r2, [r0, r6]
 80018ea:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80018ee:	4770      	bx	lr

080018f0 <keccak_absorb.constprop.0>:
 80018f0:	b570      	push	{r4, r5, r6, lr}
 80018f2:	b082      	sub	sp, #8
 80018f4:	2a87      	cmp	r2, #135	@ 0x87
 80018f6:	4614      	mov	r4, r2
 80018f8:	f88d 3007 	strb.w	r3, [sp, #7]
 80018fc:	4606      	mov	r6, r0
 80018fe:	460d      	mov	r5, r1
 8001900:	d90d      	bls.n	800191e <keccak_absorb.constprop.0+0x2e>
 8001902:	4629      	mov	r1, r5
 8001904:	2388      	movs	r3, #136	@ 0x88
 8001906:	2200      	movs	r2, #0
 8001908:	4630      	mov	r0, r6
 800190a:	f003 fbf9 	bl	8005100 <KeccakF1600_StateXORBytes>
 800190e:	3c88      	subs	r4, #136	@ 0x88
 8001910:	4630      	mov	r0, r6
 8001912:	f003 ff75 	bl	8005800 <KeccakF1600_StatePermute>
 8001916:	2c87      	cmp	r4, #135	@ 0x87
 8001918:	f105 0588 	add.w	r5, r5, #136	@ 0x88
 800191c:	d8f1      	bhi.n	8001902 <keccak_absorb.constprop.0+0x12>
 800191e:	b994      	cbnz	r4, 8001946 <keccak_absorb.constprop.0+0x56>
 8001920:	4622      	mov	r2, r4
 8001922:	f10d 0107 	add.w	r1, sp, #7
 8001926:	4630      	mov	r0, r6
 8001928:	2301      	movs	r3, #1
 800192a:	f003 fbe9 	bl	8005100 <KeccakF1600_StateXORBytes>
 800192e:	2480      	movs	r4, #128	@ 0x80
 8001930:	2301      	movs	r3, #1
 8001932:	2287      	movs	r2, #135	@ 0x87
 8001934:	f10d 0107 	add.w	r1, sp, #7
 8001938:	4630      	mov	r0, r6
 800193a:	f88d 4007 	strb.w	r4, [sp, #7]
 800193e:	f003 fbdf 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001942:	b002      	add	sp, #8
 8001944:	bd70      	pop	{r4, r5, r6, pc}
 8001946:	4623      	mov	r3, r4
 8001948:	2200      	movs	r2, #0
 800194a:	4629      	mov	r1, r5
 800194c:	4630      	mov	r0, r6
 800194e:	f003 fbd7 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001952:	2c87      	cmp	r4, #135	@ 0x87
 8001954:	d1e4      	bne.n	8001920 <keccak_absorb.constprop.0+0x30>
 8001956:	f89d 5007 	ldrb.w	r5, [sp, #7]
 800195a:	2301      	movs	r3, #1
 800195c:	f065 057f 	orn	r5, r5, #127	@ 0x7f
 8001960:	4622      	mov	r2, r4
 8001962:	f10d 0107 	add.w	r1, sp, #7
 8001966:	4630      	mov	r0, r6
 8001968:	f88d 5007 	strb.w	r5, [sp, #7]
 800196c:	f003 fbc8 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001970:	b002      	add	sp, #8
 8001972:	bd70      	pop	{r4, r5, r6, pc}

08001974 <keccak_absorb.constprop.1>:
 8001974:	b570      	push	{r4, r5, r6, lr}
 8001976:	b082      	sub	sp, #8
 8001978:	2aa7      	cmp	r2, #167	@ 0xa7
 800197a:	4614      	mov	r4, r2
 800197c:	f88d 3007 	strb.w	r3, [sp, #7]
 8001980:	4606      	mov	r6, r0
 8001982:	460d      	mov	r5, r1
 8001984:	d90d      	bls.n	80019a2 <keccak_absorb.constprop.1+0x2e>
 8001986:	4629      	mov	r1, r5
 8001988:	23a8      	movs	r3, #168	@ 0xa8
 800198a:	2200      	movs	r2, #0
 800198c:	4630      	mov	r0, r6
 800198e:	f003 fbb7 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001992:	3ca8      	subs	r4, #168	@ 0xa8
 8001994:	4630      	mov	r0, r6
 8001996:	f003 ff33 	bl	8005800 <KeccakF1600_StatePermute>
 800199a:	2ca7      	cmp	r4, #167	@ 0xa7
 800199c:	f105 05a8 	add.w	r5, r5, #168	@ 0xa8
 80019a0:	d8f1      	bhi.n	8001986 <keccak_absorb.constprop.1+0x12>
 80019a2:	b994      	cbnz	r4, 80019ca <keccak_absorb.constprop.1+0x56>
 80019a4:	4622      	mov	r2, r4
 80019a6:	f10d 0107 	add.w	r1, sp, #7
 80019aa:	4630      	mov	r0, r6
 80019ac:	2301      	movs	r3, #1
 80019ae:	f003 fba7 	bl	8005100 <KeccakF1600_StateXORBytes>
 80019b2:	2480      	movs	r4, #128	@ 0x80
 80019b4:	2301      	movs	r3, #1
 80019b6:	22a7      	movs	r2, #167	@ 0xa7
 80019b8:	f10d 0107 	add.w	r1, sp, #7
 80019bc:	4630      	mov	r0, r6
 80019be:	f88d 4007 	strb.w	r4, [sp, #7]
 80019c2:	f003 fb9d 	bl	8005100 <KeccakF1600_StateXORBytes>
 80019c6:	b002      	add	sp, #8
 80019c8:	bd70      	pop	{r4, r5, r6, pc}
 80019ca:	4623      	mov	r3, r4
 80019cc:	2200      	movs	r2, #0
 80019ce:	4629      	mov	r1, r5
 80019d0:	4630      	mov	r0, r6
 80019d2:	f003 fb95 	bl	8005100 <KeccakF1600_StateXORBytes>
 80019d6:	2ca7      	cmp	r4, #167	@ 0xa7
 80019d8:	d1e4      	bne.n	80019a4 <keccak_absorb.constprop.1+0x30>
 80019da:	f89d 5007 	ldrb.w	r5, [sp, #7]
 80019de:	2301      	movs	r3, #1
 80019e0:	f065 057f 	orn	r5, r5, #127	@ 0x7f
 80019e4:	4622      	mov	r2, r4
 80019e6:	f10d 0107 	add.w	r1, sp, #7
 80019ea:	4630      	mov	r0, r6
 80019ec:	f88d 5007 	strb.w	r5, [sp, #7]
 80019f0:	f003 fb86 	bl	8005100 <KeccakF1600_StateXORBytes>
 80019f4:	b002      	add	sp, #8
 80019f6:	bd70      	pop	{r4, r5, r6, pc}

080019f8 <shake128_inc_init>:
 80019f8:	b510      	push	{r4, lr}
 80019fa:	22c8      	movs	r2, #200	@ 0xc8
 80019fc:	2100      	movs	r1, #0
 80019fe:	4604      	mov	r4, r0
 8001a00:	f005 face 	bl	8006fa0 <memset>
 8001a04:	2200      	movs	r2, #0
 8001a06:	2300      	movs	r3, #0
 8001a08:	e9c4 2332 	strd	r2, r3, [r4, #200]	@ 0xc8
 8001a0c:	bd10      	pop	{r4, pc}
 8001a0e:	bf00      	nop

08001a10 <shake128_inc_absorb>:
 8001a10:	e92d 4370 	stmdb	sp!, {r4, r5, r6, r8, r9, lr}
 8001a14:	4615      	mov	r5, r2
 8001a16:	4604      	mov	r4, r0
 8001a18:	e9d0 2032 	ldrd	r2, r0, [r0, #200]	@ 0xc8
 8001a1c:	18ab      	adds	r3, r5, r2
 8001a1e:	f140 0000 	adc.w	r0, r0, #0
 8001a22:	2ba8      	cmp	r3, #168	@ 0xa8
 8001a24:	f170 0000 	sbcs.w	r0, r0, #0
 8001a28:	460e      	mov	r6, r1
 8001a2a:	d31f      	bcc.n	8001a6c <shake128_inc_absorb+0x5c>
 8001a2c:	f04f 0800 	mov.w	r8, #0
 8001a30:	f04f 0900 	mov.w	r9, #0
 8001a34:	f1c2 03a8 	rsb	r3, r2, #168	@ 0xa8
 8001a38:	4631      	mov	r1, r6
 8001a3a:	4620      	mov	r0, r4
 8001a3c:	f003 fb60 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001a40:	f8d4 30c8 	ldr.w	r3, [r4, #200]	@ 0xc8
 8001a44:	4620      	mov	r0, r4
 8001a46:	f1a3 02a8 	sub.w	r2, r3, #168	@ 0xa8
 8001a4a:	e9c4 8932 	strd	r8, r9, [r4, #200]	@ 0xc8
 8001a4e:	f1c3 03a8 	rsb	r3, r3, #168	@ 0xa8
 8001a52:	4415      	add	r5, r2
 8001a54:	441e      	add	r6, r3
 8001a56:	f003 fed3 	bl	8005800 <KeccakF1600_StatePermute>
 8001a5a:	e9d4 2032 	ldrd	r2, r0, [r4, #200]	@ 0xc8
 8001a5e:	1953      	adds	r3, r2, r5
 8001a60:	f140 0000 	adc.w	r0, r0, #0
 8001a64:	2ba8      	cmp	r3, #168	@ 0xa8
 8001a66:	f170 0000 	sbcs.w	r0, r0, #0
 8001a6a:	d2e3      	bcs.n	8001a34 <shake128_inc_absorb+0x24>
 8001a6c:	462b      	mov	r3, r5
 8001a6e:	4631      	mov	r1, r6
 8001a70:	4620      	mov	r0, r4
 8001a72:	f003 fb45 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001a76:	e9d4 3232 	ldrd	r3, r2, [r4, #200]	@ 0xc8
 8001a7a:	195b      	adds	r3, r3, r5
 8001a7c:	f142 0200 	adc.w	r2, r2, #0
 8001a80:	e9c4 3232 	strd	r3, r2, [r4, #200]	@ 0xc8
 8001a84:	e8bd 8370 	ldmia.w	sp!, {r4, r5, r6, r8, r9, pc}

08001a88 <shake128_inc_finalize>:
 8001a88:	b510      	push	{r4, lr}
 8001a8a:	e9d0 2132 	ldrd	r2, r1, [r0, #200]	@ 0xc8
 8001a8e:	b082      	sub	sp, #8
 8001a90:	231f      	movs	r3, #31
 8001a92:	f88d 3007 	strb.w	r3, [sp, #7]
 8001a96:	f1a2 03a7 	sub.w	r3, r2, #167	@ 0xa7
 8001a9a:	430b      	orrs	r3, r1
 8001a9c:	4604      	mov	r4, r0
 8001a9e:	d014      	beq.n	8001aca <shake128_inc_finalize+0x42>
 8001aa0:	2301      	movs	r3, #1
 8001aa2:	f10d 0107 	add.w	r1, sp, #7
 8001aa6:	f003 fb2b 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001aaa:	2080      	movs	r0, #128	@ 0x80
 8001aac:	f88d 0007 	strb.w	r0, [sp, #7]
 8001ab0:	2301      	movs	r3, #1
 8001ab2:	22a7      	movs	r2, #167	@ 0xa7
 8001ab4:	f10d 0107 	add.w	r1, sp, #7
 8001ab8:	4620      	mov	r0, r4
 8001aba:	f003 fb21 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001abe:	2200      	movs	r2, #0
 8001ac0:	2300      	movs	r3, #0
 8001ac2:	e9c4 2332 	strd	r2, r3, [r4, #200]	@ 0xc8
 8001ac6:	b002      	add	sp, #8
 8001ac8:	bd10      	pop	{r4, pc}
 8001aca:	219f      	movs	r1, #159	@ 0x9f
 8001acc:	f88d 1007 	strb.w	r1, [sp, #7]
 8001ad0:	2301      	movs	r3, #1
 8001ad2:	22a7      	movs	r2, #167	@ 0xa7
 8001ad4:	f10d 0107 	add.w	r1, sp, #7
 8001ad8:	f003 fb12 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001adc:	e7ef      	b.n	8001abe <shake128_inc_finalize+0x36>
 8001ade:	bf00      	nop

08001ae0 <shake128_inc_squeeze>:
 8001ae0:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8001ae4:	e9d2 6932 	ldrd	r6, r9, [r2, #200]	@ 0xc8
 8001ae8:	f04f 0800 	mov.w	r8, #0
 8001aec:	42b1      	cmp	r1, r6
 8001aee:	eb78 0309 	sbcs.w	r3, r8, r9
 8001af2:	4615      	mov	r5, r2
 8001af4:	460c      	mov	r4, r1
 8001af6:	4607      	mov	r7, r0
 8001af8:	f1c6 02a8 	rsb	r2, r6, #168	@ 0xa8
 8001afc:	d20d      	bcs.n	8001b1a <shake128_inc_squeeze+0x3a>
 8001afe:	460b      	mov	r3, r1
 8001b00:	4601      	mov	r1, r0
 8001b02:	4628      	mov	r0, r5
 8001b04:	f003 fc7c 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8001b08:	e9d5 3232 	ldrd	r3, r2, [r5, #200]	@ 0xc8
 8001b0c:	1b1b      	subs	r3, r3, r4
 8001b0e:	f162 0200 	sbc.w	r2, r2, #0
 8001b12:	e9c5 3232 	strd	r3, r2, [r5, #200]	@ 0xc8
 8001b16:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8001b1a:	4633      	mov	r3, r6
 8001b1c:	4601      	mov	r1, r0
 8001b1e:	4628      	mov	r0, r5
 8001b20:	f003 fc6e 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8001b24:	f8d5 30c8 	ldr.w	r3, [r5, #200]	@ 0xc8
 8001b28:	1b9b      	subs	r3, r3, r6
 8001b2a:	f8c5 30c8 	str.w	r3, [r5, #200]	@ 0xc8
 8001b2e:	f8d5 30cc 	ldr.w	r3, [r5, #204]	@ 0xcc
 8001b32:	4437      	add	r7, r6
 8001b34:	eb63 0309 	sbc.w	r3, r3, r9
 8001b38:	1ba6      	subs	r6, r4, r6
 8001b3a:	f8c5 30cc 	str.w	r3, [r5, #204]	@ 0xcc
 8001b3e:	d0ea      	beq.n	8001b16 <shake128_inc_squeeze+0x36>
 8001b40:	4628      	mov	r0, r5
 8001b42:	f003 fe5d 	bl	8005800 <KeccakF1600_StatePermute>
 8001b46:	2ea8      	cmp	r6, #168	@ 0xa8
 8001b48:	4634      	mov	r4, r6
 8001b4a:	bf28      	it	cs
 8001b4c:	24a8      	movcs	r4, #168	@ 0xa8
 8001b4e:	4623      	mov	r3, r4
 8001b50:	4639      	mov	r1, r7
 8001b52:	2200      	movs	r2, #0
 8001b54:	4628      	mov	r0, r5
 8001b56:	f003 fc53 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8001b5a:	f1c4 03a8 	rsb	r3, r4, #168	@ 0xa8
 8001b5e:	1b36      	subs	r6, r6, r4
 8001b60:	e9c5 3832 	strd	r3, r8, [r5, #200]	@ 0xc8
 8001b64:	4427      	add	r7, r4
 8001b66:	d1eb      	bne.n	8001b40 <shake128_inc_squeeze+0x60>
 8001b68:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}

08001b6c <shake128_inc_ctx_clone>:
 8001b6c:	22d0      	movs	r2, #208	@ 0xd0
 8001b6e:	f005 ba69 	b.w	8007044 <memcpy>
 8001b72:	bf00      	nop

08001b74 <shake128_inc_ctx_release>:
 8001b74:	4770      	bx	lr
 8001b76:	bf00      	nop

08001b78 <shake256_inc_init>:
 8001b78:	b510      	push	{r4, lr}
 8001b7a:	22c8      	movs	r2, #200	@ 0xc8
 8001b7c:	2100      	movs	r1, #0
 8001b7e:	4604      	mov	r4, r0
 8001b80:	f005 fa0e 	bl	8006fa0 <memset>
 8001b84:	2200      	movs	r2, #0
 8001b86:	2300      	movs	r3, #0
 8001b88:	e9c4 2332 	strd	r2, r3, [r4, #200]	@ 0xc8
 8001b8c:	bd10      	pop	{r4, pc}
 8001b8e:	bf00      	nop

08001b90 <shake256_inc_absorb>:
 8001b90:	e92d 4370 	stmdb	sp!, {r4, r5, r6, r8, r9, lr}
 8001b94:	4615      	mov	r5, r2
 8001b96:	4604      	mov	r4, r0
 8001b98:	e9d0 2032 	ldrd	r2, r0, [r0, #200]	@ 0xc8
 8001b9c:	18ab      	adds	r3, r5, r2
 8001b9e:	f140 0000 	adc.w	r0, r0, #0
 8001ba2:	2b88      	cmp	r3, #136	@ 0x88
 8001ba4:	f170 0000 	sbcs.w	r0, r0, #0
 8001ba8:	460e      	mov	r6, r1
 8001baa:	d31f      	bcc.n	8001bec <shake256_inc_absorb+0x5c>
 8001bac:	f04f 0800 	mov.w	r8, #0
 8001bb0:	f04f 0900 	mov.w	r9, #0
 8001bb4:	f1c2 0388 	rsb	r3, r2, #136	@ 0x88
 8001bb8:	4631      	mov	r1, r6
 8001bba:	4620      	mov	r0, r4
 8001bbc:	f003 faa0 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001bc0:	f8d4 30c8 	ldr.w	r3, [r4, #200]	@ 0xc8
 8001bc4:	4620      	mov	r0, r4
 8001bc6:	f1a3 0288 	sub.w	r2, r3, #136	@ 0x88
 8001bca:	e9c4 8932 	strd	r8, r9, [r4, #200]	@ 0xc8
 8001bce:	f1c3 0388 	rsb	r3, r3, #136	@ 0x88
 8001bd2:	4415      	add	r5, r2
 8001bd4:	441e      	add	r6, r3
 8001bd6:	f003 fe13 	bl	8005800 <KeccakF1600_StatePermute>
 8001bda:	e9d4 2032 	ldrd	r2, r0, [r4, #200]	@ 0xc8
 8001bde:	1953      	adds	r3, r2, r5
 8001be0:	f140 0000 	adc.w	r0, r0, #0
 8001be4:	2b88      	cmp	r3, #136	@ 0x88
 8001be6:	f170 0000 	sbcs.w	r0, r0, #0
 8001bea:	d2e3      	bcs.n	8001bb4 <shake256_inc_absorb+0x24>
 8001bec:	462b      	mov	r3, r5
 8001bee:	4631      	mov	r1, r6
 8001bf0:	4620      	mov	r0, r4
 8001bf2:	f003 fa85 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001bf6:	e9d4 3232 	ldrd	r3, r2, [r4, #200]	@ 0xc8
 8001bfa:	195b      	adds	r3, r3, r5
 8001bfc:	f142 0200 	adc.w	r2, r2, #0
 8001c00:	e9c4 3232 	strd	r3, r2, [r4, #200]	@ 0xc8
 8001c04:	e8bd 8370 	ldmia.w	sp!, {r4, r5, r6, r8, r9, pc}

08001c08 <shake256_inc_finalize>:
 8001c08:	b510      	push	{r4, lr}
 8001c0a:	e9d0 2132 	ldrd	r2, r1, [r0, #200]	@ 0xc8
 8001c0e:	b082      	sub	sp, #8
 8001c10:	231f      	movs	r3, #31
 8001c12:	f88d 3007 	strb.w	r3, [sp, #7]
 8001c16:	f1a2 0387 	sub.w	r3, r2, #135	@ 0x87
 8001c1a:	430b      	orrs	r3, r1
 8001c1c:	4604      	mov	r4, r0
 8001c1e:	d014      	beq.n	8001c4a <shake256_inc_finalize+0x42>
 8001c20:	2301      	movs	r3, #1
 8001c22:	f10d 0107 	add.w	r1, sp, #7
 8001c26:	f003 fa6b 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001c2a:	2080      	movs	r0, #128	@ 0x80
 8001c2c:	f88d 0007 	strb.w	r0, [sp, #7]
 8001c30:	2301      	movs	r3, #1
 8001c32:	2287      	movs	r2, #135	@ 0x87
 8001c34:	f10d 0107 	add.w	r1, sp, #7
 8001c38:	4620      	mov	r0, r4
 8001c3a:	f003 fa61 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001c3e:	2200      	movs	r2, #0
 8001c40:	2300      	movs	r3, #0
 8001c42:	e9c4 2332 	strd	r2, r3, [r4, #200]	@ 0xc8
 8001c46:	b002      	add	sp, #8
 8001c48:	bd10      	pop	{r4, pc}
 8001c4a:	219f      	movs	r1, #159	@ 0x9f
 8001c4c:	f88d 1007 	strb.w	r1, [sp, #7]
 8001c50:	2301      	movs	r3, #1
 8001c52:	2287      	movs	r2, #135	@ 0x87
 8001c54:	f10d 0107 	add.w	r1, sp, #7
 8001c58:	f003 fa52 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001c5c:	e7ef      	b.n	8001c3e <shake256_inc_finalize+0x36>
 8001c5e:	bf00      	nop

08001c60 <shake256_inc_squeeze>:
 8001c60:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8001c64:	e9d2 6932 	ldrd	r6, r9, [r2, #200]	@ 0xc8
 8001c68:	f04f 0800 	mov.w	r8, #0
 8001c6c:	42b1      	cmp	r1, r6
 8001c6e:	eb78 0309 	sbcs.w	r3, r8, r9
 8001c72:	4615      	mov	r5, r2
 8001c74:	460c      	mov	r4, r1
 8001c76:	4607      	mov	r7, r0
 8001c78:	f1c6 0288 	rsb	r2, r6, #136	@ 0x88
 8001c7c:	d20d      	bcs.n	8001c9a <shake256_inc_squeeze+0x3a>
 8001c7e:	460b      	mov	r3, r1
 8001c80:	4601      	mov	r1, r0
 8001c82:	4628      	mov	r0, r5
 8001c84:	f003 fbbc 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8001c88:	e9d5 3232 	ldrd	r3, r2, [r5, #200]	@ 0xc8
 8001c8c:	1b1b      	subs	r3, r3, r4
 8001c8e:	f162 0200 	sbc.w	r2, r2, #0
 8001c92:	e9c5 3232 	strd	r3, r2, [r5, #200]	@ 0xc8
 8001c96:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8001c9a:	4633      	mov	r3, r6
 8001c9c:	4601      	mov	r1, r0
 8001c9e:	4628      	mov	r0, r5
 8001ca0:	f003 fbae 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8001ca4:	f8d5 30c8 	ldr.w	r3, [r5, #200]	@ 0xc8
 8001ca8:	1b9b      	subs	r3, r3, r6
 8001caa:	f8c5 30c8 	str.w	r3, [r5, #200]	@ 0xc8
 8001cae:	f8d5 30cc 	ldr.w	r3, [r5, #204]	@ 0xcc
 8001cb2:	4437      	add	r7, r6
 8001cb4:	eb63 0309 	sbc.w	r3, r3, r9
 8001cb8:	1ba6      	subs	r6, r4, r6
 8001cba:	f8c5 30cc 	str.w	r3, [r5, #204]	@ 0xcc
 8001cbe:	d0ea      	beq.n	8001c96 <shake256_inc_squeeze+0x36>
 8001cc0:	4628      	mov	r0, r5
 8001cc2:	f003 fd9d 	bl	8005800 <KeccakF1600_StatePermute>
 8001cc6:	2e88      	cmp	r6, #136	@ 0x88
 8001cc8:	4634      	mov	r4, r6
 8001cca:	bf28      	it	cs
 8001ccc:	2488      	movcs	r4, #136	@ 0x88
 8001cce:	4623      	mov	r3, r4
 8001cd0:	4639      	mov	r1, r7
 8001cd2:	2200      	movs	r2, #0
 8001cd4:	4628      	mov	r0, r5
 8001cd6:	f003 fb93 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8001cda:	f1c4 0388 	rsb	r3, r4, #136	@ 0x88
 8001cde:	1b36      	subs	r6, r6, r4
 8001ce0:	e9c5 3832 	strd	r3, r8, [r5, #200]	@ 0xc8
 8001ce4:	4427      	add	r7, r4
 8001ce6:	d1eb      	bne.n	8001cc0 <shake256_inc_squeeze+0x60>
 8001ce8:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}

08001cec <shake256_inc_ctx_clone>:
 8001cec:	22d0      	movs	r2, #208	@ 0xd0
 8001cee:	f005 b9a9 	b.w	8007044 <memcpy>
 8001cf2:	bf00      	nop

08001cf4 <shake256_inc_ctx_release>:
 8001cf4:	4770      	bx	lr
 8001cf6:	bf00      	nop

08001cf8 <cshake128_simple_absorb>:
 8001cf8:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001cfa:	460f      	mov	r7, r1
 8001cfc:	b083      	sub	sp, #12
 8001cfe:	4615      	mov	r5, r2
 8001d00:	2100      	movs	r1, #0
 8001d02:	22c8      	movs	r2, #200	@ 0xc8
 8001d04:	4604      	mov	r4, r0
 8001d06:	461e      	mov	r6, r3
 8001d08:	f005 f94a 	bl	8006fa0 <memset>
 8001d0c:	4b0c      	ldr	r3, [pc, #48]	@ (8001d40 <cshake128_simple_absorb+0x48>)
 8001d0e:	9300      	str	r3, [sp, #0]
 8001d10:	f241 0301 	movw	r3, #4097	@ 0x1001
 8001d14:	4669      	mov	r1, sp
 8001d16:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001d1a:	2200      	movs	r2, #0
 8001d1c:	2308      	movs	r3, #8
 8001d1e:	4620      	mov	r0, r4
 8001d20:	f8ad 7006 	strh.w	r7, [sp, #6]
 8001d24:	f003 f9ec 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001d28:	4620      	mov	r0, r4
 8001d2a:	f003 fd69 	bl	8005800 <KeccakF1600_StatePermute>
 8001d2e:	2304      	movs	r3, #4
 8001d30:	4632      	mov	r2, r6
 8001d32:	4629      	mov	r1, r5
 8001d34:	4620      	mov	r0, r4
 8001d36:	f7ff fe1d 	bl	8001974 <keccak_absorb.constprop.1>
 8001d3a:	b003      	add	sp, #12
 8001d3c:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001d3e:	bf00      	nop
 8001d40:	0001a801 	.word	0x0001a801

08001d44 <cshake128_simple_squeezeblocks>:
 8001d44:	b189      	cbz	r1, 8001d6a <cshake128_simple_squeezeblocks+0x26>
 8001d46:	b570      	push	{r4, r5, r6, lr}
 8001d48:	4605      	mov	r5, r0
 8001d4a:	4616      	mov	r6, r2
 8001d4c:	460c      	mov	r4, r1
 8001d4e:	4630      	mov	r0, r6
 8001d50:	f003 fd56 	bl	8005800 <KeccakF1600_StatePermute>
 8001d54:	4629      	mov	r1, r5
 8001d56:	23a8      	movs	r3, #168	@ 0xa8
 8001d58:	2200      	movs	r2, #0
 8001d5a:	4630      	mov	r0, r6
 8001d5c:	f003 fb50 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8001d60:	3c01      	subs	r4, #1
 8001d62:	f105 05a8 	add.w	r5, r5, #168	@ 0xa8
 8001d66:	d1f2      	bne.n	8001d4e <cshake128_simple_squeezeblocks+0xa>
 8001d68:	bd70      	pop	{r4, r5, r6, pc}
 8001d6a:	4770      	bx	lr

08001d6c <cshake128_simple>:
 8001d6c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
 8001d70:	b0b8      	sub	sp, #224	@ 0xe0
 8001d72:	4614      	mov	r4, r2
 8001d74:	4607      	mov	r7, r0
 8001d76:	22c8      	movs	r2, #200	@ 0xc8
 8001d78:	460e      	mov	r6, r1
 8001d7a:	a804      	add	r0, sp, #16
 8001d7c:	2100      	movs	r1, #0
 8001d7e:	4698      	mov	r8, r3
 8001d80:	9d40      	ldr	r5, [sp, #256]	@ 0x100
 8001d82:	f005 f90d 	bl	8006fa0 <memset>
 8001d86:	4b42      	ldr	r3, [pc, #264]	@ (8001e90 <cshake128_simple+0x124>)
 8001d88:	9302      	str	r3, [sp, #8]
 8001d8a:	f241 0301 	movw	r3, #4097	@ 0x1001
 8001d8e:	f8ad 300c 	strh.w	r3, [sp, #12]
 8001d92:	2308      	movs	r3, #8
 8001d94:	a804      	add	r0, sp, #16
 8001d96:	2200      	movs	r2, #0
 8001d98:	eb0d 0103 	add.w	r1, sp, r3
 8001d9c:	f04f 0a00 	mov.w	sl, #0
 8001da0:	f04f 0b00 	mov.w	fp, #0
 8001da4:	e9cd ab36 	strd	sl, fp, [sp, #216]	@ 0xd8
 8001da8:	f8ad 400e 	strh.w	r4, [sp, #14]
 8001dac:	f003 f9a8 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001db0:	a804      	add	r0, sp, #16
 8001db2:	e00f      	b.n	8001dd4 <cshake128_simple+0x68>
 8001db4:	f1c2 03a8 	rsb	r3, r2, #168	@ 0xa8
 8001db8:	4641      	mov	r1, r8
 8001dba:	a804      	add	r0, sp, #16
 8001dbc:	f003 f9a0 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001dc0:	9b36      	ldr	r3, [sp, #216]	@ 0xd8
 8001dc2:	e9cd ab36 	strd	sl, fp, [sp, #216]	@ 0xd8
 8001dc6:	f1a3 02a8 	sub.w	r2, r3, #168	@ 0xa8
 8001dca:	f1c3 03a8 	rsb	r3, r3, #168	@ 0xa8
 8001dce:	a804      	add	r0, sp, #16
 8001dd0:	4415      	add	r5, r2
 8001dd2:	4498      	add	r8, r3
 8001dd4:	f003 fd14 	bl	8005800 <KeccakF1600_StatePermute>
 8001dd8:	e9dd 2436 	ldrd	r2, r4, [sp, #216]	@ 0xd8
 8001ddc:	1953      	adds	r3, r2, r5
 8001dde:	f144 0400 	adc.w	r4, r4, #0
 8001de2:	2ba8      	cmp	r3, #168	@ 0xa8
 8001de4:	f174 0400 	sbcs.w	r4, r4, #0
 8001de8:	d2e4      	bcs.n	8001db4 <cshake128_simple+0x48>
 8001dea:	4641      	mov	r1, r8
 8001dec:	462b      	mov	r3, r5
 8001dee:	a804      	add	r0, sp, #16
 8001df0:	f003 f986 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001df4:	9b36      	ldr	r3, [sp, #216]	@ 0xd8
 8001df6:	18ea      	adds	r2, r5, r3
 8001df8:	9b37      	ldr	r3, [sp, #220]	@ 0xdc
 8001dfa:	9236      	str	r2, [sp, #216]	@ 0xd8
 8001dfc:	f04f 0104 	mov.w	r1, #4
 8001e00:	f143 0300 	adc.w	r3, r3, #0
 8001e04:	f88d 1007 	strb.w	r1, [sp, #7]
 8001e08:	f1a2 01a7 	sub.w	r1, r2, #167	@ 0xa7
 8001e0c:	4319      	orrs	r1, r3
 8001e0e:	9337      	str	r3, [sp, #220]	@ 0xdc
 8001e10:	d032      	beq.n	8001e78 <cshake128_simple+0x10c>
 8001e12:	2301      	movs	r3, #1
 8001e14:	f10d 0107 	add.w	r1, sp, #7
 8001e18:	a804      	add	r0, sp, #16
 8001e1a:	f003 f971 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001e1e:	2380      	movs	r3, #128	@ 0x80
 8001e20:	f88d 3007 	strb.w	r3, [sp, #7]
 8001e24:	f10d 0107 	add.w	r1, sp, #7
 8001e28:	2301      	movs	r3, #1
 8001e2a:	22a7      	movs	r2, #167	@ 0xa7
 8001e2c:	a804      	add	r0, sp, #16
 8001e2e:	f003 f967 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001e32:	2200      	movs	r2, #0
 8001e34:	2300      	movs	r3, #0
 8001e36:	e9cd 2336 	strd	r2, r3, [sp, #216]	@ 0xd8
 8001e3a:	4639      	mov	r1, r7
 8001e3c:	2300      	movs	r3, #0
 8001e3e:	22a8      	movs	r2, #168	@ 0xa8
 8001e40:	a804      	add	r0, sp, #16
 8001e42:	f003 fadd 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8001e46:	b1a6      	cbz	r6, 8001e72 <cshake128_simple+0x106>
 8001e48:	2500      	movs	r5, #0
 8001e4a:	a804      	add	r0, sp, #16
 8001e4c:	f003 fcd8 	bl	8005800 <KeccakF1600_StatePermute>
 8001e50:	2ea8      	cmp	r6, #168	@ 0xa8
 8001e52:	4634      	mov	r4, r6
 8001e54:	bf28      	it	cs
 8001e56:	24a8      	movcs	r4, #168	@ 0xa8
 8001e58:	4623      	mov	r3, r4
 8001e5a:	4639      	mov	r1, r7
 8001e5c:	2200      	movs	r2, #0
 8001e5e:	a804      	add	r0, sp, #16
 8001e60:	f003 face 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8001e64:	f1c4 03a8 	rsb	r3, r4, #168	@ 0xa8
 8001e68:	1b36      	subs	r6, r6, r4
 8001e6a:	e9cd 3536 	strd	r3, r5, [sp, #216]	@ 0xd8
 8001e6e:	4427      	add	r7, r4
 8001e70:	d1eb      	bne.n	8001e4a <cshake128_simple+0xde>
 8001e72:	b038      	add	sp, #224	@ 0xe0
 8001e74:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
 8001e78:	2284      	movs	r2, #132	@ 0x84
 8001e7a:	f88d 2007 	strb.w	r2, [sp, #7]
 8001e7e:	2301      	movs	r3, #1
 8001e80:	22a7      	movs	r2, #167	@ 0xa7
 8001e82:	f10d 0107 	add.w	r1, sp, #7
 8001e86:	a804      	add	r0, sp, #16
 8001e88:	f003 f93a 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001e8c:	e7d1      	b.n	8001e32 <cshake128_simple+0xc6>
 8001e8e:	bf00      	nop
 8001e90:	0001a801 	.word	0x0001a801

08001e94 <shake128_absorb>:
 8001e94:	b570      	push	{r4, r5, r6, lr}
 8001e96:	4616      	mov	r6, r2
 8001e98:	4604      	mov	r4, r0
 8001e9a:	460d      	mov	r5, r1
 8001e9c:	22c8      	movs	r2, #200	@ 0xc8
 8001e9e:	2100      	movs	r1, #0
 8001ea0:	f005 f87e 	bl	8006fa0 <memset>
 8001ea4:	4632      	mov	r2, r6
 8001ea6:	4629      	mov	r1, r5
 8001ea8:	4620      	mov	r0, r4
 8001eaa:	231f      	movs	r3, #31
 8001eac:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001eb0:	e560      	b.n	8001974 <keccak_absorb.constprop.1>
 8001eb2:	bf00      	nop

08001eb4 <shake128_squeezeblocks>:
 8001eb4:	b189      	cbz	r1, 8001eda <shake128_squeezeblocks+0x26>
 8001eb6:	b570      	push	{r4, r5, r6, lr}
 8001eb8:	4605      	mov	r5, r0
 8001eba:	4616      	mov	r6, r2
 8001ebc:	460c      	mov	r4, r1
 8001ebe:	4630      	mov	r0, r6
 8001ec0:	f003 fc9e 	bl	8005800 <KeccakF1600_StatePermute>
 8001ec4:	4629      	mov	r1, r5
 8001ec6:	23a8      	movs	r3, #168	@ 0xa8
 8001ec8:	2200      	movs	r2, #0
 8001eca:	4630      	mov	r0, r6
 8001ecc:	f003 fa98 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8001ed0:	3c01      	subs	r4, #1
 8001ed2:	f105 05a8 	add.w	r5, r5, #168	@ 0xa8
 8001ed6:	d1f2      	bne.n	8001ebe <shake128_squeezeblocks+0xa>
 8001ed8:	bd70      	pop	{r4, r5, r6, pc}
 8001eda:	4770      	bx	lr

08001edc <shake128>:
 8001edc:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8001ee0:	b0b7      	sub	sp, #220	@ 0xdc
 8001ee2:	461c      	mov	r4, r3
 8001ee4:	4606      	mov	r6, r0
 8001ee6:	460d      	mov	r5, r1
 8001ee8:	4617      	mov	r7, r2
 8001eea:	2100      	movs	r1, #0
 8001eec:	22c8      	movs	r2, #200	@ 0xc8
 8001eee:	a802      	add	r0, sp, #8
 8001ef0:	f005 f856 	bl	8006fa0 <memset>
 8001ef4:	f04f 0800 	mov.w	r8, #0
 8001ef8:	f04f 0900 	mov.w	r9, #0
 8001efc:	2ca7      	cmp	r4, #167	@ 0xa7
 8001efe:	e9cd 8934 	strd	r8, r9, [sp, #208]	@ 0xd0
 8001f02:	f04f 0200 	mov.w	r2, #0
 8001f06:	d91a      	bls.n	8001f3e <shake128+0x62>
 8001f08:	4639      	mov	r1, r7
 8001f0a:	f1c2 03a8 	rsb	r3, r2, #168	@ 0xa8
 8001f0e:	a802      	add	r0, sp, #8
 8001f10:	f003 f8f6 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001f14:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
 8001f16:	a802      	add	r0, sp, #8
 8001f18:	f1a3 02a8 	sub.w	r2, r3, #168	@ 0xa8
 8001f1c:	f1c3 03a8 	rsb	r3, r3, #168	@ 0xa8
 8001f20:	4414      	add	r4, r2
 8001f22:	441f      	add	r7, r3
 8001f24:	e9cd 8934 	strd	r8, r9, [sp, #208]	@ 0xd0
 8001f28:	f003 fc6a 	bl	8005800 <KeccakF1600_StatePermute>
 8001f2c:	e9dd 2334 	ldrd	r2, r3, [sp, #208]	@ 0xd0
 8001f30:	1911      	adds	r1, r2, r4
 8001f32:	f143 0300 	adc.w	r3, r3, #0
 8001f36:	29a8      	cmp	r1, #168	@ 0xa8
 8001f38:	f173 0300 	sbcs.w	r3, r3, #0
 8001f3c:	d2e4      	bcs.n	8001f08 <shake128+0x2c>
 8001f3e:	4639      	mov	r1, r7
 8001f40:	4623      	mov	r3, r4
 8001f42:	a802      	add	r0, sp, #8
 8001f44:	f003 f8dc 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001f48:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
 8001f4a:	18e2      	adds	r2, r4, r3
 8001f4c:	9b35      	ldr	r3, [sp, #212]	@ 0xd4
 8001f4e:	9234      	str	r2, [sp, #208]	@ 0xd0
 8001f50:	f04f 011f 	mov.w	r1, #31
 8001f54:	f143 0300 	adc.w	r3, r3, #0
 8001f58:	f88d 1007 	strb.w	r1, [sp, #7]
 8001f5c:	f1a2 01a7 	sub.w	r1, r2, #167	@ 0xa7
 8001f60:	4319      	orrs	r1, r3
 8001f62:	9335      	str	r3, [sp, #212]	@ 0xd4
 8001f64:	d032      	beq.n	8001fcc <shake128+0xf0>
 8001f66:	2301      	movs	r3, #1
 8001f68:	f10d 0107 	add.w	r1, sp, #7
 8001f6c:	a802      	add	r0, sp, #8
 8001f6e:	f003 f8c7 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001f72:	2380      	movs	r3, #128	@ 0x80
 8001f74:	f88d 3007 	strb.w	r3, [sp, #7]
 8001f78:	f10d 0107 	add.w	r1, sp, #7
 8001f7c:	2301      	movs	r3, #1
 8001f7e:	22a7      	movs	r2, #167	@ 0xa7
 8001f80:	a802      	add	r0, sp, #8
 8001f82:	f003 f8bd 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001f86:	2200      	movs	r2, #0
 8001f88:	2300      	movs	r3, #0
 8001f8a:	e9cd 2334 	strd	r2, r3, [sp, #208]	@ 0xd0
 8001f8e:	4631      	mov	r1, r6
 8001f90:	2300      	movs	r3, #0
 8001f92:	22a8      	movs	r2, #168	@ 0xa8
 8001f94:	a802      	add	r0, sp, #8
 8001f96:	f003 fa33 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8001f9a:	b1a5      	cbz	r5, 8001fc6 <shake128+0xea>
 8001f9c:	2700      	movs	r7, #0
 8001f9e:	a802      	add	r0, sp, #8
 8001fa0:	f003 fc2e 	bl	8005800 <KeccakF1600_StatePermute>
 8001fa4:	2da8      	cmp	r5, #168	@ 0xa8
 8001fa6:	462c      	mov	r4, r5
 8001fa8:	bf28      	it	cs
 8001faa:	24a8      	movcs	r4, #168	@ 0xa8
 8001fac:	4623      	mov	r3, r4
 8001fae:	4631      	mov	r1, r6
 8001fb0:	2200      	movs	r2, #0
 8001fb2:	a802      	add	r0, sp, #8
 8001fb4:	f003 fa24 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8001fb8:	f1c4 03a8 	rsb	r3, r4, #168	@ 0xa8
 8001fbc:	1b2d      	subs	r5, r5, r4
 8001fbe:	e9cd 3734 	strd	r3, r7, [sp, #208]	@ 0xd0
 8001fc2:	4426      	add	r6, r4
 8001fc4:	d1eb      	bne.n	8001f9e <shake128+0xc2>
 8001fc6:	b037      	add	sp, #220	@ 0xdc
 8001fc8:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001fcc:	229f      	movs	r2, #159	@ 0x9f
 8001fce:	f88d 2007 	strb.w	r2, [sp, #7]
 8001fd2:	2301      	movs	r3, #1
 8001fd4:	22a7      	movs	r2, #167	@ 0xa7
 8001fd6:	f10d 0107 	add.w	r1, sp, #7
 8001fda:	a802      	add	r0, sp, #8
 8001fdc:	f003 f890 	bl	8005100 <KeccakF1600_StateXORBytes>
 8001fe0:	e7d1      	b.n	8001f86 <shake128+0xaa>
 8001fe2:	bf00      	nop

08001fe4 <shake128_ctx_release>:
 8001fe4:	4770      	bx	lr
 8001fe6:	bf00      	nop

08001fe8 <shake128_ctx_clone>:
 8001fe8:	22c8      	movs	r2, #200	@ 0xc8
 8001fea:	f005 b82b 	b.w	8007044 <memcpy>
 8001fee:	bf00      	nop

08001ff0 <shake256_absorb>:
 8001ff0:	b570      	push	{r4, r5, r6, lr}
 8001ff2:	4616      	mov	r6, r2
 8001ff4:	4604      	mov	r4, r0
 8001ff6:	460d      	mov	r5, r1
 8001ff8:	22c8      	movs	r2, #200	@ 0xc8
 8001ffa:	2100      	movs	r1, #0
 8001ffc:	f004 ffd0 	bl	8006fa0 <memset>
 8002000:	4632      	mov	r2, r6
 8002002:	4629      	mov	r1, r5
 8002004:	4620      	mov	r0, r4
 8002006:	231f      	movs	r3, #31
 8002008:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800200c:	e470      	b.n	80018f0 <keccak_absorb.constprop.0>
 800200e:	bf00      	nop

08002010 <shake256_squeezeblocks>:
 8002010:	b189      	cbz	r1, 8002036 <shake256_squeezeblocks+0x26>
 8002012:	b570      	push	{r4, r5, r6, lr}
 8002014:	4605      	mov	r5, r0
 8002016:	4616      	mov	r6, r2
 8002018:	460c      	mov	r4, r1
 800201a:	4630      	mov	r0, r6
 800201c:	f003 fbf0 	bl	8005800 <KeccakF1600_StatePermute>
 8002020:	4629      	mov	r1, r5
 8002022:	2388      	movs	r3, #136	@ 0x88
 8002024:	2200      	movs	r2, #0
 8002026:	4630      	mov	r0, r6
 8002028:	f003 f9ea 	bl	8005400 <KeccakF1600_StateExtractBytes>
 800202c:	3c01      	subs	r4, #1
 800202e:	f105 0588 	add.w	r5, r5, #136	@ 0x88
 8002032:	d1f2      	bne.n	800201a <shake256_squeezeblocks+0xa>
 8002034:	bd70      	pop	{r4, r5, r6, pc}
 8002036:	4770      	bx	lr

08002038 <shake256>:
 8002038:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 800203c:	b0b7      	sub	sp, #220	@ 0xdc
 800203e:	461c      	mov	r4, r3
 8002040:	4606      	mov	r6, r0
 8002042:	460d      	mov	r5, r1
 8002044:	4617      	mov	r7, r2
 8002046:	2100      	movs	r1, #0
 8002048:	22c8      	movs	r2, #200	@ 0xc8
 800204a:	a802      	add	r0, sp, #8
 800204c:	f004 ffa8 	bl	8006fa0 <memset>
 8002050:	f04f 0800 	mov.w	r8, #0
 8002054:	f04f 0900 	mov.w	r9, #0
 8002058:	2c87      	cmp	r4, #135	@ 0x87
 800205a:	e9cd 8934 	strd	r8, r9, [sp, #208]	@ 0xd0
 800205e:	f04f 0200 	mov.w	r2, #0
 8002062:	d91a      	bls.n	800209a <shake256+0x62>
 8002064:	4639      	mov	r1, r7
 8002066:	f1c2 0388 	rsb	r3, r2, #136	@ 0x88
 800206a:	a802      	add	r0, sp, #8
 800206c:	f003 f848 	bl	8005100 <KeccakF1600_StateXORBytes>
 8002070:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
 8002072:	a802      	add	r0, sp, #8
 8002074:	f1a3 0288 	sub.w	r2, r3, #136	@ 0x88
 8002078:	f1c3 0388 	rsb	r3, r3, #136	@ 0x88
 800207c:	4414      	add	r4, r2
 800207e:	441f      	add	r7, r3
 8002080:	e9cd 8934 	strd	r8, r9, [sp, #208]	@ 0xd0
 8002084:	f003 fbbc 	bl	8005800 <KeccakF1600_StatePermute>
 8002088:	e9dd 2334 	ldrd	r2, r3, [sp, #208]	@ 0xd0
 800208c:	1911      	adds	r1, r2, r4
 800208e:	f143 0300 	adc.w	r3, r3, #0
 8002092:	2988      	cmp	r1, #136	@ 0x88
 8002094:	f173 0300 	sbcs.w	r3, r3, #0
 8002098:	d2e4      	bcs.n	8002064 <shake256+0x2c>
 800209a:	4639      	mov	r1, r7
 800209c:	4623      	mov	r3, r4
 800209e:	a802      	add	r0, sp, #8
 80020a0:	f003 f82e 	bl	8005100 <KeccakF1600_StateXORBytes>
 80020a4:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
 80020a6:	18e2      	adds	r2, r4, r3
 80020a8:	9b35      	ldr	r3, [sp, #212]	@ 0xd4
 80020aa:	9234      	str	r2, [sp, #208]	@ 0xd0
 80020ac:	f04f 011f 	mov.w	r1, #31
 80020b0:	f143 0300 	adc.w	r3, r3, #0
 80020b4:	f88d 1007 	strb.w	r1, [sp, #7]
 80020b8:	f1a2 0187 	sub.w	r1, r2, #135	@ 0x87
 80020bc:	4319      	orrs	r1, r3
 80020be:	9335      	str	r3, [sp, #212]	@ 0xd4
 80020c0:	d032      	beq.n	8002128 <shake256+0xf0>
 80020c2:	2301      	movs	r3, #1
 80020c4:	f10d 0107 	add.w	r1, sp, #7
 80020c8:	a802      	add	r0, sp, #8
 80020ca:	f003 f819 	bl	8005100 <KeccakF1600_StateXORBytes>
 80020ce:	2380      	movs	r3, #128	@ 0x80
 80020d0:	f88d 3007 	strb.w	r3, [sp, #7]
 80020d4:	f10d 0107 	add.w	r1, sp, #7
 80020d8:	2301      	movs	r3, #1
 80020da:	2287      	movs	r2, #135	@ 0x87
 80020dc:	a802      	add	r0, sp, #8
 80020de:	f003 f80f 	bl	8005100 <KeccakF1600_StateXORBytes>
 80020e2:	2200      	movs	r2, #0
 80020e4:	2300      	movs	r3, #0
 80020e6:	e9cd 2334 	strd	r2, r3, [sp, #208]	@ 0xd0
 80020ea:	4631      	mov	r1, r6
 80020ec:	2300      	movs	r3, #0
 80020ee:	2288      	movs	r2, #136	@ 0x88
 80020f0:	a802      	add	r0, sp, #8
 80020f2:	f003 f985 	bl	8005400 <KeccakF1600_StateExtractBytes>
 80020f6:	b1a5      	cbz	r5, 8002122 <shake256+0xea>
 80020f8:	2700      	movs	r7, #0
 80020fa:	a802      	add	r0, sp, #8
 80020fc:	f003 fb80 	bl	8005800 <KeccakF1600_StatePermute>
 8002100:	2d88      	cmp	r5, #136	@ 0x88
 8002102:	462c      	mov	r4, r5
 8002104:	bf28      	it	cs
 8002106:	2488      	movcs	r4, #136	@ 0x88
 8002108:	4623      	mov	r3, r4
 800210a:	4631      	mov	r1, r6
 800210c:	2200      	movs	r2, #0
 800210e:	a802      	add	r0, sp, #8
 8002110:	f003 f976 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8002114:	f1c4 0388 	rsb	r3, r4, #136	@ 0x88
 8002118:	1b2d      	subs	r5, r5, r4
 800211a:	e9cd 3734 	strd	r3, r7, [sp, #208]	@ 0xd0
 800211e:	4426      	add	r6, r4
 8002120:	d1eb      	bne.n	80020fa <shake256+0xc2>
 8002122:	b037      	add	sp, #220	@ 0xdc
 8002124:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8002128:	229f      	movs	r2, #159	@ 0x9f
 800212a:	f88d 2007 	strb.w	r2, [sp, #7]
 800212e:	2301      	movs	r3, #1
 8002130:	2287      	movs	r2, #135	@ 0x87
 8002132:	f10d 0107 	add.w	r1, sp, #7
 8002136:	a802      	add	r0, sp, #8
 8002138:	f002 ffe2 	bl	8005100 <KeccakF1600_StateXORBytes>
 800213c:	e7d1      	b.n	80020e2 <shake256+0xaa>
 800213e:	bf00      	nop

08002140 <shake256_ctx_release>:
 8002140:	4770      	bx	lr
 8002142:	bf00      	nop

08002144 <shake256_ctx_clone>:
 8002144:	22c8      	movs	r2, #200	@ 0xc8
 8002146:	f004 bf7d 	b.w	8007044 <memcpy>
 800214a:	bf00      	nop

0800214c <sha3_256>:
 800214c:	e92d 4370 	stmdb	sp!, {r4, r5, r6, r8, r9, lr}
 8002150:	b0b6      	sub	sp, #216	@ 0xd8
 8002152:	4614      	mov	r4, r2
 8002154:	4605      	mov	r5, r0
 8002156:	22c8      	movs	r2, #200	@ 0xc8
 8002158:	460e      	mov	r6, r1
 800215a:	a802      	add	r0, sp, #8
 800215c:	2100      	movs	r1, #0
 800215e:	f004 ff1f 	bl	8006fa0 <memset>
 8002162:	f04f 0800 	mov.w	r8, #0
 8002166:	f04f 0900 	mov.w	r9, #0
 800216a:	2c87      	cmp	r4, #135	@ 0x87
 800216c:	e9cd 8934 	strd	r8, r9, [sp, #208]	@ 0xd0
 8002170:	f04f 0200 	mov.w	r2, #0
 8002174:	d91a      	bls.n	80021ac <sha3_256+0x60>
 8002176:	4631      	mov	r1, r6
 8002178:	f1c2 0388 	rsb	r3, r2, #136	@ 0x88
 800217c:	a802      	add	r0, sp, #8
 800217e:	f002 ffbf 	bl	8005100 <KeccakF1600_StateXORBytes>
 8002182:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
 8002184:	a802      	add	r0, sp, #8
 8002186:	f1a3 0288 	sub.w	r2, r3, #136	@ 0x88
 800218a:	f1c3 0388 	rsb	r3, r3, #136	@ 0x88
 800218e:	4414      	add	r4, r2
 8002190:	441e      	add	r6, r3
 8002192:	e9cd 8934 	strd	r8, r9, [sp, #208]	@ 0xd0
 8002196:	f003 fb33 	bl	8005800 <KeccakF1600_StatePermute>
 800219a:	e9dd 2334 	ldrd	r2, r3, [sp, #208]	@ 0xd0
 800219e:	1911      	adds	r1, r2, r4
 80021a0:	f143 0300 	adc.w	r3, r3, #0
 80021a4:	2988      	cmp	r1, #136	@ 0x88
 80021a6:	f173 0300 	sbcs.w	r3, r3, #0
 80021aa:	d2e4      	bcs.n	8002176 <sha3_256+0x2a>
 80021ac:	4631      	mov	r1, r6
 80021ae:	4623      	mov	r3, r4
 80021b0:	a802      	add	r0, sp, #8
 80021b2:	f002 ffa5 	bl	8005100 <KeccakF1600_StateXORBytes>
 80021b6:	e9dd 2334 	ldrd	r2, r3, [sp, #208]	@ 0xd0
 80021ba:	2106      	movs	r1, #6
 80021bc:	18a2      	adds	r2, r4, r2
 80021be:	f143 0300 	adc.w	r3, r3, #0
 80021c2:	f88d 1007 	strb.w	r1, [sp, #7]
 80021c6:	f1a2 0187 	sub.w	r1, r2, #135	@ 0x87
 80021ca:	4319      	orrs	r1, r3
 80021cc:	e9cd 2334 	strd	r2, r3, [sp, #208]	@ 0xd0
 80021d0:	d025      	beq.n	800221e <sha3_256+0xd2>
 80021d2:	2301      	movs	r3, #1
 80021d4:	f10d 0107 	add.w	r1, sp, #7
 80021d8:	a802      	add	r0, sp, #8
 80021da:	f002 ff91 	bl	8005100 <KeccakF1600_StateXORBytes>
 80021de:	2280      	movs	r2, #128	@ 0x80
 80021e0:	f88d 2007 	strb.w	r2, [sp, #7]
 80021e4:	2301      	movs	r3, #1
 80021e6:	f10d 0107 	add.w	r1, sp, #7
 80021ea:	2287      	movs	r2, #135	@ 0x87
 80021ec:	a802      	add	r0, sp, #8
 80021ee:	f002 ff87 	bl	8005100 <KeccakF1600_StateXORBytes>
 80021f2:	2000      	movs	r0, #0
 80021f4:	2100      	movs	r1, #0
 80021f6:	e9cd 0134 	strd	r0, r1, [sp, #208]	@ 0xd0
 80021fa:	2300      	movs	r3, #0
 80021fc:	4629      	mov	r1, r5
 80021fe:	2288      	movs	r2, #136	@ 0x88
 8002200:	a802      	add	r0, sp, #8
 8002202:	f003 f8fd 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8002206:	a802      	add	r0, sp, #8
 8002208:	f003 fafa 	bl	8005800 <KeccakF1600_StatePermute>
 800220c:	2320      	movs	r3, #32
 800220e:	2200      	movs	r2, #0
 8002210:	4629      	mov	r1, r5
 8002212:	a802      	add	r0, sp, #8
 8002214:	f003 f8f4 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8002218:	b036      	add	sp, #216	@ 0xd8
 800221a:	e8bd 8370 	ldmia.w	sp!, {r4, r5, r6, r8, r9, pc}
 800221e:	2186      	movs	r1, #134	@ 0x86
 8002220:	f88d 1007 	strb.w	r1, [sp, #7]
 8002224:	2301      	movs	r3, #1
 8002226:	2287      	movs	r2, #135	@ 0x87
 8002228:	f10d 0107 	add.w	r1, sp, #7
 800222c:	a802      	add	r0, sp, #8
 800222e:	f002 ff67 	bl	8005100 <KeccakF1600_StateXORBytes>
 8002232:	e7de      	b.n	80021f2 <sha3_256+0xa6>

08002234 <sha3_256_inc_init>:
 8002234:	b510      	push	{r4, lr}
 8002236:	22c8      	movs	r2, #200	@ 0xc8
 8002238:	2100      	movs	r1, #0
 800223a:	4604      	mov	r4, r0
 800223c:	f004 feb0 	bl	8006fa0 <memset>
 8002240:	2200      	movs	r2, #0
 8002242:	2300      	movs	r3, #0
 8002244:	e9c4 2332 	strd	r2, r3, [r4, #200]	@ 0xc8
 8002248:	bd10      	pop	{r4, pc}
 800224a:	bf00      	nop

0800224c <sha3_256_inc_absorb>:
 800224c:	e92d 4370 	stmdb	sp!, {r4, r5, r6, r8, r9, lr}
 8002250:	4615      	mov	r5, r2
 8002252:	4604      	mov	r4, r0
 8002254:	e9d0 2032 	ldrd	r2, r0, [r0, #200]	@ 0xc8
 8002258:	18ab      	adds	r3, r5, r2
 800225a:	f140 0000 	adc.w	r0, r0, #0
 800225e:	2b88      	cmp	r3, #136	@ 0x88
 8002260:	f170 0000 	sbcs.w	r0, r0, #0
 8002264:	460e      	mov	r6, r1
 8002266:	d31f      	bcc.n	80022a8 <sha3_256_inc_absorb+0x5c>
 8002268:	f04f 0800 	mov.w	r8, #0
 800226c:	f04f 0900 	mov.w	r9, #0
 8002270:	f1c2 0388 	rsb	r3, r2, #136	@ 0x88
 8002274:	4631      	mov	r1, r6
 8002276:	4620      	mov	r0, r4
 8002278:	f002 ff42 	bl	8005100 <KeccakF1600_StateXORBytes>
 800227c:	f8d4 30c8 	ldr.w	r3, [r4, #200]	@ 0xc8
 8002280:	4620      	mov	r0, r4
 8002282:	f1a3 0288 	sub.w	r2, r3, #136	@ 0x88
 8002286:	e9c4 8932 	strd	r8, r9, [r4, #200]	@ 0xc8
 800228a:	f1c3 0388 	rsb	r3, r3, #136	@ 0x88
 800228e:	4415      	add	r5, r2
 8002290:	441e      	add	r6, r3
 8002292:	f003 fab5 	bl	8005800 <KeccakF1600_StatePermute>
 8002296:	e9d4 2032 	ldrd	r2, r0, [r4, #200]	@ 0xc8
 800229a:	1953      	adds	r3, r2, r5
 800229c:	f140 0000 	adc.w	r0, r0, #0
 80022a0:	2b88      	cmp	r3, #136	@ 0x88
 80022a2:	f170 0000 	sbcs.w	r0, r0, #0
 80022a6:	d2e3      	bcs.n	8002270 <sha3_256_inc_absorb+0x24>
 80022a8:	462b      	mov	r3, r5
 80022aa:	4631      	mov	r1, r6
 80022ac:	4620      	mov	r0, r4
 80022ae:	f002 ff27 	bl	8005100 <KeccakF1600_StateXORBytes>
 80022b2:	e9d4 3232 	ldrd	r3, r2, [r4, #200]	@ 0xc8
 80022b6:	195b      	adds	r3, r3, r5
 80022b8:	f142 0200 	adc.w	r2, r2, #0
 80022bc:	e9c4 3232 	strd	r3, r2, [r4, #200]	@ 0xc8
 80022c0:	e8bd 8370 	ldmia.w	sp!, {r4, r5, r6, r8, r9, pc}

080022c4 <sha3_256_inc_finalize>:
 80022c4:	b570      	push	{r4, r5, r6, lr}
 80022c6:	460e      	mov	r6, r1
 80022c8:	e9d1 2132 	ldrd	r2, r1, [r1, #200]	@ 0xc8
 80022cc:	b0a2      	sub	sp, #136	@ 0x88
 80022ce:	2306      	movs	r3, #6
 80022d0:	f88d 3000 	strb.w	r3, [sp]
 80022d4:	f1a2 0387 	sub.w	r3, r2, #135	@ 0x87
 80022d8:	430b      	orrs	r3, r1
 80022da:	4605      	mov	r5, r0
 80022dc:	466c      	mov	r4, sp
 80022de:	d029      	beq.n	8002334 <sha3_256_inc_finalize+0x70>
 80022e0:	2301      	movs	r3, #1
 80022e2:	4621      	mov	r1, r4
 80022e4:	4630      	mov	r0, r6
 80022e6:	f002 ff0b 	bl	8005100 <KeccakF1600_StateXORBytes>
 80022ea:	2280      	movs	r2, #128	@ 0x80
 80022ec:	4621      	mov	r1, r4
 80022ee:	f88d 2000 	strb.w	r2, [sp]
 80022f2:	4630      	mov	r0, r6
 80022f4:	2301      	movs	r3, #1
 80022f6:	2287      	movs	r2, #135	@ 0x87
 80022f8:	f002 ff02 	bl	8005100 <KeccakF1600_StateXORBytes>
 80022fc:	2200      	movs	r2, #0
 80022fe:	2300      	movs	r3, #0
 8002300:	e9c6 2332 	strd	r2, r3, [r6, #200]	@ 0xc8
 8002304:	4630      	mov	r0, r6
 8002306:	f003 fa7b 	bl	8005800 <KeccakF1600_StatePermute>
 800230a:	4630      	mov	r0, r6
 800230c:	4621      	mov	r1, r4
 800230e:	2388      	movs	r3, #136	@ 0x88
 8002310:	2200      	movs	r2, #0
 8002312:	f003 f875 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8002316:	46a4      	mov	ip, r4
 8002318:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 800231c:	6028      	str	r0, [r5, #0]
 800231e:	6069      	str	r1, [r5, #4]
 8002320:	60aa      	str	r2, [r5, #8]
 8002322:	60eb      	str	r3, [r5, #12]
 8002324:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 8002328:	6128      	str	r0, [r5, #16]
 800232a:	6169      	str	r1, [r5, #20]
 800232c:	61aa      	str	r2, [r5, #24]
 800232e:	61eb      	str	r3, [r5, #28]
 8002330:	b022      	add	sp, #136	@ 0x88
 8002332:	bd70      	pop	{r4, r5, r6, pc}
 8002334:	2286      	movs	r2, #134	@ 0x86
 8002336:	e7d9      	b.n	80022ec <sha3_256_inc_finalize+0x28>

08002338 <sha3_256_inc_ctx_clone>:
 8002338:	22d0      	movs	r2, #208	@ 0xd0
 800233a:	f004 be83 	b.w	8007044 <memcpy>
 800233e:	bf00      	nop

08002340 <sha3_256_inc_ctx_release>:
 8002340:	4770      	bx	lr
 8002342:	bf00      	nop

08002344 <sha3_384_inc_init>:
 8002344:	b510      	push	{r4, lr}
 8002346:	22c8      	movs	r2, #200	@ 0xc8
 8002348:	2100      	movs	r1, #0
 800234a:	4604      	mov	r4, r0
 800234c:	f004 fe28 	bl	8006fa0 <memset>
 8002350:	2200      	movs	r2, #0
 8002352:	2300      	movs	r3, #0
 8002354:	e9c4 2332 	strd	r2, r3, [r4, #200]	@ 0xc8
 8002358:	bd10      	pop	{r4, pc}
 800235a:	bf00      	nop

0800235c <sha3_384_inc_absorb>:
 800235c:	e92d 4370 	stmdb	sp!, {r4, r5, r6, r8, r9, lr}
 8002360:	4615      	mov	r5, r2
 8002362:	4604      	mov	r4, r0
 8002364:	e9d0 2032 	ldrd	r2, r0, [r0, #200]	@ 0xc8
 8002368:	18ab      	adds	r3, r5, r2
 800236a:	f140 0000 	adc.w	r0, r0, #0
 800236e:	2b68      	cmp	r3, #104	@ 0x68
 8002370:	f170 0000 	sbcs.w	r0, r0, #0
 8002374:	460e      	mov	r6, r1
 8002376:	d31f      	bcc.n	80023b8 <sha3_384_inc_absorb+0x5c>
 8002378:	f04f 0800 	mov.w	r8, #0
 800237c:	f04f 0900 	mov.w	r9, #0
 8002380:	f1c2 0368 	rsb	r3, r2, #104	@ 0x68
 8002384:	4631      	mov	r1, r6
 8002386:	4620      	mov	r0, r4
 8002388:	f002 feba 	bl	8005100 <KeccakF1600_StateXORBytes>
 800238c:	f8d4 30c8 	ldr.w	r3, [r4, #200]	@ 0xc8
 8002390:	4620      	mov	r0, r4
 8002392:	f1a3 0268 	sub.w	r2, r3, #104	@ 0x68
 8002396:	e9c4 8932 	strd	r8, r9, [r4, #200]	@ 0xc8
 800239a:	f1c3 0368 	rsb	r3, r3, #104	@ 0x68
 800239e:	4415      	add	r5, r2
 80023a0:	441e      	add	r6, r3
 80023a2:	f003 fa2d 	bl	8005800 <KeccakF1600_StatePermute>
 80023a6:	e9d4 2032 	ldrd	r2, r0, [r4, #200]	@ 0xc8
 80023aa:	1953      	adds	r3, r2, r5
 80023ac:	f140 0000 	adc.w	r0, r0, #0
 80023b0:	2b68      	cmp	r3, #104	@ 0x68
 80023b2:	f170 0000 	sbcs.w	r0, r0, #0
 80023b6:	d2e3      	bcs.n	8002380 <sha3_384_inc_absorb+0x24>
 80023b8:	462b      	mov	r3, r5
 80023ba:	4631      	mov	r1, r6
 80023bc:	4620      	mov	r0, r4
 80023be:	f002 fe9f 	bl	8005100 <KeccakF1600_StateXORBytes>
 80023c2:	e9d4 3232 	ldrd	r3, r2, [r4, #200]	@ 0xc8
 80023c6:	195b      	adds	r3, r3, r5
 80023c8:	f142 0200 	adc.w	r2, r2, #0
 80023cc:	e9c4 3232 	strd	r3, r2, [r4, #200]	@ 0xc8
 80023d0:	e8bd 8370 	ldmia.w	sp!, {r4, r5, r6, r8, r9, pc}

080023d4 <sha3_384_inc_finalize>:
 80023d4:	b570      	push	{r4, r5, r6, lr}
 80023d6:	460e      	mov	r6, r1
 80023d8:	e9d1 2132 	ldrd	r2, r1, [r1, #200]	@ 0xc8
 80023dc:	b09a      	sub	sp, #104	@ 0x68
 80023de:	2306      	movs	r3, #6
 80023e0:	f88d 3000 	strb.w	r3, [sp]
 80023e4:	f1a2 0367 	sub.w	r3, r2, #103	@ 0x67
 80023e8:	430b      	orrs	r3, r1
 80023ea:	4604      	mov	r4, r0
 80023ec:	466d      	mov	r5, sp
 80023ee:	d02e      	beq.n	800244e <sha3_384_inc_finalize+0x7a>
 80023f0:	2301      	movs	r3, #1
 80023f2:	4629      	mov	r1, r5
 80023f4:	4630      	mov	r0, r6
 80023f6:	f002 fe83 	bl	8005100 <KeccakF1600_StateXORBytes>
 80023fa:	2280      	movs	r2, #128	@ 0x80
 80023fc:	4629      	mov	r1, r5
 80023fe:	2301      	movs	r3, #1
 8002400:	f88d 2000 	strb.w	r2, [sp]
 8002404:	4630      	mov	r0, r6
 8002406:	2267      	movs	r2, #103	@ 0x67
 8002408:	f002 fe7a 	bl	8005100 <KeccakF1600_StateXORBytes>
 800240c:	2200      	movs	r2, #0
 800240e:	2300      	movs	r3, #0
 8002410:	e9c6 2332 	strd	r2, r3, [r6, #200]	@ 0xc8
 8002414:	4630      	mov	r0, r6
 8002416:	f003 f9f3 	bl	8005800 <KeccakF1600_StatePermute>
 800241a:	2368      	movs	r3, #104	@ 0x68
 800241c:	2200      	movs	r2, #0
 800241e:	4630      	mov	r0, r6
 8002420:	4629      	mov	r1, r5
 8002422:	f002 ffed 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8002426:	46a6      	mov	lr, r4
 8002428:	ac0c      	add	r4, sp, #48	@ 0x30
 800242a:	46ac      	mov	ip, r5
 800242c:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 8002430:	45a4      	cmp	ip, r4
 8002432:	f10e 0e10 	add.w	lr, lr, #16
 8002436:	4665      	mov	r5, ip
 8002438:	f84e 0c10 	str.w	r0, [lr, #-16]
 800243c:	f84e 1c0c 	str.w	r1, [lr, #-12]
 8002440:	f84e 2c08 	str.w	r2, [lr, #-8]
 8002444:	f84e 3c04 	str.w	r3, [lr, #-4]
 8002448:	d1ef      	bne.n	800242a <sha3_384_inc_finalize+0x56>
 800244a:	b01a      	add	sp, #104	@ 0x68
 800244c:	bd70      	pop	{r4, r5, r6, pc}
 800244e:	2286      	movs	r2, #134	@ 0x86
 8002450:	e7d4      	b.n	80023fc <sha3_384_inc_finalize+0x28>
 8002452:	bf00      	nop

08002454 <sha3_384_inc_ctx_clone>:
 8002454:	22d0      	movs	r2, #208	@ 0xd0
 8002456:	f004 bdf5 	b.w	8007044 <memcpy>
 800245a:	bf00      	nop

0800245c <sha3_384_inc_ctx_release>:
 800245c:	4770      	bx	lr
 800245e:	bf00      	nop

08002460 <sha3_384>:
 8002460:	e92d 4370 	stmdb	sp!, {r4, r5, r6, r8, r9, lr}
 8002464:	b0b6      	sub	sp, #216	@ 0xd8
 8002466:	4614      	mov	r4, r2
 8002468:	4605      	mov	r5, r0
 800246a:	22c8      	movs	r2, #200	@ 0xc8
 800246c:	460e      	mov	r6, r1
 800246e:	a802      	add	r0, sp, #8
 8002470:	2100      	movs	r1, #0
 8002472:	f004 fd95 	bl	8006fa0 <memset>
 8002476:	f04f 0800 	mov.w	r8, #0
 800247a:	f04f 0900 	mov.w	r9, #0
 800247e:	2c67      	cmp	r4, #103	@ 0x67
 8002480:	e9cd 8934 	strd	r8, r9, [sp, #208]	@ 0xd0
 8002484:	f04f 0200 	mov.w	r2, #0
 8002488:	d91a      	bls.n	80024c0 <sha3_384+0x60>
 800248a:	4631      	mov	r1, r6
 800248c:	f1c2 0368 	rsb	r3, r2, #104	@ 0x68
 8002490:	a802      	add	r0, sp, #8
 8002492:	f002 fe35 	bl	8005100 <KeccakF1600_StateXORBytes>
 8002496:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
 8002498:	a802      	add	r0, sp, #8
 800249a:	f1a3 0268 	sub.w	r2, r3, #104	@ 0x68
 800249e:	f1c3 0368 	rsb	r3, r3, #104	@ 0x68
 80024a2:	4414      	add	r4, r2
 80024a4:	441e      	add	r6, r3
 80024a6:	e9cd 8934 	strd	r8, r9, [sp, #208]	@ 0xd0
 80024aa:	f003 f9a9 	bl	8005800 <KeccakF1600_StatePermute>
 80024ae:	e9dd 2334 	ldrd	r2, r3, [sp, #208]	@ 0xd0
 80024b2:	1911      	adds	r1, r2, r4
 80024b4:	f143 0300 	adc.w	r3, r3, #0
 80024b8:	2968      	cmp	r1, #104	@ 0x68
 80024ba:	f173 0300 	sbcs.w	r3, r3, #0
 80024be:	d2e4      	bcs.n	800248a <sha3_384+0x2a>
 80024c0:	4631      	mov	r1, r6
 80024c2:	4623      	mov	r3, r4
 80024c4:	a802      	add	r0, sp, #8
 80024c6:	f002 fe1b 	bl	8005100 <KeccakF1600_StateXORBytes>
 80024ca:	e9dd 2334 	ldrd	r2, r3, [sp, #208]	@ 0xd0
 80024ce:	2106      	movs	r1, #6
 80024d0:	18a2      	adds	r2, r4, r2
 80024d2:	f143 0300 	adc.w	r3, r3, #0
 80024d6:	f88d 1007 	strb.w	r1, [sp, #7]
 80024da:	f1a2 0167 	sub.w	r1, r2, #103	@ 0x67
 80024de:	4319      	orrs	r1, r3
 80024e0:	e9cd 2334 	strd	r2, r3, [sp, #208]	@ 0xd0
 80024e4:	d025      	beq.n	8002532 <sha3_384+0xd2>
 80024e6:	2301      	movs	r3, #1
 80024e8:	f10d 0107 	add.w	r1, sp, #7
 80024ec:	a802      	add	r0, sp, #8
 80024ee:	f002 fe07 	bl	8005100 <KeccakF1600_StateXORBytes>
 80024f2:	2280      	movs	r2, #128	@ 0x80
 80024f4:	f88d 2007 	strb.w	r2, [sp, #7]
 80024f8:	2301      	movs	r3, #1
 80024fa:	f10d 0107 	add.w	r1, sp, #7
 80024fe:	2267      	movs	r2, #103	@ 0x67
 8002500:	a802      	add	r0, sp, #8
 8002502:	f002 fdfd 	bl	8005100 <KeccakF1600_StateXORBytes>
 8002506:	2000      	movs	r0, #0
 8002508:	2100      	movs	r1, #0
 800250a:	e9cd 0134 	strd	r0, r1, [sp, #208]	@ 0xd0
 800250e:	2300      	movs	r3, #0
 8002510:	4629      	mov	r1, r5
 8002512:	2268      	movs	r2, #104	@ 0x68
 8002514:	a802      	add	r0, sp, #8
 8002516:	f002 ff73 	bl	8005400 <KeccakF1600_StateExtractBytes>
 800251a:	a802      	add	r0, sp, #8
 800251c:	f003 f970 	bl	8005800 <KeccakF1600_StatePermute>
 8002520:	2330      	movs	r3, #48	@ 0x30
 8002522:	2200      	movs	r2, #0
 8002524:	4629      	mov	r1, r5
 8002526:	a802      	add	r0, sp, #8
 8002528:	f002 ff6a 	bl	8005400 <KeccakF1600_StateExtractBytes>
 800252c:	b036      	add	sp, #216	@ 0xd8
 800252e:	e8bd 8370 	ldmia.w	sp!, {r4, r5, r6, r8, r9, pc}
 8002532:	2186      	movs	r1, #134	@ 0x86
 8002534:	f88d 1007 	strb.w	r1, [sp, #7]
 8002538:	2301      	movs	r3, #1
 800253a:	2267      	movs	r2, #103	@ 0x67
 800253c:	f10d 0107 	add.w	r1, sp, #7
 8002540:	a802      	add	r0, sp, #8
 8002542:	f002 fddd 	bl	8005100 <KeccakF1600_StateXORBytes>
 8002546:	e7de      	b.n	8002506 <sha3_384+0xa6>

08002548 <sha3_512>:
 8002548:	e92d 4370 	stmdb	sp!, {r4, r5, r6, r8, r9, lr}
 800254c:	b0b6      	sub	sp, #216	@ 0xd8
 800254e:	4614      	mov	r4, r2
 8002550:	4605      	mov	r5, r0
 8002552:	22c8      	movs	r2, #200	@ 0xc8
 8002554:	460e      	mov	r6, r1
 8002556:	a802      	add	r0, sp, #8
 8002558:	2100      	movs	r1, #0
 800255a:	f004 fd21 	bl	8006fa0 <memset>
 800255e:	f04f 0800 	mov.w	r8, #0
 8002562:	f04f 0900 	mov.w	r9, #0
 8002566:	2c47      	cmp	r4, #71	@ 0x47
 8002568:	e9cd 8934 	strd	r8, r9, [sp, #208]	@ 0xd0
 800256c:	f04f 0200 	mov.w	r2, #0
 8002570:	d91a      	bls.n	80025a8 <sha3_512+0x60>
 8002572:	4631      	mov	r1, r6
 8002574:	f1c2 0348 	rsb	r3, r2, #72	@ 0x48
 8002578:	a802      	add	r0, sp, #8
 800257a:	f002 fdc1 	bl	8005100 <KeccakF1600_StateXORBytes>
 800257e:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
 8002580:	a802      	add	r0, sp, #8
 8002582:	f1a3 0248 	sub.w	r2, r3, #72	@ 0x48
 8002586:	f1c3 0348 	rsb	r3, r3, #72	@ 0x48
 800258a:	4414      	add	r4, r2
 800258c:	441e      	add	r6, r3
 800258e:	e9cd 8934 	strd	r8, r9, [sp, #208]	@ 0xd0
 8002592:	f003 f935 	bl	8005800 <KeccakF1600_StatePermute>
 8002596:	e9dd 2334 	ldrd	r2, r3, [sp, #208]	@ 0xd0
 800259a:	1911      	adds	r1, r2, r4
 800259c:	f143 0300 	adc.w	r3, r3, #0
 80025a0:	2948      	cmp	r1, #72	@ 0x48
 80025a2:	f173 0300 	sbcs.w	r3, r3, #0
 80025a6:	d2e4      	bcs.n	8002572 <sha3_512+0x2a>
 80025a8:	4631      	mov	r1, r6
 80025aa:	4623      	mov	r3, r4
 80025ac:	a802      	add	r0, sp, #8
 80025ae:	f002 fda7 	bl	8005100 <KeccakF1600_StateXORBytes>
 80025b2:	e9dd 2334 	ldrd	r2, r3, [sp, #208]	@ 0xd0
 80025b6:	2106      	movs	r1, #6
 80025b8:	18a2      	adds	r2, r4, r2
 80025ba:	f143 0300 	adc.w	r3, r3, #0
 80025be:	f88d 1007 	strb.w	r1, [sp, #7]
 80025c2:	f1a2 0147 	sub.w	r1, r2, #71	@ 0x47
 80025c6:	4319      	orrs	r1, r3
 80025c8:	e9cd 2334 	strd	r2, r3, [sp, #208]	@ 0xd0
 80025cc:	d025      	beq.n	800261a <sha3_512+0xd2>
 80025ce:	2301      	movs	r3, #1
 80025d0:	f10d 0107 	add.w	r1, sp, #7
 80025d4:	a802      	add	r0, sp, #8
 80025d6:	f002 fd93 	bl	8005100 <KeccakF1600_StateXORBytes>
 80025da:	2280      	movs	r2, #128	@ 0x80
 80025dc:	f88d 2007 	strb.w	r2, [sp, #7]
 80025e0:	2301      	movs	r3, #1
 80025e2:	f10d 0107 	add.w	r1, sp, #7
 80025e6:	2247      	movs	r2, #71	@ 0x47
 80025e8:	a802      	add	r0, sp, #8
 80025ea:	f002 fd89 	bl	8005100 <KeccakF1600_StateXORBytes>
 80025ee:	2000      	movs	r0, #0
 80025f0:	2100      	movs	r1, #0
 80025f2:	e9cd 0134 	strd	r0, r1, [sp, #208]	@ 0xd0
 80025f6:	2300      	movs	r3, #0
 80025f8:	4629      	mov	r1, r5
 80025fa:	2248      	movs	r2, #72	@ 0x48
 80025fc:	a802      	add	r0, sp, #8
 80025fe:	f002 feff 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8002602:	a802      	add	r0, sp, #8
 8002604:	f003 f8fc 	bl	8005800 <KeccakF1600_StatePermute>
 8002608:	2340      	movs	r3, #64	@ 0x40
 800260a:	2200      	movs	r2, #0
 800260c:	4629      	mov	r1, r5
 800260e:	a802      	add	r0, sp, #8
 8002610:	f002 fef6 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8002614:	b036      	add	sp, #216	@ 0xd8
 8002616:	e8bd 8370 	ldmia.w	sp!, {r4, r5, r6, r8, r9, pc}
 800261a:	2186      	movs	r1, #134	@ 0x86
 800261c:	f88d 1007 	strb.w	r1, [sp, #7]
 8002620:	2301      	movs	r3, #1
 8002622:	2247      	movs	r2, #71	@ 0x47
 8002624:	f10d 0107 	add.w	r1, sp, #7
 8002628:	a802      	add	r0, sp, #8
 800262a:	f002 fd69 	bl	8005100 <KeccakF1600_StateXORBytes>
 800262e:	e7de      	b.n	80025ee <sha3_512+0xa6>

08002630 <sha3_512_inc_init>:
 8002630:	b510      	push	{r4, lr}
 8002632:	22c8      	movs	r2, #200	@ 0xc8
 8002634:	2100      	movs	r1, #0
 8002636:	4604      	mov	r4, r0
 8002638:	f004 fcb2 	bl	8006fa0 <memset>
 800263c:	2200      	movs	r2, #0
 800263e:	2300      	movs	r3, #0
 8002640:	e9c4 2332 	strd	r2, r3, [r4, #200]	@ 0xc8
 8002644:	bd10      	pop	{r4, pc}
 8002646:	bf00      	nop

08002648 <sha3_512_inc_absorb>:
 8002648:	e92d 4370 	stmdb	sp!, {r4, r5, r6, r8, r9, lr}
 800264c:	4615      	mov	r5, r2
 800264e:	4604      	mov	r4, r0
 8002650:	e9d0 2032 	ldrd	r2, r0, [r0, #200]	@ 0xc8
 8002654:	18ab      	adds	r3, r5, r2
 8002656:	f140 0000 	adc.w	r0, r0, #0
 800265a:	2b48      	cmp	r3, #72	@ 0x48
 800265c:	f170 0000 	sbcs.w	r0, r0, #0
 8002660:	460e      	mov	r6, r1
 8002662:	d31f      	bcc.n	80026a4 <sha3_512_inc_absorb+0x5c>
 8002664:	f04f 0800 	mov.w	r8, #0
 8002668:	f04f 0900 	mov.w	r9, #0
 800266c:	f1c2 0348 	rsb	r3, r2, #72	@ 0x48
 8002670:	4631      	mov	r1, r6
 8002672:	4620      	mov	r0, r4
 8002674:	f002 fd44 	bl	8005100 <KeccakF1600_StateXORBytes>
 8002678:	f8d4 30c8 	ldr.w	r3, [r4, #200]	@ 0xc8
 800267c:	4620      	mov	r0, r4
 800267e:	f1a3 0248 	sub.w	r2, r3, #72	@ 0x48
 8002682:	e9c4 8932 	strd	r8, r9, [r4, #200]	@ 0xc8
 8002686:	f1c3 0348 	rsb	r3, r3, #72	@ 0x48
 800268a:	4415      	add	r5, r2
 800268c:	441e      	add	r6, r3
 800268e:	f003 f8b7 	bl	8005800 <KeccakF1600_StatePermute>
 8002692:	e9d4 2032 	ldrd	r2, r0, [r4, #200]	@ 0xc8
 8002696:	1953      	adds	r3, r2, r5
 8002698:	f140 0000 	adc.w	r0, r0, #0
 800269c:	2b48      	cmp	r3, #72	@ 0x48
 800269e:	f170 0000 	sbcs.w	r0, r0, #0
 80026a2:	d2e3      	bcs.n	800266c <sha3_512_inc_absorb+0x24>
 80026a4:	462b      	mov	r3, r5
 80026a6:	4631      	mov	r1, r6
 80026a8:	4620      	mov	r0, r4
 80026aa:	f002 fd29 	bl	8005100 <KeccakF1600_StateXORBytes>
 80026ae:	e9d4 3232 	ldrd	r3, r2, [r4, #200]	@ 0xc8
 80026b2:	195b      	adds	r3, r3, r5
 80026b4:	f142 0200 	adc.w	r2, r2, #0
 80026b8:	e9c4 3232 	strd	r3, r2, [r4, #200]	@ 0xc8
 80026bc:	e8bd 8370 	ldmia.w	sp!, {r4, r5, r6, r8, r9, pc}

080026c0 <sha3_512_inc_finalize>:
 80026c0:	b570      	push	{r4, r5, r6, lr}
 80026c2:	460e      	mov	r6, r1
 80026c4:	e9d1 2132 	ldrd	r2, r1, [r1, #200]	@ 0xc8
 80026c8:	b092      	sub	sp, #72	@ 0x48
 80026ca:	2306      	movs	r3, #6
 80026cc:	f88d 3000 	strb.w	r3, [sp]
 80026d0:	f1a2 0347 	sub.w	r3, r2, #71	@ 0x47
 80026d4:	430b      	orrs	r3, r1
 80026d6:	4604      	mov	r4, r0
 80026d8:	466d      	mov	r5, sp
 80026da:	d02e      	beq.n	800273a <sha3_512_inc_finalize+0x7a>
 80026dc:	2301      	movs	r3, #1
 80026de:	4629      	mov	r1, r5
 80026e0:	4630      	mov	r0, r6
 80026e2:	f002 fd0d 	bl	8005100 <KeccakF1600_StateXORBytes>
 80026e6:	2280      	movs	r2, #128	@ 0x80
 80026e8:	4629      	mov	r1, r5
 80026ea:	2301      	movs	r3, #1
 80026ec:	f88d 2000 	strb.w	r2, [sp]
 80026f0:	4630      	mov	r0, r6
 80026f2:	2247      	movs	r2, #71	@ 0x47
 80026f4:	f002 fd04 	bl	8005100 <KeccakF1600_StateXORBytes>
 80026f8:	2200      	movs	r2, #0
 80026fa:	2300      	movs	r3, #0
 80026fc:	e9c6 2332 	strd	r2, r3, [r6, #200]	@ 0xc8
 8002700:	4630      	mov	r0, r6
 8002702:	f003 f87d 	bl	8005800 <KeccakF1600_StatePermute>
 8002706:	2348      	movs	r3, #72	@ 0x48
 8002708:	2200      	movs	r2, #0
 800270a:	4630      	mov	r0, r6
 800270c:	4629      	mov	r1, r5
 800270e:	f002 fe77 	bl	8005400 <KeccakF1600_StateExtractBytes>
 8002712:	46a6      	mov	lr, r4
 8002714:	ac10      	add	r4, sp, #64	@ 0x40
 8002716:	46ac      	mov	ip, r5
 8002718:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 800271c:	45a4      	cmp	ip, r4
 800271e:	f10e 0e10 	add.w	lr, lr, #16
 8002722:	4665      	mov	r5, ip
 8002724:	f84e 0c10 	str.w	r0, [lr, #-16]
 8002728:	f84e 1c0c 	str.w	r1, [lr, #-12]
 800272c:	f84e 2c08 	str.w	r2, [lr, #-8]
 8002730:	f84e 3c04 	str.w	r3, [lr, #-4]
 8002734:	d1ef      	bne.n	8002716 <sha3_512_inc_finalize+0x56>
 8002736:	b012      	add	sp, #72	@ 0x48
 8002738:	bd70      	pop	{r4, r5, r6, pc}
 800273a:	2286      	movs	r2, #134	@ 0x86
 800273c:	e7d4      	b.n	80026e8 <sha3_512_inc_finalize+0x28>
 800273e:	bf00      	nop

08002740 <sha3_512_inc_ctx_clone>:
 8002740:	22d0      	movs	r2, #208	@ 0xd0
 8002742:	f004 bc7f 	b.w	8007044 <memcpy>
 8002746:	bf00      	nop

08002748 <sha3_512_inc_ctx_release>:
 8002748:	4770      	bx	lr
 800274a:	bf00      	nop

0800274c <cshake256_simple_absorb>:
 800274c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800274e:	460f      	mov	r7, r1
 8002750:	b083      	sub	sp, #12
 8002752:	4615      	mov	r5, r2
 8002754:	2100      	movs	r1, #0
 8002756:	22c8      	movs	r2, #200	@ 0xc8
 8002758:	4604      	mov	r4, r0
 800275a:	461e      	mov	r6, r3
 800275c:	f004 fc20 	bl	8006fa0 <memset>
 8002760:	4b0c      	ldr	r3, [pc, #48]	@ (8002794 <cshake256_simple_absorb+0x48>)
 8002762:	9300      	str	r3, [sp, #0]
 8002764:	f241 0301 	movw	r3, #4097	@ 0x1001
 8002768:	4669      	mov	r1, sp
 800276a:	f8ad 3004 	strh.w	r3, [sp, #4]
 800276e:	2200      	movs	r2, #0
 8002770:	2308      	movs	r3, #8
 8002772:	4620      	mov	r0, r4
 8002774:	f8ad 7006 	strh.w	r7, [sp, #6]
 8002778:	f002 fcc2 	bl	8005100 <KeccakF1600_StateXORBytes>
 800277c:	4620      	mov	r0, r4
 800277e:	f003 f83f 	bl	8005800 <KeccakF1600_StatePermute>
 8002782:	2304      	movs	r3, #4
 8002784:	4632      	mov	r2, r6
 8002786:	4629      	mov	r1, r5
 8002788:	4620      	mov	r0, r4
 800278a:	f7ff f8b1 	bl	80018f0 <keccak_absorb.constprop.0>
 800278e:	b003      	add	sp, #12
 8002790:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8002792:	bf00      	nop
 8002794:	00018801 	.word	0x00018801

08002798 <cshake256_simple_squeezeblocks>:
 8002798:	b189      	cbz	r1, 80027be <cshake256_simple_squeezeblocks+0x26>
 800279a:	b570      	push	{r4, r5, r6, lr}
 800279c:	4605      	mov	r5, r0
 800279e:	4616      	mov	r6, r2
 80027a0:	460c      	mov	r4, r1
 80027a2:	4630      	mov	r0, r6
 80027a4:	f003 f82c 	bl	8005800 <KeccakF1600_StatePermute>
 80027a8:	4629      	mov	r1, r5
 80027aa:	2388      	movs	r3, #136	@ 0x88
 80027ac:	2200      	movs	r2, #0
 80027ae:	4630      	mov	r0, r6
 80027b0:	f002 fe26 	bl	8005400 <KeccakF1600_StateExtractBytes>
 80027b4:	3c01      	subs	r4, #1
 80027b6:	f105 0588 	add.w	r5, r5, #136	@ 0x88
 80027ba:	d1f2      	bne.n	80027a2 <cshake256_simple_squeezeblocks+0xa>
 80027bc:	bd70      	pop	{r4, r5, r6, pc}
 80027be:	4770      	bx	lr

080027c0 <cshake256_simple>:
 80027c0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
 80027c4:	b0b8      	sub	sp, #224	@ 0xe0
 80027c6:	4614      	mov	r4, r2
 80027c8:	4607      	mov	r7, r0
 80027ca:	22c8      	movs	r2, #200	@ 0xc8
 80027cc:	460e      	mov	r6, r1
 80027ce:	a804      	add	r0, sp, #16
 80027d0:	2100      	movs	r1, #0
 80027d2:	4698      	mov	r8, r3
 80027d4:	9d40      	ldr	r5, [sp, #256]	@ 0x100
 80027d6:	f004 fbe3 	bl	8006fa0 <memset>
 80027da:	4b42      	ldr	r3, [pc, #264]	@ (80028e4 <cshake256_simple+0x124>)
 80027dc:	9302      	str	r3, [sp, #8]
 80027de:	f241 0301 	movw	r3, #4097	@ 0x1001
 80027e2:	f8ad 300c 	strh.w	r3, [sp, #12]
 80027e6:	2308      	movs	r3, #8
 80027e8:	a804      	add	r0, sp, #16
 80027ea:	2200      	movs	r2, #0
 80027ec:	eb0d 0103 	add.w	r1, sp, r3
 80027f0:	f04f 0a00 	mov.w	sl, #0
 80027f4:	f04f 0b00 	mov.w	fp, #0
 80027f8:	e9cd ab36 	strd	sl, fp, [sp, #216]	@ 0xd8
 80027fc:	f8ad 400e 	strh.w	r4, [sp, #14]
 8002800:	f002 fc7e 	bl	8005100 <KeccakF1600_StateXORBytes>
 8002804:	a804      	add	r0, sp, #16
 8002806:	e00f      	b.n	8002828 <cshake256_simple+0x68>
 8002808:	f1c2 0388 	rsb	r3, r2, #136	@ 0x88
 800280c:	4641      	mov	r1, r8
 800280e:	a804      	add	r0, sp, #16
 8002810:	f002 fc76 	bl	8005100 <KeccakF1600_StateXORBytes>
 8002814:	9b36      	ldr	r3, [sp, #216]	@ 0xd8
 8002816:	e9cd ab36 	strd	sl, fp, [sp, #216]	@ 0xd8
 800281a:	f1a3 0288 	sub.w	r2, r3, #136	@ 0x88
 800281e:	f1c3 0388 	rsb	r3, r3, #136	@ 0x88
 8002822:	a804      	add	r0, sp, #16
 8002824:	4415      	add	r5, r2
 8002826:	4498      	add	r8, r3
 8002828:	f002 ffea 	bl	8005800 <KeccakF1600_StatePermute>
 800282c:	e9dd 2436 	ldrd	r2, r4, [sp, #216]	@ 0xd8
 8002830:	1953      	adds	r3, r2, r5
 8002832:	f144 0400 	adc.w	r4, r4, #0
 8002836:	2b88      	cmp	r3, #136	@ 0x88
 8002838:	f174 0400 	sbcs.w	r4, r4, #0
 800283c:	d2e4      	bcs.n	8002808 <cshake256_simple+0x48>
 800283e:	4641      	mov	r1, r8
 8002840:	462b      	mov	r3, r5
 8002842:	a804      	add	r0, sp, #16
 8002844:	f002 fc5c 	bl	8005100 <KeccakF1600_StateXORBytes>
 8002848:	9b36      	ldr	r3, [sp, #216]	@ 0xd8
 800284a:	18ea      	adds	r2, r5, r3
 800284c:	9b37      	ldr	r3, [sp, #220]	@ 0xdc
 800284e:	9236      	str	r2, [sp, #216]	@ 0xd8
 8002850:	f04f 0104 	mov.w	r1, #4
 8002854:	f143 0300 	adc.w	r3, r3, #0
 8002858:	f88d 1007 	strb.w	r1, [sp, #7]
 800285c:	f1a2 0187 	sub.w	r1, r2, #135	@ 0x87
 8002860:	4319      	orrs	r1, r3
 8002862:	9337      	str	r3, [sp, #220]	@ 0xdc
 8002864:	d032      	beq.n	80028cc <cshake256_simple+0x10c>
 8002866:	2301      	movs	r3, #1
 8002868:	f10d 0107 	add.w	r1, sp, #7
 800286c:	a804      	add	r0, sp, #16
 800286e:	f002 fc47 	bl	8005100 <KeccakF1600_StateXORBytes>
 8002872:	2380      	movs	r3, #128	@ 0x80
 8002874:	f88d 3007 	strb.w	r3, [sp, #7]
 8002878:	f10d 0107 	add.w	r1, sp, #7
 800287c:	2301      	movs	r3, #1
 800287e:	2287      	movs	r2, #135	@ 0x87
 8002880:	a804      	add	r0, sp, #16
 8002882:	f002 fc3d 	bl	8005100 <KeccakF1600_StateXORBytes>
 8002886:	2200      	movs	r2, #0
 8002888:	2300      	movs	r3, #0
 800288a:	e9cd 2336 	strd	r2, r3, [sp, #216]	@ 0xd8
 800288e:	4639      	mov	r1, r7
 8002890:	2300      	movs	r3, #0
 8002892:	2288      	movs	r2, #136	@ 0x88
 8002894:	a804      	add	r0, sp, #16
 8002896:	f002 fdb3 	bl	8005400 <KeccakF1600_StateExtractBytes>
 800289a:	b1a6      	cbz	r6, 80028c6 <cshake256_simple+0x106>
 800289c:	2500      	movs	r5, #0
 800289e:	a804      	add	r0, sp, #16
 80028a0:	f002 ffae 	bl	8005800 <KeccakF1600_StatePermute>
 80028a4:	2e88      	cmp	r6, #136	@ 0x88
 80028a6:	4634      	mov	r4, r6
 80028a8:	bf28      	it	cs
 80028aa:	2488      	movcs	r4, #136	@ 0x88
 80028ac:	4623      	mov	r3, r4
 80028ae:	4639      	mov	r1, r7
 80028b0:	2200      	movs	r2, #0
 80028b2:	a804      	add	r0, sp, #16
 80028b4:	f002 fda4 	bl	8005400 <KeccakF1600_StateExtractBytes>
 80028b8:	f1c4 0388 	rsb	r3, r4, #136	@ 0x88
 80028bc:	1b36      	subs	r6, r6, r4
 80028be:	e9cd 3536 	strd	r3, r5, [sp, #216]	@ 0xd8
 80028c2:	4427      	add	r7, r4
 80028c4:	d1eb      	bne.n	800289e <cshake256_simple+0xde>
 80028c6:	b038      	add	sp, #224	@ 0xe0
 80028c8:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
 80028cc:	2284      	movs	r2, #132	@ 0x84
 80028ce:	f88d 2007 	strb.w	r2, [sp, #7]
 80028d2:	2301      	movs	r3, #1
 80028d4:	2287      	movs	r2, #135	@ 0x87
 80028d6:	f10d 0107 	add.w	r1, sp, #7
 80028da:	a804      	add	r0, sp, #16
 80028dc:	f002 fc10 	bl	8005100 <KeccakF1600_StateXORBytes>
 80028e0:	e7d1      	b.n	8002886 <cshake256_simple+0xc6>
 80028e2:	bf00      	nop
 80028e4:	00018801 	.word	0x00018801

080028e8 <usart_setup>:
 80028e8:	b510      	push	{r4, lr}
 80028ea:	f240 2091 	movw	r0, #657	@ 0x291
 80028ee:	f004 fdbf 	bl	8007470 <rcc_periph_clock_enable>
 80028f2:	f240 300e 	movw	r0, #782	@ 0x30e
 80028f6:	f004 fdbb 	bl	8007470 <rcc_periph_clock_enable>
 80028fa:	f44f 63c0 	mov.w	r3, #1536	@ 0x600
 80028fe:	2203      	movs	r2, #3
 8002900:	2101      	movs	r1, #1
 8002902:	f04f 4090 	mov.w	r0, #1207959552	@ 0x48000000
 8002906:	4c1b      	ldr	r4, [pc, #108]	@ (8002974 <usart_setup+0x8c>)
 8002908:	f004 fc62 	bl	80071d0 <gpio_set_output_options>
 800290c:	f44f 62c0 	mov.w	r2, #1536	@ 0x600
 8002910:	2107      	movs	r1, #7
 8002912:	f04f 4090 	mov.w	r0, #1207959552	@ 0x48000000
 8002916:	f004 fc76 	bl	8007206 <gpio_set_af>
 800291a:	f44f 63c0 	mov.w	r3, #1536	@ 0x600
 800291e:	2201      	movs	r2, #1
 8002920:	2102      	movs	r1, #2
 8002922:	f04f 4090 	mov.w	r0, #1207959552	@ 0x48000000
 8002926:	f004 fc33 	bl	8007190 <gpio_mode_setup>
 800292a:	4620      	mov	r0, r4
 800292c:	f44f 4116 	mov.w	r1, #38400	@ 0x9600
 8002930:	f004 fdcc 	bl	80074cc <usart_set_baudrate>
 8002934:	4620      	mov	r0, r4
 8002936:	2108      	movs	r1, #8
 8002938:	f004 fdd3 	bl	80074e2 <usart_set_databits>
 800293c:	4620      	mov	r0, r4
 800293e:	2100      	movs	r1, #0
 8002940:	f004 fdd8 	bl	80074f4 <usart_set_stopbits>
 8002944:	4620      	mov	r0, r4
 8002946:	210c      	movs	r1, #12
 8002948:	f004 fde0 	bl	800750c <usart_set_mode>
 800294c:	4620      	mov	r0, r4
 800294e:	2100      	movs	r1, #0
 8002950:	f004 fdd6 	bl	8007500 <usart_set_parity>
 8002954:	2100      	movs	r1, #0
 8002956:	4620      	mov	r0, r4
 8002958:	f004 fdde 	bl	8007518 <usart_set_flow_control>
 800295c:	4620      	mov	r0, r4
 800295e:	f004 fdf1 	bl	8007544 <usart_disable_rx_interrupt>
 8002962:	4620      	mov	r0, r4
 8002964:	f004 fdf3 	bl	800754e <usart_disable_tx_interrupt>
 8002968:	4620      	mov	r0, r4
 800296a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800296e:	f004 bdd9 	b.w	8007524 <usart_enable>
 8002972:	bf00      	nop
 8002974:	40013800 	.word	0x40013800

08002978 <systick_setup>:
 8002978:	b508      	push	{r3, lr}
 800297a:	2004      	movs	r0, #4
 800297c:	f004 fe4a 	bl	8007614 <systick_set_clocksource>
 8002980:	f06f 407f 	mvn.w	r0, #4278190080	@ 0xff000000
 8002984:	f004 fe3a 	bl	80075fc <systick_set_reload>
 8002988:	f004 fe4e 	bl	8007628 <systick_interrupt_enable>
 800298c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8002990:	f004 be51 	b.w	8007636 <systick_counter_enable>

08002994 <trigger_setup>:
 8002994:	b508      	push	{r3, lr}
 8002996:	f240 2091 	movw	r0, #657	@ 0x291
 800299a:	f004 fd69 	bl	8007470 <rcc_periph_clock_enable>
 800299e:	f44f 5380 	mov.w	r3, #4096	@ 0x1000
 80029a2:	2101      	movs	r1, #1
 80029a4:	f04f 4090 	mov.w	r0, #1207959552	@ 0x48000000
 80029a8:	2200      	movs	r2, #0
 80029aa:	f004 fbf1 	bl	8007190 <gpio_mode_setup>
 80029ae:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80029b2:	f44f 5180 	mov.w	r1, #4096	@ 0x1000
 80029b6:	f04f 4090 	mov.w	r0, #1207959552	@ 0x48000000
 80029ba:	f004 bbdd 	b.w	8007178 <gpio_clear>
 80029be:	bf00      	nop

080029c0 <hal_setup>:
 80029c0:	b510      	push	{r4, lr}
 80029c2:	f44f 7024 	mov.w	r0, #656	@ 0x290
 80029c6:	f004 fd53 	bl	8007470 <rcc_periph_clock_enable>
 80029ca:	2001      	movs	r0, #1
 80029cc:	f004 fcda 	bl	8007384 <rcc_osc_off>
 80029d0:	2001      	movs	r0, #1
 80029d2:	f004 fd5b 	bl	800748c <rcc_osc_bypass_enable>
 80029d6:	2001      	movs	r0, #1
 80029d8:	f004 fcae 	bl	8007338 <rcc_osc_on>
 80029dc:	2001      	movs	r0, #1
 80029de:	f004 fc8b 	bl	80072f8 <rcc_wait_for_osc_ready>
 80029e2:	4c20      	ldr	r4, [pc, #128]	@ (8002a64 <hal_setup+0xa4>)
 80029e4:	4920      	ldr	r1, [pc, #128]	@ (8002a68 <hal_setup+0xa8>)
 80029e6:	4a21      	ldr	r2, [pc, #132]	@ (8002a6c <hal_setup+0xac>)
 80029e8:	f44f 03e1 	mov.w	r3, #7372800	@ 0x708000
 80029ec:	2000      	movs	r0, #0
 80029ee:	6023      	str	r3, [r4, #0]
 80029f0:	600b      	str	r3, [r1, #0]
 80029f2:	6013      	str	r3, [r2, #0]
 80029f4:	f004 fd0a 	bl	800740c <rcc_set_hpre>
 80029f8:	2000      	movs	r0, #0
 80029fa:	f004 fcfd 	bl	80073f8 <rcc_set_ppre1>
 80029fe:	2000      	movs	r0, #0
 8002a00:	f004 fcf0 	bl	80073e4 <rcc_set_ppre2>
 8002a04:	2001      	movs	r0, #1
 8002a06:	f004 fce3 	bl	80073d0 <rcc_set_sysclk_source>
 8002a0a:	2001      	movs	r0, #1
 8002a0c:	f004 fc7c 	bl	8007308 <rcc_wait_for_sysclk_status>
 8002a10:	f7ff ff6a 	bl	80028e8 <usart_setup>
 8002a14:	f240 2091 	movw	r0, #657	@ 0x291
 8002a18:	f004 fd2a 	bl	8007470 <rcc_periph_clock_enable>
 8002a1c:	f44f 5380 	mov.w	r3, #4096	@ 0x1000
 8002a20:	2200      	movs	r2, #0
 8002a22:	2101      	movs	r1, #1
 8002a24:	f04f 4090 	mov.w	r0, #1207959552	@ 0x48000000
 8002a28:	f004 fbb2 	bl	8007190 <gpio_mode_setup>
 8002a2c:	f44f 5180 	mov.w	r1, #4096	@ 0x1000
 8002a30:	f04f 4090 	mov.w	r0, #1207959552	@ 0x48000000
 8002a34:	f004 fba0 	bl	8007178 <gpio_clear>
 8002a38:	4c0d      	ldr	r4, [pc, #52]	@ (8002a70 <hal_setup+0xb0>)
 8002a3a:	2004      	movs	r0, #4
 8002a3c:	f004 fdea 	bl	8007614 <systick_set_clocksource>
 8002a40:	f06f 407f 	mvn.w	r0, #4278190080	@ 0xff000000
 8002a44:	f004 fdda 	bl	80075fc <systick_set_reload>
 8002a48:	f004 fdee 	bl	8007628 <systick_interrupt_enable>
 8002a4c:	f004 fdf3 	bl	8007636 <systick_counter_enable>
 8002a50:	e9d4 0100 	ldrd	r0, r1, [r4]
 8002a54:	e9d4 2300 	ldrd	r2, r3, [r4]
 8002a58:	428b      	cmp	r3, r1
 8002a5a:	bf08      	it	eq
 8002a5c:	4282      	cmpeq	r2, r0
 8002a5e:	d0f9      	beq.n	8002a54 <hal_setup+0x94>
 8002a60:	bd10      	pop	{r4, pc}
 8002a62:	bf00      	nop
 8002a64:	2000000c 	.word	0x2000000c
 8002a68:	20000008 	.word	0x20000008
 8002a6c:	20000004 	.word	0x20000004
 8002a70:	20000010 	.word	0x20000010

08002a74 <hal_send_str>:
 8002a74:	7801      	ldrb	r1, [r0, #0]
 8002a76:	b179      	cbz	r1, 8002a98 <hal_send_str+0x24>
 8002a78:	b538      	push	{r3, r4, r5, lr}
 8002a7a:	4d09      	ldr	r5, [pc, #36]	@ (8002aa0 <hal_send_str+0x2c>)
 8002a7c:	4604      	mov	r4, r0
 8002a7e:	4628      	mov	r0, r5
 8002a80:	f004 fd55 	bl	800752e <usart_send_blocking>
 8002a84:	f814 1f01 	ldrb.w	r1, [r4, #1]!
 8002a88:	2900      	cmp	r1, #0
 8002a8a:	d1f8      	bne.n	8002a7e <hal_send_str+0xa>
 8002a8c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8002a90:	4803      	ldr	r0, [pc, #12]	@ (8002aa0 <hal_send_str+0x2c>)
 8002a92:	210a      	movs	r1, #10
 8002a94:	f004 bd4b 	b.w	800752e <usart_send_blocking>
 8002a98:	4801      	ldr	r0, [pc, #4]	@ (8002aa0 <hal_send_str+0x2c>)
 8002a9a:	210a      	movs	r1, #10
 8002a9c:	f004 bd47 	b.w	800752e <usart_send_blocking>
 8002aa0:	40013800 	.word	0x40013800

08002aa4 <hal_trigger_toggle>:
 8002aa4:	f44f 5180 	mov.w	r1, #4096	@ 0x1000
 8002aa8:	f04f 4090 	mov.w	r0, #1207959552	@ 0x48000000
 8002aac:	f004 bb67 	b.w	800717e <gpio_toggle>

08002ab0 <sys_tick_handler>:
 8002ab0:	b410      	push	{r4}
 8002ab2:	4c05      	ldr	r4, [pc, #20]	@ (8002ac8 <sys_tick_handler+0x18>)
 8002ab4:	e9d4 2300 	ldrd	r2, r3, [r4]
 8002ab8:	1c50      	adds	r0, r2, #1
 8002aba:	f143 0100 	adc.w	r1, r3, #0
 8002abe:	e9c4 0100 	strd	r0, r1, [r4]
 8002ac2:	f85d 4b04 	ldr.w	r4, [sp], #4
 8002ac6:	4770      	bx	lr
 8002ac8:	20000010 	.word	0x20000010

08002acc <hal_get_time>:
 8002acc:	b570      	push	{r4, r5, r6, lr}
 8002ace:	4e0b      	ldr	r6, [pc, #44]	@ (8002afc <hal_get_time+0x30>)
 8002ad0:	e9d6 4500 	ldrd	r4, r5, [r6]
 8002ad4:	f004 fd98 	bl	8007608 <systick_get_value>
 8002ad8:	e9d6 2300 	ldrd	r2, r3, [r6]
 8002adc:	42ab      	cmp	r3, r5
 8002ade:	bf08      	it	eq
 8002ae0:	42a2      	cmpeq	r2, r4
 8002ae2:	d1f5      	bne.n	8002ad0 <hal_get_time+0x4>
 8002ae4:	1c62      	adds	r2, r4, #1
 8002ae6:	f145 0100 	adc.w	r1, r5, #0
 8002aea:	0613      	lsls	r3, r2, #24
 8002aec:	0609      	lsls	r1, r1, #24
 8002aee:	1a18      	subs	r0, r3, r0
 8002af0:	ea41 2112 	orr.w	r1, r1, r2, lsr #8
 8002af4:	f161 0100 	sbc.w	r1, r1, #0
 8002af8:	bd70      	pop	{r4, r5, r6, pc}
 8002afa:	bf00      	nop
 8002afc:	20000010 	.word	0x20000010

08002b00 <__wrap__sbrk>:
 8002b00:	4a02      	ldr	r2, [pc, #8]	@ (8002b0c <__wrap__sbrk+0xc>)
 8002b02:	4603      	mov	r3, r0
 8002b04:	6810      	ldr	r0, [r2, #0]
 8002b06:	4403      	add	r3, r0
 8002b08:	6013      	str	r3, [r2, #0]
 8002b0a:	4770      	bx	lr
 8002b0c:	20000000 	.word	0x20000000

08002b10 <hal_get_stack_size>:
 8002b10:	4668      	mov	r0, sp
 8002b12:	4b02      	ldr	r3, [pc, #8]	@ (8002b1c <hal_get_stack_size+0xc>)
 8002b14:	681b      	ldr	r3, [r3, #0]
 8002b16:	1ac0      	subs	r0, r0, r3
 8002b18:	4770      	bx	lr
 8002b1a:	bf00      	nop
 8002b1c:	20000000 	.word	0x20000000

08002b20 <hal_spraystack>:
 8002b20:	4b05      	ldr	r3, [pc, #20]	@ (8002b38 <hal_spraystack+0x18>)
 8002b22:	4906      	ldr	r1, [pc, #24]	@ (8002b3c <hal_spraystack+0x1c>)
 8002b24:	681a      	ldr	r2, [r3, #0]
 8002b26:	4806      	ldr	r0, [pc, #24]	@ (8002b40 <hal_spraystack+0x20>)
 8002b28:	688b      	ldr	r3, [r1, #8]
 8002b2a:	466b      	mov	r3, sp
 8002b2c:	f842 0b04 	str.w	r0, [r2], #4
 8002b30:	429a      	cmp	r2, r3
 8002b32:	dbfb      	blt.n	8002b2c <hal_spraystack+0xc>
 8002b34:	608b      	str	r3, [r1, #8]
 8002b36:	4770      	bx	lr
 8002b38:	20000000 	.word	0x20000000
 8002b3c:	20000010 	.word	0x20000010
 8002b40:	deadbeef 	.word	0xdeadbeef

08002b44 <hal_checkstack>:
 8002b44:	4b08      	ldr	r3, [pc, #32]	@ (8002b68 <hal_checkstack+0x24>)
 8002b46:	4a09      	ldr	r2, [pc, #36]	@ (8002b6c <hal_checkstack+0x28>)
 8002b48:	689b      	ldr	r3, [r3, #8]
 8002b4a:	6812      	ldr	r2, [r2, #0]
 8002b4c:	4908      	ldr	r1, [pc, #32]	@ (8002b70 <hal_checkstack+0x2c>)
 8002b4e:	2000      	movs	r0, #0
 8002b50:	eba3 0002 	sub.w	r0, r3, r2
 8002b54:	f852 cb04 	ldr.w	ip, [r2], #4
 8002b58:	458c      	cmp	ip, r1
 8002b5a:	bf0c      	ite	eq
 8002b5c:	3804      	subeq	r0, #4
 8002b5e:	e001      	bne.n	8002b64 <hal_checkstack+0x20>
 8002b60:	429a      	cmp	r2, r3
 8002b62:	dbf7      	blt.n	8002b54 <hal_checkstack+0x10>
 8002b64:	4770      	bx	lr
 8002b66:	bf00      	nop
 8002b68:	20000010 	.word	0x20000010
 8002b6c:	20000000 	.word	0x20000000
 8002b70:	deadbeef 	.word	0xdeadbeef

08002b74 <__wrap__open>:
 8002b74:	4b02      	ldr	r3, [pc, #8]	@ (8002b80 <__wrap__open+0xc>)
 8002b76:	2258      	movs	r2, #88	@ 0x58
 8002b78:	601a      	str	r2, [r3, #0]
 8002b7a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
 8002b7e:	4770      	bx	lr
 8002b80:	20000094 	.word	0x20000094

08002b84 <__wrap__close>:
 8002b84:	4b02      	ldr	r3, [pc, #8]	@ (8002b90 <__wrap__close+0xc>)
 8002b86:	2258      	movs	r2, #88	@ 0x58
 8002b88:	601a      	str	r2, [r3, #0]
 8002b8a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
 8002b8e:	4770      	bx	lr
 8002b90:	20000094 	.word	0x20000094

08002b94 <__wrap__fstat>:
 8002b94:	4b02      	ldr	r3, [pc, #8]	@ (8002ba0 <__wrap__fstat+0xc>)
 8002b96:	2258      	movs	r2, #88	@ 0x58
 8002b98:	601a      	str	r2, [r3, #0]
 8002b9a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
 8002b9e:	4770      	bx	lr
 8002ba0:	20000094 	.word	0x20000094

08002ba4 <__wrap__getpid>:
 8002ba4:	4b02      	ldr	r3, [pc, #8]	@ (8002bb0 <__wrap__getpid+0xc>)
 8002ba6:	2258      	movs	r2, #88	@ 0x58
 8002ba8:	601a      	str	r2, [r3, #0]
 8002baa:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
 8002bae:	4770      	bx	lr
 8002bb0:	20000094 	.word	0x20000094

08002bb4 <__wrap__isatty>:
 8002bb4:	4b02      	ldr	r3, [pc, #8]	@ (8002bc0 <__wrap__isatty+0xc>)
 8002bb6:	2258      	movs	r2, #88	@ 0x58
 8002bb8:	601a      	str	r2, [r3, #0]
 8002bba:	2000      	movs	r0, #0
 8002bbc:	4770      	bx	lr
 8002bbe:	bf00      	nop
 8002bc0:	20000094 	.word	0x20000094

08002bc4 <__wrap__kill>:
 8002bc4:	4b02      	ldr	r3, [pc, #8]	@ (8002bd0 <__wrap__kill+0xc>)
 8002bc6:	2258      	movs	r2, #88	@ 0x58
 8002bc8:	601a      	str	r2, [r3, #0]
 8002bca:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
 8002bce:	4770      	bx	lr
 8002bd0:	20000094 	.word	0x20000094

08002bd4 <__wrap__lseek>:
 8002bd4:	4b02      	ldr	r3, [pc, #8]	@ (8002be0 <__wrap__lseek+0xc>)
 8002bd6:	2258      	movs	r2, #88	@ 0x58
 8002bd8:	601a      	str	r2, [r3, #0]
 8002bda:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
 8002bde:	4770      	bx	lr
 8002be0:	20000094 	.word	0x20000094

08002be4 <__wrap__read>:
 8002be4:	4b02      	ldr	r3, [pc, #8]	@ (8002bf0 <__wrap__read+0xc>)
 8002be6:	2258      	movs	r2, #88	@ 0x58
 8002be8:	601a      	str	r2, [r3, #0]
 8002bea:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
 8002bee:	4770      	bx	lr
 8002bf0:	20000094 	.word	0x20000094

08002bf4 <__wrap__write>:
 8002bf4:	4b02      	ldr	r3, [pc, #8]	@ (8002c00 <__wrap__write+0xc>)
 8002bf6:	2258      	movs	r2, #88	@ 0x58
 8002bf8:	601a      	str	r2, [r3, #0]
 8002bfa:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
 8002bfe:	4770      	bx	lr
 8002c00:	20000094 	.word	0x20000094

08002c04 <surf>:
 8002c04:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8002c08:	4b6d      	ldr	r3, [pc, #436]	@ (8002dc0 <surf+0x1bc>)
 8002c0a:	b091      	sub	sp, #68	@ 0x44
 8002c0c:	689a      	ldr	r2, [r3, #8]
 8002c0e:	900d      	str	r0, [sp, #52]	@ 0x34
 8002c10:	4606      	mov	r6, r0
 8002c12:	e9d3 0100 	ldrd	r0, r1, [r3]
 8002c16:	f082 0b09 	eor.w	fp, r2, #9
 8002c1a:	4a6a      	ldr	r2, [pc, #424]	@ (8002dc4 <surf+0x1c0>)
 8002c1c:	699f      	ldr	r7, [r3, #24]
 8002c1e:	f081 0507 	eor.w	r5, r1, #7
 8002c22:	4611      	mov	r1, r2
 8002c24:	4632      	mov	r2, r6
 8002c26:	3204      	adds	r2, #4
 8002c28:	920e      	str	r2, [sp, #56]	@ 0x38
 8002c2a:	691a      	ldr	r2, [r3, #16]
 8002c2c:	69de      	ldr	r6, [r3, #28]
 8002c2e:	950b      	str	r5, [sp, #44]	@ 0x2c
 8002c30:	f080 0409 	eor.w	r4, r0, #9
 8002c34:	940a      	str	r4, [sp, #40]	@ 0x28
 8002c36:	f082 0902 	eor.w	r9, r2, #2
 8002c3a:	6a5c      	ldr	r4, [r3, #36]	@ 0x24
 8002c3c:	695a      	ldr	r2, [r3, #20]
 8002c3e:	6a1d      	ldr	r5, [r3, #32]
 8002c40:	f082 0803 	eor.w	r8, r2, #3
 8002c44:	f084 0202 	eor.w	r2, r4, #2
 8002c48:	920c      	str	r2, [sp, #48]	@ 0x30
 8002c4a:	6a9a      	ldr	r2, [r3, #40]	@ 0x28
 8002c4c:	f082 0e06 	eor.w	lr, r2, #6
 8002c50:	6ada      	ldr	r2, [r3, #44]	@ 0x2c
 8002c52:	68db      	ldr	r3, [r3, #12]
 8002c54:	f082 0c04 	eor.w	ip, r2, #4
 8002c58:	4a5b      	ldr	r2, [pc, #364]	@ (8002dc8 <surf+0x1c4>)
 8002c5a:	9201      	str	r2, [sp, #4]
 8002c5c:	2205      	movs	r2, #5
 8002c5e:	9204      	str	r2, [sp, #16]
 8002c60:	2009      	movs	r0, #9
 8002c62:	2207      	movs	r2, #7
 8002c64:	e9cd 2005 	strd	r2, r0, [sp, #20]
 8002c68:	2402      	movs	r4, #2
 8002c6a:	2208      	movs	r2, #8
 8002c6c:	e9cd 4207 	strd	r4, r2, [sp, #28]
 8002c70:	f083 0a03 	eor.w	sl, r3, #3
 8002c74:	460c      	mov	r4, r1
 8002c76:	2303      	movs	r3, #3
 8002c78:	e9cd 3302 	strd	r3, r3, [sp, #8]
 8002c7c:	9309      	str	r3, [sp, #36]	@ 0x24
 8002c7e:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
 8002c80:	940f      	str	r4, [sp, #60]	@ 0x3c
 8002c82:	9c0e      	ldr	r4, [sp, #56]	@ 0x38
 8002c84:	c40f      	stmia	r4!, {r0, r1, r2, r3}
 8002c86:	4623      	mov	r3, r4
 8002c88:	9c0f      	ldr	r4, [sp, #60]	@ 0x3c
 8002c8a:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
 8002c8e:	e883 0007 	stmia.w	r3, {r0, r1, r2}
 8002c92:	e9dd 100a 	ldrd	r1, r0, [sp, #40]	@ 0x28
 8002c96:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
 8002c98:	f087 0708 	eor.w	r7, r7, #8
 8002c9c:	f086 0604 	eor.w	r6, r6, #4
 8002ca0:	f085 0506 	eor.w	r5, r5, #6
 8002ca4:	9b01      	ldr	r3, [sp, #4]
 8002ca6:	f103 53e4 	add.w	r3, r3, #478150656	@ 0x1c800000
 8002caa:	f503 2306 	add.w	r3, r3, #548864	@ 0x86000
 8002cae:	f503 638e 	add.w	r3, r3, #1136	@ 0x470
 8002cb2:	f1a3 43c3 	sub.w	r3, r3, #1635778560	@ 0x61800000
 8002cb6:	f5a3 0391 	sub.w	r3, r3, #4751360	@ 0x488000
 8002cba:	f2a3 6347 	subw	r3, r3, #1607	@ 0x647
 8002cbe:	f08c 0203 	eor.w	r2, ip, #3
 8002cc2:	441a      	add	r2, r3
 8002cc4:	ea82 62fc 	eor.w	r2, r2, ip, ror #27
 8002cc8:	4411      	add	r1, r2
 8002cca:	f081 0201 	eor.w	r2, r1, #1
 8002cce:	441a      	add	r2, r3
 8002cd0:	ea82 6271 	eor.w	r2, r2, r1, ror #25
 8002cd4:	4410      	add	r0, r2
 8002cd6:	f080 0204 	eor.w	r2, r0, #4
 8002cda:	441a      	add	r2, r3
 8002cdc:	ea82 52f0 	eor.w	r2, r2, r0, ror #23
 8002ce0:	4493      	add	fp, r2
 8002ce2:	f08b 0201 	eor.w	r2, fp, #1
 8002ce6:	441a      	add	r2, r3
 8002ce8:	ea82 42fb 	eor.w	r2, r2, fp, ror #19
 8002cec:	4492      	add	sl, r2
 8002cee:	f08a 0205 	eor.w	r2, sl, #5
 8002cf2:	441a      	add	r2, r3
 8002cf4:	ea82 62fa 	eor.w	r2, r2, sl, ror #27
 8002cf8:	4491      	add	r9, r2
 8002cfa:	f089 0209 	eor.w	r2, r9, #9
 8002cfe:	441a      	add	r2, r3
 8002d00:	ea82 6279 	eor.w	r2, r2, r9, ror #25
 8002d04:	4490      	add	r8, r2
 8002d06:	f088 0202 	eor.w	r2, r8, #2
 8002d0a:	441a      	add	r2, r3
 8002d0c:	ea82 52f8 	eor.w	r2, r2, r8, ror #23
 8002d10:	4417      	add	r7, r2
 8002d12:	f087 0206 	eor.w	r2, r7, #6
 8002d16:	441a      	add	r2, r3
 8002d18:	ea82 42f7 	eor.w	r2, r2, r7, ror #19
 8002d1c:	4416      	add	r6, r2
 8002d1e:	f086 0205 	eor.w	r2, r6, #5
 8002d22:	441a      	add	r2, r3
 8002d24:	ea82 62f6 	eor.w	r2, r2, r6, ror #27
 8002d28:	4415      	add	r5, r2
 8002d2a:	f085 0203 	eor.w	r2, r5, #3
 8002d2e:	441a      	add	r2, r3
 8002d30:	ea82 6275 	eor.w	r2, r2, r5, ror #25
 8002d34:	4414      	add	r4, r2
 8002d36:	f084 0205 	eor.w	r2, r4, #5
 8002d3a:	441a      	add	r2, r3
 8002d3c:	ea82 52f4 	eor.w	r2, r2, r4, ror #23
 8002d40:	4496      	add	lr, r2
 8002d42:	f08e 0208 	eor.w	r2, lr, #8
 8002d46:	441a      	add	r2, r3
 8002d48:	ea82 42fe 	eor.w	r2, r2, lr, ror #19
 8002d4c:	4494      	add	ip, r2
 8002d4e:	9a01      	ldr	r2, [sp, #4]
 8002d50:	4293      	cmp	r3, r2
 8002d52:	d1ae      	bne.n	8002cb2 <surf+0xae>
 8002d54:	9b02      	ldr	r3, [sp, #8]
 8002d56:	ea83 0309 	eor.w	r3, r3, r9
 8002d5a:	9302      	str	r3, [sp, #8]
 8002d5c:	9b03      	ldr	r3, [sp, #12]
 8002d5e:	ea83 0308 	eor.w	r3, r3, r8
 8002d62:	9303      	str	r3, [sp, #12]
 8002d64:	9b08      	ldr	r3, [sp, #32]
 8002d66:	407b      	eors	r3, r7
 8002d68:	9308      	str	r3, [sp, #32]
 8002d6a:	9b09      	ldr	r3, [sp, #36]	@ 0x24
 8002d6c:	4073      	eors	r3, r6
 8002d6e:	9309      	str	r3, [sp, #36]	@ 0x24
 8002d70:	9b07      	ldr	r3, [sp, #28]
 8002d72:	406b      	eors	r3, r5
 8002d74:	9307      	str	r3, [sp, #28]
 8002d76:	9b05      	ldr	r3, [sp, #20]
 8002d78:	4063      	eors	r3, r4
 8002d7a:	9305      	str	r3, [sp, #20]
 8002d7c:	9b06      	ldr	r3, [sp, #24]
 8002d7e:	ea83 030e 	eor.w	r3, r3, lr
 8002d82:	9306      	str	r3, [sp, #24]
 8002d84:	9b04      	ldr	r3, [sp, #16]
 8002d86:	ea83 030c 	eor.w	r3, r3, ip
 8002d8a:	9304      	str	r3, [sp, #16]
 8002d8c:	4613      	mov	r3, r2
 8002d8e:	4a0f      	ldr	r2, [pc, #60]	@ (8002dcc <surf+0x1c8>)
 8002d90:	4293      	cmp	r3, r2
 8002d92:	d001      	beq.n	8002d98 <surf+0x194>
 8002d94:	9201      	str	r2, [sp, #4]
 8002d96:	e785      	b.n	8002ca4 <surf+0xa0>
 8002d98:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
 8002d9a:	9a02      	ldr	r2, [sp, #8]
 8002d9c:	601a      	str	r2, [r3, #0]
 8002d9e:	9a03      	ldr	r2, [sp, #12]
 8002da0:	605a      	str	r2, [r3, #4]
 8002da2:	9a08      	ldr	r2, [sp, #32]
 8002da4:	609a      	str	r2, [r3, #8]
 8002da6:	9a09      	ldr	r2, [sp, #36]	@ 0x24
 8002da8:	60da      	str	r2, [r3, #12]
 8002daa:	9a07      	ldr	r2, [sp, #28]
 8002dac:	611a      	str	r2, [r3, #16]
 8002dae:	9a05      	ldr	r2, [sp, #20]
 8002db0:	615a      	str	r2, [r3, #20]
 8002db2:	9a06      	ldr	r2, [sp, #24]
 8002db4:	619a      	str	r2, [r3, #24]
 8002db6:	9a04      	ldr	r2, [sp, #16]
 8002db8:	61da      	str	r2, [r3, #28]
 8002dba:	b011      	add	sp, #68	@ 0x44
 8002dbc:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8002dc0:	20000020 	.word	0x20000020
 8002dc4:	08007dfc 	.word	0x08007dfc
 8002dc8:	e3779b90 	.word	0xe3779b90
 8002dcc:	c6ef3720 	.word	0xc6ef3720

08002dd0 <randombytes_regen>:
 8002dd0:	b5f0      	push	{r4, r5, r6, r7, lr}
 8002dd2:	4e29      	ldr	r6, [pc, #164]	@ (8002e78 <randombytes_regen+0xa8>)
 8002dd4:	6837      	ldr	r7, [r6, #0]
 8002dd6:	1c7a      	adds	r2, r7, #1
 8002dd8:	b089      	sub	sp, #36	@ 0x24
 8002dda:	6032      	str	r2, [r6, #0]
 8002ddc:	bb1a      	cbnz	r2, 8002e26 <randombytes_regen+0x56>
 8002dde:	6873      	ldr	r3, [r6, #4]
 8002de0:	3301      	adds	r3, #1
 8002de2:	6073      	str	r3, [r6, #4]
 8002de4:	2b00      	cmp	r3, #0
 8002de6:	d03e      	beq.n	8002e66 <randombytes_regen+0x96>
 8002de8:	466d      	mov	r5, sp
 8002dea:	4628      	mov	r0, r5
 8002dec:	f7ff ff0a 	bl	8002c04 <surf>
 8002df0:	2301      	movs	r3, #1
 8002df2:	46ac      	mov	ip, r5
 8002df4:	6033      	str	r3, [r6, #0]
 8002df6:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 8002dfa:	4c20      	ldr	r4, [pc, #128]	@ (8002e7c <randombytes_regen+0xac>)
 8002dfc:	c40f      	stmia	r4!, {r0, r1, r2, r3}
 8002dfe:	e89c 000f 	ldmia.w	ip, {r0, r1, r2, r3}
 8002e02:	e884 000f 	stmia.w	r4, {r0, r1, r2, r3}
 8002e06:	4628      	mov	r0, r5
 8002e08:	f7ff fefc 	bl	8002c04 <surf>
 8002e0c:	46ac      	mov	ip, r5
 8002e0e:	2340      	movs	r3, #64	@ 0x40
 8002e10:	6733      	str	r3, [r6, #112]	@ 0x70
 8002e12:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 8002e16:	4c1a      	ldr	r4, [pc, #104]	@ (8002e80 <randombytes_regen+0xb0>)
 8002e18:	c40f      	stmia	r4!, {r0, r1, r2, r3}
 8002e1a:	e89c 000f 	ldmia.w	ip, {r0, r1, r2, r3}
 8002e1e:	e884 000f 	stmia.w	r4, {r0, r1, r2, r3}
 8002e22:	b009      	add	sp, #36	@ 0x24
 8002e24:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8002e26:	466d      	mov	r5, sp
 8002e28:	4628      	mov	r0, r5
 8002e2a:	f7ff feeb 	bl	8002c04 <surf>
 8002e2e:	46ac      	mov	ip, r5
 8002e30:	e8bc 000f 	ldmia.w	ip!, {r0, r1, r2, r3}
 8002e34:	f106 0430 	add.w	r4, r6, #48	@ 0x30
 8002e38:	c40f      	stmia	r4!, {r0, r1, r2, r3}
 8002e3a:	e89c 000f 	ldmia.w	ip, {r0, r1, r2, r3}
 8002e3e:	3702      	adds	r7, #2
 8002e40:	e884 000f 	stmia.w	r4, {r0, r1, r2, r3}
 8002e44:	6037      	str	r7, [r6, #0]
 8002e46:	2f00      	cmp	r7, #0
 8002e48:	d1dd      	bne.n	8002e06 <randombytes_regen+0x36>
 8002e4a:	6873      	ldr	r3, [r6, #4]
 8002e4c:	3301      	adds	r3, #1
 8002e4e:	6073      	str	r3, [r6, #4]
 8002e50:	2b00      	cmp	r3, #0
 8002e52:	d1d8      	bne.n	8002e06 <randombytes_regen+0x36>
 8002e54:	68b3      	ldr	r3, [r6, #8]
 8002e56:	3301      	adds	r3, #1
 8002e58:	60b3      	str	r3, [r6, #8]
 8002e5a:	2b00      	cmp	r3, #0
 8002e5c:	d1d3      	bne.n	8002e06 <randombytes_regen+0x36>
 8002e5e:	68f3      	ldr	r3, [r6, #12]
 8002e60:	3301      	adds	r3, #1
 8002e62:	60f3      	str	r3, [r6, #12]
 8002e64:	e7cf      	b.n	8002e06 <randombytes_regen+0x36>
 8002e66:	68b3      	ldr	r3, [r6, #8]
 8002e68:	3301      	adds	r3, #1
 8002e6a:	60b3      	str	r3, [r6, #8]
 8002e6c:	2b00      	cmp	r3, #0
 8002e6e:	d1bb      	bne.n	8002de8 <randombytes_regen+0x18>
 8002e70:	68f3      	ldr	r3, [r6, #12]
 8002e72:	3301      	adds	r3, #1
 8002e74:	60f3      	str	r3, [r6, #12]
 8002e76:	e7b7      	b.n	8002de8 <randombytes_regen+0x18>
 8002e78:	20000020 	.word	0x20000020
 8002e7c:	20000050 	.word	0x20000050
 8002e80:	20000070 	.word	0x20000070

08002e84 <PQCLEAN_randombytes>:
 8002e84:	b1a1      	cbz	r1, 8002eb0 <PQCLEAN_randombytes+0x2c>
 8002e86:	b570      	push	{r4, r5, r6, lr}
 8002e88:	4d0a      	ldr	r5, [pc, #40]	@ (8002eb4 <PQCLEAN_randombytes+0x30>)
 8002e8a:	6f2b      	ldr	r3, [r5, #112]	@ 0x70
 8002e8c:	4604      	mov	r4, r0
 8002e8e:	1846      	adds	r6, r0, r1
 8002e90:	b153      	cbz	r3, 8002ea8 <PQCLEAN_randombytes+0x24>
 8002e92:	3b01      	subs	r3, #1
 8002e94:	18ea      	adds	r2, r5, r3
 8002e96:	672b      	str	r3, [r5, #112]	@ 0x70
 8002e98:	f892 2030 	ldrb.w	r2, [r2, #48]	@ 0x30
 8002e9c:	f804 2b01 	strb.w	r2, [r4], #1
 8002ea0:	42b4      	cmp	r4, r6
 8002ea2:	d1f5      	bne.n	8002e90 <PQCLEAN_randombytes+0xc>
 8002ea4:	2000      	movs	r0, #0
 8002ea6:	bd70      	pop	{r4, r5, r6, pc}
 8002ea8:	f7ff ff92 	bl	8002dd0 <randombytes_regen>
 8002eac:	6f2b      	ldr	r3, [r5, #112]	@ 0x70
 8002eae:	e7f0      	b.n	8002e92 <PQCLEAN_randombytes+0xe>
 8002eb0:	2000      	movs	r0, #0
 8002eb2:	4770      	bx	lr
 8002eb4:	20000020 	.word	0x20000020

08002eb8 <cmov_int16>:
 8002eb8:	f1b2 0f00 	cmp.w	r2, #0
 8002ebc:	f9b0 3000 	ldrsh.w	r3, [r0]
 8002ec0:	bf18      	it	ne
 8002ec2:	ea4f 0301 	movne.w	r3, r1
 8002ec6:	f8a0 3000 	strh.w	r3, [r0]
 8002eca:	4770      	bx	lr

08002ecc <pointwise_sub>:
 8002ecc:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8002ed0:	f240 0e19 	movw	lr, #25
 8002ed4:	c9f8      	ldmia	r1!, {r3, r4, r5, r6, r7}
 8002ed6:	e8b2 1f00 	ldmia.w	r2!, {r8, r9, sl, fp, ip}
 8002eda:	fad3 f348 	usub16	r3, r3, r8
 8002ede:	fad4 f449 	usub16	r4, r4, r9
 8002ee2:	fad5 f54a 	usub16	r5, r5, sl
 8002ee6:	fad6 f64b 	usub16	r6, r6, fp
 8002eea:	fad7 f74c 	usub16	r7, r7, ip
 8002eee:	c0f8      	stmia	r0!, {r3, r4, r5, r6, r7}
 8002ef0:	f1be 0e01 	subs.w	lr, lr, #1
 8002ef4:	f47f afee 	bne.w	8002ed4 <pointwise_sub+0x8>
 8002ef8:	c938      	ldmia	r1!, {r3, r4, r5}
 8002efa:	e8b2 0700 	ldmia.w	r2!, {r8, r9, sl}
 8002efe:	fad3 f348 	usub16	r3, r3, r8
 8002f02:	fad4 f449 	usub16	r4, r4, r9
 8002f06:	fad5 f54a 	usub16	r5, r5, sl
 8002f0a:	c038      	stmia	r0!, {r3, r4, r5}
 8002f0c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

08002f10 <pointwise_add>:
 8002f10:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8002f14:	f240 0e19 	movw	lr, #25
 8002f18:	c9f8      	ldmia	r1!, {r3, r4, r5, r6, r7}
 8002f1a:	e8b2 1f00 	ldmia.w	r2!, {r8, r9, sl, fp, ip}
 8002f1e:	fa93 f348 	uadd16	r3, r3, r8
 8002f22:	fa94 f449 	uadd16	r4, r4, r9
 8002f26:	fa95 f54a 	uadd16	r5, r5, sl
 8002f2a:	fa96 f64b 	uadd16	r6, r6, fp
 8002f2e:	fa97 f74c 	uadd16	r7, r7, ip
 8002f32:	c0f8      	stmia	r0!, {r3, r4, r5, r6, r7}
 8002f34:	f1be 0e01 	subs.w	lr, lr, #1
 8002f38:	f47f afee 	bne.w	8002f18 <pointwise_add+0x8>
 8002f3c:	c938      	ldmia	r1!, {r3, r4, r5}
 8002f3e:	e8b2 0700 	ldmia.w	r2!, {r8, r9, sl}
 8002f42:	fa93 f348 	uadd16	r3, r3, r8
 8002f46:	fa94 f449 	uadd16	r4, r4, r9
 8002f4a:	fa95 f54a 	uadd16	r5, r5, sl
 8002f4e:	c038      	stmia	r0!, {r3, r4, r5}
 8002f50:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

08002f54 <basemul_asm_opt_16_32>:
 8002f54:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8002f58:	f240 0e40 	movw	lr, #64	@ 0x40
 8002f5c:	f851 4b04 	ldr.w	r4, [r1], #4
 8002f60:	f852 6b04 	ldr.w	r6, [r2], #4
 8002f64:	f851 5b04 	ldr.w	r5, [r1], #4
 8002f68:	f852 7b04 	ldr.w	r7, [r2], #4
 8002f6c:	f8d3 b004 	ldr.w	fp, [r3, #4]
 8002f70:	f853 cb08 	ldr.w	ip, [r3], #8
 8002f74:	fb2c fc06 	smuad	ip, ip, r6
 8002f78:	f840 cb04 	str.w	ip, [r0], #4
 8002f7c:	fb24 fc16 	smuadx	ip, r4, r6
 8002f80:	f840 cb04 	str.w	ip, [r0], #4
 8002f84:	fb2b fc07 	smuad	ip, fp, r7
 8002f88:	f840 cb04 	str.w	ip, [r0], #4
 8002f8c:	fb25 fc17 	smuadx	ip, r5, r7
 8002f90:	f840 cb04 	str.w	ip, [r0], #4
 8002f94:	f1be 0e01 	subs.w	lr, lr, #1
 8002f98:	f47f afe0 	bne.w	8002f5c <basemul_asm_opt_16_32+0x8>
 8002f9c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

08002fa0 <basemul_asm_acc_opt_32_32>:
 8002fa0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8002fa4:	f240 0e40 	movw	lr, #64	@ 0x40
 8002fa8:	f851 4b04 	ldr.w	r4, [r1], #4
 8002fac:	f852 6b04 	ldr.w	r6, [r2], #4
 8002fb0:	f8d0 5000 	ldr.w	r5, [r0]
 8002fb4:	f853 cb04 	ldr.w	ip, [r3], #4
 8002fb8:	f8d0 7004 	ldr.w	r7, [r0, #4]
 8002fbc:	fb2c 5c06 	smlad	ip, ip, r6, r5
 8002fc0:	f840 cb04 	str.w	ip, [r0], #4
 8002fc4:	fb24 7b16 	smladx	fp, r4, r6, r7
 8002fc8:	f840 bb04 	str.w	fp, [r0], #4
 8002fcc:	f851 4b04 	ldr.w	r4, [r1], #4
 8002fd0:	f852 6b04 	ldr.w	r6, [r2], #4
 8002fd4:	f8d0 5000 	ldr.w	r5, [r0]
 8002fd8:	f853 cb04 	ldr.w	ip, [r3], #4
 8002fdc:	f8d0 7004 	ldr.w	r7, [r0, #4]
 8002fe0:	fb2c 5c06 	smlad	ip, ip, r6, r5
 8002fe4:	f840 cb04 	str.w	ip, [r0], #4
 8002fe8:	fb24 7b16 	smladx	fp, r4, r6, r7
 8002fec:	f840 bb04 	str.w	fp, [r0], #4
 8002ff0:	f1be 0e01 	subs.w	lr, lr, #1
 8002ff4:	f47f afd8 	bne.w	8002fa8 <basemul_asm_acc_opt_32_32+0x8>
 8002ff8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

08002ffc <basemul_asm_acc_opt_32_16>:
 8002ffc:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8003000:	f646 0908 	movw	r9, #26632	@ 0x6808
 8003004:	f6c0 5801 	movt	r8, #3329	@ 0xd01
 8003008:	f24f 3a01 	movw	sl, #62209	@ 0xf301
 800300c:	f6c6 3aa8 	movt	sl, #27560	@ 0x6ba8
 8003010:	f8dd b024 	ldr.w	fp, [sp, #36]	@ 0x24
 8003014:	f240 0e40 	movw	lr, #64	@ 0x40
 8003018:	f851 4b04 	ldr.w	r4, [r1], #4
 800301c:	f852 6b04 	ldr.w	r6, [r2], #4
 8003020:	f85b 5b04 	ldr.w	r5, [fp], #4
 8003024:	f853 cb04 	ldr.w	ip, [r3], #4
 8003028:	f85b 7b04 	ldr.w	r7, [fp], #4
 800302c:	fb2c 5506 	smlad	r5, ip, r6, r5
 8003030:	fb05 f50a 	mul.w	r5, r5, sl
 8003034:	fb15 9538 	smlatt	r5, r5, r8, r9
 8003038:	fb24 7716 	smladx	r7, r4, r6, r7
 800303c:	fb07 f70a 	mul.w	r7, r7, sl
 8003040:	fb17 9738 	smlatt	r7, r7, r8, r9
 8003044:	eac7 4525 	pkhtb	r5, r7, r5, asr #16
 8003048:	f840 5b04 	str.w	r5, [r0], #4
 800304c:	f851 4b04 	ldr.w	r4, [r1], #4
 8003050:	f852 6b04 	ldr.w	r6, [r2], #4
 8003054:	f85b 5b04 	ldr.w	r5, [fp], #4
 8003058:	f853 cb04 	ldr.w	ip, [r3], #4
 800305c:	f85b 7b04 	ldr.w	r7, [fp], #4
 8003060:	fb2c 5506 	smlad	r5, ip, r6, r5
 8003064:	fb05 f50a 	mul.w	r5, r5, sl
 8003068:	fb15 9538 	smlatt	r5, r5, r8, r9
 800306c:	fb24 7716 	smladx	r7, r4, r6, r7
 8003070:	fb07 f70a 	mul.w	r7, r7, sl
 8003074:	fb17 9738 	smlatt	r7, r7, r8, r9
 8003078:	eac7 4525 	pkhtb	r5, r7, r5, asr #16
 800307c:	f840 5b04 	str.w	r5, [r0], #4
 8003080:	f1be 0e01 	subs.w	lr, lr, #1
 8003084:	f47f afc8 	bne.w	8003018 <basemul_asm_acc_opt_32_16+0x1c>
 8003088:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

0800308c <invntt_fast>:
 800308c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8003090:	ed2d 8a08 	vpush	{s16-s23}
 8003094:	f6c0 5c01 	movt	ip, #3329	@ 0xd01
 8003098:	ecb1 4a0f 	vldmia	r1!, {s8-s22}
 800309c:	f500 7e00 	add.w	lr, r0, #512	@ 0x200
 80030a0:	ee04 ea10 	vmov	s8, lr
 80030a4:	ee0b 0a90 	vmov	s23, r0
 80030a8:	f8d0 2020 	ldr.w	r2, [r0, #32]
 80030ac:	f8d0 3024 	ldr.w	r3, [r0, #36]	@ 0x24
 80030b0:	f8d0 4028 	ldr.w	r4, [r0, #40]	@ 0x28
 80030b4:	f8d0 502c 	ldr.w	r5, [r0, #44]	@ 0x2c
 80030b8:	f8d0 6030 	ldr.w	r6, [r0, #48]	@ 0x30
 80030bc:	f8d0 7034 	ldr.w	r7, [r0, #52]	@ 0x34
 80030c0:	f8d0 8038 	ldr.w	r8, [r0, #56]	@ 0x38
 80030c4:	f8d0 903c 	ldr.w	r9, [r0, #60]	@ 0x3c
 80030c8:	f646 0008 	movw	r0, #26632	@ 0x6808
 80030cc:	fa92 fe03 	sadd16	lr, r2, r3
 80030d0:	fad2 f303 	ssub16	r3, r2, r3
 80030d4:	fa94 fb05 	sadd16	fp, r4, r5
 80030d8:	fad4 f505 	ssub16	r5, r4, r5
 80030dc:	fa96 f207 	sadd16	r2, r6, r7
 80030e0:	fad6 f707 	ssub16	r7, r6, r7
 80030e4:	fa98 f409 	sadd16	r4, r8, r9
 80030e8:	fad8 f909 	ssub16	r9, r8, r9
 80030ec:	fa9e f80b 	sadd16	r8, lr, fp
 80030f0:	fade fb0b 	ssub16	fp, lr, fp
 80030f4:	fa92 f604 	sadd16	r6, r2, r4
 80030f8:	fad2 f404 	ssub16	r4, r2, r4
 80030fc:	ee15 aa10 	vmov	sl, s10
 8003100:	fb3a fe05 	smulwb	lr, sl, r5
 8003104:	fb3a f515 	smulwt	r5, sl, r5
 8003108:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 800310c:	fb15 051c 	smlabt	r5, r5, ip, r0
 8003110:	eac5 4e2e 	pkhtb	lr, r5, lr, asr #16
 8003114:	fad3 f54e 	usub16	r5, r3, lr
 8003118:	fa93 f34e 	uadd16	r3, r3, lr
 800311c:	fb3a fe09 	smulwb	lr, sl, r9
 8003120:	fb3a f919 	smulwt	r9, sl, r9
 8003124:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003128:	fb19 091c 	smlabt	r9, r9, ip, r0
 800312c:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 8003130:	fad7 f94e 	usub16	r9, r7, lr
 8003134:	fa97 f74e 	uadd16	r7, r7, lr
 8003138:	fa98 f206 	sadd16	r2, r8, r6
 800313c:	fad8 f606 	ssub16	r6, r8, r6
 8003140:	ee16 aa10 	vmov	sl, s12
 8003144:	fb3a fe07 	smulwb	lr, sl, r7
 8003148:	fb3a f717 	smulwt	r7, sl, r7
 800314c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003150:	fb17 071c 	smlabt	r7, r7, ip, r0
 8003154:	eac7 4e2e 	pkhtb	lr, r7, lr, asr #16
 8003158:	fad3 f74e 	usub16	r7, r3, lr
 800315c:	fa93 f34e 	uadd16	r3, r3, lr
 8003160:	ee16 aa90 	vmov	sl, s13
 8003164:	fb3a fe04 	smulwb	lr, sl, r4
 8003168:	fb3a f414 	smulwt	r4, sl, r4
 800316c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003170:	fb14 041c 	smlabt	r4, r4, ip, r0
 8003174:	eac4 4e2e 	pkhtb	lr, r4, lr, asr #16
 8003178:	fadb f80e 	ssub16	r8, fp, lr
 800317c:	fa9b f40e 	sadd16	r4, fp, lr
 8003180:	ee17 aa10 	vmov	sl, s14
 8003184:	fb3a fe09 	smulwb	lr, sl, r9
 8003188:	fb3a f919 	smulwt	r9, sl, r9
 800318c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003190:	fb19 091c 	smlabt	r9, r9, ip, r0
 8003194:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 8003198:	fad5 f94e 	usub16	r9, r5, lr
 800319c:	fa95 f54e 	uadd16	r5, r5, lr
 80031a0:	ee18 ba10 	vmov	fp, s16
 80031a4:	fb3b fe03 	smulwb	lr, fp, r3
 80031a8:	fb3b f313 	smulwt	r3, fp, r3
 80031ac:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80031b0:	fb13 031c 	smlabt	r3, r3, ip, r0
 80031b4:	eac3 432e 	pkhtb	r3, r3, lr, asr #16
 80031b8:	ee18 aa90 	vmov	sl, s17
 80031bc:	ee19 ba10 	vmov	fp, s18
 80031c0:	fb3a fe04 	smulwb	lr, sl, r4
 80031c4:	fb3a f414 	smulwt	r4, sl, r4
 80031c8:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80031cc:	fb14 041c 	smlabt	r4, r4, ip, r0
 80031d0:	eac4 442e 	pkhtb	r4, r4, lr, asr #16
 80031d4:	fb3b fe05 	smulwb	lr, fp, r5
 80031d8:	fb3b f515 	smulwt	r5, fp, r5
 80031dc:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80031e0:	fb15 051c 	smlabt	r5, r5, ip, r0
 80031e4:	eac5 452e 	pkhtb	r5, r5, lr, asr #16
 80031e8:	ee19 aa90 	vmov	sl, s19
 80031ec:	ee1a ba10 	vmov	fp, s20
 80031f0:	fb3a fe06 	smulwb	lr, sl, r6
 80031f4:	fb3a f616 	smulwt	r6, sl, r6
 80031f8:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80031fc:	fb16 061c 	smlabt	r6, r6, ip, r0
 8003200:	eac6 462e 	pkhtb	r6, r6, lr, asr #16
 8003204:	fb3b fe07 	smulwb	lr, fp, r7
 8003208:	fb3b f717 	smulwt	r7, fp, r7
 800320c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003210:	fb17 071c 	smlabt	r7, r7, ip, r0
 8003214:	eac7 472e 	pkhtb	r7, r7, lr, asr #16
 8003218:	ee1a aa90 	vmov	sl, s21
 800321c:	ee1b ba10 	vmov	fp, s22
 8003220:	fb3a fe08 	smulwb	lr, sl, r8
 8003224:	fb3a f818 	smulwt	r8, sl, r8
 8003228:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 800322c:	fb18 081c 	smlabt	r8, r8, ip, r0
 8003230:	eac8 482e 	pkhtb	r8, r8, lr, asr #16
 8003234:	fb3b fe09 	smulwb	lr, fp, r9
 8003238:	fb3b f919 	smulwt	r9, fp, r9
 800323c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003240:	fb19 091c 	smlabt	r9, r9, ip, r0
 8003244:	eac9 492e 	pkhtb	r9, r9, lr, asr #16
 8003248:	ee00 2a10 	vmov	s0, r2
 800324c:	ee00 3a90 	vmov	s1, r3
 8003250:	ee01 4a10 	vmov	s2, r4
 8003254:	ee01 5a90 	vmov	s3, r5
 8003258:	ee02 6a10 	vmov	s4, r6
 800325c:	ee02 7a90 	vmov	s5, r7
 8003260:	ee03 8a10 	vmov	s6, r8
 8003264:	ee03 9a90 	vmov	s7, r9
 8003268:	ee1b 0a90 	vmov	r0, s23
 800326c:	f8d0 2000 	ldr.w	r2, [r0]
 8003270:	f8d0 3004 	ldr.w	r3, [r0, #4]
 8003274:	f8d0 4008 	ldr.w	r4, [r0, #8]
 8003278:	f8d0 500c 	ldr.w	r5, [r0, #12]
 800327c:	f8d0 6010 	ldr.w	r6, [r0, #16]
 8003280:	f8d0 7014 	ldr.w	r7, [r0, #20]
 8003284:	f8d0 8018 	ldr.w	r8, [r0, #24]
 8003288:	f8d0 901c 	ldr.w	r9, [r0, #28]
 800328c:	f646 0008 	movw	r0, #26632	@ 0x6808
 8003290:	fa92 fe03 	sadd16	lr, r2, r3
 8003294:	fad2 f303 	ssub16	r3, r2, r3
 8003298:	fa94 fb05 	sadd16	fp, r4, r5
 800329c:	fad4 f505 	ssub16	r5, r4, r5
 80032a0:	fa96 f207 	sadd16	r2, r6, r7
 80032a4:	fad6 f707 	ssub16	r7, r6, r7
 80032a8:	fa98 f409 	sadd16	r4, r8, r9
 80032ac:	fad8 f909 	ssub16	r9, r8, r9
 80032b0:	fa9e f80b 	sadd16	r8, lr, fp
 80032b4:	fade fb0b 	ssub16	fp, lr, fp
 80032b8:	fa92 f604 	sadd16	r6, r2, r4
 80032bc:	fad2 f404 	ssub16	r4, r2, r4
 80032c0:	ee15 aa10 	vmov	sl, s10
 80032c4:	fb3a fe05 	smulwb	lr, sl, r5
 80032c8:	fb3a f515 	smulwt	r5, sl, r5
 80032cc:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80032d0:	fb15 051c 	smlabt	r5, r5, ip, r0
 80032d4:	eac5 4e2e 	pkhtb	lr, r5, lr, asr #16
 80032d8:	fad3 f54e 	usub16	r5, r3, lr
 80032dc:	fa93 f34e 	uadd16	r3, r3, lr
 80032e0:	fb3a fe09 	smulwb	lr, sl, r9
 80032e4:	fb3a f919 	smulwt	r9, sl, r9
 80032e8:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80032ec:	fb19 091c 	smlabt	r9, r9, ip, r0
 80032f0:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 80032f4:	fad7 f94e 	usub16	r9, r7, lr
 80032f8:	fa97 f74e 	uadd16	r7, r7, lr
 80032fc:	fa98 f206 	sadd16	r2, r8, r6
 8003300:	fad8 f606 	ssub16	r6, r8, r6
 8003304:	ee16 aa10 	vmov	sl, s12
 8003308:	fb3a fe07 	smulwb	lr, sl, r7
 800330c:	fb3a f717 	smulwt	r7, sl, r7
 8003310:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003314:	fb17 071c 	smlabt	r7, r7, ip, r0
 8003318:	eac7 4e2e 	pkhtb	lr, r7, lr, asr #16
 800331c:	fad3 f74e 	usub16	r7, r3, lr
 8003320:	fa93 f34e 	uadd16	r3, r3, lr
 8003324:	ee16 aa90 	vmov	sl, s13
 8003328:	fb3a fe04 	smulwb	lr, sl, r4
 800332c:	fb3a f414 	smulwt	r4, sl, r4
 8003330:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003334:	fb14 041c 	smlabt	r4, r4, ip, r0
 8003338:	eac4 4e2e 	pkhtb	lr, r4, lr, asr #16
 800333c:	fadb f80e 	ssub16	r8, fp, lr
 8003340:	fa9b f40e 	sadd16	r4, fp, lr
 8003344:	ee17 aa10 	vmov	sl, s14
 8003348:	fb3a fe09 	smulwb	lr, sl, r9
 800334c:	fb3a f919 	smulwt	r9, sl, r9
 8003350:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003354:	fb19 091c 	smlabt	r9, r9, ip, r0
 8003358:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 800335c:	fad5 f94e 	usub16	r9, r5, lr
 8003360:	fa95 f54e 	uadd16	r5, r5, lr
 8003364:	ee1b 0a90 	vmov	r0, s23
 8003368:	ee10 ba90 	vmov	fp, s1
 800336c:	fa93 fe4b 	uadd16	lr, r3, fp
 8003370:	fad3 f34b 	usub16	r3, r3, fp
 8003374:	f8c0 e004 	str.w	lr, [r0, #4]
 8003378:	f8c0 3024 	str.w	r3, [r0, #36]	@ 0x24
 800337c:	ee11 ba90 	vmov	fp, s3
 8003380:	fa95 fe4b 	uadd16	lr, r5, fp
 8003384:	fad5 f54b 	usub16	r5, r5, fp
 8003388:	f8c0 e00c 	str.w	lr, [r0, #12]
 800338c:	f8c0 502c 	str.w	r5, [r0, #44]	@ 0x2c
 8003390:	ee12 ba90 	vmov	fp, s5
 8003394:	fa97 fe4b 	uadd16	lr, r7, fp
 8003398:	fad7 f74b 	usub16	r7, r7, fp
 800339c:	f8c0 e014 	str.w	lr, [r0, #20]
 80033a0:	f8c0 7034 	str.w	r7, [r0, #52]	@ 0x34
 80033a4:	ee13 ba90 	vmov	fp, s7
 80033a8:	fa99 fe4b 	uadd16	lr, r9, fp
 80033ac:	fad9 f94b 	usub16	r9, r9, fp
 80033b0:	f8c0 e01c 	str.w	lr, [r0, #28]
 80033b4:	f8c0 903c 	str.w	r9, [r0, #60]	@ 0x3c
 80033b8:	ee11 5a10 	vmov	r5, s2
 80033bc:	fa94 fe45 	uadd16	lr, r4, r5
 80033c0:	fad4 fb45 	usub16	fp, r4, r5
 80033c4:	f8c0 e008 	str.w	lr, [r0, #8]
 80033c8:	f8c0 b028 	str.w	fp, [r0, #40]	@ 0x28
 80033cc:	ee12 7a10 	vmov	r7, s4
 80033d0:	fa96 fe47 	uadd16	lr, r6, r7
 80033d4:	fad6 fb47 	usub16	fp, r6, r7
 80033d8:	f8c0 e010 	str.w	lr, [r0, #16]
 80033dc:	f8c0 b030 	str.w	fp, [r0, #48]	@ 0x30
 80033e0:	ee13 9a10 	vmov	r9, s6
 80033e4:	fa98 fe49 	uadd16	lr, r8, r9
 80033e8:	fad8 fb49 	usub16	fp, r8, r9
 80033ec:	f8c0 e018 	str.w	lr, [r0, #24]
 80033f0:	f8c0 b038 	str.w	fp, [r0, #56]	@ 0x38
 80033f4:	ee10 3a10 	vmov	r3, s0
 80033f8:	fa92 fe43 	uadd16	lr, r2, r3
 80033fc:	fad2 fb43 	usub16	fp, r2, r3
 8003400:	f8c0 b020 	str.w	fp, [r0, #32]
 8003404:	f840 eb40 	str.w	lr, [r0], #64
 8003408:	ee14 ea10 	vmov	lr, s8
 800340c:	ebb0 0f0e 	cmp.w	r0, lr
 8003410:	f47f ae48 	bne.w	80030a4 <invntt_fast+0x18>
 8003414:	f5a0 7000 	sub.w	r0, r0, #512	@ 0x200
 8003418:	ee03 0a10 	vmov	s6, r0
 800341c:	f8d0 2000 	ldr.w	r2, [r0]
 8003420:	f8d0 3040 	ldr.w	r3, [r0, #64]	@ 0x40
 8003424:	f8d0 4080 	ldr.w	r4, [r0, #128]	@ 0x80
 8003428:	f8d0 50c0 	ldr.w	r5, [r0, #192]	@ 0xc0
 800342c:	f8d0 6100 	ldr.w	r6, [r0, #256]	@ 0x100
 8003430:	f8d0 7140 	ldr.w	r7, [r0, #320]	@ 0x140
 8003434:	f8d0 8180 	ldr.w	r8, [r0, #384]	@ 0x180
 8003438:	f8d0 91c0 	ldr.w	r9, [r0, #448]	@ 0x1c0
 800343c:	ecb1 0a06 	vldmia	r1!, {s0-s5}
 8003440:	f646 0008 	movw	r0, #26632	@ 0x6808
 8003444:	f64a 7ab8 	movw	sl, #44984	@ 0xafb8
 8003448:	f2c0 0a13 	movt	sl, #19
 800344c:	fb3a fe02 	smulwb	lr, sl, r2
 8003450:	fb3a f212 	smulwt	r2, sl, r2
 8003454:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003458:	fb12 021c 	smlabt	r2, r2, ip, r0
 800345c:	eac2 422e 	pkhtb	r2, r2, lr, asr #16
 8003460:	fb3a fe03 	smulwb	lr, sl, r3
 8003464:	fb3a f313 	smulwt	r3, sl, r3
 8003468:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 800346c:	fb13 031c 	smlabt	r3, r3, ip, r0
 8003470:	eac3 432e 	pkhtb	r3, r3, lr, asr #16
 8003474:	fb3a fe04 	smulwb	lr, sl, r4
 8003478:	fb3a f414 	smulwt	r4, sl, r4
 800347c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003480:	fb14 041c 	smlabt	r4, r4, ip, r0
 8003484:	eac4 442e 	pkhtb	r4, r4, lr, asr #16
 8003488:	fb3a fe05 	smulwb	lr, sl, r5
 800348c:	fb3a f515 	smulwt	r5, sl, r5
 8003490:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003494:	fb15 051c 	smlabt	r5, r5, ip, r0
 8003498:	eac5 452e 	pkhtb	r5, r5, lr, asr #16
 800349c:	fb3a fe06 	smulwb	lr, sl, r6
 80034a0:	fb3a f616 	smulwt	r6, sl, r6
 80034a4:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80034a8:	fb16 061c 	smlabt	r6, r6, ip, r0
 80034ac:	eac6 462e 	pkhtb	r6, r6, lr, asr #16
 80034b0:	fb3a fe07 	smulwb	lr, sl, r7
 80034b4:	fb3a f717 	smulwt	r7, sl, r7
 80034b8:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80034bc:	fb17 071c 	smlabt	r7, r7, ip, r0
 80034c0:	eac7 472e 	pkhtb	r7, r7, lr, asr #16
 80034c4:	fb3a fe08 	smulwb	lr, sl, r8
 80034c8:	fb3a f818 	smulwt	r8, sl, r8
 80034cc:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80034d0:	fb18 081c 	smlabt	r8, r8, ip, r0
 80034d4:	eac8 482e 	pkhtb	r8, r8, lr, asr #16
 80034d8:	fb3a fe09 	smulwb	lr, sl, r9
 80034dc:	fb3a f919 	smulwt	r9, sl, r9
 80034e0:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80034e4:	fb19 091c 	smlabt	r9, r9, ip, r0
 80034e8:	eac9 492e 	pkhtb	r9, r9, lr, asr #16
 80034ec:	fa92 fe03 	sadd16	lr, r2, r3
 80034f0:	fad2 f303 	ssub16	r3, r2, r3
 80034f4:	fa94 fb05 	sadd16	fp, r4, r5
 80034f8:	fad4 f505 	ssub16	r5, r4, r5
 80034fc:	fa96 f207 	sadd16	r2, r6, r7
 8003500:	fad6 f707 	ssub16	r7, r6, r7
 8003504:	fa98 f409 	sadd16	r4, r8, r9
 8003508:	fad8 f909 	ssub16	r9, r8, r9
 800350c:	fa9e f80b 	sadd16	r8, lr, fp
 8003510:	fade fb0b 	ssub16	fp, lr, fp
 8003514:	fa92 f604 	sadd16	r6, r2, r4
 8003518:	fad2 f404 	ssub16	r4, r2, r4
 800351c:	ee10 aa90 	vmov	sl, s1
 8003520:	fb3a fe05 	smulwb	lr, sl, r5
 8003524:	fb3a f515 	smulwt	r5, sl, r5
 8003528:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 800352c:	fb15 051c 	smlabt	r5, r5, ip, r0
 8003530:	eac5 4e2e 	pkhtb	lr, r5, lr, asr #16
 8003534:	fad3 f54e 	usub16	r5, r3, lr
 8003538:	fa93 f34e 	uadd16	r3, r3, lr
 800353c:	fb3a fe09 	smulwb	lr, sl, r9
 8003540:	fb3a f919 	smulwt	r9, sl, r9
 8003544:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003548:	fb19 091c 	smlabt	r9, r9, ip, r0
 800354c:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 8003550:	fad7 f94e 	usub16	r9, r7, lr
 8003554:	fa97 f74e 	uadd16	r7, r7, lr
 8003558:	fa98 f206 	sadd16	r2, r8, r6
 800355c:	fad8 f606 	ssub16	r6, r8, r6
 8003560:	ee11 aa90 	vmov	sl, s3
 8003564:	fb3a fe07 	smulwb	lr, sl, r7
 8003568:	fb3a f717 	smulwt	r7, sl, r7
 800356c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003570:	fb17 071c 	smlabt	r7, r7, ip, r0
 8003574:	eac7 4e2e 	pkhtb	lr, r7, lr, asr #16
 8003578:	fad3 f74e 	usub16	r7, r3, lr
 800357c:	fa93 f34e 	uadd16	r3, r3, lr
 8003580:	ee12 aa10 	vmov	sl, s4
 8003584:	fb3a fe04 	smulwb	lr, sl, r4
 8003588:	fb3a f414 	smulwt	r4, sl, r4
 800358c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003590:	fb14 041c 	smlabt	r4, r4, ip, r0
 8003594:	eac4 4e2e 	pkhtb	lr, r4, lr, asr #16
 8003598:	fadb f80e 	ssub16	r8, fp, lr
 800359c:	fa9b f40e 	sadd16	r4, fp, lr
 80035a0:	ee12 aa90 	vmov	sl, s5
 80035a4:	fb3a fe09 	smulwb	lr, sl, r9
 80035a8:	fb3a f919 	smulwt	r9, sl, r9
 80035ac:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80035b0:	fb19 091c 	smlabt	r9, r9, ip, r0
 80035b4:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 80035b8:	fad5 f94e 	usub16	r9, r5, lr
 80035bc:	fa95 f54e 	uadd16	r5, r5, lr
 80035c0:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 80035c4:	fb3a fe02 	smulwb	lr, sl, r2
 80035c8:	fb3a f212 	smulwt	r2, sl, r2
 80035cc:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80035d0:	fb12 021c 	smlabt	r2, r2, ip, r0
 80035d4:	eac2 422e 	pkhtb	r2, r2, lr, asr #16
 80035d8:	fb3b fe03 	smulwb	lr, fp, r3
 80035dc:	fb3b f313 	smulwt	r3, fp, r3
 80035e0:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80035e4:	fb13 031c 	smlabt	r3, r3, ip, r0
 80035e8:	eac3 432e 	pkhtb	r3, r3, lr, asr #16
 80035ec:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 80035f0:	fb3a fe04 	smulwb	lr, sl, r4
 80035f4:	fb3a f414 	smulwt	r4, sl, r4
 80035f8:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80035fc:	fb14 041c 	smlabt	r4, r4, ip, r0
 8003600:	eac4 442e 	pkhtb	r4, r4, lr, asr #16
 8003604:	fb3b fe05 	smulwb	lr, fp, r5
 8003608:	fb3b f515 	smulwt	r5, fp, r5
 800360c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003610:	fb15 051c 	smlabt	r5, r5, ip, r0
 8003614:	eac5 452e 	pkhtb	r5, r5, lr, asr #16
 8003618:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 800361c:	fb3a fe06 	smulwb	lr, sl, r6
 8003620:	fb3a f616 	smulwt	r6, sl, r6
 8003624:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003628:	fb16 061c 	smlabt	r6, r6, ip, r0
 800362c:	eac6 462e 	pkhtb	r6, r6, lr, asr #16
 8003630:	fb3b fe07 	smulwb	lr, fp, r7
 8003634:	fb3b f717 	smulwt	r7, fp, r7
 8003638:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 800363c:	fb17 071c 	smlabt	r7, r7, ip, r0
 8003640:	eac7 472e 	pkhtb	r7, r7, lr, asr #16
 8003644:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 8003648:	fb3a fe08 	smulwb	lr, sl, r8
 800364c:	fb3a f818 	smulwt	r8, sl, r8
 8003650:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003654:	fb18 081c 	smlabt	r8, r8, ip, r0
 8003658:	eac8 482e 	pkhtb	r8, r8, lr, asr #16
 800365c:	fb3b fe09 	smulwb	lr, fp, r9
 8003660:	fb3b f919 	smulwt	r9, fp, r9
 8003664:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003668:	fb19 091c 	smlabt	r9, r9, ip, r0
 800366c:	eac9 492e 	pkhtb	r9, r9, lr, asr #16
 8003670:	ee13 0a10 	vmov	r0, s6
 8003674:	f8c0 6100 	str.w	r6, [r0, #256]	@ 0x100
 8003678:	f8c0 7140 	str.w	r7, [r0, #320]	@ 0x140
 800367c:	f8c0 8180 	str.w	r8, [r0, #384]	@ 0x180
 8003680:	f8c0 91c0 	str.w	r9, [r0, #448]	@ 0x1c0
 8003684:	f8c0 3040 	str.w	r3, [r0, #64]	@ 0x40
 8003688:	f8c0 4080 	str.w	r4, [r0, #128]	@ 0x80
 800368c:	f8c0 50c0 	str.w	r5, [r0, #192]	@ 0xc0
 8003690:	f840 2b04 	str.w	r2, [r0], #4
 8003694:	f100 0e3c 	add.w	lr, r0, #60	@ 0x3c
 8003698:	ee07 ea10 	vmov	s14, lr
 800369c:	ee03 0a10 	vmov	s6, r0
 80036a0:	f8d0 2000 	ldr.w	r2, [r0]
 80036a4:	f8d0 3040 	ldr.w	r3, [r0, #64]	@ 0x40
 80036a8:	f8d0 4080 	ldr.w	r4, [r0, #128]	@ 0x80
 80036ac:	f8d0 50c0 	ldr.w	r5, [r0, #192]	@ 0xc0
 80036b0:	f8d0 6100 	ldr.w	r6, [r0, #256]	@ 0x100
 80036b4:	f8d0 7140 	ldr.w	r7, [r0, #320]	@ 0x140
 80036b8:	f8d0 8180 	ldr.w	r8, [r0, #384]	@ 0x180
 80036bc:	f8d0 91c0 	ldr.w	r9, [r0, #448]	@ 0x1c0
 80036c0:	f646 0008 	movw	r0, #26632	@ 0x6808
 80036c4:	f851 ab04 	ldr.w	sl, [r1], #4
 80036c8:	fb3a fe03 	smulwb	lr, sl, r3
 80036cc:	fb3a f313 	smulwt	r3, sl, r3
 80036d0:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80036d4:	fb13 031c 	smlabt	r3, r3, ip, r0
 80036d8:	eac3 4e2e 	pkhtb	lr, r3, lr, asr #16
 80036dc:	fad2 f34e 	usub16	r3, r2, lr
 80036e0:	fa92 f24e 	uadd16	r2, r2, lr
 80036e4:	fb3a fe05 	smulwb	lr, sl, r5
 80036e8:	fb3a f515 	smulwt	r5, sl, r5
 80036ec:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80036f0:	fb15 051c 	smlabt	r5, r5, ip, r0
 80036f4:	eac5 4e2e 	pkhtb	lr, r5, lr, asr #16
 80036f8:	fad4 f54e 	usub16	r5, r4, lr
 80036fc:	fa94 f44e 	uadd16	r4, r4, lr
 8003700:	fb3a fe07 	smulwb	lr, sl, r7
 8003704:	fb3a f717 	smulwt	r7, sl, r7
 8003708:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 800370c:	fb17 071c 	smlabt	r7, r7, ip, r0
 8003710:	eac7 4e2e 	pkhtb	lr, r7, lr, asr #16
 8003714:	fad6 f74e 	usub16	r7, r6, lr
 8003718:	fa96 f64e 	uadd16	r6, r6, lr
 800371c:	fb3a fe09 	smulwb	lr, sl, r9
 8003720:	fb3a f919 	smulwt	r9, sl, r9
 8003724:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003728:	fb19 091c 	smlabt	r9, r9, ip, r0
 800372c:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 8003730:	fad8 f94e 	usub16	r9, r8, lr
 8003734:	fa98 f84e 	uadd16	r8, r8, lr
 8003738:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 800373c:	fb3a fe04 	smulwb	lr, sl, r4
 8003740:	fb3a f414 	smulwt	r4, sl, r4
 8003744:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003748:	fb14 041c 	smlabt	r4, r4, ip, r0
 800374c:	eac4 4e2e 	pkhtb	lr, r4, lr, asr #16
 8003750:	fad2 f44e 	usub16	r4, r2, lr
 8003754:	fa92 f24e 	uadd16	r2, r2, lr
 8003758:	fb3b fe05 	smulwb	lr, fp, r5
 800375c:	fb3b f515 	smulwt	r5, fp, r5
 8003760:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003764:	fb15 051c 	smlabt	r5, r5, ip, r0
 8003768:	eac5 4e2e 	pkhtb	lr, r5, lr, asr #16
 800376c:	fad3 f54e 	usub16	r5, r3, lr
 8003770:	fa93 f34e 	uadd16	r3, r3, lr
 8003774:	fb3a fe08 	smulwb	lr, sl, r8
 8003778:	fb3a f818 	smulwt	r8, sl, r8
 800377c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003780:	fb18 081c 	smlabt	r8, r8, ip, r0
 8003784:	eac8 4e2e 	pkhtb	lr, r8, lr, asr #16
 8003788:	fad6 f84e 	usub16	r8, r6, lr
 800378c:	fa96 f64e 	uadd16	r6, r6, lr
 8003790:	fb3b fe09 	smulwb	lr, fp, r9
 8003794:	fb3b f919 	smulwt	r9, fp, r9
 8003798:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 800379c:	fb19 091c 	smlabt	r9, r9, ip, r0
 80037a0:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 80037a4:	fad7 f94e 	usub16	r9, r7, lr
 80037a8:	fa97 f74e 	uadd16	r7, r7, lr
 80037ac:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 80037b0:	fb3a fe06 	smulwb	lr, sl, r6
 80037b4:	fb3a f616 	smulwt	r6, sl, r6
 80037b8:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80037bc:	fb16 061c 	smlabt	r6, r6, ip, r0
 80037c0:	eac6 4e2e 	pkhtb	lr, r6, lr, asr #16
 80037c4:	fad2 f64e 	usub16	r6, r2, lr
 80037c8:	fa92 f24e 	uadd16	r2, r2, lr
 80037cc:	fb3b fe07 	smulwb	lr, fp, r7
 80037d0:	fb3b f717 	smulwt	r7, fp, r7
 80037d4:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80037d8:	fb17 071c 	smlabt	r7, r7, ip, r0
 80037dc:	eac7 4e2e 	pkhtb	lr, r7, lr, asr #16
 80037e0:	fad3 f74e 	usub16	r7, r3, lr
 80037e4:	fa93 f34e 	uadd16	r3, r3, lr
 80037e8:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 80037ec:	fb3a fe08 	smulwb	lr, sl, r8
 80037f0:	fb3a f818 	smulwt	r8, sl, r8
 80037f4:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80037f8:	fb18 081c 	smlabt	r8, r8, ip, r0
 80037fc:	eac8 4e2e 	pkhtb	lr, r8, lr, asr #16
 8003800:	fad4 f84e 	usub16	r8, r4, lr
 8003804:	fa94 f44e 	uadd16	r4, r4, lr
 8003808:	fb3b fe09 	smulwb	lr, fp, r9
 800380c:	fb3b f919 	smulwt	r9, fp, r9
 8003810:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003814:	fb19 091c 	smlabt	r9, r9, ip, r0
 8003818:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 800381c:	fad5 f94e 	usub16	r9, r5, lr
 8003820:	fa95 f54e 	uadd16	r5, r5, lr
 8003824:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 8003828:	fb3a fe02 	smulwb	lr, sl, r2
 800382c:	fb3a f212 	smulwt	r2, sl, r2
 8003830:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003834:	fb12 021c 	smlabt	r2, r2, ip, r0
 8003838:	eac2 422e 	pkhtb	r2, r2, lr, asr #16
 800383c:	fb3b fe03 	smulwb	lr, fp, r3
 8003840:	fb3b f313 	smulwt	r3, fp, r3
 8003844:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003848:	fb13 031c 	smlabt	r3, r3, ip, r0
 800384c:	eac3 432e 	pkhtb	r3, r3, lr, asr #16
 8003850:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 8003854:	fb3a fe04 	smulwb	lr, sl, r4
 8003858:	fb3a f414 	smulwt	r4, sl, r4
 800385c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003860:	fb14 041c 	smlabt	r4, r4, ip, r0
 8003864:	eac4 442e 	pkhtb	r4, r4, lr, asr #16
 8003868:	fb3b fe05 	smulwb	lr, fp, r5
 800386c:	fb3b f515 	smulwt	r5, fp, r5
 8003870:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003874:	fb15 051c 	smlabt	r5, r5, ip, r0
 8003878:	eac5 452e 	pkhtb	r5, r5, lr, asr #16
 800387c:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 8003880:	fb3a fe06 	smulwb	lr, sl, r6
 8003884:	fb3a f616 	smulwt	r6, sl, r6
 8003888:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 800388c:	fb16 061c 	smlabt	r6, r6, ip, r0
 8003890:	eac6 462e 	pkhtb	r6, r6, lr, asr #16
 8003894:	fb3b fe07 	smulwb	lr, fp, r7
 8003898:	fb3b f717 	smulwt	r7, fp, r7
 800389c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80038a0:	fb17 071c 	smlabt	r7, r7, ip, r0
 80038a4:	eac7 472e 	pkhtb	r7, r7, lr, asr #16
 80038a8:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 80038ac:	fb3a fe08 	smulwb	lr, sl, r8
 80038b0:	fb3a f818 	smulwt	r8, sl, r8
 80038b4:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80038b8:	fb18 081c 	smlabt	r8, r8, ip, r0
 80038bc:	eac8 482e 	pkhtb	r8, r8, lr, asr #16
 80038c0:	fb3b fe09 	smulwb	lr, fp, r9
 80038c4:	fb3b f919 	smulwt	r9, fp, r9
 80038c8:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80038cc:	fb19 091c 	smlabt	r9, r9, ip, r0
 80038d0:	eac9 492e 	pkhtb	r9, r9, lr, asr #16
 80038d4:	ee13 0a10 	vmov	r0, s6
 80038d8:	f8c0 6100 	str.w	r6, [r0, #256]	@ 0x100
 80038dc:	f8c0 7140 	str.w	r7, [r0, #320]	@ 0x140
 80038e0:	f8c0 8180 	str.w	r8, [r0, #384]	@ 0x180
 80038e4:	f8c0 91c0 	str.w	r9, [r0, #448]	@ 0x1c0
 80038e8:	f8c0 3040 	str.w	r3, [r0, #64]	@ 0x40
 80038ec:	f8c0 4080 	str.w	r4, [r0, #128]	@ 0x80
 80038f0:	f8c0 50c0 	str.w	r5, [r0, #192]	@ 0xc0
 80038f4:	f840 2b04 	str.w	r2, [r0], #4
 80038f8:	ee17 ea10 	vmov	lr, s14
 80038fc:	ebb0 0f0e 	cmp.w	r0, lr
 8003900:	f47f aecc 	bne.w	800369c <invntt_fast+0x610>
 8003904:	ecbd 8a08 	vpop	{s16-s23}
 8003908:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

0800390c <ntt_fast>:
 800390c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8003910:	ed2d 8a09 	vpush	{s16-s24}
 8003914:	f6c0 5c01 	movt	ip, #3329	@ 0xd01
 8003918:	ecb1 4a0f 	vldmia	r1!, {s8-s22}
 800391c:	f100 0e20 	add.w	lr, r0, #32
 8003920:	ee0c ea10 	vmov	s24, lr
 8003924:	ee0b 0a90 	vmov	s23, r0
 8003928:	f8d0 2020 	ldr.w	r2, [r0, #32]
 800392c:	f8d0 3060 	ldr.w	r3, [r0, #96]	@ 0x60
 8003930:	f8d0 40a0 	ldr.w	r4, [r0, #160]	@ 0xa0
 8003934:	f8d0 50e0 	ldr.w	r5, [r0, #224]	@ 0xe0
 8003938:	f8d0 6120 	ldr.w	r6, [r0, #288]	@ 0x120
 800393c:	f8d0 7160 	ldr.w	r7, [r0, #352]	@ 0x160
 8003940:	f8d0 81a0 	ldr.w	r8, [r0, #416]	@ 0x1a0
 8003944:	f8d0 91e0 	ldr.w	r9, [r0, #480]	@ 0x1e0
 8003948:	f646 0008 	movw	r0, #26632	@ 0x6808
 800394c:	ee14 aa10 	vmov	sl, s8
 8003950:	fb3a fe06 	smulwb	lr, sl, r6
 8003954:	fb3a f616 	smulwt	r6, sl, r6
 8003958:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 800395c:	fb16 061c 	smlabt	r6, r6, ip, r0
 8003960:	eac6 4e2e 	pkhtb	lr, r6, lr, asr #16
 8003964:	fad2 f64e 	usub16	r6, r2, lr
 8003968:	fa92 f24e 	uadd16	r2, r2, lr
 800396c:	fb3a fe07 	smulwb	lr, sl, r7
 8003970:	fb3a f717 	smulwt	r7, sl, r7
 8003974:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003978:	fb17 071c 	smlabt	r7, r7, ip, r0
 800397c:	eac7 4e2e 	pkhtb	lr, r7, lr, asr #16
 8003980:	fad3 f74e 	usub16	r7, r3, lr
 8003984:	fa93 f34e 	uadd16	r3, r3, lr
 8003988:	fb3a fe08 	smulwb	lr, sl, r8
 800398c:	fb3a f818 	smulwt	r8, sl, r8
 8003990:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003994:	fb18 081c 	smlabt	r8, r8, ip, r0
 8003998:	eac8 4e2e 	pkhtb	lr, r8, lr, asr #16
 800399c:	fad4 f84e 	usub16	r8, r4, lr
 80039a0:	fa94 f44e 	uadd16	r4, r4, lr
 80039a4:	fb3a fe09 	smulwb	lr, sl, r9
 80039a8:	fb3a f919 	smulwt	r9, sl, r9
 80039ac:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80039b0:	fb19 091c 	smlabt	r9, r9, ip, r0
 80039b4:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 80039b8:	fad5 f94e 	usub16	r9, r5, lr
 80039bc:	fa95 f54e 	uadd16	r5, r5, lr
 80039c0:	ee14 aa90 	vmov	sl, s9
 80039c4:	ee15 ba10 	vmov	fp, s10
 80039c8:	fb3a fe04 	smulwb	lr, sl, r4
 80039cc:	fb3a f414 	smulwt	r4, sl, r4
 80039d0:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80039d4:	fb14 041c 	smlabt	r4, r4, ip, r0
 80039d8:	eac4 4e2e 	pkhtb	lr, r4, lr, asr #16
 80039dc:	fad2 f44e 	usub16	r4, r2, lr
 80039e0:	fa92 f24e 	uadd16	r2, r2, lr
 80039e4:	fb3a fe05 	smulwb	lr, sl, r5
 80039e8:	fb3a f515 	smulwt	r5, sl, r5
 80039ec:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 80039f0:	fb15 051c 	smlabt	r5, r5, ip, r0
 80039f4:	eac5 4e2e 	pkhtb	lr, r5, lr, asr #16
 80039f8:	fad3 f54e 	usub16	r5, r3, lr
 80039fc:	fa93 f34e 	uadd16	r3, r3, lr
 8003a00:	fb3b fe08 	smulwb	lr, fp, r8
 8003a04:	fb3b f818 	smulwt	r8, fp, r8
 8003a08:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003a0c:	fb18 081c 	smlabt	r8, r8, ip, r0
 8003a10:	eac8 4e2e 	pkhtb	lr, r8, lr, asr #16
 8003a14:	fad6 f84e 	usub16	r8, r6, lr
 8003a18:	fa96 f64e 	uadd16	r6, r6, lr
 8003a1c:	fb3b fe09 	smulwb	lr, fp, r9
 8003a20:	fb3b f919 	smulwt	r9, fp, r9
 8003a24:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003a28:	fb19 091c 	smlabt	r9, r9, ip, r0
 8003a2c:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 8003a30:	fad7 f94e 	usub16	r9, r7, lr
 8003a34:	fa97 f74e 	uadd16	r7, r7, lr
 8003a38:	ee15 aa90 	vmov	sl, s11
 8003a3c:	ee16 ba10 	vmov	fp, s12
 8003a40:	fb3a fe03 	smulwb	lr, sl, r3
 8003a44:	fb3a f313 	smulwt	r3, sl, r3
 8003a48:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003a4c:	fb13 031c 	smlabt	r3, r3, ip, r0
 8003a50:	eac3 4e2e 	pkhtb	lr, r3, lr, asr #16
 8003a54:	fad2 f34e 	usub16	r3, r2, lr
 8003a58:	fa92 f24e 	uadd16	r2, r2, lr
 8003a5c:	fb3b fe05 	smulwb	lr, fp, r5
 8003a60:	fb3b f515 	smulwt	r5, fp, r5
 8003a64:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003a68:	fb15 051c 	smlabt	r5, r5, ip, r0
 8003a6c:	eac5 4e2e 	pkhtb	lr, r5, lr, asr #16
 8003a70:	fad4 f54e 	usub16	r5, r4, lr
 8003a74:	fa94 f44e 	uadd16	r4, r4, lr
 8003a78:	ee16 aa90 	vmov	sl, s13
 8003a7c:	ee17 ba10 	vmov	fp, s14
 8003a80:	fb3a fe07 	smulwb	lr, sl, r7
 8003a84:	fb3a f717 	smulwt	r7, sl, r7
 8003a88:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003a8c:	fb17 071c 	smlabt	r7, r7, ip, r0
 8003a90:	eac7 4e2e 	pkhtb	lr, r7, lr, asr #16
 8003a94:	fad6 f74e 	usub16	r7, r6, lr
 8003a98:	fa96 f64e 	uadd16	r6, r6, lr
 8003a9c:	fb3b fe09 	smulwb	lr, fp, r9
 8003aa0:	fb3b f919 	smulwt	r9, fp, r9
 8003aa4:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003aa8:	fb19 091c 	smlabt	r9, r9, ip, r0
 8003aac:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 8003ab0:	fad8 f94e 	usub16	r9, r8, lr
 8003ab4:	fa98 f84e 	uadd16	r8, r8, lr
 8003ab8:	ee17 aa90 	vmov	sl, s15
 8003abc:	ee18 ba10 	vmov	fp, s16
 8003ac0:	fb3a fe02 	smulwb	lr, sl, r2
 8003ac4:	fb3a f212 	smulwt	r2, sl, r2
 8003ac8:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003acc:	fb12 021c 	smlabt	r2, r2, ip, r0
 8003ad0:	eac2 422e 	pkhtb	r2, r2, lr, asr #16
 8003ad4:	fb3b fe03 	smulwb	lr, fp, r3
 8003ad8:	fb3b f313 	smulwt	r3, fp, r3
 8003adc:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003ae0:	fb13 031c 	smlabt	r3, r3, ip, r0
 8003ae4:	eac3 432e 	pkhtb	r3, r3, lr, asr #16
 8003ae8:	ee18 aa90 	vmov	sl, s17
 8003aec:	ee19 ba10 	vmov	fp, s18
 8003af0:	fb3a fe04 	smulwb	lr, sl, r4
 8003af4:	fb3a f414 	smulwt	r4, sl, r4
 8003af8:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003afc:	fb14 041c 	smlabt	r4, r4, ip, r0
 8003b00:	eac4 442e 	pkhtb	r4, r4, lr, asr #16
 8003b04:	fb3b fe05 	smulwb	lr, fp, r5
 8003b08:	fb3b f515 	smulwt	r5, fp, r5
 8003b0c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003b10:	fb15 051c 	smlabt	r5, r5, ip, r0
 8003b14:	eac5 452e 	pkhtb	r5, r5, lr, asr #16
 8003b18:	ee19 aa90 	vmov	sl, s19
 8003b1c:	ee1a ba10 	vmov	fp, s20
 8003b20:	fb3a fe06 	smulwb	lr, sl, r6
 8003b24:	fb3a f616 	smulwt	r6, sl, r6
 8003b28:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003b2c:	fb16 061c 	smlabt	r6, r6, ip, r0
 8003b30:	eac6 462e 	pkhtb	r6, r6, lr, asr #16
 8003b34:	fb3b fe07 	smulwb	lr, fp, r7
 8003b38:	fb3b f717 	smulwt	r7, fp, r7
 8003b3c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003b40:	fb17 071c 	smlabt	r7, r7, ip, r0
 8003b44:	eac7 472e 	pkhtb	r7, r7, lr, asr #16
 8003b48:	ee1a aa90 	vmov	sl, s21
 8003b4c:	ee1b ba10 	vmov	fp, s22
 8003b50:	fb3a fe08 	smulwb	lr, sl, r8
 8003b54:	fb3a f818 	smulwt	r8, sl, r8
 8003b58:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003b5c:	fb18 081c 	smlabt	r8, r8, ip, r0
 8003b60:	eac8 482e 	pkhtb	r8, r8, lr, asr #16
 8003b64:	fb3b fe09 	smulwb	lr, fp, r9
 8003b68:	fb3b f919 	smulwt	r9, fp, r9
 8003b6c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003b70:	fb19 091c 	smlabt	r9, r9, ip, r0
 8003b74:	eac9 492e 	pkhtb	r9, r9, lr, asr #16
 8003b78:	ee00 2a10 	vmov	s0, r2
 8003b7c:	ee00 3a90 	vmov	s1, r3
 8003b80:	ee01 4a10 	vmov	s2, r4
 8003b84:	ee01 5a90 	vmov	s3, r5
 8003b88:	ee02 6a10 	vmov	s4, r6
 8003b8c:	ee02 7a90 	vmov	s5, r7
 8003b90:	ee03 8a10 	vmov	s6, r8
 8003b94:	ee03 9a90 	vmov	s7, r9
 8003b98:	ee1b 0a90 	vmov	r0, s23
 8003b9c:	f8d0 2000 	ldr.w	r2, [r0]
 8003ba0:	f8d0 3040 	ldr.w	r3, [r0, #64]	@ 0x40
 8003ba4:	f8d0 4080 	ldr.w	r4, [r0, #128]	@ 0x80
 8003ba8:	f8d0 50c0 	ldr.w	r5, [r0, #192]	@ 0xc0
 8003bac:	f8d0 6100 	ldr.w	r6, [r0, #256]	@ 0x100
 8003bb0:	f8d0 7140 	ldr.w	r7, [r0, #320]	@ 0x140
 8003bb4:	f8d0 8180 	ldr.w	r8, [r0, #384]	@ 0x180
 8003bb8:	f8d0 91c0 	ldr.w	r9, [r0, #448]	@ 0x1c0
 8003bbc:	f646 0008 	movw	r0, #26632	@ 0x6808
 8003bc0:	ee14 aa10 	vmov	sl, s8
 8003bc4:	fb3a fe06 	smulwb	lr, sl, r6
 8003bc8:	fb3a f616 	smulwt	r6, sl, r6
 8003bcc:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003bd0:	fb16 061c 	smlabt	r6, r6, ip, r0
 8003bd4:	eac6 4e2e 	pkhtb	lr, r6, lr, asr #16
 8003bd8:	fad2 f64e 	usub16	r6, r2, lr
 8003bdc:	fa92 f24e 	uadd16	r2, r2, lr
 8003be0:	fb3a fe07 	smulwb	lr, sl, r7
 8003be4:	fb3a f717 	smulwt	r7, sl, r7
 8003be8:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003bec:	fb17 071c 	smlabt	r7, r7, ip, r0
 8003bf0:	eac7 4e2e 	pkhtb	lr, r7, lr, asr #16
 8003bf4:	fad3 f74e 	usub16	r7, r3, lr
 8003bf8:	fa93 f34e 	uadd16	r3, r3, lr
 8003bfc:	fb3a fe08 	smulwb	lr, sl, r8
 8003c00:	fb3a f818 	smulwt	r8, sl, r8
 8003c04:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003c08:	fb18 081c 	smlabt	r8, r8, ip, r0
 8003c0c:	eac8 4e2e 	pkhtb	lr, r8, lr, asr #16
 8003c10:	fad4 f84e 	usub16	r8, r4, lr
 8003c14:	fa94 f44e 	uadd16	r4, r4, lr
 8003c18:	fb3a fe09 	smulwb	lr, sl, r9
 8003c1c:	fb3a f919 	smulwt	r9, sl, r9
 8003c20:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003c24:	fb19 091c 	smlabt	r9, r9, ip, r0
 8003c28:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 8003c2c:	fad5 f94e 	usub16	r9, r5, lr
 8003c30:	fa95 f54e 	uadd16	r5, r5, lr
 8003c34:	ee14 aa90 	vmov	sl, s9
 8003c38:	ee15 ba10 	vmov	fp, s10
 8003c3c:	fb3a fe04 	smulwb	lr, sl, r4
 8003c40:	fb3a f414 	smulwt	r4, sl, r4
 8003c44:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003c48:	fb14 041c 	smlabt	r4, r4, ip, r0
 8003c4c:	eac4 4e2e 	pkhtb	lr, r4, lr, asr #16
 8003c50:	fad2 f44e 	usub16	r4, r2, lr
 8003c54:	fa92 f24e 	uadd16	r2, r2, lr
 8003c58:	fb3a fe05 	smulwb	lr, sl, r5
 8003c5c:	fb3a f515 	smulwt	r5, sl, r5
 8003c60:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003c64:	fb15 051c 	smlabt	r5, r5, ip, r0
 8003c68:	eac5 4e2e 	pkhtb	lr, r5, lr, asr #16
 8003c6c:	fad3 f54e 	usub16	r5, r3, lr
 8003c70:	fa93 f34e 	uadd16	r3, r3, lr
 8003c74:	fb3b fe08 	smulwb	lr, fp, r8
 8003c78:	fb3b f818 	smulwt	r8, fp, r8
 8003c7c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003c80:	fb18 081c 	smlabt	r8, r8, ip, r0
 8003c84:	eac8 4e2e 	pkhtb	lr, r8, lr, asr #16
 8003c88:	fad6 f84e 	usub16	r8, r6, lr
 8003c8c:	fa96 f64e 	uadd16	r6, r6, lr
 8003c90:	fb3b fe09 	smulwb	lr, fp, r9
 8003c94:	fb3b f919 	smulwt	r9, fp, r9
 8003c98:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003c9c:	fb19 091c 	smlabt	r9, r9, ip, r0
 8003ca0:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 8003ca4:	fad7 f94e 	usub16	r9, r7, lr
 8003ca8:	fa97 f74e 	uadd16	r7, r7, lr
 8003cac:	ee15 aa90 	vmov	sl, s11
 8003cb0:	ee16 ba10 	vmov	fp, s12
 8003cb4:	fb3a fe03 	smulwb	lr, sl, r3
 8003cb8:	fb3a f313 	smulwt	r3, sl, r3
 8003cbc:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003cc0:	fb13 031c 	smlabt	r3, r3, ip, r0
 8003cc4:	eac3 4e2e 	pkhtb	lr, r3, lr, asr #16
 8003cc8:	fad2 f34e 	usub16	r3, r2, lr
 8003ccc:	fa92 f24e 	uadd16	r2, r2, lr
 8003cd0:	fb3b fe05 	smulwb	lr, fp, r5
 8003cd4:	fb3b f515 	smulwt	r5, fp, r5
 8003cd8:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003cdc:	fb15 051c 	smlabt	r5, r5, ip, r0
 8003ce0:	eac5 4e2e 	pkhtb	lr, r5, lr, asr #16
 8003ce4:	fad4 f54e 	usub16	r5, r4, lr
 8003ce8:	fa94 f44e 	uadd16	r4, r4, lr
 8003cec:	ee16 aa90 	vmov	sl, s13
 8003cf0:	ee17 ba10 	vmov	fp, s14
 8003cf4:	fb3a fe07 	smulwb	lr, sl, r7
 8003cf8:	fb3a f717 	smulwt	r7, sl, r7
 8003cfc:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003d00:	fb17 071c 	smlabt	r7, r7, ip, r0
 8003d04:	eac7 4e2e 	pkhtb	lr, r7, lr, asr #16
 8003d08:	fad6 f74e 	usub16	r7, r6, lr
 8003d0c:	fa96 f64e 	uadd16	r6, r6, lr
 8003d10:	fb3b fe09 	smulwb	lr, fp, r9
 8003d14:	fb3b f919 	smulwt	r9, fp, r9
 8003d18:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003d1c:	fb19 091c 	smlabt	r9, r9, ip, r0
 8003d20:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 8003d24:	fad8 f94e 	usub16	r9, r8, lr
 8003d28:	fa98 f84e 	uadd16	r8, r8, lr
 8003d2c:	ee1b 0a90 	vmov	r0, s23
 8003d30:	ee10 aa90 	vmov	sl, s1
 8003d34:	fa93 fe4a 	uadd16	lr, r3, sl
 8003d38:	fad3 f34a 	usub16	r3, r3, sl
 8003d3c:	f8c0 e040 	str.w	lr, [r0, #64]	@ 0x40
 8003d40:	f8c0 3060 	str.w	r3, [r0, #96]	@ 0x60
 8003d44:	ee11 aa90 	vmov	sl, s3
 8003d48:	fa95 fe4a 	uadd16	lr, r5, sl
 8003d4c:	fad5 f54a 	usub16	r5, r5, sl
 8003d50:	f8c0 e0c0 	str.w	lr, [r0, #192]	@ 0xc0
 8003d54:	f8c0 50e0 	str.w	r5, [r0, #224]	@ 0xe0
 8003d58:	ee12 aa90 	vmov	sl, s5
 8003d5c:	fa97 fe4a 	uadd16	lr, r7, sl
 8003d60:	fad7 f74a 	usub16	r7, r7, sl
 8003d64:	f8c0 e140 	str.w	lr, [r0, #320]	@ 0x140
 8003d68:	f8c0 7160 	str.w	r7, [r0, #352]	@ 0x160
 8003d6c:	ee13 aa90 	vmov	sl, s7
 8003d70:	fa99 fe4a 	uadd16	lr, r9, sl
 8003d74:	fad9 f94a 	usub16	r9, r9, sl
 8003d78:	f8c0 e1c0 	str.w	lr, [r0, #448]	@ 0x1c0
 8003d7c:	f8c0 91e0 	str.w	r9, [r0, #480]	@ 0x1e0
 8003d80:	ee11 5a10 	vmov	r5, s2
 8003d84:	fa94 fe45 	uadd16	lr, r4, r5
 8003d88:	fad4 fa45 	usub16	sl, r4, r5
 8003d8c:	f8c0 e080 	str.w	lr, [r0, #128]	@ 0x80
 8003d90:	f8c0 a0a0 	str.w	sl, [r0, #160]	@ 0xa0
 8003d94:	ee12 7a10 	vmov	r7, s4
 8003d98:	fa96 fe47 	uadd16	lr, r6, r7
 8003d9c:	fad6 fa47 	usub16	sl, r6, r7
 8003da0:	f8c0 e100 	str.w	lr, [r0, #256]	@ 0x100
 8003da4:	f8c0 a120 	str.w	sl, [r0, #288]	@ 0x120
 8003da8:	ee13 9a10 	vmov	r9, s6
 8003dac:	fa98 fe49 	uadd16	lr, r8, r9
 8003db0:	fad8 fa49 	usub16	sl, r8, r9
 8003db4:	f8c0 e180 	str.w	lr, [r0, #384]	@ 0x180
 8003db8:	f8c0 a1a0 	str.w	sl, [r0, #416]	@ 0x1a0
 8003dbc:	ee10 3a10 	vmov	r3, s0
 8003dc0:	fa92 fe43 	uadd16	lr, r2, r3
 8003dc4:	fad2 fa43 	usub16	sl, r2, r3
 8003dc8:	f8c0 a020 	str.w	sl, [r0, #32]
 8003dcc:	f840 eb04 	str.w	lr, [r0], #4
 8003dd0:	ee1c ea10 	vmov	lr, s24
 8003dd4:	ebb0 0f0e 	cmp.w	r0, lr
 8003dd8:	f47f ada4 	bne.w	8003924 <ntt_fast+0x18>
 8003ddc:	f1a0 0020 	sub.w	r0, r0, #32
 8003de0:	f500 7e00 	add.w	lr, r0, #512	@ 0x200
 8003de4:	ee06 ea90 	vmov	s13, lr
 8003de8:	ee0b 0a90 	vmov	s23, r0
 8003dec:	f8d0 2000 	ldr.w	r2, [r0]
 8003df0:	f8d0 3004 	ldr.w	r3, [r0, #4]
 8003df4:	f8d0 4008 	ldr.w	r4, [r0, #8]
 8003df8:	f8d0 500c 	ldr.w	r5, [r0, #12]
 8003dfc:	f8d0 6010 	ldr.w	r6, [r0, #16]
 8003e00:	f8d0 7014 	ldr.w	r7, [r0, #20]
 8003e04:	f8d0 8018 	ldr.w	r8, [r0, #24]
 8003e08:	f8d0 901c 	ldr.w	r9, [r0, #28]
 8003e0c:	f646 0008 	movw	r0, #26632	@ 0x6808
 8003e10:	f851 ab04 	ldr.w	sl, [r1], #4
 8003e14:	fb3a fe06 	smulwb	lr, sl, r6
 8003e18:	fb3a f616 	smulwt	r6, sl, r6
 8003e1c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003e20:	fb16 061c 	smlabt	r6, r6, ip, r0
 8003e24:	eac6 4e2e 	pkhtb	lr, r6, lr, asr #16
 8003e28:	fad2 f64e 	usub16	r6, r2, lr
 8003e2c:	fa92 f24e 	uadd16	r2, r2, lr
 8003e30:	fb3a fe07 	smulwb	lr, sl, r7
 8003e34:	fb3a f717 	smulwt	r7, sl, r7
 8003e38:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003e3c:	fb17 071c 	smlabt	r7, r7, ip, r0
 8003e40:	eac7 4e2e 	pkhtb	lr, r7, lr, asr #16
 8003e44:	fad3 f74e 	usub16	r7, r3, lr
 8003e48:	fa93 f34e 	uadd16	r3, r3, lr
 8003e4c:	fb3a fe08 	smulwb	lr, sl, r8
 8003e50:	fb3a f818 	smulwt	r8, sl, r8
 8003e54:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003e58:	fb18 081c 	smlabt	r8, r8, ip, r0
 8003e5c:	eac8 4e2e 	pkhtb	lr, r8, lr, asr #16
 8003e60:	fad4 f84e 	usub16	r8, r4, lr
 8003e64:	fa94 f44e 	uadd16	r4, r4, lr
 8003e68:	fb3a fe09 	smulwb	lr, sl, r9
 8003e6c:	fb3a f919 	smulwt	r9, sl, r9
 8003e70:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003e74:	fb19 091c 	smlabt	r9, r9, ip, r0
 8003e78:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 8003e7c:	fad5 f94e 	usub16	r9, r5, lr
 8003e80:	fa95 f54e 	uadd16	r5, r5, lr
 8003e84:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 8003e88:	fb3a fe04 	smulwb	lr, sl, r4
 8003e8c:	fb3a f414 	smulwt	r4, sl, r4
 8003e90:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003e94:	fb14 041c 	smlabt	r4, r4, ip, r0
 8003e98:	eac4 4e2e 	pkhtb	lr, r4, lr, asr #16
 8003e9c:	fad2 f44e 	usub16	r4, r2, lr
 8003ea0:	fa92 f24e 	uadd16	r2, r2, lr
 8003ea4:	fb3a fe05 	smulwb	lr, sl, r5
 8003ea8:	fb3a f515 	smulwt	r5, sl, r5
 8003eac:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003eb0:	fb15 051c 	smlabt	r5, r5, ip, r0
 8003eb4:	eac5 4e2e 	pkhtb	lr, r5, lr, asr #16
 8003eb8:	fad3 f54e 	usub16	r5, r3, lr
 8003ebc:	fa93 f34e 	uadd16	r3, r3, lr
 8003ec0:	fb3b fe08 	smulwb	lr, fp, r8
 8003ec4:	fb3b f818 	smulwt	r8, fp, r8
 8003ec8:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003ecc:	fb18 081c 	smlabt	r8, r8, ip, r0
 8003ed0:	eac8 4e2e 	pkhtb	lr, r8, lr, asr #16
 8003ed4:	fad6 f84e 	usub16	r8, r6, lr
 8003ed8:	fa96 f64e 	uadd16	r6, r6, lr
 8003edc:	fb3b fe09 	smulwb	lr, fp, r9
 8003ee0:	fb3b f919 	smulwt	r9, fp, r9
 8003ee4:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003ee8:	fb19 091c 	smlabt	r9, r9, ip, r0
 8003eec:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 8003ef0:	fad7 f94e 	usub16	r9, r7, lr
 8003ef4:	fa97 f74e 	uadd16	r7, r7, lr
 8003ef8:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 8003efc:	fb3a fe03 	smulwb	lr, sl, r3
 8003f00:	fb3a f313 	smulwt	r3, sl, r3
 8003f04:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003f08:	fb13 031c 	smlabt	r3, r3, ip, r0
 8003f0c:	eac3 4e2e 	pkhtb	lr, r3, lr, asr #16
 8003f10:	fad2 f34e 	usub16	r3, r2, lr
 8003f14:	fa92 f24e 	uadd16	r2, r2, lr
 8003f18:	fb3b fe05 	smulwb	lr, fp, r5
 8003f1c:	fb3b f515 	smulwt	r5, fp, r5
 8003f20:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003f24:	fb15 051c 	smlabt	r5, r5, ip, r0
 8003f28:	eac5 4e2e 	pkhtb	lr, r5, lr, asr #16
 8003f2c:	fad4 f54e 	usub16	r5, r4, lr
 8003f30:	fa94 f44e 	uadd16	r4, r4, lr
 8003f34:	e8f1 ab02 	ldrd	sl, fp, [r1], #8
 8003f38:	fb3a fe07 	smulwb	lr, sl, r7
 8003f3c:	fb3a f717 	smulwt	r7, sl, r7
 8003f40:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003f44:	fb17 071c 	smlabt	r7, r7, ip, r0
 8003f48:	eac7 4e2e 	pkhtb	lr, r7, lr, asr #16
 8003f4c:	fad6 f74e 	usub16	r7, r6, lr
 8003f50:	fa96 f64e 	uadd16	r6, r6, lr
 8003f54:	fb3b fe09 	smulwb	lr, fp, r9
 8003f58:	fb3b f919 	smulwt	r9, fp, r9
 8003f5c:	fb1e 0e1c 	smlabt	lr, lr, ip, r0
 8003f60:	fb19 091c 	smlabt	r9, r9, ip, r0
 8003f64:	eac9 4e2e 	pkhtb	lr, r9, lr, asr #16
 8003f68:	fad8 f94e 	usub16	r9, r8, lr
 8003f6c:	fa98 f84e 	uadd16	r8, r8, lr
 8003f70:	ee1b 0a90 	vmov	r0, s23
 8003f74:	f8c0 6010 	str.w	r6, [r0, #16]
 8003f78:	f8c0 7014 	str.w	r7, [r0, #20]
 8003f7c:	f8c0 8018 	str.w	r8, [r0, #24]
 8003f80:	f8c0 901c 	str.w	r9, [r0, #28]
 8003f84:	f8c0 3004 	str.w	r3, [r0, #4]
 8003f88:	f8c0 4008 	str.w	r4, [r0, #8]
 8003f8c:	f8c0 500c 	str.w	r5, [r0, #12]
 8003f90:	f840 2b20 	str.w	r2, [r0], #32
 8003f94:	ee16 ea90 	vmov	lr, s13
 8003f98:	ebb0 0f0e 	cmp.w	r0, lr
 8003f9c:	f47f af24 	bne.w	8003de8 <ntt_fast+0x4dc>
 8003fa0:	ecbd 8a09 	vpop	{s16-s24}
 8003fa4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

08003fa8 <matacc_asm_cache_16_32>:
 8003fa8:	e92d 4fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8003fac:	f646 0b08 	movw	fp, #26632	@ 0x6808
 8003fb0:	f640 5a01 	movw	sl, #3329	@ 0xd01
 8003fb4:	f24f 3c01 	movw	ip, #62209	@ 0xf301
 8003fb8:	f6c6 3ca8 	movt	ip, #27560	@ 0x6ba8
 8003fbc:	f240 0900 	movw	r9, #0
 8003fc0:	f8dd 4034 	ldr.w	r4, [sp, #52]	@ 0x34
 8003fc4:	f8dd 7038 	ldr.w	r7, [sp, #56]	@ 0x38
 8003fc8:	ee0d 7a10 	vmov	s26, r7
 8003fcc:	f8dd 703c 	ldr.w	r7, [sp, #60]	@ 0x3c
 8003fd0:	ee0d 7a90 	vmov	s27, r7
 8003fd4:	f240 0e00 	movw	lr, #0
 8003fd8:	ee08 3a90 	vmov	s17, r3
 8003fdc:	f833 5b02 	ldrh.w	r5, [r3], #2
 8003fe0:	f813 6b01 	ldrb.w	r6, [r3], #1
 8003fe4:	f3c5 3703 	ubfx	r7, r5, #12, #4
 8003fe8:	ea47 1606 	orr.w	r6, r7, r6, lsl #4
 8003fec:	f3c5 050b 	ubfx	r5, r5, #0, #12
 8003ff0:	f3c6 060b 	ubfx	r6, r6, #0, #12
 8003ff4:	ebb5 0f0a 	cmp.w	r5, sl
 8003ff8:	f080 804e 	bcs.w	8004098 <matacc_asm_cache_16_32+0xf0>
 8003ffc:	f822 5b02 	strh.w	r5, [r2], #2
 8004000:	f109 0901 	add.w	r9, r9, #1
 8004004:	f1b9 0f04 	cmp.w	r9, #4
 8004008:	f040 8046 	bne.w	8004098 <matacc_asm_cache_16_32+0xf0>
 800400c:	f1a2 0208 	sub.w	r2, r2, #8
 8004010:	ee09 3a10 	vmov	s18, r3
 8004014:	ee09 ea90 	vmov	s19, lr
 8004018:	ee0a 6a10 	vmov	s20, r6
 800401c:	ee1d 8a90 	vmov	r8, s27
 8004020:	f851 3b04 	ldr.w	r3, [r1], #4
 8004024:	f8d2 9000 	ldr.w	r9, [r2]
 8004028:	f854 eb04 	ldr.w	lr, [r4], #4
 800402c:	fb3e f513 	smulwt	r5, lr, r3
 8004030:	fb15 b50a 	smlabb	r5, r5, sl, fp
 8004034:	eac3 0505 	pkhbt	r5, r3, r5
 8004038:	f848 5b04 	str.w	r5, [r8], #4
 800403c:	fb15 f639 	smultt	r6, r5, r9
 8004040:	fb13 6609 	smlabb	r6, r3, r9, r6
 8004044:	fb23 f519 	smuadx	r5, r3, r9
 8004048:	f8c0 5004 	str.w	r5, [r0, #4]
 800404c:	f840 6b08 	str.w	r6, [r0], #8
 8004050:	f1ce 0e00 	rsb	lr, lr, #0
 8004054:	f851 3b04 	ldr.w	r3, [r1], #4
 8004058:	f8d2 9004 	ldr.w	r9, [r2, #4]
 800405c:	fb3e f513 	smulwt	r5, lr, r3
 8004060:	fb15 b50a 	smlabb	r5, r5, sl, fp
 8004064:	eac3 0505 	pkhbt	r5, r3, r5
 8004068:	f848 5b04 	str.w	r5, [r8], #4
 800406c:	fb15 f639 	smultt	r6, r5, r9
 8004070:	fb13 6609 	smlabb	r6, r3, r9, r6
 8004074:	fb23 f519 	smuadx	r5, r3, r9
 8004078:	f8c0 5004 	str.w	r5, [r0, #4]
 800407c:	f840 6b08 	str.w	r6, [r0], #8
 8004080:	ee0d 8a90 	vmov	s27, r8
 8004084:	ee19 3a10 	vmov	r3, s18
 8004088:	ee19 ea90 	vmov	lr, s19
 800408c:	ee1a 6a10 	vmov	r6, s20
 8004090:	f10e 0e01 	add.w	lr, lr, #1
 8004094:	f240 0900 	movw	r9, #0
 8004098:	ebb6 0f0a 	cmp.w	r6, sl
 800409c:	f080 804e 	bcs.w	800413c <matacc_asm_cache_16_32+0x194>
 80040a0:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 80040a4:	f280 804a 	bge.w	800413c <matacc_asm_cache_16_32+0x194>
 80040a8:	f822 6b02 	strh.w	r6, [r2], #2
 80040ac:	f109 0901 	add.w	r9, r9, #1
 80040b0:	f1b9 0f04 	cmp.w	r9, #4
 80040b4:	f040 8042 	bne.w	800413c <matacc_asm_cache_16_32+0x194>
 80040b8:	f1a2 0208 	sub.w	r2, r2, #8
 80040bc:	ee09 3a10 	vmov	s18, r3
 80040c0:	ee09 ea90 	vmov	s19, lr
 80040c4:	ee1d 8a90 	vmov	r8, s27
 80040c8:	f851 3b04 	ldr.w	r3, [r1], #4
 80040cc:	f8d2 9000 	ldr.w	r9, [r2]
 80040d0:	f854 eb04 	ldr.w	lr, [r4], #4
 80040d4:	fb3e f513 	smulwt	r5, lr, r3
 80040d8:	fb15 b50a 	smlabb	r5, r5, sl, fp
 80040dc:	eac3 0505 	pkhbt	r5, r3, r5
 80040e0:	f848 5b04 	str.w	r5, [r8], #4
 80040e4:	fb15 f639 	smultt	r6, r5, r9
 80040e8:	fb13 6609 	smlabb	r6, r3, r9, r6
 80040ec:	fb23 f519 	smuadx	r5, r3, r9
 80040f0:	f8c0 5004 	str.w	r5, [r0, #4]
 80040f4:	f840 6b08 	str.w	r6, [r0], #8
 80040f8:	f1ce 0e00 	rsb	lr, lr, #0
 80040fc:	f851 3b04 	ldr.w	r3, [r1], #4
 8004100:	f8d2 9004 	ldr.w	r9, [r2, #4]
 8004104:	fb3e f513 	smulwt	r5, lr, r3
 8004108:	fb15 b50a 	smlabb	r5, r5, sl, fp
 800410c:	eac3 0505 	pkhbt	r5, r3, r5
 8004110:	f848 5b04 	str.w	r5, [r8], #4
 8004114:	fb15 f639 	smultt	r6, r5, r9
 8004118:	fb13 6609 	smlabb	r6, r3, r9, r6
 800411c:	fb23 f519 	smuadx	r5, r3, r9
 8004120:	f8c0 5004 	str.w	r5, [r0, #4]
 8004124:	f840 6b08 	str.w	r6, [r0], #8
 8004128:	ee0d 8a90 	vmov	s27, r8
 800412c:	ee19 3a10 	vmov	r3, s18
 8004130:	ee19 ea90 	vmov	lr, s19
 8004134:	f10e 0e01 	add.w	lr, lr, #1
 8004138:	f240 0900 	movw	r9, #0
 800413c:	ee18 7a90 	vmov	r7, s17
 8004140:	f107 07a8 	add.w	r7, r7, #168	@ 0xa8
 8004144:	f103 0803 	add.w	r8, r3, #3
 8004148:	ebb8 0f07 	cmp.w	r8, r7
 800414c:	f340 8023 	ble.w	8004196 <matacc_asm_cache_16_32+0x1ee>
 8004150:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 8004154:	f280 801f 	bge.w	8004196 <matacc_asm_cache_16_32+0x1ee>
 8004158:	ee18 3a90 	vmov	r3, s17
 800415c:	ee08 ca10 	vmov	s16, ip
 8004160:	ee09 0a10 	vmov	s18, r0
 8004164:	ee09 1a90 	vmov	s19, r1
 8004168:	ee0a 2a10 	vmov	s20, r2
 800416c:	ee0a ea90 	vmov	s21, lr
 8004170:	4618      	mov	r0, r3
 8004172:	f240 0101 	movw	r1, #1
 8004176:	ee1d 2a10 	vmov	r2, s26
 800417a:	f7fd fe9b 	bl	8001eb4 <shake128_squeezeblocks>
 800417e:	ee18 ca10 	vmov	ip, s16
 8004182:	ee19 0a10 	vmov	r0, s18
 8004186:	ee19 1a90 	vmov	r1, s19
 800418a:	ee1a 2a10 	vmov	r2, s20
 800418e:	ee1a ea90 	vmov	lr, s21
 8004192:	ee18 3a90 	vmov	r3, s17
 8004196:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 800419a:	f6ff af1f 	blt.w	8003fdc <matacc_asm_cache_16_32+0x34>
 800419e:	e8bd 8fff 	ldmia.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
 80041a2:	bf00      	nop

080041a4 <matacc_asm_cache_32_32>:
 80041a4:	e92d 4fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80041a8:	f646 0b08 	movw	fp, #26632	@ 0x6808
 80041ac:	f640 5a01 	movw	sl, #3329	@ 0xd01
 80041b0:	f24f 3c01 	movw	ip, #62209	@ 0xf301
 80041b4:	f6c6 3ca8 	movt	ip, #27560	@ 0x6ba8
 80041b8:	f240 0900 	movw	r9, #0
 80041bc:	f8dd 4034 	ldr.w	r4, [sp, #52]	@ 0x34
 80041c0:	f8dd 7038 	ldr.w	r7, [sp, #56]	@ 0x38
 80041c4:	ee0d 7a10 	vmov	s26, r7
 80041c8:	f8dd 703c 	ldr.w	r7, [sp, #60]	@ 0x3c
 80041cc:	ee0d 7a90 	vmov	s27, r7
 80041d0:	f240 0e00 	movw	lr, #0
 80041d4:	ee08 3a90 	vmov	s17, r3
 80041d8:	f833 5b02 	ldrh.w	r5, [r3], #2
 80041dc:	f813 6b01 	ldrb.w	r6, [r3], #1
 80041e0:	f3c5 3703 	ubfx	r7, r5, #12, #4
 80041e4:	ea47 1606 	orr.w	r6, r7, r6, lsl #4
 80041e8:	f3c5 050b 	ubfx	r5, r5, #0, #12
 80041ec:	f3c6 060b 	ubfx	r6, r6, #0, #12
 80041f0:	ebb5 0f0a 	cmp.w	r5, sl
 80041f4:	f080 8054 	bcs.w	80042a0 <matacc_asm_cache_32_32+0xfc>
 80041f8:	f822 5b02 	strh.w	r5, [r2], #2
 80041fc:	f109 0901 	add.w	r9, r9, #1
 8004200:	f1b9 0f04 	cmp.w	r9, #4
 8004204:	f040 804c 	bne.w	80042a0 <matacc_asm_cache_32_32+0xfc>
 8004208:	f1a2 0208 	sub.w	r2, r2, #8
 800420c:	ee09 3a10 	vmov	s18, r3
 8004210:	ee09 ea90 	vmov	s19, lr
 8004214:	ee0a 6a10 	vmov	s20, r6
 8004218:	ee1d 8a90 	vmov	r8, s27
 800421c:	f851 3b04 	ldr.w	r3, [r1], #4
 8004220:	f8d2 9000 	ldr.w	r9, [r2]
 8004224:	6807      	ldr	r7, [r0, #0]
 8004226:	f854 eb04 	ldr.w	lr, [r4], #4
 800422a:	fb3e f513 	smulwt	r5, lr, r3
 800422e:	fb15 b50a 	smlabb	r5, r5, sl, fp
 8004232:	eac3 0505 	pkhbt	r5, r3, r5
 8004236:	f848 5b04 	str.w	r5, [r8], #4
 800423a:	fb15 7539 	smlatt	r5, r5, r9, r7
 800423e:	fb13 5709 	smlabb	r7, r3, r9, r5
 8004242:	f840 7b04 	str.w	r7, [r0], #4
 8004246:	f8d0 7000 	ldr.w	r7, [r0]
 800424a:	fb23 7719 	smladx	r7, r3, r9, r7
 800424e:	f840 7b04 	str.w	r7, [r0], #4
 8004252:	f1ce 0e00 	rsb	lr, lr, #0
 8004256:	f851 3b04 	ldr.w	r3, [r1], #4
 800425a:	f8d2 9004 	ldr.w	r9, [r2, #4]
 800425e:	6807      	ldr	r7, [r0, #0]
 8004260:	fb3e f513 	smulwt	r5, lr, r3
 8004264:	fb15 b50a 	smlabb	r5, r5, sl, fp
 8004268:	eac3 0505 	pkhbt	r5, r3, r5
 800426c:	f848 5b04 	str.w	r5, [r8], #4
 8004270:	fb15 7539 	smlatt	r5, r5, r9, r7
 8004274:	fb13 5709 	smlabb	r7, r3, r9, r5
 8004278:	f840 7b04 	str.w	r7, [r0], #4
 800427c:	f8d0 7000 	ldr.w	r7, [r0]
 8004280:	fb23 7719 	smladx	r7, r3, r9, r7
 8004284:	f840 7b04 	str.w	r7, [r0], #4
 8004288:	ee0d 8a90 	vmov	s27, r8
 800428c:	ee19 3a10 	vmov	r3, s18
 8004290:	ee19 ea90 	vmov	lr, s19
 8004294:	ee1a 6a10 	vmov	r6, s20
 8004298:	f10e 0e01 	add.w	lr, lr, #1
 800429c:	f240 0900 	movw	r9, #0
 80042a0:	ebb6 0f0a 	cmp.w	r6, sl
 80042a4:	f080 8054 	bcs.w	8004350 <matacc_asm_cache_32_32+0x1ac>
 80042a8:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 80042ac:	f280 8050 	bge.w	8004350 <matacc_asm_cache_32_32+0x1ac>
 80042b0:	f822 6b02 	strh.w	r6, [r2], #2
 80042b4:	f109 0901 	add.w	r9, r9, #1
 80042b8:	f1b9 0f04 	cmp.w	r9, #4
 80042bc:	f040 8048 	bne.w	8004350 <matacc_asm_cache_32_32+0x1ac>
 80042c0:	f1a2 0208 	sub.w	r2, r2, #8
 80042c4:	ee09 3a10 	vmov	s18, r3
 80042c8:	ee09 ea90 	vmov	s19, lr
 80042cc:	ee1d 8a90 	vmov	r8, s27
 80042d0:	f851 3b04 	ldr.w	r3, [r1], #4
 80042d4:	f8d2 9000 	ldr.w	r9, [r2]
 80042d8:	6807      	ldr	r7, [r0, #0]
 80042da:	f854 eb04 	ldr.w	lr, [r4], #4
 80042de:	fb3e f513 	smulwt	r5, lr, r3
 80042e2:	fb15 b50a 	smlabb	r5, r5, sl, fp
 80042e6:	eac3 0505 	pkhbt	r5, r3, r5
 80042ea:	f848 5b04 	str.w	r5, [r8], #4
 80042ee:	fb15 7539 	smlatt	r5, r5, r9, r7
 80042f2:	fb13 5709 	smlabb	r7, r3, r9, r5
 80042f6:	f840 7b04 	str.w	r7, [r0], #4
 80042fa:	f8d0 7000 	ldr.w	r7, [r0]
 80042fe:	fb23 7719 	smladx	r7, r3, r9, r7
 8004302:	f840 7b04 	str.w	r7, [r0], #4
 8004306:	f1ce 0e00 	rsb	lr, lr, #0
 800430a:	f851 3b04 	ldr.w	r3, [r1], #4
 800430e:	f8d2 9004 	ldr.w	r9, [r2, #4]
 8004312:	6807      	ldr	r7, [r0, #0]
 8004314:	fb3e f513 	smulwt	r5, lr, r3
 8004318:	fb15 b50a 	smlabb	r5, r5, sl, fp
 800431c:	eac3 0505 	pkhbt	r5, r3, r5
 8004320:	f848 5b04 	str.w	r5, [r8], #4
 8004324:	fb15 7539 	smlatt	r5, r5, r9, r7
 8004328:	fb13 5709 	smlabb	r7, r3, r9, r5
 800432c:	f840 7b04 	str.w	r7, [r0], #4
 8004330:	f8d0 7000 	ldr.w	r7, [r0]
 8004334:	fb23 7719 	smladx	r7, r3, r9, r7
 8004338:	f840 7b04 	str.w	r7, [r0], #4
 800433c:	ee0d 8a90 	vmov	s27, r8
 8004340:	ee19 3a10 	vmov	r3, s18
 8004344:	ee19 ea90 	vmov	lr, s19
 8004348:	f10e 0e01 	add.w	lr, lr, #1
 800434c:	f240 0900 	movw	r9, #0
 8004350:	ee18 7a90 	vmov	r7, s17
 8004354:	f107 07a8 	add.w	r7, r7, #168	@ 0xa8
 8004358:	f103 0803 	add.w	r8, r3, #3
 800435c:	ebb8 0f07 	cmp.w	r8, r7
 8004360:	f340 8023 	ble.w	80043aa <matacc_asm_cache_32_32+0x206>
 8004364:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 8004368:	f280 801f 	bge.w	80043aa <matacc_asm_cache_32_32+0x206>
 800436c:	ee18 3a90 	vmov	r3, s17
 8004370:	ee08 ca10 	vmov	s16, ip
 8004374:	ee09 0a10 	vmov	s18, r0
 8004378:	ee09 1a90 	vmov	s19, r1
 800437c:	ee0a 2a10 	vmov	s20, r2
 8004380:	ee0a ea90 	vmov	s21, lr
 8004384:	4618      	mov	r0, r3
 8004386:	f240 0101 	movw	r1, #1
 800438a:	ee1d 2a10 	vmov	r2, s26
 800438e:	f7fd fd91 	bl	8001eb4 <shake128_squeezeblocks>
 8004392:	ee18 ca10 	vmov	ip, s16
 8004396:	ee19 0a10 	vmov	r0, s18
 800439a:	ee19 1a90 	vmov	r1, s19
 800439e:	ee1a 2a10 	vmov	r2, s20
 80043a2:	ee1a ea90 	vmov	lr, s21
 80043a6:	ee18 3a90 	vmov	r3, s17
 80043aa:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 80043ae:	f6ff af13 	blt.w	80041d8 <matacc_asm_cache_32_32+0x34>
 80043b2:	e8bd 8fff 	ldmia.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
 80043b6:	bf00      	nop

080043b8 <matacc_asm_cache_32_16>:
 80043b8:	e92d 4fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80043bc:	f646 0b08 	movw	fp, #26632	@ 0x6808
 80043c0:	f640 5a01 	movw	sl, #3329	@ 0xd01
 80043c4:	f24f 3c01 	movw	ip, #62209	@ 0xf301
 80043c8:	f6c6 3ca8 	movt	ip, #27560	@ 0x6ba8
 80043cc:	f240 0900 	movw	r9, #0
 80043d0:	f8dd 4034 	ldr.w	r4, [sp, #52]	@ 0x34
 80043d4:	f8dd 7038 	ldr.w	r7, [sp, #56]	@ 0x38
 80043d8:	ee0d 7a10 	vmov	s26, r7
 80043dc:	f8dd 703c 	ldr.w	r7, [sp, #60]	@ 0x3c
 80043e0:	ee0d 7a90 	vmov	s27, r7
 80043e4:	ee0e 0a10 	vmov	s28, r0
 80043e8:	ee0e 0a90 	vmov	s29, r0
 80043ec:	f8dd 0040 	ldr.w	r0, [sp, #64]	@ 0x40
 80043f0:	f240 0e00 	movw	lr, #0
 80043f4:	ee08 3a90 	vmov	s17, r3
 80043f8:	f833 5b02 	ldrh.w	r5, [r3], #2
 80043fc:	f813 6b01 	ldrb.w	r6, [r3], #1
 8004400:	f3c5 3703 	ubfx	r7, r5, #12, #4
 8004404:	ea47 1606 	orr.w	r6, r7, r6, lsl #4
 8004408:	f3c5 050b 	ubfx	r5, r5, #0, #12
 800440c:	f3c6 060b 	ubfx	r6, r6, #0, #12
 8004410:	ebb5 0f0a 	cmp.w	r5, sl
 8004414:	f080 806a 	bcs.w	80044ec <matacc_asm_cache_32_16+0x134>
 8004418:	f822 5b02 	strh.w	r5, [r2], #2
 800441c:	f109 0901 	add.w	r9, r9, #1
 8004420:	f1b9 0f04 	cmp.w	r9, #4
 8004424:	f040 8062 	bne.w	80044ec <matacc_asm_cache_32_16+0x134>
 8004428:	f1a2 0208 	sub.w	r2, r2, #8
 800442c:	ee09 3a10 	vmov	s18, r3
 8004430:	ee09 ea90 	vmov	s19, lr
 8004434:	ee0a 6a10 	vmov	s20, r6
 8004438:	ee1d 8a90 	vmov	r8, s27
 800443c:	f851 3b04 	ldr.w	r3, [r1], #4
 8004440:	f8d2 9000 	ldr.w	r9, [r2]
 8004444:	f850 7b04 	ldr.w	r7, [r0], #4
 8004448:	f854 eb04 	ldr.w	lr, [r4], #4
 800444c:	fb3e f513 	smulwt	r5, lr, r3
 8004450:	fb15 b50a 	smlabb	r5, r5, sl, fp
 8004454:	eac3 0505 	pkhbt	r5, r3, r5
 8004458:	f848 5b04 	str.w	r5, [r8], #4
 800445c:	fb15 7539 	smlatt	r5, r5, r9, r7
 8004460:	fb13 5609 	smlabb	r6, r3, r9, r5
 8004464:	fb06 f60c 	mul.w	r6, r6, ip
 8004468:	fb16 b62a 	smlatb	r6, r6, sl, fp
 800446c:	f850 5b04 	ldr.w	r5, [r0], #4
 8004470:	fb23 5519 	smladx	r5, r3, r9, r5
 8004474:	fb05 f50c 	mul.w	r5, r5, ip
 8004478:	fb15 b52a 	smlatb	r5, r5, sl, fp
 800447c:	eac5 4726 	pkhtb	r7, r5, r6, asr #16
 8004480:	ee1e 6a10 	vmov	r6, s28
 8004484:	f846 7b04 	str.w	r7, [r6], #4
 8004488:	f1ce 0e00 	rsb	lr, lr, #0
 800448c:	f851 3b04 	ldr.w	r3, [r1], #4
 8004490:	f8d2 9004 	ldr.w	r9, [r2, #4]
 8004494:	fb3e f513 	smulwt	r5, lr, r3
 8004498:	fb15 b50a 	smlabb	r5, r5, sl, fp
 800449c:	eac3 0505 	pkhbt	r5, r3, r5
 80044a0:	f850 7b04 	ldr.w	r7, [r0], #4
 80044a4:	f848 5b04 	str.w	r5, [r8], #4
 80044a8:	fb15 7539 	smlatt	r5, r5, r9, r7
 80044ac:	fb13 5509 	smlabb	r5, r3, r9, r5
 80044b0:	fb05 f50c 	mul.w	r5, r5, ip
 80044b4:	fb15 b52a 	smlatb	r5, r5, sl, fp
 80044b8:	f850 7b04 	ldr.w	r7, [r0], #4
 80044bc:	fb23 7719 	smladx	r7, r3, r9, r7
 80044c0:	fb07 f70c 	mul.w	r7, r7, ip
 80044c4:	fb17 b72a 	smlatb	r7, r7, sl, fp
 80044c8:	eac7 4725 	pkhtb	r7, r7, r5, asr #16
 80044cc:	f846 7b04 	str.w	r7, [r6], #4
 80044d0:	ee0e 6a10 	vmov	s28, r6
 80044d4:	ee0d 8a90 	vmov	s27, r8
 80044d8:	ee19 3a10 	vmov	r3, s18
 80044dc:	ee19 ea90 	vmov	lr, s19
 80044e0:	ee1a 6a10 	vmov	r6, s20
 80044e4:	f10e 0e01 	add.w	lr, lr, #1
 80044e8:	f240 0900 	movw	r9, #0
 80044ec:	ebb6 0f0a 	cmp.w	r6, sl
 80044f0:	f080 806a 	bcs.w	80045c8 <matacc_asm_cache_32_16+0x210>
 80044f4:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 80044f8:	f280 8066 	bge.w	80045c8 <matacc_asm_cache_32_16+0x210>
 80044fc:	f822 6b02 	strh.w	r6, [r2], #2
 8004500:	f109 0901 	add.w	r9, r9, #1
 8004504:	f1b9 0f04 	cmp.w	r9, #4
 8004508:	f040 805e 	bne.w	80045c8 <matacc_asm_cache_32_16+0x210>
 800450c:	f1a2 0208 	sub.w	r2, r2, #8
 8004510:	ee09 3a10 	vmov	s18, r3
 8004514:	ee09 ea90 	vmov	s19, lr
 8004518:	ee1d 8a90 	vmov	r8, s27
 800451c:	f851 3b04 	ldr.w	r3, [r1], #4
 8004520:	f8d2 9000 	ldr.w	r9, [r2]
 8004524:	f850 7b04 	ldr.w	r7, [r0], #4
 8004528:	f854 eb04 	ldr.w	lr, [r4], #4
 800452c:	fb3e f513 	smulwt	r5, lr, r3
 8004530:	fb15 b50a 	smlabb	r5, r5, sl, fp
 8004534:	eac3 0505 	pkhbt	r5, r3, r5
 8004538:	f848 5b04 	str.w	r5, [r8], #4
 800453c:	fb15 7539 	smlatt	r5, r5, r9, r7
 8004540:	fb13 5609 	smlabb	r6, r3, r9, r5
 8004544:	fb06 f60c 	mul.w	r6, r6, ip
 8004548:	fb16 b62a 	smlatb	r6, r6, sl, fp
 800454c:	f850 5b04 	ldr.w	r5, [r0], #4
 8004550:	fb23 5519 	smladx	r5, r3, r9, r5
 8004554:	fb05 f50c 	mul.w	r5, r5, ip
 8004558:	fb15 b52a 	smlatb	r5, r5, sl, fp
 800455c:	eac5 4726 	pkhtb	r7, r5, r6, asr #16
 8004560:	ee1e 6a10 	vmov	r6, s28
 8004564:	f846 7b04 	str.w	r7, [r6], #4
 8004568:	f1ce 0e00 	rsb	lr, lr, #0
 800456c:	f851 3b04 	ldr.w	r3, [r1], #4
 8004570:	f8d2 9004 	ldr.w	r9, [r2, #4]
 8004574:	fb3e f513 	smulwt	r5, lr, r3
 8004578:	fb15 b50a 	smlabb	r5, r5, sl, fp
 800457c:	eac3 0505 	pkhbt	r5, r3, r5
 8004580:	f850 7b04 	ldr.w	r7, [r0], #4
 8004584:	f848 5b04 	str.w	r5, [r8], #4
 8004588:	fb15 7539 	smlatt	r5, r5, r9, r7
 800458c:	fb13 5509 	smlabb	r5, r3, r9, r5
 8004590:	fb05 f50c 	mul.w	r5, r5, ip
 8004594:	fb15 b52a 	smlatb	r5, r5, sl, fp
 8004598:	f850 7b04 	ldr.w	r7, [r0], #4
 800459c:	fb23 7719 	smladx	r7, r3, r9, r7
 80045a0:	fb07 f70c 	mul.w	r7, r7, ip
 80045a4:	fb17 b72a 	smlatb	r7, r7, sl, fp
 80045a8:	eac7 4725 	pkhtb	r7, r7, r5, asr #16
 80045ac:	f846 7b04 	str.w	r7, [r6], #4
 80045b0:	ee0e 6a10 	vmov	s28, r6
 80045b4:	ee0d 8a90 	vmov	s27, r8
 80045b8:	ee19 3a10 	vmov	r3, s18
 80045bc:	ee19 ea90 	vmov	lr, s19
 80045c0:	f10e 0e01 	add.w	lr, lr, #1
 80045c4:	f240 0900 	movw	r9, #0
 80045c8:	ee18 7a90 	vmov	r7, s17
 80045cc:	f107 07a8 	add.w	r7, r7, #168	@ 0xa8
 80045d0:	f103 0803 	add.w	r8, r3, #3
 80045d4:	ebb8 0f07 	cmp.w	r8, r7
 80045d8:	f340 8023 	ble.w	8004622 <matacc_asm_cache_32_16+0x26a>
 80045dc:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 80045e0:	f280 801f 	bge.w	8004622 <matacc_asm_cache_32_16+0x26a>
 80045e4:	ee18 3a90 	vmov	r3, s17
 80045e8:	ee08 ca10 	vmov	s16, ip
 80045ec:	ee09 0a10 	vmov	s18, r0
 80045f0:	ee09 1a90 	vmov	s19, r1
 80045f4:	ee0a 2a10 	vmov	s20, r2
 80045f8:	ee0a ea90 	vmov	s21, lr
 80045fc:	4618      	mov	r0, r3
 80045fe:	f240 0101 	movw	r1, #1
 8004602:	ee1d 2a10 	vmov	r2, s26
 8004606:	f7fd fc55 	bl	8001eb4 <shake128_squeezeblocks>
 800460a:	ee18 ca10 	vmov	ip, s16
 800460e:	ee19 0a10 	vmov	r0, s18
 8004612:	ee19 1a90 	vmov	r1, s19
 8004616:	ee1a 2a10 	vmov	r2, s20
 800461a:	ee1a ea90 	vmov	lr, s21
 800461e:	ee18 3a90 	vmov	r3, s17
 8004622:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 8004626:	f6ff aee7 	blt.w	80043f8 <matacc_asm_cache_32_16+0x40>
 800462a:	ee1e 0a90 	vmov	r0, s29
 800462e:	e8bd 8fff 	ldmia.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8004632:	bf00      	nop

08004634 <matacc_asm_opt_16_32>:
 8004634:	e92d 4fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8004638:	f646 0b08 	movw	fp, #26632	@ 0x6808
 800463c:	f640 5a01 	movw	sl, #3329	@ 0xd01
 8004640:	f24f 3c01 	movw	ip, #62209	@ 0xf301
 8004644:	f6c6 3ca8 	movt	ip, #27560	@ 0x6ba8
 8004648:	f240 0900 	movw	r9, #0
 800464c:	f8dd 7034 	ldr.w	r7, [sp, #52]	@ 0x34
 8004650:	ee0d 7a10 	vmov	s26, r7
 8004654:	f8dd 7038 	ldr.w	r7, [sp, #56]	@ 0x38
 8004658:	ee0d 7a90 	vmov	s27, r7
 800465c:	f240 0e00 	movw	lr, #0
 8004660:	ee08 3a90 	vmov	s17, r3
 8004664:	f833 5b02 	ldrh.w	r5, [r3], #2
 8004668:	f813 6b01 	ldrb.w	r6, [r3], #1
 800466c:	f3c5 3703 	ubfx	r7, r5, #12, #4
 8004670:	ea47 1606 	orr.w	r6, r7, r6, lsl #4
 8004674:	f3c5 050b 	ubfx	r5, r5, #0, #12
 8004678:	f3c6 060b 	ubfx	r6, r6, #0, #12
 800467c:	ebb5 0f0a 	cmp.w	r5, sl
 8004680:	f080 803a 	bcs.w	80046f8 <matacc_asm_opt_16_32+0xc4>
 8004684:	f822 5b02 	strh.w	r5, [r2], #2
 8004688:	f109 0901 	add.w	r9, r9, #1
 800468c:	f1b9 0f04 	cmp.w	r9, #4
 8004690:	f040 8032 	bne.w	80046f8 <matacc_asm_opt_16_32+0xc4>
 8004694:	f1a2 0208 	sub.w	r2, r2, #8
 8004698:	ee09 3a10 	vmov	s18, r3
 800469c:	ee09 ea90 	vmov	s19, lr
 80046a0:	ee0a 6a10 	vmov	s20, r6
 80046a4:	ee1d 8a90 	vmov	r8, s27
 80046a8:	f851 3b04 	ldr.w	r3, [r1], #4
 80046ac:	f8d2 9000 	ldr.w	r9, [r2]
 80046b0:	f851 5b04 	ldr.w	r5, [r1], #4
 80046b4:	f8d2 6004 	ldr.w	r6, [r2, #4]
 80046b8:	f858 eb04 	ldr.w	lr, [r8], #4
 80046bc:	fb2e f709 	smuad	r7, lr, r9
 80046c0:	fb23 f419 	smuadx	r4, r3, r9
 80046c4:	f840 7b04 	str.w	r7, [r0], #4
 80046c8:	f840 4b04 	str.w	r4, [r0], #4
 80046cc:	f858 7b04 	ldr.w	r7, [r8], #4
 80046d0:	fb27 fe06 	smuad	lr, r7, r6
 80046d4:	fb25 f416 	smuadx	r4, r5, r6
 80046d8:	f840 eb04 	str.w	lr, [r0], #4
 80046dc:	f840 4b04 	str.w	r4, [r0], #4
 80046e0:	ee0d 8a90 	vmov	s27, r8
 80046e4:	ee19 3a10 	vmov	r3, s18
 80046e8:	ee19 ea90 	vmov	lr, s19
 80046ec:	ee1a 6a10 	vmov	r6, s20
 80046f0:	f10e 0e01 	add.w	lr, lr, #1
 80046f4:	f240 0900 	movw	r9, #0
 80046f8:	ebb6 0f0a 	cmp.w	r6, sl
 80046fc:	f080 803a 	bcs.w	8004774 <matacc_asm_opt_16_32+0x140>
 8004700:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 8004704:	f280 8036 	bge.w	8004774 <matacc_asm_opt_16_32+0x140>
 8004708:	f822 6b02 	strh.w	r6, [r2], #2
 800470c:	f109 0901 	add.w	r9, r9, #1
 8004710:	f1b9 0f04 	cmp.w	r9, #4
 8004714:	f040 802e 	bne.w	8004774 <matacc_asm_opt_16_32+0x140>
 8004718:	f1a2 0208 	sub.w	r2, r2, #8
 800471c:	ee09 3a10 	vmov	s18, r3
 8004720:	ee09 ea90 	vmov	s19, lr
 8004724:	ee1d 8a90 	vmov	r8, s27
 8004728:	f851 3b04 	ldr.w	r3, [r1], #4
 800472c:	f8d2 9000 	ldr.w	r9, [r2]
 8004730:	f851 5b04 	ldr.w	r5, [r1], #4
 8004734:	f8d2 6004 	ldr.w	r6, [r2, #4]
 8004738:	f858 eb04 	ldr.w	lr, [r8], #4
 800473c:	fb2e f709 	smuad	r7, lr, r9
 8004740:	fb23 f419 	smuadx	r4, r3, r9
 8004744:	f840 7b04 	str.w	r7, [r0], #4
 8004748:	f840 4b04 	str.w	r4, [r0], #4
 800474c:	f858 7b04 	ldr.w	r7, [r8], #4
 8004750:	fb27 fe06 	smuad	lr, r7, r6
 8004754:	fb25 f416 	smuadx	r4, r5, r6
 8004758:	f840 eb04 	str.w	lr, [r0], #4
 800475c:	f840 4b04 	str.w	r4, [r0], #4
 8004760:	ee0d 8a90 	vmov	s27, r8
 8004764:	ee19 3a10 	vmov	r3, s18
 8004768:	ee19 ea90 	vmov	lr, s19
 800476c:	f10e 0e01 	add.w	lr, lr, #1
 8004770:	f240 0900 	movw	r9, #0
 8004774:	ee18 7a90 	vmov	r7, s17
 8004778:	f107 07a8 	add.w	r7, r7, #168	@ 0xa8
 800477c:	f103 0803 	add.w	r8, r3, #3
 8004780:	ebb8 0f07 	cmp.w	r8, r7
 8004784:	f340 8023 	ble.w	80047ce <matacc_asm_opt_16_32+0x19a>
 8004788:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 800478c:	f280 801f 	bge.w	80047ce <matacc_asm_opt_16_32+0x19a>
 8004790:	ee18 3a90 	vmov	r3, s17
 8004794:	ee08 ca10 	vmov	s16, ip
 8004798:	ee09 0a10 	vmov	s18, r0
 800479c:	ee09 1a90 	vmov	s19, r1
 80047a0:	ee0a 2a10 	vmov	s20, r2
 80047a4:	ee0a ea90 	vmov	s21, lr
 80047a8:	4618      	mov	r0, r3
 80047aa:	f240 0101 	movw	r1, #1
 80047ae:	ee1d 2a10 	vmov	r2, s26
 80047b2:	f7fd fb7f 	bl	8001eb4 <shake128_squeezeblocks>
 80047b6:	ee18 ca10 	vmov	ip, s16
 80047ba:	ee19 0a10 	vmov	r0, s18
 80047be:	ee19 1a90 	vmov	r1, s19
 80047c2:	ee1a 2a10 	vmov	r2, s20
 80047c6:	ee1a ea90 	vmov	lr, s21
 80047ca:	ee18 3a90 	vmov	r3, s17
 80047ce:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 80047d2:	f6ff af47 	blt.w	8004664 <matacc_asm_opt_16_32+0x30>
 80047d6:	e8bd 8fff 	ldmia.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
 80047da:	bf00      	nop

080047dc <matacc_asm_opt_32_32>:
 80047dc:	e92d 4fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80047e0:	f646 0b08 	movw	fp, #26632	@ 0x6808
 80047e4:	f640 5a01 	movw	sl, #3329	@ 0xd01
 80047e8:	f24f 3c01 	movw	ip, #62209	@ 0xf301
 80047ec:	f6c6 3ca8 	movt	ip, #27560	@ 0x6ba8
 80047f0:	f240 0900 	movw	r9, #0
 80047f4:	f8dd 7034 	ldr.w	r7, [sp, #52]	@ 0x34
 80047f8:	ee0d 7a10 	vmov	s26, r7
 80047fc:	f8dd 7038 	ldr.w	r7, [sp, #56]	@ 0x38
 8004800:	ee0d 7a90 	vmov	s27, r7
 8004804:	f240 0e00 	movw	lr, #0
 8004808:	ee08 3a90 	vmov	s17, r3
 800480c:	f833 5b02 	ldrh.w	r5, [r3], #2
 8004810:	f813 6b01 	ldrb.w	r6, [r3], #1
 8004814:	f3c5 3703 	ubfx	r7, r5, #12, #4
 8004818:	ea47 1606 	orr.w	r6, r7, r6, lsl #4
 800481c:	f3c5 050b 	ubfx	r5, r5, #0, #12
 8004820:	f3c6 060b 	ubfx	r6, r6, #0, #12
 8004824:	ebb5 0f0a 	cmp.w	r5, sl
 8004828:	f080 8041 	bcs.w	80048ae <matacc_asm_opt_32_32+0xd2>
 800482c:	f822 5b02 	strh.w	r5, [r2], #2
 8004830:	f109 0901 	add.w	r9, r9, #1
 8004834:	f1b9 0f04 	cmp.w	r9, #4
 8004838:	f040 8039 	bne.w	80048ae <matacc_asm_opt_32_32+0xd2>
 800483c:	f1a2 0208 	sub.w	r2, r2, #8
 8004840:	ee09 3a10 	vmov	s18, r3
 8004844:	ee09 ea90 	vmov	s19, lr
 8004848:	ee0a 6a10 	vmov	s20, r6
 800484c:	ee1d 8a90 	vmov	r8, s27
 8004850:	f851 3b04 	ldr.w	r3, [r1], #4
 8004854:	f8d2 9000 	ldr.w	r9, [r2]
 8004858:	f851 5b04 	ldr.w	r5, [r1], #4
 800485c:	f8d2 6004 	ldr.w	r6, [r2, #4]
 8004860:	f8d0 7000 	ldr.w	r7, [r0]
 8004864:	f8d0 e004 	ldr.w	lr, [r0, #4]
 8004868:	f858 4b04 	ldr.w	r4, [r8], #4
 800486c:	fb24 7709 	smlad	r7, r4, r9, r7
 8004870:	fb23 ee19 	smladx	lr, r3, r9, lr
 8004874:	f8c0 e004 	str.w	lr, [r0, #4]
 8004878:	f840 7b08 	str.w	r7, [r0], #8
 800487c:	f858 4b04 	ldr.w	r4, [r8], #4
 8004880:	6807      	ldr	r7, [r0, #0]
 8004882:	f8d0 e004 	ldr.w	lr, [r0, #4]
 8004886:	fb24 7706 	smlad	r7, r4, r6, r7
 800488a:	fb25 ee16 	smladx	lr, r5, r6, lr
 800488e:	f8c0 e004 	str.w	lr, [r0, #4]
 8004892:	f840 7b08 	str.w	r7, [r0], #8
 8004896:	ee0d 8a90 	vmov	s27, r8
 800489a:	ee19 3a10 	vmov	r3, s18
 800489e:	ee19 ea90 	vmov	lr, s19
 80048a2:	ee1a 6a10 	vmov	r6, s20
 80048a6:	f10e 0e01 	add.w	lr, lr, #1
 80048aa:	f240 0900 	movw	r9, #0
 80048ae:	ebb6 0f0a 	cmp.w	r6, sl
 80048b2:	f080 8041 	bcs.w	8004938 <matacc_asm_opt_32_32+0x15c>
 80048b6:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 80048ba:	f280 803d 	bge.w	8004938 <matacc_asm_opt_32_32+0x15c>
 80048be:	f822 6b02 	strh.w	r6, [r2], #2
 80048c2:	f109 0901 	add.w	r9, r9, #1
 80048c6:	f1b9 0f04 	cmp.w	r9, #4
 80048ca:	f040 8035 	bne.w	8004938 <matacc_asm_opt_32_32+0x15c>
 80048ce:	f1a2 0208 	sub.w	r2, r2, #8
 80048d2:	ee09 3a10 	vmov	s18, r3
 80048d6:	ee09 ea90 	vmov	s19, lr
 80048da:	ee1d 8a90 	vmov	r8, s27
 80048de:	f851 3b04 	ldr.w	r3, [r1], #4
 80048e2:	f8d2 9000 	ldr.w	r9, [r2]
 80048e6:	f851 5b04 	ldr.w	r5, [r1], #4
 80048ea:	f8d2 6004 	ldr.w	r6, [r2, #4]
 80048ee:	f8d0 7000 	ldr.w	r7, [r0]
 80048f2:	f8d0 e004 	ldr.w	lr, [r0, #4]
 80048f6:	f858 4b04 	ldr.w	r4, [r8], #4
 80048fa:	fb24 7709 	smlad	r7, r4, r9, r7
 80048fe:	fb23 ee19 	smladx	lr, r3, r9, lr
 8004902:	f8c0 e004 	str.w	lr, [r0, #4]
 8004906:	f840 7b08 	str.w	r7, [r0], #8
 800490a:	f858 4b04 	ldr.w	r4, [r8], #4
 800490e:	6807      	ldr	r7, [r0, #0]
 8004910:	f8d0 e004 	ldr.w	lr, [r0, #4]
 8004914:	fb24 7706 	smlad	r7, r4, r6, r7
 8004918:	fb25 ee16 	smladx	lr, r5, r6, lr
 800491c:	f8c0 e004 	str.w	lr, [r0, #4]
 8004920:	f840 7b08 	str.w	r7, [r0], #8
 8004924:	ee0d 8a90 	vmov	s27, r8
 8004928:	ee19 3a10 	vmov	r3, s18
 800492c:	ee19 ea90 	vmov	lr, s19
 8004930:	f10e 0e01 	add.w	lr, lr, #1
 8004934:	f240 0900 	movw	r9, #0
 8004938:	ee18 7a90 	vmov	r7, s17
 800493c:	f107 07a8 	add.w	r7, r7, #168	@ 0xa8
 8004940:	f103 0803 	add.w	r8, r3, #3
 8004944:	ebb8 0f07 	cmp.w	r8, r7
 8004948:	f340 8023 	ble.w	8004992 <matacc_asm_opt_32_32+0x1b6>
 800494c:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 8004950:	f280 801f 	bge.w	8004992 <matacc_asm_opt_32_32+0x1b6>
 8004954:	ee18 3a90 	vmov	r3, s17
 8004958:	ee08 ca10 	vmov	s16, ip
 800495c:	ee09 0a10 	vmov	s18, r0
 8004960:	ee09 1a90 	vmov	s19, r1
 8004964:	ee0a 2a10 	vmov	s20, r2
 8004968:	ee0a ea90 	vmov	s21, lr
 800496c:	4618      	mov	r0, r3
 800496e:	f240 0101 	movw	r1, #1
 8004972:	ee1d 2a10 	vmov	r2, s26
 8004976:	f7fd fa9d 	bl	8001eb4 <shake128_squeezeblocks>
 800497a:	ee18 ca10 	vmov	ip, s16
 800497e:	ee19 0a10 	vmov	r0, s18
 8004982:	ee19 1a90 	vmov	r1, s19
 8004986:	ee1a 2a10 	vmov	r2, s20
 800498a:	ee1a ea90 	vmov	lr, s21
 800498e:	ee18 3a90 	vmov	r3, s17
 8004992:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 8004996:	f6ff af39 	blt.w	800480c <matacc_asm_opt_32_32+0x30>
 800499a:	e8bd 8fff 	ldmia.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
 800499e:	bf00      	nop

080049a0 <matacc_asm_opt_32_16>:
 80049a0:	e92d 4fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80049a4:	f646 0b08 	movw	fp, #26632	@ 0x6808
 80049a8:	f640 5a01 	movw	sl, #3329	@ 0xd01
 80049ac:	f24f 3c01 	movw	ip, #62209	@ 0xf301
 80049b0:	f6c6 3ca8 	movt	ip, #27560	@ 0x6ba8
 80049b4:	f240 0900 	movw	r9, #0
 80049b8:	f8dd 7034 	ldr.w	r7, [sp, #52]	@ 0x34
 80049bc:	ee0d 7a10 	vmov	s26, r7
 80049c0:	f8dd 7038 	ldr.w	r7, [sp, #56]	@ 0x38
 80049c4:	ee0d 7a90 	vmov	s27, r7
 80049c8:	ee0e 0a10 	vmov	s28, r0
 80049cc:	ee0e 0a90 	vmov	s29, r0
 80049d0:	f8dd 003c 	ldr.w	r0, [sp, #60]	@ 0x3c
 80049d4:	f240 0e00 	movw	lr, #0
 80049d8:	ee08 3a90 	vmov	s17, r3
 80049dc:	f833 5b02 	ldrh.w	r5, [r3], #2
 80049e0:	f813 6b01 	ldrb.w	r6, [r3], #1
 80049e4:	f3c5 3703 	ubfx	r7, r5, #12, #4
 80049e8:	ea47 1606 	orr.w	r6, r7, r6, lsl #4
 80049ec:	f3c5 050b 	ubfx	r5, r5, #0, #12
 80049f0:	f3c6 060b 	ubfx	r6, r6, #0, #12
 80049f4:	ebb5 0f0a 	cmp.w	r5, sl
 80049f8:	f080 8056 	bcs.w	8004aa8 <matacc_asm_opt_32_16+0x108>
 80049fc:	f822 5b02 	strh.w	r5, [r2], #2
 8004a00:	f109 0901 	add.w	r9, r9, #1
 8004a04:	f1b9 0f04 	cmp.w	r9, #4
 8004a08:	f040 804e 	bne.w	8004aa8 <matacc_asm_opt_32_16+0x108>
 8004a0c:	f1a2 0208 	sub.w	r2, r2, #8
 8004a10:	ee09 3a10 	vmov	s18, r3
 8004a14:	ee09 ea90 	vmov	s19, lr
 8004a18:	ee0a 6a10 	vmov	s20, r6
 8004a1c:	ee1d 8a90 	vmov	r8, s27
 8004a20:	f851 3b04 	ldr.w	r3, [r1], #4
 8004a24:	f8d2 9000 	ldr.w	r9, [r2]
 8004a28:	f851 5b04 	ldr.w	r5, [r1], #4
 8004a2c:	f8d2 6004 	ldr.w	r6, [r2, #4]
 8004a30:	f8d0 e004 	ldr.w	lr, [r0, #4]
 8004a34:	f850 7b08 	ldr.w	r7, [r0], #8
 8004a38:	f858 4b04 	ldr.w	r4, [r8], #4
 8004a3c:	fb24 7709 	smlad	r7, r4, r9, r7
 8004a40:	fb07 f70c 	mul.w	r7, r7, ip
 8004a44:	fb17 b72a 	smlatb	r7, r7, sl, fp
 8004a48:	fb23 ee19 	smladx	lr, r3, r9, lr
 8004a4c:	fb0e fe0c 	mul.w	lr, lr, ip
 8004a50:	fb1e be2a 	smlatb	lr, lr, sl, fp
 8004a54:	eace 4727 	pkhtb	r7, lr, r7, asr #16
 8004a58:	ee1e 3a10 	vmov	r3, s28
 8004a5c:	f843 7b04 	str.w	r7, [r3], #4
 8004a60:	f858 4b04 	ldr.w	r4, [r8], #4
 8004a64:	f8d0 e004 	ldr.w	lr, [r0, #4]
 8004a68:	f850 7b08 	ldr.w	r7, [r0], #8
 8004a6c:	fb24 7706 	smlad	r7, r4, r6, r7
 8004a70:	fb07 f70c 	mul.w	r7, r7, ip
 8004a74:	fb17 b72a 	smlatb	r7, r7, sl, fp
 8004a78:	fb25 ee16 	smladx	lr, r5, r6, lr
 8004a7c:	fb0e fe0c 	mul.w	lr, lr, ip
 8004a80:	fb1e be2a 	smlatb	lr, lr, sl, fp
 8004a84:	eace 4727 	pkhtb	r7, lr, r7, asr #16
 8004a88:	f843 7b04 	str.w	r7, [r3], #4
 8004a8c:	ee0e 3a10 	vmov	s28, r3
 8004a90:	ee0d 8a90 	vmov	s27, r8
 8004a94:	ee19 3a10 	vmov	r3, s18
 8004a98:	ee19 ea90 	vmov	lr, s19
 8004a9c:	ee1a 6a10 	vmov	r6, s20
 8004aa0:	f10e 0e01 	add.w	lr, lr, #1
 8004aa4:	f240 0900 	movw	r9, #0
 8004aa8:	ebb6 0f0a 	cmp.w	r6, sl
 8004aac:	f080 8056 	bcs.w	8004b5c <matacc_asm_opt_32_16+0x1bc>
 8004ab0:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 8004ab4:	f280 8052 	bge.w	8004b5c <matacc_asm_opt_32_16+0x1bc>
 8004ab8:	f822 6b02 	strh.w	r6, [r2], #2
 8004abc:	f109 0901 	add.w	r9, r9, #1
 8004ac0:	f1b9 0f04 	cmp.w	r9, #4
 8004ac4:	f040 804a 	bne.w	8004b5c <matacc_asm_opt_32_16+0x1bc>
 8004ac8:	f1a2 0208 	sub.w	r2, r2, #8
 8004acc:	ee09 3a10 	vmov	s18, r3
 8004ad0:	ee09 ea90 	vmov	s19, lr
 8004ad4:	ee1d 8a90 	vmov	r8, s27
 8004ad8:	f851 3b04 	ldr.w	r3, [r1], #4
 8004adc:	f8d2 9000 	ldr.w	r9, [r2]
 8004ae0:	f851 5b04 	ldr.w	r5, [r1], #4
 8004ae4:	f8d2 6004 	ldr.w	r6, [r2, #4]
 8004ae8:	f8d0 e004 	ldr.w	lr, [r0, #4]
 8004aec:	f850 7b08 	ldr.w	r7, [r0], #8
 8004af0:	f858 4b04 	ldr.w	r4, [r8], #4
 8004af4:	fb24 7709 	smlad	r7, r4, r9, r7
 8004af8:	fb07 f70c 	mul.w	r7, r7, ip
 8004afc:	fb17 b72a 	smlatb	r7, r7, sl, fp
 8004b00:	fb23 ee19 	smladx	lr, r3, r9, lr
 8004b04:	fb0e fe0c 	mul.w	lr, lr, ip
 8004b08:	fb1e be2a 	smlatb	lr, lr, sl, fp
 8004b0c:	eace 4727 	pkhtb	r7, lr, r7, asr #16
 8004b10:	ee1e 3a10 	vmov	r3, s28
 8004b14:	f843 7b04 	str.w	r7, [r3], #4
 8004b18:	f858 4b04 	ldr.w	r4, [r8], #4
 8004b1c:	f8d0 e004 	ldr.w	lr, [r0, #4]
 8004b20:	f850 7b08 	ldr.w	r7, [r0], #8
 8004b24:	fb24 7706 	smlad	r7, r4, r6, r7
 8004b28:	fb07 f70c 	mul.w	r7, r7, ip
 8004b2c:	fb17 b72a 	smlatb	r7, r7, sl, fp
 8004b30:	fb25 ee16 	smladx	lr, r5, r6, lr
 8004b34:	fb0e fe0c 	mul.w	lr, lr, ip
 8004b38:	fb1e be2a 	smlatb	lr, lr, sl, fp
 8004b3c:	eace 4727 	pkhtb	r7, lr, r7, asr #16
 8004b40:	f843 7b04 	str.w	r7, [r3], #4
 8004b44:	ee0e 3a10 	vmov	s28, r3
 8004b48:	ee0d 8a90 	vmov	s27, r8
 8004b4c:	ee19 3a10 	vmov	r3, s18
 8004b50:	ee19 ea90 	vmov	lr, s19
 8004b54:	f10e 0e01 	add.w	lr, lr, #1
 8004b58:	f240 0900 	movw	r9, #0
 8004b5c:	ee18 7a90 	vmov	r7, s17
 8004b60:	f107 07a8 	add.w	r7, r7, #168	@ 0xa8
 8004b64:	f103 0803 	add.w	r8, r3, #3
 8004b68:	ebb8 0f07 	cmp.w	r8, r7
 8004b6c:	f340 8023 	ble.w	8004bb6 <matacc_asm_opt_32_16+0x216>
 8004b70:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 8004b74:	f280 801f 	bge.w	8004bb6 <matacc_asm_opt_32_16+0x216>
 8004b78:	ee18 3a90 	vmov	r3, s17
 8004b7c:	ee08 ca10 	vmov	s16, ip
 8004b80:	ee09 0a10 	vmov	s18, r0
 8004b84:	ee09 1a90 	vmov	s19, r1
 8004b88:	ee0a 2a10 	vmov	s20, r2
 8004b8c:	ee0a ea90 	vmov	s21, lr
 8004b90:	4618      	mov	r0, r3
 8004b92:	f240 0101 	movw	r1, #1
 8004b96:	ee1d 2a10 	vmov	r2, s26
 8004b9a:	f7fd f98b 	bl	8001eb4 <shake128_squeezeblocks>
 8004b9e:	ee18 ca10 	vmov	ip, s16
 8004ba2:	ee19 0a10 	vmov	r0, s18
 8004ba6:	ee19 1a90 	vmov	r1, s19
 8004baa:	ee1a 2a10 	vmov	r2, s20
 8004bae:	ee1a ea90 	vmov	lr, s21
 8004bb2:	ee18 3a90 	vmov	r3, s17
 8004bb6:	f1be 0f40 	cmp.w	lr, #64	@ 0x40
 8004bba:	f6ff af0f 	blt.w	80049dc <matacc_asm_opt_32_16+0x3c>
 8004bbe:	ee1e 0a90 	vmov	r0, s29
 8004bc2:	e8bd 8fff 	ldmia.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8004bc6:	bf00      	nop

08004bc8 <frombytes_mul_asm_16_32>:
 8004bc8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8004bcc:	f646 0a08 	movw	sl, #26632	@ 0x6808
 8004bd0:	f6c0 5901 	movt	r9, #3329	@ 0xd01
 8004bd4:	f24f 3b01 	movw	fp, #62209	@ 0xf301
 8004bd8:	f6c6 3ba8 	movt	fp, #27560	@ 0x6ba8
 8004bdc:	f500 6e80 	add.w	lr, r0, #1024	@ 0x400
 8004be0:	f853 cb04 	ldr.w	ip, [r3], #4
 8004be4:	f892 6002 	ldrb.w	r6, [r2, #2]
 8004be8:	f8b2 7003 	ldrh.w	r7, [r2, #3]
 8004bec:	f892 8005 	ldrb.w	r8, [r2, #5]
 8004bf0:	f832 4b06 	ldrh.w	r4, [r2], #6
 8004bf4:	f3c4 3503 	ubfx	r5, r4, #12, #4
 8004bf8:	f3c4 040b 	ubfx	r4, r4, #0, #12
 8004bfc:	ea45 1506 	orr.w	r5, r5, r6, lsl #4
 8004c00:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
 8004c04:	f3c7 3503 	ubfx	r5, r7, #12, #4
 8004c08:	f3c7 060b 	ubfx	r6, r7, #0, #12
 8004c0c:	ea45 1508 	orr.w	r5, r5, r8, lsl #4
 8004c10:	ea46 4505 	orr.w	r5, r6, r5, lsl #16
 8004c14:	f851 6b04 	ldr.w	r6, [r1], #4
 8004c18:	f851 7b04 	ldr.w	r7, [r1], #4
 8004c1c:	fb3c f814 	smulwt	r8, ip, r4
 8004c20:	fb18 a819 	smlabt	r8, r8, r9, sl
 8004c24:	fb16 f838 	smultt	r8, r6, r8
 8004c28:	fb16 8804 	smlabb	r8, r6, r4, r8
 8004c2c:	f840 8b04 	str.w	r8, [r0], #4
 8004c30:	fb26 f814 	smuadx	r8, r6, r4
 8004c34:	f840 8b04 	str.w	r8, [r0], #4
 8004c38:	f1cc 0c00 	rsb	ip, ip, #0
 8004c3c:	fb3c f815 	smulwt	r8, ip, r5
 8004c40:	fb18 a819 	smlabt	r8, r8, r9, sl
 8004c44:	fb17 f838 	smultt	r8, r7, r8
 8004c48:	fb17 8805 	smlabb	r8, r7, r5, r8
 8004c4c:	f840 8b04 	str.w	r8, [r0], #4
 8004c50:	fb27 f815 	smuadx	r8, r7, r5
 8004c54:	f840 8b04 	str.w	r8, [r0], #4
 8004c58:	ebb0 0f0e 	cmp.w	r0, lr
 8004c5c:	f47f afc0 	bne.w	8004be0 <frombytes_mul_asm_16_32+0x18>
 8004c60:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

08004c64 <frombytes_mul_asm_acc_32_32>:
 8004c64:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8004c68:	f646 0a08 	movw	sl, #26632	@ 0x6808
 8004c6c:	f6c0 5901 	movt	r9, #3329	@ 0xd01
 8004c70:	f24f 3b01 	movw	fp, #62209	@ 0xf301
 8004c74:	f6c6 3ba8 	movt	fp, #27560	@ 0x6ba8
 8004c78:	f500 6e80 	add.w	lr, r0, #1024	@ 0x400
 8004c7c:	f853 cb04 	ldr.w	ip, [r3], #4
 8004c80:	f892 6002 	ldrb.w	r6, [r2, #2]
 8004c84:	f8b2 7003 	ldrh.w	r7, [r2, #3]
 8004c88:	f892 8005 	ldrb.w	r8, [r2, #5]
 8004c8c:	f832 4b06 	ldrh.w	r4, [r2], #6
 8004c90:	f3c4 3503 	ubfx	r5, r4, #12, #4
 8004c94:	f3c4 040b 	ubfx	r4, r4, #0, #12
 8004c98:	ea45 1506 	orr.w	r5, r5, r6, lsl #4
 8004c9c:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
 8004ca0:	f3c7 3503 	ubfx	r5, r7, #12, #4
 8004ca4:	f3c7 060b 	ubfx	r6, r7, #0, #12
 8004ca8:	ea45 1508 	orr.w	r5, r5, r8, lsl #4
 8004cac:	ea46 4505 	orr.w	r5, r6, r5, lsl #16
 8004cb0:	f851 8b04 	ldr.w	r8, [r1], #4
 8004cb4:	6806      	ldr	r6, [r0, #0]
 8004cb6:	fb3c f714 	smulwt	r7, ip, r4
 8004cba:	fb17 a719 	smlabt	r7, r7, r9, sl
 8004cbe:	fb18 6737 	smlatt	r7, r8, r7, r6
 8004cc2:	fb18 7704 	smlabb	r7, r8, r4, r7
 8004cc6:	f840 7b04 	str.w	r7, [r0], #4
 8004cca:	6806      	ldr	r6, [r0, #0]
 8004ccc:	fb28 6714 	smladx	r7, r8, r4, r6
 8004cd0:	f840 7b04 	str.w	r7, [r0], #4
 8004cd4:	f1cc 0c00 	rsb	ip, ip, #0
 8004cd8:	f851 8b04 	ldr.w	r8, [r1], #4
 8004cdc:	6806      	ldr	r6, [r0, #0]
 8004cde:	fb3c f715 	smulwt	r7, ip, r5
 8004ce2:	fb17 a719 	smlabt	r7, r7, r9, sl
 8004ce6:	fb18 6737 	smlatt	r7, r8, r7, r6
 8004cea:	fb18 7705 	smlabb	r7, r8, r5, r7
 8004cee:	f840 7b04 	str.w	r7, [r0], #4
 8004cf2:	6806      	ldr	r6, [r0, #0]
 8004cf4:	fb28 6715 	smladx	r7, r8, r5, r6
 8004cf8:	f840 7b04 	str.w	r7, [r0], #4
 8004cfc:	ebb0 0f0e 	cmp.w	r0, lr
 8004d00:	f47f afbc 	bne.w	8004c7c <frombytes_mul_asm_acc_32_32+0x18>
 8004d04:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

08004d08 <frombytes_mul_asm_acc_32_16>:
 8004d08:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8004d0c:	f646 0a08 	movw	sl, #26632	@ 0x6808
 8004d10:	f6c0 5901 	movt	r9, #3329	@ 0xd01
 8004d14:	f24f 3b01 	movw	fp, #62209	@ 0xf301
 8004d18:	f6c6 3ba8 	movt	fp, #27560	@ 0x6ba8
 8004d1c:	f8dd 6024 	ldr.w	r6, [sp, #36]	@ 0x24
 8004d20:	ee00 6a90 	vmov	s1, r6
 8004d24:	f506 6e80 	add.w	lr, r6, #1024	@ 0x400
 8004d28:	f853 cb04 	ldr.w	ip, [r3], #4
 8004d2c:	f892 6002 	ldrb.w	r6, [r2, #2]
 8004d30:	f8b2 7003 	ldrh.w	r7, [r2, #3]
 8004d34:	f892 8005 	ldrb.w	r8, [r2, #5]
 8004d38:	f832 4b06 	ldrh.w	r4, [r2], #6
 8004d3c:	f3c4 3503 	ubfx	r5, r4, #12, #4
 8004d40:	f3c4 040b 	ubfx	r4, r4, #0, #12
 8004d44:	ea45 1506 	orr.w	r5, r5, r6, lsl #4
 8004d48:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
 8004d4c:	f3c7 3503 	ubfx	r5, r7, #12, #4
 8004d50:	f3c7 060b 	ubfx	r6, r7, #0, #12
 8004d54:	ea45 1508 	orr.w	r5, r5, r8, lsl #4
 8004d58:	ea46 4505 	orr.w	r5, r6, r5, lsl #16
 8004d5c:	ee01 3a10 	vmov	s2, r3
 8004d60:	ee10 3a90 	vmov	r3, s1
 8004d64:	f851 8b04 	ldr.w	r8, [r1], #4
 8004d68:	f853 6b04 	ldr.w	r6, [r3], #4
 8004d6c:	fb3c f714 	smulwt	r7, ip, r4
 8004d70:	fb17 a719 	smlabt	r7, r7, r9, sl
 8004d74:	fb18 6737 	smlatt	r7, r8, r7, r6
 8004d78:	fb18 7704 	smlabb	r7, r8, r4, r7
 8004d7c:	fb07 f70b 	mul.w	r7, r7, fp
 8004d80:	fb17 a739 	smlatt	r7, r7, r9, sl
 8004d84:	f853 6b04 	ldr.w	r6, [r3], #4
 8004d88:	fb28 6614 	smladx	r6, r8, r4, r6
 8004d8c:	fb06 f60b 	mul.w	r6, r6, fp
 8004d90:	fb16 a639 	smlatt	r6, r6, r9, sl
 8004d94:	eac6 4627 	pkhtb	r6, r6, r7, asr #16
 8004d98:	f840 6b04 	str.w	r6, [r0], #4
 8004d9c:	f1cc 0c00 	rsb	ip, ip, #0
 8004da0:	f851 8b04 	ldr.w	r8, [r1], #4
 8004da4:	f853 6b04 	ldr.w	r6, [r3], #4
 8004da8:	fb3c f715 	smulwt	r7, ip, r5
 8004dac:	fb17 a719 	smlabt	r7, r7, r9, sl
 8004db0:	fb18 6737 	smlatt	r7, r8, r7, r6
 8004db4:	fb18 7705 	smlabb	r7, r8, r5, r7
 8004db8:	fb07 f70b 	mul.w	r7, r7, fp
 8004dbc:	fb17 a739 	smlatt	r7, r7, r9, sl
 8004dc0:	f853 6b04 	ldr.w	r6, [r3], #4
 8004dc4:	fb28 6615 	smladx	r6, r8, r5, r6
 8004dc8:	fb06 f60b 	mul.w	r6, r6, fp
 8004dcc:	fb16 a639 	smlatt	r6, r6, r9, sl
 8004dd0:	eac6 4627 	pkhtb	r6, r6, r7, asr #16
 8004dd4:	f840 6b04 	str.w	r6, [r0], #4
 8004dd8:	ee00 3a90 	vmov	s1, r3
 8004ddc:	ebb3 0f0e 	cmp.w	r3, lr
 8004de0:	ee11 3a10 	vmov	r3, s2
 8004de4:	f47f afa0 	bne.w	8004d28 <frombytes_mul_asm_acc_32_16+0x20>
 8004de8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

08004dec <asm_barrett_reduce>:
 8004dec:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8004df0:	f644 6abf 	movw	sl, #20159	@ 0x4ebf
 8004df4:	f640 5b01 	movw	fp, #3329	@ 0xd01
 8004df8:	f240 0910 	movw	r9, #16
 8004dfc:	e890 01fe 	ldmia.w	r0, {r1, r2, r3, r4, r5, r6, r7, r8}
 8004e00:	fb11 fc0a 	smulbb	ip, r1, sl
 8004e04:	fb11 fe2a 	smultb	lr, r1, sl
 8004e08:	ea4f 6cac 	mov.w	ip, ip, asr #26
 8004e0c:	ea4f 6eae 	mov.w	lr, lr, asr #26
 8004e10:	fb1c fc0b 	smulbb	ip, ip, fp
 8004e14:	fb1e fe0b 	smulbb	lr, lr, fp
 8004e18:	eacc 4c0e 	pkhbt	ip, ip, lr, lsl #16
 8004e1c:	fad1 f14c 	usub16	r1, r1, ip
 8004e20:	fb12 fc0a 	smulbb	ip, r2, sl
 8004e24:	fb12 fe2a 	smultb	lr, r2, sl
 8004e28:	ea4f 6cac 	mov.w	ip, ip, asr #26
 8004e2c:	ea4f 6eae 	mov.w	lr, lr, asr #26
 8004e30:	fb1c fc0b 	smulbb	ip, ip, fp
 8004e34:	fb1e fe0b 	smulbb	lr, lr, fp
 8004e38:	eacc 4c0e 	pkhbt	ip, ip, lr, lsl #16
 8004e3c:	fad2 f24c 	usub16	r2, r2, ip
 8004e40:	fb13 fc0a 	smulbb	ip, r3, sl
 8004e44:	fb13 fe2a 	smultb	lr, r3, sl
 8004e48:	ea4f 6cac 	mov.w	ip, ip, asr #26
 8004e4c:	ea4f 6eae 	mov.w	lr, lr, asr #26
 8004e50:	fb1c fc0b 	smulbb	ip, ip, fp
 8004e54:	fb1e fe0b 	smulbb	lr, lr, fp
 8004e58:	eacc 4c0e 	pkhbt	ip, ip, lr, lsl #16
 8004e5c:	fad3 f34c 	usub16	r3, r3, ip
 8004e60:	fb14 fc0a 	smulbb	ip, r4, sl
 8004e64:	fb14 fe2a 	smultb	lr, r4, sl
 8004e68:	ea4f 6cac 	mov.w	ip, ip, asr #26
 8004e6c:	ea4f 6eae 	mov.w	lr, lr, asr #26
 8004e70:	fb1c fc0b 	smulbb	ip, ip, fp
 8004e74:	fb1e fe0b 	smulbb	lr, lr, fp
 8004e78:	eacc 4c0e 	pkhbt	ip, ip, lr, lsl #16
 8004e7c:	fad4 f44c 	usub16	r4, r4, ip
 8004e80:	fb15 fc0a 	smulbb	ip, r5, sl
 8004e84:	fb15 fe2a 	smultb	lr, r5, sl
 8004e88:	ea4f 6cac 	mov.w	ip, ip, asr #26
 8004e8c:	ea4f 6eae 	mov.w	lr, lr, asr #26
 8004e90:	fb1c fc0b 	smulbb	ip, ip, fp
 8004e94:	fb1e fe0b 	smulbb	lr, lr, fp
 8004e98:	eacc 4c0e 	pkhbt	ip, ip, lr, lsl #16
 8004e9c:	fad5 f54c 	usub16	r5, r5, ip
 8004ea0:	fb16 fc0a 	smulbb	ip, r6, sl
 8004ea4:	fb16 fe2a 	smultb	lr, r6, sl
 8004ea8:	ea4f 6cac 	mov.w	ip, ip, asr #26
 8004eac:	ea4f 6eae 	mov.w	lr, lr, asr #26
 8004eb0:	fb1c fc0b 	smulbb	ip, ip, fp
 8004eb4:	fb1e fe0b 	smulbb	lr, lr, fp
 8004eb8:	eacc 4c0e 	pkhbt	ip, ip, lr, lsl #16
 8004ebc:	fad6 f64c 	usub16	r6, r6, ip
 8004ec0:	fb17 fc0a 	smulbb	ip, r7, sl
 8004ec4:	fb17 fe2a 	smultb	lr, r7, sl
 8004ec8:	ea4f 6cac 	mov.w	ip, ip, asr #26
 8004ecc:	ea4f 6eae 	mov.w	lr, lr, asr #26
 8004ed0:	fb1c fc0b 	smulbb	ip, ip, fp
 8004ed4:	fb1e fe0b 	smulbb	lr, lr, fp
 8004ed8:	eacc 4c0e 	pkhbt	ip, ip, lr, lsl #16
 8004edc:	fad7 f74c 	usub16	r7, r7, ip
 8004ee0:	fb18 fc0a 	smulbb	ip, r8, sl
 8004ee4:	fb18 fe2a 	smultb	lr, r8, sl
 8004ee8:	ea4f 6cac 	mov.w	ip, ip, asr #26
 8004eec:	ea4f 6eae 	mov.w	lr, lr, asr #26
 8004ef0:	fb1c fc0b 	smulbb	ip, ip, fp
 8004ef4:	fb1e fe0b 	smulbb	lr, lr, fp
 8004ef8:	eacc 4c0e 	pkhbt	ip, ip, lr, lsl #16
 8004efc:	fad8 f84c 	usub16	r8, r8, ip
 8004f00:	e8a0 01fe 	stmia.w	r0!, {r1, r2, r3, r4, r5, r6, r7, r8}
 8004f04:	f1b9 0901 	subs.w	r9, r9, #1
 8004f08:	f47f af78 	bne.w	8004dfc <asm_barrett_reduce+0x10>
 8004f0c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

08004f10 <asm_fromplant>:
 8004f10:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8004f14:	f646 0c08 	movw	ip, #26632	@ 0x6808
 8004f18:	f6c0 5b01 	movt	fp, #3329	@ 0xd01
 8004f1c:	f644 7aac 	movw	sl, #20396	@ 0x4fac
 8004f20:	f2c9 7af4 	movt	sl, #38900	@ 0x97f4
 8004f24:	f240 0910 	movw	r9, #16
 8004f28:	e890 01fe 	ldmia.w	r0, {r1, r2, r3, r4, r5, r6, r7, r8}
 8004f2c:	fb3a fe01 	smulwb	lr, sl, r1
 8004f30:	fb3a f111 	smulwt	r1, sl, r1
 8004f34:	fb1e ce1b 	smlabt	lr, lr, fp, ip
 8004f38:	fb11 c11b 	smlabt	r1, r1, fp, ip
 8004f3c:	eac1 412e 	pkhtb	r1, r1, lr, asr #16
 8004f40:	fb3a fe02 	smulwb	lr, sl, r2
 8004f44:	fb3a f212 	smulwt	r2, sl, r2
 8004f48:	fb1e ce1b 	smlabt	lr, lr, fp, ip
 8004f4c:	fb12 c21b 	smlabt	r2, r2, fp, ip
 8004f50:	eac2 422e 	pkhtb	r2, r2, lr, asr #16
 8004f54:	fb3a fe03 	smulwb	lr, sl, r3
 8004f58:	fb3a f313 	smulwt	r3, sl, r3
 8004f5c:	fb1e ce1b 	smlabt	lr, lr, fp, ip
 8004f60:	fb13 c31b 	smlabt	r3, r3, fp, ip
 8004f64:	eac3 432e 	pkhtb	r3, r3, lr, asr #16
 8004f68:	fb3a fe04 	smulwb	lr, sl, r4
 8004f6c:	fb3a f414 	smulwt	r4, sl, r4
 8004f70:	fb1e ce1b 	smlabt	lr, lr, fp, ip
 8004f74:	fb14 c41b 	smlabt	r4, r4, fp, ip
 8004f78:	eac4 442e 	pkhtb	r4, r4, lr, asr #16
 8004f7c:	fb3a fe05 	smulwb	lr, sl, r5
 8004f80:	fb3a f515 	smulwt	r5, sl, r5
 8004f84:	fb1e ce1b 	smlabt	lr, lr, fp, ip
 8004f88:	fb15 c51b 	smlabt	r5, r5, fp, ip
 8004f8c:	eac5 452e 	pkhtb	r5, r5, lr, asr #16
 8004f90:	fb3a fe06 	smulwb	lr, sl, r6
 8004f94:	fb3a f616 	smulwt	r6, sl, r6
 8004f98:	fb1e ce1b 	smlabt	lr, lr, fp, ip
 8004f9c:	fb16 c61b 	smlabt	r6, r6, fp, ip
 8004fa0:	eac6 462e 	pkhtb	r6, r6, lr, asr #16
 8004fa4:	fb3a fe07 	smulwb	lr, sl, r7
 8004fa8:	fb3a f717 	smulwt	r7, sl, r7
 8004fac:	fb1e ce1b 	smlabt	lr, lr, fp, ip
 8004fb0:	fb17 c71b 	smlabt	r7, r7, fp, ip
 8004fb4:	eac7 472e 	pkhtb	r7, r7, lr, asr #16
 8004fb8:	fb3a fe08 	smulwb	lr, sl, r8
 8004fbc:	fb3a f818 	smulwt	r8, sl, r8
 8004fc0:	fb1e ce1b 	smlabt	lr, lr, fp, ip
 8004fc4:	fb18 c81b 	smlabt	r8, r8, fp, ip
 8004fc8:	eac8 482e 	pkhtb	r8, r8, lr, asr #16
 8004fcc:	e8a0 01fe 	stmia.w	r0!, {r1, r2, r3, r4, r5, r6, r7, r8}
 8004fd0:	f1b9 0901 	subs.w	r9, r9, #1
 8004fd4:	f47f afa8 	bne.w	8004f28 <asm_fromplant+0x18>
 8004fd8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
	...

08005000 <KeccakF1600_Initialize>:
 8005000:	4770      	bx	lr
 8005002:	bf00      	nop
 8005004:	f3af 8000 	nop.w
 8005008:	f3af 8000 	nop.w
 800500c:	f3af 8000 	nop.w
 8005010:	f3af 8000 	nop.w
 8005014:	f3af 8000 	nop.w
 8005018:	f3af 8000 	nop.w
 800501c:	f3af 8000 	nop.w
 8005020:	f3af 8000 	nop.w
 8005024:	f3af 8000 	nop.w
 8005028:	f3af 8000 	nop.w
 800502c:	f3af 8000 	nop.w
 8005030:	f3af 8000 	nop.w
 8005034:	f3af 8000 	nop.w
 8005038:	f3af 8000 	nop.w
 800503c:	f3af 8000 	nop.w
	...

08005100 <KeccakF1600_StateXORBytes>:
 8005100:	b303      	cbz	r3, 8005144 <KeccakF1600_StateXORBytes_Exit1>
 8005102:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8005106:	f022 0407 	bic.w	r4, r2, #7
 800510a:	1900      	adds	r0, r0, r4
 800510c:	f012 0207 	ands.w	r2, r2, #7
 8005110:	d00b      	beq.n	800512a <KeccakF1600_StateXORBytes_CheckLanes>
 8005112:	001c      	movs	r4, r3
 8005114:	f1c2 0508 	rsb	r5, r2, #8
 8005118:	42ac      	cmp	r4, r5
 800511a:	dd00      	ble.n	800511e <KeccakF1600_StateXORBytes_BytesAlign>
 800511c:	002c      	movs	r4, r5

0800511e <KeccakF1600_StateXORBytes_BytesAlign>:
 800511e:	eba3 0804 	sub.w	r8, r3, r4
 8005122:	0023      	movs	r3, r4
 8005124:	f000 f8ec 	bl	8005300 <__KeccakF1600_StateXORBytesInLane>
 8005128:	4643      	mov	r3, r8

0800512a <KeccakF1600_StateXORBytes_CheckLanes>:
 800512a:	08da      	lsrs	r2, r3, #3
 800512c:	d004      	beq.n	8005138 <KeccakF1600_StateXORBytes_Bytes>
 800512e:	4698      	mov	r8, r3
 8005130:	f000 f866 	bl	8005200 <__KeccakF1600_StateXORLanes>
 8005134:	f008 0307 	and.w	r3, r8, #7

08005138 <KeccakF1600_StateXORBytes_Bytes>:
 8005138:	b113      	cbz	r3, 8005140 <KeccakF1600_StateXORBytes_Exit>
 800513a:	2200      	movs	r2, #0
 800513c:	f000 f8e0 	bl	8005300 <__KeccakF1600_StateXORBytesInLane>

08005140 <KeccakF1600_StateXORBytes_Exit>:
 8005140:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

08005144 <KeccakF1600_StateXORBytes_Exit1>:
 8005144:	4770      	bx	lr
 8005146:	bf00      	nop
 8005148:	f3af 8000 	nop.w
 800514c:	f3af 8000 	nop.w
 8005150:	f3af 8000 	nop.w
 8005154:	f3af 8000 	nop.w
 8005158:	f3af 8000 	nop.w
 800515c:	f3af 8000 	nop.w
 8005160:	f3af 8000 	nop.w
 8005164:	f3af 8000 	nop.w
 8005168:	f3af 8000 	nop.w
 800516c:	f3af 8000 	nop.w
 8005170:	f3af 8000 	nop.w
 8005174:	f3af 8000 	nop.w
 8005178:	f3af 8000 	nop.w
 800517c:	f3af 8000 	nop.w
	...

08005200 <__KeccakF1600_StateXORLanes>:
 8005200:	f851 4b04 	ldr.w	r4, [r1], #4
 8005204:	f851 5b04 	ldr.w	r5, [r1], #4
 8005208:	e9d0 6700 	ldrd	r6, r7, [r0]
 800520c:	f004 3355 	and.w	r3, r4, #1431655765	@ 0x55555555
 8005210:	ea43 0353 	orr.w	r3, r3, r3, lsr #1
 8005214:	f003 3333 	and.w	r3, r3, #858993459	@ 0x33333333
 8005218:	ea43 0393 	orr.w	r3, r3, r3, lsr #2
 800521c:	f003 330f 	and.w	r3, r3, #252645135	@ 0xf0f0f0f
 8005220:	ea43 1313 	orr.w	r3, r3, r3, lsr #4
 8005224:	f003 13ff 	and.w	r3, r3, #16711935	@ 0xff00ff
 8005228:	f363 230f 	bfi	r3, r3, #8, #8
 800522c:	ea86 2613 	eor.w	r6, r6, r3, lsr #8
 8005230:	f005 3355 	and.w	r3, r5, #1431655765	@ 0x55555555
 8005234:	ea43 0353 	orr.w	r3, r3, r3, lsr #1
 8005238:	f003 3333 	and.w	r3, r3, #858993459	@ 0x33333333
 800523c:	ea43 0393 	orr.w	r3, r3, r3, lsr #2
 8005240:	f003 330f 	and.w	r3, r3, #252645135	@ 0xf0f0f0f
 8005244:	ea43 1313 	orr.w	r3, r3, r3, lsr #4
 8005248:	f003 13ff 	and.w	r3, r3, #16711935	@ 0xff00ff
 800524c:	ea43 2313 	orr.w	r3, r3, r3, lsr #8
 8005250:	ea86 4603 	eor.w	r6, r6, r3, lsl #16
 8005254:	f004 33aa 	and.w	r3, r4, #2863311530	@ 0xaaaaaaaa
 8005258:	ea43 0343 	orr.w	r3, r3, r3, lsl #1
 800525c:	f003 33cc 	and.w	r3, r3, #3435973836	@ 0xcccccccc
 8005260:	ea43 0383 	orr.w	r3, r3, r3, lsl #2
 8005264:	f003 33f0 	and.w	r3, r3, #4042322160	@ 0xf0f0f0f0
 8005268:	ea43 1303 	orr.w	r3, r3, r3, lsl #4
 800526c:	f003 23ff 	and.w	r3, r3, #4278255360	@ 0xff00ff00
 8005270:	ea43 2303 	orr.w	r3, r3, r3, lsl #8
 8005274:	ea87 4713 	eor.w	r7, r7, r3, lsr #16
 8005278:	f005 33aa 	and.w	r3, r5, #2863311530	@ 0xaaaaaaaa
 800527c:	ea43 0343 	orr.w	r3, r3, r3, lsl #1
 8005280:	f003 33cc 	and.w	r3, r3, #3435973836	@ 0xcccccccc
 8005284:	ea43 0383 	orr.w	r3, r3, r3, lsl #2
 8005288:	f003 33f0 	and.w	r3, r3, #4042322160	@ 0xf0f0f0f0
 800528c:	ea43 1303 	orr.w	r3, r3, r3, lsl #4
 8005290:	f003 23ff 	and.w	r3, r3, #4278255360	@ 0xff00ff00
 8005294:	ea43 2303 	orr.w	r3, r3, r3, lsl #8
 8005298:	f36f 030f 	bfc	r3, #0, #16
 800529c:	405f      	eors	r7, r3
 800529e:	e8e0 6702 	strd	r6, r7, [r0], #8
 80052a2:	3a01      	subs	r2, #1
 80052a4:	d1ac      	bne.n	8005200 <__KeccakF1600_StateXORLanes>
 80052a6:	4770      	bx	lr
 80052a8:	f3af 8000 	nop.w
 80052ac:	f3af 8000 	nop.w
 80052b0:	f3af 8000 	nop.w
 80052b4:	f3af 8000 	nop.w
 80052b8:	f3af 8000 	nop.w
 80052bc:	f3af 8000 	nop.w
	...

08005300 <__KeccakF1600_StateXORBytesInLane>:
 8005300:	2400      	movs	r4, #0
 8005302:	2500      	movs	r5, #0
 8005304:	b430      	push	{r4, r5}
 8005306:	446a      	add	r2, sp

08005308 <__KeccakF1600_StateXORBytesInLane_Loop>:
 8005308:	f811 5b01 	ldrb.w	r5, [r1], #1
 800530c:	f802 5b01 	strb.w	r5, [r2], #1
 8005310:	3b01      	subs	r3, #1
 8005312:	d1f9      	bne.n	8005308 <__KeccakF1600_StateXORBytesInLane_Loop>
 8005314:	bc30      	pop	{r4, r5}
 8005316:	e9d0 6700 	ldrd	r6, r7, [r0]
 800531a:	f004 3355 	and.w	r3, r4, #1431655765	@ 0x55555555
 800531e:	ea43 0353 	orr.w	r3, r3, r3, lsr #1
 8005322:	f003 3333 	and.w	r3, r3, #858993459	@ 0x33333333
 8005326:	ea43 0393 	orr.w	r3, r3, r3, lsr #2
 800532a:	f003 330f 	and.w	r3, r3, #252645135	@ 0xf0f0f0f
 800532e:	ea43 1313 	orr.w	r3, r3, r3, lsr #4
 8005332:	f003 13ff 	and.w	r3, r3, #16711935	@ 0xff00ff
 8005336:	f363 230f 	bfi	r3, r3, #8, #8
 800533a:	ea86 2613 	eor.w	r6, r6, r3, lsr #8
 800533e:	f005 3355 	and.w	r3, r5, #1431655765	@ 0x55555555
 8005342:	ea43 0353 	orr.w	r3, r3, r3, lsr #1
 8005346:	f003 3333 	and.w	r3, r3, #858993459	@ 0x33333333
 800534a:	ea43 0393 	orr.w	r3, r3, r3, lsr #2
 800534e:	f003 330f 	and.w	r3, r3, #252645135	@ 0xf0f0f0f
 8005352:	ea43 1313 	orr.w	r3, r3, r3, lsr #4
 8005356:	f003 13ff 	and.w	r3, r3, #16711935	@ 0xff00ff
 800535a:	ea43 2313 	orr.w	r3, r3, r3, lsr #8
 800535e:	ea86 4603 	eor.w	r6, r6, r3, lsl #16
 8005362:	f004 33aa 	and.w	r3, r4, #2863311530	@ 0xaaaaaaaa
 8005366:	ea43 0343 	orr.w	r3, r3, r3, lsl #1
 800536a:	f003 33cc 	and.w	r3, r3, #3435973836	@ 0xcccccccc
 800536e:	ea43 0383 	orr.w	r3, r3, r3, lsl #2
 8005372:	f003 33f0 	and.w	r3, r3, #4042322160	@ 0xf0f0f0f0
 8005376:	ea43 1303 	orr.w	r3, r3, r3, lsl #4
 800537a:	f003 23ff 	and.w	r3, r3, #4278255360	@ 0xff00ff00
 800537e:	ea43 2303 	orr.w	r3, r3, r3, lsl #8
 8005382:	ea87 4713 	eor.w	r7, r7, r3, lsr #16
 8005386:	f005 33aa 	and.w	r3, r5, #2863311530	@ 0xaaaaaaaa
 800538a:	ea43 0343 	orr.w	r3, r3, r3, lsl #1
 800538e:	f003 33cc 	and.w	r3, r3, #3435973836	@ 0xcccccccc
 8005392:	ea43 0383 	orr.w	r3, r3, r3, lsl #2
 8005396:	f003 33f0 	and.w	r3, r3, #4042322160	@ 0xf0f0f0f0
 800539a:	ea43 1303 	orr.w	r3, r3, r3, lsl #4
 800539e:	f003 23ff 	and.w	r3, r3, #4278255360	@ 0xff00ff00
 80053a2:	ea43 2303 	orr.w	r3, r3, r3, lsl #8
 80053a6:	f36f 030f 	bfc	r3, #0, #16
 80053aa:	405f      	eors	r7, r3
 80053ac:	e8e0 6702 	strd	r6, r7, [r0], #8
 80053b0:	4770      	bx	lr
 80053b2:	bf00      	nop
 80053b4:	f3af 8000 	nop.w
 80053b8:	f3af 8000 	nop.w
 80053bc:	f3af 8000 	nop.w
	...

08005400 <KeccakF1600_StateExtractBytes>:
 8005400:	b303      	cbz	r3, 8005444 <KeccakF1600_StateExtractBytes_Exit1>
 8005402:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8005406:	f022 0407 	bic.w	r4, r2, #7
 800540a:	1900      	adds	r0, r0, r4
 800540c:	f012 0207 	ands.w	r2, r2, #7
 8005410:	d00b      	beq.n	800542a <KeccakF1600_StateExtractBytes_CheckLanes>
 8005412:	001c      	movs	r4, r3
 8005414:	f1c2 0508 	rsb	r5, r2, #8
 8005418:	42ac      	cmp	r4, r5
 800541a:	dd00      	ble.n	800541e <KeccakF1600_StateExtractBytes_BytesAlign>
 800541c:	002c      	movs	r4, r5

0800541e <KeccakF1600_StateExtractBytes_BytesAlign>:
 800541e:	eba3 0804 	sub.w	r8, r3, r4
 8005422:	0023      	movs	r3, r4
 8005424:	f000 f8ec 	bl	8005600 <__KeccakF1600_StateExtractBytesInLane>
 8005428:	4643      	mov	r3, r8

0800542a <KeccakF1600_StateExtractBytes_CheckLanes>:
 800542a:	08da      	lsrs	r2, r3, #3
 800542c:	d004      	beq.n	8005438 <KeccakF1600_StateExtractBytes_Bytes>
 800542e:	4698      	mov	r8, r3
 8005430:	f000 f866 	bl	8005500 <__KeccakF1600_StateExtractLanes>
 8005434:	f008 0307 	and.w	r3, r8, #7

08005438 <KeccakF1600_StateExtractBytes_Bytes>:
 8005438:	b113      	cbz	r3, 8005440 <KeccakF1600_StateExtractBytes_Exit>
 800543a:	2200      	movs	r2, #0
 800543c:	f000 f8e0 	bl	8005600 <__KeccakF1600_StateExtractBytesInLane>

08005440 <KeccakF1600_StateExtractBytes_Exit>:
 8005440:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

08005444 <KeccakF1600_StateExtractBytes_Exit1>:
 8005444:	4770      	bx	lr
 8005446:	bf00      	nop
 8005448:	f3af 8000 	nop.w
 800544c:	f3af 8000 	nop.w
 8005450:	f3af 8000 	nop.w
 8005454:	f3af 8000 	nop.w
 8005458:	f3af 8000 	nop.w
 800545c:	f3af 8000 	nop.w
 8005460:	f3af 8000 	nop.w
 8005464:	f3af 8000 	nop.w
 8005468:	f3af 8000 	nop.w
 800546c:	f3af 8000 	nop.w
 8005470:	f3af 8000 	nop.w
 8005474:	f3af 8000 	nop.w
 8005478:	f3af 8000 	nop.w
 800547c:	f3af 8000 	nop.w
	...

08005500 <__KeccakF1600_StateExtractLanes>:
 8005500:	e8f0 4502 	ldrd	r4, r5, [r0], #8
 8005504:	0023      	movs	r3, r4
 8005506:	f365 441f 	bfi	r4, r5, #16, #16
 800550a:	f36f 050f 	bfc	r5, #0, #16
 800550e:	ea45 4513 	orr.w	r5, r5, r3, lsr #16
 8005512:	ea84 2314 	eor.w	r3, r4, r4, lsr #8
 8005516:	f403 437f 	and.w	r3, r3, #65280	@ 0xff00
 800551a:	405c      	eors	r4, r3
 800551c:	ea84 2403 	eor.w	r4, r4, r3, lsl #8
 8005520:	ea84 1314 	eor.w	r3, r4, r4, lsr #4
 8005524:	f003 13f0 	and.w	r3, r3, #15728880	@ 0xf000f0
 8005528:	405c      	eors	r4, r3
 800552a:	ea84 1403 	eor.w	r4, r4, r3, lsl #4
 800552e:	ea84 0394 	eor.w	r3, r4, r4, lsr #2
 8005532:	f003 330c 	and.w	r3, r3, #202116108	@ 0xc0c0c0c
 8005536:	405c      	eors	r4, r3
 8005538:	ea84 0483 	eor.w	r4, r4, r3, lsl #2
 800553c:	ea84 0354 	eor.w	r3, r4, r4, lsr #1
 8005540:	f003 3322 	and.w	r3, r3, #572662306	@ 0x22222222
 8005544:	405c      	eors	r4, r3
 8005546:	ea84 0443 	eor.w	r4, r4, r3, lsl #1
 800554a:	ea85 2315 	eor.w	r3, r5, r5, lsr #8
 800554e:	f403 437f 	and.w	r3, r3, #65280	@ 0xff00
 8005552:	405d      	eors	r5, r3
 8005554:	ea85 2503 	eor.w	r5, r5, r3, lsl #8
 8005558:	ea85 1315 	eor.w	r3, r5, r5, lsr #4
 800555c:	f003 13f0 	and.w	r3, r3, #15728880	@ 0xf000f0
 8005560:	405d      	eors	r5, r3
 8005562:	ea85 1503 	eor.w	r5, r5, r3, lsl #4
 8005566:	ea85 0395 	eor.w	r3, r5, r5, lsr #2
 800556a:	f003 330c 	and.w	r3, r3, #202116108	@ 0xc0c0c0c
 800556e:	405d      	eors	r5, r3
 8005570:	ea85 0583 	eor.w	r5, r5, r3, lsl #2
 8005574:	ea85 0355 	eor.w	r3, r5, r5, lsr #1
 8005578:	f003 3322 	and.w	r3, r3, #572662306	@ 0x22222222
 800557c:	405d      	eors	r5, r3
 800557e:	ea85 0543 	eor.w	r5, r5, r3, lsl #1
 8005582:	f841 4b04 	str.w	r4, [r1], #4
 8005586:	3a01      	subs	r2, #1
 8005588:	f841 5b04 	str.w	r5, [r1], #4
 800558c:	d1b8      	bne.n	8005500 <__KeccakF1600_StateExtractLanes>
 800558e:	4770      	bx	lr
 8005590:	f3af 8000 	nop.w
 8005594:	f3af 8000 	nop.w
 8005598:	f3af 8000 	nop.w
 800559c:	f3af 8000 	nop.w
 80055a0:	f3af 8000 	nop.w
 80055a4:	f3af 8000 	nop.w
 80055a8:	f3af 8000 	nop.w
 80055ac:	f3af 8000 	nop.w
 80055b0:	f3af 8000 	nop.w
 80055b4:	f3af 8000 	nop.w
 80055b8:	f3af 8000 	nop.w
 80055bc:	f3af 8000 	nop.w
	...

08005600 <__KeccakF1600_StateExtractBytesInLane>:
 8005600:	e8f0 4502 	ldrd	r4, r5, [r0], #8
 8005604:	0026      	movs	r6, r4
 8005606:	f365 441f 	bfi	r4, r5, #16, #16
 800560a:	f36f 050f 	bfc	r5, #0, #16
 800560e:	ea45 4516 	orr.w	r5, r5, r6, lsr #16
 8005612:	ea84 2614 	eor.w	r6, r4, r4, lsr #8
 8005616:	f406 467f 	and.w	r6, r6, #65280	@ 0xff00
 800561a:	4074      	eors	r4, r6
 800561c:	ea84 2406 	eor.w	r4, r4, r6, lsl #8
 8005620:	ea84 1614 	eor.w	r6, r4, r4, lsr #4
 8005624:	f006 16f0 	and.w	r6, r6, #15728880	@ 0xf000f0
 8005628:	4074      	eors	r4, r6
 800562a:	ea84 1406 	eor.w	r4, r4, r6, lsl #4
 800562e:	ea84 0694 	eor.w	r6, r4, r4, lsr #2
 8005632:	f006 360c 	and.w	r6, r6, #202116108	@ 0xc0c0c0c
 8005636:	4074      	eors	r4, r6
 8005638:	ea84 0486 	eor.w	r4, r4, r6, lsl #2
 800563c:	ea84 0654 	eor.w	r6, r4, r4, lsr #1
 8005640:	f006 3622 	and.w	r6, r6, #572662306	@ 0x22222222
 8005644:	4074      	eors	r4, r6
 8005646:	ea84 0446 	eor.w	r4, r4, r6, lsl #1
 800564a:	ea85 2615 	eor.w	r6, r5, r5, lsr #8
 800564e:	f406 467f 	and.w	r6, r6, #65280	@ 0xff00
 8005652:	4075      	eors	r5, r6
 8005654:	ea85 2506 	eor.w	r5, r5, r6, lsl #8
 8005658:	ea85 1615 	eor.w	r6, r5, r5, lsr #4
 800565c:	f006 16f0 	and.w	r6, r6, #15728880	@ 0xf000f0
 8005660:	4075      	eors	r5, r6
 8005662:	ea85 1506 	eor.w	r5, r5, r6, lsl #4
 8005666:	ea85 0695 	eor.w	r6, r5, r5, lsr #2
 800566a:	f006 360c 	and.w	r6, r6, #202116108	@ 0xc0c0c0c
 800566e:	4075      	eors	r5, r6
 8005670:	ea85 0586 	eor.w	r5, r5, r6, lsl #2
 8005674:	ea85 0655 	eor.w	r6, r5, r5, lsr #1
 8005678:	f006 3622 	and.w	r6, r6, #572662306	@ 0x22222222
 800567c:	4075      	eors	r5, r6
 800567e:	ea85 0546 	eor.w	r5, r5, r6, lsl #1
 8005682:	b430      	push	{r4, r5}
 8005684:	446a      	add	r2, sp

08005686 <__KeccakF1600_StateExtractBytesInLane_Loop>:
 8005686:	f812 4b01 	ldrb.w	r4, [r2], #1
 800568a:	3b01      	subs	r3, #1
 800568c:	f801 4b01 	strb.w	r4, [r1], #1
 8005690:	d1f9      	bne.n	8005686 <__KeccakF1600_StateExtractBytesInLane_Loop>
 8005692:	b002      	add	sp, #8
 8005694:	4770      	bx	lr
 8005696:	bf00      	nop
 8005698:	f3af 8000 	nop.w
 800569c:	f3af 8000 	nop.w
 80056a0:	f3af 8000 	nop.w
 80056a4:	f3af 8000 	nop.w
 80056a8:	f3af 8000 	nop.w
 80056ac:	f3af 8000 	nop.w
 80056b0:	f3af 8000 	nop.w
 80056b4:	f3af 8000 	nop.w
 80056b8:	f3af 8000 	nop.w
 80056bc:	f3af 8000 	nop.w
	...

08005700 <KeccakF1600_StatePermute_RoundConstantsWithTerminator>:
 8005700:	00000001 	.word	0x00000001
	...
 800570c:	00000089 	.word	0x00000089
 8005710:	00000000 	.word	0x00000000
 8005714:	8000008b 	.word	0x8000008b
 8005718:	00000000 	.word	0x00000000
 800571c:	80008080 	.word	0x80008080
 8005720:	00000001 	.word	0x00000001
 8005724:	0000008b 	.word	0x0000008b
 8005728:	00000001 	.word	0x00000001
 800572c:	00008000 	.word	0x00008000
 8005730:	00000001 	.word	0x00000001
 8005734:	80008088 	.word	0x80008088
 8005738:	00000001 	.word	0x00000001
 800573c:	80000082 	.word	0x80000082
 8005740:	00000000 	.word	0x00000000
 8005744:	0000000b 	.word	0x0000000b
 8005748:	00000000 	.word	0x00000000
 800574c:	0000000a 	.word	0x0000000a
 8005750:	00000001 	.word	0x00000001
 8005754:	00008082 	.word	0x00008082
 8005758:	00000000 	.word	0x00000000
 800575c:	00008003 	.word	0x00008003
 8005760:	00000001 	.word	0x00000001
 8005764:	0000808b 	.word	0x0000808b
 8005768:	00000001 	.word	0x00000001
 800576c:	8000000b 	.word	0x8000000b
 8005770:	00000001 	.word	0x00000001
 8005774:	8000008a 	.word	0x8000008a
 8005778:	00000001 	.word	0x00000001
 800577c:	80000081 	.word	0x80000081
 8005780:	00000000 	.word	0x00000000
 8005784:	80000081 	.word	0x80000081
 8005788:	00000000 	.word	0x00000000
 800578c:	80000008 	.word	0x80000008
 8005790:	00000000 	.word	0x00000000
 8005794:	00000083 	.word	0x00000083
 8005798:	00000000 	.word	0x00000000
 800579c:	80008003 	.word	0x80008003
 80057a0:	00000001 	.word	0x00000001
 80057a4:	80008088 	.word	0x80008088
 80057a8:	00000000 	.word	0x00000000
 80057ac:	80000088 	.word	0x80000088
 80057b0:	00000001 	.word	0x00000001
 80057b4:	00008000 	.word	0x00008000
 80057b8:	00000000 	.word	0x00000000
 80057bc:	80008082 	.word	0x80008082
 80057c0:	000000ff 	.word	0x000000ff
 80057c4:	f3af 8000 	nop.w
 80057c8:	f3af 8000 	nop.w
 80057cc:	f3af 8000 	nop.w
 80057d0:	f3af 8000 	nop.w
 80057d4:	f3af 8000 	nop.w
 80057d8:	f3af 8000 	nop.w
 80057dc:	f3af 8000 	nop.w
 80057e0:	f3af 8000 	nop.w
 80057e4:	f3af 8000 	nop.w
 80057e8:	f3af 8000 	nop.w
 80057ec:	f3af 8000 	nop.w
 80057f0:	f3af 8000 	nop.w
 80057f4:	f3af 8000 	nop.w
 80057f8:	f3af 8000 	nop.w
 80057fc:	f3af 8000 	nop.w

08005800 <KeccakF1600_StatePermute>:
 8005800:	f2af 1104 	subw	r1, pc, #260	@ 0x104
 8005804:	e92d 5ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
 8005808:	b086      	sub	sp, #24
 800580a:	9105      	str	r1, [sp, #20]

0800580c <KeccakF1600_StatePermute_RoundLoop>:
 800580c:	f8d0 3020 	ldr.w	r3, [r0, #32]
 8005810:	f8d0 1048 	ldr.w	r1, [r0, #72]	@ 0x48
 8005814:	f8d0 5070 	ldr.w	r5, [r0, #112]	@ 0x70
 8005818:	f8d0 b098 	ldr.w	fp, [r0, #152]	@ 0x98
 800581c:	f8d0 c0c0 	ldr.w	ip, [r0, #192]	@ 0xc0
 8005820:	ea83 0301 	eor.w	r3, r3, r1
 8005824:	ea83 0305 	eor.w	r3, r3, r5
 8005828:	ea83 030b 	eor.w	r3, r3, fp
 800582c:	ea83 030c 	eor.w	r3, r3, ip
 8005830:	f8d0 700c 	ldr.w	r7, [r0, #12]
 8005834:	f8d0 1034 	ldr.w	r1, [r0, #52]	@ 0x34
 8005838:	f8d0 505c 	ldr.w	r5, [r0, #92]	@ 0x5c
 800583c:	f8d0 b084 	ldr.w	fp, [r0, #132]	@ 0x84
 8005840:	f8d0 c0ac 	ldr.w	ip, [r0, #172]	@ 0xac
 8005844:	ea87 0701 	eor.w	r7, r7, r1
 8005848:	ea87 0705 	eor.w	r7, r7, r5
 800584c:	ea87 070b 	eor.w	r7, r7, fp
 8005850:	ea87 070c 	eor.w	r7, r7, ip
 8005854:	ea83 76f7 	eor.w	r6, r3, r7, ror #31
 8005858:	f8d0 4014 	ldr.w	r4, [r0, #20]
 800585c:	f8d0 103c 	ldr.w	r1, [r0, #60]	@ 0x3c
 8005860:	f8d0 5064 	ldr.w	r5, [r0, #100]	@ 0x64
 8005864:	f8d0 b08c 	ldr.w	fp, [r0, #140]	@ 0x8c
 8005868:	f8d0 c0b4 	ldr.w	ip, [r0, #180]	@ 0xb4
 800586c:	f8cd 6000 	str.w	r6, [sp]
 8005870:	ea84 0401 	eor.w	r4, r4, r1
 8005874:	ea84 0405 	eor.w	r4, r4, r5
 8005878:	ea84 040b 	eor.w	r4, r4, fp
 800587c:	ea84 040c 	eor.w	r4, r4, ip
 8005880:	ea83 0604 	eor.w	r6, r3, r4
 8005884:	f8d0 3018 	ldr.w	r3, [r0, #24]
 8005888:	f8d0 1040 	ldr.w	r1, [r0, #64]	@ 0x40
 800588c:	f8d0 5068 	ldr.w	r5, [r0, #104]	@ 0x68
 8005890:	f8d0 b090 	ldr.w	fp, [r0, #144]	@ 0x90
 8005894:	f8d0 c0b8 	ldr.w	ip, [r0, #184]	@ 0xb8
 8005898:	f8cd 600c 	str.w	r6, [sp, #12]
 800589c:	ea83 0301 	eor.w	r3, r3, r1
 80058a0:	ea83 0305 	eor.w	r3, r3, r5
 80058a4:	ea83 030b 	eor.w	r3, r3, fp
 80058a8:	ea83 030c 	eor.w	r3, r3, ip
 80058ac:	ea87 0203 	eor.w	r2, r7, r3
 80058b0:	f8d0 7000 	ldr.w	r7, [r0]
 80058b4:	f8d0 1028 	ldr.w	r1, [r0, #40]	@ 0x28
 80058b8:	f8d0 5050 	ldr.w	r5, [r0, #80]	@ 0x50
 80058bc:	f8d0 b078 	ldr.w	fp, [r0, #120]	@ 0x78
 80058c0:	f8d0 c0a0 	ldr.w	ip, [r0, #160]	@ 0xa0
 80058c4:	ea87 0701 	eor.w	r7, r7, r1
 80058c8:	ea87 0705 	eor.w	r7, r7, r5
 80058cc:	ea87 070b 	eor.w	r7, r7, fp
 80058d0:	ea87 070c 	eor.w	r7, r7, ip
 80058d4:	ea87 7af4 	eor.w	sl, r7, r4, ror #31
 80058d8:	f8d0 401c 	ldr.w	r4, [r0, #28]
 80058dc:	f8d0 1044 	ldr.w	r1, [r0, #68]	@ 0x44
 80058e0:	f8d0 506c 	ldr.w	r5, [r0, #108]	@ 0x6c
 80058e4:	f8d0 b094 	ldr.w	fp, [r0, #148]	@ 0x94
 80058e8:	f8d0 c0bc 	ldr.w	ip, [r0, #188]	@ 0xbc
 80058ec:	ea84 0401 	eor.w	r4, r4, r1
 80058f0:	ea84 0405 	eor.w	r4, r4, r5
 80058f4:	ea84 040b 	eor.w	r4, r4, fp
 80058f8:	ea84 040c 	eor.w	r4, r4, ip
 80058fc:	ea84 0e07 	eor.w	lr, r4, r7
 8005900:	f8d0 7008 	ldr.w	r7, [r0, #8]
 8005904:	f8d0 1030 	ldr.w	r1, [r0, #48]	@ 0x30
 8005908:	f8d0 5058 	ldr.w	r5, [r0, #88]	@ 0x58
 800590c:	f8d0 b080 	ldr.w	fp, [r0, #128]	@ 0x80
 8005910:	f8d0 c0a8 	ldr.w	ip, [r0, #168]	@ 0xa8
 8005914:	ea87 0701 	eor.w	r7, r7, r1
 8005918:	ea87 0705 	eor.w	r7, r7, r5
 800591c:	ea87 070b 	eor.w	r7, r7, fp
 8005920:	ea87 070c 	eor.w	r7, r7, ip
 8005924:	ea87 76f4 	eor.w	r6, r7, r4, ror #31
 8005928:	f8d0 4024 	ldr.w	r4, [r0, #36]	@ 0x24
 800592c:	f8d0 104c 	ldr.w	r1, [r0, #76]	@ 0x4c
 8005930:	f8d0 5074 	ldr.w	r5, [r0, #116]	@ 0x74
 8005934:	f8d0 b09c 	ldr.w	fp, [r0, #156]	@ 0x9c
 8005938:	f8d0 c0c4 	ldr.w	ip, [r0, #196]	@ 0xc4
 800593c:	f8cd 6010 	str.w	r6, [sp, #16]
 8005940:	ea84 0401 	eor.w	r4, r4, r1
 8005944:	ea84 0405 	eor.w	r4, r4, r5
 8005948:	ea84 040b 	eor.w	r4, r4, fp
 800594c:	ea84 040c 	eor.w	r4, r4, ip
 8005950:	ea84 0807 	eor.w	r8, r4, r7
 8005954:	f8d0 7010 	ldr.w	r7, [r0, #16]
 8005958:	f8d0 1038 	ldr.w	r1, [r0, #56]	@ 0x38
 800595c:	f8d0 5060 	ldr.w	r5, [r0, #96]	@ 0x60
 8005960:	f8d0 b088 	ldr.w	fp, [r0, #136]	@ 0x88
 8005964:	f8d0 c0b0 	ldr.w	ip, [r0, #176]	@ 0xb0
 8005968:	f8cd 8004 	str.w	r8, [sp, #4]
 800596c:	ea87 0701 	eor.w	r7, r7, r1
 8005970:	ea87 0705 	eor.w	r7, r7, r5
 8005974:	ea87 070b 	eor.w	r7, r7, fp
 8005978:	ea87 070c 	eor.w	r7, r7, ip
 800597c:	ea87 79f4 	eor.w	r9, r7, r4, ror #31
 8005980:	f8d0 4004 	ldr.w	r4, [r0, #4]
 8005984:	f8d0 102c 	ldr.w	r1, [r0, #44]	@ 0x2c
 8005988:	f8d0 5054 	ldr.w	r5, [r0, #84]	@ 0x54
 800598c:	f8d0 b07c 	ldr.w	fp, [r0, #124]	@ 0x7c
 8005990:	f8d0 c0a4 	ldr.w	ip, [r0, #164]	@ 0xa4
 8005994:	f8cd 9008 	str.w	r9, [sp, #8]
 8005998:	ea84 0401 	eor.w	r4, r4, r1
 800599c:	ea84 0405 	eor.w	r4, r4, r5
 80059a0:	ea84 040b 	eor.w	r4, r4, fp
 80059a4:	ea84 040c 	eor.w	r4, r4, ip
 80059a8:	ea84 0b07 	eor.w	fp, r4, r7
 80059ac:	ea83 7cf4 	eor.w	ip, r3, r4, ror #31
 80059b0:	f8d0 3018 	ldr.w	r3, [r0, #24]
 80059b4:	f8d0 4048 	ldr.w	r4, [r0, #72]	@ 0x48
 80059b8:	f8d0 5054 	ldr.w	r5, [r0, #84]	@ 0x54
 80059bc:	f8d0 6084 	ldr.w	r6, [r0, #132]	@ 0x84
 80059c0:	f8d0 70b4 	ldr.w	r7, [r0, #180]	@ 0xb4
 80059c4:	f8c0 1054 	str.w	r1, [r0, #84]	@ 0x54
 80059c8:	ea89 0303 	eor.w	r3, r9, r3
 80059cc:	ea8c 0404 	eor.w	r4, ip, r4
 80059d0:	ea88 0505 	eor.w	r5, r8, r5
 80059d4:	ea8b 0606 	eor.w	r6, fp, r6
 80059d8:	ea82 0707 	eor.w	r7, r2, r7
 80059dc:	ea25 6134 	bic.w	r1, r5, r4, ror #24
 80059e0:	ea81 5133 	eor.w	r1, r1, r3, ror #20
 80059e4:	f8c0 1054 	str.w	r1, [r0, #84]	@ 0x54
 80059e8:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 80059ec:	ea81 3174 	eor.w	r1, r1, r4, ror #13
 80059f0:	f8c0 1084 	str.w	r1, [r0, #132]	@ 0x84
 80059f4:	ea27 2136 	bic.w	r1, r7, r6, ror #8
 80059f8:	ea81 7175 	eor.w	r1, r1, r5, ror #29
 80059fc:	f8c0 10b4 	str.w	r1, [r0, #180]	@ 0xb4
 8005a00:	ea23 31f7 	bic.w	r1, r3, r7, ror #15
 8005a04:	ea81 51f6 	eor.w	r1, r1, r6, ror #23
 8005a08:	f8c0 1018 	str.w	r1, [r0, #24]
 8005a0c:	ea24 7133 	bic.w	r1, r4, r3, ror #28
 8005a10:	ea81 21f7 	eor.w	r1, r1, r7, ror #11
 8005a14:	f8d0 3008 	ldr.w	r3, [r0, #8]
 8005a18:	f8d0 403c 	ldr.w	r4, [r0, #60]	@ 0x3c
 8005a1c:	f8d0 5068 	ldr.w	r5, [r0, #104]	@ 0x68
 8005a20:	f8d0 609c 	ldr.w	r6, [r0, #156]	@ 0x9c
 8005a24:	f8d0 70a4 	ldr.w	r7, [r0, #164]	@ 0xa4
 8005a28:	f8c0 1048 	str.w	r1, [r0, #72]	@ 0x48
 8005a2c:	ea8a 0303 	eor.w	r3, sl, r3
 8005a30:	ea82 0404 	eor.w	r4, r2, r4
 8005a34:	ea89 0505 	eor.w	r5, r9, r5
 8005a38:	ea8e 0606 	eor.w	r6, lr, r6
 8005a3c:	ea88 0707 	eor.w	r7, r8, r7
 8005a40:	ea25 2174 	bic.w	r1, r5, r4, ror #9
 8005a44:	ea81 3133 	eor.w	r1, r1, r3, ror #12
 8005a48:	f8c0 10a4 	str.w	r1, [r0, #164]	@ 0xa4
 8005a4c:	ea26 6135 	bic.w	r1, r6, r5, ror #24
 8005a50:	ea81 0174 	eor.w	r1, r1, r4, ror #1
 8005a54:	f8c0 1008 	str.w	r1, [r0, #8]
 8005a58:	ea27 1176 	bic.w	r1, r7, r6, ror #5
 8005a5c:	ea81 7175 	eor.w	r1, r1, r5, ror #29
 8005a60:	f8c0 103c 	str.w	r1, [r0, #60]	@ 0x3c
 8005a64:	ea23 51f7 	bic.w	r1, r3, r7, ror #23
 8005a68:	ea81 7136 	eor.w	r1, r1, r6, ror #28
 8005a6c:	f8c0 1068 	str.w	r1, [r0, #104]	@ 0x68
 8005a70:	ea24 01f3 	bic.w	r1, r4, r3, ror #3
 8005a74:	ea81 61b7 	eor.w	r1, r1, r7, ror #26
 8005a78:	f8dd 8000 	ldr.w	r8, [sp]
 8005a7c:	f8d0 3024 	ldr.w	r3, [r0, #36]	@ 0x24
 8005a80:	f8d0 4028 	ldr.w	r4, [r0, #40]	@ 0x28
 8005a84:	f8d0 5058 	ldr.w	r5, [r0, #88]	@ 0x58
 8005a88:	f8d0 608c 	ldr.w	r6, [r0, #140]	@ 0x8c
 8005a8c:	f8d0 70b8 	ldr.w	r7, [r0, #184]	@ 0xb8
 8005a90:	f8c0 109c 	str.w	r1, [r0, #156]	@ 0x9c
 8005a94:	ea8e 0303 	eor.w	r3, lr, r3
 8005a98:	ea88 0404 	eor.w	r4, r8, r4
 8005a9c:	ea8a 0505 	eor.w	r5, sl, r5
 8005aa0:	ea82 0606 	eor.w	r6, r2, r6
 8005aa4:	ea89 0707 	eor.w	r7, r9, r7
 8005aa8:	ea25 41f4 	bic.w	r1, r5, r4, ror #19
 8005aac:	ea81 51f3 	eor.w	r1, r1, r3, ror #23
 8005ab0:	f8c0 1028 	str.w	r1, [r0, #40]	@ 0x28
 8005ab4:	ea26 01f5 	bic.w	r1, r6, r5, ror #3
 8005ab8:	ea81 51b4 	eor.w	r1, r1, r4, ror #22
 8005abc:	f8c0 1058 	str.w	r1, [r0, #88]	@ 0x58
 8005ac0:	ea27 5136 	bic.w	r1, r7, r6, ror #20
 8005ac4:	ea81 51f5 	eor.w	r1, r1, r5, ror #23
 8005ac8:	f8c0 108c 	str.w	r1, [r0, #140]	@ 0x8c
 8005acc:	ea23 41b7 	bic.w	r1, r3, r7, ror #18
 8005ad0:	ea81 11b6 	eor.w	r1, r1, r6, ror #6
 8005ad4:	f8c0 10b8 	str.w	r1, [r0, #184]	@ 0xb8
 8005ad8:	ea24 1133 	bic.w	r1, r4, r3, ror #4
 8005adc:	ea81 51b7 	eor.w	r1, r1, r7, ror #22
 8005ae0:	f8d0 3014 	ldr.w	r3, [r0, #20]
 8005ae4:	f8d0 4040 	ldr.w	r4, [r0, #64]	@ 0x40
 8005ae8:	f8d0 5070 	ldr.w	r5, [r0, #112]	@ 0x70
 8005aec:	f8d0 6078 	ldr.w	r6, [r0, #120]	@ 0x78
 8005af0:	f8d0 70ac 	ldr.w	r7, [r0, #172]	@ 0xac
 8005af4:	f8c0 1024 	str.w	r1, [r0, #36]	@ 0x24
 8005af8:	ea82 0303 	eor.w	r3, r2, r3
 8005afc:	ea89 0404 	eor.w	r4, r9, r4
 8005b00:	ea8c 0505 	eor.w	r5, ip, r5
 8005b04:	ea88 0606 	eor.w	r6, r8, r6
 8005b08:	ea8b 0707 	eor.w	r7, fp, r7
 8005b0c:	ea25 6134 	bic.w	r1, r5, r4, ror #24
 8005b10:	ea81 5133 	eor.w	r1, r1, r3, ror #20
 8005b14:	f8c0 1078 	str.w	r1, [r0, #120]	@ 0x78
 8005b18:	ea26 0175 	bic.w	r1, r6, r5, ror #1
 8005b1c:	ea81 6174 	eor.w	r1, r1, r4, ror #25
 8005b20:	f8c0 10ac 	str.w	r1, [r0, #172]	@ 0xac
 8005b24:	ea27 3176 	bic.w	r1, r7, r6, ror #13
 8005b28:	ea81 31b5 	eor.w	r1, r1, r5, ror #14
 8005b2c:	f8c0 1014 	str.w	r1, [r0, #20]
 8005b30:	ea23 71b7 	bic.w	r1, r3, r7, ror #30
 8005b34:	ea81 21f6 	eor.w	r1, r1, r6, ror #11
 8005b38:	f8c0 1040 	str.w	r1, [r0, #64]	@ 0x40
 8005b3c:	ea24 7133 	bic.w	r1, r4, r3, ror #28
 8005b40:	ea81 61b7 	eor.w	r1, r1, r7, ror #26
 8005b44:	f8dd 900c 	ldr.w	r9, [sp, #12]
 8005b48:	f8d0 3000 	ldr.w	r3, [r0]
 8005b4c:	6b04      	ldr	r4, [r0, #48]	@ 0x30
 8005b4e:	6e45      	ldr	r5, [r0, #100]	@ 0x64
 8005b50:	f8d0 6094 	ldr.w	r6, [r0, #148]	@ 0x94
 8005b54:	f8d0 70c0 	ldr.w	r7, [r0, #192]	@ 0xc0
 8005b58:	f8c0 1070 	str.w	r1, [r0, #112]	@ 0x70
 8005b5c:	ea88 0303 	eor.w	r3, r8, r3
 8005b60:	ea8a 0404 	eor.w	r4, sl, r4
 8005b64:	ea82 0505 	eor.w	r5, r2, r5
 8005b68:	ea89 0606 	eor.w	r6, r9, r6
 8005b6c:	ea8c 0707 	eor.w	r7, ip, r7
 8005b70:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 8005b74:	ea81 5174 	eor.w	r1, r1, r4, ror #21
 8005b78:	f8c0 1030 	str.w	r1, [r0, #48]	@ 0x30
 8005b7c:	ea27 7136 	bic.w	r1, r7, r6, ror #28
 8005b80:	ea81 4175 	eor.w	r1, r1, r5, ror #17
 8005b84:	f8c0 1064 	str.w	r1, [r0, #100]	@ 0x64
 8005b88:	ea23 6177 	bic.w	r1, r3, r7, ror #25
 8005b8c:	ea81 5176 	eor.w	r1, r1, r6, ror #21
 8005b90:	f8c0 1094 	str.w	r1, [r0, #148]	@ 0x94
 8005b94:	ea24 51b3 	bic.w	r1, r4, r3, ror #22
 8005b98:	ea81 31f7 	eor.w	r1, r1, r7, ror #15
 8005b9c:	f8c0 10c0 	str.w	r1, [r0, #192]	@ 0xc0
 8005ba0:	ea25 0504 	bic.w	r5, r5, r4
 8005ba4:	9905      	ldr	r1, [sp, #20]
 8005ba6:	680c      	ldr	r4, [r1, #0]
 8005ba8:	ea83 23b5 	eor.w	r3, r3, r5, ror #10
 8005bac:	ea84 0103 	eor.w	r1, r4, r3
 8005bb0:	f8dd 2010 	ldr.w	r2, [sp, #16]
 8005bb4:	f8d0 301c 	ldr.w	r3, [r0, #28]
 8005bb8:	f8d0 404c 	ldr.w	r4, [r0, #76]	@ 0x4c
 8005bbc:	f8d0 5050 	ldr.w	r5, [r0, #80]	@ 0x50
 8005bc0:	f8d0 6080 	ldr.w	r6, [r0, #128]	@ 0x80
 8005bc4:	f8d0 70b0 	ldr.w	r7, [r0, #176]	@ 0xb0
 8005bc8:	f8c0 1000 	str.w	r1, [r0]
 8005bcc:	ea89 0303 	eor.w	r3, r9, r3
 8005bd0:	ea8e 0404 	eor.w	r4, lr, r4
 8005bd4:	ea88 0505 	eor.w	r5, r8, r5
 8005bd8:	ea8a 0606 	eor.w	r6, sl, r6
 8005bdc:	ea82 0707 	eor.w	r7, r2, r7
 8005be0:	ea25 51f4 	bic.w	r1, r5, r4, ror #23
 8005be4:	ea81 41f3 	eor.w	r1, r1, r3, ror #19
 8005be8:	f8c0 1050 	str.w	r1, [r0, #80]	@ 0x50
 8005bec:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 8005bf0:	ea81 3134 	eor.w	r1, r1, r4, ror #12
 8005bf4:	f8c0 1080 	str.w	r1, [r0, #128]	@ 0x80
 8005bf8:	ea27 2136 	bic.w	r1, r7, r6, ror #8
 8005bfc:	ea81 7175 	eor.w	r1, r1, r5, ror #29
 8005c00:	f8c0 10b0 	str.w	r1, [r0, #176]	@ 0xb0
 8005c04:	ea23 4137 	bic.w	r1, r3, r7, ror #16
 8005c08:	ea81 6136 	eor.w	r1, r1, r6, ror #24
 8005c0c:	f8c0 101c 	str.w	r1, [r0, #28]
 8005c10:	ea24 7133 	bic.w	r1, r4, r3, ror #28
 8005c14:	ea81 3137 	eor.w	r1, r1, r7, ror #12
 8005c18:	f8d0 300c 	ldr.w	r3, [r0, #12]
 8005c1c:	f8d0 4038 	ldr.w	r4, [r0, #56]	@ 0x38
 8005c20:	f8d0 506c 	ldr.w	r5, [r0, #108]	@ 0x6c
 8005c24:	f8d0 6098 	ldr.w	r6, [r0, #152]	@ 0x98
 8005c28:	f8d0 70a0 	ldr.w	r7, [r0, #160]	@ 0xa0
 8005c2c:	f8c0 104c 	str.w	r1, [r0, #76]	@ 0x4c
 8005c30:	ea8b 0303 	eor.w	r3, fp, r3
 8005c34:	ea82 0404 	eor.w	r4, r2, r4
 8005c38:	ea89 0505 	eor.w	r5, r9, r5
 8005c3c:	ea8c 0606 	eor.w	r6, ip, r6
 8005c40:	ea88 0707 	eor.w	r7, r8, r7
 8005c44:	ea25 21b4 	bic.w	r1, r5, r4, ror #10
 8005c48:	ea81 3133 	eor.w	r1, r1, r3, ror #12
 8005c4c:	f8c0 10a0 	str.w	r1, [r0, #160]	@ 0xa0
 8005c50:	ea26 51f5 	bic.w	r1, r6, r5, ror #23
 8005c54:	ea81 0174 	eor.w	r1, r1, r4, ror #1
 8005c58:	f8c0 100c 	str.w	r1, [r0, #12]
 8005c5c:	ea27 1176 	bic.w	r1, r7, r6, ror #5
 8005c60:	ea81 7135 	eor.w	r1, r1, r5, ror #28
 8005c64:	f8c0 1038 	str.w	r1, [r0, #56]	@ 0x38
 8005c68:	ea23 6137 	bic.w	r1, r3, r7, ror #24
 8005c6c:	ea81 7176 	eor.w	r1, r1, r6, ror #29
 8005c70:	f8c0 106c 	str.w	r1, [r0, #108]	@ 0x6c
 8005c74:	ea24 01b3 	bic.w	r1, r4, r3, ror #2
 8005c78:	ea81 61b7 	eor.w	r1, r1, r7, ror #26
 8005c7c:	f8dd 8004 	ldr.w	r8, [sp, #4]
 8005c80:	f8d0 3020 	ldr.w	r3, [r0, #32]
 8005c84:	f8d0 402c 	ldr.w	r4, [r0, #44]	@ 0x2c
 8005c88:	f8d0 505c 	ldr.w	r5, [r0, #92]	@ 0x5c
 8005c8c:	f8d0 6088 	ldr.w	r6, [r0, #136]	@ 0x88
 8005c90:	f8d0 70bc 	ldr.w	r7, [r0, #188]	@ 0xbc
 8005c94:	f8c0 1098 	str.w	r1, [r0, #152]	@ 0x98
 8005c98:	ea8c 0303 	eor.w	r3, ip, r3
 8005c9c:	ea88 0404 	eor.w	r4, r8, r4
 8005ca0:	ea8b 0505 	eor.w	r5, fp, r5
 8005ca4:	ea82 0606 	eor.w	r6, r2, r6
 8005ca8:	ea89 0707 	eor.w	r7, r9, r7
 8005cac:	ea25 41f4 	bic.w	r1, r5, r4, ror #19
 8005cb0:	ea81 6133 	eor.w	r1, r1, r3, ror #24
 8005cb4:	f8c0 102c 	str.w	r1, [r0, #44]	@ 0x2c
 8005cb8:	ea26 01b5 	bic.w	r1, r6, r5, ror #2
 8005cbc:	ea81 5174 	eor.w	r1, r1, r4, ror #21
 8005cc0:	f8c0 105c 	str.w	r1, [r0, #92]	@ 0x5c
 8005cc4:	ea27 5176 	bic.w	r1, r7, r6, ror #21
 8005cc8:	ea81 51f5 	eor.w	r1, r1, r5, ror #23
 8005ccc:	f8c0 1088 	str.w	r1, [r0, #136]	@ 0x88
 8005cd0:	ea23 4177 	bic.w	r1, r3, r7, ror #17
 8005cd4:	ea81 11b6 	eor.w	r1, r1, r6, ror #6
 8005cd8:	f8c0 10bc 	str.w	r1, [r0, #188]	@ 0xbc
 8005cdc:	ea24 1173 	bic.w	r1, r4, r3, ror #5
 8005ce0:	ea81 51b7 	eor.w	r1, r1, r7, ror #22
 8005ce4:	f8d0 3010 	ldr.w	r3, [r0, #16]
 8005ce8:	f8d0 4044 	ldr.w	r4, [r0, #68]	@ 0x44
 8005cec:	f8d0 5074 	ldr.w	r5, [r0, #116]	@ 0x74
 8005cf0:	f8d0 607c 	ldr.w	r6, [r0, #124]	@ 0x7c
 8005cf4:	f8d0 70a8 	ldr.w	r7, [r0, #168]	@ 0xa8
 8005cf8:	f8c0 1020 	str.w	r1, [r0, #32]
 8005cfc:	ea82 0303 	eor.w	r3, r2, r3
 8005d00:	ea89 0404 	eor.w	r4, r9, r4
 8005d04:	ea8e 0505 	eor.w	r5, lr, r5
 8005d08:	ea88 0606 	eor.w	r6, r8, r6
 8005d0c:	ea8a 0707 	eor.w	r7, sl, r7
 8005d10:	ea25 6134 	bic.w	r1, r5, r4, ror #24
 8005d14:	ea81 5173 	eor.w	r1, r1, r3, ror #21
 8005d18:	f8c0 107c 	str.w	r1, [r0, #124]	@ 0x7c
 8005d1c:	ea26 0175 	bic.w	r1, r6, r5, ror #1
 8005d20:	ea81 6174 	eor.w	r1, r1, r4, ror #25
 8005d24:	f8c0 10a8 	str.w	r1, [r0, #168]	@ 0xa8
 8005d28:	ea27 3136 	bic.w	r1, r7, r6, ror #12
 8005d2c:	ea81 3175 	eor.w	r1, r1, r5, ror #13
 8005d30:	f8c0 1010 	str.w	r1, [r0, #16]
 8005d34:	ea23 71b7 	bic.w	r1, r3, r7, ror #30
 8005d38:	ea81 21b6 	eor.w	r1, r1, r6, ror #10
 8005d3c:	f8c0 1044 	str.w	r1, [r0, #68]	@ 0x44
 8005d40:	ea24 7173 	bic.w	r1, r4, r3, ror #29
 8005d44:	ea81 61f7 	eor.w	r1, r1, r7, ror #27
 8005d48:	f8dd 9008 	ldr.w	r9, [sp, #8]
 8005d4c:	f8d0 3004 	ldr.w	r3, [r0, #4]
 8005d50:	6b44      	ldr	r4, [r0, #52]	@ 0x34
 8005d52:	6e05      	ldr	r5, [r0, #96]	@ 0x60
 8005d54:	f8d0 6090 	ldr.w	r6, [r0, #144]	@ 0x90
 8005d58:	f8d0 70c4 	ldr.w	r7, [r0, #196]	@ 0xc4
 8005d5c:	f8c0 1074 	str.w	r1, [r0, #116]	@ 0x74
 8005d60:	ea88 0303 	eor.w	r3, r8, r3
 8005d64:	ea8b 0404 	eor.w	r4, fp, r4
 8005d68:	ea82 0505 	eor.w	r5, r2, r5
 8005d6c:	ea89 0606 	eor.w	r6, r9, r6
 8005d70:	ea8e 0707 	eor.w	r7, lr, r7
 8005d74:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 8005d78:	ea81 5134 	eor.w	r1, r1, r4, ror #20
 8005d7c:	f8c0 1034 	str.w	r1, [r0, #52]	@ 0x34
 8005d80:	ea27 7176 	bic.w	r1, r7, r6, ror #29
 8005d84:	ea81 41b5 	eor.w	r1, r1, r5, ror #18
 8005d88:	f8c0 1060 	str.w	r1, [r0, #96]	@ 0x60
 8005d8c:	ea23 6177 	bic.w	r1, r3, r7, ror #25
 8005d90:	ea81 51b6 	eor.w	r1, r1, r6, ror #22
 8005d94:	f8c0 1090 	str.w	r1, [r0, #144]	@ 0x90
 8005d98:	ea24 51b3 	bic.w	r1, r4, r3, ror #22
 8005d9c:	ea81 31f7 	eor.w	r1, r1, r7, ror #15
 8005da0:	f8c0 10c4 	str.w	r1, [r0, #196]	@ 0xc4
 8005da4:	ea25 75f4 	bic.w	r5, r5, r4, ror #31
 8005da8:	9905      	ldr	r1, [sp, #20]
 8005daa:	684c      	ldr	r4, [r1, #4]
 8005dac:	ea83 23f5 	eor.w	r3, r3, r5, ror #11
 8005db0:	ea84 0e03 	eor.w	lr, r4, r3
 8005db4:	f8d0 30c0 	ldr.w	r3, [r0, #192]	@ 0xc0
 8005db8:	f8d0 1048 	ldr.w	r1, [r0, #72]	@ 0x48
 8005dbc:	f8d0 5098 	ldr.w	r5, [r0, #152]	@ 0x98
 8005dc0:	f8d0 b024 	ldr.w	fp, [r0, #36]	@ 0x24
 8005dc4:	f8d0 c074 	ldr.w	ip, [r0, #116]	@ 0x74
 8005dc8:	f8c0 e004 	str.w	lr, [r0, #4]
 8005dcc:	ea83 3331 	eor.w	r3, r3, r1, ror #12
 8005dd0:	ea83 43f5 	eor.w	r3, r3, r5, ror #19
 8005dd4:	ea83 133b 	eor.w	r3, r3, fp, ror #4
 8005dd8:	ea83 63bc 	eor.w	r3, r3, ip, ror #26
 8005ddc:	f8d0 7034 	ldr.w	r7, [r0, #52]	@ 0x34
 8005de0:	f8d0 1080 	ldr.w	r1, [r0, #128]	@ 0x80
 8005de4:	f8d0 5008 	ldr.w	r5, [r0, #8]
 8005de8:	f8d0 b05c 	ldr.w	fp, [r0, #92]	@ 0x5c
 8005dec:	f8d0 c0ac 	ldr.w	ip, [r0, #172]	@ 0xac
 8005df0:	ea87 5731 	eor.w	r7, r7, r1, ror #20
 8005df4:	ea87 17b5 	eor.w	r7, r7, r5, ror #6
 8005df8:	ea87 07fb 	eor.w	r7, r7, fp, ror #3
 8005dfc:	ea87 57bc 	eor.w	r7, r7, ip, ror #22
 8005e00:	ea4f 23b3 	mov.w	r3, r3, ror #10
 8005e04:	ea83 5677 	eor.w	r6, r3, r7, ror #21
 8005e08:	f8d0 4060 	ldr.w	r4, [r0, #96]	@ 0x60
 8005e0c:	f8d0 10b0 	ldr.w	r1, [r0, #176]	@ 0xb0
 8005e10:	f8d0 503c 	ldr.w	r5, [r0, #60]	@ 0x3c
 8005e14:	f8d0 b088 	ldr.w	fp, [r0, #136]	@ 0x88
 8005e18:	f8d0 c014 	ldr.w	ip, [r0, #20]
 8005e1c:	f8cd 6000 	str.w	r6, [sp]
 8005e20:	ea84 2471 	eor.w	r4, r4, r1, ror #9
 8005e24:	ea84 74b5 	eor.w	r4, r4, r5, ror #30
 8005e28:	ea84 24fb 	eor.w	r4, r4, fp, ror #11
 8005e2c:	ea84 14bc 	eor.w	r4, r4, ip, ror #6
 8005e30:	ea83 6674 	eor.w	r6, r3, r4, ror #25
 8005e34:	f8d0 3094 	ldr.w	r3, [r0, #148]	@ 0x94
 8005e38:	f8d0 1018 	ldr.w	r1, [r0, #24]
 8005e3c:	f8d0 506c 	ldr.w	r5, [r0, #108]	@ 0x6c
 8005e40:	f8d0 b0b8 	ldr.w	fp, [r0, #184]	@ 0xb8
 8005e44:	f8d0 c044 	ldr.w	ip, [r0, #68]	@ 0x44
 8005e48:	f8cd 600c 	str.w	r6, [sp, #12]
 8005e4c:	ea83 43b1 	eor.w	r3, r3, r1, ror #18
 8005e50:	ea83 73f5 	eor.w	r3, r3, r5, ror #31
 8005e54:	ea83 43bb 	eor.w	r3, r3, fp, ror #18
 8005e58:	ea83 037c 	eor.w	r3, r3, ip, ror #1
 8005e5c:	ea83 52b7 	eor.w	r2, r3, r7, ror #22
 8005e60:	f8d0 7000 	ldr.w	r7, [r0]
 8005e64:	f8d0 1054 	ldr.w	r1, [r0, #84]	@ 0x54
 8005e68:	f8d0 50a0 	ldr.w	r5, [r0, #160]	@ 0xa0
 8005e6c:	f8d0 b028 	ldr.w	fp, [r0, #40]	@ 0x28
 8005e70:	f8d0 c07c 	ldr.w	ip, [r0, #124]	@ 0x7c
 8005e74:	ea87 77b1 	eor.w	r7, r7, r1, ror #30
 8005e78:	ea87 47f5 	eor.w	r7, r7, r5, ror #19
 8005e7c:	ea87 67fb 	eor.w	r7, r7, fp, ror #27
 8005e80:	ea87 373c 	eor.w	r7, r7, ip, ror #12
 8005e84:	ea87 6a34 	eor.w	sl, r7, r4, ror #24
 8005e88:	f8d0 4090 	ldr.w	r4, [r0, #144]	@ 0x90
 8005e8c:	f8d0 101c 	ldr.w	r1, [r0, #28]
 8005e90:	f8d0 5068 	ldr.w	r5, [r0, #104]	@ 0x68
 8005e94:	f8d0 b0bc 	ldr.w	fp, [r0, #188]	@ 0xbc
 8005e98:	f8d0 c040 	ldr.w	ip, [r0, #64]	@ 0x40
 8005e9c:	ea84 44b1 	eor.w	r4, r4, r1, ror #18
 8005ea0:	ea84 0405 	eor.w	r4, r4, r5
 8005ea4:	ea84 44fb 	eor.w	r4, r4, fp, ror #19
 8005ea8:	ea84 047c 	eor.w	r4, r4, ip, ror #1
 8005eac:	ea84 0e07 	eor.w	lr, r4, r7
 8005eb0:	f8d0 7030 	ldr.w	r7, [r0, #48]	@ 0x30
 8005eb4:	f8d0 1084 	ldr.w	r1, [r0, #132]	@ 0x84
 8005eb8:	f8d0 500c 	ldr.w	r5, [r0, #12]
 8005ebc:	f8d0 b058 	ldr.w	fp, [r0, #88]	@ 0x58
 8005ec0:	f8d0 c0a8 	ldr.w	ip, [r0, #168]	@ 0xa8
 8005ec4:	ea87 5731 	eor.w	r7, r7, r1, ror #20
 8005ec8:	ea87 17f5 	eor.w	r7, r7, r5, ror #7
 8005ecc:	ea87 07fb 	eor.w	r7, r7, fp, ror #3
 8005ed0:	ea87 57bc 	eor.w	r7, r7, ip, ror #22
 8005ed4:	ea4f 5777 	mov.w	r7, r7, ror #21
 8005ed8:	ea87 76f4 	eor.w	r6, r7, r4, ror #31
 8005edc:	f8d0 40c4 	ldr.w	r4, [r0, #196]	@ 0xc4
 8005ee0:	f8d0 104c 	ldr.w	r1, [r0, #76]	@ 0x4c
 8005ee4:	f8d0 509c 	ldr.w	r5, [r0, #156]	@ 0x9c
 8005ee8:	f8d0 b020 	ldr.w	fp, [r0, #32]
 8005eec:	f8d0 c070 	ldr.w	ip, [r0, #112]	@ 0x70
 8005ef0:	f8cd 6010 	str.w	r6, [sp, #16]
 8005ef4:	ea84 3431 	eor.w	r4, r4, r1, ror #12
 8005ef8:	ea84 44f5 	eor.w	r4, r4, r5, ror #19
 8005efc:	ea84 143b 	eor.w	r4, r4, fp, ror #4
 8005f00:	ea84 64fc 	eor.w	r4, r4, ip, ror #27
 8005f04:	ea87 28b4 	eor.w	r8, r7, r4, ror #10
 8005f08:	f8d0 7064 	ldr.w	r7, [r0, #100]	@ 0x64
 8005f0c:	f8d0 10b4 	ldr.w	r1, [r0, #180]	@ 0xb4
 8005f10:	f8d0 5038 	ldr.w	r5, [r0, #56]	@ 0x38
 8005f14:	f8d0 b08c 	ldr.w	fp, [r0, #140]	@ 0x8c
 8005f18:	f8d0 c010 	ldr.w	ip, [r0, #16]
 8005f1c:	f8cd 8004 	str.w	r8, [sp, #4]
 8005f20:	ea87 2731 	eor.w	r7, r7, r1, ror #8
 8005f24:	ea87 77b5 	eor.w	r7, r7, r5, ror #30
 8005f28:	ea87 27fb 	eor.w	r7, r7, fp, ror #11
 8005f2c:	ea87 17bc 	eor.w	r7, r7, ip, ror #6
 8005f30:	ea4f 6777 	mov.w	r7, r7, ror #25
 8005f34:	ea87 2974 	eor.w	r9, r7, r4, ror #9
 8005f38:	f8d0 4004 	ldr.w	r4, [r0, #4]
 8005f3c:	f8d0 1050 	ldr.w	r1, [r0, #80]	@ 0x50
 8005f40:	f8d0 50a4 	ldr.w	r5, [r0, #164]	@ 0xa4
 8005f44:	f8d0 b02c 	ldr.w	fp, [r0, #44]	@ 0x2c
 8005f48:	f8d0 c078 	ldr.w	ip, [r0, #120]	@ 0x78
 8005f4c:	f8cd 9008 	str.w	r9, [sp, #8]
 8005f50:	ea84 74f1 	eor.w	r4, r4, r1, ror #31
 8005f54:	ea84 5435 	eor.w	r4, r4, r5, ror #20
 8005f58:	ea84 64fb 	eor.w	r4, r4, fp, ror #27
 8005f5c:	ea84 347c 	eor.w	r4, r4, ip, ror #13
 8005f60:	ea84 0b07 	eor.w	fp, r4, r7
 8005f64:	ea83 7cf4 	eor.w	ip, r3, r4, ror #31
 8005f68:	f8d0 3094 	ldr.w	r3, [r0, #148]	@ 0x94
 8005f6c:	f8d0 4048 	ldr.w	r4, [r0, #72]	@ 0x48
 8005f70:	f8d0 50a4 	ldr.w	r5, [r0, #164]	@ 0xa4
 8005f74:	f8d0 605c 	ldr.w	r6, [r0, #92]	@ 0x5c
 8005f78:	f8d0 7014 	ldr.w	r7, [r0, #20]
 8005f7c:	f8c0 10a4 	str.w	r1, [r0, #164]	@ 0xa4
 8005f80:	ea89 0303 	eor.w	r3, r9, r3
 8005f84:	ea8c 54b4 	eor.w	r4, ip, r4, ror #22
 8005f88:	ea88 5535 	eor.w	r5, r8, r5, ror #20
 8005f8c:	ea8b 6676 	eor.w	r6, fp, r6, ror #25
 8005f90:	ea82 77f7 	eor.w	r7, r2, r7, ror #31
 8005f94:	ea25 6134 	bic.w	r1, r5, r4, ror #24
 8005f98:	ea81 5133 	eor.w	r1, r1, r3, ror #20
 8005f9c:	f8c0 10a4 	str.w	r1, [r0, #164]	@ 0xa4
 8005fa0:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 8005fa4:	ea81 3174 	eor.w	r1, r1, r4, ror #13
 8005fa8:	f8c0 105c 	str.w	r1, [r0, #92]	@ 0x5c
 8005fac:	ea27 2136 	bic.w	r1, r7, r6, ror #8
 8005fb0:	ea81 7175 	eor.w	r1, r1, r5, ror #29
 8005fb4:	f8c0 1014 	str.w	r1, [r0, #20]
 8005fb8:	ea23 31f7 	bic.w	r1, r3, r7, ror #15
 8005fbc:	ea81 51f6 	eor.w	r1, r1, r6, ror #23
 8005fc0:	f8c0 1094 	str.w	r1, [r0, #148]	@ 0x94
 8005fc4:	ea24 7133 	bic.w	r1, r4, r3, ror #28
 8005fc8:	ea81 21f7 	eor.w	r1, r1, r7, ror #11
 8005fcc:	f8d0 3030 	ldr.w	r3, [r0, #48]	@ 0x30
 8005fd0:	f8d0 40b0 	ldr.w	r4, [r0, #176]	@ 0xb0
 8005fd4:	f8d0 506c 	ldr.w	r5, [r0, #108]	@ 0x6c
 8005fd8:	f8d0 6020 	ldr.w	r6, [r0, #32]
 8005fdc:	f8d0 7078 	ldr.w	r7, [r0, #120]	@ 0x78
 8005fe0:	f8c0 1048 	str.w	r1, [r0, #72]	@ 0x48
 8005fe4:	ea8a 5373 	eor.w	r3, sl, r3, ror #21
 8005fe8:	ea82 04b4 	eor.w	r4, r2, r4, ror #2
 8005fec:	ea89 75f5 	eor.w	r5, r9, r5, ror #31
 8005ff0:	ea8e 36b6 	eor.w	r6, lr, r6, ror #14
 8005ff4:	ea88 3777 	eor.w	r7, r8, r7, ror #13
 8005ff8:	ea25 2174 	bic.w	r1, r5, r4, ror #9
 8005ffc:	ea81 3133 	eor.w	r1, r1, r3, ror #12
 8006000:	f8c0 1078 	str.w	r1, [r0, #120]	@ 0x78
 8006004:	ea26 6135 	bic.w	r1, r6, r5, ror #24
 8006008:	ea81 0174 	eor.w	r1, r1, r4, ror #1
 800600c:	f8c0 1030 	str.w	r1, [r0, #48]	@ 0x30
 8006010:	ea27 1176 	bic.w	r1, r7, r6, ror #5
 8006014:	ea81 7175 	eor.w	r1, r1, r5, ror #29
 8006018:	f8c0 10b0 	str.w	r1, [r0, #176]	@ 0xb0
 800601c:	ea23 51f7 	bic.w	r1, r3, r7, ror #23
 8006020:	ea81 7136 	eor.w	r1, r1, r6, ror #28
 8006024:	f8c0 106c 	str.w	r1, [r0, #108]	@ 0x6c
 8006028:	ea24 01f3 	bic.w	r1, r4, r3, ror #3
 800602c:	ea81 61b7 	eor.w	r1, r1, r7, ror #26
 8006030:	f8dd 8000 	ldr.w	r8, [sp]
 8006034:	f8d0 30c4 	ldr.w	r3, [r0, #196]	@ 0xc4
 8006038:	f8d0 4054 	ldr.w	r4, [r0, #84]	@ 0x54
 800603c:	f8d0 500c 	ldr.w	r5, [r0, #12]
 8006040:	f8d0 6088 	ldr.w	r6, [r0, #136]	@ 0x88
 8006044:	f8d0 7044 	ldr.w	r7, [r0, #68]	@ 0x44
 8006048:	f8c0 1020 	str.w	r1, [r0, #32]
 800604c:	ea8e 23b3 	eor.w	r3, lr, r3, ror #10
 8006050:	ea88 74b4 	eor.w	r4, r8, r4, ror #30
 8006054:	ea8a 7535 	eor.w	r5, sl, r5, ror #28
 8006058:	ea82 1636 	eor.w	r6, r2, r6, ror #4
 800605c:	ea89 0777 	eor.w	r7, r9, r7, ror #1
 8006060:	ea25 41f4 	bic.w	r1, r5, r4, ror #19
 8006064:	ea81 51f3 	eor.w	r1, r1, r3, ror #23
 8006068:	f8c0 1054 	str.w	r1, [r0, #84]	@ 0x54
 800606c:	ea26 01f5 	bic.w	r1, r6, r5, ror #3
 8006070:	ea81 51b4 	eor.w	r1, r1, r4, ror #22
 8006074:	f8c0 100c 	str.w	r1, [r0, #12]
 8006078:	ea27 5136 	bic.w	r1, r7, r6, ror #20
 800607c:	ea81 51f5 	eor.w	r1, r1, r5, ror #23
 8006080:	f8c0 1088 	str.w	r1, [r0, #136]	@ 0x88
 8006084:	ea23 41b7 	bic.w	r1, r3, r7, ror #18
 8006088:	ea81 11b6 	eor.w	r1, r1, r6, ror #6
 800608c:	f8c0 1044 	str.w	r1, [r0, #68]	@ 0x44
 8006090:	ea24 1133 	bic.w	r1, r4, r3, ror #4
 8006094:	ea81 51b7 	eor.w	r1, r1, r7, ror #22
 8006098:	f8d0 3060 	ldr.w	r3, [r0, #96]	@ 0x60
 800609c:	f8d0 4018 	ldr.w	r4, [r0, #24]
 80060a0:	f8d0 5098 	ldr.w	r5, [r0, #152]	@ 0x98
 80060a4:	f8d0 6028 	ldr.w	r6, [r0, #40]	@ 0x28
 80060a8:	f8d0 70ac 	ldr.w	r7, [r0, #172]	@ 0xac
 80060ac:	f8c0 10c4 	str.w	r1, [r0, #196]	@ 0xc4
 80060b0:	ea82 6373 	eor.w	r3, r2, r3, ror #25
 80060b4:	ea89 44b4 	eor.w	r4, r9, r4, ror #18
 80060b8:	ea8c 7575 	eor.w	r5, ip, r5, ror #29
 80060bc:	ea88 66f6 	eor.w	r6, r8, r6, ror #27
 80060c0:	ea8b 3737 	eor.w	r7, fp, r7, ror #12
 80060c4:	ea25 6134 	bic.w	r1, r5, r4, ror #24
 80060c8:	ea81 5133 	eor.w	r1, r1, r3, ror #20
 80060cc:	f8c0 1028 	str.w	r1, [r0, #40]	@ 0x28
 80060d0:	ea26 0175 	bic.w	r1, r6, r5, ror #1
 80060d4:	ea81 6174 	eor.w	r1, r1, r4, ror #25
 80060d8:	f8c0 10ac 	str.w	r1, [r0, #172]	@ 0xac
 80060dc:	ea27 3176 	bic.w	r1, r7, r6, ror #13
 80060e0:	ea81 31b5 	eor.w	r1, r1, r5, ror #14
 80060e4:	f8c0 1060 	str.w	r1, [r0, #96]	@ 0x60
 80060e8:	ea23 71b7 	bic.w	r1, r3, r7, ror #30
 80060ec:	ea81 21f6 	eor.w	r1, r1, r6, ror #11
 80060f0:	f8c0 1018 	str.w	r1, [r0, #24]
 80060f4:	ea24 7133 	bic.w	r1, r4, r3, ror #28
 80060f8:	ea81 61b7 	eor.w	r1, r1, r7, ror #26
 80060fc:	f8dd 900c 	ldr.w	r9, [sp, #12]
 8006100:	f8d0 3000 	ldr.w	r3, [r0]
 8006104:	f8d0 4084 	ldr.w	r4, [r0, #132]	@ 0x84
 8006108:	6bc5      	ldr	r5, [r0, #60]	@ 0x3c
 800610a:	f8d0 60bc 	ldr.w	r6, [r0, #188]	@ 0xbc
 800610e:	6f47      	ldr	r7, [r0, #116]	@ 0x74
 8006110:	f8c0 1098 	str.w	r1, [r0, #152]	@ 0x98
 8006114:	ea88 0303 	eor.w	r3, r8, r3
 8006118:	ea8a 2474 	eor.w	r4, sl, r4, ror #9
 800611c:	ea82 55f5 	eor.w	r5, r2, r5, ror #23
 8006120:	ea89 46f6 	eor.w	r6, r9, r6, ror #19
 8006124:	ea8c 1737 	eor.w	r7, ip, r7, ror #4
 8006128:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 800612c:	ea81 5174 	eor.w	r1, r1, r4, ror #21
 8006130:	f8c0 1084 	str.w	r1, [r0, #132]	@ 0x84
 8006134:	ea27 7136 	bic.w	r1, r7, r6, ror #28
 8006138:	ea81 4175 	eor.w	r1, r1, r5, ror #17
 800613c:	f8c0 103c 	str.w	r1, [r0, #60]	@ 0x3c
 8006140:	ea23 6177 	bic.w	r1, r3, r7, ror #25
 8006144:	ea81 5176 	eor.w	r1, r1, r6, ror #21
 8006148:	f8c0 10bc 	str.w	r1, [r0, #188]	@ 0xbc
 800614c:	ea24 51b3 	bic.w	r1, r4, r3, ror #22
 8006150:	ea81 31f7 	eor.w	r1, r1, r7, ror #15
 8006154:	f8c0 1074 	str.w	r1, [r0, #116]	@ 0x74
 8006158:	ea25 0504 	bic.w	r5, r5, r4
 800615c:	9905      	ldr	r1, [sp, #20]
 800615e:	688c      	ldr	r4, [r1, #8]
 8006160:	ea83 23b5 	eor.w	r3, r3, r5, ror #10
 8006164:	ea84 0103 	eor.w	r1, r4, r3
 8006168:	f8dd 2010 	ldr.w	r2, [sp, #16]
 800616c:	f8d0 3090 	ldr.w	r3, [r0, #144]	@ 0x90
 8006170:	f8d0 404c 	ldr.w	r4, [r0, #76]	@ 0x4c
 8006174:	f8d0 50a0 	ldr.w	r5, [r0, #160]	@ 0xa0
 8006178:	f8d0 6058 	ldr.w	r6, [r0, #88]	@ 0x58
 800617c:	f8d0 7010 	ldr.w	r7, [r0, #16]
 8006180:	f8c0 1000 	str.w	r1, [r0]
 8006184:	ea89 0303 	eor.w	r3, r9, r3
 8006188:	ea8e 54b4 	eor.w	r4, lr, r4, ror #22
 800618c:	ea88 45f5 	eor.w	r5, r8, r5, ror #19
 8006190:	ea8a 6636 	eor.w	r6, sl, r6, ror #24
 8006194:	ea82 77f7 	eor.w	r7, r2, r7, ror #31
 8006198:	ea25 51f4 	bic.w	r1, r5, r4, ror #23
 800619c:	ea81 41f3 	eor.w	r1, r1, r3, ror #19
 80061a0:	f8c0 10a0 	str.w	r1, [r0, #160]	@ 0xa0
 80061a4:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 80061a8:	ea81 3134 	eor.w	r1, r1, r4, ror #12
 80061ac:	f8c0 1058 	str.w	r1, [r0, #88]	@ 0x58
 80061b0:	ea27 2136 	bic.w	r1, r7, r6, ror #8
 80061b4:	ea81 7175 	eor.w	r1, r1, r5, ror #29
 80061b8:	f8c0 1010 	str.w	r1, [r0, #16]
 80061bc:	ea23 4137 	bic.w	r1, r3, r7, ror #16
 80061c0:	ea81 6136 	eor.w	r1, r1, r6, ror #24
 80061c4:	f8c0 1090 	str.w	r1, [r0, #144]	@ 0x90
 80061c8:	ea24 7133 	bic.w	r1, r4, r3, ror #28
 80061cc:	ea81 3137 	eor.w	r1, r1, r7, ror #12
 80061d0:	f8d0 3034 	ldr.w	r3, [r0, #52]	@ 0x34
 80061d4:	f8d0 40b4 	ldr.w	r4, [r0, #180]	@ 0xb4
 80061d8:	f8d0 5068 	ldr.w	r5, [r0, #104]	@ 0x68
 80061dc:	f8d0 6024 	ldr.w	r6, [r0, #36]	@ 0x24
 80061e0:	f8d0 707c 	ldr.w	r7, [r0, #124]	@ 0x7c
 80061e4:	f8c0 104c 	str.w	r1, [r0, #76]	@ 0x4c
 80061e8:	ea8b 53b3 	eor.w	r3, fp, r3, ror #22
 80061ec:	ea82 0474 	eor.w	r4, r2, r4, ror #1
 80061f0:	ea89 0505 	eor.w	r5, r9, r5
 80061f4:	ea8c 36b6 	eor.w	r6, ip, r6, ror #14
 80061f8:	ea88 3737 	eor.w	r7, r8, r7, ror #12
 80061fc:	ea25 21b4 	bic.w	r1, r5, r4, ror #10
 8006200:	ea81 3133 	eor.w	r1, r1, r3, ror #12
 8006204:	f8c0 107c 	str.w	r1, [r0, #124]	@ 0x7c
 8006208:	ea26 51f5 	bic.w	r1, r6, r5, ror #23
 800620c:	ea81 0174 	eor.w	r1, r1, r4, ror #1
 8006210:	f8c0 1034 	str.w	r1, [r0, #52]	@ 0x34
 8006214:	ea27 1176 	bic.w	r1, r7, r6, ror #5
 8006218:	ea81 7135 	eor.w	r1, r1, r5, ror #28
 800621c:	f8c0 10b4 	str.w	r1, [r0, #180]	@ 0xb4
 8006220:	ea23 6137 	bic.w	r1, r3, r7, ror #24
 8006224:	ea81 7176 	eor.w	r1, r1, r6, ror #29
 8006228:	f8c0 1068 	str.w	r1, [r0, #104]	@ 0x68
 800622c:	ea24 01b3 	bic.w	r1, r4, r3, ror #2
 8006230:	ea81 61b7 	eor.w	r1, r1, r7, ror #26
 8006234:	f8dd 8004 	ldr.w	r8, [sp, #4]
 8006238:	f8d0 30c0 	ldr.w	r3, [r0, #192]	@ 0xc0
 800623c:	f8d0 4050 	ldr.w	r4, [r0, #80]	@ 0x50
 8006240:	f8d0 5008 	ldr.w	r5, [r0, #8]
 8006244:	f8d0 608c 	ldr.w	r6, [r0, #140]	@ 0x8c
 8006248:	f8d0 7040 	ldr.w	r7, [r0, #64]	@ 0x40
 800624c:	f8c0 1024 	str.w	r1, [r0, #36]	@ 0x24
 8006250:	ea8c 23b3 	eor.w	r3, ip, r3, ror #10
 8006254:	ea88 74f4 	eor.w	r4, r8, r4, ror #31
 8006258:	ea8b 7535 	eor.w	r5, fp, r5, ror #28
 800625c:	ea82 1636 	eor.w	r6, r2, r6, ror #4
 8006260:	ea89 0777 	eor.w	r7, r9, r7, ror #1
 8006264:	ea25 41f4 	bic.w	r1, r5, r4, ror #19
 8006268:	ea81 6133 	eor.w	r1, r1, r3, ror #24
 800626c:	f8c0 1050 	str.w	r1, [r0, #80]	@ 0x50
 8006270:	ea26 01b5 	bic.w	r1, r6, r5, ror #2
 8006274:	ea81 5174 	eor.w	r1, r1, r4, ror #21
 8006278:	f8c0 1008 	str.w	r1, [r0, #8]
 800627c:	ea27 5176 	bic.w	r1, r7, r6, ror #21
 8006280:	ea81 51f5 	eor.w	r1, r1, r5, ror #23
 8006284:	f8c0 108c 	str.w	r1, [r0, #140]	@ 0x8c
 8006288:	ea23 4177 	bic.w	r1, r3, r7, ror #17
 800628c:	ea81 11b6 	eor.w	r1, r1, r6, ror #6
 8006290:	f8c0 1040 	str.w	r1, [r0, #64]	@ 0x40
 8006294:	ea24 1173 	bic.w	r1, r4, r3, ror #5
 8006298:	ea81 51b7 	eor.w	r1, r1, r7, ror #22
 800629c:	f8d0 3064 	ldr.w	r3, [r0, #100]	@ 0x64
 80062a0:	f8d0 401c 	ldr.w	r4, [r0, #28]
 80062a4:	f8d0 509c 	ldr.w	r5, [r0, #156]	@ 0x9c
 80062a8:	f8d0 602c 	ldr.w	r6, [r0, #44]	@ 0x2c
 80062ac:	f8d0 70a8 	ldr.w	r7, [r0, #168]	@ 0xa8
 80062b0:	f8c0 10c0 	str.w	r1, [r0, #192]	@ 0xc0
 80062b4:	ea82 6373 	eor.w	r3, r2, r3, ror #25
 80062b8:	ea89 44b4 	eor.w	r4, r9, r4, ror #18
 80062bc:	ea8e 7575 	eor.w	r5, lr, r5, ror #29
 80062c0:	ea88 66f6 	eor.w	r6, r8, r6, ror #27
 80062c4:	ea8a 27f7 	eor.w	r7, sl, r7, ror #11
 80062c8:	ea25 6134 	bic.w	r1, r5, r4, ror #24
 80062cc:	ea81 5173 	eor.w	r1, r1, r3, ror #21
 80062d0:	f8c0 102c 	str.w	r1, [r0, #44]	@ 0x2c
 80062d4:	ea26 0175 	bic.w	r1, r6, r5, ror #1
 80062d8:	ea81 6174 	eor.w	r1, r1, r4, ror #25
 80062dc:	f8c0 10a8 	str.w	r1, [r0, #168]	@ 0xa8
 80062e0:	ea27 3136 	bic.w	r1, r7, r6, ror #12
 80062e4:	ea81 3175 	eor.w	r1, r1, r5, ror #13
 80062e8:	f8c0 1064 	str.w	r1, [r0, #100]	@ 0x64
 80062ec:	ea23 71b7 	bic.w	r1, r3, r7, ror #30
 80062f0:	ea81 21b6 	eor.w	r1, r1, r6, ror #10
 80062f4:	f8c0 101c 	str.w	r1, [r0, #28]
 80062f8:	ea24 7173 	bic.w	r1, r4, r3, ror #29
 80062fc:	ea81 61f7 	eor.w	r1, r1, r7, ror #27
 8006300:	f8dd 9008 	ldr.w	r9, [sp, #8]
 8006304:	f8d0 3004 	ldr.w	r3, [r0, #4]
 8006308:	f8d0 4080 	ldr.w	r4, [r0, #128]	@ 0x80
 800630c:	6b85      	ldr	r5, [r0, #56]	@ 0x38
 800630e:	f8d0 60b8 	ldr.w	r6, [r0, #184]	@ 0xb8
 8006312:	6f07      	ldr	r7, [r0, #112]	@ 0x70
 8006314:	f8c0 109c 	str.w	r1, [r0, #156]	@ 0x9c
 8006318:	ea88 0303 	eor.w	r3, r8, r3
 800631c:	ea8b 24b4 	eor.w	r4, fp, r4, ror #10
 8006320:	ea82 55f5 	eor.w	r5, r2, r5, ror #23
 8006324:	ea89 46b6 	eor.w	r6, r9, r6, ror #18
 8006328:	ea8e 1777 	eor.w	r7, lr, r7, ror #5
 800632c:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 8006330:	ea81 5134 	eor.w	r1, r1, r4, ror #20
 8006334:	f8c0 1080 	str.w	r1, [r0, #128]	@ 0x80
 8006338:	ea27 7176 	bic.w	r1, r7, r6, ror #29
 800633c:	ea81 41b5 	eor.w	r1, r1, r5, ror #18
 8006340:	f8c0 1038 	str.w	r1, [r0, #56]	@ 0x38
 8006344:	ea23 6177 	bic.w	r1, r3, r7, ror #25
 8006348:	ea81 51b6 	eor.w	r1, r1, r6, ror #22
 800634c:	f8c0 10b8 	str.w	r1, [r0, #184]	@ 0xb8
 8006350:	ea24 51b3 	bic.w	r1, r4, r3, ror #22
 8006354:	ea81 31f7 	eor.w	r1, r1, r7, ror #15
 8006358:	f8c0 1070 	str.w	r1, [r0, #112]	@ 0x70
 800635c:	ea25 75f4 	bic.w	r5, r5, r4, ror #31
 8006360:	9905      	ldr	r1, [sp, #20]
 8006362:	68cc      	ldr	r4, [r1, #12]
 8006364:	ea83 23f5 	eor.w	r3, r3, r5, ror #11
 8006368:	ea84 0e03 	eor.w	lr, r4, r3
 800636c:	f8d0 3074 	ldr.w	r3, [r0, #116]	@ 0x74
 8006370:	f8d0 1048 	ldr.w	r1, [r0, #72]	@ 0x48
 8006374:	f8d0 5024 	ldr.w	r5, [r0, #36]	@ 0x24
 8006378:	f8d0 b0c4 	ldr.w	fp, [r0, #196]	@ 0xc4
 800637c:	f8d0 c09c 	ldr.w	ip, [r0, #156]	@ 0x9c
 8006380:	f8c0 e004 	str.w	lr, [r0, #4]
 8006384:	ea83 3331 	eor.w	r3, r3, r1, ror #12
 8006388:	ea83 43f5 	eor.w	r3, r3, r5, ror #19
 800638c:	ea83 133b 	eor.w	r3, r3, fp, ror #4
 8006390:	ea83 63bc 	eor.w	r3, r3, ip, ror #26
 8006394:	f8d0 7080 	ldr.w	r7, [r0, #128]	@ 0x80
 8006398:	f8d0 1058 	ldr.w	r1, [r0, #88]	@ 0x58
 800639c:	f8d0 5030 	ldr.w	r5, [r0, #48]	@ 0x30
 80063a0:	f8d0 b008 	ldr.w	fp, [r0, #8]
 80063a4:	f8d0 c0ac 	ldr.w	ip, [r0, #172]	@ 0xac
 80063a8:	ea87 5731 	eor.w	r7, r7, r1, ror #20
 80063ac:	ea87 17b5 	eor.w	r7, r7, r5, ror #6
 80063b0:	ea87 07fb 	eor.w	r7, r7, fp, ror #3
 80063b4:	ea87 57bc 	eor.w	r7, r7, ip, ror #22
 80063b8:	ea4f 23b3 	mov.w	r3, r3, ror #10
 80063bc:	ea83 5677 	eor.w	r6, r3, r7, ror #21
 80063c0:	f8d0 4038 	ldr.w	r4, [r0, #56]	@ 0x38
 80063c4:	f8d0 1010 	ldr.w	r1, [r0, #16]
 80063c8:	f8d0 50b0 	ldr.w	r5, [r0, #176]	@ 0xb0
 80063cc:	f8d0 b08c 	ldr.w	fp, [r0, #140]	@ 0x8c
 80063d0:	f8d0 c060 	ldr.w	ip, [r0, #96]	@ 0x60
 80063d4:	f8cd 6000 	str.w	r6, [sp]
 80063d8:	ea84 2471 	eor.w	r4, r4, r1, ror #9
 80063dc:	ea84 74b5 	eor.w	r4, r4, r5, ror #30
 80063e0:	ea84 24fb 	eor.w	r4, r4, fp, ror #11
 80063e4:	ea84 14bc 	eor.w	r4, r4, ip, ror #6
 80063e8:	ea83 6674 	eor.w	r6, r3, r4, ror #25
 80063ec:	f8d0 30bc 	ldr.w	r3, [r0, #188]	@ 0xbc
 80063f0:	f8d0 1094 	ldr.w	r1, [r0, #148]	@ 0x94
 80063f4:	f8d0 5068 	ldr.w	r5, [r0, #104]	@ 0x68
 80063f8:	f8d0 b044 	ldr.w	fp, [r0, #68]	@ 0x44
 80063fc:	f8d0 c01c 	ldr.w	ip, [r0, #28]
 8006400:	f8cd 600c 	str.w	r6, [sp, #12]
 8006404:	ea83 43b1 	eor.w	r3, r3, r1, ror #18
 8006408:	ea83 73f5 	eor.w	r3, r3, r5, ror #31
 800640c:	ea83 43bb 	eor.w	r3, r3, fp, ror #18
 8006410:	ea83 037c 	eor.w	r3, r3, ip, ror #1
 8006414:	ea83 52b7 	eor.w	r2, r3, r7, ror #22
 8006418:	f8d0 7000 	ldr.w	r7, [r0]
 800641c:	f8d0 10a4 	ldr.w	r1, [r0, #164]	@ 0xa4
 8006420:	f8d0 507c 	ldr.w	r5, [r0, #124]	@ 0x7c
 8006424:	f8d0 b054 	ldr.w	fp, [r0, #84]	@ 0x54
 8006428:	f8d0 c02c 	ldr.w	ip, [r0, #44]	@ 0x2c
 800642c:	ea87 77b1 	eor.w	r7, r7, r1, ror #30
 8006430:	ea87 47f5 	eor.w	r7, r7, r5, ror #19
 8006434:	ea87 67fb 	eor.w	r7, r7, fp, ror #27
 8006438:	ea87 373c 	eor.w	r7, r7, ip, ror #12
 800643c:	ea87 6a34 	eor.w	sl, r7, r4, ror #24
 8006440:	f8d0 40b8 	ldr.w	r4, [r0, #184]	@ 0xb8
 8006444:	f8d0 1090 	ldr.w	r1, [r0, #144]	@ 0x90
 8006448:	f8d0 506c 	ldr.w	r5, [r0, #108]	@ 0x6c
 800644c:	f8d0 b040 	ldr.w	fp, [r0, #64]	@ 0x40
 8006450:	f8d0 c018 	ldr.w	ip, [r0, #24]
 8006454:	ea84 44b1 	eor.w	r4, r4, r1, ror #18
 8006458:	ea84 0405 	eor.w	r4, r4, r5
 800645c:	ea84 44fb 	eor.w	r4, r4, fp, ror #19
 8006460:	ea84 047c 	eor.w	r4, r4, ip, ror #1
 8006464:	ea84 0e07 	eor.w	lr, r4, r7
 8006468:	f8d0 7084 	ldr.w	r7, [r0, #132]	@ 0x84
 800646c:	f8d0 105c 	ldr.w	r1, [r0, #92]	@ 0x5c
 8006470:	f8d0 5034 	ldr.w	r5, [r0, #52]	@ 0x34
 8006474:	f8d0 b00c 	ldr.w	fp, [r0, #12]
 8006478:	f8d0 c0a8 	ldr.w	ip, [r0, #168]	@ 0xa8
 800647c:	ea87 5731 	eor.w	r7, r7, r1, ror #20
 8006480:	ea87 17f5 	eor.w	r7, r7, r5, ror #7
 8006484:	ea87 07fb 	eor.w	r7, r7, fp, ror #3
 8006488:	ea87 57bc 	eor.w	r7, r7, ip, ror #22
 800648c:	ea4f 5777 	mov.w	r7, r7, ror #21
 8006490:	ea87 76f4 	eor.w	r6, r7, r4, ror #31
 8006494:	f8d0 4070 	ldr.w	r4, [r0, #112]	@ 0x70
 8006498:	f8d0 104c 	ldr.w	r1, [r0, #76]	@ 0x4c
 800649c:	f8d0 5020 	ldr.w	r5, [r0, #32]
 80064a0:	f8d0 b0c0 	ldr.w	fp, [r0, #192]	@ 0xc0
 80064a4:	f8d0 c098 	ldr.w	ip, [r0, #152]	@ 0x98
 80064a8:	f8cd 6010 	str.w	r6, [sp, #16]
 80064ac:	ea84 3431 	eor.w	r4, r4, r1, ror #12
 80064b0:	ea84 44f5 	eor.w	r4, r4, r5, ror #19
 80064b4:	ea84 143b 	eor.w	r4, r4, fp, ror #4
 80064b8:	ea84 64fc 	eor.w	r4, r4, ip, ror #27
 80064bc:	ea87 28b4 	eor.w	r8, r7, r4, ror #10
 80064c0:	f8d0 703c 	ldr.w	r7, [r0, #60]	@ 0x3c
 80064c4:	f8d0 1014 	ldr.w	r1, [r0, #20]
 80064c8:	f8d0 50b4 	ldr.w	r5, [r0, #180]	@ 0xb4
 80064cc:	f8d0 b088 	ldr.w	fp, [r0, #136]	@ 0x88
 80064d0:	f8d0 c064 	ldr.w	ip, [r0, #100]	@ 0x64
 80064d4:	f8cd 8004 	str.w	r8, [sp, #4]
 80064d8:	ea87 2731 	eor.w	r7, r7, r1, ror #8
 80064dc:	ea87 77b5 	eor.w	r7, r7, r5, ror #30
 80064e0:	ea87 27fb 	eor.w	r7, r7, fp, ror #11
 80064e4:	ea87 17bc 	eor.w	r7, r7, ip, ror #6
 80064e8:	ea4f 6777 	mov.w	r7, r7, ror #25
 80064ec:	ea87 2974 	eor.w	r9, r7, r4, ror #9
 80064f0:	f8d0 4004 	ldr.w	r4, [r0, #4]
 80064f4:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
 80064f8:	f8d0 5078 	ldr.w	r5, [r0, #120]	@ 0x78
 80064fc:	f8d0 b050 	ldr.w	fp, [r0, #80]	@ 0x50
 8006500:	f8d0 c028 	ldr.w	ip, [r0, #40]	@ 0x28
 8006504:	f8cd 9008 	str.w	r9, [sp, #8]
 8006508:	ea84 74f1 	eor.w	r4, r4, r1, ror #31
 800650c:	ea84 5435 	eor.w	r4, r4, r5, ror #20
 8006510:	ea84 64fb 	eor.w	r4, r4, fp, ror #27
 8006514:	ea84 347c 	eor.w	r4, r4, ip, ror #13
 8006518:	ea84 0b07 	eor.w	fp, r4, r7
 800651c:	ea83 7cf4 	eor.w	ip, r3, r4, ror #31
 8006520:	f8d0 30bc 	ldr.w	r3, [r0, #188]	@ 0xbc
 8006524:	f8d0 4048 	ldr.w	r4, [r0, #72]	@ 0x48
 8006528:	f8d0 5078 	ldr.w	r5, [r0, #120]	@ 0x78
 800652c:	f8d0 6008 	ldr.w	r6, [r0, #8]
 8006530:	f8d0 7060 	ldr.w	r7, [r0, #96]	@ 0x60
 8006534:	f8c0 1078 	str.w	r1, [r0, #120]	@ 0x78
 8006538:	ea89 0303 	eor.w	r3, r9, r3
 800653c:	ea8c 54b4 	eor.w	r4, ip, r4, ror #22
 8006540:	ea88 5535 	eor.w	r5, r8, r5, ror #20
 8006544:	ea8b 6676 	eor.w	r6, fp, r6, ror #25
 8006548:	ea82 77f7 	eor.w	r7, r2, r7, ror #31
 800654c:	ea25 6134 	bic.w	r1, r5, r4, ror #24
 8006550:	ea81 5133 	eor.w	r1, r1, r3, ror #20
 8006554:	f8c0 1078 	str.w	r1, [r0, #120]	@ 0x78
 8006558:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 800655c:	ea81 3174 	eor.w	r1, r1, r4, ror #13
 8006560:	f8c0 1008 	str.w	r1, [r0, #8]
 8006564:	ea27 2136 	bic.w	r1, r7, r6, ror #8
 8006568:	ea81 7175 	eor.w	r1, r1, r5, ror #29
 800656c:	f8c0 1060 	str.w	r1, [r0, #96]	@ 0x60
 8006570:	ea23 31f7 	bic.w	r1, r3, r7, ror #15
 8006574:	ea81 51f6 	eor.w	r1, r1, r6, ror #23
 8006578:	f8c0 10bc 	str.w	r1, [r0, #188]	@ 0xbc
 800657c:	ea24 7133 	bic.w	r1, r4, r3, ror #28
 8006580:	ea81 21f7 	eor.w	r1, r1, r7, ror #11
 8006584:	f8d0 3084 	ldr.w	r3, [r0, #132]	@ 0x84
 8006588:	f8d0 4010 	ldr.w	r4, [r0, #16]
 800658c:	f8d0 5068 	ldr.w	r5, [r0, #104]	@ 0x68
 8006590:	f8d0 60c0 	ldr.w	r6, [r0, #192]	@ 0xc0
 8006594:	f8d0 7028 	ldr.w	r7, [r0, #40]	@ 0x28
 8006598:	f8c0 1048 	str.w	r1, [r0, #72]	@ 0x48
 800659c:	ea8a 5373 	eor.w	r3, sl, r3, ror #21
 80065a0:	ea82 04b4 	eor.w	r4, r2, r4, ror #2
 80065a4:	ea89 75f5 	eor.w	r5, r9, r5, ror #31
 80065a8:	ea8e 36b6 	eor.w	r6, lr, r6, ror #14
 80065ac:	ea88 3777 	eor.w	r7, r8, r7, ror #13
 80065b0:	ea25 2174 	bic.w	r1, r5, r4, ror #9
 80065b4:	ea81 3133 	eor.w	r1, r1, r3, ror #12
 80065b8:	f8c0 1028 	str.w	r1, [r0, #40]	@ 0x28
 80065bc:	ea26 6135 	bic.w	r1, r6, r5, ror #24
 80065c0:	ea81 0174 	eor.w	r1, r1, r4, ror #1
 80065c4:	f8c0 1084 	str.w	r1, [r0, #132]	@ 0x84
 80065c8:	ea27 1176 	bic.w	r1, r7, r6, ror #5
 80065cc:	ea81 7175 	eor.w	r1, r1, r5, ror #29
 80065d0:	f8c0 1010 	str.w	r1, [r0, #16]
 80065d4:	ea23 51f7 	bic.w	r1, r3, r7, ror #23
 80065d8:	ea81 7136 	eor.w	r1, r1, r6, ror #28
 80065dc:	f8c0 1068 	str.w	r1, [r0, #104]	@ 0x68
 80065e0:	ea24 01f3 	bic.w	r1, r4, r3, ror #3
 80065e4:	ea81 61b7 	eor.w	r1, r1, r7, ror #26
 80065e8:	f8dd 8000 	ldr.w	r8, [sp]
 80065ec:	f8d0 3070 	ldr.w	r3, [r0, #112]	@ 0x70
 80065f0:	f8d0 40a4 	ldr.w	r4, [r0, #164]	@ 0xa4
 80065f4:	f8d0 5034 	ldr.w	r5, [r0, #52]	@ 0x34
 80065f8:	f8d0 608c 	ldr.w	r6, [r0, #140]	@ 0x8c
 80065fc:	f8d0 701c 	ldr.w	r7, [r0, #28]
 8006600:	f8c0 10c0 	str.w	r1, [r0, #192]	@ 0xc0
 8006604:	ea8e 23b3 	eor.w	r3, lr, r3, ror #10
 8006608:	ea88 74b4 	eor.w	r4, r8, r4, ror #30
 800660c:	ea8a 7535 	eor.w	r5, sl, r5, ror #28
 8006610:	ea82 1636 	eor.w	r6, r2, r6, ror #4
 8006614:	ea89 0777 	eor.w	r7, r9, r7, ror #1
 8006618:	ea25 41f4 	bic.w	r1, r5, r4, ror #19
 800661c:	ea81 51f3 	eor.w	r1, r1, r3, ror #23
 8006620:	f8c0 10a4 	str.w	r1, [r0, #164]	@ 0xa4
 8006624:	ea26 01f5 	bic.w	r1, r6, r5, ror #3
 8006628:	ea81 51b4 	eor.w	r1, r1, r4, ror #22
 800662c:	f8c0 1034 	str.w	r1, [r0, #52]	@ 0x34
 8006630:	ea27 5136 	bic.w	r1, r7, r6, ror #20
 8006634:	ea81 51f5 	eor.w	r1, r1, r5, ror #23
 8006638:	f8c0 108c 	str.w	r1, [r0, #140]	@ 0x8c
 800663c:	ea23 41b7 	bic.w	r1, r3, r7, ror #18
 8006640:	ea81 11b6 	eor.w	r1, r1, r6, ror #6
 8006644:	f8c0 101c 	str.w	r1, [r0, #28]
 8006648:	ea24 1133 	bic.w	r1, r4, r3, ror #4
 800664c:	ea81 51b7 	eor.w	r1, r1, r7, ror #22
 8006650:	f8d0 3038 	ldr.w	r3, [r0, #56]	@ 0x38
 8006654:	f8d0 4094 	ldr.w	r4, [r0, #148]	@ 0x94
 8006658:	f8d0 5024 	ldr.w	r5, [r0, #36]	@ 0x24
 800665c:	f8d0 6054 	ldr.w	r6, [r0, #84]	@ 0x54
 8006660:	f8d0 70ac 	ldr.w	r7, [r0, #172]	@ 0xac
 8006664:	f8c0 1070 	str.w	r1, [r0, #112]	@ 0x70
 8006668:	ea82 6373 	eor.w	r3, r2, r3, ror #25
 800666c:	ea89 44b4 	eor.w	r4, r9, r4, ror #18
 8006670:	ea8c 7575 	eor.w	r5, ip, r5, ror #29
 8006674:	ea88 66f6 	eor.w	r6, r8, r6, ror #27
 8006678:	ea8b 3737 	eor.w	r7, fp, r7, ror #12
 800667c:	ea25 6134 	bic.w	r1, r5, r4, ror #24
 8006680:	ea81 5133 	eor.w	r1, r1, r3, ror #20
 8006684:	f8c0 1054 	str.w	r1, [r0, #84]	@ 0x54
 8006688:	ea26 0175 	bic.w	r1, r6, r5, ror #1
 800668c:	ea81 6174 	eor.w	r1, r1, r4, ror #25
 8006690:	f8c0 10ac 	str.w	r1, [r0, #172]	@ 0xac
 8006694:	ea27 3176 	bic.w	r1, r7, r6, ror #13
 8006698:	ea81 31b5 	eor.w	r1, r1, r5, ror #14
 800669c:	f8c0 1038 	str.w	r1, [r0, #56]	@ 0x38
 80066a0:	ea23 71b7 	bic.w	r1, r3, r7, ror #30
 80066a4:	ea81 21f6 	eor.w	r1, r1, r6, ror #11
 80066a8:	f8c0 1094 	str.w	r1, [r0, #148]	@ 0x94
 80066ac:	ea24 7133 	bic.w	r1, r4, r3, ror #28
 80066b0:	ea81 61b7 	eor.w	r1, r1, r7, ror #26
 80066b4:	f8dd 900c 	ldr.w	r9, [sp, #12]
 80066b8:	f8d0 3000 	ldr.w	r3, [r0]
 80066bc:	6dc4      	ldr	r4, [r0, #92]	@ 0x5c
 80066be:	f8d0 50b0 	ldr.w	r5, [r0, #176]	@ 0xb0
 80066c2:	6c06      	ldr	r6, [r0, #64]	@ 0x40
 80066c4:	f8d0 709c 	ldr.w	r7, [r0, #156]	@ 0x9c
 80066c8:	f8c0 1024 	str.w	r1, [r0, #36]	@ 0x24
 80066cc:	ea88 0303 	eor.w	r3, r8, r3
 80066d0:	ea8a 2474 	eor.w	r4, sl, r4, ror #9
 80066d4:	ea82 55f5 	eor.w	r5, r2, r5, ror #23
 80066d8:	ea89 46f6 	eor.w	r6, r9, r6, ror #19
 80066dc:	ea8c 1737 	eor.w	r7, ip, r7, ror #4
 80066e0:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 80066e4:	ea81 5174 	eor.w	r1, r1, r4, ror #21
 80066e8:	f8c0 105c 	str.w	r1, [r0, #92]	@ 0x5c
 80066ec:	ea27 7136 	bic.w	r1, r7, r6, ror #28
 80066f0:	ea81 4175 	eor.w	r1, r1, r5, ror #17
 80066f4:	f8c0 10b0 	str.w	r1, [r0, #176]	@ 0xb0
 80066f8:	ea23 6177 	bic.w	r1, r3, r7, ror #25
 80066fc:	ea81 5176 	eor.w	r1, r1, r6, ror #21
 8006700:	f8c0 1040 	str.w	r1, [r0, #64]	@ 0x40
 8006704:	ea24 51b3 	bic.w	r1, r4, r3, ror #22
 8006708:	ea81 31f7 	eor.w	r1, r1, r7, ror #15
 800670c:	f8c0 109c 	str.w	r1, [r0, #156]	@ 0x9c
 8006710:	ea25 0504 	bic.w	r5, r5, r4
 8006714:	9905      	ldr	r1, [sp, #20]
 8006716:	690c      	ldr	r4, [r1, #16]
 8006718:	ea83 23b5 	eor.w	r3, r3, r5, ror #10
 800671c:	ea84 0103 	eor.w	r1, r4, r3
 8006720:	f8dd 2010 	ldr.w	r2, [sp, #16]
 8006724:	f8d0 30b8 	ldr.w	r3, [r0, #184]	@ 0xb8
 8006728:	f8d0 404c 	ldr.w	r4, [r0, #76]	@ 0x4c
 800672c:	f8d0 507c 	ldr.w	r5, [r0, #124]	@ 0x7c
 8006730:	f8d0 600c 	ldr.w	r6, [r0, #12]
 8006734:	f8d0 7064 	ldr.w	r7, [r0, #100]	@ 0x64
 8006738:	f8c0 1000 	str.w	r1, [r0]
 800673c:	ea89 0303 	eor.w	r3, r9, r3
 8006740:	ea8e 54b4 	eor.w	r4, lr, r4, ror #22
 8006744:	ea88 45f5 	eor.w	r5, r8, r5, ror #19
 8006748:	ea8a 6636 	eor.w	r6, sl, r6, ror #24
 800674c:	ea82 77f7 	eor.w	r7, r2, r7, ror #31
 8006750:	ea25 51f4 	bic.w	r1, r5, r4, ror #23
 8006754:	ea81 41f3 	eor.w	r1, r1, r3, ror #19
 8006758:	f8c0 107c 	str.w	r1, [r0, #124]	@ 0x7c
 800675c:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 8006760:	ea81 3134 	eor.w	r1, r1, r4, ror #12
 8006764:	f8c0 100c 	str.w	r1, [r0, #12]
 8006768:	ea27 2136 	bic.w	r1, r7, r6, ror #8
 800676c:	ea81 7175 	eor.w	r1, r1, r5, ror #29
 8006770:	f8c0 1064 	str.w	r1, [r0, #100]	@ 0x64
 8006774:	ea23 4137 	bic.w	r1, r3, r7, ror #16
 8006778:	ea81 6136 	eor.w	r1, r1, r6, ror #24
 800677c:	f8c0 10b8 	str.w	r1, [r0, #184]	@ 0xb8
 8006780:	ea24 7133 	bic.w	r1, r4, r3, ror #28
 8006784:	ea81 3137 	eor.w	r1, r1, r7, ror #12
 8006788:	f8d0 3080 	ldr.w	r3, [r0, #128]	@ 0x80
 800678c:	f8d0 4014 	ldr.w	r4, [r0, #20]
 8006790:	f8d0 506c 	ldr.w	r5, [r0, #108]	@ 0x6c
 8006794:	f8d0 60c4 	ldr.w	r6, [r0, #196]	@ 0xc4
 8006798:	f8d0 702c 	ldr.w	r7, [r0, #44]	@ 0x2c
 800679c:	f8c0 104c 	str.w	r1, [r0, #76]	@ 0x4c
 80067a0:	ea8b 53b3 	eor.w	r3, fp, r3, ror #22
 80067a4:	ea82 0474 	eor.w	r4, r2, r4, ror #1
 80067a8:	ea89 0505 	eor.w	r5, r9, r5
 80067ac:	ea8c 36b6 	eor.w	r6, ip, r6, ror #14
 80067b0:	ea88 3737 	eor.w	r7, r8, r7, ror #12
 80067b4:	ea25 21b4 	bic.w	r1, r5, r4, ror #10
 80067b8:	ea81 3133 	eor.w	r1, r1, r3, ror #12
 80067bc:	f8c0 102c 	str.w	r1, [r0, #44]	@ 0x2c
 80067c0:	ea26 51f5 	bic.w	r1, r6, r5, ror #23
 80067c4:	ea81 0174 	eor.w	r1, r1, r4, ror #1
 80067c8:	f8c0 1080 	str.w	r1, [r0, #128]	@ 0x80
 80067cc:	ea27 1176 	bic.w	r1, r7, r6, ror #5
 80067d0:	ea81 7135 	eor.w	r1, r1, r5, ror #28
 80067d4:	f8c0 1014 	str.w	r1, [r0, #20]
 80067d8:	ea23 6137 	bic.w	r1, r3, r7, ror #24
 80067dc:	ea81 7176 	eor.w	r1, r1, r6, ror #29
 80067e0:	f8c0 106c 	str.w	r1, [r0, #108]	@ 0x6c
 80067e4:	ea24 01b3 	bic.w	r1, r4, r3, ror #2
 80067e8:	ea81 61b7 	eor.w	r1, r1, r7, ror #26
 80067ec:	f8dd 8004 	ldr.w	r8, [sp, #4]
 80067f0:	f8d0 3074 	ldr.w	r3, [r0, #116]	@ 0x74
 80067f4:	f8d0 40a0 	ldr.w	r4, [r0, #160]	@ 0xa0
 80067f8:	f8d0 5030 	ldr.w	r5, [r0, #48]	@ 0x30
 80067fc:	f8d0 6088 	ldr.w	r6, [r0, #136]	@ 0x88
 8006800:	f8d0 7018 	ldr.w	r7, [r0, #24]
 8006804:	f8c0 10c4 	str.w	r1, [r0, #196]	@ 0xc4
 8006808:	ea8c 23b3 	eor.w	r3, ip, r3, ror #10
 800680c:	ea88 74f4 	eor.w	r4, r8, r4, ror #31
 8006810:	ea8b 7535 	eor.w	r5, fp, r5, ror #28
 8006814:	ea82 1636 	eor.w	r6, r2, r6, ror #4
 8006818:	ea89 0777 	eor.w	r7, r9, r7, ror #1
 800681c:	ea25 41f4 	bic.w	r1, r5, r4, ror #19
 8006820:	ea81 6133 	eor.w	r1, r1, r3, ror #24
 8006824:	f8c0 10a0 	str.w	r1, [r0, #160]	@ 0xa0
 8006828:	ea26 01b5 	bic.w	r1, r6, r5, ror #2
 800682c:	ea81 5174 	eor.w	r1, r1, r4, ror #21
 8006830:	f8c0 1030 	str.w	r1, [r0, #48]	@ 0x30
 8006834:	ea27 5176 	bic.w	r1, r7, r6, ror #21
 8006838:	ea81 51f5 	eor.w	r1, r1, r5, ror #23
 800683c:	f8c0 1088 	str.w	r1, [r0, #136]	@ 0x88
 8006840:	ea23 4177 	bic.w	r1, r3, r7, ror #17
 8006844:	ea81 11b6 	eor.w	r1, r1, r6, ror #6
 8006848:	f8c0 1018 	str.w	r1, [r0, #24]
 800684c:	ea24 1173 	bic.w	r1, r4, r3, ror #5
 8006850:	ea81 51b7 	eor.w	r1, r1, r7, ror #22
 8006854:	f8d0 303c 	ldr.w	r3, [r0, #60]	@ 0x3c
 8006858:	f8d0 4090 	ldr.w	r4, [r0, #144]	@ 0x90
 800685c:	f8d0 5020 	ldr.w	r5, [r0, #32]
 8006860:	f8d0 6050 	ldr.w	r6, [r0, #80]	@ 0x50
 8006864:	f8d0 70a8 	ldr.w	r7, [r0, #168]	@ 0xa8
 8006868:	f8c0 1074 	str.w	r1, [r0, #116]	@ 0x74
 800686c:	ea82 6373 	eor.w	r3, r2, r3, ror #25
 8006870:	ea89 44b4 	eor.w	r4, r9, r4, ror #18
 8006874:	ea8e 7575 	eor.w	r5, lr, r5, ror #29
 8006878:	ea88 66f6 	eor.w	r6, r8, r6, ror #27
 800687c:	ea8a 27f7 	eor.w	r7, sl, r7, ror #11
 8006880:	ea25 6134 	bic.w	r1, r5, r4, ror #24
 8006884:	ea81 5173 	eor.w	r1, r1, r3, ror #21
 8006888:	f8c0 1050 	str.w	r1, [r0, #80]	@ 0x50
 800688c:	ea26 0175 	bic.w	r1, r6, r5, ror #1
 8006890:	ea81 6174 	eor.w	r1, r1, r4, ror #25
 8006894:	f8c0 10a8 	str.w	r1, [r0, #168]	@ 0xa8
 8006898:	ea27 3136 	bic.w	r1, r7, r6, ror #12
 800689c:	ea81 3175 	eor.w	r1, r1, r5, ror #13
 80068a0:	f8c0 103c 	str.w	r1, [r0, #60]	@ 0x3c
 80068a4:	ea23 71b7 	bic.w	r1, r3, r7, ror #30
 80068a8:	ea81 21b6 	eor.w	r1, r1, r6, ror #10
 80068ac:	f8c0 1090 	str.w	r1, [r0, #144]	@ 0x90
 80068b0:	ea24 7173 	bic.w	r1, r4, r3, ror #29
 80068b4:	ea81 61f7 	eor.w	r1, r1, r7, ror #27
 80068b8:	f8dd 9008 	ldr.w	r9, [sp, #8]
 80068bc:	f8d0 3004 	ldr.w	r3, [r0, #4]
 80068c0:	6d84      	ldr	r4, [r0, #88]	@ 0x58
 80068c2:	f8d0 50b4 	ldr.w	r5, [r0, #180]	@ 0xb4
 80068c6:	6c46      	ldr	r6, [r0, #68]	@ 0x44
 80068c8:	f8d0 7098 	ldr.w	r7, [r0, #152]	@ 0x98
 80068cc:	f8c0 1020 	str.w	r1, [r0, #32]
 80068d0:	ea88 0303 	eor.w	r3, r8, r3
 80068d4:	ea8b 24b4 	eor.w	r4, fp, r4, ror #10
 80068d8:	ea82 55f5 	eor.w	r5, r2, r5, ror #23
 80068dc:	ea89 46b6 	eor.w	r6, r9, r6, ror #18
 80068e0:	ea8e 1777 	eor.w	r7, lr, r7, ror #5
 80068e4:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 80068e8:	ea81 5134 	eor.w	r1, r1, r4, ror #20
 80068ec:	f8c0 1058 	str.w	r1, [r0, #88]	@ 0x58
 80068f0:	ea27 7176 	bic.w	r1, r7, r6, ror #29
 80068f4:	ea81 41b5 	eor.w	r1, r1, r5, ror #18
 80068f8:	f8c0 10b4 	str.w	r1, [r0, #180]	@ 0xb4
 80068fc:	ea23 6177 	bic.w	r1, r3, r7, ror #25
 8006900:	ea81 51b6 	eor.w	r1, r1, r6, ror #22
 8006904:	f8c0 1044 	str.w	r1, [r0, #68]	@ 0x44
 8006908:	ea24 51b3 	bic.w	r1, r4, r3, ror #22
 800690c:	ea81 31f7 	eor.w	r1, r1, r7, ror #15
 8006910:	f8c0 1098 	str.w	r1, [r0, #152]	@ 0x98
 8006914:	ea25 75f4 	bic.w	r5, r5, r4, ror #31
 8006918:	9905      	ldr	r1, [sp, #20]
 800691a:	694c      	ldr	r4, [r1, #20]
 800691c:	ea83 23f5 	eor.w	r3, r3, r5, ror #11
 8006920:	ea84 0e03 	eor.w	lr, r4, r3
 8006924:	f8d0 309c 	ldr.w	r3, [r0, #156]	@ 0x9c
 8006928:	f8d0 1048 	ldr.w	r1, [r0, #72]	@ 0x48
 800692c:	f8d0 50c4 	ldr.w	r5, [r0, #196]	@ 0xc4
 8006930:	f8d0 b070 	ldr.w	fp, [r0, #112]	@ 0x70
 8006934:	f8d0 c020 	ldr.w	ip, [r0, #32]
 8006938:	f8c0 e004 	str.w	lr, [r0, #4]
 800693c:	ea83 3331 	eor.w	r3, r3, r1, ror #12
 8006940:	ea83 43f5 	eor.w	r3, r3, r5, ror #19
 8006944:	ea83 133b 	eor.w	r3, r3, fp, ror #4
 8006948:	ea83 63bc 	eor.w	r3, r3, ip, ror #26
 800694c:	f8d0 7058 	ldr.w	r7, [r0, #88]	@ 0x58
 8006950:	f8d0 100c 	ldr.w	r1, [r0, #12]
 8006954:	f8d0 5084 	ldr.w	r5, [r0, #132]	@ 0x84
 8006958:	f8d0 b030 	ldr.w	fp, [r0, #48]	@ 0x30
 800695c:	f8d0 c0ac 	ldr.w	ip, [r0, #172]	@ 0xac
 8006960:	ea87 5731 	eor.w	r7, r7, r1, ror #20
 8006964:	ea87 17b5 	eor.w	r7, r7, r5, ror #6
 8006968:	ea87 07fb 	eor.w	r7, r7, fp, ror #3
 800696c:	ea87 57bc 	eor.w	r7, r7, ip, ror #22
 8006970:	ea4f 23b3 	mov.w	r3, r3, ror #10
 8006974:	ea83 5677 	eor.w	r6, r3, r7, ror #21
 8006978:	f8d0 40b4 	ldr.w	r4, [r0, #180]	@ 0xb4
 800697c:	f8d0 1064 	ldr.w	r1, [r0, #100]	@ 0x64
 8006980:	f8d0 5010 	ldr.w	r5, [r0, #16]
 8006984:	f8d0 b088 	ldr.w	fp, [r0, #136]	@ 0x88
 8006988:	f8d0 c038 	ldr.w	ip, [r0, #56]	@ 0x38
 800698c:	f8cd 6000 	str.w	r6, [sp]
 8006990:	ea84 2471 	eor.w	r4, r4, r1, ror #9
 8006994:	ea84 74b5 	eor.w	r4, r4, r5, ror #30
 8006998:	ea84 24fb 	eor.w	r4, r4, fp, ror #11
 800699c:	ea84 14bc 	eor.w	r4, r4, ip, ror #6
 80069a0:	ea83 6674 	eor.w	r6, r3, r4, ror #25
 80069a4:	f8d0 3040 	ldr.w	r3, [r0, #64]	@ 0x40
 80069a8:	f8d0 10bc 	ldr.w	r1, [r0, #188]	@ 0xbc
 80069ac:	f8d0 506c 	ldr.w	r5, [r0, #108]	@ 0x6c
 80069b0:	f8d0 b01c 	ldr.w	fp, [r0, #28]
 80069b4:	f8d0 c090 	ldr.w	ip, [r0, #144]	@ 0x90
 80069b8:	f8cd 600c 	str.w	r6, [sp, #12]
 80069bc:	ea83 43b1 	eor.w	r3, r3, r1, ror #18
 80069c0:	ea83 73f5 	eor.w	r3, r3, r5, ror #31
 80069c4:	ea83 43bb 	eor.w	r3, r3, fp, ror #18
 80069c8:	ea83 037c 	eor.w	r3, r3, ip, ror #1
 80069cc:	ea83 52b7 	eor.w	r2, r3, r7, ror #22
 80069d0:	f8d0 7000 	ldr.w	r7, [r0]
 80069d4:	f8d0 1078 	ldr.w	r1, [r0, #120]	@ 0x78
 80069d8:	f8d0 502c 	ldr.w	r5, [r0, #44]	@ 0x2c
 80069dc:	f8d0 b0a4 	ldr.w	fp, [r0, #164]	@ 0xa4
 80069e0:	f8d0 c050 	ldr.w	ip, [r0, #80]	@ 0x50
 80069e4:	ea87 77b1 	eor.w	r7, r7, r1, ror #30
 80069e8:	ea87 47f5 	eor.w	r7, r7, r5, ror #19
 80069ec:	ea87 67fb 	eor.w	r7, r7, fp, ror #27
 80069f0:	ea87 373c 	eor.w	r7, r7, ip, ror #12
 80069f4:	ea87 6a34 	eor.w	sl, r7, r4, ror #24
 80069f8:	f8d0 4044 	ldr.w	r4, [r0, #68]	@ 0x44
 80069fc:	f8d0 10b8 	ldr.w	r1, [r0, #184]	@ 0xb8
 8006a00:	f8d0 5068 	ldr.w	r5, [r0, #104]	@ 0x68
 8006a04:	f8d0 b018 	ldr.w	fp, [r0, #24]
 8006a08:	f8d0 c094 	ldr.w	ip, [r0, #148]	@ 0x94
 8006a0c:	ea84 44b1 	eor.w	r4, r4, r1, ror #18
 8006a10:	ea84 0405 	eor.w	r4, r4, r5
 8006a14:	ea84 44fb 	eor.w	r4, r4, fp, ror #19
 8006a18:	ea84 047c 	eor.w	r4, r4, ip, ror #1
 8006a1c:	ea84 0e07 	eor.w	lr, r4, r7
 8006a20:	f8d0 705c 	ldr.w	r7, [r0, #92]	@ 0x5c
 8006a24:	f8d0 1008 	ldr.w	r1, [r0, #8]
 8006a28:	f8d0 5080 	ldr.w	r5, [r0, #128]	@ 0x80
 8006a2c:	f8d0 b034 	ldr.w	fp, [r0, #52]	@ 0x34
 8006a30:	f8d0 c0a8 	ldr.w	ip, [r0, #168]	@ 0xa8
 8006a34:	ea87 5731 	eor.w	r7, r7, r1, ror #20
 8006a38:	ea87 17f5 	eor.w	r7, r7, r5, ror #7
 8006a3c:	ea87 07fb 	eor.w	r7, r7, fp, ror #3
 8006a40:	ea87 57bc 	eor.w	r7, r7, ip, ror #22
 8006a44:	ea4f 5777 	mov.w	r7, r7, ror #21
 8006a48:	ea87 76f4 	eor.w	r6, r7, r4, ror #31
 8006a4c:	f8d0 4098 	ldr.w	r4, [r0, #152]	@ 0x98
 8006a50:	f8d0 104c 	ldr.w	r1, [r0, #76]	@ 0x4c
 8006a54:	f8d0 50c0 	ldr.w	r5, [r0, #192]	@ 0xc0
 8006a58:	f8d0 b074 	ldr.w	fp, [r0, #116]	@ 0x74
 8006a5c:	f8d0 c024 	ldr.w	ip, [r0, #36]	@ 0x24
 8006a60:	f8cd 6010 	str.w	r6, [sp, #16]
 8006a64:	ea84 3431 	eor.w	r4, r4, r1, ror #12
 8006a68:	ea84 44f5 	eor.w	r4, r4, r5, ror #19
 8006a6c:	ea84 143b 	eor.w	r4, r4, fp, ror #4
 8006a70:	ea84 64fc 	eor.w	r4, r4, ip, ror #27
 8006a74:	ea87 28b4 	eor.w	r8, r7, r4, ror #10
 8006a78:	f8d0 70b0 	ldr.w	r7, [r0, #176]	@ 0xb0
 8006a7c:	f8d0 1060 	ldr.w	r1, [r0, #96]	@ 0x60
 8006a80:	f8d0 5014 	ldr.w	r5, [r0, #20]
 8006a84:	f8d0 b08c 	ldr.w	fp, [r0, #140]	@ 0x8c
 8006a88:	f8d0 c03c 	ldr.w	ip, [r0, #60]	@ 0x3c
 8006a8c:	f8cd 8004 	str.w	r8, [sp, #4]
 8006a90:	ea87 2731 	eor.w	r7, r7, r1, ror #8
 8006a94:	ea87 77b5 	eor.w	r7, r7, r5, ror #30
 8006a98:	ea87 27fb 	eor.w	r7, r7, fp, ror #11
 8006a9c:	ea87 17bc 	eor.w	r7, r7, ip, ror #6
 8006aa0:	ea4f 6777 	mov.w	r7, r7, ror #25
 8006aa4:	ea87 2974 	eor.w	r9, r7, r4, ror #9
 8006aa8:	f8d0 4004 	ldr.w	r4, [r0, #4]
 8006aac:	f8d0 107c 	ldr.w	r1, [r0, #124]	@ 0x7c
 8006ab0:	f8d0 5028 	ldr.w	r5, [r0, #40]	@ 0x28
 8006ab4:	f8d0 b0a0 	ldr.w	fp, [r0, #160]	@ 0xa0
 8006ab8:	f8d0 c054 	ldr.w	ip, [r0, #84]	@ 0x54
 8006abc:	f8cd 9008 	str.w	r9, [sp, #8]
 8006ac0:	ea84 74f1 	eor.w	r4, r4, r1, ror #31
 8006ac4:	ea84 5435 	eor.w	r4, r4, r5, ror #20
 8006ac8:	ea84 64fb 	eor.w	r4, r4, fp, ror #27
 8006acc:	ea84 347c 	eor.w	r4, r4, ip, ror #13
 8006ad0:	ea84 0b07 	eor.w	fp, r4, r7
 8006ad4:	ea83 7cf4 	eor.w	ip, r3, r4, ror #31
 8006ad8:	f8d0 3040 	ldr.w	r3, [r0, #64]	@ 0x40
 8006adc:	f8d0 4048 	ldr.w	r4, [r0, #72]	@ 0x48
 8006ae0:	f8d0 5028 	ldr.w	r5, [r0, #40]	@ 0x28
 8006ae4:	f8d0 6030 	ldr.w	r6, [r0, #48]	@ 0x30
 8006ae8:	f8d0 7038 	ldr.w	r7, [r0, #56]	@ 0x38
 8006aec:	f8c0 1028 	str.w	r1, [r0, #40]	@ 0x28
 8006af0:	ea89 0303 	eor.w	r3, r9, r3
 8006af4:	ea8c 54b4 	eor.w	r4, ip, r4, ror #22
 8006af8:	ea88 5535 	eor.w	r5, r8, r5, ror #20
 8006afc:	ea8b 6676 	eor.w	r6, fp, r6, ror #25
 8006b00:	ea82 77f7 	eor.w	r7, r2, r7, ror #31
 8006b04:	ea25 6134 	bic.w	r1, r5, r4, ror #24
 8006b08:	ea81 5133 	eor.w	r1, r1, r3, ror #20
 8006b0c:	ea4f 71b1 	mov.w	r1, r1, ror #30
 8006b10:	f8c0 1028 	str.w	r1, [r0, #40]	@ 0x28
 8006b14:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 8006b18:	ea81 3174 	eor.w	r1, r1, r4, ror #13
 8006b1c:	ea4f 2171 	mov.w	r1, r1, ror #9
 8006b20:	f8c0 1030 	str.w	r1, [r0, #48]	@ 0x30
 8006b24:	ea27 2136 	bic.w	r1, r7, r6, ror #8
 8006b28:	ea81 7175 	eor.w	r1, r1, r5, ror #29
 8006b2c:	ea4f 0171 	mov.w	r1, r1, ror #1
 8006b30:	f8c0 1038 	str.w	r1, [r0, #56]	@ 0x38
 8006b34:	ea23 31f7 	bic.w	r1, r3, r7, ror #15
 8006b38:	ea81 51f6 	eor.w	r1, r1, r6, ror #23
 8006b3c:	ea4f 41b1 	mov.w	r1, r1, ror #18
 8006b40:	f8c0 1040 	str.w	r1, [r0, #64]	@ 0x40
 8006b44:	ea24 7133 	bic.w	r1, r4, r3, ror #28
 8006b48:	ea81 21f7 	eor.w	r1, r1, r7, ror #11
 8006b4c:	ea4f 51b1 	mov.w	r1, r1, ror #22
 8006b50:	f8d0 305c 	ldr.w	r3, [r0, #92]	@ 0x5c
 8006b54:	f8d0 4064 	ldr.w	r4, [r0, #100]	@ 0x64
 8006b58:	f8d0 506c 	ldr.w	r5, [r0, #108]	@ 0x6c
 8006b5c:	f8d0 6074 	ldr.w	r6, [r0, #116]	@ 0x74
 8006b60:	f8d0 7054 	ldr.w	r7, [r0, #84]	@ 0x54
 8006b64:	f8c0 1048 	str.w	r1, [r0, #72]	@ 0x48
 8006b68:	ea8a 5373 	eor.w	r3, sl, r3, ror #21
 8006b6c:	ea82 04b4 	eor.w	r4, r2, r4, ror #2
 8006b70:	ea89 75f5 	eor.w	r5, r9, r5, ror #31
 8006b74:	ea8e 36b6 	eor.w	r6, lr, r6, ror #14
 8006b78:	ea88 3777 	eor.w	r7, r8, r7, ror #13
 8006b7c:	ea25 2174 	bic.w	r1, r5, r4, ror #9
 8006b80:	ea81 3133 	eor.w	r1, r1, r3, ror #12
 8006b84:	ea4f 5131 	mov.w	r1, r1, ror #20
 8006b88:	f8c0 1054 	str.w	r1, [r0, #84]	@ 0x54
 8006b8c:	ea26 6135 	bic.w	r1, r6, r5, ror #24
 8006b90:	ea81 0174 	eor.w	r1, r1, r4, ror #1
 8006b94:	ea4f 7131 	mov.w	r1, r1, ror #28
 8006b98:	f8c0 105c 	str.w	r1, [r0, #92]	@ 0x5c
 8006b9c:	ea27 1176 	bic.w	r1, r7, r6, ror #5
 8006ba0:	ea81 7175 	eor.w	r1, r1, r5, ror #29
 8006ba4:	ea4f 51f1 	mov.w	r1, r1, ror #23
 8006ba8:	f8c0 1064 	str.w	r1, [r0, #100]	@ 0x64
 8006bac:	ea23 51f7 	bic.w	r1, r3, r7, ror #23
 8006bb0:	ea81 7136 	eor.w	r1, r1, r6, ror #28
 8006bb4:	f8c0 106c 	str.w	r1, [r0, #108]	@ 0x6c
 8006bb8:	ea24 01f3 	bic.w	r1, r4, r3, ror #3
 8006bbc:	ea81 61b7 	eor.w	r1, r1, r7, ror #26
 8006bc0:	ea4f 7171 	mov.w	r1, r1, ror #29
 8006bc4:	f8dd 8000 	ldr.w	r8, [sp]
 8006bc8:	f8d0 3098 	ldr.w	r3, [r0, #152]	@ 0x98
 8006bcc:	f8d0 4078 	ldr.w	r4, [r0, #120]	@ 0x78
 8006bd0:	f8d0 5080 	ldr.w	r5, [r0, #128]	@ 0x80
 8006bd4:	f8d0 6088 	ldr.w	r6, [r0, #136]	@ 0x88
 8006bd8:	f8d0 7090 	ldr.w	r7, [r0, #144]	@ 0x90
 8006bdc:	f8c0 1074 	str.w	r1, [r0, #116]	@ 0x74
 8006be0:	ea8e 23b3 	eor.w	r3, lr, r3, ror #10
 8006be4:	ea88 74b4 	eor.w	r4, r8, r4, ror #30
 8006be8:	ea8a 7535 	eor.w	r5, sl, r5, ror #28
 8006bec:	ea82 1636 	eor.w	r6, r2, r6, ror #4
 8006bf0:	ea89 0777 	eor.w	r7, r9, r7, ror #1
 8006bf4:	ea25 41f4 	bic.w	r1, r5, r4, ror #19
 8006bf8:	ea81 51f3 	eor.w	r1, r1, r3, ror #23
 8006bfc:	ea4f 61f1 	mov.w	r1, r1, ror #27
 8006c00:	f8c0 1078 	str.w	r1, [r0, #120]	@ 0x78
 8006c04:	ea26 01f5 	bic.w	r1, r6, r5, ror #3
 8006c08:	ea81 51b4 	eor.w	r1, r1, r4, ror #22
 8006c0c:	ea4f 6131 	mov.w	r1, r1, ror #24
 8006c10:	f8c0 1080 	str.w	r1, [r0, #128]	@ 0x80
 8006c14:	ea27 5136 	bic.w	r1, r7, r6, ror #20
 8006c18:	ea81 51f5 	eor.w	r1, r1, r5, ror #23
 8006c1c:	ea4f 1131 	mov.w	r1, r1, ror #4
 8006c20:	f8c0 1088 	str.w	r1, [r0, #136]	@ 0x88
 8006c24:	ea23 41b7 	bic.w	r1, r3, r7, ror #18
 8006c28:	ea81 11b6 	eor.w	r1, r1, r6, ror #6
 8006c2c:	ea4f 41b1 	mov.w	r1, r1, ror #18
 8006c30:	f8c0 1090 	str.w	r1, [r0, #144]	@ 0x90
 8006c34:	ea24 1133 	bic.w	r1, r4, r3, ror #4
 8006c38:	ea81 51b7 	eor.w	r1, r1, r7, ror #22
 8006c3c:	ea4f 31b1 	mov.w	r1, r1, ror #14
 8006c40:	f8d0 30b4 	ldr.w	r3, [r0, #180]	@ 0xb4
 8006c44:	f8d0 40bc 	ldr.w	r4, [r0, #188]	@ 0xbc
 8006c48:	f8d0 50c4 	ldr.w	r5, [r0, #196]	@ 0xc4
 8006c4c:	f8d0 60a4 	ldr.w	r6, [r0, #164]	@ 0xa4
 8006c50:	f8d0 70ac 	ldr.w	r7, [r0, #172]	@ 0xac
 8006c54:	f8c0 1098 	str.w	r1, [r0, #152]	@ 0x98
 8006c58:	ea82 6373 	eor.w	r3, r2, r3, ror #25
 8006c5c:	ea89 44b4 	eor.w	r4, r9, r4, ror #18
 8006c60:	ea8c 7575 	eor.w	r5, ip, r5, ror #29
 8006c64:	ea88 66f6 	eor.w	r6, r8, r6, ror #27
 8006c68:	ea8b 3737 	eor.w	r7, fp, r7, ror #12
 8006c6c:	ea25 6134 	bic.w	r1, r5, r4, ror #24
 8006c70:	ea81 5133 	eor.w	r1, r1, r3, ror #20
 8006c74:	ea4f 3171 	mov.w	r1, r1, ror #13
 8006c78:	f8c0 10a4 	str.w	r1, [r0, #164]	@ 0xa4
 8006c7c:	ea26 0175 	bic.w	r1, r6, r5, ror #1
 8006c80:	ea81 6174 	eor.w	r1, r1, r4, ror #25
 8006c84:	ea4f 3131 	mov.w	r1, r1, ror #12
 8006c88:	f8c0 10ac 	str.w	r1, [r0, #172]	@ 0xac
 8006c8c:	ea27 3176 	bic.w	r1, r7, r6, ror #13
 8006c90:	ea81 31b5 	eor.w	r1, r1, r5, ror #14
 8006c94:	ea4f 71f1 	mov.w	r1, r1, ror #31
 8006c98:	f8c0 10b4 	str.w	r1, [r0, #180]	@ 0xb4
 8006c9c:	ea23 71b7 	bic.w	r1, r3, r7, ror #30
 8006ca0:	ea81 21f6 	eor.w	r1, r1, r6, ror #11
 8006ca4:	ea4f 0171 	mov.w	r1, r1, ror #1
 8006ca8:	f8c0 10bc 	str.w	r1, [r0, #188]	@ 0xbc
 8006cac:	ea24 7133 	bic.w	r1, r4, r3, ror #28
 8006cb0:	ea81 61b7 	eor.w	r1, r1, r7, ror #26
 8006cb4:	ea4f 1171 	mov.w	r1, r1, ror #5
 8006cb8:	f8dd 900c 	ldr.w	r9, [sp, #12]
 8006cbc:	f8d0 3000 	ldr.w	r3, [r0]
 8006cc0:	6884      	ldr	r4, [r0, #8]
 8006cc2:	6905      	ldr	r5, [r0, #16]
 8006cc4:	6986      	ldr	r6, [r0, #24]
 8006cc6:	6a07      	ldr	r7, [r0, #32]
 8006cc8:	f8c0 10c4 	str.w	r1, [r0, #196]	@ 0xc4
 8006ccc:	ea88 0303 	eor.w	r3, r8, r3
 8006cd0:	ea8a 2474 	eor.w	r4, sl, r4, ror #9
 8006cd4:	ea82 55f5 	eor.w	r5, r2, r5, ror #23
 8006cd8:	ea89 46f6 	eor.w	r6, r9, r6, ror #19
 8006cdc:	ea8c 1737 	eor.w	r7, ip, r7, ror #4
 8006ce0:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 8006ce4:	ea81 5174 	eor.w	r1, r1, r4, ror #21
 8006ce8:	ea4f 5171 	mov.w	r1, r1, ror #21
 8006cec:	f8c0 1008 	str.w	r1, [r0, #8]
 8006cf0:	ea27 7136 	bic.w	r1, r7, r6, ror #28
 8006cf4:	ea81 4175 	eor.w	r1, r1, r5, ror #17
 8006cf8:	ea4f 6171 	mov.w	r1, r1, ror #25
 8006cfc:	f8c0 1010 	str.w	r1, [r0, #16]
 8006d00:	ea23 6177 	bic.w	r1, r3, r7, ror #25
 8006d04:	ea81 5176 	eor.w	r1, r1, r6, ror #21
 8006d08:	f8c0 1018 	str.w	r1, [r0, #24]
 8006d0c:	ea24 51b3 	bic.w	r1, r4, r3, ror #22
 8006d10:	ea81 31f7 	eor.w	r1, r1, r7, ror #15
 8006d14:	ea4f 21b1 	mov.w	r1, r1, ror #10
 8006d18:	f8c0 1020 	str.w	r1, [r0, #32]
 8006d1c:	ea25 0504 	bic.w	r5, r5, r4
 8006d20:	9905      	ldr	r1, [sp, #20]
 8006d22:	698c      	ldr	r4, [r1, #24]
 8006d24:	ea83 23b5 	eor.w	r3, r3, r5, ror #10
 8006d28:	ea84 0103 	eor.w	r1, r4, r3
 8006d2c:	f8dd 2010 	ldr.w	r2, [sp, #16]
 8006d30:	f8d0 3044 	ldr.w	r3, [r0, #68]	@ 0x44
 8006d34:	f8d0 404c 	ldr.w	r4, [r0, #76]	@ 0x4c
 8006d38:	f8d0 502c 	ldr.w	r5, [r0, #44]	@ 0x2c
 8006d3c:	f8d0 6034 	ldr.w	r6, [r0, #52]	@ 0x34
 8006d40:	f8d0 703c 	ldr.w	r7, [r0, #60]	@ 0x3c
 8006d44:	f8c0 1000 	str.w	r1, [r0]
 8006d48:	ea89 0303 	eor.w	r3, r9, r3
 8006d4c:	ea8e 54b4 	eor.w	r4, lr, r4, ror #22
 8006d50:	ea88 45f5 	eor.w	r5, r8, r5, ror #19
 8006d54:	ea8a 6636 	eor.w	r6, sl, r6, ror #24
 8006d58:	ea82 77f7 	eor.w	r7, r2, r7, ror #31
 8006d5c:	ea25 51f4 	bic.w	r1, r5, r4, ror #23
 8006d60:	ea81 41f3 	eor.w	r1, r1, r3, ror #19
 8006d64:	ea4f 71f1 	mov.w	r1, r1, ror #31
 8006d68:	f8c0 102c 	str.w	r1, [r0, #44]	@ 0x2c
 8006d6c:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 8006d70:	ea81 3134 	eor.w	r1, r1, r4, ror #12
 8006d74:	ea4f 21b1 	mov.w	r1, r1, ror #10
 8006d78:	f8c0 1034 	str.w	r1, [r0, #52]	@ 0x34
 8006d7c:	ea27 2136 	bic.w	r1, r7, r6, ror #8
 8006d80:	ea81 7175 	eor.w	r1, r1, r5, ror #29
 8006d84:	ea4f 01b1 	mov.w	r1, r1, ror #2
 8006d88:	f8c0 103c 	str.w	r1, [r0, #60]	@ 0x3c
 8006d8c:	ea23 4137 	bic.w	r1, r3, r7, ror #16
 8006d90:	ea81 6136 	eor.w	r1, r1, r6, ror #24
 8006d94:	ea4f 41b1 	mov.w	r1, r1, ror #18
 8006d98:	f8c0 1044 	str.w	r1, [r0, #68]	@ 0x44
 8006d9c:	ea24 7133 	bic.w	r1, r4, r3, ror #28
 8006da0:	ea81 3137 	eor.w	r1, r1, r7, ror #12
 8006da4:	ea4f 51b1 	mov.w	r1, r1, ror #22
 8006da8:	f8d0 3058 	ldr.w	r3, [r0, #88]	@ 0x58
 8006dac:	f8d0 4060 	ldr.w	r4, [r0, #96]	@ 0x60
 8006db0:	f8d0 5068 	ldr.w	r5, [r0, #104]	@ 0x68
 8006db4:	f8d0 6070 	ldr.w	r6, [r0, #112]	@ 0x70
 8006db8:	f8d0 7050 	ldr.w	r7, [r0, #80]	@ 0x50
 8006dbc:	f8c0 104c 	str.w	r1, [r0, #76]	@ 0x4c
 8006dc0:	ea8b 53b3 	eor.w	r3, fp, r3, ror #22
 8006dc4:	ea82 0474 	eor.w	r4, r2, r4, ror #1
 8006dc8:	ea89 0505 	eor.w	r5, r9, r5
 8006dcc:	ea8c 36b6 	eor.w	r6, ip, r6, ror #14
 8006dd0:	ea88 3737 	eor.w	r7, r8, r7, ror #12
 8006dd4:	ea25 21b4 	bic.w	r1, r5, r4, ror #10
 8006dd8:	ea81 3133 	eor.w	r1, r1, r3, ror #12
 8006ddc:	ea4f 41f1 	mov.w	r1, r1, ror #19
 8006de0:	f8c0 1050 	str.w	r1, [r0, #80]	@ 0x50
 8006de4:	ea26 51f5 	bic.w	r1, r6, r5, ror #23
 8006de8:	ea81 0174 	eor.w	r1, r1, r4, ror #1
 8006dec:	ea4f 7131 	mov.w	r1, r1, ror #28
 8006df0:	f8c0 1058 	str.w	r1, [r0, #88]	@ 0x58
 8006df4:	ea27 1176 	bic.w	r1, r7, r6, ror #5
 8006df8:	ea81 7135 	eor.w	r1, r1, r5, ror #28
 8006dfc:	ea4f 51f1 	mov.w	r1, r1, ror #23
 8006e00:	f8c0 1060 	str.w	r1, [r0, #96]	@ 0x60
 8006e04:	ea23 6137 	bic.w	r1, r3, r7, ror #24
 8006e08:	ea81 7176 	eor.w	r1, r1, r6, ror #29
 8006e0c:	ea4f 71f1 	mov.w	r1, r1, ror #31
 8006e10:	f8c0 1068 	str.w	r1, [r0, #104]	@ 0x68
 8006e14:	ea24 01b3 	bic.w	r1, r4, r3, ror #2
 8006e18:	ea81 61b7 	eor.w	r1, r1, r7, ror #26
 8006e1c:	ea4f 7171 	mov.w	r1, r1, ror #29
 8006e20:	f8dd 8004 	ldr.w	r8, [sp, #4]
 8006e24:	f8d0 309c 	ldr.w	r3, [r0, #156]	@ 0x9c
 8006e28:	f8d0 407c 	ldr.w	r4, [r0, #124]	@ 0x7c
 8006e2c:	f8d0 5084 	ldr.w	r5, [r0, #132]	@ 0x84
 8006e30:	f8d0 608c 	ldr.w	r6, [r0, #140]	@ 0x8c
 8006e34:	f8d0 7094 	ldr.w	r7, [r0, #148]	@ 0x94
 8006e38:	f8c0 1070 	str.w	r1, [r0, #112]	@ 0x70
 8006e3c:	ea8c 23b3 	eor.w	r3, ip, r3, ror #10
 8006e40:	ea88 74f4 	eor.w	r4, r8, r4, ror #31
 8006e44:	ea8b 7535 	eor.w	r5, fp, r5, ror #28
 8006e48:	ea82 1636 	eor.w	r6, r2, r6, ror #4
 8006e4c:	ea89 0777 	eor.w	r7, r9, r7, ror #1
 8006e50:	ea25 41f4 	bic.w	r1, r5, r4, ror #19
 8006e54:	ea81 6133 	eor.w	r1, r1, r3, ror #24
 8006e58:	ea4f 61f1 	mov.w	r1, r1, ror #27
 8006e5c:	f8c0 107c 	str.w	r1, [r0, #124]	@ 0x7c
 8006e60:	ea26 01b5 	bic.w	r1, r6, r5, ror #2
 8006e64:	ea81 5174 	eor.w	r1, r1, r4, ror #21
 8006e68:	ea4f 6171 	mov.w	r1, r1, ror #25
 8006e6c:	f8c0 1084 	str.w	r1, [r0, #132]	@ 0x84
 8006e70:	ea27 5176 	bic.w	r1, r7, r6, ror #21
 8006e74:	ea81 51f5 	eor.w	r1, r1, r5, ror #23
 8006e78:	ea4f 1131 	mov.w	r1, r1, ror #4
 8006e7c:	f8c0 108c 	str.w	r1, [r0, #140]	@ 0x8c
 8006e80:	ea23 4177 	bic.w	r1, r3, r7, ror #17
 8006e84:	ea81 11b6 	eor.w	r1, r1, r6, ror #6
 8006e88:	ea4f 41f1 	mov.w	r1, r1, ror #19
 8006e8c:	f8c0 1094 	str.w	r1, [r0, #148]	@ 0x94
 8006e90:	ea24 1173 	bic.w	r1, r4, r3, ror #5
 8006e94:	ea81 51b7 	eor.w	r1, r1, r7, ror #22
 8006e98:	ea4f 31b1 	mov.w	r1, r1, ror #14
 8006e9c:	f8d0 30b0 	ldr.w	r3, [r0, #176]	@ 0xb0
 8006ea0:	f8d0 40b8 	ldr.w	r4, [r0, #184]	@ 0xb8
 8006ea4:	f8d0 50c0 	ldr.w	r5, [r0, #192]	@ 0xc0
 8006ea8:	f8d0 60a0 	ldr.w	r6, [r0, #160]	@ 0xa0
 8006eac:	f8d0 70a8 	ldr.w	r7, [r0, #168]	@ 0xa8
 8006eb0:	f8c0 109c 	str.w	r1, [r0, #156]	@ 0x9c
 8006eb4:	ea82 6373 	eor.w	r3, r2, r3, ror #25
 8006eb8:	ea89 44b4 	eor.w	r4, r9, r4, ror #18
 8006ebc:	ea8e 7575 	eor.w	r5, lr, r5, ror #29
 8006ec0:	ea88 66f6 	eor.w	r6, r8, r6, ror #27
 8006ec4:	ea8a 27f7 	eor.w	r7, sl, r7, ror #11
 8006ec8:	ea25 6134 	bic.w	r1, r5, r4, ror #24
 8006ecc:	ea81 5173 	eor.w	r1, r1, r3, ror #21
 8006ed0:	ea4f 3131 	mov.w	r1, r1, ror #12
 8006ed4:	f8c0 10a0 	str.w	r1, [r0, #160]	@ 0xa0
 8006ed8:	ea26 0175 	bic.w	r1, r6, r5, ror #1
 8006edc:	ea81 6174 	eor.w	r1, r1, r4, ror #25
 8006ee0:	ea4f 21f1 	mov.w	r1, r1, ror #11
 8006ee4:	f8c0 10a8 	str.w	r1, [r0, #168]	@ 0xa8
 8006ee8:	ea27 3136 	bic.w	r1, r7, r6, ror #12
 8006eec:	ea81 3175 	eor.w	r1, r1, r5, ror #13
 8006ef0:	ea4f 71f1 	mov.w	r1, r1, ror #31
 8006ef4:	f8c0 10b0 	str.w	r1, [r0, #176]	@ 0xb0
 8006ef8:	ea23 71b7 	bic.w	r1, r3, r7, ror #30
 8006efc:	ea81 21b6 	eor.w	r1, r1, r6, ror #10
 8006f00:	ea4f 0171 	mov.w	r1, r1, ror #1
 8006f04:	f8c0 10b8 	str.w	r1, [r0, #184]	@ 0xb8
 8006f08:	ea24 7173 	bic.w	r1, r4, r3, ror #29
 8006f0c:	ea81 61f7 	eor.w	r1, r1, r7, ror #27
 8006f10:	ea4f 1131 	mov.w	r1, r1, ror #4
 8006f14:	f8dd 9008 	ldr.w	r9, [sp, #8]
 8006f18:	f8d0 3004 	ldr.w	r3, [r0, #4]
 8006f1c:	68c4      	ldr	r4, [r0, #12]
 8006f1e:	6945      	ldr	r5, [r0, #20]
 8006f20:	69c6      	ldr	r6, [r0, #28]
 8006f22:	6a47      	ldr	r7, [r0, #36]	@ 0x24
 8006f24:	f8c0 10c0 	str.w	r1, [r0, #192]	@ 0xc0
 8006f28:	ea88 0303 	eor.w	r3, r8, r3
 8006f2c:	ea8b 24b4 	eor.w	r4, fp, r4, ror #10
 8006f30:	ea82 55f5 	eor.w	r5, r2, r5, ror #23
 8006f34:	ea89 46b6 	eor.w	r6, r9, r6, ror #18
 8006f38:	ea8e 1777 	eor.w	r7, lr, r7, ror #5
 8006f3c:	ea26 5175 	bic.w	r1, r6, r5, ror #21
 8006f40:	ea81 5134 	eor.w	r1, r1, r4, ror #20
 8006f44:	ea4f 51b1 	mov.w	r1, r1, ror #22
 8006f48:	f8c0 100c 	str.w	r1, [r0, #12]
 8006f4c:	ea27 7176 	bic.w	r1, r7, r6, ror #29
 8006f50:	ea81 41b5 	eor.w	r1, r1, r5, ror #18
 8006f54:	ea4f 6171 	mov.w	r1, r1, ror #25
 8006f58:	f8c0 1014 	str.w	r1, [r0, #20]
 8006f5c:	ea23 6177 	bic.w	r1, r3, r7, ror #25
 8006f60:	ea81 51b6 	eor.w	r1, r1, r6, ror #22
 8006f64:	f8c0 101c 	str.w	r1, [r0, #28]
 8006f68:	ea24 51b3 	bic.w	r1, r4, r3, ror #22
 8006f6c:	ea81 31f7 	eor.w	r1, r1, r7, ror #15
 8006f70:	ea4f 21b1 	mov.w	r1, r1, ror #10
 8006f74:	f8c0 1024 	str.w	r1, [r0, #36]	@ 0x24
 8006f78:	ea25 75f4 	bic.w	r5, r5, r4, ror #31
 8006f7c:	9905      	ldr	r1, [sp, #20]
 8006f7e:	69cc      	ldr	r4, [r1, #28]
 8006f80:	f851 7f20 	ldr.w	r7, [r1, #32]!
 8006f84:	9105      	str	r1, [sp, #20]
 8006f86:	2fff      	cmp	r7, #255	@ 0xff
 8006f88:	ea83 23f5 	eor.w	r3, r3, r5, ror #11
 8006f8c:	ea84 0103 	eor.w	r1, r4, r3
 8006f90:	f8c0 1004 	str.w	r1, [r0, #4]
 8006f94:	f47e ac3a 	bne.w	800580c <KeccakF1600_StatePermute_RoundLoop>
 8006f98:	b006      	add	sp, #24
 8006f9a:	e8bd 9ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}
 8006f9e:	bf00      	nop

08006fa0 <memset>:
 8006fa0:	0783      	lsls	r3, r0, #30
 8006fa2:	b530      	push	{r4, r5, lr}
 8006fa4:	d047      	beq.n	8007036 <memset+0x96>
 8006fa6:	1e54      	subs	r4, r2, #1
 8006fa8:	2a00      	cmp	r2, #0
 8006faa:	d03e      	beq.n	800702a <memset+0x8a>
 8006fac:	b2ca      	uxtb	r2, r1
 8006fae:	4603      	mov	r3, r0
 8006fb0:	e001      	b.n	8006fb6 <memset+0x16>
 8006fb2:	3c01      	subs	r4, #1
 8006fb4:	d339      	bcc.n	800702a <memset+0x8a>
 8006fb6:	f803 2b01 	strb.w	r2, [r3], #1
 8006fba:	079d      	lsls	r5, r3, #30
 8006fbc:	d1f9      	bne.n	8006fb2 <memset+0x12>
 8006fbe:	2c03      	cmp	r4, #3
 8006fc0:	d92c      	bls.n	800701c <memset+0x7c>
 8006fc2:	b2cd      	uxtb	r5, r1
 8006fc4:	eb05 2505 	add.w	r5, r5, r5, lsl #8
 8006fc8:	2c0f      	cmp	r4, #15
 8006fca:	eb05 4505 	add.w	r5, r5, r5, lsl #16
 8006fce:	d935      	bls.n	800703c <memset+0x9c>
 8006fd0:	f1a4 0210 	sub.w	r2, r4, #16
 8006fd4:	f022 0c0f 	bic.w	ip, r2, #15
 8006fd8:	f103 0e10 	add.w	lr, r3, #16
 8006fdc:	44e6      	add	lr, ip
 8006fde:	ea4f 1c12 	mov.w	ip, r2, lsr #4
 8006fe2:	461a      	mov	r2, r3
 8006fe4:	e9c2 5500 	strd	r5, r5, [r2]
 8006fe8:	e9c2 5502 	strd	r5, r5, [r2, #8]
 8006fec:	3210      	adds	r2, #16
 8006fee:	4572      	cmp	r2, lr
 8006ff0:	d1f8      	bne.n	8006fe4 <memset+0x44>
 8006ff2:	f10c 0201 	add.w	r2, ip, #1
 8006ff6:	f014 0f0c 	tst.w	r4, #12
 8006ffa:	eb03 1202 	add.w	r2, r3, r2, lsl #4
 8006ffe:	f004 0c0f 	and.w	ip, r4, #15
 8007002:	d013      	beq.n	800702c <memset+0x8c>
 8007004:	f1ac 0304 	sub.w	r3, ip, #4
 8007008:	f023 0303 	bic.w	r3, r3, #3
 800700c:	3304      	adds	r3, #4
 800700e:	4413      	add	r3, r2
 8007010:	f842 5b04 	str.w	r5, [r2], #4
 8007014:	4293      	cmp	r3, r2
 8007016:	d1fb      	bne.n	8007010 <memset+0x70>
 8007018:	f00c 0403 	and.w	r4, ip, #3
 800701c:	b12c      	cbz	r4, 800702a <memset+0x8a>
 800701e:	b2c9      	uxtb	r1, r1
 8007020:	441c      	add	r4, r3
 8007022:	f803 1b01 	strb.w	r1, [r3], #1
 8007026:	42a3      	cmp	r3, r4
 8007028:	d1fb      	bne.n	8007022 <memset+0x82>
 800702a:	bd30      	pop	{r4, r5, pc}
 800702c:	4664      	mov	r4, ip
 800702e:	4613      	mov	r3, r2
 8007030:	2c00      	cmp	r4, #0
 8007032:	d1f4      	bne.n	800701e <memset+0x7e>
 8007034:	e7f9      	b.n	800702a <memset+0x8a>
 8007036:	4603      	mov	r3, r0
 8007038:	4614      	mov	r4, r2
 800703a:	e7c0      	b.n	8006fbe <memset+0x1e>
 800703c:	461a      	mov	r2, r3
 800703e:	46a4      	mov	ip, r4
 8007040:	e7e0      	b.n	8007004 <memset+0x64>
 8007042:	bf00      	nop

08007044 <memcpy>:
 8007044:	4684      	mov	ip, r0
 8007046:	ea41 0300 	orr.w	r3, r1, r0
 800704a:	f013 0303 	ands.w	r3, r3, #3
 800704e:	d16d      	bne.n	800712c <memcpy+0xe8>
 8007050:	3a40      	subs	r2, #64	@ 0x40
 8007052:	d341      	bcc.n	80070d8 <memcpy+0x94>
 8007054:	f851 3b04 	ldr.w	r3, [r1], #4
 8007058:	f840 3b04 	str.w	r3, [r0], #4
 800705c:	f851 3b04 	ldr.w	r3, [r1], #4
 8007060:	f840 3b04 	str.w	r3, [r0], #4
 8007064:	f851 3b04 	ldr.w	r3, [r1], #4
 8007068:	f840 3b04 	str.w	r3, [r0], #4
 800706c:	f851 3b04 	ldr.w	r3, [r1], #4
 8007070:	f840 3b04 	str.w	r3, [r0], #4
 8007074:	f851 3b04 	ldr.w	r3, [r1], #4
 8007078:	f840 3b04 	str.w	r3, [r0], #4
 800707c:	f851 3b04 	ldr.w	r3, [r1], #4
 8007080:	f840 3b04 	str.w	r3, [r0], #4
 8007084:	f851 3b04 	ldr.w	r3, [r1], #4
 8007088:	f840 3b04 	str.w	r3, [r0], #4
 800708c:	f851 3b04 	ldr.w	r3, [r1], #4
 8007090:	f840 3b04 	str.w	r3, [r0], #4
 8007094:	f851 3b04 	ldr.w	r3, [r1], #4
 8007098:	f840 3b04 	str.w	r3, [r0], #4
 800709c:	f851 3b04 	ldr.w	r3, [r1], #4
 80070a0:	f840 3b04 	str.w	r3, [r0], #4
 80070a4:	f851 3b04 	ldr.w	r3, [r1], #4
 80070a8:	f840 3b04 	str.w	r3, [r0], #4
 80070ac:	f851 3b04 	ldr.w	r3, [r1], #4
 80070b0:	f840 3b04 	str.w	r3, [r0], #4
 80070b4:	f851 3b04 	ldr.w	r3, [r1], #4
 80070b8:	f840 3b04 	str.w	r3, [r0], #4
 80070bc:	f851 3b04 	ldr.w	r3, [r1], #4
 80070c0:	f840 3b04 	str.w	r3, [r0], #4
 80070c4:	f851 3b04 	ldr.w	r3, [r1], #4
 80070c8:	f840 3b04 	str.w	r3, [r0], #4
 80070cc:	f851 3b04 	ldr.w	r3, [r1], #4
 80070d0:	f840 3b04 	str.w	r3, [r0], #4
 80070d4:	3a40      	subs	r2, #64	@ 0x40
 80070d6:	d2bd      	bcs.n	8007054 <memcpy+0x10>
 80070d8:	3230      	adds	r2, #48	@ 0x30
 80070da:	d311      	bcc.n	8007100 <memcpy+0xbc>
 80070dc:	f851 3b04 	ldr.w	r3, [r1], #4
 80070e0:	f840 3b04 	str.w	r3, [r0], #4
 80070e4:	f851 3b04 	ldr.w	r3, [r1], #4
 80070e8:	f840 3b04 	str.w	r3, [r0], #4
 80070ec:	f851 3b04 	ldr.w	r3, [r1], #4
 80070f0:	f840 3b04 	str.w	r3, [r0], #4
 80070f4:	f851 3b04 	ldr.w	r3, [r1], #4
 80070f8:	f840 3b04 	str.w	r3, [r0], #4
 80070fc:	3a10      	subs	r2, #16
 80070fe:	d2ed      	bcs.n	80070dc <memcpy+0x98>
 8007100:	320c      	adds	r2, #12
 8007102:	d305      	bcc.n	8007110 <memcpy+0xcc>
 8007104:	f851 3b04 	ldr.w	r3, [r1], #4
 8007108:	f840 3b04 	str.w	r3, [r0], #4
 800710c:	3a04      	subs	r2, #4
 800710e:	d2f9      	bcs.n	8007104 <memcpy+0xc0>
 8007110:	3204      	adds	r2, #4
 8007112:	d008      	beq.n	8007126 <memcpy+0xe2>
 8007114:	07d2      	lsls	r2, r2, #31
 8007116:	bf1c      	itt	ne
 8007118:	f811 3b01 	ldrbne.w	r3, [r1], #1
 800711c:	f800 3b01 	strbne.w	r3, [r0], #1
 8007120:	d301      	bcc.n	8007126 <memcpy+0xe2>
 8007122:	880b      	ldrh	r3, [r1, #0]
 8007124:	8003      	strh	r3, [r0, #0]
 8007126:	4660      	mov	r0, ip
 8007128:	4770      	bx	lr
 800712a:	bf00      	nop
 800712c:	2a08      	cmp	r2, #8
 800712e:	d313      	bcc.n	8007158 <memcpy+0x114>
 8007130:	078b      	lsls	r3, r1, #30
 8007132:	d08d      	beq.n	8007050 <memcpy+0xc>
 8007134:	f010 0303 	ands.w	r3, r0, #3
 8007138:	d08a      	beq.n	8007050 <memcpy+0xc>
 800713a:	f1c3 0304 	rsb	r3, r3, #4
 800713e:	1ad2      	subs	r2, r2, r3
 8007140:	07db      	lsls	r3, r3, #31
 8007142:	bf1c      	itt	ne
 8007144:	f811 3b01 	ldrbne.w	r3, [r1], #1
 8007148:	f800 3b01 	strbne.w	r3, [r0], #1
 800714c:	d380      	bcc.n	8007050 <memcpy+0xc>
 800714e:	f831 3b02 	ldrh.w	r3, [r1], #2
 8007152:	f820 3b02 	strh.w	r3, [r0], #2
 8007156:	e77b      	b.n	8007050 <memcpy+0xc>
 8007158:	3a04      	subs	r2, #4
 800715a:	d3d9      	bcc.n	8007110 <memcpy+0xcc>
 800715c:	3a01      	subs	r2, #1
 800715e:	f811 3b01 	ldrb.w	r3, [r1], #1
 8007162:	f800 3b01 	strb.w	r3, [r0], #1
 8007166:	d2f9      	bcs.n	800715c <memcpy+0x118>
 8007168:	780b      	ldrb	r3, [r1, #0]
 800716a:	7003      	strb	r3, [r0, #0]
 800716c:	784b      	ldrb	r3, [r1, #1]
 800716e:	7043      	strb	r3, [r0, #1]
 8007170:	788b      	ldrb	r3, [r1, #2]
 8007172:	7083      	strb	r3, [r0, #2]
 8007174:	4660      	mov	r0, ip
 8007176:	4770      	bx	lr

08007178 <gpio_clear>:
 8007178:	0409      	lsls	r1, r1, #16
 800717a:	6181      	str	r1, [r0, #24]
 800717c:	4770      	bx	lr

0800717e <gpio_toggle>:
 800717e:	6943      	ldr	r3, [r0, #20]
 8007180:	ea01 0203 	and.w	r2, r1, r3
 8007184:	ea21 0103 	bic.w	r1, r1, r3
 8007188:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
 800718c:	6181      	str	r1, [r0, #24]
 800718e:	4770      	bx	lr

08007190 <gpio_mode_setup>:
 8007190:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8007194:	6805      	ldr	r5, [r0, #0]
 8007196:	68c4      	ldr	r4, [r0, #12]
 8007198:	2600      	movs	r6, #0
 800719a:	f04f 0e03 	mov.w	lr, #3
 800719e:	fa43 f706 	asr.w	r7, r3, r6
 80071a2:	07ff      	lsls	r7, r7, #31
 80071a4:	d50d      	bpl.n	80071c2 <gpio_mode_setup+0x32>
 80071a6:	0077      	lsls	r7, r6, #1
 80071a8:	fa0e fc07 	lsl.w	ip, lr, r7
 80071ac:	fa01 f807 	lsl.w	r8, r1, r7
 80071b0:	ea25 050c 	bic.w	r5, r5, ip
 80071b4:	ea24 040c 	bic.w	r4, r4, ip
 80071b8:	fa02 f707 	lsl.w	r7, r2, r7
 80071bc:	ea48 0505 	orr.w	r5, r8, r5
 80071c0:	433c      	orrs	r4, r7
 80071c2:	3601      	adds	r6, #1
 80071c4:	2e10      	cmp	r6, #16
 80071c6:	d1ea      	bne.n	800719e <gpio_mode_setup+0xe>
 80071c8:	6005      	str	r5, [r0, #0]
 80071ca:	60c4      	str	r4, [r0, #12]
 80071cc:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

080071d0 <gpio_set_output_options>:
 80071d0:	2901      	cmp	r1, #1
 80071d2:	6841      	ldr	r1, [r0, #4]
 80071d4:	bf0c      	ite	eq
 80071d6:	4319      	orreq	r1, r3
 80071d8:	4399      	bicne	r1, r3
 80071da:	b5f0      	push	{r4, r5, r6, r7, lr}
 80071dc:	6041      	str	r1, [r0, #4]
 80071de:	6881      	ldr	r1, [r0, #8]
 80071e0:	2400      	movs	r4, #0
 80071e2:	2603      	movs	r6, #3
 80071e4:	fa43 f504 	asr.w	r5, r3, r4
 80071e8:	07ed      	lsls	r5, r5, #31
 80071ea:	d507      	bpl.n	80071fc <gpio_set_output_options+0x2c>
 80071ec:	0065      	lsls	r5, r4, #1
 80071ee:	fa06 f705 	lsl.w	r7, r6, r5
 80071f2:	ea21 0107 	bic.w	r1, r1, r7
 80071f6:	fa02 f505 	lsl.w	r5, r2, r5
 80071fa:	4329      	orrs	r1, r5
 80071fc:	3401      	adds	r4, #1
 80071fe:	2c10      	cmp	r4, #16
 8007200:	d1f0      	bne.n	80071e4 <gpio_set_output_options+0x14>
 8007202:	6081      	str	r1, [r0, #8]
 8007204:	bdf0      	pop	{r4, r5, r6, r7, pc}

08007206 <gpio_set_af>:
 8007206:	b5f0      	push	{r4, r5, r6, r7, lr}
 8007208:	6a06      	ldr	r6, [r0, #32]
 800720a:	6a45      	ldr	r5, [r0, #36]	@ 0x24
 800720c:	2300      	movs	r3, #0
 800720e:	f04f 0c0f 	mov.w	ip, #15
 8007212:	fa42 f403 	asr.w	r4, r2, r3
 8007216:	07e7      	lsls	r7, r4, #31
 8007218:	d507      	bpl.n	800722a <gpio_set_af+0x24>
 800721a:	009c      	lsls	r4, r3, #2
 800721c:	fa0c f704 	lsl.w	r7, ip, r4
 8007220:	ea26 0607 	bic.w	r6, r6, r7
 8007224:	fa01 f404 	lsl.w	r4, r1, r4
 8007228:	4326      	orrs	r6, r4
 800722a:	3301      	adds	r3, #1
 800722c:	2b08      	cmp	r3, #8
 800722e:	d1f0      	bne.n	8007212 <gpio_set_af+0xc>
 8007230:	2300      	movs	r3, #0
 8007232:	f04f 0c0f 	mov.w	ip, #15
 8007236:	f103 0408 	add.w	r4, r3, #8
 800723a:	fa42 f404 	asr.w	r4, r2, r4
 800723e:	07e4      	lsls	r4, r4, #31
 8007240:	d507      	bpl.n	8007252 <gpio_set_af+0x4c>
 8007242:	009c      	lsls	r4, r3, #2
 8007244:	fa0c f704 	lsl.w	r7, ip, r4
 8007248:	ea25 0507 	bic.w	r5, r5, r7
 800724c:	fa01 f404 	lsl.w	r4, r1, r4
 8007250:	4325      	orrs	r5, r4
 8007252:	3301      	adds	r3, #1
 8007254:	2b08      	cmp	r3, #8
 8007256:	d1ee      	bne.n	8007236 <gpio_set_af+0x30>
 8007258:	6206      	str	r6, [r0, #32]
 800725a:	6245      	str	r5, [r0, #36]	@ 0x24
 800725c:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

08007260 <rcc_get_usart_clksel_freq>:
 8007260:	4a0d      	ldr	r2, [pc, #52]	@ (8007298 <rcc_get_usart_clksel_freq+0x38>)
 8007262:	b508      	push	{r3, lr}
 8007264:	6b13      	ldr	r3, [r2, #48]	@ 0x30
 8007266:	fa23 f101 	lsr.w	r1, r3, r1
 800726a:	f001 0103 	and.w	r1, r1, #3
 800726e:	2902      	cmp	r1, #2
 8007270:	6853      	ldr	r3, [r2, #4]
 8007272:	d00b      	beq.n	800728c <rcc_get_usart_clksel_freq+0x2c>
 8007274:	2903      	cmp	r1, #3
 8007276:	d00c      	beq.n	8007292 <rcc_get_usart_clksel_freq+0x32>
 8007278:	2901      	cmp	r1, #1
 800727a:	d106      	bne.n	800728a <rcc_get_usart_clksel_freq+0x2a>
 800727c:	f3c3 1003 	ubfx	r0, r3, #4, #4
 8007280:	f000 f918 	bl	80074b4 <rcc_get_div_from_hpre>
 8007284:	4b05      	ldr	r3, [pc, #20]	@ (800729c <rcc_get_usart_clksel_freq+0x3c>)
 8007286:	681b      	ldr	r3, [r3, #0]
 8007288:	4358      	muls	r0, r3
 800728a:	bd08      	pop	{r3, pc}
 800728c:	f44f 4000 	mov.w	r0, #32768	@ 0x8000
 8007290:	e7fb      	b.n	800728a <rcc_get_usart_clksel_freq+0x2a>
 8007292:	4803      	ldr	r0, [pc, #12]	@ (80072a0 <rcc_get_usart_clksel_freq+0x40>)
 8007294:	e7f9      	b.n	800728a <rcc_get_usart_clksel_freq+0x2a>
 8007296:	bf00      	nop
 8007298:	40021000 	.word	0x40021000
 800729c:	2000000c 	.word	0x2000000c
 80072a0:	007a1200 	.word	0x007a1200

080072a4 <rcc_wait_for_sysclk_status.part.0>:
 80072a4:	4a03      	ldr	r2, [pc, #12]	@ (80072b4 <rcc_wait_for_sysclk_status.part.0+0x10>)
 80072a6:	6853      	ldr	r3, [r2, #4]
 80072a8:	f003 030c 	and.w	r3, r3, #12
 80072ac:	2b08      	cmp	r3, #8
 80072ae:	d1fa      	bne.n	80072a6 <rcc_wait_for_sysclk_status.part.0+0x2>
 80072b0:	4770      	bx	lr
 80072b2:	bf00      	nop
 80072b4:	40021000 	.word	0x40021000

080072b8 <rcc_is_osc_ready>:
 80072b8:	2804      	cmp	r0, #4
 80072ba:	d819      	bhi.n	80072f0 <rcc_is_osc_ready+0x38>
 80072bc:	e8df f000 	tbb	[pc, r0]
 80072c0:	120d0803 	.word	0x120d0803
 80072c4:	15          	.byte	0x15
 80072c5:	00          	.byte	0x00
 80072c6:	4b0b      	ldr	r3, [pc, #44]	@ (80072f4 <rcc_is_osc_ready+0x3c>)
 80072c8:	6818      	ldr	r0, [r3, #0]
 80072ca:	f3c0 6040 	ubfx	r0, r0, #25, #1
 80072ce:	4770      	bx	lr
 80072d0:	4b08      	ldr	r3, [pc, #32]	@ (80072f4 <rcc_is_osc_ready+0x3c>)
 80072d2:	6818      	ldr	r0, [r3, #0]
 80072d4:	f3c0 4040 	ubfx	r0, r0, #17, #1
 80072d8:	4770      	bx	lr
 80072da:	4b06      	ldr	r3, [pc, #24]	@ (80072f4 <rcc_is_osc_ready+0x3c>)
 80072dc:	6818      	ldr	r0, [r3, #0]
 80072de:	f3c0 0040 	ubfx	r0, r0, #1, #1
 80072e2:	4770      	bx	lr
 80072e4:	4b03      	ldr	r3, [pc, #12]	@ (80072f4 <rcc_is_osc_ready+0x3c>)
 80072e6:	6a18      	ldr	r0, [r3, #32]
 80072e8:	e7f9      	b.n	80072de <rcc_is_osc_ready+0x26>
 80072ea:	4b02      	ldr	r3, [pc, #8]	@ (80072f4 <rcc_is_osc_ready+0x3c>)
 80072ec:	6a58      	ldr	r0, [r3, #36]	@ 0x24
 80072ee:	e7f6      	b.n	80072de <rcc_is_osc_ready+0x26>
 80072f0:	2000      	movs	r0, #0
 80072f2:	4770      	bx	lr
 80072f4:	40021000 	.word	0x40021000

080072f8 <rcc_wait_for_osc_ready>:
 80072f8:	b508      	push	{r3, lr}
 80072fa:	4602      	mov	r2, r0
 80072fc:	4610      	mov	r0, r2
 80072fe:	f7ff ffdb 	bl	80072b8 <rcc_is_osc_ready>
 8007302:	2800      	cmp	r0, #0
 8007304:	d0fa      	beq.n	80072fc <rcc_wait_for_osc_ready+0x4>
 8007306:	bd08      	pop	{r3, pc}

08007308 <rcc_wait_for_sysclk_status>:
 8007308:	2801      	cmp	r0, #1
 800730a:	d106      	bne.n	800731a <rcc_wait_for_sysclk_status+0x12>
 800730c:	4a09      	ldr	r2, [pc, #36]	@ (8007334 <rcc_wait_for_sysclk_status+0x2c>)
 800730e:	6853      	ldr	r3, [r2, #4]
 8007310:	f003 030c 	and.w	r3, r3, #12
 8007314:	2b04      	cmp	r3, #4
 8007316:	d1fa      	bne.n	800730e <rcc_wait_for_sysclk_status+0x6>
 8007318:	4770      	bx	lr
 800731a:	2802      	cmp	r0, #2
 800731c:	d105      	bne.n	800732a <rcc_wait_for_sysclk_status+0x22>
 800731e:	4a05      	ldr	r2, [pc, #20]	@ (8007334 <rcc_wait_for_sysclk_status+0x2c>)
 8007320:	6853      	ldr	r3, [r2, #4]
 8007322:	f013 0f0c 	tst.w	r3, #12
 8007326:	d1fb      	bne.n	8007320 <rcc_wait_for_sysclk_status+0x18>
 8007328:	4770      	bx	lr
 800732a:	2800      	cmp	r0, #0
 800732c:	d1fc      	bne.n	8007328 <rcc_wait_for_sysclk_status+0x20>
 800732e:	f7ff bfb9 	b.w	80072a4 <rcc_wait_for_sysclk_status.part.0>
 8007332:	bf00      	nop
 8007334:	40021000 	.word	0x40021000

08007338 <rcc_osc_on>:
 8007338:	2804      	cmp	r0, #4
 800733a:	d81f      	bhi.n	800737c <rcc_osc_on+0x44>
 800733c:	e8df f000 	tbb	[pc, r0]
 8007340:	130e0903 	.word	0x130e0903
 8007344:	19          	.byte	0x19
 8007345:	00          	.byte	0x00
 8007346:	4a0e      	ldr	r2, [pc, #56]	@ (8007380 <rcc_osc_on+0x48>)
 8007348:	6813      	ldr	r3, [r2, #0]
 800734a:	f043 7380 	orr.w	r3, r3, #16777216	@ 0x1000000
 800734e:	6013      	str	r3, [r2, #0]
 8007350:	4770      	bx	lr
 8007352:	4a0b      	ldr	r2, [pc, #44]	@ (8007380 <rcc_osc_on+0x48>)
 8007354:	6813      	ldr	r3, [r2, #0]
 8007356:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
 800735a:	e7f8      	b.n	800734e <rcc_osc_on+0x16>
 800735c:	4a08      	ldr	r2, [pc, #32]	@ (8007380 <rcc_osc_on+0x48>)
 800735e:	6813      	ldr	r3, [r2, #0]
 8007360:	f043 0301 	orr.w	r3, r3, #1
 8007364:	e7f3      	b.n	800734e <rcc_osc_on+0x16>
 8007366:	4a06      	ldr	r2, [pc, #24]	@ (8007380 <rcc_osc_on+0x48>)
 8007368:	6a13      	ldr	r3, [r2, #32]
 800736a:	f043 0301 	orr.w	r3, r3, #1
 800736e:	6213      	str	r3, [r2, #32]
 8007370:	4770      	bx	lr
 8007372:	4a03      	ldr	r2, [pc, #12]	@ (8007380 <rcc_osc_on+0x48>)
 8007374:	6a53      	ldr	r3, [r2, #36]	@ 0x24
 8007376:	f043 0301 	orr.w	r3, r3, #1
 800737a:	6253      	str	r3, [r2, #36]	@ 0x24
 800737c:	4770      	bx	lr
 800737e:	bf00      	nop
 8007380:	40021000 	.word	0x40021000

08007384 <rcc_osc_off>:
 8007384:	2804      	cmp	r0, #4
 8007386:	d81f      	bhi.n	80073c8 <rcc_osc_off+0x44>
 8007388:	e8df f000 	tbb	[pc, r0]
 800738c:	130e0903 	.word	0x130e0903
 8007390:	19          	.byte	0x19
 8007391:	00          	.byte	0x00
 8007392:	4a0e      	ldr	r2, [pc, #56]	@ (80073cc <rcc_osc_off+0x48>)
 8007394:	6813      	ldr	r3, [r2, #0]
 8007396:	f023 7380 	bic.w	r3, r3, #16777216	@ 0x1000000
 800739a:	6013      	str	r3, [r2, #0]
 800739c:	4770      	bx	lr
 800739e:	4a0b      	ldr	r2, [pc, #44]	@ (80073cc <rcc_osc_off+0x48>)
 80073a0:	6813      	ldr	r3, [r2, #0]
 80073a2:	f423 3380 	bic.w	r3, r3, #65536	@ 0x10000
 80073a6:	e7f8      	b.n	800739a <rcc_osc_off+0x16>
 80073a8:	4a08      	ldr	r2, [pc, #32]	@ (80073cc <rcc_osc_off+0x48>)
 80073aa:	6813      	ldr	r3, [r2, #0]
 80073ac:	f023 0301 	bic.w	r3, r3, #1
 80073b0:	e7f3      	b.n	800739a <rcc_osc_off+0x16>
 80073b2:	4a06      	ldr	r2, [pc, #24]	@ (80073cc <rcc_osc_off+0x48>)
 80073b4:	6a13      	ldr	r3, [r2, #32]
 80073b6:	f023 0301 	bic.w	r3, r3, #1
 80073ba:	6213      	str	r3, [r2, #32]
 80073bc:	4770      	bx	lr
 80073be:	4a03      	ldr	r2, [pc, #12]	@ (80073cc <rcc_osc_off+0x48>)
 80073c0:	6a53      	ldr	r3, [r2, #36]	@ 0x24
 80073c2:	f023 0301 	bic.w	r3, r3, #1
 80073c6:	6253      	str	r3, [r2, #36]	@ 0x24
 80073c8:	4770      	bx	lr
 80073ca:	bf00      	nop
 80073cc:	40021000 	.word	0x40021000

080073d0 <rcc_set_sysclk_source>:
 80073d0:	4a03      	ldr	r2, [pc, #12]	@ (80073e0 <rcc_set_sysclk_source+0x10>)
 80073d2:	6853      	ldr	r3, [r2, #4]
 80073d4:	f023 0303 	bic.w	r3, r3, #3
 80073d8:	4303      	orrs	r3, r0
 80073da:	6053      	str	r3, [r2, #4]
 80073dc:	4770      	bx	lr
 80073de:	bf00      	nop
 80073e0:	40021000 	.word	0x40021000

080073e4 <rcc_set_ppre2>:
 80073e4:	4a03      	ldr	r2, [pc, #12]	@ (80073f4 <rcc_set_ppre2+0x10>)
 80073e6:	6853      	ldr	r3, [r2, #4]
 80073e8:	f423 5360 	bic.w	r3, r3, #14336	@ 0x3800
 80073ec:	ea43 23c0 	orr.w	r3, r3, r0, lsl #11
 80073f0:	6053      	str	r3, [r2, #4]
 80073f2:	4770      	bx	lr
 80073f4:	40021000 	.word	0x40021000

080073f8 <rcc_set_ppre1>:
 80073f8:	4a03      	ldr	r2, [pc, #12]	@ (8007408 <rcc_set_ppre1+0x10>)
 80073fa:	6853      	ldr	r3, [r2, #4]
 80073fc:	f423 63e0 	bic.w	r3, r3, #1792	@ 0x700
 8007400:	ea43 2300 	orr.w	r3, r3, r0, lsl #8
 8007404:	6053      	str	r3, [r2, #4]
 8007406:	4770      	bx	lr
 8007408:	40021000 	.word	0x40021000

0800740c <rcc_set_hpre>:
 800740c:	4a03      	ldr	r2, [pc, #12]	@ (800741c <rcc_set_hpre+0x10>)
 800740e:	6853      	ldr	r3, [r2, #4]
 8007410:	f023 03f0 	bic.w	r3, r3, #240	@ 0xf0
 8007414:	ea43 1300 	orr.w	r3, r3, r0, lsl #4
 8007418:	6053      	str	r3, [r2, #4]
 800741a:	4770      	bx	lr
 800741c:	40021000 	.word	0x40021000

08007420 <rcc_get_usart_clk_freq>:
 8007420:	4a0d      	ldr	r2, [pc, #52]	@ (8007458 <rcc_get_usart_clk_freq+0x38>)
 8007422:	4290      	cmp	r0, r2
 8007424:	4603      	mov	r3, r0
 8007426:	d104      	bne.n	8007432 <rcc_get_usart_clk_freq+0x12>
 8007428:	4b0c      	ldr	r3, [pc, #48]	@ (800745c <rcc_get_usart_clk_freq+0x3c>)
 800742a:	6818      	ldr	r0, [r3, #0]
 800742c:	2100      	movs	r1, #0
 800742e:	f7ff bf17 	b.w	8007260 <rcc_get_usart_clksel_freq>
 8007432:	4a0b      	ldr	r2, [pc, #44]	@ (8007460 <rcc_get_usart_clk_freq+0x40>)
 8007434:	6810      	ldr	r0, [r2, #0]
 8007436:	4a0b      	ldr	r2, [pc, #44]	@ (8007464 <rcc_get_usart_clk_freq+0x44>)
 8007438:	4293      	cmp	r3, r2
 800743a:	d101      	bne.n	8007440 <rcc_get_usart_clk_freq+0x20>
 800743c:	2110      	movs	r1, #16
 800743e:	e7f6      	b.n	800742e <rcc_get_usart_clk_freq+0xe>
 8007440:	4a09      	ldr	r2, [pc, #36]	@ (8007468 <rcc_get_usart_clk_freq+0x48>)
 8007442:	4293      	cmp	r3, r2
 8007444:	d101      	bne.n	800744a <rcc_get_usart_clk_freq+0x2a>
 8007446:	2112      	movs	r1, #18
 8007448:	e7f1      	b.n	800742e <rcc_get_usart_clk_freq+0xe>
 800744a:	4a08      	ldr	r2, [pc, #32]	@ (800746c <rcc_get_usart_clk_freq+0x4c>)
 800744c:	4293      	cmp	r3, r2
 800744e:	bf0c      	ite	eq
 8007450:	2114      	moveq	r1, #20
 8007452:	2116      	movne	r1, #22
 8007454:	e7eb      	b.n	800742e <rcc_get_usart_clk_freq+0xe>
 8007456:	bf00      	nop
 8007458:	40013800 	.word	0x40013800
 800745c:	20000004 	.word	0x20000004
 8007460:	20000008 	.word	0x20000008
 8007464:	40004400 	.word	0x40004400
 8007468:	40004800 	.word	0x40004800
 800746c:	40004c00 	.word	0x40004c00

08007470 <rcc_periph_clock_enable>:
 8007470:	0943      	lsrs	r3, r0, #5
 8007472:	f103 4380 	add.w	r3, r3, #1073741824	@ 0x40000000
 8007476:	f503 3304 	add.w	r3, r3, #135168	@ 0x21000
 800747a:	f000 001f 	and.w	r0, r0, #31
 800747e:	6819      	ldr	r1, [r3, #0]
 8007480:	2201      	movs	r2, #1
 8007482:	4082      	lsls	r2, r0
 8007484:	430a      	orrs	r2, r1
 8007486:	601a      	str	r2, [r3, #0]
 8007488:	4770      	bx	lr
	...

0800748c <rcc_osc_bypass_enable>:
 800748c:	2801      	cmp	r0, #1
 800748e:	d002      	beq.n	8007496 <rcc_osc_bypass_enable+0xa>
 8007490:	2803      	cmp	r0, #3
 8007492:	d006      	beq.n	80074a2 <rcc_osc_bypass_enable+0x16>
 8007494:	4770      	bx	lr
 8007496:	4a06      	ldr	r2, [pc, #24]	@ (80074b0 <rcc_osc_bypass_enable+0x24>)
 8007498:	6813      	ldr	r3, [r2, #0]
 800749a:	f443 2380 	orr.w	r3, r3, #262144	@ 0x40000
 800749e:	6013      	str	r3, [r2, #0]
 80074a0:	4770      	bx	lr
 80074a2:	4a03      	ldr	r2, [pc, #12]	@ (80074b0 <rcc_osc_bypass_enable+0x24>)
 80074a4:	6a13      	ldr	r3, [r2, #32]
 80074a6:	f043 0304 	orr.w	r3, r3, #4
 80074aa:	6213      	str	r3, [r2, #32]
 80074ac:	4770      	bx	lr
 80074ae:	bf00      	nop
 80074b0:	40021000 	.word	0x40021000

080074b4 <rcc_get_div_from_hpre>:
 80074b4:	2807      	cmp	r0, #7
 80074b6:	4603      	mov	r3, r0
 80074b8:	f04f 0001 	mov.w	r0, #1
 80074bc:	d905      	bls.n	80074ca <rcc_get_div_from_hpre+0x16>
 80074be:	2b0b      	cmp	r3, #11
 80074c0:	bf94      	ite	ls
 80074c2:	3b07      	subls	r3, #7
 80074c4:	3b06      	subhi	r3, #6
 80074c6:	4098      	lsls	r0, r3
 80074c8:	b280      	uxth	r0, r0
 80074ca:	4770      	bx	lr

080074cc <usart_set_baudrate>:
 80074cc:	b538      	push	{r3, r4, r5, lr}
 80074ce:	460c      	mov	r4, r1
 80074d0:	4605      	mov	r5, r0
 80074d2:	f7ff ffa5 	bl	8007420 <rcc_get_usart_clk_freq>
 80074d6:	eb00 0354 	add.w	r3, r0, r4, lsr #1
 80074da:	fbb3 f3f4 	udiv	r3, r3, r4
 80074de:	60eb      	str	r3, [r5, #12]
 80074e0:	bd38      	pop	{r3, r4, r5, pc}

080074e2 <usart_set_databits>:
 80074e2:	6803      	ldr	r3, [r0, #0]
 80074e4:	2908      	cmp	r1, #8
 80074e6:	bf0c      	ite	eq
 80074e8:	f423 5380 	biceq.w	r3, r3, #4096	@ 0x1000
 80074ec:	f443 5380 	orrne.w	r3, r3, #4096	@ 0x1000
 80074f0:	6003      	str	r3, [r0, #0]
 80074f2:	4770      	bx	lr

080074f4 <usart_set_stopbits>:
 80074f4:	6843      	ldr	r3, [r0, #4]
 80074f6:	f423 5340 	bic.w	r3, r3, #12288	@ 0x3000
 80074fa:	430b      	orrs	r3, r1
 80074fc:	6043      	str	r3, [r0, #4]
 80074fe:	4770      	bx	lr

08007500 <usart_set_parity>:
 8007500:	6803      	ldr	r3, [r0, #0]
 8007502:	f423 63c0 	bic.w	r3, r3, #1536	@ 0x600
 8007506:	430b      	orrs	r3, r1
 8007508:	6003      	str	r3, [r0, #0]
 800750a:	4770      	bx	lr

0800750c <usart_set_mode>:
 800750c:	6803      	ldr	r3, [r0, #0]
 800750e:	f023 030c 	bic.w	r3, r3, #12
 8007512:	430b      	orrs	r3, r1
 8007514:	6003      	str	r3, [r0, #0]
 8007516:	4770      	bx	lr

08007518 <usart_set_flow_control>:
 8007518:	6883      	ldr	r3, [r0, #8]
 800751a:	f423 7340 	bic.w	r3, r3, #768	@ 0x300
 800751e:	430b      	orrs	r3, r1
 8007520:	6083      	str	r3, [r0, #8]
 8007522:	4770      	bx	lr

08007524 <usart_enable>:
 8007524:	6803      	ldr	r3, [r0, #0]
 8007526:	f043 0301 	orr.w	r3, r3, #1
 800752a:	6003      	str	r3, [r0, #0]
 800752c:	4770      	bx	lr

0800752e <usart_send_blocking>:
 800752e:	b538      	push	{r3, r4, r5, lr}
 8007530:	4604      	mov	r4, r0
 8007532:	460d      	mov	r5, r1
 8007534:	f000 f88a 	bl	800764c <usart_wait_send_ready>
 8007538:	4629      	mov	r1, r5
 800753a:	4620      	mov	r0, r4
 800753c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8007540:	f000 b880 	b.w	8007644 <usart_send>

08007544 <usart_disable_rx_interrupt>:
 8007544:	6803      	ldr	r3, [r0, #0]
 8007546:	f023 0320 	bic.w	r3, r3, #32
 800754a:	6003      	str	r3, [r0, #0]
 800754c:	4770      	bx	lr

0800754e <usart_disable_tx_interrupt>:
 800754e:	6803      	ldr	r3, [r0, #0]
 8007550:	f023 0380 	bic.w	r3, r3, #128	@ 0x80
 8007554:	6003      	str	r3, [r0, #0]
 8007556:	4770      	bx	lr

08007558 <blocking_handler>:
 8007558:	e7fe      	b.n	8007558 <blocking_handler>

0800755a <null_handler>:
 800755a:	4770      	bx	lr

0800755c <reset_handler>:
 800755c:	b538      	push	{r3, r4, r5, lr}
 800755e:	4a1d      	ldr	r2, [pc, #116]	@ (80075d4 <reset_handler+0x78>)
 8007560:	4b1d      	ldr	r3, [pc, #116]	@ (80075d8 <reset_handler+0x7c>)
 8007562:	491e      	ldr	r1, [pc, #120]	@ (80075dc <reset_handler+0x80>)
 8007564:	428b      	cmp	r3, r1
 8007566:	d320      	bcc.n	80075aa <reset_handler+0x4e>
 8007568:	4a1d      	ldr	r2, [pc, #116]	@ (80075e0 <reset_handler+0x84>)
 800756a:	2100      	movs	r1, #0
 800756c:	4293      	cmp	r3, r2
 800756e:	d321      	bcc.n	80075b4 <reset_handler+0x58>
 8007570:	f04f 23e0 	mov.w	r3, #3758153728	@ 0xe000e000
 8007574:	4c1b      	ldr	r4, [pc, #108]	@ (80075e4 <reset_handler+0x88>)
 8007576:	f8d3 2d14 	ldr.w	r2, [r3, #3348]	@ 0xd14
 800757a:	4d1b      	ldr	r5, [pc, #108]	@ (80075e8 <reset_handler+0x8c>)
 800757c:	f442 7200 	orr.w	r2, r2, #512	@ 0x200
 8007580:	f8c3 2d14 	str.w	r2, [r3, #3348]	@ 0xd14
 8007584:	f8d3 2d88 	ldr.w	r2, [r3, #3464]	@ 0xd88
 8007588:	f442 0270 	orr.w	r2, r2, #15728640	@ 0xf00000
 800758c:	f8c3 2d88 	str.w	r2, [r3, #3464]	@ 0xd88
 8007590:	42ac      	cmp	r4, r5
 8007592:	d312      	bcc.n	80075ba <reset_handler+0x5e>
 8007594:	4c15      	ldr	r4, [pc, #84]	@ (80075ec <reset_handler+0x90>)
 8007596:	4d16      	ldr	r5, [pc, #88]	@ (80075f0 <reset_handler+0x94>)
 8007598:	42ac      	cmp	r4, r5
 800759a:	d312      	bcc.n	80075c2 <reset_handler+0x66>
 800759c:	f7f8 fdf2 	bl	8000184 <main>
 80075a0:	4c14      	ldr	r4, [pc, #80]	@ (80075f4 <reset_handler+0x98>)
 80075a2:	4d15      	ldr	r5, [pc, #84]	@ (80075f8 <reset_handler+0x9c>)
 80075a4:	42ac      	cmp	r4, r5
 80075a6:	d310      	bcc.n	80075ca <reset_handler+0x6e>
 80075a8:	bd38      	pop	{r3, r4, r5, pc}
 80075aa:	f852 0b04 	ldr.w	r0, [r2], #4
 80075ae:	f843 0b04 	str.w	r0, [r3], #4
 80075b2:	e7d7      	b.n	8007564 <reset_handler+0x8>
 80075b4:	f843 1b04 	str.w	r1, [r3], #4
 80075b8:	e7d8      	b.n	800756c <reset_handler+0x10>
 80075ba:	f854 3b04 	ldr.w	r3, [r4], #4
 80075be:	4798      	blx	r3
 80075c0:	e7e6      	b.n	8007590 <reset_handler+0x34>
 80075c2:	f854 3b04 	ldr.w	r3, [r4], #4
 80075c6:	4798      	blx	r3
 80075c8:	e7e6      	b.n	8007598 <reset_handler+0x3c>
 80075ca:	f854 3b04 	ldr.w	r3, [r4], #4
 80075ce:	4798      	blx	r3
 80075d0:	e7e8      	b.n	80075a4 <reset_handler+0x48>
 80075d2:	bf00      	nop
 80075d4:	08007e20 	.word	0x08007e20
 80075d8:	20000000 	.word	0x20000000
 80075dc:	20000010 	.word	0x20000010
 80075e0:	20000098 	.word	0x20000098
 80075e4:	08007e18 	.word	0x08007e18
 80075e8:	08007e18 	.word	0x08007e18
 80075ec:	08007e18 	.word	0x08007e18
 80075f0:	08007e18 	.word	0x08007e18
 80075f4:	08007e18 	.word	0x08007e18
 80075f8:	08007e18 	.word	0x08007e18

080075fc <systick_set_reload>:
 80075fc:	f04f 23e0 	mov.w	r3, #3758153728	@ 0xe000e000
 8007600:	f020 407f 	bic.w	r0, r0, #4278190080	@ 0xff000000
 8007604:	6158      	str	r0, [r3, #20]
 8007606:	4770      	bx	lr

08007608 <systick_get_value>:
 8007608:	f04f 23e0 	mov.w	r3, #3758153728	@ 0xe000e000
 800760c:	6998      	ldr	r0, [r3, #24]
 800760e:	f020 407f 	bic.w	r0, r0, #4278190080	@ 0xff000000
 8007612:	4770      	bx	lr

08007614 <systick_set_clocksource>:
 8007614:	f04f 22e0 	mov.w	r2, #3758153728	@ 0xe000e000
 8007618:	f000 0004 	and.w	r0, r0, #4
 800761c:	6913      	ldr	r3, [r2, #16]
 800761e:	f023 0304 	bic.w	r3, r3, #4
 8007622:	4303      	orrs	r3, r0
 8007624:	6113      	str	r3, [r2, #16]
 8007626:	4770      	bx	lr

08007628 <systick_interrupt_enable>:
 8007628:	f04f 22e0 	mov.w	r2, #3758153728	@ 0xe000e000
 800762c:	6913      	ldr	r3, [r2, #16]
 800762e:	f043 0302 	orr.w	r3, r3, #2
 8007632:	6113      	str	r3, [r2, #16]
 8007634:	4770      	bx	lr

08007636 <systick_counter_enable>:
 8007636:	f04f 22e0 	mov.w	r2, #3758153728	@ 0xe000e000
 800763a:	6913      	ldr	r3, [r2, #16]
 800763c:	f043 0301 	orr.w	r3, r3, #1
 8007640:	6113      	str	r3, [r2, #16]
 8007642:	4770      	bx	lr

08007644 <usart_send>:
 8007644:	f3c1 0108 	ubfx	r1, r1, #0, #9
 8007648:	6281      	str	r1, [r0, #40]	@ 0x28
 800764a:	4770      	bx	lr

0800764c <usart_wait_send_ready>:
 800764c:	69c3      	ldr	r3, [r0, #28]
 800764e:	061b      	lsls	r3, r3, #24
 8007650:	d5fc      	bpl.n	800764c <usart_wait_send_ready>
 8007652:	4770      	bx	lr
 8007654:	54494e49 	.word	0x54494e49
 8007658:	0000000a 	.word	0x0000000a
 800765c:	5359454b 	.word	0x5359454b
 8007660:	4e454720 	.word	0x4e454720
 8007664:	54415245 	.word	0x54415245
 8007668:	000a4445 	.word	0x000a4445
 800766c:	54494157 	.word	0x54494157
 8007670:	0000000a 	.word	0x0000000a
 8007674:	3a59454b 	.word	0x3a59454b
 8007678:	00000020 	.word	0x00000020
 800767c:	0000000a 	.word	0x0000000a
 8007680:	33323130 	.word	0x33323130
 8007684:	37363534 	.word	0x37363534
 8007688:	62613938 	.word	0x62613938
 800768c:	66656463 	.word	0x66656463
 8007690:	00000000 	.word	0x00000000

08007694 <zetas_asm>:
 8007694:	84f5c5b6 c666e465 fcec8b58 cb2b72d0     ....e.f.X....r+.
 80076a4:	30726d5b 91e11612 41360f89 51aaf2da     [mr0......6A...Q
 80076b4:	93922fd5 0ed77946 3d4a0dff d63e49fb     ./..Fy....J=.I>.
 80076c4:	fab1a391 2bc18ea7 864470e4 16c32c11     .......+.pD..,..
 80076d4:	16395e0d 19743224 014eab2e d4522112     .^9.$2t...N..!R.
 80076e4:	2cd52aae cbb540d4 bc2c9a1c fa27d58e     .*.,.@....,...'.
 80076f4:	87094e0e 7de29fcd 379942fb aff27732     .N.....}.B.72w..
 8007704:	54970814 66f8144e 5c0c9c92 b12d72a9     ...TN..f...\.r-.
 8007714:	6c5a2074 ccb52d24 fc4f0d9d 11eaedee     t Zl$-....O.....
 8007724:	71811d74 af19ea51 9e078945 3a22e9a0     t..qQ...E.....":
 8007734:	a5cbdca1 e7da790b ea8b7f1e ea3cc040     .....y......@.<.
 8007744:	31fc27af 9807ff63 82f5ed16 7ef63bd5     .'.1c........;.~
 8007754:	d6795921 8992f4b3 044e701f c13fe765     !Yy......pN.e.?.
 8007764:	3099ccc9 8e08c440 4935720b 7059d1b5     ...0@....r5I..Yp
 8007774:	cea1560e ac4184cf dc518394 0289a6a5     .V....A...Q.....
 8007784:	483585bb b17c3187 bb67bcf2 b7a31ad7     ..5H.1|...g.....
 8007794:	6681f601 658209b1 934370f8 385e2025     ...f...e.pC.% ^8
 80077a4:	b3b7194d 149bf401 314afa3c 6da8cba2     M.......<.J1...m
 80077b4:	b254be68 6e59f915 79cf3ed4 b0b7545c     h.T...Yn.>.y\T..
 80077c4:	9ca52e5f f79e2ee9 a1074e36 3e0eeb29     _.......6N..)..>
 80077d4:	22c23fd4 1cd665aa c4049d2f a0b88f58     .?.".e../...X...
 80077e4:	7e801d88 2924384b 6e95083b dc8c92ba     ...~K8$);..n....
 80077f4:	51bea292 1887f58b d53e5dab 3a369957     ...Q.....]>.W.6:
 8007804:	dda02ec2 75f6ed02 b8b6b6df a169bccb     .......u......i.
 8007814:	2b2410ec bda2a4b9 c77a806d b805896c     ..$+....m.z.l...
 8007824:	cb8de165 c93f49e7 d7a0a4e0 53f98a58     e....I?.....X..S
 8007834:	1efd9db9 4ee63d0f dd651f9c 71e38c09     .....=.N..e....q
 8007844:	31d4c840 57e58be2 a555be54 d565bd19     @..1...WT.U...e.
 8007854:	442224c3 97ccf03d be402274 ef28ae1a     .$"D=...t"@...(.
 8007864:	846bf7b2 5d33e851 901c4c98 4f214c36     ..k.Q.3].L..6L!O
 8007874:	3f228731 5e5b3410 45fa9df4 a24249ac     1."?.4[^...E.IB.
 8007884:	e1b38fba 440e750b a5a47d32 00000000     .....u.D2}......

08007894 <zetas_inv_CT_asm>:
 8007894:	0013afb8 0013afb8 7b0a3a4b 0013afb8     ........K:.{....
 80078a4:	031374a9 7b0a3a4b 39991b9c 0013afb8     .t..K:.{...9....
 80078b4:	bec9f078 031374a9 cf8d92a6 7b0a3a4b     x....t......K:.{
 80078c4:	6e1ee9ef 39991b9c 34d48d31 0013afb8     ...n...91..4....
 80078d4:	7b0a3a4b 0013afb8 031374a9 7b0a3a4b     K:.{.....t..K:.{
 80078e4:	39991b9c 912fe8a0 114d7033 af7c58e6     ...9../.3pM..X|.
 80078f4:	b41987e2 6b6de3db 23fd3b4b c92b9a30     ......mkK;.#0.+.
 8007904:	9f914399 79bb8f1d c0dd78d0 68330fc4     .C.....y.x....3h
 8007914:	ba05620d 10d751e7 a1a4cbf1 41bfdd8d     .b...Q.........A
 8007924:	62e4b355 6a6df78b 73bc053b a12eada4     U..b..mj;..s....
 8007934:	1560d12b 2f4b219b 5720aeb8 63bd4037     +.`..!K/.. W7@.c
 8007944:	bec9f078 79bb8f1d d43e715a c0dd78d0     x......yZq>..x..
 8007954:	229ae065 68330fc4 47fa7695 e7b3199c     e.."..3h.v.G....
 8007964:	7ebb2cae 33fc004f cd3efb28 1f600c4e     .,.~O..3(.>.N.`.
 8007974:	11d73e37 e701ec29 c9a1b87c c2b5f202     7>..)...|.......
 8007984:	997e0a00 53be7b32 6cbc8f09 fd76595c     ..~.2{.S...l\Yv.
 8007994:	9a7df650 23ae7c6d 770a890a ad1a11b0     P.}.m|.#...w....
 80079a4:	99a5696f 0c12c37b 01d87932 e2ee8b31     oi..{...2y..1...
 80079b4:	49d2efc7 7545bf8f 031374a9 bec9f078     ...I..Eu.t..x...
 80079c4:	6e1ee9ef 79bb8f1d 054e5c70 d43e715a     ...n...yp\N.Zq>.
 80079d4:	29c1b606 615af901 82a72e38 3636e816     ...)..Za8.....66
 80079e4:	6a1f38ad 7894435e 94e0db03 d72a8694     .8.j^C.x......*.
 80079f4:	43223872 054e5c70 225fd13f d6dbc7b6     r8"Cp\N.?._"....
 8007a04:	47494922 23736d47 8a0912ff 916af7c6     "IIGGms#......j.
 8007a14:	d88ce179 ad5520d7 d6033ad5 154d2174     y.... U..:..t!M.
 8007a24:	70813124 540d3a10 942fad91 22111262     $1.p.:.T../.b.."
 8007a34:	cf8d92a6 c2b5f202 f12886bb 997e0a00     ..........(...~.
 8007a44:	fbb18fe2 53be7b32 15c33fc1 ee9ee017     ....2{.S.?......
 8007a54:	91b9b6a4 48d30376 c5048980 60f88a6c     ....v..H....l..`
 8007a64:	c8b57be3 26d5a0cd 5c5b5b70 6c6dd02c     .{.....&p[[\,.ml
 8007a74:	8e7ee28d 9907ebb3 61f876bc 4ed28d58     ..~......v.aX..N
 8007a84:	50e615b0 a3f3636f 3b3685a7 db6546fb     ...Poc....6;.Fe.
 8007a94:	4084e216 47d31726 14c35370 38fb9de1     ...@&..GpS.....8
 8007aa4:	3e850976 e750ab07 7b0a3a4b 031374a9     v..>..P.K:.{.t..
 8007ab4:	39991b9c bec9f078 cf8d92a6 6e1ee9ef     ...9x..........n
 8007ac4:	34d48d31 c73f7147 fdd8c7f1 21e9b2f3     1..4Gq?........!
 8007ad4:	a9df3d99 4c83f5da 8ae19fe1 f49e69f8     .=.....L.....i..
 8007ae4:	b340fb01 d43e715a 229ae065 47fa7695     ..@.Zq>.e..".v.G
 8007af4:	ce2b37c1 36c0b61a 8e1c73f8 34721e9c     .7+....6.s....r4
 8007b04:	8430e88c 1dfdb169 a7a455d3 afa3b855     ..0.i....U..U...
 8007b14:	31ad68d1 7194cd2c c3186097 bf400ec4     .h.1,..q.`....@.
 8007b24:	6e1ee9ef 054e5c70 29c1b606 225fd13f     ...np\N....)?._"
 8007b34:	5ef8b1cb d6dbc7b6 9257345f bc7b58fa     ...^...._4W..X{.
 8007b44:	a76946ac 7345e6ef 28730ad8 02ec153a     .Fi...Es..s(:...
 8007b54:	51f9b1b8 74e350fa cf03c4a3 f12886bb     ...Q.P.t......(.
 8007b64:	fbb18fe2 15c33fc1 cf663338 67f8009e     .....?..83f....g
 8007b74:	3ec0189c ce03d852 1a255f97 64335e83     ...>R...._%..^3d
 8007b84:	15d6ef78 a806c468 69956aaa 410eb01a     x...h....j.i...A
 8007b94:	7f58aa6a 2a4b840a 39991b9c cf8d92a6     j.X...K*...9....
 8007ba4:	34d48d31 c2b5f202 6c6dd02c f12886bb     1..4....,.ml..(.
 8007bb4:	ae550d27 0189ba55 e7c6c953 3d851d26     '.U.U...S...&..=
 8007bc4:	370f74f8 9ccc8dce 9a6a4699 7ff62825     .t.7.....Fj.%(..
 8007bd4:	209b07c5 29c1b606 5ef8b1cb 9257345f     ... ...)...^_4W.
 8007be4:	dd3dc02d 91a606ec c1f114d8 4dab4199     -.=..........A.M
 8007bf4:	0f263824 d1660bd8 5df8c57b b7f1d9b5     $8&...f.{..]....
 8007c04:	aededb2b bdca0428 52d23e99 a790a61b     +...(....>.R....
 8007c14:	34d48d31 6c6dd02c ae550d27 8e7ee28d     1..4,.ml'.U...~.
 8007c24:	43d365e5 9907ebb3 e93cd3f0 886ba8f4     .e.C......<...k.
 8007c34:	1b605b0d 50d265f9 470e39fc a0dfeec7     .[`..e.P.9.G....
 8007c44:	1a390f4e 22fd4efa 18ea6420 ae550d27     N.9..N." d..'.U.
 8007c54:	43d365e5 e93cd3f0 78f6b1f3 e68bcddd     .e.C..<....x....
 8007c64:	05d82a73 e9c6a1f4 2624735a a741e73d     s*......Zs$&=.A.
 8007c74:	f5b20600 224c2188 63d0efee 5be53d23     .....!L"...c#=.[
 8007c84:	98a57d1e 5bd18d6c 00000000 00000000     .}..l..[........

08007c94 <zetas>:
 8007c94:	014eab2e d4522112 2cd52aae cbb540d4     ..N..!R..*.,.@..
 8007ca4:	7de29fcd 379942fb aff27732 54970814     ...}.B.72w.....T
 8007cb4:	6c5a2074 ccb52d24 fc4f0d9d 11eaedee     t Zl$-....O.....
 8007cc4:	3a22e9a0 a5cbdca1 e7da790b ea8b7f1e     ..":.....y......
 8007cd4:	82f5ed16 7ef63bd5 d6795921 8992f4b3     .....;.~!Yy.....
 8007ce4:	8e08c440 4935720b 7059d1b5 cea1560e     @....r5I..Yp.V..
 8007cf4:	483585bb b17c3187 bb67bcf2 b7a31ad7     ..5H.1|...g.....
 8007d04:	385e2025 b3b7194d 149bf401 314afa3c     % ^8M.......<.J1
 8007d14:	79cf3ed4 b0b7545c 9ca52e5f f79e2ee9     .>.y\T.._.......
 8007d24:	1cd665aa c4049d2f a0b88f58 7e801d88     .e../...X......~
 8007d34:	51bea292 1887f58b d53e5dab 3a369957     ...Q.....]>.W.6:
 8007d44:	a169bccb 2b2410ec bda2a4b9 c77a806d     ..i...$+....m.z.
 8007d54:	d7a0a4e0 53f98a58 1efd9db9 4ee63d0f     ....X..S.....=.N
 8007d64:	57e58be2 a555be54 d565bd19 442224c3     ...WT.U...e..$"D
 8007d74:	846bf7b2 5d33e851 901c4c98 4f214c36     ..k.Q.3].L..6L!O
 8007d84:	a24249ac e1b38fba 440e750b a5a47d32     .IB......u.D2}..
 8007d94:	00000000                                ....

08007d98 <seed>:
 8007d98:	00000003 00000001 00000004 00000001     ................
 8007da8:	00000005 00000009 00000002 00000006     ................
 8007db8:	00000005 00000003 00000005 00000008     ................
 8007dc8:	00000009 00000007 00000009 00000003     ................
 8007dd8:	00000002 00000003 00000008 00000004     ................
 8007de8:	00000006 00000002 00000006 00000004     ................
 8007df8:	00000003 00000003 00000008 00000003     ................
 8007e08:	00000002 00000007 00000009 00000005     ................

uint64_t sub_100002CDC(int a1)
{
  else {
    return qword_10000D210[a1 - 1];
  }
}

void sub_100002D1C()
{
  byte_100015090 = 1;
  qword_1000150A0 = 0xEA00000000005832LL;
}

void variable initialization expression of CKDMain_Swift.serialQueue()
{
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  sub_10000999C();
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  sub_100009574();
  __chkstk_darwin();
  uint64_t v5 = sub_100009654();
  type metadata accessor for DispatchQoS(v5);
  sub_100009574();
  __chkstk_darwin();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10000937C(0LL, &qword_100014AC8, &OBJC_CLASS___OS_dispatch_queue_ptr);
  static DispatchQoS.unspecified.getter();
  v13 = &_swiftEmptyArrayStorage;
  sub_100008DC8( &qword_100014AD0,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v9 = v8;
  uint64_t v10 = sub_100002EA0(&qword_100014AD8);
  unint64_t v11 = sub_100002EE0();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v13, v10, v11, v4, v9);
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))( v0,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v2);
  OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000001DLL,  0x800000010000D270LL,  v7,  v1,  v0,  0LL);
  sub_100009554();
}

uint64_t sub_100002EA0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100002EE0()
{
  unint64_t result = qword_100014AE0;
  if (!qword_100014AE0)
  {
    uint64_t v1 = sub_100002F24(&qword_100014AD8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100014AE0);
  }

  return result;
}

uint64_t sub_100002F24(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t variable initialization expression of CKDMain_Swift.systemAvailableForCacheDelete()
{
  return 0LL;
}

Swift::Void __swiftcall CKDMain_Swift.markSystemAvailableForCacheDelete()()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC6cloudd13CKDMain_Swift_serialQueue];
  uint64_t v2 = sub_1000096E4((uint64_t)&unk_100010A30, 24LL);
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = sub_1000096E4((uint64_t)&unk_100010A58, 32LL);
  *(void *)(v3 + 16) = sub_1000030BC;
  *(void *)(v3 + 24) = v2;
  v9[4] = sub_1000030D8;
  uint64_t v10 = v3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256LL;
  v9[2] = sub_1000030F8;
  v9[3] = &unk_100010A70;
  uint64_t v4 = _Block_copy(v9);
  uint64_t v5 = v10;
  uint64_t v6 = v1;
  v7 = v0;
  swift_retain(v3);
  swift_release(v5);
  dispatch_sync(v6, v4);

  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v3, "", 81LL, 53LL, 26LL, 1LL);
  sub_100009A24();
  swift_release(v3);
  if ((isEscapingClosureAtFileLocation & 1) != 0) {
    __break(1u);
  }
}

uint64_t sub_100003098()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000030BC()
{
  *(_BYTE *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_systemAvailableForCacheDelete) = 1;
}

uint64_t sub_1000030D8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000030F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100003118(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100003128(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t variable initialization expression of CKDMain_Swift.CACHE_DELETE_LISTENER()
{
  return 0xD00000000000001DLL;
}

unint64_t variable initialization expression of CKDMain_Swift.CACHE_DELETE_SYSTEM_LISTENER()
{
  return 0xD000000000000024LL;
}

uint64_t variable initialization expression of CKDMain_Swift.cloudAssetsServiceListener()
{
  return 0LL;
}

uint64_t sub_10000319C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_cloudAssetsServiceListener);
  *(void *)(v1 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_cloudAssetsServiceListener) = a1;
  return swift_release(v2);
}

void sub_1000031B4()
{
  uint64_t v23 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  sub_100002EA0(&qword_100014BA0);
  sub_100009574();
  __chkstk_darwin();
  sub_10000996C();
  uint64_t v18 = type metadata accessor for TaskPriority(0LL);
  sub_100009A18(v1, v19, v20, v18);
  v21 = (void *)sub_1000096E4((uint64_t)&unk_100010BE0, 104LL);
  v21[2] = 0LL;
  v21[3] = 0LL;
  v21[4] = v17;
  v21[5] = v15;
  v21[6] = v13;
  v21[7] = v11;
  v21[8] = v9;
  v21[9] = v7;
  v21[10] = v5;
  v21[11] = v3;
  v21[12] = v23;
  swift_bridgeObjectRetain(v15);
  uint64_t v22 = sub_1000039E4(v1, (uint64_t)&unk_100014BB0, (uint64_t)v21);
  swift_release(v22);
  sub_100009554();
}

uint64_t sub_100003280( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 88) = v15;
  *(_OWORD *)(v8 + 72) = v14;
  *(void *)(v8 + 56) = a7;
  *(void *)(v8 + 64) = a8;
  *(void *)(v8 + 40) = a5;
  *(void *)(v8 + 48) = a6;
  *(void *)(v8 + 32) = a4;
  uint64_t v9 = sub_100002EA0(&qword_100014BC8);
  *(void *)(v8 + 96) = swift_task_alloc((*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_1000096D4();
  *(void *)(v8 + 104) = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)(v8 + 112) = v11;
  unint64_t v12 = (*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v8 + 120) = swift_task_alloc(v12);
  *(void *)(v8 + 128) = swift_task_alloc(v12);
  return swift_task_switch(sub_100003328, 0LL, 0LL);
}

uint64_t sub_100003328()
{
  uint64_t v1 = v0[4];
  uint64_t v58 = v0[11];
  uint64_t v55 = v0[9];
  uint64_t v56 = v0[10];
  uint64_t v53 = v0[7];
  uint64_t v54 = v0[8];
  uint64_t v2 = v0[5];
  uint64_t v52 = v0[6];
  uint64_t v3 = sub_100002EA0(&qword_100014BD0);
  uint64_t v4 = sub_100002EA0(&qword_100014BD8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 72);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = (v7 + 32) & ~v7;
  uint64_t v9 = swift_allocObject(v3, v8 - v6 + 8 * v6, v7 | 7);
  *(_OWORD *)(v9 + 16) = xmmword_10000CFE0;
  uint64_t v10 = (void *)(v9 + v8);
  uint64_t v11 = (void *)((char *)v10 + *(int *)(v4 + 48));
  *uint64_t v10 = 0x79636E65677275LL;
  v10[1] = 0xE700000000000000LL;
  *uint64_t v11 = v1;
  v11[1] = v2;
  uint64_t v12 = enum case for EventValue.string(_:);
  uint64_t v13 = type metadata accessor for EventValue(0LL);
  __int128 v14 = *(void (**)(void))(*(void *)(v13 - 8) + 104LL);
  ((void (*)(void *, uint64_t, uint64_t))v14)(v11, v12, v13);
  uint64_t v15 = (void *)((char *)v10 + v6);
  uint64_t v16 = (void *)((char *)v10 + v6 + *(int *)(v4 + 48));
  *uint64_t v15 = 0x756F437365747962LL;
  v15[1] = 0xEA0000000000746ELL;
  *uint64_t v16 = v52;
  v14();
  uint64_t v17 = (void *)sub_10000992C((uint64_t)v10 + 2 * v6);
  *uint64_t v18 = 0xD000000000000010LL;
  v18[1] = v19;
  sub_1000095C8(v17, v53);
  uint64_t v20 = (void *)((char *)v10 + 3 * v6);
  v21 = (void *)((char *)v20 + *(int *)(v4 + 48));
  *uint64_t v20 = 0xD000000000000013LL;
  v20[1] = 0x800000010000D440LL;
  sub_1000095C8(v21, v54);
  uint64_t v22 = (void *)((char *)v10 + 4 * v6);
  uint64_t v23 = (void *)((char *)v22 + *(int *)(v4 + 48));
  *uint64_t v22 = 0x756F4373656C6966LL;
  v22[1] = 0xEA0000000000746ELL;
  sub_1000095C8(v23, v55);
  v24 = (void *)sub_10000992C((uint64_t)v10 + 5 * v6);
  void *v25 = 0xD000000000000010LL;
  v25[1] = v26;
  sub_1000095C8(v24, v56);
  v27 = (void *)sub_10000992C((uint64_t)v10 + 6 * v6);
  void *v28 = 0xD000000000000013LL;
  v28[1] = v29;
  sub_1000095C8(v27, v58);
  swift_bridgeObjectRetain();
  uint64_t v30 = Dictionary.init(dictionaryLiteral:)(v9, &type metadata for String, v13, &protocol witness table for String);
  v0[17] = v30;
  sub_10000978C();
  uint64_t v31 = sub_1000099F8(v30);
  v32 = (os_log_s *)Logger.logObject.getter(v31);
  os_log_type_t v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v57 = v0[14];
    uint64_t v59 = v0[13];
    uint64_t v60 = v0[16];
    v34 = (uint8_t *)sub_10000956C(12LL);
    uint64_t v35 = sub_10000956C(32LL);
    uint64_t v61 = v35;
    *(_DWORD *)v34 = 136315138;
    uint64_t v36 = swift_bridgeObjectRetain();
    uint64_t v37 = Dictionary.description.getter(v36, &type metadata for String, v13, &protocol witness table for String);
    unint64_t v39 = v38;
    sub_100009870();
    v0[3] = sub_100006FDC(v37, v39, &v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 3, v0 + 4, v34 + 4);
    sub_100009A70();
    sub_1000098A0(v30);
    sub_1000097C4((void *)&_mh_execute_header, v32, v33, "reporting asset cache metrics %s", v34);
    sub_100009740(v35);
    sub_100009528(v35);
    sub_100009528((uint64_t)v34);

    v40 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
    v40(v60, v59);
  }

  else
  {
    uint64_t v41 = v0[16];
    uint64_t v42 = v0[13];
    uint64_t v43 = v0[14];
    sub_1000098A0(v30);

    v40 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
    v40(v41, v42);
  }

  v0[18] = v40;
  type metadata accessor for Reporter(0LL);
  if (qword_100015098 != -1) {
    swift_once(&qword_100015098, sub_100002D1C);
  }
  uint64_t v44 = v0[12];
  if (byte_100015090) {
    uint64_t v45 = 0x51424A3241394B34LL;
  }
  else {
    uint64_t v45 = 0LL;
  }
  uint64_t v46 = qword_1000150A0;
  uint64_t v47 = type metadata accessor for TransportConfiguration(0LL);
  sub_100009A18(v44, v48, v49, v47);
  v50 = (void *)swift_task_alloc(async function pointer to static Reporter.report(teamID:eventType:event:transportConfiguration:)[1]);
  v0[19] = v50;
  void *v50 = v0;
  v50[1] = sub_1000037C4;
  return static Reporter.report(teamID:eventType:event:transportConfiguration:)( v45,  v46,  0xD000000000000010LL,  0x800000010000D4A0LL,  v30,  v0[12]);
}

uint64_t sub_1000037C4()
{
  uint64_t v2 = *(void *)(*v1 + 152);
  uint64_t v3 = *(void *)(*v1 + 96);
  uint64_t v4 = *v1;
  *(void *)(v4 + 160) = v0;
  swift_task_dealloc(v2);
  sub_100009330(v3, &qword_100014BC8);
  sub_100009718();
  if (v0) {
    return swift_task_switch(sub_100003870, 0LL, 0LL);
  }
  uint64_t v6 = *(void *)(v4 + 120);
  uint64_t v7 = *(void *)(v4 + 96);
  swift_task_dealloc(*(void *)(v4 + 128));
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  return sub_100009878(*(uint64_t (**)(void))(v4 + 8));
}

uint64_t sub_100003870(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 160);
  CKLog.getter(a1);
  swift_errorRetain(v3);
  uint64_t v4 = swift_errorRetain(v3);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (sub_1000098A8(v6))
  {
    uint64_t v7 = *(void *)(v1 + 160);
    uint64_t v8 = (uint8_t *)sub_10000956C(12LL);
    uint64_t v9 = (void *)sub_10000956C(8LL);
    *(_DWORD *)uint64_t v8 = 138412290;
    swift_errorRetain(v7);
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError(v7);
    *(void *)(v1 + 16) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v8 + 4);
    *uint64_t v9 = v10;
    sub_1000097B4();
    sub_1000097B4();
    sub_1000097C4((void *)&_mh_execute_header, v5, v2, "failed to report asset cache metrics due to error %@", v8);
    sub_100002EA0(&qword_100014BE0);
    sub_100009740((uint64_t)v9);
    sub_100009528((uint64_t)v9);
    sub_100009528((uint64_t)v8);

    sub_1000097B4();
  }

  else
  {
    sub_1000097B4();
    sub_1000097B4();
    sub_1000097B4();
  }

  (*(void (**)(void, void))(v1 + 144))(*(void *)(v1 + 120), *(void *)(v1 + 104));
  uint64_t v11 = *(void *)(v1 + 120);
  uint64_t v12 = *(void *)(v1 + 96);
  swift_task_dealloc(*(void *)(v1 + 128));
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  return sub_100009878(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_1000039E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_100006E3C(a1, 1LL, v6) == 1)
  {
    sub_100009330(a1, &qword_100014BA0);
    uint64_t v7 = 7168LL;
  }

  else
  {
    unsigned __int8 v8 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
    uint64_t v7 = v8 | 0x1C00LL;
  }

  uint64_t v9 = *(void *)(a3 + 16);
  if (v9)
  {
    uint64_t v10 = *(void *)(a3 + 24);
    uint64_t ObjectType = swift_getObjectType(*(void *)(a3 + 16));
    swift_unknownObjectRetain(v9);
    uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
    uint64_t v14 = v13;
    swift_unknownObjectRelease(v9);
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v14 = 0LL;
  }

  uint64_t v15 = swift_allocObject(&unk_100010C08, 32LL, 7LL);
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  if (v14 | v12)
  {
    v18[0] = 0LL;
    v18[1] = 0LL;
    uint64_t v16 = v18;
    v18[2] = v12;
    v18[3] = v14;
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  return swift_task_create(v7, v16, (char *)&type metadata for () + 8, &unk_100014BC0, v15);
}

void sub_100003B28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000096CC();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = (v10 + 16) & ~v10;
  unint64_t v12 = (v8 + v11 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v13 = swift_allocObject(&unk_100010C30, v12 + 16, v10 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v13 + v11, v9, v6);
  uint64_t v14 = (void *)(v13 + v12);
  *uint64_t v14 = a2;
  v14[1] = a3;
  uint64_t v15 = sub_1000096E4((uint64_t)&unk_100010C58, 32LL);
  *(void *)(v15 + 16) = sub_10000903C;
  *(void *)(v15 + 24) = v13;
  aBlock[4] = sub_1000094F0;
  uint64_t v19 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000030F8;
  aBlock[3] = &unk_100010C70;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = v19;
  swift_retain(v15);
  swift_release(v17);
  CKMuckingWithPersonas(v16);
  _Block_release(v16);
  LOBYTE(v16) = swift_isEscapingClosureAtFileLocation(v15, "", 81LL, 95LL, 31LL, 1LL);
  sub_100009A24();
  swift_release(v15);
  else {
    sub_100009848();
  }
}

void sub_100003CB0(void *a1, void *a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v81 = a5;
  v82 = a4;
  uint64_t v86 = a3;
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v89 = *(void *)(v8 - 8);
  uint64_t v90 = v8;
  sub_100009584();
  ((void (*)(void))__chkstk_darwin)();
  sub_1000095F4();
  uint64_t v91 = v9;
  ((void (*)(void))__chkstk_darwin)();
  v80 = (char *)&v79 - v10;
  uint64_t v11 = sub_100002EA0(&qword_100014C08);
  sub_100009574();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v87 = (uint64_t)&v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for URLResourceValues(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  ((void (*)(void))__chkstk_darwin)();
  sub_10000999C();
  sub_100002EA0(&qword_100014C10);
  sub_100009574();
  ((void (*)(void))__chkstk_darwin)();
  sub_1000095F4();
  sub_1000098B8();
  uint64_t v15 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v17 = (char *)&v79 - v16;
  __chkstk_darwin(v15);
  v88 = (char *)&v79 - v18;
  uint64_t v19 = type metadata accessor for URL(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v92 = v19;
  uint64_t v93 = v20;
  sub_100009584();
  __chkstk_darwin(v21);
  sub_1000095F4();
  sub_1000098B8();
  __chkstk_darwin(v22);
  v94 = (char *)&v79 - v23;
  sub_10000927C([a1 appContainerTuple]);
  if (v24)
  {
    uint64_t v25 = v24;
    NSString v26 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v25);
  }

  else
  {
    NSString v26 = 0LL;
  }

  int v27 = CKAdoptPersonaID(v26);

  if (!v27) {
    return;
  }
  sub_10000937C(0LL, &qword_100014C18, &OBJC_CLASS___CKDContainer_ptr);
  v28 = (void *)objc_opt_self(&OBJC_CLASS___CKDContainer);
  id v84 = sub_100004504( a1,  a2,  [v28 sharedInternalUseContainers]);
  id v29 = [v84 directoryContext];
  id v30 = [v29 fileDownloadDirectory];

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v30);
  uint64_t v31 = sub_100002EA0(&qword_100014C20);
  uint64_t inited = swift_initStackObject(v31, v100);
  *(_OWORD *)(inited + 16) = xmmword_10000CFF0;
  *(void *)(inited + 32) = NSURLVolumeURLKey;
  os_log_type_t v33 = NSURLVolumeURLKey;
  uint64_t v34 = sub_10000456C(inited);
  uint64_t v35 = v95;
  URL.resourceValues(forKeys:)();
  if (!v35)
  {
    uint64_t v50 = swift_bridgeObjectRelease(v34);
    uint64_t v34 = (uint64_t)v88;
    URLResourceValues.volume.getter(v50);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v5, v13);
    uint64_t v52 = v92;
    uint64_t v51 = v93;
    (*(void (**)(char *, uint64_t, uint64_t))(v93 + 16))(v17, v86, v92);
    sub_100006E8C((uint64_t)v17, 0LL, 1LL, v52);
    uint64_t v53 = v87;
    uint64_t v54 = v87 + *(int *)(v11 + 48);
    sub_1000092E8(v34, v87);
    sub_1000092E8((uint64_t)v17, v54);
    sub_1000098E0(v53);
    if (v57)
    {
      sub_100009330((uint64_t)v17, &qword_100014C10);
      sub_1000098E0(v54);
      id v55 = v84;
      if (v57)
      {
        sub_100009330(v53, &qword_100014C10);
LABEL_22:
        id v99 = 0LL;
        unsigned int v63 = [v55 setupAssetTransfers:&v99];
        id v64 = v99;
        if (!v63)
        {
          id v71 = v99;
          uint64_t v37 = _convertNSErrorToError(_:)(v64);

          uint64_t v72 = swift_willThrow();
          sub_100009A2C(v72, &qword_100014C10);
          goto LABEL_7;
        }

        sub_100009A2C((uint64_t)v99, &qword_100014C10);
        id v65 = [v55 MMCS];
        if (v65)
        {
          v66 = v65;
          id v67 = [v65 assetCache];
          if (!v67)
          {
            __break(1u);
            return;
          }

          v68 = v67;
          v82();
          sub_100009814();
        }

        else
        {
          v73 = v80;
          uint64_t v74 = ((uint64_t (*)(void))CKLog.getter)();
          v75 = (os_log_s *)Logger.logObject.getter(v74);
          os_log_type_t v76 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v75, v76))
          {
            v77 = (uint8_t *)sub_10000956C(2LL);
            *(_WORD *)v77 = 0;
            _os_log_impl((void *)&_mh_execute_header, v75, v76, "cache_purge: container.MMCS nil", v77, 2u);
            uint64_t v78 = (uint64_t)v77;
            id v55 = v84;
            sub_100009528(v78);
          }

          (*(void (**)(char *, uint64_t))(v89 + 8))(v73, v90);
        }

        v70 = *(void (**)(char *, uint64_t))(v93 + 8);
LABEL_32:
        v70(v94, v52);
        return;
      }
    }

    else
    {
      uint64_t v56 = v85;
      sub_1000092E8(v53, v85);
      sub_1000098E0(v54);
      if (!v57)
      {
        uint64_t v58 = v83;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 32))(v83, v54, v52);
        sub_100008DC8( &qword_100014C00,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
        char v60 = dispatch thunk of static Equatable.== infix(_:_:)(v56, v58, v52, v59);
        uint64_t v61 = *(void (**)(uint64_t, uint64_t))(v93 + 8);
        uint64_t v62 = v58;
        uint64_t v34 = (uint64_t)v88;
        v61(v62, v52);
        sub_100009330((uint64_t)v17, &qword_100014C10);
        v61(v56, v52);
        uint64_t v51 = v93;
        sub_100009330(v53, &qword_100014C10);
        id v55 = v84;
        if ((v60 & 1) != 0) {
          goto LABEL_22;
        }
LABEL_26:

        sub_100009A2C(v69, &qword_100014C10);
        v70 = *(void (**)(char *, uint64_t))(v51 + 8);
        goto LABEL_32;
      }

      sub_100009330((uint64_t)v17, &qword_100014C10);
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v56, v52);
      id v55 = v84;
    }

    sub_100009330(v53, &qword_100014C08);
    goto LABEL_26;
  }

  uint64_t v36 = swift_bridgeObjectRelease(v34);
  uint64_t v37 = v35;
LABEL_7:
  uint64_t v38 = v91;
  CKLog.getter(v36);
  swift_errorRetain(v37);
  uint64_t v39 = swift_errorRetain(v37);
  v40 = (os_log_s *)Logger.logObject.getter(v39);
  os_log_type_t v41 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v95 = 0LL;
    uint64_t v42 = (uint8_t *)sub_10000956C(12LL);
    uint64_t v43 = (void *)sub_10000956C(32LL);
    id v99 = v43;
    *(_DWORD *)uint64_t v42 = 136315138;
    v88 = (char *)(v42 + 4);
    uint64_t ErrorValue = swift_getErrorValue(v37, v98, v97);
    uint64_t v45 = v97[1];
    __chkstk_darwin(ErrorValue);
    sub_10000996C();
    (*(void (**)(uint64_t))(v46 + 16))(v34);
    uint64_t v47 = String.init<A>(describing:)(v34, v45);
    unint64_t v49 = v48;
    uint64_t v96 = sub_100006FDC(v47, v48, (uint64_t *)&v99);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, v97, v88);
    swift_bridgeObjectRelease(v49);
    sub_1000097B4();
    sub_1000097B4();
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "cache_purge: MMCS setup failed: %s", v42, 0xCu);
    swift_arrayDestroy(v43, 1LL);
    sub_100009528((uint64_t)v43);
    sub_100009528((uint64_t)v42);

    sub_100009814();
    sub_1000097B4();
    (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v91, v90);
  }

  else
  {

    sub_100009814();
    sub_1000097B4();
    sub_1000097B4();
    sub_1000097B4();
    (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v38, v90);
  }

  (*(void (**)(char *, uint64_t))(v93 + 8))(v94, v92);
}

id sub_100004504(void *a1, void *a2, void *a3)
{
  id v7 =  [(id)swift_getObjCClassFromMetadata(v3) containerWithAppContainerAccountTuple:a1 deviceContext:a2 sharedContainerTable:a3];

  return v7;
}

uint64_t sub_10000456C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  type metadata accessor for URLResourceKey(0LL);
  uint64_t v4 = v3;
  sub_100008DC8( &qword_100014C28,  (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey,  (uint64_t)&unk_10000D1C4);
  uint64_t v6 = Set.init(minimumCapacity:)(v2, v4, v5);
  uint64_t v13 = v6;
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    for (uint64_t i = 0LL; i != v7; ++i)
    {
      uint64_t v9 = *(void **)(a1 + 8 * i + 32);
      sub_100007C38(&v12, v9);
    }

    swift_bridgeObjectRelease(a1);
    return v13;
  }

  else
  {
    uint64_t v10 = v6;
    swift_bridgeObjectRelease(a1);
  }

  return v10;
}

void *variable initialization expression of CKDMain_Swift.cachesByVolume()
{
  return &_swiftEmptyDictionarySingleton;
}

void sub_100004640()
{
  int v6 = v5;
  uint64_t v70 = v7;
  uint64_t ObjectType = swift_getObjectType(v1);
  uint64_t v67 = sub_1000096CC();
  uint64_t v66 = *(void *)(v67 - 8);
  sub_100009584();
  __chkstk_darwin(v8);
  v68 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_1000096D4();
  uint64_t v71 = *(void *)(v10 - 8);
  uint64_t v72 = v10;
  sub_100009584();
  __chkstk_darwin(v11);
  sub_1000095F4();
  uint64_t v69 = v12;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v62 - v14;
  sub_100002EA0(&qword_100014B98);
  sub_100009574();
  __chkstk_darwin(v16);
  sub_1000095F4();
  sub_1000098B8();
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v62 - v18;
  uint64_t v20 = type metadata accessor for CKDMain_Swift.VolumeSizeCache(0LL);
  sub_100009574();
  __chkstk_darwin(v21);
  uint64_t v22 = sub_100009654();
  type metadata accessor for DispatchPredicate(v22);
  sub_1000099E4();
  __chkstk_darwin(v23);
  sub_100009984();
  uint64_t v24 = *(void **)(v1 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_serialQueue);
  *uint64_t v2 = v24;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v2, enum case for DispatchPredicate.onQueue(_:), v0);
  id v25 = v24;
  LOBYTE(v24) = _dispatchPreconditionTest(_:)(v2);
  sub_1000099CC((uint64_t)v2, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  if ((v24 & 1) != 0)
  {
    if (*(_BYTE *)(v1 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_systemAvailableForCacheDelete) != 1
      || (v6 & 0xFFFFFFFE) != 2)
    {
LABEL_29:
      sub_100009554();
      return;
    }

    uint64_t v82 = 0LL;
    uint64_t v83 = 0LL;
    uint64_t v80 = 0LL;
    uint64_t v81 = 0LL;
    uint64_t v78 = 0LL;
    uint64_t v79 = 0LL;
    int v27 = (uint64_t *)(v1 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_cachesByVolume);
    sub_100009608(v1 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_cachesByVolume, (uint64_t)&v77);
    uint64_t v28 = *v27;
    swift_bridgeObjectRetain(*v27);
    sub_100004BE0(v70, v28, (uint64_t)v19);
    sub_10000985C();
    if (sub_100006E3C((uint64_t)v19, 1LL, v20) == 1)
    {
      sub_100009330((uint64_t)v19, &qword_100014B98);
    }

    else
    {
      uint64_t v30 = sub_1000089A4((uint64_t)v19, (uint64_t)v3);
      if (fabs(Date.timeIntervalSinceNow.getter(v30)) < 60.0)
      {
        uint64_t v31 = *v3;
        uint64_t v32 = sub_100008F54((uint64_t)v3);
        uint64_t v33 = 0LL;
        uint64_t v34 = 0LL;
        uint64_t v35 = 0LL;
        uint64_t v81 = v31;
LABEL_15:
        BOOL v53 = v35 <= 0 && v31 <= 0 && v34 <= 0 && v33 < 1;
        uint64_t v54 = v69;
        if (!v53)
        {
          sub_100002CDC(v6);
          sub_1000031B4();
          uint64_t v32 = sub_100009870();
        }

        uint64_t v55 = CKLog.getter(v32);
        uint64_t v56 = (os_log_s *)Logger.logObject.getter(v55);
        os_log_type_t v57 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v56, v57))
        {
          uint64_t v58 = sub_10000956C(22LL);
          uint64_t v59 = sub_10000956C(32LL);
          v76[0] = v59;
          *(_DWORD *)uint64_t v58 = 134218242;
          sub_100009608((uint64_t)&v81, (uint64_t)&v74);
          uint64_t v73 = v81;
          sub_1000097AC((uint64_t)&v73, (uint64_t)&v74);
          *(_WORD *)(v58 + 12) = 2080;
          uint64_t v60 = sub_100002CDC(v6);
          uint64_t v73 = sub_100006FDC(v60, v61, v76);
          sub_1000097AC((uint64_t)&v73, (uint64_t)&v74);
          sub_100009A70();
          _os_log_impl( (void *)&_mh_execute_header,  v56,  v57,  "Found %lld purgeable bytes, urgency: %s",  (uint8_t *)v58,  0x16u);
          sub_100009740(v59);
          sub_100009528(v59);
          sub_100009528(v58);
        }

        (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v54, v72);
        sub_100009608((uint64_t)&v81, (uint64_t)v76);
        goto LABEL_29;
      }

      uint64_t v29 = sub_100008F54((uint64_t)v3);
    }

    uint64_t v36 = CKLog.getter(v29);
    uint64_t v37 = (os_log_s *)Logger.logObject.getter(v36);
    os_log_type_t v38 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)sub_10000956C(12LL);
      uint64_t v40 = sub_10000956C(32LL);
      unsigned int v63 = v27;
      uint64_t v41 = v40;
      v76[0] = v40;
      *(_DWORD *)uint64_t v39 = 136315138;
      uint64_t v42 = sub_100002CDC(v6);
      uint64_t v74 = sub_100006FDC(v42, v43, v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v39 + 4);
      sub_100009718();
      sub_1000097C4((void *)&_mh_execute_header, v37, v38, "Querying purgeable space, urgency: %s", v39);
      sub_100009740(v41);
      uint64_t v44 = v41;
      int v27 = v63;
      sub_100009528(v44);
      sub_100009528((uint64_t)v39);
    }

    uint64_t v45 = (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v15, v72);
    __chkstk_darwin(v45);
    sub_100009620();
    uint64_t v46 = v70;
    sub_100003B28(v70, (uint64_t)sub_100008E04, v47);
    uint64_t v48 = (uint64_t)v68;
    uint64_t v49 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v66 + 16))(v68, v46, v67);
    uint64_t v31 = v81;
    uint64_t v50 = v65;
    Date.init()(v49);
    uint64_t *v50 = v31;
    sub_100006E8C((uint64_t)v50, 0LL, 1LL, v20);
    sub_100009A94((uint64_t)v27, (uint64_t)v76);
    sub_100004CAC((uint64_t)v50, v48);
    uint64_t v32 = swift_endAccess(v76);
    uint64_t v35 = v82;
    uint64_t v33 = v78;
    uint64_t v34 = v79;
    goto LABEL_15;
  }

  __break(1u);
}

uint64_t sub_100004BE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100007948(a1), (v6 & 1) != 0))
  {
    unint64_t v7 = v5;
    uint64_t v8 = *(void *)(a2 + 56);
    uint64_t v9 = type metadata accessor for CKDMain_Swift.VolumeSizeCache(0LL);
    sub_100008F90(v8 + *(void *)(*(void *)(v9 - 8) + 72LL) * v7, a3);
    uint64_t v10 = a3;
    uint64_t v11 = 0LL;
    uint64_t v12 = v9;
  }

  else
  {
    uint64_t v12 = type metadata accessor for CKDMain_Swift.VolumeSizeCache(0LL);
    uint64_t v10 = a3;
    uint64_t v11 = 1LL;
  }

  return sub_100006E8C(v10, v11, 1LL, v12);
}

uint64_t sub_100004C6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (unint64_t v4 = sub_1000079B4(a1, a2), (v5 & 1) != 0)) {
    return swift_unknownObjectRetain(*(void *)(*(void *)(a3 + 56) + 8 * v4));
  }
  else {
    return 0LL;
  }
}

void sub_100004CAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002EA0(&qword_100014B98);
  __chkstk_darwin(v4);
  char v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for CKDMain_Swift.VolumeSizeCache(0LL);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (sub_100006E3C(a1, 1LL, v10) == 1)
  {
    sub_100009330(a1, &qword_100014B98);
    sub_100008834(a2, (uint64_t)v6);
    uint64_t v11 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8LL))(a2, v11);
    sub_100009330((uint64_t)v6, &qword_100014B98);
  }

  else
  {
    sub_1000089A4(a1, (uint64_t)v9);
    sub_1000089E8((uint64_t)v9, a2);
    uint64_t v12 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8LL))(a2, v12);
  }
}

void sub_100004DE4()
{
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v76 = v5;
  uint64_t v69 = v6;
  int v8 = v7;
  uint64_t v74 = (char *)v9;
  uint64_t ObjectType = swift_getObjectType(v0);
  sub_100002EA0(&qword_100014B98);
  sub_100009574();
  __chkstk_darwin(v10);
  sub_100009944();
  uint64_t v13 = (uint64_t *)(v12 - v11);
  uint64_t v73 = sub_1000096CC();
  uint64_t v72 = *(void *)(v73 - 8);
  sub_100009584();
  __chkstk_darwin(v14);
  uint64_t v75 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v77 = sub_1000096D4();
  uint64_t v71 = *(void *)(v77 - 8);
  sub_100009584();
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v67 - v20;
  uint64_t v22 = type metadata accessor for DispatchPredicate(0LL);
  sub_10000991C();
  __chkstk_darwin(v23);
  id v25 = (uint64_t *)((char *)&v67 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  NSString v26 = *(void **)(v2 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_serialQueue);
  void *v25 = v26;
  (*(void (**)(void *, void, uint64_t))(v1 + 104))(v25, enum case for DispatchPredicate.onQueue(_:), v22);
  id v27 = v26;
  LOBYTE(v26) = _dispatchPreconditionTest(_:)(v25);
  sub_1000099CC((uint64_t)v25, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  if ((v26 & 1) != 0)
  {
    if (*(_BYTE *)(v2 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_systemAvailableForCacheDelete) == 1
      && (v8 & 0xFFFFFFFE) == 2)
    {
      sub_10000978C();
      uint64_t v29 = sub_1000099F8(v4);
      unint64_t v30 = v4;
      uint64_t v31 = (os_log_s *)Logger.logObject.getter(v29);
      os_log_type_t v32 = static os_log_type_t.debug.getter();
      int v33 = v32;
      BOOL v34 = os_log_type_enabled(v31, v32);
      int v68 = v8;
      if (v34)
      {
        uint64_t v35 = sub_10000956C(32LL);
        uint64_t v67 = sub_10000956C(64LL);
        v83[0] = v67;
        *(_DWORD *)uint64_t v35 = 134218498;
        uint64_t v81 = v69;
        LODWORD(v69) = v33;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v35 + 4);
        *(_WORD *)(v35 + 12) = 2080;
        uint64_t v36 = sub_100002CDC(v8);
        uint64_t v37 = v19;
        unint64_t v39 = v38;
        uint64_t v40 = sub_100009820(v36, v38);
        uint64_t v41 = sub_100009A54(v40);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v41, v42, v43);
        unint64_t v44 = v39;
        uint64_t v19 = v37;
        swift_bridgeObjectRelease(v44);
        *(_WORD *)(v35 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v45 = sub_100006FDC(v76, v30, v83);
        uint64_t v46 = sub_100009A54(v45);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v46, v47, v48);
        swift_bridgeObjectRelease_n(v30, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v31,  (os_log_type_t)v69,  "Purging %lld bytes, urgency: %s, reason: %s",  (uint8_t *)v35,  0x20u);
        uint64_t v49 = v67;
        swift_arrayDestroy(v67, 2LL);
        sub_100009528(v49);
        sub_100009528(v35);
      }

      else
      {

        sub_1000098A0(v30);
      }

      uint64_t v50 = *(uint64_t (**)(char *, uint64_t))(v71 + 8);
      uint64_t v51 = v50(v21, v77);
      v85[0] = 0LL;
      v85[1] = 0LL;
      uint64_t v84 = 0LL;
      memset(&v83[3], 0, 24);
      __chkstk_darwin(v51);
      sub_100009620();
      uint64_t v52 = (uint64_t)v74;
      sub_100003B28((uint64_t)v74, (uint64_t)sub_100006F48, v53);
      uint64_t v54 = (uint64_t)v75;
      (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v75, v52, v73);
      uint64_t v55 = v84;
      uint64_t v56 = type metadata accessor for CKDMain_Swift.VolumeSizeCache(0LL);
      Date.init()(v56);
      uint64_t *v13 = v55;
      sub_100006E8C((uint64_t)v13, 0LL, 1LL, v56);
      sub_100009A94(v2 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_cachesByVolume, (uint64_t)v83);
      sub_100004CAC((uint64_t)v13, v54);
      uint64_t v57 = swift_endAccess(v83);
      if (v85[0] > 0LL || v55 >= 1)
      {
        sub_100009A34();
        sub_1000031B4();
        uint64_t v57 = sub_100009870();
      }

      CKLog.getter(v57);
      uint64_t v59 = sub_1000099F8(v30);
      uint64_t v60 = (os_log_s *)Logger.logObject.getter(v59);
      os_log_type_t v61 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v60, v61))
      {
        uint64_t v62 = sub_10000956C(42LL);
        uint64_t v63 = sub_10000956C(64LL);
        uint64_t v74 = v19;
        uint64_t v75 = (char *)v50;
        uint64_t v64 = v63;
        v83[0] = v63;
        *(_DWORD *)uint64_t v62 = 134218754;
        sub_100009608((uint64_t)v85, (uint64_t)&v81);
        uint64_t v79 = v85[0];
        sub_1000097AC((uint64_t)&v79, (uint64_t)&v80);
        *(_WORD *)(v62 + 12) = 2048;
        sub_100009608((uint64_t)&v84, (uint64_t)&v79);
        uint64_t v78 = v84;
        sub_100009730();
        *(_WORD *)(v62 + 22) = 2080;
        uint64_t v65 = sub_100009A34();
        uint64_t v78 = sub_100009820(v65, v66);
        sub_100009730();
        sub_100009A70();
        *(_WORD *)(v62 + 32) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v78 = sub_100006FDC(v76, v30, v83);
        sub_100009730();
        swift_bridgeObjectRelease_n(v30, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v60,  v61,  "Purged %lld bytes, still have %lld purgeable bytes, urgency: %s, reason: %s",  (uint8_t *)v62,  0x2Au);
        swift_arrayDestroy(v64, 2LL);
        sub_100009528(v64);
        sub_100009528(v62);

        ((void (*)(char *, uint64_t))v75)(v74, v77);
      }

      else
      {

        sub_1000098A0(v30);
        v50(v19, v77);
      }

      sub_100009608((uint64_t)&v84, (uint64_t)v83);
    }

    sub_100009554();
  }

  else
  {
    __break(1u);
  }

Swift::Void __swiftcall CKDMain_Swift.registerWithCacheDelete()()
{
  id v1 = [(id)objc_opt_self(CKDDaemonProcess) currentProcess];
  id v2 = [v1 processType];

  if (!v2)
  {
    uint64_t v3 = &OBJC_IVAR____TtC6cloudd13CKDMain_Swift_CACHE_DELETE_LISTENER;
LABEL_5:
    uint64_t v4 = *(void *)&v0[*v3 + 8];
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1000096E4((uint64_t)&unk_100010AA8, 24LL);
    *(void *)(v5 + 16) = v0;
    uint64_t v6 = sub_1000096E4((uint64_t)&unk_100010AD0, 24LL);
    *(void *)(v6 + 16) = v0;
    uint64_t v7 = sub_1000096E4((uint64_t)&unk_100010AF8, 24LL);
    *(void *)(v7 + 16) = v0;
    int v8 = v0;
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
    uint64_t v10 = sub_10000983C( (uint64_t)&unk_100010B10,  v20,  v23,  v26,  (char)_NSConcreteStackBlock,  1107296256LL,  v31,  (uint64_t)v32);
    swift_retain(v5);
    swift_release(v5);
    uint64_t v11 = sub_10000983C( (uint64_t)&unk_100010B38,  v21,  v24,  v27,  (char)_NSConcreteStackBlock,  1107296256LL,  v31,  (uint64_t)v32);
    swift_retain(v6);
    swift_release(v6);
    int v33 = sub_100005D70;
    uint64_t v34 = 0LL;
    aBlock = _NSConcreteStackBlock;
    uint64_t v30 = 1107296256LL;
    uint64_t v31 = (uint64_t)sub_1000061A0;
    os_log_type_t v32 = &unk_100010B60;
    uint64_t v12 = _Block_copy(&aBlock);
    swift_release(v34);
    int v33 = sub_100005E24;
    uint64_t v34 = v7;
    uint64_t v13 = sub_10000983C( (uint64_t)&unk_100010B88,  v22,  v25,  v28,  (char)_NSConcreteStackBlock,  1107296256LL,  v31,  (uint64_t)v32);
    uint64_t v14 = v34;
    swift_retain(v7);
    swift_release(v14);
    CacheDeleteRegisterInfoCallbacks(v9, v10, v11, v12, v13);
    _Block_release(v13);
    _Block_release(v12);
    _Block_release(v11);
    _Block_release(v10);
    sub_100009A24();
    swift_release(v6);
    swift_release(v7);

    return;
  }

  if (v2 == (id)1)
  {
    uint64_t v3 = &OBJC_IVAR____TtC6cloudd13CKDMain_Swift_CACHE_DELETE_SYSTEM_LISTENER;
    goto LABEL_5;
  }

  aBlock = 0LL;
  uint64_t v30 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(26LL);
  v15._object = (void *)0x800000010000D300LL;
  v15._countAndFlagsBits = 0xD000000000000018LL;
  String.append(_:)(v15);
  id v17 = sub_1000097BC(v16, "currentProcess");
  id v18 = [v17 processType];

  id v35 = v18;
  type metadata accessor for CKDDaemonProcessType(0LL);
  _print_unlocked<A, B>(_:_:)( &v35,  &aBlock,  v19,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  sub_100009A00((uint64_t)"Fatal error", 11LL, 2LL, (uint64_t)aBlock, v30, (uint64_t)"cloudd/cloudd_main.swift");
  __break(1u);
}

void type metadata accessor for CKDDaemonProcessType(uint64_t a1)
{
}

uint64_t sub_100005704(int a1, uint64_t a2)
{
  return sub_100005E30(a1, a2, (uint64_t)sub_10000944C);
}

void sub_100005710()
{
  id v2 = v1;
  uint64_t v22 = v3;
  uint64_t v21 = sub_1000096D4();
  sub_10000991C();
  __chkstk_darwin(v4);
  uint64_t v5 = (void *)sub_1000095D8();
  sub_100009890();
  __chkstk_darwin(v6);
  sub_100009670();
  sub_100009880((uint64_t)&type metadata for String, (uint64_t)&type metadata for Swift.AnyObject);
  if (v23)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100009794((uint64_t)"CACHE_DELETE_VOLUME");
    sub_10000993C();
    if (v7 && (sub_100009774((uint64_t)&type metadata for String, (uint64_t)&type metadata for Swift.AnyObject) & 1) != 0)
    {
      sub_100009800();
      sub_10000985C();
      sub_100004640();
      objc_msgSend(objc_allocWithZone(NSNumber), "initWithLongLong:", v8, v21);
      char v9 = sub_100009A48();
      sub_1000096EC(v9, (uint64_t)"CACHE_DELETE_AMOUNT");
      sub_100009A78();
      v10.super.isa = sub_100009A80().super.isa;
      sub_100009870();
      sub_100009864(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
      goto LABEL_10;
    }

    sub_10000993C();
  }

  sub_10000978C();
  id v11 = v2;
  sub_100009A40();
  os_log_type_t v12 = sub_100009A8C();
  if (sub_100009764(v12))
  {
    uint64_t v13 = sub_10000956C(12LL);
    uint64_t v24 = sub_10000956C(32LL);
    sub_1000097CC(4.8149e-34);
    uint64_t v14 = sub_1000098FC();
    uint64_t v16 = sub_100009820(v14, v15);
    sub_100009748(v16);

    sub_100009718();
    sub_1000096B8( (void *)&_mh_execute_header,  v17,  v18,  "Info dictionary passed to purgeable block has unexpected content: %s");
    sub_100009740(v24);
    sub_100009528(v24);
    sub_100009528(v13);
  }

  else
  {
  }

  sub_10000990C();
  uint64_t v19 = sub_100002EA0(&qword_100014C48);
  uint64_t v20 = sub_1000099DC(v19);
  *(_OWORD *)(v20 + 16) = xmmword_10000CFF0;
  sub_1000098C8(v20, (uint64_t)"CACHE_DELETE_AMOUNT");
  *(void *)(v20 + 48) = sub_1000099D4(objc_allocWithZone(&OBJC_CLASS___NSNumber), "initWithInteger:");
  sub_10000968C();
  v10.super.isa = sub_100009708().super.isa;
  sub_100009718();
LABEL_10:
  v22->super.isa = v10.super.isa;
  sub_100009554();
}

uint64_t sub_100005990(int a1, uint64_t a2)
{
  return sub_100005E30(a1, a2, (uint64_t)sub_10000942C);
}

void sub_10000599C()
{
  id v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_1000096D4();
  uint64_t v36 = *(void *)(v5 - 8);
  uint64_t v37 = v5;
  sub_100009584();
  __chkstk_darwin(v6);
  uint64_t v7 = (void *)sub_1000095D8();
  uint64_t v8 = *(v7 - 1);
  __chkstk_darwin(v7);
  sub_100009670();
  static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)( v2,  v38,  &type metadata for String,  (char *)&type metadata for Swift.AnyObject + 8);
  char v9 = (void *)v38[0];
  if (v38[0])
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100009828((uint64_t)"CACHE_DELETE_AMOUNT");
    if (v10
      && (uint64_t v39 = v10,
          (swift_dynamicCast(v38, &v39, (char *)&type metadata for Swift.AnyObject + 8, &type metadata for String, 6LL) & 1) != 0))
    {
      id v35 = (void *)v38[1];
      uint64_t v34 = v38[0];
      uint64_t v11 = sub_100009828((uint64_t)"unknown process ID");
      swift_bridgeObjectRelease(v9);
      if (v11)
      {
        uint64_t v12 = objc_opt_self(&OBJC_CLASS___NSNumber);
        uint64_t v13 = (void *)swift_dynamicCastObjCClass(v11, v12);
        if (v13)
        {
          [v13 longLongValue];
          swift_unknownObjectRelease(v11);
          URL.init(fileURLWithPath:isDirectory:)(v34, v35, 1LL);
          sub_100009718();
          sub_100004DE4();
          id v15 = [objc_allocWithZone(NSNumber) initWithLongLong:v14];
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v9);
          v38[0] = v9;
          sub_100008BC0((uint64_t)v15, 0xD000000000000013LL, 0x800000010000D7E0LL, isUniquelyReferenced_nonNull_native);
          sub_100009A78();
          v17.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
          sub_10000985C();
          sub_100009864(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
          goto LABEL_15;
        }

        swift_unknownObjectRelease(v11);
      }

      uint64_t v18 = v35;
    }

    else
    {
      uint64_t v18 = v9;
    }

    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v9);
  }

  sub_10000978C();
  id v19 = v2;
  sub_100009A40();
  os_log_type_t v20 = sub_100009A8C();
  if (sub_100009764(v20))
  {
    uint64_t v21 = (_DWORD *)sub_10000956C(12LL);
    uint64_t v22 = sub_10000956C(32LL);
    v38[0] = v22;
    _DWORD *v21 = 136315138;
    uint64_t v39 = (uint64_t)v9;
    type metadata accessor for CFDictionary(0LL);
    uint64_t v24 = v23;
    id v25 = v9;
    uint64_t v26 = String.init<A>(describing:)(&v39, v24);
    unint64_t v28 = v27;
    uint64_t v39 = sub_100009820(v26, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v21 + 1);

    swift_bridgeObjectRelease(v28);
    sub_1000096B8( (void *)&_mh_execute_header,  v29,  v30,  "Info dictionary passed to purge block has unexpected content: %s");
    sub_100009740(v22);
    sub_100009528(v22);
    sub_100009528((uint64_t)v21);
  }

  else
  {
  }

  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v0, v37);
  uint64_t v31 = sub_100002EA0(&qword_100014C48);
  uint64_t v32 = sub_1000099DC(v31);
  *(_OWORD *)(v32 + 16) = xmmword_10000CFF0;
  *(void *)(v32 + 32) = 0xD000000000000013LL;
  *(void *)(v32 + 40) = 0x800000010000D7E0LL;
  *(void *)(v32 + 48) = sub_1000099D4(objc_allocWithZone(&OBJC_CLASS___NSNumber), "initWithInteger:");
  uint64_t v33 = sub_10000968C();
  v17.super.isa = sub_100009708().super.isa;
  swift_bridgeObjectRelease(v33);
LABEL_15:
  v4->super.isa = v17.super.isa;
  sub_100009554();
}

uint64_t sub_100005D70()
{
  uint64_t v3 = sub_10000978C();
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)sub_10000956C(2LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Purge cancel requested. Ignoring.", v6, 2u);
    sub_100009528((uint64_t)v6);
  }

  return sub_1000099CC(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
}

uint64_t sub_100005E24(int a1, uint64_t a2)
{
  return sub_100005E30(a1, a2, (uint64_t)sub_1000093B4);
}

uint64_t sub_100005E30(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v6 = *(void **)(v5 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_serialQueue);
  v10[2] = a2;
  v10[3] = v5;
  int v11 = a1;
  id v7 = v6;
  uint64_t v8 = sub_100002EA0(&qword_100014C40);
  OS_dispatch_queue.sync<A>(execute:)(&v12, a3, v10, v8);

  return v12;
}

void sub_100005EA8()
{
  uint64_t v2 = v1;
  uint64_t v22 = v3;
  uint64_t v21 = sub_1000096D4();
  sub_10000991C();
  __chkstk_darwin(v4);
  uint64_t v5 = (void *)sub_1000095D8();
  sub_100009890();
  __chkstk_darwin(v6);
  sub_100009670();
  sub_100009880((uint64_t)&type metadata for String, (uint64_t)&type metadata for Swift.AnyObject);
  if (v23)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100009794((uint64_t)"CACHE_DELETE_VOLUME");
    sub_10000993C();
    if (v7 && (sub_100009774((uint64_t)&type metadata for String, (uint64_t)&type metadata for Swift.AnyObject) & 1) != 0)
    {
      sub_100009800();
      sub_10000985C();
      sub_100004DE4();
      objc_msgSend(objc_allocWithZone(NSNumber), "initWithLongLong:", v8, v21);
      char v9 = sub_100009A48();
      sub_1000096EC(v9, (uint64_t)"CACHE_DELETE_AMOUNT");
      sub_100009A78();
      v10.super.isa = sub_100009A80().super.isa;
      sub_100009870();
      sub_100009864(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
      goto LABEL_10;
    }

    sub_10000993C();
  }

  sub_10000978C();
  id v11 = v2;
  sub_100009A40();
  os_log_type_t v12 = sub_100009A8C();
  if (sub_100009764(v12))
  {
    uint64_t v13 = sub_10000956C(12LL);
    uint64_t v24 = sub_10000956C(32LL);
    sub_1000097CC(4.8149e-34);
    uint64_t v14 = sub_1000098FC();
    uint64_t v16 = sub_100009820(v14, v15);
    sub_100009748(v16);

    sub_100009718();
    sub_1000096B8( (void *)&_mh_execute_header,  v17,  v18,  "Info dictionary passed to periodic block has unexpected content: %s");
    sub_100009740(v24);
    sub_100009528(v24);
    sub_100009528(v13);
  }

  else
  {
  }

  sub_10000990C();
  uint64_t v19 = sub_100002EA0(&qword_100014C48);
  uint64_t v20 = sub_1000099DC(v19);
  *(_OWORD *)(v20 + 16) = xmmword_10000CFF0;
  sub_1000098C8(v20, (uint64_t)"CACHE_DELETE_AMOUNT");
  *(void *)(v20 + 48) = sub_1000099D4(objc_allocWithZone(&OBJC_CLASS___NSNumber), "initWithInteger:");
  sub_10000968C();
  v10.super.isa = sub_100009708().super.isa;
  sub_100009718();
LABEL_10:
  v22->super.isa = v10.super.isa;
  sub_100009554();
}

uint64_t sub_100006140(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, id))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  id v7 = a3;
  uint64_t v8 = v6(a2, v7);
  swift_release(v5);

  return v8;
}

uint64_t sub_1000061A0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_1000061F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v8[0] = a1;
  v8[1] = a2;
  uint64_t v6 = a3;
  uint64_t v7 = a4;
  swift_bridgeObjectRetain(a4);
  uint64_t v6 = String.init<A>(_:)( &v6,  &type metadata for String,  &protocol witness table for String,  &protocol witness table for String);
  uint64_t v7 = v4;
  String.append<A>(contentsOf:)(v8, &type metadata for String, &protocol witness table for String);
  return v6;
}

Swift::Void __swiftcall CKDMain_Swift.startCloudAssetsService()()
{
  uint64_t v1 = sub_1000096D4();
  __chkstk_darwin(v1);
  uint64_t v2 = sub_100009654();
  type metadata accessor for XPCListener.InitializationOptions(v2);
  sub_100009574();
  __chkstk_darwin(v3);
  sub_100009954();
  uint64_t v4 = (void *)objc_opt_self(&OBJC_CLASS___CKDDaemonProcess);
  id v5 = [v4 currentProcess];
  id v6 = [v5 processType];

  id v7 = [v4 currentProcess];
  unsigned __int8 v8 = [v7 isSystemInstalledBinary];

  if (v6 == (id)2)
  {
    uint64_t v9 = static XPCServiceNames.testService.getter();
  }

  else if (v6 == (id)1)
  {
    uint64_t v9 = static XPCServiceNames.systemService.getter();
  }

  else
  {
    if (v6)
    {
      sub_100009A00( (uint64_t)"Fatal error",  11LL,  2LL,  0xD000000000000012LL,  0x800000010000D7C0LL,  (uint64_t)"cloudd/cloudd_main.swift");
      __break(1u);
      return;
    }

    uint64_t v9 = static XPCServiceNames.userService.getter();
  }

  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if ((v8 & 1) == 0)
  {
    uint64_t v11 = sub_1000061F8(0x67756265642ELL, 0xE600000000000000LL, v9, v10);
    uint64_t v14 = v13;
    swift_bridgeObjectRelease(v12);
    uint64_t v12 = v14;
  }

  static XPCListener.InitializationOptions.none.getter();
  uint64_t v15 = type metadata accessor for XPCListener(0LL);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  uint64_t v16 = XPCListener.init(service:targetQueue:options:incomingSessionHandler:)(v11, v12, 0LL, v0, sub_1000064BC, 0LL);
  sub_10000319C(v16);
  sub_100009554();
}

uint64_t sub_1000064BC(uint64_t a1)
{
  uint64_t v2 = static Dispatcher.shared.getter();
  Dispatcher.dispatchRequest(_:)(a1);
  return swift_release(v2);
}

Swift::Void __swiftcall CKDMain_Swift.setupCloudTelemetryXpcServiceActivities()()
{
}

id CKDMain_Swift.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

void CKDMain_Swift.init()()
{
  uint64_t v21 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  sub_100009890();
  __chkstk_darwin(v3);
  sub_100009984();
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  sub_100009574();
  __chkstk_darwin(v5);
  sub_100009944();
  uint64_t v8 = v7 - v6;
  type metadata accessor for DispatchQoS(0LL);
  sub_100009574();
  __chkstk_darwin(v9);
  sub_100009944();
  uint64_t v12 = v11 - v10;
  uint64_t v20 = OBJC_IVAR____TtC6cloudd13CKDMain_Swift_serialQueue;
  sub_10000937C(0LL, &qword_100014AC8, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v13 = v1;
  static DispatchQoS.unspecified.getter();
  uint64_t v23 = &_swiftEmptyArrayStorage;
  sub_100008DC8( &qword_100014AD0,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v15 = v14;
  uint64_t v16 = sub_100002EA0(&qword_100014AD8);
  unint64_t v17 = sub_100002EE0();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v23, v16, v17, v4, v15);
  (*(void (**)(uint64_t, void, uint64_t))(v0 + 104))( v2,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v21);
  *(void *)&v1[v20] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000001DLL,  0x800000010000D270LL,  v12,  v8,  v2,  0LL);
  v13[OBJC_IVAR____TtC6cloudd13CKDMain_Swift_systemAvailableForCacheDelete] = 0;
  uint64_t v18 = &v13[OBJC_IVAR____TtC6cloudd13CKDMain_Swift_CACHE_DELETE_LISTENER];
  *(void *)uint64_t v18 = 0xD00000000000001DLL;
  *((void *)v18 + 1) = 0x800000010000D270LL;
  uint64_t v19 = &v13[OBJC_IVAR____TtC6cloudd13CKDMain_Swift_CACHE_DELETE_SYSTEM_LISTENER];
  *(void *)uint64_t v19 = 0xD000000000000024LL;
  *((void *)v19 + 1) = 0x800000010000D2A0LL;
  *(void *)&v13[OBJC_IVAR____TtC6cloudd13CKDMain_Swift_cloudAssetsServiceListener] = 0LL;
  *(void *)&v13[OBJC_IVAR____TtC6cloudd13CKDMain_Swift_cachesByVolume] = &_swiftEmptyDictionarySingleton;

  v22.receiver = v13;
  v22.super_class = (Class)type metadata accessor for CKDMain_Swift();
  objc_msgSendSuper2(&v22, "init");
  sub_100009554();
}

id CKDMain_Swift.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CKDMain_Swift();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100006870(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = ((uint64_t (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

void sub_1000068F4()
{
}

uint64_t sub_100006914(uint64_t a1)
{
  return sub_10000691C(a1, *v1);
}

uint64_t sub_10000691C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10000695C(uint64_t a1)
{
  return sub_100006964(a1, *v1);
}

Swift::Int sub_100006964(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

void sub_1000069D4()
{
}

void sub_1000069F4(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  a2(v3);
  sub_10000985C();
  sub_1000099B4();
}

uint64_t sub_100006A28(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_100006AA0(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

NSString sub_100006B1C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  NSString result = sub_100006B40(a1);
  *a2 = result;
  return result;
}

NSString sub_100006B40(uint64_t a1)
{
  uint64_t v2 = v1;
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return v3;
}

uint64_t sub_100006B74(uint64_t *a1, uint64_t *a2)
{
  return sub_100006870(*a1, *a2);
}

uint64_t sub_100006B80@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100006BC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100006BF0(uint64_t a1)
{
  uint64_t v3 = v2;
  sub_100008DC8( &qword_100014C80,  (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey,  (uint64_t)&unk_10000D118);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v4, &protocol witness table for String);
}

uint64_t type metadata accessor for CKDMain_Swift()
{
  return objc_opt_self(&OBJC_CLASS____TtC6cloudd13CKDMain_Swift);
}

void sub_100006C94(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if ((*(_DWORD *)(*(void *)(a3 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v5 = *a2;
    *a1 = *a2;
    swift_retain(v5);
  }

  else
  {
    *a1 = *a2;
    uint64_t v4 = sub_1000096DC();
    sub_1000096AC(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL));
  }

  sub_1000096A0();
}

uint64_t sub_100006D08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_1000096DC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

void sub_100006D3C(void *a1, void *a2)
{
  uint64_t v2 = sub_100009534(a1, a2);
  sub_1000096AC(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL));
  sub_1000096A0();
}

void sub_100006D6C(void *a1, void *a2)
{
  uint64_t v2 = sub_100009534(a1, a2);
  sub_1000096AC(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 24LL));
  sub_1000096A0();
}

void sub_100006D9C(void *a1, void *a2)
{
  uint64_t v2 = sub_100009534(a1, a2);
  sub_1000096AC(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32LL));
  sub_1000096A0();
}

void sub_100006DCC(void *a1, void *a2)
{
  uint64_t v2 = sub_100009534(a1, a2);
  sub_1000096AC(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 40LL));
  sub_1000096A0();
}

uint64_t sub_100006DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006E08);
}

uint64_t sub_100006E08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = sub_1000096DC();
  return sub_100006E3C(v4, a2, v5);
}

uint64_t sub_100006E3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_100006E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006E54);
}

uint64_t sub_100006E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = sub_1000096DC();
  return sub_100006E8C(v5, a2, a2, v6);
}

uint64_t sub_100006E8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t type metadata accessor for CKDMain_Swift.VolumeSizeCache(uint64_t a1)
{
  uint64_t result = qword_100014D80;
  if (!qword_100014D80) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CKDMain_Swift.VolumeSizeCache);
  }
  return result;
}

uint64_t sub_100006ED0(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.Int64 + 64;
  uint64_t result = type metadata accessor for Date(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

void sub_100006F48(void *a1)
{
}

uint64_t sub_100006F50(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100006FB4;
  return v6(a1);
}

uint64_t sub_100006FB4()
{
  return sub_1000097F4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100006FDC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000070AC(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007908((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100007908((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1000078E8(v12);
  return v7;
}

void *sub_1000070AC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100007200((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
      uint64_t result = 0LL;
      *a1 = __dst;
      return result;
    }

    goto LABEL_11;
  }

  if ((a6 & 0x1000000000000000LL) != 0)
  {
LABEL_11:
    uint64_t result = sub_1000072C4(a5, a6);
    *a1 = v12;
    return result;
  }

  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }

  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
      __break(1u);
      return result;
    }
  }

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return (void *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

void *sub_100007200(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory with negative count",  60LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1170LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1173LL,  0);
  }

  __break(1u);
  return result;
}

void *sub_1000072C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100007358(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_10000752C(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000752C((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100007358(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0)
  {
    Swift::Int v4 = String.UTF8View._foreignCount()();
    if (v4) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }

  if ((a2 & 0x2000000000000000LL) != 0) {
    Swift::Int v4 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  uint64_t v5 = sub_1000074C8(v4, 0LL);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  71LL,  0);
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v6 = v5;
  uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    goto LABEL_15;
  }

  if (v7 == v4) {
    return v6;
  }
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  2,  1122LL,  0);
LABEL_15:
  __break(1u);
  return result;
}

void *sub_1000074C8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_100002EA0(&qword_100014BE8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_10000752C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100002EA0(&qword_100014BE8);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1000076C4(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_100007600(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_100007600(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

char *sub_1000076C4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000LL) != 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }

  return __src;
}

uint64_t sub_100007744()
{
  return swift_deallocObject(v0, 104LL, 7LL);
}

uint64_t sub_100007770()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[8];
  int64_t v7 = (void *)swift_task_alloc(dword_100014BAC);
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_100007804;
  return sub_100003280((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_100007804()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007830()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100007854(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100014BBC);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000078C4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100014BB8 + dword_100014BB8))(a1, v4);
}

uint64_t sub_1000078C4()
{
  return sub_1000097F4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1000078E8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100007908(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100007948(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = type metadata accessor for URL(0LL);
  sub_100008DC8( &qword_100014BF8,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
  uint64_t v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_100007A18(a1, v7);
}

unint64_t sub_1000079B4(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100007B58(a1, a2, v5);
}

unint64_t sub_100007A18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v18 = a1;
  uint64_t v5 = type metadata accessor for URL(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v10 = a2 & ~v9;
  if (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(void *)(v3 + 48) + v12 * v10, v5);
      sub_100008DC8( &qword_100014C00,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
    }

    while (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
  }

  return v10;
}

unint64_t sub_100007B58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_100007C38(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = *(void *)(*v2 + 40LL);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v10 = v9;
  Hasher.init(_seed:)(v36, v7);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v36, v8, v10);
  Swift::Int v11 = Hasher._finalize()();
  swift_bridgeObjectRelease(v10);
  uint64_t v12 = -1LL << *(_BYTE *)(v6 + 32);
  unint64_t v13 = v11 & ~v12;
  if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v13) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease(v6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v36[0] = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    id v31 = a2;
    sub_10000816C(v31, v13, isUniquelyReferenced_nonNull_native);
    uint64_t v32 = *v3;
    *uint64_t v3 = v36[0];
    swift_bridgeObjectRelease(v32);
    *a1 = v31;
    return 1LL;
  }

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v6 + 48) + 8 * v13));
  uint64_t v16 = v15;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  if (v14 == v17 && v16 == v18)
  {
LABEL_16:
    swift_bridgeObjectRelease_n(v16, 2LL);
  }

  else
  {
    uint64_t v20 = v18;
    char v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v16, v17, v18, 0LL);
    swift_bridgeObjectRelease(v16);
    swift_bridgeObjectRelease(v20);
    if ((v21 & 1) == 0)
    {
      uint64_t v22 = ~v12;
      do
      {
        unint64_t v13 = (v13 + 1) & v22;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v13) & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v6 + 48) + 8 * v13));
        uint64_t v16 = v24;
        uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
        if (v23 == v25 && v16 == v26) {
          goto LABEL_16;
        }
        uint64_t v28 = v26;
        char v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v16, v25, v26, 0LL);
        swift_bridgeObjectRelease(v16);
        swift_bridgeObjectRelease(v28);
      }

      while ((v29 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease(v6);
  uint64_t v34 = *(void **)(*(void *)(*v3 + 48LL) + 8 * v13);
  *a1 = v34;
  id v35 = v34;
  return 0LL;
}

uint64_t sub_100007E60(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100002EA0(&qword_100014C30);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v33 = v2;
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    id v35 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v8 = ~(-1LL << v7);
    }
    else {
      uint64_t v8 = -1LL;
    }
    unint64_t v9 = v8 & *(void *)(v3 + 56);
    int64_t v34 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v10 = v5 + 56;
    uint64_t result = swift_retain(v3);
    int64_t v12 = 0LL;
    if (!v9) {
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v13 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      uint64_t v18 = *(void *)(*(void *)(v3 + 48) + 8 * i);
      uint64_t v19 = *(void *)(v6 + 40);
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
      uint64_t v22 = v21;
      Hasher.init(_seed:)(v36, v19);
      String.hash(into:)(v36, v20, v22);
      Swift::Int v23 = Hasher._finalize()();
      uint64_t result = swift_bridgeObjectRelease(v22);
      uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v25 = v23 & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1LL << v25) & ~*(void *)(v10 + 8 * (v25 >> 6))) == 0)
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v24) >> 6;
        while (++v26 != v29 || (v28 & 1) == 0)
        {
          BOOL v30 = v26 == v29;
          if (v26 == v29) {
            unint64_t v26 = 0LL;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v10 + 8 * v26);
          if (v31 != -1)
          {
            unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
            goto LABEL_33;
          }
        }

        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }

      unint64_t v27 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v10 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
      *(void *)(v10 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v27;
      *(void *)(*(void *)(v6 + 48) + 8 * v27) = v18;
      ++*(void *)(v6 + 16);
      if (v9) {
        goto LABEL_9;
      }
LABEL_10:
      int64_t v15 = v12 + 1;
      if (__OFADD__(v12, 1LL)) {
        goto LABEL_41;
      }
      if (v15 >= v34) {
        goto LABEL_35;
      }
      unint64_t v16 = v35[v15];
      ++v12;
      if (!v16)
      {
        int64_t v12 = v15 + 1;
        if (v15 + 1 >= v34) {
          goto LABEL_35;
        }
        unint64_t v16 = v35[v12];
        if (!v16)
        {
          int64_t v12 = v15 + 2;
          if (v15 + 2 >= v34) {
            goto LABEL_35;
          }
          unint64_t v16 = v35[v12];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v34)
            {
LABEL_35:
              swift_release(v3);
              uint64_t v2 = v33;
              uint64_t v32 = 1LL << *(_BYTE *)(v3 + 32);
              if (v32 > 63) {
                sub_100008398(0LL, (unint64_t)(v32 + 63) >> 6, v35);
              }
              else {
                *id v35 = -1LL << v32;
              }
              *(void *)(v3 + 16) = 0LL;
              break;
            }

            unint64_t v16 = v35[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v12 = v17 + 1;
                if (__OFADD__(v17, 1LL)) {
                  goto LABEL_42;
                }
                if (v12 >= v34) {
                  goto LABEL_35;
                }
                unint64_t v16 = v35[v12];
                ++v17;
                if (v16) {
                  goto LABEL_23;
                }
              }
            }

            int64_t v12 = v17;
          }
        }
      }

LABEL_23:
      unint64_t v9 = (v16 - 1) & v16;
    }
  }

  uint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    unint64_t v9 = (v16 - 1) & v16;
  }

  int64_t v17 = v15 + 3;
  if (v17 >= v35)
  {
LABEL_35:
    uint64_t result = swift_release_n(v3, 2LL);
    uint64_t v2 = v33;
    goto LABEL_37;
  }

  unint64_t v16 = *(void *)(v34 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v12 >= v35) {
      goto LABEL_35;
    }
    unint64_t v16 = *(void *)(v34 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }

id sub_10000816C(id result, unint64_t a2, char a3)
{
  uint64_t v4 = (uint64_t *)v3;
  id v6 = result;
  unint64_t v7 = *(void *)(*(void *)v3 + 16LL);
  unint64_t v8 = *(void *)(*(void *)v3 + 24LL);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_22;
  }
  uint64_t v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100007E60(v9);
  }

  else
  {
    if (v8 > v7)
    {
      uint64_t result = sub_1000083B4();
LABEL_22:
      uint64_t v31 = *v4;
      *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
      *(void *)(*(void *)(v31 + 48) + 8 * a2) = v6;
      uint64_t v32 = *(void *)(v31 + 16);
      BOOL v33 = __OFADD__(v32, 1LL);
      uint64_t v34 = v32 + 1;
      if (!v33)
      {
        *(void *)(v31 + 16) = v34;
        return result;
      }

      __break(1u);
      goto LABEL_25;
    }

    sub_10000855C(v9);
  }

  uint64_t v10 = *(void *)v3;
  uint64_t v11 = *(void *)(*(void *)v3 + 40LL);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  uint64_t v14 = v13;
  Hasher.init(_seed:)(v35, v11);
  String.hash(into:)(v35, v12, v14);
  Swift::Int v3 = Hasher._finalize()();
  uint64_t result = (id)swift_bridgeObjectRelease(v14);
  uint64_t v15 = -1LL << *(_BYTE *)(v10 + 32);
  a2 = v3 & ~v15;
  if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v10 + 48) + 8 * a2));
  Swift::Int v3 = v17;
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  if (v16 == v18 && v3 == v19)
  {
LABEL_25:
    swift_bridgeObjectRelease_n(v3, 2LL);
    goto LABEL_26;
  }

  uint64_t v21 = v19;
  char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v3, v18, v19, 0LL);
  swift_bridgeObjectRelease(v3);
  uint64_t result = (id)swift_bridgeObjectRelease(v21);
  if ((v22 & 1) == 0)
  {
    uint64_t v23 = ~v15;
    do
    {
      a2 = (a2 + 1) & v23;
      if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v10 + 48) + 8 * a2));
      Swift::Int v3 = v25;
      uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
      if (v24 == v26 && v3 == v27) {
        goto LABEL_25;
      }
      uint64_t v29 = v27;
      char v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v3, v26, v27, 0LL);
      swift_bridgeObjectRelease(v3);
      uint64_t result = (id)swift_bridgeObjectRelease(v29);
    }

    while ((v30 & 1) == 0);
  }

LABEL_26:
  type metadata accessor for URLResourceKey(0LL);
  uint64_t result = (id)ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_100008398(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }

  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }

  return result;
}

id sub_1000083B4()
{
  uint64_t v1 = v0;
  sub_100002EA0(&qword_100014C30);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1LL;
  if (v10 < 64) {
    uint64_t v12 = ~(-1LL << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    *(void *)(*(void *)(v4 + 48) + 8 * i) = v20;
    id result = v20;
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }

LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }

  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }

LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000855C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100002EA0(&qword_100014C30);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    uint64_t result = swift_release(v3);
LABEL_37:
    *uint64_t v2 = v6;
    return result;
  }

  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  BOOL v33 = v2;
  uint64_t v34 = v3 + 56;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(v3 + 56);
  int64_t v35 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v10 = v5 + 56;
  uint64_t result = swift_retain(v3);
  int64_t v12 = 0LL;
  if (!v9) {
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v13 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    unint64_t v18 = *(void **)(*(void *)(v3 + 48) + 8 * i);
    uint64_t v19 = *(void *)(v6 + 40);
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    uint64_t v22 = v21;
    Hasher.init(_seed:)(v36, v19);
    id v23 = v18;
    String.hash(into:)(v36, v20, v22);
    Swift::Int v24 = Hasher._finalize()();
    uint64_t result = swift_bridgeObjectRelease(v22);
    uint64_t v25 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v26 = v24 & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1LL << v26) & ~*(void *)(v10 + 8 * (v26 >> 6))) == 0)
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        BOOL v31 = v27 == v30;
        if (v27 == v30) {
          unint64_t v27 = 0LL;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v10 + 8 * v27);
        if (v32 != -1)
        {
          unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_33;
        }
      }

      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    unint64_t v28 = __clz(__rbit64((-1LL << v26) & ~*(void *)(v10 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
    *(void *)(v10 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v28;
    *(void *)(*(void *)(v6 + 48) + 8 * v28) = v23;
    ++*(void *)(v6 + 16);
    if (v9) {
      goto LABEL_9;
    }
LABEL_10:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1LL)) {
      goto LABEL_39;
    }
    if (v15 >= v35) {
      goto LABEL_35;
    }
    unint64_t v16 = *(void *)(v34 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v35) {
        goto LABEL_35;
      }
      unint64_t v16 = *(void *)(v34 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v35) {
          goto LABEL_35;
        }
        unint64_t v16 = *(void *)(v34 + 8 * v12);
        if (!v16) {
          break;
        }
      }
    }

LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100008834@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  unint64_t v7 = sub_100007948(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v20 = *v3;
    uint64_t v10 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    Swift::Int v11 = *(void *)(v10 + 24);
    sub_100002EA0(&qword_100014BF0);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v11);
    uint64_t v12 = *(void *)(v20 + 48);
    uint64_t v13 = type metadata accessor for URL(0LL);
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v13 - 8) + 8LL))( v12 + *(void *)(*(void *)(v13 - 8) + 72LL) * v7,  v13);
    uint64_t v14 = *(void *)(v20 + 56);
    uint64_t v15 = type metadata accessor for CKDMain_Swift.VolumeSizeCache(0LL);
    sub_1000089A4(v14 + *(void *)(*(void *)(v15 - 8) + 72LL) * v7, a2);
    sub_100008DC8( &qword_100014BF8,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
    _NativeDictionary._delete(at:)(v7, v20, v13, v15, v16);
    uint64_t v17 = *v3;
    *uint64_t v3 = v20;
    swift_bridgeObjectRelease(v17);
    return sub_100006E8C(a2, 0LL, 1LL, v15);
  }

  else
  {
    uint64_t v19 = type metadata accessor for CKDMain_Swift.VolumeSizeCache(0LL);
    return sub_100006E8C(a2, 1LL, 1LL, v19);
  }

uint64_t sub_1000089A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CKDMain_Swift.VolumeSizeCache(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000089E8(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  uint64_t v8 = *v2;
  *uint64_t v2 = 0x8000000000000000LL;
  sub_100008A54(a1, a2, isUniquelyReferenced_nonNull_native);
  uint64_t v6 = *v2;
  *uint64_t v2 = v8;
  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_100008A54(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  Swift::Int v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = (void *)*v3;
  unint64_t v13 = sub_100007948(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v18 = v13;
  char v19 = v14;
  sub_100002EA0(&qword_100014BF0);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_100007948(a2);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_9:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
    __break(1u);
    return result;
  }

  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = *v4;
  if ((v19 & 1) != 0)
  {
    uint64_t v23 = v22[7];
    uint64_t v24 = type metadata accessor for CKDMain_Swift.VolumeSizeCache(0LL);
    return sub_100008D84(a1, v23 + *(void *)(*(void *)(v24 - 8) + 72LL) * v18);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
    return sub_100008CD4(v18, (uint64_t)v11, a1, v22);
  }

uint64_t sub_100008BC0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_1000079B4(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v16 = v11;
  char v17 = v12;
  sub_100002EA0(&qword_100014C50);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_1000079B4(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }

  unint64_t v16 = v18;
LABEL_5:
  unint64_t v20 = *v5;
  if ((v17 & 1) != 0)
  {
    uint64_t v21 = v20[7];
    uint64_t result = swift_unknownObjectRelease(*(void *)(v21 + 8 * v16));
    *(void *)(v21 + 8 * v16) = a1;
  }

  else
  {
    sub_1000091C0(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain(a3);
  }

  return result;
}

uint64_t sub_100008CD4(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for URL(0LL);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32LL))( v8 + *(void *)(*(void *)(v9 - 8) + 72LL) * a1,  a2,  v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for CKDMain_Swift.VolumeSizeCache(0LL);
  uint64_t result = sub_1000089A4(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72LL) * a1);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1LL);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

uint64_t sub_100008D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CKDMain_Swift.VolumeSizeCache(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

void sub_100008DC8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_1000099B4();
}

void sub_100008E04(void *a1)
{
}

void sub_100008E0C(void *a1, char a2)
{
  uint64_t v4 = (void *)v2[2];
  uint64_t v3 = (void *)v2[3];
  uint64_t v6 = (void *)v2[4];
  uint64_t v5 = (void *)v2[5];
  uint64_t v8 = (void *)v2[6];
  unint64_t v7 = (void *)v2[7];
  id v9 = [a1 clearForced:a2 & 1];
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  uint64_t v11 = (uint64_t)[v9 bytesCount];
  if (v11 < 0)
  {
    __break(1u);
    goto LABEL_17;
  }

  if (__OFADD__(*v4, v11))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  *v4 += v11;
  uint64_t v12 = (uint64_t)sub_1000097BC(v11, "purgedBytesCount");
  if (v12 < 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  if (__OFADD__(*v3, v12))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  *v3 += v12;
  uint64_t v13 = (uint64_t)sub_1000097BC(v12, "purgeableBytesCount");
  if (v13 < 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  if (__OFADD__(*v6, v13))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  *v6 += v13;
  uint64_t v14 = (uint64_t)sub_1000097BC(v13, "filesCount");
  if (v14 < 0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  if (__OFADD__(*v5, v14))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  *v5 += v14;
  uint64_t v15 = (uint64_t)sub_1000097BC(v14, "purgedFilesCount");
  if (v15 < 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  if (__OFADD__(*v8, v15))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  *v8 += v15;
  unint64_t v16 = (unint64_t)sub_1000097BC(v15, "purgeableFilesCount");

  if ((v16 & 0x8000000000000000LL) != 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  if (!__OFADD__(*v7, v16))
  {
    *v7 += v16;
LABEL_15:
    sub_100009848();
    return;
  }

LABEL_27:
  __break(1u);
}

uint64_t sub_100008F54(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CKDMain_Swift.VolumeSizeCache(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100008F90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CKDMain_Swift.VolumeSizeCache(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008FD4()
{
  uint64_t v1 = sub_1000096CC();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v6, v5);
}

void sub_10000903C()
{
  uint64_t v1 = *(void *)(sub_1000096CC() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v4 = *(void *)(v3 + 8);
  uint64_t v13 = *(void (**)(void))v3;
  id v14 = [(id)objc_opt_self(CKDLogicalDeviceContext) defaultContext];
  uint64_t v5 = sub_100009208([v14 metadataCache]);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = (uint64_t)&_swiftEmptyArrayStorage;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (v7)
  {
    v0 += v2;
    uint64_t v8 = 4LL;
    while (1)
    {
      id v9 = (v6 & 0xC000000000000001LL) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8 - 4, v6)
         : *(id *)(v6 + 8 * v8);
      unint64_t v2 = (unint64_t)v9;
      uint64_t v10 = v8 - 3;
      if (__OFADD__(v8 - 4, 1LL)) {
        break;
      }
      uint64_t v11 = objc_autoreleasePoolPush();
      sub_100003CB0((void *)v2, v14, v0, v13, v4);
      objc_autoreleasePoolPop(v11);

      ++v8;
      if (v10 == v7) {
        goto LABEL_12;
      }
    }

    __break(1u);
LABEL_14:
    if (v6 < 0) {
      uint64_t v12 = v6;
    }
    else {
      uint64_t v12 = v6 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v6);
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v12);
    swift_bridgeObjectRelease(v6);
  }

LABEL_12:
  swift_bridgeObjectRelease(v6);
}

unint64_t sub_1000091C0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1LL << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1LL);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_100009208(void *a1)
{
  id v2 = [a1 knownAppContainerAccountTuples];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = sub_10000937C(0LL, &qword_100014C38, &OBJC_CLASS___CKDAppContainerAccountTuple_ptr);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

uint64_t sub_10000927C(void *a1)
{
  id v2 = [a1 personaID];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

uint64_t sub_1000092E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002EA0(&qword_100014C10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void sub_100009330(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002EA0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_1000099B4();
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

uint64_t sub_10000937C(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

void sub_1000093B4()
{
}

void type metadata accessor for CFDictionary(uint64_t a1)
{
}

void sub_1000093E8(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

void sub_10000942C()
{
}

void sub_10000944C()
{
}

void sub_10000946C()
{
}

void sub_100009498()
{
}

void sub_1000094C4()
{
}

uint64_t sub_100009528(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_100009534(void *a1, void *a2)
{
  *a1 = *a2;
  return type metadata accessor for Date(0LL);
}

  ;
}

uint64_t sub_10000956C(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

  ;
}

  ;
}

uint64_t sub_100009590()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

  ;
}

uint64_t sub_1000095C8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = a2;
  return v2();
}

uint64_t sub_1000095D8()
{
  return type metadata accessor for URL(0LL);
}

  ;
}

uint64_t sub_100009608(uint64_t a1, uint64_t a2)
{
  return swift_beginAccess(a1, a2, 0LL, 0LL);
}

void sub_100009614(id a1)
{
}

  ;
}

uint64_t sub_100009654()
{
  return 0LL;
}

void sub_100009670()
{
  *(void *)(v0 - 160) = 0LL;
}

uint64_t sub_10000968C()
{
  return Dictionary.init(dictionaryLiteral:)(v0, v2, v1, v3);
}

  ;
}

uint64_t sub_1000096AC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

void sub_1000096B8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_1000096CC()
{
  return type metadata accessor for URL(0LL);
}

uint64_t sub_1000096D4()
{
  return type metadata accessor for Logger(0LL);
}

uint64_t sub_1000096DC()
{
  return type metadata accessor for Date(0LL);
}

uint64_t sub_1000096E4(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

uint64_t sub_1000096EC@<X0>(char a1@<W3>, uint64_t a2@<X8>)
{
  return sub_100008BC0(v2, 0xD000000000000013LL, (a2 - 32) | 0x8000000000000000LL, a1);
}

NSDictionary sub_100009708()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100009718()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100009720()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100009730()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 - 216, v1, v0);
}

uint64_t sub_100009740(uint64_t a1)
{
  return swift_arrayDestroy(a1, 1LL);
}

uint64_t sub_100009748(uint64_t a1)
{
  *(void *)(v2 - 144) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 - 144, v2 - 136, v1);
}

BOOL sub_100009764(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100009774@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  return swift_dynamicCast(v2 - 160, v2 - 144, a2 + 8, a1, 6LL);
}

uint64_t sub_10000978C()
{
  return CKLog.getter();
}

uint64_t sub_100009794@<X0>(uint64_t a1@<X8>)
{
  return sub_100004C6C(0xD000000000000013LL, (a1 - 32) | 0x8000000000000000LL, v1);
}

uint64_t sub_1000097AC(uint64_t a1, uint64_t a2)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, v2);
}

uint64_t sub_1000097B4()
{
  return swift_errorRelease(v0);
}

id sub_1000097BC(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

void sub_1000097C4(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

id sub_1000097CC(float a1)
{
  *uint64_t v1 = a1;
  *(void *)(v3 - 144) = v2;
  type metadata accessor for CFDictionary(0LL);
  return v2;
}

uint64_t sub_1000097F4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100009800()
{
  return URL.init(fileURLWithPath:isDirectory:)(*(void *)(v0 - 160), *(void *)(v0 - 152), 1LL);
}

void sub_100009814()
{
}

uint64_t sub_100009820(uint64_t a1, unint64_t a2)
{
  return sub_100006FDC(a1, a2, (uint64_t *)(v2 - 160));
}

uint64_t sub_100009828@<X0>(uint64_t a1@<X8>)
{
  return sub_100004C6C(0xD000000000000013LL, a1 | 0x8000000000000000LL, v1);
}

void *sub_10000983C@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, char aBlock, uint64_t a6, uint64_t a7, uint64_t a8)
{
  a7 = v8;
  a8 = a1;
  return _Block_copy(&aBlock);
}

  ;
}

uint64_t sub_10000985C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100009864@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_100009870()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100009878(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100009880@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)(v2, v3 - 160, a1, a2 + 8);
}

  ;
}

uint64_t sub_1000098A0(uint64_t a1)
{
  return swift_bridgeObjectRelease_n(a1, 2LL);
}

BOOL sub_1000098A8(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void sub_1000098B8()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t sub_1000098C8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 32) = 0xD000000000000013LL;
  *(void *)(result + 40) = (a2 - 32) | 0x8000000000000000LL;
  return result;
}

uint64_t sub_1000098E0(uint64_t a1)
{
  return sub_100006E3C(a1, 1LL, v1);
}

uint64_t sub_1000098FC()
{
  return String.init<A>(describing:)(v1 - 144, v0);
}

uint64_t sub_10000990C()
{
  return (*(uint64_t (**)(uint64_t, void))(v1 + 8))(v0, *(void *)(v2 - 176));
}

  ;
}

uint64_t sub_10000992C@<X0>(uint64_t a1@<X8>)
{
  return a1 + v1;
}

uint64_t sub_10000993C()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_1000099BC()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_1000099CC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

id sub_1000099D4(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0);
}

uint64_t sub_1000099DC(uint64_t a1)
{
  return swift_initStackObject(a1, v1 - 136);
}

  ;
}

uint64_t sub_1000099F8(uint64_t a1)
{
  return swift_bridgeObjectRetain_n(a1, 2LL);
}

uint64_t sub_100009A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, a2, a3, a4, a5, a6, 24LL, 2LL);
}

uint64_t sub_100009A0C@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRelease(*(void *)(v1 + a1 + 8));
}

uint64_t sub_100009A18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100006E8C(a1, 1LL, 1LL, a4);
}

uint64_t sub_100009A24()
{
  return swift_release(v0);
}

void sub_100009A2C(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_100009A34()
{
  return sub_100002CDC(*(_DWORD *)(v0 - 292));
}

uint64_t sub_100009A40()
{
  return Logger.logObject.getter();
}

uint64_t sub_100009A48()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

uint64_t sub_100009A54(uint64_t a1)
{
  *(void *)(v1 - 184) = a1;
  return v1 - 184;
}

  ;
}

uint64_t sub_100009A70()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100009A78()
{
  return swift_bridgeObjectRelease(0x8000000000000000LL);
}

NSDictionary sub_100009A80()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100009A8C()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100009A94(uint64_t a1, uint64_t a2)
{
  return swift_beginAccess(a1, a2, 33LL, 0LL);
}

void sub_100009AE0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___CKDMain);
  uint64_t v2 = (void *)qword_1000150A8;
  qword_1000150A8 = (uint64_t)v1;
}

void sub_100009CF0(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = _os_activity_create( (void *)&_mh_execute_header,  "com.apple.notifyd.matching",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v6);
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
    if (string)
    {
      if (!strcasecmp("com.apple.Preferences.ResetPrivacyWarningsNotification", string))
      {
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKDPrivacyManager sharedManager](&OBJC_CLASS___CKDPrivacyManager, "sharedManager"));
        [v5 resetPrivacySettingsWithCompletionHandler:&stru_100010E40];
LABEL_10:

        goto LABEL_11;
      }

      if (!strcasecmp("com.apple.Preferences.ChangedRestrictionsEnabledStateNotification", string)
        || !strcasecmp("com.apple.managedconfiguration.effectivesettingschanged", string)
        || !strcasecmp("com.apple.ManagedConfiguration.profileListChanged", string))
      {
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKDAccountNotifier sharedNotifier](&OBJC_CLASS___CKDAccountNotifier, "sharedNotifier"));
        [v5 postAccountChangedNotificationToClients];
        goto LABEL_10;
      }
    }
  }

LABEL_11:
  os_activity_scope_leave(&v6);
}

void sub_100009E58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100009E70(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v3 = (os_log_s *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Finished resetting privacy settings with error: %@",  (uint8_t *)&v4,  0xCu);
  }
}

void sub_100009F64(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = _os_activity_create( (void *)&_mh_execute_header,  "com.apple.distnoted.matching",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v7);
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
    if (!strcmp(string, "com.apple.cdp.manatee-availability-changed"))
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKDLogicalDeviceContext defaultContext](&OBJC_CLASS___CKDLogicalDeviceContext, "defaultContext"));
      os_activity_scope_state_s v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountDataSecurityObserver]);
      [v6 handleManateeAvailabilityChangedNotification];
    }
  }

  os_activity_scope_leave(&v7);
}

void sub_10000A038( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000A0CC(id a1, NSString *a2, NSString *a3, int64_t a4, int64_t a5)
{
  os_activity_scope_state_s v6 = a2;
  os_activity_scope_state_s v7 = a3;
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v8 = (os_log_s *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Notifying clients of authorization change",  buf,  2u);
  }

  uint64_t v9 = CKTestNotificationPrefix(+[CKAccountInfo invalidateCachedAccountInfo](&OBJC_CLASS___CKAccountInfo, "invalidateCachedAccountInfo"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v10,  kCKAuthorizationChangedNotificationKey));

  notify_post((const char *)[v11 UTF8String]);
}

void sub_10000A1E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = CKGetGlobalQueue(-1LL);
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000A31C;
    v7[3] = &unk_100010EC8;
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v5, v7);
  }

  else
  {
    if (ck_log_initialization_predicate != -1LL) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    os_activity_scope_state_s v6 = (os_log_s *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "No background tasks need to be cleaned up.",  buf,  2u);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

uint64_t sub_10000A31C(uint64_t a1)
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v5);
        if (ck_log_initialization_predicate != -1LL) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        os_activity_scope_state_s v7 = (os_log_s *)ck_log_facility_ck;
        if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v6;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Cleaning up background tasks for configuration %@",  buf,  0xCu);
        }

        id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "backgroundSessionConfigurationWithIdentifier:",  v6));
        if (v8)
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v8));
          [v9 invalidateAndCancel];
        }

        uint64_t v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }

    while (v3);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_10000A4EC(void *a1, void *a2, int a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  if (a4 == 4)
  {
    if (!a3) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }

  if (a4 == 3)
  {
    if (!a3) {
      goto LABEL_16;
    }
    if (([v9 isEqualToString:kCKPackageClientDirectoryName] & 1) != 0
      || ([v9 isEqualToString:kCKPackageDaemonDirectoryName] & 1) != 0)
    {
      goto LABEL_15;
    }

LABEL_13:
    uint64_t v11 = kCKFrameworkCachesDirectoryName;
    goto LABEL_14;
  }

  if (a4 != 1)
  {
LABEL_16:
    uint64_t v12 = 0LL;
    goto LABEL_17;
  }

  if ((a3 & 1) == 0
    && (([v9 hasPrefix:a1[4]] & 1) != 0
     || ([v9 hasPrefix:a1[5]] & 1) != 0))
  {
    goto LABEL_15;
  }

  uint64_t v11 = a1[6];
LABEL_14:
LABEL_15:
  uint64_t v12 = 1LL;
LABEL_17:

  return v12;
}

BOOL sub_10000A5E4(id a1, NSString *a2, BOOL a3, unint64_t a4, NSDate *a5)
{
  return !a3;
}

void sub_10000AFF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, os_activity_scope_state_s state)
{
}

id sub_10000B048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2 && (_DWORD)a3) {
    return _[v3 expungeDataForAccountID:a2];
  }
  else {
    return _objc_msgSend(v3, "expungeOldData", a3);
  }
}

id *sub_10000B060(id *result, uint64_t a2, int a3)
{
  if (a3) {
    return (id *)_[result[4] expungeOperationInfoForDeletedAccountID:a2];
  }
  return result;
}

uint64_t start(uint64_t a1, uint64_t a2)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  uint64_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v5);

  if (v6)
  {
    dispatch_source_set_event_handler(v6, &stru_100010FA0);
    dispatch_activate(v6);
  }

  context = objc_autoreleasePoolPush();
  os_activity_scope_state_s v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKSignpost signpost](&OBJC_CLASS___CKSignpost, "signpost"));
  id v8 = v7;
  if (v7)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 log]);
    id v10 = (char *)[v8 identifier];
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = (os_signpost_id_t)v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "Launch",  "",  buf,  2u);
      }
    }
  }

  +[CKDXPCConnectionManager clouddStarted](&OBJC_CLASS___CKDXPCConnectionManager, "clouddStarted");
  uint64_t v52 = _os_activity_create( (void *)&_mh_execute_header,  "cloudd_main",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v52, &state);
  setCKRunningInClientProcess(0LL);
  +[CKDDaemonProcess deriveCurrentProcessWithArgC:argv:]( &OBJC_CLASS___CKDDaemonProcess,  "deriveCurrentProcessWithArgC:argv:",  a1,  a2);
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v12 = (os_log_s *)ck_log_facility_ck;
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v13)
  {
    uint64_t v14 = CKBuildVersion(v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = CKProductName(v15);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v16);
    uid_t v18 = getuid();
    *(_DWORD *)buf = 138412802;
    id v57 = v15;
    __int16 v58 = 2112;
    id v59 = v17;
    __int16 v60 = 1024;
    uid_t v61 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Welcome to cloudd, running on version %@ (%@). We are running as user %d. Enjoy your stay!",  buf,  0x1Cu);
  }

  char v19 = (void *)objc_claimAutoreleasedReturnValue(+[CKBehaviorOptions sharedOptions](&OBJC_CLASS___CKBehaviorOptions, "sharedOptions"));
  unsigned int v20 = [v19 isAppleInternalInstall];

  if (v20)
  {
    if (ck_log_initialization_predicate != -1LL) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v21 = (os_log_s *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Device is an AppleInternal install", buf, 2u);
    }
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[CKBehaviorOptions sharedOptions](&OBJC_CLASS___CKBehaviorOptions, "sharedOptions", v52));
  id v23 = [v22 sandboxCloudD];

  if ((_DWORD)v23)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess"));
    id v25 = [v24 processType];
    if (!v25
      || (id v23 = (id)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess")),
          [v23 processType] == (id)1))
    {
      unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess"));
      unsigned __int8 v28 = [v27 isSystemInstalledBinary];

      if (v25) {
      if ((v28 & 1) == 0)
      }
      {
        char v29 = @"com.apple.cloudd.debug";
        goto LABEL_30;
      }
    }

    else
    {
    }

    char v29 = @"com.apple.cloudd";
LABEL_30:
    _set_user_dir_suffix(-[__CFString UTF8String](v29, "UTF8String"));
    bzero(buf, 0x400uLL);
    confstr(65537, (char *)buf, 0x400uLL);
    goto LABEL_31;
  }

  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v26 = (os_log_s *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "cloudd is not sandboxed", buf, 2u);
  }

LABEL_31:
  unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[CKBehaviorOptions sharedOptions](&OBJC_CLASS___CKBehaviorOptions, "sharedOptions"));
  unsigned int v31 = [v30 CFNetworkLogging];

  if (v31)
  {
    if (ck_log_initialization_predicate != -1LL) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v32 = (os_log_s *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Enabling CFNetwork diagnostics", buf, 2u);
    }

    setenv("CFNETWORK_DIAGNOSTICS", "2", 1);
  }

  id v33 = +[CKDMain sharedMain](&OBJC_CLASS___CKDMain, "sharedMain");
  if (v8)
  {
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 log]);
    int64_t v35 = (char *)[v8 identifier];
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v34,  OS_SIGNPOST_EVENT,  (os_signpost_id_t)v35,  "Launch",  "Starting services",  buf,  2u);
    }
  }

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[CKDXPCConnectionManager sharedConnectionManager]( &OBJC_CLASS___CKDXPCConnectionManager,  "sharedConnectionManager"));
  [v36 activate];

  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[CKDMain sharedMain](&OBJC_CLASS___CKDMain, "sharedMain"));
  unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 swiftMain]);
  [v38 startCloudAssetsService];

  if ((objc_opt_respondsToSelector(&OBJC_CLASS___C2ReportMetrics, "useCloudTelemetryService") & 1) != 0) {
    unsigned int v39 = +[C2ReportMetrics useCloudTelemetryService]( &OBJC_CLASS___C2ReportMetrics,  "useCloudTelemetryService");
  }
  else {
    unsigned int v39 = _os_feature_enabled_impl("C2", "CloudTelemetryXPCService");
  }
  if (v39)
  {
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[CKDMain sharedMain](&OBJC_CLASS___CKDMain, "sharedMain"));
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 swiftMain]);
    [v41 setupCloudTelemetryXpcServiceActivities];
  }

  if (v8)
  {
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 log]);
    uint64_t v43 = (char *)[v8 identifier];
    if ((unint64_t)(v43 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v42,  OS_SIGNPOST_EVENT,  (os_signpost_id_t)v43,  "Launch",  "Started services",  buf,  2u);
    }
  }

  unint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess"));
  if ([v44 isSystemInstalledBinary])
  {
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[CKDDaemonProcess currentProcess](&OBJC_CLASS___CKDDaemonProcess, "currentProcess"));
    BOOL v46 = [v45 processType] == (id)2;

    if (v46) {
      goto LABEL_56;
    }
    unint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[CKDMain sharedMain](&OBJC_CLASS___CKDMain, "sharedMain"));
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v44 swiftMain]);
    [v47 registerWithCacheDelete];
  }

LABEL_56:
  if (v8)
  {
    uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 log]);
    uint64_t v49 = (char *)[v8 identifier];
    if ((unint64_t)(v49 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v48,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v49,  "Launch",  "",  buf,  2u);
    }
  }

  os_activity_scope_leave(&state);

  objc_autoreleasePoolPop(context);
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v50 run];

  return 0LL;
}

void sub_10000B90C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_10000B948(id a1)
{
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v1 = (os_log_s *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Received SIGTERM", v2, 2u);
  }

id objc_msgSend_CFNetworkLogging(void *a1, const char *a2, ...)
{
  return _[a1 CFNetworkLogging];
}

id objc_msgSend_CKSanitizedPath(void *a1, const char *a2, ...)
{
  return _[a1 CKSanitizedPath];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__getActiveSessionIdentifiersWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getActiveSessionIdentifiersWithCompletionHandler:");
}

id objc_msgSend__setupDistnotedEventHandler(void *a1, const char *a2, ...)
{
  return _[a1 _setupDistnotedEventHandler];
}

id objc_msgSend__setupNotifydEventHandler(void *a1, const char *a2, ...)
{
  return _[a1 _setupNotifydEventHandler];
}

id objc_msgSend__setupTCCEventHandler(void *a1, const char *a2, ...)
{
  return _[a1 _setupTCCEventHandler];
}

id objc_msgSend_accountDataSecurityObserver(void *a1, const char *a2, ...)
{
  return _[a1 accountDataSecurityObserver];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_applicationContainerPath(void *a1, const char *a2, ...)
{
  return _[a1 applicationContainerPath];
}

id objc_msgSend_applicationMetadataForApplicationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationMetadataForApplicationID:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_backgroundSessionConfigurationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundSessionConfigurationWithIdentifier:");
}

id objc_msgSend_canRunGivenAvailabilityState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canRunGivenAvailabilityState:");
}

id objc_msgSend_clouddStarted(void *a1, const char *a2, ...)
{
  return _[a1 clouddStarted];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return _[a1 currentProcess];
}

id objc_msgSend_daemonDatabaseDirectoryName(void *a1, const char *a2, ...)
{
  return _[a1 daemonDatabaseDirectoryName];
}

id objc_msgSend_dbFileName(void *a1, const char *a2, ...)
{
  return _[a1 dbFileName];
}

id objc_msgSend_defaultContext(void *a1, const char *a2, ...)
{
  return _[a1 defaultContext];
}

id objc_msgSend_defaultObserver(void *a1, const char *a2, ...)
{
  return _[a1 defaultObserver];
}

id objc_msgSend_deriveCurrentProcessWithArgC_argv_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deriveCurrentProcessWithArgC:argv:");
}

id objc_msgSend_expungeStaleAccountIDs(void *a1, const char *a2, ...)
{
  return _[a1 expungeStaleAccountIDs];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_handleManateeAvailabilityChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 handleManateeAvailabilityChangedNotification];
}

id objc_msgSend_hasMigrated(void *a1, const char *a2, ...)
{
  return _[a1 hasMigrated];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithDirectoryURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDirectoryURLs:");
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAndCancel];
}

id objc_msgSend_invalidateCachedAccountInfo(void *a1, const char *a2, ...)
{
  return _[a1 invalidateCachedAccountInfo];
}

id objc_msgSend_isAppleInternalInstall(void *a1, const char *a2, ...)
{
  return _[a1 isAppleInternalInstall];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isSystemInstalledBinary(void *a1, const char *a2, ...)
{
  return _[a1 isSystemInstalledBinary];
}

id objc_msgSend_kickOffPendingLongLivedOperations(void *a1, const char *a2, ...)
{
  return _[a1 kickOffPendingLongLivedOperations];
}

id objc_msgSend_knownContainerizedApplicationIDs(void *a1, const char *a2, ...)
{
  return _[a1 knownContainerizedApplicationIDs];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _[a1 log];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_markSystemAvailableForCacheDelete(void *a1, const char *a2, ...)
{
  return _[a1 markSystemAvailableForCacheDelete];
}

id objc_msgSend_metadataCache(void *a1, const char *a2, ...)
{
  return _[a1 metadataCache];
}

id objc_msgSend_operationInfoCache(void *a1, const char *a2, ...)
{
  return _[a1 operationInfoCache];
}

id objc_msgSend_postAccountChangedNotificationToClients(void *a1, const char *a2, ...)
{
  return _[a1 postAccountChangedNotificationToClients];
}

id objc_msgSend_processType(void *a1, const char *a2, ...)
{
  return _[a1 processType];
}

id objc_msgSend_purge(void *a1, const char *a2, ...)
{
  return _[a1 purge];
}

id objc_msgSend_purgeDirectoryAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeDirectoryAtURL:");
}

id objc_msgSend_registerCacheEvictionActivity(void *a1, const char *a2, ...)
{
  return _[a1 registerCacheEvictionActivity];
}

id objc_msgSend_registerDeviceCountRefreshActivity(void *a1, const char *a2, ...)
{
  return _[a1 registerDeviceCountRefreshActivity];
}

id objc_msgSend_registerObserver_forAccountChangeNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerObserver:forAccountChangeNotification:");
}

id objc_msgSend_registerTokenRefreshActivity(void *a1, const char *a2, ...)
{
  return _[a1 registerTokenRefreshActivity];
}

id objc_msgSend_registerWatcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerWatcher:");
}

id objc_msgSend_registerWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerWithBlock:");
}

id objc_msgSend_registerWithCacheDelete(void *a1, const char *a2, ...)
{
  return _[a1 registerWithCacheDelete];
}

id objc_msgSend_resetPrivacySettingsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetPrivacySettingsWithCompletionHandler:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_sandboxCloudD(void *a1, const char *a2, ...)
{
  return _[a1 sandboxCloudD];
}

id objc_msgSend_schedulePeriodicPurgesInDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedulePeriodicPurgesInDirectory:");
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setShouldRemoveFileBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldRemoveFileBlock:");
}

id objc_msgSend_setShouldSkipFileBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSkipFileBlock:");
}

id objc_msgSend_setUpAndRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpAndRunning:");
}

id objc_msgSend_setupCloudTelemetryXpcServiceActivities(void *a1, const char *a2, ...)
{
  return _[a1 setupCloudTelemetryXpcServiceActivities];
}

id objc_msgSend_sharedConnectionManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnectionManager];
}

id objc_msgSend_sharedMain(void *a1, const char *a2, ...)
{
  return _[a1 sharedMain];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return _[a1 sharedMonitor];
}

id objc_msgSend_sharedNotifier(void *a1, const char *a2, ...)
{
  return _[a1 sharedNotifier];
}

id objc_msgSend_sharedOptions(void *a1, const char *a2, ...)
{
  return _[a1 sharedOptions];
}

id objc_msgSend_signpost(void *a1, const char *a2, ...)
{
  return _[a1 signpost];
}

id objc_msgSend_startCloudAssetsService(void *a1, const char *a2, ...)
{
  return _[a1 startCloudAssetsService];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_swiftMain(void *a1, const char *a2, ...)
{
  return _[a1 swiftMain];
}

id objc_msgSend_tokenRegistrationScheduler(void *a1, const char *a2, ...)
{
  return _[a1 tokenRegistrationScheduler];
}

id objc_msgSend_upAndRunning(void *a1, const char *a2, ...)
{
  return _[a1 upAndRunning];
}

id objc_msgSend_useCloudTelemetryService(void *a1, const char *a2, ...)
{
  return _[a1 useCloudTelemetryService];
}
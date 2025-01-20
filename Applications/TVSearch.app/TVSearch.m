uint64_t start(int a1, char **a2)
{
  void *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  objc_class *v9;
  NSString *v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v14;
  v4 = objc_autoreleasePoolPush();
  v14 = TVSSystemLog;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  +[TVSLogger initializeLoggingWithDomain:persistentComponents:]( &OBJC_CLASS___TVSLogger,  "initializeLoggingWithDomain:persistentComponents:",  @"com.apple.TVSearch",  v5);

  v6 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVApplication);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVCKSearchAppDelegate);
  v10 = NSStringFromClass(v9);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(v10);
  v12 = UIApplicationMain(a1, a2, v8, v11);

  objc_autoreleasePoolPop(v4);
  return v12;
}

uint64_t sub_100003F60(uint64_t a1)
{
  return sub_100005878(a1, qword_10000C9C0, 0xD000000000000019LL, 0x8000000100007030LL);
}

uint64_t sub_100003F84()
{
  return sub_1000058F0(&qword_10000C270, (uint64_t)qword_10000C9C0);
}

uint64_t sub_100003FA0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003FB8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000594C(&qword_10000C270, (uint64_t)qword_10000C9C0, a1);
}

uint64_t sub_100003FD4(uint64_t a1)
{
  return sub_1000059F0(a1, &qword_10000C270, (uint64_t)qword_10000C9C0, (uint64_t)sub_100003F60);
}

uint64_t (*sub_100003FF0(uint64_t a1))(void)
{
  if (qword_10000C270 != -1) {
    swift_once(&qword_10000C270, sub_100003F60);
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v3 = sub_100003FA0(v2, (uint64_t)qword_10000C9C0);
  swift_beginAccess(v3, a1, 33LL, 0LL);
  return j_j__swift_endAccess;
}

uint64_t sub_100004068()
{
  uint64_t v0 = sub_1000043A4(&qword_10000C1A0);
  uint64_t v1 = type metadata accessor for StringSearchScope(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = swift_allocObject(v0, v4 + *(void *)(v2 + 72), v3 | 7);
  *(_OWORD *)(v5 + 16) = xmmword_100007120;
  uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(v2 + 104))( v5 + v4,  enum case for StringSearchScope.general(_:),  v1);
  qword_10000C9D8 = v5;
  return result;
}

uint64_t *sub_1000040FC()
{
  if (qword_10000C278 != -1) {
    swift_once(&qword_10000C278, sub_100004068);
  }
  return &qword_10000C9D8;
}

uint64_t sub_10000413C()
{
  if (qword_10000C278 != -1) {
    swift_once(&qword_10000C278, sub_100004068);
  }
  swift_beginAccess(&qword_10000C9D8, v1, 0LL, 0LL);
  return swift_bridgeObjectRetain(qword_10000C9D8);
}

uint64_t sub_1000041A8(uint64_t a1)
{
  if (qword_10000C278 != -1) {
    swift_once(&qword_10000C278, sub_100004068);
  }
  swift_beginAccess(&qword_10000C9D8, v4, 1LL, 0LL);
  uint64_t v2 = qword_10000C9D8;
  qword_10000C9D8 = a1;
  return swift_bridgeObjectRelease(v2);
}

uint64_t (*sub_10000421C(uint64_t a1))(void)
{
  if (qword_10000C278 != -1) {
    swift_once(&qword_10000C278, sub_100004068);
  }
  swift_beginAccess(&qword_10000C9D8, a1, 33LL, 0LL);
  return j_j__swift_endAccess;
}

void *sub_100004288()
{
  return &unk_100007140;
}

uint64_t sub_100004294()
{
  return 0LL;
}

uint64_t sub_10000429C()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000042BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StringSearchCriteria(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  IntentParameter.wrappedValue.setter(v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*sub_100004354(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10000439C;
}

uint64_t sub_1000043A4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000043E4()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_100004404(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_1000043A4(&qword_10000C0E8);
  v2[4] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for URL(0LL);
  v2[5] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[6] = v5;
  uint64_t v6 = *(void *)(v5 + 64);
  v2[7] = v6;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v2[8] = swift_task_alloc(v7);
  v2[9] = swift_task_alloc(v7);
  uint64_t v8 = type metadata accessor for StringSearchCriteria(0LL);
  v2[10] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[11] = v9;
  v2[12] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v10 = (*(void *)(*(void *)(sub_1000043A4(&qword_10000C0F0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[13] = swift_task_alloc(v10);
  v2[14] = swift_task_alloc(v10);
  return swift_task_switch(sub_1000044F8, 0LL, 0LL);
}

uint64_t sub_1000044F8()
{
  unint64_t v1 = sub_100004C04();
  if ([(id)swift_getObjCClassFromMetadata(v1) respondsToSelector:"showAppLoadingViewWithTimeout:"])
  {
    v0[15] = objc_opt_self(&OBJC_CLASS___TVAppDelegate);
    uint64_t v2 = type metadata accessor for MainActor(0LL);
    v0[16] = static MainActor.shared.getter();
    uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
    return swift_task_switch(sub_1000047E0, v3, v4);
  }

  else
  {
    uint64_t v6 = v0[13];
    uint64_t v7 = v0[14];
    uint64_t v8 = v0[11];
    uint64_t v9 = v0[12];
    uint64_t v10 = v0[10];
    uint64_t v11 = v0[6];
    uint64_t v33 = v0[5];
    _StringGuts.grow(_:)(35LL);
    uint64_t v12 = swift_bridgeObjectRelease(0xE000000000000000LL);
    uint64_t v13 = IntentParameter.wrappedValue.getter(v12);
    uint64_t v14 = StringSearchCriteria.term.getter(v13);
    v16 = v15;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
    v17._countAndFlagsBits = v14;
    v17._object = v16;
    String.append(_:)(v17);
    swift_bridgeObjectRelease(v16);
    URL.init(string:)(0xD000000000000021LL, 0x8000000100007000LL);
    swift_bridgeObjectRelease(0x8000000100007000LL);
    sub_100006704(v7, v6, &qword_10000C0F0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v6, 1LL, v33) == 1)
    {
      sub_100005F88(v0[13], &qword_10000C0F0);
    }

    else
    {
      uint64_t v19 = v0[8];
      uint64_t v18 = v0[9];
      uint64_t v21 = v0[6];
      uint64_t v20 = v0[7];
      uint64_t v23 = v0[4];
      uint64_t v22 = v0[5];
      v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32);
      v24(v18, v0[13], v22);
      uint64_t v25 = type metadata accessor for TaskPriority(0LL);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56LL))(v23, 1LL, 1LL, v25);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v19, v18, v22);
      type metadata accessor for MainActor(0LL);
      uint64_t v26 = static MainActor.shared.getter();
      uint64_t v27 = *(unsigned __int8 *)(v21 + 80);
      uint64_t v28 = (v27 + 32) & ~v27;
      uint64_t v29 = swift_allocObject(&unk_100008400, v28 + v20, v27 | 7);
      *(void *)(v29 + 16) = v26;
      *(void *)(v29 + 24) = &protocol witness table for MainActor;
      v24(v29 + v28, v19, v22);
      uint64_t v30 = sub_100005140(v23, (uint64_t)&unk_10000C110, v29);
      swift_release(v30);
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v18, v22);
    }

    v31 = (void *)swift_task_alloc(async function pointer to AppIntent.resolveAndPerform(donate:)[1]);
    v0[17] = v31;
    unint64_t v32 = sub_100004C40();
    void *v31 = v0;
    v31[1] = sub_100004A80;
    return AppIntent.resolveAndPerform(donate:)(v0 + 19, 1LL, &type metadata for TVSearchOpenIntent, v32);
  }
}

uint64_t sub_1000047E0()
{
  unint64_t v1 = *(void **)(v0 + 120);
  swift_release(*(void *)(v0 + 128));
  [v1 showAppLoadingViewWithTimeout:10.0];
  return swift_task_switch(sub_100004830, 0LL, 0LL);
}

uint64_t sub_100004830()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[6];
  uint64_t v29 = v0[5];
  _StringGuts.grow(_:)(35LL);
  uint64_t v7 = swift_bridgeObjectRelease(0xE000000000000000LL);
  uint64_t v8 = IntentParameter.wrappedValue.getter(v7);
  uint64_t v9 = StringSearchCriteria.term.getter(v8);
  uint64_t v11 = v10;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  v12._countAndFlagsBits = v9;
  v12._object = v11;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(v11);
  URL.init(string:)(0xD000000000000021LL, 0x8000000100007000LL);
  swift_bridgeObjectRelease(0x8000000100007000LL);
  sub_100006704(v2, v1, &qword_10000C0F0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v1, 1LL, v29) == 1)
  {
    sub_100005F88(v0[13], &qword_10000C0F0);
  }

  else
  {
    uint64_t v14 = v0[8];
    uint64_t v13 = v0[9];
    uint64_t v16 = v0[6];
    uint64_t v15 = v0[7];
    uint64_t v18 = v0[4];
    uint64_t v17 = v0[5];
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32);
    v19(v13, v0[13], v17);
    uint64_t v20 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56LL))(v18, 1LL, 1LL, v20);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v13, v17);
    type metadata accessor for MainActor(0LL);
    uint64_t v21 = static MainActor.shared.getter();
    uint64_t v22 = *(unsigned __int8 *)(v16 + 80);
    uint64_t v23 = (v22 + 32) & ~v22;
    uint64_t v24 = swift_allocObject(&unk_100008400, v23 + v15, v22 | 7);
    *(void *)(v24 + 16) = v21;
    *(void *)(v24 + 24) = &protocol witness table for MainActor;
    v19(v24 + v23, v14, v17);
    uint64_t v25 = sub_100005140(v18, (uint64_t)&unk_10000C110, v24);
    swift_release(v25);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v13, v17);
  }

  uint64_t v26 = (void *)swift_task_alloc(async function pointer to AppIntent.resolveAndPerform(donate:)[1]);
  v0[17] = v26;
  unint64_t v27 = sub_100004C40();
  *uint64_t v26 = v0;
  v26[1] = sub_100004A80;
  return AppIntent.resolveAndPerform(donate:)(v0 + 19, 1LL, &type metadata for TVSearchOpenIntent, v27);
}

uint64_t sub_100004A80()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 136LL);
  *(void *)(*(void *)v1 + 144LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_100004B78;
  }
  else {
    uint64_t v3 = sub_100004AE4;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_100004AE4()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 32);
  static IntentResult.result<>()();
  sub_100005F88(v2, &qword_10000C0F0);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004B78()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 32);
  sub_100005F88(v2, &qword_10000C0F0);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_100004C04()
{
  unint64_t result = qword_10000C0F8;
  if (!qword_10000C0F8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___TVAppDelegate);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000C0F8);
  }

  return result;
}

unint64_t sub_100004C40()
{
  unint64_t result = qword_10000C100;
  if (!qword_10000C100)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007298, &type metadata for TVSearchOpenIntent);
    atomic_store(result, &qword_10000C100);
  }

  return result;
}

uint64_t sub_100004C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[15] = a1;
  v4[16] = a4;
  uint64_t v5 = type metadata accessor for MainActor(0LL);
  v4[17] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[18] = v6;
  v4[19] = v7;
  return swift_task_switch(sub_100004CF0, v6, v7);
}

uint64_t sub_100004CF0()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 2;
  id v3 = [(id)objc_opt_self(UIApplication) sharedApplication];
  v1[20] = v3;
  URL._bridgeToObjectiveC()(v4);
  uint64_t v6 = v5;
  v1[21] = v5;
  unint64_t v7 = sub_100005000((uint64_t)&_swiftEmptyArrayStorage);
  type metadata accessor for OpenExternalURLOptionsKey();
  sub_1000067DC( &qword_10000C188,  (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey,  (uint64_t)&unk_100007524);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v1[22] = isa;
  swift_bridgeObjectRelease(v7);
  v1[7] = v1 + 23;
  v1[2] = v1;
  v1[3] = sub_100004E38;
  uint64_t v9 = swift_continuation_init(v2, 0LL);
  v1[10] = _NSConcreteStackBlock;
  v1 += 10;
  v1[1] = 0x40000000LL;
  v1[2] = sub_10000512C;
  v1[3] = &unk_100008570;
  v1[4] = v9;
  [v3 openURL:v6 options:isa completionHandler:v1];
  return swift_continuation_await(v2);
}

uint64_t sub_100004E38()
{
  return swift_task_switch(sub_100004E7C, *(void *)(*(void *)v0 + 144LL), *(void *)(*(void *)v0 + 152LL));
}

uint64_t sub_100004E7C()
{
  uint64_t v1 = *(void **)(v0 + 168);
  uint64_t v2 = *(void **)(v0 + 176);
  id v3 = *(void **)(v0 + 160);
  uint64_t v4 = *(_BYTE **)(v0 + 120);
  swift_release(*(void *)(v0 + 136));
  *uint64_t v4 = *(_BYTE *)(v0 + 184);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004ED4()
{
  uint64_t v1 = type metadata accessor for URL(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100004F48(uint64_t a1)
{
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(type metadata accessor for URL(0LL) - 8) + 80LL);
  uint64_t v5 = v1 + ((v4 + 32) & ~v4);
  uint64_t v6 = (void *)swift_task_alloc(dword_10000C10C);
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100004FB8;
  return sub_100004C84(a1, v7, v8, v5);
}

uint64_t sub_100004FB8()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_100005000(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_1000043A4(&qword_10000C190);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100006704(v7, (uint64_t)&v14, &qword_10000C198);
    uint64_t v8 = v14;
    unint64_t result = sub_100006370(v14);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    *(void *)(v4[6] + 8 * result) = v8;
    unint64_t result = (unint64_t)sub_100006748(&v15, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v11 = v4[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4[2] = v13;
    v7 += 40LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10000512C(uint64_t a1, char a2)
{
  **(_BYTE **)(*(void *)(*(void *)(a1 + 32) + 64LL) + 40LL) = a2;
  return swift_continuation_resume();
}

uint64_t sub_100005140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100005F88(a1, &qword_10000C0E8);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v15 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
LABEL_6:
  uint64_t v16 = swift_allocObject(&unk_100008558, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, &type metadata for Bool, &unk_10000C180, v16);
}

uint64_t sub_10000528C()
{
  uint64_t v0 = type metadata accessor for InputConnectionBehavior(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000043A4(&qword_10000C0C8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000043A4(&qword_10000C0D0);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000043A4(&qword_10000C0D8);
  LocalizedStringResource.init(stringLiteral:)(0x6169726574697243LL, 0xE800000000000000LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1LL, 1LL, v8);
  uint64_t v12 = type metadata accessor for IntentDialog(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v5, 1LL, 1LL, v12);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))( v3,  enum case for InputConnectionBehavior.default(_:),  v0);
  return IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)(v11, v7, v5, v3);
}

uint64_t sub_100005444@<X0>(void *a1@<X8>)
{
  if (qword_10000C278 != -1) {
    swift_once(&qword_10000C278, sub_100004068);
  }
  swift_beginAccess(&qword_10000C9D8, v4, 0LL, 0LL);
  uint64_t v2 = qword_10000C9D8;
  *a1 = qword_10000C9D8;
  return swift_bridgeObjectRetain(v2);
}

uint64_t sub_1000054B8()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000054D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StringSearchCriteria(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  IntentParameter.wrappedValue.setter(v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*sub_100005570(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10000439C;
}

void sub_1000055B8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32LL))(*a1, 0LL);
  free(v1);
}

uint64_t sub_1000055E8@<X0>(uint64_t a1@<X8>)
{
  return sub_100005DE0(&qword_10000C270, (uint64_t)qword_10000C9C0, (uint64_t)sub_100003F60, a1);
}

uint64_t sub_100005614(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc(dword_10000C0E4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100004FB8;
  return sub_100004404(a1, v4);
}

uint64_t sub_10000566C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for InputConnectionBehavior(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000043A4(&qword_10000C0C8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000043A4(&qword_10000C0D0);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000043A4(&qword_10000C0D8);
  LocalizedStringResource.init(stringLiteral:)(0x6169726574697243LL, 0xE800000000000000LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1LL, 1LL, v10);
  uint64_t v14 = type metadata accessor for IntentDialog(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v7, 1LL, 1LL, v14);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for InputConnectionBehavior.default(_:),  v2);
  uint64_t result = IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)(v13, v9, v7, v5);
  *a1 = result;
  return result;
}

uint64_t sub_10000582C(uint64_t a1)
{
  unint64_t v2 = sub_100005BE8();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100005854(uint64_t a1)
{
  return sub_100005878(a1, qword_10000C9E0, 0xD000000000000012LL, 0x8000000100007380LL);
}

uint64_t sub_100005878(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for LocalizedStringResource(0LL);
  sub_100005F48(v7, a2);
  sub_100003FA0(v7, (uint64_t)a2);
  return LocalizedStringResource.init(stringLiteral:)(a3, a4);
}

uint64_t sub_1000058D4()
{
  return sub_1000058F0(qword_10000C280, (uint64_t)qword_10000C9E0);
}

uint64_t sub_1000058F0(void *a1, uint64_t a2)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for LocalizedStringResource(0LL);
  return sub_100003FA0(v3, a2);
}

uint64_t sub_100005930@<X0>(uint64_t a1@<X8>)
{
  return sub_10000594C(qword_10000C280, (uint64_t)qword_10000C9E0, a1);
}

uint64_t sub_10000594C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v6 = sub_100003FA0(v5, a2);
  swift_beginAccess(v6, v8, 0LL, 0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a3, v6, v5);
}

uint64_t sub_1000059D4(uint64_t a1)
{
  return sub_1000059F0(a1, qword_10000C280, (uint64_t)qword_10000C9E0, (uint64_t)sub_100005854);
}

uint64_t sub_1000059F0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (*a2 != -1LL) {
    swift_once(a2, a4);
  }
  uint64_t v6 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v7 = sub_100003FA0(v6, a3);
  swift_beginAccess(v7, v10, 33LL, 0LL);
  uint64_t v8 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v7, a1, v6);
  swift_endAccess(v10);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v6);
}

uint64_t (*sub_100005A94(uint64_t a1))(void)
{
  if (qword_10000C280[0] != -1) {
    swift_once(qword_10000C280, sub_100005854);
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v3 = sub_100003FA0(v2, (uint64_t)qword_10000C9E0);
  swift_beginAccess(v3, a1, 33LL, 0LL);
  return j__swift_endAccess;
}

void *sub_100005B10()
{
  return &unk_100007141;
}

uint64_t sub_100005B1C()
{
  return 1LL;
}

uint64_t sub_100005B24(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return swift_task_switch(sub_100005B3C, 0LL, 0LL);
}

uint64_t sub_100005B3C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_100005B74()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000719C, &type metadata for TVShowInAppSearchResultsIntent);
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }

  return result;
}

uint64_t sub_100005BB8()
{
  return sub_1000067DC( &qword_10000C128,  (uint64_t (*)(uint64_t))&type metadata accessor for StringSearchCriteria,  (uint64_t)&protocol conformance descriptor for StringSearchCriteria);
}

unint64_t sub_100005BE8()
{
  unint64_t result = qword_10000C130;
  if (!qword_10000C130)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000071C4, &type metadata for TVShowInAppSearchResultsIntent);
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }

  return result;
}

unint64_t sub_100005C30()
{
  unint64_t result = qword_10000C138;
  if (!qword_10000C138)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007254, &type metadata for TVShowInAppSearchResultsIntent);
    atomic_store(result, (unint64_t *)&qword_10000C138);
  }

  return result;
}

unint64_t sub_100005C78()
{
  unint64_t result = qword_10000C140;
  if (!qword_10000C140)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000727C, &type metadata for TVShowInAppSearchResultsIntent);
    atomic_store(result, (unint64_t *)&qword_10000C140);
  }

  return result;
}

uint64_t sub_100005CBC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000797C, 1LL);
}

uint64_t sub_100005CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005D84(a1, a2, a3, (uint64_t (*)(void))sub_100005BE8);
}

unint64_t sub_100005CDC()
{
  unint64_t result = qword_10000C150;
  if (!qword_10000C150)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007328, &type metadata for TVSearchOpenIntent);
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }

  return result;
}

unint64_t sub_100005D24()
{
  unint64_t result = qword_10000C158;
  if (!qword_10000C158)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007350, &type metadata for TVSearchOpenIntent);
    atomic_store(result, (unint64_t *)&qword_10000C158);
  }

  return result;
}

uint64_t sub_100005D68(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000079A4, 1LL);
}

uint64_t sub_100005D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005D84(a1, a2, a3, (uint64_t (*)(void))sub_100004C40);
}

uint64_t sub_100005D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  v5[0] = a2;
  v5[1] = a4();
  return swift_getOpaqueTypeConformance2( v5,  &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>,  1LL);
}

uint64_t sub_100005DC4@<X0>(uint64_t a1@<X8>)
{
  return sub_100005DE0(qword_10000C280, (uint64_t)qword_10000C9E0, (uint64_t)sub_100005854, a1);
}

uint64_t sub_100005DE0@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1LL) {
    swift_once(a1, a3);
  }
  uint64_t v6 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v7 = sub_100003FA0(v6, a2);
  swift_beginAccess(v7, v9, 0LL, 0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a4, v7, v6);
}

uint64_t sub_100005E6C(uint64_t a1)
{
  unint64_t v2 = sub_100004C40();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for TVShowInAppSearchResultsIntent()
{
  return &type metadata for TVShowInAppSearchResultsIntent;
}

ValueMetadata *type metadata accessor for TVSearchOpenIntent()
{
  return &type metadata for TVSearchOpenIntent;
}

unint64_t sub_100005EB8()
{
  unint64_t result = qword_10000C168;
  if (!qword_10000C168)
  {
    uint64_t v1 = sub_100005F04(&qword_10000C170);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C168);
  }

  return result;
}

uint64_t sub_100005F04(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t *sub_100005F48(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

uint64_t sub_100005F88(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000043A4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100005FC4(uint64_t a1, uint64_t a2)
{
  return sub_10000610C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005FD0(uint64_t a1, id *a2)
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

uint64_t sub_100006044(uint64_t a1, id *a2)
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

uint64_t sub_1000060C0@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_100006100(uint64_t a1, uint64_t a2)
{
  return sub_10000610C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000610C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100006148(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100006188(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_1000061F8(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
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

uint64_t sub_100006280@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_1000062C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000062EC(uint64_t a1)
{
  uint64_t v2 = sub_1000067DC( &qword_10000C188,  (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey,  (uint64_t)&unk_100007524);
  uint64_t v3 = sub_1000067DC( &qword_10000C1C8,  (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey,  (uint64_t)&unk_100007478);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

unint64_t sub_100006370(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  Swift::Int v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_1000063F0(a1, v7);
}

unint64_t sub_1000063F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2LL);
      return v5;
    }

    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0LL);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = ~v4;
      unint64_t v5 = (v5 + 1) & v15;
      if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
      {
        while (1)
        {
          uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
          uint64_t v9 = v17;
          uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19) {
            break;
          }
          uint64_t v21 = v19;
          char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0LL);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v15;
            if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0) {
              continue;
            }
          }

          return v5;
        }

        goto LABEL_16;
      }
    }
  }

  return v5;
}

uint64_t sub_100006564(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  unint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1000065CC;
  return v5(v2 + 32);
}

uint64_t sub_1000065CC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(_BYTE **)(*v0 + 16);
  uint64_t v4 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 24));
  *uint64_t v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_10000661C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100006640(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc(dword_10000C17C);
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_100004FB8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10000C178 + dword_10000C178))(a1, v4);
}

void type metadata accessor for OpenExternalURLOptionsKey()
{
  if (!qword_10000C1A8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_100008598);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000C1A8);
    }
  }

uint64_t sub_100006704(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000043A4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100006748(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100006758()
{
  return sub_1000067DC( &qword_10000C1B0,  (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey,  (uint64_t)&unk_10000743C);
}

uint64_t sub_100006784()
{
  return sub_1000067DC( &qword_10000C1B8,  (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey,  (uint64_t)&unk_100007410);
}

uint64_t sub_1000067B0()
{
  return sub_1000067DC( &qword_10000C1C0,  (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey,  (uint64_t)&unk_1000074AC);
}

uint64_t sub_1000067DC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100006820()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

id sub_100006830()
{
  uint64_t v0 = type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  id result = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  qword_10000C998 = (uint64_t)result;
  return result;
}

uint64_t sub_100006880(uint64_t a1)
{
  return sub_100006A68(a1, qword_10000C9F8, 0xD00000000000001ELL, 0x80000001000070E0LL);
}

uint64_t sub_1000068A4()
{
  return sub_10000691C(&qword_10000C9A0, (uint64_t)qword_10000C9F8, (uint64_t)sub_100006880);
}

uint64_t sub_1000068C0@<X0>(uint64_t a1@<X8>)
{
  return sub_100006978(&qword_10000C9A0, (uint64_t)qword_10000C9F8, (uint64_t)sub_100006880, a1);
}

uint64_t sub_1000068DC(uint64_t a1)
{
  return sub_100006A68(a1, qword_10000CA10, 0xD00000000000001DLL, 0x80000001000070C0LL);
}

uint64_t sub_100006900()
{
  return sub_10000691C(&qword_10000C9A8, (uint64_t)qword_10000CA10, (uint64_t)sub_1000068DC);
}

uint64_t sub_10000691C(void *a1, uint64_t a2, uint64_t a3)
{
  if (*a1 != -1LL) {
    swift_once(a1, a3);
  }
  uint64_t v4 = type metadata accessor for ImageResource(0LL);
  return sub_100003FA0(v4, a2);
}

uint64_t sub_10000695C@<X0>(uint64_t a1@<X8>)
{
  return sub_100006978(&qword_10000C9A8, (uint64_t)qword_10000CA10, (uint64_t)sub_1000068DC, a1);
}

uint64_t sub_100006978@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1LL) {
    swift_once(a1, a3);
  }
  uint64_t v6 = type metadata accessor for ImageResource(0LL);
  uint64_t v7 = sub_100003FA0(v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a4, v7, v6);
}

uint64_t sub_1000069E0(uint64_t a1)
{
  return sub_100006A68(a1, qword_10000CA28, 0xD000000000000014LL, 0x80000001000070A0LL);
}

uint64_t sub_100006A04()
{
  return sub_10000691C(&qword_10000C9B0, (uint64_t)qword_10000CA28, (uint64_t)sub_1000069E0);
}

uint64_t sub_100006A20@<X0>(uint64_t a1@<X8>)
{
  return sub_100006978(&qword_10000C9B0, (uint64_t)qword_10000CA28, (uint64_t)sub_1000069E0, a1);
}

uint64_t sub_100006A3C(uint64_t a1)
{
  return sub_100006A68(a1, qword_10000CA40, 0x666C656853706F54LL, 0xED00006567616D49LL);
}

uint64_t sub_100006A68(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for ImageResource(0LL);
  sub_100005F48(v7, a2);
  sub_100003FA0(v7, (uint64_t)a2);
  if (qword_10000C990 != -1) {
    swift_once(&qword_10000C990, sub_100006830);
  }
  return ImageResource.init(name:bundle:)(a3, a4, (id)qword_10000C998);
}

uint64_t sub_100006B00()
{
  return sub_10000691C(&qword_10000C9B8, (uint64_t)qword_10000CA40, (uint64_t)sub_100006A3C);
}

uint64_t sub_100006B1C@<X0>(uint64_t a1@<X8>)
{
  return sub_100006978(&qword_10000C9B8, (uint64_t)qword_10000CA40, (uint64_t)sub_100006A3C, a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC8TVSearchP33_7F70307C7CF76A8C8A1781D3ACC5D5E519ResourceBundleClass);
}

ValueMetadata *_s12AppIconSmallOMa()
{
  return &_s12AppIconSmallON;
}

ValueMetadata *_s12AppIconSmallO5FrontOMa()
{
  return &_s12AppIconSmallO5FrontON;
}

ValueMetadata *_s12AppIconSmallO4BackOMa()
{
  return &_s12AppIconSmallO4BackON;
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_initializeLoggingWithDomain_persistentComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeLoggingWithDomain:persistentComponents:");
}
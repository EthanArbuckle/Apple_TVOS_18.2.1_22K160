uint64_t sub_100004E54()
{
  uint64_t result;
  sub_10000507C();
  result = NSString.init(stringLiteral:)("com.apple.IdleScreen.SceneWillBackgroundObserverSceneComponent", 62LL, 2LL);
  qword_100011E98 = result;
  return result;
}

id sub_100004F4C(uint64_t a1, uint64_t a2)
{
  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for IdleScreenSceneComponent()
{
  return objc_opt_self(&OBJC_CLASS____TtC10IdleScreen24IdleScreenSceneComponent);
}

unint64_t sub_10000507C()
{
  unint64_t result = qword_100011AE0;
  if (!qword_100011AE0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSString);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100011AE0);
  }

  return result;
}

uint64_t sub_1000050B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100005B80(a1);
    uint64_t v9 = 7168LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      uint64_t v11 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v10, v8);
      swift_unknownObjectRetain(v10);
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      uint64_t v15 = v14;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v9 = v16 | 0x1C00LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
LABEL_6:
  uint64_t v17 = swift_allocObject(&unk_10000C718, 32LL, 7LL);
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0LL;
    v20[1] = 0LL;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }

  else
  {
    v18 = 0LL;
  }

  return swift_task_create(v9, v18, (char *)&type metadata for () + 8, &unk_100011B00, v17);
}

NSNumber sub_1000051FC()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100005204(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0LL;
  char v7 = 1;
  uint64_t result = static Int._forceBridgeFromObjectiveC(_:result:)(a1, &v6);
  uint64_t v4 = v6;
  char v5 = v7;
  if (v7) {
    uint64_t v4 = 0LL;
  }
  *(void *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_100005254(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0LL;
  char v8 = 1;
  char v3 = static Int._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v4 = v7;
  char v5 = v8;
  if (v8) {
    uint64_t v4 = 0LL;
  }
  *(void *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  return v3 & 1;
}

uint64_t sub_1000052A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Int._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

uint64_t sub_1000052CC(uint64_t a1, uint64_t a2)
{
  return sub_100005394(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000052D8(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100005318(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100005388(uint64_t a1, uint64_t a2)
{
  return sub_100005394(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005394(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_1000053D0(uint64_t a1, id *a2)
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

uint64_t sub_100005444(uint64_t a1, id *a2)
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

uint64_t sub_1000054C0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

uint64_t sub_100005500(void *a1, uint64_t *a2)
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

void *sub_100005588@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100005598(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000055A4(uint64_t a1)
{
  uint64_t v2 = sub_100005D84( &qword_100011B48,  (uint64_t (*)(uint64_t))type metadata accessor for TVISScreenSaverType,  (uint64_t)&unk_10000921C);
  uint64_t v3 = sub_100005D84( &qword_100011B50,  (uint64_t (*)(uint64_t))type metadata accessor for TVISScreenSaverType,  (uint64_t)&unk_1000091BC);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for Int);
}

uint64_t sub_100005638@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_10000567C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000056A4(uint64_t a1)
{
  uint64_t v2 = sub_100005D84( (unint64_t *)&qword_100011B58,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_1000092AC);
  uint64_t v3 = sub_100005D84( (unint64_t *)&unk_100011B60,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_100009098);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005728()
{
  return Int.hashValue.getter(*v0);
}

void sub_100005730()
{
}

uint64_t sub_100005758(uint64_t a1)
{
  return static Hasher._hash(seed:_:)(a1, *v1);
}

BOOL sub_100005760(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100005774(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000057D8;
  return v6(a1);
}

uint64_t sub_1000057D8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_100005824(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = v2;
  sub_100005A48(&qword_100011AE8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100011A40 != -1) {
    swift_once(&qword_100011A40, sub_100008508);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  sub_100005A88(v8, (uint64_t)qword_100011EB8);
  uint64_t v9 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc(18LL, -1LL);
    *(_DWORD *)uint64_t v11 = 134218240;
    uint64_t v20 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v11 + 4, v11 + 12);
    *(_WORD *)(v11 + 12) = 1024;
    HIDWORD(v19) = (a2 >> 5) & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)((char *)&v19 + 4, &v20, v11 + 14, v11 + 18);
    _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "sceneWillTransitionTo: %ld, containsSystemAnimation: %{BOOL}d",  (uint8_t *)v11,  0x12u);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  if (a1 == 1 && (a2 & 0x20) != 0)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC10IdleScreen24IdleScreenSceneComponent_delegate);
    if (Strong)
    {
      uint64_t v13 = Strong;
      uint64_t v14 = type metadata accessor for TaskPriority(0LL);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v7, 1LL, 1LL, v14);
      type metadata accessor for MainActor(0LL);
      uint64_t v15 = swift_retain(v13);
      uint64_t v16 = static MainActor.shared.getter(v15);
      uint64_t v17 = (void *)swift_allocObject(&unk_10000C6F0, 40LL, 7LL);
      v17[2] = v16;
      v17[3] = &protocol witness table for MainActor;
      v17[4] = v13;
      uint64_t v18 = sub_1000050B8((uint64_t)v7, (uint64_t)&unk_100011AF0, (uint64_t)v17);
      swift_release(v13);
      swift_release(v18);
    }
  }
}

uint64_t sub_100005A48(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100005A88(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005AA0()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100005ACC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_100011DFC);
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100005B38;
  return sub_100008724(a1, v4, v5, v6);
}

uint64_t sub_100005B38()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100005B80(uint64_t a1)
{
  uint64_t v2 = sub_100005A48(&qword_100011AE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100005BC0()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100005BE4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100011AFC);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005C54;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100011AF8 + dword_100011AF8))(a1, v4);
}

uint64_t sub_100005C54()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100005C9C(uint64_t a1)
{
  return a1;
}

void type metadata accessor for TVISScreenSaverType(uint64_t a1)
{
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

void sub_100005CE8(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

uint64_t sub_100005D2C()
{
  return sub_100005D84( &qword_100011B18,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_10000905C);
}

uint64_t sub_100005D58()
{
  return sub_100005D84( &qword_100011B20,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)"Q7");
}

uint64_t sub_100005D84(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100005DC4()
{
  return sub_100005D84( &qword_100011B28,  (uint64_t (*)(uint64_t))type metadata accessor for TVISScreenSaverType,  (uint64_t)&unk_100009180);
}

uint64_t sub_100005DF0()
{
  return sub_100005D84( &qword_100011B30,  (uint64_t (*)(uint64_t))type metadata accessor for TVISScreenSaverType,  (uint64_t)&unk_100009154);
}

uint64_t sub_100005E1C()
{
  return sub_100005D84( &qword_100011B38,  (uint64_t (*)(uint64_t))type metadata accessor for TVISScreenSaverType,  (uint64_t)&unk_1000091F0);
}

uint64_t sub_100005E48()
{
  return sub_100005D84( &qword_100011B40,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_1000090CC);
}

id sub_100005E74()
{
  uint64_t v0 = (void *)objc_opt_self(&OBJC_CLASS___AVAudioSession);
  id v1 = [v0 sharedInstance];
  id v20 = 0LL;
  unsigned int v2 = [v1 setCategory:AVAudioSessionCategoryPlayback withOptions:1 error:&v20];

  id v3 = v20;
  if (v2)
  {
    id v4 = v20;
    id v5 = [v0 sharedInstance];
    id v20 = 0LL;
    unsigned int v6 = [v5 setAudioHardwareControlFlags:0 error:&v20];

    id v3 = v20;
    if (v6) {
      return v20;
    }
  }

  id v19 = v3;
  id v8 = v3;
  uint64_t v9 = (void *)_convertNSErrorToError(_:)(v19);

  uint64_t v10 = swift_willThrow();
  uint64_t v11 = static os_log_type_t.error.getter(v10);
  uint64_t v12 = sub_100005A48(&qword_100011BD0);
  uint64_t v13 = swift_allocObject(v12, 112LL, 7LL);
  *(_OWORD *)(v13 + 16) = xmmword_100009300;
  *(void *)(v13 + 56) = &type metadata for String;
  unint64_t v14 = sub_1000060A4();
  *(void *)(v13 + 64) = v14;
  *(void *)(v13 + 32) = 0xD00000000000001CLL;
  *(void *)(v13 + 40) = 0x80000001000095E0LL;
  id v20 = v9;
  swift_errorRetain(v9);
  uint64_t v15 = sub_100005A48(&qword_100011BD8);
  uint64_t v16 = String.init<A>(describing:)(&v20, v15);
  *(void *)(v13 + 96) = &type metadata for String;
  *(void *)(v13 + 104) = v14;
  *(void *)(v13 + 72) = v16;
  *(void *)(v13 + 80) = v17;
  sub_1000060E8();
  uint64_t v18 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)(v11, &_mh_execute_header, v18, "%s - Error setting audio category: %{public}@", 45LL, 2LL, v13);
  swift_bridgeObjectRelease(v13);

  return (id)swift_errorRelease(v9);
}

unint64_t sub_1000060A4()
{
  unint64_t result = qword_100011CF0;
  if (!qword_100011CF0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100011CF0);
  }

  return result;
}

unint64_t sub_1000060E8()
{
  unint64_t result = qword_100011BE0;
  if (!qword_100011BE0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100011BE0);
  }

  return result;
}

BOOL sub_100006168(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100006180()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000061C4()
{
}

Swift::Int sub_1000061EC(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

const char *sub_10000622C()
{
  return "IdleScreen";
}

const char *sub_100006240()
{
  if (*v0) {
    return "Fizzgig";
  }
  else {
    return "Memories";
  }
}

uint64_t sub_10000626C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v51 = a1;
  uint64_t v3 = type metadata accessor for ScreenSaverActivationReason(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  v50 = (char *)&v50 - v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v50 - v10;
  uint64_t v12 = type metadata accessor for HostingRootView(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v50 - v17;
  v53[3] = &type metadata for SceneDelegate.IdleScreenFeatureFlags;
  v53[4] = sub_100007DF4();
  LOBYTE(v53[0]) = 1;
  char v19 = isFeatureEnabled(_:)(v53);
  sub_100007E38(v53);
  if ((v19 & 1) != 0)
  {
    uint64_t v21 = sub_100007E58( &qword_100011CD0,  v20,  (uint64_t (*)(uint64_t))type metadata accessor for SceneDelegate,  (uint64_t)&unk_100009344);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v11, v51, v3);
    uint64_t v22 = swift_unknownObjectRetain(v2);
    uint64_t v23 = HostingRootView.init(delegate:activationReason:)(v22, v21, v11);
    uint64_t v24 = HostingRootView.viewModel.getter(v23);
    v25 = (uint64_t *)(v2 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_sceneObserver);
    uint64_t v26 = *(void *)(v2 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_sceneObserver);
    uint64_t *v25 = v24;
    v25[1] = (uint64_t)&off_10000C950;
    swift_unknownObjectRelease(v26);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
    id v27 = objc_allocWithZone((Class)sub_100005A48(&qword_100011CD8));
    uint64_t v28 = UIHostingController.init(rootView:)(v16);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    return v28;
  }

  uint64_t v29 = v51;
  uint64_t v30 = v2;
  if ((sub_10000725C() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v29, v3);
    int v37 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
    if (v37 == enum case for ScreenSaverActivationReason.posterPreview(_:))
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }

    else
    {
      if (v37 == enum case for ScreenSaverActivationReason.systemIdle(_:))
      {
        uint64_t v39 = 0LL;
LABEL_21:
        uint64_t v41 = type metadata accessor for AerialScreenSaverViewModel(0LL);
        id v42 = [(id)objc_opt_self(TVISScreenSaverServiceController) sharedInstance];
        v43 = (void *)AerialScreenSaverViewModel.__allocating_init(isUserAction:renderingContext:controller:)( v39,  0LL,  v42);
        uint64_t v44 = swift_unknownObjectRetain(v30);
        AerialScreenSaverView.init(delegate:)(v52, v44, &off_10000C830);
        uint64_t v45 = sub_100007E58( &qword_100011C90,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for AerialScreenSaverViewModel,  (uint64_t)&protocol conformance descriptor for AerialScreenSaverViewModel);
        uint64_t v46 = static ObservableObject.environmentStore.getter(v41, v45);
        sub_100007154((uint64_t)v52, (uint64_t)v53);
        v53[5] = v46;
        v53[6] = v43;
        id v47 = v43;
        sub_100007190((uint64_t)v52);
        sub_1000071C4((uint64_t)v53, (uint64_t)v52);
        id v48 = objc_allocWithZone((Class)sub_100005A48(&qword_100011CA0));
        uint64_t v28 = UIHostingController.init(rootView:)(v52);

        sub_10000720C((uint64_t)v53);
        return v28;
      }

      if (v37 != enum case for ScreenSaverActivationReason.userAction(_:)
        && v37 != enum case for ScreenSaverActivationReason.walkThrough(_:))
      {
        goto LABEL_23;
      }
    }

    uint64_t v39 = 1LL;
    goto LABEL_21;
  }

  uint64_t v31 = type metadata accessor for MemoryRecoverableConfiguration(0LL);
  swift_allocObject(v31, 16LL, 7LL);
  uint64_t v32 = MemoryRecoverableConfiguration.init()();
  v33 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v50, v29, v3);
  int v34 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v33, v3);
  if (v34 == enum case for ScreenSaverActivationReason.posterPreview(_:))
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v33, v3);
    uint64_t v35 = 1LL;
    uint64_t v36 = v2;
LABEL_14:
    uint64_t v28 = (*(uint64_t (**)(uint64_t, uint64_t, _UNKNOWN **))(*(void *)v32 + 88LL))(v35, v36, &off_10000C830);
    swift_release(v32);
    return v28;
  }

  int v38 = v34;
  uint64_t v36 = v2;
  if (v34 == enum case for ScreenSaverActivationReason.systemIdle(_:))
  {
    uint64_t v35 = 0LL;
    goto LABEL_14;
  }

  uint64_t v35 = 1LL;
  if (v38 == enum case for ScreenSaverActivationReason.userAction(_:)
    || v38 == enum case for ScreenSaverActivationReason.walkThrough(_:))
  {
    goto LABEL_14;
  }

LABEL_23:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0LL,  0xE000000000000000LL,  "IdleScreen/ScreenSaverActivationReason+IdleScreen.swift",  55LL,  2LL,  40LL,  0);
  __break(1u);
  return result;
}

id sub_10000678C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC10IdleScreen13SceneDelegate);
}

id sub_1000068A4(void *a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_window);
  if (v3) {
    [v3 setRootViewController:0];
  }
  uint64_t v4 = (void *)(v1 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_sceneObserver);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_sceneObserver);
  *uint64_t v4 = 0LL;
  v4[1] = 0LL;
  swift_unknownObjectRelease(v5);
  if (qword_100011A30 != -1) {
    swift_once(&qword_100011A30, sub_100004E54);
  }
  return [a1 _unregisterSceneComponentForKey:qword_100011E98];
}

void sub_100006A10()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OSSignpostError(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v48 - v11;
  uint64_t v13 = *(void **)(v0 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_window);
  if (!v13) {
    return;
  }
  id v14 = [v13 windowScene];
  if (!v14) {
    return;
  }
  uint64_t v15 = v14;
  id v16 = [v14 _FBSScene];

  if (!v16) {
    return;
  }
  uint64_t v53 = v7;
  id v55 = v16;
  id v17 = [objc_allocWithZone(PBUIScreenSaverPreparedAction) initWithInfo:0 responder:0];
  uint64_t v18 = sub_100005A48(&qword_100011CA8);
  uint64_t inited = swift_initStackObject(v18, v57);
  *(_OWORD *)(inited + 16) = xmmword_100009310;
  *(void *)(inited + 32) = v17;
  uint64_t v56 = inited;
  specialized Array._endMutation()();
  uint64_t v20 = v56;
  id v54 = v17;
  if ((unint64_t)v56 >> 62)
  {
    if (v56 < 0) {
      uint64_t v25 = v56;
    }
    else {
      uint64_t v25 = v56 & 0xFFFFFFFFFFFFFF8LL;
    }
    id v26 = v17;
    swift_bridgeObjectRetain(v20);
    uint64_t v27 = _CocoaArrayWrapper.endIndex.getter(v25);
    swift_bridgeObjectRelease(v20);
    if (v27) {
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v21 = *(void *)((v56 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    id v22 = v17;
    if (v21)
    {
LABEL_6:
      sub_100007A40(v20);
      uint64_t v24 = v23;
      goto LABEL_12;
    }
  }

  uint64_t v24 = &_swiftEmptySetSingleton;
LABEL_12:
  swift_bridgeObjectRelease(v20);
  sub_100007E98(0LL, &qword_100011CB0, &OBJC_CLASS___BSAction_ptr);
  sub_100007D9C();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v24);
  id v29 = v55;
  [v55 sendActions:isa];

  uint64_t v30 = *(void *)(v1 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_startingSignpostIntervalState);
  if (v30)
  {
    uint64_t v52 = OBJC_IVAR____TtC10IdleScreen13SceneDelegate_startingSignpostIntervalState;
    uint64_t v31 = qword_100011A38;
    swift_retain(v30);
    if (v31 != -1) {
      swift_once(&qword_100011A38, sub_100008448);
    }
    uint64_t v32 = type metadata accessor for OSSignposter(0LL);
    uint64_t v33 = sub_100005A88(v32, (uint64_t)qword_100011EA0);
    int v34 = (os_log_s *)OSSignposter.logHandle.getter(v33);
    uint64_t v35 = OSSignpostIntervalState.signpostID.getter();
    int v50 = static os_signpost_type_t.end.getter(v35);
    char v36 = OS_os_log.signpostsEnabled.getter();
    uint64_t v37 = v30;
    id v38 = v54;
    uint64_t v51 = v37;
    if ((v36 & 1) != 0)
    {
      os_log_t v49 = v34;
      uint64_t v39 = swift_retain(v37);
      checkForErrorAndConsumeState(state:)(v39);
      swift_release(v37);
      if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v5, v2) == enum case for OSSignpostError.doubleEnd(_:))
      {
        v40 = "[Error] Interval already ended";
      }

      else
      {
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        v40 = "";
      }

      uint64_t v41 = v53;
      (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v10, v12, v6);
      id v42 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v42 = 0;
      os_signpost_id_t v43 = OSSignpostID.rawValue.getter();
      os_log_t v44 = v49;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v49,  (os_signpost_type_t)v50,  v43,  "StartScreenSaver",  v40,  v42,  2u);
      swift_slowDealloc(v42, -1LL, -1LL);

      uint64_t v45 = *(void (**)(char *, uint64_t))(v41 + 8);
      v45(v12, v6);
      v45(v10, v6);
      id v38 = v54;
    }

    else
    {

      (*(void (**)(char *, uint64_t))(v53 + 8))(v12, v6);
    }

    uint64_t v46 = v51;
    uint64_t v47 = *(void *)(v1 + v52);
    *(void *)(v1 + v52) = 0LL;
    swift_release(v46);

    swift_release(v47);
  }

  else
  {
  }

void sub_100006E30()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_window);
  if (v1)
  {
    id v2 = [v1 windowScene];
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = [v2 _FBSScene];

      if (v4)
      {
        id v5 = [objc_allocWithZone(UIDismissSceneAction) initWithInfo:0 responder:0];
        uint64_t v6 = sub_100005A48(&qword_100011CA8);
        uint64_t inited = swift_initStackObject(v6, v17);
        *(_OWORD *)(inited + 16) = xmmword_100009310;
        *(void *)(inited + 32) = v5;
        uint64_t v16 = inited;
        specialized Array._endMutation()();
        if ((unint64_t)v16 >> 62)
        {
          if (v16 < 0) {
            uint64_t v12 = v16;
          }
          else {
            uint64_t v12 = v16 & 0xFFFFFFFFFFFFFF8LL;
          }
          id v13 = v5;
          swift_bridgeObjectRetain(v16);
          uint64_t v14 = _CocoaArrayWrapper.endIndex.getter(v12);
          swift_bridgeObjectRelease(v16);
          if (v14) {
            goto LABEL_6;
          }
        }

        else
        {
          uint64_t v8 = *(void *)((v16 & 0xFFFFFFFFFFFFF8LL) + 0x10);
          id v9 = v5;
          if (v8)
          {
LABEL_6:
            sub_100007A40(v16);
            uint64_t v11 = v10;
LABEL_12:
            swift_bridgeObjectRelease(v16);
            sub_100007E98(0LL, &qword_100011CB0, &OBJC_CLASS___BSAction_ptr);
            sub_100007D9C();
            Class isa = Set._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease(v11);
            [v4 sendActions:isa];

            return;
          }
        }

        uint64_t v11 = &_swiftEmptySetSingleton;
        goto LABEL_12;
      }
    }
  }

void sub_100006FC0()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_window);
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = (void *)objc_opt_self(&OBJC_CLASS___TVISScreenSaverServiceController);
    id v4 = v1;
    id v5 = [v3 sharedInstance];
    uint64_t v6 = type metadata accessor for AerialScreenSaverViewModel(0LL);
    id v7 = v5;
    uint64_t v8 = (void *)AerialScreenSaverViewModel.__allocating_init(isUserAction:renderingContext:controller:)(0LL, 0LL, v7);
    uint64_t v9 = swift_unknownObjectRetain(v2);
    AerialScreenSaverView.init(delegate:)(v15, v9, &off_10000C830);
    uint64_t v10 = sub_100007E58( &qword_100011C90,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for AerialScreenSaverViewModel,  (uint64_t)&protocol conformance descriptor for AerialScreenSaverViewModel);
    uint64_t v11 = static ObservableObject.environmentStore.getter(v6, v10);
    sub_100007154((uint64_t)v15, (uint64_t)v16);
    uint64_t v17 = v11;
    uint64_t v18 = v8;
    id v12 = v8;
    sub_100007190((uint64_t)v15);
    sub_1000071C4((uint64_t)v16, (uint64_t)v15);
    id v13 = objc_allocWithZone((Class)sub_100005A48(&qword_100011CA0));
    uint64_t v14 = (void *)UIHostingController.init(rootView:)(v15);
    [v4 setRootViewController:v14];

    [v4 makeKeyAndVisible];
    sub_10000720C((uint64_t)v16);
  }

uint64_t sub_100007154(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100007190(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000071C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005A48(&qword_100011C98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000720C(uint64_t a1)
{
  uint64_t v2 = sub_100005A48(&qword_100011C98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000724C(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  _BYTE *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000725C()
{
  id v0 = [(id)objc_opt_self(TVISScreenSaverServiceController) sharedInstance];
  v23[3] = &type metadata for SceneDelegate.IdleScreenFeatureFlags;
  v23[4] = sub_100007DF4();
  LOBYTE(v23[0]) = 0;
  char v1 = isFeatureEnabled(_:)(v23);
  sub_100007E38(v23);
  if ((v1 & 1) == 0) {
    goto LABEL_10;
  }
  id v2 = [v0 currentConfiguration];
  if (!v2) {
    goto LABEL_10;
  }
  uint64_t v3 = v2;
  id v4 = [v2 activeScreenSaver];

  if (!v4) {
    goto LABEL_10;
  }
  uint64_t v5 = objc_opt_self(&OBJC_CLASS___TVISMemoryScreenSaver);
  uint64_t v6 = swift_dynamicCastObjCClass(v4, v5);
  if (!v6)
  {
    swift_unknownObjectRelease(v4);
LABEL_10:

    return 0LL;
  }

  id v7 = (void *)v6;
  swift_unknownObjectRetain(v4);
  id v8 = [v7 memories];
  uint64_t v9 = sub_100007E98(0LL, (unint64_t *)&unk_100011CE0, &OBJC_CLASS___TVISMemoryMemory_ptr);
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);

  if ((unint64_t)v10 >> 62)
  {
    if (v10 < 0) {
      uint64_t v22 = v10;
    }
    else {
      uint64_t v22 = v10 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v10);
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v22);
    swift_bridgeObjectRelease(v10);
  }

  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v12 = swift_bridgeObjectRelease(v10);
  if (v11 >= 1)
  {

    swift_unknownObjectRelease_n(v4, 2LL);
    return 1LL;
  }

  uint64_t v14 = static os_log_type_t.default.getter(v12);
  uint64_t v15 = sub_100005A48(&qword_100011BD0);
  uint64_t v16 = swift_allocObject(v15, 112LL, 7LL);
  *(_OWORD *)(v16 + 16) = xmmword_100009300;
  *(void *)(v16 + 56) = &type metadata for String;
  unint64_t v17 = sub_1000060A4();
  *(void *)(v16 + 64) = v17;
  *(void *)(v16 + 32) = 0xD000000000000024LL;
  *(void *)(v16 + 40) = 0x80000001000097C0LL;
  v23[0] = [v4 type];
  type metadata accessor for TVISScreenSaverType(0LL);
  uint64_t v19 = String.init<A>(describing:)(v23, v18);
  *(void *)(v16 + 96) = &type metadata for String;
  *(void *)(v16 + 104) = v17;
  *(void *)(v16 + 72) = v19;
  *(void *)(v16 + 80) = v20;
  sub_100007E98(0LL, (unint64_t *)&qword_100011BE0, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v21 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)( v14,  &_mh_execute_header,  v21,  "%s - TV Screen Saver type: %{public}@ has no memories.  Defaulting active screen saver type to Aerials",  102LL,  2LL,  v16);
  swift_bridgeObjectRelease(v16);

  swift_unknownObjectRelease_n(v4, 2LL);
  return 0LL;
}

void sub_100007504(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for ScreenSaverActivationReason(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v60 - v13;
  uint64_t v15 = objc_opt_self(&OBJC_CLASS___UIWindowScene);
  uint64_t v16 = swift_dynamicCastObjCClass(a1, v15);
  if (v16)
  {
    id v61 = a2;
    v62 = v7;
    uint64_t v63 = v16;
    uint64_t v17 = qword_100011A38;
    id v64 = a1;
    if (v17 != -1) {
      swift_once(&qword_100011A38, sub_100008448);
    }
    uint64_t v18 = type metadata accessor for OSSignposter(0LL);
    sub_100005A88(v18, (uint64_t)qword_100011EA0);
    uint64_t v19 = static OSSignpostID.exclusive.getter();
    uint64_t v20 = (os_log_s *)OSSignposter.logHandle.getter(v19);
    os_signpost_type_t v21 = static os_signpost_type_t.begin.getter();
    if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
    {
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
      v22(v12, v14, v8);
      uint64_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      uint64_t v60 = v5;
      uint64_t v24 = v4;
      uint64_t v25 = v23;
      *(_WORD *)uint64_t v23 = 0;
      os_signpost_id_t v26 = OSSignpostID.rawValue.getter();
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, v21, v26, "StartScreenSaver", "", v25, 2u);
      uint64_t v27 = v25;
      uint64_t v4 = v24;
      uint64_t v5 = v60;
      swift_slowDealloc(v27, -1LL, -1LL);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }

    else
    {

      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    }

    v22(v12, v14, v8);
    uint64_t v28 = type metadata accessor for OSSignpostIntervalState(0LL);
    swift_allocObject(v28, *(unsigned int *)(v28 + 48), *(unsigned __int16 *)(v28 + 52));
    uint64_t v29 = OSSignpostIntervalState.init(id:isOpen:)(v12, 1LL);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    uint64_t v30 = v65;
    uint64_t v31 = *(void *)(v65 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_startingSignpostIntervalState);
    *(void *)(v65 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_startingSignpostIntervalState) = v29;
    swift_release(v31);
    id v32 = objc_msgSend(v61, "pbui_screenSaverActivationContext");
    uint64_t v33 = v32;
    if (v32)
    {
      id v34 = [v32 activationReason];
      id v35 = [v33 previewPosterBundleID];
      char v36 = v62;
      if (v35)
      {
        uint64_t v37 = v35;
        uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
        uint64_t v40 = v39;
      }

      else
      {
        uint64_t v38 = 0LL;
        uint64_t v40 = 0LL;
      }

      uint64_t v45 = v64;
    }

    else
    {
      char v36 = v62;
      if (qword_100011A40 != -1) {
        swift_once(&qword_100011A40, sub_100008508);
      }
      uint64_t v41 = type metadata accessor for Logger(0LL);
      sub_100005A88(v41, (uint64_t)qword_100011EB8);
      id v42 = (os_log_s *)Logger.logObject.getter();
      os_log_type_t v43 = static os_log_type_t.error.getter();
      BOOL v44 = os_log_type_enabled(v42, v43);
      uint64_t v45 = v64;
      if (v44)
      {
        uint64_t v46 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v46 = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "Did not get a screen saver activation context.", v46, 2u);
        swift_slowDealloc(v46, -1LL, -1LL);
      }

      uint64_t v38 = 0LL;
      uint64_t v40 = 0LL;
      id v34 = 0LL;
    }

    sub_100008570((uint64_t)v34, v38, v40, v36);
    uint64_t v47 = (void *)sub_10000626C((uint64_t)v36);
    (*(void (**)(void *, uint64_t))(v5 + 8))(v36, v4);
    uint64_t v48 = *(void *)(v30 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_sceneObserver);
    if (v48)
    {
      uint64_t v49 = *(void *)(v30 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_sceneObserver + 8);
      int v50 = (objc_class *)type metadata accessor for IdleScreenSceneComponent();
      uint64_t v51 = (char *)objc_allocWithZone(v50);
      *(void *)&v51[OBJC_IVAR____TtC10IdleScreen24IdleScreenSceneComponent_delegate + 8] = 0LL;
      swift_unknownObjectWeakInit();
      *(void *)&v51[OBJC_IVAR____TtC10IdleScreen24IdleScreenSceneComponent_scene] = v45;
      v66.receiver = v51;
      v66.super_class = v50;
      id v52 = v45;
      swift_unknownObjectRetain(v48);
      uint64_t v53 = (char *)objc_msgSendSuper2(&v66, "init");

      *(void *)&v53[OBJC_IVAR____TtC10IdleScreen24IdleScreenSceneComponent_delegate + 8] = v49;
      swift_unknownObjectWeakAssign();
      uint64_t v54 = qword_100011A30;
      id v55 = v53;
      if (v54 != -1) {
        swift_once(&qword_100011A30, sub_100004E54);
      }
      [v52 _registerSceneComponent:v55 forKey:qword_100011E98];
      swift_unknownObjectRelease(v48);
    }

    id v56 = objc_allocWithZone(&OBJC_CLASS___UIWindow);
    id v57 = [v56 initWithWindowScene:v63];
    [v57 setRootViewController:v47];
    v58 = *(void **)(v30 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_window);
    *(void *)(v30 + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_window) = v57;
    id v59 = v57;

    [v59 makeKeyAndVisible];
  }

void sub_100007A40(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v6 = a1;
    }
    else {
      uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_100005A48(&qword_100011CC0);
      uint64_t v4 = (void *)static _SetStorage.allocate(capacity:)(v3);
      if (!v2) {
        goto LABEL_4;
      }
LABEL_11:
      if (v1 < 0) {
        uint64_t v7 = v1;
      }
      else {
        uint64_t v7 = v1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v1);
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v7);
      swift_bridgeObjectRelease(v1);
      if (!v5) {
        return;
      }
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
  }

  uint64_t v4 = &_swiftEmptySetSingleton;
  if (v2) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v5) {
    return;
  }
LABEL_15:
  uint64_t v8 = (char *)(v4 + 7);
  uint64_t v45 = v5;
  if ((v1 & 0xC000000000000001LL) != 0)
  {
    uint64_t v9 = 0LL;
    uint64_t v43 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v1);
        BOOL v11 = __OFADD__(v9++, 1LL);
        if (v11)
        {
          __break(1u);
          goto LABEL_42;
        }

        uint64_t v12 = v10;
        Swift::Int v13 = NSObject._rawHashValue(seed:)(v4[5]);
        uint64_t v14 = -1LL << *((_BYTE *)v4 + 32);
        unint64_t v15 = v13 & ~v14;
        unint64_t v16 = v15 >> 6;
        uint64_t v17 = *(void *)&v8[8 * (v15 >> 6)];
        uint64_t v18 = 1LL << v15;
        if (((1LL << v15) & v17) != 0) {
          break;
        }
LABEL_26:
        *(void *)&v8[8 * v16] = v18 | v17;
        *(void *)(v4[6] + 8 * v15) = v12;
        uint64_t v24 = v4[2];
        BOOL v11 = __OFADD__(v24, 1LL);
        uint64_t v25 = v24 + 1;
        if (v11) {
          goto LABEL_43;
        }
        v4[2] = v25;
        if (v9 == v5) {
          return;
        }
      }

      sub_100007E98(0LL, &qword_100011CB0, &OBJC_CLASS___BSAction_ptr);
      id v19 = *(id *)(v4[6] + 8 * v15);
      char v20 = static NSObject.== infix(_:_:)();

      if ((v20 & 1) == 0)
      {
        uint64_t v21 = ~v14;
        while (1)
        {
          unint64_t v15 = (v15 + 1) & v21;
          unint64_t v16 = v15 >> 6;
          uint64_t v17 = *(void *)&v8[8 * (v15 >> 6)];
          uint64_t v18 = 1LL << v15;
          if ((v17 & (1LL << v15)) == 0) {
            break;
          }
          id v22 = *(id *)(v4[6] + 8 * v15);
          char v23 = static NSObject.== infix(_:_:)();

          if ((v23 & 1) != 0) {
            goto LABEL_17;
          }
        }

        uint64_t v1 = v43;
        uint64_t v5 = v45;
        goto LABEL_26;
      }

LABEL_17:
      swift_unknownObjectRelease(v12);
      uint64_t v1 = v43;
      uint64_t v5 = v45;
      if (v9 == v45) {
        return;
      }
    }
  }

  uint64_t v26 = 0LL;
  uint64_t v42 = v1 + 32;
  uint64_t v44 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (v26 != v44)
  {
    Swift::Int v27 = v4[5];
    id v28 = *(id *)(v42 + 8 * v26);
    Swift::Int v29 = NSObject._rawHashValue(seed:)(v27);
    uint64_t v30 = -1LL << *((_BYTE *)v4 + 32);
    unint64_t v31 = v29 & ~v30;
    unint64_t v32 = v31 >> 6;
    uint64_t v33 = *(void *)&v8[8 * (v31 >> 6)];
    uint64_t v34 = 1LL << v31;
    if (((1LL << v31) & v33) != 0)
    {
      sub_100007E98(0LL, &qword_100011CB0, &OBJC_CLASS___BSAction_ptr);
      id v35 = *(id *)(v4[6] + 8 * v31);
      char v36 = static NSObject.== infix(_:_:)();

      if ((v36 & 1) != 0)
      {
LABEL_30:

        goto LABEL_31;
      }

      uint64_t v37 = ~v30;
      while (1)
      {
        unint64_t v31 = (v31 + 1) & v37;
        unint64_t v32 = v31 >> 6;
        uint64_t v33 = *(void *)&v8[8 * (v31 >> 6)];
        uint64_t v34 = 1LL << v31;
        if ((v33 & (1LL << v31)) == 0) {
          break;
        }
        id v38 = *(id *)(v4[6] + 8 * v31);
        char v39 = static NSObject.== infix(_:_:)();

        if ((v39 & 1) != 0) {
          goto LABEL_30;
        }
      }
    }

    *(void *)&v8[8 * v32] = v34 | v33;
    *(void *)(v4[6] + 8 * v31) = v28;
    uint64_t v40 = v4[2];
    BOOL v11 = __OFADD__(v40, 1LL);
    uint64_t v41 = v40 + 1;
    if (v11) {
      goto LABEL_44;
    }
    v4[2] = v41;
LABEL_31:
    if (++v26 == v45) {
      return;
    }
  }

  uint64_t v6 = *a1;
  uint64_t v7 = v6 >= 2;
  uint64_t v8 = v6 - 2;
  if (!v7) {
    uint64_t v8 = -1;
  }
  return (v8 + 1);
}

LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
}

unint64_t sub_100007D9C()
{
  unint64_t result = qword_100011CB8;
  if (!qword_100011CB8)
  {
    uint64_t v1 = sub_100007E98(255LL, &qword_100011CB0, &OBJC_CLASS___BSAction_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100011CB8);
  }

  return result;
}

unint64_t sub_100007DF4()
{
  unint64_t result = qword_100011CC8;
  if (!qword_100011CC8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100009410, &type metadata for SceneDelegate.IdleScreenFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_100011CC8);
  }

  return result;
}

uint64_t sub_100007E38(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100007E58(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = a3(a2);
    uint64_t result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100007E98(uint64_t a1, unint64_t *a2, void *a3)
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

_BYTE *initializeBufferWithCopyOfBuffer for SceneDelegate.IdleScreenFeatureFlags(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SceneDelegate.IdleScreenFeatureFlags( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

uint64_t storeEnumTagSinglePayload for SceneDelegate.IdleScreenFeatureFlags( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_100007FBC + 4 * byte_100009325[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100007FF0 + 4 * byte_100009320[v4]))();
}

uint64_t sub_100007FF0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007FF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100008000LL);
  }
  return result;
}

uint64_t sub_10000800C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100008014LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_100008018(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008020(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000802C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100008038(_BYTE *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SceneDelegate.IdleScreenFeatureFlags()
{
  return &type metadata for SceneDelegate.IdleScreenFeatureFlags;
}

unint64_t sub_100008058()
{
  unint64_t result = qword_100011D00;
  if (!qword_100011D00)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000093E8, &type metadata for SceneDelegate.IdleScreenFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_100011D00);
  }

  return result;
}

id sub_100008328()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for AppDelegate();
  uint64_t v4 = static CommandLine.unsafeArgv.getter();
  uint64_t v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  uint64_t v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  int v8 = NSStringFromClass(ObjCClassFromMetadata);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  uint64_t v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0LL, 0LL, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC10IdleScreen11AppDelegate);
}

unint64_t sub_100008400()
{
  unint64_t result = qword_100011B58;
  if (!qword_100011B58)
  {
    type metadata accessor for LaunchOptionsKey(255LL);
    unint64_t result = swift_getWitnessTable(&unk_1000092AC, v1);
    atomic_store(result, (unint64_t *)&qword_100011B58);
  }

  return result;
}

uint64_t sub_100008448()
{
  uint64_t v0 = type metadata accessor for OSSignposter(0LL);
  sub_1000084C8(v0, qword_100011EA0);
  sub_100005A88(v0, (uint64_t)qword_100011EA0);
  return OSSignposter.init(subsystem:category:)( 0xD000000000000021LL,  0x8000000100009870LL,  0xD000000000000015LL,  0x80000001000098A0LL);
}

uint64_t *sub_1000084C8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100008508()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1000084C8(v0, qword_100011EB8);
  sub_100005A88(v0, (uint64_t)qword_100011EB8);
  return Logger.init(subsystem:category:)(0xD000000000000014LL, 0x80000001000098C0LL, 0LL, 0xE000000000000000LL);
}

uint64_t sub_100008570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  switch(a1)
  {
    case 0LL:
      swift_bridgeObjectRelease(a3);
      uint64_t v5 = (unsigned int *)&enum case for ScreenSaverActivationReason.systemIdle(_:);
      goto LABEL_13;
    case 1LL:
      swift_bridgeObjectRelease(a3);
      goto LABEL_12;
    case 2LL:
      swift_bridgeObjectRelease(a3);
      uint64_t v5 = (unsigned int *)&enum case for ScreenSaverActivationReason.walkThrough(_:);
      goto LABEL_13;
    case 3LL:
      if (a3)
      {
        *a4 = a2;
        a4[1] = a3;
        uint64_t v5 = (unsigned int *)&enum case for ScreenSaverActivationReason.posterPreview(_:);
      }

      else
      {
        if (qword_100011A40 != -1) {
          swift_once(&qword_100011A40, sub_100008508);
        }
        uint64_t v6 = type metadata accessor for Logger(0LL);
        sub_100005A88(v6, (uint64_t)qword_100011EB8);
        BOOL v7 = (os_log_s *)Logger.logObject.getter();
        os_log_type_t v8 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v7, v8))
        {
          uint64_t v9 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, v8, "No PosterBundleID provided for poster previewing.", v9, 2u);
          swift_slowDealloc(v9, -1LL, -1LL);
        }

LABEL_12:
        uint64_t v5 = (unsigned int *)&enum case for ScreenSaverActivationReason.userAction(_:);
      }

LABEL_13:
      uint64_t v10 = *v5;
      uint64_t v11 = type metadata accessor for ScreenSaverActivationReason(0LL);
      return (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104LL))(a4, v10, v11);
    default:
      uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000003CLL,  0x80000001000098E0LL,  "IdleScreen/ScreenSaverActivationReason+IdleScreen.swift",  55LL,  2LL,  29LL,  0);
      __break(1u);
      return result;
  }

uint64_t sub_100008724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  uint64_t v5 = type metadata accessor for MainActor(0LL);
  *(void *)(v4 + 24) = static MainActor.shared.getter(v5);
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_100008790, v6, v7);
}

uint64_t sub_100008790()
{
  uint64_t v1 = swift_release(*(void *)(v0 + 24));
  dispatch thunk of HostingViewModel.hostWillBackground()(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000087C4()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC10IdleScreenP33_58D3B07E2BACD4E4F49A4A6453FD74EF19ResourceBundleClass);
}
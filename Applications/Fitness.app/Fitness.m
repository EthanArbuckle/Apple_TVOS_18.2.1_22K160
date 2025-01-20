id sub_100003C10()
{
  void *v0;
  objc_super v2;
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
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0LL, 0LL, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC7Fitness11AppDelegate);
}

id sub_100003CE8(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin();
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Log.default.getter(v4);
  id v7 = a1;
  v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v26 = v2;
    uint64_t v10 = swift_slowAlloc(12LL, -1LL);
    uint64_t v25 = v3;
    uint64_t v11 = (uint8_t *)v10;
    v12 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v11 = 138543362;
    id v27 = v7;
    id v13 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v11 + 4, v11 + 12);
    void *v12 = v7;

    uint64_t v2 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "Returning scene configuration for Application with options: %{public}@",  v11,  0xCu);
    uint64_t v14 = sub_100003F84((uint64_t *)&unk_10000D1B0);
    swift_arrayDestroy(v12, 1LL, v14);
    swift_slowDealloc(v12, -1LL, -1LL);
    v15 = v11;
    uint64_t v3 = v25;
    swift_slowDealloc(v15, -1LL, -1LL);
  }

  else
  {

    v8 = (os_log_s *)v7;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v16 = (void *)UIWindowSceneSessionRoleApplication;
  id v17 = objc_allocWithZone(&OBJC_CLASS___UISceneConfiguration);
  id v18 = v16;
  NSString v19 = String._bridgeToObjectiveC()();
  id v20 = [v17 initWithName:v19 sessionRole:v18];

  unint64_t v21 = sub_100003F48();
  [v20 setSceneClass:swift_getObjCClassFromMetadata(v21)];
  uint64_t v22 = type metadata accessor for SceneDelegate();
  [v20 setDelegateClass:swift_getObjCClassFromMetadata(v22)];
  return v20;
}

unint64_t sub_100003F48()
{
  unint64_t result = qword_10000D1A8;
  if (!qword_10000D1A8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___UIWindowScene);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000D1A8);
  }

  return result;
}

uint64_t sub_100003F84(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100004008()
{
  uint64_t v0 = type metadata accessor for UserDefaultsKeys(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_100003F84(&qword_10000D300);
  sub_10000582C(v4, qword_10000D220);
  sub_1000057CC(v4, (uint64_t)qword_10000D220);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))( v3,  enum case for UserDefaultsKeys.personalizedExperienceEnabled(_:),  v0);
  type metadata accessor for AppCoordinator(0LL);
  char v7 = static AppCoordinator.isEligible.getter() & 1;
  return TestProperty.init(_:fallback:)( v3,  &v7,  &type metadata for Bool,  &protocol witness table for Bool,  &protocol witness table for Bool);
}

void sub_1000040FC()
{
  uint64_t v1 = sub_100003F84(&qword_10000D300);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)&v0[OBJC_IVAR____TtC7Fitness13SceneDelegate_window] = 0LL;
  type metadata accessor for Dependencies(0LL);
  sub_100005794(0LL, &qword_10000D308, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v5 = v0;
  uint64_t v6 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v7 = static Dependencies.remoteBrowsing(queue:)();

  if (qword_10000D110 != -1) {
    swift_once(&qword_10000D110, sub_100004008);
  }
  uint64_t v8 = sub_1000057CC(v1, (uint64_t)qword_10000D220);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v8, v1);
  TestProperty.wrappedValue.getter(&v34, v1);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if (v34 == 1)
  {
    uint64_t v9 = type metadata accessor for AppSceneCoordinator(0LL);
    swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
    uint64_t v10 = swift_retain(v7);
    uint64_t v11 = AppSceneCoordinator.init(dependencies:)(v10);
    v12 = (void *)sub_1000057E4();
  }

  else
  {
    uint64_t v13 = type metadata accessor for TVSceneCoordinator(0LL);
    swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
    uint64_t v14 = swift_retain(v7);
    uint64_t v11 = TVSceneCoordinator.init(dependencies:)(v14);
    v12 = &protocol witness table for TVSceneCoordinator;
  }

  v15 = (uint64_t *)&v5[OBJC_IVAR____TtC7Fitness13SceneDelegate_coordinator];
  uint64_t *v15 = v11;
  v15[1] = (uint64_t)v12;

  v16 = (objc_class *)type metadata accessor for SceneDelegate();
  v33.receiver = v5;
  v33.super_class = v16;
  id v17 = (char *)objc_msgSendSuper2(&v33, "init");
  id v18 = &v17[OBJC_IVAR____TtC7Fitness13SceneDelegate_coordinator];
  uint64_t v19 = *(void *)&v17[OBJC_IVAR____TtC7Fitness13SceneDelegate_coordinator];
  uint64_t v20 = *(void *)&v17[OBJC_IVAR____TtC7Fitness13SceneDelegate_coordinator + 8];
  uint64_t ObjectType = swift_getObjectType(v19);
  uint64_t v22 = v17;
  swift_unknownObjectRetain(v19);
  dispatch thunk of SceneCoordinating.onRequestApplicationTermination.setter(sub_1000043F4, 0LL, ObjectType, v20);
  swift_unknownObjectRelease(v19, v23);
  uint64_t v24 = *(void *)v18;
  uint64_t v25 = *((void *)v18 + 1);
  uint64_t v26 = swift_getObjectType(*(void *)v18);
  swift_unknownObjectRetain(v24);
  dispatch thunk of SceneCoordinating.onRequestApplicationDeactivation.setter(sub_100004510, 0LL, v26, v25);
  swift_unknownObjectRelease(v24, v27);
  uint64_t v28 = (void *)objc_opt_self(&OBJC_CLASS___UIApplication);
  id v29 = [v28 sharedApplication];
  [v29 _setIdleModeVisualEffectsEnabled:1];

  id v30 = [v28 sharedApplication];
  id v31 = [v30 _idleModeController];

  if (v31)
  {
    [v31 setStyle:1];
    swift_release(v7);
  }

  else
  {
    __break(1u);
  }
}

void sub_1000043F4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin();
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = static Log.default.getter(v2);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Application termination requested", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  id v9 = [(id)objc_opt_self(UIApplication) sharedApplication];
  [v9 terminateWithSuccess];
}

void sub_100004510()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin();
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = static Log.default.getter(v2);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Application deactivation requested", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  id v9 = [(id)objc_opt_self(PBSSystemService) sharedInstance];
  if (v9)
  {
    uint64_t v10 = v9;
    [v9 deactivateApplication];
  }

  else
  {
    __break(1u);
  }

uint64_t sub_100004654(void *a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin();
  v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Log.default.getter(v10);
  id v13 = a3;
  uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  id v52 = v13;
  if (v16)
  {
    v49 = a1;
    uint64_t v17 = swift_slowAlloc(12LL, -1LL);
    uint64_t v48 = v8;
    id v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc(8LL, -1LL);
    uint64_t v51 = v4;
    v47 = (void *)v19;
    v50 = a2;
    *(_DWORD *)id v18 = 138543362;
    id v53 = v13;
    id v20 = v13;
    a1 = v49;
    a2 = v50;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54, v18 + 4, v18 + 12);
    unint64_t v21 = v47;
    void *v47 = v13;

    _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "Main application scene connected with options: %{public}@",  v18,  0xCu);
    uint64_t v22 = sub_100003F84((uint64_t *)&unk_10000D1B0);
    swift_arrayDestroy(v21, 1LL, v22);
    uint64_t v23 = v21;
    uint64_t v4 = v51;
    swift_slowDealloc(v23, -1LL, -1LL);
    uint64_t v24 = v18;
    uint64_t v8 = v48;
    swift_slowDealloc(v24, -1LL, -1LL);
  }

  else
  {

    uint64_t v14 = (os_log_s *)v13;
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  uint64_t v25 = objc_opt_self(&OBJC_CLASS___UIWindowScene);
  uint64_t result = swift_dynamicCastObjCClass(a1, v25);
  if (result)
  {
    uint64_t v27 = (void *)result;
    id v28 = objc_allocWithZone(&OBJC_CLASS___UIWindow);
    id v29 = a1;
    id v30 = [v28 initWithWindowScene:v27];
    id v31 = [v27 coordinateSpace];
    [v31 bounds];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    swift_unknownObjectRelease(v31, v40);
    objc_msgSend(v30, "setFrame:", v33, v35, v37, v39);

    [v30 makeKeyAndVisible];
    v41 = *(void **)(v4 + OBJC_IVAR____TtC7Fitness13SceneDelegate_window);
    *(void *)(v4 + OBJC_IVAR____TtC7Fitness13SceneDelegate_window) = v30;
    id v42 = v30;

    uint64_t v43 = *(void *)(v4 + OBJC_IVAR____TtC7Fitness13SceneDelegate_coordinator + 8);
    uint64_t ObjectType = swift_getObjectType(*(void *)(v4 + OBJC_IVAR____TtC7Fitness13SceneDelegate_coordinator));
    v54[2] = sub_100005794(0LL, (unint64_t *)&unk_10000D2D0, &OBJC_CLASS___UISceneSession_ptr);
    v54[3] = &protocol witness table for UISceneSession;
    id v53 = a2;
    id v45 = a2;
    dispatch thunk of SceneCoordinating.scene(_:with:willConnectTo:options:)(v27, v42, &v53, v52, ObjectType, v43);

    return sub_100005734(&v53);
  }

  return result;
}

void sub_100004C1C(char *a1, uint64_t a2, void *a3, void (*a4)(id, uint64_t, uint64_t))
{
  uint64_t v7 = *(void *)&a1[OBJC_IVAR____TtC7Fitness13SceneDelegate_coordinator + 8];
  uint64_t ObjectType = swift_getObjectType(*(void *)&a1[OBJC_IVAR____TtC7Fitness13SceneDelegate_coordinator]);
  id v9 = a3;
  uint64_t v10 = a1;
  a4(v9, ObjectType, v7);
}

id sub_100004CA8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC7Fitness13SceneDelegate);
}

uint64_t sub_100004D30(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100004E00(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005754((uint64_t)v12, *a3);
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
      sub_100005754((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100005734(v12);
  return v7;
}

uint64_t sub_100004E00(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_100004FB8(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

uint64_t sub_100004FB8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000504C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005224(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005224(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000504C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_1000051C0(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_1000051C0(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100003F84(&qword_10000D2F8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100005224(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100003F84(&qword_10000D2F8);
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
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

unint64_t sub_100005378()
{
  unint64_t result = qword_10000D2F0;
  if (!qword_10000D2F0)
  {
    uint64_t v1 = sub_100005794(255LL, &qword_10000D2E8, &OBJC_CLASS___UIOpenURLContext_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10000D2F0);
  }

  return result;
}

uint64_t sub_1000053D0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100003F84(&qword_10000D2E0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin();
  size_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Log.default.getter(v10);
  uint64_t v13 = swift_bridgeObjectRetain_n(a1, 2LL);
  int v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v41 = v2;
    uint64_t v16 = swift_slowAlloc(12LL, -1LL);
    uint64_t v43 = v4;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc(32LL, -1LL);
    uint64_t v40 = v9;
    uint64_t v19 = v18;
    uint64_t v45 = v18;
    uint64_t v39 = v8;
    *(_DWORD *)uint64_t v17 = 136446210;
    double v38 = v17 + 4;
    uint64_t v20 = sub_100005794(0LL, &qword_10000D2E8, &OBJC_CLASS___UIOpenURLContext_ptr);
    unint64_t v21 = sub_100005378();
    uint64_t v42 = v5;
    unint64_t v22 = v21;
    uint64_t v23 = swift_bridgeObjectRetain(a1);
    uint64_t v24 = Set.description.getter(v23, v20, v22);
    unint64_t v26 = v25;
    swift_bridgeObjectRelease(a1);
    uint64_t v27 = v24;
    uint64_t v2 = v41;
    uint64_t v44 = sub_100004D30(v27, v26, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v38, v17 + 12);
    swift_bridgeObjectRelease_n(a1, 2LL);
    unint64_t v28 = v26;
    uint64_t v5 = v42;
    swift_bridgeObjectRelease(v28);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Main application openURL called for: %{public}s", v17, 0xCu);
    swift_arrayDestroy(v19, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1LL, -1LL);
    id v29 = v17;
    uint64_t v4 = v43;
    swift_slowDealloc(v29, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v39);
  }

  else
  {

    swift_bridgeObjectRelease_n(a1, 2LL);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }

  uint64_t v31 = *(void *)(v2 + OBJC_IVAR____TtC7Fitness13SceneDelegate_coordinator);
  uint64_t v30 = *(void *)(v2 + OBJC_IVAR____TtC7Fitness13SceneDelegate_coordinator + 8);
  uint64_t ObjectType = swift_getObjectType(v31);
  SceneCoordinating.openURLContexts(_:)(a1, ObjectType, v30);
  double v33 = (void (*)(uint64_t (*)(uint64_t), uint64_t))Promise.operation.getter(v4);
  uint64_t v35 = v34;
  uint64_t v36 = swift_allocObject(&unk_100008530, 32LL, 7LL);
  *(void *)(v36 + 16) = 0LL;
  *(void *)(v36 + 24) = 0LL;
  v33(sub_100005374, v36);
  swift_release(v35);
  swift_release(v36);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000056C8()
{
  if (*(void *)(v0 + 16)) {
    swift_release(*(void *)(v0 + 24));
  }
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000056F4(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  char v3 = *(_BYTE *)(result + 8);
  uint64_t v4 = *(void *)result;
  char v5 = v3;
  if (v2) {
    return v2(&v4);
  }
  return result;
}

uint64_t sub_100005734(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005754(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005794(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_1000057CC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_1000057E4()
{
  unint64_t result = qword_10000D310;
  if (!qword_10000D310)
  {
    uint64_t v1 = type metadata accessor for AppSceneCoordinator(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for AppSceneCoordinator, v1);
    atomic_store(result, (unint64_t *)&qword_10000D310);
  }

  return result;
}

uint64_t *sub_10000582C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000586C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC7FitnessP33_B652E8A4A20B36E233E9C88E75379E8819ResourceBundleClass);
}
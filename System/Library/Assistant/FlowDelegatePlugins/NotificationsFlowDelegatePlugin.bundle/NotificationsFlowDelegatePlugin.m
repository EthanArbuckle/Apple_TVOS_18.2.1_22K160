uint64_t sub_2324()
{
  uint64_t v0;
  uint64_t v1;
  v1 = swift_allocObject(v0, 16LL, 7LL);
  sub_2358();
  return v1;
}

uint64_t sub_2358()
{
  uint64_t v1 = type metadata accessor for NotificationsFlowProvider(0LL);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v1);
  id v3 = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  static CATExecutor.registerBundle(bundle:)();

  return v0;
}

uint64_t sub_23CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v3 = type metadata accessor for FlowSearchResult(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v36 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  v8 = (char *)&v33 - v7;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v14 = static AceService.currentAsync.getter(v42, v11);
  v15 = static Device.current.getter(v41, v14);
  v16 = static OutputPublisherFactory.makeOutputPublisherAsync()(&v39, v15);
  uint64_t v17 = *(void *)NotificationsFeatureFlags.shared.unsafeMutableAddressor(v16);
  uint64_t v18 = type metadata accessor for NotificationsFlowProvider(0LL);
  swift_allocObject(v18, 184LL, 7LL);
  uint64_t v19 = NotificationsFlowProvider.init(aceServiceInvoker:deviceState:outputPublisher:featureFlags:)(v42, v41, &v39, v17);
  v20 = *(void (**)(uint64_t))(*(void *)v19 + 104LL);
  swift_retain(v17);
  v20(v38);
  swift_release(v19);
  uint64_t v21 = sub_30D0();
  swift_beginAccess(v21, v42, 0LL, 0LL);
  uint64_t v38 = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v21, v9);
  uint64_t v37 = v4;
  v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v23 = v22(v8, a2, v3);
  v24 = (os_log_s *)Logger.logObject.getter(v23);
  os_log_type_t v25 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v27 = swift_slowAlloc(32LL, -1LL);
    v41[0] = v27;
    uint64_t v35 = v9;
    *(_DWORD *)v26 = 136315138;
    v34 = v26 + 4;
    v28 = v36;
    v22(v36, (uint64_t)v8, v3);
    uint64_t v29 = String.init<A>(describing:)(v28, v3);
    unint64_t v31 = v30;
    uint64_t v39 = sub_2718(v29, v30, v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v34, v26 + 12);
    swift_bridgeObjectRelease(v31);
    sub_2F80();
    _os_log_impl(&dword_0, v24, v25, "NotificationsFlowDelegatePlugin findFlowForX | flowSearchResult: %s", v26, 0xCu);
    swift_arrayDestroy(v27, 1LL, (char *)&type metadata for Any + 8);
    sub_2F94(v27);
    sub_2F94((uint64_t)v26);

    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v13, v35);
  }

  else
  {
    sub_2F80();

    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v13, v9);
  }
}

uint64_t sub_269C()
{
  return v0;
}

uint64_t sub_26A4()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t sub_26B4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88LL))();
}

uint64_t sub_26DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 80))();
  *a1 = result;
  return result;
}

uint64_t sub_2718(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_27E8(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2F00((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_2F00((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_2EE0(v12);
  return v7;
}

void *sub_27E8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_293C((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_2A00(a5, a6);
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
    return (void *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

void *sub_293C(char *__src, size_t __n, char *__dst)
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

void *sub_2A00(uint64_t a1, unint64_t a2)
{
  v2 = sub_2A94(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v2 = sub_2C68(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    v2 = sub_2C68((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_2A94(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_2C04(v4, 0LL);
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

void *sub_2C04(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_2F3C(&qword_8140);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_2C68(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_2F3C(&qword_8140);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  v13 = v11 + 32;
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2E00(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_2D3C(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_2D3C(char *__src, size_t __n, char *__dst)
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

char *sub_2E00(char *__src, size_t __len, char *__dst)
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

unint64_t sub_2E84()
{
  unint64_t result = qword_8098;
  if (!qword_8098)
  {
    uint64_t v1 = type metadata accessor for NotificationsFlowDelegatePlugin();
    unint64_t result = swift_getWitnessTable(&unk_3920, v1);
    atomic_store(result, (unint64_t *)&qword_8098);
  }

  return result;
}

uint64_t type metadata accessor for NotificationsFlowDelegatePlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC31NotificationsFlowDelegatePlugin31NotificationsFlowDelegatePlugin);
}

uint64_t sub_2EE0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2F00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2F3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_2F80()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 224) + 8LL))(v1, v0);
}

uint64_t sub_2F94(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

void *sub_2FA0()
{
  return &unk_4380;
}

void *sub_2FAC()
{
  return &unk_4390;
}

void sub_2FB8()
{
  qword_8268 = OS_os_log.init(subsystem:category:)( 0xD00000000000001CLL,  0x8000000000003D90LL,  0xD000000000000018LL,  0x8000000000003E00LL);
  sub_35D4();
}

uint64_t *sub_3018()
{
  if (qword_8250 != -1) {
    swift_once(&qword_8250, sub_2FB8);
  }
  return &qword_8268;
}

void sub_3058()
{
  uint64_t v0 = sub_35BC();
  sub_356C(v0, qword_8270);
  sub_3114(v0, (uint64_t)qword_8270);
  if (qword_8250 != -1) {
    swift_once(&qword_8250, sub_2FB8);
  }
  Logger.init(_:)((id)qword_8268);
  sub_35D4();
}

uint64_t sub_30D0()
{
  if (qword_8258 != -1) {
    swift_once(&qword_8258, sub_3058);
  }
  uint64_t v0 = sub_35BC();
  return sub_3114(v0, (uint64_t)qword_8270);
}

uint64_t sub_3114(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_312C(uint64_t a1@<X8>)
{
  if (qword_8258 != -1) {
    swift_once(&qword_8258, sub_3058);
  }
  uint64_t v2 = sub_35BC();
  uint64_t v3 = sub_3114(v2, (uint64_t)qword_8270);
  sub_35F0(v3, (uint64_t)v4, 0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
  sub_35C4();
}

void sub_31B0(uint64_t a1)
{
  if (qword_8258 != -1) {
    swift_once(&qword_8258, sub_3058);
  }
  uint64_t v2 = sub_35BC();
  uint64_t v3 = sub_3114(v2, (uint64_t)qword_8270);
  sub_35F0(v3, (uint64_t)v5, 33LL);
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess(v5);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
  sub_35C4();
}

uint64_t (*sub_324C(uint64_t a1))(void)
{
  if (qword_8258 != -1) {
    swift_once(&qword_8258, sub_3058);
  }
  uint64_t v2 = sub_35BC();
  uint64_t v3 = sub_3114(v2, (uint64_t)qword_8270);
  sub_35F0(v3, a1, 33LL);
  return j__swift_endAccess;
}

void sub_32C0()
{
  qword_8288 = OS_os_log.init(subsystem:category:)( 0xD00000000000001CLL,  0x8000000000003D90LL,  0xD000000000000011LL,  0x8000000000003DB0LL);
  sub_35D4();
}

uint64_t *sub_3320()
{
  if (qword_8260 != -1) {
    swift_once(&qword_8260, sub_32C0);
  }
  return &qword_8288;
}

id sub_3360()
{
  if (qword_8260 != -1) {
    swift_once(&qword_8260, sub_32C0);
  }
  return (id)qword_8288;
}

uint64_t sub_33A0()
{
  if (qword_8260 != -1) {
    swift_once(&qword_8260, sub_32C0);
  }
  return OSSignpostID.init(log:)((id)qword_8288);
}

uint64_t sub_33F4()
{
  return 0LL;
}

uint64_t sub_33FC()
{
  if (qword_8260 != -1) {
    swift_once(&qword_8260, sub_32C0);
  }
  uint64_t v0 = OSSignpostID.init(log:)((id)qword_8288);
  static os_signpost_type_t.begin.getter(v0);
  sub_35DC();
  return sub_35AC();
}

uint64_t sub_347C()
{
  if (qword_8260 != -1) {
    swift_once(&qword_8260, sub_32C0);
  }
  sub_35DC();
  return sub_35AC();
}

char **sub_34F0()
{
  return &off_43A0;
}

const char *sub_34FC()
{
  return "AnnounceNotification.GetDuration";
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

ValueMetadata *type metadata accessor for SignPost()
{
  return &type metadata for SignPost;
}

unint64_t sub_3530()
{
  unint64_t result = qword_8148;
  if (!qword_8148)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_8148);
  }

  return result;
}

uint64_t *sub_356C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_35AC()
{
  return ((uint64_t (*)(void))os_signpost(_:dso:log:name:signpostID:))();
}

uint64_t sub_35BC()
{
  return type metadata accessor for Logger(0LL);
}

  ;
}

  ;
}

  ;
}

uint64_t sub_35F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0LL);
}
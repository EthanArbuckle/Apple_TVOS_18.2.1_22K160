int main(int argc, const char **argv, const char **envp)
{
  id v3;
  NSString v4;
  id v5;
  qword_1000087C0 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for XPCServiceDelegate()) init];
  v3 = objc_allocWithZone(&OBJC_CLASS___NSXPCListener);
  v4 = String._bridgeToObjectiveC()();
  v5 = [v3 initWithMachServiceName:v4];

  qword_1000087C8 = (uint64_t)v5;
  [v5 setDelegate:qword_1000087C0];
  [v5 resume];
  dispatch_main();
}

unint64_t sub_100001DC4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100002FC8(&qword_100008748);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (void *)v3;
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
    sub_10000312C(v7, (uint64_t)v16);
    unint64_t result = sub_100002704((uint64_t)v16);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v10 = v4[6] + 40 * result;
    __int128 v11 = v16[0];
    __int128 v12 = v16[1];
    *(void *)(v10 + 32) = v17;
    *(_OWORD *)uint64_t v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    unint64_t result = (unint64_t)sub_100003174(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 72LL;
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

uint64_t sub_100001FAC()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for XPCService()
{
  return objc_opt_self(&OBJC_CLASS____TtC18ReportSystemMemory10XPCService);
}

id sub_100002074()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for XPCServiceDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC18ReportSystemMemory18XPCServiceDelegate);
}

uint64_t sub_1000020C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100002194(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000030EC((uint64_t)v12, *a3);
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
      sub_1000030EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1000030CC(v12);
  return v7;
}

uint64_t sub_100002194(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000234C(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_10000234C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000023E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000025B8(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000025B8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000023E0(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_100002554(v4, 0LL);
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

void *sub_100002554(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100002FC8(&qword_100008740);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000025B8(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100002FC8(&qword_100008740);
    __int128 v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    __int128 v11 = (char *)&_swiftEmptyArrayStorage;
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

unint64_t sub_100002704(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_100002734(a1, v4);
}

unint64_t sub_100002734(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_100003184(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000031C0((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

void sub_1000027F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v40 - v12;
  if (a1)
  {
    uint64_t v43 = a1;
    swift_bridgeObjectRetain(a1);
    uint64_t v14 = sub_100002FC8(&qword_100008730);
    uint64_t v15 = sub_100002FC8(&qword_100008738);
    uint64_t v16 = swift_dynamicCast(&v42, &v43, v14, v15, 7LL);
    uint64_t v17 = v42;
    if (a2) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v23 = Logger.init()(v11);
    v24 = (os_log_s *)Logger.logObject.getter(v23);
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v40 = a3;
      v26 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v27 = swift_slowAlloc(32LL, -1LL);
      uint64_t v41 = v6;
      uint64_t v28 = v27;
      uint64_t v43 = v27;
      *(_DWORD *)v26 = 136315138;
      uint64_t v42 = sub_1000020C4(0x7263736564206F4ELL, 0xEE006E6F69747069LL, &v43);
      a3 = v40;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v26 + 4, v26 + 12);
      swift_bridgeObjectRelease(0LL);
      _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "Unable to represent visibility endowments as a set of NSNumbers: %s",  v26,  0xCu);
      swift_arrayDestroy(v28, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v29 = v28;
      uint64_t v6 = v41;
      swift_slowDealloc(v29, -1LL, -1LL);
      swift_slowDealloc(v26, -1LL, -1LL);
    }

    uint64_t v16 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    uint64_t v17 = 0LL;
    if (a2)
    {
LABEL_3:
      uint64_t v43 = a2;
      swift_bridgeObjectRetain(a2);
      uint64_t v18 = sub_100002FC8(&qword_100008730);
      uint64_t v19 = sub_100002FC8(&qword_100008738);
      swift_dynamicCast(&v42, &v43, v18, v19, 7LL);
      uint64_t v20 = v42;
      if (v17) {
        goto LABEL_4;
      }
LABEL_13:
      v21.super.Class isa = 0LL;
      if (v20) {
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }

  uint64_t v30 = Logger.init()(v16);
  v31 = (os_log_s *)Logger.logObject.getter(v30);
  os_log_type_t v32 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v34 = swift_slowAlloc(32LL, -1LL);
    uint64_t v43 = v34;
    uint64_t v41 = v6;
    *(_DWORD *)v33 = 136315138;
    uint64_t v42 = sub_1000020C4(0x7263736564206F4ELL, 0xEE006E6F69747069LL, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v33 + 4, v33 + 12);
    swift_bridgeObjectRelease(0LL);
    _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "Unable to represent audio assertions as a set of NSNumbers: %s",  v33,  0xCu);
    swift_arrayDestroy(v34, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1LL, -1LL);
    swift_slowDealloc(v33, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v41);
  }

  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }

  uint64_t v20 = 0LL;
  if (!v17) {
    goto LABEL_13;
  }
LABEL_4:
  sub_100003048();
  sub_100003084();
  v21.super.Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v17);
  if (v20)
  {
LABEL_5:
    sub_100003048();
    sub_100003084();
    v22.super.Class isa = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v20);
    goto LABEL_15;
  }

LABEL_14:
  v22.super.Class isa = 0LL;
LABEL_15:
  id v35 = [objc_allocWithZone(OSAJetsamReport) initWithIncidentID:0 visibilityEndowmentState:v21.super.isa audioAssertionState:v22.super.isa];

  [v35 acquireJetsamData];
  if (v35)
  {
    id v36 = v35;
    unint64_t v37 = sub_100001DC4((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v37);
    id v39 = [v36 saveWithOptions:isa];
  }

  else
  {
    id v39 = 0LL;
  }

  (*(void (**)(uint64_t, id))(a3 + 16))(a3, v39);
}

uint64_t sub_100002CE0(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [a1 valueForEntitlement:v6];

  if (v7)
  {
    _bridgeAnyObjectToAny(_:)(v19, v7);
    swift_unknownObjectRelease(v7);
  }

  else
  {
    memset(v19, 0, sizeof(v19));
  }

  sub_100002F80((uint64_t)v19, (uint64_t)&v20);
  if (*(void *)&v21[20])
  {
    uint64_t v8 = swift_dynamicCast(&v18, &v20, (char *)&type metadata for Any + 8, &type metadata for Bool, 6LL);
    if ((_DWORD)v8 && (v18 & 1) != 0)
    {
      id v9 =  [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:&OBJC_PROTOCOL____TtP18ReportSystemMemory29ReportSystemMemoryXPCProtocol_];
      [a1 setExportedInterface:v9];

      uint64_t v10 = type metadata accessor for XPCService();
      uint64_t v11 = swift_allocObject(v10, 16LL, 7LL);
      [a1 setExportedObject:v11];
      [a1 resume];
      swift_release(v11);
      return 1LL;
    }
  }

  else
  {
    uint64_t v8 = sub_100003008((uint64_t)&v20);
  }

  Logger.init()(v8);
  id v13 = a1;
  uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v16 = 67240192;
    unsigned int v20 = [v13 processIdentifier];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, v21, v16 + 4, v16 + 8);

    _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "Client %{public}d is not entitled to connect to ReportSystemMemory",  v16,  8u);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  else
  {

    uint64_t v14 = (os_log_s *)v13;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return 0LL;
}

uint64_t sub_100002F80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002FC8(&qword_100008718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100002FC8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100003008(uint64_t a1)
{
  uint64_t v2 = sub_100002FC8(&qword_100008718);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_100003048()
{
  unint64_t result = qword_100008720;
  if (!qword_100008720)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSNumber);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008720);
  }

  return result;
}

unint64_t sub_100003084()
{
  unint64_t result = qword_100008728;
  if (!qword_100008728)
  {
    unint64_t v1 = sub_100003048();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100008728);
  }

  return result;
}

uint64_t sub_1000030CC(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000030EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000312C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002FC8((uint64_t *)&unk_100008750);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100003174(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100003184(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000031C0(uint64_t a1)
{
  return a1;
}
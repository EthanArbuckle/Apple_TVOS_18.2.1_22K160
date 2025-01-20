uint64_t sub_100002180()
{
  return _set_user_dir_suffix("com.apple.usernotificationsd");
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v74 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v69 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin();
  v70 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v72 = *(void *)(v7 - 8);
  uint64_t v73 = v7;
  __chkstk_darwin();
  v71 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v66 = *(void *)(v9 - 8);
  uint64_t v67 = v9;
  __chkstk_darwin();
  v68 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v64 = *(void *)(v11 - 8);
  uint64_t v65 = v11;
  __chkstk_darwin();
  v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for UUID(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin();
  v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v18 = objc_autoreleasePoolPush();
  uint64_t v19 = sub_100002180();
  nullsub_1(v19);
  objc_autoreleasePoolPop(v18);
  uint64_t v20 = UUID.init()();
  uint64_t v21 = UUID.uuidString.getter(v20);
  unint64_t v23 = v22;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v24 = sub_100002FFC(5LL, v21, v23);
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v31 = swift_bridgeObjectRelease(v23);
  qword_100008050 = v24;
  *(void *)algn_100008058 = v26;
  qword_100008060 = v28;
  unk_100008068 = v30;
  uint64_t v32 = static Logger.daemon.getter(v31);
  v33 = (os_log_s *)Logger.logObject.getter(v32);
  os_log_type_t v34 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v36 = swift_slowAlloc(32LL, -1LL);
    uint64_t v62 = v36;
    *(_DWORD *)v35 = 136315138;
    aBlock[0] = v36;
    v61 = v35 + 4;
    uint64_t v63 = v3;
    uint64_t v37 = v4;
    uint64_t v38 = qword_100008050;
    uint64_t v39 = *(void *)algn_100008058;
    uint64_t v40 = qword_100008060;
    uint64_t v41 = unk_100008068;
    swift_bridgeObjectRetain(unk_100008068);
    uint64_t v42 = v39;
    uint64_t v4 = v37;
    uint64_t v43 = static String._fromSubstring(_:)(v38, v42, v40, v41);
    unint64_t v45 = v44;
    swift_bridgeObjectRelease(v41);
    uint64_t v75 = sub_1000029BC(v43, v45, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, aBlock, v61, v35 + 12);
    unint64_t v46 = v45;
    uint64_t v3 = v63;
    swift_bridgeObjectRelease(v46);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Starting usernotificationsd %s", v35, 0xCu);
    uint64_t v47 = v62;
    swift_arrayDestroy(v62, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v47, -1LL, -1LL);
    swift_slowDealloc(v35, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v64 + 8))(v13, v65);
  sub_100003108(0LL, &qword_100008008, &OBJC_CLASS___OS_dispatch_queue_ptr);
  v48 = v68;
  uint64_t v49 = (*(uint64_t (**)(char *, void, uint64_t))(v66 + 104))( v68,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v67);
  v50 = v71;
  static DispatchQoS.unspecified.getter(v49);
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  uint64_t v51 = sub_1000031B8( &qword_100008010,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v52 = sub_100003084(&qword_100008018);
  uint64_t v53 = sub_1000031F8(&qword_100008020, &qword_100008018);
  v54 = v70;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v52, v53, v69, v51);
  qword_100008070 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000001CLL,  0x8000000100003530LL,  v50,  v54,  v48,  0LL);
  v55 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(15, v55);
  sub_100003108(0LL, &qword_100008028, &OBJC_CLASS___OS_dispatch_source_ptr);
  qword_100008078 = static OS_dispatch_source.makeSignalSource(signal:queue:)(15LL, qword_100008070);
  uint64_t v56 = ((uint64_t (*)(void))swift_getObjectType)();
  aBlock[4] = (uint64_t)sub_100002720;
  aBlock[5] = 0LL;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = (uint64_t)sub_1000028E4;
  aBlock[3] = (uint64_t)&unk_100004338;
  v57 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter(v57);
  v58 = v74;
  sub_100002910();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)(v50, v58, v57, v56);
  _Block_release(v57);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v58, v3);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v50, v73);
  swift_getObjectType(qword_100008078);
  OS_dispatch_source.resume()();
  qword_100008080 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for ServiceManager(0)) init];
  v59 = objc_autoreleasePoolPush();
  ServiceManager.activate()();
  objc_autoreleasePoolPop(v59);
  CFRunLoopRun();
  return 0;
}

void sub_100002720()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin();
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = static Logger.daemon.getter(v2);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v21 = v0;
    uint64_t v8 = swift_slowAlloc(12LL, -1LL);
    uint64_t v20 = v1;
    uint64_t v9 = (uint8_t *)v8;
    uint64_t v10 = swift_slowAlloc(32LL, -1LL);
    uint64_t v23 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v19 = v9 + 4;
    uint64_t v11 = qword_100008050;
    uint64_t v12 = *(void *)algn_100008058;
    uint64_t v14 = qword_100008060;
    uint64_t v13 = unk_100008068;
    swift_bridgeObjectRetain(unk_100008068);
    uint64_t v15 = static String._fromSubstring(_:)(v11, v12, v14, v13);
    unint64_t v17 = v16;
    swift_bridgeObjectRelease(v13);
    uint64_t v22 = sub_1000029BC(v15, v17, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v19, v9 + 12);
    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Termination complete %s", v9, 0xCu);
    swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v21);
  }

  else
  {

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  }

  exit(0);
}

uint64_t sub_1000028E4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_100002910()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = &_swiftEmptyArrayStorage;
  uint64_t v1 = sub_1000031B8( &qword_100008038,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v2 = sub_100003084(&qword_100008040);
  uint64_t v3 = sub_1000031F8(&qword_100008048, &qword_100008040);
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v5, v2, v3, v0, v1);
}

uint64_t sub_1000029BC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100002A8C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100003178((uint64_t)v12, *a3);
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
      sub_100003178((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100003158(v12);
  return v7;
}

uint64_t sub_100002A8C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100002C44(a5, a6);
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

uint64_t sub_100002C44(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100002CD8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100002EB0(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100002EB0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100002CD8(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_100002E4C(v4, 0LL);
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

void *sub_100002E4C(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100003084(&qword_100008030);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100002EB0(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100003084(&qword_100008030);
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

uint64_t sub_100002FFC(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (result < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v5 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000LL) == 0) {
      uint64_t v5 = a2;
    }
    uint64_t v6 = 7LL;
    if (((a3 >> 60) & ((a2 & 0x800000000000000LL) == 0)) != 0) {
      uint64_t v6 = 11LL;
    }
    uint64_t v7 = v6 | (v5 << 16);
    uint64_t v8 = String.index(_:offsetBy:limitedBy:)(15LL, result, v7, a2, a3);
    if ((v9 & 1) != 0) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = v8;
    }
    return String.subscript.getter(15LL, v10, a2, a3);
  }

  return result;
}

uint64_t sub_100003084(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000030C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100003108(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_100003140(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100003150(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100003158(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003178(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000031B8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1000031F8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = sub_1000030C4(a2);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }

  return result;
}
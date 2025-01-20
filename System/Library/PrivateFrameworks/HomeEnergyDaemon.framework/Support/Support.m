int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  v3 = type metadata accessor for Logger(0LL);
  v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Logger.init(subsystem:category:)(0xD000000000000014LL, 0x8000000100007190LL, 0x6E6F6D656144LL, 0xE600000000000000LL);
  setDefaultLogger(_:)(v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_100003440();
  v7 = (void *)OS_os_log.init(subsystem:category:)( 0xD000000000000014LL,  0x8000000100007190LL,  0x6E6F6D656144LL,  0xE600000000000000LL);
  setDefaultLog(_:)();

  qword_10000C170 = 0LL;
  v8 = objc_autoreleasePoolPush();
  sub_10000347C();
  objc_autoreleasePoolPop(v8);
  v9 = [(id)objc_opt_self(NSRunLoop) currentRunLoop];
  [v9 run];

  exit(0);
}

unint64_t sub_100003440()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }

  return result;
}

void sub_10000347C()
{
  uint64_t v0 = type metadata accessor for Logging(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v30 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v30 - 8);
  uint64_t v5 = __chkstk_darwin(v30);
  v29 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  v8 = (char *)&v28 - v7;
  uint64_t v9 = enum case for Logging.daemon(_:);
  v28 = *(void (**)(char *, uint64_t))(v1 + 104);
  ((void (*)(char *, void, uint64_t))v28)(v3, enum case for Logging.daemon(_:), v0);
  defaultLogger(_:)(v3);
  v10 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
  uint64_t v11 = v10(v3, v0);
  v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "*** HOMEENERGYD LAUNCH ***", v14, 2u);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  v15 = *(void (**)(char *, uint64_t))(v4 + 8);
  v15(v8, v30);
  v16 = objc_autoreleasePoolPush();
  sub_100003820();
  if (v31)
  {
    objc_autoreleasePoolPop(v16);
    __break(1u);
  }

  else
  {
    objc_autoreleasePoolPop(v16);
    uint64_t v17 = sub_1000045A4();
    unint64_t v19 = v18;
    ((void (*)(char *, uint64_t, uint64_t))v28)(v3, v9, v0);
    v20 = v29;
    defaultLogger(_:)(v3);
    v10(v3, v0);
    uint64_t v21 = swift_bridgeObjectRetain(v19);
    v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v28 = v15;
      v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      v25 = v20;
      uint64_t v26 = swift_slowAlloc(32LL, -1LL);
      aBlock[0] = v26;
      *(_DWORD *)v24 = 136315138;
      swift_bridgeObjectRetain(v19);
      uint64_t v33 = sub_100003E7C(v17, v19, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v24 + 4, v24 + 12);
      swift_bridgeObjectRelease_n(v19, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Created tmp dir at %s", v24, 0xCu);
      swift_arrayDestroy(v26, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v26, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);

      v28(v25, v30);
    }

    else
    {

      swift_bridgeObjectRelease_n(v19, 2LL);
      v15(v20, v30);
    }

    aBlock[4] = (uint64_t)sub_100003994;
    aBlock[5] = 0LL;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)sub_100003E1C;
    aBlock[3] = (uint64_t)&unk_100008460;
    v27 = _Block_copy(aBlock);
    xpc_activity_register("com.apple.homeenergyd.firstlaunch", XPC_ACTIVITY_CHECK_IN, v27);
    _Block_release(v27);
  }
}

uint64_t sub_100003820()
{
  uint64_t v0 = type metadata accessor for Logging(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = _set_user_dir_suffix("com.apple.homeenergyd");
  if (!(_DWORD)result)
  {
    uint64_t v14 = v5;
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Logging.daemon(_:), v0);
    defaultLogger(_:)(v3);
    uint64_t v9 = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    v10 = (os_log_s *)Logger.logObject.getter(v9);
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "_set_user_dir_suffix() failed!", v12, 2u);
      swift_slowDealloc(v12, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v7, v4);
    exit(0);
  }

  return result;
}

xpc_activity_state_t sub_100003994(_xpc_activity_s *a1)
{
  uint64_t v2 = type metadata accessor for Logging(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = &v43[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v10 = &v43[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = &v43[-v12 - 8];
  uint64_t v14 = __chkstk_darwin(v11);
  v16 = &v43[-v15 - 8];
  __chkstk_darwin(v14);
  unint64_t v18 = &v43[-v17 - 8];
  if (xpc_activity_get_state(a1) != 2)
  {
    xpc_activity_state_t result = xpc_activity_get_state(a1);
    if (result) {
      return result;
    }
    (*(void (**)(_BYTE *, void, uint64_t))(v3 + 104))(v5, enum case for Logging.daemon(_:), v2);
    defaultLogger(_:)(v5);
    uint64_t v25 = (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Checking in for the launch activity!", v28, 2u);
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v10, v6);
    uint64_t v29 = type metadata accessor for DaemonInitializer(0LL);
    swift_allocObject(v29, *(unsigned int *)(v29 + 48), *(unsigned __int16 *)(v29 + 52));
    uint64_t v30 = DaemonInitializer.init()();
    swift_beginAccess(&qword_10000C170, v43, 1LL, 0LL);
    uint64_t v31 = qword_10000C170;
    qword_10000C170 = v30;
    return swift_release(v31);
  }

  if (xpc_activity_should_defer(a1))
  {
    BOOL v19 = xpc_activity_set_state(a1, 3LL);
    (*(void (**)(_BYTE *, void, uint64_t))(v3 + 104))(v5, enum case for Logging.daemon(_:), v2);
    if (v19)
    {
      defaultLogger(_:)(v5);
      uint64_t v20 = (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
      uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
      os_log_type_t v22 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v21, v22))
      {
        os_log_type_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)os_log_type_t v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Defering the first launch activity!", v23, 2u);
        swift_slowDealloc(v23, -1LL, -1LL);
      }

      return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v18, v6);
    }

    else
    {
      defaultLogger(_:)(v5);
      uint64_t v38 = (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
      v39 = (os_log_s *)Logger.logObject.getter(v38);
      os_log_type_t v40 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)v41 = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "Failed to defer the first launch activity!", v41, 2u);
        swift_slowDealloc(v41, -1LL, -1LL);
      }

      return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v16, v6);
    }
  }

  (*(void (**)(_BYTE *, void, uint64_t))(v3 + 104))(v5, enum case for Logging.daemon(_:), v2);
  defaultLogger(_:)(v5);
  uint64_t v32 = (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
  os_log_type_t v34 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "No need to defer the first launch activity", v35, 2u);
    swift_slowDealloc(v35, -1LL, -1LL);
  }

  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v13, v6);
  xpc_activity_state_t result = swift_beginAccess(&qword_10000C170, v43, 0LL, 0LL);
  uint64_t v36 = qword_10000C170;
  if (qword_10000C170)
  {
    uint64_t v37 = swift_retain(qword_10000C170);
    dispatch thunk of DaemonInitializer.firstLaunchSetup()(v37);
    uint64_t v31 = v36;
    return swift_release(v31);
  }

  return result;
}

uint64_t sub_100003E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  uint64_t v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_100003E64(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100003E74(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100003E7C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100003F4C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000044DC((uint64_t)v12, *a3);
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
      sub_1000044DC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1000044BC(v12);
  return v7;
}

uint64_t sub_100003F4C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100004104(a5, a6);
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

uint64_t sub_100004104(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100004198(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100004370(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100004370(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100004198(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_10000430C(v4, 0LL);
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

void *sub_10000430C(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100004518(&qword_10000C0A8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100004370(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100004518(&qword_10000C0A8);
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

uint64_t sub_1000044BC(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000044DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100004518(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000455C()
{
  return v0;
}

uint64_t sub_100004564()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t sub_100004574()
{
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for MainUtils()
{
  return objc_opt_self(&OBJC_CLASS____TtC11homeenergyd9MainUtils);
}

uint64_t sub_1000045A4()
{
  uint64_t v0 = objc_autoreleasePoolPush();
  sub_1000045E0(&v2);
  objc_autoreleasePoolPop(v0);
  return v2;
}

uint64_t sub_1000045E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Logging(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v24 = *(void *)(v6 - 8);
  uint64_t v25 = v6;
  __chkstk_darwin(v6);
  int64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_1000066AC();
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  uint64_t v13 = objc_autoreleasePoolPush();
  uint64_t v14 = String.utf8CString.getter(v11, v12);
  uint64_t v15 = realpath_DARWIN_EXTSN((const char *)(v14 + 32), 0LL);
  swift_release(v14);
  if (v15)
  {
    uint64_t v16 = String.init(cString:)(v15);
    uint64_t v18 = v17;
    swift_slowDealloc(v15, -1LL, -1LL);
  }

  else
  {
    uint64_t v16 = 0LL;
    uint64_t v18 = 0LL;
  }

  objc_autoreleasePoolPop(v13);
  uint64_t result = swift_bridgeObjectRelease(v12);
  if (!v18)
  {
LABEL_7:
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Logging.daemon(_:), v2);
    defaultLogger(_:)(v5);
    uint64_t v20 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      os_log_type_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)os_log_type_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Unable to read _CS_DARWIN_USER_TEMP_DIR!", v23, 2u);
      swift_slowDealloc(v23, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v25);
    exit(1);
  }

  *a1 = v16;
  a1[1] = v18;
  return result;
}

void sub_1000047DC(unint64_t *a1@<X8>)
{
  v76 = a1;
  uint64_t v71 = type metadata accessor for Logging(0LL);
  uint64_t v70 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  v69 = (char *)&v68 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  v68 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v68 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v68 - v10;
  uint64_t v12 = objc_autoreleasePoolPush();
  sub_100005A68(v78);
  uint64_t v79 = v1;
  if (!v1)
  {
    uint64_t v72 = v4;
    uint64_t v73 = v3;
    objc_autoreleasePoolPop(v12);
    uint64_t v75 = v78[0];
    uint64_t v74 = v78[1];
    uint64_t v13 = sub_1000066AC();
    if (!v14) {
      goto LABEL_18;
    }
    uint64_t v15 = v13;
    uint64_t v16 = v14;
    uint64_t v17 = objc_autoreleasePoolPush();
    uint64_t v18 = String.utf8CString.getter(v15, v16);
    BOOL v19 = realpath_DARWIN_EXTSN((const char *)(v18 + 32), 0LL);
    swift_release(v18);
    if (v19)
    {
      uint64_t v20 = String.init(cString:)(v19);
      uint64_t v22 = v21;
      swift_slowDealloc(v19, -1LL, -1LL);
    }

    else
    {
      uint64_t v20 = 0LL;
      uint64_t v22 = 0LL;
    }

    objc_autoreleasePoolPop(v17);
    swift_bridgeObjectRelease(v16);
    if (v22)
    {
      uint64_t v23 = sub_1000066AC();
      if (!v24) {
        goto LABEL_21;
      }
      uint64_t v25 = v23;
      uint64_t v26 = v24;
      os_log_type_t v27 = objc_autoreleasePoolPush();
      uint64_t v28 = String.utf8CString.getter(v25, v26);
      uint64_t v29 = realpath_DARWIN_EXTSN((const char *)(v28 + 32), 0LL);
      swift_release(v28);
      if (v29)
      {
        uint64_t v30 = String.init(cString:)(v29);
        uint64_t v32 = v31;
        swift_slowDealloc(v29, -1LL, -1LL);
      }

      else
      {
        uint64_t v30 = 0LL;
        uint64_t v32 = 0LL;
      }

      objc_autoreleasePoolPop(v27);
      swift_bridgeObjectRelease(v26);
      if (v32)
      {
        uint64_t v33 = sub_1000066AC();
        if (v34)
        {
          uint64_t v35 = v33;
          uint64_t v36 = v34;
          uint64_t v37 = objc_autoreleasePoolPush();
          uint64_t v38 = String.utf8CString.getter(v35, v36);
          v39 = realpath_DARWIN_EXTSN((const char *)(v38 + 32), 0LL);
          swift_release(v38);
          if (v39)
          {
            uint64_t v40 = String.init(cString:)(v39);
            uint64_t v42 = v41;
            swift_slowDealloc(v39, -1LL, -1LL);
          }

          else
          {
            uint64_t v40 = 0LL;
            uint64_t v42 = 0LL;
          }

          objc_autoreleasePoolPop(v37);
          swift_bridgeObjectRelease(v36);
          if (v42)
          {
            uint64_t v43 = sub_100004518(&qword_10000C160);
            uint64_t inited = swift_initStackObject(v43, v77);
            *(_OWORD *)(inited + 16) = xmmword_100007150;
            *(void *)(inited + 32) = 0xD000000000000010LL;
            *(void *)(inited + 40) = 0x80000001000074C0LL;
            *(void *)(inited + 48) = v30;
            *(void *)(inited + 56) = v32;
            *(void *)(inited + 64) = 0x555F4E4957524144LL;
            *(void *)(inited + 72) = 0xEF5249445F524553LL;
            *(void *)(inited + 80) = v40;
            *(void *)(inited + 88) = v42;
            *(void *)(inited + 96) = 1162694472LL;
            *(void *)(inited + 104) = 0xE400000000000000LL;
            uint64_t v45 = v74;
            *(void *)(inited + 112) = v75;
            *(void *)(inited + 120) = v45;
            *(void *)(inited + 128) = 0x524944504D54LL;
            *(void *)(inited + 136) = 0xE600000000000000LL;
            *(void *)(inited + 144) = v20;
            *(void *)(inited + 152) = v22;
            unint64_t v46 = sub_100004E24(inited);
            unint64_t *v76 = v46;
            return;
          }
        }

        uint64_t v61 = v70;
        v62 = v69;
        uint64_t v63 = v71;
        (*(void (**)(char *, void, uint64_t))(v70 + 104))(v69, enum case for Logging.daemon(_:), v71);
        defaultLogger(_:)(v62);
        uint64_t v64 = (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v62, v63);
        v65 = (os_log_s *)Logger.logObject.getter(v64);
        os_log_type_t v66 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v65, v66))
        {
          v67 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)v67 = 0;
          _os_log_impl((void *)&_mh_execute_header, v65, v66, "Unable to read _CS_DARWIN_USER_DIR!", v67, 2u);
          swift_slowDealloc(v67, -1LL, -1LL);
        }

        (*(void (**)(char *, uint64_t))(v72 + 8))(v68, v73);
      }

      else
      {
LABEL_21:
        uint64_t v54 = v70;
        v55 = v69;
        uint64_t v56 = v71;
        (*(void (**)(char *, void, uint64_t))(v70 + 104))(v69, enum case for Logging.daemon(_:), v71);
        defaultLogger(_:)(v55);
        uint64_t v57 = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v55, v56);
        v58 = (os_log_s *)Logger.logObject.getter(v57);
        os_log_type_t v59 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v58, v59))
        {
          v60 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)v60 = 0;
          _os_log_impl((void *)&_mh_execute_header, v58, v59, "Unable to read _CS_DARWIN_USER_CACHE_DIR!", v60, 2u);
          swift_slowDealloc(v60, -1LL, -1LL);
        }

        (*(void (**)(char *, uint64_t))(v72 + 8))(v9, v73);
      }
    }

    else
    {
LABEL_18:
      uint64_t v47 = v70;
      v48 = v69;
      uint64_t v49 = v71;
      (*(void (**)(char *, void, uint64_t))(v70 + 104))(v69, enum case for Logging.daemon(_:), v71);
      defaultLogger(_:)(v48);
      uint64_t v50 = (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v48, v49);
      v51 = (os_log_s *)Logger.logObject.getter(v50);
      os_log_type_t v52 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)v53 = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "Unable to read _CS_DARWIN_USER_TEMP_DIR!", v53, 2u);
        swift_slowDealloc(v53, -1LL, -1LL);
      }

      (*(void (**)(char *, uint64_t))(v72 + 8))(v11, v73);
    }

    exit(1);
  }

  objc_autoreleasePoolPop(v12);
  __break(1u);
}

unint64_t sub_100004E24(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100004518(&qword_10000C168);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v7 = *(v6 - 3);
    uint64_t v8 = *(v6 - 2);
    uint64_t v10 = *(v6 - 1);
    uint64_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    unint64_t result = sub_100006058(v7, v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v13 = v7;
    v13[1] = v8;
    uint64_t v14 = (void *)(v4[7] + 16 * result);
    void *v14 = v10;
    v14[1] = v9;
    uint64_t v15 = v4[2];
    BOOL v16 = __OFADD__(v15, 1LL);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v6 += 4;
    v4[2] = v17;
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

void sub_100004F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = objc_autoreleasePoolPush();
  sub_100004FA8(a1, a2, a3, a4);
  objc_autoreleasePoolPop(v8);
}

void sub_100004FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  uint64_t v7 = (void *)type metadata accessor for Logging(0LL);
  uint64_t v8 = *(v7 - 1);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = String.utf8CString.getter(a1, a2);
  LODWORD(a1) = _set_user_dir_suffix(v15 + 32);
  swift_release(v15);
  if (!(_DWORD)a1)
  {
    uint64_t v19 = v12;
    (*(void (**)(char *, void, void *))(v8 + 104))(v10, enum case for Logging.daemon(_:), v7);
    defaultLogger(_:)(v10);
    uint64_t v20 = (*(uint64_t (**)(char *, void *))(v8 + 8))(v10, v7);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v23 = static os_log_type_t.error.getter(v21, v22);
    if (os_log_type_enabled(v21, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v23, "_set_user_dir_suffix() failed!", v24, 2u);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v11);
    exit(1);
  }

  BOOL v16 = objc_autoreleasePoolPush();
  sub_1000047DC((unint64_t *)&v27);
  if (v4)
  {
    objc_autoreleasePoolPop(v16);
    __break(1u);
    objc_autoreleasePoolPop(v7);
    __break(1u);
  }

  else
  {
    objc_autoreleasePoolPop(v16);
    uint64_t v17 = v27;
    uint64_t v18 = objc_autoreleasePoolPush();
    sub_100005218(v17, v25, v26);
    objc_autoreleasePoolPop(v18);
    swift_bridgeObjectRelease(v17);
  }

uint64_t sub_1000051C8@<X0>(char *a1@<X0>, int a2@<W1>, void *a3@<X8>)
{
  uint64_t result = confstr(a2, a1, 0x400uLL);
  if (result >= 1 && a1)
  {
    uint64_t result = String.init(cString:)(a1);
    *a3 = result;
    a3[1] = v6;
  }

  else
  {
    *a3 = 0LL;
    a3[1] = 0LL;
  }

  return result;
}

void sub_100005218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v53 = a3;
  uint64_t v51 = a2;
  uint64_t v5 = type metadata accessor for Logging(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v50 = *(void (***)(char *, void))(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v55 = 0LL;
  uint64_t v12 = objc_autoreleasePoolPush();
  uint64_t v13 = (char *)_swiftEmptyArrayStorage;
  uint64_t v56 = (char *)_swiftEmptyArrayStorage;
  uint64_t v14 = swift_bridgeObjectRetain(a1);
  sub_1000068FC(v14, a1, &v56);
  uint64_t v52 = v3;
  swift_bridgeObjectRelease(a1);
  uint64_t v15 = v56;
  objc_autoreleasePoolPop(v12);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Logging.daemon(_:), v5);
  defaultLogger(_:)(v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v16 = swift_bridgeObjectRetain_n(a1, 2LL);
  uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
  os_log_type_t v18 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v49 = v15;
    uint64_t v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v47 = (char *)swift_slowAlloc(32LL, -1LL);
    uint64_t v56 = v47;
    *(_DWORD *)uint64_t v19 = 136315138;
    unint64_t v46 = v19 + 4;
    uint64_t v20 = swift_bridgeObjectRetain(a1);
    uint64_t v21 = Dictionary.description.getter( v20,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
    uint64_t v48 = v9;
    uint64_t v22 = v21;
    unint64_t v24 = v23;
    swift_bridgeObjectRelease(a1);
    uint64_t v54 = sub_100003E7C(v22, v24, (uint64_t *)&v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v46, v19 + 12);
    swift_bridgeObjectRelease_n(a1, 2LL);
    unint64_t v25 = v24;
    uint64_t v15 = v49;
    swift_bridgeObjectRelease(v25);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Sandbox parameters: %s", v19, 0xCu);
    uint64_t v26 = v47;
    swift_arrayDestroy(v47, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(v19, -1LL, -1LL);

    v50[1](v11, v48);
  }

  else
  {

    swift_bridgeObjectRelease_n(a1, 2LL);
    v50[1](v11, v9);
  }

  swift_bridgeObjectRetain(v53);
  uint64_t v50 = (void (**)(char *, void))objc_autoreleasePoolPush();
  int64_t v27 = *((void *)v15 + 2);
  if (v27)
  {
    uint64_t v56 = (char *)_swiftEmptyArrayStorage;
    sub_100006530(0, v27, 0);
    uint64_t v28 = v56;
    uint64_t v29 = v15;
    uint64_t v30 = v15 + 40;
    do
    {
      uint64_t v31 = *v30;
      uint64_t v32 = String.utf8CString.getter(*(v30 - 1), *v30);
      swift_bridgeObjectRetain(v31);
      uint64_t v33 = strdup((const char *)(v32 + 32));
      swift_release(v32);
      swift_bridgeObjectRelease(v31);
      uint64_t v56 = v28;
      unint64_t v35 = *((void *)v28 + 2);
      unint64_t v34 = *((void *)v28 + 3);
      int64_t v36 = v35 + 1;
      if (v35 >= v34 >> 1)
      {
        sub_100006530(v34 > 1, v35 + 1, 1);
        uint64_t v28 = v56;
      }

      *((void *)v28 + 2) = v36;
      *(void *)&v28[8 * v35 + 32] = v33;
      v30 += 2;
      --v27;
    }

    while (v27);
  }

  else
  {
    uint64_t v29 = v15;
    int64_t v36 = _swiftEmptyArrayStorage[2];
    uint64_t v28 = (char *)_swiftEmptyArrayStorage;
    if (!v36) {
      goto LABEL_15;
    }
  }

  uint64_t v56 = (char *)_swiftEmptyArrayStorage;
  sub_10000650C(0, v36, 0);
  uint64_t v37 = 0LL;
  uint64_t v13 = v56;
  unint64_t v38 = *((void *)v56 + 2);
  do
  {
    uint64_t v39 = *(void *)&v28[8 * v37 + 32];
    uint64_t v56 = v13;
    unint64_t v40 = *((void *)v13 + 3);
    if (v38 >= v40 >> 1)
    {
      sub_10000650C(v40 > 1, v38 + 1, 1);
      uint64_t v13 = v56;
    }

    ++v37;
    *((void *)v13 + 2) = v38 + 1;
    *(void *)&v13[8 * v38++ + 32] = v39;
  }

  while (v36 != v37);
LABEL_15:
  if ((swift_isUniquelyReferenced_nonNull_native(v13) & 1) == 0) {
    uint64_t v13 = sub_100005F4C(0LL, *((void *)v13 + 2) + 1LL, 1, v13);
  }
  unint64_t v42 = *((void *)v13 + 2);
  unint64_t v41 = *((void *)v13 + 3);
  if (v42 >= v41 >> 1) {
    uint64_t v13 = sub_100005F4C((char *)(v41 > 1), v42 + 1, 1, v13);
  }
  *((void *)v13 + 2) = v42 + 1;
  *(void *)&v13[8 * v42 + 32] = 0LL;
  sub_100005750((uint64_t)v13, v51, v53, &v55);
  swift_bridgeObjectRelease(v13);
  uint64_t v43 = *((void *)v28 + 2);
  if (v43)
  {
    swift_bridgeObjectRetain(v28);
    for (uint64_t i = 0LL; i != v43; ++i)
    {
      uint64_t v45 = *(void **)&v28[8 * i + 32];
      free(v45);
    }

    swift_bridgeObjectRelease(v28);
  }

  swift_bridgeObjectRelease(v53);
  swift_bridgeObjectRelease(v28);
  if (v52)
  {
    objc_autoreleasePoolPop(v50);
    __break(1u);
  }

  else
  {
    objc_autoreleasePoolPop(v50);
    swift_bridgeObjectRelease(v29);
  }

uint64_t sub_100005750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v36 = type metadata accessor for Logging(0LL);
  uint64_t v8 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v33 - v16;
  uint64_t v18 = String.utf8CString.getter(a2, a3);
  LODWORD(a2) = sandbox_init_with_parameters(v18 + 32, 1LL, a1 + 32, a4);
  uint64_t result = swift_release(v18);
  if ((_DWORD)a2)
  {
    uint64_t v34 = v12;
    uint64_t v35 = v11;
    uint64_t v20 = *a4;
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for Logging.daemon(_:), v36);
    if (v20)
    {
      defaultLogger(_:)(v10);
      uint64_t v25 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v36);
      uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
      os_log_type_t v27 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v29 = swift_slowAlloc(32LL, -1LL);
        uint64_t v38 = v29;
        *(_DWORD *)uint64_t v28 = 136315138;
        uint64_t v30 = String.init(cString:)(v20);
        unint64_t v32 = v31;
        uint64_t v37 = sub_100003E7C(v30, v31, &v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v28 + 4, v28 + 12);
        swift_bridgeObjectRelease(v32);
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "sandbox_init_with_parameters failed!: [%s]", v28, 0xCu);
        swift_arrayDestroy(v29, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v29, -1LL, -1LL);
        swift_slowDealloc(v28, -1LL, -1LL);
      }

      (*(void (**)(char *, uint64_t))(v34 + 8))(v15, v35);
    }

    else
    {
      defaultLogger(_:)(v10);
      uint64_t v21 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v36);
      uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
      os_log_type_t v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v22, v23))
      {
        unint64_t v24 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)unint64_t v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "sandbox_init_with_parameters failed! (no error)", v24, 2u);
        swift_slowDealloc(v24, -1LL, -1LL);
      }

      (*(void (**)(char *, uint64_t))(v34 + 8))(v17, v35);
    }

    exit(1);
  }

  return result;
}

ValueMetadata *type metadata accessor for DaemonSandbox()
{
  return &type metadata for DaemonSandbox;
}

uint64_t sub_100005A68@<X0>(void *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Logging(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v41[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v41[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v41[-1] - v11;
  uid_t v13 = getuid();
  uint64_t v14 = getpwuid(v13);
  if (!v14 || (pw_dir = v14->pw_dir) == 0LL)
  {
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Logging.daemon(_:), v2);
    defaultLogger(_:)(v5);
    uint64_t v21 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)unint64_t v24 = 67109120;
      LODWORD(v41[0]) = getuid();
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v41, (char *)v41 + 4, v24 + 4, v24 + 8);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Failed to get passwd entry for uid %u", v24, 8u);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
LABEL_13:
    exit(1);
  }

  uint64_t v16 = realpath_DARWIN_EXTSN(v14->pw_dir, 0LL);
  if (!v16)
  {
    uint64_t v40 = v7;
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Logging.daemon(_:), v2);
    defaultLogger(_:)(v5);
    uint64_t v25 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc(28LL, -1LL);
      uint64_t v29 = swift_slowAlloc(64LL, -1LL);
      v41[0] = v29;
      *(_DWORD *)uint64_t v28 = 136315650;
      uint64_t v30 = String.init(cString:)(pw_dir);
      unint64_t v32 = v31;
      uint64_t v42 = sub_100003E7C(v30, v31, v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v28 + 4, v28 + 12);
      uint64_t v33 = swift_bridgeObjectRelease(v32);
      *(_WORD *)(v28 + 12) = 1024;
      LODWORD(v42) = errno.getter(v33);
      uint64_t v34 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, (char *)&v42 + 4, v28 + 14, v28 + 18);
      *(_WORD *)(v28 + 18) = 2080;
      int v35 = errno.getter(v34);
      uint64_t v36 = strerror(v35);
      if (!v36) {
        __break(1u);
      }
      uint64_t v37 = String.init(cString:)(v36);
      unint64_t v39 = v38;
      uint64_t v42 = sub_100003E7C(v37, v38, v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v28 + 20, v28 + 28);
      swift_bridgeObjectRelease(v39);
      _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "Sandbox: realpath(%s)\nfor home directory failed %d (%s)",  (uint8_t *)v28,  0x1Cu);
      swift_arrayDestroy(v29, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1LL, -1LL);
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v6);
    goto LABEL_13;
  }

  uint64_t v17 = v16;
  v41[0] = String.init(cString:)(v16);
  v41[1] = v18;
  *a1 = String.init<A>(_:)( v41,  &type metadata for String,  &protocol witness table for String,  &protocol witness table for String);
  a1[1] = v19;
  return swift_slowDealloc(v17, -1LL, -1LL);
}

char *sub_100005E40(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_100004518(&qword_10000C158);
      uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32]) {
          memmove(v14, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_10000680C(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

char *sub_100005F4C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_100004518(&qword_10000C148);
      uint64_t v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 3);
      uint64_t v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[8 * v8 + 32]) {
          memmove(v14, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_100006BA4(0LL, v8, v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

unint64_t sub_100006058(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_1000060BC(a1, a2, v5);
}

unint64_t sub_1000060BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

void sub_10000619C(uint64_t a1)
{
  __asm { BR              X11 }

uint64_t sub_1000061F8@<X0>( uint64_t a1@<X8>, uint64_t a2, char a3, int a4, int a5, char a6, char a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23)
{
  uint64_t v29 = v26;
  LOWORD(v30) = a1;
  BYTE2(v30) = BYTE2(a1);
  HIBYTE(v30) = BYTE3(a1);
  unsigned __int8 v31 = BYTE4(a1);
  unsigned __int8 v32 = BYTE5(a1);
  unsigned __int8 v33 = BYTE6(a1);
  uint64_t result = sub_1000051C8((char *)&v29, v25, &v34);
  if (!v23) {
    uint64_t result = v34;
  }
  unint64_t v28 = v30 | ((unint64_t)v31 << 32) | ((unint64_t)v32 << 40) | ((unint64_t)v33 << 48);
  void *v24 = v29;
  v24[1] = v28;
  return result;
}

uint64_t sub_100006470(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t result = __DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_9;
  }
  uint64_t v9 = result;
  uint64_t result = __DataStorage._offset.getter();
  uint64_t v10 = a1 - result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_8;
  }

  if (__OFSUB__(a2, a1))
  {
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }

  __DataStorage._length.getter();
  uint64_t result = sub_1000051C8((char *)(v9 + v10), a4, &v11);
  if (!v4) {
    return v11;
  }
  return result;
}

uint64_t sub_10000650C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100006554(a1, a2, a3, *v3, &qword_10000C148);
  char *v3 = (char *)result;
  return result;
}

uint64_t sub_100006530(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100006554(a1, a2, a3, *v3, &qword_10000C150);
  char *v3 = (char *)result;
  return result;
}

uint64_t sub_100006554(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v8 = a2;
  }

  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    uint64_t v11 = sub_100004518(a5);
    uint64_t v12 = (char *)swift_allocObject(v11, 8 * v10 + 32, 7LL);
    int64_t v13 = j__malloc_size(v12);
    uint64_t v14 = v13 - 32;
    if (v13 < 32) {
      uint64_t v14 = v13 - 25;
    }
    *((void *)v12 + 2) = v9;
    *((void *)v12 + 3) = 2 * (v14 >> 3);
  }

  else
  {
    uint64_t v12 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v15 = v12 + 32;
  uint64_t v16 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v12 != a4 || v15 >= &v16[8 * v9]) {
      memmove(v15, v16, 8 * v9);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v16 >= &v15[8 * v9] || v15 >= &v16[8 * v9])
  {
    memcpy(v15, v16, 8 * v9);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v12;
  }

LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_1000066AC()
{
  uint64_t v0 = objc_autoreleasePoolPush();
  uint64_t v1 = type metadata accessor for __DataStorage(0LL);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  uint64_t v2 = __DataStorage.init(length:)(1024LL);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    uint64_t v3 = __DataStorage._bytes.getter();
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t result = __DataStorage._offset.getter();
      if (__OFSUB__(0LL, result))
      {
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }

      uint64_t v6 = v4 - result;
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
    uint64_t v7 = __DataStorage.init(bytes:length:copy:deallocator:offset:)(v6, 1024LL, 1LL, 0LL, 0LL, 0LL);
    swift_release(v2);
    uint64_t v2 = v7;
  }

  uint64_t result = __DataStorage._bytes.getter();
  if (!result)
  {
LABEL_15:
    __break(1u);
    return result;
  }

  uint64_t v8 = result;
  uint64_t result = __DataStorage._offset.getter();
  uint64_t v9 = -result;
  if (__OFSUB__(0LL, result))
  {
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v10 = __DataStorage._length.getter();
  if (v10 >= 1024) {
    size_t v11 = 1024LL;
  }
  else {
    size_t v11 = v10;
  }
  bzero((void *)(v8 + v9), v11);
  uint64_t v14 = 0x40000000000LL;
  unint64_t v15 = v2 | 0x4000000000000000LL;
  sub_10000619C((uint64_t)&v14);
  uint64_t v13 = v12;
  sub_100006C8C(v14, v15);
  objc_autoreleasePoolPop(v0);
  return v13;
}

uint64_t sub_10000680C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1000068FC(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = a1 + 64;
  uint64_t v7 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v8 = -1LL;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  unint64_t v9 = v8 & *(void *)(a1 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t v12 = 0LL;
  uint64_t v35 = result;
  int64_t v36 = v10;
  uint64_t v37 = v6;
  unint64_t v38 = a3;
  while (1)
  {
    while (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v12 << 6);
      if (*(void *)(a2 + 16)) {
        goto LABEL_25;
      }
    }

    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1LL))
    {
      __break(1u);
      goto LABEL_35;
    }

    if (v15 >= v10) {
      return swift_release(v5);
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v10) {
        return swift_release(v5);
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v10) {
          return swift_release(v5);
        }
        unint64_t v16 = *(void *)(v6 + 8 * v12);
        if (!v16)
        {
          int64_t v12 = v15 + 3;
          if (v15 + 3 >= v10) {
            return swift_release(v5);
          }
          unint64_t v16 = *(void *)(v6 + 8 * v12);
          if (!v16) {
            break;
          }
        }
      }
    }

LABEL_24:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v12 << 6);
    if (*(void *)(a2 + 16))
    {
LABEL_25:
      uint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v14);
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      swift_bridgeObjectRetain_n(v19, 2LL);
      unint64_t v21 = sub_100006058(v20, v19);
      if ((v22 & 1) != 0)
      {
        uint64_t v23 = (uint64_t *)(*(void *)(a2 + 56) + 16 * v21);
        uint64_t v24 = *v23;
        uint64_t v25 = v23[1];
        swift_bridgeObjectRetain(v25);
        swift_bridgeObjectRelease(v19);
        uint64_t v26 = *a3;
        swift_bridgeObjectRetain(v19);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v26);
        *a3 = v26;
        uint64_t v39 = v24;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v26 = sub_100005E40(0LL, *((void *)v26 + 2) + 1LL, 1, v26);
          *a3 = v26;
        }

        unint64_t v29 = *((void *)v26 + 2);
        unint64_t v28 = *((void *)v26 + 3);
        if (v29 >= v28 >> 1)
        {
          uint64_t v26 = sub_100005E40((char *)(v28 > 1), v29 + 1, 1, v26);
          *unint64_t v38 = v26;
        }

        *((void *)v26 + 2) = v29 + 1;
        unsigned int v30 = &v26[16 * v29];
        *((void *)v30 + 4) = v20;
        *((void *)v30 + 5) = v19;
        a3 = v38;
        unsigned __int8 v31 = *v38;
        unint64_t v33 = *((void *)*v38 + 2);
        unint64_t v32 = *((void *)*v38 + 3);
        if (v33 >= v32 >> 1)
        {
          unsigned __int8 v31 = sub_100005E40((char *)(v32 > 1), v33 + 1, 1, v31);
          *unint64_t v38 = v31;
        }

        *((void *)v31 + 2) = v33 + 1;
        uint64_t v34 = &v31[16 * v33];
        *((void *)v34 + 4) = v39;
        *((void *)v34 + 5) = v25;
        uint64_t v6 = v37;
        uint64_t v5 = v35;
        int64_t v10 = v36;
      }

      else
      {
        swift_bridgeObjectRelease(v19);
      }

      uint64_t result = swift_bridgeObjectRelease(v19);
    }
  }

  int64_t v17 = v15 + 4;
  if (v17 >= v10) {
    return swift_release(v5);
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_24;
  }

  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v12 >= v10) {
      return swift_release(v5);
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_24;
    }
  }

LABEL_35:
  __break(1u);
  return result;
}

char *sub_100006BA4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100006C8C(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release(result);
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}
uint64_t start()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint8_t v5[16];
  v0 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Hello World!", v5, 2u);
  }

  v1 = +[DPDBackgroundTaskManager sharedInstance](&OBJC_CLASS___DPDBackgroundTaskManager, "sharedInstance");
  v2 = +[DPDPushManager sharedInstance](&OBJC_CLASS___DPDPushManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v3 run];

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

id sub_100002AC8()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for PushManager()) init];
  qword_10000CD70 = (uint64_t)result;
  return result;
}

void sub_100002B34()
{
  uint64_t ObjectType = swift_getObjectType(v0);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v54 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v5 = &v0[OBJC_IVAR___DPDPushManager_pushTopic];
  *(void *)v5 = 0xD000000000000019LL;
  *((void *)v5 + 1) = 0x8000000100006E80LL;
  uint64_t v6 = qword_10000CA28;
  v7 = v0;
  if (v6 != -1) {
    swift_once(&qword_10000CA28, sub_100006304);
  }
  uint64_t v53 = sub_100004490(v2, (uint64_t)qword_10000CD88);
  v8 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Registering for pushes...", v10, 2u);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  if (qword_10000CA18 != -1) {
    swift_once(&qword_10000CA18, sub_100004698);
  }
  v11 = *(void **)(qword_10000CD78 + 16);
  uint64_t v55 = v2;
  if (v11
    && (NSString v12 = String._bridgeToObjectiveC()(),
        id v13 = [v11 stringForKey:v12],
        v12,
        v13))
  {
    v14 = (objc_class *)ObjectType;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    uint64_t v16 = v15;
  }

  else
  {
    v14 = (objc_class *)ObjectType;
    static String._unconditionallyBridgeFromObjectiveC(_:)(APSEnvironmentProduction);
    uint64_t v16 = v17;
  }

  uint64_t v18 = *((void *)v5 + 1);
  sub_100004618();
  uint64_t v19 = swift_bridgeObjectRetain(v18);
  v20 = (void *)static OS_dispatch_queue.main.getter(v19);
  id v21 = objc_allocWithZone(&OBJC_CLASS___APSConnection);
  NSString v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16, v23);
  NSString v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18, v25);
  id v26 = [v21 initWithEnvironmentName:v22 namedDelegatePort:v24 queue:v20];

  if (v26)
  {
    *(void *)&v7[OBJC_IVAR___DPDPushManager_connection] = v26;

    v58.receiver = v7;
    v58.super_class = v14;
    v27 = (char *)objc_msgSendSuper2(&v58, "init");
    uint64_t v28 = OBJC_IVAR___DPDPushManager_connection;
    v29 = *(void **)&v27[OBJC_IVAR___DPDPushManager_connection];
    v30 = v27;
    [v29 setDelegate:v30];
    uint64_t v31 = sub_100004544(&qword_10000CAF0);
    uint64_t v32 = swift_allocObject(v31, 48LL, 7LL);
    *(_OWORD *)(v32 + 16) = xmmword_1000069F0;
    uint64_t v33 = *(void *)&v30[OBJC_IVAR___DPDPushManager_pushTopic + 8];
    *(void *)(v32 + 32) = *(void *)&v30[OBJC_IVAR___DPDPushManager_pushTopic];
    *(void *)(v32 + 40) = v33;
    id v34 = v29;
    swift_bridgeObjectRetain(v33);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v32, v36);
    [v34 _setEnabledTopics:isa];

    uint64_t v37 = v3;
    v38 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v39 = v54;
    uint64_t v40 = v55;
    v38(v54, v53, v55);
    v14 = v30;
    v41 = (void *)Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled((os_log_t)v41, v42))
    {

      (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v40);
      return;
    }

    uint64_t v53 = v37;
    v43 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v44 = swift_slowAlloc(32LL, -1LL);
    uint64_t v57 = v44;
    *(_DWORD *)v43 = 136315138;
    id v45 = [*(id *)&v27[v28] enabledTopics];
    if (v45)
    {
      v46 = v45;
      uint64_t v47 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v45, &type metadata for String);

      uint64_t v48 = Array.description.getter(v47, &type metadata for String);
      unint64_t v50 = v49;
      swift_bridgeObjectRelease(v47, v49);
      uint64_t v56 = sub_100005B5C(v48, v50, &v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, &v57);

      swift_bridgeObjectRelease(v50, v51);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v41, v42, "Registered for push topics: %s", v43, 0xCu);
      swift_arrayDestroy(v44, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1LL, -1LL);
      swift_slowDealloc(v43, -1LL, -1LL);

      (*(void (**)(char *, uint64_t))(v53 + 8))(v39, v55);
      return;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
}

uint64_t sub_10000313C@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  char v3 = *a1;
  uint64_t v4 = sub_100004544(&qword_10000CAE8);
  uint64_t v5 = swift_allocObject(v4, 72LL, 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_1000069F0;
  *(void *)(v5 + 56) = &type metadata for UInt8;
  *(void *)(v5 + 64) = &protocol witness table for UInt8;
  *(_BYTE *)(v5 + 32) = v3;
  uint64_t result = String.init(format:_:)(0x786868323025LL, 0xE600000000000000LL, v5);
  *a2 = result;
  a2[1] = v7;
  return result;
}

void sub_1000031C4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_10000321C(uint64_t a1)
{
  uint64_t v5 = v32;
  if (v32)
  {
    *(void *)(v4 - 104) = v1;
    uint64_t v6 = v32;
    uint64_t v7 = sub_1000036D4(0, v32, 0);
    uint64_t v8 = a1;
    uint64_t v1 = *(void *)(v4 - 104);
    if ((_DWORD)v3)
    {
      if ((_DWORD)v3 == 1) {
        uint64_t v9 = (int)a1;
      }
      else {
        uint64_t v9 = *(void *)(a1 + 16);
      }
    }

    else
    {
      uint64_t v9 = 0LL;
    }

    while (1)
    {
      if (!v6)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        __break(1u);
        JUMPOUT(0x100003528LL);
      }

      *(void *)(v4 - 144) = v6;
      if ((_DWORD)v3)
      {
        if ((_DWORD)v3 == 1)
        {
          uint64_t v10 = v1;
          uint64_t v11 = v2;
          uint64_t v12 = ((uint64_t (*)(uint64_t))__DataStorage._bytes.getter)(v7);
          if (!v12)
          {
            __break(1u);
LABEL_38:
            __break(1u);
          }

          uint64_t v13 = v12;
          uint64_t v14 = ((uint64_t (*)(void))__DataStorage._offset.getter)();
          uint64_t v15 = v9 - v14;
          if (__OFSUB__(v9, v14)) {
            goto LABEL_34;
          }
        }

        else
        {
          if (v9 < *(void *)(v8 + 16)) {
            goto LABEL_33;
          }
          if (v9 >= *(void *)(v8 + 24)) {
            goto LABEL_35;
          }
          uint64_t v10 = v1;
          uint64_t v11 = v2;
          uint64_t v17 = ((uint64_t (*)(uint64_t))__DataStorage._bytes.getter)(v7);
          if (!v17) {
            goto LABEL_38;
          }
          uint64_t v13 = v17;
          uint64_t v18 = ((uint64_t (*)(void))__DataStorage._offset.getter)();
          uint64_t v15 = v9 - v18;
          if (__OFSUB__(v9, v18)) {
            goto LABEL_36;
          }
        }

        char v16 = *(_BYTE *)(v13 + v15);
        uint64_t v2 = v11;
        uint64_t v8 = a1;
      }

      else
      {
        if (v9 >= v32) {
          goto LABEL_32;
        }
        uint64_t v10 = v1;
        *(_BYTE *)(v4 - 134) = v8;
        *(_DWORD *)(v4 - 133) = *(_DWORD *)((char *)&a1 + 1);
        *(_WORD *)(v4 - 129) = *(_WORD *)((char *)&a1 + 5);
        *(_BYTE *)(v4 - 127) = HIBYTE(a1);
        *(_WORD *)(v4 - 126) = v27;
        *(_BYTE *)(v4 - 124) = v28;
        *(_BYTE *)(v4 - 123) = v29;
        *(_BYTE *)(v4 - 122) = v30;
        *(_BYTE *)(v4 - 121) = v31;
        char v16 = *(_BYTE *)(v4 - 134 + v9);
      }

      *(_BYTE *)(v4 - 134) = v16;
      uint64_t v7 = sub_10000313C((char *)(v4 - 134), (uint64_t *)(v4 - 120));
      if (v2) {
        break;
      }
      uint64_t v19 = v8;
      uint64_t v20 = v3;
      uint64_t v21 = *(void *)(v4 - 120);
      uint64_t v22 = *(void *)(v4 - 112);
      uint64_t v1 = v10;
      *(void *)(v4 - 104) = v10;
      unint64_t v24 = *(void *)(v10 + 16);
      unint64_t v23 = *(void *)(v10 + 24);
      if (v24 >= v23 >> 1)
      {
        uint64_t v7 = sub_1000036D4(v23 > 1, v24 + 1, 1);
        uint64_t v19 = a1;
        uint64_t v1 = *(void *)(v4 - 104);
      }

      *(void *)(v1 + 16) = v24 + 1;
      uint64_t v25 = v1 + 16 * v24;
      *(void *)(v25 + 32) = v21;
      *(void *)(v25 + 40) = v22;
      ++v9;
      uint64_t v6 = *(void *)(v4 - 144) - 1LL;
      --v5;
      uint64_t v3 = v20;
      uint64_t v8 = v19;
      if (!v5) {
        return v1;
      }
    }

    swift_release(v10);
  }

  return v1;
}

id sub_100003644()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PushManager()
{
  return objc_opt_self(&OBJC_CLASS___DPDPushManager);
}

uint64_t sub_1000036D4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000036F0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000036F0(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100004544(&qword_10000CAF0);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

void sub_100003858(void *a1, char a2)
{
  if (qword_10000CA28 != -1) {
    swift_once(&qword_10000CA28, sub_100006304);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_100004490(v4, (uint64_t)qword_10000CD88);
  id v12 = a1;
  uint64_t v5 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc(28LL, -1LL);
    uint64_t v8 = (void *)swift_slowAlloc(8LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    uint64_t v14 = v9;
    *(_DWORD *)uint64_t v7 = 138412802;
    if (a1)
    {
      uint64_t v13 = (uint64_t)v12;
      id v10 = v12;
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);
    void *v8 = a1;

    *(_WORD *)(v7 + 12) = 2080;
    uint64_t v13 = sub_100005B5C(0xD000000000000027LL, 0x8000000100006E50LL, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);
    *(_WORD *)(v7 + 22) = 1024;
    LODWORD(v13) = a2 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, (char *)&v13 + 4);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ %s connected: %{BOOL}d", (uint8_t *)v7, 0x1Cu);
    uint64_t v11 = sub_100004544(&qword_10000CAE0);
    swift_arrayDestroy(v8, 1LL, v11);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {
  }

void sub_100003B18(void *a1)
{
  if (qword_10000CA28 != -1) {
    swift_once(&qword_10000CA28, sub_100006304);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100004490(v2, (uint64_t)qword_10000CD88);
  id v10 = a1;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc(22LL, -1LL);
    os_log_type_t v6 = (void *)swift_slowAlloc(8LL, -1LL);
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    uint64_t v12 = v7;
    *(_DWORD *)uint64_t v5 = 138412546;
    if (a1)
    {
      uint64_t v11 = (uint64_t)v10;
      id v8 = v10;
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12);
    *os_log_type_t v6 = a1;

    *(_WORD *)(v5 + 12) = 2080;
    uint64_t v11 = sub_100005B5C(0xD00000000000001ALL, 0x8000000100006E30LL, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@ %s", (uint8_t *)v5, 0x16u);
    uint64_t v9 = sub_100004544(&qword_10000CAE0);
    swift_arrayDestroy(v6, 1LL, v9);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  else
  {
  }

void sub_100003DB0(void *a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 60 != 15)
  {
    sub_100004500(a2, a3);
    sub_1000031C4(a2, a3);
    uint64_t v7 = v6;
    uint64_t v25 = v6;
    uint64_t v8 = sub_100004544(&qword_10000CAD0);
    unint64_t v9 = sub_100004584();
    uint64_t v10 = BidirectionalCollection<>.joined(separator:)(0LL, 0xE000000000000000LL, v8, v9);
    unint64_t v12 = v11;
    swift_bridgeObjectRelease(v7, v11);
    if (qword_10000CA28 != -1) {
      swift_once(&qword_10000CA28, sub_100006304);
    }
    uint64_t v13 = type metadata accessor for Logger(0LL);
    sub_100004490(v13, (uint64_t)qword_10000CD88);
    id v14 = a1;
    uint64_t v15 = swift_bridgeObjectRetain(v12);
    char v16 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc(32LL, -1LL);
      uint64_t v21 = (void *)swift_slowAlloc(8LL, -1LL);
      uint64_t v22 = swift_slowAlloc(64LL, -1LL);
      uint64_t v25 = v22;
      *(_DWORD *)uint64_t v18 = 138412802;
      if (a1)
      {
        uint64_t v23 = (uint64_t)v14;
        id v19 = v14;
      }

      else
      {
        uint64_t v23 = 0LL;
      }

      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24);
      *uint64_t v21 = a1;

      *(_WORD *)(v18 + 12) = 2080;
      uint64_t v23 = sub_100005B5C(0xD000000000000024LL, 0x8000000100006DA0LL, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24);
      *(_WORD *)(v18 + 22) = 2080;
      swift_bridgeObjectRetain(v12);
      uint64_t v23 = sub_100005B5C(v10, v12, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24);
      swift_bridgeObjectRelease_n(v12, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ %s token: %s", (uint8_t *)v18, 0x20u);
      uint64_t v20 = sub_100004544(&qword_10000CAE0);
      swift_arrayDestroy(v21, 1LL, v20);
      swift_slowDealloc(v21, -1LL, -1LL);
      swift_arrayDestroy(v22, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1LL, -1LL);
      swift_slowDealloc(v18, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(v12, 2LL);
    }

    sub_1000044A8(a2, a3);
  }

void sub_1000040F0(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10000CA28 != -1) {
    swift_once(&qword_10000CA28, sub_100006304);
  }
  uint64_t v6 = sub_100004490(v2, (uint64_t)qword_10000CD88);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = a1;
  uint64_t v8 = (void *)Logger.logObject.getter(v7);
  int v9 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled((os_log_t)v8, (os_log_type_t)v9))
  {

    uint64_t v27 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    goto LABEL_9;
  }

  uint64_t v10 = swift_slowAlloc(22LL, -1LL);
  uint64_t v11 = swift_slowAlloc(64LL, -1LL);
  uint64_t v37 = v11;
  *(_DWORD *)uint64_t v10 = 136446466;
  if (!a1)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v33 = v11;
  int v34 = v9;
  os_log_t v35 = (os_log_t)v8;
  id v12 = [v7 topic];
  if (!v12)
  {
LABEL_13:

    __break(1u);
    goto LABEL_14;
  }

  uint64_t v13 = v12;
  v31[1] = v6;
  uint64_t v32 = v3;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  unint64_t v16 = v15;

  uint64_t v36 = sub_100005B5C(v14, v16, &v37);
  v31[0] = &v37;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37);

  swift_bridgeObjectRelease(v16, v17);
  *(_WORD *)(v10 + 12) = 2082;
  id v18 = [v7 userInfo];
  if (!v18)
  {
LABEL_14:

    __break(1u);
    return;
  }

  id v19 = v18;
  uint64_t v20 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v18,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

  uint64_t v21 = Dictionary.description.getter( v20,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  unint64_t v23 = v22;
  swift_bridgeObjectRelease(v20, v22);
  uint64_t v36 = sub_100005B5C(v21, v23, &v37);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v31[0]);

  swift_bridgeObjectRelease(v23, v24);
  os_log_t v25 = v35;
  _os_log_impl( (void *)&_mh_execute_header,  v35,  (os_log_type_t)v34,  "Received push with topic: %{public}s userInfo: %{public}s",  (uint8_t *)v10,  0x16u);
  uint64_t v26 = v33;
  swift_arrayDestroy(v33, 2LL, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v26, -1LL, -1LL);
  swift_slowDealloc(v10, -1LL, -1LL);

  uint64_t v27 = (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v5, v2);
LABEL_9:
  char v28 = (os_log_s *)Logger.logObject.getter(v27);
  os_log_type_t v29 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v29))
  {
    char v30 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)char v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Not supported on this platform", v30, 2u);
    swift_slowDealloc(v30, -1LL, -1LL);
  }
}

uint64_t sub_100004490(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000044A8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000044BC(a1, a2);
  }
  return a1;
}

uint64_t sub_1000044BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_release)();
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100004500(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_retain)();
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100004544(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100004584()
{
  unint64_t result = qword_10000CAD8;
  if (!qword_10000CAD8)
  {
    uint64_t v1 = sub_1000045D0(&qword_10000CAD0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000CAD8);
  }

  return result;
}

uint64_t sub_1000045D0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100004618()
{
  unint64_t result = qword_10000CAF8;
  if (!qword_10000CAF8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000CAF8);
  }

  return result;
}

uint64_t sub_100004654()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for AlertManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC16diagnosticspushd12AlertManager);
}

void sub_100004698()
{
  uint64_t v0 = type metadata accessor for DefaultsManager();
  uint64_t v1 = swift_allocObject(v0, 24LL, 7LL);
  id v2 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 initWithSuiteName:v3];

  *(void *)(v1 + 16) = v4;
  qword_10000CD78 = v1;
}

uint64_t type metadata accessor for DefaultsManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC16diagnosticspushd15DefaultsManager);
}

id sub_100004744()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for BackgroundTaskManager()) init];
  qword_10000CD80 = (uint64_t)result;
  return result;
}

char *sub_1000047B0()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(v0);
  id v2 = &v0[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
  *(void *)id v2 = 0xD000000000000026LL;
  *((void *)v2 + 1) = 0x8000000100006F70LL;
  v33.receiver = v0;
  v33.super_class = ObjectType;
  id v3 = objc_msgSendSuper2(&v33, "init");
  id v4 = (void *)objc_opt_self(&OBJC_CLASS___BGSystemTaskScheduler);
  uint64_t v5 = (char *)v3;
  id v6 = [v4 sharedScheduler];
  id v7 = (uint64_t *)&v5[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
  uint64_t v8 = *(void *)&v5[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier + 8];
  swift_bridgeObjectRetain(v8);
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8, v10);
  uint64_t v11 = swift_allocObject(&unk_100008488, 24LL, 7LL);
  *(void *)(v11 + 16) = v5;
  aBlock[4] = (uint64_t)sub_100005A68;
  uint64_t v32 = v11;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = (uint64_t)sub_10000571C;
  aBlock[3] = (uint64_t)&unk_1000084A0;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = v32;
  uint64_t v14 = v5;
  swift_release(v13);
  LODWORD(v13) = [v6 registerForTaskWithIdentifier:v9 usingQueue:0 launchHandler:v12];
  _Block_release(v12);

  if (!(_DWORD)v13)
  {
    if (qword_10000CA30 != -1) {
      swift_once(&qword_10000CA30, sub_10000631C);
    }
    uint64_t v25 = type metadata accessor for Logger(0LL);
    sub_100004490(v25, (uint64_t)qword_10000CDA0);
    unint64_t v16 = v14;
    uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v20 = swift_slowAlloc(32LL, -1LL);
      aBlock[0] = v20;
      *(_DWORD *)id v19 = 136446210;
      uint64_t v26 = *v7;
      unint64_t v27 = v7[1];
      swift_bridgeObjectRetain(v27);
      uint64_t v30 = sub_100005B5C(v26, v27, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, aBlock);

      swift_bridgeObjectRelease(v27, v28);
      uint64_t v24 = "Task %{public}s was not registered successfully";
      goto LABEL_10;
    }

LABEL_11:
    goto LABEL_12;
  }

  if (qword_10000CA30 != -1) {
    swift_once(&qword_10000CA30, sub_10000631C);
  }
  uint64_t v15 = type metadata accessor for Logger(0LL);
  sub_100004490(v15, (uint64_t)qword_10000CDA0);
  unint64_t v16 = v14;
  uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v17, v18)) {
    goto LABEL_11;
  }
  id v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  uint64_t v20 = swift_slowAlloc(32LL, -1LL);
  aBlock[0] = v20;
  *(_DWORD *)id v19 = 136446210;
  uint64_t v21 = *v7;
  unint64_t v22 = v7[1];
  swift_bridgeObjectRetain(v22);
  uint64_t v30 = sub_100005B5C(v21, v22, aBlock);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, aBlock);

  swift_bridgeObjectRelease(v22, v23);
  uint64_t v24 = "Task %{public}s registered successfully";
LABEL_10:
  _os_log_impl((void *)&_mh_execute_header, v17, v18, v24, v19, 0xCu);
  swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v20, -1LL, -1LL);
  swift_slowDealloc(v19, -1LL, -1LL);

LABEL_12:
  return v14;
}

uint64_t sub_100004B88(void *a1, void *a2)
{
  uint64_t v4 = swift_allocObject(&unk_1000084D8, 17LL, 7LL);
  *(_BYTE *)(v4 + 16) = 0;
  uint64_t v5 = swift_allocObject(&unk_100008500, 32LL, 7LL);
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = v4;
  aBlock[4] = sub_100006244;
  uint64_t v66 = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000056F0;
  aBlock[3] = &unk_100008518;
  id v6 = _Block_copy(aBlock);
  uint64_t v7 = v66;
  id v8 = a2;
  swift_retain(v4);
  swift_release(v7);
  [a1 setExpirationHandler:v6];
  _Block_release(v6);
  swift_beginAccess(v4 + 16, aBlock, 0LL, 0LL);
  NSString v9 = &DPDPushManager__prots;
  uint64_t v10 = &DPDPushManager__prots;
  if (*(_BYTE *)(v4 + 16) == 1)
  {
    if (qword_10000CA30 != -1) {
      swift_once(&qword_10000CA30, sub_10000631C);
    }
    uint64_t v11 = type metadata accessor for Logger(0LL);
    uint64_t v12 = sub_100004490(v11, (uint64_t)qword_10000CDA0);
    uint64_t v13 = (char *)v8;
    uint64_t v57 = v12;
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = v13;
      uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      id v58 = v8;
      os_log_type_t v18 = (void *)swift_slowAlloc(32LL, -1LL);
      id v64 = v18;
      *(_DWORD *)uint64_t v17 = 136446210;
      uint64_t v60 = v4;
      uint64_t v19 = *(void *)&v13[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
      unint64_t v20 = *(void *)&v16[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier + 8];
      swift_bridgeObjectRetain(v20);
      uint64_t v21 = v19;
      uint64_t v13 = v16;
      uint64_t v63 = sub_100005B5C(v21, v20, (uint64_t *)&v64);
      uint64_t v10 = &DPDPushManager__prots;
      NSString v9 = &DPDPushManager__prots;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64);

      unint64_t v22 = v20;
      uint64_t v4 = v60;
      swift_bridgeObjectRelease(v22, v23);
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "Task %{public}s was expired immediately after being run",  v17,  0xCu);
      swift_arrayDestroy(v18, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v24 = v18;
      id v8 = v58;
      swift_slowDealloc(v24, -1LL, -1LL);
      swift_slowDealloc(v17, -1LL, -1LL);
    }

    else
    {
    }

    id v64 = 0LL;
    unsigned int v25 = objc_msgSend(a1, "setTaskExpiredWithRetryAfter:error:", &v64, 0.0, v57);
    id v26 = v64;
    if (v25)
    {
      id v27 = v64;
    }

    else
    {
      id v62 = a1;
      uint64_t v28 = v13;
      id v29 = v64;
      uint64_t v30 = _convertNSErrorToError(_:)(v26);

      swift_willThrow();
      id v31 = v28;
      swift_errorRetain(v30);
      uint64_t v32 = (char *)v31;
      uint64_t v33 = swift_errorRetain(v30);
      int v34 = (os_log_s *)Logger.logObject.getter(v33);
      os_log_type_t v35 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = swift_slowAlloc(22LL, -1LL);
        id v59 = v8;
        uint64_t v37 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
        v38 = (void *)swift_slowAlloc(32LL, -1LL);
        id v64 = v38;
        *(_DWORD *)uint64_t v36 = 136446466;
        uint64_t v61 = v4;
        uint64_t v39 = *(void *)&v32[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
        unint64_t v40 = *(void *)&v32[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier + 8];
        swift_bridgeObjectRetain(v40);
        uint64_t v63 = sub_100005B5C(v39, v40, (uint64_t *)&v64);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64);

        swift_bridgeObjectRelease(v40, v41);
        *(_WORD *)(v36 + 12) = 2114;
        swift_errorRetain(v30);
        uint64_t v42 = _swift_stdlib_bridgeErrorToNSError(v30);
        uint64_t v63 = v42;
        uint64_t v4 = v61;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64);
        *uint64_t v37 = v42;
        uint64_t v10 = &DPDPushManager__prots;
        swift_errorRelease(v30);
        swift_errorRelease(v30);
        _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "Failed to expire task %{public}s: %{public}@",  (uint8_t *)v36,  0x16u);
        uint64_t v43 = sub_100004544(&qword_10000CAE0);
        swift_arrayDestroy(v37, 1LL, v43);
        uint64_t v44 = v37;
        id v8 = v59;
        swift_slowDealloc(v44, -1LL, -1LL);
        swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
        id v45 = v38;
        NSString v9 = &DPDPushManager__prots;
        swift_slowDealloc(v45, -1LL, -1LL);
        swift_slowDealloc(v36, -1LL, -1LL);
      }

      else
      {

        swift_errorRelease(v30);
        swift_errorRelease(v30);
      }

      a1 = v62;
      [v62 (SEL)v10[265].count];
      swift_errorRelease(v30);
    }
  }

  if (v9[326].count != -1LL) {
    swift_once(&qword_10000CA30, sub_10000631C);
  }
  uint64_t v46 = type metadata accessor for Logger(0LL);
  sub_100004490(v46, (uint64_t)qword_10000CDA0);
  uint64_t v47 = (char *)v8;
  uint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
  os_log_type_t v49 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v48, v49))
  {
    unint64_t v50 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v51 = (void *)swift_slowAlloc(32LL, -1LL);
    id v64 = v51;
    *(_DWORD *)unint64_t v50 = 136446210;
    uint64_t v52 = *(void *)&v47[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
    unint64_t v53 = *(void *)&v47[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier + 8];
    swift_bridgeObjectRetain(v53);
    uint64_t v63 = sub_100005B5C(v52, v53, (uint64_t *)&v64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64);

    swift_bridgeObjectRelease(v53, v54);
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "Handling task %{public}s", v50, 0xCu);
    swift_arrayDestroy(v51, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1LL, -1LL);
    uint64_t v55 = v50;
    uint64_t v10 = &DPDPushManager__prots;
    swift_slowDealloc(v55, -1LL, -1LL);
  }

  else
  {
  }

  if (qword_10000CA10 != -1) {
    swift_once(&qword_10000CA10, sub_100002AC8);
  }
  [a1 (SEL)v10[265].count];
  return swift_release(v4);
}

void sub_100005264(void *a1, uint64_t a2)
{
  if (qword_10000CA30 != -1) {
    swift_once(&qword_10000CA30, sub_10000631C);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_100004490(v4, (uint64_t)qword_10000CDA0);
  uint64_t v5 = a1;
  id v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    v14[0] = v9;
    *(_DWORD *)id v8 = 136446210;
    uint64_t v10 = *(void *)&v5[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
    unint64_t v11 = *(void *)&v5[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier + 8];
    swift_bridgeObjectRetain(v11);
    uint64_t v13 = sub_100005B5C(v10, v11, v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, v14);

    swift_bridgeObjectRelease(v11, v12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Task %{public}s expired by DAS", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
  }

  swift_beginAccess(a2 + 16, v14, 1LL, 0LL);
  *(_BYTE *)(a2 + 16) = 1;
  sub_100005434();
}

void sub_100005434()
{
  if (&class metadata base offset for TapToRadarService) {
    BOOL v1 = &type metadata accessor for TapToRadarService == 0LL;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1 && &type metadata for TapToRadarService != 0LL && &nominal type descriptor for TapToRadarService != 0LL)
  {
    uint64_t v4 = v0;
    id v5 = [objc_allocWithZone(RadarDraft) init];
    NSString v6 = String._bridgeToObjectiveC()();
    [v5 setTitle:v6];

    _StringGuts.grow(_:)(44LL);
    swift_bridgeObjectRelease(0xE000000000000000LL, v7);
    uint64_t v8 = v4 + OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier;
    uint64_t v9 = *(void *)(v4 + OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier);
    uint64_t v10 = *(void **)(v8 + 8);
    swift_bridgeObjectRetain(v10);
    v11._countAndFlagsBits = v9;
    v11._object = v10;
    String.append(_:)(v11);
    swift_bridgeObjectRelease(v10, v12);
    v13._countAndFlagsBits = 0xD00000000000001ALL;
    v13._object = (void *)0x8000000100007220LL;
    String.append(_:)(v13);
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(0x8000000100007200LL, v15);
    [v5 setProblemDescription:v14];

    id v16 = objc_allocWithZone(&OBJC_CLASS___RadarComponent);
    NSString v17 = String._bridgeToObjectiveC()();
    NSString v18 = String._bridgeToObjectiveC()();
    id v19 = [v16 initWithName:v17 version:v18 identifier:429804];

    [v5 setComponent:v19];
    [v5 setClassification:4];
    [v5 setReproducibility:5];
    [v5 setShouldCapturePerformanceTrace:1];
    type metadata accessor for TapToRadarService(0LL);
    id v20 = (id)static TapToRadarService.shared.getter();
    TapToRadarService.createDraft(_:processName:displayReason:completion:)( v5,  0xD000000000000011LL,  0x8000000100007240LL,  0xD000000000000013LL,  0x8000000100007260LL,  sub_10000578C,  0LL);
  }

uint64_t sub_1000056F0(uint64_t a1)
{
  BOOL v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_10000571C(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

void sub_10000578C(uint64_t a1)
{
  if (a1)
  {
    ((void (*)(void))swift_errorRetain)();
    if (qword_10000CA30 != -1) {
      swift_once(&qword_10000CA30, sub_10000631C);
    }
    uint64_t v2 = type metadata accessor for Logger(0LL);
    sub_100004490(v2, (uint64_t)qword_10000CDA0);
    swift_errorRetain(a1);
    uint64_t v3 = swift_errorRetain(a1);
    oslog = (os_log_s *)Logger.logObject.getter(v3);
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      NSString v6 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)id v5 = 138412290;
      swift_errorRetain(a1);
      uint64_t v7 = _swift_stdlib_bridgeErrorToNSError(a1);
      uint64_t v14 = v7;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15);
      *NSString v6 = v7;
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Failed to create TTR draft: %@", v5, 0xCu);
      uint64_t v8 = sub_100004544(&qword_10000CAE0);
      swift_arrayDestroy(v6, 1LL, v8);
      swift_slowDealloc(v6, -1LL, -1LL);
      swift_slowDealloc(v5, -1LL, -1LL);

      swift_errorRelease(a1);
      return;
    }

    swift_errorRelease(a1);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  else
  {
    if (qword_10000CA30 != -1) {
      swift_once(&qword_10000CA30, sub_10000631C);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    uint64_t v10 = sub_100004490(v9, (uint64_t)qword_10000CDA0);
    oslog = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v11, "Successfully created TTR draft", v12, 2u);
      swift_slowDealloc(v12, -1LL, -1LL);
    }
  }
}

uint64_t type metadata accessor for BackgroundTaskManager()
{
  return objc_opt_self(&OBJC_CLASS___DPDBackgroundTaskManager);
}

uint64_t sub_100005A44()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100005A68(void *a1)
{
  return sub_100004B88(a1, *(void **)(v1 + 16));
}

uint64_t sub_100005A70(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005A80(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100005A88(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100005A98( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100005ACC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100005AEC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_100005B5C(v6, v7, a3);
  uint64_t v10 = *a1 + 8;
  uint64_t v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);
  uint64_t result = swift_bridgeObjectRelease(v8, v11);
  *a1 = v10;
  return result;
}

uint64_t sub_100005B5C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005C2C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000061CC((uint64_t)v12, *a3);
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
      sub_1000061CC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1000061AC(v12);
  return v7;
}

uint64_t sub_100005C2C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100005DE4(a5, a6);
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

uint64_t sub_100005DE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005E78(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006050(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006050(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005E78(uint64_t a1, unint64_t a2)
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
      id v5 = sub_100005FEC(v4, 0LL);
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

void *sub_100005FEC(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100004544(&qword_10000CCD0);
  id v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100006050(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100004544(&qword_10000CCD0);
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
    swift_bridgeObjectRelease(a4, v14);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

_BYTE **sub_10000619C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1000061AC(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000061CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006208()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_100006218()
{
  swift_release(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_100006244()
{
}

void sub_10000624C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  int64_t v7 = (void *)v6;
  uint64_t v8 = *a1 + 8;
  if (v6) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0LL;
  }
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  int64_t v9 = *a2;
  if (*a2)
  {
    *int64_t v9 = v7;
    *a2 = v9 + 1;
  }

  else
  {
  }

uint64_t sub_100006304(uint64_t a1)
{
  return sub_100006348(a1, qword_10000CD88, 1752397168LL, 0xE400000000000000LL);
}

uint64_t sub_10000631C(uint64_t a1)
{
  return sub_100006348(a1, qword_10000CDA0, 0x656863536B736174LL, 0xEE00676E696C7564LL);
}

uint64_t sub_100006348(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Logger(0LL);
  sub_1000063BC(v7, a2);
  sub_100004490(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD00000000000001ALL, 0x8000000100006F10LL, a3, a4);
}

uint64_t *sub_1000063BC(uint64_t a1, uint64_t *a2)
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

uint64_t sub_1000063FC()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for CallbackManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC16diagnosticspushd15CallbackManager);
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}
int main(int argc, const char **argv, const char **envp)
{
  id v3;
  qword_10000CC00 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for ServiceDelegate()) init];
  v3 = [(id)objc_opt_self(NSXPCListener) serviceListener];
  qword_10000CC08 = (uint64_t)v3;
  [v3 setDelegate:qword_10000CC00];
  [v3 resume];
  return 0;
}

uint64_t type metadata accessor for ServiceDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC34PosterPlatformSupportBundleService15ServiceDelegate);
}

id sub_100004A78()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100004AA8()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100006B2C(v0, qword_10000CAF0);
  sub_1000069EC(v0, (uint64_t)qword_10000CAF0);
  return Logger.init(subsystem:category:)( 0xD00000000000002CLL,  0x80000001000077B0LL,  0xD000000000000010LL,  0x8000000100007860LL);
}

uint64_t sub_100004C70(uint64_t a1, uint64_t a2, const void *a3, void *a4)
{
  v4[2] = a4;
  uint64_t v9 = type metadata accessor for URL(0LL);
  v4[3] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v4[4] = v10;
  uint64_t v11 = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v4[5] = v11;
  v4[6] = _Block_copy(a3);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v14 = v13;
  v4[7] = v13;
  uint64_t v15 = unk_10000CB7C;
  v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_10000CB78 + dword_10000CB78);
  id v16 = a4;
  v17 = (void *)swift_task_alloc(v15);
  v4[8] = v17;
  void *v17 = v4;
  v17[1] = sub_100004D58;
  return v19(v11, v12, v14);
}

uint64_t sub_100004D58(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *(void *)(*v2 + 64);
  uint64_t v6 = *v2;
  swift_task_dealloc(v5);
  v7 = *(void (***)(void, void, void))(v6 + 48);
  uint64_t v8 = *(void *)(v6 + 56);
  uint64_t v9 = *(void **)(v6 + 16);
  (*(void (**)(void, void))(*(void *)(v6 + 32) + 8LL))(*(void *)(v6 + 40), *(void *)(v6 + 24));

  swift_bridgeObjectRelease(v8);
  if (v3)
  {
    uint64_t v10 = (void *)_convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    ((void (**)(void, void, void *))v7)[2](v7, 0LL, v10);

    _Block_release(v7);
  }

  else
  {
    ((void (**)(void, void *, void))v7)[2](v7, a1, 0LL);
    _Block_release(v7);
  }

  swift_task_dealloc(*(void *)(v6 + 40));
  return (*(uint64_t (**)(void))(v6 + 8))();
}

id sub_100004E74()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PPSBundleService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PPSBundleService()
{
  return objc_opt_self(&OBJC_CLASS____TtC34PosterPlatformSupportBundleService16PPSBundleService);
}

uint64_t sub_100004EC4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100004F04()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_100004F40()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (const void *)v0[4];
  v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc(dword_10000CB3C);
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_100004FB8;
  return ((uint64_t (*)(uint64_t, uint64_t, const void *, void *))((char *)&dword_10000CB38 + dword_10000CB38))( v2,  v3,  v5,  v4);
}

uint64_t sub_100004FB8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100005000(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_100006CBC;
  return v6();
}

uint64_t sub_100005058()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_10000CB4C);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100006CBC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10000CB48 + dword_10000CB48))(v2, v3, v4);
}

uint64_t sub_1000050D0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100006CBC;
  return v7();
}

uint64_t sub_100005128()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_100005154(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  v7 = (void *)swift_task_alloc(dword_10000CB5C);
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100006CBC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10000CB58 + dword_10000CB58))( a1,  v4,  v5,  v6);
}

uint64_t sub_1000051D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10000531C(a1);
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
  uint64_t v16 = swift_allocObject(&unk_100008408, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10000CB70, v16);
}

uint64_t sub_10000531C(uint64_t a1)
{
  uint64_t v2 = sub_100004EC4(&qword_10000CB30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000535C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1000053C0;
  return v6(a1);
}

uint64_t sub_1000053C0()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000540C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100005430(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10000CB6C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100004FB8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10000CB68 + dword_10000CB68))(a1, v4);
}

uint64_t sub_1000054A0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005570(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006AEC((uint64_t)v12, *a3);
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
      sub_100006AEC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100006ACC(v12);
  return v7;
}

uint64_t sub_100005570(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100005728(a5, a6);
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

uint64_t sub_100005728(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000057BC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005994(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005994(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000057BC(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_100005930(v4, 0LL);
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

void *sub_100005930(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100004EC4(&qword_10000CBF8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100005994(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100004EC4(&qword_10000CBF8);
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

uint64_t sub_100005AE0(uint64_t a1, unint64_t a2)
{
  if (qword_10000C9A0 != -1) {
    swift_once(&qword_10000C9A0, sub_100004AA8);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_1000069EC(v4, (uint64_t)qword_10000CAF0);
  uint64_t v5 = swift_bridgeObjectRetain_n(a2, 2LL);
  unint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    int64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    uint64_t v12 = v9;
    *(_DWORD *)int64_t v8 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v11 = sub_1000054A0(a1, a2, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  return a1;
}

uint64_t sub_100005C84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[10] = a2;
  v3[11] = a3;
  v3[9] = a1;
  uint64_t v4 = type metadata accessor for URL(0LL);
  v3[12] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[13] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[14] = swift_task_alloc(v6);
  v3[15] = swift_task_alloc(v6);
  return swift_task_switch(sub_100005D24, 0LL, 0LL);
}

uint64_t sub_100005D24()
{
  v158 = v0 + 7;
  if (qword_10000C9A0 != -1) {
    swift_once(&qword_10000C9A0, sub_100004AA8);
  }
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[11];
  uint64_t v6 = type metadata accessor for Logger(0LL);
  sub_1000069EC(v6, (uint64_t)qword_10000CAF0);
  os_log_type_t v7 = *(os_log_s **)(v4 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(v2, v1, v3);
  uint64_t v8 = swift_bridgeObjectRetain_n(v5, 2LL);
  uint64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.default.getter();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v12 = v0[15];
  uint64_t v14 = v0[12];
  uint64_t v13 = v0[13];
  unint64_t v15 = v0[11];
  v160 = v0;
  os_log_t log = v7;
  if (v11)
  {
    uint64_t v152 = v0[13];
    uint64_t v16 = v0[10];
    uint64_t v17 = swift_slowAlloc(22LL, -1LL);
    uint64_t v154 = swift_slowAlloc(64LL, -1LL);
    uint64_t v161 = v154;
    *(_DWORD *)uint64_t v17 = 136315394;
    swift_bridgeObjectRetain(v15);
    v0[7] = sub_1000054A0(v16, v15, &v161);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v158, v0 + 8, v17 + 4, v17 + 12);
    swift_bridgeObjectRelease_n(v15, 3LL);
    *(_WORD *)(v17 + 12) = 2080;
    unint64_t v18 = sub_100006A04();
    uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter(v14, v18);
    unint64_t v21 = v20;
    v0[8] = sub_1000054A0(v19, v20, &v161);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 8, v0 + 9, v17 + 14, v17 + 22);
    swift_bridgeObjectRelease(v21);
    v22 = *(void (**)(uint64_t, uint64_t))(v152 + 8);
    v22(v12, v14);
    _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "Loading host configuration for role %s from %s",  (uint8_t *)v17,  0x16u);
    swift_arrayDestroy(v154, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v154, -1LL, -1LL);
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v15, 2LL);
    v22 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v22(v12, v14);
  }

  id v23 = objc_allocWithZone(&OBJC_CLASS___NSBundle);
  URL._bridgeToObjectiveC()(v24);
  v26 = v25;
  id v27 = [v23 initWithURL:v25];

  if (!v27)
  {
    v28 = v160;
    v66 = (void *)v160[11];
    uint64_t v67 = v160[12];
    uint64_t v68 = v160[10];
    uint64_t v161 = 0LL;
    unint64_t v162 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(36LL);
    swift_bridgeObjectRelease(v162);
    uint64_t v161 = 0xD000000000000016LL;
    unint64_t v162 = 0x8000000100007420LL;
    unint64_t v69 = sub_100006A04();
    v70._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v67, v69);
    object = v70._object;
    String.append(_:)(v70);
    swift_bridgeObjectRelease(object);
    v72._countAndFlagsBits = 0x6C6F7220726F6620LL;
    v72._object = (void *)0xEA00000000002065LL;
    String.append(_:)(v72);
    v73._countAndFlagsBits = v68;
    v73._object = v66;
    String.append(_:)(v73);
    unint64_t v74 = v162;
    uint64_t v75 = sub_100005AE0(v161, v162);
    uint64_t v77 = v76;
    swift_bridgeObjectRetain(v76);
    swift_bridgeObjectRelease(v74);
    unint64_t v78 = sub_100006A4C();
    swift_allocError(&type metadata for PPSBundleService.BundleServiceError, v78, 0LL, 0LL);
    uint64_t *v79 = v75;
    v79[1] = v77;
    swift_willThrow();
LABEL_28:
    uint64_t v116 = v28[14];
    swift_task_dealloc(v28[15]);
    swift_task_dealloc(v116);
    return ((uint64_t (*)(void))v28[1])();
  }

  v28 = v160;
  v160[2] = 0LL;
  unsigned int v29 = [v27 loadAndReturnError:v160 + 2];
  v30 = (void *)v160[2];
  if (!v29)
  {
    id v80 = v30;
    _convertNSErrorToError(_:)(v30);

LABEL_27:
    swift_willThrow();

    goto LABEL_28;
  }

  id v31 = v30;
  id v32 = [v27 principalClass];
  if (!v32)
  {
    v81 = (void *)v160[11];
    uint64_t v82 = v160[12];
    uint64_t v83 = v160[10];
    uint64_t v161 = 0LL;
    unint64_t v162 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(57LL);
    v84._countAndFlagsBits = 0xD00000000000002BLL;
    v84._object = (void *)0x8000000100007450LL;
    String.append(_:)(v84);
    unint64_t v85 = sub_100006A04();
    uint64_t v86 = v82;
LABEL_25:
    v107._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v86, v85);
    v108 = v107._object;
    String.append(_:)(v107);
    swift_bridgeObjectRelease(v108);
    unint64_t v98 = 0x6C6F7220726F6620LL;
    unint64_t v99 = 0xEA00000000002065LL;
    goto LABEL_26;
  }

  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v32);
  v160[3] = &OBJC_PROTOCOL___PPSHostConfigurationProviding;
  uint64_t v34 = swift_dynamicCastTypeToObjCProtocolConditional(ObjCClassMetadata, 1LL, v160 + 3);
  if (!v34)
  {
    v81 = (void *)v160[11];
    uint64_t v87 = v160[12];
    uint64_t v83 = v160[10];
    uint64_t v161 = 0LL;
    unint64_t v162 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(93LL);
    v88._object = (void *)0x8000000100007480LL;
    v88._countAndFlagsBits = 0xD000000000000010LL;
    String.append(_:)(v88);
    id v89 = [(id)swift_getObjCClassFromMetadata(ObjCClassMetadata) description];
    uint64_t v90 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v92 = v91;

    v93._countAndFlagsBits = v90;
    v93._object = v92;
    String.append(_:)(v93);
    swift_bridgeObjectRelease(v92);
    v94._countAndFlagsBits = 0x646E7562206E6920LL;
    v94._object = (void *)0xEB0000000020656CLL;
    String.append(_:)(v94);
    unint64_t v95 = sub_100006A04();
    v96._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v87, v95);
    v97 = v96._object;
    String.append(_:)(v96);
    swift_bridgeObjectRelease(v97);
    unint64_t v98 = 0xD00000000000003CLL;
    unint64_t v99 = 0x80000001000074A0LL;
LABEL_26:
    String.append(_:)(*(Swift::String *)&v98);
    v109._countAndFlagsBits = v83;
    v109._object = v81;
    String.append(_:)(v109);
    unint64_t v110 = v162;
    uint64_t v111 = sub_100005AE0(v161, v162);
    uint64_t v113 = v112;
    swift_bridgeObjectRetain(v112);
    swift_bridgeObjectRelease(v110);
    unint64_t v114 = sub_100006A4C();
    swift_allocError(&type metadata for PPSBundleService.BundleServiceError, v114, 0LL, 0LL);
    uint64_t *v115 = v111;
    v115[1] = v113;
    goto LABEL_27;
  }

  id v35 = [(id)swift_getObjCClassFromMetadata(v34) hostConfigurationProvider];
  if (!v35)
  {
    v81 = (void *)v160[11];
    uint64_t v100 = v160[12];
    uint64_t v83 = v160[10];
    uint64_t v161 = 0LL;
    unint64_t v162 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(50LL);
    swift_bridgeObjectRelease(v162);
    uint64_t v161 = 0xD000000000000010LL;
    unint64_t v162 = 0x80000001000074E0LL;
    id v101 = [(id)swift_getObjCClassFromMetadata(ObjCClassMetadata) description];
    uint64_t v102 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v104 = v103;

    v105._countAndFlagsBits = v102;
    v105._object = v104;
    String.append(_:)(v105);
    swift_bridgeObjectRelease(v104);
    v106._countAndFlagsBits = 0xD000000000000012LL;
    v106._object = (void *)0x8000000100007500LL;
    String.append(_:)(v106);
    unint64_t v85 = sub_100006A04();
    uint64_t v86 = v100;
    goto LABEL_25;
  }

  v36 = v35;
  uint64_t v37 = v160[10];
  v38 = (void *)v160[11];
  id v39 = [v35 role];
  uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v42 = v41;

  v43 = (void *)v160[11];
  if (v40 != v37 || v42 != v38)
  {
    if ((_stringCompareWithSmolCheck(_:_:expecting:)(v160[10], v43, v40, v42, 0LL) & 1) == 0)
    {
      uint64_t v128 = v160[12];
      *(void *)v157 = v160[10];
      uint64_t v159 = v160[11];
      uint64_t v161 = 0LL;
      unint64_t v162 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(67LL);
      v129._object = (void *)0x8000000100007480LL;
      v129._countAndFlagsBits = 0xD000000000000010LL;
      String.append(_:)(v129);
      id v130 = [(id)swift_getObjCClassFromMetadata(ObjCClassMetadata) description];
      uint64_t v131 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v133 = v132;

      v134._countAndFlagsBits = v131;
      v134._object = v133;
      String.append(_:)(v134);
      swift_bridgeObjectRelease(v133);
      v135._countAndFlagsBits = 0xD000000000000015LL;
      v135._object = (void *)0x8000000100007520LL;
      String.append(_:)(v135);
      v136._countAndFlagsBits = v40;
      v136._object = v42;
      String.append(_:)(v136);
      swift_bridgeObjectRelease(v42);
      v137._countAndFlagsBits = 0x6E7562206E692027LL;
      v137._object = (void *)0xEC00000020656C64LL;
      String.append(_:)(v137);
      unint64_t v138 = sub_100006A04();
      v139._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v128, v138);
      v140 = v139._object;
      String.append(_:)(v139);
      swift_bridgeObjectRelease(v140);
      v141._countAndFlagsBits = 0x6C6F7220726F6620LL;
      v141._object = (void *)0xEA00000000002065LL;
      String.append(_:)(v141);
      uint64_t v126 = *(void *)v157;
      uint64_t v127 = v159;
      goto LABEL_31;
    }

    v43 = v42;
  }

  swift_bridgeObjectRelease(v43);
  id v44 = [v36 hostConfiguration];
  if (!v44)
  {
    uint64_t v119 = v160[10];
    uint64_t v118 = v160[11];
    uint64_t v161 = 0LL;
    unint64_t v162 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(51LL);
    id v120 = [(id)swift_getObjCClassFromMetadata(ObjCClassMetadata) description];
    uint64_t v121 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v123 = v122;

    v124._countAndFlagsBits = v121;
    v124._object = v123;
    String.append(_:)(v124);
    swift_bridgeObjectRelease(v123);
    v125._countAndFlagsBits = 0xD00000000000002FLL;
    v125._object = (void *)0x8000000100007540LL;
    String.append(_:)(v125);
    uint64_t v126 = v119;
    uint64_t v127 = v118;
LABEL_31:
    String.append(_:)(*(Swift::String *)&v126);
    unint64_t v142 = v162;
    uint64_t v143 = sub_100005AE0(v161, v162);
    uint64_t v145 = v144;
    swift_bridgeObjectRetain(v144);
    swift_bridgeObjectRelease(v142);
    unint64_t v146 = sub_100006A4C();
    swift_allocError(&type metadata for PPSBundleService.BundleServiceError, v146, 0LL, 0LL);
    uint64_t *v147 = v143;
    v147[1] = v145;
    swift_willThrow();

    swift_unknownObjectRelease(v36);
    goto LABEL_28;
  }

  id v45 = v44;
  id v46 = [v44 entries];
  unint64_t v47 = sub_100006A90();
  uint64_t v48 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v46, v47);

  id v155 = v45;
  if ((unint64_t)v48 >> 62)
  {
    if (v48 < 0) {
      uint64_t v149 = v48;
    }
    else {
      uint64_t v149 = v48 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v48);
    uint64_t v153 = _CocoaArrayWrapper.endIndex.getter(v149);
    swift_bridgeObjectRelease(v48);
  }

  else
  {
    uint64_t v153 = *(void *)((v48 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v49 = v160[14];
  uint64_t v51 = v160[11];
  uint64_t v50 = v160[12];
  uint64_t v52 = v160[9];
  swift_bridgeObjectRelease(v48);
  ((void (*)(uint64_t, uint64_t, uint64_t))log)(v49, v52, v50);
  uint64_t v53 = swift_bridgeObjectRetain_n(v51, 2LL);
  v54 = (os_log_s *)Logger.logObject.getter(v53);
  os_log_type_t v55 = static os_log_type_t.default.getter();
  BOOL v56 = os_log_type_enabled(v54, v55);
  uint64_t v57 = v160[14];
  unint64_t v58 = v160[11];
  uint64_t v59 = v160[12];
  if (v56)
  {
    uint64_t v150 = v160[10];
    uint64_t v60 = swift_slowAlloc(32LL, -1LL);
    uint64_t type = swift_slowAlloc(64LL, -1LL);
    uint64_t v161 = type;
    *(_DWORD *)uint64_t v60 = 134218498;
    v160[4] = v153;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v160 + 4, v160 + 5, v60 + 4, v60 + 12);
    *(_WORD *)(v60 + 12) = 2080;
    swift_bridgeObjectRetain(v58);
    v160[5] = sub_1000054A0(v150, v58, &v161);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v160 + 5, v160 + 6, v60 + 14, v60 + 22);
    swift_bridgeObjectRelease_n(v58, 3LL);
    *(_WORD *)(v60 + 22) = 2080;
    unint64_t v61 = sub_100006A04();
    uint64_t v62 = dispatch thunk of CustomStringConvertible.description.getter(v59, v61);
    unint64_t v64 = v63;
    v160[6] = sub_1000054A0(v62, v63, &v161);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v160 + 6, v158, v60 + 24, v60 + 32);
    swift_bridgeObjectRelease(v64);
    v22(v57, v59);
    _os_log_impl( (void *)&_mh_execute_header,  v54,  v55,  "Loaded %ld default configurations for role %s from %s",  (uint8_t *)v60,  0x20u);
    swift_arrayDestroy(type, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(type, -1LL, -1LL);
    uint64_t v65 = v60;
    v28 = v160;
    swift_slowDealloc(v65, -1LL, -1LL);
    swift_unknownObjectRelease(v36);
  }

  else
  {
    swift_bridgeObjectRelease_n(v160[11], 2LL);
    v22(v57, v59);

    swift_unknownObjectRelease(v36);
  }

  uint64_t v148 = v28[14];
  swift_task_dealloc(v28[15]);
  swift_task_dealloc(v148);
  return ((uint64_t (*)(id))v28[1])(v155);
}

uint64_t sub_1000069EC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100006A04()
{
  unint64_t result = qword_10000CB80;
  if (!qword_10000CB80)
  {
    uint64_t v1 = type metadata accessor for URL(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_10000CB80);
  }

  return result;
}

unint64_t sub_100006A4C()
{
  unint64_t result = qword_10000CB88;
  if (!qword_10000CB88)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000078B4, &type metadata for PPSBundleService.BundleServiceError);
    atomic_store(result, (unint64_t *)&qword_10000CB88);
  }

  return result;
}

unint64_t sub_100006A90()
{
  unint64_t result = qword_10000CBF0;
  if (!qword_10000CBF0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___PRSHostConfigurationEntry);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000CBF0);
  }

  return result;
}

uint64_t sub_100006ACC(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100006B2C(uint64_t a1, uint64_t *a2)
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

void *initializeBufferWithCopyOfBuffer for PPSBundleService.BundleServiceError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PPSBundleService.BundleServiceError(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *assignWithCopy for PPSBundleService.BundleServiceError(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v3);
  return a1;
}

__n128 initializeWithTake for PPSBundleService.BundleServiceError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for PPSBundleService.BundleServiceError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for PPSBundleService.BundleServiceError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PPSBundleService.BundleServiceError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

uint64_t sub_100006CA0()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for PPSBundleService.BundleServiceError()
{
  return &type metadata for PPSBundleService.BundleServiceError;
}
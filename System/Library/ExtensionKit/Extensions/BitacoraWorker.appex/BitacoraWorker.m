uint64_t sub_1000027CC()
{
  uint64_t v0;
  v0 = type metadata accessor for Logger(0LL);
  sub_100003710(v0, qword_100008160);
  sub_100003658(v0, (uint64_t)qword_100008160);
  return Logger.init(subsystem:category:)( 0xD000000000000014LL,  0x8000000100003DA0LL,  0xD000000000000011LL,  0x8000000100003DC0LL);
}

uint64_t sub_10000284C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7 = (void *)swift_task_alloc(async function pointer to MLHostExtension.shouldRun(context:)[1]);
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100003750;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_1000028B4(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_100008038 + dword_100008038);
  uint64_t v3 = (void *)swift_task_alloc(unk_10000803C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100002914;
  return v5(a1);
}

uint64_t sub_100002914(uint64_t a1)
{
  uint64_t v6 = *v1;
  uint64_t v3 = *(void *)(v6 + 16);
  uint64_t v4 = *v1;
  uint64_t v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_100002964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v15 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = sub_100002A00;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100002A00()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100002A48(uint64_t a1)
{
  unint64_t v2 = sub_100002CCC();
  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100002A80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100003634();
  *a1 = result;
  a1[1] = v3;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002AFC()
{
  unint64_t result = qword_100008010[0];
  if (!qword_100008010[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100003A58, &type metadata for BitacoraWorker);
    atomic_store(result, qword_100008010);
  }

  return result;
}

void *initializeBufferWithCopyOfBuffer for BitacoraWorker(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for BitacoraWorker(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *assignWithCopy for BitacoraWorker(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v3);
  return a1;
}

__n128 initializeWithTake for BitacoraWorker(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for BitacoraWorker(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for BitacoraWorker(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BitacoraWorker(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BitacoraWorker()
{
  return &type metadata for BitacoraWorker;
}

uint64_t sub_100002C88(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_100002CCC();
  return *(void *)(swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of MLHostExtension.configuration>>,  1LL)
                   + 8);
}

unint64_t sub_100002CCC()
{
  unint64_t result = qword_100008030;
  if (!qword_100008030)
  {
    unint64_t result = swift_getWitnessTable(&unk_100003A18, &type metadata for BitacoraWorker);
    atomic_store(result, (unint64_t *)&qword_100008030);
  }

  return result;
}

uint64_t sub_100002D10(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100002DE0(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100003690((uint64_t)v12, *a3);
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
      sub_100003690((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100003670(v12);
  return v7;
}

uint64_t sub_100002DE0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100002F98(a5, a6);
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

uint64_t sub_100002F98(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000302C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100003204(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100003204(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000302C(uint64_t a1, unint64_t a2)
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
      v5 = sub_1000031A0(v4, 0LL);
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

void *sub_1000031A0(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_1000036CC((uint64_t *)&unk_100008040);
  v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100003204(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_1000036CC((uint64_t *)&unk_100008040);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
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

uint64_t sub_100003350(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return swift_task_switch(sub_100003368, 0LL, 0LL);
}

uint64_t sub_100003368()
{
  if (qword_100008050 != -1) {
    swift_once(&qword_100008050, sub_1000027CC);
  }
  uint64_t v2 = v0 + 24;
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v3 = type metadata accessor for Logger(0LL);
  sub_100003658(v3, (uint64_t)qword_100008160);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v5 = static os_log_type_t.info.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  int64_t v7 = *(void **)(v0 + 24);
  uint64_t v24 = v0;
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc(22LL, -1LL);
    uint64_t v9 = swift_slowAlloc(64LL, -1LL);
    uint64_t v25 = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v10 = MLHostExtensionContext.taskId.getter();
    unint64_t v12 = v11;
    *(void *)(v0 + 16) = sub_100002D10(v10, v11, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v2, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v12);

    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v13 = MLHostExtensionContext.taskName.getter();
    unint64_t v15 = v14;
    *(void *)(v0 + 16) = sub_100002D10(v13, v14, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v2, v8 + 14, v8 + 22);
    swift_bridgeObjectRelease(v15);

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "TaskId: %s, TaskName: %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy(v9, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
  }

  v17 = (os_log_s *)Logger.logObject.getter(v16);
  os_log_type_t v18 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Running aggregation.", v19, 2u);
    swift_slowDealloc(v19, -1LL, -1LL);
  }

  id v20 = [objc_allocWithZone(LBFAggregator) initForMLHost];
  [v20 upload:1 uploadRawEvents:1 skipNullIdentifiers:1];
  id v21 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v22 = MLHostResult.init(status:policy:)(2LL, 1LL);

  return (*(uint64_t (**)(uint64_t))(v24 + 8))(v22);
}

uint64_t sub_100003634()
{
  return 0x61726F6361746942LL;
}

uint64_t sub_100003658(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003670(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003690(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000036CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t *sub_100003710(uint64_t a1, uint64_t *a2)
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
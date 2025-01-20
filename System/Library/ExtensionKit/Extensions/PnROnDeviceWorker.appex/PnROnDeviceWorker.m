uint64_t sub_1000013BC()
{
  uint64_t v0;
  v0 = type metadata accessor for Logger(0LL);
  sub_100001890(v0, qword_1000082B0);
  sub_100001878(v0, (uint64_t)qword_1000082B0);
  return static Logger.pnrworker.getter();
}

uint64_t sub_100001404()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t sub_100001414()
{
  return swift_task_switch(sub_100001428, 0LL, 0LL);
}

uint64_t sub_100001428()
{
  uint64_t v1 = MLHostResult.init(status:policy:)(2LL, 0LL);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_10000146C(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_100008170 + dword_100008170);
  v3 = (void *)swift_task_alloc(unk_100008174);
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1000014CC;
  return v5(a1);
}

uint64_t sub_1000014CC(uint64_t a1)
{
  uint64_t v6 = *v1;
  uint64_t v3 = *(void *)(v6 + 16);
  uint64_t v4 = *v1;
  uint64_t v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_10000151C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v15 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = sub_1000015B8;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000015B8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100001600()
{
  uint64_t v0 = type metadata accessor for PnROnDeviceWorker();
  uint64_t v1 = sub_10000183C(&qword_100008168, (uint64_t)&unk_100003794);
  return MLHostExtension.configuration.getter(v0, v1);
}

void sub_10000164C(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for PnROnDeviceWorker();
  uint64_t v3 = swift_allocObject(v2, 16LL, 7LL);
  if (qword_1000081A0 != -1) {
    swift_once(&qword_1000081A0, sub_1000013BC);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_100001878(v4, (uint64_t)qword_1000082B0);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "PnROnDeviceWorker init", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  *a1 = v3;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for PnROnDeviceWorker();
  uint64_t v4 = sub_10000183C(&qword_100008090, (uint64_t)&unk_1000037D4);
  static AppExtension.main()(v3, v4);
  return 0;
}

uint64_t type metadata accessor for PnROnDeviceWorker()
{
  return objc_opt_self(&OBJC_CLASS____TtC17PnROnDeviceWorker17PnROnDeviceWorker);
}

uint64_t sub_1000017C4()
{
  return sub_10000183C(&qword_100008090, (uint64_t)&unk_1000037D4);
}

uint64_t sub_1000017E8(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_10000183C(&qword_100008168, (uint64_t)&unk_100003794);
  return *(void *)(swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of MLHostExtension.configuration>>,  1LL)
                   + 8);
}

uint64_t sub_10000183C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for PnROnDeviceWorker();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100001878(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100001890(uint64_t a1, uint64_t *a2)
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

uint64_t sub_1000018D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000019A0(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000328C((uint64_t)v12, *a3);
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
      sub_10000328C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000326C(v12);
  return v7;
}

uint64_t sub_1000019A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100001B58(a5, a6);
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

uint64_t sub_100001B58(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100001BEC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100001DC4(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100001DC4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100001BEC(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_100001D60(v4, 0LL);
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

void *sub_100001D60(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_1000031F0(&qword_100008198);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100001DC4(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_1000031F0(&qword_100008198);
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

uint64_t sub_100001F10(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = type metadata accessor for ReliabilityCategory(0LL);
  v1[6] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[7] = v3;
  v1[8] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_1000031F0(&qword_100008188);
  v1[9] = swift_task_alloc((*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_1000031F0(&qword_100008190);
  v1[10] = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for PnRSiriTurnGrainSummary(0LL);
  v1[11] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v1[12] = v7;
  unint64_t v8 = (*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[13] = swift_task_alloc(v8);
  v1[14] = swift_task_alloc(v8);
  uint64_t v9 = type metadata accessor for SELFProcessedStreamTurnReader(0LL);
  v1[15] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v1[16] = v10;
  v1[17] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100002018, 0LL, 0LL);
}

uint64_t sub_100002018()
{
  if ((static Task<>.isCancelled.getter() & 1) != 0)
  {
    if (qword_1000081A0 != -1) {
      swift_once(&qword_1000081A0, sub_1000013BC);
    }
    uint64_t v1 = *(void **)(v0 + 40);
    uint64_t v2 = type metadata accessor for Logger(0LL);
    sub_100001878(v2, (uint64_t)qword_1000082B0);
    uint64_t v3 = (os_log_s *)Logger.logObject.getter(v1);
    os_log_type_t v4 = static os_log_type_t.info.getter();
    BOOL v5 = os_log_type_enabled(v3, v4);
    uint64_t v6 = *(void **)(v0 + 40);
    if (v5)
    {
      uint64_t v7 = swift_slowAlloc(22LL, -1LL);
      uint64_t v24 = swift_slowAlloc(64LL, -1LL);
      uint64_t v25 = v24;
      *(_DWORD *)uint64_t v7 = 136315394;
      uint64_t v8 = MLHostExtensionContext.taskId.getter();
      unint64_t v10 = v9;
      *(void *)(v0 + 24) = sub_1000018D0(v8, v9, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v7 + 4, v7 + 12);
      swift_bridgeObjectRelease(v10);

      *(_WORD *)(v7 + 12) = 2080;
      uint64_t v11 = MLHostExtensionContext.taskName.getter();
      unint64_t v13 = v12;
      *(void *)(v0 + 32) = sub_1000018D0(v11, v12, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v7 + 14, v7 + 22);
      swift_bridgeObjectRelease(v13);

      _os_log_impl( (void *)&_mh_execute_header,  v3,  v4,  "TaskId: %s, TaskName: %s: asked to stop!",  (uint8_t *)v7,  0x16u);
      swift_arrayDestroy(v24, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1LL, -1LL);
      swift_slowDealloc(v7, -1LL, -1LL);
    }

    else
    {
    }

    id v17 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v18 = MLHostResult.init(status:policy:)(1LL, 1LL);
    uint64_t v20 = *(void *)(v0 + 104);
    uint64_t v19 = *(void *)(v0 + 112);
    uint64_t v22 = *(void *)(v0 + 72);
    uint64_t v21 = *(void *)(v0 + 80);
    uint64_t v23 = *(void *)(v0 + 64);
    swift_task_dealloc(*(void *)(v0 + 136));
    swift_task_dealloc(v19);
    swift_task_dealloc(v20);
    swift_task_dealloc(v21);
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v18);
  }

  else
  {
    uint64_t v14 = static StreamIdentifier.SELFProcessedStreamIdentifier.getter();
    SELFProcessedStreamTurnReader.init(streamIdentifier:domain:)(v14);
    v15 = (void *)swift_task_alloc(async function pointer to SELFProcessedStreamTurnReader.read()[1]);
    *(void *)(v0 + 144) = v15;
    void *v15 = v0;
    v15[1] = sub_1000022E0;
    return SELFProcessedStreamTurnReader.read()();
  }
}

uint64_t sub_1000022E0(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 136LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 144LL);
  uint64_t v4 = *(void *)(*(void *)v1 + 120LL);
  uint64_t v5 = *(void *)(*(void *)v1 + 128LL);
  *(void *)(*(void *)v1 + 152LL) = a1;
  swift_task_dealloc(v2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  return swift_task_switch(sub_100002358, 0LL, 0LL);
}

uint64_t sub_100002358()
{
  uint64_t v1 = *(void *)(v0 + 152);
  if (!v1)
  {
    if (qword_1000081A0 != -1) {
      swift_once(&qword_1000081A0, sub_1000013BC);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    sub_100001878(v9, (uint64_t)qword_1000082B0);
    unint64_t v10 = (os_log_s *)((uint64_t (*)(void))Logger.logObject.getter)();
    os_log_type_t v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      unint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "No turn sequence to extract Siri latencies", v12, 2u);
      swift_slowDealloc(v12, -1LL, -1LL);
    }

    id v13 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v14 = 1LL;
    goto LABEL_29;
  }

  if (qword_1000081A0 != -1) {
    goto LABEL_34;
  }
  while (1)
  {
    uint64_t v2 = type metadata accessor for Logger(0LL);
    sub_100001878(v2, (uint64_t)qword_1000082B0);
    uint64_t v3 = swift_bridgeObjectRetain_n(v1, 2LL);
    uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
    os_log_type_t v5 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v4, v5))
    {
      unint64_t v6 = *(void *)(v0 + 152);
      uint64_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v7 = 134217984;
      if (v6 >> 62)
      {
        uint64_t v80 = *(uint64_t *)(v0 + 152) >= 0 ? v6 & 0xFFFFFFFFFFFFFF8LL : v1;
        swift_bridgeObjectRetain(v1);
        uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v80);
        swift_bridgeObjectRelease(v1);
      }

      else
      {
        uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
      }

      swift_bridgeObjectRelease(v1);
      *(void *)(v0 + 16) = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v7 + 4, v7 + 12);
      swift_bridgeObjectRelease(v1);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Received the turnSequence, count is %ld", v7, 0xCu);
      swift_slowDealloc(v7, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(v1, 2LL);
    }

    uint64_t v15 = *(void *)(v0 + 152);
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
    if (!v16) {
      goto LABEL_28;
    }
LABEL_15:
    uint64_t v17 = 0LL;
    uint64_t v18 = *(void *)(v0 + 96);
    unint64_t v19 = *(void *)(v0 + 152) & 0xC000000000000001LL;
    uint64_t v82 = v18;
    uint64_t v83 = v16;
    uint64_t v84 = v1;
    unint64_t v81 = v19;
    while (1)
    {
      id v20 = v19
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v17, v1)
          : *(id *)(v1 + 8 * v17 + 32);
      id v21 = v20;
      if (__OFADD__(v17, 1LL)) {
        break;
      }
      uint64_t v86 = v17 + 1;
      uint64_t v22 = *(void *)(v0 + 72);
      id v23 = v20;
      SiriTurnGrainCalculator.init(from:)(v21);
      uint64_t v24 = type metadata accessor for SiriTurnGrainCalculator(0LL);
      uint64_t v25 = *(void *)(v24 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v22, 1LL, v24) == 1)
      {
        sub_100003230(*(void *)(v0 + 72), &qword_100008188);
        (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 96) + 56LL))( *(void *)(v0 + 80),  1LL,  1LL,  *(void *)(v0 + 88));
LABEL_31:
        uint64_t v56 = *(void *)(v0 + 80);
        uint64_t v58 = *(void *)(v0 + 56);
        uint64_t v57 = *(void *)(v0 + 64);
        uint64_t v59 = *(void *)(v0 + 48);
        swift_bridgeObjectRelease(v84);
        sub_100003230(v56, &qword_100008190);
        uint64_t v60 = enum case for ReliabilityCategory.PnROnDeviceWorkerIssues.doWorkSiriMetricsFailed(_:);
        uint64_t v61 = type metadata accessor for ReliabilityCategory.PnROnDeviceWorkerIssues(0LL);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 104LL))(v57, v60, v61);
        (*(void (**)(uint64_t, void, uint64_t))(v58 + 104))( v57,  enum case for ReliabilityCategory.pnrOnDeviceWorkerIssues(_:),  v59);
        Logger.error(_:_:)(0xD00000000000002CLL, 0x8000000100003860LL, v57);
        uint64_t v62 = (*(uint64_t (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
        uint64_t v63 = static ErrorType.fatal.getter(v62);
        uint64_t v65 = v64;
        uint64_t v66 = static ErrorSubType.PnROnDeviceWorker.getter();
        uint64_t v68 = v67;
        uint64_t v69 = static ErrorSubTypeContext.PnROnDeviceWorkerException.getter();
        uint64_t v71 = v70;
        static FileRadarUtils.autoBugCapture(errorType:errorSubType:subTypeContext:)(v63, v65, v66, v68, v69, v70);
        swift_bridgeObjectRelease(v71);
        swift_bridgeObjectRelease(v68);
        swift_bridgeObjectRelease(v65);
        id v72 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
        uint64_t v55 = MLHostResult.init(status:policy:)(0LL, 1LL);

        goto LABEL_32;
      }

      SiriTurnGrainCalculator.extractLatencies()();
      uint64_t v27 = *(void *)(v0 + 80);
      uint64_t v26 = *(void *)(v0 + 88);
      (*(void (**)(void, uint64_t))(v25 + 8))(*(void *)(v0 + 72), v24);
      v85 = v23;
      uint64_t v29 = *(void *)(v0 + 104);
      uint64_t v28 = *(void *)(v0 + 112);
      uint64_t v30 = *(void *)(v0 + 88);
      (*(void (**)(uint64_t, void, uint64_t))(v18 + 32))(v28, *(void *)(v0 + 80), v30);
      uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v29, v28, v30);
      v32 = (os_log_s *)Logger.logObject.getter(v31);
      os_log_type_t v33 = static os_log_type_t.debug.getter();
      BOOL v34 = os_log_type_enabled(v32, v33);
      uint64_t v35 = *(void *)(v0 + 104);
      uint64_t v36 = *(void *)(v0 + 88);
      if (v34)
      {
        uint64_t v37 = v18;
        uint64_t v38 = swift_slowAlloc(12LL, -1LL);
        uint64_t v39 = swift_slowAlloc(32LL, -1LL);
        uint64_t v87 = v39;
        *(_DWORD *)uint64_t v38 = 136315138;
        uint64_t v40 = PnRSiriTurnGrainSummary.description.getter();
        unint64_t v42 = v41;
        *(void *)(v38 + 4) = sub_1000018D0(v40, v41, &v87);
        swift_bridgeObjectRelease(v42);
        v43 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
        unint64_t v19 = v81;
        v43(v35, v36);
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "siriTurnGrainRecord is %s", (uint8_t *)v38, 0xCu);
        swift_arrayDestroy(v39, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v39, -1LL, -1LL);
        swift_slowDealloc(v38, -1LL, -1LL);
      }

      else
      {
        v43 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
        v43(*(void *)(v0 + 104), *(void *)(v0 + 88));
      }

      uint64_t v44 = *(void *)(v0 + 112);
      uint64_t v45 = type metadata accessor for SELFPnREmitter(0LL);
      swift_allocObject(v45, *(unsigned int *)(v45 + 48), *(unsigned __int16 *)(v45 + 52));
      uint64_t v46 = SELFPnREmitter.init()();
      SELFPnREmitter.uploadProvisionalSiriTurnGrainLatency(for:)(v44);
      v47 = v43;
      uint64_t v48 = swift_release(v46);
      v49 = (os_log_s *)Logger.logObject.getter(v48);
      os_log_type_t v50 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "About to do uploadSiriTurnGrainLatency", v51, 2u);
        swift_slowDealloc(v51, -1LL, -1LL);
      }

      uint64_t v52 = *(void *)(v0 + 112);

      swift_allocObject(v45, *(unsigned int *)(v45 + 48), *(unsigned __int16 *)(v45 + 52));
      uint64_t v53 = SELFPnREmitter.init()();
      SELFPnREmitter.uploadSiriTurnGrainLatency(for:)(v52);
      v47(*(void *)(v0 + 112), *(void *)(v0 + 88));

      swift_release(v53);
      ++v17;
      uint64_t v1 = v84;
      uint64_t v18 = v82;
      if (v86 == v83) {
        goto LABEL_28;
      }
    }

    __break(1u);
LABEL_34:
    swift_once(&qword_1000081A0, sub_1000013BC);
  }

  if (v15 >= 0) {
    uint64_t v79 = v15 & 0xFFFFFFFFFFFFFF8LL;
  }
  else {
    uint64_t v79 = v1;
  }
  swift_bridgeObjectRetain(v1);
  uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v79);
  swift_bridgeObjectRelease(v1);
  if (v16) {
    goto LABEL_15;
  }
LABEL_28:
  swift_bridgeObjectRelease(v1);
  id v54 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v14 = 2LL;
LABEL_29:
  uint64_t v55 = MLHostResult.init(status:policy:)(v14, 1LL);
LABEL_32:
  uint64_t v74 = *(void *)(v0 + 104);
  uint64_t v73 = *(void *)(v0 + 112);
  uint64_t v76 = *(void *)(v0 + 72);
  uint64_t v75 = *(void *)(v0 + 80);
  uint64_t v77 = *(void *)(v0 + 64);
  swift_task_dealloc(*(void *)(v0 + 136));
  swift_task_dealloc(v73);
  swift_task_dealloc(v74);
  swift_task_dealloc(v75);
  swift_task_dealloc(v76);
  swift_task_dealloc(v77);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v55);
}

uint64_t sub_100002D58(uint64_t a1)
{
  *(void *)(v1 + 56) = a1;
  return swift_task_switch(sub_100002D70, 0LL, 0LL);
}

uint64_t sub_100002D70()
{
  if (qword_1000081A0 != -1) {
    swift_once(&qword_1000081A0, sub_1000013BC);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_100001878(v1, (uint64_t)qword_1000082B0);
  v0[8] = v2;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "PnROnDeviceWorker doWork start", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)&dword_100008178 + dword_100008178);
  unint64_t v6 = (void *)swift_task_alloc(unk_10000817C);
  v0[9] = v6;
  *unint64_t v6 = v0;
  v6[1] = sub_100002E88;
  return v8(v0[7]);
}

uint64_t sub_100002E88(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 72LL);
  *(void *)(*(void *)v1 + 80LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100002EE4, 0LL, 0LL);
}

uint64_t sub_100002EE4()
{
  uint64_t v1 = v0 + 40;
  uint64_t v2 = (objc_class *)type metadata accessor for MLHostResult(0LL);
  id v3 = objc_allocWithZone(v2);
  os_log_type_t v4 = (void *)MLHostResult.init(status:policy:)(2LL, 1LL);
  uint64_t v5 = MLHostResult.status.getter();
  uint64_t v6 = MLHostResultStatus.rawValue.getter(v5);
  if (v6 != MLHostResultStatus.rawValue.getter(2LL)
    || (uint64_t v7 = MLHostResult.status.getter(),
        uint64_t v8 = MLHostResultStatus.rawValue.getter(v7),
        uint64_t v9 = 2LL,
        v8 != MLHostResultStatus.rawValue.getter(2LL)))
  {
    uint64_t v10 = MLHostResult.status.getter();
    uint64_t v11 = MLHostResultStatus.rawValue.getter(v10);
    uint64_t v9 = 0LL;
    if (v11 != MLHostResultStatus.rawValue.getter(0LL))
    {
      uint64_t v12 = MLHostResult.status.getter();
      uint64_t v13 = MLHostResultStatus.rawValue.getter(v12);
      uint64_t v9 = 0LL;
      if (v13 != MLHostResultStatus.rawValue.getter(0LL))
      {
        uint64_t v14 = MLHostResult.status.getter();
        uint64_t v15 = MLHostResultStatus.rawValue.getter(v14);
        uint64_t v9 = 2LL;
        if (v15 != MLHostResultStatus.rawValue.getter(2LL))
        {
          uint64_t v16 = MLHostResult.status.getter();
          uint64_t v17 = MLHostResultStatus.rawValue.getter(v16);
          if (v17 == MLHostResultStatus.rawValue.getter(1LL)
            || (uint64_t v18 = MLHostResult.status.getter(),
                uint64_t v19 = MLHostResultStatus.rawValue.getter(v18),
                v19 == MLHostResultStatus.rawValue.getter(1LL)))
          {
            uint64_t v9 = 2LL;
          }

          else
          {
            uint64_t v20 = MLHostResult.status.getter();
            uint64_t v21 = MLHostResultStatus.rawValue.getter(v20);
            if (v21 == MLHostResultStatus.rawValue.getter(2LL)) {
              uint64_t v9 = 2LL;
            }
            else {
              uint64_t v9 = 1LL;
            }
          }
        }
      }
    }
  }

  id v22 = objc_allocWithZone(v2);
  id v23 = (void *)MLHostResult.init(status:policy:)(v9, 1LL);
  *(void *)(v0 + 40) = v23;
  id v24 = v23;
  uint64_t v25 = (os_log_s *)Logger.logObject.getter(v24);
  os_log_type_t v26 = static os_log_type_t.default.getter();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v28 = *(void **)(v0 + 80);
  if (v27)
  {
    uint64_t v35 = *(void **)(v0 + 80);
    uint64_t v29 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    BOOL v34 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v29 = 138412290;
    *(void *)(v0 + 48) = v24;
    id v30 = v24;
    uint64_t v1 = v0 + 40;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v29 + 4, v29 + 12);
    *BOOL v34 = v24;

    _os_log_impl((void *)&_mh_execute_header, v25, v26, "PnROnDeviceWorker doWork end %@", v29, 0xCu);
    uint64_t v31 = sub_1000031F0(&qword_100008180);
    swift_arrayDestroy(v34, 1LL, v31);
    swift_slowDealloc(v34, -1LL, -1LL);
    v32 = v29;
    uint64_t v28 = v35;
    swift_slowDealloc(v32, -1LL, -1LL);
  }

  else
  {
  }

  swift_beginAccess(v1, v0 + 16, 0LL, 0LL);
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 40));
}

uint64_t sub_1000031F0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100003230(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000031F0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10000326C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000328C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}
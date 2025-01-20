uint64_t sub_2AC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  v0 = type metadata accessor for Logger(0LL);
  sub_3720(v0, qword_8248);
  v1 = sub_2EC0(v0, (uint64_t)qword_8248);
  v2 = SFMLog.snippet.unsafeMutableAddressor();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

uint64_t sub_2B24(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t FriendSnippetData = type metadata accessor for FindFriendSnippetData(0LL);
  __chkstk_darwin();
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_8240 != -1) {
    swift_once(&qword_8240, sub_2AC8);
  }
  uint64_t v13 = type metadata accessor for Logger(0LL);
  sub_2EC0(v13, (uint64_t)qword_8248);
  uint64_t v14 = swift_bridgeObjectRetain_n(a2, 2LL);
  v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v27 = v12;
    uint64_t v17 = swift_slowAlloc(12LL, -1LL);
    uint64_t v28 = a4;
    v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc(32LL, -1LL);
    uint64_t v29 = v4;
    uint64_t v20 = v19;
    uint64_t v32 = v19;
    *(_DWORD *)v18 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v30 = sub_2F18(a1, a2, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v18 + 4, v18 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl(&dword_0, v15, v16, "FindMyUIPlugin creating view for id=%s", v18, 0xCu);
    swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v21 = v20;
    uint64_t v5 = v29;
    sub_3764(v21);
    uint64_t v22 = (uint64_t)v18;
    a4 = v28;
    sub_3764(v22);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  uint64_t v23 = type metadata accessor for PropertyListDecoder(0LL);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  uint64_t v24 = PropertyListDecoder.init()();
  uint64_t v25 = sub_2ED8( &qword_8130,  (uint64_t (*)(uint64_t))&type metadata accessor for FindFriendSnippetData,  (uint64_t)&protocol conformance descriptor for FindFriendSnippetData);
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(FriendSnippetData, a3, a4, FriendSnippetData, v25);
  if (v5) {
    return swift_release(v24);
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000028LL,  0x8000000000003A70LL,  "SiriFindMyUI/SnippetViewProvider.swift",  38LL,  2LL,  22LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_2DE4()
{
  return SnippetViewProvider.snippetView(for:)();
}

uint64_t sub_2E08()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for FindMyUIPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC14FindMyUIPlugin14FindMyUIPlugin);
}

uint64_t sub_2E38()
{
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t sub_2E48()
{
  return sub_2ED8( &qword_8128,  (uint64_t (*)(uint64_t))&type metadata accessor for Snippets,  (uint64_t)&protocol conformance descriptor for Snippets);
}

uint64_t sub_2E74(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2B24(a1, a2, a3, a4);
}

uint64_t sub_2E88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2E38();
  *a1 = result;
  return result;
}

uint64_t sub_2EAC()
{
  return sub_2DE4();
}

uint64_t sub_2EC0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2ED8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_2F18(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2FE8(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_36A0((uint64_t)v12, *a3);
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
      sub_36A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_3680(v12);
  return v7;
}

void *sub_2FE8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_313C((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_3200(a5, a6);
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

void *sub_313C(char *__src, size_t __n, char *__dst)
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

void *sub_3200(uint64_t a1, unint64_t a2)
{
  v2 = sub_3294(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v2 = sub_3468(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    v2 = sub_3468((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_3294(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_3404(v4, 0LL);
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

void *sub_3404(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_36DC(&qword_8138);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_3468(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_36DC(&qword_8138);
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
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_3600(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_353C(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_353C(char *__src, size_t __n, char *__dst)
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

char *sub_3600(char *__src, size_t __len, char *__dst)
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

uint64_t sub_3680(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_36A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_36DC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t *sub_3720(uint64_t a1, uint64_t *a2)
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

uint64_t sub_3764(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}
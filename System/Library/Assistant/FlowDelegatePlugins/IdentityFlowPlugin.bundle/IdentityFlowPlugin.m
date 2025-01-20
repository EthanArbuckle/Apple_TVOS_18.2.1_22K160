uint64_t sub_2764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t result;
  uint64_t v11;
  v4 = type metadata accessor for Parse(0LL);
  v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for Parse.NLv3IntentOnly(_:))
  {
    sub_28BC(a1, a2);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  else if (v8 == enum case for Parse.NLv4IntentOnly(_:) || v8 == enum case for Parse.uso(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return sub_28BC(a1, a2);
  }

  else
  {
    result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000002DLL,  0x8000000000003DA0LL,  "IdentityFlowPlugin/IdentityFlowPlugin.swift",  43LL,  2LL,  37LL,  0);
    __break(1u);
  }

  return result;
}

uint64_t sub_28BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Parse(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  v10 = (char *)&v32 - v9;
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  IdentityFlowProvider.init()(v38, v13);
  uint64_t v16 = IdentityFlowProvider.makeFlow(for:)(a1);
  sub_3650((uint64_t)v38);
  if (v16)
  {
    static FlowSearchResult.flow(_:)(v16);
    return swift_release(v16);
  }

  else
  {
    uint64_t v36 = a2;
    if (qword_80D8 != -1) {
      swift_once(&qword_80D8, sub_36E4);
    }
    uint64_t v18 = sub_3514(v11, (uint64_t)qword_82C0);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v18, v11);
    v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v20 = v19(v10, a1, v4);
    v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.error.getter();
    int v23 = v22;
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v24 = swift_slowAlloc(12LL, -1LL);
      int v34 = v23;
      v25 = (uint8_t *)v24;
      uint64_t v35 = swift_slowAlloc(32LL, -1LL);
      v38[0] = v35;
      os_log_t v33 = v21;
      *(_DWORD *)v25 = 136315138;
      v32 = v25 + 4;
      v19(v8, (uint64_t)v10, v4);
      uint64_t v26 = String.init<A>(describing:)(v8, v4);
      unint64_t v28 = v27;
      uint64_t v37 = sub_2CFC(v26, v27, v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, v38, v32, v25 + 12);
      swift_bridgeObjectRelease(v28);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      os_log_t v29 = v33;
      _os_log_impl(&dword_0, v33, (os_log_type_t)v34, "Unable to produce a flow for input: %s", v25, 0xCu);
      uint64_t v30 = v35;
      swift_arrayDestroy(v35, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1LL, -1LL);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }

    uint64_t v31 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    return static FlowSearchResult.noFlow.getter(v31);
  }
}

uint64_t sub_2BBC()
{
  return swift_deallocClassInstance(v0, 96LL, 7LL);
}

uint64_t type metadata accessor for IdentityFlowPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC18IdentityFlowPlugin18IdentityFlowPlugin);
}

uint64_t sub_2C08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2764(a1, a2);
}

uint64_t sub_2C28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_333C();
  *a1 = result;
  return result;
}

void sub_2C58()
{
}

unint64_t sub_2CB8()
{
  unint64_t result = qword_81A8;
  if (!qword_81A8)
  {
    uint64_t v1 = type metadata accessor for IdentityFlowPlugin();
    unint64_t result = swift_getWitnessTable(&unk_3A04, v1);
    atomic_store(result, (unint64_t *)&qword_81A8);
  }

  return result;
}

uint64_t sub_2CFC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2DCC(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_36A4((uint64_t)v12, *a3);
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
      sub_36A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_3684(v12);
  return v7;
}

uint64_t sub_2DCC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_2F84(a5, a6);
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

uint64_t sub_2F84(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_3018(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_31F0(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_31F0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_3018(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_318C(v4, 0LL);
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
      LOBYTE(v1_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000005BLL,  0x8000000000003B00LL,  "IdentityFlowPlugin/IdentityFlowPlugin.swift",  43LL,  2LL,  51LL, 0) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v1_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000005BLL,  0x8000000000003B00LL,  "IdentityFlowPlugin/IdentityFlowPlugin.swift",  43LL,  2LL,  51LL, 0) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v1_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000005BLL,  0x8000000000003B00LL,  "IdentityFlowPlugin/IdentityFlowPlugin.swift",  43LL,  2LL,  51LL, 0) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_318C(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_35B8(&qword_81B8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_31F0(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_35B8(&qword_81B8);
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

uint64_t sub_333C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_80D8 != -1) {
    swift_once(&qword_80D8, sub_36E4);
  }
  uint64_t v4 = sub_3514(v0, (uint64_t)qword_82C0);
  uint64_t v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  unint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    int64_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)int64_t v8 = 0;
    _os_log_impl(&dword_0, v6, v7, "Initializing IdentityFlowPlugin", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  uint64_t v9 = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  IdentityFeatureFlagsProvider.shared.unsafeMutableAddressor(v9);
  uint64_t v20 = 0LL;
  memset(v19, 0, sizeof(v19));
  v18[3] = &type metadata for IdentityFeatureFlagsProvider;
  v18[4] = &protocol witness table for IdentityFeatureFlagsProvider;
  uint64_t v10 = type metadata accessor for IdentityFlowPlugin();
  uint64_t v11 = swift_allocObject(v10, 96LL, 7LL);
  sub_352C((uint64_t)v18, v11 + 16);
  uint64_t v12 = sub_3570((uint64_t)v19, (uint64_t)&v15);
  if (v16)
  {
    sub_35F8((uint64_t)v19);
    sub_3684(v18);
    sub_3638(&v15, (uint64_t)v17);
  }

  else
  {
    static Device.current.getter(v17, v12);
    sub_35F8((uint64_t)v19);
    sub_3684(v18);
    sub_35F8((uint64_t)&v15);
  }

  sub_3638(v17, v11 + 56);
  return v11;
}

uint64_t sub_3514(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_352C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_3570(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_35B8(&qword_81B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_35B8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_35F8(uint64_t a1)
{
  uint64_t v2 = sub_35B8(&qword_81B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_3638(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_3650(uint64_t a1)
{
  return a1;
}

uint64_t sub_3684(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_36A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_36E4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_3750(v0, qword_82C0);
  sub_3514(v0, (uint64_t)qword_82C0);
  return Logger.init(subsystem:category:)( 0xD000000000000017LL,  0x8000000000003DD0LL,  2003790918LL,  0xE400000000000000LL);
}

uint64_t *sub_3750(uint64_t a1, uint64_t *a2)
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
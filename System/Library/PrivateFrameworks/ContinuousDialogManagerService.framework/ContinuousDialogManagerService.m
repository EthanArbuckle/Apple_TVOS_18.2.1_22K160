uint64_t sub_100003644()
{
  return sub_100003728( &OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onConnect,  (void (*)(uint64_t))sub_100004B80);
}

uint64_t sub_100003658(uint64_t a1, uint64_t a2)
{
  return sub_100003790(a1, a2, &OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onConnect, sub_100004B84);
}

void sub_10000366C(uint64_t a1)
{
}

uint64_t sub_10000369C()
{
  return sub_100003728( &OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onInvalidate,  (void (*)(uint64_t))sub_1000036B0);
}

uint64_t sub_1000036B0(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_retain(a2);
  }
  return result;
}

uint64_t sub_1000036C0(uint64_t a1, uint64_t a2)
{
  return sub_100003790(a1, a2, &OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onInvalidate, sub_1000036D4);
}

uint64_t sub_1000036D4(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

void sub_1000036E4(uint64_t a1)
{
}

uint64_t sub_100003714()
{
  return sub_100003728( &OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onInterrupt,  (void (*)(uint64_t))sub_1000036B0);
}

uint64_t sub_100003728(void *a1, void (*a2)(uint64_t))
{
  uint64_t v4 = sub_100004C2C();
  a2(v4);
  return sub_100004C2C();
}

uint64_t sub_10000377C(uint64_t a1, uint64_t a2)
{
  return sub_100003790(a1, a2, &OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onInterrupt, sub_1000036D4);
}

uint64_t sub_100003790(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  v8 = (uint64_t *)(v4 + *a3);
  sub_100004BB8((uint64_t)v8, (uint64_t)v12, 1LL);
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

void sub_1000037E8(uint64_t a1)
{
}

uint64_t sub_10000381C()
{
  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_allowAnonymousConnections);
  sub_100004BB8( v0 + OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_allowAnonymousConnections,  (uint64_t)v3,  0LL);
  return *v1;
}

uint64_t sub_10000385C(char a1)
{
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_allowAnonymousConnections);
  uint64_t result = sub_100004BB8((uint64_t)v3, (uint64_t)v5, 1LL);
  _BYTE *v3 = a1;
  return result;
}

void sub_1000038A0(uint64_t a1)
{
}

uint64_t sub_1000038C4()
{
  return 0LL;
}

id sub_1000038CC(uint64_t a1, char a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_10000390C(a1, a2);
}

id sub_10000390C(uint64_t a1, char a2)
{
  uint64_t v4 = &v2[OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onConnect];
  *(void *)uint64_t v4 = 0LL;
  *((void *)v4 + 1) = 0LL;
  id v5 = &v2[OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onInvalidate];
  *(void *)id v5 = 0LL;
  *((void *)v5 + 1) = 0LL;
  v6 = &v2[OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onInterrupt];
  *(void *)v6 = 0LL;
  *((void *)v6 + 1) = 0LL;
  v7 = &v2[OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_allowAnonymousConnections];
  char *v7 = 0;
  *(void *)&v2[OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_clientType] = a1;
  sub_100004BB8((uint64_t)v7, (uint64_t)v10, 1LL);
  char *v7 = a2;
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for CDMXPCServiceDelegate();
  return objc_msgSendSuper2(&v9, "init");
}

uint64_t type metadata accessor for CDMXPCServiceDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC14assistant_cdmd21CDMXPCServiceDelegate);
}

uint64_t sub_1000039D0(uint64_t a1, void *a2)
{
  v3 = v2;
  uint64_t v5 = static os_log_type_t.debug.getter();
  os_log_type_t v6 = v5;
  sub_100004C40(v5, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  v8 = v7;
  objc_super v9 = (os_log_s *)sub_1000084E8();
  id v10 = a2;
  if (os_log_type_enabled(v9, v6))
  {
    id v11 = v10;
    uint64_t v12 = sub_100004BCC(28LL);
    uint64_t v13 = sub_100004BCC(64LL);
    *(void *)aBlock = v13;
    *(_DWORD *)uint64_t v12 = 136315650;
    uint64_t v14 = sub_100004968(v11);
    if (!v15) {
      uint64_t v14 = 0LL;
    }
    uint64_t v66 = (uint64_t)v3;
    if (v15) {
      unint64_t v16 = v15;
    }
    else {
      unint64_t v16 = 0xE000000000000000LL;
    }
    uint64_t v75 = sub_100004200(v14, v16, (uint64_t *)aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v12 + 4);

    swift_bridgeObjectRelease(v16);
    *(_WORD *)(v12 + 12) = 1024;
    unsigned int v17 = [v11 processIdentifier];

    LODWORD(v75) = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, (char *)&v75 + 4, v12 + 14);

    *(_WORD *)(v12 + 18) = 2080;
    uint64_t v18 = sub_100004C54();
    if (v19)
    {
      unint64_t v20 = v19;
    }

    else
    {
      uint64_t v18 = 0LL;
      unint64_t v20 = 0xE000000000000000LL;
    }

    uint64_t v75 = sub_100004200(v18, v20, (uint64_t *)aBlock);
    v3 = (void *)v66;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v12 + 20);

    swift_bridgeObjectRelease(v20);
    _os_log_impl( (void *)&_mh_execute_header,  v9,  v6,  "Incoming connection to service %s from %d and bundle %s",  (uint8_t *)v12,  0x1Cu);
    swift_arrayDestroy(v13, 2LL);
    sub_100004BAC(v13);
    sub_100004BAC(v12);
  }

  else
  {
  }

  uint64_t v21 = sub_100004968(v10);
  uint64_t v23 = v22;
  type metadata accessor for CDMXPCDefines(0LL);
  uint64_t v24 = dispatch thunk of static CDMXPCDefines.machServiceName()();
  if (v23)
  {
    if (v21 == v24 && v23 == v25)
    {
      swift_bridgeObjectRelease(v23);
      uint64_t v28 = sub_100004C38();
    }

    else
    {
      char v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v23, v24, v25, 0LL);
      swift_bridgeObjectRelease(v23);
      uint64_t v28 = sub_100004C38();
      if ((v27 & 1) == 0) {
        goto LABEL_22;
      }
    }

    uint64_t v28 = sub_100004F00(v28);
    if ((v28 & 1) != 0) {
      goto LABEL_27;
    }
    goto LABEL_22;
  }

  uint64_t v28 = sub_100004C38();
LABEL_22:
  if (((*(uint64_t (**)(uint64_t))((swift_isaMask & *v3) + 0xC0LL))(v28) & 1) == 0
    || (sub_100004968(v10), uint64_t v30 = v29, swift_bridgeObjectRelease(v29), v30))
  {
    os_log_type_t v31 = static os_log_type_t.error.getter();
    v32 = (os_log_s *)sub_1000084E8();
    if (sub_100004BDC(v32))
    {
      id v33 = v10;
      uint64_t v34 = sub_100004BCC(18LL);
      uint64_t v35 = sub_100004BCC(32LL);
      *(void *)aBlock = v35;
      *(_DWORD *)uint64_t v34 = 67109378;
      LODWORD(v75) = [v33 processIdentifier];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, (char *)&v75 + 4, v34 + 4);

      *(_WORD *)(v34 + 8) = 2080;
      v36 = (uint64_t *)sub_100004C48();
      uint64_t v37 = *v36;
      unint64_t v38 = v36[1];
      swift_bridgeObjectRetain(v38);
      uint64_t v75 = sub_100004200(v37, v38, (uint64_t *)aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v34 + 10);
      swift_bridgeObjectRelease(v38);
      _os_log_impl( (void *)&_mh_execute_header,  v8,  v31,  "Rejected connection from %d. Check if calling process has '%s' entitlement",  (uint8_t *)v34,  0x12u);
      swift_arrayDestroy(v35, 1LL);
      sub_100004BAC(v35);
      sub_100004BAC(v34);
    }

    v39 = 0LL;
    uint64_t v40 = 0LL;
    goto LABEL_30;
  }

LABEL_27:
  type metadata accessor for CDMXPCService();
  uint64_t v41 = sub_100004C54();
  sub_100004C40(v41, &qword_100011038, &OBJC_CLASS___CDMClientInterface_ptr);
  sub_100006398();
  v39 = v42;
  v43 = (void *)objc_opt_self(&OBJC_CLASS___NSXPCInterface);
  id v44 = v39;
  id v67 = [v43 interfaceWithProtocol:&OBJC_PROTOCOL___CDMXPCProtocol];
  objc_msgSend(v10, "setExportedInterface:");
  [v10 setExportedObject:v44];

  uint64_t v45 = sub_100004C08((uint64_t)&unk_10000C580);
  *(void *)(v45 + 16) = v3;
  *(void *)(v45 + 24) = v10;
  v73 = sub_100004A28;
  uint64_t v74 = v45;
  v46 = sub_100004BFC((uint64_t)&unk_10000C598, (uint64_t)v67, (char)_NSConcreteStackBlock, 1107296256LL, v71, v72);
  uint64_t v47 = v74;
  id v48 = v10;
  v49 = v3;
  uint64_t v50 = swift_release(v47);
  sub_100004C20(v50, "setInvalidationHandler:");
  _Block_release(v46);
  uint64_t v51 = sub_100004C08((uint64_t)&unk_10000C5D0);
  *(void *)(v51 + 16) = v49;
  *(void *)(v51 + 24) = v48;
  v73 = sub_100004A90;
  uint64_t v74 = v51;
  v52 = sub_100004BFC((uint64_t)&unk_10000C5E8, v68, (char)_NSConcreteStackBlock, 1107296256LL, v71, v72);
  uint64_t v53 = v74;
  id v54 = v48;
  v55 = v49;
  uint64_t v56 = swift_release(v53);
  sub_100004C20(v56, "setInterruptionHandler:");
  _Block_release(v52);
  os_log_type_t v57 = static os_log_type_t.debug.getter();
  v58 = (os_log_s *)sub_1000084E8();
  if (sub_100004BDC(v58))
  {
    id v59 = v54;
    v60 = (uint8_t *)sub_100004BCC(8LL);
    *(_DWORD *)v60 = 67109120;
    *(_DWORD *)aBlock = [v59 processIdentifier];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(aBlock, &aBlock[4], v60 + 4);

    _os_log_impl((void *)&_mh_execute_header, v8, v57, "Accepted connection from %d", v60, 8u);
    sub_100004BAC((uint64_t)v60);
  }

  [v54 resume];
  uint64_t v40 = 1LL;
LABEL_30:
  v61 = (void (*)(id, uint64_t, void *))(*(uint64_t (**)(void))((swift_isaMask & *v3) + 0x78LL))();
  if (v61)
  {
    uint64_t v63 = (uint64_t)v61;
    uint64_t v64 = v62;
    v61(v10, v40, v39);

    sub_1000036D4(v63, v64);
  }

  else
  {
  }

  return v40;
}

uint64_t sub_1000040BC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_100004144()
{
}

id sub_10000417C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CDMXPCServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100004200(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  os_log_type_t v6 = sub_1000042D0(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100004B00((uint64_t)v12, *a3);
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
      sub_100004B00((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100004AE0(v12);
  return v7;
}

void *sub_1000042D0(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100004424((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_1000044E8(a5, a6);
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
    return (void *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

void *sub_100004424(char *__src, size_t __n, char *__dst)
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

void *sub_1000044E8(uint64_t a1, unint64_t a2)
{
  objc_super v2 = sub_10000457C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    objc_super v2 = sub_100004750(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    objc_super v2 = sub_100004750((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10000457C(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_1000046EC(v4, 0LL);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  71LL,  0);
    __break(1u);
    goto LABEL_14;
  }

  os_log_type_t v6 = v5;
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

void *sub_1000046EC(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100004B3C((uint64_t *)&unk_100011400);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_100004750(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_100004B3C((uint64_t *)&unk_100011400);
    id v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    id v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1000048E8(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_100004824(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_100004824(char *__src, size_t __n, char *__dst)
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

char *sub_1000048E8(char *__src, size_t __len, char *__dst)
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

uint64_t sub_100004968(void *a1)
{
  id v1 = [a1 serviceName];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

void sub_1000049C8(uint64_t a1, unint64_t *a2, void *a3)
{
  if (!*a2)
  {
    uint64_t v4 = objc_opt_self(*a3);
    atomic_store(swift_getObjCClassMetadata(v4), a2);
  }

  sub_100004BD4();
}

uint64_t sub_1000049FC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_100004A28()
{
  id v1 = (uint64_t (*)(uint64_t))(*(uint64_t (**)(void))((swift_isaMask & **(void **)(v0 + 16)) + 0x90LL))();
  if (v1)
  {
    sub_100004BEC(v1);
    uint64_t v2 = sub_100004C2C();
    sub_100004BC0(v2, v3);
  }

  else
  {
    sub_100004C14();
  }
}

uint64_t sub_100004A78(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100004A88(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_100004A90()
{
  id v1 = (uint64_t (*)(uint64_t))(*(uint64_t (**)(void))((swift_isaMask & **(void **)(v0 + 16)) + 0xA8LL))();
  if (v1)
  {
    sub_100004BEC(v1);
    uint64_t v2 = sub_100004C2C();
    sub_100004BC0(v2, v3);
  }

  else
  {
    sub_100004C14();
  }

uint64_t sub_100004AE0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100004B00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100004B3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100004B98@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return swift_beginAccess(v2 + a2, a1, 33LL, 0LL);
}

uint64_t sub_100004BAC(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_100004BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0LL);
}

uint64_t sub_100004BC0(uint64_t result, uint64_t a2)
{
  return sub_1000036D4(result, a2);
}

uint64_t sub_100004BCC(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

  ;
}

BOOL sub_100004BDC(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

uint64_t sub_100004BEC(uint64_t (*a1)(uint64_t))
{
  return a1(v1);
}

void *sub_100004BFC@<X0>(uint64_t a1@<X8>, uint64_t a2, char aBlock, uint64_t a4, uint64_t a5, uint64_t a6)
{
  a5 = v6;
  a6 = a1;
  return _Block_copy(&aBlock);
}

uint64_t sub_100004C08(uint64_t a1)
{
  return swift_allocObject(a1, 32LL, 7LL);
}

  ;
}

id sub_100004C20(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_100004C2C()
{
  return v0;
}

uint64_t sub_100004C38()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_100004C40(uint64_t a1, unint64_t *a2, void *a3)
{
}

void *sub_100004C48()
{
  return &unk_10000C700;
}

uint64_t sub_100004C54()
{
  int64_t v7 = 0LL;
  if (!CPCopyBundleIdentifierAndTeamFromAuditToken(&v6, &v7, 0LL))
  {
    uint64_t v3 = static os_log_type_t.debug.getter();
    sub_100004FB0(v3, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
    id v4 = sub_1000084E8();
    os_log(_:dso:log:_:_:)( v3,  &_mh_execute_header,  v4,  "CPCopyBundleIdentifierAndTeamFromAuditToken returned false.",  59LL,  2LL);

    return 0LL;
  }

  uint64_t v1 = v7;
  if (!v7) {
    return 0LL;
  }
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);

  return v2;
}

uint64_t sub_100004D64(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [v3 valueForEntitlement:v5];

  if (v6)
  {
    _bridgeAnyObjectToAny(_:)(v14, v6);
    swift_unknownObjectRelease(v6);
  }

  else
  {
    memset(v14, 0, sizeof(v14));
  }

  uint64_t v7 = sub_100004E78((uint64_t)v14, (uint64_t)v15);
  if (!v16)
  {
    sub_100004EC0((uint64_t)v15);
    goto LABEL_9;
  }

  uint64_t v8 = sub_100004FB0(v7, &qword_100011138, &OBJC_CLASS___NSObject_ptr);
  if ((swift_dynamicCast(&v13, v15, (char *)&type metadata for Any + 8, v8, 6LL) & 1) == 0)
  {
LABEL_9:
    char v11 = 0;
    return v11 & 1;
  }

  id v9 = v13;
  if (a3)
  {
    id v10 = a3;
    char v11 = static NSObject.== infix(_:_:)(v9, v10);
  }

  else
  {

    char v11 = 1;
  }

  return v11 & 1;
}

uint64_t sub_100004E78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B3C(&qword_100011130);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004EC0(uint64_t a1)
{
  uint64_t v2 = sub_100004B3C(&qword_100011130);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100004F00(uint64_t a1)
{
  Class isa = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
  char v2 = sub_100004D64(0xD00000000000001ELL, 0x800000010000A790LL, isa);

  return v2 & 1;
}

uint64_t sub_100004F78(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_100004FB0(uint64_t a1, unint64_t *a2, void *a3)
{
  return sub_100004F78(0LL, a2, a3);
}

void *sub_100004FB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = (void *)sub_100005CFC(v5, 56LL);
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

void sub_10000500C()
{
  id v1 = [*(id *)(v0 + 48) handleableXPCActivities];
  uint64_t v2 = sub_100004B3C(&qword_1000111B0);
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v1,  &type metadata for String,  v2,  &protocol witness table for String);

  int64_t v4 = 0LL;
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v23 = v3 + 64;
  uint64_t v6 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v7 = -1LL;
  if (v6 < 64) {
    uint64_t v7 = ~(-1LL << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    unint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = *(void **)(*(void *)(v3 + 56) + 8 * i);
    unint64_t v19 = (void *)sub_100005CFC((uint64_t)&unk_10000C720, 48LL);
    v19[2] = v16;
    v19[3] = v17;
    v19[4] = v18;
    v19[5] = v0;
    aBlock[4] = sub_1000052BC;
    uint64_t v25 = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100005948;
    aBlock[3] = &unk_10000C738;
    unint64_t v20 = _Block_copy(aBlock);
    uint64_t v21 = v25;
    swift_bridgeObjectRetain_n(v17, 2LL);
    swift_unknownObjectRetain_n(v18, 2LL);
    swift_retain(v0);
    swift_release(v21);
    uint64_t v22 = String.utf8CString.getter(v16, v17);
    swift_bridgeObjectRelease(v17);
    xpc_activity_register((const char *)(v22 + 32), v18, v20);
    swift_release(v22);
    _Block_release(v20);
    swift_unknownObjectRelease(v18);
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1LL))
    {
      __break(1u);
      goto LABEL_23;
    }

    if (v12 >= v9) {
      goto LABEL_21;
    }
    unint64_t v13 = *(void *)(v23 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        goto LABEL_21;
      }
      unint64_t v13 = *(void *)(v23 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          goto LABEL_21;
        }
        unint64_t v13 = *(void *)(v23 + 8 * v4);
        if (!v13) {
          break;
        }
      }
    }

LABEL_18:
    unint64_t v8 = (v13 - 1) & v13;
  }

  int64_t v14 = v12 + 3;
  if (v14 >= v9)
  {
LABEL_21:
    swift_release(v3);
    return;
  }

  unint64_t v13 = *(void *)(v23 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_18;
  }

  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      break;
    }
    if (v4 >= v9) {
      goto LABEL_21;
    }
    unint64_t v13 = *(void *)(v23 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_18;
    }
  }

    uint64_t v7 = (v12 - 1) & v12;
  }

  unint64_t v13 = v11 + 3;
  if (v13 >= v8)
  {
LABEL_21:
    swift_release(v2);
    return;
  }

  int64_t v12 = *(void *)(v22 + 8 * v13);
  if (v12)
  {
    uint64_t v3 = v13;
    goto LABEL_18;
  }

  while (1)
  {
    uint64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1LL)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_21;
    }
    int64_t v12 = *(void *)(v22 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_18;
    }
  }

LABEL_23:
  __break(1u);
}

  __break(1u);
}

uint64_t sub_100005288()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_1000052BC(_xpc_activity_s *a1)
{
  uint64_t v5 = v1[2];
  unint64_t v4 = v1[3];
  xpc_object_t criteria = (xpc_object_t)v1[4];
  uint64_t v94 = v1[5];
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  sub_100005A24();
  uint64_t v7 = (os_log_s *)sub_1000084E8();
  if (os_log_type_enabled(v7, v6))
  {
    sub_100005C80();
    uint64_t v2 = sub_100004BCC(12LL);
    unint64_t v8 = a1;
    uint64_t v9 = sub_100004BCC(32LL);
    aBlock[0] = v9;
    *(_DWORD *)uint64_t v2 = 136315138;
    uint64_t v10 = sub_100005CA4();
    sub_100005C70(v10, v11, v12);
    sub_100005D04();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v13, v14, v2 + 4);
    sub_100005C8C();
    _os_log_impl((void *)&_mh_execute_header, v7, v6, "Reached handler for XPC activity: %s", (uint8_t *)v2, 0xCu);
    sub_100005CE8(v9);
    uint64_t v15 = v9;
    a1 = v8;
    sub_100004BAC(v15);
    sub_100004BAC(v2);
  }

  xpc_activity_state_t state = xpc_activity_get_state(a1);
  if (state != 2)
  {
    uint64_t v17 = (void (*)())state;
    if (!state)
    {
      static os_log_type_t.debug.getter();
      uint64_t v18 = (os_log_s *)sub_100005C98();
      if (sub_100005CF0(v18))
      {
        sub_100005C80();
        unint64_t v19 = (_DWORD *)sub_100004BCC(12LL);
        uint64_t v2 = sub_100004BCC(32LL);
        aBlock[0] = v2;
        *unint64_t v19 = 136315138;
        uint64_t v20 = sub_100005CA4();
        sub_100005C70(v20, v21, v22);
        sub_100005D04();
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v23, v24, v19 + 1);
        sub_100005C8C();
        sub_100005CAC((void *)&_mh_execute_header, v18, v25, "Checking in XPC activity %s");
        sub_100005CE8(v2);
        sub_100004BAC(v2);
        sub_100004BAC((uint64_t)v19);
      }

      xpc_activity_set_criteria(a1, criteria);
LABEL_19:
      uint64_t v17 = 0LL;
      os_log_type_t v57 = 0LL;
      goto LABEL_20;
    }

LABEL_16:
    static os_log_type_t.error.getter();
    v60 = (os_log_s *)sub_100005C98();
    os_log_type_t v61 = v2;
    if (os_log_type_enabled(v60, (os_log_type_t)v2))
    {
      sub_100005C80();
      uint64_t v62 = sub_100004BCC(22LL);
      uint64_t v63 = sub_100004BCC(32LL);
      aBlock[0] = v63;
      *(_DWORD *)uint64_t v62 = 136315394;
      uint64_t v64 = sub_100005CA4();
      uint64_t v97 = sub_100005C70(v64, v65, v66);
      sub_100005CBC(v97, v67, v68, v62 + 12, v69, v70, v71, v72, (uint64_t)criteria);
      sub_100005C8C();
      *(_WORD *)(v62 + 12) = 2048;
      uint64_t v97 = (uint64_t)v17;
      uint64_t v2 = (uint64_t)&type metadata for Any;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v97, &v98, v62 + 14);
      _os_log_impl( (void *)&_mh_execute_header,  v60,  v61,  "XPC activity %s in unexpected state: %ld",  (uint8_t *)v62,  0x16u);
      sub_100005CE8(v63);
      sub_100004BAC(v63);
      sub_100004BAC(v62);
    }

    goto LABEL_19;
  }

  if (!xpc_activity_set_state(a1, 4LL))
  {
    static os_log_type_t.error.getter();
    v26 = (os_log_s *)sub_100005C98();
    if (sub_100005CF0(v26))
    {
      sub_100005C80();
      char v27 = (_DWORD *)sub_100004BCC(12LL);
      uint64_t v28 = sub_100004BCC(32LL);
      aBlock[0] = v28;
      *char v27 = 136315138;
      uint64_t v29 = sub_100005CA4();
      uint64_t v32 = sub_100005C70(v29, v30, v31);
      sub_100005CCC(v32, v33, v34, v35, v36, v37, v38, v39, (uint64_t)criteria, v94);
      sub_100005C8C();
      sub_100005CAC((void *)&_mh_execute_header, v26, v40, "Failed to set XPC activity state to CONTINUE for %s");
      sub_100005CE8(v28);
      sub_100004BAC(v28);
      sub_100004BAC((uint64_t)v27);
    }
  }

  static os_log_type_t.debug.getter();
  uint64_t v41 = (os_log_s *)sub_100005C98();
  if (sub_100005CF0(v41))
  {
    sub_100005C80();
    v42 = (_DWORD *)sub_100004BCC(12LL);
    uint64_t v43 = sub_100004BCC(32LL);
    aBlock[0] = v43;
    _DWORD *v42 = 136315138;
    uint64_t v44 = sub_100005CA4();
    uint64_t v47 = sub_100005C70(v44, v45, v46);
    sub_100005CCC(v47, v48, v49, v50, v51, v52, v53, v54, (uint64_t)criteria, v94);
    sub_100005C8C();
    sub_100005CAC((void *)&_mh_execute_header, v41, v55, "Handling XPC activity %s");
    sub_100005CE8(v43);
    sub_100004BAC(v43);
    sub_100004BAC((uint64_t)v42);
  }

  uint64_t v56 = *(dispatch_queue_s **)(v94 + 32);
  os_log_type_t v57 = (void *)sub_100005CFC((uint64_t)&unk_10000C770, 48LL);
  v57[2] = v94;
  v57[3] = a1;
  v57[4] = v5;
  v57[5] = v4;
  uint64_t v58 = sub_100005CFC((uint64_t)&unk_10000C798, 32LL);
  uint64_t v17 = sub_100005A94;
  *(void *)(v58 + 16) = sub_100005A94;
  *(void *)(v58 + 24) = v57;
  aBlock[4] = (uint64_t)sub_100005C48;
  uint64_t v96 = v58;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = (uint64_t)sub_100005928;
  aBlock[3] = (uint64_t)&unk_10000C7B0;
  uint64_t v2 = (uint64_t)_Block_copy(aBlock);
  uint64_t v59 = v96;
  sub_100005CA4();
  swift_retain(v94);
  swift_unknownObjectRetain(a1);
  swift_retain(v58);
  swift_release(v59);
  dispatch_sync(v56, (dispatch_block_t)v2);
  _Block_release((const void *)v2);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation(v58, "", 94LL, 52LL, 37LL, 1LL);
  swift_release(v58);
  if ((v2 & 1) != 0)
  {
    __break(1u);
    goto LABEL_16;
  }

LABEL_20:
  if (xpc_activity_should_defer(a1))
  {
    BOOL v73 = xpc_activity_set_state(a1, 3LL);
    static os_log_type_t.debug.getter();
    uint64_t v74 = (os_log_s *)sub_100005C98();
    if (os_log_type_enabled(v74, (os_log_type_t)v2))
    {
      sub_100005C80();
      uint64_t v75 = sub_100004BCC(22LL);
      uint64_t v76 = sub_100004BCC(64LL);
      aBlock[0] = v76;
      *(_DWORD *)uint64_t v75 = 136315394;
      sub_100005CA4();
      uint64_t v97 = sub_100004200(v5, v4, aBlock);
      sub_100005CBC(v97, v77, v78, v75 + 12, v79, v80, v81, v82, (uint64_t)criteria);
      sub_100005C8C();
      *(_WORD *)(v75 + 12) = 2080;
      if (v73) {
        uint64_t v83 = 7562585LL;
      }
      else {
        uint64_t v83 = 28494LL;
      }
      if (v73) {
        unint64_t v84 = 0xE300000000000000LL;
      }
      else {
        unint64_t v84 = 0xE200000000000000LL;
      }
      uint64_t v97 = sub_100004200(v83, v84, aBlock);
      sub_100005CBC(v97, v85, v86, v75 + 22, v87, v88, v89, v90, (uint64_t)criteriaa);
      swift_bridgeObjectRelease(v84);
      _os_log_impl( (void *)&_mh_execute_header,  v74,  (os_log_type_t)v2,  "Deferring XPC activity %s: %s",  (uint8_t *)v75,  0x16u);
      swift_arrayDestroy(v76, 2LL);
      sub_100004BAC(v76);
      sub_100004BAC(v75);
    }
  }

  return sub_1000036D4((uint64_t)v17, (uint64_t)v57);
}

uint64_t sub_100005928(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100005948(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  uint64_t v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_100005990(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000059A0(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000059A8()
{
  swift_release(*(void *)(v0 + 40));
  return v0;
}

uint64_t sub_1000059E4()
{
  return swift_deallocClassInstance(v0, 56LL, 7LL);
}

uint64_t type metadata accessor for CDMXPCActivityListener()
{
  return objc_opt_self(&OBJC_CLASS____TtC14assistant_cdmd22CDMXPCActivityListener);
}

unint64_t sub_100005A24()
{
  unint64_t result = qword_100011030;
  if (!qword_100011030)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100011030);
  }

  return result;
}

uint64_t sub_100005A60()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

void sub_100005A94()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = (_xpc_activity_s *)v0[3];
  uint64_t v4 = v0[4];
  unint64_t v3 = v0[5];
  uint64_t v5 = *(dispatch_group_s **)(v2 + 24);
  dispatch_group_enter(v5);
  [*(id *)(v2 + 16) signal];
  os_log_type_t v6 = *(void **)(v2 + 48);
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 handleXPCActivity:v1 fromIdentifier:v7];

  if (!xpc_activity_set_state(v1, 5LL))
  {
    os_log_type_t v8 = static os_log_type_t.error.getter();
    sub_100005A24();
    uint64_t v9 = (os_log_s *)sub_1000084E8();
    if (os_log_type_enabled(v9, v8))
    {
      swift_bridgeObjectRetain_n(v3, 2LL);
      uint64_t v10 = (uint8_t *)sub_100004BCC(12LL);
      uint64_t v11 = sub_100004BCC(32LL);
      uint64_t v13 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_bridgeObjectRetain(v3);
      uint64_t v12 = sub_100004200(v4, v3, &v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v10 + 4);
      swift_bridgeObjectRelease_n(v3, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v9, v8, "Failed to set XPC activity state to DONE for %s", v10, 0xCu);
      sub_100005CE8(v11);
      sub_100004BAC(v11);
      sub_100004BAC((uint64_t)v10);
    }
  }

  dispatch_group_leave(v5);
}

uint64_t sub_100005C38()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100005C48()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100005C70(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  return sub_100004200(v4, v3, (uint64_t *)va);
}

uint64_t sub_100005C80()
{
  return swift_bridgeObjectRetain_n(v0, 2LL);
}

uint64_t sub_100005C8C()
{
  return swift_bridgeObjectRelease_n(v0, 3LL);
}

id sub_100005C98()
{
  return sub_1000084E8();
}

uint64_t sub_100005CA4()
{
  return swift_bridgeObjectRetain(v0);
}

void sub_100005CAC(void *a1, os_log_s *a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_100005CBC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v10, v9);
}

uint64_t sub_100005CCC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v12 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)((uint64_t *)va, va1, v10);
}

uint64_t sub_100005CE8(uint64_t a1)
{
  return swift_arrayDestroy(a1, 1LL);
}

BOOL sub_100005CF0(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

uint64_t sub_100005CFC(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

  ;
}

void *sub_100005D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result = (void *)swift_allocObject(v5, 56LL, 7LL);
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

void sub_100005D70()
{
  id v1 = [*(id *)(v0 + 48) handleableXPCEventStreams];
  uint64_t v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  int64_t v3 = 0LL;
  uint64_t v4 = *(void *)(v2 + 56);
  uint64_t v22 = v2 + 56;
  uint64_t v5 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v6 = -1LL;
  if (v5 < 64) {
    uint64_t v6 = ~(-1LL << v5);
  }
  unint64_t v7 = v6 & v4;
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  if ((v6 & v4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v9 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v3 << 6))
  {
    uint64_t v14 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = *(dispatch_queue_s **)(v0 + 32);
    uint64_t v18 = (void *)swift_allocObject(&unk_10000C7E8, 40LL, 7LL);
    v18[2] = v0;
    v18[3] = v15;
    v18[4] = v16;
    aBlock[4] = sub_100005FF4;
    uint64_t v24 = v18;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100005948;
    aBlock[3] = &unk_10000C800;
    unint64_t v19 = _Block_copy(aBlock);
    uint64_t v20 = v24;
    swift_bridgeObjectRetain_n(v16, 2LL);
    swift_retain(v0);
    swift_release(v20);
    uint64_t v21 = String.utf8CString.getter(v15, v16);
    swift_bridgeObjectRelease(v16);
    xpc_set_event_stream_handler((const char *)(v21 + 32), v17, v19);
    swift_release(v21);
    _Block_release(v19);
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1LL))
    {
      __break(1u);
      goto LABEL_23;
    }

    if (v11 >= v8) {
      goto LABEL_21;
    }
    unint64_t v12 = *(void *)(v22 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_21;
      }
      unint64_t v12 = *(void *)(v22 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_21;
        }
        unint64_t v12 = *(void *)(v22 + 8 * v3);
        if (!v12) {
          break;
        }
      }
    }

uint64_t sub_100005FC8()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100005FF4(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  unint64_t v5 = v1[4];
  uint64_t v6 = os_transaction_create("com.apple.assistant_cdmd.XPCStreamEventListener");
  unint64_t v7 = *(dispatch_group_s **)(v3 + 24);
  dispatch_group_enter(v7);
  os_log_type_t v8 = static os_log_type_t.debug.getter([*(id *)(v3 + 16) signal]);
  sub_100005A24();
  unint64_t v9 = (os_log_s *)sub_1000084E8();
  if (os_log_type_enabled(v9, v8))
  {
    swift_bridgeObjectRetain_n(v5, 2LL);
    uint64_t v18 = v6;
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v17 = a1;
    uint64_t v11 = swift_slowAlloc(32LL, -1LL);
    uint64_t v20 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_bridgeObjectRetain(v5);
    uint64_t v19 = sub_100004200(v4, v5, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v10 + 4);
    swift_bridgeObjectRelease_n(v5, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "Handling XPC event from stream %s", v10, 0xCu);
    swift_arrayDestroy(v11, 1LL);
    uint64_t v12 = v11;
    a1 = v17;
    sub_100004BAC(v12);
    uint64_t v13 = (uint64_t)v10;
    uint64_t v6 = v18;
    sub_100004BAC(v13);
  }

  uint64_t v14 = *(void **)(v3 + 48);
  NSString v15 = String._bridgeToObjectiveC()();
  [v14 handleXPCEvent:a1 fromStream:v15];

  dispatch_group_leave(v7);
  return swift_unknownObjectRelease(v6);
}

uint64_t sub_1000061C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000061D0(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t type metadata accessor for CDMXPCStreamEventListener()
{
  return objc_opt_self(&OBJC_CLASS____TtC14assistant_cdmd25CDMXPCStreamEventListener);
}

uint64_t sub_1000061F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension);
  *(void *)(v1 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension) = a1;
  return swift_release(v2);
}

uint64_t sub_100006210(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction);
  *(void *)(v1 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction) = a1;
  return swift_unknownObjectRelease(v2);
}

void sub_100006228()
{
  uint64_t v1 = OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension;
  *(void *)&v0[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension] = 0LL;
  uint64_t v2 = OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction;
  *(void *)&v0[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction] = 0LL;
  id v3 = objc_allocWithZone(&OBJC_CLASS___CDMFoundationClient);
  uint64_t v4 = v0;
  id v5 = [v3 init];
  *(void *)&v4[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client] = v5;
  uint64_t v6 = *(void *)&v0[v1];
  *(void *)&v0[v1] = 0LL;
  swift_release(v6);
  uint64_t v7 = *(void *)&v0[v2];
  *(void *)&v0[v2] = 0LL;

  swift_unknownObjectRelease(v7);
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for CDMXPCService();
  sub_100007B08((uint64_t)v14.super_class, "init", v8, v9, v10, v11, v12, v13, v14);
  sub_100007AB8();
}

uint64_t type metadata accessor for CDMXPCService()
{
  return objc_opt_self(&OBJC_CLASS____TtC14assistant_cdmd13CDMXPCService);
}

void sub_100006300(uint64_t a1)
{
}

id sub_100006328(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension] = 0LL;
  *(void *)&v1[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction] = 0LL;
  *(void *)&v1[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client] = a1;
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for CDMXPCService();
  return sub_100007B08((uint64_t)v9.super_class, "init", v2, v3, v4, v5, v6, v7, v9);
}

void sub_100006398()
{
  uint64_t v3 = v2;
  sub_100007B30();
  sub_1000063D8(v3, v1, v0);
}

void sub_1000063D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  *(void *)&v3[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension] = 0LL;
  *(void *)&v3[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction] = 0LL;
  if (a3)
  {
    uint64_t v7 = v3;
    id v8 = sub_10000647C(a2, a3);
  }

  else
  {
    id v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(a1));
    uint64_t v10 = v4;
    id v8 = [v9 init];
  }

  *(void *)&v4[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client] = v8;

  v17.receiver = v4;
  v17.super_class = (Class)type metadata accessor for CDMXPCService();
  sub_100007B08((uint64_t)v17.super_class, "init", v11, v12, v13, v14, v15, v16, v17);
  sub_100007AB8();
}

id sub_10000647C(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v6 = [v4 initWithCallingBundleId:v5];

  return v6;
}

void sub_1000064EC(uint64_t a1)
{
  uint64_t v1 = static os_log_type_t.debug.getter(a1);
  sub_100004FB0(v1, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v2 = sub_100007AA8();
  sub_100007AA0( v1,  (uint64_t)&_mh_execute_header,  (uint64_t)v2,  (uint64_t)"assistant_cdmd was woken up by initialization of a client",  57LL);
  sub_100007A94(v2);
}

uint64_t sub_10000657C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = sub_10000784C(a1, (SEL *)&selRef_serviceStateDirectorySandboxExtension);
  if (!v5)
  {
    uint64_t result = 0LL;
    return sub_1000061F8(result);
  }

  uint64_t v6 = v4;
  uint64_t v7 = v5;
  uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension);
  if (v8)
  {
    uint64_t v9 = *(void *)(v8 + 16);
    uint64_t v10 = *(void *)(v8 + 24);
    BOOL v11 = v9 == v6 && v7 == v10;
    if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)(v9, v10, v6, v7, 0LL) & 1) != 0) {
      return swift_bridgeObjectRelease(v7);
    }
  }

  type metadata accessor for CDMXPCSandboxExtension();
  uint64_t result = sub_100008024(v6, v7);
  if (!v2) {
    return sub_1000061F8(result);
  }
  return result;
}

uint64_t sub_100006638()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain(*(void *)(v1 + 24));
  return v2;
}

void sub_1000066C4(void *a1, uint64_t a2, const void *a3)
{
  uint64_t v6 = swift_allocObject(&unk_10000C9A0, 24LL, 7LL);
  *(void *)(v6 + 16) = a3;
  uint64_t v7 = *(void *)(a2 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = static os_log_type_t.debug.getter(v8);
  sub_100004F78(0LL, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v10 = (os_log_s *)sub_1000084E8();
  BOOL v11 = v10;
  if (v7)
  {
    os_log(_:dso:log:_:_:)( v9,  &_mh_execute_header,  v10,  "Not creating cdm_xpc_service_setup transaction. It already exists.",  66LL,  2LL);
  }

  else
  {
    uint64_t v13 = v9;
    if (os_log_type_enabled(v10, (os_log_type_t)v9))
    {
      id v14 = a1;
      uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v25 = swift_slowAlloc(32LL, -1LL);
      aBlock[0] = v25;
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v16 = sub_10000784C(v14, (SEL *)&selRef_invocationSource);
      if (v17)
      {
        unint64_t v18 = v17;
      }

      else
      {
        uint64_t v16 = 0x74657320746F6E28LL;
        unint64_t v18 = 0xE900000000000029LL;
      }

      uint64_t v26 = sub_100004200(v16, v18, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, aBlock, v15 + 4);

      swift_bridgeObjectRelease(v18);
      _os_log_impl( (void *)&_mh_execute_header,  v11,  (os_log_type_t)v13,  "Creating cdm_xpc_service_setup transaction. invocationSource:%s",  v15,  0xCu);
      swift_arrayDestroy(v25, 1LL);
      swift_slowDealloc(v25, -1LL, -1LL);
      swift_slowDealloc(v15, -1LL, -1LL);
    }

    uint64_t v19 = os_transaction_create("cdm_xpc_service_setup");
    uint64_t v12 = sub_100006210(v19);
  }

  uint64_t v20 = static os_log_type_t.debug.getter(v12);
  sub_100004F78(0LL, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v21 = sub_1000084E8();
  os_log(_:dso:log:_:_:)(v20, &_mh_execute_header, v21, "Setup called by XPC client.", 27LL, 2LL);

  sub_10000657C(a1);
  uint64_t v22 = *(void **)(a2 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  aBlock[4] = (uint64_t)sub_100007A60;
  uint64_t v28 = v6;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = (uint64_t)sub_100006D34;
  aBlock[3] = (uint64_t)&unk_10000C9B8;
  uint64_t v23 = _Block_copy(aBlock);
  uint64_t v24 = v28;
  swift_retain(v6);
  swift_release(v24);
  [v22 setup:a1 completionHandler:v23];
  _Block_release(v23);
  swift_release(v6);
  _Block_release(a3);
}

void sub_100006A34(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction);
  uint64_t v9 = static os_log_type_t.debug.getter(a1);
  sub_100004FB0(v9, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v10 = (os_log_s *)sub_100007AA8();
  BOOL v11 = v10;
  if (v8)
  {
    sub_100007AA0( v9,  (uint64_t)&_mh_execute_header,  (uint64_t)v10,  (uint64_t)"Not creating cdm_xpc_service_setup transaction. It already exists.",  66LL);
  }

  else
  {
    if (os_log_type_enabled(v10, (os_log_type_t)v9))
    {
      id v13 = a1;
      uint64_t v26 = a3;
      id v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v25 = swift_slowAlloc(32LL, -1LL);
      aBlock[0] = v25;
      *(_DWORD *)id v14 = 136315138;
      uint64_t v15 = sub_10000784C(v13, (SEL *)&selRef_invocationSource);
      if (v16)
      {
        unint64_t v17 = v16;
      }

      else
      {
        uint64_t v15 = 0x74657320746F6E28LL;
        unint64_t v17 = 0xE900000000000029LL;
      }

      uint64_t v27 = sub_100004200(v15, v17, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, aBlock, v14 + 4);

      swift_bridgeObjectRelease(v17);
      _os_log_impl( (void *)&_mh_execute_header,  v11,  (os_log_type_t)v9,  "Creating cdm_xpc_service_setup transaction. invocationSource:%s",  v14,  0xCu);
      swift_arrayDestroy(v25, 1LL);
      sub_100004BAC(v25);
      uint64_t v18 = (uint64_t)v14;
      a3 = v26;
      sub_100004BAC(v18);
    }

    uint64_t v19 = os_transaction_create("cdm_xpc_service_setup");
    uint64_t v12 = sub_100006210(v19);
  }

  uint64_t v20 = static os_log_type_t.debug.getter(v12);
  sub_100004FB0(v20, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v21 = sub_1000084E8();
  sub_100007AA0(v20, (uint64_t)&_mh_execute_header, (uint64_t)v21, (uint64_t)"Setup called by XPC client.", 27LL);

  sub_10000657C(a1);
  uint64_t v22 = *(void **)(v4 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  aBlock[4] = a2;
  uint64_t v29 = a3;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = (uint64_t)sub_100006D34;
  aBlock[3] = (uint64_t)&unk_10000C828;
  uint64_t v23 = _Block_copy(aBlock);
  uint64_t v24 = v29;
  swift_retain(a3);
  swift_release(v24);
  [v22 setup:a1 completionHandler:v23];
  sub_100007AB0();
}

void sub_100006D34(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void *))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4(a2);
  swift_release(v3);
}

void sub_100006DF4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0LL;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_100006E40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = static os_log_type_t.debug.getter(a1);
  sub_100004FB0(v5, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v6 = sub_100007AA8();
  sub_100007AA0(v5, (uint64_t)&_mh_execute_header, (uint64_t)v6, (uint64_t)"Warmup called by XPC client.", 28LL);

  uint64_t v7 = *(void **)(v3 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  uint64_t v8 = sub_100007AE0((uint64_t)sub_100006D34, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v9, v10);
  sub_100007B10();
  swift_release(a2);
  [v7 warmupWithCompletionHandler:v8];
  sub_100007AB0();
  sub_100007ACC();
}

void sub_100006F84()
{
  uint64_t v3 = v1;
  sub_100007B24();
  uint64_t v5 = v4;
  uint64_t v6 = static os_log_type_t.debug.getter(v4);
  sub_100004FB0(v6, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v7 = sub_100007AA8();
  sub_100007AA0( v6,  (uint64_t)&_mh_execute_header,  (uint64_t)v7,  (uint64_t)"Process CDM Nlu request called by XPC client.",  45LL);

  uint64_t v8 = *(void **)(v3 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  id v9 = objc_allocWithZone((Class)type metadata accessor for CDMNluRequest(0LL));
  uint64_t v10 = (void *)CDMNluRequest.init(objcProto:)(v5);
  uint64_t v11 = sub_100005CFC((uint64_t)&unk_10000C888, 32LL);
  *(void *)(v11 + 16) = v2;
  *(void *)(v11 + 24) = v0;
  uint64_t v14 = v11;
  sub_100007AE0((uint64_t)sub_1000070A0, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v12, v13);
  sub_100007B10();
  swift_release(v14);
  sub_100007AFC(v8, "processCDMNluRequest:completionHandler:");
  sub_100007AB0();

  sub_100007ACC();
}

void sub_1000070A0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void (**)(void *, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  id v8 = a2;
  id v7 = a3;
  v6(a2, a3);
  swift_release(v5);
}

void sub_100007130(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  id v4 = *(void **)(a2 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  id v6 = [v4 areAssetsAvailable:isa];

  ((void (**)(void, id))a3)[2](a3, v6);
  _Block_release(a3);
}

void sub_10000719C()
{
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  id v4 = [v2 areAssetsAvailable:isa];

  v1(v4);
  sub_100004C14();
}

void sub_1000072B0()
{
  id v4 = v3;
  uint64_t v5 = static os_log_type_t.debug.getter(v3);
  sub_100004FB0(v5, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v6 = sub_100007AA8();
  uint64_t v7 = sub_100004B3C(&qword_100011360);
  uint64_t v8 = sub_100005CFC(v7, 72LL);
  *(_OWORD *)(v8 + 16) = xmmword_1000095E0;
  *(void *)(v8 + 56) = sub_100004FB0(v8, &qword_100011368, &OBJC_CLASS___CDMServiceGraphCommand_ptr);
  *(void *)(v8 + 64) = sub_100007980();
  *(void *)(v8 + 32) = v4;
  id v9 = v4;
  os_log(_:dso:log:_:_:)( v5,  &_mh_execute_header,  v6,  "Process CDMServiceGraphCommand=%@ called by XPC client.",  55LL,  2LL,  v8);

  swift_bridgeObjectRelease(v8);
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  uint64_t v11 = objc_opt_self(&OBJC_CLASS___CDMFoundationClient);
  uint64_t v12 = (void *)swift_dynamicCastObjCClassUnconditional(v10, v11, 0LL, 0LL, 0LL);
  uint64_t v13 = sub_100005CFC((uint64_t)&unk_10000C8D8, 32LL);
  *(void *)(v13 + 16) = v2;
  *(void *)(v13 + 24) = v0;
  uint64_t v17 = v13;
  sub_100007AE0((uint64_t)sub_100007450, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v15, v16);
  id v14 = v10;
  sub_100007B10();
  swift_release(v17);
  sub_100007AFC(v12, "doHandleCommand:forCallback:");
  sub_100007AB0();
}

uint64_t sub_100007450(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  swift_unknownObjectRetain(a2);
  id v7 = a3;
  v6(a2, a3);
  swift_release(v5);

  return swift_unknownObjectRelease(a2);
}

uint64_t sub_1000074D4( void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(id, uint64_t, uint64_t))
{
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v13 = sub_100005CFC(a5, 24LL);
  *(void *)(v13 + 16) = v12;
  id v14 = a3;
  id v15 = a1;
  a7(v14, a6, v13);

  return swift_release(v13);
}

void sub_100007560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)(a2);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = (void *)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
  sub_100007A94(v6);
}

void sub_1000075B0(uint64_t a1, void (**a2)(void))
{
  uint64_t v4 = static os_log_type_t.debug.getter(a1);
  sub_100004F78(0LL, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v5 = sub_1000084E8();
  os_log(_:dso:log:_:_:)( v4,  &_mh_execute_header,  v5,  "waitForDataDispatcherCompletion called by XPC client.",  53LL,  2LL,  &_swiftEmptyArrayStorage);

  [*(id *)(a1 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client) waitForDataDispatcherCompletion];
  a2[2](a2);
  _Block_release(a2);
}

void sub_10000765C(void (*a1)(id))
{
  uint64_t v2 = v1;
  uint64_t v4 = static os_log_type_t.debug.getter(a1);
  sub_100004FB0(v4, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v5 = sub_100007AA8();
  sub_100007AA0( v4,  (uint64_t)&_mh_execute_header,  (uint64_t)v5,  (uint64_t)"waitForDataDispatcherCompletion called by XPC client.",  53LL);

  a1( [*(id *)(v2 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client) waitForDataDispatcherCompletion]);
  sub_100007AEC();
}

id sub_100007734(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = static os_log_type_t.debug.getter(a1);
  sub_100004FB0(v3, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v4 = sub_100007AA8();
  sub_100007AA0(v3, (uint64_t)&_mh_execute_header, (uint64_t)v4, (uint64_t)"CDMXPCService deinit", 20LL);

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for CDMXPCService();
  return objc_msgSendSuper2(&v6, "dealloc");
}

uint64_t sub_100007834(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007844(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000784C(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

uint64_t sub_1000078A8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1000078CC(uint64_t a1, uint64_t a2)
{
  id v5 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  uint64_t v6 = static os_log_type_t.debug.getter(a1);
  sub_100004FB0(v6, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v7 = sub_100007AA8();
  sub_100007AA0( v6,  (uint64_t)&_mh_execute_header,  (uint64_t)v7,  (uint64_t)"Process CDM Nlu request response is ready. Sending to client.",  61LL);

  if (a1) {
    uint64_t v8 = dispatch thunk of CDMNluResponse.objcProto.getter();
  }
  else {
    uint64_t v8 = 0LL;
  }
  id v9 = (id)v8;
  v5(v8, a2);
}

unint64_t sub_100007980()
{
  unint64_t result = qword_100011370;
  if (!qword_100011370)
  {
    uint64_t v1 = sub_100004F78(255LL, &qword_100011368, &OBJC_CLASS___CDMServiceGraphCommand_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100011370);
  }

  return result;
}

void sub_1000079D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  if (a1)
  {
    uint64_t v5 = a1;
    uint64_t v6 = objc_opt_self(&OBJC_CLASS___CDMServiceGraphCommand);
    a1 = swift_dynamicCastObjCClass(v5, v6);
  }

  v4(a1, a2);
  sub_100004C14();
}

uint64_t sub_100007A18()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100007A3C(uint64_t a1, uint64_t a2)
{
}

void sub_100007A54(uint64_t a1)
{
}

void sub_100007A94(id a1)
{
}

uint64_t sub_100007AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return os_log(_:dso:log:_:_:)(a1, a2, a3, a4, a5, 2LL);
}

id sub_100007AA8()
{
  return sub_1000084E8();
}

void sub_100007AB0()
{
}

  ;
}

  ;
}

void *sub_100007AE0@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

  ;
}

id sub_100007AFC(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2, v3);
}

id sub_100007B08( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2);
}

uint64_t sub_100007B10()
{
  return swift_retain(v0);
}

void *sub_100007B18(int a1, int a2, void *aBlock)
{
  return _Block_copy(aBlock);
}

  ;
}

id sub_100007B30()
{
  return objc_allocWithZone(v0);
}

id sub_100007B38(uint64_t a1)
{
  uint64_t v1 = dispatch thunk of static CDMXPCDefines.machServiceName()();
  return sub_100007B80(v1, v2);
}

id sub_100007B80(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v6 = [v4 initWithMachServiceName:v5];

  return v6;
}

void sub_100007BF0()
{
  uint64_t v0 = type metadata accessor for CDMXPCServiceDelegate();
  uint64_t v1 = sub_100004FB0(v0, &qword_100011028, &OBJC_CLASS___CDMFoundationClient_ptr);
  sub_1000038A0(v1);
  uint64_t v3 = v2;
  char v4 = sub_1000038C4();
  sub_1000038CC(v3, v4 & 1);
  sub_100004C14();
}

void sub_100007C4C(void *a1, void *a2)
{
}

uint64_t sub_100007C90(void *a1, void *a2)
{
  uint64_t v3 = v2;
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = 0LL;
  *(void *)(v3 + 16) = a1;
  NSString v5 = *(void (**)(void (*)(uint64_t, char, uint64_t), uint64_t))((swift_isaMask & *a2) + 0x80LL);
  id v6 = a2;
  id v7 = a1;
  swift_retain(v3);
  v5(sub_100007DAC, v3);

  uint64_t v8 = *(void **)(v3 + 24);
  id v9 = *(void (**)(void (*)(), void))((swift_isaMask & *v8) + 0xB0LL);
  uint64_t v10 = v8;
  v9(sub_100007E38, 0LL);

  uint64_t v11 = *(void **)(v3 + 24);
  uint64_t v12 = *(void (**)(void (*)(uint64_t), uint64_t))((swift_isaMask & *v11) + 0x98LL);
  swift_retain(v3);
  uint64_t v13 = v11;
  v12(sub_100007EA8, v3);

  id v14 = *(id *)(v3 + 24);
  [v7 setDelegate:v14];

  return v3;
}

void sub_100007DAC(uint64_t a1, char a2, uint64_t a3)
{
  if ((a2 & 1) == 0 || !a1 || !a3) {
    goto LABEL_6;
  }
  uint64_t v4 = v3;
  uint64_t v5 = static os_log_type_t.info.getter();
  sub_100004FB0(v5, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v6 = sub_100007AA8();
  sub_100007AA0(v5, (uint64_t)&_mh_execute_header, (uint64_t)v6, (uint64_t)"Connection accepted", 19LL);

  uint64_t v7 = *(void *)(v4 + 32);
  BOOL v8 = __OFADD__(v7, 1LL);
  uint64_t v9 = v7 + 1;
  if (!v8)
  {
    *(void *)(v4 + 32) = v9;
LABEL_6:
    sub_100004C14();
    return;
  }

  __break(1u);
}

void sub_100007E38()
{
  uint64_t v0 = static os_log_type_t.error.getter();
  sub_100004FB0(v0, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v1 = sub_100007AA8();
  sub_100007AA0(v0, (uint64_t)&_mh_execute_header, (uint64_t)v1, (uint64_t)"Connection interrupted.", 23LL);
}

void sub_100007EA8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = static os_log_type_t.debug.getter(a1);
  sub_100004FB0(v3, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v4 = sub_100007AA8();
  sub_100007AA0(v3, (uint64_t)&_mh_execute_header, (uint64_t)v4, (uint64_t)"Connection invalidated.", 23LL);

  uint64_t v5 = *(void *)(v2 + 32);
  BOOL v6 = __OFSUB__(v5, 1LL);
  uint64_t v7 = v5 - 1;
  if (v6)
  {
    __break(1u);
  }

  else
  {
    *(void *)(v2 + 32) = v7;
    sub_100004C14();
  }

uint64_t sub_100007F28()
{
  return *(void *)(v0 + 32);
}

id sub_100007F30(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = static os_log_type_t.debug.getter(a1);
  sub_100004FB0(v3, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v4 = sub_100007AA8();
  sub_100007AA0(v3, (uint64_t)&_mh_execute_header, (uint64_t)v4, (uint64_t)"Starting CDM Service.", 21LL);

  return [*(id *)(v2 + 16) resume];
}

uint64_t sub_100007FB0()
{
  return v0;
}

uint64_t sub_100007FD4()
{
  return swift_deallocClassInstance(v0, 40LL, 7LL);
}

uint64_t type metadata accessor for CDMXPCListener()
{
  return objc_opt_self(&OBJC_CLASS____TtC14assistant_cdmd14CDMXPCListener);
}

uint64_t sub_100008024(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject(v2, 40LL, 7LL);
  sub_100008078(a1, a2);
  return v5;
}

void *sub_100008078(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = static os_log_type_t.debug.getter(a1);
  sub_100005A24();
  id v7 = sub_1000084E8();
  os_log(_:dso:log:_:_:)(v6, &_mh_execute_header, v7, "Consuming sandbox extension token.", 34LL, 2LL);

  if ((a2 & 0x1000000000000000LL) != 0 || !(a2 & 0x2000000000000000LL | a1 & 0x1000000000000000LL))
  {
    _StringGuts._slowWithCString<A>(_:)(v17, sub_10000823C, 0LL, a1, a2, &type metadata for Int64);
    uint64_t v10 = v17[0];
  }

  else
  {
    __chkstk_darwin();
    if ((a2 & 0x2000000000000000LL) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v10 = sandbox_extension_consume(v17);
    }

    else
    {
      if ((a1 & 0x1000000000000000LL) != 0)
      {
        uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v9 = a1 & 0xFFFFFFFFFFFFLL;
      }

      else
      {
        uint64_t v8 = _StringObject.sharedUTF8.getter(a1, a2);
      }

      uint64_t v10 = sub_100008368(v8, v9, (uint64_t (*)(void))sub_1000083A0);
    }
  }

  if (v10 == -1)
  {
    uint64_t v11 = swift_bridgeObjectRelease(a2);
    int v12 = errno.getter(v11);
    unint64_t v13 = sub_100008268();
    swift_allocError(&type metadata for CDMXPCSandboxExtension.SandboxExtensionError, v13, 0LL, 0LL);
    *id v14 = v12;
    swift_willThrow();
    uint64_t v15 = type metadata accessor for CDMXPCSandboxExtension();
    swift_deallocPartialClassInstance(v3, v15, 40LL, 7LL);
  }

  else
  {
    v3[2] = a1;
    v3[3] = a2;
    v3[4] = v10;
  }

  return v3;
}

uint64_t sub_10000823C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sandbox_extension_consume();
  *a1 = result;
  return result;
}

unint64_t sub_100008268()
{
  unint64_t result = qword_100011500;
  if (!qword_100011500)
  {
    unint64_t result = swift_getWitnessTable("14", &type metadata for CDMXPCSandboxExtension.SandboxExtensionError);
    atomic_store(result, (unint64_t *)&qword_100011500);
  }

  return result;
}

uint64_t type metadata accessor for CDMXPCSandboxExtension()
{
  return objc_opt_self(&OBJC_CLASS____TtC14assistant_cdmd22CDMXPCSandboxExtension);
}

uint64_t sub_1000082C4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = static os_log_type_t.debug.getter(a1);
  sub_100005A24();
  id v4 = sub_1000084E8();
  os_log(_:dso:log:_:_:)( v3,  &_mh_execute_header,  v4,  "Releasing sandbox extension token.",  34LL,  2LL,  &_swiftEmptyArrayStorage);

  sandbox_extension_release(*(void *)(v2 + 32));
  swift_bridgeObjectRelease(*(void *)(v2 + 24));
  return v2;
}

uint64_t sub_100008348(uint64_t a1)
{
  return swift_deallocClassInstance(v1, 40LL, 7LL);
}

uint64_t sub_100008368(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (!v3) {
    return v5;
  }
  return result;
}

void *sub_1000083A0@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

_DWORD *initializeBufferWithCopyOfBuffer for CDMXPCSandboxExtension.SandboxExtensionError( _DWORD *result, _DWORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CDMXPCSandboxExtension.SandboxExtensionError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for CDMXPCSandboxExtension.SandboxExtensionError( uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)uint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CDMXPCSandboxExtension.SandboxExtensionError()
{
  return &type metadata for CDMXPCSandboxExtension.SandboxExtensionError;
}

int main(int argc, const char **argv, const char **envp)
{
  qword_100011748 = sub_1000089C0();
  (*(void (**)(void))(*(void *)qword_100011748 + 144LL))();
  return 0;
}

uint64_t sub_10000848C()
{
  uint64_t v0 = (uint64_t *)sub_1000089A4();
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  swift_bridgeObjectRetain(v2);
  uint64_t result = OS_os_log.init(subsystem:category:)(v1, v2, 1145914435LL, 0xE400000000000000LL);
  qword_100011738 = result;
  return result;
}

id sub_1000084E8()
{
  if (qword_100011730 != -1) {
    swift_once(&qword_100011730, sub_10000848C);
  }
  return (id)qword_100011738;
}

void sub_100008528(uint64_t a1)
{
  uint64_t v1 = sub_100004FB0(a1, &qword_1000115C8, &OBJC_CLASS___OS_dispatch_source_ptr);
  sub_100004FB0(v1, &qword_1000115D0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v2 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v3 = static OS_dispatch_source.makeSignalSource(signal:queue:)(15LL, v2);

  qword_100011750 = v3;
}

void static CDMSignalHandler.registerHandlers()()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  id v4 = (char *)&aBlock[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100011740 != -1) {
    swift_once(&qword_100011740, sub_100008528);
  }
  sub_100004BB8((uint64_t)&qword_100011750, (uint64_t)v17, 0LL);
  uint64_t v9 = sub_100008998();
  aBlock[4] = sub_1000087B4;
  uint64_t aBlock[5] = 0LL;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000040BC;
  aBlock[3] = &unk_10000CA98;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = swift_unknownObjectRetain(v0);
  static DispatchQoS.unspecified.getter(v11);
  sub_100008844();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)(v8, v4, v10, v9);
  _Block_release(v10);
  swift_unknownObjectRelease(v0);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_100008998();
  swift_unknownObjectRetain(v0);
  OS_dispatch_source.activate()();
  uint64_t v12 = swift_unknownObjectRelease(v0);
  uint64_t v13 = static os_log_type_t.debug.getter(v12);
  sub_100004FB0(v13, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v14 = sub_1000084E8();
  os_log(_:dso:log:_:_:)( v13,  &_mh_execute_header,  v14,  "Finished registering signal handlers.",  37LL,  2LL,  &_swiftEmptyArrayStorage);
}

void sub_1000087B4()
{
  uint64_t v0 = static os_log_type_t.fault.getter();
  sub_100004FB0(v0, (unint64_t *)&qword_100011030, &OBJC_CLASS___OS_os_log_ptr);
  id v1 = sub_1000084E8();
  os_log(_:dso:log:_:_:)( v0,  &_mh_execute_header,  v1,  "Received SIGTERM. CDMD is shutting down.",  40LL,  2LL,  &_swiftEmptyArrayStorage);
}

uint64_t sub_10000882C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000883C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100008844()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = &_swiftEmptyArrayStorage;
  unint64_t v1 = sub_1000088D0();
  uint64_t v2 = sub_100004B3C(&qword_1000115B8);
  unint64_t v3 = sub_100008910();
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v5, v2, v3, v0, v1);
}

ValueMetadata *type metadata accessor for CDMSignalHandler()
{
  return &type metadata for CDMSignalHandler;
}

unint64_t sub_1000088D0()
{
  unint64_t result = qword_1000115B0;
  if (!qword_1000115B0)
  {
    uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_1000115B0);
  }

  return result;
}

unint64_t sub_100008910()
{
  unint64_t result = qword_1000115C0;
  if (!qword_1000115C0)
  {
    uint64_t v1 = sub_100008954(&qword_1000115B8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000115C0);
  }

  return result;
}

uint64_t sub_100008954(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100008998()
{
  return swift_getObjectType(*v0);
}

void *sub_1000089A4()
{
  return &unk_10000CAE0;
}

ValueMetadata *type metadata accessor for NLRouterSignposts()
{
  return &type metadata for NLRouterSignposts;
}

uint64_t sub_1000089C0()
{
  uint64_t v1 = swift_allocObject(v0, 72LL, 7LL);
  sub_1000089F4();
  return v1;
}

void *sub_1000089F4()
{
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = sub_100008D44();
  type metadata accessor for OS_dispatch_queue.Attributes(v4);
  sub_100008D24();
  __chkstk_darwin();
  sub_100008D34();
  type metadata accessor for DispatchQoS(0LL);
  sub_100008D24();
  __chkstk_darwin();
  sub_100008D34();
  sub_100004FB0(v5, &qword_100011028, &OBJC_CLASS___CDMFoundationClient_ptr);
  id v6 = sub_10000647C(0xD00000000000001ELL, 0x800000010000ADB0LL);
  v0[2] = v6;
  id v7 = [objc_allocWithZone(NSCondition) init];
  v0[6] = v7;
  dispatch_group_t v8 = dispatch_group_create();
  v0[7] = v8;
  sub_100004FB0((uint64_t)v8, &qword_1000115D0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v9 = static DispatchQoS.background.getter();
  static OS_dispatch_queue.Attributes.concurrent.getter(v9);
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))( v1,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v2);
  unint64_t v10 = sub_100008D8C();
  uint64_t v11 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v10);
  v0[8] = v11;
  uint64_t v12 = type metadata accessor for CDMXPCListener();
  id v13 = sub_100007B38(v12);
  sub_100007BF0();
  sub_100007C4C(v13, v14);
  v0[3] = v15;
  type metadata accessor for CDMXPCStreamEventListener();
  id v16 = v7;
  uint64_t v17 = v8;
  id v18 = v11;
  sub_100008D80();
  id v19 = v6;
  uint64_t v20 = sub_100008D6C();
  v0[4] = sub_100005D18(v20, v21, v22, v23, (uint64_t)v19);
  type metadata accessor for CDMXPCActivityListener();
  id v24 = v16;
  uint64_t v25 = v17;
  id v26 = v11;
  sub_100008D80();
  id v27 = v19;
  uint64_t v28 = sub_100008D6C();
  v0[5] = sub_100004FB8(v28, v29, v30, v31, v32);
  return v0;
}

void sub_100008C1C()
{
  id v1 = [(id)objc_opt_self(NSRunLoop) mainRunLoop];
  [v1 run];
}

uint64_t sub_100008C98()
{
  swift_release(*(void *)(v0 + 24));
  swift_release(*(void *)(v0 + 32));
  swift_release(*(void *)(v0 + 40));

  return v0;
}

uint64_t sub_100008CE4()
{
  return swift_deallocClassInstance(v0, 72LL, 7LL);
}

uint64_t type metadata accessor for CDMDaemon()
{
  return objc_opt_self(&OBJC_CLASS____TtC14assistant_cdmd9CDMDaemon);
}

  ;
}

  ;
}

uint64_t sub_100008D44()
{
  return 0LL;
}

uint64_t sub_100008D60()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128LL))();
}

uint64_t sub_100008D6C()
{
  return v0;
}

uint64_t sub_100008D80()
{
  return swift_retain(v0);
}

unint64_t sub_100008D8C()
{
  return 0xD000000000000019LL;
}
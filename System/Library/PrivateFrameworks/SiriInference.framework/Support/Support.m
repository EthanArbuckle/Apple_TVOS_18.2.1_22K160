int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_log_s *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  os_log_s *v16;
  os_log_s *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __objc2_meth_list *v23;
  id v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  os_log_s *v31;
  os_log_type_t v32;
  uint8_t *v33;
  __objc2_meth_list *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  void (__cdecl *v39)(int);
  void (__cdecl *v40)(int);
  os_log_s *v41;
  os_log_type_t v42;
  uint8_t *v43;
  id v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t ObjectType;
  void *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t aBlock[7];
  v3 = type metadata accessor for DispatchWorkItemFlags(0LL);
  v75 = *(void *)(v3 - 8);
  v76 = v3;
  __chkstk_darwin(v3);
  v74 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v5 = type metadata accessor for DispatchQoS(0LL);
  v72 = *(void *)(v5 - 8);
  v73 = v5;
  __chkstk_darwin(v5);
  v71 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v7 = type metadata accessor for OSSignpostID(0LL);
  v67 = *(void *)(v7 - 8);
  v68 = v7;
  __chkstk_darwin(v7);
  v65 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  v9 = type metadata accessor for Logger(0LL);
  v66 = sub_100003F28(v9, (uint64_t)qword_10001E0D8);
  v10 = (os_log_s *)v66;
  Logger.logObject.getter(v66);
  v11 = sub_100004934();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)sub_1000048E8(2LL);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "starting siriinferenced...", v12, 2u);
    sub_1000048DC((uint64_t)v12);
  }

  v13 = type metadata accessor for Signpost(0LL);
  sub_100003F40(v13, qword_10001E040);
  v69 = v13;
  v14 = sub_100003F28(v13, (uint64_t)qword_10001E040);
  if (qword_10001D518 != -1) {
    swift_once(&qword_10001D518, sub_10000A970);
  }
  v15 = (id)qword_10001E0A0;
  v70 = v14;
  sub_10000A83C((uint64_t)"StartDaemon", 11LL, 2LL, v15, v14);
  sub_100008F2C();
  if (qword_10001D520 != -1) {
    swift_once(&qword_10001D520, sub_10000B380);
  }
  v16 = (os_log_s *)sub_100003F28(v9, (uint64_t)qword_10001E0A8);
  v17 = (os_log_s *)Logger.logObject.getter(v16);
  v18 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)sub_1000048E8(12LL);
    v20 = sub_1000048E8(32LL);
    aBlock[0] = v20;
    *(_DWORD *)v19 = 136315138;
    v77 = sub_100004928(0xD000000000000022LL, (uint64_t)"com.apple.siriinferenced");
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, aBlock, v19 + 4);
    sub_100004948((void *)&_mh_execute_header, v17, v18, "starting %s XPC listener", v19);
    swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
    sub_1000048DC(v20);
    sub_1000048DC((uint64_t)v19);
  }

  sub_100004914(v21, &qword_10001D538, &OBJC_CLASS___NSXPCListener_ptr);
  qword_10001E058 = (uint64_t)sub_10000491C(0xD000000000000022LL, (uint64_t)"com.apple.siriinferenced");
  v22 = objc_allocWithZone((Class)type metadata accessor for SiriRemembersServiceDelegate());
  qword_10001E060 = (uint64_t)sub_10000490C(v22);
  sub_100004900();
  v23 = &OBJC_INSTANCE_METHODS_NSObject;
  v24 = sub_100004950();
  Logger.logObject.getter(v24);
  v25 = sub_100004934();
  if (os_log_type_enabled(v16, v25))
  {
    v26 = (uint8_t *)sub_1000048E8(12LL);
    v27 = sub_1000048E8(32LL);
    aBlock[0] = v27;
    *(_DWORD *)v26 = 136315138;
    v77 = sub_10000404C(0xD000000000000018LL, 0x8000000100013BB0LL, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, aBlock, v26 + 4);
    sub_100004948((void *)&_mh_execute_header, v16, v25, "starting %s XPC listener", v26);
    sub_1000048F0((uint64_t)&type metadata for Any);
    v28 = v27;
    v23 = &OBJC_INSTANCE_METHODS_NSObject;
    sub_1000048DC(v28);
    sub_1000048DC((uint64_t)v26);
  }

  qword_10001E068 = (uint64_t)sub_100003CAC(0xD000000000000018LL, 0x8000000100013BB0LL);
  v29 = objc_allocWithZone((Class)type metadata accessor for SiriInferenceServiceDelegate());
  qword_10001E070 = (uint64_t)sub_10000490C(v29);
  sub_100004900();
  v30 = sub_100004950();
  v31 = v16;
  Logger.logObject.getter(v30);
  v32 = sub_100004934();
  if (os_log_type_enabled(v16, v32))
  {
    v33 = (uint8_t *)sub_1000048E8(12LL);
    v34 = v23;
    v35 = sub_1000048E8(32LL);
    aBlock[0] = v35;
    *(_DWORD *)v33 = 136315138;
    v77 = sub_100004928(0xD000000000000020LL, (uint64_t)"ferenced.remembers");
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, aBlock, v33 + 4);
    sub_100004948((void *)&_mh_execute_header, v31, v32, "starting %s XPC listener", v33);
    sub_1000048F0((uint64_t)&type metadata for Any);
    v36 = v35;
    v23 = v34;
    sub_1000048DC(v36);
    sub_1000048DC((uint64_t)v33);
  }

  qword_10001E078 = (uint64_t)sub_10000491C(0xD000000000000020LL, (uint64_t)"ferenced.remembers");
  v37 = objc_allocWithZone((Class)type metadata accessor for SiriSignalsServiceDelegate());
  qword_10001E080 = (uint64_t)sub_10000490C(v37);
  v38 = (void *)qword_10001E078;
  [(id)qword_10001E078 setDelegate:qword_10001E080];
  v39 = (void (__cdecl *)(int))SIG_IGN.getter([v38 *(SEL *)&v23[434]]);
  v40 = signal(15, v39);
  v41 = (os_log_s *)Logger.logObject.getter(v40);
  v42 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)sub_1000048E8(2LL);
    *(_WORD *)v43 = 0;
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "starting BackgroundManager", v43, 2u);
    sub_1000048DC((uint64_t)v43);
  }

  v44 = (id)qword_10001E0A0;
  v45 = v65;
  v46 = OSSignpostID.init(log:)();
  v47 = static os_signpost_type_t.begin.getter(v46);
  v48 = sub_100003F80(&qword_10001D540);
  v49 = swift_allocObject(v48, 72LL, 7LL);
  *(_OWORD *)(v49 + 16) = xmmword_1000136E0;
  v50 = StaticString.description.getter("StartBackgroundManager");
  v52 = v51;
  *(void *)(v49 + 56) = &type metadata for String;
  *(void *)(v49 + 64) = sub_100003FC0();
  *(void *)(v49 + 32) = v50;
  *(void *)(v49 + 40) = v52;
  os_signpost(_:dso:log:name:signpostID:_:_:)( v47,  &_mh_execute_header,  v44,  "StartBackgroundManager",  22LL,  2LL,  v45,  "%@ enableTelemetry=YES",  22LL,  2,  v49);
  swift_bridgeObjectRelease(v49);
  v53 = type metadata accessor for BackgroundManager();
  swift_allocObject(v53, 48LL, 7LL);
  v54 = sub_100006774();
  v55 = static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)(v55, &_mh_execute_header, v44, "StartBackgroundManager", 22LL, 2LL, v45);
  sub_10000493C(v67);

  qword_10001E088 = (uint64_t)v54;
  v57 = sub_100004914(v56, (unint64_t *)&unk_10001D550, &OBJC_CLASS___OS_dispatch_source_ptr);
  sub_100004914(v57, (unint64_t *)&qword_10001DB60, &OBJC_CLASS___OS_dispatch_queue_ptr);
  v58 = (void *)static OS_dispatch_queue.main.getter();
  v59 = static OS_dispatch_source.makeSignalSource(signal:queue:)(15LL, v58);

  qword_10001E090 = v59;
  ObjectType = swift_getObjectType(v59);
  aBlock[4] = (uint64_t)sub_100003D1C;
  aBlock[5] = 0LL;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = (uint64_t)sub_100003E80;
  aBlock[3] = (uint64_t)&unk_100018D18;
  v61 = _Block_copy(aBlock);
  v62 = v71;
  static DispatchQoS.unspecified.getter();
  v63 = v74;
  sub_100003EAC();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)(v62, v63, v61, ObjectType);
  _Block_release(v61);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v63, v76);
  sub_10000493C(v72);
  swift_getObjectType(qword_10001E090);
  OS_dispatch_source.activate()();
  sub_100009128();
  v64 = static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)( v64,  &_mh_execute_header,  *(void *)(v70 + *(int *)(v69 + 24)),  *(void *)(v70 + *(int *)(v69 + 20)),  *(void *)(v70 + *(int *)(v69 + 20) + 8),  *(unsigned __int8 *)(v70 + *(int *)(v69 + 20) + 16),  v70);
  dispatch_main();
}

id sub_100003CAC(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v6 = [v4 initWithMachServiceName:v5];

  return v6;
}

uint64_t sub_100003D1C()
{
  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100003F28(v0, (uint64_t)qword_10001E0D8);
  v1 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "got SIGTERM signal", v3, 2u);
    swift_slowDealloc(v3, -1LL, -1LL);
  }

  type metadata accessor for BackgroundQueue(0LL);
  id v4 = (void *)static BackgroundQueue.shared.getter();
  [v4 cancelAllOperations];

  NSString v5 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "cancelled BackgroundQueue ops, calling xpc_transaction_exit_clean",  v7,  2u);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  return xpc_transaction_exit_clean();
}

uint64_t sub_100003E80(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_100003EAC()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags(0LL);
  NSString v5 = &_swiftEmptyArrayStorage;
  unint64_t v1 = sub_100004814();
  uint64_t v2 = sub_100003F80(&qword_10001D570);
  unint64_t v3 = sub_100004854();
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v5, v2, v3, v0, v1);
}

uint64_t sub_100003F28(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100003F40(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100003F80(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100003FC0()
{
  unint64_t result = qword_10001D548;
  if (!qword_10001D548)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001D548);
  }

  return result;
}

uint64_t sub_100003FFC(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_100004034(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100004044(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000404C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  os_log_type_t v6 = sub_10000411C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100004290((uint64_t)v12, *a3);
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
      sub_100004290((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100004270(v12);
  return v7;
}

void *sub_10000411C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1000042CC((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_100004390(a5, a6);
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

uint64_t sub_100004270(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100004290(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_1000042CC(char *__src, size_t __n, char *__dst)
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

void *sub_100004390(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100004424(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_1000045F8(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000045F8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100004424(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_100004594(v4, 0LL);
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

void *sub_100004594(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100003F80(&qword_10001D560);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_1000045F8(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_100003F80(&qword_10001D560);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }

  v13 = v11 + 32;
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_100004790(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_1000046CC(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_1000046CC(char *__src, size_t __n, char *__dst)
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

char *sub_100004790(char *__src, size_t __len, char *__dst)
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

unint64_t sub_100004814()
{
  unint64_t result = qword_10001D568;
  if (!qword_10001D568)
  {
    uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10001D568);
  }

  return result;
}

unint64_t sub_100004854()
{
  unint64_t result = qword_10001D578;
  if (!qword_10001D578)
  {
    uint64_t v1 = sub_100004898(&qword_10001D570);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001D578);
  }

  return result;
}

uint64_t sub_100004898(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000048DC(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_1000048E8(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

uint64_t sub_1000048F0@<X0>(uint64_t a1@<X8>)
{
  return swift_arrayDestroy(v1, 1LL, a1 + 8);
}

id sub_100004900()
{
  return [v0 *(SEL *)(v1 + 3464)];
}

id sub_10000490C(void *a1)
{
  return [a1 *(SEL *)(v1 + 3456)];
}

uint64_t sub_100004914(uint64_t a1, unint64_t *a2, void *a3)
{
  return sub_100003FFC(0LL, a2, a3);
}

id sub_10000491C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100003CAC(a1, a2 | 0x8000000000000000LL);
}

uint64_t sub_100004928@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000404C(a1, a2 | 0x8000000000000000LL, (uint64_t *)(v2 - 136));
}

uint64_t sub_100004934()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000493C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

void sub_100004948(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

id sub_100004950()
{
  return [v0 *(SEL *)(v1 + 3472)];
}

uint64_t sub_10000495C(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  *(void *)(v2 + 16) = 0LL;
  if (qword_10001D520 != -1) {
    swift_once(&qword_10001D520, sub_10000B380);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = sub_100003F28(v6, (uint64_t)qword_10001E0A8);
  int64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)sub_100006768();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Initializing BiomeMonitorAppIntent", v10, 2u);
    sub_1000048DC((uint64_t)v10);
  }

  *(void *)(v3 + 24) = a2;
  swift_retain(a2);
  sub_100004A80(a1);
  uint64_t v12 = v11;

  swift_release(a2);
  v13 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v12;

  return v3;
}

void sub_100004A80(void *a1)
{
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_10000673C();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  sub_10000674C();
  __chkstk_darwin(v7);
  sub_10000673C();
  uint64_t v10 = v9 - v8;
  type metadata accessor for DispatchQoS(0LL);
  sub_10000674C();
  __chkstk_darwin(v11);
  sub_10000673C();
  uint64_t v14 = v13 - v12;
  if (qword_10001D520 != -1) {
    swift_once(&qword_10001D520, sub_10000B380);
  }
  uint64_t v15 = type metadata accessor for Logger(0LL);
  uint64_t v16 = sub_100003F28(v15, (uint64_t)qword_10001E0A8);
  v17 = (os_log_s *)Logger.logObject.getter(v16);
  os_log_type_t v18 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Registering AppIntentBiomeMonitor", v19, 2u);
    swift_slowDealloc(v19, -1LL, -1LL);
  }

  sub_100006498();
  static DispatchQoS.unspecified.getter();
  v30 = &_swiftEmptyArrayStorage;
  unint64_t v20 = sub_1000064D4();
  uint64_t v21 = sub_100003F80((uint64_t *)&unk_10001DB70);
  unint64_t v22 = sub_100006514();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v30, v21, v22, v6, v20);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))( v5,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v1);
  v23 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000022LL,  0x8000000100013FE0LL,  v14,  v10,  v5,  0LL);
  id v24 = objc_allocWithZone(&OBJC_CLASS___BMBiomeScheduler);
  id v25 = sub_100006438(0xD000000000000022LL, 0x8000000100013FE0LL, v23);
  uint64_t v26 = swift_allocObject(&unk_100018DA0, 24LL, 7LL);
  *(void *)(v26 + 16) = 0LL;
  v27 = objc_autoreleasePoolPush();
  sub_100004D2C((uint64_t)v25, a1, v26, &v30);
  objc_autoreleasePoolPop(v27);
  if (v29)
  {
    __break(1u);
  }

  else
  {
    swift_release(v26);
  }
}

void sub_100004D2C(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  id v8 = [(id)objc_opt_self(BMStreams) intent];
  id v9 = [v8 publisher];

  id v10 = [v9 subscribeOn:a1];
  v32 = sub_100005098;
  uint64_t v33 = 0LL;
  aBlock = _NSConcreteStackBlock;
  uint64_t v29 = 1107296256LL;
  v30 = sub_100005248;
  v31 = &unk_100018DB8;
  uint64_t v11 = _Block_copy(&aBlock);
  uint64_t v12 = swift_allocObject(&unk_100018DF0, 32LL, 7LL);
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  v32 = sub_1000065AC;
  uint64_t v33 = v12;
  aBlock = _NSConcreteStackBlock;
  uint64_t v29 = 1107296256LL;
  v30 = sub_100006034;
  v31 = &unk_100018E08;
  uint64_t v13 = _Block_copy(&aBlock);
  uint64_t v14 = v33;
  id v15 = a2;
  swift_retain(a3);
  swift_release(v14);
  id v16 = [v10 sinkWithCompletion:v11 receiveInput:v13];
  _Block_release(v13);
  _Block_release(v11);

  if (qword_10001D520 != -1) {
    swift_once(&qword_10001D520, sub_10000B380);
  }
  uint64_t v17 = type metadata accessor for Logger(0LL);
  sub_100003F28(v17, (uint64_t)qword_10001E0A8);
  swift_retain(a3);
  id v18 = v16;
  v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc(22LL, -1LL);
    uint64_t v22 = a3;
    v23 = (void ***)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v21 = 138412546;
    uint64_t v26 = v18;
    id v24 = (void **)[v18 status];
    aBlock = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v29, v21 + 4);
    void *v23 = v24;

    *(_WORD *)(v21 + 12) = 2048;
    swift_beginAccess(v22 + 16, &aBlock, 0LL, 0LL);
    uint64_t v27 = *(void *)(v22 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &aBlock, v21 + 14);
    swift_release(v22);
    _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "AppIntentBiomeMonitor status=%@ fetchedEvents=%ld",  (uint8_t *)v21,  0x16u);
    uint64_t v25 = sub_100003F80(&qword_10001D6B8);
    swift_arrayDestroy(v23, 1LL, v25);
    id v18 = v26;
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v21, -1LL, -1LL);
  }

  else
  {

    swift_release(a3);
    v19 = (os_log_s *)v18;
  }

  *a4 = v18;
}

void sub_100005098(void *a1)
{
  if (qword_10001D520 != -1) {
    swift_once(&qword_10001D520, sub_10000B380);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100003F28(v2, (uint64_t)qword_10001E0A8);
  id v9 = a1;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v5 = 138412290;
    id v10 = v9;
    id v7 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v5 + 4);
    *uint64_t v6 = v9;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "BiomeMonitorAppIntent is done: %@", v5, 0xCu);
    uint64_t v8 = sub_100003F80(&qword_10001D6B8);
    swift_arrayDestroy(v6, 1LL, v8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  else
  {
  }

void sub_100005248(uint64_t a1, void *a2)
{
  os_log_type_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

void sub_100005298(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)(a3 + 16);
  uint64_t v6 = objc_autoreleasePoolPush();
  sub_10000537C(a1, a2, v5);
  objc_autoreleasePoolPop(v6);
  uint64_t v7 = swift_allocObject(&unk_100018E40, 24LL, 7LL);
  *(void *)(v7 + 16) = a1;
  aBlock[4] = sub_1000065D8;
  uint64_t v11 = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100003E80;
  aBlock[3] = &unk_100018E58;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = v11;
  swift_unknownObjectRetain(a1);
  swift_release(v9);
  [a2 addOperationWithBlock:v8];
  _Block_release(v8);
}

void sub_10000537C(uint64_t a1, void *a2, void *a3)
{
  v75 = a3;
  uint64_t v5 = type metadata accessor for Date(0LL);
  __chkstk_darwin(v5);
  v74 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_100003F80(&qword_10001D6C8);
  __chkstk_darwin(v7);
  uint64_t v9 = (uint64_t *)((char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v10 = sub_100003F80(&qword_10001D6D0);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v77 = (uint64_t)&v70 - v14;
  uint64_t v15 = type metadata accessor for URL(0LL);
  uint64_t v76 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  id v18 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v16);
  v73 = (char *)&v70 - v19;
  swift_unknownObjectRetain(a1);
  uint64_t v20 = objc_opt_self(&OBJC_CLASS___BMStoreEvent);
  uint64_t v21 = swift_dynamicCastObjCClass(a1, v20);
  uint64_t v22 = &off_10001D000;
  if (!v21)
  {
    swift_unknownObjectRelease(a1);
    uint64_t v29 = a1;
    if (qword_10001D520 != -1) {
      swift_once(&qword_10001D520, sub_10000B380);
    }
    uint64_t v31 = type metadata accessor for Logger(0LL);
    uint64_t v32 = sub_100003F28(v31, (uint64_t)qword_10001E0A8);
    uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
    os_log_type_t v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = swift_slowAlloc(32LL, -1LL);
      uint64_t v36 = swift_slowAlloc(64LL, -1LL);
      v79[0] = v36;
      *(_DWORD *)uint64_t v35 = 136446722;
      uint64_t v80 = sub_10000404C(0xD00000000000005ELL, 0x8000000100014040LL, v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v35 + 4);
      *(_WORD *)(v35 + 12) = 2082;
      uint64_t v80 = sub_10000404C(0xD000000000000010LL, 0x80000001000140A0LL, v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v35 + 14);
      *(_WORD *)(v35 + 22) = 2050;
      uint64_t v80 = 67LL;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v35 + 24);
      _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "unwrapped nil. file=%{public}s function=%{public}s line=%{public}ld",  (uint8_t *)v35,  0x20u);
      swift_arrayDestroy(v36, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v36, -1LL, -1LL);
      swift_slowDealloc(v35, -1LL, -1LL);
    }

    unint64_t v37 = sub_100006640();
    uint64_t v27 = swift_allocError(&type metadata for UnwrapError, v37, 0LL, 0LL);
    swift_willThrow();
LABEL_15:
    id v30 = 0LL;
    goto LABEL_16;
  }

  v23 = (void *)v21;
  uint64_t v72 = a1;
  id v24 = objc_allocWithZone((Class)type metadata accessor for AppIntentProcessor(0LL));
  id v25 = v23;
  uint64_t v26 = (void *)AppIntentProcessor.init(event:)();
  static SiriRemembersDB.defaultURL.getter([a2 addOperation:v26]);
  if (swift_getEnumCaseMultiPayload(v9, v7) != 1)
  {
    id v71 = v25;
    uint64_t v39 = v76;
    uint64_t v38 = v77;
    v40 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v76 + 32);
    v40(v77, v9, v15);
    sub_10000667C(v38, 0LL, 1LL, v15);
    sub_100006688(v38, (uint64_t)v13);
    if (sub_1000066D0((uint64_t)v13, 1LL, v15) != 1)
    {
      v64 = v73;
      v40((uint64_t)v73, (uint64_t *)v13, v15);
      sub_1000066DC(v38);
      id v65 = v71;
      v66 = v74;
      Date.init()();
      (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v18, v64, v15);
      id v67 = objc_allocWithZone((Class)type metadata accessor for BiomeInteractionProcessor(0LL));
      v68 = (void *)BiomeInteractionProcessor.init(appIntentEvent:eventReceivedAt:databaseURL:)(v65, v66, v18);
      [a2 addOperation:v68];

      (*(void (**)(char *, uint64_t))(v39 + 8))(v64, v15);
      v69 = v75;
      swift_beginAccess(v75, v79, 1LL, 0LL);
      if (__OFADD__(*v69, 1LL)) {
        __break(1u);
      }
      else {
        ++*v69;
      }
      return;
    }

    id v78 = v26;
    sub_1000066DC((uint64_t)v13);
    uint64_t v22 = &off_10001D000;
    if (qword_10001D520 != -1) {
      swift_once(&qword_10001D520, sub_10000B380);
    }
    uint64_t v41 = type metadata accessor for Logger(0LL);
    uint64_t v42 = sub_100003F28(v41, (uint64_t)qword_10001E0A8);
    v43 = (os_log_s *)Logger.logObject.getter(v42);
    os_log_type_t v44 = static os_log_type_t.error.getter();
    BOOL v45 = os_log_type_enabled(v43, v44);
    uint64_t v29 = v72;
    if (v45)
    {
      uint64_t v46 = swift_slowAlloc(32LL, -1LL);
      uint64_t v47 = swift_slowAlloc(64LL, -1LL);
      v79[0] = v47;
      *(_DWORD *)uint64_t v46 = 136446722;
      uint64_t v80 = sub_10000404C(0xD00000000000005ELL, 0x8000000100014040LL, v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v46 + 4);
      *(_WORD *)(v46 + 12) = 2082;
      uint64_t v80 = sub_10000404C(0xD000000000000010LL, 0x80000001000140A0LL, v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v46 + 14);
      *(_WORD *)(v46 + 22) = 2050;
      uint64_t v80 = 83LL;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v46 + 24);
      _os_log_impl( (void *)&_mh_execute_header,  v43,  v44,  "unwrapped nil. file=%{public}s function=%{public}s line=%{public}ld",  (uint8_t *)v46,  0x20u);
      swift_arrayDestroy(v47, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1LL, -1LL);
      swift_slowDealloc(v46, -1LL, -1LL);
    }

    id v48 = v71;
    unint64_t v49 = sub_100006640();
    uint64_t v27 = swift_allocError(&type metadata for UnwrapError, v49, 0LL, 0LL);
    swift_willThrow();
    sub_1000066DC(v77);

    goto LABEL_15;
  }

  uint64_t v27 = *v9;
  v79[0] = *v9;
  uint64_t v28 = sub_100003F80(&qword_10001D6E0);
  swift_willThrowTypedImpl(v79, v28, &protocol self-conformance witness table for Error);

  uint64_t v29 = v72;
  id v30 = v78;
  uint64_t v22 = &off_10001D000;
LABEL_16:
  if (v22[164] != (ClassDescriptor *)-1LL) {
    swift_once(&qword_10001D520, sub_10000B380);
  }
  uint64_t v50 = type metadata accessor for Logger(0LL);
  sub_100003F28(v50, (uint64_t)qword_10001E0A8);
  swift_unknownObjectRetain(v29);
  swift_errorRetain(v27);
  swift_unknownObjectRetain(v29);
  uint64_t v51 = swift_errorRetain(v27);
  v52 = (os_log_s *)Logger.logObject.getter(v51);
  os_log_type_t v53 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = swift_slowAlloc(22LL, -1LL);
    uint64_t v55 = swift_slowAlloc(64LL, -1LL);
    id v78 = v30;
    v79[0] = v55;
    uint64_t v56 = v55;
    *(_DWORD *)uint64_t v54 = 136315394;
    uint64_t v80 = v29;
    swift_unknownObjectRetain(v29);
    uint64_t v57 = String.init<A>(describing:)(&v80, (char *)&type metadata for Swift.AnyObject + 8);
    unint64_t v59 = v58;
    uint64_t v80 = sub_10000404C(v57, v58, v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v54 + 4);
    swift_unknownObjectRelease_n(v29, 2LL);
    swift_bridgeObjectRelease(v59);
    *(_WORD *)(v54 + 12) = 2080;
    uint64_t v80 = v27;
    swift_errorRetain(v27);
    uint64_t v60 = sub_100003F80(&qword_10001D6E0);
    uint64_t v61 = String.init<A>(describing:)(&v80, v60);
    unint64_t v63 = v62;
    uint64_t v80 = sub_10000404C(v61, v62, v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v54 + 14);
    swift_bridgeObjectRelease(v63);
    swift_errorRelease(v27);
    swift_errorRelease(v27);
    _os_log_impl( (void *)&_mh_execute_header,  v52,  v53,  "cannot process AppIntent event:\nevent=%s\nerror=%s",  (uint8_t *)v54,  0x16u);
    swift_arrayDestroy(v56, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v56, -1LL, -1LL);
    swift_slowDealloc(v54, -1LL, -1LL);

    swift_errorRelease(v27);
  }

  else
  {
    swift_errorRelease(v27);
    swift_unknownObjectRelease_n(v29, 2LL);
    swift_errorRelease(v27);
    swift_errorRelease(v27);
  }

void sub_100005CC0(uint64_t a1)
{
  uint64_t v2 = objc_opt_self(&OBJC_CLASS___BMStoreEvent);
  uint64_t v3 = (os_log_s *)swift_dynamicCastObjCClass(a1, v2);
  if (!v3)
  {
    swift_unknownObjectRelease(a1);
    if (qword_10001D520 != -1) {
      swift_once(&qword_10001D520, sub_10000B380);
    }
    uint64_t v21 = type metadata accessor for Logger(0LL);
    uint64_t v22 = sub_100003F28(v21, (uint64_t)qword_10001E0A8);
    uint64_t v27 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v23))
    {
      uint64_t v24 = swift_slowAlloc(32LL, -1LL);
      uint64_t v25 = swift_slowAlloc(64LL, -1LL);
      uint64_t v29 = v25;
      *(_DWORD *)uint64_t v24 = 136446722;
      uint64_t v28 = sub_10000404C(0xD00000000000005ELL, 0x8000000100014040LL, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v24 + 4);
      *(_WORD *)(v24 + 12) = 2082;
      uint64_t v28 = sub_10000404C(0xD000000000000010LL, 0x80000001000140A0LL, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v24 + 14);
      *(_WORD *)(v24 + 22) = 2050;
      uint64_t v28 = 108LL;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v24 + 24);
      _os_log_impl( (void *)&_mh_execute_header,  v27,  v23,  "unwrapped nil. file=%{public}s function=%{public}s line=%{public}ld",  (uint8_t *)v24,  0x20u);
      swift_arrayDestroy(v25, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);

      return;
    }

    goto LABEL_9;
  }

  uint64_t v27 = v3;
  id v4 = -[os_log_s eventBody](v3, "eventBody");
  if (!v4)
  {
LABEL_9:

    return;
  }

  id v26 = v4;
  uint64_t v5 = sub_1000065E0(v4);
  if (v6)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    type metadata accessor for SignalRepository(0LL);
    uint64_t v9 = static SignalRepository.shared.getter();
    uint64_t v10 = sub_100003F80(&qword_10001D6C0);
    uint64_t v11 = type metadata accessor for SignalCachingStrategyOption(0LL);
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(void *)(v12 + 72);
    uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
    uint64_t v15 = (v14 + 32) & ~v14;
    uint64_t v16 = swift_allocObject(v10, v15 + 2 * v13, v14 | 7);
    *(_OWORD *)(v16 + 16) = xmmword_100013710;
    uint64_t v17 = (uint64_t *)(v16 + v15);
    uint64_t *v17 = v7;
    v17[1] = v8;
    id v18 = *(void (**)(void))(v12 + 104);
    ((void (*)(uint64_t *, void, uint64_t))v18)( v17,  enum case for SignalCachingStrategyOption.perAppIntentEvent(_:),  v11);
    uint64_t v19 = (uint64_t *)((char *)v17 + v13);
    void *v19 = 0x6E65746E49707041LL;
    v19[1] = 0xE900000000000074LL;
    v18();
    uint64_t v20 = sub_1000089D8(v16);
    dispatch thunk of SignalRepository.prewarm(matchingCachingStrategy:userInteractive:)(v20, 0LL);

    swift_release(v9);
    swift_bridgeObjectRelease(v20);
  }

  else
  {
  }

uint64_t sub_100006034(uint64_t a1, uint64_t a2)
{
  id v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  uint64_t v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

void sub_10000607C()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  sub_10000673C();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  sub_10000674C();
  __chkstk_darwin();
  sub_10000673C();
  uint64_t v8 = v7 - v6;
  type metadata accessor for DispatchQoS(0LL);
  sub_10000674C();
  __chkstk_darwin();
  sub_10000673C();
  uint64_t v11 = v10 - v9;
  if (qword_10001D520 != -1) {
    swift_once(&qword_10001D520, sub_10000B380);
  }
  uint64_t v12 = type metadata accessor for Logger(0LL);
  sub_100003F28(v12, (uint64_t)qword_10001E0A8);
  uint64_t v13 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)sub_100006768();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Deregistering AppIntentBiomeMonitor", v15, 2u);
    sub_1000048DC((uint64_t)v15);
  }

  sub_100006498();
  static DispatchQoS.unspecified.getter();
  uint64_t v29 = (void **)&_swiftEmptyArrayStorage;
  unint64_t v16 = sub_1000064D4();
  uint64_t v17 = sub_100003F80((uint64_t *)&unk_10001DB70);
  unint64_t v18 = sub_100006514();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v29, v17, v18, v5, v16);
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))( v4,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v0);
  uint64_t v19 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000022LL,  0x8000000100013FE0LL,  v11,  v8,  v4,  0LL);
  id v20 = objc_allocWithZone(&OBJC_CLASS___BMBiomeScheduler);
  id v21 = sub_100006438(0xD000000000000022LL, 0x8000000100013FE0LL, v19);
  uint64_t v22 = (void *)objc_opt_self(&OBJC_CLASS___BMStreams);
  id v23 = objc_msgSend(v22, "intent", v29);
  id v24 = [v23 publisher];

  id v25 = [v24 subscribeOn:v21];
  uint64_t v31 = nullsub_1;
  uint64_t v32 = 0LL;
  uint64_t v29 = _NSConcreteStackBlock;
  uint64_t v30 = 1107296256LL;
  id v26 = sub_10000675C((uint64_t)sub_100005248);
  uint64_t v31 = nullsub_1;
  uint64_t v32 = 0LL;
  uint64_t v29 = _NSConcreteStackBlock;
  uint64_t v30 = 1107296256LL;
  uint64_t v27 = sub_10000675C((uint64_t)sub_100006034);
  id v28 = [v25 sinkWithCompletion:v26 receiveInput:v27];
  _Block_release(v27);
  _Block_release(v26);

  [v28 cancel];
}

uint64_t sub_1000063D4()
{
  swift_release(*(void *)(v0 + 24));
  return v0;
}

uint64_t sub_1000063F8()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t type metadata accessor for AppIntentBiomeMonitor()
{
  return objc_opt_self(&OBJC_CLASS____TtC14siriinferenced21AppIntentBiomeMonitor);
}

id sub_100006438(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v7 = [v3 initWithIdentifier:v6 targetQueue:a3];

  return v7;
}

unint64_t sub_100006498()
{
  unint64_t result = qword_10001DB60;
  if (!qword_10001DB60)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001DB60);
  }

  return result;
}

unint64_t sub_1000064D4()
{
  unint64_t result = qword_10001D6A8;
  if (!qword_10001D6A8)
  {
    uint64_t v1 = type metadata accessor for OS_dispatch_queue.Attributes(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_10001D6A8);
  }

  return result;
}

unint64_t sub_100006514()
{
  unint64_t result = qword_10001D6B0;
  if (!qword_10001D6B0)
  {
    uint64_t v1 = sub_100004898((uint64_t *)&unk_10001DB70);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001D6B0);
  }

  return result;
}

uint64_t sub_100006558(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006568(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100006570()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100006580()
{
  swift_release(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1000065AC(uint64_t a1)
{
}

uint64_t sub_1000065B4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000065D8()
{
}

uint64_t sub_1000065E0(void *a1)
{
  id v1 = [a1 intentClass];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

unint64_t sub_100006640()
{
  unint64_t result = qword_10001D6D8;
  if (!qword_10001D6D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100013B28, &type metadata for UnwrapError);
    atomic_store(result, (unint64_t *)&qword_10001D6D8);
  }

  return result;
}

uint64_t sub_10000667C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_100006688(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F80(&qword_10001D6D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000066D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_1000066DC(uint64_t a1)
{
  uint64_t v2 = sub_100003F80(&qword_10001D6D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

  ;
}

  ;
}

void *sub_10000675C@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 128) = a1;
  *(void *)(v2 - 120) = v1;
  return _Block_copy((const void *)(v2 - 144));
}

uint64_t sub_100006768()
{
  return swift_slowAlloc(2LL, -1LL);
}

void *sub_100006774()
{
  v0[2] = 0LL;
  v0[3] = dispatch_semaphore_create(1LL);
  v0[4] = 0xD00000000000003ELL;
  v0[5] = 0x80000001000142F0LL;
  sub_1000067B8();
  return v0;
}

void sub_1000067B8()
{
  id v2 = *(id *)(v0 + 24);
  OS_dispatch_semaphore.wait()();
  BOOL v1 = AFPreferencesAssistantEnabled() != 0;
  sub_100006A68((os_log_s *)v1);
  OS_dispatch_semaphore.signal()();
}

void sub_100006810()
{
}

void sub_10000682C()
{
}

void sub_100006848(const char *a1, uint64_t (*a2)(void), const char *a3)
{
  id v7 = *(id *)(v3 + 24);
  OS_dispatch_semaphore.wait()();
  sub_1000068B0(v3, a1, a2, a3);
  OS_dispatch_semaphore.signal()();
  sub_100008D40(v7);
}

void sub_1000068B0(uint64_t a1, const char *a2, uint64_t (*a3)(void), const char *a4)
{
  if (*(void *)(a1 + 16))
  {
    if (qword_10001D528 != -1) {
      swift_once(&qword_10001D528, sub_10000B38C);
    }
    uint64_t v6 = type metadata accessor for Logger(0LL);
    uint64_t v7 = sub_100003F28(v6, (uint64_t)qword_10001E0C0);
    uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)sub_100006768();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, a2, v10, 2u);
      sub_1000048DC((uint64_t)v10);
    }

    type metadata accessor for BackgroundQueue(0LL);
    uint64_t v11 = (void *)static BackgroundQueue.shared.getter();
    uint64_t v12 = (os_log_s *)[objc_allocWithZone((Class)a3(0)) init];
    [v11 addOperation:v12];
  }

  else
  {
    if (qword_10001D528 != -1) {
      swift_once(&qword_10001D528, sub_10000B38C);
    }
    uint64_t v14 = type metadata accessor for Logger(0LL);
    uint64_t v15 = sub_100003F28(v14, (uint64_t)qword_10001E0C0);
    uint64_t v12 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v16 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v12, v16))
    {
      uint64_t v17 = (uint8_t *)sub_100006768();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v16, a4, v17, 2u);
      sub_1000048DC((uint64_t)v17);
    }
  }
}

void sub_100006A68(os_log_s *a1)
{
  id v2 = v1;
  uint64_t v4 = (uint8_t *)(a1 & 1);
  uint64_t v5 = *v2;
  uint64_t v6 = sub_100003F80(&qword_10001D6C8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((v2[2] == 0) != (_DWORD)v4)
  {
    if ((a1 & 1) != 0)
    {
      if (qword_10001D528 != -1) {
        swift_once(&qword_10001D528, sub_10000B38C);
      }
      uint64_t v9 = sub_100008D1C();
      os_log_type_t v34 = (os_log_s *)sub_100008D24(v9, (uint64_t)qword_10001E0C0);
      os_log_type_t v10 = static os_log_type_t.debug.getter();
      if (!sub_100008DB4(v10)) {
        goto LABEL_18;
      }
      uint64_t v11 = (uint8_t *)sub_100006768();
      *(_WORD *)uint64_t v11 = 0;
      uint64_t v12 = "Siri is already on. skipping.";
    }

    else
    {
      if (qword_10001D528 != -1) {
        swift_once(&qword_10001D528, sub_10000B38C);
      }
      uint64_t v19 = sub_100008D1C();
      os_log_type_t v34 = (os_log_s *)sub_100008D24(v19, (uint64_t)qword_10001E0C0);
      os_log_type_t v20 = static os_log_type_t.debug.getter();
      if (!sub_100008DB4(v20)) {
        goto LABEL_18;
      }
      uint64_t v11 = (uint8_t *)sub_100006768();
      *(_WORD *)uint64_t v11 = 0;
      uint64_t v12 = "Siri is already off. skipping.";
    }

    sub_100008D14((void *)&_mh_execute_header, v34, (os_log_type_t)v5, v12, v11);
    sub_1000048DC((uint64_t)v11);
LABEL_18:

    return;
  }

  if ((a1 & 1) != 0)
  {
    if (qword_10001D528 != -1) {
      swift_once(&qword_10001D528, sub_10000B38C);
    }
    uint64_t v13 = sub_100008D1C();
    sub_100008D24(v13, (uint64_t)qword_10001E0C0);
    os_log_type_t v14 = sub_100004934();
    if (sub_100008D54(v14))
    {
      uint64_t v15 = (_WORD *)sub_100006768();
      sub_100008DA0(v15);
      sub_100008D14((void *)&_mh_execute_header, a1, (os_log_type_t)v8, "Siri is on. Enabling background tasks...", v4);
      sub_1000048DC((uint64_t)v4);
    }

    uint64_t v16 = type metadata accessor for BackgroundManager.Inner();
    uint64_t v17 = sub_100008DFC(v16, 32LL);
    sub_100007E20();
    uint64_t v18 = v2[2];
    v2[2] = v17;
    swift_release(v18);
    sub_100006E10();
    sub_100006FD0();
  }

  else
  {
    if (qword_10001D528 != -1) {
      swift_once(&qword_10001D528, sub_10000B38C);
    }
    uint64_t v21 = sub_100008D1C();
    uint64_t v22 = (os_log_s *)sub_100003F28(v21, (uint64_t)qword_10001E0C0);
    sub_100008D38();
    os_log_type_t v23 = sub_100004934();
    if (os_log_type_enabled(a1, v23))
    {
      id v24 = (uint8_t *)sub_100006768();
      *(_WORD *)id v24 = 0;
      sub_100008D14( (void *)&_mh_execute_header,  a1,  v23,  "Siri is off. Disabling background tasks and deleting data...",  v24);
      sub_1000048DC((uint64_t)v24);
    }

    uint64_t v25 = v2[2];
    if (v25)
    {
      uint64_t v26 = *(void *)(v25 + 24);
      if (v26)
      {
        type metadata accessor for RolloutsAnalyticsActivity(0LL);
        swift_retain(v26);
        static RolloutsAnalyticsActivity.deregister(analyticsManager:)(v26 + 16);
        swift_release(v26);
        uint64_t v25 = v2[2];
      }
    }

    v2[2] = 0LL;
    swift_release(v25);
    type metadata accessor for AppIntentBiomeMonitor();
    sub_10000607C();
    sub_100006E10();
    sub_100008DDC();
    uint64_t v27 = (void *)sub_100008DC4();
    dispatch thunk of BackgroundQueue.pause()();

    Logger.logObject.getter(v28);
    os_log_type_t v29 = sub_100004934();
    if (sub_100008D64(v29))
    {
      uint64_t v30 = (_WORD *)sub_100006768();
      sub_100008DA0(v30);
      sub_100008D14( (void *)&_mh_execute_header,  v22,  (os_log_type_t)v2,  "paused operations on the BackgroundQueue, deleting SiriRemembersDB and RunTimeDataDB",  (uint8_t *)v22);
      sub_1000048DC((uint64_t)v22);
    }

    sub_100007250();
    static SiriRemembersDB.defaultURL.getter(v31);
    sub_1000074EC((uint64_t)v8);
    uint64_t v32 = sub_100008998((uint64_t)v8);
    static RunTimeDataDB.defaultURL.getter(v32);
    sub_1000074EC((uint64_t)v8);
    sub_100008998((uint64_t)v8);
  }

uint64_t sub_100006E10()
{
  if (qword_10001D528 != -1) {
    swift_once(&qword_10001D528, sub_10000B38C);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100003F28(v0, (uint64_t)qword_10001E0C0);
  BOOL v1 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "unregistering XPC activities", v3, 2u);
    swift_slowDealloc(v3, -1LL, -1LL);
  }

  type metadata accessor for ScrubOldRecords(0LL);
  uint64_t v4 = static ScrubOldRecords.metricName.getter();
  uint64_t v5 = StaticString.description.getter(v4);
  uint64_t v7 = v6;
  static XPCActivity.unregister(name:)(v5);
  swift_bridgeObjectRelease(v7);
  type metadata accessor for ProcessUnstitchedIntents(0LL);
  uint64_t v8 = static ProcessUnstitchedIntents.metricName.getter();
  uint64_t v9 = StaticString.description.getter(v8);
  uint64_t v11 = v10;
  static XPCActivity.unregister(name:)(v9);
  swift_bridgeObjectRelease(v11);
  type metadata accessor for HolidaysDBUpdater(0LL);
  uint64_t v12 = static HolidaysDBUpdater.metricName.getter();
  uint64_t v13 = StaticString.description.getter(v12);
  uint64_t v15 = v14;
  static XPCActivity.unregister(name:)(v13);
  swift_bridgeObjectRelease(v15);
  static XPCActivity.unregister(name:)(0xD000000000000012LL);
  static XPCActivity.unregister(name:)(0xD00000000000001ALL);
  static XPCActivity.unregister(name:)(0xD00000000000001CLL);
  static XPCActivity.unregister(name:)(0xD000000000000013LL);
  type metadata accessor for ActivityHeartbeat(0LL);
  uint64_t v16 = static ActivityHeartbeat.activityName.getter();
  uint64_t v18 = v17;
  static XPCActivity.unregister(name:)(v16);
  return swift_bridgeObjectRelease(v18);
}

uint64_t sub_100006FD0()
{
  uint64_t v0 = type metadata accessor for XPCActivity.RepeatInterval(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10001D528 != -1) {
    swift_once(&qword_10001D528, sub_10000B38C);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_100003F28(v4, (uint64_t)qword_10001E0C0);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "registering XPC activities", v7, 2u);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  static XPCActivity.registerFirstBoot()();
  static XPCActivity.registerDailySignalRefresh(refreshSignalCallback:)(sub_100007C88, 0LL);
  uint64_t v8 = static XPCActivity.registerHourlySignalRefresh(hourlySignalRefresh:)(sub_100007D50, 0LL);
  static XPCActivity.registerDailyTaskSuccessEvaluation()(v8);
  type metadata accessor for ScrubOldRecords(0LL);
  uint64_t v9 = static ScrubOldRecords.metricName.getter();
  uint64_t v10 = StaticString.description.getter(v9);
  uint64_t v12 = v11;
  uint64_t v13 = enum case for XPCActivity.RepeatInterval.everyDay(_:);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v14(v3, enum case for XPCActivity.RepeatInterval.everyDay(_:), v0);
  static XPCActivity.register(name:repeatInterval:isPrivacyCritical:makeOperation:)( v10,  v12,  v3,  1LL,  sub_100007D84,  0LL);
  swift_bridgeObjectRelease(v12);
  uint64_t v15 = *(void (**)(char *, uint64_t))(v1 + 8);
  v15(v3, v0);
  type metadata accessor for ProcessUnstitchedIntents(0LL);
  uint64_t v16 = static ProcessUnstitchedIntents.metricName.getter();
  uint64_t v17 = StaticString.description.getter(v16);
  uint64_t v19 = v18;
  v14(v3, v13, v0);
  static XPCActivity.register(name:repeatInterval:isPrivacyCritical:makeOperation:)( v17,  v19,  v3,  0LL,  sub_100007D98,  0LL);
  swift_bridgeObjectRelease(v19);
  v15(v3, v0);
  type metadata accessor for HolidaysDBUpdater(0LL);
  uint64_t v20 = static HolidaysDBUpdater.metricName.getter();
  uint64_t v21 = StaticString.description.getter(v20);
  uint64_t v23 = v22;
  v14(v3, v13, v0);
  static XPCActivity.register(name:repeatInterval:isPrivacyCritical:makeOperation:)( v21,  v23,  v3,  0LL,  sub_100007DF0,  0LL);
  swift_bridgeObjectRelease(v23);
  uint64_t v24 = ((uint64_t (*)(char *, uint64_t))v15)(v3, v0);
  uint64_t v25 = static XPCActivity.registerTerminationOnIdle()(v24);
  uint64_t v26 = static ScrubInteractionStore.register()(v25);
  return static SiriRemembersBiomeEventBackfiller.register()(v26);
}

void sub_100007250()
{
  if (qword_10001D528 != -1) {
    swift_once(&qword_10001D528, sub_10000B38C);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_100003F28(v0, (uint64_t)qword_10001E0C0);
  oslog = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v2, "Succeed to delete the InteractionStore", v3, 2u);
    swift_slowDealloc(v3, -1LL, -1LL);
  }
}

void sub_1000074EC(uint64_t a1)
{
  uint64_t v2 = sub_100003F80(&qword_10001D6C8);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)v44 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (void *)((char *)v44 - v9);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)v44 - v16;
  sub_100008C8C(a1, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload(v10, v2) == 1)
  {
    uint64_t v18 = *v10;
    uint64_t v46 = *v10;
    uint64_t v19 = sub_100003F80(&qword_10001D6E0);
    swift_willThrowTypedImpl(&v46, v19, &protocol self-conformance witness table for Error);
    if (qword_10001D528 != -1) {
      swift_once(&qword_10001D528, sub_10000B38C);
    }
    uint64_t v20 = type metadata accessor for Logger(0LL);
    sub_100003F28(v20, (uint64_t)qword_10001E0C0);
    sub_100008C8C(a1, (uint64_t)v8);
    swift_errorRetain(v18);
    uint64_t v21 = swift_errorRetain(v18);
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc(22LL, -1LL);
      uint64_t v25 = swift_slowAlloc(64LL, -1LL);
      uint64_t v46 = v25;
      *(_DWORD *)uint64_t v24 = 136446466;
      sub_100008C8C((uint64_t)v8, (uint64_t)v5);
      uint64_t v26 = String.init<A>(describing:)(v5, v2);
      unint64_t v28 = v27;
      uint64_t v45 = sub_10000404C(v26, v27, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v24 + 4);
      swift_bridgeObjectRelease(v28);
      sub_100008998((uint64_t)v8);
      *(_WORD *)(v24 + 12) = 2082;
      uint64_t v45 = v18;
      swift_errorRetain(v18);
      uint64_t v29 = sub_100003F80(&qword_10001D6E0);
      uint64_t v30 = String.init<A>(describing:)(&v45, v29);
      unint64_t v32 = v31;
      uint64_t v45 = sub_10000404C(v30, v31, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v24 + 14);
      swift_bridgeObjectRelease(v32);
      swift_errorRelease(v18);
      swift_errorRelease(v18);
      _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "could not delete URL\nurl=%{public}s\nerror=%{public}s",  (uint8_t *)v24,  0x16u);
      swift_arrayDestroy(v25, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);

      swift_errorRelease(v18);
    }

    else
    {
      swift_errorRelease(v18);
      sub_100008998((uint64_t)v8);
      swift_errorRelease(v18);
      swift_errorRelease(v18);
    }
  }

  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v12 + 32))(v17, v10, v11);
    sub_1000124A4();
    if (qword_10001D528 != -1) {
      swift_once(&qword_10001D528, sub_10000B38C);
    }
    uint64_t v33 = type metadata accessor for Logger(0LL);
    sub_100003F28(v33, (uint64_t)qword_10001E0C0);
    uint64_t v34 = (*(uint64_t (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    uint64_t v35 = (os_log_s *)Logger.logObject.getter(v34);
    os_log_type_t v36 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v35, v36))
    {
      unint64_t v37 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v38 = swift_slowAlloc(32LL, -1LL);
      uint64_t v46 = v38;
      *(_DWORD *)unint64_t v37 = 136446210;
      v44[0] = v37 + 4;
      uint64_t v39 = sub_100008CD4( (unint64_t *)&unk_10001DB50,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
      uint64_t v40 = dispatch thunk of CustomStringConvertible.description.getter(v11, v39);
      unint64_t v42 = v41;
      uint64_t v45 = sub_10000404C(v40, v41, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v44[0]);
      swift_bridgeObjectRelease(v42);
      v43 = *(void (**)(char *, uint64_t))(v12 + 8);
      v43(v15, v11);
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "deleted URL %{public}s", v37, 0xCu);
      swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1LL, -1LL);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    else
    {

      v43 = *(void (**)(char *, uint64_t))(v12 + 8);
      v43(v15, v11);
    }

    v43(v17, v11);
  }

void sub_100007A20(uint64_t a1, unint64_t a2)
{
  if (*(void *)(v2 + 16))
  {
    type metadata accessor for BackgroundManager.Inner();
    sub_100007A64(a1, a2);
  }

void sub_100007A64(uint64_t a1, unint64_t a2)
{
  id v4 = [(id)objc_opt_self(_DKSystemEventStreams) appIntentsStream];
  if (!v4)
  {
    __break(1u);
    return;
  }

  uint64_t v5 = v4;
  id v6 = [v4 name];

  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  uint64_t v9 = v8;

  if (v7 == a1 && v9 == a2)
  {
    swift_bridgeObjectRelease(a2);
    goto LABEL_12;
  }

  char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v7, v9, 0LL);
  swift_bridgeObjectRelease(v9);
  if ((v11 & 1) != 0)
  {
LABEL_12:
    sub_100008054();
    return;
  }

  if (qword_10001D528 != -1) {
    swift_once(&qword_10001D528, sub_10000B38C);
  }
  uint64_t v12 = sub_100008D1C();
  uint64_t v13 = (os_log_s *)sub_100003F28(v12, (uint64_t)qword_10001E0C0);
  uint64_t v14 = swift_bridgeObjectRetain_n(a2, 2LL);
  Logger.logObject.getter(v14);
  os_log_type_t v15 = sub_100008D84();
  if (os_log_type_enabled(v13, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v17 = swift_slowAlloc(32LL, -1LL);
    uint64_t v19 = v17;
    *(_DWORD *)uint64_t v16 = 136446210;
    swift_bridgeObjectRetain(a2);
    uint64_t v18 = sub_10000404C(a1, a2, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v16 + 4);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v13,  v15,  "_DKKnowledgeStorageDidTombstoneEvents noop. stream=%{public}s",  v16,  0xCu);
    swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
    sub_1000048DC(v17);
    sub_1000048DC((uint64_t)v16);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

uint64_t sub_100007C88()
{
  uint64_t v0 = static SignalRepository.shared.getter();
  uint64_t v1 = sub_100003F80(&qword_10001D6C0);
  uint64_t v2 = type metadata accessor for SignalCachingStrategyOption(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = swift_allocObject(v1, v5 + *(void *)(v3 + 72), v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_1000136E0;
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))( v6 + v5,  enum case for SignalCachingStrategyOption.perDay(_:),  v2);
  uint64_t v7 = sub_1000089D8(v6);
  dispatch thunk of SignalRepository.prewarm(matchingCachingStrategy:userInteractive:)(v7, 0LL);
  swift_release(v0);
  return swift_bridgeObjectRelease(v7);
}

uint64_t sub_100007D50()
{
  uint64_t v0 = static SignalRepository.shared.getter();
  dispatch thunk of SignalRepository.hourlyPrewarm()();
  return swift_release(v0);
}

uint64_t sub_100007D84(uint64_t a1)
{
  return sub_100007DAC( a1,  (uint64_t)&type metadata accessor for ScrubOldRecords,  (uint64_t (*)(uint64_t))&ScrubOldRecords.init(activity:));
}

uint64_t sub_100007D98(uint64_t a1)
{
  return sub_100007DAC( a1,  (uint64_t)&type metadata accessor for ProcessUnstitchedIntents,  (uint64_t (*)(uint64_t))&ProcessUnstitchedIntents.init(activity:));
}

uint64_t sub_100007DAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = sub_100008E04();
  id v7 = objc_allocWithZone((Class)v6(v5));
  uint64_t v8 = swift_unknownObjectRetain(v3);
  return a3(v8);
}

uint64_t sub_100007DF0(uint64_t a1)
{
  return static HolidaysDBUpdater.xpcActivityOperation(activity:)(a1);
}

os_log_s *sub_100007E20()
{
  uint64_t v3 = v0;
  *((void *)v0 + 2) = 0LL;
  *((void *)v0 + 3) = 0LL;
  if (qword_10001D528 != -1) {
    swift_once(&qword_10001D528, sub_10000B38C);
  }
  uint64_t v4 = sub_100008D1C();
  uint64_t v5 = (os_log_s *)sub_100003F28(v4, (uint64_t)qword_10001E0C0);
  sub_100008D38();
  os_log_type_t v6 = sub_100008D84();
  if (sub_100008D64(v6))
  {
    id v7 = (_WORD *)sub_100006768();
    sub_100008DA0(v7);
    sub_100008D14((void *)&_mh_execute_header, v0, v1, "starting Biome monitors", v2);
    sub_1000048DC((uint64_t)v2);
  }

  sub_100008DDC();
  uint64_t v8 = (void *)sub_100008DC4();
  uint64_t v9 = type metadata accessor for SiriInferenceSuggestionsBridgeProvider(0LL);
  static SiriInferenceSuggestionsBridgeProvider.instance.getter();
  sub_100008E04();
  uint64_t v10 = type metadata accessor for AppIntentBiomeMonitor();
  sub_100008DFC(v10, 32LL);
  uint64_t v11 = sub_10000495C(v8, v9);
  uint64_t v12 = *((void *)v3 + 2);
  *((void *)v3 + 2) = v11;
  swift_release(v12);
  uint64_t v13 = type metadata accessor for SiriRolloutsMonitor();
  uint64_t v14 = (void *)sub_100008DFC(v13, 56LL);
  os_log_type_t v15 = sub_100011D8C();
  uint64_t v16 = *((void *)v3 + 3);
  *((void *)v3 + 3) = v15;
  swift_release(v16);
  uint64_t v17 = (void *)*((void *)v3 + 3);
  if (v17)
  {
    swift_retain(*((void *)v3 + 3));
    uint64_t v18 = (void *)sub_100008DAC();
    uint64_t v14 = v17;
    sub_100011E7C(v18);
    swift_release(v17);
  }

  sub_100008054();
  sub_100008DAC();
  uint64_t v19 = sub_100008E04();
  id v20 = [objc_allocWithZone((Class)type metadata accessor for FetchInteractions(v19)) init];
  [v14 addOperation:v20];

  uint64_t v21 = v5;
  Logger.logObject.getter(v22);
  os_log_type_t v23 = sub_100008D84();
  if (sub_100008D54(v23))
  {
    uint64_t v24 = (_WORD *)sub_100006768();
    sub_100008DA0(v24);
    sub_100008D14( (void *)&_mh_execute_header,  v5,  (os_log_type_t)v5,  "Adding BiomeInteractionFetcher to BackgroundQueue",  (uint8_t *)v20);
    sub_1000048DC((uint64_t)v20);
  }

  sub_100008DAC();
  uint64_t v25 = sub_100008E04();
  id v26 = [objc_allocWithZone((Class)type metadata accessor for BiomeInteractionFetcher(v25)) init];
  -[os_log_s addOperation:](v21, "addOperation:", v26);

  sub_100008184();
  unint64_t v27 = (void *)sub_100008DAC();
  dispatch thunk of BackgroundQueue.resume()();

  return v3;
}

void sub_100008054()
{
  if (qword_10001D528 != -1) {
    swift_once(&qword_10001D528, sub_10000B38C);
  }
  uint64_t v1 = sub_100008D1C();
  uint64_t v2 = (os_log_s *)sub_100008D24(v1, (uint64_t)qword_10001E0C0);
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (sub_100008D74(v3))
  {
    uint64_t v4 = (uint8_t *)sub_100006768();
    *(_WORD *)uint64_t v4 = 0;
    sub_100008D14((void *)&_mh_execute_header, v2, v0, "queuing post-tombstone privacy-related background tasks", v4);
    sub_1000048DC((uint64_t)v4);
  }

  sub_100008DDC();
  uint64_t v5 = (void *)sub_100008DC4();
  id v6 = objc_allocWithZone((Class)type metadata accessor for ScrubOldRecords(0LL));
  id v7 = sub_100008E10(v6);
  sub_100008DCC();

  uint64_t v8 = (void *)static BackgroundQueue.shared.getter();
  id v9 = objc_allocWithZone((Class)type metadata accessor for ScrubDodMLRecords(0LL));
  id v10 = sub_100008E10(v9);
  sub_100008DCC();

  uint64_t v11 = (void *)static BackgroundQueue.shared.getter();
  id v12 = objc_allocWithZone((Class)type metadata accessor for ScrubRuntimeDataRecords(0LL));
  id v13 = sub_100008E10(v12);
  [v11 addOperation:v13];

  sub_100008D40(v13);
}

void sub_100008184()
{
  uint64_t v1 = type metadata accessor for SiriSignalsFeatures(0LL);
  void v12[3] = v1;
  v12[4] = sub_100008CD4( &qword_10001DB48,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriSignalsFeatures,  (uint64_t)&protocol conformance descriptor for SiriSignalsFeatures);
  uint64_t v2 = sub_100008C50(v12);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104LL))( v2,  enum case for SiriSignalsFeatures.nowplaying_signals_homepod(_:),  v1);
  LOBYTE(v1) = isFeatureEnabled(_:)(v12);
  sub_100004270(v12);
  if ((v1 & 1) != 0)
  {
    if (qword_10001D520 != -1) {
      swift_once(&qword_10001D520, sub_10000B380);
    }
    uint64_t v3 = sub_100008D1C();
    uint64_t v4 = (os_log_s *)sub_100008D24(v3, (uint64_t)qword_10001E0A8);
    os_log_type_t v5 = static os_log_type_t.debug.getter();
    if (sub_100008D74(v5))
    {
      id v6 = (uint8_t *)sub_100006768();
      *(_WORD *)id v6 = 0;
      sub_100008D14((void *)&_mh_execute_header, v4, v0, "Starting Biome Listeners for SiriSignals", v6);
      sub_1000048DC((uint64_t)v6);
    }

    type metadata accessor for SignalRepository(0LL);
    uint64_t v7 = static SignalRepository.shared.getter();
    dispatch thunk of SignalRepository.startBiomeListeners()();
    swift_release(v7);
  }

  else
  {
    if (qword_10001D520 != -1) {
      swift_once(&qword_10001D520, sub_10000B380);
    }
    uint64_t v8 = sub_100008D1C();
    id v9 = (os_log_s *)sub_100008D24(v8, (uint64_t)qword_10001E0A8);
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (sub_100008D74(v10))
    {
      uint64_t v11 = (uint8_t *)sub_100006768();
      *(_WORD *)uint64_t v11 = 0;
      sub_100008D14((void *)&_mh_execute_header, v9, v0, "The feature flag for Biome Listeners is not enabled.", v11);
      sub_1000048DC((uint64_t)v11);
    }
  }

os_log_s *sub_100008330()
{
  uint64_t v3 = v0;
  if (qword_10001D528 != -1) {
    swift_once(&qword_10001D528, sub_10000B38C);
  }
  uint64_t v4 = sub_100008D1C();
  os_log_type_t v5 = (os_log_s *)sub_100003F28(v4, (uint64_t)qword_10001E0C0);
  sub_100008D38();
  os_log_type_t v6 = sub_100008D84();
  if (sub_100008D54(v6))
  {
    uint64_t v7 = (_WORD *)sub_100006768();
    sub_100008DA0(v7);
    sub_100008D14((void *)&_mh_execute_header, v0, v1, "BackgroundManager.Inner beginning deinit", v2);
    sub_1000048DC((uint64_t)v2);
  }

  sub_100008DDC();
  uint64_t v8 = (void *)sub_100008DC4();
  [v8 cancelAllOperations];

  id v9 = (void *)static BackgroundQueue.shared.getter();
  [v9 waitUntilAllOperationsAreFinished];

  Logger.logObject.getter(v10);
  os_log_type_t v11 = sub_100008D84();
  if (sub_100008D64(v11))
  {
    id v12 = (uint8_t *)sub_100006768();
    *(_WORD *)id v12 = 0;
    sub_100008D14((void *)&_mh_execute_header, v5, (os_log_type_t)v5, "BackgroundManager.Inner finished deinit", v12);
    sub_1000048DC((uint64_t)v12);
  }

  swift_release(*((void *)v3 + 2));
  swift_release(*((void *)v3 + 3));
  return v3;
}

uint64_t sub_100008470()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t sub_100008490()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 40));
  return v0;
}

uint64_t sub_1000084BC()
{
  return swift_deallocClassInstance(v0, 48LL, 7LL);
}

uint64_t type metadata accessor for BackgroundManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC14siriinferenced17BackgroundManager);
}

uint64_t type metadata accessor for BackgroundManager.Inner()
{
  return objc_opt_self(&OBJC_CLASS____TtCC14siriinferenced17BackgroundManager5Inner);
}

uint64_t sub_10000851C()
{
  uint64_t v1 = sub_100003F80(&qword_10001DB28);
  sub_100008D8C(v1);
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_100008560()
{
  uint64_t v1 = sub_100003F80(&qword_10001DB20);
  sub_100008D8C(v1);
  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t sub_1000085A0()
{
  return v0;
}

uint64_t sub_1000085AC()
{
  return sub_1000085A0();
}

uint64_t sub_1000085C4()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for AsyncBackgroundManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC14siriinferenced22AsyncBackgroundManager);
}

uint64_t sub_100008608()
{
  return type metadata accessor for AsyncBackgroundManager.BackgroundQueue(0LL);
}

uint64_t type metadata accessor for AsyncBackgroundManager.BackgroundQueue(uint64_t a1)
{
  return sub_1000086BC( a1,  (uint64_t *)&unk_10001D9B8,  (uint64_t)&nominal type descriptor for AsyncBackgroundManager.BackgroundQueue);
}

void sub_100008624(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 1LL, &v4, a1 + 80);
  }

uint64_t sub_1000086A0()
{
  return type metadata accessor for AsyncBackgroundManager.QueueProcessor(0LL);
}

uint64_t type metadata accessor for AsyncBackgroundManager.QueueProcessor(uint64_t a1)
{
  return sub_1000086BC( a1,  (uint64_t *)&unk_10001DA80,  (uint64_t)&nominal type descriptor for AsyncBackgroundManager.QueueProcessor);
}

uint64_t sub_1000086BC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

void sub_1000086EC(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
  }

void sub_100008774(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, ValueMetadata *))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0LL, &type metadata for AsyncBackgroundManager.BackgroundAction);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }

uint64_t initializeBufferWithCopyOfBuffer for AsyncBackgroundManager.BackgroundAction( uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for AsyncBackgroundManager.BackgroundAction(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 24));
}

uint64_t initializeWithCopy for AsyncBackgroundManager.BackgroundAction(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  __int128 v4 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 8) = v4;
  *(void *)(a1 + 24) = v3;
  swift_retain(v4);
  swift_retain(v3);
  return a1;
}

void *assignWithCopy for AsyncBackgroundManager.BackgroundAction(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v4);
  swift_release(v5);
  uint64_t v7 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v8 = a1[3];
  a1[2] = v7;
  a1[3] = v6;
  swift_retain(v6);
  swift_release(v8);
  return a1;
}

__n128 initializeWithTake for AsyncBackgroundManager.BackgroundAction(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for AsyncBackgroundManager.BackgroundAction(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  uint64_t v5 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];
  swift_release(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for AsyncBackgroundManager.BackgroundAction(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      uint64_t v2 = *a1;
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AsyncBackgroundManager.BackgroundAction( uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 32) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for AsyncBackgroundManager.BackgroundAction()
{
  return &type metadata for AsyncBackgroundManager.BackgroundAction;
}

uint64_t sub_100008998(uint64_t a1)
{
  uint64_t v2 = sub_100003F80(&qword_10001D6C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000089D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SignalCachingStrategyOption(0LL);
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v29 - v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
    uint64_t v10 = &_swiftEmptySetSingleton;
    goto LABEL_16;
  }

  sub_100003F80(&qword_10001DB30);
  uint64_t result = static _SetStorage.allocate(capacity:)(v8);
  uint64_t v10 = (void *)result;
  uint64_t v31 = *(void *)(a1 + 16);
  if (!v31)
  {
LABEL_16:
    swift_bridgeObjectRelease(a1);
    return (uint64_t)v10;
  }

  unint64_t v11 = 0LL;
  uint64_t v33 = result + 56;
  uint64_t v12 = *(unsigned __int8 *)(v34 + 80);
  uint64_t v29 = a1;
  uint64_t v30 = a1 + ((v12 + 32) & ~v12);
  while (v11 < *(void *)(a1 + 16))
  {
    uint64_t v13 = *(void *)(v34 + 72);
    uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v34 + 16);
    v14(v7, v30 + v13 * v11, v2);
    uint64_t v15 = v10[5];
    uint64_t v16 = sub_100008CD4( &qword_10001DB38,  (uint64_t (*)(uint64_t))&type metadata accessor for SignalCachingStrategyOption,  (uint64_t)&protocol conformance descriptor for SignalCachingStrategyOption);
    uint64_t v17 = dispatch thunk of Hashable._rawHashValue(seed:)(v15, v2, v16) & ~(-1LL << *((_BYTE *)v10 + 32));
    sub_100008DE4();
    if ((v20 & v19) != 0)
    {
      unint64_t v32 = v11;
      uint64_t v22 = ~v21;
      while (1)
      {
        v14(v5, v10[6] + v17 * v13, v2);
        uint64_t v23 = sub_100008CD4( &qword_10001DB40,  (uint64_t (*)(uint64_t))&type metadata accessor for SignalCachingStrategyOption,  (uint64_t)&protocol conformance descriptor for SignalCachingStrategyOption);
        char v24 = dispatch thunk of static Equatable.== infix(_:_:)(v5, v7, v2, v23);
        uint64_t v25 = *(void (**)(char *, uint64_t))(v34 + 8);
        v25(v5, v2);
        if ((v24 & 1) != 0) {
          break;
        }
        uint64_t v17 = (v17 + 1) & v22;
        sub_100008DE4();
        if ((v19 & v20) == 0)
        {
          a1 = v29;
          unint64_t v11 = v32;
          goto LABEL_10;
        }
      }

      uint64_t result = ((uint64_t (*)(char *, uint64_t))v25)(v7, v2);
      a1 = v29;
      unint64_t v11 = v32;
    }

    else
    {
LABEL_10:
      *(void *)(v33 + 8 * v18) = v20 | v19;
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v34 + 32))(v10[6] + v17 * v13, v7, v2);
      uint64_t v26 = v10[2];
      BOOL v27 = __OFADD__(v26, 1LL);
      uint64_t v28 = v26 + 1;
      if (v27) {
        goto LABEL_18;
      }
      v10[2] = v28;
    }

    if (++v11 == v31) {
      goto LABEL_16;
    }
  }

  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

void *sub_100008C50(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_100008C8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F80(&qword_10001D6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008CD4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

void sub_100008D14(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_100008D1C()
{
  return type metadata accessor for Logger(0LL);
}

uint64_t sub_100008D24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_100003F28(a1, a2);
  return Logger.logObject.getter(v2);
}

uint64_t sub_100008D38()
{
  return Logger.logObject.getter();
}

void sub_100008D40(id a1)
{
}

BOOL sub_100008D54(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

BOOL sub_100008D64(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

BOOL sub_100008D74(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100008D84()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100008D8C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

_WORD *sub_100008DA0(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_100008DAC()
{
  return static BackgroundQueue.shared.getter();
}

BOOL sub_100008DB4(os_log_type_t a1)
{
  return os_log_type_enabled(*(os_log_t *)(v1 - 72), a1);
}

uint64_t sub_100008DC4()
{
  return static BackgroundQueue.shared.getter();
}

id sub_100008DCC()
{
  return objc_msgSend(v0, *(SEL *)(v2 + 3576), v1);
}

uint64_t sub_100008DDC()
{
  return type metadata accessor for BackgroundQueue(0LL);
}

  ;
}

uint64_t sub_100008DFC(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

uint64_t sub_100008E04()
{
  return 0LL;
}

id sub_100008E10(void *a1)
{
  return [a1 *(SEL *)(v1 + 3456)];
}

void *Constants.remembersMachServiceName.unsafeMutableAddressor()
{
  return &static Constants.remembersMachServiceName;
}

void *Constants.bundleId.unsafeMutableAddressor()
{
  return &static Constants.bundleId;
}

void *Constants.signalsMachServiceName.unsafeMutableAddressor()
{
  return &static Constants.signalsMachServiceName;
}

void *Constants.subsystem.unsafeMutableAddressor()
{
  return &static Constants.subsystem;
}

unint64_t static Constants.subsystem.getter()
{
  return sub_100008F24(24LL);
}

unint64_t static Constants.bundleId.getter()
{
  return sub_100008F24(24LL);
}

unint64_t static Constants.signalsMachServiceName.getter()
{
  return sub_100008F24(32LL);
}

unint64_t static Constants.remembersMachServiceName.getter()
{
  return sub_100008F24(34LL);
}

void *Constants.coreDuetContextId.unsafeMutableAddressor()
{
  return &static Constants.coreDuetContextId;
}

unint64_t static Constants.coreDuetContextId.getter()
{
  return sub_100008F24(41LL);
}

void *Constants.suggestionsInferenceBridgeInstallPath.unsafeMutableAddressor()
{
  return &static Constants.suggestionsInferenceBridgeInstallPath;
}

unint64_t static Constants.suggestionsInferenceBridgeInstallPath.getter()
{
  return sub_100008F24(90LL);
}

void *Constants.siriTasksEvaluationPluginId.unsafeMutableAddressor()
{
  return &static Constants.siriTasksEvaluationPluginId;
}

unint64_t static Constants.siriTasksEvaluationPluginId.getter()
{
  return sub_100008F24(55LL);
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

unint64_t sub_100008F24(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000LL;
}

uint64_t sub_100008F2C()
{
  uint64_t v0 = (char *)String.utf8CString.getter();
  int v1 = _set_user_dir_suffix(v0 + 32);
  swift_release(v0);
  if (!v1)
  {
    if (qword_10001D530 != -1) {
      swift_once(&qword_10001D530, sub_10000B404);
    }
    uint64_t v16 = sub_100008D1C();
    sub_100008D24(v16, (uint64_t)qword_10001E0D8);
    os_log_type_t v17 = sub_10000A370();
    if (sub_100008D74(v17))
    {
      *(_WORD *)sub_100006768() = 0;
      sub_10000A324((void *)&_mh_execute_header, v18, v19, "Sandbox: _set_user_dir_suffix returned nil");
      sub_10000A338();
    }

    char v15 = 3;
LABEL_22:
    static Exit.exit(_:)(v15);
  }

  uint64_t v2 = NSTemporaryDirectory();
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v5 = v4;

  swift_bridgeObjectRelease(v5);
  uint64_t v6 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000LL) == 0) {
    uint64_t v6 = v3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
    if (qword_10001D530 != -1) {
      swift_once(&qword_10001D530, sub_10000B404);
    }
    uint64_t v20 = sub_100008D1C();
    sub_100008D24(v20, (uint64_t)qword_10001E0D8);
    os_log_type_t v21 = sub_10000A370();
    if (sub_100008D74(v21))
    {
      *(_WORD *)sub_100006768() = 0;
      sub_10000A324((void *)&_mh_execute_header, v22, v23, "Unable to create temp directory");
      sub_10000A338();
    }

    char v15 = 4;
    goto LABEL_22;
  }

  sub_100009D90();
  if (!v7
    || (uint64_t v2 = v7, sub_1000125C4(), v9 = v8, swift_bridgeObjectRelease(v2), result = swift_bridgeObjectRelease(v9), !v9))
  {
    if (qword_10001D530 != -1) {
      swift_once(&qword_10001D530, sub_10000B404);
    }
    uint64_t v11 = sub_100008D1C();
    sub_100008D24(v11, (uint64_t)qword_10001E0D8);
    os_log_type_t v12 = sub_10000A370();
    if (sub_100008D74(v12))
    {
      *(_WORD *)sub_100006768() = 0;
      sub_10000A324((void *)&_mh_execute_header, v13, v14, "Sandbox: confstr(_CS_DARWIN_USER_TEMP_DIR) failed");
      sub_10000A338();
    }

    char v15 = 1;
    goto LABEL_22;
  }

  return result;
}

void sub_100009128()
{
  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  uint64_t v1 = sub_100008D1C();
  uint64_t v2 = (os_log_s *)sub_100008D24(v1, (uint64_t)qword_10001E0D8);
  os_log_type_t v3 = static os_log_type_t.info.getter();
  unint64_t v4 = (const void *)v3;
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v0 = (uint8_t *)sub_100006768();
    *(_WORD *)uint64_t v0 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, (os_log_type_t)v4, "registering XPC notification handlers", v0, 2u);
    swift_slowDealloc(v0, -1LL, -1LL);
  }

  if (qword_10001D510 != -1) {
    swift_once(&qword_10001D510, sub_100009314);
  }
  sub_10000A348((uint64_t)&unk_100018FA8, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v7, v10);
  sub_10000A354();
  swift_release(v0);
  sub_10000A364("com.apple.notifyd.matching");
  _Block_release(v4);
  sub_10000A348((uint64_t)&unk_100018FD0, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v8, v11);
  sub_10000A354();
  swift_release(v0);
  sub_10000A364("com.apple.distnoted.matching");
  _Block_release(v4);
  unint64_t v5 = (dispatch_queue_s *)qword_10001E098;
  uint64_t v6 = sub_10000A348((uint64_t)&unk_100018FF8, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v9, v12);
  xpc_set_event_stream_handler("com.apple.xpc.activity", v5, v6);
  _Block_release(v6);
}

uint64_t sub_100009314()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  sub_10000673C();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v5);
  sub_10000673C();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v9);
  sub_10000673C();
  uint64_t v12 = v11 - v10;
  sub_100006498();
  static DispatchQoS.userInitiated.getter();
  os_log_type_t v17 = &_swiftEmptyArrayStorage;
  unint64_t v13 = sub_1000064D4();
  uint64_t v14 = sub_100003F80((uint64_t *)&unk_10001DB70);
  unint64_t v15 = sub_100006514();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v17, v14, v15, v5, v13);
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))( v4,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v0);
  uint64_t result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000018LL,  0x8000000100013BB0LL,  v12,  v8,  v4,  0LL);
  qword_10001E098 = result;
  return result;
}

void sub_10000948C(void *a1)
{
  string = xpc_dictionary_get_string(a1, _xpc_event_key_name);
  if (!string) {
    return;
  }
  uint64_t v2 = String.init(cString:)(string);
  unint64_t v4 = v3;
  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  uint64_t v5 = type metadata accessor for Logger(0LL);
  sub_100003F28(v5, (uint64_t)qword_10001E0D8);
  uint64_t v6 = swift_bridgeObjectRetain_n(v4, 2LL);
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v10 = swift_slowAlloc(32LL, -1LL);
    uint64_t v23 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    swift_bridgeObjectRetain(v4);
    uint64_t v22 = sub_10000404C(v2, v4, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v9 + 4);
    swift_bridgeObjectRelease_n(v4, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "received XPC event from notifyd: %{public}s", v9, 0xCu);
    swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v4, 2LL);
  }

  if (!kAFPreferencesDidChangeDarwinNotification)
  {
    __break(1u);
    return;
  }

  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (v2 == v11 && v4 == v12)
  {
    swift_bridgeObjectRelease(v4);
    goto LABEL_19;
  }

  uint64_t v14 = v12;
  char v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v2, v4, v11, v12, 0LL);
  swift_bridgeObjectRelease(v14);
  if ((v15 & 1) != 0)
  {
LABEL_19:
    swift_bridgeObjectRelease(v4);
    sub_1000067B8();
    return;
  }

  if (v2 == 0xD000000000000029LL)
  {
    unint64_t v16 = 0x8000000100014350LL;
    if (v4 == 0x8000000100014350LL) {
      goto LABEL_17;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(v2, v4, 0xD000000000000029LL, 0x8000000100014350LL, 0LL) & 1) != 0)
  {
    unint64_t v16 = v4;
LABEL_17:
    swift_bridgeObjectRelease(v16);
    sub_100006810();
    return;
  }

  if (v2 == 0xD000000000000022LL && v4 == 0x8000000100013FE0LL)
  {
    swift_bridgeObjectRelease(0x8000000100013FE0LL);
LABEL_25:
    sub_10000682C();
    return;
  }

  char v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v2, v4, 0xD000000000000022LL, 0x8000000100013FE0LL, 0LL);
  uint64_t v18 = swift_bridgeObjectRelease(v4);
  if ((v17 & 1) != 0) {
    goto LABEL_25;
  }
  uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    os_log_type_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)os_log_type_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "XPC event is unhandled", v21, 2u);
    swift_slowDealloc(v21, -1LL, -1LL);
  }
}

void sub_1000097E4(void *a1)
{
  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100003F28(v2, (uint64_t)qword_10001E0D8);
  uint64_t v3 = swift_unknownObjectRetain_n(a1, 2LL);
  unint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v30 = (uint64_t)a1;
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    uint64_t v31 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_unknownObjectRetain(a1);
    uint64_t v8 = sub_100003F80((uint64_t *)&unk_10001DBE0);
    uint64_t v9 = String.init<A>(describing:)(&v30, v8);
    unint64_t v11 = v10;
    uint64_t v30 = sub_10000404C(v9, v10, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v6 + 4);
    swift_unknownObjectRelease_n(a1, 2LL);
    swift_bridgeObjectRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "received XPC event from distnoted: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  else
  {

    swift_unknownObjectRelease_n(a1, 2LL);
  }

  string = xpc_dictionary_get_string(a1, _xpc_event_key_name);
  if (string)
  {
    unint64_t v13 = string;
    uint64_t v14 = xpc_dictionary_get_string(a1, "Object");
    uint64_t v15 = String.init(cString:)(v13);
    uint64_t v17 = v16;
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(_DKKnowledgeStorageDidTombstoneEventsNotification);
    if (v15 == v18 && v17 == v19)
    {
      swift_bridgeObjectRelease_n(v17, 2LL);
    }

    else
    {
      uint64_t v21 = v19;
      char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, v18, v19, 0LL);
      swift_bridgeObjectRelease(v21);
      uint64_t v23 = swift_bridgeObjectRelease(v17);
      if ((v22 & 1) == 0)
      {
        char v24 = (os_log_s *)Logger.logObject.getter(v23);
        os_log_type_t v25 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v26 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "distnoted XPC event is unhandled", v26, 2u);
          swift_slowDealloc(v26, -1LL, -1LL);
        }

        return;
      }
    }

    if (v14)
    {
      uint64_t v27 = String.init(cString:)(v14);
      unint64_t v29 = v28;
    }

    else
    {
      uint64_t v27 = 0LL;
      unint64_t v29 = 0xE000000000000000LL;
    }

    sub_100007A20(v27, v29);
    swift_bridgeObjectRelease(v29);
  }

void sub_100009AE8(void *a1)
{
  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100003F28(v2, (uint64_t)qword_10001E0D8);
  uint64_t v3 = swift_unknownObjectRetain_n(a1, 2LL);
  unint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    uint64_t v20 = (uint64_t)a1;
    uint64_t v21 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_unknownObjectRetain(a1);
    uint64_t v8 = sub_100003F80((uint64_t *)&unk_10001DBE0);
    uint64_t v9 = String.init<A>(describing:)(&v20, v8);
    unint64_t v11 = v10;
    uint64_t v20 = sub_10000404C(v9, v10, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v6 + 4);
    swift_unknownObjectRelease_n(a1, 2LL);
    swift_bridgeObjectRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "received XPC event from XPC activity: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  else
  {

    swift_unknownObjectRelease_n(a1, 2LL);
  }

  string = xpc_dictionary_get_string(a1, _xpc_event_key_name);
  if (!string) {
    goto LABEL_11;
  }
  uint64_t v13 = String.init(cString:)(string);
  uint64_t v15 = v14;
  if (v13 == 0xD000000000000022LL && v14 == 0x80000001000144A0LL)
  {
    swift_bridgeObjectRelease(0x80000001000144A0LL);
    return;
  }

  char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
  string = (const char *)swift_bridgeObjectRelease(v15);
  if ((v16 & 1) == 0)
  {
LABEL_11:
    uint64_t v17 = (os_log_s *)Logger.logObject.getter(string);
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "xpc activity is unhandled", v19, 2u);
      swift_slowDealloc(v19, -1LL, -1LL);
    }
  }

uint64_t sub_100009D90()
{
  uint64_t v0 = type metadata accessor for __DataStorage(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  uint64_t v1 = __DataStorage.init(length:)(1024LL);
  if ((swift_isUniquelyReferenced_nonNull_native(v1) & 1) == 0)
  {
    uint64_t v2 = __DataStorage._bytes.getter();
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t result = __DataStorage._offset.getter();
      if (__OFSUB__(0LL, result))
      {
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }

      uint64_t v5 = v3 - result;
    }

    else
    {
      uint64_t v5 = 0LL;
    }

    swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
    uint64_t v6 = __DataStorage.init(bytes:length:copy:deallocator:offset:)(v5, 1024LL, 1LL, 0LL, 0LL, 0LL);
    swift_release(v1);
    uint64_t v1 = v6;
  }

  uint64_t result = __DataStorage._bytes.getter();
  if (!result)
  {
LABEL_15:
    __break(1u);
    return result;
  }

  uint64_t v7 = result;
  uint64_t result = __DataStorage._offset.getter();
  uint64_t v8 = -result;
  if (__OFSUB__(0LL, result))
  {
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v9 = __DataStorage._length.getter();
  if (v9 >= 1024) {
    size_t v10 = 1024LL;
  }
  else {
    size_t v10 = v9;
  }
  bzero((void *)(v7 + v8), v10);
  uint64_t v13 = 0x40000000000LL;
  unint64_t v14 = v1 | 0x4000000000000000LL;
  sub_100009F68((uint64_t)&v13);
  uint64_t v12 = v11;
  sub_10000A1F8(v13, v14);
  return v12;
}

uint64_t sub_100009EE0@<X0>(char *a1@<X0>, int a2@<W2>, void *a3@<X8>)
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

void sub_100009F40(void *a1)
{
}

uint64_t sub_100009F48(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100009F58(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_100009F60(void *a1)
{
}

void sub_100009F68(uint64_t a1)
{
  __asm { BR              X11 }

uint64_t sub_100009FC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v6 = v3;
  LOWORD(v7) = a1;
  BYTE2(v7) = BYTE2(a1);
  HIBYTE(v7) = BYTE3(a1);
  unsigned __int8 v8 = BYTE4(a1);
  unsigned __int8 v9 = BYTE5(a1);
  unsigned __int8 v10 = BYTE6(a1);
  uint64_t result = sub_10000A2E4((char *)&v6, BYTE6(a1), v2);
  unint64_t v5 = v7 | ((unint64_t)v8 << 32) | ((unint64_t)v9 << 40) | ((unint64_t)v10 << 48);
  void *v1 = v6;
  v1[1] = v5;
  return result;
}

uint64_t sub_10000A1F8(uint64_t result, unint64_t a2)
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

uint64_t sub_10000A23C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
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
  uint64_t result = sub_100009EE0((char *)(v9 + v10), a4, &v11);
  if (!v4) {
    return v11;
  }
  return result;
}

uint64_t sub_10000A2E4(char *a1, uint64_t a2, int a3)
{
  uint64_t result = sub_100009EE0(a1, a3, &v5);
  if (!v3) {
    return v5;
  }
  return result;
}

void sub_10000A324(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_10000A338()
{
  return swift_slowDealloc(v0, -1LL, -1LL);
}

void *sub_10000A348@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  a4 = v5;
  a5 = a1;
  return _Block_copy(&a2);
}

uint64_t sub_10000A354()
{
  return swift_retain(v0);
}

void sub_10000A364(const char *a1)
{
}

uint64_t sub_10000A370()
{
  return static os_log_type_t.error.getter();
}

void static Exit.exit(_:)(char a1)
{
  LOBYTE(v1) = a1;
  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_100003F28(v2, (uint64_t)qword_10001E0D8);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v6 = 67109120;
    int v1 = v1;
    int v7 = v1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v7, &v8, v6 + 4);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Exiting with reason: %d", v6, 8u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  else
  {

    int v1 = v1;
  }

  _exit(v1);
}

siriinferenced::ExitReason_optional __swiftcall ExitReason.init(rawValue:)(Swift::Int32 rawValue)
{
  return (siriinferenced::ExitReason_optional)rawValue;
}

uint64_t ExitReason.rawValue.getter(uint64_t result)
{
  return result;
}

BOOL sub_10000A498(char *a1, char *a2)
{
  return sub_10000A4AC(*a1, *a2);
}

uint64_t sub_10000A4A4()
{
  return 1LL;
}

BOOL sub_10000A4AC(char a1, char a2)
{
  return a1 == a2;
}

Swift::Int sub_10000A4BC()
{
  return sub_10000A4C4(*v0);
}

Swift::Int sub_10000A4C4(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

void sub_10000A508()
{
  uint64_t v0 = Hasher.init(_seed:)(v1, 0LL);
  sub_10000A80C((uint64_t)v0);
  Hasher._finalize()();
  sub_10000A830();
}

void sub_10000A538(uint64_t a1)
{
}

uint64_t sub_10000A540(uint64_t a1)
{
  return String.hash(into:)(a1, 0x6570706172776E75LL, 0xEC0000006C694E64LL);
}

void sub_10000A560(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_10000A584(uint64_t a1)
{
  return sub_10000A58C(a1, *v1);
}

Swift::Int sub_10000A58C(uint64_t a1, unsigned __int8 a2)
{
  return Hasher._finalize()();
}

void sub_10000A5CC(uint64_t a1)
{
  int v1 = Hasher.init(_seed:)(v2, a1);
  sub_10000A80C((uint64_t)v1);
  Hasher._finalize()();
  sub_10000A830();
}

siriinferenced::ExitReason_optional sub_10000A5F8@<W0>( Swift::Int32 *a1@<X0>, siriinferenced::ExitReason_optional *a2@<X8>)
{
  result.value = ExitReason.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_10000A620@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = ExitReason.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_10000A64C()
{
  unint64_t result = qword_10001DBF0;
  if (!qword_10001DBF0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for ExitReason, &type metadata for ExitReason);
    atomic_store(result, (unint64_t *)&qword_10001DBF0);
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for ExitReason(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ExitReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 4) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ExitReason(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_10000A76C + 4 * byte_10001389D[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10000A7A0 + 4 * byte_100013898[v4]))();
}

uint64_t sub_10000A7A0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A7A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000A7B0LL);
  }
  return result;
}

uint64_t sub_10000A7BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000A7C4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 4;
  return result;
}

uint64_t sub_10000A7C8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A7D0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A7DC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000A7E4(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ExitReason()
{
  return &type metadata for ExitReason;
}

ValueMetadata *type metadata accessor for Exit()
{
  return &type metadata for Exit;
}

uint64_t sub_10000A80C(uint64_t a1, ...)
{
  return String.hash(into:)(va, 0x6570706172776E75LL, 0xEC0000006C694E64LL);
}

  ;
}

void sub_10000A83C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for Signpost(0LL);
  uint64_t v11 = a5 + *(int *)(v10 + 20);
  *(void *)uint64_t v11 = a1;
  *(void *)(v11 + 8) = a2;
  *(_BYTE *)(v11 + 16) = a3;
  id v12 = a4;
  OSSignpostID.init(log:)();
  *(void *)(a5 + *(int *)(v10 + 24)) = v12;
  id v20 = v12;
  uint64_t v13 = static os_signpost_type_t.begin.getter();
  uint64_t v14 = sub_100003F80(&qword_10001D540);
  uint64_t v15 = swift_allocObject(v14, 72LL, 7LL);
  *(_OWORD *)(v15 + 16) = xmmword_1000136E0;
  uint64_t v16 = StaticString.description.getter(a1);
  uint64_t v18 = v17;
  *(void *)(v15 + 56) = &type metadata for String;
  *(void *)(v15 + 64) = sub_100003FC0();
  *(void *)(v15 + 32) = v16;
  *(void *)(v15 + 40) = v18;
  char v19 = 2;
  os_signpost(_:dso:log:name:signpostID:_:_:)( v13,  &_mh_execute_header,  v20,  a1,  a2,  a3,  a5,  "%@ enableTelemetry=YES",  22LL,  v19,  v15);
  swift_bridgeObjectRelease(v15);
}

void sub_10000A970()
{
  qword_10001E0A0 = OS_os_log.init(subsystem:category:)( 0xD000000000000018LL,  0x8000000100014330LL,  0x65666E4969726953LL,  0xED000065636E6572LL);
  sub_10000B474();
}

uint64_t Logger.asyncBackground(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  uint64_t v37 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v40 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  sub_10000673C();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v38 = *(void *)(v5 - 8);
  uint64_t v39 = v5;
  __chkstk_darwin(v5);
  sub_10000673C();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_100008D1C();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  id v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_10000673C();
  uint64_t v17 = v16 - v15;
  sub_100003FFC(0LL, (unint64_t *)&qword_10001DB60, &OBJC_CLASS___OS_dispatch_queue_ptr);
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))( v17,  enum case for DispatchQoS.QoSClass.utility(_:),  v13);
  uint64_t v33 = static OS_dispatch_queue.global(qos:)(v17);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v17, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v34, v9);
  uint64_t v18 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v19 = (v18 + 16) & ~v18;
  unint64_t v20 = (v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v21 = swift_allocObject(&unk_100019138, v20 + 16, v18 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v21 + v19, v12, v9);
  char v22 = (void *)(v21 + v20);
  uint64_t v23 = v36;
  *char v22 = v35;
  v22[1] = v23;
  aBlock[4] = sub_10000AE90;
  uint64_t v43 = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100003E80;
  aBlock[3] = &unk_100019150;
  char v24 = _Block_copy(aBlock);
  uint64_t v25 = swift_retain(v23);
  static DispatchQoS.unspecified.getter(v25);
  unint64_t v41 = &_swiftEmptyArrayStorage;
  unint64_t v26 = sub_100004814();
  uint64_t v27 = sub_100003F80(&qword_10001D570);
  unint64_t v28 = sub_100004854();
  uint64_t v29 = v37;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v41, v27, v28, v37, v26);
  uint64_t v30 = (void *)v33;
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v8, v4, v24);
  _Block_release(v24);

  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v4, v29);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v8, v39);
  return swift_release(v43);
}

void sub_10000AC9C(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v5 = swift_retain_n(a3, 2LL);
  oslog = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v8 = swift_slowAlloc(32LL, -1LL);
    uint64_t v14 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v9 = a2();
    unint64_t v11 = v10;
    uint64_t v13 = sub_10000404C(v9, v10, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v7 + 4);
    swift_release_n(a3, 2LL);
    swift_bridgeObjectRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, oslog, v6, "%s", v7, 0xCu);
    swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {
    swift_release_n(a3, 2LL);
  }

uint64_t sub_10000AE1C()
{
  uint64_t v1 = sub_100008D1C();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

void sub_10000AE90()
{
  uint64_t v1 = *(void *)(sub_100008D1C() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  sub_10000AC9C(v0 + v2, *(uint64_t (**)(void))v3, *(void *)(v3 + 8));
}

uint64_t sub_10000AED0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000AEE0(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t *sub_10000AEE8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v14);
  }

  else
  {
    uint64_t v7 = type metadata accessor for OSSignpostID(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    unint64_t v10 = (char *)a1 + v8;
    unint64_t v11 = (char *)a2 + v8;
    *(_OWORD *)unint64_t v10 = *(_OWORD *)v11;
    v10[16] = v11[16];
    id v12 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v12;
    id v13 = v12;
  }

  return a1;
}

void sub_10000AF8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OSSignpostID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
}

uint64_t sub_10000AFD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OSSignpostID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  unint64_t v11 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v11;
  id v12 = v11;
  return a1;
}

uint64_t sub_10000B048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OSSignpostID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  uint64_t v10 = *(int *)(a3 + 24);
  unint64_t v11 = *(void **)(a2 + v10);
  id v12 = *(void **)(a1 + v10);
  *(void *)(a1 + v10) = v11;
  id v13 = v11;

  return a1;
}

uint64_t sub_10000B0D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OSSignpostID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  return a1;
}

uint64_t sub_10000B148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OSSignpostID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  unint64_t v11 = *(void **)(a1 + v8);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);

  return a1;
}

uint64_t sub_10000B1C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B1D0);
}

uint64_t sub_10000B1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OSSignpostID(0LL);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2) {
    return sub_1000066D0(a1, a2, v6);
  }
  unint64_t v8 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v8 >= 0xFFFFFFFF) {
    LODWORD(v8) = -1;
  }
  return (v8 + 1);
}

uint64_t sub_10000B248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B254);
}

uint64_t sub_10000B254(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for OSSignpostID(0LL);
  if (*(_DWORD *)(*(void *)(result - 8) + 84LL) == a3) {
    return sub_10000667C(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for Signpost(uint64_t a1)
{
  uint64_t result = qword_10001DC50;
  if (!qword_10001DC50) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for Signpost);
  }
  return result;
}

uint64_t sub_10000B300(uint64_t a1)
{
  uint64_t result = type metadata accessor for OSSignpostID(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_100013968;
    void v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

void sub_10000B380(uint64_t a1)
{
}

void sub_10000B38C()
{
  uint64_t v0 = sub_100008D1C();
  sub_100003F40(v0, qword_10001E0C0);
  sub_100003F28(v0, (uint64_t)qword_10001E0C0);
  if (qword_10001D518 != -1) {
    swift_once(&qword_10001D518, sub_10000A970);
  }
  Logger.init(_:)((id)qword_10001E0A0);
  sub_10000B474();
}

void sub_10000B404(uint64_t a1)
{
}

void sub_10000B410(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008D1C();
  sub_100003F40(v3, a2);
  sub_100003F28(v3, (uint64_t)a2);
  Logger.init(subsystem:category:)(0xD000000000000018LL, 0x8000000100014330LL, 0x6E6F6D656144LL, 0xE600000000000000LL);
  sub_10000B474();
}

  ;
}

void sub_10000B47C(void *a1)
{
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_10000EBF0();
  uint64_t v6 = v4 - v5;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v104 - v9;
  __chkstk_darwin(v8);
  id v12 = (char *)&v104 - v11;
  sub_100003F80(&qword_10001DDC8);
  sub_10000EB98();
  __chkstk_darwin(v13);
  sub_10000EBF0();
  uint64_t v16 = v14 - v15;
  __chkstk_darwin(v17);
  sub_10000ED24();
  uint64_t v123 = v18;
  uint64_t v19 = type metadata accessor for Logger(0LL);
  uint64_t v109 = *(void *)(v19 - 8);
  uint64_t v110 = v19;
  sub_10000EB98();
  __chkstk_darwin(v20);
  sub_10000EC00();
  uint64_t v121 = v21;
  unint64_t v22 = sub_10000EA60();
  Logger.init(subsystem:category:)(v22, v23, v24, v25);
  id v26 = [a1 matchingRecordSet];
  id v111 = a1;
  id v27 = [a1 recipe];
  id v28 = [v27 recipeUserInfo];

  uint64_t v108 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v28,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  uint64_t v29 = v16;
  sub_10000E98C( &qword_10001DDD0,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v31 = v30;
  id v112 = (id)Dictionary.init(dictionaryLiteral:)(&_swiftEmptyArrayStorage, v2, &type metadata for Data, v30);
  id v122 = v26;
  uint64_t v32 = v26;
  uint64_t v33 = (uint64_t)v12;
  id v34 = [v32 nativeRecordInfo];
  uint64_t v35 = sub_100003F80(&qword_10001DD28);
  uint64_t v36 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v34, v2, v35, v31);

  int64_t v38 = 0LL;
  uint64_t v120 = 0LL;
  uint64_t v39 = *(void *)(v36 + 64);
  uint64_t v113 = v36 + 64;
  uint64_t v117 = v36;
  uint64_t v40 = 1LL << *(_BYTE *)(v36 + 32);
  uint64_t v41 = -1LL;
  if (v40 < 64) {
    uint64_t v41 = ~(-1LL << v40);
  }
  unint64_t v42 = v41 & v39;
  int64_t v114 = (unint64_t)(v40 + 63) >> 6;
  int64_t v105 = v114 - 1;
  v37.n128_u64[0] = 136315138LL;
  __n128 v115 = v37;
  uint64_t v118 = v29;
  v119 = v10;
  uint64_t v116 = v3;
LABEL_4:
  uint64_t v43 = v123;
  if (v42)
  {
LABEL_5:
    uint64_t v124 = (v42 - 1) & v42;
    int64_t v125 = v38;
    unint64_t v44 = __clz(__rbit64(v42)) | (v38 << 6);
LABEL_6:
    uint64_t v45 = v117;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v3 + 16))( v29,  *(void *)(v117 + 48) + *(void *)(v3 + 72) * v44,  v2);
    uint64_t v46 = *(void *)(v45 + 56);
    uint64_t v47 = sub_10000ED74();
    uint64_t v48 = *(void *)(v46 + 8 * v44);
    *(void *)(v29 + *(int *)(v47 + 48)) = v48;
    sub_10000667C(v29, 0LL, 1LL, v47);
    swift_bridgeObjectRetain(v48);
    goto LABEL_13;
  }

  while (1)
  {
    int64_t v49 = v38 + 1;
    if (__OFADD__(v38, 1LL))
    {
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
    }

    if (v49 >= v114)
    {
      int64_t v125 = v38;
    }

    else
    {
      if (*(void *)(v113 + 8 * v49)) {
        goto LABEL_10;
      }
      if (v38 + 2 >= v114) {
        goto LABEL_35;
      }
      if (*(void *)(v113 + 8 * (v38 + 2))) {
        goto LABEL_10;
      }
      if (v38 + 3 >= v114)
      {
        int64_t v125 = v38 + 2;
      }

      else
      {
        if (*(void *)(v113 + 8 * (v38 + 3))) {
          goto LABEL_10;
        }
        uint64_t v71 = v38 + 4;
        if (v38 + 4 < v114)
        {
          if (*(void *)(v113 + 8 * v71))
          {
LABEL_10:
            sub_10000EB2C();
            uint64_t v124 = v51;
            int64_t v125 = v50;
            unint64_t v44 = v52 + (v50 << 6);
            goto LABEL_6;
          }

          while (1)
          {
            int64_t v72 = v71 + 1;
            if (__OFADD__(v71, 1LL)) {
              goto LABEL_52;
            }
            if (v72 >= v114) {
              break;
            }
            ++v71;
            if (*(void *)(v113 + 8 * v72)) {
              goto LABEL_10;
            }
          }

          int64_t v49 = v105;
LABEL_35:
          int64_t v125 = v49;
          goto LABEL_12;
        }

        int64_t v125 = v38 + 3;
      }
    }

LABEL_12:
    uint64_t v53 = sub_10000ED74();
    sub_10000667C(v29, 1LL, 1LL, v53);
    uint64_t v124 = 0LL;
LABEL_13:
    sub_10000E94C(v29, v43, &qword_10001DDC8);
    uint64_t v54 = sub_10000ED74();
    swift_bridgeObjectRelease(*(void *)(v43 + *(int *)(v54 + 48)));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v33, v43, v2);
    uint64_t v55 = *(void (**)(unint64_t, char *, uint64_t))(v3 + 16);
    sub_10000ECF8((uint64_t)v10);
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    id v126 = 0LL;
    id v57 = [v122 nativeRecordDataForRecordUUID:isa error:&v126];

    id v58 = v126;
    if (v57)
    {
      uint64_t v106 = v33;
      uint64_t v107 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v57);
      uint64_t v74 = v73;

      id v75 = v112;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v112);
      uint64_t v77 = (uint64_t)v10;
      Swift::Bool v78 = isUniquelyReferenced_nonNull_native;
      id v126 = v75;
      sub_10000E4EC(v77);
      sub_10000EC18();
      Swift::Int v83 = v81 + v82;
      if (__OFADD__(v81, v82)) {
        goto LABEL_50;
      }
      unint64_t v84 = v79;
      char v85 = v80;
      sub_100003F80(&qword_10001DDE0);
      Swift::Bool v86 = _NativeDictionary.ensureUnique(isUnique:capacity:)(v78, v83);
      uint64_t v10 = v119;
      if (v86)
      {
        unint64_t v87 = sub_10000E4EC((uint64_t)v119);
        if ((v85 & 1) != (v88 & 1))
        {
          KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v2);
          __break(1u);
          return;
        }

        unint64_t v84 = v87;
      }

      uint64_t v89 = v74;
      v90 = v126;
      id v112 = v126;
      if ((v85 & 1) != 0)
      {
        uint64_t v91 = *((void *)v126 + 7) + 16 * v84;
        sub_10000A1F8(*(void *)v91, *(void *)(v91 + 8));
        *(void *)uint64_t v91 = v107;
        *(void *)(v91 + 8) = v89;
      }

      else
      {
        *((void *)v126 + (v84 >> 6) + 8) |= 1LL << v84;
        v55(v90[6] + *(void *)(v3 + 72) * v84, v10, v2);
        v92 = (uint64_t *)(v90[7] + 16 * v84);
        uint64_t *v92 = v107;
        v92[1] = v89;
        uint64_t v93 = v90[2];
        BOOL v94 = __OFADD__(v93, 1LL);
        uint64_t v95 = v93 + 1;
        if (v94) {
          goto LABEL_51;
        }
        v90[2] = v95;
      }

      swift_bridgeObjectRelease(0x8000000000000000LL);
      sub_10000EB14((uint64_t)v10);
      uint64_t v33 = v106;
      sub_10000EB14(v106);
      uint64_t v29 = v118;
      unint64_t v42 = v124;
      int64_t v38 = v125;
      goto LABEL_4;
    }

    unint64_t v59 = v58;
    sub_10000EB14((uint64_t)v10);
    uint64_t v60 = _convertNSErrorToError(_:)(v59);

    swift_willThrow();
    uint64_t v61 = sub_10000ECF8(v6);
    unint64_t v62 = (os_log_s *)Logger.logObject.getter(v61);
    os_log_type_t v63 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = swift_slowAlloc(12LL, -1LL);
      id v65 = (void *)swift_slowAlloc(32LL, -1LL);
      id v126 = v65;
      __n128 v66 = v115;
      *(_DWORD *)uint64_t v64 = v115.n128_u32[0];
      uint64_t v67 = UUID.uuidString.getter(v66);
      unint64_t v69 = v68;
      *(void *)(v64 + 4) = sub_10000404C(v67, v68, (uint64_t *)&v126);
      swift_bridgeObjectRelease(v69);
      sub_10000EB14(v6);
      _os_log_impl( (void *)&_mh_execute_header,  v62,  v63,  "failure retrieving native record data for %s; skipping from collection",
        (uint8_t *)v64,
        0xCu);
      swift_arrayDestroy(v65, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v70 = (uint64_t)v65;
      uint64_t v3 = v116;
      sub_1000048DC(v70);
      sub_1000048DC(v64);
    }

    else
    {
      sub_10000EB14(v6);
    }

    swift_errorRelease(v60);

    sub_10000EB14(v33);
    uint64_t v120 = 0LL;
    uint64_t v29 = v118;
    uint64_t v10 = v119;
    uint64_t v43 = v123;
    unint64_t v42 = v124;
    int64_t v38 = v125;
    if (v124) {
      goto LABEL_5;
    }
  }

  swift_release(v117);
  uint64_t v96 = v108;
  id v97 = v112;
  uint64_t v98 = v120;
  uint64_t v99 = sub_10000BD64(v108, (uint64_t)v112);
  if (v98)
  {
    swift_bridgeObjectRelease(v97);
    swift_bridgeObjectRelease(v96);
    Class v100 = (Class)_convertErrorToNSError(_:)(v98);
    [v111 completeWithError:v100 completionHandler:0];

    swift_errorRelease(v98);
  }

  else
  {
    uint64_t v101 = v99;
    swift_bridgeObjectRelease(v97);
    swift_bridgeObjectRelease(v96);
    Class v100 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v101);
    [v111 completeWithJSONResult:v100 binaryResult:0 completionHandler:0];
  }

  uint64_t v103 = v109;
  uint64_t v102 = v110;

  (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v121, v102);
  sub_10000EAEC();
}

uint64_t sub_10000BD64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)v2;
  uint64_t v330 = a2;
  *(void *)&__int128 v313 = type metadata accessor for CustomSignalType(0LL);
  uint64_t v5 = *(void *)(v313 - 8);
  __chkstk_darwin(v313);
  sub_10000EBF0();
  uint64_t v8 = v6 - v7;
  __chkstk_darwin(v9);
  sub_10000ED24();
  unint64_t v314 = v10;
  sub_100003F80(&qword_10001DD40);
  sub_10000EB98();
  __chkstk_darwin(v11);
  uint64_t v13 = (uint64_t)v288 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v326 = type metadata accessor for CustomSignal(0LL);
  uint64_t v317 = *(void *)(v326 - 8);
  sub_10000EB98();
  __chkstk_darwin(v14);
  v319 = (char *)v288 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for UUID(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  sub_10000ED44();
  sub_10000EA00();
  __chkstk_darwin(v18);
  sub_10000EB40();
  sub_10000EA00();
  __chkstk_darwin(v19);
  sub_10000EB40();
  sub_10000EA00();
  __chkstk_darwin(v20);
  sub_10000EB40();
  sub_10000EA00();
  __chkstk_darwin(v21);
  sub_10000EB40();
  sub_10000EA00();
  __chkstk_darwin(v22);
  sub_10000EB40();
  sub_10000EA00();
  __chkstk_darwin(v23);
  sub_10000ED24();
  *(void *)&__int128 v324 = v24;
  sub_100003F80(&qword_10001DD48);
  sub_10000EB98();
  __chkstk_darwin(v25);
  sub_10000ED44();
  sub_10000EA00();
  __chkstk_darwin(v26);
  sub_10000EB40();
  sub_10000EA00();
  __chkstk_darwin(v27);
  sub_10000EB40();
  sub_10000EA00();
  __chkstk_darwin(v28);
  sub_10000ED24();
  uint64_t v323 = v29;
  uint64_t v309 = type metadata accessor for Logger(0LL);
  uint64_t v308 = *(void *)(v309 - 8);
  sub_10000EB98();
  __chkstk_darwin(v30);
  sub_10000EC00();
  uint64_t v332 = v31;
  unint64_t v32 = sub_10000EA60();
  Logger.init(subsystem:category:)(v32, v33, v34, v35);
  uint64_t v307 = a1;
  sub_10000D9FC(1701667182LL, 0xE400000000000000LL, a1, &v342);
  uint64_t v331 = v16;
  if (!*((void *)&v343 + 1))
  {
    sub_10000E558((uint64_t)&v342, &qword_10001DD50);
LABEL_10:
    v322 = (void *)v2;
    uint64_t v326 = sub_100003F80(&qword_10001DD28);
    uint64_t v39 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  v326,  &protocol witness table for String);
    sub_10000EBB4(v39, (uint64_t)v341);
    sub_10000EA34();
    uint64_t v323 = v40 >> 6;
    uint64_t v311 = (v40 >> 6) - 1;
    uint64_t v42 = swift_bridgeObjectRetain(v41);
    uint64_t v43 = 0LL;
    uint64_t v312 = v42 + 104;
    *(void *)&__int128 v44 = 136315138LL;
    __int128 v324 = v44;
    v319 = (char *)&type metadata for Any + 8;
    uint64_t v316 = 0xD00000000000002ELL;
    unint64_t v314 = 0x80000001000144F0LL;
    __int128 v313 = xmmword_1000136E0;
    uint64_t v45 = v315;
LABEL_11:
    uint64_t v46 = v328;
    uint64_t v47 = v329;
    if (v2)
    {
LABEL_12:
      uint64_t v3 = (void *)v45;
      sub_10000EAD8();
      uint64_t v335 = v2;
      uint64_t v334 = v49;
      uint64_t v51 = v50 | (v49 << 6);
LABEL_13:
      uint64_t v52 = v330;
      uint64_t v13 = v48;
      sub_10000EA90( v46,  *(void *)(v330 + 48) + *(void *)(v48 + 72) * v51,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 16));
      uint64_t v53 = (uint64_t *)(*(void *)(v52 + 56) + 16 * v51);
      uint64_t v54 = sub_100003F80(&qword_10001DD58);
      uint64_t v55 = (uint64_t *)(v46 + *(int *)(v54 + 48));
      uint64_t v56 = *v53;
      unint64_t v57 = v53[1];
      *uint64_t v55 = v56;
      v55[1] = v57;
      sub_10000667C(v46, 0LL, 1LL, v54);
      sub_10000E400(v56, v57);
      goto LABEL_20;
    }

    while (1)
    {
      if (__OFADD__(v43, 1LL))
      {
        __break(1u);
LABEL_177:
        __break(1u);
LABEL_178:
        __break(1u);
LABEL_179:
        __break(1u);
        goto LABEL_180;
      }

      sub_10000EAA0();
      if (v58 != v59)
      {
        sub_10000EB8C();
        if (v61) {
          goto LABEL_18;
        }
        if (v60 + 1 >= v323)
        {
          uint64_t v3 = (void *)v45;
          uint64_t v13 = v17;
        }

        else
        {
          if (*(void *)(v320 + 8 * (v60 + 1))) {
            goto LABEL_18;
          }
          if (v60 + 2 >= v323)
          {
            sub_10000EBA4();
            *(void *)(v109 - 256) = v110;
            goto LABEL_19;
          }

          if (*(void *)(v320 + 8 * (v60 + 2))) {
            goto LABEL_18;
          }
          sub_10000EAA0();
          if (v58 == v59)
          {
            sub_10000EBA4();
            *(void *)(v114 - 256) = v115;
            goto LABEL_19;
          }

          sub_10000EB8C();
          if (v111)
          {
LABEL_18:
            uint64_t v3 = (void *)v45;
            sub_10000EB2C();
            uint64_t v335 = v62;
            uint64_t v51 = v64 + (v63 << 6);
            uint64_t v334 = v63;
            goto LABEL_13;
          }

          while (1)
          {
            sub_10000EAA0();
            if (v58 == v59) {
              break;
            }
            if (*(void *)(v112 + 8 * v113)) {
              goto LABEL_18;
            }
          }

          uint64_t v3 = (void *)v45;
          uint64_t v13 = v17;
          uint64_t v60 = v311;
        }

        uint64_t v334 = v60;
      }

      else
      {
        sub_10000EBA4();
        *(void *)(v65 - 256) = v66;
      }

LABEL_19:
      uint64_t v67 = sub_100003F80(&qword_10001DD58);
      sub_10000ED0C(v46, v68, v69, v67);
      uint64_t v335 = 0LL;
LABEL_20:
      sub_10000E94C(v46, v47, &qword_10001DD48);
      uint64_t v70 = sub_100003F80(&qword_10001DD58);
      if (sub_1000066D0(v47, 1LL, v70) == 1)
      {
        sub_10000ED7C();
        sub_10000EA10(&v342);
        if (*((void *)&v343 + 1))
        {
          sub_10000EBE8( (uint64_t)&v338,  (uint64_t)&v342,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Bool);
          sub_10000ECC8();
          if ((_DWORD)v127 && (v338 & 1) != 0)
          {
            uint64_t v128 = sub_10000ED6C();
            uint64_t v129 = sub_10000EC48(v128);
            if (v2)
            {
              sub_10000EA88();
              v130 = (void *)sub_10000E9F4();
              os_log_type_t v131 = static os_log_type_t.error.getter();
              if (sub_100008D74(v131))
              {
                v132 = (_WORD *)sub_1000048E8(2LL);
                _WORD *v132 = 0;
                sub_10000EB78( (void *)&_mh_execute_header,  v133,  v134,  "SiriInference dodml failed to convert and compress records when requested for some reason, returning as raw data");
                sub_1000048DC((uint64_t)v132);
              }

              sub_10000EC40(v135, &qword_10001DD28);
              uint64_t v137 = v136;
              sub_10000EA88();
LABEL_170:
              sub_10000ED04();
            }

            else
            {
              uint64_t v137 = v129;
              swift_bridgeObjectRelease_n(v13, 2LL);
            }

            goto LABEL_173;
          }
        }

        else
        {
          sub_10000E558((uint64_t)&v342, &qword_10001DD50);
          sub_10000ECC8();
        }

        sub_10000EC40(v127, &qword_10001DD28);
        uint64_t v137 = v138;
        unint64_t v139 = v13;
        goto LABEL_67;
      }

      uint64_t v71 = (uint64_t *)(v47 + *(int *)(v70 + 48));
      uint64_t v72 = *v71;
      uint64_t v73 = v71[1];
      uint64_t v45 = (uint64_t)v3;
      sub_10000EA90((uint64_t)v3, v47, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 32));
      uint64_t v74 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
      uint64_t v333 = v73;
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      *(void *)&__int128 v342 = 0LL;
      id v76 = [v74 JSONObjectWithData:isa options:0 error:&v342];

      uint64_t v77 = (os_log_s *)v342;
      if (v76)
      {
        id v78 = (id)v342;
        _bridgeAnyObjectToAny(_:)(&v342, v76);
        swift_unknownObjectRelease(v76);
        if (!sub_10000EBE8((uint64_t)&v338, (uint64_t)&v342, (uint64_t)&type metadata for Any + 8, v326))
        {
          sub_10000EA90(v327, (uint64_t)v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
          sub_10000E9F4();
          os_log_type_t v102 = sub_10000ED58();
          uint64_t v3 = (void *)v13;
          if (sub_10000EAAC(v102))
          {
            uint64_t v103 = sub_1000048E8(12LL);
            uint64_t v104 = sub_1000048E8(32LL);
            sub_10000EC28(v104);
            sub_10000EC78();
            uint64_t v105 = ((uint64_t (*)(void))UUID.uuidString.getter)();
            *(void *)(v103 + 4) = sub_10000EB60(v105, v106);
            sub_10000EB4C();
            sub_10000EACC(v13);
            sub_100004948( (void *)&_mh_execute_header,  v77,  (os_log_type_t)v73,  "Couldn't decode data for %s into a record, skipping",  (uint8_t *)v103);
            sub_10000EBD8((uint64_t)&type metadata for Any);
            uint64_t v107 = v16;
            uint64_t v16 = v331;
            sub_1000048DC(v107);
            uint64_t v108 = v103;
            uint64_t v46 = v328;
            sub_1000048DC(v108);
            sub_10000E9C8(v72);

            sub_10000EA98(v45);
          }

          else
          {
            sub_10000E9C8(v72);
            sub_10000EB14(v327);

            sub_10000EB14(v45);
          }

          uint64_t v17 = v13;
          goto LABEL_37;
        }

        uint64_t v79 = v338;
        uint64_t v17 = v13;
        if (!*(void *)(v338 + 16)
          || (unint64_t v80 = sub_10000E488(0x79546C616E676973LL, 0xEA00000000006570LL), (v81 & 1) == 0))
        {
          __int128 v342 = 0u;
          __int128 v343 = 0u;
          sub_10000E558((uint64_t)&v342, &qword_10001DD50);
          uint64_t v116 = (os_log_s *)sub_10000E9F4();
          os_log_type_t v117 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v116, v117))
          {
            uint64_t v118 = (_WORD *)sub_1000048E8(2LL);
            *uint64_t v118 = 0;
            sub_10000ECA4((void *)&_mh_execute_header, v116, v117, "SiriInference dodML plugin ran succesfully");
            sub_1000048DC((uint64_t)v118);
          }

          sub_10000E444(24LL);
          swift_bridgeObjectRelease(v119);
          uint64_t v13 = (uint64_t)String._bridgeToObjectiveC()();
          uint64_t v120 = sub_100003F80(&qword_10001DD60);
          uint64_t inited = swift_initStackObject(v120, v340);
          *(_OWORD *)(inited + 16) = v313;
          *(void *)(inited + 32) = 0x656D6F6374756FLL;
          *(void *)(inited + 40) = 0xE700000000000000LL;
          sub_100003FFC(0LL, &qword_10001DD68, &OBJC_CLASS___NSString_ptr);
          *(void *)(inited + 48) = NSString.init(stringLiteral:)("success", 7LL, 2LL);
          uint64_t v122 = sub_100003FFC(0LL, (unint64_t *)&qword_10001DD70, &OBJC_CLASS___NSObject_ptr);
          uint64_t v3 = &type metadata for String;
          Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  v122,  &protocol witness table for String);
          Class v123 = Dictionary._bridgeToObjectiveC()().super.isa;
          sub_10000EC58();
          AnalyticsSendEvent(v13, v123);

          uint64_t v124 = ((uint64_t (*)(void))UUID.uuidString.getter)();
          uint64_t v16 = v125;
          char v126 = sub_10000EB6C((uint64_t)v341);
          *(void *)&__int128 v342 = v45;
          sub_10000E598(v79, v124, v16, v126, &qword_10001DDC0);
          uint64_t v317 = v342;
          sub_10000EC58();
          sub_10000ECF0();
          sub_10000E9C8(v72);
          sub_10000EABC(v45, *(uint64_t (**)(uint64_t, void))(v17 + 8));
          uint64_t v43 = v334;
          uint64_t v2 = v335;
          goto LABEL_11;
        }

        sub_100004290(*(void *)(v79 + 56) + 32 * v80, (uint64_t)&v342);
        swift_bridgeObjectRelease(v79);
        sub_10000E558((uint64_t)&v342, &qword_10001DD50);
        uint64_t v82 = v318;
        sub_10000EA90(v318, (uint64_t)v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
        sub_10000E9F4();
        os_log_type_t v83 = sub_10000ED58();
        uint64_t v3 = (void *)v13;
        if (sub_10000EAAC(v83))
        {
          uint64_t v84 = v82;
          uint64_t v85 = sub_1000048E8(12LL);
          uint64_t v86 = sub_1000048E8(32LL);
          __n128 v87 = sub_10000EC28(v86);
          uint64_t v88 = UUID.uuidString.getter(v87);
          *(void *)(v85 + 4) = sub_10000EB60(v88, v89);
          sub_10000EB4C();
          uint64_t v90 = v84;
          uint64_t v45 = v315;
          sub_10000EACC(v90);
          sub_100004948( (void *)&_mh_execute_header,  v77,  (os_log_type_t)v13,  "Record %s looks like a CustomSignal, skipping",  (uint8_t *)v85);
          sub_10000EBD8((uint64_t)&type metadata for Any);
          uint64_t v91 = v16;
          uint64_t v16 = v331;
          sub_1000048DC(v91);
          sub_1000048DC(v85);
        }

        else
        {
          sub_10000EA98(v82);
        }

        sub_10000E9C8(v72);

        sub_10000EA98(v45);
      }

      else
      {
        id v92 = (id)v342;
        uint64_t v93 = sub_10000ECBC();

        swift_willThrow();
        uint64_t v3 = v321;
        sub_10000EA90((uint64_t)v321, v45, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
        BOOL v94 = (os_log_s *)sub_10000E9F4();
        os_log_type_t v95 = static os_log_type_t.error.getter();
        uint64_t v96 = v45;
        if (sub_10000EAAC(v95))
        {
          uint64_t v97 = sub_1000048E8(12LL);
          uint64_t v98 = sub_1000048E8(32LL);
          *(void *)&__int128 v342 = v98;
          *(_DWORD *)uint64_t v97 = v324;
          v322 = (void *)v72;
          uint64_t v99 = ((uint64_t (*)(void))UUID.uuidString.getter)();
          *(void *)(v97 + 4) = sub_10000EB60(v99, v100);
          sub_10000EB4C();
          sub_10000EACC((uint64_t)v3);
          sub_100004948( (void *)&_mh_execute_header,  v94,  (os_log_type_t)v73,  "Unable to decode record %s, skipping",  (uint8_t *)v97);
          swift_arrayDestroy(v98, 1LL, v319);
          sub_1000048DC(v98);
          uint64_t v101 = v97;
          uint64_t v16 = v331;
          sub_1000048DC(v101);
          sub_10000E9C8((uint64_t)v322);
          swift_errorRelease(v93);

          sub_10000EA98(v96);
          v322 = 0LL;
          uint64_t v17 = v13;
          uint64_t v45 = v96;
        }

        else
        {
          sub_10000E9C8(v72);
          sub_10000EB14((uint64_t)v3);
          swift_errorRelease(v93);

          sub_10000EB14(v45);
          v322 = 0LL;
          uint64_t v17 = v13;
        }
      }

      uint64_t v46 = v328;
LABEL_37:
      uint64_t v47 = v329;
      uint64_t v43 = v334;
      uint64_t v2 = v335;
      if (v335) {
        goto LABEL_12;
      }
    }
  }

  if ((sub_10000EBE8( (uint64_t)&v338,  (uint64_t)&v342,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for String) & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v312 = v5;
  uint64_t v36 = *((void *)&v338 + 1);
  if ((void)v338 == 0x536F747541736D73LL && *((void *)&v338 + 1) == 0xEB00000000646E65LL)
  {
    swift_bridgeObjectRelease(*((void *)&v338 + 1));
    goto LABEL_69;
  }

  char v38 = _stringCompareWithSmolCheck(_:_:expecting:)( v338,  *((void *)&v338 + 1),  0x536F747541736D73LL,  0xEB00000000646E65LL,  0LL);
  swift_bridgeObjectRelease(v36);
  if ((v38 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_69:
  uint64_t v140 = type metadata accessor for JSONDecoder(0LL);
  swift_allocObject(v140, *(unsigned int *)(v140 + 48), *(unsigned __int16 *)(v140 + 52));
  uint64_t v328 = JSONDecoder.init()();
  uint64_t v141 = sub_100003F80(&qword_10001DD78);
  uint64_t v142 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  v141,  &protocol witness table for String);
  sub_10000EBB4(v142, (uint64_t)v325);
  sub_10000EA34();
  LODWORD(v315) = enum case for CustomSignalType.messagesAutoSend(_:);
  uint64_t v318 = v143 >> 6;
  uint64_t v293 = (v143 >> 6) - 1;
  uint64_t v145 = swift_bridgeObjectRetain(v144);
  uint64_t v146 = 0LL;
  uint64_t v294 = v145 + 104;
  *(void *)&__int128 v147 = 136315138LL;
  __int128 v310 = v147;
  v298 = (char *)&type metadata for Any + 8;
  uint64_t v295 = (uint64_t)&type metadata for Swift.AnyObject + 8;
  v321 = (void *)v17;
  uint64_t v311 = v8;
  uint64_t v327 = v13;
  while (2)
  {
    uint64_t v148 = v320;
    if (v2)
    {
LABEL_71:
      sub_10000EAD8();
      uint64_t v334 = v2;
      uint64_t v335 = v149;
      uint64_t v151 = v150 | (v149 << 6);
LABEL_72:
      uint64_t v152 = v330;
      sub_10000EA90( v148,  *(void *)(v330 + 48) + *(void *)(v17 + 72) * v151,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16));
      v153 = (uint64_t *)(*(void *)(v152 + 56) + 16 * v151);
      uint64_t v154 = sub_10000EC9C();
      v155 = (uint64_t *)(v148 + *(int *)(v154 + 48));
      uint64_t v156 = *v153;
      unint64_t v157 = v153[1];
      uint64_t *v155 = v156;
      v155[1] = v157;
      sub_10000667C(v148, 0LL, 1LL, v154);
      sub_10000E400(v156, v157);
      uint64_t v158 = v323;
      goto LABEL_79;
    }

    while (1)
    {
      if (__OFADD__(v146, 1LL)) {
        goto LABEL_177;
      }
      sub_10000EAA0();
      if (v58 != v59)
      {
        sub_10000EB8C();
        uint64_t v158 = v323;
        if (v161) {
          goto LABEL_77;
        }
        if (v160 + 1 >= v318) {
          goto LABEL_115;
        }
        if (*(void *)(v306 + 8 * (v160 + 1))) {
          goto LABEL_77;
        }
        if (v160 + 2 >= v318)
        {
          uint64_t v335 = v160 + 1;
        }

        else
        {
          if (*(void *)(v306 + 8 * (v160 + 2))) {
            goto LABEL_77;
          }
          sub_10000EAA0();
          if (v58 != v59)
          {
            sub_10000EB8C();
            if (v217)
            {
LABEL_77:
              sub_10000EB2C();
              uint64_t v334 = v162;
              uint64_t v151 = v164 + (v163 << 6);
              uint64_t v335 = v163;
              goto LABEL_72;
            }

            while (1)
            {
              sub_10000EAA0();
              if (v58 == v59) {
                break;
              }
              if (*(void *)(v218 + 8 * v219)) {
                goto LABEL_77;
              }
            }

            uint64_t v160 = v293;
LABEL_115:
            uint64_t v335 = v160;
            goto LABEL_78;
          }

          uint64_t v335 = v216;
        }
      }

      else
      {
        uint64_t v335 = v159;
        uint64_t v158 = v323;
      }

LABEL_78:
      uint64_t v165 = sub_10000EC9C();
      sub_10000ED0C(v148, v166, v167, v165);
      uint64_t v334 = 0LL;
LABEL_79:
      sub_10000E94C(v148, v158, &qword_10001DD48);
      uint64_t v168 = sub_10000EC9C();
      if (sub_1000066D0(v158, 1LL, v168) == 1)
      {
        sub_10000ED7C();
        sub_10000EA10(&v338);
        if (v339)
        {
          uint64_t v275 = sub_10000EBE8( (uint64_t)&v336,  (uint64_t)&v338,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Bool);
          if ((_DWORD)v275 && (v336 & 1) != 0)
          {
            uint64_t v276 = sub_10000ED6C();
            unint64_t v277 = sub_10000DA4C(v276);
            sub_10000EA88();
            uint64_t v278 = sub_10000EC48(v277);
            if (v2)
            {
              swift_bridgeObjectRelease(v277);
              v279 = (void *)sub_10000E9F4();
              os_log_type_t v280 = static os_log_type_t.error.getter();
              if (sub_100008D74(v280))
              {
                v281 = (_WORD *)sub_1000048E8(2LL);
                _WORD *v281 = 0;
                sub_10000EB78( (void *)&_mh_execute_header,  v282,  v283,  "SiriInference dodml failed to convert and compress records when requested for some reason, returning as raw data");
                sub_1000048DC((uint64_t)v281);
              }

              sub_10000EC40(v284, &qword_10001DD78);
              uint64_t v137 = v285;
              sub_10000EA88();
              sub_10000EB54();
              goto LABEL_170;
            }

            uint64_t v137 = v278;
            sub_10000EA88();
            sub_10000EB54();
            unint64_t v139 = v277;
LABEL_67:
            swift_bridgeObjectRelease(v139);
LABEL_173:
            (*(void (**)(uint64_t, uint64_t))(v308 + 8))(v332, v309);
            return v137;
          }
        }

        else
        {
          sub_10000E558((uint64_t)&v338, &qword_10001DD50);
        }

        sub_10000EC40(v275, &qword_10001DD78);
        uint64_t v137 = v286;
        sub_10000EA88();
        sub_10000EB54();
        goto LABEL_173;
      }

      v169 = (uint64_t *)(v158 + *(int *)(v168 + 48));
      v170 = v3;
      uint64_t v172 = *v169;
      uint64_t v171 = v169[1];
      uint64_t v173 = v324;
      sub_10000EA90(v324, v158, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 32));
      sub_10000E98C( &qword_10001DD80,  (uint64_t (*)(uint64_t))&type metadata accessor for CustomSignal,  (uint64_t)&protocol conformance descriptor for CustomSignal);
      uint64_t v174 = v326;
      uint64_t v329 = v172;
      uint64_t v333 = v171;
      dispatch thunk of JSONDecoder.decode<A>(_:from:)(v326, v172, v171, v326, v175);
      uint64_t v3 = v170;
      if (v170)
      {
        sub_10000ED04();
        sub_10000ED60(v13, 1LL);
        sub_10000E558(v13, &qword_10001DD40);
        uint64_t v176 = v316;
        sub_10000EA90(v316, v173, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16));
        uint64_t v13 = sub_10000E9F4();
        os_log_type_t v177 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled((os_log_t)v13, v177))
        {
          uint64_t v178 = sub_1000048E8(12LL);
          uint64_t v179 = sub_1000048E8(32LL);
          __n128 v180 = sub_10000ECDC(v179);
          *(_DWORD *)uint64_t v178 = v180.n128_u32[0];
          uint64_t v181 = UUID.uuidString.getter(v180);
          *(void *)(v178 + 4) = sub_10000ECB0(v181, v182);
          sub_10000EB4C();
          sub_10000EACC(v176);
          sub_100004948( (void *)&_mh_execute_header,  (os_log_s *)v13,  v177,  "Unable to decode %s to CustomSignal, so not an SMS record",  (uint8_t *)v178);
          swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
          uint64_t v183 = v17;
          uint64_t v17 = (uint64_t)v321;
          sub_1000048DC(v183);
          sub_1000048DC(v178);
          sub_10000E9C8(v329);

          sub_10000EA98(v173);
        }

        else
        {
          sub_10000E9C8(v329);
          sub_10000EB14(v176);

          sub_10000EB14(v173);
        }

        uint64_t v3 = 0LL;
        goto LABEL_92;
      }

      sub_10000ED60(v13, 0LL);
      uint64_t v184 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v317 + 32))(v319, v13, v174);
      uint64_t v185 = v314;
      CustomSignal.signalType.getter(v184);
      uint64_t v186 = v312;
      uint64_t v187 = v311;
      uint64_t v188 = v313;
      (*(void (**)(uint64_t, void, void))(v312 + 104))(v311, v315, v313);
      sub_10000E98C( &qword_10001DD88,  (uint64_t (*)(uint64_t))&type metadata accessor for CustomSignalType,  (uint64_t)&protocol conformance descriptor for CustomSignalType);
      sub_10000EC60();
      sub_10000EC60();
      if ((void)v338 == v336 && *((void *)&v338 + 1) == v337) {
        break;
      }
      uint64_t v190 = v187;
      uint64_t v191 = v188;
      char v192 = _stringCompareWithSmolCheck(_:_:expecting:)(v338, *((void *)&v338 + 1), v336, v337, 0LL);
      sub_10000EB4C();
      sub_10000EA88();
      v193 = *(void (**)(uint64_t, uint64_t))(v186 + 8);
      v193(v190, v191);
      v193(v314, v191);
      if ((v192 & 1) != 0) {
        goto LABEL_94;
      }
      uint64_t v194 = v305;
      uint64_t v13 = v331;
      (*(void (**)(uint64_t, void, uint64_t))(v17 + 16))(v305, v324, v331);
      sub_10000E9F4();
      os_log_type_t v195 = sub_10000ED58();
      if (os_log_type_enabled(0LL, v195))
      {
        uint64_t v196 = sub_1000048E8(12LL);
        uint64_t v197 = sub_1000048E8(32LL);
        __n128 v198 = sub_10000ECDC(v197);
        *(_DWORD *)uint64_t v196 = v198.n128_u32[0];
        uint64_t v199 = UUID.uuidString.getter(v198);
        *(void *)(v196 + 4) = sub_10000ECB0(v199, v200);
        sub_10000EB4C();
        v201 = (void (*)(uint64_t, uint64_t))v321[1];
        v201(v194, v13);
        sub_100004948( (void *)&_mh_execute_header,  0LL,  v195,  "Record %s was not an SMS auto-send record, skipping",  (uint8_t *)v196);
        swift_arrayDestroy(v17, 1LL, v298);
        uint64_t v202 = v17;
        uint64_t v17 = (uint64_t)v321;
        sub_1000048DC(v202);
        sub_1000048DC(v196);
        sub_10000E9C8(v329);

        sub_10000E9D4();
        uint64_t v203 = sub_10000EBCC();
        ((void (*)(uint64_t))v201)(v203);
      }

      else
      {
        sub_10000E9C8(v329);

        uint64_t v213 = v194;
        v214 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
        v214(v213, v13);
        sub_10000E9D4();
        uint64_t v215 = sub_10000EBCC();
        ((void (*)(uint64_t))v214)(v215);
      }

LABEL_92:
      sub_10000EC78();
      uint64_t v148 = v320;
LABEL_98:
      uint64_t v146 = v335;
      uint64_t v2 = v334;
      if (v334) {
        goto LABEL_71;
      }
    }

    swift_bridgeObjectRelease_n(*((void *)&v338 + 1), 2LL);
    sub_10000EA98(v187);
    sub_10000EA98(v185);
LABEL_94:
    sub_100003FFC(0LL, &qword_10001DD90, &OBJC_CLASS___NSKeyedUnarchiver_ptr);
    uint64_t v204 = sub_100003FFC(0LL, &qword_10001DD68, &OBJC_CLASS___NSString_ptr);
    uint64_t v205 = sub_100003FFC(0LL, &qword_10001DD98, &OBJC_CLASS___NSNumber_ptr);
    uint64_t v206 = CustomSignal.item.getter();
    uint64_t v208 = static NSKeyedUnarchiver.unarchivedDictionary<A, B>(ofKeyClass:objectClass:from:)( v204,  v205,  v206,  v207,  v204,  v205);
    uint64_t v148 = v320;
    uint64_t v209 = v208;
    uint64_t v303 = v205;
    uint64_t v304 = v204;
    sub_10000EC6C();
    if (!v209)
    {
      v210 = (os_log_s *)sub_10000E9F4();
      os_log_type_t v211 = static os_log_type_t.error.getter();
      uint64_t v13 = v211;
      if (os_log_type_enabled(v210, v211))
      {
        v212 = (_WORD *)sub_1000048E8(2LL);
        _WORD *v212 = 0;
        sub_10000ECA4( (void *)&_mh_execute_header,  v210,  (os_log_type_t)v13,  "SiriInference dodML plugin tried to decode smsAutoSend record but failed - skipping");
        sub_1000048DC((uint64_t)v212);
      }

      sub_10000E9C8(v329);

      sub_10000E9D4();
      sub_10000EABC(v324, *(uint64_t (**)(uint64_t, void))(v17 + 8));
      sub_10000EC78();
      goto LABEL_98;
    }

    uint64_t v301 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  &type metadata for Int,  &protocol witness table for String);
    if ((v209 & 0xC000000000000001LL) != 0)
    {
      if (v209 >= 0) {
        uint64_t v220 = v209 & 0xFFFFFFFFFFFFFF8LL;
      }
      else {
        uint64_t v220 = v209;
      }
      uint64_t v221 = __CocoaDictionary.makeIterator()(v220);
      uint64_t v292 = 0LL;
      uint64_t v222 = 0LL;
      uint64_t v302 = 0LL;
      unint64_t v223 = 0LL;
      unint64_t v224 = v221 | 0x8000000000000000LL;
    }

    else
    {
      sub_10000E904(v209, &v342);
      uint64_t v292 = *((void *)&v342 + 1);
      unint64_t v224 = v342;
      uint64_t v302 = *((void *)&v343 + 1);
      uint64_t v222 = v343;
      unint64_t v223 = v344;
    }

    uint64_t v225 = swift_bridgeObjectRetain(v209);
    uint64_t v290 = v224 & 0x7FFFFFFFFFFFFFFFLL;
    v288[1] = v222;
    int64_t v291 = (unint64_t)(v222 + 64) >> 6;
    uint64_t v289 = v209;
    uint64_t v226 = v224;
    unint64_t v296 = v224;
    v322 = 0LL;
    if ((v224 & 0x8000000000000000LL) == 0)
    {
LABEL_123:
      if (v223)
      {
        uint64_t v227 = (v223 - 1) & v223;
        uint64_t v228 = v302;
        unint64_t v229 = __clz(__rbit64(v223)) | (v302 << 6);
        goto LABEL_150;
      }

      if (!__OFADD__(v302, 1LL))
      {
        sub_10000EAA0();
        if (v58 == v59) {
          goto LABEL_162;
        }
        sub_10000EB8C();
        uint64_t v228 = v237;
        if (!v238)
        {
          uint64_t v228 = v237 + 1;
          sub_10000EB04();
          if (v58 == v59) {
            goto LABEL_162;
          }
          sub_10000EB1C();
          if (!v238)
          {
            uint64_t v228 = v239 + 2;
            sub_10000EB04();
            if (v58 == v59) {
              goto LABEL_162;
            }
            sub_10000EB1C();
            if (!v238)
            {
              uint64_t v228 = v240 + 3;
              sub_10000EB04();
              if (v58 == v59) {
                goto LABEL_162;
              }
              sub_10000EB1C();
              if (!v238)
              {
                uint64_t v228 = v241 + 4;
                sub_10000EB04();
                if (v58 == v59)
                {
LABEL_162:
                  sub_10000E590(v296);
                  swift_bridgeObjectRelease(v289);
                  uint64_t v269 = v324;
                  uint64_t v270 = v324;
                  uint64_t v13 = UUID.uuidString.getter(v271);
                  uint64_t v273 = v272;
                  char v274 = sub_10000EB6C((uint64_t)v325);
                  *(void *)&__int128 v338 = v270;
                  sub_10000E598(v301, v13, v273, v274, &qword_10001DDA8);
                  uint64_t v297 = v338;
                  sub_10000EC58();
                  sub_10000ECF0();
                  sub_10000E9C8(v329);
                  sub_10000E9D4();
                  sub_10000EABC(v269, *(uint64_t (**)(uint64_t, void))(v17 + 8));
                  sub_10000EC78();
                  uint64_t v146 = v335;
                  uint64_t v2 = v334;
                  continue;
                }

                sub_10000EB1C();
                if (!v238)
                {
                  uint64_t v228 = v242 + 5;
                  if (v242 + 5 >= v291) {
                    goto LABEL_162;
                  }
                  unint64_t v238 = *(void *)(v292 + 8 * v228);
                  if (!v238)
                  {
                    do
                    {
                      sub_10000EAA0();
                      if (v58 == v59) {
                        goto LABEL_162;
                      }
                      sub_10000EB8C();
                      uint64_t v244 = v243 + 1;
                    }

                    while (!v238);
                    uint64_t v228 = v244 - 1;
                  }
                }
              }
            }
          }
        }

        uint64_t v227 = (v238 - 1) & v238;
        unint64_t v229 = __clz(__rbit64(v238)) + (v228 << 6);
LABEL_150:
        v233 = *(void **)(*(void *)(v226 + 56) + 8 * v229);
        id v235 = *(id *)(*(void *)(v226 + 48) + 8 * v229);
        id v236 = v233;
        goto LABEL_151;
      }

LABEL_180:
      __break(1u);
    }

    break;
  }

  while (2)
  {
    uint64_t v227 = v223;
    uint64_t v230 = __CocoaDictionary.Iterator.next()(v225);
    if (!v230) {
      goto LABEL_162;
    }
    uint64_t v232 = v230;
    v233 = v231;
    uint64_t v336 = v230;
    swift_unknownObjectRetain(v230);
    uint64_t v234 = v295;
    sub_10000ED18((uint64_t)&v338, (uint64_t)&v336, v295, (uint64_t)&v332);
    id v235 = (id)v338;
    swift_unknownObjectRelease(v232);
    uint64_t v336 = (uint64_t)v233;
    swift_unknownObjectRetain(v233);
    uint64_t v228 = v302;
    sub_10000ED18((uint64_t)&v338, (uint64_t)&v336, v234, (uint64_t)&v331);
    id v236 = (id)v338;
    swift_unknownObjectRelease(v233);
LABEL_151:
    if (!v235) {
      goto LABEL_162;
    }
    unint64_t v300 = v227;
    uint64_t v299 = v228;
    v245 = v235;
    uint64_t v246 = static String._unconditionallyBridgeFromObjectiveC(_:)(v235);
    uint64_t v248 = v247;
    v249 = v236;
    uint64_t v302 = (uint64_t)[v236 integerValue];
    char v250 = sub_10000EB6C((uint64_t)&v329);
    *(void *)&__int128 v338 = v233;
    uint64_t v251 = v246;
    sub_10000E488(v246, v248);
    sub_10000EC18();
    Swift::Int v256 = v254 + v255;
    if (__OFADD__(v254, v255)) {
      goto LABEL_178;
    }
    unint64_t v257 = v252;
    char v258 = v253;
    sub_100003F80(&qword_10001DDA0);
    Swift::Bool v259 = _NativeDictionary.ensureUnique(isUnique:capacity:)(v250, v256);
    uint64_t v17 = (uint64_t)v321;
    if (!v259)
    {
LABEL_156:
      uint64_t v264 = v338;
      uint64_t v301 = v338;
      if ((v258 & 1) != 0)
      {
        sub_10000ED30();
      }

      else
      {
        *(void *)(v338 + 8 * (v257 >> 6) + 64) |= 1LL << v257;
        v265 = (uint64_t *)(*(void *)(v264 + 48) + 16 * v257);
        uint64_t *v265 = v251;
        v265[1] = v248;
        sub_10000ED30();
        uint64_t v267 = *(void *)(v266 + 16);
        BOOL v59 = __OFADD__(v267, 1LL);
        uint64_t v268 = v267 + 1;
        if (v59) {
          goto LABEL_179;
        }
        *(void *)(v266 + 16) = v268;
        sub_10000ED6C();
      }

      uint64_t v3 = v322;

      sub_10000EA88();
      uint64_t v225 = sub_10000ECF0();
      uint64_t v302 = v299;
      unint64_t v223 = v300;
      uint64_t v226 = v296;
      if ((v296 & 0x8000000000000000LL) == 0) {
        goto LABEL_123;
      }
      continue;
    }

    break;
  }

  uint64_t v260 = sub_10000EBCC();
  unint64_t v262 = sub_10000E488(v260, v261);
  if ((v258 & 1) == (v263 & 1))
  {
    unint64_t v257 = v262;
    goto LABEL_156;
  }

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

double sub_10000D9FC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_10000E488(a1, a2), (v7 & 1) != 0))
  {
    sub_100004290(*(void *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }

  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }

  return result;
}

unint64_t sub_10000DA4C(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100003F80(&qword_10001DDB0);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v38 = v1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 64);
  int64_t v37 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain(v1);
  int64_t v8 = 0LL;
  uint64_t v9 = (uint64_t *)&unk_10001DD78;
  unint64_t v10 = (uint64_t *)&unk_10001DD28;
  while (1)
  {
    while (1)
    {
      if (v6)
      {
        unint64_t v11 = __clz(__rbit64(v6));
        v6 &= v6 - 1;
        unint64_t v12 = v11 | (v8 << 6);
      }

      else
      {
        int64_t v13 = v8 + 1;
        if (__OFADD__(v8, 1LL)) {
          goto LABEL_34;
        }
        if (v13 >= v37)
        {
LABEL_31:
          sub_10000E590(v1);
          return (unint64_t)v3;
        }

        unint64_t v14 = *(void *)(v38 + 8 * v13);
        int64_t v15 = v8 + 1;
        if (!v14)
        {
          int64_t v15 = v8 + 2;
          if (v8 + 2 >= v37) {
            goto LABEL_31;
          }
          unint64_t v14 = *(void *)(v38 + 8 * v15);
          if (!v14)
          {
            int64_t v15 = v8 + 3;
            if (v8 + 3 >= v37) {
              goto LABEL_31;
            }
            unint64_t v14 = *(void *)(v38 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v8 + 4;
              if (v8 + 4 >= v37) {
                goto LABEL_31;
              }
              unint64_t v14 = *(void *)(v38 + 8 * v15);
              if (!v14)
              {
                int64_t v16 = v8 + 5;
                if (v8 + 5 >= v37) {
                  goto LABEL_31;
                }
                unint64_t v14 = *(void *)(v38 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1LL)) {
                      goto LABEL_35;
                    }
                    if (v15 >= v37) {
                      goto LABEL_31;
                    }
                    unint64_t v14 = *(void *)(v38 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_25;
                    }
                  }
                }

                int64_t v15 = v8 + 5;
              }
            }
          }
        }

LABEL_25:
        unint64_t v6 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        int64_t v8 = v15;
      }

      uint64_t v17 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v12);
      uint64_t v19 = *v17;
      uint64_t v18 = v17[1];
      uint64_t v40 = *(void *)(*(void *)(v1 + 56) + 8 * v12);
      uint64_t v20 = v40;
      swift_bridgeObjectRetain(v18);
      swift_bridgeObjectRetain(v20);
      uint64_t v21 = sub_100003F80(v9);
      uint64_t v22 = sub_100003F80(v10);
      swift_dynamicCast(&v41, &v40, v21, v22, 7LL);
      uint64_t v23 = v41;
      unint64_t result = sub_10000E488(v19, v18);
      unint64_t v24 = result;
      if ((v25 & 1) == 0) {
        break;
      }
      uint64_t v39 = v23;
      unint64_t v26 = v6;
      uint64_t v27 = v1;
      int64_t v28 = v8;
      uint64_t v29 = v10;
      uint64_t v30 = v9;
      uint64_t v31 = (uint64_t *)(v3[6] + 16 * result);
      swift_bridgeObjectRelease(v31[1]);
      uint64_t *v31 = v19;
      v31[1] = v18;
      uint64_t v9 = v30;
      unint64_t v10 = v29;
      int64_t v8 = v28;
      uint64_t v1 = v27;
      unint64_t v6 = v26;
      uint64_t v32 = v3[7];
      unint64_t result = swift_bridgeObjectRelease(*(void *)(v32 + 8 * v24));
      *(void *)(v32 + 8 * v24) = v39;
    }

    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v33 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v33 = v19;
    v33[1] = v18;
    *(void *)(v3[7] + 8 * result) = v23;
    uint64_t v34 = v3[2];
    BOOL v35 = __OFADD__(v34, 1LL);
    uint64_t v36 = v34 + 1;
    if (v35) {
      goto LABEL_33;
    }
    v3[2] = v36;
  }

  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

void sub_10000DD5C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    sub_100003F80(&qword_10001DDB8);
    uint64_t v4 = (void *)static _DictionaryStorage.allocate(capacity:)(v3);
  }

  else
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v44 = v2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1LL << -(char)v5);
  }
  else {
    uint64_t v6 = -1LL;
  }
  uint64_t v7 = v6 & *(void *)(v2 + 64);
  int64_t v43 = (unint64_t)(63 - v5) >> 6;
  int64_t v8 = &v50;
  uint64_t v9 = &v52;
  swift_bridgeObjectRetain(v2);
  int64_t v10 = 0LL;
  unint64_t v11 = (char *)&type metadata for Any + 8;
  while (1)
  {
    while (1)
    {
      if (v7)
      {
        sub_10000EAD8();
        unint64_t v13 = v12 | (v10 << 6);
      }

      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1LL)) {
          goto LABEL_38;
        }
        if (v14 >= v43)
        {
LABEL_35:
          sub_10000E590(v2);
          return;
        }

        unint64_t v15 = *(void *)(v44 + 8 * v14);
        int64_t v16 = v10 + 1;
        if (!v15)
        {
          sub_10000EC90();
          if (v17 == v18) {
            goto LABEL_35;
          }
          sub_10000EC84();
          if (!v15)
          {
            sub_10000EC90();
            if (v17 == v18) {
              goto LABEL_35;
            }
            sub_10000EC84();
            if (!v15)
            {
              sub_10000EC90();
              if (v17 == v18) {
                goto LABEL_35;
              }
              sub_10000EC84();
              if (!v15)
              {
                int64_t v20 = v19 + 4;
                if (v20 >= v43) {
                  goto LABEL_35;
                }
                unint64_t v15 = *(void *)(v44 + 8 * v20);
                if (!v15)
                {
                  while (!__OFADD__(v20, 1LL))
                  {
                    sub_10000EC90();
                    if (v17 == v18) {
                      goto LABEL_35;
                    }
                    sub_10000EC84();
                    int64_t v20 = v21 + 1;
                    if (v15) {
                      goto LABEL_29;
                    }
                  }

                  goto LABEL_39;
                }

                int64_t v16 = v20;
              }
            }
          }
        }

LABEL_29:
        uint64_t v7 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
        int64_t v10 = v16;
      }

      uint64_t v22 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v13);
      uint64_t v23 = v22[1];
      uint64_t v24 = *(void *)(*(void *)(v2 + 56) + 8 * v13);
      uint64_t v48 = *v22;
      uint64_t v49 = v23;
      uint64_t v47 = v24;
      swift_bridgeObjectRetain(v23);
      swift_bridgeObjectRetain(v24);
      uint64_t v25 = sub_100003F80(a2);
      swift_dynamicCast(v8, &v47, v25, v11, 7LL);
      uint64_t v26 = v48;
      uint64_t v27 = v49;
      int64_t v28 = (_OWORD *)sub_10000EBCC();
      sub_10000E93C(v28, v29);
      sub_10000E93C(v9, v53);
      sub_10000E93C(v53, &v51);
      unint64_t v30 = sub_10000E488(v26, v27);
      unint64_t v31 = v30;
      if ((v32 & 1) == 0) {
        break;
      }
      uint64_t v45 = v7;
      uint64_t v33 = v9;
      uint64_t v34 = v8;
      uint64_t v35 = v2;
      uint64_t v36 = v10;
      int64_t v37 = v11;
      uint64_t v38 = (uint64_t *)(v4[6] + 16 * v30);
      swift_bridgeObjectRelease(v38[1]);
      *uint64_t v38 = v26;
      v38[1] = v27;
      unint64_t v11 = v37;
      int64_t v10 = v36;
      uint64_t v2 = v35;
      int64_t v8 = v34;
      uint64_t v9 = v33;
      uint64_t v7 = v45;
      uint64_t v39 = (void *)(v4[7] + 32 * v31);
      sub_100004270(v39);
      sub_10000E93C(&v51, v39);
    }

    if (v4[2] >= v4[3]) {
      break;
    }
    *(void *)((char *)v4 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << v30;
    uint64_t v40 = (uint64_t *)(v4[6] + 16 * v30);
    *uint64_t v40 = v26;
    v40[1] = v27;
    sub_10000E93C(&v51, (_OWORD *)(v4[7] + 32 * v30));
    uint64_t v41 = v4[2];
    BOOL v18 = __OFADD__(v41, 1LL);
    uint64_t v42 = v41 + 1;
    if (v18) {
      goto LABEL_37;
    }
    void v4[2] = v42;
  }

  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_10000E078(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v2 = sub_100003F80(&qword_10001DD30);
    uint64_t inited = swift_initStackObject(v2, &v9);
    *(_OWORD *)(inited + 16) = xmmword_1000136E0;
    *(void *)(inited + 32) = 0x73736572706D6F63LL;
    *(void *)(inited + 40) = 0xEA00000000006465LL;
    uint64_t v4 = sub_10000E17C();
    if (v1)
    {
      swift_bridgeObjectRelease(*(void *)(inited + 40));
      *(void *)(inited + 16) = 0LL;
      swift_setDeallocating(inited);
      return sub_10000E3B0();
    }

    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = v4;
    *(void *)(inited + 56) = v5;
    uint64_t v7 = (char *)&type metadata for Any + 8;
    int64_t v8 = (void *)inited;
  }

  else
  {
    uint64_t v7 = (char *)&type metadata for Any + 8;
    int64_t v8 = &_swiftEmptyArrayStorage;
  }

  return Dictionary.init(dictionaryLiteral:)(v8, &type metadata for String, v7, &protocol witness table for String);
}

uint64_t sub_10000E17C()
{
  uint64_t v0 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  sub_100003F80(&qword_10001DD28);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  id v13 = 0LL;
  id v2 = [v0 dataWithJSONObject:isa options:0 error:&v13];

  id v3 = v13;
  if (v2)
  {
    id v13 = 0LL;
    id v4 = v3;
    id v5 = [v2 compressedDataUsingAlgorithm:3 error:&v13];
    id v6 = v13;
    if (v5)
    {
      uint64_t v7 = v5;
      id v8 = v13;
      id v9 = [v7 base64EncodedStringWithOptions:0];
      static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    }

    else
    {
      id v11 = v13;
      _convertNSErrorToError(_:)(v6);

      swift_willThrow();
    }
  }

  else
  {
    id v10 = v13;
    sub_10000ECBC();

    swift_willThrow();
  }

  return sub_10000EBCC();
}

id sub_10000E310()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceDodMLPlugin();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10000E360()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceDodMLPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriInferenceDodMLPlugin()
{
  return objc_opt_self(&OBJC_CLASS___SiriInferenceDodMLPlugin);
}

uint64_t sub_10000E3B0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_100003F80(&qword_10001DD38);
  swift_arrayDestroy(v0 + 32, v1, v2);
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t sub_10000E400(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain(result);
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000E444(Swift::Int a1)
{
  if (a1 < 16) {
    return 0LL;
  }
  _StringGuts.grow(_:)(a1);
  return 0LL;
}

unint64_t sub_10000E488(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10000E6E4(a1, a2, v5);
}

unint64_t sub_10000E4EC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = type metadata accessor for UUID(0LL);
  sub_10000E98C( &qword_10001DDD0,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_10000E7C4(a1, v7);
}

void sub_10000E558(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003F80(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_10000B474();
}

uint64_t sub_10000E590(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

void sub_10000E598(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = v5;
  sub_10000E488(a2, a3);
  sub_10000EC18();
  Swift::Int v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v17 = v12;
  char v18 = v13;
  sub_100003F80(a5);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v16)) {
    goto LABEL_5;
  }
  unint64_t v19 = sub_10000E488(a2, a3);
  if ((v18 & 1) != (v20 & 1))
  {
LABEL_9:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return;
  }

  unint64_t v17 = v19;
LABEL_5:
  uint64_t v21 = *v7;
  if ((v18 & 1) != 0)
  {
    uint64_t v22 = v21[7];
    swift_bridgeObjectRelease(*(void *)(v22 + 8 * v17));
    *(void *)(v22 + 8 * v17) = a1;
    sub_10000EAEC();
  }

  else
  {
    sub_10000E69C(v17, a2, a3, a1, v21);
    swift_bridgeObjectRetain(a3);
  }

unint64_t sub_10000E69C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1LL << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1LL);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_10000E6E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
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
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_10000E7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v18 = a1;
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v10 = a2 & ~v9;
  if (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    char v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(void *)(v3 + 48) + v12 * v10, v5);
      sub_10000E98C( &qword_10001DDE8,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
    }

    while (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
  }

  return v10;
}

uint64_t sub_10000E904@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1LL;
  uint64_t v3 = -1LL << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1LL << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0LL;
  a2[4] = v2 & v5;
  return result;
}

_OWORD *sub_10000E93C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_10000E94C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003F80(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  sub_10000B474();
}

void sub_10000E98C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_10000B474();
}

uint64_t sub_10000E9C8(uint64_t a1)
{
  return sub_10000A1F8(a1, *(void *)(v1 - 272));
}

uint64_t sub_10000E9D4()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 408) + 8LL))( *(void *)(v0 - 392),  *(void *)(v0 - 328));
}

uint64_t sub_10000E9F4()
{
  return Logger.logObject.getter();
}

void sub_10000EA00()
{
  *(void *)(v1 - 256) = v0;
}

double sub_10000EA10@<D0>(_OWORD *a1@<X8>)
{
  return sub_10000D9FC(0x73736572706D6F63LL, 0xEA00000000006465LL, *(void *)(v1 - 504), a1);
}

void sub_10000EA34()
{
  *(void *)(v1 - 256) = v0;
}

unint64_t sub_10000EA60()
{
  return 0xD000000000000018LL;
}

uint64_t sub_10000EA88()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000EA90@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_10000EA98(uint64_t a1)
{
  return v1(a1, v2);
}

  ;
}

BOOL sub_10000EAAC(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10000EABC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, void)@<X8>)
{
  return a2(a1, *(void *)(v2 - 288));
}

uint64_t sub_10000EACC(uint64_t a1)
{
  return v1(a1, *(void *)(v2 - 288));
}

  ;
}

  ;
}

  ;
}

uint64_t sub_10000EB14(uint64_t a1)
{
  return v1(a1, v2);
}

  ;
}

  ;
}

  ;
}

uint64_t sub_10000EB4C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000EB54()
{
  return swift_release(*(void *)(v0 - 312));
}

uint64_t sub_10000EB60(uint64_t a1, unint64_t a2)
{
  return sub_10000404C(a1, a2, (uint64_t *)(v2 - 144));
}

uint64_t sub_10000EB6C@<X0>(uint64_t a1@<X8>)
{
  return swift_isUniquelyReferenced_nonNull_native(*(void *)(a1 - 256));
}

void sub_10000EB78(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

  ;
}

  ;
}

  ;
}

uint64_t sub_10000EBB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = a1;
  return *(void *)(v2 - 296);
}

uint64_t sub_10000EBCC()
{
  return v0;
}

uint64_t sub_10000EBD8@<X0>(uint64_t a1@<X8>)
{
  return swift_arrayDestroy(v1, 1LL, a1 + 8);
}

uint64_t sub_10000EBE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(a1, a2, a3, a4, 6LL);
}

  ;
}

  ;
}

  ;
}

__n128 sub_10000EC28(uint64_t a1)
{
  *(void *)(v2 - 144) = a1;
  __n128 result = *(__n128 *)(v2 - 352);
  _DWORD *v1 = result.n128_u32[0];
  return result;
}

void sub_10000EC40(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_10000EC48(uint64_t a1)
{
  return sub_10000E078(a1);
}

uint64_t sub_10000EC58()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000EC60()
{
  return dispatch thunk of RawRepresentable.rawValue.getter(v1, v0);
}

uint64_t sub_10000EC6C()
{
  return sub_10000A1F8(v1, v0);
}

  ;
}

  ;
}

  ;
}

uint64_t sub_10000EC9C()
{
  return sub_100003F80(v0);
}

void sub_10000ECA4(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

uint64_t sub_10000ECB0(uint64_t a1, unint64_t a2)
{
  return sub_10000404C(a1, a2, (uint64_t *)(v2 - 232));
}

uint64_t sub_10000ECBC()
{
  return _convertNSErrorToError(_:)(v0);
}

  ;
}

__n128 sub_10000ECDC(uint64_t a1)
{
  *(void *)(v1 - 232) = a1;
  return *(__n128 *)(v1 - 480);
}

uint64_t sub_10000ECF0()
{
  return swift_bridgeObjectRelease(0x8000000000000000LL);
}

uint64_t sub_10000ECF8(uint64_t a1)
{
  return v1(a1, v3, v2);
}

uint64_t sub_10000ED04()
{
  return swift_errorRelease(v0);
}

uint64_t sub_10000ED0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000667C(a1, 1LL, 1LL, a4);
}

uint64_t sub_10000ED18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return swift_dynamicCast(a1, a2, a3, *(void *)(a4 - 256), 7LL);
}

  ;
}

void sub_10000ED30()
{
  *(void *)(*(void *)(v0 + 56) + 8 * v1) = *(void *)(v2 - 552);
}

  ;
}

uint64_t sub_10000ED58()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10000ED60(uint64_t a1, uint64_t a2)
{
  return sub_10000667C(a1, a2, 1LL, v2);
}

uint64_t sub_10000ED6C()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_10000ED74()
{
  return sub_100003F80(v0);
}

uint64_t sub_10000ED7C()
{
  return swift_release(*(void *)(v0 - 296));
}

uint64_t sub_10000ED88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_1000066D0(a1, 1LL, v6) == 1)
  {
    sub_100010E04(a1, &qword_10001DE18);
    uint64_t v7 = 7168LL;
  }

  else
  {
    unsigned __int8 v8 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
    uint64_t v7 = v8 | 0x1C00LL;
  }

  uint64_t v9 = *(void *)(a3 + 16);
  if (v9)
  {
    uint64_t v10 = *(void *)(a3 + 24);
    uint64_t ObjectType = swift_getObjectType(*(void *)(a3 + 16));
    swift_unknownObjectRetain(v9);
    uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
    uint64_t v14 = v13;
    swift_unknownObjectRelease(v9);
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v14 = 0LL;
  }

  uint64_t v15 = swift_allocObject(&unk_1000191B0, 32LL, 7LL);
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  if (v14 | v12)
  {
    v18[0] = 0LL;
    v18[1] = 0LL;
    Swift::Int v16 = v18;
    v18[2] = v12;
    v18[3] = v14;
  }

  else
  {
    Swift::Int v16 = 0LL;
  }

  return swift_task_create(v7, v16, (char *)&type metadata for () + 8, &unk_10001DE38, v15);
}

uint64_t sub_10000EECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v28 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_10000673C();
  uint64_t v15 = v14 - v13;
  uint64_t v27 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v16 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  sub_10000673C();
  uint64_t v19 = v18 - v17;
  if (qword_10001D510 != -1) {
    swift_once(&qword_10001D510, sub_100009314);
  }
  char v20 = (void *)swift_allocObject(&unk_1000191D8, 64LL, 7LL);
  v20[2] = a1;
  v20[3] = a2;
  v20[4] = a3;
  v20[5] = a4;
  v20[6] = a5;
  v20[7] = a6;
  aBlock[4] = sub_100010D60;
  unint64_t v31 = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100003E80;
  aBlock[3] = &unk_1000191F0;
  uint64_t v21 = _Block_copy(aBlock);
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  uint64_t v22 = swift_retain(a6);
  static DispatchQoS.unspecified.getter(v22);
  uint64_t v29 = &_swiftEmptyArrayStorage;
  uint64_t v23 = sub_100008CD4( (unint64_t *)&qword_10001D568,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v24 = sub_100003F80(&qword_10001D570);
  unint64_t v25 = sub_100004854();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v29, v24, v25, v12, v23);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v19, v15, v21);
  _Block_release(v21);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v15, v12);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v19, v27);
  return swift_release(v31);
}

void sub_10000F0EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void, void))
{
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  uint64_t v8 = type metadata accessor for SiriRemembersStore(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for BackgroundQueue(0LL);
  uint64_t v12 = (void *)((uint64_t (*)(void))static BackgroundQueue.shared.getter)();
  dispatch thunk of BackgroundQueue.pause()();

  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  uint64_t v13 = type metadata accessor for Logger(0LL);
  uint64_t v14 = sub_100003F28(v13, (uint64_t)qword_10001E0D8);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    uint64_t v33 = v11;
    uint64_t v18 = a5;
    uint64_t v19 = v17;
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "running SiriRemembers.__internal_searchV0", v17, 2u);
    char v20 = v19;
    a5 = v18;
    uint64_t v11 = v33;
    swift_slowDealloc(v20, -1LL, -1LL);
  }

  SiriRemembersStore.init()();
  uint64_t v21 = SiriRemembersStore.findEntities(query:type:)(v34, v35, a3, a4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v22 = type metadata accessor for JSONEncoder(0LL);
  swift_allocObject(v22, *(unsigned int *)(v22 + 48), *(unsigned __int16 *)(v22 + 52));
  uint64_t v23 = JSONEncoder.init()();
  uint64_t v36 = v21;
  uint64_t v24 = sub_100003F80(&qword_10001DE48);
  unint64_t v25 = sub_100010D88();
  uint64_t v28 = dispatch thunk of JSONEncoder.encode<A>(_:)(&v36, v24, v25);
  unint64_t v30 = v29;
  swift_bridgeObjectRelease(v21);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10000A1F8(v28, v30);
  a5(isa, 0LL);
  swift_release(v23);

  uint64_t v27 = (void *)static BackgroundQueue.shared.getter(v26);
  dispatch thunk of BackgroundQueue.resume()();
}

void sub_10000F4A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)(a2);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void sub_10000F4F8(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for CoreAnalyticsMetric(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_100010EDC();
  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = sub_100003F28(v5, (uint64_t)qword_10001E0D8);
  uint64_t v7 = (void *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (sub_100010ECC(v8))
  {
    *(_WORD *)sub_100006768() = 0;
    sub_100010EA4((void *)&_mh_execute_header, v9, v10, "running accuracyLogging on daemon");
    sub_100010EF4();
  }

  uint64_t v11 = type metadata accessor for JSONDecoder(0LL);
  swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
  uint64_t v12 = JSONDecoder.init()();
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v15 = v14;
  uint64_t v16 = sub_100008CD4( &qword_10001DE40,  (uint64_t (*)(uint64_t))&type metadata accessor for CoreAnalyticsMetric,  (uint64_t)&protocol conformance descriptor for CoreAnalyticsMetric);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(v3, v13, v15, v3, v16);
  uint64_t v17 = sub_10000EC6C();
  CoreAnalyticsMetric.fullyQualifiedEventName.getter(v17);
  uint64_t v19 = v18;
  NSString v20 = String._bridgeToObjectiveC()();
  uint64_t v21 = swift_bridgeObjectRelease(v19);
  uint64_t v22 = CoreAnalyticsMetric.eventPayload()(v21);
  sub_100010CF0();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v22);
  AnalyticsSendEvent(v20, isa);
  swift_release(v12);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  sub_100010EB8();
}

void sub_10000F784(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (**a5)(void, uint64_t))
{
  uint64_t v49 = a5;
  uint64_t v42 = a2;
  uint64_t v43 = a3;
  uint64_t v6 = type metadata accessor for UserDonator(0LL);
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v46 = v6;
  __chkstk_darwin(v6);
  os_log_type_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v48 = type metadata accessor for Donation(0LL);
  uint64_t v9 = *(void *)(v48 - 8);
  uint64_t v10 = __chkstk_darwin(v48);
  uint64_t v44 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v40 - v12;
  uint64_t v14 = type metadata accessor for InteractionStore(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v47 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v16);
  uint64_t v50 = (char *)&v40 - v18;
  if (qword_10001D520 != -1) {
    swift_once(&qword_10001D520, sub_10000B380);
  }
  uint64_t v19 = type metadata accessor for Logger(0LL);
  uint64_t v20 = sub_100003F28(v19, (uint64_t)qword_10001E0A8);
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
  os_log_type_t v22 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    uint64_t v41 = v13;
    uint64_t v24 = a1;
    unint64_t v25 = v23;
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "saving interaction to SiriRemembers InteractionStore", v23, 2u);
    uint64_t v26 = v25;
    a1 = v24;
    uint64_t v13 = v41;
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  uint64_t v27 = static InteractionStore.writable()();
  INInteraction.asDonation()(v27);
  Donation.donate(_:)(v50);
  uint64_t v40 = *(void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v41 = a1;
  v40(v13, v48);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v15 + 8);
  v28(v50, v14);
  uint64_t v30 = v45;
  uint64_t v29 = v46;
  (*(void (**)(char *, void, uint64_t))(v45 + 104))(v8, enum case for UserDonator.defaultUser(_:), v46);
  static InteractionStore.viewService(user:)(v8);
  uint64_t v50 = (char *)v28;
  uint64_t v31 = (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v8, v29);
  uint64_t v32 = v44;
  INInteraction.asDonation()(v31);
  uint64_t v33 = v47;
  Donation.donateToSiriRemembersView(_:)(v47);
  uint64_t v34 = (uint64_t (*)(char *, uint64_t))v50;
  v40(v32, v48);
  uint64_t v35 = v34(v33, v14);
  uint64_t v36 = (os_log_s *)Logger.logObject.getter(v35);
  os_log_type_t v37 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v38 = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "saving interaction to legacy SiriRemembers", v38, 2u);
    swift_slowDealloc(v38, -1LL, -1LL);
  }

  static SiriRemembersV1API.__saveInternal(interaction:databasePath:)(v41, v42, v43);
  uint64_t v39 = v49;
  v49[2](v49, 1LL);
  _Block_release(v39);
}

void sub_10000FEE0(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void, void))
{
  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  uint64_t v7 = type metadata accessor for Logger(0LL);
  uint64_t v8 = sub_100003F28(v7, (uint64_t)qword_10001E0D8);
  uint64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "running FetchInteractions", v11, 2u);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  uint64_t v12 = type metadata accessor for BackgroundQueue(0LL);
  uint64_t v13 = (void *)static BackgroundQueue.shared.getter(v12);
  id v14 = [objc_allocWithZone((Class)type metadata accessor for AppIntentBackfiller(0)) init];
  [v13 addOperation:v14];

  static SiriRemembersV1API.__backfillInternal(databasePath:)(a1, a2);
  a4[2](a4, 1LL);
  _Block_release(a4);
}

uint64_t sub_100010258(uint64_t a1)
{
  uint64_t v3 = sub_100003F80(&qword_10001D6C8);
  __chkstk_darwin(v3);
  sub_100010EDC();
  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_100003F28(v4, (uint64_t)qword_10001E0D8);
  uint64_t v6 = (void *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (sub_100010ECC(v7))
  {
    *(_WORD *)sub_100006768() = 0;
    sub_100010EA4((void *)&_mh_execute_header, v8, v9, "running DBManager.overrideForIntegrationTests");
    sub_100010EF4();
  }

  uint64_t v10 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v1, a1, v10);
  swift_storeEnumTagMultiPayload(v1, v3, 0LL);
  return static SiriRemembersDB.defaultURL.setter(v1);
}

void sub_100010404(uint64_t a1, void (**a2)(void))
{
  uint64_t v3 = (void *)static BackgroundQueue.shared.getter();
  [v3 waitUntilAllOperationsAreFinished];

  a2[2](a2);
  _Block_release(a2);
}

void sub_1000104A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_100003F80(&qword_10001DE18);
  __chkstk_darwin(v12);
  sub_10000673C();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = type metadata accessor for TaskPriority(0LL);
  sub_10000667C(v15, 1LL, 1LL, v16);
  uint64_t v17 = (void *)swift_allocObject(&unk_100019188, 80LL, 7LL);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[4] = a1;
  v17[5] = a2;
  v17[6] = a3;
  v17[7] = a4;
  v17[8] = a5;
  v17[9] = a6;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  swift_retain(a6);
  uint64_t v18 = sub_10000ED88(v15, (uint64_t)&unk_10001DE28, (uint64_t)v17);
  swift_release(v18);
  sub_100010EB8();
}

uint64_t sub_100010584( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a8;
  v8[7] = v12;
  v8[4] = a6;
  v8[5] = a7;
  v8[2] = a4;
  v8[3] = a5;
  uint64_t v9 = type metadata accessor for UUID(0LL);
  v8[8] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[9] = v10;
  v8[10] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000105F0, 0LL, 0LL);
}

uint64_t sub_1000105F0()
{
  uint64_t v1 = v0[4];
  type metadata accessor for SearchTermAppsRanker(0LL);
  v0[11] = static SearchTermAppsRanker.shared.getter();
  v0[12] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100010690;
  return ((uint64_t (*)(void, void, void, uint64_t, BOOL, void))v4)( v0[10],  v0[2],  v0[3],  v1 & ~(v1 >> 63),  v1 < 1,  v0[5]);
}

uint64_t sub_100010690(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 88LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 96LL);
  *(void *)(*(void *)v1 + 104LL) = a1;
  swift_task_dealloc(v2);
  swift_release(v3);
  return swift_task_switch(sub_1000106F4, 0LL, 0LL);
}

uint64_t sub_1000106F4()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 64);
  (*(void (**)(uint64_t, uint64_t))(v0 + 48))(v1, v2);
  swift_bridgeObjectRelease(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10001083C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  Class v5 = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class, Class))(a3 + 16))(a3, isa, v5);
}

uint64_t sub_1000108A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = static SearchTermAppsRankerDataCollector.shared.getter();
  dispatch thunk of SearchTermAppsRankerDataCollector.appSelectedForSearchTerm(rankEventId:selectedAppBundleId:numberOfAppsShown:)( a1,  a2,  a3,  a4 & ~(a4 >> 63),  (unint64_t)a4 >> 63);
  return swift_release(v8);
}

id sub_100010A04()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceService();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100010A54()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriInferenceService()
{
  return objc_opt_self(&OBJC_CLASS____TtC14siriinferenced20SiriInferenceService);
}

uint64_t sub_100010AA4()
{
  return swift_deallocObject(v0, 80LL, 7LL);
}

uint64_t sub_100010AE0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc(dword_10001DE24);
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_100010B80;
  return sub_100010584(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100010B80()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100010BAC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100010C10;
  return v6(a1);
}

uint64_t sub_100010C10()
{
  return sub_100010E98(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100010C38()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100010C5C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10001DE34);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100010CCC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10001DE30 + dword_10001DE30))(a1, v4);
}

uint64_t sub_100010CCC()
{
  return sub_100010E98(*(uint64_t (**)(void))(v0 + 8));
}

unint64_t sub_100010CF0()
{
  unint64_t result = qword_10001DD70;
  if (!qword_10001DD70)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSObject);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001DD70);
  }

  return result;
}

uint64_t sub_100010D2C()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

void sub_100010D60()
{
}

uint64_t sub_100010D70(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100010D80(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_100010D88()
{
  unint64_t result = qword_10001DE50;
  if (!qword_10001DE50)
  {
    uint64_t v1 = sub_100004898(&qword_10001DE48);
    sub_100008CD4( &qword_10001DE58,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriRemembersV1API.Entity,  (uint64_t)&protocol conformance descriptor for SiriRemembersV1API.Entity);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001DE50);
  }

  return result;
}

uint64_t sub_100010E04(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003F80(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100010E40()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100010E64(uint64_t a1, uint64_t a2)
{
}

void sub_100010E6C(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_100010E78()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_100010E98(uint64_t (*a1)(void))
{
  return a1();
}

void sub_100010EA4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

  ;
}

BOOL sub_100010ECC(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

  ;
}

uint64_t sub_100010EF4()
{
  return swift_slowDealloc(v0, -1LL, -1LL);
}

uint64_t sub_100010F04(int a1, id a2)
{
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [a2 valueForEntitlement:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)(&v37, v4);
    swift_unknownObjectRelease(v4);
  }

  else
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
  }

  sub_1000112A4((uint64_t)&v37, (uint64_t)&v39);
  if (v41)
  {
    if ((swift_dynamicCast((char *)&v36 + 7, &v39, (char *)&type metadata for Any + 8, &type metadata for Bool, 6LL) & 1) != 0
      && (v36 & 0x100000000000000LL) != 0)
    {
      id v5 =  [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:&OBJC_PROTOCOL____TtP13SiriInference25SiriInferenceXPCInterface_];
      sub_100011370((uint64_t)v5, "setExportedInterface:");

      id v6 = [objc_allocWithZone((Class)type metadata accessor for SiriInferenceService()) init];
      sub_100011370((uint64_t)v6, "setExportedObject:");

      [a2 resume];
      if (qword_10001D530 != -1) {
        swift_once(&qword_10001D530, sub_10000B404);
      }
      uint64_t v7 = type metadata accessor for Logger(0LL);
      uint64_t v8 = sub_100003F28(v7, (uint64_t)qword_10001E0D8);
      uint64_t v9 = (void *)Logger.logObject.getter(v8);
      os_log_type_t v10 = static os_log_type_t.info.getter();
      if (!sub_100008D54(v10))
      {
        uint64_t v21 = 1LL;
        goto LABEL_18;
      }

      uint64_t v11 = (float *)sub_100011360();
      sub_10001132C( v11,  1.5282e-36,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v35,  v36,  v37,  *((uint64_t *)&v37 + 1),  v38,  *((uint64_t *)&v38 + 1),  v39,  v40);
      sub_10001134C((void *)&_mh_execute_header, v19, v20, "process [%{public}d] is connected to siriinferenced");
      uint64_t v21 = 1LL;
      goto LABEL_16;
    }
  }

  else
  {
    sub_1000112EC((uint64_t)&v39);
  }

  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  uint64_t v22 = type metadata accessor for Logger(0LL);
  uint64_t v23 = sub_100003F28(v22, (uint64_t)qword_10001E0D8);
  uint64_t v9 = (void *)Logger.logObject.getter(v23);
  os_log_type_t v24 = static os_log_type_t.error.getter();
  if (!sub_100008D54(v24))
  {
    uint64_t v21 = 0LL;
    goto LABEL_18;
  }

  uint64_t v11 = (float *)sub_100011360();
  sub_10001132C( v11,  1.5282e-36,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v35,  v36,  v37,  *((uint64_t *)&v37 + 1),  v38,  *((uint64_t *)&v38 + 1),  v39,  v40);
  sub_10001134C( (void *)&_mh_execute_header,  v32,  v33,  "process [%{public}d] is not entitled to call the Siri Inference SPI.\nAdd the proper entitlements and try again.");
  uint64_t v21 = 0LL;
LABEL_16:
  swift_slowDealloc(v11, -1LL, -1LL);
LABEL_18:

  return v21;
}

id sub_100011204()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceServiceDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100011254()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriInferenceServiceDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC14siriinferenced28SiriInferenceServiceDelegate);
}

uint64_t sub_1000112A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F80(&qword_10001DD50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000112EC(uint64_t a1)
{
  uint64_t v2 = sub_100003F80(&qword_10001DD50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10001132C( float *a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, char a17)
{
  *a1 = a2;
  a16 = v17;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(&a16, &a17, a1 + 1);
}

void sub_10001134C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_100011360()
{
  return swift_slowAlloc(8LL, -1LL);
}

id sub_100011370(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

void sub_10001137C(uint64_t a1, uint64_t a2, void (**a3)(void, uint64_t))
{
  char v40 = a3;
  uint64_t v35 = type metadata accessor for UserDonator(0LL);
  uint64_t v4 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  os_log_type_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for InteractionStore(0LL);
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v36 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v34 - v10;
  uint64_t v12 = type metadata accessor for Donation(0LL);
  uint64_t v39 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10001D520 != -1) {
    swift_once(&qword_10001D520, sub_10000B380);
  }
  uint64_t v15 = type metadata accessor for Logger(0LL);
  uint64_t v16 = sub_100003F28(v15, (uint64_t)qword_10001E0A8);
  int v17 = (os_log_s *)Logger.logObject.getter(v16);
  os_log_type_t v18 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "saving donation to InteractionStore", v19, 2u);
    swift_slowDealloc(v19, -1LL, -1LL);
  }

  type metadata accessor for ActivityHeartbeat(0LL);
  uint64_t v20 = static ActivityHeartbeat.instance.getter();
  dispatch thunk of ActivityHeartbeat.keepAlive()();
  swift_release(v20);
  uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a1);
  unint64_t v23 = v22;
  uint64_t v24 = type metadata accessor for JSONDecoder(0LL);
  swift_allocObject(v24, *(unsigned int *)(v24 + 48), *(unsigned __int16 *)(v24 + 52));
  uint64_t v25 = JSONDecoder.init()();
  unint64_t v26 = sub_1000119AC();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(v12, v21, v23, v12, v26);
  uint64_t v27 = swift_release(v25);
  static InteractionStore.writable()(v27);
  uint64_t v28 = Donation.donate(_:)(v11);
  Donation.userDonator.getter(v28);
  uint64_t v29 = v36;
  static InteractionStore.viewService(user:)(v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v35);
  uint64_t v30 = v29;
  Donation.donateToSiriRemembersView(_:)(v29);
  uint64_t v31 = v40;
  v40[2](v40, 1LL);
  sub_10000A1F8(v21, v23);
  uint64_t v32 = v38;
  uint64_t v33 = *(void (**)(char *, uint64_t))(v37 + 8);
  v33(v30, v38);
  v33(v11, v32);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v14, v12);
  _Block_release(v31);
}

id sub_10001190C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriRemembersService();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10001195C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriRemembersService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriRemembersService()
{
  return objc_opt_self(&OBJC_CLASS____TtC14siriinferenced20SiriRemembersService);
}

unint64_t sub_1000119AC()
{
  unint64_t result = qword_10001DF20;
  if (!qword_10001DF20)
  {
    uint64_t v1 = type metadata accessor for Donation(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Donation, v1);
    atomic_store(result, (unint64_t *)&qword_10001DF20);
  }

  return result;
}

uint64_t sub_1000119EC(int a1, id a2)
{
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [a2 valueForEntitlement:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)(&v37, v4);
    swift_unknownObjectRelease(v4);
  }

  else
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
  }

  sub_1000112A4((uint64_t)&v37, (uint64_t)&v39);
  if (v41)
  {
    if ((swift_dynamicCast((char *)&v36 + 7, &v39, (char *)&type metadata for Any + 8, &type metadata for Bool, 6LL) & 1) != 0
      && (v36 & 0x100000000000000LL) != 0)
    {
      id v5 =  [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:&OBJC_PROTOCOL____TtP13SiriRemembers25SiriRemembersXPCInterface_];
      sub_100011370((uint64_t)v5, "setExportedInterface:");

      id v6 = [objc_allocWithZone((Class)type metadata accessor for SiriRemembersService()) init];
      sub_100011370((uint64_t)v6, "setExportedObject:");

      [a2 resume];
      if (qword_10001D530 != -1) {
        swift_once(&qword_10001D530, sub_10000B404);
      }
      uint64_t v7 = type metadata accessor for Logger(0LL);
      uint64_t v8 = sub_100003F28(v7, (uint64_t)qword_10001E0D8);
      uint64_t v9 = (void *)Logger.logObject.getter(v8);
      os_log_type_t v10 = static os_log_type_t.info.getter();
      if (!sub_100008D54(v10))
      {
        uint64_t v21 = 1LL;
        goto LABEL_18;
      }

      uint64_t v11 = (float *)sub_100011360();
      sub_10001132C( v11,  1.5282e-36,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v35,  v36,  v37,  *((uint64_t *)&v37 + 1),  v38,  *((uint64_t *)&v38 + 1),  v39,  v40);
      sub_10001134C((void *)&_mh_execute_header, v19, v20, "process [%{public}d] is connected to siriinferenced");
      uint64_t v21 = 1LL;
      goto LABEL_16;
    }
  }

  else
  {
    sub_1000112EC((uint64_t)&v39);
  }

  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  uint64_t v22 = type metadata accessor for Logger(0LL);
  uint64_t v23 = sub_100003F28(v22, (uint64_t)qword_10001E0D8);
  uint64_t v9 = (void *)Logger.logObject.getter(v23);
  os_log_type_t v24 = static os_log_type_t.error.getter();
  if (!sub_100008D54(v24))
  {
    uint64_t v21 = 0LL;
    goto LABEL_18;
  }

  uint64_t v11 = (float *)sub_100011360();
  sub_10001132C( v11,  1.5282e-36,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v35,  v36,  v37,  *((uint64_t *)&v37 + 1),  v38,  *((uint64_t *)&v38 + 1),  v39,  v40);
  sub_10001134C( (void *)&_mh_execute_header,  v32,  v33,  "process [%{public}d] is not entitled to call the Siri Inference SPI.\nAdd the proper entitlements and try again.");
  uint64_t v21 = 0LL;
LABEL_16:
  swift_slowDealloc(v11, -1LL, -1LL);
LABEL_18:

  return v21;
}

id sub_100011CEC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriRemembersServiceDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100011D3C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriRemembersServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriRemembersServiceDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC14siriinferenced28SiriRemembersServiceDelegate);
}

void *sub_100011D8C()
{
  uint64_t v1 = v0;
  if (qword_10001D520 != -1) {
    swift_once(&qword_10001D520, sub_10000B380);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_100003F28(v2, (uint64_t)qword_10001E0A8);
  id v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)sub_100006768();
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Initializing SiriRolloutsMonitor", v6, 2u);
    sub_1000048DC((uint64_t)v6);
  }

  uint64_t v7 = (objc_class *)type metadata accessor for ExperimentationAnalyticsManager(0LL);
  id v8 = [objc_allocWithZone(v7) init];
  v1[5] = v7;
  v1[6] = &protocol witness table for ExperimentationAnalyticsManager;
  v1[2] = v8;
  return v1;
}

void sub_100011E7C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_10001D520 != -1) {
    swift_once(&qword_10001D520, sub_10000B380);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_100003F28(v4, (uint64_t)qword_10001E0A8);
  id v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)sub_100006768();
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Registering SiriRolloutsMonitor activity", v8, 2u);
    sub_1000048DC((uint64_t)v8);
  }

  sub_100011FD4(v2 + 16, (uint64_t)v11);
  id v9 = objc_allocWithZone((Class)type metadata accessor for RolloutsAnalyticsActivity(0LL));
  os_log_type_t v10 = (void *)RolloutsAnalyticsActivity.init(analyticsManager:)(v11);
  [a1 addOperation:v10];
}

uint64_t sub_100011F90()
{
  return swift_deallocClassInstance(v0, 56LL, 7LL);
}

uint64_t type metadata accessor for SiriRolloutsMonitor()
{
  return objc_opt_self(&OBJC_CLASS____TtC14siriinferenced19SiriRolloutsMonitor);
}

uint64_t sub_100011FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100012018(int a1, id a2)
{
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [a2 valueForEntitlement:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)(&v41, v4);
    swift_unknownObjectRelease(v4);
  }

  else
  {
    __int128 v41 = 0u;
    __int128 v42 = 0u;
  }

  sub_1000112A4((uint64_t)&v41, (uint64_t)&v43);
  if (v45)
  {
    if ((swift_dynamicCast((char *)&v40 + 7, &v43, (char *)&type metadata for Any + 8, &type metadata for Bool, 6LL) & 1) != 0
      && (v40 & 0x100000000000000LL) != 0)
    {
      if (qword_10001D528 != -1) {
        swift_once(&qword_10001D528, sub_10000B38C);
      }
      uint64_t v5 = type metadata accessor for Logger(0LL);
      id v6 = (os_log_s *)sub_100008D24(v5, (uint64_t)qword_10001E0C0);
      os_log_type_t v7 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v6, v7))
      {
        id v8 = (uint8_t *)sub_100006768();
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "made the connection", v8, 2u);
        sub_1000048DC((uint64_t)v8);
      }

      id v9 =  [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:&OBJC_PROTOCOL____TtP11SiriSignals23SiriSignalsXPCInterface_];
      sub_100012498((uint64_t)v9, "setExportedInterface:");

      id v10 = [objc_allocWithZone((Class)type metadata accessor for SiriSignalsService(0)) init];
      sub_100012498((uint64_t)v10, "setExportedObject:");

      uint64_t v11 = (os_log_s *)Logger.logObject.getter([a2 resume]);
      os_log_type_t v12 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = (uint8_t *)sub_100006768();
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "resumed the connection", v13, 2u);
        sub_1000048DC((uint64_t)v13);
      }

      if (qword_10001D530 != -1) {
        swift_once(&qword_10001D530, sub_10000B404);
      }
      uint64_t v14 = (void *)sub_100008D24(v5, (uint64_t)qword_10001E0D8);
      os_log_type_t v15 = static os_log_type_t.info.getter();
      if (!sub_100008D54(v15))
      {
        uint64_t v26 = 1LL;
        goto LABEL_24;
      }

      uint64_t v16 = (float *)sub_100011360();
      sub_10001132C( v16,  1.5282e-36,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v39,  v40,  v41,  *((uint64_t *)&v41 + 1),  v42,  *((uint64_t *)&v42 + 1),  v43,  v44);
      sub_10001134C((void *)&_mh_execute_header, v24, v25, "process [%{public}d] is connected to siriinferenced");
      uint64_t v26 = 1LL;
      goto LABEL_22;
    }
  }

  else
  {
    sub_1000112EC((uint64_t)&v43);
  }

  if (qword_10001D530 != -1) {
    swift_once(&qword_10001D530, sub_10000B404);
  }
  uint64_t v27 = type metadata accessor for Logger(0LL);
  uint64_t v14 = (void *)sub_100008D24(v27, (uint64_t)qword_10001E0D8);
  os_log_type_t v28 = static os_log_type_t.error.getter();
  if (!sub_100008D54(v28))
  {
    uint64_t v26 = 0LL;
    goto LABEL_24;
  }

  uint64_t v16 = (float *)sub_100011360();
  sub_10001132C( v16,  1.5282e-36,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  v39,  v40,  v41,  *((uint64_t *)&v41 + 1),  v42,  *((uint64_t *)&v42 + 1),  v43,  v44);
  sub_10001134C( (void *)&_mh_execute_header,  v36,  v37,  "process [%{public}d] is not entitled to call the Siri Inference SPI.\nAdd the proper entitlements and try again.");
  uint64_t v26 = 0LL;
LABEL_22:
  sub_1000048DC((uint64_t)v16);
LABEL_24:

  return v26;
}

id sub_1000123F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriSignalsServiceDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100012448()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriSignalsServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriSignalsServiceDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC14siriinferenced26SiriSignalsServiceDelegate);
}

id sub_100012498(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

void sub_1000124A4()
{
  id v0 = [(id)objc_opt_self(NSFileManager) defaultManager];
  URL.path.getter();
  uint64_t v2 = v1;
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  LODWORD(v2) = [v0 fileExistsAtPath:v3];

  if ((_DWORD)v2)
  {
    URL._bridgeToObjectiveC()(v4);
    id v6 = v5;
    id v11 = 0LL;
    unsigned int v7 = [v0 removeItemAtURL:v5 error:&v11];

    id v8 = v11;
    if (v7)
    {
      id v9 = v11;
    }

    else
    {
      id v10 = v11;
      _convertNSErrorToError(_:)(v8);

      swift_willThrow();
    }
  }
}

uint64_t sub_1000125C4()
{
  uint64_t v0 = String.utf8CString.getter();
  uint64_t v1 = realpath_DARWIN_EXTSN((const char *)(v0 + 32), 0LL);
  swift_release(v0);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = String.init(cString:)(v1);
  swift_slowDealloc(v1, -1LL, -1LL);
  return v2;
}

uint64_t getEnumTagSinglePayload for UnwrapError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for UnwrapError(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_1000126D0 + 4 * asc_100013A6C[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1000126F0 + 4 * byte_100013A71[v4]))();
  }
}

_BYTE *sub_1000126D0(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1000126F0(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000126F8(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100012700(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100012708(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_100012710(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_10001271C()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for UnwrapError()
{
  return &type metadata for UnwrapError;
}

BOOL sub_100012734(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100018CE0, v2);
  swift_bridgeObjectRelease(object);
  return v3 != 0;
}

uint64_t sub_100012778()
{
  return 0x6570706172776E75LL;
}

BOOL sub_1000127A8@<W0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  BOOL result = sub_100012734(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000127DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100012778();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100012804()
{
  unint64_t result = qword_10001E038;
  if (!qword_10001E038)
  {
    unint64_t result = swift_getWitnessTable(&unk_100013B00, &type metadata for UnwrapError);
    atomic_store(result, (unint64_t *)&qword_10001E038);
  }

  return result;
}
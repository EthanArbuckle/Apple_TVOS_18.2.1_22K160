uint64_t sub_100004B10()
{
  if (qword_100016C50 != -1) {
    dispatch_once(&qword_100016C50, &stru_100010698);
  }
  return byte_100016C58;
}

void sub_100004B50(id a1)
{
  byte_100016C58 = MGGetBoolAnswer(@"GdXjx1ixZYvN9Gg8iSf68A");
}

void sub_100004B74(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100004B80(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_100004C08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_100004C30(void *a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (qword_100016320 != -1) {
    swift_once(&qword_100016320, sub_100008764);
  }
  uint64_t v7 = (os_log_s *)qword_100016D90;
  if (os_log_type_enabled((os_log_t)qword_100016D90, v6))
  {
    id v8 = a1;
    uint64_t v18 = a3;
    uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v16 = swift_slowAlloc(32LL, -1LL);
    uint64_t v20 = v16;
    *(_DWORD *)uint64_t v9 = 136315138;
    char v10 = a1;
    id v11 = [v8 requestIdentifier];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    uint64_t v17 = a2;
    unint64_t v14 = v13;

    a1 = v10;
    uint64_t v19 = sub_10000B438(v12, v14, &v20);
    a3 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20);

    unint64_t v15 = v14;
    a2 = v17;
    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v7, v6, "[Client] postBanner %s", v9, 0xCu);
    swift_arrayDestroy(v16, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  sub_100007B14(a1, a2, a3);
}

void sub_100004E90(uint64_t a1, uint64_t a2)
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

uint64_t sub_100004FD0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (qword_100016320 != -1) {
    swift_once(&qword_100016320, sub_100008764);
  }
  uint64_t v9 = (os_log_s *)qword_100016D90;
  if (os_log_type_enabled((os_log_t)qword_100016D90, v8))
  {
    swift_bridgeObjectRetain_n(a2, 2LL);
    char v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v11 = swift_slowAlloc(32LL, -1LL);
    uint64_t v14 = v11;
    *(_DWORD *)char v10 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v13 = sub_10000B438(a1, a2, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "[MainServer] revokeBanner %s", v10, 0xCu);
    swift_arrayDestroy(v11, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  return sub_100009114(a1, a2, 0x757165722044524DLL, 0xEB00000000747365LL, a3, a4);
}

id sub_10000523C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result = [*(id *)(v3 + OBJC_IVAR____TtC13MediaRemoteUI6Client_connection) remoteTarget];
  if (result)
  {
    id v8 = result;
    _bridgeAnyObjectToAny(_:)(v18);
    swift_unknownObjectRelease(v8);
    sub_1000086F0(v18, v19);
    uint64_t v9 = sub_100007AA4(&qword_100016788);
    swift_dynamicCast(&v17, v19, (char *)&type metadata for Any + 8, v9, 7LL);
    char v10 = v17;
    NSString v11 = String._bridgeToObjectiveC()();
    Class isa = UInt._bridgeToObjectiveC()().super.super.isa;
    [v10 bannerWithIdentifier:v11 postedEvent:isa];

    if (a3 == 2)
    {
      uint64_t v13 = a1;
      uint64_t v14 = a2;
      uint64_t v15 = 0x65727020676E6F6CLL;
      uint64_t v16 = 0xEC00000064657373LL;
    }

    else
    {
      if (a3 != 1) {
        return (id)swift_unknownObjectRelease(v10);
      }
      uint64_t v13 = a1;
      uint64_t v14 = a2;
      uint64_t v15 = 0x646570706174LL;
      uint64_t v16 = 0xE600000000000000LL;
    }

    sub_100009114(v13, v14, v15, v16, 0LL, 0LL);
    return (id)swift_unknownObjectRelease(v10);
  }

  __break(1u);
  return result;
}

id sub_100005418()
{
  return sub_1000067F0(0LL, (uint64_t (*)(void))type metadata accessor for Client);
}

uint64_t sub_100005488()
{
  return type metadata accessor for Client(0LL);
}

uint64_t type metadata accessor for Client(uint64_t a1)
{
  uint64_t result = qword_1000165C0;
  if (!qword_1000165C0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for Client);
  }
  return result;
}

uint64_t sub_1000054CC(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  uint64_t result = type metadata accessor for UUID(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 3LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_10000554C()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [(id)objc_opt_self(BSMutableServiceInterface) interfaceWithIdentifier:v0];

  uint64_t v2 = (void *)objc_opt_self(&OBJC_CLASS___BSObjCProtocol);
  id v3 = [v2 protocolForProtocol:&OBJC_PROTOCOL___MRUIServerProtocol];
  [v1 setServer:v3];

  id v4 = [v2 protocolForProtocol:&OBJC_PROTOCOL___MRUIClientProtocol];
  [v1 setClient:v4];

  [v1 setClientMessagingExpectation:0];
  id v5 = [v1 copy];
  _bridgeAnyObjectToAny(_:)(v9);

  swift_unknownObjectRelease(v5);
  uint64_t v6 = sub_1000086B8(0LL, &qword_100016780, &OBJC_CLASS___BSServiceInterface_ptr);
  swift_dynamicCast(&v8, v9, (char *)&type metadata for Any + 8, v6, 7LL);
  return v8;
}

id sub_1000056BC()
{
  id v1 = v0;
  uint64_t v22 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v2 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  id v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v8);
  char v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)&v1[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_allowedBundleIDs] = &off_100010780;
  uint64_t v21 = OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue;
  uint64_t v20 = sub_1000086B8(0LL, (unint64_t *)&qword_100016760, &OBJC_CLASS___OS_dispatch_queue_ptr);
  NSString v11 = v1;
  static DispatchQoS.userInitiated.getter();
  v24 = &_swiftEmptyArrayStorage;
  uint64_t v12 = sub_100008638( &qword_100016768,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v13 = sub_100007AA4(&qword_100016770);
  uint64_t v14 = sub_100008678(&qword_100016778, &qword_100016770);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v24, v13, v14, v5, v12);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))( v4,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v22);
  uint64_t v15 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000027LL,  0x800000010000D400LL,  v10,  v7,  v4,  0LL);
  *(void *)&v1[v21] = v15;
  *(void *)&v11[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_listener] = 0LL;
  *(void *)&v11[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_clients] = &_swiftEmptySetSingleton;
  uint64_t v16 = OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_interface;
  *(void *)&v11[v16] = sub_10000554C();

  uint64_t v17 = static os_log_type_t.default.getter();
  if (qword_100016320 != -1) {
    swift_once(&qword_100016320, sub_100008764);
  }
  os_log(_:dso:log:_:_:)( v17,  &_mh_execute_header,  qword_100016D90,  "[ClientConnectionManager] init",  30LL,  2LL,  &_swiftEmptyArrayStorage);
  uint64_t v18 = (objc_class *)type metadata accessor for ClientConnectionManager();
  v23.receiver = v11;
  v23.super_class = v18;
  return objc_msgSendSuper2(&v23, "init");
}

id sub_100005980()
{
  uint64_t v1 = swift_allocObject(&unk_1000107E0, 32LL, 7LL);
  *(void *)(v1 + 16) = sub_100007AE4;
  *(void *)(v1 + 24) = &v8;
  aBlock[4] = sub_100008760;
  uint64_t v10 = v1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100005B6C;
  aBlock[3] = &unk_1000107F8;
  uint64_t v2 = _Block_copy(aBlock);
  uint64_t v3 = (void *)objc_opt_self(&OBJC_CLASS___BSServiceConnectionListener);
  swift_retain(v1);
  id v4 = [v3 listenerWithConfigurator:v2];
  _Block_release(v2);
  swift_release(v10);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation(v1, "", 0LL, 0LL, 0LL, 1LL);
  id result = (id)swift_release(v1);
  if ((v2 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v6 = OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_listener;
    uint64_t v7 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_listener);
    *(void *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_listener) = v4;

    id result = *(id *)(v0 + v6);
    if (result) {
      return [result activate];
    }
  }

  __break(1u);
  return result;
}

id sub_100005AC0(void *a1, uint64_t a2)
{
  NSString v4 = String._bridgeToObjectiveC()();
  [a1 setDomain:v4];

  NSString v5 = String._bridgeToObjectiveC()();
  [a1 setService:v5];

  return [a1 setDelegate:a2];
}

uint64_t sub_100005B70(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0LL;
  }
  uint64_t v7 = a3[4];
  uint64_t v8 = a3[5];
  if (v7 == a1 && v8 == a2) {
    return 1LL;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0LL);
  if ((result & 1) != 0) {
    return 1LL;
  }
  if (v3 == 1) {
    return 0LL;
  }
  NSString v11 = a3 + 7;
  for (uint64_t i = 1LL; ; ++i)
  {
    uint64_t v13 = i + 1;
    if (__OFADD__(i, 1LL)) {
      break;
    }
    uint64_t v14 = *(v11 - 1);
    uint64_t v15 = *v11;
    BOOL v16 = v14 == a1 && v15 == a2;
    if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0LL) & 1) != 0) {
      return 1LL;
    }
    uint64_t result = 0LL;
    v11 += 2;
    if (v13 == v3) {
      return result;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_100005C34(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_100005C60(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = [(id)objc_opt_self(BSServiceQuality) userInitiated];
  [a1 setServiceQuality:v6];

  [a1 setInterface:*(void *)(a2 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_interface)];
  [a1 setInterfaceTarget:a3];
  uint64_t v7 = swift_allocObject(&unk_1000108F8, 24LL, 7LL);
  swift_unknownObjectUnownedInit(v7 + 16, a2);
  uint64_t v8 = swift_allocObject(&unk_100010920, 24LL, 7LL);
  swift_unknownObjectUnownedInit(v8 + 16, a3);
  uint64_t v9 = swift_allocObject(&unk_100010948, 32LL, 7LL);
  *(void *)(v9 + 16) = v7;
  *(void *)(v9 + 24) = v8;
  v11[4] = sub_1000085F8;
  uint64_t v12 = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256LL;
  v11[2] = sub_1000061E4;
  v11[3] = &unk_100010960;
  uint64_t v10 = _Block_copy(v11);
  swift_release(v12);
  [a1 setInvalidationHandler:v10];
  _Block_release(v10);
}

uint64_t sub_100005DE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v21 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  NSString v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Strong = (char *)swift_unknownObjectUnownedLoadStrong(a2 + 16);
  id v13 = *(id *)&Strong[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue];

  uint64_t v14 = swift_allocObject(&unk_100010998, 32LL, 7LL);
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = a2;
  aBlock[4] = sub_100008630;
  uint64_t v24 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100005C34;
  aBlock[3] = &unk_1000109B0;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain(a3);
  uint64_t v16 = swift_retain(a2);
  static DispatchQoS.unspecified.getter(v16);
  uint64_t v22 = &_swiftEmptyArrayStorage;
  uint64_t v17 = sub_100008638( (unint64_t *)&qword_1000166E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v18 = sub_100007AA4(&qword_1000166F0);
  uint64_t v19 = sub_100008678((unint64_t *)&qword_1000166F8, &qword_1000166F0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v22, v18, v19, v5, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v11, v7, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release(v24);
}

void sub_100005FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 16;
  os_log_type_t v5 = static os_log_type_t.default.getter(a1);
  if (qword_100016320 != -1) {
    swift_once(&qword_100016320, sub_100008764);
  }
  uint64_t v6 = (os_log_s *)qword_100016D90;
  if (os_log_type_enabled((os_log_t)qword_100016D90, v5))
  {
    swift_retain_n(a1, 2LL);
    uint64_t v18 = a2;
    uint64_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v8 = swift_slowAlloc(32LL, -1LL);
    uint64_t v21 = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    Strong = (void *)swift_unknownObjectUnownedLoadStrong(v4);
    id v10 = [Strong description];
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    uint64_t v19 = v4;
    unint64_t v13 = v12;

    uint64_t v14 = v11;
    a2 = v18;
    uint64_t v20 = sub_10000B438(v14, v13, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21);
    swift_release_n(a1, 2LL);
    unint64_t v15 = v13;
    uint64_t v4 = v19;
    swift_bridgeObjectRelease(v15);
    _os_log_impl( (void *)&_mh_execute_header,  v6,  v5,  "[ClientConnectionManager] client %{public}s invalidated",  v7,  0xCu);
    swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  uint64_t v16 = (void *)swift_unknownObjectUnownedLoadStrong(a2 + 16);
  uint64_t v17 = (void *)swift_unknownObjectUnownedLoadStrong(v4);
  sub_10000656C(v17);
}

void sub_1000061E4(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

uint64_t sub_100006234(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain(a2);
  v3(a2);
  return swift_unknownObjectRelease(a2);
}

void sub_1000062F0(void *a1)
{
  uint64_t v3 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (uint64_t *)((char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue);
  *uint64_t v6 = v7;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, enum case for DispatchPredicate.onQueue(_:), v3);
  id v8 = v7;
  LOBYTE(v7) = _dispatchPreconditionTest(_:)(v6);
  uint64_t v9 = (*(uint64_t (**)(void *, uint64_t))(v4 + 8))(v6, v3);
  if ((v7 & 1) != 0)
  {
    LOBYTE(v6) = static os_log_type_t.default.getter(v9);
    if (qword_100016320 == -1) {
      goto LABEL_3;
    }
  }

  else
  {
    __break(1u);
  }

  swift_once(&qword_100016320, sub_100008764);
LABEL_3:
  id v10 = (os_log_s *)qword_100016D90;
  if (os_log_type_enabled((os_log_t)qword_100016D90, (os_log_type_t)v6))
  {
    id v11 = a1;
    uint64_t v23 = v1;
    id v12 = v11;
    unint64_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v14 = swift_slowAlloc(32LL, -1LL);
    uint64_t v24 = a1;
    v25[0] = v14;
    uint64_t v15 = v14;
    *(_DWORD *)unint64_t v13 = 136446210;
    id v16 = v12;
    id v17 = [v16 description];
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    unint64_t v20 = v19;

    Swift::Int v26 = sub_10000B438(v18, v20, v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);

    uint64_t v1 = v23;
    swift_bridgeObjectRelease(v20);
    _os_log_impl( (void *)&_mh_execute_header,  v10,  (os_log_type_t)v6,  "[ClientConnectionManager] adding client %{public}s",  v13,  0xCu);
    swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v21 = v15;
    a1 = v24;
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  swift_beginAccess(v1 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_clients, v25, 33LL, 0LL);
  sub_1000068A8(&v26, a1);
  uint64_t v22 = (void *)v26;
  swift_endAccess(v25);
}

void sub_10000656C(void *a1)
{
  uint64_t v3 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (uint64_t *)((char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue);
  *uint64_t v6 = v7;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, enum case for DispatchPredicate.onQueue(_:), v3);
  id v8 = v7;
  LOBYTE(v7) = _dispatchPreconditionTest(_:)(v6);
  uint64_t v9 = (*(uint64_t (**)(void *, uint64_t))(v4 + 8))(v6, v3);
  if ((v7 & 1) != 0)
  {
    LOBYTE(v6) = static os_log_type_t.default.getter(v9);
    if (qword_100016320 == -1) {
      goto LABEL_3;
    }
  }

  else
  {
    __break(1u);
  }

  swift_once(&qword_100016320, sub_100008764);
LABEL_3:
  id v10 = (os_log_s *)qword_100016D90;
  if (os_log_type_enabled((os_log_t)qword_100016D90, (os_log_type_t)v6))
  {
    id v11 = a1;
    uint64_t v23 = v1;
    id v12 = v11;
    unint64_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v14 = swift_slowAlloc(32LL, -1LL);
    uint64_t v24 = a1;
    uint64_t v15 = v14;
    v26[0] = v14;
    *(_DWORD *)unint64_t v13 = 136446210;
    id v16 = v12;
    id v17 = [v16 description];
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    unint64_t v20 = v19;

    uint64_t v25 = sub_10000B438(v18, v20, v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26);

    uint64_t v1 = v23;
    swift_bridgeObjectRelease(v20);
    _os_log_impl( (void *)&_mh_execute_header,  v10,  (os_log_type_t)v6,  "[ClientConnectionManager] removing client %{public}s",  v13,  0xCu);
    swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v21 = v15;
    a1 = v24;
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  swift_beginAccess(v1 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_clients, v26, 33LL, 0LL);
  uint64_t v22 = (void *)sub_1000075B8(a1);
  swift_endAccess(v26);
}

id sub_1000067E4(uint64_t a1)
{
  return sub_1000067F0(a1, type metadata accessor for ClientConnectionManager);
}

id sub_1000067F0(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for ClientConnectionManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC13MediaRemoteUI23ClientConnectionManager);
}

uint64_t sub_1000068A8(Swift::Int *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001LL) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*v2);
    id v8 = a2;
    uint64_t v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      uint64_t v31 = v9;
      uint64_t v10 = type metadata accessor for Client(0LL);
      swift_unknownObjectRetain(v9);
      swift_dynamicCast(&v32, &v31, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
      *a1 = v32;
      swift_unknownObjectRelease(v9);
      return 0LL;
    }

    uint64_t result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1LL))
    {
      __break(1u);
      return result;
    }

    Swift::Int v23 = sub_100006B24(v7, result + 1);
    Swift::Int v32 = v23;
    unint64_t v24 = *(void *)(v23 + 16);
    if (*(void *)(v23 + 24) <= v24)
    {
      uint64_t v29 = v24 + 1;
      id v30 = v8;
      sub_100006D08(v29);
      uint64_t v25 = v32;
    }

    else
    {
      uint64_t v25 = v23;
      id v26 = v8;
    }

    sub_100006FA4((uint64_t)v8, v25);
    uint64_t v28 = *v3;
    *uint64_t v3 = v25;
  }

  else
  {
    Swift::Int v12 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    Swift::Int v13 = NSObject._rawHashValue(seed:)(v12);
    uint64_t v14 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v15 = v13 & ~v14;
    if (((*(void *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) != 0)
    {
      type metadata accessor for Client(0LL);
      id v16 = *(id *)(*(void *)(v6 + 48) + 8 * v15);
      char v17 = static NSObject.== infix(_:_:)();

      if ((v17 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        uint64_t v21 = *(void **)(*(void *)(*v3 + 48) + 8 * v15);
        *a1 = (Swift::Int)v21;
        id v22 = v21;
        return 0LL;
      }

      uint64_t v18 = ~v14;
      while (1)
      {
        unint64_t v15 = (v15 + 1) & v18;
        if (((*(void *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) == 0) {
          break;
        }
        id v19 = *(id *)(*(void *)(v6 + 48) + 8 * v15);
        char v20 = static NSObject.== infix(_:_:)();

        if ((v20 & 1) != 0) {
          goto LABEL_12;
        }
      }
    }

    swift_bridgeObjectRelease(v6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    Swift::Int v32 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    id v8 = a2;
    sub_100007024((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    uint64_t v28 = *v3;
    *uint64_t v3 = v32;
  }

  swift_bridgeObjectRelease(v28);
  *a1 = (Swift::Int)v8;
  return 1LL;
}

Swift::Int sub_100006B24(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100007AA4(&qword_100016680);
    uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    uint64_t v23 = v4;
    uint64_t v5 = __CocoaSet.makeIterator()(a1);
    uint64_t v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = type metadata accessor for Client(0LL);
      do
      {
        uint64_t v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
        uint64_t v4 = v23;
        unint64_t v16 = *(void *)(v23 + 16);
        if (*(void *)(v23 + 24) <= v16)
        {
          sub_100006D08(v16 + 1);
          uint64_t v4 = v23;
        }

        uint64_t v9 = v22;
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
        uint64_t v11 = v4 + 56;
        uint64_t v12 = -1LL << *(_BYTE *)(v4 + 32);
        unint64_t v13 = result & ~v12;
        unint64_t v14 = v13 >> 6;
        if (((-1LL << v13) & ~*(void *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          unint64_t v15 = __clz(__rbit64((-1LL << v13) & ~*(void *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v17 = 0;
          unint64_t v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v19 = v14 == v18;
            if (v14 == v18) {
              unint64_t v14 = 0LL;
            }
            v17 |= v19;
            uint64_t v20 = *(void *)(v11 + 8 * v14);
          }

          while (v20 == -1);
          unint64_t v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }

        *(void *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
        *(void *)(*(void *)(v4 + 48) + 8 * v15) = v9;
        ++*(void *)(v4 + 16);
        uint64_t v7 = __CocoaSet.Iterator.next()();
      }

      while (v7);
    }

    swift_release(v5);
  }

  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }

  return v4;
}

Swift::Int sub_100006D08(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100007AA4(&qword_100016680);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    id v30 = v2;
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v8 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1LL << v7);
    }
    else {
      uint64_t v9 = -1LL;
    }
    unint64_t v10 = v9 & *(void *)(v3 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    Swift::Int result = swift_retain(v3);
    int64_t v14 = 0LL;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }

      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v18 >= v11) {
          goto LABEL_36;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_36;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_36;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                uint64_t v2 = v30;
                uint64_t v29 = 1LL << *(_BYTE *)(v3 + 32);
                if (v29 > 63) {
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v8 = -1LL << v29;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v14 >= v11) {
                    goto LABEL_36;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v14 = v20;
            }
          }
        }

LABEL_26:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }

      uint64_t v21 = *(void *)(*(void *)(v3 + 48) + 8 * v17);
      Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v6 + 40));
      uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0LL;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }

        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }

      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }

  Swift::Int result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    uint64_t v21 = *(void *)(v6 + 40);
    uint64_t v22 = *(id *)(*(void *)(v3 + 48) + 8 * v17);
    Swift::Int result = NSObject._rawHashValue(seed:)(v21);
    unint64_t v23 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v24 = result & ~v23;
    char v25 = v24 >> 6;
    if (((-1LL << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1LL << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      unint64_t v26 = 0;
      BOOL v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        uint64_t v28 = v25 == v27;
        if (v25 == v27) {
          char v25 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v25);
      }

      while (v29 == -1);
      unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }

    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v22;
    ++*(void *)(v6 + 16);
  }

  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    Swift::Int result = swift_release_n(v3, 2LL);
    uint64_t v2 = v30;
    goto LABEL_38;
  }

  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_26;
  }

  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }

unint64_t sub_100006FA4(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40));
  unint64_t result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1LL << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1LL << *(_BYTE *)(a2 + 32)));
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_100007024(uint64_t a1, unint64_t a2, char a3)
{
  Swift::Int v4 = v3;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100006D08(v9);
  }

  else
  {
    if (v8 > v7)
    {
      sub_100007198();
      goto LABEL_14;
    }

    sub_100007340(v9);
  }

  uint64_t v10 = *v3;
  Swift::Int v11 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v12 = -1LL << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v13 = type metadata accessor for Client(0LL);
    id v14 = *(id *)(*(void *)(v10 + 48) + 8 * a2);
    char v15 = static NSObject.== infix(_:_:)();

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }

    else
    {
      uint64_t v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v10 + 48) + 8 * a2);
        char v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0) {
          goto LABEL_13;
        }
      }
    }
  }

LABEL_14:
  uint64_t v19 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(void *)(*(void *)(v19 + 48) + 8 * a2) = a1;
  uint64_t v20 = *(void *)(v19 + 16);
  BOOL v21 = __OFADD__(v20, 1LL);
  uint64_t v22 = v20 + 1;
  if (v21) {
    __break(1u);
  }
  else {
    *(void *)(v19 + 16) = v22;
  }
}

id sub_100007198()
{
  uint64_t v1 = v0;
  sub_100007AA4(&qword_100016680);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }

LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    id v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }

  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }

LABEL_30:
  __break(1u);
  return result;
}

  id result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

Swift::Int sub_100007340(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100007AA4(&qword_100016680);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
    return result;
  }

  id v30 = v2;
  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v8 = v3 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1LL << v7);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v3 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }

    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v18 >= v11) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_36;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_36;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }

LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1000075B8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((*v1 & 0xC000000000000001LL) != 0)
  {
    if (v4 < 0) {
      uint64_t v5 = *v1;
    }
    else {
      uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v4);
    id v6 = a1;
    char v7 = __CocoaSet.contains(_:)();

    if ((v7 & 1) != 0)
    {
      uint64_t v8 = sub_10000777C(v5, (uint64_t)v6);
      swift_bridgeObjectRelease(v4);
      return v8;
    }

LABEL_15:
    swift_bridgeObjectRelease(v4);
    return 0LL;
  }

  Swift::Int v9 = *(void *)(v4 + 40);
  swift_bridgeObjectRetain(v4);
  Swift::Int v10 = NSObject._rawHashValue(seed:)(v9);
  uint64_t v11 = -1LL << *(_BYTE *)(v4 + 32);
  unint64_t v12 = v10 & ~v11;
  if (((*(void *)(v4 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v12) & 1) == 0) {
    goto LABEL_15;
  }
  type metadata accessor for Client(0LL);
  id v13 = *(id *)(*(void *)(v4 + 48) + 8 * v12);
  char v14 = static NSObject.== infix(_:_:)(v13, a1);

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = ~v11;
    do
    {
      unint64_t v12 = (v12 + 1) & v15;
      if (((*(void *)(v4 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v12) & 1) == 0) {
        goto LABEL_15;
      }
      id v16 = *(id *)(*(void *)(v4 + 48) + 8 * v12);
      char v17 = static NSObject.== infix(_:_:)(v16, a1);
    }

    while ((v17 & 1) == 0);
  }

  swift_bridgeObjectRelease(v4);
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  uint64_t v19 = *v2;
  uint64_t v22 = *v2;
  *uint64_t v2 = 0x8000000000000000LL;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100007198();
    uint64_t v19 = v22;
  }

  uint64_t v8 = *(void *)(*(void *)(v19 + 48) + 8 * v12);
  sub_100007904(v12);
  uint64_t v20 = *v2;
  *uint64_t v2 = v22;
  swift_bridgeObjectRelease(v20);
  return v8;
}

uint64_t sub_10000777C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRelease(*v3);
  uint64_t v6 = __CocoaSet.count.getter(a1);
  uint64_t v7 = swift_unknownObjectRetain(a1);
  Swift::Int v8 = sub_100006B24(v7, v6);
  Swift::Int v19 = v8;
  Swift::Int v9 = *(void *)(v8 + 40);
  swift_retain(v8);
  Swift::Int v10 = NSObject._rawHashValue(seed:)(v9);
  uint64_t v11 = -1LL << *(_BYTE *)(v8 + 32);
  unint64_t v12 = v10 & ~v11;
  if (((*(void *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v12) & 1) != 0)
  {
    type metadata accessor for Client(0LL);
    id v13 = *(id *)(*(void *)(v8 + 48) + 8 * v12);
    char v14 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

    if ((v14 & 1) != 0)
    {
LABEL_6:
      swift_release(v8);
      Swift::Int v8 = *(void *)(*(void *)(v8 + 48) + 8 * v12);
      sub_100007904(v12);
      if ((static NSObject.== infix(_:_:)(a2, v8) & 1) != 0)
      {
        *uint64_t v3 = v19;
        return v8;
      }

      __break(1u);
    }

    else
    {
      uint64_t v15 = ~v11;
      while (1)
      {
        unint64_t v12 = (v12 + 1) & v15;
        if (((*(void *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v12) & 1) == 0) {
          break;
        }
        id v16 = *(id *)(*(void *)(v8 + 48) + 8 * v12);
        char v17 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

        if ((v17 & 1) != 0) {
          goto LABEL_6;
        }
      }
    }

    swift_release(v8);
    __break(1u);
  }

  uint64_t result = swift_release(v8);
  __break(1u);
  return result;
}

unint64_t sub_100007904(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56LL;
  uint64_t v5 = -1LL << *(_BYTE *)(*v1 + 32LL);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain(*v1);
    uint64_t v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(v3 + 40);
        id v11 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        Swift::Int v12 = NSObject._rawHashValue(seed:)(v10);

        Swift::Int v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(v3 + 48);
            char v17 = (void *)(v16 + 8 * v2);
            int64_t v18 = (void *)(v16 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v17 >= v18 + 1))
            {
              *char v17 = *v18;
              int64_t v2 = v6;
            }
          }
        }

        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }

        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << v2) - 1;
    uint64_t result = swift_release(v3);
  }

  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << result) - 1;
  }

  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFSUB__(v19, 1LL);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }

  else
  {
    *(void *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }

  return result;
}

uint64_t sub_100007AA4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

id sub_100007AE4(void *a1)
{
  return sub_100005AC0(a1, *(void *)(v1 + 16));
}

uint64_t sub_100007AEC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100007AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007B0C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_100007B14(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___MRRouteBannerRequest);
  uint64_t v7 = swift_dynamicCastObjCClass(a1, v6);
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    swift_unknownObjectRetain(a1);
    id v18 = sub_100008FC0();
    sub_10000A960(v8, a2, a3);
  }

  else
  {
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (qword_100016320 != -1) {
      swift_once(&qword_100016320, sub_100008764);
    }
    Swift::Int v10 = (os_log_s *)qword_100016D90;
    if (os_log_type_enabled((os_log_t)qword_100016D90, v9))
    {
      id v11 = a1;
      Swift::Int v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v13 = swift_slowAlloc(32LL, -1LL);
      uint64_t v19 = (uint64_t)v11;
      uint64_t v20 = v13;
      *(_DWORD *)Swift::Int v12 = 136315138;
      swift_unknownObjectRetain(v11);
      uint64_t v14 = sub_100007AA4((uint64_t *)&unk_100016790);
      uint64_t v15 = String.init<A>(describing:)(&v19, v14);
      unint64_t v17 = v16;
      uint64_t v19 = sub_10000B438(v15, v16, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20);

      swift_bridgeObjectRelease(v17);
      _os_log_impl((void *)&_mh_execute_header, v10, v9, "Unsupported banner configuration: %s", v12, 0xCu);
      swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1LL, -1LL);
      swift_slowDealloc(v12, -1LL, -1LL);
    }
  }
}

void sub_100007D1C(uint64_t isEscapingClosureAtFileLocation)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v62 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  os_log_type_t v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v10 = [(id)isEscapingClosureAtFileLocation remoteProcess];
  id v11 = [v10 auditToken];

  if (v11)
  {
    uint64_t v59 = v7;
    uint64_t v60 = v4;
    uint64_t v61 = v3;
    [v11 realToken];
    __int128 v63 = v66;
    __int128 v64 = aBlock;

    __int128 aBlock = v64;
    __int128 v66 = v63;
    id v13 = (id)MSVBundleIDForAuditToken(&aBlock);
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
      unint64_t v17 = v16;

      id v18 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_allowedBundleIDs];
      swift_bridgeObjectRetain(v18);
      uint64_t v19 = (uint64_t)v17;
      uint64_t v14 = v17;
    }

    else
    {
      uint64_t v15 = 0LL;
      unint64_t v17 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_allowedBundleIDs];
      uint64_t v19 = 0xE000000000000000LL;
      id v18 = v17;
    }

    swift_bridgeObjectRetain(v17);
    char v21 = sub_100005B70(v15, v19, v18);
    swift_bridgeObjectRelease(v18);
    uint64_t v22 = swift_bridgeObjectRelease(v19);
    if ((v21 & 1) == 0)
    {
      os_log_type_t v53 = static os_log_type_t.default.getter(v22);
      if (qword_100016320 != -1) {
        swift_once(&qword_100016320, sub_100008764);
      }
      v54 = (os_log_s *)qword_100016D90;
      os_log_type_t v55 = v53;
      if (os_log_type_enabled((os_log_t)qword_100016D90, v53))
      {
        swift_bridgeObjectRetain(v14);
        v56 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v57 = swift_slowAlloc(32LL, -1LL);
        *(void *)&__int128 aBlock = v57;
        *(_DWORD *)v56 = 136315138;
        if (v14)
        {
          unint64_t v58 = (unint64_t)v14;
        }

        else
        {
          uint64_t v15 = 7104878LL;
          unint64_t v58 = 0xE300000000000000LL;
        }

        swift_bridgeObjectRetain(v14);
        v70 = (void *)sub_10000B438(v15, v58, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71);
        swift_bridgeObjectRelease_n(v14, 2LL);
        swift_bridgeObjectRelease(v58);
        _os_log_impl( (void *)&_mh_execute_header,  v54,  v55,  "[ClientConnectionManager] rejecting connection from unauthorized process %s",  v56,  0xCu);
        swift_arrayDestroy(v57, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v57, -1LL, -1LL);
        swift_slowDealloc(v56, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease(v14);
      }

      goto LABEL_24;
    }

    swift_bridgeObjectRelease(v14);
    id v23 = [(id)isEscapingClosureAtFileLocation remoteProcess];
    NSString v24 = String._bridgeToObjectiveC()();
    unsigned __int8 v25 = [v23 hasEntitlement:v24];

    unint64_t v27 = (void *)static os_log_type_t.default.getter(v26);
    if ((v25 & 1) != 0)
    {
      if (qword_100016320 != -1) {
        swift_once(&qword_100016320, sub_100008764);
      }
      os_log(_:dso:log:_:_:)( v27,  &_mh_execute_header,  qword_100016D90,  "[ClientConnectionManager] accepting connection",  46LL,  2LL,  &_swiftEmptyArrayStorage);
      BOOL v28 = (objc_class *)type metadata accessor for Client(0LL);
      id v29 = objc_allocWithZone(v28);
      id v30 = (id)isEscapingClosureAtFileLocation;
      uint64_t v31 = (char *)v29;
      UUID.init()();
      *(void *)&v31[OBJC_IVAR____TtC13MediaRemoteUI6Client_connection] = v30;
      id v32 = objc_allocWithZone((Class)type metadata accessor for BannerController());
      id v33 = v30;
      *(void *)&__int128 v64 = v33;
      id v34 = [v32 init];
      *(void *)&v31[OBJC_IVAR____TtC13MediaRemoteUI6Client_bannerController] = v34;

      v69.receiver = v31;
      v69.super_class = v28;
      v35 = (char *)objc_msgSendSuper2(&v69, "init");
      uint64_t v36 = *(void *)&v35[OBJC_IVAR____TtC13MediaRemoteUI6Client_bannerController]
          + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_delegate;
      *(void *)(v36 + 8) = &off_1000107C0;
      swift_unknownObjectWeakAssign(v36, v35);

      uint64_t v37 = swift_allocObject(&unk_100010830, 32LL, 7LL);
      *(void *)(v37 + 16) = v1;
      *(void *)(v37 + 24) = v35;
      v67 = sub_100008504;
      uint64_t v68 = v37;
      *(void *)&__int128 aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256LL;
      *(void *)&__int128 v66 = sub_100005C34;
      *((void *)&v66 + 1) = &unk_100010848;
      unint64_t v27 = _Block_copy(&aBlock);
      v38 = v1;
      v39 = v35;
      static DispatchQoS.unspecified.getter(v39);
      v70 = &_swiftEmptyArrayStorage;
      uint64_t v40 = sub_100008638( (unint64_t *)&qword_1000166E8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      uint64_t v41 = sub_100007AA4(&qword_1000166F0);
      uint64_t v42 = sub_100008678((unint64_t *)&qword_1000166F8, &qword_1000166F0);
      uint64_t v43 = v41;
      uint64_t v44 = v61;
      dispatch thunk of SetAlgebra.init<A>(_:)(&v70, v43, v42, v61, v40);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v9, v6, v27);
      _Block_release(v27);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v6, v44);
      (*(void (**)(char *, uint64_t))(v62 + 8))(v9, v59);
      swift_release(v68);
      uint64_t v45 = swift_allocObject(&unk_100010880, 32LL, 7LL);
      *(void *)(v45 + 16) = v38;
      *(void *)(v45 + 24) = v39;
      uint64_t v46 = swift_allocObject(&unk_1000108A8, 32LL, 7LL);
      *(void *)(v46 + 16) = sub_100008598;
      *(void *)(v46 + 24) = v45;
      v67 = sub_1000085B0;
      uint64_t v68 = v46;
      *(void *)&__int128 aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256LL;
      *(void *)&__int128 v66 = sub_100005B6C;
      *((void *)&v66 + 1) = &unk_1000108C0;
      v47 = _Block_copy(&aBlock);
      uint64_t v48 = v68;
      v49 = v38;
      v50 = v39;
      swift_retain(v46);
      uint64_t v51 = v48;
      v52 = (void *)v64;
      swift_release(v51);
      [v52 configureConnection:v47];
      _Block_release(v47);
      isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v46, "", 122LL, 128LL, 40LL, 1LL);
      swift_release(v46);
      if ((isEscapingClosureAtFileLocation & 1) == 0)
      {
        [v52 activate];
        swift_release(v45);

        return;
      }

      __break(1u);
    }

    else if (qword_100016320 == -1)
    {
LABEL_22:
      os_log(_:dso:log:_:_:)( v27,  &_mh_execute_header,  qword_100016D90,  "[ClientConnectionManager] rejecting connection from unentitled process",  70LL,  2LL,  &_swiftEmptyArrayStorage);
LABEL_24:
      [(id)isEscapingClosureAtFileLocation invalidate];
      return;
    }

    swift_once(&qword_100016320, sub_100008764);
    goto LABEL_22;
  }

  uint64_t v20 = static os_log_type_t.default.getter(v12);
  if (qword_100016320 != -1) {
    swift_once(&qword_100016320, sub_100008764);
  }
  os_log(_:dso:log:_:_:)( v20,  &_mh_execute_header,  qword_100016D90,  "[ClientConnectionManager] rejecting connection due to missing audit token",  73LL,  2LL,  &_swiftEmptyArrayStorage);
  [(id)isEscapingClosureAtFileLocation invalidate];
}

void sub_100008504()
{
}

uint64_t sub_100008528(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000856C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_100008598(void *a1)
{
}

uint64_t sub_1000085A0()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000085B0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000085D0()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000085F8(uint64_t a1)
{
  return sub_100005DE0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100008604()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_100008630()
{
}

uint64_t sub_100008638(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100008678(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = sub_100008528(a2);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1000086B8(uint64_t a1, unint64_t *a2, void *a3)
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

_OWORD *sub_1000086F0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100008700()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100008724(uint64_t a1)
{
}

uint64_t sub_100008764()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000019LL,  0x800000010000D500LL,  18773LL,  0xE200000000000000LL);
  qword_100016D90 = result;
  return result;
}

unint64_t sub_1000087B4()
{
  unint64_t result = qword_100016800;
  if (!qword_100016800)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100016800);
  }

  return result;
}

uint64_t sub_1000087F0()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000019LL,  0x800000010000D500LL,  0xD000000000000013LL,  0x800000010000D520LL);
  qword_100016D98 = result;
  return result;
}

uint64_t sub_100008854()
{
  if (qword_100016338 != -1) {
    swift_once(&qword_100016338, sub_10000A228);
  }
  return swift_retain(qword_100016DA0);
}

uint64_t sub_100008898()
{
  uint64_t v0 = sub_100007AA4(&qword_100016810);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  WindowGroup.init(id:title:lazyContent:)( 0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  nullsub_1,  0LL,  &type metadata for EmptyView,  &protocol witness table for EmptyView);
  unint64_t v4 = sub_100008D18();
  static SceneBuilder.buildBlock<A>(_:)(v3, v0, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_100008968(uint64_t a1@<X8>)
{
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + swift_unknownObjectUnownedDestroy(v0 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000089CC()
{
  unint64_t result = qword_100016808;
  if (!qword_100016808)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000E9FC, &type metadata for Main);
    atomic_store(result, (unint64_t *)&qword_100016808);
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Main(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t sub_100008A40(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

void destroy for Main(uint64_t a1)
{
}

uint64_t sub_100008A78(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

uint64_t initializeWithCopy for Main(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(_BYTE *)(a2 + 16);
  sub_100008A40(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + swift_unknownObjectUnownedDestroy(v0 + 16) = v6;
  uint64_t v7 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v7;
  id v8 = v7;
  return a1;
}

uint64_t assignWithCopy for Main(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(_BYTE *)(a2 + 16);
  sub_100008A40(*(void *)a2, v5);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + swift_unknownObjectUnownedDestroy(v0 + 16) = v6;
  sub_100008A78(v7, v8);
  os_log_type_t v9 = *(void **)(a2 + 24);
  id v10 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v9;
  id v11 = v9;

  return a1;
}

__n128 initializeWithTake for Main(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for Main(uint64_t a1, uint64_t a2)
{
  char v4 = *(_BYTE *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + swift_unknownObjectUnownedDestroy(v0 + 16) = v4;
  sub_100008A78(v5, v6);
  uint64_t v7 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for Main(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Main(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + swift_unknownObjectUnownedDestroy(v0 + 16) = 0LL;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for Main()
{
  return &type metadata for Main;
}

uint64_t sub_100008C4C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000F3B8, 1LL);
}

void sub_100008C5C()
{
  if (qword_100016340 != -1) {
    swift_once(&qword_100016340, sub_10000A684);
  }
  uint64_t v0 = (void *)qword_100016DA8;
  id v1 = objc_allocWithZone((Class)type metadata accessor for ClientConnectionManager());
  unint64_t v2 = v0;
  id v3 = [v1 init];
  uint64_t v4 = OBJC_IVAR____TtC13MediaRemoteUI10MainServer_clientConnectionManager;
  uint64_t v5 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI10MainServer_clientConnectionManager];
  *(void *)&v2[OBJC_IVAR____TtC13MediaRemoteUI10MainServer_clientConnectionManager] = v3;

  uint64_t v6 = *(void **)&v2[v4];
  if (v6)
  {
    id v7 = v6;
    sub_100005980();
  }

  else
  {
    __break(1u);
  }

unint64_t sub_100008D18()
{
  unint64_t result = qword_100016818;
  if (!qword_100016818)
  {
    uint64_t v1 = sub_100008528(&qword_100016810);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for WindowGroup<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100016818);
  }

  return result;
}

uint64_t sub_100008D68()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100008F44(v0, qword_100016820);
  sub_100008F84(v0, (uint64_t)qword_100016820);
  if (qword_100016320 != -1) {
    swift_once(&qword_100016320, sub_100008764);
  }
  return Logger.init(_:)((id)qword_100016D90);
}

id sub_100008E14()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BannerPresenter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BannerPresenter()
{
  return objc_opt_self(&OBJC_CLASS____TtC13MediaRemoteUI15BannerPresenter);
}

uint64_t sub_100008E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100008EB4(a1, a2, a3, a4, 3LL);
}

uint64_t sub_100008EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100008EB4(a1, a2, a3, a4, 0LL);
}

uint64_t sub_100008EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100008EB4(a1, a2, a3, a4, 4LL);
}

uint64_t sub_100008EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = v5 + OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong(v5 + OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate);
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v12 = *(void *)(v9 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 8))(a1, a2, a5, ObjectType, v12);
    return swift_unknownObjectRelease(v11);
  }

  return result;
}

uint64_t *sub_100008F44(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100008F84(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100008F9C(uint64_t a1)
{
  return a1;
}

id sub_100008FC0()
{
  uint64_t v1 = OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter;
  objc_super v2 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter];
  }

  else
  {
    uint64_t v4 = (char *)objc_allocWithZone((Class)type metadata accessor for SuggestedRouteBannerPresenter());
    uint64_t v5 = &v4[OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate];
    *((void *)v5 + 1) = 0LL;
    swift_unknownObjectWeakInit(v5, 0LL);
    uint64_t v6 = OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_source;
    id v7 = v0;
    uint64_t v8 = v4;
    NSString v9 = String._bridgeToObjectiveC()();
    id v10 =  [(id)objc_opt_self(BNBannerSource) bannerSourceForDestination:0 forRequesterIdentifier:v9];

    *(void *)&v4[v6] = v10;
    *((void *)v5 + 1) = &off_100010B40;
    swift_unknownObjectWeakAssign(v5, v7);

    v15.receiver = v8;
    v15.super_class = (Class)type metadata accessor for BannerPresenter();
    id v11 = objc_msgSendSuper2(&v15, "init");

    uint64_t v12 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v11;
    id v3 = v11;

    objc_super v2 = 0LL;
  }

  id v13 = v2;
  return v3;
}

uint64_t sub_100009114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v7 = v6;
  uint64_t v31 = a1;
  uint64_t v13 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v35 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  objc_super v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v33 = *(void *)(v16 - 8);
  uint64_t v34 = v16;
  __chkstk_darwin(v16);
  id v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10000A04C();
  uint64_t v32 = static OS_dispatch_queue.main.getter();
  uint64_t v19 = (void *)swift_allocObject(&unk_100010BB0, 72LL, 7LL);
  _OWORD v19[2] = a3;
  v19[3] = a4;
  uint64_t v20 = v31;
  v19[4] = v6;
  v19[5] = v20;
  v19[6] = a2;
  v19[7] = a5;
  v19[8] = a6;
  aBlock[4] = sub_10000A1BC;
  uint64_t v37 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100005C34;
  aBlock[3] = &unk_100010BC8;
  char v21 = _Block_copy(aBlock);
  uint64_t v22 = v37;
  swift_bridgeObjectRetain(a4);
  id v23 = v7;
  swift_bridgeObjectRetain(a2);
  sub_10000A1D0(a5, a6);
  uint64_t v24 = swift_release(v22);
  static DispatchQoS.unspecified.getter(v24);
  aBlock[0] = &_swiftEmptyArrayStorage;
  unint64_t v25 = sub_10000A0E4();
  uint64_t v26 = sub_100007AA4(&qword_1000166F0);
  unint64_t v27 = sub_10000A12C();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v26, v27, v13, v25);
  BOOL v28 = (void *)v32;
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v18, v15, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v13);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v18, v34);
}

void sub_100009328( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  NSString v8 = String._bridgeToObjectiveC()();
  NSString v9 = *(void **)(a3 + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_source);
  if (!v9)
  {
LABEL_4:
    if (a6) {
      a6(0LL);
    }

    return;
  }

  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = v8;
  unint64_t v12 = sub_10000A7C8((uint64_t)&_swiftEmptyArrayStorage);
  sub_100007AA4(&qword_1000168B0);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v12);
  id v26 = 0LL;
  id v14 =  [v9 revokePresentableWithRequestIdentifier:v10 reason:v11 animated:1 userInfo:isa error:&v26];

  id v15 = v26;
  if (v14)
  {
    id v16 = v26;

    goto LABEL_4;
  }

  id v17 = v26;
  uint64_t v18 = _convertNSErrorToError(_:)(v15);

  swift_willThrow();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (qword_100016320 != -1) {
    swift_once(&qword_100016320, sub_100008764);
  }
  uint64_t v20 = (os_log_s *)qword_100016D90;
  os_log_type_t v21 = v19;
  if (os_log_type_enabled((os_log_t)qword_100016D90, v19))
  {
    swift_errorRetain(v18);
    swift_errorRetain(v18);
    uint64_t v22 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    id v23 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v22 = 138412290;
    swift_errorRetain(v18);
    uint64_t v24 = (void *)_swift_stdlib_bridgeErrorToNSError(v18);
    id v26 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);
    *id v23 = v24;
    swift_errorRelease(v18);
    swift_errorRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "revoke banner failed: %@", v22, 0xCu);
    uint64_t v25 = sub_100007AA4(&qword_100016AE0);
    swift_arrayDestroy(v23, 1LL, v25);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);
  }

  if (a6)
  {
    swift_errorRetain(v18);
    a6(v18);
    swift_errorRelease(v18);
  }

  swift_errorRelease(v18);
}

uint64_t sub_100009600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v29 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v27 = *(void *)(v13 - 8);
  uint64_t v28 = v13;
  __chkstk_darwin(v13);
  id v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10000A04C();
  id v16 = (void *)static OS_dispatch_queue.main.getter();
  id v17 = (void *)swift_allocObject(&unk_100010B60, 56LL, 7LL);
  v17[2] = a1;
  v17[3] = a2;
  v17[4] = v4;
  v17[5] = a3;
  v17[6] = a4;
  aBlock[4] = sub_10000A0BC;
  uint64_t v31 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100005C34;
  aBlock[3] = &unk_100010B78;
  uint64_t v18 = _Block_copy(aBlock);
  os_log_type_t v19 = v31;
  swift_bridgeObjectRetain(a2);
  id v20 = v5;
  swift_retain(a4);
  uint64_t v21 = swift_release(v19);
  static DispatchQoS.unspecified.getter(v21);
  aBlock[0] = &_swiftEmptyArrayStorage;
  unint64_t v22 = sub_10000A0E4();
  uint64_t v23 = sub_100007AA4(&qword_1000166F0);
  unint64_t v24 = sub_10000A12C();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v23, v24, v10, v22);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v15, v12, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v15, v28);
}

void sub_1000097F8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = v6;
  NSString v8 = *(void **)(a3 + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_source);
  if (!v8) {
    goto LABEL_4;
  }
  id v9 = v6;
  unint64_t v10 = sub_10000A7C8((uint64_t)&_swiftEmptyArrayStorage);
  sub_100007AA4(&qword_1000168B0);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  id v24 = 0LL;
  id v12 = [v8 revokeAllPresentablesWithReason:v9 userInfo:isa error:&v24];

  id v13 = v24;
  if (v12)
  {
    id v14 = v24;

LABEL_4:
    a4(0LL);

    return;
  }

  id v15 = v24;
  uint64_t v16 = _convertNSErrorToError(_:)(v13);

  swift_willThrow();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (qword_100016320 != -1) {
    swift_once(&qword_100016320, sub_100008764);
  }
  uint64_t v18 = (os_log_s *)qword_100016D90;
  os_log_type_t v19 = v17;
  if (os_log_type_enabled((os_log_t)qword_100016D90, v17))
  {
    swift_errorRetain(v16);
    swift_errorRetain(v16);
    id v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v21 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)id v20 = 138412290;
    swift_errorRetain(v16);
    unint64_t v22 = (void *)_swift_stdlib_bridgeErrorToNSError(v16);
    id v24 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);
    *uint64_t v21 = v22;
    swift_errorRelease(v16);
    swift_errorRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "revoke banner failed: %@", v20, 0xCu);
    uint64_t v23 = sub_100007AA4(&qword_100016AE0);
    swift_arrayDestroy(v21, 1LL, v23);
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v20, -1LL, -1LL);
  }

  swift_errorRetain(v16);
  a4(v16);
  swift_errorRelease(v16);
  swift_errorRelease(v16);
}

id sub_100009AA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v28 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v5 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  id v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v8 = [v0 description];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  uint64_t v11 = v10;

  __int128 aBlock = (void **)v9;
  uint64_t v31 = v11;
  v12._countAndFlagsBits = 0x74696E69656420LL;
  v12._object = (void *)0xE700000000000000LL;
  String.append(_:)(v12);
  id v13 = aBlock;
  uint64_t v14 = v31;
  sub_10000A04C();
  id v15 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v16 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI16BannerController_source];
  os_log_type_t v17 = (void *)swift_allocObject(&unk_100010C00, 40LL, 7LL);
  v17[2] = v13;
  v17[3] = v14;
  v17[4] = v16;
  uint64_t v34 = sub_10000A20C;
  uint64_t v35 = v17;
  __int128 aBlock = _NSConcreteStackBlock;
  uint64_t v31 = 1107296256LL;
  uint64_t v32 = sub_100005C34;
  uint64_t v33 = &unk_100010C18;
  uint64_t v18 = _Block_copy(&aBlock);
  os_log_type_t v19 = v35;
  id v20 = v16;
  uint64_t v21 = swift_release(v19);
  static DispatchQoS.unspecified.getter(v21);
  __int128 aBlock = (void **)&_swiftEmptyArrayStorage;
  unint64_t v22 = sub_10000A0E4();
  uint64_t v23 = sub_100007AA4(&qword_1000166F0);
  unint64_t v24 = sub_10000A12C();
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v23, v24, v2, v22);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v7, v4, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v27);
  uint64_t v25 = (objc_class *)type metadata accessor for BannerController();
  v29.receiver = v1;
  v29.super_class = v25;
  return objc_msgSendSuper2(&v29, "dealloc");
}

void sub_100009CEC(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = String._bridgeToObjectiveC()();
  if (a3)
  {
    id v5 = v4;
    unint64_t v6 = sub_10000A7C8((uint64_t)&_swiftEmptyArrayStorage);
    sub_100007AA4(&qword_1000168B0);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
    id v13 = 0LL;
    id v8 = [a3 revokeAllPresentablesWithReason:v5 userInfo:isa error:&v13];

    id v9 = v13;
    if (v8)
    {
      id v10 = v13;
    }

    else
    {
      id v11 = v13;
      uint64_t v12 = _convertNSErrorToError(_:)(v9);

      swift_willThrow();
      swift_errorRelease(v12);
    }
  }

  else
  {
  }

id sub_100009EA8()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController_delegate];
  *((void *)v1 + 1) = 0LL;
  swift_unknownObjectWeakInit(v1, 0LL);
  *(void *)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter] = 0LL;
  uint64_t v2 = OBJC_IVAR____TtC13MediaRemoteUI16BannerController_source;
  uint64_t v3 = v0;
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 =  [(id)objc_opt_self(BNBannerSource) bannerSourceForDestination:0 forRequesterIdentifier:v4];

  *(void *)&v0[v2] = v5;
  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for BannerController();
  return objc_msgSendSuper2(&v7, "init");
}

uint64_t type metadata accessor for BannerController()
{
  return objc_opt_self(&OBJC_CLASS____TtC13MediaRemoteUI16BannerController);
}

uint64_t sub_100009FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = v3 + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_delegate);
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(v7 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8))(a1, a2, a3, ObjectType, v10);
    return swift_unknownObjectRelease(v9);
  }

  return result;
}

unint64_t sub_10000A04C()
{
  unint64_t result = qword_100016760;
  if (!qword_100016760)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100016760);
  }

  return result;
}

uint64_t sub_10000A088()
{
  swift_release(*(void *)(v0 + 48));
  return swift_deallocObject(v0, 56LL, 7LL);
}

void sub_10000A0BC()
{
}

uint64_t sub_10000A0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000A0DC(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_10000A0E4()
{
  unint64_t result = qword_1000166E8;
  if (!qword_1000166E8)
  {
    uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_1000166E8);
  }

  return result;
}

unint64_t sub_10000A12C()
{
  unint64_t result = qword_1000166F8;
  if (!qword_1000166F8)
  {
    uint64_t v1 = sub_100008528(&qword_1000166F0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000166F8);
  }

  return result;
}

uint64_t sub_10000A178()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 48));
  if (*(void *)(v0 + 56)) {
    swift_release(*(void *)(v0 + 64));
  }
  return swift_deallocObject(v0, 72LL, 7LL);
}

void sub_10000A1BC()
{
}

uint64_t sub_10000A1D0(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_retain(a2);
  }
  return result;
}

uint64_t sub_10000A1E0()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_10000A20C()
{
}

uint64_t sub_10000A228()
{
  uint64_t v0 = type metadata accessor for EnvironmentModel(0LL);
  uint64_t v1 = swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  memset(v4, 0, sizeof(v4));
  uint64_t v2 = sub_100007AA4((uint64_t *)&unk_100016900);
  uint64_t result = Published.init(initialValue:)(v4, v2);
  qword_100016DA0 = v1;
  return result;
}

uint64_t sub_10000A298()
{
  uint64_t KeyPath = swift_getKeyPath(&unk_10000EB80);
  uint64_t v2 = swift_getKeyPath(&unk_10000EBA8);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_10000A30C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13MediaRemoteUI16EnvironmentModel__currentBannerPresentation;
  uint64_t v2 = sub_100007AA4(&qword_1000169B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_10000A360()
{
  return type metadata accessor for EnvironmentModel(0LL);
}

uint64_t type metadata accessor for EnvironmentModel(uint64_t a1)
{
  uint64_t result = qword_1000168E8;
  if (!qword_1000168E8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for EnvironmentModel);
  }
  return result;
}

void sub_10000A3A4(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 1LL, &v4, a1 + 80);
  }

void sub_10000A410(uint64_t a1)
{
  if (!qword_1000168F8)
  {
    uint64_t v2 = sub_100008528((uint64_t *)&unk_100016900);
    unint64_t v3 = type metadata accessor for Published(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_1000168F8);
    }
  }

uint64_t initializeBufferWithCopyOfBuffer for BannerPresentation(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  __int128 v6 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 8) = v6;
  id v4 = v3;
  swift_unknownObjectRetain(v6);
  return a1;
}

uint64_t destroy for BannerPresentation(uint64_t a1)
{
  return swift_unknownObjectRelease(*(void *)(a1 + 8));
}

uint64_t assignWithCopy for BannerPresentation(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  swift_unknownObjectRetain(v7);
  swift_unknownObjectRelease(v9);
  *(void *)(a1 + swift_unknownObjectUnownedDestroy(v0 + 16) = v8;
  return a1;
}

__n128 initializeWithTake for BannerPresentation(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BannerPresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_unknownObjectRelease(v5);
  *(void *)(a1 + swift_unknownObjectUnownedDestroy(v0 + 16) = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for BannerPresentation(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BannerPresentation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + swift_unknownObjectUnownedDestroy(v0 + 16) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
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

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for BannerPresentation()
{
  return &type metadata for BannerPresentation;
}

void *sub_10000A630()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000A63C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for EnvironmentModel(0LL);
  uint64_t result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

id sub_10000A684()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for MainServer()) init];
  qword_100016DA8 = (uint64_t)result;
  return result;
}

id sub_10000A768()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MainServer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MainServer()
{
  return objc_opt_self(&OBJC_CLASS____TtC13MediaRemoteUI10MainServer);
}

unint64_t sub_10000A7C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100007AA4(&qword_100016AE8);
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
  id v6 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v7 = *(v6 - 2);
    uint64_t v8 = *(v6 - 1);
    uint64_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_unknownObjectRetain(v9);
    unint64_t result = sub_10000BB38(v7, v8);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v7;
    v12[1] = v8;
    *(void *)(v4[7] + 8 * result) = v9;
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v6 += 3;
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

uint64_t sub_10000A8E0()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100008F44(v0, qword_1000169F0);
  sub_100008F84(v0, (uint64_t)qword_1000169F0);
  if (qword_100016328 != -1) {
    swift_once(&qword_100016328, sub_1000087F0);
  }
  return Logger.init(_:)((id)qword_100016D98);
}

uint64_t sub_10000A960(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v48 = a2;
  uint64_t v49 = a3;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  os_log_type_t v53 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v51 = *(void *)(v9 - 8);
  uint64_t v52 = v9;
  __chkstk_darwin(v9);
  v50 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100016348 != -1) {
    swift_once(&qword_100016348, sub_10000A8E0);
  }
  uint64_t v11 = type metadata accessor for Logger(0LL);
  sub_100008F84(v11, (uint64_t)qword_1000169F0);
  id v12 = a1;
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v16 = (void **)swift_slowAlloc(32LL, -1LL);
    __int128 aBlock = v16;
    uint64_t v46 = v7;
    uint64_t v47 = v6;
    *(_DWORD *)uint64_t v15 = 136315138;
    id v17 = objc_msgSend(v12, "requestIdentifier", v15 + 4);
    uint64_t v18 = v4;
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    unint64_t v21 = v20;

    uint64_t v22 = v19;
    uint64_t v4 = v18;
    uint64_t v54 = sub_10000B438(v22, v21, (uint64_t *)&aBlock);
    uint64_t v6 = v47;
    uint64_t v7 = v46;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &aBlock);

    swift_bridgeObjectRelease(v21);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MRDRRC] got request %s", v15, 0xCu);
    swift_arrayDestroy(v16, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1LL, -1LL);
    swift_slowDealloc(v15, -1LL, -1LL);
  }

  else
  {
  }

  uint64_t v23 = qword_100016338;
  unint64_t v24 = (void **)v12;
  id v25 = v4;
  if (v23 != -1) {
    swift_once(&qword_100016338, sub_10000A228);
  }
  uint64_t v26 = qword_100016DA0;
  uint64_t KeyPath = swift_getKeyPath(&unk_10000EC50);
  uint64_t v28 = swift_getKeyPath(&unk_10000EC78);
  __int128 aBlock = v24;
  uint64_t v56 = (uint64_t)v25;
  uint64_t v57 = (uint64_t (*)(uint64_t))&off_100010B08;
  objc_super v29 = v24;
  id v30 = v25;
  swift_retain(v26);
  static Published.subscript.setter(&aBlock, v26, KeyPath, v28);
  sub_10000A04C();
  uint64_t v31 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v32 = (void *)swift_allocObject(&unk_100010CF0, 48LL, 7LL);
  v32[2] = v29;
  v32[3] = v30;
  uint64_t v33 = v49;
  v32[4] = v48;
  v32[5] = v33;
  uint64_t v59 = sub_10000C6F0;
  uint64_t v60 = v32;
  __int128 aBlock = _NSConcreteStackBlock;
  uint64_t v56 = 1107296256LL;
  uint64_t v57 = sub_100005C34;
  unint64_t v58 = &unk_100010D08;
  uint64_t v34 = _Block_copy(&aBlock);
  uint64_t v35 = v60;
  uint64_t v36 = v29;
  id v37 = v30;
  swift_retain(v33);
  uint64_t v38 = swift_release(v35);
  v39 = v50;
  static DispatchQoS.unspecified.getter(v38);
  __int128 aBlock = (void **)&_swiftEmptyArrayStorage;
  unint64_t v40 = sub_10000A0E4();
  uint64_t v41 = sub_100007AA4(&qword_1000166F0);
  unint64_t v42 = sub_10000A12C();
  uint64_t v43 = v53;
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v41, v42, v6, v40);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v39, v43, v34);
  _Block_release(v34);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v43, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v39, v52);
}

void sub_10000AD98(void *a1, uint64_t a2, void (*a3)(void))
{
  id v5 = [a1 requestIdentifier];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  uint64_t v8 = v7;

  uint64_t v9 = (objc_class *)type metadata accessor for SuggestedRoutePresentable();
  uint64_t v10 = (char *)objc_allocWithZone(v9);
  uint64_t v11 = &v10[OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_delegate];
  *((void *)v11 + 1) = 0LL;
  uint64_t v12 = swift_unknownObjectWeakInit(v11, 0LL);
  uint64_t v13 = &v10[OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_requesterIdentifier];
  *(void *)uint64_t v13 = 0xD000000000000017LL;
  *((void *)v13 + 1) = 0x800000010000D600LL;
  os_log_type_t v14 = (uint64_t *)&v10[OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_requestIdentifier];
  *os_log_type_t v14 = v6;
  v14[1] = v8;
  *(void *)(v12 + 8) = &off_100010B08;
  swift_unknownObjectWeakAssign(v12, a2);
  v16.receiver = v10;
  v16.super_class = v9;
  id v15 = objc_msgSendSuper2(&v16, "init");
  sub_10000BC7C(v15, a2);
  a3(0LL);
}

id sub_10000AEA4()
{
  return sub_10000B190(type metadata accessor for SuggestedRouteBannerPresenter);
}

uint64_t type metadata accessor for SuggestedRouteBannerPresenter()
{
  return objc_opt_self(&OBJC_CLASS____TtC13MediaRemoteUI29SuggestedRouteBannerPresenter);
}

id sub_10000AEE8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + *a3 + 8);
  swift_bridgeObjectRetain(v3);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

id sub_10000B184()
{
  return sub_10000B190(type metadata accessor for SuggestedRoutePresentable);
}

id sub_10000B190(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for SuggestedRoutePresentable()
{
  return objc_opt_self(&OBJC_CLASS____TtC13MediaRemoteUI25SuggestedRoutePresentable);
}

double sub_10000B230@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t KeyPath = swift_getKeyPath(&unk_10000EC50);
  uint64_t v5 = swift_getKeyPath(&unk_10000EC78);
  static Published.subscript.getter(&v8, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  uint64_t v6 = v9;
  double result = *(double *)&v8;
  *(_OWORD *)a2 = v8;
  *(void *)(a2 + swift_unknownObjectUnownedDestroy(v0 + 16) = v6;
  return result;
}

uint64_t sub_10000B2B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *a2;
  uint64_t KeyPath = swift_getKeyPath(&unk_10000EC50);
  uint64_t v7 = swift_getKeyPath(&unk_10000EC78);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  sub_10000C774(v2, v3);
  swift_retain(v5);
  return static Published.subscript.setter(v9, v5, KeyPath, v7);
}

uint64_t sub_10000B344(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000B354( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10000B388(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  return _swift_stdlib_bridgeErrorToNSError(v1);
}

uint64_t sub_10000B3A8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000B3C8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_10000B438(v6, v7, a3);
  uint64_t v10 = *a1 + 8;
  uint64_t v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_10000B438(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000B508(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000C734((uint64_t)v12, *a3);
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
      sub_10000C734((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000C714(v12);
  return v7;
}

uint64_t sub_10000B508(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000B6C0(a5, a6);
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

uint64_t sub_10000B6C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000B754(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000B92C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000B92C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + swift_unknownObjectUnownedDestroy(v0 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000B754(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_10000B8C8(v4, 0LL);
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

void *sub_10000B8C8(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100007AA4((uint64_t *)&unk_100016AD0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000B92C(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100007AA4((uint64_t *)&unk_100016AD0);
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

_BYTE **sub_10000BA78(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_10000BA88(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
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

unint64_t sub_10000BB38(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10000BB9C(a1, a2, v5);
}

unint64_t sub_10000BB9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        int v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_10000BC7C(void *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t ObjectType = swift_getObjectType(a2);
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v82 - v10;
  if (qword_100016330 != -1) {
    swift_once(&qword_100016330, sub_100008D68);
  }
  uint64_t v12 = sub_100008F84(v5, (uint64_t)qword_100016820);
  uint64_t v13 = swift_unknownObjectRetain_n(a1, 2LL);
  v89 = (uint64_t *)v12;
  int v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v87 = v6;
  uint64_t v88 = v5;
  v85 = v11;
  uint64_t v86 = ObjectType;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc(22LL, -1LL);
    v83 = (uint64_t *)swift_slowAlloc(64LL, -1LL);
    v91 = v83;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v84 = v2;
    uint64_t v18 = nullsub_1(ObjectType);
    uint64_t v19 = _typeName(_:qualified:)(v18, 0LL);
    unint64_t v21 = v20;
    uint64_t v90 = sub_10000B438(v19, v20, (uint64_t *)&v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91);
    swift_bridgeObjectRelease(v21);
    *(_WORD *)(v17 + 12) = 2080;
    id v22 = [a1 description];
    uint64_t v23 = v9;
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    unint64_t v26 = v25;

    uint64_t v2 = v84;
    uint64_t v27 = v24;
    uint64_t v9 = v23;
    uint64_t v90 = sub_10000B438(v27, v26, (uint64_t *)&v91);
    uint64_t v5 = v88;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91);

    swift_bridgeObjectRelease(v26);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%s] Will present %s", (uint8_t *)v17, 0x16u);
    uint64_t v28 = v83;
    swift_arrayDestroy(v83, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1LL, -1LL);
    uint64_t v29 = v17;
    uint64_t v6 = v87;
    swift_slowDealloc(v29, -1LL, -1LL);
  }

  else
  {
  }

  id v30 = *(void **)(v2 + OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_source);
  if (!v30) {
    goto LABEL_9;
  }
  unint64_t v31 = sub_10000A7C8((uint64_t)&_swiftEmptyArrayStorage);
  sub_100007AA4(&qword_1000168B0);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v31);
  v91 = 0LL;
  LODWORD(v31) = [v30 postPresentable:a1 options:1 userInfo:isa error:&v91];

  uint64_t v33 = v91;
  if ((_DWORD)v31)
  {
    uint64_t v34 = v91;
LABEL_9:
    (*(void (**)(char *, uint64_t *, uint64_t))(v6 + 16))(v9, v89, v5);
    uint64_t v35 = swift_unknownObjectRetain_n(a1, 2LL);
    uint64_t v36 = (void *)Logger.logObject.getter(v35);
    os_log_type_t v37 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled((os_log_t)v36, v37))
    {

      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }

    v89 = (uint64_t *)v9;
    uint64_t v38 = swift_slowAlloc(22LL, -1LL);
    v39 = (uint64_t *)swift_slowAlloc(64LL, -1LL);
    v91 = v39;
    *(_DWORD *)uint64_t v38 = 136315394;
    uint64_t v40 = nullsub_1(v86);
    uint64_t v41 = _typeName(_:qualified:)(v40, 0LL);
    id v43 = (id)v42;
    uint64_t v90 = sub_10000B438(v41, v42, (uint64_t *)&v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91);
    swift_bridgeObjectRelease(v43);
    *(_WORD *)(v38 + 12) = 2080;
    id v44 = [a1 requestIdentifier];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
      unint64_t v48 = v47;

      uint64_t v90 = sub_10000B438(v46, v48, (uint64_t *)&v91);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91);

      swift_bridgeObjectRelease(v48);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v36, v37, "[%s] Presented %s", (uint8_t *)v38, 0x16u);
      swift_arrayDestroy(v39, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v39, -1LL, -1LL);
      swift_slowDealloc(v38, -1LL, -1LL);

      return (*(uint64_t (**)(uint64_t *, uint64_t))(v87 + 8))(v89, v88);
    }

    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  v50 = v91;
  v39 = (uint64_t *)_convertNSErrorToError(_:)(v33);

  swift_willThrow();
  uint64_t v51 = v85;
  (*(void (**)(char *, uint64_t *, uint64_t))(v6 + 16))(v85, v89, v5);
  id v52 = a1;
  swift_errorRetain(v39);
  id v43 = v52;
  uint64_t v53 = swift_errorRetain(v39);
  uint64_t v54 = (void *)Logger.logObject.getter(v53);
  uint64_t v55 = v6;
  os_log_type_t v56 = static os_log_type_t.error.getter();
  p_align = &stru_100014FE8.align;
  if (!os_log_type_enabled((os_log_t)v54, v56))
  {

    swift_errorRelease(v39);
    swift_errorRelease(v39);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v51, v5);
    goto LABEL_17;
  }

  uint64_t v84 = v2;
  uint64_t v58 = swift_slowAlloc(32LL, -1LL);
  v83 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
  v89 = (uint64_t *)swift_slowAlloc(64LL, -1LL);
  v91 = v89;
  *(_DWORD *)uint64_t v58 = 136315650;
  uint64_t v59 = nullsub_1(v86);
  uint64_t v60 = _typeName(_:qualified:)(v59, 0LL);
  unint64_t v62 = v61;
  uint64_t v90 = sub_10000B438(v60, v61, (uint64_t *)&v91);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91);
  swift_bridgeObjectRelease(v62);
  *(_WORD *)(v58 + 12) = 2080;
  id v63 = [v43 requestIdentifier];
  if (v63)
  {
    __int128 v64 = v63;
    uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)(v63);
    unint64_t v67 = v66;

    uint64_t v90 = sub_10000B438(v65, v67, (uint64_t *)&v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91);

    swift_bridgeObjectRelease(v67);
    *(_WORD *)(v58 + 22) = 2112;
    swift_errorRetain(v39);
    uint64_t v68 = _swift_stdlib_bridgeErrorToNSError(v39);
    uint64_t v90 = v68;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91);
    objc_super v69 = v83;
    uint64_t *v83 = v68;
    swift_errorRelease(v39);
    swift_errorRelease(v39);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v54,  v56,  "[%s] Presentable %s failed with: %@",  (uint8_t *)v58,  0x20u);
    uint64_t v70 = sub_100007AA4(&qword_100016AE0);
    swift_arrayDestroy(v69, 1LL, v70);
    swift_slowDealloc(v69, -1LL, -1LL);
    uint64_t v71 = v89;
    swift_arrayDestroy(v89, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v71, -1LL, -1LL);
    swift_slowDealloc(v58, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v87 + 8))(v85, v88);
    uint64_t v2 = v84;
    p_align = (_DWORD *)(&stru_100014FE8 + 24);
LABEL_17:
    uint64_t v72 = v2 + OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate;
    uint64_t Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate);
    if (!Strong) {
      return swift_errorRelease(v39);
    }
    uint64_t v74 = Strong;
    uint64_t v75 = *(void *)(v72 + 8);
    id v76 = objc_msgSend(v43, *((SEL *)p_align + 347));
    if (v76)
    {
      v77 = v76;
      uint64_t v78 = swift_getObjectType(v74);
      uint64_t v79 = static String._unconditionallyBridgeFromObjectiveC(_:)(v77);
      uint64_t v81 = v80;

      (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v75 + 8))(v79, v81, 0LL, v78, v75);
      swift_errorRelease(v39);
      swift_bridgeObjectRelease(v81);
      return swift_unknownObjectRelease(v74);
    }

    goto LABEL_22;
  }

LABEL_23:
  swift_errorRelease(v39);
  uint64_t result = swift_errorRelease(v39);
  __break(1u);
  return result;
}

uint64_t sub_10000C4F4(uint64_t result)
{
  if (!result)
  {
    __break(1u);
    return result;
  }

  uint64_t v2 = v1;
  uint64_t v3 = result;
  uint64_t v4 = BNBannerRevocationReasonDragDismissal;
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  if (v5 == v8 && v7 == v9)
  {
    swift_bridgeObjectRelease_n(v7, 2LL);
    goto LABEL_11;
  }

  uint64_t v11 = v9;
  char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, v8, v9, 0LL);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v11);
  if ((v12 & 1) != 0) {
    goto LABEL_11;
  }
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  uint64_t v15 = v14;
  if (v13 == 0xD000000000000017LL && v14 == 0x800000010000D850LL)
  {
    swift_bridgeObjectRelease(0x800000010000D850LL);
    goto LABEL_11;
  }

  char v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v14, 0xD000000000000017LL, 0x800000010000D850LL, 0LL);
  swift_bridgeObjectRelease(v15);
  if ((v25 & 1) != 0)
  {
LABEL_11:
    uint64_t v16 = v2 + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_delegate;
    uint64_t Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_delegate);
    if (Strong)
    {
      uint64_t v18 = Strong;
      uint64_t v19 = *(void *)(v16 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(void, void, uint64_t, uint64_t))(v19 + 40))( *(void *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_requestIdentifier),  *(void *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_requestIdentifier + 8),  ObjectType,  v19);
      swift_unknownObjectRelease(v18);
    }
  }

  uint64_t v21 = v2 + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_delegate);
  if (result)
  {
    uint64_t v22 = result;
    uint64_t v23 = *(void *)(v21 + 8);
    uint64_t v24 = swift_getObjectType();
    (*(void (**)(void, void, uint64_t, uint64_t))(v23 + 16))( *(void *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_requestIdentifier),  *(void *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_requestIdentifier + 8),  v24,  v23);
    return swift_unknownObjectRelease(v22);
  }

  return result;
}

uint64_t sub_10000C6BC()
{
  swift_release(*(void *)(v0 + 40));
  return swift_deallocObject(v0, 48LL, 7LL);
}

void sub_10000C6F0()
{
}

uint64_t sub_10000C6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000C70C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000C714(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000C734(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_10000C774(id result, uint64_t a2)
{
  if (result)
  {
    id v2 = result;
    swift_unknownObjectRetain(a2);
    return v2;
  }

  return result;
}

uint64_t sub_10000C7A4()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC13MediaRemoteUIP33_17C2A9C26964A89A75B9FA614C8A44EB19ResourceBundleClass);
}
uint64_t sub_100002D98()
{
  uint64_t v0;
  v0 = type metadata accessor for Logger(0LL);
  sub_10000410C(v0, qword_100011648);
  sub_100003FA0(v0, (uint64_t)qword_100011648);
  return Logger.init(subsystem:category:)( 0xD00000000000001CLL,  0x800000010000A530LL,  0xD000000000000011LL,  0x80000001000093A0LL);
}

uint64_t sub_100002E18()
{
  v1 = *(void **)(v0 + OBJC_IVAR____TtC18CompanionUIService17ConnectionManager_connection);
  if (!v1)
  {
    __int128 v7 = 0u;
    __int128 v8 = 0u;
LABEL_10:
    sub_100003AB4((uint64_t)&v7);
    return 0LL;
  }

  id v2 = [v1 remoteTarget];
  if (v2)
  {
    id v3 = v2;
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(v3);
  }

  else
  {
    memset(v6, 0, sizeof(v6));
  }

  sub_100003A2C((uint64_t)v6, (uint64_t)&v7);
  if (!*((void *)&v8 + 1)) {
    goto LABEL_10;
  }
  uint64_t v4 = sub_100003A74(&qword_100011858);
  else {
    return 0LL;
  }
}

uint64_t sub_100002EE8()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [(id)objc_opt_self(BSMutableServiceInterface) interfaceWithIdentifier:v0];

  id v2 = (void *)objc_opt_self(&OBJC_CLASS___BSObjCProtocol);
  id v3 = [v2 protocolForProtocol:&OBJC_PROTOCOL___CPSUIServiceServer];
  [v1 setServer:v3];

  id v4 = [v2 protocolForProtocol:&OBJC_PROTOCOL___CPSUIServiceClient];
  [v1 setClient:v4];

  [v1 setClientMessagingExpectation:0];
  id v5 = [v1 copy];
  _bridgeAnyObjectToAny(_:)(v9);
  swift_unknownObjectRelease(v5);
  uint64_t v6 = sub_100003B38(0LL, &qword_100011880, &OBJC_CLASS___BSServiceInterface_ptr);
  if (swift_dynamicCast(&v8, v9, (char *)&type metadata for Any + 8, v6, 6LL))
  {

    return v8;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000022LL,  0x800000010000A460LL,  "CompanionUIService/ConnectionManager.swift",  42LL,  2LL,  47LL,  0);
    __break(1u);
  }

  return result;
}

void sub_1000030B4(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = [(id)objc_opt_self(BSServiceQuality) userInitiated];
  [a1 setServiceQuality:v6];

  [a1 setInterface:*(void *)(a2 + OBJC_IVAR____TtC18CompanionUIService17ConnectionManager_interface)];
  [a1 setInterfaceTarget:a3];
  uint64_t v7 = swift_allocObject(&unk_10000C748, 24LL, 7LL);
  swift_unknownObjectWeakInit(v7 + 16, a2);
  void v9[4] = sub_100004058;
  uint64_t v10 = v7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256LL;
  v9[2] = sub_1000035F0;
  v9[3] = &unk_10000C760;
  uint64_t v8 = _Block_copy(v9);
  swift_release(v10);
  [a1 setInvalidationHandler:v8];
  _Block_release(v8);
}

uint64_t sub_1000031F8(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a2 += 16LL;
  swift_beginAccess(a2, v24, 0LL, 0LL);
  uint64_t result = swift_unknownObjectWeakLoadStrong(a2);
  if (result)
  {
    v13 = (void *)result;
    v20[1] = *(void *)(result + OBJC_IVAR____TtC18CompanionUIService17ConnectionManager_connectionQueue);
    uint64_t v14 = swift_allocObject(&unk_10000C798, 24LL, 7LL);
    *(void *)(v14 + 16) = a1;
    aBlock[4] = sub_100004084;
    uint64_t v23 = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1000035C4;
    aBlock[3] = &unk_10000C7B0;
    v15 = _Block_copy(aBlock);
    v20[0] = v5;
    v16 = v15;
    static DispatchQoS.unspecified.getter(a1);
    v21 = &_swiftEmptyArrayStorage;
    uint64_t v17 = sub_10000408C( &qword_100011948,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v18 = sub_100003A74(&qword_100011950);
    uint64_t v19 = sub_1000040CC(&qword_100011958, &qword_100011950);
    dispatch thunk of SetAlgebra.init<A>(_:)(&v21, v18, v19, v4, v17);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v11, v7, v16);
    _Block_release(v16);
    (*(void (**)(char *, uint64_t))(v20[0] + 8LL))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

    return swift_release(v23);
  }

  return result;
}

void sub_100003414(void *a1)
{
  if (qword_100011640 != -1) {
    swift_once(&qword_100011640, sub_100002D98);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100003FA0(v2, (uint64_t)qword_100011648);
  id v9 = a1;
  id v3 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v5 = 138412290;
    id v10 = v9;
    id v7 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v5 + 4, v5 + 12);
    *uint64_t v6 = v9;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "invalidated %@", v5, 0xCu);
    uint64_t v8 = sub_100003A74((uint64_t *)&unk_100011960);
    swift_arrayDestroy(v6, 1LL, v8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  else
  {
  }
}

uint64_t sub_1000035C4(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_1000035F0(uint64_t a1, void *a2)
{
  os_log_type_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

uint64_t sub_100003640(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain(a2);
  v3(a2);
  return swift_unknownObjectRelease(a2);
}

id sub_1000036FC()
{
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  os_log_type_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin();
  id v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin();
  id v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = OBJC_IVAR____TtC18CompanionUIService17ConnectionManager_connectionQueue;
  v19[2] = sub_100003B38(0LL, &qword_100011860, &OBJC_CLASS___OS_dispatch_queue_ptr);
  v22 = 0LL;
  unint64_t v23 = 0xE000000000000000LL;
  id v10 = v0;
  _StringGuts.grow(_:)(18LL);
  uint64_t v11 = swift_bridgeObjectRelease(v23);
  static DispatchQoS.userInitiated.getter(v11);
  v22 = &_swiftEmptyArrayStorage;
  uint64_t v12 = sub_10000408C( &qword_100011868,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v13 = sub_100003A74(&qword_100011870);
  uint64_t v14 = sub_1000040CC(&qword_100011878, &qword_100011870);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v22, v13, v14, v5, v12);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))( v4,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v1);
  uint64_t v15 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000002CLL,  0x800000010000A3D0LL,  v9,  v7,  v4,  0LL);
  *(void *)(v19[1] + v20) = v15;
  *(void *)&v10[OBJC_IVAR____TtC18CompanionUIService17ConnectionManager_listener] = 0LL;
  *(void *)&v10[OBJC_IVAR____TtC18CompanionUIService17ConnectionManager_connection] = 0LL;
  *(void *)&v10[OBJC_IVAR____TtC18CompanionUIService17ConnectionManager_server] = 0LL;
  uint64_t v16 = OBJC_IVAR____TtC18CompanionUIService17ConnectionManager_interface;
  *(void *)&v10[v16] = sub_100002EE8();

  uint64_t v17 = (objc_class *)type metadata accessor for ConnectionManager();
  v21.receiver = v10;
  v21.super_class = v17;
  return objc_msgSendSuper2(&v21, "init");
}

id sub_100003974()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConnectionManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ConnectionManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC18CompanionUIService17ConnectionManager);
}

uint64_t sub_100003A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003A74(&qword_1000117F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100003A74(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100003AB4(uint64_t a1)
{
  uint64_t v2 = sub_100003A74(&qword_1000117F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100003AF4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100003B38(uint64_t a1, unint64_t *a2, void *a3)
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

void sub_100003B70(void *a1)
{
  uint64_t v2 = *(void *)&v1[OBJC_IVAR____TtC18CompanionUIService17ConnectionManager_server];
  if (v2)
  {
    uint64_t v3 = v1;
    swift_unknownObjectRetain(*(void *)&v1[OBJC_IVAR____TtC18CompanionUIService17ConnectionManager_server]);
    id v5 = [a1 remoteProcess];
    NSString v6 = String._bridgeToObjectiveC()();
    unsigned __int8 v7 = [v5 hasEntitlement:v6];

    if ((v7 & 1) != 0)
    {
      if (qword_100011640 != -1) {
        swift_once(&qword_100011640, sub_100002D98);
      }
      uint64_t v8 = type metadata accessor for Logger(0LL);
      sub_100003FA0(v8, (uint64_t)qword_100011648);
      id v9 = (os_log_s *)Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "accepting connection", v11, 2u);
        swift_slowDealloc(v11, -1LL, -1LL);
      }

      uint64_t v12 = swift_allocObject(&unk_10000C6D0, 32LL, 7LL);
      *(void *)(v12 + 16) = v3;
      *(void *)(v12 + 24) = v2;
      uint64_t v13 = swift_allocObject(&unk_10000C6F8, 32LL, 7LL);
      *(void *)(v13 + 16) = sub_100003FE4;
      *(void *)(v13 + 24) = v12;
      aBlock[4] = sub_100003FFC;
      uint64_t v28 = v13;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256LL;
      aBlock[2] = sub_100003640;
      aBlock[3] = &unk_10000C710;
      uint64_t v14 = _Block_copy(aBlock);
      uint64_t v15 = v28;
      swift_unknownObjectRetain(v2);
      uint64_t v16 = v3;
      swift_retain(v13);
      swift_release(v15);
      [a1 configureConnection:v14];
      _Block_release(v14);
      LOBYTE(v14) = swift_isEscapingClosureAtFileLocation(v13, "", 110LL, 66LL, 40LL, 1LL);
      swift_release(v13);
      if ((v14 & 1) == 0)
      {
        uint64_t v17 = *(void **)&v16[OBJC_IVAR____TtC18CompanionUIService17ConnectionManager_connection];
        *(void *)&v16[OBJC_IVAR____TtC18CompanionUIService17ConnectionManager_connection] = a1;
        id v18 = a1;

        [v18 activate];
        swift_release(v12);
        swift_unknownObjectRelease(v2);
        return;
      }

      __break(1u);
    }

    else if (qword_100011640 == -1)
    {
LABEL_15:
      uint64_t v22 = type metadata accessor for Logger(0LL);
      sub_100003FA0(v22, (uint64_t)qword_100011648);
      unint64_t v23 = (os_log_s *)Logger.logObject.getter();
      os_log_type_t v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "rejecting connection: missing entitlement", v25, 2u);
        swift_slowDealloc(v25, -1LL, -1LL);
      }

      [a1 invalidate];
      swift_unknownObjectRelease(v2);
      return;
    }

    swift_once(&qword_100011640, sub_100002D98);
    goto LABEL_15;
  }

  if (qword_100011640 != -1) {
    swift_once(&qword_100011640, sub_100002D98);
  }
  uint64_t v19 = type metadata accessor for Logger(0LL);
  sub_100003FA0(v19, (uint64_t)qword_100011648);
  oslog = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v20))
  {
    objc_super v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)objc_super v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v20, "no object to receive server messages set", v21, 2u);
    swift_slowDealloc(v21, -1LL, -1LL);
  }
}

uint64_t sub_100003FA0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003FB8()
{
  swift_unknownObjectRelease(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_100003FE4(void *a1)
{
}

uint64_t sub_100003FEC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100003FFC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000401C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000402C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100004034()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100004058(void *a1)
{
  return sub_1000031F8(a1, v1);
}

uint64_t sub_100004060()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100004084()
{
}

uint64_t sub_10000408C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1000040CC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = sub_100003AF4(a2);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t *sub_10000410C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000415C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10000410C(v0, qword_100011A30);
  sub_100003FA0(v0, (uint64_t)qword_100011A30);
  return Logger.init(subsystem:category:)( 0xD00000000000001CLL,  0x800000010000A530LL,  0x726576726553LL,  0xE600000000000000LL);
}

uint64_t sub_1000041CC(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return swift_task_switch(sub_1000041E4, 0LL, 0LL);
}

uint64_t sub_1000041E4()
{
  if (qword_100011660 != -1) {
    swift_once(&qword_100011660, sub_10000415C);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_100003FA0(v1, (uint64_t)qword_100011A30);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "request to display notice", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v6 = *(void **)(v0 + 16);
  unsigned __int8 v7 = *(char **)(v0 + 24);

  uint64_t v8 = *(void *)&v7[OBJC_IVAR____TtC18CompanionUIService6Server_bannerController];
  uint64_t v9 = swift_allocObject(&unk_10000C7E8, 32LL, 7LL);
  *(void *)(v9 + swift_unknownObjectWeakDestroy(v0 + 16) = v7;
  *(void *)(v9 + 24) = v6;
  id v10 = objc_allocWithZone((Class)type metadata accessor for NoticePresentable());
  id v11 = v6;
  uint64_t v12 = v7;
  uint64_t v13 = (char *)sub_100007420(v11);

  uint64_t v14 = *(void *)(v8 + OBJC_IVAR____TtC18CompanionUIService16BannerController__model);
  LOBYTE(v11) = *(_BYTE *)(v8 + OBJC_IVAR____TtC18CompanionUIService16BannerController__model + 8);
  uint64_t v15 = swift_retain(v14);
  uint64_t v16 = sub_100004E14(v15, (char)v11);
  swift_release(v14);
  sub_10000792C(v13, (uint64_t)sub_10000529C, v9);
  swift_release(v9);

  swift_release(v16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004384(uint64_t a1, void *a2)
{
  if (qword_100011660 != -1) {
    swift_once(&qword_100011660, sub_10000415C);
  }
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = sub_100003FA0(v3, (uint64_t)qword_100011A30);
  id v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    unsigned __int8 v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)unsigned __int8 v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "notice dismissed", v7, 2u);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  id v8 = [a2 requestIdentifier];
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);
  unint64_t v12 = v11;

  sub_100004AD0(4LL, v10, v12);
  return swift_bridgeObjectRelease(v12);
}

uint64_t sub_1000045D4(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v6 = dword_100011A84;
  id v7 = a1;
  id v8 = a3;
  uint64_t v9 = (void *)swift_task_alloc(v6);
  v3[5] = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_100004664;
  v9[2] = v7;
  v9[3] = v8;
  return swift_task_switch(sub_1000041E4, 0LL, 0LL);
}

uint64_t sub_100004664()
{
  uint64_t v2 = *(void *)(*v1 + 40);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v3 = *(void **)(*v1 + 24);
  uint64_t v5 = *v1;
  swift_task_dealloc(v2);

  uint64_t v6 = *(void *)(v5 + 32);
  if (v0)
  {
    id v7 = (void *)_convertErrorToNSError(_:)(v0);
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }

  else
  {
    (*(void (**)(void, void))(v6 + 16))(*(void *)(v5 + 32), 0LL);
  }

  _Block_release(*(const void **)(v5 + 32));
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_100004838(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  v3[4] = static String._unconditionallyBridgeFromObjectiveC(_:)(a1, v6);
  v3[5] = v7;
  id v8 = a3;
  return swift_task_switch(sub_100004894, 0LL, 0LL);
}

uint64_t sub_100004894()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void **)(v0 + 16);
  uint64_t v2 = *(void (***)(void, void))(v0 + 24);
  sub_100005960(*(void *)(v0 + 32), v1);

  swift_bridgeObjectRelease(v1);
  v2[2](v2, 0LL);
  _Block_release(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004A20(const void *a1, void *a2)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
  *(void *)(v2 + 24) = _Block_copy(a1);
  id v4 = a2;
  return swift_task_switch(sub_100004A68, 0LL, 0LL);
}

uint64_t sub_100004A68()
{
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v1 = *(void (***)(void, void))(v0 + 24);
  sub_100005960(0LL, 0LL);

  v1[2](v1, 0LL);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004AD0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (qword_100011660 != -1) {
    swift_once(&qword_100011660, sub_10000415C);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  sub_100003FA0(v6, (uint64_t)qword_100011A30);
  uint64_t v7 = swift_bridgeObjectRetain_n(a3, 2LL);
  id v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v11 = swift_slowAlloc(32LL, -1LL);
    uint64_t v17 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_bridgeObjectRetain(a3);
    uint64_t v16 = sub_100006CCC(a2, a3, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v10 + 4, v10 + 12);
    swift_bridgeObjectRelease_n(a3, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "send event for banner %s", v10, 0xCu);
    swift_arrayDestroy(v11, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a3, 2LL);
  }

  uint64_t result = sub_100002E18();
  if (result)
  {
    uint64_t v13 = (void *)result;
    NSString v14 = String._bridgeToObjectiveC()();
    id v15 = [objc_allocWithZone(NSNumber) initWithUnsignedInteger:a1];
    [v13 bannerWithIdentifier:v14 postedEvent:v15];

    return swift_unknownObjectRelease(v13);
  }

  return result;
}

id sub_100004D8C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Server();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for Server()
{
  return objc_opt_self(&OBJC_CLASS____TtC18CompanionUIService6Server);
}

uint64_t sub_100004E14(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = swift_retain(a1);
  if ((a2 & 1) == 0)
  {
    os_log_type_t v9 = static os_log_type_t.fault.getter(v8);
    uint64_t v10 = (os_log_s *)static Log.runtimeIssuesLog.getter();
    os_log_type_t v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      unint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v13 = swift_slowAlloc(32LL, -1LL);
      uint64_t v16 = v13;
      *(_DWORD *)unint64_t v12 = 136315138;
      uint64_t v15 = sub_100006CCC(0x6F4D656369746F4ELL, 0xEB000000006C6564LL, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v12 + 4, v12 + 12);
      _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.",  v12,  0xCu);
      swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1LL, -1LL);
      swift_slowDealloc(v12, -1LL, -1LL);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(&v16, v7, a1);
    swift_release(a1);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v16;
  }

  return a1;
}

uint64_t sub_100004FD4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1000056A4;
  return v6();
}

uint64_t sub_100005028(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1000056A4;
  return v7();
}

uint64_t sub_10000507C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100005438(a1);
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
  uint64_t v16 = swift_allocObject(&unk_10000C888, 32LL, 7LL);
  *(void *)(v16 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    void v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100011AC8, v16);
}

uint64_t sub_1000051C0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100005224;
  return v6(a1);
}

uint64_t sub_100005224()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100005270()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000529C()
{
  return sub_100004384(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1000052A4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000052D0()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc(dword_100011A94);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1000056A4;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_100011A90 + dword_100011A90))(v2, v3);
}

uint64_t sub_100005338()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100011AA4);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000056A4;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100011AA0 + dword_100011AA0))(v2, v3, v4);
}

uint64_t sub_1000053B4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_100011AB4);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000056A4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100011AB0 + dword_100011AB0))( a1,  v4,  v5,  v6);
}

uint64_t sub_100005438(uint64_t a1)
{
  uint64_t v2 = sub_100003A74(&qword_100011A88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100005478()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000549C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100011AC4);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000550C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100011AC0 + dword_100011AC0))(a1, v4);
}

uint64_t sub_10000550C()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100005558()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100011AD4);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000550C;
  return ((uint64_t (*)(uint64_t, void *, void *))((char *)&dword_100011AD0 + dword_100011AD0))(v2, v3, v4);
}

uint64_t sub_1000055D0()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100005604()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100011AF4);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000056A4;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_100011AF0 + dword_100011AF0))(v2, v3, v4);
}

uint64_t sub_100005678()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_1000056A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = LocalizedStringKey.init(stringLiteral:)(0x77202C6F6C6C6548LL, 0xED000021646C726FLL);
  uint64_t result = Text.init(_:tableName:bundle:comment:)(v2);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_100005724()
{
  uint64_t v0 = sub_100003A74(&qword_100011B18);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  WindowGroup.init(id:title:lazyContent:)( 0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  sub_1000056A8,  0LL,  &type metadata for Text,  &protocol witness table for Text);
  unint64_t v4 = sub_100005890();
  static SceneBuilder.buildBlock<A>(_:)(v3, v0, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000582C()
{
  unint64_t result = qword_100011B10;
  if (!qword_100011B10)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000941C, &type metadata for MyApp);
    atomic_store(result, (unint64_t *)&qword_100011B10);
  }

  return result;
}

ValueMetadata *type metadata accessor for MyApp()
{
  return &type metadata for MyApp;
}

uint64_t sub_100005880(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000B170, 1LL);
}

unint64_t sub_100005890()
{
  unint64_t result = qword_100011B20;
  if (!qword_100011B20)
  {
    uint64_t v1 = sub_100003AF4(&qword_100011B18);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for WindowGroup<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100011B20);
  }

  return result;
}

uint64_t sub_1000058E0()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10000410C(v0, qword_100011B30);
  sub_100003FA0(v0, (uint64_t)qword_100011B30);
  return Logger.init(subsystem:category:)( 0xD00000000000001CLL,  0x800000010000A530LL,  0xD000000000000010LL,  0x8000000100009450LL);
}

void sub_100005960(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC18CompanionUIService16BannerController_source);
  if (a2)
  {
    if (!v3)
    {
LABEL_11:
      if (qword_100011668 != -1) {
        swift_once(&qword_100011668, sub_1000058E0);
      }
      uint64_t v24 = type metadata accessor for Logger(0LL);
      uint64_t v25 = sub_100003FA0(v24, (uint64_t)qword_100011B30);
      v26 = (os_log_s *)Logger.logObject.getter(v25);
      os_log_type_t v27 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "revoked banner", v28, 2u);
        swift_slowDealloc(v28, -1LL, -1LL);
      }

      return;
    }

    NSString v4 = String._bridgeToObjectiveC()();
    NSString v5 = String._bridgeToObjectiveC()();
    unint64_t v6 = sub_1000074F0((uint64_t)&_swiftEmptyArrayStorage);
    sub_100003A74((uint64_t *)&unk_100011C30);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
    v29 = 0LL;
    id v8 =  [v3 revokePresentableWithRequestIdentifier:v4 reason:v5 animated:1 userInfo:isa error:&v29];

    uint64_t v9 = v29;
    if (v8)
    {
LABEL_4:
      id v10 = v9;

      goto LABEL_11;
    }
  }

  else
  {
    if (!v3) {
      goto LABEL_11;
    }
    NSString v11 = String._bridgeToObjectiveC()();
    unint64_t v12 = sub_1000074F0((uint64_t)&_swiftEmptyArrayStorage);
    sub_100003A74((uint64_t *)&unk_100011C30);
    Class v13 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v12);
    v29 = 0LL;
    id v8 = [v3 revokeAllPresentablesWithReason:v11 userInfo:v13 error:&v29];

    uint64_t v9 = v29;
    if (v8) {
      goto LABEL_4;
    }
  }

  id v14 = v9;
  uint64_t v15 = _convertNSErrorToError(_:)(v9);

  swift_willThrow();
  if (qword_100011668 != -1) {
    swift_once(&qword_100011668, sub_1000058E0);
  }
  uint64_t v16 = type metadata accessor for Logger(0LL);
  sub_100003FA0(v16, (uint64_t)qword_100011B30);
  swift_errorRetain(v15);
  uint64_t v17 = swift_errorRetain(v15);
  id v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v18, v19))
  {
    os_log_type_t v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    objc_super v21 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)os_log_type_t v20 = 138412290;
    swift_errorRetain(v15);
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError(v15);
    v29 = (void *)v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v20 + 4, v20 + 12);
    uint64_t *v21 = v22;
    swift_errorRelease(v15);
    swift_errorRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "revoking banner failed: %@", v20, 0xCu);
    uint64_t v23 = sub_100003A74((uint64_t *)&unk_100011960);
    swift_arrayDestroy(v21, 1LL, v23);
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v20, -1LL, -1LL);

    swift_errorRelease(v15);
  }

  else
  {
    swift_errorRelease(v15);
    swift_errorRelease(v15);
    swift_errorRelease(v15);
  }

id sub_100005D8C()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC18CompanionUIService16BannerController__model];
  *(void *)uint64_t v1 = swift_getKeyPath(&unk_1000094B0);
  v1[8] = 0;
  uint64_t v2 = OBJC_IVAR____TtC18CompanionUIService16BannerController_source;
  uint64_t v3 = v0;
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 =  [(id)objc_opt_self(BNBannerSource) bannerSourceForDestination:0 forRequesterIdentifier:v4];

  *(void *)&v0[v2] = v5;
  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for BannerController();
  return objc_msgSendSuper2(&v7, "init");
}

id sub_100005E7C()
{
  return sub_100006BBC(type metadata accessor for BannerController);
}

uint64_t type metadata accessor for BannerController()
{
  return objc_opt_self(&OBJC_CLASS____TtC18CompanionUIService16BannerController);
}

id sub_100005F34(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + *a3 + 8);
  swift_bridgeObjectRetain(v3);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

void sub_100005F8C(void *a1)
{
}

void sub_100005FA4(void *a1)
{
}

void sub_100005FBC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  id v7 = a1;
  a4(a3);
  swift_unknownObjectRelease(a3);
}

void sub_10000601C(void *a1, void *a2)
{
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100011668 != -1) {
    swift_once(&qword_100011668, sub_1000058E0);
  }
  uint64_t v9 = sub_100003FA0(v5, (uint64_t)qword_100011B30);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  id v10 = v2;
  swift_unknownObjectRetain_n(a1, 2LL);
  id v11 = a2;
  id v12 = v10;
  id v13 = v11;
  id v14 = (os_log_s *)Logger.logObject.getter(v13);
  int v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, (os_log_type_t)v15))
  {
    int v47 = v15;
    id v48 = v12;
    uint64_t v16 = swift_slowAlloc(22LL, -1LL);
    uint64_t v46 = swift_slowAlloc(64LL, -1LL);
    uint64_t v51 = v46;
    *(_DWORD *)uint64_t v16 = 136315394;
    id v17 = [a1 requesterIdentifier];
    if (v17)
    {
      os_log_type_t v19 = v17;
      uint64_t v44 = v6;
      id v45 = v13;
      os_log_t v43 = v14;
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17, v18);
      unint64_t v22 = v21;

      uint64_t v49 = v20;
      unint64_t v50 = v22;
      swift_bridgeObjectRetain(v22);
      v23._countAndFlagsBits = 58LL;
      v23._object = (void *)0xE100000000000000LL;
      String.append(_:)(v23);
      swift_bridgeObjectRelease(v22);
      uint64_t v24 = v49;
      unint64_t v25 = v50;
      id v26 = [a1 requestIdentifier];
      if (v26)
      {
        uint64_t v28 = v26;
        uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26, v27);
        v31 = v30;

        uint64_t v49 = v24;
        unint64_t v50 = v25;
        swift_bridgeObjectRetain(v25);
        v32._countAndFlagsBits = v29;
        v32._object = v31;
        String.append(_:)(v32);
        swift_bridgeObjectRelease(v25);
        swift_bridgeObjectRelease(v31);
        unint64_t v33 = v50;
        uint64_t v49 = sub_100006CCC(v49, v50, &v51);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50, v16 + 4, v16 + 12);
        swift_unknownObjectRelease_n(a1, 2LL);
        id v34 = v48;

        swift_bridgeObjectRelease(v33);
        *(_WORD *)(v16 + 12) = 2080;
        id v35 = v45;
        uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45, v36);
        unint64_t v39 = v38;
        uint64_t v49 = sub_100006CCC(v37, v38, &v51);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50, v16 + 14, v16 + 22);

        swift_bridgeObjectRelease(v39);
        os_log_t v40 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  (os_log_type_t)v47,  "%s: presentable will disappear: %s",  (uint8_t *)v16,  0x16u);
        uint64_t v41 = v46;
        swift_arrayDestroy(v46, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v41, -1LL, -1LL);
        swift_slowDealloc(v16, -1LL, -1LL);

        (*(void (**)(char *, uint64_t))(v44 + 8))(v8, v5);
        return;
      }
    }

    else
    {
      swift_unknownObjectRelease(a1);

      __break(1u);
    }

    swift_unknownObjectRelease(a1);

    __break(1u);
  }

  else
  {

    swift_unknownObjectRelease_n(a1, 2LL);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

void sub_1000063B4(void *a1, void *a2)
{
}

void sub_1000063CC(void *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t, id))
{
  id v9 = a4;
  id v10 = a1;
  a5(a3, v9);
  swift_unknownObjectRelease(a3);
}

void sub_100006448(void *a1, void *a2)
{
}

void sub_100006454(void *a1, void *a2, const char *a3)
{
  uint64_t v7 = type metadata accessor for Logger(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  id v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100011668 != -1) {
    swift_once(&qword_100011668, sub_1000058E0);
  }
  uint64_t v11 = sub_100003FA0(v7, (uint64_t)qword_100011B30);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  id v12 = v3;
  swift_unknownObjectRetain_n(a1, 2LL);
  id v13 = a2;
  id v14 = (char *)v12;
  id v15 = v13;
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  int v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, (os_log_type_t)v17))
  {
    int v49 = v17;
    unint64_t v50 = a3;
    id v51 = v15;
    v52 = v14;
    uint64_t v18 = swift_slowAlloc(22LL, -1LL);
    uint64_t v48 = swift_slowAlloc(64LL, -1LL);
    uint64_t v55 = v48;
    *(_DWORD *)uint64_t v18 = 136315394;
    id v19 = [a1 requesterIdentifier];
    if (v19)
    {
      unint64_t v21 = v19;
      os_log_t v46 = v16;
      uint64_t v47 = v8;
      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19, v20);
      unint64_t v24 = v23;

      uint64_t v53 = v22;
      unint64_t v54 = v24;
      swift_bridgeObjectRetain(v24);
      v25._countAndFlagsBits = 58LL;
      v25._object = (void *)0xE100000000000000LL;
      String.append(_:)(v25);
      swift_bridgeObjectRelease(v24);
      uint64_t v27 = v53;
      unint64_t v26 = v54;
      id v28 = [a1 requestIdentifier];
      if (v28)
      {
        uint64_t v30 = v28;
        uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28, v29);
        unint64_t v33 = v32;

        uint64_t v53 = v27;
        unint64_t v54 = v26;
        swift_bridgeObjectRetain(v26);
        v34._countAndFlagsBits = v31;
        v34._object = v33;
        String.append(_:)(v34);
        swift_bridgeObjectRelease(v26);
        swift_bridgeObjectRelease(v33);
        unint64_t v35 = v54;
        uint64_t v53 = sub_100006CCC(v53, v54, &v55);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v18 + 4, v18 + 12);
        swift_unknownObjectRelease_n(a1, 2LL);
        id v14 = v52;

        swift_bridgeObjectRelease(v35);
        *(_WORD *)(v18 + 12) = 2080;
        id v36 = v51;
        uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v51, v37);
        unint64_t v40 = v39;
        uint64_t v53 = sub_100006CCC(v38, v39, &v55);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v18 + 14, v18 + 22);

        swift_bridgeObjectRelease(v40);
        os_log_t v41 = v46;
        _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v49, v50, (uint8_t *)v18, 0x16u);
        uint64_t v42 = v48;
        swift_arrayDestroy(v48, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v42, -1LL, -1LL);
        swift_slowDealloc(v18, -1LL, -1LL);

        (*(void (**)(char *, uint64_t))(v47 + 8))(v10, v7);
        goto LABEL_8;
      }
    }

    else
    {
      swift_unknownObjectRelease(a1);

      __break(1u);
    }

    swift_unknownObjectRelease(a1);

    __break(1u);
    return;
  }

  swift_unknownObjectRelease_n(a1, 2LL);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
LABEL_8:
  os_log_t v43 = &v14[OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_didDisappear];
  uint64_t v44 = *(void (**)(char *))&v14[OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_didDisappear];
  uint64_t v45 = *(void *)&v14[OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_didDisappear + 8];
  *(void *)os_log_t v43 = 0LL;
  *((void *)v43 + 1) = 0LL;
  sub_10000736C((uint64_t)v44, v45);
  sub_10000737C((uint64_t)v44, v45);
  if (v44)
  {
    swift_retain(v45);
    v44(v14);
    sub_10000737C((uint64_t)v44, v45);
    sub_10000737C((uint64_t)v44, v45);
  }

void sub_100006848(void *a1)
{
}

void sub_100006860(void *a1)
{
}

void sub_10000686C(void *a1, const char *a2)
{
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100011668 != -1) {
    swift_once(&qword_100011668, sub_1000058E0);
  }
  uint64_t v9 = sub_100003FA0(v5, (uint64_t)qword_100011B30);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  id v10 = v2;
  swift_unknownObjectRetain_n(a1, 2LL);
  id v11 = v10;
  id v12 = (os_log_s *)Logger.logObject.getter(v11);
  int v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, (os_log_type_t)v13))
  {
    int v40 = v13;
    id v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v39 = swift_slowAlloc(32LL, -1LL);
    uint64_t v43 = v39;
    *(_DWORD *)id v14 = 136315138;
    id v15 = [a1 requesterIdentifier];
    if (v15)
    {
      int v17 = v15;
      uint64_t v37 = v6;
      id v38 = v11;
      id v36 = a2;
      uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15, v16);
      unint64_t v20 = v19;

      uint64_t v41 = v18;
      unint64_t v42 = v20;
      swift_bridgeObjectRetain(v20);
      v21._countAndFlagsBits = 58LL;
      v21._object = (void *)0xE100000000000000LL;
      String.append(_:)(v21);
      swift_bridgeObjectRelease(v20);
      uint64_t v23 = v41;
      unint64_t v22 = v42;
      id v24 = [a1 requestIdentifier];
      if (v24)
      {
        unint64_t v26 = v24;
        unint64_t v35 = v14 + 4;
        uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24, v25);
        uint64_t v29 = v28;

        uint64_t v41 = v23;
        unint64_t v42 = v22;
        swift_bridgeObjectRetain(v22);
        v30._countAndFlagsBits = v27;
        v30._object = v29;
        String.append(_:)(v30);
        swift_bridgeObjectRelease(v22);
        swift_bridgeObjectRelease(v29);
        unint64_t v31 = v42;
        uint64_t v41 = sub_100006CCC(v41, v42, &v43);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v35, v14 + 12);
        swift_unknownObjectRelease_n(a1, 2LL);
        id v32 = v38;

        swift_bridgeObjectRelease(v31);
        _os_log_impl((void *)&_mh_execute_header, v12, (os_log_type_t)v40, v36, v14, 0xCu);
        uint64_t v33 = v39;
        swift_arrayDestroy(v39, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v33, -1LL, -1LL);
        swift_slowDealloc(v14, -1LL, -1LL);

        (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v5);
        return;
      }
    }

    else
    {
      swift_unknownObjectRelease(a1);

      __break(1u);
    }

    swift_unknownObjectRelease(a1);

    __break(1u);
  }

  else
  {

    swift_unknownObjectRelease_n(a1, 2LL);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

id sub_100006BB0()
{
  return sub_100006BBC(type metadata accessor for NoticePresentable);
}

id sub_100006BBC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for NoticePresentable()
{
  return objc_opt_self(&OBJC_CLASS____TtC18CompanionUIService17NoticePresentable);
}

uint64_t sub_100006C70(uint64_t *a1)
{
  uint64_t v3 = *a1;
  unint64_t v1 = sub_1000073DC();
  swift_retain(v3);
  return EnvironmentValues.subscript.setter( &v3,  &type metadata for NoticeModelKey,  &type metadata for NoticeModelKey,  v1);
}

uint64_t sub_100006CCC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006D9C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006F74((uint64_t)v12, *a3);
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
      sub_100006F74((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100006F54(v12);
  return v7;
}

uint64_t sub_100006D9C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100006FB0(a5, a6);
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

uint64_t sub_100006F54(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006F74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006FB0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007044(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000721C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000721C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007044(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_1000071B8(v4, 0LL);
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

void *sub_1000071B8(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100003A74(&qword_100011C28);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000721C(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100003A74(&qword_100011C28);
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

uint64_t sub_10000736C(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_retain(a2);
  }
  return result;
}

uint64_t sub_10000737C(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

void *sub_10000738C@<X0>(void *a1@<X8>)
{
  unint64_t v2 = sub_1000073DC();
  uint64_t result = EnvironmentValues.subscript.getter( &v4,  &type metadata for NoticeModelKey,  &type metadata for NoticeModelKey,  v2);
  *a1 = v4;
  return result;
}

unint64_t sub_1000073DC()
{
  unint64_t result = qword_100011C40;
  if (!qword_100011C40)
  {
    unint64_t result = swift_getWitnessTable(&unk_100009578, &type metadata for NoticeModelKey);
    atomic_store(result, (unint64_t *)&qword_100011C40);
  }

  return result;
}

id sub_100007420(void *a1)
{
  unint64_t v3 = &v1[OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_didDisappear];
  *(void *)unint64_t v3 = 0LL;
  *((void *)v3 + 1) = 0LL;
  *(void *)&v1[OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_request] = a1;
  uint64_t v4 = &v1[OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_requesterIdentifier];
  *(void *)uint64_t v4 = 0xD00000000000001CLL;
  *((void *)v4 + 1) = 0x800000010000A530LL;
  uint64_t v5 = v1;
  id v6 = [a1 requestIdentifier];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);
  uint64_t v10 = v9;

  id v11 = (uint64_t *)&v5[OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_requestIdentifier];
  uint64_t *v11 = v8;
  v11[1] = v10;

  v13.receiver = v5;
  v13.super_class = (Class)type metadata accessor for NoticePresentable();
  return objc_msgSendSuper2(&v13, "init");
}

unint64_t sub_1000074F0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100003A74((uint64_t *)&unk_100011E80);
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
    unint64_t result = sub_100008748(v7, v8);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    size_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *size_t v12 = v7;
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

uint64_t sub_100007608()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10000410C(v0, qword_100011D10);
  sub_100003FA0(v0, (uint64_t)qword_100011D10);
  return Logger.init(subsystem:category:)( 0xD00000000000001CLL,  0x800000010000A530LL,  0x6C65646F4DLL,  0xE500000000000000LL);
}

id sub_100007678()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  if (v1 == (void *)1)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    id v2 =  [(id)objc_opt_self(BNBannerSource) bannerSourceForDestination:0 forRequesterIdentifier:v3];

    uint64_t v4 = *(void **)(v0 + 16);
    *(void *)(v0 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
    id v5 = v2;
    sub_100008958(v4);
  }

  sub_100008968(v1);
  return v2;
}

uint64_t sub_100007718()
{
  uint64_t KeyPath = swift_getKeyPath(&unk_100009540);
  v4[0] = v0;
  unint64_t v2 = sub_100008700();
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4, KeyPath, v2);
  swift_release(KeyPath);
  swift_beginAccess(v0 + 24, v4, 0LL, 0LL);
  return swift_bridgeObjectRetain(*(void *)(v0 + 24));
}

uint64_t sub_10000779C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t KeyPath = swift_getKeyPath(&unk_100009540);
  v8[0] = v3;
  unint64_t v5 = sub_100008700();
  ObservationRegistrar.access<A, B>(_:keyPath:)(v8, KeyPath, v5);
  swift_release(KeyPath);
  swift_beginAccess(v3 + 24, v8, 0LL, 0LL);
  uint64_t v6 = *(void *)(v3 + 24);
  *a2 = v6;
  return swift_bridgeObjectRetain(v6);
}

uint64_t sub_100007828(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t KeyPath = swift_getKeyPath(&unk_100009540);
  v7[2] = v3;
  v7[3] = v2;
  uint64_t v8 = v3;
  unint64_t v5 = sub_100008700();
  swift_bridgeObjectRetain(v2);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( &v8,  KeyPath,  sub_100008988,  v7,  (char *)&type metadata for () + 8,  v5);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(v2);
}

uint64_t sub_1000078C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = a2;
  swift_bridgeObjectRetain(a2);
  return swift_bridgeObjectRelease(v4);
}

void sub_10000792C(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = swift_allocObject(&unk_10000C9F8, 24LL, 7LL);
  swift_weakInit(v8 + 16, v4);
  uint64_t v9 = (uint64_t (*)(uint64_t))swift_allocObject(&unk_10000CA20, 40LL, 7LL);
  *((void *)v9 + 2) = v8;
  *((void *)v9 + 3) = a2;
  *((void *)v9 + 4) = a3;
  uint64_t v10 = (uint64_t (**)(uint64_t))&a1[OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_didDisappear];
  uint64_t v11 = *(void *)&a1[OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_didDisappear];
  uint64_t v12 = *(void *)&a1[OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_didDisappear + 8];
  *uint64_t v10 = sub_1000088E4;
  v10[1] = v9;
  sub_10000736C(a2, a3);
  sub_10000737C(v11, v12);
  sub_100008198();
  id v13 = sub_100007678();
  if (!v13)
  {
LABEL_4:
    uint64_t KeyPath = swift_getKeyPath(&unk_100009540);
    id v38 = v4;
    unint64_t v20 = sub_100008700();
    Swift::String v21 = a1;
    ObservationRegistrar.access<A, B>(_:keyPath:)(&v38, KeyPath, v20);
    swift_release(KeyPath);
    id v38 = v4;
    uint64_t v22 = swift_getKeyPath(&unk_100009540);
    ObservationRegistrar.willSet<A, B>(_:keyPath:)(&v38, v22, v20);
    swift_release(v22);
    uint64_t v23 = swift_beginAccess(v4 + 3, &v38, 33LL, 0LL);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v23);
    unint64_t v25 = *(void *)((v4[3] & 0xFFFFFFFFFFFFFF8LL) + 0x10);
    unint64_t v24 = *(void *)((v4[3] & 0xFFFFFFFFFFFFFF8LL) + 0x18);
    if (v25 >= v24 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v24 > 1, v25 + 1, 1LL);
    }
    uint64_t v26 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v25, v21);
    specialized Array._endMutation()(v26);
    swift_endAccess(&v38);
    id v38 = v4;
    uint64_t v27 = swift_getKeyPath(&unk_100009540);
    ObservationRegistrar.didSet<A, B>(_:keyPath:)(&v38, v27, v20);
    swift_release(v27);
    return;
  }

  BOOL v14 = v13;
  unint64_t v15 = sub_1000074F0((uint64_t)&_swiftEmptyArrayStorage);
  sub_100003A74((uint64_t *)&unk_100011C30);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v15);
  id v38 = 0LL;
  LODWORD(v15) = [v14 postPresentable:a1 options:0 userInfo:isa error:&v38];

  id v17 = v38;
  if ((_DWORD)v15)
  {
    id v18 = v38;
    goto LABEL_4;
  }

  id v28 = v38;
  uint64_t v29 = _convertNSErrorToError(_:)(v17);

  swift_willThrow();
  if (qword_100011670 != -1) {
    swift_once(&qword_100011670, sub_100007608);
  }
  uint64_t v30 = type metadata accessor for Logger(0LL);
  sub_100003FA0(v30, (uint64_t)qword_100011D10);
  swift_errorRetain(v29);
  uint64_t v31 = swift_errorRetain(v29);
  id v32 = (os_log_s *)Logger.logObject.getter(v31);
  os_log_type_t v33 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    unint64_t v35 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v34 = 138412290;
    swift_errorRetain(v29);
    id v36 = (void *)_swift_stdlib_bridgeErrorToNSError(v29);
    id v38 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v34 + 4, v34 + 12);
    *unint64_t v35 = v36;
    swift_errorRelease(v29);
    swift_errorRelease(v29);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Error encountered while posting: %@", v34, 0xCu);
    uint64_t v37 = sub_100003A74((uint64_t *)&unk_100011960);
    swift_arrayDestroy(v35, 1LL, v37);
    swift_slowDealloc(v35, -1LL, -1LL);
    swift_slowDealloc(v34, -1LL, -1LL);

    swift_errorRelease(v29);
  }

  else
  {
    swift_errorRelease(v29);
    swift_errorRelease(v29);
    swift_errorRelease(v29);
  }

uint64_t sub_100007D68(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = a2 + 16;
  swift_beginAccess(a2 + 16, v21, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v5);
  if (result)
  {
    uint64_t v7 = result;
    uint64_t KeyPath = swift_getKeyPath(&unk_100009540);
    v20[0] = v7;
    unint64_t v9 = sub_100008700();
    ObservationRegistrar.access<A, B>(_:keyPath:)(v20, KeyPath, v9);
    swift_release(KeyPath);
    swift_beginAccess(v7 + 24, v20, 0LL, 0LL);
    uint64_t v10 = *(void *)(v7 + 24);
    swift_bridgeObjectRetain(v10);
    unint64_t v11 = sub_100007F30(a1, v10);
    char v13 = v12;
    swift_bridgeObjectRelease(v10);
    if ((v13 & 1) == 0)
    {
      uint64_t v14 = swift_getKeyPath(&unk_100009540);
      v19[0] = v7;
      ObservationRegistrar.access<A, B>(_:keyPath:)(v19, v14, v9);
      swift_release(v14);
      v19[0] = v7;
      uint64_t v15 = swift_getKeyPath(&unk_100009540);
      ObservationRegistrar.willSet<A, B>(_:keyPath:)(v19, v15, v9);
      swift_release(v15);
      swift_beginAccess(v7 + 24, v19, 33LL, 0LL);
      uint64_t v16 = (void *)sub_1000080B8(v11);
      swift_endAccess(v19);

      v19[0] = v7;
      uint64_t v17 = swift_getKeyPath(&unk_100009540);
      ObservationRegistrar.didSet<A, B>(_:keyPath:)(v19, v17, v9);
      uint64_t v18 = swift_release(v17);
      if (a3) {
        a3(v18);
      }
    }

    return swift_release(v7);
  }

  return result;
}

uint64_t sub_100007F30(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (v4)
  {
    if ((a2 & 0xC000000000000001LL) != 0)
    {
      id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a2);
    }

    else
    {
      if (!*(void *)((a2 & 0xFFFFFFFFFFFFF8LL) + 0x10))
      {
        __break(1u);
        return result;
      }

      id v5 = *(id *)(a2 + 32);
    }

    uint64_t v6 = v5;
    type metadata accessor for NoticePresentable();
    char v7 = static NSObject.== infix(_:_:)(v6, v3);

    if ((v7 & 1) != 0) {
      return 0LL;
    }
    for (uint64_t i = 0LL; ; ++i)
    {
      unint64_t v8 = i + 1;
      if (__OFADD__(i, 1LL)) {
        break;
      }
      if (v8 == v4) {
        return 0LL;
      }
      if ((a2 & 0xC000000000000001LL) != 0)
      {
        id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i + 1, a2);
      }

      else
      {
        if ((v8 & 0x8000000000000000LL) != 0) {
          goto LABEL_19;
        }
        if (v8 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8LL) + 0x10)) {
          goto LABEL_20;
        }
        id v10 = *(id *)(a2 + 32 + 8 * v8);
      }

      unint64_t v11 = v10;
      char v12 = static NSObject.== infix(_:_:)(v10, v3);

      if ((v12 & 1) != 0) {
        return v8;
      }
    }

    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    if (a2 < 0) {
      uint64_t v13 = a2;
    }
    else {
      uint64_t v13 = a2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a2);
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v13);
    uint64_t result = swift_bridgeObjectRelease(a2);
  }

  return 0LL;
}

uint64_t sub_1000080B8(unint64_t a1)
{
  uint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  uint64_t *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v3 < 0 || (v3 & 0x4000000000000000LL) != 0)
  {
    uint64_t v3 = sub_1000088F0(v3);
    uint64_t *v1 = v3;
  }

  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8LL;
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }

  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      uint64_t v9 = v5 + 8 * a1;
      uint64_t v10 = *(void *)(v9 + 32);
      unint64_t v11 = memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(void *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = v7;
      specialized Array._endMutation()(v11);
      return v10;
    }
  }

  char v13 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v13,  1046LL,  0);
  __break(1u);
  return result;
}

void sub_100008198()
{
  id v1 = sub_100007678();
  if (!v1) {
    goto LABEL_4;
  }
  uint64_t v2 = v1;
  NSString v3 = String._bridgeToObjectiveC()();
  unint64_t v4 = sub_1000074F0((uint64_t)&_swiftEmptyArrayStorage);
  sub_100003A74((uint64_t *)&unk_100011C30);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  id v22 = 0LL;
  id v6 = [v2 revokeAllPresentablesWithReason:v3 userInfo:isa error:&v22];

  id v7 = v22;
  if (v6)
  {
    id v8 = v22;

LABEL_4:
    uint64_t KeyPath = swift_getKeyPath(&unk_100009540);
    __chkstk_darwin();
    v21[2] = v0;
    v21[3] = &_swiftEmptyArrayStorage;
    id v22 = v0;
    unint64_t v10 = sub_100008700();
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( &v22,  KeyPath,  sub_1000086E8,  v21,  (char *)&type metadata for () + 8,  v10);
    swift_release(KeyPath);
    return;
  }

  id v11 = v22;
  uint64_t v12 = _convertNSErrorToError(_:)(v7);

  swift_willThrow();
  if (qword_100011670 != -1) {
    swift_once(&qword_100011670, sub_100007608);
  }
  uint64_t v13 = type metadata accessor for Logger(0LL);
  sub_100003FA0(v13, (uint64_t)qword_100011D10);
  swift_errorRetain(v12);
  uint64_t v14 = swift_errorRetain(v12);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v18 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v17 = 138412290;
    swift_errorRetain(v12);
    unint64_t v19 = (void *)_swift_stdlib_bridgeErrorToNSError(v12);
    id v22 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v17 + 4, v17 + 12);
    *uint64_t v18 = v19;
    swift_errorRelease(v12);
    swift_errorRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Error encountered while revoking: %@", v17, 0xCu);
    uint64_t v20 = sub_100003A74((uint64_t *)&unk_100011960);
    swift_arrayDestroy(v18, 1LL, v20);
    swift_slowDealloc(v18, -1LL, -1LL);
    swift_slowDealloc(v17, -1LL, -1LL);

    swift_errorRelease(v12);
  }

  else
  {
    swift_errorRelease(v12);
    swift_errorRelease(v12);
    swift_errorRelease(v12);
  }

uint64_t sub_1000084D4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18CompanionUIService11NoticeModel___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_100008534()
{
  return type metadata accessor for NoticeModel(0LL);
}

uint64_t type metadata accessor for NoticeModel(uint64_t a1)
{
  uint64_t result = qword_100011D58;
  if (!qword_100011D58) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for NoticeModel);
  }
  return result;
}

uint64_t sub_100008578(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  uint64_t result = type metadata accessor for ObservationRegistrar(319LL);
  if (v3 <= 0x3F)
  {
    v4[2] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 3LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000085FC()
{
  unint64_t v0 = sub_1000073DC();
  EnvironmentValues.subscript.getter(&v2, &type metadata for NoticeModelKey, &type metadata for NoticeModelKey, v0);
  return v2;
}

uint64_t sub_100008634()
{
  uint64_t v0 = type metadata accessor for NoticeModel(0LL);
  uint64_t v1 = swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = 1LL;
  *(void *)(v1 + 24) = &_swiftEmptyArrayStorage;
  uint64_t result = ObservationRegistrar.init()();
  qword_100012030 = v1;
  return result;
}

uint64_t sub_10000868C@<X0>(void *a1@<X8>)
{
  if (qword_100011678 != -1) {
    swift_once(&qword_100011678, sub_100008634);
  }
  uint64_t v2 = qword_100012030;
  *a1 = qword_100012030;
  return swift_retain(v2);
}

uint64_t sub_1000086E8()
{
  return sub_1000078C8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_100008700()
{
  unint64_t result = qword_100011E78;
  if (!qword_100011E78)
  {
    uint64_t v1 = type metadata accessor for NoticeModel(255LL);
    unint64_t result = swift_getWitnessTable(&unk_100009518, v1);
    atomic_store(result, (unint64_t *)&qword_100011E78);
  }

  return result;
}

unint64_t sub_100008748(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_1000087AC(a1, a2, v5);
}

unint64_t sub_1000087AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
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

uint64_t sub_10000888C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000088B0()
{
  if (v0[3]) {
    swift_release(v0[4]);
  }
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000088E4(uint64_t a1)
{
  return sub_100007D68(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

uint64_t sub_1000088F0(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v4 = a1;
    }
    else {
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v4);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0LL, v2, 0LL, a1);
}

void sub_100008958(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_100008968(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for NoticeModelKey()
{
  return &type metadata for NoticeModelKey;
}

uint64_t sub_100008988()
{
  return sub_1000086E8();
}

id objc_msgSend__typeWithDeviceModelCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_typeWithDeviceModelCode:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_symbolForTypeIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "symbolForTypeIdentifier:error:");
}
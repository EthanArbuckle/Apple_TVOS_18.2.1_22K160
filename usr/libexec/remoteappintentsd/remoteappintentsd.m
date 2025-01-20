int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  v3 = type metadata accessor for RemoteAppIntentsDaemon();
  sub_100005178(v3, 56LL);
  sub_100002F18();
}

uint64_t type metadata accessor for RemoteAppIntentsDaemon()
{
  return objc_opt_self(&OBJC_CLASS____TtC17remoteappintentsd22RemoteAppIntentsDaemon);
}

void sub_100002F18()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100005170();
  uint64_t v4 = sub_1000039D0(&qword_10000C820);
  uint64_t v5 = sub_1000050B8( &qword_10000C828,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v6 = Dictionary.init(dictionaryLiteral:)(&_swiftEmptyArrayStorage, v3, v4, v5);
  *(_DWORD *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = v6;
  *(void *)(v1 + 32) = 0LL;
  *(void *)(v1 + 40) = 0LL;
  *(void *)(v1 + 48) = &_swiftEmptyArrayStorage;
  if (qword_10000C680 != -1) {
    swift_once(&qword_10000C680, sub_10000528C);
  }
  uint64_t v7 = sub_100005168();
  v8 = (os_log_s *)sub_100004170(v7, (uint64_t)qword_10000CB90);
  Logger.logObject.getter(v8);
  os_log_type_t v9 = sub_1000051D0();
  uint64_t v27 = v2;
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)sub_100005104(12LL);
    uint64_t v11 = sub_100005104(32LL);
    uint64_t v29 = v11;
    *(_DWORD *)v10 = 136315138;
    uint64_t v12 = _typeName(_:qualified:)(v2, 0LL);
    unint64_t v14 = v13;
    uint64_t v28 = sub_1000041B4(v12, v13, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v10 + 4);
    swift_bridgeObjectRelease(v14);
    sub_1000051A8((void *)&_mh_execute_header, v8, v9, "%s: hello, world.", v10);
    sub_1000051A0(v11);
    sub_1000050F8(v11);
    sub_1000050F8((uint64_t)v10);
  }

  _set_user_dir_suffix("com.apple.remoteappintentsd");
  static RemoteFileStore.MaintenanceTask.register()();
  uint64_t v15 = type metadata accessor for RapportWakeHandler();
  sub_100005178(v15, 24LL);
  swift_retain(v1);
  uint64_t v16 = sub_100005410((uint64_t)&unk_10000C840, v1);
  uint64_t v17 = *(void *)(v1 + 40);
  *(void *)(v1 + 40) = v16;
  uint64_t v18 = swift_release(v17);
  v19 = v8;
  Logger.logObject.getter(v18);
  os_log_type_t v20 = sub_1000051D0();
  if (os_log_type_enabled(v8, v20))
  {
    v21 = (uint8_t *)sub_100005104(12LL);
    uint64_t v22 = sub_100005104(32LL);
    uint64_t v29 = v22;
    *(_DWORD *)v21 = 136315138;
    uint64_t v23 = _typeName(_:qualified:)(v27, 0LL);
    uint64_t v28 = sub_1000041B4(v23, v24, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v21 + 4);
    sub_1000051C8();
    sub_1000051A8((void *)&_mh_execute_header, v19, v20, "%s: waiting for initial Rapport event", v21);
    sub_1000051A0(v22);
    sub_1000050F8(v22);
    sub_1000050F8((uint64_t)v21);
  }

  id v25 = [objc_allocWithZone((Class)type metadata accessor for AppNotificationEventListenerDelegate()) init];
  v26 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = v25;

  sub_1000032B8();
  dispatch_main();
}

uint64_t sub_100003224(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return swift_task_switch(sub_10000323C, 0LL, 0LL);
}

uint64_t sub_10000323C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for RemoteAppIntentsListener(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  uint64_t v3 = RemoteAppIntentsListener.init()();
  uint64_t v5 = sub_1000050B8( &qword_10000C868,  v4,  (uint64_t (*)(uint64_t))type metadata accessor for RemoteAppIntentsDaemon,  (uint64_t)&unk_1000068E8);
  RemoteAppIntentsListener.start(transactionDelegate:)(v1, v5);
  swift_release(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000032B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  __chkstk_darwin();
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin();
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = (void (__cdecl *)(int))SIG_IGN.getter(v8);
  signal(31, v11);
  sub_100004F8C();
  uint64_t v12 = static OS_dispatch_source.makeSignalSource(signal:queue:)(31LL, 0LL);
  uint64_t ObjectType = swift_getObjectType(v12);
  uint64_t v14 = sub_100005178((uint64_t)&unk_100008550, 24LL);
  swift_weakInit(v14 + 16, v0);
  uint64_t v15 = sub_100005178((uint64_t)&unk_100008578, 32LL);
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v2;
  aBlock[4] = sub_100005010;
  uint64_t v25 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100003890;
  aBlock[3] = &unk_100008590;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = swift_retain(v14);
  static DispatchQoS.unspecified.getter(v17);
  sub_1000038BC();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)(v10, v5, v16, ObjectType);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v23);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  uint64_t v18 = v25;
  swift_release(v14);
  swift_release(v18);
  OS_dispatch_source.activate()();
  swift_beginAccess(v1 + 6, aBlock, 33LL, 0LL);
  uint64_t v19 = swift_unknownObjectRetain(v12);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v19);
  uint64_t v20 = *(void *)((v1[6] & 0xFFFFFFFFFFFFF8LL) + 0x10);
  sub_100004188(v20);
  uint64_t v21 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v12);
  specialized Array._endMutation()(v21);
  swift_endAccess(aBlock);
  swift_unknownObjectRelease(v12);
  sub_10000510C();
}

uint64_t sub_1000034DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16;
  if (qword_10000C680 != -1) {
    swift_once(&qword_10000C680, sub_10000528C);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_100004170(v4, (uint64_t)qword_10000CB90);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    v16[0] = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = _typeName(_:qualified:)(a2, 0LL);
    unint64_t v12 = v11;
    uint64_t v15 = sub_1000041B4(v10, v11, v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, v16, v8 + 4);
    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s received SIGUSR2, dumping state", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  type metadata accessor for AppNotificationEventRegistry(0LL);
  static AppNotificationEventRegistry.dumpState()();
  swift_beginAccess(v3, v16, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v3);
  if (result)
  {
    uint64_t v14 = result;
    sub_100003694();
    return swift_release(v14);
  }

  return result;
}

void sub_100003694()
{
  uint64_t v2 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain(v2);
  os_unfair_lock_unlock(v1);
  if (qword_10000C680 != -1) {
    swift_once(&qword_10000C680, sub_10000528C);
  }
  uint64_t v3 = sub_100005168();
  uint64_t v4 = (os_log_s *)sub_100004170(v3, (uint64_t)qword_10000CB90);
  uint64_t v5 = swift_bridgeObjectRetain_n(v2, 2LL);
  Logger.logObject.getter(v5);
  os_log_type_t v6 = sub_1000051D0();
  if (os_log_type_enabled(v4, v6))
  {
    os_log_type_t v7 = (uint8_t *)sub_100005104(12LL);
    uint64_t v8 = sub_100005104(32LL);
    uint64_t v16 = v8;
    *(_DWORD *)os_log_type_t v7 = 136315138;
    uint64_t v9 = sub_100005170();
    swift_bridgeObjectRetain(v2);
    uint64_t v10 = sub_1000039D0(&qword_10000C820);
    uint64_t v11 = sub_1000050B8( &qword_10000C828,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    uint64_t v12 = Dictionary.Keys.description.getter(v2, v9, v10, v11);
    unint64_t v14 = v13;
    swift_bridgeObjectRelease(v2);
    uint64_t v15 = sub_1000041B4(v12, v14, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v7 + 4);
    swift_bridgeObjectRelease_n(v2, 2LL);
    swift_bridgeObjectRelease(v14);
    sub_1000051A8((void *)&_mh_execute_header, v4, v6, "Long running transactions: %s", v7);
    sub_1000051A0(v8);
    sub_1000050F8(v8);
    sub_1000050F8((uint64_t)v7);
    swift_bridgeObjectRelease(v2);
  }

  else
  {

    swift_bridgeObjectRelease_n(v2, 3LL);
  }
}

uint64_t sub_100003890(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_1000038BC()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = &_swiftEmptyArrayStorage;
  uint64_t v1 = sub_1000050B8( &qword_10000C850,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v2 = sub_1000039D0(&qword_10000C858);
  unint64_t v3 = sub_100005030();
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v5, v2, v3, v0, v1);
}

uint64_t sub_100003954()
{
  swift_release(*(void *)(v0 + 40));
  swift_bridgeObjectRelease(*(void *)(v0 + 48));
  return v0;
}

uint64_t sub_100003988()
{
  return swift_deallocClassInstance(v0, 56LL, 7LL);
}

char *sub_1000039A8()
{
  if (&swift_runtimeSupportsNoncopyableTypes) {
    return (char *)sub_1000039D0(&qword_10000C7A0);
  }
  else {
    return (char *)&type metadata for () + 8;
  }
}

uint64_t sub_1000039D0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void sub_100003A10(uint64_t a1)
{
  unint64_t v3 = v1;
  uint64_t v5 = sub_100005170();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  sub_10000512C();
  __chkstk_darwin();
  uint64_t v8 = (char *)&v28 - v7;
  if (qword_10000C680 != -1) {
    swift_once(&qword_10000C680, sub_10000528C);
  }
  uint64_t v9 = sub_100005168();
  sub_100004170(v9, (uint64_t)qword_10000CB90);
  uint64_t v10 = sub_1000051BC((uint64_t)v8, a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
  uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = sub_100005104(22LL);
    v30 = v1;
    uint64_t v14 = v13;
    uint64_t v15 = sub_100005104(64LL);
    uint64_t v29 = v2;
    uint64_t v16 = v15;
    uint64_t v34 = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v17 = static Instrumentation.currentActivityId.getter();
    uint64_t v32 = sub_1000041B4(v17, v18, &v34);
    uint64_t v28 = a1;
    sub_100005190((uint64_t)&v32, (uint64_t)&v33);
    sub_1000051C8();
    *(_WORD *)(v14 + 12) = 2080;
    sub_100005198( &qword_10000C808,  v19,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    uint64_t v20 = sub_100005188();
    uint64_t v32 = sub_1000041B4(v20, v21, &v34);
    a1 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v14 + 14);
    sub_100005148();
    sub_100005124((uint64_t)v8);
    sub_100005180( (void *)&_mh_execute_header,  v11,  v12,  "%sLong running operation %s will start, requesting transaction",  (uint8_t *)v14);
    sub_1000051D8(v16);
    uint64_t v22 = v16;
    uint64_t v2 = v29;
    sub_1000050F8(v22);
    uint64_t v23 = v14;
    unint64_t v3 = v30;
    sub_1000050F8(v23);
  }

  else
  {
    sub_100005124((uint64_t)v8);
  }

  uint64_t v34 = 0LL;
  unint64_t v35 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(30LL);
  uint64_t v24 = swift_bridgeObjectRelease(v35);
  uint64_t v34 = 0xD00000000000001CLL;
  unint64_t v35 = 0x8000000100006D20LL;
  v25._countAndFlagsBits = UUID.uuidString.getter(v24);
  String.append(_:)(v25);
  sub_1000051C8();
  uint64_t v26 = String.utf8CString.getter(v34, v35);
  sub_100005148();
  uint64_t v27 = os_transaction_create(v26 + 32);
  swift_release(v26);
  v31(v2, a1, v5);
  os_unfair_lock_lock(v3 + 4);
  sub_100003CE4((uint64_t)&v3[6], v2, v27);
  os_unfair_lock_unlock(v3 + 4);
  swift_unknownObjectRelease(v27);
  sub_100005124(v2);
  sub_10000510C();
}

uint64_t sub_100003CE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
  if (a3)
  {
    uint64_t v9 = swift_unknownObjectRetain(a3);
    sub_100004C74(v9, (uint64_t)v8);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  else
  {
    uint64_t v11 = sub_100004AD0((uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_unknownObjectRelease(v11);
  }

void sub_100003DC4(uint64_t a1)
{
  uint64_t v3 = sub_100005170();
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  sub_10000512C();
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v40 - v6;
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v40 - v8;
  if (qword_10000C680 != -1) {
    swift_once(&qword_10000C680, sub_10000528C);
  }
  uint64_t v10 = sub_100005168();
  uint64_t v11 = (os_unfair_lock_s *)sub_100004170(v10, (uint64_t)qword_10000CB90);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  uint64_t v44 = a1;
  uint64_t v13 = sub_1000051BC((uint64_t)v9, a1, v12);
  v42 = v11;
  uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.info.getter();
  if (sub_100005158(v15))
  {
    uint64_t v16 = sub_100005104(22LL);
    uint64_t v41 = v1;
    uint64_t v17 = v16;
    uint64_t v40 = sub_100005104(64LL);
    uint64_t v46 = v40;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v18 = static Instrumentation.currentActivityId.getter();
    unint64_t v20 = v19;
    uint64_t v45 = sub_100005150(v18, v19);
    sub_100005190((uint64_t)&v45, (uint64_t)&v46);
    swift_bridgeObjectRelease(v20);
    *(_WORD *)(v17 + 12) = 2080;
    sub_100005198( &qword_10000C808,  v21,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    uint64_t v22 = sub_100005188();
    uint64_t v45 = sub_100005150(v22, v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v17 + 14);
    sub_100005148();
    sub_100005124((uint64_t)v9);
    sub_100005180( (void *)&_mh_execute_header,  v14,  (os_log_type_t)v11,  "%sLong running operation %s completed, released transaction",  (uint8_t *)v17);
    uint64_t v24 = v40;
    sub_1000051D8(v40);
    sub_1000050F8(v24);
    uint64_t v25 = v17;
    uint64_t v1 = v41;
    sub_1000050F8(v25);
  }

  else
  {
    sub_100005124((uint64_t)v9);
  }

  uint64_t v26 = v44;
  uint64_t v27 = v43;
  v43((uint64_t)v7, v44, v3);
  sub_1000051B0();
  uint64_t v28 = sub_100004AD0((uint64_t)v7);
  os_unfair_lock_unlock(v11);
  sub_100005124((uint64_t)v7);
  if (v28)
  {
    swift_unknownObjectRelease(v28);
  }

  else
  {
    uint64_t v29 = v27(v1, v26, v3);
    v30 = (os_log_s *)Logger.logObject.getter(v29);
    os_log_type_t v31 = static os_log_type_t.error.getter();
    if (sub_100005158(v31))
    {
      uint64_t v32 = sub_100005104(22LL);
      uint64_t v33 = sub_100005104(64LL);
      uint64_t v46 = v33;
      *(_DWORD *)uint64_t v32 = 136315394;
      uint64_t v34 = static Instrumentation.currentActivityId.getter();
      unint64_t v36 = v35;
      uint64_t v45 = sub_100005150(v34, v35);
      sub_100005190((uint64_t)&v45, (uint64_t)&v46);
      swift_bridgeObjectRelease(v36);
      *(_WORD *)(v32 + 12) = 2080;
      sub_100005198( &qword_10000C808,  v37,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
      uint64_t v38 = sub_100005188();
      uint64_t v45 = sub_100005150(v38, v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v32 + 14);
      sub_100005148();
      sub_100005124(v1);
      sub_100005180( (void *)&_mh_execute_header,  v30,  (os_log_type_t)v11,  "%sNo transaction found for operation %s",  (uint8_t *)v32);
      sub_1000051D8(v33);
      sub_1000050F8(v33);
      sub_1000050F8(v32);
    }

    else
    {
      sub_100005124(v1);
    }
  }

  sub_10000510C();
}

uint64_t sub_100004170(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100004188(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFF8LL) + 0x18);
  return result;
}

uint64_t sub_1000041B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100004284(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100004C34((uint64_t)v12, *a3);
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
      sub_100004C34((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100004C14(v12);
  return v7;
}

void *sub_100004284(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1000043D8((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_10000449C(a5, a6);
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

void *sub_1000043D8(char *__src, size_t __n, char *__dst)
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

void *sub_10000449C(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_100004530(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_100004704(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    unint64_t v2 = sub_100004704((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100004530(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_1000046A0(v4, 0LL);
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

void *sub_1000046A0(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_1000039D0(&qword_10000C810);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_100004704(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_1000039D0(&qword_10000C810);
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
    sub_10000489C(v14, v8, v13);
    *(void *)(a4 + sub_100004EBC(v0 + 16) = 0LL;
  }

  else
  {
    sub_1000047D8(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_1000047D8(char *__src, size_t __n, char *__dst)
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

char *sub_10000489C(char *__src, size_t __len, char *__dst)
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

unint64_t sub_10000491C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = sub_1000050B8( &qword_10000C828,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_10000498C(a1, v7);
}

unint64_t sub_10000498C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v18 = a1;
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  int64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v10 = a2 & ~v9;
  if (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(void *)(v3 + 48) + v12 * v10, v5);
      uint64_t v14 = sub_1000050B8( &qword_10000C830,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
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

uint64_t sub_100004AD0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain(*v2);
  unint64_t v5 = sub_10000491C(a1);
  LOBYTE(a1) = v6;
  swift_bridgeObjectRelease(v4);
  if ((a1 & 1) == 0) {
    return 0LL;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  uint64_t v17 = *v2;
  uint64_t v8 = *v2;
  *uint64_t v2 = 0x8000000000000000LL;
  Swift::Int v9 = *(void *)(v8 + 24);
  sub_1000039D0(&qword_10000C818);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v9);
  uint64_t v10 = *(void *)(v17 + 48);
  uint64_t v11 = type metadata accessor for UUID(0LL);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8LL))( v10 + *(void *)(*(void *)(v11 - 8) + 72LL) * v5,  v11);
  uint64_t v12 = *(void *)(*(void *)(v17 + 56) + 8 * v5);
  uint64_t v13 = sub_1000039D0(&qword_10000C820);
  uint64_t v14 = sub_1000050B8( &qword_10000C828,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  _NativeDictionary._delete(at:)(v5, v17, v11, v13, v14);
  uint64_t v15 = *v2;
  *uint64_t v2 = v17;
  swift_bridgeObjectRelease(v15);
  return v12;
}

uint64_t sub_100004C14(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100004C34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100004C74(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  uint64_t v8 = *v2;
  *uint64_t v2 = 0x8000000000000000LL;
  sub_100004CE0(a1, a2, isUniquelyReferenced_nonNull_native);
  uint64_t v6 = *v2;
  *uint64_t v2 = v8;
  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_100004CE0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = (void *)*v3;
  unint64_t v13 = sub_10000491C(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_10;
  }

  unint64_t v18 = v13;
  char v19 = v14;
  sub_1000039D0(&qword_10000C818);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_10000491C(a2);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_10:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
    __break(1u);
    return result;
  }

  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = *v4;
  if ((v19 & 1) != 0)
  {
    uint64_t v23 = v22[7];
    uint64_t result = swift_unknownObjectRelease(*(void *)(v23 + 8 * v18));
    *(void *)(v23 + 8 * v18) = a1;
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
    return sub_100004E24(v18, (uint64_t)v11, a1, v22);
  }

  return result;
}

uint64_t sub_100004E24(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32LL))( v8 + *(void *)(*(void *)(v9 - 8) + 72LL) * a1,  a2,  v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1LL);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_100004EBC(uint64_t a1)
{
  uint64_t v2 = sub_1000039D0(&qword_10000C7A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100004EFC()
{
  uint64_t v2 = (void *)swift_task_alloc(dword_10000C83C);
  *(void *)(v1 + sub_100004EBC(v0 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100004F44;
  return sub_100003224(v0);
}

uint64_t sub_100004F44()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_100004F8C()
{
  unint64_t result = qword_10000C848;
  if (!qword_10000C848)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_source);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000C848);
  }

  return result;
}

uint64_t sub_100004FC8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100004FEC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100005010()
{
  return sub_1000034DC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100005018(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005028(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_100005030()
{
  unint64_t result = qword_10000C860;
  if (!qword_10000C860)
  {
    uint64_t v1 = sub_100005074(&qword_10000C858);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000C860);
  }

  return result;
}

uint64_t sub_100005074(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000050B8(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = a3(a2);
    uint64_t result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1000050F8(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_100005104(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

  ;
}

uint64_t sub_100005124(uint64_t a1)
{
  return v2(a1, v1);
}

  ;
}

uint64_t sub_100005148()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100005150(uint64_t a1, unint64_t a2)
{
  return sub_1000041B4(a1, a2, (uint64_t *)(v2 - 88));
}

BOOL sub_100005158(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100005168()
{
  return type metadata accessor for Logger(0LL);
}

uint64_t sub_100005170()
{
  return type metadata accessor for UUID(0LL);
}

uint64_t sub_100005178(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

void sub_100005180(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_100005188()
{
  return dispatch thunk of CustomStringConvertible.description.getter(v0);
}

uint64_t sub_100005190(uint64_t a1, uint64_t a2)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, v2);
}

uint64_t sub_100005198(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  return sub_1000050B8(a1, 255LL, a3, a4);
}

uint64_t sub_1000051A0(uint64_t a1)
{
  return swift_arrayDestroy(a1, 1LL);
}

void sub_1000051A8(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000051B0()
{
}

uint64_t sub_1000051BC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  *(void *)(v4 - 120) = a3;
  return a3(a1, a2, v3);
}

uint64_t sub_1000051C8()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000051D0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000051D8(uint64_t a1)
{
  return swift_arrayDestroy(a1, 2LL);
}

id sub_1000051E0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100005234()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AppNotificationEventListenerDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC17remoteappintentsd36AppNotificationEventListenerDelegate);
}

uint64_t sub_10000528C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1000052FC(v0, qword_10000CB90);
  sub_100004170(v0, (uint64_t)qword_10000CB90);
  return Logger.init(subsystem:category:)( 0xD00000000000001CLL,  0x8000000100006DC0LL,  0x6E6F6D656164LL,  0xE600000000000000LL);
}

uint64_t *sub_1000052FC(uint64_t a1, uint64_t *a2)
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

unint64_t sub_10000533C(int a1)
{
  unint64_t v1 = 0xD000000000000011LL;
  if (!a1) {
    return 0xD000000000000015LL;
  }
  unint64_t v2 = 0xD00000000000001ALL;
  unint64_t v3 = 0x4E574F4E4B4E55LL;
  if (a1 == 25) {
    unint64_t v3 = 0xD000000000000018LL;
  }
  if (a1 != 33) {
    unint64_t v2 = v3;
  }
  if (a1 == 21) {
    unint64_t v2 = 0xD000000000000011LL;
  }
  if (a1 != 17) {
    unint64_t v1 = v2;
  }
  if (a1 == 9) {
    return 0xD000000000000014LL;
  }
  else {
    return v1;
  }
}

uint64_t sub_100005410(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  sub_1000062A8();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin();
  sub_1000062A8();
  uint64_t v12 = v11 - v10;
  type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin();
  sub_1000062A8();
  uint64_t v15 = v14 - v13;
  sub_100005F08();
  static DispatchQoS.userInitiated.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  unint64_t v16 = sub_100005F44();
  uint64_t v17 = sub_1000039D0(&qword_10000CA70);
  unint64_t v18 = sub_100005F84();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v17, v18, v9, v16);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))( v8,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v4);
  char v19 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000031LL,  0x8000000100006EE0LL,  v15,  v12,  v8,  0LL);
  *(void *)(v3 + swift_weakDestroy(v0 + 16) = v19;
  unint64_t v20 = (void *)swift_allocObject(&unk_1000085E0, 40LL, 7LL);
  v20[2] = v3;
  v20[3] = a1;
  v20[4] = a2;
  aBlock[4] = sub_100005FF4;
  uint64_t v28 = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100005E7C;
  aBlock[3] = &unk_1000085F8;
  char v21 = _Block_copy(aBlock);
  uint64_t v22 = v28;
  uint64_t v23 = v19;
  swift_retain(v3);
  swift_retain(a2);
  swift_release(v22);
  xpc_set_event_stream_handler("com.apple.rapport.matching", v23, v21);
  swift_release(a2);
  _Block_release(v21);

  return v3;
}

const char *sub_100005644(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = *(void **)(a2 + 16);
  *(void *)uint64_t v13 = v14;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  id v15 = v14;
  char v16 = _dispatchPreconditionTest(_:)(v13);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if ((v16 & 1) == 0)
  {
    __break(1u);
LABEL_9:
    swift_once(&qword_10000C680, sub_10000528C);
    goto LABEL_4;
  }

  uint64_t result = xpc_dictionary_get_string(a1, _xpc_event_key_name);
  if (!result) {
    return result;
  }
  uint64_t v13 = (char *)result;
  uint64_t v33 = a3;
  if (qword_10000C680 != -1) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v18 = type metadata accessor for Logger(0LL);
  uint64_t v19 = sub_100004170(v18, (uint64_t)qword_10000CB90);
  unint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v23 = swift_slowAlloc(32LL, -1LL);
    uint64_t v32 = a4;
    uint64_t v24 = v23;
    uint64_t v35 = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    uint64_t v25 = String.init(cString:)(v13);
    unint64_t v27 = v26;
    uint64_t v34 = sub_1000041B4(v25, v26, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v22 + 4);
    swift_bridgeObjectRelease(v27);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Received Rapport wake event for: %s", v22, 0xCu);
    swift_arrayDestroy(v24, 1LL);
    uint64_t v28 = v24;
    a4 = v32;
    swift_slowDealloc(v28, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);
  }

  uint64_t v29 = type metadata accessor for TaskPriority(0LL);
  sub_100006018((uint64_t)v9, 1LL, 1LL, v29);
  v30 = (void *)swift_allocObject(&unk_100008630, 64LL, 7LL);
  v30[2] = 0LL;
  v30[3] = 0LL;
  v30[4] = v33;
  v30[5] = a4;
  v30[6] = a2;
  v30[7] = a1;
  swift_retain(a4);
  swift_retain(a2);
  swift_unknownObjectRetain(a1);
  uint64_t v31 = sub_100005D40((uint64_t)v9, (uint64_t)&unk_10000CAF0, (uint64_t)v30);
  return (const char *)swift_release(v31);
}

uint64_t sub_100005920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  return swift_task_switch(sub_10000593C, 0LL, 0LL);
}

uint64_t sub_10000593C()
{
  qos_class_t v1 = qos_class_self();
  if (qword_10000C680 != -1) {
    swift_once(&qword_10000C680, sub_10000528C);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_100004170(v2, (uint64_t)qword_10000CB90);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    uint64_t v15 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    unint64_t v8 = sub_10000533C(v1);
    unint64_t v10 = v9;
    v0[2] = sub_1000041B4(v8, v9, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v6 + 4);
    swift_bridgeObjectRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Bootstrapping listener with QoS class: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1LL);
    sub_1000050F8(v7);
    sub_1000050F8((uint64_t)v6);
  }

  uint64_t v11 = (int *)v0[3];
  uint64_t v14 = (uint64_t (*)(void))((char *)v11 + *v11);
  uint64_t v12 = (void *)swift_task_alloc(v11[1]);
  v0[7] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_100005AE0;
  return v14();
}

uint64_t sub_100005AE0()
{
  return swift_task_switch(sub_100005B34, 0LL, 0LL);
}

uint64_t sub_100005B34()
{
  return sub_10000629C(*(uint64_t (**)(void))(v0 + 8));
}

void sub_100005B5C(void *a1)
{
  string = xpc_dictionary_get_string(a1, _xpc_event_key_name);
  if (string)
  {
    uint64_t v3 = string;
    if (xpc_dictionary_get_BOOL(a1, "replyRequired"))
    {
      xpc_object_t reply = xpc_dictionary_create_reply(a1);
      if (reply)
      {
        xpc_object_t v5 = reply;
        xpc_dictionary_send_reply();
        swift_unknownObjectRelease(v5);
      }

      else
      {
        if (qword_10000C680 != -1) {
          swift_once(&qword_10000C680, sub_10000528C);
        }
        uint64_t v6 = type metadata accessor for Logger(0LL);
        uint64_t v7 = sub_100004170(v6, (uint64_t)qword_10000CB90);
        oslog = (os_log_s *)Logger.logObject.getter(v7);
        os_log_type_t v8 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(oslog, v8))
        {
          unint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v10 = swift_slowAlloc(32LL, -1LL);
          uint64_t v16 = v10;
          *(_DWORD *)unint64_t v9 = 136315138;
          uint64_t v11 = String.init(cString:)(v3);
          unint64_t v13 = v12;
          uint64_t v15 = sub_1000041B4(v11, v12, &v16);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v9 + 4);
          swift_bridgeObjectRelease(v13);
          _os_log_impl((void *)&_mh_execute_header, oslog, v8, "Failed to reply to Rapport wake event: %s", v9, 0xCu);
          swift_arrayDestroy(v10, 1LL);
          swift_slowDealloc(v10, -1LL, -1LL);
          swift_slowDealloc(v9, -1LL, -1LL);
        }

        else
        {
        }
      }
    }
  }

uint64_t sub_100005D40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_10000619C(a1, 1LL, v6) == 1)
  {
    sub_1000061A8(a1);
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

  uint64_t v15 = swift_allocObject(&unk_100008658, 32LL, 7LL);
  *(void *)(v15 + swift_weakDestroy(v0 + 16) = a2;
  *(void *)(v15 + 2os_unfair_lock_lock(v0 + 4) = a3;
  if (v14 | v12)
  {
    v18[0] = 0LL;
    v18[1] = 0LL;
    uint64_t v16 = v18;
    v18[2] = v12;
    v18[3] = v14;
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  return swift_task_create(v7, v16, (char *)&type metadata for () + 8, &unk_10000CB00, v15);
}

uint64_t sub_100005E7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  uint64_t v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_100005EC4()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for RapportWakeHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC17remoteappintentsd18RapportWakeHandler);
}

unint64_t sub_100005F08()
{
  unint64_t result = qword_10000CA60;
  if (!qword_10000CA60)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000CA60);
  }

  return result;
}

unint64_t sub_100005F44()
{
  unint64_t result = qword_10000CA68;
  if (!qword_10000CA68)
  {
    uint64_t v1 = type metadata accessor for OS_dispatch_queue.Attributes(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_10000CA68);
  }

  return result;
}

unint64_t sub_100005F84()
{
  unint64_t result = qword_10000CA78;
  if (!qword_10000CA78)
  {
    uint64_t v1 = sub_100005074(&qword_10000CA70);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000CA78);
  }

  return result;
}

uint64_t sub_100005FC8()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

const char *sub_100005FF4(void *a1)
{
  return sub_100005644(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100006000(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006010(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100006018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_100006024()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

uint64_t sub_100006060(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc(dword_10000CA8C);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_1000060EC;
  return sub_100005920(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_1000060EC()
{
  return sub_10000629C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100006110(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100006174;
  return v6(a1);
}

uint64_t sub_100006174()
{
  return sub_10000629C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10000619C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_1000061A8(uint64_t a1)
{
  uint64_t v2 = sub_1000039D0(&qword_10000CA80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000061E8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000620C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10000CAFC);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000060EC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10000CAF8 + dword_10000CAF8))(a1, v4);
}

uint64_t sub_10000627C()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_10000629C(uint64_t (*a1)(void))
{
  return a1();
}

  ;
}
void sub_100003018()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void (__cdecl *v16)(int);
  uint64_t v17;
  uint64_t ObjectType;
  void *v19;
  id v20;
  void aBlock[6];
  v0 = type metadata accessor for DispatchWorkItemFlags(0LL);
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  sub_100003554();
  v4 = v3 - v2;
  v5 = type metadata accessor for DispatchQoS(0LL);
  v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  sub_100003554();
  v9 = v8 - v7;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(VCBundleIdentifierDaemon);
  v12 = v11;
  v13 = String.utf8CString.getter(v10);
  swift_bridgeObjectRelease(v12);
  _set_user_dir_suffix(v13 + 32);
  swift_release(v13);
  v14 = objc_autoreleasePoolPush();
  type metadata accessor for VCDaemon(0LL);
  v15 = static VCDaemon.daemon.getter();
  dispatch thunk of VCDaemon.start()();
  swift_release(v15);
  objc_autoreleasePoolPop(v14);
  v16 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(15, v16);
  sub_1000033F8();
  v17 = static OS_dispatch_source.makeSignalSource(signal:queue:)(15LL, 0LL);
  ObjectType = swift_getObjectType();
  aBlock[4] = sub_100003228;
  aBlock[5] = 0LL;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100003338;
  aBlock[3] = &unk_100004280;
  v19 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter();
  sub_100003364();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)(v9, v4, v19, ObjectType);
  _Block_release(v19);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  OS_dispatch_source.activate()();
  v20 = [(id)objc_opt_self(NSRunLoop) mainRunLoop];
  [v20 run];
  swift_unknownObjectRelease(v17);
}

uint64_t sub_100003228()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  sub_100003554();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = static WFLog.subscript.getter(WFLogCategoryGeneral);
  v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Received SIGTERM", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  type metadata accessor for VCDaemon(0LL);
  uint64_t v9 = static VCDaemon.daemon.getter();
  dispatch thunk of VCDaemon.stop()();
  uint64_t v10 = swift_release(v9);
  return xpc_transaction_exit_clean(v10);
}

uint64_t sub_100003338(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_100003364()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = &_swiftEmptyArrayStorage;
  unint64_t v1 = sub_10000344C();
  uint64_t v2 = sub_10000348C(&qword_100008020);
  unint64_t v3 = sub_1000034CC();
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v5, v2, v3, v0, v1);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000033F8()
{
  unint64_t result = qword_100008010;
  if (!qword_100008010)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_source);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008010);
  }

  return result;
}

uint64_t sub_100003434(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100003444(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_10000344C()
{
  unint64_t result = qword_100008018;
  if (!qword_100008018)
  {
    uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_100008018);
  }

  return result;
}

uint64_t sub_10000348C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_1000034CC()
{
  unint64_t result = qword_100008028;
  if (!qword_100008028)
  {
    uint64_t v1 = sub_100003510(&qword_100008020);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100008028);
  }

  return result;
}

uint64_t sub_100003510(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

  ;
}
uint64_t variable initialization expression of ExecutiveBridge.executive()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;
  v0 = type metadata accessor for Executive.Environment(0LL);
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for Executive(0LL);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))( v3,  enum case for Executive.Environment.production(_:),  v0);
  return Executive.__allocating_init(environment:)(v3);
}

uint64_t variable initialization expression of ExecutiveBridge.invoker()
{
  return 0LL;
}

id SimulatorExecutive.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

char *ExecutiveBridge.init()()
{
  v1 = v0;
  uint64_t v2 = type metadata accessor for Executive.Environment(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = OBJC_IVAR____TtC14photoanalysisd15ExecutiveBridge_executive;
  type metadata accessor for Executive(0LL);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for Executive.Environment.production(_:),  v2);
  v7 = v1;
  *(void *)&v1[v6] = Executive.__allocating_init(environment:)(v5);
  *(void *)&v7[OBJC_IVAR____TtC14photoanalysisd15ExecutiveBridge_invoker] = 0LL;

  v8 = (objc_class *)type metadata accessor for ExecutiveBridge();
  v13.receiver = v7;
  v13.super_class = v8;
  v9 = (char *)objc_msgSendSuper2(&v13, "init");
  id v10 = [objc_allocWithZone(PHAInvoker) initWithDelegate:v9];
  v11 = *(void **)&v9[OBJC_IVAR____TtC14photoanalysisd15ExecutiveBridge_invoker];
  *(void *)&v9[OBJC_IVAR____TtC14photoanalysisd15ExecutiveBridge_invoker] = v10;

  return v9;
}

uint64_t type metadata accessor for ExecutiveBridge()
{
  return objc_opt_self(&OBJC_CLASS____TtC14photoanalysisd15ExecutiveBridge);
}

uint64_t sub_100005748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return swift_task_switch(sub_100005760, 0LL, 0LL);
}

uint64_t sub_100005760()
{
  v1 = (void *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of Executive.startup() + 1));
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_1000057C8;
  return v3();
}

uint64_t sub_1000057C8()
{
  return swift_task_switch(sub_10000581C, 0LL, 0LL);
}

uint64_t sub_10000581C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000584C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_1000064C8(a1, &qword_10000C7C8);
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
  uint64_t v16 = swift_allocObject(&unk_100008408, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10000C7E8, v16);
}

uint64_t sub_1000059AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return swift_task_switch(sub_1000059C4, 0LL, 0LL);
}

uint64_t sub_1000059C4()
{
  v1 = (void *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of Executive.shutdown() + 1));
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_100005A2C;
  return v3();
}

uint64_t sub_100005A2C()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(v3 + 32);
  uint64_t v3 = *v0;
  swift_task_dealloc(v1);
  return swift_task_switch(sub_1000066E0, 0LL, 0LL);
}

uint64_t sub_100005A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  uint64_t v6 = type metadata accessor for Logger(0LL, a2);
  v5[5] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[6] = v7;
  v5[7] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100005AF4, 0LL, 0LL);
}

uint64_t sub_100005AF4()
{
  v0[2] = *(void *)(v0[3] + OBJC_IVAR____TtC14photoanalysisd15ExecutiveBridge_executive);
  swift_retain();
  Logger.init(subsystem:category:)(0xD000000000000018LL, 0x8000000100007480LL, 0x737574617473LL, 0xE600000000000000LL);
  uint64_t v1 = (void *)swift_task_alloc(*((unsigned int *)&async function pointer to StatusProtocol.dumpStatus(to:) + 1));
  v0[8] = v1;
  uint64_t v2 = type metadata accessor for Executive(0LL);
  unint64_t v3 = sub_100006598();
  void *v1 = v0;
  v1[1] = sub_100005BB4;
  return StatusProtocol.dumpStatus(to:)(v0[7], v2, v3);
}

uint64_t sub_100005BB4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 56);
  uint64_t v3 = *(void *)(*v0 + 40);
  uint64_t v4 = *(void *)(*v0 + 48);
  swift_task_dealloc(*(void *)(*v0 + 64));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_release(*(void *)(v1 + 16), v5);
  return swift_task_switch(sub_100005C28, 0LL, 0LL);
}

uint64_t sub_100005C28()
{
  uint64_t v1 = *(void *)(v0 + 56);
  OS_dispatch_semaphore.signal()();
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_100005C78(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v9 = a1;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
  static TaskPriority.userInitiated.getter();
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v8, 0LL, 1LL, v11);
  uint64_t v12 = (void *)swift_allocObject(a3, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = v9;
  v12[5] = v10;
  id v13 = v9;
  uint64_t v14 = v10;
  uint64_t v15 = sub_10000584C((uint64_t)v8, a4, (uint64_t)v12);
  swift_release(v15, v16);
  OS_dispatch_semaphore.wait()();
}

Swift::Bool __swiftcall ExecutiveBridge.listener(_:shouldAcceptNewConnection:)( NSXPCListener *_, NSXPCConnection *shouldAcceptNewConnection)
{
  uint64_t v3 = v2;
  char v5 = dispatch thunk of Executive.listener(_:shouldAcceptNewConnection:)(_);
  if ((v5 & 1) != 0)
  {
    -[NSXPCConnection setDelegate:]( shouldAcceptNewConnection,  "setDelegate:",  *(void *)(v3 + OBJC_IVAR____TtC14photoanalysisd15ExecutiveBridge_invoker));
    -[NSXPCConnection resume](shouldAcceptNewConnection, "resume");
  }

  return v5 & 1;
}

id ExecutiveBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExecutiveBridge();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t ExecutiveBridge.target(forOriginalTarget:connection:selector:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = sub_100005FE8(&qword_10000C6D0);
  if (swift_dynamicCast(v13, v15, (char *)&type metadata for Any + 8, v7, 6LL))
  {
    sub_100006028(v13, (uint64_t)v16);
    uint64_t v8 = v17;
    uint64_t v9 = v18;
    sub_1000063E0(v16, v17);
    uint64_t v10 = dispatch thunk of LegacyDispatchProtocol.targetForSelector(_:connection:)(a3, a2, v8, v9);
    if (v10)
    {
      uint64_t v11 = v10;
      *(void *)(a4 + 24) = swift_getObjectType(v10);
      *(void *)a4 = v11;
    }

    else
    {
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
    }

    return sub_1000063C0(v16);
  }

  else
  {
    uint64_t v14 = 0LL;
    memset(v13, 0, sizeof(v13));
    uint64_t result = sub_1000064C8((uint64_t)v13, &qword_10000C6D8);
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }

  return result;
}

uint64_t sub_100005FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005FE8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100006028(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t variable initialization expression of SimulatorExecutive.logger()
{
  return Logger.init(subsystem:category:)( 0x616E616F746F6870LL,  0xEE0064736973796CLL,  0xD000000000000012LL,  0x80000001000073C0LL);
}

uint64_t sub_100006244(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000062A8;
  return v6(a1);
}

uint64_t sub_1000062A8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t _s14photoanalysisd15ExecutiveBridgeC17dispatchOperation_8toTarget7serviceySo020PHAServiceCancelableE0C_ypyptF_0( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100005FE8(&qword_10000C6D0);
  if (swift_dynamicCast(v9, v11, (char *)&type metadata for Any + 8, v5, 6LL))
  {
    sub_100006028(v9, (uint64_t)v12);
    uint64_t v6 = v13;
    uint64_t v7 = v14;
    sub_1000063E0(v12, v13);
    dispatch thunk of LegacyDispatchProtocol.performOperation(_:on:)(a1, a2, v6, v7);
    return sub_1000063C0(v12);
  }

  else
  {
    uint64_t v10 = 0LL;
    memset(v9, 0, sizeof(v9));
    return sub_1000064C8((uint64_t)v9, &qword_10000C6D8);
  }
}

uint64_t sub_1000063C0(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = *(void *)(v1 - 8);
  if ((*(_BYTE *)(v2 + 82) & 2) != 0) {
    return swift_release(*a1, v1);
  }
  else {
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
}

void *sub_1000063E0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_100006408(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc(dword_10000C7D4);
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100006480;
  return sub_100005A94(a1, v4, v5, v7, v6);
}

uint64_t sub_100006480()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000064C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005FE8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100006504(uint64_t a1, uint64_t a2)
{
  return swift_deallocObject(v2, 32LL, 7LL);
}

uint64_t sub_100006528(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10000C7E4);
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100006480;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10000C7E0 + dword_10000C7E0))(a1, v4);
}

unint64_t sub_100006598()
{
  unint64_t result = qword_10000C7F0;
  if (!qword_10000C7F0)
  {
    uint64_t v1 = type metadata accessor for Executive(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Executive, v1);
    atomic_store(result, &qword_10000C7F0);
  }

  return result;
}

uint64_t sub_1000065E4()
{
  uint64_t v2 = swift_task_alloc(dword_10000C7FC);
  __int128 v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_1000066DC;
  *(_OWORD *)(v2 + 16) = v3;
  return swift_task_switch(sub_1000059C4, 0LL, 0LL);
}

uint64_t sub_100006648()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10000667C()
{
  uint64_t v2 = swift_task_alloc(dword_10000C80C);
  __int128 v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_1000066DC;
  *(_OWORD *)(v2 + 16) = v3;
  return swift_task_switch(sub_100005760, 0LL, 0LL);
}

id SimulatorExecutive.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SimulatorExecutive(0LL);
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for SimulatorExecutive(uint64_t a1)
{
  uint64_t result = qword_10000C8A8;
  if (!qword_10000C8A8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SimulatorExecutive);
  }
  return result;
}

id SimulatorExecutive.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SimulatorExecutive(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100006894()
{
  return type metadata accessor for SimulatorExecutive(0LL);
}

uint64_t sub_10000689C(uint64_t a1, uint64_t a2)
{
  uint64_t result = type metadata accessor for Logger(319LL, a2);
  if (v4 <= 0x3F)
  {
    uint64_t v5 = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 1LL, &v5, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t start()
{
  uint64_t v0 = objc_autoreleasePoolPush();
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    PLDebugEnableCoreDataMultithreadedAsserts();
    uint64_t v1 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.photoanalysisd");
    objc_super v2 = objc_alloc_init(&OBJC_CLASS____TtC14photoanalysisd15ExecutiveBridge);
    uint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    uint64_t v16 = sub_100006B10;
    uint64_t v17 = &unk_1000084E0;
    uint64_t v18 = v2;
    __int128 v3 = sub_100006BB0(0xFuLL, &v14);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = (void *)qword_10000C8C8;
    qword_10000C8C8 = v4;

    dispatch_resume((dispatch_object_t)qword_10000C8C8);
    uint64_t v6 = v2;
    uint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    uint64_t v16 = sub_100006C24;
    uint64_t v17 = &unk_1000084E0;
    uint64_t v18 = v6;
    uint64_t v7 = v6;
    uint64_t v8 = sub_100006BB0(0x1DuLL, &v14);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = (void *)qword_10000C8D0;
    qword_10000C8D0 = v9;

    dispatch_resume((dispatch_object_t)qword_10000C8D0);
    -[NSXPCListener setDelegate:](v1, "setDelegate:", v7);
    -[ExecutiveBridge startup](v7, "startup");
    -[NSXPCListener resume](v1, "resume");
    objc_autoreleasePoolPop(v0);
    CFRunLoopRun();
    uint64_t v11 = 70LL;
  }

  else
  {
    if (__PXLog_genericOnceToken != -1LL) {
      dispatch_once((dispatch_once_t *)&__PXLog_genericOnceToken, &stru_100008498);
    }
    uint64_t v12 = (os_log_s *)__PXLog_genericOSLog;
    if (os_log_type_enabled(__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "photoanalysisd launched prior to first unlock",  (uint8_t *)&v14,  2u);
    }

    objc_autoreleasePoolPop(v0);
    uint64_t v1 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v11 = 69LL;
  }

  return v11;
}

uint64_t sub_100006B10(uint64_t a1)
{
  if (__PXLog_genericOnceToken != -1LL) {
    dispatch_once((dispatch_once_t *)&__PXLog_genericOnceToken, &stru_1000084B8);
  }
  objc_super v2 = (os_log_s *)__PXLog_genericOSLog;
  if (os_log_type_enabled(__PXLog_genericOSLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "photoanalysisd shutting down due to SIGTERM",  v4,  2u);
  }

  return xpc_transaction_exit_clean([*(id *)(a1 + 32) shutdown]);
}

dispatch_source_s *sub_100006BB0(uintptr_t a1, void *a2)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  id v6 = a2;
  uint64_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a1, 0LL, v5);
  dispatch_source_set_event_handler(v7, v6);

  return v7;
}

id sub_100006C24(uint64_t a1)
{
  return _[*(id *)(a1 + 32) dumpStatusToLog];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return _[a1 shutdown];
}

id objc_msgSend_startup(void *a1, const char *a2, ...)
{
  return _[a1 startup];
}
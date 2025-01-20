int main(int argc, const char **argv, const char **envp)
{
  id v3;
  qword_1000088C8 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for ServiceDelegate()) init];
  v3 = [(id)objc_opt_self(NSXPCListener) serviceListener];
  qword_1000088D0 = (uint64_t)v3;
  [v3 setDelegate:qword_1000088C8];
  [v3 resume];
  return 0;
}

uint64_t type metadata accessor for ServiceDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC23SAExtensionOrchestrator15ServiceDelegate);
}

void sub_10000205C(uint64_t a1)
{
  if (qword_100008760 != -1) {
    swift_once(&qword_100008760, sub_1000025F4);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_1000025DC(v2, (uint64_t)qword_1000088D8);
  swift_errorRetain(a1);
  uint64_t v3 = swift_errorRetain(a1);
  oslog = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    v6 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)v5 = 138412290;
    swift_errorRetain(a1);
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError(a1);
    uint64_t v10 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v5 + 4, v5 + 12);
    uint64_t *v6 = v7;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Error getting remoteObjectProxy: %@", v5, 0xCu);
    uint64_t v8 = sub_10000259C(&qword_1000087F8);
    swift_arrayDestroy(v6, 1LL, v8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }
}

void sub_10000221C(uint64_t a1, void *a2)
{
  os_log_type_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

id sub_100002304()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100002334(void *a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Orchestrator(0LL, a2);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = (void *)objc_opt_self(&OBJC_CLASS___NSXPCInterface);
  id v8 =  [v7 interfaceWithProtocol:&OBJC_PROTOCOL____TtP13SiriAnalytics29ExtensionOrchestratorProtocol_];
  [a1 setExportedInterface:v8];

  id v9 =  [v7 interfaceWithProtocol:&OBJC_PROTOCOL____TtP13SiriAnalytics33ExtensionOrchestratorHostProtocol_];
  [a1 setRemoteObjectInterface:v9];

  aBlock[4] = sub_10000205C;
  aBlock[5] = 0LL;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10000221C;
  aBlock[3] = &unk_100004300;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = [a1 remoteObjectProxyWithErrorHandler:v10];
  _Block_release(v10);
  _bridgeAnyObjectToAny(_:)(aBlock, v11);
  swift_unknownObjectRelease(v11);
  uint64_t v12 = sub_10000259C(&qword_1000087F0);
  uint64_t v13 = swift_dynamicCast(&v22, aBlock, (char *)&type metadata for Any + 8, v12, 6LL);
  if ((_DWORD)v13)
  {
    uint64_t v14 = v22;
    v15 = (objc_class *)type metadata accessor for ExtensionOrchestrator(0LL);
    id v16 = objc_allocWithZone(v15);
    swift_unknownObjectRetain(v14);
    id v17 = v16;
    Orchestrator.init(host:)(v14);
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))( (uint64_t)v17 + OBJC_IVAR____TtC23SAExtensionOrchestrator21ExtensionOrchestrator_orchestrator,  v6,  v3);

    v21.receiver = v17;
    v21.super_class = v15;
    id v18 = objc_msgSendSuper2(&v21, "init");
    [a1 setExportedObject:v18];
    [a1 resume];

    swift_unknownObjectRelease(v14);
  }

  return v13;
}

uint64_t sub_100002584(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100002594(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000259C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000025DC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000025F4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100002FD8(v0, qword_1000088D8);
  sub_1000025DC(v0, (uint64_t)qword_1000088D8);
  return Logger.init(subsystem:category:)( 0xD000000000000018LL,  0x8000000100003A40LL,  0x6976726553435058LL,  0xEA00000000006563LL);
}

uint64_t sub_10000266C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_10000259C(&qword_100008898);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100008760 != -1) {
    swift_once(&qword_100008760, sub_1000025F4);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = sub_1000025DC(v8, (uint64_t)qword_1000088D8);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Ingest called", v12, 2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  uint64_t v13 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v7, 1LL, 1LL, v13);
  uint64_t v14 = (void *)swift_allocObject(&unk_100004338, 56LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = v3;
  v14[5] = a1;
  v14[6] = a2;
  id v15 = v3;
  swift_retain(a2);
  uint64_t v16 = sub_100002968((uint64_t)v7, (uint64_t)&unk_1000088A8, (uint64_t)v14);
  return swift_release(v16);
}

uint64_t sub_1000027FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to Orchestrator.ingest()[1]);
  v6[4] = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_100002854;
  return Orchestrator.ingest()();
}

uint64_t sub_100002854(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 32);
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    uint64_t v6 = sub_10000290C;
  }

  else
  {
    *(void *)(v4 + 48) = a1;
    uint64_t v6 = sub_1000028C8;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_1000028C8()
{
  uint64_t v1 = *(void *)(v0 + 48);
  (*(void (**)(uint64_t, void))(v0 + 16))(v1, 0LL);
  swift_bridgeObjectRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000290C()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void (**)(void, uint64_t))(v0 + 16);
  swift_errorRetain(v1);
  v2(0LL, v1);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100002968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100002E54(a1);
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
  uint64_t v16 = swift_allocObject(&unk_100004360, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    id v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    id v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_1000088B8, v16);
}

void sub_100002B18(objc_class *a1, uint64_t a2, uint64_t a3)
{
  Class isa = a1;
  if (a1)
  {
    type metadata accessor for StagingReport(0LL);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }

  if (a2) {
    uint64_t v6 = _convertErrorToNSError(_:)(a2);
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, isa);
}

id sub_100002C30()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExtensionOrchestrator(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100002CA0()
{
  return type metadata accessor for ExtensionOrchestrator(0LL);
}

uint64_t type metadata accessor for ExtensionOrchestrator(uint64_t a1)
{
  uint64_t result = qword_100008888;
  if (!qword_100008888) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ExtensionOrchestrator);
  }
  return result;
}

uint64_t sub_100002CE4(uint64_t a1, uint64_t a2)
{
  uint64_t result = type metadata accessor for Orchestrator(319LL, a2);
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

uint64_t sub_100002D50()
{
  swift_release(*(void *)(v0 + 48));
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_100002D84()
{
  uint64_t v2 = swift_task_alloc(dword_1000088A4);
  __int128 v3 = *(_OWORD *)(v0 + 40);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_100002E0C;
  *(_OWORD *)(v2 + 16) = v3;
  unint64_t v4 = (uint64_t *)swift_task_alloc(async function pointer to Orchestrator.ingest()[1]);
  *(void *)(v2 + 32) = v4;
  *unint64_t v4 = v2;
  v4[1] = (uint64_t)sub_100002854;
  return Orchestrator.ingest()();
}

uint64_t sub_100002E0C()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100002E54(uint64_t a1)
{
  uint64_t v2 = sub_10000259C(&qword_100008898);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100002E94(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100002EF8;
  return v6(a1);
}

uint64_t sub_100002EF8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100002F44()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100002F68(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_1000088B4);
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100002E0C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000088B0 + dword_1000088B0))(a1, v4);
}

uint64_t *sub_100002FD8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100003018(uint64_t a1)
{
  if (qword_100008760 != -1) {
    swift_once(&qword_100008760, sub_1000025F4);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_1000025DC(v2, (uint64_t)qword_1000088D8);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Publish called", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  uint64_t v7 = type metadata accessor for OrchestratedExtensionError(0LL);
  unint64_t v8 = sub_100003154();
  uint64_t v9 = swift_allocError(v7, v8, 0LL, 0LL);
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v7 - 8) + 104LL))( v10,  enum case for OrchestratedExtensionError.notImplemented(_:),  v7);
  os_log_type_t v11 = (void *)_convertErrorToNSError(_:)(v9);
  (*(void (**)(uint64_t, void *))(a1 + 16))(a1, v11);

  return swift_errorRelease(v9);
}

unint64_t sub_100003154()
{
  unint64_t result = qword_1000088C0;
  if (!qword_1000088C0)
  {
    uint64_t v1 = type metadata accessor for OrchestratedExtensionError(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for OrchestratedExtensionError, v1);
    atomic_store(result, (unint64_t *)&qword_1000088C0);
  }

  return result;
}

uint64_t sub_10000319C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000031C0(objc_class *a1, uint64_t a2)
{
}
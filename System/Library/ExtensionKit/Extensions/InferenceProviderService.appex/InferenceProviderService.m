uint64_t BuiltInInferenceProvider.inferenceProvider.getter@<X0>(void *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  void v11[5];
  v3 = type metadata accessor for BuiltInInferenceProvider(0LL);
  v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v11[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v1, v3);
  if ((*(unsigned int (**)(char *, uint64_t))(v4 + 88))(v6, v3) == enum case for BuiltInInferenceProvider.tokenGeneration(_:))
  {
    v7 = type metadata accessor for OnDeviceInferenceProvider(0LL);
    swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
    v8 = OnDeviceInferenceProvider.init()();
    v11[3] = v7;
    v11[4] = sub_1000027E8();
    v11[0] = v8;
    a1[3] = type metadata accessor for InferenceProviderAdapter(0LL);
    a1[4] = &protocol witness table for InferenceProviderAdapter;
    sub_100002828(a1);
    return InferenceProviderAdapter.init(_:)(v11);
  }

  else
  {
    result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0LL,  0xE000000000000000LL,  "InferenceProviderService/BuiltInInferenceProviderExtensions.swift",  65LL,  2LL,  53LL,  0);
    __break(1u);
  }

  return result;
}

unint64_t sub_1000027E8()
{
  unint64_t result = qword_1000080C0;
  if (!qword_1000080C0)
  {
    uint64_t v1 = type metadata accessor for OnDeviceInferenceProvider(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for OnDeviceInferenceProvider, v1);
    atomic_store(result, (unint64_t *)&qword_1000080C0);
  }

  return result;
}

void *sub_100002828(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_100002864@<X0>(void *a1@<X8>)
{
  return BuiltInInferenceProvider.inferenceProvider.getter(a1);
}

uint64_t sub_100002878()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100003554(v0, qword_1000080C8);
  sub_1000032C8(v0, (uint64_t)qword_1000080C8);
  uint64_t v1 = subsystemName.getter();
  return Logger.init(subsystem:category:)(v1);
}

uint64_t sub_1000028E0()
{
  uint64_t result = sub_100003624(v0, 24LL);
  *(void *)(result + 16) = 0LL;
  return result;
}

uint64_t sub_100002900()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t sub_100002924()
{
  return swift_retain(v0);
}

uint64_t sub_10000292C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = sub_100002924();
  *a1 = v3;
  return result;
}

uint64_t sub_100002954@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000028E0();
  *a1 = result;
  return result;
}

uint64_t sub_100002978()
{
  return 0LL;
}

uint64_t sub_100002980(_xpc_connection_s *a1)
{
  uint64_t v2 = v1;
  sub_10000326C(&qword_1000081A8);
  __chkstk_darwin();
  sub_100003600();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for InferenceProviderXPCRequestDispatcher.ProviderConfiguration(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  sub_100003600();
  v11 = (void *)(v10 - v9);
  pid_t pid = xpc_connection_get_pid(a1);
  type metadata accessor for InferenceProviderXPCRequestDispatcher(0LL);
  void *v11 = sub_100002D38;
  v11[1] = 0LL;
  (*(void (**)(void *, void, uint64_t))(v8 + 104))( v11,  enum case for InferenceProviderXPCRequestDispatcher.ProviderConfiguration.uninitializedBuiltIn(_:),  v7);
  uint64_t v13 = InferenceProviderXPCRequestDispatcher.__allocating_init(configuration:)(v11);
  sub_10000326C(&qword_1000081B0);
  uint64_t v27 = v13;
  swift_retain(v13);
  uint64_t v14 = TaskCancellingXPCPeerHandler.__allocating_init(handler:)(&v27);
  type metadata accessor for XPCSession(0LL);
  uint64_t v15 = sub_100003624((uint64_t)&unk_1000042E8, 20LL);
  *(_DWORD *)(v15 + 16) = pid;
  type metadata accessor for XPCSession.InitializationOptions(0LL);
  __chkstk_darwin();
  sub_100003600();
  uint64_t v18 = v17 - v16;
  swift_unknownObjectRetain(a1);
  uint64_t v19 = swift_retain(v14);
  static XPCSession.InitializationOptions.none.getter(v19);
  uint64_t v20 = XPCSession.__allocating_init(fromConnection:targetQueue:options:incomingMessageHandler:cancellationHandler:)( a1,  0LL,  v18,  &j___s20ModelManagerServices28TaskCancellingXPCPeerHandlerC21handleIncomingRequestySE_pSg3XPC18XPCReceivedMessageVFTj,  v14,  sub_1000032C0,  v15);
  uint64_t v21 = type metadata accessor for TaskPriority(0LL);
  sub_10000336C(v6, 1LL, 1LL, v21);
  type metadata accessor for MainActor(0LL);
  swift_retain(v2);
  uint64_t v22 = swift_retain(v20);
  uint64_t v23 = static MainActor.shared.getter(v22);
  v24 = (void *)sub_100003624((uint64_t)&unk_100004310, 48LL);
  v24[2] = v23;
  v24[3] = &protocol witness table for MainActor;
  v24[4] = v2;
  v24[5] = v20;
  uint64_t v25 = sub_100003028(v6, (uint64_t)&unk_1000081C8, (uint64_t)v24);
  swift_release(v25);
  swift_release(v20);
  swift_release(v14);
  return swift_release(v13);
}

uint64_t sub_100002D38@<X0>(void *a1@<X8>)
{
  return BuiltInInferenceProvider.inferenceProvider.getter(a1);
}

void sub_100002D58(uint64_t a1, int a2)
{
  if (qword_1000080B8 != -1) {
    swift_once(&qword_1000080B8, sub_100002878);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_1000032C8(v4, (uint64_t)qword_1000080C8);
  uint64_t v5 = type metadata accessor for XPCRichError(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v10 = v9(v8, a1, v5);
  v11 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v12 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc(18LL, -1LL);
    uint64_t v14 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v13 = 67109378;
    HIDWORD(v21) = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)((char *)&v21 + 4, &v22, v13 + 4, v13 + 8);
    *(_WORD *)(v13 + 8) = 2112;
    unint64_t v15 = sub_100003594();
    uint64_t v16 = swift_allocError(v5, v15, 0LL, 0LL);
    v9(v17, (uint64_t)v8, v5);
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError(v16);
    uint64_t v20 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v13 + 10, v13 + 18);
    *uint64_t v14 = v18;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "Session with host process with %d was cancelled: %@",  (uint8_t *)v13,  0x12u);
    uint64_t v19 = sub_10000326C(&qword_1000081B8);
    swift_arrayDestroy(v14, 1LL, v19);
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  exit(1);
}

uint64_t sub_100002F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = type metadata accessor for MainActor(0LL);
  v5[4] = static MainActor.shared.getter(v6);
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  return swift_task_switch(sub_100002FD4, v7, v8);
}

uint64_t sub_100002FD4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 16);
  swift_release(*(void *)(v0 + 32));
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v2 + 16) = v1;
  swift_retain(v1);
  swift_release(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_100003450(a1, 1LL, v6) == 1)
  {
    sub_10000345C(a1);
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

  uint64_t v15 = swift_allocObject(&unk_100004338, 32LL, 7LL);
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
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

  return swift_task_create(v7, v16, (char *)&type metadata for () + 8, &unk_1000081D8, v15);
}

uint64_t sub_100003164(_xpc_connection_s *a1)
{
  return sub_100002980(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for BuiltInInferenceProviderService();
  uint64_t v4 = sub_100003230(&qword_1000080E0, (uint64_t)&unk_100003A30);
  static AppExtension.main()(v3, v4);
  return 0;
}

uint64_t type metadata accessor for BuiltInInferenceProviderService()
{
  return objc_opt_self(&OBJC_CLASS____TtC24InferenceProviderService31BuiltInInferenceProviderService);
}

uint64_t sub_10000320C()
{
  return sub_100003230(&qword_1000081A0, (uint64_t)&unk_100003A08);
}

uint64_t sub_100003230(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for BuiltInInferenceProviderService();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10000326C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000032B0()
{
  return swift_deallocObject(v0, 20LL, 7LL);
}

void sub_1000032C0(uint64_t a1)
{
}

uint64_t sub_1000032C8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000032E0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100003344;
  return v6(a1);
}

uint64_t sub_100003344()
{
  return sub_1000035F4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10000336C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_100003378()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_1000033AC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  unsigned __int8 v8 = (void *)swift_task_alloc(dword_1000081C4);
  *(void *)(v2 + 16) = v8;
  *unsigned __int8 v8 = v2;
  v8[1] = sub_100003424;
  return sub_100002F68(a1, v4, v5, v7, v6);
}

uint64_t sub_100003424()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_10000345C(uint64_t a1)
{
  uint64_t v2 = sub_10000326C(&qword_1000081A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000349C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000034C0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_1000081D4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100003530;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000081D0 + dword_1000081D0))(a1, v4);
}

uint64_t sub_100003530()
{
  return sub_1000035F4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t *sub_100003554(uint64_t a1, uint64_t *a2)
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

unint64_t sub_100003594()
{
  unint64_t result = qword_1000081E0;
  if (!qword_1000081E0)
  {
    uint64_t v1 = type metadata accessor for XPCRichError(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for XPCRichError, v1);
    atomic_store(result, (unint64_t *)&qword_1000081E0);
  }

  return result;
}

uint64_t sub_1000035D4()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_1000035F4(uint64_t (*a1)(void))
{
  return a1();
}

  ;
}

uint64_t sub_100003610()
{
  return swift_errorRelease(v0);
}

uint64_t sub_100003618(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_100003624(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}
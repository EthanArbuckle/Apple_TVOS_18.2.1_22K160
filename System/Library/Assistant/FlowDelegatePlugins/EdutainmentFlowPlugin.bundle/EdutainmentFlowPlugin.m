uint64_t sub_4888(uint64_t a1, uint64_t a2)
{
  return sub_4CBC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_48A0(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_4914(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_4990@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_49D0(uint64_t a1, uint64_t a2)
{
  return sub_4CBC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_49EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void type metadata accessor for FileProtectionType(uint64_t a1)
{
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void sub_4A3C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_4A80(uint64_t a1)
{
  uint64_t v2 = sub_4B5C( (unint64_t *)&qword_25088,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_1B490);
  uint64_t v3 = sub_4B5C( (unint64_t *)&unk_25090,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_1B28C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_4B04()
{
  return sub_4B5C( &qword_25048,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_1B250);
}

uint64_t sub_4B30()
{
  return sub_4B5C( &qword_25050,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_1B224);
}

uint64_t sub_4B5C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_4B9C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_4BE0(uint64_t a1)
{
  uint64_t v2 = sub_4B5C( &qword_25078,  (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType,  (uint64_t)&unk_1B400);
  uint64_t v3 = sub_4B5C( &qword_25080,  (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType,  (uint64_t)&unk_1B3A0);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_4C64()
{
  return sub_4B5C( &qword_25058,  (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType,  (uint64_t)&unk_1B364);
}

uint64_t sub_4C90()
{
  return sub_4B5C( &qword_25060,  (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType,  (uint64_t)&unk_1B338);
}

uint64_t sub_4CBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_4CF8(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_4D38(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_4DA8(void *a1, uint64_t *a2)
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

uint64_t sub_4E30()
{
  return sub_4B5C( &qword_25068,  (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType,  (uint64_t)&unk_1B3D4);
}

uint64_t sub_4E5C()
{
  return sub_4B5C( &qword_25070,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_1B2C0);
}

uint64_t sub_4E90(uint64_t a1, uint64_t a2)
{
  v3[14] = a2;
  v3[15] = v2;
  v3[13] = a1;
  uint64_t v4 = type metadata accessor for AceOutput(0LL);
  v3[16] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[17] = v5;
  v3[18] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_4EF4, 0LL, 0LL);
}

uint64_t sub_4EF4()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void **)(v0 + 104);
  uint64_t v3 = sub_5BF4(&qword_254D0);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_1B4E0;
  *(void *)(v4 + 32) = v2;
  uint64_t v30 = v4;
  specialized Array._endMutation()();
  *(_OWORD *)(v0 + 16) = 0u;
  *(void *)(v0 + 48) = 0LL;
  *(_OWORD *)(v0 + 32) = 0u;
  id v5 = v2;
  static AceOutputHelper.makeAceOutput(allAddViews:nlContextUpdate:additionalCommands:flowActivity:)( v30,  v1,  &_swiftEmptyArrayStorage,  v0 + 16);
  swift_bridgeObjectRelease(v30);
  sub_5C78(v0 + 16, &qword_254E8);
  if (qword_24FC8 != -1) {
    swift_once(&qword_24FC8, sub_E09C);
  }
  uint64_t v6 = *(void **)(v0 + 104);
  uint64_t v7 = type metadata accessor for Logger(0LL);
  *(void *)(v0 + 152) = sub_5BDC(v7, (uint64_t)qword_27F10);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  BOOL v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 104);
  if (v10)
  {
    v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    v13 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)v12 = 138412290;
    *(void *)(v0 + 96) = v11;
    id v14 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v12 + 4, v12 + 12);
    void *v13 = v11;

    _os_log_impl(&dword_0, v8, v9, "submitting addViews command: %@", v12, 0xCu);
    uint64_t v15 = sub_5BF4((uint64_t *)&unk_254F0);
    swift_arrayDestroy(v13, 1LL, v15);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {

    uint64_t v8 = *(os_log_s **)(v0 + 104);
  }

  v17 = (os_log_s *)Logger.logObject.getter(v16);
  os_log_type_t v18 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_0, v17, v18, "submit addViews command and nlContextUpdate", v19, 2u);
    swift_slowDealloc(v19, -1LL, -1LL);
  }

  uint64_t v21 = *(void *)(v0 + 136);
  uint64_t v20 = *(void *)(v0 + 144);
  v23 = *(void **)(v0 + 120);
  uint64_t v22 = *(void *)(v0 + 128);

  v24 = v23 + 7;
  uint64_t v25 = v23[10];
  uint64_t v26 = v23[11];
  sub_5C34(v24, v25);
  *(void *)(v0 + 80) = v22;
  *(void *)(v0 + 88) = &protocol witness table for AceOutput;
  v27 = sub_5CB4((void *)(v0 + 56));
  (*(void (**)(void *, uint64_t, uint64_t))(v21 + 16))(v27, v20, v22);
  v28 = (void *)swift_task_alloc(async function pointer to dispatch thunk of OutputPublisherAsync.publish(output:)[1]);
  *(void *)(v0 + 160) = v28;
  void *v28 = v0;
  v28[1] = sub_520C;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 56, v25, v26);
}

uint64_t sub_520C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 160);
  *(void *)(*v1 + 168) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_52BC;
  }

  else
  {
    sub_5C58((void *)(v2 + 56));
    uint64_t v4 = sub_5278;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_5278()
{
  uint64_t v1 = *(void *)(v0 + 144);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 136) + 8LL))(v1, *(void *)(v0 + 128));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_52BC()
{
  uint64_t v1 = sub_5C58((void *)(v0 + 56));
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.error.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = *(void *)(v0 + 168);
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_0, v2, v3, "submit commands failed.", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  swift_errorRelease(v5);

  uint64_t v7 = *(void *)(v0 + 144);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 136) + 8LL))(v7, *(void *)(v0 + 128));
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_538C()
{
  v1[12] = v0;
  uint64_t v2 = sub_5BF4(&qword_254E0);
  v1[13] = swift_task_alloc((*(void *)(*(void *)(v2 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for AceOutput(0LL);
  v1[14] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v1[15] = v4;
  v1[16] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for NLContextUpdate(0LL);
  v1[17] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v1[18] = v6;
  v1[19] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_5438, 0LL, 0LL);
}

uint64_t sub_5438()
{
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 104);
  NLContextUpdate.init()();
  NLContextUpdate.weightedPromptTargetDomain.setter(0xD00000000000001DLL, 0x800000000001A6A0LL);
  NLContextUpdate.weightedPromptStrict.setter(1LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v1, v3);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, 0LL, 1LL, v3);
  *(_OWORD *)(v0 + 16) = 0u;
  *(void *)(v0 + 48) = 0LL;
  *(_OWORD *)(v0 + 32) = 0u;
  static AceOutputHelper.makeAceOutput(allAddViews:nlContextUpdate:additionalCommands:flowActivity:)( &_swiftEmptyArrayStorage,  v4,  &_swiftEmptyArrayStorage,  v0 + 16);
  sub_5C78(v0 + 16, &qword_254E8);
  sub_5C78(v4, &qword_254E0);
  if (qword_24FC8 != -1) {
    swift_once(&qword_24FC8, sub_E09C);
  }
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = sub_5BDC(v5, (uint64_t)qword_27F10);
  *(void *)(v0 + 160) = v6;
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)os_log_type_t v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "submit nlContextUpdate.", v9, 2u);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  uint64_t v11 = *(void *)(v0 + 120);
  uint64_t v10 = *(void *)(v0 + 128);
  uint64_t v12 = *(void *)(v0 + 112);
  v13 = *(void **)(v0 + 96);

  id v14 = v13 + 7;
  uint64_t v15 = v13[10];
  uint64_t v16 = v13[11];
  sub_5C34(v14, v15);
  *(void *)(v0 + 80) = v12;
  *(void *)(v0 + 88) = &protocol witness table for AceOutput;
  v17 = sub_5CB4((void *)(v0 + 56));
  (*(void (**)(void *, uint64_t, uint64_t))(v11 + 16))(v17, v10, v12);
  os_log_type_t v18 = (void *)swift_task_alloc(async function pointer to dispatch thunk of OutputPublisherAsync.publish(output:)[1]);
  *(void *)(v0 + 168) = v18;
  *os_log_type_t v18 = v0;
  v18[1] = sub_5650;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 56, v15, v16);
}

uint64_t sub_5650()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 168);
  *(void *)(*v1 + 176) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_5738;
  }

  else
  {
    sub_5C58((void *)(v2 + 56));
    uint64_t v4 = sub_56BC;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_56BC()
{
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v5 = *(void *)(v0 + 104);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 120) + 8LL))(v4, *(void *)(v0 + 112));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_5738()
{
  uint64_t v1 = sub_5C58((void *)(v0 + 56));
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.error.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = *(void *)(v0 + 176);
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_0, v2, v3, "submit nlContextUpdate failed.", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  swift_errorRelease(v5);

  uint64_t v8 = *(void *)(v0 + 144);
  uint64_t v7 = *(void *)(v0 + 152);
  uint64_t v10 = *(void *)(v0 + 128);
  uint64_t v9 = *(void *)(v0 + 136);
  uint64_t v11 = *(void *)(v0 + 104);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 120) + 8LL))(v10, *(void *)(v0 + 112));
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  swift_task_dealloc(v7);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_5838()
{
  return swift_deallocClassInstance(v0, 96LL, 7LL);
}

uint64_t type metadata accessor for EdutainmentOutput()
{
  return objc_opt_self(&OBJC_CLASS____TtC21EdutainmentFlowPlugin17EdutainmentOutput);
}

void sub_5884(uint64_t a1, unint64_t a2)
{
  if (qword_24FC8 != -1) {
    swift_once(&qword_24FC8, sub_E09C);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_5BDC(v4, (uint64_t)qword_27F10);
  uint64_t v5 = swift_bridgeObjectRetain_n(a2, 2LL);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    v26[0] = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v25 = sub_17E80(a1, a2, v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl(&dword_0, v6, v7, "startRequest: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  id v10 = [objc_allocWithZone(SAStartRequest) init];
  [v10 setOrigin:SAInputOriginServerGeneratedValue];
  NSString v11 = String._bridgeToObjectiveC()();
  [v10 setUtterance:v11];

  id v12 = [objc_allocWithZone(SASendCommands) init];
  uint64_t v13 = sub_5BF4(&qword_254D0);
  uint64_t v14 = swift_allocObject(v13, 40LL, 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_1B4E0;
  *(void *)(v14 + 32) = v10;
  v26[0] = v14;
  specialized Array._endMutation()();
  uint64_t v15 = v26[0];
  uint64_t v16 = (os_log_s *)v10;
  sub_5BF4(&qword_254D8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v15);
  [v12 setCommands:isa];

  static AceService.currentAsync.getter(v26);
  uint64_t v18 = v27;
  uint64_t v19 = v28;
  sub_5C34(v26, v27);
  AceServiceInvokerAsync.submitAndForget(_:)(v12, v18, v19);
  uint64_t v20 = sub_5C58(v26);
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
  os_log_type_t v22 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_0, v21, v22, "submit SAStartRequest ", v23, 2u);
    swift_slowDealloc(v23, -1LL, -1LL);
    v24 = v16;
  }

  else
  {
    v24 = v21;
    uint64_t v21 = v16;
  }
}

uint64_t sub_5BDC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_5BF4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void *sub_5C34(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_5C58(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_5C78(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5BF4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

void *sub_5CB4(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_5CF0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Parse.DirectInvocation(0LL);
  uint64_t v45 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v44 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for Parse(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Input(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  NSString v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_24FC8 != -1) {
    swift_once(&qword_24FC8, sub_E09C);
  }
  uint64_t v12 = type metadata accessor for Logger(0LL);
  uint64_t v13 = sub_5BDC(v12, (uint64_t)qword_27F10);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v46 = a1;
  uint64_t v15 = v14(v11, a1, v8);
  uint64_t v43 = v13;
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc(12LL, -1LL);
    uint64_t v39 = v5;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v20 = swift_slowAlloc(32LL, -1LL);
    uint64_t v42 = v4;
    uint64_t v21 = v20;
    uint64_t v48 = v20;
    uint64_t v40 = v2;
    v41 = v7;
    *(_DWORD *)uint64_t v19 = 136315138;
    uint64_t v22 = Input.description.getter();
    unint64_t v24 = v23;
    uint64_t v47 = sub_17E80(v22, v23, &v48);
    uint64_t v2 = v40;
    os_log_type_t v7 = v41;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v19 + 4, v19 + 12);
    swift_bridgeObjectRelease(v24);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl(&dword_0, v16, v17, "edutainment input is: %s", v19, 0xCu);
    swift_arrayDestroy(v21, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v25 = v21;
    uint64_t v4 = v42;
    swift_slowDealloc(v25, -1LL, -1LL);
    uint64_t v26 = v19;
    uint64_t v5 = v39;
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  Input.parse.getter();
  uint64_t v27 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if ((_DWORD)v27 == enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v7, v4);
    v29 = v44;
    uint64_t v28 = v45;
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v44, v7, v2);
    uint64_t v30 = sub_159FC();
    if (v30)
    {
      uint64_t v31 = v30;
      sub_7138(v30);
      swift_release(v31);
      (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v2);
      return 1LL;
    }

    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v2);
  }

  else
  {
    v33 = (os_log_s *)Logger.logObject.getter(v27);
    os_log_type_t v34 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = v5;
      v36 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_0, v33, v34, "please use directInvocaion instead.", v36, 2u);
      v37 = v36;
      uint64_t v5 = v35;
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  return 0LL;
}

uint64_t sub_60A4(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v2[7] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[8] = v4;
  v2[9] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_6104, 0LL, 0LL);
}

void sub_6104()
{
  __asm { BR              X10 }

uint64_t sub_6158()
{
  uint64_t v3 = qword_24FC8;
  swift_retain_n(v0, 2LL);
  if (v3 != -1) {
    swift_once(&qword_24FC8, sub_E09C);
  }
  uint64_t v4 = sub_5BDC(*(void *)(v1 + 56), (uint64_t)qword_27F10);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "step1: initialize", v7, 2u);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  sub_74B0(v0);
  ((void (*)(void))static ExecuteResponse.ongoing(requireInput:))(0LL);
  sub_8144(v0, v2);
  sub_8144(v0, v2);
  swift_task_dealloc(*(void *)(v1 + 72));
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_6A84()
{
  return swift_task_switch(sub_6AD8, 0LL, 0LL);
}

uint64_t sub_6AD8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_6B10()
{
  return swift_task_switch(sub_6B64, 0LL, 0LL);
}

uint64_t sub_6B64()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v1 + 80);
  if (v2)
  {
    *(void *)(v1 + 80) = 0LL;
    if (qword_24FD0 != -1) {
      swift_once(&qword_24FD0, sub_1722C);
    }
    uint64_t v3 = qword_27F28;
    if (qword_27F28)
    {
      uint64_t v4 = swift_retain(v2);
      sub_8A58(v4, v3, (uint64_t)&unk_211F0, (uint64_t)sub_8CBC, (uint64_t)&unk_21208);
      swift_release(v2);
    }

    swift_release(v2);
  }

  static ExecuteResponse.complete()();
  swift_task_dealloc(*(void *)(v0 + 72));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_6C18()
{
  return swift_task_switch(sub_8CCC, 0LL, 0LL);
}

uint64_t sub_6C6C(uint64_t a1, uint64_t a2)
{
  if (qword_24FC8 != -1) {
    swift_once(&qword_24FC8, sub_E09C);
  }
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = sub_5BDC(v3, (uint64_t)qword_27F10);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "step3: complete playing flow", v7, 2u);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  uint64_t v8 = *(void *)(a2 + 16);
  unint64_t v9 = *(void *)(a2 + 24);
  *(_OWORD *)(a2 + 16) = xmmword_1B670;
  return sub_8144(v8, v9);
}

uint64_t sub_6D4C(uint64_t a1, unint64_t a2)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)nullsub_1 + 4 * byte_1B54D[a2 >> 62]))( 0x696C616974696E69LL,  0xEA0000000000657ALL);
}

uint64_t sub_6D88()
{
  return 0x6C70207472617473LL;
}

uint64_t sub_6DAC()
{
  return 0x646E652072657375LL;
}

uint64_t sub_6DD0@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)nullsub_1 + 4 * byte_1B551[a1]))( 0xD000000000000011LL,  0x800000000001A780LL);
}

uint64_t sub_6E00()
{
  return 0x657375206465656ELL;
}

uint64_t sub_6E24(uint64_t a1)
{
  return a1 + 27;
}

uint64_t sub_6E3C()
{
  return 0x7070757320746F6ELL;
}

uint64_t sub_6E60()
{
  return 0x7265207475706E69LL;
}

void *sub_6E80()
{
  if (v0[10]) {
    __asm { BR              X10 }
  }

  sub_8144(v0[2], v0[3]);
  sub_8A1C(v0[4], v0[5], v0[6], v0[7], v0[8], v0[9]);
  swift_release(v0[10]);
  swift_release(v0[11]);
  sub_5C58(v0 + 12);
  return v0;
}

uint64_t sub_70F8()
{
  return swift_deallocClassInstance(v0, 136LL, 7LL);
}

uint64_t type metadata accessor for EdutainmentDispatchFlow()
{
  return objc_opt_self(&OBJC_CLASS____TtC21EdutainmentFlowPlugin23EdutainmentDispatchFlow);
}

uint64_t sub_7138(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v10 = v2[4];
  uint64_t v11 = v2[5];
  uint64_t v12 = v2[6];
  uint64_t v13 = v2[7];
  uint64_t v14 = v2[8];
  uint64_t v15 = v2[9];
  v2[4] = v4;
  v2[5] = v5;
  v2[6] = v6;
  v2[7] = v7;
  v2[8] = v9;
  v2[9] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v7);
  sub_8A1C(v10, v11, v12, v13, v14, v15);
  int v16 = 1 << *(_BYTE *)(a1 + 90);
  if ((v16 & 0xD) != 0)
  {
    if (qword_24FC8 != -1) {
      swift_once(&qword_24FC8, sub_E09C);
    }
    uint64_t v17 = type metadata accessor for Logger(0LL);
    sub_5BDC(v17, (uint64_t)qword_27F10);
    uint64_t v18 = swift_retain_n(a1, 2LL);
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
    os_log_type_t v20 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v22 = swift_slowAlloc(32LL, -1LL);
      uint64_t v42 = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      uint64_t v23 = sub_5BF4(&qword_25678);
      uint64_t v24 = Optional.debugDescription.getter(v23);
      unint64_t v26 = v25;
      uint64_t v41 = sub_17E80(v24, v25, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v21 + 4, v21 + 12);
      swift_release_n(a1, 2LL);
      swift_bridgeObjectRelease(v26);
      _os_log_impl(&dword_0, v19, v20, "edutainment new clientAction = %s", v21, 0xCu);
      swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1LL, -1LL);
      swift_slowDealloc(v21, -1LL, -1LL);
    }

    else
    {

      swift_release_n(a1, 2LL);
    }

    uint64_t v30 = v2[2];
    unint64_t v31 = v2[3];
    v2[2] = a1;
    v2[3] = 0LL;
    swift_retain(a1);
    return sub_8144(v30, v31);
  }

  else
  {
    if ((v16 & 0x30) != 0)
    {
      uint64_t v27 = v2[2];
      unint64_t v28 = v2[3];
      __int128 v29 = xmmword_1B690;
    }

    else
    {
      uint64_t v33 = v2[15];
      uint64_t v34 = v2[16];
      sub_5C34(v2 + 12, v33);
      if ((dispatch thunk of DeviceState.isLockedWithPasscode.getter(v33, v34) & 1) != 0)
      {
        if (qword_24FC8 != -1) {
          swift_once(&qword_24FC8, sub_E09C);
        }
        uint64_t v35 = type metadata accessor for Logger(0LL);
        uint64_t v36 = sub_5BDC(v35, (uint64_t)qword_27F10);
        v37 = (os_log_s *)Logger.logObject.getter(v36);
        os_log_type_t v38 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v37, v38))
        {
          uint64_t v39 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v39 = 0;
          _os_log_impl(&dword_0, v37, v38, "Device is locked when user end game", v39, 2u);
          swift_slowDealloc(v39, -1LL, -1LL);
        }
      }

      else
      {
        uint64_t v40 = v2[10];
        v2[10] = a1;
        swift_retain(a1);
        swift_release(v40);
      }

      uint64_t v27 = v2[2];
      unint64_t v28 = v2[3];
      __int128 v29 = xmmword_1B680;
    }

    *((_OWORD *)v2 + 1) = v29;
    return sub_8144(v27, v28);
  }

uint64_t sub_74B0(uint64_t a1)
{
  uint64_t v2 = v1;
  if (a1)
  {
    uint64_t v3 = v1[5];
    if (v3)
    {
      uint64_t v5 = v1[4];
      uint64_t v6 = v1[8];
      uint64_t v7 = v2[9];
      uint64_t v8 = v2[6];
      uint64_t v9 = v2[7];
      uint64_t v67 = v2[4];
      uint64_t v68 = v3;
      uint64_t v69 = v8;
      uint64_t v70 = v9;
      uint64_t v71 = v6;
      uint64_t v72 = v7;
      uint64_t v64 = *(unsigned __int8 *)(a1 + 90);
      swift_retain(a1);
      uint64_t v60 = v5;
      os_log_t log = (os_log_t)v7;
      uint64_t v63 = v9;
      sub_8814(v5, v3, v8, v9, v6, v7);
      if (qword_24FC8 != -1) {
        swift_once(&qword_24FC8, sub_E09C);
      }
      uint64_t v10 = type metadata accessor for Logger(0LL);
      uint64_t v11 = sub_5BDC(v10, (uint64_t)qword_27F10);
      uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
      os_log_type_t v13 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v15 = swift_slowAlloc(32LL, -1LL);
        v66[0] = v15;
        *(_DWORD *)uint64_t v14 = 136315138;
        uint64_t v16 = sub_5BF4(&qword_25678);
        uint64_t v17 = Optional.debugDescription.getter(v16);
        unint64_t v19 = v18;
        uint64_t v65 = sub_17E80(v17, v18, v66);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v14 + 4, v14 + 12);
        swift_bridgeObjectRelease(v19);
        _os_log_impl(&dword_0, v12, v13, "edutainment clientAction = %s", v14, 0xCu);
        swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v15, -1LL, -1LL);
        swift_slowDealloc(v14, -1LL, -1LL);
      }

      uint64_t v20 = v2[10];
      if (v20)
      {
        uint64_t v21 = (void *)v2[10];
      }

      else
      {
        swift_retain(a1);
        uint64_t v21 = (void *)a1;
      }

      uint64_t v30 = v2[15];
      uint64_t v31 = v2[16];
      sub_5C34(v2 + 12, v30);
      swift_retain(v20);
      if ((dispatch thunk of DeviceState.isLockedWithPasscode.getter(v30, v31) & 1) != 0)
      {
        swift_bridgeObjectRelease(v3);
        swift_bridgeObjectRelease(v63);
        uint64_t v32 = swift_bridgeObjectRelease(log);
        uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
        os_log_type_t v34 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v33, v34))
        {
          uint64_t v35 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v35 = 0;
          _os_log_impl(&dword_0, v33, v34, "device is locked, so play game directly.", v35, 2u);
          swift_slowDealloc(v35, -1LL, -1LL);
        }

        __asm { BR              X9 }
      }

      uint64_t v36 = swift_retain_n(v21, 2LL);
      v37 = (os_log_s *)Logger.logObject.getter(v36);
      os_log_type_t v38 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v40 = swift_slowAlloc(32LL, -1LL);
        v66[0] = v40;
        *(_DWORD *)uint64_t v39 = 136315138;
        uint64_t v41 = sub_E148();
        unint64_t v43 = v42;
        uint64_t v65 = sub_17E80(v41, v42, v66);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v39 + 4, v39 + 12);
        swift_bridgeObjectRelease(v43);
        swift_release_n(v21, 2LL);
        _os_log_impl(&dword_0, v37, v38, "edutainment game state = %s", v39, 0xCu);
        swift_arrayDestroy(v40, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v40, -1LL, -1LL);
        swift_slowDealloc(v39, -1LL, -1LL);
      }

      else
      {
        swift_release_n(v21, 2LL);
      }

      os_log_t v44 = log;
      uint64_t v45 = v21[4];
      uint64_t v46 = v21[5];
      if (v45 == v60 && v3 == v46 || (_stringCompareWithSmolCheck(_:_:expecting:)(v45, v46, v60, v3, 0LL) & 1) != 0)
      {
        swift_bridgeObjectRelease(v63);
        uint64_t v47 = v3;
      }

      else
      {
        if (v21[13] != 1LL)
        {
          uint64_t v59 = a1;
          swift_bridgeObjectRetain(log);
          swift_bridgeObjectRetain(v3);
          uint64_t v48 = swift_bridgeObjectRetain(v63);
          v49 = (os_log_s *)Logger.logObject.getter(v48);
          os_log_type_t v50 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v49, v50))
          {
            loga = v49;
            v51 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v52 = swift_slowAlloc(32LL, -1LL);
            v66[0] = v52;
            *(_DWORD *)v51 = 136315138;
            uint64_t v53 = sub_8F24();
            unint64_t v55 = v54;
            uint64_t v65 = sub_17E80(v53, v54, v66);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v51 + 4, v51 + 12);
            swift_bridgeObjectRelease(v55);
            swift_bridgeObjectRelease_n(v3, 2LL);
            swift_bridgeObjectRelease_n(v63, 2LL);
            swift_bridgeObjectRelease_n(v44, 2LL);
            v49 = loga;
            _os_log_impl(&dword_0, loga, v50, "edutainment newGame = %s", v51, 0xCu);
            swift_arrayDestroy(v52, 1LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v52, -1LL, -1LL);
            swift_slowDealloc(v51, -1LL, -1LL);
          }

          else
          {
            swift_bridgeObjectRelease_n(v3, 2LL);
            swift_bridgeObjectRelease_n(v63, 2LL);
            swift_bridgeObjectRelease_n(log, 2LL);
          }

          if (qword_24FD0 != -1) {
            swift_once(&qword_24FD0, sub_1722C);
          }
          uint64_t v56 = qword_27F28;
          if (qword_27F28)
          {
            uint64_t v57 = swift_retain(v21);
            sub_8A58(v57, v56, (uint64_t)&unk_211A0, (uint64_t)sub_8968, (uint64_t)&unk_211B8);
            swift_release(v21);
          }

          uint64_t v58 = v2[10];
          v2[10] = v59;
          swift_retain(v59);
          swift_release(v58);
LABEL_27:
          __asm { BR              X10 }
        }

        swift_bridgeObjectRelease(v3);
        uint64_t v47 = v63;
      }

      swift_bridgeObjectRelease(v47);
      swift_bridgeObjectRelease(log);
      goto LABEL_27;
    }
  }

  if (qword_24FC8 != -1) {
    swift_once(&qword_24FC8, sub_E09C);
  }
  uint64_t v22 = type metadata accessor for Logger(0LL);
  uint64_t v23 = sub_5BDC(v22, (uint64_t)qword_27F10);
  uint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
  os_log_type_t v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    unint64_t v26 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)unint64_t v26 = 0;
    _os_log_impl(&dword_0, v24, v25, "invalid game state", v26, 2u);
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  uint64_t v27 = v2[2];
  unint64_t v28 = v2[3];
  *((_OWORD *)v2 + 1) = xmmword_1B6B0;
  return sub_8144(v27, v28);
}

uint64_t *initializeBufferWithCopyOfBuffer for EdutainmentDispatchFlow.EdutainmentFlowState( uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_811C(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_811C(uint64_t a1, unint64_t a2)
{
  return result;
}

uint64_t destroy for EdutainmentDispatchFlow.EdutainmentFlowState(uint64_t a1)
{
  return sub_8144(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t sub_8144(uint64_t result, unint64_t a2)
{
  if (a2 >> 62)
  {
    if (a2 >> 62 != 1) {
      return result;
    }
    uint64_t result = a2 & 0x3FFFFFFFFFFFFFFFLL;
  }

  return swift_release(result);
}

uint64_t *assignWithCopy for EdutainmentDispatchFlow.EdutainmentFlowState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_811C(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_8144(v5, v6);
  return a1;
}

__n128 initializeWithTake for EdutainmentDispatchFlow.EdutainmentFlowState(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for EdutainmentDispatchFlow.EdutainmentFlowState(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_8144(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for EdutainmentDispatchFlow.EdutainmentFlowState( uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7D && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 125);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 57) >> 5) | (4
                                                          * ((*(void *)(a1 + 8) >> 57) & 0x18 | *(void *)(a1 + 8) & 7))) ^ 0x7F;
  if (v3 >= 0x7C) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for EdutainmentDispatchFlow.EdutainmentFlowState( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7C)
  {
    *(void *)__n128 result = a2 - 125;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0x7D) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7D) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)__n128 result = 0LL;
      *(void *)(result + 8) = (v3 | (v3 << 57)) & 0xF000000000000007LL;
    }
  }

  return result;
}

uint64_t sub_8294(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8) >> 62;
  if ((_DWORD)v1 == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return v1;
  }
}

uint64_t sub_82B0(uint64_t result)
{
  *(void *)(result + 8) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

void *sub_82C0(void *result, uint64_t a2)
{
  if (a2 < 3)
  {
    result[1] = result[1] & 0xFFFFFFFFFFFFFF8LL | (a2 << 62);
  }

  else
  {
    *__n128 result = (a2 - 3);
    result[1] = 0xC000000000000000LL;
  }

  return result;
}

ValueMetadata *type metadata accessor for EdutainmentDispatchFlow.EdutainmentFlowState()
{
  return &type metadata for EdutainmentDispatchFlow.EdutainmentFlowState;
}

uint64_t sub_82F8(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    uint64_t v8 = qword_24FC8;
    swift_retain(a1);
    if (v8 != -1) {
      swift_once(&qword_24FC8, sub_E09C);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    sub_5BDC(v9, (uint64_t)qword_27F10);
    uint64_t v10 = swift_retain_n(a1, 2LL);
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v11, v12))
    {
      os_log_type_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v14 = swift_slowAlloc(32LL, -1LL);
      uint64_t v24 = v14;
      *(_DWORD *)os_log_type_t v13 = 136315138;
      uint64_t v15 = sub_E148();
      unint64_t v17 = v16;
      uint64_t v23 = sub_17E80(v15, v16, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v13 + 4, v13 + 12);
      swift_release_n(a1, 2LL);
      swift_bridgeObjectRelease(v17);
      _os_log_impl(&dword_0, v11, v12, "edutainment storedGameState = %s", v13, 0xCu);
      swift_arrayDestroy(v14, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v14, -1LL, -1LL);
      swift_slowDealloc(v13, -1LL, -1LL);
    }

    else
    {

      swift_release_n(a1, 2LL);
    }

    __asm { BR              X11 }
  }

  uint64_t v19 = a2[10];
  a2[10] = a4;
  swift_retain(a4);
  swift_release(v19);
  uint64_t v20 = a2[2];
  unint64_t v21 = a2[3];
  a2[2] = 0LL;
  a2[3] = a5 | 0x4000000000000000LL;
  swift_retain(a5);
  return sub_8144(v20, v21);
}

uint64_t sub_8634()
{
  return sub_6D4C(*(void *)v0, *(void *)(v0 + 8));
}

uint64_t sub_863C(uint64_t a1)
{
  return sub_5CF0(a1) & 1;
}

uint64_t sub_8660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to Flow.onAsync(input:)[1]);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_86C8;
  return Flow.onAsync(input:)(a1, a2, a3);
}

uint64_t sub_86C8(uint64_t a1)
{
  uint64_t v4 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 16));
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_8718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for EdutainmentDispatchFlow();
  return Flow.deferToExecuteAsync(_:)(a1, a2, v7, a4);
}

uint64_t sub_8770(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_2552C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_87C4;
  return sub_60A4(a1);
}

uint64_t sub_87C4()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_8814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    swift_bridgeObjectRetain(a6);
    swift_bridgeObjectRetain(a2);
    return swift_bridgeObjectRetain(a4);
  }

  return result;
}

uint64_t sub_8850()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_8884(uint64_t a1)
{
  return sub_82F8(a1, *(void **)(v1 + 16), *(_BYTE *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_8894(uint64_t a1)
{
  uint64_t v2 = sub_5BF4(&qword_25670);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_88D4()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

uint64_t sub_8908(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_8950(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_8968()
{
  return sub_1754C((void *)(v0 + 16), *(void *)(v0 + 56));
}

uint64_t sub_8974(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_8984(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_898C()
{
  unint64_t result = qword_25690;
  if (!qword_25690)
  {
    uint64_t v1 = sub_89D8(&qword_25688);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_25690);
  }

  return result;
}

uint64_t sub_89D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_8A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    return swift_bridgeObjectRelease(a6);
  }

  return result;
}

uint64_t sub_8A58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v25 = *(void *)(v10 - 8);
  __chkstk_darwin();
  os_log_type_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin();
  unint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v30[3] = type metadata accessor for GameState();
  v30[4] = &off_21940;
  v30[0] = a1;
  uint64_t v24 = *(void *)(a2 + 24);
  sub_8908((uint64_t)v30, (uint64_t)v29);
  uint64_t v17 = swift_allocObject(a3, 64LL, 7LL);
  sub_8950(v29, v17 + 16);
  *(void *)(v17 + 56) = a2;
  aBlock[4] = a4;
  uint64_t v28 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_175A4;
  aBlock[3] = a5;
  unint64_t v18 = _Block_copy(aBlock);
  swift_retain(a1);
  uint64_t v19 = swift_retain(a2);
  static DispatchQoS.unspecified.getter(v19);
  unint64_t v26 = &_swiftEmptyArrayStorage;
  uint64_t v20 = sub_4B5C( &qword_25680,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v21 = sub_5BF4(&qword_25688);
  unint64_t v22 = sub_898C();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v21, v22, v10, v20);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v16, v12, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  swift_release(v28);
  return sub_5C58(v30);
}

uint64_t sub_8C70(uint64_t a1)
{
  return sub_6C6C(a1, v1);
}

uint64_t sub_8C78()
{
  uint64_t v1 = *(void *)(v0 + 16);
  unint64_t v2 = *(void *)(v0 + 24);
  *(_OWORD *)(v0 + 16) = xmmword_1B670;
  return sub_8144(v1, v2);
}

uint64_t sub_8C90()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

uint64_t sub_8CBC()
{
  return sub_17D04((void *)(v0 + 16), *(void *)(v0 + 56));
}

uint64_t initializeBufferWithCopyOfBuffer for ConversationData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for EdutainmentGame(void *a1)
{
  return swift_bridgeObjectRelease(a1[5]);
}

void *initializeWithCopy for EdutainmentGame(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

void *assignWithCopy for EdutainmentGame(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 initializeWithTake for EdutainmentGame(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for EdutainmentGame(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a2[5];
  uint64_t v9 = a1[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for EdutainmentGame(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EdutainmentGame(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 48) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for EdutainmentGame()
{
  return &type metadata for EdutainmentGame;
}

uint64_t sub_8F24()
{
  uint64_t v1 = *v0;
  unint64_t v2 = (void *)v0[1];
  swift_bridgeObjectRetain(v2);
  v3._countAndFlagsBits = v1;
  v3._object = v2;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(v2);
  v4._countAndFlagsBits = 2592LL;
  v4._object = (void *)0xE200000000000000LL;
  String.append(_:)(v4);
  uint64_t v5 = v0[2];
  uint64_t v6 = (void *)v0[3];
  swift_bridgeObjectRetain(v6);
  v7._countAndFlagsBits = v5;
  v7._object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(v6);
  v8._countAndFlagsBits = 2592LL;
  v8._object = (void *)0xE200000000000000LL;
  String.append(_:)(v8);
  swift_bridgeObjectRetain(0xE500000000000000LL);
  v9._countAndFlagsBits = 0x79726F6765746163LL;
  v9._object = (void *)0xE90000000000003ALL;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(0xE500000000000000LL);
  swift_bridgeObjectRelease(0xE90000000000003ALL);
  uint64_t v10 = v0[5];
  if (v10)
  {
    uint64_t v11 = v0[4];
    os_log_type_t v12 = (void *)v0[5];
  }

  else
  {
    uint64_t v11 = 0LL;
    os_log_type_t v12 = (void *)0xE000000000000000LL;
  }

  swift_bridgeObjectRetain(v10);
  v13._countAndFlagsBits = v11;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRetain(0xE500000000000000LL);
  v14._countAndFlagsBits = 0x6C75636966666964LL;
  v14._object = (void *)0xEB000000003A7974LL;
  String.append(_:)(v14);
  swift_bridgeObjectRelease(0xE500000000000000LL);
  swift_bridgeObjectRelease(0xEB000000003A7974LL);
  return 0x3A656D616ELL;
}

uint64_t sub_90B4()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t sub_90E0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain(*(void *)(v0 + 24));
  return v1;
}

uint64_t sub_910C(char a1)
{
  uint64_t v1 = 8LL * a1;
  v2._countAndFlagsBits = *(void *)&aPlay_2[v1];
  Swift::String v3 = *(void **)((char *)&unk_1B7B0 + v1);
  v2._object = v3;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(v3);
  v4._countAndFlagsBits = 39LL;
  v4._object = (void *)0xE100000000000000LL;
  String.append(_:)(v4);
  return 39LL;
}

void sub_917C(char a1)
{
  __asm { BR              X10 }

uint64_t sub_91D0()
{
  v0._countAndFlagsBits = 0x657461647075LL;
  v0._object = (void *)0xE600000000000000LL;
  String.append(_:)(v0);
  swift_bridgeObjectRelease(0xE600000000000000LL);
  v1._countAndFlagsBits = 39LL;
  v1._object = (void *)0xE100000000000000LL;
  String.append(_:)(v1);
  return v3;
}

uint64_t destroy for EdutainmentQuestion(void *a1)
{
  return swift_bridgeObjectRelease(a1[10]);
}

uint64_t initializeWithCopy for EdutainmentQuestion(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 56) = v6;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

uint64_t assignWithCopy for EdutainmentQuestion(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v12 = *(void *)(a2 + 80);
  uint64_t v13 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  return a1;
}

__n128 initializeWithTake for EdutainmentQuestion(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  __int128 v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for EdutainmentQuestion(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(*(void *)(a1 + 24));
  uint64_t v6 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease(v6);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease(v7);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  uint64_t v8 = *(void *)(a2 + 80);
  uint64_t v9 = *(void *)(a1 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for EdutainmentQuestion(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EdutainmentQuestion(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 88) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for EdutainmentQuestion()
{
  return &type metadata for EdutainmentQuestion;
}

uint64_t sub_9548(char a1)
{
  return *(void *)&aMultipleBOOLea[8 * a1];
}

uint64_t sub_9568(char *a1, char *a2)
{
  return sub_ECE8(*a1, *a2);
}

Swift::Int sub_9574()
{
  return sub_ED6C(*v0);
}

uint64_t sub_957C(uint64_t a1)
{
  return sub_F394(a1, *v1);
}

Swift::Int sub_9584(uint64_t a1)
{
  return sub_F3D4(a1, *v1);
}

unint64_t sub_958C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_9BAC(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_95B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_9548(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_95E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_A550();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_963C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_A550();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_9688(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_96C0 + 4 * byte_1B7F0[a1]))( 0xD000000000000012LL,  0x800000000001A480LL);
}

uint64_t sub_96C0()
{
  return 0x79726F6765746163LL;
}

uint64_t sub_96D8()
{
  return 0x6E6F697473657571LL;
}

uint64_t sub_96F0()
{
  return 0x73726577736E61LL;
}

uint64_t sub_9708()
{
  return 1953393000LL;
}

uint64_t sub_9718()
{
  return 1701869940LL;
}

uint64_t sub_9728()
{
  return 0x6C75636966666964LL;
}

uint64_t sub_9744(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_977C + 4 * byte_1B7F7[a1]))( 0xD000000000000012LL,  0x800000000001A480LL);
}

uint64_t sub_977C()
{
  return 0x79726F6765746163LL;
}

uint64_t sub_9794()
{
  return 0x6E6F697473657571LL;
}

uint64_t sub_97AC()
{
  return 0x73726577736E61LL;
}

uint64_t sub_97C4()
{
  return 1953393000LL;
}

uint64_t sub_97D4()
{
  return 1701869940LL;
}

uint64_t sub_97E4()
{
  return 0x6C75636966666964LL;
}

void sub_9800(char *a1)
{
}

void sub_980C()
{
}

void sub_9818(uint64_t a1)
{
}

void sub_9820(uint64_t a1)
{
}

unint64_t sub_9828@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_9BF4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_9854@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_9688(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_987C()
{
  return sub_9744(*v0);
}

unint64_t sub_9884@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_9BF4(a1);
  *a2 = result;
  return result;
}

uint64_t sub_98A8()
{
  return 0LL;
}

void sub_98B4(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_98C0(uint64_t a1)
{
  unint64_t v2 = sub_A070();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_98E8(uint64_t a1)
{
  unint64_t v2 = sub_A070();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_9910(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_5BF4(&qword_256C0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_5C34(a1, v9);
  unint64_t v11 = sub_A070();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for EdutainmentQuestion.CodingKeys,  &type metadata for EdutainmentQuestion.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  LOBYTE(v26) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v26, v5);
  if (!v2)
  {
    uint64_t v14 = v3[2];
    uint64_t v15 = v3[3];
    LOBYTE(v26) = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, &v26, v5);
    uint64_t v26 = v3[4];
    HIBYTE(v25) = 2;
    uint64_t v16 = sub_5BF4(&qword_256B0);
    uint64_t v17 = sub_A0B4( &qword_256C8,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v26, (char *)&v25 + 7, v5, v16, v17);
    uint64_t v18 = v3[5];
    LOBYTE(v26) = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v18, &v26, v5);
    uint64_t v19 = v3[6];
    uint64_t v20 = v3[7];
    LOBYTE(v26) = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v19, v20, &v26, v5);
    LOBYTE(v26) = *((_BYTE *)v3 + 64);
    HIBYTE(v25) = 5;
    unint64_t v21 = sub_A114();
    KeyedEncodingContainer.encode<A>(_:forKey:)( &v26,  (char *)&v25 + 7,  v5,  &type metadata for EdutainmentQuestion.QuestionType,  v21);
    uint64_t v22 = v3[9];
    uint64_t v23 = v3[10];
    LOBYTE(v26) = 6;
    KeyedEncodingContainer.encode(_:forKey:)(v22, v23, &v26, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

double sub_9B40@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v7[4];
    *(void *)(a2 + 80) = v8;
    double result = *(double *)v7;
    __int128 v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
  }

  return result;
}

uint64_t sub_9B98(void *a1)
{
  return sub_9910(a1);
}

unint64_t sub_9BAC(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_20A70, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3) {
    return 3LL;
  }
  else {
    return v3;
  }
}

unint64_t sub_9BF4(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_20AD8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 7) {
    return 7LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_9C3C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_5BF4(&qword_256A0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_5C34(a1, v9);
  unint64_t v11 = sub_A070();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for EdutainmentQuestion.CodingKeys,  &type metadata for EdutainmentQuestion.CodingKeys,  v11,  v9,  v10);
  if (v2)
  {
    sub_5C58(a1);
    return swift_bridgeObjectRelease(0xE000000000000000LL);
  }

  else
  {
    char v44 = 0;
    uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)(&v44, v5);
    uint64_t v14 = v13;
    uint64_t v37 = v12;
    char v43 = 1;
    swift_bridgeObjectRetain(v13);
    uint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)(&v43, v5);
    uint64_t v17 = v16;
    uint64_t v36 = v15;
    uint64_t v18 = sub_5BF4(&qword_256B0);
    char v42 = 2;
    uint64_t v19 = sub_A0B4( &qword_256B8,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    swift_bridgeObjectRetain(v17);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v38, v18, &v42, v5, v18, v19);
    char v41 = 3;
    uint64_t v35 = v38;
    swift_bridgeObjectRetain(v38);
    uint64_t v34 = 0LL;
    uint64_t v32 = KeyedDecodingContainer.decode(_:forKey:)(&v41, v5);
    uint64_t v33 = v17;
    char v40 = 4;
    uint64_t v20 = KeyedDecodingContainer.decode(_:forKey:)(&v40, v5);
    uint64_t v22 = v21;
    uint64_t v31 = v20;
    char v39 = 6;
    swift_bridgeObjectRetain(v21);
    uint64_t v23 = KeyedDecodingContainer.decode(_:forKey:)(&v39, v5);
    uint64_t v25 = v24;
    uint64_t v26 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v34 = v23;
    v26(v8, v5);
    swift_bridgeObjectRetain(v14);
    uint64_t v27 = v33;
    swift_bridgeObjectRetain(v33);
    uint64_t v28 = v35;
    swift_bridgeObjectRetain(v35);
    swift_bridgeObjectRetain(v25);
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v27);
    swift_bridgeObjectRelease(v28);
    sub_5C58(a1);
    swift_bridgeObjectRelease(v25);
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRelease(v28);
    swift_bridgeObjectRelease(v27);
    uint64_t result = swift_bridgeObjectRelease(v14);
    *(void *)a2 = v37;
    *(void *)(a2 + 8) = v14;
    *(void *)(a2 + 16) = v36;
    *(void *)(a2 + 24) = v27;
    uint64_t v30 = v32;
    *(void *)(a2 + 32) = v28;
    *(void *)(a2 + 40) = v30;
    *(void *)(a2 + 48) = v31;
    *(void *)(a2 + 56) = v22;
    *(_BYTE *)(a2 + 64) = 2;
    *(void *)(a2 + 72) = v34;
    *(void *)(a2 + 80) = v25;
  }

  return result;
}

unint64_t sub_A070()
{
  unint64_t result = qword_256A8;
  if (!qword_256A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BA7C, &type metadata for EdutainmentQuestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A8);
  }

  return result;
}

uint64_t sub_A0B4(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_89D8(&qword_256B0);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_A114()
{
  unint64_t result = qword_256D0;
  if (!qword_256D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BA54, &type metadata for EdutainmentQuestion.QuestionType);
    atomic_store(result, (unint64_t *)&qword_256D0);
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for GameState.UserAction(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GameState.UserAction(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for EdutainmentQuestion.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF9) {
    return ((uint64_t (*)(void))((char *)&loc_A244 + 4 * byte_1B803[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_A278 + 4 * byte_1B7FE[v4]))();
}

uint64_t sub_A278(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_A280(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0xA288LL);
  }
  return result;
}

uint64_t sub_A294(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0xA29CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 6;
  return result;
}

uint64_t sub_A2A0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_A2A8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EdutainmentQuestion.CodingKeys()
{
  return &type metadata for EdutainmentQuestion.CodingKeys;
}

uint64_t getEnumTagSinglePayload for EdutainmentQuestion.QuestionType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

uint64_t storeEnumTagSinglePayload for EdutainmentQuestion.QuestionType( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_A3A0 + 4 * byte_1B80D[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_A3D4 + 4 * byte_1B808[v4]))();
}

uint64_t sub_A3D4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_A3DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0xA3E4LL);
  }
  return result;
}

uint64_t sub_A3F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0xA3F8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_A3FC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_A404(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_A410(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_A418(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for EdutainmentQuestion.QuestionType()
{
  return &type metadata for EdutainmentQuestion.QuestionType;
}

unint64_t sub_A434()
{
  unint64_t result = qword_256D8;
  if (!qword_256D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1B93C, &type metadata for EdutainmentQuestion.QuestionType);
    atomic_store(result, (unint64_t *)&qword_256D8);
  }

  return result;
}

unint64_t sub_A47C()
{
  unint64_t result = qword_256E0;
  if (!qword_256E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BA2C, &type metadata for EdutainmentQuestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E0);
  }

  return result;
}

unint64_t sub_A4C4()
{
  unint64_t result = qword_256E8;
  if (!qword_256E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1B964, &type metadata for EdutainmentQuestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E8);
  }

  return result;
}

unint64_t sub_A50C()
{
  unint64_t result = qword_256F0;
  if (!qword_256F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1B98C, &type metadata for EdutainmentQuestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256F0);
  }

  return result;
}

unint64_t sub_A550()
{
  unint64_t result = qword_256F8;
  if (!qword_256F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1B8C4, &type metadata for EdutainmentQuestion.QuestionType);
    atomic_store(result, (unint64_t *)&qword_256F8);
  }

  return result;
}

uint64_t destroy for ConversationData(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 24));
}

void *initializeWithCopy for ConversationData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

void *assignWithCopy for ConversationData(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for ConversationData(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for ConversationData(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConversationData(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ConversationData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 32) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ConversationData()
{
  return &type metadata for ConversationData;
}

uint64_t sub_A77C(char a1)
{
  if ((a1 & 1) != 0) {
    return 0xD000000000000017LL;
  }
  else {
    return 0x7377656956646461LL;
  }
}

uint64_t sub_A7C0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = a4;
  uint64_t v18 = a5;
  uint64_t v9 = sub_5BF4(&qword_25710);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  sub_5C34(a1, v14);
  unint64_t v15 = sub_AEDC();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ConversationData.CodingKeys,  &type metadata for ConversationData.CodingKeys,  v15,  v14,  v13);
  char v20 = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a2, a3, &v20, v9);
  if (!v5)
  {
    char v19 = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v17, v18, &v19, v9);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_A8E8(char *a1, char *a2)
{
  return sub_E7EC(*a1, *a2);
}

Swift::Int sub_A8F4()
{
  return sub_EDD4(*v0);
}

uint64_t sub_A8FC(uint64_t a1)
{
  return sub_F138(a1, *v1);
}

Swift::Int sub_A904(uint64_t a1)
{
  return sub_F534(a1, *v1);
}

uint64_t sub_A90C@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v3._countAndFlagsBits = *a1;
  int v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_20BA0, v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_A968@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_A77C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_A990()
{
  return sub_A77C(*v0);
}

uint64_t sub_A998@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_20BA0, v3);
  uint64_t result = swift_bridgeObjectRelease(object);
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_A9F8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_AA04(uint64_t a1)
{
  unint64_t v2 = sub_AEDC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_AA2C(uint64_t a1)
{
  unint64_t v2 = sub_AEDC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_AA54@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_AD54(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }

  return result;
}

uint64_t sub_AA80(void *a1)
{
  return sub_A7C0(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_AA9C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for JSONEncoder(0LL);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  uint64_t v11 = JSONEncoder.init()();
  uint64_t v29 = a1;
  unint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  unint64_t v12 = sub_B13C();
  uint64_t v13 = dispatch thunk of JSONEncoder.encode<A>(_:)(&v29, &type metadata for ConversationData, v12);
  unint64_t v15 = v14;
  uint64_t v16 = swift_release(v11);
  static String.Encoding.utf8.getter(v16);
  uint64_t v17 = String.init(data:encoding:)(v13, v15, v9);
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v29 = 39LL;
    unint64_t v30 = 0xE100000000000000LL;
    String.append(_:)(*(Swift::String *)&v17);
    v20._countAndFlagsBits = 39LL;
    v20._object = (void *)0xE100000000000000LL;
    String.append(_:)(v20);
    swift_bridgeObjectRelease(v19);
    sub_B0F8(v13, v15);
    return v29;
  }

  else
  {
    if (qword_24FC0 != -1) {
      swift_once(&qword_24FC0, sub_E038);
    }
    uint64_t v23 = type metadata accessor for Logger(0LL);
    uint64_t v24 = sub_5BDC(v23, (uint64_t)qword_27EF8);
    uint64_t v25 = (os_log_s *)Logger.logObject.getter(v24);
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_0, v25, v26, "Failed to decode ConversationData into JSON String.", v27, 2u);
      swift_slowDealloc(v27, -1LL, -1LL);
    }

    uint64_t v21 = 1280070990LL;

    sub_B0F8(v13, v15);
  }

  return v21;
}

uint64_t sub_AD54(void *a1)
{
  uint64_t v3 = sub_5BF4(&qword_25700);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_5C34(a1, v7);
  unint64_t v9 = sub_AEDC();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ConversationData.CodingKeys,  &type metadata for ConversationData.CodingKeys,  v9,  v7,  v8);
  if (v1)
  {
    sub_5C58(a1);
    swift_bridgeObjectRelease(0LL);
  }

  else
  {
    char v13 = 0;
    uint64_t v8 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v13, v3);
    char v12 = 1;
    KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v12, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_5C58(a1);
  }

  return v8;
}

unint64_t sub_AEDC()
{
  unint64_t result = qword_25708;
  if (!qword_25708)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BCB0, &type metadata for ConversationData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25708);
  }

  return result;
}

const unsigned __int8 *sub_AF20(sqlite3_stmt *a1, int a2)
{
  uint64_t v4 = type metadata accessor for String.Encoding(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (sqlite3_column_type(a1, a2) == 5) {
    return 0LL;
  }
  unint64_t result = sqlite3_column_text(a1, a2);
  if (!result) {
    return result;
  }
  uint64_t v9 = String.init(cString:)();
  uint64_t v11 = v10;
  static String.Encoding.utf8.getter(v9);
  uint64_t v12 = String.data(using:allowLossyConversion:)(v7, 0LL, v9, v11);
  unint64_t v14 = v13;
  swift_bridgeObjectRelease(v11);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v14 >> 60 == 15) {
    return 0LL;
  }
  uint64_t v15 = type metadata accessor for JSONDecoder(0LL);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  uint64_t v16 = JSONDecoder.init()();
  unint64_t v17 = sub_B0A0();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)( &v19,  &type metadata for ConversationData,  v12,  v14,  &type metadata for ConversationData,  v17);
  sub_B0E4(v12, v14);
  swift_release(v16);
  return (const unsigned __int8 *)v19;
}

unint64_t sub_B0A0()
{
  unint64_t result = qword_25718;
  if (!qword_25718)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BB8C, &type metadata for ConversationData);
    atomic_store(result, (unint64_t *)&qword_25718);
  }

  return result;
}

uint64_t sub_B0E4(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_B0F8(result, a2);
  }
  return result;
}

uint64_t sub_B0F8(uint64_t result, unint64_t a2)
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

unint64_t sub_B13C()
{
  unint64_t result = qword_25720;
  if (!qword_25720)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BB64, &type metadata for ConversationData);
    atomic_store(result, (unint64_t *)&qword_25720);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for ConversationData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

uint64_t storeEnumTagSinglePayload for ConversationData.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_B25C + 4 * byte_1BB05[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_B290 + 4 * byte_1BB00[v4]))();
}

uint64_t sub_B290(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_B298(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0xB2A0LL);
  }
  return result;
}

uint64_t sub_B2AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0xB2B4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_B2B8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_B2C0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_B2CC(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ConversationData.CodingKeys()
{
  return &type metadata for ConversationData.CodingKeys;
}

unint64_t sub_B2EC()
{
  unint64_t result = qword_25728;
  if (!qword_25728)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BC88, &type metadata for ConversationData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25728);
  }

  return result;
}

unint64_t sub_B334()
{
  unint64_t result = qword_25730;
  if (!qword_25730)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BBC0, &type metadata for ConversationData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25730);
  }

  return result;
}

unint64_t sub_B37C()
{
  unint64_t result = qword_25738;
  if (!qword_25738)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BBE8, &type metadata for ConversationData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25738);
  }

  return result;
}

uint64_t sub_B3C0()
{
  uint64_t v1 = v0;
  sqlite3_close(*(sqlite3 **)(v0 + 16));
  if (qword_24FC0 != -1) {
    swift_once(&qword_24FC0, sub_E038);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_5BDC(v2, (uint64_t)qword_27EF8);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    unsigned int v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl(&dword_0, v4, v5, "Closed database.", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  return swift_deallocClassInstance(v1, 24LL, 7LL);
}

uint64_t type metadata accessor for SqlDatabase()
{
  return objc_opt_self(&OBJC_CLASS____TtC21EdutainmentFlowPlugin11SqlDatabase);
}

uint64_t sub_B4C4()
{
  uint64_t result = sub_B4E4();
  qword_27ED0 = result;
  qword_27ED8 = v1;
  return result;
}

uint64_t sub_B4E4()
{
  uint64_t v1 = (char *)&v48 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  unsigned int v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v48 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v48 - v10;
  uint64_t v12 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v13 = [v12 defaultManager];
  uint64_t v14 = 1LL;
  id v15 = [v13 URLsForDirectory:5 inDomains:1];

  uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, v2);
  if (*(void *)(v16 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))( v1,  v16 + ((*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)),  v2);
    uint64_t v14 = 0LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, v14, 1LL, v2);
  swift_bridgeObjectRelease(v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1LL, v2) == 1)
  {
    sub_5C78((uint64_t)v1, &qword_25848);
    if (qword_24FC0 != -1) {
      swift_once(&qword_24FC0, sub_E038);
    }
    uint64_t v17 = type metadata accessor for Logger(0LL);
    uint64_t v18 = sub_5BDC(v17, (uint64_t)qword_27EF8);
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_0, v19, v20, "Failed to get user document directory.", v21, 2u);
      swift_slowDealloc(v21, -1LL, -1LL);
    }

    return 0LL;
  }

  uint64_t v22 = v11;
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v11, v1, v2);
  URL.appendingPathComponent(_:)(0x7475644569726953LL, 0xEF746E656D6E6961LL);
  id v23 = [v12 defaultManager];
  URL._bridgeToObjectiveC()(v24);
  os_log_type_t v26 = v25;
  uint64_t v27 = sub_5BF4(&qword_25850);
  uint64_t inited = swift_initStackObject(v27, v50);
  *(_OWORD *)(inited + 16) = xmmword_1BD00;
  *(void *)(inited + 32) = NSFileProtectionKey;
  type metadata accessor for FileProtectionType(0LL);
  *(void *)(inited + 64) = v29;
  *(void *)(inited + 40) = NSFileProtectionCompleteUntilFirstUserAuthentication;
  unint64_t v30 = NSFileProtectionKey;
  uint64_t v31 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  unint64_t v32 = sub_CF04(inited);
  type metadata accessor for FileAttributeKey(0LL);
  sub_CEBC();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v32);
  id v49 = 0LL;
  LODWORD(v32) = [v23 createDirectoryAtURL:v26 withIntermediateDirectories:1 attributes:isa error:&v49];

  id v34 = v49;
  if (!(_DWORD)v32)
  {
    id v39 = v49;
    uint64_t v40 = _convertNSErrorToError(_:)(v34);

    swift_willThrow();
    swift_errorRelease(v40);
    if (qword_24FC0 != -1) {
      swift_once(&qword_24FC0, sub_E038);
    }
    uint64_t v41 = type metadata accessor for Logger(0LL);
    uint64_t v42 = sub_5BDC(v41, (uint64_t)qword_27EF8);
    char v43 = (os_log_s *)Logger.logObject.getter(v42);
    os_log_type_t v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v45 = 0;
      _os_log_impl(&dword_0, v43, v44, "Failed to create edutainment directory.", v45, 2u);
      swift_slowDealloc(v45, -1LL, -1LL);
    }

    uint64_t v46 = *(void (**)(char *, uint64_t))(v3 + 8);
    v46(v9, v2);
    v46(v11, v2);
    return 0LL;
  }

  id v35 = v49;
  uint64_t v36 = URL.appendingPathComponent(_:)(0x62642E61746164LL, 0xE700000000000000LL);
  uint64_t v37 = URL.path.getter(v36);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v3 + 8);
  v38(v6, v2);
  v38(v9, v2);
  v38(v22, v2);
  return v37;
}

uint64_t sub_BA2C()
{
  uint64_t result = sub_BA48();
  qword_27EE0 = result;
  return result;
}

uint64_t sub_BA48()
{
  uint64_t v0 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = static os_signpost_type_t.begin.getter(v2);
  if (qword_24FB0 != -1) {
    swift_once(&qword_24FB0, sub_DF3C);
  }
  uint64_t v6 = qword_27EE8;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v5, &dword_0, v6, "openDefaultDatabase", 19LL, 2LL, v4);
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
  uint64_t v8 = v7(v4, v0);
  if (qword_24FA0 != -1) {
    uint64_t v8 = swift_once(&qword_24FA0, sub_B4C4);
  }
  if (qword_27ED8)
  {
    uint64_t v8 = sub_C890(qword_27ED0, qword_27ED8);
    uint64_t v9 = v8;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  uint64_t v10 = static os_signpost_type_t.end.getter(v8);
  uint64_t v11 = qword_27EE8;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v10, &dword_0, v11, "openDefaultDatabase", 19LL, 2LL, v4);
  v7(v4, v0);
  return v9;
}

sqlite3_stmt *sub_BBBC()
{
  uint64_t v1 = v0;
  ppStmt = 0LL;
  uint64_t v2 = *(sqlite3 **)(v0 + 16);
  uint64_t v3 = String.utf8CString.getter();
  int v4 = sqlite3_prepare_v2(v2, (const char *)(v3 + 32), -1, &ppStmt, 0LL);
  swift_release(v3);
  if (!v4) {
    return ppStmt;
  }
  if (qword_24FC0 != -1) {
    swift_once(&qword_24FC0, sub_E038);
  }
  uint64_t v5 = type metadata accessor for Logger(0LL);
  sub_5BDC(v5, (uint64_t)qword_27EF8);
  uint64_t v6 = swift_retain_n(v1, 2LL);
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v10 = swift_slowAlloc(32LL, -1LL);
    uint64_t v16 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    if (sqlite3_errmsg(v2))
    {
      uint64_t v11 = String.init(cString:)();
      unint64_t v13 = v12;
    }

    else
    {
      unint64_t v13 = 0x800000000001A7E0LL;
      uint64_t v11 = 0xD00000000000001DLL;
    }

    uint64_t v15 = sub_17E80(v11, v13, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v9 + 4, v9 + 12);
    swift_release_n(v1, 2LL);
    swift_bridgeObjectRelease(v13);
    _os_log_impl(&dword_0, v7, v8, "%s", v9, 0xCu);
    swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  else
  {

    swift_release_n(v1, 2LL);
  }

  return 0LL;
}

BOOL sub_BDE8(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_BBBC();
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = sqlite3_step(v6);
    BOOL v9 = v8 == 101;
    if (v8 == 101)
    {
      if (qword_24FC0 != -1) {
        swift_once(&qword_24FC0, sub_E038);
      }
      uint64_t v10 = type metadata accessor for Logger(0LL);
      sub_5BDC(v10, (uint64_t)qword_27EF8);
      uint64_t v11 = swift_bridgeObjectRetain_n(a2, 2LL);
      unint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
      os_log_type_t v13 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v15 = swift_slowAlloc(32LL, -1LL);
        uint64_t v27 = v15;
        *(_DWORD *)uint64_t v14 = 136315138;
        swift_bridgeObjectRetain(a2);
        uint64_t v26 = sub_17E80(a1, a2, &v27);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v14 + 4, v14 + 12);
        swift_bridgeObjectRelease_n(a2, 3LL);
        _os_log_impl(&dword_0, v12, v13, "Execution succeeded: %s", v14, 0xCu);
        swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v15, -1LL, -1LL);
        uint64_t v16 = v14;
LABEL_17:
        swift_slowDealloc(v16, -1LL, -1LL);

        goto LABEL_18;
      }

      swift_bridgeObjectRelease_n(a2, 2LL);
    }

    else
    {
      if (qword_24FC0 != -1) {
        swift_once(&qword_24FC0, sub_E038);
      }
      uint64_t v17 = type metadata accessor for Logger(0LL);
      sub_5BDC(v17, (uint64_t)qword_27EF8);
      uint64_t v18 = swift_retain_n(v2, 2LL);
      unint64_t v12 = (os_log_s *)Logger.logObject.getter(v18);
      os_log_type_t v19 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v12, v19))
      {
        os_log_type_t v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v21 = swift_slowAlloc(32LL, -1LL);
        uint64_t v27 = v21;
        *(_DWORD *)os_log_type_t v20 = 136315138;
        if (sqlite3_errmsg(*(sqlite3 **)(v3 + 16)))
        {
          uint64_t v22 = String.init(cString:)();
          unint64_t v24 = v23;
        }

        else
        {
          unint64_t v24 = 0x800000000001A7E0LL;
          uint64_t v22 = 0xD00000000000001DLL;
        }

        uint64_t v26 = sub_17E80(v22, v24, &v27);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v20 + 4, v20 + 12);
        swift_release_n(v3, 2LL);
        swift_bridgeObjectRelease(v24);
        _os_log_impl(&dword_0, v12, v19, "%s", v20, 0xCu);
        swift_arrayDestroy(v21, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v21, -1LL, -1LL);
        uint64_t v16 = v20;
        goto LABEL_17;
      }

      swift_release_n(v3, 2LL);
    }

LABEL_18:
    sqlite3_finalize(v7);
    return v9;
  }

  return 0LL;
}

char *sub_C12C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = sub_BBBC();
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  int v6 = sqlite3_step(v4);
  if (v6 == 101)
  {
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  }

  else if (v6 == 100)
  {
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      if (sqlite3_column_type(v5, 0) != 5)
      {
        uint64_t v8 = sqlite3_column_int(v5, 0);
        uint64_t v9 = type metadata accessor for GameState();
        swift_allocObject(v9, 185LL, 7LL);
        uint64_t v10 = sub_F6E8( 0x656C676E6953LL,  0xE600000000000000LL,  0LL,  0xE000000000000000LL,  0LL,  0LL,  0LL,  1,  1287,  0LL,  1uLL,  0LL,  0LL,  0LL,  0LL,  1);
        *(void *)(v10 + 16) = v8;
        *(_BYTE *)(v10 + 24) = 0;
        uint64_t v24 = v9;
        uint64_t v25 = &off_21958;
        *(void *)&__int128 v23 = v10;
        sub_8950(&v23, (uint64_t)v26);
        sub_8908((uint64_t)v26, (uint64_t)&v23);
        if ((swift_isUniquelyReferenced_nonNull_native(v7) & 1) == 0) {
          uint64_t v7 = sub_C770(0LL, *((void *)v7 + 2) + 1LL, 1, v7);
        }
        unint64_t v12 = *((void *)v7 + 2);
        unint64_t v11 = *((void *)v7 + 3);
        if (v12 >= v11 >> 1) {
          uint64_t v7 = sub_C770((char *)(v11 > 1), v12 + 1, 1, v7);
        }
        *((void *)v7 + 2) = v12 + 1;
        sub_8950(&v23, (uint64_t)&v7[40 * v12 + 32]);
        sub_5C58(v26);
      }
    }

    while (sqlite3_step(v5) == 100);
  }

  else
  {
    if (qword_24FC0 != -1) {
      swift_once(&qword_24FC0, sub_E038);
    }
    uint64_t v13 = type metadata accessor for Logger(0LL);
    sub_5BDC(v13, (uint64_t)qword_27EF8);
    uint64_t v14 = swift_retain_n(a3, 2LL);
    uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v18 = swift_slowAlloc(32LL, -1LL);
      v26[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      if (sqlite3_errmsg(*(sqlite3 **)(a3 + 16)))
      {
        uint64_t v19 = String.init(cString:)();
        unint64_t v21 = v20;
      }

      else
      {
        unint64_t v21 = 0x800000000001A7E0LL;
        uint64_t v19 = 0xD00000000000001DLL;
      }

      *(void *)&__int128 v23 = sub_17E80(v19, v21, v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, (char *)&v23 + 8, v17 + 4, v17 + 12);
      swift_release_n(a3, 2LL);
      swift_bridgeObjectRelease(v21);
      _os_log_impl(&dword_0, v15, v16, "%s", v17, 0xCu);
      swift_arrayDestroy(v18, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v18, -1LL, -1LL);
      swift_slowDealloc(v17, -1LL, -1LL);
    }

    else
    {

      swift_release_n(a3, 2LL);
    }

    uint64_t v7 = 0LL;
  }

  sqlite3_finalize(v5);
  return v7;
}

char *sub_C490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = sub_BBBC();
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  int v6 = sqlite3_step(v4);
  if (v6 == 101)
  {
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  }

  else if (v6 == 100)
  {
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      sub_115CC(v5, (uint64_t)&v20);
      if (v21)
      {
        sub_8950(&v20, (uint64_t)v22);
        sub_8908((uint64_t)v22, (uint64_t)&v20);
        if ((swift_isUniquelyReferenced_nonNull_native(v7) & 1) == 0) {
          uint64_t v7 = sub_C770(0LL, *((void *)v7 + 2) + 1LL, 1, v7);
        }
        unint64_t v9 = *((void *)v7 + 2);
        unint64_t v8 = *((void *)v7 + 3);
        if (v9 >= v8 >> 1) {
          uint64_t v7 = sub_C770((char *)(v8 > 1), v9 + 1, 1, v7);
        }
        *((void *)v7 + 2) = v9 + 1;
        sub_8950(&v20, (uint64_t)&v7[40 * v9 + 32]);
        sub_5C58(v22);
      }

      else
      {
        sub_5C78((uint64_t)&v20, &qword_25830);
      }
    }

    while (sqlite3_step(v5) == 100);
  }

  else
  {
    if (qword_24FC0 != -1) {
      swift_once(&qword_24FC0, sub_E038);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    sub_5BDC(v10, (uint64_t)qword_27EF8);
    uint64_t v11 = swift_retain_n(a3, 2LL);
    unint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v15 = swift_slowAlloc(32LL, -1LL);
      v22[0] = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      if (sqlite3_errmsg(*(sqlite3 **)(a3 + 16)))
      {
        uint64_t v16 = String.init(cString:)();
        unint64_t v18 = v17;
      }

      else
      {
        unint64_t v18 = 0x800000000001A7E0LL;
        uint64_t v16 = 0xD00000000000001DLL;
      }

      *(void *)&__int128 v20 = sub_17E80(v16, v18, v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, (char *)&v20 + 8, v14 + 4, v14 + 12);
      swift_release_n(a3, 2LL);
      swift_bridgeObjectRelease(v18);
      _os_log_impl(&dword_0, v12, v13, "%s", v14, 0xCu);
      swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1LL, -1LL);
      swift_slowDealloc(v14, -1LL, -1LL);
    }

    else
    {

      swift_release_n(a3, 2LL);
    }

    uint64_t v7 = 0LL;
  }

  sqlite3_finalize(v5);
  return v7;
}

char *sub_C770(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_5BF4(&qword_25838);
      uint64_t v11 = (char *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
      size_t v12 = j__malloc_size(v11);
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
      os_log_type_t v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[40 * v8 + 32]) {
          memmove(v13, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      os_log_type_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
    }

    sub_CDAC(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_C890(uint64_t a1, unint64_t a2)
{
  if (qword_24FC0 != -1) {
    swift_once(&qword_24FC0, sub_E038);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_5BDC(v4, (uint64_t)qword_27EF8);
  uint64_t v5 = swift_bridgeObjectRetain_n(a2, 2LL);
  unint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = (sqlite3 *)swift_slowAlloc(32LL, -1LL);
    ppDb = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v34 = sub_17E80(a1, a2, (uint64_t *)&ppDb);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &ppDb, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl(&dword_0, v6, v7, "Opening DB %s.", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  ppDb = 0LL;
  uint64_t v10 = String.utf8CString.getter(a1, a2);
  int v11 = sqlite3_open((const char *)(v10 + 32), &ppDb);
  uint64_t v12 = swift_release(v10);
  os_log_type_t v13 = ppDb;
  if (v11)
  {
    if (sqlite3_errmsg(ppDb))
    {
      uint64_t v14 = String.init(cString:)();
      unint64_t v16 = v15;
      uint64_t v17 = swift_bridgeObjectRetain(v15);
      unint64_t v18 = (void *)Logger.logObject.getter(v17);
      os_log_type_t v19 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled((os_log_t)v18, v19))
      {

        swift_bridgeObjectRelease_n(v16, 2LL);
        return 0LL;
      }

      __int128 v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v21 = swift_slowAlloc(32LL, -1LL);
      uint64_t v34 = v21;
      *(_DWORD *)__int128 v20 = 136315138;
      swift_bridgeObjectRetain(v16);
      uint64_t v33 = sub_17E80(v14, v16, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v20 + 4, v20 + 12);
      swift_bridgeObjectRelease_n(v16, 3LL);
      _os_log_impl(&dword_0, (os_log_t)v18, v19, "%s", v20, 0xCu);
      swift_arrayDestroy(v21, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v21, -1LL, -1LL);
      uint64_t v22 = v20;
      goto LABEL_19;
    }

    unint64_t v18 = (void *)Logger.logObject.getter(0LL);
    os_log_type_t v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled((os_log_t)v18, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v29 = 0;
      unint64_t v30 = "No error message from SQLite.";
LABEL_18:
      _os_log_impl(&dword_0, (os_log_t)v18, v28, v30, v29, 2u);
      uint64_t v22 = v29;
LABEL_19:
      swift_slowDealloc(v22, -1LL, -1LL);
      goto LABEL_20;
    }

    goto LABEL_20;
  }

  if (!ppDb)
  {
    unint64_t v18 = (void *)Logger.logObject.getter(v12);
    os_log_type_t v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled((os_log_t)v18, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v29 = 0;
      unint64_t v30 = "Null DB pointer.";
      goto LABEL_18;
    }

LABEL_20:
    return 0LL;
  }

  uint64_t v23 = swift_bridgeObjectRetain_n(a2, 2LL);
  uint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
  os_log_type_t v25 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v27 = swift_slowAlloc(32LL, -1LL);
    uint64_t v34 = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v33 = sub_17E80(a1, a2, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v26 + 4, v26 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl(&dword_0, v24, v25, "Open DB %s succeeded.", v26, 0xCu);
    swift_arrayDestroy(v27, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1LL, -1LL);
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  uint64_t v32 = type metadata accessor for SqlDatabase();
  uint64_t result = swift_allocObject(v32, 24LL, 7LL);
  *(void *)(result + 16) = v13;
  return result;
}

uint64_t sub_CDAC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 40 * a1 + 32;
  unint64_t v7 = a3 + 40 * v4;
  if (v6 >= v7 || v6 + 40 * v4 <= a3)
  {
    uint64_t v9 = sub_5BF4(&qword_25840);
    swift_arrayInitWithCopy(a3, v6, v4, v9);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_CEBC()
{
  unint64_t result = qword_25088;
  if (!qword_25088)
  {
    type metadata accessor for FileAttributeKey(255LL);
    unint64_t result = swift_getWitnessTable(&unk_1B490, v1);
    atomic_store(result, (unint64_t *)&qword_25088);
  }

  return result;
}

unint64_t sub_CF04(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_5BF4(&qword_25878);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_DEF8(v7, (uint64_t)&v14, &qword_25880);
    uint64_t v8 = v14;
    unint64_t result = sub_14A48(v14);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    *(void *)(v4[6] + 8 * result) = v8;
    unint64_t result = (unint64_t)sub_D82C(&v15, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v11 = v4[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4[2] = v13;
    v7 += 40LL;
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

unint64_t sub_D030(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_5BF4(&qword_25860);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_DEF8(v7, (uint64_t)&v16, &qword_25870);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_1496C(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    BOOL v12 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_D82C(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 48LL;
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

uint64_t sub_D164()
{
  uint64_t v1 = sub_5BF4(&qword_25858);
  uint64_t inited = swift_initStackObject(v1, v27);
  *(_OWORD *)(inited + 16) = xmmword_1BD40;
  *(void *)(inited + 32) = 0x70756F726724LL;
  *(void *)(inited + 40) = 0xE600000000000000LL;
  *(void *)(inited + 48) = 0xD000000000000026LL;
  *(void *)(inited + 56) = 0x800000000001A8C0LL;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 80) = 0x7373616C6324LL;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 88) = 0xE600000000000000LL;
  *(void *)(inited + 96) = 0xD00000000000001ALL;
  *(void *)(inited + 104) = 0x800000000001A8F0LL;
  unint64_t v3 = sub_D030(inited);
  v28[0] = v3;
  if (v0[13] != 1LL)
  {
    unint64_t v4 = v3;
    uint64_t v5 = v0[15];
    if (v5)
    {
      uint64_t v6 = v0[14];
      os_log_type_t v25 = &type metadata for String;
      *(void *)&__int128 v24 = v6;
      *((void *)&v24 + 1) = swift_bridgeObjectRetain(v5);
      sub_D82C(&v24, v23);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v4);
      uint64_t v26 = v4;
      sub_DB38(v23, 0xD000000000000011LL, 0x800000000001A910LL, isUniquelyReferenced_nonNull_native);
      v28[0] = v26;
      swift_bridgeObjectRelease(0x8000000000000000LL);
    }
  }

  if (qword_24FC8 != -1) {
    swift_once(&qword_24FC8, sub_E09C);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = sub_5BDC(v8, (uint64_t)qword_27F10);
  char v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    BOOL v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v13 = swift_slowAlloc(32LL, -1LL);
    *(void *)&__int128 v24 = v13;
    *(_DWORD *)BOOL v12 = 136315138;
    swift_beginAccess(v28, v23, 0LL, 0LL);
    uint64_t v14 = v28[0];
    uint64_t v15 = swift_bridgeObjectRetain(v28[0]);
    uint64_t v16 = Dictionary.description.getter( v15,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    unint64_t v18 = v17;
    swift_bridgeObjectRelease(v14);
    uint64_t v26 = sub_17E80(v16, v18, (uint64_t *)&v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, v27, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease(v18);
    _os_log_impl(&dword_0, v10, v11, "attachment is:%s", v12, 0xCu);
    swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  swift_beginAccess(v28, &v24, 0LL, 0LL);
  uint64_t v19 = v28[0];
  uint64_t v20 = swift_bridgeObjectRetain(v28[0]);
  uint64_t v21 = sub_D468(v20);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v28[0]);
  return v21;
}

uint64_t sub_D468(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_5BF4(&qword_25868);
    unint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    unint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v29 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  uint64_t result = swift_retain(v3);
  int64_t v9 = 0LL;
  while (1)
  {
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }

    int64_t v14 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v14 >= v28) {
      goto LABEL_37;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v14);
    int64_t v16 = v9 + 1;
    if (!v15)
    {
      int64_t v16 = v9 + 2;
      if (v9 + 2 >= v28) {
        goto LABEL_37;
      }
      unint64_t v15 = *(void *)(v29 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v9 + 3;
        if (v9 + 3 >= v28) {
          goto LABEL_37;
        }
        unint64_t v15 = *(void *)(v29 + 8 * v16);
        if (!v15)
        {
          int64_t v16 = v9 + 4;
          if (v9 + 4 >= v28) {
            goto LABEL_37;
          }
          unint64_t v15 = *(void *)(v29 + 8 * v16);
          if (!v15) {
            break;
          }
        }
      }
    }

LABEL_27:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
    int64_t v9 = v16;
LABEL_28:
    unint64_t v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v13);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_DEB4(*(void *)(a1 + 56) + 32 * v13, (uint64_t)v41);
    *(void *)&__int128 v40 = v20;
    *((void *)&v40 + 1) = v19;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(void *)&v38[0] = v20;
    *((void *)&v38[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7LL);
    sub_D82C(v39, v33);
    __int128 v34 = v30;
    __int128 v35 = v31;
    uint64_t v36 = v32;
    sub_D82C(v33, v37);
    __int128 v30 = v34;
    __int128 v31 = v35;
    uint64_t v32 = v36;
    sub_D82C(v37, v38);
    sub_D82C(v38, &v34);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v3[5]);
    uint64_t v21 = -1LL << *((_BYTE *)v3 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1LL << v22) & ~*(void *)&v7[8 * (v22 >> 6)]) != 0)
    {
      unint64_t v10 = __clz(__rbit64((-1LL << v22) & ~*(void *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0LL;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)&v7[8 * v23];
      }

      while (v27 == -1);
      unint64_t v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }

    *(void *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << v10;
    uint64_t v11 = v3[6] + 40 * v10;
    *(_OWORD *)uint64_t v11 = v30;
    *(_OWORD *)(v11 + 16) = v31;
    *(void *)(v11 + 32) = v32;
    uint64_t result = (uint64_t)sub_D82C(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }

  int64_t v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_DEF0(a1);
    return (uint64_t)v3;
  }

  unint64_t v15 = *(void *)(v29 + 8 * v17);
  if (v15)
  {
    int64_t v16 = v9 + 5;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v16 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v16 >= v28) {
      goto LABEL_37;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v16);
    ++v17;
    if (v15) {
      goto LABEL_27;
    }
  }

LABEL_39:
  __break(1u);
  return result;
}

_OWORD *sub_D82C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_D83C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_5BF4(&qword_25860);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    __int128 v34 = v3;
    uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain(v5);
    int64_t v14 = 0LL;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v14 << 6);
      }

      else
      {
        int64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }

        if (v19 >= v35) {
          goto LABEL_37;
        }
        unint64_t v20 = v36[v19];
        ++v14;
        if (!v20)
        {
          int64_t v14 = v19 + 1;
          if (v19 + 1 >= v35) {
            goto LABEL_37;
          }
          unint64_t v20 = v36[v14];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v35)
            {
LABEL_37:
              swift_release(v5);
              unint64_t v3 = v34;
              if ((a2 & 1) != 0)
              {
                uint64_t v33 = 1LL << *(_BYTE *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  void *v36 = -1LL << v33;
                }
                *(void *)(v5 + 16) = 0LL;
              }

              break;
            }

            unint64_t v20 = v36[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v14 = v21 + 1;
                if (__OFADD__(v21, 1LL)) {
                  goto LABEL_44;
                }
                if (v14 >= v35) {
                  goto LABEL_37;
                }
                unint64_t v20 = v36[v14];
                ++v21;
                if (v20) {
                  goto LABEL_24;
                }
              }
            }

            int64_t v14 = v21;
          }
        }

LABEL_24:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }

      unint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v18);
      uint64_t v24 = *v22;
      uint64_t v23 = v22[1];
      unint64_t v25 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v18);
      if ((a2 & 1) != 0)
      {
        sub_D82C(v25, v38);
      }

      else
      {
        sub_DEB4((uint64_t)v25, (uint64_t)v38);
        swift_bridgeObjectRetain(v23);
      }

      Hasher.init(_seed:)(v37, *(void *)(v8 + 40));
      String.hash(into:)(v37, v24, v23);
      uint64_t result = Hasher._finalize()();
      uint64_t v26 = -1LL << *(_BYTE *)(v8 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }

          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0LL;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v12 + 8 * v28);
        }

        while (v32 == -1);
        unint64_t v15 = __clz(__rbit64(~v32)) + (v28 << 6);
      }

      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      int64_t v16 = (void *)(*(void *)(v8 + 48) + 16 * v15);
      *int64_t v16 = v24;
      v16[1] = v23;
      uint64_t result = (uint64_t)sub_D82C(v38, (_OWORD *)(*(void *)(v8 + 56) + 32 * v15));
      ++*(void *)(v8 + 16);
    }
  }

  uint64_t result = swift_release(v5);
  *unint64_t v3 = v8;
  return result;
}

_OWORD *sub_DB38(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1496C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }

  else
  {
    char v16 = v11;
    uint64_t v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      unint64_t v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        int64_t v19 = (void *)(v18[7] + 32 * v12);
        sub_5C58(v19);
        return sub_D82C(a1, v19);
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_DCD0();
      goto LABEL_7;
    }

    sub_D83C(v15, a4 & 1);
    unint64_t v21 = sub_1496C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      unint64_t v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_DC68(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain(a3);
    }
  }

  uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

_OWORD *sub_DC68(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_D82C(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *sub_DCD0()
{
  uint64_t v1 = v0;
  sub_5BF4(&qword_25860);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release(v2);
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }

  unint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_DEB4(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_D82C(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain(v18);
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    uint64_t v1 = v25;
    goto LABEL_28;
  }

  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

LABEL_30:
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_DEB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_DEF0(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_DEF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5BF4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_DF3C()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD00000000000001ALL,  0x800000000001A930LL,  0x65726F7453LL,  0xE500000000000000LL);
  qword_27EE8 = result;
  return result;
}

unint64_t sub_DF94()
{
  unint64_t result = qword_25888;
  if (!qword_25888)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_25888);
  }

  return result;
}

uint64_t sub_DFD0()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD00000000000001ALL,  0x800000000001A930LL,  0x6D6E696174756445LL,  0xEF776F6C46746E65LL);
  qword_27EF0 = result;
  return result;
}

uint64_t sub_E038(uint64_t a1)
{
  return sub_E0C0(a1, qword_27EF8, &qword_24FB0, (id *)&qword_27EE8, (uint64_t)sub_DF3C);
}

uint64_t *sub_E05C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_E09C(uint64_t a1)
{
  return sub_E0C0(a1, qword_27F10, &qword_24FB8, (id *)&qword_27EF0, (uint64_t)sub_DFD0);
}

uint64_t sub_E0C0(uint64_t a1, uint64_t *a2, void *a3, id *a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for Logger(0LL);
  sub_E05C(v9, a2);
  sub_5BDC(v9, (uint64_t)a2);
  if (*a3 != -1LL) {
    swift_once(a3, a5);
  }
  return Logger.init(_:)(*a4);
}

uint64_t sub_E148()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 40);
  swift_bridgeObjectRetain(v2);
  v3._countAndFlagsBits = v1;
  v3._object = v2;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(v2);
  v4._countAndFlagsBits = 2592LL;
  v4._object = (void *)0xE200000000000000LL;
  String.append(_:)(v4);
  LOBYTE(v17[0]) = *(_BYTE *)(v0 + 90);
  uint64_t v5 = sub_5BF4(&qword_25678);
  v6._countAndFlagsBits = String.init<A>(describing:)(v17, v5);
  object = v6._object;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(object);
  v8._countAndFlagsBits = 2592LL;
  v8._object = (void *)0xE200000000000000LL;
  String.append(_:)(v8);
  swift_bridgeObjectRetain(0xE500000000000000LL);
  v9._countAndFlagsBits = 0x3A736920776F6C66LL;
  v9._object = (void *)0xE800000000000000LL;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(0xE500000000000000LL);
  swift_bridgeObjectRelease(0xE800000000000000LL);
  strcpy((char *)v17, "gameContent:");
  BYTE5(v17[1]) = 0;
  HIWORD(v17[1]) = -5120;
  uint64_t v10 = sub_5BF4(&qword_259E0);
  v11._countAndFlagsBits = Optional.debugDescription.getter(v10);
  unint64_t v12 = v11._object;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = v17[0];
  unint64_t v14 = (void *)v17[1];
  swift_bridgeObjectRetain(0xE500000000000000LL);
  v15._countAndFlagsBits = v13;
  v15._object = v14;
  String.append(_:)(v15);
  swift_bridgeObjectRelease(0xE500000000000000LL);
  swift_bridgeObjectRelease(v14);
  return 0x3A656D6167LL;
}

uint64_t sub_E2DC(char a1)
{
  return *(void *)&aPlay_3[8 * a1];
}

uint64_t sub_E2FC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_E334 + 4 * byte_1BD80[a1]))( 0xD000000000000013LL,  0x800000000001A510LL);
}

uint64_t sub_E334()
{
  return 0x657461647075LL;
}

uint64_t sub_E348()
{
  return 6581861LL;
}

uint64_t sub_E358()
{
  return 0x656D75736572LL;
}

uint64_t sub_E36C()
{
  return 0x6E776F6E6B6E75LL;
}

void sub_E384(char a1)
{
  __asm { BR              X11 }

uint64_t sub_E3D0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_E43C + 4 * byte_1BD8A[a2]))(0x657461647075LL);
}

uint64_t sub_E43C(uint64_t a1)
{
  if (a1 == 0x657461647075LL && v1 == 0xE600000000000000LL) {
    char v2 = 1;
  }
  else {
    char v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x657461647075LL, 0xE600000000000000LL, 0LL);
  }
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE600000000000000LL);
  return v2 & 1;
}

uint64_t sub_E4EC(char a1, char a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)&aPlay_3[v2 * 8];
  uint64_t v4 = qword_1C2D0[v2];
  uint64_t v5 = a2;
  uint64_t v6 = *(void *)&aPlay_3[v5 * 8];
  uint64_t v7 = qword_1C2D0[v5];
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v6, qword_1C2D0[a2], 0LL);
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v7);
  return v9 & 1;
}

void sub_E570(char a1)
{
  __asm { BR              X12 }

uint64_t sub_E5BC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_E6A4 + 4 * byte_1BD98[a2]))(1701667182LL);
}

uint64_t sub_E6A4(uint64_t a1)
{
  if (a1 == 1701667182 && v1 == 0xE400000000000000LL) {
    char v2 = 1;
  }
  else {
    char v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 1701667182LL, 0xE400000000000000LL, 0LL);
  }
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE400000000000000LL);
  return v2 & 1;
}

uint64_t sub_E7EC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0) {
    unint64_t v3 = 0xD000000000000017LL;
  }
  else {
    unint64_t v3 = 0x7377656956646461LL;
  }
  if (v2) {
    unint64_t v4 = 0xEC0000006E6F734ALL;
  }
  else {
    unint64_t v4 = 0x800000000001A4C0LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v5 = 0xD000000000000017LL;
  }
  else {
    unint64_t v5 = 0x7377656956646461LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v6 = 0x800000000001A4C0LL;
  }
  else {
    unint64_t v6 = 0xEC0000006E6F734ALL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v5, v6, 0LL);
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

void sub_E898(char a1)
{
  __asm { BR              X11 }

uint64_t sub_E8E4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_E9C4 + 4 * byte_1BDAA[a2]))(1701667182LL);
}

uint64_t sub_E9C4(uint64_t a1)
{
  if (a1 == 1701667182 && v1 == 0xE400000000000000LL) {
    char v2 = 1;
  }
  else {
    char v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 1701667182LL, 0xE400000000000000LL, 0LL);
  }
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE400000000000000LL);
  return v2 & 1;
}

void sub_EB08(char a1)
{
  __asm { BR              X11 }

uint64_t sub_EB54(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_EBF4 + 4 * byte_1BDBA[a2]))(0x79726F6765746163LL);
}

uint64_t sub_EBF4(uint64_t a1)
{
  if (a1 == 0x79726F6765746163LL && v1 == 0xE800000000000000LL) {
    char v2 = 1;
  }
  else {
    char v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x79726F6765746163LL, 0xE800000000000000LL, 0LL);
  }
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE800000000000000LL);
  return v2 & 1;
}

uint64_t sub_ECE8(char a1, char a2)
{
  uint64_t v2 = 8LL * a1;
  uint64_t v3 = *(void *)&aMultipleBOOLea_0[v2];
  uint64_t v4 = *(void *)&aFreeform_2[v2 + 8];
  uint64_t v5 = 8LL * a2;
  uint64_t v6 = *(void *)&aMultipleBOOLea_0[v5];
  uint64_t v7 = *(void *)&aFreeform_2[v5 + 8];
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v6, *(void *)&aFreeform_2[8 * a2 + 8], 0LL);
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v7);
  return v9 & 1;
}

Swift::Int sub_ED6C(char a1)
{
  uint64_t v2 = 8LL * a1;
  uint64_t v3 = *(void *)&aFreeform_2[v2 + 8];
  String.hash(into:)(v5, *(void *)&aMultipleBOOLea_0[v2], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

Swift::Int sub_EDD4(char a1)
{
  if ((a1 & 1) != 0) {
    unint64_t v2 = 0xD000000000000017LL;
  }
  else {
    unint64_t v2 = 0x7377656956646461LL;
  }
  if ((a1 & 1) != 0) {
    unint64_t v3 = 0x800000000001A4C0LL;
  }
  else {
    unint64_t v3 = 0xEC0000006E6F734ALL;
  }
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

void sub_EE60(char a1)
{
  __asm { BR              X10 }

Swift::Int sub_EEB4()
{
  return Hasher._finalize()();
}

void sub_EF2C(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_EF70(uint64_t a1)
{
  return swift_bridgeObjectRelease(0xE600000000000000LL);
}

uint64_t sub_EFD4(uint64_t a1, char a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = qword_1C2D0[v2];
  String.hash(into:)(a1, *(void *)&aPlay_3[v2 * 8], v3);
  return swift_bridgeObjectRelease(v3);
}

void sub_F014(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_F05C(uint64_t a1)
{
  return swift_bridgeObjectRelease(0xE400000000000000LL);
}

uint64_t sub_F138(uint64_t a1, char a2)
{
  BOOL v2 = (a2 & 1) == 0;
  if ((a2 & 1) != 0) {
    unint64_t v3 = 0xD000000000000017LL;
  }
  else {
    unint64_t v3 = 0x7377656956646461LL;
  }
  if (v2) {
    unint64_t v4 = 0xEC0000006E6F734ALL;
  }
  else {
    unint64_t v4 = 0x800000000001A4C0LL;
  }
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v4);
}

void sub_F19C(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_F1E0(uint64_t a1)
{
  return swift_bridgeObjectRelease(0xE400000000000000LL);
}

void sub_F2B8(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_F2FC(uint64_t a1)
{
  return swift_bridgeObjectRelease(0xE800000000000000LL);
}

uint64_t sub_F394(uint64_t a1, char a2)
{
  uint64_t v2 = 8LL * a2;
  uint64_t v3 = *(void *)&aFreeform_2[v2 + 8];
  String.hash(into:)(a1, *(void *)&aMultipleBOOLea_0[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_F3D4(uint64_t a1, char a2)
{
  uint64_t v3 = 8LL * a2;
  uint64_t v4 = *(void *)&aFreeform_2[v3 + 8];
  String.hash(into:)(v6, *(void *)&aMultipleBOOLea_0[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

void sub_F438(uint64_t a1, char a2)
{
  __asm { BR              X10 }

Swift::Int sub_F488()
{
  return Hasher._finalize()();
}

Swift::Int sub_F534(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0) {
    unint64_t v3 = 0xD000000000000017LL;
  }
  else {
    unint64_t v3 = 0x7377656956646461LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v4 = 0x800000000001A4C0LL;
  }
  else {
    unint64_t v4 = 0xEC0000006E6F734ALL;
  }
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

Swift::Int sub_F5BC(uint64_t a1, char a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = qword_1C2D0[v3];
  String.hash(into:)(v6, *(void *)&aPlay_3[v3 * 8], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

void sub_F620(uint64_t a1, char a2)
{
  __asm { BR              X10 }

Swift::Int sub_F670()
{
  return Hasher._finalize()();
}

uint64_t sub_F6E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, __int16 a9, uint64_t a10, __int128 a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  *(void *)(v16 + 16) = 0LL;
  *(_BYTE *)(v16 + 24) = 1;
  *(void *)(v16 + 80) = 0LL;
  *(_BYTE *)(v16 + 88) = 1;
  *(_WORD *)(v16 + 89) = 1287;
  *(_OWORD *)(v16 + 96) = xmmword_1C310;
  *(_OWORD *)(v16 + 112) = 0u;
  *(_OWORD *)(v16 + 128) = 0u;
  *(void *)(v16 + 144) = 0LL;
  *(_BYTE *)(v16 + 152) = 1;
  *(void *)(v16 + 168) = 0LL;
  *(void *)(v16 + 176) = 0LL;
  *(void *)(v16 + 160) = 0LL;
  *(_BYTE *)(v16 + 184) = 1;
  *(void *)(v16 + 32) = a1;
  *(void *)(v16 + 40) = a2;
  *(void *)(v16 + 48) = a3;
  *(void *)(v16 + 56) = a4;
  *(void *)(v16 + 64) = a5;
  *(void *)(v16 + 72) = a6;
  swift_bridgeObjectRelease(0LL);
  *(void *)(v16 + 80) = a7;
  *(_BYTE *)(v16 + 88) = a8 & 1;
  *(_WORD *)(v16 + 89) = a9;
  uint64_t v19 = *(void *)(v16 + 96);
  uint64_t v20 = *(void *)(v16 + 104);
  uint64_t v21 = *(void *)(v16 + 112);
  uint64_t v22 = *(void *)(v16 + 120);
  *(void *)(v16 + 96) = a10;
  *(_OWORD *)(v16 + 104) = a11;
  *(void *)(v16 + 120) = a12;
  sub_108B8(v19, v20, v21, v22);
  uint64_t v23 = *(void *)(v16 + 136);
  *(void *)(v16 + 128) = a13;
  *(void *)(v16 + 136) = a14;
  swift_bridgeObjectRelease(v23);
  *(void *)(v16 + 144) = a15;
  *(_BYTE *)(v16 + 152) = a16 & 1;
  return v16;
}

uint64_t sub_F7EC(char *a1, char *a2)
{
  return sub_E4EC(*a1, *a2);
}

Swift::Int sub_F7F8()
{
  return sub_F5BC(0LL, *v0);
}

uint64_t sub_F804(uint64_t a1)
{
  return sub_EFD4(a1, *v1);
}

Swift::Int sub_F80C(uint64_t a1)
{
  return sub_F5BC(a1, *v1);
}

unint64_t sub_F814@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1231C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_F840@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_E2DC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_F868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_123F0();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_F8C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_123F0();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

void sub_F910(char *a1)
{
}

void sub_F91C()
{
}

void sub_F924(uint64_t a1)
{
}

void sub_F92C(uint64_t a1)
{
}

unint64_t sub_F934@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_12364(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_F960@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_E2FC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_F988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_123AC();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_F9E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_123AC();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_FA30()
{
  return swift_deallocClassInstance(v0, 185LL, 7LL);
}

uint64_t type metadata accessor for GameState()
{
  return objc_opt_self(&OBJC_CLASS____TtC21EdutainmentFlowPlugin9GameState);
}

uint64_t getEnumTagSinglePayload for GameState.ClientAction(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

uint64_t storeEnumTagSinglePayload for GameState.ClientAction(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_FB7C + 4 * byte_1BDF5[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_FBB0 + 4 * byte_1BDF0[v4]))();
}

uint64_t sub_FBB0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_FBB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0xFBC0LL);
  }
  return result;
}

uint64_t sub_FBCC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0xFBD4LL);
  }
  *(_BYTE *)uint64_t result = a2 + 4;
  return result;
}

uint64_t sub_FBD8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_FBE0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GameState.ClientAction()
{
  return &type metadata for GameState.ClientAction;
}

uint64_t storeEnumTagSinglePayload for GameState.UserAction(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF9) {
    return ((uint64_t (*)(void))((char *)&loc_FC48 + 4 * byte_1BDFF[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_FC7C + 4 * byte_1BDFA[v4]))();
}

uint64_t sub_FC7C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_FC84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0xFC8CLL);
  }
  return result;
}

uint64_t sub_FC98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0xFCA0LL);
  }
  *(_BYTE *)uint64_t result = a2 + 6;
  return result;
}

uint64_t sub_FCA4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_FCAC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GameState.UserAction()
{
  return &type metadata for GameState.UserAction;
}

unint64_t sub_FCCC()
{
  unint64_t result = qword_25988;
  if (!qword_25988)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BF70, &type metadata for GameState.UserAction);
    atomic_store(result, (unint64_t *)&qword_25988);
  }

  return result;
}

unint64_t sub_FD14()
{
  unint64_t result = qword_25990;
  if (!qword_25990)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C060, &type metadata for GameState.ClientAction);
    atomic_store(result, (unint64_t *)&qword_25990);
  }

  return result;
}

uint64_t sub_FD58(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_FD94 + 4 * byte_1BE04[a1]))( 0xD000000000000018LL,  0x800000000001A530LL);
}

uint64_t sub_FD94()
{
  return 1701667182LL;
}

uint64_t sub_FDA4()
{
  return 0x79726F6765746163LL;
}

uint64_t sub_FDBC()
{
  return 0x6C6576656CLL;
}

uint64_t sub_FDD0()
{
  return 0x6974634172657375LL;
}

uint64_t sub_FDEC()
{
  return 0x6341746E65696C63LL;
}

unint64_t sub_FE0C()
{
  return 0xD000000000000010LL;
}

uint64_t sub_FE28()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_FE3C()
{
  return 0x5464657461647075LL;
}

uint64_t sub_FE5C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_FE98 + 4 * byte_1BE0D[a1]))( 0xD000000000000018LL,  0x800000000001A530LL);
}

uint64_t sub_FE98()
{
  return 1701667182LL;
}

uint64_t sub_FEA8()
{
  return 0x79726F6765746163LL;
}

uint64_t sub_FEC0()
{
  return 0x6C6576656CLL;
}

uint64_t sub_FED4()
{
  return 0x6974634172657375LL;
}

uint64_t sub_FEF0()
{
  return 0x6341746E65696C63LL;
}

unint64_t sub_FF10()
{
  return 0xD000000000000010LL;
}

uint64_t sub_FF2C()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_FF40()
{
  return 0x5464657461647075LL;
}

uint64_t sub_FF60(void *a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v6 = sub_5BF4(&qword_259B8);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  sub_5C34(a1, v10);
  unint64_t v12 = sub_10874();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for GameState.CodingKeys,  &type metadata for GameState.CodingKeys,  v12,  v10,  v11);
  uint64_t v13 = *(void *)(v4 + 32);
  uint64_t v14 = *(void *)(v4 + 40);
  LOBYTE(v30[0]) = 0;
  swift_bridgeObjectRetain(v14);
  KeyedEncodingContainer.encode(_:forKey:)(v13, v14, v30, v6);
  if (v3)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return swift_bridgeObjectRelease(v14);
  }

  else
  {
    swift_bridgeObjectRelease(v14);
    uint64_t v15 = *(void *)(v4 + 48);
    uint64_t v16 = *(void *)(v4 + 56);
    LOBYTE(v30[0]) = 1;
    swift_bridgeObjectRetain(v16);
    KeyedEncodingContainer.encode(_:forKey:)(v15, v16, v30, v6);
    swift_bridgeObjectRelease(v16);
    uint64_t v17 = *(void *)(v4 + 64);
    uint64_t v18 = *(void *)(v4 + 72);
    LOBYTE(v30[0]) = 2;
    swift_bridgeObjectRetain(v18);
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v17, v18, v30, v6);
    swift_bridgeObjectRelease(v18);
    uint64_t v19 = *(void *)(v4 + 80);
    uint64_t v20 = *(unsigned __int8 *)(v4 + 88);
    LOBYTE(v30[0]) = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v19, v20, v30, v6);
    LOBYTE(v30[0]) = *(_BYTE *)(v4 + 89);
    char v31 = 4;
    unint64_t v21 = sub_10974();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v30, &v31, v6, &type metadata for GameState.UserAction, v21);
    LOBYTE(v30[0]) = *(_BYTE *)(v4 + 90);
    char v31 = 5;
    unint64_t v22 = sub_109B8();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v30, &v31, v6, &type metadata for GameState.ClientAction, v22);
    __int128 v23 = *(_OWORD *)(v4 + 112);
    v30[0] = *(_OWORD *)(v4 + 96);
    v30[1] = v23;
    char v31 = 6;
    unint64_t v24 = sub_B13C();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v30, &v31, v6, &type metadata for ConversationData, v24);
    uint64_t v26 = *(void *)(v4 + 128);
    uint64_t v27 = *(void *)(v4 + 136);
    LOBYTE(v30[0]) = 7;
    swift_bridgeObjectRetain(v27);
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v26, v27, v30, v6);
    swift_bridgeObjectRelease(v27);
    uint64_t v28 = *(void *)(v4 + 144);
    uint64_t v29 = *(unsigned __int8 *)(v4 + 152);
    LOBYTE(v30[0]) = 8;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v28, v29, v30, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

uint64_t *sub_1025C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v3;
  uint64_t v6 = sub_5BF4(&qword_25998);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v3[2] = 0LL;
  *((_BYTE *)v3 + 24) = 1;
  void v3[9] = 0LL;
  v3[10] = 0LL;
  v3[8] = 0LL;
  *((_BYTE *)v3 + 88) = 1;
  *(_WORD *)((char *)v3 + 89) = 1287;
  *((_OWORD *)v3 + 6) = xmmword_1C310;
  *((_OWORD *)v3 + 7) = 0u;
  *((_OWORD *)v3 + 8) = 0u;
  v3[18] = 0LL;
  *((_BYTE *)v3 + 152) = 1;
  v3[21] = 0LL;
  v3[22] = 0LL;
  v3[20] = 0LL;
  *((_BYTE *)v3 + 184) = 1;
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  int64_t v35 = a1;
  sub_5C34(a1, v10);
  unint64_t v12 = sub_10874();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for GameState.CodingKeys,  &type metadata for GameState.CodingKeys,  v12,  v10,  v11);
  if (v2)
  {
    swift_bridgeObjectRelease(v3[9]);
    sub_108B8(v3[12], v3[13], v3[14], v3[15]);
    swift_bridgeObjectRelease(v3[17]);
    swift_bridgeObjectRelease(v3[21]);
    swift_deallocPartialClassInstance(v3, v5, 185LL, 7LL);
  }

  else
  {
    LOBYTE(v36[0]) = 0;
    v3[4] = KeyedDecodingContainer.decode(_:forKey:)(v36, v6);
    v3[5] = v13;
    LOBYTE(v36[0]) = 1;
    v3[6] = KeyedDecodingContainer.decode(_:forKey:)(v36, v6);
    v3[7] = v15;
    LOBYTE(v36[0]) = 2;
    uint64_t v16 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v36, v6);
    uint64_t v17 = v3[9];
    v3[8] = v16;
    void v3[9] = v18;
    swift_bridgeObjectRelease(v17);
    LOBYTE(v36[0]) = 3;
    v3[10] = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v36, v6);
    *((_BYTE *)v3 + 88) = v19 & 1;
    char v37 = 4;
    unint64_t v20 = sub_108EC();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)( v36,  &type metadata for GameState.UserAction,  &v37,  v6,  &type metadata for GameState.UserAction,  v20);
    *((_BYTE *)v3 + 89) = v36[0];
    char v37 = 5;
    unint64_t v21 = sub_10930();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)( v36,  &type metadata for GameState.ClientAction,  &v37,  v6,  &type metadata for GameState.ClientAction,  v21);
    *((_BYTE *)v3 + 90) = v36[0];
    char v37 = 6;
    unint64_t v22 = sub_B0A0();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)( v36,  &type metadata for ConversationData,  &v37,  v6,  &type metadata for ConversationData,  v22);
    uint64_t v23 = v3[12];
    uint64_t v24 = v3[13];
    uint64_t v25 = v3[14];
    uint64_t v26 = v3[15];
    __int128 v27 = v36[1];
    *((_OWORD *)v3 + 6) = v36[0];
    *((_OWORD *)v3 + 7) = v27;
    sub_108B8(v23, v24, v25, v26);
    LOBYTE(v36[0]) = 7;
    uint64_t v28 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v36, v6);
    uint64_t v29 = v3[17];
    v3[16] = v28;
    v3[17] = v30;
    swift_bridgeObjectRelease(v29);
    LOBYTE(v36[0]) = 8;
    uint64_t v31 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v36, v6);
    char v33 = v32;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v3[18] = v31;
    *((_BYTE *)v3 + 152) = v33 & 1;
  }

  sub_5C58(v35);
  return v3;
}

uint64_t sub_1062C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32LL);
  swift_bridgeObjectRetain(*(void *)(*(void *)v0 + 40LL));
  return v1;
}

uint64_t sub_1065C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  swift_bridgeObjectRetain(*(void *)(*(void *)v0 + 56LL));
  return v1;
}

void sub_1068C(char *a1)
{
}

Swift::Int sub_10698()
{
  char v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  sub_F014((uint64_t)v3, v1);
  return Hasher._finalize()();
}

void sub_106DC(uint64_t a1)
{
}

Swift::Int sub_106E4(uint64_t a1)
{
  char v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  sub_F014((uint64_t)v4, v2);
  return Hasher._finalize()();
}

unint64_t sub_10724@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_12434(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10750@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_FD58(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10778()
{
  return sub_FE5C(*v0);
}

unint64_t sub_10780@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_12434(a1);
  *a2 = result;
  return result;
}

void sub_107A4(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_107B0(uint64_t a1)
{
  unint64_t v2 = sub_10874();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_107D8(uint64_t a1)
{
  unint64_t v2 = sub_10874();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t *sub_10800@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v6 = swift_allocObject(v2, 185LL, 7LL);
  unint64_t result = sub_1025C(a1);
  if (!v3) {
    *a2 = v6;
  }
  return result;
}

uint64_t sub_10854(void *a1)
{
  return sub_FF60(a1);
}

unint64_t sub_10874()
{
  unint64_t result = qword_259A0;
  if (!qword_259A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C214, &type metadata for GameState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_259A0);
  }

  return result;
}

uint64_t sub_108B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease(a2);
    return swift_bridgeObjectRelease(a4);
  }

  return result;
}

unint64_t sub_108EC()
{
  unint64_t result = qword_259A8;
  if (!qword_259A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BED0, &type metadata for GameState.UserAction);
    atomic_store(result, (unint64_t *)&qword_259A8);
  }

  return result;
}

unint64_t sub_10930()
{
  unint64_t result = qword_259B0;
  if (!qword_259B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BFC0, &type metadata for GameState.ClientAction);
    atomic_store(result, (unint64_t *)&qword_259B0);
  }

  return result;
}

unint64_t sub_10974()
{
  unint64_t result = qword_259C0;
  if (!qword_259C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BEA8, &type metadata for GameState.UserAction);
    atomic_store(result, (unint64_t *)&qword_259C0);
  }

  return result;
}

unint64_t sub_109B8()
{
  unint64_t result = qword_259C8;
  if (!qword_259C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BF98, &type metadata for GameState.ClientAction);
    atomic_store(result, (unint64_t *)&qword_259C8);
  }

  return result;
}

uint64_t sub_109FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = 1280070990LL;
  uint64_t v3 = sub_5BF4(&qword_259E8);
  uint64_t v4 = swift_allocObject(v3, 392LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_1C320;
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = *(void **)(v0 + 40);
  uint64_t v54 = 39LL;
  unint64_t v55 = 0xE100000000000000LL;
  swift_bridgeObjectRetain(v6);
  v7._countAndFlagsBits = v5;
  v7._object = v6;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 39LL;
  v8._object = (void *)0xE100000000000000LL;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v6);
  *(void *)(v4 + 56) = &type metadata for String;
  unint64_t v9 = sub_12B50();
  *(void *)(v4 + 64) = v9;
  *(void *)(v4 + 32) = 39LL;
  *(void *)(v4 + 40) = 0xE100000000000000LL;
  uint64_t v10 = *(void *)(v0 + 48);
  uint64_t v11 = *(void **)(v0 + 56);
  uint64_t v54 = 39LL;
  unint64_t v55 = 0xE100000000000000LL;
  swift_bridgeObjectRetain(v11);
  v12._countAndFlagsBits = v10;
  v12._object = v11;
  String.append(_:)(v12);
  v13._countAndFlagsBits = 39LL;
  v13._object = (void *)0xE100000000000000LL;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v11);
  *(void *)(v4 + 96) = &type metadata for String;
  *(void *)(v4 + 104) = v9;
  *(void *)(v4 + 72) = 39LL;
  *(void *)(v4 + 80) = 0xE100000000000000LL;
  uint64_t v14 = *(void **)(v0 + 72);
  if (v14)
  {
    uint64_t v15 = *(void *)(v0 + 64);
    uint64_t v54 = 39LL;
    unint64_t v55 = 0xE100000000000000LL;
    swift_bridgeObjectRetain_n(v14, 2LL);
    v16._countAndFlagsBits = v15;
    v16._object = v14;
    String.append(_:)(v16);
    v17._countAndFlagsBits = 39LL;
    v17._object = (void *)0xE100000000000000LL;
    String.append(_:)(v17);
    swift_bridgeObjectRelease_n(v14, 2LL);
    uint64_t v19 = 39LL;
    unint64_t v18 = 0xE100000000000000LL;
  }

  else
  {
    unint64_t v18 = 0xE400000000000000LL;
    uint64_t v19 = 1280070990LL;
  }

  *(void *)(v4 + 136) = &type metadata for String;
  *(void *)(v4 + 144) = v9;
  *(void *)(v4 + 112) = v19;
  *(void *)(v4 + 120) = v18;
  if ((*(_BYTE *)(v0 + 88) & 1) != 0)
  {
    unint64_t v20 = 0xE400000000000000LL;
    uint64_t v21 = 1280070990LL;
  }

  else
  {
    uint64_t v54 = *(void *)(v0 + 80);
    uint64_t v21 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  }

  *(void *)(v4 + 176) = &type metadata for String;
  *(void *)(v4 + 184) = v9;
  *(void *)(v4 + 152) = v21;
  *(void *)(v4 + 160) = v20;
  int v22 = *(unsigned __int8 *)(v0 + 89);
  if (v22 == 7)
  {
    unint64_t v23 = 0xE400000000000000LL;
    uint64_t v24 = 1280070990LL;
  }

  else
  {
    uint64_t v24 = sub_910C(v22);
  }

  *(void *)(v4 + 216) = &type metadata for String;
  *(void *)(v4 + 224) = v9;
  *(void *)(v4 + 192) = v24;
  *(void *)(v4 + 200) = v23;
  int v25 = *(unsigned __int8 *)(v0 + 90);
  if (v25 == 5)
  {
    unint64_t v26 = 0xE400000000000000LL;
    uint64_t v27 = 1280070990LL;
  }

  else
  {
    sub_917C(v25);
  }

  *(void *)(v4 + 256) = &type metadata for String;
  *(void *)(v4 + 264) = v9;
  *(void *)(v4 + 232) = v27;
  *(void *)(v4 + 240) = v26;
  unint64_t v28 = *(void *)(v0 + 104);
  if (v28 == 1)
  {
    unint64_t v29 = 0xE400000000000000LL;
    uint64_t v30 = 1280070990LL;
  }

  else
  {
    uint64_t v32 = *(void *)(v1 + 112);
    uint64_t v31 = *(void *)(v1 + 120);
    uint64_t v33 = *(void *)(v1 + 96);
    sub_12B94(v33, *(void *)(v1 + 104), v32, v31);
    swift_bridgeObjectRetain(v31);
    swift_bridgeObjectRetain(v28);
    uint64_t v30 = sub_AA9C(v33, v28, v32, v31);
    unint64_t v29 = v34;
    swift_bridgeObjectRelease(v31);
    swift_bridgeObjectRelease(v28);
    uint64_t v35 = v33;
    uint64_t v2 = 1280070990LL;
    sub_108B8(v35, v28, v32, v31);
  }

  *(void *)(v4 + 296) = &type metadata for String;
  *(void *)(v4 + 304) = v9;
  *(void *)(v4 + 272) = v30;
  *(void *)(v4 + 280) = v29;
  uint64_t v36 = *(void **)(v1 + 136);
  if (v36)
  {
    uint64_t v37 = *(void *)(v1 + 128);
    uint64_t v54 = 39LL;
    unint64_t v55 = 0xE100000000000000LL;
    swift_bridgeObjectRetain_n(v36, 2LL);
    v38._countAndFlagsBits = v37;
    v38._object = v36;
    String.append(_:)(v38);
    v39._countAndFlagsBits = 39LL;
    v39._object = (void *)0xE100000000000000LL;
    String.append(_:)(v39);
    swift_bridgeObjectRelease_n(v36, 2LL);
    uint64_t v41 = 39LL;
    unint64_t v40 = 0xE100000000000000LL;
  }

  else
  {
    unint64_t v40 = 0xE400000000000000LL;
    uint64_t v41 = 1280070990LL;
  }

  *(void *)(v4 + 336) = &type metadata for String;
  *(void *)(v4 + 344) = v9;
  *(void *)(v4 + 312) = v41;
  *(void *)(v4 + 320) = v40;
  if ((*(_BYTE *)(v1 + 152) & 1) != 0)
  {
    unint64_t v42 = 0xE400000000000000LL;
  }

  else
  {
    uint64_t v54 = *(void *)(v1 + 144);
    uint64_t v2 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  }

  *(void *)(v4 + 376) = &type metadata for String;
  *(void *)(v4 + 384) = v9;
  *(void *)(v4 + 352) = v2;
  *(void *)(v4 + 360) = v42;
  uint64_t v43 = String.init(format:_:)(0xD0000000000000B5LL, 0x800000000001ACE0LL, v4);
  unint64_t v45 = v44;
  if (qword_24FC0 != -1) {
    swift_once(&qword_24FC0, sub_E038);
  }
  uint64_t v46 = type metadata accessor for Logger(0LL);
  sub_5BDC(v46, (uint64_t)qword_27EF8);
  uint64_t v47 = swift_bridgeObjectRetain_n(v45, 2LL);
  uint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
  os_log_type_t v49 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v48, v49))
  {
    os_log_type_t v50 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v51 = swift_slowAlloc(32LL, -1LL);
    uint64_t v54 = v51;
    *(_DWORD *)os_log_type_t v50 = 136315138;
    swift_bridgeObjectRetain(v45);
    uint64_t v53 = sub_17E80(v43, v45, &v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v50 + 4, v50 + 12);
    swift_bridgeObjectRelease_n(v45, 3LL);
    _os_log_impl(&dword_0, v48, v49, "Insert statement: %s", v50, 0xCu);
    swift_arrayDestroy(v51, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1LL, -1LL);
    swift_slowDealloc(v50, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v45, 2LL);
  }

  return v43;
}

uint64_t sub_10ED8()
{
  uint64_t v1 = v0;
  uint64_t v2 = 1280070990LL;
  uint64_t v3 = sub_5BF4(&qword_259E8);
  uint64_t v4 = swift_allocObject(v3, 392LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_1C320;
  uint64_t v5 = *(void **)(v0 + 72);
  if (v5)
  {
    uint64_t v6 = *(void *)(v0 + 64);
    uint64_t v53 = 39LL;
    unint64_t v54 = 0xE100000000000000LL;
    swift_bridgeObjectRetain_n(v5, 2LL);
    v7._countAndFlagsBits = v6;
    v7._object = v5;
    String.append(_:)(v7);
    v8._countAndFlagsBits = 39LL;
    v8._object = (void *)0xE100000000000000LL;
    String.append(_:)(v8);
    swift_bridgeObjectRelease_n(v5, 2LL);
    uint64_t v10 = 39LL;
    unint64_t v9 = 0xE100000000000000LL;
  }

  else
  {
    unint64_t v9 = 0xE400000000000000LL;
    uint64_t v10 = 1280070990LL;
  }

  *(void *)(v4 + 56) = &type metadata for String;
  unint64_t v11 = sub_12B50();
  *(void *)(v4 + 64) = v11;
  *(void *)(v4 + 32) = v10;
  *(void *)(v4 + 40) = v9;
  if ((*(_BYTE *)(v1 + 88) & 1) != 0)
  {
    unint64_t v12 = 0xE400000000000000LL;
    uint64_t v13 = 1280070990LL;
  }

  else
  {
    uint64_t v53 = *(void *)(v1 + 80);
    uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  }

  *(void *)(v4 + 96) = &type metadata for String;
  *(void *)(v4 + 104) = v11;
  *(void *)(v4 + 72) = v13;
  *(void *)(v4 + 80) = v12;
  int v14 = *(unsigned __int8 *)(v1 + 89);
  if (v14 == 7)
  {
    unint64_t v15 = 0xE400000000000000LL;
    uint64_t v16 = 1280070990LL;
  }

  else
  {
    uint64_t v16 = sub_910C(v14);
  }

  *(void *)(v4 + 136) = &type metadata for String;
  *(void *)(v4 + 144) = v11;
  *(void *)(v4 + 112) = v16;
  *(void *)(v4 + 120) = v15;
  int v17 = *(unsigned __int8 *)(v1 + 90);
  if (v17 == 5)
  {
    unint64_t v18 = 0xE400000000000000LL;
    uint64_t v19 = 1280070990LL;
  }

  else
  {
    sub_917C(v17);
  }

  *(void *)(v4 + 176) = &type metadata for String;
  *(void *)(v4 + 184) = v11;
  *(void *)(v4 + 152) = v19;
  *(void *)(v4 + 160) = v18;
  unint64_t v20 = *(void *)(v1 + 104);
  if (v20 == 1)
  {
    unint64_t v21 = 0xE400000000000000LL;
    uint64_t v22 = 1280070990LL;
  }

  else
  {
    uint64_t v24 = *(void *)(v1 + 112);
    uint64_t v23 = *(void *)(v1 + 120);
    uint64_t v25 = *(void *)(v1 + 96);
    sub_12B94(v25, *(void *)(v1 + 104), v24, v23);
    swift_bridgeObjectRetain(v23);
    swift_bridgeObjectRetain(v20);
    uint64_t v22 = sub_AA9C(v25, v20, v24, v23);
    unint64_t v21 = v26;
    swift_bridgeObjectRelease(v23);
    swift_bridgeObjectRelease(v20);
    uint64_t v2 = 1280070990LL;
    sub_108B8(v25, v20, v24, v23);
  }

  *(void *)(v4 + 216) = &type metadata for String;
  *(void *)(v4 + 224) = v11;
  *(void *)(v4 + 192) = v22;
  *(void *)(v4 + 200) = v21;
  uint64_t v27 = *(void **)(v1 + 136);
  if (v27)
  {
    uint64_t v28 = *(void *)(v1 + 128);
    uint64_t v53 = 39LL;
    unint64_t v54 = 0xE100000000000000LL;
    swift_bridgeObjectRetain_n(v27, 2LL);
    v29._countAndFlagsBits = v28;
    v29._object = v27;
    String.append(_:)(v29);
    v30._countAndFlagsBits = 39LL;
    v30._object = (void *)0xE100000000000000LL;
    String.append(_:)(v30);
    swift_bridgeObjectRelease_n(v27, 2LL);
    uint64_t v32 = 39LL;
    unint64_t v31 = 0xE100000000000000LL;
  }

  else
  {
    unint64_t v31 = 0xE400000000000000LL;
    uint64_t v32 = 1280070990LL;
  }

  *(void *)(v4 + 256) = &type metadata for String;
  *(void *)(v4 + 264) = v11;
  *(void *)(v4 + 232) = v32;
  *(void *)(v4 + 240) = v31;
  if ((*(_BYTE *)(v1 + 152) & 1) != 0)
  {
    unint64_t v33 = 0xE400000000000000LL;
  }

  else
  {
    uint64_t v53 = *(void *)(v1 + 144);
    uint64_t v2 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  }

  *(void *)(v4 + 296) = &type metadata for String;
  *(void *)(v4 + 304) = v11;
  *(void *)(v4 + 272) = v2;
  *(void *)(v4 + 280) = v33;
  uint64_t v34 = *(void *)(v1 + 32);
  uint64_t v35 = *(void **)(v1 + 40);
  uint64_t v53 = 39LL;
  unint64_t v54 = 0xE100000000000000LL;
  swift_bridgeObjectRetain(v35);
  v36._countAndFlagsBits = v34;
  v36._object = v35;
  String.append(_:)(v36);
  v37._countAndFlagsBits = 39LL;
  v37._object = (void *)0xE100000000000000LL;
  String.append(_:)(v37);
  swift_bridgeObjectRelease(v35);
  *(void *)(v4 + 336) = &type metadata for String;
  *(void *)(v4 + 344) = v11;
  *(void *)(v4 + 312) = 39LL;
  *(void *)(v4 + 320) = 0xE100000000000000LL;
  uint64_t v39 = *(void *)(v1 + 48);
  Swift::String v38 = *(void **)(v1 + 56);
  unint64_t v54 = 0xE100000000000000LL;
  swift_bridgeObjectRetain(v38);
  v40._countAndFlagsBits = v39;
  v40._object = v38;
  String.append(_:)(v40);
  v41._countAndFlagsBits = 39LL;
  v41._object = (void *)0xE100000000000000LL;
  String.append(_:)(v41);
  swift_bridgeObjectRelease(v38);
  *(void *)(v4 + 376) = &type metadata for String;
  *(void *)(v4 + 384) = v11;
  *(void *)(v4 + 352) = 39LL;
  *(void *)(v4 + 360) = 0xE100000000000000LL;
  uint64_t v42 = String.init(format:_:)(0xD00000000000010FLL, 0x800000000001AA70LL, v4);
  unint64_t v44 = v43;
  if (qword_24FC0 != -1) {
    swift_once(&qword_24FC0, sub_E038);
  }
  uint64_t v45 = type metadata accessor for Logger(0LL);
  sub_5BDC(v45, (uint64_t)qword_27EF8);
  uint64_t v46 = swift_bridgeObjectRetain_n(v44, 2LL);
  uint64_t v47 = (os_log_s *)Logger.logObject.getter(v46);
  os_log_type_t v48 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v47, v48))
  {
    os_log_type_t v49 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v50 = swift_slowAlloc(32LL, -1LL);
    uint64_t v53 = v50;
    *(_DWORD *)os_log_type_t v49 = 136315138;
    swift_bridgeObjectRetain(v44);
    uint64_t v52 = sub_17E80(v42, v44, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v49 + 4, v49 + 12);
    swift_bridgeObjectRelease_n(v44, 3LL);
    _os_log_impl(&dword_0, v47, v48, "Update statement: %s", v49, 0xCu);
    swift_arrayDestroy(v50, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v50, -1LL, -1LL);
    swift_slowDealloc(v49, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v44, 2LL);
  }

  return v42;
}

unint64_t sub_113C0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 40);
  swift_bridgeObjectRetain(v2);
  _StringGuts.grow(_:)(41LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  v13[1] = 0x800000000001ADB0LL;
  v3._countAndFlagsBits = v1;
  v3._object = v2;
  String.append(_:)(v3);
  v4._countAndFlagsBits = 15143LL;
  v4._object = (void *)0xE200000000000000LL;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(v2);
  if (qword_24FC0 != -1) {
    swift_once(&qword_24FC0, sub_E038);
  }
  uint64_t v5 = type metadata accessor for Logger(0LL);
  sub_5BDC(v5, (uint64_t)qword_27EF8);
  uint64_t v6 = swift_bridgeObjectRetain_n(0x800000000001ADB0LL, 2LL);
  Swift::String v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v10 = swift_slowAlloc(32LL, -1LL);
    v13[0] = v10;
    *(_DWORD *)unint64_t v9 = 136315138;
    swift_bridgeObjectRetain(0x800000000001ADB0LL);
    uint64_t v12 = sub_17E80(0xD000000000000025LL, 0x800000000001ADB0LL, v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, v13, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease_n(0x800000000001ADB0LL, 3LL);
    _os_log_impl(&dword_0, v7, v8, "Delete statement: %s", v9, 0xCu);
    swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(0x800000000001ADB0LL, 2LL);
  }

  return 0xD000000000000025LL;
}

uint64_t sub_115CC@<X0>(sqlite3_stmt *a1@<X0>, uint64_t a2@<X8>)
{
  int v4 = sqlite3_column_type(a1, 0);
  if (v4 == 5) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = sqlite3_column_int(a1, 0);
  }
  if (sqlite3_column_type(a1, 1) == 5 || !sqlite3_column_text(a1, 1))
  {
    uint64_t v39 = 0LL;
    uint64_t v45 = 0LL;
  }

  else
  {
    uint64_t v39 = String.init(cString:)();
    uint64_t v45 = v6;
  }

  if (sqlite3_column_type(a1, 2) == 5 || !sqlite3_column_text(a1, 2))
  {
    uint64_t v7 = 0LL;
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v7 = String.init(cString:)();
    uint64_t v9 = v8;
  }

  if (sqlite3_column_type(a1, 3) == 5 || !sqlite3_column_text(a1, 3))
  {
    uint64_t v38 = 0LL;
    uint64_t v44 = 0LL;
  }

  else
  {
    uint64_t v38 = String.init(cString:)();
    uint64_t v44 = v10;
  }

  int v11 = sqlite3_column_type(a1, 4);
  if (v11 == 5) {
    uint64_t v37 = 0LL;
  }
  else {
    uint64_t v37 = sqlite3_column_int(a1, 4);
  }
  uint64_t v12 = 0x6E776F6E6B6E75LL;
  if (sqlite3_column_type(a1, 5) == 5 || !sqlite3_column_text(a1, 5))
  {
    v13._object = (void *)0xE700000000000000LL;
    v13._countAndFlagsBits = 0x6E776F6E6B6E75LL;
  }

  else
  {
    v13._countAndFlagsBits = String.init(cString:)();
  }

  char v36 = sub_1231C(v13);
  if (sqlite3_column_type(a1, 6) == 5 || !sqlite3_column_text(a1, 6)) {
    v14._object = (void *)0xE700000000000000LL;
  }
  else {
    uint64_t v12 = String.init(cString:)();
  }
  v14._countAndFlagsBits = v12;
  char v35 = sub_12364(v14);
  unint64_t v15 = sub_AF20(a1, 7);
  uint64_t v42 = v16;
  uint64_t v43 = (uint64_t)v15;
  uint64_t v40 = v18;
  uint64_t v41 = v17;
  if (sqlite3_column_type(a1, 8) == 5)
  {
    uint64_t v34 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v20 = v9;
  }

  else
  {
    uint64_t v20 = v9;
    if (sqlite3_column_text(a1, 8))
    {
      uint64_t v34 = String.init(cString:)();
      uint64_t v19 = v21;
    }

    else
    {
      uint64_t v34 = 0LL;
      uint64_t v19 = 0LL;
    }
  }

  int v22 = sqlite3_column_type(a1, 9);
  if (v22 == 5)
  {
    uint64_t v23 = 0LL;
    if (!v45) {
      goto LABEL_38;
    }
  }

  else
  {
    uint64_t v23 = sqlite3_column_int(a1, 9);
    if (!v45) {
      goto LABEL_38;
    }
  }

  if (v20)
  {
    int v24 = v4;
    uint64_t v25 = v20;
    char v26 = v22 == 5;
    char v27 = v11 == 5;
    BOOL v33 = v24 == 5;
    uint64_t v28 = type metadata accessor for GameState();
    uint64_t v29 = swift_allocObject(v28, 185LL, 7LL);
    *((void *)&v32 + 1) = v41;
    *(void *)&__int128 v32 = v42;
    HIBYTE(v31) = v35;
    LOBYTE(v31) = v36;
    uint64_t result = sub_F6E8(v39, v45, v7, v25, v38, v44, v37, v27, v31, v43, v32, v40, v34, v19, v23, v26);
    *(void *)(v29 + 16) = v5;
    *(_BYTE *)(v29 + 24) = v33;
    *(void *)(a2 + 24) = v28;
    *(void *)(a2 + 32) = &off_21958;
    *(void *)a2 = v29;
    return result;
  }

LABEL_38:
  *(void *)(a2 + 32) = 0LL;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  swift_bridgeObjectRelease(v19);
  sub_108B8(v43, v42, v41, v40);
  swift_bridgeObjectRelease(v44);
  swift_bridgeObjectRelease(v20);
  return swift_bridgeObjectRelease(v45);
}

BOOL sub_1196C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin();
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = static os_signpost_type_t.begin.getter(v4);
  if (qword_24FB0 != -1) {
    swift_once(&qword_24FB0, sub_DF3C);
  }
  uint64_t v8 = qword_27EE8;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v7, &dword_0, v8, "updateData", 10LL, 2LL, v6);
  uint64_t v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  v9(v6, v2);
  swift_retain(v1);
  uint64_t v10 = sub_10ED8();
  unint64_t v12 = v11;
  BOOL v13 = sub_BDE8(v10, v11);
  swift_release(v1);
  uint64_t v14 = swift_bridgeObjectRelease(v12);
  if (v13)
  {
    if (qword_24FC0 != -1) {
      swift_once(&qword_24FC0, sub_E038);
    }
    uint64_t v15 = type metadata accessor for Logger(0LL);
    uint64_t v16 = sub_5BDC(v15, (uint64_t)qword_27EF8);
    uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "Update succeeded.", v19, 2u);
      swift_slowDealloc(v19, -1LL, -1LL);
    }
  }

  uint64_t v20 = static os_signpost_type_t.end.getter(v14);
  uint64_t v21 = qword_27EE8;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v20, &dword_0, v21, "updateData", 10LL, 2LL, v6);
  v9(v6, v2);
  return v13;
}

uint64_t sub_11B84(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin();
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = static os_signpost_type_t.begin.getter(v6);
  if (qword_24FB0 != -1) {
    swift_once(&qword_24FB0, sub_DF3C);
  }
  uint64_t v10 = qword_27EE8;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v9, &dword_0, v10, "insertData", 10LL, 2LL, v8);
  unint64_t v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v8, v4);
  uint64_t v12 = sub_BDE8(0xD00000000000014FLL, 0x800000000001AB90LL);
  if ((v12 & 1) != 0
    && (swift_retain(v2),
        uint64_t v13 = sub_109FC(),
        unint64_t v15 = v14,
        BOOL v16 = sub_BDE8(v13, v14),
        swift_release(v2),
        uint64_t v12 = swift_bridgeObjectRelease(v15),
        v16))
  {
    *(void *)(v2 + 16) = sqlite3_last_insert_rowid(*(sqlite3 **)(a1 + 16));
    *(_BYTE *)(v2 + 24) = 0;
    if (qword_24FC0 != -1) {
      swift_once(&qword_24FC0, sub_E038);
    }
    uint64_t v17 = type metadata accessor for Logger(0LL);
    uint64_t v18 = sub_5BDC(v17, (uint64_t)qword_27EF8);
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
    os_log_type_t v20 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_0, v19, v20, "Insert succeeded.", v21, 2u);
      swift_slowDealloc(v21, -1LL, -1LL);
    }

    uint64_t v22 = 1LL;
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  uint64_t v23 = static os_signpost_type_t.end.getter(v12);
  uint64_t v24 = qword_27EE8;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v23, &dword_0, v24, "insertData", 10LL, 2LL, v8);
  v11(v8, v4);
  return v22;
}

uint64_t sub_11DDC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = static os_signpost_type_t.begin.getter(v6);
  if (qword_24FB0 != -1) {
    swift_once(&qword_24FB0, sub_DF3C);
  }
  uint64_t v10 = qword_27EE8;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v9, &dword_0, v10, "deleteData", 10LL, 2LL, v8);
  unint64_t v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v8, v4);
  if (*(_BYTE *)(v2 + 24) == 1 && (sub_120D8(a1) & 1) == 0)
  {
    if (qword_24FC0 != -1) {
      swift_once(&qword_24FC0, sub_E038);
    }
    uint64_t v23 = type metadata accessor for Logger(0LL);
    uint64_t v24 = sub_5BDC(v23, (uint64_t)qword_27EF8);
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v24);
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v19, v25))
    {
      uint64_t v22 = 0LL;
      goto LABEL_18;
    }

    uint64_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_0, v19, v25, "Failed to delete data because it's not in database yet.", v21, 2u);
    uint64_t v22 = 0LL;
    goto LABEL_15;
  }

  swift_retain(v2);
  unint64_t v12 = sub_113C0();
  unint64_t v14 = v13;
  BOOL v15 = sub_BDE8(v12, v13);
  swift_release(v2);
  uint64_t v16 = swift_bridgeObjectRelease(v14);
  if (v15)
  {
    *(void *)(v2 + 16) = 0LL;
    *(_BYTE *)(v2 + 24) = 1;
    if (qword_24FC0 != -1) {
      swift_once(&qword_24FC0, sub_E038);
    }
    uint64_t v17 = type metadata accessor for Logger(0LL);
    uint64_t v18 = sub_5BDC(v17, (uint64_t)qword_27EF8);
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
    os_log_type_t v20 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v19, v20))
    {
      uint64_t v22 = 1LL;
      goto LABEL_18;
    }

    uint64_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_0, v19, v20, "Delete succeeded.", v21, 2u);
    uint64_t v22 = 1LL;
LABEL_15:
    swift_slowDealloc(v21, -1LL, -1LL);
LABEL_18:

    goto LABEL_19;
  }

  uint64_t v22 = 0LL;
LABEL_19:
  uint64_t v26 = static os_signpost_type_t.end.getter(v16);
  uint64_t v27 = qword_27EE8;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v26, &dword_0, v27, "deleteData", 10LL, 2LL, v8);
  v11(v8, v4);
  return v22;
}

uint64_t sub_120D8(uint64_t a1)
{
  uint64_t v3 = v1[4];
  uint64_t v4 = (void *)v1[5];
  uint64_t v6 = v1[6];
  unint64_t v5 = v1[7];
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  unint64_t v7 = sub_1247C(v3, v4, v6, v5);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v10 = sub_C12C(v7, v9, a1);
  swift_bridgeObjectRelease(v9);
  if (!v10) {
    return 0LL;
  }
  uint64_t v11 = (uint64_t)sub_12220((uint64_t)v10);
  uint64_t result = swift_bridgeObjectRelease(v10);
  if (!v11) {
    return 0LL;
  }
  if (!((unint64_t)v11 >> 62))
  {
    goto LABEL_14;
  }

  if (v11 >= 0) {
    uint64_t v15 = v11 & 0xFFFFFFFFFFFFFF8LL;
  }
  else {
    uint64_t v15 = v11;
  }
  swift_bridgeObjectRetain(v11);
  uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v15);
  uint64_t result = swift_bridgeObjectRelease(v11);
  if (!v16)
  {
LABEL_14:
    swift_bridgeObjectRelease(v11);
    return 0LL;
  }

LABEL_5:
  if ((v11 & 0xC000000000000001LL) != 0)
  {
    uint64_t v13 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v11);
LABEL_8:
    swift_bridgeObjectRelease(v11);
    int v14 = *(unsigned __int8 *)(v13 + 24);
    swift_release(v13);
    return v14 != 1;
  }

  if (*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8LL)))
  {
    uint64_t v13 = *(void *)(v11 + 32);
    swift_retain(v13);
    goto LABEL_8;
  }

  __break(1u);
  return result;
}

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

void *sub_12220(uint64_t a1)
{
  unint64_t v12 = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  specialized ContiguousArray.reserveCapacity(_:)(v2);
  if (!v2) {
    return v12;
  }
  for (uint64_t i = a1 + 32; ; i += 40LL)
  {
    sub_8908(i, (uint64_t)v11);
    uint64_t v4 = sub_5BF4(&qword_25840);
    uint64_t v5 = type metadata accessor for GameState();
    uint64_t v6 = v10;
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    uint64_t v7 = v12[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v7);
    uint64_t v8 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v7, v6);
    specialized ContiguousArray._endMutation()(v8);
    if (!--v2) {
      return v12;
    }
  }

  uint64_t v10 = 0LL;
  swift_release(v12);
  swift_release(v10);
  return 0LL;
}

unint64_t sub_1231C(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_20BF0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 7) {
    return 7LL;
  }
  else {
    return v3;
  }
}

unint64_t sub_12364(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_20CB8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5) {
    return 5LL;
  }
  else {
    return v3;
  }
}

unint64_t sub_123AC()
{
  unint64_t result = qword_259D0;
  if (!qword_259D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BFE8, &type metadata for GameState.ClientAction);
    atomic_store(result, (unint64_t *)&qword_259D0);
  }

  return result;
}

unint64_t sub_123F0()
{
  unint64_t result = qword_259D8;
  if (!qword_259D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1BEF8, &type metadata for GameState.UserAction);
    atomic_store(result, (unint64_t *)&qword_259D8);
  }

  return result;
}

unint64_t sub_12434(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_20D50, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 9) {
    return 9LL;
  }
  else {
    return v3;
  }
}

unint64_t sub_1247C(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  if (!a2) {
    return 0xD00000000000003ALL;
  }
  if (!a4) {
    goto LABEL_8;
  }
  uint64_t v8 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000LL) == 0) {
    uint64_t v8 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v8)
  {
    _StringGuts.grow(_:)(98LL);
    v9._countAndFlagsBits = 0xD000000000000027LL;
    v9._object = (void *)0x800000000001A9F0LL;
    String.append(_:)(v9);
    v10._countAndFlagsBits = a1;
    v10._object = a2;
    String.append(_:)(v10);
    v11._countAndFlagsBits = 0xD000000000000013LL;
    v11._object = (void *)0x800000000001AA50LL;
    String.append(_:)(v11);
    uint64_t v12 = a3;
    unint64_t v13 = a4;
  }

  else
  {
LABEL_8:
    _StringGuts.grow(_:)(77LL);
    v15._countAndFlagsBits = 0xD000000000000027LL;
    v15._object = (void *)0x800000000001A9F0LL;
    String.append(_:)(v15);
    uint64_t v12 = a1;
    unint64_t v13 = (unint64_t)a2;
  }

  String.append(_:)(*(Swift::String *)&v12);
  v16._object = (void *)0x800000000001AA20LL;
  v16._countAndFlagsBits = 0xD000000000000024LL;
  String.append(_:)(v16);
  return 0LL;
}

uint64_t sub_125D8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v59 = a1;
  unint64_t v60 = a5;
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  Swift::String v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v61 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v12 = *(void *)(v61 - 8);
  uint64_t v13 = __chkstk_darwin(v61);
  Swift::String v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = static os_signpost_type_t.begin.getter(v13);
  if (qword_24FB0 != -1) {
    swift_once(&qword_24FB0, sub_DF3C);
  }
  uint64_t v58 = a2;
  uint64_t v17 = qword_27EE8;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v16, &dword_0, v17, "queryData", 9LL, 2LL, v15);
  uint64_t v18 = *(void (**)(char *, uint64_t))(v12 + 8);
  v18(v15, v61);
  if (qword_24FC0 != -1) {
    swift_once(&qword_24FC0, sub_E038);
  }
  uint64_t v19 = sub_5BDC(v8, (uint64_t)qword_27EF8);
  os_log_type_t v20 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v19, v8);
  uint64_t v21 = swift_bridgeObjectRetain_n(a3, 2LL);
  uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
  uint64_t v23 = v8;
  os_log_type_t v24 = static os_log_type_t.debug.getter();
  BOOL v25 = os_log_type_enabled(v22, v24);
  uint64_t v57 = v18;
  if (v25)
  {
    uint64_t v53 = v9;
    unint64_t v54 = v20;
    uint64_t v55 = v19;
    uint64_t v26 = swift_slowAlloc(12LL, -1LL);
    uint64_t v56 = a4;
    uint64_t v27 = (uint8_t *)v26;
    uint64_t v51 = swift_slowAlloc(32LL, -1LL);
    uint64_t v63 = v51;
    *(_DWORD *)uint64_t v27 = 136315138;
    uint64_t v28 = v15;
    uint64_t v29 = v58;
    if (a3) {
      uint64_t v30 = v58;
    }
    else {
      uint64_t v30 = 7104878LL;
    }
    if (a3) {
      unint64_t v31 = (unint64_t)a3;
    }
    else {
      unint64_t v31 = 0xE300000000000000LL;
    }
    uint64_t v52 = v23;
    swift_bridgeObjectRetain(a3);
    uint64_t v32 = v30;
    Swift::String v15 = v28;
    uint64_t v62 = sub_17E80(v32, v31, &v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v27 + 4, v27 + 12);
    swift_bridgeObjectRelease_n(a3, 2LL);
    swift_bridgeObjectRelease(v31);
    _os_log_impl(&dword_0, v22, v24, "read data from DB, game= %s", v27, 0xCu);
    uint64_t v33 = v51;
    swift_arrayDestroy(v51, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v33, -1LL, -1LL);
    uint64_t v34 = v27;
    a4 = v56;
    swift_slowDealloc(v34, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v52);
    char v35 = a3;
  }

  else
  {

    swift_bridgeObjectRelease_n(a3, 2LL);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v20, v23);
    char v35 = a3;
    uint64_t v29 = v58;
  }

  unint64_t v36 = sub_1247C(v29, v35, a4, v60);
  unint64_t v38 = v37;
  uint64_t v39 = swift_bridgeObjectRetain_n(v37, 2LL);
  uint64_t v40 = (os_log_s *)Logger.logObject.getter(v39);
  os_log_type_t v41 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v43 = swift_slowAlloc(32LL, -1LL);
    uint64_t v63 = v43;
    *(_DWORD *)uint64_t v42 = 136315138;
    swift_bridgeObjectRetain(v38);
    uint64_t v62 = sub_17E80(v36, v38, &v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v42 + 4, v42 + 12);
    swift_bridgeObjectRelease_n(v38, 3LL);
    _os_log_impl(&dword_0, v40, v41, "read data from DB, queryStatement= %s", v42, 0xCu);
    swift_arrayDestroy(v43, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v43, -1LL, -1LL);
    swift_slowDealloc(v42, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v38, 2LL);
  }

  uint64_t v44 = sub_C490(v36, v38, v59);
  uint64_t result = swift_bridgeObjectRelease(v38);
  if (!v44) {
    goto LABEL_26;
  }
  uint64_t v46 = (uint64_t)sub_12220((uint64_t)v44);
  uint64_t result = swift_bridgeObjectRelease(v44);
  if (!v46)
  {
    uint64_t v44 = 0LL;
    goto LABEL_26;
  }

  if ((unint64_t)v46 >> 62)
  {
    if (v46 >= 0) {
      uint64_t v49 = v46 & 0xFFFFFFFFFFFFFF8LL;
    }
    else {
      uint64_t v49 = v46;
    }
    swift_bridgeObjectRetain(v46);
    uint64_t v44 = (char *)_CocoaArrayWrapper.endIndex.getter(v49);
    uint64_t result = swift_bridgeObjectRelease(v46);
    if (!v44) {
      goto LABEL_24;
    }
  }

  else
  {
    uint64_t v44 = *(char **)((char *)&dword_10 + (v46 & 0xFFFFFFFFFFFFFF8LL));
    if (!v44)
    {
LABEL_24:
      uint64_t result = swift_bridgeObjectRelease(v46);
LABEL_26:
      uint64_t v47 = static os_signpost_type_t.end.getter(result);
      uint64_t v48 = qword_27EE8;
      static OSSignpostID.exclusive.getter();
      os_signpost(_:dso:log:name:signpostID:)(v47, &dword_0, v48, "queryData", 9LL, 2LL, v15);
      v57(v15, v61);
      return (uint64_t)v44;
    }
  }

  if ((v46 & 0xC000000000000001LL) != 0)
  {
    uint64_t v44 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v46);
    goto LABEL_24;
  }

  if (*(void *)((char *)&dword_10 + (v46 & 0xFFFFFFFFFFFFFF8LL)))
  {
    uint64_t v44 = *(char **)(v46 + 32);
    swift_retain(v44);
    goto LABEL_24;
  }

  __break(1u);
  return result;
}

unint64_t sub_12B50()
{
  unint64_t result = qword_259F0;
  if (!qword_259F0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_259F0);
  }

  return result;
}

uint64_t sub_12B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRetain(a4);
    return swift_bridgeObjectRetain(a2);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for GameState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 8;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }

uint64_t storeEnumTagSinglePayload for GameState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF7) {
    return ((uint64_t (*)(void))((char *)&loc_12CA4 + 4 * byte_1BE1B[v4]))();
  }
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_12CD8 + 4 * byte_1BE16[v4]))();
}

uint64_t sub_12CD8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_12CE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x12CE8LL);
  }
  return result;
}

uint64_t sub_12CF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x12CFCLL);
  }
  *(_BYTE *)uint64_t result = a2 + 8;
  return result;
}

uint64_t sub_12D00(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_12D08(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GameState.CodingKeys()
{
  return &type metadata for GameState.CodingKeys;
}

unint64_t sub_12D28()
{
  unint64_t result = qword_259F8;
  if (!qword_259F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C1EC, &type metadata for GameState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_259F8);
  }

  return result;
}

unint64_t sub_12D70()
{
  unint64_t result = qword_25A00;
  if (!qword_25A00)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C124, &type metadata for GameState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25A00);
  }

  return result;
}

unint64_t sub_12DB8()
{
  unint64_t result = qword_25A08;
  if (!qword_25A08)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C14C, &type metadata for GameState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25A08);
  }

  return result;
}

void sub_12DFC()
{
  uint64_t v0 = sub_5BF4(&qword_254D0);
  uint64_t v1 = swift_allocObject(v0, 40LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_1B4E0;
  uint64_t v2 = sub_D164();
  id v3 = objc_allocWithZone(&OBJC_CLASS___SABaseAceObject);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  id v5 = [v3 initWithDictionary:isa];

  if (v5)
  {
    *(void *)(v1 + 32) = v5;
    specialized Array._endMutation()();
    NLContextUpdate.conversationStateAttachments.setter(v1);
  }

  else
  {
    __break(1u);
  }

id sub_12F2C()
{
  uint64_t v1 = type metadata accessor for UUID(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v103 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for String.Encoding(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v103 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v9 = *(void *)(v0 + 104);
  if (v9 < 2
    || (uint64_t v10 = *(void *)(v0 + 96),
        uint64_t v11 = swift_bridgeObjectRetain(*(void *)(v0 + 104)),
        static String.Encoding.utf8.getter(v11),
        uint64_t v12 = String.data(using:allowLossyConversion:)(v8, 0LL, v10, v9),
        unint64_t v14 = v13,
        swift_bridgeObjectRelease(v9),
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5),
        v14 >> 60 == 15))
  {
    if (qword_24FC8 != -1) {
      swift_once(&qword_24FC8, sub_E09C);
    }
    uint64_t v15 = type metadata accessor for Logger(0LL);
    uint64_t v16 = sub_5BDC(v15, (uint64_t)qword_27F10);
    uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "no addViewsJson from storage", v19, 2u);
      swift_slowDealloc(v19, -1LL, -1LL);
    }

    return 0LL;
  }

  uint64_t v22 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  uint64_t v112 = v12;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  *(void *)&__int128 v117 = 0LL;
  id v24 = [v22 JSONObjectWithData:isa options:4 error:&v117];

  uint64_t v25 = v117;
  if (!v24)
  {
    id v36 = (id)v117;
    uint64_t v37 = _convertNSErrorToError(_:)(v25);

    swift_willThrow();
    if (qword_24FC8 != -1) {
      swift_once(&qword_24FC8, sub_E09C);
    }
    uint64_t v38 = type metadata accessor for Logger(0LL);
    uint64_t v39 = sub_5BDC(v38, (uint64_t)qword_27F10);
    uint64_t v40 = (os_log_s *)Logger.logObject.getter(v39);
    os_log_type_t v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_0, v40, v41, "parse addViewsJson to addViews failed", v42, 2u);
      swift_slowDealloc(v42, -1LL, -1LL);
    }

    sub_B0E4(v112, v14);
    swift_errorRelease(v37);

    return 0LL;
  }

  id v26 = (id)v117;
  _bridgeAnyObjectToAny(_:)(&v117, v24);
  swift_unknownObjectRelease(v24);
  uint64_t v27 = sub_5BF4((uint64_t *)&unk_25A10);
  else {
    uint64_t v28 = 0LL;
  }
  id v29 = [objc_allocWithZone(SAUIAddViews) init];
  sub_14D1C(v28);
  if (!v30)
  {

    swift_bridgeObjectRelease(v28);
    sub_B0E4(v112, v14);
    return 0LL;
  }

  unint64_t v31 = v30;
  id v32 = objc_allocWithZone(&OBJC_CLASS___SAUIAssistantUtteranceView);
  id v33 = v31;
  id v111 = [v32 init];
  if (v28)
  {
    if (*(void *)(v28 + 16) && (unint64_t v34 = sub_1496C(0x676F6C616964LL, 0xE600000000000000LL), (v35 & 1) != 0))
    {
      sub_DEB4(*(void *)(v28 + 56) + 32 * v34, (uint64_t)&v117);
    }

    else
    {
      __int128 v117 = 0u;
      __int128 v118 = 0u;
    }

    swift_bridgeObjectRelease(v28);
    if (!*((void *)&v118 + 1))
    {
      sub_149D0((uint64_t)&v117);
      goto LABEL_52;
    }

    uint64_t v43 = v115;
    if (qword_24FC8 != -1) {
      swift_once(&qword_24FC8, sub_E09C);
    }
    uint64_t v44 = type metadata accessor for Logger(0LL);
    sub_5BDC(v44, (uint64_t)qword_27F10);
    uint64_t v45 = swift_bridgeObjectRetain_n(v43, 2LL);
    uint64_t v46 = (os_log_s *)Logger.logObject.getter(v45);
    os_log_type_t v47 = static os_log_type_t.debug.getter();
    int v48 = v47;
    BOOL v49 = os_log_type_enabled(v46, v47);
    unint64_t v110 = v14;
    if (v49)
    {
      v109 = v46;
      uint64_t v50 = swift_slowAlloc(12LL, -1LL);
      LODWORD(v108) = v48;
      uint64_t v51 = (uint8_t *)v50;
      uint64_t v107 = swift_slowAlloc(32LL, -1LL);
      *(void *)&__int128 v117 = v107;
      v106 = v51;
      *(_DWORD *)uint64_t v51 = 136315138;
      uint64_t v52 = v51 + 12;
      v104 = v51 + 4;
      uint64_t v53 = swift_bridgeObjectRetain(v43);
      v105 = (char *)&type metadata for Any + 8;
      uint64_t v54 = Dictionary.description.getter( v53,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
      unint64_t v56 = v55;
      swift_bridgeObjectRelease(v43);
      uint64_t v115 = sub_17E80(v54, v56, (uint64_t *)&v117);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, &v116, v104, v52);
      swift_bridgeObjectRelease_n(v43, 2LL);
      swift_bridgeObjectRelease(v56);
      uint64_t v57 = v109;
      uint64_t v58 = v106;
      _os_log_impl(&dword_0, v109, (os_log_type_t)v108, "parse result - dialogJson is: %s", v106, 0xCu);
      uint64_t v59 = v107;
      swift_arrayDestroy(v107, 1LL, v105);
      swift_slowDealloc(v59, -1LL, -1LL);
      swift_slowDealloc(v58, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v43, 2LL);
    }

    id v60 = v111;
    uint64_t v61 = UUID.init()();
    UUID.uuidString.getter(v61);
    uint64_t v63 = v62;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    NSString v64 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v63);
    [v60 setAceId:v64];

    if (*(void *)(v43 + 16)
      && (unint64_t v65 = sub_1496C(0xD000000000000010LL, 0x800000000001ADE0LL), (v66 & 1) != 0)
      && (sub_DEB4(*(void *)(v43 + 56) + 32 * v65, (uint64_t)&v117),
          (swift_dynamicCast(&v115, &v117, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0))
    {
      uint64_t v67 = v116;
      NSString v68 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v67);
    }

    else
    {
      NSString v68 = 0LL;
    }

    [v60 setDialogIdentifier:v68];

    if (*(void *)(v43 + 16) && (unint64_t v69 = sub_1496C(0x746E65746E6F63LL, 0xE700000000000000LL), (v70 & 1) != 0))
    {
      sub_DEB4(*(void *)(v43 + 56) + 32 * v69, (uint64_t)&v117);
    }

    else
    {
      __int128 v117 = 0u;
      __int128 v118 = 0u;
    }

    swift_bridgeObjectRelease(v43);
    if (*((void *)&v118 + 1))
    {
      if ((swift_dynamicCast(&v115, &v117, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0)
      {
        uint64_t v71 = v116;
        swift_bridgeObjectRetain(v116);
        NSString v72 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v71);
LABEL_48:
        [v60 setText:v72];

        id v73 = v60;
        if (v71)
        {
          NSString v74 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v71);
        }

        else
        {
          NSString v74 = 0LL;
        }

        [v60 setSpeakableText:v74];

        sub_14A10(0LL, &qword_25A30, &OBJC_CLASS___NSNumber_ptr);
        id v75 = v60;
        Class v76 = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
        [v75 setListenAfterSpeaking:v76];

        unint64_t v14 = v110;
        goto LABEL_52;
      }
    }

    else
    {
      sub_149D0((uint64_t)&v117);
    }

    NSString v72 = 0LL;
    uint64_t v71 = 0LL;
    goto LABEL_48;
  }

LABEL_52:
  id v77 = [objc_allocWithZone(SAUISash) init];
  id result = [v33 sash];
  if (result)
  {
    v78 = result;
    id v79 = [result title];

    [v77 setTitle:v79];
    NSString v80 = String._bridgeToObjectiveC()();
    [v77 setApplicationBundleIdentifier:v80];

    [v33 setSash:v77];
    *(void *)&__int128 v117 = &_swiftEmptyArrayStorage;
    v81 = (os_log_s *)v111;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    unint64_t v83 = *(void *)((char *)&dword_10 + (v117 & 0xFFFFFFFFFFFFFF8LL));
    unint64_t v82 = *(void *)((char *)&dword_18 + (v117 & 0xFFFFFFFFFFFFFF8LL));
    if (v83 >= v82 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v82 > 1, v83 + 1, 1LL);
    }
    uint64_t v84 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v83, v81);
    specialized Array._endMutation()(v84);
    id v85 = v33;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    unint64_t v87 = *(void *)((char *)&dword_10 + (v117 & 0xFFFFFFFFFFFFFF8LL));
    unint64_t v86 = *(void *)((char *)&dword_18 + (v117 & 0xFFFFFFFFFFFFFF8LL));
    if (v87 >= v86 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v86 > 1, v87 + 1, 1LL);
    }
    uint64_t v88 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v87, v85);
    specialized Array._endMutation()(v88);
    uint64_t v89 = v117;
    sub_14A10(0LL, &qword_25A20, &OBJC_CLASS___SAAceView_ptr);
    Class v90 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v89);
    [v29 setViews:v90];

    [v29 setImmersiveExperience:1];
    [v29 setDialogPhase:SAUIDialogPhaseSummaryValue];
    if (qword_24FC8 != -1) {
      swift_once(&qword_24FC8, sub_E09C);
    }
    uint64_t v91 = type metadata accessor for Logger(0LL);
    sub_5BDC(v91, (uint64_t)qword_27F10);
    id v20 = v29;
    v92 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v93 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v92, v93))
    {
      id v111 = v77;
      uint64_t v94 = swift_slowAlloc(12LL, -1LL);
      v109 = v81;
      v95 = (uint8_t *)v94;
      uint64_t v96 = swift_slowAlloc(32LL, -1LL);
      unint64_t v110 = v14;
      uint64_t v97 = v96;
      uint64_t v115 = v96;
      *(_DWORD *)v95 = 136315138;
      id v98 = [v20 debugDescription];
      uint64_t v99 = static String._unconditionallyBridgeFromObjectiveC(_:)(v98);
      id v108 = v85;
      unint64_t v101 = v100;

      uint64_t v113 = sub_17E80(v99, v101, &v115);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v113, &v114, v95 + 4, v95 + 12);

      swift_bridgeObjectRelease(v101);
      _os_log_impl(&dword_0, v92, v93, "addViewsCommand is: %s", v95, 0xCu);
      swift_arrayDestroy(v97, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v97, -1LL, -1LL);
      swift_slowDealloc(v95, -1LL, -1LL);
      sub_B0E4(v112, v110);
      id v102 = v108;
    }

    else
    {

      sub_B0E4(v112, v14);
    }

    return v20;
  }

  __break(1u);
  return result;
}

id sub_13B7C()
{
  uint64_t v1 = type metadata accessor for UUID(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v87 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for String.Encoding(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v9 = *(void *)(v0 + 104);
  uint64_t v10 = &SAServerBoundCommand__prots;
  if (v9 < 2) {
    goto LABEL_3;
  }
  uint64_t v11 = *(void *)(v0 + 96);
  uint64_t v12 = swift_bridgeObjectRetain(*(void *)(v0 + 104));
  static String.Encoding.utf8.getter(v12);
  uint64_t v13 = String.data(using:allowLossyConversion:)(v8, 0LL, v11, v9);
  unint64_t v15 = v14;
  swift_bridgeObjectRelease(v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v10 = &SAServerBoundCommand__prots;
  if (v15 >> 60 == 15)
  {
LABEL_3:
    if (v10[505].count != -1LL) {
      swift_once(&qword_24FC8, sub_E09C);
    }
    uint64_t v16 = type metadata accessor for Logger(0LL);
    uint64_t v17 = sub_5BDC(v16, (uint64_t)qword_27F10);
    os_log_type_t v18 = (os_log_s *)Logger.logObject.getter(v17);
    os_log_type_t v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v20 = 0;
      _os_log_impl(&dword_0, v18, v19, "no addViewsJson from storage", v20, 2u);
      swift_slowDealloc(v20, -1LL, -1LL);
    }

    return 0LL;
  }

  uint64_t v23 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  uint64_t v93 = v13;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  *(void *)&__int128 v96 = 0LL;
  id v25 = [v23 JSONObjectWithData:isa options:4 error:&v96];

  uint64_t v26 = v96;
  if (!v25)
  {
    id v35 = (id)v96;
    uint64_t v36 = _convertNSErrorToError(_:)(v26);

    swift_willThrow();
    if (qword_24FC8 != -1) {
      swift_once(&qword_24FC8, sub_E09C);
    }
    uint64_t v37 = type metadata accessor for Logger(0LL);
    uint64_t v38 = sub_5BDC(v37, (uint64_t)qword_27F10);
    uint64_t v39 = (os_log_s *)Logger.logObject.getter(v38);
    os_log_type_t v40 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v39, v40))
    {
      os_log_type_t v41 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)os_log_type_t v41 = 0;
      _os_log_impl(&dword_0, v39, v40, "parse addViewsJson to addViews failed", v41, 2u);
      swift_slowDealloc(v41, -1LL, -1LL);
    }

    sub_B0E4(v93, v15);
    swift_errorRelease(v36);

    return 0LL;
  }

  id v27 = (id)v96;
  _bridgeAnyObjectToAny(_:)(&v96, v25);
  swift_unknownObjectRelease(v25);
  uint64_t v28 = sub_5BF4((uint64_t *)&unk_25A10);
  int v29 = swift_dynamicCast(&v94, &v96, (char *)&type metadata for Any + 8, v28, 6LL);
  uint64_t v30 = v94;
  id v31 = [objc_allocWithZone(SAUIAddViews) init];
  id v32 = [objc_allocWithZone(SAUIAssistantUtteranceView) init];
  if (v29 && v30)
  {
    if (*(void *)(v30 + 16) && (unint64_t v33 = sub_1496C(0x6944656D75736572LL, 0xEC000000676F6C61LL), (v34 & 1) != 0))
    {
      sub_DEB4(*(void *)(v30 + 56) + 32 * v33, (uint64_t)&v96);
    }

    else
    {
      __int128 v96 = 0u;
      __int128 v97 = 0u;
    }

    swift_bridgeObjectRelease(v30);
    if (*((void *)&v97 + 1))
    {
      if ((swift_dynamicCast(&v94, &v96, (char *)&type metadata for Any + 8, v28, 6LL) & 1) != 0)
      {
        uint64_t v42 = v94;
        if (qword_24FC8 != -1) {
          swift_once(&qword_24FC8, sub_E09C);
        }
        uint64_t v43 = type metadata accessor for Logger(0LL);
        sub_5BDC(v43, (uint64_t)qword_27F10);
        uint64_t v44 = swift_bridgeObjectRetain_n(v42, 2LL);
        uint64_t v45 = (os_log_s *)Logger.logObject.getter(v44);
        os_log_type_t v46 = static os_log_type_t.debug.getter();
        int v47 = v46;
        BOOL v48 = os_log_type_enabled(v45, v46);
        unint64_t v92 = v15;
        if (v48)
        {
          os_log_t v90 = v45;
          LODWORD(v91) = v47;
          BOOL v49 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v89 = swift_slowAlloc(32LL, -1LL);
          *(void *)&__int128 v96 = v89;
          *(_DWORD *)BOOL v49 = 136315138;
          unint64_t v87 = v49 + 4;
          uint64_t v50 = swift_bridgeObjectRetain(v42);
          uint64_t v88 = (char *)&type metadata for Any + 8;
          uint64_t v51 = Dictionary.description.getter( v50,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
          unint64_t v53 = v52;
          swift_bridgeObjectRelease(v42);
          uint64_t v94 = sub_17E80(v51, v53, (uint64_t *)&v96);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, v95, v87, v49 + 12);
          swift_bridgeObjectRelease_n(v42, 2LL);
          swift_bridgeObjectRelease(v53);
          os_log_t v54 = v90;
          _os_log_impl(&dword_0, v90, (os_log_type_t)v91, "parse result - dialogJson is: %s", v49, 0xCu);
          uint64_t v55 = v89;
          swift_arrayDestroy(v89, 1LL, v88);
          swift_slowDealloc(v55, -1LL, -1LL);
          swift_slowDealloc(v49, -1LL, -1LL);
        }

        else
        {

          swift_bridgeObjectRelease_n(v42, 2LL);
        }

        id v56 = v32;
        uint64_t v57 = UUID.init()();
        UUID.uuidString.getter(v57);
        uint64_t v59 = v58;
        (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
        NSString v60 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v59);
        [v56 setAceId:v60];

        unint64_t v15 = v92;
        if (*(void *)(v42 + 16)
          && (unint64_t v61 = sub_1496C(0xD000000000000010LL, 0x800000000001ADE0LL), (v62 & 1) != 0)
          && (sub_DEB4(*(void *)(v42 + 56) + 32 * v61, (uint64_t)&v96),
              (swift_dynamicCast(&v94, &v96, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0))
        {
          uint64_t v63 = v95[0];
          NSString v64 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v63);
        }

        else
        {
          NSString v64 = 0LL;
        }

        [v56 setDialogIdentifier:v64];

        if (*(void *)(v42 + 16) && (unint64_t v65 = sub_1496C(0x746E65746E6F63LL, 0xE700000000000000LL), (v66 & 1) != 0))
        {
          sub_DEB4(*(void *)(v42 + 56) + 32 * v65, (uint64_t)&v96);
        }

        else
        {
          __int128 v96 = 0u;
          __int128 v97 = 0u;
        }

        swift_bridgeObjectRelease(v42);
        if (*((void *)&v97 + 1))
        {
          if ((swift_dynamicCast(&v94, &v96, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0)
          {
            uint64_t v67 = v95[0];
            swift_bridgeObjectRetain(v95[0]);
            NSString v68 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v67);
LABEL_44:
            [v56 setText:v68];

            id v69 = v56;
            if (v67)
            {
              NSString v70 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v67);
            }

            else
            {
              NSString v70 = 0LL;
            }

            [v56 setSpeakableText:v70];

            sub_14A10(0LL, &qword_25A30, &OBJC_CLASS___NSNumber_ptr);
            id v71 = v56;
            Class v72 = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
            [v71 setListenAfterSpeaking:v72];

            goto LABEL_48;
          }
        }

        else
        {
          sub_149D0((uint64_t)&v96);
        }

        NSString v68 = 0LL;
        uint64_t v67 = 0LL;
        goto LABEL_44;
      }
    }

    else
    {
      sub_149D0((uint64_t)&v96);
    }
  }

LABEL_48:
  uint64_t v73 = sub_5BF4(&qword_254D0);
  uint64_t v74 = swift_allocObject(v73, 40LL, 7LL);
  *(_OWORD *)(v74 + 16) = xmmword_1B4E0;
  *(void *)(v74 + 32) = v32;
  *(void *)&__int128 v96 = v74;
  specialized Array._endMutation()(v74);
  uint64_t v75 = v96;
  sub_14A10(0LL, &qword_25A20, &OBJC_CLASS___SAAceView_ptr);
  id v76 = v32;
  Class v77 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v75);
  [v31 setViews:v77];

  [v31 setImmersiveExperience:1];
  [v31 setDialogPhase:SAUIDialogPhaseCompletionValue];
  if (qword_24FC8 != -1) {
    swift_once(&qword_24FC8, sub_E09C);
  }
  uint64_t v78 = type metadata accessor for Logger(0LL);
  sub_5BDC(v78, (uint64_t)qword_27F10);
  id v21 = v31;
  id v79 = (os_log_s *)Logger.logObject.getter(v21);
  os_log_type_t v80 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v79, v80))
  {
    id v91 = v76;
    v81 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v82 = swift_slowAlloc(32LL, -1LL);
    *(void *)&__int128 v96 = v82;
    *(_DWORD *)v81 = 136315138;
    unint64_t v92 = v15;
    id v83 = [v21 debugDescription];
    uint64_t v84 = static String._unconditionallyBridgeFromObjectiveC(_:)(v83);
    unint64_t v86 = v85;

    uint64_t v94 = sub_17E80(v84, v86, (uint64_t *)&v96);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, v95, v81 + 4, v81 + 12);

    swift_bridgeObjectRelease(v86);
    _os_log_impl(&dword_0, v79, v80, "addViewsCommand is: %s", v81, 0xCu);
    swift_arrayDestroy(v82, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v82, -1LL, -1LL);
    swift_slowDealloc(v81, -1LL, -1LL);
    sub_B0E4(v93, v92);
  }

  else
  {

    sub_B0E4(v93, v15);
  }

  return v21;
}

void sub_1463C(uint64_t *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *a1;
  id v9 = [objc_allocWithZone(SAStartRequest) init];
  uint64_t v10 = UUID.init()();
  UUID.uuidString.getter(v10);
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  [v9 setAceId:v13];

  if (*(void *)(v8 + 16)
    && (unint64_t v14 = sub_1496C(0x636E617265747475LL, 0xE900000000000065LL), (v15 & 1) != 0)
    && (sub_DEB4(*(void *)(v8 + 56) + 32 * v14, (uint64_t)v36),
        (swift_dynamicCast(&v34, v36, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0))
  {
    uint64_t v16 = v35;
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v16);
  }

  else
  {
    NSString v17 = 0LL;
  }

  [v9 setUtterance:v17];

  id v18 = [objc_allocWithZone(SASendCommands) init];
  uint64_t v19 = sub_5BF4(&qword_254D0);
  uint64_t v20 = swift_allocObject(v19, 40LL, 7LL);
  *(_OWORD *)(v20 + 16) = xmmword_1B4E0;
  *(void *)(v20 + 32) = v9;
  v36[0] = v20;
  ((void (*)(void))specialized Array._endMutation())();
  uint64_t v21 = v36[0];
  id v22 = v9;
  sub_5BF4(&qword_254D8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v21);
  [v18 setCommands:isa];

  uint64_t v24 = *(void *)(v8 + 16);
  id v25 = v18;
  if (v24
    && (unint64_t v26 = sub_1496C(0x6449656361LL, 0xE500000000000000LL), (v27 & 1) != 0)
    && (sub_DEB4(*(void *)(v8 + 56) + 32 * v26, (uint64_t)v36),
        (swift_dynamicCast(&v34, v36, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0))
  {
    uint64_t v28 = v35;
    NSString v29 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v28);
  }

  else
  {
    NSString v29 = 0LL;
  }

  [v25 setAceId:v29];

  id v30 = v25;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v32 = *(void *)((char *)&dword_10 + (*a2 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v31 = *(void *)((char *)&dword_18 + (*a2 & 0xFFFFFFFFFFFFFF8LL));
  if (v32 >= v31 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v31 > 1, v32 + 1, 1LL);
  }
  uint64_t v33 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v32, v30);
  specialized Array._endMutation()(v33);
}

unint64_t sub_1496C(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_14AC8(a1, a2, v5);
}

uint64_t sub_149D0(uint64_t a1)
{
  uint64_t v2 = sub_5BF4(&qword_25A28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_14A10(uint64_t a1, unint64_t *a2, void *a3)
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

unint64_t sub_14A48(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  Swift::Int v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_14BA8(a1, v7);
}

unint64_t sub_14AC8(uint64_t a1, uint64_t a2, uint64_t a3)
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
        unint64_t v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_14BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2LL);
      return v5;
    }

    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0LL);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = ~v4;
      unint64_t v5 = (v5 + 1) & v15;
      if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
      {
        while (1)
        {
          uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
          uint64_t v9 = v17;
          uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19) {
            break;
          }
          uint64_t v21 = v19;
          char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0LL);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v15;
            if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0) {
              continue;
            }
          }

          return v5;
        }

        goto LABEL_16;
      }
    }
  }

  return v5;
}

void sub_14D1C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v6 = &SAServerBoundCommand__prots;
  id v7 = [objc_allocWithZone(SACardSnippet) init];
  if (a1)
  {
    if (*(void *)(a1 + 16))
    {
      unint64_t v8 = sub_1496C(0x74657070696E73LL, 0xE700000000000000LL);
      if ((v9 & 1) != 0)
      {
        sub_DEB4(*(void *)(a1 + 56) + 32 * v8, (uint64_t)&v79);
        uint64_t v10 = sub_5BF4((uint64_t *)&unk_25A10);
        if ((swift_dynamicCast(&v77, &v79, (char *)&type metadata for Any + 8, v10, 6LL) & 1) != 0)
        {
          uint64_t v11 = (uint64_t)v77;
          if (qword_24FC8 != -1) {
            swift_once(&qword_24FC8, sub_E09C);
          }
          uint64_t v12 = sub_5BDC(v2, (uint64_t)qword_27F10);
          uint64_t v13 = swift_bridgeObjectRetain_n(v11, 2LL);
          char v14 = (os_log_s *)Logger.logObject.getter(v13);
          os_log_type_t v15 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v14, v15))
          {
            uint64_t v16 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v73 = (os_log_s *)swift_slowAlloc(32LL, -1LL);
            *(void *)&__int128 v79 = v73;
            uint64_t v74 = v12;
            Class v72 = v16;
            *(_DWORD *)uint64_t v16 = 136315138;
            uint64_t v17 = v16 + 12;
            NSString v70 = v16 + 4;
            uint64_t v18 = swift_bridgeObjectRetain(v11);
            id v71 = (char *)&type metadata for Any + 8;
            uint64_t v19 = Dictionary.description.getter( v18,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
            unint64_t v21 = v20;
            swift_bridgeObjectRelease(v11);
            uint64_t v22 = v19;
            unint64_t v6 = &SAServerBoundCommand__prots;
            Class v77 = (char *)sub_17E80(v22, v21, (uint64_t *)&v79);
            uint64_t v23 = v17;
            uint64_t v12 = v74;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78, v70, v23);
            swift_bridgeObjectRelease_n(v11, 2LL);
            swift_bridgeObjectRelease(v21);
            os_log_type_t v24 = v15;
            id v25 = v72;
            _os_log_impl(&dword_0, v14, v24, "parse result - snippetJson is: %s", v72, 0xCu);
            unint64_t v26 = v73;
            swift_arrayDestroy(v73, 1LL, v71);
            swift_slowDealloc(v26, -1LL, -1LL);
            swift_slowDealloc(v25, -1LL, -1LL);

            if (!*(void *)(v11 + 16))
            {
LABEL_20:
              uint64_t v40 = swift_bridgeObjectRelease(v11);
              os_log_type_t v41 = (os_log_s *)Logger.logObject.getter(v40);
              os_log_type_t v42 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v41, v42))
              {
                uint64_t v43 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
                *(_WORD *)uint64_t v43 = 0;
                _os_log_impl(&dword_0, v41, v42, "parse error - snippet cardData is empty", v43, 2u);
                swift_slowDealloc(v43, -1LL, -1LL);
              }

              else
              {
              }

              return;
            }
          }

          else
          {

            swift_bridgeObjectRelease_n(v11, 2LL);
            if (!*(void *)(v11 + 16)) {
              goto LABEL_20;
            }
          }

          unint64_t v27 = sub_1496C(0x6174614464726163LL, 0xE800000000000000LL);
          if ((v28 & 1) == 0) {
            goto LABEL_20;
          }
          sub_DEB4(*(void *)(v11 + 56) + 32 * v27, (uint64_t)&v79);
          uint64_t v29 = (uint64_t)v77;
          uint64_t v30 = v78;
          uint64_t v31 = *(void *)(v11 + 16);
          uint64_t v69 = v11;
          if (v31)
          {
            uint64_t v74 = (uint64_t)v77;
            unint64_t v32 = sub_1496C(0xD000000000000012LL, 0x800000000001AE00LL);
            uint64_t v29 = v74;
            if ((v33 & 1) != 0)
            {
              sub_DEB4(*(void *)(v11 + 56) + 32 * v32, (uint64_t)&v79);
              uint64_t v34 = sub_5BF4(&qword_25A38);
              if ((swift_dynamicCast(&v77, &v79, (char *)&type metadata for Any + 8, v34, 6LL) & 1) != 0)
              {
                uint64_t v35 = (uint64_t)v77;
                *(void *)&__int128 v79 = &_swiftEmptyArrayStorage;
                uint64_t v36 = *((void *)v77 + 2);
                if (v36)
                {
                  swift_bridgeObjectRetain(v77);
                  for (uint64_t i = 0LL; i != v36; ++i)
                  {
                    uint64_t v38 = *(void *)(v35 + 8 * i + 32);
                    Class v77 = (char *)v38;
                    sub_1463C((uint64_t *)&v77, &v79);
                  }

                  swift_bridgeObjectRelease_n(v35, 2LL);
                  uint64_t v39 = (void *)v79;
                }

                else
                {
                  swift_bridgeObjectRelease(v77);
                  uint64_t v39 = &_swiftEmptyArrayStorage;
                }

                swift_bridgeObjectRetain(v39);
                uint64_t v44 = sub_5BF4(&qword_25AA0);
                Class isa = Array._bridgeToObjectiveC()().super.isa;
                swift_bridgeObjectRelease(v39);
                [v7 setReferencedCommands:isa];

                (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v12, v2);
                id v46 = v7;
                int v47 = (os_log_s *)Logger.logObject.getter(v46);
                int v48 = static os_log_type_t.debug.getter();
                uint64_t v73 = v47;
                unint64_t v6 = &SAServerBoundCommand__prots;
                if (os_log_type_enabled(v47, (os_log_type_t)v48))
                {
                  LODWORD(v72) = v48;
                  BOOL v49 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
                  id v71 = (char *)swift_slowAlloc(32LL, -1LL);
                  Class v77 = v71;
                  *(_DWORD *)BOOL v49 = 136315138;
                  id v50 = [v46 referencedCommands];
                  if (!v50)
                  {

                    __break(1u);
                    return;
                  }

                  uint64_t v51 = v50;
                  NSString v70 = v49 + 4;
                  uint64_t v52 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v50, v44);

                  uint64_t v53 = Array.description.getter(v52, v44);
                  unint64_t v55 = v54;
                  swift_bridgeObjectRelease(v52);
                  uint64_t v75 = sub_17E80(v53, v55, (uint64_t *)&v77);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v70, v49 + 12);

                  swift_bridgeObjectRelease(v55);
                  id v56 = v73;
                  _os_log_impl(&dword_0, v73, (os_log_type_t)v72, "referencedCommands are: %s", v49, 0xCu);
                  uint64_t v57 = v71;
                  swift_arrayDestroy(v71, 1LL, (char *)&type metadata for Any + 8);
                  swift_slowDealloc(v57, -1LL, -1LL);
                  swift_slowDealloc(v49, -1LL, -1LL);

                  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
                  unint64_t v6 = &SAServerBoundCommand__prots;
                }

                else
                {

                  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
                }

                swift_bridgeObjectRelease(v79);
                uint64_t v29 = v74;
              }
            }
          }

          uint64_t v58 = Data.init(base64Encoded:options:)(v29, v30, 1LL);
          unint64_t v60 = v59;
          swift_bridgeObjectRelease(v30);
          if (v60 >> 60 == 15)
          {
            Class v61 = 0LL;
          }

          else
          {
            Class v61 = Data._bridgeToObjectiveC()().super.isa;
            sub_B0E4(v58, v60);
          }

          objc_msgSend(v7, "setCardData:", v61, v69);

          id v62 = [objc_allocWithZone(SAUISash) (SEL)v6[472].count];
          uint64_t v63 = v69;
          if (*(void *)(v69 + 16) && (unint64_t v64 = sub_1496C(0x6C74695468736173LL, 0xE900000000000065LL), (v65 & 1) != 0))
          {
            uint64_t v66 = v63;
            sub_DEB4(*(void *)(v63 + 56) + 32 * v64, (uint64_t)&v79);
          }

          else
          {
            uint64_t v66 = v63;
            __int128 v79 = 0u;
            __int128 v80 = 0u;
          }

          swift_bridgeObjectRelease(v66);
          if (*((void *)&v80 + 1))
          {
            if ((swift_dynamicCast(&v77, &v79, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0)
            {
              uint64_t v67 = v78;
              NSString v68 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v67);
LABEL_42:
              [v62 setTitle:v68];

              [v7 setSash:v62];
              return;
            }
          }

          else
          {
            sub_149D0((uint64_t)&v79);
          }

          NSString v68 = 0LL;
          goto LABEL_42;
        }
      }
    }
  }

uint64_t sub_15514(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for String.Encoding(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for GameState();
  static String.Encoding.utf8.getter(v8);
  uint64_t v9 = String.data(using:allowLossyConversion:)(v7, 0LL, a1, a2);
  unint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v11 >> 60 == 15)
  {
    if (qword_24FC8 != -1) {
      swift_once(&qword_24FC8, sub_E09C);
    }
    uint64_t v12 = type metadata accessor for Logger(0LL);
    sub_5BDC(v12, (uint64_t)qword_27F10);
    uint64_t v13 = swift_bridgeObjectRetain_n(a2, 2LL);
    char v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v17 = swift_slowAlloc(32LL, -1LL);
      uint64_t v24 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      swift_bridgeObjectRetain(a2);
      uint64_t v23 = sub_17E80(a1, a2, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v16 + 4, v16 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl(&dword_0, v14, v15, "no invalid data for String= %s", v16, 0xCu);
      swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1LL, -1LL);
      swift_slowDealloc(v16, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
    }

    return 0LL;
  }

  else
  {
    uint64_t v18 = type metadata accessor for JSONDecoder(0LL);
    swift_allocObject(v18, *(unsigned int *)(v18 + 48), *(unsigned __int16 *)(v18 + 52));
    uint64_t v19 = JSONDecoder.init()();
    unint64_t v20 = sub_164E0();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)(&v24, v8, v9, v11, v8, v20);
    sub_B0E4(v9, v11);
    swift_release(v19);
    return v24;
  }

uint64_t sub_159FC()
{
  uint64_t v0 = type metadata accessor for Date(0LL);
  uint64_t v106 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v93 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  id v7 = (char *)&v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = static os_signpost_type_t.begin.getter(v5);
  if (qword_24FB8 != -1) {
    swift_once(&qword_24FB8, sub_DFD0);
  }
  uint64_t v9 = qword_27EF0;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v8, &dword_0, v9, "parseServerData", 15LL, 2LL, v7);
  unint64_t v10 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
  uint64_t v11 = v10(v7, v3);
  uint64_t v12 = Parse.DirectInvocation.userData.getter(v11);
  if (!v12) {
    goto LABEL_16;
  }
  uint64_t v13 = v12;
  if (!*(void *)(v12 + 16))
  {
    swift_bridgeObjectRelease(v12);
LABEL_16:
    if (qword_24FC8 != -1) {
      swift_once(&qword_24FC8, sub_E09C);
    }
    uint64_t v33 = type metadata accessor for Logger(0LL);
    uint64_t v34 = sub_5BDC(v33, (uint64_t)qword_27F10);
    uint64_t v29 = (os_log_s *)Logger.logObject.getter(v34);
    os_log_type_t v30 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v29, v30)) {
      goto LABEL_21;
    }
    uint64_t v31 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v31 = 0;
    unint64_t v32 = "no domainData";
    goto LABEL_20;
  }

  unint64_t v14 = sub_1496C(0x74617453656D6167LL, 0xE900000000000065LL);
  if ((v15 & 1) == 0
    || (sub_DEB4(*(void *)(v13 + 56) + 32 * v14, (uint64_t)&v109),
        (swift_dynamicCast(&v107, &v109, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) == 0))
  {
    swift_bridgeObjectRelease(v13);
    if (qword_24FC8 != -1) {
      swift_once(&qword_24FC8, sub_E09C);
    }
    uint64_t v27 = type metadata accessor for Logger(0LL);
    uint64_t v28 = sub_5BDC(v27, (uint64_t)qword_27F10);
    uint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
    os_log_type_t v30 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v29, v30)) {
      goto LABEL_21;
    }
    uint64_t v31 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v31 = 0;
    unint64_t v32 = "no game info from server";
LABEL_20:
    _os_log_impl(&dword_0, v29, v30, v32, v31, 2u);
    swift_slowDealloc(v31, -1LL, -1LL);
LABEL_21:

    uint64_t v36 = 0LL;
LABEL_22:
    uint64_t v37 = static os_signpost_type_t.end.getter(v35);
    uint64_t v38 = qword_27EF0;
    static OSSignpostID.exclusive.getter();
    os_signpost(_:dso:log:name:signpostID:)(v37, &dword_0, v38, "parseServerData", 15LL, 2LL, v7);
    v10(v7, v3);
    return v36;
  }

  uint64_t v102 = v0;
  uint64_t v17 = (uint64_t)v107;
  unint64_t v16 = (unint64_t)v108;
  if (qword_24FC8 != -1) {
    swift_once(&qword_24FC8, sub_E09C);
  }
  uint64_t v18 = type metadata accessor for Logger(0LL);
  uint64_t v19 = sub_5BDC(v18, (uint64_t)qword_27F10);
  uint64_t v20 = swift_bridgeObjectRetain_n(v16, 2LL);
  uint64_t v104 = v19;
  unint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
  os_log_type_t v22 = static os_log_type_t.debug.getter();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v103 = v2;
  uint64_t v105 = v17;
  if (v23)
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v25 = swift_slowAlloc(32LL, -1LL);
    *(void *)&__int128 v109 = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    unint64_t v101 = v24 + 4;
    swift_bridgeObjectRetain(v16);
    uint64_t v107 = (os_log_s *)sub_17E80(v105, v16, (uint64_t *)&v109);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v101, v24 + 12);
    swift_bridgeObjectRelease_n(v16, 3LL);
    _os_log_impl(&dword_0, v21, v22, "serverGameStateStr is: %s", v24, 0xCu);
    swift_arrayDestroy(v25, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1LL, -1LL);
    unint64_t v26 = v24;
    uint64_t v17 = v105;
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v16, 2LL);
  }

  uint64_t v36 = sub_15514(v17, v16);
  uint64_t v40 = *(void *)(v13 + 16);
  unint64_t v41 = swift_bridgeObjectRetain(v16);
  if (v40
    && (unint64_t v41 = sub_1496C(0x6E697265646E6572LL, 0xEA00000000007367LL), (v42 & 1) != 0)
    && (sub_DEB4(*(void *)(v13 + 56) + 32 * v41, (uint64_t)&v109),
        unint64_t v41 = swift_dynamicCast(&v107, &v109, (char *)&type metadata for Any + 8, &type metadata for String, 6LL),
        (v41 & 1) != 0))
  {
    uint64_t v43 = (uint64_t)v107;
    uint64_t v44 = v108;
    uint64_t v45 = swift_bridgeObjectRetain_n(v108, 2LL);
    id v46 = (os_log_s *)Logger.logObject.getter(v45);
    os_log_type_t v47 = static os_log_type_t.debug.getter();
    unint64_t v100 = v46;
    LODWORD(v98) = v47;
    BOOL v48 = os_log_type_enabled(v46, v47);
    unint64_t v101 = (uint8_t *)v43;
    if (v48)
    {
      BOOL v49 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v50 = swift_slowAlloc(32LL, -1LL);
      unint64_t v99 = v16;
      uint64_t v51 = v50;
      *(void *)&__int128 v109 = v50;
      __int128 v97 = v49;
      *(_DWORD *)BOOL v49 = 136315138;
      swift_bridgeObjectRetain(v44);
      uint64_t v107 = (os_log_s *)sub_17E80(v43, (unint64_t)v44, (uint64_t *)&v109);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v49 + 4, v49 + 12);
      swift_bridgeObjectRelease_n(v44, 3LL);
      uint64_t v52 = v100;
      uint64_t v53 = v97;
      _os_log_impl(&dword_0, v100, (os_log_type_t)v98, "renderingsJson from Server is: %s", v97, 0xCu);
      swift_arrayDestroy(v51, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v54 = v51;
      unint64_t v16 = v99;
      swift_slowDealloc(v54, -1LL, -1LL);
      swift_slowDealloc(v53, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v44, 2LL);
    }
  }

  else
  {
    unint64_t v55 = (os_log_s *)Logger.logObject.getter(v41);
    os_log_type_t v56 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v55, v56))
    {
      unint64_t v57 = v16;
      uint64_t v58 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v58 = 0;
      _os_log_impl(&dword_0, v55, v56, "no addViews from server", v58, 2u);
      unint64_t v59 = v58;
      unint64_t v16 = v57;
      swift_slowDealloc(v59, -1LL, -1LL);
    }

    unint64_t v101 = 0LL;
    uint64_t v44 = 0LL;
  }

  unint64_t v60 = v103;
  if (*(void *)(v13 + 16))
  {
    unint64_t v61 = sub_1496C(0x6B6361626C6C6166LL, 0xEF74736575716552LL);
    if ((v62 & 1) != 0)
    {
      sub_DEB4(*(void *)(v13 + 56) + 32 * v61, (uint64_t)&v109);
      if ((swift_dynamicCast(&v107, &v109, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0)
      {
        __int128 v97 = v44;
        unint64_t v63 = (unint64_t)v108;
        unint64_t v100 = v107;
        uint64_t v64 = swift_bridgeObjectRetain_n(v108, 2LL);
        char v65 = (os_log_s *)Logger.logObject.getter(v64);
        os_log_type_t v66 = static os_log_type_t.debug.getter();
        id v98 = v65;
        int v96 = v66;
        if (os_log_type_enabled(v65, v66))
        {
          uint64_t v67 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v68 = swift_slowAlloc(32LL, -1LL);
          unint64_t v99 = v16;
          uint64_t v69 = v68;
          *(void *)&__int128 v109 = v68;
          *(_DWORD *)uint64_t v67 = 136315138;
          uint64_t v94 = v67 + 4;
          NSString v70 = v67;
          v95 = v67;
          swift_bridgeObjectRetain(v63);
          uint64_t v107 = (os_log_s *)sub_17E80((uint64_t)v100, v63, (uint64_t *)&v109);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v94, v67 + 12);
          swift_bridgeObjectRelease_n(v63, 3LL);
          id v71 = v98;
          _os_log_impl(&dword_0, v98, (os_log_type_t)v96, "fallbackRequest from Server is: %s", v70, 0xCu);
          swift_arrayDestroy(v69, 1LL, (char *)&type metadata for Any + 8);
          uint64_t v72 = v69;
          unint64_t v16 = v99;
          unint64_t v60 = v103;
          swift_slowDealloc(v72, -1LL, -1LL);
          swift_slowDealloc(v95, -1LL, -1LL);
        }

        else
        {

          swift_bridgeObjectRelease_n(v63, 2LL);
        }

        if (v36)
        {
          unint64_t v73 = *(void *)(v36 + 168);
          *(void *)(v36 + 160) = v100;
          *(void *)(v36 + 168) = v63;
        }

        else
        {
          unint64_t v73 = v63;
        }

        swift_bridgeObjectRelease(v73);
        uint64_t v44 = v97;
      }
    }
  }

  if (*(void *)(v13 + 16) && (unint64_t v74 = sub_1496C(0x72754464696C6176LL, 0xED00006E6F697461LL), (v75 & 1) != 0))
  {
    sub_DEB4(*(void *)(v13 + 56) + 32 * v74, (uint64_t)&v109);
  }

  else
  {
    __int128 v109 = 0u;
    __int128 v110 = 0u;
  }

  swift_bridgeObjectRelease(v13);
  if (*((void *)&v110 + 1))
  {
    uint64_t v76 = swift_dynamicCast(&v107, &v109, (char *)&type metadata for Any + 8, &type metadata for Int, 6LL);
    if ((v76 & 1) != 0)
    {
      Class v77 = v44;
      uint64_t v78 = v107;
      __int128 v79 = (os_log_s *)Logger.logObject.getter(v76);
      os_log_type_t v80 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v79, v80))
      {
        unint64_t v81 = v16;
        uint64_t v82 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)uint64_t v82 = 134217984;
        *(void *)&__int128 v109 = v78;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v109, (char *)&v109 + 8, v82 + 4, v82 + 12);
        _os_log_impl(&dword_0, v79, v80, "validDuration from Server is: %ld", v82, 0xCu);
        id v83 = v82;
        unint64_t v16 = v81;
        unint64_t v60 = v103;
        swift_slowDealloc(v83, -1LL, -1LL);
      }

      uint64_t v44 = v77;
      if (v36)
      {
        *(void *)(v36 + 176) = v78;
        *(_BYTE *)(v36 + 184) = 0;
        goto LABEL_55;
      }

LABEL_59:
      swift_bridgeObjectRelease(v16);
      swift_bridgeObjectRelease(v44);
      goto LABEL_60;
    }
  }

  else
  {
    sub_149D0((uint64_t)&v109);
  }

  if (!v36) {
    goto LABEL_59;
  }
LABEL_55:
  uint64_t v84 = v105;
  uint64_t v85 = swift_retain(v36);
  uint64_t v86 = Date.init()(v85);
  double v87 = Date.timeIntervalSince1970.getter(v86);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v106 + 8))(v60, v102);
  if ((~*(void *)&v87 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_62;
  }

  uint64_t v88 = v101;
  if (v87 <= -9.22337204e18)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }

  if (v87 < 9.22337204e18)
  {
    *(void *)(v36 + 144) = (uint64_t)v87;
    *(_BYTE *)(v36 + 152) = 0;
    swift_release(v36);
    uint64_t v89 = *(void *)(v36 + 96);
    uint64_t v90 = *(void *)(v36 + 104);
    uint64_t v91 = *(void *)(v36 + 112);
    uint64_t v92 = *(void *)(v36 + 120);
    *(void *)(v36 + 96) = v88;
    *(void *)(v36 + 104) = v44;
    *(void *)(v36 + 112) = v84;
    *(void *)(v36 + 120) = v16;
    sub_108B8(v89, v90, v91, v92);
LABEL_60:
    uint64_t v35 = swift_bridgeObjectRelease(v16);
    goto LABEL_22;
  }

LABEL_63:
  __break(1u);
  return result;
}

unint64_t sub_164E0()
{
  unint64_t result = qword_25AA8;
  if (!qword_25AA8)
  {
    uint64_t v1 = type metadata accessor for GameState();
    unint64_t result = swift_getWitnessTable(&unk_1C0D0, v1);
    atomic_store(result, (unint64_t *)&qword_25AA8);
  }

  return result;
}

unint64_t sub_16528()
{
  unint64_t result = qword_25AB8;
  if (!qword_25AB8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSError);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_25AB8);
  }

  return result;
}

uint64_t sub_16564(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_5BF4(&qword_254E0);
  v2[4] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_165C0, 0LL, 0LL);
}

uint64_t sub_165C0()
{
  if (*(_BYTE *)(*(void *)(v0 + 24) + 112LL))
  {
    if (*(_BYTE *)(*(void *)(v0 + 24) + 112LL) == 1)
    {
      if (qword_24FC8 != -1) {
        swift_once(&qword_24FC8, sub_E09C);
      }
      uint64_t v1 = type metadata accessor for Logger(0LL);
      uint64_t v2 = sub_5BDC(v1, (uint64_t)qword_27F10);
      uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
      os_log_type_t v4 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v3, v4))
      {
        uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_0, v3, v4, "resume game", v5, 2u);
        swift_slowDealloc(v5, -1LL, -1LL);
      }

      uint64_t v6 = *(void *)(v0 + 24);

      uint64_t v7 = *(void *)(v6 + 16);
      uint64_t v8 = *(void *)(v6 + 24);
      uint64_t v9 = *(void *)(v6 + 32);
      uint64_t v10 = *(void *)(v6 + 40);
      uint64_t v11 = *(void *)(v6 + 48);
      uint64_t v12 = *(void *)(v6 + 56);
      uint64_t v13 = *(void *)(v6 + 64);
      uint64_t v14 = *(void *)(v6 + 72);
      __int128 v15 = *(_OWORD *)(v6 + 80);
      uint64_t v16 = *(void *)(v6 + 96);
      *(_OWORD *)(v6 + 16) = 0u;
      *(_OWORD *)(v6 + 32) = 0u;
      *(_OWORD *)(v6 + 48) = 0u;
      *(_OWORD *)(v6 + 64) = 0u;
      *(_OWORD *)(v6 + 80) = 0u;
      *(void *)(v6 + 96) = 0LL;
      sub_17078(v7, v8, v9, v10, v11, v12, v13, v14, v15, *((uint64_t *)&v15 + 1), v16);
      id v17 = sub_12F2C();
      *(void *)(v0 + 56) = v17;
      if (v17)
      {
        uint64_t v18 = (uint64_t)v17;
        uint64_t v19 = *(void *)(v0 + 32);
        [v17 setRefId:0];
        sub_12DFC();
        uint64_t v20 = type metadata accessor for NLContextUpdate(0LL);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56LL))(v19, 0LL, 1LL, v20);
        unint64_t v21 = (void *)swift_task_alloc(dword_2542C);
        *(void *)(v0 + 64) = v21;
        *unint64_t v21 = v0;
        v21[1] = sub_16BB8;
        uint64_t v22 = *(void *)(v0 + 32);
        uint64_t v23 = v18;
        return sub_4E90(v23, v22);
      }
    }

    else
    {
      if (qword_24FC8 != -1) {
        swift_once(&qword_24FC8, sub_E09C);
      }
      uint64_t v45 = type metadata accessor for Logger(0LL);
      uint64_t v46 = sub_5BDC(v45, (uint64_t)qword_27F10);
      os_log_type_t v47 = (os_log_s *)Logger.logObject.getter(v46);
      os_log_type_t v48 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v47, v48))
      {
        BOOL v49 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)BOOL v49 = 0;
        _os_log_impl(&dword_0, v47, v48, "ask user whether to resume game", v49, 2u);
        swift_slowDealloc(v49, -1LL, -1LL);
      }

      uint64_t v50 = *(void *)(v0 + 24);

      uint64_t v51 = *(void *)(v50 + 16);
      uint64_t v52 = *(void *)(v50 + 24);
      uint64_t v53 = *(void *)(v50 + 32);
      uint64_t v54 = *(void *)(v50 + 40);
      uint64_t v55 = *(void *)(v50 + 48);
      uint64_t v56 = *(void *)(v50 + 56);
      uint64_t v57 = *(void *)(v50 + 64);
      uint64_t v58 = *(void *)(v50 + 72);
      __int128 v59 = *(_OWORD *)(v50 + 80);
      uint64_t v60 = *(void *)(v50 + 96);
      *(_OWORD *)(v50 + 16) = 0u;
      *(_OWORD *)(v50 + 32) = 0u;
      *(_OWORD *)(v50 + 48) = 0u;
      *(_OWORD *)(v50 + 64) = 0u;
      *(_OWORD *)(v50 + 80) = 0u;
      *(void *)(v50 + 96) = 0LL;
      sub_17078(v51, v52, v53, v54, v55, v56, v57, v58, v59, *((uint64_t *)&v59 + 1), v60);
      id v17 = sub_13B7C();
      *(void *)(v0 + 40) = v17;
      if (v17)
      {
        uint64_t v61 = (uint64_t)v17;
        uint64_t v62 = *(void *)(v0 + 32);
        NLContextUpdate.init()([v17 setRefId:0]);
        NLContextUpdate.weightedPromptTargetDomain.setter(0xD00000000000001DLL, 0x800000000001A6A0LL);
        NLContextUpdate.weightedPromptStrict.setter(1LL);
        uint64_t v63 = type metadata accessor for NLContextUpdate(0LL);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56LL))(v62, 0LL, 1LL, v63);
        uint64_t v64 = (void *)swift_task_alloc(dword_2542C);
        *(void *)(v0 + 48) = v64;
        *uint64_t v64 = v0;
        v64[1] = sub_16B18;
        uint64_t v22 = *(void *)(v0 + 32);
        uint64_t v23 = v61;
        return sub_4E90(v23, v22);
      }
    }

    os_log_type_t v66 = (os_log_s *)Logger.logObject.getter(v17);
    os_log_type_t v67 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v66, v67)) {
      goto LABEL_27;
    }
    uint64_t v68 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v68 = 0;
    uint64_t v69 = "no invalid addViews";
    goto LABEL_26;
  }

  if (qword_24FC8 != -1) {
    swift_once(&qword_24FC8, sub_E09C);
  }
  uint64_t v24 = type metadata accessor for Logger(0LL);
  uint64_t v25 = sub_5BDC(v24, (uint64_t)qword_27F10);
  unint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
  os_log_type_t v27 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl(&dword_0, v26, v27, "request to start a new game", v28, 2u);
    swift_slowDealloc(v28, -1LL, -1LL);
  }

  uint64_t v29 = *(void *)(v0 + 24);

  uint64_t v30 = *(void *)(v29 + 16);
  uint64_t v31 = *(void *)(v29 + 24);
  uint64_t v32 = *(void *)(v29 + 32);
  uint64_t v33 = *(void *)(v29 + 40);
  uint64_t v34 = *(void *)(v29 + 48);
  uint64_t v35 = *(void *)(v29 + 56);
  uint64_t v36 = *(void *)(v29 + 64);
  uint64_t v37 = *(void *)(v29 + 72);
  __int128 v38 = *(_OWORD *)(v29 + 80);
  uint64_t v39 = *(void *)(v29 + 96);
  *(_OWORD *)(v29 + 16) = 0u;
  *(_OWORD *)(v29 + 32) = 0u;
  *(_OWORD *)(v29 + 48) = 0u;
  *(_OWORD *)(v29 + 64) = 0u;
  *(_OWORD *)(v29 + 80) = 0u;
  *(void *)(v29 + 96) = 0LL;
  uint64_t v40 = sub_17078(v30, v31, v32, v33, v34, v35, v36, v37, v38, *((uint64_t *)&v38 + 1), v39);
  uint64_t v41 = *(void *)(v29 + 120);
  unint64_t v42 = *(void *)(v41 + 168);
  if (!v42)
  {
    os_log_type_t v66 = (os_log_s *)Logger.logObject.getter(v40);
    os_log_type_t v67 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v66, v67))
    {
LABEL_27:

      goto LABEL_28;
    }

    uint64_t v68 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v68 = 0;
    uint64_t v69 = "no invalid machineUtterance from server";
LABEL_26:
    _os_log_impl(&dword_0, v66, v67, v69, v68, 2u);
    swift_slowDealloc(v68, -1LL, -1LL);
    goto LABEL_27;
  }

  uint64_t v43 = *(void *)(v41 + 160);
  swift_bridgeObjectRetain(*(void *)(v41 + 168));
  sub_5884(v43, v42);
  uint64_t v44 = swift_bridgeObjectRelease(v42);
LABEL_28:
  static ExecuteResponse.complete()(v44);
  swift_task_dealloc(*(void *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_16B18()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 48LL));
  sub_170D4(v1);
  return swift_task_switch(sub_16B78, 0LL, 0LL);
}

uint64_t sub_16B78()
{
  uint64_t v1 = *(void **)(v0 + 40);
  static ExecuteResponse.complete()();

  swift_task_dealloc(*(void *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_16BB8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 64LL));
  sub_170D4(v1);
  return swift_task_switch(sub_16C18, 0LL, 0LL);
}

uint64_t sub_16C18()
{
  uint64_t v1 = *(void **)(v0 + 56);
  static ExecuteResponse.complete()();

  swift_task_dealloc(*(void *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_16C58(char a1)
{
  if (!a1) {
    return 0xD000000000000018LL;
  }
  if (a1 == 1) {
    return 0x6720656D75736572LL;
  }
  return 0xD000000000000013LL;
}

BOOL sub_16CBC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_16CD0()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_16D14()
{
}

Swift::Int sub_16D3C(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_16D7C()
{
  return sub_16C58(*v0);
}

uint64_t sub_16D84()
{
  return swift_deallocClassInstance(v0, 128LL, 7LL);
}

uint64_t type metadata accessor for EdutainmentGameFlow()
{
  return objc_opt_self(&OBJC_CLASS____TtC21EdutainmentFlowPlugin19EdutainmentGameFlow);
}

uint64_t storeEnumTagSinglePayload for EdutainmentGameFlow.State(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_16E48 + 4 * byte_1C3A5[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_16E7C + 4 * byte_1C3A0[v4]))();
}

uint64_t sub_16E7C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_16E84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x16E8CLL);
  }
  return result;
}

uint64_t sub_16E98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x16EA0LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_16EA4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_16EAC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EdutainmentGameFlow.State()
{
  return &type metadata for EdutainmentGameFlow.State;
}

unint64_t sub_16ECC()
{
  unint64_t result = qword_25BD0[0];
  if (!qword_25BD0[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_1C454, &type metadata for EdutainmentGameFlow.State);
    atomic_store(result, qword_25BD0);
  }

  return result;
}

uint64_t sub_16F10()
{
  return 1LL;
}

uint64_t sub_16F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for EdutainmentGameFlow();
  return Flow.deferToExecuteAsync(_:)(a1, a2, v7, a4);
}

uint64_t sub_16F70(uint64_t a1)
{
  int v3 = (void *)swift_task_alloc(dword_25AEC);
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = sub_87C4;
  return sub_16564(a1);
}

uint64_t sub_16FC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 16LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 24LL);
  uint64_t v4 = *(void *)(*(void *)v1 + 32LL);
  uint64_t v5 = *(void *)(*(void *)v1 + 40LL);
  uint64_t v6 = *(void *)(*(void *)v1 + 48LL);
  uint64_t v7 = *(void *)(*(void *)v1 + 56LL);
  uint64_t v8 = *(void *)(*(void *)v1 + 64LL);
  uint64_t v9 = *(void *)(*(void *)v1 + 72LL);
  uint64_t v10 = *(void *)(*(void *)v1 + 80LL);
  uint64_t v11 = *(void *)(*(void *)v1 + 88LL);
  uint64_t v12 = *(void *)(*(void *)v1 + 96LL);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  a1[7] = v9;
  a1[8] = v10;
  a1[9] = v11;
  a1[10] = v12;
  return sub_1701C(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_1701C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2)
  {
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    swift_bridgeObjectRetain(a5);
    swift_bridgeObjectRetain(a8);
    return swift_bridgeObjectRetain(a11);
  }

  return result;
}

uint64_t sub_17078( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a5);
    swift_bridgeObjectRelease(a8);
    return swift_bridgeObjectRelease(a11);
  }

  return result;
}

uint64_t sub_170D4(uint64_t a1)
{
  uint64_t v2 = sub_5BF4(&qword_254E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_17114(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EdutainmentGameFlow();
  uint64_t v5 = swift_allocObject(v4, 128LL, 7LL);
  *(_OWORD *)(v5 + 16) = 0u;
  *(_OWORD *)(v5 + 32) = 0u;
  *(_OWORD *)(v5 + 48) = 0u;
  *(_OWORD *)(v5 + 64) = 0u;
  *(_OWORD *)(v5 + 80) = 0u;
  *(void *)(v5 + 120) = a1;
  *(void *)(v5 + 96) = 0LL;
  *(void *)(v5 + 104) = a2;
  __asm { BR              X10 }

uint64_t sub_17180()
{
  char v1 = _stringCompareWithSmolCheck(_:_:expecting:)( 0x657461647075LL,  0xE600000000000000LL,  0xD000000000000013LL,  0x800000000001A510LL,  0LL);
  swift_bridgeObjectRelease(0xE600000000000000LL);
  if ((v1 & 1) != 0) {
    char v2 = 2;
  }
  else {
    char v2 = 1;
  }
  *(_BYTE *)(v0 + 112) = v2;
  return v0;
}

uint64_t sub_1722C()
{
  uint64_t v0 = type metadata accessor for EdutainmentStoreManager();
  swift_allocObject(v0, 32LL, 7LL);
  uint64_t result = sub_17264();
  qword_27F28 = result;
  return result;
}

uint64_t sub_17264()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_24FC8 != -1) {
    swift_once(&qword_24FC8, sub_E09C);
  }
  uint64_t v12 = type metadata accessor for Logger(0LL);
  uint64_t v13 = sub_5BDC(v12, (uint64_t)qword_27F10);
  uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_0, v14, v15, "init StoreManager", v16, 2u);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  if (qword_24FA8 != -1) {
    swift_once(&qword_24FA8, sub_BA2C);
  }
  uint64_t v17 = qword_27EE0;
  if (qword_27EE0)
  {
    *(void *)(v1 + 16) = qword_27EE0;
    unint64_t v31 = sub_185AC();
    uint64_t v18 = swift_retain_n(v17, 2LL);
    static DispatchQoS.unspecified.getter(v18);
    uint64_t v32 = &_swiftEmptyArrayStorage;
    uint64_t v19 = v6;
    uint64_t v20 = v1;
    uint64_t v21 = v3;
    uint64_t v22 = sub_4B5C( &qword_25CD8,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
    uint64_t v30 = v11;
    uint64_t v23 = v2;
    uint64_t v24 = sub_5BF4(&qword_25CE0);
    uint64_t v25 = sub_185E8(&qword_25CE8, &qword_25CE0);
    dispatch thunk of SetAlgebra.init<A>(_:)(&v32, v24, v25, v19, v22);
    (*(void (**)(char *, void, uint64_t))(v21 + 104))( v5,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v23);
    uint64_t v26 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000001DLL,  0x800000000001B0E0LL,  v30,  v8,  v5,  0LL);
    swift_release(v17);
    *(void *)(v20 + 24) = v26;
  }

  else
  {
    uint64_t v27 = type metadata accessor for EdutainmentStoreManager();
    swift_deallocPartialClassInstance(v1, v27, 32LL, 7LL);
    return 0LL;
  }

  return v20;
}

uint64_t sub_1754C(void *a1, uint64_t a2)
{
  uint64_t v3 = sub_5C34(a1, a1[3]);
  uint64_t v4 = *(void *)(a2 + 16);
  if (*(_BYTE *)(*v3 + 24LL) == 1 && (sub_120D8(v4) & 1) == 0) {
    return sub_11B84(v4);
  }
  else {
    return sub_1196C();
  }
}

uint64_t sub_175A4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_175D0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v6;
  uint64_t v13 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v29 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  os_log_type_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v27 = *(void *)(v16 - 8);
  uint64_t v28 = v16;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = v6[3];
  sub_17D84(a1, (uint64_t)v33);
  uint64_t v19 = swift_allocObject(&unk_21C90, 104LL, 7LL);
  sub_17E08((uint64_t)v33, v19 + 16);
  *(void *)(v19 + 56) = v6;
  *(void *)(v19 + 64) = a4;
  *(void *)(v19 + 72) = a5;
  *(void *)(v19 + 80) = a2;
  *(_BYTE *)(v19 + 88) = a3 & 1;
  *(void *)(v19 + 96) = v12;
  aBlock[4] = sub_17E50;
  uint64_t v32 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_175A4;
  aBlock[3] = &unk_21CA8;
  uint64_t v20 = _Block_copy(aBlock);
  swift_retain(v6);
  uint64_t v21 = swift_retain(a5);
  static DispatchQoS.unspecified.getter(v21);
  uint64_t v30 = &_swiftEmptyArrayStorage;
  uint64_t v22 = sub_4B5C( &qword_25680,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v23 = sub_5BF4(&qword_25688);
  uint64_t v24 = sub_185E8((unint64_t *)&qword_25690, &qword_25688);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v30, v23, v24, v13, v22);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v18, v15, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v13);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v18, v28);
  return swift_release(v32);
}

uint64_t sub_17804(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, int a6)
{
  int v50 = a6;
  uint64_t v51 = a5;
  uint64_t v53 = a4;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_24FC0 != -1) {
    swift_once(&qword_24FC0, sub_E038);
  }
  uint64_t v13 = sub_5BDC(v9, (uint64_t)qword_27EF8);
  uint64_t v14 = *(void (**)(char *))(v10 + 16);
  uint64_t v52 = v13;
  v14(v12);
  uint64_t v15 = sub_17D84(a1, (uint64_t)v59);
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v47 = a2;
    uint64_t v48 = a1;
    BOOL v49 = a3;
    uint64_t v18 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v19 = swift_slowAlloc(32LL, -1LL);
    uint64_t v58 = v19;
    *(_DWORD *)uint64_t v18 = 136315138;
    sub_17D84((uint64_t)v59, (uint64_t)&v54);
    uint64_t v20 = v56;
    if (v56)
    {
      uint64_t v21 = v57;
      sub_5C34(&v54, v56);
      uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v20, v21);
      unint64_t v24 = v23;
      sub_5C58(&v54);
    }

    else
    {
      sub_8894((uint64_t)&v54);
      unint64_t v24 = 0xE300000000000000LL;
      uint64_t v22 = 7104878LL;
    }

    uint64_t v54 = sub_17E80(v22, v24, &v58);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v18 + 4, v18 + 12);
    swift_bridgeObjectRelease(v24);
    sub_8894((uint64_t)v59);
    _os_log_impl(&dword_0, v16, v17, "read record for game= %s", v18, 0xCu);
    swift_arrayDestroy(v19, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1LL, -1LL);
    swift_slowDealloc(v18, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    a1 = v48;
    a3 = v49;
    a2 = v47;
  }

  else
  {
    sub_8894((uint64_t)v59);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  uint64_t v25 = *(void *)(a2 + 16);
  sub_17D84(a1, (uint64_t)v59);
  uint64_t v26 = v60;
  if (v60)
  {
    uint64_t v27 = v61;
    sub_5C34(v59, (uint64_t)v60);
    uint64_t v28 = (*(uint64_t (**)(void *, uint64_t))(v27 + 8))(v26, v27);
    uint64_t v26 = v29;
    sub_5C58(v59);
  }

  else
  {
    sub_8894((uint64_t)v59);
    uint64_t v28 = 0LL;
  }

  sub_17D84(a1, (uint64_t)v59);
  uint64_t v30 = (uint64_t)v60;
  if (v60)
  {
    uint64_t v31 = v61;
    sub_5C34(v59, (uint64_t)v60);
    uint64_t v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 16))(v30, v31);
    unint64_t v33 = v32;
    sub_5C58(v59);
  }

  else
  {
    sub_8894((uint64_t)v59);
    unint64_t v33 = 0LL;
  }

  uint64_t v34 = sub_125D8(v25, v28, v26, v30, v33);
  swift_bridgeObjectRelease(v33);
  uint64_t v35 = swift_bridgeObjectRelease(v26);
  if (v34)
  {
    if ((*(_BYTE *)(v34 + 152) & 1) != 0)
    {
      uint64_t v36 = (os_log_s *)Logger.logObject.getter(v35);
      os_log_type_t v37 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v36, v37))
      {
        __int128 v38 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)__int128 v38 = 0;
        uint64_t v39 = "Empty timestamp of game state.";
LABEL_28:
        _os_log_impl(&dword_0, v36, v37, v39, v38, 2u);
        swift_slowDealloc(v38, -1LL, -1LL);
        goto LABEL_29;
      }

      goto LABEL_29;
    }

    if ((v50 & 1) != 0) {
      uint64_t v44 = 86400LL;
    }
    else {
      uint64_t v44 = v51;
    }
    uint64_t v45 = sub_184C0(*(void *)(v34 + 144), v44);
    if ((v45 & 1) != 0)
    {
      uint64_t v36 = (os_log_s *)Logger.logObject.getter(v45);
      os_log_type_t v37 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v36, v37))
      {
        __int128 v38 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)__int128 v38 = 0;
        uint64_t v39 = "Drop game state because it's expired";
        goto LABEL_28;
      }

LABEL_29:
      a3(0LL);
      return swift_release(v34);
    }

    uint64_t v46 = swift_retain(v34);
    a3(v46);
    return swift_release_n(v34, 2LL);
  }

  else
  {
    uint64_t v40 = (os_log_s *)Logger.logObject.getter(v35);
    os_log_type_t v41 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v40, v41))
    {
      unint64_t v42 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v42 = 0;
      _os_log_impl(&dword_0, v40, v41, "Didn't find any record from database.", v42, 2u);
      swift_slowDealloc(v42, -1LL, -1LL);
    }

    return ((uint64_t (*)(void))a3)(0LL);
  }

uint64_t sub_17D04(void *a1, uint64_t a2)
{
  return sub_11DDC(*(void *)(a2 + 16));
}

uint64_t sub_17D38()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t type metadata accessor for EdutainmentStoreManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC21EdutainmentFlowPlugin23EdutainmentStoreManager);
}

uint64_t sub_17D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5BF4(&qword_25670);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_17DCC()
{
  if (v0[5]) {
    sub_5C58(v0 + 2);
  }
  swift_release(v0[7]);
  swift_release(v0[9]);
  return swift_deallocObject(v0, 104LL, 7LL);
}

uint64_t sub_17E08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5BF4(&qword_25670);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_17E50()
{
  return sub_17804( v0 + 16,  *(void *)(v0 + 56),  *(void (**)(void))(v0 + 64),  *(void *)(v0 + 72),  *(void *)(v0 + 80),  *(unsigned __int8 *)(v0 + 88));
}

uint64_t sub_17E68(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_17E78(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_17E80(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_17F50(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_DEB4((uint64_t)v12, *a3);
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
      sub_DEB4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_5C58(v12);
  return v7;
}

uint64_t sub_17F50(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_18108(a5, a6);
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

uint64_t sub_18108(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1819C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_18374(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_18374(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1819C(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_18310(v4, 0LL);
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

void *sub_18310(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_5BF4(&qword_25CC8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_18374(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_5BF4(&qword_25CC8);
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

uint64_t sub_184C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin();
  int64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = Date.init()(v6);
  double v10 = Date.timeIntervalSince1970.getter(v9);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  if ((~*(void *)&v10 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }

  if (v10 <= -9.22337204e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (v10 >= 9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

LABEL_9:
  __break(1u);
  return result;
}

unint64_t sub_185AC()
{
  unint64_t result = qword_25CD0;
  if (!qword_25CD0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_25CD0);
  }

  return result;
}

uint64_t sub_185E8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = sub_89D8(a2);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_18628(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_18660 + 4 * byte_1C520[a1]))( 0xD000000000000013LL,  0x800000000001A610LL);
}

uint64_t sub_18660()
{
  return 1701667182LL;
}

uint64_t sub_18670()
{
  return 0x79726F6765746163LL;
}

uint64_t sub_18688()
{
  return 0x6C6576656CLL;
}

uint64_t sub_1869C()
{
  return 0x6174537472617473LL;
}

uint64_t sub_186B8()
{
  return 0x65726F6373LL;
}

uint64_t sub_186CC()
{
  return 0x656C706D6F437369LL;
}

uint64_t sub_186EC()
{
  return 0x5464657461657263LL;
}

uint64_t sub_1870C()
{
  return 0x6E6F697461727564LL;
}

uint64_t sub_18724(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1875C + 4 * byte_1C529[a1]))( 0xD000000000000013LL,  0x800000000001A610LL);
}

uint64_t sub_1875C()
{
  return 1701667182LL;
}

uint64_t sub_1876C()
{
  return 0x79726F6765746163LL;
}

uint64_t sub_18784()
{
  return 0x6C6576656CLL;
}

uint64_t sub_18798()
{
  return 0x6174537472617473LL;
}

uint64_t sub_187B4()
{
  return 0x65726F6373LL;
}

uint64_t sub_187C8()
{
  return 0x656C706D6F437369LL;
}

uint64_t sub_187E8()
{
  return 0x5464657461657263LL;
}

uint64_t sub_18808()
{
  return 0x6E6F697461727564LL;
}

uint64_t sub_18820(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_5BF4(&qword_25D00);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_5C34(a1, v9);
  unint64_t v11 = sub_19208();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for GameHistory.CodingKeys,  &type metadata for GameHistory.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *(void *)(v3 + 16);
  uint64_t v13 = *(void *)(v3 + 24);
  char v38 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v38, v5);
  if (!v2)
  {
    uint64_t v14 = *(void *)(v3 + 32);
    uint64_t v15 = *(void *)(v3 + 40);
    char v37 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, &v37, v5);
    uint64_t v16 = *(void *)(v3 + 48);
    uint64_t v17 = *(void *)(v3 + 56);
    char v36 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v36, v5);
    uint64_t v18 = *(void *)(v3 + 64);
    uint64_t v19 = *(void *)(v3 + 72);
    char v35 = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v18, v19, &v35, v5);
    uint64_t v20 = *(void *)(v3 + 80);
    uint64_t v21 = *(unsigned __int8 *)(v3 + 88);
    char v34 = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v20, v21, &v34, v5);
    uint64_t v22 = *(void *)(v3 + 96);
    uint64_t v23 = *(unsigned __int8 *)(v3 + 104);
    char v33 = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v22, v23, &v33, v5);
    uint64_t v24 = *(unsigned __int8 *)(v3 + 105);
    char v32 = 6;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v24, &v32, v5);
    uint64_t v25 = *(void *)(v3 + 112);
    uint64_t v26 = *(unsigned __int8 *)(v3 + 120);
    char v31 = 7;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v25, v26, &v31, v5);
    uint64_t v27 = *(void *)(v3 + 128);
    uint64_t v28 = *(unsigned __int8 *)(v3 + 136);
    HIBYTE(v30) = 8;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v27, v28, (char *)&v30 + 7, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_18A5C(char *a1)
{
}

Swift::Int sub_18A68()
{
  char v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  sub_F19C((uint64_t)v3, v1);
  return Hasher._finalize()();
}

void sub_18AAC(uint64_t a1)
{
}

Swift::Int sub_18AB4(uint64_t a1)
{
  char v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  sub_F19C((uint64_t)v4, v2);
  return Hasher._finalize()();
}

unint64_t sub_18AF4@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_18C30(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_18B20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_18628(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_18B48()
{
  return sub_18724(*v0);
}

unint64_t sub_18B50@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_18C30(a1);
  *a2 = result;
  return result;
}

uint64_t sub_18B74(uint64_t a1)
{
  unint64_t v2 = sub_19208();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_18B9C(uint64_t a1)
{
  unint64_t v2 = sub_19208();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_18BC4@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v9[0];
    *(_OWORD *)(a2 + 96) = v8[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 121) = *(_OWORD *)((char *)v9 + 9);
    __int128 v6 = v8[3];
    *(_OWORD *)(a2 + 32) = v8[2];
    *(_OWORD *)(a2 + 48) = v6;
    __int128 v7 = v8[5];
    *(_OWORD *)(a2 + 64) = v8[4];
    *(_OWORD *)(a2 + 80) = v7;
    __n128 result = (__n128)v8[1];
    *(_OWORD *)a2 = v8[0];
    *(__n128 *)(a2 + 16) = result;
  }

  return result;
}

uint64_t sub_18C1C(void *a1)
{
  return sub_18820(a1);
}

unint64_t sub_18C30(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_20E88, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 9) {
    return 9LL;
  }
  else {
    return v3;
  }
}

void *sub_18C78@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v104 = sub_5BF4(&qword_25CF0);
  uint64_t v5 = *(void *)(v104 - 8);
  __chkstk_darwin(v104);
  __int128 v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v103 = 1;
  char v101 = 1;
  char v99 = 1;
  char v96 = 1;
  char v94 = 1;
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_5C34(a1, v8);
  unint64_t v10 = sub_19208();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for GameHistory.CodingKeys,  &type metadata for GameHistory.CodingKeys,  v10,  v8,  v9);
  if (v2)
  {
    sub_5C58(a1);
    return (void *)swift_bridgeObjectRelease(0LL);
  }

  else
  {
    unint64_t v11 = a1;
    uint64_t v12 = v5;
    uint64_t v60 = a2;
    LOBYTE(v69) = 0;
    uint64_t v13 = v104;
    uint64_t v14 = KeyedDecodingContainer.decode(_:forKey:)(&v69, v104);
    uint64_t v16 = v15;
    uint64_t v58 = v14;
    LOBYTE(v69) = 1;
    swift_bridgeObjectRetain(v15);
    uint64_t v17 = KeyedDecodingContainer.decode(_:forKey:)(&v69, v13);
    uint64_t v59 = v18;
    uint64_t v55 = v17;
    LOBYTE(v69) = 2;
    swift_bridgeObjectRetain(v18);
    uint64_t v57 = 0LL;
    uint64_t v19 = KeyedDecodingContainer.decode(_:forKey:)(&v69, v13);
    uint64_t v20 = v11;
    uint64_t v54 = v19;
    LOBYTE(v69) = 3;
    uint64_t v22 = v21;
    swift_bridgeObjectRetain(v21);
    uint64_t v23 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v69, v104);
    uint64_t v56 = v22;
    uint64_t v25 = v24;
    uint64_t v53 = v23;
    LOBYTE(v69) = 4;
    swift_bridgeObjectRetain(v24);
    uint64_t v52 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v69, v104);
    char v101 = v26 & 1;
    LOBYTE(v69) = 5;
    LODWORD(v22) = v26;
    uint64_t v27 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v69, v104);
    int v50 = v22;
    uint64_t v51 = v27;
    char v99 = v28 & 1;
    LOBYTE(v69) = 6;
    LODWORD(v22) = v28;
    int v29 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v69, v104);
    int v48 = v22;
    int v49 = v29;
    LOBYTE(v69) = 7;
    uint64_t v47 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v69, v104);
    int v45 = v30 & 1;
    char v96 = v30 & 1;
    char v93 = 8;
    uint64_t v46 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v93, v104);
    char v32 = v31;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v104);
    char v33 = v32 & 1;
    char v94 = v32 & 1;
    *(void *)&__int128 v61 = 0LL;
    BYTE8(v61) = 1;
    uint64_t v34 = v59;
    *(void *)&__int128 v62 = v58;
    *((void *)&v62 + 1) = v16;
    uint64_t v35 = v54;
    uint64_t v36 = v55;
    *(void *)&__int128 v63 = v55;
    *((void *)&v63 + 1) = v59;
    uint64_t v37 = v56;
    *(void *)&__int128 v64 = v54;
    *((void *)&v64 + 1) = v56;
    *(void *)&__int128 v65 = v53;
    *((void *)&v65 + 1) = v25;
    *(void *)&__int128 v66 = v52;
    BYTE8(v66) = v50 & 1;
    *(void *)&__int128 v67 = v51;
    BYTE8(v67) = v48 & 1;
    BYTE9(v67) = v49;
    *(void *)&v68[0] = v47;
    BYTE8(v68[0]) = v45;
    *(void *)&v68[1] = v46;
    BYTE8(v68[1]) = v33;
    sub_1924C(&v61);
    swift_bridgeObjectRelease(v16);
    swift_bridgeObjectRelease(v34);
    swift_bridgeObjectRelease(v37);
    swift_bridgeObjectRelease(v25);
    sub_5C58(v20);
    uint64_t v69 = 0LL;
    char v70 = v103;
    *(_DWORD *)id v71 = *(_DWORD *)v102;
    *(_DWORD *)&v71[3] = *(_DWORD *)&v102[3];
    uint64_t v72 = v58;
    uint64_t v73 = v16;
    uint64_t v74 = v36;
    uint64_t v75 = v34;
    uint64_t v76 = v35;
    uint64_t v77 = v37;
    uint64_t v78 = v53;
    uint64_t v79 = v25;
    uint64_t v80 = v52;
    char v81 = v101;
    *(_DWORD *)&v82[3] = *(_DWORD *)&v100[3];
    *(_DWORD *)uint64_t v82 = *(_DWORD *)v100;
    uint64_t v83 = v51;
    char v84 = v99;
    char v85 = v49;
    int v86 = v97;
    __int16 v87 = v98;
    uint64_t v88 = v47;
    char v89 = v96;
    *(_DWORD *)uint64_t v90 = *(_DWORD *)v95;
    *(_DWORD *)&v90[3] = *(_DWORD *)&v95[3];
    uint64_t v91 = v46;
    char v92 = v94;
    __n128 result = sub_192A0(&v69);
    __int128 v39 = v68[0];
    uint64_t v40 = v60;
    v60[6] = v67;
    v40[7] = v39;
    *(_OWORD *)((char *)v40 + 121) = *(_OWORD *)((char *)v68 + 9);
    __int128 v41 = v64;
    v40[2] = v63;
    v40[3] = v41;
    __int128 v42 = v66;
    v40[4] = v65;
    v40[5] = v42;
    __int128 v43 = v62;
    *uint64_t v40 = v61;
    v40[1] = v43;
  }

  return result;
}

unint64_t sub_19208()
{
  unint64_t result = qword_25CF8;
  if (!qword_25CF8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C6B4, &type metadata for GameHistory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25CF8);
  }

  return result;
}

void *sub_1924C(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[7];
  swift_bridgeObjectRetain(a1[9]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

void *sub_192A0(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[9];
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t storeEnumTagSinglePayload for GameHistory.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF7) {
    return ((uint64_t (*)(void))((char *)&loc_19340 + 4 * byte_1C537[v4]))();
  }
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_19374 + 4 * byte_1C532[v4]))();
}

uint64_t sub_19374(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1937C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x19384LL);
  }
  return result;
}

uint64_t sub_19390(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x19398LL);
  }
  *(_BYTE *)unint64_t result = a2 + 8;
  return result;
}

uint64_t sub_1939C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_193A4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GameHistory.CodingKeys()
{
  return &type metadata for GameHistory.CodingKeys;
}

uint64_t destroy for GameHistory(void *a1)
{
  return swift_bridgeObjectRelease(a1[9]);
}

uint64_t initializeWithCopy for GameHistory(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  return a1;
}

uint64_t assignWithCopy for GameHistory(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 16) = a2[2];
  uint64_t v5 = a2[3];
  uint64_t v6 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRelease(v6);
  *(void *)(a1 + 32) = a2[4];
  uint64_t v7 = a2[5];
  uint64_t v8 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8);
  *(void *)(a1 + 48) = a2[6];
  uint64_t v9 = a2[7];
  uint64_t v10 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v10);
  *(void *)(a1 + 64) = a2[8];
  uint64_t v11 = a2[9];
  uint64_t v12 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = a2[10];
  *(_BYTE *)(a1 + 88) = *((_BYTE *)a2 + 88);
  *(void *)(a1 + 80) = v13;
  uint64_t v14 = a2[12];
  *(_BYTE *)(a1 + 104) = *((_BYTE *)a2 + 104);
  *(void *)(a1 + 96) = v14;
  *(_BYTE *)(a1 + 105) = *((_BYTE *)a2 + 105);
  uint64_t v15 = a2[14];
  *(_BYTE *)(a1 + 120) = *((_BYTE *)a2 + 120);
  *(void *)(a1 + 112) = v15;
  uint64_t v16 = a2[16];
  *(_BYTE *)(a1 + 136) = *((_BYTE *)a2 + 136);
  *(void *)(a1 + 128) = v16;
  return a1;
}

__n128 initializeWithTake for GameHistory(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __int128 v2 = *(_OWORD *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  __int128 v6 = *(_OWORD *)(a2 + 96);
  __int128 v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 121) = *(_OWORD *)(a2 + 121);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for GameHistory(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v9 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(void *)(a2 + 72);
  uint64_t v11 = *(void *)(a1 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v10;
  swift_bridgeObjectRelease(v11);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for GameHistory(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 137)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GameHistory(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 136) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 137) = 1;
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

    *(_BYTE *)(result + 137) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for GameHistory()
{
  return &type metadata for GameHistory;
}

unint64_t sub_19758()
{
  unint64_t result = qword_25D08;
  if (!qword_25D08)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C68C, &type metadata for GameHistory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25D08);
  }

  return result;
}

unint64_t sub_197A0()
{
  unint64_t result = qword_25D10;
  if (!qword_25D10)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C5C4, &type metadata for GameHistory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25D10);
  }

  return result;
}

unint64_t sub_197E8()
{
  unint64_t result = qword_25D18;
  if (!qword_25D18)
  {
    unint64_t result = swift_getWitnessTable(&unk_1C5EC, &type metadata for GameHistory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25D18);
  }

  return result;
}

uint64_t sub_1982C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for EdutainmentFlowPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC21EdutainmentFlowPlugin21EdutainmentFlowPlugin);
}

uint64_t sub_1985C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for EdutainmentFlowPlugin();
  uint64_t result = swift_allocObject(v2, 16LL, 7LL);
  *a1 = result;
  return result;
}

uint64_t sub_198A0()
{
  uint64_t v0 = static Device.current.getter(v9);
  static OutputPublisherFactory.makeOutputPublisherAsync()(v8, v0);
  uint64_t v1 = type metadata accessor for EdutainmentOutput();
  uint64_t v2 = swift_allocObject(v1, 96LL, 7LL);
  sub_8950(v9, v2 + 16);
  sub_8950(v8, v2 + 56);
  uint64_t v3 = type metadata accessor for EdutainmentDispatchFlow();
  uint64_t v4 = swift_allocObject(v3, 136LL, 7LL);
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(void *)(v4 + 80) = 0LL;
  sub_8950(v10, v4 + 96);
  *(void *)(v4 + 88) = v2;
  *(void *)&v10[0] = v4;
  unint64_t v5 = sub_19974();
  uint64_t v6 = Flow.eraseToAnyFlow()(v3, v5);
  swift_release(v4);
  return v6;
}

unint64_t sub_19974()
{
  unint64_t result = qword_25DC0;
  if (!qword_25DC0)
  {
    uint64_t v1 = type metadata accessor for EdutainmentDispatchFlow();
    unint64_t result = swift_getWitnessTable(&unk_1B610, v1);
    atomic_store(result, (unint64_t *)&qword_25DC0);
  }

  return result;
}
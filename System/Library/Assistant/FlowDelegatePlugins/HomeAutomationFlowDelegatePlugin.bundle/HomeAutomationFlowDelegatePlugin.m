uint64_t HomeAutomationFlowDelegatePlugin.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  v1 = sub_39B8(v0, 16LL);
  HomeAutomationFlowDelegatePlugin.init()();
  return v1;
}

uint64_t HomeAutomationFlowDelegatePlugin.init()()
{
  uint64_t v1 = v0;
  type metadata accessor for CATExecutor(0LL);
  uint64_t v2 = static Log.subsystem.getter();
  uint64_t v4 = v3;
  uint64_t v5 = type metadata accessor for HomeAutomationCATs(0LL);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v5);
  id v7 = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  id v8 = [v7 bundlePath];

  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  uint64_t v11 = v10;

  swift_bridgeObjectRetain(v11);
  v12._countAndFlagsBits = 0x74616C706D65542FLL;
  v12._object = (void *)0xEA00000000007365LL;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(v11);
  static CATExecutor.registerBundle(bundleId:templateDir:)(v2, v4, v9, v11);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v11);
  return v1;
}

uint64_t HomeAutomationFlowDelegatePlugin.findFlowForX(parse:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Parse(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  sub_3970();
  type metadata accessor for DispatchTimeInterval(0LL);
  __chkstk_darwin();
  sub_3960();
  uint64_t v7 = v6 - v5;
  static LocationService.defaultTimeout.getter();
  v11[3] = type metadata accessor for LocationService(0LL);
  v11[4] = &protocol witness table for LocationService;
  sub_31CC(v11);
  LocationService.init(timeout:)(v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, a1, v3);
  uint64_t v8 = type metadata accessor for FlowProvider(0LL);
  swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  uint64_t v9 = FlowProvider.init(locationService:parse:)(v11, v1);
  dispatch thunk of FlowProvider.findFlow()();
  return swift_release(v9);
}

void *sub_31CC(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

Swift::Void __swiftcall HomeAutomationFlowDelegatePlugin.warmup(refId:)(Swift::String refId)
{
  object = refId._object;
  uint64_t countAndFlagsBits = refId._countAndFlagsBits;
  uint64_t v4 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  sub_3988();
  uint64_t v6 = sub_39CC();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  sub_39A0();
  uint64_t v8 = sub_39B8((uint64_t)&unk_42F8, 17LL);
  *(_BYTE *)(v8 + 16) = 0;
  static Log.warmUp.getter();
  _StringGuts.grow(_:)(52LL);
  v9._object = (void *)0x8000000000003D40LL;
  v9._uint64_t countAndFlagsBits = 0xD000000000000032LL;
  String.append(_:)(v9);
  v10._uint64_t countAndFlagsBits = countAndFlagsBits;
  v10._object = object;
  String.append(_:)(v10);
  v11._uint64_t countAndFlagsBits = 0LL;
  v12._uint64_t countAndFlagsBits = 0xD000000000000080LL;
  v12._object = (void *)0x8000000000003D80LL;
  v11._object = (void *)0xE000000000000000LL;
  Logger.notice(output:addToSummary:test:caller:)(v11, 0, 0, v12);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v6);
  uint64_t v13 = sub_3528(&qword_80A0);
  uint64_t v14 = sub_39B8(v13, 48LL);
  *(_OWORD *)(v14 + 16) = xmmword_3C50;
  *(void *)(v14 + 32) = sub_3820;
  *(void *)(v14 + 40) = v8;
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))( v1,  enum case for DispatchQoS.QoSClass.userInteractive(_:),  v4);
  swift_retain_n(v8, 2LL);
  parallelize(qos:tasks:completion:)(v1, v14, sub_3520, v8);
  swift_release(v8);
  swift_bridgeObjectRelease(v14);
  sub_39C0(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  swift_release(v8);
  sub_3948();
}

uint64_t sub_33C8()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_33D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_39CC() - 8);
  __chkstk_darwin();
  sub_3988();
  static Log.warmUp.getter();
  v10[0] = 0LL;
  v10[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(62LL);
  v11._uint64_t countAndFlagsBits = 0LL;
  v11._object = (void *)0xE000000000000000LL;
  v3._object = (void *)0x8000000000003E80LL;
  v3._uint64_t countAndFlagsBits = 0xD00000000000003ALL;
  String.append(_:)(v3);
  swift_beginAccess(a1 + 16, v10, 0LL, 0LL);
  if (*(_BYTE *)(a1 + 16)) {
    uint64_t v4 = 0x73736563637573LL;
  }
  else {
    uint64_t v4 = 0x6572756C696166LL;
  }
  unint64_t v5 = 0xE700000000000000LL;
  String.append(_:)(*(Swift::String *)&v4);
  swift_bridgeObjectRelease(0xE700000000000000LL);
  v6._uint64_t countAndFlagsBits = 32010LL;
  v6._object = (void *)0xE200000000000000LL;
  String.append(_:)(v6);
  object = v11._object;
  v8._uint64_t countAndFlagsBits = 0xD000000000000080LL;
  v8._object = (void *)0x8000000000003D80LL;
  Logger.notice(output:addToSummary:test:caller:)(v11, 0, 0, v8);
  swift_bridgeObjectRelease(object);
  return sub_39C0(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
}

uint64_t sub_3520()
{
  return sub_33D8(v0);
}

uint64_t sub_3528(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void sub_3568(void (**a1)(uint64_t), uint64_t a2)
{
  uint64_t v8 = v7 - v6;
  uint64_t v9 = type metadata accessor for AFAnalyticsEvent(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  sub_39A0();
  uint64_t v11 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v38 = *(void *)(v11 - 8);
  uint64_t v39 = v11;
  __chkstk_darwin();
  sub_3960();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_39CC();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin();
  sub_3970();
  v37 = *a1;
  static Log.warmUp.getter();
  v17._uint64_t countAndFlagsBits = 0xD000000000000080LL;
  v18._object = (void *)0x8000000000003E60LL;
  v17._object = (void *)0x8000000000003D80LL;
  v18._uint64_t countAndFlagsBits = 0xD000000000000014LL;
  Logger.notice(output:addToSummary:test:caller:)(v18, 0, 0, v17);
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v2, v15);
  v20 = (void *)static Log.OSLogs.warmUp.getter(v19);
  uint64_t v21 = static Signpost.Name.homeKitWarmUp.getter();
  static Signpost.begin(logging:_:)(v20, v21, v22, v23);

  (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))( v3,  enum case for AFAnalyticsEvent.homeKitWarmUpStart(_:),  v9);
  static Log.AFAnalytics(event:with:)(v3, 0LL);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v3, v9);
  type metadata accessor for HomeStore(0LL);

  uint64_t v24 = swift_beginAccess(a2 + 16, v40, 1LL, 0LL);
  *(_BYTE *)(a2 + 16) = 1;
  v25 = (void *)static Log.OSLogs.warmUp.getter(v24);
  uint64_t v26 = static Signpost.Name.homeKitWarmUp.getter();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  char v36 = 1;
  char v35 = 2;
  char v34 = 0;
  char v33 = 1;
  Signpost.Context.init(numberOfTargetedEntities:serviceTypes:targetedContainer:handleDelegateName:responseHandler:entitiesInitialized:homeStoreLoadSucceeded:intentHandlerName:useCase:retrievedEntitiesFromHomeStoreCache:intentSelectionStep:numberOfInitialCandidates:)( 0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v33,  1LL,  v34,  0LL,  0LL,  0LL,  0LL,  v35,  0LL,  0LL,  0LL,  v36);
  uint64_t v31 = type metadata accessor for Signpost.Context(0LL);
  sub_38FC(v8, 0LL, 1LL, v31);
  static Signpost.end(logging:_:_:_:)(v25, v14, v26, v28, v30, v8);

  uint64_t v32 = sub_3908(v8);
  v37(v32);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v14, v39);
  sub_3948();
}

void sub_3820(void (**a1)(uint64_t))
{
}

uint64_t HomeAutomationFlowDelegatePlugin.deinit()
{
  return v0;
}

uint64_t HomeAutomationFlowDelegatePlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

unint64_t sub_3844()
{
  unint64_t result = qword_80A8;
  if (!qword_80A8)
  {
    uint64_t v1 = type metadata accessor for HomeAutomationFlowDelegatePlugin();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for HomeAutomationFlowDelegatePlugin, v1);
    atomic_store(result, (unint64_t *)&qword_80A8);
  }

  return result;
}

uint64_t type metadata accessor for HomeAutomationFlowDelegatePlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC32HomeAutomationFlowDelegatePlugin32HomeAutomationFlowDelegatePlugin);
}

uint64_t sub_38A0(uint64_t a1)
{
  return HomeAutomationFlowDelegatePlugin.findFlowForX(parse:)(a1);
}

uint64_t sub_38B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HomeAutomationFlowDelegatePlugin.__allocating_init()();
  *a1 = result;
  return result;
}

void sub_38DC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_38FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_3908(uint64_t a1)
{
  uint64_t v2 = sub_3528(&qword_8158);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_39B8(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

uint64_t sub_39C0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_39CC()
{
  return type metadata accessor for Logger(0LL);
}
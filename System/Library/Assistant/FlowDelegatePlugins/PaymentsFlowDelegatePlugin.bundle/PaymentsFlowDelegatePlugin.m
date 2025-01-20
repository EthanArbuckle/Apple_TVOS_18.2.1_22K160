void PaymentsFlowDelegatePlugin.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_log_s *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  void v20[5];
  v1 = OUTLINED_FUNCTION_9();
  v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  OUTLINED_FUNCTION_5();
  v4 = Logger.payments.unsafeMutableAddressor(v3);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v4, v1);
  v6 = (os_log_s *)Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)OUTLINED_FUNCTION_1();
    *(_WORD *)v8 = 0;
    OUTLINED_FUNCTION_2(&dword_0, v6, v7, "PaymentsFlowDelegatePlugin is being initialized", v8);
    OUTLINED_FUNCTION_0((uint64_t)v8);
  }

  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  static Device.current.getter(v20, v9);
  outlined init with copy of FlowProviding((uint64_t)v20, (uint64_t)&v17);
  v15 = (void *)type metadata accessor for SiriKitContactResolver(0LL);
  v16 = &protocol witness table for SiriKitContactResolver;
  __swift_allocate_boxed_opaque_existential_1(&v14);
  SiriKitContactResolver.init()();
  v10 = type metadata accessor for FlowFactory(0LL);
  OUTLINED_FUNCTION_11(v10);
  v11 = FlowFactory.init(deviceState:contactResolver:)(&v17, &v14);
  SiriPaymentsFeatureManager.init()();
  __swift_destroy_boxed_opaque_existential_1(v20);
  v18 = v10;
  v19 = &protocol witness table for FlowFactory;
  *(void *)&v17 = v11;
  v15 = &type metadata for SiriPaymentsFeatureManager;
  v16 = &protocol witness table for SiriPaymentsFeatureManager;
  v12 = type metadata accessor for PaymentsFlowDelegatePlugin();
  v13 = OUTLINED_FUNCTION_11(v12);
  outlined init with take of SiriPaymentsFeatureManaging(&v17, v13 + 16);
  outlined init with take of SiriPaymentsFeatureManaging(&v14, v13 + 56);
  OUTLINED_FUNCTION_8();
}

uint64_t PaymentsFlowDelegatePlugin.findFlowForX(parse:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v4 = v3;
  uint64_t v39 = a1;
  uint64_t v41 = a2;
  OUTLINED_FUNCTION_9();
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v38 = (uint64_t)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v5);
  v9 = (char *)&v37 - v8;
  __chkstk_darwin(v7);
  v11 = (char *)&v37 - v10;
  uint64_t v12 = type metadata accessor for Signpost.OpenSignpost(0LL);
  __chkstk_darwin(v12);
  OUTLINED_FUNCTION_6();
  SignpostName.findFlowForX.unsafeMutableAddressor();
  uint64_t v40 = v2;
  uint64_t v13 = OUTLINED_FUNCTION_10();
  Logger.payments.unsafeMutableAddressor(v13);
  uint64_t v14 = OUTLINED_FUNCTION_3((uint64_t)v11);
  v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)OUTLINED_FUNCTION_1();
    *(_WORD *)v17 = 0;
    OUTLINED_FUNCTION_2(&dword_0, v15, v16, "#PaymentsFlowDelegatePlugin.findFlowForX(): attempting to make flow", v17);
    OUTLINED_FUNCTION_0((uint64_t)v17);
  }

  OUTLINED_FUNCTION_12((uint64_t)v11);
  uint64_t v18 = v4[10];
  uint64_t v19 = v4[11];
  __swift_project_boxed_opaque_existential_1(v4 + 7, v18);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v18, v19) & 1) != 0)
  {
    uint64_t v20 = OUTLINED_FUNCTION_3((uint64_t)v9);
    v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.debug.getter();
    if (OUTLINED_FUNCTION_4(v22))
    {
      v23 = (uint8_t *)OUTLINED_FUNCTION_1();
      *(_WORD *)v23 = 0;
      OUTLINED_FUNCTION_2( &dword_0,  v21,  (os_log_type_t)v18,  "#PaymentsFlowDelegatePlugin.findFlowForX(): SiriPayments/NLX=1, converting parse to build flow",  v23);
      OUTLINED_FUNCTION_0((uint64_t)v23);
    }

    OUTLINED_FUNCTION_12((uint64_t)v9);
    Swift::Bool Party = Parse.isFirstPartyApp()();
    static PaymentsFlowDelegatePlugin.preWarmExtensionWithIntentSignal(isFirstParty:)(Party);
    outlined init with copy of FlowProviding((uint64_t)(v4 + 2), (uint64_t)v42);
    uint64_t v25 = type metadata accessor for PaymentsFlow(0LL);
    swift_allocObject(v25, *(unsigned int *)(v25 + 48), *(unsigned __int16 *)(v25 + 52));
    uint64_t v26 = PaymentsFlow.init(flowFactory:)(v42);
    v42[0] = v26;
    uint64_t v27 = lazy protocol witness table accessor for type PaymentsFlowDelegatePlugin and conformance PaymentsFlowDelegatePlugin( &lazy protocol witness table cache variable for type PaymentsFlow and conformance PaymentsFlow,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for PaymentsFlow,  (uint64_t)&protocol conformance descriptor for PaymentsFlow);
    uint64_t v28 = Flow.eraseToAnyFlow()(v25, v27);
    swift_release(v26);
    static FlowSearchResult.flow(_:)(v28);
    swift_release(v28);
  }

  else
  {
    uint64_t v29 = v38;
    uint64_t v30 = OUTLINED_FUNCTION_3(v38);
    v31 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v32 = static os_log_type_t.debug.getter();
    if (OUTLINED_FUNCTION_4(v32))
    {
      v33 = (uint8_t *)OUTLINED_FUNCTION_1();
      *(_WORD *)v33 = 0;
      OUTLINED_FUNCTION_2( &dword_0,  v31,  (os_log_type_t)v18,  "#PaymentsFlowDelegatePlugin.findFlowForX(): SiriPayments/NLX=0, returning noFlow",  v33);
      OUTLINED_FUNCTION_0((uint64_t)v33);
    }

    uint64_t v34 = OUTLINED_FUNCTION_12(v29);
    static FlowSearchResult.noFlow.getter(v34);
  }

  uint64_t v35 = v40;
  Signpost.OpenSignpost.end()();
  return outlined destroy of Signpost.OpenSignpost(v35);
}

uint64_t static PaymentsFlowDelegatePlugin.preWarmExtensionWithIntentSignal(isFirstParty:)(char a1)
{
  uint64_t v4 = OUTLINED_FUNCTION_9();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  OUTLINED_FUNCTION_5();
  type metadata accessor for Signpost.OpenSignpost(0LL);
  __chkstk_darwin();
  OUTLINED_FUNCTION_6();
  SignpostName.emitIntentSignal.unsafeMutableAddressor();
  uint64_t v6 = OUTLINED_FUNCTION_10();
  if ((a1 & 1) != 0)
  {
    uint64_t v7 = Logger.payments.unsafeMutableAddressor(v6);
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v2, v7, v4);
    v9 = (os_log_s *)Logger.logObject.getter(v8);
    os_log_type_t v10 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_1();
      *(_WORD *)v11 = 0;
      OUTLINED_FUNCTION_2( &dword_0,  v9,  v10,  "#PaymentsFlowDelegatePlugin sending IntentSignal to pre-warm Wallet intent extension",  v11);
      OUTLINED_FUNCTION_0((uint64_t)v11);
    }

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
    id v12 = [objc_allocWithZone(SAIntentGroupIntentSignal) init];
    id v13 = [objc_allocWithZone(INSendPaymentIntent) init];
    uint64_t v14 = static AppUtil.PASSBOOK_APP_BUNDLE_ID.getter();
    outlined bridged method (mbnn) of @objc SAIntentGroupProtobufMessage.typeName.setter( v14,  v15,  v13,  (SEL *)&selRef__setLaunchId_);
    id v16 = v13;
    uint64_t v17 = AppUtil.PASSBOOK_EXTENSION_BUNDLE_ID.unsafeMutableAddressor();
    uint64_t v18 = swift_bridgeObjectRetain(*(void *)(v17 + 8));
    OUTLINED_FUNCTION_7(v18, v19, v20, (SEL *)&selRef__setExtensionBundleId_);

    type metadata accessor for SAIntentGroupProtobufMessage();
    id v21 = v16;
    SAIntentGroupProtobufMessage.init(intent:)(v21);
    v23 = v22;
    [v12 setIntent:v22];

    static AceService.currentAsync.getter(v27);
    uint64_t v24 = v28;
    uint64_t v25 = v29;
    __swift_project_boxed_opaque_existential_1(v27, v28);
    AceServiceInvokerAsync.submitAndForget(_:)(v12, v24, v25);

    __swift_destroy_boxed_opaque_existential_1(v27);
  }

  Signpost.OpenSignpost.end()();
  return outlined destroy of Signpost.OpenSignpost(v1);
}

void SAIntentGroupProtobufMessage.init(intent:)(void *a1)
{
  id v3 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v1)) init];
  uint64_t v4 = outlined bridged method (ob) of @objc PBCodable.data.getter([a1 backingStore]);
  if (v5 >> 60 == 15)
  {
    Class isa = 0LL;
  }

  else
  {
    uint64_t v7 = v4;
    unint64_t v8 = v5;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(v7, v8);
  }

  [v3 setData:isa];

  id v9 = [a1 typeName];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  OUTLINED_FUNCTION_7(v10, v11, v12, (SEL *)&selRef_setTypeName_);
  OUTLINED_FUNCTION_8();
}

uint64_t PaymentsFlowDelegatePlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 96LL, 7LL);
}

uint64_t type metadata accessor for PaymentsFlowDelegatePlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC26PaymentsFlowDelegatePlugin26PaymentsFlowDelegatePlugin);
}

uint64_t protocol witness for FlowPluginExtended.findFlowForX(parse:) in conformance PaymentsFlowDelegatePlugin@<X0>( uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PaymentsFlowDelegatePlugin.findFlowForX(parse:)(a1, a2);
}

void protocol witness for FlowPlugin.init() in conformance PaymentsFlowDelegatePlugin(void *a1@<X8>)
{
  *a1 = v2;
}

uint64_t base witness table accessor for FlowPlugin in PaymentsFlowDelegatePlugin(uint64_t a1, uint64_t a2)
{
  return lazy protocol witness table accessor for type PaymentsFlowDelegatePlugin and conformance PaymentsFlowDelegatePlugin( &lazy protocol witness table cache variable for type PaymentsFlowDelegatePlugin and conformance PaymentsFlowDelegatePlugin,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for PaymentsFlowDelegatePlugin,  (uint64_t)&protocol conformance descriptor for PaymentsFlowDelegatePlugin);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t outlined destroy of Signpost.OpenSignpost(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Signpost.OpenSignpost(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t lazy protocol witness table accessor for type PaymentsFlowDelegatePlugin and conformance PaymentsFlowDelegatePlugin( unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
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

uint64_t outlined bridged method (ob) of @objc PBCodable.data.getter(void *a1)
{
  id v2 = [a1 data];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

void outlined bridged method (mbnn) of @objc SAIntentGroupProtobufMessage.typeName.setter( uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  objc_msgSend(a3, *a4, v7);
}

unint64_t type metadata accessor for SAIntentGroupProtobufMessage()
{
  unint64_t result = lazy cache variable for type metadata for SAIntentGroupProtobufMessage;
  if (!lazy cache variable for type metadata for SAIntentGroupProtobufMessage)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___SAIntentGroupProtobufMessage);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SAIntentGroupProtobufMessage);
  }

  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t outlined consume of Data?(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(result, a2);
  }
  return result;
}

uint64_t outlined consume of Data._Representation(uint64_t result, unint64_t a2)
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

uint64_t outlined init with copy of FlowProviding(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_allocate_boxed_opaque_existential_1(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t outlined init with take of SiriPaymentsFeatureManaging(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_slowAlloc(2LL, -1LL);
}

void OUTLINED_FUNCTION_2(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1)
{
  return v2(a1, v3, v1);
}

BOOL OUTLINED_FUNCTION_4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_7(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
}

  ;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return type metadata accessor for Logger(0LL);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return static Signpost.begin(_:)(v0);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1)
{
  return swift_allocObject(a1, 96LL, 7LL);
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1)
{
  return v2(a1, v1);
}
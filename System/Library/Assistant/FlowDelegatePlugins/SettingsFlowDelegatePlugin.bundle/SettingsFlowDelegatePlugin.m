void sub_54D0()
{
  sub_6BBC(0LL, &qword_C488, &OBJC_CLASS___OS_os_log_ptr);
  qword_C4A0 = OS_os_log.init(subsystem:category:)( 0xD000000000000017LL,  0x8000000000007760LL,  0xD00000000000001ALL,  0x8000000000007200LL);
  OUTLINED_FUNCTION_16();
}

uint64_t sub_5540()
{
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t sub_5550(uint64_t a1)
{
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  uint64_t v3 = Flow.eraseToAnyFlow()(v1, v2);
  __swift_destroy_boxed_opaque_existential_1(v5);
  return v3;
}

uint64_t sub_55AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SettingsFlowDelegatePlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v2);
  id v4 = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  static CATExecutor.registerBundle(bundle:templateDir:)();

  if (_MergedGlobals != -1) {
    swift_once(&_MergedGlobals, sub_54D0);
  }
  ((void (*)(void))static os_log_type_t.debug.getter)();
  OUTLINED_FUNCTION_0((uint64_t)"SettingsFlowDelegatePlugin | FindFlowForX.", 42LL, v5, (uint64_t)&dword_0);
  sub_57EC(a1, v26);
  OUTLINED_FUNCTION_22(v6, v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_C498);
  uint64_t v9 = type metadata accessor for NoOpFlow();
  if (swift_dynamicCast(&v24, v25, v8, v9, 6LL))
  {
    uint64_t v10 = swift_release(v24);
    static os_log_type_t.debug.getter(v10);
    uint64_t v12 = OUTLINED_FUNCTION_0( (uint64_t)"SettingsFlowDelegatePlugin | FindFlowForX returning .noFlow",  59LL,  v11,  (uint64_t)&dword_0);
    static FlowSearchResult.noFlow.getter(v12);
  }

  else
  {
    uint64_t v13 = qword_C4A0;
    uint64_t v14 = ((uint64_t (*)(void))static os_log_type_t.debug.getter)();
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_C470);
    uint64_t v16 = OUTLINED_FUNCTION_2(v15);
    *(_OWORD *)(v16 + 16) = xmmword_7210;
    OUTLINED_FUNCTION_22(v16, v17);
    uint64_t v18 = String.init<A>(describing:)(v25, v8);
    uint64_t v20 = v19;
    *(void *)(v16 + 56) = &type metadata for String;
    *(void *)(v16 + 64) = sub_6A20();
    *(void *)(v16 + 32) = v18;
    *(void *)(v16 + 40) = v20;
    os_log(_:dso:log:type:_:)( "SettingsFlowDelegatePlugin | FindFlowForX returning %@.",  55LL,  2LL,  &dword_0,  v13,  v14,  v16);
    swift_bridgeObjectRelease(v16);
    uint64_t v21 = v27;
    uint64_t v22 = v28;
    __swift_project_boxed_opaque_existential_1(v26, v27);
    Flow.eraseToAnyFlow()(v21, v22);
    static FlowSearchResult.flow(_:)();
    OUTLINED_FUNCTION_10();
  }

  return __swift_destroy_boxed_opaque_existential_1(v26);
}

void sub_57EC(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = type metadata accessor for ControlsFlowProvider(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  OUTLINED_FUNCTION_7();
  uint64_t v7 = v6 - v5;
  uint64_t v61 = type metadata accessor for Parse(0LL);
  __chkstk_darwin();
  OUTLINED_FUNCTION_7();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for SupportedFlowDomain(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  OUTLINED_FUNCTION_7();
  uint64_t v15 = v14 - v13;
  type metadata accessor for SupportedFlowDomainProvider(0LL);
  static SupportedFlowDomainProvider.shared.getter();
  dispatch thunk of SupportedFlowDomainProvider.getSupportedFlowDomain(parse:)(a1);
  OUTLINED_FUNCTION_10();
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 88))(v15, v11);
  if ((_DWORD)v16 == enum case for SupportedFlowDomain.invalidParse(_:))
  {
    if (_MergedGlobals != -1) {
      uint64_t v16 = swift_once(&_MergedGlobals, sub_54D0);
    }
    static os_log_type_t.error.getter(v16);
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_C470);
    *(_OWORD *)(OUTLINED_FUNCTION_2(v17) + 16) = xmmword_7210;
    OUTLINED_FUNCTION_18();
    String.init<A>(describing:)(v10, v61);
    OUTLINED_FUNCTION_21();
    unint64_t v18 = OUTLINED_FUNCTION_12((uint64_t)&type metadata for String);
    OUTLINED_FUNCTION_23(v18);
    OUTLINED_FUNCTION_4((uint64_t)"Given parse cannot be handled by this domain: %@.", 49LL, v19, (uint64_t)&dword_0);
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_18();
    uint64_t v20 = v10;
    uint64_t v21 = v61;
    goto LABEL_5;
  }

  if ((_DWORD)v16 == enum case for SupportedFlowDomain.playbackControls(_:))
  {
    ControlsFlowProvider.init()();
    uint64_t v27 = ControlsFlowProvider.makeFlow(for:)(a1);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
    if (v27)
    {
      if (_MergedGlobals != -1) {
        swift_once(&_MergedGlobals, sub_54D0);
      }
      uint64_t v28 = qword_C4A0;
      uint64_t v29 = static os_log_type_t.debug.getter();
      os_log(_:dso:log:type:_:)( "Received playback controls frame, returning.",  44LL,  2LL,  &dword_0,  v28,  v29,  &_swiftEmptyArrayStorage);
      a2[3] = type metadata accessor for AnyFlow(0LL);
      a2[4] = (uint64_t)&protocol witness table for AnyFlow;
      *a2 = v27;
      goto LABEL_29;
    }

    if (_MergedGlobals != -1) {
      swift_once(&_MergedGlobals, sub_54D0);
    }
    static os_log_type_t.debug.getter();
    OUTLINED_FUNCTION_0( (uint64_t)"Unable to determine suitable PlaybackControls flow. Returning nil.",  66LL,  v37,  (uint64_t)&dword_0);
    uint64_t v38 = type metadata accessor for NoOpFlow();
    v39 = type metadata accessor for NoOpFlow;
    uint64_t v40 = OUTLINED_FUNCTION_3(v38, 32LL);
    *(void *)(v40 + 16) = 0xD000000000000044LL;
    *(void *)(v40 + 24) = 0x80000000000079A0LL;
    goto LABEL_27;
  }

  if ((_DWORD)v16 == enum case for SupportedFlowDomain.settings(_:))
  {
    sub_6008(a1);
    if (_MergedGlobals != -1) {
      swift_once(&_MergedGlobals, sub_54D0);
    }
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_0((uint64_t)"Attempting to get a settings flow.", 34LL, v30, (uint64_t)&dword_0);
    type metadata accessor for FlowProvider(0LL);
    static FlowProvider.shared.getter();
    dispatch thunk of FlowProvider.getFlowForParse(parse:)(&v63, a1);
    OUTLINED_FUNCTION_10();
    if (v64)
    {
LABEL_15:
      sub_6C70(&v63, (uint64_t)v65);
      sub_6C70(v65, (uint64_t)a2);
      goto LABEL_29;
    }

    uint64_t v50 = sub_6BF4((uint64_t)&v63);
    static os_log_type_t.error.getter(v50);
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_C470);
    v52 = (__n128 *)OUTLINED_FUNCTION_2(v51);
    OUTLINED_FUNCTION_1(v52, (__n128)xmmword_7210);
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_21();
    unint64_t v53 = OUTLINED_FUNCTION_12((uint64_t)&type metadata for String);
    OUTLINED_FUNCTION_23(v53);
    v35 = "FlowProvider failed to get settings flow for this parse: %@.";
    uint64_t v36 = 60LL;
    goto LABEL_31;
  }

  if ((_DWORD)v16 == enum case for SupportedFlowDomain.invalidDomainIdentifier(_:))
  {
    if (_MergedGlobals != -1) {
      uint64_t v16 = swift_once(&_MergedGlobals, sub_54D0);
    }
    static os_log_type_t.error.getter(v16);
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_C470);
    v32 = (__n128 *)OUTLINED_FUNCTION_2(v31);
    OUTLINED_FUNCTION_1(v32, (__n128)xmmword_7210);
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_21();
    unint64_t v33 = OUTLINED_FUNCTION_12((uint64_t)&type metadata for String);
    OUTLINED_FUNCTION_23(v33);
    v35 = "Given intent's domain name is unexpected: %@.";
    uint64_t v36 = 45LL;
LABEL_31:
    OUTLINED_FUNCTION_4((uint64_t)v35, v36, v34, (uint64_t)&dword_0);
    OUTLINED_FUNCTION_17();
    ((void (*)(uint64_t, uint64_t, uint64_t))v4)(v10, a1, a1);
    uint64_t v20 = v10;
    uint64_t v21 = a1;
LABEL_5:
    uint64_t v22 = String.init<A>(describing:)(v20, v21);
    uint64_t v24 = v23;
    uint64_t v25 = type metadata accessor for NoOpFlow();
    uint64_t v26 = OUTLINED_FUNCTION_3(v25, 32LL);
    *(void *)(v26 + 16) = v22;
    *(void *)(v26 + 24) = v24;
    a2[3] = v25;
    a2[4] = sub_6C34(&qword_C6C0, type metadata accessor for NoOpFlow, (uint64_t)&unk_72CC);
    *a2 = v26;
LABEL_29:
    OUTLINED_FUNCTION_8();
    return;
  }

  if ((_DWORD)v16 == enum case for SupportedFlowDomain.unsupportedSiriX(_:))
  {
    if (_MergedGlobals != -1) {
      uint64_t v16 = swift_once(&_MergedGlobals, sub_54D0);
    }
    static os_log_type_t.error.getter(v16);
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_C470);
    uint64_t v42 = OUTLINED_FUNCTION_2(v41);
    *(_OWORD *)(v42 + 16) = xmmword_7210;
    OUTLINED_FUNCTION_9();
    uint64_t v43 = String.init<A>(describing:)(v10, v4);
    uint64_t v45 = v44;
    *(void *)(v42 + 64) = OUTLINED_FUNCTION_12((uint64_t)&type metadata for String);
    *(void *)(v42 + 32) = v43;
    *(void *)(v42 + 40) = v45;
    OUTLINED_FUNCTION_4( (uint64_t)"Given parse cannot be handled because Siri X flag is not enabled: %@.",  69LL,  v46,  (uint64_t)&dword_0);
    OUTLINED_FUNCTION_17();
    uint64_t v38 = type metadata accessor for NoOpFlow();
    v39 = type metadata accessor for NoOpFlow;
    uint64_t v40 = OUTLINED_FUNCTION_3(v38, 32LL);
    *(void *)(v40 + 16) = 0xD000000000000024LL;
    *(void *)(v40 + 24) = 0x8000000000007840LL;
LABEL_27:
    v47 = a2;
    a2[3] = v38;
    v48 = &qword_C6C0;
    v49 = &unk_72CC;
LABEL_28:
    v47[4] = sub_6C34(v48, v39, (uint64_t)v49);
    uint64_t *v47 = v40;
    goto LABEL_29;
  }

  if ((_DWORD)v16 == enum case for SupportedFlowDomain.clarityUIEnabled(_:))
  {
    if (_MergedGlobals != -1) {
      swift_once(&_MergedGlobals, sub_54D0);
    }
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_0((uint64_t)"Attempting to get a ClarityUI flow.", 35LL, v54, (uint64_t)&dword_0);
    type metadata accessor for FlowProvider(0LL);
    static FlowProvider.shared.getter();
    dispatch thunk of FlowProvider.getFlowForClarityUI()(&v63);
    OUTLINED_FUNCTION_10();
    if (v64) {
      goto LABEL_15;
    }
    uint64_t v55 = sub_6BF4((uint64_t)&v63);
    static os_log_type_t.error.getter(v55);
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_C470);
    v57 = (__n128 *)OUTLINED_FUNCTION_2(v56);
    OUTLINED_FUNCTION_1(v57, (__n128)xmmword_7210);
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_21();
    unint64_t v58 = OUTLINED_FUNCTION_12((uint64_t)&type metadata for String);
    OUTLINED_FUNCTION_23(v58);
    v35 = "FlowProvider failed to get ClarityUI flow for this parse: %@.";
    uint64_t v36 = 61LL;
    goto LABEL_31;
  }

  if ((_DWORD)v16 == enum case for SupportedFlowDomain.deviceExpertTellMeGenerated(_:))
  {
    OUTLINED_FUNCTION_9();
    uint64_t v20 = v10;
    uint64_t v21 = v4;
    goto LABEL_5;
  }

  if ((_DWORD)v16 == enum case for SupportedFlowDomain.deviceExpertSetting(_:))
  {
    if (_MergedGlobals != -1) {
      swift_once(&_MergedGlobals, sub_54D0);
    }
    static os_log_type_t.debug.getter();
    OUTLINED_FUNCTION_0((uint64_t)"Received device expert setting frame, returning.", 48LL, v59, (uint64_t)&dword_0);
    uint64_t v60 = type metadata accessor for IntelligenceFlow();
    v39 = type metadata accessor for IntelligenceFlow;
    uint64_t v40 = OUTLINED_FUNCTION_3(v60, 16LL);
    v47 = a2;
    a2[3] = v60;
    v48 = (unint64_t *)&unk_C6B8;
    v49 = &unk_7274;
    goto LABEL_28;
  }

  _diagnoseUnexpectedEnumCase<A>(type:)(v11, v11);
  __break(1u);
}

void sub_6008(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Parse(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  OUTLINED_FUNCTION_7();
  uint64_t v6 = v5 - v4;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v5 - v4, a1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 88))(v6, v2) != enum case for Parse.uso(_:))
  {
    if (_MergedGlobals != -1) {
      swift_once(&_MergedGlobals, sub_54D0);
    }
    static os_log_type_t.debug.getter();
    uint64_t v30 = "SettingsFlowDelegatePlugin NOT sending IntentSignal to pre-warm first party extension because it's not an NLV4 intent.";
    goto LABEL_18;
  }

  if (_MergedGlobals != -1) {
    swift_once(&_MergedGlobals, sub_54D0);
  }
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0((uint64_t)"Got .uso intent.", 16LL, v7, (uint64_t)&dword_0);
  type metadata accessor for SiriEnvironment(0LL);
  if (!static SiriEnvironment.forCurrentTask.getter()
    || (uint64_t v8 = SiriEnvironment.currentRequest.getter(),
        uint64_t v9 = OUTLINED_FUNCTION_10(),
        uint64_t v10 = CurrentRequest.resultCandidateId.getter(v9),
        uint64_t v12 = v11,
        swift_release(v8),
        !v12))
  {
    OUTLINED_FUNCTION_19();
    uint64_t v30 = "SettingsFlowDelegatePlugin NOT sending IntentSignal to pre-warm first party extension because resultCandidateId is nil";
LABEL_18:
    OUTLINED_FUNCTION_0((uint64_t)v30, 118LL, v29, (uint64_t)&dword_0);
    goto LABEL_19;
  }

  BOOL v13 = v10 == 48 && v12 == 0xE100000000000000LL;
  if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(v10, v12, 48LL, 0xE100000000000000LL, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(v12);
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_0( (uint64_t)"SettingsFlowDelegatePlugin sending IntentSignal to pre-warm first party extension",  81LL,  v14,  (uint64_t)&dword_0);
    id v15 = [objc_allocWithZone(SAIntentGroupIntentSignal) init];
    sub_6BBC(0LL, &qword_C480, &OBJC_CLASS___INSetBinarySettingIntent_ptr);
    id v16 = sub_6400(0LL, 0LL, 0LL);
    sub_6AC8(0xD00000000000003ALL, 0x8000000000007720LL, v16, (SEL *)&selRef__setExtensionBundleId_);
    id v17 = [objc_allocWithZone(SAIntentGroupProtobufMessage) init];
    uint64_t v18 = sub_6A5C([v16 backingStore]);
    Class isa = 0LL;
    if (v19 >> 60 != 15)
    {
      uint64_t v21 = v18;
      unint64_t v22 = v19;
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      sub_6B64(v21, v22);
    }

    [v17 setData:isa];

    id v23 = [v16 typeName];
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v26 = v25;

    sub_6AC8(v24, v26, v17, (SEL *)&selRef_setTypeName_);
    static AceService.current.getter(v35, [v15 setIntent:v17]);
    uint64_t v27 = v36;
    uint64_t v28 = v37;
    __swift_project_boxed_opaque_existential_1(v35, v36);
    dispatch thunk of AceServiceInvoker.submitAndForget(_:)(v15, v27, v28);

    __swift_destroy_boxed_opaque_existential_1(v35);
  }

  else
  {
    uint64_t v31 = qword_C4A0;
    uint64_t v32 = static os_log_type_t.debug.getter();
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_C470);
    uint64_t v34 = OUTLINED_FUNCTION_2(v33);
    *(_OWORD *)(v34 + 16) = xmmword_7210;
    *(void *)(v34 + 56) = &type metadata for String;
    *(void *)(v34 + 64) = sub_6A20();
    *(void *)(v34 + 32) = v10;
    *(void *)(v34 + 40) = v12;
    os_log(_:dso:log:type:_:)( "SettingsFlowDelegatePlugin NOT sending IntentSignal to pre-warm first party extension because resultCandidateId is not 0: %@",  124LL,  2LL,  &dword_0,  v31,  v32,  v34);
    OUTLINED_FUNCTION_17();
  }

LABEL_19:
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  OUTLINED_FUNCTION_8();
}

id sub_6400(void *a1, uint64_t a2, void *a3)
{
  id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3)) initWithSettingMetadata:a1 binaryValue:a2 temporalEventTrigger:a3];

  return v6;
}

uint64_t sub_6460()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for SettingsFlowDelegatePlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC26SettingsFlowDelegatePlugin26SettingsFlowDelegatePlugin);
}

void sub_6490(uint64_t a1)
{
}

void sub_64AC(uint64_t *a1@<X8>)
{
  *a1 = sub_5540();
  OUTLINED_FUNCTION_16();
}

uint64_t sub_64D8(uint64_t a1)
{
  return sub_5550(a1);
}

uint64_t sub_64FC()
{
  return 0LL;
}

void sub_6504()
{
  v1._object = (void *)0x80000000000074E0LL;
  v1._countAndFlagsBits = 0xD000000000000034LL;
  String.append(_:)(v1);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain(v2);
  v4._countAndFlagsBits = v3;
  v4._object = v2;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(v2);
  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0LL,  0xE000000000000000LL,  "SettingsFlowDelegatePlugin/SettingsFlowDelegatePlugin.swift",  59LL,  2LL,  163LL,  0);
  __break(1u);
}

uint64_t sub_65B4()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t type metadata accessor for NoOpFlow()
{
  return objc_opt_self(&OBJC_CLASS____TtC26SettingsFlowDelegatePluginP33_78101825AF663525EA54C1C34E6D56048NoOpFlow);
}

uint64_t sub_65F8()
{
  Swift::String v1 = (void *)swift_task_alloc(async function pointer to Flow.onAsync(input:)[1]);
  *(void *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_14(v1, (uint64_t)sub_6CCC);
  return OUTLINED_FUNCTION_6();
}

void sub_663C()
{
}

uint64_t sub_6650()
{
  Swift::String v4 = (void *)swift_task_alloc(async function pointer to Flow.execute()[1]);
  *(void *)(v2 + 16) = v4;
  *Swift::String v4 = v2;
  v4[1] = sub_6CD0;
  return Flow.execute()(v3, v1, v0);
}

uint64_t sub_66B4()
{
  return OUTLINED_FUNCTION_11();
}

uint64_t sub_66D8()
{
  return 1LL;
}

uint64_t sub_66E0(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = type metadata accessor for FlowUnhandledReason(0LL);
  v1[3] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_6740, 0LL, 0LL);
}

uint64_t sub_6740()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = type metadata accessor for PrescribedTool(0LL);
  __swift_storeEnumTagSinglePayload(v1, 1LL, 1LL, v4);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))( v1,  enum case for FlowUnhandledReason.needsIntelligenceFlowFallback(_:),  v3);
  static ExecuteResponse.unhandled(reason:)(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_67D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IntelligenceFlow();
  uint64_t v5 = sub_6C34(&qword_C6B8, type metadata accessor for IntelligenceFlow, (uint64_t)&unk_7274);
  return Flow.deferToExecuteAsync(_:)(a1, a2, v4, v5);
}

uint64_t type metadata accessor for IntelligenceFlow()
{
  return objc_opt_self(&OBJC_CLASS____TtC26SettingsFlowDelegatePluginP33_78101825AF663525EA54C1C34E6D560416IntelligenceFlow);
}

uint64_t sub_6864()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to Flow.onAsync(input:)[1]);
  *(void *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_14(v1, (uint64_t)sub_68A8);
  return OUTLINED_FUNCTION_6();
}

uint64_t sub_68A8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

void sub_68DC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_68F8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_C3BC);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_6948;
  return sub_66E0(a1);
}

uint64_t sub_6948()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_6974()
{
  return OUTLINED_FUNCTION_11();
}

unint64_t sub_6998()
{
  unint64_t result = qword_C468;
  if (!qword_C468)
  {
    uint64_t v1 = type metadata accessor for SettingsFlowDelegatePlugin();
    unint64_t result = swift_getWitnessTable(&unk_7324, v1);
    atomic_store(result, (unint64_t *)&qword_C468);
  }

  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_6A20()
{
  unint64_t result = qword_C478;
  if (!qword_C478)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_C478);
  }

  return result;
}

uint64_t sub_6A5C(void *a1)
{
  id v2 = [a1 data];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

void sub_6AC8(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  objc_msgSend(a3, *a4, v7);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
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

uint64_t sub_6B64(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_6B78(result, a2);
  }
  return result;
}

uint64_t sub_6B78(uint64_t result, unint64_t a2)
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

uint64_t sub_6BBC(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_6BF4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_C490);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_6C34(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2();
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_6C70(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_6C88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return os_log(_:dso:log:type:_:)(a1, a2, 2LL, a4, v4);
}

uint64_t OUTLINED_FUNCTION_1(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(v4 - 184) + 16LL))( v3,  v2,  *(void *)(v4 - 176));
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1)
{
  return swift_allocObject(a1, 72LL, 7LL);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return os_log(_:dso:log:type:_:)(a1, a2, 2LL, a4, v4);
}

uint64_t OUTLINED_FUNCTION_5()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return ((uint64_t (*)(void))Flow.onAsync(input:))();
}

  ;
}

  ;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(v2 - 184) + 16LL))( v1,  v0,  *(void *)(v2 - 176));
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_release(v0);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return ((uint64_t (*)(void))Flow<>.exitValue.getter)();
}

unint64_t OUTLINED_FUNCTION_12@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 + 56) = a1;
  return sub_6A20();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return String.init<A>(describing:)(v1, v0);
}

uint64_t OUTLINED_FUNCTION_14@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = v2;
  a1[1] = a2;
  return v3;
}

  ;
}

  ;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0(v3, v1, v2);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return static os_log_type_t.debug.getter();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return static os_log_type_t.debug.getter();
}

  ;
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  return sub_6C88((uint64_t)va1, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_23(uint64_t result)
{
  v1[8] = result;
  v1[4] = v2;
  v1[5] = v3;
  return result;
}
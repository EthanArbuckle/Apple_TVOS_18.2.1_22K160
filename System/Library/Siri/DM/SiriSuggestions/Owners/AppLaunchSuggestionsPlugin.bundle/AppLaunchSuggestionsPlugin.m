ValueMetadata *type metadata accessor for LaunchAppActionProvider()
{
  return &type metadata for LaunchAppActionProvider;
}

unint64_t sub_2284@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  sub_25E0(a1, v3);
  uint64_t v5 = dispatch thunk of DialogProperties.getParameters()(v3, v4);
  sub_2538(7368801LL, 0xE300000000000000LL, v5, &v26);
  swift_bridgeObjectRelease(v5);
  if (v27)
  {
    uint64_t v6 = sub_2644(qword_C318);
    if (swift_dynamicCast(&v24, &v26, (char *)&type metadata for Any + 8, v6, 6LL))
    {
      uint64_t v7 = v24;
      goto LABEL_6;
    }
  }

  else
  {
    sub_2604((uint64_t)&v26);
  }

  uint64_t v7 = 0LL;
LABEL_6:
  uint64_t v8 = sub_2644(&qword_C2E8);
  uint64_t inited = swift_initStackObject(v8, v25);
  *(_OWORD *)(inited + 16) = xmmword_6C00;
  strcpy((char *)(inited + 32), "appIdentifier");
  *(_WORD *)(inited + 46) = -4864;
  uint64_t v10 = sub_2644(&qword_C2F0);
  *(void *)(inited + 72) = v10;
  uint64_t v11 = sub_26C8( &qword_C2F8,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> A?);
  *(void *)(inited + 80) = v11;
  uint64_t v12 = sub_26C8( &qword_C300,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> A?);
  *(void *)(inited + 88) = v12;
  if (v7)
  {
    swift_bridgeObjectRetain(v7);
    uint64_t v13 = sub_2588(0x6449707061LL, 0xE500000000000000LL, v7);
    uint64_t v15 = v14;
    swift_bridgeObjectRelease(v7);
    *(void *)(inited + 48) = v13;
    *(void *)(inited + 56) = v15;
  }

  else
  {
    *(void *)(inited + 48) = 0LL;
    *(void *)(inited + 56) = 0LL;
  }

  *(void *)(inited + 96) = 0x656D614E707061LL;
  *(void *)(inited + 104) = 0xE700000000000000LL;
  *(void *)(inited + 136) = v10;
  *(void *)(inited + 144) = v11;
  *(void *)(inited + 152) = v12;
  if (v7)
  {
    uint64_t v16 = sub_2588(0x656D614E707061LL, 0xE700000000000000LL, v7);
    uint64_t v18 = v17;
    swift_bridgeObjectRelease(v7);
    *(void *)(inited + 112) = v16;
    *(void *)(inited + 120) = v18;
  }

  else
  {
    *(void *)(inited + 112) = 0LL;
    *(void *)(inited + 120) = 0LL;
  }

  uint64_t v19 = sub_2644(&qword_C308);
  uint64_t v20 = Dictionary.init(dictionaryLiteral:)(inited, &type metadata for String, v19, &protocol witness table for String);
  uint64_t v21 = type metadata accessor for DirectInvocationAction(0LL);
  swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
  uint64_t v22 = DirectInvocationAction.init(siriKitIdentifier:payload:suggestionId:)( 0xD000000000000022LL,  0x80000000000073C0LL,  v20,  0xD00000000000002ELL,  0x80000000000073F0LL);
  a2[3] = v21;
  unint64_t result = sub_2728();
  a2[4] = result;
  *a2 = v22;
  return result;
}

double sub_2538@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_57E0(a1, a2), (v7 & 1) != 0))
  {
    sub_2768(*(void *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }

  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }

  return result;
}

uint64_t sub_2588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0LL;
  }
  unint64_t v4 = sub_57E0(a1, a2);
  if ((v5 & 1) == 0) {
    return 0LL;
  }
  unint64_t v6 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v4);
  uint64_t v7 = *v6;
  swift_bridgeObjectRetain(v6[1]);
  return v7;
}

void *sub_25E0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_2604(uint64_t a1)
{
  uint64_t v2 = sub_2644(&qword_C2E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_2644(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_2684(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_26C8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_2684(&qword_C2F0);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_2728()
{
  unint64_t result = qword_C310;
  if (!qword_C310)
  {
    uint64_t v1 = type metadata accessor for DirectInvocationAction(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DirectInvocationAction, v1);
    atomic_store(result, (unint64_t *)&qword_C310);
  }

  return result;
}

uint64_t sub_2768(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for RelevantAppConfigurator(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for RelevantAppConfigurator(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *assignWithCopy for RelevantAppConfigurator(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v3);
  return a1;
}

__n128 initializeWithTake for RelevantAppConfigurator(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for RelevantAppConfigurator(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for RelevantAppConfigurator(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RelevantAppConfigurator(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
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

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for RelevantAppConfigurator()
{
  return &type metadata for RelevantAppConfigurator;
}

uint64_t sub_28E0(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  uint64_t v3 = type metadata accessor for EnvironmentAwareSignal(0LL);
  v2[6] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[7] = v4;
  v2[8] = sub_2E10(v4);
  uint64_t v5 = type metadata accessor for Logger(0LL);
  v2[9] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[10] = v6;
  v2[11] = sub_2E10(v6);
  return swift_task_switch(sub_2950, 0LL, 0LL);
}

uint64_t sub_2950()
{
  if (qword_C2A0 != -1) {
    swift_once(&qword_C2A0, sub_3788);
  }
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v4 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[5];
  uint64_t v8 = sub_2D94(v3, (uint64_t)qword_CD30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v8, v3);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v14 = v0[10];
  uint64_t v13 = v0[11];
  uint64_t v15 = v0[9];
  if (v12)
  {
    uint64_t v38 = v0[11];
    uint64_t v35 = v0[7];
    uint64_t v37 = v0[10];
    uint64_t v16 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v17 = swift_slowAlloc(32LL, -1LL);
    uint64_t v39 = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v36 = v15;
    uint64_t v18 = EnvironmentAwareSignal.activeSignal.getter();
    v0[2] = v18;
    uint64_t v19 = type metadata accessor for Signal(0LL);
    unint64_t v20 = sub_2DAC();
    uint64_t v21 = dispatch thunk of CustomStringConvertible.description.getter(v19, v20);
    unint64_t v23 = v22;
    swift_release(v18);
    v0[3] = sub_5028(v21, v23, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 3, v0 + 4, v16 + 4, v16 + 12);
    swift_bridgeObjectRelease(v23);
    sub_2E2C(v35);
    _os_log_impl(&dword_0, v10, v11, "Updating context with signal: %s", v16, 0xCu);
    swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
    sub_2E20(v17);
    sub_2E20((uint64_t)v16);

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v36);
  }

  else
  {
    sub_2E2C(v0[7]);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }

  uint64_t v24 = (uint64_t *)v0[4];
  uint64_t v25 = *v24;
  v0[12] = *v24;
  uint64_t v26 = v24[1];
  v0[13] = v26;
  uint64_t ObjectType = swift_getObjectType(v25);
  v0[14] = ObjectType;
  uint64_t v28 = EnvironmentAwareSignal.activeSignal.getter();
  uint64_t v29 = Signal.signalValue.getter();
  uint64_t v31 = v30;
  swift_release(v28);
  v0[15] = v29;
  v0[16] = v31;
  uint64_t v32 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v26 + 8) + 8LL));
  return swift_task_switch(sub_2BEC, v32, v33);
}

uint64_t sub_2BEC()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 64);
  sub_2E38(*(void *)(v0 + 120), v1, *(void *)(v0 + 112), *(void *)(v0 + 104));
  swift_bridgeObjectRelease(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2C4C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t sub_2C78(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_C334);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2CCC;
  return sub_28E0(a1, a2);
}

uint64_t sub_2CCC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to CandidateSuggestionConfigurator.isValid(signal:)[1]);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2D60;
  return CandidateSuggestionConfigurator.isValid(signal:)(a1, a2, a3);
}

uint64_t sub_2D60(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

uint64_t sub_2D94(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_2DAC()
{
  unint64_t result = qword_C338;
  if (!qword_C338)
  {
    uint64_t v1 = type metadata accessor for Signal(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Signal, v1);
    atomic_store(result, (unint64_t *)&qword_C338);
  }

  return result;
}

uint64_t sub_2DF0()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_2E10@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_2E20(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_2E2C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_2E38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_C2A8 != -1) {
    swift_once(&qword_C2A8, sub_3848);
  }
  uint64_t v8 = qword_CD48;
  v14[3] = type metadata accessor for DomainOwner(0LL);
  v14[4] = &protocol witness table for DomainOwner;
  v14[0] = v8;
  uint64_t v9 = qword_C2D0;
  swift_retain(v8);
  if (v9 != -1) {
    swift_once(&qword_C2D0, sub_6558);
  }
  uint64_t v10 = qword_CD80;
  uint64_t v11 = *(void *)algn_CD88;
  v13[3] = &type metadata for String;
  v13[0] = a1;
  v13[1] = a2;
  swift_bridgeObjectRetain(a2);
  Context.setParam(for:key:value:)(v14, v10, v11, v13, a3, a4);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v13);
  return _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v14);
}

uint64_t sub_2F48(uint64_t a1, uint64_t a2)
{
  if (qword_C2A8 != -1) {
    swift_once(&qword_C2A8, sub_3848);
  }
  uint64_t v4 = qword_CD48;
  v7[3] = type metadata accessor for DomainOwner(0LL);
  v7[4] = &protocol witness table for DomainOwner;
  v7[0] = v4;
  uint64_t v5 = qword_C2D0;
  swift_retain(v4);
  if (v5 != -1) {
    swift_once(&qword_C2D0, sub_6558);
  }
  Context.getParam(for:key:)(v8, v7, qword_CD80, *(void *)algn_CD88, a1, a2);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v7);
  if (v8[3])
  {
    else {
      return 0LL;
    }
  }

  else
  {
    sub_2604((uint64_t)v8);
    return 0LL;
  }
}

uint64_t _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_3090()
{
  id v1 = [(id)objc_opt_self(AFPreferences) sharedPreferences];
  uint64_t v2 = sub_3184(v1);
  if (v3)
  {
    uint64_t v4 = v2;
    uint64_t v5 = v3;
    uint64_t v6 = sub_2644(&qword_C340);
    uint64_t v7 = swift_allocObject(v6, 48LL, 7LL);
    *(_OWORD *)(v7 + 16) = xmmword_6CF0;
    *(void *)(v7 + 32) = v4;
    *(void *)(v7 + 40) = v5;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7);
    id v9 = [v0 localizedNameWithPreferredLocalizations:isa];
  }

  else
  {
    id v9 = [v0 localizedName];
  }

  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);

  return v10;
}

uint64_t sub_3184(void *a1)
{
  id v2 = [a1 languageCode];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

void *sub_31F0(uint64_t a1)
{
  v1[2] = 0x746E657571657266LL;
  v1[3] = 0xEB00000000707041LL;
  v1[4] = a1;
  uint64_t v2 = *(void *)InstalledAppProvider.shared.unsafeMutableAddressor();
  v1[8] = type metadata accessor for InstalledAppProvider(0LL);
  v1[9] = &protocol witness table for InstalledAppProvider;
  v1[5] = v2;
  swift_retain(v2);
  return v1;
}

void *sub_3258()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_3264()
{
  return swift_deallocClassInstance(v0, 80LL, 7LL);
}

uint64_t type metadata accessor for FrequentAppResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC26AppLaunchSuggestionsPlugin19FrequentAppResolver);
}

uint64_t sub_32B0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16LL);
  swift_bridgeObjectRetain(*(void *)(*(void *)v0 + 24LL));
  return v1;
}

uint64_t sub_32E0()
{
  return sub_337C(*(uint64_t (**)(uint64_t))(v0 + 8), v0, (uint64_t)&_swiftEmptyArrayStorage);
}

uint64_t sub_32F8()
{
  return sub_3340((unint64_t *)&unk_C3F8, (uint64_t)&unk_6D54);
}

uint64_t sub_331C()
{
  return sub_3340(&qword_C408, (uint64_t)&unk_6D7C);
}

uint64_t sub_3340(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for FrequentAppResolver();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_337C(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

void *sub_338C(uint64_t a1)
{
  v1[2] = 0x746E6176656C6572LL;
  v1[3] = 0xEB00000000707041LL;
  v1[4] = a1;
  uint64_t v2 = *(void *)InstalledAppProvider.shared.unsafeMutableAddressor();
  v1[8] = type metadata accessor for InstalledAppProvider(0LL);
  v1[9] = &protocol witness table for InstalledAppProvider;
  v1[5] = v2;
  swift_retain(v2);
  return v1;
}

uint64_t sub_33F4(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 112) = a2;
  *(void *)(v3 + 120) = v2;
  return swift_task_switch(sub_340C, 0LL, 0LL);
}

uint64_t sub_340C()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_25E0(v1, v2);
  uint64_t v4 = dispatch thunk of CandidateSuggestion.context.getter(v2, v3);
  uint64_t v6 = v5;
  v0[16] = v4;
  v0[17] = v5;
  uint64_t ObjectType = swift_getObjectType(v4);
  v0[18] = ObjectType;
  dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v6 + 8) + 8LL));
  return sub_3778();
}

uint64_t sub_3484()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = sub_2F48(v0[18], v0[17]);
  uint64_t v4 = v3;
  swift_unknownObjectRelease(v1);
  v0[19] = v2;
  v0[20] = v4;
  return sub_3778();
}

uint64_t sub_34D4()
{
  uint64_t v1 = *(void *)(v0 + 160);
  if (!v1) {
    goto LABEL_5;
  }
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void **)(v0 + 120);
  uint64_t v4 = v3[8];
  uint64_t v5 = v3[9];
  sub_25E0(v3 + 5, v4);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v5 + 24))(v2, v1, v3[4], v4, v5);
  if (!v6)
  {
    swift_bridgeObjectRelease(v1);
LABEL_5:
    uint64_t v10 = &_swiftEmptyArrayStorage;
    return (*(uint64_t (**)(_OWORD *))(v0 + 8))(v10);
  }

  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(v0 + 152);
  uint64_t v9 = sub_2644(&qword_C4E0);
  uint64_t v10 = (_OWORD *)swift_allocObject(v9, 64LL, 7LL);
  v10[1] = xmmword_6CF0;
  uint64_t v11 = sub_2644(&qword_C4E8);
  uint64_t inited = swift_initStackObject(v11, v0 + 16);
  *(_OWORD *)(inited + 16) = xmmword_6C00;
  *(void *)(inited + 32) = 0x656D614E707061LL;
  *(void *)(inited + 40) = 0xE700000000000000LL;
  *(void *)(inited + 48) = sub_3090();
  *(void *)(inited + 56) = v13;
  *(void *)(inited + 64) = 0x6449707061LL;
  *(void *)(inited + 72) = 0xE500000000000000LL;
  *(void *)(inited + 80) = v8;
  *(void *)(inited + 88) = v1;
  uint64_t v14 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  *((void *)v10 + 7) = sub_2644(qword_C318);
  *((void *)v10 + 4) = v14;

  return (*(uint64_t (**)(_OWORD *))(v0 + 8))(v10);
}

uint64_t type metadata accessor for RelevantAppResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC26AppLaunchSuggestionsPlugin19RelevantAppResolver);
}

uint64_t sub_3654(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_C4DC);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_36A4;
  return sub_33F4((uint64_t)v4, a2);
}

uint64_t sub_36A4(uint64_t a1)
{
  uint64_t v4 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 16));
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_36F4()
{
  return sub_373C((unint64_t *)&unk_C4C0, (uint64_t)&unk_6E34);
}

uint64_t sub_3718()
{
  return sub_373C(&qword_C4D0, (uint64_t)&unk_6E5C);
}

uint64_t sub_373C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for RelevantAppResolver();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_3778()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_3788()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_3808(v0, qword_CD30);
  sub_2D94(v0, (uint64_t)qword_CD30);
  if (qword_C2D8 != -1) {
    swift_once(&qword_C2D8, sub_6584);
  }
  return Logger.init(_:)((id)qword_CD90);
}

uint64_t *sub_3808(uint64_t a1, uint64_t *a2)
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

uint64_t sub_3848()
{
  uint64_t v0 = type metadata accessor for DomainOwner(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  uint64_t result = DomainOwner.init(_:)(0x636E75616C707061LL, 0xE900000000000068LL);
  qword_CD48 = result;
  return result;
}

void sub_389C()
{
  qword_CD50 = 0x746E6176656C6572LL;
  *(void *)algn_CD58 = 0xEB00000000707041LL;
}

uint64_t sub_38C8()
{
  if (qword_C2B0 != -1) {
    swift_once(&qword_C2B0, sub_389C);
  }
  uint64_t v16 = *(void *)algn_CD58;
  uint64_t v17 = qword_CD50;
  uint64_t v0 = sub_2644(&qword_C600);
  uint64_t v1 = swift_allocObject(v0, 112LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_6C00;
  uint64_t v2 = sub_2644(&qword_C608);
  uint64_t v3 = swift_allocObject(v2, 40LL, 7LL);
  *(_OWORD *)(v3 + 16) = xmmword_6CF0;
  uint64_t v4 = (void *)Actions.launchable.unsafeMutableAddressor();
  *(void *)(v3 + 32) = *v4;
  uint64_t v18 = v3;
  unint64_t v5 = sub_43BC();
  uint64_t v6 = sub_2644(&qword_C618);
  unint64_t v7 = sub_43F8();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v19, &v18, v6, v7, &type metadata for Actions, v5);
  uint64_t v8 = v19;
  uint64_t v9 = type metadata accessor for RelevantAppResolver();
  swift_allocObject(v9, 80LL, 7LL);
  uint64_t v10 = sub_338C(v8);
  *(void *)(v1 + 56) = v9;
  *(void *)(v1 + 64) = sub_5C48( &qword_C628,  (uint64_t (*)(uint64_t))type metadata accessor for RelevantAppResolver,  (uint64_t)&unk_6E94);
  *(void *)(v1 + 32) = v10;
  uint64_t v11 = swift_allocObject(v2, 40LL, 7LL);
  *(_OWORD *)(v11 + 16) = xmmword_6CF0;
  *(void *)(v11 + 32) = *v4;
  uint64_t v18 = v11;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v19, &v18, v6, v7, &type metadata for Actions, v5);
  uint64_t v12 = v19;
  uint64_t v13 = type metadata accessor for FrequentAppResolver();
  swift_allocObject(v13, 80LL, 7LL);
  uint64_t v14 = sub_31F0(v12);
  *(void *)(v1 + 96) = v13;
  *(void *)(v1 + 104) = sub_5C48( &qword_C630,  (uint64_t (*)(uint64_t))type metadata accessor for FrequentAppResolver,  (uint64_t)&unk_6DB4);
  *(void *)(v1 + 72) = v14;
  static Resolvers.cascadeResolvers(type:resolvers:)(qword_C4F0, v17, v16, v1);
  return swift_bridgeObjectRelease(v1);
}

uint64_t sub_3B08()
{
  if (qword_C2B0 != -1) {
    swift_once(&qword_C2B0, sub_389C);
  }
  uint64_t v0 = qword_CD50;
  uint64_t v1 = *(void *)algn_CD58;
  swift_bridgeObjectRetain(*(void *)algn_CD58);
  uint64_t result = ResolvableParameter.__allocating_init(typeIdentifier:required:)(v0, v1, 1LL);
  qword_CD60 = result;
  return result;
}

uint64_t sub_3B88(uint64_t a1, uint64_t a2)
{
  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  return swift_task_switch(sub_3BA4, 0LL, 0LL);
}

uint64_t sub_3BA4()
{
  if (qword_C2A8 != -1) {
    swift_once(&qword_C2A8, sub_3848);
  }
  uint64_t v1 = (int *)v0[17];
  uint64_t v2 = qword_CD48;
  v0[10] = type metadata accessor for DomainOwner(0LL);
  v0[11] = sub_5C48( &qword_C5C0,  (uint64_t (*)(uint64_t))&type metadata accessor for DomainOwner,  (uint64_t)&protocol conformance descriptor for DomainOwner);
  v0[7] = v2;
  uint64_t v3 = v1[1];
  uint64_t v6 = (uint64_t (*)(void *))((char *)v1 + *v1);
  sub_5CBC();
  uint64_t v4 = (void *)swift_task_alloc(v3);
  v0[20] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_3C78;
  return v6(v0 + 7);
}

uint64_t sub_3C78(uint64_t a1)
{
  uint64_t v2 = (void *)(*(void *)v1 + 56LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 160LL);
  *(void *)(*(void *)v1 + 168LL) = a1;
  swift_task_dealloc(v3);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v2);
  return swift_task_switch(sub_3CE0, 0LL, 0LL);
}

uint64_t sub_3CE0()
{
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 152);
  *(void *)(v0 + 120) = &type metadata for AppLaunchConfigurationProvider;
  *(void *)(v0 + 128) = sub_4208();
  uint64_t v3 = dispatch thunk of SuggestionOwnerDefinitionBuilder.withConfiguratorProvider(_:)(v0 + 96);
  swift_release(v1);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((void *)(v0 + 96));
  uint64_t v4 = swift_task_alloc(32LL);
  *(void *)(v4 + 16) = v2;
  uint64_t v5 = dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)( 0xD00000000000002ELL,  0x80000000000073F0LL,  0xD00000000000001ELL,  0x8000000000007530LL,  sub_4244,  v4);
  swift_release(v3);
  uint64_t v6 = swift_task_dealloc(v4);
  dispatch thunk of SuggestionOwnerDefinitionBuilder.build()(v6);
  swift_release(v5);
  uint64_t v7 = sub_2644(&qword_C5D0);
  uint64_t v8 = swift_allocObject(v7, 72LL, 7LL);
  *(_OWORD *)(v8 + 16) = xmmword_6CF0;
  sub_424C((__int128 *)(v0 + 16), v8 + 32);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
}

uint64_t sub_3E0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  __int128 v13 = *(_OWORD *)(a1 + 32);
  sub_25E0((void *)a1, v1);
  uint64_t v2 = sub_2644(&qword_C5D8);
  uint64_t v3 = swift_allocObject(v2, 40LL, 7LL);
  *(_OWORD *)(v3 + 16) = xmmword_6EC0;
  type metadata accessor for Signal(0LL);
  *(void *)(v3 + 32) = static Signal.HomeScreen.getter();
  v30[0] = v3;
  specialized Array._endMutation()();
  uint64_t v31 = v1;
  __int128 v32 = v13;
  sub_4264(v30);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)(v3, v1, v13);
  swift_bridgeObjectRelease(v3);
  uint64_t v4 = v31;
  __int128 v14 = v32;
  sub_25E0(v30, v31);
  *(void *)&__int128 v26 = &type metadata for RelevantAppConfigurator;
  *((void *)&v26 + 1) = sub_42A0();
  v25[0] = 0xD00000000000002ELL;
  v25[1] = 0x80000000000073F0LL;
  *(void *)uint64_t v29 = v4;
  *(_OWORD *)&v29[8] = v14;
  sub_4264(v28);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.withConfigurator(_:)(v25, v4, v14);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v25);
  uint64_t v5 = *(void *)&v29[16];
  __int128 v15 = *(_OWORD *)v29;
  uint64_t v6 = *(void *)v29;
  sub_25E0(v28, *(uint64_t *)v29);
  __int128 v26 = v15;
  uint64_t v27 = v5;
  sub_4264(v25);
  dispatch thunk of SuggestionDetailsBuilder.exampleUtteranceDialogId(_:)( 0x6974736567677573LL,  0xEA00000000006E6FLL,  v6,  v5);
  uint64_t v7 = v27;
  __int128 v16 = v26;
  uint64_t v8 = v26;
  sub_25E0(v25, v26);
  if (qword_C2B8 != -1) {
    swift_once(&qword_C2B8, sub_38C8);
  }
  sub_42DC((uint64_t)qword_C4F0, (uint64_t)v19);
  if (qword_C2C0 != -1) {
    swift_once(&qword_C2C0, sub_3B08);
  }
  uint64_t v9 = qword_CD60;
  __int128 v23 = v16;
  uint64_t v24 = v7;
  sub_4264(v22);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)( 7368801LL,  0xE300000000000000LL,  v19,  v9,  v8,  v7);
  sub_57A4((uint64_t)v19, &qword_C5E8);
  uint64_t v10 = v24;
  __int128 v17 = v23;
  uint64_t v11 = v23;
  sub_25E0(v22, v23);
  *(void *)&__int128 v20 = &type metadata for LaunchAppActionProvider;
  *((void *)&v20 + 1) = sub_4320();
  v18[3] = &type metadata for AppViewProvider;
  v18[4] = sub_435C();
  v18[0] = swift_allocObject(&unk_87B0, 56LL, 7LL);
  sub_5CF0(0xD00000000000001ELL, 0x8000000000007530LL, v19, v18[0] + 16LL);
  __int128 v20 = v17;
  uint64_t v21 = v10;
  sub_4264(v19);
  dispatch thunk of SuggestionDetailsBuilder.viewProvider(_:)(v18, v11, v10);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v18);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v19);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v22);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v25);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v28);
  return _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v30);
}

uint64_t sub_4174()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for AppLaunchOwnerDefinitionFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC26AppLaunchSuggestionsPlugin31AppLaunchOwnerDefinitionFactory);
}

uint64_t sub_41A4()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()(v0);
}

uint64_t sub_41AC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_C5BC);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_36A4;
  return sub_3B88(a1, a2);
}

unint64_t sub_4208()
{
  unint64_t result = qword_C5C8;
  if (!qword_C5C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_6F60, &type metadata for AppLaunchConfigurationProvider);
    atomic_store(result, (unint64_t *)&qword_C5C8);
  }

  return result;
}

uint64_t sub_4244(uint64_t a1)
{
  return sub_3E0C(a1);
}

uint64_t sub_424C(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_4264(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

unint64_t sub_42A0()
{
  unint64_t result = qword_C5E0;
  if (!qword_C5E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_6CB8, &type metadata for RelevantAppConfigurator);
    atomic_store(result, (unint64_t *)&qword_C5E0);
  }

  return result;
}

uint64_t sub_42DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_4320()
{
  unint64_t result = qword_C5F0;
  if (!qword_C5F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_6C48, &type metadata for LaunchAppActionProvider);
    atomic_store(result, (unint64_t *)&qword_C5F0);
  }

  return result;
}

unint64_t sub_435C()
{
  unint64_t result = qword_C5F8;
  if (!qword_C5F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_7024, &type metadata for AppViewProvider);
    atomic_store(result, (unint64_t *)&qword_C5F8);
  }

  return result;
}

uint64_t sub_4398()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

unint64_t sub_43BC()
{
  unint64_t result = qword_C610;
  if (!qword_C610)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Actions, &type metadata for Actions);
    atomic_store(result, (unint64_t *)&qword_C610);
  }

  return result;
}

unint64_t sub_43F8()
{
  unint64_t result = qword_C620;
  if (!qword_C620)
  {
    uint64_t v1 = sub_2684(&qword_C618);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_C620);
  }

  return result;
}

ValueMetadata *type metadata accessor for AppLaunchConfigurationProvider()
{
  return &type metadata for AppLaunchConfigurationProvider;
}

uint64_t sub_444C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CoreSignalTypes(0LL);
  uint64_t v80 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  sub_5C90();
  uint64_t v73 = v4 - v3;
  uint64_t v5 = sub_2644(&qword_C638);
  ((void (*)(void))__chkstk_darwin)();
  sub_5C90();
  uint64_t v8 = v7 - v6;
  sub_2644(&qword_C640);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v9);
  v74 = (char *)&v70 - v13;
  __chkstk_darwin(v12);
  __int128 v15 = (char *)&v70 - v14;
  uint64_t v16 = type metadata accessor for Logger(0LL);
  unint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  sub_5C90();
  uint64_t v20 = v19 - v18;
  if (qword_C2A0 != -1) {
    swift_once(&qword_C2A0, sub_3788);
  }
  uint64_t v21 = sub_2D94(v16, (uint64_t)qword_CD30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v20, v21, v16);
  uint64_t v22 = swift_bridgeObjectRetain_n(a1, 2LL);
  __int128 v23 = (os_log_s *)Logger.logObject.getter(v22);
  os_log_type_t v24 = static os_log_type_t.default.getter();
  LODWORD(v79) = v24;
  BOOL v25 = os_log_type_enabled(v23, v24);
  v76 = v11;
  uint64_t v77 = a1;
  if (v25)
  {
    __int128 v26 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v75 = swift_slowAlloc(32LL, -1LL);
    v81[0] = v75;
    uint64_t v78 = v5;
    *(_DWORD *)__int128 v26 = 136315138;
    uint64_t v27 = v26 + 12;
    v71 = v26 + 4;
    v72 = v26;
    uint64_t v28 = type metadata accessor for Signal(0LL);
    swift_bridgeObjectRetain(v77);
    uint64_t v29 = Array.description.getter(v77, v28);
    unint64_t v31 = v30;
    swift_bridgeObjectRelease(v77);
    uint64_t v32 = v29;
    a1 = v77;
    v82 = (void *)sub_5028(v32, v31, v81);
    uint64_t v33 = v27;
    uint64_t v5 = v78;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v82, &v83, v71, v33);
    sub_5CDC();
    swift_bridgeObjectRelease(v31);
    v34 = v72;
    _os_log_impl(&dword_0, v23, (os_log_type_t)v79, "Generating configurators for signals: %s", v72, 0xCu);
    unint64_t v79 = v17;
    uint64_t v35 = v75;
    swift_arrayDestroy(v75, 1LL, (char *)&type metadata for Any + 8);
    sub_2E20(v35);
    sub_2E20((uint64_t)v34);

    (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v20, v16);
  }

  else
  {

    sub_5CDC();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v20, v16);
  }

  v82 = &_swiftEmptyArrayStorage;
  uint64_t v36 = (uint64_t)v74;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v57 = a1;
    }
    else {
      uint64_t v57 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v58 = v57;
    uint64_t v36 = (uint64_t)v74;
    uint64_t v37 = _CocoaArrayWrapper.endIndex.getter(v58);
    if (v37) {
      goto LABEL_8;
    }
LABEL_31:
    swift_bridgeObjectRelease(a1);
    unint64_t v56 = (unint64_t)&_swiftEmptyArrayStorage;
    goto LABEL_32;
  }

  uint64_t v37 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  if (!v37) {
    goto LABEL_31;
  }
LABEL_8:
  if (v37 < 1)
  {
    __break(1u);
    uint64_t v69 = v81[0];
    swift_release(v36);
    swift_release(v23);
    uint64_t result = swift_bridgeObjectRelease(v69);
    __break(1u);
    return result;
  }

  uint64_t v38 = 0LL;
  unint64_t v79 = a1 & 0xC000000000000001LL;
  LODWORD(v78) = enum case for CoreSignalTypes.app(_:);
  uint64_t v75 = v37;
  do
  {
    if (v79)
    {
      uint64_t v39 = specialized _ArrayBuffer._getElementSlowPath(_:)(v38, a1);
    }

    else
    {
      uint64_t v39 = *(void *)(a1 + 8 * v38 + 32);
      swift_retain(v39);
    }

    Signal.signalType.getter(v81);
    uint64_t v40 = sub_2644(&qword_C648);
    int v41 = swift_dynamicCast(v15, v81, v40, v2, 6LL);
    sub_5CD0((uint64_t)v15, v41 ^ 1u);
    (*(void (**)(uint64_t, void, uint64_t))(v80 + 104))(v36, v78, v2);
    sub_5CD0(v36, 0LL);
    uint64_t v42 = v8 + *(int *)(v5 + 48);
    sub_4F00((uint64_t)v15, v8);
    sub_4F00(v36, v42);
    sub_5CA0(v8);
    if (v45)
    {
      sub_5CA0(v42);
      if (!v45) {
        goto LABEL_21;
      }
      sub_5C88(v8);
      sub_5C88(v36);
      uint64_t v43 = sub_5C88((uint64_t)v15);
    }

    else
    {
      uint64_t v44 = (uint64_t)v76;
      sub_4F00(v8, (uint64_t)v76);
      sub_5CA0(v42);
      if (v45)
      {
        (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v44, v2);
        uint64_t v37 = v75;
LABEL_21:
        sub_57A4(v8, &qword_C638);
        sub_5C88(v36);
        sub_5C88((uint64_t)v15);
LABEL_22:
        swift_release(v39);
        goto LABEL_25;
      }

      uint64_t v46 = v80;
      uint64_t v47 = v5;
      uint64_t v48 = v73;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v80 + 32))(v73, v42, v2);
      uint64_t v49 = sub_5C48( &qword_C660,  (uint64_t (*)(uint64_t))&type metadata accessor for CoreSignalTypes,  (uint64_t)&protocol conformance descriptor for CoreSignalTypes);
      char v50 = dispatch thunk of static Equatable.== infix(_:_:)(v44, v48, v2, v49);
      v51 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
      v51(v44, v2);
      uint64_t v52 = v48;
      uint64_t v5 = v47;
      uint64_t v36 = (uint64_t)v74;
      v51(v52, v2);
      a1 = v77;
      sub_5CE8(v8);
      sub_5CE8(v36);
      uint64_t v43 = sub_5CE8((uint64_t)v15);
      uint64_t v37 = v75;
      if ((v50 & 1) == 0) {
        goto LABEL_22;
      }
    }

    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v43);
    uint64_t v53 = v82[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v53);
    uint64_t v54 = v53;
    a1 = v77;
    uint64_t v55 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v54, v39);
    specialized ContiguousArray._endMutation()(v55);
LABEL_25:
    ++v38;
  }

  while (v37 != v38);
  swift_bridgeObjectRelease(a1);
  unint64_t v56 = (unint64_t)v82;
LABEL_32:
  uint64_t v59 = type metadata accessor for Signal(0LL);
  uint64_t v60 = sub_2644(&qword_C650);
  uint64_t v61 = sub_5C48( &qword_C658,  (uint64_t (*)(uint64_t))&type metadata accessor for Signal,  (uint64_t)&protocol conformance descriptor for Signal);
  uint64_t v62 = Dictionary.init(dictionaryLiteral:)(&_swiftEmptyArrayStorage, v59, v60, v61);
  v81[0] = v62;
  if ((v56 & 0x8000000000000000LL) != 0 || (v56 & 0x4000000000000000LL) != 0) {
    goto LABEL_43;
  }
  uint64_t v63 = *(void *)(v56 + 16);
  sub_5CBC();
  for (; v63; uint64_t v63 = _CocoaArrayWrapper.endIndex.getter(v67))
  {
    uint64_t v62 = 0LL;
    for (uint64_t i = 4LL; ; ++i)
    {
      if ((v56 & 0xC000000000000001LL) != 0)
      {
        v65 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, v56);
      }

      else
      {
        v65 = *(void **)(v56 + 8 * i);
        swift_retain(v65);
      }

      uint64_t v66 = i - 3;
      if (__OFADD__(i - 4, 1LL)) {
        break;
      }
      v82 = v65;
      sub_4B3C((uint64_t)v81, (uint64_t *)&v82);
      swift_release(v65);
      if (v66 == v63)
      {
        sub_5CC4();
        return v81[0];
      }
    }

    __break(1u);
LABEL_43:
    uint64_t v67 = sub_5CBC();
  }

  sub_5CC4();
  return v62;
}

uint64_t sub_4B3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v39 = a1;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_2644(&qword_C670);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for SignalContext(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin();
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = *a2;
  Signal.context.getter(v11);
  uint64_t v16 = (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 32))(v13, v8, v9);
  if ((SignalContext.onScreen.getter(v16) & 1) == 0 && (SignalContext.explicitRequest.getter() & 1) != 0)
  {
    if (qword_C2A0 != -1) {
      swift_once(&qword_C2A0, sub_3788);
    }
    uint64_t v17 = sub_2D94(v3, (uint64_t)qword_CD30);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v17, v3);
    uint64_t v18 = swift_retain_n(v14, 2LL);
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
    os_log_type_t v20 = static os_log_type_t.default.getter();
    int v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v38 = v19;
      uint64_t v22 = swift_slowAlloc(12LL, -1LL);
      int v36 = v21;
      __int128 v23 = (uint8_t *)v22;
      uint64_t v37 = swift_slowAlloc(32LL, -1LL);
      uint64_t v42 = v37;
      uint64_t v35 = v23;
      *(_DWORD *)__int128 v23 = 136315138;
      v34 = v23 + 4;
      uint64_t v40 = v14;
      uint64_t v33 = type metadata accessor for Signal(0LL);
      uint64_t v24 = sub_5C48( (unint64_t *)&qword_C338,  (uint64_t (*)(uint64_t))&type metadata accessor for Signal,  (uint64_t)&protocol conformance descriptor for Signal);
      uint64_t v25 = dispatch thunk of CustomStringConvertible.description.getter(v33, v24);
      unint64_t v27 = v26;
      uint64_t v40 = sub_5028(v25, v26, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v34, v23 + 12);
      swift_release_n(v14, 2LL);
      swift_bridgeObjectRelease(v27);
      uint64_t v28 = v35;
      _os_log_impl(&dword_0, v38, (os_log_type_t)v36, "Adding LaunchApp configuration for signal: %s", v35, 0xCu);
      uint64_t v29 = v37;
      swift_arrayDestroy(v37, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1LL, -1LL);
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    else
    {

      swift_release_n(v14, 2LL);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v30 = sub_2644(&qword_C678);
    uint64_t v31 = swift_allocObject(v30, 72LL, 7LL);
    *(_OWORD *)(v31 + 16) = xmmword_6CF0;
    *(void *)(v31 + 56) = &type metadata for RelevantAppConfigurator;
    *(void *)(v31 + 64) = sub_42A0();
    *(void *)(v31 + 32) = 0xD00000000000002ELL;
    *(void *)(v31 + 40) = 0x80000000000073F0LL;
    swift_retain(v14);
    sub_5A94(v31, v14);
    swift_release(v14);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

uint64_t sub_4EF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_4F00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2644(&qword_C640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_4F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_4F54(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_4F64(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_4F98(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_4FB8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_5028(v6, v7, a3);
  uint64_t v10 = *a1;
  uint64_t v11 = *a1 + 8;
  uint64_t v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_5028(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_50F8(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2768((uint64_t)v12, *a3);
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
      sub_2768((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v12);
  return v7;
}

void *sub_50F8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_524C((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_5310(a5, a6);
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
    return (void *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

void *sub_524C(char *__src, size_t __n, char *__dst)
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

void *sub_5310(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_53A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_5578(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_5578((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_53A4(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_5514(v4, 0LL);
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

void *sub_5514(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_2644(&qword_C668);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_5578(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_2644(&qword_C668);
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
    sub_5710(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_564C(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_564C(char *__src, size_t __n, char *__dst)
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

char *sub_5710(char *__src, size_t __len, char *__dst)
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

_BYTE **sub_5790(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  char v4 = *result;
  *char v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_57A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2644(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

unint64_t sub_57E0(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_58D4(a1, a2, v5);
}

unint64_t sub_5844(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = type metadata accessor for Signal(0LL);
  uint64_t v5 = sub_5C48( &qword_C658,  (uint64_t (*)(uint64_t))&type metadata accessor for Signal,  (uint64_t)&protocol conformance descriptor for Signal);
  uint64_t v6 = dispatch thunk of Hashable._rawHashValue(seed:)(v3, v4, v5);
  return sub_59B4(a1, v6);
}

unint64_t sub_58D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
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

unint64_t sub_59B4(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a1;
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v6 = v2;
    uint64_t v7 = ~v4;
    uint64_t v8 = type metadata accessor for Signal(0LL);
    uint64_t v9 = sub_5C48( &qword_C688,  (uint64_t (*)(uint64_t))&type metadata accessor for Signal,  (uint64_t)&protocol conformance descriptor for Signal);
    do
    {
      uint64_t v11 = *(void *)(*(void *)(v6 + 48) + 8 * v5);
      if ((dispatch thunk of static Equatable.== infix(_:_:)(&v11, &v12, v8, v9) & 1) != 0) {
        break;
      }
      unint64_t v5 = (v5 + 1) & v7;
    }

    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0);
  }

  return v5;
}

uint64_t sub_5A94(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  uint64_t v8 = *v2;
  *uint64_t v2 = 0x8000000000000000LL;
  sub_5B00(a1, a2, isUniquelyReferenced_nonNull_native);
  uint64_t v6 = *v2;
  *uint64_t v2 = v8;
  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_5B00(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_5844(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v14 = v9;
  char v15 = v10;
  sub_2644(&qword_C680);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_5844(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_9:
    uint64_t v21 = type metadata accessor for Signal(0LL);
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v21);
    __break(1u);
    return result;
  }

  unint64_t v14 = v16;
LABEL_5:
  uint64_t v18 = *v4;
  if ((v15 & 1) != 0)
  {
    uint64_t v19 = v18[7];
    uint64_t result = swift_bridgeObjectRelease(*(void *)(v19 + 8 * v14));
    *(void *)(v19 + 8 * v14) = a1;
  }

  else
  {
    sub_5C04(v14, a2, a1, v18);
    return swift_retain(a2);
  }

  return result;
}

unint64_t sub_5C04(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1LL << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1LL);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

uint64_t sub_5C48(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_5C88(uint64_t a1)
{
  return sub_57A4(a1, v1);
}

  ;
}

uint64_t sub_5CA0(uint64_t a1)
{
  return sub_4F48(a1, 1LL, v1);
}

uint64_t sub_5CBC()
{
  return swift_retain(v0);
}

uint64_t sub_5CC4()
{
  return swift_release_n(v0, 2LL);
}

uint64_t sub_5CD0(uint64_t a1, uint64_t a2)
{
  return sub_4EF4(a1, a2, 1LL, v2);
}

uint64_t sub_5CDC()
{
  return swift_bridgeObjectRelease_n(v0, 2LL);
}

uint64_t sub_5CE8(uint64_t a1)
{
  return sub_57A4(a1, v1);
}

uint64_t sub_5CF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_C2C8 != -1) {
    swift_once(&qword_C2C8, sub_64F4);
  }
  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v11 = sub_2D94(v10, (uint64_t)qword_CD68);
  uint64_t v12 = sub_64EC();
  sub_4EF4((uint64_t)v9, 1LL, 1LL, v12);
  uint64_t v13 = type metadata accessor for StaticIconUrlProvider(0LL);
  swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
  uint64_t v14 = StaticIconUrlProvider.init(icon:)(v9);
  v16[3] = v13;
  v16[4] = &protocol witness table for StaticIconUrlProvider;
  v16[0] = v14;
  static ViewCallbacks.createCatViewCallback(dialogId:templateDirectory:assetsProvider:invocationActionProvider:)( v17,  a1,  a2,  v11,  v16,  a3);
  swift_bridgeObjectRelease(a2);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(a3);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v16);
  return sub_424C(v17, a4);
}

void sub_5E40()
{
}

void sub_5E74(uint64_t a1)
{
}

void sub_5E80(uint64_t a1)
{
}

void sub_5E8C(uint64_t a1, void (*a2)(uint64_t, uint64_t, void))
{
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  sub_25E0(v2, v5);
  a2(a1, v5, *(void *)(v6 + 16));
  sub_64B4();
}

void sub_5EDC()
{
}

void sub_5F10(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_2644(&qword_C690);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (uint64_t *)((char *)&v21 - v7);
  uint64_t v9 = a2[3];
  uint64_t v10 = a2[4];
  sub_25E0(a2, v9);
  uint64_t v11 = dispatch thunk of CandidateSuggestion.params.getter(v9, v10);
  sub_2538(7368801LL, 0xE300000000000000LL, v11, &v23);
  swift_bridgeObjectRelease(v11);
  if (!v24)
  {
    sub_2604((uint64_t)&v23);
LABEL_6:
    strcpy(v6, "com.apple.siri");
    v6[15] = -18;
    uint64_t v19 = enum case for Image.appIcon(_:);
    uint64_t v20 = sub_64EC();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104LL))(v6, v19, v20);
    sub_4EF4((uint64_t)v6, 0LL, 1LL, v20);
    goto LABEL_7;
  }

  uint64_t v12 = sub_2644(qword_C318);
  uint64_t v13 = v22;
  uint64_t v14 = sub_2588(0x6449707061LL, 0xE500000000000000LL, v22);
  uint64_t v16 = v15;
  swift_bridgeObjectRelease(v13);
  if (!v16) {
    goto LABEL_6;
  }
  *uint64_t v8 = v14;
  v8[1] = v16;
  uint64_t v17 = enum case for Image.appIcon(_:);
  uint64_t v18 = sub_64EC();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104LL))(v8, v17, v18);
  sub_4EF4((uint64_t)v8, 0LL, 1LL, v18);
  uint64_t v6 = (char *)v8;
LABEL_7:
  Assets.init(icon:)(v6);
  sub_64B4();
}

void sub_6104(uint64_t a1)
{
}

void sub_6120(uint64_t a1)
{
}

void sub_6144(uint64_t a1, void *a2)
{
}

uint64_t initializeBufferWithCopyOfBuffer for AppViewProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t initializeWithCopy for AppViewProvider(uint64_t a1, uint64_t a2)
{
  __int128 v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

void *assignWithCopy for AppViewProvider(void *a1, void *a2)
{
  return a1;
}

void *sub_61E8(void *result, void *a2)
{
  if (result != a2)
  {
    __int128 v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v9 = *(void *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        uint64_t v11 = *result;
        uint64_t v12 = *a2;
        swift_retain(*a2);
        uint64_t result = (void *)swift_release(v11);
        *__int128 v3 = v12;
      }

      else
      {
        return (void *)(*(uint64_t (**)(void *, void *, void))(v9 + 24))(result, a2, result[3]);
      }
    }

    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      int v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        uint64_t v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v14 = *a2;
          *__int128 v3 = *a2;
          swift_retain(v14);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(result, a2, v5);
        }

        return (void *)swift_release(v10);
      }

      else
      {
        (*(void (**)(_BYTE *, void *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v13 = *a2;
          *__int128 v3 = *a2;
          swift_retain(v13);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v3, a2, v5);
        }

        return (void *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }

  return result;
}

__n128 initializeWithTake for AppViewProvider(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AppViewProvider(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppViewProvider(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(dispatch thunk of ViewProvider.getInvocationActionProvider(context:)(v0, v1, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(dispatch thunk of ViewProvider.getInvocationActionProvider(context:)(v0, v1, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(dispatch thunk of ViewProvider.getInvocationActionProvider(context:)(v0, v1, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppViewProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 40) = 1;
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

    *(_BYTE *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for AppViewProvider()
{
  return &type metadata for AppViewProvider;
}

unint64_t sub_6438()
{
  unint64_t result = qword_C698;
  if (!qword_C698)
  {
    unint64_t result = swift_getWitnessTable(&unk_6FBC, &type metadata for AppViewProvider);
    atomic_store(result, (unint64_t *)&qword_C698);
  }

  return result;
}

unint64_t sub_6478()
{
  unint64_t result = qword_C6A0;
  if (!qword_C6A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_6FE4, &type metadata for AppViewProvider);
    atomic_store(result, (unint64_t *)&qword_C6A0);
  }

  return result;
}

  ;
}

void *sub_64C4()
{
  return sub_25E0(v0, v0[3]);
}

uint64_t sub_64EC()
{
  return type metadata accessor for Image(0LL);
}

uint64_t sub_64F4()
{
  uint64_t v0 = type metadata accessor for URL(0LL);
  sub_3808(v0, qword_CD68);
  sub_2D94(v0, (uint64_t)qword_CD68);
  return URL.init(fileURLWithPath:isDirectory:)(0xD00000000000004ALL, 0x8000000000007850LL, 1LL);
}

void sub_6558()
{
  qword_CD80 = 0x746E6176656C6572LL;
  *(void *)algn_CD88 = 0xEB00000000707041LL;
}

uint64_t sub_6584()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000018LL,  0x80000000000078A0LL,  0xD00000000000001ALL,  0x80000000000078C0LL);
  qword_CD90 = result;
  return result;
}

unint64_t sub_65E8()
{
  unint64_t result = qword_C6A8;
  if (!qword_C6A8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_C6A8);
  }

  return result;
}
uint64_t sub_2268()
{
  uint64_t v0;
  uint64_t v1;
  _OWORD v3[2];
  uint64_t v4;
  _OWORD v5[2];
  uint64_t v6;
  _BYTE v7[40];
  v0 = type metadata accessor for ResolvableParameter(0LL);
  v1 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  v0,  &protocol witness table for String);
  sub_2304();
  v6 = 0LL;
  memset(v5, 0, sizeof(v5));
  v4 = 0LL;
  memset(v3, 0, sizeof(v3));
  return SuggestionDetails.init(suggestionId:resolverParams:viewProvider:actionIdKeyMapper:filter:)( 0xD00000000000002ALL,  0x80000000000035F0LL,  v1,  v7,  v5,  v3);
}

uint64_t sub_2304()
{
  v1 = (char *)v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_8090 != -1) {
    swift_once(&qword_8090, sub_25F8);
  }
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = sub_2528(v2, (uint64_t)qword_89C0);
  strcpy(v1, "com.apple.tv");
  v1[13] = 0;
  *((_WORD *)v1 + 7) = -5120;
  uint64_t v4 = enum case for Image.appIcon(_:);
  uint64_t v5 = type metadata accessor for Image(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104LL))(v1, v4, v5);
  sub_2540((uint64_t)v1, 0LL, 1LL, v5);
  uint64_t v6 = type metadata accessor for StaticIconUrlProvider(0LL);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  uint64_t v7 = StaticIconUrlProvider.init(icon:)(v1);
  v10[3] = v6;
  v10[4] = &protocol witness table for StaticIconUrlProvider;
  v10[0] = v7;
  v9[3] = &type metadata for FindVideoActionProvider;
  v9[4] = sub_254C();
  static ViewCallbacks.createCatViewCallback(dialogId:templateDirectory:assetsProvider:invocationActionProvider:)( 0xD00000000000001ALL,  0x8000000000003620LL,  v3,  v10,  v9);
  sub_2588(v9);
  return sub_2588(v10);
}

uint64_t sub_249C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_24DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for UtteranceAction(0LL);
  uint64_t v3 = UtteranceAction.__allocating_init()();
  a1[3] = v2;
  unint64_t result = sub_25B8();
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t sub_2528(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

unint64_t sub_254C()
{
  unint64_t result = qword_80A8;
  if (!qword_80A8)
  {
    unint64_t result = swift_getWitnessTable("A\v", &type metadata for FindVideoActionProvider);
    atomic_store(result, (unint64_t *)&qword_80A8);
  }

  return result;
}

uint64_t sub_2588(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

ValueMetadata *type metadata accessor for FindVideoActionProvider()
{
  return &type metadata for FindVideoActionProvider;
}

unint64_t sub_25B8()
{
  unint64_t result = qword_80B0;
  if (!qword_80B0)
  {
    uint64_t v1 = type metadata accessor for UtteranceAction(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UtteranceAction, v1);
    atomic_store(result, (unint64_t *)&qword_80B0);
  }

  return result;
}

uint64_t sub_25F8()
{
  uint64_t v0 = type metadata accessor for URL(0LL);
  sub_265C(v0, qword_89C0);
  sub_2528(v0, (uint64_t)qword_89C0);
  return URL.init(fileURLWithPath:isDirectory:)(0xD000000000000046LL, 0x8000000000003640LL, 1LL);
}

uint64_t *sub_265C(uint64_t a1, uint64_t *a2)
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

ValueMetadata *type metadata accessor for VideoGenerator()
{
  return &type metadata for VideoGenerator;
}

uint64_t sub_26AC()
{
  uint64_t v0 = sub_249C(&qword_80E0);
  uint64_t inited = swift_initStackObject(v0, v13);
  *(_OWORD *)(inited + 16) = xmmword_3820;
  uint64_t v2 = type metadata accessor for Signal(0LL);
  *(void *)(inited + 32) = static Signal.HomeScreen.getter();
  uint64_t v3 = sub_249C(&qword_80E8);
  uint64_t v4 = sub_2D84(v3);
  *(_OWORD *)(v4 + 16) = xmmword_3830;
  *(void *)(v4 + 56) = &type metadata for VideoConfiguration;
  unint64_t v5 = sub_2A40();
  *(void *)(v4 + 64) = v5;
  *(void *)(v4 + 32) = 0xD00000000000002ALL;
  *(void *)(v4 + 40) = 0x80000000000035F0LL;
  *(void *)(inited + 40) = v4;
  uint64_t v6 = type metadata accessor for CoreSignalTypes(0LL);
  v12[3] = v6;
  v12[4] = sub_2AB8( &qword_80F8,  (uint64_t (*)(uint64_t))&type metadata accessor for CoreSignalTypes,  (uint64_t)&protocol conformance descriptor for CoreSignalTypes);
  uint64_t v7 = sub_2A7C(v12);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v6 - 8) + 104LL))( v7,  enum case for CoreSignalTypes.app(_:),  v6);
  *(void *)(inited + 48) = Signal.__allocating_init(signalType:signalValue:fallbackSignals:)( v12,  0x6C7070612E6D6F63LL,  0xEC00000076742E65LL,  &_swiftEmptyArrayStorage);
  uint64_t v8 = sub_2D84(v3);
  *(_OWORD *)(v8 + 16) = xmmword_3830;
  *(void *)(v8 + 56) = &type metadata for VideoConfiguration;
  *(void *)(v8 + 64) = v5;
  *(void *)(v8 + 32) = 0xD00000000000002ALL;
  *(void *)(v8 + 40) = 0x80000000000035F0LL;
  *(void *)(inited + 56) = v8;
  uint64_t v9 = sub_249C(&qword_8100);
  uint64_t v10 = sub_2AB8( &qword_8108,  (uint64_t (*)(uint64_t))&type metadata accessor for Signal,  (uint64_t)&protocol conformance descriptor for Signal);
  return Dictionary.init(dictionaryLiteral:)(inited, v2, v9, v10);
}

uint64_t sub_2868()
{
  return sub_2AF8(*(uint64_t (**)(uint64_t))(v0 + 8), v0, (uint64_t)&_swiftEmptyArrayStorage);
}

uint64_t sub_2884(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc(async function pointer to SignalSubscriber.getAsyncSubscriptions()[1]);
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_2D5C;
  return SignalSubscriber.getAsyncSubscriptions()(a1, a2);
}

uint64_t sub_28E4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc(async function pointer to SignalSubscriber.getAsyncLookupSubscriptions()[1]);
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_2D5C;
  return SignalSubscriber.getAsyncLookupSubscriptions()(a1, a2);
}

uint64_t sub_2944()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_8114);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2988;
  return sub_2868();
}

uint64_t sub_2988(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

unint64_t sub_29C4()
{
  unint64_t result = qword_80B8[0];
  if (!qword_80B8[0])
  {
    unint64_t result = swift_getWitnessTable("q\v", &type metadata for VideoGenerator);
    atomic_store(result, qword_80B8);
  }

  return result;
}

unint64_t sub_2A04()
{
  unint64_t result = qword_80D8;
  if (!qword_80D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_3890, &type metadata for VideoGenerator);
    atomic_store(result, (unint64_t *)&qword_80D8);
  }

  return result;
}

unint64_t sub_2A40()
{
  unint64_t result = qword_80F0;
  if (!qword_80F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_3944, &type metadata for VideoConfiguration);
    atomic_store(result, (unint64_t *)&qword_80F0);
  }

  return result;
}

void *sub_2A7C(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_2AB8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_2AF8(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

void *initializeBufferWithCopyOfBuffer for VideoConfiguration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for VideoConfiguration(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *assignWithCopy for VideoConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v3);
  return a1;
}

__n128 initializeWithTake for VideoConfiguration(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for VideoConfiguration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoConfiguration(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for VideoConfiguration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for VideoConfiguration()
{
  return &type metadata for VideoConfiguration;
}

uint64_t sub_2C44()
{
  return sub_2D54(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2C50()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t sub_2C7C()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_812C);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2CC0;
  return sub_2CC0();
}

uint64_t sub_2CC0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2CEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to CandidateSuggestionConfigurator.isValid(signal:)[1]);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2988;
  return CandidateSuggestionConfigurator.isValid(signal:)(a1, a2, a3);
}

uint64_t sub_2D54(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2D64()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_2D84(uint64_t a1)
{
  return swift_allocObject(a1, 72LL, 7LL);
}

uint64_t sub_2D90()
{
  uint64_t v0 = sub_249C(&qword_81D0);
  uint64_t v1 = swift_allocObject(v0, 72LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_3830;
  *(void *)(v1 + 56) = &type metadata for VideoOwnerDefinition;
  *(void *)(v1 + 64) = sub_2E64();
  return v1;
}

uint64_t sub_2DE8()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for VideoOwnerDefinitionFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC22VideoSuggestionsPlugin27VideoOwnerDefinitionFactory);
}

uint64_t sub_2E18()
{
  return sub_2D90();
}

uint64_t sub_2E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(a1, a2, v2);
  return sub_2AF8(*(uint64_t (**)(uint64_t))(v3 + 8), v3, v4);
}

unint64_t sub_2E64()
{
  unint64_t result = qword_81D8;
  if (!qword_81D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A58, &type metadata for VideoOwnerDefinition);
    atomic_store(result, (unint64_t *)&qword_81D8);
  }

  return result;
}

ValueMetadata *type metadata accessor for VideoOwnerDefinition()
{
  return &type metadata for VideoOwnerDefinition;
}

uint64_t sub_2EB0()
{
  uint64_t v0 = type metadata accessor for DomainOwner(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  uint64_t result = DomainOwner.init(_:)(0x6F65646976LL, 0xE500000000000000LL);
  qword_89D8 = result;
  return result;
}

void sub_2EFC(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for VideoGenerator;
  *(void *)(a1 + 32) = sub_3030();
  sub_3218();
}

void sub_2F28(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for VideoTargetOwnerDefinition;
  *(void *)(a1 + 32) = sub_2FF4();
  sub_3218();
}

uint64_t sub_2F60@<X0>(uint64_t *a1@<X8>)
{
  return sub_312C(a1);
}

unint64_t sub_2F78()
{
  unint64_t result = qword_81E0;
  if (!qword_81E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A30, &type metadata for VideoOwnerDefinition);
    atomic_store(result, (unint64_t *)&qword_81E0);
  }

  return result;
}

unint64_t sub_2FB8()
{
  unint64_t result = qword_81E8;
  if (!qword_81E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A08, &type metadata for VideoOwnerDefinition);
    atomic_store(result, (unint64_t *)&qword_81E8);
  }

  return result;
}

unint64_t sub_2FF4()
{
  unint64_t result = qword_81F0;
  if (!qword_81F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_3AE4, &type metadata for VideoTargetOwnerDefinition);
    atomic_store(result, (unint64_t *)&qword_81F0);
  }

  return result;
}

unint64_t sub_3030()
{
  unint64_t result = qword_81F8;
  if (!qword_81F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_3900, &type metadata for VideoGenerator);
    atomic_store(result, (unint64_t *)&qword_81F8);
  }

  return result;
}

unint64_t sub_306C()
{
  unint64_t result = qword_8200;
  if (!qword_8200)
  {
    uint64_t v1 = type metadata accessor for DomainOwner(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DomainOwner, v1);
    atomic_store(result, (unint64_t *)&qword_8200);
  }

  return result;
}

ValueMetadata *type metadata accessor for VideoTargetOwnerDefinition()
{
  return &type metadata for VideoTargetOwnerDefinition;
}

void sub_30BC(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for VideoSuggestionsRepository;
  *(void *)(a1 + 32) = sub_31DC();
  sub_3218();
}

void *sub_30E8()
{
  return &_swiftEmptyArrayStorage;
}

void sub_30F4(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for NoOpSuggestionFilter(0LL);
  uint64_t v3 = static NoOpSuggestionFilter.Instance.getter();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for NoOpSuggestionFilter;
  *a1 = v3;
  sub_3218();
}

uint64_t sub_312C@<X0>(uint64_t *a1@<X8>)
{
  if (qword_8098 != -1) {
    swift_once(&qword_8098, sub_2EB0);
  }
  uint64_t v2 = qword_89D8;
  a1[3] = type metadata accessor for DomainOwner(0LL);
  a1[4] = sub_306C();
  *a1 = v2;
  return swift_retain(v2);
}

unint64_t sub_31A0()
{
  unint64_t result = qword_8208;
  if (!qword_8208)
  {
    unint64_t result = swift_getWitnessTable("\r\n", &type metadata for VideoTargetOwnerDefinition);
    atomic_store(result, (unint64_t *)&qword_8208);
  }

  return result;
}

unint64_t sub_31DC()
{
  unint64_t result = qword_8210;
  if (!qword_8210)
  {
    unint64_t result = swift_getWitnessTable(&unk_3BCC, &type metadata for VideoSuggestionsRepository);
    atomic_store(result, (unint64_t *)&qword_8210);
  }

  return result;
}

  ;
}

ValueMetadata *type metadata accessor for VideoSuggestionsRepository()
{
  return &type metadata for VideoSuggestionsRepository;
}

uint64_t sub_3230()
{
  uint64_t v0 = sub_249C((uint64_t *)&unk_8230);
  uint64_t v1 = type metadata accessor for SuggestionDetails(0LL);
  uint64_t v2 = swift_allocObject( v0,  ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL))
       + *(void *)(*(void *)(v1 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v2 + 16) = xmmword_3830;
  sub_2268();
  return v2;
}

uint64_t sub_32A4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc(async function pointer to InternalSuggestionsRepository.getAsyncPooledSuggestions()[1]);
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_3304;
  return InternalSuggestionsRepository.getAsyncPooledSuggestions()(a1, a2);
}

uint64_t sub_3304(uint64_t a1)
{
  uint64_t v4 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 16));
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_3354(uint64_t a1)
{
  unint64_t v2 = sub_31DC();
  return SuggestionsRepository.getOwner()(a1, v2);
}

unint64_t sub_3390()
{
  unint64_t result = qword_8218;
  if (!qword_8218)
  {
    unint64_t result = swift_getWitnessTable(&unk_3B6C, &type metadata for VideoSuggestionsRepository);
    atomic_store(result, (unint64_t *)&qword_8218);
  }

  return result;
}

unint64_t sub_33D0()
{
  unint64_t result = qword_8228;
  if (!qword_8228)
  {
    unint64_t result = swift_getWitnessTable(&unk_3B94, &type metadata for VideoSuggestionsRepository);
    atomic_store(result, (unint64_t *)&qword_8228);
  }

  return result;
}
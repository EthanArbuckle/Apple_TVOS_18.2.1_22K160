void *SuggestionConstants.serverPayloadKey.unsafeMutableAddressor()
{
  return &static SuggestionConstants.serverPayloadKey;
}

unint64_t static SuggestionConstants.serverPayloadKey.getter()
{
  return 0xD000000000000017LL;
}

void *SuggestionConstants.alternateQueryPayloadKey.unsafeMutableAddressor()
{
  return &static SuggestionConstants.alternateQueryPayloadKey;
}

unint64_t static SuggestionConstants.alternateQueryPayloadKey.getter()
{
  return 0xD000000000000015LL;
}

void *SuggestionConstants.alternateSuggestionId.unsafeMutableAddressor()
{
  return &static SuggestionConstants.alternateSuggestionId;
}

unint64_t static SuggestionConstants.alternateSuggestionId.getter()
{
  return 0xD000000000000013LL;
}

void *SuggestionConstants.relatedQuestionsPayloadKey.unsafeMutableAddressor()
{
  return &static SuggestionConstants.relatedQuestionsPayloadKey;
}

unint64_t static SuggestionConstants.relatedQuestionsPayloadKey.getter()
{
  return 0xD000000000000017LL;
}

void *SuggestionConstants.relatedQuestionsSuggestionId.unsafeMutableAddressor()
{
  return &static SuggestionConstants.relatedQuestionsSuggestionId;
}

unint64_t static SuggestionConstants.relatedQuestionsSuggestionId.getter()
{
  return 0xD000000000000010LL;
}

void *SuggestionConstants.serverSuggestionId.unsafeMutableAddressor()
{
  return &static SuggestionConstants.serverSuggestionId;
}

unint64_t static SuggestionConstants.serverSuggestionId.getter()
{
  return 0xD000000000000014LL;
}

void *SuggestionConstants.serverSuggestionIdMath.unsafeMutableAddressor()
{
  return &static SuggestionConstants.serverSuggestionIdMath;
}

unint64_t static SuggestionConstants.serverSuggestionIdMath.getter()
{
  return 0xD000000000000018LL;
}

void one-time initialization function for serverIntentName()
{
  static SuggestionConstants.serverIntentName = 0x614E746E65746E69LL;
  unk_189C0 = 0xEA0000000000656DLL;
}

uint64_t *SuggestionConstants.serverIntentName.unsafeMutableAddressor()
{
  if (one-time initialization token for serverIntentName != -1) {
    swift_once( &one-time initialization token for serverIntentName,  one-time initialization function for serverIntentName);
  }
  return &static SuggestionConstants.serverIntentName;
}

uint64_t static SuggestionConstants.serverIntentName.getter()
{
  if (one-time initialization token for serverIntentName != -1) {
    swift_once( &one-time initialization token for serverIntentName,  one-time initialization function for serverIntentName);
  }
  uint64_t v0 = static SuggestionConstants.serverIntentName;
  swift_bridgeObjectRetain(unk_189C0);
  return v0;
}

void *SuggestionConstants.serverExampleUtterance.unsafeMutableAddressor()
{
  return &static SuggestionConstants.serverExampleUtterance;
}

unint64_t static SuggestionConstants.serverExampleUtterance.getter()
{
  return 0xD000000000000010LL;
}

uint64_t one-time initialization function for kOwnerInformation(uint64_t a1)
{
  return one-time initialization function for kOwnerInformation( a1,  0x74616D726F666E49LL,  0xEB000000006E6F69LL,  &static SuggestionConstants.kOwnerInformation);
}

uint64_t *SuggestionConstants.kOwnerInformation.unsafeMutableAddressor()
{
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once( &one-time initialization token for kOwnerInformation,  one-time initialization function for kOwnerInformation);
  }
  return &static SuggestionConstants.kOwnerInformation;
}

uint64_t static SuggestionConstants.kOwnerInformation.getter()
{
  return static SuggestionConstants.kOwnerInformation.getter( &one-time initialization token for kOwnerInformation,  &static SuggestionConstants.kOwnerInformation);
}

uint64_t one-time initialization function for kOwnerMaps(uint64_t a1)
{
  return one-time initialization function for kOwnerInformation( a1,  0x6F654769726953LL,  0xE700000000000000LL,  &static SuggestionConstants.kOwnerMaps);
}

uint64_t one-time initialization function for kOwnerInformation( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = type metadata accessor for DomainOwner(0LL);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  uint64_t result = DomainOwner.init(_:)(a2, a3);
  *a4 = result;
  return result;
}

uint64_t *SuggestionConstants.kOwnerMaps.unsafeMutableAddressor()
{
  if (one-time initialization token for kOwnerMaps != -1) {
    swift_once(&one-time initialization token for kOwnerMaps, one-time initialization function for kOwnerMaps);
  }
  return &static SuggestionConstants.kOwnerMaps;
}

uint64_t static SuggestionConstants.kOwnerMaps.getter()
{
  return static SuggestionConstants.kOwnerInformation.getter( &one-time initialization token for kOwnerMaps,  &static SuggestionConstants.kOwnerMaps);
}

uint64_t static SuggestionConstants.kOwnerInformation.getter(void *a1, void *a2)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  return swift_retain(*a2);
}

uint64_t one-time initialization function for mathSuggestionIntents()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Apple_Parsec_Siri_V2alpha_SuggestionIntent>);
  uint64_t v1 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SuggestionIntent(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = swift_allocObject(v0, v5 + 6 * v3, v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_114C0;
  uint64_t v7 = v6 + v5;
  v8 = *(void (**)(uint64_t, void, uint64_t))(v2 + 104);
  v8(v7, enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.mathResult(_:), v1);
  v8(v7 + v3, enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.mathDecimalToFraction(_:), v1);
  v8(v7 + 2 * v3, enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.mathTipCalculation(_:), v1);
  v8(v7 + 3 * v3, enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.mathPythagoreanTheorem(_:), v1);
  v8(v7 + 4 * v3, enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.mathArithmetic(_:), v1);
  uint64_t result = ((uint64_t (*)(uint64_t, void, uint64_t))v8)( v7 + 5 * v3,  enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.kgSimpleMathConcept(_:),  v1);
  static SuggestionConstants.mathSuggestionIntents = v6;
  return result;
}

uint64_t *SuggestionConstants.mathSuggestionIntents.unsafeMutableAddressor()
{
  if (one-time initialization token for mathSuggestionIntents != -1) {
    swift_once( &one-time initialization token for mathSuggestionIntents,  one-time initialization function for mathSuggestionIntents);
  }
  return &static SuggestionConstants.mathSuggestionIntents;
}

uint64_t static SuggestionConstants.mathSuggestionIntents.getter()
{
  return static SuggestionConstants.mathSuggestionIntents.getter( &one-time initialization token for mathSuggestionIntents,  &static SuggestionConstants.mathSuggestionIntents);
}

uint64_t one-time initialization function for t41Locales()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
  uint64_t v1 = *(void *)(type metadata accessor for Locale(0LL) - 8);
  uint64_t v2 = swift_allocObject( v0,  ((*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
       + 41LL * *(void *)(v1 + 72),
         *(unsigned __int8 *)(v1 + 80) | 7LL);
  *(_OWORD *)(v2 + 16) = xmmword_114D0;
  Locale.init(identifier:)(0x53552D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4E432D687ALL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x42472D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x55412D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x41432D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4E492D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x45442D6564LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x504A2D616ALL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x52462D7266LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x584D2D7365LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x53452D7365LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x53552D7365LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4B482D687ALL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x57542D687ALL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4E432D657579LL, 0xE600000000000000LL);
  Locale.init(identifier:)(0x524B2D6F6BLL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x55522D7572LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x54492D7469LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x52542D7274LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x41532D7261LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x47532D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x41432D7266LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x54412D6564LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x45492D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x5A4E2D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x45422D7266LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x45422D6C6ELL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x48432D6564LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x48432D7266LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x48432D7469LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4C4E2D6C6ELL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x45532D7673LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4F4E2D626ELL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4B442D6164LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x49462D6966LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4C492D6568LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x52422D7470LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x48542D6874LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x415A2D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4C432D7365LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x594D2D736DLL, 0xE500000000000000LL);
  uint64_t result = destructiveProjectEnumData for SiriSuggestionsFeatureFlags(v2);
  static SuggestionConstants.t41Locales = result;
  return result;
}

uint64_t *SuggestionConstants.t41Locales.unsafeMutableAddressor()
{
  if (one-time initialization token for t41Locales != -1) {
    swift_once(&one-time initialization token for t41Locales, one-time initialization function for t41Locales);
  }
  return &static SuggestionConstants.t41Locales;
}

uint64_t static SuggestionConstants.t41Locales.getter()
{
  return static SuggestionConstants.mathSuggestionIntents.getter( &one-time initialization token for t41Locales,  &static SuggestionConstants.t41Locales);
}

uint64_t static SuggestionConstants.mathSuggestionIntents.getter(void *a1, void *a2)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  return swift_bridgeObjectRetain(*a2);
}

unint64_t variable initialization expression of SolarEventResolver.resolverTypeOperand()
{
  return 0xD000000000000010LL;
}

void default argument 1 of SolarEventResolver.resolveParameter(date:calendar:)()
{
  id v0 = [(id)objc_opt_self(NSCalendar) currentCalendar];
  static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
}

ValueMetadata *type metadata accessor for SuggestionConstants()
{
  return &type metadata for SuggestionConstants;
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

const char *SiriSuggestionsFeatureFlags.domain.getter()
{
  return "SiriAssistantSuggestions";
}

const char *SiriSuggestionsFeatureFlags.feature.getter()
{
  return "relatedQuestions";
}

uint64_t static SiriSuggestionsFeatureFlags.__derived_enum_equals(_:_:)()
{
  return 1LL;
}

void SiriSuggestionsFeatureFlags.hash(into:)()
{
}

Swift::Int SiriSuggestionsFeatureFlags.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SiriSuggestionsFeatureFlags( uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1, uint64_t a2)
{
  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  uint64_t v4 = type metadata accessor for DialogDetails(0LL);
  v3[15] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[16] = v5;
  v3[17] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch( static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL,  0LL);
}

uint64_t static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once( &one-time initialization token for kOwnerInformation,  one-time initialization function for kOwnerInformation);
  }
  uint64_t v1 = (int *)v0[12];
  uint64_t v2 = static SuggestionConstants.kOwnerInformation;
  v0[5] = type metadata accessor for DomainOwner(0LL);
  v0[6] = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type DomainOwner and conformance DomainOwner,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for DomainOwner,  (uint64_t)&protocol conformance descriptor for DomainOwner);
  v0[2] = v2;
  uint64_t v3 = v1[1];
  uint64_t v6 = (uint64_t (*)(void *))((char *)v1 + *v1);
  swift_retain(v2);
  uint64_t v4 = (void *)swift_task_alloc(v3);
  v0[18] = v4;
  *uint64_t v4 = v0;
  v4[1] = static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  return v6(v0 + 2);
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void *, uint64_t, uint64_t);
  uint64_t v10;
  void (*v11)(void *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v2 = *(void **)(v0 + 136);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v6 = swift_allocObject(&unk_14BC0, 24LL, 7LL);
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = swift_allocObject(&unk_14BE8, 32LL, 7LL);
  *(void *)(v7 + 16) = partial apply for implicit closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  *(void *)(v7 + 24) = v6;
  *uint64_t v2 = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any);
  v2[1] = v7;
  v8 = enum case for DialogDetails.catTemplateCallback(_:);
  v9 = *(void (**)(void *, uint64_t, uint64_t))(v3 + 104);
  v9(v2, enum case for DialogDetails.catTemplateCallback(_:), v4);
  v10 = dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)( 0xD000000000000013LL,  0x8000000000011DD0LL,  v2,  closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL);
  swift_release(v10);
  v11 = *(void (**)(void *, uint64_t))(v3 + 8);
  v11(v2, v4);
  v12 = swift_allocObject(&unk_14C10, 24LL, 7LL);
  *(void *)(v12 + 16) = v5;
  v13 = swift_allocObject(&unk_14C38, 32LL, 7LL);
  *(void *)(v13 + 16) = partial apply for implicit closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  *(void *)(v13 + 24) = v12;
  *uint64_t v2 = &thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)partial apply;
  v2[1] = v13;
  v9(v2, v8, v4);
  v14 = dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)( 0xD000000000000010LL,  0x8000000000011E10LL,  v2,  specialized closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL);
  swift_release(v14);
  v11(v2, v4);
  v15 = swift_allocObject(&unk_14C60, 24LL, 7LL);
  *(void *)(v15 + 16) = v5;
  v16 = swift_allocObject(&unk_14C88, 32LL, 7LL);
  *(void *)(v16 + 16) = partial apply for implicit closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  *(void *)(v16 + 24) = v15;
  *uint64_t v2 = &thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)partial apply;
  v2[1] = v16;
  v9(v2, v8, v4);
  v17 = dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)( 0xD000000000000014LL,  0x8000000000011E30LL,  v2,  closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL);
  swift_release(v17);
  v11(v2, v4);
  v18 = swift_allocObject(&unk_14CB0, 24LL, 7LL);
  *(void *)(v18 + 16) = v5;
  v19 = swift_allocObject(&unk_14CD8, 32LL, 7LL);
  *(void *)(v19 + 16) = partial apply for implicit closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  *(void *)(v19 + 24) = v18;
  *uint64_t v2 = &thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)partial apply;
  v2[1] = v19;
  v9(v2, v8, v4);
  v20 = dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)( 0xD000000000000018LL,  0x8000000000011E50LL,  v2,  closure #4 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL);
  v11(v2, v4);
  v21 = type metadata accessor for InfoServerGenerator();
  v22 = swift_allocObject(v21, 16LL, 7LL);
  *(void *)(v0 + 80) = v21;
  *(void *)(v0 + 88) = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type InfoServerGenerator and conformance InfoServerGenerator,  v23,  (uint64_t (*)(uint64_t))type metadata accessor for InfoServerGenerator,  (uint64_t)&protocol conformance descriptor for InfoServerGenerator);
  *(void *)(v0 + 56) = v22;
  v24 = dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)(v0 + 56);
  swift_release(v20);
  swift_release(v24);
  __swift_destroy_boxed_opaque_existential_1Tm((void *)(v0 + 56));
  v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<OwnerDefinition>);
  v26 = swift_allocObject(v25, 72LL, 7LL);
  *(_OWORD *)(v26 + 16) = xmmword_11530;
  dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
  swift_release(v1);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v26);
}

uint64_t static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1)
{
  uint64_t v2 = (void *)(*(void *)v1 + 16LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 144LL);
  *(void *)(*(void *)v1 + 152LL) = a1;
  swift_task_dealloc(v3);
  __swift_destroy_boxed_opaque_existential_1Tm(v2);
  return swift_task_switch( static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL,  0LL);
}

uint64_t sub_5E50()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t static InfoServerSuggestionDefinitionFactory.serverUtteranceMapper(dialogProperties:)@<X0>( void *a1@<X0>, void *a2@<X8>)
{
  v56 = a2;
  uint64_t v3 = type metadata accessor for BehaviorAfterSpeaking(0LL);
  uint64_t v54 = *(void *)(v3 - 8);
  uint64_t v55 = v3;
  __chkstk_darwin();
  uint64_t v5 = (char *)v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TemplatingText?);
  __chkstk_darwin();
  v53 = (char *)v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v52 = type metadata accessor for TemplatingText(0LL);
  uint64_t v7 = *(void *)(v52 - 8);
  __chkstk_darwin();
  v9 = (char *)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance?);
  __chkstk_darwin();
  v11 = (char *)v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin();
  v15 = (char *)v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = a1[3];
  uint64_t v17 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v16);
  uint64_t v18 = dispatch thunk of DialogProperties.getParameters()(v16, v17);
  if (!*(void *)(v18 + 16)
    || (unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010LL, 0x8000000000011E70LL), (v20 & 1) == 0))
  {
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    swift_bridgeObjectRelease(v18);
    goto LABEL_9;
  }

  outlined init with copy of Any(*(void *)(v18 + 56) + 32 * v19, (uint64_t)&v57);
  swift_bridgeObjectRelease(v18);
  if (!*((void *)&v58 + 1))
  {
LABEL_9:
    outlined destroy of Any?((uint64_t)&v57, &demangling cache variable for type metadata for Any?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1LL, 1LL, v12);
    goto LABEL_10;
  }

  int v21 = swift_dynamicCast(v11, &v57, (char *)&type metadata for Any + 8, v12, 6LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, v21 ^ 1u, 1LL, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1LL, v12) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    if (one-time initialization token for serverIntentName != -1) {
      swift_once( &one-time initialization token for serverIntentName,  one-time initialization function for serverIntentName);
    }
    uint64_t v22 = unk_189C0;
    uint64_t v51 = static SuggestionConstants.serverIntentName;
    uint64_t v49 = unk_189C0;
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<TemplatingSection>);
    uint64_t v24 = *(void *)(type metadata accessor for TemplatingSection(0LL) - 8);
    uint64_t v25 = *(void *)(v24 + 72);
    uint64_t v26 = *(unsigned __int8 *)(v24 + 80);
    uint64_t v27 = (v26 + 32) & ~v26;
    uint64_t v28 = swift_allocObject(v23, v27 + v25, v26 | 7);
    uint64_t v50 = v28;
    *(_OWORD *)(v28 + 16) = xmmword_11530;
    v48[1] = v28 + v27;
    uint64_t v29 = swift_bridgeObjectRetain(v22);
    uint64_t v30 = Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance.print.getter(v29);
    uint64_t v32 = v31;
    uint64_t v33 = Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance.speak.getter();
    TemplatingText.init(text:speakableTextOverride:)(v30, v32, v33, v34);
    v35 = v53;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v53, 1LL, 1LL, v52);
    TemplatingSection.init(id:content:caption:spokenOnly:)(0xD000000000000010LL, 0x8000000000011E70LL, v9, v35, 0LL);
    (*(void (**)(char *, void, uint64_t))(v54 + 104))( v5,  enum case for BehaviorAfterSpeaking.defaultBehavior(_:),  v55);
    uint64_t v36 = type metadata accessor for TemplatingResult(0LL);
    v37 = v56;
    v56[3] = v36;
    __swift_allocate_boxed_opaque_existential_0Tm(v37);
    TemplatingResult.init(templateIdentifier:sections:behaviorAfterSpeaking:)(v51, v49, v50, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }

LABEL_10:
  outlined destroy of Any?( (uint64_t)v11,  &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance?);
  if (one-time initialization token for suggestions != -1) {
    swift_once(&one-time initialization token for suggestions, one-time initialization function for suggestions);
  }
  uint64_t v39 = type metadata accessor for Logger(0LL);
  uint64_t v40 = __swift_project_value_buffer(v39, (uint64_t)static Logger.suggestions);
  v41 = (os_log_s *)Logger.logObject.getter(v40);
  os_log_type_t v42 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v43 = 0;
    _os_log_impl(&dword_0, v41, v42, "Unable to find example utterance in dialog parameter", v43, 2u);
    swift_slowDealloc(v43, -1LL, -1LL);
  }

  if (one-time initialization token for serverIntentName != -1) {
    swift_once( &one-time initialization token for serverIntentName,  one-time initialization function for serverIntentName);
  }
  uint64_t v44 = static SuggestionConstants.serverIntentName;
  uint64_t v45 = unk_189C0;
  (*(void (**)(char *, void, uint64_t))(v54 + 104))( v5,  enum case for BehaviorAfterSpeaking.defaultBehavior(_:),  v55);
  uint64_t v46 = type metadata accessor for TemplatingResult(0LL);
  v47 = v56;
  v56[3] = v46;
  __swift_allocate_boxed_opaque_existential_0Tm(v47);
  swift_bridgeObjectRetain(v45);
  return TemplatingResult.init(templateIdentifier:sections:behaviorAfterSpeaking:)( v44,  v45,  &_swiftEmptyArrayStorage,  v5);
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)( uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)(*(uint64_t (**)(void))(v3 + 8));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)( uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void (**)(uint64_t))(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc(dword_1840C);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any);
  return ((uint64_t (*)(uint64_t, uint64_t, void (*)(uint64_t)))((char *)&async function pointer to thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)
                                                                                 + async function pointer to thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)))( a1,  a2,  v6);
}

uint64_t closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1)
{
  uint64_t v3 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = *(void *)(a1 + 40);
  __int128 v38 = *(_OWORD *)(a1 + 24);
  uint64_t v5 = v38;
  *(void *)&__int128 v39 = __swift_project_boxed_opaque_existential_1Tm((void *)a1, v38);
  if (one-time initialization token for serverIntentName != -1) {
    swift_once( &one-time initialization token for serverIntentName,  one-time initialization function for serverIntentName);
  }
  uint64_t v6 = static SuggestionConstants.serverIntentName;
  uint64_t v7 = unk_189C0;
  uint64_t v8 = type metadata accessor for FromContextResolver();
  v9 = (void *)swift_allocObject(v8, 48LL, 7LL);
  v9[2] = v6;
  v9[3] = v7;
  v9[4] = &async function pointer to closure #1 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  v9[5] = 0LL;
  *(void *)&__int128 v50 = v8;
  uint64_t v11 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type FromContextResolver and conformance FromContextResolver,  v10,  (uint64_t (*)(uint64_t))type metadata accessor for FromContextResolver,  (uint64_t)&protocol conformance descriptor for FromContextResolver);
  *((void *)&v50 + 1) = v11;
  v49[0] = v9;
  type metadata accessor for ResolvableParameter(0LL);
  uint64_t v12 = swift_bridgeObjectRetain_n(v7, 2LL);
  static SuggestionTransformers.removeParameterFromLogging()(v12);
  uint64_t v13 = ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v6, v7, 1LL, v3);
  __int128 v53 = v38;
  uint64_t v54 = v4;
  __swift_allocate_boxed_opaque_existential_0Tm(v52);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v6, v7, v49, v13, v5, v4);
  swift_release(v13);
  outlined destroy of Any?((uint64_t)v49, &demangling cache variable for type metadata for Resolver?);
  uint64_t v14 = v54;
  __int128 v39 = v53;
  uint64_t v15 = v53;
  __swift_project_boxed_opaque_existential_1Tm(v52, v53);
  uint64_t v16 = (void *)swift_allocObject(v8, 48LL, 7LL);
  v16[2] = 0xD000000000000010LL;
  v16[3] = 0x8000000000011E70LL;
  v16[4] = &async function pointer to closure #2 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  v16[5] = 0LL;
  *(void *)&__int128 v47 = v8;
  *((void *)&v47 + 1) = v11;
  v46[0] = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  Transformer.init(transform:)( closure #3 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL,  (char *)&type metadata for Any + 8,  v17);
  uint64_t v18 = ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)( 0xD000000000000010LL,  0x8000000000011E70LL,  1LL,  v3);
  __int128 v50 = v39;
  uint64_t v51 = v14;
  __swift_allocate_boxed_opaque_existential_0Tm(v49);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)( 0xD000000000000010LL,  0x8000000000011E70LL,  v46,  v18,  v15,  v14);
  swift_release(v18);
  outlined destroy of Any?((uint64_t)v46, &demangling cache variable for type metadata for Resolver?);
  uint64_t v19 = v51;
  __int128 v38 = v50;
  uint64_t v20 = v50;
  __swift_project_boxed_opaque_existential_1Tm(v49, v50);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  uint64_t v22 = type metadata accessor for VersionedInvocation(0LL);
  uint64_t v23 = swift_allocObject( v21,  ((*(unsigned __int8 *)(*(void *)(v22 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v22 - 8) + 80LL))
        + *(void *)(*(void *)(v22 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v22 - 8) + 80LL) | 7LL);
  __int128 v39 = xmmword_11530;
  *(_OWORD *)(v23 + 16) = xmmword_11530;
  static VersionedInvocations.latest.getter();
  __int128 v47 = v38;
  uint64_t v48 = v19;
  __swift_allocate_boxed_opaque_existential_0Tm(v46);
  dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)(v23, v20, v19);
  swift_bridgeObjectRelease(v23);
  uint64_t v24 = v48;
  __int128 v38 = v47;
  uint64_t v25 = v47;
  __swift_project_boxed_opaque_existential_1Tm(v46, v47);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeliveryVehicle>);
  uint64_t v27 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(unsigned __int8 *)(v28 + 80);
  uint64_t v30 = (v29 + 32) & ~v29;
  uint64_t v31 = swift_allocObject(v26, v30 + *(void *)(v28 + 72), v29 | 7);
  *(_OWORD *)(v31 + 16) = v39;
  (*(void (**)(uint64_t, void, uint64_t))(v28 + 104))( v31 + v30,  enum case for DeliveryVehicle.assistantSuggestions(_:),  v27);
  __int128 v44 = v38;
  uint64_t v45 = v24;
  __swift_allocate_boxed_opaque_existential_0Tm(v43);
  dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)(v31, v25, v24);
  swift_bridgeObjectRelease(v31);
  uint64_t v32 = v45;
  __int128 v38 = v44;
  uint64_t v33 = v44;
  __swift_project_boxed_opaque_existential_1Tm(v43, v44);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
  uint64_t v35 = type metadata accessor for Locale(0LL);
  uint64_t v36 = swift_allocObject( v34,  ((*(unsigned __int8 *)(*(void *)(v35 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v35 - 8) + 80LL))
        + *(void *)(*(void *)(v35 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v35 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v36 + 16) = v39;
  Locale.init(identifier:)(0x53552D6E65LL, 0xE500000000000000LL);
  __int128 v41 = v38;
  uint64_t v42 = v32;
  __swift_allocate_boxed_opaque_existential_0Tm(v40);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)(v36, v33, v32);
  swift_bridgeObjectRelease(v36);
  __swift_destroy_boxed_opaque_existential_1Tm(v40);
  __swift_destroy_boxed_opaque_existential_1Tm(v43);
  __swift_destroy_boxed_opaque_existential_1Tm(v46);
  __swift_destroy_boxed_opaque_existential_1Tm(v49);
  return __swift_destroy_boxed_opaque_existential_1Tm(v52);
}

uint64_t closure #1 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v3[7] = swift_getObjectType(a2);
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  return swift_task_switch( closure #1 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  v4,  v5);
}

uint64_t closure #1 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  Swift::String_optional v1 = Context.getServerIntent()();
  v0[1] = v1;
  v0[4].value._countAndFlagsBits = (uint64_t)v1.value._object;
  return swift_task_switch( closure #1 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL,  0LL);
}

Swift::String_optional __swiftcall Context.getServerIntent()()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once( &one-time initialization token for kOwnerInformation,  one-time initialization function for kOwnerInformation);
  }
  uint64_t v4 = static SuggestionConstants.kOwnerInformation;
  v11[3] = type metadata accessor for DomainOwner(0LL);
  v11[4] = &protocol witness table for DomainOwner;
  v11[0] = v4;
  uint64_t v5 = one-time initialization token for serverIntentName;
  swift_retain(v4);
  if (v5 != -1) {
    swift_once( &one-time initialization token for serverIntentName,  one-time initialization function for serverIntentName);
  }
  Context.getParam(for:key:)(v12, v11, static SuggestionConstants.serverIntentName, unk_189C0, v3, v2);
  __swift_destroy_boxed_opaque_existential_1Tm(v11);
  if (v12[3])
  {
    int v6 = swift_dynamicCast(v11, v12, (char *)&type metadata for Any + 8, &type metadata for String, 6LL);
    BOOL v7 = v6 == 0;
    if (v6) {
      uint64_t v8 = v11[0];
    }
    else {
      uint64_t v8 = 0LL;
    }
    if (v7) {
      v9 = 0LL;
    }
    else {
      v9 = (void *)v11[1];
    }
  }

  else
  {
    outlined destroy of Any?((uint64_t)v12, &demangling cache variable for type metadata for Any?);
    uint64_t v8 = 0LL;
    v9 = 0LL;
  }

  result.value._object = v9;
  result.value._countAndFlagsBits = v8;
  return result;
}

void *FromContextResolver.__allocating_init(resolverTypeOperand:propertyExtractor:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  Swift::String_optional result = (void *)swift_allocObject(v4, 48LL, 7LL);
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

uint64_t closure #2 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance?);
  v3[5] = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v3[6] = swift_getObjectType(a2);
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return swift_task_switch( closure #2 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  v6,  v7);
}

uint64_t closure #2 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  return swift_task_switch( closure #2 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL,  0LL);
}

uint64_t Context.getUtterance()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once( &one-time initialization token for kOwnerInformation,  one-time initialization function for kOwnerInformation);
  }
  uint64_t v6 = static SuggestionConstants.kOwnerInformation;
  v11[3] = type metadata accessor for DomainOwner(0LL);
  v11[4] = &protocol witness table for DomainOwner;
  v11[0] = v6;
  swift_retain(v6);
  Context.getParam(for:key:)(v12, v11, 0xD000000000000010LL, 0x8000000000011E70LL, a1, a2);
  __swift_destroy_boxed_opaque_existential_1Tm(v11);
  if (v12[3])
  {
    uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance(0LL);
    int v8 = swift_dynamicCast(a3, v12, (char *)&type metadata for Any + 8, v7, 6LL);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( a3,  v8 ^ 1u,  1LL,  v7);
  }

  else
  {
    outlined destroy of Any?((uint64_t)v12, &demangling cache variable for type metadata for Any?);
    uint64_t v10 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))( a3,  1LL,  1LL,  v10);
  }
}

uint64_t closure #3 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)@<X0>( uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin();
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = UUID.init()(v4);
  uint64_t v8 = UUID.uuidString.getter(v7);
  uint64_t v10 = v9;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  a1[3] = (uint64_t)&type metadata for String;
  *a1 = v8;
  a1[1] = v10;
  return result;
}

uint64_t sub_6E68()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t partial apply for implicit closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)@<X0>( void *a1@<X0>, void *a2@<X8>)
{
  return static InfoServerSuggestionDefinitionFactory.serverUtteranceMapper(dialogProperties:)(a1, a2);
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)partial apply( uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void (**)(uint64_t))(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc(dword_1840C);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)partial apply;
  return ((uint64_t (*)(uint64_t, uint64_t, void (*)(uint64_t)))((char *)&async function pointer to thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)
                                                                                 + async function pointer to thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)))( a1,  a2,  v6);
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)partial apply()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t closure #1 in closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance?);
  v3[5] = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v3[6] = swift_getObjectType(a2);
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return swift_task_switch( closure #1 in closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  v6,  v7);
}

uint64_t closure #1 in closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  return swift_task_switch( closure #1 in closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL,  0LL);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *boxed_opaque_existential_0Tm;
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1LL, v2);
  uint64_t v5 = *(void *)(v0 + 16);
  if (v4 == 1)
  {
    outlined destroy of Any?( v1,  &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance?);
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
  }

  else
  {
    *(void *)(v5 + 24) = v2;
    boxed_opaque_existential_0Tm = __swift_allocate_boxed_opaque_existential_0Tm((void *)v5);
    (*(void (**)(void *, uint64_t, uint64_t))(v3 + 32))(boxed_opaque_existential_0Tm, v1, v2);
  }

  swift_task_dealloc(*(void *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer.unsafeMutableAddressor()
{
  if (one-time initialization token for utteranceToLoggingIdTransformer != -1) {
    swift_once( &one-time initialization token for utteranceToLoggingIdTransformer,  one-time initialization function for utteranceToLoggingIdTransformer);
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Any, Any?>);
  return __swift_project_value_buffer( v0,  (uint64_t)static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer);
}

uint64_t closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1)
{
  uint64_t v3 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = *(void *)(a1 + 40);
  __int128 v39 = *(_OWORD *)(a1 + 24);
  uint64_t v5 = v39;
  __swift_project_boxed_opaque_existential_1Tm((void *)a1, v39);
  if (one-time initialization token for serverIntentName != -1) {
    swift_once( &one-time initialization token for serverIntentName,  one-time initialization function for serverIntentName);
  }
  uint64_t v6 = static SuggestionConstants.serverIntentName;
  uint64_t v7 = unk_189C0;
  uint64_t v8 = type metadata accessor for FromContextResolver();
  uint64_t v9 = (void *)swift_allocObject(v8, 48LL, 7LL);
  v9[2] = v6;
  v9[3] = v7;
  v9[4] = &async function pointer to closure #1 in closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  v9[5] = 0LL;
  *(void *)&__int128 v50 = v8;
  uint64_t v11 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type FromContextResolver and conformance FromContextResolver,  v10,  (uint64_t (*)(uint64_t))type metadata accessor for FromContextResolver,  (uint64_t)&protocol conformance descriptor for FromContextResolver);
  *((void *)&v50 + 1) = v11;
  v49[0] = v9;
  type metadata accessor for ResolvableParameter(0LL);
  uint64_t v12 = swift_bridgeObjectRetain_n(v7, 2LL);
  static SuggestionTransformers.passthroughParameterForLogging()(v12);
  uint64_t v13 = ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v6, v7, 1LL, v3);
  __int128 v53 = v39;
  uint64_t v54 = v4;
  __swift_allocate_boxed_opaque_existential_0Tm(v52);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v6, v7, v49, v13, v5, v4);
  swift_release(v13);
  outlined destroy of Any?((uint64_t)v49, &demangling cache variable for type metadata for Resolver?);
  uint64_t v14 = v54;
  __int128 v39 = v53;
  uint64_t v15 = v53;
  __swift_project_boxed_opaque_existential_1Tm(v52, v53);
  uint64_t v16 = (void *)swift_allocObject(v8, 48LL, 7LL);
  v16[2] = 0xD000000000000010LL;
  v16[3] = 0x8000000000011E70LL;
  v16[4] = &async function pointer to closure #2 in closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  v16[5] = 0LL;
  *(void *)&__int128 v47 = v8;
  *((void *)&v47 + 1) = v11;
  v46[0] = v16;
  uint64_t v17 = ResolvableParameter.__allocating_init(typeIdentifier:required:)(0xD000000000000010LL, 0x8000000000011E70LL, 1LL);
  __int128 v50 = v39;
  uint64_t v51 = v14;
  __swift_allocate_boxed_opaque_existential_0Tm(v49);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)( 0xD000000000000010LL,  0x8000000000011E70LL,  v46,  v17,  v15,  v14);
  swift_release(v17);
  outlined destroy of Any?((uint64_t)v46, &demangling cache variable for type metadata for Resolver?);
  uint64_t v18 = v51;
  __int128 v38 = v50;
  uint64_t v19 = v50;
  __swift_project_boxed_opaque_existential_1Tm(v49, v50);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  uint64_t v21 = type metadata accessor for VersionedInvocation(0LL);
  uint64_t v22 = swift_allocObject( v20,  ((*(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL))
        + *(void *)(*(void *)(v21 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL) | 7LL);
  __int128 v39 = xmmword_11530;
  *(_OWORD *)(v22 + 16) = xmmword_11530;
  static VersionedInvocations.HintsDawnA.getter();
  __int128 v47 = v38;
  uint64_t v48 = v18;
  __swift_allocate_boxed_opaque_existential_0Tm(v46);
  dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)(v22, v19, v18);
  swift_bridgeObjectRelease(v22);
  uint64_t v23 = v48;
  __int128 v38 = v47;
  uint64_t v24 = v47;
  __swift_project_boxed_opaque_existential_1Tm(v46, v47);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeliveryVehicle>);
  uint64_t v26 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(unsigned __int8 *)(v27 + 80);
  uint64_t v29 = (v28 + 32) & ~v28;
  uint64_t v30 = swift_allocObject(v25, v29 + *(void *)(v27 + 72), v28 | 7);
  *(_OWORD *)(v30 + 16) = v39;
  uint64_t v31 = v30 + v29;
  uint64_t v32 = enum case for SiriHintsMode.display(_:);
  uint64_t v33 = type metadata accessor for SiriHintsMode(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 104LL))(v31, v32, v33);
  (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v31, enum case for DeliveryVehicle.siriHints(_:), v26);
  __int128 v44 = v38;
  uint64_t v45 = v23;
  __swift_allocate_boxed_opaque_existential_0Tm(v43);
  dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)(v30, v24, v23);
  swift_bridgeObjectRelease(v30);
  uint64_t v34 = v45;
  __int128 v39 = v44;
  uint64_t v35 = v44;
  __swift_project_boxed_opaque_existential_1Tm(v43, v44);
  if (one-time initialization token for t41Locales != -1) {
    swift_once(&one-time initialization token for t41Locales, one-time initialization function for t41Locales);
  }
  uint64_t v36 = static SuggestionConstants.t41Locales;
  __int128 v41 = v39;
  uint64_t v42 = v34;
  __swift_allocate_boxed_opaque_existential_0Tm(v40);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)(v36, v35, v34);
  __swift_destroy_boxed_opaque_existential_1Tm(v40);
  __swift_destroy_boxed_opaque_existential_1Tm(v43);
  __swift_destroy_boxed_opaque_existential_1Tm(v46);
  __swift_destroy_boxed_opaque_existential_1Tm(v49);
  return __swift_destroy_boxed_opaque_existential_1Tm(v52);
}

uint64_t closure #1 in closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v3[7] = swift_getObjectType(a2);
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  return swift_task_switch( closure #1 in closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  v4,  v5);
}

uint64_t closure #1 in closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  Swift::String_optional v1 = Context.getServerIntent()();
  v0[1] = v1;
  v0[4].value._countAndFlagsBits = (uint64_t)v1.value._object;
  return swift_task_switch( closure #1 in closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL,  0LL);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _OWORD *v5;
  Swift::String_optional v1 = *(void *)(v0 + 64);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 16);
    uint64_t v3 = *(void **)(v0 + 32);
    v3[3] = &type metadata for String;
    *uint64_t v3 = v2;
    v3[1] = v1;
  }

  else
  {
    uint64_t v5 = *(_OWORD **)(v0 + 32);
    *uint64_t v5 = 0u;
    v5[1] = 0u;
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #4 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1)
{
  uint64_t v3 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = *(void *)(a1 + 40);
  __int128 v39 = *(_OWORD *)(a1 + 24);
  uint64_t v5 = v39;
  __swift_project_boxed_opaque_existential_1Tm((void *)a1, v39);
  if (one-time initialization token for serverIntentName != -1) {
    swift_once( &one-time initialization token for serverIntentName,  one-time initialization function for serverIntentName);
  }
  uint64_t v6 = static SuggestionConstants.serverIntentName;
  uint64_t v7 = unk_189C0;
  uint64_t v8 = type metadata accessor for FromContextResolver();
  uint64_t v9 = (void *)swift_allocObject(v8, 48LL, 7LL);
  v9[2] = v6;
  v9[3] = v7;
  v9[4] = &async function pointer to closure #1 in closure #4 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  v9[5] = 0LL;
  *(void *)&__int128 v50 = v8;
  uint64_t v11 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type FromContextResolver and conformance FromContextResolver,  v10,  (uint64_t (*)(uint64_t))type metadata accessor for FromContextResolver,  (uint64_t)&protocol conformance descriptor for FromContextResolver);
  *((void *)&v50 + 1) = v11;
  v49[0] = v9;
  type metadata accessor for ResolvableParameter(0LL);
  uint64_t v12 = swift_bridgeObjectRetain_n(v7, 2LL);
  static SuggestionTransformers.passthroughParameterForLogging()(v12);
  uint64_t v13 = ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)(v6, v7, 1LL, v3);
  __int128 v53 = v39;
  uint64_t v54 = v4;
  __swift_allocate_boxed_opaque_existential_0Tm(v52);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v6, v7, v49, v13, v5, v4);
  swift_release(v13);
  outlined destroy of Any?((uint64_t)v49, &demangling cache variable for type metadata for Resolver?);
  uint64_t v14 = v54;
  __int128 v39 = v53;
  uint64_t v15 = v53;
  __swift_project_boxed_opaque_existential_1Tm(v52, v53);
  uint64_t v16 = (void *)swift_allocObject(v8, 48LL, 7LL);
  v16[2] = 0xD000000000000010LL;
  v16[3] = 0x8000000000011E70LL;
  v16[4] = &async function pointer to closure #2 in closure #4 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  v16[5] = 0LL;
  *(void *)&__int128 v47 = v8;
  *((void *)&v47 + 1) = v11;
  v46[0] = v16;
  uint64_t v17 = ResolvableParameter.__allocating_init(typeIdentifier:required:)(0xD000000000000010LL, 0x8000000000011E70LL, 1LL);
  __int128 v50 = v39;
  uint64_t v51 = v14;
  __swift_allocate_boxed_opaque_existential_0Tm(v49);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)( 0xD000000000000010LL,  0x8000000000011E70LL,  v46,  v17,  v15,  v14);
  swift_release(v17);
  outlined destroy of Any?((uint64_t)v46, &demangling cache variable for type metadata for Resolver?);
  uint64_t v18 = v51;
  __int128 v38 = v50;
  uint64_t v19 = v50;
  __swift_project_boxed_opaque_existential_1Tm(v49, v50);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  uint64_t v21 = type metadata accessor for VersionedInvocation(0LL);
  uint64_t v22 = swift_allocObject( v20,  ((*(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL))
        + *(void *)(*(void *)(v21 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL) | 7LL);
  __int128 v39 = xmmword_11530;
  *(_OWORD *)(v22 + 16) = xmmword_11530;
  static VersionedInvocations.HintsDawnC.getter();
  __int128 v47 = v38;
  uint64_t v48 = v18;
  __swift_allocate_boxed_opaque_existential_0Tm(v46);
  dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)(v22, v19, v18);
  swift_bridgeObjectRelease(v22);
  uint64_t v23 = v48;
  __int128 v38 = v47;
  uint64_t v24 = v47;
  __swift_project_boxed_opaque_existential_1Tm(v46, v47);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeliveryVehicle>);
  uint64_t v26 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(unsigned __int8 *)(v27 + 80);
  uint64_t v29 = (v28 + 32) & ~v28;
  uint64_t v30 = swift_allocObject(v25, v29 + *(void *)(v27 + 72), v28 | 7);
  *(_OWORD *)(v30 + 16) = v39;
  uint64_t v31 = v30 + v29;
  uint64_t v32 = enum case for SiriHintsMode.display(_:);
  uint64_t v33 = type metadata accessor for SiriHintsMode(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 104LL))(v31, v32, v33);
  (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v31, enum case for DeliveryVehicle.siriHints(_:), v26);
  __int128 v44 = v38;
  uint64_t v45 = v23;
  __swift_allocate_boxed_opaque_existential_0Tm(v43);
  dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)(v30, v24, v23);
  swift_bridgeObjectRelease(v30);
  uint64_t v34 = v45;
  __int128 v39 = v44;
  uint64_t v35 = v44;
  __swift_project_boxed_opaque_existential_1Tm(v43, v44);
  if (one-time initialization token for t41Locales != -1) {
    swift_once(&one-time initialization token for t41Locales, one-time initialization function for t41Locales);
  }
  uint64_t v36 = static SuggestionConstants.t41Locales;
  __int128 v41 = v39;
  uint64_t v42 = v34;
  __swift_allocate_boxed_opaque_existential_0Tm(v40);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)(v36, v35, v34);
  __swift_destroy_boxed_opaque_existential_1Tm(v40);
  __swift_destroy_boxed_opaque_existential_1Tm(v43);
  __swift_destroy_boxed_opaque_existential_1Tm(v46);
  __swift_destroy_boxed_opaque_existential_1Tm(v49);
  return __swift_destroy_boxed_opaque_existential_1Tm(v52);
}

uint64_t InfoServerSuggestionDefinitionFactory.__allocating_init()()
{
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t one-time initialization function for utteranceToLoggingIdTransformer()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Any, Any?>);
  __swift_allocate_value_buffer(v0, static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer);
  __swift_project_value_buffer( v0,  (uint64_t)static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  return Transformer.init(transform:)( closure #1 in variable initialization expression of static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer,  0LL,  (char *)&type metadata for Any + 8,  v1);
}

void closure #1 in variable initialization expression of static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer( uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of Any(a1, (uint64_t)v33);
  char v11 = swift_dynamicCast(v6, v33, (char *)&type metadata for Any + 8, v7, 6LL);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  if ((v11 & 1) != 0)
  {
    v12(v6, 0LL, 1LL, v7);
    uint64_t v13 = (*(uint64_t (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    uint64_t v14 = Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance.print.getter(v13);
    uint64_t v16 = v15;
    v33[0] = v14;
    v33[1] = v15;
    uint64_t v31 = 32LL;
    v32[0] = 0xE100000000000000LL;
    v30[0] = 95LL;
    v30[1] = 0xE100000000000000LL;
    unint64_t v17 = lazy protocol witness table accessor for type String and conformance String();
    uint64_t v18 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v31,  v30,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v17,  v17,  v17);
    uint64_t v20 = v19;
    swift_bridgeObjectRelease(v16);
    *(void *)(a2 + 24) = &type metadata for String;
    *(void *)a2 = v18;
    *(void *)(a2 + 8) = v20;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }

  else
  {
    v12(v6, 1LL, 1LL, v7);
    outlined destroy of Any?( (uint64_t)v6,  &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance?);
    if (one-time initialization token for suggestions != -1) {
      swift_once(&one-time initialization token for suggestions, one-time initialization function for suggestions);
    }
    uint64_t v21 = type metadata accessor for Logger(0LL);
    __swift_project_value_buffer(v21, (uint64_t)static Logger.suggestions);
    uint64_t v22 = outlined init with copy of Any(a1, (uint64_t)v33);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v26 = swift_slowAlloc(32LL, -1LL);
      v30[0] = v26;
      v33[5] = v2;
      *(_DWORD *)uint64_t v25 = 136315138;
      outlined init with copy of Any((uint64_t)v33, (uint64_t)&v31);
      uint64_t v27 = String.init<A>(describing:)(&v31, (char *)&type metadata for Any + 8);
      unint64_t v29 = v28;
      uint64_t v31 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v28, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, v32, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease(v29);
      __swift_destroy_boxed_opaque_existential_1Tm(v33);
      _os_log_impl( &dword_0,  v23,  v24,  "Suggestion parameter must be resolved into instance of ServerSuggestionUtterance. It is: %s",  v25,  0xCu);
      swift_arrayDestroy(v26, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v26, -1LL, -1LL);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    else
    {
      __swift_destroy_boxed_opaque_existential_1Tm(v33);
    }

    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }

uint64_t static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer.getter@<X0>( uint64_t a1@<X8>)
{
  if (one-time initialization token for utteranceToLoggingIdTransformer != -1) {
    swift_once( &one-time initialization token for utteranceToLoggingIdTransformer,  one-time initialization function for utteranceToLoggingIdTransformer);
  }
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Any, Any?>);
  uint64_t v3 = __swift_project_value_buffer( v2,  (uint64_t)static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t InfoServerSuggestionDefinitionFactory.deinit()
{
  return v0;
}

uint64_t protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:) in conformance InfoServerSuggestionDefinitionFactory( uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_183FC);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:) in conformance InfoServerSuggestionDefinitionFactory;
  return static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(a1, a2);
}

uint64_t InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[75] = v3;
  v4[74] = a3;
  v4[73] = a1;
  uint64_t SuggestionCandidate = type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate(0LL);
  v4[76] = SuggestionCandidate;
  uint64_t v6 = *(void *)(SuggestionCandidate - 8);
  v4[77] = v6;
  v4[78] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t Suggestion = type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion(0LL);
  v4[79] = Suggestion;
  uint64_t v8 = *(void *)(Suggestion - 8);
  v4[80] = v8;
  v4[81] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate(0LL);
  v4[82] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v4[83] = v10;
  unint64_t v11 = (*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[84] = swift_task_alloc(v11);
  v4[85] = swift_task_alloc(v11);
  unint64_t v12 = (*(void *)(*(void *)(type metadata accessor for BinaryDecodingOptions(0LL) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[86] = swift_task_alloc(v12);
  v4[87] = swift_task_alloc(v12);
  v4[88] = swift_task_alloc(v12);
  uint64_t v13 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion(0LL);
  v4[89] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v4[90] = v14;
  unint64_t v15 = (*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[91] = swift_task_alloc(v15);
  v4[92] = swift_task_alloc(v15);
  return swift_task_switch(InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:), 0LL, 0LL);
}

uint64_t InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:)()
{
  if (one-time initialization token for suggestions != -1) {
    swift_once(&one-time initialization token for suggestions, one-time initialization function for suggestions);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = __swift_project_value_buffer(v1, (uint64_t)static Logger.suggestions);
  *(void *)(v0 + 744) = v2;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "Info suggestions running generators", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v6 = *(void **)(v0 + 584);

  uint64_t v7 = v6[3];
  uint64_t v8 = v6[4];
  __swift_project_boxed_opaque_existential_1Tm(v6, v7);
  uint64_t v9 = dispatch thunk of Interaction.executionParameters.getter(v7, v8);
  if (*(void *)(v9 + 16)
    && (unint64_t v10 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000017LL, 0x8000000000011D90LL), (v11 & 1) != 0))
  {
    outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v9 + 56) + 48 * v10, v0 + 16);
    swift_bridgeObjectRelease(v9);
    if (*(void *)(v0 + 40))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
      int v13 = swift_dynamicCast(v0 + 520, v0 + 16, v12, &type metadata for Data, 6LL);
      if (v13) {
        uint64_t v14 = *(void *)(v0 + 520);
      }
      else {
        uint64_t v14 = 0LL;
      }
      if (v13) {
        unint64_t v15 = *(void *)(v0 + 528);
      }
      else {
        unint64_t v15 = 0xF000000000000000LL;
      }
      goto LABEL_16;
    }
  }

  else
  {
    *(_OWORD *)(v0 + 32) = 0u;
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 16) = 0u;
    swift_bridgeObjectRelease(v9);
  }

  outlined destroy of Any?( v0 + 16,  &demangling cache variable for type metadata for (Decodable & Encodable & Sendable)?);
  uint64_t v14 = 0LL;
  unint64_t v15 = 0xF000000000000000LL;
LABEL_16:
  *(void *)(v0 + 760) = v15;
  *(void *)(v0 + 752) = v14;
  uint64_t v16 = dispatch thunk of Interaction.executionParameters.getter(v7, v8);
  if (*(void *)(v16 + 16)
    && (unint64_t v17 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000015LL, 0x8000000000011DB0LL), (v18 & 1) != 0))
  {
    outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v16 + 56) + 48 * v17, v0 + 64);
  }

  else
  {
    *(_OWORD *)(v0 + 80) = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 64) = 0u;
  }

  swift_bridgeObjectRelease(v16);
  if (*(void *)(v0 + 88))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
    int v20 = swift_dynamicCast(v0 + 552, v0 + 64, v19, &type metadata for Data, 6LL);
    uint64_t v21 = *(void *)(v0 + 552);
    if (v20)
    {
      unint64_t v22 = *(void *)(v0 + 560);
    }

    else
    {
      uint64_t v21 = 0LL;
      unint64_t v22 = 0xF000000000000000LL;
    }
  }

  else
  {
    outlined destroy of Any?( v0 + 64,  &demangling cache variable for type metadata for (Decodable & Encodable & Sendable)?);
    uint64_t v21 = 0LL;
    unint64_t v22 = 0xF000000000000000LL;
  }

  *(void *)(v0 + 776) = v22;
  *(void *)(v0 + 768) = v21;
  uint64_t v23 = dispatch thunk of Interaction.executionParameters.getter(v7, v8);
  if (*(void *)(v23 + 16)
    && (unint64_t v24 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000017LL, 0x8000000000011DF0LL), (v25 & 1) != 0))
  {
    outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v23 + 56) + 48 * v24, v0 + 112);
  }

  else
  {
    *(_OWORD *)(v0 + 128) = 0u;
    *(_OWORD *)(v0 + 144) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }

  swift_bridgeObjectRelease(v23);
  if (*(void *)(v0 + 136))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
    int v27 = swift_dynamicCast(v0 + 536, v0 + 112, v26, &type metadata for Data, 6LL);
    if (v27) {
      uint64_t v28 = *(void *)(v0 + 536);
    }
    else {
      uint64_t v28 = 0LL;
    }
    if (v27) {
      unint64_t v29 = *(void *)(v0 + 544);
    }
    else {
      unint64_t v29 = 0xF000000000000000LL;
    }
  }

  else
  {
    outlined destroy of Any?( v0 + 112,  &demangling cache variable for type metadata for (Decodable & Encodable & Sendable)?);
    uint64_t v28 = 0LL;
    unint64_t v29 = 0xF000000000000000LL;
  }

  *(void *)(v0 + 792) = v29;
  *(void *)(v0 + 784) = v28;
  if (v15 >> 60 == 15)
  {
    if (v22 >> 60 == 15)
    {
      if (v29 >> 60 != 15)
      {
        uint64_t v30 = 0LL;
        goto LABEL_54;
      }

{
  uint64_t v0;
  swift_task_dealloc(*(void *)(*(void *)v0 + 856LL));
  return swift_task_switch(InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:), 0LL, 0LL);
}

{
  uint64_t v0;
  uint64_t v1;
  char isUniquelyReferenced_nonNull_native;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  os_log_s *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  void (*v58)(void, unint64_t, void);
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  void (*v64)(void, unint64_t, void);
  void *v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  if (*(void *)(v0 + 464))
  {
    uint64_t v1 = *(void *)(v0 + 848);
    outlined init with take of CandidateSuggestion((__int128 *)(v0 + 440), v0 + 480);
    outlined init with copy of CandidateSuggestion(v0 + 480, v0 + 360);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v1);
    uint64_t v3 = *(char **)(v0 + 848);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *((void *)v3 + 2) + 1LL,  1,  *(char **)(v0 + 848),  &demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>,  &demangling cache variable for type metadata for CandidateSuggestion);
    }
    uint64_t v5 = *((void *)v3 + 2);
    os_log_type_t v4 = *((void *)v3 + 3);
    if (v5 >= v4 >> 1) {
      uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (char *)(v4 > 1),  v5 + 1,  1,  v3,  &demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>,  &demangling cache variable for type metadata for CandidateSuggestion);
    }
    uint64_t v6 = *(void *)(v0 + 680);
    uint64_t v7 = *(void *)(v0 + 664);
    uint64_t v8 = *(void *)(v0 + 656);
    *((void *)v3 + 2) = v5 + 1;
    outlined init with take of CandidateSuggestion((__int128 *)(v0 + 360), (uint64_t)&v3[40 * v5 + 32]);
    __swift_destroy_boxed_opaque_existential_1Tm((void *)(v0 + 480));
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }

  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 664) + 8LL))(*(void *)(v0 + 680), *(void *)(v0 + 656));
    outlined destroy of Any?(v0 + 440, &demangling cache variable for type metadata for CandidateSuggestion?);
    uint64_t v3 = *(char **)(v0 + 848);
  }

  uint64_t v9 = *(void *)(v0 + 840) + 1LL;
  if (v9 != *(void *)(v0 + 816))
  {
    *(void *)(v0 + 848) = v3;
    *(void *)(v0 + 840) = v9;
    (*(void (**)(void, unint64_t, void))(v0 + 832))( *(void *)(v0 + 680),  *(void *)(v0 + 808)
    + ((*(unsigned __int8 *)(v0 + 984) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v0 + 984))
    + *(void *)(v0 + 824) * v9,
      *(void *)(v0 + 656));
    unint64_t v15 = (void *)swift_task_alloc(dword_184AC);
    *(void *)(v0 + 856) = v15;
    char *v15 = v0;
    v15[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
    return InfoServerGenerator.createSuggestionForCandidate(candidate:factory:)( v0 + 440,  *(void *)(v0 + 680),  *(void *)(v0 + 592));
  }

  swift_bridgeObjectRelease(*(void *)(v0 + 808));
  unint64_t v10 = *(void *)(v0 + 776);
  (*(void (**)(void, void))(*(void *)(v0 + 720) + 8LL))(*(void *)(v0 + 736), *(void *)(v0 + 712));
  if (v10 >> 60 == 15)
  {
    char v11 = (uint64_t *)(v0 + 800);
  }

  else
  {
    unint64_t v17 = *(void *)(v0 + 800);
    char v18 = *(void *)(v0 + 776);
    uint64_t v19 = *(void *)(v0 + 768);
    int v20 = *(void *)(v0 + 696);
    uint64_t v21 = *(void *)(v0 + 632);
    uint64_t v77 = 0LL;
    unint64_t v75 = 0u;
    unint64_t v76 = 0u;
    outlined copy of Data._Representation(v19, v18);
    unint64_t v22 = outlined copy of Data._Representation(v19, v18);
    BinaryDecodingOptions.init()(v22);
    uint64_t v23 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion and conformance Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion,  (uint64_t)&protocol conformance descriptor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion);
    unint64_t v24 = Message.init(serializedData:extensions:partial:options:)(v19, v18, &v75, 0LL, v20, v21, v23);
    *(void *)(v0 + 864) = v17;
    if (v17)
    {
      char v25 = *(void *)(v0 + 776);
      uint64_t v26 = *(void *)(v0 + 768);
LABEL_18:
      swift_bridgeObjectRelease(v3);
      outlined consume of Data?(v26, v25);
      swift_errorRetain(v17);
      uint64_t v33 = swift_errorRetain(v17);
      uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
      uint64_t v35 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v37 = swift_slowAlloc(32LL, -1LL);
        *(void *)&unint64_t v75 = v37;
        *(_DWORD *)uint64_t v36 = 136315138;
        *(void *)(v0 + 568) = v17;
        swift_errorRetain(v17);
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
        int v39 = String.init<A>(describing:)(v0 + 568, v38);
        __int128 v41 = v40;
        *(void *)(v0 + 576) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v40, (uint64_t *)&v75);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 576, v0 + 584, v36 + 4, v36 + 12);
        swift_bridgeObjectRelease(v41);
        swift_errorRelease(v17);
        swift_errorRelease(v17);
        _os_log_impl(&dword_0, v34, v35, "Unable to get candidate from factory: %s", v36, 0xCu);
        swift_arrayDestroy(v37, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v37, -1LL, -1LL);
        swift_slowDealloc(v36, -1LL, -1LL);
      }

      else
      {
        swift_errorRelease(v17);
        swift_errorRelease(v17);
      }

      uint64_t v42 = *(void *)(v0 + 792);
      unint64_t v43 = *(void *)(v0 + 784);
      uint64_t v44 = *(void *)(v0 + 760);
      uint64_t v45 = *(void *)(v0 + 752);
      outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
      outlined consume of Data?(v43, v42);
      outlined consume of Data?(v45, v44);
      swift_errorRelease(v17);
      uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
      goto LABEL_22;
    }

    uint64_t v54 = Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion.candidates.getter(v24);
    *(void *)(v0 + 872) = v54;
    int v55 = *(void *)(v54 + 16);
    *(void *)(v0 + 880) = v55;
    if (v55)
    {
      v56 = *(void *)(v0 + 616);
      __int128 v57 = *(_DWORD *)(v56 + 80);
      *(_DWORD *)(v0 + 988) = v57;
      *(void *)(v0 + 888) = *(void *)(v56 + 72);
      __int128 v58 = *(void (**)(void, unint64_t, void))(v56 + 16);
      *(void *)(v0 + 896) = v58;
      *(void *)(v0 + 912) = v3;
      *(void *)(v0 + 904) = 0LL;
      v58( *(void *)(v0 + 624),  v54 + ((v57 + 32LL) & ~(unint64_t)v57),  *(void *)(v0 + 608));
      unint64_t v59 = (void *)swift_task_alloc(dword_1848C);
      *(void *)(v0 + 920) = v59;
      *unint64_t v59 = v0;
      v59[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
      return InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:)( v0 + 280,  *(void *)(v0 + 624),  *(void *)(v0 + 592));
    }

    char v11 = (uint64_t *)(v0 + 864);
    outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
    swift_bridgeObjectRelease(v54);
    (*(void (**)(void, void))(*(void *)(v0 + 640) + 8LL))(*(void *)(v0 + 648), *(void *)(v0 + 632));
  }

  uint64_t v12 = *(void *)(v0 + 792);
  if (v12 >> 60 == 15)
  {
    int v13 = *(void *)(v0 + 760);
    uint64_t v14 = *(void *)(v0 + 752);
    outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
    outlined consume of Data?(v14, v13);
LABEL_22:
    uint64_t v46 = *(void *)(v0 + 728);
    uint64_t v47 = *(void *)(v0 + 704);
    uint64_t v48 = *(void *)(v0 + 696);
    uint64_t v49 = *(void *)(v0 + 688);
    unint64_t v50 = *(void *)(v0 + 680);
    uint64_t v51 = *(void *)(v0 + 672);
    uint64_t v52 = *(void *)(v0 + 648);
    uint64_t v53 = *(void *)(v0 + 624);
    swift_task_dealloc(*(void *)(v0 + 736));
    swift_task_dealloc(v46);
    swift_task_dealloc(v47);
    swift_task_dealloc(v48);
    swift_task_dealloc(v49);
    swift_task_dealloc(v50);
    swift_task_dealloc(v51);
    swift_task_dealloc(v52);
    swift_task_dealloc(v53);
    return (*(uint64_t (**)(char *))(v0 + 8))(v3);
  }

  unint64_t v17 = *v11;
  int v27 = *(void *)(v0 + 784);
  uint64_t v28 = *(void *)(v0 + 712);
  unint64_t v29 = *(void *)(v0 + 688);
  uint64_t v77 = 0LL;
  unint64_t v75 = 0u;
  unint64_t v76 = 0u;
  outlined copy of Data._Representation(v27, v12);
  uint64_t v30 = outlined copy of Data._Representation(v27, v12);
  BinaryDecodingOptions.init()(v30);
  uint64_t v31 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestion and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestion,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion,  (uint64_t)&protocol conformance descriptor for Apple_Parsec_Siri_V2alpha_ServerSuggestion);
  uint64_t v32 = Message.init(serializedData:extensions:partial:options:)(v27, v12, &v75, 0LL, v29, v28, v31);
  if (v17)
  {
    char v25 = *(void *)(v0 + 792);
    uint64_t v26 = *(void *)(v0 + 784);
    goto LABEL_18;
  }

  unint64_t v60 = Apple_Parsec_Siri_V2alpha_ServerSuggestion.candidates.getter(v32);
  *(void *)(v0 + 928) = v60;
  uint64_t v61 = *(void *)(v60 + 16);
  *(void *)(v0 + 936) = v61;
  if (!v61)
  {
    uint64_t v66 = *(void *)(v0 + 792);
    uint64_t v67 = *(void *)(v0 + 784);
    v68 = *(void *)(v0 + 776);
    os_log_type_t v69 = *(void *)(v0 + 768);
    v70 = *(void *)(v0 + 760);
    uint64_t v71 = *(void *)(v0 + 752);
    uint64_t v72 = *(void *)(v0 + 720);
    uint64_t v73 = *(void *)(v0 + 712);
    unint64_t v74 = *(void *)(v0 + 728);
    outlined consume of Data?(v67, v66);
    outlined consume of Data?(v67, v66);
    outlined consume of Data?(v69, v68);
    outlined consume of Data?(v71, v70);
    swift_bridgeObjectRelease(v60);
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v74, v73);
    goto LABEL_22;
  }

  uint64_t v62 = *(void *)(v0 + 664);
  uint64_t v63 = *(_DWORD *)(v62 + 80);
  *(_DWORD *)(v0 + 992) = v63;
  *(void *)(v0 + 944) = *(void *)(v62 + 72);
  uint64_t v64 = *(void (**)(void, unint64_t, void))(v62 + 16);
  *(void *)(v0 + 952) = v64;
  *(void *)(v0 + 968) = v3;
  *(void *)(v0 + 960) = 0LL;
  v64( *(void *)(v0 + 672),  v60 + ((v63 + 32LL) & ~(unint64_t)v63),  *(void *)(v0 + 656));
  uint64_t v65 = (void *)swift_task_alloc(dword_184A4);
  *(void *)(v0 + 976) = v65;
  *uint64_t v65 = v0;
  v65[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
  return InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:)( v0 + 160,  *(void *)(v0 + 672),  *(void *)(v0 + 592));
}

{
  uint64_t v0;
  swift_task_dealloc(*(void *)(*(void *)v0 + 920LL));
  return swift_task_switch(InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:), 0LL, 0LL);
}

{
  uint64_t v0;
  uint64_t v1;
  char isUniquelyReferenced_nonNull_native;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  os_log_s *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  void (*v38)(void, unint64_t, void);
  void *v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _OWORD v61[2];
  uint64_t v62;
  if (*(void *)(v0 + 304))
  {
    uint64_t v1 = *(void *)(v0 + 912);
    outlined init with take of CandidateSuggestion((__int128 *)(v0 + 280), v0 + 240);
    outlined init with copy of CandidateSuggestion(v0 + 240, v0 + 200);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v1);
    uint64_t v3 = *(char **)(v0 + 912);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *((void *)v3 + 2) + 1LL,  1,  *(char **)(v0 + 912),  &demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>,  &demangling cache variable for type metadata for CandidateSuggestion);
    }
    uint64_t v5 = *((void *)v3 + 2);
    os_log_type_t v4 = *((void *)v3 + 3);
    if (v5 >= v4 >> 1) {
      uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (char *)(v4 > 1),  v5 + 1,  1,  v3,  &demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>,  &demangling cache variable for type metadata for CandidateSuggestion);
    }
    uint64_t v6 = *(void *)(v0 + 624);
    uint64_t v7 = *(void *)(v0 + 616);
    uint64_t v8 = *(void *)(v0 + 608);
    *((void *)v3 + 2) = v5 + 1;
    outlined init with take of CandidateSuggestion((__int128 *)(v0 + 200), (uint64_t)&v3[40 * v5 + 32]);
    __swift_destroy_boxed_opaque_existential_1Tm((void *)(v0 + 240));
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }

  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 616) + 8LL))(*(void *)(v0 + 624), *(void *)(v0 + 608));
    outlined destroy of Any?(v0 + 280, &demangling cache variable for type metadata for CandidateSuggestion?);
    uint64_t v3 = *(char **)(v0 + 912);
  }

  uint64_t v9 = *(void *)(v0 + 904) + 1LL;
  if (v9 != *(void *)(v0 + 880))
  {
    *(void *)(v0 + 912) = v3;
    *(void *)(v0 + 904) = v9;
    (*(void (**)(void, unint64_t, void))(v0 + 896))( *(void *)(v0 + 624),  *(void *)(v0 + 872)
    + ((*(unsigned __int8 *)(v0 + 988) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v0 + 988))
    + *(void *)(v0 + 888) * v9,
      *(void *)(v0 + 608));
    uint64_t v14 = (void *)swift_task_alloc(dword_1848C);
    *(void *)(v0 + 920) = v14;
    *uint64_t v14 = v0;
    v14[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
    return InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:)( v0 + 280,  *(void *)(v0 + 624),  *(void *)(v0 + 592));
  }

  unint64_t v10 = *(void *)(v0 + 872);
  outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
  swift_bridgeObjectRelease(v10);
  (*(void (**)(void, void))(*(void *)(v0 + 640) + 8LL))(*(void *)(v0 + 648), *(void *)(v0 + 632));
  char v11 = *(void *)(v0 + 792);
  if (v11 >> 60 == 15)
  {
    uint64_t v12 = *(void *)(v0 + 760);
    int v13 = *(void *)(v0 + 752);
    outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
    outlined consume of Data?(v13, v12);
  }

  else
  {
    uint64_t v16 = *(void *)(v0 + 864);
    unint64_t v17 = *(void *)(v0 + 784);
    char v18 = *(void *)(v0 + 712);
    uint64_t v19 = *(void *)(v0 + 688);
    uint64_t v62 = 0LL;
    memset(v61, 0, sizeof(v61));
    outlined copy of Data._Representation(v17, v11);
    int v20 = outlined copy of Data._Representation(v17, v11);
    BinaryDecodingOptions.init()(v20);
    uint64_t v21 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestion and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestion,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion,  (uint64_t)&protocol conformance descriptor for Apple_Parsec_Siri_V2alpha_ServerSuggestion);
    unint64_t v22 = Message.init(serializedData:extensions:partial:options:)(v17, v11, v61, 0LL, v19, v18, v21);
    if (v16)
    {
      uint64_t v23 = *(void *)(v0 + 792);
      unint64_t v24 = *(void *)(v0 + 784);
      swift_bridgeObjectRelease(v3);
      outlined consume of Data?(v24, v23);
      swift_errorRetain(v16);
      char v25 = swift_errorRetain(v16);
      uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
      int v27 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        unint64_t v29 = swift_slowAlloc(32LL, -1LL);
        *(void *)&v61[0] = v29;
        *(_DWORD *)uint64_t v28 = 136315138;
        *(void *)(v0 + 568) = v16;
        swift_errorRetain(v16);
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
        uint64_t v31 = String.init<A>(describing:)(v0 + 568, v30);
        uint64_t v33 = v32;
        *(void *)(v0 + 576) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, (uint64_t *)v61);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 576, v0 + 584, v28 + 4, v28 + 12);
        swift_bridgeObjectRelease(v33);
        swift_errorRelease(v16);
        swift_errorRelease(v16);
        _os_log_impl(&dword_0, v26, v27, "Unable to get candidate from factory: %s", v28, 0xCu);
        swift_arrayDestroy(v29, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v29, -1LL, -1LL);
        swift_slowDealloc(v28, -1LL, -1LL);
      }

      else
      {
        swift_errorRelease(v16);
        swift_errorRelease(v16);
      }

      uint64_t v40 = *(void *)(v0 + 792);
      __int128 v41 = *(void *)(v0 + 784);
      uint64_t v42 = *(void *)(v0 + 760);
      unint64_t v43 = *(void *)(v0 + 752);
      outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
      outlined consume of Data?(v41, v40);
      outlined consume of Data?(v43, v42);
      swift_errorRelease(v16);
      uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
    }

    else
    {
      uint64_t v34 = Apple_Parsec_Siri_V2alpha_ServerSuggestion.candidates.getter(v22);
      *(void *)(v0 + 928) = v34;
      uint64_t v35 = *(void *)(v34 + 16);
      *(void *)(v0 + 936) = v35;
      if (v35)
      {
        uint64_t v36 = *(void *)(v0 + 664);
        uint64_t v37 = *(_DWORD *)(v36 + 80);
        *(_DWORD *)(v0 + 992) = v37;
        *(void *)(v0 + 944) = *(void *)(v36 + 72);
        uint64_t v38 = *(void (**)(void, unint64_t, void))(v36 + 16);
        *(void *)(v0 + 952) = v38;
        *(void *)(v0 + 968) = v3;
        *(void *)(v0 + 960) = 0LL;
        v38( *(void *)(v0 + 672),  v34 + ((v37 + 32LL) & ~(unint64_t)v37),  *(void *)(v0 + 656));
        int v39 = (void *)swift_task_alloc(dword_184A4);
        *(void *)(v0 + 976) = v39;
        *int v39 = v0;
        v39[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
        return InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:)( v0 + 160,  *(void *)(v0 + 672),  *(void *)(v0 + 592));
      }

      uint64_t v52 = *(void *)(v0 + 792);
      uint64_t v53 = *(void *)(v0 + 784);
      uint64_t v54 = *(void *)(v0 + 776);
      int v55 = *(void *)(v0 + 768);
      v56 = *(void *)(v0 + 760);
      __int128 v57 = *(void *)(v0 + 752);
      __int128 v58 = *(void *)(v0 + 720);
      unint64_t v59 = *(void *)(v0 + 712);
      unint64_t v60 = *(void *)(v0 + 728);
      outlined consume of Data?(v53, v52);
      outlined consume of Data?(v53, v52);
      outlined consume of Data?(v55, v54);
      outlined consume of Data?(v57, v56);
      swift_bridgeObjectRelease(v34);
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v60, v59);
    }
  }

  uint64_t v44 = *(void *)(v0 + 728);
  uint64_t v45 = *(void *)(v0 + 704);
  uint64_t v46 = *(void *)(v0 + 696);
  uint64_t v47 = *(void *)(v0 + 688);
  uint64_t v48 = *(void *)(v0 + 680);
  uint64_t v49 = *(void *)(v0 + 672);
  unint64_t v50 = *(void *)(v0 + 648);
  uint64_t v51 = *(void *)(v0 + 624);
  swift_task_dealloc(*(void *)(v0 + 736));
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  return (*(uint64_t (**)(char *))(v0 + 8))(v3);
}

{
  uint64_t v0;
  swift_task_dealloc(*(void *)(*(void *)v0 + 976LL));
  return swift_task_switch(InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:), 0LL, 0LL);
}

{
  uint64_t v0;
  uint64_t v1;
  char isUniquelyReferenced_nonNull_native;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  if (*(void *)(v0 + 184))
  {
    uint64_t v1 = *(void *)(v0 + 968);
    outlined init with take of CandidateSuggestion((__int128 *)(v0 + 160), v0 + 320);
    outlined init with copy of CandidateSuggestion(v0 + 320, v0 + 400);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v1);
    uint64_t v3 = *(char **)(v0 + 968);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *((void *)v3 + 2) + 1LL,  1,  *(char **)(v0 + 968),  &demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>,  &demangling cache variable for type metadata for CandidateSuggestion);
    }
    uint64_t v5 = *((void *)v3 + 2);
    os_log_type_t v4 = *((void *)v3 + 3);
    if (v5 >= v4 >> 1) {
      uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (char *)(v4 > 1),  v5 + 1,  1,  v3,  &demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>,  &demangling cache variable for type metadata for CandidateSuggestion);
    }
    uint64_t v6 = *(void *)(v0 + 672);
    uint64_t v7 = *(void *)(v0 + 664);
    uint64_t v8 = *(void *)(v0 + 656);
    *((void *)v3 + 2) = v5 + 1;
    outlined init with take of CandidateSuggestion((__int128 *)(v0 + 400), (uint64_t)&v3[40 * v5 + 32]);
    __swift_destroy_boxed_opaque_existential_1Tm((void *)(v0 + 320));
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }

  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 664) + 8LL))(*(void *)(v0 + 672), *(void *)(v0 + 656));
    outlined destroy of Any?(v0 + 160, &demangling cache variable for type metadata for CandidateSuggestion?);
    uint64_t v3 = *(char **)(v0 + 968);
  }

  uint64_t v9 = *(void *)(v0 + 960) + 1LL;
  if (v9 == *(void *)(v0 + 936))
  {
    unint64_t v10 = *(void *)(v0 + 792);
    char v11 = *(void *)(v0 + 784);
    uint64_t v12 = *(void *)(v0 + 776);
    int v13 = *(void *)(v0 + 768);
    uint64_t v14 = *(void *)(v0 + 760);
    unint64_t v15 = *(void *)(v0 + 752);
    uint64_t v28 = *(void *)(v0 + 728);
    unint64_t v29 = *(void *)(v0 + 928);
    uint64_t v16 = *(void *)(v0 + 720);
    unint64_t v17 = *(void *)(v0 + 712);
    outlined consume of Data?(v11, v10);
    outlined consume of Data?(v11, v10);
    outlined consume of Data?(v13, v12);
    outlined consume of Data?(v15, v14);
    swift_bridgeObjectRelease(v29);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v28, v17);
    char v18 = *(void *)(v0 + 728);
    uint64_t v19 = *(void *)(v0 + 704);
    int v20 = *(void *)(v0 + 696);
    uint64_t v21 = *(void *)(v0 + 688);
    unint64_t v22 = *(void *)(v0 + 680);
    uint64_t v23 = *(void *)(v0 + 672);
    unint64_t v24 = *(void *)(v0 + 648);
    char v25 = *(void *)(v0 + 624);
    swift_task_dealloc(*(void *)(v0 + 736));
    swift_task_dealloc(v18);
    swift_task_dealloc(v19);
    swift_task_dealloc(v20);
    swift_task_dealloc(v21);
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    swift_task_dealloc(v24);
    swift_task_dealloc(v25);
    return (*(uint64_t (**)(char *))(v0 + 8))(v3);
  }

  else
  {
    *(void *)(v0 + 968) = v3;
    *(void *)(v0 + 960) = v9;
    (*(void (**)(void, unint64_t, void))(v0 + 952))( *(void *)(v0 + 672),  *(void *)(v0 + 928)
    + ((*(unsigned __int8 *)(v0 + 992) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v0 + 992))
    + *(void *)(v0 + 944) * v9,
      *(void *)(v0 + 656));
    int v27 = (void *)swift_task_alloc(dword_184A4);
    *(void *)(v0 + 976) = v27;
    *int v27 = v0;
    v27[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
    return InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:)( v0 + 160,  *(void *)(v0 + 672),  *(void *)(v0 + 592));
  }

LABEL_60:
      uint64_t v80 = *(void *)(v0 + 728);
      uint64_t v81 = *(void *)(v0 + 704);
      uint64_t v82 = *(void *)(v0 + 696);
      uint64_t v83 = *(void *)(v0 + 688);
      uint64_t v84 = *(void *)(v0 + 680);
      uint64_t v85 = *(void *)(v0 + 672);
      uint64_t v86 = *(void *)(v0 + 648);
      uint64_t v87 = *(void *)(v0 + 624);
      swift_task_dealloc(*(void *)(v0 + 736));
      swift_task_dealloc(v80);
      swift_task_dealloc(v81);
      swift_task_dealloc(v82);
      swift_task_dealloc(v83);
      swift_task_dealloc(v84);
      swift_task_dealloc(v85);
      swift_task_dealloc(v86);
      swift_task_dealloc(v87);
      return (*(uint64_t (**)(void *))(v0 + 8))(&_swiftEmptyArrayStorage);
    }

    uint64_t v30 = 0LL;
  }

  else
  {
    uint64_t v31 = *(void *)(v0 + 712);
    uint64_t v32 = *(void *)(v0 + 704);
    uint64_t v105 = 0LL;
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    uint64_t v33 = outlined copy of Data._Representation(v14, v15);
    BinaryDecodingOptions.init()(v33);
    uint64_t v34 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestion and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestion,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion,  (uint64_t)&protocol conformance descriptor for Apple_Parsec_Siri_V2alpha_ServerSuggestion);
    uint64_t v35 = Message.init(serializedData:extensions:partial:options:)(v14, v15, &v103, 0LL, v32, v31, v34);
    *(void *)(v0 + 800) = 0LL;
    uint64_t v36 = Apple_Parsec_Siri_V2alpha_ServerSuggestion.candidates.getter(v35);
    *(void *)(v0 + 808) = v36;
    uint64_t v37 = *(void *)(v36 + 16);
    *(void *)(v0 + 816) = v37;
    if (v37)
    {
      uint64_t v38 = *(void *)(v0 + 664);
      int v39 = *(_DWORD *)(v38 + 80);
      *(_DWORD *)(v0 + 984) = v39;
      *(void *)(v0 + 824) = *(void *)(v38 + 72);
      uint64_t v40 = *(void (**)(void, unint64_t, void))(v38 + 16);
      *(void *)(v0 + 832) = v40;
      *(void *)(v0 + 848) = &_swiftEmptyArrayStorage;
      *(void *)(v0 + 840) = 0LL;
      v40( *(void *)(v0 + 680),  v36 + ((v39 + 32LL) & ~(unint64_t)v39),  *(void *)(v0 + 656));
      __int128 v41 = (void *)swift_task_alloc(dword_184AC);
      *(void *)(v0 + 856) = v41;
      void *v41 = v0;
      v41[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
      return InfoServerGenerator.createSuggestionForCandidate(candidate:factory:)( v0 + 440,  *(void *)(v0 + 680),  *(void *)(v0 + 592));
    }

    __int128 v58 = (uint64_t *)(v0 + 800);
    swift_bridgeObjectRelease(v36);
    unint64_t v59 = *(void *)(v0 + 776);
    (*(void (**)(void, void))(*(void *)(v0 + 720) + 8LL))(*(void *)(v0 + 736), *(void *)(v0 + 712));
    if (v59 >> 60 == 15) {
      goto LABEL_51;
    }
    uint64_t v30 = *v58;
  }

  unint64_t v43 = *(void *)(v0 + 776);
  uint64_t v44 = *(void *)(v0 + 768);
  uint64_t v45 = *(void *)(v0 + 696);
  uint64_t v46 = *(void *)(v0 + 632);
  uint64_t v105 = 0LL;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  outlined copy of Data._Representation(v44, v43);
  uint64_t v47 = outlined copy of Data._Representation(v44, v43);
  BinaryDecodingOptions.init()(v47);
  uint64_t v48 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion and conformance Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion,  (uint64_t)&protocol conformance descriptor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion);
  uint64_t v49 = Message.init(serializedData:extensions:partial:options:)(v44, v43, &v103, 0LL, v45, v46, v48);
  *(void *)(v0 + 864) = v30;
  if (v30)
  {
    unint64_t v50 = *(void *)(v0 + 776);
    uint64_t v51 = *(void *)(v0 + 768);
LABEL_56:
    swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
    outlined consume of Data?(v51, v50);
    swift_errorRetain(v30);
    uint64_t v67 = swift_errorRetain(v30);
    v68 = (os_log_s *)Logger.logObject.getter(v67);
    os_log_type_t v69 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v68, v69))
    {
      v70 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v71 = swift_slowAlloc(32LL, -1LL);
      *(void *)&__int128 v103 = v71;
      *(_DWORD *)v70 = 136315138;
      *(void *)(v0 + 568) = v30;
      swift_errorRetain(v30);
      uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      uint64_t v73 = String.init<A>(describing:)(v0 + 568, v72);
      unint64_t v75 = v74;
      *(void *)(v0 + 576) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v73, v74, (uint64_t *)&v103);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 576, v0 + 584, v70 + 4, v70 + 12);
      swift_bridgeObjectRelease(v75);
      swift_errorRelease(v30);
      swift_errorRelease(v30);
      _os_log_impl(&dword_0, v68, v69, "Unable to get candidate from factory: %s", v70, 0xCu);
      swift_arrayDestroy(v71, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v71, -1LL, -1LL);
      swift_slowDealloc(v70, -1LL, -1LL);
    }

    else
    {
      swift_errorRelease(v30);
      swift_errorRelease(v30);
    }

    unint64_t v76 = *(void *)(v0 + 792);
    uint64_t v77 = *(void *)(v0 + 784);
    unint64_t v78 = *(void *)(v0 + 760);
    uint64_t v79 = *(void *)(v0 + 752);
    outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
    outlined consume of Data?(v77, v76);
    outlined consume of Data?(v79, v78);
    swift_errorRelease(v30);
    goto LABEL_60;
  }

  uint64_t v52 = Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion.candidates.getter(v49);
  *(void *)(v0 + 872) = v52;
  uint64_t v53 = *(void *)(v52 + 16);
  *(void *)(v0 + 880) = v53;
  if (v53)
  {
    uint64_t v54 = *(void *)(v0 + 616);
    int v55 = *(_DWORD *)(v54 + 80);
    *(_DWORD *)(v0 + 988) = v55;
    *(void *)(v0 + 888) = *(void *)(v54 + 72);
    v56 = *(void (**)(void, unint64_t, void))(v54 + 16);
    *(void *)(v0 + 896) = v56;
    *(void *)(v0 + 912) = &_swiftEmptyArrayStorage;
    *(void *)(v0 + 904) = 0LL;
    v56( *(void *)(v0 + 624),  v52 + ((v55 + 32LL) & ~(unint64_t)v55),  *(void *)(v0 + 608));
    __int128 v57 = (void *)swift_task_alloc(dword_1848C);
    *(void *)(v0 + 920) = v57;
    *__int128 v57 = v0;
    v57[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
    return InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:)( v0 + 280,  *(void *)(v0 + 624),  *(void *)(v0 + 592));
  }

  __int128 v58 = (uint64_t *)(v0 + 864);
  outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
  swift_bridgeObjectRelease(v52);
  (*(void (**)(void, void))(*(void *)(v0 + 640) + 8LL))(*(void *)(v0 + 648), *(void *)(v0 + 632));
LABEL_51:
  unint64_t v29 = *(void *)(v0 + 792);
  if (v29 >> 60 == 15)
  {
    unint64_t v60 = *(void *)(v0 + 760);
    uint64_t v61 = *(void *)(v0 + 752);
    outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
    outlined consume of Data?(v61, v60);
    goto LABEL_60;
  }

  uint64_t v30 = *v58;
  uint64_t v28 = *(void *)(v0 + 784);
LABEL_54:
  uint64_t v62 = *(void *)(v0 + 712);
  uint64_t v63 = *(void *)(v0 + 688);
  uint64_t v105 = 0LL;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  outlined copy of Data._Representation(v28, v29);
  uint64_t v64 = outlined copy of Data._Representation(v28, v29);
  BinaryDecodingOptions.init()(v64);
  uint64_t v65 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestion and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestion,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion,  (uint64_t)&protocol conformance descriptor for Apple_Parsec_Siri_V2alpha_ServerSuggestion);
  uint64_t v66 = Message.init(serializedData:extensions:partial:options:)(v28, v29, &v103, 0LL, v63, v62, v65);
  if (v30)
  {
    unint64_t v50 = *(void *)(v0 + 792);
    uint64_t v51 = *(void *)(v0 + 784);
    goto LABEL_56;
  }

  uint64_t v88 = Apple_Parsec_Siri_V2alpha_ServerSuggestion.candidates.getter(v66);
  *(void *)(v0 + 928) = v88;
  uint64_t v89 = *(void *)(v88 + 16);
  *(void *)(v0 + 936) = v89;
  if (!v89)
  {
    unint64_t v94 = *(void *)(v0 + 792);
    uint64_t v95 = *(void *)(v0 + 784);
    unint64_t v96 = *(void *)(v0 + 776);
    uint64_t v97 = *(void *)(v0 + 768);
    unint64_t v98 = *(void *)(v0 + 760);
    uint64_t v99 = *(void *)(v0 + 752);
    uint64_t v102 = *(void *)(v0 + 728);
    uint64_t v100 = *(void *)(v0 + 720);
    uint64_t v101 = *(void *)(v0 + 712);
    outlined consume of Data?(v95, v94);
    outlined consume of Data?(v95, v94);
    outlined consume of Data?(v97, v96);
    outlined consume of Data?(v99, v98);
    swift_bridgeObjectRelease(v88);
    (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v102, v101);
    goto LABEL_60;
  }

  uint64_t v90 = *(void *)(v0 + 664);
  int v91 = *(_DWORD *)(v90 + 80);
  *(_DWORD *)(v0 + 992) = v91;
  *(void *)(v0 + 944) = *(void *)(v90 + 72);
  v92 = *(void (**)(void, unint64_t, void))(v90 + 16);
  *(void *)(v0 + 952) = v92;
  *(void *)(v0 + 968) = &_swiftEmptyArrayStorage;
  *(void *)(v0 + 960) = 0LL;
  v92( *(void *)(v0 + 672),  v88 + ((v91 + 32LL) & ~(unint64_t)v91),  *(void *)(v0 + 656));
  v93 = (void *)swift_task_alloc(dword_184A4);
  *(void *)(v0 + 976) = v93;
  void *v93 = v0;
  v93[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
  return InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:)( v0 + 160,  *(void *)(v0 + 672),  *(void *)(v0 + 592));
}

uint64_t InfoServerGenerator.createSuggestionForCandidate(candidate:factory:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[15] = a2;
  v3[16] = a3;
  v3[14] = a1;
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate(0LL);
  v3[17] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[18] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[19] = swift_task_alloc(v6);
  v3[20] = swift_task_alloc(v6);
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance(0LL);
  v3[21] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v3[22] = v8;
  v3[23] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Objective(0LL);
  v3[24] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v3[25] = v10;
  v3[26] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SuggestionIntent(0LL);
  v3[27] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v3[28] = v12;
  unint64_t v13 = (*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[29] = swift_task_alloc(v13);
  v3[30] = swift_task_alloc(v13);
  v3[31] = swift_task_alloc(v13);
  v3[32] = swift_task_alloc(v13);
  return swift_task_switch(InfoServerGenerator.createSuggestionForCandidate(candidate:factory:), 0LL, 0LL);
}

uint64_t InfoServerGenerator.createSuggestionForCandidate(candidate:factory:)()
{
  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v1 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 216);
  uint64_t v4 = *(void *)(v0 + 224);
  ((void (*)(void))Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.intent.getter)();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))( v2,  enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.unspecified(_:),  v3);
  uint64_t v5 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_SuggestionIntent and conformance Apple_Parsec_Siri_V2alpha_SuggestionIntent,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_SuggestionIntent,  (uint64_t)&protocol conformance descriptor for Apple_Parsec_Siri_V2alpha_SuggestionIntent);
  char v6 = dispatch thunk of static Equatable.== infix(_:_:)(v1, v2, v3, v5);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v7(v2, v3);
  v7(v1, v3);
  if ((v6 & 1) != 0)
  {
    if (one-time initialization token for suggestions == -1)
    {
LABEL_3:
      uint64_t v9 = *(void *)(v0 + 144);
      uint64_t v8 = *(void *)(v0 + 152);
      uint64_t v10 = *(void *)(v0 + 136);
      uint64_t v11 = *(void *)(v0 + 120);
      uint64_t v12 = type metadata accessor for Logger(0LL);
      __swift_project_value_buffer(v12, (uint64_t)static Logger.suggestions);
      uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v11, v10);
      uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
      os_log_type_t v15 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = *(void *)(v0 + 256);
        uint64_t v17 = *(void *)(v0 + 152);
        uint64_t v65 = *(void *)(v0 + 216);
        uint64_t v67 = *(void *)(v0 + 144);
        uint64_t v68 = *(void *)(v0 + 136);
        char v18 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)char v18 = 134217984;
        uint64_t v19 = Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.intent.getter(v18);
        uint64_t v20 = Apple_Parsec_Siri_V2alpha_SuggestionIntent.rawValue.getter(v19);
        v7(v16, v65);
        (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v17, v68);
        *(void *)(v0 + 104) = v20;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 104, v0 + 112, v18 + 4, v18 + 12);
        _os_log_impl(&dword_0, v14, v15, "Encountered unspecified intent of id %ld. Filtering out", v18, 0xCu);
        swift_slowDealloc(v18, -1LL, -1LL);
      }

      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 144) + 8LL))( *(void *)(v0 + 152),  *(void *)(v0 + 136));
      }

      uint64_t v30 = *(void *)(v0 + 112);
      goto LABEL_27;
    }

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v1 = v0[33];
  uint64_t v3 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v4 = v0[21];
  Context.setUtterance(_:)(v2, v0[35], v0[34]);
  swift_unknownObjectRelease(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch(InfoServerGenerator.createSuggestionForCandidate(candidate:factory:), 0LL, 0LL);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v1 = v0[32];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  __swift_project_boxed_opaque_existential_1Tm(v0 + 2, v3);
  uint64_t v5 = dispatch thunk of CandidateSuggestion.context.getter(v3, v4);
  uint64_t v7 = v6;
  v0[36] = v5;
  v0[37] = v6;
  uint64_t ObjectType = swift_getObjectType(v5);
  v0[38] = ObjectType;
  Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.intent.getter();
  v0[39] = String.init<A>(describing:)(v1, v2);
  v0[40] = v9;
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v7 + 8) + 8LL));
  return swift_task_switch(InfoServerGenerator.createSuggestionForCandidate(candidate:factory:), v10, v11);
}

{
  void *v0;
  Swift::String v1;
  void *v2;
  uint64_t v3;
  v1._countAndFlagsBits = v0[39];
  uint64_t v2 = (void *)v0[40];
  uint64_t v3 = v0[36];
  v1._object = v2;
  Context.setServerIntent(_:)(v1);
  swift_unknownObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  return swift_task_switch(InfoServerGenerator.createSuggestionForCandidate(candidate:factory:), 0LL, 0LL);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_s *v7;
  os_log_type_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  if (one-time initialization token for suggestions != -1) {
    swift_once(&one-time initialization token for suggestions, one-time initialization function for suggestions);
  }
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v5 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v5, (uint64_t)static Logger.suggestions);
  char v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  uint64_t v8 = static os_log_type_t.error.getter();
  uint64_t v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = *(void *)(v0 + 160);
  uint64_t v11 = *(void *)(v0 + 136);
  uint64_t v12 = *(void *)(v0 + 144);
  if (v9)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v14 = swift_slowAlloc(32LL, -1LL);
    uint64_t v27 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    os_log_type_t v15 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate,  (uint64_t)&protocol conformance descriptor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate);
    uint64_t v16 = Message.debugDescription.getter(v11, v15);
    char v18 = v17;
    *(void *)(v0 + 96) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v17, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease(v18);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    _os_log_impl(&dword_0, v7, v8, "Found and constructed server based info suggestion: %s", v13, 0xCu);
    swift_arrayDestroy(v14, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(void, void))(v12 + 8))(*(void *)(v0 + 160), *(void *)(v0 + 136));
  }

  outlined init with copy of CandidateSuggestion(v0 + 16, *(void *)(v0 + 112));
  __swift_destroy_boxed_opaque_existential_1Tm((void *)(v0 + 16));
  uint64_t v19 = *(void *)(v0 + 248);
  uint64_t v21 = *(void *)(v0 + 232);
  uint64_t v20 = *(void *)(v0 + 240);
  uint64_t v22 = *(void *)(v0 + 208);
  uint64_t v23 = *(void *)(v0 + 184);
  uint64_t v25 = *(void *)(v0 + 152);
  uint64_t v24 = *(void *)(v0 + 160);
  swift_task_dealloc(*(void *)(v0 + 256));
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

LABEL_30:
    swift_once(&one-time initialization token for suggestions, one-time initialization function for suggestions);
    goto LABEL_3;
  }

  if (one-time initialization token for mathSuggestionIntents != -1) {
    swift_once( &one-time initialization token for mathSuggestionIntents,  one-time initialization function for mathSuggestionIntents);
  }
  uint64_t v21 = static SuggestionConstants.mathSuggestionIntents;
  uint64_t v22 = swift_bridgeObjectRetain(static SuggestionConstants.mathSuggestionIntents);
  Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.intent.getter(v22);
  uint64_t v23 = *(char **)(v21 + 16);
  if (!v23) {
    goto LABEL_19;
  }
  uint64_t v25 = *(void *)(v0 + 232);
  uint64_t v24 = *(void *)(v0 + 240);
  uint64_t v27 = *(void *)(v0 + 216);
  uint64_t v26 = *(void *)(v0 + 224);
  unint64_t v28 = (*(unsigned __int8 *)(v26 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  v70 = *(void (**)(uint64_t, unint64_t, uint64_t))(v26 + 16);
  v70(v25, v21 + v28, v27);
  swift_bridgeObjectRetain(v21);
  LOBYTE(v24) = dispatch thunk of static Equatable.== infix(_:_:)(v25, v24, v27, v5);
  v7(v25, v27);
  if ((v24 & 1) == 0)
  {
    if (v23 != (_BYTE *)&dword_0 + 1)
    {
      os_log_type_t v69 = v7;
      uint64_t v31 = *(void *)(*(void *)(v0 + 224) + 72LL);
      uint64_t v66 = v21;
      unint64_t v32 = v21 + v31 + v28;
      uint64_t v7 = (void (*)(uint64_t, uint64_t))(&dword_0 + 1);
      while (1)
      {
        v70(*(void *)(v0 + 232), v32, *(void *)(v0 + 216));
        uint64_t v33 = (char *)v7 + 1;
        if (__OFADD__(v7, 1LL)) {
          break;
        }
        uint64_t v34 = *(void *)(v0 + 232);
        uint64_t v35 = *(void *)(v0 + 216);
        char v36 = dispatch thunk of static Equatable.== infix(_:_:)(v34, *(void *)(v0 + 240), v35, v5);
        v69(v34, v35);
        if ((v36 & 1) != 0)
        {
          uint64_t v21 = v66;
          swift_bridgeObjectRelease(v66);
          unint64_t v71 = 0xD000000000000018LL;
          unint64_t v29 = 0x8000000000011E50LL;
          uint64_t v7 = v69;
          goto LABEL_20;
        }

        uint64_t v7 = (void (*)(uint64_t, uint64_t))((char *)v7 + 1);
        v32 += v31;
        if (v33 == v23)
        {
          uint64_t v21 = v66;
          swift_bridgeObjectRelease(v66);
          uint64_t v7 = v69;
          goto LABEL_19;
        }
      }

      __break(1u);
      goto LABEL_30;
    }

    swift_bridgeObjectRelease(v21);
LABEL_19:
    unint64_t v29 = 0x8000000000011E30LL;
    unint64_t v71 = 0xD000000000000014LL;
    goto LABEL_20;
  }

  swift_bridgeObjectRelease(v21);
  unint64_t v71 = 0xD000000000000018LL;
  unint64_t v29 = 0x8000000000011E50LL;
LABEL_20:
  uint64_t v37 = *(void *)(v0 + 208);
  uint64_t v39 = *(void *)(v0 + 192);
  uint64_t v38 = *(void *)(v0 + 200);
  uint64_t v40 = *(void **)(v0 + 128);
  v7(*(void *)(v0 + 240), *(void *)(v0 + 216));
  swift_bridgeObjectRelease(v21);
  uint64_t v41 = v40[3];
  uint64_t v42 = v40[4];
  __swift_project_boxed_opaque_existential_1Tm(v40, v41);
  unint64_t v43 = specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&_swiftEmptyArrayStorage);
  (*(void (**)(uint64_t, void, uint64_t))(v38 + 104))(v37, enum case for Objective.discoverability(_:), v39);
  CandidateSuggestionFactory.create(suggestionId:params:objective:)(v71, v29, v43, v37, v41, v42);
  swift_bridgeObjectRelease(v43);
  swift_bridgeObjectRelease(v29);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
  if (*(void *)(v0 + 80))
  {
    outlined init with take of CandidateSuggestion((__int128 *)(v0 + 56), v0 + 16);
    uint64_t v44 = *(void *)(v0 + 40);
    uint64_t v45 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1Tm((void *)(v0 + 16), v44);
    uint64_t v46 = dispatch thunk of CandidateSuggestion.context.getter(v44, v45);
    uint64_t v48 = v47;
    *(void *)(v0 + 264) = v46;
    *(void *)(v0 + 272) = v47;
    uint64_t ObjectType = swift_getObjectType(v46);
    *(void *)(v0 + 280) = ObjectType;
    Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.utterance.getter();
    uint64_t v50 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v48 + 8) + 8LL));
    return swift_task_switch(InfoServerGenerator.createSuggestionForCandidate(candidate:factory:), v50, v51);
  }

  outlined destroy of Any?(v0 + 56, &demangling cache variable for type metadata for CandidateSuggestion?);
  if (one-time initialization token for suggestions != -1) {
    swift_once(&one-time initialization token for suggestions, one-time initialization function for suggestions);
  }
  uint64_t v53 = type metadata accessor for Logger(0LL);
  uint64_t v54 = __swift_project_value_buffer(v53, (uint64_t)static Logger.suggestions);
  int v55 = (os_log_s *)Logger.logObject.getter(v54);
  os_log_type_t v56 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v55, v56))
  {
    __int128 v57 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)__int128 v57 = 0;
    _os_log_impl(&dword_0, v55, v56, "Unable to find server suggestionID", v57, 2u);
    swift_slowDealloc(v57, -1LL, -1LL);
  }

  uint64_t v30 = *(void *)(v0 + 112);

LABEL_27:
  *(void *)(v30 + 32) = 0LL;
  *(_OWORD *)uint64_t v30 = 0u;
  *(_OWORD *)(v30 + 16) = 0u;
  uint64_t v58 = *(void *)(v0 + 248);
  uint64_t v60 = *(void *)(v0 + 232);
  uint64_t v59 = *(void *)(v0 + 240);
  uint64_t v61 = *(void *)(v0 + 208);
  uint64_t v62 = *(void *)(v0 + 184);
  uint64_t v64 = *(void *)(v0 + 152);
  uint64_t v63 = *(void *)(v0 + 160);
  swift_task_dealloc(*(void *)(v0 + 256));
  swift_task_dealloc(v58);
  swift_task_dealloc(v59);
  swift_task_dealloc(v60);
  swift_task_dealloc(v61);
  swift_task_dealloc(v62);
  swift_task_dealloc(v63);
  swift_task_dealloc(v64);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[14] = a2;
  v3[15] = a3;
  v3[13] = a1;
  uint64_t SuggestionCandidate = type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate(0LL);
  v3[16] = SuggestionCandidate;
  uint64_t v5 = *(void *)(SuggestionCandidate - 8);
  v3[17] = v5;
  v3[18] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance(0LL);
  v3[19] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[20] = v7;
  v3[21] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Preference?);
  v3[22] = swift_task_alloc((*(void *)(*(void *)(v8 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DeliveryVehicle?);
  v3[23] = swift_task_alloc((*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Objective(0LL);
  v3[24] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[25] = v11;
  v3[26] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:), 0LL, 0LL);
}

uint64_t InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:)()
{
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v33 = v3;
  uint64_t v34 = v2;
  uint64_t v5 = *(void *)(v0 + 176);
  uint64_t v6 = *(void **)(v0 + 120);
  uint64_t v7 = v6[3];
  uint64_t v32 = v6[4];
  __swift_project_boxed_opaque_existential_1Tm(v6, v7);
  unint64_t v8 = specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&_swiftEmptyArrayStorage);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for Objective.discoverability(_:), v3);
  uint64_t v9 = enum case for DeliveryVehicle.assistantSuggestions(_:);
  uint64_t v10 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 104))(v4, v9, v10);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v4, 0LL, 1LL, v10);
  uint64_t v12 = type metadata accessor for Preference(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v5, 1LL, 1LL, v12);
  CandidateSuggestionFactory.create(suggestionId:params:objective:deliveryVehicle:preference:)( 0xD000000000000013LL,  0x8000000000011DD0LL,  v8,  v1,  v4,  v5,  v7,  v32);
  swift_bridgeObjectRelease(v8);
  outlined destroy of Any?(v5, &demangling cache variable for type metadata for Preference?);
  outlined destroy of Any?(v4, &demangling cache variable for type metadata for DeliveryVehicle?);
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v1, v33);
  if (*(void *)(v0 + 80))
  {
    outlined init with take of CandidateSuggestion((__int128 *)(v0 + 56), v0 + 16);
    uint64_t v13 = *(void *)(v0 + 40);
    uint64_t v14 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1Tm((void *)(v0 + 16), v13);
    uint64_t v15 = dispatch thunk of CandidateSuggestion.context.getter(v13, v14);
    uint64_t v17 = v16;
    *(void *)(v0 + 216) = v15;
    *(void *)(v0 + 224) = v16;
    uint64_t ObjectType = swift_getObjectType(v15);
    *(void *)(v0 + 232) = ObjectType;
    Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate.utterance.getter();
    uint64_t v19 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v17 + 8) + 8LL));
    return swift_task_switch( InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:),  v19,  v20);
  }

  else
  {
    outlined destroy of Any?(v0 + 56, &demangling cache variable for type metadata for CandidateSuggestion?);
    if (one-time initialization token for suggestions != -1) {
      swift_once(&one-time initialization token for suggestions, one-time initialization function for suggestions);
    }
    uint64_t v22 = type metadata accessor for Logger(0LL);
    uint64_t v23 = __swift_project_value_buffer(v22, (uint64_t)static Logger.suggestions);
    uint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_0, v24, v25, "Unable to find server suggestionID", v26, 2u);
      swift_slowDealloc(v26, -1LL, -1LL);
    }

    uint64_t v27 = *(void *)(v0 + 104);

    *(void *)(v27 + 32) = 0LL;
    *(_OWORD *)uint64_t v27 = 0u;
    *(_OWORD *)(v27 + 16) = 0u;
    uint64_t v28 = *(void *)(v0 + 176);
    uint64_t v29 = *(void *)(v0 + 184);
    uint64_t v30 = *(void *)(v0 + 168);
    uint64_t v31 = *(void *)(v0 + 144);
    swift_task_dealloc(*(void *)(v0 + 208));
    swift_task_dealloc(v29);
    swift_task_dealloc(v28);
    swift_task_dealloc(v30);
    swift_task_dealloc(v31);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v1 = v0[27];
  uint64_t v3 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v4 = v0[19];
  Context.setUtterance(_:)(v2, v0[29], v0[28]);
  swift_unknownObjectRelease(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch(InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:), 0LL, 0LL);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1Tm(v0 + 2, v1);
  uint64_t v3 = dispatch thunk of CandidateSuggestion.context.getter(v1, v2);
  uint64_t v5 = v4;
  v0[30] = v3;
  v0[31] = v4;
  uint64_t ObjectType = swift_getObjectType(v3);
  v0[32] = ObjectType;
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v5 + 8) + 8LL));
  return swift_task_switch(InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:), v7, v8);
}

{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  uint64_t v1 = *(void *)(v0 + 240);
  v2._object = (void *)0x8000000000012380LL;
  v2._countAndFlagsBits = 0xD000000000000015LL;
  Context.setServerIntent(_:)(v2);
  swift_unknownObjectRelease(v1);
  return swift_task_switch(InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:), 0LL, 0LL);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_s *v7;
  os_log_type_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  if (one-time initialization token for suggestions != -1) {
    swift_once(&one-time initialization token for suggestions, one-time initialization function for suggestions);
  }
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v5 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v5, (uint64_t)static Logger.suggestions);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  unint64_t v8 = static os_log_type_t.debug.getter();
  uint64_t v9 = os_log_type_enabled(v7, v8);
  uint64_t v11 = *(void *)(v0 + 136);
  uint64_t v10 = *(void *)(v0 + 144);
  uint64_t v12 = *(void *)(v0 + 128);
  if (v9)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v14 = swift_slowAlloc(32LL, -1LL);
    uint64_t v24 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v15 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate and conformance Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate,  (uint64_t)&protocol conformance descriptor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate);
    uint64_t v16 = Message.debugDescription.getter(v12, v15);
    char v18 = v17;
    *(void *)(v0 + 96) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v17, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease(v18);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    _os_log_impl(&dword_0, v7, v8, "Found and constructed server based alternate query suggestion: %s", v13, 0xCu);
    swift_arrayDestroy(v14, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(void, void))(v11 + 8))(*(void *)(v0 + 144), *(void *)(v0 + 128));
  }

  outlined init with copy of CandidateSuggestion(v0 + 16, *(void *)(v0 + 104));
  __swift_destroy_boxed_opaque_existential_1Tm((void *)(v0 + 16));
  uint64_t v19 = *(void *)(v0 + 176);
  uint64_t v20 = *(void *)(v0 + 184);
  uint64_t v21 = *(void *)(v0 + 168);
  uint64_t v22 = *(void *)(v0 + 144);
  swift_task_dealloc(*(void *)(v0 + 208));
  swift_task_dealloc(v20);
  swift_task_dealloc(v19);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[14] = a2;
  v3[15] = a3;
  v3[13] = a1;
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate(0LL);
  v3[16] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[17] = v5;
  v3[18] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance(0LL);
  v3[19] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[20] = v7;
  v3[21] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Preference?);
  v3[22] = swift_task_alloc((*(void *)(*(void *)(v8 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DeliveryVehicle?);
  v3[23] = swift_task_alloc((*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Objective(0LL);
  v3[24] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[25] = v11;
  v3[26] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:), 0LL, 0LL);
}

uint64_t InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:)()
{
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v5 = *(void *)(v0 + 176);
  uint64_t v6 = *(void **)(v0 + 120);
  uint64_t v7 = v6[3];
  uint64_t v30 = v6[4];
  __swift_project_boxed_opaque_existential_1Tm(v6, v7);
  unint64_t v8 = specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&_swiftEmptyArrayStorage);
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v2, enum case for Objective.discoverability(_:), v3);
  uint64_t v9 = type metadata accessor for DeliveryVehicle(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v4, 1LL, 1LL, v9);
  uint64_t v10 = type metadata accessor for Preference(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v5, 1LL, 1LL, v10);
  CandidateSuggestionFactory.create(suggestionId:params:objective:deliveryVehicle:preference:)( 0xD000000000000010LL,  0x8000000000011E10LL,  v8,  v2,  v4,  v5,  v7,  v30);
  swift_bridgeObjectRelease(v8);
  outlined destroy of Any?(v5, &demangling cache variable for type metadata for Preference?);
  outlined destroy of Any?(v4, &demangling cache variable for type metadata for DeliveryVehicle?);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  if (*(void *)(v0 + 80))
  {
    outlined init with take of CandidateSuggestion((__int128 *)(v0 + 56), v0 + 16);
    uint64_t v11 = *(void *)(v0 + 40);
    uint64_t v12 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1Tm((void *)(v0 + 16), v11);
    uint64_t v13 = dispatch thunk of CandidateSuggestion.context.getter(v11, v12);
    uint64_t v15 = v14;
    *(void *)(v0 + 216) = v13;
    *(void *)(v0 + 224) = v14;
    uint64_t ObjectType = swift_getObjectType(v13);
    *(void *)(v0 + 232) = ObjectType;
    Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.utterance.getter();
    uint64_t v17 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, *(void *)(*(void *)(v15 + 8) + 8LL));
    return swift_task_switch(InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:), v17, v18);
  }

  else
  {
    outlined destroy of Any?(v0 + 56, &demangling cache variable for type metadata for CandidateSuggestion?);
    if (one-time initialization token for suggestions != -1) {
      swift_once(&one-time initialization token for suggestions, one-time initialization function for suggestions);
    }
    uint64_t v20 = type metadata accessor for Logger(0LL);
    uint64_t v21 = __swift_project_value_buffer(v20, (uint64_t)static Logger.suggestions);
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_0, v22, v23, "Unable to find server suggestionID", v24, 2u);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    uint64_t v25 = *(void *)(v0 + 104);

    *(void *)(v25 + 32) = 0LL;
    *(_OWORD *)uint64_t v25 = 0u;
    *(_OWORD *)(v25 + 16) = 0u;
    uint64_t v26 = *(void *)(v0 + 176);
    uint64_t v27 = *(void *)(v0 + 184);
    uint64_t v28 = *(void *)(v0 + 168);
    uint64_t v29 = *(void *)(v0 + 144);
    swift_task_dealloc(*(void *)(v0 + 208));
    swift_task_dealloc(v27);
    swift_task_dealloc(v26);
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v1 = v0[27];
  uint64_t v3 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v4 = v0[19];
  Context.setUtterance(_:)(v2, v0[29], v0[28]);
  swift_unknownObjectRelease(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch(InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:), 0LL, 0LL);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_s *v7;
  os_log_type_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  if (one-time initialization token for suggestions != -1) {
    swift_once(&one-time initialization token for suggestions, one-time initialization function for suggestions);
  }
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v5 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v5, (uint64_t)static Logger.suggestions);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  unint64_t v8 = static os_log_type_t.debug.getter();
  uint64_t v9 = os_log_type_enabled(v7, v8);
  uint64_t v11 = *(void *)(v0 + 136);
  uint64_t v10 = *(void *)(v0 + 144);
  uint64_t v12 = *(void *)(v0 + 128);
  if (v9)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v14 = swift_slowAlloc(32LL, -1LL);
    uint64_t v24 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v15 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate,  (uint64_t)&protocol conformance descriptor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate);
    uint64_t v16 = Message.debugDescription.getter(v12, v15);
    uint64_t v18 = v17;
    *(void *)(v0 + 96) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v17, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease(v18);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    _os_log_impl(&dword_0, v7, v8, "Found and constructed server based related questions suggestion: %s", v13, 0xCu);
    swift_arrayDestroy(v14, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(void, void))(v11 + 8))(*(void *)(v0 + 144), *(void *)(v0 + 128));
  }

  outlined init with copy of CandidateSuggestion(v0 + 16, *(void *)(v0 + 104));
  __swift_destroy_boxed_opaque_existential_1Tm((void *)(v0 + 16));
  uint64_t v19 = *(void *)(v0 + 176);
  uint64_t v20 = *(void *)(v0 + 184);
  uint64_t v21 = *(void *)(v0 + 168);
  uint64_t v22 = *(void *)(v0 + 144);
  swift_task_dealloc(*(void *)(v0 + 208));
  swift_task_dealloc(v20);
  swift_task_dealloc(v19);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t Context.setUtterance(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once( &one-time initialization token for kOwnerInformation,  one-time initialization function for kOwnerInformation);
  }
  uint64_t v6 = static SuggestionConstants.kOwnerInformation;
  v11[3] = type metadata accessor for DomainOwner(0LL);
  v11[4] = &protocol witness table for DomainOwner;
  v11[0] = v6;
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance(0LL);
  v10[3] = v7;
  boxed_opaque_existential_0Tm = __swift_allocate_boxed_opaque_existential_0Tm(v10);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16LL))( boxed_opaque_existential_0Tm,  a1,  v7);
  swift_retain(v6);
  Context.setParam(for:key:value:)(v11, 0xD000000000000010LL, 0x8000000000011E70LL, v10, a2, a3);
  __swift_destroy_boxed_opaque_existential_1Tm(v10);
  return __swift_destroy_boxed_opaque_existential_1Tm(v11);
}

Swift::Void __swiftcall Context.setServerIntent(_:)(Swift::String a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once( &one-time initialization token for kOwnerInformation,  one-time initialization function for kOwnerInformation);
  }
  uint64_t v7 = static SuggestionConstants.kOwnerInformation;
  v12[3] = type metadata accessor for DomainOwner(0LL);
  void v12[4] = &protocol witness table for DomainOwner;
  v12[0] = v7;
  uint64_t v8 = one-time initialization token for serverIntentName;
  swift_retain(v7);
  if (v8 != -1) {
    swift_once( &one-time initialization token for serverIntentName,  one-time initialization function for serverIntentName);
  }
  uint64_t v9 = static SuggestionConstants.serverIntentName;
  uint64_t v10 = unk_189C0;
  v11[3] = &type metadata for String;
  v11[0] = countAndFlagsBits;
  v11[1] = object;
  swift_bridgeObjectRetain(object);
  Context.setParam(for:key:value:)(v12, v9, v10, v11, v4, v3);
  __swift_destroy_boxed_opaque_existential_1Tm(v11);
  __swift_destroy_boxed_opaque_existential_1Tm(v12);
}

uint64_t InfoServerGenerator.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t protocol witness for InternalGenerator.generateCandidateSuggestions(interaction:environment:factory:) in conformance InfoServerGenerator( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_task_alloc(dword_1846C);
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:) in conformance InfoServerSuggestionDefinitionFactory;
  return InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:)(a1, v7, a3);
}

uint64_t FromContextResolver.resolverTypeOperand.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain(*(void *)(v0 + 24));
  return v1;
}

uint64_t FromContextResolver.propertyExtractor.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain(*(void *)(v0 + 40));
  return v1;
}

void *FromContextResolver.init(resolverTypeOperand:propertyExtractor:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = a4;
  return v4;
}

uint64_t FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc(unk_184C4);
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:) in conformance InfoServerSuggestionDefinitionFactory;
  return v10(a2, a3, a4);
}

uint64_t FromContextResolver.deinit()
{
  return v0;
}

uint64_t FromContextResolver.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 48LL, 7LL);
}

uint64_t protocol witness for InternalResolver.resolverTypeOperand.getter in conformance FromContextResolver()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16LL);
  swift_bridgeObjectRetain(*(void *)(*(void *)v0 + 24LL));
  return v1;
}

uint64_t protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance FromContextResolver( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc(unk_184C4);
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance FromContextResolver;
  return v10(a2, a3, a4);
}

uint64_t protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance FromContextResolver( uint64_t a1)
{
  uint64_t v4 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 16));
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( char *a1, int64_t a2, char a3, char *a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( a1,  a2,  a3,  a4,  &demangling cache variable for type metadata for _ContiguousArrayStorage<OwnerDefinition>,  &demangling cache variable for type metadata for OwnerDefinition);
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( char *result, int64_t a2, char a3, char *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }

  unint64_t v9 = *((void *)a4 + 3);
  uint64_t v10 = v9 >> 1;
  if (v10 + 0x4000000000000000LL >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v11 = *((void *)a4 + 2);
    if (v10 <= v11) {
      uint64_t v12 = *((void *)a4 + 2);
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(a5);
      uint64_t v14 = (char *)swift_allocObject(v13, 40 * v12 + 32, 7LL);
      size_t v15 = _swift_stdlib_malloc_size(v14);
      *((void *)v14 + 2) = v11;
      *((void *)v14 + 3) = 2 * ((uint64_t)(v15 - 32) / 40);
      uint64_t v16 = v14 + 32;
      if ((v8 & 1) != 0)
      {
LABEL_13:
        if (v14 != a4 || v16 >= &a4[40 * v11 + 32]) {
          memmove(v16, a4 + 32, 40 * v11);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v16 = (char *)&_swiftEmptyArrayStorage + 32;
    }

    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0LL, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v14;
  }

  __break(1u);
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)( uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
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
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  __swift_destroy_boxed_opaque_existential_1Tm(v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)( uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
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

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0,  *(void *)(v2 + 16) + 1LL,  1,  (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( v3 > 1,  v4 + 1,  1,  (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v4, 0LL);
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

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)( uint64_t a1, uint64_t a2)
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
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = _swift_stdlib_malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = _swift_stdlib_malloc_size(v11);
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v5);
}

uint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v3 = InformationSuggestion.rawValue.getter(a1);
  uint64_t v5 = v4;
  String.hash(into:)(v8, v3, v4);
  swift_bridgeObjectRelease(v5);
  Swift::Int v6 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v6);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)( uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = a2 & ~(-1LL << *(_BYTE *)(v2 + 32));
  if (((*(void *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v3) & 1) != 0) {
    __asm { BR              X9 }
  }

  return a2 & ~(-1LL << *(_BYTE *)(v2 + 32));
}

uint64_t specialized closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Any, Any?>);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for FromContextResolver();
  int64_t v7 = (void *)swift_allocObject(v6, 48LL, 7LL);
  v7[2] = 0xD000000000000010LL;
  v7[3] = 0x8000000000011E70LL;
  v7[4] = &async function pointer to closure #1 in closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  v7[5] = 0LL;
  uint64_t v8 = *(void *)(a1 + 40);
  __int128 v34 = *(_OWORD *)(a1 + 24);
  uint64_t v9 = v34;
  __swift_project_boxed_opaque_existential_1Tm((void *)a1, v34);
  *(void *)&__int128 v42 = v6;
  *((void *)&v42 + 1) = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type FromContextResolver and conformance FromContextResolver,  v10,  (uint64_t (*)(uint64_t))type metadata accessor for FromContextResolver,  (uint64_t)&protocol conformance descriptor for FromContextResolver);
  v41[0] = v7;
  type metadata accessor for ResolvableParameter(0LL);
  uint64_t v11 = one-time initialization token for utteranceToLoggingIdTransformer;
  swift_retain(v7);
  if (v11 != -1) {
    swift_once( &one-time initialization token for utteranceToLoggingIdTransformer,  one-time initialization function for utteranceToLoggingIdTransformer);
  }
  uint64_t v12 = __swift_project_value_buffer( v2,  (uint64_t)static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v12, v2);
  uint64_t v13 = ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)( 0xD000000000000010LL,  0x8000000000011E70LL,  1LL,  v5);
  __int128 v45 = v34;
  uint64_t v46 = v8;
  __swift_allocate_boxed_opaque_existential_0Tm(v44);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)( 0xD000000000000010LL,  0x8000000000011E70LL,  v41,  v13,  v9,  v8);
  swift_release(v13);
  outlined destroy of Any?((uint64_t)v41, &demangling cache variable for type metadata for Resolver?);
  uint64_t v14 = v46;
  __int128 v33 = v45;
  uint64_t v15 = v45;
  __swift_project_boxed_opaque_existential_1Tm(v44, v45);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  uint64_t v17 = type metadata accessor for VersionedInvocation(0LL);
  uint64_t v18 = swift_allocObject( v16,  ((*(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL))
        + *(void *)(*(void *)(v17 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL) | 7LL);
  __int128 v34 = xmmword_11530;
  *(_OWORD *)(v18 + 16) = xmmword_11530;
  static VersionedInvocations.latest.getter();
  __int128 v42 = v33;
  uint64_t v43 = v14;
  __swift_allocate_boxed_opaque_existential_0Tm(v41);
  dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)(v18, v15, v14);
  swift_bridgeObjectRelease(v18);
  uint64_t v19 = v43;
  __int128 v33 = v42;
  uint64_t v20 = v42;
  __swift_project_boxed_opaque_existential_1Tm(v41, v42);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeliveryVehicle>);
  uint64_t v22 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned __int8 *)(v23 + 80);
  uint64_t v25 = (v24 + 32) & ~v24;
  uint64_t v26 = swift_allocObject(v21, v25 + *(void *)(v23 + 72), v24 | 7);
  *(_OWORD *)(v26 + 16) = v34;
  (*(void (**)(uint64_t, void, uint64_t))(v23 + 104))( v26 + v25,  enum case for DeliveryVehicle.assistantSuggestions(_:),  v22);
  __int128 v39 = v33;
  uint64_t v40 = v19;
  __swift_allocate_boxed_opaque_existential_0Tm(v38);
  dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)(v26, v20, v19);
  swift_bridgeObjectRelease(v26);
  uint64_t v27 = v40;
  __int128 v33 = v39;
  uint64_t v28 = v39;
  __swift_project_boxed_opaque_existential_1Tm(v38, v39);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
  uint64_t v30 = type metadata accessor for Locale(0LL);
  uint64_t v31 = swift_allocObject( v29,  ((*(unsigned __int8 *)(*(void *)(v30 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v30 - 8) + 80LL))
        + *(void *)(*(void *)(v30 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v30 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v31 + 16) = v34;
  Locale.init(identifier:)(0x53552D6E65LL, 0xE500000000000000LL);
  __int128 v36 = v33;
  uint64_t v37 = v27;
  __swift_allocate_boxed_opaque_existential_0Tm(v35);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)(v31, v28, v27);
  swift_bridgeObjectRelease(v31);
  swift_release(v7);
  __swift_destroy_boxed_opaque_existential_1Tm(v35);
  __swift_destroy_boxed_opaque_existential_1Tm(v38);
  __swift_destroy_boxed_opaque_existential_1Tm(v41);
  return __swift_destroy_boxed_opaque_existential_1Tm(v44);
}

uint64_t sub_CECC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_CEDC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_CF00()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for InfoServerGenerator()
{
  return objc_opt_self(&OBJC_CLASS____TtC32SiriInformationSuggestionsPlugin19InfoServerGenerator);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined copy of Data._Representation(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain(result);
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
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

uint64_t outlined init with take of CandidateSuggestion(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t outlined init with copy of CandidateSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined init with copy of Decodable & Encodable & Sendable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:)( uint64_t a1)
{
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = v1;
  return swift_task_switch( specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:),  0LL,  0LL);
}

uint64_t specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:)()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = *(int **)(v0[11] + 32LL);
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  __swift_project_boxed_opaque_existential_1Tm(v1, v3);
  uint64_t v5 = dispatch thunk of CandidateSuggestion.context.getter(v3, v4);
  uint64_t v7 = v6;
  v0[12] = v5;
  uint64_t v10 = (int *)((char *)v2 + *v2);
  uint64_t v8 = (void *)swift_task_alloc(v2[1]);
  v0[13] = v8;
  *uint64_t v8 = v0;
  v8[1] = specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:);
  return ((uint64_t (*)(void *, uint64_t, uint64_t))v10)(v0 + 6, v5, v7);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v1 = *(void *)(*(void *)v0 + 96LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 104LL));
  swift_unknownObjectRelease(v1);
  return swift_task_switch( specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:),  0LL,  0LL);
}

{
  uint64_t v0;
  _OWORD *v1;
  uint64_t v2;
  _OWORD *v3;
  uint64_t v1 = (_OWORD *)(v0 + 48);
  if (*(void *)(v0 + 72))
  {
    outlined init with take of Any(v1, (_OWORD *)(v0 + 16));
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v3 = (_OWORD *)swift_allocObject(v2, 64LL, 7LL);
    v3[1] = xmmword_11530;
    outlined init with take of Any((_OWORD *)(v0 + 16), v3 + 2);
  }

  else
  {
    outlined destroy of Any?((uint64_t)v1, &demangling cache variable for type metadata for Any?);
    uint64_t v3 = &_swiftEmptyArrayStorage;
  }

  return (*(uint64_t (**)(_OWORD *))(v0 + 8))(v3);
}

unint64_t lazy protocol witness table accessor for type SiriSuggestionsFeatureFlags and conformance SiriSuggestionsFeatureFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type SiriSuggestionsFeatureFlags and conformance SiriSuggestionsFeatureFlags;
  if (!lazy protocol witness table cache variable for type SiriSuggestionsFeatureFlags and conformance SiriSuggestionsFeatureFlags)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for SiriSuggestionsFeatureFlags,  &type metadata for SiriSuggestionsFeatureFlags);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type SiriSuggestionsFeatureFlags and conformance SiriSuggestionsFeatureFlags);
  }

  return result;
}

uint64_t base witness table accessor for InternalGenerator in InfoServerGenerator(uint64_t a1, uint64_t a2)
{
  return lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type InfoServerGenerator and conformance InfoServerGenerator,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for InfoServerGenerator,  (uint64_t)&protocol conformance descriptor for InfoServerGenerator);
}

uint64_t base witness table accessor for Wrappable in InfoServerGenerator(uint64_t a1, uint64_t a2)
{
  return lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type InfoServerGenerator and conformance InfoServerGenerator,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for InfoServerGenerator,  (uint64_t)&protocol conformance descriptor for InfoServerGenerator);
}

uint64_t base witness table accessor for InternalResolver in FromContextResolver(uint64_t a1, uint64_t a2)
{
  return lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type FromContextResolver and conformance FromContextResolver,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for FromContextResolver,  (uint64_t)&protocol conformance descriptor for FromContextResolver);
}

uint64_t type metadata accessor for FromContextResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC32SiriInformationSuggestionsPlugin19FromContextResolver);
}

uint64_t base witness table accessor for Wrappable in FromContextResolver(uint64_t a1, uint64_t a2)
{
  return lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type FromContextResolver and conformance FromContextResolver,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for FromContextResolver,  (uint64_t)&protocol conformance descriptor for FromContextResolver);
}

uint64_t getEnumTagSinglePayload for SiriSuggestionsFeatureFlags(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for SiriSuggestionsFeatureFlags(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_D420 + 4 * byte_11578[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_D440 + 4 * byte_1157D[v4]))();
  }
}

_BYTE *sub_D420(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_D440(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_D448(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_D450(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_D458(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_D460(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t getEnumTag for SiriSuggestionsFeatureFlags()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for SiriSuggestionsFeatureFlags()
{
  return &type metadata for SiriSuggestionsFeatureFlags;
}

uint64_t type metadata accessor for InfoServerSuggestionDefinitionFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC32SiriInformationSuggestionsPlugin37InfoServerSuggestionDefinitionFactory);
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v5 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v7 = a4 + 40 * a1 + 32;
  unint64_t v8 = a3 + 40 * v5;
  if (v7 >= v8 || v7 + 40 * v5 <= a3)
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(a5);
    swift_arrayInitWithCopy(a3, v7, v5, v10);
    return v8;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
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

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }

  return result;
}

void *__swift_project_boxed_opaque_existential_1Tm(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
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

void *__swift_allocate_boxed_opaque_existential_0Tm(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t outlined destroy of Any?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)( uint64_t (*a1)(void))
{
  return a1();
}

uint64_t one-time initialization function for resolvers()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Resolver>);
  uint64_t v1 = swift_allocObject(v0, 72LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_11530;
  uint64_t v2 = type metadata accessor for SolarEventResolver();
  uint64_t v3 = swift_allocObject(v2, 32LL, 7LL);
  *(void *)(v3 + 16) = 0xD000000000000010LL;
  *(void *)(v3 + 24) = 0x8000000000011E90LL;
  *(void *)(v1 + 56) = v2;
  uint64_t result = lazy protocol witness table accessor for type SolarEventResolver and conformance SolarEventResolver( &lazy protocol witness table cache variable for type SolarEventResolver and conformance SolarEventResolver,  (uint64_t)&protocol conformance descriptor for SolarEventResolver);
  *(void *)(v1 + 64) = result;
  *(void *)(v1 + 32) = v3;
  static InformationSuggestionsResolvableParameter.resolvers = v1;
  return result;
}

uint64_t SolarEventResolver.__allocating_init()()
{
  uint64_t result = swift_allocObject(v0, 32LL, 7LL);
  *(void *)(result + 16) = 0xD000000000000010LL;
  *(void *)(result + 24) = 0x8000000000011E90LL;
  return result;
}

uint64_t *InformationSuggestionsResolvableParameter.resolvers.unsafeMutableAddressor()
{
  if (one-time initialization token for resolvers != -1) {
    swift_once(&one-time initialization token for resolvers, one-time initialization function for resolvers);
  }
  return &static InformationSuggestionsResolvableParameter.resolvers;
}

uint64_t static InformationSuggestionsResolvableParameter.resolvers.getter()
{
  if (one-time initialization token for resolvers != -1) {
    swift_once(&one-time initialization token for resolvers, one-time initialization function for resolvers);
  }
  return swift_bridgeObjectRetain(static InformationSuggestionsResolvableParameter.resolvers);
}

BOOL InformationSuggestionsResolvableParameter.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)( (Swift::OpaquePointer)&outlined read-only object #0 of InformationSuggestionsResolvableParameter.init(rawValue:),  v2);
  swift_bridgeObjectRelease(object);
  return v3 != 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance InformationSuggestionsResolvableParameter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance InformationSuggestionsResolvableParameter( uint64_t a1)
{
  return String.hash(into:)(a1, 0xD000000000000010LL, 0x8000000000011E90LL);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance InformationSuggestionsResolvableParameter( uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance InformationSuggestionsResolvableParameter@<X0>( uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v3._uint64_t countAndFlagsBits = *a1;
  uint64_t v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)( (Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance InformationSuggestionsResolvableParameter,  v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance InformationSuggestionsResolvableParameter( void *a1@<X8>)
{
  *a1 = 0xD000000000000010LL;
  a1[1] = 0x8000000000011E90LL;
}

uint64_t SolarEventResolver.nightBeginsAtHour.getter()
{
  return 18LL;
}

uint64_t SolarEventResolver.nightEndsAtHour.getter()
{
  return 6LL;
}

Swift::Bool __swiftcall SolarEventResolver.isNight(hour:)(Swift::Int hour)
{
  return (unint64_t)(hour - 18) < 0xFFFFFFFFFFFFFFF4LL;
}

uint64_t SolarEventResolver.resolveParameter(parameter:suggestion:interaction:environment:)()
{
  return swift_task_switch(SolarEventResolver.resolveParameter(parameter:suggestion:interaction:environment:), 0LL, 0LL);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v1 = specialized SolarEventResolver.resolveParameter()();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t SolarEventResolver.deinit()
{
  return v0;
}

uint64_t SolarEventResolver.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t SolarEventResolver.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = 0xD000000000000010LL;
  *(void *)(v0 + 24) = 0x8000000000011E90LL;
  return result;
}

uint64_t specialized SolarEventResolver.resolveParameter()()
{
  uint64_t v0 = type metadata accessor for Calendar.Component(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  Swift::String v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for Calendar(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin();
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Date.init()(v10);
  id v13 = [(id)objc_opt_self(NSCalendar) currentCalendar];
  static Calendar._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Calendar.Component.hour(_:), v0);
  uint64_t v14 = Calendar.component(_:from:)(v3, v12);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
  uint64_t v16 = swift_allocObject(v15, 64LL, 7LL);
  uint64_t v17 = v16;
  *(_OWORD *)(v16 + 16) = xmmword_11530;
  uint64_t v18 = 0x657369726E7573LL;
  unint64_t v19 = 0xE700000000000000LL;
  *(void *)(v16 + 56) = &type metadata for String;
  *(void *)(v16 + 32) = v18;
  *(void *)(v16 + 40) = v19;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  return v17;
}

uint64_t specialized SolarEventResolver.resolveParameter(date:calendar:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Calendar.Component(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Calendar.Component.hour(_:), v2);
  uint64_t v6 = Calendar.component(_:from:)(v5, a1);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
  uint64_t result = swift_allocObject(v7, 64LL, 7LL);
  *(_OWORD *)(result + 16) = xmmword_11530;
  uint64_t v9 = 0x657369726E7573LL;
  unint64_t v10 = 0xE700000000000000LL;
  *(void *)(result + 56) = &type metadata for String;
  *(void *)(result + 32) = v9;
  *(void *)(result + 40) = v10;
  return result;
}

unint64_t lazy protocol witness table accessor for type InformationSuggestionsResolvableParameter and conformance InformationSuggestionsResolvableParameter()
{
  unint64_t result = lazy protocol witness table cache variable for type InformationSuggestionsResolvableParameter and conformance InformationSuggestionsResolvableParameter;
  if (!lazy protocol witness table cache variable for type InformationSuggestionsResolvableParameter and conformance InformationSuggestionsResolvableParameter)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for InformationSuggestionsResolvableParameter,  &type metadata for InformationSuggestionsResolvableParameter);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type InformationSuggestionsResolvableParameter and conformance InformationSuggestionsResolvableParameter);
  }

  return result;
}

uint64_t base witness table accessor for InternalResolver in SolarEventResolver()
{
  return lazy protocol witness table accessor for type SolarEventResolver and conformance SolarEventResolver( &lazy protocol witness table cache variable for type SolarEventResolver and conformance SolarEventResolver,  (uint64_t)&protocol conformance descriptor for SolarEventResolver);
}

uint64_t type metadata accessor for SolarEventResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC32SiriInformationSuggestionsPlugin18SolarEventResolver);
}

uint64_t base witness table accessor for Wrappable in SolarEventResolver()
{
  return lazy protocol witness table accessor for type SolarEventResolver and conformance SolarEventResolver( &lazy protocol witness table cache variable for type SolarEventResolver and conformance SolarEventResolver,  (uint64_t)&protocol conformance descriptor for SolarEventResolver);
}

uint64_t storeEnumTagSinglePayload for InformationSuggestionsResolvableParameter(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_DEFC + 4 * asc_11830[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_DF1C + 4 * byte_11835[v4]))();
  }
}

_BYTE *sub_DEFC(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_DF1C(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_DF24(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_DF2C(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_DF34(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_DF3C(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for InformationSuggestionsResolvableParameter()
{
  return &type metadata for InformationSuggestionsResolvableParameter;
}

uint64_t lazy protocol witness table accessor for type SolarEventResolver and conformance SolarEventResolver( unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for SolarEventResolver();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t Logger.suggestions.unsafeMutableAddressor()
{
  if (one-time initialization token for suggestions != -1) {
    swift_once(&one-time initialization token for suggestions, one-time initialization function for suggestions);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.suggestions);
}

void *Logger.subsystem.unsafeMutableAddressor()
{
  return &static Logger.subsystem;
}

unint64_t static Logger.subsystem.getter()
{
  return 0xD000000000000010LL;
}

uint64_t one-time initialization function for suggestions()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  __swift_allocate_value_buffer(v0, static Logger.suggestions);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.suggestions);
  type metadata accessor for OS_os_log();
  uint64_t v1 = OS_os_log.init(subsystem:category:)( 0xD000000000000010LL,  0x80000000000125C0LL,  0x6974736567677553LL,  0xEB00000000736E6FLL);
  return Logger.init(_:)(v1);
}

uint64_t static Logger.suggestions.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for suggestions != -1) {
    swift_once(&one-time initialization token for suggestions, one-time initialization function for suggestions);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.suggestions);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t result = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  }

  return result;
}

ValueMetadata *type metadata accessor for ParsecAlias()
{
  return &type metadata for ParsecAlias;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
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
    outlined init with copy of (String, Any)(v7, (uint64_t)&v16);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)outlined init with take of Any(&v18, (_OWORD *)(v4[7] + 32 * result));
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

{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<InformationSuggestion, [Signal]>);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (void *)(a1 + 40);
  while (1)
  {
    uint64_t v7 = *((unsigned __int8 *)v6 - 8);
    uint64_t v8 = *v6;
    swift_bridgeObjectRetain(*v6);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v7);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    *(_BYTE *)(v4[6] + result) = v7;
    *(void *)(v4[7] + 8 * result) = v8;
    char v11 = v4[2];
    uint64_t v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4[2] = v13;
    v6 += 2;
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

uint64_t one-time initialization function for kOwner()
{
  uint64_t v0 = type metadata accessor for DomainOwner(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  uint64_t result = DomainOwner.init(_:)(0x74616D726F666E49LL, 0xEB000000006E6F69LL);
  static InformationSuggestionsPluginOwnerDefinitionFactory.kOwner = result;
  return result;
}

uint64_t *InformationSuggestionsPluginOwnerDefinitionFactory.kOwner.unsafeMutableAddressor()
{
  if (one-time initialization token for kOwner != -1) {
    swift_once(&one-time initialization token for kOwner, one-time initialization function for kOwner);
  }
  return &static InformationSuggestionsPluginOwnerDefinitionFactory.kOwner;
}

uint64_t static InformationSuggestionsPluginOwnerDefinitionFactory.kOwner.getter()
{
  if (one-time initialization token for kOwner != -1) {
    swift_once(&one-time initialization token for kOwner, one-time initialization function for kOwner);
  }
  return swift_retain(static InformationSuggestionsPluginOwnerDefinitionFactory.kOwner);
}

void *InformationSuggestionsPluginOwnerDefinitionFactory.kTemplateRoot.unsafeMutableAddressor()
{
  return &static InformationSuggestionsPluginOwnerDefinitionFactory.kTemplateRoot;
}

unint64_t static InformationSuggestionsPluginOwnerDefinitionFactory.kTemplateRoot.getter()
{
  return 0xD000000000000054LL;
}

uint64_t static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1, uint64_t a2)
{
  v3[14] = a2;
  v3[15] = v2;
  v3[13] = a1;
  return swift_task_switch( static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL,  0LL);
}

uint64_t static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once( &one-time initialization token for kOwnerInformation,  one-time initialization function for kOwnerInformation);
  }
  uint64_t v1 = (int *)v0[13];
  uint64_t v2 = static SuggestionConstants.kOwnerInformation;
  v0[5] = type metadata accessor for DomainOwner(0LL);
  v0[6] = _s18SiriSuggestionsKit11DomainOwnerCAcA0E0AAWlTm_0( &lazy protocol witness table cache variable for type DomainOwner and conformance DomainOwner,  (uint64_t (*)(uint64_t))&type metadata accessor for DomainOwner,  (uint64_t)&protocol conformance descriptor for DomainOwner);
  v0[2] = v2;
  uint64_t v3 = v1[1];
  uint64_t v6 = (uint64_t (*)(void *))((char *)v1 + *v1);
  swift_retain(v2);
  uint64_t v4 = (void *)swift_task_alloc(v3);
  v0[16] = v4;
  *uint64_t v4 = v0;
  v4[1] = static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:);
  return v6(v0 + 2);
}

{
  void *v0;
  uint64_t v1;
  unsigned __int8 *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v1 = 20LL;
  uint64_t v2 = (unsigned __int8 *)&byte_148B0;
  do
  {
    uint64_t v16 = v0[15];
    uint64_t v3 = *v2++;
    uint64_t v4 = specialized static InformationSuggestionsPluginOwnerDefinitionFactory.enabledLocales(for:)(v3);
    uint64_t v5 = InformationSuggestion.rawValue.getter(v3);
    uint64_t v7 = v6;
    _StringGuts.grow(_:)(25LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v8._uint64_t countAndFlagsBits = v5;
    v8._object = v7;
    String.append(_:)(v8);
    swift_bridgeObjectRelease(v7);
    uint64_t v9 = swift_task_alloc(48LL);
    *(_BYTE *)(v9 + 16) = v3;
    *(void *)(v9 + 24) = v4;
    *(void *)(v9 + 32) = v16;
    unint64_t v10 = dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)( v5,  v7,  0xD000000000000017LL,  0x8000000000012640LL,  partial apply for closure #1 in closure #1 in static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:),  v9);
    swift_bridgeObjectRelease(0x8000000000012640LL);
    swift_bridgeObjectRelease(v7);
    swift_release(v10);
    swift_bridgeObjectRelease(v4);
    char v11 = swift_task_dealloc(v9);
    --v1;
  }

  while (v1);
  dispatch thunk of SuggestionOwnerDefinitionBuilder.build()(v11);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<OwnerDefinition>);
  uint64_t v13 = swift_allocObject(v12, 72LL, 7LL);
  *(_OWORD *)(v13 + 16) = xmmword_11530;
  outlined init with copy of CandidateSuggestion((uint64_t)(v0 + 7), v13 + 32);
  v0[12] = v13;
  type metadata accessor for InfoServerSuggestionDefinitionFactory();
  BOOL v14 = (void *)swift_task_alloc(dword_183FC);
  v0[18] = v14;
  *BOOL v14 = v0;
  v14[1] = static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:);
  return static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(v0[13], v0[14]);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v1 = *(void *)(v0 + 136);
  specialized Array.append<A>(contentsOf:)(*(void *)(v0 + 152));
  swift_release(v1);
  __swift_destroy_boxed_opaque_existential_1Tm((void *)(v0 + 56));
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 96));
}

uint64_t static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1)
{
  uint64_t v2 = (void *)(*(void *)v1 + 16LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 128LL);
  *(void *)(*(void *)v1 + 136LL) = a1;
  swift_task_dealloc(v3);
  __swift_destroy_boxed_opaque_existential_1Tm(v2);
  return swift_task_switch( static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL,  0LL);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v2 = *(void *)(*(void *)v1 + 144LL);
  *(void *)(*(void *)v1 + 152LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch( static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL,  0LL);
}

_UNKNOWN **static InformationSuggestion.allCases.getter()
{
  return &outlined read-only object #0 of static InformationSuggestion.allCases.getter;
}

uint64_t InformationSuggestion.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_E8B8 + 4 * byte_11B10[a1]))( 0xD000000000000014LL,  0x8000000000011F60LL);
}

uint64_t sub_E8B8()
{
  return v0 + 7;
}

unint64_t InformationSuggestion.catIdentifier.getter(unsigned __int8 a1)
{
  v2._uint64_t countAndFlagsBits = InformationSuggestion.rawValue.getter(a1);
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  return 0xD000000000000017LL;
}

uint64_t closure #1 in closure #1 in static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)v72;
  __int128 v43 = *(_OWORD *)&v72[8];
  __swift_project_boxed_opaque_existential_1Tm(v71, *(uint64_t *)v72);
  if (one-time initialization token for signals != -1) {
    swift_once(&one-time initialization token for signals, one-time initialization function for signals);
  }
  uint64_t v7 = static InformationSuggestionSignals.signals;
  __int128 v42 = (void *)a1;
  if (*(void *)((char *)&dword_10 + (void)static InformationSuggestionSignals.signals)
    && (uint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)(a2), (v9 & 1) != 0))
  {
    unint64_t v10 = *(void **)(*(void *)&stru_20.segname[(void)v7 + 16] + 8 * v8);
    swift_bridgeObjectRetain(v10);
  }

  else
  {
    unint64_t v10 = &_swiftEmptyArrayStorage;
  }

  *(void *)v70 = v6;
  *(_OWORD *)&v70[8] = v43;
  __swift_allocate_boxed_opaque_existential_0Tm(v69);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)(v10, v6, v43);
  swift_bridgeObjectRelease(v10);
  uint64_t v11 = *(void *)&v70[16];
  __int128 v44 = *(_OWORD *)v70;
  uint64_t v12 = *(void *)v70;
  __swift_project_boxed_opaque_existential_1Tm(v69, *(uint64_t *)v70);
  __int128 v67 = v44;
  uint64_t v68 = v11;
  __swift_allocate_boxed_opaque_existential_0Tm(v66);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)(a3, v12, v11);
  uint64_t v13 = v68;
  __int128 v45 = v67;
  uint64_t v14 = v67;
  __swift_project_boxed_opaque_existential_1Tm(v66, v67);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeviceType>);
  uint64_t v16 = type metadata accessor for DeviceType(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 72);
  uint64_t v19 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = (v19 + 32) & ~v19;
  uint64_t v21 = swift_allocObject(v15, v20 + 3 * v18, v19 | 7);
  *(_OWORD *)(v21 + 16) = xmmword_11A80;
  uint64_t v22 = v21 + v20;
  uint64_t v23 = *(void (**)(uint64_t, void, uint64_t))(v17 + 104);
  v23(v22, enum case for DeviceType.iPhone(_:), v16);
  v23(v22 + v18, enum case for DeviceType.iPad(_:), v16);
  v23(v22 + 2 * v18, enum case for DeviceType.mac(_:), v16);
  __int128 v64 = v45;
  uint64_t v65 = v13;
  __swift_allocate_boxed_opaque_existential_0Tm(v63);
  dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)(v21, v14, v13);
  swift_bridgeObjectRelease(v21);
  uint64_t v24 = v65;
  __int128 v46 = v64;
  uint64_t v25 = v64;
  __swift_project_boxed_opaque_existential_1Tm(v63, v64);
  uint64_t v26 = InformationSuggestion.rawValue.getter(a2);
  uint64_t v28 = v27;
  __int128 v61 = v46;
  uint64_t v62 = v24;
  __swift_allocate_boxed_opaque_existential_0Tm(v60);
  dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)(v26, v28, v25, v24);
  swift_bridgeObjectRelease(v28);
  uint64_t v29 = v62;
  __int128 v47 = v61;
  uint64_t v30 = v61;
  __swift_project_boxed_opaque_existential_1Tm(v60, v61);
  __int128 v58 = v47;
  uint64_t v59 = v29;
  __swift_allocate_boxed_opaque_existential_0Tm(v57);
  dispatch thunk of SuggestionDetailsBuilder.requiresNetworkConnection()(v30, v29);
  uint64_t v31 = v59;
  __int128 v48 = v58;
  uint64_t v32 = v58;
  __swift_project_boxed_opaque_existential_1Tm(v57, v58);
  __int128 v55 = v48;
  uint64_t v56 = v31;
  __swift_allocate_boxed_opaque_existential_0Tm(v54);
  dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)(0xD000000000000054LL, 0x80000000000125E0LL, v32, v31);
  uint64_t v33 = v56;
  __int128 v49 = v55;
  uint64_t v34 = v55;
  __swift_project_boxed_opaque_existential_1Tm(v54, v55);
  __int128 v52 = v49;
  uint64_t v53 = v33;
  __swift_allocate_boxed_opaque_existential_0Tm(v51);
  dispatch thunk of SuggestionDetailsBuilder.exampleUtteranceDialogId(_:)( 0xD000000000000010LL,  0x8000000000011E70LL,  v34,  v33);
  __swift_destroy_boxed_opaque_existential_1Tm(v51);
  __swift_destroy_boxed_opaque_existential_1Tm(v54);
  __swift_destroy_boxed_opaque_existential_1Tm(v57);
  __swift_destroy_boxed_opaque_existential_1Tm(v60);
  __swift_destroy_boxed_opaque_existential_1Tm(v63);
  __swift_destroy_boxed_opaque_existential_1Tm(v66);
  __swift_destroy_boxed_opaque_existential_1Tm(v69);
  __swift_destroy_boxed_opaque_existential_1Tm(v71);
  if (v26 == 0xD000000000000011LL && v28 == 0x8000000000012130LL)
  {
    swift_bridgeObjectRelease(0x8000000000012130LL);
  }

  else
  {
    char v35 = _stringCompareWithSmolCheck(_:_:expecting:)(v26, v28, 0xD000000000000011LL, 0x8000000000012130LL, 0LL);
    uint64_t result = swift_bridgeObjectRelease(v28);
    if ((v35 & 1) == 0) {
      return result;
    }
  }

  uint64_t v37 = v42[5];
  __int128 v50 = *(_OWORD *)(v42 + 3);
  uint64_t v38 = v42[3];
  __swift_project_boxed_opaque_existential_1Tm(v42, v38);
  uint64_t v39 = type metadata accessor for SolarEventResolver();
  uint64_t v40 = swift_allocObject(v39, 32LL, 7LL);
  *(void *)(v40 + 16) = 0xD000000000000010LL;
  *(void *)(v40 + 24) = 0x8000000000011E90LL;
  *(void *)v70 = v39;
  *(void *)&v70[8] = _s18SiriSuggestionsKit11DomainOwnerCAcA0E0AAWlTm_0( &lazy protocol witness table cache variable for type SolarEventResolver and conformance SolarEventResolver,  (uint64_t (*)(uint64_t))type metadata accessor for SolarEventResolver,  (uint64_t)&protocol conformance descriptor for SolarEventResolver);
  v69[0] = v40;
  type metadata accessor for ResolvableParameter(0LL);
  uint64_t v41 = ResolvableParameter.__allocating_init(typeIdentifier:required:)(0xD000000000000010LL, 0x8000000000011E90LL, 1LL);
  *(_OWORD *)uint64_t v72 = v50;
  *(void *)&v72[16] = v37;
  __swift_allocate_boxed_opaque_existential_0Tm(v71);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)( 0x65764572616C6F73LL,  0xEA0000000000746ELL,  v69,  v41,  v38,  v37);
  swift_release(v41);
  outlined destroy of Resolver?((uint64_t)v69);
  return __swift_destroy_boxed_opaque_existential_1Tm(v71);
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }

  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }

  if (v4 <= v5) {
    int64_t v16 = v4 + v2;
  }
  else {
    int64_t v16 = v4;
  }
  uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( isUniquelyReferenced_nonNull_native,  v16,  1,  v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  unint64_t v10 = (unint64_t)&v3[40 * v9 + 32];
  if (a1 + 32 < v10 + 40 * v8 && v10 < a1 + 32 + 40 * v8) {
    goto LABEL_24;
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OwnerDefinition);
  swift_arrayInitWithCopy(v10, a1 + 32, v8, v12);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  uint64_t v13 = *((void *)v3 + 2);
  BOOL v14 = __OFADD__(v13, v8);
  uint64_t v15 = v13 + v8;
  if (!v14)
  {
    *((void *)v3 + 2) = v15;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease(a1);
    *uint64_t v1 = v3;
    return result;
  }

LABEL_23:
  __break(1u);
LABEL_24:
  char v18 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v18,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:) in conformance InformationSuggestionsPluginOwnerDefinitionFactory( uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc(dword_188BC);
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance FromContextResolver;
  v6[14] = a2;
  v6[15] = v2;
  v6[13] = a1;
  return swift_task_switch( static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL,  0LL);
}

uint64_t AppBundleIdentifier.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_F1FC + 4 * byte_11B24[a1]))( 0xD000000000000013LL,  0x8000000000011EB0LL);
}

uint64_t sub_F1FC()
{
  return v0 + 5;
}

uint64_t sub_F234()
{
  return 0x6C7070612E6D6F63LL;
}

unint64_t sub_F268()
{
  return 0xD000000000000011LL;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AppBundleIdentifier( unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance AppBundleIdentifier( a1,  a2,  a3,  a4,  (uint64_t (*)(uint64_t))AppBundleIdentifier.rawValue.getter);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance AppBundleIdentifier( uint64_t a1, uint64_t a2)
{
  return protocol witness for Hashable.hashValue.getter in conformance AppBundleIdentifier( a1,  a2,  (uint64_t (*)(uint64_t))AppBundleIdentifier.rawValue.getter);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AppBundleIdentifier( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for Hashable.hash(into:) in conformance AppBundleIdentifier( a1,  a2,  a3,  (uint64_t (*)(void))AppBundleIdentifier.rawValue.getter);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AppBundleIdentifier( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for Hashable._rawHashValue(seed:) in conformance AppBundleIdentifier( a1,  a2,  a3,  (uint64_t (*)(uint64_t))AppBundleIdentifier.rawValue.getter);
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance AppBundleIdentifier@<X0>( Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = specialized AppBundleIdentifier.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance AppBundleIdentifier@<X0>( uint64_t *a1@<X8>)
{
  uint64_t result = AppBundleIdentifier.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t InformationSuggestion.appBundleIdentifier.getter(unsigned __int8 a1)
{
  int v1 = a1;
  unint64_t result = 0xD000000000000014LL;
  switch(v1)
  {
    case 0:
    case 1:
      return result;
    case 15:
    case 16:
      unint64_t result = 0xD000000000000011LL;
      break;
    default:
      unint64_t result = 0x6C7070612E6D6F63LL;
      break;
  }

  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance InformationSuggestion( unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance AppBundleIdentifier( a1,  a2,  a3,  a4,  (uint64_t (*)(uint64_t))InformationSuggestion.rawValue.getter);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AppBundleIdentifier( unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = *a2;
  uint64_t v7 = a5(*a1);
  uint64_t v9 = v8;
  uint64_t v10 = a5(v6);
  if (v7 == v10 && v9 == v11)
  {
    char v14 = 1;
    uint64_t v13 = v9;
  }

  else
  {
    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0LL);
  }

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v13);
  return v14 & 1;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance InformationSuggestion@<X0>( uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = specialized InformationSuggestion.init(rawValue:)(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance InformationSuggestion@<X0>( uint64_t *a1@<X8>)
{
  uint64_t result = InformationSuggestion.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance InformationSuggestion( void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static InformationSuggestion.allCases.getter;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance InformationSuggestion( uint64_t a1, uint64_t a2)
{
  return protocol witness for Hashable.hashValue.getter in conformance AppBundleIdentifier( a1,  a2,  (uint64_t (*)(uint64_t))InformationSuggestion.rawValue.getter);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance AppBundleIdentifier( uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = *v3;
  Hasher.init(_seed:)(v10, 0LL);
  uint64_t v6 = a3(v5);
  uint64_t v8 = v7;
  String.hash(into:)(v10, v6, v7);
  swift_bridgeObjectRelease(v8);
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance InformationSuggestion( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for Hashable.hash(into:) in conformance AppBundleIdentifier( a1,  a2,  a3,  (uint64_t (*)(void))InformationSuggestion.rawValue.getter);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AppBundleIdentifier( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4(*v4);
  uint64_t v8 = v7;
  String.hash(into:)(a1, v6, v7);
  return swift_bridgeObjectRelease(v8);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance InformationSuggestion( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for Hashable._rawHashValue(seed:) in conformance AppBundleIdentifier( a1,  a2,  a3,  (uint64_t (*)(uint64_t))InformationSuggestion.rawValue.getter);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AppBundleIdentifier( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6 = *v4;
  Hasher.init(_seed:)(v11, a1);
  uint64_t v7 = a4(v6);
  uint64_t v9 = v8;
  String.hash(into:)(v11, v7, v8);
  swift_bridgeObjectRelease(v9);
  return Hasher._finalize()();
}

uint64_t one-time initialization function for calendar(uint64_t a1)
{
  return one-time initialization function for calendar( a1,  0xD000000000000013LL,  0x8000000000011EB0LL,  &static InformationSuggestionSignals.calendar);
}

uint64_t one-time initialization function for deviceLocked()
{
  uint64_t result = static Signal.DeviceLocked.getter();
  static InformationSuggestionSignals.deviceLocked = result;
  return result;
}

uint64_t one-time initialization function for fallback()
{
  uint64_t result = static Signal.Fallback.getter();
  static InformationSuggestionSignals.fallback = result;
  return result;
}

uint64_t one-time initialization function for homescreen()
{
  uint64_t result = static Signal.HomeScreen.getter();
  static InformationSuggestionSignals.homescreen = result;
  return result;
}

uint64_t one-time initialization function for maps(uint64_t a1)
{
  return one-time initialization function for maps(a1, 0xEE007370614D2E65LL, &static InformationSuggestionSignals.maps);
}

uint64_t one-time initialization function for safari(uint64_t a1)
{
  return one-time initialization function for calendar( a1,  0xD000000000000016LL,  0x8000000000011ED0LL,  &static InformationSuggestionSignals.safari);
}

uint64_t one-time initialization function for calendar(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = type metadata accessor for CoreSignalTypes(0LL);
  v10[3] = v7;
  void v10[4] = _s18SiriSuggestionsKit11DomainOwnerCAcA0E0AAWlTm_0( &lazy protocol witness table cache variable for type CoreSignalTypes and conformance CoreSignalTypes,  (uint64_t (*)(uint64_t))&type metadata accessor for CoreSignalTypes,  (uint64_t)&protocol conformance descriptor for CoreSignalTypes);
  boxed_opaque_existential_0Tm = __swift_allocate_boxed_opaque_existential_0Tm(v10);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104LL))( boxed_opaque_existential_0Tm,  enum case for CoreSignalTypes.app(_:),  v7);
  uint64_t result = Signal.__allocating_init(signalType:signalValue:fallbackSignals:)(v10, a2, a3, &_swiftEmptyArrayStorage);
  *a4 = result;
  return result;
}

uint64_t one-time initialization function for weather(uint64_t a1)
{
  return one-time initialization function for calendar( a1,  0xD000000000000011LL,  0x8000000000011F40LL,  &static InformationSuggestionSignals.weather);
}

uint64_t one-time initialization function for news(uint64_t a1)
{
  return one-time initialization function for maps(a1, 0xEE007377656E2E65LL, &static InformationSuggestionSignals.news);
}

uint64_t one-time initialization function for maps(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = type metadata accessor for CoreSignalTypes(0LL);
  v8[3] = v5;
  v8[4] = _s18SiriSuggestionsKit11DomainOwnerCAcA0E0AAWlTm_0( &lazy protocol witness table cache variable for type CoreSignalTypes and conformance CoreSignalTypes,  (uint64_t (*)(uint64_t))&type metadata accessor for CoreSignalTypes,  (uint64_t)&protocol conformance descriptor for CoreSignalTypes);
  boxed_opaque_existential_0Tm = __swift_allocate_boxed_opaque_existential_0Tm(v8);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v5 - 8) + 104LL))( boxed_opaque_existential_0Tm,  enum case for CoreSignalTypes.app(_:),  v5);
  type metadata accessor for Signal(0LL);
  uint64_t result = Signal.__allocating_init(signalType:signalValue:fallbackSignals:)( v8,  0x6C7070612E6D6F63LL,  a2,  &_swiftEmptyArrayStorage);
  *a3 = result;
  return result;
}

int *one-time initialization function for signals()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(InformationSuggestion, [Signal])>);
  uint64_t inited = swift_initStackObject(v0, v84);
  *(_OWORD *)(inited + 16) = xmmword_11A90;
  *(_BYTE *)(inited + 32) = 0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v3 = swift_allocObject(v2, 64LL, 7LL);
  *(_OWORD *)(v3 + 16) = xmmword_11AA0;
  if (one-time initialization token for deviceLocked != -1) {
    swift_once(&one-time initialization token for deviceLocked, one-time initialization function for deviceLocked);
  }
  uint64_t v4 = static InformationSuggestionSignals.deviceLocked;
  *(void *)(v3 + 32) = static InformationSuggestionSignals.deviceLocked;
  uint64_t v5 = one-time initialization token for fallback;
  swift_retain(v4);
  if (v5 != -1) {
    swift_once(&one-time initialization token for fallback, one-time initialization function for fallback);
  }
  uint64_t v6 = static InformationSuggestionSignals.fallback;
  *(void *)(v3 + 40) = static InformationSuggestionSignals.fallback;
  uint64_t v7 = one-time initialization token for homescreen;
  swift_retain(v6);
  if (v7 != -1) {
    swift_once(&one-time initialization token for homescreen, one-time initialization function for homescreen);
  }
  uint64_t v8 = static InformationSuggestionSignals.homescreen;
  *(void *)(v3 + 48) = static InformationSuggestionSignals.homescreen;
  uint64_t v9 = one-time initialization token for safari;
  swift_retain(v8);
  if (v9 != -1) {
    swift_once(&one-time initialization token for safari, one-time initialization function for safari);
  }
  uint64_t v10 = static InformationSuggestionSignals.safari;
  *(void *)(v3 + 56) = static InformationSuggestionSignals.safari;
  ((void (*)(void))specialized Array._endMutation())();
  *(void *)(inited + 40) = v3;
  *(_BYTE *)(inited + 48) = 1;
  uint64_t v11 = swift_allocObject(v2, 56LL, 7LL);
  *(_OWORD *)(v11 + 16) = xmmword_11AB0;
  uint64_t v12 = static InformationSuggestionSignals.deviceLocked;
  uint64_t v13 = static InformationSuggestionSignals.fallback;
  *(void *)(v11 + 32) = static InformationSuggestionSignals.deviceLocked;
  *(void *)(v11 + 40) = v13;
  uint64_t v14 = static InformationSuggestionSignals.homescreen;
  *(void *)(v11 + 48) = static InformationSuggestionSignals.homescreen;
  uint64_t v69 = v11;
  ((void (*)(void))specialized Array._endMutation())();
  *(void *)(inited + 56) = v69;
  *(_BYTE *)(inited + 64) = 2;
  uint64_t v15 = swift_allocObject(v2, 56LL, 7LL);
  *(_OWORD *)(v15 + 16) = xmmword_11AB0;
  *(void *)(v15 + 32) = v13;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = v10;
  uint64_t v70 = v15;
  ((void (*)(void))specialized Array._endMutation())();
  *(void *)(inited + 72) = v70;
  *(_BYTE *)(inited + 80) = 3;
  uint64_t v16 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v16 + 16) = xmmword_11AC0;
  *(void *)(v16 + 32) = v13;
  *(void *)(v16 + 40) = v14;
  uint64_t v71 = v16;
  swift_retain(v13);
  uint64_t v17 = swift_retain(v14);
  specialized Array._endMutation()(v17);
  *(void *)(inited + 88) = v71;
  *(_BYTE *)(inited + 96) = 4;
  uint64_t v18 = swift_allocObject(v2, 64LL, 7LL);
  *(_OWORD *)(v18 + 16) = xmmword_11AA0;
  *(void *)(v18 + 32) = v12;
  *(void *)(v18 + 40) = v13;
  *(void *)(v18 + 48) = v14;
  *(void *)(v18 + 56) = v10;
  uint64_t v72 = v18;
  swift_retain(v13);
  swift_retain(v14);
  uint64_t v19 = swift_retain(v10);
  specialized Array._endMutation()(v19);
  *(void *)(inited + 104) = v72;
  *(_BYTE *)(inited + 112) = 5;
  uint64_t v20 = swift_allocObject(v2, 56LL, 7LL);
  *(_OWORD *)(v20 + 16) = xmmword_11AB0;
  *(void *)(v20 + 32) = v12;
  *(void *)(v20 + 40) = v13;
  *(void *)(v20 + 48) = v14;
  uint64_t v73 = v20;
  swift_retain(v13);
  swift_retain(v14);
  uint64_t v21 = swift_retain(v12);
  specialized Array._endMutation()(v21);
  *(void *)(inited + 120) = v73;
  *(_BYTE *)(inited + 128) = 6;
  uint64_t v22 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v22 + 16) = xmmword_11AC0;
  *(void *)(v22 + 32) = v13;
  *(void *)(v22 + 40) = v14;
  uint64_t v74 = v22;
  swift_retain(v13);
  uint64_t v23 = swift_retain(v14);
  specialized Array._endMutation()(v23);
  *(void *)(inited + 136) = v74;
  *(_BYTE *)(inited + 144) = 7;
  uint64_t v24 = swift_allocObject(v2, 56LL, 7LL);
  *(_OWORD *)(v24 + 16) = xmmword_11AB0;
  uint64_t v25 = one-time initialization token for calendar;
  swift_retain_n(v13, 2LL);
  swift_retain_n(v14, 2LL);
  swift_retain_n(v10, 2LL);
  uint64_t v26 = swift_retain_n(v12, 2LL);
  if (v25 != -1) {
    uint64_t v26 = swift_once(&one-time initialization token for calendar, one-time initialization function for calendar);
  }
  uint64_t v27 = static InformationSuggestionSignals.calendar;
  uint64_t v28 = static InformationSuggestionSignals.fallback;
  *(void *)(v24 + 32) = static InformationSuggestionSignals.calendar;
  *(void *)(v24 + 40) = v28;
  uint64_t v29 = static InformationSuggestionSignals.homescreen;
  *(void *)(v24 + 48) = static InformationSuggestionSignals.homescreen;
  specialized Array._endMutation()(v26);
  *(void *)(inited + 152) = v24;
  *(_BYTE *)(inited + 160) = 8;
  uint64_t v30 = swift_allocObject(v2, 64LL, 7LL);
  *(_OWORD *)(v30 + 16) = xmmword_11AA0;
  uint64_t v31 = static InformationSuggestionSignals.deviceLocked;
  *(void *)(v30 + 32) = static InformationSuggestionSignals.deviceLocked;
  *(void *)(v30 + 40) = v28;
  uint64_t v32 = static InformationSuggestionSignals.safari;
  *(void *)(v30 + 48) = v29;
  *(void *)(v30 + 56) = v32;
  uint64_t v75 = v30;
  specialized Array._endMutation()(v30);
  *(void *)(inited + 168) = v75;
  *(_BYTE *)(inited + 176) = 9;
  uint64_t v33 = swift_allocObject(v2, 64LL, 7LL);
  *(_OWORD *)(v33 + 16) = xmmword_11AA0;
  *(void *)(v33 + 32) = v31;
  *(void *)(v33 + 40) = v28;
  *(void *)(v33 + 48) = v29;
  *(void *)(v33 + 56) = v32;
  uint64_t v76 = v33;
  swift_retain(v28);
  uint64_t v34 = swift_retain(v29);
  specialized Array._endMutation()(v34);
  *(void *)(inited + 184) = v76;
  *(_BYTE *)(inited + 192) = 10;
  uint64_t v35 = swift_allocObject(v2, 72LL, 7LL);
  *(_OWORD *)(v35 + 16) = xmmword_11AD0;
  *(void *)(v35 + 32) = v31;
  *(void *)(v35 + 40) = v28;
  *(void *)(v35 + 48) = v29;
  uint64_t v36 = one-time initialization token for maps;
  swift_retain_n(v28, 3LL);
  swift_retain_n(v29, 3LL);
  swift_retain_n(v31, 3LL);
  swift_retain_n(v32, 2LL);
  uint64_t v37 = swift_retain(v27);
  if (v36 != -1) {
    uint64_t v37 = swift_once(&one-time initialization token for maps, one-time initialization function for maps);
  }
  uint64_t v38 = static InformationSuggestionSignals.maps;
  uint64_t v39 = static InformationSuggestionSignals.safari;
  *(void *)(v35 + 56) = static InformationSuggestionSignals.maps;
  *(void *)(v35 + 64) = v39;
  specialized Array._endMutation()(v37);
  *(void *)(inited + 200) = v35;
  *(_BYTE *)(inited + 208) = 11;
  uint64_t v40 = swift_allocObject(v2, 64LL, 7LL);
  *(_OWORD *)(v40 + 16) = xmmword_11AA0;
  uint64_t v41 = static InformationSuggestionSignals.deviceLocked;
  uint64_t v42 = static InformationSuggestionSignals.fallback;
  *(void *)(v40 + 32) = static InformationSuggestionSignals.deviceLocked;
  *(void *)(v40 + 40) = v42;
  uint64_t v43 = static InformationSuggestionSignals.homescreen;
  *(void *)(v40 + 48) = static InformationSuggestionSignals.homescreen;
  *(void *)(v40 + 56) = v39;
  uint64_t v77 = v40;
  specialized Array._endMutation()(v40);
  *(void *)(inited + 216) = v77;
  *(_BYTE *)(inited + 224) = 12;
  uint64_t v44 = swift_allocObject(v2, 64LL, 7LL);
  *(_OWORD *)(v44 + 16) = xmmword_11AA0;
  *(void *)(v44 + 32) = v41;
  *(void *)(v44 + 40) = v42;
  *(void *)(v44 + 48) = v43;
  *(void *)(v44 + 56) = v38;
  uint64_t v78 = v44;
  specialized Array._endMutation()(v44);
  *(void *)(inited + 232) = v78;
  *(_BYTE *)(inited + 240) = 13;
  uint64_t v45 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v45 + 16) = xmmword_11AC0;
  *(void *)(v45 + 32) = v42;
  *(void *)(v45 + 40) = v43;
  uint64_t v79 = v45;
  swift_retain(v42);
  uint64_t v46 = swift_retain(v43);
  specialized Array._endMutation()(v46);
  *(void *)(inited + 248) = v79;
  *(_BYTE *)(inited + 256) = 14;
  uint64_t v47 = swift_allocObject(v2, 64LL, 7LL);
  *(_OWORD *)(v47 + 16) = xmmword_11AA0;
  *(void *)(v47 + 32) = v41;
  *(void *)(v47 + 40) = v42;
  *(void *)(v47 + 48) = v43;
  uint64_t v48 = one-time initialization token for news;
  swift_retain_n(v42, 3LL);
  swift_retain_n(v43, 3LL);
  swift_retain_n(v41, 3LL);
  swift_retain_n(v38, 2LL);
  uint64_t v49 = swift_retain_n(v39, 2LL);
  if (v48 != -1) {
    uint64_t v49 = swift_once(&one-time initialization token for news, one-time initialization function for news);
  }
  uint64_t v50 = static InformationSuggestionSignals.news;
  *(void *)(v47 + 56) = static InformationSuggestionSignals.news;
  specialized Array._endMutation()(v49);
  *(void *)(inited + 264) = v47;
  *(_BYTE *)(inited + 272) = 15;
  uint64_t v51 = swift_allocObject(v2, 56LL, 7LL);
  *(_OWORD *)(v51 + 16) = xmmword_11AB0;
  uint64_t v52 = static InformationSuggestionSignals.deviceLocked;
  uint64_t v53 = static InformationSuggestionSignals.homescreen;
  *(void *)(v51 + 32) = static InformationSuggestionSignals.deviceLocked;
  *(void *)(v51 + 40) = v53;
  uint64_t v54 = one-time initialization token for weather;
  swift_retain(v50);
  swift_retain(v52);
  uint64_t v55 = swift_retain(v53);
  if (v54 != -1) {
    uint64_t v55 = swift_once(&one-time initialization token for weather, one-time initialization function for weather);
  }
  uint64_t v56 = static InformationSuggestionSignals.weather;
  *(void *)(v51 + 48) = static InformationSuggestionSignals.weather;
  specialized Array._endMutation()(v55);
  *(void *)(inited + 280) = v51;
  *(_BYTE *)(inited + 288) = 16;
  uint64_t v57 = swift_allocObject(v2, 80LL, 7LL);
  *(_OWORD *)(v57 + 16) = xmmword_11AE0;
  uint64_t v58 = static InformationSuggestionSignals.deviceLocked;
  *(void *)(v57 + 32) = v56;
  *(void *)(v57 + 40) = v58;
  uint64_t v59 = static InformationSuggestionSignals.homescreen;
  uint64_t v60 = static InformationSuggestionSignals.fallback;
  *(void *)(v57 + 48) = static InformationSuggestionSignals.homescreen;
  *(void *)(v57 + 56) = v60;
  uint64_t v61 = static InformationSuggestionSignals.safari;
  uint64_t v62 = static InformationSuggestionSignals.calendar;
  *(void *)(v57 + 64) = static InformationSuggestionSignals.safari;
  *(void *)(v57 + 72) = v62;
  uint64_t v80 = v57;
  specialized Array._endMutation()(v57);
  *(void *)(inited + 296) = v80;
  *(_BYTE *)(inited + 304) = 17;
  uint64_t v63 = swift_allocObject(v2, 56LL, 7LL);
  *(_OWORD *)(v63 + 16) = xmmword_11AB0;
  *(void *)(v63 + 32) = v58;
  *(void *)(v63 + 40) = v59;
  *(void *)(v63 + 48) = v60;
  uint64_t v81 = v63;
  specialized Array._endMutation()(v63);
  *(void *)(inited + 312) = v81;
  *(_BYTE *)(inited + 320) = 18;
  uint64_t v64 = swift_allocObject(v2, 56LL, 7LL);
  *(_OWORD *)(v64 + 16) = xmmword_11AB0;
  *(void *)(v64 + 32) = v58;
  *(void *)(v64 + 40) = v59;
  *(void *)(v64 + 48) = v60;
  uint64_t v82 = v64;
  swift_retain(v58);
  swift_retain(v59);
  uint64_t v65 = swift_retain(v60);
  specialized Array._endMutation()(v65);
  *(void *)(inited + 328) = v82;
  *(_BYTE *)(inited + 336) = 19;
  uint64_t v66 = swift_allocObject(v2, 56LL, 7LL);
  *(_OWORD *)(v66 + 16) = xmmword_11AB0;
  *(void *)(v66 + 32) = v58;
  *(void *)(v66 + 40) = v59;
  *(void *)(v66 + 48) = v60;
  uint64_t v83 = v66;
  swift_retain(v58);
  swift_retain(v59);
  uint64_t v67 = swift_retain(v60);
  specialized Array._endMutation()(v67);
  *(void *)(inited + 344) = v83;
  swift_retain_n(v58, 2LL);
  swift_retain_n(v59, 2LL);
  swift_retain_n(v60, 2LL);
  swift_retain_n(v56, 2LL);
  swift_retain(v61);
  swift_retain(v62);
  uint64_t result = (int *)specialized Dictionary.init(dictionaryLiteral:)(inited);
  static InformationSuggestionSignals.signals = result;
  return result;
}

uint64_t specialized static InformationSuggestionsPluginOwnerDefinitionFactory.enabledLocales(for:)( unsigned __int8 a1)
{
  uint64_t v1 = InformationSuggestion.rawValue.getter(a1);
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  unint64_t v5 = 0x8000000000012150LL;
  if (v1 == 0xD000000000000011LL && v2 == 0x8000000000012150LL) {
    goto LABEL_3;
  }
  char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(v1, v2, 0xD000000000000011LL, 0x8000000000012150LL, 0LL);
  swift_bridgeObjectRelease(v4);
  if ((v6 & 1) != 0) {
    goto LABEL_8;
  }
  unint64_t v5 = 0x8000000000012170LL;
  if (v3 == 0xD000000000000017LL && v4 == 0x8000000000012170LL)
  {
LABEL_3:
    swift_bridgeObjectRelease(v5);
LABEL_8:
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
    uint64_t v9 = type metadata accessor for Locale(0LL);
    uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL))
          + *(void *)(*(void *)(v9 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v10 + 16) = xmmword_11530;
    uint64_t v11 = 0x4E432D687ALL;
LABEL_9:
    Locale.init(identifier:)(v11, 0xE500000000000000LL);
    return v10;
  }

  char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, 0xD000000000000017LL, 0x8000000000012170LL, 0LL);
  swift_bridgeObjectRelease(v4);
  if ((v7 & 1) != 0) {
    goto LABEL_8;
  }
  if (v3 == 0xD000000000000015LL && v4 == 0x8000000000012190LL)
  {
    swift_bridgeObjectRelease(0x8000000000012190LL);
LABEL_15:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
    uint64_t v15 = *(void *)(type metadata accessor for Locale(0LL) - 8);
    uint64_t v10 = swift_allocObject( v14,  ((*(unsigned __int8 *)(v15 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))
          + 2LL * *(void *)(v15 + 72),
            *(unsigned __int8 *)(v15 + 80) | 7LL);
    *(_OWORD *)(v10 + 16) = xmmword_11B00;
    Locale.init(identifier:)(0x4E432D687ALL, 0xE500000000000000LL);
    uint64_t v11 = 0x504A2D616ALL;
    goto LABEL_9;
  }

  char v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, 0xD000000000000015LL, 0x8000000000012190LL, 0LL);
  swift_bridgeObjectRelease(v4);
  if ((v13 & 1) != 0) {
    goto LABEL_15;
  }
  if (v3 == 0xD000000000000019LL && v4 == 0x8000000000012060LL)
  {
    swift_bridgeObjectRelease(0x8000000000012060LL);
LABEL_20:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
    uint64_t v18 = *(void *)(type metadata accessor for Locale(0LL) - 8);
    uint64_t v10 = swift_allocObject( v17,  ((*(unsigned __int8 *)(v18 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))
          + 29LL * *(void *)(v18 + 72),
            *(unsigned __int8 *)(v18 + 80) | 7LL);
    *(_OWORD *)(v10 + 16) = xmmword_11AF0;
    Locale.init(identifier:)(0x53552D6E65LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x4E432D687ALL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x42472D6E65LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x55412D6E65LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x41432D6E65LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x4E492D6E65LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x45442D6564LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x504A2D616ALL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x52462D7266LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x584D2D7365LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x53452D7365LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x53552D7365LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x57542D687ALL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x4E432D657579LL, 0xE600000000000000LL);
    Locale.init(identifier:)(0x524B2D6F6BLL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x55522D7572LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x54492D7469LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x52542D7274LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x47532D6E65LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x41432D7266LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x54412D6564LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x45492D6E65LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x5A4E2D6E65LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x45422D7266LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x48432D6564LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x48432D7266LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x52422D7470LL, 0xE500000000000000LL);
    Locale.init(identifier:)(0x415A2D6E65LL, 0xE500000000000000LL);
    uint64_t v11 = 0x4C432D7365LL;
    goto LABEL_9;
  }

  char v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, 0xD000000000000019LL, 0x8000000000012060LL, 0LL);
  swift_bridgeObjectRelease(v4);
  if ((v16 & 1) != 0) {
    goto LABEL_20;
  }
  if (one-time initialization token for t41Locales != -1) {
    swift_once(&one-time initialization token for t41Locales, one-time initialization function for t41Locales);
  }
  uint64_t v10 = static SuggestionConstants.t41Locales;
  swift_bridgeObjectRetain(static SuggestionConstants.t41Locales);
  return v10;
}

uint64_t partial apply for closure #1 in closure #1 in static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1)
{
  return closure #1 in closure #1 in static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)( a1,  *(unsigned __int8 *)(v1 + 16),  *(void *)(v1 + 24));
}

unint64_t specialized AppBundleIdentifier.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)( (Swift::OpaquePointer)&outlined read-only object #0 of AppBundleIdentifier.init(rawValue:),  v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 7) {
    return 7LL;
  }
  else {
    return v3;
  }
}

uint64_t specialized InformationSuggestion.init(rawValue:)(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = _findStringSwitchCaseWithCache(cases:string:cache:)( &outlined read-only object #0 of InformationSuggestion.init(rawValue:),  a1,  a2,  &outlined variable #1 of InformationSuggestion.init(rawValue:));
  swift_bridgeObjectRelease(a2);
  if (v3 >= 0x14) {
    return 20LL;
  }
  else {
    return v3;
  }
}

unint64_t lazy protocol witness table accessor for type AppBundleIdentifier and conformance AppBundleIdentifier()
{
  unint64_t result = lazy protocol witness table cache variable for type AppBundleIdentifier and conformance AppBundleIdentifier;
  if (!lazy protocol witness table cache variable for type AppBundleIdentifier and conformance AppBundleIdentifier)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AppBundleIdentifier,  &type metadata for AppBundleIdentifier);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type AppBundleIdentifier and conformance AppBundleIdentifier);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type [InformationSuggestion] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [InformationSuggestion] and conformance [A];
  if (!lazy protocol witness table cache variable for type [InformationSuggestion] and conformance [A])
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [InformationSuggestion]);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type [InformationSuggestion] and conformance [A]);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type InformationSuggestion and conformance InformationSuggestion()
{
  unint64_t result = lazy protocol witness table cache variable for type InformationSuggestion and conformance InformationSuggestion;
  if (!lazy protocol witness table cache variable for type InformationSuggestion and conformance InformationSuggestion)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for InformationSuggestion,  &type metadata for InformationSuggestion);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type InformationSuggestion and conformance InformationSuggestion);
  }

  return result;
}

uint64_t type metadata accessor for InformationSuggestionsPluginOwnerDefinitionFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC32SiriInformationSuggestionsPlugin50InformationSuggestionsPluginOwnerDefinitionFactory);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppBundleIdentifier(unsigned __int8 *a1, unsigned int a2)
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
  BOOL v7 = v6 >= 0x14;
  int v8 = v6 - 20;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AppBundleIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10A70 + 4 * byte_11B41[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_10AA4 + 4 * byte_11B3C[v4]))();
}

uint64_t sub_10AA4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10AAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10AB4LL);
  }
  return result;
}

uint64_t sub_10AC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10AC8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 6;
  return result;
}

uint64_t sub_10ACC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10AD4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppBundleIdentifier()
{
  return &type metadata for AppBundleIdentifier;
}

uint64_t getEnumTagSinglePayload for InformationSuggestion(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xED) {
    goto LABEL_17;
  }
  if (a2 + 19 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 19) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 19;
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
      return (*a1 | (v4 << 8)) - 19;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 19;
    }
  }

uint64_t storeEnumTagSinglePayload for InformationSuggestion(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 19 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 19) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xED) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xEC) {
    return ((uint64_t (*)(void))((char *)&loc_10BCC + 4 * byte_11B4B[v4]))();
  }
  *a1 = a2 + 19;
  return ((uint64_t (*)(void))((char *)sub_10C00 + 4 * byte_11B46[v4]))();
}

uint64_t sub_10C00(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10C08(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10C10LL);
  }
  return result;
}

uint64_t sub_10C1C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10C24LL);
  }
  *(_BYTE *)unint64_t result = a2 + 19;
  return result;
}

uint64_t sub_10C28(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10C30(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for InformationSuggestion(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for InformationSuggestion(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for InformationSuggestion()
{
  return &type metadata for InformationSuggestion;
}

uint64_t outlined destroy of Resolver?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Resolver?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t _s18SiriSuggestionsKit11DomainOwnerCAcA0E0AAWlTm_0( unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t outlined init with copy of (String, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}
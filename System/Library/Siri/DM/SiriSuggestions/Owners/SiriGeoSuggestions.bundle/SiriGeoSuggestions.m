uint64_t StandardSuggestionSignals.isNotSharingETA.getter()
{
  uint64_t v0;
  os_log_s *v1;
  os_log_type_t v2;
  uint8_t *v3;
  if (one-time initialization token for SuggestionsLog != -1) {
    swift_once(&one-time initialization token for SuggestionsLog, one-time initialization function for SuggestionsLog);
  }
  v0 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v0, (uint64_t)SuggestionsLog);
  v1 = (os_log_s *)Logger.logObject.getter();
  v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "Accessing shared ETA status outside of supported platform", v3, 2u);
    swift_slowDealloc(v3, -1LL, -1LL);
  }

  return 0LL;
}

uint64_t StandardSuggestionSignals.willNotPlayTrafficIncidentHint.getter()
{
  return GEOConfigGetBOOL( NavigationConfig_UGCRequestDiscoverabilityPrompt,  *((void *)&NavigationConfig_UGCRequestDiscoverabilityPrompt + 1)) ^ 1;
}

uint64_t protocol witness for SuggestionsSignals.isNotSharingETA.getter in conformance StandardSuggestionSignals()
{
  if (one-time initialization token for SuggestionsLog != -1) {
    swift_once(&one-time initialization token for SuggestionsLog, one-time initialization function for SuggestionsLog);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v1, (uint64_t)SuggestionsLog);
  v2 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "Accessing shared ETA status outside of supported platform", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  return protocol witness for SuggestionsSignals.isNotSharingETA.getter in conformance StandardSuggestionSignals( *(uint64_t (**)(uint64_t))(v0 + 8),  v0,  0LL);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance BMAppLaunchType( void *a1, void *a2)
{
  return *a1 == *a2;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance BMAppLaunchType(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  v2 = *a2;
  _BYTE *v2 = result;
  *a2 = v2 + 1;
  return result;
}

void *specialized Sequence.compactMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = v3;
  uint64_t v33 = a3;
  uint64_t v34 = a2;
  uint64_t v6 = type metadata accessor for CharacterSet(0LL);
  uint64_t v31 = *(void *)(v6 - 8);
  uint64_t v32 = v6;
  __chkstk_darwin();
  v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v39 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v9 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  while (v9)
  {
    v30[1] = v4;
    unint64_t v36 = a1 & 0xC000000000000001LL;
    id v35 = (id)objc_opt_self(&OBJC_CLASS___CNContactFormatter);
    for (uint64_t i = 4LL; ; ++i)
    {
      id v11 = v36 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, a1) : *(id *)(a1 + 8 * i);
      v4 = v11;
      uint64_t v12 = i - 3;
      if (__OFADD__(i - 4, 1LL)) {
        break;
      }
      id v13 = [v35 stringFromContact:v11 style:0];
      if (v13)
      {
        v14 = v13;
        uint64_t v15 = a1;
        uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v18 = v17;

        uint64_t v37 = v16;
        uint64_t v38 = v18;
        static CharacterSet.whitespaces.getter();
        unint64_t v19 = lazy protocol witness table accessor for type String and conformance String();
        uint64_t v20 = StringProtocol.trimmingCharacters(in:)(v8, &type metadata for String, v19);
        uint64_t v22 = v21;
        (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v32);
        swift_bridgeObjectRelease(v38);
        if (v20 == v34 && v22 == v33)
        {
          uint64_t v23 = swift_bridgeObjectRelease(v33);
          goto LABEL_15;
        }

        char v24 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v22, v34, v33, 0LL);
        uint64_t v23 = swift_bridgeObjectRelease(v22);
        if ((v24 & 1) != 0)
        {
LABEL_15:
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v23);
          unint64_t v26 = *(void *)((char *)&dword_10 + (v39 & 0xFFFFFFFFFFFFFF8LL));
          unint64_t v25 = *(void *)((char *)&dword_18 + (v39 & 0xFFFFFFFFFFFFFF8LL));
          if (v26 >= v25 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1LL);
          }
          uint64_t v27 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v26, v4);
          specialized Array._endMutation()(v27);
        }

        else
        {
        }

        a1 = v15;
        goto LABEL_5;
      }

LABEL_5:
      if (v12 == v9)
      {
        swift_bridgeObjectRelease(a1);
        return (void *)v39;
      }
    }

    __break(1u);
LABEL_22:
    if (a1 < 0) {
      uint64_t v29 = a1;
    }
    else {
      uint64_t v29 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v29);
  }

  swift_bridgeObjectRelease(a1);
  return &_swiftEmptyArrayStorage;
}

uint64_t specialized StandardSuggestionSignals.getContactName(fullName:)(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CharacterSet(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v70 = a1;
  uint64_t v71 = a2;
  swift_bridgeObjectRetain(a2);
  id v70 = (id)String.init<A>(_:)( &v70,  &type metadata for String,  &protocol witness table for String,  &protocol witness table for String);
  uint64_t v71 = v8;
  static CharacterSet.whitespaces.getter();
  unint64_t v9 = lazy protocol witness table accessor for type String and conformance String();
  uint64_t v10 = StringProtocol.trimmingCharacters(in:)(v7, &type metadata for String, v9);
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease(v71);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v14 = swift_allocObject(v13, 40LL, 7LL);
  __int128 v66 = xmmword_DE60;
  *(_OWORD *)(v14 + 16) = xmmword_DE60;
  uint64_t v15 = (void *)objc_opt_self(&OBJC_CLASS___CNContactFormatter);
  id v16 = [v15 descriptorForRequiredKeysForStyle:0];
  *(void *)(v14 + 32) = v16;
  id v70 = (id)v14;
  specialized Array._endMutation()(v16);
  id v17 = v70;
  id v18 = objc_allocWithZone(&OBJC_CLASS___CNContactFetchRequest);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNKeyDescriptor);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v17);
  id v65 = [v18 initWithKeysToFetch:isa];

  id v20 = (id)objc_opt_self(&OBJC_CLASS___CNContact);
  NSString v21 = String._bridgeToObjectiveC()();
  id v22 = [v20 predicateForContactsMatchingName:v21];

  id v23 = [objc_allocWithZone(CNContactStore) init];
  uint64_t v24 = swift_allocObject(v13, 40LL, 7LL);
  *(_OWORD *)(v24 + 16) = v66;
  id v25 = [v15 descriptorForRequiredKeysForStyle:0];
  *(void *)(v24 + 32) = v25;
  id v70 = (id)v24;
  specialized Array._endMutation()(v25);
  id v26 = v70;
  Class v27 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v26);
  id v70 = 0LL;
  *(void *)&__int128 v66 = v22;
  id v28 = [v23 unifiedContactsMatchingPredicate:v22 keysToFetch:v27 error:&v70];

  uint64_t v29 = (SEL *)v70;
  if (!v28)
  {
    id v47 = v70;
    swift_bridgeObjectRelease(v12);
    uint64_t v48 = _convertNSErrorToError(_:)(v29);

    swift_willThrow();
LABEL_17:
    if (one-time initialization token for SuggestionsLog != -1) {
      swift_once(&one-time initialization token for SuggestionsLog, one-time initialization function for SuggestionsLog);
    }
    uint64_t v50 = type metadata accessor for Logger(0LL);
    __swift_project_value_buffer(v50, (uint64_t)SuggestionsLog);
    swift_errorRetain(v48);
    uint64_t v51 = swift_errorRetain(v48);
    v52 = (os_log_s *)Logger.logObject.getter(v51);
    os_log_type_t v53 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      v55 = (void *)swift_slowAlloc(32LL, -1LL);
      id v70 = v55;
      *(_DWORD *)v54 = 136315138;
      swift_getErrorValue(v48, v69, v68);
      uint64_t v56 = Error.localizedDescription.getter(v68[1], v68[2]);
      unint64_t v58 = v57;
      uint64_t v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v56, v57, (uint64_t *)&v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, v68, v54 + 4, v54 + 12);
      swift_bridgeObjectRelease(v58);
      swift_errorRelease(v48);
      swift_errorRelease(v48);
      _os_log_impl(&dword_0, v52, v53, "error retrieving contact: %s", v54, 0xCu);
      swift_arrayDestroy(v55, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v55, -1LL, -1LL);
      swift_slowDealloc(v54, -1LL, -1LL);

      swift_errorRelease(v48);
    }

    else
    {

      swift_errorRelease(v48);
      swift_errorRelease(v48);
      swift_errorRelease(v48);
    }

    return 0LL;
  }

  unint64_t v30 = type metadata accessor for CNContact();
  uint64_t v31 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v28, v30);
  uint64_t v32 = v29;

  swift_bridgeObjectRetain(v12);
  uint64_t v33 = (uint64_t)specialized Sequence.compactMap<A>(_:)(v31, v10, v12);
  swift_bridgeObjectRelease(v31);
  swift_bridgeObjectRelease_n(v12, 2LL);
  if (!((unint64_t)v33 >> 62))
  {
LABEL_30:
    swift_bridgeObjectRelease(v33);

    return 0LL;
  }

  if (v33 < 0) {
    id v28 = (id)v33;
  }
  else {
    id v28 = (id)(v33 & 0xFFFFFFFFFFFFFF8LL);
  }
  swift_bridgeObjectRetain(v33);
  uint64_t v60 = _CocoaArrayWrapper.endIndex.getter(v28);
  swift_bridgeObjectRelease(v33);
  if (v60 != 1) {
    goto LABEL_30;
  }
  swift_bridgeObjectRetain(v33);
  uint64_t v61 = _CocoaArrayWrapper.endIndex.getter(v28);
  swift_bridgeObjectRelease(v33);
  if (!v61)
  {

    swift_bridgeObjectRelease(v33);
    return 0LL;
  }

LABEL_4:
  if ((v33 & 0xC000000000000001LL) != 0)
  {
    id v34 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v33);
  }

  else
  {
    if (!*(void *)((char *)&dword_10 + (v33 & 0xFFFFFFFFFFFFF8LL)))
    {
      __break(1u);
      goto LABEL_35;
    }

    id v34 = *(id *)(v33 + 32);
  }

  id v28 = v34;
  swift_bridgeObjectRelease(v33);
  uint64_t v29 = (SEL *)&CNKeyDescriptor__prots;
  NSString v35 = [v28 givenName];
  if (!v35)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v37 = v36;
    NSString v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v37);
  }

  id v20 = [v20 predicateForContactsMatchingName:v35];

  id v38 = [objc_allocWithZone(CNContactStore) init];
  Class v39 = Array._bridgeToObjectiveC()().super.isa;
  id v70 = 0LL;
  id v40 = [v38 unifiedContactsMatchingPredicate:v20 keysToFetch:v39 error:&v70];

  id v41 = v70;
  if (!v40)
  {
    id v49 = v70;
    uint64_t v48 = _convertNSErrorToError(_:)(v41);

    swift_willThrow();
    goto LABEL_17;
  }

  uint64_t v33 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v40, v30);
  id v42 = v41;

  if (!((unint64_t)v33 >> 62))
  {
    uint64_t v43 = *(void *)((char *)&dword_10 + (v33 & 0xFFFFFFFFFFFFF8LL));
    goto LABEL_12;
  }

LABEL_35:
  if (v33 < 0) {
    uint64_t v63 = v33;
  }
  else {
    uint64_t v63 = v33 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v33);
  uint64_t v43 = _CocoaArrayWrapper.endIndex.getter(v63);
  swift_bridgeObjectRelease(v33);
LABEL_12:
  swift_bridgeObjectRelease(v33);
  if (v43 < 2)
  {
    id v59 = [v28 v29[288]];
    uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();

    return v46;
  }

  id v44 = [v15 stringFromContact:v28 style:0];
  if (!v44)
  {

    return 0LL;
  }

  v45 = v44;
  uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v46;
}

uint64_t protocol witness for SuggestionsSignals.isNotSharingETA.getter in conformance StandardSuggestionSignals( uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
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

unint64_t type metadata accessor for CNContact()
{
  unint64_t result = lazy cache variable for type metadata for CNContact;
  if (!lazy cache variable for type metadata for CNContact)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___CNContact);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CNContact);
  }

  return result;
}

uint64_t SiriGeoSuggestionsGenerator.__allocating_init(signals:)(__int128 *a1)
{
  uint64_t v3 = swift_allocObject(v1, 56LL, 7LL);
  outlined init with take of SuggestionsSignals(a1, v3 + 16);
  return v3;
}

uint64_t SiriGeoSuggestionsGenerator.init(signals:)(__int128 *a1)
{
  return v1;
}

uint64_t outlined init with take of SuggestionsSignals(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t SiriGeoSuggestionsGenerator.suggestionSignals.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of SuggestionsSignals(v1 + 16, a1);
}

uint64_t outlined init with copy of SuggestionsSignals(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[30] = a3;
  v4[31] = v3;
  v4[28] = a1;
  v4[29] = a2;
  uint64_t v5 = type metadata accessor for Objective(0LL);
  v4[32] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[33] = v6;
  v4[34] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for SiriGeoSuggestion(0LL);
  v4[35] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v4[36] = v8;
  v4[37] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch( SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:),  0LL,  0LL);
}

uint64_t SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:)()
{
  if (one-time initialization token for SuggestionsLog != -1) {
    swift_once(&one-time initialization token for SuggestionsLog, one-time initialization function for SuggestionsLog);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = __swift_project_value_buffer(v1, (uint64_t)SuggestionsLog);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "Running SiriGeoSuggestionsGenerator", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v6 = *(void **)(v0 + 224);

  uint64_t v7 = v6[3];
  uint64_t v8 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v7);
  *(void *)(v0 + 304) = dispatch thunk of Interaction.verb.getter(v7, v8);
  *(void *)(v0 + 312) = v9;
  if (v9)
  {
    uint64_t v10 = *(void *)(v0 + 288);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SiriGeoSuggestion>);
    uint64_t v12 = *(void *)(v10 + 72);
    *(void *)(v0 + 320) = v12;
    LODWORD(v13) = *(_DWORD *)(v10 + 80);
    *(_DWORD *)(v0 + 360) = v13;
    uint64_t v13 = v13;
    uint64_t v14 = (v13 + 32) & ~v13;
    uint64_t v15 = swift_allocObject(v11, v14 + 3 * v12, v13 | 7LL);
    *(void *)(v0 + 328) = v15;
    *(_OWORD *)(v15 + 16) = xmmword_DE90;
    id v16 = (void *)(v15 + v14);
    static SiriGeoSuggestion.ShareETA.getter(v16);
    static SiriGeoSuggestion.PlayMusic.getter((void *)((char *)v16 + v12));
    static SiriGeoSuggestion.PlayNews.getter((void *)((char *)v16 + 2 * v12));
    *(_DWORD *)(v0 + 364) = enum case for Objective.discoverability(_:);
    *(void *)(v0 + 336) = 0LL;
    *(void *)(v0 + 344) = &_swiftEmptyArrayStorage;
    uint64_t v17 = *(void *)(v0 + 312);
    uint64_t v18 = *(void *)(v0 + 296);
    uint64_t v19 = *(void *)(v0 + 248);
    id v20 = *(void **)(v0 + 224);
    outlined init with copy of SiriGeoSuggestion( *(void *)(v0 + 328)
    + ((*(unsigned __int8 *)(v0 + 360) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v0 + 360)),
      v18);
    uint64_t v21 = v20[3];
    uint64_t v22 = v20[4];
    __swift_project_boxed_opaque_existential_1(v20, v21);
    *(void *)(v0 + 216) = dispatch thunk of Interaction.executionParameters.getter(v21, v22);
    id v23 = *(int **)(v18 + 56);
    Class v27 = (int *)((char *)v23 + *v23);
    uint64_t v24 = (void *)swift_task_alloc(v23[1]);
    *(void *)(v0 + 352) = v24;
    *uint64_t v24 = v0;
    v24[1] = SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:);
    return ((uint64_t (*)(void, uint64_t, void, uint64_t, uint64_t))v27)( *(void *)(v0 + 304),  v17,  *(void *)(v0 + 232),  v0 + 216,  v19 + 16);
  }

  else
  {
    uint64_t v26 = *(void *)(v0 + 272);
    swift_task_dealloc(*(void *)(v0 + 296));
    swift_task_dealloc(v26);
    return (*(uint64_t (**)(void *))(v0 + 8))(&_swiftEmptyArrayStorage);
  }

{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, unint64_t);
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  char *v43;
  int *v44;
  if ((*(_BYTE *)(v0 + 368) & 1) != 0)
  {
    id v42 = *(void *)(v0 + 344);
    id v41 = *(_DWORD *)(v0 + 364);
    uint64_t v1 = *(void *)(v0 + 304);
    uint64_t v2 = *(uint64_t **)(v0 + 296);
    uint64_t v3 = *(void *)(v0 + 272);
    id v38 = *(void *)(v0 + 312);
    Class v39 = *(void *)(v0 + 264);
    id v40 = *(void *)(v0 + 256);
    uint64_t v5 = *(void *)(v0 + 232);
    os_log_type_t v4 = *(void **)(v0 + 240);
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t))((char *)v2
                                                                               + *(int *)(*(void *)(v0 + 280) + 52LL));
    uint64_t v7 = *(void *)(v0 + 216);
    uint64_t v8 = specialized _dictionaryUpCast<A, B, C, D>(_:)(v7);
    swift_bridgeObjectRelease(v7);
    uint64_t v9 = v6(v1, v38, v5, v8);
    swift_bridgeObjectRelease(v8);
    uint64_t v10 = v4[3];
    uint64_t v11 = v4[4];
    __swift_project_boxed_opaque_existential_1(v4, v10);
    uint64_t v12 = *v2;
    uint64_t v13 = v2[1];
    (*(void (**)(uint64_t, void, uint64_t))(v39 + 104))(v3, v41, v40);
    CandidateSuggestionFactory.create(suggestionId:params:objective:)(v12, v13, v9, v3, v10, v11);
    swift_bridgeObjectRelease(v9);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v3, v40);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v42);
    uint64_t v15 = *(char **)(v0 + 344);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *((void *)v15 + 2) + 1LL,  1,  *(char **)(v0 + 344));
    }
    uint64_t v17 = *((void *)v15 + 2);
    id v16 = *((void *)v15 + 3);
    if (v17 >= v16 >> 1) {
      uint64_t v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (char *)(v16 > 1),  v17 + 1,  1,  v15);
    }
    uint64_t v18 = *(void *)(v0 + 296);
    *((void *)v15 + 2) = v17 + 1;
    outlined init with take of CandidateSuggestion?(v0 + 176, (uint64_t)&v15[40 * v17 + 32]);
    outlined destroy of SiriGeoSuggestion(v18);
  }

  else
  {
    uint64_t v19 = *(void *)(v0 + 296);
    swift_bridgeObjectRelease(*(void *)(v0 + 216));
    outlined destroy of SiriGeoSuggestion(v19);
    uint64_t v15 = *(char **)(v0 + 344);
  }

  id v20 = *(void *)(v0 + 336) + 1LL;
  if (*(void *)(v0 + 336) == 2LL)
  {
    uint64_t v21 = *(void *)(v0 + 312);
    swift_bridgeObjectRelease(*(void *)(v0 + 328));
    swift_bridgeObjectRelease(v21);
    uint64_t v22 = *((void *)v15 + 2);
    if (v22)
    {
      id v23 = v15;
      uint64_t v24 = (uint64_t)(v15 + 32);
      uint64_t v43 = v23;
      swift_bridgeObjectRetain(v23);
      id v25 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        outlined init with copy of CandidateSuggestion?(v24, v0 + 16);
        outlined init with take of CandidateSuggestion?(v0 + 16, v0 + 96);
        if (*(void *)(v0 + 120))
        {
          outlined init with take of SuggestionsSignals((__int128 *)(v0 + 96), v0 + 56);
          outlined init with take of SuggestionsSignals((__int128 *)(v0 + 56), v0 + 136);
          if ((swift_isUniquelyReferenced_nonNull_native(v25) & 1) == 0) {
            id v25 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *((void *)v25 + 2) + 1LL,  1,  v25);
          }
          Class v27 = *((void *)v25 + 2);
          uint64_t v26 = *((void *)v25 + 3);
          if (v27 >= v26 >> 1) {
            id v25 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (char *)(v26 > 1),  v27 + 1,  1,  v25);
          }
          *((void *)v25 + 2) = v27 + 1;
          outlined init with take of SuggestionsSignals((__int128 *)(v0 + 136), (uint64_t)&v25[40 * v27 + 32]);
        }

        else
        {
          outlined destroy of CandidateSuggestion?(v0 + 96);
        }

        v24 += 40LL;
        --v22;
      }

      while (v22);
      swift_bridgeObjectRelease_n(v43, 2LL);
    }

    else
    {
      swift_bridgeObjectRelease(v15);
      id v25 = (char *)&_swiftEmptyArrayStorage;
    }

    uint64_t v37 = *(void *)(v0 + 272);
    swift_task_dealloc(*(void *)(v0 + 296));
    swift_task_dealloc(v37);
    return (*(uint64_t (**)(char *))(v0 + 8))(v25);
  }

  else
  {
    *(void *)(v0 + 336) = v20;
    *(void *)(v0 + 344) = v15;
    id v28 = *(void *)(v0 + 312);
    uint64_t v29 = *(void *)(v0 + 296);
    unint64_t v30 = *(void *)(v0 + 248);
    uint64_t v31 = *(void **)(v0 + 224);
    outlined init with copy of SiriGeoSuggestion( *(void *)(v0 + 328)
    + ((*(unsigned __int8 *)(v0 + 360) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v0 + 360))
    + *(void *)(v0 + 320) * v20,
      v29);
    uint64_t v32 = v31[3];
    uint64_t v33 = v31[4];
    __swift_project_boxed_opaque_existential_1(v31, v32);
    *(void *)(v0 + 216) = dispatch thunk of Interaction.executionParameters.getter(v32, v33);
    id v34 = *(int **)(v29 + 56);
    id v44 = (int *)((char *)v34 + *v34);
    NSString v35 = (void *)swift_task_alloc(v34[1]);
    *(void *)(v0 + 352) = v35;
    *NSString v35 = v0;
    v35[1] = SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:);
    return ((uint64_t (*)(void, uint64_t, void, uint64_t, uint64_t))v44)( *(void *)(v0 + 304),  v28,  *(void *)(v0 + 232),  v0 + 216,  v30 + 16);
  }
}

uint64_t SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:)(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 352LL);
  *(_BYTE *)(*(void *)v1 + 368LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch( SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:),  0LL,  0LL);
}

unint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v37 = v1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 64);
  int64_t v36 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = v49;
  uint64_t v8 = v47;
  uint64_t v9 = &v43;
  uint64_t v10 = &v45;
  unint64_t result = swift_bridgeObjectRetain(v1);
  int64_t v38 = 0LL;
  if (v6) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = v38 + 1;
  if (__OFADD__(v38, 1LL)) {
    goto LABEL_35;
  }
  if (v20 >= v36) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v37 + 8 * v20);
  int64_t v22 = v38 + 1;
  if (!v21)
  {
    int64_t v22 = v38 + 2;
    if (v38 + 2 >= v36) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v37 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = v38 + 3;
      if (v38 + 3 >= v36) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v37 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = v38 + 4;
        if (v38 + 4 >= v36) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v37 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = v38 + 5;
          if (v38 + 5 < v36)
          {
            unint64_t v21 = *(void *)(v37 + 8 * v23);
            if (v21)
            {
              int64_t v22 = v38 + 5;
              goto LABEL_26;
            }

            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1LL)) {
                goto LABEL_36;
              }
              if (v22 >= v36) {
                break;
              }
              unint64_t v21 = *(void *)(v37 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }

LABEL_32:
          outlined consume of [String : Decodable & Encodable & Sendable].Iterator._Variant(v1);
          return (unint64_t)v3;
        }
      }
    }
  }

LABEL_26:
  int64_t v38 = v22;
  uint64_t v39 = (v21 - 1) & v21;
  for (unint64_t i = __clz(__rbit64(v21)) + (v22 << 6); ; unint64_t i = __clz(__rbit64(v6)) | (v38 << 6))
  {
    uint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
    uint64_t v26 = *v24;
    uint64_t v25 = v24[1];
    outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v1 + 56) + 48 * i, (uint64_t)v7);
    *(void *)&__int128 v48 = v26;
    *((void *)&v48 + 1) = v25;
    v46[2] = v48;
    v47[0] = v49[0];
    v47[1] = v49[1];
    v47[2] = v49[2];
    uint64_t v41 = v26;
    uint64_t v42 = v25;
    outlined init with take of Decodable & Encodable & Sendable(v8, v40);
    swift_bridgeObjectRetain(v25);
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
    swift_dynamicCast(v9, v40, v27, (char *)&type metadata for Any + 8, 7LL);
    uint64_t v29 = v41;
    uint64_t v28 = v42;
    outlined init with take of Any(v9, v10);
    outlined init with take of Any(v10, v46);
    outlined init with take of Any(v46, &v44);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v29, v28);
    unint64_t v30 = result;
    if ((v31 & 1) != 0)
    {
      uint64_t v12 = v10;
      uint64_t v13 = v9;
      uint64_t v14 = v1;
      uint64_t v15 = v8;
      id v16 = v7;
      uint64_t v17 = (uint64_t *)(v3[6] + 16 * result);
      swift_bridgeObjectRelease(v17[1]);
      *uint64_t v17 = v29;
      v17[1] = v28;
      uint64_t v7 = v16;
      uint64_t v8 = v15;
      uint64_t v1 = v14;
      uint64_t v9 = v13;
      uint64_t v10 = v12;
      uint64_t v18 = (void *)(v3[7] + 32 * v30);
      __swift_destroy_boxed_opaque_existential_1Tm(v18);
      unint64_t result = (unint64_t)outlined init with take of Any(&v44, v18);
      unint64_t v6 = v39;
      if (!v39) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }

    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v32 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v32 = v29;
    v32[1] = v28;
    unint64_t result = (unint64_t)outlined init with take of Any(&v44, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v33 = v3[2];
    BOOL v34 = __OFADD__(v33, 1LL);
    uint64_t v35 = v33 + 1;
    if (v34) {
      goto LABEL_34;
    }
    v3[2] = v35;
    unint64_t v6 = v39;
    if (!v39) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v39 = (v6 - 1) & v6;
  }

  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t SiriGeoSuggestionsGenerator.deinit()
{
  return v0;
}

uint64_t SiriGeoSuggestionsGenerator.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 56LL, 7LL);
}

uint64_t protocol witness for InternalGenerator.generateCandidateSuggestions(interaction:environment:factory:) in conformance SiriGeoSuggestionsGenerator( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(dword_14C04);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for InternalGenerator.generateCandidateSuggestions(interaction:environment:factory:) in conformance SiriGeoSuggestionsGenerator;
  return SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:)(a1, a2, a3);
}

uint64_t protocol witness for InternalGenerator.generateCandidateSuggestions(interaction:environment:factory:) in conformance SiriGeoSuggestionsGenerator( uint64_t a1)
{
  uint64_t v6 = *v1;
  uint64_t v3 = *(void *)(v6 + 16);
  uint64_t v4 = *v1;
  uint64_t v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t outlined init with copy of SiriGeoSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriGeoSuggestion(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of SiriGeoSuggestion(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriGeoSuggestion(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of CandidateSuggestion?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CandidateSuggestion?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of CandidateSuggestion?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CandidateSuggestion?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of CandidateSuggestion?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CandidateSuggestion?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( char *result, int64_t a2, char a3, char *a4)
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
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>);
      uint64_t v11 = (char *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
      size_t v12 = _swift_stdlib_malloc_size(v11);
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
      uint64_t v13 = v11 + 32;
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
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
    }

    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
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
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion?>);
      uint64_t v11 = (char *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
      size_t v12 = _swift_stdlib_malloc_size(v11);
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
      uint64_t v13 = v11 + 32;
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
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
    }

    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t base witness table accessor for InternalGenerator in SiriGeoSuggestionsGenerator()
{
  return lazy protocol witness table accessor for type SiriGeoSuggestionsGenerator and conformance SiriGeoSuggestionsGenerator( &lazy protocol witness table cache variable for type SiriGeoSuggestionsGenerator and conformance SiriGeoSuggestionsGenerator,  (uint64_t)&protocol conformance descriptor for SiriGeoSuggestionsGenerator);
}

uint64_t type metadata accessor for SiriGeoSuggestionsGenerator()
{
  return objc_opt_self(&OBJC_CLASS____TtC18SiriGeoSuggestions27SiriGeoSuggestionsGenerator);
}

uint64_t base witness table accessor for Wrappable in SiriGeoSuggestionsGenerator()
{
  return lazy protocol witness table accessor for type SiriGeoSuggestionsGenerator and conformance SiriGeoSuggestionsGenerator( &lazy protocol witness table cache variable for type SiriGeoSuggestionsGenerator and conformance SiriGeoSuggestionsGenerator,  (uint64_t)&protocol conformance descriptor for SiriGeoSuggestionsGenerator);
}

uint64_t lazy protocol witness table accessor for type SiriGeoSuggestionsGenerator and conformance SiriGeoSuggestionsGenerator( unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for SiriGeoSuggestionsGenerator();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CandidateSuggestion?);
    swift_arrayInitWithCopy(a3, v6, v4, v9);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t result;
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CandidateSuggestion);
    swift_arrayInitWithCopy(a3, v6, v4, v9);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t outlined init with copy of Decodable & Encodable & Sendable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *outlined init with take of Decodable & Encodable & Sendable(__int128 *a1, _OWORD *a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

uint64_t static SiriGeoSuggestion.AllSuggestions.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SiriGeoSuggestion>);
  uint64_t v1 = *(void *)(type metadata accessor for SiriGeoSuggestion(0LL) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = swift_allocObject(v0, v4 + 3 * v2, v3 | 7);
  *(_OWORD *)(v5 + 16) = xmmword_DE90;
  unint64_t v6 = (void *)(v5 + v4);
  static SiriGeoSuggestion.ShareETA.getter(v6);
  static SiriGeoSuggestion.PlayMusic.getter((void *)((char *)v6 + v2));
  static SiriGeoSuggestion.PlayNews.getter((void *)((char *)v6 + 2 * v2));
  return v5;
}

uint64_t type metadata accessor for SiriGeoSuggestion(uint64_t a1)
{
  uint64_t result = type metadata singleton initialization cache for SiriGeoSuggestion;
  if (!type metadata singleton initialization cache for SiriGeoSuggestion) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SiriGeoSuggestion);
  }
  return result;
}

uint64_t SiriGeoSuggestion.Parameter.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t SiriGeoSuggestion.catIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain(*(void *)(v0 + 24));
  return v1;
}

uint64_t SiriGeoSuggestion.enabledLocales.getter()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 32));
}

uint64_t SiriGeoSuggestion.enabledDevices.getter()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 40));
}

uint64_t SiriGeoSuggestion.validInvocations.getter()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 48));
}

uint64_t SiriGeoSuggestion.isEligible.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_retain(*(void *)(v0 + 64));
  return v1;
}

uint64_t SiriGeoSuggestion.parameters.getter()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 72));
}

uint64_t SiriGeoSuggestion.intentIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SiriGeoSuggestion(0LL);
  return outlined init with copy of IntentType?( v1 + *(int *)(v3 + 44),  a1,  &demangling cache variable for type metadata for IntentType?);
}

uint64_t SiriGeoSuggestion.loggingIdentifier.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for SiriGeoSuggestion(0LL) + 48));
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain(v1[1]);
  return v2;
}

uint64_t SiriGeoSuggestion.getParams.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for SiriGeoSuggestion(0LL) + 52));
  uint64_t v2 = *v1;
  swift_retain(v1[1]);
  return v2;
}

uint64_t SiriGeoSuggestion.Parameter.resolver.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of IntentType?(v1 + 16, a1, &demangling cache variable for type metadata for Resolver?);
}

uint64_t SiriGeoSuggestion.Parameter.resolveParam.getter()
{
  return swift_retain(*(void *)(v0 + 56));
}

uint64_t SiriGeoSuggestion.Parameter.init(name:resolver:resolveParam:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  uint64_t result = outlined init with take of Resolver?( a3,  (uint64_t)(a5 + 2),  &demangling cache variable for type metadata for Resolver?);
  a5[7] = a4;
  return result;
}

uint64_t SiriGeoSuggestion.init(identifier:catIdentifier:enabledLocales:enabledDevices:validInvocations:isEligible:parameters:intentIdentifier:loggingIdentifier:getParams:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  a9[9] = a11;
  uint64_t v17 = (int *)type metadata accessor for SiriGeoSuggestion(0LL);
  uint64_t result = outlined init with take of Resolver?( a12,  (uint64_t)a9 + v17[11],  &demangling cache variable for type metadata for IntentType?);
  uint64_t v19 = (void *)((char *)a9 + v17[12]);
  *uint64_t v19 = a13;
  v19[1] = a14;
  int64_t v20 = (void *)((char *)a9 + v17[13]);
  *int64_t v20 = a15;
  v20[1] = a16;
  return result;
}

uint64_t outlined init with copy of IntentType?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with take of Resolver?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t one-time initialization function for shareETAIntent()
{
  uint64_t v0 = type metadata accessor for IntentType(0LL);
  __swift_allocate_value_buffer(v0, static SiriGeoSuggestion.shareETAIntent);
  __swift_project_value_buffer(v0, (uint64_t)static SiriGeoSuggestion.shareETAIntent);
  return static IntentType.inIntent(_:)(0xD000000000000021LL, 0x800000000000E4E0LL);
}

uint64_t SiriGeoSuggestion.shareETAIntent.unsafeMutableAddressor()
{
  if (one-time initialization token for shareETAIntent != -1) {
    swift_once(&one-time initialization token for shareETAIntent, one-time initialization function for shareETAIntent);
  }
  uint64_t v0 = type metadata accessor for IntentType(0LL);
  return __swift_project_value_buffer(v0, (uint64_t)static SiriGeoSuggestion.shareETAIntent);
}

uint64_t static SiriGeoSuggestion.shareETAIntent.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for shareETAIntent != -1) {
    swift_once(&one-time initialization token for shareETAIntent, one-time initialization function for shareETAIntent);
  }
  uint64_t v2 = type metadata accessor for IntentType(0LL);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static SiriGeoSuggestion.shareETAIntent);
  swift_beginAccess(v3, v5, 0LL, 0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t static SiriGeoSuggestion.shareETAIntent.setter(uint64_t a1)
{
  if (one-time initialization token for shareETAIntent != -1) {
    swift_once(&one-time initialization token for shareETAIntent, one-time initialization function for shareETAIntent);
  }
  uint64_t v2 = type metadata accessor for IntentType(0LL);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static SiriGeoSuggestion.shareETAIntent);
  swift_beginAccess(v3, v6, 33LL, 0LL);
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess(v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static SiriGeoSuggestion.shareETAIntent.modify(uint64_t a1))()
{
  if (one-time initialization token for shareETAIntent != -1) {
    swift_once(&one-time initialization token for shareETAIntent, one-time initialization function for shareETAIntent);
  }
  uint64_t v2 = type metadata accessor for IntentType(0LL);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static SiriGeoSuggestion.shareETAIntent);
  swift_beginAccess(v3, a1, 33LL, 0LL);
  return static SiriGeoSuggestion.shareETAIntent.modify;
}

void one-time initialization function for navigateVerb()
{
  static SiriGeoSuggestion.navigateVerb = 0x657461676976616ELL;
  qword_15310 = 0xE800000000000000LL;
}

uint64_t *SiriGeoSuggestion.navigateVerb.unsafeMutableAddressor()
{
  if (one-time initialization token for navigateVerb != -1) {
    swift_once(&one-time initialization token for navigateVerb, one-time initialization function for navigateVerb);
  }
  return &static SiriGeoSuggestion.navigateVerb;
}

uint64_t static SiriGeoSuggestion.navigateVerb.getter()
{
  if (one-time initialization token for navigateVerb != -1) {
    swift_once(&one-time initialization token for navigateVerb, one-time initialization function for navigateVerb);
  }
  swift_beginAccess(&static SiriGeoSuggestion.navigateVerb, v2, 0LL, 0LL);
  uint64_t v0 = static SiriGeoSuggestion.navigateVerb;
  swift_bridgeObjectRetain(qword_15310);
  return v0;
}

uint64_t static SiriGeoSuggestion.navigateVerb.setter(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for navigateVerb != -1) {
    swift_once(&one-time initialization token for navigateVerb, one-time initialization function for navigateVerb);
  }
  swift_beginAccess(&static SiriGeoSuggestion.navigateVerb, v6, 1LL, 0LL);
  uint64_t v4 = qword_15310;
  static SiriGeoSuggestion.navigateVerb = a1;
  qword_15310 = a2;
  return swift_bridgeObjectRelease(v4);
}

uint64_t (*static SiriGeoSuggestion.navigateVerb.modify(uint64_t a1))()
{
  if (one-time initialization token for navigateVerb != -1) {
    swift_once(&one-time initialization token for navigateVerb, one-time initialization function for navigateVerb);
  }
  swift_beginAccess(&static SiriGeoSuggestion.navigateVerb, a1, 33LL, 0LL);
  return static SiriGeoSuggestion.navigateVerb.modify;
}

uint64_t initializeBufferWithCopyOfBuffer for SiriGeoSuggestion(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)a1 = *a2;
    uint64_t v4 = v16 + ((v5 + 16LL) & ~(unint64_t)v5);
  }

  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = a2[4];
    uint64_t v10 = a2[5];
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v10;
    __int128 v26 = *((_OWORD *)a2 + 3);
    *(_OWORD *)(a1 + 48) = v26;
    uint64_t v11 = a2[8];
    uint64_t v12 = a2[9];
    uint64_t v13 = a3[11];
    uint64_t v28 = (char *)a2 + v13;
    __dst = (void *)(a1 + v13);
    *(void *)(a1 + 64) = v11;
    *(void *)(a1 + 72) = v12;
    uint64_t v14 = type metadata accessor for IntentType(0LL);
    uint64_t v25 = *(void *)(v14 - 8);
    uint64_t v27 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v25 + 48);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v26);
    swift_retain(v11);
    swift_bridgeObjectRetain(v12);
    if (v27(v28, 1LL, v14))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
      memcpy(__dst, v28, *(void *)(*(void *)(v15 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, char *, uint64_t))(v25 + 16))(__dst, v28, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(__dst, 0LL, 1LL, v14);
    }

    uint64_t v17 = a3[12];
    uint64_t v18 = a3[13];
    uint64_t v19 = (void *)(v4 + v17);
    int64_t v20 = (uint64_t *)((char *)a2 + v17);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    int64_t v22 = (void *)(v4 + v18);
    int64_t v23 = (uint64_t *)((char *)a2 + v18);
    uint64_t v16 = v23[1];
    *int64_t v22 = *v23;
    v22[1] = v16;
    swift_bridgeObjectRetain(v21);
  }

  swift_retain(v16);
  return v4;
}

uint64_t destroy for SiriGeoSuggestion(void *a1, int *a2)
{
  uint64_t v4 = (char *)a1 + a2[11];
  uint64_t v5 = type metadata accessor for IntentType(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  swift_bridgeObjectRelease(*(void *)((char *)a1 + a2[12] + 8));
  return swift_release(*(void *)((char *)a1 + a2[13] + 8));
}

uint64_t initializeWithCopy for SiriGeoSuggestion(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  __int128 v25 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v25;
  uint64_t v10 = *(void *)(a2 + 64);
  uint64_t v9 = *(void *)(a2 + 72);
  uint64_t v11 = a3[11];
  __dst = (void *)(a1 + v11);
  uint64_t v24 = (const void *)(a2 + v11);
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = v9;
  uint64_t v12 = type metadata accessor for IntentType(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __int128 v26 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v25);
  swift_retain(v10);
  swift_bridgeObjectRetain(v9);
  if (v26(v24, 1LL, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
    memcpy(__dst, v24, *(void *)(*(void *)(v14 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(__dst, v24, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0LL, 1LL, v12);
  }

  uint64_t v15 = a3[12];
  uint64_t v16 = a3[13];
  uint64_t v17 = (void *)(a1 + v15);
  uint64_t v18 = (void *)(a2 + v15);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  int64_t v20 = (void *)(a1 + v16);
  uint64_t v21 = (void *)(a2 + v16);
  uint64_t v22 = v21[1];
  *int64_t v20 = *v21;
  v20[1] = v22;
  swift_bridgeObjectRetain(v19);
  swift_retain(v22);
  return a1;
}

void *assignWithCopy for SiriGeoSuggestion(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a2[4];
  uint64_t v11 = a1[4];
  a1[4] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = a2[5];
  uint64_t v13 = a1[5];
  a1[5] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  uint64_t v14 = a2[6];
  uint64_t v15 = a1[6];
  a1[6] = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  uint64_t v16 = a2[8];
  uint64_t v17 = a1[8];
  a1[7] = a2[7];
  a1[8] = v16;
  swift_retain(v16);
  swift_release(v17);
  uint64_t v18 = a2[9];
  uint64_t v19 = a1[9];
  a1[9] = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  uint64_t v20 = a3[11];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = type metadata accessor for IntentType(0LL);
  uint64_t v24 = *(void *)(v23 - 8);
  __int128 v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1LL, v23);
  int v27 = v25(v22, 1LL, v23);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 24))(v21, v22, v23);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_6;
  }

  if (v27)
  {
LABEL_6:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
    memcpy(v21, v22, *(void *)(*(void *)(v28 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0LL, 1LL, v23);
LABEL_7:
  uint64_t v29 = a3[12];
  unint64_t v30 = (void *)((char *)a1 + v29);
  char v31 = (void *)((char *)a2 + v29);
  *unint64_t v30 = *v31;
  uint64_t v32 = v31[1];
  uint64_t v33 = v30[1];
  v30[1] = v32;
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRelease(v33);
  uint64_t v34 = a3[13];
  uint64_t v35 = (void *)((char *)a1 + v34);
  int64_t v36 = (void *)((char *)a2 + v34);
  uint64_t v37 = v36[1];
  uint64_t v38 = v35[1];
  *uint64_t v35 = *v36;
  v35[1] = v37;
  swift_retain(v37);
  swift_release(v38);
  return a1;
}

uint64_t initializeWithTake for SiriGeoSuggestion(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __int128 v7 = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v8 = a3[11];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 56) = v7;
  uint64_t v11 = type metadata accessor for IntentType(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1LL, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0LL, 1LL, v11);
  }

  uint64_t v14 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  return a1;
}

uint64_t assignWithTake for SiriGeoSuggestion(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease(v10);
  uint64_t v11 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = *(void *)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release(v13);
  uint64_t v14 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease(v14);
  uint64_t v15 = a3[11];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = type metadata accessor for IntentType(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1LL, v18);
  int v22 = v20(v17, 1LL, v18);
  if (!v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 40))(v16, v17, v18);
      goto LABEL_7;
    }

    (*(void (**)(void *, uint64_t))(v19 + 8))(v16, v18);
    goto LABEL_6;
  }

  if (v22)
  {
LABEL_6:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(void *, void *, uint64_t))(v19 + 32))(v16, v17, v18);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0LL, 1LL, v18);
LABEL_7:
  uint64_t v24 = a3[12];
  __int128 v25 = (void *)(a1 + v24);
  int v26 = (uint64_t *)(a2 + v24);
  uint64_t v28 = *v26;
  uint64_t v27 = v26[1];
  uint64_t v29 = v25[1];
  *__int128 v25 = v28;
  v25[1] = v27;
  swift_bridgeObjectRelease(v29);
  uint64_t v30 = a3[13];
  uint64_t v31 = *(void *)(a1 + v30 + 8);
  *(_OWORD *)(a1 + v30) = *(_OWORD *)(a2 + v30);
  swift_release(v31);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriGeoSuggestion(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_6EB4);
}

uint64_t sub_6EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))( a1 + *(int *)(a3 + 44),  a2,  v8);
  }

uint64_t storeEnumTagSinglePayload for SiriGeoSuggestion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_6F40);
}

uint64_t sub_6F40(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( v5 + *(int *)(a4 + 44),  a2,  a2,  v7);
  }

  return result;
}

void type metadata completion function for SiriGeoSuggestion(uint64_t a1)
{
  v4[0] = &unk_DFB8;
  v4[1] = &unk_DFB8;
  v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[4] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[5] = (char *)&value witness table for () + 64;
  v4[6] = (char *)&value witness table for Builtin.BridgeObject + 64;
  type metadata accessor for IntentType?(319LL);
  if (v3 <= 0x3F)
  {
    v4[7] = *(void *)(v2 - 8) + 64LL;
    v4[8] = &unk_DFD0;
    v4[9] = (char *)&value witness table for () + 64;
    swift_initStructMetadata(a1, 256LL, 10LL, v4, a1 + 16);
  }

void type metadata accessor for IntentType?(uint64_t a1)
{
  if (!lazy cache variable for type metadata for IntentType?)
  {
    uint64_t v2 = type metadata accessor for IntentType(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&lazy cache variable for type metadata for IntentType?);
    }
  }

uint64_t initializeBufferWithCopyOfBuffer for SiriGeoSuggestion.Parameter(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for SiriGeoSuggestion.Parameter(void *a1)
{
  if (a1[5]) {
    __swift_destroy_boxed_opaque_existential_1Tm(a1 + 2);
  }
  return swift_release(a1[7]);
}

uint64_t initializeWithCopy for SiriGeoSuggestion.Parameter(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 2;
  uint64_t v6 = a2[5];
  swift_bridgeObjectRetain(v4);
  if (v6)
  {
    uint64_t v7 = a2[6];
    *(void *)(a1 + 40) = v6;
    *(void *)(a1 + 48) = v7;
    (**(void (***)(uint64_t, void *, uint64_t))(v6 - 8))(a1 + 16, v5, v6);
  }

  else
  {
    __int128 v8 = *((_OWORD *)v5 + 1);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
    *(_OWORD *)(a1 + 32) = v8;
    *(void *)(a1 + 48) = v5[4];
  }

  uint64_t v9 = a2[7];
  *(void *)(a1 + 56) = v9;
  swift_retain(v9);
  return a1;
}

uint64_t assignWithCopy for SiriGeoSuggestion.Parameter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v6)
    {
      *(void *)(a1 + 40) = v6;
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, a2 + 16);
      goto LABEL_8;
    }

LABEL_7:
    __int128 v7 = *(_OWORD *)(a2 + 16);
    __int128 v8 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v7;
    *(_OWORD *)(a1 + 32) = v8;
    goto LABEL_8;
  }

  if (!v6)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((void *)(a1 + 16));
    goto LABEL_7;
  }

  __swift_assign_boxed_opaque_existential_1((void *)(a1 + 16), (void *)(a2 + 16));
LABEL_8:
  uint64_t v9 = *(void *)(a2 + 56);
  uint64_t v10 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v9;
  swift_retain(v9);
  swift_release(v10);
  return a1;
}

void *__swift_assign_boxed_opaque_existential_1(void *result, void *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
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
        *uint64_t v3 = v12;
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
          *uint64_t v3 = *a2;
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
          *uint64_t v3 = *a2;
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

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SiriGeoSuggestion.Parameter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  if (*(void *)(a1 + 40)) {
    __swift_destroy_boxed_opaque_existential_1Tm((void *)(a1 + 16));
  }
  __int128 v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v7;
  swift_release(v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriGeoSuggestion.Parameter(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriGeoSuggestion.Parameter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 64) = 1;
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

    *(_BYTE *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for SiriGeoSuggestion.Parameter()
{
  return &type metadata for SiriGeoSuggestion.Parameter;
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

double static SiriGeoSuggestion.PlayMusic.getter@<D0>(void *a1@<X8>)
{
  if (one-time initialization token for t41Locales != -1) {
    swift_once(&one-time initialization token for t41Locales, one-time initialization function for t41Locales);
  }
  uint64_t v2 = static SiriGeoSuggestionsConstants.t41Locales;
  uint64_t v3 = one-time initialization token for kCarPlayDevice;
  swift_bridgeObjectRetain(static SiriGeoSuggestionsConstants.t41Locales);
  if (v3 != -1) {
    swift_once(&one-time initialization token for kCarPlayDevice, one-time initialization function for kCarPlayDevice);
  }
  uint64_t v4 = static SiriGeoSuggestionsConstants.kCarPlayDevice;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  uint64_t v6 = *(void *)(type metadata accessor for VersionedInvocation(0LL) - 8);
  uint64_t v7 = swift_allocObject( v5,  ((*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
       + *(void *)(v6 + 72),
         *(unsigned __int8 *)(v6 + 80) | 7LL);
  *(_OWORD *)(v7 + 16) = xmmword_E040;
  uint64_t v8 = swift_bridgeObjectRetain(v4);
  static VersionedInvocations.HintsDawnC.getter(v8);
  uint64_t v9 = (int *)type metadata accessor for SiriGeoSuggestion(0LL);
  uint64_t v10 = (char *)a1 + v9[11];
  uint64_t v11 = type metadata accessor for IntentType(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v10, 1LL, 1LL, v11);
  *a1 = 0x6973754D79616C50LL;
  a1[1] = 0xE900000000000063LL;
  a1[2] = 0xD00000000000001CLL;
  a1[3] = 0x800000000000E510LL;
  a1[4] = v2;
  a1[5] = v4;
  a1[6] = v7;
  a1[7] = &async function pointer to implicit closure #1 in static SiriGeoSuggestion.PlayMusic.getter;
  a1[8] = 0LL;
  a1[9] = &_swiftEmptyArrayStorage;
  double result = 9.3089372e199;
  *(_OWORD *)((char *)a1 + v9[12]) = xmmword_E050;
  uint64_t v13 = (unint64_t (**)())((char *)a1 + v9[13]);
  *uint64_t v13 = closure #1 in static SiriGeoSuggestion.PlayMusic.getter;
  v13[1] = 0LL;
  return result;
}

uint64_t static SiriGeoSuggestion.ineligibleHint(_:environment:_:signals:)()
{
  return protocol witness for SuggestionsSignals.isNotSharingETA.getter in conformance StandardSuggestionSignals( *(uint64_t (**)(uint64_t))(v0 + 8),  v0,  0LL);
}

unint64_t closure #1 in static SiriGeoSuggestion.PlayMusic.getter()
{
  return specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&_swiftEmptyArrayStorage);
}

double static SiriGeoSuggestion.PlayNews.getter@<D0>(void *a1@<X8>)
{
  if (one-time initialization token for t41Locales != -1) {
    swift_once(&one-time initialization token for t41Locales, one-time initialization function for t41Locales);
  }
  uint64_t v2 = static SiriGeoSuggestionsConstants.t41Locales;
  uint64_t v3 = one-time initialization token for kCarPlayDevice;
  swift_bridgeObjectRetain(static SiriGeoSuggestionsConstants.t41Locales);
  if (v3 != -1) {
    swift_once(&one-time initialization token for kCarPlayDevice, one-time initialization function for kCarPlayDevice);
  }
  uint64_t v4 = static SiriGeoSuggestionsConstants.kCarPlayDevice;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  uint64_t v6 = type metadata accessor for VersionedInvocation(0LL);
  uint64_t v7 = swift_allocObject( v5,  ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL))
       + *(void *)(*(void *)(v6 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v7 + 16) = xmmword_E040;
  uint64_t v8 = swift_bridgeObjectRetain(v4);
  static VersionedInvocations.HintsDawnC.getter(v8);
  uint64_t v9 = (int *)type metadata accessor for SiriGeoSuggestion(0LL);
  uint64_t v10 = (char *)a1 + v9[11];
  uint64_t v11 = type metadata accessor for IntentType(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v10, 1LL, 1LL, v11);
  *a1 = 0x7377654E79616C50LL;
  a1[1] = 0xE800000000000000LL;
  a1[2] = 0xD00000000000001BLL;
  a1[3] = 0x800000000000E530LL;
  a1[4] = v2;
  a1[5] = v4;
  a1[6] = v7;
  a1[7] = &async function pointer to implicit closure #1 in static SiriGeoSuggestion.PlayNews.getter;
  a1[8] = 0LL;
  a1[9] = &_swiftEmptyArrayStorage;
  double result = 4.61716887e69;
  *(_OWORD *)((char *)a1 + v9[12]) = xmmword_E060;
  uint64_t v13 = (unint64_t (**)())((char *)a1 + v9[13]);
  *uint64_t v13 = closure #1 in static SiriGeoSuggestion.PlayMusic.getter;
  v13[1] = 0LL;
  return result;
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

uint64_t outlined init with copy of (String, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t static SiriGeoSuggestion.ShareETA.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = &v19[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  if (one-time initialization token for t41Locales != -1) {
    swift_once(&one-time initialization token for t41Locales, one-time initialization function for t41Locales);
  }
  uint64_t v4 = static SiriGeoSuggestionsConstants.t41Locales;
  uint64_t v5 = one-time initialization token for kCarPlayDevice;
  swift_bridgeObjectRetain(static SiriGeoSuggestionsConstants.t41Locales);
  if (v5 != -1) {
    swift_once(&one-time initialization token for kCarPlayDevice, one-time initialization function for kCarPlayDevice);
  }
  uint64_t v6 = static SiriGeoSuggestionsConstants.kCarPlayDevice;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  uint64_t v8 = type metadata accessor for VersionedInvocation(0LL);
  uint64_t v9 = swift_allocObject( v7,  ((*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL))
       + *(void *)(*(void *)(v8 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v9 + 16) = xmmword_E040;
  uint64_t v10 = swift_bridgeObjectRetain(v6);
  static VersionedInvocations.HintsDawnC.getter(v10);
  if (one-time initialization token for shareETAIntent != -1) {
    swift_once(&one-time initialization token for shareETAIntent, one-time initialization function for shareETAIntent);
  }
  uint64_t v11 = type metadata accessor for IntentType(0LL);
  uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)static SiriGeoSuggestion.shareETAIntent);
  swift_beginAccess(v12, v19, 0LL, 0LL);
  uint64_t v13 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v3, v12, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v3, 0LL, 1LL, v11);
  *a1 = 0x4154456572616853LL;
  a1[1] = 0xE800000000000000LL;
  a1[2] = 0xD00000000000001BLL;
  a1[3] = 0x800000000000E550LL;
  a1[4] = v4;
  a1[5] = v6;
  a1[6] = v9;
  a1[7] = &async function pointer to implicit closure #1 in static SiriGeoSuggestion.ShareETA.getter;
  a1[8] = 0LL;
  a1[9] = &_swiftEmptyArrayStorage;
  BOOL v14 = (int *)type metadata accessor for SiriGeoSuggestion(0LL);
  uint64_t result = outlined init with take of IntentType?((uint64_t)v3, (uint64_t)a1 + v14[11]);
  uint64_t v16 = (void *)((char *)a1 + v14[12]);
  *uint64_t v16 = 0LL;
  v16[1] = 0LL;
  uint64_t v17 = (unint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)a1 + v14[13]);
  *uint64_t v17 = partial apply for implicit closure #2 in static SiriGeoSuggestion.ShareETA.getter;
  v17[1] = 0LL;
  return result;
}

uint64_t implicit closure #1 in static SiriGeoSuggestion.ShareETA.getter( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc(dword_14DFC);
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = protocol witness for InternalGenerator.generateCandidateSuggestions(interaction:environment:factory:) in conformance SiriGeoSuggestionsGenerator;
  v10[61] = a4;
  v10[62] = a5;
  v10[59] = a1;
  v10[60] = a2;
  return swift_task_switch(specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:), 0LL, 0LL);
}

uint64_t specialized Dictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (*(void *)(a1 + 24))
  {
    outlined init with take of Decodable & Encodable & Sendable((__int128 *)a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v10 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v11, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t v8 = *v3;
    void *v4 = v10;
    swift_bridgeObjectRelease(a3);
    return swift_bridgeObjectRelease(v8);
  }

  else
  {
    outlined destroy of (Decodable & Encodable & Sendable)?(a1);
    specialized Dictionary._Variant.removeValue(forKey:)(a2, a3, v11);
    swift_bridgeObjectRelease(a3);
    return outlined destroy of (Decodable & Encodable & Sendable)?((uint64_t)v11);
  }

unint64_t partial apply for implicit closure #2 in static SiriGeoSuggestion.ShareETA.getter( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return specialized static SiriGeoSuggestion.getShareETAParams(_:environment:_:)(a3, a4);
}

uint64_t outlined init with take of IntentType?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

double specialized Dictionary._Variant.removeValue(forKey:)@<D0>( uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  unint64_t v9 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v12 = *v4;
    uint64_t v15 = *v4;
    uint64_t *v4 = 0x8000000000000000LL;
    if (!isUniquelyReferenced_nonNull_native)
    {
      specialized _NativeDictionary.copy()();
      uint64_t v12 = v15;
    }

    swift_bridgeObjectRelease(*(void *)(*(void *)(v12 + 48) + 16 * v9 + 8));
    outlined init with take of Decodable & Encodable & Sendable((__int128 *)(*(void *)(v12 + 56) + 48 * v9), a3);
    specialized _NativeDictionary._delete(at:)(v9, v12);
    uint64_t v13 = *v4;
    uint64_t *v4 = v12;
    swift_bridgeObjectRelease(v13);
  }

  else
  {
    double result = 0.0;
    a3[1] = 0u;
    a3[2] = 0u;
    *a3 = 0u;
  }

  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Decodable & Encodable & Sendable>);
  char v38 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_44;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  uint64_t v35 = v3;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
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
      goto LABEL_25;
    }

    int64_t v19 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }

    if (v19 >= v36) {
      break;
    }
    uint64_t v20 = (void *)(v5 + 64);
    unint64_t v21 = *(void *)(v37 + 8 * v19);
    ++v14;
    if (!v21)
    {
      int64_t v14 = v19 + 1;
      if (v19 + 1 >= v36) {
        goto LABEL_37;
      }
      unint64_t v21 = *(void *)(v37 + 8 * v14);
      if (!v21)
      {
        int64_t v22 = v19 + 2;
        if (v22 >= v36)
        {
LABEL_37:
          swift_release(v5);
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_44;
          }
          goto LABEL_40;
        }

        unint64_t v21 = *(void *)(v37 + 8 * v22);
        if (!v21)
        {
          while (1)
          {
            int64_t v14 = v22 + 1;
            if (__OFADD__(v22, 1LL)) {
              goto LABEL_46;
            }
            if (v14 >= v36) {
              goto LABEL_37;
            }
            unint64_t v21 = *(void *)(v37 + 8 * v14);
            ++v22;
            if (v21) {
              goto LABEL_24;
            }
          }
        }

        int64_t v14 = v22;
      }
    }

LABEL_24:
    unint64_t v11 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v14 << 6);
LABEL_25:
    uint64_t v23 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v18);
    uint64_t v25 = *v23;
    uint64_t v24 = v23[1];
    int v26 = (__int128 *)(*(void *)(v5 + 56) + 48 * v18);
    if ((v38 & 1) != 0)
    {
      outlined init with take of Decodable & Encodable & Sendable(v26, v40);
    }

    else
    {
      outlined init with copy of Decodable & Encodable & Sendable((uint64_t)v26, (uint64_t)v40);
      swift_bridgeObjectRetain(v24);
    }

    Hasher.init(_seed:)(v39, *(void *)(v8 + 40));
    String.hash(into:)(v39, v25, v24);
    uint64_t result = Hasher._finalize()();
    uint64_t v27 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1LL << v28) & ~*(void *)(v12 + 8 * (v28 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1LL << v28) & ~*(void *)(v12 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }

        BOOL v32 = v29 == v31;
        if (v29 == v31) {
          unint64_t v29 = 0LL;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v12 + 8 * v29);
      }

      while (v33 == -1);
      unint64_t v15 = __clz(__rbit64(~v33)) + (v29 << 6);
    }

    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
    uint64_t v16 = (void *)(*(void *)(v8 + 48) + 16 * v15);
    *uint64_t v16 = v25;
    v16[1] = v24;
    uint64_t result = (uint64_t)outlined init with take of Decodable & Encodable & Sendable( v40,  (_OWORD *)(*(void *)(v8 + 56) + 48 * v15));
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v3 = v35;
  uint64_t v20 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_40:
  uint64_t v34 = 1LL << *(_BYTE *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v20, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v20 = -1LL << v34;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_44:
  uint64_t result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        unint64_t v11 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v6);
        uint64_t v12 = *v11;
        uint64_t v13 = v11[1];
        Hasher.init(_seed:)(v28, *(void *)(a2 + 40));
        swift_bridgeObjectRetain(v13);
        String.hash(into:)(v28, v12, v13);
        Swift::Int v14 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease(v13);
        unint64_t v15 = v14 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v15 < v8) {
            goto LABEL_5;
          }
        }

        else if (v15 >= v8)
        {
          goto LABEL_11;
        }

        if (v3 >= (uint64_t)v15)
        {
LABEL_11:
          uint64_t v16 = *(void *)(a2 + 48);
          unint64_t v17 = (_OWORD *)(v16 + 16 * v3);
          unint64_t v18 = (_OWORD *)(v16 + 16 * v6);
          if (v3 != v6 || v17 >= v18 + 1) {
            *unint64_t v17 = *v18;
          }
          uint64_t v19 = *(void *)(a2 + 56);
          uint64_t v20 = (__int128 *)(v19 + 48 * v3);
          unint64_t v21 = (__int128 *)(v19 + 48 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 3))
          {
            __int128 v9 = *v21;
            __int128 v10 = v21[2];
            v20[1] = v21[1];
            v20[2] = v10;
            *uint64_t v20 = v9;
            int64_t v3 = v6;
          }
        }

LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    int64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1LL << v3) - 1;
  }

  else
  {
    int64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1LL << result) - 1;
  }

  *int64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1LL);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }

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

_OWORD *specialized _NativeDictionary.setValue(_:forKey:isUnique:)( __int128 *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  __int128 v10 = (void *)*v4;
  unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
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
        uint64_t v19 = (void *)(v18[7] + 48 * v12);
        __swift_destroy_boxed_opaque_existential_1Tm(v19);
        return outlined init with take of Decodable & Encodable & Sendable(a1, v19);
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      specialized _NativeDictionary.copy()();
      goto LABEL_7;
    }

    specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
    unint64_t v21 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      unint64_t v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      specialized _NativeDictionary._insert(at:key:value:)(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain(a3);
    }
  }

  uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

_OWORD *specialized _NativeDictionary._insert(at:key:value:)( unint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = outlined init with take of Decodable & Encodable & Sendable(a4, (_OWORD *)(a5[7] + 48 * a1));
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

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Decodable & Encodable & Sendable>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release(v2);
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }

  uint64_t v25 = v1;
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
    uint64_t v20 = 48 * v15;
    outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v2 + 56) + 48 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    outlined init with take of Decodable & Encodable & Sendable(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
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

uint64_t specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[61] = a4;
  v5[62] = a5;
  v5[59] = a1;
  v5[60] = a2;
  return swift_task_switch(specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:), 0LL, 0LL);
}

uint64_t specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:)()
{
  if (one-time initialization token for navigateVerb != -1) {
    swift_once(&one-time initialization token for navigateVerb, one-time initialization function for navigateVerb);
  }
  uint64_t v2 = *(void *)(v0 + 472);
  uint64_t v1 = *(void *)(v0 + 480);
  swift_beginAccess(&static SiriGeoSuggestion.navigateVerb, v0 + 352, 0LL, 0LL);
  BOOL v3 = static SiriGeoSuggestion.navigateVerb == v2 && qword_15310 == v1;
  if (!v3
    && (_stringCompareWithSmolCheck(_:_:expecting:)( *(void *)(v0 + 472),  *(void *)(v0 + 480),  static SiriGeoSuggestion.navigateVerb,  qword_15310,  0LL) & 1) == 0)
  {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }

  uint64_t v4 = **(void **)(v0 + 488);
  if (!*(void *)(v4 + 16)
    || (unint64_t v5 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000015LL, 0x800000000000E320LL), (v6 & 1) == 0)
    || (outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v4 + 56) + 48 * v5, v0 + 64),
        uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable),
        (swift_dynamicCast(v0 + 376, v0 + 64, v7, &type metadata for String, 6LL) & 1) == 0))
  {
    int64_t v13 = &SALocalSearchMapItemMapItemTypePERSON_ITEMValue;
LABEL_16:
    static String._unconditionallyBridgeFromObjectiveC(_:)(*v13);
    uint64_t v12 = v14;
    goto LABEL_17;
  }

  uint64_t v9 = *(void *)(v0 + 376);
  uint64_t v8 = *(void *)(v0 + 384);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(SALocalSearchMapItemMapItemTypePERSON_ITEMValue);
  uint64_t v12 = v11;
  if (!v8)
  {
LABEL_17:
    swift_bridgeObjectRelease(v12);
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }

  if (v9 == v10 && v8 == v11)
  {
    swift_bridgeObjectRelease_n(v8, 2LL);
  }

  else
  {
    char v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v9, v8, v10, v11, 0LL);
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(v8);
    if ((v16 & 1) == 0) {
      return (*(uint64_t (**)(void))(v0 + 8))(0LL);
    }
  }

  uint64_t v17 = **(void **)(v0 + 488);
  if (!*(void *)(v17 + 16)
    || (unint64_t v18 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010LL, 0x800000000000E340LL), (v19 & 1) == 0)
    || (outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v17 + 56) + 48 * v18, v0 + 112),
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable),
        (swift_dynamicCast(v0 + 408, v0 + 112, v20, &type metadata for String, 6LL) & 1) == 0))
  {
    int64_t v13 = &SALocalSearchMapItemMapItemTypeCURRENT_LOCATIONValue;
    goto LABEL_16;
  }

  uint64_t v22 = *(void *)(v0 + 408);
  uint64_t v21 = *(void *)(v0 + 416);
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(SALocalSearchMapItemMapItemTypeCURRENT_LOCATIONValue);
  uint64_t v12 = v24;
  if (!v21) {
    goto LABEL_17;
  }
  if (v22 != v23 || v21 != v24)
  {
    char v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v21, v23, v24, 0LL);
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(v21);
    if ((v25 & 1) != 0) {
      goto LABEL_29;
    }
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }

  swift_bridgeObjectRelease_n(v21, 2LL);
LABEL_29:
  uint64_t v26 = **(void **)(v0 + 488);
  if (!*(void *)(v26 + 16)) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  unint64_t v27 = specialized __RawDictionaryStorage.find<A>(_:)(0x4C746E6572727563LL, 0xEA00000000007461LL);
  if ((v28 & 1) == 0) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v26 + 56) + 48 * v27, v0 + 160);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
  if ((swift_dynamicCast(v0 + 448, v0 + 160, v29, &type metadata for Double, 6LL) & 1) == 0) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  uint64_t v30 = **(void **)(v0 + 488);
  if (!*(void *)(v30 + 16)) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  double v31 = *(double *)(v0 + 448);
  unint64_t v32 = specialized __RawDictionaryStorage.find<A>(_:)(0x4C746E6572727563LL, 0xEB00000000676E6FLL);
  if ((v33 & 1) == 0) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v30 + 56) + 48 * v32, v0 + 256);
  if ((swift_dynamicCast(v0 + 440, v0 + 256, v29, &type metadata for Double, 6LL) & 1) == 0) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  uint64_t v34 = **(void **)(v0 + 488);
  if (!*(void *)(v34 + 16)) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  double v35 = *(double *)(v0 + 440);
  unint64_t v36 = specialized __RawDictionaryStorage.find<A>(_:)(0x74616E6974736564LL, 0xEE0074614C6E6F69LL);
  if ((v37 & 1) == 0) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v34 + 56) + 48 * v36, v0 + 208);
  if ((swift_dynamicCast(v0 + 464, v0 + 208, v29, &type metadata for Double, 6LL) & 1) == 0) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  uint64_t v38 = **(void **)(v0 + 488);
  if (!*(void *)(v38 + 16)) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  double v39 = *(double *)(v0 + 464);
  unint64_t v40 = specialized __RawDictionaryStorage.find<A>(_:)(0x74616E6974736564LL, 0xEF676E6F4C6E6F69LL);
  if ((v41 & 1) == 0) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v38 + 56) + 48 * v40, v0 + 304);
  if ((swift_dynamicCast(v0 + 456, v0 + 304, v29, &type metadata for Double, 6LL) & 1) == 0) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  double v42 = *(double *)(v0 + 456);
  id v43 = [objc_allocWithZone(CLLocation) initWithLatitude:v31 longitude:v35];
  *(void *)(v0 + 504) = v43;
  id v44 = [objc_allocWithZone(CLLocation) initWithLatitude:v39 longitude:v42];
  *(void *)(v0 + 512) = v44;
  [v43 distanceFromLocation:v44];
  if (v45 <= 6440.0) {
    goto LABEL_50;
  }
  uint64_t v46 = *(void **)(v0 + 496);
  uint64_t v47 = v46[3];
  uint64_t v48 = v46[4];
  __swift_project_boxed_opaque_existential_1(v46, v47);
  uint64_t v49 = **(void **)(v0 + 488);
  if (!*(void *)(v49 + 16)) {
    goto LABEL_50;
  }
  unint64_t v50 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010LL, 0x800000000000E300LL);
  if ((v51 & 1) == 0) {
    goto LABEL_50;
  }
  outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v49 + 56) + 48 * v50, v0 + 16);
  if ((swift_dynamicCast(v0 + 392, v0 + 16, v29, &type metadata for String, 6LL) & 1) == 0) {
    goto LABEL_50;
  }
  uint64_t v52 = *(void *)(v0 + 400);
  *(void *)(v0 + 424) = *(void *)(v0 + 392);
  *(void *)(v0 + 432) = v52;
  unint64_t v53 = lazy protocol witness table accessor for type String and conformance String();
  v54 = (void *)StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)( 45LL,  0xE100000000000000LL,  0x7FFFFFFFFFFFFFFFLL,  1LL,  &type metadata for String,  v53);
  swift_bridgeObjectRelease(v52);
  if (!v54[2])
  {
    swift_bridgeObjectRelease(v54);
    goto LABEL_50;
  }

  v72 = *(void **)(v0 + 496);
  uint64_t v55 = v54[4];
  uint64_t v56 = v54[5];
  uint64_t v58 = v54[6];
  uint64_t v57 = v54[7];
  swift_bridgeObjectRetain(v57);
  swift_bridgeObjectRelease(v54);
  uint64_t v59 = static String._fromSubstring(_:)(v55, v56, v58, v57);
  uint64_t v61 = v60;
  swift_bridgeObjectRelease(v57);
  uint64_t v62 = v46[3];
  uint64_t v63 = v46[4];
  __swift_project_boxed_opaque_existential_1(v72, v62);
  uint64_t v64 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v63 + 64))(v59, v61, v62, v63);
  uint64_t v66 = v65;
  swift_bridgeObjectRelease(v61);
  if (!v66)
  {
LABEL_50:

    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }

  uint64_t v67 = *(void **)(v0 + 496);
  v74[3] = &type metadata for String;
  v74[4] = &protocol witness table for String;
  v74[5] = &protocol witness table for String;
  v74[0] = v64;
  v74[1] = v66;
  specialized Dictionary.subscript.setter((uint64_t)v74, 0xD000000000000012LL, 0x800000000000E370LL);
  uint64_t v68 = v46[3];
  uint64_t v69 = v46[4];
  __swift_project_boxed_opaque_existential_1(v67, v68);
  id v70 = *(int **)(v69 + 56);
  v73 = (uint64_t (*)(uint64_t, uint64_t))((char *)v70 + *v70);
  uint64_t v71 = (void *)swift_task_alloc(v70[1]);
  *(void *)(v0 + 520) = v71;
  *uint64_t v71 = v0;
  v71[1] = specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:);
  return v73(v68, v69);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v1 = *(void **)(v0 + 504);

  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 528));
}

uint64_t specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:)(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 520LL);
  *(_BYTE *)(*(void *)v1 + 528LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:), 0LL, 0LL);
}

unint64_t specialized static SiriGeoSuggestion.getShareETAParams(_:environment:_:)( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject(v3, &v10);
  *(_OWORD *)(inited + 16) = xmmword_E040;
  *(void *)(inited + 32) = 0x4E746361746E6F63LL;
  *(void *)(inited + 40) = 0xEB00000000656D61LL;
  *(void *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v5 = swift_allocObject(&unk_10950, 48LL, 7LL);
  char v6 = (_OWORD *)(v5 + 16);
  *(void *)(inited + 48) = v5;
  if (*(void *)(a2 + 16)
    && (unint64_t v7 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000012LL, 0x800000000000E370LL), (v8 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(a2 + 56) + 32 * v7, (uint64_t)v6);
  }

  else
  {
    *char v6 = 0u;
    v6[1] = 0u;
  }

  return specialized Dictionary.init(dictionaryLiteral:)(inited);
}

uint64_t sub_906C()
{
  if (*(void *)(v0 + 40)) {
    __swift_destroy_boxed_opaque_existential_1Tm((void *)(v0 + 16));
  }
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined destroy of (Decodable & Encodable & Sendable)?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Decodable & Encodable & Sendable)?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[18] = a2;
  v3[19] = a3;
  v3[17] = a1;
  return swift_task_switch( static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:),  0LL,  0LL);
}

uint64_t static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)()
{
  if (one-time initialization token for kOwner != -1) {
    swift_once(&one-time initialization token for kOwner, one-time initialization function for kOwner);
  }
  uint64_t v1 = (int *)v0[17];
  uint64_t v2 = static SiriGeoSuggestionsConstants.kOwner;
  v0[5] = type metadata accessor for DomainOwner(0LL);
  v0[6] = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type DomainOwner and conformance DomainOwner,  (uint64_t (*)(uint64_t))&type metadata accessor for DomainOwner,  (uint64_t)&protocol conformance descriptor for DomainOwner);
  v0[2] = v2;
  uint64_t v3 = v1[1];
  char v6 = (uint64_t (*)(void *))((char *)v1 + *v1);
  swift_retain(v2);
  uint64_t v4 = (void *)swift_task_alloc(v3);
  v0[20] = v4;
  void *v4 = v0;
  v4[1] = static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:);
  return v6(v0 + 2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 *v38;
  uint64_t v34 = *(void *)(v0 + 168);
  char v37 = *(void *)(v0 + 152);
  uint64_t v38 = (__int128 *)(v0 + 56);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SiriGeoSuggestion>);
  unint64_t v36 = type metadata accessor for SiriGeoSuggestion(0LL);
  uint64_t v2 = *(void *)(v36 - 8);
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  char v6 = swift_allocObject(v1, v5 + 3 * v3, v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_DE90;
  unint64_t v7 = v6 + v5;
  static SiriGeoSuggestion.ShareETA.getter((void *)(v6 + v5));
  char v8 = (uint64_t *)(v6 + v5 + v3);
  static SiriGeoSuggestion.PlayMusic.getter(v8);
  uint64_t v9 = (uint64_t *)(v6 + v5 + 2 * v3);
  static SiriGeoSuggestion.PlayNews.getter(v9);
  uint64_t v11 = *(void *)(v6 + v5);
  uint64_t v10 = *(void *)(v6 + v5 + 8);
  uint64_t v12 = *(void *)(v6 + v5 + 16);
  int64_t v13 = *(void *)(v6 + v5 + 24);
  swift_bridgeObjectRetain(v6);
  uint64_t v14 = swift_task_alloc(32LL);
  *(void *)(v14 + 16) = v7;
  unint64_t v15 = dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)( v11,  v10,  v12,  v13,  partial apply for closure #1 in closure #1 in static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:),  v14);
  swift_release(v15);
  swift_task_dealloc(v14);
  uint64_t v17 = *v8;
  char v16 = v8[1];
  unint64_t v18 = v8[2];
  char v19 = v8[3];
  uint64_t v20 = swift_task_alloc(32LL);
  *(void *)(v20 + 16) = v8;
  uint64_t v21 = dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)( v17,  v16,  v18,  v19,  partial apply for closure #1 in closure #1 in static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:),  v20);
  swift_release(v21);
  swift_task_dealloc(v20);
  uint64_t v23 = *v9;
  uint64_t v22 = v9[1];
  uint64_t v24 = v9[2];
  char v25 = v9[3];
  uint64_t v26 = swift_task_alloc(32LL);
  *(void *)(v26 + 16) = v9;
  unint64_t v27 = dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)( v23,  v22,  v24,  v25,  partial apply for closure #1 in closure #1 in static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:),  v26);
  swift_release(v27);
  swift_task_dealloc(v26);
  swift_bridgeObjectRelease(v6);
  swift_setDeallocating(v6);
  swift_arrayDestroy(v7, *(void *)(v6 + 16), v36);
  swift_deallocClassInstance(v6, 32LL, 7LL);
  outlined init with copy of SuggestionsSignals(v37, (uint64_t)v38);
  char v28 = type metadata accessor for SiriGeoSuggestionsGenerator();
  uint64_t v29 = swift_allocObject(v28, 56LL, 7LL);
  outlined init with take of SuggestionsSignals(v38, v29 + 16);
  *(void *)(v35 + 120) = v28;
  *(void *)(v35 + 128) = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( &lazy protocol witness table cache variable for type SiriGeoSuggestionsGenerator and conformance SiriGeoSuggestionsGenerator,  (uint64_t (*)(uint64_t))type metadata accessor for SiriGeoSuggestionsGenerator,  (uint64_t)&protocol conformance descriptor for SiriGeoSuggestionsGenerator);
  *(void *)(v35 + 96) = v29;
  swift_retain(v29);
  uint64_t v30 = dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)(v35 + 96);
  swift_release(v30);
  __swift_destroy_boxed_opaque_existential_1Tm((void *)(v35 + 96));
  double v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<OwnerDefinition>);
  unint64_t v32 = swift_allocObject(v31, 72LL, 7LL);
  *(_OWORD *)(v32 + 16) = xmmword_E040;
  dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
  swift_release(v29);
  swift_release(v34);
  return (*(uint64_t (**)(uint64_t))(v35 + 8))(v32);
}

uint64_t static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)( uint64_t a1)
{
  uint64_t v2 = (void *)(*(void *)v1 + 16LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 160LL);
  *(void *)(*(void *)v1 + 168LL) = a1;
  swift_task_dealloc(v3);
  __swift_destroy_boxed_opaque_existential_1Tm(v2);
  return swift_task_switch( static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:),  0LL,  0LL);
}

uint64_t closure #1 in closure #1 in static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)( uint64_t a1, void *a2)
{
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for IntentType(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v38 = (uint64_t *)((char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v9 = *(void *)(a1 + 40);
  __int128 v39 = *(_OWORD *)(a1 + 24);
  uint64_t v10 = v39;
  __swift_project_boxed_opaque_existential_1((void *)a1, v39);
  uint64_t v11 = a2[4];
  __int128 v43 = v39;
  uint64_t v44 = v9;
  __swift_allocate_boxed_opaque_existential_2(v41);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)(v11, v10, v9);
  uint64_t v12 = v44;
  __int128 v39 = v43;
  uint64_t v13 = v43;
  __swift_project_boxed_opaque_existential_1(v41, v43);
  uint64_t v14 = a2[5];
  __int128 v50 = v39;
  uint64_t v51 = v12;
  __swift_allocate_boxed_opaque_existential_2(v49);
  dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)(v14, v13, v12);
  uint64_t v15 = v51;
  __int128 v39 = v50;
  uint64_t v16 = v50;
  __swift_project_boxed_opaque_existential_1(v49, v50);
  __int128 v47 = v39;
  uint64_t v48 = v15;
  __swift_allocate_boxed_opaque_existential_2(v46);
  dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)(0xD000000000000055LL, 0x800000000000E570LL, v16, v15);
  __swift_destroy_boxed_opaque_existential_1Tm(v46);
  __swift_destroy_boxed_opaque_existential_1Tm(v49);
  __swift_destroy_boxed_opaque_existential_1Tm(v41);
  uint64_t v17 = type metadata accessor for SiriGeoSuggestion(0LL);
  outlined init with copy of IntentType?( (uint64_t)a2 + *(int *)(v17 + 44),  (uint64_t)v5,  &demangling cache variable for type metadata for IntentType?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6) == 1)
  {
    outlined destroy of IntentType?((uint64_t)v5, &demangling cache variable for type metadata for IntentType?);
  }

  else
  {
    uint64_t v18 = (uint64_t)v38;
    (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 32))(v38, v5, v6);
    uint64_t v19 = *(void *)(a1 + 40);
    __int128 v39 = *(_OWORD *)(a1 + 24);
    uint64_t v20 = v39;
    __swift_project_boxed_opaque_existential_1((void *)a1, v39);
    __int128 v43 = v39;
    uint64_t v44 = v19;
    __swift_allocate_boxed_opaque_existential_2(v41);
    dispatch thunk of SuggestionDetailsBuilder.intentIdentifier(_:)(v18, v20, v19);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v18, v6);
    __swift_destroy_boxed_opaque_existential_1Tm(v41);
  }

  uint64_t v21 = (void *)((char *)a2 + *(int *)(v17 + 48));
  uint64_t v22 = v21[1];
  if (v22)
  {
    uint64_t v23 = *v21;
    uint64_t v24 = *(void *)(a1 + 40);
    __int128 v39 = *(_OWORD *)(a1 + 24);
    uint64_t v25 = v39;
    __swift_project_boxed_opaque_existential_1((void *)a1, v39);
    __int128 v43 = v39;
    uint64_t v44 = v24;
    __swift_allocate_boxed_opaque_existential_2(v41);
    dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)(v23, v22, v25, v24);
    __swift_destroy_boxed_opaque_existential_1Tm(v41);
  }

  uint64_t v26 = a1;
  uint64_t result = a2[9];
  uint64_t v28 = *(void *)(result + 16);
  if (v28)
  {
    uint64_t v38 = &v42;
    uint64_t v29 = (void *)(result + 32);
    uint64_t v36 = result;
    swift_bridgeObjectRetain(result);
    uint64_t v37 = v26;
    do
    {
      outlined init with copy of SiriGeoSuggestion.Parameter(v29, (uint64_t)v41);
      outlined init with copy of Decodable & Encodable & Sendable(v37, (uint64_t)v49);
      uint64_t v30 = v51;
      __int128 v39 = v50;
      uint64_t v31 = v50;
      __swift_project_boxed_opaque_existential_1(v49, v50);
      uint64_t v32 = v41[0];
      uint64_t v33 = v41[1];
      outlined init with copy of IntentType?( (uint64_t)v38,  (uint64_t)v40,  &demangling cache variable for type metadata for Resolver?);
      uint64_t v34 = v45;
      swift_bridgeObjectRetain(v33);
      swift_retain(v34);
      outlined destroy of SiriGeoSuggestion.Parameter(v41);
      __int128 v47 = v39;
      uint64_t v48 = v30;
      __swift_allocate_boxed_opaque_existential_2(v46);
      SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v32, v33, v40, v34, v31, v30);
      swift_bridgeObjectRelease(v33);
      swift_release(v34);
      outlined destroy of IntentType?((uint64_t)v40, &demangling cache variable for type metadata for Resolver?);
      __swift_destroy_boxed_opaque_existential_1Tm(v46);
      __swift_destroy_boxed_opaque_existential_1Tm(v49);
      v29 += 8;
      --v28;
    }

    while (v28);
    return swift_bridgeObjectRelease(v36);
  }

  return result;
}

uint64_t partial apply for closure #1 in closure #1 in static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)( uint64_t a1)
{
  return closure #1 in closure #1 in static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)( a1,  *(void **)(v1 + 16));
}

uint64_t lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner( unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

void *__swift_allocate_boxed_opaque_existential_2(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t outlined init with copy of SiriGeoSuggestion.Parameter(void *a1, uint64_t a2)
{
  return a2;
}

void *outlined destroy of SiriGeoSuggestion.Parameter(void *a1)
{
  return a1;
}

uint64_t outlined destroy of IntentType?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t Dictionary<>.subscript.getter(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = SiriGeoSuggestion.ExecutionParameter.rawValue.getter(a1);
  uint64_t v7 = v6;
  v9[0] = v5;
  v9[1] = v6;
  Dictionary.subscript.getter(v9, a2, &type metadata for String, a3, &protocol witness table for String);
  return swift_bridgeObjectRelease(v7);
}

uint64_t SiriGeoSuggestion.ExecutionParameter.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_9B74
                                                                     + 4 * asc_E0D0[a1]))( 0xD000000000000010LL,  0x800000000000E300LL);
}

uint64_t sub_9B74(uint64_t a1)
{
  return a1 + 5;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SiriGeoSuggestion.ExecutionParameter( unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2 = *a2;
  uint64_t v3 = SiriGeoSuggestion.ExecutionParameter.rawValue.getter(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = SiriGeoSuggestion.ExecutionParameter.rawValue.getter(v2);
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

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SiriGeoSuggestion.ExecutionParameter()
{
  unsigned __int8 v1 = *v0;
  Hasher.init(_seed:)(v6, 0LL);
  uint64_t v2 = SiriGeoSuggestion.ExecutionParameter.rawValue.getter(v1);
  uint64_t v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SiriGeoSuggestion.ExecutionParameter( uint64_t a1)
{
  uint64_t v3 = SiriGeoSuggestion.ExecutionParameter.rawValue.getter(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SiriGeoSuggestion.ExecutionParameter( uint64_t a1)
{
  unsigned __int8 v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  uint64_t v3 = SiriGeoSuggestion.ExecutionParameter.rawValue.getter(v2);
  uint64_t v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance SiriGeoSuggestion.ExecutionParameter@<X0>( Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = specialized SiriGeoSuggestion.ExecutionParameter.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance SiriGeoSuggestion.ExecutionParameter@<X0>( uint64_t *a1@<X8>)
{
  uint64_t result = SiriGeoSuggestion.ExecutionParameter.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t specialized SiriGeoSuggestion.ExecutionParameter.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)( (Swift::OpaquePointer)&outlined read-only object #0 of SiriGeoSuggestion.ExecutionParameter.init(rawValue:),  v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 0xA) {
    return 10LL;
  }
  else {
    return v3;
  }
}

unint64_t lazy protocol witness table accessor for type SiriGeoSuggestion.ExecutionParameter and conformance SiriGeoSuggestion.ExecutionParameter()
{
  unint64_t result = lazy protocol witness table cache variable for type SiriGeoSuggestion.ExecutionParameter and conformance SiriGeoSuggestion.ExecutionParameter;
  if (!lazy protocol witness table cache variable for type SiriGeoSuggestion.ExecutionParameter and conformance SiriGeoSuggestion.ExecutionParameter)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for SiriGeoSuggestion.ExecutionParameter,  &type metadata for SiriGeoSuggestion.ExecutionParameter);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type SiriGeoSuggestion.ExecutionParameter and conformance SiriGeoSuggestion.ExecutionParameter);
  }

  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriGeoSuggestion.ExecutionParameter( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriGeoSuggestion.ExecutionParameter( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF6) {
    return ((uint64_t (*)(void))((char *)&loc_9F84 + 4 * byte_E0DF[v4]))();
  }
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_9FB8 + 4 * byte_E0DA[v4]))();
}

uint64_t sub_9FB8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_9FC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x9FC8LL);
  }
  return result;
}

uint64_t sub_9FD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x9FDCLL);
  }
  *(_BYTE *)unint64_t result = a2 + 9;
  return result;
}

uint64_t sub_9FE0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_9FE8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for SiriGeoSuggestion.ExecutionParameter(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for SiriGeoSuggestion.ExecutionParameter(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriGeoSuggestion.ExecutionParameter()
{
  return &type metadata for SiriGeoSuggestion.ExecutionParameter;
}

uint64_t static SiriGeoSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  return swift_task_switch( static SiriGeoSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:),  0LL,  0LL);
}

uint64_t static SiriGeoSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  v0[5] = &type metadata for StandardSuggestionSignals;
  v0[6] = &protocol witness table for StandardSuggestionSignals;
  __int16 v1 = (void *)swift_task_alloc(dword_14E14);
  v0[10] = v1;
  *__int16 v1 = v0;
  v1[1] = static SiriGeoSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:);
  return static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)( v0[7],  v0[8],  (uint64_t)(v0 + 2));
}

uint64_t static SiriGeoSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)( uint64_t a1)
{
  int v3 = (void *)(*v1 + 16);
  uint64_t v5 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 80));
  __swift_destroy_boxed_opaque_existential_1Tm(v3);
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(a1);
}

uint64_t SiriGeoSuggestionsPluginOwnerDefinitionFactory.deinit()
{
  return v0;
}

uint64_t SiriGeoSuggestionsPluginOwnerDefinitionFactory.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t SiriGeoSuggestionsPluginOwnerDefinitionFactory.__allocating_init()()
{
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for SiriGeoSuggestionsPluginOwnerDefinitionFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC18SiriGeoSuggestions46SiriGeoSuggestionsPluginOwnerDefinitionFactory);
}

ValueMetadata *type metadata accessor for StandardSuggestionSignals()
{
  return &type metadata for StandardSuggestionSignals;
}

uint64_t *SiriGeoSuggestionsConstants.t41Locales.unsafeMutableAddressor()
{
  if (one-time initialization token for t41Locales != -1) {
    swift_once(&one-time initialization token for t41Locales, one-time initialization function for t41Locales);
  }
  return &static SiriGeoSuggestionsConstants.t41Locales;
}

uint64_t *SiriGeoSuggestionsConstants.kCarPlayDevice.unsafeMutableAddressor()
{
  if (one-time initialization token for kCarPlayDevice != -1) {
    swift_once(&one-time initialization token for kCarPlayDevice, one-time initialization function for kCarPlayDevice);
  }
  return &static SiriGeoSuggestionsConstants.kCarPlayDevice;
}

uint64_t *SiriGeoSuggestionsConstants.kOwner.unsafeMutableAddressor()
{
  if (one-time initialization token for kOwner != -1) {
    swift_once(&one-time initialization token for kOwner, one-time initialization function for kOwner);
  }
  return &static SiriGeoSuggestionsConstants.kOwner;
}

void *SiriGeoSuggestionsConstants.kTemplateRootPath.unsafeMutableAddressor()
{
  return &static SiriGeoSuggestionsConstants.kTemplateRootPath;
}

uint64_t one-time initialization function for t41Locales()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
  uint64_t v1 = *(void *)(type metadata accessor for Locale(0LL) - 8);
  uint64_t v2 = swift_allocObject( v0,  ((*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
       + 41LL * *(void *)(v1 + 72),
         *(unsigned __int8 *)(v1 + 80) | 7LL);
  *(_OWORD *)(v2 + 16) = xmmword_E2A0;
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
  uint64_t result = Locale.init(identifier:)(0x594D2D736DLL, 0xE500000000000000LL);
  static SiriGeoSuggestionsConstants.t41Locales = v2;
  return result;
}

uint64_t static SiriGeoSuggestionsConstants.t41Locales.getter()
{
  return static SiriGeoSuggestionsConstants.t41Locales.getter( &one-time initialization token for t41Locales,  &static SiriGeoSuggestionsConstants.t41Locales);
}

uint64_t one-time initialization function for kAllDevices()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeviceType>);
  uint64_t v1 = type metadata accessor for DeviceType(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = swift_allocObject(v0, v5 + 8 * v3, v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_E2B0;
  uint64_t v7 = v6 + v5;
  int v8 = *(void (**)(uint64_t, void, uint64_t))(v2 + 104);
  v8(v7, enum case for DeviceType.iPhone(_:), v1);
  v8(v7 + v3, enum case for DeviceType.iPad(_:), v1);
  v8(v7 + 2 * v3, enum case for DeviceType.watch(_:), v1);
  v8(v7 + 3 * v3, enum case for DeviceType.pod(_:), v1);
  v8(v7 + 4 * v3, enum case for DeviceType.mac(_:), v1);
  v8(v7 + 5 * v3, enum case for DeviceType.homepod(_:), v1);
  v8(v7 + 6 * v3, enum case for DeviceType.appleTV(_:), v1);
  uint64_t result = ((uint64_t (*)(uint64_t, void, uint64_t))v8)(v7 + 7 * v3, enum case for DeviceType.carPlay(_:), v1);
  static SiriGeoSuggestionsConstants.kAllDevices = v6;
  return result;
}

uint64_t *SiriGeoSuggestionsConstants.kAllDevices.unsafeMutableAddressor()
{
  if (one-time initialization token for kAllDevices != -1) {
    swift_once(&one-time initialization token for kAllDevices, one-time initialization function for kAllDevices);
  }
  return &static SiriGeoSuggestionsConstants.kAllDevices;
}

uint64_t static SiriGeoSuggestionsConstants.kAllDevices.getter()
{
  return static SiriGeoSuggestionsConstants.t41Locales.getter( &one-time initialization token for kAllDevices,  &static SiriGeoSuggestionsConstants.kAllDevices);
}

uint64_t one-time initialization function for kCarPlayDevice()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeviceType>);
  uint64_t v1 = type metadata accessor for DeviceType(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = swift_allocObject(v0, v4 + *(void *)(v2 + 72), v3 | 7);
  *(_OWORD *)(v5 + 16) = xmmword_E040;
  uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(v2 + 104))( v5 + v4,  enum case for DeviceType.carPlay(_:),  v1);
  static SiriGeoSuggestionsConstants.kCarPlayDevice = v5;
  return result;
}

uint64_t static SiriGeoSuggestionsConstants.kCarPlayDevice.getter()
{
  return static SiriGeoSuggestionsConstants.t41Locales.getter( &one-time initialization token for kCarPlayDevice,  &static SiriGeoSuggestionsConstants.kCarPlayDevice);
}

uint64_t static SiriGeoSuggestionsConstants.t41Locales.getter(void *a1, void *a2)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  return swift_bridgeObjectRetain(*a2);
}

uint64_t one-time initialization function for kOwner()
{
  uint64_t v0 = type metadata accessor for DomainOwner(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  uint64_t result = DomainOwner.init(_:)(0x6F654769726953LL, 0xE700000000000000LL);
  static SiriGeoSuggestionsConstants.kOwner = result;
  return result;
}

uint64_t static SiriGeoSuggestionsConstants.kOwner.getter()
{
  if (one-time initialization token for kOwner != -1) {
    swift_once(&one-time initialization token for kOwner, one-time initialization function for kOwner);
  }
  return swift_retain(static SiriGeoSuggestionsConstants.kOwner);
}

unint64_t static SiriGeoSuggestionsConstants.kTemplateRootPath.getter()
{
  return 0xD000000000000055LL;
}

ValueMetadata *type metadata accessor for SiriGeoSuggestionsConstants()
{
  return &type metadata for SiriGeoSuggestionsConstants;
}

uint64_t static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[23] = a4;
  _BYTE v5[24] = a5;
  v5[21] = a1;
  v5[22] = a2;
  return swift_task_switch(static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:), 0LL, 0LL);
}

uint64_t static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:)()
{
  if (one-time initialization token for navigateVerb != -1) {
    swift_once(&one-time initialization token for navigateVerb, one-time initialization function for navigateVerb);
  }
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v1 = *(void *)(v0 + 176);
  swift_beginAccess(&static SiriGeoSuggestion.navigateVerb, v0 + 112, 0LL, 0LL);
  BOOL v3 = static SiriGeoSuggestion.navigateVerb == v2 && qword_15310 == v1;
  if (!v3
    && (_stringCompareWithSmolCheck(_:_:expecting:)( *(void *)(v0 + 168),  *(void *)(v0 + 176),  static SiriGeoSuggestion.navigateVerb,  qword_15310,  0LL) & 1) == 0)
  {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }

  uint64_t v4 = **(void **)(v0 + 184);
  if (!*(void *)(v4 + 16)) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  unint64_t v5 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010LL, 0x800000000000E300LL);
  if ((v6 & 1) == 0) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v4 + 56) + 48 * v5, v0 + 16);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
  if ((swift_dynamicCast(v0 + 136, v0 + 16, v7, &type metadata for String, 6LL) & 1) == 0) {
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }
  int v8 = *(uint64_t **)(v0 + 184);
  uint64_t v9 = *(void *)(v0 + 144);
  *(void *)(v0 + 200) = *(void *)(v0 + 136);
  *(void *)(v0 + 208) = v9;
  uint64_t v10 = *v8;
  if (!*(void *)(*v8 + 16)
    || (unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010LL, 0x800000000000E340LL), (v12 & 1) == 0)
    || (outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v10 + 56) + 48 * v11, v0 + 64),
        (swift_dynamicCast(v0 + 152, v0 + 64, v7, &type metadata for String, 6LL) & 1) == 0))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(SALocalSearchMapItemMapItemTypeCURRENT_LOCATIONValue);
    uint64_t v17 = v18;
    goto LABEL_19;
  }

  uint64_t v14 = *(void *)(v0 + 152);
  uint64_t v13 = *(void *)(v0 + 160);
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(SALocalSearchMapItemMapItemTypeCURRENT_LOCATIONValue);
  uint64_t v17 = v16;
  if (!v13)
  {
LABEL_19:
    swift_bridgeObjectRelease(v17);
LABEL_20:
    swift_bridgeObjectRelease(v9);
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }

  if (v14 != v15 || v13 != v16)
  {
    char v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v13, v15, v16, 0LL);
    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease(v13);
    if ((v20 & 1) != 0) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }

  swift_bridgeObjectRelease_n(v13, 2LL);
LABEL_23:
  uint64_t v21 = *(void **)(v0 + 192);
  uint64_t v22 = v21[3];
  uint64_t v23 = v21[4];
  __swift_project_boxed_opaque_existential_1(v21, v22);
  uint64_t v24 = *(int **)(v23 + 8);
  uint64_t v26 = (uint64_t (*)(uint64_t, uint64_t))((char *)v24 + *v24);
  uint64_t v25 = (void *)swift_task_alloc(v24[1]);
  *(void *)(v0 + 216) = v25;
  *uint64_t v25 = v0;
  v25[1] = static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:);
  return v26(v22, v23);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  void *v5;
  uint64_t (*v7)(uint64_t, uint64_t);
  if (*(_BYTE *)(v0 + 248) == 1)
  {
    uint64_t v1 = *(void **)(v0 + 192);
    uint64_t v2 = v1[3];
    BOOL v3 = v1[4];
    __swift_project_boxed_opaque_existential_1(v1, v2);
    uint64_t v4 = *(int **)(v3 + 32);
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
    unint64_t v5 = (void *)swift_task_alloc(v4[1]);
    *(void *)(v0 + 224) = v5;
    *unint64_t v5 = v0;
    v5[1] = static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:);
    return v7(v2, v3);
  }

  else
  {
    swift_bridgeObjectRelease(*(void *)(v0 + 208));
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  void *v5;
  uint64_t (*v7)(uint64_t, uint64_t);
  if (*(_BYTE *)(v0 + 249) == 1)
  {
    uint64_t v1 = *(void **)(v0 + 192);
    uint64_t v2 = v1[3];
    BOOL v3 = v1[4];
    __swift_project_boxed_opaque_existential_1(v1, v2);
    uint64_t v4 = *(int **)(v3 + 16);
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
    unint64_t v5 = (void *)swift_task_alloc(v4[1]);
    *(void *)(v0 + 232) = v5;
    *unint64_t v5 = v0;
    v5[1] = static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:);
    return v7(v2, v3);
  }

  else
  {
    swift_bridgeObjectRelease(*(void *)(v0 + 208));
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  void *v5;
  uint64_t (*v7)(uint64_t, uint64_t);
  if (*(_BYTE *)(v0 + 250) == 1)
  {
    uint64_t v1 = *(void **)(v0 + 192);
    uint64_t v2 = v1[3];
    BOOL v3 = v1[4];
    __swift_project_boxed_opaque_existential_1(v1, v2);
    uint64_t v4 = *(int **)(v3 + 48);
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
    unint64_t v5 = (void *)swift_task_alloc(v4[1]);
    *(void *)(v0 + 240) = v5;
    *unint64_t v5 = v0;
    v5[1] = static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:);
    return v7(v2, v3);
  }

  else
  {
    swift_bridgeObjectRelease(*(void *)(v0 + 208));
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v1 = *(void *)(v0 + 208);
  if (*(_BYTE *)(v0 + 251) == 1)
  {
    uint64_t v2 = *(void **)(v0 + 192);
    BOOL v3 = *(void *)(v0 + 200);
    uint64_t v4 = v2[3];
    unint64_t v5 = v2[4];
    __swift_project_boxed_opaque_existential_1(v2, v4);
    char v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 72))(v3, v1, v4, v5);
  }

  else
  {
    char v6 = 0;
  }

  swift_bridgeObjectRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))(v6 & 1);
}

uint64_t static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:)(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 216LL);
  *(_BYTE *)(*(void *)v1 + 248LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:), 0LL, 0LL);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v2 = *(void *)(*(void *)v1 + 224LL);
  *(_BYTE *)(*(void *)v1 + 249LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:), 0LL, 0LL);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v2 = *(void *)(*(void *)v1 + 232LL);
  *(_BYTE *)(*(void *)v1 + 250LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:), 0LL, 0LL);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v2 = *(void *)(*(void *)v1 + 240LL);
  *(_BYTE *)(*(void *)v1 + 251LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:), 0LL, 0LL);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v5);
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

uint64_t SuggestionsLog.unsafeMutableAddressor()
{
  if (one-time initialization token for SuggestionsLog != -1) {
    swift_once(&one-time initialization token for SuggestionsLog, one-time initialization function for SuggestionsLog);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return __swift_project_value_buffer(v0, (uint64_t)SuggestionsLog);
}

uint64_t one-time initialization function for SuggestionsLog()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  __swift_allocate_value_buffer(v0, SuggestionsLog);
  __swift_project_value_buffer(v0, (uint64_t)SuggestionsLog);
  return Logger.init(subsystem:category:)( 0xD000000000000016LL,  0x800000000000E620LL,  0xD000000000000012LL,  0x800000000000E640LL);
}

uint64_t protocol witness for SuggestionsSignals.isNotRegularSiriMusicUser.getter in conformance StandardSuggestionSignals()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = protocol witness for SuggestionsSignals.isNotRegularSiriMusicUser.getter in conformance StandardSuggestionSignals;
  return withCheckedContinuation<A>(isolation:function:_:)( v0 + 24,  0LL,  0LL,  0xD000000000000019LL,  0x800000000000E3A0LL,  closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter,  0LL,  &type metadata for Bool);
}

{
  uint64_t v0;
  swift_task_dealloc(*(void *)(*(void *)v0 + 16LL));
  return swift_task_switch( protocol witness for SuggestionsSignals.isNotRegularSiriMusicUser.getter in conformance StandardSuggestionSignals,  0LL,  0LL);
}

uint64_t StandardSuggestionSignals.isNotRegularSiriMusicUser.getter()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = StandardSuggestionSignals.isNotRegularSiriMusicUser.getter;
  return withCheckedContinuation<A>(isolation:function:_:)( v0 + 24,  0LL,  0LL,  0xD000000000000019LL,  0x800000000000E3A0LL,  closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter,  0LL,  &type metadata for Bool);
}

{
  uint64_t v0;
  swift_task_dealloc(*(void *)(*(void *)v0 + 16LL));
  return swift_task_switch(StandardSuggestionSignals.isNotRegularSiriMusicUser.getter, 0LL, 0LL);
}

{
  uint64_t v0;
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 24));
}

uint64_t StandardSuggestionSignals.isRegularMusicListener.getter()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = protocol witness for SuggestionsSignals.isNotRegularSiriMusicUser.getter in conformance StandardSuggestionSignals;
  return withCheckedContinuation<A>(isolation:function:_:)( v0 + 24,  0LL,  0LL,  0xD000000000000016LL,  0x800000000000E660LL,  closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter,  0LL,  &type metadata for Bool);
}

uint64_t protocol witness for SuggestionsSignals.isAppleMusicSubscriber.getter in conformance StandardSuggestionSignals()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&async function pointer to specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter
                             + async function pointer to specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter);
  uint64_t v1 = (void *)swift_task_alloc(unk_14F1C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = protocol witness for SuggestionsSignals.isAppleMusicSubscriber.getter in conformance StandardSuggestionSignals;
  return v3();
}

uint64_t StandardSuggestionSignals.isAppleMusicSubscriber.getter()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&async function pointer to specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter
                             + async function pointer to specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter);
  uint64_t v1 = (void *)swift_task_alloc(unk_14F1C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = protocol witness for InternalGenerator.generateCandidateSuggestions(interaction:environment:factory:) in conformance SiriGeoSuggestionsGenerator;
  return v3();
}

uint64_t StandardSuggestionSignals.isNotListeningToMusic.getter()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = protocol witness for SuggestionsSignals.isNotRegularSiriMusicUser.getter in conformance StandardSuggestionSignals;
  return withCheckedContinuation<A>(isolation:function:_:)( v0 + 24,  0LL,  0LL,  0xD000000000000015LL,  0x800000000000E680LL,  closure #1 in StandardSuggestionSignals.isNotListeningToMusic.getter,  0LL,  &type metadata for Bool);
}

void closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin();
  uint64_t v5 = (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v10 = [(id)objc_opt_self(BMStreams) intent];
  uint64_t v11 = static Date.distantPast.getter();
  double v12 = Date.timeIntervalSinceReferenceDate.getter(v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v13 = [v10 publisherFromStartTime:v12];

  uint64_t v14 = swift_allocObject(&unk_10BA0, 17LL, 7LL);
  *(_BYTE *)(v14 + 16) = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v15 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v16 = (v15 + 16) & ~v15;
  unint64_t v17 = (v4 + v16 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v18 = swift_allocObject(&unk_10C40, v17 + 8, v15 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v18 + v16, v5, v2);
  *(void *)(v18 + v17) = v14;
  uint64_t v28 = partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter;
  uint64_t v29 = v18;
  aBlock = _NSConcreteStackBlock;
  uint64_t v25 = 1107296256LL;
  uint64_t v26 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
  unint64_t v27 = &block_descriptor_28;
  uint64_t v19 = _Block_copy(&aBlock);
  uint64_t v20 = v29;
  swift_retain(v14);
  swift_release(v20);
  uint64_t v28 = partial apply for closure #2 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter;
  uint64_t v29 = v14;
  aBlock = _NSConcreteStackBlock;
  uint64_t v25 = 1107296256LL;
  uint64_t v26 = (void (*)(uint64_t, void *))thunk for @escaping @callee_guaranteed (@guaranteed BMStoreEvent<BMIntentEvent>) -> (@unowned Bool);
  unint64_t v27 = &block_descriptor_31;
  uint64_t v21 = _Block_copy(&aBlock);
  uint64_t v22 = v29;
  swift_retain(v14);
  swift_release(v22);
  id v23 = [v13 sinkWithCompletion:v19 shouldContinue:v21];
  _Block_release(v21);
  _Block_release(v19);

  swift_release(v14);
}

uint64_t closure #1 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter( uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6 = (*(_BYTE *)(a3 + 16) & 1) == 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  return CheckedContinuation.resume(returning:)(&v6, v4);
}

void thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ()(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

uint64_t closure #2 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter( void *a1, uint64_t a2)
{
  id v3 = [a1 eventBody];
  if (v3)
  {
    uint64_t v4 = v3;
    if (([v3 donatedBySiri] & 1) != 0
      && (id v5 = [v4 intentClass]) != 0)
    {
      BOOL v6 = v5;
      uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v9 = v8;

      if (v7 == 0xD000000000000011LL && v9 == 0x800000000000E9D0LL)
      {
        swift_bridgeObjectRelease(0x800000000000E9D0LL);

LABEL_11:
        double v12 = (_BYTE *)(a2 + 16);
        swift_beginAccess(v12, v13, 1LL, 0LL);
        uint64_t result = 0LL;
        *double v12 = 1;
        return result;
      }

      char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, 0xD000000000000011LL, 0x800000000000E9D0LL, 0LL);
      swift_bridgeObjectRelease(v9);

      if ((v11 & 1) != 0) {
        goto LABEL_11;
      }
    }

    else
    {
    }
  }

  return 1LL;
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned ICMusicSubscriptionStatus?, @unowned NSError?) -> () with result type ICMusicSubscriptionStatus( uint64_t result, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (a3)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    *uint64_t v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else if (a2)
  {
    **(void **)(*(void *)(v3 + 64) + 40LL) = a2;
    id v9 = a2;
    return swift_continuation_throwingResume(v3);
  }

  else
  {
    __break(1u);
  }

  return result;
}

void closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin();
  uint64_t v5 = (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  id v9 = (char *)&aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v10 = [(id)objc_opt_self(BMStreams) appLaunch];
  uint64_t v11 = static Date.distantPast.getter();
  double v12 = Date.timeIntervalSinceReferenceDate.getter(v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v13 = [v10 publisherFromStartTime:v12];

  uint64_t v14 = swift_allocObject(&unk_10BA0, 17LL, 7LL);
  *(_BYTE *)(v14 + 16) = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v15 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v16 = (v15 + 16) & ~v15;
  unint64_t v17 = (v4 + v16 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v18 = swift_allocObject(&unk_10BC8, v17 + 8, v15 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v18 + v16, v5, v2);
  *(void *)(v18 + v17) = v14;
  uint64_t v28 = partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter;
  uint64_t v29 = v18;
  aBlock = _NSConcreteStackBlock;
  uint64_t v25 = 1107296256LL;
  uint64_t v26 = thunk for @escaping @callee_guaranteed (@guaranteed BPSCompletion) -> ();
  unint64_t v27 = &block_descriptor_18;
  uint64_t v19 = _Block_copy(&aBlock);
  uint64_t v20 = v29;
  swift_retain(v14);
  swift_release(v20);
  uint64_t v28 = partial apply for closure #2 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter;
  uint64_t v29 = v14;
  aBlock = _NSConcreteStackBlock;
  uint64_t v25 = 1107296256LL;
  uint64_t v26 = (void (*)(uint64_t, void *))thunk for @escaping @callee_guaranteed (@guaranteed BMStoreEvent<BMIntentEvent>) -> (@unowned Bool);
  unint64_t v27 = &block_descriptor_21;
  uint64_t v21 = _Block_copy(&aBlock);
  uint64_t v22 = v29;
  swift_retain(v14);
  swift_release(v22);
  id v23 = [v13 sinkWithCompletion:v19 shouldContinue:v21];
  _Block_release(v21);
  _Block_release(v19);

  swift_release(v14);
}

uint64_t closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter( uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(_BYTE *)(a3 + 16);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  return CheckedContinuation.resume(returning:)(&v6, v4);
}

uint64_t closure #2 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter( void *a1, uint64_t a2)
{
  id v3 = [a1 eventBody];
  if (v3)
  {
    uint64_t v4 = v3;
    if ([v3 launchType] != (char *)&dword_0 + 1)
    {

      return 1LL;
    }

    id v5 = [v4 bundleID];
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;

    if (v6 == 0x6C7070612E6D6F63LL && v8 == 0xEF636973754D2E65LL) {
      goto LABEL_16;
    }
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v8, 0x6C7070612E6D6F63LL, 0xEF636973754D2E65LL, 0LL);
    swift_bridgeObjectRelease(v8);
    if ((v10 & 1) != 0)
    {
LABEL_8:

LABEL_18:
      uint64_t v22 = (_BYTE *)(a2 + 16);
      swift_beginAccess(v22, v39, 1LL, 0LL);
      uint64_t result = 0LL;
      *uint64_t v22 = 1;
      return result;
    }

    id v12 = [v4 bundleID];
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = v14;

    if (v13 == 0xD000000000000012LL)
    {
      unint64_t v16 = 0x800000000000E940LL;
      if (v15 == 0x800000000000E940LL) {
        goto LABEL_12;
      }
    }

    char v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, 0xD000000000000012LL, 0x800000000000E940LL, 0LL);
    swift_bridgeObjectRelease(v15);
    if ((v18 & 1) != 0) {
      goto LABEL_8;
    }
    id v19 = [v4 bundleID];
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v21;

    if (v20 == 0x646E61702E6D6F63LL && v8 == 0xEB0000000061726FLL)
    {
LABEL_16:

      unint64_t v17 = v8;
      goto LABEL_17;
    }

    char v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v8, 0x646E61702E6D6F63LL, 0xEB0000000061726FLL, 0LL);
    swift_bridgeObjectRelease(v8);
    if ((v23 & 1) != 0) {
      goto LABEL_8;
    }
    id v24 = [v4 bundleID];
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v27 = v26;

    if (v25 == 0xD000000000000020LL)
    {
      unint64_t v16 = 0x800000000000E960LL;
      if (v27 == 0x800000000000E960LL) {
        goto LABEL_12;
      }
    }

    char v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v27, 0xD000000000000020LL, 0x800000000000E960LL, 0LL);
    swift_bridgeObjectRelease(v27);
    if ((v28 & 1) != 0) {
      goto LABEL_8;
    }
    id v29 = [v4 bundleID];
    uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v32 = v31;

    if (v30 == 0xD000000000000010LL)
    {
      unint64_t v16 = 0x800000000000E990LL;
      if (v32 == 0x800000000000E990LL)
      {
LABEL_12:

        unint64_t v17 = v16;
LABEL_17:
        swift_bridgeObjectRelease(v17);
        goto LABEL_18;
      }
    }

    char v33 = _stringCompareWithSmolCheck(_:_:expecting:)(v30, v32, 0xD000000000000010LL, 0x800000000000E990LL, 0LL);
    swift_bridgeObjectRelease(v32);
    if ((v33 & 1) != 0) {
      goto LABEL_8;
    }
    id v34 = [v4 bundleID];
    uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v37 = v36;

    if (v35 == 0xD00000000000001BLL && v37 == 0x800000000000E9B0LL)
    {
      swift_bridgeObjectRelease(0x800000000000E9B0LL);
      goto LABEL_8;
    }

    char v38 = _stringCompareWithSmolCheck(_:_:expecting:)(v35, v37, 0xD00000000000001BLL, 0x800000000000E9B0LL, 0LL);
    swift_bridgeObjectRelease(v37);

    if ((v38 & 1) != 0) {
      goto LABEL_18;
    }
  }

  return 1LL;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed BMStoreEvent<BMIntentEvent>) -> (@unowned Bool)( uint64_t a1, void *a2)
{
  uint64_t v4 = *(uint64_t (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  LOBYTE(v4) = v4();
  swift_release(v3);

  return v4 & 1;
}

void closure #1 in StandardSuggestionSignals.isNotListeningToMusic.getter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin();
  id v5 = [(id)objc_opt_self(SOMediaNowPlayingObserver) defaultObserver];
  if (v5)
  {
    uint64_t v6 = v5;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))( (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v2);
    uint64_t v7 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v8 = (v7 + 16) & ~v7;
    uint64_t v9 = swift_allocObject(&unk_10B38, v8 + v4, v7 | 7);
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))( v9 + v8,  (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v2);
    aBlock[4] = partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isNotListeningToMusic.getter;
    uint64_t v12 = v9;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned AFMediaPlaybackState) -> ();
    aBlock[3] = &block_descriptor;
    char v10 = _Block_copy(aBlock);
    swift_release(v12);
    [v6 getPlaybackStateWithCompletion:v10];
    _Block_release(v10);
  }

  else
  {
    __break(1u);
  }

uint64_t thunk for @escaping @callee_guaranteed (@unowned AFMediaPlaybackState) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

uint64_t closure #1 in osLogInternal(_:log:type:)( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  uint64_t v10 = *a1;
  uint64_t v11 = *a1 + 8;
  uint64_t v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)( uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
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
    ObjectType = &type metadata for _StringGuts;
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
      id v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v4, 0LL);
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
  id v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
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

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  _BYTE *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t specialized StandardSuggestionSignals.isNotUsingVoiceGuidance.getter()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithSuiteName:v1];

  if (!v2) {
    return 2LL;
  }
  id v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = (char *)[v3 integerForKey:v4];

  return v5 != (_BYTE *)&dword_0 + 2;
}

uint64_t specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter()
{
  return swift_task_switch(specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter, 0LL, 0LL);
}

{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  NSString v1 = v0 + 2;
  id v2 = [(id)objc_opt_self(ICMusicSubscriptionStatusController) sharedStatusController];
  v0[20] = v2;
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter;
  id v3 = swift_continuation_init(v0 + 2, 1LL);
  v0[10] = _NSConcreteStackBlock;
  NSString v4 = v0 + 10;
  v4[1] = 0x40000000LL;
  v4[2] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned ICMusicSubscriptionStatus?, @unowned NSError?) -> () with result type ICMusicSubscriptionStatus;
  v4[3] = &block_descriptor_9;
  v4[4] = v3;
  [v2 getSubscriptionStatusWithCompletionHandler:v4];
  return swift_continuation_await(v1);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  NSString v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 168LL) = v1;
  if (v1) {
    id v2 = specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter;
  }
  else {
    id v2 = specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  char *v3;
  NSString v1 = *(void **)(v0 + 160);
  id v2 = *(void **)(v0 + 144);
  id v3 = (char *)[v2 statusType];

  return (*(uint64_t (**)(BOOL))(v0 + 8))(v3 == (_BYTE *)&dword_0 + 1);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_s *v5;
  os_log_type_t v6;
  BOOL v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  NSString v1 = *(void **)(v0 + 160);
  swift_willThrow();

  if (one-time initialization token for SuggestionsLog != -1) {
    swift_once(&one-time initialization token for SuggestionsLog, one-time initialization function for SuggestionsLog);
  }
  id v2 = *(void *)(v0 + 168);
  id v3 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v3, (uint64_t)SuggestionsLog);
  swift_errorRetain(v2);
  NSString v4 = swift_errorRetain(v2);
  id v5 = (os_log_s *)Logger.logObject.getter(v4);
  unint64_t v6 = static os_log_type_t.info.getter();
  int64_t v7 = os_log_type_enabled(v5, v6);
  int64_t v8 = *(void *)(v0 + 168);
  if (v7)
  {
    int64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v10 = swift_slowAlloc(32LL, -1LL);
    uint64_t v15 = v10;
    *(_DWORD *)int64_t v9 = 136315138;
    swift_getErrorValue(v8, v0 + 152, v0 + 120);
    uint64_t v11 = Error.localizedDescription.getter(*(void *)(v0 + 128), *(void *)(v0 + 136));
    uint64_t v13 = v12;
    *(void *)(v0 + 80) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v13);
    swift_errorRelease(v8);
    swift_errorRelease(v8);
    _os_log_impl(&dword_0, v5, v6, "Failed to retreive Apple Music Subscription with error: %s", v9, 0xCu);
    swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);

    swift_errorRelease(v8);
  }

  else
  {
    swift_errorRelease(*(void *)(v0 + 168));
    swift_errorRelease(v8);
    swift_errorRelease(v8);
  }

  return (*(uint64_t (**)(void))(v0 + 8))(0LL);
}

void *specialized Sequence.first(where:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a3;
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  for (; v4; uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v17))
  {
    uint64_t v5 = 4LL;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001LL) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5 - 4, a1)
         : *(id *)(a1 + 8 * v5);
      int64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1LL)) {
        break;
      }
      id v9 = [v6 label];
      if (v9)
      {
        uint64_t v10 = v9;
        id v11 = [(id)objc_opt_self(CNLabeledValue) localizedStringForLabel:v9];

        uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
        uint64_t v14 = v13;

        v20[2] = v12;
        v20[3] = v14;
        v20[0] = a2;
        v20[1] = v21;
        unint64_t v15 = lazy protocol witness table accessor for type String and conformance String();
        uint64_t v16 = StringProtocol.caseInsensitiveCompare<A>(_:)( v20,  &type metadata for String,  &type metadata for String,  v15,  v15);
        swift_bridgeObjectRelease(v14);
        if (!v16)
        {
          swift_bridgeObjectRelease(a1);
          return v7;
        }
      }

      ++v5;
      if (v8 == v4) {
        goto LABEL_18;
      }
    }

    __break(1u);
LABEL_14:
    if (a1 < 0) {
      uint64_t v17 = a1;
    }
    else {
      uint64_t v17 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
  }

LABEL_18:
  swift_bridgeObjectRelease(a1);
  return 0LL;
}

uint64_t specialized StandardSuggestionSignals.isMeAddress(label:)(uint64_t a1, uint64_t a2)
{
  id v4 = [objc_allocWithZone(CNContactStore) init];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v6 = swift_allocObject(v5, 40LL, 7LL);
  *(_OWORD *)(v6 + 16) = xmmword_DE60;
  *(void *)(v6 + 32) = CNContactPostalAddressesKey;
  id v31 = (id)v6;
  specialized Array._endMutation()(v6);
  int64_t v7 = CNContactPostalAddressesKey;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNKeyDescriptor);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v31);
  id v31 = 0LL;
  id v9 = [v4 _crossPlatformUnifiedMeContactWithKeysToFetch:isa error:&v31];

  id v10 = v31;
  if (v9)
  {
    id v11 = v31;
    id v12 = [v9 postalAddresses];
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CNLabeledValue);
    uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, v13);

    swift_bridgeObjectRetain(a2);
    unint64_t v15 = specialized Sequence.first(where:)(v14, a1, a2);
    swift_bridgeObjectRelease(v14);

    swift_bridgeObjectRelease(a2);
    if (v15)
    {

      return 1LL;
    }
  }

  else
  {
    id v17 = v31;
    uint64_t v18 = _convertNSErrorToError(_:)(v10);

    swift_willThrow();
    if (one-time initialization token for SuggestionsLog != -1) {
      swift_once(&one-time initialization token for SuggestionsLog, one-time initialization function for SuggestionsLog);
    }
    uint64_t v19 = type metadata accessor for Logger(0LL);
    __swift_project_value_buffer(v19, (uint64_t)SuggestionsLog);
    swift_errorRetain(v18);
    uint64_t v20 = swift_errorRetain(v18);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      char v23 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      id v24 = (void *)swift_slowAlloc(32LL, -1LL);
      id v31 = v24;
      *(_DWORD *)char v23 = 136315138;
      swift_getErrorValue(v18, v30, v29);
      uint64_t v25 = Error.localizedDescription.getter(v29[1], v29[2]);
      unint64_t v27 = v26;
      uint64_t v28 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v26, (uint64_t *)&v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, v29, v23 + 4, v23 + 12);
      swift_bridgeObjectRelease(v27);
      swift_errorRelease(v18);
      swift_errorRelease(v18);
      _os_log_impl(&dword_0, v21, v22, "error retrieving me contact: %s", v23, 0xCu);
      swift_arrayDestroy(v24, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1LL, -1LL);
      swift_slowDealloc(v23, -1LL, -1LL);

      swift_errorRelease(v18);
    }

    else
    {
      swift_errorRelease(v18);
      swift_errorRelease(v18);
      swift_errorRelease(v18);
    }
  }

  return 0LL;
}

uint64_t sub_D514()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isNotListeningToMusic.getter( uint64_t a1)
{
  BOOL v3 = a1 != 4 && a1 != 1;
  BOOL v6 = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  return CheckedContinuation.resume(returning:)(&v6, v4);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_D604()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter( uint64_t a1)
{
  return partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter( a1,  (uint64_t (*)(uint64_t, unint64_t, void))closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter);
}

uint64_t partial apply for closure #2 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter( void *a1)
{
  return closure #2 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter(a1, v1);
}

uint64_t objectdestroy_14Tm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter( uint64_t a1)
{
  return partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter( a1,  (uint64_t (*)(uint64_t, unint64_t, void))closure #1 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter);
}

uint64_t partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter( uint64_t a1, uint64_t (*a2)(uint64_t, unint64_t, void))
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>)
                 - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  return a2(a1, v2 + v5, *(void *)(v2 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t partial apply for closure #2 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter( void *a1)
{
  return closure #2 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter(a1, v1);
}
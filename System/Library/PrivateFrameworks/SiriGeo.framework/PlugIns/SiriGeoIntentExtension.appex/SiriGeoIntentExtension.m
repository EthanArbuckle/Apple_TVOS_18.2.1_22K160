id one-time initialization function for deleteParkingLocationHandler(uint64_t a1)
{
  return one-time initialization function for deleteParkingLocationHandler( a1,  (uint64_t (*)(void))&type metadata accessor for INDeleteParkingLocationIntentHandler,  &static IntentHandler.deleteParkingLocationHandler);
}

id one-time initialization function for retrieveParkingLocationHandler(uint64_t a1)
{
  return one-time initialization function for deleteParkingLocationHandler( a1,  (uint64_t (*)(void))&type metadata accessor for INRetrieveParkingLocationIntentHandler,  &static IntentHandler.retrieveParkingLocationHandler);
}

id one-time initialization function for saveParkingLocationHandler(uint64_t a1)
{
  return one-time initialization function for deleteParkingLocationHandler( a1,  (uint64_t (*)(void))&type metadata accessor for INSaveParkingLocationIntentHandler,  &static IntentHandler.saveParkingLocationHandler);
}

id one-time initialization function for shareETAHandler(uint64_t a1)
{
  return one-time initialization function for deleteParkingLocationHandler( a1,  (uint64_t (*)(void))&type metadata accessor for INShareETAIntentHandler,  &static IntentHandler.shareETAHandler);
}

id one-time initialization function for stopShareETAHandler(uint64_t a1)
{
  return one-time initialization function for deleteParkingLocationHandler( a1,  (uint64_t (*)(void))&type metadata accessor for INStopShareETAIntentHandler,  &static IntentHandler.stopShareETAHandler);
}

id one-time initialization function for deleteParkingLocationHandler( uint64_t a1, uint64_t (*a2)(void), void *a3)
{
  id result = [objc_allocWithZone((Class)a2(0)) init];
  *a3 = result;
  return result;
}

uint64_t variable initialization expression of IntentHandler.logObject()
{
  return OS_os_log.init(subsystem:category:)( 0xD000000000000016LL,  0x80000001000078E0LL,  0xD000000000000016LL,  0x8000000100007670LL);
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

id IntentHandler.logObject.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC22SiriGeoIntentExtension13IntentHandler_logObject);
}

id IntentHandler.handler(for:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  v4 = *(os_log_s **)(v2 + OBJC_IVAR____TtC22SiriGeoIntentExtension13IntentHandler_logObject);
  id v5 = a1;
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v6))
  {
    v24 = a2;
    v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v8 = swift_slowAlloc(32LL, -1LL);
    uint64_t v26 = v8;
    *(_DWORD *)v7 = 136315138;
    id v9 = v5;
    id v10 = [v9 description];
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v13 = v12;

    uint64_t v14 = v11;
    a2 = v24;
    uint64_t v25 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v13, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v7 + 4, v7 + 12);

    swift_bridgeObjectRelease(v13);
    _os_log_impl((void *)&_mh_execute_header, v4, v6, "IntentHandler intent : %s", v7, 0xCu);
    swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {
  }

  uint64_t v15 = objc_opt_self(&OBJC_CLASS___INSaveParkingLocationIntent);
  if (swift_dynamicCastObjCClass(v5, v15))
  {
    if (one-time initialization token for saveParkingLocationHandler != -1) {
      swift_once( &one-time initialization token for saveParkingLocationHandler,  one-time initialization function for saveParkingLocationHandler);
    }
    uint64_t v16 = type metadata accessor for INSaveParkingLocationIntentHandler(0LL);
    v17 = &static IntentHandler.saveParkingLocationHandler;
LABEL_24:
    v22 = (void *)*v17;
    a2[3] = v16;
    *a2 = v22;
    return v22;
  }

  uint64_t v18 = objc_opt_self(&OBJC_CLASS___INDeleteParkingLocationIntent);
  if (swift_dynamicCastObjCClass(v5, v18))
  {
    if (one-time initialization token for deleteParkingLocationHandler != -1) {
      swift_once( &one-time initialization token for deleteParkingLocationHandler,  one-time initialization function for deleteParkingLocationHandler);
    }
    uint64_t v16 = type metadata accessor for INDeleteParkingLocationIntentHandler(0LL);
    v17 = &static IntentHandler.deleteParkingLocationHandler;
    goto LABEL_24;
  }

  uint64_t v19 = objc_opt_self(&OBJC_CLASS___INRetrieveParkingLocationIntent);
  if (swift_dynamicCastObjCClass(v5, v19))
  {
    if (one-time initialization token for retrieveParkingLocationHandler != -1) {
      swift_once( &one-time initialization token for retrieveParkingLocationHandler,  one-time initialization function for retrieveParkingLocationHandler);
    }
    uint64_t v16 = type metadata accessor for INRetrieveParkingLocationIntentHandler(0LL);
    v17 = &static IntentHandler.retrieveParkingLocationHandler;
    goto LABEL_24;
  }

  uint64_t v20 = objc_opt_self(&OBJC_CLASS___INShareETAIntent);
  if (swift_dynamicCastObjCClass(v5, v20))
  {
    if (one-time initialization token for shareETAHandler != -1) {
      swift_once( &one-time initialization token for shareETAHandler,  one-time initialization function for shareETAHandler);
    }
    uint64_t v16 = type metadata accessor for INShareETAIntentHandler(0LL);
    v17 = &static IntentHandler.shareETAHandler;
    goto LABEL_24;
  }

  uint64_t v21 = objc_opt_self(&OBJC_CLASS___INStopShareETAIntent);
  if (swift_dynamicCastObjCClass(v5, v21))
  {
    if (one-time initialization token for stopShareETAHandler != -1) {
      swift_once( &one-time initialization token for stopShareETAHandler,  one-time initialization function for stopShareETAHandler);
    }
    uint64_t v16 = type metadata accessor for INStopShareETAIntentHandler(0LL);
    v17 = &static IntentHandler.stopShareETAHandler;
    goto LABEL_24;
  }

  id result = (id)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000001ALL,  0x8000000100007940LL,  "SiriGeoIntentExtension/IntentHandler.swift",  42LL,  2LL,  37LL,  0);
  __break(1u);
  return result;
}

id IntentHandler.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id IntentHandler.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC22SiriGeoIntentExtension13IntentHandler_logObject;
  type metadata accessor for OS_os_log();
  uint64_t v2 = v0;
  *(void *)&v0[v1] = OS_os_log.init(subsystem:category:)( 0xD000000000000016LL,  0x80000001000078E0LL,  0xD000000000000016LL,  0x8000000100007670LL);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v4, "init");
}

id IntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
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

  __swift_destroy_boxed_opaque_existential_0(v12);
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

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t type metadata accessor for IntentHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC22SiriGeoIntentExtension13IntentHandler);
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t static UsoRequest.makeSDAForPromptForContactValue()()
{
  uint64_t v0 = type metadata accessor for Siri_Nlu_External_SystemPrompted(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v13 - v5;
  uint64_t v7 = type metadata accessor for UsoTaskBuilder_noVerb_common_Person(0LL);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  uint64_t v8 = UsoTaskBuilder_noVerb_common_Person.init()();
  uint64_t v9 = type metadata accessor for UsoEntityBuilder_common_Person(0LL);
  swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
  uint64_t v10 = UsoEntityBuilder_common_Person.init()();
  dispatch thunk of Uso_VerbTemplateBuilder_NoVerb.setEntity(value:)();
  uint64_t v11 = static Siri_Nlu_External_SystemPrompted.from(_:)(v8, (uint64_t)v6);
  Siri_Nlu_External_SystemDialogAct.init()(v11);
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  Siri_Nlu_External_SystemDialogAct.prompted.setter(v4);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  swift_release(v8);
  return swift_release(v10);
}

uint64_t static Siri_Nlu_External_SystemPrompted.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return static Siri_Nlu_External_SystemPrompted.from(_:)( a1,  (void (*)(uint64_t))&Siri_Nlu_External_SystemPrompted.init(),  (void (*)(char *))&Siri_Nlu_External_SystemPrompted.target.setter,  a2);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)( a1,  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_SystemPrompted,  (void (*)(uint64_t))&Siri_Nlu_External_SystemDialogAct.init(),  (void (*)(char *))&Siri_Nlu_External_SystemDialogAct.prompted.setter);
}

uint64_t outlined init with copy of Siri_Nlu_External_UsoGraph?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t static UsoRequest.makeSDAForYesNoCancel()@<X0>(uint64_t a1@<X8>)
{
  v32[1] = a1;
  uint64_t v1 = type metadata accessor for Siri_Nlu_External_SystemOffered(0LL);
  v32[0] = *(void *)(v1 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)v32 - v6;
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v32 - v8;
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_UserCancelled(0LL);
  __chkstk_darwin(v10);
  size_t v12 = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for Siri_Nlu_External_UserAccepted(0LL);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = __chkstk_darwin(v18);
  v23 = (char *)v32 - v22;
  uint64_t v24 = Siri_Nlu_External_UserDialogAct.init()(v21);
  Siri_Nlu_External_UserAccepted.init()(v24);
  uint64_t v25 = Siri_Nlu_External_UserDialogAct.accepted.setter(v15);
  Siri_Nlu_External_UserCancelled.init()(v25);
  uint64_t v26 = Siri_Nlu_External_UserDialogAct.cancelled.setter(v12);
  Siri_Nlu_External_SystemOffered.init()(v26);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v23, v16);
  Siri_Nlu_External_SystemOffered.offeredAct.setter(v20);
  uint64_t v27 = v32[0];
  v28 = *(uint64_t (**)(char *, char *, uint64_t))(v32[0] + 16LL);
  uint64_t v29 = v28(v7, v9, v1);
  Siri_Nlu_External_SystemDialogAct.init()(v29);
  v28(v4, v7, v1);
  Siri_Nlu_External_SystemDialogAct.offered.setter(v4);
  v30 = *(void (**)(char *, uint64_t))(v27 + 8);
  v30(v7, v1);
  v30(v9, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v23, v16);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(systemOffered:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)( a1,  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_SystemOffered,  (void (*)(uint64_t))&Siri_Nlu_External_SystemDialogAct.init(),  (void (*)(char *))&Siri_Nlu_External_SystemDialogAct.offered.setter);
}

uint64_t Siri_Nlu_External_SystemGaveOptions.init(choices:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemGaveOptions.choices.setter(a1);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(gaveOptions:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)( a1,  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_SystemGaveOptions,  (void (*)(uint64_t))&Siri_Nlu_External_SystemDialogAct.init(),  (void (*)(char *))&Siri_Nlu_External_SystemDialogAct.gaveOptions.setter);
}

uint64_t Siri_Nlu_External_UserDialogAct.init(_:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)( a1,  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserStatedTask,  (void (*)(uint64_t))&Siri_Nlu_External_UserDialogAct.init(),  (void (*)(char *))&Siri_Nlu_External_UserDialogAct.userStatedTask.setter);
}

{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)( a1,  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserWantedToProceed,  (void (*)(uint64_t))&Siri_Nlu_External_UserDialogAct.init(),  (void (*)(char *))&Siri_Nlu_External_UserDialogAct.wantedToProceed.setter);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)( uint64_t a1, uint64_t (*a2)(void), void (*a3)(uint64_t), void (*a4)(char *))
{
  uint64_t v7 = a2(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v13 - v10;
  a3(v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  a4(v11);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
}

uint64_t static Siri_Nlu_External_UserDialogAct.from(_:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Siri_Nlu_External_UserStatedTask(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v11 - v7;
  uint64_t v9 = static Siri_Nlu_External_UserStatedTask.from(_:)(a1, (uint64_t)&v11 - v7);
  Siri_Nlu_External_UserDialogAct.init()(v9);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  Siri_Nlu_External_UserDialogAct.userStatedTask.setter(v6);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t static Siri_Nlu_External_UserStatedTask.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v3 = type metadata accessor for Siri_Nlu_External_UsoGraph(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  v30 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  v31 = (char *)&v29 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v29 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v29 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoBuilderOptions?);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v21 = swift_allocObject(v20, 40LL, 7LL);
  *(_OWORD *)(v21 + 16) = xmmword_1000076C0;
  *(void *)(v21 + 32) = a1;
  uint64_t v33 = v21;
  specialized Array._endMutation()();
  uint64_t v22 = v33;
  uint64_t v23 = type metadata accessor for UsoBuilderOptions(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56LL))(v19, 1LL, 1LL, v23);
  swift_retain(a1);
  uint64_t v24 = static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)(v22, v19);
  swift_bridgeObjectRelease(v22);
  outlined destroy of UsoBuilderOptions?( (uint64_t)v19,  &demangling cache variable for type metadata for UsoBuilderOptions?);
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)(v24, 0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v16, 0LL, 1LL, v3);
  uint64_t v25 = outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v16, (uint64_t)v14);
  Siri_Nlu_External_UserStatedTask.init()(v25);
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v14, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v11, 1LL, v3) == 1)
  {
    outlined destroy of UsoBuilderOptions?( (uint64_t)v14,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    outlined destroy of UsoBuilderOptions?( (uint64_t)v11,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }

  else
  {
    uint64_t v26 = v31;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v31, v11, v3);
    uint64_t v27 = v30;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v30, v26, v3);
    Siri_Nlu_External_UserStatedTask.task.setter(v27);
    outlined destroy of UsoBuilderOptions?( (uint64_t)v14,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v26, v3);
  }

  swift_release(v24);
  return outlined destroy of UsoBuilderOptions?( (uint64_t)v16,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
}

uint64_t static Siri_Nlu_External_UserDialogAct.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v3 = type metadata accessor for Siri_Nlu_External_UsoGraph(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  v35 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  v36 = (char *)&v34 - v7;
  uint64_t v8 = type metadata accessor for Siri_Nlu_External_UserStatedTask(0LL);
  uint64_t v37 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v34 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v34 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)&v34 - v22;
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v34 - v24;
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)(a1, 0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v25, 0LL, 1LL, v3);
  uint64_t v26 = outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v25, (uint64_t)v23);
  Siri_Nlu_External_UserStatedTask.init()(v26);
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v23, (uint64_t)v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v20, 1LL, v3) == 1)
  {
    outlined destroy of UsoBuilderOptions?( (uint64_t)v23,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    outlined destroy of UsoBuilderOptions?( (uint64_t)v20,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }

  else
  {
    uint64_t v27 = v36;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v36, v20, v3);
    v28 = v35;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v35, v27, v3);
    Siri_Nlu_External_UserStatedTask.task.setter(v28);
    outlined destroy of UsoBuilderOptions?( (uint64_t)v23,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v27, v3);
  }

  uint64_t v29 = v37;
  v30 = *(uint64_t (**)(char *, char *, uint64_t))(v37 + 16);
  uint64_t v31 = v30(v14, v16, v8);
  Siri_Nlu_External_UserDialogAct.init()(v31);
  v30(v11, v14, v8);
  Siri_Nlu_External_UserDialogAct.userStatedTask.setter(v11);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v29 + 8);
  v32(v14, v8);
  v32(v16, v8);
  return outlined destroy of UsoBuilderOptions?( (uint64_t)v25,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
}

uint64_t Siri_Nlu_External_UserStatedTask.init(_:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_UsoGraph(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v14 - v11;
  Siri_Nlu_External_UserStatedTask.init()(v10);
  outlined init with copy of Siri_Nlu_External_UsoGraph?(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5) == 1)
  {
    outlined destroy of UsoBuilderOptions?( a1,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    return outlined destroy of UsoBuilderOptions?( (uint64_t)v4,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v12, v4, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v12, v5);
    Siri_Nlu_External_UserStatedTask.task.setter(v9);
    outlined destroy of UsoBuilderOptions?( a1,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v12, v5);
  }
}

uint64_t Siri_Nlu_External_UserDialogAct.usoTask.getter()
{
  uint64_t result = static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)(v0);
  uint64_t v2 = result;
  if ((unint64_t)result >> 62)
  {
    if (result < 0) {
      uint64_t v4 = result;
    }
    else {
      uint64_t v4 = result & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(result);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v4);
    uint64_t result = swift_bridgeObjectRelease(v2);
    if (!v3) {
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v3 = *(void *)((result & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (!v3)
    {
LABEL_6:
      swift_bridgeObjectRelease(v2);
      return v3;
    }
  }

  if ((v2 & 0xC000000000000001LL) != 0)
  {
    uint64_t v3 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v2);
    goto LABEL_6;
  }

  if (*(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
    uint64_t v3 = *(void *)(v2 + 32);
    swift_retain(v3);
    goto LABEL_6;
  }

  __break(1u);
  return result;
}

uint64_t Siri_Nlu_External_UserDialogAct.contactId.getter()
{
  uint64_t v0 = type metadata accessor for Google_Protobuf_StringValue(0LL);
  uint64_t v45 = *(void *)(v0 - 8);
  uint64_t v46 = v0;
  __chkstk_darwin(v0);
  v44 = (char *)&v42 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v2 = type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v42 - v7;
  uint64_t v47 = type metadata accessor for Siri_Nlu_External_UsoGraph(0LL);
  uint64_t v9 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for Siri_Nlu_External_UserStatedTask(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoEntityIdentifier?);
  uint64_t v17 = __chkstk_darwin(v16);
  v43 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = Siri_Nlu_External_UserDialogAct.userStatedTask.getter(v17);
  Siri_Nlu_External_UserStatedTask.task.getter(v19);
  uint64_t v20 = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v21 = Siri_Nlu_External_UsoGraph.identifiers.getter(v20);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v47);
  uint64_t v22 = *(void *)(v21 + 16);
  if (!v22)
  {
LABEL_14:
    uint64_t v38 = 1LL;
    uint64_t v39 = (uint64_t)v43;
    goto LABEL_16;
  }

  unint64_t v23 = v21 + ((*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v47 = *(void *)(v3 + 72);
  uint64_t v24 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v3 + 16);
  uint64_t v42 = v21;
  swift_bridgeObjectRetain(v21);
  while (1)
  {
    uint64_t v27 = v24(v8, v23, v2);
    uint64_t v28 = Siri_Nlu_External_UsoEntityIdentifier.backingAppBundleID.getter(v27);
    uint64_t v30 = v29;
    if (v28 == 0x73746361746E6F43LL && v29 == 0xE800000000000000LL)
    {
      swift_bridgeObjectRelease(0xE800000000000000LL);
      uint64_t v31 = v24(v6, (unint64_t)v8, v2);
    }

    else
    {
      char v32 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
      swift_bridgeObjectRelease(v30);
      uint64_t v31 = v24(v6, (unint64_t)v8, v2);
      if ((v32 & 1) == 0)
      {
        uint64_t v26 = *(void (**)(char *, uint64_t))(v3 + 8);
        v26(v6, v2);
        goto LABEL_4;
      }
    }

    uint64_t v33 = v44;
    uint64_t v34 = Siri_Nlu_External_UsoEntityIdentifier.namespace.getter(v31);
    uint64_t v35 = Google_Protobuf_StringValue.value.getter(v34);
    uint64_t v37 = v36;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v33, v46);
    if (v35 == 0x64695F6D657469LL && v37 == 0xE700000000000000LL) {
      break;
    }
    char v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v35, v37, 0x64695F6D657469LL, 0xE700000000000000LL, 0LL);
    swift_bridgeObjectRelease(v37);
    uint64_t v26 = *(void (**)(char *, uint64_t))(v3 + 8);
    v26(v6, v2);
    if ((v25 & 1) != 0) {
      goto LABEL_15;
    }
LABEL_4:
    v26(v8, v2);
    v23 += v47;
    if (!--v22)
    {
      uint64_t v21 = v42;
      swift_bridgeObjectRelease(v42);
      goto LABEL_14;
    }
  }

  swift_bridgeObjectRelease(0xE700000000000000LL);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
LABEL_15:
  uint64_t v21 = v42;
  swift_bridgeObjectRelease(v42);
  uint64_t v39 = (uint64_t)v43;
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v43, v8, v2);
  uint64_t v38 = 0LL;
LABEL_16:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v39, v38, 1LL, v2);
  swift_bridgeObjectRelease(v21);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v39, 1LL, v2) == 1)
  {
    outlined destroy of UsoBuilderOptions?( v39,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoEntityIdentifier?);
    return 0LL;
  }

  else
  {
    uint64_t v40 = Siri_Nlu_External_UsoEntityIdentifier.value.getter();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v39, v2);
  }

  return v40;
}

uint64_t UsoIdentifierAppBundle.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0) {
    return 0xD000000000000015LL;
  }
  else {
    return 0x73746361746E6F43LL;
  }
}

uint64_t UsoIdentifierNamespace.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x64695F6D657469LL;
  }
  if (a1 == 1) {
    return 0xD000000000000012LL;
  }
  return 0x6369746E616D6573LL;
}

uint64_t outlined destroy of UsoBuilderOptions?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t static Siri_Nlu_External_UserWantedToProceed.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return static Siri_Nlu_External_SystemPrompted.from(_:)( a1,  (void (*)(uint64_t))&Siri_Nlu_External_UserWantedToProceed.init(),  (void (*)(char *))&Siri_Nlu_External_UserWantedToProceed.reference.setter,  a2);
}

uint64_t static Siri_Nlu_External_SystemPrompted.from(_:)@<X0>( uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, void (*a3)(char *)@<X2>, uint64_t a4@<X8>)
{
  char v32 = a3;
  uint64_t v33 = a2;
  uint64_t v34 = a4;
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_UsoGraph(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v31 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v31 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoBuilderOptions?);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v31 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v31 - v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v24 = swift_allocObject(v23, 40LL, 7LL);
  *(_OWORD *)(v24 + 16) = xmmword_1000076C0;
  *(void *)(v24 + 32) = a1;
  uint64_t v35 = v24;
  specialized Array._endMutation()();
  uint64_t v25 = v35;
  uint64_t v26 = type metadata accessor for UsoBuilderOptions(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56LL))(v13, 1LL, 1LL, v26);
  swift_retain(a1);
  uint64_t v27 = static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)(v25, v13);
  swift_bridgeObjectRelease(v25);
  outlined destroy of UsoBuilderOptions?( (uint64_t)v13,  &demangling cache variable for type metadata for UsoBuilderOptions?);
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)(v27, 0LL);
  swift_release(v27);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v22, 0LL, 1LL, v5);
  uint64_t v28 = outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v22, (uint64_t)v20);
  v33(v28);
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v20, (uint64_t)v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v17, 1LL, v5) == 1)
  {
    outlined destroy of UsoBuilderOptions?( (uint64_t)v20,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    outlined destroy of UsoBuilderOptions?( (uint64_t)v17,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v10, v17, v5);
    uint64_t v29 = v31;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v31, v10, v5);
    v32(v29);
    outlined destroy of UsoBuilderOptions?( (uint64_t)v20,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  }

  return outlined destroy of UsoBuilderOptions?( (uint64_t)v22,  &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
}

uint64_t static Siri_Nlu_External_SystemOffered.from(_:)(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v1 = type metadata accessor for Siri_Nlu_External_UserWantedToProceed(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v19 - v6;
  uint64_t v8 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v19 - v13;
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 16);
  uint64_t v16 = v15(v7, v20, v1);
  Siri_Nlu_External_UserDialogAct.init()(v16);
  v15(v5, (uint64_t)v7, v1);
  Siri_Nlu_External_UserDialogAct.wantedToProceed.setter(v5);
  uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  Siri_Nlu_External_SystemOffered.init()(v17);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  Siri_Nlu_External_SystemOffered.offeredAct.setter(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

SiriGeoIntentExtension::UsoIdentifierAppBundle_optional __swiftcall UsoIdentifierAppBundle.init(rawValue:)( Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)( (Swift::OpaquePointer)&outlined read-only object #0 of UsoIdentifierAppBundle.init(rawValue:),  v2);
  swift_bridgeObjectRelease(object);
  if (v3 == 1) {
    v4.value = SiriGeoIntentExtension_UsoIdentifierAppBundle_siriNL;
  }
  else {
    v4.value = SiriGeoIntentExtension_UsoIdentifierAppBundle_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UsoIdentifierAppBundle( char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = UsoIdentifierAppBundle.rawValue.getter(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = UsoIdentifierAppBundle.rawValue.getter(v2);
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

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UsoIdentifierAppBundle()
{
  char v1 = *v0;
  Hasher.init(_seed:)(v6, 0LL);
  uint64_t v2 = UsoIdentifierAppBundle.rawValue.getter(v1);
  uint64_t v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance UsoIdentifierAppBundle(uint64_t a1)
{
  return specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

uint64_t specialized RawRepresentable<>.hash(into:)(uint64_t a1, char a2)
{
  BOOL v2 = (a2 & 1) == 0;
  if ((a2 & 1) != 0) {
    unint64_t v3 = 0xD000000000000015LL;
  }
  else {
    unint64_t v3 = 0x73746361746E6F43LL;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000LL;
  }
  else {
    unint64_t v4 = 0x8000000100007890LL;
  }
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v4);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UsoIdentifierAppBundle( uint64_t a1)
{
  char v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  uint64_t v3 = UsoIdentifierAppBundle.rawValue.getter(v2);
  uint64_t v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance UsoIdentifierAppBundle@<X0>( uint64_t *a1@<X0>, char *a2@<X8>)
{
  v3._countAndFlagsBits = *a1;
  uint64_t v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)( (Swift::OpaquePointer)&outlined read-only object #0 of UsoIdentifierAppBundle.init(rawValue:),  v3);
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

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance UsoIdentifierAppBundle@<X0>( uint64_t *a1@<X8>)
{
  uint64_t result = UsoIdentifierAppBundle.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UsoIdentifierNamespace( char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = UsoIdentifierNamespace.rawValue.getter(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = UsoIdentifierNamespace.rawValue.getter(v2);
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

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UsoIdentifierNamespace()
{
  char v1 = *v0;
  Hasher.init(_seed:)(v6, 0LL);
  uint64_t v2 = UsoIdentifierNamespace.rawValue.getter(v1);
  uint64_t v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance UsoIdentifierNamespace(uint64_t a1)
{
  uint64_t v3 = UsoIdentifierNamespace.rawValue.getter(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UsoIdentifierNamespace( uint64_t a1)
{
  char v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  uint64_t v3 = UsoIdentifierNamespace.rawValue.getter(v2);
  uint64_t v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance UsoIdentifierNamespace@<X0>( Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = specialized UsoIdentifierNamespace.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance UsoIdentifierNamespace@<X0>( uint64_t *a1@<X8>)
{
  uint64_t result = UsoIdentifierNamespace.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t specialized UsoIdentifierNamespace.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)( (Swift::OpaquePointer)&outlined read-only object #0 of UsoIdentifierNamespace.init(rawValue:),  v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3) {
    return 3LL;
  }
  else {
    return v3;
  }
}

unint64_t lazy protocol witness table accessor for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle()
{
  unint64_t result = lazy protocol witness table cache variable for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle;
  if (!lazy protocol witness table cache variable for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for UsoIdentifierAppBundle,  &type metadata for UsoIdentifierAppBundle);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace()
{
  unint64_t result = lazy protocol witness table cache variable for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace;
  if (!lazy protocol witness table cache variable for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for UsoIdentifierNamespace,  &type metadata for UsoIdentifierNamespace);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace);
  }

  return result;
}

ValueMetadata *type metadata accessor for UsoRequest()
{
  return &type metadata for UsoRequest;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UsoIdentifierAppBundle(unsigned __int8 *a1, unsigned int a2)
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

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
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

uint64_t storeEnumTagSinglePayload for UsoIdentifierAppBundle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100006F1C + 4 * byte_1000076D5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100006F50 + 4 * byte_1000076D0[v4]))();
}

uint64_t sub_100006F50(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006F58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100006F60LL);
  }
  return result;
}

uint64_t sub_100006F6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100006F74LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_100006F78(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006F80(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for UsoIdentifierAppBundle(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for UsoIdentifierAppBundle(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UsoIdentifierAppBundle()
{
  return &type metadata for UsoIdentifierAppBundle;
}

uint64_t getEnumTagSinglePayload for UsoIdentifierNamespace(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for UsoIdentifierNamespace(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100007090 + 4 * byte_1000076DF[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1000070C4 + 4 * byte_1000076DA[v4]))();
}

uint64_t sub_1000070C4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000070CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1000070D4LL);
  }
  return result;
}

uint64_t sub_1000070E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000070E8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1000070EC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000070F4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for UsoIdentifierNamespace(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UsoIdentifierNamespace()
{
  return &type metadata for UsoIdentifierNamespace;
}
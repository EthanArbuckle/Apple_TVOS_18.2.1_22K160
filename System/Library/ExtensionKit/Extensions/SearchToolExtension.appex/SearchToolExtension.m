uint64_t one-time initialization function for title()
{
  uint64_t v0;
  v0 = type metadata accessor for LocalizedStringResource(0LL);
  __swift_allocate_value_buffer(v0, static DoNotUseThisExtensionIntent.title);
  __swift_project_value_buffer(v0, (uint64_t)static DoNotUseThisExtensionIntent.title);
  return LocalizedStringResource.init(stringLiteral:)(0xD00000000000001BLL, 0x8000000100003840LL);
}

uint64_t DoNotUseThisExtensionIntent.title.unsafeMutableAddressor()
{
  if (one-time initialization token for title != -1) {
    swift_once(&one-time initialization token for title, one-time initialization function for title);
  }
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return __swift_project_value_buffer(v0, (uint64_t)static DoNotUseThisExtensionIntent.title);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void static DoNotUseThisExtensionIntent.title.getter(uint64_t a1@<X8>)
{
  if (one-time initialization token for title != -1) {
    swift_once(&one-time initialization token for title, one-time initialization function for title);
  }
  uint64_t v2 = OUTLINED_FUNCTION_5();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static DoNotUseThisExtensionIntent.title);
  OUTLINED_FUNCTION_2(v3, (uint64_t)v4, 0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
  OUTLINED_FUNCTION_7();
}

void static DoNotUseThisExtensionIntent.title.setter(uint64_t a1)
{
  if (one-time initialization token for title != -1) {
    swift_once(&one-time initialization token for title, one-time initialization function for title);
  }
  uint64_t v2 = OUTLINED_FUNCTION_5();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static DoNotUseThisExtensionIntent.title);
  OUTLINED_FUNCTION_2(v3, (uint64_t)v5, 33LL);
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess(v5);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
  OUTLINED_FUNCTION_7();
}

uint64_t (*static DoNotUseThisExtensionIntent.title.modify(uint64_t a1))()
{
  if (one-time initialization token for title != -1) {
    swift_once(&one-time initialization token for title, one-time initialization function for title);
  }
  uint64_t v2 = OUTLINED_FUNCTION_5();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static DoNotUseThisExtensionIntent.title);
  OUTLINED_FUNCTION_2(v3, a1, 33LL);
  return static DoNotUseThisExtensionIntent.title.modify;
}

char *DoNotUseThisExtensionIntent.assistantOnly.unsafeMutableAddressor()
{
  return &static DoNotUseThisExtensionIntent.assistantOnly;
}

uint64_t static DoNotUseThisExtensionIntent.assistantOnly.getter()
{
  return static DoNotUseThisExtensionIntent.assistantOnly;
}

uint64_t static DoNotUseThisExtensionIntent.assistantOnly.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_2((uint64_t)&static DoNotUseThisExtensionIntent.assistantOnly, (uint64_t)v3, 1LL);
  static DoNotUseThisExtensionIntent.assistantOnly = a1;
  return result;
}

uint64_t (*static DoNotUseThisExtensionIntent.assistantOnly.modify(uint64_t a1))()
{
  return static DoNotUseThisExtensionIntent.assistantOnly.modify;
}

uint64_t DoNotUseThisExtensionIntent.perform()(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return swift_task_switch(DoNotUseThisExtensionIntent.perform(), 0LL, 0LL);
}

uint64_t DoNotUseThisExtensionIntent.perform()()
{
  if (one-time initialization token for stextension != -1) {
    swift_once(&one-time initialization token for stextension, one-time initialization function for stextension);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = (void *)__swift_project_value_buffer(v1, (uint64_t)static Logging.stextension);
  Logger.logObject.getter();
  os_log_type_t v3 = OUTLINED_FUNCTION_6();
  if (OUTLINED_FUNCTION_1(v3))
  {
    uint64_t v4 = (_WORD *)OUTLINED_FUNCTION_3(2LL);
    *uint64_t v4 = 0;
    OUTLINED_FUNCTION_4((void *)&_mh_execute_header, v5, v6, "SearchToolExtension testing log");
    OUTLINED_FUNCTION_0((uint64_t)v4);
  }

  type metadata accessor for ToolDatabase(0LL);
  v7 = (os_log_s *)ToolDatabase.__allocating_init()();
  uint64_t v8 = ToolDatabase.actions.getter();
  swift_bridgeObjectRetain_n(v8, 2LL);
  OUTLINED_FUNCTION_10();
  os_log_type_t v9 = OUTLINED_FUNCTION_6();
  if (os_log_type_enabled(v7, v9))
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_3(12LL);
    uint64_t v21 = OUTLINED_FUNCTION_3(32LL);
    uint64_t v22 = v21;
    *(_DWORD *)v10 = 136315138;
    uint64_t v11 = type metadata accessor for ToolDefinition(0LL);
    uint64_t v12 = swift_bridgeObjectRetain(v8);
    uint64_t v13 = Array.description.getter(v12, v11);
    unint64_t v15 = v14;
    swift_bridgeObjectRelease(v8);
    *(void *)(v0 + 16) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v15, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v10 + 4, v10 + 12);
    swift_bridgeObjectRelease(v15);
    OUTLINED_FUNCTION_11();
    _os_log_impl((void *)&_mh_execute_header, v7, v9, "SearchToolExtension actions: %s", v10, 0xCu);
    swift_arrayDestroy(v21, 1LL, (char *)&type metadata for Any + 8);
    OUTLINED_FUNCTION_0(v21);
    OUTLINED_FUNCTION_0((uint64_t)v10);
  }

  else
  {
    OUTLINED_FUNCTION_11();
  }

  uint64_t v16 = type metadata accessor for ToolDefinition(0LL);
  uint64_t v17 = Array.description.getter(v8, v16);
  uint64_t v19 = v18;
  swift_bridgeObjectRelease(v8);
  *(void *)(v0 + 16) = v17;
  *(void *)(v0 + 24) = v19;
  lazy protocol witness table accessor for type String and conformance String();
  OUTLINED_FUNCTION_8();
  swift_release(v7);
  swift_bridgeObjectRelease(v19);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t protocol witness for static AppIntent.title.getter in conformance DoNotUseThisExtensionIntent@<X0>( uint64_t a1@<X8>)
{
  if (one-time initialization token for title != -1) {
    swift_once(&one-time initialization token for title, one-time initialization function for title);
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static DoNotUseThisExtensionIntent.title);
  swift_beginAccess(v3, v5, 0LL, 0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t protocol witness for AppIntent.perform() in conformance DoNotUseThisExtensionIntent(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_10000807C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for AppIntent.perform() in conformance DoNotUseThisExtensionIntent;
  return DoNotUseThisExtensionIntent.perform()(a1);
}

uint64_t protocol witness for AppIntent.perform() in conformance DoNotUseThisExtensionIntent()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t protocol witness for static PersistentlyIdentifiable.persistentIdentifier.getter in conformance DoNotUseThisExtensionIntent( uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
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

void *specialized _StringGuts._deconstructUTF8<A>(scratch:)( void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
      unint64_t result = 0LL;
      *a1 = __dst;
      return result;
    }

    goto LABEL_11;
  }

  if ((a6 & 0x1000000000000000LL) != 0)
  {
LABEL_11:
    unint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
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
      unint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
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

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)( char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory with negative count",  60LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1170LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1173LL,  0);
  }

  __break(1u);
  return result;
}

void *_StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  v2[2] + 1LL,  1,  (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    unint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (char *)(v3 > 1),  v4 + 1,  1,  (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v4, 0LL);
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
    unint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    goto LABEL_15;
  }

  if (v7 == v4) {
    return v6;
  }
  unint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  2,  1122LL,  0);
LABEL_15:
  __break(1u);
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

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( char *result, int64_t a2, char a3, uint64_t a4)
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
  unint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, size_t __len, char *__dst)
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

unint64_t lazy protocol witness table accessor for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent()
{
  unint64_t result = lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent;
  if (!lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for DoNotUseThisExtensionIntent,  &type metadata for DoNotUseThisExtensionIntent);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent;
  if (!lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for DoNotUseThisExtensionIntent,  &type metadata for DoNotUseThisExtensionIntent);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent;
  if (!lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for DoNotUseThisExtensionIntent,  &type metadata for DoNotUseThisExtensionIntent);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent);
  }

  return result;
}

uint64_t associated type witness table accessor for AppIntent.PerformResult : IntentResult in DoNotUseThisExtensionIntent( uint64_t a1)
{
  return *(void *)(swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of DoNotUseThisExtensionIntent.perform()>>,  1LL)
                   + 8);
}

uint64_t associated type witness table accessor for AppIntent.SummaryContent : ParameterSummary in DoNotUseThisExtensionIntent( uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = lazy protocol witness table accessor for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent();
  return swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>,  1LL);
}

ValueMetadata *type metadata accessor for DoNotUseThisExtensionIntent()
{
  return &type metadata for DoNotUseThisExtensionIntent;
}

unint64_t lazy protocol witness table accessor for type IntentResultContainer<String, Never, Never, Never> and conformance IntentResultContainer<A, B, C, D>()
{
  unint64_t result = lazy protocol witness table cache variable for type IntentResultContainer<String, Never, Never, Never> and conformance IntentResultContainer<A, B, C, D>;
  if (!lazy protocol witness table cache variable for type IntentResultContainer<String, Never, Never, Never> and conformance IntentResultContainer<A, B, C, D>)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for IntentResultContainer<String, Never, Never, Never>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type IntentResultContainer<String, Never, Never, Never> and conformance IntentResultContainer<A, B, C, D>);
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

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

BOOL OUTLINED_FUNCTION_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0LL);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t OUTLINED_FUNCTION_5()
{
  return type metadata accessor for LocalizedStringResource(0LL);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return static os_log_type_t.debug.getter();
}

  ;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return static IntentResult.result<A>(value:)(v0);
}

unint64_t OUTLINED_FUNCTION_9()
{
  *(void *)(v0 + 16) = 0LL;
  *(void *)(v0 + 24) = 0xE000000000000000LL;
  return lazy protocol witness table accessor for type String and conformance String();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return Logger.logObject.getter();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_bridgeObjectRelease_n(v0, 2LL);
}

uint64_t Logging.stextension.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor( &one-time initialization token for stextension,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.stextension,  (uint64_t)one-time initialization function for stextension);
}

uint64_t one-time initialization function for interface(uint64_t a1)
{
  return one-time initialization function for interface( a1,  static Logging.interface,  0x65746E492D4D4C4CLL,  0xED00006563616672LL);
}

uint64_t Logging.interface.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor( &one-time initialization token for interface,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.interface,  (uint64_t)one-time initialization function for interface);
}

uint64_t static Logging.interface.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter( &one-time initialization token for interface,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.interface,  (uint64_t)one-time initialization function for interface,  a1);
}

uint64_t one-time initialization function for search(uint64_t a1)
{
  return one-time initialization function for interface( a1,  static Logging.search,  0x686372616553LL,  0xE600000000000000LL);
}

uint64_t Logging.search.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor( &one-time initialization token for search,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.search,  (uint64_t)one-time initialization function for search);
}

uint64_t static Logging.search.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter( &one-time initialization token for search,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.search,  (uint64_t)one-time initialization function for search,  a1);
}

uint64_t one-time initialization function for searchComponents(uint64_t a1)
{
  return one-time initialization function for interface( a1,  static Logging.searchComponents,  0xD000000000000010LL,  0x8000000100003E50LL);
}

uint64_t Logging.searchComponents.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor( &one-time initialization token for searchComponents,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.searchComponents,  (uint64_t)one-time initialization function for searchComponents);
}

uint64_t static Logging.searchComponents.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter( &one-time initialization token for searchComponents,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.searchComponents,  (uint64_t)one-time initialization function for searchComponents,  a1);
}

uint64_t one-time initialization function for utilities(uint64_t a1)
{
  return one-time initialization function for interface( a1,  static Logging.utilities,  0x656974696C697455LL,  0xE900000000000073LL);
}

uint64_t Logging.utilities.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor( &one-time initialization token for utilities,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.utilities,  (uint64_t)one-time initialization function for utilities);
}

uint64_t static Logging.utilities.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter( &one-time initialization token for utilities,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.utilities,  (uint64_t)one-time initialization function for utilities,  a1);
}

uint64_t one-time initialization function for stextension(uint64_t a1)
{
  return one-time initialization function for interface( a1,  static Logging.stextension,  0x736E657478455453LL,  0xEB000000006E6F69LL);
}

uint64_t static Logging.stextension.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter( &one-time initialization token for stextension,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.stextension,  (uint64_t)one-time initialization function for stextension,  a1);
}

uint64_t one-time initialization function for memoryCreationQU(uint64_t a1)
{
  return one-time initialization function for interface( a1,  static Logging.memoryCreationQU,  0xD000000000000011LL,  0x8000000100003E30LL);
}

uint64_t Logging.memoryCreationQU.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor( &one-time initialization token for memoryCreationQU,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.memoryCreationQU,  (uint64_t)one-time initialization function for memoryCreationQU);
}

uint64_t static Logging.memoryCreationQU.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter( &one-time initialization token for memoryCreationQU,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.memoryCreationQU,  (uint64_t)one-time initialization function for memoryCreationQU,  a1);
}

uint64_t one-time initialization function for llmQU(uint64_t a1)
{
  return one-time initialization function for interface(a1, static Logging.llmQU, 0x55516D6C6CLL, 0xE500000000000000LL);
}

uint64_t Logging.llmQU.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor( &one-time initialization token for llmQU,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.llmQU,  (uint64_t)one-time initialization function for llmQU);
}

uint64_t static Logging.llmQU.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter( &one-time initialization token for llmQU,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.llmQU,  (uint64_t)one-time initialization function for llmQU,  a1);
}

uint64_t one-time initialization function for visual(uint64_t a1)
{
  return one-time initialization function for interface( a1,  static Logging.visual,  0x6C6175736956LL,  0xE600000000000000LL);
}

uint64_t Logging.visual.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor( &one-time initialization token for visual,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.visual,  (uint64_t)one-time initialization function for visual);
}

uint64_t static Logging.visual.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter( &one-time initialization token for visual,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.visual,  (uint64_t)one-time initialization function for visual,  a1);
}

uint64_t one-time initialization function for hallucination(uint64_t a1)
{
  return one-time initialization function for interface( a1,  static Logging.hallucination,  0xD000000000000016LL,  0x8000000100003E10LL);
}

uint64_t Logging.hallucination.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor( &one-time initialization token for hallucination,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.hallucination,  (uint64_t)one-time initialization function for hallucination);
}

uint64_t static Logging.hallucination.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter( &one-time initialization token for hallucination,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.hallucination,  (uint64_t)one-time initialization function for hallucination,  a1);
}

uint64_t one-time initialization function for answerSynthesis(uint64_t a1)
{
  return one-time initialization function for interface( a1,  static Logging.answerSynthesis,  0x7953726577736E41LL,  0xEF7369736568746ELL);
}

uint64_t Logging.answerSynthesis.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor( &one-time initialization token for answerSynthesis,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.answerSynthesis,  (uint64_t)one-time initialization function for answerSynthesis);
}

uint64_t static Logging.answerSynthesis.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter( &one-time initialization token for answerSynthesis,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.answerSynthesis,  (uint64_t)one-time initialization function for answerSynthesis,  a1);
}

uint64_t one-time initialization function for uiPlugin(uint64_t a1)
{
  return one-time initialization function for interface( a1,  static Logging.uiPlugin,  0x6E6967756C504955LL,  0xE800000000000000LL);
}

uint64_t one-time initialization function for interface(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Logger(0LL);
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD000000000000014LL, 0x8000000100003DF0LL, a3, a4);
}

uint64_t Logging.uiPlugin.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor( &one-time initialization token for uiPlugin,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.uiPlugin,  (uint64_t)one-time initialization function for uiPlugin);
}

uint64_t static Logging.uiPlugin.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter( &one-time initialization token for uiPlugin,  (uint64_t (*)(void))&type metadata accessor for Logger,  (uint64_t)static Logging.uiPlugin,  (uint64_t)one-time initialization function for uiPlugin,  a1);
}

uint64_t one-time initialization function for searchSignposter(uint64_t a1)
{
  return one-time initialization function for searchSignposter( a1,  static Logging.searchSignposter,  &one-time initialization token for search,  (uint64_t)static Logging.search,  (uint64_t)one-time initialization function for search);
}

uint64_t Logging.searchSignposter.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor( &one-time initialization token for searchSignposter,  (uint64_t (*)(void))&type metadata accessor for OSSignposter,  (uint64_t)static Logging.searchSignposter,  (uint64_t)one-time initialization function for searchSignposter);
}

uint64_t static Logging.searchSignposter.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter( &one-time initialization token for searchSignposter,  (uint64_t (*)(void))&type metadata accessor for OSSignposter,  (uint64_t)static Logging.searchSignposter,  (uint64_t)one-time initialization function for searchSignposter,  a1);
}

uint64_t one-time initialization function for searchComponentSignposter(uint64_t a1)
{
  return one-time initialization function for searchSignposter( a1,  static Logging.searchComponentSignposter,  &one-time initialization token for searchComponents,  (uint64_t)static Logging.searchComponents,  (uint64_t)one-time initialization function for searchComponents);
}

uint64_t one-time initialization function for searchSignposter( uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  size_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for OSSignposter(0LL);
  __swift_allocate_value_buffer(v13, a2);
  __swift_project_value_buffer(v13, (uint64_t)a2);
  if (*a3 != -1LL) {
    swift_once(a3, a5);
  }
  uint64_t v14 = __swift_project_value_buffer(v9, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v14, v9);
  return OSSignposter.init(logger:)(v12);
}

uint64_t Logging.searchComponentSignposter.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor( &one-time initialization token for searchComponentSignposter,  (uint64_t (*)(void))&type metadata accessor for OSSignposter,  (uint64_t)static Logging.searchComponentSignposter,  (uint64_t)one-time initialization function for searchComponentSignposter);
}

uint64_t Logging.stextension.unsafeMutableAddressor( void *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  if (*a1 != -1LL) {
    swift_once(a1, a4);
  }
  uint64_t v6 = a2(0LL);
  return __swift_project_value_buffer(v6, a3);
}

uint64_t static Logging.searchComponentSignposter.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter( &one-time initialization token for searchComponentSignposter,  (uint64_t (*)(void))&type metadata accessor for OSSignposter,  (uint64_t)static Logging.searchComponentSignposter,  (uint64_t)one-time initialization function for searchComponentSignposter,  a1);
}

uint64_t static Logging.interface.getter@<X0>( void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  if (*a1 != -1LL) {
    swift_once(a1, a4);
  }
  uint64_t v8 = a2(0LL);
  uint64_t v9 = __swift_project_value_buffer(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16LL))(a5, v9, v8);
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
}
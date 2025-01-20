unint64_t PhoneUIPlugin.view(for:data:mode:)( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  os_log_s *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_log_s *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  uint64_t v35[12];
  void __src[9];
  void v37[12];
  void __dst[10];
  uint64_t v39;
  v5 = v4;
  v39 = a3;
  if (one-time initialization token for siriPhoneUI != -1) {
    swift_once(&one-time initialization token for siriPhoneUI, one-time initialization function for siriPhoneUI);
  }
  v9 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v9, (uint64_t)static Logger.siriPhoneUI);
  v10 = swift_bridgeObjectRetain_n(a2, 2LL);
  v11 = (os_log_s *)Logger.logObject.getter(v10);
  v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_2(12LL);
    v35[0] = OUTLINED_FUNCTION_2(32LL);
    v14 = v35[0];
    *(_DWORD *)v13 = 136315138;
    OUTLINED_FUNCTION_3();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v35);
    OUTLINED_FUNCTION_5();
    ((void (*)(void))UnsafeMutableRawBufferPointer.copyMemory(from:))();
    OUTLINED_FUNCTION_6();
    _os_log_impl(&dword_0, v11, v12, "#PhoneUIPlugin creating view for id=%s", v13, 0xCu);
    swift_arrayDestroy(v14, 1LL, (char *)&type metadata for Any + 8);
    v15 = v14;
    v5 = v4;
    OUTLINED_FUNCTION_0(v15);
    OUTLINED_FUNCTION_0((uint64_t)v13);
  }

  else
  {

    OUTLINED_FUNCTION_7();
  }

  v35[0] = (uint64_t)&type metadata for PhoneContactHeader;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PhoneContactHeader.Type);
  if (String.init<A>(describing:)(v35, v16) == a1 && v17 == a2)
  {
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    v19 = v17;
    v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease(v19);
    if ((v20 & 1) == 0)
    {
      v21 = lazy protocol witness table accessor for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error();
      v5 = swift_allocError(&type metadata for PhoneUIPlugin.Error, v21, 0LL, 0LL);
      swift_willThrow();
      goto LABEL_14;
    }
  }

  v22 = v39;
  outlined copy of Data._Representation(v39, a4);
  lazy protocol witness table accessor for type PhoneContactHeader and conformance PhoneContactHeader();
  lazy protocol witness table accessor for type PhoneContactHeader and conformance PhoneContactHeader();
  CustomCanvasModel<>.init(serializedData:)(__src, v22, a4);
  if (!v5)
  {
    v32 = memcpy(__dst, __src, 0x41uLL);
    PhoneContactHeader.view.getter(v37, v32);
    outlined release of PhoneContactHeader(__dst);
    memcpy(v35, v37, 0x59uLL);
    v33 = lazy protocol witness table accessor for type ContactHeaderView and conformance ContactHeaderView();
    a2 = View.eraseToAnyView()(&type metadata for ContactHeaderView, v33);
    outlined release of ContactHeaderView((uint64_t)v37);
    return a2;
  }

LABEL_14:
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  v23 = OUTLINED_FUNCTION_4();
  v24 = (os_log_s *)Logger.logObject.getter(v23);
  v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = OUTLINED_FUNCTION_2(22LL);
    v27 = OUTLINED_FUNCTION_2(64LL);
    v35[0] = v27;
    *(_DWORD *)v26 = 136315394;
    OUTLINED_FUNCTION_3();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v35);
    OUTLINED_FUNCTION_5();
    ((void (*)(void))UnsafeMutableRawBufferPointer.copyMemory(from:))();
    OUTLINED_FUNCTION_6();
    *(_WORD *)(v26 + 12) = 2080;
    a2 = v26 + 14;
    __src[0] = v5;
    OUTLINED_FUNCTION_4();
    v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v29 = String.init<A>(describing:)(__src, v28);
    v31 = v30;
    __src[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v30, v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(__src, &__src[1], v26 + 14, v26 + 22);
    swift_bridgeObjectRelease(v31);
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    _os_log_impl( &dword_0,  v24,  v25,  "#PhoneUIPlugin failed to create view component for id=%s: %s.",  (uint8_t *)v26,  0x16u);
    swift_arrayDestroy(v27, 2LL, (char *)&type metadata for Any + 8);
    OUTLINED_FUNCTION_0(v27);
    OUTLINED_FUNCTION_0(v26);
  }

  else
  {
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }

  swift_willThrow();
  return a2;
}

uint64_t static PhoneUIPlugin.Error.__derived_enum_equals(_:_:)()
{
  return 1LL;
}

void PhoneUIPlugin.Error.hash(into:)()
{
}

Swift::Int PhoneUIPlugin.Error.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PhoneUIPlugin.Error(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t PhoneUIPlugin.deinit()
{
  return v0;
}

uint64_t PhoneUIPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t PhoneUIPlugin.__allocating_init()()
{
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t protocol witness for SnippetUIPlugin.init() in conformance PhoneUIPlugin@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhoneUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

unint64_t protocol witness for SnippetUIPlugin.view(for:data:mode:) in conformance PhoneUIPlugin( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  return PhoneUIPlugin.view(for:data:mode:)(a1, a2, a3, a4);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
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

unint64_t lazy protocol witness table accessor for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error()
{
  unint64_t result = lazy protocol witness table cache variable for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error;
  if (!lazy protocol witness table cache variable for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for PhoneUIPlugin.Error,  &type metadata for PhoneUIPlugin.Error);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error;
  if (!lazy protocol witness table cache variable for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for PhoneUIPlugin.Error,  &type metadata for PhoneUIPlugin.Error);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error);
  }

  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)( uint64_t a1, unint64_t a2, uint64_t *a3)
{
  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    v8 = v6;
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
  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  v2[2] + 1LL,  1,  (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (char *)(v3 > 1),  v4 + 1,  1,  (uint64_t)v2);
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
  v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v4, 0LL);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  71LL,  0);
    __break(1u);
    goto LABEL_14;
  }

  v6 = v5;
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
  v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
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
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = _swift_stdlib_malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }

  v13 = v11 + 32;
  v14 = (char *)(a4 + 32);
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

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_retain)();
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t lazy protocol witness table accessor for type PhoneContactHeader and conformance PhoneContactHeader()
{
  unint64_t result = lazy protocol witness table cache variable for type PhoneContactHeader and conformance PhoneContactHeader;
  if (!lazy protocol witness table cache variable for type PhoneContactHeader and conformance PhoneContactHeader)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for PhoneContactHeader,  &type metadata for PhoneContactHeader);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type PhoneContactHeader and conformance PhoneContactHeader);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type PhoneContactHeader and conformance PhoneContactHeader;
  if (!lazy protocol witness table cache variable for type PhoneContactHeader and conformance PhoneContactHeader)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for PhoneContactHeader,  &type metadata for PhoneContactHeader);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type PhoneContactHeader and conformance PhoneContactHeader);
  }

  return result;
}

void *outlined release of PhoneContactHeader(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[5];
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type ContactHeaderView and conformance ContactHeaderView()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactHeaderView and conformance ContactHeaderView;
  if (!lazy protocol witness table cache variable for type ContactHeaderView and conformance ContactHeaderView)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ContactHeaderView,  &type metadata for ContactHeaderView);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ContactHeaderView and conformance ContactHeaderView);
  }

  return result;
}

uint64_t outlined release of ContactHeaderView(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  swift_bridgeObjectRelease(*(void *)(a1 + 80));
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);

  return a1;
}

uint64_t type metadata accessor for PhoneUIPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC13PhoneUIPlugin13PhoneUIPlugin);
}

uint64_t getEnumTagSinglePayload for PhoneUIPlugin.Error(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PhoneUIPlugin.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_5D90 + 4 * byte_7668[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_5DB0 + 4 * byte_766D[v4]))();
  }
}

_BYTE *sub_5D90(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_5DB0(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_5DB8(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_5DC0(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_5DC8(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_5DD0(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t getEnumTag for PhoneUIPlugin.Error()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for PhoneUIPlugin.Error()
{
  return &type metadata for PhoneUIPlugin.Error;
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

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_errorRelease(v0);
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_errorRetain(v0);
}

  ;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_bridgeObjectRelease_n(v0, 3LL);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_bridgeObjectRelease_n(v0, 2LL);
}

uint64_t Logger.siriPhoneUI.unsafeMutableAddressor()
{
  if (one-time initialization token for siriPhoneUI != -1) {
    swift_once(&one-time initialization token for siriPhoneUI, one-time initialization function for siriPhoneUI);
  }
  uint64_t v0 = OUTLINED_FUNCTION_0_0();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.siriPhoneUI);
}

uint64_t one-time initialization function for siriPhoneUI()
{
  uint64_t v0 = OUTLINED_FUNCTION_0_0();
  __swift_allocate_value_buffer(v0, static Logger.siriPhoneUI);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriPhoneUI);
  if (one-time initialization token for siriPhoneUI != -1) {
    swift_once(&one-time initialization token for siriPhoneUI, one-time initialization function for siriPhoneUI);
  }
  uint64_t v1 = static LogConst.Category.siriPhoneUI;
  uint64_t v2 = unk_C490;
  swift_bridgeObjectRetain(unk_C490);
  return Logger.init(subsystem:category:)(0xD000000000000014LL, 0x8000000000007C70LL, v1, v2);
}

void *LogConst.subsystem.unsafeMutableAddressor()
{
  return &static LogConst.subsystem;
}

uint64_t *LogConst.Category.siriPhoneUI.unsafeMutableAddressor()
{
  if (one-time initialization token for siriPhoneUI != -1) {
    swift_once(&one-time initialization token for siriPhoneUI, one-time initialization function for siriPhoneUI);
  }
  return &static LogConst.Category.siriPhoneUI;
}

uint64_t static Logger.siriPhoneUI.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for siriPhoneUI != -1) {
    swift_once(&one-time initialization token for siriPhoneUI, one-time initialization function for siriPhoneUI);
  }
  uint64_t v2 = OUTLINED_FUNCTION_0_0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.siriPhoneUI);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t Logger.logAndCrash(_:file:line:)( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v39 = a6;
  unsigned int v40 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Logger?);
  uint64_t v12 = ((uint64_t (*)(void))__chkstk_darwin)();
  v14 = &v33[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v12);
  v16 = &v33[-v15];
  uint64_t v17 = OUTLINED_FUNCTION_0_0();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v18 + 16))(v16, v7, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0LL, 1LL, v17);
  outlined init with copy of Logger?((uint64_t)v16, (uint64_t)v14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1LL, v17) == 1)
  {
    outlined destroy of Logger?((uint64_t)v14);
    uint64_t v19 = v39;
  }

  else
  {
    uint64_t v20 = swift_bridgeObjectRetain_n(a2, 2LL);
    v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.error.getter();
    int v23 = v22;
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v24 = swift_slowAlloc(32LL, -1LL);
      uint64_t v37 = a3;
      uint64_t v25 = v24;
      uint64_t v36 = swift_slowAlloc(64LL, -1LL);
      uint64_t v42 = v36;
      *(_DWORD *)uint64_t v25 = 136315650;
      uint64_t v38 = a4;
      uint64_t v26 = StaticString.description.getter(v37, a4, v40);
      os_log_t v35 = v21;
      unint64_t v28 = v27;
      uint64_t v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, &v42);
      int v34 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease(v28);
      *(_WORD *)(v25 + 12) = 2048;
      uint64_t v19 = v39;
      uint64_t v41 = v39;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v25 + 14, v25 + 22);
      *(_WORD *)(v25 + 22) = 2080;
      swift_bridgeObjectRetain(a2);
      uint64_t v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v42);
      a4 = v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v25 + 24, v25 + 32);
      swift_bridgeObjectRelease_n(a2, 3LL);
      os_log_t v29 = v35;
      _os_log_impl(&dword_0, v35, (os_log_type_t)v34, "FatalError at %s:%lu - %s", (uint8_t *)v25, 0x20u);
      uint64_t v30 = v36;
      swift_arrayDestroy(v36, 2LL, (char *)&type metadata for Any + 8);
      OUTLINED_FUNCTION_0(v30);
      uint64_t v31 = v25;
      a3 = v37;
      OUTLINED_FUNCTION_0(v31);
    }

    else
    {
      swift_bridgeObjectRelease_n(a2, 2LL);

      uint64_t v19 = v39;
    }

    (*(void (**)(_BYTE *, uint64_t))(v18 + 8))(v14, v17);
  }

  static SiriKitLifecycle._logCrashToEventBus(_:)(a1, a2);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11LL, 2LL, a1, a2, a3, a4, v40, v19, 0);
  __break(1u);
  return result;
}

unint64_t static LogConst.subsystem.getter()
{
  return 0xD000000000000014LL;
}

void one-time initialization function for siriPhoneUI()
{
  static LogConst.Category.siriPhoneUI = 0x6E6F685069726953LL;
  unk_C490 = 0xEB00000000495565LL;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t outlined init with copy of Logger?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Logger?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t outlined destroy of Logger?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Logger?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t static LogConst.Category.siriPhoneUI.getter()
{
  if (one-time initialization token for siriPhoneUI != -1) {
    swift_once(&one-time initialization token for siriPhoneUI, one-time initialization function for siriPhoneUI);
  }
  uint64_t v0 = static LogConst.Category.siriPhoneUI;
  swift_bridgeObjectRetain(unk_C490);
  return v0;
}

ValueMetadata *type metadata accessor for LogConst()
{
  return &type metadata for LogConst;
}

ValueMetadata *type metadata accessor for LogConst.Category()
{
  return &type metadata for LogConst.Category;
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

uint64_t OUTLINED_FUNCTION_0_0()
{
  return type metadata accessor for Logger(0LL);
}

void PhoneUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SingleResultCallHistoryView(0LL);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v112 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for SingleResultCallHistoryModel(0LL);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v6);
  OUTLINED_FUNCTION_2_0();
  v112[36] = v7;
  OUTLINED_FUNCTION_7_0();
  __chkstk_darwin(v8);
  OUTLINED_FUNCTION_9();
  v112[37] = v9;
  uint64_t v10 = OUTLINED_FUNCTION_4_0();
  v112[19] = type metadata accessor for SingleResultVoicemailView(v10);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v11);
  OUTLINED_FUNCTION_1_0();
  uint64_t v13 = OUTLINED_FUNCTION_3_0(v12);
  type metadata accessor for SingleResultVoicemailModel(v13);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v14);
  OUTLINED_FUNCTION_2_0();
  v112[16] = v15;
  OUTLINED_FUNCTION_7_0();
  __chkstk_darwin(v16);
  OUTLINED_FUNCTION_9();
  uint64_t v18 = OUTLINED_FUNCTION_3_0(v17);
  v112[35] = type metadata accessor for ShowPlayVoicemailListView(v18);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v19);
  OUTLINED_FUNCTION_1_0();
  v112[34] = v20;
  uint64_t v21 = OUTLINED_FUNCTION_4_0();
  type metadata accessor for PlayVoicemailModel(v21);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v22);
  OUTLINED_FUNCTION_2_0();
  v112[32] = v23;
  OUTLINED_FUNCTION_7_0();
  __chkstk_darwin(v24);
  OUTLINED_FUNCTION_9();
  v112[33] = v25;
  uint64_t v26 = OUTLINED_FUNCTION_4_0();
  v112[15] = type metadata accessor for ShowCallHistoryListView(v26);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v27);
  OUTLINED_FUNCTION_1_0();
  uint64_t v29 = OUTLINED_FUNCTION_3_0(v28);
  type metadata accessor for SearchCallHistoryModel(v29);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v30);
  OUTLINED_FUNCTION_2_0();
  v112[12] = v31;
  OUTLINED_FUNCTION_7_0();
  __chkstk_darwin(v32);
  OUTLINED_FUNCTION_9();
  uint64_t v34 = OUTLINED_FUNCTION_3_0(v33);
  v112[31] = type metadata accessor for ContactConfirmationView(v34);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v35);
  OUTLINED_FUNCTION_1_0();
  v112[30] = v36;
  uint64_t v37 = OUTLINED_FUNCTION_4_0();
  type metadata accessor for ContactConfirmationModel(v37);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v38);
  OUTLINED_FUNCTION_2_0();
  v112[28] = v39;
  OUTLINED_FUNCTION_7_0();
  __chkstk_darwin(v40);
  OUTLINED_FUNCTION_9();
  v112[29] = v41;
  uint64_t v42 = OUTLINED_FUNCTION_4_0();
  v112[11] = type metadata accessor for StackedButtonsView(v42);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v43);
  OUTLINED_FUNCTION_1_0();
  uint64_t v45 = OUTLINED_FUNCTION_3_0(v44);
  v112[27] = type metadata accessor for LocalEmergencyCallDisambiguationView(v45);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v46);
  OUTLINED_FUNCTION_1_0();
  uint64_t v48 = OUTLINED_FUNCTION_3_0(v47);
  type metadata accessor for LocalEmergencyCallDisambiguationModel(v48);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v49);
  OUTLINED_FUNCTION_2_0();
  v112[24] = v50;
  OUTLINED_FUNCTION_7_0();
  __chkstk_darwin(v51);
  OUTLINED_FUNCTION_9();
  uint64_t v53 = OUTLINED_FUNCTION_3_0(v52);
  v112[23] = type metadata accessor for ForeignEmergencyCallDisambiguationView(v53);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v54);
  OUTLINED_FUNCTION_1_0();
  uint64_t v56 = OUTLINED_FUNCTION_3_0(v55);
  type metadata accessor for ForeignEmergencyCallDisambiguationModel(v56);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v57);
  OUTLINED_FUNCTION_2_0();
  v112[20] = v58;
  OUTLINED_FUNCTION_7_0();
  __chkstk_darwin(v59);
  OUTLINED_FUNCTION_9();
  uint64_t v61 = OUTLINED_FUNCTION_3_0(v60);
  v112[9] = type metadata accessor for EmergencyCountdownView(v61);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v62);
  OUTLINED_FUNCTION_1_0();
  uint64_t v64 = OUTLINED_FUNCTION_3_0(v63);
  type metadata accessor for EmergencyCountdownModel(v64);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v65);
  OUTLINED_FUNCTION_2_0();
  v112[6] = v66;
  OUTLINED_FUNCTION_7_0();
  __chkstk_darwin(v67);
  OUTLINED_FUNCTION_9();
  uint64_t v69 = OUTLINED_FUNCTION_3_0(v68);
  v112[3] = type metadata accessor for AppDisambiguationView(v69);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v70);
  OUTLINED_FUNCTION_1_0();
  uint64_t v72 = OUTLINED_FUNCTION_3_0(v71);
  v112[5] = type metadata accessor for AppDisambiguationViewSMART(v72);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v73);
  OUTLINED_FUNCTION_1_0();
  uint64_t v75 = OUTLINED_FUNCTION_3_0(v74);
  v112[42] = type metadata accessor for YesNoConfirmationView(v75);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v76);
  OUTLINED_FUNCTION_1_0();
  v112[41] = v77;
  uint64_t v78 = OUTLINED_FUNCTION_4_0();
  type metadata accessor for YesNoConfirmationModel(v78);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v79);
  OUTLINED_FUNCTION_2_0();
  v112[40] = v80;
  OUTLINED_FUNCTION_7_0();
  __chkstk_darwin(v81);
  OUTLINED_FUNCTION_9();
  v112[39] = v82;
  uint64_t v83 = OUTLINED_FUNCTION_4_0();
  uint64_t v116 = type metadata accessor for PhoneSnippetDataModels(v83);
  OUTLINED_FUNCTION_0_1();
  __chkstk_darwin(v84);
  OUTLINED_FUNCTION_2_0();
  uint64_t v114 = v85;
  OUTLINED_FUNCTION_7_0();
  uint64_t v87 = __chkstk_darwin(v86);
  v89 = (char *)v112 - v88;
  __chkstk_darwin(v87);
  v91 = (char *)v112 - v90;
  uint64_t v92 = type metadata accessor for Logger(0LL);
  uint64_t v93 = *(void *)(v92 - 8);
  uint64_t v94 = __chkstk_darwin(v92);
  v96 = (char *)v112 - ((v95 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v97 = Logger.phoneSnippetUI.unsafeMutableAddressor(v94);
  v98 = *(void (**)(char *, uint64_t, uint64_t))(v93 + 16);
  uint64_t v113 = v92;
  v98(v96, v97, v92);
  uint64_t v115 = a1;
  outlined init with copy of PhoneSnippetDataModels( a1,  (uint64_t)v91,  (uint64_t (*)(void))&type metadata accessor for PhoneSnippetDataModels);
  v100 = (os_log_s *)Logger.logObject.getter(v99);
  os_log_type_t v101 = static os_log_type_t.debug.getter();
  BOOL v102 = os_log_type_enabled(v100, v101);
  v112[38] = v5;
  if (v102)
  {
    v103 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v104 = swift_slowAlloc(32LL, -1LL);
    v112[1] = v2;
    uint64_t v105 = v104;
    uint64_t v119 = v104;
    *(_DWORD *)v103 = 136315138;
    v112[0] = v103 + 4;
    outlined init with copy of PhoneSnippetDataModels( (uint64_t)v91,  (uint64_t)v89,  (uint64_t (*)(void))&type metadata accessor for PhoneSnippetDataModels);
    uint64_t v106 = String.init<A>(describing:)(v89, v116);
    unint64_t v108 = v107;
    uint64_t v117 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v106, v107, &v119);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, v118, v112[0], v103 + 12);
    swift_bridgeObjectRelease(v108);
    outlined destroy of PhoneSnippetDataModels( (uint64_t)v91,  (uint64_t (*)(void))&type metadata accessor for PhoneSnippetDataModels);
    _os_log_impl(&dword_0, v100, v101, "#PhoneUIPlugin getting snippet for %s", v103, 0xCu);
    swift_arrayDestroy(v105, 1LL, (char *)&type metadata for Any + 8);
    OUTLINED_FUNCTION_0(v105);
    OUTLINED_FUNCTION_0((uint64_t)v103);
  }

  else
  {
    outlined destroy of PhoneSnippetDataModels( (uint64_t)v91,  (uint64_t (*)(void))&type metadata accessor for PhoneSnippetDataModels);
  }

  (*(void (**)(char *, uint64_t))(v93 + 8))(v96, v113);
  uint64_t v109 = v114;
  uint64_t v110 = v116;
  outlined init with copy of PhoneSnippetDataModels( v115,  v114,  (uint64_t (*)(void))&type metadata accessor for PhoneSnippetDataModels);
  v111 = (char *)sub_6B54 + 4 * byte_77A4[swift_getEnumCaseMultiPayload(v109, v110)];
  __asm { BR              X10 }
}

uint64_t sub_6B54()
{
  uint64_t v2 = *(void *)(v1 - 168);
  outlined init with take of SingleResultCallHistoryModel( v0,  v2,  (uint64_t (*)(void))&type metadata accessor for YesNoConfirmationModel);
  uint64_t v3 = *(void *)(v1 - 160);
  outlined init with take of SingleResultCallHistoryModel( v2,  v3,  (uint64_t (*)(void))&type metadata accessor for YesNoConfirmationModel);
  uint64_t v4 = *(void *)(v1 - 152);
  ((void (*)(uint64_t))YesNoConfirmationView.init(model:))(v3);
  OUTLINED_FUNCTION_11( &lazy protocol witness table cache variable for type YesNoConfirmationView and conformance YesNoConfirmationView,  v5,  (uint64_t)&protocol conformance descriptor for YesNoConfirmationView);
  uint64_t v7 = View.eraseToAnyView()(*(void *)(v1 - 144), v6);
  outlined destroy of PhoneSnippetDataModels( v4,  (uint64_t (*)(void))&type metadata accessor for YesNoConfirmationView);
  return v7;
}

void protocol witness for SnippetProviding.snippet(for:mode:idiom:) in conformance PhoneUIPlugin(uint64_t a1)
{
}

void outlined init with copy of PhoneSnippetDataModels( uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = OUTLINED_FUNCTION_13(a1, a2, a3);
  OUTLINED_FUNCTION_16(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL));
  OUTLINED_FUNCTION_12();
}

void outlined init with take of SingleResultCallHistoryModel( uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = OUTLINED_FUNCTION_13(a1, a2, a3);
  OUTLINED_FUNCTION_16(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32LL));
  OUTLINED_FUNCTION_12();
}

void outlined destroy of PhoneSnippetDataModels(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  OUTLINED_FUNCTION_12();
}

void associated type witness table accessor for SnippetProviding.SnippetPluginModelType : SnippetPluginModel in PhoneUIPlugin()
{
}

void lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView( unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  OUTLINED_FUNCTION_12();
}

  ;
}

  ;
}

  ;
}

uint64_t OUTLINED_FUNCTION_3_0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0LL;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return 0LL;
}

void OUTLINED_FUNCTION_5_0(uint64_t a1)
{
}

void OUTLINED_FUNCTION_6_0(uint64_t a1)
{
}

  ;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0;
}

  ;
}

void OUTLINED_FUNCTION_10(unint64_t *a1, uint64_t a2, uint64_t a3)
{
}

void OUTLINED_FUNCTION_11(unint64_t *a1, uint64_t a2, uint64_t a3)
{
}

  ;
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3(0LL);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}
uint64_t SystemXPCRequestExecutor.__allocating_init(targetConnection:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  swift_allocObject(v2, 32LL, 7LL);
  return SystemXPCRequestExecutor.init(targetConnection:)(a1, a2);
}

uint64_t SystemXPCRequestExecutor.init(targetConnection:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  swift_release();
  return v6;
}

uint64_t SystemXPCRequestExecutor.deinit()
{
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v1 = swift_retain(v3);
  dispatch thunk of XPCConnection.cancel()(v1);
  swift_release(v3);
  swift_release(*(void *)(v4 + 16));
  return v4;
}

uint64_t SystemXPCRequestExecutor.__deallocating_deinit()
{
  uint64_t v0 = SystemXPCRequestExecutor.deinit();
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t SystemXPCRequestExecutor.performRequest(_:using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[10] = v3;
  v4[9] = a3;
  v4[8] = a2;
  v4[7] = a1;
  v4[4] = v4;
  v4[2] = 0LL;
  v4[3] = 0LL;
  v4[5] = 0LL;
  v4[6] = 0LL;
  uint64_t v5 = type metadata accessor for XPCDictionary(0LL);
  v4[11] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[12] = v6;
  uint64_t v8 = *(void *)(v6 + 64);
  v4[13] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v4[14] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v4[2] = a1;
  v4[3] = a2;
  v4[5] = a3;
  v4[6] = v3;
  return swift_task_switch(SystemXPCRequestExecutor.performRequest(_:using:), 0LL);
}

uint64_t SystemXPCRequestExecutor.performRequest(_:using:)()
{
  uint64_t v19 = v0[14];
  uint64_t v17 = v0[13];
  uint64_t v18 = v0[12];
  uint64_t v20 = v0[11];
  v21 = (void *)v0[9];
  uint64_t v16 = v0[8];
  uint64_t v15 = v0[7];
  v0[4] = v0;
  XPCDictionary.init()();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("request", 7uLL, 1);
  uint64_t v1 = ViewHierarchyRequest.data.getter(v15, v16);
  XPCDictionary.subscript.setter(v1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v19, v20);
  id v2 = v21;
  uint64_t v23 = swift_task_alloc(32LL);
  *(void *)(v23 + 16) = v21;
  XPCDictionary.withUnsafeUnderlyingDictionary<A>(_:)(partial apply for closure #1 in SystemXPCRequestExecutor.performRequest(_:using:));
  uint64_t v12 = v14[14];
  uint64_t v9 = v14[13];
  uint64_t v8 = v14[12];
  uint64_t v10 = v14[11];
  uint64_t v11 = v14[10];
  id v7 = (id)v14[9];
  swift_task_dealloc(v23);

  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v14[15] = v3;
  v3(v9, v10);
  Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("performRequest(_:using:)", 0x18uLL, 1);
  v14[16] = v4._object;
  swift_retain(v11);
  uint64_t v13 = swift_task_alloc(32LL);
  v14[17] = v13;
  *(void *)(v13 + 16) = v11;
  *(void *)(v13 + 24) = v12;
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  v14[18] = v5;
  *uint64_t v5 = v14[4];
  v5[1] = SystemXPCRequestExecutor.performRequest(_:using:);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)( v22,  0LL,  0LL,  v4._countAndFlagsBits,  v4._object,  partial apply for closure #2 in SystemXPCRequestExecutor.performRequest(_:using:),  v13,  (char *)&type metadata for () + 8);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 144);
  *(void *)(v2 + 32) = *v1;
  v2 += 32LL;
  id v7 = (void *)(v2 - 16);
  *(void *)(v2 + 120) = v0;
  swift_task_dealloc(v3);
  if (v0) {
    return swift_task_switch(SystemXPCRequestExecutor.performRequest(_:using:), 0LL);
  }
  uint64_t v6 = v7[14];
  uint64_t v5 = v7[8];
  swift_task_dealloc(v7[15]);
  swift_release(v5);
  swift_bridgeObjectRelease(v6);
  return swift_task_switch(SystemXPCRequestExecutor.performRequest(_:using:), 0LL);
}

{
  void *v0;
  void (*v1)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t v1 = (void (*)(void))v0[15];
  uint64_t v3 = v0[14];
  Swift::String v4 = v0[13];
  v0[4] = v0;
  v1();
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0[4] + 8LL))();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v1 = v0[17];
  Swift::String v4 = v0[16];
  uint64_t v6 = (void (*)(uint64_t, uint64_t))v0[15];
  id v7 = v0[14];
  uint64_t v8 = v0[13];
  uint64_t v5 = v0[11];
  uint64_t v3 = v0[10];
  v0[4] = v0;
  swift_task_dealloc(v1);
  swift_release(v3);
  swift_bridgeObjectRelease(v4);
  v6(v7, v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0[4] + 8LL))();
}

uint64_t closure #1 in SystemXPCRequestExecutor.performRequest(_:using:)(void *a1, void *a2)
{
  Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fd", 2uLL, 1);
  unsigned int fd = [a2 fileDescriptor];
  uint64_t v7 = String.utf8CString.getter(v2._countAndFlagsBits, v2._object);
  swift_retain(v7);
  swift_release(v7);
  swift_retain(v7);
  swift_bridgeObjectRelease(v7);
  xpc_dictionary_set_fd(a1, (const char *)(v7 + 32), fd);
  swift_unknownObjectRelease(v7);
  return swift_bridgeObjectRelease(v2._object);
}

uint64_t partial apply for closure #1 in SystemXPCRequestExecutor.performRequest(_:using:)(void *a1)
{
  return closure #1 in SystemXPCRequestExecutor.performRequest(_:using:)(a1, *(void **)(v1 + 16));
}

uint64_t closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = a1;
  v8[1] = a2;
  uint64_t v10 = a3;
  uint64_t v24 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
  uint64_t v13 = *(void *)(v16 - 8);
  uint64_t v12 = *(void *)(v13 + 64);
  v8[0] = (v12 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v16);
  uint64_t v15 = (char *)v8 - v8[0];
  uint64_t v20 = type metadata accessor for XPCDictionary(0LL);
  uint64_t v18 = *(void *)(v20 - 8);
  unint64_t v9 = (*(void *)(v18 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v3 = __chkstk_darwin(v11);
  uint64_t v19 = (char *)v8 - v9;
  uint64_t v24 = v3;
  uint64_t v23 = v4;
  uint64_t v22 = v5;
  uint64_t v21 = *(void *)(v4 + 16);
  swift_retain(v21);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v19, v10, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v11, v16);
  uint64_t v6 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v14 = (v6 + 16) & ~v6;
  uint64_t v17 = swift_allocObject(&unk_100018750, v14 + v12, v6 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v17 + v14, v15, v16);
  dispatch thunk of XPCConnection.send(message:replyHandler:)( v19,  partial apply for closure #1 in closure #2 in SystemXPCRequestExecutor.performRequest(_:using:),  v17);
  swift_release(v17);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v20);
  return swift_release(v21);
}

uint64_t partial apply for closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(uint64_t a1)
{
  return closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t closure #1 in closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)( uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v24 = 0LL;
  uint64_t v23 = 0LL;
  v25 = 0LL;
  uint64_t v13 = type metadata accessor for XPCError(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  unint64_t v15 = (*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v10 - v15;
  v25 = (char *)&v10 - v15;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  unint64_t v19 = (*(void *)(*(void *)(v20 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v2 = __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v10 - v19;
  uint64_t v24 = v2;
  uint64_t v23 = v3;
  outlined init with copy of Result<XPCDictionary, XPCError>(v2, (uint64_t)&v10 - v19);
  if (swift_getEnumCaseMultiPayload(v21) == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v21, v13);
    v25 = v16;
    unint64_t v7 = lazy protocol witness table accessor for type XPCError and conformance XPCError();
    uint64_t v11 = swift_allocError(v13, v7, 0LL, 0LL);
    (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v8, v16, v13);
    uint64_t v12 = &v22;
    uint64_t v22 = v11;
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
    CheckedContinuation.resume(throwing:)(v12, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }

  else
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
    CheckedContinuation.resume<>()(v4);
    uint64_t v5 = type metadata accessor for XPCDictionary(0LL);
    return (*(uint64_t (**)(char *))(*(void *)(v5 - 8) + 8LL))(v21);
  }
}

uint64_t CheckedContinuation.resume<>()(uint64_t a1)
{
  return CheckedContinuation.resume(returning:)(a1, a1);
}

uint64_t protocol witness for RequestExecutor.performRequest(_:using:) in conformance SystemXPCRequestExecutor( uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc(dword_10001C384);
  *(void *)(v3 + 24) = v4;
  *uint64_t v4 = *(void *)(v3 + 16);
  v4[1] = protocol witness for RequestExecutor.performRequest(_:using:) in conformance SystemXPCRequestExecutor;
  return SystemXPCRequestExecutor.performRequest(_:using:)(a1, a2, a3);
}

void *protocol witness for RequestExecutor.performRequest(_:using:) in conformance SystemXPCRequestExecutor()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 24);
  *(void *)(v1 + 16) = *v0;
  uint64_t v4 = (void *)(v1 + 16);
  swift_task_dealloc(v2);
  return (*(void *(**)(void *__return_ptr))(*v4 + 8LL))(v4);
}

uint64_t type metadata accessor for SystemXPCRequestExecutor()
{
  return objc_opt_self(&OBJC_CLASS____TtC18ViewHierarchyAgent24SystemXPCRequestExecutor);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2((char *)a1 + (int)*a1, -(*a1 >> 32), 0LL);
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }

  return v4;
}

uint64_t sub_100004C4C()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>)
                 - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v5 = v2 + *(void *)(v1 + 64);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);
  return swift_deallocObject(v4, v5);
}

uint64_t partial apply for closure #1 in closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)( uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>)
                                      - 8)
                          + 80LL);
  return closure #1 in closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(a1, v1 + ((v2 + 16) & ~v2));
}

uint64_t outlined init with copy of Result<XPCDictionary, XPCError>(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  if (swift_getEnumCaseMultiPayload(a1) == 1)
  {
    uint64_t v3 = type metadata accessor for XPCError(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a2, a1);
    swift_storeEnumTagMultiPayload(a2, v7, 1LL);
  }

  else
  {
    uint64_t v2 = type metadata accessor for XPCDictionary(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a2, a1);
    swift_storeEnumTagMultiPayload(a2, v7, 0LL);
  }

  return a2;
}

unint64_t lazy protocol witness table accessor for type XPCError and conformance XPCError()
{
  uint64_t v3 = lazy protocol witness table cache variable for type XPCError and conformance XPCError;
  if (!lazy protocol witness table cache variable for type XPCError and conformance XPCError)
  {
    uint64_t v0 = type metadata accessor for XPCError(255LL);
    unint64_t v1 = ((uint64_t (*)(void *, uint64_t))swift_getWitnessTable)( &protocol conformance descriptor for XPCError,  v0);
    atomic_store( v1,  (unint64_t *)&lazy protocol witness table cache variable for type XPCError and conformance XPCError);
    return v1;
  }

  return v3;
}

void ViewHierarchyAgentError.errorDescription.getter(char a1)
{
  __asm { BR              X8 }

uint64_t sub_100004E70()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Invalid request", 0xFuLL, 1)._countAndFlagsBits;
}

void static ViewHierarchyAgentError.__derived_enum_equals(_:_:)(char a1)
{
  __asm { BR              X8 }

uint64_t sub_100004F78( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned __int8 a12)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_100004FC4
                                                                                       + dword_10000502C[a12]))( a1,  a2,  a3,  a4,  a5,  a6);
}

BOOL sub_100004FD4()
{
  return v1 == 0;
}

void ViewHierarchyAgentError.hash(into:)(uint64_t a1, char a2)
{
  __asm { BR              X8 }

uint64_t sub_10000508C()
{
  v1[1] = 0LL;
  v1[0] = 0LL;
  return ((uint64_t (*)(void *, void *, void *))Hasher.combine<A>(_:))( v1,  &type metadata for Int,  &protocol witness table for Int);
}

uint64_t ViewHierarchyAgentError.hashValue.getter(char a1)
{
  v3[1] = a1;
  v3[0] = a1;
  unint64_t v1 = lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
  return _hashValue<A>(for:)(v3, &type metadata for ViewHierarchyAgentError, v1);
}

unint64_t lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError()
{
  uint64_t v2 = lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError;
  if (!lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError)
  {
    unint64_t WitnessTable = swift_getWitnessTable( &protocol conformance descriptor for ViewHierarchyAgentError,  &type metadata for ViewHierarchyAgentError);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError);
    return WitnessTable;
  }

  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;
  uint64_t v2 = lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError;
  if (!lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError)
  {
    unint64_t WitnessTable = swift_getWitnessTable( &protocol conformance descriptor for ViewHierarchyAgentError,  &type metadata for ViewHierarchyAgentError);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError);
    return WitnessTable;
  }

  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;
  uint64_t v2 = lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError;
  if (!lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError)
  {
    unint64_t WitnessTable = swift_getWitnessTable( &protocol conformance descriptor for ViewHierarchyAgentError,  &type metadata for ViewHierarchyAgentError);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError);
    return WitnessTable;
  }

  return v2;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ViewHierarchyAgentError( char *a1)
{
  return v1 & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance ViewHierarchyAgentError()
{
  return ViewHierarchyAgentError.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance ViewHierarchyAgentError(uint64_t a1)
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ViewHierarchyAgentError( Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

void protocol witness for LocalizedError.errorDescription.getter in conformance ViewHierarchyAgentError()
{
}

uint64_t protocol witness for LocalizedError.failureReason.getter in conformance ViewHierarchyAgentError()
{
  return LocalizedError.failureReason.getter();
}

uint64_t protocol witness for LocalizedError.recoverySuggestion.getter in conformance ViewHierarchyAgentError()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t protocol witness for LocalizedError.helpAnchor.getter in conformance ViewHierarchyAgentError()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t protocol witness for Error._domain.getter in conformance ViewHierarchyAgentError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance ViewHierarchyAgentError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance ViewHierarchyAgentError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance ViewHierarchyAgentError()
{
  return Error._getEmbeddedNSError()();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ViewHierarchyAgentError(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFC) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 3) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }

    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }

    else
    {
LABEL_15:
      int v3 = *a1 - 4;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }

  else
  {
    int v5 = -1;
  }

  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for ViewHierarchyAgentError( _BYTE *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFC)
  {
    unsigned int v5 = ((a3 + 3) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }

    int v7 = v6;
  }

  if (a2 > 0xFC)
  {
    unsigned int v4 = ((a2 - 253) >> 8) + 1;
    *result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }

      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }

      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }

  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }

      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }

      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }

    if (a2) {
      *result = a2 + 3;
    }
  }

  return result;
}

uint64_t getEnumTag for ViewHierarchyAgentError(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for ViewHierarchyAgentError(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ViewHierarchyAgentError()
{
  return &type metadata for ViewHierarchyAgentError;
}

unint64_t base witness table accessor for Error in ViewHierarchyAgentError()
{
  return lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
}

unint64_t base witness table accessor for Equatable in ViewHierarchyAgentError()
{
  return lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
}

uint64_t one-time initialization function for logger()
{
  uint64_t v3 = type metadata accessor for Logger(0LL);
  __swift_allocate_value_buffer(v3, logger);
  __swift_project_value_buffer(v3, (uint64_t)logger);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchy", 0x1AuLL, 1);
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ViewHierarchyAgent", 0x12uLL, 1);
  return Logger.init(subsystem:category:)(v0._countAndFlagsBits, v0._object, v1._countAndFlagsBits, v1._object);
}

uint64_t logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    ((void (*)(uint64_t *, uint64_t (*)()))swift_once)( &one-time initialization token for logger,  one-time initialization function for logger);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  unsigned int v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc( *(void *)(*(void *)(a1 - 8) + 64LL),  *(_DWORD *)(*(void *)(a1 - 8) + 80LL));
    *a2 = v2;
    return v2;
  }

  return (uint64_t)v5;
}

uint64_t CaptureController.__allocating_init(requestExecutor:)(void *a1)
{
  return CaptureController.init(requestExecutor:)(a1);
}

uint64_t CaptureController.init(requestExecutor:)(void *a1)
{
  v84 = a1;
  v76 = "Fatal error";
  v77 = "ViewHierarchyAgent/CaptureController.swift";
  uint64_t v116 = 0LL;
  uint64_t v115 = 0LL;
  uint64_t v113 = 0LL;
  uint64_t v82 = 0LL;
  uint64_t v78 = type metadata accessor for Logger(0LL);
  uint64_t v79 = *(void *)(v78 - 8);
  unint64_t v80 = (*(void *)(v79 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v1 = __chkstk_darwin(0LL);
  v81 = (char *)&v47 - v80;
  uint64_t v92 = type metadata accessor for UUID(v1);
  uint64_t v90 = *(void *)(v92 - 8);
  unint64_t v83 = (*(void *)(v90 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v2 = __chkstk_darwin(v82);
  v91 = (char *)&v47 - v83;
  uint64_t v101 = type metadata accessor for URL(v2);
  uint64_t v99 = *(void *)(v101 - 8);
  uint64_t v86 = *(void *)(v99 + 64);
  unint64_t v85 = (v86 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v3 = __chkstk_darwin(v84);
  v95 = (char *)&v47 - v85;
  unint64_t v87 = (v86 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(v3);
  v103 = (char *)&v47 - v87;
  uint64_t v116 = v4;
  uint64_t v115 = v5;
  v88 = v120;
  outlined init with copy of RequestExecutor(v4, (uint64_t)v120);
  outlined init with take of RequestExecutor(v88, (void *)(v100 + 16));
  int v6 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  v97 = &SystemXPCRequestExecutor;
  id v89 = [v6 defaultManager];
  id v96 = [v89 temporaryDirectory];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v8 = UUID.init()(v7);
  uint64_t v93 = UUID.uuidString.getter(v8);
  uint64_t v94 = v9;
  (*(void (**)(char *, uint64_t))(v90 + 8))(v91, v92);
  URL.appendingPathComponent(_:)(v93, v94);
  uint64_t v10 = v103;
  swift_bridgeObjectRelease(v94);
  v102 = *(void (**)(char *, uint64_t))(v99 + 8);
  v102(v95, v101);

  v98 = &SystemXPCRequestExecutor;
  (*(void (**)(uint64_t, char *, uint64_t))(v99 + 32))( v100 + OBJC_IVAR____TtC18ViewHierarchyAgent17CaptureController_temporaryDirectory,  v10,  v101);
  v119 = 0LL;
  uint64_t v11 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v106 = [v11 v97[10].name];
  (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v10, (char *)v98[15].ivars + v100, v101);
  URL._bridgeToObjectiveC()(v12);
  id v105 = v13;
  v102(v103, v101);
  id v114 = v119;
  unsigned int v107 = [v106 createDirectoryAtURL:v105 withIntermediateDirectories:1 attributes:0 error:&v114];
  id v104 = v114;
  id v14 = v114;
  unint64_t v15 = v119;
  v119 = v104;

  if ((v107 & 1) == 0)
  {
    while (1)
    {
      id v47 = v119;
      uint64_t v48 = _convertNSErrorToError(_:)();

      swift_willThrow();
      uint64_t v20 = v81;
      uint64_t v66 = 0LL;
      swift_errorRetain(v48);
      uint64_t v113 = v48;
      uint64_t v21 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v20, v21, v78);
      swift_errorRetain(v48);
      uint64_t v54 = 7LL;
      uint64_t v22 = swift_allocObject(&unk_100018898, 24LL, 7LL);
      uint64_t v23 = v48;
      uint64_t v55 = v22;
      *(void *)(v22 + 16) = v48;
      v60 = (os_log_s *)Logger.logObject.getter(v23);
      int v61 = static os_log_type_t.fault.getter();
      v51 = &v111;
      uint64_t v111 = 12LL;
      unint64_t v49 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v50 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v24 = lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)(&v112, v51, &type metadata for UInt32, &type metadata for Int, v49, v50, v24);
      uint32_t v62 = v112;
      uint64_t v52 = 17LL;
      uint64_t v25 = swift_allocObject(&unk_1000188C0, 17LL, v54);
      uint64_t v26 = v52;
      uint64_t v27 = v54;
      uint64_t v71 = v25;
      *(_BYTE *)(v25 + 16) = 32;
      uint64_t v28 = swift_allocObject(&unk_1000188E8, v26, v27);
      uint64_t v29 = v54;
      uint64_t v64 = v28;
      *(_BYTE *)(v28 + 16) = 8;
      uint64_t v53 = 32LL;
      uint64_t v30 = swift_allocObject(&unk_100018910, 32LL, v29);
      uint64_t v31 = v53;
      uint64_t v32 = v54;
      uint64_t v33 = v30;
      uint64_t v34 = v55;
      uint64_t v56 = v33;
      *(void *)(v33 + 16) = partial apply for implicit closure #1 in CaptureController.init(requestExecutor:);
      *(void *)(v33 + 24) = v34;
      uint64_t v35 = swift_allocObject(&unk_100018938, v31, v32);
      uint64_t v36 = v56;
      uint64_t v65 = v35;
      *(void *)(v35 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
      *(void *)(v35 + 24) = v36;
      uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v57 = _allocateUninitializedArray<A>(_:)(3LL);
      v58 = v37;
      swift_retain(v71);
      uint64_t v38 = v64;
      uint64_t v39 = v71;
      v40 = v58;
      void *v58 = partial apply for closure #1 in OSLogArguments.append(_:);
      v40[1] = v39;
      swift_retain(v38);
      uint64_t v41 = v65;
      uint64_t v42 = v64;
      v43 = v58;
      v58[2] = closure #1 in OSLogArguments.append(_:)partial apply;
      v43[3] = v42;
      swift_retain(v41);
      uint64_t v44 = v57;
      uint64_t v45 = v65;
      v46 = v58;
      v58[4] = partial apply for closure #1 in OSLogArguments.append(_:);
      v46[5] = v45;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease(v44);
      if (os_log_type_enabled(v60, (os_log_type_t)v61))
      {
        uint64_t v17 = v66;
        v68 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
        uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v69 = createStorage<A>(capacity:type:)(0LL, v67, v67);
        uint64_t v70 = createStorage<A>(capacity:type:)( 1LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
        v72 = &v110;
        v110 = v68;
        v73 = &v118;
        uint64_t v118 = v69;
        v74 = &v117;
        uint64_t v117 = v70;
        serialize(_:at:)(2LL, &v110);
        serialize(_:at:)(1LL, v72);
        v108 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        uint64_t v109 = v71;
        closure #1 in osLogInternal(_:log:type:)(&v108, (uint64_t)v72, (uint64_t)v73, (uint64_t)v74);
        uint64_t v75 = v17;
        if (v17)
        {
          __break(1u);
        }

        else
        {
          v108 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          uint64_t v109 = v64;
          closure #1 in osLogInternal(_:log:type:)(&v108, (uint64_t)&v110, (uint64_t)&v118, (uint64_t)&v117);
          uint64_t v63 = 0LL;
          v108 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
          uint64_t v109 = v65;
          closure #1 in osLogInternal(_:log:type:)(&v108, (uint64_t)&v110, (uint64_t)&v118, (uint64_t)&v117);
          _os_log_impl( (void *)&_mh_execute_header,  v60,  (os_log_type_t)v61,  "Failed to remove temporary directory: %s",  v68,  v62);
          destroyStorage<A>(_:count:)(v69, 0LL);
          destroyStorage<A>(_:count:)(v70, 1LL);
          UnsafeMutablePointer.deallocate()();
          swift_release(v71);
          swift_release(v64);
          swift_release(v65);
        }
      }

      else
      {
        swift_release(v71);
        swift_release(v64);
        swift_release(v65);
      }

      (*(void (**)(char *, uint64_t))(v79 + 8))(v81, v78);
      uint64_t v18 = implicit closure #1 in default argument 0 of fatalError(_:file:line:)();
      uint64_t vars0 = 26LL;
      LODWORD(vars8) = 0;
      _assertionFailure(_:_:file:line:flags:)(v76, 11LL, 2LL, v18, v19, v77, 42LL);
      __break(1u);
    }
  }

  __swift_destroy_boxed_opaque_existential_1(v84);
  return v100;
}

uint64_t outlined init with copy of RequestExecutor(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

void *outlined init with take of RequestExecutor(const void *a1, void *__dst)
{
  return __dst;
}

uint64_t implicit closure #1 in CaptureController.init(requestExecutor:)(uint64_t a1)
{
  return Error.localizedDescription.getter(v2[1], v2[2]);
}

uint64_t sub_100006568()
{
  return swift_deallocObject(v2, 24LL, 7LL);
}

uint64_t partial apply for implicit closure #1 in CaptureController.init(requestExecutor:)()
{
  return implicit closure #1 in CaptureController.init(requestExecutor:)(*(void *)(v0 + 16));
}

uint64_t CaptureController.deinit()
{
  uint64_t v85 = 0LL;
  uint64_t v83 = 0LL;
  uint64_t v63 = 0LL;
  uint64_t v64 = type metadata accessor for Logger(0LL);
  uint64_t v65 = *(void *)(v64 - 8);
  unint64_t v66 = (*(void *)(v65 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v0 = __chkstk_darwin(0LL);
  uint64_t v67 = (char *)&v34 - v66;
  uint64_t v71 = type metadata accessor for URL(v0);
  uint64_t v70 = *(void *)(v71 - 8);
  unint64_t v68 = (*(void *)(v70 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v71);
  uint64_t v1 = (char *)&v34 - v68;
  v72 = (char *)&v34 - v68;
  uint64_t v85 = v2;
  v88 = 0LL;
  id v76 = [(id)objc_opt_self(NSFileManager) defaultManager];
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))( v1,  v69 + OBJC_IVAR____TtC18ViewHierarchyAgent17CaptureController_temporaryDirectory,  v71);
  URL._bridgeToObjectiveC()(v3);
  id v75 = v4;
  v73 = *(void (**)(char *, uint64_t))(v70 + 8);
  v73(v72, v71);
  id v84 = v88;
  unsigned int v77 = [v76 removeItemAtURL:v75 error:&v84];
  id v74 = v84;
  id v5 = v84;
  int v6 = v88;
  v88 = v74;

  if ((v77 & 1) == 0)
  {
    id v34 = v88;
    uint64_t v46 = _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v9 = v67;
    uint64_t v53 = 0LL;
    swift_errorRetain(v46);
    uint64_t v83 = v46;
    uint64_t v10 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v9, v10, v64);
    swift_errorRetain(v46);
    uint64_t v40 = 7LL;
    uint64_t v41 = swift_allocObject(&unk_100018960, 24LL, 7LL);
    *(void *)(v41 + 16) = v46;
    id v47 = (os_log_s *)Logger.logObject.getter();
    int v48 = static os_log_type_t.fault.getter();
    v37 = &v81;
    uint64_t v81 = 12LL;
    unint64_t v35 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v36 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v11 = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)(&v82, v37, &type metadata for UInt32, &type metadata for Int, v35, v36, v11);
    uint32_t v49 = v82;
    uint64_t v38 = 17LL;
    uint64_t v12 = swift_allocObject(&unk_100018988, 17LL, v40);
    uint64_t v13 = v38;
    uint64_t v14 = v40;
    uint64_t v58 = v12;
    *(_BYTE *)(v12 + 16) = 32;
    uint64_t v15 = swift_allocObject(&unk_1000189B0, v13, v14);
    uint64_t v16 = v40;
    uint64_t v51 = v15;
    *(_BYTE *)(v15 + 16) = 8;
    uint64_t v39 = 32LL;
    uint64_t v17 = swift_allocObject(&unk_1000189D8, 32LL, v16);
    uint64_t v18 = v39;
    uint64_t v19 = v40;
    uint64_t v20 = v17;
    uint64_t v21 = v41;
    uint64_t v42 = v20;
    *(void *)(v20 + 16) = partial apply for implicit closure #1 in CaptureController.deinit;
    *(void *)(v20 + 24) = v21;
    uint64_t v22 = swift_allocObject(&unk_100018A00, v18, v19);
    uint64_t v23 = v42;
    uint64_t v52 = v22;
    *(void *)(v22 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
    *(void *)(v22 + 24) = v23;
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v43 = _allocateUninitializedArray<A>(_:)(3LL);
    uint64_t v44 = v24;
    swift_retain(v58);
    uint64_t v25 = v51;
    uint64_t v26 = v58;
    uint64_t v27 = v44;
    *uint64_t v44 = closure #1 in OSLogArguments.append(_:)partial apply;
    v27[1] = v26;
    swift_retain(v25);
    uint64_t v28 = v52;
    uint64_t v29 = v51;
    uint64_t v30 = v44;
    v44[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v30[3] = v29;
    swift_retain(v28);
    uint64_t v31 = v43;
    uint64_t v32 = v52;
    uint64_t v33 = v44;
    v44[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v33[5] = v32;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease(v31);
    if (os_log_type_enabled(v47, (os_log_type_t)v48))
    {
      uint64_t v8 = v53;
      uint64_t v55 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v56 = createStorage<A>(capacity:type:)(0LL, v54, v54);
      uint64_t v57 = createStorage<A>(capacity:type:)( 1LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
      uint64_t v59 = &v80;
      unint64_t v80 = v55;
      v60 = &v87;
      uint64_t v87 = v56;
      int v61 = &v86;
      uint64_t v86 = v57;
      serialize(_:at:)(2LL, &v80);
      serialize(_:at:)(1LL, v59);
      uint64_t v78 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v79 = v58;
      closure #1 in osLogInternal(_:log:type:)(&v78, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61);
      uint64_t v62 = v8;
      if (v8)
      {
        __break(1u);
      }

      else
      {
        uint64_t v78 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v79 = v51;
        closure #1 in osLogInternal(_:log:type:)(&v78, (uint64_t)&v80, (uint64_t)&v87, (uint64_t)&v86);
        uint64_t v50 = 0LL;
        uint64_t v78 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v79 = v52;
        closure #1 in osLogInternal(_:log:type:)(&v78, (uint64_t)&v80, (uint64_t)&v87, (uint64_t)&v86);
        _os_log_impl( (void *)&_mh_execute_header,  v47,  (os_log_type_t)v48,  "Failed to remove temporary directory: %s",  v55,  v49);
        destroyStorage<A>(_:count:)(v56, 0LL);
        destroyStorage<A>(_:count:)(v57, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v58);
        swift_release(v51);
        swift_release(v52);
      }
    }

    else
    {
      swift_release(v58);
      swift_release(v51);
      swift_release(v52);
    }

    (*(void (**)(char *, uint64_t))(v65 + 8))(v67, v64);
    swift_errorRelease(v46);
    swift_errorRelease(v46);
  }

  __swift_destroy_boxed_opaque_existential_1((void *)(v69 + 16));
  v73((char *)(v69 + OBJC_IVAR____TtC18ViewHierarchyAgent17CaptureController_temporaryDirectory), v71);
  return v69;
}

uint64_t implicit closure #1 in CaptureController.deinit(uint64_t a1)
{
  return Error.localizedDescription.getter(v2[1], v2[2]);
}

uint64_t CaptureController.__deallocating_deinit()
{
  uint64_t v0 = CaptureController.deinit();
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t CaptureController.performRequest(_:using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[15] = v3;
  v4[14] = a3;
  v4[13] = a2;
  v4[12] = a1;
  v4[9] = v4;
  v4[7] = 0LL;
  v4[8] = 0LL;
  v4[10] = 0LL;
  v4[11] = 0LL;
  v4[7] = a1;
  v4[8] = a2;
  v4[10] = a3;
  v4[11] = v3;
  return swift_task_switch(CaptureController.performRequest(_:using:), 0LL);
}

uint64_t CaptureController.performRequest(_:using:)()
{
  uint64_t v1 = v0[15];
  v0[9] = v0;
  outlined init with copy of RequestExecutor(v1 + 16, (uint64_t)(v0 + 2));
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v6);
  uint64_t v2 = *(int **)(v7 + 8);
  uint64_t v8 = (int *)((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc(v2[1]);
  v5[16] = v3;
  *uint64_t v3 = v5[9];
  v3[1] = CaptureController.performRequest(_:using:);
  return ((uint64_t (*)(void, void, void, uint64_t, uint64_t))v8)(v5[12], v5[13], v5[14], v6, v7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 128);
  *(void *)(v2 + 72) = *v1;
  *(void *)(v2 + 136) = v0;
  swift_task_dealloc(v3);
  if (v0) {
    return swift_task_switch(CaptureController.performRequest(_:using:), 0LL);
  }
  else {
    return swift_task_switch(CaptureController.performRequest(_:using:), 0LL);
  }
}

{
  uint64_t v0;
  *(void *)(v0 + 72) = v0;
  __swift_destroy_boxed_opaque_existential_1((void *)(v0 + 16));
  return (*(uint64_t (**)(void))(*(void *)(v0 + 72) + 8LL))();
}

{
  uint64_t v0;
  uint64_t v2;
  *(void *)(v0 + 72) = v0;
  __swift_destroy_boxed_opaque_existential_1((void *)(v0 + 16));
  return (*(uint64_t (**)(void))(*(void *)(v2 + 72) + 8LL))();
}

uint64_t CaptureController.createTemporaryFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v31 = 0LL;
  uint64_t v30 = 0LL;
  v9[1] = 0LL;
  uint64_t v17 = type metadata accessor for UUID();
  uint64_t v15 = *(void *)(v17 - 8);
  unint64_t v10 = (*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v1 = __chkstk_darwin(0LL);
  uint64_t v16 = (char *)v9 - v10;
  uint64_t v27 = type metadata accessor for URL(v1);
  uint64_t v20 = *(void *)(v27 - 8);
  uint64_t v12 = *(void *)(v20 + 64);
  unint64_t v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v27);
  uint64_t v21 = (char *)v9 - v11;
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v2 = __chkstk_darwin((char *)v9 - v11);
  uint64_t v29 = (char *)v9 - v13;
  uint64_t v31 = (char *)v9 - v13;
  uint64_t v30 = v14;
  uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  uint64_t v4 = v26(v2, v14 + OBJC_IVAR____TtC18ViewHierarchyAgent17CaptureController_temporaryDirectory);
  uint64_t v5 = UUID.init()(v4);
  uint64_t v18 = UUID.uuidString.getter(v5);
  uint64_t v19 = v6;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v16, v17);
  URL.appendingPathComponent(_:)(v18, v19);
  swift_bridgeObjectRelease(v19);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v20 + 8);
  v28(v21, v27);
  id v24 = [(id)objc_opt_self(NSFileManager) defaultManager];
  URL.path.getter();
  uint64_t v22 = v7;
  id v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  objc_msgSend(v24, "createFileAtPath:contents:attributes:", v23, 0);

  ((void (*)(uint64_t, char *, uint64_t))v26)(v25, v29, v27);
  return ((uint64_t (*)(char *, uint64_t))v28)(v29, v27);
}

uint64_t implicit closure #1 in default argument 0 of fatalError(_:file:line:)()
{
  return 0LL;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  uint64_t v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return WitnessTable;
  }

  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;
  uint64_t v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return WitnessTable;
  }

  return v2;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }

  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;
  uint64_t v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }

  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;
  uint64_t v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }

  return v2;
}

uint64_t createStorage<A>(capacity:type:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    return static UnsafeMutablePointer.allocate(capacity:)(a1, a3);
  }
  else {
    return 0LL;
  }
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void destroyStorage<A>(_:count:)(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    UnsafeMutablePointer.deinitialize(count:)(a2);
    UnsafeMutablePointer.deallocate()();
  }

Swift::Void __swiftcall Array._endMutation()()
{
  *uint64_t v0 = *v0;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

void *closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  uint64_t v9 = v5;
  uint64_t v6 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v5, a3);
  uint64_t v10 = *a1;
  uint64_t v12 = v6;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  swift_bridgeObjectRelease(v9);
  result = a1;
  *a1 = v10 + 8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = specialized _StringGuts._deconstructUTF8<A>(scratch:)((uint64_t)&v17, 0LL, 0LL, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }

    __swift_destroy_boxed_opaque_existential_0(v12);
  }

  else
  {
    v13[3] = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }

    swift_bridgeObjectRetain(a2);
    __swift_destroy_boxed_opaque_existential_0(v13);
  }

  return v11;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)( uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v25 = a6;
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }

      else
      {
        int64_t v16 = 0LL;
      }

      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v22[0] = a5;
          v22[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(v22, v15, a2);
          UnsafeMutableRawBufferPointer.subscript.setter(0LL, v15, a2, a3);
          *uint64_t v17 = a2;
          uint64_t v11 = 0LL;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v22[2] = v11;
          v22[3] = v12;
          char v23 = v13 & 1;
          char v24 = v14 & 1;
          return (uint64_t)v11;
        }

        goto LABEL_28;
      }
    }

LABEL_13:
    uint64_t v6 = _StringGuts._allocateForDeconstruct()(a5, a6);
    *uint64_t v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0LL)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }

    __break(1u);
  }

  result = _StringObject.sharedUTF8.getter(a5, a6);
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  *uint64_t v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0LL;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }

  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }

  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)( const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *_StringGuts._allocateForDeconstruct()(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  uint64_t v4 = v6[2];
  specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v4);
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v4, 0);
  specialized Array._endMutation()();
  swift_retain(v6);
  uint64_t v5 = specialized Array.count.getter((uint64_t)v6);
  swift_bridgeObjectRelease(v6);
  result = (void *)v5;
  if (!__OFSUB__(v5, 1LL)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2)
{
  v10[2] = a2;
  if ((a2 & 0x1000000000000000LL) != 0)
  {
    uint64_t v7 = String.UTF8View._foreignCount()();
  }

  else if ((a2 & 0x2000000000000000LL) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }

  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }

  if (!v7) {
    return specialized ContiguousArray.init()();
  }
  uint64_t v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v7, 0LL);
  swift_retain(v5);
  swift_release(v5);
  result = (void *)_StringGuts.copyUTF8(into:)(v5 + 4, v7, a1, a2);
  uint64_t v6 = result;
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    swift_bridgeObjectRetain();
    result = v10;
    v10[0] = 0LL;
    v10[1] = 0xE000000000000000LL;
    outlined destroy of String.UTF8View((uint64_t)v10);
    if (v6 == (void *)v7) {
      return v5;
    }
  }

  __break(1u);
  return result;
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = specialized Array.count.getter(*v3);
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0,  v2 + 1,  1,  *v3);
    *char v3 = result;
  }

  return result;
}

uint64_t specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24LL) >> 1 < result + 1)
  {
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( *(void *)(*(void *)v1 + 24LL) >> 1 != 0LL,  result + 1,  1,  *v2);
    *uint64_t v2 = result;
  }

  return result;
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release(v4);
  uint64_t v6 = *v2;
  swift_retain(*v2);
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release(v6);
}

void specialized Array._endMutation()()
{
  *uint64_t v0 = *v0;
}

uint64_t specialized Array.count.getter(uint64_t a1)
{
  return specialized Array._getCount()(a1);
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)( uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v6 = (void *)swift_allocObject(v2, v7 + 32, 7LL);
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      size_t v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain(v6);
      v6[2] = a1;
      v6[3] = 2 * (v4 - (void)(v6 + 4));
    }

    else
    {
      swift_retain(v6);
      v6[2] = a1;
      v6[3] = 2 * v7;
    }

    swift_release(v6);
    return v6;
  }

  else
  {
    swift_retain(&_swiftEmptyArrayStorage);
    return &_swiftEmptyArrayStorage;
  }

void *specialized ContiguousArray.init()()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t result = swift_retain(a4);
  uint64_t v16 = *(void *)(a4 + 24) >> 1;
  if ((a3 & 1) != 0)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2LL) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }

      if (2 * v16 < a2) {
        uint64_t v11 = a2;
      }
      else {
        uint64_t v11 = 2 * v16;
      }
    }

    else
    {
      uint64_t v11 = *(void *)(a4 + 24) >> 1;
    }
  }

  else
  {
    uint64_t v11 = a2;
  }

  int64_t v10 = *(void *)(a4 + 16);
  if (v11 < v10) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v11;
  }
  if (v9)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v8 = (void *)swift_allocObject(v5, v9 + 32, 7LL);
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      size_t v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain(v8);
      void v8[2] = v10;
      v8[3] = 2 * (v6 - (void)(v8 + 4));
    }

    else
    {
      swift_retain(v8);
      void v8[2] = v10;
      v8[3] = 2 * v9;
    }

    swift_release(v8);
    uint64_t v7 = (char *)v8;
  }

  else
  {
    swift_retain(&_swiftEmptyArrayStorage);
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  }

  if ((a1 & 1) != 0)
  {
    swift_release(a4);
    swift_bridgeObjectRelease(a4);
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0LL;
    swift_release(a4);
  }

  else
  {
    swift_bridgeObjectRelease(a4);
    swift_release(a4);
    swift_retain(a4);
    swift_release(a4);
    specialized UnsafeMutablePointer.initialize(from:count:)((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease(a4);
  }

  return (uint64_t)v7;
}

uint64_t specialized Array._getCount()(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  size_t v4 = *result;
  *size_t v4 = a4;
  void *result = v4 + 1;
  return result;
}

uint64_t sub_10000846C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

_BYTE **partial apply for closure #1 in OSLogArguments.append(_:)(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000849C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

_BYTE **closure #1 in OSLogArguments.append(_:)partial apply(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000084CC()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100008514()
{
  return swift_deallocObject(v2, 32LL);
}

void *partial apply for closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _finalizeUninitializedArray<A>(_:)()
{
}

uint64_t __swift_destroy_boxed_opaque_existential_1(void *a1)
{
  uint64_t v2 = a1[3];
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80LL) & 0x20000) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void *))(*(void *)(v2 - 8) + 8LL))(a1);
  }
}

uint64_t sub_100008604()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t partial apply for implicit closure #1 in CaptureController.deinit()
{
  return implicit closure #1 in CaptureController.deinit(*(void *)(v0 + 16));
}

uint64_t sub_100008648()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_100008678()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_1000086A8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000086F0()
{
  return swift_deallocObject(v2, 32LL);
}

void *closure #1 in OSLogArguments.append(_:)partial apply(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80LL);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16LL) & ~(unint64_t)v2));
  }
  return result;
}

uint64_t ObjC metadata update function for CaptureController()
{
  return type metadata accessor for CaptureController(0LL);
}

uint64_t type metadata accessor for CaptureController(uint64_t a1)
{
  uint64_t v2 = type metadata singleton initialization cache for CaptureController;
  if (!type metadata singleton initialization cache for CaptureController) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CaptureController);
  }
  return v2;
}

uint64_t type metadata completion function for CaptureController(uint64_t a1)
{
  v6[0] = "(";
  uint64_t v1 = type metadata accessor for URL(319LL);
  uint64_t updated = v1;
  if (v2 <= 0x3F)
  {
    v6[1] = *(void *)(v1 - 8) + 64LL;
    uint64_t updated = swift_updateClassMetadata2(a1, 256LL, 2LL, v6, a1 + 80);
    if (!updated) {
      return 0LL;
    }
  }

  return updated;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(void *a1)
{
  uint64_t v2 = a1[3];
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80LL) & 0x20000) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void *))(*(void *)(v2 - 8) + 8LL))(a1);
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1LL;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String.UTF8View( uint64_t a1)
{
}

Swift::Void __swiftcall enterSandbox()()
{
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchyAgent", 0x1FuLL, 1);
  uint64_t v9 = String.utf8CString.getter(v0._countAndFlagsBits, v0._object);
  swift_retain(v9);
  swift_release(v9);
  swift_retain(v9);
  swift_bridgeObjectRelease(v9);
  char v10 = _set_user_dir_suffix(v9 + 32);
  swift_unknownObjectRelease(v9);
  swift_bridgeObjectRelease(v0._object);
  if ((v10 & 1) != 0)
  {
    uint64_t v7 = confstr(_:)(65537);
    uint64_t v8 = v1;
    if (v1)
    {
      String.realpath.getter(v7, v1);
      uint64_t v5 = v2;
      swift_bridgeObjectRelease(v8);
      uint64_t v6 = v5;
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    if (v6)
    {
      swift_bridgeObjectRelease(v6);
      return;
    }

    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "Unable to read _CS_DARWIN_USER_TEMP_DIR",  0x27uLL,  1);
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v3._countAndFlagsBits,  v3._object,  "ViewHierarchyAgent/SandboxUtils.swift",  37LL);
    __break(1u);
  }

  Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "Could not create temporary directory.",  0x25uLL,  1);
  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v4._countAndFlagsBits,  v4._object,  "ViewHierarchyAgent/SandboxUtils.swift",  37LL);
  __break(1u);
}

uint64_t confstr(_:)(int a1)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  int v16 = a1;
  int v12 = 1024;
  unint64_t v6 = lazy protocol witness table accessor for type Int and conformance Int();
  unint64_t v7 = lazy protocol witness table accessor for type Int and conformance Int();
  unint64_t v1 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  SignedInteger<>.init<A>(_:)(&v13, &v12, &type metadata for Int, &type metadata for Int32, v6, v7, v1);
  uint64_t v14 = Data.init(repeating:count:)(0LL, v13);
  uint64_t v15 = v2;
  int v10 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  Data.withUnsafeMutableBytes<A>(_:)(&v11, partial apply for closure #1 in confstr(_:), v9, v3);
  uint64_t v5 = v11;
  outlined destroy of Data((uint64_t)&v14);
  return v5;
}

uint64_t String.realpath.getter(uint64_t a1, uint64_t a2)
{
  v11[2] = a1;
  v11[3] = a2;
  swift_bridgeObjectRetain(a2);
  uint64_t v8 = String.utf8CString.getter(a1, a2);
  swift_retain(v8);
  swift_release(v8);
  swift_retain(v8);
  swift_bridgeObjectRelease(v8);
  int v10 = realpath_DARWIN_EXTSN((const char *)(v8 + 32), 0LL);
  swift_unknownObjectRelease(v8);
  swift_bridgeObjectRelease(a2);
  if (!v10) {
    return 0LL;
  }
  uint64_t v4 = String.init(cString:)();
  uint64_t v5 = v2;
  swift_bridgeObjectRetain(v2);
  v11[0] = v4;
  v11[1] = v5;
  UnsafeMutablePointer.deallocate()();
  outlined destroy of String?((uint64_t)v11);
  return v4;
}

unint64_t lazy protocol witness table accessor for type Int32 and conformance Int32()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int32, &type metadata for Int32);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }

  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;
  uint64_t v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int32, &type metadata for Int32);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }

  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;
  uint64_t v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int32, &type metadata for Int32);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }

  return v2;
}

int64_t closure #1 in confstr(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int64_t *a4@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  int v20 = a3;
  if (a1)
  {
    if (a2) {
      uint64_t v13 = a2 - a1;
    }
    else {
      __break(1u);
    }
    if (v13 < 0)
    {
      _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  71LL,  0);
      __break(1u);
    }

    uint64_t v4 = UnsafeMutableBufferPointer.baseAddress.getter(a1, v13, &type metadata for Int8);
  }

  else
  {
    uint64_t v4 = UnsafeMutableBufferPointer.baseAddress.getter(0LL, 0LL, &type metadata for Int8);
  }

  int v12 = (char *)v4;
  int v18 = 1024;
  unint64_t v10 = lazy protocol witness table accessor for type Int and conformance Int();
  unint64_t v11 = lazy protocol witness table accessor for type Int and conformance Int();
  unint64_t v5 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  SignedInteger<>.init<A>(_:)(&v19, &v18, &type metadata for Int, &type metadata for Int32, v10, v11, v5);
  int64_t result = confstr(a3, v12, v19);
  if (result <= 0)
  {
    *a4 = 0LL;
    a4[1] = 0LL;
  }

  else
  {
    if (a1)
    {
      if (a2) {
        uint64_t v9 = a2 - a1;
      }
      else {
        __break(1u);
      }
      if (v9 < 0)
      {
        LOBYTE(v8) = 2;
        _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v8,  71LL,  0);
        __break(1u);
      }

      int64_t result = UnsafeMutableBufferPointer.baseAddress.getter(a1, v9, &type metadata for Int8);
    }

    else
    {
      int64_t result = UnsafeMutableBufferPointer.baseAddress.getter(0LL, 0LL, &type metadata for Int8);
    }

    if (result)
    {
      int64_t result = String.init(cString:)();
      *a4 = result;
      a4[1] = v7;
    }

    else
    {
      *a4 = 0LL;
      a4[1] = 0LL;
    }
  }

  return result;
}

int64_t partial apply for closure #1 in confstr(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, int64_t *a3@<X8>)
{
  return closure #1 in confstr(_:)(a1, a2, *(_DWORD *)(v3 + 16), a3);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of Data( uint64_t a1)
{
}

uint64_t outlined consume of Data._Representation(uint64_t result, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release(result);
    return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
  }

  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String?( uint64_t a1)
{
}

uint64_t ViewHierarchyRequest.data.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = a1;
  uint64_t v22 = a2;
  size_t v19 = "Fatal error";
  int v20 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v21 = "ViewHierarchyAgent/ViewHierarchyRequest.swift";
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v24 = type metadata accessor for String.Encoding(0LL);
  uint64_t v25 = *(void *)(v24 - 8);
  unint64_t v26 = (*(void *)(v25 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v27 = (char *)&v8 - v26;
  uint64_t v30 = __chkstk_darwin(v23);
  uint64_t v31 = v2;
  uint64_t v17 = v23;
  uint64_t v18 = v22;
  uint64_t v14 = v22;
  uint64_t v13 = v23;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v28 = v13;
  uint64_t v29 = v14;
  static String.Encoding.utf8.getter(v3);
  char v4 = default argument 1 of String.data(using:allowLossyConversion:)();
  uint64_t v15 = String.data(using:allowLossyConversion:)(v27, v4 & 1, v13, v14);
  uint64_t v16 = v5;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  if ((v16 & 0xF000000000000000LL) == 0xF000000000000000LL)
  {
    char v7 = 2;
    _assertionFailure(_:_:file:line:flags:)(v19, 11LL, 2LL, v20, 57LL, 2LL, v21, 45LL, v7, 23LL, 0);
    __break(1u);
  }

  else
  {
    uint64_t v11 = v15;
    uint64_t v12 = v16;
  }

  uint64_t v10 = v12;
  uint64_t v9 = v11;
  swift_bridgeObjectRelease(v14);
  return v9;
}

uint64_t default argument 1 of String.data(using:allowLossyConversion:)()
{
  return 0LL;
}

void *initializeBufferWithCopyOfBuffer for ViewHierarchyRequest(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  int64_t result = a1;
  a1[1] = v4;
  return result;
}

uint64_t destroy for ViewHierarchyRequest(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *initializeWithCopy for ViewHierarchyRequest(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  int64_t result = a1;
  a1[1] = v4;
  return result;
}

void *assignWithCopy for ViewHierarchyRequest(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  uint64_t v2 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRelease(v2);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ViewHierarchyRequest(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewHierarchyRequest(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    {
      int v4 = *(_OWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      int v3 = -1;
      int v4 = v3;
    }
  }

  else
  {
    int v4 = -1;
  }

  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewHierarchyRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_OWORD *)__n128 result = a2 + 0x80000000;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + 16) = 1;
      }
      else {
        __break(1u);
      }
    }
  }

  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + 16) = 0;
      }
      else {
        __break(1u);
      }
    }

    if (a2) {
      *(void *)(result + 8) = a2 - 1;
    }
  }

  return result;
}

uint64_t getEnumTag for ViewHierarchyRequest()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for ViewHierarchyRequest()
{
  return &type metadata for ViewHierarchyRequest;
}

uint64_t default argument 1 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t default argument 2 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  uint64_t v2 = specialized static Array._allocateUninitialized(_:)(0LL);
  type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  uint64_t v4 = v2;
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  unint64_t v0 = lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v4, v3, v0);
}

uint64_t default argument 3 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)@<X0>( uint64_t a1@<X8>)
{
  unsigned int v3 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104LL))(a1, v3);
}

void static ViewHierarchyAgent.main()()
{
  uint64_t v0 = *ViewHierarchyAgent.shared.unsafeMutableAddressor();
  swift_retain(v0);
  ViewHierarchyAgent.run()();
}

uint64_t sub_100009BB8()
{
  return ((uint64_t (*)())swift_release)();
}

uint64_t *ViewHierarchyAgent.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1) {
    swift_once(&one-time initialization token for shared, one-time initialization function for shared);
  }
  return &static ViewHierarchyAgent.shared;
}

Swift::Void __swiftcall ViewHierarchyAgent.run()()
{
}

void *one-time initialization function for shared()
{
  __n128 result = ViewHierarchyAgent.__allocating_init()();
  static ViewHierarchyAgent.shared = (uint64_t)result;
  return result;
}

void *ViewHierarchyAgent.__allocating_init()()
{
  return ViewHierarchyAgent.().init()();
}

void *ViewHierarchyAgent.().init()()
{
  uint64_t v64 = 0LL;
  uint64_t v50 = 0LL;
  unint64_t v30 = (*(void *)(*(void *)(type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL) - 8) + 64LL)
       + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v1 = __chkstk_darwin(0LL);
  uint64_t v40 = (uint64_t)&v30 - v30;
  unint64_t v31 = (*(void *)(*(void *)(type metadata accessor for OS_dispatch_queue.Attributes(v1) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v2 = __chkstk_darwin(v50);
  uint64_t v39 = (char *)&v30 - v31;
  unint64_t v32 = (*(void *)(*(void *)(type metadata accessor for DispatchQoS(v2) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v50);
  uint64_t v38 = (char *)&v30 - v32;
  uint64_t v64 = v0;
  unint64_t v36 = type metadata accessor for OS_dispatch_queue();
  uint64_t v34 = 19LL;
  int v57 = 1;
  Swift::String v33 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SystemListenerQueue", 0x13uLL, 1);
  default argument 1 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 2 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 3 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v40);
  uint64_t v3 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( v33._countAndFlagsBits,  v33._object,  v38,  v39,  v40,  v50);
  Builtin::Word v4 = v34;
  char v5 = v57;
  v63[2] = v3;
  Swift::String v35 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("RemoteListenerQueue", v4, v5 & 1);
  default argument 1 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 2 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 3 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v40);
  uint64_t v6 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( v35._countAndFlagsBits,  v35._object,  v38,  v39,  v40,  v50);
  char v7 = v57;
  v63[3] = v6;
  Swift::String v37 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("TargetHubListenerQueue", 0x16uLL, v7 & 1);
  default argument 1 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 2 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 3 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v40);
  uint64_t v8 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( v37._countAndFlagsBits,  v37._object,  v38,  v39,  v40,  v50);
  uint64_t v9 = v63;
  v63[4] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Int32, CaptureController));
  uint64_t v41 = _allocateUninitializedArray<A>(_:)(v50);
  type metadata accessor for CaptureController(v50);
  uint64_t v42 = &type metadata for Int32;
  uint64_t v43 = &protocol witness table for Int32;
  v9[11] = Dictionary.init(dictionaryLiteral:)(v41);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Int32, CheckedContinuation<SystemXPCPeerConnection, Error>));
  uint64_t v44 = _allocateUninitializedArray<A>(_:)(v50);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  uint64_t v10 = Dictionary.init(dictionaryLiteral:)(v44);
  uint64_t v11 = v50;
  v9[12] = v10;
  uint64_t v52 = type metadata accessor for SystemXPCListenerConnection(v11);
  Swift::String v12 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "com.apple.dt.ViewHierarchyAgent.xpc",  0x23uLL,  v57 & 1);
  uint64_t countAndFlagsBits = v12._countAndFlagsBits;
  object = v12._object;
  id v46 = (id)v63[2];
  id v13 = v46;
  uint64_t v14 = static SystemXPCConnection.machServiceListenerConnection(name:targetQueue:)(countAndFlagsBits, object, v46);
  uint64_t v15 = v63;
  uint64_t v48 = v14;
  uint64_t v49 = v16;

  swift_bridgeObjectRelease(object);
  uint64_t v17 = v49;
  uint64_t v18 = v50;
  v15[5] = v48;
  v15[6] = v17;
  type metadata accessor for RemoteXPCListenerConnection(v18);
  Swift::String v19 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "com.apple.dt.ViewHierarchyAgent.remote",  0x26uLL,  v57 & 1);
  uint64_t v51 = v19._countAndFlagsBits;
  uint64_t v54 = v19._object;
  id v53 = (id)v63[3];
  id v20 = v53;
  uint64_t v55 = static RemoteXPCConnection.remoteServiceListenerConnection(serviceName:targetQueue:)(v51, v54, v53);
  uint64_t v56 = v21;

  swift_bridgeObjectRelease(v54);
  uint64_t v22 = v56;
  char v23 = v57;
  uint64_t v24 = v63;
  v63[7] = v55;
  v24[8] = v22;
  Swift::String v25 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "com.apple.dt.ViewHierarchyTargetHub.xpc",  0x27uLL,  v23 & 1);
  uint64_t v58 = v25._countAndFlagsBits;
  v60 = v25._object;
  id v59 = (id)v63[4];
  id v26 = v59;
  uint64_t v61 = static SystemXPCConnection.machServiceListenerConnection(name:targetQueue:)(v58, v60, v59);
  uint64_t v62 = v27;

  swift_bridgeObjectRelease(v60);
  uint64_t v28 = v62;
  __n128 result = v63;
  v63[9] = v61;
  result[10] = v28;
  return result;
}

Swift::Void __swiftcall ViewHierarchyAgent.startSystemListener()()
{
  uint64_t v50 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v40 = 0LL;
  uint64_t v35 = type metadata accessor for Logger(0LL);
  uint64_t v34 = *(void *)(v35 - 8);
  unint64_t v27 = (*(void *)(v34 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v35);
  unint64_t v32 = (char *)&v13 - v27;
  uint64_t v50 = v0;
  uint64_t v1 = *(void **)(v0 + 40);
  unint64_t v31 = v1;
  uint64_t v29 = *(void *)(v0 + 48);
  swift_retain(v1);
  uint64_t v28 = *v1;
  swift_retain(v30);
  dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)( partial apply for closure #1 in ViewHierarchyAgent.startSystemListener(),  v30,  v28,  v29);
  uint64_t v2 = v30;
  swift_release(v30);
  swift_release(v31);
  uint64_t v33 = *(void *)(v2 + 40);
  uint64_t v3 = swift_retain(v33);
  dispatch thunk of XPCConnection.activate()(v3);
  Builtin::Word v4 = v32;
  swift_release(v33);
  uint64_t v5 = logger.unsafeMutableAddressor();
  uint64_t v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 16))(v4, v5, v35);
  uint64_t v42 = (os_log_s *)Logger.logObject.getter(v6);
  int v41 = static os_log_type_t.info.getter();
  uint64_t v38 = &v48;
  uint64_t v48 = 2LL;
  unint64_t v36 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v37 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v7 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(&v49, v38, &type metadata for UInt32, &type metadata for Int, v36, v37, v7);
  uint32_t v39 = v49;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v43 = _allocateUninitializedArray<A>(_:)(v40);
  if (os_log_type_enabled(v42, (os_log_type_t)v41))
  {
    uint64_t v8 = v26;
    uint64_t v16 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v15 = 0LL;
    uint64_t v17 = createStorage<A>(capacity:type:)(0LL, v14, v14);
    uint64_t v18 = createStorage<A>(capacity:type:)( v15,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    uint64_t v22 = &v47;
    id v47 = v16;
    char v23 = &v46;
    uint64_t v46 = v17;
    id v20 = &v45;
    uint64_t v45 = v18;
    unsigned int v19 = 0;
    serialize(_:at:)(0LL, &v47);
    serialize(_:at:)(v19, v22);
    uint64_t v44 = v43;
    uint64_t v21 = &v13;
    __chkstk_darwin(&v13);
    uint64_t v9 = v23;
    uint64_t v10 = &v13 - 6;
    uint64_t v24 = &v13 - 6;
    v10[2] = (uint64_t)v22;
    void v10[3] = (uint64_t)v9;
    v10[4] = v11;
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    unint64_t v12 = lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)(partial apply for closure #1 in osLogInternal(_:log:type:), v24, v25, v12);
    if (v8)
    {
      __break(1u);
    }

    else
    {
      _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v41, "Started SystemXPC listener", v16, v39);
      uint64_t v13 = 0LL;
      destroyStorage<A>(_:count:)(v17, 0LL);
      destroyStorage<A>(_:count:)(v18, v13);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease(v43);
    }
  }

  else
  {
    swift_bridgeObjectRelease(v43);
  }

  (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v35);
}

Swift::Void __swiftcall ViewHierarchyAgent.startRemoteListener()()
{
  uint64_t v50 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v40 = 0LL;
  uint64_t v35 = type metadata accessor for Logger(0LL);
  uint64_t v34 = *(void *)(v35 - 8);
  unint64_t v27 = (*(void *)(v34 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v35);
  unint64_t v32 = (char *)&v13 - v27;
  uint64_t v50 = v0;
  uint64_t v1 = *(void **)(v0 + 56);
  unint64_t v31 = v1;
  uint64_t v29 = *(void *)(v0 + 64);
  swift_retain(v1);
  uint64_t v28 = *v1;
  swift_retain(v30);
  dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)( partial apply for closure #1 in ViewHierarchyAgent.startRemoteListener(),  v30,  v28,  v29);
  uint64_t v2 = v30;
  swift_release(v30);
  swift_release(v31);
  uint64_t v33 = *(void *)(v2 + 56);
  uint64_t v3 = swift_retain(v33);
  dispatch thunk of XPCConnection.activate()(v3);
  Builtin::Word v4 = v32;
  swift_release(v33);
  uint64_t v5 = logger.unsafeMutableAddressor();
  uint64_t v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 16))(v4, v5, v35);
  uint64_t v42 = (os_log_s *)Logger.logObject.getter(v6);
  int v41 = static os_log_type_t.info.getter();
  uint64_t v38 = &v48;
  uint64_t v48 = 2LL;
  unint64_t v36 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v37 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v7 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(&v49, v38, &type metadata for UInt32, &type metadata for Int, v36, v37, v7);
  uint32_t v39 = v49;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v43 = _allocateUninitializedArray<A>(_:)(v40);
  if (os_log_type_enabled(v42, (os_log_type_t)v41))
  {
    uint64_t v8 = v26;
    uint64_t v16 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v15 = 0LL;
    uint64_t v17 = createStorage<A>(capacity:type:)(0LL, v14, v14);
    uint64_t v18 = createStorage<A>(capacity:type:)( v15,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    uint64_t v22 = &v47;
    id v47 = v16;
    char v23 = &v46;
    uint64_t v46 = v17;
    id v20 = &v45;
    uint64_t v45 = v18;
    unsigned int v19 = 0;
    serialize(_:at:)(0LL, &v47);
    serialize(_:at:)(v19, v22);
    uint64_t v44 = v43;
    uint64_t v21 = &v13;
    __chkstk_darwin(&v13);
    uint64_t v9 = v23;
    uint64_t v10 = &v13 - 6;
    uint64_t v24 = &v13 - 6;
    v10[2] = (uint64_t)v22;
    void v10[3] = (uint64_t)v9;
    v10[4] = v11;
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    unint64_t v12 = lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)(closure #1 in osLogInternal(_:log:type:)partial apply, v24, v25, v12);
    if (v8)
    {
      __break(1u);
    }

    else
    {
      _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v41, "Started RemoteXPC listener", v16, v39);
      uint64_t v13 = 0LL;
      destroyStorage<A>(_:count:)(v17, 0LL);
      destroyStorage<A>(_:count:)(v18, v13);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease(v43);
    }
  }

  else
  {
    swift_bridgeObjectRelease(v43);
  }

  (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v35);
}

Swift::Void __swiftcall ViewHierarchyAgent.startTargetHubListener()()
{
  uint64_t v50 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v40 = 0LL;
  uint64_t v35 = type metadata accessor for Logger(0LL);
  uint64_t v34 = *(void *)(v35 - 8);
  unint64_t v27 = (*(void *)(v34 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v35);
  unint64_t v32 = (char *)&v13 - v27;
  uint64_t v50 = v0;
  uint64_t v1 = *(void **)(v0 + 72);
  unint64_t v31 = v1;
  uint64_t v29 = *(void *)(v0 + 80);
  swift_retain(v1);
  uint64_t v28 = *v1;
  swift_retain(v30);
  dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)( partial apply for closure #1 in ViewHierarchyAgent.startTargetHubListener(),  v30,  v28,  v29);
  uint64_t v2 = v30;
  swift_release(v30);
  swift_release(v31);
  uint64_t v33 = *(void *)(v2 + 72);
  uint64_t v3 = swift_retain(v33);
  dispatch thunk of XPCConnection.activate()(v3);
  Builtin::Word v4 = v32;
  swift_release(v33);
  uint64_t v5 = logger.unsafeMutableAddressor();
  uint64_t v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 16))(v4, v5, v35);
  uint64_t v42 = (os_log_s *)Logger.logObject.getter(v6);
  int v41 = static os_log_type_t.info.getter();
  uint64_t v38 = &v48;
  uint64_t v48 = 2LL;
  unint64_t v36 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v37 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v7 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(&v49, v38, &type metadata for UInt32, &type metadata for Int, v36, v37, v7);
  uint32_t v39 = v49;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v43 = _allocateUninitializedArray<A>(_:)(v40);
  if (os_log_type_enabled(v42, (os_log_type_t)v41))
  {
    uint64_t v8 = v26;
    uint64_t v16 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v15 = 0LL;
    uint64_t v17 = createStorage<A>(capacity:type:)(0LL, v14, v14);
    uint64_t v18 = createStorage<A>(capacity:type:)( v15,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    uint64_t v22 = &v47;
    id v47 = v16;
    char v23 = &v46;
    uint64_t v46 = v17;
    id v20 = &v45;
    uint64_t v45 = v18;
    unsigned int v19 = 0;
    serialize(_:at:)(0LL, &v47);
    serialize(_:at:)(v19, v22);
    uint64_t v44 = v43;
    uint64_t v21 = &v13;
    __chkstk_darwin(&v13);
    uint64_t v9 = v23;
    uint64_t v10 = &v13 - 6;
    uint64_t v24 = &v13 - 6;
    v10[2] = (uint64_t)v22;
    void v10[3] = (uint64_t)v9;
    v10[4] = v11;
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    unint64_t v12 = lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)(closure #1 in osLogInternal(_:log:type:)partial apply, v24, v25, v12);
    if (v8)
    {
      __break(1u);
    }

    else
    {
      _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v41, "Started Targethub listener", v16, v39);
      uint64_t v13 = 0LL;
      destroyStorage<A>(_:count:)(v17, 0LL);
      destroyStorage<A>(_:count:)(v18, v13);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease(v43);
    }
  }

  else
  {
    swift_bridgeObjectRelease(v43);
  }

  (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v35);
}

uint64_t type metadata accessor for ViewHierarchyAgent()
{
  return objc_opt_self(&OBJC_CLASS____TtC18ViewHierarchyAgent18ViewHierarchyAgent);
}

unint64_t type metadata accessor for OS_dispatch_queue()
{
  uint64_t v3 = lazy cache variable for type metadata for OS_dispatch_queue;
  if (!lazy cache variable for type metadata for OS_dispatch_queue)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
    return ObjCClassMetadata;
  }

  return v3;
}

void *closure #1 in ViewHierarchyAgent.startSystemListener()(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = a1;
  uint64_t v13 = a2;
  uint64_t v21 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  unint64_t v15 = (*(void *)(*(void *)(v16 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v17 = (void *)((char *)v9 - v15);
  uint64_t v21 = (void *)__chkstk_darwin(v14);
  uint64_t v20 = v2;
  outlined init with copy of Result<XPCPeerConnection, XPCError>(v21, (void *)((char *)v9 - v15));
  Builtin::Word v4 = (void *)*v17;
  unint64_t v12 = v4;
  uint64_t v10 = v17[1];
  uint64_t v18 = v4;
  uint64_t v19 = v10;
  v9[1] = *v4;
  swift_retain(v13);
  swift_retain(v4);
  uint64_t v5 = (void *)swift_allocObject(&unk_100019148, 40LL, 7LL);
  uint64_t v6 = v10;
  uint64_t v11 = v5;
  v5[2] = v13;
  v5[3] = v4;
  v5[4] = v6;
  dispatch thunk of XPCPeerConnection.setEventHandler(_:)(partial apply for closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener());
  unint64_t v7 = v12;
  swift_release(v11);
  uint64_t v8 = swift_retain(v7);
  dispatch thunk of XPCConnection.activate()(v8);
  swift_release(v12);
  return (void *)swift_release(v12);
}

void *partial apply for closure #1 in ViewHierarchyAgent.startSystemListener()(uint64_t a1)
{
  return closure #1 in ViewHierarchyAgent.startSystemListener()(a1, v1);
}

uint64_t closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v89 = a1;
  uint64_t v86 = a2;
  uint64_t v87 = a3;
  uint64_t v88 = a4;
  uint64_t v103 = 0LL;
  uint64_t v102 = 0LL;
  uint64_t v100 = 0LL;
  uint64_t v101 = 0LL;
  id v105 = 0LL;
  uint64_t v69 = 0LL;
  id v104 = 0LL;
  uint64_t v74 = 0LL;
  uint64_t v70 = type metadata accessor for Logger(0LL);
  uint64_t v71 = *(void *)(v70 - 8);
  unint64_t v72 = (*(void *)(v71 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(0LL);
  v73 = (char *)v41 - v72;
  uint64_t v75 = type metadata accessor for XPCError(v4);
  uint64_t v76 = *(void *)(v75 - 8);
  uint64_t v77 = *(void *)(v76 + 64);
  unint64_t v78 = (v77 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v5 = __chkstk_darwin(v74);
  uint64_t v79 = (char *)v41 - v78;
  unint64_t v80 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v81 = (char *)v41 - v80;
  id v105 = (char *)v41 - v80;
  uint64_t v82 = type metadata accessor for XPCDictionary(v7);
  uint64_t v83 = *(void *)(v82 - 8);
  unint64_t v84 = (*(void *)(v83 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v82);
  uint64_t v85 = (char *)v41 - v84;
  id v104 = (char *)v41 - v84;
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  unint64_t v90 = (*(void *)(*(void *)(v91 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v8 = __chkstk_darwin(v89);
  uint64_t v92 = (char *)v41 - v90;
  uint64_t v103 = v8;
  uint64_t v102 = v9;
  uint64_t v100 = v10;
  uint64_t v101 = v11;
  outlined init with copy of Result<XPCDictionary, XPCError>(v8, (uint64_t)v41 - v90);
  if (swift_getEnumCaseMultiPayload(v92) == 1)
  {
    uint64_t v13 = v73;
    uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v76 + 32);
    v51(v81, v92, v75);
    id v105 = v81;
    uint64_t v14 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v13, v14, v70);
    (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v79, v81, v75);
    uint64_t v15 = *(unsigned __int8 *)(v76 + 80);
    uint64_t v50 = (v15 + 16) & ~v15;
    uint64_t v58 = 7LL;
    uint64_t v59 = swift_allocObject(&unk_100019170, v50 + v77, v15 | 7);
    uint64_t v16 = ((uint64_t (*)(uint64_t, char *, uint64_t))v51)(v59 + v50, v79, v75);
    uint64_t v67 = (os_log_s *)Logger.logObject.getter(v16);
    int v68 = static os_log_type_t.default.getter();
    uint64_t v54 = &v98;
    uint64_t v98 = 12LL;
    unint64_t v52 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v53 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v17 = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)(&v99, v54, &type metadata for UInt32, &type metadata for Int, v52, v53, v17);
    uint32_t v55 = v99;
    uint64_t v56 = 17LL;
    uint64_t v18 = swift_allocObject(&unk_100019198, 17LL, v58);
    uint64_t v19 = v56;
    uint64_t v20 = v58;
    uint64_t v61 = v18;
    *(_BYTE *)(v18 + 16) = 32;
    uint64_t v21 = swift_allocObject(&unk_1000191C0, v19, v20);
    uint64_t v22 = v58;
    uint64_t v62 = v21;
    *(_BYTE *)(v21 + 16) = 8;
    uint64_t v57 = 32LL;
    uint64_t v23 = swift_allocObject(&unk_1000191E8, 32LL, v22);
    uint64_t v24 = v57;
    uint64_t v25 = v58;
    uint64_t v26 = v23;
    uint64_t v27 = v59;
    uint64_t v60 = v26;
    *(void *)(v26 + 16) = partial apply for implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener();
    *(void *)(v26 + 24) = v27;
    uint64_t v28 = swift_allocObject(&unk_100019210, v24, v25);
    uint64_t v29 = v60;
    uint64_t v64 = v28;
    *(void *)(v28 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
    *(void *)(v28 + 24) = v29;
    uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v63 = _allocateUninitializedArray<A>(_:)(3LL);
    uint64_t v65 = v30;
    swift_retain(v61);
    uint64_t v31 = v62;
    uint64_t v32 = v61;
    uint64_t v33 = v65;
    *uint64_t v65 = closure #1 in OSLogArguments.append(_:)partial apply;
    v33[1] = v32;
    swift_retain(v31);
    uint64_t v34 = v64;
    uint64_t v35 = v62;
    unint64_t v36 = v65;
    v65[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v36[3] = v35;
    swift_retain(v34);
    uint64_t v37 = v63;
    uint64_t v38 = v64;
    uint32_t v39 = v65;
    v65[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v39[5] = v38;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease(v37);
    if (os_log_type_enabled(v67, (os_log_type_t)v68))
    {
      uint64_t v40 = v69;
      uint64_t v43 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v44 = createStorage<A>(capacity:type:)(0LL, v42, v42);
      uint64_t v45 = createStorage<A>(capacity:type:)( 1LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
      uint64_t v46 = &v97;
      v97 = v43;
      id v47 = &v96;
      uint64_t v96 = v44;
      uint64_t v48 = &v95;
      uint64_t v95 = v45;
      serialize(_:at:)(2LL, &v97);
      serialize(_:at:)(1LL, v46);
      uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v94 = v61;
      closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48);
      uint64_t v49 = v40;
      if (v40)
      {
        __break(1u);
      }

      else
      {
        uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v94 = v62;
        closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v97, (uint64_t)&v96, (uint64_t)&v95);
        v41[0] = 0LL;
        uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v94 = v64;
        closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v97, (uint64_t)&v96, (uint64_t)&v95);
        _os_log_impl( (void *)&_mh_execute_header,  v67,  (os_log_type_t)v68,  "SystemXPCPeerConnection received an error: %s",  v43,  v55);
        destroyStorage<A>(_:count:)(v44, 0LL);
        destroyStorage<A>(_:count:)(v45, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v61);
        swift_release(v62);
        swift_release(v64);
      }
    }

    else
    {
      swift_release(v61);
      swift_release(v62);
      swift_release(v64);
    }

    (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v70);
    return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v81, v75);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v85, v92, v82);
    id v104 = v85;
    swift_retain(v87);
    ViewHierarchyAgent.handleMessage(_:from:)((uint64_t)v85, v87, v88);
    swift_release(v87);
    return (*(uint64_t (**)(char *, uint64_t))(v83 + 8))(v85, v82);
  }

uint64_t ViewHierarchyAgent.handleMessage(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v169 = a1;
  uint64_t v173 = a2;
  uint64_t v170 = a3;
  v149 = "Fatal error";
  v150 = "Unexpectedly found nil while unwrapping an Optional value";
  v151 = "ViewHierarchyAgent/ViewHierarchyAgent.swift";
  v204 = 0LL;
  uint64_t v203 = 0LL;
  uint64_t v201 = 0LL;
  uint64_t v202 = 0LL;
  uint64_t v200 = 0LL;
  uint64_t v198 = 0LL;
  uint64_t v199 = 0LL;
  uint64_t v152 = 0LL;
  uint64_t v190 = 0LL;
  uint64_t v191 = 0LL;
  uint64_t v178 = 0LL;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
  unint64_t v153 = (*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v4);
  v154 = (char *)&v77 - v153;
  uint64_t v155 = 0LL;
  uint64_t v156 = type metadata accessor for Logger(0LL);
  uint64_t v157 = *(void *)(v156 - 8);
  unint64_t v158 = (*(void *)(v157 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v5 = __chkstk_darwin(v155);
  v159 = (char *)&v77 - v158;
  unint64_t v160 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v7 = __chkstk_darwin(v5);
  v161 = (char *)&v77 - v160;
  uint64_t v162 = type metadata accessor for XPCDictionary(v7);
  uint64_t v163 = *(void *)(v162 - 8);
  uint64_t v164 = *(void *)(v163 + 64);
  unint64_t v165 = (v164 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v8 = __chkstk_darwin(v162);
  v166 = (char *)&v77 - v165;
  v204 = (char *)&v77 - v165;
  unint64_t v167 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v8);
  v168 = (char *)&v77 - v167;
  unint64_t v171 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                                - 8)
                    + 64LL)
        + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v10 = __chkstk_darwin(v173);
  uint64_t v172 = (uint64_t)&v77 - v171;
  uint64_t v203 = v11;
  uint64_t v201 = v10;
  uint64_t v202 = v12;
  uint64_t v200 = v3;
  swift_retain(v10);
  if (v173)
  {
    uint64_t v146 = v173;
    uint64_t v147 = v170;
    uint64_t v141 = v170;
    uint64_t v142 = v173;
    uint64_t v198 = v173;
    uint64_t v199 = v170;
    Swift::String v13 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("action", 6uLL, 1);
    object = v13._object;
    uint64_t v144 = XPCDictionary.subscript.getter(v13._countAndFlagsBits);
    uint64_t v145 = v14;
    if (v14)
    {
      uint64_t v139 = v144;
      uint64_t v140 = v145;
      uint64_t v136 = v145;
      uint64_t v135 = v144;
      uint64_t v190 = v144;
      uint64_t v191 = v145;
      swift_bridgeObjectRelease(object);
      swift_bridgeObjectRetain(v136);
      Swift::String v15 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("performRequest", 0xEuLL, 1);
      uint64_t countAndFlagsBits = v15._countAndFlagsBits;
      v137 = v15._object;
      swift_bridgeObjectRetain(v15._object);
      uint64_t v188 = v135;
      uint64_t v189 = v136;
      int v138 = static String.== infix(_:_:)(countAndFlagsBits, v137, v135, v136);
      swift_bridgeObjectRelease(v137);
      swift_bridgeObjectRelease(v137);
      if ((v138 & 1) != 0)
      {
        swift_bridgeObjectRelease(v136);
        uint64_t v16 = type metadata accessor for TaskPriority(0LL);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v172, 1LL);
        swift_retain(v148);
        swift_retain(v142);
        (*(void (**)(char *, uint64_t, uint64_t))(v163 + 16))(v168, v169, v162);
        uint64_t v17 = *(unsigned __int8 *)(v163 + 80);
        uint64_t v132 = (v17 + 56) & ~v17;
        uint64_t v18 = (void *)swift_allocObject(&unk_100018B80, v132 + v164, v17 | 7);
        uint64_t v19 = v148;
        uint64_t v20 = v142;
        uint64_t v21 = v141;
        uint64_t v22 = v132;
        uint64_t v23 = v163;
        uint64_t v24 = v168;
        uint64_t v25 = v162;
        v133 = v18;
        v18[2] = 0LL;
        v18[3] = 0LL;
        v18[4] = v19;
        v18[5] = v20;
        v18[6] = v21;
        (*(void (**)(char *, char *, uint64_t))(v23 + 32))((char *)v18 + v22, v24, v25);
        uint64_t v26 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC( v172,  (uint64_t)&async function pointer to partial apply for closure #1 in ViewHierarchyAgent.handleMessage(_:from:),  (uint64_t)v133,  (uint64_t)&type metadata for () + 8);
        swift_release(v26);
      }

      else
      {
        swift_bridgeObjectRelease(v136);
        swift_bridgeObjectRetain(v136);
        Swift::String v130 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("finish", 6uLL, 1);
        swift_bridgeObjectRetain(v130._object);
        uint64_t v186 = v135;
        uint64_t v187 = v136;
        int v131 = static String.== infix(_:_:)(v130._countAndFlagsBits, v130._object, v135, v136);
        swift_bridgeObjectRelease(v130._object);
        swift_bridgeObjectRelease(v130._object);
        if ((v131 & 1) != 0)
        {
          uint64_t v27 = v152;
          swift_bridgeObjectRelease(v136);
          ViewHierarchyAgent.finish(_:)(v169);
          uint64_t v129 = v27;
          if (v27)
          {
            uint64_t v79 = v129;
            uint64_t v72 = swift_errorRetain(v129);
            uint64_t v178 = v79;
            XPCDictionary.createReply()(v72);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v163 + 48))(v154, 1LL, v162) == 1)
            {
              LOBYTE(v74) = 2;
              _assertionFailure(_:_:file:line:flags:)(v149, 11LL, 2LL, v150, 57LL, 2LL, v151, 43LL, v74, 172LL, 0);
              __break(1u);
            }

            (*(void (**)(char *, char *, uint64_t))(v163 + 32))(v166, v154, v162);
            Swift::String v77 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("error", 5uLL, 1);
            swift_getErrorValue(v79, v177, v174);
            uint64_t v73 = Error.localizedDescription.getter(v175, v176);
            XPCDictionary.subscript.setter(v73);
            swift_retain(v142);
            (*(void (**)(char *, char *, uint64_t))(v163 + 16))(v168, v166, v162);
            dispatch thunk of XPCConnection.send(message:)(v168);
            unint64_t v78 = *(void (**)(char *, uint64_t))(v163 + 8);
            v78(v168, v162);
            swift_release(v142);
            v78(v166, v162);
            swift_errorRelease(v79);
            swift_errorRelease(v79);
          }
        }

        else
        {
          uint64_t v28 = v142;
          swift_bridgeObjectRelease(v136);
          uint64_t v29 = swift_retain(v28);
          dispatch thunk of XPCConnection.cancel()(v29);
          uint64_t v30 = v161;
          swift_release(v142);
          uint64_t v31 = logger.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v157 + 16))(v30, v31, v156);
          swift_bridgeObjectRetain(v136);
          uint64_t v117 = 32LL;
          uint64_t v118 = 7LL;
          uint64_t v32 = swift_allocObject(&unk_100018AB8, 32LL, 7LL);
          uint64_t v33 = v136;
          uint64_t v119 = v32;
          *(void *)(v32 + 16) = v135;
          *(void *)(v32 + 24) = v33;
          v127 = (os_log_s *)Logger.logObject.getter(v32);
          int v128 = static os_log_type_t.error.getter();
          id v114 = &v184;
          uint64_t v184 = 12LL;
          unint64_t v112 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          unint64_t v113 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          unint64_t v34 = lazy protocol witness table accessor for type Int and conformance Int();
          UnsignedInteger<>.init<A>(_:)(&v185, v114, &type metadata for UInt32, &type metadata for Int, v112, v113, v34);
          uint32_t v115 = v185;
          uint64_t v116 = 17LL;
          uint64_t v35 = swift_allocObject(&unk_100018AE0, 17LL, v118);
          uint64_t v36 = v116;
          uint64_t v37 = v118;
          uint64_t v121 = v35;
          *(_BYTE *)(v35 + 16) = 32;
          uint64_t v38 = swift_allocObject(&unk_100018B08, v36, v37);
          uint64_t v39 = v117;
          uint64_t v40 = v118;
          uint64_t v122 = v38;
          *(_BYTE *)(v38 + 16) = 8;
          uint64_t v41 = swift_allocObject(&unk_100018B30, v39, v40);
          uint64_t v42 = v117;
          uint64_t v43 = v118;
          uint64_t v44 = v41;
          uint64_t v45 = v119;
          uint64_t v120 = v44;
          *(void *)(v44 + 16) = partial apply for implicit closure #2 in ViewHierarchyAgent.handleMessage(_:from:);
          *(void *)(v44 + 24) = v45;
          uint64_t v46 = swift_allocObject(&unk_100018B58, v42, v43);
          uint64_t v47 = v120;
          uint64_t v124 = v46;
          *(void *)(v46 + 16) = _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0;
          *(void *)(v46 + 24) = v47;
          uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
          uint64_t v123 = _allocateUninitializedArray<A>(_:)(3LL);
          v125 = v48;
          swift_retain(v121);
          uint64_t v49 = v122;
          uint64_t v50 = v121;
          uint64_t v51 = v125;
          void *v125 = _s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
          v51[1] = v50;
          swift_retain(v49);
          uint64_t v52 = v124;
          uint64_t v53 = v122;
          uint64_t v54 = v125;
          v125[2] = closure #1 in OSLogArguments.append(_:)partial apply;
          v54[3] = v53;
          swift_retain(v52);
          uint64_t v55 = v123;
          uint64_t v56 = v124;
          uint64_t v57 = v125;
          v125[4] = _s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
          v57[5] = v56;
          _finalizeUninitializedArray<A>(_:)();
          swift_bridgeObjectRelease(v55);
          if (os_log_type_enabled(v127, (os_log_type_t)v128))
          {
            uint64_t v58 = v152;
            id v105 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
            uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            uint64_t v106 = createStorage<A>(capacity:type:)(0LL, v104, v104);
            uint64_t v107 = createStorage<A>(capacity:type:)( 1LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
            v108 = &v183;
            v183 = v105;
            uint64_t v109 = &v182;
            uint64_t v182 = v106;
            v110 = &v181;
            uint64_t v181 = v107;
            serialize(_:at:)(2LL, &v183);
            serialize(_:at:)(1LL, v108);
            v179 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
            uint64_t v180 = v121;
            closure #1 in osLogInternal(_:log:type:)(&v179, (uint64_t)v108, (uint64_t)v109, (uint64_t)v110);
            uint64_t v111 = v58;
            if (v58)
            {
              __break(1u);
            }

            else
            {
              v179 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
              uint64_t v180 = v122;
              closure #1 in osLogInternal(_:log:type:)(&v179, (uint64_t)&v183, (uint64_t)&v182, (uint64_t)&v181);
              uint64_t v103 = 0LL;
              v179 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
              uint64_t v180 = v124;
              closure #1 in osLogInternal(_:log:type:)(&v179, (uint64_t)&v183, (uint64_t)&v182, (uint64_t)&v181);
              _os_log_impl( (void *)&_mh_execute_header,  v127,  (os_log_type_t)v128,  "Failed to handle message with action %s",  v105,  v115);
              destroyStorage<A>(_:count:)(v106, 0LL);
              destroyStorage<A>(_:count:)(v107, 1LL);
              UnsafeMutablePointer.deallocate()();
              swift_release(v121);
              swift_release(v122);
              swift_release(v124);
            }
          }

          else
          {
            swift_release(v121);
            swift_release(v122);
            swift_release(v124);
          }

          (*(void (**)(char *, uint64_t))(v157 + 8))(v161, v156);
        }
      }

      swift_bridgeObjectRelease(v136);
      return swift_release(v142);
    }

    else
    {
      uint64_t v60 = swift_bridgeObjectRelease(object);
      uint64_t v61 = XPCDictionary.underlyingConnection.getter(v60);
      uint64_t v102 = v61;
      if (v61)
      {
        uint64_t v101 = v102;
        uint64_t v100 = v102;
        dispatch thunk of XPCConnection.cancel()(v61);
        swift_release(v100);
      }

      uint64_t v62 = v159;
      uint64_t v63 = logger.unsafeMutableAddressor();
      uint64_t v64 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v157 + 16))(v62, v63, v156);
      uint64_t v98 = (os_log_s *)Logger.logObject.getter(v64);
      int v97 = static os_log_type_t.error.getter();
      uint64_t v95 = &v196;
      uint64_t v196 = 2LL;
      unint64_t v93 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v94 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v65 = lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)(&v197, v95, &type metadata for UInt32, &type metadata for Int, v93, v94, v65);
      uint32_t v96 = v197;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v99 = _allocateUninitializedArray<A>(_:)(0LL);
      if (os_log_type_enabled(v98, (os_log_type_t)v97))
      {
        uint64_t v66 = v152;
        uint64_t v83 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
        uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v82 = 0LL;
        uint64_t v84 = createStorage<A>(capacity:type:)(0LL, v81, v81);
        uint64_t v85 = createStorage<A>(capacity:type:)( v82,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
        uint64_t v89 = &v195;
        v195 = v83;
        unint64_t v90 = &v194;
        uint64_t v194 = v84;
        uint64_t v87 = &v193;
        uint64_t v193 = v85;
        unsigned int v86 = 0;
        serialize(_:at:)(0LL, &v195);
        serialize(_:at:)(v86, v89);
        uint64_t v192 = v99;
        uint64_t v88 = &v77;
        __chkstk_darwin(&v77);
        uint64_t v67 = v90;
        int v68 = &v77 - 3;
        uint64_t v91 = &v77 - 3;
        v68[1]._uint64_t countAndFlagsBits = (uint64_t)v89;
        v68[1]._object = v67;
        v68[2]._uint64_t countAndFlagsBits = v69;
        uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        unint64_t v70 = lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)(closure #1 in osLogInternal(_:log:type:)partial apply, v91, v92, v70);
        if (v66)
        {
          __break(1u);
        }

        else
        {
          _os_log_impl( (void *)&_mh_execute_header,  v98,  (os_log_type_t)v97,  "Failed to handle message without action",  v83,  v96);
          uint64_t v80 = 0LL;
          destroyStorage<A>(_:count:)(v84, 0LL);
          destroyStorage<A>(_:count:)(v85, v80);
          UnsafeMutablePointer.deallocate()();
          swift_bridgeObjectRelease(v99);
        }
      }

      else
      {
        swift_bridgeObjectRelease(v99);
      }

      (*(void (**)(char *, uint64_t))(v157 + 8))(v159, v156);
      return swift_release(v142);
    }
  }

  else
  {
    Swift::String v71 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "A message received over an XPC connection should have an underlying connection",  0x4EuLL,  1);
    uint64_t v75 = 147LL;
    int v76 = 0;
    uint64_t result = _assertionFailure(_:_:file:line:flags:)(v149, 11LL, 2LL, v71._countAndFlagsBits, v71._object, v151, 43LL);
    __break(1u);
  }

  return result;
}

uint64_t implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()()
{
  uint64_t v2 = type metadata accessor for XPCError(0LL);
  unint64_t v0 = lazy protocol witness table accessor for type XPCError and conformance XPCError();
  return Error.localizedDescription.getter(v2, v0);
}

uint64_t closure #1 in ViewHierarchyAgent.startRemoteListener()(uint64_t a1, uint64_t a2)
{
  uint64_t v86 = a1;
  uint64_t v85 = a2;
  uint64_t v100 = 0LL;
  uint64_t v99 = 0LL;
  uint64_t v101 = 0LL;
  uint64_t v72 = 0LL;
  unint64_t v90 = 0LL;
  uint64_t v91 = 0LL;
  uint64_t v73 = 0LL;
  uint64_t v74 = type metadata accessor for Logger(0LL);
  uint64_t v75 = *(void *)(v74 - 8);
  unint64_t v76 = (*(void *)(v75 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v2 = __chkstk_darwin(0LL);
  Swift::String v77 = (char *)v40 - v76;
  uint64_t v78 = type metadata accessor for XPCError(v2);
  uint64_t v79 = *(void *)(v78 - 8);
  uint64_t v80 = *(void *)(v79 + 64);
  unint64_t v81 = (v80 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v78);
  uint64_t v82 = (char *)v40 - v81;
  unint64_t v83 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin((char *)v40 - v81);
  uint64_t v84 = (char *)v40 - v83;
  uint64_t v101 = (char *)v40 - v83;
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  unint64_t v87 = (*(void *)(*(void *)(v88 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = (void *)__chkstk_darwin(v86);
  uint64_t v89 = (char *)v40 - v87;
  uint64_t v100 = v4;
  uint64_t v99 = v5;
  outlined init with copy of Result<XPCPeerConnection, XPCError>(v4, (void *)((char *)v40 - v87));
  if (swift_getEnumCaseMultiPayload(v89) == 1)
  {
    uint64_t v12 = v77;
    uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v79 + 32);
    v50(v84, v89, v78);
    uint64_t v101 = v84;
    uint64_t v13 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v12, v13, v74);
    (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v82, v84, v78);
    uint64_t v14 = *(unsigned __int8 *)(v79 + 80);
    uint64_t v49 = (v14 + 16) & ~v14;
    uint64_t v57 = 7LL;
    uint64_t v58 = swift_allocObject(&unk_100018F90, v49 + v80, v14 | 7);
    uint64_t v15 = ((uint64_t (*)(uint64_t, char *, uint64_t))v50)(v58 + v49, v82, v78);
    uint64_t v66 = (os_log_s *)Logger.logObject.getter(v15);
    int v67 = static os_log_type_t.debug.getter();
    uint64_t v53 = &v97;
    uint64_t v97 = 12LL;
    unint64_t v51 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v52 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v16 = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)(&v98, v53, &type metadata for UInt32, &type metadata for Int, v51, v52, v16);
    uint32_t v54 = v98;
    uint64_t v55 = 17LL;
    uint64_t v17 = swift_allocObject(&unk_100018FB8, 17LL, v57);
    uint64_t v18 = v55;
    uint64_t v19 = v57;
    uint64_t v60 = v17;
    *(_BYTE *)(v17 + 16) = 32;
    uint64_t v20 = swift_allocObject(&unk_100018FE0, v18, v19);
    uint64_t v21 = v57;
    uint64_t v61 = v20;
    *(_BYTE *)(v20 + 16) = 8;
    uint64_t v56 = 32LL;
    uint64_t v22 = swift_allocObject(&unk_100019008, 32LL, v21);
    uint64_t v23 = v56;
    uint64_t v24 = v57;
    uint64_t v25 = v22;
    uint64_t v26 = v58;
    uint64_t v59 = v25;
    *(void *)(v25 + 16) = partial apply for implicit closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener();
    *(void *)(v25 + 24) = v26;
    uint64_t v27 = swift_allocObject(&unk_100019030, v23, v24);
    uint64_t v28 = v59;
    uint64_t v63 = v27;
    *(void *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
    *(void *)(v27 + 24) = v28;
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v62 = _allocateUninitializedArray<A>(_:)(3LL);
    uint64_t v64 = v29;
    swift_retain(v60);
    uint64_t v30 = v61;
    uint64_t v31 = v60;
    uint64_t v32 = v64;
    *uint64_t v64 = closure #1 in OSLogArguments.append(_:)partial apply;
    v32[1] = v31;
    swift_retain(v30);
    uint64_t v33 = v63;
    uint64_t v34 = v61;
    uint64_t v35 = v64;
    v64[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v35[3] = v34;
    swift_retain(v33);
    uint64_t v36 = v62;
    uint64_t v37 = v63;
    uint64_t v38 = v64;
    v64[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v38[5] = v37;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease(v36);
    if (os_log_type_enabled(v66, (os_log_type_t)v67))
    {
      uint64_t v39 = v72;
      uint64_t v42 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v43 = createStorage<A>(capacity:type:)(0LL, v41, v41);
      uint64_t v44 = createStorage<A>(capacity:type:)( 1LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
      uint64_t v45 = &v96;
      uint32_t v96 = v42;
      uint64_t v46 = &v95;
      uint64_t v95 = v43;
      uint64_t v47 = &v94;
      uint64_t v94 = v44;
      serialize(_:at:)(2LL, &v96);
      serialize(_:at:)(1LL, v45);
      uint64_t v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v93 = v60;
      closure #1 in osLogInternal(_:log:type:)(&v92, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47);
      uint64_t v48 = v39;
      if (v39)
      {
        __break(1u);
      }

      else
      {
        uint64_t v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v93 = v61;
        closure #1 in osLogInternal(_:log:type:)(&v92, (uint64_t)&v96, (uint64_t)&v95, (uint64_t)&v94);
        v40[1] = 0LL;
        uint64_t v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v93 = v63;
        closure #1 in osLogInternal(_:log:type:)(&v92, (uint64_t)&v96, (uint64_t)&v95, (uint64_t)&v94);
        _os_log_impl((void *)&_mh_execute_header, v66, (os_log_type_t)v67, "%s", v42, v54);
        destroyStorage<A>(_:count:)(v43, 0LL);
        destroyStorage<A>(_:count:)(v44, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v60);
        swift_release(v61);
        swift_release(v63);
      }
    }

    else
    {
      swift_release(v60);
      swift_release(v61);
      swift_release(v63);
    }

    (*(void (**)(char *, uint64_t))(v75 + 8))(v77, v74);
    return (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v84, v78);
  }

  else
  {
    uint64_t v6 = *(void **)v89;
    Swift::String v71 = v6;
    uint64_t v69 = *((void *)v89 + 1);
    unint64_t v90 = v6;
    uint64_t v91 = v69;
    uint64_t v68 = *v6;
    swift_retain(v85);
    swift_retain(v6);
    uint64_t v7 = (void *)swift_allocObject(&unk_100019058, 40LL, 7LL);
    uint64_t v8 = v69;
    unint64_t v70 = v7;
    v7[2] = v85;
    v7[3] = v6;
    v7[4] = v8;
    dispatch thunk of XPCPeerConnection.setEventHandler(_:)(partial apply for closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener());
    uint64_t v9 = v71;
    swift_release(v70);
    uint64_t v10 = swift_retain(v9);
    dispatch thunk of XPCConnection.activate()(v10);
    swift_release(v71);
    return swift_release(v71);
  }

uint64_t closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v89 = a1;
  uint64_t v86 = a2;
  uint64_t v87 = a3;
  uint64_t v88 = a4;
  uint64_t v103 = 0LL;
  uint64_t v102 = 0LL;
  uint64_t v100 = 0LL;
  uint64_t v101 = 0LL;
  id v105 = 0LL;
  uint64_t v69 = 0LL;
  uint64_t v104 = 0LL;
  uint64_t v74 = 0LL;
  uint64_t v70 = type metadata accessor for Logger(0LL);
  uint64_t v71 = *(void *)(v70 - 8);
  unint64_t v72 = (*(void *)(v71 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(0LL);
  uint64_t v73 = (char *)v41 - v72;
  uint64_t v75 = type metadata accessor for XPCError(v4);
  uint64_t v76 = *(void *)(v75 - 8);
  uint64_t v77 = *(void *)(v76 + 64);
  unint64_t v78 = (v77 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v5 = __chkstk_darwin(v74);
  uint64_t v79 = (char *)v41 - v78;
  unint64_t v80 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v7 = __chkstk_darwin(v5);
  unint64_t v81 = (char *)v41 - v80;
  id v105 = (char *)v41 - v80;
  uint64_t v82 = type metadata accessor for XPCDictionary(v7);
  uint64_t v83 = *(void *)(v82 - 8);
  unint64_t v84 = (*(void *)(v83 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v82);
  uint64_t v85 = (char *)v41 - v84;
  uint64_t v104 = (char *)v41 - v84;
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  unint64_t v90 = (*(void *)(*(void *)(v91 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v8 = __chkstk_darwin(v89);
  uint64_t v92 = (char *)v41 - v90;
  uint64_t v103 = v8;
  uint64_t v102 = v9;
  uint64_t v100 = v10;
  uint64_t v101 = v11;
  outlined init with copy of Result<XPCDictionary, XPCError>(v8, (uint64_t)v41 - v90);
  if (swift_getEnumCaseMultiPayload(v92) == 1)
  {
    uint64_t v13 = v73;
    unint64_t v51 = *(void (**)(char *, char *, uint64_t))(v76 + 32);
    v51(v81, v92, v75);
    id v105 = v81;
    uint64_t v14 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v13, v14, v70);
    (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v79, v81, v75);
    uint64_t v15 = *(unsigned __int8 *)(v76 + 80);
    uint64_t v50 = (v15 + 16) & ~v15;
    uint64_t v58 = 7LL;
    uint64_t v59 = swift_allocObject(&unk_100019080, v50 + v77, v15 | 7);
    uint64_t v16 = ((uint64_t (*)(uint64_t, char *, uint64_t))v51)(v59 + v50, v79, v75);
    int v67 = (os_log_s *)Logger.logObject.getter(v16);
    int v68 = static os_log_type_t.default.getter();
    uint32_t v54 = &v98;
    uint64_t v98 = 12LL;
    unint64_t v52 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v53 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v17 = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)(&v99, v54, &type metadata for UInt32, &type metadata for Int, v52, v53, v17);
    uint32_t v55 = v99;
    uint64_t v56 = 17LL;
    uint64_t v18 = swift_allocObject(&unk_1000190A8, 17LL, v58);
    uint64_t v19 = v56;
    uint64_t v20 = v58;
    uint64_t v61 = v18;
    *(_BYTE *)(v18 + 16) = 32;
    uint64_t v21 = swift_allocObject(&unk_1000190D0, v19, v20);
    uint64_t v22 = v58;
    uint64_t v62 = v21;
    *(_BYTE *)(v21 + 16) = 8;
    uint64_t v57 = 32LL;
    uint64_t v23 = swift_allocObject(&unk_1000190F8, 32LL, v22);
    uint64_t v24 = v57;
    uint64_t v25 = v58;
    uint64_t v26 = v23;
    uint64_t v27 = v59;
    uint64_t v60 = v26;
    *(void *)(v26 + 16) = partial apply for implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener();
    *(void *)(v26 + 24) = v27;
    uint64_t v28 = swift_allocObject(&unk_100019120, v24, v25);
    uint64_t v29 = v60;
    uint64_t v64 = v28;
    *(void *)(v28 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
    *(void *)(v28 + 24) = v29;
    uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v63 = _allocateUninitializedArray<A>(_:)(3LL);
    uint64_t v65 = v30;
    swift_retain(v61);
    uint64_t v31 = v62;
    uint64_t v32 = v61;
    uint64_t v33 = v65;
    *uint64_t v65 = closure #1 in OSLogArguments.append(_:)partial apply;
    v33[1] = v32;
    swift_retain(v31);
    uint64_t v34 = v64;
    uint64_t v35 = v62;
    uint64_t v36 = v65;
    v65[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v36[3] = v35;
    swift_retain(v34);
    uint64_t v37 = v63;
    uint64_t v38 = v64;
    uint64_t v39 = v65;
    v65[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v39[5] = v38;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease(v37);
    if (os_log_type_enabled(v67, (os_log_type_t)v68))
    {
      uint64_t v40 = v69;
      uint64_t v43 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v44 = createStorage<A>(capacity:type:)(0LL, v42, v42);
      uint64_t v45 = createStorage<A>(capacity:type:)( 1LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
      uint64_t v46 = &v97;
      uint64_t v97 = v43;
      uint64_t v47 = &v96;
      uint64_t v96 = v44;
      uint64_t v48 = &v95;
      uint64_t v95 = v45;
      serialize(_:at:)(2LL, &v97);
      serialize(_:at:)(1LL, v46);
      uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v94 = v61;
      closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48);
      uint64_t v49 = v40;
      if (v40)
      {
        __break(1u);
      }

      else
      {
        uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v94 = v62;
        closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v97, (uint64_t)&v96, (uint64_t)&v95);
        v41[0] = 0LL;
        uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v94 = v64;
        closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v97, (uint64_t)&v96, (uint64_t)&v95);
        _os_log_impl( (void *)&_mh_execute_header,  v67,  (os_log_type_t)v68,  "RemoteXPCPeerConnection received an error: %s",  v43,  v55);
        destroyStorage<A>(_:count:)(v44, 0LL);
        destroyStorage<A>(_:count:)(v45, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v61);
        swift_release(v62);
        swift_release(v64);
      }
    }

    else
    {
      swift_release(v61);
      swift_release(v62);
      swift_release(v64);
    }

    (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v70);
    return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v81, v75);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v85, v92, v82);
    uint64_t v104 = v85;
    swift_retain(v87);
    ViewHierarchyAgent.handleMessage(_:from:)((uint64_t)v85, v87, v88);
    swift_release(v87);
    return (*(uint64_t (**)(char *, uint64_t))(v83 + 8))(v85, v82);
  }

uint64_t implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()()
{
  uint64_t v2 = type metadata accessor for XPCError(0LL);
  unint64_t v0 = lazy protocol witness table accessor for type XPCError and conformance XPCError();
  return Error.localizedDescription.getter(v2, v0);
}

uint64_t implicit closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()()
{
  uint64_t v2 = type metadata accessor for XPCError(0LL);
  unint64_t v0 = lazy protocol witness table accessor for type XPCError and conformance XPCError();
  return Error.localizedDescription.getter(v2, v0);
}

void *closure #1 in ViewHierarchyAgent.startTargetHubListener()(uint64_t a1, uint64_t a2)
{
  uint64_t v153 = a1;
  uint64_t v152 = a2;
  v137 = "Fatal error";
  int v138 = "ViewHierarchyAgent/ViewHierarchyAgent.swift";
  uint64_t v180 = 0LL;
  v179 = 0LL;
  uint64_t v178 = 0LL;
  uint64_t v176 = 0LL;
  uint64_t v177 = 0LL;
  uint64_t v175 = 0LL;
  uint64_t v139 = 0LL;
  int v173 = 0;
  uint64_t v140 = type metadata accessor for Logger(0LL);
  uint64_t v141 = *(void *)(v140 - 8);
  unint64_t v142 = (*(void *)(v141 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v140);
  v143 = (char *)v70 - v142;
  unint64_t v144 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin((char *)v70 - v142);
  uint64_t v145 = (char *)v70 - v144;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>?);
  unint64_t v146 = (*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v3);
  uint64_t v147 = (uint64_t *)((char *)v70 - v146);
  uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  uint64_t v149 = *(void *)(v148 - 8);
  unint64_t v150 = (*(void *)(v149 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v148);
  v151 = (char *)v70 - v150;
  uint64_t v180 = (char *)v70 - v150;
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  unint64_t v154 = (*(void *)(*(void *)(v155 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = (void *)__chkstk_darwin(v153);
  uint64_t v156 = (uint64_t *)((char *)v70 - v154);
  v179 = v4;
  uint64_t v178 = v5;
  outlined init with copy of Result<XPCPeerConnection, XPCError>(v4, (uint64_t *)((char *)v70 - v154));
  uint64_t v135 = *v156;
  uint64_t v7 = v156[1];
  uint64_t v176 = v135;
  uint64_t v177 = v7;
  swift_retain(v135);
  uint64_t v8 = type metadata accessor for SystemXPCPeerConnection(0LL);
  uint64_t v136 = swift_dynamicCastClass(v135, v8);
  if (v136)
  {
    uint64_t v134 = v136;
  }

  else
  {
    uint64_t v133 = 0LL;
    swift_release(v135);
    uint64_t v134 = v133;
  }

  uint64_t v132 = v134;
  if (v134)
  {
    uint64_t v131 = v132;
    uint64_t v9 = v139;
    uint64_t v129 = v132;
    uint64_t v175 = v132;
    uint64_t result = dispatch thunk of XPCConnection.withUnsafeUnderlyingConnection<A>(_:)( &v174,  closure #1 in closure #1 in ViewHierarchyAgent.startTargetHubListener(),  0LL,  &type metadata for Int32);
    uint64_t v130 = v9;
    if (v9)
    {
      __break(1u);
    }

    else
    {
      int v126 = v174;
      int v173 = v174;
      v127 = &v172;
      int v172 = v174;
      int v128 = (char *)&v171 + 4;
      swift_beginAccess(v152 + 96);
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CheckedContinuation<SystemXPCPeerConnection, Error>]);
      Dictionary.removeValue(forKey:)(v147, v127, v10);
      swift_endAccess(v128);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v149 + 48))(v147, 1LL, v148) == 1)
      {
        uint64_t v11 = outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?((uint64_t)v147);
        dispatch thunk of XPCConnection.cancel()(v11);
        uint64_t v12 = v145;
        uint64_t v13 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v12, v13, v140);
        uint64_t v115 = 7LL;
        uint64_t v14 = swift_allocObject(&unk_100018D10, 20LL, 7LL);
        uint64_t v116 = v14;
        *(_DWORD *)(v14 + 16) = v126;
        uint64_t v124 = (os_log_s *)Logger.logObject.getter(v14);
        int v125 = static os_log_type_t.error.getter();
        uint64_t v111 = &v170;
        uint64_t v170 = 8LL;
        unint64_t v109 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v110 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v15 = lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)(&v171, v111, &type metadata for UInt32, &type metadata for Int, v109, v110, v15);
        uint32_t v112 = v171;
        uint64_t v113 = 17LL;
        uint64_t v16 = swift_allocObject(&unk_100018D38, 17LL, v115);
        uint64_t v17 = v113;
        uint64_t v18 = v115;
        uint64_t v118 = v16;
        *(_BYTE *)(v16 + 16) = 0;
        uint64_t v19 = swift_allocObject(&unk_100018D60, v17, v18);
        uint64_t v20 = v115;
        uint64_t v119 = v19;
        *(_BYTE *)(v19 + 16) = 4;
        uint64_t v114 = 32LL;
        uint64_t v21 = swift_allocObject(&unk_100018D88, 32LL, v20);
        uint64_t v22 = v114;
        uint64_t v23 = v115;
        uint64_t v24 = v21;
        uint64_t v25 = v116;
        uint64_t v117 = v24;
        *(void *)(v24 + 16) = partial apply for implicit closure #3 in closure #1 in ViewHierarchyAgent.startTargetHubListener();
        *(void *)(v24 + 24) = v25;
        uint64_t v26 = swift_allocObject(&unk_100018DB0, v22, v23);
        uint64_t v27 = v117;
        uint64_t v121 = v26;
        *(void *)(v26 + 16) = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int32);
        *(void *)(v26 + 24) = v27;
        uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v120 = _allocateUninitializedArray<A>(_:)(3LL);
        uint64_t v122 = v28;
        swift_retain(v118);
        uint64_t v29 = v119;
        uint64_t v30 = v118;
        uint64_t v31 = v122;
        *uint64_t v122 = closure #1 in OSLogArguments.append(_:)partial apply;
        v31[1] = v30;
        swift_retain(v29);
        uint64_t v32 = v121;
        uint64_t v33 = v119;
        uint64_t v34 = v122;
        v122[2] = closure #1 in OSLogArguments.append(_:)partial apply;
        v34[3] = v33;
        swift_retain(v32);
        uint64_t v35 = v120;
        uint64_t v36 = v121;
        uint64_t v37 = v122;
        v122[4] = partial apply for closure #1 in OSLogArguments.append<A>(_:);
        v37[5] = v36;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease(v35);
        if (os_log_type_enabled(v124, (os_log_type_t)v125))
        {
          uint64_t v68 = v130;
          uint64_t v73 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(8LL, &type metadata for UInt8);
          uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v72 = 0LL;
          uint64_t v74 = createStorage<A>(capacity:type:)(0LL, v71, v71);
          uint64_t v75 = createStorage<A>(capacity:type:)( v72,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
          uint64_t v76 = &v169;
          uint64_t v169 = v73;
          uint64_t v77 = &v168;
          uint64_t v168 = v74;
          unint64_t v78 = &v167;
          uint64_t v167 = v75;
          serialize(_:at:)(0LL, &v169);
          serialize(_:at:)(1LL, v76);
          unint64_t v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          uint64_t v166 = v118;
          closure #1 in osLogInternal(_:log:type:)(&v165, (uint64_t)v76, (uint64_t)v77, (uint64_t)v78);
          uint64_t v79 = v68;
          if (v68)
          {
            __break(1u);
          }

          else
          {
            unint64_t v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
            uint64_t v166 = v119;
            closure #1 in osLogInternal(_:log:type:)(&v165, (uint64_t)&v169, (uint64_t)&v168, (uint64_t)&v167);
            v70[1] = 0LL;
            unint64_t v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append<A>(_:);
            uint64_t v166 = v121;
            closure #1 in osLogInternal(_:log:type:)(&v165, (uint64_t)&v169, (uint64_t)&v168, (uint64_t)&v167);
            _os_log_impl( (void *)&_mh_execute_header,  v124,  (os_log_type_t)v125,  "Received XPC connection from pid %d which we were not expecting",  v73,  v112);
            v70[0] = 0LL;
            destroyStorage<A>(_:count:)(v74, 0LL);
            destroyStorage<A>(_:count:)(v75, v70[0]);
            UnsafeMutablePointer.deallocate()();
            swift_release(v118);
            swift_release(v119);
            swift_release(v121);
          }
        }

        else
        {
          swift_release(v118);
          swift_release(v119);
          swift_release(v121);
        }

        (*(void (**)(char *, uint64_t))(v141 + 8))(v145, v140);
      }

      else
      {
        (*(void (**)(char *, void *, uint64_t))(v149 + 32))(v151, v147, v148);
        swift_retain(v152);
        uint64_t v98 = 7LL;
        uint64_t v38 = swift_allocObject(&unk_100018DD8, 28LL, 7LL);
        int v39 = v126;
        uint64_t v91 = v38;
        *(void *)(v38 + 16) = v152;
        *(_DWORD *)(v38 + 24) = v39;
        dispatch thunk of SystemXPCPeerConnection.setEventHandler(_:)(partial apply for closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener());
        uint64_t v40 = swift_release(v91);
        dispatch thunk of XPCConnection.activate()(v40);
        swift_retain(v129);
        uint64_t v164 = v129;
        CheckedContinuation.resume(returning:)(&v164, v148);
        uint64_t v41 = v143;
        uint64_t v42 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v41, v42, v140);
        uint64_t v43 = swift_allocObject(&unk_100018E00, 20LL, v98);
        uint64_t v99 = v43;
        *(_DWORD *)(v43 + 16) = v126;
        uint64_t v107 = (os_log_s *)Logger.logObject.getter(v43);
        int v108 = static os_log_type_t.default.getter();
        uint64_t v94 = &v162;
        uint64_t v162 = 8LL;
        unint64_t v92 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v93 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v44 = lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)(&v163, v94, &type metadata for UInt32, &type metadata for Int, v92, v93, v44);
        uint32_t v95 = v163;
        uint64_t v96 = 17LL;
        uint64_t v45 = swift_allocObject(&unk_100018E28, 17LL, v98);
        uint64_t v46 = v96;
        uint64_t v47 = v98;
        uint64_t v101 = v45;
        *(_BYTE *)(v45 + 16) = 0;
        uint64_t v48 = swift_allocObject(&unk_100018E50, v46, v47);
        uint64_t v49 = v98;
        uint64_t v102 = v48;
        *(_BYTE *)(v48 + 16) = 4;
        uint64_t v97 = 32LL;
        uint64_t v50 = swift_allocObject(&unk_100018E78, 32LL, v49);
        uint64_t v51 = v97;
        uint64_t v52 = v98;
        uint64_t v53 = v50;
        uint64_t v54 = v99;
        uint64_t v100 = v53;
        *(void *)(v53 + 16) = partial apply for implicit closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener();
        *(void *)(v53 + 24) = v54;
        uint64_t v55 = swift_allocObject(&unk_100018EA0, v51, v52);
        uint64_t v56 = v100;
        uint64_t v104 = v55;
        *(void *)(v55 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int32)partial apply;
        *(void *)(v55 + 24) = v56;
        uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v103 = _allocateUninitializedArray<A>(_:)(3LL);
        id v105 = v57;
        swift_retain(v101);
        uint64_t v58 = v102;
        uint64_t v59 = v101;
        uint64_t v60 = v105;
        *id v105 = closure #1 in OSLogArguments.append(_:)partial apply;
        v60[1] = v59;
        swift_retain(v58);
        uint64_t v61 = v104;
        uint64_t v62 = v102;
        uint64_t v63 = v105;
        v105[2] = closure #1 in OSLogArguments.append(_:)partial apply;
        v63[3] = v62;
        swift_retain(v61);
        uint64_t v64 = v103;
        uint64_t v65 = v104;
        uint64_t v66 = v105;
        v105[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
        v66[5] = v65;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease(v64);
        if (os_log_type_enabled(v107, (os_log_type_t)v108))
        {
          uint64_t v67 = v130;
          unint64_t v84 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(8LL, &type metadata for UInt8);
          uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v83 = 0LL;
          uint64_t v85 = createStorage<A>(capacity:type:)(0LL, v82, v82);
          uint64_t v86 = createStorage<A>(capacity:type:)( v83,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
          uint64_t v87 = &v161;
          v161 = v84;
          uint64_t v88 = &v160;
          uint64_t v160 = v85;
          uint64_t v89 = &v159;
          uint64_t v159 = v86;
          serialize(_:at:)(0LL, &v161);
          serialize(_:at:)(1LL, v87);
          uint64_t v157 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          uint64_t v158 = v101;
          closure #1 in osLogInternal(_:log:type:)(&v157, (uint64_t)v87, (uint64_t)v88, (uint64_t)v89);
          uint64_t v90 = v67;
          if (v67)
          {
            __break(1u);
          }

          else
          {
            uint64_t v157 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
            uint64_t v158 = v102;
            closure #1 in osLogInternal(_:log:type:)(&v157, (uint64_t)&v161, (uint64_t)&v160, (uint64_t)&v159);
            uint64_t v81 = 0LL;
            uint64_t v157 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
            uint64_t v158 = v104;
            closure #1 in osLogInternal(_:log:type:)(&v157, (uint64_t)&v161, (uint64_t)&v160, (uint64_t)&v159);
            _os_log_impl( (void *)&_mh_execute_header,  v107,  (os_log_type_t)v108,  "Established XPC connection to TargetBub on pid %d",  v84,  v95);
            uint64_t v80 = 0LL;
            destroyStorage<A>(_:count:)(v85, 0LL);
            destroyStorage<A>(_:count:)(v86, v80);
            UnsafeMutablePointer.deallocate()();
            swift_release(v101);
            swift_release(v102);
            swift_release(v104);
          }
        }

        else
        {
          swift_release(v101);
          swift_release(v102);
          swift_release(v104);
        }

        (*(void (**)(char *, uint64_t))(v141 + 8))(v143, v140);
        (*(void (**)(char *, uint64_t))(v149 + 8))(v151, v148);
      }

      swift_release(v129);
      return (void *)swift_release(v135);
    }
  }

  else
  {
    Swift::String v69 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "Peer should be a SystemXPCConnection",  0x24uLL,  1);
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( v137,  11LL,  2LL,  v69._countAndFlagsBits,  v69._object,  v138,  43LL);
    __break(1u);
  }

  return result;
}

uint64_t closure #1 in closure #1 in ViewHierarchyAgent.startTargetHubListener()@<X0>( _xpc_connection_s *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = xpc_connection_get_pid(a1);
  *a2 = result;
  return result;
}

uint64_t closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()( uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v78 = a1;
  uint64_t v76 = a2;
  int v77 = a3;
  uint64_t v100 = 0LL;
  uint64_t v99 = 0LL;
  uint64_t v98 = 0LL;
  int v97 = 0;
  uint64_t v69 = 0LL;
  uint64_t v74 = 0LL;
  uint64_t v70 = type metadata accessor for Logger(0LL);
  uint64_t v71 = *(void *)(v70 - 8);
  unint64_t v72 = (*(void *)(v71 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v70);
  uint64_t v73 = (char *)v39 - v72;
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  unint64_t v75 = (*(void *)(*(void *)(v86 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v3 = __chkstk_darwin(v74);
  uint64_t v87 = (uint64_t)v39 - v75;
  uint64_t v79 = type metadata accessor for XPCError(v3);
  uint64_t v80 = *(void *)(v79 - 8);
  uint64_t v82 = *(void *)(v80 + 64);
  unint64_t v81 = (v82 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(v78);
  uint64_t v83 = (char *)v39 - v81;
  unint64_t v84 = (v82 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v85 = (char *)v39 - v84;
  uint64_t v100 = (char *)v39 - v84;
  uint64_t v99 = v5;
  uint64_t v98 = v6;
  int v97 = v7;
  outlined init with copy of Result<XPCDictionary, XPCError>(v5, v8);
  uint64_t v51 = *(void (**)(char *, uint64_t, uint64_t))(v80 + 32);
  v51(v85, v87, v79);
  uint64_t v48 = &v95;
  int v95 = v77;
  uint64_t v49 = (char *)&v94 + 4;
  swift_beginAccess(v76 + 88);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CaptureController]);
  Dictionary.removeValue(forKey:)(&v96, v48, v10);
  uint64_t v11 = v73;
  swift_endAccess(v49);
  swift_release(v96);
  uint64_t v12 = logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v11, v12, v70);
  (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v83, v85, v79);
  uint64_t v13 = *(unsigned __int8 *)(v80 + 80);
  uint64_t v50 = (v13 + 16) & ~v13;
  uint64_t v58 = 7LL;
  uint64_t v59 = swift_allocObject(&unk_100018EC8, v50 + v82, v13 | 7);
  uint64_t v14 = ((uint64_t (*)(uint64_t, char *, uint64_t))v51)(v59 + v50, v83, v79);
  uint64_t v67 = (os_log_s *)Logger.logObject.getter(v14);
  int v68 = static os_log_type_t.default.getter();
  uint64_t v54 = &v93;
  uint64_t v93 = 12LL;
  unint64_t v52 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v53 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v15 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(&v94, v54, &type metadata for UInt32, &type metadata for Int, v52, v53, v15);
  uint32_t v55 = v94;
  uint64_t v56 = 17LL;
  uint64_t v16 = swift_allocObject(&unk_100018EF0, 17LL, v58);
  uint64_t v17 = v56;
  uint64_t v18 = v58;
  uint64_t v61 = v16;
  *(_BYTE *)(v16 + 16) = 32;
  uint64_t v19 = swift_allocObject(&unk_100018F18, v17, v18);
  uint64_t v20 = v58;
  uint64_t v62 = v19;
  *(_BYTE *)(v19 + 16) = 8;
  uint64_t v57 = 32LL;
  uint64_t v21 = swift_allocObject(&unk_100018F40, 32LL, v20);
  uint64_t v22 = v57;
  uint64_t v23 = v58;
  uint64_t v24 = v21;
  uint64_t v25 = v59;
  uint64_t v60 = v24;
  *(void *)(v24 + 16) = partial apply for implicit closure #1 in closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener();
  *(void *)(v24 + 24) = v25;
  uint64_t v26 = swift_allocObject(&unk_100018F68, v22, v23);
  uint64_t v27 = v60;
  uint64_t v64 = v26;
  *(void *)(v26 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  *(void *)(v26 + 24) = v27;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v63 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v65 = v28;
  swift_retain(v61);
  uint64_t v29 = v62;
  uint64_t v30 = v61;
  uint64_t v31 = v65;
  *uint64_t v65 = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[1] = v30;
  swift_retain(v29);
  uint64_t v32 = v64;
  uint64_t v33 = v62;
  uint64_t v34 = v65;
  v65[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v34[3] = v33;
  swift_retain(v32);
  uint64_t v35 = v63;
  uint64_t v36 = v64;
  uint64_t v37 = v65;
  v65[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v37[5] = v36;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease(v35);
  if (os_log_type_enabled(v67, (os_log_type_t)v68))
  {
    uint64_t v38 = v69;
    uint64_t v41 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v42 = createStorage<A>(capacity:type:)(0LL, v40, v40);
    uint64_t v43 = createStorage<A>(capacity:type:)( 1LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    unint64_t v44 = &v92;
    unint64_t v92 = v41;
    uint64_t v45 = &v91;
    uint64_t v91 = v42;
    uint64_t v46 = &v90;
    uint64_t v90 = v43;
    serialize(_:at:)(2LL, &v92);
    serialize(_:at:)(1LL, v44);
    uint64_t v88 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v89 = v61;
    closure #1 in osLogInternal(_:log:type:)(&v88, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46);
    uint64_t v47 = v38;
    if (v38)
    {
      __break(1u);
    }

    else
    {
      uint64_t v88 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v89 = v62;
      closure #1 in osLogInternal(_:log:type:)(&v88, (uint64_t)&v92, (uint64_t)&v91, (uint64_t)&v90);
      v39[0] = 0LL;
      uint64_t v88 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v89 = v64;
      closure #1 in osLogInternal(_:log:type:)(&v88, (uint64_t)&v92, (uint64_t)&v91, (uint64_t)&v90);
      _os_log_impl( (void *)&_mh_execute_header,  v67,  (os_log_type_t)v68,  "TargetHubXPCPeerConnection received an error: %s",  v41,  v55);
      destroyStorage<A>(_:count:)(v42, 0LL);
      destroyStorage<A>(_:count:)(v43, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release(v61);
      swift_release(v62);
      swift_release(v64);
    }
  }

  else
  {
    swift_release(v61);
    swift_release(v62);
    swift_release(v64);
  }

  (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v70);
  return (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v85, v79);
}

uint64_t implicit closure #1 in closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()()
{
  uint64_t v2 = type metadata accessor for XPCError(0LL);
  unint64_t v0 = lazy protocol witness table accessor for type XPCError and conformance XPCError();
  return Error.localizedDescription.getter(v2, v0);
}

uint64_t closure #1 in ViewHierarchyAgent.handleMessage(_:from:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[13] = a7;
  v7[12] = a5;
  v7[7] = v7;
  v7[8] = 0LL;
  v7[5] = 0LL;
  v7[6] = 0LL;
  v7[9] = 0LL;
  v7[10] = 0LL;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
  v7[14] = swift_task_alloc((*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for XPCDictionary(0LL);
  v7[15] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v7[16] = v11;
  uint64_t v14 = *(void *)(v11 + 64);
  v7[17] = swift_task_alloc((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v7[18] = swift_task_alloc((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v7[8] = a4;
  v7[5] = a5;
  v7[6] = a6;
  v7[9] = a7;
  uint64_t v12 = (void *)swift_task_alloc(dword_10001C5E4);
  *(void *)(v15 + 152) = v12;
  *uint64_t v12 = *(void *)(v15 + 56);
  v12[1] = closure #1 in ViewHierarchyAgent.handleMessage(_:from:);
  return ViewHierarchyAgent.performRequest(connection:message:)(a5, a6, a7);
}

void *closure #1 in ViewHierarchyAgent.handleMessage(_:from:)()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 152LL);
  v2[7] = *(void *)v1;
  v2 += 7;
  int v7 = v2 - 5;
  uint64_t v8 = v2;
  v2[13] = v0;
  swift_task_dealloc(v3);
  if (v0) {
    return (void *)swift_task_switch(closure #1 in ViewHierarchyAgent.handleMessage(_:from:), 0LL);
  }
  uint64_t v5 = v7[15];
  uint64_t v6 = v7[12];
  swift_task_dealloc(v7[16]);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(void *(**)(void *__return_ptr))(*v8 + 8LL))(v8);
}

uint64_t closure #1 in ViewHierarchyAgent.handleMessage(_:from:)()
{
  uint64_t v15 = v0[20];
  uint64_t v16 = v0[16];
  uint64_t v18 = v0[15];
  uint64_t v17 = v0[14];
  v0[7] = v0;
  uint64_t v1 = swift_errorRetain();
  v0[10] = v15;
  XPCDictionary.createReply()(v1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v17, 1LL, v18) == 1)
  {
    char v4 = 2;
    return _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "ViewHierarchyAgent/ViewHierarchyAgent.swift",  43LL,  v4,  162LL,  0);
  }

  else
  {
    uint64_t v11 = v14[20];
    uint64_t v6 = v14[18];
    uint64_t v8 = v14[17];
    uint64_t v5 = v14[16];
    uint64_t v9 = v14[15];
    uint64_t v7 = v14[12];
    (*(void (**)(void))(v5 + 32))();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("error", 5uLL, 1);
    swift_getErrorValue(v11, v14 + 11, v14 + 2);
    uint64_t v3 = Error.localizedDescription.getter(v14[3], v14[4]);
    XPCDictionary.subscript.setter(v3);
    swift_retain(v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v8, v9);
    dispatch thunk of XPCConnection.send(message:)(v6);
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v10(v6, v9);
    swift_release(v7);
    v10(v8, v9);
    swift_errorRelease(v11);
    swift_errorRelease(v11);
    uint64_t v12 = v14[17];
    uint64_t v13 = v14[14];
    swift_task_dealloc(v14[18]);
    swift_task_dealloc(v12);
    swift_task_dealloc(v13);
    return (*(uint64_t (**)(void))(v14[7] + 8LL))();
  }

uint64_t ViewHierarchyAgent.performRequest(connection:message:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 152) = v3;
  *(void *)(v4 + 144) = a3;
  *(void *)(v4 + 136) = a1;
  *(void *)(v4 + 96) = v4;
  *(void *)(v4 + 64) = 0LL;
  *(void *)(v4 + 72) = 0LL;
  *(void *)(v4 + 104) = 0LL;
  *(void *)(v4 + 112) = 0LL;
  *(_DWORD *)(v4 + 344) = 0;
  *(void *)(v4 + 80) = 0LL;
  *(void *)(v4 + 88) = 0LL;
  *(void *)(v4 + 120) = 0LL;
  *(void *)(v4 + 128) = 0LL;
  *(_DWORD *)(v4 + 360) = 0;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
  *(void *)(v4 + 160) = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for XPCDictionary(0LL);
  *(void *)(v4 + 168) = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  *(void *)(v4 + 176) = v7;
  uint64_t v11 = *(void *)(v7 + 64);
  *(void *)(v4 + 184) = swift_task_alloc((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v4 + 192) = swift_task_alloc((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for URL(0LL);
  *(void *)(v4 + 200) = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  *(void *)(v4 + 208) = v9;
  uint64_t v12 = *(void *)(v9 + 64);
  *(void *)(v4 + 216) = v12;
  *(void *)(v4 + 224) = swift_task_alloc((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v4 + 232) = swift_task_alloc((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v4 + 240) = swift_task_alloc((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v4 + 248) = swift_task_alloc((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                              - 8)
                  + 64LL);
  *(void *)(v4 + 256) = swift_task_alloc((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v4 + 264) = swift_task_alloc((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v4 + 272) = swift_task_alloc((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v4 + 64) = a1;
  *(void *)(v4 + 72) = a2;
  *(void *)(v4 + 104) = a3;
  *(void *)(v4 + 112) = v3;
  return swift_task_switch(ViewHierarchyAgent.performRequest(connection:message:), 0LL);
}

uint64_t ViewHierarchyAgent.performRequest(connection:message:)()
{
  *(void *)(v0 + 96) = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pid", 3uLL, 1);
  unint64_t v2 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  XPCDictionary.subscript.getter((void *)(v0 + 348), v1._countAndFlagsBits, v1._object, &type metadata for Int32, v2);
  int v20 = *(_DWORD *)(v0 + 348);
  if ((*(_BYTE *)(v0 + 352) & 1) != 0)
  {
    swift_bridgeObjectRelease(v1._object);
  }

  else
  {
    *(_DWORD *)(v19 + 344) = v20;
    swift_bridgeObjectRelease(v1._object);
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("request", 7uLL, 1);
    uint64_t v18 = XPCDictionary.subscript.getter(v3._countAndFlagsBits);
    *(void *)(v19 + 280) = v18;
    *(void *)(v19 + 288) = v4;
    if (v4)
    {
      *(void *)(v19 + 80) = v18;
      *(void *)(v19 + 88) = v4;
      swift_bridgeObjectRelease(v3._object);
      uint64_t v5 = (void *)swift_task_alloc(dword_10001C5FC);
      *(void *)(v19 + 296) = v5;
      *uint64_t v5 = *(void *)(v19 + 96);
      v5[1] = ViewHierarchyAgent.performRequest(connection:message:);
      return ViewHierarchyAgent.captureController(for:)(v20);
    }

    swift_bridgeObjectRelease(v3._object);
  }

  unint64_t v7 = lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
  swift_allocError(&type metadata for ViewHierarchyAgentError, v7, 0LL, 0LL);
  *uint64_t v8 = 0;
  swift_willThrow();
  uint64_t v9 = *(void *)(v19 + 264);
  uint64_t v10 = *(void *)(v19 + 256);
  uint64_t v11 = *(void *)(v19 + 248);
  uint64_t v12 = *(void *)(v19 + 240);
  uint64_t v13 = *(void *)(v19 + 232);
  uint64_t v14 = *(void *)(v19 + 224);
  uint64_t v15 = *(void *)(v19 + 192);
  uint64_t v16 = *(void *)(v19 + 184);
  uint64_t v17 = *(void *)(v19 + 160);
  swift_task_dealloc(*(void *)(v19 + 272));
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(*(void *)(v19 + 96) + 8LL))();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  _BYTE *v8;
  id v9;
  void *v10;
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
  void *v23;
  const void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const void *v33;
  void *v34;
  Swift::Int32 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(void);
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  Swift::String v1 = v0[38];
  unint64_t v2 = v0[17];
  uint64_t v43 = v2;
  v0[12] = v0;
  v0[15] = v1;
  swift_retain(v2);
  Swift::String v3 = type metadata accessor for SystemXPCConnection(0LL);
  unint64_t v44 = swift_dynamicCastClass(v43, v3);
  if (!v44)
  {
    swift_release(*(void *)(v42 + 136));
    uint64_t v6 = *(void *)(v42 + 312);
    uint64_t v38 = *(void *)(v42 + 248);
    uint64_t v40 = *(void *)(v42 + 240);
    uint64_t v36 = *(void *)(v42 + 208);
    uint64_t v37 = *(void *)(v42 + 200);
    CaptureController.createTemporaryFile()(v38);
    type metadata accessor for NSFileHandle();
    int v39 = *(void (**)(void))(v36 + 16);
    ((void (*)(uint64_t, uint64_t, uint64_t))v39)(v40, v38, v37);
    uint64_t v41 = @nonobjc NSFileHandle.__allocating_init(forWritingTo:)(v40);
    if (!v6)
    {
      uint64_t v25 = *(void **)(v42 + 272);
      uint64_t v24 = *(const void **)(v42 + 264);
      uint64_t v28 = *(void *)(v42 + 248);
      uint64_t v26 = *(void *)(v42 + 208);
      uint64_t v27 = *(void *)(v42 + 200);
      *(void *)(v42 + 128) = v41;
      v39();
      (*(void (**)(const void *, void, uint64_t, uint64_t))(v26 + 56))(v24, 0LL, 1LL, v27);
      outlined init with take of URL?(v24, v25);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v27);
LABEL_9:
      uint64_t v22 = *(void *)(v42 + 288);
      swift_bridgeObjectRetain(v22);
      uint64_t v23 = *(void **)(v42 + 128);
      *(void *)(v42 + 320) = v23;
      uint64_t v9 = v23;
      uint64_t v10 = (void *)swift_task_alloc(dword_10001C49C);
      *(void *)(v42 + 328) = v10;
      *uint64_t v10 = *(void *)(v42 + 96);
      v10[1] = ViewHierarchyAgent.performRequest(connection:message:);
      return CaptureController.performRequest(_:using:)(*(void *)(v42 + 280), v22, (uint64_t)v23);
    }

    int v20 = *(void *)(v42 + 304);
    uint64_t v21 = *(void *)(v42 + 288);
    (*(void (**)(void, void))(*(void *)(v42 + 208) + 8LL))( *(void *)(v42 + 248),  *(void *)(v42 + 200));
    swift_release(v20);
    swift_bridgeObjectRelease(v21);
    goto LABEL_12;
  }

  swift_release(v44);
  uint64_t v4 = *(void *)(v42 + 312);
  uint64_t result = XPCDictionary.withUnsafeUnderlyingDictionary<A>(_:)(closure #1 in ViewHierarchyAgent.performRequest(connection:message:));
  if (!v4)
  {
    uint64_t v35 = *(_DWORD *)(v42 + 356);
    *(_DWORD *)(v42 + 360) = v35;
    if (v35 > 0)
    {
      uint64_t v34 = *(void **)(v42 + 272);
      uint64_t v33 = *(const void **)(v42 + 264);
      uint64_t v31 = *(void *)(v42 + 208);
      uint64_t v32 = *(void *)(v42 + 200);
      type metadata accessor for NSFileHandle();
      *(NSFileHandle *)(v42 + 128) = NSFileHandle.__allocating_init(fileDescriptor:closeOnDealloc:)(v35, 1);
      (*(void (**)(const void *, uint64_t, uint64_t, uint64_t))(v31 + 56))(v33, 1LL, 1LL, v32);
      outlined init with take of URL?(v33, v34);
      goto LABEL_9;
    }

    uint64_t v29 = *(void *)(v42 + 304);
    uint64_t v30 = *(void *)(v42 + 288);
    unint64_t v7 = lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
    swift_allocError(&type metadata for ViewHierarchyAgentError, v7, 0LL, 0LL);
    *uint64_t v8 = 1;
    swift_willThrow();
    swift_release(v29);
    swift_bridgeObjectRelease(v30);
LABEL_12:
    uint64_t v11 = *(void *)(v42 + 264);
    uint64_t v12 = *(void *)(v42 + 256);
    uint64_t v13 = *(void *)(v42 + 248);
    uint64_t v14 = *(void *)(v42 + 240);
    uint64_t v15 = *(void *)(v42 + 232);
    uint64_t v16 = *(void *)(v42 + 224);
    uint64_t v17 = *(void *)(v42 + 192);
    uint64_t v18 = *(void *)(v42 + 184);
    uint64_t v19 = *(void *)(v42 + 160);
    swift_task_dealloc(*(void *)(v42 + 272));
    swift_task_dealloc(v11);
    swift_task_dealloc(v12);
    swift_task_dealloc(v13);
    swift_task_dealloc(v14);
    swift_task_dealloc(v15);
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    swift_task_dealloc(v19);
    return (*(uint64_t (**)(void))(*(void *)(v42 + 96) + 8LL))();
  }

  return result;
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v2 = *v1;
  Swift::String v3 = *(void *)(*v1 + 328);
  *(void *)(v2 + 96) = *v1;
  v2 += 96LL;
  uint64_t v6 = v2 - 80;
  *(void *)(v2 + 240) = v0;
  swift_task_dealloc(v3);
  if (v0) {
    return swift_task_switch(ViewHierarchyAgent.performRequest(connection:message:), 0LL);
  }
  uint64_t v5 = *(void *)(v6 + 272);

  swift_bridgeObjectRelease(v5);
  return swift_task_switch(ViewHierarchyAgent.performRequest(connection:message:), 0LL);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v1 = v0[36];
  v0[12] = v0;
  swift_bridgeObjectRelease(v1);
  Swift::String v3 = v0[33];
  uint64_t v4 = v0[32];
  uint64_t v5 = v0[31];
  uint64_t v6 = v0[30];
  unint64_t v7 = v0[29];
  uint64_t v8 = v0[28];
  uint64_t v9 = v0[24];
  uint64_t v10 = v0[23];
  uint64_t v11 = v0[20];
  swift_task_dealloc(v0[34]);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0[12] + 8LL))();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::String v1 = *(void **)(v0 + 320);
  uint64_t v4 = *(void *)(v0 + 304);
  uint64_t v5 = *(void *)(v0 + 288);
  Swift::String v3 = *(void *)(v0 + 272);
  *(void *)(v0 + 96) = v0;

  swift_bridgeObjectRelease(v5);
  outlined destroy of URL?(v3);

  swift_release(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(v0 + 264);
  unint64_t v7 = *(void *)(v0 + 256);
  uint64_t v8 = *(void *)(v0 + 248);
  uint64_t v9 = *(void *)(v0 + 240);
  uint64_t v10 = *(void *)(v0 + 232);
  uint64_t v11 = *(void *)(v0 + 224);
  uint64_t v12 = *(void *)(v0 + 192);
  uint64_t v13 = *(void *)(v0 + 184);
  uint64_t v14 = *(void *)(v0 + 160);
  swift_task_dealloc(*(void *)(v0 + 272));
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(void))(*(void *)(v0 + 96) + 8LL))();
}

uint64_t ViewHierarchyAgent.performRequest(connection:message:)(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 296LL);
  v4[12] = *(void *)v2;
  v4[38] = a1;
  v4[39] = v1;
  swift_task_dealloc(v5);
  if (v1) {
    return swift_task_switch(ViewHierarchyAgent.performRequest(connection:message:), 0LL);
  }
  else {
    return swift_task_switch(ViewHierarchyAgent.performRequest(connection:message:), 0LL);
  }
}

{
  void *v1;
  uint64_t v3;
  Swift::String v4;
  uint64_t v5;
  uint64_t v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
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
  void (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const void *aBlock;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v43 = v1[22];
  uint64_t v45 = v1[21];
  unint64_t v44 = v1[20];
  v1[12] = v1;
  XPCDictionary.createReply()(a1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v44, 1LL, v45) == 1) {
    return _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "ViewHierarchyAgent/ViewHierarchyAgent.swift",  43LL,  2,  213LL,  0);
  }
  uint64_t v40 = *(void *)(v42 + 136);
  (*(void (**)(void, void, void))(*(void *)(v42 + 176) + 32LL))( *(void *)(v42 + 192),  *(void *)(v42 + 160),  *(void *)(v42 + 168));
  swift_retain(v40);
  Swift::String v3 = type metadata accessor for RemoteXPCPeerConnection(0LL);
  uint64_t v41 = swift_dynamicCastClass(v40, v3);
  if (v41)
  {
    swift_release(v41);
    int v39 = *(void **)(v42 + 256);
    uint64_t v37 = *(void *)(v42 + 208);
    uint64_t v38 = *(void *)(v42 + 200);
    outlined init with copy of URL?(*(const void **)(v42 + 272), v39);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v37 + 48))(v39, 1LL, v38) == 1)
    {
      outlined destroy of URL?(*(void *)(v42 + 256));
      unint64_t v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Should have a temporary file!", 0x1DuLL, 1);
      return _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v7._countAndFlagsBits,  v7._object,  "ViewHierarchyAgent/ViewHierarchyAgent.swift",  43LL);
    }

    uint64_t v35 = *(void *)(v42 + 232);
    uint64_t v26 = *(void *)(v42 + 224);
    uint64_t v24 = *(void *)(v42 + 216);
    uint64_t v34 = *(void *)(v42 + 208);
    uint64_t v36 = *(void *)(v42 + 200);
    uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32);
    ((void (*)(uint64_t, void))v27)(v35, *(void *)(v42 + 256));
    uint64_t v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ft", 2uLL, 1);
    uint64_t v29 = URL.path.getter();
    uint64_t v32 = v5;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v26, v35, v36);
    uint64_t v6 = *(unsigned __int8 *)(v34 + 80);
    uint64_t v25 = (v6 + 16) & ~v6;
    uint64_t v28 = swift_allocObject(&unk_100018BA8, v25 + v24, v6 | 7);
    v27(v28 + v25, v26, v36);
    *(void *)(v42 + 48) = partial apply for closure #2 in ViewHierarchyAgent.performRequest(connection:message:);
    *(void *)(v42 + 56) = v28;
    *(void *)(v42 + 16) = _NSConcreteStackBlock;
    *(_DWORD *)(v42 + 24) = 1107296256;
    *(_DWORD *)(v42 + 28) = 0;
    *(void *)(v42 + 32) = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
    *(void *)(v42 + 40) = &block_descriptor;
    aBlock = _Block_copy((const void *)(v42 + 16));
    swift_release(*(void *)(v42 + 56));
    uint64_t v30 = String.utf8CString.getter(v29, v32);
    swift_retain(v30);
    swift_release(v30);
    swift_retain(v30);
    swift_bridgeObjectRelease(v30);
    uint64_t v33 = xpc_file_transfer_create_with_path(v30 + 32, aBlock);
    swift_unknownObjectRelease(v30);
    _Block_release(aBlock);
    swift_bridgeObjectRelease(v32);
    XPCDictionary.subscript.setter(v33, v4._countAndFlagsBits, v4._object);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v36);
  }

  else
  {
    swift_release(*(void *)(v42 + 136));
  }

  uint64_t v12 = *(void *)(v42 + 304);
  uint64_t v14 = *(void *)(v42 + 272);
  uint64_t v15 = *(void *)(v42 + 264);
  uint64_t v16 = *(void *)(v42 + 256);
  uint64_t v17 = *(void *)(v42 + 248);
  uint64_t v18 = *(void *)(v42 + 240);
  uint64_t v19 = *(void *)(v42 + 232);
  int v20 = *(void *)(v42 + 224);
  uint64_t v21 = *(void *)(v42 + 192);
  uint64_t v22 = *(void *)(v42 + 184);
  uint64_t v8 = *(void *)(v42 + 176);
  uint64_t v10 = *(void *)(v42 + 168);
  uint64_t v23 = *(void *)(v42 + 160);
  uint64_t v9 = *(void *)(v42 + 136);
  uint64_t v13 = *(void *)(v42 + 288);
  swift_retain(v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v22, v21, v10);
  dispatch thunk of XPCConnection.send(message:)(v22);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v11(v22, v10);
  swift_release(v9);
  v11(v21, v10);
  outlined destroy of URL?(v14);

  swift_release(v12);
  swift_bridgeObjectRelease(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(*(void *)(v42 + 96) + 8LL))();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v23[4] = a4;
  uint64_t v21 = type metadata accessor for TaskPriority(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v22 + 48))(a1, 1LL) == 1)
  {
    outlined destroy of TaskPriority?(a1);
    uint64_t v16 = 0LL;
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a1, v21);
    uint64_t v16 = v15;
  }

  uint64_t v14 = *(void *)(a3 + 16);
  uint64_t v13 = *(void *)(a3 + 24);
  swift_unknownObjectRetain();
  if (v14)
  {
    uint64_t ObjectType = swift_getObjectType(v14);
    uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v13);
    uint64_t v10 = v5;
    swift_unknownObjectRelease(v14);
    uint64_t v11 = v9;
    uint64_t v12 = v10;
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  unint64_t v7 = (void *)swift_allocObject(&unk_100018CE8, 40LL, 7LL);
  v7[2] = a4;
  v7[3] = a2;
  v7[4] = a3;
  uint64_t v8 = 0LL;
  if (v11 != 0 || v12 != 0)
  {
    v23[0] = 0LL;
    v23[1] = 0LL;
    v23[2] = v11;
    v23[3] = v12;
    uint64_t v8 = v23;
  }

  return swift_task_create(v16 | 0x1C00, v8, a4, &_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATu, v7);
}

void ViewHierarchyAgent.finish(_:)(uint64_t a1)
{
  uint64_t v9 = a1;
  uint64_t v8 = v1;
  Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pid", 3uLL, 1);
  unint64_t v3 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  XPCDictionary.subscript.getter(&v7, v2._countAndFlagsBits, v2._object, &type metadata for Int32, v3);
  Swift::Int32 v6 = v7;
  if ((v7 & 0x100000000LL) != 0)
  {
    swift_bridgeObjectRelease(v2._object);
    unint64_t v4 = lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
    swift_allocError(&type metadata for ViewHierarchyAgentError, v4, 0LL, 0LL);
    *uint64_t v5 = 0;
    swift_willThrow();
  }

  else
  {
    swift_bridgeObjectRelease(v2._object);
    ViewHierarchyAgent.finish(_:)(v6);
  }

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #2 in ViewHierarchyAgent.handleMessage(_:from:)()
{
}

uint64_t ViewHierarchyAgent.captureController(for:)(int a1)
{
  *(void *)(v2 + 128) = v1;
  *(_DWORD *)(v2 + 180) = a1;
  *(void *)(v2 + 80) = v2;
  *(_DWORD *)(v2 + 168) = 0;
  *(void *)(v2 + 88) = 0LL;
  *(void *)(v2 + 64) = 0LL;
  *(void *)(v2 + 72) = 0LL;
  *(void *)(v2 + 104) = 0LL;
  *(void *)(v2 + 120) = 0LL;
  *(_DWORD *)(v2 + 168) = a1;
  *(void *)(v2 + 88) = v1;
  return swift_task_switch(ViewHierarchyAgent.captureController(for:), 0LL);
}

uint64_t ViewHierarchyAgent.captureController(for:)()
{
  uint64_t v5 = *(void *)(v0 + 128);
  int v6 = *(_DWORD *)(v0 + 180);
  *(void *)(v0 + 80) = v0;
  swift_beginAccess(v5 + 88);
  uint64_t v7 = *(void *)(v5 + 88);
  *(_DWORD *)(v0 + 172) = v6;
  uint64_t v1 = type metadata accessor for CaptureController(0LL);
  *(void *)(v0 + 136) = v1;
  Dictionary.subscript.getter(v0 + 172, v7, &type metadata for Int32, v1, &protocol witness table for Int32);
  uint64_t v8 = *(void *)(v0 + 96);
  if (v8)
  {
    *(void *)(v4 + 120) = v8;
    swift_endAccess(v4 + 16);
    return (*(uint64_t (**)(uint64_t))(*(void *)(v4 + 80) + 8LL))(v8);
  }

  else
  {
    swift_endAccess(v4 + 16);
    unint64_t v3 = (void *)swift_task_alloc(dword_10001C60C);
    *(void *)(v4 + 144) = v3;
    *unint64_t v3 = *(void *)(v4 + 80);
    v3[1] = ViewHierarchyAgent.captureController(for:);
    return ViewHierarchyAgent.establishTargetHubConnection(to:)(*(_DWORD *)(v4 + 180));
  }

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void v9[5];
  unint64_t v3 = *(void *)(v0 + 160);
  uint64_t v7 = *(void *)(v0 + 152);
  int v6 = *(void *)(v0 + 128);
  uint64_t v5 = *(_DWORD *)(v0 + 180);
  *(void *)(v0 + 80) = v0;
  *(void *)(v0 + 64) = v7;
  *(void *)(v0 + 72) = v3;
  uint64_t v4 = type metadata accessor for SystemXPCRequestExecutor();
  swift_retain(v7);
  v9[3] = v4;
  v9[4] = &protocol witness table for SystemXPCRequestExecutor;
  v9[0] = SystemXPCRequestExecutor.__allocating_init(targetConnection:)(v7, v3);
  uint64_t v8 = CaptureController.__allocating_init(requestExecutor:)(v9);
  *(void *)(v0 + 104) = v8;
  swift_retain(v8);
  *(void *)(v0 + 112) = v8;
  *(_DWORD *)(v0 + 176) = v5;
  swift_beginAccess(v6 + 88);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CaptureController]);
  Dictionary.subscript.setter(v0 + 112, v0 + 176, v1);
  swift_endAccess(v0 + 40);
  swift_release(v7);
  return (*(uint64_t (**)(uint64_t))(*(void *)(v0 + 80) + 8LL))(v8);
}

void *ViewHierarchyAgent.captureController(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)v3;
  uint64_t v6 = *(void *)(*(void *)v3 + 144LL);
  v5[10] = *(void *)v3;
  uint64_t v9 = v5 + 10;
  v5[19] = a1;
  v5[20] = a2;
  uint64_t v7 = swift_task_dealloc(v6);
  if (v2) {
    return (*(void *(**)(void *__return_ptr, uint64_t))(*v9 + 8LL))(v9, v7);
  }
  else {
    return (void *)swift_task_switch(ViewHierarchyAgent.captureController(for:), 0LL);
  }
}

uint64_t closure #1 in ViewHierarchyAgent.performRequest(connection:message:)@<X0>( void *a1@<X0>, unsigned int *a2@<X8>)
{
  Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fd", 2uLL, 1);
  uint64_t v5 = String.utf8CString.getter(v2._countAndFlagsBits, v2._object);
  swift_retain(v5);
  swift_release(v5);
  swift_retain(v5);
  swift_bridgeObjectRelease(v5);
  unsigned int v7 = xpc_dictionary_dup_fd(a1, (const char *)(v5 + 32));
  swift_unknownObjectRelease(v5);
  swift_bridgeObjectRelease(v2._object);
  uint64_t result = v7;
  *a2 = v7;
  return result;
}

NSFileHandle __swiftcall NSFileHandle.__allocating_init(fileDescriptor:closeOnDealloc:)( Swift::Int32 fileDescriptor, Swift::Bool closeOnDealloc)
{
  id v2 = objc_allocWithZone((Class)((uint64_t (*)())swift_getObjCClassFromMetadata)());
  return (NSFileHandle)@nonobjc NSFileHandle.init(fileDescriptor:closeOnDealloc:)( fileDescriptor,  closeOnDealloc);
}

id @nonobjc NSFileHandle.__allocating_init(forWritingTo:)(uint64_t a1)
{
  uint64_t v14 = v2;
  id ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata(v1);
  id v19 = 0LL;
  id v18 = 0LL;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
  unint64_t v3 = lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>();
  _convertInOutToPointerArgument<A>(_:)(&v17, &v18, v12, v3);
  id v16 = [ObjCClassFromMetadata fileHandleForWritingToURL:v14 error:v17];
  id v15 = v18;
  id v4 = v18;
  uint64_t v5 = v19;
  id v19 = v15;

  if (v16)
  {

    uint64_t v6 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t))(*(void *)(v6 - 8) + 8LL))(a1);
    return v16;
  }

  else
  {
    id v10 = v19;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v8 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t))(*(void *)(v8 - 8) + 8LL))(a1);
    return (id)v9;
  }

uint64_t closure #2 in ViewHierarchyAgent.performRequest(connection:message:)(unsigned int a1, uint64_t a2)
{
  unsigned int v74 = a1;
  uint64_t v76 = a2;
  int v92 = 0;
  uint64_t v91 = 0LL;
  uint64_t v89 = 0LL;
  uint64_t v69 = 0LL;
  uint64_t v70 = type metadata accessor for Logger(0LL);
  uint64_t v71 = *(void *)(v70 - 8);
  unint64_t v72 = (*(void *)(v71 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v2 = __chkstk_darwin(0LL);
  uint64_t v73 = (char *)&v39 - v72;
  uint64_t v78 = type metadata accessor for URL(v2);
  uint64_t v77 = *(void *)(v78 - 8);
  unint64_t v75 = (*(void *)(v77 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  int v3 = __chkstk_darwin(v74);
  id v4 = (char *)&v39 - v75;
  uint64_t v79 = (char *)&v39 - v75;
  int v92 = v3;
  uint64_t v91 = v5;
  int v95 = 0LL;
  id v82 = [(id)objc_opt_self(NSFileManager) defaultManager];
  (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v4, v76, v78);
  URL._bridgeToObjectiveC()(v6);
  id v81 = v7;
  (*(void (**)(char *, uint64_t))(v77 + 8))(v79, v78);
  id v90 = v95;
  unsigned int v83 = [v82 removeItemAtURL:v81 error:&v90];
  id v80 = v90;
  id v8 = v90;
  uint64_t v9 = v95;
  int v95 = v80;

  uint64_t result = v83;
  if ((v83 & 1) == 0)
  {
    id v40 = v95;
    uint64_t v52 = _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v12 = v73;
    uint64_t v59 = 0LL;
    swift_errorRetain(v52);
    uint64_t v89 = v52;
    uint64_t v13 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v12, v13, v70);
    swift_errorRetain(v52);
    uint64_t v46 = 7LL;
    uint64_t v14 = swift_allocObject(&unk_100018C20, 24LL, 7LL);
    uint64_t v15 = v52;
    uint64_t v47 = v14;
    *(void *)(v14 + 16) = v52;
    unint64_t v53 = (os_log_s *)Logger.logObject.getter(v15);
    int v54 = static os_log_type_t.fault.getter();
    uint64_t v43 = &v87;
    uint64_t v87 = 12LL;
    unint64_t v41 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v42 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v16 = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)(&v88, v43, &type metadata for UInt32, &type metadata for Int, v41, v42, v16);
    uint32_t v55 = v88;
    uint64_t v44 = 17LL;
    uint64_t v17 = swift_allocObject(&unk_100018C48, 17LL, v46);
    uint64_t v18 = v44;
    uint64_t v19 = v46;
    uint64_t v64 = v17;
    *(_BYTE *)(v17 + 16) = 32;
    uint64_t v20 = swift_allocObject(&unk_100018C70, v18, v19);
    uint64_t v21 = v46;
    uint64_t v57 = v20;
    *(_BYTE *)(v20 + 16) = 8;
    uint64_t v45 = 32LL;
    uint64_t v22 = swift_allocObject(&unk_100018C98, 32LL, v21);
    uint64_t v23 = v45;
    uint64_t v24 = v46;
    uint64_t v25 = v22;
    uint64_t v26 = v47;
    uint64_t v48 = v25;
    *(void *)(v25 + 16) = partial apply for implicit closure #1 in closure #2 in ViewHierarchyAgent.performRequest(connection:message:);
    *(void *)(v25 + 24) = v26;
    uint64_t v27 = swift_allocObject(&unk_100018CC0, v23, v24);
    uint64_t v28 = v48;
    uint64_t v58 = v27;
    *(void *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
    *(void *)(v27 + 24) = v28;
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v49 = _allocateUninitializedArray<A>(_:)(3LL);
    uint64_t v50 = v29;
    swift_retain(v64);
    uint64_t v30 = v57;
    uint64_t v31 = v64;
    uint64_t v32 = v50;
    *uint64_t v50 = closure #1 in OSLogArguments.append(_:)partial apply;
    v32[1] = v31;
    swift_retain(v30);
    uint64_t v33 = v58;
    uint64_t v34 = v57;
    uint64_t v35 = v50;
    v50[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v35[3] = v34;
    swift_retain(v33);
    uint64_t v36 = v49;
    uint64_t v37 = v58;
    uint64_t v38 = v50;
    v50[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v38[5] = v37;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease(v36);
    if (os_log_type_enabled(v53, (os_log_type_t)v54))
    {
      uint64_t v11 = v59;
      uint64_t v61 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v62 = createStorage<A>(capacity:type:)(0LL, v60, v60);
      uint64_t v63 = createStorage<A>(capacity:type:)( 1LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
      uint64_t v65 = &v86;
      uint64_t v86 = v61;
      uint64_t v66 = &v94;
      uint64_t v94 = v62;
      uint64_t v67 = &v93;
      uint64_t v93 = v63;
      serialize(_:at:)(2LL, &v86);
      serialize(_:at:)(1LL, v65);
      unint64_t v84 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v85 = v64;
      closure #1 in osLogInternal(_:log:type:)(&v84, (uint64_t)v65, (uint64_t)v66, (uint64_t)v67);
      uint64_t v68 = v11;
      if (v11)
      {
        __break(1u);
      }

      else
      {
        unint64_t v84 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v85 = v57;
        closure #1 in osLogInternal(_:log:type:)(&v84, (uint64_t)&v86, (uint64_t)&v94, (uint64_t)&v93);
        uint64_t v56 = 0LL;
        unint64_t v84 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v85 = v58;
        closure #1 in osLogInternal(_:log:type:)(&v84, (uint64_t)&v86, (uint64_t)&v94, (uint64_t)&v93);
        _os_log_impl( (void *)&_mh_execute_header,  v53,  (os_log_type_t)v54,  "Failed to remove temporary file: %s",  v61,  v55);
        destroyStorage<A>(_:count:)(v62, 0LL);
        destroyStorage<A>(_:count:)(v63, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v64);
        swift_release(v57);
        swift_release(v58);
      }
    }

    else
    {
      swift_release(v64);
      swift_release(v57);
      swift_release(v58);
    }

    (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v70);
    swift_errorRelease(v52);
    return swift_errorRelease(v52);
  }

  return result;
}

uint64_t implicit closure #1 in closure #2 in ViewHierarchyAgent.performRequest(connection:message:)( uint64_t a1)
{
  return Error.localizedDescription.getter(v2[1], v2[2]);
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int32) -> ()(uint64_t a1, unsigned int a2)
{
  id v4 = *(void (**)(void))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  v4(a2);
  return swift_release(v5);
}

Swift::Void __swiftcall ViewHierarchyAgent.finish(_:)(Swift::Int32 a1)
{
  v5[1] = 0LL;
  Swift::Int32 v6 = a1;
  Swift::Int32 v4 = a1;
  swift_beginAccess(v1 + 88);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CaptureController]);
  Dictionary.removeValue(forKey:)(v5, &v4, v2);
  swift_endAccess(v3);
  swift_release(v5[0]);
}

uint64_t ViewHierarchyAgent.establishTargetHubConnection(to:)(int a1)
{
  *(void *)(v2 + 72) = v1;
  *(_DWORD *)(v2 + 128) = a1;
  *(void *)(v2 + 48) = v2;
  *(_DWORD *)(v2 + 120) = 0;
  *(void *)(v2 + 56) = 0LL;
  *(void *)(v2 + 32) = 0LL;
  *(void *)(v2 + 40) = 0LL;
  *(_DWORD *)(v2 + 120) = a1;
  *(void *)(v2 + 56) = v1;
  return swift_task_switch(ViewHierarchyAgent.establishTargetHubConnection(to:), 0LL);
}

uint64_t ViewHierarchyAgent.establishTargetHubConnection(to:)()
{
  uint64_t v16 = *(void *)(v0 + 72);
  int v17 = *(_DWORD *)(v0 + 128);
  *(void *)(v0 + 48) = v0;
  *(void *)(v0 + 16) = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  *(void *)(v0 + 24) = v1;
  Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "com.apple.dt.ViewHierarchyTargetHub.Notification.",  0x31uLL,  1);
  object = v2._object;
  DefaultStringInterpolation.appendLiteral(_:)(v2);
  swift_bridgeObjectRelease(object);
  *(_DWORD *)(v0 + 124) = v17;
  DefaultStringInterpolation.appendInterpolation<A>(_:)( v0 + 124,  &type metadata for Int32,  &protocol witness table for Int32);
  Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1);
  id v10 = v3._object;
  DefaultStringInterpolation.appendLiteral(_:)(v3);
  swift_bridgeObjectRelease(v10);
  uint64_t v12 = *(void *)(v0 + 16);
  uint64_t v11 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain(v11);
  outlined destroy of DefaultStringInterpolation(v0 + 16);
  uint64_t v13 = String.init(stringInterpolation:)(v12, v11);
  uint64_t v15 = v4;
  *(void *)(v0 + 80) = v4;
  *(void *)(v0 + 32) = v13;
  *(void *)(v0 + 40) = v4;
  swift_bridgeObjectRetain(v4);
  uint64_t v14 = String.utf8CString.getter(v13, v15);
  swift_retain(v14);
  swift_release(v14);
  swift_retain(v14);
  swift_bridgeObjectRelease(v14);
  notify_post((const char *)(v14 + 32));
  swift_unknownObjectRelease(v14);
  swift_bridgeObjectRelease(v15);
  Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("establishTargetHubConnection(to:)", 0x21uLL, 1);
  *(void *)(v0 + 88) = v5._object;
  swift_retain(v16);
  uint64_t v19 = swift_task_alloc(32LL);
  *(void *)(v0 + 96) = v19;
  *(void *)(v19 + 16) = v16;
  *(_DWORD *)(v19 + 24) = v17;
  Swift::Int32 v6 = (void *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  *(void *)(v18 + 104) = v6;
  uint64_t v7 = type metadata accessor for SystemXPCPeerConnection(0LL);
  *Swift::Int32 v6 = *(void *)(v18 + 48);
  v6[1] = ViewHierarchyAgent.establishTargetHubConnection(to:);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)( v18 + 64,  0LL,  0LL,  v5._countAndFlagsBits,  v5._object,  partial apply for closure #1 in ViewHierarchyAgent.establishTargetHubConnection(to:),  v19,  v7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  Swift::String v2 = *v1;
  Swift::String v3 = *(void *)(*v1 + 104);
  *(void *)(v2 + 48) = *v1;
  v2 += 48LL;
  uint64_t v7 = (void *)(v2 - 32);
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc(v3);
  if (v0) {
    return swift_task_switch(ViewHierarchyAgent.establishTargetHubConnection(to:), 0LL);
  }
  Swift::Int32 v6 = v7[9];
  Swift::String v5 = v7[7];
  swift_task_dealloc(v7[10]);
  swift_release(v5);
  swift_bridgeObjectRelease(v6);
  return swift_task_switch(ViewHierarchyAgent.establishTargetHubConnection(to:), 0LL);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v1 = v0[10];
  v0[6] = v0;
  Swift::String v3 = v0[8];
  swift_bridgeObjectRelease(v1);
  return (*(uint64_t (**)(uint64_t, void *))(v0[6] + 8LL))( v3,  &protocol witness table for SystemXPCPeerConnection);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v1 = v0[12];
  uint64_t v4 = v0[11];
  Swift::String v5 = v0[10];
  Swift::String v3 = v0[9];
  v0[6] = v0;
  swift_task_dealloc(v1);
  swift_release(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  return (*(uint64_t (**)())(v0[6] + 8LL))();
}

uint64_t closure #1 in ViewHierarchyAgent.establishTargetHubConnection(to:)(uint64_t a1, uint64_t a2, int a3)
{
  return ViewHierarchyAgent.setPendingConnection(_:for:)(a1, a3);
}

uint64_t ViewHierarchyAgent.setPendingConnection(_:for:)(uint64_t a1, int a2)
{
  uint64_t v34 = a1;
  int v38 = a2;
  uint64_t v50 = 0LL;
  int v49 = 0;
  uint64_t v48 = 0LL;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  unint64_t v30 = (*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v3);
  uint64_t v31 = (uint64_t)&v24 - v30;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  uint64_t v39 = *(void *)(v41 - 8);
  unint64_t v32 = (*(void *)(v39 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v41);
  uint64_t v33 = (char *)&v24 - v32;
  unint64_t v35 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>?)
                               - 8)
                   + 64LL)
       + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(v34);
  uint64_t v36 = (char *)&v24 - v35;
  unint64_t v37 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v40 = (uint64_t)&v24 - v37;
  uint64_t v50 = v6;
  int v49 = v7;
  uint64_t v48 = v2;
  swift_beginAccess(v2 + 96);
  uint64_t v8 = *(void *)(v2 + 96);
  int v46 = v38;
  Dictionary.subscript.getter(&v46, v8, &type metadata for Int32, v41, &protocol witness table for Int32);
  if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v40, 1LL, v41) == 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v33, v40, v41);
    outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?(v40);
    swift_endAccess(v47);
    unint64_t v9 = lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
    uint64_t v10 = swift_allocError(&type metadata for ViewHierarchyAgentError, v9, 0LL, 0LL);
    uint64_t v12 = v11;
    uint64_t v13 = v41;
    *uint64_t v12 = 2;
    uint64_t v43 = v10;
    CheckedContinuation.resume(throwing:)(&v43, v13);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v33, v41);
  }

  else
  {
    outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?(v40);
    swift_endAccess(v47);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v36, v34, v41);
  uint64_t v14 = *(void (**)(char *, void))(v39 + 56);
  unsigned int v27 = 1;
  v14(v36, 0LL);
  uint64_t v25 = &v45;
  int v45 = v38;
  uint64_t v26 = &v44;
  swift_beginAccess(v29 + 96);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CheckedContinuation<SystemXPCPeerConnection, Error>]);
  Dictionary.subscript.setter(v36, v25, v15);
  swift_endAccess(v26);
  uint64_t v16 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, void))(*(void *)(v16 - 8) + 56LL))(v31, v27);
  swift_retain(v29);
  uint64_t v17 = swift_allocObject(&unk_100018BF8, 44LL, 7LL);
  uint64_t v18 = v29;
  int v19 = v38;
  uint64_t v20 = v17;
  uint64_t v21 = v31;
  *(void *)(v20 + 16) = 0LL;
  *(void *)(v20 + 24) = 0LL;
  *(void *)(v20 + 32) = v18;
  *(_DWORD *)(v20 + 40) = v19;
  _sScTss5Error_pRs_rlE8detached8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntFZ( v21,  (uint64_t)&async function pointer to partial apply for closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:),  v20,  (uint64_t)&type metadata for () + 8);
  uint64_t v28 = v22;
  outlined destroy of TaskPriority?(v31);
  return swift_release(v28);
}

uint64_t closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(v5 + 120) = a5;
  *(void *)(v5 + 64) = a4;
  *(void *)(v5 + 40) = v5;
  *(void *)(v5 + 48) = 0LL;
  *(_DWORD *)(v5 + 112) = 0;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>?);
  *(void *)(v5 + 72) = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  *(void *)(v5 + 80) = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  *(void *)(v5 + 88) = v8;
  *(void *)(v5 + 96) = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v5 + 48) = a4;
  *(_DWORD *)(v5 + 112) = a5;
  unint64_t v9 = (void *)swift_task_alloc(async function pointer to static Task<>.sleep(nanoseconds:)[1]);
  *(void *)(v13 + 104) = v9;
  *unint64_t v9 = *(void *)(v13 + 40);
  v9[1] = closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:);
  return static Task<>.sleep(nanoseconds:)(5000000000LL);
}

void *closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 104LL);
  v2[5] = *(void *)v1;
  v2 += 5;
  uint64_t v6 = v2 - 3;
  uint64_t v7 = v2;
  swift_task_dealloc(v3);
  if (!v0) {
    return (void *)swift_task_switch(closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:), 0LL);
  }
  uint64_t v5 = v6[7];
  swift_task_dealloc(v6[10]);
  swift_task_dealloc(v5);
  return (*(void *(**)(void *__return_ptr))(*v7 + 8LL))(v7);
}

uint64_t closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)()
{
  uint64_t v13 = *(void *)(v0 + 88);
  uint64_t v15 = *(void *)(v0 + 80);
  uint64_t v14 = *(void **)(v0 + 72);
  int v1 = *(_DWORD *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 64);
  *(void *)(v0 + 40) = v0;
  *(_DWORD *)(v0 + 116) = v1;
  swift_beginAccess(v2 + 96);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CheckedContinuation<SystemXPCPeerConnection, Error>]);
  Dictionary.removeValue(forKey:)(v14, v0 + 116, v3);
  swift_endAccess(v0 + 16);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v14, 1LL, v15) == 1)
  {
    outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?(v12[9]);
  }

  else
  {
    uint64_t v10 = v12[12];
    uint64_t v9 = v12[11];
    uint64_t v11 = v12[10];
    (*(void (**)(uint64_t, void))(v9 + 32))(v10, v12[9]);
    unint64_t v4 = lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
    uint64_t v5 = swift_allocError(&type metadata for ViewHierarchyAgentError, v4, 0LL, 0LL);
    *uint64_t v6 = 3;
    v12[7] = v5;
    CheckedContinuation.resume(throwing:)(v12 + 7, v11);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  }

  uint64_t v8 = v12[9];
  swift_task_dealloc(v12[12]);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v12[5] + 8LL))();
}

void _sScTss5Error_pRs_rlE8detached8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntFZ( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a1;
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  v33[4] = a4;
  unint64_t v29 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                               - 8)
                   + 64LL)
       + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  unint64_t v4 = (const void *)__chkstk_darwin(v28);
  uint64_t v30 = (uint64_t)v7 - v29;
  outlined init with copy of TaskPriority?(v4, (char *)v7 - v29);
  uint64_t v31 = type metadata accessor for TaskPriority(0LL);
  uint64_t v32 = *(void *)(v31 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v32 + 48))(v30, 1LL) == 1)
  {
    uint64_t v23 = 0LL;
    outlined destroy of TaskPriority?(v30);
    uint64_t v24 = v23;
  }

  else
  {
    int v22 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v30, v31);
    uint64_t v24 = v22;
  }

  uint64_t v19 = v24 | 0x1000;
  uint64_t v21 = *(void *)(v26 + 16);
  uint64_t v20 = *(void *)(v26 + 24);
  swift_unknownObjectRetain();
  if (v21)
  {
    uint64_t v17 = v21;
    uint64_t v18 = v20;
    uint64_t v11 = v20;
    uint64_t v12 = v21;
    uint64_t ObjectType = swift_getObjectType(v21);
    uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
    uint64_t v14 = v6;
    swift_unknownObjectRelease(v12);
    uint64_t v15 = v13;
    uint64_t v16 = v14;
  }

  else
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
  }

  uint64_t v8 = v16;
  uint64_t v9 = v15;
  uint64_t v10 = 0LL;
  if (v15 != 0 || v16 != 0)
  {
    v33[0] = 0LL;
    v33[1] = 0LL;
    v33[2] = v9;
    v33[3] = v8;
    uint64_t v10 = v33;
  }

  v7[1] = swift_task_create(v19, v10, v27, v25, v26);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  Task.init(_:)();
}

void static ViewHierarchyAgent.$main()()
{
}

  ;
}

uint64_t ViewHierarchyAgent.deinit()
{
  swift_release(*(void *)(v0 + 40));
  swift_release(*(void *)(v0 + 56));
  swift_release(*(void *)(v0 + 72));
  outlined destroy of [Int32 : CaptureController]((void *)(v0 + 88));
  outlined destroy of [Int32 : CheckedContinuation<SystemXPCPeerConnection, Error>]((void *)(v0 + 96));
  return v2;
}

uint64_t ViewHierarchyAgent.__deallocating_deinit()
{
  uint64_t v0 = ViewHierarchyAgent.deinit();
  return swift_deallocClassInstance(v0, 104LL, 7LL);
}

int main(int argc, const char **argv, const char **envp)
{
}

uint64_t sub_100013530()
{
  return 0LL;
}

id @nonobjc NSFileHandle.init(fileDescriptor:closeOnDealloc:)(uint64_t a1, char a2)
{
  return [v2 initWithFileDescriptor:a1 closeOnDealloc:a2 & 1];
}

uint64_t partial apply for closure #1 in osLogInternal(_:log:type:)( uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

unint64_t lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]()
{
  uint64_t v3 = lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A])
  {
    uint64_t v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(_:_:_:)]);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A]);
    return WitnessTable;
  }

  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)*a1,  -(*a1 >> 32),  0LL);
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }

  return v4;
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.startRemoteListener()(uint64_t a1)
{
  return closure #1 in ViewHierarchyAgent.startRemoteListener()(a1, v1);
}

uint64_t closure #1 in osLogInternal(_:log:type:)partial apply( uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

void *partial apply for closure #1 in ViewHierarchyAgent.startTargetHubListener()(uint64_t a1)
{
  return closure #1 in ViewHierarchyAgent.startTargetHubListener()(a1, v1);
}

uint64_t sub_100013710()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t partial apply for implicit closure #2 in ViewHierarchyAgent.handleMessage(_:from:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #2 in ViewHierarchyAgent.handleMessage(_:from:)();
  return result;
}

uint64_t specialized static Array._allocateUninitialized(_:)(uint64_t result)
{
  uint64_t v4 = result;
  if (result < 0)
  {
    __break(1u);
  }

  else
  {
    if (result > 0)
    {
      uint64_t v1 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
      uint64_t v2 = static Array._allocateBufferUninitialized(minimumCapacity:)(v4, v1);
      *(void *)(v2 + 16) = v4;
      uint64_t v3 = (void *)v2;
    }

    else
    {
      swift_retain(&_swiftEmptyArrayStorage);
      uint64_t v3 = &_swiftEmptyArrayStorage;
    }

    type metadata accessor for OS_dispatch_queue.Attributes(0LL);
    return (uint64_t)v3;
  }

  return result;
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTR(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_;
  return v5(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

  ;
}

uint64_t sub_10001390C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0( _BYTE **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10001393C()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_10001396C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000139B4()
{
  return swift_deallocObject(v2, 32LL);
}

void *_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0( void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = a1;
  uint64_t v18 = a6;
  v13[1] = a7;
  uint64_t v22 = a6;
  uint64_t v16 = *(void *)(a6 - 8);
  v13[0] = (*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v7 = __chkstk_darwin(a1);
  uint64_t v17 = (uint64_t)v13 - v13[0];
  v8(v7);
  uint64_t v14 = dispatch thunk of static FixedWidthInteger.bitWidth.getter() >> 3;
  uint64_t v20 = *v15;
  uint64_t v21 = v20 + v14;
  _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF( v17,  partial apply for closure #1 in serialize<A>(_:at:),  (uint64_t)v19,  v18,  (uint64_t)&type metadata for Never,  (uint64_t)&type metadata for () + 8,  (uint64_t)&protocol witness table for Never,  v13[2]);
  uint64_t v9 = v16;
  uint64_t v10 = v17;
  uint64_t v11 = v18;
  *v15 += v14;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t closure #1 in serialize<A>(_:at:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF( uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = a2;
  uint64_t v13 = a5;
  uint64_t v14 = a8;
  uint64_t v23 = a4;
  uint64_t v22 = a5;
  uint64_t v21 = a6;
  uint64_t v15 = *(void *)(a5 - 8);
  unint64_t v16 = (*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v9 = __chkstk_darwin(a1);
  uint64_t v18 = (char *)&v12 - v16;
  uint64_t v20 = v9 + *(void *)(*(void *)(v10 - 8) + 64LL);
  uint64_t result = v17();
  uint64_t v19 = v8;
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v14, v18, v13);
  }
  return result;
}

uint64_t sub_100013C20()
{
  uint64_t v4 = type metadata accessor for XPCDictionary(0LL);
  uint64_t v2 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 56LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v6 = v3 + *(void *)(v2 + 64);
  swift_unknownObjectRelease(*((void *)v0 + 2));
  swift_release(*((void *)v0 + 4));
  swift_release(*((void *)v0 + 5));
  (*(void (**)(char *, uint64_t))(v2 + 8))(&v0[v3], v4);
  return swift_deallocObject(v5, v6);
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.handleMessage(_:from:)(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(type metadata accessor for XPCDictionary(0LL) - 8) + 80LL);
  uint64_t v11 = (v3 + 56) & ~v3;
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = v1[5];
  uint64_t v10 = v1[6];
  uint64_t v4 = (void *)swift_task_alloc(dword_10001C5D4);
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = *(void *)(v2 + 16);
  v4[1] = partial apply for closure #1 in ViewHierarchyAgent.handleMessage(_:from:);
  return closure #1 in ViewHierarchyAgent.handleMessage(_:from:)(a1, v6, v7, v8, v9, v10, (uint64_t)v1 + v11);
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.handleMessage(_:from:)()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

unint64_t type metadata accessor for NSFileHandle()
{
  uint64_t v3 = lazy cache variable for type metadata for NSFileHandle;
  if (!lazy cache variable for type metadata for NSFileHandle)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___NSFileHandle);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSFileHandle);
    return ObjCClassMetadata;
  }

  return v3;
}

void *outlined init with take of URL?(const void *a1, void *a2)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1LL))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0LL, 1LL, v6);
  }

  return a2;
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for URL(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  return a1;
}

void *outlined init with copy of URL?(const void *a1, void *a2)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1LL))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0LL, 1LL, v6);
  }

  return a2;
}

uint64_t sub_1000140A8()
{
  uint64_t v1 = *(void *)(type metadata accessor for URL(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v5 = v2 + *(void *)(v1 + 64);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);
  return swift_deallocObject(v4, v5);
}

uint64_t partial apply for closure #2 in ViewHierarchyAgent.performRequest(connection:message:)( unsigned int a1)
{
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(type metadata accessor for URL(0LL) - 8) + 80LL);
  return closure #2 in ViewHierarchyAgent.performRequest(connection:message:)(a1, v1 + ((v2 + 16) & ~v2));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain(v5);
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of DefaultStringInterpolation( uint64_t a1)
{
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.establishTargetHubConnection(to:)(uint64_t a1)
{
  return closure #1 in ViewHierarchyAgent.establishTargetHubConnection(to:)( a1,  *(void *)(v1 + 16),  *(_DWORD *)(v1 + 24));
}

uint64_t outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  uint64_t v4 = *(void *)(v3 - 8);
  return a1;
}

uint64_t sub_100014260()
{
  return swift_deallocObject(v2, 44LL);
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = *(void *)(v1 + 32);
  int v8 = *(_DWORD *)(v1 + 40);
  uint64_t v3 = (void *)swift_task_alloc(dword_10001C62C);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = partial apply for closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:);
  return closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)(a1, v5, v6, v7, v8);
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TaskPriority(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  return a1;
}

void *outlined init with copy of TaskPriority?(const void *a1, void *a2)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1LL))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0LL, 1LL, v6);
  }

  return a2;
}

uint64_t sub_100014524()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t partial apply for implicit closure #1 in closure #2 in ViewHierarchyAgent.performRequest(connection:message:)()
{
  return implicit closure #1 in closure #2 in ViewHierarchyAgent.performRequest(connection:message:)(*(void *)(v0 + 16));
}

uint64_t sub_100014568()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_100014598()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_1000145C8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100014610()
{
  return swift_deallocObject(v2, 32LL);
}

unint64_t lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>()
{
  uint64_t v3 = lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>;
  if (!lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>)
  {
    uint64_t v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for AutoreleasingUnsafeMutablePointer<A>, v0);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_1000146C8()
{
  return swift_deallocObject(v2, 40LL);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTA(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *(int **)(v1 + 24);
  uint64_t v3 = (void *)swift_task_alloc(dword_10001C72C);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_;
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu))( a1,  v5);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

void *outlined init with copy of Result<XPCPeerConnection, XPCError>(void *a1, void *a2)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  if (swift_getEnumCaseMultiPayload(a1) == 1)
  {
    uint64_t v3 = type metadata accessor for XPCError(0LL);
    (*(void (**)(void *, void *))(*(void *)(v3 - 8) + 16LL))(a2, a1);
    swift_storeEnumTagMultiPayload(a2, v8, 1LL);
  }

  else
  {
    uint64_t v5 = *a1;
    swift_retain(*a1);
    uint64_t v2 = a1[1];
    *a2 = v5;
    a2[1] = v2;
    swift_storeEnumTagMultiPayload(a2, v8, 0LL);
  }

  return a2;
}

void *outlined destroy of Result<XPCPeerConnection, XPCError>(void *a1)
{
  if (swift_getEnumCaseMultiPayload(a1) == 1)
  {
    uint64_t v1 = type metadata accessor for XPCError(0LL);
    (*(void (**)(void *))(*(void *)(v1 - 8) + 8LL))(a1);
  }

  else
  {
    swift_release(*a1);
  }

  return a1;
}

uint64_t sub_100014954()
{
  return swift_deallocObject(v0, 20LL);
}

uint64_t partial apply for implicit closure #3 in closure #1 in ViewHierarchyAgent.startTargetHubListener()()
{
  return implicit closure #3 in closure #1 in ViewHierarchyAgent.startTargetHubListener()(*(unsigned int *)(v0 + 16));
}

uint64_t sub_100014984()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_1000149B4()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int32)@<X0>( uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100014A18()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int32)@<X0>( _DWORD *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int32)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_100014A60()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t partial apply for closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int32, v4);
}

uint64_t sub_100014B64()
{
  return swift_deallocObject(v2, 28LL);
}

uint64_t partial apply for closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()( uint64_t a1)
{
  return closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()( a1,  *(void *)(v1 + 16),  *(_DWORD *)(v1 + 24));
}

uint64_t sub_100014BAC()
{
  return swift_deallocObject(v0, 20LL);
}

uint64_t partial apply for implicit closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()()
{
  return implicit closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()(*(unsigned int *)(v0 + 16));
}

uint64_t sub_100014BDC()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_100014C0C()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_100014C3C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int32)partial apply@<X0>(_DWORD *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int32)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_100014C84()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)partial apply(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int32, v4);
}

uint64_t outlined destroy of Result<XPCDictionary, XPCError>(uint64_t a1)
{
  else {
    uint64_t v1 = type metadata accessor for XPCDictionary(0LL);
  }
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8LL))(a1);
  return a1;
}

uint64_t sub_100014DA8()
{
  uint64_t v1 = *(void *)(type metadata accessor for XPCError(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v5 = v2 + *(void *)(v1 + 64);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);
  return swift_deallocObject(v4, v5);
}

uint64_t partial apply for implicit closure #1 in closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()()
{
  return implicit closure #1 in closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()();
}

uint64_t sub_100014E48()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_100014E78()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_100014EA8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100014EF0()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t partial apply for closure #1 in serialize<A>(_:at:)()
{
  return closure #1 in serialize<A>(_:at:)();
}

uint64_t sub_100014F64()
{
  uint64_t v1 = *(void *)(type metadata accessor for XPCError(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v5 = v2 + *(void *)(v1 + 64);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);
  return swift_deallocObject(v4, v5);
}

uint64_t partial apply for implicit closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()()
{
  return implicit closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()();
}

uint64_t sub_100015004()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_100015034()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_100015064()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_1000150AC()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_1000150F4()
{
  return swift_deallocObject(v2, 40LL);
}

uint64_t partial apply for closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()(uint64_t a1)
{
  return closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100015148()
{
  uint64_t v1 = *(void *)(type metadata accessor for XPCError(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v5 = v2 + *(void *)(v1 + 64);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);
  return swift_deallocObject(v4, v5);
}

uint64_t partial apply for implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()()
{
  return implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()();
}

uint64_t sub_1000151E8()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_100015218()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_100015248()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100015290()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_1000152D8()
{
  return swift_deallocObject(v2, 40LL);
}

uint64_t partial apply for closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()(uint64_t a1)
{
  return closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10001532C()
{
  uint64_t v1 = *(void *)(type metadata accessor for XPCError(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v5 = v2 + *(void *)(v1 + 64);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);
  return swift_deallocObject(v4, v5);
}

uint64_t partial apply for implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()()
{
  return implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()();
}

uint64_t sub_1000153CC()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_1000153FC()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_10001542C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100015474()
{
  return swift_deallocObject(v2, 32LL);
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes()
{
  uint64_t v3 = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    uint64_t v0 = type metadata accessor for OS_dispatch_queue.Attributes(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v0);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
    return WitnessTable;
  }

  return v3;
}

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]()
{
  uint64_t v3 = lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A])
  {
    uint64_t v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A]);
    return WitnessTable;
  }

  return v3;
}
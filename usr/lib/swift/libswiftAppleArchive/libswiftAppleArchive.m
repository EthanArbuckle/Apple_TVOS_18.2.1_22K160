void protocol witness for static _AAObjectTraits.aaDestroy(_:) in conformance _AAHeaderTraits(AAHeader *a1)
{
  AAHeaderDestroy(*a1);
}

uint64_t ArchiveHeader.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  AAHeader v1 = AAHeaderCreate();
  if (v1)
  {
    *(void *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 1;
    return v0;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t ArchiveHeader.init()()
{
  AAHeader v1 = AAHeaderCreate();
  if (v1)
  {
    *(void *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 1;
    return v0;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t ArchiveHeader.__allocating_init(keySet:directory:path:flags:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveHeader.init(keySet:directory:path:flags:)(a1, a2, a3);
}

uint64_t ArchiveHeader.init(keySet:directory:path:flags:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
  FilePath.withCString<A>(_:)();
  swift_release();
  uint64_t v7 = type metadata accessor for FilePath();
  v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL);
  v8(a2, v7);
  if (v10)
  {
    *(void *)(v4 + 16) = v10;
    *(_BYTE *)(v4 + 24) = 1;
    v8(a3, v7);
  }

  else
  {
    v8(a3, v7);
    type metadata accessor for ArchiveHeader();
    swift_deallocPartialClassInstance();
    return 0LL;
  }

  return v4;
}

uint64_t partial apply for closure #1 in ArchiveHeader.init(keySet:directory:path:flags:)()
{
  return FilePath.withCString<A>(_:)();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895C97BC]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t type metadata accessor for ArchiveHeader()
{
  uint64_t result = type metadata singleton initialization cache for ArchiveHeader;
  if (!type metadata singleton initialization cache for ArchiveHeader) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ArchiveHeader.__allocating_init(copying:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  AAHeader v3 = AAHeaderClone(*(AAHeader *)(a1 + 16));
  if (v3)
  {
    AAHeader v4 = v3;
    swift_release();
    *(void *)(v2 + 16) = v4;
    *(_BYTE *)(v2 + 24) = 1;
    return v2;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t ArchiveHeader.init(copying:)(uint64_t a1)
{
  AAHeader v2 = AAHeaderClone(*(AAHeader *)(a1 + 16));
  if (v2)
  {
    AAHeader v3 = v2;
    swift_release();
    *(void *)(v1 + 16) = v3;
    *(_BYTE *)(v1 + 24) = 1;
    return v1;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

unsigned int ArchiveHeader.field(forKey:)@<W0>(AAFieldKey *a1@<X0>, uint64_t a2@<X8>)
{
  AAFieldKey v4 = *a1;
  unsigned int result = AAHeaderGetKeyIndex(*(AAHeader *)(v2 + 16), v4);
  if ((result & 0x80000000) != 0)
  {
    uint64_t v7 = 0LL;
    __int128 v6 = 0uLL;
    char v8 = -1;
  }

  else
  {
    unsigned int result = ArchiveHeader._field(at:)(result, (uint64_t)&v9).ikey;
    __int128 v6 = v9;
    uint64_t v7 = v10;
    char v8 = v11;
  }

  *(_OWORD *)a2 = v6;
  *(void *)(a2 + 16) = v7;
  *(_BYTE *)(a2 + 24) = v8;
  return result;
}

AAFieldKey ArchiveHeader._field(at:)@<W0>(unint64_t i@<X0>, uint64_t a2@<X8>)
{
  offset[1] = *MEMORY[0x1895F89C0];
  if ((i & 0x8000000000000000LL) != 0)
  {
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
  }

  if (HIDWORD(i)) {
    goto LABEL_30;
  }
  v5 = *(AAHeader_impl **)(v2 + 16);
  int FieldType = AAHeaderGetFieldType(v5, i);
  if (FieldType < 0
    || ((v7 = FieldType, AAFieldKey result = AAHeaderGetFieldKey(v5, i), (int)(result.ikey << 8) >> 24 >= 32)
      ? (BOOL v9 = HIBYTE(result.ikey) == 0)
      : (BOOL v9 = 0),
        !v9 || ((AAFieldKey v10 = result, result.skey[0] >= 32) ? (v11 = *(__int16 *)result.skey >> 8 <= 31) : (v11 = 1), v11)))
  {
    while (1)
    {
LABEL_33:
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }

  switch(v7)
  {
    case 0:
      *(void *)(a2 + 8) = 0LL;
      *(void *)(a2 + 16) = 0LL;
      *(void *)a2 = result.ikey;
      *(_BYTE *)(a2 + 24) = 0;
      return result;
    case 1:
      value.__darwin_time_t tv_sec = 0LL;
      result.ikey = AAHeaderGetFieldUInt(v5, i, (uint64_t *)&value);
      if ((result.ikey & 0x80000000) != 0) {
        goto LABEL_33;
      }
      __darwin_time_t tv_sec = value.tv_sec;
      *(void *)a2 = v10.ikey;
      *(void *)(a2 + 8) = tv_sec;
      *(void *)(a2 + 16) = 0LL;
      char v12 = 1;
      goto LABEL_27;
    case 2:
      value.__darwin_time_t tv_sec = 0LL;
      if (AAHeaderGetFieldString(v5, i, 0LL, 0LL, (size_t *)&value) < 0) {
        goto LABEL_33;
      }
      if (__OFADD__(value.tv_sec, 1LL)) {
        goto LABEL_31;
      }
      v13 = (char *)swift_slowAlloc();
      if (__OFADD__(value.tv_sec, 1LL)) {
        goto LABEL_32;
      }
      v14 = v13;
      if (AAHeaderGetFieldString(v5, i, value.tv_sec + 1, v13, 0LL) < 0)
      {
        MEMORY[0x1895C984C](v14, -1LL, -1LL);
        goto LABEL_33;
      }

      uint64_t v15 = String.init(cString:)();
      uint64_t v17 = v16;
      result.ikey = MEMORY[0x1895C984C](v14, -1LL, -1LL);
      *(void *)a2 = v10.ikey;
      *(void *)(a2 + 8) = v15;
      *(void *)(a2 + 16) = v17;
      char v12 = 2;
LABEL_27:
      *(_BYTE *)(a2 + 24) = v12;
      return result;
    case 3:
      LODWORD(value.tv_sec) = 0;
      swift_retain();
      uint64_t v18 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)( 64LL,  v2,  i,  (AAHashFunction *)&value);
      result.ikey = swift_release();
      *(void *)a2 = v10.ikey | ((unint64_t)LODWORD(value.tv_sec) << 32);
      *(void *)(a2 + 8) = v18;
      *(void *)(a2 + 16) = 0LL;
      char v12 = 3;
      goto LABEL_27;
    case 4:
      value.__darwin_time_t tv_sec = 0LL;
      value.tv_nsec = 0LL;
      result.ikey = AAHeaderGetFieldTimespec(v5, i, &value);
      if ((result.ikey & 0x80000000) != 0) {
        goto LABEL_33;
      }
      *(void *)a2 = v10.ikey;
      *(timespec *)(a2 + 8) = value;
      char v12 = 4;
      goto LABEL_27;
    case 5:
      value.__darwin_time_t tv_sec = 0LL;
      offset[0] = 0LL;
      result.ikey = AAHeaderGetFieldBlob(v5, i, (uint64_t *)&value, offset);
      if ((result.ikey & 0x80000000) != 0) {
        goto LABEL_33;
      }
      __darwin_time_t v20 = value.tv_sec;
      uint64_t v21 = offset[0];
      *(void *)a2 = v10.ikey;
      *(void *)(a2 + 8) = v20;
      *(void *)(a2 + 16) = v21;
      char v12 = 5;
      goto LABEL_27;
    default:
      goto LABEL_33;
  }
}

uint64_t closure #1 in ArchiveHeader._field(at:)( uint8_t **a1, void *a2, uint64_t a3, unint64_t i, AAHashFunction *hash_function)
{
  if ((i & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (HIDWORD(i))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  uint64_t result = AAHeaderGetFieldHash(*(AAHeader *)(a3 + 16), i, 0x40uLL, hash_function, *a1);
  if ((result & 0x80000000) != 0)
  {
LABEL_10:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }

  AAHashFunction v8 = *hash_function - 1;
  if (v8 > 4) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = qword_18862E098[v8];
  }
  *a2 = v9;
  return result;
}

void ArchiveHeader._append(_:)(uint64_t a1)
{
  __asm { BR              X10 }

uint64_t sub_188618F48( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, uint64_t a11, timespec value, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, int a21)
{
  AAFieldKey v23 = v22;
  uint64_t result = AAHeaderSetFieldFlag(*(AAHeader *)(v21 + 16), 0xFFFFFFFF, v23);
  if ((result & 0x80000000) != 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

void ArchiveHeader._set(at:field:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_188619114( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, uint64_t a11, timespec value, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, int a21)
{
  if ((v21 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    JUMPOUT(0x188619290LL);
  }

  if (HIDWORD(v21))
  {
    __break(1u);
    JUMPOUT(0x1886192A8LL);
  }

  AAFieldKey v24 = v23;
  uint64_t result = AAHeaderSetFieldFlag(*(AAHeader *)(v22 + 16), v21, v24);
  if ((result & 0x80000000) != 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    JUMPOUT(0x188619308LL);
  }

  return result;
}

uint64_t ArchiveHeader.__allocating_init(withAAEncodedData:)(const uint8_t *a1, size_t a2)
{
  uint64_t result = swift_allocObject();
  if (a1)
  {
    uint64_t v5 = result;
    AAHeader v6 = AAHeaderCreateWithEncodedData(a2, a1);
    if (v6)
    {
      *(void *)(v5 + 16) = v6;
      *(_BYTE *)(v5 + 24) = 1;
    }

    else
    {
      swift_deallocPartialClassInstance();
      return 0LL;
    }

    return v5;
  }

  else
  {
    __break(1u);
  }

  return result;
}

const uint8_t *ArchiveHeader.init(withAAEncodedData:)(const uint8_t *data, size_t data_size)
{
  if (data)
  {
    AAHeader v3 = AAHeaderCreateWithEncodedData(data_size, data);
    if (v3)
    {
      *(void *)(v2 + 16) = v3;
      *(_BYTE *)(v2 + 24) = 1;
    }

    else
    {
      type metadata accessor for ArchiveHeader();
      swift_deallocPartialClassInstance();
      return 0LL;
    }

    return (const uint8_t *)v2;
  }

  else
  {
    __break(1u);
  }

  return data;
}

uint64_t ArchiveHeader.withAAEncodedData<A>(_:)(uint64_t (*a1)(const uint8_t *, size_t))
{
  AAHeader v3 = *(AAHeader_impl **)(v1 + 16);
  size_t EncodedSize = AAHeaderGetEncodedSize(v3);
  EncodedData = AAHeaderGetEncodedData(v3);
  return a1(EncodedData, EncodedSize);
}

void ArchiveHeader.__allocating_init(object:owned:)()
{
}

void ArchiveHeader.init(object:owned:)()
{
}

uint64_t ArchiveHeader.deinit()
{
  if (*(_BYTE *)(v0 + 24) == 1) {
    AAHeaderDestroy(*(AAHeader *)(v0 + 16));
  }
  return v0;
}

uint64_t ArchiveHeader.__deallocating_deinit()
{
  if (*(_BYTE *)(v0 + 24) == 1) {
    AAHeaderDestroy(*(AAHeader *)(v0 + 16));
  }
  return swift_deallocClassInstance();
}

void vtable thunk for _AAObjectWrapper.__allocating_init(object:owned:) dispatching to ArchiveHeader.__allocating_init(object:owned:)()
{
}

uint64_t protocol witness for _AAEncodableProtocol.init(withAAEncodedData:) in conformance ArchiveHeader@<X0>( const uint8_t *a1@<X0>, size_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = swift_allocObject();
  if (a1)
  {
    uint64_t v7 = result;
    uint64_t result = (uint64_t)AAHeaderCreateWithEncodedData(a2, a1);
    if (result)
    {
      *(void *)(v7 + 16) = result;
      *(_BYTE *)(v7 + 24) = 1;
    }

    else
    {
      uint64_t result = swift_deallocPartialClassInstance();
      uint64_t v7 = 0LL;
    }

    *a3 = v7;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t protocol witness for _AAEncodableProtocol.withAAEncodedData<A>(_:) in conformance ArchiveHeader( uint64_t (*a1)(const uint8_t *, size_t))
{
  return ArchiveHeader.withAAEncodedData<A>(_:)(a1);
}

uint64_t ArchiveHeader.startIndex.getter()
{
  return 0LL;
}

uint64_t ArchiveHeader.endIndex.getter()
{
  return AAHeaderGetFieldCount(*(AAHeader *)(v0 + 16));
}

double key path getter for ArchiveHeader.subscript(_:) : ArchiveHeader@<D0>( unint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3 = v7;
  char v4 = v8;
  double result = *(double *)&v6;
  *(_OWORD *)a2 = v6;
  *(void *)(a2 + 16) = v3;
  *(_BYTE *)(a2 + 24) = v4;
  return result;
}

uint64_t key path setter for ArchiveHeader.subscript(_:) : ArchiveHeader(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  char v7 = *(_BYTE *)(a1 + 24);
  v9[0] = v4;
  v9[1] = v5;
  v9[2] = v6;
  char v10 = v7;
  outlined copy of ArchiveHeader.Field(v4, v5, v6, v7);
  ArchiveHeader._set(at:field:)(v3, (uint64_t)v9);
  return outlined consume of ArchiveHeader.Field(v4, v5, v6, v7);
}

uint64_t ArchiveHeader.subscript.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  char v5 = *(_BYTE *)(a1 + 24);
  v7[0] = *(void *)a1;
  uint64_t v2 = v7[0];
  v7[1] = v3;
  v7[2] = v4;
  char v8 = v5;
  ArchiveHeader._set(at:field:)(a2, (uint64_t)v7);
  return outlined consume of ArchiveHeader.Field(v2, v3, v4, v5);
}

uint64_t outlined consume of ArchiveHeader.Field(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4 == 3) {
    return swift_release();
  }
  if (a4 == 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void (*ArchiveHeader.subscript.modify(void *a1, unint64_t a2))(uint64_t **a1, char a2)
{
  char v5 = malloc(0x30uLL);
  *a1 = v5;
  v5[4] = a2;
  v5[5] = v2;
  ArchiveHeader._field(at:)(a2, (uint64_t)v5);
  return ArchiveHeader.subscript.modify;
}

void ArchiveHeader.subscript.modify(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  uint64_t v5 = (*a1)[2];
  char v6 = *((_BYTE *)*a1 + 24);
  uint64_t v7 = (*a1)[4];
  v12[0] = v4;
  v12[1] = v3;
  v12[2] = v5;
  char v13 = v6;
  if ((a2 & 1) != 0)
  {
    outlined copy of ArchiveHeader.Field(v4, v3, v5, v6);
    ArchiveHeader._set(at:field:)(v7, (uint64_t)v12);
    outlined consume of ArchiveHeader.Field(v4, v3, v5, v6);
    uint64_t v8 = *v2;
    uint64_t v9 = v2[1];
    uint64_t v10 = v2[2];
    char v11 = *((_BYTE *)v2 + 24);
  }

  else
  {
    ArchiveHeader._set(at:field:)(v7, (uint64_t)v12);
    uint64_t v8 = v4;
    uint64_t v9 = v3;
    uint64_t v10 = v5;
    char v11 = v6;
  }

  outlined consume of ArchiveHeader.Field(v8, v9, v10, v11);
  free(v2);
}

uint64_t outlined copy of ArchiveHeader.Field(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4 == 3) {
    return swift_retain();
  }
  if (a4 == 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

Swift::Void __swiftcall ArchiveHeader.removeAll()()
{
  if (AAHeaderClear(*(AAHeader *)(v0 + 16)))
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

uint64_t ArchiveHeader.remove(at:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if ((a1 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (HIDWORD(a1))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  uint64_t v6 = v10[0];
  uint64_t v5 = v10[1];
  uint64_t v4 = v10[2];
  char v3 = v11;
  uint64_t result = AAHeaderRemoveField(*(AAHeader *)(v2 + 16), a1);
  if (!(_DWORD)result)
  {
    *(void *)a2 = v6;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v4;
    *(_BYTE *)(a2 + 24) = v3;
    return result;
  }

LABEL_7:
  outlined consume of ArchiveHeader.Field(v6, v5, v4, v3);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

  uint64_t result = (uint64_t (*)())_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

  *(_DWORD *)a1 = v5;
  *(_BYTE *)(a1 + 4) = v7;
  return result;
}

  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

  MEMORY[0x1895C984C](v0, -1LL, -1LL);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

  if (AEAContextSetFieldBlob(v9, field, 0, v7, v8) < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    char *v13 = 1;
    swift_willThrow();
  }

  return (const uint8_t *)swift_release();
}

void ArchiveHeader.append(_:)(__int128 *a1)
{
  uint64_t v1 = *((void *)a1 + 2);
  char v2 = *((_BYTE *)a1 + 24);
  __int128 v3 = *a1;
  uint64_t v4 = v1;
  char v5 = v2;
  ArchiveHeader._append(_:)((uint64_t)&v3);
}

uint64_t protocol witness for MutableCollection.subscript.setter in conformance ArchiveHeader( uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  char v6 = *(_BYTE *)(a1 + 24);
  v8[0] = *(void *)a1;
  uint64_t v3 = v8[0];
  v8[1] = v4;
  v8[2] = v5;
  char v9 = v6;
  ArchiveHeader._set(at:field:)(v2, (uint64_t)v8);
  return outlined consume of ArchiveHeader.Field(v3, v4, v5, v6);
}

{
  uint64_t *v2;
  specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)( v2,  *a2,  a2[1],  *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16));
  return swift_release();
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader( void *a1, unint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = ArchiveHeader.subscript.modify(v4, *a2);
  return protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader;
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader( void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized MutableCollection<>.subscript.modify(v4, *a2, a2[1]);
  return protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader;
}

void protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

unint64_t protocol witness for MutableCollection.partition(by:) in conformance ArchiveHeader@<X0>( uint64_t (*a1)(uint64_t *)@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t result = specialized MutableCollection<>._partitionImpl(by:)(a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

unint64_t protocol witness for MutableCollection.swapAt(_:_:) in conformance ArchiveHeader( unint64_t *a1, unint64_t *a2)
{
  return specialized MutableCollection.swapAt(_:_:)(*a1, *a2);
}

uint64_t protocol witness for MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:) in conformance ArchiveHeader()
{
  return MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)();
}

uint64_t protocol witness for MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:) in conformance ArchiveHeader()
{
  return MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)();
}

void protocol witness for Collection.startIndex.getter in conformance ArchiveHeader(void *a1@<X8>)
{
  *a1 = 0LL;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance ArchiveHeader( uint64_t a1, unint64_t *a2))(uint64_t a1)
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader;
}

uint64_t protocol witness for Collection.subscript.read in conformance ArchiveHeader(uint64_t a1)
{
  return outlined consume of ArchiveHeader.Field( *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(_BYTE *)(a1 + 24));
}

uint64_t protocol witness for Collection.subscript.getter in conformance ArchiveHeader@<X0>( uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = *v2;
  uint64_t result = AAHeaderGetFieldCount(*(AAHeader *)(v6 + 16));
  if (v4 < 0)
  {
    __break(1u);
  }

  else if (v5 <= result)
  {
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v6;
    return swift_retain();
  }

  __break(1u);
  return result;
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance ArchiveHeader( uint64_t a1@<X8>)
{
  *(void *)a1 = 0LL;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance ArchiveHeader@<X0>( unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(void *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance ArchiveHeader(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0LL;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance ArchiveHeader(uint64_t a1)
{
  return Collection.underestimatedCount.getter();
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance ArchiveHeader()
{
  return 2LL;
}

void *protocol witness for Sequence._copyToContiguousArray() in conformance ArchiveHeader()
{
  uint64_t v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_release();
  return v1;
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance ArchiveHeader( void *a1, uint64_t a2, unint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance ArchiveHeader()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t ArchiveHeader._FieldTypes.startIndex.getter()
{
  return 0LL;
}

uint64_t ArchiveHeader._FieldTypes.subscript.getter@<X0>(unint64_t i@<X0>, _DWORD *a2@<X8>)
{
  if ((i & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (HIDWORD(i))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  uint64_t result = AAHeaderGetFieldType(*(AAHeader *)(*(void *)v2 + 16LL), i);
  if ((result & 0x80000000) == 0)
  {
    *a2 = result;
    return result;
  }

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance ArchiveHeader._FieldTypes@<X0>( void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  return protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance ArchiveHeader._FieldTypes( a1,  a2,  a3,  (uint64_t (*)(void, uint64_t, void, void))specialized RandomAccessCollection.index(_:offsetBy:limitedBy:),  a4);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes( int *a1, unint64_t *a2))()
{
  unint64_t v3 = *a2;
  if ((v3 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (HIDWORD(v3))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  int FieldType = AAHeaderGetFieldType(*(AAHeader *)(*(void *)v2 + 16LL), v3);
  if ((FieldType & 0x80000000) == 0)
  {
    *a1 = FieldType;
    return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
  }

void *protocol witness for Sequence._copyToContiguousArray() in conformance ArchiveHeader._FieldTypes()
{
  uint64_t v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_release();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance ArchiveHeader._FieldTypes( void *a1, int *a2, unint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance ArchiveHeader._FieldTypes()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t ArchiveHeader._FieldKeys.base.getter()
{
  return swift_retain();
}

uint64_t ArchiveHeader._FieldKeys.startIndex.getter()
{
  return 0LL;
}

uint64_t ArchiveHeader._FieldKeys.endIndex.getter()
{
  return AAHeaderGetFieldCount(*(AAHeader *)(*(void *)v0 + 16LL));
}

AAFieldKey ArchiveHeader._FieldKeys.subscript.getter@<W0>(unint64_t i@<X0>, AAFieldKey *a2@<X8>)
{
  if ((i & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }

  if (HIDWORD(i))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  AAFieldKey result = AAHeaderGetFieldKey(*(AAHeader *)(*(void *)v2 + 16LL), i);
  if ((int)(result.ikey << 8) >> 24 >= 32
    && HIBYTE(result.ikey) == 0
    && result.skey[0] >= 32
    && *(__int16 *)result.skey >> 8 > 31)
  {
    *a2 = result;
    return result;
  }

LABEL_15:
  result.ikey = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

  AAFieldKey result = (uint64_t (*)())_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

  if (a4 != a5)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  return result;
}

  result.ikey = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

  AAFieldKey result = (uint64_t (*)())_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t ArchiveHeader._FieldKeys._customIndexOfEquatableElement(_:)(AAFieldKey *a1)
{
  AAFieldKey v2 = *a1;
  int KeyIndex = AAHeaderGetKeyIndex(*(AAHeader *)(*(void *)v1 + 16LL), v2);
  return KeyIndex & ~(KeyIndex >> 31);
}

void *protocol witness for BidirectionalCollection.index(before:) in conformance ArchiveHeader@<X0>( void *result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v4 = *result - 1LL;
  if (__OFSUB__(*result, 1LL))
  {
    __break(1u);
  }

  else
  {
    AAFieldKey result = (void *)AAHeaderGetFieldCount(*(AAHeader *)(*(void *)v2 + 16LL));
    if (v4 < result)
    {
      *a2 = v4;
      return result;
    }
  }

  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance ArchiveHeader( unint64_t *result)
{
  unint64_t v2 = *result - 1;
  if (__OFSUB__(*result, 1LL))
  {
    __break(1u);
  }

  else
  {
    unint64_t v3 = result;
    AAFieldKey result = (unint64_t *)AAHeaderGetFieldCount(*(AAHeader *)(*(void *)v1 + 16LL));
    if (v2 < result)
    {
      *unint64_t v3 = v2;
      return result;
    }
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.endIndex.getter in conformance ArchiveHeader._FieldKeys@<X0>( void *a1@<X8>)
{
  uint64_t result = AAHeaderGetFieldCount(*(AAHeader *)(*(void *)v1 + 16LL));
  *a1 = result;
  return result;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldKeys( AAFieldKey *a1, unint64_t *a2))()
{
  unint64_t v3 = *a2;
  if ((v3 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }

  if (HIDWORD(v3))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  AAFieldKey FieldKey = AAHeaderGetFieldKey(*(AAHeader *)(*(void *)v2 + 16LL), v3);
  if ((int)(FieldKey.ikey << 8) >> 24 >= 32
    && HIBYTE(FieldKey.ikey) == 0
    && FieldKey.skey[0] >= 32
    && *(__int16 *)FieldKey.skey >> 8 > 31)
  {
    *a1 = FieldKey;
    return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
  }

uint64_t protocol witness for Collection.subscript.getter in conformance ArchiveHeader._FieldTypes@<X0>( uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = *v2;
  uint64_t result = AAHeaderGetFieldCount(*(AAHeader *)(v6 + 16));
  if (v4 < 0)
  {
    __break(1u);
  }

  else if (v5 <= result)
  {
    a2[1] = v5;
    a2[2] = v6;
    *a2 = v4;
    return swift_retain();
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.indices.getter in conformance ArchiveHeader._FieldKeys@<X0>( void *a1@<X8>)
{
  uint64_t result = AAHeaderGetFieldCount(*(AAHeader *)(*(void *)v1 + 16LL));
  *a1 = 0LL;
  a1[1] = result;
  return result;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance ArchiveHeader._FieldKeys()
{
  return AAHeaderGetFieldCount(*(AAHeader *)(*(void *)v0 + 16LL)) == 0;
}

uint64_t protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance ArchiveHeader._FieldKeys@<X0>( AAFieldKey *a1@<X0>, uint64_t a2@<X8>)
{
  AAFieldKey v4 = *a1;
  uint64_t result = AAHeaderGetKeyIndex(*(AAHeader *)(*(void *)v2 + 16LL), v4);
  *(void *)a2 = result & ~((int)result >> 31);
  *(_BYTE *)(a2 + 8) = (int)result < 0;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

void *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance ArchiveHeader@<X0>( void *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }

  else
  {
    uint64_t result = (void *)AAHeaderGetFieldCount(*(AAHeader *)(*(void *)v3 + 16LL));
    if (v5 <= result)
    {
      *a3 = v5;
      return result;
    }
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance ArchiveHeader._FieldTypes@<X0>( void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t (*a4)(void, uint64_t, void, void)@<X5>, uint64_t a5@<X8>)
{
  uint64_t result = a4(*a1, a2, *a3, *v5);
  *(void *)a5 = result;
  *(_BYTE *)(a5 + 8) = v8 & 1;
  return result;
}

unint64_t protocol witness for RandomAccessCollection.distance(from:to:) in conformance ArchiveHeader( unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  unint64_t v5 = *(AAHeader_impl **)(*(void *)v2 + 16LL);
  unint64_t result = AAHeaderGetFieldCount(v5);
  if (v3 > result)
  {
    __break(1u);
  }

  else
  {
    unint64_t result = AAHeaderGetFieldCount(v5);
  }

  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance ArchiveHeader( uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = a2[1];
  if (*result >= *a2)
  {
    BOOL v5 = __OFSUB__(v2, v3);
    BOOL v4 = v2 - v3 < 0;
  }

  else
  {
    BOOL v5 = 0;
    BOOL v4 = 0;
  }

  if (v4 == v5) {
    __break(1u);
  }
  return result;
}

void *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance ArchiveHeader( void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

uint64_t protocol witness for Collection.index(after:) in conformance ArchiveHeader@<X0>( unint64_t *a1@<X0>, void *a2@<X8>)
{
  unint64_t v4 = *a1;
  uint64_t result = AAHeaderGetFieldCount(*(AAHeader *)(*(void *)v2 + 16LL));
  if (v4 >= result)
  {
    __break(1u);
  }

  else if (!__OFADD__(v4, 1LL))
  {
    *a2 = v4 + 1;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.formIndex(after:) in conformance ArchiveHeader(unint64_t *a1)
{
  uint64_t v3 = *v1;
  unint64_t v4 = *a1;
  uint64_t result = AAHeaderGetFieldCount(*(AAHeader *)(v3 + 16));
  if (v4 >= result)
  {
    __break(1u);
  }

  else if (!__OFADD__(v4, 1LL))
  {
    *a1 = v4 + 1;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.count.getter in conformance ArchiveHeader._FieldTypes()
{
  uint64_t v1 = *(AAHeader_impl **)(*(void *)v0 + 16LL);
  uint32_t FieldCount = AAHeaderGetFieldCount(v1);
  AAHeaderGetFieldCount(v1);
  uint64_t result = AAHeaderGetFieldCount(v1);
  __break(1u);
  return result;
}

void *protocol witness for Sequence._copyToContiguousArray() in conformance ArchiveHeader._FieldKeys()
{
  uint64_t v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_release();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance ArchiveHeader._FieldKeys( void *a1, uint64_t a2, unint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t ArchiveHeader.fieldKey.getter@<X0>(void *a1@<X8>)
{
  *a1 = v1;
  return swift_retain();
}

unsigned int ArchiveHeader.entryType.getter@<W0>(uint64_t a1@<X8>)
{
  AAFieldKey v3 = v12;
  unsigned int result = AAHeaderGetKeyIndex(*(AAHeader *)(v1 + 16), v3);
  if ((result & 0x80000000) != 0) {
    goto LABEL_6;
  }
  unsigned int result = ArchiveHeader._field(at:)(result, (uint64_t)&v8).ikey;
  uint64_t v5 = v9;
  char v6 = v11;
  if (v11 != 1)
  {
LABEL_5:
    unsigned int result = outlined consume of ArchiveHeader.Field(v8, v5, v10, v6);
LABEL_6:
    LODWORD(v5) = 0;
    LOBYTE(v7) = 1;
    goto LABEL_7;
  }

  unint64_t v7 = HIDWORD(v9);
  if (HIDWORD(v9))
  {
    __break(1u);
    goto LABEL_5;
  }

uint64_t ArchiveHeader.entryPath.getter@<X0>(uint64_t a1@<X8>)
{
  AAFieldKey v3 = v10;
  unsigned int KeyIndex = AAHeaderGetKeyIndex(*(AAHeader *)(v1 + 16), v3);
  if ((KeyIndex & 0x80000000) == 0)
  {
    ArchiveHeader._field(at:)(KeyIndex, (uint64_t)v8);
    if (v9 == 2)
    {
      FilePath.init(_:)();
      uint64_t v5 = type metadata accessor for FilePath();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))( a1,  0LL,  1LL,  v5);
    }

    outlined consume of ArchiveHeader.Field(v8[0], v8[1], v8[2], v9);
  }

  uint64_t v7 = type metadata accessor for FilePath();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))(a1, 1LL, 1LL, v7);
}

uint64_t base witness table accessor for BidirectionalCollection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type ArchiveHeader and conformance ArchiveHeader( &lazy protocol witness table cache variable for type ArchiveHeader and conformance ArchiveHeader,  (uint64_t)&protocol conformance descriptor for ArchiveHeader);
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>( &lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>,  MEMORY[0x189618A58]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895C97C8](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = MEMORY[0x1895C97D4](MEMORY[0x189618768], MEMORY[0x189618740]);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }

  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance <> Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader> and conformance <> Slice<A>,  &lazy protocol witness table cache variable for type ArchiveHeader and conformance ArchiveHeader,  (uint64_t)&protocol conformance descriptor for ArchiveHeader,  MEMORY[0x18961A5E0]);
}

uint64_t base witness table accessor for Collection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type ArchiveHeader and conformance ArchiveHeader( &lazy protocol witness table cache variable for type ArchiveHeader and conformance ArchiveHeader,  (uint64_t)&protocol conformance descriptor for ArchiveHeader);
}

uint64_t associated type witness table accessor for Collection.SubSequence : MutableCollection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance <> Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader> and conformance <> Slice<A>,  &lazy protocol witness table cache variable for type ArchiveHeader and conformance ArchiveHeader,  (uint64_t)&protocol conformance descriptor for ArchiveHeader,  MEMORY[0x18961A5D0]);
}

uint64_t lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance <> Slice<A>( unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<ArchiveHeader>);
    uint64_t v10 = lazy protocol witness table accessor for type ArchiveHeader and conformance ArchiveHeader(a2, a3);
    uint64_t result = MEMORY[0x1895C97D4](a4, v9, &v10);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>( &lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>,  MEMORY[0x189618A40]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance <> Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader> and conformance <> Slice<A>,  &lazy protocol witness table cache variable for type ArchiveHeader and conformance ArchiveHeader,  (uint64_t)&protocol conformance descriptor for ArchiveHeader,  MEMORY[0x18961A5C8]);
}

uint64_t base witness table accessor for Sequence in ArchiveHeader()
{
  return lazy protocol witness table accessor for type ArchiveHeader and conformance ArchiveHeader( &lazy protocol witness table cache variable for type ArchiveHeader and conformance ArchiveHeader,  (uint64_t)&protocol conformance descriptor for ArchiveHeader);
}

uint64_t lazy protocol witness table accessor for type ArchiveHeader and conformance ArchiveHeader( unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for ArchiveHeader();
    uint64_t result = MEMORY[0x1895C97D4](a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in ArchiveHeader()
{
  return MEMORY[0x189618758];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>( &lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>,  MEMORY[0x189618A60]);
}

uint64_t lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>( unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<Int>);
    unint64_t v6 = lazy protocol witness table accessor for type Int and conformance Int();
    v7[0] = MEMORY[0x189618780];
    v7[1] = v6;
    uint64_t result = MEMORY[0x1895C97D4](a2, v5, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader> and conformance Slice<A>,  &demangling cache variable for type metadata for Slice<ArchiveHeader>,  MEMORY[0x18961A5E8]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>( &lazy protocol witness table cache variable for type IndexingIterator<ArchiveHeader> and conformance IndexingIterator<A>,  &demangling cache variable for type metadata for IndexingIterator<ArchiveHeader>,  MEMORY[0x189619678]);
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader._FieldTypes,  &type metadata for ArchiveHeader._FieldTypes);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader._FieldTypes,  &type metadata for ArchiveHeader._FieldTypes);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader._FieldTypes,  &type metadata for ArchiveHeader._FieldTypes);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader._FieldTypes,  &type metadata for ArchiveHeader._FieldTypes);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes);
  }

  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in ArchiveHeader._FieldTypes()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader._FieldTypes> and conformance <> Slice<A>,  &demangling cache variable for type metadata for Slice<ArchiveHeader._FieldTypes>,  (uint64_t (*)(void))lazy protocol witness table accessor for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes,  MEMORY[0x18961A5E0]);
}

uint64_t lazy protocol witness table accessor for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>( unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t v9 = a3();
    uint64_t result = MEMORY[0x1895C97D4](a4, v8, &v9);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in ArchiveHeader._FieldTypes()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader._FieldTypes> and conformance <> Slice<A>,  &demangling cache variable for type metadata for Slice<ArchiveHeader._FieldTypes>,  (uint64_t (*)(void))lazy protocol witness table accessor for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes,  MEMORY[0x18961A5C8]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in ArchiveHeader._FieldTypes()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader._FieldTypes> and conformance Slice<A>,  &demangling cache variable for type metadata for Slice<ArchiveHeader._FieldTypes>,  MEMORY[0x18961A5E8]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ArchiveHeader._FieldTypes()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>( &lazy protocol witness table cache variable for type IndexingIterator<ArchiveHeader._FieldTypes> and conformance IndexingIterator<A>,  &demangling cache variable for type metadata for IndexingIterator<ArchiveHeader._FieldTypes>,  MEMORY[0x189619678]);
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader._FieldKeys,  &type metadata for ArchiveHeader._FieldKeys);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader._FieldKeys,  &type metadata for ArchiveHeader._FieldKeys);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader._FieldKeys,  &type metadata for ArchiveHeader._FieldKeys);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader._FieldKeys,  &type metadata for ArchiveHeader._FieldKeys);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys);
  }

  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in ArchiveHeader._FieldKeys()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>,  &demangling cache variable for type metadata for Slice<ArchiveHeader._FieldKeys>,  (uint64_t (*)(void))lazy protocol witness table accessor for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys,  MEMORY[0x18961A5E0]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in ArchiveHeader._FieldKeys()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>,  &demangling cache variable for type metadata for Slice<ArchiveHeader._FieldKeys>,  (uint64_t (*)(void))lazy protocol witness table accessor for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys,  MEMORY[0x18961A5C8]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in ArchiveHeader._FieldKeys()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader._FieldKeys> and conformance Slice<A>,  &demangling cache variable for type metadata for Slice<ArchiveHeader._FieldKeys>,  MEMORY[0x18961A5E8]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ArchiveHeader._FieldKeys()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>( &lazy protocol witness table cache variable for type IndexingIterator<ArchiveHeader._FieldKeys> and conformance IndexingIterator<A>,  &demangling cache variable for type metadata for IndexingIterator<ArchiveHeader._FieldKeys>,  MEMORY[0x189619678]);
}

uint64_t lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>( unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = MEMORY[0x1895C97D4](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_18861AF84()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for _AAHeaderTraits()
{
  return &type metadata for _AAHeaderTraits;
}

uint64_t type metadata completion function for ArchiveHeader()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ArchiveHeader()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveHeader.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ArchiveHeader.__allocating_init(keySet:directory:path:flags:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ArchiveHeader.__allocating_init(copying:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of ArchiveHeader.field(forKey:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144LL))();
}

uint64_t dispatch thunk of ArchiveHeader.__allocating_init(withAAEncodedData:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of ArchiveHeader.withAAEncodedData<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192LL))();
}

ValueMetadata *type metadata accessor for ArchiveHeader._FieldTypes()
{
  return &type metadata for ArchiveHeader._FieldTypes;
}

ValueMetadata *type metadata accessor for ArchiveHeader._FieldKeys()
{
  return &type metadata for ArchiveHeader._FieldKeys;
}

void type metadata accessor for AAFieldKey(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for AAEntryAttributes(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AAEntryAttributes(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 72)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for AAEntryAttributes(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 72) = v3;
  return result;
}

void type metadata accessor for AAEntryAttributes(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for timespec(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for timespec(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for timespec(uint64_t a1)
{
}

uint64_t specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)( uint64_t result, uint64_t a2, unint64_t a3, AAHashFunction *a4)
{
  if (result < 0)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v8 = (uint8_t *)result;
  if (result)
  {
    uint64_t v9 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v9 + 16) = v8;
  }

  else
  {
    uint64_t v9 = MEMORY[0x18961AFE8];
  }

  v10[1] = v8;
  uint64_t v11 = 0LL;
  v10[0] = (uint8_t *)(v9 + 32);
  __n128 result = closure #1 in ArchiveHeader._field(at:)(v10, &v11, a2, a3, a4);
  if (v4)
  {
    if (v11 <= (uint64_t)v8)
    {
      *(void *)(v9 + 16) = v11;
      swift_bridgeObjectRelease();
      return v9;
    }

    goto LABEL_12;
  }

  if (v11 <= (uint64_t)v8)
  {
    *(void *)(v9 + 16) = v11;
    return v9;
  }

LABEL_13:
  __break(1u);
  return result;
}

AAHeader partial apply for closure #1 in closure #1 in ArchiveHeader.init(keySet:directory:path:flags:)@<X0>( char *path@<X0>, AAHeader *a2@<X8>)
{
  AAHeader result = AAHeaderCreateWithPath( *(AAFieldKeySet *)(*(void *)(v2 + 16) + 16LL),  *(const char **)(v2 + 24),  path,  *(void *)(v2 + 32));
  *a2 = result;
  return result;
}

void type metadata accessor for AAEntryAttributes.__Unnamed_union___Anonymous_field0(uint64_t a1)
{
}

void type metadata accessor for AAFieldKey(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

BOOL static ArchiveError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void ArchiveError.hash(into:)()
{
}

Swift::Int ArchiveError.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ArchiveError( unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ArchiveError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ArchiveError()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ArchiveError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveError and conformance ArchiveError;
  if (!lazy protocol witness table cache variable for type ArchiveError and conformance ArchiveError)
  {
    unint64_t result = MEMORY[0x1895C97D4](&protocol conformance descriptor for ArchiveError, &type metadata for ArchiveError);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveError and conformance ArchiveError);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type ArchiveError and conformance ArchiveError;
  if (!lazy protocol witness table cache variable for type ArchiveError and conformance ArchiveError)
  {
    unint64_t result = MEMORY[0x1895C97D4](&protocol conformance descriptor for ArchiveError, &type metadata for ArchiveError);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveError and conformance ArchiveError);
  }

  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ArchiveError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ArchiveError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_18861B5A4 + 4 * byte_18862E0C5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18861B5D8 + 4 * byte_18862E0C0[v4]))();
}

uint64_t sub_18861B5D8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18861B5E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x18861B5E8LL);
  }
  return result;
}

uint64_t sub_18861B5F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x18861B5FCLL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_18861B600(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18861B608(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for ArchiveError(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for ArchiveError(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ArchiveError()
{
  return &type metadata for ArchiveError;
}

void static ArchiveHeader.EntryMessage.searchPruneDirectory.getter(_DWORD *a1@<X8>)
{
  *a1 = 10;
}

void static ArchiveHeader.EntryMessage.searchExclude.getter(_DWORD *a1@<X8>)
{
  *a1 = 11;
}

void static ArchiveHeader.EntryMessage.searchFail.getter(_DWORD *a1@<X8>)
{
  *a1 = 12;
}

void static ArchiveHeader.EntryMessage.extractBegin.getter(_DWORD *a1@<X8>)
{
  *a1 = 20;
}

void static ArchiveHeader.EntryMessage.extractEnd.getter(_DWORD *a1@<X8>)
{
  *a1 = 21;
}

void static ArchiveHeader.EntryMessage.extractFail.getter(_DWORD *a1@<X8>)
{
  *a1 = 22;
}

void static ArchiveHeader.EntryMessage.extractAttributes.getter(_DWORD *a1@<X8>)
{
  *a1 = 23;
}

void static ArchiveHeader.EntryMessage.extractXAT.getter(_DWORD *a1@<X8>)
{
  *a1 = 24;
}

void static ArchiveHeader.EntryMessage.extractACL.getter(_DWORD *a1@<X8>)
{
  *a1 = 25;
}

void static ArchiveHeader.EntryMessage.convertExclude.getter(_DWORD *a1@<X8>)
{
  *a1 = 40;
}

void static ArchiveHeader.EntryMessage.encodeScanning.getter(_DWORD *a1@<X8>)
{
  *a1 = 30;
}

void static ArchiveHeader.EntryMessage.encodeWriting.getter(_DWORD *a1@<X8>)
{
  *a1 = 31;
}

void static ArchiveHeader.EntryMessage.decodeReading.getter(_DWORD *a1@<X8>)
{
  *a1 = 60;
}

void static ArchiveHeader.EntryMessage.processExclude.getter(_DWORD *a1@<X8>)
{
  *a1 = 50;
}

uint64_t ArchiveHeader.EntryMessage.rawValue.getter()
{
  return *v0;
}

uint64_t ArchiveHeader.EntryMessage.rawValue.setter(uint64_t result)
{
  *__int16 v1 = result;
  return result;
}

uint64_t (*ArchiveHeader.EntryMessage.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveHeader.EntryMessage.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

unint64_t ArchiveHeader.EntryMessage.description.getter()
{
  unint64_t result = 0xD000000000000014LL;
  switch(*v0)
  {
    case 0xA:
      return result;
    case 0xB:
      unint64_t result = 0x7845686372616573LL;
      break;
    case 0xC:
      unint64_t result = 0x6146686372616573LL;
      break;
    case 0x14:
      unint64_t result = 0x4274636172747865LL;
      break;
    case 0x15:
      unint64_t result = 0x4574636172747865LL;
      break;
    case 0x16:
      unint64_t result = 0x4674636172747865LL;
      break;
    case 0x17:
      unint64_t result = 0xD000000000000011LL;
      break;
    case 0x18:
      unint64_t result = 0x5874636172747865LL;
      break;
    case 0x19:
      unint64_t result = 0x4174636172747865LL;
      break;
    case 0x1E:
      unint64_t result = 0x635365646F636E65LL;
      break;
    case 0x1F:
      unint64_t result = 0x725765646F636E65LL;
      break;
    case 0x28:
      unint64_t result = 0x45747265766E6F63LL;
      break;
    case 0x3C:
      unint64_t result = 0x655265646F636564LL;
      break;
    default:
      unint64_t result = 4144959LL;
      break;
  }

  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ArchiveHeader.EntryMessage( _DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader.EntryMessage and conformance ArchiveHeader.EntryMessage()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader.EntryMessage and conformance ArchiveHeader.EntryMessage;
  if (!lazy protocol witness table cache variable for type ArchiveHeader.EntryMessage and conformance ArchiveHeader.EntryMessage)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader.EntryMessage,  &type metadata for ArchiveHeader.EntryMessage);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader.EntryMessage and conformance ArchiveHeader.EntryMessage);
  }

  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ArchiveHeader.EntryMessage()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ArchiveHeader.EntryMessage()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ArchiveHeader.EntryMessage()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance ArchiveHeader.EntryMessage@<X0>( _DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ArchiveHeader.EntryMessage( _DWORD *a1@<X8>)
{
  *a1 = *v1;
}

ValueMetadata *type metadata accessor for ArchiveHeader.EntryMessage()
{
  return &type metadata for ArchiveHeader.EntryMessage;
}

void ArchiveHeader.Field.type.getter(_DWORD *a1@<X8>)
{
  *a1 = *(unsigned __int8 *)(v1 + 24);
}

void ArchiveHeader.Field.key.getter(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t initializeWithCopy for ArchiveHeader.Field(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(_BYTE *)(a2 + 24);
  outlined copy of ArchiveHeader.Field(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for ArchiveHeader.Field(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(_BYTE *)(a2 + 24);
  outlined copy of ArchiveHeader.Field(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  outlined consume of ArchiveHeader.Field(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ArchiveHeader.Field(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(_BYTE *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  outlined consume of ArchiveHeader.Field(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ArchiveHeader.Field(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 5) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ArchiveHeader.Field(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(_BYTE *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 251;
    if (a3 >= 0xFB) {
      *(_BYTE *)(result + 25) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFB) {
      *(_BYTE *)(result + 25) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 24) = -(char)a2;
    }
  }

  return result;
}

uint64_t getEnumTag for ArchiveHeader.Field(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t destructiveInjectEnumTag for ArchiveHeader.Field(uint64_t result, char a2)
{
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ArchiveHeader.Field()
{
  return &type metadata for ArchiveHeader.Field;
}

uint64_t dispatch thunk of ArchiveStreamProtocol.writeHeader(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ArchiveStreamProtocol.writeBlob(key:from:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of ArchiveStreamProtocol.readHeader()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ArchiveStreamProtocol.readBlob(key:into:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of ArchiveStreamProtocol.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ArchiveStreamProtocol.close()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

unint64_t ArchiveHeader.EntryAttributes.uid.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  int v2 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_getter(*(_BYTE *)v1);
  if (v2) {
    uint64_t v3 = *(unsigned int *)(v1 + 4);
  }
  else {
    uint64_t v3 = 0LL;
  }
  return v3 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_getter( char a1)
{
  return a1 & 1;
}

uint64_t ArchiveHeader.EntryAttributes.uid.setter(uint64_t a1)
{
  if ((a1 & 0x100000000LL) != 0)
  {
    uint64_t v5 = *(_DWORD **)(v1 + 16);
    v7[0] = *v5;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_setter(0LL, v7);
    *(_BYTE *)uint64_t v5 = v7[0];
  }

  else
  {
    int v2 = a1;
    uint64_t v3 = *(_DWORD **)(v1 + 16);
    v6[0] = *v3;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_setter(1LL, v6);
    *(_BYTE *)uint64_t v3 = v6[0];
    *(_DWORD *)(*(void *)(v1 + 16) + 4LL) = v2;
  }

  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_setter( uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xFE | result & 1;
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.uid.modify(uint64_t a1))(uint64_t *a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = *(void *)(v1 + 16);
  int v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_getter(*(_BYTE *)v3);
  if (v4) {
    int v5 = *(_DWORD *)(v3 + 4);
  }
  else {
    int v5 = 0;
  }
  *(_DWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 12) = v4 == 0;
  return ArchiveHeader.EntryAttributes.uid.modify;
}

uint64_t ArchiveHeader.EntryAttributes.uid.modify(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((*((_BYTE *)a1 + 12) & 1) != 0)
  {
    int v2 = *(_DWORD **)(v1 + 16);
    v6[0] = *v2;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_setter(0LL, v6);
    *(_BYTE *)int v2 = v6[0];
  }

  else
  {
    int v4 = *((_DWORD *)a1 + 2);
    int v5 = *(_DWORD **)(v1 + 16);
    v6[0] = *v5;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_setter(1LL, v6);
    *(_BYTE *)int v5 = v6[0];
    *(_DWORD *)(*(void *)(v1 + 16) + 4LL) = v4;
  }

  return result;
}

unint64_t ArchiveHeader.EntryAttributes.gid.getter()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  int v2 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_getter(*v1);
  if (v2) {
    uint64_t v3 = *((unsigned int *)v1 + 2);
  }
  else {
    uint64_t v3 = 0LL;
  }
  return v3 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_getter( unsigned int a1)
{
  return (a1 >> 1) & 1;
}

uint64_t ArchiveHeader.EntryAttributes.gid.setter(uint64_t a1)
{
  if ((a1 & 0x100000000LL) != 0)
  {
    int v5 = *(_DWORD **)(v1 + 16);
    v7[0] = *v5;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_setter(0LL, v7);
    *(_BYTE *)int v5 = v7[0];
  }

  else
  {
    int v2 = a1;
    uint64_t v3 = *(_DWORD **)(v1 + 16);
    v6[0] = *v3;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_setter(1LL, v6);
    *(_BYTE *)uint64_t v3 = v6[0];
    *(_DWORD *)(*(void *)(v1 + 16) + 8LL) = v2;
  }

  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_setter( uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xFD | (2 * (result & 1));
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.gid.modify(uint64_t a1))(uint64_t *a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = *(unsigned __int8 **)(v1 + 16);
  int v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_getter(*v3);
  if (v4) {
    int v5 = *((_DWORD *)v3 + 2);
  }
  else {
    int v5 = 0;
  }
  *(_DWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 12) = v4 == 0;
  return ArchiveHeader.EntryAttributes.gid.modify;
}

uint64_t ArchiveHeader.EntryAttributes.gid.modify(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((*((_BYTE *)a1 + 12) & 1) != 0)
  {
    int v2 = *(_DWORD **)(v1 + 16);
    v6[0] = *v2;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_setter(0LL, v6);
    *(_BYTE *)int v2 = v6[0];
  }

  else
  {
    int v4 = *((_DWORD *)a1 + 2);
    int v5 = *(_DWORD **)(v1 + 16);
    v6[0] = *v5;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_setter(1LL, v6);
    *(_BYTE *)int v5 = v6[0];
    *(_DWORD *)(*(void *)(v1 + 16) + 8LL) = v4;
  }

  return result;
}

unint64_t ArchiveHeader.EntryAttributes.flg.getter()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  int v2 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_getter(*v1);
  if (v2) {
    uint64_t v3 = *((unsigned int *)v1 + 3);
  }
  else {
    uint64_t v3 = 0LL;
  }
  return v3 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_getter( unsigned int a1)
{
  return (a1 >> 2) & 1;
}

uint64_t ArchiveHeader.EntryAttributes.flg.setter(uint64_t a1)
{
  if ((a1 & 0x100000000LL) != 0)
  {
    int v5 = *(_DWORD **)(v1 + 16);
    v7[0] = *v5;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_setter(0LL, v7);
    *(_BYTE *)int v5 = v7[0];
  }

  else
  {
    int v2 = a1;
    uint64_t v3 = *(_DWORD **)(v1 + 16);
    v6[0] = *v3;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_setter(1LL, v6);
    *(_BYTE *)uint64_t v3 = v6[0];
    *(_DWORD *)(*(void *)(v1 + 16) + 12LL) = v2;
  }

  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_setter( uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xFB | (4 * (result & 1));
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.flg.modify(uint64_t a1))(uint64_t *a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = *(unsigned __int8 **)(v1 + 16);
  int v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_getter(*v3);
  if (v4) {
    int v5 = *((_DWORD *)v3 + 3);
  }
  else {
    int v5 = 0;
  }
  *(_DWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 12) = v4 == 0;
  return ArchiveHeader.EntryAttributes.flg.modify;
}

uint64_t ArchiveHeader.EntryAttributes.flg.modify(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((*((_BYTE *)a1 + 12) & 1) != 0)
  {
    int v2 = *(_DWORD **)(v1 + 16);
    v6[0] = *v2;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_setter(0LL, v6);
    *(_BYTE *)int v2 = v6[0];
  }

  else
  {
    int v4 = *((_DWORD *)a1 + 2);
    int v5 = *(_DWORD **)(v1 + 16);
    v6[0] = *v5;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_setter(1LL, v6);
    *(_BYTE *)int v5 = v6[0];
    *(_DWORD *)(*(void *)(v1 + 16) + 12LL) = v4;
  }

  return result;
}

unint64_t ArchiveHeader.EntryAttributes.mod.getter()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  int v2 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_getter(*v1);
  if (v2) {
    uint64_t v3 = *((unsigned int *)v1 + 4);
  }
  else {
    uint64_t v3 = 0LL;
  }
  return v3 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_getter( unsigned int a1)
{
  return (a1 >> 3) & 1;
}

uint64_t ArchiveHeader.EntryAttributes.mod.setter(uint64_t a1)
{
  if ((a1 & 0x100000000LL) != 0)
  {
    int v5 = *(_DWORD **)(v1 + 16);
    v7[0] = *v5;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_setter(0LL, v7);
    *(_BYTE *)int v5 = v7[0];
  }

  else
  {
    int v2 = a1;
    uint64_t v3 = *(_DWORD **)(v1 + 16);
    v6[0] = *v3;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_setter(1LL, v6);
    *(_BYTE *)uint64_t v3 = v6[0];
    *(_DWORD *)(*(void *)(v1 + 16) + 16LL) = v2;
  }

  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_setter( uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xF7 | (8 * (result & 1));
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.mod.modify(uint64_t a1))(uint64_t *a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = *(unsigned __int8 **)(v1 + 16);
  int v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_getter(*v3);
  if (v4) {
    int v5 = *((_DWORD *)v3 + 4);
  }
  else {
    int v5 = 0;
  }
  *(_DWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 12) = v4 == 0;
  return ArchiveHeader.EntryAttributes.mod.modify;
}

uint64_t ArchiveHeader.EntryAttributes.mod.modify(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((*((_BYTE *)a1 + 12) & 1) != 0)
  {
    int v2 = *(_DWORD **)(v1 + 16);
    v6[0] = *v2;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_setter(0LL, v6);
    *(_BYTE *)int v2 = v6[0];
  }

  else
  {
    int v4 = *((_DWORD *)a1 + 2);
    int v5 = *(_DWORD **)(v1 + 16);
    v6[0] = *v5;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_setter(1LL, v6);
    *(_BYTE *)int v5 = v6[0];
    *(_DWORD *)(*(void *)(v1 + 16) + 16LL) = v4;
  }

  return result;
}

uint64_t ArchiveHeader.EntryAttributes.mtm.getter()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  else {
    return 0LL;
  }
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_getter( unsigned int a1)
{
  return (a1 >> 6) & 1;
}

uint64_t ArchiveHeader.EntryAttributes.mtm.setter(uint64_t a1, uint64_t a2, char a3)
{
  int v4 = *(_DWORD **)(v3 + 16);
  if ((a3 & 1) != 0)
  {
    v10[0] = *v4;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_setter( 0LL,  v10);
    *(_BYTE *)int v4 = v10[0];
  }

  else
  {
    v9[0] = *v4;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_setter(1LL, v9);
    *(_BYTE *)int v4 = v9[0];
    uint64_t v8 = *(void *)(v3 + 16);
    *(void *)(v8 + 56) = a1;
    *(void *)(v8 + 64) = a2;
  }

  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_setter( uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xBF | ((result & 1) << 6);
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.mtm.modify(uint64_t a1))(uint64_t *a1)
{
  *(void *)(a1 + 24) = v1;
  uint64_t v3 = *(unsigned __int8 **)(v1 + 16);
  int v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_getter(*v3);
  if (v4) {
    __int128 v5 = *(_OWORD *)(v3 + 56);
  }
  else {
    __int128 v5 = 0uLL;
  }
  *(_OWORD *)a1 = v5;
  *(_BYTE *)(a1 + 16) = v4 == 0;
  return ArchiveHeader.EntryAttributes.mtm.modify;
}

uint64_t ArchiveHeader.EntryAttributes.mtm.modify(uint64_t *a1)
{
  uint64_t v1 = a1[3];
  if ((a1[2] & 1) != 0)
  {
    int v2 = *(_DWORD **)(v1 + 16);
    v8[0] = *v2;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_setter(0LL, v8);
    *(_BYTE *)int v2 = v8[0];
  }

  else
  {
    uint64_t v5 = *a1;
    uint64_t v4 = a1[1];
    uint64_t v6 = *(_DWORD **)(v1 + 16);
    v8[0] = *v6;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_setter(1LL, v8);
    *(_BYTE *)uint64_t v6 = v8[0];
    uint64_t v7 = *(void *)(v1 + 16);
    *(void *)(v7 + 56) = v5;
    *(void *)(v7 + 64) = v4;
  }

  return result;
}

uint64_t ArchiveHeader.EntryAttributes.ctm.getter()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  else {
    return 0LL;
  }
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_getter( unsigned int a1)
{
  return (a1 >> 5) & 1;
}

uint64_t ArchiveHeader.EntryAttributes.ctm.setter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = *(_DWORD **)(v3 + 16);
  if ((a3 & 1) != 0)
  {
    v10[0] = *v4;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_setter( 0LL,  v10);
    *(_BYTE *)uint64_t v4 = v10[0];
  }

  else
  {
    v9[0] = *v4;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_setter(1LL, v9);
    *(_BYTE *)uint64_t v4 = v9[0];
    uint64_t v8 = *(void *)(v3 + 16);
    *(void *)(v8 + 40) = a1;
    *(void *)(v8 + 48) = a2;
  }

  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_setter( uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xDF | (32 * (result & 1));
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.ctm.modify(uint64_t a1))(uint64_t *a1)
{
  *(void *)(a1 + 24) = v1;
  uint64_t v3 = *(unsigned __int8 **)(v1 + 16);
  int v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_getter(*v3);
  if (v4) {
    __int128 v5 = *(_OWORD *)(v3 + 40);
  }
  else {
    __int128 v5 = 0uLL;
  }
  *(_OWORD *)a1 = v5;
  *(_BYTE *)(a1 + 16) = v4 == 0;
  return ArchiveHeader.EntryAttributes.ctm.modify;
}

uint64_t ArchiveHeader.EntryAttributes.ctm.modify(uint64_t *a1)
{
  uint64_t v1 = a1[3];
  if ((a1[2] & 1) != 0)
  {
    int v2 = *(_DWORD **)(v1 + 16);
    v8[0] = *v2;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_setter(0LL, v8);
    *(_BYTE *)int v2 = v8[0];
  }

  else
  {
    uint64_t v5 = *a1;
    uint64_t v4 = a1[1];
    uint64_t v6 = *(_DWORD **)(v1 + 16);
    v8[0] = *v6;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_setter(1LL, v8);
    *(_BYTE *)uint64_t v6 = v8[0];
    uint64_t v7 = *(void *)(v1 + 16);
    *(void *)(v7 + 40) = v5;
    *(void *)(v7 + 48) = v4;
  }

  return result;
}

uint64_t ArchiveHeader.EntryAttributes.btm.getter()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  else {
    return 0LL;
  }
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_getter( unsigned int a1)
{
  return (a1 >> 4) & 1;
}

uint64_t ArchiveHeader.EntryAttributes.btm.setter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = *(_DWORD **)(v3 + 16);
  if ((a3 & 1) != 0)
  {
    v10[0] = *v4;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_setter( 0LL,  v10);
    *(_BYTE *)uint64_t v4 = v10[0];
  }

  else
  {
    v9[0] = *v4;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_setter(1LL, v9);
    *(_BYTE *)uint64_t v4 = v9[0];
    uint64_t v8 = *(void *)(v3 + 16);
    *(void *)(v8 + 24) = a1;
    *(void *)(v8 + 32) = a2;
  }

  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_setter( uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xEF | (16 * (result & 1));
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.btm.modify(uint64_t a1))(uint64_t *a1)
{
  *(void *)(a1 + 24) = v1;
  uint64_t v3 = *(unsigned __int8 **)(v1 + 16);
  int v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_getter(*v3);
  if (v4) {
    __int128 v5 = *(_OWORD *)(v3 + 24);
  }
  else {
    __int128 v5 = 0uLL;
  }
  *(_OWORD *)a1 = v5;
  *(_BYTE *)(a1 + 16) = v4 == 0;
  return ArchiveHeader.EntryAttributes.btm.modify;
}

uint64_t ArchiveHeader.EntryAttributes.btm.modify(uint64_t *a1)
{
  uint64_t v1 = a1[3];
  if ((a1[2] & 1) != 0)
  {
    int v2 = *(_DWORD **)(v1 + 16);
    v8[0] = *v2;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_setter(0LL, v8);
    *(_BYTE *)int v2 = v8[0];
  }

  else
  {
    uint64_t v5 = *a1;
    uint64_t v4 = a1[1];
    uint64_t v6 = *(_DWORD **)(v1 + 16);
    v8[0] = *v6;
    uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_setter(1LL, v8);
    *(_BYTE *)uint64_t v6 = v8[0];
    uint64_t v7 = *(void *)(v1 + 16);
    *(void *)(v7 + 24) = v5;
    *(void *)(v7 + 32) = v4;
  }

  return result;
}

uint64_t ArchiveHeader.EntryAttributes.deinit()
{
  return v0;
}

uint64_t ArchiveHeader.EntryAttributes.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_18861C930@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16LL);
  uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_getter(*(_BYTE *)v3);
  if ((_DWORD)result) {
    int v5 = *(_DWORD *)(v3 + 4);
  }
  else {
    int v5 = 0;
  }
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_18861C97C(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm( a1,  a2,  a3,  a4,  (uint64_t (*)(unint64_t))ArchiveHeader.EntryAttributes.uid.setter);
}

uint64_t sub_18861C988@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(unsigned __int8 **)(*(void *)a1 + 16LL);
  uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_getter(*v3);
  if ((_DWORD)result) {
    int v5 = *((_DWORD *)v3 + 2);
  }
  else {
    int v5 = 0;
  }
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_18861C9D4(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm( a1,  a2,  a3,  a4,  (uint64_t (*)(unint64_t))ArchiveHeader.EntryAttributes.gid.setter);
}

uint64_t sub_18861C9E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(unsigned __int8 **)(*(void *)a1 + 16LL);
  uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_getter(*v3);
  if ((_DWORD)result) {
    int v5 = *((_DWORD *)v3 + 3);
  }
  else {
    int v5 = 0;
  }
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_18861CA2C(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm( a1,  a2,  a3,  a4,  (uint64_t (*)(unint64_t))ArchiveHeader.EntryAttributes.flg.setter);
}

uint64_t sub_18861CA38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(unsigned __int8 **)(*(void *)a1 + 16LL);
  uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_getter(*v3);
  if ((_DWORD)result) {
    int v5 = *((_DWORD *)v3 + 4);
  }
  else {
    int v5 = 0;
  }
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_18861CA84(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm( a1,  a2,  a3,  a4,  (uint64_t (*)(unint64_t))ArchiveHeader.EntryAttributes.mod.setter);
}

uint64_t keypath_setTm( unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(unint64_t))
{
  return a5(*a1 | ((unint64_t)*((unsigned __int8 *)a1 + 4) << 32));
}

uint64_t sub_18861CACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(unsigned __int8 **)(*(void *)a1 + 16LL);
  uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_getter(*v3);
  if ((_DWORD)result) {
    __int128 v5 = *(_OWORD *)(v3 + 56);
  }
  else {
    __int128 v5 = 0uLL;
  }
  *(_OWORD *)a2 = v5;
  *(_BYTE *)(a2 + 16) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_18861CB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm( a1,  a2,  a3,  a4,  (uint64_t (*)(void, void, void))ArchiveHeader.EntryAttributes.mtm.setter);
}

uint64_t sub_18861CB24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(unsigned __int8 **)(*(void *)a1 + 16LL);
  uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_getter(*v3);
  if ((_DWORD)result) {
    __int128 v5 = *(_OWORD *)(v3 + 40);
  }
  else {
    __int128 v5 = 0uLL;
  }
  *(_OWORD *)a2 = v5;
  *(_BYTE *)(a2 + 16) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_18861CB70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm( a1,  a2,  a3,  a4,  (uint64_t (*)(void, void, void))ArchiveHeader.EntryAttributes.ctm.setter);
}

uint64_t sub_18861CB7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(unsigned __int8 **)(*(void *)a1 + 16LL);
  uint64_t result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_getter(*v3);
  if ((_DWORD)result) {
    __int128 v5 = *(_OWORD *)(v3 + 24);
  }
  else {
    __int128 v5 = 0uLL;
  }
  *(_OWORD *)a2 = v5;
  *(_BYTE *)(a2 + 16) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_18861CBC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm( a1,  a2,  a3,  a4,  (uint64_t (*)(void, void, void))ArchiveHeader.EntryAttributes.btm.setter);
}

uint64_t keypath_set_8Tm( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void, void))
{
  return a5(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
}

uint64_t type metadata accessor for ArchiveHeader.EntryAttributes()
{
  return objc_opt_self();
}

uint64_t method lookup function for ArchiveHeader.EntryAttributes()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.uid.getter()
{
  unint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 88LL))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.uid.setter(unint64_t a1)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)v1 + 96LL))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.uid.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104LL))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.gid.getter()
{
  unint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 112LL))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.gid.setter(unint64_t a1)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)v1 + 120LL))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.gid.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128LL))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.flg.getter()
{
  unint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.flg.setter(unint64_t a1)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)v1 + 144LL))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.flg.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152LL))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.mod.getter()
{
  unint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 160LL))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.mod.setter(unint64_t a1)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)v1 + 168LL))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.mod.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176LL))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.mtm.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184LL))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.mtm.setter(uint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v3 + 192LL))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.mtm.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200LL))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.ctm.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208LL))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.ctm.setter(uint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v3 + 216LL))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.ctm.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224LL))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.btm.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232LL))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.btm.setter(uint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v3 + 240LL))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.btm.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248LL))();
}

unint64_t ArchiveHeader.EntryFilterData.init(message:data:)@<X0>( int *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  if (a2)
  {
    int v4 = *a1;
    unint64_t result = 0xF000000000000007LL;
    switch(v4)
    {
      case 20:
      case 40:
      case 50:
        type metadata accessor for ArchiveHeader();
        unint64_t result = swift_allocObject();
        *(void *)(result + 16) = a2;
        *(_BYTE *)(result + 24) = 0;
        break;
      case 23:
        type metadata accessor for ArchiveHeader.EntryAttributes();
        uint64_t v7 = swift_allocObject();
        *(void *)(v7 + 16) = a2;
        unint64_t result = v7 | 0x4000000000000000LL;
        break;
      case 24:
        type metadata accessor for ArchiveHeader.EntryXATBlob();
        uint64_t v8 = swift_allocObject();
        *(void *)(v8 + 16) = a2;
        *(_BYTE *)(v8 + 24) = 0;
        unint64_t result = v8 | 0x8000000000000000LL;
        break;
      default:
        break;
    }
  }

  else
  {
    unint64_t result = 0xF000000000000007LL;
  }

  *a3 = result;
  return result;
}

unint64_t closure #1 in ArchiveHeader._EntryFilterWrapper.init(_:)( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  void (*v12)(unsigned int *__return_ptr, unsigned int *, char *, uint64_t *);
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v7 = type metadata accessor for FilePath();
  uint64_t v8 = *(void *)(v7 - 8);
  unint64_t result = MEMORY[0x1895F8858]();
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    swift_retain();
    FilePath.init(platformString:)();
    uint64_t v15 = a2;
    unint64_t result = ArchiveHeader.EntryFilterData.init(message:data:)((int *)&v15, a4, (unint64_t *)&v16);
    AAFieldKey v12 = *(void (**)(unsigned int *__return_ptr, unsigned int *, char *, uint64_t *))(a1 + 16);
    if (v12)
    {
      char v13 = v16;
      v14 = a2;
      v12(&v15, &v14, v11, &v16);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      swift_release();
      outlined consume of ArchiveHeader.EntryFilterData?(v13);
      return v15;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t ArchiveHeader._EntryFilterWrapper.deinit()
{
  return v0;
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?( uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t ArchiveHeader._EntryFilterWrapper.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void *initializeBufferWithCopyOfBuffer for ArchiveHeader.EntryFilterData(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for ArchiveHeader.EntryFilterData()
{
  return swift_release();
}

void *assignWithCopy for ArchiveHeader.EntryFilterData(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void *assignWithTake for ArchiveHeader.EntryFilterData(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArchiveHeader.EntryFilterData(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ArchiveHeader.EntryFilterData( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)unint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7E) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007LL;
    }
  }

  return result;
}

uint64_t getEnumTag for ArchiveHeader.EntryFilterData(void *a1)
{
  return *a1 >> 62;
}

void *destructiveProjectEnumData for ArchiveHeader.EntryFilterData(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *destructiveInjectEnumTag for ArchiveHeader.EntryFilterData(uint64_t *result, uint64_t a2)
{
  *unint64_t result = *result & 0xFFFFFFFFFFFFFF8LL | (a2 << 62);
  return result;
}

ValueMetadata *type metadata accessor for ArchiveHeader.EntryFilterData()
{
  return &type metadata for ArchiveHeader.EntryFilterData;
}

uint64_t type metadata accessor for ArchiveHeader._EntryFilterWrapper()
{
  return objc_opt_self();
}

uint64_t method lookup function for ArchiveHeader._EntryFilterWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t outlined consume of ArchiveHeader.EntryFilterData?(uint64_t result)
{
  if ((~result & 0xF000000000000007LL) != 0) {
    return swift_release();
  }
  return result;
}

uint64_t ArchiveHash.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t ArchiveHash.size.getter()
{
  int v1 = *v0 - 1;
  else {
    return qword_18862E4A0[v1];
  }
}

void static ArchiveHash.crc32.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ArchiveHash.sha1.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void static ArchiveHash.sha256.getter(_DWORD *a1@<X8>)
{
  *a1 = 3;
}

void static ArchiveHash.sha384.getter(_DWORD *a1@<X8>)
{
  *a1 = 4;
}

void static ArchiveHash.sha512.getter(_DWORD *a1@<X8>)
{
  *a1 = 5;
}

uint64_t ArchiveHash.rawValue.getter()
{
  return *v0;
}

uint64_t ArchiveHash.rawValue.setter(uint64_t result)
{
  *int v1 = result;
  return result;
}

uint64_t (*ArchiveHash.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t static ArchiveHash.maxSize.getter()
{
  return 64LL;
}

uint64_t ArchiveHash.description.getter()
{
  uint64_t result = 0x3233637263LL;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      uint64_t result = 828467315LL;
      break;
    case 3:
      uint64_t result = 0x363532616873LL;
      break;
    case 4:
      uint64_t result = 0x343833616873LL;
      break;
    case 5:
      uint64_t result = 0x323135616873LL;
      break;
    default:
      uint64_t result = 4144959LL;
      break;
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveHash and conformance ArchiveHash()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHash and conformance ArchiveHash;
  if (!lazy protocol witness table cache variable for type ArchiveHash and conformance ArchiveHash)
  {
    unint64_t result = MEMORY[0x1895C97D4](&protocol conformance descriptor for ArchiveHash, &type metadata for ArchiveHash);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHash and conformance ArchiveHash);
  }

  return result;
}

ValueMetadata *type metadata accessor for ArchiveHash()
{
  return &type metadata for ArchiveHash;
}

uint64_t ArchiveEncryptionContext.EncryptionMode.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveEncryptionContext.EncryptionMode.none.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveEncryptionContext.EncryptionMode.symmetric.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ArchiveEncryptionContext.EncryptionMode.ecdhe_p256.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void static ArchiveEncryptionContext.EncryptionMode.scrypt.getter(_DWORD *a1@<X8>)
{
  *a1 = 3;
}

uint64_t ArchiveEncryptionContext.EncryptionMode.rawValue.getter()
{
  return *v0;
}

uint64_t ArchiveEncryptionContext.EncryptionMode.rawValue.setter(uint64_t result)
{
  *int v1 = result;
  return result;
}

uint64_t (*ArchiveEncryptionContext.EncryptionMode.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveEncryptionContext.EncryptionMode.description.getter()
{
  uint64_t result = 1701736302LL;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x697274656D6D7973LL;
      break;
    case 2:
      uint64_t result = 0x32705F6568646365LL;
      break;
    case 3:
      uint64_t result = 0x747079726373LL;
      break;
    default:
      uint64_t result = 4144959LL;
      break;
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveEncryptionContext.EncryptionMode and conformance ArchiveEncryptionContext.EncryptionMode()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveEncryptionContext.EncryptionMode and conformance ArchiveEncryptionContext.EncryptionMode;
  if (!lazy protocol witness table cache variable for type ArchiveEncryptionContext.EncryptionMode and conformance ArchiveEncryptionContext.EncryptionMode)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveEncryptionContext.EncryptionMode,  &type metadata for ArchiveEncryptionContext.EncryptionMode);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveEncryptionContext.EncryptionMode and conformance ArchiveEncryptionContext.EncryptionMode);
  }

  return result;
}

ValueMetadata *type metadata accessor for ArchiveEncryptionContext.EncryptionMode()
{
  return &type metadata for ArchiveEncryptionContext.EncryptionMode;
}

uint64_t ArchiveHeader.EntryMessageStatus.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveHeader.EntryMessageStatus.ok.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveHeader.EntryMessageStatus.skip.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ArchiveHeader.EntryMessageStatus.cancel.getter(_DWORD *a1@<X8>)
{
  *a1 = -1;
}

uint64_t ArchiveHeader.EntryMessageStatus.rawValue.getter()
{
  return *v0;
}

uint64_t ArchiveHeader.EntryMessageStatus.rawValue.setter(uint64_t result)
{
  *int v1 = result;
  return result;
}

uint64_t (*ArchiveHeader.EntryMessageStatus.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveHeader.EntryMessageStatus.description.getter()
{
  int v1 = *v0;
  uint64_t v2 = 27503LL;
  uint64_t v3 = 4144959LL;
  if (*v0 == 1) {
    uint64_t v3 = 1885956979LL;
  }
  if (v1) {
    uint64_t v2 = v3;
  }
  if (v1 == -1) {
    return 0x6C65636E6163LL;
  }
  else {
    return v2;
  }
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader.EntryMessageStatus and conformance ArchiveHeader.EntryMessageStatus()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader.EntryMessageStatus and conformance ArchiveHeader.EntryMessageStatus;
  if (!lazy protocol witness table cache variable for type ArchiveHeader.EntryMessageStatus and conformance ArchiveHeader.EntryMessageStatus)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader.EntryMessageStatus,  &type metadata for ArchiveHeader.EntryMessageStatus);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader.EntryMessageStatus and conformance ArchiveHeader.EntryMessageStatus);
  }

  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ArchiveHeader.EntryMessageStatus()
{
  int v1 = *v0;
  uint64_t v2 = 27503LL;
  if (*v0) {
    uint64_t v2 = 4144959LL;
  }
  if (v1 == 1) {
    uint64_t v2 = 1885956979LL;
  }
  if (v1 == -1) {
    return 0x6C65636E6163LL;
  }
  else {
    return v2;
  }
}

ValueMetadata *type metadata accessor for ArchiveHeader.EntryMessageStatus()
{
  return &type metadata for ArchiveHeader.EntryMessageStatus;
}

uint64_t static ArchiveStream._withStream<A>(stream:_:)@<X0>( uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (a1)
  {
    uint64_t result = a2();
    if (!v4)
    {
      swift_beginAccess();
      uint64_t result = *(void *)(a1 + 16);
      if (result)
      {
        uint64_t result = AAArchiveStreamClose((AAArchiveStream)result);
        *(void *)(a1 + 16) = 0LL;
        if ((_DWORD)result)
        {
          lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
          swift_allocError();
          *uint64_t v9 = 0;
          swift_willThrow();
          return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8LL))(a4, a3);
        }
      }
    }
  }

  else
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *uint64_t v10 = 0;
    return swift_willThrow();
  }

  return result;
}

uint64_t static ArchiveStream.withEncodeStream<A>(writingTo:selectUsing:flags:threadCount:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t (*a5)(void)@<X5>, uint64_t a6@<X7>, uint64_t a7@<X8>)
{
  return static ArchiveStream.withEncodeStream<A>(writingTo:selectUsing:flags:threadCount:_:)( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *))specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:));
}

uint64_t static ArchiveStream.withDecodeStream<A>(readingFrom:selectUsing:flags:threadCount:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t (*a5)(void)@<X5>, uint64_t a6@<X7>, uint64_t a7@<X8>)
{
  return static ArchiveStream.withEncodeStream<A>(writingTo:selectUsing:flags:threadCount:_:)( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *))specialized static ArchiveStream.decodeStream(readingFrom:selectUsing:flags:threadCount:));
}

uint64_t static ArchiveStream.withEncodeStream<A>(writingTo:selectUsing:flags:threadCount:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t (*a5)(void)@<X5>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t (*a8)(uint64_t, uint64_t, uint64_t, uint64_t *))
{
  uint64_t v13 = *a4;
  uint64_t v11 = a8(a1, a2, a3, &v13);
  static ArchiveStream._withStream<A>(stream:_:)(v11, a5, a6, a7);
  return swift_release();
}

uint64_t static ArchiveStream.withExtractStream<A>(extractingTo:selectUsing:flags:threadCount:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(void)@<X5>, uint64_t a5@<X7>, uint64_t a6@<X8>)
{
  uint64_t v9 = specialized static ArchiveStream.extractStream(extractingTo:selectUsing:flags:threadCount:)(a1, a2, a3);
  static ArchiveStream._withStream<A>(stream:_:)(v9, a4, a5, a6);
  return swift_release();
}

uint64_t static ArchiveStream.withConvertStream<A>(writingTo:insertKeySet:removeKeySet:selectUsing:flags:threadCount:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, AAFlagSet *a6@<X5>, uint64_t a7@<X6>, uint64_t (*a8)(void)@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  AAFlagSet v15 = *a6;
  uint64_t v13 = specialized static ArchiveStream.convertStream(writingTo:insertKeySet:removeKeySet:selectUsing:flags:threadCount:)( a1,  a2,  a3,  a4,  a5,  &v15,  a7);
  static ArchiveStream._withStream<A>(stream:_:)(v13, a8, a11, a9);
  return swift_release();
}

uint64_t static ArchiveStream.withStream<A, B>(wrapping:_:)@<X0>( uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v9 = static ArchiveStream.customStream<A>(instance:)(a1, a3, a5);
  static ArchiveStream._withStream<A>(stream:_:)(v9, a2, a4, a6);
  return swift_release();
}

uint64_t ArchiveCompression.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveCompression.none.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveCompression.lz4.getter(_DWORD *a1@<X8>)
{
  *a1 = 256;
}

void static ArchiveCompression.zlib.getter(_DWORD *a1@<X8>)
{
  *a1 = 1285;
}

void static ArchiveCompression.lzma.getter(_DWORD *a1@<X8>)
{
  *a1 = 774;
}

void static ArchiveCompression.lzfse.getter(_DWORD *a1@<X8>)
{
  *a1 = 2049;
}

void static ArchiveCompression.lzbitmap.getter(_DWORD *a1@<X8>)
{
  *a1 = 1794;
}

uint64_t ArchiveCompression.init(algo:)@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  int v4 = Algorithm.rawValue.getter();
  uint64_t v5 = type metadata accessor for Algorithm();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(a1, v5);
  *a2 = v4;
  return result;
}

uint64_t ArchiveCompression.rawValue.getter()
{
  return *v0;
}

uint64_t ArchiveCompression.rawValue.setter(uint64_t result)
{
  *int v1 = result;
  return result;
}

uint64_t (*ArchiveCompression.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveCompression.description.getter()
{
  int v1 = *v0;
  if (*v0 > 1284)
  {
    switch(v1)
    {
      case 1285:
        return 1651076218LL;
      case 1794:
        return 0x70616D7469627A6CLL;
      case 2049:
        return 0x6573667A6CLL;
    }
  }

  else
  {
    switch(v1)
    {
      case 0:
        return 1701736302LL;
      case 256:
        return 3439212LL;
      case 774:
        return 1634564716LL;
    }
  }

  return 4144959LL;
}

unint64_t lazy protocol witness table accessor for type ArchiveCompression and conformance ArchiveCompression()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveCompression and conformance ArchiveCompression;
  if (!lazy protocol witness table cache variable for type ArchiveCompression and conformance ArchiveCompression)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveCompression,  &type metadata for ArchiveCompression);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveCompression and conformance ArchiveCompression);
  }

  return result;
}

ValueMetadata *type metadata accessor for ArchiveCompression()
{
  return &type metadata for ArchiveCompression;
}

uint64_t ArchiveHeader.EntryType.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveHeader.EntryType.regularFile.getter(_DWORD *a1@<X8>)
{
  *a1 = 70;
}

void static ArchiveHeader.EntryType.directory.getter(_DWORD *a1@<X8>)
{
  *a1 = 68;
}

void static ArchiveHeader.EntryType.link.getter(_DWORD *a1@<X8>)
{
  *a1 = 76;
}

void static ArchiveHeader.EntryType.fifo.getter(_DWORD *a1@<X8>)
{
  *a1 = 80;
}

void static ArchiveHeader.EntryType.characterSpecial.getter(_DWORD *a1@<X8>)
{
  *a1 = 67;
}

void static ArchiveHeader.EntryType.blockSpecial.getter(_DWORD *a1@<X8>)
{
  *a1 = 66;
}

void static ArchiveHeader.EntryType.socket.getter(_DWORD *a1@<X8>)
{
  *a1 = 83;
}

void static ArchiveHeader.EntryType.whiteout.getter(_DWORD *a1@<X8>)
{
  *a1 = 87;
}

void static ArchiveHeader.EntryType.door.getter(_DWORD *a1@<X8>)
{
  *a1 = 82;
}

void static ArchiveHeader.EntryType.port.getter(_DWORD *a1@<X8>)
{
  *a1 = 84;
}

void static ArchiveHeader.EntryType.metadata.getter(_DWORD *a1@<X8>)
{
  *a1 = 77;
}

uint64_t ArchiveHeader.EntryType.rawValue.getter()
{
  return *v0;
}

uint64_t ArchiveHeader.EntryType.rawValue.setter(uint64_t result)
{
  *int v1 = result;
  return result;
}

uint64_t (*ArchiveHeader.EntryType.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

unint64_t ArchiveHeader.EntryType.description.getter()
{
  unint64_t result = 0x4672616C75676572LL;
  switch(*v0)
  {
    case 'B':
      unint64_t result = 0x6570536B636F6C62LL;
      break;
    case 'C':
      unint64_t result = 0xD000000000000010LL;
      break;
    case 'D':
      unint64_t result = 0x726F746365726964LL;
      break;
    case 'F':
      return result;
    case 'L':
      unint64_t result = 1802398060LL;
      break;
    case 'M':
      unint64_t result = 0x617461646174656DLL;
      break;
    case 'P':
      unint64_t result = 1868982630LL;
      break;
    case 'R':
      unint64_t result = 1919905636LL;
      break;
    case 'S':
      unint64_t result = 0x74656B636F73LL;
      break;
    case 'T':
      unint64_t result = 1953656688LL;
      break;
    case 'W':
      unint64_t result = 0x74756F6574696877LL;
      break;
    default:
      unint64_t result = 4144959LL;
      break;
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader.EntryType and conformance ArchiveHeader.EntryType()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader.EntryType and conformance ArchiveHeader.EntryType;
  if (!lazy protocol witness table cache variable for type ArchiveHeader.EntryType and conformance ArchiveHeader.EntryType)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader.EntryType,  &type metadata for ArchiveHeader.EntryType);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader.EntryType and conformance ArchiveHeader.EntryType);
  }

  return result;
}

ValueMetadata *type metadata accessor for ArchiveHeader.EntryType()
{
  return &type metadata for ArchiveHeader.EntryType;
}

void (*specialized MutableCollection<>.subscript.modify( void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v7 = malloc(0x30uLL);
  *a1 = v7;
  _BYTE v7[4] = a3;
  v7[5] = v3;
  void v7[3] = a2;
  uint64_t v8 = *v3;
  unint64_t result = (void (*)(uint64_t **, char))AAHeaderGetFieldCount(*(AAHeader *)(*v3 + 16));
  if (a2 < 0)
  {
    __break(1u);
  }

  else if (result >= a3)
  {
    *uint64_t v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    swift_retain();
    return MutableCollection<>.subscript.modifyspecialized ;
  }

  __break(1u);
  return result;
}

{
  uint64_t *v3;
  void *v7;
  uint64_t v8;
  void (*result)(uint64_t **, char);
  uint64_t v7 = malloc(0x30uLL);
  *a1 = v7;
  _BYTE v7[4] = a3;
  v7[5] = v3;
  void v7[3] = a2;
  uint64_t v8 = *v3;
  unint64_t result = (void (*)(uint64_t **, char))AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*v3 + 16));
  if (a2 < 0)
  {
    __break(1u);
  }

  else if (result >= a3)
  {
    *uint64_t v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    swift_retain();
    return MutableCollection<>.subscript.modifyspecialized ;
  }

  __break(1u);
  return result;
}

void MutableCollection<>.subscript.modifyspecialized (uint64_t **a1, char a2)
{
}

{
  MutableCollection<>.subscript.modifyspecialized(a1,  a2,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))specialized _writeBackMutableSlice<A, B>(_:bounds:slice:));
}

void MutableCollection<>.subscript.modifyspecialized(uint64_t **a1, char a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  int v4 = *a1;
  uint64_t v5 = **a1;
  uint64_t v6 = (*a1)[1];
  uint64_t v7 = (*a1)[4];
  uint64_t v8 = (*a1)[5];
  uint64_t v9 = (*a1)[2];
  uint64_t v10 = (*a1)[3];
  if ((a2 & 1) != 0)
  {
    swift_retain();
    a3(v8, v10, v7, v5, v6, v9);
    swift_release();
  }

  else
  {
    a3((*a1)[5], v10, v7, v5, v6, v9);
  }

  swift_release();
  free(v4);
}

unint64_t specialized MutableCollection.swapAt(_:_:)(unint64_t result, unint64_t a2)
{
  if (result != a2)
  {
    unint64_t v4 = result;
    uint64_t v5 = *v2;
    ArchiveHeader.EntryXATBlob._attribute(at:)(result, &v10);
    uint64_t v6 = v11;
    ArchiveHeader.EntryXATBlob._attribute(at:)(a2, &v10);
    uint64_t v7 = v11;
    uint64_t v8 = String.utf8CString.getter();
    if ((v4 & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else if (!HIDWORD(v4))
    {
      if (AAEntryXATBlobSetEntry( *(AAEntryXATBlob *)(v5 + 16),  v4,  (const char *)(v8 + 32),  (const uint8_t *)(v7 + 32),  *(void *)(v7 + 16)))
      {
LABEL_13:
        unint64_t result = _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        return result;
      }

      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v9 = String.utf8CString.getter();
      if ((a2 & 0x8000000000000000LL) == 0)
      {
        if (!HIDWORD(a2))
        {
          if (!AAEntryXATBlobSetEntry( *(AAEntryXATBlob *)(v5 + 16),  a2,  (const char *)(v9 + 32),  (const uint8_t *)(v6 + 32),  *(void *)(v6 + 16)))
          {
            swift_release();
            swift_bridgeObjectRelease();
            return swift_release();
          }

          goto LABEL_13;
        }

        goto LABEL_12;
      }

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void v14[3];
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  if (result != a2)
  {
    __darwin_time_t v20 = v2;
    unint64_t v21 = v3;
    uint64_t v5 = result;
    ArchiveHeader._field(at:)(result, (uint64_t)&v16);
    uint64_t v6 = v17;
    uint64_t v13 = v16;
    uint64_t v7 = v18;
    uint64_t v8 = v19;
    ArchiveHeader._field(at:)(a2, (uint64_t)&v16);
    uint64_t v9 = v16;
    uint64_t v10 = v17;
    uint64_t v11 = v18;
    AAFieldKey v12 = v19;
    v14[0] = v16;
    v14[1] = v17;
    v14[2] = v18;
    AAFlagSet v15 = v19;
    ArchiveHeader._set(at:field:)(v5, (uint64_t)v14);
    outlined consume of ArchiveHeader.Field(v9, v10, v11, v12);
    uint64_t v16 = v13;
    uint64_t v17 = v6;
    uint64_t v18 = v7;
    v19 = v8;
    ArchiveHeader._set(at:field:)(a2, (uint64_t)&v16);
    return outlined consume of ArchiveHeader.Field(v13, v6, v7, v8);
  }

  return result;
}

LABEL_11:
      __break(1u);
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }

    __break(1u);
    goto LABEL_11;
  }

  return result;
}

      __break(1u);
    }

    goto LABEL_12;
  }

  __break(1u);
  return result;
}

void protocol witness for static _AAObjectTraits.aaDestroy(_:) in conformance _AAEntryXATBlobTraits( AAEntryXATBlob *a1)
{
}

uint64_t ArchiveHeader.EntryXATBlob.ExtendedAttribute.description.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)v0[1];
  uint64_t v3 = v0[2];
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t result = swift_retain();
    unint64_t v6 = 0LL;
    uint64_t v7 = MEMORY[0x18961A610];
    uint64_t v8 = MEMORY[0x18961A658];
    while (v6 < *(void *)(v3 + 16))
    {
      char v9 = *(_BYTE *)(v3 + v6++ + 32);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_18862E890;
      *(void *)(v10 + 56) = v7;
      *(void *)(v10 + 64) = v8;
      *(_BYTE *)(v10 + 32) = v9;
      v11._countAndFlagsBits = String.init(format:_:)();
      String.append(_:)(v11);
      uint64_t result = swift_bridgeObjectRelease();
      if (v4 == v6)
      {
        swift_release();
        goto LABEL_6;
      }
    }

    __break(1u);
  }

  else
  {
LABEL_6:
    v12._countAndFlagsBits = v1;
    v12._object = v2;
    String.append(_:)(v12);
    swift_bridgeObjectRetain();
    v13._countAndFlagsBits = 0x3A61746164202CLL;
    v13._object = (void *)0xE700000000000000LL;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v14._countAndFlagsBits = 0LL;
    v14._object = (void *)0xE000000000000000LL;
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0x203A79656BLL;
  }

  return result;
}

uint64_t ArchiveHeader.EntryXATBlob.ExtendedAttribute.init(key:data:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

BOOL static ArchiveHeader.EntryXATBlob.ExtendedAttribute.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), BOOL result = 0LL, (v5 & 1) != 0))
  {
    uint64_t v7 = *(void *)(v2 + 16);
    if (v7 == *(void *)(v3 + 16))
    {
      if (!v7 || v2 == v3)
      {
        return 1LL;
      }

      else
      {
        uint64_t v8 = (unsigned __int8 *)(v2 + 32);
        char v9 = (unsigned __int8 *)(v3 + 32);
        uint64_t v10 = v7 - 1;
        do
        {
          int v12 = *v8++;
          int v11 = v12;
          int v14 = *v9++;
          int v13 = v14;
          BOOL v16 = v10-- != 0;
          BOOL result = v11 == v13;
        }

        while (v11 == v13 && v16);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

BOOL specialized static ContiguousArray<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0LL;
  }
  if (!v2 || a1 == a2) {
    return 1LL;
  }
  uint64_t v3 = (unsigned __int8 *)(a1 + 32);
  BOOL v4 = (unsigned __int8 *)(a2 + 32);
  uint64_t v5 = v2 - 1;
  do
  {
    int v7 = *v3++;
    int v6 = v7;
    int v9 = *v4++;
    int v8 = v9;
    BOOL v11 = v5-- != 0;
    BOOL result = v6 == v8;
  }

  while (v6 == v8 && v11);
  return result;
}

void ArchiveHeader.EntryXATBlob.ExtendedAttribute.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::UInt v2 = *(void *)(v1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    uint64_t v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      Swift::UInt8 v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }

    while (v2);
  }

Swift::Int ArchiveHeader.EntryXATBlob.ExtendedAttribute.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::UInt v2 = *(void *)(v1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    uint64_t v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      Swift::UInt8 v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }

    while (v2);
  }

  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ArchiveHeader.EntryXATBlob.ExtendedAttribute( void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  return (v4 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      && specialized static ContiguousArray<A>.== infix(_:_:)(v2, v3);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ArchiveHeader.EntryXATBlob.ExtendedAttribute()
{
  uint64_t v1 = *(void *)(v0 + 16);
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::UInt v2 = *(void *)(v1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    uint64_t v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      Swift::UInt8 v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }

    while (v2);
  }

  return Hasher._finalize()();
}

uint64_t ArchiveHeader.EntryXATBlob.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  AAEntryXATBlob v1 = AAEntryXATBlobCreate();
  if (v1)
  {
    *(void *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 1;
    return v0;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t ArchiveHeader.EntryXATBlob.init()()
{
  AAEntryXATBlob v1 = AAEntryXATBlobCreate();
  if (v1)
  {
    *(void *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 1;
    return v0;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t ArchiveHeader.EntryXATBlob.__allocating_init(directory:path:flags:)(uint64_t a1, uint64_t a2)
{
  return ArchiveHeader.EntryXATBlob.init(directory:path:flags:)(a1, a2);
}

uint64_t ArchiveHeader.EntryXATBlob.init(directory:path:flags:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
  FilePath.withCString<A>(_:)();
  uint64_t v6 = type metadata accessor for FilePath();
  if (v10)
  {
    int v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL);
    v7(a1, v6);
    *(void *)(v3 + 16) = v10;
    *(_BYTE *)(v3 + 24) = 1;
    v7(a2, v6);
  }

  else
  {
    int v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL);
    v8(a1, v6);
    v8(a2, v6);
    type metadata accessor for ArchiveHeader.EntryXATBlob();
    swift_deallocPartialClassInstance();
    return 0LL;
  }

  return v3;
}

uint64_t partial apply for closure #1 in ArchiveHeader.EntryXATBlob.init(directory:path:flags:)()
{
  return FilePath.withCString<A>(_:)();
}

uint64_t type metadata accessor for ArchiveHeader.EntryXATBlob()
{
  uint64_t result = type metadata singleton initialization cache for ArchiveHeader.EntryXATBlob;
  if (!type metadata singleton initialization cache for ArchiveHeader.EntryXATBlob) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ArchiveHeader.EntryXATBlob.apply(directory:path:flags:)()
{
  uint64_t result = FilePath.withCString<A>(_:)();
  if (v2)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *AAEntryXATBlob v1 = 0;
    return swift_willThrow();
  }

  return result;
}

uint64_t partial apply for closure #1 in ArchiveHeader.EntryXATBlob.apply(directory:path:flags:)()
{
  return FilePath.withCString<A>(_:)();
}

uint64_t ArchiveHeader.EntryXATBlob._attribute(at:)@<X0>(unint64_t a1@<X0>, void *a2@<X8>)
{
  key_length[1] = *MEMORY[0x1895F89C0];
  type metadata accessor for String.Encoding();
  MEMORY[0x1895F8858]();
  int v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  size_t data_size = 0LL;
  key_length[0] = 0LL;
  if ((a1 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }

  if (HIDWORD(a1))
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  uint64_t v10 = *(AAEntryXATBlob_impl **)(v2 + 16);
  if (AAEntryXATBlobGetEntry(v10, a1, 0LL, 0LL, key_length, 0LL, 0LL, &data_size)) {
    goto LABEL_30;
  }
  unint64_t v5 = key_length[0];
  size_t v11 = key_length[0] + 1;
  if (__OFADD__(key_length[0], 1LL)) {
    goto LABEL_24;
  }
  size_t v4 = data_size;
  size_t v12 = v11 + data_size;
  if (__OFADD__(v11, data_size))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  if ((v12 & 0x8000000000000000LL) != 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  if (v12)
  {
    uint64_t v2 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v2 + 16) = v12;
  }

  else
  {
    uint64_t v2 = MEMORY[0x18961AFE8];
  }

  uint64_t v3 = v2 + 32;
  if (!AAEntryXATBlobGetEntry(v10, a1, v5 + 1, (char *)(v2 + 32), 0LL, v4, (uint8_t *)(v2 + 32 + v11), 0LL))
  {
    *(void *)(v2 + 16) = v12;
    v22[1] = specialized Collection.prefix(_:)(v5, v2);
    v22[2] = v13;
    v22[3] = v14;
    v22[4] = v15;
    swift_bridgeObjectRetain();
    static String.Encoding.utf8.getter();
    unint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<UInt8>);
    lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>( &lazy protocol witness table cache variable for type ArraySlice<UInt8> and conformance ArraySlice<A>,  &demangling cache variable for type metadata for ArraySlice<UInt8>,  MEMORY[0x189618F90]);
    int v9 = (char *)String.init<A>(bytes:encoding:)();
    a1 = v16;
    swift_unknownObjectRelease();
    if (!a1) {
      __break(1u);
    }
    if ((v4 & 0x8000000000000000LL) == 0)
    {
      unint64_t v5 = *(void *)(v2 + 16);
      if (v5 >= v4) {
        size_t v4 = v5 - v4;
      }
      else {
        size_t v4 = 0LL;
      }
      type metadata accessor for __ContiguousArrayStorageBase();
      swift_unknownObjectRetain_n();
      uint64_t v17 = swift_dynamicCastClass();
      if (!v17)
      {
        swift_unknownObjectRelease();
        uint64_t v17 = MEMORY[0x18961AFE8];
      }

      uint64_t v18 = *(void *)(v17 + 16);
      swift_release();
      if (v18 == v5 - v4)
      {
        uint64_t v19 = swift_dynamicCastClass();
        if (!v19)
        {
          swift_unknownObjectRelease();
          uint64_t v19 = MEMORY[0x18961AFE8];
        }

        goto LABEL_21;
      }

LABEL_28:
      swift_unknownObjectRelease();
      specialized _copyCollectionToContiguousArray<A>(_:)(v2, v3, v4, (2 * v5) | 1);
      uint64_t v19 = v21;
LABEL_21:
      uint64_t result = swift_unknownObjectRelease();
      *a2 = v9;
      a2[1] = a1;
      a2[2] = v19;
      return result;
    }

LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    size_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      size_t v11 = a3;
      goto LABEL_33;
    }

    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }

  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

LABEL_30:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

int64_t specialized Collection.prefix(_:)(int64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }

  else
  {
    unint64_t v2 = *(void *)(a2 + 16);
    else {
      unint64_t v3 = *(void *)(a2 + 16);
    }
    if (!result) {
      unint64_t v3 = 0LL;
    }
    if (v2 >= v3) {
      return a2;
    }
  }

  __break(1u);
  return result;
}

uint64_t ArchiveHeader.EntryXATBlob.__allocating_init(withAAEncodedData:)(const uint8_t *a1, size_t a2)
{
  uint64_t result = swift_allocObject();
  if (a1)
  {
    uint64_t v5 = result;
    AAEntryXATBlob v6 = AAEntryXATBlobCreateWithEncodedData(a1, a2);
    if (v6)
    {
      *(void *)(v5 + 16) = v6;
      *(_BYTE *)(v5 + 24) = 1;
    }

    else
    {
      swift_deallocPartialClassInstance();
      return 0LL;
    }

    return v5;
  }

  else
  {
    __break(1u);
  }

  return result;
}

const uint8_t *ArchiveHeader.EntryXATBlob.init(withAAEncodedData:)(const uint8_t *result, size_t a2)
{
  if (result)
  {
    AAEntryXATBlob v3 = AAEntryXATBlobCreateWithEncodedData(result, a2);
    if (v3)
    {
      *(void *)(v2 + 16) = v3;
      *(_BYTE *)(v2 + 24) = 1;
    }

    else
    {
      type metadata accessor for ArchiveHeader.EntryXATBlob();
      swift_deallocPartialClassInstance();
      return 0LL;
    }

    return (const uint8_t *)v2;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t ArchiveHeader.EntryXATBlob.withAAEncodedData<A>(_:)( uint64_t (*a1)(const uint8_t *, size_t))
{
  AAEntryXATBlob v3 = *(AAEntryXATBlob_impl **)(v1 + 16);
  size_t EncodedSize = AAEntryXATBlobGetEncodedSize(v3);
  EncodedData = AAEntryXATBlobGetEncodedData(v3);
  return a1(EncodedData, EncodedSize);
}

void ArchiveHeader.EntryXATBlob.__allocating_init(object:owned:)()
{
}

void ArchiveHeader.EntryXATBlob.init(object:owned:)()
{
}

uint64_t ArchiveHeader.EntryXATBlob.deinit()
{
  if (*(_BYTE *)(v0 + 24) == 1) {
    AAEntryXATBlobDestroy(*(AAEntryXATBlob *)(v0 + 16));
  }
  return v0;
}

uint64_t ArchiveHeader.EntryXATBlob.__deallocating_deinit()
{
  if (*(_BYTE *)(v0 + 24) == 1) {
    AAEntryXATBlobDestroy(*(AAEntryXATBlob *)(v0 + 16));
  }
  return swift_deallocClassInstance();
}

void vtable thunk for _AAObjectWrapper.__allocating_init(object:owned:) dispatching to ArchiveHeader.EntryXATBlob.__allocating_init(object:owned:)()
{
}

uint64_t protocol witness for _AAEncodableProtocol.init(withAAEncodedData:) in conformance ArchiveHeader.EntryXATBlob@<X0>( const uint8_t *a1@<X0>, size_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = swift_allocObject();
  if (a1)
  {
    uint64_t v7 = result;
    uint64_t result = (uint64_t)AAEntryXATBlobCreateWithEncodedData(a1, a2);
    if (result)
    {
      *(void *)(v7 + 16) = result;
      *(_BYTE *)(v7 + 24) = 1;
    }

    else
    {
      uint64_t result = swift_deallocPartialClassInstance();
      uint64_t v7 = 0LL;
    }

    *a3 = v7;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t protocol witness for _AAEncodableProtocol.withAAEncodedData<A>(_:) in conformance ArchiveHeader.EntryXATBlob( uint64_t (*a1)(const uint8_t *, size_t))
{
  return ArchiveHeader.EntryXATBlob.withAAEncodedData<A>(_:)(a1);
}

uint64_t ArchiveHeader.EntryXATBlob.startIndex.getter()
{
  return 0LL;
}

uint64_t ArchiveHeader.EntryXATBlob.endIndex.getter()
{
  return AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v0 + 16));
}

uint64_t key path setter for ArchiveHeader.EntryXATBlob.subscript(_:) : ArchiveHeader.EntryXATBlob( void *a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3 = *a3;
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  v7[0] = *a1;
  v7[1] = v4;
  void v7[2] = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  return ArchiveHeader.EntryXATBlob.subscript.setter((uint64_t)v7, v3);
}

uint64_t ArchiveHeader.EntryXATBlob.subscript.setter(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = String.utf8CString.getter();
  if ((a2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (HIDWORD(a2))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (!AAEntryXATBlobSetEntry( *(AAEntryXATBlob *)(v2 + 16),  a2,  (const char *)(v5 + 32),  (const uint8_t *)(v4 + 32),  *(void *)(v4 + 16)))
  {
    swift_release();
    swift_bridgeObjectRelease();
    return swift_release();
  }

void (*ArchiveHeader.EntryXATBlob.subscript.modify( void *a1, unint64_t a2))(uint64_t a1, char a2)
{
  uint64_t v5 = malloc(0x28uLL);
  *a1 = v5;
  v5[3] = a2;
  v5[4] = v2;
  ArchiveHeader.EntryXATBlob._attribute(at:)(a2, v5);
  return ArchiveHeader.EntryXATBlob.subscript.modify;
}

void ArchiveHeader.EntryXATBlob.subscript.modify(uint64_t a1, char a2)
{
  unint64_t v3 = *(void **)a1;
  uint64_t v5 = *(void *)(*(void *)a1 + 24LL);
  uint64_t v4 = *(void *)(*(void *)a1 + 32LL);
  uint64_t v6 = *(void *)(*(void *)a1 + 16LL);
  uint64_t v7 = (const char *)(String.utf8CString.getter() + 32);
  size_t v8 = *(void *)(v6 + 16);
  int v9 = *(AAEntryXATBlob_impl **)(v4 + 16);
  if ((a2 & 1) != 0)
  {
    if ((v5 & 0x8000000000000000LL) == 0)
    {
      unint64_t v10 = v3[3];
      if (!HIDWORD(v10))
      {
        swift_bridgeObjectRetain();
        swift_retain();
        if (!AAEntryXATBlobSetEntry(v9, v10, v7, (const uint8_t *)(v6 + 32), v8))
        {
          swift_release();
          swift_bridgeObjectRelease();
          swift_release();
LABEL_10:
          swift_bridgeObjectRelease();
          swift_release();
          free(v3);
          return;
        }

        goto LABEL_15;
      }

      goto LABEL_13;
    }

    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  if (v5 < 0) {
    goto LABEL_12;
  }
  unint64_t v11 = v3[3];
  if (HIDWORD(v11))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  if (!AAEntryXATBlobSetEntry(v9, v11, v7, (const uint8_t *)(v6 + 32), *(void *)(v6 + 16)))
  {
    swift_release();
    goto LABEL_10;
  }

Swift::Void __swiftcall ArchiveHeader.EntryXATBlob.removeAll()()
{
  if (AAEntryXATBlobClear(*(AAEntryXATBlob *)(v0 + 16)))
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

uint64_t ArchiveHeader.EntryXATBlob.remove(at:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if ((a1 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (HIDWORD(a1))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  uint64_t v5 = v8;
  __int128 v7 = v9;
  uint64_t result = AAEntryXATBlobRemoveEntry(*(AAEntryXATBlob *)(v2 + 16), a1);
  if (!(_DWORD)result)
  {
    *(void *)a2 = v5;
    *(_OWORD *)(a2 + 8) = v7;
    return result;
  }

uint64_t ArchiveHeader.EntryXATBlob.append(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = String.utf8CString.getter();
  if (!AAEntryXATBlobAppendEntry( *(AAEntryXATBlob *)(v1 + 16),  (const char *)(v3 + 32),  (const uint8_t *)(v2 + 32),  *(void *)(v2 + 16))) {
    return swift_release();
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader.EntryXATBlob.ExtendedAttribute and conformance ArchiveHeader.EntryXATBlob.ExtendedAttribute()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob.ExtendedAttribute and conformance ArchiveHeader.EntryXATBlob.ExtendedAttribute;
  if (!lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob.ExtendedAttribute and conformance ArchiveHeader.EntryXATBlob.ExtendedAttribute)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader.EntryXATBlob.ExtendedAttribute,  &type metadata for ArchiveHeader.EntryXATBlob.ExtendedAttribute);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob.ExtendedAttribute and conformance ArchiveHeader.EntryXATBlob.ExtendedAttribute);
  }

  return result;
}

uint64_t base witness table accessor for BidirectionalCollection in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob( &lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob,  (uint64_t)&protocol conformance descriptor for ArchiveHeader.EntryXATBlob);
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>,  &lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob,  (uint64_t)&protocol conformance descriptor for ArchiveHeader.EntryXATBlob,  MEMORY[0x18961A5E0]);
}

uint64_t base witness table accessor for Collection in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob( &lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob,  (uint64_t)&protocol conformance descriptor for ArchiveHeader.EntryXATBlob);
}

uint64_t associated type witness table accessor for Collection.SubSequence : MutableCollection in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>,  &lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob,  (uint64_t)&protocol conformance descriptor for ArchiveHeader.EntryXATBlob,  MEMORY[0x18961A5D0]);
}

uint64_t lazy protocol witness table accessor for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>( unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<ArchiveHeader.EntryXATBlob>);
    uint64_t v10 = lazy protocol witness table accessor for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob( a2,  a3);
    uint64_t result = MEMORY[0x1895C97D4](a4, v9, &v10);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t protocol witness for MutableCollection.subscript.setter in conformance ArchiveHeader.EntryXATBlob( uint64_t a1, unint64_t *a2)
{
  return ArchiveHeader.EntryXATBlob.subscript.setter(a1, *a2);
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader.EntryXATBlob( void *a1, unint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = ArchiveHeader.EntryXATBlob.subscript.modify(v4, *a2);
  return protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader;
}

uint64_t protocol witness for MutableCollection.subscript.setter in conformance ArchiveHeader.EntryXATBlob( uint64_t a1, uint64_t *a2)
{
  return swift_release();
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader.EntryXATBlob( void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized MutableCollection<>.subscript.modify(v4, *a2, a2[1]);
  return protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader;
}

unint64_t protocol witness for MutableCollection.partition(by:) in conformance ArchiveHeader.EntryXATBlob@<X0>( uint64_t (*a1)(uint64_t *)@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = specialized MutableCollection<>._partitionImpl(by:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

unint64_t protocol witness for MutableCollection.swapAt(_:_:) in conformance ArchiveHeader.EntryXATBlob( unint64_t *a1, unint64_t *a2)
{
  return specialized MutableCollection.swapAt(_:_:)(*a1, *a2);
}

uint64_t protocol witness for MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:) in conformance ArchiveHeader.EntryXATBlob()
{
  return MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)();
}

uint64_t protocol witness for MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:) in conformance ArchiveHeader.EntryXATBlob()
{
  return MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)();
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>,  &lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob,  (uint64_t)&protocol conformance descriptor for ArchiveHeader.EntryXATBlob,  MEMORY[0x18961A5C8]);
}

void *protocol witness for BidirectionalCollection.index(before:) in conformance ArchiveHeader.EntryXATBlob@<X0>( void *result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v4 = *result - 1LL;
  if (__OFSUB__(*result, 1LL))
  {
    __break(1u);
  }

  else
  {
    unint64_t result = (void *)AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*(void *)v2 + 16LL));
    if (v4 < result)
    {
      *a2 = v4;
      return result;
    }
  }

  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance ArchiveHeader.EntryXATBlob( unint64_t *result)
{
  unint64_t v2 = *result - 1;
  if (__OFSUB__(*result, 1LL))
  {
    __break(1u);
  }

  else
  {
    uint64_t v3 = result;
    unint64_t result = (unint64_t *)AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*(void *)v1 + 16LL));
    if (v2 < result)
    {
      *uint64_t v3 = v2;
      return result;
    }
  }

  __break(1u);
  return result;
}

uint64_t base witness table accessor for Sequence in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob( &lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob,  (uint64_t)&protocol conformance descriptor for ArchiveHeader.EntryXATBlob);
}

uint64_t lazy protocol witness table accessor for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob( unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for ArchiveHeader.EntryXATBlob();
    uint64_t result = MEMORY[0x1895C97D4](a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader.EntryXATBlob> and conformance Slice<A>,  &demangling cache variable for type metadata for Slice<ArchiveHeader.EntryXATBlob>,  MEMORY[0x18961A5E8]);
}

uint64_t protocol witness for Collection.endIndex.getter in conformance ArchiveHeader.EntryXATBlob@<X0>( void *a1@<X8>)
{
  uint64_t result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*(void *)v1 + 16LL));
  *a1 = result;
  return result;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance ArchiveHeader.EntryXATBlob( void *a1, unint64_t *a2))()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader.EntryXATBlob;
}

uint64_t protocol witness for Collection.subscript.read in conformance ArchiveHeader.EntryXATBlob()
{
  return swift_release();
}

uint64_t protocol witness for Collection.subscript.getter in conformance ArchiveHeader.EntryXATBlob@<X0>( uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = *v2;
  uint64_t result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v6 + 16));
  if (v4 < 0)
  {
    __break(1u);
  }

  else if (v5 <= result)
  {
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v6;
    return swift_retain();
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.indices.getter in conformance ArchiveHeader.EntryXATBlob@<X0>( void *a1@<X8>)
{
  uint64_t result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*(void *)v1 + 16LL));
  *a1 = 0LL;
  a1[1] = result;
  return result;
}

void *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance ArchiveHeader.EntryXATBlob@<X0>( void *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }

  else
  {
    uint64_t result = (void *)AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*(void *)v3 + 16LL));
    if (v5 <= result)
    {
      *a3 = v5;
      return result;
    }
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance ArchiveHeader.EntryXATBlob@<X0>( unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(void *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

unint64_t protocol witness for RandomAccessCollection.distance(from:to:) in conformance ArchiveHeader.EntryXATBlob( unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  unint64_t v5 = *(AAEntryXATBlob_impl **)(*(void *)v2 + 16LL);
  unint64_t result = AAEntryXATBlobGetEntryCount(v5);
  if (v3 > result)
  {
    __break(1u);
  }

  else
  {
    unint64_t result = AAEntryXATBlobGetEntryCount(v5);
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.index(after:) in conformance ArchiveHeader.EntryXATBlob@<X0>( unint64_t *a1@<X0>, void *a2@<X8>)
{
  unint64_t v4 = *a1;
  uint64_t result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*(void *)v2 + 16LL));
  if (v4 >= result)
  {
    __break(1u);
  }

  else if (!__OFADD__(v4, 1LL))
  {
    *a2 = v4 + 1;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.formIndex(after:) in conformance ArchiveHeader.EntryXATBlob( unint64_t *a1)
{
  uint64_t v3 = *v1;
  unint64_t v4 = *a1;
  uint64_t result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v3 + 16));
  if (v4 >= result)
  {
    __break(1u);
  }

  else if (!__OFADD__(v4, 1LL))
  {
    *a1 = v4 + 1;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>( &lazy protocol witness table cache variable for type IndexingIterator<ArchiveHeader.EntryXATBlob> and conformance IndexingIterator<A>,  &demangling cache variable for type metadata for IndexingIterator<ArchiveHeader.EntryXATBlob>,  MEMORY[0x189619678]);
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance ArchiveHeader.EntryXATBlob( uint64_t a1)
{
  return Collection.underestimatedCount.getter();
}

void *protocol witness for Sequence._copyToContiguousArray() in conformance ArchiveHeader.EntryXATBlob()
{
  uint64_t v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_release();
  return v1;
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance ArchiveHeader.EntryXATBlob( void *a1, uint64_t a2, unint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance ArchiveHeader.EntryXATBlob()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

double sub_18861FDF0@<D0>(unint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a2 = v4;
  double result = *(double *)&v5;
  *(_OWORD *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_18861FE38()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for _AAEntryXATBlobTraits()
{
  return &type metadata for _AAEntryXATBlobTraits;
}

uint64_t method lookup function for ArchiveHeader.EntryXATBlob()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveHeader.EntryXATBlob.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryXATBlob.__allocating_init(directory:path:flags:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryXATBlob.apply(directory:path:flags:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryXATBlob.__allocating_init(withAAEncodedData:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryXATBlob.withAAEncodedData<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176LL))();
}

uint64_t destroy for ArchiveHeader.EntryXATBlob.ExtendedAttribute()
{
  return swift_release();
}

void *initializeBufferWithCopyOfBuffer for ArchiveHeader.EntryXATBlob.ExtendedAttribute( void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ArchiveHeader.EntryXATBlob.ExtendedAttribute(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ArchiveHeader.EntryXATBlob.ExtendedAttribute(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArchiveHeader.EntryXATBlob.ExtendedAttribute(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ArchiveHeader.EntryXATBlob.ExtendedAttribute( uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
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

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ArchiveHeader.EntryXATBlob.ExtendedAttribute()
{
  return &type metadata for ArchiveHeader.EntryXATBlob.ExtendedAttribute;
}

uint64_t specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)( uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, int64_t a5, uint64_t a6)
{
  uint64_t v10 = *a1;
  uint64_t result = AAHeaderGetFieldCount(*(AAHeader *)(*a1 + 16));
  if (a2 < 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  if (result < a3)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }

    if (a2 >= a3)
    {
LABEL_25:
      __break(1u);
      return result;
    }

    header = *(AAHeader_impl **)(a6 + 16);
    while ((uint64_t)a4 < a5)
    {
      ArchiveHeader._field(at:)(a4, (uint64_t)v19);
      uint64_t v12 = v19[0];
      uint64_t v13 = v19[1];
      uint64_t v14 = v19[2];
      char v15 = v20;
      ArchiveHeader._set(at:field:)(a2, (uint64_t)v19);
      outlined consume of ArchiveHeader.Field(v12, v13, v14, v15);
      uint64_t result = AAHeaderGetFieldCount(*(AAHeader *)(v10 + 16));
      uint64_t result = AAHeaderGetFieldCount(header);
      unint64_t v16 = a4 + 1;
      if (__OFADD__(a4, 1LL)) {
        goto LABEL_20;
      }
      if (a3 == ++a2) {
        goto LABEL_14;
      }
      ++a4;
      if (v16 == a5)
      {
        __break(1u);
LABEL_14:
        a4 = v16;
        goto LABEL_15;
      }
    }

    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

{
  AAEntryXATBlob_impl *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void v18[3];
  uint64_t v17 = *a1;
  unint64_t v11 = *(AAEntryXATBlob_impl **)(*a1 + 16);
  uint64_t result = AAEntryXATBlobGetEntryCount(v11);
  if (a2 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  if (result >= a3)
  {
    if (a2 == a3)
    {
LABEL_18:
      if (a4 == a5) {
        return result;
      }
      goto LABEL_27;
    }

    if (a4 == a5) {
      goto LABEL_28;
    }
    if (a2 <= 0x100000000LL) {
      uint64_t v13 = 0x100000000LL;
    }
    else {
      uint64_t v13 = a2;
    }
    while ((uint64_t)a4 < a5)
    {
      ArchiveHeader.EntryXATBlob._attribute(at:)(a4, v18);
      uint64_t v14 = v18[2];
      char v15 = String.utf8CString.getter();
      if (v13 == a2) {
        goto LABEL_21;
      }
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      unint64_t v11 = *(AAEntryXATBlob_impl **)(v17 + 16);
      if (a2 >= AAEntryXATBlobGetEntryCount(v11)) {
        goto LABEL_22;
      }
      uint64_t result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(a6 + 16));
      unint64_t v16 = a4 + 1;
      if (__OFADD__(a4, 1LL)) {
        goto LABEL_24;
      }
      if (a3 == ++a2) {
        goto LABEL_17;
      }
      ++a4;
      if (v16 == a5)
      {
        __break(1u);
LABEL_17:
        a4 = v16;
        goto LABEL_18;
      }
    }

    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t specialized MutableCollection<>._partitionImpl(by:)( uint64_t (*a1)(uint64_t *), uint64_t a2)
{
  uint64_t v29 = a2;
  uint64_t v4 = *v2;
  uint32_t FieldCount = AAHeaderGetFieldCount(*(AAHeader *)(*v2 + 16));
  if (!FieldCount) {
    return 0LL;
  }
  unint64_t v6 = 0LL;
  int64_t v7 = FieldCount;
LABEL_3:
  do
  {
    ArchiveHeader._field(at:)(v6, (uint64_t)&v25);
    uint64_t v9 = v25;
    uint64_t v8 = v26;
    uint64_t v10 = v27;
    uint64_t v21 = v25;
    uint64_t v22 = v26;
    uint64_t v23 = v27;
    char v11 = v28;
    char v24 = v28;
    char v12 = a1(&v21);
    outlined consume of ArchiveHeader.Field(v9, v8, v10, v11);
    if (v3) {
      break;
    }
    if ((v12 & 1) != 0)
    {
      --v7;
      unint64_t result = AAHeaderGetFieldCount(*(AAHeader *)(v4 + 16));
      if (v7 >= (unint64_t)result)
      {
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
        return result;
      }

      while ((uint64_t)v6 < v7)
      {
        ArchiveHeader._field(at:)(v7, (uint64_t)&v25);
        uint64_t v14 = v25;
        uint64_t v15 = v26;
        uint64_t v16 = v27;
        uint64_t v21 = v25;
        uint64_t v22 = v26;
        uint64_t v23 = v27;
        char v17 = v28;
        char v24 = v28;
        char v18 = a1(&v21);
        outlined consume of ArchiveHeader.Field(v14, v15, v16, v17);
        if ((v18 & 1) == 0)
        {
          specialized MutableCollection.swapAt(_:_:)(v6, v7);
          unint64_t result = AAHeaderGetFieldCount(*(AAHeader *)(v4 + 16));
          return v6;
        }

        --v7;
        unint64_t result = AAHeaderGetFieldCount(*(AAHeader *)(v4 + 16));
        if (v7 >= (unint64_t)result)
        {
          __break(1u);
          goto LABEL_20;
        }
      }

      return v6;
    }

    unint64_t result = AAHeaderGetFieldCount(*(AAHeader *)(v4 + 16));
    if (__OFADD__(v6++, 1LL)) {
      goto LABEL_22;
    }
  }

  while ((uint64_t)v6 < v7);
  return v6;
}

unint64_t specialized MutableCollection<>._partitionImpl(by:)(uint64_t (*a1)(uint64_t *))
{
  uint64_t v4 = *v1;
  uint32_t EntryCount = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*v1 + 16));
  if (!EntryCount) {
    return 0LL;
  }
  char v18 = v1;
  unint64_t v6 = 0LL;
  int64_t v7 = EntryCount;
LABEL_3:
  do
  {
    ArchiveHeader.EntryXATBlob._attribute(at:)(v6, &v15);
    uint64_t v12 = v15;
    uint64_t v13 = v16;
    uint64_t v14 = v17;
    char v8 = a1(&v12);
    swift_release();
    swift_bridgeObjectRelease();
    if (v2) {
      break;
    }
    if ((v8 & 1) != 0)
    {
      --v7;
      unint64_t result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v4 + 16));
      if (v7 >= (unint64_t)result)
      {
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
        return result;
      }

      while ((uint64_t)v6 < v7)
      {
        ArchiveHeader.EntryXATBlob._attribute(at:)(v7, &v15);
        uint64_t v12 = v15;
        uint64_t v13 = v16;
        uint64_t v14 = v17;
        char v10 = a1(&v12);
        swift_release();
        swift_bridgeObjectRelease();
        if ((v10 & 1) == 0)
        {
          specialized MutableCollection.swapAt(_:_:)(v6, v7);
          unint64_t result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v4 + 16));
          return v6;
        }

        --v7;
        unint64_t result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v4 + 16));
        if (v7 >= (unint64_t)result)
        {
          __break(1u);
          goto LABEL_20;
        }
      }

      return v6;
    }

    unint64_t result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v4 + 16));
    if (__OFADD__(v6++, 1LL)) {
      goto LABEL_22;
    }
  }

  while ((uint64_t)v6 < v7);
  return v6;
}

uint64_t partial apply for closure #1 in closure #1 in ArchiveHeader.EntryXATBlob.apply(directory:path:flags:)@<X0>( char *path@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = AAEntryXATBlobApplyToPath( *(AAEntryXATBlob *)(*(void *)(v2 + 16) + 16LL),  *(const char **)(v2 + 24),  path,  *(void *)(v2 + 32));
  *a2 = result;
  return result;
}

AAEntryXATBlob partial apply for closure #1 in closure #1 in ArchiveHeader.EntryXATBlob.init(directory:path:flags:)@<X0>( char *path@<X0>, AAEntryXATBlob *a2@<X8>)
{
  AAEntryXATBlob result = AAEntryXATBlobCreateWithPath(*(const char **)(v2 + 16), path, *(void *)(v2 + 24));
  *a2 = result;
  return result;
}

uint64_t protocol witness for static _AAObjectTraits.aaDestroy(_:) in conformance _AAByteStreamTraits( AAByteStream *a1)
{
  return AAByteStreamClose(*a1);
}

uint64_t ArchiveByteStream.read(into:)(uint64_t a1, uint64_t a2)
{
  return ArchiveByteStream.read(into:)(a1, a2, MEMORY[0x1896130D8]);
}

uint64_t ArchiveByteStream.read(into:atOffset:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveByteStream.read(into:atOffset:)(a1, a2, a3, MEMORY[0x1896130B8]);
}

uint64_t ArchiveByteStream.write(from:)(uint64_t a1, uint64_t a2)
{
  return ArchiveByteStream.read(into:)(a1, a2, MEMORY[0x1896130F0]);
}

uint64_t ArchiveByteStream.read(into:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = *(void *)(v3 + 16);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }

  if (!a1)
  {
LABEL_7:
    __break(1u);
    return result;
  }

  uint64_t v7 = a3();
  if (v7 < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *char v8 = 0;
    swift_willThrow();
  }

  return v7;
}

uint64_t ArchiveByteStream.write(from:atOffset:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveByteStream.read(into:atOffset:)(a1, a2, a3, MEMORY[0x1896130C0]);
}

uint64_t ArchiveByteStream.read(into:atOffset:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v6 = result;
  swift_beginAccess();
  uint64_t result = *(void *)(v4 + 16);
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  if (!v6)
  {
LABEL_9:
    __break(1u);
    return result;
  }

  uint64_t v7 = a4();
  if (v7 < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *char v8 = 0;
    swift_willThrow();
  }

  return v7;
}

AAByteStream_impl *ArchiveByteStream.seek(toOffset:relativeTo:)(off_t a1, int a2)
{
  uint64_t result = *(AAByteStream_impl **)(v2 + 16);
  if (result)
  {
    off_t v6 = AAByteStreamSeek(result, a1, a2);
    if (v6 < 0)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *uint64_t v7 = 0;
      swift_willThrow();
    }

    return (AAByteStream_impl *)v6;
  }

  else
  {
    __break(1u);
  }

  return result;
}

Swift::Void __swiftcall ArchiveByteStream.cancel()()
{
  uint64_t v1 = *(AAByteStream_impl **)(v0 + 16);
  if (v1) {
    AAByteStreamCancel(v1);
  }
  else {
    __break(1u);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ArchiveByteStream.close()()
{
  uint64_t v1 = *(AAByteStream_impl **)(v0 + 16);
  if (v1)
  {
    int v2 = AAByteStreamClose(v1);
    *(void *)(v0 + 16) = 0LL;
    if (v2)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *uint64_t v3 = 0;
      swift_willThrow();
    }
  }

uint64_t ArchiveByteStream.__allocating_init(object:owned:)(uint64_t a1, char a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v4 + 16) = a1;
  *(_BYTE *)(v4 + 24) = a2;
  return v4;
}

uint64_t ArchiveByteStream.init(object:owned:)(uint64_t a1, char a2)
{
  *(void *)(v2 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(_BYTE *)(v2 + 24) = a2;
  return v2;
}

uint64_t ArchiveByteStream.deinit()
{
  if (*(_BYTE *)(v0 + 24) == 1)
  {
    swift_beginAccess();
    AAByteStreamClose(*(AAByteStream *)(v0 + 16));
    *(void *)(v0 + 16) = 0LL;
  }

  return v0;
}

uint64_t ArchiveByteStream.__deallocating_deinit()
{
  if (*(_BYTE *)(v0 + 24) == 1)
  {
    swift_beginAccess();
    AAByteStreamClose(*(AAByteStream *)(v0 + 16));
  }

  return swift_deallocClassInstance();
}

uint64_t vtable thunk for _AAOptionalObjectWrapper.__allocating_init(object:owned:) dispatching to ArchiveByteStream.__allocating_init(object:owned:)( uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  type metadata accessor for ArchiveByteStream();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v4 + 16) = v3;
  *(_BYTE *)(v4 + 24) = a2;
  return v4;
}

uint64_t protocol witness for ArchiveByteStreamProtocol.read(into:) in conformance ArchiveByteStream( uint64_t a1, uint64_t a2)
{
  return ArchiveByteStream.read(into:)(a1, a2);
}

uint64_t protocol witness for ArchiveByteStreamProtocol.read(into:atOffset:) in conformance ArchiveByteStream( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveByteStream.read(into:atOffset:)(a1, a2, a3);
}

uint64_t protocol witness for ArchiveByteStreamProtocol.write(from:) in conformance ArchiveByteStream( uint64_t a1, uint64_t a2)
{
  return ArchiveByteStream.write(from:)(a1, a2);
}

uint64_t protocol witness for ArchiveByteStreamProtocol.write(from:atOffset:) in conformance ArchiveByteStream( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveByteStream.write(from:atOffset:)(a1, a2, a3);
}

AAByteStream_impl *protocol witness for ArchiveByteStreamProtocol.seek(toOffset:relativeTo:) in conformance ArchiveByteStream( off_t a1, int a2)
{
  uint64_t v5 = *v2;
  swift_beginAccess();
  uint64_t result = *(AAByteStream_impl **)(v5 + 16);
  if (result)
  {
    off_t v7 = AAByteStreamSeek(result, a1, a2);
    if (v7 < 0)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *char v8 = 0;
      swift_willThrow();
    }

    return (AAByteStream_impl *)v7;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void protocol witness for ArchiveByteStreamProtocol.cancel() in conformance ArchiveByteStream()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = *(AAByteStream_impl **)(v1 + 16);
  if (v2) {
    AAByteStreamCancel(v2);
  }
  else {
    __break(1u);
  }
}

void protocol witness for ArchiveByteStreamProtocol.close() in conformance ArchiveByteStream()
{
}

uint64_t static ArchiveByteStream.fileStream(path:mode:options:permissions:)()
{
  if (!v2) {
    return 0LL;
  }
  type metadata accessor for ArchiveByteStream();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v0 + 16) = v2;
  *(_BYTE *)(v0 + 24) = 1;
  return v0;
}

AAByteStream closure #1 in static ArchiveByteStream.fileStream(path:mode:options:permissions:)@<X0>( const char *a1@<X0>, int a2@<W1>, mode_t a3@<W2>, AAByteStream *a4@<X8>)
{
  AAByteStream result = AAFileStreamOpenWithPath(a1, a2, a3);
  *a4 = result;
  return result;
}

AAByteStream partial apply for closure #1 in static ArchiveByteStream.fileStream(path:mode:options:permissions:)@<X0>( const char *a1@<X0>, AAByteStream *a2@<X8>)
{
  AAByteStream result = AAFileStreamOpenWithPath(a1, *(_DWORD *)(v2 + 16), *(_WORD *)(v2 + 20));
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for ArchiveByteStream()
{
  uint64_t result = type metadata singleton initialization cache for ArchiveByteStream;
  if (!type metadata singleton initialization cache for ArchiveByteStream) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t static ArchiveByteStream.fileStream(fd:automaticClose:)(int a1, char a2)
{
  AAByteStream v2 = AAFileStreamOpenWithFD(a1, a2 & 1);
  if (!v2) {
    return 0LL;
  }
  AAByteStream v3 = v2;
  type metadata accessor for ArchiveByteStream();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v4 + 16) = v3;
  *(_BYTE *)(v4 + 24) = 1;
  return v4;
}

uint64_t static ArchiveByteStream.temporaryFileStream()()
{
  AAByteStream v0 = AATempFileStreamOpen();
  if (!v0) {
    return 0LL;
  }
  AAByteStream v1 = v0;
  type metadata accessor for ArchiveByteStream();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 24) = 1;
  return v2;
}

AAByteStream_impl *static ArchiveByteStream.compressionStream(using:writingTo:blockSize:flags:threadCount:)( AACompressionAlgorithm *a1, uint64_t a2, size_t a3, AAFlagSet *a4, uint64_t a5)
{
  AACompressionAlgorithm v8 = *a1;
  AAFlagSet v9 = *a4;
  swift_beginAccess();
  uint64_t result = *(AAByteStream_impl **)(a2 + 16);
  if (!result) {
    goto LABEL_10;
  }
  if (a5 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (a5 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }

  AAByteStream v11 = AACompressionOutputStreamOpen(result, v8, a3, v9, a5);
  if (!v11) {
    return 0LL;
  }
  AAByteStream v12 = v11;
  type metadata accessor for ArchiveByteStream();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v13 + 16) = v12;
  *(_BYTE *)(v13 + 24) = 1;
  return (AAByteStream_impl *)v13;
}

uint64_t static ArchiveByteStream.compressionStream(appendingTo:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static ArchiveByteStream.compressionStream(appendingTo:flags:threadCount:)(a1, a2, a3, MEMORY[0x189613108]);
}

uint64_t static ArchiveByteStream.decompressionStream(readingFrom:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static ArchiveByteStream.compressionStream(appendingTo:flags:threadCount:)(a1, a2, a3, MEMORY[0x1896131C8]);
}

uint64_t static ArchiveByteStream.compressionStream(appendingTo:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = *(void *)(a1 + 16);
  if (!result) {
    goto LABEL_10;
  }
  if (a3 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (a3 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v8 = a4();
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = v8;
  type metadata accessor for ArchiveByteStream();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v10 + 16) = v9;
  *(_BYTE *)(v10 + 24) = 1;
  return v10;
}

uint64_t static ArchiveByteStream.sharedBufferPipe(capacity:)(uint64_t result)
{
  if (result < 1)
  {
    __break(1u);
  }

  else
  {
    size_t v1 = result;
    uint64_t v2 = (AAByteStream *)swift_slowAlloc();
    if (AASharedBufferPipeOpen(v2, v2 + 1, v1)) {
      return 0LL;
    }
    AAByteStream v4 = *v2;
    type metadata accessor for ArchiveByteStream();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = 0LL;
    swift_beginAccess();
    *(void *)(v3 + 16) = v4;
    *(_BYTE *)(v3 + 24) = 1;
    AAByteStream v5 = v2[1];
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = 0LL;
    swift_beginAccess();
    *(void *)(v6 + 16) = v5;
    *(_BYTE *)(v6 + 24) = 1;
    MEMORY[0x1895C984C](v2, -1LL, -1LL);
    return v3;
  }

  return result;
}

uint64_t static ArchiveByteStream.process(readingFrom:writingTo:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_beginAccess();
  AAByteStream v5 = *(AAByteStream_impl **)(a1 + 16);
  if (!v5)
  {
    __break(1u);
    goto LABEL_7;
  }

  uint64_t result = swift_beginAccess();
  uint64_t v6 = *(AAByteStream_impl **)(a2 + 16);
  if (!v6)
  {
LABEL_7:
    __break(1u);
    return result;
  }

  off_t v7 = AAByteStreamProcess(v5, v6);
  if (v7 < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *uint64_t v8 = 0;
    swift_willThrow();
  }

  return v7;
}

AAByteStream_impl *specialized static ArchiveByteStream.randomAccessDecompressionStream(readingFrom:allocationLimit:flags:threadCount:)( AAByteStream_impl *result, int64_t a2, AAFlagSet *a3, uint64_t a4)
{
  if (a2 < -1) {
    goto LABEL_11;
  }
  uint64_t v6 = result;
  AAFlagSet v7 = *a3;
  swift_beginAccess();
  uint64_t result = (AAByteStream_impl *)*((void *)v6 + 2);
  if (!result)
  {
LABEL_12:
    __break(1u);
    return result;
  }

  if (a4 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_10;
  }

  if (a4 > 0x7FFFFFFF)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  AAByteStream v8 = AADecompressionRandomAccessInputStreamOpen(result, a2, v7, a4);
  if (!v8) {
    return 0LL;
  }
  AAByteStream v9 = v8;
  type metadata accessor for ArchiveByteStream();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v10 + 16) = v9;
  *(_BYTE *)(v10 + 24) = 1;
  return (AAByteStream_impl *)v10;
}

ValueMetadata *type metadata accessor for _AAByteStreamTraits()
{
  return &type metadata for _AAByteStreamTraits;
}

uint64_t type metadata completion function for ArchiveByteStream()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ArchiveByteStream()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveByteStream.read(into:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144LL))();
}

uint64_t dispatch thunk of ArchiveByteStream.read(into:atOffset:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152LL))();
}

uint64_t dispatch thunk of ArchiveByteStream.write(from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160LL))();
}

uint64_t dispatch thunk of ArchiveByteStream.write(from:atOffset:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168LL))();
}

uint64_t dispatch thunk of ArchiveByteStream.seek(toOffset:relativeTo:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176LL))();
}

uint64_t dispatch thunk of ArchiveByteStream.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184LL))();
}

uint64_t dispatch thunk of ArchiveByteStream.close()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192LL))();
}

void static ArchiveHeader.FieldType.flag.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveHeader.FieldType.uint.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ArchiveHeader.FieldType.string.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void static ArchiveHeader.FieldType.hash.getter(_DWORD *a1@<X8>)
{
  *a1 = 3;
}

void static ArchiveHeader.FieldType.timespec.getter(_DWORD *a1@<X8>)
{
  *a1 = 4;
}

void static ArchiveHeader.FieldType.blob.getter(_DWORD *a1@<X8>)
{
  *a1 = 5;
}

uint64_t ArchiveHeader.FieldType.rawValue.getter()
{
  return *v0;
}

uint64_t ArchiveHeader.FieldType.rawValue.setter(uint64_t result)
{
  *size_t v1 = result;
  return result;
}

uint64_t (*ArchiveHeader.FieldType.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveHeader.FieldType.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t ArchiveHeader.FieldType.description.getter()
{
  uint64_t result = 1734437990LL;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 1953393013LL;
      break;
    case 2:
      uint64_t result = 0x676E69727473LL;
      break;
    case 3:
      uint64_t result = 1752392040LL;
      break;
    case 4:
      uint64_t result = 0x63657073656D6974LL;
      break;
    case 5:
      uint64_t result = 1651469410LL;
      break;
    default:
      uint64_t result = 4144959LL;
      break;
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader.FieldType and conformance ArchiveHeader.FieldType()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader.FieldType and conformance ArchiveHeader.FieldType;
  if (!lazy protocol witness table cache variable for type ArchiveHeader.FieldType and conformance ArchiveHeader.FieldType)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader.FieldType,  &type metadata for ArchiveHeader.FieldType);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader.FieldType and conformance ArchiveHeader.FieldType);
  }

  return result;
}

ValueMetadata *type metadata accessor for ArchiveHeader.FieldType()
{
  return &type metadata for ArchiveHeader.FieldType;
}

uint64_t _AAObjectWrapper.init(object:owned:)(uint64_t a1, char a2)
{
  uint64_t v5 = v2 + *(void *)(*(void *)v2 + 96LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32LL))( v5,  a1,  AssociatedTypeWitness);
  *(_BYTE *)(v2 + *(void *)(*(void *)v2 + 104LL)) = a2;
  return v2;
}

char *_AAObjectWrapper.deinit()
{
  size_t v1 = v0;
  uint64_t v2 = *(void **)v0;
  uint64_t v3 = *(void *)(*(void *)v0 + 80LL);
  uint64_t v4 = v2[11];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858]();
  AAByteStream v9 = (char *)&v12 - v8;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  if ((v1[v2[13]] & 1) != 0)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v9, &v1[v2[12]], AssociatedTypeWitness);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v9, 0LL, 1LL, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v3, v4);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v2 = *(void **)v1;
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(&v1[v2[12]], AssociatedTypeWitness);
  return v1;
}

uint64_t _AAOptionalObjectWrapper.init(object:owned:)(uint64_t a1, char a2)
{
  uint64_t v5 = v2 + *(void *)(*(void *)v2 + 96LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v5,  1LL,  1LL,  AssociatedTypeWitness);
  swift_beginAccess();
  uint64_t v7 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40LL))(v5, a1, v7);
  swift_endAccess();
  *(_BYTE *)(v2 + *(void *)(*(void *)v2 + 104LL)) = a2;
  return v2;
}

void *_AAOptionalObjectWrapper.deinit()
{
  size_t v1 = v0;
  uint64_t v2 = (void *)*v0;
  uint64_t v3 = *(void *)(*v0 + 80LL);
  uint64_t v4 = v2[11];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858]();
  AAByteStream v9 = &v13[-v8];
  if ((*((_BYTE *)v1 + v2[13]) & 1) != 0)
  {
    uint64_t v10 = (char *)v1 + v2[12];
    swift_beginAccess();
    (*(void (**)(_BYTE *, char *, uint64_t))(v7 + 16))(v9, v10, v6);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v9, v3, v4);
    AAByteStream v11 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v11(v9, v6);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v9,  1LL,  1LL,  AssociatedTypeWitness);
    swift_beginAccess();
    (*(void (**)(char *, _BYTE *, uint64_t))(v7 + 40))(v10, v9, v6);
    swift_endAccess();
    uint64_t v2 = (void *)*v1;
  }

  else
  {
    AAByteStream v11 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
  }

  v11((_BYTE *)v1 + v2[12], v6);
  return v1;
}

uint64_t _AAObjectWrapper.__allocating_init(object:owned:)(uint64_t a1, uint64_t a2)
{
  return _AAObjectWrapper.__allocating_init(object:owned:)( a1,  a2,  (void (*)(uint64_t, uint64_t))_AAObjectWrapper.init(object:owned:));
}

uint64_t _AAObjectWrapper.__deallocating_deinit()
{
  return _AAObjectWrapper.__deallocating_deinit((void (*)(void))_AAObjectWrapper.deinit);
}

uint64_t _AAOptionalObjectWrapper.__allocating_init(object:owned:)(uint64_t a1, uint64_t a2)
{
  return _AAObjectWrapper.__allocating_init(object:owned:)( a1,  a2,  (void (*)(uint64_t, uint64_t))_AAOptionalObjectWrapper.init(object:owned:));
}

uint64_t _AAObjectWrapper.__allocating_init(object:owned:)( uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6 = swift_allocObject();
  a3(a1, a2);
  return v6;
}

uint64_t _AAOptionalObjectWrapper.__deallocating_deinit()
{
  return _AAObjectWrapper.__deallocating_deinit((void (*)(void))_AAOptionalObjectWrapper.deinit);
}

uint64_t _AAOptionalObjectWrapperWithFilter.__allocating_init(object:owned:messageProc:)( uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  _AAOptionalObjectWrapperWithFilter.init(object:owned:messageProc:)(a1, a2, a3);
  return v6;
}

uint64_t _AAOptionalObjectWrapperWithFilter.init(object:owned:messageProc:)(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v7 = v3 + *(void *)(*(void *)v3 + 96LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v7,  1LL,  1LL,  AssociatedTypeWitness);
  swift_beginAccess();
  uint64_t v9 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40LL))(v7, a1, v9);
  swift_endAccess();
  *(_BYTE *)(v3 + *(void *)(*(void *)v3 + 104LL)) = a2;
  *(void *)(v3 + *(void *)(*(void *)v3 + 112LL)) = a3;
  return v3;
}

void *_AAOptionalObjectWrapperWithFilter.deinit()
{
  size_t v1 = v0;
  uint64_t v2 = (void *)*v0;
  uint64_t v3 = *(void *)(*v0 + 80LL);
  uint64_t v4 = v2[11];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v9 = &v13[-v8];
  if ((*((_BYTE *)v1 + v2[13]) & 1) != 0)
  {
    uint64_t v10 = (char *)v1 + v2[12];
    swift_beginAccess();
    (*(void (**)(_BYTE *, char *, uint64_t))(v7 + 16))(v9, v10, v6);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v9, v3, v4);
    AAByteStream v11 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v11(v9, v6);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v9,  1LL,  1LL,  AssociatedTypeWitness);
    swift_beginAccess();
    (*(void (**)(char *, _BYTE *, uint64_t))(v7 + 40))(v10, v9, v6);
    swift_endAccess();
    uint64_t v2 = (void *)*v1;
  }

  else
  {
    AAByteStream v11 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
  }

  v11((_BYTE *)v1 + v2[12], v6);
  swift_release();
  return v1;
}

uint64_t _AAOptionalObjectWrapperWithFilter.__deallocating_deinit()
{
  return _AAObjectWrapper.__deallocating_deinit((void (*)(void))_AAOptionalObjectWrapperWithFilter.deinit);
}

uint64_t _AAObjectWrapper.__deallocating_deinit(void (*a1)(void))
{
  return swift_deallocClassInstance();
}

uint64_t dispatch thunk of _AAEncodableProtocol.init(withAAEncodedData:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of _AAEncodableProtocol.withAAEncodedData<A>(_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of static _AAObjectTraits.aaDestroy(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t type metadata completion function for _AAObjectWrapper()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for _AAObjectWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _AAObjectWrapper);
}

uint64_t method lookup function for _AAObjectWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _AAObjectWrapper.__allocating_init(object:owned:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata completion function for _AAOptionalObjectWrapper()
{
  uint64_t result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for _AAOptionalObjectWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for _AAOptionalObjectWrapper);
}

uint64_t method lookup function for _AAOptionalObjectWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata completion function for _AAOptionalObjectWrapperWithFilter()
{
  uint64_t result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for _AAOptionalObjectWrapperWithFilter( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for _AAOptionalObjectWrapperWithFilter);
}

uint64_t method lookup function for _AAOptionalObjectWrapperWithFilter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _AAOptionalObjectWrapperWithFilter.__allocating_init(object:owned:messageProc:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1895C97A4](a1, v6, a5);
}

void static ArchiveFlags.ignoreOperationNotPermitted.getter(void *a1@<X8>)
{
  *a1 = 1LL;
}

void static ArchiveFlags.archiveDeduplicateData.getter(void *a1@<X8>)
{
  *a1 = 2LL;
}

void static ArchiveFlags.replaceAttributes.getter(void *a1@<X8>)
{
  *a1 = 8LL;
}

void static ArchiveFlags.extractNoAutoDeduplicate.getter(void *a1@<X8>)
{
  *a1 = 16LL;
}

void static ArchiveFlags.extractNoAutoSparse.getter(void *a1@<X8>)
{
  *a1 = 32LL;
}

uint64_t static ArchiveFlags.verbosity(level:)@<X0>(uint64_t result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v2 = 0xC000000000000000LL;
  if (result == 2) {
    unint64_t v2 = 0x8000000000000000LL;
  }
  if (result == 1) {
    unint64_t v2 = 0x4000000000000000LL;
  }
  if (result <= 0) {
    unint64_t v2 = 0LL;
  }
  *a2 = v2;
  return result;
}

uint64_t ArchiveFlags.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t ArchiveFlags.rawValue.setter(uint64_t result)
{
  *unint64_t v1 = result;
  return result;
}

uint64_t (*ArchiveFlags.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

void ArchiveFlags.init()(void *a1@<X8>)
{
  *a1 = 0LL;
}

uint64_t ArchiveFlags.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveFlags and conformance ArchiveFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags;
  if (!lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags)
  {
    unint64_t result = MEMORY[0x1895C97D4](&protocol conformance descriptor for ArchiveFlags, &type metadata for ArchiveFlags);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags;
  if (!lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags)
  {
    unint64_t result = MEMORY[0x1895C97D4](&protocol conformance descriptor for ArchiveFlags, &type metadata for ArchiveFlags);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags;
  if (!lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags)
  {
    unint64_t result = MEMORY[0x1895C97D4](&protocol conformance descriptor for ArchiveFlags, &type metadata for ArchiveFlags);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags;
  if (!lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags)
  {
    unint64_t result = MEMORY[0x1895C97D4](&protocol conformance descriptor for ArchiveFlags, &type metadata for ArchiveFlags);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags);
  }

  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ArchiveFlags()
{
  Swift::UInt64 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ArchiveFlags()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ArchiveFlags()
{
  Swift::UInt64 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void *protocol witness for OptionSet.init(rawValue:) in conformance ArchiveFlags@<X0>( void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ArchiveFlags( void *a1, void *a2)
{
  return *a1 == *a2;
}

void *protocol witness for SetAlgebra.union(_:) in conformance ArchiveFlags@<X0>( void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *protocol witness for SetAlgebra.intersection(_:) in conformance ArchiveFlags@<X0>( void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance ArchiveFlags@<X0>( void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance ArchiveFlags(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *protocol witness for SetAlgebra.remove(_:) in conformance ArchiveFlags@<X0>( void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance ArchiveFlags@<X0>( uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

void *protocol witness for SetAlgebra.formUnion(_:) in conformance ArchiveFlags(void *result)
{
  *v1 |= *result;
  return result;
}

void *protocol witness for SetAlgebra.formIntersection(_:) in conformance ArchiveFlags(void *result)
{
  *v1 &= *result;
  return result;
}

void *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance ArchiveFlags( void *result)
{
  *v1 ^= *result;
  return result;
}

void *protocol witness for SetAlgebra.subtracting(_:) in conformance ArchiveFlags@<X0>( void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance ArchiveFlags(void *a1)
{
  return (*v1 & ~*a1) == 0LL;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance ArchiveFlags(void *a1)
{
  return (*v1 & *a1) == 0LL;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance ArchiveFlags(void *a1)
{
  return (*a1 & ~*v1) == 0LL;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance ArchiveFlags()
{
  return *v0 == 0LL;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance ArchiveFlags()
{
  return SetAlgebra.init<A>(_:)();
}

void *protocol witness for SetAlgebra.subtract(_:) in conformance ArchiveFlags(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance ArchiveFlags@<X0>( void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ArchiveFlags(void *a1@<X8>)
{
  *a1 = *v1;
}

ValueMetadata *type metadata accessor for ArchiveFlags()
{
  return &type metadata for ArchiveFlags;
}

uint64_t static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  return specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)( a1,  a2,  a3,  a4,  a5,  MEMORY[0x1896131D8]);
}

uint64_t static ArchiveStream.decodeStream(readingFrom:selectUsing:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  return specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)( a1,  a2,  a3,  a4,  a5,  MEMORY[0x1896131C0]);
}

uint64_t protocol witness for static _AAObjectTraits.aaDestroy(_:) in conformance _AAArchiveStreamTraits( AAArchiveStream *a1)
{
  return AAArchiveStreamClose(*a1);
}

uint64_t ArchiveStream.writeHeader(_:)(uint64_t a1)
{
  uint64_t result = *(void *)(v1 + 16);
  if (result)
  {
    uint64_t result = AAArchiveStreamWriteHeader((AAArchiveStream)result, *(AAHeader *)(a1 + 16));
    if ((_DWORD)result)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *uint64_t v4 = 0;
      return swift_willThrow();
    }
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t ArchiveStream.writeBlob(key:from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveStream.writeBlob(key:from:)(a1, a2, a3, MEMORY[0x189613078]);
}

uint64_t ArchiveStream.readHeader()()
{
  header[1] = *(AAHeader *)MEMORY[0x1895F89C0];
  header[0] = 0LL;
  swift_beginAccess();
  uint64_t v1 = *(AAArchiveStream_impl **)(v0 + 16);
  if (!v1) {
    __break(1u);
  }
  int v2 = AAArchiveStreamReadHeader(v1, header);
  if (v2 < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    _BYTE *v5 = 0;
    return swift_willThrow();
  }

  AAHeader v3 = header[0];
  if (v2)
  {
    if (header[0])
    {
      type metadata accessor for ArchiveHeader();
      uint64_t result = swift_allocObject();
      *(void *)(result + 16) = v3;
      *(_BYTE *)(result + 24) = 1;
      return result;
    }
  }

  else if (!header[0])
  {
    return 0LL;
  }

  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t ArchiveStream.readBlob(key:into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveStream.writeBlob(key:from:)(a1, a2, a3, MEMORY[0x189613068]);
}

uint64_t ArchiveStream.writeBlob(key:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = *(void *)(v4 + 16);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }

  if (!a2)
  {
LABEL_7:
    __break(1u);
    return result;
  }

  uint64_t result = a4();
  if ((_DWORD)result)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *uint64_t v8 = 0;
    return swift_willThrow();
  }

  return result;
}

Swift::Void __swiftcall ArchiveStream.cancel()()
{
  uint64_t v1 = *(AAArchiveStream_impl **)(v0 + 16);
  if (v1) {
    AAArchiveStreamCancel(v1);
  }
  else {
    __break(1u);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ArchiveStream.close()()
{
  uint64_t v1 = *(AAArchiveStream_impl **)(v0 + 16);
  if (v1)
  {
    int v2 = AAArchiveStreamClose(v1);
    *(void *)(v0 + 16) = 0LL;
    if (v2)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *AAHeader v3 = 0;
      swift_willThrow();
    }
  }

uint64_t ArchiveStream.__allocating_init(object:owned:messageProc:)(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v6 + 16) = a1;
  *(_BYTE *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a3;
  return v6;
}

uint64_t ArchiveStream.init(object:owned:messageProc:)(uint64_t a1, char a2, uint64_t a3)
{
  *(void *)(v3 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v3 + 16) = a1;
  *(_BYTE *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = a3;
  return v3;
}

uint64_t ArchiveStream.deinit()
{
  if (*(_BYTE *)(v0 + 24) == 1)
  {
    swift_beginAccess();
    AAArchiveStreamClose(*(AAArchiveStream *)(v0 + 16));
    *(void *)(v0 + 16) = 0LL;
  }

  swift_release();
  return v0;
}

uint64_t ArchiveStream.__deallocating_deinit()
{
  if (*(_BYTE *)(v0 + 24) == 1)
  {
    swift_beginAccess();
    AAArchiveStreamClose(*(AAArchiveStream *)(v0 + 16));
    *(void *)(v0 + 16) = 0LL;
  }

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t vtable thunk for _AAOptionalObjectWrapperWithFilter.__allocating_init(object:owned:messageProc:) dispatching to ArchiveStream.__allocating_init(object:owned:messageProc:)( uint64_t *a1, char a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  type metadata accessor for ArchiveStream();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v6 + 16) = v5;
  *(_BYTE *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a3;
  return v6;
}

uint64_t protocol witness for ArchiveStreamProtocol.writeHeader(_:) in conformance ArchiveStream(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  uint64_t result = *(void *)(v3 + 16);
  if (result)
  {
    uint64_t result = AAArchiveStreamWriteHeader((AAArchiveStream)result, *(AAHeader *)(a1 + 16));
    if ((_DWORD)result)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      _BYTE *v5 = 0;
      return swift_willThrow();
    }
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t protocol witness for ArchiveStreamProtocol.writeBlob(key:from:) in conformance ArchiveStream( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveStream.writeBlob(key:from:)(a1, a2, a3);
}

uint64_t protocol witness for ArchiveStreamProtocol.readHeader() in conformance ArchiveStream()
{
  return ArchiveStream.readHeader()();
}

uint64_t protocol witness for ArchiveStreamProtocol.readBlob(key:into:) in conformance ArchiveStream( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveStream.readBlob(key:into:)(a1, a2, a3);
}

void protocol witness for ArchiveStreamProtocol.cancel() in conformance ArchiveStream()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  int v2 = *(AAArchiveStream_impl **)(v1 + 16);
  if (v2) {
    AAArchiveStreamCancel(v2);
  }
  else {
    __break(1u);
  }
}

void protocol witness for ArchiveStreamProtocol.close() in conformance ArchiveStream()
{
}

uint64_t ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a4;
  uint64_t v8[3] = a5;
  uint64_t v9 = @objc closure #1 in ArchiveHeader._EntryFilterWrapper.init(_:);
  if (!a4) {
    uint64_t v9 = 0LL;
  }
  _BYTE v8[4] = v9;
  uint64_t v10 = type metadata accessor for FilePath();
  (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48LL))(a2, 1LL, v10);
  ((void (*)(void))MEMORY[0x1895F8858])();
  outlined copy of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(a4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
  uint64_t v11 = FilePath.withCString<A>(_:)();
  if (!v14 || (MEMORY[0x1895F8858](v11), FilePath.withCString<A>(_:)(), AAPathListDestroy(v14), (_DWORD)v14))
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *uint64_t v12 = 0;
    swift_willThrow();
  }

  return swift_release();
}

const char *closure #1 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>( AAFlagSet flags@<X2>, uint64_t n_threads@<X3>, const char *result@<X0>, uint64_t a4@<X1>, const char **a5@<X8>)
{
  if (n_threads < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_8;
  }

  if (n_threads > 0x7FFFFFFF)
  {
LABEL_8:
    __break(1u);
    return result;
  }

  if (*(void *)(a4 + 16)) {
    uint64_t v7 = (void *)a4;
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t result = (const char *)AAPathListCreateWithDirectoryContents( result,  0LL,  v7,  *(AAEntryMessageProc *)(a4 + 32),  flags,  n_threads);
  *a5 = result;
  return result;
}

uint64_t closure #2 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  v16[1] = a6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FilePath?);
  MEMORY[0x1895F8858]();
  uint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of FilePath?(a2, (uint64_t)v12);
  uint64_t v13 = type metadata accessor for FilePath();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1LL, v13);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }

  else
  {
    MEMORY[0x1895F8858]();
    v16[-4] = a1;
    v16[-3] = a3;
    v16[-2] = a4;
    v16[-1] = a5;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
    FilePath.withCString<A>(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v12, v13);
  }

  return result;
}

const char *closure #1 in closure #2 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>( const char *path@<X0>, char *dir@<X1>, AAFlagSet flags@<X3>, uint64_t n_threads@<X4>, void *a5@<X2>, const char **a6@<X8>)
{
  int v6 = n_threads;
  if (n_threads < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_7;
  }

  if (n_threads > 0x7FFFFFFF)
  {
LABEL_7:
    __break(1u);
    return path;
  }

  uint64_t v9 = (int (__cdecl *)(void *, AAEntryMessage, const char *, void *))a5[4];
  if (!a5[2]) {
    a5 = 0LL;
  }
  path = (const char *)AAPathListCreateWithDirectoryContents(dir, path, a5, v9, flags, v6);
  *a6 = path;
  return path;
}

AAArchiveStream_impl *closure #3 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>( const char *a1@<X0>, uint64_t a2@<X1>, AAPathList *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, AAFlagSet a6@<X5>, uint64_t a7@<X6>, _DWORD *a8@<X8>)
{
  uint64_t result = *(AAArchiveStream_impl **)(a2 + 16);
  if (!result) {
    goto LABEL_11;
  }
  if (!*a3)
  {
LABEL_12:
    __break(1u);
    return result;
  }

  if (a7 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_10;
  }

  if (a7 > 0x7FFFFFFF)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  if (*(void *)(a5 + 16)) {
    uint64_t v17 = (void *)a5;
  }
  else {
    uint64_t v17 = 0LL;
  }
  uint64_t result = (AAArchiveStream_impl *)AAArchiveStreamWritePathList( result,  *a3,  *(AAFieldKeySet *)(a4 + 16),  a1,  v17,  *(AAEntryMessageProc *)(a5 + 32),  a6,  a7);
  *a8 = (_DWORD)result;
  return result;
}

uint64_t static ArchiveStream.process(readingFrom:writingTo:selectUsing:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, AAFlagSet *a5, uint64_t a6)
{
  AAFlagSet flags = *a5;
  type metadata accessor for ArchiveHeader._EntryFilterWrapper();
  uint64_t v11 = (void *)swift_allocObject();
  uint64_t v12 = v11;
  v11[2] = a3;
  v11[3] = a4;
  if (a3) {
    uint64_t v13 = (int (__cdecl *)(void *, AAEntryMessage, const char *, void *))@objc closure #1 in ArchiveHeader._EntryFilterWrapper.init(_:);
  }
  else {
    uint64_t v13 = 0LL;
  }
  v11[4] = v13;
  uint64_t result = swift_beginAccess();
  uint64_t v15 = *(AAArchiveStream_impl **)(a1 + 16);
  if (!v15) {
    goto LABEL_16;
  }
  uint64_t result = swift_beginAccess();
  uint64_t v16 = *(AAArchiveStream_impl **)(a2 + 16);
  if (!v16)
  {
LABEL_17:
    __break(1u);
    return result;
  }

  if (a3) {
    uint64_t v17 = v12;
  }
  else {
    uint64_t v17 = 0LL;
  }
  if (a6 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_15;
  }

  if (a6 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  outlined copy of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(a3);
  ssize_t v18 = AAArchiveStreamProcess(v15, v16, v17, v13, flags, a6);
  if (v18 < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *uint64_t v19 = 0;
    swift_willThrow();
  }

  swift_release();
  return v18;
}

const char *closure #1 in static ArchiveStream.extractStream(extractingTo:selectUsing:flags:threadCount:)@<X0>( AAFlagSet flags@<X2>, uint64_t n_threads@<X3>, const char *result@<X0>, void *a4@<X1>, const char **a5@<X8>)
{
  int v5 = n_threads;
  if (n_threads < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_7;
  }

  if (n_threads > 0x7FFFFFFF)
  {
LABEL_7:
    __break(1u);
    return result;
  }

  uint64_t v8 = (int (__cdecl *)(void *, AAEntryMessage, const char *, void *))a4[4];
  if (!a4[2]) {
    a4 = 0LL;
  }
  uint64_t result = (const char *)AAExtractArchiveOutputStreamOpen(result, a4, v8, flags, v5);
  *a5 = result;
  return result;
}

uint64_t specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  return specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)( a1,  a2,  a3,  a4,  a5,  MEMORY[0x1896131D8]);
}

uint64_t specialized static ArchiveStream.decodeStream(readingFrom:selectUsing:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  return specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)( a1,  a2,  a3,  a4,  a5,  MEMORY[0x1896131C0]);
}

uint64_t specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t (*a6)(uint64_t, void *, uint64_t (*)(), uint64_t, uint64_t))
{
  uint64_t v11 = *a4;
  type metadata accessor for ArchiveHeader._EntryFilterWrapper();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = v12;
  v12[2] = a2;
  void v12[3] = a3;
  if (a2) {
    uint64_t v14 = @objc closure #1 in ArchiveHeader._EntryFilterWrapper.init(_:);
  }
  else {
    uint64_t v14 = 0LL;
  }
  v12[4] = v14;
  uint64_t result = swift_beginAccess();
  uint64_t v16 = *(void *)(a1 + 16);
  if (!v16) {
    goto LABEL_16;
  }
  if (a2) {
    uint64_t v17 = v13;
  }
  else {
    uint64_t v17 = 0LL;
  }
  if (a5 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_15;
  }

  if (a5 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }

  outlined copy of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(a2);
  uint64_t v18 = a6(v16, v17, v14, v11, a5);
  if (v18)
  {
    uint64_t v19 = v18;
    type metadata accessor for ArchiveStream();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = 0LL;
    swift_beginAccess();
    *(void *)(v20 + 16) = v19;
    *(_BYTE *)(v20 + 24) = 1;
    *(void *)(v20 + 32) = v13;
  }

  else
  {
    swift_release();
    return 0LL;
  }

  return v20;
}

uint64_t specialized static ArchiveStream.extractStream(extractingTo:selectUsing:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = (void *)swift_allocObject();
  int v6 = v5;
  v5[2] = a2;
  v5[3] = a3;
  uint64_t v7 = @objc closure #1 in ArchiveHeader._EntryFilterWrapper.init(_:);
  if (!a2) {
    uint64_t v7 = 0LL;
  }
  v5[4] = v7;
  outlined copy of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(a2);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
  FilePath.withCString<A>(_:)();
  if (v10)
  {
    type metadata accessor for ArchiveStream();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = 0LL;
    swift_beginAccess();
    *(void *)(v8 + 16) = v10;
    *(_BYTE *)(v8 + 24) = 1;
    *(void *)(v8 + 32) = v6;
  }

  else
  {
    swift_release();
    return 0LL;
  }

  return v8;
}

uint64_t specialized static ArchiveStream.convertStream(writingTo:insertKeySet:removeKeySet:selectUsing:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, AAFlagSet *a6, uint64_t a7)
{
  AAFlagSet v13 = *a6;
  type metadata accessor for ArchiveHeader._EntryFilterWrapper();
  uint64_t v14 = (void *)swift_allocObject();
  uint64_t v15 = v14;
  v14[2] = a4;
  v14[3] = a5;
  if (a4) {
    uint64_t v16 = (int (__cdecl *)(void *, AAEntryMessage, const char *, void *))@objc closure #1 in ArchiveHeader._EntryFilterWrapper.init(_:);
  }
  else {
    uint64_t v16 = 0LL;
  }
  v14[4] = v16;
  uint64_t result = swift_beginAccess();
  uint64_t v18 = *(AAArchiveStream_impl **)(a1 + 16);
  if (!v18) {
    goto LABEL_16;
  }
  if (a4) {
    uint64_t v19 = v15;
  }
  else {
    uint64_t v19 = 0LL;
  }
  if (a7 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_15;
  }

  if (a7 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }

  uint64_t v20 = *(AAFieldKeySet_impl **)(a2 + 16);
  uint64_t v21 = *(AAFieldKeySet_impl **)(a3 + 16);
  outlined copy of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(a4);
  AAArchiveStream v22 = AAConvertArchiveOutputStreamOpen(v18, v20, v21, v19, v16, v13, a7);
  if (v22)
  {
    AAArchiveStream v23 = v22;
    type metadata accessor for ArchiveStream();
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = 0LL;
    swift_beginAccess();
    *(void *)(v24 + 16) = v23;
    *(_BYTE *)(v24 + 24) = 1;
    *(void *)(v24 + 32) = v15;
  }

  else
  {
    swift_release();
    return 0LL;
  }

  return v24;
}

const char *partial apply for closure #1 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>( const char *a1@<X0>, const char **a2@<X8>)
{
  return closure #1 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)( *(void *)(v2 + 24),  *(void *)(v2 + 32),  a1,  *(void *)(v2 + 16),  a2);
}

uint64_t outlined copy of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?( uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

AAArchiveStream_impl *partial apply for closure #3 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>( const char *a1@<X0>, _DWORD *a2@<X8>)
{
  return closure #3 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)( a1,  *(void *)(v2 + 16),  *(AAPathList **)(v2 + 24),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(void *)(v2 + 48),  *(void *)(v2 + 56),  a2);
}

uint64_t partial apply for closure #2 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return closure #2 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)( a1,  v2[2],  v2[3],  v2[4],  v2[5],  a2);
}

ValueMetadata *type metadata accessor for _AAArchiveStreamTraits()
{
  return &type metadata for _AAArchiveStreamTraits;
}

uint64_t type metadata accessor for ArchiveStream()
{
  uint64_t result = type metadata singleton initialization cache for ArchiveStream;
  if (!type metadata singleton initialization cache for ArchiveStream) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for ArchiveStream()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ArchiveStream()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveStream.writeHeader(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152LL))();
}

uint64_t dispatch thunk of ArchiveStream.writeBlob(key:from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160LL))();
}

uint64_t dispatch thunk of ArchiveStream.readHeader()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168LL))();
}

uint64_t dispatch thunk of ArchiveStream.readBlob(key:into:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176LL))();
}

uint64_t dispatch thunk of ArchiveStream.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184LL))();
}

uint64_t dispatch thunk of ArchiveStream.close()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192LL))();
}

uint64_t outlined init with copy of FilePath?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FilePath?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

const char *partial apply for closure #1 in closure #2 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>( const char *a1@<X0>, const char **a2@<X8>)
{
  return closure #1 in closure #2 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)( a1,  *(char **)(v2 + 16),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(void **)(v2 + 24),  a2);
}

const char *partial apply for closure #1 in static ArchiveStream.extractStream(extractingTo:selectUsing:flags:threadCount:)@<X0>( const char *a1@<X0>, const char **a2@<X8>)
{
  return closure #1 in static ArchiveStream.extractStream(extractingTo:selectUsing:flags:threadCount:)( *(void *)(v2 + 24),  *(void *)(v2 + 32),  a1,  *(void **)(v2 + 16),  a2);
}

uint64_t static ArchiveStream.customStream<A>(instance:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ArchiveStream.CustomArchiveStreamBridge();
  v10[0] = a1;
  uint64_t result = specialized ArchiveStream.CustomArchiveStreamBridge.__allocating_init(_:)((uint64_t)v10, v6, a2, a3);
  if (!result) {
    return 0LL;
  }
  uint64_t v8 = *(void *)(result + 56);
  if (v8)
  {
    swift_release();
    type metadata accessor for ArchiveStream();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = 0LL;
    swift_beginAccess();
    *(void *)(v9 + 16) = v8;
    *(_BYTE *)(v9 + 24) = 1;
    *(void *)(v9 + 32) = 0LL;
    return v9;
  }

  __break(1u);
  return result;
}

uint64_t type metadata accessor for ArchiveStream.CustomArchiveStreamBridge()
{
  return objc_opt_self();
}

uint64_t closure #1 in ArchiveStream.CustomArchiveStreamBridge.init(_:)(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = result + 16;
    uint64_t v4 = 0LL;
    memset(v3, 0, sizeof(v3));
    swift_beginAccess();
    outlined assign with take of ArchiveStreamProtocol?((uint64_t)v3, v2);
    swift_endAccess();
    *(void *)(v1 + 56) = 0LL;
    swift_release();
    return 0LL;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t @objc closure #2 in ArchiveStream.CustomArchiveStreamBridge.init(_:)(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = swift_retain() + 16;
    swift_beginAccess();
    uint64_t result = outlined init with copy of ArchiveStreamProtocol?(v1, (uint64_t)v4);
    uint64_t v2 = v5;
    if (v5)
    {
      uint64_t v3 = v6;
      __swift_project_boxed_opaque_existential_1(v4, v5);
      (*(void (**)(uint64_t, uint64_t))(v3 + 40))(v2, v3);
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t closure #3 in ArchiveStream.CustomArchiveStreamBridge.init(_:)(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = swift_retain() + 16;
    swift_beginAccess();
    uint64_t result = outlined init with copy of ArchiveStreamProtocol?(v3, (uint64_t)v6);
    if (v7)
    {
      uint64_t v4 = v8;
      __swift_project_boxed_opaque_existential_1(v6, v7);
      type metadata accessor for ArchiveHeader();
      uint64_t v5 = swift_allocObject();
      *(void *)(v5 + 16) = a2;
      *(_BYTE *)(v5 + 24) = 0;
      (*(void (**)(void))(v4 + 8))();
      swift_release();
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
      return 0LL;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t closure #4 in ArchiveStream.CustomArchiveStreamBridge.init(_:)( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if (!a1)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v7 = swift_retain() + 16;
  swift_beginAccess();
  outlined init with copy of ArchiveStreamProtocol?(v7, (uint64_t)v12);
  uint64_t v8 = v13;
  if (!v13)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v9 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  if (!HIBYTE(a2) && (char)a2 >= 32 && (__int16)a2 >> 8 >= 32 && (int)(a2 << 8) >> 24 > 31)
  {
    unsigned int v11 = a2;
    (*(void (**)(unsigned int *, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16))(&v11, a3, a3 + a4, v8, v9);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    return 0LL;
  }

LABEL_10:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t closure #5 in ArchiveStream.CustomArchiveStreamBridge.init(_:)(uint64_t result, AAHeader *a2)
{
  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v3 = swift_retain() + 16;
  swift_beginAccess();
  uint64_t result = outlined init with copy of ArchiveStreamProtocol?(v3, (uint64_t)v7);
  uint64_t v4 = v8;
  if (!v8)
  {
LABEL_11:
    __break(1u);
    return result;
  }

  uint64_t v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if (v6)
  {
    if (*a2) {
      AAHeaderAssign(*a2, *(AAHeader *)(v6 + 16));
    }
    else {
      *a2 = AAHeaderClone(*(AAHeader *)(v6 + 16));
    }
    swift_release();
    swift_release();
    return 1LL;
  }

  else
  {
    swift_release();
    return 0LL;
  }

uint64_t ArchiveStream.CustomArchiveStreamBridge.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t specialized ArchiveStream.CustomArchiveStreamBridge.init(_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32LL))(boxed_opaque_existential_1, a1, a3);
  *(_OWORD *)(a2 + outlined destroy of ArchiveStreamProtocol?(v0 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  AAArchiveStream v8 = AACustomArchiveStreamOpen();
  if (v8)
  {
    uint64_t v9 = v8;
    swift_retain();
    AACustomArchiveStreamSetData(v9, (void *)a2);
    AACustomArchiveStreamSetCloseProc( v9,  (AAArchiveStreamCloseProc)@objc closure #1 in ArchiveStream.CustomArchiveStreamBridge.init(_:));
    AACustomArchiveStreamSetCancelProc( v9,  (AAArchiveStreamCancelProc)@objc closure #2 in ArchiveStream.CustomArchiveStreamBridge.init(_:));
    AACustomArchiveStreamSetWriteHeaderProc( v9,  (AAArchiveStreamWriteHeaderProc)@objc closure #3 in ArchiveStream.CustomArchiveStreamBridge.init(_:));
    AACustomArchiveStreamSetWriteBlobProc( v9,  (AAArchiveStreamWriteBlobProc)@objc closure #4 in ArchiveStream.CustomArchiveStreamBridge.init(_:));
    AACustomArchiveStreamSetReadHeaderProc( v9,  (AAArchiveStreamReadHeaderProc)@objc closure #5 in ArchiveStream.CustomArchiveStreamBridge.init(_:));
    outlined init with take of ArchiveStreamProtocol(&v12, (uint64_t)v11);
    swift_beginAccess();
    outlined assign with take of ArchiveStreamProtocol?((uint64_t)v11, a2 + 16);
    swift_endAccess();
    *(void *)(a2 + 56) = v9;
  }

  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
    swift_release();
    return 0LL;
  }

  return a2;
}

uint64_t specialized ArchiveStream.CustomArchiveStreamBridge.__allocating_init(_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for ArchiveStream.CustomArchiveStreamBridge();
  uint64_t v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return specialized ArchiveStream.CustomArchiveStreamBridge.init(_:)((uint64_t)v9, v10, a3, a4);
}

uint64_t outlined destroy of ArchiveStreamProtocol?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArchiveStreamProtocol?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }

  return v1;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t outlined init with take of ArchiveStreamProtocol(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + outlined destroy of ArchiveStreamProtocol?(v0 + 16) = v3;
  return a2;
}

uint64_t outlined assign with take of ArchiveStreamProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArchiveStreamProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of ArchiveStreamProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArchiveStreamProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t closure #1 in ArchiveByteStream.CustomByteStreamBridge.init(_:)(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = result + 16;
    swift_beginAccess();
    outlined init with copy of ArchiveByteStreamProtocol?(v2, (uint64_t)&v6);
    uint64_t v3 = *((void *)&v7 + 1);
    outlined destroy of ArchiveByteStreamProtocol?((uint64_t)&v6);
    if (!v3)
    {
LABEL_5:
      uint64_t v8 = 0LL;
      __int128 v6 = 0u;
      __int128 v7 = 0u;
      swift_beginAccess();
      outlined assign with take of ArchiveByteStreamProtocol?((uint64_t)&v6, v2);
      swift_endAccess();
      *(void *)(v1 + 56) = 0LL;
      swift_release();
      return 0LL;
    }

    uint64_t result = outlined init with copy of ArchiveByteStreamProtocol?(v2, (uint64_t)&v6);
    uint64_t v4 = *((void *)&v7 + 1);
    if (*((void *)&v7 + 1))
    {
      uint64_t v5 = v8;
      __swift_project_boxed_opaque_existential_1(&v6, *((uint64_t *)&v7 + 1));
      (*(void (**)(uint64_t, uint64_t))(v5 + 56))(v4, v5);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
      goto LABEL_5;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t closure #2 in ArchiveByteStream.CustomByteStreamBridge.init(_:)( uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = swift_retain() + 16;
    swift_beginAccess();
    uint64_t result = outlined init with copy of ArchiveByteStreamProtocol?(v5, (uint64_t)v9);
    uint64_t v6 = v10;
    if (v10)
    {
      uint64_t v7 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8))(a2, a2 + a3, v6, v7);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      return v8;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t closure #3 in ArchiveByteStream.CustomByteStreamBridge.init(_:)( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    uint64_t v7 = swift_retain() + 16;
    swift_beginAccess();
    uint64_t result = outlined init with copy of ArchiveByteStreamProtocol?(v7, (uint64_t)v11);
    uint64_t v8 = v12;
    if (v12)
    {
      uint64_t v9 = v13;
      __swift_project_boxed_opaque_existential_1(v11, v12);
      uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16))(a2, a2 + a3, a4, v8, v9);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      return v10;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t closure #4 in ArchiveByteStream.CustomByteStreamBridge.init(_:)( uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = swift_retain() + 16;
    swift_beginAccess();
    uint64_t result = outlined init with copy of ArchiveByteStreamProtocol?(v5, (uint64_t)v9);
    uint64_t v6 = v10;
    if (v10)
    {
      uint64_t v7 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 24))(a2, a2 + a3, v6, v7);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      return v8;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t closure #5 in ArchiveByteStream.CustomByteStreamBridge.init(_:)( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    uint64_t v7 = swift_retain() + 16;
    swift_beginAccess();
    uint64_t result = outlined init with copy of ArchiveByteStreamProtocol?(v7, (uint64_t)v11);
    uint64_t v8 = v12;
    if (v12)
    {
      uint64_t v9 = v13;
      __swift_project_boxed_opaque_existential_1(v11, v12);
      uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 32))(a2, a2 + a3, a4, v8, v9);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      return v10;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t @objc closure #6 in ArchiveByteStream.CustomByteStreamBridge.init(_:)(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = swift_retain() + 16;
    swift_beginAccess();
    uint64_t result = outlined init with copy of ArchiveByteStreamProtocol?(v1, (uint64_t)v4);
    uint64_t v2 = v5;
    if (v5)
    {
      uint64_t v3 = v6;
      __swift_project_boxed_opaque_existential_1(v4, v5);
      (*(void (**)(uint64_t, uint64_t))(v3 + 48))(v2, v3);
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t closure #7 in ArchiveByteStream.CustomByteStreamBridge.init(_:)( uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = swift_retain() + 16;
    swift_beginAccess();
    uint64_t result = outlined init with copy of ArchiveByteStreamProtocol?(v5, (uint64_t)v9);
    uint64_t v6 = v10;
    if (v10)
    {
      uint64_t v7 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 40))(a2, a3, v6, v7);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      return v8;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t ArchiveByteStream.CustomByteStreamBridge.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t static ArchiveByteStream.customStream<A>(instance:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ArchiveByteStream.CustomByteStreamBridge();
  v10[0] = a1;
  uint64_t result = specialized ArchiveByteStream.CustomByteStreamBridge.__allocating_init(_:)((uint64_t)v10, v6, a2, a3);
  if (!result) {
    return 0LL;
  }
  uint64_t v8 = *(void *)(result + 56);
  if (v8)
  {
    swift_release();
    type metadata accessor for ArchiveByteStream();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = 0LL;
    swift_beginAccess();
    *(void *)(v9 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v8;
    *(_BYTE *)(v9 + 24) = 0;
    return v9;
  }

  __break(1u);
  return result;
}

uint64_t type metadata accessor for ArchiveByteStream.CustomByteStreamBridge()
{
  return objc_opt_self();
}

uint64_t specialized ArchiveByteStream.CustomByteStreamBridge.init(_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32LL))(boxed_opaque_existential_1, a1, a3);
  *(_OWORD *)(a2 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  AAByteStream v8 = AACustomByteStreamOpen();
  if (v8)
  {
    uint64_t v9 = v8;
    swift_retain();
    AACustomByteStreamSetData(v9, (void *)a2);
    AACustomByteStreamSetCloseProc( v9,  (AAByteStreamCloseProc)@objc closure #1 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    AACustomByteStreamSetReadProc( v9,  (AAByteStreamReadProc)@objc closure #2 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    AACustomByteStreamSetPReadProc( v9,  (AAByteStreamPReadProc)@objc closure #3 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    AACustomByteStreamSetWriteProc( v9,  (AAByteStreamWriteProc)@objc closure #4 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    AACustomByteStreamSetPWriteProc( v9,  (AAByteStreamPWriteProc)@objc closure #5 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    AACustomByteStreamSetCancelProc( v9,  (AAByteStreamCancelProc)@objc closure #6 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    AACustomByteStreamSetSeekProc( v9,  (AAByteStreamSeekProc)@objc closure #7 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    outlined init with take of ArchiveStreamProtocol(&v12, (uint64_t)v11);
    swift_beginAccess();
    outlined assign with take of ArchiveByteStreamProtocol?((uint64_t)v11, a2 + 16);
    swift_endAccess();
    *(void *)(a2 + 56) = v9;
  }

  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
    swift_release();
    return 0LL;
  }

  return a2;
}

uint64_t specialized ArchiveByteStream.CustomByteStreamBridge.__allocating_init(_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for ArchiveByteStream.CustomByteStreamBridge();
  uint64_t v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return specialized ArchiveByteStream.CustomByteStreamBridge.init(_:)((uint64_t)v9, v10, a3, a4);
}

uint64_t outlined destroy of ArchiveByteStreamProtocol?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArchiveByteStreamProtocol?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t outlined assign with take of ArchiveByteStreamProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArchiveByteStreamProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of ArchiveByteStreamProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArchiveByteStreamProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t static ArchiveByteStream._withStream<A>(stream:_:)@<X0>( uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (a1)
  {
    uint64_t result = a2();
    if (!v4)
    {
      swift_beginAccess();
      uint64_t result = *(void *)(a1 + 16);
      if (result)
      {
        uint64_t result = AAByteStreamClose((AAByteStream)result);
        *(void *)(a1 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = 0LL;
        if ((_DWORD)result)
        {
          lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
          swift_allocError();
          *uint64_t v9 = 0;
          swift_willThrow();
          return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8LL))(a4, a3);
        }
      }
    }
  }

  else
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *uint64_t v10 = 0;
    return swift_willThrow();
  }

  return result;
}

uint64_t static ArchiveByteStream.withFileStream<A>(path:mode:options:permissions:_:)@<X0>( uint64_t (*a1)(void)@<X4>, uint64_t a2@<X6>, uint64_t a3@<X8>)
{
  if (v8)
  {
    type metadata accessor for ArchiveByteStream();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = 0LL;
    swift_beginAccess();
    *(void *)(v6 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v8;
    *(_BYTE *)(v6 + 24) = 1;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  static ArchiveByteStream._withStream<A>(stream:_:)(v6, a1, a2, a3);
  return swift_release();
}

AAByteStream _s12AppleArchive0B10ByteStreamC04fileD04path4mode7options11permissionsACSg6System8FilePathV_AJ0K10DescriptorV10AccessModeVAN11OpenOptionsVAJ0K11PermissionsVtFZs13OpaquePointerVSgSPys4Int8VGXEfU_TA_0@<X0>( const char *a1@<X0>, AAByteStream *a2@<X8>)
{
  return closure #1 in static ArchiveByteStream.fileStream(path:mode:options:permissions:)( a1,  *(_DWORD *)(v2 + 16),  *(_WORD *)(v2 + 20),  a2);
}

uint64_t static ArchiveByteStream.withFileStream<A>(fd:automaticClose:_:)@<X0>( int a1@<W0>, char a2@<W1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  AAByteStream v8 = AAFileStreamOpenWithFD(a1, a2 & 1);
  if (v8)
  {
    AAByteStream v9 = v8;
    type metadata accessor for ArchiveByteStream();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = 0LL;
    swift_beginAccess();
    *(void *)(v10 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v9;
    *(_BYTE *)(v10 + 24) = 1;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  static ArchiveByteStream._withStream<A>(stream:_:)(v10, a3, a4, a5);
  return swift_release();
}

uint64_t static ArchiveByteStream.withTemporaryFileStream<A>(_:)@<X0>( uint64_t (*a1)(void)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  AAByteStream v6 = AATempFileStreamOpen();
  if (v6)
  {
    AAByteStream v7 = v6;
    type metadata accessor for ArchiveByteStream();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = 0LL;
    swift_beginAccess();
    *(void *)(v8 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v7;
    *(_BYTE *)(v8 + 24) = 1;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  static ArchiveByteStream._withStream<A>(stream:_:)(v8, a1, a2, a3);
  return swift_release();
}

AAByteStream_impl *static ArchiveByteStream.withCompressionStream<A>(using:writingTo:blockSize:flags:threadCount:_:)@<X0>( AACompressionAlgorithm *a1@<X0>, uint64_t a2@<X1>, size_t a3@<X2>, AAFlagSet *a4@<X3>, uint64_t a5@<X4>, uint64_t (*a6)(void)@<X5>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  AACompressionAlgorithm v14 = *a1;
  AAFlagSet v15 = *a4;
  swift_beginAccess();
  uint64_t result = *(AAByteStream_impl **)(a2 + 16);
  if (!result) {
    goto LABEL_10;
  }
  if (a5 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (a5 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }

  AAByteStream v17 = AACompressionOutputStreamOpen(result, v14, a3, v15, a5);
  if (v17)
  {
    AAByteStream v18 = v17;
    type metadata accessor for ArchiveByteStream();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = 0LL;
    swift_beginAccess();
    *(void *)(v19 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v18;
    *(_BYTE *)(v19 + 24) = 1;
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  static ArchiveByteStream._withStream<A>(stream:_:)(v19, a6, a7, a8);
  return (AAByteStream_impl *)swift_release();
}

uint64_t static ArchiveByteStream.withCompressionStream<A>(appendingTo:flags:threadCount:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t (*a3)(void)@<X3>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  return static ArchiveByteStream.withCompressionStream<A>(appendingTo:flags:threadCount:_:)( a1,  a2,  a3,  a4,  MEMORY[0x189613108],  a5);
}

uint64_t static ArchiveByteStream.withDecompressionStream<A>(readingFrom:flags:threadCount:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t (*a3)(void)@<X3>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  return static ArchiveByteStream.withCompressionStream<A>(appendingTo:flags:threadCount:_:)( a1,  a2,  a3,  a4,  MEMORY[0x1896131C8],  a5);
}

uint64_t static ArchiveByteStream.withCompressionStream<A>(appendingTo:flags:threadCount:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t (*a3)(void)@<X3>, uint64_t a4@<X5>, uint64_t (*a5)(void)@<X6>, uint64_t a6@<X8>)
{
  uint64_t result = *(void *)(a1 + 16);
  if (!result) {
    goto LABEL_10;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (a2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v13 = a5();
  if (v13)
  {
    uint64_t v14 = v13;
    type metadata accessor for ArchiveByteStream();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = 0LL;
    swift_beginAccess();
    *(void *)(v15 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v14;
    *(_BYTE *)(v15 + 24) = 1;
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  static ArchiveByteStream._withStream<A>(stream:_:)(v15, a3, a4, a6);
  return swift_release();
}

uint64_t static ArchiveByteStream.withRandomAccessDecompressionStream<A>(readingFrom:allocationLimit:flags:threadCount:_:)@<X0>( AAByteStream_impl *a1@<X0>, int64_t a2@<X1>, AAFlagSet *a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(void)@<X4>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  AAFlagSet v12 = *a3;
  uint64_t v10 = specialized static ArchiveByteStream.randomAccessDecompressionStream(readingFrom:allocationLimit:flags:threadCount:)( a1,  a2,  &v12,  a4);
  static ArchiveByteStream._withStream<A>(stream:_:)((uint64_t)v10, a5, a6, a7);
  return swift_release();
}

uint64_t static ArchiveByteStream.withStream<A, B>(wrapping:_:)@<X0>( uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v9 = static ArchiveByteStream.customStream<A>(instance:)(a1, a3, a5);
  static ArchiveByteStream._withStream<A>(stream:_:)(v9, a2, a4, a6);
  return swift_release();
}

uint64_t ArchiveHeader.FieldKey.init(_:)@<X0>(int *a1@<X8>)
{
  uint64_t v2 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  if (*(void *)(v2 + 16) != 4LL
    || *(_BYTE *)(v2 + 35)
    || *(char *)(v2 + 32) < 32
    || *(char *)(v2 + 33) < 32
    || *(char *)(v2 + 34) <= 31)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    int v3 = *(unsigned __int8 *)(v2 + 32);
    int v4 = *(unsigned __int8 *)(v2 + 33);
    int v5 = *(unsigned __int8 *)(v2 + 34);
    uint64_t result = swift_release();
    *a1 = v3 | (v4 << 8) | (v5 << 16);
  }

  return result;
}

uint64_t ArchiveHeader.FieldKey.description.getter()
{
  int v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int8>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = xmmword_18862F160;
  *(_WORD *)(inited + 32) = v1;
  *(_BYTE *)(inited + 34) = BYTE2(v1);
  *(_BYTE *)(inited + 35) = 0;
  uint64_t v3 = specialized String.init(cString:)(inited);
  swift_setDeallocating();
  return v3;
}

BOOL static ArchiveHeader.FieldKey.== infix(_:_:)(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void ArchiveHeader.FieldKey.hash(into:)()
{
}

Swift::Int ArchiveHeader.FieldKey.hashValue.getter()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ArchiveHeader.FieldKey()
{
  int v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int8>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = xmmword_18862F160;
  *(_WORD *)(inited + 32) = v1;
  *(_BYTE *)(inited + 34) = BYTE2(v1);
  *(_BYTE *)(inited + 35) = 0;
  uint64_t v3 = specialized String.init(cString:)(inited);
  swift_setDeallocating();
  return v3;
}

uint64_t specialized String.init(cString:)(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    uint64_t v2 = result;
    int v3 = *(unsigned __int8 *)(result + 32);
    result += 32LL;
    if (!v3) {
      return static String._fromUTF8Repairing(_:)();
    }
    uint64_t v4 = 0LL;
    uint64_t v5 = v1 - 1;
    uint64_t v6 = v2 + 33;
    while (v5 != v4)
    {
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader.FieldKey and conformance ArchiveHeader.FieldKey()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveHeader.FieldKey and conformance ArchiveHeader.FieldKey;
  if (!lazy protocol witness table cache variable for type ArchiveHeader.FieldKey and conformance ArchiveHeader.FieldKey)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveHeader.FieldKey,  &type metadata for ArchiveHeader.FieldKey);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader.FieldKey and conformance ArchiveHeader.FieldKey);
  }

  return result;
}

ValueMetadata *type metadata accessor for ArchiveHeader.FieldKey()
{
  return &type metadata for ArchiveHeader.FieldKey;
}

uint64_t ArchiveEncryptionContext.ChecksumMode.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveEncryptionContext.ChecksumMode.none.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveEncryptionContext.ChecksumMode.murmurhash64.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ArchiveEncryptionContext.ChecksumMode.sha256.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

uint64_t ArchiveEncryptionContext.ChecksumMode.rawValue.getter()
{
  return *v0;
}

uint64_t ArchiveEncryptionContext.ChecksumMode.rawValue.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*ArchiveEncryptionContext.ChecksumMode.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveEncryptionContext.ChecksumMode.description.getter()
{
  int v1 = *v0;
  uint64_t v2 = 0x363532616873LL;
  uint64_t v3 = 4144959LL;
  if (*v0 == 1) {
    uint64_t v3 = 0x616872756D72756DLL;
  }
  if (v1 != 2) {
    uint64_t v2 = v3;
  }
  if (v1) {
    return v2;
  }
  else {
    return 1701736302LL;
  }
}

unint64_t lazy protocol witness table accessor for type ArchiveEncryptionContext.ChecksumMode and conformance ArchiveEncryptionContext.ChecksumMode()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveEncryptionContext.ChecksumMode and conformance ArchiveEncryptionContext.ChecksumMode;
  if (!lazy protocol witness table cache variable for type ArchiveEncryptionContext.ChecksumMode and conformance ArchiveEncryptionContext.ChecksumMode)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveEncryptionContext.ChecksumMode,  &type metadata for ArchiveEncryptionContext.ChecksumMode);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveEncryptionContext.ChecksumMode and conformance ArchiveEncryptionContext.ChecksumMode);
  }

  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ArchiveEncryptionContext.ChecksumMode()
{
  int v1 = *v0;
  uint64_t v2 = 1701736302LL;
  if (*v0) {
    uint64_t v2 = 4144959LL;
  }
  if (v1 == 1) {
    uint64_t v2 = 0x616872756D72756DLL;
  }
  if (v1 == 2) {
    return 0x363532616873LL;
  }
  else {
    return v2;
  }
}

ValueMetadata *type metadata accessor for ArchiveEncryptionContext.ChecksumMode()
{
  return &type metadata for ArchiveEncryptionContext.ChecksumMode;
}

uint64_t ArchiveEncryptionContext.SignatureMode.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveEncryptionContext.SignatureMode.none.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveEncryptionContext.SignatureMode.ecdsa_p256.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

uint64_t ArchiveEncryptionContext.SignatureMode.rawValue.getter()
{
  return *v0;
}

uint64_t ArchiveEncryptionContext.SignatureMode.rawValue.setter(uint64_t result)
{
  *int v1 = result;
  return result;
}

uint64_t (*ArchiveEncryptionContext.SignatureMode.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveEncryptionContext.SignatureMode.description.getter()
{
  uint64_t v1 = 4144959LL;
  if (*v0 == 1) {
    uint64_t v1 = 0x32705F6173646365LL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701736302LL;
  }
}

unint64_t lazy protocol witness table accessor for type ArchiveEncryptionContext.SignatureMode and conformance ArchiveEncryptionContext.SignatureMode()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveEncryptionContext.SignatureMode and conformance ArchiveEncryptionContext.SignatureMode;
  if (!lazy protocol witness table cache variable for type ArchiveEncryptionContext.SignatureMode and conformance ArchiveEncryptionContext.SignatureMode)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveEncryptionContext.SignatureMode,  &type metadata for ArchiveEncryptionContext.SignatureMode);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveEncryptionContext.SignatureMode and conformance ArchiveEncryptionContext.SignatureMode);
  }

  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ArchiveEncryptionContext.SignatureMode()
{
  uint64_t v1 = 1701736302LL;
  if (*v0) {
    uint64_t v1 = 4144959LL;
  }
  if (*v0 == 1) {
    return 0x32705F6173646365LL;
  }
  else {
    return v1;
  }
}

ValueMetadata *type metadata accessor for ArchiveEncryptionContext.SignatureMode()
{
  return &type metadata for ArchiveEncryptionContext.SignatureMode;
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.read(into:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.read(into:atOffset:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.write(from:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.write(from:atOffset:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.seek(toOffset:relativeTo:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.close()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)( unint64_t a1, uint64_t a2, unint64_t a3)
{
  return specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(a1, a2, a3, MEMORY[0x189613358]);
}

{
  return specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(a1, a2, a3, MEMORY[0x189613268]);
}

unint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)( unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  AAByteStream v7 = *(AAHeader_impl **)(a4 + 16);
  unint64_t result = AAHeaderGetFieldCount(v7);
  if (result < a1)
  {
    __break(1u);
    goto LABEL_14;
  }

  unint64_t result = AAHeaderGetFieldCount(v7);
  if (result < a3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v9 = a3 - a1;
  if (a2 >= 1)
  {
    return 0LL;
  }

  if (v9 <= 0 && v9 > a2) {
    return 0LL;
  }
LABEL_10:
  BOOL v11 = __OFADD__(a1, a2);
  unint64_t v10 = a1 + a2;
  if (v11)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  unint64_t result = AAHeaderGetFieldCount(v7);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)( unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v9 = *(void *)(v4 + 16);
  uint64_t result = a4(v9);
  if (result < a1)
  {
    __break(1u);
    goto LABEL_14;
  }

  uint64_t result = a4(v9);
  if (result < a3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v11 = a3 - a1;
  if (a2 >= 1)
  {
    return 0LL;
  }

  if (v11 <= 0 && v11 > a2) {
    return 0LL;
  }
LABEL_10:
  BOOL v13 = __OFADD__(a1, a2);
  unint64_t v12 = a1 + a2;
  if (v13)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  uint64_t result = a4(v9);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0LL;
      }
      v4 |= v6;
      --v3;
    }

    while (v3);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t specialized SetAlgebra.subtracting(_:)()
{
  uint64_t v1 = swift_retain();
  uint64_t v2 = specialized ArchiveHeader.FieldKeySet.symmetricDifference(_:)(v1, v0);
  swift_release();
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = *(AAFieldKeySet_impl **)(v0 + 16);
  swift_retain();
  AAFieldKeySet v5 = AAFieldKeySetClone(v4);
  if (!v5 {
    || (uint64_t v6 = v5,
  }
        swift_release(),
        *(void *)(v3 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v6,
        *(_BYTE *)(v3 + 24) = 1,
        AAFieldKeySetSelectKeySet(v6, *(AAFieldKeySet *)(v2 + 16)) < 0))
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    swift_release();
    swift_release();
    return v3;
  }

  return result;
}

uint64_t specialized SetAlgebra.isSubset(of:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t inited = swift_initStackObject();
  AAFieldKeySet v5 = *(AAFieldKeySet_impl **)(v2 + 16);
  swift_retain();
  uint64_t v6 = AAFieldKeySetClone(v5);
  if (!v6 || (uint64_t v7 = v6, *(void *)(inited + 16) = v6, AAFieldKeySetSelectKeySet(v6, *(AAFieldKeySet *)(a1 + 16)) < 0))
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    swift_release();
    uint64_t v8 = ArchiveHeader.FieldKeySet.description.getter();
    uint64_t v10 = v9;
    if (v8 == ArchiveHeader.FieldKeySet.description.getter() && v10 == v11) {
      char v12 = 1;
    }
    else {
      char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    AAFieldKeySetDestroy(v7);
    return v12 & 1;
  }

  return result;
}

uint64_t specialized SetAlgebra.isDisjoint(with:)(uint64_t a1)
{
  uint64_t v3 = *(AAFieldKeySet_impl **)(v1 + 16);
  swift_retain();
  uint64_t v4 = AAFieldKeySetClone(v3);
  if (!v4 || (AAFieldKeySet v5 = v4, AAFieldKeySetSelectKeySet(v4, *(AAFieldKeySet *)(a1 + 16)) < 0))
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    swift_release();
    uint32_t KeyCount = AAFieldKeySetGetKeyCount(v5);
    AAFieldKeySetDestroy(v5);
    return KeyCount == 0;
  }

  return result;
}

uint64_t specialized SetAlgebra.isSuperset(of:)(uint64_t a1)
{
  uint64_t inited = swift_initStackObject();
  uint64_t v4 = *(AAFieldKeySet_impl **)(a1 + 16);
  swift_retain();
  AAFieldKeySet v5 = AAFieldKeySetClone(v4);
  if (!v5 || (uint64_t v6 = v5, *(void *)(inited + 16) = v5, AAFieldKeySetSelectKeySet(v5, *(AAFieldKeySet *)(v1 + 16)) < 0))
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    swift_release();
    uint64_t v7 = ArchiveHeader.FieldKeySet.description.getter();
    uint64_t v9 = v8;
    if (v7 == ArchiveHeader.FieldKeySet.description.getter() && v9 == v10) {
      char v11 = 1;
    }
    else {
      char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    AAFieldKeySetDestroy(v6);
    return v11 & 1;
  }

  return result;
}

void protocol witness for static _AAObjectTraits.aaDestroy(_:) in conformance _AAFieldKeySetTraits( AAFieldKeySet *a1)
{
}

uint64_t ArchiveHeader.FieldKeySet.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  AAFieldKeySet v1 = AAFieldKeySetCreate();
  if (v1)
  {
    *(void *)(v0 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 1;
    return v0;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t ArchiveHeader.FieldKeySet.init()()
{
  AAFieldKeySet v1 = AAFieldKeySetCreate();
  if (v1)
  {
    *(void *)(v0 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 1;
    return v0;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t ArchiveHeader.FieldKeySet.__allocating_init(_:)()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  AAFieldKeySet v2 = AAFieldKeySetCreateWithString((const char *)(v1 + 32));
  swift_release();
  if (v2)
  {
    *(void *)(v0 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v2;
    *(_BYTE *)(v0 + 24) = 1;
  }

  else
  {
    swift_deallocPartialClassInstance();
    return 0LL;
  }

  return v0;
}

uint64_t ArchiveHeader.FieldKeySet.init(_:)()
{
  uint64_t v1 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  AAFieldKeySet v2 = AAFieldKeySetCreateWithString((const char *)(v1 + 32));
  swift_release();
  if (v2)
  {
    *(void *)(v0 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v2;
    *(_BYTE *)(v0 + 24) = 1;
  }

  else
  {
    swift_deallocPartialClassInstance();
    return 0LL;
  }

  return v0;
}

uint64_t ArchiveHeader.FieldKeySet.__allocating_init(copying:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  AAFieldKeySet v3 = AAFieldKeySetClone(*(AAFieldKeySet *)(a1 + 16));
  if (v3)
  {
    AAFieldKeySet v4 = v3;
    swift_release();
    *(void *)(v2 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v4;
    *(_BYTE *)(v2 + 24) = 1;
    return v2;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t ArchiveHeader.FieldKeySet.init(copying:)(uint64_t a1)
{
  AAFieldKeySet v2 = AAFieldKeySetClone(*(AAFieldKeySet *)(a1 + 16));
  if (v2)
  {
    AAFieldKeySet v3 = v2;
    swift_release();
    *(void *)(v1 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v3;
    *(_BYTE *)(v1 + 24) = 1;
    return v1;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t static ArchiveHeader.FieldKeySet.defaultForArchive.getter()
{
  return static ArchiveHeader.FieldKeySet.defaultForArchive.getter("TYP,PAT,LNK,DEV,DAT,UID,GID,MOD,FLG,MTM,BTM,CTM,HLC,CLC");
}

uint64_t static ArchiveHeader.FieldKeySet.defaultForManifest.getter()
{
  return static ArchiveHeader.FieldKeySet.defaultForArchive.getter("TYP,PAT,LNK,DEV,UID,GID,MOD,FLG,MTM,BTM,CTM,HLC,CLC,DUZ,SIZ,CKS,SH1");
}

uint64_t static ArchiveHeader.FieldKeySet.defaultForArchive.getter(const char *a1)
{
  uint64_t v2 = swift_allocObject();
  AAFieldKeySet v3 = AAFieldKeySetCreateWithString(a1);
  if (v3)
  {
    *(void *)(v2 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v3;
    *(_BYTE *)(v2 + 24) = 1;
    return v2;
  }

  else
  {
    uint64_t result = swift_deallocPartialClassInstance();
    __break(1u);
  }

  return result;
}

void ArchiveHeader.FieldKeySet.__allocating_init(object:owned:)()
{
}

void ArchiveHeader.FieldKeySet.init(object:owned:)()
{
}

uint64_t ArchiveHeader.FieldKeySet.deinit()
{
  if (*(_BYTE *)(v0 + 24) == 1) {
    AAFieldKeySetDestroy(*(AAFieldKeySet *)(v0 + 16));
  }
  return v0;
}

uint64_t ArchiveHeader.FieldKeySet.__deallocating_deinit()
{
  if (*(_BYTE *)(v0 + 24) == 1) {
    AAFieldKeySetDestroy(*(AAFieldKeySet *)(v0 + 16));
  }
  return swift_deallocClassInstance();
}

void vtable thunk for _AAObjectWrapper.__allocating_init(object:owned:) dispatching to ArchiveHeader.FieldKeySet.__allocating_init(object:owned:)()
{
}

uint64_t ArchiveHeader.FieldKeySet.insert(_:)(AAFieldKey *a1, AAFieldKey *a2)
{
  AAFieldKey v4 = *a2;
  AAFieldKeySet v5 = *(AAFieldKeySet_impl **)(v2 + 16);
  AAFieldKey v6 = *a2;
  int v7 = AAFieldKeySetContainsKey(v5, v6);
  if (v7 < 0 || (int v8 = v7, v7 != 1) && (v9 = v4, AAFieldKeySetInsertKey(v5, v9) < 0))
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    uint64_t result = v8 != 1;
    *a1 = v4;
  }

  return result;
}

uint64_t ArchiveHeader.FieldKeySet.contains(_:)(AAFieldKey *a1)
{
  AAFieldKey v2 = *a1;
  int v3 = AAFieldKeySetContainsKey(*(AAFieldKeySet *)(v1 + 16), v2);
  if ((v3 & 0x80000000) == 0) {
    return v3 == 1;
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t ArchiveHeader.FieldKeySet.remove(_:)@<X0>(AAFieldKey *a1@<X0>, AAFieldKey *a2@<X8>)
{
  AAFieldKey v4 = *a1;
  AAFieldKeySet v5 = *(AAFieldKeySet_impl **)(v2 + 16);
  AAFieldKey v6 = *a1;
  uint64_t result = AAFieldKeySetContainsKey(v5, v6);
  if ((result & 0x80000000) == 0)
  {
    int v8 = result;
    if ((_DWORD)result != 1)
    {
      v4.ikey = 0;
LABEL_5:
      *a2 = v4;
      a2[1].skey[0] = v8 != 1;
      return result;
    }

    AAFieldKey v9 = v4;
    uint64_t result = AAFieldKeySetRemoveKey(v5, v9);
    if ((result & 0x80000000) == 0) {
      goto LABEL_5;
    }
  }

  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t ArchiveHeader.FieldKeySet.update(with:)@<X0>(AAFieldKey *a1@<X0>, AAFieldKey *a2@<X8>)
{
  AAFieldKey v4 = *a1;
  AAFieldKey v5 = *a1;
  uint64_t result = AAFieldKeySetInsertKey(*(AAFieldKeySet *)(v2 + 16), v5);
  if ((result & 0x80000000) != 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    *a2 = v4;
    a2[1].skey[0] = 0;
  }

  return result;
}

uint64_t ArchiveHeader.FieldKeySet.formUnion(_:)(uint64_t a1)
{
  return ArchiveHeader.FieldKeySet.formUnion(_:)(a1, MEMORY[0x1896132C8]);
}

uint64_t ArchiveHeader.FieldKeySet.formIntersection(_:)(uint64_t a1)
{
  return ArchiveHeader.FieldKeySet.formUnion(_:)(a1, MEMORY[0x1896132E0]);
}

uint64_t ArchiveHeader.FieldKeySet.formUnion(_:)(uint64_t a1, uint64_t (*a2)(void, void))
{
  uint64_t result = a2(*(void *)(v2 + 16), *(void *)(a1 + 16));
  if ((result & 0x80000000) != 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

void ArchiveHeader.FieldKeySet.formSymmetricDifference(_:)(uint64_t a1)
{
  int v3 = *(AAFieldKeySet_impl **)(v1 + 16);
  swift_retain();
  AAFieldKeySet v4 = AAFieldKeySetClone(v3);
  if (!v4
    || (v5 = v4, swift_release(), AAFieldKey v6 = *(AAFieldKeySet_impl **)(a1 + 16), AAFieldKeySetSelectKeySet(v5, v6) < 0)
    || AAFieldKeySetInsertKeySet(v3, v6) < 0
    || AAFieldKeySetRemoveKeySet(v3, v5) < 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    swift_release();
    AAFieldKeySetDestroy(v5);
  }

uint64_t ArchiveHeader.FieldKeySet.intersection(_:)(uint64_t a1)
{
  return ArchiveHeader.FieldKeySet.intersection(_:)( a1,  (uint64_t (*)(AAFieldKeySet, void))MEMORY[0x1896132E0]);
}

uint64_t ArchiveHeader.FieldKeySet.union(_:)(uint64_t a1)
{
  return ArchiveHeader.FieldKeySet.intersection(_:)( a1,  (uint64_t (*)(AAFieldKeySet, void))MEMORY[0x1896132C8]);
}

uint64_t ArchiveHeader.FieldKeySet.intersection(_:)( uint64_t a1, uint64_t (*a2)(AAFieldKeySet, void))
{
  uint64_t v4 = v2;
  uint64_t v6 = swift_allocObject();
  int v7 = *(AAFieldKeySet_impl **)(v4 + 16);
  swift_retain();
  AAFieldKeySet v8 = AAFieldKeySetClone(v7);
  if (v8)
  {
    AAFieldKeySet v9 = v8;
    swift_release();
    *(void *)(v6 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v9;
    *(_BYTE *)(v6 + 24) = 1;
    if ((a2(v9, *(void *)(a1 + 16)) & 0x80000000) == 0) {
      return v6;
    }
  }

  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t ArchiveHeader.FieldKeySet.symmetricDifference(_:)(uint64_t a1)
{
  uint64_t v2 = specialized ArchiveHeader.FieldKeySet.symmetricDifference(_:)(a1, v1);
  swift_release();
  return v2;
}

BOOL ArchiveHeader.FieldKeySet.isEmpty.getter()
{
  return AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(v0 + 16)) == 0;
}

uint64_t ArchiveHeader.FieldKeySet.startIndex.getter()
{
  return 0LL;
}

uint64_t ArchiveHeader.FieldKeySet.endIndex.getter()
{
  return AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(v0 + 16));
}

AAFieldKey ArchiveHeader.FieldKeySet.subscript.getter@<W0>(unint64_t i@<X0>, AAFieldKey *a2@<X8>)
{
  if ((i & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }

  if (HIDWORD(i))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  AAFieldKey result = AAFieldKeySetGetKey(*(AAFieldKeySet *)(v2 + 16), i);
  if ((int)(result.ikey << 8) >> 24 >= 32
    && HIBYTE(result.ikey) == 0
    && result.skey[0] >= 32
    && *(__int16 *)result.skey >> 8 > 31)
  {
    *a2 = result;
    return result;
  }

uint64_t static ArchiveHeader.FieldKeySet.== infix(_:_:)()
{
  uint64_t v0 = ArchiveHeader.FieldKeySet.description.getter();
  uint64_t v2 = v1;
  if (v0 == ArchiveHeader.FieldKeySet.description.getter() && v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t ArchiveHeader.FieldKeySet.description.getter()
{
  uint64_t v1 = type metadata accessor for String.Encoding();
  MEMORY[0x1895F8858](v1);
  uint64_t v2 = *(AAFieldKeySet_impl **)(v0 + 16);
  uint32_t KeyCount = AAFieldKeySetGetKeyCount(v2);
  if (KeyCount >> 30)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  size_t v4 = 4 * KeyCount;
  uint64_t v0 = swift_slowAlloc();
  if ((AAFieldKeySetSerialize(v2, v4, (char *)v0) & 0x80000000) == 0)
  {
    static String.Encoding.utf8.getter();
    uint64_t v5 = String.init(cString:encoding:)();
    if (v6)
    {
      uint64_t v7 = v5;
      MEMORY[0x1895C984C](v0, -1LL, -1LL);
      return v7;
    }

    goto LABEL_6;
  }

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ArchiveHeader.FieldKeySet()
{
  return ArchiveHeader.FieldKeySet.description.getter();
}

uint64_t protocol witness for SetAlgebra.init() in conformance ArchiveHeader.FieldKeySet@<X0>( uint64_t *a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  uint64_t result = (uint64_t)AAFieldKeySetCreate();
  if (result)
  {
    *(void *)(v2 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = result;
    *(_BYTE *)(v2 + 24) = 1;
    *a1 = v2;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t protocol witness for SetAlgebra.contains(_:) in conformance ArchiveHeader.FieldKeySet( AAFieldKey *a1)
{
  AAFieldKey v2 = *a1;
  int v3 = AAFieldKeySetContainsKey(*(AAFieldKeySet *)(*(void *)v1 + 16LL), v2);
  if ((v3 & 0x80000000) == 0) {
    return v3 == 1;
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance ArchiveHeader.FieldKeySet@<X0>( uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = ArchiveHeader.FieldKeySet.union(_:)(*a1);
  swift_release();
  uint64_t result = swift_release();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance ArchiveHeader.FieldKeySet@<X0>( uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = ArchiveHeader.FieldKeySet.intersection(_:)(*a1);
  uint64_t result = swift_release();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance ArchiveHeader.FieldKeySet@<X0>( uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = specialized ArchiveHeader.FieldKeySet.symmetricDifference(_:)(*a1, *v2);
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t protocol witness for SetAlgebra.insert(_:) in conformance ArchiveHeader.FieldKeySet( AAFieldKey *a1, AAFieldKey *a2)
{
  AAFieldKey v3 = *a2;
  return ArchiveHeader.FieldKeySet.insert(_:)(a1, &v3) & 1;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance ArchiveHeader.FieldKeySet@<X0>( AAFieldKey *a1@<X0>, AAFieldKey *a2@<X8>)
{
  return ArchiveHeader.FieldKeySet.remove(_:)(a1, a2);
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance ArchiveHeader.FieldKeySet@<X0>( AAFieldKey *a1@<X0>, AAFieldKey *a2@<X8>)
{
  AAFieldKey v4 = *a1;
  AAFieldKey v5 = *a1;
  uint64_t result = AAFieldKeySetInsertKey(*(AAFieldKeySet *)(*(void *)v2 + 16LL), v5);
  if ((result & 0x80000000) != 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    *a2 = v4;
    a2[1].skey[0] = 0;
  }

  return result;
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance ArchiveHeader.FieldKeySet(uint64_t a1)
{
  if ((AAFieldKeySetInsertKeySet(*(AAFieldKeySet *)(*(void *)v1 + 16LL), *(AAFieldKeySet *)(*(void *)a1 + 16LL)) & 0x80000000) == 0) {
    return swift_release();
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance ArchiveHeader.FieldKeySet( uint64_t a1)
{
  uint64_t result = AAFieldKeySetSelectKeySet(*(AAFieldKeySet *)(*(void *)v1 + 16LL), *(AAFieldKeySet *)(*(void *)a1 + 16LL));
  if ((result & 0x80000000) != 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

void protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance ArchiveHeader.FieldKeySet( uint64_t *a1)
{
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance ArchiveHeader.FieldKeySet@<X0>( uint64_t *a1@<X8>)
{
  uint64_t v2 = specialized SetAlgebra.subtracting(_:)();
  uint64_t result = swift_release();
  *a1 = v2;
  return result;
}

uint64_t protocol witness for SetAlgebra.isSubset(of:) in conformance ArchiveHeader.FieldKeySet(uint64_t *a1)
{
  return specialized SetAlgebra.isSubset(of:)(*a1) & 1;
}

uint64_t protocol witness for SetAlgebra.isDisjoint(with:) in conformance ArchiveHeader.FieldKeySet( uint64_t *a1)
{
  return specialized SetAlgebra.isDisjoint(with:)(*a1) & 1;
}

uint64_t protocol witness for SetAlgebra.isSuperset(of:) in conformance ArchiveHeader.FieldKeySet( uint64_t *a1)
{
  return specialized SetAlgebra.isSuperset(of:)(*a1) & 1;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance ArchiveHeader.FieldKeySet()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance ArchiveHeader.FieldKeySet()
{
  uint64_t v1 = *v0;
  swift_retain();
  uint64_t v2 = swift_retain();
  uint64_t v3 = specialized ArchiveHeader.FieldKeySet.symmetricDifference(_:)(v2, v1);
  swift_release();
  if ((AAFieldKeySetSelectKeySet(*(AAFieldKeySet *)(v1 + 16), *(AAFieldKeySet *)(v3 + 16)) & 0x80000000) == 0) {
    return swift_release();
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *protocol witness for BidirectionalCollection.index(before:) in conformance ArchiveHeader.FieldKeySet@<X0>( void *result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v4 = *result - 1LL;
  if (__OFSUB__(*result, 1LL))
  {
    __break(1u);
  }

  else
  {
    uint64_t result = (void *)AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(void *)v2 + 16LL));
    if (v4 < result)
    {
      *a2 = v4;
      return result;
    }
  }

  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance ArchiveHeader.FieldKeySet( unint64_t *result)
{
  unint64_t v2 = *result - 1;
  if (__OFSUB__(*result, 1LL))
  {
    __break(1u);
  }

  else
  {
    uint64_t v3 = result;
    uint64_t result = (unint64_t *)AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(void *)v1 + 16LL));
    if (v2 < result)
    {
      *uint64_t v3 = v2;
      return result;
    }
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance ArchiveHeader.FieldKeySet@<X0>( unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, MEMORY[0x1896132B8]);
  *(void *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ArchiveHeader.FieldKeySet()
{
  uint64_t v0 = ArchiveHeader.FieldKeySet.description.getter();
  uint64_t v2 = v1;
  if (v0 == ArchiveHeader.FieldKeySet.description.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance ArchiveHeader.FieldKeySet@<X0>( uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for Collection.endIndex.getter in conformance ArchiveHeader.FieldKeySet@<X0>( void *a1@<X8>)
{
  uint64_t result = AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(void *)v1 + 16LL));
  *a1 = result;
  return result;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance ArchiveHeader.FieldKeySet( AAFieldKey *a1, unint64_t *a2))()
{
  unint64_t v3 = *a2;
  if ((v3 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }

  if (HIDWORD(v3))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  AAFieldKey Key = AAFieldKeySetGetKey(*(AAFieldKeySet *)(*(void *)v2 + 16LL), v3);
  if ((int)(Key.ikey << 8) >> 24 >= 32 && HIBYTE(Key.ikey) == 0 && Key.skey[0] >= 32 && *(__int16 *)Key.skey >> 8 > 31)
  {
    *a1 = Key;
    return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
  }

uint64_t protocol witness for Collection.subscript.getter in conformance ArchiveHeader.FieldKeySet@<X0>( uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = *v2;
  uint64_t result = AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(v6 + 16));
  if (v4 < 0)
  {
    __break(1u);
  }

  else if (v5 <= result)
  {
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v6;
    return swift_retain();
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.indices.getter in conformance ArchiveHeader.FieldKeySet@<X0>( void *a1@<X8>)
{
  uint64_t result = AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(void *)v1 + 16LL));
  *a1 = 0LL;
  a1[1] = result;
  return result;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance ArchiveHeader.FieldKeySet()
{
  return AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(void *)v0 + 16LL)) == 0;
}

void *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance ArchiveHeader.FieldKeySet@<X0>( void *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }

  else
  {
    uint64_t result = (void *)AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(void *)v3 + 16LL));
    if (v5 <= result)
    {
      *a3 = v5;
      return result;
    }
  }

  __break(1u);
  return result;
}

unint64_t protocol witness for RandomAccessCollection.distance(from:to:) in conformance ArchiveHeader.FieldKeySet( unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  unint64_t v5 = *(AAFieldKeySet_impl **)(*(void *)v2 + 16LL);
  unint64_t result = AAFieldKeySetGetKeyCount(v5);
  if (v3 > result)
  {
    __break(1u);
  }

  else
  {
    unint64_t result = AAFieldKeySetGetKeyCount(v5);
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.index(after:) in conformance ArchiveHeader.FieldKeySet@<X0>( unint64_t *a1@<X0>, void *a2@<X8>)
{
  unint64_t v4 = *a1;
  uint64_t result = AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(void *)v2 + 16LL));
  if (v4 >= result)
  {
    __break(1u);
  }

  else if (!__OFADD__(v4, 1LL))
  {
    *a2 = v4 + 1;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.formIndex(after:) in conformance ArchiveHeader.FieldKeySet( unint64_t *a1)
{
  uint64_t v3 = *v1;
  unint64_t v4 = *a1;
  uint64_t result = AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(v3 + 16));
  if (v4 >= result)
  {
    __break(1u);
  }

  else if (!__OFADD__(v4, 1LL))
  {
    *a1 = v4 + 1;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.count.getter in conformance ArchiveHeader.FieldKeySet()
{
  uint64_t v1 = *(AAFieldKeySet_impl **)(*(void *)v0 + 16LL);
  uint32_t KeyCount = AAFieldKeySetGetKeyCount(v1);
  AAFieldKeySetGetKeyCount(v1);
  uint64_t result = AAFieldKeySetGetKeyCount(v1);
  __break(1u);
  return result;
}

void *protocol witness for Sequence._copyToContiguousArray() in conformance ArchiveHeader.FieldKeySet()
{
  uint64_t v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_release();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance ArchiveHeader.FieldKeySet( void *a1, uint64_t a2, unint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3);
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  return specialized _copyCollectionToContiguousArray<A>(_:)( a1,  &demangling cache variable for type metadata for _ContiguousArrayStorage<ArchiveHeader.FieldKey>,  (uint64_t (*)(uint64_t *, void *, void, uint64_t))specialized Sequence._copySequenceContents(initializing:));
}

{
  AAFieldKeySet_impl *v1;
  uint32_t KeyCount;
  void *result;
  void *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v1 = *(AAFieldKeySet_impl **)(a1 + 16);
  uint32_t KeyCount = AAFieldKeySetGetKeyCount(v1);
  AAFieldKeySetGetKeyCount(v1);
  uint64_t result = (void *)AAFieldKeySetGetKeyCount(v1);
  if (result >= KeyCount)
  {
    if (KeyCount)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ArchiveHeader.FieldKey>);
      unint64_t v4 = (void *)swift_allocObject();
      unint64_t v5 = _swift_stdlib_malloc_size(v4);
      uint64_t v6 = v5 - 32;
      if (v5 < 32) {
        uint64_t v6 = v5 - 29;
      }
      v4[2] = KeyCount;
      void v4[3] = 2 * (v6 >> 2);
      swift_retain();
      uint64_t v7 = specialized Sequence._copySequenceContents(initializing:)(&v8, (uint64_t)(v4 + 4), KeyCount);
      swift_release();
      if (v7 == KeyCount) {
        return v4;
      }
      __break(1u);
    }

    return (void *)MEMORY[0x18961AFE8];
  }

  __break(1u);
  return result;
}

{
  return specialized _copyCollectionToContiguousArray<A>(_:)( a1,  &demangling cache variable for type metadata for _ContiguousArrayStorage<ArchiveHeader.FieldType>,  (uint64_t (*)(uint64_t *, void *, void, uint64_t))specialized Sequence._copySequenceContents(initializing:));
}

{
  AAEntryXATBlob_impl *v1;
  uint32_t EntryCount;
  void *result;
  void *v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v1 = *(AAEntryXATBlob_impl **)(a1 + 16);
  uint32_t EntryCount = AAEntryXATBlobGetEntryCount(v1);
  AAEntryXATBlobGetEntryCount(v1);
  uint64_t result = (void *)AAEntryXATBlobGetEntryCount(v1);
  if (result >= EntryCount)
  {
    if (EntryCount)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ArchiveHeader.EntryXATBlob.ExtendedAttribute>);
      unint64_t v4 = (void *)swift_allocObject();
      unint64_t v5 = _swift_stdlib_malloc_size(v4);
      v4[2] = EntryCount;
      void v4[3] = 2 * ((uint64_t)(v5 - 32) / 24);
      swift_retain();
      uint64_t v6 = specialized Sequence._copySequenceContents(initializing:)(&v7, (uint64_t)(v4 + 4), EntryCount);
      swift_release();
      if (v6 == (void *)EntryCount) {
        return v4;
      }
      __break(1u);
    }

    return (void *)MEMORY[0x18961AFE8];
  }

  __break(1u);
  return result;
}

{
  AAHeader_impl *v1;
  uint32_t FieldCount;
  void *result;
  void *v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v1 = *(AAHeader_impl **)(a1 + 16);
  uint32_t FieldCount = AAHeaderGetFieldCount(v1);
  AAHeaderGetFieldCount(v1);
  uint64_t result = (void *)AAHeaderGetFieldCount(v1);
  if (result >= FieldCount)
  {
    if (FieldCount)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ArchiveHeader.Field>);
      unint64_t v4 = (void *)swift_allocObject();
      unint64_t v5 = _swift_stdlib_malloc_size(v4);
      uint64_t v6 = v5 - 32;
      if (v5 < 32) {
        uint64_t v6 = v5 - 1;
      }
      v4[2] = FieldCount;
      void v4[3] = 2 * (v6 >> 5);
      swift_retain();
      uint64_t v7 = specialized Sequence._copySequenceContents(initializing:)(&v8, (uint64_t)(v4 + 4), FieldCount);
      swift_release();
      if (v7 == (void *)FieldCount) {
        return v4;
      }
      __break(1u);
    }

    return (void *)MEMORY[0x18961AFE8];
  }

  __break(1u);
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)( uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t *, void *, void, uint64_t))
{
  uint64_t v6 = *(AAHeader_impl **)(a1 + 16);
  uint32_t FieldCount = AAHeaderGetFieldCount(v6);
  AAHeaderGetFieldCount(v6);
  uint64_t result = (void *)AAHeaderGetFieldCount(v6);
  if (result >= FieldCount)
  {
    if (FieldCount)
    {
      __swift_instantiateConcreteTypeFromMangledName(a2);
      AAFieldKeySet v9 = (void *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 29;
      }
      v9[2] = FieldCount;
      void v9[3] = 2 * (v11 >> 2);
      swift_retain();
      uint64_t v12 = a3(&v13, v9 + 4, FieldCount, a1);
      swift_release();
      if (v12 == FieldCount) {
        return v9;
      }
      __break(1u);
    }

    return (void *)MEMORY[0x18961AFE8];
  }

  __break(1u);
  return result;
}

void specialized _copyCollectionToContiguousArray<A>(_:)( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  int64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_9:
    __break(1u);
    return;
  }

  if (v5)
  {
    if (v5 <= 0)
    {
      AAFieldKeySet v8 = (void *)MEMORY[0x18961AFE8];
      if (v4 != a3) {
        goto LABEL_5;
      }
    }

    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
      AAFieldKeySet v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      uint64_t v8[3] = 2 * v9 - 64;
      if (v4 != a3)
      {
LABEL_5:
        memcpy(v8 + 4, (const void *)(a2 + a3), v5);
        return;
      }
    }

    __break(1u);
    goto LABEL_9;
  }

uint64_t specialized Sequence._copySequenceContents(initializing:)( void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (!a2)
  {
    unint64_t v9 = 0LL;
    goto LABEL_18;
  }

  if (!a3)
  {
LABEL_17:
    unint64_t v9 = a3;
    goto LABEL_18;
  }

  if ((a3 & 0x8000000000000000LL) == 0)
  {
    AAFieldKeySet v8 = *(AAHeader_impl **)(a4 + 16);
    unint64_t v9 = 0LL;
    if (AAHeaderGetFieldCount(v8))
    {
      do
      {
        AAFieldKey FieldKey = AAHeaderGetFieldKey(v8, v9);
        AAFieldKey v12 = FieldKey;
        if (v9 >= AAHeaderGetFieldCount(v8))
        {
          __break(1u);
          goto LABEL_20;
        }

        *(AAFieldKey *)(a2 + 4 * v9) = v12;
        if (a3 - 1 == v9) {
          goto LABEL_17;
        }
      }

      while (++v9 != AAHeaderGetFieldCount(v8));
    }

LABEL_18:
    *a1 = a4;
    a1[1] = v9;
    return v9;
  }

    *a1 = v3;
    a1[1] = v8;
    return v8;
  }

LABEL_20:
  __break(1u);
LABEL_21:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

  __break(1u);
LABEL_21:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)( void *a1, uint64_t a2, unint64_t a3)
{
  if (!a2)
  {
    unint64_t v8 = 0LL;
    goto LABEL_18;
  }

  if (!a3)
  {
LABEL_17:
    unint64_t v8 = a3;
    goto LABEL_18;
  }

  if ((a3 & 0x8000000000000000LL) == 0)
  {
    uint64_t v7 = *(AAFieldKeySet_impl **)(v3 + 16);
    unint64_t v8 = 0LL;
    if (AAFieldKeySetGetKeyCount(v7))
    {
      do
      {
        AAFieldKey Key = AAFieldKeySetGetKey(v7, v8);
        AAFieldKey v11 = Key;
        if (v8 >= AAFieldKeySetGetKeyCount(v7))
        {
          __break(1u);
          goto LABEL_20;
        }

        *(AAFieldKey *)(a2 + 4 * v8) = v11;
        if (a3 - 1 == v8) {
          goto LABEL_17;
        }
      }

      while (++v8 != AAFieldKeySetGetKeyCount(v7));
    }

uint64_t specialized Sequence._copySequenceContents(initializing:)( void *a1, int *a2, unint64_t a3, uint64_t a4)
{
  if (!a2) {
    goto LABEL_15;
  }
  unint64_t v6 = a3;
  if (!a3) {
    goto LABEL_16;
  }
  if ((a3 & 0x8000000000000000LL) != 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  unint64_t v8 = *(AAHeader_impl **)(a4 + 16);
  if (!AAHeaderGetFieldCount(v8))
  {
LABEL_15:
    unint64_t v6 = 0LL;
    goto LABEL_16;
  }

  int FieldType = AAHeaderGetFieldType(v8, 0);
  if ((FieldType & 0x80000000) == 0)
  {
    int v10 = FieldType;
    if (!AAHeaderGetFieldCount(v8))
    {
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }

    *a2 = v10;
    if (v6 != 1)
    {
      unint64_t v11 = 1LL;
      while (v6 != v11)
      {
        if (v11 == AAHeaderGetFieldCount(v8))
        {
          unint64_t v6 = v11;
          goto LABEL_16;
        }

        int v12 = AAHeaderGetFieldType(v8, v11);
        if (v12 < 0) {
          goto LABEL_22;
        }
        int v13 = v12;
        if (v11 >= AAHeaderGetFieldCount(v8)) {
          goto LABEL_19;
        }
        a2[v11++] = v13;
        if (v6 == v11) {
          goto LABEL_16;
        }
      }

      __break(1u);
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }

LABEL_16:
    *a1 = a4;
    a1[1] = v6;
    return v6;
  }

LABEL_22:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *specialized Sequence._copySequenceContents(initializing:)( void *result, uint64_t a2, unint64_t a3)
{
  unint64_t v4 = result;
  if (!a2)
  {
LABEL_12:
    unint64_t v5 = 0LL;
    goto LABEL_13;
  }

  unint64_t v5 = a3;
  if (!a3)
  {
LABEL_13:
    *unint64_t v4 = v3;
    v4[1] = v5;
    return (void *)v5;
  }

  if ((a3 & 0x8000000000000000LL) == 0)
  {
    uint64_t v6 = a2;
    uint64_t v7 = *(AAEntryXATBlob_impl **)(v3 + 16);
    if (AAEntryXATBlobGetEntryCount(v7))
    {
      ArchiveHeader.EntryXATBlob._attribute(at:)(0LL, &v12);
      uint64_t v8 = v12;
      __int128 v11 = v13;
      if (AAEntryXATBlobGetEntryCount(v7))
      {
        unint64_t v9 = 1LL;
        do
        {
          *(void *)uint64_t v6 = v8;
          *(_OWORD *)(v6 + 8) = v11;
          if (v5 == v9) {
            goto LABEL_13;
          }
          if (v9 == AAEntryXATBlobGetEntryCount(v7))
          {
            unint64_t v5 = v9;
            goto LABEL_13;
          }

          ArchiveHeader.EntryXATBlob._attribute(at:)(v9, &v12);
          uint64_t v8 = v12;
          __int128 v11 = v13;
          v6 += 24LL;
        }

        while (v9++ < AAEntryXATBlobGetEntryCount(v7));
      }

      __break(1u);
    }

    goto LABEL_12;
  }

  __break(1u);
  return result;
}

{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  AAHeader_impl *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  unint64_t v4 = result;
  if (!a2)
  {
LABEL_12:
    unint64_t v5 = 0LL;
    goto LABEL_13;
  }

  unint64_t v5 = a3;
  if (!a3)
  {
LABEL_13:
    *unint64_t v4 = v3;
    v4[1] = v5;
    return (void *)v5;
  }

  if ((a3 & 0x8000000000000000LL) == 0)
  {
    uint64_t v6 = a2;
    uint64_t v7 = *(AAHeader_impl **)(v3 + 16);
    if (AAHeaderGetFieldCount(v7))
    {
      uint64_t v14 = v4;
      ArchiveHeader._field(at:)(0LL, (uint64_t)&v15);
      uint64_t v8 = v15;
      unint64_t v9 = v16;
      int v10 = v17;
      __int128 v11 = v18;
      if (AAHeaderGetFieldCount(v7))
      {
        uint64_t v12 = 1LL;
        while (1)
        {
          *(void *)uint64_t v6 = v8;
          *(void *)(v6 + 8) = v9;
          *(void *)(v6 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v10;
          *(_BYTE *)(v6 + 24) = v11;
          if (v5 == v12)
          {
            unint64_t v4 = v14;
            goto LABEL_13;
          }

          if (v12 == AAHeaderGetFieldCount(v7)) {
            break;
          }
          unint64_t v4 = (void *)(v12 + 1);
          ArchiveHeader._field(at:)(v12, (uint64_t)&v15);
          uint64_t v8 = v15;
          unint64_t v9 = v16;
          int v10 = v17;
          __int128 v11 = v18;
          v6 += 32LL;
          if (v12++ >= AAHeaderGetFieldCount(v7)) {
            goto LABEL_11;
          }
        }

        unint64_t v5 = v12;
        unint64_t v4 = v14;
        goto LABEL_13;
      }

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  AAFieldKeySet v3 = AAFieldKeySetCreate();
  if (!v3) {
    goto LABEL_10;
  }
  unint64_t v4 = v3;
  *(void *)(v2 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v3;
  *(_BYTE *)(v2 + 24) = 1;
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v6 = (AAFieldKey *)(a1 + 32);
    while (1)
    {
      AAFieldKey v8 = *v6++;
      AAFieldKey v7 = v8;
      AAFieldKey v9 = v8;
      int v10 = AAFieldKeySetContainsKey(v4, v9);
      if (v10 < 0) {
        break;
      }
      if (v10 != 1)
      {
        AAFieldKey v11 = v7;
        if (AAFieldKeySetInsertKey(v4, v11) < 0) {
          break;
        }
      }

      if (!--v5) {
        return v2;
      }
    }

    while (1)
    {
LABEL_10:
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }

  return v2;
}

uint64_t specialized ArchiveHeader.FieldKeySet.symmetricDifference(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = AAFieldKeySetClone(*(AAFieldKeySet *)(a2 + 16));
  if (!v5
    || (v6 = v5, *(void *)(v4 + 16) = v5, *(_BYTE *)(v4 + 24) = 1, (AAFieldKey v7 = AAFieldKeySetClone(v5)) == 0LL)
    || (AAFieldKey v8 = v7, v9 = *(AAFieldKeySet_impl **)(a1 + 16), AAFieldKeySetSelectKeySet(v7, v9) < 0)
    || AAFieldKeySetInsertKeySet(v6, v9) < 0
    || AAFieldKeySetRemoveKeySet(v6, v8) < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    swift_release();
    AAFieldKeySetDestroy(v8);
    return v4;
  }

  return result;
}

uint64_t base witness table accessor for BidirectionalCollection in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet( &lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet,  (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet);
}

uint64_t type metadata accessor for ArchiveHeader.FieldKeySet()
{
  uint64_t result = type metadata singleton initialization cache for ArchiveHeader.FieldKeySet;
  if (!type metadata singleton initialization cache for ArchiveHeader.FieldKeySet) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader.FieldKeySet> and conformance <> Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader.FieldKeySet> and conformance <> Slice<A>,  &lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet,  (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet,  MEMORY[0x18961A5E0]);
}

uint64_t base witness table accessor for Equatable in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet( &lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet,  (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet);
}

uint64_t base witness table accessor for ExpressibleByArrayLiteral in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet( &lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet,  (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet);
}

uint64_t base witness table accessor for Collection in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet( &lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet,  (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader.FieldKeySet> and conformance <> Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader.FieldKeySet> and conformance <> Slice<A>,  &lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet,  (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet,  MEMORY[0x18961A5C8]);
}

uint64_t lazy protocol witness table accessor for type Slice<ArchiveHeader.FieldKeySet> and conformance <> Slice<A>( unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<ArchiveHeader.FieldKeySet>);
    uint64_t v10 = lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet( a2,  a3);
    uint64_t result = MEMORY[0x1895C97D4](a4, v9, &v10);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t base witness table accessor for Sequence in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet( &lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet,  (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet);
}

uint64_t lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet( unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for ArchiveHeader.FieldKeySet();
    uint64_t result = MEMORY[0x1895C97D4](a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>( &lazy protocol witness table cache variable for type Slice<ArchiveHeader.FieldKeySet> and conformance Slice<A>,  &demangling cache variable for type metadata for Slice<ArchiveHeader.FieldKeySet>,  MEMORY[0x18961A5E8]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>( &lazy protocol witness table cache variable for type IndexingIterator<ArchiveHeader.FieldKeySet> and conformance IndexingIterator<A>,  &demangling cache variable for type metadata for IndexingIterator<ArchiveHeader.FieldKeySet>,  MEMORY[0x189619678]);
}

ValueMetadata *type metadata accessor for _AAFieldKeySetTraits()
{
  return &type metadata for _AAFieldKeySetTraits;
}

uint64_t method lookup function for ArchiveHeader.FieldKeySet()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveHeader.FieldKeySet.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ArchiveHeader.FieldKeySet.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ArchiveHeader.FieldKeySet.__allocating_init(copying:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

void protocol witness for static _AAObjectTraits.aaDestroy(_:) in conformance AEAContextTraits( AEAContext *a1)
{
}

void specialized P256.Signing.PublicKey.withUnsafeX963Bytes<A>(_:)( uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5 = swift_retain_n();
  a4(v5);
  __asm { BR              X10 }

uint64_t sub_188628574( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t buf, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22)
{
  uint64_t v28 = v24;
  __int16 v29 = v22;
  char v30 = BYTE2(v22);
  char v31 = BYTE3(v22);
  char v32 = BYTE4(v22);
  char v33 = BYTE5(v22);
  if (AEAContextSetFieldBlob(*(AEAContext *)(v23 + 16), v25, 1u, (const uint8_t *)&v28, BYTE6(v22)) < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *uint64_t v26 = 1;
    swift_willThrow();
  }

  outlined consume of Data._Representation(v24, v22);
  return swift_release_n();
}

uint64_t ArchiveEncryptionContext.__allocating_init(profile:compressionAlgorithm:compressionBlockSize:)( AEAProfile *a1, unsigned int *a2, unint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  ArchiveEncryptionContext.init(profile:compressionAlgorithm:compressionBlockSize:)(a1, a2, a3);
  return v6;
}

uint64_t ArchiveEncryptionContext.init(profile:compressionAlgorithm:compressionBlockSize:)( AEAProfile *a1, unsigned int *a2, unint64_t a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = AEAContextCreateWithProfile(*a1);
  if (v6)
  {
    AAFieldKey v7 = v6;
    if ((AEAContextSetFieldUInt(v6, 3u, v5) & 0x80000000) == 0)
    {
      uint64_t v8 = a3 >= 0xFFFFFFFF ? 0xFFFFFFFFLL : a3;
      if ((AEAContextSetFieldUInt(v7, 4u, v8) & 0x80000000) == 0)
      {
        *(void *)(v3 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v7;
        *(_BYTE *)(v3 + 24) = 1;
        return v3;
      }
    }

    AEAContextDestroy(v7);
  }

  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t AEAContextSetCompressionAlgorithm(AEAContext_impl *a1, uint64_t value)
{
  return AEAContextSetFieldUInt(a1, 3u, value);
}

uint64_t AEAContextSetCompressionBlockSize(AEAContext_impl *a1, unint64_t a2)
{
  if (a2 >= 0xFFFFFFFF) {
    uint64_t v2 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v2 = a2;
  }
  return AEAContextSetFieldUInt(a1, 4u, v2);
}

AAByteStream_impl *ArchiveEncryptionContext.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  swift_beginAccess();
  uint64_t result = *(AAByteStream_impl **)(a1 + 16);
  if (result)
  {
    AEAContext v4 = AEAContextCreateWithEncryptedStream(result);
    swift_release();
    if (v4)
    {
      *(void *)(v2 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v4;
      *(_BYTE *)(v2 + 24) = 1;
    }

    else
    {
      swift_deallocPartialClassInstance();
      return 0LL;
    }

    return (AAByteStream_impl *)v2;
  }

  else
  {
    __break(1u);
  }

  return result;
}

AAByteStream_impl *ArchiveEncryptionContext.init(from:)(uint64_t a1)
{
  uint64_t result = *(AAByteStream_impl **)(a1 + 16);
  if (result)
  {
    AEAContext v4 = AEAContextCreateWithEncryptedStream(result);
    swift_release();
    if (v4)
    {
      *(void *)(v1 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v4;
      *(_BYTE *)(v1 + 24) = 1;
    }

    else
    {
      type metadata accessor for ArchiveEncryptionContext();
      swift_deallocPartialClassInstance();
      return 0LL;
    }

    return (AAByteStream_impl *)v1;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t type metadata accessor for ArchiveEncryptionContext()
{
  uint64_t result = type metadata singleton initialization cache for ArchiveEncryptionContext;
  if (!type metadata singleton initialization cache for ArchiveEncryptionContext) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ArchiveEncryptionContext.profile.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = AEAContextGetFieldUInt(*(AEAContext *)(v1 + 16), 0);
  *a1 = result;
  return result;
}

uint64_t ArchiveEncryptionContext.signatureMode.getter@<X0>(int *a1@<X8>)
{
  uint64_t result = AEAContextGetFieldUInt(*(AEAContext *)(v1 + 16), 0);
  else {
    int v4 = dword_18862F8D4[(int)result];
  }
  *a1 = v4;
  return result;
}

uint64_t ArchiveEncryptionContext.encryptionMode.getter@<X0>(int *a1@<X8>)
{
  uint64_t result = AEAContextGetFieldUInt(*(AEAContext *)(v1 + 16), 0);
  else {
    int v4 = dword_18862F8EC[(int)result];
  }
  *a1 = v4;
  return result;
}

uint64_t key path setter for ArchiveEncryptionContext.paddingSize : ArchiveEncryptionContext( uint64_t *a1, uint64_t a2)
{
  if ((*a1 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }

  uint64_t result = AEAContextSetPaddingSize(*(AEAContext_impl **)(*(void *)a2 + 16LL), *a1);
  if ((_DWORD)result)
  {
LABEL_5:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t ArchiveEncryptionContext.paddingSize.getter()
{
  return ArchiveEncryptionContext.paddingSize.getter(1u);
}

uint64_t AEAContextGetPaddingSize(AEAContext_impl *a1)
{
  return AEAContextGetFieldUInt(a1, 1u);
}

uint64_t ArchiveEncryptionContext.paddingSize.setter(uint64_t value)
{
  if ((value & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }

  uint64_t result = AEAContextSetFieldUInt(*(AEAContext *)(v1 + 16), 1u, value);
  if ((_DWORD)result)
  {
LABEL_5:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t AEAContextSetPaddingSize(AEAContext_impl *a1, uint64_t value)
{
  return AEAContextSetFieldUInt(a1, 1u, value);
}

uint64_t ArchiveEncryptionContext.paddingSize.modify(uint64_t *a1)
{
  uint64_t v3 = *(AEAContext_impl **)(v1 + 16);
  a1[1] = (uint64_t)v3;
  uint64_t result = AEAContextGetFieldUInt(v3, 1u);
  if ((result & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else
  {
    *a1 = result;
    return (uint64_t)ArchiveEncryptionContext.paddingSize.modify;
  }

  return result;
}

uint64_t ArchiveEncryptionContext.paddingSize.modify(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)a1;
  if ((a2 & 1) != 0)
  {
    if ((v2 & 0x8000000000000000LL) == 0) {
      goto LABEL_5;
    }
    __break(1u);
  }

  if ((v2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }

LABEL_5:
  uint64_t result = AEAContextSetFieldUInt(*(AEAContext *)(a1 + 8), 1u, v2);
  if ((_DWORD)result)
  {
LABEL_8:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t ArchiveEncryptionContext.checksumMode.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = AEAContextGetFieldUInt(*(AEAContext *)(v1 + 16), 2u);
  *a1 = result;
  return result;
}

uint64_t AEAContextGetChecksumMode(AEAContext_impl *a1)
{
  return AEAContextGetFieldUInt(a1, 2u);
}

uint64_t ArchiveEncryptionContext.checksumMode.setter(unsigned int *a1)
{
  return ArchiveEncryptionContext.checksumMode.setter(a1, 2u);
}

uint64_t AEAContextSetChecksumMode(AEAContext_impl *a1, uint64_t value)
{
  return AEAContextSetFieldUInt(a1, 2u, value);
}

uint64_t (*ArchiveEncryptionContext.checksumMode.modify(uint64_t a1))(uint64_t a1, int a2)
{
  uint64_t v3 = *(AEAContext_impl **)(v1 + 16);
  *(void *)a1 = v3;
  *(_DWORD *)(a1 + 8) = AEAContextGetFieldUInt(v3, 2u);
  return ArchiveEncryptionContext.checksumMode.modify;
}

uint64_t ArchiveEncryptionContext.checksumMode.modify(uint64_t a1, int a2)
{
  return ArchiveEncryptionContext.checksumMode.modify(a1, a2, 2u);
}

uint64_t key path setter for ArchiveEncryptionContext.checksumMode : ArchiveEncryptionContext( unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void))
{
  uint64_t result = a5(*(void *)(*(void *)a2 + 16LL), *a1);
  if ((_DWORD)result)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t ArchiveEncryptionContext.compressionAlgorithm.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = AEAContextGetFieldUInt(*(AEAContext *)(v1 + 16), 3u);
  *a1 = result;
  return result;
}

uint64_t AEAContextGetCompressionAlgorithm(AEAContext_impl *a1)
{
  return AEAContextGetFieldUInt(a1, 3u);
}

uint64_t ArchiveEncryptionContext.compressionAlgorithm.setter(unsigned int *a1)
{
  return ArchiveEncryptionContext.checksumMode.setter(a1, 3u);
}

uint64_t ArchiveEncryptionContext.checksumMode.setter(unsigned int *a1, AEAContextField a2)
{
  uint64_t result = AEAContextSetFieldUInt(*(AEAContext *)(v2 + 16), a2, *a1);
  if ((_DWORD)result)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t (*ArchiveEncryptionContext.compressionAlgorithm.modify(uint64_t a1))(uint64_t a1, int a2)
{
  uint64_t v3 = *(AEAContext_impl **)(v1 + 16);
  *(void *)a1 = v3;
  *(_DWORD *)(a1 + 8) = AEAContextGetFieldUInt(v3, 3u);
  return ArchiveEncryptionContext.compressionAlgorithm.modify;
}

uint64_t ArchiveEncryptionContext.compressionAlgorithm.modify(uint64_t a1, int a2)
{
  return ArchiveEncryptionContext.checksumMode.modify(a1, a2, 3u);
}

uint64_t ArchiveEncryptionContext.checksumMode.modify(uint64_t a1, int a2, AEAContextField field)
{
  uint64_t result = AEAContextSetFieldUInt(*(AEAContext *)a1, field, *(unsigned int *)(a1 + 8));
  if ((_DWORD)result)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t key path setter for ArchiveEncryptionContext.compressionBlockSize : ArchiveEncryptionContext( unint64_t *a1, uint64_t a2)
{
  uint64_t result = AEAContextSetCompressionBlockSize(*(AEAContext_impl **)(*(void *)a2 + 16LL), *a1);
  if ((_DWORD)result)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t ArchiveEncryptionContext.compressionBlockSize.getter()
{
  return AEAContextGetFieldUInt(*(AEAContext *)(v0 + 16), 4u);
}

uint64_t AEAContextGetCompressionBlockSize(AEAContext_impl *a1)
{
  return AEAContextGetFieldUInt(a1, 4u);
}

uint64_t ArchiveEncryptionContext.compressionBlockSize.setter(unint64_t a1)
{
  if (a1 >= 0xFFFFFFFF) {
    uint64_t v2 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v2 = a1;
  }
  uint64_t result = AEAContextSetFieldUInt(*(AEAContext *)(v1 + 16), 4u, v2);
  if ((_DWORD)result)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t (*ArchiveEncryptionContext.compressionBlockSize.modify(uint64_t *a1))(uint64_t a1)
{
  uint64_t v3 = *(AEAContext_impl **)(v1 + 16);
  a1[1] = (uint64_t)v3;
  *a1 = AEAContextGetFieldUInt(v3, 4u);
  return ArchiveEncryptionContext.compressionBlockSize.modify;
}

uint64_t ArchiveEncryptionContext.compressionBlockSize.modify(uint64_t a1)
{
  if (*(void *)a1 >= 0xFFFFFFFFuLL) {
    uint64_t v1 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v1 = *(void *)a1;
  }
  uint64_t result = AEAContextSetFieldUInt(*(AEAContext *)(a1 + 8), 4u, v1);
  if ((_DWORD)result)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  return result;
}

uint64_t ArchiveEncryptionContext.rawSize.getter()
{
  return ArchiveEncryptionContext.paddingSize.getter(0xDu);
}

uint64_t ArchiveEncryptionContext.containerSize.getter()
{
  return ArchiveEncryptionContext.paddingSize.getter(0xEu);
}

uint64_t ArchiveEncryptionContext.paddingSize.getter(AEAContextField field)
{
  uint64_t result = AEAContextGetFieldUInt(*(AEAContext *)(v1 + 16), field);
  if ((result & 0x8000000000000000LL) != 0) {
    __break(1u);
  }
  return result;
}

uint64_t key path getter for ArchiveEncryptionContext.symmetricKey : ArchiveEncryptionContext@<X0>( uint64_t a1@<X8>)
{
  if (ArchiveEncryptionContext._getBlob(field:representation:)(9u, 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
    lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>,  MEMORY[0x189607390]);
    SymmetricKey.init<A>(data:)();
    uint64_t v2 = type metadata accessor for SymmetricKey();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(a1, 0LL, 1LL, v2);
  }

  else
  {
    uint64_t v4 = type metadata accessor for SymmetricKey();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))( a1,  1LL,  1LL,  v4);
  }

uint64_t ArchiveEncryptionContext.symmetricKey.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x1895F8858](v2);
  uint64_t v4 = (char *)&v11[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of SymmetricKey?(a1, (uint64_t)v4);
  uint64_t v5 = type metadata accessor for SymmetricKey();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5) == 1)
  {
    __break(1u);
    MEMORY[0x1895C9780](v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    uint64_t v12 = v5;
    __int128 v13 = &protocol witness table for SymmetricKey;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
    (*(void (**)(uint64_t *, char *, uint64_t))(v6 + 32))(boxed_opaque_existential_1, v4, v5);
    uint64_t v8 = __swift_project_boxed_opaque_existential_1(v11, v12);
    MEMORY[0x1895F8858](v8);
    SymmetricKey.withUnsafeBytes<A>(_:)();
    outlined destroy of SymmetricKey?(a1);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }

  return result;
}

uint64_t outlined init with copy of SymmetricKey?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t ArchiveEncryptionContext.symmetricKey.getter@<X0>(uint64_t a1@<X8>)
{
  buf_size[1] = *MEMORY[0x1895F89C0];
  buf_size[0] = 0LL;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 9u, 0, 0LL, 0LL, buf_size) < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    int64_t v3 = buf_size[0];
    if (buf_size[0])
    {
      swift_retain();
      uint64_t v4 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v3, v1, 9u, 0, buf_size);
      swift_release();
      buf_size[0] = v4;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>,  MEMORY[0x189607390]);
      SymmetricKey.init<A>(data:)();
      uint64_t v5 = type metadata accessor for SymmetricKey();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))( a1,  0LL,  1LL,  v5);
    }

    else
    {
      uint64_t v7 = type metadata accessor for SymmetricKey();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( a1,  1LL,  1LL,  v7);
    }
  }

  return result;
}

void (*ArchiveEncryptionContext.symmetricKey.modify(size_t **a1))(uint64_t a1, char a2)
{
  int64_t v3 = (size_t *)malloc(0x28uLL);
  *a1 = v3;
  _OWORD v3[2] = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?)
                             - 8)
                 + 64LL);
  v3[3] = (size_t)malloc(v4);
  uint64_t v5 = malloc(v4);
  v3[4] = (size_t)v5;
  *int64_t v3 = 0LL;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 9u, 0, 0LL, 0LL, v3) < 0)
  {
    uint64_t result = (void (*)(uint64_t, char))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    int64_t v6 = *v3;
    if (*v3)
    {
      swift_retain();
      uint64_t v7 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v6, v1, 9u, 0, v3);
      swift_release();
      v3[1] = v7;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>,  MEMORY[0x189607390]);
      SymmetricKey.init<A>(data:)();
      uint64_t v8 = type metadata accessor for SymmetricKey();
      (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v5, 0LL, 1LL, v8);
    }

    else
    {
      uint64_t v9 = type metadata accessor for SymmetricKey();
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v5, 1LL, 1LL, v9);
    }

    return ArchiveEncryptionContext.symmetricKey.modify;
  }

  return result;
}

void ArchiveEncryptionContext.symmetricKey.modify(uint64_t a1, char a2)
{
}

uint64_t key path getter for ArchiveEncryptionContext.password : ArchiveEncryptionContext@<X0>( uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for String.Encoding();
  MEMORY[0x1895F8858](v2);
  uint64_t result = ArchiveEncryptionContext._getBlob(field:representation:)(0x13u, 0);
  if (result)
  {
    static String.Encoding.utf8.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
    lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance ContiguousArray<A>,  MEMORY[0x189619578]);
    uint64_t v4 = String.init<A>(bytes:encoding:)();
    uint64_t v6 = v5;
    uint64_t result = swift_release();
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

  *a1 = v4;
  a1[1] = v6;
  return result;
}

uint64_t ArchiveEncryptionContext.password.setter(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v4[0] = a1;
    v4[1] = a2;
    swift_retain();
    swift_bridgeObjectRetain();
    specialized String.withUTF8<A>(_:)(v4, v2, 0x13u);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }

  else
  {
    while (1)
    {
      uint64_t result = AEAContextSetFieldBlob(*(AEAContext *)(v2 + 16), 0x13u, 0, 0LL, 0LL);
      if ((result & 0x80000000) == 0) {
        break;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }

  return result;
}

uint64_t ArchiveEncryptionContext.password.getter()
{
  buf_size[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = type metadata accessor for String.Encoding();
  MEMORY[0x1895F8858](v1);
  buf_size[0] = 0LL;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v0 + 16), 0x13u, 0, 0LL, 0LL, buf_size) < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    int64_t v2 = buf_size[0];
    if (!buf_size[0]) {
      return 0LL;
    }
    swift_retain();
    uint64_t v3 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v2, v0, 0x13u, 0, buf_size);
    swift_release();
    buf_size[0] = v3;
    static String.Encoding.utf8.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
    lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance ContiguousArray<A>,  MEMORY[0x189619578]);
    uint64_t v4 = String.init<A>(bytes:encoding:)();
    swift_bridgeObjectRelease();
    return v4;
  }

  return result;
}

void (*ArchiveEncryptionContext.password.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t v4 = type metadata accessor for String.Encoding();
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64LL));
  _OWORD v3[2] = 0LL;
  uint64_t v6 = v3 + 2;
  v3[5] = v5;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 0x13u, 0, 0LL, 0LL, v3 + 2) < 0)
  {
    uint64_t result = (void (*)(uint64_t **, char))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    int64_t v7 = *v6;
    if (*v6)
    {
      swift_retain();
      uint64_t v8 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v7, v1, 0x13u, 0, v3 + 2);
      swift_release();
      v3[3] = v8;
      static String.Encoding.utf8.getter();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance ContiguousArray<A>,  MEMORY[0x189619578]);
      uint64_t v9 = String.init<A>(bytes:encoding:)();
      uint64_t v11 = v10;
      swift_bridgeObjectRelease();
    }

    else
    {
      uint64_t v9 = 0LL;
      uint64_t v11 = 0LL;
    }

    *uint64_t v3 = v9;
    v3[1] = v11;
    return ArchiveEncryptionContext.password.modify;
  }

  return result;
}

void ArchiveEncryptionContext.password.modify(uint64_t **a1, char a2)
{
  int64_t v2 = *a1;
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  uint64_t v5 = (void *)(*a1)[5];
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    ArchiveEncryptionContext.password.setter(v4, v3);
    swift_bridgeObjectRelease();
  }

  else
  {
    ArchiveEncryptionContext.password.setter(**a1, v3);
  }

  free(v5);
  free(v2);
}

uint64_t ArchiveEncryptionContext.generateSymmetricKey()@<X0>(uint64_t a1@<X8>)
{
  buf_size[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  uint64_t v4 = MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)buf_size - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v4);
  uint64_t v8 = (char *)buf_size - v7;
  uint64_t v9 = *(AEAContext_impl **)(v1 + 16);
  if (AEAContextGenerateFieldBlob(v9, 9u) < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *uint64_t v16 = 1;
    return swift_willThrow();
  }

  buf_size[0] = 0LL;
  if (AEAContextGetFieldBlob(v9, 9u, 0, 0LL, 0LL, buf_size) < 0) {
    goto LABEL_11;
  }
  int64_t v10 = buf_size[0];
  if (!buf_size[0])
  {
    uint64_t v17 = type metadata accessor for SymmetricKey();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v8, 1LL, 1LL, v17);
    goto LABEL_9;
  }

  swift_retain();
  uint64_t v11 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v10, v1, 9u, 0, buf_size);
  swift_release();
  buf_size[0] = v11;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
  lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>,  MEMORY[0x189607390]);
  SymmetricKey.init<A>(data:)();
  uint64_t v12 = type metadata accessor for SymmetricKey();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0LL, 1LL, v12);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v14(v8, 1LL, v12) == 1)
  {
LABEL_9:
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *AAByteStream v18 = 1;
    swift_willThrow();
    return outlined destroy of SymmetricKey?((uint64_t)v8);
  }

  outlined init with copy of SymmetricKey?((uint64_t)v8, (uint64_t)v6);
  if (v14(v6, 1LL, v12) != 1)
  {
    outlined destroy of SymmetricKey?((uint64_t)v8);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a1, v6, v12);
  }

  __break(1u);
LABEL_11:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ArchiveEncryptionContext.generatePassword()()
{
  buf_size[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = type metadata accessor for String.Encoding();
  MEMORY[0x1895F8858](v1);
  uint64_t v3 = (char *)buf_size - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = *(AEAContext_impl **)(v0 + 16);
  if (AEAContextGenerateFieldBlob(v4, 0x13u) < 0) {
    goto LABEL_5;
  }
  buf_size[0] = 0LL;
  if (AEAContextGetFieldBlob(v4, 0x13u, 0, 0LL, 0LL, buf_size) < 0)
  {
    uint64_t v9 = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_8;
  }

  int64_t v5 = buf_size[0];
  if (!buf_size[0]) {
    goto LABEL_5;
  }
  swift_retain();
  uint64_t v6 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v5, v0, 0x13u, 0, buf_size);
  swift_release();
  buf_size[0] = v6;
  static String.Encoding.utf8.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
  lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance ContiguousArray<A>,  MEMORY[0x189619578]);
  uint64_t v0 = String.init<A>(bytes:encoding:)();
  uint64_t v3 = v7;
  swift_bridgeObjectRelease();
  if (!v3)
  {
LABEL_5:
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *uint64_t v8 = 1;
    swift_willThrow();
  }

  uint64_t v9 = v0;
  int64_t v10 = v3;
LABEL_8:
  result._object = v10;
  result._countAndFlagsBits = v9;
  return result;
}

uint64_t ArchiveEncryptionContext.setSymmetricKey(_:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SymmetricKey();
  uint64_t v6 = v2;
  uint64_t v7 = &protocol witness table for SymmetricKey;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v5);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(boxed_opaque_existential_1, a1, v2);
  __swift_project_boxed_opaque_existential_1(v5, v6);
  SymmetricKey.withUnsafeBytes<A>(_:)();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ArchiveEncryptionContext.setPassword(_:)( Swift::String a1)
{
  Swift::String v2 = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  specialized String.withUTF8<A>(_:)(&v2._countAndFlagsBits, v1, 0x13u);
  swift_bridgeObjectRelease();
}

void ArchiveEncryptionContext.setSigningPublicKey(_:)(uint64_t a1)
{
}

void ArchiveEncryptionContext.setSigningPrivateKey(_:)(uint64_t a1)
{
}

void ArchiveEncryptionContext.setRecipientPublicKey(_:)(uint64_t a1)
{
}

void ArchiveEncryptionContext.setRecipientPrivateKey(_:)(uint64_t a1)
{
}

uint64_t key path getter for ArchiveEncryptionContext.authData : ArchiveEncryptionContext@<X0>( uint64_t *a1@<X8>)
{
  uint64_t result = ArchiveEncryptionContext._getBlob(field:representation:)(5u, 0);
  if (result)
  {
    uint64_t v3 = specialized Data.init<A>(_:)(result);
    unint64_t v5 = v4;
    uint64_t result = swift_release();
  }

  else
  {
    uint64_t v3 = 0LL;
    unint64_t v5 = 0xF000000000000000LL;
  }

  *a1 = v3;
  a1[1] = v5;
  return result;
}

uint64_t key path setter for ArchiveEncryptionContext.authData : ArchiveEncryptionContext(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  outlined copy of Data?(*a1, v2);
  ArchiveEncryptionContext._setBlob(field:data:)(5u, v1, v2);
  return outlined consume of Data?(v1, v2);
}

uint64_t ArchiveEncryptionContext.authData.setter(uint64_t a1, unint64_t a2)
{
  return outlined consume of Data?(a1, a2);
}

uint64_t ArchiveEncryptionContext.authData.getter()
{
  buf_size[1] = *MEMORY[0x1895F89C0];
  buf_size[0] = 0LL;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v0 + 16), 5u, 0, 0LL, 0LL, buf_size) < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    int64_t v1 = buf_size[0];
    if (buf_size[0])
    {
      swift_retain();
      uint64_t v2 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v1, v0, 5u, 0, buf_size);
      swift_release();
      int64_t v1 = specialized Data.init<A>(_:)(v2);
      swift_bridgeObjectRelease();
    }

    return v1;
  }

  return result;
}

void (*ArchiveEncryptionContext.authData.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  _OWORD v3[2] = 0LL;
  unint64_t v4 = v3 + 2;
  v3[3] = v1;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 5u, 0, 0LL, 0LL, v3 + 2) < 0)
  {
    uint64_t result = (void (*)(uint64_t **, char))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    int64_t v5 = *v4;
    if (*v4)
    {
      swift_retain();
      uint64_t v6 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v5, v1, 5u, 0, v4);
      swift_release();
      uint64_t v7 = specialized Data.init<A>(_:)(v6);
      unint64_t v9 = v8;
      swift_bridgeObjectRelease();
    }

    else
    {
      uint64_t v7 = 0LL;
      unint64_t v9 = 0xF000000000000000LL;
    }

    v3[4] = 0LL;
    *uint64_t v3 = v7;
    v3[1] = v9;
    return ArchiveEncryptionContext.authData.modify;
  }

  return result;
}

void ArchiveEncryptionContext.authData.modify(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  unint64_t v4 = (*a1)[1];
  uint64_t v5 = (*a1)[4];
  if ((a2 & 1) != 0)
  {
    outlined copy of Data?(**a1, v4);
    ArchiveEncryptionContext._setBlob(field:data:)(5u, v3, v4);
    if (!v5)
    {
      outlined consume of Data?(v3, v4);
      uint64_t v6 = *v2;
      unint64_t v7 = v2[1];
LABEL_6:
      outlined consume of Data?(v6, v7);
      free(v2);
      return;
    }
  }

  else
  {
    ArchiveEncryptionContext._setBlob(field:data:)(5u, v3, v4);
    if (!v5)
    {
      uint64_t v6 = v3;
      unint64_t v7 = v4;
      goto LABEL_6;
    }
  }

  MEMORY[0x1895C9780](v5);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t ArchiveEncryptionContext.archiveIdentifier.getter()
{
  buf_size[1] = *MEMORY[0x1895F89C0];
  buf_size[0] = 0LL;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v0 + 16), 0x12u, 0, 0LL, 0LL, buf_size) < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    int64_t v1 = buf_size[0];
    if (buf_size[0])
    {
      swift_retain();
      uint64_t v2 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v1, v0, 0x12u, 0, buf_size);
      swift_release();
      int64_t v1 = specialized Data.init<A>(_:)(v2);
      swift_bridgeObjectRelease();
    }

    return v1;
  }

  return result;
}

uint64_t key path getter for ArchiveEncryptionContext.signatureEncryptionKey : ArchiveEncryptionContext@<X0>( uint64_t a1@<X8>)
{
  if (ArchiveEncryptionContext._getBlob(field:representation:)(0xCu, 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
    lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>,  MEMORY[0x189607390]);
    SymmetricKey.init<A>(data:)();
    uint64_t v2 = type metadata accessor for SymmetricKey();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(a1, 0LL, 1LL, v2);
  }

  else
  {
    uint64_t v4 = type metadata accessor for SymmetricKey();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))( a1,  1LL,  1LL,  v4);
  }

uint64_t ArchiveEncryptionContext.signatureEncryptionKey.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x1895F8858](v2);
  uint64_t v4 = (char *)&v11[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of SymmetricKey?(a1, (uint64_t)v4);
  uint64_t v5 = type metadata accessor for SymmetricKey();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5) == 1)
  {
    __break(1u);
    MEMORY[0x1895C9780](v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    uint64_t v12 = v5;
    uint64_t v13 = &protocol witness table for SymmetricKey;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
    (*(void (**)(uint64_t *, char *, uint64_t))(v6 + 32))(boxed_opaque_existential_1, v4, v5);
    unint64_t v8 = __swift_project_boxed_opaque_existential_1(v11, v12);
    MEMORY[0x1895F8858](v8);
    SymmetricKey.withUnsafeBytes<A>(_:)();
    outlined destroy of SymmetricKey?(a1);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }

  return result;
}

uint64_t ArchiveEncryptionContext.signatureEncryptionKey.getter@<X0>(uint64_t a1@<X8>)
{
  buf_size[1] = *MEMORY[0x1895F89C0];
  buf_size[0] = 0LL;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 0xCu, 0, 0LL, 0LL, buf_size) < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    int64_t v3 = buf_size[0];
    if (buf_size[0])
    {
      swift_retain();
      uint64_t v4 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v3, v1, 0xCu, 0, buf_size);
      swift_release();
      buf_size[0] = v4;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>,  MEMORY[0x189607390]);
      SymmetricKey.init<A>(data:)();
      uint64_t v5 = type metadata accessor for SymmetricKey();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))( a1,  0LL,  1LL,  v5);
    }

    else
    {
      uint64_t v7 = type metadata accessor for SymmetricKey();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( a1,  1LL,  1LL,  v7);
    }
  }

  return result;
}

void (*ArchiveEncryptionContext.signatureEncryptionKey.modify(size_t **a1))(uint64_t a1, char a2)
{
  int64_t v3 = (size_t *)malloc(0x28uLL);
  *a1 = v3;
  _OWORD v3[2] = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?)
                             - 8)
                 + 64LL);
  v3[3] = (size_t)malloc(v4);
  uint64_t v5 = malloc(v4);
  v3[4] = (size_t)v5;
  *int64_t v3 = 0LL;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 0xCu, 0, 0LL, 0LL, v3) < 0)
  {
    uint64_t result = (void (*)(uint64_t, char))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    int64_t v6 = *v3;
    if (*v3)
    {
      swift_retain();
      uint64_t v7 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v6, v1, 0xCu, 0, v3);
      swift_release();
      v3[1] = v7;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>,  MEMORY[0x189607390]);
      SymmetricKey.init<A>(data:)();
      uint64_t v8 = type metadata accessor for SymmetricKey();
      (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v5, 0LL, 1LL, v8);
    }

    else
    {
      uint64_t v9 = type metadata accessor for SymmetricKey();
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v5, 1LL, 1LL, v9);
    }

    return ArchiveEncryptionContext.signatureEncryptionKey.modify;
  }

  return result;
}

void ArchiveEncryptionContext.signatureEncryptionKey.modify(uint64_t a1, char a2)
{
}

uint64_t key path getter for ArchiveEncryptionContext.mainKey : ArchiveEncryptionContext@<X0>( uint64_t a1@<X8>)
{
  if (ArchiveEncryptionContext._getBlob(field:representation:)(6u, 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
    lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>,  MEMORY[0x189607390]);
    SymmetricKey.init<A>(data:)();
    uint64_t v2 = type metadata accessor for SymmetricKey();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(a1, 0LL, 1LL, v2);
  }

  else
  {
    uint64_t v4 = type metadata accessor for SymmetricKey();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))( a1,  1LL,  1LL,  v4);
  }

uint64_t key path setter for ArchiveEncryptionContext.symmetricKey : ArchiveEncryptionContext( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x1895F8858](v7);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of SymmetricKey?(a1, (uint64_t)v9);
  return a5(v9);
}

uint64_t ArchiveEncryptionContext.mainKey.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x1895F8858](v2);
  uint64_t v4 = (char *)&v11[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of SymmetricKey?(a1, (uint64_t)v4);
  uint64_t v5 = type metadata accessor for SymmetricKey();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5) == 1)
  {
    __break(1u);
    MEMORY[0x1895C9780](v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    uint64_t v12 = v5;
    uint64_t v13 = &protocol witness table for SymmetricKey;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
    (*(void (**)(uint64_t *, char *, uint64_t))(v6 + 32))(boxed_opaque_existential_1, v4, v5);
    uint64_t v8 = __swift_project_boxed_opaque_existential_1(v11, v12);
    MEMORY[0x1895F8858](v8);
    SymmetricKey.withUnsafeBytes<A>(_:)();
    outlined destroy of SymmetricKey?(a1);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }

  return result;
}

uint64_t ArchiveEncryptionContext.mainKey.getter@<X0>(uint64_t a1@<X8>)
{
  buf_size[1] = *MEMORY[0x1895F89C0];
  buf_size[0] = 0LL;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 6u, 0, 0LL, 0LL, buf_size) < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    int64_t v3 = buf_size[0];
    if (buf_size[0])
    {
      swift_retain();
      uint64_t v4 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v3, v1, 6u, 0, buf_size);
      swift_release();
      buf_size[0] = v4;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>,  MEMORY[0x189607390]);
      SymmetricKey.init<A>(data:)();
      uint64_t v5 = type metadata accessor for SymmetricKey();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))( a1,  0LL,  1LL,  v5);
    }

    else
    {
      uint64_t v7 = type metadata accessor for SymmetricKey();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( a1,  1LL,  1LL,  v7);
    }
  }

  return result;
}

void (*ArchiveEncryptionContext.mainKey.modify(size_t **a1))(uint64_t a1, char a2)
{
  int64_t v3 = (size_t *)malloc(0x28uLL);
  *a1 = v3;
  _OWORD v3[2] = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?)
                             - 8)
                 + 64LL);
  v3[3] = (size_t)malloc(v4);
  uint64_t v5 = malloc(v4);
  v3[4] = (size_t)v5;
  *int64_t v3 = 0LL;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 6u, 0, 0LL, 0LL, v3) < 0)
  {
    uint64_t result = (void (*)(uint64_t, char))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    int64_t v6 = *v3;
    if (*v3)
    {
      swift_retain();
      uint64_t v7 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v6, v1, 6u, 0, v3);
      swift_release();
      v3[1] = v7;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>,  MEMORY[0x189607390]);
      SymmetricKey.init<A>(data:)();
      uint64_t v8 = type metadata accessor for SymmetricKey();
      (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v5, 0LL, 1LL, v8);
    }

    else
    {
      uint64_t v9 = type metadata accessor for SymmetricKey();
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v5, 1LL, 1LL, v9);
    }

    return ArchiveEncryptionContext.mainKey.modify;
  }

  return result;
}

void ArchiveEncryptionContext.mainKey.modify(uint64_t a1, char a2)
{
}

void ArchiveEncryptionContext.symmetricKey.modify(uint64_t a1, char a2, void (*a3)(void *))
{
  size_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)(*(void *)a1 + 24LL);
  int64_t v6 = *(void **)(*(void *)a1 + 32LL);
  if ((a2 & 1) != 0)
  {
    outlined init with copy of SymmetricKey?((uint64_t)v6, (uint64_t)v5);
    a3(v5);
    outlined destroy of SymmetricKey?((uint64_t)v6);
  }

  else
  {
    a3(v6);
  }

  free(v6);
  free(v5);
  free(v4);
}

uint64_t ArchiveEncryptionContext._getBlob(field:representation:)( AEAContextField field, AEAContextFieldRepresentation representation)
{
  buf_size[1] = *MEMORY[0x1895F89C0];
  buf_size[0] = 0LL;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v2 + 16), field, representation, 0LL, 0LL, buf_size) < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    int64_t v5 = buf_size[0];
    if (!buf_size[0]) {
      return 0LL;
    }
    swift_retain();
    uint64_t v6 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v5, v2, field, representation, buf_size);
    swift_release();
    return v6;
  }

  return result;
}

uint64_t partial apply for closure #1 in ArchiveEncryptionContext._setBlob(field:key:)( uint64_t a1, uint64_t a2)
{
  return closure #1 in ArchiveEncryptionContext._setBlob(field:key:)( a1,  a2,  *(void *)(v2 + 16),  *(_DWORD *)(v2 + 24),  0);
}

uint64_t outlined destroy of SymmetricKey?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t ArchiveEncryptionContext._setBlob(field:data:)( AEAContextField field, uint64_t a2, unint64_t a3)
{
  if (a3 >> 60 != 15) {
    __asm { BR              X10 }
  }

  uint64_t result = AEAContextSetFieldBlob(*(AEAContext *)(v3 + 16), field, 0, 0LL, 0LL);
  if ((result & 0x80000000) != 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    _BYTE *v5 = 1;
    return swift_willThrow();
  }

  return result;
}

uint64_t closure #1 in ArchiveEncryptionContext._setBlob(field:key:)( uint64_t buf, uint64_t a2, uint64_t a3, AEAContextField field, AEAContextFieldRepresentation representation)
{
  if (buf)
  {
    buf = AEAContextSetFieldBlob(*(AEAContext *)(a3 + 16), field, representation, (const uint8_t *)buf, a2 - buf);
    if ((buf & 0x80000000) != 0)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      _BYTE *v5 = 1;
      return swift_willThrow();
    }
  }

  else
  {
    __break(1u);
  }

  return buf;
}

const uint8_t *specialized String.withUTF8<A>(_:)(uint64_t *a1, uint64_t a2, AEAContextField field)
{
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  if ((v6 & 0x1000000000000000LL) == 0)
  {
    if ((v6 & 0x2000000000000000LL) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    size_t v8 = HIBYTE(v6) & 0xF;
    v16[0] = v5;
    v16[1] = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = *(AEAContext_impl **)(a2 + 16);
    uint64_t v7 = (const uint8_t *)v16;
    goto LABEL_7;
  }

  uint64_t v5 = static String._copying(_:)();
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  *a1 = v5;
  a1[1] = v12;
  unint64_t v6 = v12;
  if ((v12 & 0x2000000000000000LL) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v7 = (const uint8_t *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    size_t v8 = v5 & 0xFFFFFFFFFFFFLL;
    uint64_t v9 = *(AEAContext_impl **)(a2 + 16);
  }

  else
  {
    uint64_t result = (const uint8_t *)_StringObject.sharedUTF8.getter();
    if (!result)
    {
      __break(1u);
      return result;
    }

    uint64_t v7 = result;
    size_t v8 = v15;
    uint64_t v9 = *(AEAContext_impl **)(a2 + 16);
  }

void ArchiveEncryptionContext.__allocating_init(object:owned:)()
{
}

void ArchiveEncryptionContext.init(object:owned:)()
{
}

uint64_t ArchiveEncryptionContext.deinit()
{
  if (*(_BYTE *)(v0 + 24) == 1) {
    AEAContextDestroy(*(AEAContext *)(v0 + 16));
  }
  return v0;
}

uint64_t ArchiveEncryptionContext.__deallocating_deinit()
{
  if (*(_BYTE *)(v0 + 24) == 1) {
    AEAContextDestroy(*(AEAContext *)(v0 + 16));
  }
  return swift_deallocClassInstance();
}

void vtable thunk for _AAObjectWrapper.__allocating_init(object:owned:) dispatching to ArchiveEncryptionContext.__allocating_init(object:owned:)()
{
}

uint64_t static ArchiveEncryptionContext.sign(encryptedStream:encryptionContext:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 16);
  if (result)
  {
    uint64_t result = AEAStreamSign((AAByteStream)result, *(AEAContext *)(a2 + 16));
    if ((result & 0x80000000) != 0)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      _BYTE *v5 = 1;
      return swift_willThrow();
    }
  }

  else
  {
    __break(1u);
  }

  return result;
}

Swift::Bool __swiftcall ArchiveEncryptionContext.decryptAttributes()()
{
  return AEAContextDecryptAttributes(*(AEAContext *)(v0 + 16)) == 0;
}

uint64_t static String._copying(_:)()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = static String._copying(_:)(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static String._copying(_:)( unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000LL) != 0)
  {
    unint64_t v9 = specialized Collection.count.getter(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v9, 0LL);
      unint64_t v12 = specialized Sequence._copySequenceContents(initializing:)( (unint64_t)v14,  (uint64_t)(v11 + 4),  v10,  a1,  a2,  a3,  a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }

    else
    {
      uint64_t v11 = (void *)MEMORY[0x18961AFE8];
    }

    uint64_t v13 = MEMORY[0x1895C9090](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }

  else
  {
    if ((a4 & 0x2000000000000000LL) == 0)
    {
      if ((a3 & 0x1000000000000000LL) != 0) {
LABEL_12:
      }
        JUMPOUT(0x1895C9090LL);
LABEL_9:
      _StringObject.sharedUTF8.getter();
      goto LABEL_12;
    }

    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1895C9090]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }

unint64_t specialized Collection.count.getter( unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000LL) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4LL << v8;
  if ((result & 0xC) == 4LL << v8)
  {
    uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(result, a3, a4);
    unint64_t v7 = result;
  }

  if ((a2 & 0xC) == v9)
  {
    uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000LL) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }

  else if ((a4 & 0x1000000000000000LL) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }

  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000LL) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }

  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)();
  }

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
    return (void *)MEMORY[0x18961AFE8];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  uint64_t v4[2] = a1;
  void v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t specialized Sequence._copySequenceContents(initializing:)( unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0LL;
    goto LABEL_33;
  }

  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0LL;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    void v9[3] = a7;
    _BYTE v9[4] = v12;
    return v11;
  }

  uint64_t v11 = 0LL;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000LL) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4LL << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000LL) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000LL) != 0)
    {
      uint64_t result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }

    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000LL) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }

      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000LL) == 0) {
          uint64_t result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000LL) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }

    uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000LL) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000LL) + 65540;
      goto LABEL_29;
    }

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000LL) == 0 || (a2 & 0x800000000000000LL) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000LL;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }

  else
  {
    uint64_t v5 = MEMORY[0x1895C90CC](15LL, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000LL;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }

uint64_t specialized __DataStorage.withUnsafeBytes<A>(in:apply:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, AEAContextField a5, AEAContextFieldRepresentation a6)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v12 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }

    v12 += a1 - result;
  }

  BOOL v13 = __OFSUB__(a2, a1);
  uint64_t v14 = a2 - a1;
  if (v13)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v15 = __DataStorage._length.getter();
  if (v15 >= v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v15;
  }
  uint64_t v17 = v12 + v16;
  if (v12) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0LL;
  }
  closure #1 in ArchiveEncryptionContext._setBlob(field:key:)(v12, v18, a4, a5, a6);
  return swift_release();
}

_BYTE *closure #1 in Data.init<A>(_:)@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0LL;
LABEL_4:
    unint64_t v5 = 0xC000000000000000LL;
    goto LABEL_5;
  }

  if (v4 <= 14)
  {
    uint64_t result = (_BYTE *)specialized Data.InlineData.init(_:)(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }

  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (_BYTE *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000LL;
  }

  else
  {
    uint64_t result = (_BYTE *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000LL;
  }

uint64_t specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)( int64_t a1, uint64_t a2, AEAContextField a3, AEAContextFieldRepresentation a4, size_t *a5)
{
  if (a1 < 0)
  {
    __break(1u);
  }

  else
  {
    if (a1)
    {
      uint64_t v10 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v10 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = a1;
    }

    else
    {
      uint64_t v10 = MEMORY[0x18961AFE8];
    }

    if ((uint64_t)*a5 <= a1)
    {
      *(void *)(v10 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = *a5;
      return v10;
    }
  }

  __break(1u);
LABEL_10:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
    uint64_t result = MEMORY[0x1895C97D4](a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t specialized Data.InlineData.init(_:)(_BYTE *__src, _BYTE *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0LL;
  }
  if ((v2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }

  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t specialized Data.LargeSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0LL;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }

  else
  {
    type metadata accessor for Data.RangeReference();
    uint64_t result = swift_allocObject();
    *(void *)(result + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = 0LL;
    *(void *)(result + 24) = v2;
  }

  return result;
}

uint64_t specialized Data.InlineSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0LL;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t specialized Data.init<A>(_:)(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
  uint64_t v10 = lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>( &lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>,  MEMORY[0x189607390]);
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  char v3 = (_BYTE *)(*v2 + 32LL);
  uint64_t v4 = &v3[*(void *)(*v2 + 16LL)];
  swift_retain();
  closure #1 in Data.init<A>(_:)(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined copy of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_18862C794@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = AEAContextGetPaddingSize(*(AEAContext_impl **)(*(void *)a1 + 16LL));
  if ((result & 0x8000000000000000LL) != 0) {
    __break(1u);
  }
  else {
    *a2 = result;
  }
  return result;
}

uint64_t sub_18862C7CC@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = AEAContextGetChecksumMode(*(AEAContext_impl **)(*(void *)a1 + 16LL));
  *a2 = result;
  return result;
}

uint64_t sub_18862C7F8(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ArchiveEncryptionContext.checksumMode : ArchiveEncryptionContext( a1,  a2,  a3,  a4,  (uint64_t (*)(void, void))AEAContextSetChecksumMode);
}

uint64_t sub_18862C818@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = AEAContextGetCompressionAlgorithm(*(AEAContext_impl **)(*(void *)a1 + 16LL));
  *a2 = result;
  return result;
}

uint64_t sub_18862C844(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ArchiveEncryptionContext.checksumMode : ArchiveEncryptionContext( a1,  a2,  a3,  a4,  (uint64_t (*)(void, void))AEAContextSetCompressionAlgorithm);
}

uint64_t sub_18862C864@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = AEAContextGetCompressionBlockSize(*(AEAContext_impl **)(*(void *)a1 + 16LL));
  *a2 = result;
  return result;
}

uint64_t sub_18862C898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ArchiveEncryptionContext.symmetricKey : ArchiveEncryptionContext( a1,  a2,  a3,  a4,  (uint64_t (*)(char *))ArchiveEncryptionContext.symmetricKey.setter);
}

uint64_t sub_18862C8B8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return ArchiveEncryptionContext.password.setter(v1, v2);
}

uint64_t sub_18862C900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ArchiveEncryptionContext.symmetricKey : ArchiveEncryptionContext( a1,  a2,  a3,  a4,  (uint64_t (*)(char *))ArchiveEncryptionContext.signatureEncryptionKey.setter);
}

uint64_t sub_18862C920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ArchiveEncryptionContext.symmetricKey : ArchiveEncryptionContext( a1,  a2,  a3,  a4,  (uint64_t (*)(char *))ArchiveEncryptionContext.mainKey.setter);
}

ValueMetadata *type metadata accessor for AEAContextTraits()
{
  return &type metadata for AEAContextTraits;
}

uint64_t dispatch thunk of _AppleArchiveContiguousBytes.withUnsafeBytes<A>(_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t method lookup function for ArchiveEncryptionContext()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.__allocating_init(profile:compressionAlgorithm:compressionBlockSize:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.profile.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.signatureMode.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.encryptionMode.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.paddingSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.paddingSize.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.paddingSize.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.checksumMode.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.checksumMode.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.checksumMode.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.compressionAlgorithm.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.compressionAlgorithm.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.compressionAlgorithm.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.compressionBlockSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.compressionBlockSize.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.compressionBlockSize.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.rawSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.containerSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.symmetricKey.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.symmetricKey.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.symmetricKey.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.password.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.password.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.password.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.generateSymmetricKey()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.generatePassword()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.setSymmetricKey(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.setPassword(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.setSigningPublicKey(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.setSigningPrivateKey(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.setRecipientPublicKey(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.setRecipientPrivateKey(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.authData.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.authData.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.authData.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.archiveIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.signatureEncryptionKey.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.signatureEncryptionKey.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.signatureEncryptionKey.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.mainKey.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.mainKey.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448LL))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.mainKey.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456LL))();
}

uint64_t dispatch thunk of _AppleArchiveContiguousBytesX963.withUnsafeX963Bytes<A>(_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return dispatch thunk of _AppleArchiveContiguousBytes.withUnsafeBytes<A>(_:)(a1, a2, a3, a4, a5);
}

uint64_t closure #1 in ArchiveEncryptionContext._setBlob(field:key:)partial apply(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in ArchiveEncryptionContext._setBlob(field:key:)(a1, a2);
}

uint64_t static ArchiveByteStream.encryptionStream(writingTo:encryptionContext:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static ArchiveByteStream.encryptionStream(writingTo:encryptionContext:flags:threadCount:)( a1,  a2,  a3,  a4,  MEMORY[0x1896134A8]);
}

uint64_t static ArchiveByteStream.encryptionStream(appendingTo:encryptionContext:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static ArchiveByteStream.encryptionStream(writingTo:encryptionContext:flags:threadCount:)( a1,  a2,  a3,  a4,  MEMORY[0x1896134B0]);
}

uint64_t static ArchiveByteStream.decryptionStream(readingFrom:encryptionContext:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static ArchiveByteStream.encryptionStream(writingTo:encryptionContext:flags:threadCount:)( a1,  a2,  a3,  a4,  MEMORY[0x189613488]);
}

uint64_t static ArchiveByteStream.encryptionStream(writingTo:encryptionContext:flags:threadCount:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = *(void *)(a1 + 16);
  if (!result) {
    goto LABEL_10;
  }
  if (a4 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (a4 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v9 = a5();
  if (!v9) {
    return 0LL;
  }
  uint64_t v10 = v9;
  type metadata accessor for ArchiveByteStream();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v11 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v10;
  *(_BYTE *)(v11 + 24) = 1;
  return v11;
}

AAByteStream_impl *static ArchiveByteStream.randomAccessDecryptionStream(readingFrom:encryptionContext:allocationLimit:flags:threadCount:)( AAByteStream_impl *result, uint64_t a2, int64_t a3, AAFlagSet *a4, uint64_t a5)
{
  if (a3 < -1) {
    goto LABEL_11;
  }
  uint64_t v8 = result;
  AAFlagSet v9 = *a4;
  swift_beginAccess();
  uint64_t result = (AAByteStream_impl *)*((void *)v8 + 2);
  if (!result)
  {
LABEL_12:
    __break(1u);
    return result;
  }

  if (a5 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_10;
  }

  if (a5 > 0x7FFFFFFF)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  AAByteStream v10 = AEADecryptionRandomAccessInputStreamOpen(result, *(AEAContext *)(a2 + 16), a3, v9, a5);
  if (!v10) {
    return 0LL;
  }
  AAByteStream v11 = v10;
  type metadata accessor for ArchiveByteStream();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = 0LL;
  swift_beginAccess();
  *(void *)(v12 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = v11;
  *(_BYTE *)(v12 + 24) = 1;
  return (AAByteStream_impl *)v12;
}

uint64_t ArchiveByteStream.close(updatingContext:)(uint64_t a1)
{
  uint64_t result = *(void *)(v1 + 16);
  if (result)
  {
    uint64_t result = AEAEncryptionOutputStreamCloseAndUpdateContext((AAByteStream)result, *(AEAContext *)(a1 + 16));
    *(void *)(v1 + outlined destroy of ArchiveByteStreamProtocol?(v0 + 16) = 0LL;
    if ((_DWORD)result)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *uint64_t v4 = 0;
      return swift_willThrow();
    }
  }

  return result;
}

uint64_t ArchiveEncryptionContext.Profile.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveEncryptionContext.Profile.hkdf_sha256_hmac__none__ecdsa_p256.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveEncryptionContext.Profile.hkdf_sha256_aesctr_hmac__symmetric__none.getter( _DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ArchiveEncryptionContext.Profile.hkdf_sha256_aesctr_hmac__symmetric__ecdsa_p256.getter( _DWORD *a1@<X8>)
{
  *a1 = 2;
}

void static ArchiveEncryptionContext.Profile.hkdf_sha256_aesctr_hmac__ecdhe_p256__none.getter( _DWORD *a1@<X8>)
{
  *a1 = 3;
}

void static ArchiveEncryptionContext.Profile.hkdf_sha256_aesctr_hmac__ecdhe_p256__ecdsa_p256.getter( _DWORD *a1@<X8>)
{
  *a1 = 4;
}

void static ArchiveEncryptionContext.Profile.hkdf_sha256_aesctr_hmac__scrypt__none.getter(_DWORD *a1@<X8>)
{
  *a1 = 5;
}

uint64_t ArchiveEncryptionContext.Profile.rawValue.getter()
{
  return *v0;
}

uint64_t ArchiveEncryptionContext.Profile.rawValue.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*ArchiveEncryptionContext.Profile.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

unint64_t ArchiveEncryptionContext.Profile.description.getter()
{
  unint64_t result = 0xD000000000000022LL;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0xD000000000000028LL;
      break;
    case 2:
      unint64_t result = 0xD00000000000002ELL;
      break;
    case 3:
      unint64_t result = 0xD000000000000029LL;
      break;
    case 4:
      unint64_t result = 0xD00000000000002FLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000025LL;
      break;
    default:
      unint64_t result = 4144959LL;
      break;
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveEncryptionContext.Profile and conformance ArchiveEncryptionContext.Profile()
{
  unint64_t result = lazy protocol witness table cache variable for type ArchiveEncryptionContext.Profile and conformance ArchiveEncryptionContext.Profile;
  if (!lazy protocol witness table cache variable for type ArchiveEncryptionContext.Profile and conformance ArchiveEncryptionContext.Profile)
  {
    unint64_t result = MEMORY[0x1895C97D4]( &protocol conformance descriptor for ArchiveEncryptionContext.Profile,  &type metadata for ArchiveEncryptionContext.Profile);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ArchiveEncryptionContext.Profile and conformance ArchiveEncryptionContext.Profile);
  }

  return result;
}

ValueMetadata *type metadata accessor for ArchiveEncryptionContext.Profile()
{
  return &type metadata for ArchiveEncryptionContext.Profile;
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x189606200]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x189606208]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x189606230]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x189606240]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x189606260]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x189606BA8]();
}

uint64_t Algorithm.rawValue.getter()
{
  return MEMORY[0x189617648]();
}

uint64_t type metadata accessor for Algorithm()
{
  return MEMORY[0x189617650]();
}

uint64_t FilePath.withCString<A>(_:)()
{
  return MEMORY[0x18961BB98]();
}

uint64_t FilePath.init(platformString:)()
{
  return MEMORY[0x18961BBB0]();
}

uint64_t type metadata accessor for FilePath()
{
  return MEMORY[0x18961BBF0]();
}

uint64_t FilePath.init(_:)()
{
  return MEMORY[0x18961BC08]();
}

uint64_t SymmetricKey.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x1896059A0]();
}

uint64_t SymmetricKey.init<A>(data:)()
{
  return MEMORY[0x1896059A8]();
}

uint64_t type metadata accessor for SymmetricKey()
{
  return MEMORY[0x1896059B0]();
}

uint64_t MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x189617B80]();
}

uint64_t MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)()
{
  return MEMORY[0x189617B88]();
}

uint64_t String.init<A>(bytes:encoding:)()
{
  return MEMORY[0x189607128]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x189607138]();
}

uint64_t String.init(cString:encoding:)()
{
  return MEMORY[0x189607140]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x189607150]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x189607178]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x189617CB0]();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return MEMORY[0x189617D78]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x189617D80]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x189617DD8]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x189617E90]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x189617EB8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x189617ED0]();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x189617ED8]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x189617EE0]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x189617F48]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x189618078]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1896180F8]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x189618390]();
}

uint64_t Collection.underestimatedCount.getter()
{
  return MEMORY[0x1896188B8]();
}

uint64_t Collection.count.getter()
{
  return MEMORY[0x1896188C8]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x1896188F8]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x189618AC0]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x189619010]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x189619440]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1896198A8]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x18961A050]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x18961A120]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x18961A680]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x18961A6C0]();
}

void AAArchiveStreamCancel(AAArchiveStream s)
{
}

int AAArchiveStreamClose(AAArchiveStream s)
{
  return MEMORY[0x189613058](s);
}

ssize_t AAArchiveStreamProcess( AAArchiveStream istream, AAArchiveStream ostream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x189613060](istream, ostream, msg_data, msg_proc, flags, *(void *)&n_threads);
}

int AAArchiveStreamReadHeader(AAArchiveStream s, AAHeader *header)
{
  return MEMORY[0x189613070](s, header);
}

int AAArchiveStreamWriteHeader(AAArchiveStream s, AAHeader header)
{
  return MEMORY[0x189613080](s, header);
}

int AAArchiveStreamWritePathList( AAArchiveStream s, AAPathList path_list, AAFieldKeySet key_set, const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x189613088](s, path_list, key_set, dir, msg_data, msg_proc, flags, *(void *)&n_threads);
}

void AAByteStreamCancel(AAByteStream s)
{
}

int AAByteStreamClose(AAByteStream s)
{
  return MEMORY[0x1896130A0](s);
}

off_t AAByteStreamProcess(AAByteStream istream, AAByteStream ostream)
{
  return MEMORY[0x1896130C8](istream, ostream);
}

off_t AAByteStreamSeek(AAByteStream s, off_t offset, int whence)
{
  return MEMORY[0x1896130E8](s, offset, *(void *)&whence);
}

AAByteStream AACompressionOutputStreamOpen( AAByteStream compressed_stream, AACompressionAlgorithm compression_algorithm, size_t block_size, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x189613100]( compressed_stream,  *(void *)&compression_algorithm,  block_size,  flags,  *(void *)&n_threads);
}

AAArchiveStream AAConvertArchiveOutputStreamOpen( AAArchiveStream stream, AAFieldKeySet insert_key_set, AAFieldKeySet remove_key_set, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x189613110]( stream,  insert_key_set,  remove_key_set,  msg_data,  msg_proc,  flags,  *(void *)&n_threads);
}

AAArchiveStream AACustomArchiveStreamOpen(void)
{
  return (AAArchiveStream)MEMORY[0x189613118]();
}

void AACustomArchiveStreamSetCancelProc(AAArchiveStream s, AAArchiveStreamCancelProc proc)
{
}

void AACustomArchiveStreamSetCloseProc(AAArchiveStream s, AAArchiveStreamCloseProc proc)
{
}

void AACustomArchiveStreamSetData(AAArchiveStream s, void *data)
{
}

void AACustomArchiveStreamSetReadHeaderProc(AAArchiveStream s, AAArchiveStreamReadHeaderProc proc)
{
}

void AACustomArchiveStreamSetWriteBlobProc(AAArchiveStream s, AAArchiveStreamWriteBlobProc proc)
{
}

void AACustomArchiveStreamSetWriteHeaderProc(AAArchiveStream s, AAArchiveStreamWriteHeaderProc proc)
{
}

AAByteStream AACustomByteStreamOpen(void)
{
  return (AAByteStream)MEMORY[0x189613150]();
}

void AACustomByteStreamSetCancelProc(AAByteStream s, AAByteStreamCancelProc proc)
{
}

void AACustomByteStreamSetCloseProc(AAByteStream s, AAByteStreamCloseProc proc)
{
}

void AACustomByteStreamSetData(AAByteStream s, void *data)
{
}

void AACustomByteStreamSetPReadProc(AAByteStream s, AAByteStreamPReadProc proc)
{
}

void AACustomByteStreamSetPWriteProc(AAByteStream s, AAByteStreamPWriteProc proc)
{
}

void AACustomByteStreamSetReadProc(AAByteStream s, AAByteStreamReadProc proc)
{
}

void AACustomByteStreamSetSeekProc(AAByteStream s, AAByteStreamSeekProc proc)
{
}

void AACustomByteStreamSetWriteProc(AAByteStream s, AAByteStreamWriteProc proc)
{
}

AAByteStream AADecompressionRandomAccessInputStreamOpen( AAByteStream compressed_stream, size_t alloc_limit, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x1896131D0](compressed_stream, alloc_limit, flags, *(void *)&n_threads);
}

int AAEntryXATBlobAppendEntry(AAEntryXATBlob xat, const char *key, const uint8_t *data, size_t data_size)
{
  return MEMORY[0x189613218](xat, key, data, data_size);
}

int AAEntryXATBlobApplyToPath(AAEntryXATBlob xat, const char *dir, const char *path, AAFlagSet flags)
{
  return MEMORY[0x189613220](xat, dir, path, flags);
}

int AAEntryXATBlobClear(AAEntryXATBlob xat)
{
  return MEMORY[0x189613228](xat);
}

AAEntryXATBlob AAEntryXATBlobCreate(void)
{
  return (AAEntryXATBlob)MEMORY[0x189613230]();
}

AAEntryXATBlob AAEntryXATBlobCreateWithEncodedData(const uint8_t *data, size_t data_size)
{
  return (AAEntryXATBlob)MEMORY[0x189613238](data, data_size);
}

AAEntryXATBlob AAEntryXATBlobCreateWithPath(const char *dir, const char *path, AAFlagSet flags)
{
  return (AAEntryXATBlob)MEMORY[0x189613240](dir, path, flags);
}

void AAEntryXATBlobDestroy(AAEntryXATBlob xat)
{
}

const uint8_t *__cdecl AAEntryXATBlobGetEncodedData(AAEntryXATBlob xat)
{
  return (const uint8_t *)MEMORY[0x189613250](xat);
}

size_t AAEntryXATBlobGetEncodedSize(AAEntryXATBlob xat)
{
  return MEMORY[0x189613258](xat);
}

int AAEntryXATBlobGetEntry( AAEntryXATBlob xat, uint32_t i, size_t key_capacity, char *key, size_t *key_length, size_t data_capacity, uint8_t *data, size_t *data_size)
{
  return MEMORY[0x189613260](xat, *(void *)&i, key_capacity, key, key_length, data_capacity, data, data_size);
}

uint32_t AAEntryXATBlobGetEntryCount(AAEntryXATBlob xat)
{
  return MEMORY[0x189613268](xat);
}

int AAEntryXATBlobRemoveEntry(AAEntryXATBlob xat, uint32_t i)
{
  return MEMORY[0x189613270](xat, *(void *)&i);
}

int AAEntryXATBlobSetEntry( AAEntryXATBlob xat, uint32_t i, const char *key, const uint8_t *data, size_t data_size)
{
  return MEMORY[0x189613278](xat, *(void *)&i, key, data, data_size);
}

AAArchiveStream AAExtractArchiveOutputStreamOpen( const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x189613280](dir, msg_data, msg_proc, flags, *(void *)&n_threads);
}

AAFieldKeySet AAFieldKeySetClone(AAFieldKeySet key_set)
{
  return (AAFieldKeySet)MEMORY[0x189613288](key_set);
}

int AAFieldKeySetContainsKey(AAFieldKeySet key_set, AAFieldKey key)
{
  return MEMORY[0x189613290](key_set, *(void *)key.skey);
}

AAFieldKeySet AAFieldKeySetCreate(void)
{
  return (AAFieldKeySet)MEMORY[0x189613298]();
}

AAFieldKeySet AAFieldKeySetCreateWithString(const char *s)
{
  return (AAFieldKeySet)MEMORY[0x1896132A0](s);
}

void AAFieldKeySetDestroy(AAFieldKeySet key_set)
{
}

AAFieldKey AAFieldKeySetGetKey(AAFieldKeySet key_set, uint32_t i)
{
  return (AAFieldKey)MEMORY[0x1896132B0](key_set, *(void *)&i);
}

uint32_t AAFieldKeySetGetKeyCount(AAFieldKeySet key_set)
{
  return MEMORY[0x1896132B8](key_set);
}

int AAFieldKeySetInsertKey(AAFieldKeySet key_set, AAFieldKey key)
{
  return MEMORY[0x1896132C0](key_set, *(void *)key.skey);
}

int AAFieldKeySetInsertKeySet(AAFieldKeySet key_set, AAFieldKeySet s)
{
  return MEMORY[0x1896132C8](key_set, s);
}

int AAFieldKeySetRemoveKey(AAFieldKeySet key_set, AAFieldKey key)
{
  return MEMORY[0x1896132D0](key_set, *(void *)key.skey);
}

int AAFieldKeySetRemoveKeySet(AAFieldKeySet key_set, AAFieldKeySet s)
{
  return MEMORY[0x1896132D8](key_set, s);
}

int AAFieldKeySetSelectKeySet(AAFieldKeySet key_set, AAFieldKeySet s)
{
  return MEMORY[0x1896132E0](key_set, s);
}

int AAFieldKeySetSerialize(AAFieldKeySet key_set, size_t capacity, char *s)
{
  return MEMORY[0x1896132E8](key_set, capacity, s);
}

AAByteStream AAFileStreamOpenWithFD(int fd, int automatic_close)
{
  return (AAByteStream)MEMORY[0x1896132F0](*(void *)&fd, *(void *)&automatic_close);
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  return (AAByteStream)MEMORY[0x189613300](path, *(void *)&open_flags, open_mode);
}

int AAHeaderAssign(AAHeader header, AAHeader from_header)
{
  return MEMORY[0x189613308](header, from_header);
}

int AAHeaderClear(AAHeader header)
{
  return MEMORY[0x189613310](header);
}

AAHeader AAHeaderClone(AAHeader header)
{
  return (AAHeader)MEMORY[0x189613318](header);
}

AAHeader AAHeaderCreate(void)
{
  return (AAHeader)MEMORY[0x189613320]();
}

AAHeader AAHeaderCreateWithEncodedData(size_t data_size, const uint8_t *data)
{
  return (AAHeader)MEMORY[0x189613328](data_size, data);
}

AAHeader AAHeaderCreateWithPath(AAFieldKeySet key_set, const char *dir, const char *path, AAFlagSet flags)
{
  return (AAHeader)MEMORY[0x189613330](key_set, dir, path, flags);
}

void AAHeaderDestroy(AAHeader header)
{
}

const uint8_t *__cdecl AAHeaderGetEncodedData(AAHeader header)
{
  return (const uint8_t *)MEMORY[0x189613340](header);
}

size_t AAHeaderGetEncodedSize(AAHeader header)
{
  return MEMORY[0x189613348](header);
}

int AAHeaderGetFieldBlob(AAHeader header, uint32_t i, uint64_t *size, uint64_t *offset)
{
  return MEMORY[0x189613350](header, *(void *)&i, size, offset);
}

uint32_t AAHeaderGetFieldCount(AAHeader header)
{
  return MEMORY[0x189613358](header);
}

int AAHeaderGetFieldHash( AAHeader header, uint32_t i, size_t capacity, AAHashFunction *hash_function, uint8_t *value)
{
  return MEMORY[0x189613360](header, *(void *)&i, capacity, hash_function, value);
}

AAFieldKey AAHeaderGetFieldKey(AAHeader header, uint32_t i)
{
  return (AAFieldKey)MEMORY[0x189613368](header, *(void *)&i);
}

int AAHeaderGetFieldString(AAHeader header, uint32_t i, size_t capacity, char *value, size_t *length)
{
  return MEMORY[0x189613370](header, *(void *)&i, capacity, value, length);
}

int AAHeaderGetFieldTimespec(AAHeader header, uint32_t i, timespec *value)
{
  return MEMORY[0x189613378](header, *(void *)&i, value);
}

int AAHeaderGetFieldType(AAHeader header, uint32_t i)
{
  return MEMORY[0x189613380](header, *(void *)&i);
}

int AAHeaderGetFieldUInt(AAHeader header, uint32_t i, uint64_t *value)
{
  return MEMORY[0x189613388](header, *(void *)&i, value);
}

int AAHeaderGetKeyIndex(AAHeader header, AAFieldKey key)
{
  return MEMORY[0x189613390](header, *(void *)key.skey);
}

int AAHeaderRemoveField(AAHeader header, uint32_t i)
{
  return MEMORY[0x189613398](header, *(void *)&i);
}

int AAHeaderSetFieldBlob(AAHeader header, uint32_t i, AAFieldKey key, uint64_t size)
{
  return MEMORY[0x1896133A0](header, *(void *)&i, *(void *)key.skey, size);
}

int AAHeaderSetFieldFlag(AAHeader header, uint32_t i, AAFieldKey key)
{
  return MEMORY[0x1896133A8](header, *(void *)&i, *(void *)key.skey);
}

int AAHeaderSetFieldHash( AAHeader header, uint32_t i, AAFieldKey key, AAHashFunction hash_function, const uint8_t *value)
{
  return MEMORY[0x1896133B0](header, *(void *)&i, *(void *)key.skey, *(void *)&hash_function, value);
}

int AAHeaderSetFieldString(AAHeader header, uint32_t i, AAFieldKey key, const char *value, size_t length)
{
  return MEMORY[0x1896133B8](header, *(void *)&i, *(void *)key.skey, value, length);
}

int AAHeaderSetFieldTimespec(AAHeader header, uint32_t i, AAFieldKey key, const timespec *value)
{
  return MEMORY[0x1896133C0](header, *(void *)&i, *(void *)key.skey, value);
}

int AAHeaderSetFieldUInt(AAHeader header, uint32_t i, AAFieldKey key, uint64_t value)
{
  return MEMORY[0x1896133C8](header, *(void *)&i, *(void *)key.skey, value);
}

AAPathList AAPathListCreateWithDirectoryContents( const char *dir, const char *path, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAPathList)MEMORY[0x1896133D0](dir, path, msg_data, msg_proc, flags, *(void *)&n_threads);
}

void AAPathListDestroy(AAPathList path_list)
{
}

int AASharedBufferPipeOpen(AAByteStream *ostream, AAByteStream *istream, size_t buffer_capacity)
{
  return MEMORY[0x1896133E0](ostream, istream, buffer_capacity);
}

AAByteStream AATempFileStreamOpen(void)
{
  return (AAByteStream)MEMORY[0x1896133E8]();
}

AEAContext AEAContextCreateWithEncryptedStream(AAByteStream encrypted_stream)
{
  return (AEAContext)MEMORY[0x189613418](encrypted_stream);
}

AEAContext AEAContextCreateWithProfile(AEAProfile profile)
{
  return (AEAContext)MEMORY[0x189613428](*(void *)&profile);
}

int AEAContextDecryptAttributes(AEAContext context)
{
  return MEMORY[0x189613430](context);
}

void AEAContextDestroy(AEAContext context)
{
}

int AEAContextGenerateFieldBlob(AEAContext context, AEAContextField field)
{
  return MEMORY[0x189613448](context, *(void *)&field);
}

int AEAContextGetFieldBlob( AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, size_t buf_capacity, uint8_t *buf, size_t *buf_size)
{
  return MEMORY[0x189613450](context, *(void *)&field, *(void *)&representation, buf_capacity, buf, buf_size);
}

uint64_t AEAContextGetFieldUInt(AEAContext context, AEAContextField field)
{
  return MEMORY[0x189613468](context, *(void *)&field);
}

int AEAContextSetFieldBlob( AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, const uint8_t *buf, size_t buf_size)
{
  return MEMORY[0x189613478](context, *(void *)&field, *(void *)&representation, buf, buf_size);
}

int AEAContextSetFieldUInt(AEAContext context, AEAContextField field, uint64_t value)
{
  return MEMORY[0x189613480](context, *(void *)&field, value);
}

AAByteStream AEADecryptionRandomAccessInputStreamOpen( AAByteStream encrypted_stream, AEAContext context, size_t alloc_limit, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x189613490](encrypted_stream, context, alloc_limit, flags, *(void *)&n_threads);
}

int AEAEncryptionOutputStreamCloseAndUpdateContext(AAByteStream stream, AEAContext context)
{
  return MEMORY[0x1896134A0](stream, context);
}

int AEAStreamSign(AAByteStream encrypted_stream, AEAContext context)
{
  return MEMORY[0x1896134B8](encrypted_stream, context);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x18961B058]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x18961B0A0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x18961B0B8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x18961B0F8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x18961B160]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x18961B188]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x18961B1D8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x18961B220]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x18961B2D0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x18961B318]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x18961B330]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x18961B348]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x18961B3A0]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x18961B3D0]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x18961B3E8]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x18961B408]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x18961B470]();
}
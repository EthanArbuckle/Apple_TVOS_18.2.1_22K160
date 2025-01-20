uint64_t Atomic.deinit(uint64_t a1)
{
  const void *v1;
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  uint64_t v14;
  v2 = v1;
  v3 = *(void *)(a1 + 16);
  v4 = *(void *)(a1 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  v8 = (char *)&v14 - v7;
  v9 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v6);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  memcpy(v8, v2, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 24))(v8, v3, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v3);
  return UnsafeMutablePointer.deinitialize(count:)();
}

_BYTE *protocol witness for static AtomicRepresentable.encodeAtomicRepresentation(_:) in conformance Bool@<X0>( _BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_BYTE *protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance Bool@<X0>( _BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result & 1;
  return result;
}

__int16 protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance Float16@<H0>( __int16 *a1@<X0>, __int16 *a2@<X8>)
{
  __int16 result = *a1;
  *a2 = *a1;
  return result;
}

_DWORD *protocol witness for static AtomicRepresentable.encodeAtomicRepresentation(_:) in conformance Float@<X0>( _DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

float protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance Float@<S0>( float *a1@<X0>, _DWORD *a2@<X8>)
{
  float result = *a1;
  *a2 = *(_DWORD *)a1;
  return result;
}

double protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance Double@<D0>( double *a1@<X0>, void *a2@<X8>)
{
  double result = *a1;
  *a2 = *(void *)a1;
  return result;
}

uint64_t (*AtomicLazyReference.storage.read())()
{
  return AtomicLazyReference.storage.read;
}

void AtomicLazyReference.init()(void *a1@<X8>)
{
  *a1 = 0LL;
}

uint64_t AtomicLazyReference.deinit(uint64_t a1)
{
  unint64_t v2 = atomic_load(v1);
  v11[2] = v2;
  v10[2] = *(void *)(a1 + 16);
  swift_getCanonicalSpecializedMetadata();
  uint64_t v3 = type metadata accessor for Unmanaged();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF( (void (*)(char *, char *))partial apply for closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:),  (uint64_t)v10,  MEMORY[0x18961A520],  v3,  v4,  (uint64_t)&v12);
  if (v12) {
    swift_unknownObjectRelease();
  }
  uint64_t v5 = type metadata accessor for Optional();
  v11[0] = &protocol witness table for Unmanaged<A>;
  uint64_t v6 = MEMORY[0x1895E8874](&protocol conformance descriptor for <A> A?, v5, v11);
  uint64_t v8 = type metadata accessor for Atomic(0LL, v5, v6, v7);
  return Atomic.deinit(v8);
}

uint64_t AtomicLazyReference.storeIfNil(_:)(unint64_t a1)
{
  unint64_t v2 = a1;
  while (1)
  {
    unint64_t v3 = __ldaxr(v1);
    if (v3) {
      break;
    }
    if (!__stlxr(a1, v1))
    {
      char v4 = 1;
      goto LABEL_6;
    }
  }

  char v4 = 0;
  __clrex();
LABEL_6:
  v10[6] = v3;
  MEMORY[0x1895F8858](a1);
  v10[2] = *(void *)(v5 + 16);
  swift_getCanonicalSpecializedMetadata();
  uint64_t v6 = type metadata accessor for Unmanaged();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF( (void (*)(char *, char *))closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:)partial apply,  (uint64_t)v10,  MEMORY[0x18961A520],  v6,  v7,  (uint64_t)&v11);
  if ((v4 & 1) != 0)
  {
    swift_unknownObjectRetain();
    return v2;
  }

  uint64_t v8 = v11;
  uint64_t result = swift_unknownObjectRelease();
  if (v8)
  {
    swift_unknownObjectRetain();
    return v8;
  }

  __break(1u);
  return result;
}

uint64_t AtomicLazyReference.load()(uint64_t a1)
{
  unint64_t v2 = atomic_load(v1);
  v6[4] = v2;
  v6[2] = *(void *)(a1 + 16);
  swift_getCanonicalSpecializedMetadata();
  uint64_t v3 = type metadata accessor for Unmanaged();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF( (void (*)(char *, char *))closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:)partial apply,  (uint64_t)v6,  MEMORY[0x18961A520],  v3,  v4,  (uint64_t)&v7);
  uint64_t result = v7;
  if (v7) {
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t AtomicLoadOrdering._rawValue.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*AtomicLoadOrdering._rawValue.modify())()
{
  return AtomicLazyReference.storage.read;
}

BOOL static AtomicLoadOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance AtomicLoadOrdering( void *a1, void *a2)
{
  return *a1 == *a2;
}

void AtomicLoadOrdering.hash(into:)(int a1, Swift::UInt a2)
{
}

void protocol witness for Hashable.hash(into:) in conformance AtomicLoadOrdering()
{
}

uint64_t AtomicLoadOrdering.description.getter(uint64_t a1)
{
  switch(a1)
  {
    case 0LL:
      return 0x646578616C6572LL;
    case 5LL:
      return 0xD000000000000016LL;
    case 2LL:
      return 0x6E69726975716361LL;
  }

  _StringGuts.grow(_:)(22LL);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 41LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  return 0xD000000000000013LL;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AtomicLoadOrdering()
{
  return AtomicLoadOrdering.description.getter(*v0);
}

uint64_t AtomicStoreOrdering._rawValue.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*AtomicStoreOrdering._rawValue.modify())()
{
  return AtomicLazyReference.storage.read;
}

BOOL static AtomicStoreOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t AtomicStoreOrdering.description.getter(uint64_t a1)
{
  switch(a1)
  {
    case 0LL:
      return 0x646578616C6572LL;
    case 5LL:
      return 0xD000000000000016LL;
    case 3LL:
      return 0x6E697361656C6572LL;
  }

  _StringGuts.grow(_:)(23LL);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 41LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  return 0xD000000000000014LL;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AtomicStoreOrdering()
{
  return AtomicStoreOrdering.description.getter(*v0);
}

uint64_t AtomicUpdateOrdering._rawValue.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*AtomicUpdateOrdering._rawValue.modify())()
{
  return AtomicLazyReference.storage.read;
}

BOOL static AtomicUpdateOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

Swift::Int AtomicLoadOrdering.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance AtomicLoadOrdering()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AtomicLoadOrdering()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t AtomicUpdateOrdering.description.getter(uint64_t a1)
{
  uint64_t v1 = 0xD000000000000015LL;
  switch(a1)
  {
    case 0LL:
      uint64_t v1 = 0x646578616C6572LL;
      break;
    case 2LL:
      uint64_t v4 = 0x726975716361LL;
      goto LABEL_6;
    case 3LL:
      uint64_t v4 = 0x7361656C6572LL;
LABEL_6:
      uint64_t v1 = v4 & 0xFFFFFFFFFFFFLL | 0x6E69000000000000LL;
      break;
    case 4LL:
      return v1;
    case 5LL:
      uint64_t v1 = 0xD000000000000016LL;
      break;
    default:
      _StringGuts.grow(_:)(24LL);
      swift_bridgeObjectRelease();
      v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v2);
      swift_bridgeObjectRelease();
      v3._countAndFlagsBits = 41LL;
      v3._object = (void *)0xE100000000000000LL;
      String.append(_:)(v3);
      uint64_t v1 = 0xD000000000000015LL;
      break;
  }

  return v1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AtomicUpdateOrdering()
{
  return AtomicUpdateOrdering.description.getter(*v0);
}

uint64_t protocol witness for static AtomicRepresentable.encodeAtomicRepresentation(_:) in conformance <A> A?( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 24LL))();
}

uint64_t protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance <A> A?( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 32LL))();
}

void *_sSPyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06decodeB14Representationyx0bE0QznFZTW@<X0>( void *result@<X0>, void *a2@<X8>)
{
  if (*result) {
    *a2 = *result;
  }
  else {
    __break(1u);
  }
  return result;
}

void *partial apply for closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:)@<X0>( void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>( void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v25 = a5;
  uint64_t v26 = a2;
  uint64_t v28 = a4;
  v27 = a1;
  uint64_t v24 = a3;
  uint64_t v9 = *(void *)(a3 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1895F8858](v10);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v16);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  uint64_t v22 = 1LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1LL, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v25, v12, v24);
    }
    uint64_t v22 = 0LL;
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56LL))(a6, v22, 1LL);
}

uint64_t type metadata accessor for Atomic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Atomic);
}

uint64_t protocol witness for static AtomicOptionalRepresentable.decodeAtomicOptionalRepresentation(_:) in conformance Unmanaged<A>@<X0>( void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  v7[4] = *a1;
  v7[2] = *(void *)(a2 + 16);
  swift_getCanonicalSpecializedMetadata();
  uint64_t result = _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF( (void (*)(char *, char *))closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:)partial apply,  (uint64_t)v7,  MEMORY[0x18961A520],  a2,  v5,  (uint64_t)&v8);
  *a3 = v8;
  return result;
}

uint64_t _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06encodeB14Representationy0bE0QzxnFZTW@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06encodeB14Representationy0bE0QzxnFZTWTm( a1,  a2,  MEMORY[0x189617C28],  a3);
}

uint64_t _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06decodeB14Representationyx0bE0QznFZTW@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06decodeB14Representationyx0bE0QznFZTWTm( a1,  a2,  MEMORY[0x189617C30],  a3);
}

uint64_t _sSryxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06encodeB14Representationy0bE0QzxnFZTW@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06encodeB14Representationy0bE0QzxnFZTWTm( a1,  a2,  MEMORY[0x189618AD0],  a3);
}

uint64_t _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06encodeB14Representationy0bE0QzxnFZTWTm@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void, uint64_t, void)@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v5 = a1[1];
  uint64_t result = a3(*a1, v5, *(void *)(a2 + 16));
  *a4 = result;
  a4[1] = v5;
  return result;
}

uint64_t _sSryxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06decodeB14Representationyx0bE0QznFZTW@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06decodeB14Representationyx0bE0QznFZTWTm( a1,  a2,  MEMORY[0x189618AE0],  a3);
}

uint64_t _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06decodeB14Representationyx0bE0QznFZTWTm@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void, void, void)@<X3>, uint64_t *a4@<X8>)
{
  uint64_t result = a3(*a1, a1[1], *(void *)(a2 + 16));
  *a4 = result;
  a4[1] = v6;
  return result;
}

uint64_t *protocol witness for static AtomicRepresentable.encodeAtomicRepresentation(_:) in conformance UnsafeRawBufferPointer@<X0>( uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *result;
  if (*result)
  {
    uint64_t v3 = result[1] - v2;
    *a2 = v2;
    a2[1] = v3;
  }

  else
  {
    *a2 = 0LL;
    a2[1] = 0LL;
  }

  return result;
}

void *protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance UnsafeRawBufferPointer@<X0>( void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *result + result[1];
  if (!*result) {
    uint64_t v2 = 0LL;
  }
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t *protocol witness for static AtomicRepresentable.encodeAtomicRepresentation(_:) in conformance Duration@<X0>( uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *result;
  *a2 = result[1];
  a2[1] = v2;
  return result;
}

uint64_t *protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance Duration@<X0>( uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *result;
  *a2 = result[1];
  a2[1] = v2;
  return result;
}

uint64_t WordPair.first.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*WordPair.first.modify())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t WordPair.second.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t WordPair.second.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*WordPair.second.modify())()
{
  return AtomicLazyReference.storage.read;
}

void *protocol witness for static AtomicRepresentable.encodeAtomicRepresentation(_:) in conformance WordPair@<X0>( void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

void *protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance WordPair@<X0>( void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance WordPair(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

Swift::Int WordPair.hashValue.getter(Swift::UInt a1, Swift::UInt a2)
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance WordPair()
{
  Swift::UInt v1 = *v0;
  Swift::UInt v2 = v0[1];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance WordPair()
{
  Swift::UInt v1 = v0[1];
  Hasher._combine(_:)(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance WordPair()
{
  Swift::UInt v1 = *v0;
  Swift::UInt v2 = v0[1];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance WordPair()
{
  return WordPair.description.getter(*v0, v0[1]);
}

unint64_t WordPair.description.getter()
{
  v0._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 0x646E6F636573202CLL;
  v1._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v1);
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 41LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  return 0xD000000000000010LL;
}

uint64_t (*_MutexHandle.value.read())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t (*_s15Synchronization5MutexVAARi_zrlE6handleAA01_B6HandleVvr())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t (*_s15Synchronization5MutexVAARi_zrlE5valueAA5_CellVyxGvr())()
{
  return AtomicLazyReference.storage.read;
}

_WORD *protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance Int16@<X0>( _WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t _Atomic8BitStorage._storage.setter(uint64_t result)
{
  _BYTE *v1 = result;
  return result;
}

uint64_t (*_Atomic8BitStorage._storage.modify())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t _Atomic16BitStorage._storage.setter(uint64_t result)
{
  _WORD *v1 = result;
  return result;
}

uint64_t (*_Atomic16BitStorage._storage.modify())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t _Atomic32BitStorage._storage.setter(uint64_t result)
{
  _DWORD *v1 = result;
  return result;
}

uint64_t (*_Atomic32BitStorage._storage.modify())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t _Atomic64BitStorage._storage.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*_Atomic64BitStorage._storage.modify())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t _Atomic128BitStorage._storage.setter(uint64_t result, uint64_t a2)
{
  *Swift::String v2 = result;
  v2[1] = a2;
  return result;
}

uint64_t (*_Atomic128BitStorage._storage.modify())()
{
  return AtomicLazyReference.storage.read;
}

unint64_t lazy protocol witness table accessor for type AtomicLoadOrdering and conformance AtomicLoadOrdering()
{
  unint64_t result = lazy protocol witness table cache variable for type AtomicLoadOrdering and conformance AtomicLoadOrdering;
  if (!lazy protocol witness table cache variable for type AtomicLoadOrdering and conformance AtomicLoadOrdering)
  {
    unint64_t result = MEMORY[0x1895E8874]( &protocol conformance descriptor for AtomicLoadOrdering,  &type metadata for AtomicLoadOrdering);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type AtomicLoadOrdering and conformance AtomicLoadOrdering);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type AtomicStoreOrdering and conformance AtomicStoreOrdering()
{
  unint64_t result = lazy protocol witness table cache variable for type AtomicStoreOrdering and conformance AtomicStoreOrdering;
  if (!lazy protocol witness table cache variable for type AtomicStoreOrdering and conformance AtomicStoreOrdering)
  {
    unint64_t result = MEMORY[0x1895E8874]( &protocol conformance descriptor for AtomicStoreOrdering,  &type metadata for AtomicStoreOrdering);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type AtomicStoreOrdering and conformance AtomicStoreOrdering);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type AtomicUpdateOrdering and conformance AtomicUpdateOrdering()
{
  unint64_t result = lazy protocol witness table cache variable for type AtomicUpdateOrdering and conformance AtomicUpdateOrdering;
  if (!lazy protocol witness table cache variable for type AtomicUpdateOrdering and conformance AtomicUpdateOrdering)
  {
    unint64_t result = MEMORY[0x1895E8874]( &protocol conformance descriptor for AtomicUpdateOrdering,  &type metadata for AtomicUpdateOrdering);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type AtomicUpdateOrdering and conformance AtomicUpdateOrdering);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type WordPair and conformance WordPair()
{
  unint64_t result = lazy protocol witness table cache variable for type WordPair and conformance WordPair;
  if (!lazy protocol witness table cache variable for type WordPair and conformance WordPair)
  {
    unint64_t result = MEMORY[0x1895E8874](&protocol conformance descriptor for WordPair, &type metadata for WordPair);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type WordPair and conformance WordPair);
  }

  return result;
}

uint64_t type metadata instantiation function for Atomic()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for Atomic()
{
  uint64_t v8 = &v5;
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t v2 = *(void *)(result - 8);
    int v3 = *(_DWORD *)(v2 + 84);
    int v4 = *(unsigned __int8 *)(v2 + 80) | 0x10000;
    __int128 v5 = *(_OWORD *)(v2 + 64);
    int v6 = v4;
    int v7 = v3;
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t destroy for Atomic(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8LL))( a1,  AssociatedTypeWitness);
}

uint64_t assignWithTake for Atomic(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40LL))( a1,  a2,  AssociatedTypeWitness);
  return a1;
}

uint64_t getEnumTagSinglePayload for Atomic(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 48LL))( a1,  a2,  AssociatedTypeWitness);
}

uint64_t storeEnumTagSinglePayload for Atomic(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( a1,  a2,  a3,  AssociatedTypeWitness);
}

uint64_t destroy for AtomicLazyReference(uint64_t a1, uint64_t a2)
{
  return AtomicLazyReference.deinit(a2);
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AtomicLazyReference(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for AtomicLazyReference(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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

  *(_BYTE *)(result + 8) = v3;
  return result;
}

uint64_t type metadata accessor for AtomicLazyReference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AtomicLazyReference);
}

uint64_t sub_1894FD598()
{
  if (!MEMORY[0x18961B3F0]) {
    return MEMORY[0x18961AFC8] + 8LL;
  }
  type metadata accessor for Unmanaged();
  uint64_t v0 = type metadata accessor for Optional();
  int v4 = &protocol witness table for Unmanaged<A>;
  uint64_t v1 = MEMORY[0x1895E8874](&protocol conformance descriptor for <A> A?, v0, &v4);
  return type metadata accessor for Atomic(0LL, v0, v1, v2);
}

ValueMetadata *type metadata accessor for AtomicLoadOrdering()
{
  return &type metadata for AtomicLoadOrdering;
}

ValueMetadata *type metadata accessor for AtomicStoreOrdering()
{
  return &type metadata for AtomicStoreOrdering;
}

ValueMetadata *type metadata accessor for AtomicUpdateOrdering()
{
  return &type metadata for AtomicUpdateOrdering;
}

uint64_t dispatch thunk of static AtomicOptionalRepresentable.decodeAtomicOptionalRepresentation(_:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of static AtomicRepresentable.encodeAtomicRepresentation(_:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static AtomicRepresentable.decodeAtomicRepresentation(_:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WordPair(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for WordPair(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for WordPair()
{
  return &type metadata for WordPair;
}

uint64_t type metadata instantiation function for _Cell()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for _Cell()
{
  uint64_t v8 = &v5;
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t v2 = *(void *)(result - 8);
    int v3 = *(_DWORD *)(v2 + 84);
    int v4 = *(unsigned __int8 *)(v2 + 80) | 0x10000;
    __int128 v5 = *(_OWORD *)(v2 + 64);
    int v6 = v4;
    int v7 = v3;
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t destroy for _Cell(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8LL) + 8LL))();
}

uint64_t initializeWithTake for _Cell(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t assignWithTake for _Cell(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t getEnumTagSinglePayload for _Cell(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a3 + 16) - 8LL) + 48LL))();
}

uint64_t storeEnumTagSinglePayload for _Cell(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a4 + 16) - 8LL) + 56LL))();
}

uint64_t type metadata accessor for _Cell(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _Cell);
}

_DWORD *__swift_memcpy4_4(_DWORD *result, _DWORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for _MutexHandle(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for _MutexHandle(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)uint64_t result = a2 - 1;
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

  *(_BYTE *)(result + 4) = v3;
  return result;
}

void *type metadata accessor for _MutexHandle()
{
  return &type metadata for _MutexHandle;
}

uint64_t sub_1894FD85C()
{
  if (MEMORY[0x18961B3F0]) {
    return __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _Cell<os_unfair_lock_s>);
  }
  else {
    return MEMORY[0x18961AFC8] + 8LL;
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E8868]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t type metadata completion function for Mutex(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for _Cell(319LL, *(void *)(a1 + 16), a3, a4);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t destroy for Mutex(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8LL) + 8LL))((a1 + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8LL) + 80LL) + 4) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8LL) + 80LL));
}

_DWORD *initializeWithTake for Mutex(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))( ((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80),  ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_BYTE *assignWithTake for Mutex(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(unint64_t, unint64_t))(v4 + 40))( (unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 4] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80),  (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 4] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

uint64_t getEnumTagSinglePayload for Mutex(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_18;
  }
  uint64_t v8 = ((v6 + 4) & ~v6) + *(void *)(v4 + 64);
  char v9 = 8 * v8;
  if (v8 <= 3)
  {
    unsigned int v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)(a1 + v8);
      if (!v10) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v11 > 0xFF)
    {
      int v10 = *(unsigned __int16 *)(a1 + v8);
      if (!*(_WORD *)(a1 + v8)) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v11 < 2)
    {
LABEL_18:
      if (v5) {
        return (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v6 + 4) & ~v6);
      }
      return 0LL;
    }
  }

  int v10 = *(unsigned __int8 *)(a1 + v8);
  if (!*(_BYTE *)(a1 + v8)) {
    goto LABEL_18;
  }
LABEL_11:
  int v12 = (v10 - 1) << v9;
  if (!(_DWORD)v8) {
    return v5 + v12 + 1;
  }
  return ((uint64_t (*)(void))((char *)&loc_1894FDABC + 4 * byte_1894FE6F6[(v8 - 1)]))();
}

void storeEnumTagSinglePayload for Mutex(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  size_t v9 = ((v8 + 4) & ~v8) + *(void *)(v6 + 64);
  BOOL v10 = a3 >= v7;
  unsigned int v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v9 <= 3)
    {
      unsigned int v14 = ((v11 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v14))
      {
        unsigned int v12 = 4u;
      }

      else if (v14 >= 0x100)
      {
        unsigned int v12 = 2;
      }

      else
      {
        unsigned int v12 = v14 > 1;
      }
    }

    else
    {
      unsigned int v12 = 1u;
    }
  }

  else
  {
    unsigned int v12 = 0u;
  }

  if (v7 < a2)
  {
    unsigned int v13 = ~v7 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        int v15 = v13 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v15;
          *((_BYTE *)a1 + 2) = BYTE2(v15);
        }

        else if ((_DWORD)v9 == 2)
        {
          *a1 = v15;
        }

        else
        {
          *(_BYTE *)a1 = v15;
        }
      }
    }

    else
    {
      bzero(a1, ((v8 + 4) & ~v8) + *(void *)(v6 + 64));
      *(_DWORD *)a1 = v13;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X13 }
}

uint64_t type metadata accessor for Mutex(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Mutex);
}

void *sub_1894FDCF4()
{
  if (MEMORY[0x18961B3F0]) {
    return &type metadata for _MutexHandle;
  }
  else {
    return (void *)(MEMORY[0x18961AFC8] + 8LL);
  }
}

uint64_t sub_1894FDD1C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MEMORY[0x18961B3F0]) {
    return type metadata accessor for _Cell(0LL, *a1, a3, a4);
  }
  else {
    return MEMORY[0x18961AFC8] + 8LL;
  }
}

ValueMetadata *type metadata accessor for _Atomic8BitStorage()
{
  return &type metadata for _Atomic8BitStorage;
}

ValueMetadata *type metadata accessor for _Atomic16BitStorage()
{
  return &type metadata for _Atomic16BitStorage;
}

ValueMetadata *type metadata accessor for _Atomic32BitStorage()
{
  return &type metadata for _Atomic32BitStorage;
}

ValueMetadata *type metadata accessor for _Atomic64BitStorage()
{
  return &type metadata for _Atomic64BitStorage;
}

ValueMetadata *type metadata accessor for _Atomic128BitStorage()
{
  return &type metadata for _Atomic128BitStorage;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!lazy cache variable for type metadata for os_unfair_lock_s)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for os_unfair_lock_s);
    }
  }

uint64_t *initializeBufferWithCopyOfBuffer for Optional(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v8 = *(void *)(v6 + 64);
  }
  else {
    size_t v8 = *(void *)(v6 + 64) + 1LL;
  }
  if (*(_DWORD *)(v6 + 80) > 7u || (v7 & 0x100000) != 0 || v8 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16LL) & ~(unint64_t)v7));
    swift_retain();
  }

  else if ((*(unsigned int (**)(uint64_t *, uint64_t, void))(v6 + 48))(a2, 1LL, *(void *)(a3 + 16)))
  {
    memcpy(a1, a2, v8);
  }

  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0LL, 1LL, v5);
  }

  return a1;
}

uint64_t destroy for Optional(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1LL, v3);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1LL, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1LL;
    }
    memcpy(a1, a2, v7);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0LL, 1LL, v5);
  }

  return a1;
}

void *assignWithCopy for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1LL, v5);
  int v9 = v7(a2, 1LL, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0LL, 1LL, v5);
      return a1;
    }
  }

  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }

  if (*(_DWORD *)(v6 + 84)) {
    size_t v10 = *(void *)(v6 + 64);
  }
  else {
    size_t v10 = *(void *)(v6 + 64) + 1LL;
  }
  memcpy(a1, a2, v10);
  return a1;
}

void *initializeWithTake for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1LL, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1LL;
    }
    memcpy(a1, a2, v7);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0LL, 1LL, v5);
  }

  return a1;
}

void *assignWithTake for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1LL, v5);
  int v9 = v7(a2, 1LL, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0LL, 1LL, v5);
      return a1;
    }
  }

  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }

  if (*(_DWORD *)(v6 + 84)) {
    size_t v10 = *(void *)(v6 + 64);
  }
  else {
    size_t v10 = *(void *)(v6 + 64) + 1LL;
  }
  memcpy(a1, a2, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for Optional(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0LL;
  }
  int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)(a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }

    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_24;
        }
LABEL_8:
        int v10 = *(unsigned __int8 *)(a1 + v7);
        if (!*(_BYTE *)(a1 + v7)) {
          goto LABEL_24;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if ((_DWORD)v7)
        {
          else {
            int v13 = 4;
          }
          __asm { BR              X12 }
        }

        return v6 + v12 + 1;
      }

      int v10 = *(unsigned __int16 *)(a1 + v7);
      if (*(_WORD *)(a1 + v7)) {
        goto LABEL_15;
      }
    }
  }

LABEL_24:
  if (v5 < 2) {
    return 0LL;
  }
  unsigned int v14 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v14 >= 2) {
    return v14 - 1;
  }
  else {
    return 0LL;
  }
}

void storeEnumTagSinglePayload for Optional(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6 = 0u;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8LL);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (v8)
  {
    size_t v10 = *(void *)(v7 + 64);
  }

  else
  {
    unsigned int v9 = 0;
    size_t v10 = *(void *)(v7 + 64) + 1LL;
  }

  BOOL v11 = a3 >= v9;
  unsigned int v12 = a3 - v9;
  if (v12 != 0 && v11)
  {
    if (v10 > 3)
    {
      unsigned int v6 = 1u;
      if (v9 < a2) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }

    unsigned int v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v13))
    {
      unsigned int v6 = 4u;
      if (v9 < a2)
      {
LABEL_14:
        unsigned int v14 = ~v9 + a2;
        if (v10 < 4)
        {
          if ((_DWORD)v10)
          {
            int v15 = v14 & ~(-1 << (8 * v10));
            bzero(a1, v10);
            if ((_DWORD)v10 == 3)
            {
              *a1 = v15;
              *((_BYTE *)a1 + 2) = BYTE2(v15);
            }

            else if ((_DWORD)v10 == 2)
            {
              *a1 = v15;
            }

            else
            {
              *(_BYTE *)a1 = v15;
            }
          }
        }

        else
        {
          bzero(a1, v10);
          *(_DWORD *)a1 = v14;
        }

        __asm { BR              X10 }
      }

LABEL_21:
      __asm { BR              X11 }
    }

    if (v13 >= 0x100) {
      unsigned int v6 = 2;
    }
    else {
      unsigned int v6 = v13 > 1;
    }
  }

  if (v9 < a2) {
    goto LABEL_14;
  }
  goto LABEL_21;
}

void sub_1894FE504()
{
  *(_BYTE *)(v0 + v1) = v2;
}

void sub_1894FE50C()
{
  *(_WORD *)(v0 + v1) = v2;
}

uint64_t getEnumTag for Optional(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8LL) + 48LL))(a1, 1LL);
}

uint64_t destructiveInjectEnumTag for Optional(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8LL) + 56LL))( a1,  a2,  1LL);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1895E885C](a1, v6, a5);
}

void *closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:)partial apply@<X0>( void *a1@<X0>, void *a2@<X8>)
{
  return partial apply for closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:)(a1, a2);
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x189618A80]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x189618AC0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x189619CC8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x18961A680]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t type metadata accessor for Unmanaged()
{
  return MEMORY[0x18961AF78]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x18961B0C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x18961B128]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x18961B220]();
}

uint64_t swift_getCanonicalSpecializedMetadata()
{
  return MEMORY[0x18961B240]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x18961B358]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}
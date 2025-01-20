Compression::Algorithm_optional __swiftcall Algorithm.init(rawValue:)(compression_algorithm rawValue)
{
  _BYTE *v1;
  if ((int)rawValue > 1793)
  {
    switch(rawValue)
    {
      case 0x702u:
        *v1 = 4;
        return (Compression::Algorithm_optional)rawValue;
      case 0x801u:
        *v1 = 0;
        return (Compression::Algorithm_optional)rawValue;
      case 0xB02u:
        *v1 = 5;
        return (Compression::Algorithm_optional)rawValue;
    }

LABEL_14:
    *v1 = 6;
    return (Compression::Algorithm_optional)rawValue;
  }

  if (rawValue == COMPRESSION_LZ4)
  {
    *v1 = 2;
    return (Compression::Algorithm_optional)rawValue;
  }

  if (rawValue == COMPRESSION_ZLIB)
  {
    *v1 = 1;
    return (Compression::Algorithm_optional)rawValue;
  }

  if (rawValue != COMPRESSION_LZMA) {
    goto LABEL_14;
  }
  *v1 = 3;
  return (Compression::Algorithm_optional)rawValue;
}

uint64_t Algorithm.rawValue.getter()
{
  return dword_1873691B0[*v0];
}

void Algorithm.hash(into:)()
{
}

void *static Algorithm.allCases.getter()
{
  return &outlined read-only object #0 of static Algorithm.allCases.getter;
}

Swift::Int Algorithm.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Algorithm(char *a1, char *a2)
{
  return dword_1873691B0[*a1] == dword_1873691B0[*a2];
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Algorithm()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Algorithm()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Algorithm()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for static CaseIterable.allCases.getter in conformance Algorithm(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static Algorithm.allCases.getter;
}

Compression::Algorithm_optional protocol witness for RawRepresentable.init(rawValue:) in conformance Algorithm( compression_algorithm *a1)
{
  return Algorithm.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance Algorithm(_DWORD *a1@<X8>)
{
  *a1 = dword_1873691B0[*v1];
}

Compression::FilterOperation_optional __swiftcall FilterOperation.init(rawValue:)( compression_stream_operation rawValue)
{
  if (rawValue == COMPRESSION_STREAM_DECODE) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (rawValue == COMPRESSION_STREAM_ENCODE) {
    char v2 = 0;
  }
  *Swift::UInt v1 = v2;
  return (Compression::FilterOperation_optional)rawValue;
}

uint64_t FilterOperation.rawValue.getter()
{
  return *v0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FilterOperation( unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance FilterOperation@<X0>( _DWORD *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance FilterOperation(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

BOOL static FilterError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void FilterError.hash(into:)()
{
}

uint64_t OutputFilter.__allocating_init(_:using:bufferCapacity:writingTo:)( unsigned __int8 *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  OutputFilter.init(_:using:bufferCapacity:writingTo:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t OutputFilter.init(_:using:bufferCapacity:writingTo:)( unsigned __int8 *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned __int8 v10 = *a1;
  char v11 = *a2;
  *(_BYTE *)(v5 + 88) = 0;
  unsigned __int8 v15 = v10;
  char v14 = v11;
  specialized compression_stream.init(operation:algorithm:)(&v15, &v14, (uint64_t)v16);
  if (v6)
  {
    swift_release();
    type metadata accessor for OutputFilter();
    swift_deallocPartialClassInstance();
  }

  else
  {
    __int128 v12 = v16[1];
    *(_OWORD *)(v5 + 16) = v16[0];
    *(_OWORD *)(v5 + 32) = v12;
    *(void *)(v5 + 48) = v17;
    *(void *)(v5 + 56) = swift_slowAlloc();
    *(void *)(v5 + 64) = a3;
    *(void *)(v5 + 72) = a4;
    *(void *)(v5 + 80) = a5;
  }

  return v5;
}

void OutputFilter.write<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v58 = a3;
  uint64_t v6 = *(void *)(*(void *)(swift_getAssociatedConformanceWitness() + 8) + 8LL);
  uint64_t v55 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  ((void (*)(void))MEMORY[0x1895F8858])();
  v45 = (char *)&v43 - v7;
  uint64_t v50 = v8;
  type metadata accessor for Optional();
  ((void (*)(void))MEMORY[0x1895F8858])();
  v53 = (char *)&v43 - v9;
  swift_checkMetadataState();
  ((void (*)(void))MEMORY[0x1895F8858])();
  v46 = (char *)&v43 - v10;
  uint64_t v47 = v11;
  uint64_t v48 = v6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v49 = *(void *)(AssociatedTypeWitness - 8);
  ((void (*)(void))MEMORY[0x1895F8858])();
  v56 = (char *)&v43 - v12;
  uint64_t v13 = type metadata accessor for Optional();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  v51 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = MEMORY[0x1895F8858](v15);
  v19 = (char *)&v43 - v18;
  MEMORY[0x1895F8858](v17);
  v21 = (char *)&v43 - v20;
  uint64_t v22 = *(void *)(a2 - 8);
  v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48);
  unsigned int v24 = v23(a1, 1LL, a2);
  uint64_t v25 = a1;
  v26 = *(void (**)(char *))(v14 + 16);
  uint64_t v52 = v25;
  v26(v21);
  if (v24 == 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v21, v13);
LABEL_5:
    OutputFilter.finalize()();
    return;
  }

  v44 = (void (*)(char *, uint64_t, uint64_t))v26;
  ((void (*)(char *, char *, uint64_t))v26)(v19, v21, v13);
  if (v23((uint64_t)v19, 1LL, a2) == 1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }

  v27 = (unsigned int (*)(char *, uint64_t, uint64_t))v23;
  char v28 = dispatch thunk of Collection.isEmpty.getter();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v21, v13);
  v29 = *(void (**)(char *, uint64_t))(v22 + 8);
  v29(v19, a2);
  if ((v28 & 1) != 0) {
    goto LABEL_5;
  }
  if (*(_BYTE *)(v59 + 88) == 1)
  {
    lazy protocol witness table accessor for type FilterError and conformance FilterError();
    swift_allocError();
    _BYTE *v30 = 1;
    swift_willThrow();
    return;
  }

  uint64_t v31 = a2;
  v32 = v51;
  v44(v51, v52, v13);
  if (v27(v32, 1LL, a2) == 1) {
    goto LABEL_16;
  }
  dispatch thunk of DataProtocol.regions.getter();
  v29(v32, a2);
  dispatch thunk of Sequence.makeIterator()();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v34 = v53;
  uint64_t v52 = AssociatedConformanceWitness;
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v35 = v55;
  uint64_t v36 = v50;
  v51 = *(char **)(v55 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v51)(v34, 1LL, v50) == 1)
  {
LABEL_13:
    (*(void (**)(char *, uint64_t))(v49 + 8))(v56, AssociatedTypeWitness);
  }

  else
  {
    v37 = *(uint64_t (**)(char *, char *, uint64_t))(v35 + 32);
    v39 = v53;
    uint64_t v38 = v54;
    v40 = v45;
    while (1)
    {
      uint64_t v41 = v37(v40, v39, v36);
      MEMORY[0x1895F8858](v41);
      uint64_t v42 = v58;
      *(&v43 - 4) = v31;
      *(&v43 - 3) = v42;
      *(&v43 - 2) = v59;
      *(&v43 - 1) = (uint64_t)v40;
      swift_getAssociatedConformanceWitness();
      dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
      if (v38) {
        break;
      }
      (*(void (**)(char *, uint64_t))(v55 + 8))(v40, v36);
      dispatch thunk of IteratorProtocol.next()();
    }

    (*(void (**)(char *, uint64_t))(v49 + 8))(v56, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v40, v36);
  }
}

uint64_t closure #1 in OutputFilter.write<A>(_:)(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Data.Deallocator();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v28 = v6;
  uint64_t v29 = v7;
  MEMORY[0x1895F8858]();
  v27 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v9 = dispatch thunk of Collection.count.getter();
  v30 = (compression_stream *)(a2 + 2);
  uint64_t result = swift_beginAccess();
  a2[5] = v9;
  if (!a1)
  {
LABEL_13:
    __break(1u);
    return result;
  }

  a2[4] = a1;
  if (v9 >= 1)
  {
    HIDWORD(v26) = *MEMORY[0x189606B30];
    uint64_t v11 = v28;
    while (1)
    {
      uint64_t v12 = a2[7];
      uint64_t v13 = v30;
      swift_beginAccess();
      uint64_t v14 = a2[8];
      a2[2] = v12;
      a2[3] = v14;
      LODWORD(v12) = compression_stream_process(v13, 0);
      uint64_t result = swift_endAccess();
      if ((_DWORD)v12 == -1)
      {
        lazy protocol witness table accessor for type FilterError and conformance FilterError();
        swift_allocError();
        *uint64_t v25 = 1;
        return swift_willThrow();
      }

      uint64_t v15 = a2[3];
      uint64_t v16 = v14 - v15;
      if (__OFSUB__(v14, v15)) {
        break;
      }
      if (v16 > 0)
      {
        uint64_t v17 = v29;
        uint64_t v18 = v3;
        v19 = v27;
        (*(void (**)(char *, void, uint64_t))(v29 + 104))(v27, HIDWORD(v26), v11);
        Data.Deallocator._deallocator.getter();
        type metadata accessor for __DataStorage();
        swift_allocObject();
        swift_retain();
        uint64_t v20 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
        uint64_t v21 = specialized Data._Representation.init(_:count:)(v20, v16);
        unint64_t v23 = v22;
        swift_release();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v11);
        unsigned int v24 = (void (*)(uint64_t, unint64_t))a2[9];
        outlined copy of Data._Representation(v21, v23);
        v24(v21, v23);
        uint64_t v3 = v18;
        outlined consume of Data._Representation(v21, v23);
        uint64_t result = outlined consume of Data._Representation(v21, v23);
        if (v18) {
          return result;
        }
      }
    }

    __break(1u);
    goto LABEL_13;
  }

  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> OutputFilter.finalize()()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = type metadata accessor for Data.Deallocator();
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  MEMORY[0x1895F8858]();
  uint64_t v25 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((*(_BYTE *)(v0 + 88) & 1) == 0)
  {
    uint64_t v28 = (compression_stream *)(v0 + 16);
    swift_beginAccess();
    *(void *)(v0 + 40) = 0LL;
    uint64_t v6 = *(void *)(v0 + 64);
    unsigned int v24 = *MEMORY[0x189606B30];
    uint64_t v23 = v6;
    uint64_t v7 = v27;
    while (1)
    {
      uint64_t v8 = *(void *)(v3 + 56);
      uint64_t v9 = v28;
      swift_beginAccess();
      *(void *)(v3 + 16) = v8;
      *(void *)(v3 + 24) = v6;
      compression_status v10 = compression_stream_process(v9, 1);
      swift_endAccess();
      if (v10 == COMPRESSION_STATUS_ERROR)
      {
        lazy protocol witness table accessor for type FilterError and conformance FilterError();
        swift_allocError();
        *unint64_t v22 = 1;
        swift_willThrow();
        return;
      }

      uint64_t v11 = *(void *)(v3 + 24);
      uint64_t v12 = v6 - v11;
      if (__OFSUB__(v6, v11)) {
        break;
      }
      if (v12 >= 1)
      {
        uint64_t v13 = v26;
        uint64_t v14 = *(void (**)(char *, void, uint64_t))(v26 + 104);
        uint64_t v29 = v2;
        uint64_t v15 = v25;
        v14(v25, v24, v7);
        Data.Deallocator._deallocator.getter();
        type metadata accessor for __DataStorage();
        swift_allocObject();
        swift_retain();
        uint64_t v16 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
        uint64_t v17 = specialized Data._Representation.init(_:count:)(v16, v12);
        unint64_t v19 = v18;
        swift_release();
        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v7);
        uint64_t v20 = *(void (**)(uint64_t, unint64_t))(v3 + 72);
        outlined copy of Data._Representation(v17, v19);
        uint64_t v21 = v29;
        v20(v17, v19);
        uint64_t v2 = v21;
        outlined consume of Data._Representation(v17, v19);
        outlined consume of Data._Representation(v17, v19);
        if (v21) {
          return;
        }
        uint64_t v6 = v23;
      }

      if (v10 == COMPRESSION_STATUS_END)
      {
        *(_BYTE *)(v3 + 88) = 1;
        (*(void (**)(void, unint64_t))(v3 + 72))(0LL, 0xF000000000000000LL);
        return;
      }
    }

    __break(1u);
  }

uint64_t OutputFilter.deinit()
{
  if (v1) {
    MEMORY[0x1895A3B4C](v1);
  }
  MEMORY[0x1895A3BDC](*(void *)(v0 + 56), -1LL, -1LL);
  swift_beginAccess();
  compression_stream_destroy((compression_stream *)(v0 + 16));
  swift_endAccess();
  swift_release();
  return v0;
}

uint64_t OutputFilter.__deallocating_deinit()
{
  if (v1) {
    MEMORY[0x1895A3B4C](v1);
  }
  MEMORY[0x1895A3BDC](*(void *)(v0 + 56), -1LL, -1LL);
  swift_beginAccess();
  compression_stream_destroy((compression_stream *)(v0 + 16));
  swift_endAccess();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t InputFilter.InputFilterBuffer.remaining()()
{
  return *(void *)(v0 + *(void *)(*(void *)v0 + 120LL));
}

uint64_t InputFilter.InputFilterBuffer.withUnsafeBytes<A>(_:)@<X0>( uint64_t (*a1)(void, void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v38 = a3;
  uint64_t v5 = v4;
  uint64_t v36 = a2;
  v37 = a1;
  uint64_t v40 = a4;
  uint64_t v6 = *v4;
  uint64_t v7 = *(void *)(*v4 + 104);
  uint64_t v8 = *(void *)(*v4 + 88);
  swift_getAssociatedTypeWitness();
  uint64_t v42 = v7;
  uint64_t v9 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v34 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v35 = AssociatedTypeWitness;
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v12 = (char *)v33 - v11;
  uint64_t v13 = swift_checkMetadataState();
  v33[0] = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x1895F8858](v13);
  uint64_t v16 = (char *)v33 - v15;
  uint64_t v17 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v14);
  unint64_t v19 = (char *)v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v33[1] = v9;
  uint64_t v20 = swift_getAssociatedTypeWitness();
  uint64_t v41 = *(void *)(v20 - 8);
  MEMORY[0x1895F8858](v20);
  v44 = (char *)v33 - v21;
  if (*(uint64_t *)((char *)v5 + *(void *)(v6 + 120)))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, (uint64_t)v5 + *(void *)(v6 + 112), v8);
    dispatch thunk of DataProtocol.regions.getter();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v8);
    uint64_t v22 = (uint64_t)v5 + *(void *)(*v5 + 128);
    swift_beginAccess();
    uint64_t v23 = v34;
    uint64_t v24 = v35;
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v12, v22, v35);
    uint64_t v25 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
    (*(void (**)(char *))(v41 + 16))(v44);
    v25(v43, 0LL);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v24);
    uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v33[0] + 8LL))(v16, v13);
    MEMORY[0x1895F8858](v26);
    uint64_t v27 = v37;
    v33[-4] = v38;
    v33[-3] = v5;
    uint64_t v28 = v36;
    v33[-2] = v27;
    v33[-1] = v28;
    swift_getAssociatedConformanceWitness();
    type metadata accessor for Optional();
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v44, v20);
  }

  else
  {
    uint64_t v31 = v38;
    uint64_t v30 = v39;
    uint64_t v32 = v40;
    uint64_t result = v37(0LL, 0LL);
    if (!v30) {
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56LL))( v32,  0LL,  1LL,  v31);
    }
  }

  return result;
}

uint64_t InputFilter.InputFilterBuffer.advance(by:)(uint64_t a1)
{
  uint64_t v60 = a1;
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 104);
  uint64_t v4 = *(void *)(*v1 + 88);
  swift_getAssociatedTypeWitness();
  uint64_t v59 = v3;
  uint64_t v5 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  v53 = (char *)&v48 - v6;
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v56 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v7);
  uint64_t v55 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = MEMORY[0x1895F8858](v8);
  v62 = (char *)&v48 - v11;
  v57 = *(uint64_t **)(v4 - 8);
  uint64_t v58 = v4;
  MEMORY[0x1895F8858](v10);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = swift_checkMetadataState();
  uint64_t result = MEMORY[0x1895F8858](v14);
  uint64_t v18 = (char *)&v48 - v17;
  uint64_t v19 = *(void *)(v2 + 136);
  uint64_t v20 = *(uint64_t *)((char *)v1 + v19);
  BOOL v21 = __OFSUB__(v20, v60);
  BOOL v22 = v20 < v60;
  uint64_t v23 = v20 - v60;
  if (v22)
  {
    lazy protocol witness table accessor for type FilterError and conformance FilterError();
    swift_allocError();
    *uint64_t v24 = 0;
    return swift_willThrow();
  }

  if (v21)
  {
    __break(1u);
    goto LABEL_16;
  }

  uint64_t v25 = v60;
  *(uint64_t *)((char *)v1 + v19) = v23;
  uint64_t v26 = *(void *)(*v1 + 120);
  uint64_t v27 = *(uint64_t *)((char *)v1 + v26);
  BOOL v21 = __OFSUB__(v27, v25);
  uint64_t v28 = v27 - v25;
  if (v21)
  {
LABEL_16:
    __break(1u);
    return result;
  }

  uint64_t v49 = v16;
  uint64_t v50 = v26;
  *(uint64_t *)((char *)v1 + v26) = v28;
  uint64_t v29 = v58;
  ((void (*)(char *, uint64_t, uint64_t))v57[2])(v13, (uint64_t)v1 + *(void *)(*v1 + 112), v58);
  dispatch thunk of DataProtocol.regions.getter();
  ((void (*)(char *, uint64_t))v57[1])(v13, v29);
  v57 = v1;
  uint64_t v51 = v19;
  uint64_t v30 = v62;
  if (!*(uint64_t *)((char *)v1 + v19))
  {
    uint64_t v60 = (uint64_t)v57 + *(void *)(*v57 + 128);
    do
    {
      uint64_t v31 = v60;
      swift_beginAccess();
      dispatch thunk of Collection.formIndex(after:)();
      swift_endAccess();
      uint64_t v32 = v56;
      v33 = *(void (**)(char *, uint64_t, uint64_t))(v56 + 16);
      v33(v30, v31, v7);
      uint64_t v34 = v55;
      dispatch thunk of Collection.endIndex.getter();
      swift_getAssociatedConformanceWitness();
      char v35 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v36 = *(void (**)(char *, uint64_t))(v32 + 8);
      v36(v34, v7);
      v36(v30, v7);
      if ((v35 & 1) != 0) {
        break;
      }
      v33(v30, v60, v7);
      v37 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
      uint64_t v38 = v54;
      uint64_t v39 = v14;
      uint64_t v40 = v53;
      uint64_t v41 = v18;
      uint64_t v42 = v5;
      uint64_t v43 = AssociatedTypeWitness;
      (*(void (**)(char *))(v54 + 16))(v53);
      v37(v61, 0LL);
      v36(v62, v7);
      swift_getAssociatedConformanceWitness();
      uint64_t v44 = dispatch thunk of Collection.count.getter();
      v45 = v40;
      uint64_t v14 = v39;
      uint64_t v30 = v62;
      uint64_t v46 = v43;
      uint64_t v5 = v42;
      uint64_t v18 = v41;
      (*(void (**)(char *, uint64_t))(v38 + 8))(v45, v46);
      *(uint64_t *)((char *)v57 + v51) = v44;
    }

    while (!v44);
  }

  lazy protocol witness table accessor for type FilterError and conformance FilterError();
  swift_allocError();
  *uint64_t v47 = 0;
  swift_willThrow();
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v18, v14);
}

uint64_t InputFilter.InputFilterBuffer.__deallocating_deinit()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 128LL);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8LL))(v1, AssociatedTypeWitness);
  return swift_deallocClassInstance();
}

__n128 InputFilter._stream.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 56);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 40);
  *(void *)(a1 + 16) = v3;
  __n128 result = *(__n128 *)(v1 + 64);
  *(__n128 *)(a1 + 24) = result;
  return result;
}

uint64_t InputFilter._buf.setter(uint64_t a1)
{
  *(void *)(v1 + 80) = a1;
  return swift_release();
}

uint64_t InputFilter._eofReached.getter()
{
  return *(unsigned __int8 *)(v0 + 88);
}

uint64_t InputFilter._eofReached.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 88) = result;
  return result;
}

uint64_t InputFilter._endReached.getter()
{
  return *(unsigned __int8 *)(v0 + 89);
}

uint64_t InputFilter._endReached.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 89) = result;
  return result;
}

uint64_t InputFilter.__allocating_init(_:using:bufferCapacity:readingFrom:)( unsigned __int8 *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  InputFilter.init(_:using:bufferCapacity:readingFrom:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t *InputFilter.init(_:using:bufferCapacity:readingFrom:)( unsigned __int8 *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *v5;
  unsigned __int8 v11 = *a1;
  char v12 = *a2;
  v5[10] = 0LL;
  *((_WORD *)v5 + 44) = 0;
  unsigned __int8 v19 = v11;
  char v18 = v12;
  specialized compression_stream.init(operation:algorithm:)(&v19, &v18, (uint64_t)v16);
  if (v6)
  {
    swift_release();
    swift_release();
    type metadata accessor for InputFilter(0LL, *(void *)(v10 + 80), *(void *)(v10 + 88), v13);
    swift_deallocPartialClassInstance();
  }

  else
  {
    __int128 v14 = v16[1];
    *(_OWORD *)(v5 + 5) = v16[0];
    *(_OWORD *)(v5 + 7) = v14;
    v5[9] = v17;
    v5[2] = a3;
    v5[3] = a4;
    v5[4] = a5;
  }

  return v5;
}

uint64_t InputFilter.readData(ofLength:)(uint64_t result)
{
  if (result < 1)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  if ((*(_BYTE *)(v1 + 89) & 1) != 0) {
    return 0LL;
  }
  uint64_t v3 = result;
  uint64_t v6 = specialized Data.init(count:)(result);
  unint64_t v7 = v4;
  MEMORY[0x1895F8858](v6);
  specialized Data._Representation.withUnsafeMutableBytes<A>(_:)();
  if (v2) {
    return outlined consume of Data._Representation(v6, v7);
  }
  swift_beginAccess();
  uint64_t v5 = *(void *)(v1 + 48);
  __n128 result = v3 - v5;
  if (__OFSUB__(v3, v5)) {
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000LL) == 0)
  {
    Data._Representation.count.setter();
    return v6;
  }

LABEL_11:
  __break(1u);
  return result;
}

uint64_t closure #1 in InputFilter.readData(ofLength:)(uint8_t *a1, compression_stream *a2, size_t a3)
{
  dst_ptr = a2->dst_ptr;
  uint64_t v8 = *((void *)a2->dst_ptr + 10);
  uint64_t v9 = type metadata accessor for Optional();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1895F8858](v9);
  uint64_t v40 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  MEMORY[0x1895F8858](v13);
  uint64_t v44 = (char *)&v33 - v15;
  if (!a1)
  {
LABEL_24:
    lazy protocol witness table accessor for type FilterError and conformance FilterError();
    swift_allocError();
    _BYTE *v32 = 1;
    return swift_willThrow();
  }

  uint64_t v39 = dst_ptr;
  uint64_t v41 = v14;
  uint64_t v16 = a2 + 1;
  swift_beginAccess();
  a2[1].dst_ptr = a1;
  a2[1].dst_size = a3;
  uint64_t result = swift_beginAccess();
  if ((uint64_t)a2[1].dst_size > 0 && (a2[2].dst_size & 0x100) == 0)
  {
    uint64_t v42 = MEMORY[0x18961AFC8] + 8LL;
    v37 = a2 + 1;
    uint64_t v38 = v8;
    uint64_t v36 = v10;
    char v18 = v44;
    do
    {
      uint64_t v19 = (uint64_t)a2[2].dst_ptr;
      if (v19 && *(void *)(v19 + *(void *)(*(void *)v19 + 120LL))) {
        goto LABEL_16;
      }
      if ((a2[2].dst_size & 1) == 0)
      {
        uint64_t result = ((uint64_t (*)(const uint8_t *))a2->src_size)(a2->src_ptr);
        if (v3) {
          return result;
        }
        uint64_t v20 = v18;
        BOOL v21 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 16);
        BOOL v22 = (char *)v41;
        v21(v41, v20, v9);
        uint64_t v23 = v10;
        uint64_t v24 = v9;
        uint64_t v25 = *(void *)(v8 - 8);
        uint64_t v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
        if (v26(v22, 1LL, v8) == 1)
        {
          (*(void (**)(char *, uint64_t))(v23 + 8))(v22, v24);
          uint64_t v9 = v24;
        }

        else
        {
          uint64_t v35 = *((void *)v39 + 11);
          uint64_t v27 = dispatch thunk of Collection.count.getter();
          uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
          v34((uint64_t)v22, v8);
          uint64_t v9 = v24;
          if (v27)
          {
            uint64_t v28 = v40;
            v21((uint64_t)v40, v44, v24);
            uint64_t v29 = v38;
            uint64_t result = v26(v28, 1LL, v38);
            if ((_DWORD)result != 1)
            {
              v43[0] = v29;
              v43[1] = v29;
              v43[2] = v35;
              v43[3] = v35;
              type metadata accessor for InputFilter.InputFilterBuffer();
            }

            __break(1u);
            return result;
          }
        }

        LOBYTE(a2[2].dst_size) = 1;
        uint64_t v16 = v37;
        uint64_t v8 = v38;
        char v18 = v44;
        a2[2].dst_ptr = 0LL;
        swift_release();
        uint64_t v10 = v36;
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v18, v9);
        uint64_t v19 = (uint64_t)a2[2].dst_ptr;
      }

      if (v19)
      {
LABEL_16:
        MEMORY[0x1895F8858](result);
        *(&v33 - 2) = (uint64_t)a2;
        *(&v33 - 1) = v19;
        swift_retain();
        InputFilter.InputFilterBuffer.withUnsafeBytes<A>(_:)( partial apply for closure #1 in closure #1 in InputFilter.readData(ofLength:),  (uint64_t)(&v33 - 4),  v42,  (uint64_t)v43);
        uint64_t result = swift_release();
        if (v3) {
          return result;
        }
      }

      else
      {
        int dst_size_low = LOBYTE(a2[2].dst_size);
        swift_beginAccess();
        compression_status v31 = compression_stream_process(v16, dst_size_low);
        swift_endAccess();
        if (v31 == COMPRESSION_STATUS_END)
        {
          BYTE1(a2[2].dst_size) = 1;
        }

        else if (v31 == COMPRESSION_STATUS_ERROR)
        {
          goto LABEL_24;
        }
      }

      uint64_t result = swift_beginAccess();
    }

    while ((uint64_t)a2[1].dst_size >= 1 && (a2[2].dst_size & 0x100) == 0);
  }

  return result;
}

compression_stream *InputFilter.deinit()
{
  return v0;
}

uint64_t InputFilter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance compression_algorithm( _DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance compression_algorithm@<X0>( _DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance compression_algorithm( _DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void specialized Data._Representation.withUnsafeMutableBytes<A>(_:)()
{
  __asm { BR              X12 }

uint64_t sub_187367400@<X0>(uint64_t a1@<X8>)
{
  uint64_t v6 = v1;
  LOWORD(v7) = a1;
  BYTE2(v7) = BYTE2(a1);
  HIBYTE(v7) = BYTE3(a1);
  unsigned __int8 v8 = BYTE4(a1);
  unsigned __int8 v9 = BYTE5(a1);
  unsigned __int8 v10 = BYTE6(a1);
  uint64_t result = v2(&v6, (char *)&v6 + BYTE6(a1));
  unint64_t v5 = v7 | ((unint64_t)v8 << 32) | ((unint64_t)v9 << 40) | ((unint64_t)v10 << 48);
  *uint64_t v3 = v6;
  v3[1] = v5;
  return result;
}

void specialized Data.InlineSlice.withUnsafeMutableBytes<A>(_:)(void (*a1)(uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  if ((int)v4 < (int)v3)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v5 = __DataStorage._bytes.getter();
  if (!v5)
  {
LABEL_10:
    __break(1u);
    return;
  }

  uint64_t v6 = v5;
  uint64_t v7 = __DataStorage._offset.getter();
  uint64_t v8 = v3 - v7;
  if (__OFSUB__(v3, v7))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v9 = v4 - v3;
  uint64_t v10 = __DataStorage._length.getter();
  if (v10 >= v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v10;
  }
  a1(v6 + v8, v6 + v8 + v11);
}

uint64_t specialized compression_stream.init(operation:algorithm:)@<X0>( unsigned __int8 *a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  compression_stream_operation v4 = *a1;
  uint64_t v5 = *a2;
  *(_OWORD *)&v10.dst_ptr = 0xFFFFFFFFFFFFFFFFLL;
  *(_OWORD *)&v10.src_size = 0uLL;
  v10.src_ptr = (const uint8_t *)-1LL;
  uint64_t result = compression_stream_init(&v10, v4, (compression_algorithm)dword_1873691B0[v5]);
  if ((_DWORD)result)
  {
    lazy protocol witness table accessor for type FilterError and conformance FilterError();
    swift_allocError();
    *uint64_t v7 = 0;
    return swift_willThrow();
  }

  else
  {
    src_ptr = v10.src_ptr;
    __int128 v9 = *(_OWORD *)&v10.src_size;
    *(_OWORD *)a3 = *(_OWORD *)&v10.dst_ptr;
    *(void *)(a3 + 16) = src_ptr;
    *(_OWORD *)(a3 + 24) = v9;
  }

  return result;
}

uint64_t type metadata accessor for OutputFilter()
{
  return objc_opt_self();
}

uint64_t partial apply for closure #1 in OutputFilter.write<A>(_:)(uint64_t a1)
{
  return closure #1 in OutputFilter.write<A>(_:)(a1, *(void **)(v1 + 32));
}

unint64_t lazy protocol witness table accessor for type FilterError and conformance FilterError()
{
  unint64_t result = lazy protocol witness table cache variable for type FilterError and conformance FilterError;
  if (!lazy protocol witness table cache variable for type FilterError and conformance FilterError)
  {
    unint64_t result = MEMORY[0x1895A3B94](&protocol conformance descriptor for FilterError, &type metadata for FilterError);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type FilterError and conformance FilterError);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type FilterError and conformance FilterError;
  if (!lazy protocol witness table cache variable for type FilterError and conformance FilterError)
  {
    unint64_t result = MEMORY[0x1895A3B94](&protocol conformance descriptor for FilterError, &type metadata for FilterError);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type FilterError and conformance FilterError);
  }

  return result;
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

uint64_t specialized Data._Representation.init(_:count:)(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    swift_release();
    return 0LL;
  }

  if (a2 > 14)
  {
    type metadata accessor for Data.RangeReference();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = 0LL;
    *(void *)(v3 + 24) = a2;
    return v3;
  }

  if (a2 < 0)
  {
    __break(1u);
  }

  else
  {
    compression_stream_operation v4 = (_BYTE *)__DataStorage._bytes.getter();
    if (!v4)
    {
LABEL_10:
      uint64_t v5 = __DataStorage._length.getter();
      if (v5 >= a2) {
        uint64_t v6 = a2;
      }
      else {
        uint64_t v6 = v5;
      }
      uint64_t v7 = &v4[v6];
      if (v4) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0LL;
      }
      uint64_t v3 = specialized Data.InlineData.init(_:)(v4, v8);
      swift_release();
      return v3;
    }

    unint64_t result = __DataStorage._offset.getter();
    if (!__OFSUB__(0LL, result))
    {
      v4 -= result;
      goto LABEL_10;
    }
  }

  __break(1u);
  return result;
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

uint64_t type metadata accessor for InputFilter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InputFilter);
}

void *specialized InputFilter.InputFilterBuffer.init(_:)(uint64_t a1)
{
  unint64_t v2 = v1;
  compression_stream_operation v4 = (void *)*v1;
  uint64_t v70 = v4[13];
  uint64_t v5 = v4[11];
  swift_getAssociatedTypeWitness();
  uint64_t v68 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v62 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v55 = (char *)&v49 - v6;
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v59 = *(void *)(v7 - 8);
  uint64_t v60 = v7;
  uint64_t v8 = MEMORY[0x1895F8858](v7);
  v61 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v8);
  uint64_t v58 = (char *)&v49 - v10;
  uint64_t v11 = swift_checkMetadataState();
  v66 = *(void **)(v11 - 8);
  uint64_t v67 = v11;
  uint64_t v12 = MEMORY[0x1895F8858](v11);
  __int128 v14 = (char *)&v49 - v13;
  uint64_t v15 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v12);
  uint64_t v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v18 = (char *)v2 + v4[14];
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v19(v18, a1, v5);
  v19(v17, (uint64_t)v18, v5);
  uint64_t v20 = dispatch thunk of Collection.count.getter();
  BOOL v21 = *(void (**)(char *, uint64_t))(v15 + 8);
  v21(v17, v5);
  v64 = v21;
  *(void *)((char *)v2 + *(void *)(*v2 + 120LL)) = v20;
  uint64_t v54 = *(void *)(*v2 + 136LL);
  *(void *)((char *)v2 + v54) = 0LL;
  v19(v17, (uint64_t)v18, v5);
  dispatch thunk of DataProtocol.regions.getter();
  v21(v17, v5);
  BOOL v22 = v58;
  uint64_t v23 = v14;
  v57 = v14;
  uint64_t v24 = v67;
  dispatch thunk of Collection.startIndex.getter();
  v65 = (void (*)(char *, uint64_t))v66[1];
  v65(v23, v24);
  uint64_t v25 = *(void *)(*v2 + 128LL);
  v66 = v2;
  uint64_t v26 = (char *)v2 + v25;
  uint64_t v27 = v59;
  uint64_t v28 = v60;
  uint64_t v29 = v22;
  (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v26, v22, v60);
  swift_beginAccess();
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  uint64_t v31 = v27;
  uint64_t v50 = v26;
  uint64_t v49 = v30;
  v30(v29, v26, v28);
  uint64_t v52 = v18;
  uint64_t v32 = v18;
  uint64_t v33 = v57;
  v53 = (void (*)(char *, char *, uint64_t))v19;
  v19(v17, (uint64_t)v32, v5);
  uint64_t v34 = v28;
  uint64_t v35 = v29;
  dispatch thunk of DataProtocol.regions.getter();
  uint64_t v51 = v5;
  v64(v17, v5);
  uint64_t v36 = v61;
  uint64_t v37 = v67;
  dispatch thunk of Collection.endIndex.getter();
  v65(v33, v37);
  swift_getAssociatedConformanceWitness();
  LOBYTE(v27) = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v38 = *(void (**)(char *, uint64_t))(v31 + 8);
  v38(v36, v34);
  uint64_t v39 = v35;
  v38(v35, v34);
  if ((v27 & 1) == 0)
  {
    uint64_t v40 = v51;
    v53(v17, v52, v51);
    dispatch thunk of DataProtocol.regions.getter();
    v64(v17, v40);
    v49(v35, v50, v34);
    uint64_t v41 = v67;
    uint64_t v42 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
    uint64_t v43 = v55;
    uint64_t v44 = AssociatedTypeWitness;
    (*(void (**)(char *))(v62 + 16))(v55);
    v42(v69, 0LL);
    v38(v39, v34);
    v65(v33, v41);
    swift_getAssociatedConformanceWitness();
    uint64_t v45 = dispatch thunk of Collection.count.getter();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v43, v44);
    *(void *)((char *)v66 + v54) = v45;
  }

  uint64_t v46 = v66;
  uint64_t v47 = v63;
  InputFilter.InputFilterBuffer.advance(by:)(0LL);
  if (v47) {
    swift_release();
  }
  return v46;
}

uint64_t specialized Data.init(count:)(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0LL;
      }
    }

    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0LL;
        *(void *)(result + 24) = v1;
      }

      else
      {
        return v1 << 32;
      }
    }
  }

  return result;
}

uint64_t partial apply for closure #1 in InputFilter.readData(ofLength:)(uint8_t *a1)
{
  return closure #1 in InputFilter.readData(ofLength:)(a1, *(compression_stream **)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t lazy protocol witness table accessor for type Algorithm and conformance Algorithm()
{
  unint64_t result = lazy protocol witness table cache variable for type Algorithm and conformance Algorithm;
  if (!lazy protocol witness table cache variable for type Algorithm and conformance Algorithm)
  {
    unint64_t result = MEMORY[0x1895A3B94](&protocol conformance descriptor for Algorithm, &type metadata for Algorithm);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type Algorithm and conformance Algorithm);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type [Algorithm] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [Algorithm] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Algorithm] and conformance [A])
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Algorithm]);
    unint64_t result = MEMORY[0x1895A3B94](MEMORY[0x189618488], v1);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type [Algorithm] and conformance [A]);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895A3B88](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type FilterOperation and conformance FilterOperation()
{
  unint64_t result = lazy protocol witness table cache variable for type FilterOperation and conformance FilterOperation;
  if (!lazy protocol witness table cache variable for type FilterOperation and conformance FilterOperation)
  {
    unint64_t result = MEMORY[0x1895A3B94]( &protocol conformance descriptor for FilterOperation,  &type metadata for FilterOperation);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type FilterOperation and conformance FilterOperation);
  }

  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Algorithm(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Algorithm(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_187368270 + 4 * byte_187368CA5[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1873682A4 + 4 * byte_187368CA0[v4]))();
}

uint64_t sub_1873682A4(uint64_t result)
{
  *(_BYTE *)(result + compression_stream_destroy(v0 + 1) = v1;
  return result;
}

uint64_t sub_1873682AC(uint64_t result, int a2)
{
  *(_WORD *)(result + compression_stream_destroy(v0 + 1) = 0;
  if (a2) {
    JUMPOUT(0x1873682B4LL);
  }
  return result;
}

uint64_t sub_1873682C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + compression_stream_destroy(v0 + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1873682C8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 5;
  return result;
}

uint64_t sub_1873682CC(uint64_t result)
{
  *(_DWORD *)(result + compression_stream_destroy(v0 + 1) = v1;
  return result;
}

uint64_t sub_1873682D4(uint64_t result)
{
  *(_WORD *)(result + compression_stream_destroy(v0 + 1) = v1;
  return result;
}

uint64_t getEnumTag for Algorithm(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for Algorithm(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Algorithm()
{
  return &type metadata for Algorithm;
}

ValueMetadata *type metadata accessor for FilterOperation()
{
  return &type metadata for FilterOperation;
}

uint64_t getEnumTagSinglePayload for FilterOperation(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FilterOperation(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1873683F8 + 4 * byte_187368CAF[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18736842C + 4 * byte_187368CAA[v4]))();
}

uint64_t sub_18736842C(uint64_t result)
{
  *(_BYTE *)(result + compression_stream_destroy(v0 + 1) = v1;
  return result;
}

uint64_t sub_187368434(uint64_t result, int a2)
{
  *(_WORD *)(result + compression_stream_destroy(v0 + 1) = 0;
  if (a2) {
    JUMPOUT(0x18736843CLL);
  }
  return result;
}

uint64_t sub_187368448(uint64_t result, int a2)
{
  *(_DWORD *)(result + compression_stream_destroy(v0 + 1) = 0;
  if (!a2) {
    JUMPOUT(0x187368450LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_187368454(uint64_t result)
{
  *(_DWORD *)(result + compression_stream_destroy(v0 + 1) = v1;
  return result;
}

uint64_t sub_18736845C(uint64_t result)
{
  *(_WORD *)(result + compression_stream_destroy(v0 + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for FilterError(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FilterError()
{
  return &type metadata for FilterError;
}

uint64_t method lookup function for OutputFilter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of OutputFilter.__allocating_init(_:using:bufferCapacity:writingTo:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of OutputFilter.write<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200LL))();
}

uint64_t dispatch thunk of OutputFilter.finalize()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208LL))();
}

uint64_t type metadata completion function for InputFilter()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for InputFilter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InputFilter.__allocating_init(_:using:bufferCapacity:readingFrom:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of InputFilter.readData(ofLength:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248LL))();
}

uint64_t type metadata completion function for InputFilter.InputFilterBuffer()
{
  uint64_t AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }

  return AssociatedTypeWitness;
}

void type metadata accessor for InputFilter.InputFilterBuffer()
{
}

uint64_t initializeBufferWithCopyOfBuffer for compression_stream(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for compression_stream(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 != 1 && *(_BYTE *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for compression_stream(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(_BYTE *)(result + 40) = 1;
    }
  }

  else
  {
    if (a3 >= 2) {
      *(_BYTE *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0LL;
    }
  }

  return result;
}

void type metadata accessor for compression_stream(uint64_t a1)
{
}

void type metadata accessor for compression_stream_operation(uint64_t a1)
{
}

void type metadata accessor for compression_algorithm(uint64_t a1)
{
}

void type metadata accessor for compression_stream(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

uint64_t partial apply for closure #1 in InputFilter.InputFilterBuffer.withUnsafeBytes<A>(_:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (!result) {
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(*(void *)(v3 + 24) + *(void *)(**(void **)(v3 + 24) + 136LL));
  if (__OFSUB__(0LL, v6))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }

  uint64_t v7 = *(void *)(v3 + 16);
  __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32))(a2 - v6, a2);
  if (!v4) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))(a3, 0LL, 1LL, v7);
  }
  return result;
}

uint64_t partial apply for closure #1 in closure #1 in InputFilter.readData(ofLength:)( uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(v2 + 16);
    swift_beginAccess();
    uint64_t v6 = a2 - v4;
    *(void *)(v5 + 56) = v4;
    *(void *)(v5 + 64) = a2 - v4;
    compression_status v7 = compression_stream_process((compression_stream *)(v5 + 40), *(unsigned __int8 *)(v5 + 88));
    swift_endAccess();
    if (v7 == COMPRESSION_STATUS_ERROR)
    {
      lazy protocol witness table accessor for type FilterError and conformance FilterError();
      swift_allocError();
      *uint64_t v9 = 1;
      return swift_willThrow();
    }

    if (v7 == COMPRESSION_STATUS_END) {
      *(_BYTE *)(v5 + 89) = 1;
    }
    swift_beginAccess();
    uint64_t v8 = *(void *)(v5 + 64);
    __n128 result = v6 - v8;
    if (!__OFSUB__(v6, v8)) {
      return InputFilter.InputFilterBuffer.advance(by:)(result);
    }
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1895A3B7C](a1, v6, a5);
}

uint64_t dispatch thunk of DataProtocol.regions.getter()
{
  return MEMORY[0x189606158]();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x1896061F0]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x189606208]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x189606218]();
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

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x189606318]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data.Deallocator._deallocator.getter()
{
  return MEMORY[0x189606B20]();
}

uint64_t type metadata accessor for Data.Deallocator()
{
  return MEMORY[0x189606B48]();
}

Swift::Void __swiftcall Data.InlineSlice.ensureUniqueReference()()
{
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x189606BA8]();
}

uint64_t Data._Representation.count.setter()
{
  return MEMORY[0x189606BE8]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x189617C20]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x189618080]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x189618828]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x189618848]();
}

uint64_t dispatch thunk of Collection.isEmpty.getter()
{
  return MEMORY[0x189618878]();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return MEMORY[0x189618888]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x189618890]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x189618950]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x189618AC0]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x189618CB0]();
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

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x18961A6C0]();
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1896149B8](stream);
}

compression_status compression_stream_init( compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1896149D0](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1896149E0](stream, *(void *)&flags);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x18961B128]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x18961B160]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x18961B1D8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x18961B218]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x18961B3A0]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}
uint64_t initializeBufferWithCopyOfBuffer for simd_quatd(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_16(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for simd_quatd(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for simd_quatd(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
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

  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for simd_quatd(uint64_t a1)
{
}

void type metadata accessor for simd_quatf(uint64_t a1)
{
}

__n128 __swift_memcpy128_16(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[1];
  __int128 v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  __int128 v6 = a2[5];
  __int128 v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

void type metadata accessor for simd_double4x4(uint64_t a1)
{
}

__n128 __swift_memcpy96_16(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  __int128 v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

void type metadata accessor for simd_double3x4(uint64_t a1)
{
}

__n128 __swift_memcpy64_16(uint64_t a1, uint64_t a2)
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

void type metadata accessor for simd_double2x4(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for simd_double4x3(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 128)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for simd_double4x3(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 120) = 0LL;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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

  *(_BYTE *)(result + 128) = v3;
  return result;
}

void type metadata accessor for simd_double4x3(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for simd_double3x3(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 96)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for simd_double3x3(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 88) = 0LL;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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

  *(_BYTE *)(result + 96) = v3;
  return result;
}

void type metadata accessor for simd_double3x3(uint64_t a1)
{
}

void type metadata accessor for simd_double2x3(uint64_t a1)
{
}

void type metadata accessor for simd_double4x2(uint64_t a1)
{
}

__n128 __swift_memcpy48_16(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void type metadata accessor for simd_double3x2(uint64_t a1)
{
}

void type metadata accessor for simd_double2x2(uint64_t a1)
{
}

void type metadata accessor for simd_float4x4(uint64_t a1)
{
}

void type metadata accessor for simd_float3x4(uint64_t a1)
{
}

void type metadata accessor for simd_float2x4(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for simd_float4x3(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for simd_float4x3(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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

  *(_BYTE *)(result + 64) = v3;
  return result;
}

void type metadata accessor for simd_float4x3(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for simd_float3x3(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for simd_float3x3(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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

  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for simd_float3x3(uint64_t a1)
{
}

void type metadata accessor for simd_float2x3(uint64_t a1)
{
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for simd_float4x2(uint64_t a1)
{
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for simd_float3x2(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for simd_float3x2(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
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

  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for simd_float3x2(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for simd_float2x2(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for simd_float2x2(uint64_t result, int a2, int a3)
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

void type metadata accessor for simd_float2x2(uint64_t a1)
{
}

void type metadata accessor for simd_quatd(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t SIMD.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v7);
  v11 = (char *)&v18 - v10;
  uint64_t v19 = v12;
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v13((char *)&v18 - v10, a1, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  uint64_t result = MEMORY[0x18959D3F4](a2, v5);
  if (result < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v15 = result;
    uint64_t v18 = a1;
    if (result)
    {
      uint64_t v16 = 0LL;
      do
      {
        v13(v9, (uint64_t)v11, AssociatedTypeWitness);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v16;
      }

      while (v15 != v16);
    }

    v17 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v17(v18, AssociatedTypeWitness);
    return ((uint64_t (*)(char *, uint64_t))v17)(v11, AssociatedTypeWitness);
  }

  return result;
}

uint64_t SIMD2._descriptionAsArray.getter(uint64_t a1)
{
  v1._countAndFlagsBits = 91LL;
  v1._object = (void *)0xE100000000000000LL;
  String.append(_:)(v1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v2._countAndFlagsBits = 8236LL;
  v2._object = (void *)0xE200000000000000LL;
  String.append(_:)(v2);
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v3._countAndFlagsBits = 93LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  return 0LL;
}

uint64_t specialized SIMD3._descriptionAsArray.getter()
{
  v0._countAndFlagsBits = 91LL;
  v0._object = (void *)0xE100000000000000LL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 8236LL;
  v2._object = (void *)0xE200000000000000LL;
  String.append(_:)(v2);
  _print_unlocked<A, B>(_:_:)();
  v3._countAndFlagsBits = 93LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  return 0LL;
}

{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  v0._countAndFlagsBits = 91LL;
  v0._object = (void *)0xE100000000000000LL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 8236LL;
  v2._object = (void *)0xE200000000000000LL;
  String.append(_:)(v2);
  _print_unlocked<A, B>(_:_:)();
  v3._countAndFlagsBits = 93LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  return 0LL;
}

uint64_t SIMD3._descriptionAsArray.getter(uint64_t a1)
{
  v1._countAndFlagsBits = 91LL;
  v1._object = (void *)0xE100000000000000LL;
  String.append(_:)(v1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v2._countAndFlagsBits = 8236LL;
  v2._object = (void *)0xE200000000000000LL;
  String.append(_:)(v2);
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v3._countAndFlagsBits = 8236LL;
  v3._object = (void *)0xE200000000000000LL;
  String.append(_:)(v3);
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v4._countAndFlagsBits = 93LL;
  v4._object = (void *)0xE100000000000000LL;
  String.append(_:)(v4);
  return 0LL;
}

uint64_t specialized SIMD4._descriptionAsArray.getter()
{
  v0._countAndFlagsBits = 91LL;
  v0._object = (void *)0xE100000000000000LL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 8236LL;
  v2._object = (void *)0xE200000000000000LL;
  String.append(_:)(v2);
  _print_unlocked<A, B>(_:_:)();
  v3._countAndFlagsBits = 8236LL;
  v3._object = (void *)0xE200000000000000LL;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 93LL;
  v4._object = (void *)0xE100000000000000LL;
  String.append(_:)(v4);
  return 0LL;
}

{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;
  _StringGuts.grow(_:)(16LL);
  v0._countAndFlagsBits = 91LL;
  v0._object = (void *)0xE100000000000000LL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 8236LL;
  v2._object = (void *)0xE200000000000000LL;
  String.append(_:)(v2);
  _print_unlocked<A, B>(_:_:)();
  v3._countAndFlagsBits = 8236LL;
  v3._object = (void *)0xE200000000000000LL;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 93LL;
  v4._object = (void *)0xE100000000000000LL;
  String.append(_:)(v4);
  return 0LL;
}

uint64_t SIMD4._descriptionAsArray.getter(uint64_t a1)
{
  v1._countAndFlagsBits = 91LL;
  v1._object = (void *)0xE100000000000000LL;
  String.append(_:)(v1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v2._countAndFlagsBits = 8236LL;
  v2._object = (void *)0xE200000000000000LL;
  String.append(_:)(v2);
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v3._countAndFlagsBits = 8236LL;
  v3._object = (void *)0xE200000000000000LL;
  String.append(_:)(v3);
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v4._countAndFlagsBits = 8236LL;
  v4._object = (void *)0xE200000000000000LL;
  String.append(_:)(v4);
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v5._countAndFlagsBits = 93LL;
  v5._object = (void *)0xE100000000000000LL;
  String.append(_:)(v5);
  return 0LL;
}

uint64_t static SIMD<>.- prefix(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v51 = a1;
  uint64_t v53 = a4;
  uint64_t v47 = *(void *)(a2 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](a1);
  v52 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v6);
  v46 = (char *)&v42 - v8;
  uint64_t v10 = *(void *)(v9 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(char **)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  v45 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = MEMORY[0x1895F8858](v13);
  v44 = (char *)&v42 - v16;
  uint64_t v17 = MEMORY[0x1895F8858](v15);
  uint64_t v19 = (char *)&v42 - v18;
  uint64_t v20 = MEMORY[0x1895F8858](v17);
  v22 = (char *)&v42 - v21;
  MEMORY[0x1895F8858](v20);
  v24 = (char *)&v42 - v23;
  uint64_t v50 = a3;
  uint64_t v25 = *(void *)(*(void *)(*(void *)(a3 + 8) + 24LL) + 16LL);
  uint64_t v26 = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](v26);
  v28 = (char *)&v42 - v27;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x18959D460](&unk_186F1E768, 256LL, v26, AssociatedConformanceWitness);
  MEMORY[0x18959D454](v28, AssociatedTypeWitness, v25);
  v49 = v12;
  v30 = (void (*)(char *, char *, uint64_t))*((void *)v12 + 2);
  v43 = v24;
  v31 = v24;
  v32 = v52;
  v30(v22, v31, AssociatedTypeWitness);
  dispatch thunk of SIMDStorage.init()();
  uint64_t result = MEMORY[0x18959D3F4](a2, v10);
  if (result < 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }

  uint64_t v34 = result;
  if (result)
  {
    uint64_t v35 = 0LL;
    do
    {
      v30(v19, v22, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v35;
    }

    while (v34 != v35);
  }

  v36 = (void (*)(char *, uint64_t))*((void *)v49 + 1);
  v36(v22, AssociatedTypeWitness);
  v37 = v46;
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v46, v32, a2);
  dispatch thunk of SIMDStorage.init()();
  uint64_t result = MEMORY[0x18959D3F4](a2, v10);
  if (result < 0) {
    goto LABEL_11;
  }
  v52 = (char *)v36;
  v39 = v44;
  v38 = v45;
  v49 = v19;
  if (result)
  {
    uint64_t v40 = 0LL;
    uint64_t v48 = result;
    do
    {
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of FixedWidthInteger.subtractingReportingOverflow(_:)();
      v41 = (void (*)(char *, uint64_t))v52;
      ((void (*)(char *, uint64_t))v52)(v38, AssociatedTypeWitness);
      v41(v39, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v40;
    }

    while (v48 != v40);
  }

  (*(void (**)(char *, uint64_t))(v47 + 8))(v37, a2);
  return ((uint64_t (*)(char *, uint64_t))v52)(v43, AssociatedTypeWitness);
}

double abs(_:)(double a1)
{
  *(void *)&double result = *(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL;
  return result;
}

{
  double result;
  *(void *)&double result = *(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL;
  return result;
}

float32x2_t min(_:_:)(float32x2_t a1, float32x2_t a2)
{
  return vminnm_f32(a1, a2);
}

float32x2_t max(_:_:)(float32x2_t a1, float32x2_t a2)
{
  return vmaxnm_f32(a1, a2);
}

float32x2_t min(_:_:)(float32x2_t a1, int32x2_t a2)
{
  return vminnm_f32(a1, (float32x2_t)vdup_lane_s32(a2, 0));
}

float32x2_t max(_:_:)(float32x2_t a1, int32x2_t a2)
{
  return vmaxnm_f32(a1, (float32x2_t)vdup_lane_s32(a2, 0));
}

float32x2_t clamp(_:min:max:)(float32x2_t a1, float32x2_t a2, float32x2_t a3)
{
  return vminnm_f32(vmaxnm_f32(a1, a2), a3);
}

float32x2_t clamp(_:min:max:)(float32x2_t a1, int32x2_t a2, int32x2_t a3)
{
  return vminnm_f32(vmaxnm_f32(a1, (float32x2_t)vdup_lane_s32(a2, 0)), (float32x2_t)vdup_lane_s32(a3, 0));
}

float reduce_add(_:)(float32x2_t a1)
{
  return vaddv_f32(a1);
}

float reduce_min(_:)(double a1)
{
  return fminf(*(float *)&a1, *((float *)&a1 + 1));
}

float reduce_max(_:)(double a1)
{
  return fmaxf(*(float *)&a1, *((float *)&a1 + 1));
}

int8x8_t sign(_:)(int8x8_t a1)
{
  __asm { FMOV            V2.2S, #1.0 }

  return vand_s8( vorr_s8(vand_s8(a1, (int8x8_t)0x8000000080000000LL), _D2),  vorr_s8((int8x8_t)vcltz_f32((float32x2_t)a1), (int8x8_t)vcgtz_f32((float32x2_t)a1)));
}

float32x2_t mix(_:_:t:)(float32x2_t a1, float32x2_t a2, float32x2_t a3)
{
  return vadd_f32(vmul_f32(vsub_f32(a2, a1), a3), a1);
}

float32x2_t mix(_:_:t:)(float32x2_t a1, float32x2_t a2, float a3)
{
  return vadd_f32(vmul_n_f32(vsub_f32(a2, a1), a3), a1);
}

float32x2_t recip(_:)(float32x2_t a1)
{
  float32x2_t v1 = vrecpe_f32(a1);
  float32x2_t v2 = vmul_f32(v1, vrecps_f32(a1, v1));
  return vmul_f32(v2, vrecps_f32(a1, v2));
}

float32x2_t rsqrt(_:)(float32x2_t a1)
{
  float32x2_t v1 = vrsqrte_f32(a1);
  float32x2_t v2 = vmul_f32(v1, vrsqrts_f32(a1, vmul_f32(v1, v1)));
  return vmul_f32(v2, vrsqrts_f32(a1, vmul_f32(v2, v2)));
}

float32x2_t fmin(_:_:)(float32x2_t a1, float32x2_t a2)
{
  return vminnm_f32(a1, a2);
}

float32x2_t fmax(_:_:)(float32x2_t a1, float32x2_t a2)
{
  return vmaxnm_f32(a1, a2);
}

float32x2_t ceil(_:)(float32x2_t a1)
{
  return vrndp_f32(a1);
}

float32x2_t floor(_:)(float32x2_t a1)
{
  return vrndm_f32(a1);
}

float32x2_t trunc(_:)(float32x2_t a1)
{
  return vrnd_f32(a1);
}

float32x2_t fract(_:)(float32x2_t a1)
{
  return vminnm_f32(vsub_f32(a1, vrndm_f32(a1)), (float32x2_t)vdup_n_s32(0x3F7FFFFFu));
}

int8x8_t step(_:edge:)(float32x2_t a1, float32x2_t a2)
{
  int8x8_t v2 = (int8x8_t)vcgt_f32(a2, a1);
  __asm { FMOV            V1.2S, #1.0 }

  return vbic_s8(_D1, v2);
}

float32x2_t smoothstep(_:edge0:edge1:)(float32x2_t a1, float32x2_t a2, float32x2_t a3)
{
  float32x2_t v3 = vmaxnm_f32(vdiv_f32(vsub_f32(a1, a2), vsub_f32(a3, a2)), 0LL);
  __asm { FMOV            V1.2S, #1.0 }

  float32x2_t v9 = vminnm_f32(v3, _D1);
  __asm { FMOV            V3.2S, #3.0 }

  return vmul_f32(vmul_f32(v9, v9), vmla_f32(_D3, (float32x2_t)0xC0000000C0000000LL, v9));
}

float dot(_:_:)(float32x2_t a1, float32x2_t a2)
{
  return vaddv_f32(vmul_f32(a1, a2));
}

float32x2_t project(_:_:)(float32x2_t a1, float32x2_t a2)
{
  int32x2_t v2 = (int32x2_t)vmul_f32(a1, a2);
  int32x2_t v3 = (int32x2_t)vmul_f32(a2, a2);
  float32x2_t v4 = vadd_f32((float32x2_t)vzip1_s32(v2, v3), (float32x2_t)vzip2_s32(v2, v3));
  return vmul_n_f32(a2, vdiv_f32(v4, (float32x2_t)vdup_lane_s32((int32x2_t)v4, 1)).f32[0]);
}

float length_squared(_:)(float32x2_t a1)
{
  return vaddv_f32(vmul_f32(a1, a1));
}

float length(_:)(float32x2_t a1)
{
  return sqrtf(vaddv_f32(vmul_f32(a1, a1)));
}

float norm_one(_:)(double a1)
{
  return vaddv_f32((float32x2_t)(*(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL));
}

float norm_inf(_:)(double a1)
{
  return fmaxf(COERCE_FLOAT(LODWORD(a1) & 0x7FFFFFFF), COERCE_FLOAT(HIDWORD(a1) & 0x7FFFFFFF));
}

float distance_squared(_:_:)(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2 = vsub_f32(a1, a2);
  return vaddv_f32(vmul_f32(v2, v2));
}

float distance(_:_:)(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2 = vsub_f32(a1, a2);
  return sqrtf(vaddv_f32(vmul_f32(v2, v2)));
}

float32x2_t normalize(_:)(float32x2_t a1)
{
  float32x2_t v1 = vmul_f32(a1, a1);
  float32x2_t v2 = vadd_f32(v1, (float32x2_t)vdup_lane_s32((int32x2_t)v1, 1));
  float32x2_t v3 = vrsqrte_f32(v2);
  float32x2_t v4 = vmul_f32(v3, vrsqrts_f32(v2, vmul_f32(v3, v3)));
  return vmul_n_f32(a1, vmul_f32(v4, vrsqrts_f32(v2, vmul_f32(v4, v4))).f32[0]);
}

float32x2_t reflect(_:n:)(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2 = vmul_f32(a1, a2);
  v2.f32[0] = vaddv_f32(v2);
  v2.f32[0] = v2.f32[0] + v2.f32[0];
  return vmls_lane_f32(a1, a2, v2, 0);
}

float32x2_t refract(_:n:eta:)(float32x2_t a1, float32x2_t a2, float a3)
{
  float32x2_t v3 = vmul_f32(a1, a2);
  v3.f32[0] = vaddv_f32(v3);
  float v4 = (float)((float)-(float)(a3 * a3) * (float)(1.0 - (float)(v3.f32[0] * v3.f32[0]))) + 1.0;
  if (v4 >= 0.0)
  {
    v3.f32[0] = sqrtf(v4) + (float)(a3 * v3.f32[0]);
    return vmla_n_f32(vmul_f32(vneg_f32((float32x2_t)vdup_lane_s32((int32x2_t)v3, 0)), a2), a1, a3);
  }

  else
  {
    return 0LL;
  }

double abs(_:)(float32x4_t a1)
{
  *(void *)&double result = vabsq_f32(a1).u64[0];
  return result;
}

double min(_:_:)(float32x4_t a1, float32x4_t a2)
{
  *(void *)&double result = vminnmq_f32(a1, a2).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vminnmq_f32(a1, a2).u64[0];
  return result;
}

double max(_:_:)(float32x4_t a1, float32x4_t a2)
{
  *(void *)&double result = vmaxnmq_f32(a1, a2).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmaxnmq_f32(a1, a2).u64[0];
  return result;
}

double min(_:_:)(float32x4_t a1, int32x2_t a2)
{
  *(void *)&double result = vminnmq_f32(a1, (float32x4_t)vdupq_lane_s32(a2, 0)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vminnmq_f32(a1, (float32x4_t)vdupq_lane_s32(a2, 0)).u64[0];
  return result;
}

double max(_:_:)(float32x4_t a1, int32x2_t a2)
{
  *(void *)&double result = vmaxnmq_f32(a1, (float32x4_t)vdupq_lane_s32(a2, 0)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmaxnmq_f32(a1, (float32x4_t)vdupq_lane_s32(a2, 0)).u64[0];
  return result;
}

double clamp(_:min:max:)(float32x4_t a1, float32x4_t a2, float32x4_t a3)
{
  *(void *)&double result = vminnmq_f32(vmaxnmq_f32(a1, a2), a3).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vminnmq_f32(vmaxnmq_f32(a1, a2), a3).u64[0];
  return result;
}

double clamp(_:min:max:)(float32x4_t a1, int32x2_t a2, int32x2_t a3)
{
  *(void *)&double result = vminnmq_f32( vmaxnmq_f32(a1, (float32x4_t)vdupq_lane_s32(a2, 0)),  (float32x4_t)vdupq_lane_s32(a3, 0)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vminnmq_f32( vmaxnmq_f32(a1, (float32x4_t)vdupq_lane_s32(a2, 0)),  (float32x4_t)vdupq_lane_s32(a3, 0)).u64[0];
  return result;
}

double reduce_add(_:)(int32x4_t a1)
{
  *(void *)&double result = vaddq_f32( (float32x4_t)vdupq_laneq_s32(a1, 2),  vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a1.i8, 1), (float32x4_t)a1)).u64[0];
  return result;
}

float reduce_min(_:)(__n128 a1)
{
  return fminf(fminf(a1.n128_f32[0], a1.n128_f32[2]), a1.n128_f32[1]);
}

float reduce_max(_:)(__n128 a1)
{
  return fmaxf(fmaxf(a1.n128_f32[0], a1.n128_f32[2]), a1.n128_f32[1]);
}

double sign(_:)(float32x4_t a1)
{
  v1.i64[0] = 0x8000000080000000LL;
  v1.i64[1] = 0x8000000080000000LL;
  __asm { FMOV            V2.4S, #1.0 }

  *(void *)&double result = vbslq_s8( vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgtzq_f32(a1)),  vorrq_s8(vandq_s8((int8x16_t)a1, v1), _Q2),  (int8x16_t)0).u64[0];
  return result;
}

double mix(_:_:t:)(float32x4_t a1, float32x4_t a2, float32x4_t a3)
{
  *(void *)&double result = vaddq_f32(vmulq_f32(vsubq_f32(a2, a1), a3), a1).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vaddq_f32(vmulq_f32(vsubq_f32(a2, a1), a3), a1).u64[0];
  return result;
}

float32x2_t mix(_:_:t:)(float32x4_t a1, float32x4_t a2, float a3)
{
  return vadd_f32(*(float32x2_t *)a1.f32, vmul_n_f32((float32x2_t)*(_OWORD *)&vsubq_f32(a2, a1), a3));
}

double recip(_:)(float32x4_t a1)
{
  float32x4_t v1 = vrecpeq_f32(a1);
  float32x4_t v2 = vmulq_f32(v1, vrecpsq_f32(a1, v1));
  *(void *)&double result = vmulq_f32(v2, vrecpsq_f32(a1, v2)).u64[0];
  return result;
}

{
  float32x4_t v1;
  float32x4_t v2;
  double result;
  float32x4_t v1 = vrecpeq_f32(a1);
  float32x4_t v2 = vmulq_f32(v1, vrecpsq_f32(a1, v1));
  *(void *)&double result = vmulq_f32(v2, vrecpsq_f32(a1, v2)).u64[0];
  return result;
}

double rsqrt(_:)(float32x4_t a1)
{
  float32x4_t v1 = vrsqrteq_f32(a1);
  float32x4_t v2 = vmulq_f32(v1, vrsqrtsq_f32(a1, vmulq_f32(v1, v1)));
  *(void *)&double result = vmulq_f32(v2, vrsqrtsq_f32(a1, vmulq_f32(v2, v2))).u64[0];
  return result;
}

{
  float32x4_t v1;
  float32x4_t v2;
  double result;
  float32x4_t v1 = vrsqrteq_f32(a1);
  float32x4_t v2 = vmulq_f32(v1, vrsqrtsq_f32(a1, vmulq_f32(v1, v1)));
  *(void *)&double result = vmulq_f32(v2, vrsqrtsq_f32(a1, vmulq_f32(v2, v2))).u64[0];
  return result;
}

double ceil(_:)(float32x4_t a1)
{
  *(void *)&double result = vrndpq_f32(a1).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vrndpq_f32(a1).u64[0];
  return result;
}

double floor(_:)(float32x4_t a1)
{
  *(void *)&double result = vrndmq_f32(a1).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vrndmq_f32(a1).u64[0];
  return result;
}

double trunc(_:)(float32x4_t a1)
{
  *(void *)&double result = vrndq_f32(a1).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vrndq_f32(a1).u64[0];
  return result;
}

double fract(_:)(float32x4_t a1)
{
  *(void *)&double result = vminnmq_f32(vsubq_f32(a1, vrndmq_f32(a1)), (float32x4_t)vdupq_n_s32(0x3F7FFFFFu)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vminnmq_f32(vsubq_f32(a1, vrndmq_f32(a1)), (float32x4_t)vdupq_n_s32(0x3F7FFFFFu)).u64[0];
  return result;
}

double step(_:edge:)(float32x4_t a1, float32x4_t a2)
{
  int8x16_t v2 = (int8x16_t)vcgtq_f32(a2, a1);
  __asm { FMOV            V1.4S, #1.0 }

  *(void *)&double result = vbslq_s8(v2, (int8x16_t)0, _Q1).u64[0];
  return result;
}

{
  int8x16_t v2;
  double result;
  int8x16_t v2 = (int8x16_t)vcgtq_f32(a2, a1);
  __asm { FMOV            V1.4S, #1.0 }

  *(void *)&double result = vbicq_s8(_Q1, v2).u64[0];
  return result;
}

double smoothstep(_:edge0:edge1:)(float32x4_t a1, float32x4_t a2, float32x4_t a3)
{
  float32x4_t v3 = vmaxnmq_f32(vdivq_f32(vsubq_f32(a1, a2), vsubq_f32(a3, a2)), (float32x4_t)0);
  __asm { FMOV            V1.4S, #1.0 }

  float32x4_t v9 = vminnmq_f32(v3, _Q1);
  v10.i64[0] = 0xC0000000C0000000LL;
  v10.i64[1] = 0xC0000000C0000000LL;
  __asm { FMOV            V3.4S, #3.0 }

  *(void *)&double result = vmulq_f32(vmulq_f32(v9, v9), vmlaq_f32(_Q3, v10, v9)).u64[0];
  return result;
}

{
  float32x4_t v3;
  float32x4_t v9;
  float32x4_t v10;
  double result;
  float32x4_t v3 = vmaxnmq_f32(vdivq_f32(vsubq_f32(a1, a2), vsubq_f32(a3, a2)), (float32x4_t)0);
  __asm { FMOV            V1.4S, #1.0 }

  float32x4_t v9 = vminnmq_f32(v3, _Q1);
  v10.i64[0] = 0xC0000000C0000000LL;
  v10.i64[1] = 0xC0000000C0000000LL;
  __asm { FMOV            V3.4S, #3.0 }

  *(void *)&double result = vmulq_f32(vmulq_f32(v9, v9), vmlaq_f32(_Q3, v10, v9)).u64[0];
  return result;
}

float dot(_:_:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(a1, a2);
  return v2.f32[2] + vaddv_f32(*(float32x2_t *)v2.f32);
}

{
  int8x16_t v2;
  float32x4_t v2 = (int8x16_t)vmulq_f32(a1, a2);
  return vaddv_f32(vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL)));
}

double project(_:_:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(a1, a2);
  float32x4_t v3 = vmulq_f32(a2, a2);
  *(void *)&double result = vmulq_n_f32( a2,  vdivq_f32( vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2),  vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))),  vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2),  vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1)))).f32[0]).u64[0];
  return result;
}

{
  int8x16_t v2;
  int8x16_t v3;
  double result;
  float32x4_t v2 = (int8x16_t)vmulq_f32(a1, a2);
  *(float32x2_t *)v2.i8 = vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
  float32x4_t v3 = (int8x16_t)vmulq_f32(a2, a2);
  *(float32x2_t *)v3.i8 = vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
  *(float32x2_t *)v2.i8 = vadd_f32( (float32x2_t)vzip1_s32(*(int32x2_t *)v2.i8, *(int32x2_t *)v3.i8),  (float32x2_t)vzip2_s32(*(int32x2_t *)v2.i8, *(int32x2_t *)v3.i8));
  *(void *)&double result = vmulq_n_f32( a2,  vdiv_f32(*(float32x2_t *)v2.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 1)).f32[0]).u64[0];
  return result;
}

float length_squared(_:)(float32x4_t a1)
{
  float32x4_t v1 = vmulq_f32(a1, a1);
  return v1.f32[2] + vaddv_f32(*(float32x2_t *)v1.f32);
}

{
  int8x16_t v1;
  float32x4_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  return vaddv_f32(vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL)));
}

float length(_:)(float32x4_t a1)
{
  float32x4_t v1 = vmulq_f32(a1, a1);
  return sqrtf(v1.f32[2] + vaddv_f32(*(float32x2_t *)v1.f32));
}

{
  int8x16_t v1;
  float32x4_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  return sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL))));
}

double norm_one(_:)(float32x4_t a1)
{
  float32x4_t v1 = vabsq_f32(a1);
  *(void *)&double result = vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v1, 2),  vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v1.f32, 1), v1)).u64[0];
  return result;
}

float norm_inf(_:)(float32x4_t a1)
{
  float32x4_t v1 = vabsq_f32(a1);
  return fmaxf(fmaxf(v1.f32[0], v1.f32[2]), v1.f32[1]);
}

float distance_squared(_:_:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vsubq_f32(a1, a2);
  float32x4_t v3 = vmulq_f32(v2, v2);
  return v3.f32[2] + vaddv_f32(*(float32x2_t *)v3.f32);
}

{
  float32x4_t v2;
  int8x16_t v3;
  float32x4_t v2 = vsubq_f32(a1, a2);
  float32x4_t v3 = (int8x16_t)vmulq_f32(v2, v2);
  return vaddv_f32(vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)));
}

float distance(_:_:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vsubq_f32(a1, a2);
  float32x4_t v3 = vmulq_f32(v2, v2);
  return sqrtf(v3.f32[2] + vaddv_f32(*(float32x2_t *)v3.f32));
}

{
  float32x4_t v2;
  int8x16_t v3;
  float32x4_t v2 = vsubq_f32(a1, a2);
  float32x4_t v3 = (int8x16_t)vmulq_f32(v2, v2);
  return sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL))));
}

double normalize(_:)(float32x4_t a1)
{
  int32x4_t v1 = (int32x4_t)vmulq_f32(a1, a1);
  *(float32x2_t *)v1.i8 = vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v1, 2),  vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v1.i8, 1)));
  float32x2_t v2 = vrsqrte_f32(*(float32x2_t *)v1.i8);
  float32x2_t v3 = vmul_f32(v2, vrsqrts_f32(*(float32x2_t *)v1.i8, vmul_f32(v2, v2)));
  *(void *)&double result = vmulq_n_f32(a1, vmul_f32(v3, vrsqrts_f32(*(float32x2_t *)v1.i8, vmul_f32(v3, v3))).f32[0]).u64[0];
  return result;
}

{
  int8x16_t v1;
  float32x2_t v2;
  float32x2_t v3;
  double result;
  int32x4_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  *(float32x2_t *)v1.i8 = vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL));
  *(float32x2_t *)v1.i8 = vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v1.i8, 1));
  float32x2_t v2 = vrsqrte_f32(*(float32x2_t *)v1.i8);
  float32x2_t v3 = vmul_f32(v2, vrsqrts_f32(*(float32x2_t *)v1.i8, vmul_f32(v2, v2)));
  *(void *)&double result = vmulq_n_f32(a1, vmul_f32(v3, vrsqrts_f32(*(float32x2_t *)v1.i8, vmul_f32(v3, v3))).f32[0]).u64[0];
  return result;
}

double reflect(_:n:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(a1, a2);
  v2.i64[0] = vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2),  vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))).u64[0];
  v2.f32[0] = v2.f32[0] + v2.f32[0];
  *(void *)&double result = vmlsq_lane_f32(a1, a2, *(float32x2_t *)v2.f32, 0).u64[0];
  return result;
}

{
  int8x16_t v2;
  double result;
  float32x4_t v2 = (int8x16_t)vmulq_f32(a1, a2);
  *(float32x2_t *)v2.i8 = vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
  *(float *)v2.i32 = vaddv_f32(*(float32x2_t *)v2.i8);
  *(float *)v2.i32 = *(float *)v2.i32 + *(float *)v2.i32;
  *(void *)&double result = vmlsq_lane_f32(a1, a2, *(float32x2_t *)v2.i8, 0).u64[0];
  return result;
}

double refract(_:n:eta:)(float32x4_t a1, float32x4_t a2, float a3)
{
  float32x4_t v3 = vmulq_f32(a1, a2);
  LODWORD(_S4) = vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2),  vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).u32[0];
  __asm { FMLS            S5, S4, V4.S[0] }

  float v10 = (float)((float)-(float)(a3 * a3) * _S5) + 1.0;
  int32x2_t v11 = 0LL;
  if (v10 >= 0.0)
  {
    *(float *)v11.i32 = sqrtf(v10) + (float)(a3 * _S4);
    int32x2_t v11 = (int32x2_t)vmlaq_n_f32(vmulq_f32(a2, vnegq_f32((float32x4_t)vdupq_lane_s32(v11, 0))), a1, a3).u64[0];
  }

  return *(double *)&v11;
}

{
  int8x16_t v3;
  float32x2_t v4;
  float v5;
  double result;
  float32x4_t v3 = (int8x16_t)vmulq_f32(a1, a2);
  float v4 = vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
  v4.f32[0] = vaddv_f32(v4);
  Swift::String v5 = (float)((float)-(float)(a3 * a3) * (float)(1.0 - (float)(v4.f32[0] * v4.f32[0]))) + 1.0;
  if (v5 < 0.0) {
    return 0.0;
  }
  v4.f32[0] = sqrtf(v5) + (float)(a3 * v4.f32[0]);
  *(void *)&double result = vmlaq_n_f32(vmulq_f32(vnegq_f32((float32x4_t)vdupq_lane_s32((int32x2_t)v4, 0)), a2), a1, a3).u64[0];
  return result;
}

float reduce_add(_:)(int8x16_t a1)
{
  return vaddv_f32(vadd_f32(*(float32x2_t *)a1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL)));
}

{
  int32x2_t v1;
  float result;
  int32x4_t v1 = vadd_s32(*(int32x2_t *)a1.i8, (int32x2_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL));
  LODWORD(result) = vadd_s32(v1, vdup_lane_s32(v1, 1)).u32[0];
  return result;
}

{
  int32x2_t v1;
  float result;
  int32x4_t v1 = vadd_s32(*(int32x2_t *)a1.i8, (int32x2_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL));
  LODWORD(result) = vadd_s32(v1, vdup_lane_s32(v1, 1)).u32[0];
  return result;
}

float reduce_min(_:)(float32x4_t a1)
{
  return vminvq_f32(a1);
}

float reduce_max(_:)(float32x4_t a1)
{
  return vmaxvq_f32(a1);
}

double sign(_:)(int8x16_t a1)
{
  v1.i64[0] = 0x8000000080000000LL;
  v1.i64[1] = 0x8000000080000000LL;
  __asm { FMOV            V2.4S, #1.0 }

  *(void *)&double result = vandq_s8( vorrq_s8(vandq_s8(a1, v1), _Q2),  vorrq_s8((int8x16_t)vcltzq_f32((float32x4_t)a1), (int8x16_t)vcgtzq_f32((float32x4_t)a1))).u64[0];
  return result;
}

{
  double result;
  __asm { FMOV            V2.2D, #1.0 }

  *(void *)&double result = vandq_s8( vorrq_s8(vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x8000000000000000LL)), _Q2),  vorrq_s8((int8x16_t)vcltzq_f64((float64x2_t)a1), (int8x16_t)vcgtzq_f64((float64x2_t)a1))).u64[0];
  return result;
}

{
  double result;
  __asm { FMOV            V4.2D, #1.0 }

  *(void *)&double result = vandq_s8( vorrq_s8(vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x8000000000000000LL)), _Q4),  vorrq_s8((int8x16_t)vcltzq_f64((float64x2_t)a1), (int8x16_t)vcgtzq_f64((float64x2_t)a1))).u64[0];
  return result;
}

{
  double result;
  __asm { FMOV            V4.2D, #1.0 }

  *(void *)&double result = vandq_s8( vorrq_s8(vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x8000000000000000LL)), _Q4),  vorrq_s8((int8x16_t)vcltzq_f64((float64x2_t)a1), (int8x16_t)vcgtzq_f64((float64x2_t)a1))).u64[0];
  return result;
}

double mix(_:_:t:)(float32x4_t a1, float32x4_t a2, float a3)
{
  *(void *)&double result = vaddq_f32(vmulq_n_f32(vsubq_f32(a2, a1), a3), a1).u64[0];
  return result;
}

double fmin(_:_:)(float32x4_t a1, float32x4_t a2)
{
  *(void *)&double result = vminnmq_f32(a1, a2).u64[0];
  return result;
}

double fmax(_:_:)(float32x4_t a1, float32x4_t a2)
{
  *(void *)&double result = vmaxnmq_f32(a1, a2).u64[0];
  return result;
}

float norm_one(_:)(__n128 a1)
{
  return vaddv_f32( vadd_f32( (float32x2_t)(a1.n128_u64[0] & 0x7FFFFFFF7FFFFFFFLL),  (float32x2_t)*(_OWORD *)&vextq_s8( (int8x16_t)(*(_OWORD *)&a1 & __PAIR128__( 0x7FFFFFFF7FFFFFFFLL,  0x7FFFFFFF7FFFFFFFLL)),  (int8x16_t)(*(_OWORD *)&a1 & __PAIR128__( 0x7FFFFFFF7FFFFFFFLL,  0x7FFFFFFF7FFFFFFFLL)),  8uLL)));
}

float norm_inf(_:)(__n128 a1)
{
  return vmaxvq_f32((float32x4_t)(*(_OWORD *)&a1 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)));
}

Swift::Float __swiftcall sign(_:)(Swift::Float a1)
{
  v1.i32[0] = 1.0;
  v2.i64[0] = 0x8000000080000000LL;
  v2.i64[1] = 0x8000000080000000LL;
  v1.i32[0] = vbslq_s8(v2, v1, *(int8x16_t *)&a1).u32[0];
  if (a1 == 0.0) {
    *(float *)v1.i32 = 0.0;
  }
  return *(float *)v1.i32;
}

Swift::Float __swiftcall recip(_:)(Swift::Float a1)
{
  float32x2_t v1 = vrecpe_f32(*(float32x2_t *)&a1);
  float32x2_t v2 = vmul_f32(v1, vrecps_f32(*(float32x2_t *)&a1, v1));
  LODWORD(result) = vmul_f32(v2, vrecps_f32(*(float32x2_t *)&a1, v2)).u32[0];
  return result;
}

Swift::Float __swiftcall rsqrt(_:)(Swift::Float a1)
{
  float32x2_t v1 = vrsqrte_f32(*(float32x2_t *)&a1);
  float32x2_t v2 = vmul_f32(v1, vrsqrts_f32(*(float32x2_t *)&a1, vmul_f32(v1, v1)));
  LODWORD(result) = vmul_f32(v2, vrsqrts_f32(*(float32x2_t *)&a1, vmul_f32(v2, v2))).u32[0];
  return result;
}

Swift::Float __swiftcall step(_:edge:)(Swift::Float _, Swift::Float edge)
{
  BOOL v2 = _ < edge;
  Swift::Float result = 0.0;
  if (!v2) {
    return 1.0;
  }
  return result;
}

double cross(_:_:)()
{
  return 0.0;
}

{
  return *(double *)&_PromotedConst;
}

double cross(_:_:)(float32x4_t a1, int32x4_t a2)
{
  int32x4_t v2 = (int32x4_t)vmlaq_f32( vmulq_f32( (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(a2, a2), (int8x16_t)a2, 0xCuLL),  vnegq_f32(a1)),  (float32x4_t)a2,  (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL));
  *(void *)&double result = vextq_s8((int8x16_t)vuzp1q_s32(v2, v2), (int8x16_t)v2, 0xCuLL).u64[0];
  return result;
}

double abs(_:)(int8x16_t a1)
{
  *(void *)&double result = vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)).u64[0];
  return result;
}

double min(_:_:)(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, a2);
  return result;
}

double max(_:_:)(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, a2);
  return result;
}

double min(_:_:)(float64x2_t a1, double a2)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0));
  return result;
}

double max(_:_:)(float64x2_t a1, double a2)
{
  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0));
  return result;
}

double clamp(_:min:max:)(float64x2_t a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(vmaxnmq_f64(a1, a2), a3);
  return result;
}

double clamp(_:min:max:)(float64x2_t a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64( vmaxnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0)),  (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  return result;
}

double reduce_add(_:)(float64x2_t a1)
{
  return vaddvq_f64(a1);
}

double reduce_min(_:)(float64x2_t a1)
{
  return vpminq_f64(a1);
}

double reduce_max(_:)(float64x2_t a1)
{
  return vpmaxq_f64(a1);
}

double mix(_:_:t:)(float64x2_t a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_f64(vsubq_f64(a2, a1), a3), a1);
  return result;
}

double mix(_:_:t:)(float64x2_t a1, float64x2_t a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_n_f64(vsubq_f64(a2, a1), a3), a1);
  return result;
}

double recip(_:)(float64x2_t a1)
{
  __asm { FMOV            V1.2D, #1.0 }

  *(void *)&double result = *(_OWORD *)&vdivq_f64(_Q1, a1);
  return result;
}

{
  double result;
  __asm { FMOV            V2.2D, #1.0 }

  *(void *)&double result = *(_OWORD *)&vdivq_f64(_Q2, a1);
  return result;
}

{
  double result;
  __asm { FMOV            V2.2D, #1.0 }

  *(void *)&double result = *(_OWORD *)&vdivq_f64(_Q2, a1);
  return result;
}

double rsqrt(_:)(float64x2_t a1)
{
  __asm { FMOV            V1.2D, #1.0 }

  *(void *)&double result = *(_OWORD *)&vdivq_f64(_Q1, vsqrtq_f64(a1));
  return result;
}

{
  double result;
  __asm { FMOV            V2.2D, #1.0 }

  *(void *)&double result = *(_OWORD *)&vdivq_f64(_Q2, vsqrtq_f64(a1));
  return result;
}

{
  double result;
  __asm { FMOV            V2.2D, #1.0 }

  *(void *)&double result = *(_OWORD *)&vdivq_f64(_Q2, vsqrtq_f64(a1));
  return result;
}

double fmin(_:_:)(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, a2);
  return result;
}

double fmax(_:_:)(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, a2);
  return result;
}

double ceil(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vrndpq_f64(a1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vrndpq_f64(a1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vrndpq_f64(a1);
  return result;
}

double floor(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vrndmq_f64(a1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vrndmq_f64(a1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vrndmq_f64(a1);
  return result;
}

double trunc(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vrndq_f64(a1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vrndq_f64(a1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vrndq_f64(a1);
  return result;
}

double fract(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64( vsubq_f64(a1, vrndmq_f64(a1)),  (float64x2_t)vdupq_n_s64(0x3FEFFFFFFFFFFFFFuLL));
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vminnmq_f64( vsubq_f64(a1, vrndmq_f64(a1)),  (float64x2_t)vdupq_n_s64(0x3FEFFFFFFFFFFFFFuLL));
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vminnmq_f64( vsubq_f64(a1, vrndmq_f64(a1)),  (float64x2_t)vdupq_n_s64(0x3FEFFFFFFFFFFFFFuLL));
  return result;
}

double step(_:edge:)(float64x2_t a1, float64x2_t a2)
{
  int8x16_t v2 = (int8x16_t)vcgtq_f64(a2, a1);
  __asm { FMOV            V1.2D, #1.0 }

  *(void *)&double result = vbicq_s8(_Q1, v2).u64[0];
  return result;
}

double smoothstep(_:edge0:edge1:)(float64x2_t a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = vmaxnmq_f64(vdivq_f64(vsubq_f64(a1, a2), vsubq_f64(a3, a2)), (float64x2_t)0);
  __asm { FMOV            V1.2D, #1.0 }

  float64x2_t v9 = vminnmq_f64(v3, _Q1);
  __asm
  {
    FMOV            V2.2D, #-2.0
    FMOV            V3.2D, #3.0
  }

  *(void *)&double result = *(_OWORD *)&vmulq_f64(vmulq_f64(v9, v9), vmlaq_f64(_Q3, _Q2, v9));
  return result;
}

double dot(_:_:)(float64x2_t a1, float64x2_t a2)
{
  return vaddvq_f64(vmulq_f64(a1, a2));
}

double project(_:_:)(float64x2_t a1, float64x2_t a2)
{
  int64x2_t v2 = (int64x2_t)vmulq_f64(a1, a2);
  int64x2_t v3 = (int64x2_t)vmulq_f64(a2, a2);
  float64x2_t v4 = vaddq_f64((float64x2_t)vzip1q_s64(v2, v3), (float64x2_t)vzip2q_s64(v2, v3));
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, vdivq_f64(v4, (float64x2_t)vdupq_laneq_s64((int64x2_t)v4, 1)).f64[0]);
  return result;
}

double length_squared(_:)(float64x2_t a1)
{
  return vaddvq_f64(vmulq_f64(a1, a1));
}

double length(_:)(float64x2_t a1)
{
  return sqrt(vaddvq_f64(vmulq_f64(a1, a1)));
}

double norm_one(_:)(int8x16_t a1)
{
  return vaddvq_f64((float64x2_t)vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)));
}

double norm_inf(_:)(int8x16_t a1)
{
  return vpmaxq_f64((float64x2_t)vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)));
}

double distance_squared(_:_:)(float64x2_t a1, float64x2_t a2)
{
  float64x2_t v2 = vsubq_f64(a1, a2);
  return vaddvq_f64(vmulq_f64(v2, v2));
}

double distance(_:_:)(float64x2_t a1, float64x2_t a2)
{
  float64x2_t v2 = vsubq_f64(a1, a2);
  return sqrt(vaddvq_f64(vmulq_f64(v2, v2)));
}

double normalize(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, 1.0 / sqrt(vaddvq_f64(vmulq_f64(a1, a1))));
  return result;
}

double reflect(_:n:)(float64x2_t a1, float64x2_t a2)
{
  double v2 = vaddvq_f64(vmulq_f64(a1, a2));
  *(void *)&double result = *(_OWORD *)&vmlsq_lane_f64(a1, a2, v2 + v2, 0);
  return result;
}

double refract(_:n:eta:)(float64x2_t a1, float64x2_t a2, double a3)
{
  double v3 = vaddvq_f64(vmulq_f64(a1, a2));
  double v4 = -(a3 * a3) * (1.0 - v3 * v3) + 1.0;
  if (v4 < 0.0) {
    return 0.0;
  }
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64( vmulq_f64( vnegq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64(sqrt(v4) + a3 * v3), 0)),  a2),  a1,  a3);
  return result;
}

double min(_:_:)(float64x2_t a1, double a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, a3);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, a3);
  return result;
}

double max(_:_:)(float64x2_t a1, double a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, a3);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, a3);
  return result;
}

double min(_:_:)(float64x2_t a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  return result;
}

double max(_:_:)(float64x2_t a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  return result;
}

double clamp(_:min:max:)(float64x2_t a1, double a2, float64x2_t a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(vmaxnmq_f64(a1, a3), a5);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(vmaxnmq_f64(a1, a3), a5);
  return result;
}

double clamp(_:min:max:)(float64x2_t a1, double a2, double a3, double a4)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64( vmaxnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0)),  (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0));
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vminnmq_f64( vmaxnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0)),  (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0));
  return result;
}

double reduce_add(_:)(int64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vaddq_f64((float64x2_t)vdupq_laneq_s64(a1, 1), (float64x2_t)a1), a2);
  return result;
}

double reduce_min(_:)(__n128 a1, double a2)
{
  return fmin(fmin(a1.n128_f64[0], a2), a1.n128_f64[1]);
}

double reduce_max(_:)(__n128 a1, double a2)
{
  return fmax(fmax(a1.n128_f64[0], a2), a1.n128_f64[1]);
}

double mix(_:_:t:)(float64x2_t a1, double a2, float64x2_t a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_f64(vsubq_f64(a3, a1), a5), a1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_f64(vsubq_f64(a3, a1), a5), a1);
  return result;
}

double mix(_:_:t:)(float64x2_t a1, double a2, float64x2_t a3, double a4, double a5)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_n_f64(vsubq_f64(a3, a1), a5), a1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_n_f64(vsubq_f64(a3, a1), a5), a1);
  return result;
}

double step(_:edge:)(float64x2_t a1, double a2, float64x2_t a3)
{
  int8x16_t v3 = (int8x16_t)vcgtq_f64(a3, a1);
  __asm { FMOV            V2.2D, #1.0 }

  *(void *)&double result = vbicq_s8(_Q2, v3).u64[0];
  return result;
}

{
  int8x16_t v3;
  double result;
  int8x16_t v3 = (int8x16_t)vcgtq_f64(a3, a1);
  __asm { FMOV            V2.2D, #1.0 }

  *(void *)&double result = vbicq_s8(_Q2, v3).u64[0];
  return result;
}

double smoothstep(_:edge0:edge1:)(float64x2_t a1, double a2, float64x2_t a3, double a4, float64x2_t a5)
{
  float64x2_t v5 = vmaxnmq_f64(vdivq_f64(vsubq_f64(a1, a3), vsubq_f64(a5, a3)), (float64x2_t)0);
  __asm { FMOV            V2.2D, #1.0 }

  float64x2_t v11 = vminnmq_f64(v5, _Q2);
  __asm
  {
    FMOV            V4.2D, #-2.0
    FMOV            V5.2D, #3.0
  }

  *(void *)&double result = *(_OWORD *)&vmulq_f64(vmlaq_f64(_Q5, _Q4, v11), vmulq_f64(v11, v11));
  return result;
}

{
  float64x2_t v5;
  float64x2_t v11;
  double result;
  float64x2_t v5 = vmaxnmq_f64(vdivq_f64(vsubq_f64(a1, a3), vsubq_f64(a5, a3)), (float64x2_t)0);
  __asm { FMOV            V2.2D, #1.0 }

  float64x2_t v11 = vminnmq_f64(v5, _Q2);
  __asm
  {
    FMOV            V4.2D, #-2.0
    FMOV            V5.2D, #3.0
  }

  *(void *)&double result = *(_OWORD *)&vmulq_f64(vmulq_f64(v11, v11), vmlaq_f64(_Q5, _Q4, v11));
  return result;
}

double dot(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4 = vmulq_f64(a1, a3);
  *(void *)&double result = *(_OWORD *)&vaddq_f64( vmulq_f64(a2, a4),  vaddq_f64(v4, (float64x2_t)vdupq_laneq_s64((int64x2_t)v4, 1)));
  return result;
}

{
  return vaddvq_f64(vaddq_f64(vmulq_f64(a1, a3), vmulq_f64(a2, a4)));
}

double project(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64( a3,  (vmulq_f64(a2, a4).f64[0] + vaddvq_f64(vmulq_f64(a1, a3)))
                                   / (vmulq_f64(a4, a4).f64[0] + vaddvq_f64(vmulq_f64(a3, a3))));
  return result;
}

{
  int64x2_t v4;
  int64x2_t v5;
  float64x2_t v6;
  double result;
  float64x2_t v4 = (int64x2_t)vaddq_f64(vmulq_f64(a1, a3), vmulq_f64(a2, a4));
  float64x2_t v5 = (int64x2_t)vaddq_f64(vmulq_f64(a3, a3), vmulq_f64(a4, a4));
  uint64_t v6 = vaddq_f64((float64x2_t)vzip1q_s64(v4, v5), (float64x2_t)vzip2q_s64(v4, v5));
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a3, vdivq_f64(v6, (float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1)).f64[0]);
  return result;
}

double length_squared(_:)(float64x2_t a1, float64x2_t a2)
{
  float64x2_t v2 = vmulq_f64(a1, a1);
  *(void *)&double result = *(_OWORD *)&vaddq_f64( vmulq_f64(a2, a2),  vaddq_f64(v2, (float64x2_t)vdupq_laneq_s64((int64x2_t)v2, 1)));
  return result;
}

{
  return vaddvq_f64(vaddq_f64(vmulq_f64(a1, a1), vmulq_f64(a2, a2)));
}

double length(_:)(float64x2_t a1, float64x2_t a2)
{
  float64x2_t v2 = vmulq_f64(a1, a1);
  return sqrt(vaddq_f64(vmulq_f64(a2, a2), vaddq_f64(v2, (float64x2_t)vdupq_laneq_s64((int64x2_t)v2, 1))).f64[0]);
}

{
  return sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(a1, a1), vmulq_f64(a2, a2))));
}

float64_t norm_one(_:)(float64x2_t a1, float64x2_t a2)
{
  return vabsq_f64(a2).f64[0] + vaddvq_f64(vabsq_f64(a1));
}

double norm_inf(_:)(float64x2_t a1, float64x2_t a2)
{
  float64x2_t v2 = vabsq_f64(a1);
  return fmax(fmax(v2.f64[0], vabsq_f64(a2).f64[0]), v2.f64[1]);
}

double distance_squared(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4 = vsubq_f64(a2, a4);
  float64x2_t v5 = vsubq_f64(a1, a3);
  float64x2_t v6 = vmulq_f64(v5, v5);
  *(void *)&double result = *(_OWORD *)&vaddq_f64( vmulq_f64(v4, v4),  vaddq_f64(v6, (float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1)));
  return result;
}

{
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v4 = vsubq_f64(a1, a3);
  float64x2_t v5 = vsubq_f64(a2, a4);
  return vaddvq_f64(vaddq_f64(vmulq_f64(v4, v4), vmulq_f64(v5, v5)));
}

double distance(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4 = vsubq_f64(a2, a4);
  float64x2_t v5 = vsubq_f64(a1, a3);
  float64x2_t v6 = vmulq_f64(v5, v5);
  return sqrt(vaddq_f64(vmulq_f64(v4, v4), vaddq_f64(v6, (float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1))).f64[0]);
}

{
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v4 = vsubq_f64(a1, a3);
  float64x2_t v5 = vsubq_f64(a2, a4);
  return sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(v4, v4), vmulq_f64(v5, v5))));
}

double normalize(_:)(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, 1.0 / sqrt(vmulq_f64(a2, a2).f64[0] + vaddvq_f64(vmulq_f64(a1, a1))));
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64( a1,  1.0 / sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(a1, a1), vmulq_f64(a2, a2)))));
  return result;
}

double reflect(_:n:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  double v4 = vmulq_f64(a2, a4).f64[0];
  double v5 = vaddvq_f64(vmulq_f64(a1, a3));
  *(void *)&double result = *(_OWORD *)&vmlsq_lane_f64(a1, a3, v4 + v5 + v4 + v5, 0);
  return result;
}

{
  double v4;
  double result;
  double v4 = vaddvq_f64(vaddq_f64(vmulq_f64(a1, a3), vmulq_f64(a2, a4)));
  *(void *)&double result = *(_OWORD *)&vmlsq_lane_f64(a1, a3, v4 + v4, 0);
  return result;
}

float64x2_t refract(_:n:eta:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, double a5)
{
  float64x2_t result = vmulq_f64(a2, a4);
  result.f64[0] = result.f64[0] + vaddvq_f64(vmulq_f64(a1, a3));
  double v7 = -(a5 * a5) * (1.0 - result.f64[0] * result.f64[0]) + 1.0;
  if (v7 >= 0.0) {
    return vmlaq_n_f64( vmulq_f64(a3, vnegq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64(sqrt(v7) + a5 * result.f64[0]), 0))),  a1,  a5);
  }
  else {
    result.f64[0] = 0.0;
  }
  return result;
}

double reduce_add(_:)(float64x2_t a1, float64x2_t a2)
{
  return vaddvq_f64(vaddq_f64(a1, a2));
}

double reduce_min(_:)(float64x2_t a1, float64x2_t a2)
{
  return vpminq_f64(vminnmq_f64(a1, a2));
}

double reduce_max(_:)(float64x2_t a1, float64x2_t a2)
{
  return vpmaxq_f64(vmaxnmq_f64(a1, a2));
}

double norm_one(_:)(int8x16_t a1, int8x16_t a2)
{
  int8x16_t v2 = (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  return vaddvq_f64(vaddq_f64((float64x2_t)vandq_s8(a1, v2), (float64x2_t)vandq_s8(a2, v2)));
}

double norm_inf(_:)(int8x16_t a1, int8x16_t a2)
{
  int8x16_t v2 = (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  return vpmaxq_f64(vmaxnmq_f64((float64x2_t)vandq_s8(a1, v2), (float64x2_t)vandq_s8(a2, v2)));
}

double refract(_:n:eta:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, double a5)
{
  double v5 = vaddvq_f64(vaddq_f64(vmulq_f64(a1, a3), vmulq_f64(a2, a4)));
  double v6 = -(a5 * a5) * (1.0 - v5 * v5) + 1.0;
  double v7 = 0.0;
  if (v6 >= 0.0) {
    *(void *)&double v7 = *(_OWORD *)&vmlaq_n_f64( vmulq_f64( a3,  vnegq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64(sqrt(v6) + a5 * v5), 0))),  a1,  a5);
  }
  return v7;
}

Swift::Double __swiftcall sign(_:)(Swift::Double a1)
{
  v1.i64[0] = 1.0;
  v2.f64[0] = NAN;
  v2.f64[1] = NAN;
  v1.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v2), v1, *(int8x16_t *)&a1).u64[0];
  if (a1 == 0.0) {
    *(double *)v1.i64 = 0.0;
  }
  return *(double *)v1.i64;
}

Swift::Double __swiftcall recip(_:)(Swift::Double a1)
{
  return 1.0 / a1;
}

Swift::Double __swiftcall rsqrt(_:)(Swift::Double a1)
{
  return 1.0 / sqrt(a1);
}

Swift::Double __swiftcall step(_:edge:)(Swift::Double _, Swift::Double edge)
{
  BOOL v2 = _ < edge;
  Swift::Double result = 0.0;
  if (!v2) {
    return 1.0;
  }
  return result;
}

double cross(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  int64x2_t v4 = (int64x2_t)vmlaq_laneq_f64(vmulq_laneq_f64(vnegq_f64(a2), a3, 1), a4, a1, 1);
  a4.f64[1] = a3.f64[0];
  a2.f64[1] = a1.f64[0];
  *(void *)&double result = vzip1q_s64(v4, (int64x2_t)vmlaq_f64(vmulq_f64(a4, vnegq_f64(a1)), a3, a2)).u64[0];
  return result;
}

int32x2_t abs(_:)(int32x2_t a1)
{
  return vabs_s32(a1);
}

int32x2_t min(_:_:)(int32x2_t a1, int32x2_t a2)
{
  return vmin_s32(a1, a2);
}

int32x2_t max(_:_:)(int32x2_t a1, int32x2_t a2)
{
  return vmax_s32(a1, a2);
}

int32x2_t min(_:_:)(unsigned int a1, int32x2_t a2)
{
  return vmin_s32(a2, vdup_n_s32(a1));
}

int32x2_t max(_:_:)(unsigned int a1, int32x2_t a2)
{
  return vmax_s32(a2, vdup_n_s32(a1));
}

int32x2_t clamp(_:min:max:)(int32x2_t a1, int32x2_t a2, int32x2_t a3)
{
  return vmin_s32(vmax_s32(a1, a2), a3);
}

int32x2_t clamp(_:min:max:)(unsigned int a1, unsigned int a2, int32x2_t a3)
{
  return vmin_s32(vmax_s32(a3, vdup_n_s32(a1)), vdup_n_s32(a2));
}

float reduce_add(_:)(int32x2_t a1)
{
  LODWORD(result) = vadd_s32(vdup_lane_s32(a1, 1), a1).u32[0];
  return result;
}

{
  float result;
  LODWORD(result) = vadd_s32(vdup_lane_s32(a1, 1), a1).u32[0];
  return result;
}

uint64_t reduce_min(_:)(double a1)
{
  if (SHIDWORD(a1) >= SLODWORD(a1)) {
    return LODWORD(a1);
  }
  else {
    return HIDWORD(a1);
  }
}

{
  if (HIDWORD(a1) >= LODWORD(a1)) {
    return LODWORD(a1);
  }
  else {
    return HIDWORD(a1);
  }
}

uint64_t reduce_max(_:)(double a1)
{
  if (SHIDWORD(a1) <= SLODWORD(a1)) {
    return LODWORD(a1);
  }
  else {
    return HIDWORD(a1);
  }
}

{
  if (HIDWORD(a1) <= LODWORD(a1)) {
    return LODWORD(a1);
  }
  else {
    return HIDWORD(a1);
  }
}

double abs(_:)(int32x4_t a1)
{
  *(void *)&double result = vabsq_s32(a1).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vabsq_s32(a1).u64[0];
  return result;
}

double min(_:_:)(int32x4_t a1, int32x4_t a2)
{
  *(void *)&double result = vminq_s32(a1, a2).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vminq_s32(a1, a2).u64[0];
  return result;
}

double max(_:_:)(int32x4_t a1, int32x4_t a2)
{
  *(void *)&double result = vmaxq_s32(a1, a2).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmaxq_s32(a1, a2).u64[0];
  return result;
}

double min(_:_:)(unsigned int a1, int32x4_t a2)
{
  *(void *)&double result = vminq_s32(a2, vdupq_n_s32(a1)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vminq_s32(a2, vdupq_n_s32(a1)).u64[0];
  return result;
}

double max(_:_:)(unsigned int a1, int32x4_t a2)
{
  *(void *)&double result = vmaxq_s32(a2, vdupq_n_s32(a1)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmaxq_s32(a2, vdupq_n_s32(a1)).u64[0];
  return result;
}

double clamp(_:min:max:)(int32x4_t a1, int32x4_t a2, int32x4_t a3)
{
  *(void *)&double result = vminq_s32(vmaxq_s32(a1, a2), a3).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vminq_s32(vmaxq_s32(a1, a2), a3).u64[0];
  return result;
}

double clamp(_:min:max:)(unsigned int a1, unsigned int a2, int32x4_t a3)
{
  *(void *)&double result = vminq_s32(vmaxq_s32(a3, vdupq_n_s32(a1)), vdupq_n_s32(a2)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vminq_s32(vmaxq_s32(a3, vdupq_n_s32(a1)), vdupq_n_s32(a2)).u64[0];
  return result;
}

float reduce_add(_:)(int32x4_t a1)
{
  LODWORD(result) = vaddq_s32(vaddq_s32(vdupq_lane_s32(*(int32x2_t *)a1.i8, 1), a1), vdupq_laneq_s32(a1, 2)).u32[0];
  return result;
}

{
  float result;
  LODWORD(result) = vaddq_s32(vaddq_s32(vdupq_lane_s32(*(int32x2_t *)a1.i8, 1), a1), vdupq_laneq_s32(a1, 2)).u32[0];
  return result;
}

uint64_t reduce_min(_:)(__n128 a1)
{
  __int32 v1 = a1.n128_i32[2];
  if (a1.n128_i32[2] >= a1.n128_i32[0]) {
    __int32 v1 = a1.n128_u32[0];
  }
  if (a1.n128_i32[1] >= v1) {
    return v1;
  }
  else {
    return a1.n128_u32[1];
  }
}

{
  unsigned __int32 v1;
  __int32 v1 = a1.n128_u32[2];
  if (a1.n128_u32[2] >= a1.n128_u32[0]) {
    __int32 v1 = a1.n128_u32[0];
  }
  if (a1.n128_u32[1] >= v1) {
    return v1;
  }
  else {
    return a1.n128_u32[1];
  }
}

uint64_t reduce_max(_:)(__n128 a1)
{
  __int32 v1 = a1.n128_i32[2];
  if (a1.n128_i32[2] <= a1.n128_i32[0]) {
    __int32 v1 = a1.n128_u32[0];
  }
  if (a1.n128_i32[1] <= v1) {
    return v1;
  }
  else {
    return a1.n128_u32[1];
  }
}

{
  unsigned __int32 v1;
  __int32 v1 = a1.n128_u32[2];
  if (a1.n128_u32[2] <= a1.n128_u32[0]) {
    __int32 v1 = a1.n128_u32[0];
  }
  if (a1.n128_u32[1] <= v1) {
    return v1;
  }
  else {
    return a1.n128_u32[1];
  }
}

uint64_t reduce_min(_:)(int32x4_t a1)
{
  return vminvq_s32(a1);
}

uint64_t reduce_max(_:)(int32x4_t a1)
{
  return vmaxvq_s32(a1);
}

uint32x2_t min(_:_:)(uint32x2_t a1, uint32x2_t a2)
{
  return vmin_u32(a1, a2);
}

uint32x2_t max(_:_:)(uint32x2_t a1, uint32x2_t a2)
{
  return vmax_u32(a1, a2);
}

uint32x2_t min(_:_:)(unsigned int a1, uint32x2_t a2)
{
  return vmin_u32(a2, (uint32x2_t)vdup_n_s32(a1));
}

uint32x2_t max(_:_:)(unsigned int a1, uint32x2_t a2)
{
  return vmax_u32(a2, (uint32x2_t)vdup_n_s32(a1));
}

uint32x2_t clamp(_:min:max:)(uint32x2_t a1, uint32x2_t a2, uint32x2_t a3)
{
  return vmin_u32(vmax_u32(a1, a2), a3);
}

uint32x2_t clamp(_:min:max:)(unsigned int a1, unsigned int a2, uint32x2_t a3)
{
  return vmin_u32(vmax_u32(a3, (uint32x2_t)vdup_n_s32(a1)), (uint32x2_t)vdup_n_s32(a2));
}

double min(_:_:)(uint32x4_t a1, uint32x4_t a2)
{
  *(void *)&double result = vminq_u32(a1, a2).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vminq_u32(a1, a2).u64[0];
  return result;
}

double max(_:_:)(uint32x4_t a1, uint32x4_t a2)
{
  *(void *)&double result = vmaxq_u32(a1, a2).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmaxq_u32(a1, a2).u64[0];
  return result;
}

double min(_:_:)(unsigned int a1, uint32x4_t a2)
{
  *(void *)&double result = vminq_u32(a2, (uint32x4_t)vdupq_n_s32(a1)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vminq_u32(a2, (uint32x4_t)vdupq_n_s32(a1)).u64[0];
  return result;
}

double max(_:_:)(unsigned int a1, uint32x4_t a2)
{
  *(void *)&double result = vmaxq_u32(a2, (uint32x4_t)vdupq_n_s32(a1)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmaxq_u32(a2, (uint32x4_t)vdupq_n_s32(a1)).u64[0];
  return result;
}

double clamp(_:min:max:)(uint32x4_t a1, uint32x4_t a2, uint32x4_t a3)
{
  *(void *)&double result = vminq_u32(vmaxq_u32(a1, a2), a3).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vminq_u32(vmaxq_u32(a1, a2), a3).u64[0];
  return result;
}

double clamp(_:min:max:)(unsigned int a1, unsigned int a2, uint32x4_t a3)
{
  *(void *)&double result = vminq_u32(vmaxq_u32(a3, (uint32x4_t)vdupq_n_s32(a1)), (uint32x4_t)vdupq_n_s32(a2)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vminq_u32(vmaxq_u32(a3, (uint32x4_t)vdupq_n_s32(a1)), (uint32x4_t)vdupq_n_s32(a2)).u64[0];
  return result;
}

uint64_t reduce_min(_:)(uint32x4_t a1)
{
  return vminvq_u32(a1);
}

uint64_t reduce_max(_:)(uint32x4_t a1)
{
  return vmaxvq_u32(a1);
}

  ;
}

__n64 simd_float2x2.init(diagonal:)()
{
  result.n64_u32[1] = 0;
  return result;
}

void __swiftcall simd_float2x2.init(_:)(simd_float2x2 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 2LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_float2x2.init(rows:)(simd_float2x2 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 2LL)
  {
    BOOL v2 = (const float *)((char *)rows._rawValue + 32);
    vld2_f32(v2);
    swift_bridgeObjectRelease();
  }

  else
  {
    __break(1u);
  }

int32x2_t simd_float2x2.transpose.getter(int32x2_t a1, int32x2_t a2)
{
  return vzip1_s32(a1, a2);
}

unint64_t simd_float2x2.subscript.getter(unint64_t result)
{
  if (result > 1) {
    __break(1u);
  }
  return result;
}

uint64_t simd_float2x2.subscript.setter(uint64_t result, double a2)
{
  if (!result) {
    goto LABEL_4;
  }
  if (result == 1)
  {
    ++v2;
LABEL_4:
    *BOOL v2 = a2;
    return result;
  }

  __break(1u);
  return result;
}

double (*simd_float2x2.subscript.modify( double (*result)(uint64_t a1), uint64_t a2))(uint64_t a1)
{
  int8x16_t v3 = result;
  *((void *)result + 1) = v2;
  if (!a2)
  {
    __n64 result = simd_float2x2.subscript.modify;
LABEL_5:
    *(void *)int8x16_t v3 = *v2;
    return result;
  }

  if (a2 == 1)
  {
    ++v2;
    __n64 result = simd_float2x2.subscript.modify;
    goto LABEL_5;
  }

  __break(1u);
  return result;
}

double simd_float2x2.subscript.modify(uint64_t a1)
{
  double result = *(double *)a1;
  **(void **)(a1 + 8) = *(void *)a1;
  return result;
}

{
  double result;
  double result = *(double *)a1;
  *(void *)(*(void *)(a1 + 8) + 8LL) = *(void *)a1;
  return result;
}

unint64_t simd_float2x2.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 1)
  {
    if (a2 <= 1) {
      return result;
    }
    __break(1u);
  }

  __break(1u);
  return result;
}

int *key path setter for simd_float2x2.subscript(_:_:) : simd_float2x2(int *result, uint64_t a2, void *a3)
{
  unint64_t v3 = a3[1];
  int v4 = *result;
  if (!*a3)
  {
    if (v3 <= 1)
    {
      *(_DWORD *)(a2 + 4LL * v3) = v4;
      return result;
    }

LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (*a3 == 1LL)
  {
    if (v3 <= 1)
    {
      *(_DWORD *)(a2 + 8 + 4LL * v3) = v4;
      return result;
    }

    goto LABEL_7;
  }

    __break(1u);
    goto LABEL_8;
  }

  if (*a3 == 1LL)
  {
    if (v3 <= 2)
    {
      *(_DWORD *)(a2 + 16 + 4LL * v3) = v4;
      return result;
    }

    goto LABEL_7;
  }

    __break(1u);
    goto LABEL_8;
  }

  if (*a3 == 1LL)
  {
    if (v3 <= 3)
    {
      *(_DWORD *)(a2 + 16 + 4LL * v3) = v4;
      return result;
    }

    goto LABEL_7;
  }

    __break(1u);
    goto LABEL_8;
  }

  if (*a3 == 1LL)
  {
    if (v3 <= 1)
    {
      *(void *)(a2 + 16 + 8LL * v3) = v4;
      return result;
    }

    goto LABEL_7;
  }

    __break(1u);
    goto LABEL_8;
  }

  if (*a3 == 1LL)
  {
    if (v3 <= 2)
    {
      *(void *)(a2 + 32 + 8LL * v3) = v4;
      return result;
    }

    goto LABEL_7;
  }

    __break(1u);
    goto LABEL_8;
  }

  if (*a3 == 1LL)
  {
    if (v3 <= 3)
    {
      *(void *)(a2 + 32 + 8LL * v3) = v4;
      return result;
    }

    goto LABEL_7;
  }

LABEL_8:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

uint64_t simd_float2x2.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  if (!result)
  {
    if (a2 > 1) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (result == 1)
  {
    if (a2 > 1)
    {
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }

    v3 += 8LL;
LABEL_7:
    *(float *)(v3 + 4LL * a2) = a3;
    return result;
  }

LABEL_9:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

float (*simd_float2x2.subscript.modify( float (*result)(uint64_t a1), uint64_t a2, unint64_t a3))(uint64_t a1)
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)double result = a2;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_7;
    }
    v3 += 8LL;
  }

  if (a3 <= 1)
  {
    *((_DWORD *)result + 6) = *(_DWORD *)(v3 + 4 * (a3 & 1));
    return simd_float2x2.subscript.modify;
  }

  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

float simd_float2x2.subscript.modify(uint64_t a1)
{
  float result = *(float *)(a1 + 24);
  *(float *)(*(void *)(a1 + 16) + 8LL * (*(void *)a1 != 0LL) + 4LL * *(unsigned int *)(a1 + 8)) = result;
  return result;
}

uint64_t simd_float2x2.debugDescription.getter()
{
  v0._countAndFlagsBits = 91LL;
  v0._object = (void *)0xE100000000000000LL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 93LL;
  v2._object = (void *)0xE100000000000000LL;
  String.append(_:)(v2);
  v3._countAndFlagsBits = 0LL;
  v3._object = (void *)0xE000000000000000LL;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8236LL;
  v4._object = (void *)0xE200000000000000LL;
  String.append(_:)(v4);
  v5._countAndFlagsBits = 91LL;
  v5._object = (void *)0xE100000000000000LL;
  String.append(_:)(v5);
  _print_unlocked<A, B>(_:_:)();
  v6._countAndFlagsBits = 8236LL;
  v6._object = (void *)0xE200000000000000LL;
  String.append(_:)(v6);
  _print_unlocked<A, B>(_:_:)();
  v7._countAndFlagsBits = 93LL;
  v7._object = (void *)0xE100000000000000LL;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0LL;
  v8._object = (void *)0xE000000000000000LL;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 10589LL;
  v9._object = (void *)0xE200000000000000LL;
  String.append(_:)(v9);
  return 0x6F6C665F646D6973LL;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float2x2()
{
  return simd_float2x2.debugDescription.getter();
}

uint64_t static simd_float2x2.== infix(_:_:)(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  uint32x2_t v4 = (uint32x2_t)vand_s8((int8x8_t)vceq_f32(a2, a4), (int8x8_t)vceq_f32(a1, a3));
  return vpmin_u32(v4, v4).u32[0] >> 31;
}

uint64_t simd_equal(simd_float2x2 a1, simd_float2x2 a2)
{
  uint32x2_t v2 = (uint32x2_t)vand_s8( (int8x8_t)vceq_f32((float32x2_t)a1.columns[0], (float32x2_t)a2.columns[0]),  (int8x8_t)vceq_f32((float32x2_t)a1.columns[1], (float32x2_t)a2.columns[1]));
  return vpmin_u32(v2, v2).u32[0] >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float2x2( simd_float2x2 *a1, simd_float2x2 *a2)
{
  return simd_equal(*a1, *a2);
}

float simd_float2x2.determinant.getter(double a1, double a2)
{
  return vmlas_n_f32((float)-*((float *)&a1 + 1) * *(float *)&a2, *((float *)&a2 + 1), *(float *)&a1);
}

float32x2_t static simd_float2x2.+ infix(_:_:)(float32x2_t a1, double a2, float32x2_t a3)
{
  return vadd_f32(a1, a3);
}

float32x2_t static simd_float2x2.- prefix(_:)(float32x2_t a1)
{
  return vsub_f32(0LL, a1);
}

float32x2_t static simd_float2x2.- infix(_:_:)(float32x2_t a1, double a2, float32x2_t a3)
{
  return vsub_f32(a1, a3);
}

float32x2_t static simd_float2x2.+= infix(_:_:)(float32x2_t *a1, float32x2_t a2, float32x2_t a3)
{
  float32x2_t result = vadd_f32(*a1, a2);
  float32x2_t v4 = vadd_f32(a1[1], a3);
  *a1 = result;
  a1[1] = v4;
  return result;
}

float32x2_t static simd_float2x2.-= infix(_:_:)(float32x2_t *a1, float32x2_t a2, float32x2_t a3)
{
  float32x2_t result = vsub_f32(*a1, a2);
  float32x2_t v4 = vsub_f32(a1[1], a3);
  *a1 = result;
  a1[1] = v4;
  return result;
}

float32x2_t static simd_float2x2.* infix(_:_:)(float a1, float32x2_t a2)
{
  return vmul_n_f32(a2, a1);
}

float32x2_t static simd_float2x2.* infix(_:_:)(float32x2_t a1, double a2, float a3)
{
  return vmul_n_f32(a1, a3);
}

float32x2_t static simd_float2x2.*= infix(_:_:)(float32x2_t *a1, float a2)
{
  float32x2_t v2 = vmul_n_f32(*a1, a2);
  float32x2_t result = vmul_n_f32(a1[1], a2);
  *a1 = v2;
  a1[1] = result;
  return result;
}

float32x2_t static simd_float2x2.* infix(_:_:)(float32x2_t a1, float32x2_t a2, double a3)
{
  return vmla_lane_f32(vmul_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1);
}

{
  return vmla_lane_f32(vmul_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1);
}

{
  return vmla_lane_f32(vmul_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1);
}

{
  return vmla_lane_f32(vmul_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1);
}

float32x2_t static simd_float2x2.* infix(_:_:)(double a1, int32x2_t a2, int32x2_t a3)
{
  return vmla_lane_f32( vmul_n_f32((float32x2_t)vzip1_s32(a2, a3), *(float *)&a1),  (float32x2_t)vzip2_s32(a2, a3),  *(float32x2_t *)&a1,  1);
}

float32x2_t static simd_float2x2.*= infix(_:_:)(float32x2_t *a1, double a2, double a3)
{
  float32x2_t v3 = a1[1];
  float32x2_t v4 = vmla_lane_f32(vmul_n_f32(*a1, *(float *)&a2), v3, *(float32x2_t *)&a2, 1);
  float32x2_t result = vmla_lane_f32(vmul_n_f32(*a1, *(float *)&a3), v3, *(float32x2_t *)&a3, 1);
  *a1 = v4;
  a1[1] = result;
  return result;
}

__n64 matrix_from_diagonal(_:)()
{
  result.n64_u32[1] = 0;
  return result;
}

Swift::Float __swiftcall matrix_determinant(_:)(simd_float2x2 *a1)
{
  return vmlas_n_f32((float)-*((float *)&v1 + 1) * *(float *)&v2, *((float *)&v2 + 1), *(float *)&v1);
}

int32x2_t matrix_from_rows(_:_:)(int32x2_t a1, int32x2_t a2)
{
  return vzip1_s32(a1, a2);
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float2x2 *a1, simd_float2x2 *a2)
{
  uint32x2_t v6 = (uint32x2_t)vand_s8((int8x8_t)vceq_f32(v3, v5), (int8x8_t)vceq_f32(v2, v4));
  return vpmin_u32(v6, v6).u32[0] >> 31;
}

  ;
}

__n64 simd_float3x2.init(diagonal:)()
{
  result.n64_u32[1] = 0;
  return result;
}

void __swiftcall simd_float3x2.init(_:)(simd_float3x2 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 3LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_float3x2.init(rows:)(simd_float3x2 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 2LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_float2x3.init(_:)(simd_float2x3 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 2LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

int32x2_t simd_float2x3.transpose.getter(int32x2_t a1, double a2, int32x2_t a3)
{
  return vzip1_s32(a1, a3);
}

unint64_t simd_float3x2.subscript.getter(unint64_t result)
{
  if (result > 2) {
    __break(1u);
  }
  return result;
}

uint64_t simd_float3x2.subscript.setter(uint64_t result, double a2)
{
  switch(result)
  {
    case 0LL:
      goto LABEL_6;
    case 1LL:
      ++v2;
LABEL_6:
      *float32x2_t v2 = a2;
      return result;
    case 2LL:
      v2 += 2;
      goto LABEL_6;
  }

  __break(1u);
  return result;
}

void *simd_float3x2.subscript.modify(void *result, uint64_t a2)
{
  float32x2_t v3 = result;
  result[1] = a2;
  result[2] = v2;
  switch(a2)
  {
    case 0LL:
      uint64_t v4 = *v2;
      __n64 result = simd_float3x2.subscript.modify;
LABEL_8:
      *float32x2_t v3 = v4;
      return result;
    case 1LL:
      uint64_t v4 = v2[1];
LABEL_7:
      __n64 result = simd_float3x2.subscript.modify;
      goto LABEL_8;
    case 2LL:
      uint64_t v4 = v2[2];
      goto LABEL_7;
  }

  __break(1u);
  return result;
}

uint64_t *simd_float3x2.subscript.modify(uint64_t *result, char a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  BOOL v4 = v3 == 1;
  if ((a2 & 1) != 0)
  {
    if (v3 == 1)
    {
LABEL_7:
      *(void *)(result[2] + 8) = v2;
      return result;
    }

    BOOL v4 = v3 == 2;
    if (v3 == 2)
    {
LABEL_9:
      *(void *)(result[2] + 16) = v2;
      return result;
    }

    __break(1u);
  }

  if (v4) {
    goto LABEL_7;
  }
  if (v3 == 2) {
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

double simd_float3x2.subscript.modify(uint64_t a1)
{
  double result = *(double *)a1;
  **(void **)(a1 + 16) = *(void *)a1;
  return result;
}

{
  int v1;
  int8x8_t *v2;
  uint64_t v3;
  int8x8_t v4;
  _DWORD *v5;
  double result;
  double v7;
  uint64_t v1 = *(_DWORD *)(a1 + 24);
  uint64_t v2 = *(int8x8_t **)(a1 + 16);
  uint64_t v3 = *(void *)a1;
  if (*(void *)a1)
  {
    BOOL v4 = vbsl_s8((int8x8_t)vceqd_s64(v3, 1LL), v2[1], v2[2]);
    if (v3 == 1) {
      ++v2;
    }
    else {
      v2 += 2;
    }
  }

  else
  {
    BOOL v4 = *v2;
  }

  float32x2_t v5 = (_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(_DWORD *)(a1 + 8) & 1LL)));
  Swift::String v7 = *(double *)&v4;
  *float32x2_t v5 = v1;
  double result = v7;
  *(double *)uint64_t v2 = v7;
  return result;
}

unint64_t simd_float3x2.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 2)
  {
    if (a2 <= 1) {
      return result;
    }
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t key path getter for simd_float3x2.subscript(_:_:) : simd_float3x2@<X0>( uint64_t result@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 1)
  {
    result += 8LL;
  }

  else if (v3)
  {
    if (v3 != 2) {
      goto LABEL_9;
    }
    result += 16LL;
  }

  if ((unint64_t)a2[1] <= 1)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 1));
    return result;
  }

  __break(1u);
LABEL_9:
  __break(1u);
  return result;
}

int *key path setter for simd_float3x2.subscript(_:_:) : simd_float3x2( int *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  unint64_t v3 = a3[1];
  int v5 = *result;
  if (!*a3)
  {
    if (v3 <= 1)
    {
      uint64_t v7 = *a2;
      *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v3 & 1))) = v5;
      *a2 = v7;
      return result;
    }

    goto LABEL_12;
  }

  if (v4 == 1)
  {
    uint64_t v6 = a2[1];
  }

  else
  {
    if (v4 != 2)
    {
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
    }

    uint64_t v6 = a2[2];
  }

  if (v3 > 1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v8 = v6;
  *(_DWORD *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v3 & 1))) = v5;
  if (v4 == 1) {
    a2[1] = v8;
  }
  else {
    a2[2] = v8;
  }
  return result;
}

uint64_t simd_float3x2.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  switch(result)
  {
    case 0LL:
      if (a2 <= 1)
      {
        uint64_t v5 = *v3;
        *(float *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a2 & 1))) = a3;
        *unint64_t v3 = v5;
        return result;
      }

      goto LABEL_12;
    case 1LL:
      uint64_t v4 = v3[1];
      break;
    case 2LL:
      uint64_t v4 = v3[2];
      break;
    default:
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
  }

  if (a2 > 1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v6 = v4;
  *(float *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a2 & 1))) = a3;
  if (result == 1) {
    v3[1] = v6;
  }
  else {
    v3[2] = v6;
  }
  return result;
}

double (*simd_float3x2.subscript.modify( double (*result)(uint64_t a1), uint64_t a2, unint64_t a3))(uint64_t a1)
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)double result = a2;
  switch(a2)
  {
    case 0LL:
      uint64_t v4 = *v3;
      if (a3 <= 1) {
        goto LABEL_6;
      }
LABEL_9:
      __break(1u);
      break;
    case 1LL:
      uint64_t v4 = v3[1];
      if (a3 > 1) {
        goto LABEL_9;
      }
LABEL_6:
      uint64_t v5 = v4;
      *((_DWORD *)result + 6) = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a3 & 1)));
      return simd_float3x2.subscript.modify;
    case 2LL:
      uint64_t v4 = v3[2];
      if (a3 <= 1) {
        goto LABEL_6;
      }
      goto LABEL_9;
  }

  __break(1u);
  return result;
}

uint64_t simd_float3x2.debugDescription.getter()
{
  v0._countAndFlagsBits = 91LL;
  v0._object = (void *)0xE100000000000000LL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 93LL;
  v2._object = (void *)0xE100000000000000LL;
  String.append(_:)(v2);
  v3._countAndFlagsBits = 0LL;
  v3._object = (void *)0xE000000000000000LL;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8236LL;
  v4._object = (void *)0xE200000000000000LL;
  String.append(_:)(v4);
  v5._countAndFlagsBits = 91LL;
  v5._object = (void *)0xE100000000000000LL;
  String.append(_:)(v5);
  _print_unlocked<A, B>(_:_:)();
  v6._countAndFlagsBits = 8236LL;
  v6._object = (void *)0xE200000000000000LL;
  String.append(_:)(v6);
  _print_unlocked<A, B>(_:_:)();
  v7._countAndFlagsBits = 93LL;
  v7._object = (void *)0xE100000000000000LL;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0LL;
  v8._object = (void *)0xE000000000000000LL;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 8236LL;
  v9._object = (void *)0xE200000000000000LL;
  String.append(_:)(v9);
  v10._countAndFlagsBits = 91LL;
  v10._object = (void *)0xE100000000000000LL;
  String.append(_:)(v10);
  _print_unlocked<A, B>(_:_:)();
  v11._countAndFlagsBits = 8236LL;
  v11._object = (void *)0xE200000000000000LL;
  String.append(_:)(v11);
  _print_unlocked<A, B>(_:_:)();
  v12._countAndFlagsBits = 93LL;
  v12._object = (void *)0xE100000000000000LL;
  String.append(_:)(v12);
  v13._countAndFlagsBits = 0LL;
  v13._object = (void *)0xE000000000000000LL;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 10589LL;
  v14._object = (void *)0xE200000000000000LL;
  String.append(_:)(v14);
  return 0x6F6C665F646D6973LL;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float3x2()
{
  return simd_float3x2.debugDescription.getter();
}

uint64_t static simd_float3x2.== infix(_:_:)( float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5, float32x2_t a6)
{
  uint32x2_t v6 = (uint32x2_t)vand_s8(vand_s8((int8x8_t)vceq_f32(a2, a5), (int8x8_t)vceq_f32(a1, a4)), (int8x8_t)vceq_f32(a3, a6));
  return vpmin_u32(v6, v6).u32[0] >> 31;
}

uint64_t simd_equal(simd_float3x2 a1, simd_float3x2 a2)
{
  uint32x2_t v2 = (uint32x2_t)vand_s8( vand_s8( (int8x8_t)vceq_f32((float32x2_t)a1.columns[0], (float32x2_t)a2.columns[0]),  (int8x8_t)vceq_f32((float32x2_t)a1.columns[1], (float32x2_t)a2.columns[1])),  (int8x8_t)vceq_f32((float32x2_t)a1.columns[2], (float32x2_t)a2.columns[2]));
  return vpmin_u32(v2, v2).u32[0] >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float3x2( simd_float3x2 *a1, simd_float3x2 *a2)
{
  return simd_equal(*a1, *a2);
}

int32x2_t simd_float3x2.transpose.getter(int32x2_t a1, int32x2_t a2)
{
  return vzip1_s32(a1, a2);
}

float32x2_t static simd_float3x2.+ infix(_:_:)(float32x2_t a1, double a2, double a3, float32x2_t a4)
{
  return vadd_f32(a1, a4);
}

float32x2_t static simd_float3x2.- prefix(_:)(float32x2_t a1)
{
  return vsub_f32(0LL, a1);
}

float32x2_t static simd_float3x2.- infix(_:_:)(float32x2_t a1, double a2, double a3, float32x2_t a4)
{
  return vsub_f32(a1, a4);
}

float32x2_t static simd_float3x2.+= infix(_:_:)( float32x2_t *a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  float32x2_t result = vadd_f32(*a1, a2);
  float32x2_t v5 = vadd_f32(a1[1], a3);
  float32x2_t v6 = vadd_f32(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

float32x2_t static simd_float3x2.-= infix(_:_:)( float32x2_t *a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  float32x2_t result = vsub_f32(*a1, a2);
  float32x2_t v5 = vsub_f32(a1[1], a3);
  float32x2_t v6 = vsub_f32(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

float32x2_t static simd_float3x2.* infix(_:_:)(float a1, float32x2_t a2)
{
  return vmul_n_f32(a2, a1);
}

float32x2_t static simd_float3x2.* infix(_:_:)(float32x2_t a1, double a2, double a3, float a4)
{
  return vmul_n_f32(a1, a4);
}

float32x2_t static simd_float3x2.*= infix(_:_:)(float32x2_t *a1, float a2)
{
  float32x2_t v2 = vmul_n_f32(*a1, a2);
  float32x2_t v3 = vmul_n_f32(a1[1], a2);
  float32x2_t result = vmul_n_f32(a1[2], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = result;
  return result;
}

float32x2_t static simd_float3x2.* infix(_:_:)( float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x4_t a4)
{
  return vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(a1, a4.f32[0]), a2, *(float32x2_t *)a4.f32, 1), a3, a4, 2);
}

double static simd_float3x2.* infix(_:_:)(double a1, int32x4_t a2, int32x2_t a3, int32x4_t a4)
{
  int32x2_t v4 = vzip1_s32(*(int32x2_t *)a2.i8, *(int32x2_t *)a4.i8);
  *(int32x2_t *)v5.f32 = vzip1_s32(v4, a3);
  *(int32x2_t *)&v5.u32[2] = vdup_lane_s32(v4, 1);
  a2.u64[1] = (unint64_t)a3;
  *(void *)&double result = vmlaq_lane_f32( vmulq_n_f32(v5, *(float *)&a1),  (float32x4_t)vuzp2q_s32(a2, a4),  *(float32x2_t *)&a1,  1).u64[0];
  return result;
}

float32x2_t static simd_float3x2.* infix(_:_:)( float32x2_t a1, float32x2_t a2, float32x2_t a3, double a4, float a5)
{
  return vmla_n_f32(vmla_lane_f32(vmul_n_f32(a1, *(float *)&a4), a2, *(float32x2_t *)&a4, 1), a3, a5);
}

float32x2_t static simd_float3x2.* infix(_:_:)( float32x2_t *a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  return vmla_laneq_f32( vmla_lane_f32(vmul_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1->f32)), a3, *a1, 1),  a4,  *(float32x4_t *)a1->f32,  2);
}

{
  return vmla_laneq_f32( vmla_lane_f32(vmul_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1->f32)), a3, *a1, 1),  a4,  *(float32x4_t *)a1->f32,  2);
}

float32x2_t static simd_float3x2.*= infix(_:_:)(float32x2_t *a1, float32x2_t *a2)
{
  float32x2_t v2 = a1[1];
  float32x2_t v3 = a1[2];
  float32x2_t result = vmla_laneq_f32( vmla_lane_f32(vmul_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[2].f32)), v2, a2[2], 1),  v3,  *(float32x4_t *)a2[2].f32,  2);
  float32x2_t v5 = vmla_laneq_f32( vmla_lane_f32(vmul_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[4].f32)), v2, a2[4], 1),  v3,  *(float32x4_t *)a2[4].f32,  2);
  *a1 = vmla_laneq_f32( vmla_lane_f32(vmul_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2->f32)), v2, *a2, 1),  v3,  *(float32x4_t *)a2->f32,  2);
  a1[1] = result;
  a1[2] = v5;
  return result;
}

double matrix_from_rows(_:_:)(int32x4_t a1, int32x4_t a2)
{
  *(void *)&double result = vzip1q_s32(a1, a2).u64[0];
  return result;
}

  ;
}

{
  double result;
  *(void *)&double result = vzip1q_s32(a1, a2).u64[0];
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float3x2 *a1, simd_float3x2 *a2)
{
  uint32x2_t v8 = (uint32x2_t)vand_s8(vand_s8((int8x8_t)vceq_f32(v3, v6), (int8x8_t)vceq_f32(v2, v5)), (int8x8_t)vceq_f32(v4, v7));
  return vpmin_u32(v8, v8).u32[0] >> 31;
}

  ;
}

__n64 simd_float4x2.init(diagonal:)()
{
  result.n64_u32[1] = 0;
  return result;
}

void __swiftcall simd_float4x2.init(_:)(simd_float4x2 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 4LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_float4x2.init(rows:)(simd_float4x2 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 2LL)
  {
    float32x2_t v2 = (const float *)((char *)rows._rawValue + 32);
    vld4_f32(v2);
    swift_bridgeObjectRelease();
  }

  else
  {
    __break(1u);
  }

void __swiftcall simd_float2x4.init(_:)(simd_float2x4 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 2LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

double simd_float2x4.transpose.getter(int32x4_t a1, int32x4_t a2)
{
  *(void *)&double result = vzip1q_s32(a1, a2).u64[0];
  return result;
}

double simd_float4x2.subscript.getter(uint64_t a1, double a2, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 0LL:
      return result;
    case 1LL:
      double result = a3;
      break;
    case 2LL:
      double result = a4;
      break;
    case 3LL:
      double result = a5;
      break;
    default:
      __break(1u);
      JUMPOUT(0x186F07AE0LL);
  }

  return result;
}

uint64_t simd_float4x2.subscript.setter(uint64_t result, double a2)
{
  switch(result)
  {
    case 0LL:
      break;
    case 1LL:
      ++v2;
      break;
    case 2LL:
      v2 += 2;
      break;
    case 3LL:
      v2 += 3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x186F07B38LL);
  }

  *float32x2_t v2 = a2;
  return result;
}

uint64_t *(*simd_float4x2.subscript.modify( uint64_t *(*result)(uint64_t *result, char a2), uint64_t a2))(uint64_t *result, char a2)
{
  float32x2_t v3 = result;
  *((void *)result + 1) = a2;
  *((void *)result + 2) = v2;
  switch(a2)
  {
    case 0LL:
      uint64_t v4 = *v2;
      double result = (uint64_t *(*)(uint64_t *, char))simd_float4x2.subscript.modify;
LABEL_10:
      *(void *)float32x2_t v3 = v4;
      return result;
    case 1LL:
      uint64_t v4 = v2[1];
      goto LABEL_9;
    case 2LL:
      uint64_t v4 = v2[2];
LABEL_9:
      double result = simd_float4x2.subscript.modify;
      goto LABEL_10;
    case 3LL:
      uint64_t v4 = v2[3];
      goto LABEL_9;
  }

  __break(1u);
  return result;
}

uint64_t *simd_float4x2.subscript.modify(uint64_t *result, char a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  BOOL v4 = v3 == 1;
  if ((a2 & 1) != 0)
  {
    if (v3 == 1)
    {
LABEL_9:
      *(void *)(result[2] + 8) = v2;
      return result;
    }

    if (v3 == 2)
    {
LABEL_8:
      *(void *)(result[2] + 16) = v2;
      return result;
    }

    BOOL v4 = v3 == 3;
    if (v3 == 3) {
      goto LABEL_11;
    }
    __break(1u);
  }

  if (v4) {
    goto LABEL_9;
  }
  if (v3 == 2) {
    goto LABEL_8;
  }
  if (v3 == 3)
  {
LABEL_11:
    *(void *)(result[2] + 24) = v2;
    return result;
  }

  __break(1u);
  return result;
}

float simd_float4x2.subscript.getter( uint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6)
{
  switch(a1)
  {
    case 0LL:
      goto LABEL_5;
    case 1LL:
      a3 = a4;
      goto LABEL_5;
    case 2LL:
      a3 = a5;
      goto LABEL_5;
    case 3LL:
      a3 = a6;
LABEL_5:
      if (a2 > 1)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x186F07C6CLL);
      }

      double v7 = a3;
      return *(float *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a2 & 1)));
    default:
      goto LABEL_8;
  }

uint64_t key path getter for simd_float4x2.subscript(_:_:) : simd_float4x2@<X0>( uint64_t result@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 2)
  {
    result += 16LL;
  }

  else if (v3 == 1)
  {
    result += 8LL;
  }

  else if (v3)
  {
    if (v3 != 3) {
      goto LABEL_11;
    }
    result += 24LL;
  }

  if ((unint64_t)a2[1] <= 1)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 1));
    return result;
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

int *key path setter for simd_float4x2.subscript(_:_:) : simd_float4x2( int *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  int v5 = *result;
  if (!*a3)
  {
    if (v4 <= 1)
    {
      uint64_t v7 = *a2;
      *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v4 & 1))) = v5;
      *a2 = v7;
      return result;
    }

    goto LABEL_16;
  }

  switch(v3)
  {
    case 1LL:
      uint64_t v6 = a2[1];
      break;
    case 2LL:
      uint64_t v6 = a2[2];
      break;
    case 3LL:
      uint64_t v6 = a2[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }

  if (v4 > 1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v8 = v6;
  *(_DWORD *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v4 & 1))) = v5;
  if (v3 == 1)
  {
    a2[1] = v8;
  }

  else if (v3 == 2)
  {
    a2[2] = v8;
  }

  else
  {
    a2[3] = v8;
  }

  return result;
}

uint64_t simd_float4x2.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  switch(result)
  {
    case 0LL:
      if (a2 <= 1)
      {
        uint64_t v5 = *v3;
        *(float *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a2 & 1))) = a3;
        *uint64_t v3 = v5;
        return result;
      }

      goto LABEL_16;
    case 1LL:
      uint64_t v4 = v3[1];
      break;
    case 2LL:
      uint64_t v4 = v3[2];
      break;
    case 3LL:
      uint64_t v4 = v3[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }

  if (a2 > 1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v6 = v4;
  *(float *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a2 & 1))) = a3;
  if (result == 1)
  {
    v3[1] = v6;
  }

  else if (result == 2)
  {
    v3[2] = v6;
  }

  else
  {
    v3[3] = v6;
  }

  return result;
}

double (*simd_float4x2.subscript.modify( double (*result)(uint64_t *a1, char a2), uint64_t a2, unint64_t a3))(uint64_t *a1, char a2)
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)double result = a2;
  if (a2)
  {
    switch(a2)
    {
      case 1LL:
        uint64_t v4 = v3[1];
        break;
      case 2LL:
        uint64_t v4 = v3[2];
        break;
      case 3LL:
        uint64_t v4 = v3[3];
        break;
      default:
        goto LABEL_12;
    }
  }

  else
  {
    uint64_t v4 = *v3;
  }

  if (a3 <= 1)
  {
    uint64_t v5 = v4;
    *((_DWORD *)result + 6) = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a3 & 1)));
    return simd_float4x2.subscript.modify;
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

double simd_float4x2.subscript.modify(uint64_t *a1, char a2)
{
  int v2 = *((_DWORD *)a1 + 6);
  uint64_t v3 = a1[2];
  double v5 = *(double *)(v3 + 24);
  uint64_t v4 = (double *)(v3 + 24);
  double v6 = v5;
  uint64_t v7 = a1[2];
  double v9 = *(double *)(v7 + 16);
  uint64_t v8 = (double *)(v7 + 16);
  double v10 = v9;
  uint64_t v11 = a1[2];
  double v13 = *(double *)(v11 + 8);
  Swift::String v12 = (double *)(v11 + 8);
  double v14 = v13;
  uint64_t v15 = *a1;
  if ((a2 & 1) != 0)
  {
    switch(v15)
    {
      case 0LL:
        goto LABEL_4;
      case 1LL:
        goto LABEL_5;
      case 2LL:
        goto LABEL_6;
      case 3LL:
        goto LABEL_7;
      default:
        __break(1u);
        goto LABEL_9;
    }
  }

  switch(v15)
  {
    case 0LL:
LABEL_4:
      double v14 = *(double *)a1[2];
      Swift::String v12 = (double *)a1[2];
      break;
    case 1LL:
      break;
    case 2LL:
LABEL_6:
      double v14 = v10;
      Swift::String v12 = v8;
      break;
    case 3LL:
LABEL_7:
      double v14 = v6;
      Swift::String v12 = v4;
      break;
    default:
LABEL_9:
      __break(1u);
      JUMPOUT(0x186F07F94LL);
  }

LABEL_5:
  uint64_t v16 = (_DWORD *)((unint64_t)&v18 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a1[1] & 1)));
  double v18 = v14;
  *uint64_t v16 = v2;
  double result = v18;
  *Swift::String v12 = v18;
  return result;
}

  uint64_t v16 = (_DWORD *)((unint64_t)&v18 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a1[1] & 3)));
  double v18 = v14;
  *uint64_t v16 = v2;
  double result = *(double *)&v18;
  *Swift::String v12 = v18;
  return result;
}

  uint64_t v16 = (void *)((unint64_t)&v18 & 0xFFFFFFFFFFFFFFF7LL | (8 * (a1[2] & 1)));
  double v18 = v13;
  *uint64_t v16 = v14;
  double result = *(double *)&v18;
  char *v11 = v18;
  return result;
}

  uint64_t v8 = a1[2] & 3;
  uint64_t v11 = v4;
  Swift::String v12 = v6;
  *((void *)&v11 + v8) = v5;
  double result = *(double *)&v11;
  double v10 = v12;
  *uint64_t v3 = v11;
  v3[1] = v10;
  return result;
}

uint64_t simd_float4x2.debugDescription.getter()
{
  v0._countAndFlagsBits = 91LL;
  v0._object = (void *)0xE100000000000000LL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 93LL;
  v2._object = (void *)0xE100000000000000LL;
  String.append(_:)(v2);
  v3._countAndFlagsBits = 0LL;
  v3._object = (void *)0xE000000000000000LL;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8236LL;
  v4._object = (void *)0xE200000000000000LL;
  String.append(_:)(v4);
  v5._countAndFlagsBits = 91LL;
  v5._object = (void *)0xE100000000000000LL;
  String.append(_:)(v5);
  _print_unlocked<A, B>(_:_:)();
  v6._countAndFlagsBits = 8236LL;
  v6._object = (void *)0xE200000000000000LL;
  String.append(_:)(v6);
  _print_unlocked<A, B>(_:_:)();
  v7._countAndFlagsBits = 93LL;
  v7._object = (void *)0xE100000000000000LL;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0LL;
  v8._object = (void *)0xE000000000000000LL;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 8236LL;
  v9._object = (void *)0xE200000000000000LL;
  String.append(_:)(v9);
  v10._countAndFlagsBits = 91LL;
  v10._object = (void *)0xE100000000000000LL;
  String.append(_:)(v10);
  _print_unlocked<A, B>(_:_:)();
  v11._countAndFlagsBits = 8236LL;
  v11._object = (void *)0xE200000000000000LL;
  String.append(_:)(v11);
  _print_unlocked<A, B>(_:_:)();
  v12._countAndFlagsBits = 93LL;
  v12._object = (void *)0xE100000000000000LL;
  String.append(_:)(v12);
  v13._countAndFlagsBits = 0LL;
  v13._object = (void *)0xE000000000000000LL;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 8236LL;
  v14._object = (void *)0xE200000000000000LL;
  String.append(_:)(v14);
  v15._countAndFlagsBits = 91LL;
  v15._object = (void *)0xE100000000000000LL;
  String.append(_:)(v15);
  _print_unlocked<A, B>(_:_:)();
  v16._countAndFlagsBits = 8236LL;
  v16._object = (void *)0xE200000000000000LL;
  String.append(_:)(v16);
  _print_unlocked<A, B>(_:_:)();
  v17._countAndFlagsBits = 93LL;
  v17._object = (void *)0xE100000000000000LL;
  String.append(_:)(v17);
  v18._countAndFlagsBits = 0LL;
  v18._object = (void *)0xE000000000000000LL;
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  v19._countAndFlagsBits = 10589LL;
  v19._object = (void *)0xE200000000000000LL;
  String.append(_:)(v19);
  return 0x6F6C665F646D6973LL;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float4x2()
{
  return simd_float4x2.debugDescription.getter();
}

uint64_t static simd_float4x2.== infix(_:_:)( float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5, float32x2_t a6, float32x2_t a7, float32x2_t a8)
{
  uint32x2_t v8 = (uint32x2_t)vand_s8( vand_s8((int8x8_t)vceq_f32(a2, a6), (int8x8_t)vceq_f32(a1, a5)),  vand_s8((int8x8_t)vceq_f32(a3, a7), (int8x8_t)vceq_f32(a4, a8)));
  return vpmin_u32(v8, v8).u32[0] >> 31;
}

uint64_t simd_equal(simd_float4x2 a1, simd_float4x2 a2)
{
  uint32x2_t v2 = (uint32x2_t)vand_s8( vand_s8( (int8x8_t)vceq_f32((float32x2_t)a1.columns[0], (float32x2_t)a2.columns[0]),  (int8x8_t)vceq_f32((float32x2_t)a1.columns[1], (float32x2_t)a2.columns[1])),  vand_s8( (int8x8_t)vceq_f32((float32x2_t)a1.columns[2], (float32x2_t)a2.columns[2]),  (int8x8_t)vceq_f32((float32x2_t)a1.columns[3], (float32x2_t)a2.columns[3])));
  return vpmin_u32(v2, v2).u32[0] >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float4x2( simd_float4x2 *a1, simd_float4x2 *a2)
{
  return simd_equal(*a1, *a2);
}

double simd_float4x2.transpose.getter(int32x4_t a1, int32x4_t a2, int32x4_t a3, int32x4_t a4)
{
  *(void *)&double result = vzip1q_s32(vzip1q_s32(a1, a3), vzip1q_s32(a2, a4)).u64[0];
  return result;
}

float32x2_t static simd_float4x2.+ infix(_:_:)( float32x2_t a1, double a2, double a3, double a4, float32x2_t a5)
{
  return vadd_f32(a1, a5);
}

float32x2_t static simd_float4x2.- prefix(_:)(float32x2_t a1)
{
  return vsub_f32(0LL, a1);
}

float32x2_t static simd_float4x2.- infix(_:_:)( float32x2_t a1, double a2, double a3, double a4, float32x2_t a5)
{
  return vsub_f32(a1, a5);
}

float32x2_t static simd_float4x2.+= infix(_:_:)( float32x2_t *a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5)
{
  float32x2_t result = vadd_f32(*a1, a2);
  float32x2_t v6 = vadd_f32(a1[1], a3);
  float32x2_t v7 = vadd_f32(a1[2], a4);
  float32x2_t v8 = vadd_f32(a1[3], a5);
  *a1 = result;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

float32x2_t static simd_float4x2.-= infix(_:_:)( float32x2_t *a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5)
{
  float32x2_t result = vsub_f32(*a1, a2);
  float32x2_t v6 = vsub_f32(a1[1], a3);
  float32x2_t v7 = vsub_f32(a1[2], a4);
  float32x2_t v8 = vsub_f32(a1[3], a5);
  *a1 = result;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

float32x2_t static simd_float4x2.* infix(_:_:)(float a1, float32x2_t a2)
{
  return vmul_n_f32(a2, a1);
}

float32x2_t static simd_float4x2.* infix(_:_:)(float32x2_t a1, double a2, double a3, double a4, float a5)
{
  return vmul_n_f32(a1, a5);
}

float32x2_t static simd_float4x2.*= infix(_:_:)(float32x2_t *a1, float a2)
{
  float32x2_t v2 = vmul_n_f32(*a1, a2);
  float32x2_t v3 = vmul_n_f32(a1[1], a2);
  float32x2_t v4 = vmul_n_f32(a1[2], a2);
  float32x2_t result = vmul_n_f32(a1[3], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = result;
  return result;
}

float32x2_t static simd_float4x2.* infix(_:_:)( float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x4_t a5)
{
  return vmla_laneq_f32( vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2),  a4,  a5,  3);
}

{
  return vmla_laneq_f32( vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2),  a4,  a5,  3);
}

{
  return vmla_laneq_f32( vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2),  a4,  a5,  3);
}

{
  return vmla_laneq_f32( vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2),  a4,  a5,  3);
}

double static simd_float4x2.* infix(_:_:)(double a1, int32x4_t a2, int32x4_t a3, int32x4_t a4, int32x4_t a5)
{
  int32x4_t v5 = vzip1q_s32(a2, a4);
  int32x4_t v6 = vzip1q_s32(a3, a5);
  *(void *)&double result = vmlaq_lane_f32( vmulq_n_f32((float32x4_t)vzip1q_s32(v5, v6), *(float *)&a1),  (float32x4_t)vzip2q_s32(v5, v6),  *(float32x2_t *)&a1,  1).u64[0];
  return result;
}

float32x2_t static simd_float4x2.*= infix(_:_:)( float32x2_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  float32x2_t v5 = a1[1];
  float32x2_t v6 = a1[2];
  float32x2_t v7 = a1[3];
  float32x2_t v8 = vmla_laneq_f32( vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(*a1, a2.f32[0]), v5, *(float32x2_t *)a2.f32, 1), v6, a2, 2),  v7,  a2,  3);
  float32x2_t result = vmla_laneq_f32( vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(*a1, a3.f32[0]), v5, *(float32x2_t *)a3.f32, 1), v6, a3, 2),  v7,  a3,  3);
  float32x2_t v10 = vmla_laneq_f32( vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(*a1, a4.f32[0]), v5, *(float32x2_t *)a4.f32, 1), v6, a4, 2),  v7,  a4,  3);
  float32x2_t v11 = vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(*a1, a5.f32[0]), v5, *(float32x2_t *)a5.f32, 1), v6, a5, 2);
  *a1 = v8;
  a1[1] = result;
  a1[2] = v10;
  a1[3] = vmla_laneq_f32(v11, v7, a5, 3);
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float4x2 *a1, simd_float4x2 *a2)
{
  uint32x2_t v10 = (uint32x2_t)vand_s8( vand_s8((int8x8_t)vceq_f32(v3, v7), (int8x8_t)vceq_f32(v2, v6)),  vand_s8((int8x8_t)vceq_f32(v4, v8), (int8x8_t)vceq_f32(v5, v9)));
  return vpmin_u32(v10, v10).u32[0] >> 31;
}

  ;
}

__n64 simd_float2x3.init(diagonal:)()
{
  result.n64_u32[1] = 0;
  return result;
}

void __swiftcall simd_float2x3.init(rows:)(simd_float2x3 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 3LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

unint64_t simd_float2x3.subscript.getter(unint64_t result)
{
  if (result > 1) {
    __break(1u);
  }
  return result;
}

uint64_t simd_float2x3.subscript.setter(uint64_t result, __n128 a2)
{
  if (!result) {
    goto LABEL_4;
  }
  if (result == 1)
  {
    ++v2;
LABEL_4:
    *float32x2_t v2 = a2;
    return result;
  }

  __break(1u);
  return result;
}

_OWORD *simd_float2x3.subscript.modify(void *a1, uint64_t a2)
{
  __n64 result = malloc(0x18uLL);
  float32x2_t v6 = result;
  *a1 = result;
  *((void *)result + 2) = v2;
  if (!a2)
  {
    __n64 result = simd_float2x3.subscript.modify;
LABEL_5:
    *float32x2_t v6 = *v2;
    return result;
  }

  if (a2 == 1)
  {
    ++v2;
    __n64 result = simd_float2x3.subscript.modify;
    goto LABEL_5;
  }

  __break(1u);
  return result;
}

void simd_float2x3.subscript.modify(void **a1)
{
  Swift::String v1 = *a1;
  *(_OWORD *)v1[2] = *(_OWORD *)v1;
  free(v1);
}

{
  void *v1;
  Swift::String v1 = *a1;
  *(_OWORD *)(v1[2] + 16LL) = *(_OWORD *)v1;
  free(v1);
}

uint64_t simd_float2x3.subscript.getter(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (result != 1)
    {
LABEL_7:
      __break(1u);
      return result;
    }

    if (a2 <= 2) {
      return result;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (a2 > 2) {
    goto LABEL_6;
  }
  return result;
}

int *key path setter for simd_float2x3.subscript(_:_:) : simd_float2x3(int *result, uint64_t a2, void *a3)
{
  unint64_t v3 = a3[1];
  int v4 = *result;
  if (!*a3)
  {
    if (v3 <= 2)
    {
      *(_DWORD *)(a2 + 4LL * v3) = v4;
      return result;
    }

uint64_t simd_float2x3.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  if (!result)
  {
    if (a2 > 2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (result == 1)
  {
    if (a2 > 2)
    {
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }

    v3 += 16LL;
LABEL_7:
    *(float *)(v3 + 4LL * a2) = a3;
    return result;
  }

uint64_t (*simd_float2x3.subscript.modify( uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)__n64 result = a2;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_7;
    }
    v3 += 16LL;
  }

  if (a3 <= 2)
  {
    *((_DWORD *)result + 6) = *(_DWORD *)(v3 + 4 * (a3 & 3));
    return simd_float2x3.subscript.modify;
  }

  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t simd_float2x3.debugDescription.getter()
{
  v0._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 10589LL;
  v3._object = (void *)0xE200000000000000LL;
  String.append(_:)(v3);
  return 0x6F6C665F646D6973LL;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float2x3()
{
  return simd_float2x3.debugDescription.getter();
}

uint64_t static simd_float2x3.== infix(_:_:)( float32x4_t a1, float32_t a2, float32x4_t a3, float32_t a4, float32x4_t a5, float32_t a6, float32x4_t a7, float32_t a8)
{
  a1.f32[2] = a2;
  a3.f32[2] = a4;
  a5.f32[2] = a6;
  a7.f32[2] = a8;
  uint32x4_t v8 = (uint32x4_t)vandq_s8((int8x16_t)vceqq_f32(a3, a7), (int8x16_t)vceqq_f32(a1, a5));
  v8.i32[3] = v8.i32[2];
  return vminvq_u32(v8) >> 31;
}

uint64_t simd_equal(simd_float2x3 a1, simd_float2x3 a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8( (int8x16_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0]),  (int8x16_t)vceqq_f32((float32x4_t)a1.columns[1], (float32x4_t)a2.columns[1]));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float2x3( __n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_float2x3( a1,  a2,  a3,  a4,  (uint64_t (*)(__n128, __n128, __n128, __n128))simd_equal);
}

double static simd_float2x3.+ infix(_:_:)( float32x4_t a1, float32_t a2, double a3, double a4, float32x4_t a5, float32_t a6)
{
  a1.f32[2] = a2;
  a5.f32[2] = a6;
  a1.i64[0] = vaddq_f32(a1, a5).u64[0];
  return *(double *)a1.i64;
}

double static simd_float2x3.- prefix(_:)(float32x4_t a1, float32_t a2)
{
  a1.f32[2] = a2;
  a1.i64[0] = vsubq_f32((float32x4_t)0, a1).u64[0];
  return *(double *)a1.i64;
}

double static simd_float2x3.- infix(_:_:)( float32x4_t a1, float32_t a2, double a3, double a4, float32x4_t a5, float32_t a6)
{
  a1.f32[2] = a2;
  a5.f32[2] = a6;
  a1.i64[0] = vsubq_f32(a1, a5).u64[0];
  return *(double *)a1.i64;
}

float32x4_t static simd_float2x3.+= infix(_:_:)( float32x4_t *a1, float32x4_t a2, float32_t a3, float32x4_t a4, float32_t a5)
{
  a2.f32[2] = a3;
  a4.f32[2] = a5;
  float32x4_t result = vaddq_f32(a2, *a1);
  float32x4_t v6 = vaddq_f32(a4, a1[1]);
  *a1 = result;
  a1[1] = v6;
  return result;
}

float32x4_t static simd_float2x3.-= infix(_:_:)( float32x4_t *a1, float32x4_t a2, float32_t a3, float32x4_t a4, float32_t a5)
{
  a2.f32[2] = a3;
  a4.f32[2] = a5;
  float32x4_t result = vsubq_f32(*a1, a2);
  float32x4_t v6 = vsubq_f32(a1[1], a4);
  *a1 = result;
  a1[1] = v6;
  return result;
}

double static simd_float2x3.* infix(_:_:)(float a1, float32x4_t a2, float32_t a3)
{
  a2.f32[2] = a3;
  *(void *)&double result = vmulq_n_f32(a2, a1).u64[0];
  return result;
}

double static simd_float2x3.* infix(_:_:)(float32x4_t a1, float32_t a2, double a3, double a4, float a5)
{
  a1.f32[2] = a2;
  a1.i64[0] = vmulq_n_f32(a1, a5).u64[0];
  return *(double *)a1.i64;
}

float32x4_t static simd_float2x3.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t v2 = vmulq_n_f32(*a1, a2);
  float32x4_t result = vmulq_n_f32(a1[1], a2);
  *a1 = v2;
  a1[1] = result;
  return result;
}

double static simd_float2x3.* infix(_:_:)( float32x4_t a1, float32_t a2, float32x4_t a3, float32_t a4, double a5)
{
  a1.f32[2] = a2;
  a3.f32[2] = a4;
  a1.i64[0] = vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a5), a3, *(float32x2_t *)&a5, 1).u64[0];
  return *(double *)a1.i64;
}

{
  a1.f32[2] = a2;
  a3.f32[2] = a4;
  a1.i64[0] = vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a5), a3, *(float32x2_t *)&a5, 1).u64[0];
  return *(double *)a1.i64;
}

float32x2_t static simd_float2x3.* infix(_:_:)( float32x4_t a1, int32x2_t a2, float32x2_t a3, int32x2_t a4, float32_t a5)
{
  a3.f32[1] = a5;
  return vmla_laneq_f32( vmla_lane_f32( vmul_n_f32((float32x2_t)vzip1_s32(a2, a4), a1.f32[0]),  (float32x2_t)vzip2_s32(a2, a4),  *(float32x2_t *)a1.f32,  1),  a3,  a1,  2);
}

float32x4_t static simd_float2x3.* infix(_:_:)@<Q0>( float32x4_t *a1@<X8>, float32x4_t a2@<Q0>, float32_t a3@<S1>, float32x4_t a4@<Q2>, float32_t a5@<S3>, double a6@<D4>, double a7@<D5>, double a8@<D6>)
{
  a2.f32[2] = a3;
  a4.f32[2] = a5;
  float32x4_t v8 = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a6), a4, *(float32x2_t *)&a6, 1);
  float32x4_t v9 = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a7), a4, *(float32x2_t *)&a7, 1);
  float32x4_t result = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a8), a4, *(float32x2_t *)&a8, 1);
  *a1 = v8;
  a1[1] = v9;
  a1[2] = result;
  return result;
}

float32x4_t static simd_float2x3.* infix(_:_:)@<Q0>( float32x4_t *a1@<X8>, float32x4_t a2@<Q0>, float32_t a3@<S1>, float32x4_t a4@<Q2>, float32_t a5@<S3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>)
{
  a2.f32[2] = a3;
  a4.f32[2] = a5;
  float32x4_t v9 = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a6), a4, *(float32x2_t *)&a6, 1);
  float32x4_t v10 = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a8), a4, *(float32x2_t *)&a8, 1);
  *a1 = v9;
  a1[1] = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a7), a4, *(float32x2_t *)&a7, 1);
  float32x4_t result = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a9), a4, *(float32x2_t *)&a9, 1);
  a1[2] = v10;
  a1[3] = result;
  return result;
}

float32x4_t static simd_float2x3.*= infix(_:_:)(float32x4_t *a1, double a2, double a3)
{
  float32x4_t v3 = a1[1];
  float32x4_t v4 = vmlaq_lane_f32(vmulq_n_f32(*a1, *(float *)&a2), v3, *(float32x2_t *)&a2, 1);
  float32x4_t result = vmlaq_lane_f32(vmulq_n_f32(*a1, *(float *)&a3), v3, *(float32x2_t *)&a3, 1);
  *a1 = v4;
  a1[1] = result;
  return result;
}

  ;
}

int32x2_t matrix_transpose(_:)(int32x2_t a1, int32x2_t a2)
{
  return vzip1_s32(a1, a2);
}

  ;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float2x3 *a1, simd_float2x3 *a2)
{
  v2.i32[2] = v3;
  v4.i32[2] = v5;
  v6.i32[2] = v7;
  v8.i32[2] = v9;
  uint32x4_t v10 = (uint32x4_t)vandq_s8((int8x16_t)vceqq_f32(v4, v8), (int8x16_t)vceqq_f32(v2, v6));
  v10.i32[3] = v10.i32[2];
  return vminvq_u32(v10) >> 31;
}

void __swiftcall simd_float3x3.init(_:)(simd_float3x3 *__return_ptr retstr, Swift::Float a2)
{
  int32x4_t v2 = vdupq_lane_s32(0LL, 0);
  simd_float3 v3 = (simd_float3)v2;
  v3.f32[0] = a2;
  simd_float3 v4 = (simd_float3)v2;
  v4.f32[1] = a2;
  *(Swift::Float *)&v2.i32[2] = a2;
  retstr->columns[0] = v3;
  retstr->columns[1] = v4;
  retstr->columns[2] = (simd_float3)v2;
}

void simd_float3x3.init(diagonal:)(int32x4_t *a1@<X8>, __n128 a2@<Q0>)
{
  int32x4_t v2 = vdupq_lane_s32(0LL, 0);
  int32x4_t v3 = v2;
  v3.i32[0] = a2.n128_u32[0];
  int32x4_t v4 = v2;
  v4.i32[1] = a2.n128_i32[1];
  v2.i32[2] = a2.n128_i32[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v2;
}

void __swiftcall simd_float3x3.init(_:)(simd_float3x3 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 3LL)
  {
    simd_float3 v4 = *((simd_float3 *)a2._rawValue + 3);
    simd_float3 v5 = *((simd_float3 *)a2._rawValue + 2);
    simd_float3 v3 = *((simd_float3 *)a2._rawValue + 4);
    swift_bridgeObjectRelease();
    retstr->columns[0] = v5;
    retstr->columns[1] = v4;
    retstr->columns[2] = v3;
  }

  else
  {
    __break(1u);
  }

void __swiftcall simd_float3x3.init(rows:)(simd_float3x3 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 3LL)
  {
    int32x4_t v9 = *((int32x4_t *)rows._rawValue + 2);
    int32x4_t v10 = *((int32x4_t *)rows._rawValue + 3);
    int32x4_t v8 = *((int32x4_t *)rows._rawValue + 4);
    swift_bridgeObjectRelease();
    int32x4_t v3 = vzip1q_s32(v9, v8);
    int32x4_t v4 = vzip1q_s32(v10, (int32x4_t)0);
    int32x4_t v5 = vzip1q_s32(v3, v4);
    int32x4_t v6 = vzip2q_s32(v3, v4);
    v5.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v8, 0).i32[2];
    v6.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v8, 1).i32[2];
    int32x4_t v7 = vzip1q_s32(vdupq_laneq_s32(v9, 2), vdupq_laneq_s32(v10, 2));
    v7.i32[2] = v8.i32[2];
    retstr->columns[0] = (simd_float3)v5;
    retstr->columns[1] = (simd_float3)v6;
    retstr->columns[2] = (simd_float3)v7;
  }

  else
  {
    __break(1u);
  }

__n128 simd_float3x3.transpose.getter@<Q0>(int32x4_t *a1@<X8>)
{
  int32x4_t v2 = v1[1];
  int32x4_t v3 = v1[2];
  int32x4_t v4 = vzip1q_s32(*v1, v3);
  int32x4_t v5 = vzip1q_s32(v2, (int32x4_t)0);
  int32x4_t v6 = vzip1q_s32(v4, v5);
  int32x4_t v7 = vzip2q_s32(v4, v5);
  v6.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v3, 0).i32[2];
  v7.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v3, 1).i32[2];
  int32x4_t v8 = vzip1q_s32(vdupq_laneq_s32(*v1, 2), vdupq_laneq_s32(v2, 2));
  v8.i32[2] = v1[2].i64[1];
  *a1 = v6;
  a1[1] = v7;
  a1[2] = v8;
  result.n128_u64[0] = v8.i64[0];
  result.n128_u32[2] = v8.u32[2];
  return result;
}

void simd_float3x3.init(_:_:_:)(__n128 *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
}

void __swiftcall simd_float3x3.init(_:)(simd_float3x3 *__return_ptr retstr, simd_float3x3 *a2)
{
  simd_float3 v2 = a2->columns[1];
  retstr->columns[0] = a2->columns[0];
  retstr->columns[1] = v2;
  retstr->columns[2] = a2->columns[2];
}

__n128 simd_float3x3.cmatrix.getter@<Q0>(uint64_t a1@<X8>)
{
  __int128 v2 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(v1 + 32);
  *(__n128 *)(a1 + 32) = result;
  return result;
}

unint64_t simd_float3x3.subscript.getter(unint64_t result)
{
  if (result > 2) {
    __break(1u);
  }
  return result;
}

uint64_t (*simd_float3x3.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  __n128 result = (uint64_t (*)())malloc(0x20uLL);
  int32x4_t v6 = result;
  *a1 = result;
  *((void *)result + 2) = a2;
  *((void *)result + 3) = v2;
  switch(a2)
  {
    case 0LL:
      __int128 v7 = *v2;
      __n128 result = (uint64_t (*)())simd_float3x3.subscript.modify;
LABEL_8:
      *(_OWORD *)int32x4_t v6 = v7;
      return result;
    case 1LL:
      __int128 v7 = v2[1];
LABEL_7:
      __n128 result = simd_float3x3.subscript.modify;
      goto LABEL_8;
    case 2LL:
      __int128 v7 = v2[2];
      goto LABEL_7;
  }

  __break(1u);
  return result;
}

void simd_float3x3.subscript.modify(void **a1)
{
  uint64_t v1 = *a1;
  *(_OWORD *)v1[3] = *(_OWORD *)v1;
  free(v1);
}

unint64_t simd_float3x3.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 2)
  {
    if (a2 <= 2) {
      return result;
    }
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t key path getter for simd_float3x3.subscript(_:_:) : simd_float3x3@<X0>( uint64_t result@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 1)
  {
    result += 16LL;
  }

  else if (v3)
  {
    if (v3 != 2) {
      goto LABEL_9;
    }
    result += 32LL;
  }

  if ((unint64_t)a2[1] <= 2)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 3));
    return result;
  }

  __break(1u);
LABEL_9:
  __break(1u);
  return result;
}

int *key path setter for simd_float3x3.subscript(_:_:) : simd_float3x3( int *result, __int128 *a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  unint64_t v3 = a3[1];
  int v5 = *result;
  if (!*a3)
  {
    if (v3 <= 2)
    {
      __int128 v7 = *a2;
      *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3LL | (4 * (v3 & 3))) = v5;
      *a2 = v7;
      return result;
    }

    goto LABEL_12;
  }

  if (v4 == 1)
  {
    __int128 v6 = a2[1];
  }

  else
  {
    if (v4 != 2)
    {
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
    }

    __int128 v6 = a2[2];
  }

  if (v3 > 2)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  __int128 v8 = v6;
  *(_DWORD *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF3LL | (4 * (v3 & 3))) = v5;
  if (v4 == 1) {
    a2[1] = v8;
  }
  else {
    a2[2] = v8;
  }
  return result;
}

uint64_t simd_float3x3.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  switch(result)
  {
    case 0LL:
      if (a2 <= 2)
      {
        __int128 v5 = *v3;
        *(float *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a2 & 3))) = a3;
        *unint64_t v3 = v5;
        return result;
      }

      goto LABEL_12;
    case 1LL:
      __int128 v4 = v3[1];
      break;
    case 2LL:
      __int128 v4 = v3[2];
      break;
    default:
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
  }

  if (a2 > 2)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  __int128 v6 = v4;
  *(float *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a2 & 3))) = a3;
  if (result == 1) {
    v3[1] = v6;
  }
  else {
    v3[2] = v6;
  }
  return result;
}

uint64_t (*simd_float3x3.subscript.modify( uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)__n128 result = a2;
  switch(a2)
  {
    case 0LL:
      __int128 v4 = *v3;
      if (a3 <= 2) {
        goto LABEL_6;
      }
LABEL_9:
      __break(1u);
      break;
    case 1LL:
      __int128 v4 = v3[1];
      if (a3 > 2) {
        goto LABEL_9;
      }
LABEL_6:
      __int128 v5 = v4;
      *((_DWORD *)result + 6) = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a3 & 3)));
      return simd_float3x3.subscript.modify;
    case 2LL:
      __int128 v4 = v3[2];
      if (a3 <= 2) {
        goto LABEL_6;
      }
      goto LABEL_9;
  }

  __break(1u);
  return result;
}

uint64_t simd_float3x3.debugDescription.getter()
{
  v0._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 8236LL;
  v3._object = (void *)0xE200000000000000LL;
  String.append(_:)(v3);
  v4._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 10589LL;
  v5._object = (void *)0xE200000000000000LL;
  String.append(_:)(v5);
  return 0x6F6C665F646D6973LL;
}

uint64_t static simd_float3x3.== infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f32(a1[1], a2[1]), (int8x16_t)vceqq_f32(*a1, *a2)),  (int8x16_t)vceqq_f32(a1[2], a2[2]));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

uint64_t simd_equal(simd_float3x3 a1, simd_float3x3 a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8( vandq_s8( (int8x16_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0]),  (int8x16_t)vceqq_f32((float32x4_t)a1.columns[1], (float32x4_t)a2.columns[1])),  (int8x16_t)vceqq_f32((float32x4_t)a1.columns[2], (float32x4_t)a2.columns[2]));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float3x3( __n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_float3x3( a1,  a2,  a3,  a4,  (uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128))simd_equal);
}

void simd_float3x3.inverse.getter(simd_float3x3 *a1@<X8>)
{
  *a1 = __invert_f3(*v1);
}

double simd_float3x3.determinant.getter()
{
  int32x4_t v1 = *(int32x4_t *)(v0 + 16);
  int32x4_t v2 = *(int32x4_t *)(v0 + 32);
  float32x4_t v3 = vmulq_f32( *(float32x4_t *)v0,  vmlaq_f32( vmulq_f32( (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v2, (int8x16_t)v2, 0xCuLL), (int8x16_t)v2, 8uLL),  vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v1, v1), (int8x16_t)v1, 0xCuLL))),  (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v2, v2), (int8x16_t)v2, 0xCuLL),  (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v1, (int8x16_t)v1, 0xCuLL), (int8x16_t)v1, 8uLL)));
  *(void *)&double result = vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2),  vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).u64[0];
  return result;
}

float32x4_t static simd_float3x3.+ infix(_:_:)@<Q0>( float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, float32x4_t *a3@<X8>)
{
  float32x4_t result = vaddq_f32(*a2, *a1);
  float32x4_t v4 = vaddq_f32(a2[1], a1[1]);
  float32x4_t v5 = vaddq_f32(a2[2], a1[2]);
  *a3 = result;
  a3[1] = v4;
  a3[2] = v5;
  return result;
}

float32x4_t static simd_float3x3.- prefix(_:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>)
{
  float32x4_t result = vsubq_f32((float32x4_t)0, *a1);
  float32x4_t v3 = vsubq_f32((float32x4_t)0, a1[1]);
  float32x4_t v4 = vsubq_f32((float32x4_t)0, a1[2]);
  *a2 = result;
  a2[1] = v3;
  a2[2] = v4;
  return result;
}

float32x4_t static simd_float3x3.- infix(_:_:)@<Q0>( float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, float32x4_t *a3@<X8>)
{
  float32x4_t result = vsubq_f32(*a1, *a2);
  float32x4_t v4 = vsubq_f32(a1[1], a2[1]);
  float32x4_t v5 = vsubq_f32(a1[2], a2[2]);
  *a3 = result;
  a3[1] = v4;
  a3[2] = v5;
  return result;
}

float32x4_t static simd_float3x3.+= infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  float32x4_t result = vaddq_f32(*a2, *a1);
  float32x4_t v3 = vaddq_f32(a2[1], a1[1]);
  float32x4_t v4 = vaddq_f32(a2[2], a1[2]);
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

float32x4_t static simd_float3x3.-= infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  float32x4_t result = vsubq_f32(*a1, *a2);
  float32x4_t v3 = vsubq_f32(a1[1], a2[1]);
  float32x4_t v4 = vsubq_f32(a1[2], a2[2]);
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

float32x4_t static simd_float3x3.* infix(_:_:)@<Q0>( float32x4_t *a1@<X0>, float32x4_t *a2@<X8>, float a3@<S0>)
{
  float32x4_t v3 = vmulq_n_f32(*a1, a3);
  float32x4_t v4 = vmulq_n_f32(a1[1], a3);
  float32x4_t result = vmulq_n_f32(a1[2], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = result;
  return result;
}

{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t result;
  float32x4_t v3 = vmulq_n_f32(*a1, a3);
  float32x4_t v4 = vmulq_n_f32(a1[1], a3);
  float32x4_t result = vmulq_n_f32(a1[2], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = result;
  return result;
}

float32x4_t static simd_float3x3.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t v2 = vmulq_n_f32(*a1, a2);
  float32x4_t v3 = vmulq_n_f32(a1[1], a2);
  float32x4_t result = vmulq_n_f32(a1[2], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = result;
  return result;
}

double static simd_float3x3.* infix(_:_:)(float32x4_t *a1, float32x4_t a2)
{
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, a2.f32[0]), a1[1], *(float32x2_t *)a2.f32, 1),  a1[2],  a2,  2).u64[0];
  return result;
}

double static simd_float3x3.* infix(_:_:)(int32x4_t *a1, float32x4_t a2)
{
  int32x4_t v2 = a1[1];
  float32x4_t v3 = (float32x4_t)vtrn2q_s32(*a1, v2);
  v3.i32[2] = HIDWORD(a1[2].i64[0]);
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_lane_f32( vmulq_n_f32((float32x4_t)vzip1q_s32(vzip1q_s32(*a1, a1[2]), v2), a2.f32[0]),  v3,  *(float32x2_t *)a2.f32,  1),  (float32x4_t)vzip1q_s32(vzip2q_s32(*a1, a1[2]), vdupq_laneq_s32(v2, 2)),  a2,  2).u64[0];
  return result;
}

double static simd_float3x3.* infix(_:_:)(float32x4_t *a1, double a2, float a3)
{
  *(void *)&double result = vmlaq_n_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, *(float *)&a2), a1[1], *(float32x2_t *)&a2, 1),  a1[2],  a3).u64[0];
  return result;
}

float32x4_t static simd_float3x3.* infix(_:_:)@<Q0>( float32x4_t *a1@<X0>, float32x2_t *a2@<X1>, float32x4_t *a3@<X8>)
{
  float32x4_t v3 = a1[1];
  float32x4_t v4 = a1[2];
  float32x4_t result = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[2].f32)), v3, a2[2], 1),  v4,  *(float32x4_t *)a2[2].f32,  2);
  float32x4_t v6 = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[4].f32)), v3, a2[4], 1),  v4,  *(float32x4_t *)a2[4].f32,  2);
  *a3 = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2->f32)), v3, *a2, 1),  v4,  *(float32x4_t *)a2->f32,  2);
  a3[1] = result;
  a3[2] = v6;
  return result;
}

{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t result;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v3 = a1[1];
  float32x4_t v4 = a1[2];
  float32x4_t result = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[2].f32)), v3, a2[2], 1),  v4,  *(float32x4_t *)a2[2].f32,  2);
  float32x4_t v6 = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[4].f32)), v3, a2[4], 1),  v4,  *(float32x4_t *)a2[4].f32,  2);
  __int128 v7 = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[6].f32)), v3, a2[6], 1),  v4,  *(float32x4_t *)a2[6].f32,  2);
  *a3 = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2->f32)), v3, *a2, 1),  v4,  *(float32x4_t *)a2->f32,  2);
  a3[1] = result;
  a3[2] = v6;
  a3[3] = v7;
  return result;
}

float32x4_t static simd_float3x3.*= infix(_:_:)(float32x4_t *a1, float32x2_t *a2)
{
  float32x4_t v2 = a1[1];
  float32x4_t v3 = a1[2];
  float32x4_t result = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[2].f32)), v2, a2[2], 1),  v3,  *(float32x4_t *)a2[2].f32,  2);
  float32x4_t v5 = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[4].f32)), v2, a2[4], 1),  v3,  *(float32x4_t *)a2[4].f32,  2);
  *a1 = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2->f32)), v2, *a2, 1),  v3,  *(float32x4_t *)a2->f32,  2);
  a1[1] = result;
  a1[2] = v5;
  return result;
}

void matrix_from_diagonal(_:)(int32x4_t *a1@<X8>, __n128 a2@<Q0>)
{
  int32x4_t v2 = vdupq_lane_s32(0LL, 0);
  int32x4_t v3 = v2;
  v3.i32[0] = a2.n128_u32[0];
  int32x4_t v4 = v2;
  v4.i32[1] = a2.n128_i32[1];
  v2.i32[2] = a2.n128_i32[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v2;
}

void __swiftcall matrix_invert(_:)(simd_float3x3 *__return_ptr retstr, simd_float3x3 *a2)
{
  *retstr = __invert_f3(*a2);
}

Swift::Float __swiftcall matrix_determinant(_:)(simd_float3x3 *a1)
{
  int32x4_t v1 = (int32x4_t)a1->columns[1];
  int32x4_t v2 = (int32x4_t)a1->columns[2];
  float32x4_t v3 = vmulq_f32( (float32x4_t)a1->columns[0],  vmlaq_f32( vmulq_f32( (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v2, (int8x16_t)v2, 0xCuLL), (int8x16_t)v2, 8uLL),  vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v1, v1), (int8x16_t)v1, 0xCuLL))),  (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v2, v2), (int8x16_t)v2, 0xCuLL),  (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v1, (int8x16_t)v1, 0xCuLL), (int8x16_t)v1, 8uLL)));
  LODWORD(result) = vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2),  vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).u32[0];
  return result;
}

void matrix_from_columns(_:_:_:)(__n128 *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
}

__n128 matrix_from_rows(_:_:_:)@<Q0>( int32x4_t *a1@<X8>, int32x4_t a2@<Q0>, int32x4_t a3@<Q1>, int32x4_t a4@<Q2>)
{
  int32x4_t v4 = vzip1q_s32(a2, a4);
  int32x4_t v5 = vzip1q_s32(a3, (int32x4_t)0);
  int32x4_t v6 = vzip1q_s32(v4, v5);
  int32x4_t v7 = vzip2q_s32(v4, v5);
  v6.i32[2] = vdupq_lane_s32(*(int32x2_t *)&a4, 0).i32[2];
  v7.i32[2] = vdupq_lane_s32(*(int32x2_t *)&a4, 1).i32[2];
  int32x4_t v8 = vzip1q_s32(vdupq_laneq_s32(a2, 2), vdupq_laneq_s32(a3, 2));
  v8.i32[2] = a4.i32[2];
  *a1 = v6;
  a1[1] = v7;
  a1[2] = v8;
  result.n128_u64[0] = v8.i64[0];
  result.n128_u32[2] = v8.u32[2];
  return result;
}

{
  int32x4_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  __n128 result;
  int32x4_t v4 = vzip1q_s32(a2, a4);
  int32x4_t v5 = vzip2q_s32(a2, a4);
  int32x4_t v6 = vzip1q_s32(a3, (int32x4_t)0);
  int32x4_t v7 = vzip2q_s32(a3, (int32x4_t)0);
  int32x4_t v8 = vzip1q_s32(v4, v6);
  int32x4_t v9 = vzip2q_s32(v4, v6);
  int32x4_t v10 = vzip1q_s32(v5, v7);
  float32x2_t v11 = vzip2q_s32(v5, v7);
  v8.i32[2] = vdupq_lane_s32(*(int32x2_t *)&a4, 0).i32[2];
  v9.i32[2] = vdupq_lane_s32(*(int32x2_t *)&a4, 1).i32[2];
  v10.i32[2] = a4.i32[2];
  v11.i32[2] = vdupq_laneq_s32(a4, 3).i32[2];
  *a1 = v8;
  a1[1] = v9;
  a1[2] = v10;
  a1[3] = v11;
  result.n128_u64[0] = v11.i64[0];
  result.n128_u32[2] = v11.u32[2];
  return result;
}

void __swiftcall matrix_transpose(_:)(simd_float3x3 *__return_ptr retstr, simd_float3x3 *a2)
{
  int32x4_t v2 = (int32x4_t)a2->columns[1];
  int32x4_t v3 = (int32x4_t)a2->columns[2];
  int32x4_t v4 = vzip1q_s32((int32x4_t)a2->columns[0], v3);
  int32x4_t v5 = vzip1q_s32(v2, (int32x4_t)0);
  int32x4_t v6 = vzip1q_s32(v4, v5);
  int32x4_t v7 = vzip2q_s32(v4, v5);
  v6.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v3, 0).i32[2];
  v7.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v3, 1).i32[2];
  int32x4_t v8 = vzip1q_s32(vdupq_laneq_s32((int32x4_t)a2->columns[0], 2), vdupq_laneq_s32(v2, 2));
  v8.i32[2] = a2->columns[2].i64[1];
  retstr->columns[0] = (simd_float3)v6;
  retstr->columns[1] = (simd_float3)v7;
  retstr->columns[2] = (simd_float3)v8;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float3x3 *a1, simd_float3x3 *a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8( vandq_s8( (int8x16_t)vceqq_f32((float32x4_t)a1->columns[1], (float32x4_t)a2->columns[1]),  (int8x16_t)vceqq_f32((float32x4_t)a1->columns[0], (float32x4_t)a2->columns[0])),  (int8x16_t)vceqq_f32((float32x4_t)a1->columns[2], (float32x4_t)a2->columns[2]));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

void __swiftcall simd_float4x3.init(_:)(simd_float4x3 *__return_ptr retstr, Swift::Float a2)
{
  int32x4_t v2 = vdupq_lane_s32(0LL, 0);
  simd_float3 v3 = (simd_float3)v2;
  v3.f32[0] = a2;
  simd_float3 v4 = (simd_float3)v2;
  v4.f32[1] = a2;
  *(Swift::Float *)&v2.i32[2] = a2;
  retstr->columns[0] = v3;
  retstr->columns[1] = v4;
  retstr->columns[2] = (simd_float3)v2;
  retstr->columns[3] = 0uLL;
}

void simd_float4x3.init(diagonal:)(int32x4_t *a1@<X8>, __n128 a2@<Q0>)
{
  int32x4_t v2 = vdupq_lane_s32(0LL, 0);
  int32x4_t v3 = v2;
  v3.i32[0] = a2.n128_u32[0];
  int32x4_t v4 = v2;
  v4.i32[1] = a2.n128_i32[1];
  v2.i32[2] = a2.n128_i32[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v2;
  a1[3].i64[0] = 0LL;
  a1[3].i64[1] = 0LL;
}

void __swiftcall simd_float4x3.init(_:)(simd_float4x3 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 4LL)
  {
    simd_float3 v6 = *((simd_float3 *)a2._rawValue + 2);
    simd_float3 v4 = *((simd_float3 *)a2._rawValue + 4);
    simd_float3 v5 = *((simd_float3 *)a2._rawValue + 3);
    simd_float3 v3 = *((simd_float3 *)a2._rawValue + 5);
    swift_bridgeObjectRelease();
    retstr->columns[0] = v6;
    retstr->columns[1] = v5;
    retstr->columns[2] = v4;
    retstr->columns[3] = v3;
  }

  else
  {
    __break(1u);
  }

void __swiftcall simd_float4x3.init(rows:)(simd_float4x3 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 3LL)
  {
    int32x4_t v12 = *((int32x4_t *)rows._rawValue + 2);
    int32x4_t v13 = *((int32x4_t *)rows._rawValue + 3);
    int32x4_t v11 = *((int32x4_t *)rows._rawValue + 4);
    swift_bridgeObjectRelease();
    int32x4_t v3 = vzip1q_s32(v12, v11);
    int32x4_t v4 = vzip2q_s32(v12, v11);
    int32x4_t v5 = vzip1q_s32(v13, (int32x4_t)0);
    int32x4_t v6 = vzip2q_s32(v13, (int32x4_t)0);
    int32x4_t v7 = vzip1q_s32(v3, v5);
    int32x4_t v8 = vzip2q_s32(v3, v5);
    int32x4_t v9 = vzip1q_s32(v4, v6);
    int32x4_t v10 = vzip2q_s32(v4, v6);
    v7.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v11, 0).i32[2];
    v8.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v11, 1).i32[2];
    v9.i32[2] = v11.i32[2];
    v10.i32[2] = vdupq_laneq_s32(v11, 3).i32[2];
    retstr->columns[0] = (simd_float3)v7;
    retstr->columns[1] = (simd_float3)v8;
    retstr->columns[2] = (simd_float3)v9;
    retstr->columns[3] = (simd_float3)v10;
  }

  else
  {
    __break(1u);
  }

void __swiftcall simd_float3x4.init(_:)(simd_float3x4 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 3LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

__n128 simd_float3x4.transpose.getter@<Q0>( int32x4_t *a1@<X8>, int32x4_t a2@<Q0>, int32x4_t a3@<Q1>, int32x4_t a4@<Q2>)
{
  int32x4_t v4 = vzip1q_s32(a2, a4);
  int32x4_t v5 = vzip2q_s32(a2, a4);
  int32x4_t v6 = vzip1q_s32(a3, (int32x4_t)0);
  int32x4_t v7 = vzip2q_s32(a3, (int32x4_t)0);
  int32x4_t v8 = vzip1q_s32(v4, v6);
  int32x4_t v9 = vzip2q_s32(v4, v6);
  int32x4_t v10 = vzip1q_s32(v5, v7);
  int32x4_t v11 = vzip2q_s32(v5, v7);
  v8.i32[2] = vdupq_lane_s32(*(int32x2_t *)&a4, 0).i32[2];
  v9.i32[2] = vdupq_lane_s32(*(int32x2_t *)&a4, 1).i32[2];
  v10.i32[2] = a4.i32[2];
  v11.i32[2] = vdupq_laneq_s32(a4, 3).i32[2];
  *a1 = v8;
  a1[1] = v9;
  a1[2] = v10;
  a1[3] = v11;
  result.n128_u64[0] = v11.i64[0];
  result.n128_u32[2] = v11.u32[2];
  return result;
}

void simd_float4x3.init(_:_:_:_:)( __n128 *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
}

void __swiftcall simd_float4x3.init(_:)(simd_float4x3 *__return_ptr retstr, simd_float4x3 *a2)
{
  simd_float3 v2 = a2->columns[1];
  retstr->columns[0] = a2->columns[0];
  retstr->columns[1] = v2;
  simd_float3 v3 = a2->columns[3];
  retstr->columns[2] = a2->columns[2];
  retstr->columns[3] = v3;
}

__n128 simd_float4x3.cmatrix.getter@<Q0>(uint64_t a1@<X8>)
{
  __int128 v2 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(v1 + 32);
  __int128 v4 = *(_OWORD *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

__n128 simd_float4x3.subscript.getter(uint64_t a1)
{
  switch(a1)
  {
    case 0LL:
      break;
    case 1LL:
      v1 += 16LL;
      break;
    case 2LL:
      v1 += 32LL;
      break;
    case 3LL:
      v1 += 48LL;
      break;
    default:
      __break(1u);
      JUMPOUT(0x186F098D4LL);
  }

  return *(__n128 *)v1;
}

uint64_t (*simd_float4x3.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  __n128 result = (uint64_t (*)())malloc(0x20uLL);
  int32x4_t v6 = result;
  *a1 = result;
  *((void *)result + 2) = a2;
  *((void *)result + 3) = v2;
  switch(a2)
  {
    case 0LL:
      __int128 v7 = *v2;
      __n128 result = simd_float4x3.subscript.modify;
LABEL_10:
      *(_OWORD *)int32x4_t v6 = v7;
      return result;
    case 1LL:
      __int128 v7 = v2[1];
      goto LABEL_9;
    case 2LL:
      __int128 v7 = v2[2];
LABEL_9:
      __n128 result = simd_float4x3.subscript.modify;
      goto LABEL_10;
    case 3LL:
      __int128 v7 = v2[3];
      goto LABEL_9;
  }

  __break(1u);
  return result;
}

float simd_float4x3.subscript.getter(uint64_t a1, unint64_t a2)
{
  switch(a1)
  {
    case 0LL:
      goto LABEL_5;
    case 1LL:
      v2 += 16LL;
      goto LABEL_5;
    case 2LL:
      v2 += 32LL;
      goto LABEL_5;
    case 3LL:
      v2 += 48LL;
LABEL_5:
      if (a2 > 2)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x186F099D0LL);
      }

      return *(float *)(v2 + 4 * (a2 & 3));
    default:
      goto LABEL_8;
  }

uint64_t key path getter for simd_float4x3.subscript(_:_:) : simd_float4x3@<X0>( uint64_t result@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 2)
  {
    result += 32LL;
  }

  else if (v3 == 1)
  {
    result += 16LL;
  }

  else if (v3)
  {
    if (v3 != 3) {
      goto LABEL_11;
    }
    result += 48LL;
  }

  if ((unint64_t)a2[1] <= 2)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 3));
    return result;
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

int *key path setter for simd_float4x3.subscript(_:_:) : simd_float4x3( int *result, __int128 *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  int v5 = *result;
  if (!*a3)
  {
    if (v4 <= 2)
    {
      __int128 v7 = *a2;
      *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3LL | (4 * (v4 & 3))) = v5;
      *a2 = v7;
      return result;
    }

    goto LABEL_16;
  }

  switch(v3)
  {
    case 1LL:
      __int128 v6 = a2[1];
      break;
    case 2LL:
      __int128 v6 = a2[2];
      break;
    case 3LL:
      __int128 v6 = a2[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }

  if (v4 > 2)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  __int128 v8 = v6;
  *(_DWORD *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF3LL | (4 * (v4 & 3))) = v5;
  if (v3 == 1)
  {
    a2[1] = v8;
  }

  else if (v3 == 2)
  {
    a2[2] = v8;
  }

  else
  {
    a2[3] = v8;
  }

  return result;
}

uint64_t simd_float4x3.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  switch(result)
  {
    case 0LL:
      if (a2 <= 2)
      {
        __int128 v5 = *v3;
        *(float *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a2 & 3))) = a3;
        *uint64_t v3 = v5;
        return result;
      }

      goto LABEL_16;
    case 1LL:
      __int128 v4 = v3[1];
      break;
    case 2LL:
      __int128 v4 = v3[2];
      break;
    case 3LL:
      __int128 v4 = v3[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }

  if (a2 > 2)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  __int128 v6 = v4;
  *(float *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a2 & 3))) = a3;
  if (result == 1)
  {
    v3[1] = v6;
  }

  else if (result == 2)
  {
    v3[2] = v6;
  }

  else
  {
    v3[3] = v6;
  }

  return result;
}

uint64_t (*simd_float4x3.subscript.modify( uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)__n128 result = a2;
  if (a2)
  {
    switch(a2)
    {
      case 1LL:
        __int128 v4 = v3[1];
        break;
      case 2LL:
        __int128 v4 = v3[2];
        break;
      case 3LL:
        __int128 v4 = v3[3];
        break;
      default:
        goto LABEL_12;
    }
  }

  else
  {
    __int128 v4 = *v3;
  }

  if (a3 <= 2)
  {
    __int128 v5 = v4;
    *((_DWORD *)result + 6) = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a3 & 3)));
    return simd_float4x3.subscript.modify;
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t simd_float4x3.debugDescription.getter()
{
  v0._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 8236LL;
  v3._object = (void *)0xE200000000000000LL;
  String.append(_:)(v3);
  v4._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 8236LL;
  v5._object = (void *)0xE200000000000000LL;
  String.append(_:)(v5);
  v6._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 10589LL;
  v7._object = (void *)0xE200000000000000LL;
  String.append(_:)(v7);
  return 0x6F6C665F646D6973LL;
}

uint64_t static simd_float4x3.== infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f32(a1[1], a2[1]), (int8x16_t)vceqq_f32(*a1, *a2)),  vandq_s8((int8x16_t)vceqq_f32(a1[2], a2[2]), (int8x16_t)vceqq_f32(a1[3], a2[3])));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

uint64_t simd_equal(simd_float4x3 a1, simd_float4x3 a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8( vandq_s8( (int8x16_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0]),  (int8x16_t)vceqq_f32((float32x4_t)a1.columns[1], (float32x4_t)a2.columns[1])),  vandq_s8( (int8x16_t)vceqq_f32((float32x4_t)a1.columns[2], (float32x4_t)a2.columns[2]),  (int8x16_t)vceqq_f32((float32x4_t)a1.columns[3], (float32x4_t)a2.columns[3])));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float4x3( __n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_float4x3( a1,  a2,  a3,  a4,  (uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128, __n128, __n128))simd_equal);
}

double simd_float4x3.transpose.getter()
{
  *(void *)&double result = vzip1q_s32(vzip1q_s32(*v0, v0[2]), vzip1q_s32(v0[1], v0[3])).u64[0];
  return result;
}

float32x4_t static simd_float4x3.+ infix(_:_:)@<Q0>( float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, float32x4_t *a3@<X8>)
{
  float32x4_t result = vaddq_f32(*a2, *a1);
  float32x4_t v4 = vaddq_f32(a2[1], a1[1]);
  float32x4_t v5 = vaddq_f32(a2[2], a1[2]);
  float32x4_t v6 = vaddq_f32(a2[3], a1[3]);
  *a3 = result;
  a3[1] = v4;
  a3[2] = v5;
  a3[3] = v6;
  return result;
}

float32x4_t static simd_float4x3.- prefix(_:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>)
{
  float32x4_t result = vsubq_f32((float32x4_t)0, *a1);
  float32x4_t v3 = vsubq_f32((float32x4_t)0, a1[1]);
  float32x4_t v4 = vsubq_f32((float32x4_t)0, a1[2]);
  float32x4_t v5 = vsubq_f32((float32x4_t)0, a1[3]);
  *a2 = result;
  a2[1] = v3;
  a2[2] = v4;
  a2[3] = v5;
  return result;
}

float32x4_t static simd_float4x3.- infix(_:_:)@<Q0>( float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, float32x4_t *a3@<X8>)
{
  float32x4_t result = vsubq_f32(*a1, *a2);
  float32x4_t v4 = vsubq_f32(a1[1], a2[1]);
  float32x4_t v5 = vsubq_f32(a1[2], a2[2]);
  float32x4_t v6 = vsubq_f32(a1[3], a2[3]);
  *a3 = result;
  a3[1] = v4;
  a3[2] = v5;
  a3[3] = v6;
  return result;
}

float32x4_t static simd_float4x3.+= infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  float32x4_t result = vaddq_f32(*a2, *a1);
  float32x4_t v3 = vaddq_f32(a2[1], a1[1]);
  float32x4_t v4 = vaddq_f32(a2[2], a1[2]);
  float32x4_t v5 = vaddq_f32(a2[3], a1[3]);
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

float32x4_t static simd_float4x3.-= infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  float32x4_t result = vsubq_f32(*a1, *a2);
  float32x4_t v3 = vsubq_f32(a1[1], a2[1]);
  float32x4_t v4 = vsubq_f32(a1[2], a2[2]);
  float32x4_t v5 = vsubq_f32(a1[3], a2[3]);
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

float32x4_t static simd_float4x3.* infix(_:_:)@<Q0>( float32x4_t *a1@<X0>, float32x4_t *a2@<X8>, float a3@<S0>)
{
  float32x4_t v3 = vmulq_n_f32(*a1, a3);
  float32x4_t v4 = vmulq_n_f32(a1[1], a3);
  float32x4_t v5 = vmulq_n_f32(a1[2], a3);
  float32x4_t result = vmulq_n_f32(a1[3], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = result;
  return result;
}

{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t result;
  float32x4_t v3 = vmulq_n_f32(*a1, a3);
  float32x4_t v4 = vmulq_n_f32(a1[1], a3);
  float32x4_t v5 = vmulq_n_f32(a1[2], a3);
  float32x4_t result = vmulq_n_f32(a1[3], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = result;
  return result;
}

float32x4_t static simd_float4x3.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t v2 = vmulq_n_f32(*a1, a2);
  float32x4_t v3 = vmulq_n_f32(a1[1], a2);
  float32x4_t v4 = vmulq_n_f32(a1[2], a2);
  float32x4_t result = vmulq_n_f32(a1[3], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = result;
  return result;
}

double static simd_float4x3.* infix(_:_:)(float32x4_t *a1, float32x4_t a2)
{
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, a2.f32[0]), a1[1], *(float32x2_t *)a2.f32, 1),  a1[2],  a2,  2),  a1[3],  a2,  3).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, a2.f32[0]), a1[1], *(float32x2_t *)a2.f32, 1),  a1[2],  a2,  2),  a1[3],  a2,  3).u64[0];
  return result;
}

double static simd_float4x3.* infix(_:_:)(int32x4_t *a1, float32x4_t a2)
{
  int32x4_t v2 = a1[1];
  int32x4_t v3 = a1[2];
  int32x4_t v4 = a1[3];
  int32x4_t v5 = vzip1q_s32(*a1, v3);
  int32x4_t v6 = vzip2q_s32(*a1, v3);
  int32x4_t v7 = vzip1q_s32(v2, v4);
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_lane_f32( vmulq_n_f32((float32x4_t)vzip1q_s32(v5, v7), a2.f32[0]),  (float32x4_t)vzip2q_s32(v5, v7),  *(float32x2_t *)a2.f32,  1),  (float32x4_t)vzip1q_s32(v6, vzip2q_s32(v2, v4)),  a2,  2).u64[0];
  return result;
}

float32x4_t static simd_float4x3.* infix(_:_:)@<Q0>( float32x4_t *a1@<X0>, float32x4_t *a2@<X8>, float32x4_t a3@<Q0>, float32x4_t a4@<Q1>, float32x4_t a5@<Q2>)
{
  float32x4_t v5 = a1[1];
  float32x4_t v6 = a1[2];
  float32x4_t v7 = a1[3];
  float32x4_t v8 = vmlaq_laneq_f32( vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a3.f32[0]), v5, *(float32x2_t *)a3.f32, 1), v6, a3, 2),  v7,  a3,  3);
  float32x4_t result = vmlaq_laneq_f32( vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a4.f32[0]), v5, *(float32x2_t *)a4.f32, 1), v6, a4, 2),  v7,  a4,  3);
  float32x4_t v10 = vmlaq_laneq_f32( vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a5.f32[0]), v5, *(float32x2_t *)a5.f32, 1), v6, a5, 2),  v7,  a5,  3);
  *a2 = v8;
  a2[1] = result;
  a2[2] = v10;
  return result;
}

float32x4_t static simd_float4x3.* infix(_:_:)@<Q0>( float32x4_t *a1@<X0>, float32x4_t *a2@<X8>, float32x4_t a3@<Q0>, float32x4_t a4@<Q1>, float32x4_t a5@<Q2>, float32x4_t a6@<Q3>)
{
  float32x4_t v6 = a1[1];
  float32x4_t v7 = a1[2];
  float32x4_t v8 = a1[3];
  float32x4_t v9 = vmlaq_laneq_f32( vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a3.f32[0]), v6, *(float32x2_t *)a3.f32, 1), v7, a3, 2),  v8,  a3,  3);
  float32x4_t result = vmlaq_laneq_f32( vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a4.f32[0]), v6, *(float32x2_t *)a4.f32, 1), v7, a4, 2),  v8,  a4,  3);
  float32x4_t v11 = vmlaq_laneq_f32( vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a5.f32[0]), v6, *(float32x2_t *)a5.f32, 1), v7, a5, 2),  v8,  a5,  3);
  float32x4_t v12 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a6.f32[0]), v6, *(float32x2_t *)a6.f32, 1), v7, a6, 2);
  *a2 = v9;
  a2[1] = result;
  a2[2] = v11;
  a2[3] = vmlaq_laneq_f32(v12, v8, a6, 3);
  return result;
}

float32x4_t static simd_float4x3.*= infix(_:_:)( float32x4_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  float32x4_t v5 = a1[1];
  float32x4_t v6 = a1[2];
  float32x4_t v7 = a1[3];
  float32x4_t v8 = vmlaq_laneq_f32( vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a2.f32[0]), v5, *(float32x2_t *)a2.f32, 1), v6, a2, 2),  v7,  a2,  3);
  float32x4_t result = vmlaq_laneq_f32( vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a3.f32[0]), v5, *(float32x2_t *)a3.f32, 1), v6, a3, 2),  v7,  a3,  3);
  float32x4_t v10 = vmlaq_laneq_f32( vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a4.f32[0]), v5, *(float32x2_t *)a4.f32, 1), v6, a4, 2),  v7,  a4,  3);
  float32x4_t v11 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a5.f32[0]), v5, *(float32x2_t *)a5.f32, 1), v6, a5, 2);
  *a1 = v8;
  a1[1] = result;
  a1[2] = v10;
  a1[3] = vmlaq_laneq_f32(v11, v7, a5, 3);
  return result;
}

void matrix_from_columns(_:_:_:_:)( __n128 *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
}

  ;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float4x3 *a1, simd_float4x3 *a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8( vandq_s8( (int8x16_t)vceqq_f32((float32x4_t)a1->columns[1], (float32x4_t)a2->columns[1]),  (int8x16_t)vceqq_f32((float32x4_t)a1->columns[0], (float32x4_t)a2->columns[0])),  vandq_s8( (int8x16_t)vceqq_f32((float32x4_t)a1->columns[2], (float32x4_t)a2->columns[2]),  (int8x16_t)vceqq_f32((float32x4_t)a1->columns[3], (float32x4_t)a2->columns[3])));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

  ;
}

double simd_float2x4.init(diagonal:)(float a1)
{
  int32x4_t v1 = vdupq_lane_s32(0LL, 0);
  *(float *)v1.i32 = a1;
  return *(double *)v1.i64;
}

void __swiftcall simd_float2x4.init(rows:)(simd_float2x4 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 4LL)
  {
    uint32x4_t v2 = (const float *)((char *)rows._rawValue + 32);
    vld2q_f32(v2);
    swift_bridgeObjectRelease();
  }

  else
  {
    __break(1u);
  }

unint64_t simd_float2x4.subscript.getter(unint64_t result)
{
  if (result > 1) {
    __break(1u);
  }
  return result;
}

uint64_t (*simd_float2x4.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  float32x4_t result = (uint64_t (*)())malloc(0x18uLL);
  float32x4_t v6 = result;
  *a1 = result;
  *((void *)result + 2) = v2;
  if (!a2)
  {
    float32x4_t result = simd_float2x4.subscript.modify;
LABEL_5:
    *(_OWORD *)float32x4_t v6 = *v2;
    return result;
  }

  if (a2 == 1)
  {
    ++v2;
    float32x4_t result = simd_float2x4.subscript.modify;
    goto LABEL_5;
  }

  __break(1u);
  return result;
}

unint64_t simd_float2x4.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 1)
  {
    if (a2 <= 3) {
      return result;
    }
    __break(1u);
  }

  __break(1u);
  return result;
}

int *key path setter for simd_float2x4.subscript(_:_:) : simd_float2x4(int *result, uint64_t a2, void *a3)
{
  unint64_t v3 = a3[1];
  int v4 = *result;
  if (!*a3)
  {
    if (v3 <= 3)
    {
      *(_DWORD *)(a2 + 4LL * v3) = v4;
      return result;
    }

uint64_t simd_float2x4.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  if (!result)
  {
    if (a2 > 3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (result == 1)
  {
    if (a2 > 3)
    {
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }

    v3 += 16LL;
LABEL_7:
    *(float *)(v3 + 4LL * a2) = a3;
    return result;
  }

uint64_t (*simd_float2x4.subscript.modify( uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)float32x4_t result = a2;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_7;
    }
    v3 += 16LL;
  }

  if (a3 <= 3)
  {
    *((_DWORD *)result + 6) = *(_DWORD *)(v3 + 4 * (a3 & 3));
    return simd_float2x3.subscript.modify;
  }

  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

float simd_float2x3.subscript.modify(uint64_t a1)
{
  float result = *(float *)(a1 + 24);
  *(float *)(*(void *)(a1 + 16) + 16LL * (*(void *)a1 != 0LL) + 4LL * *(unsigned int *)(a1 + 8)) = result;
  return result;
}

uint64_t simd_float2x4.debugDescription.getter()
{
  v0._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 10589LL;
  v3._object = (void *)0xE200000000000000LL;
  String.append(_:)(v3);
  return 0x6F6C665F646D6973LL;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float2x4()
{
  return simd_float2x4.debugDescription.getter();
}

uint64_t static simd_float2x4.== infix(_:_:)(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  return vminvq_u32((uint32x4_t)vandq_s8((int8x16_t)vceqq_f32(a2, a4), (int8x16_t)vceqq_f32(a1, a3))) >> 31;
}

uint64_t simd_equal(simd_float2x4 a1, simd_float2x4 a2)
{
  return vminvq_u32((uint32x4_t)vandq_s8( (int8x16_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0]),  (int8x16_t)vceqq_f32((float32x4_t)a1.columns[1], (float32x4_t)a2.columns[1]))) >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float2x4( __n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_float2x3( a1,  a2,  a3,  a4,  (uint64_t (*)(__n128, __n128, __n128, __n128))simd_equal);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float2x3( __n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(__n128, __n128, __n128, __n128))
{
  return a5(*a1, a1[1], *a2, a2[1]);
}

double static simd_float2x4.+ infix(_:_:)(float32x4_t a1, double a2, float32x4_t a3)
{
  *(void *)&double result = vaddq_f32(a1, a3).u64[0];
  return result;
}

double static simd_float2x4.- prefix(_:)(float32x4_t a1)
{
  *(void *)&double result = vsubq_f32((float32x4_t)0, a1).u64[0];
  return result;
}

double static simd_float2x4.- infix(_:_:)(float32x4_t a1, double a2, float32x4_t a3)
{
  *(void *)&double result = vsubq_f32(a1, a3).u64[0];
  return result;
}

float32x4_t static simd_float2x4.+= infix(_:_:)(float32x4_t *a1, float32x4_t a2, float32x4_t a3)
{
  float32x4_t result = vaddq_f32(*a1, a2);
  float32x4_t v4 = vaddq_f32(a1[1], a3);
  *a1 = result;
  a1[1] = v4;
  return result;
}

float32x4_t static simd_float2x4.-= infix(_:_:)(float32x4_t *a1, float32x4_t a2, float32x4_t a3)
{
  float32x4_t result = vsubq_f32(*a1, a2);
  float32x4_t v4 = vsubq_f32(a1[1], a3);
  *a1 = result;
  a1[1] = v4;
  return result;
}

double static simd_float2x4.* infix(_:_:)(float a1, float32x4_t a2)
{
  *(void *)&double result = vmulq_n_f32(a2, a1).u64[0];
  return result;
}

double static simd_float2x4.* infix(_:_:)(float32x4_t a1, double a2, float a3)
{
  *(void *)&double result = vmulq_n_f32(a1, a3).u64[0];
  return result;
}

float32x4_t static simd_float2x4.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t v2 = vmulq_n_f32(*a1, a2);
  float32x4_t result = vmulq_n_f32(a1[1], a2);
  *a1 = v2;
  a1[1] = result;
  return result;
}

double static simd_float2x4.* infix(_:_:)(float32x4_t a1, float32x4_t a2, double a3)
{
  *(void *)&double result = vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1).u64[0];
  return result;
}

float32x2_t static simd_float2x4.* infix(_:_:)(float32x4_t a1, int32x4_t a2, int32x4_t a3)
{
  int8x16_t v3 = (int8x16_t)vzip1q_s32(a2, a3);
  int8x16_t v4 = (int8x16_t)vzip2q_s32(a2, a3);
  return vmla_laneq_f32( vmla_laneq_f32( vmla_lane_f32( vmul_n_f32(*(float32x2_t *)v3.i8, a1.f32[0]),  (float32x2_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL),  *(float32x2_t *)a1.f32,  1),  *(float32x2_t *)v4.i8,  a1,  2),  (float32x2_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL),  a1,  3);
}

float32x4_t static simd_float2x4.*= infix(_:_:)(float32x4_t *a1, double a2, double a3)
{
  float32x4_t v3 = a1[1];
  float32x4_t v4 = vmlaq_lane_f32(vmulq_n_f32(*a1, *(float *)&a2), v3, *(float32x2_t *)&a2, 1);
  float32x4_t result = vmlaq_lane_f32(vmulq_n_f32(*a1, *(float *)&a3), v3, *(float32x2_t *)&a3, 1);
  *a1 = v4;
  a1[1] = result;
  return result;
}

double matrix_from_rows(_:_:_:_:)(int32x4_t a1, int32x4_t a2, int32x4_t a3, int32x4_t a4)
{
  *(void *)&double result = vzip1q_s32(vzip1q_s32(a1, a3), vzip1q_s32(a2, a4)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vzip1q_s32(vzip1q_s32(a1, a3), vzip1q_s32(a2, a4)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vzip1q_s32(vzip1q_s32(a1, a3), vzip1q_s32(a2, a4)).u64[0];
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float2x4 *a1, simd_float2x4 *a2)
{
  return vminvq_u32((uint32x4_t)vandq_s8((int8x16_t)vceqq_f32(v3, v5), (int8x16_t)vceqq_f32(v2, v4))) >> 31;
}

  ;
}

double simd_float3x4.init(diagonal:)(float a1)
{
  HIDWORD(v1) = vdupq_lane_s32(0LL, 0).i32[1];
  *(float *)&double v1 = a1;
  return v1;
}

void __swiftcall simd_float3x4.init(rows:)(simd_float3x4 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 4LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

unint64_t simd_float3x4.subscript.getter(unint64_t result)
{
  if (result > 2) {
    __break(1u);
  }
  return result;
}

uint64_t simd_float3x3.subscript.setter(uint64_t result, __n128 a2)
{
  switch(result)
  {
    case 0LL:
      goto LABEL_6;
    case 1LL:
      ++v2;
LABEL_6:
      *float32x4_t v2 = a2;
      return result;
    case 2LL:
      v2 += 2;
      goto LABEL_6;
  }

  __break(1u);
  return result;
}

uint64_t (*simd_float3x4.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  double result = (uint64_t (*)())malloc(0x20uLL);
  float32x4_t v6 = result;
  *a1 = result;
  *((void *)result + 2) = a2;
  *((void *)result + 3) = v2;
  switch(a2)
  {
    case 0LL:
      __int128 v7 = *v2;
      double result = simd_float4x3.subscript.modify;
LABEL_8:
      *(_OWORD *)float32x4_t v6 = v7;
      return result;
    case 1LL:
      __int128 v7 = v2[1];
LABEL_7:
      double result = simd_float3x3.subscript.modify;
      goto LABEL_8;
    case 2LL:
      __int128 v7 = v2[2];
      goto LABEL_7;
  }

  __break(1u);
  return result;
}

void simd_float3x3.subscript.modify(void **a1, char a2)
{
  float32x4_t v2 = *a1;
  __int128 v3 = *(_OWORD *)v2;
  uint64_t v4 = v2[2];
  BOOL v5 = v4 == 1;
  if ((a2 & 1) != 0)
  {
    if (v4 == 1)
    {
LABEL_7:
      *(_OWORD *)(v2[3] + 16LL) = v3;
LABEL_8:
      free(v2);
      return;
    }

    BOOL v5 = v4 == 2;
    if (v4 == 2)
    {
LABEL_10:
      *(_OWORD *)(v2[3] + 32LL) = v3;
      goto LABEL_8;
    }

    __break(1u);
  }

  if (v5) {
    goto LABEL_7;
  }
  if (v4 == 2) {
    goto LABEL_10;
  }
  __break(1u);
}

unint64_t simd_float3x4.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 2)
  {
    if (a2 <= 3) {
      return result;
    }
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t key path getter for simd_float3x4.subscript(_:_:) : simd_float3x4@<X0>( uint64_t result@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 1)
  {
    result += 16LL;
  }

  else if (v3)
  {
    if (v3 != 2) {
      goto LABEL_9;
    }
    result += 32LL;
  }

  if ((unint64_t)a2[1] <= 3)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 3));
    return result;
  }

  __break(1u);
LABEL_9:
  __break(1u);
  return result;
}

int *key path setter for simd_float3x4.subscript(_:_:) : simd_float3x4( int *result, __int128 *a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  unint64_t v3 = a3[1];
  int v5 = *result;
  if (!*a3)
  {
    if (v3 <= 3)
    {
      __int128 v7 = *a2;
      *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3LL | (4 * (v3 & 3))) = v5;
      *a2 = v7;
      return result;
    }

    goto LABEL_12;
  }

  if (v4 == 1)
  {
    __int128 v6 = a2[1];
  }

  else
  {
    if (v4 != 2)
    {
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
    }

    __int128 v6 = a2[2];
  }

  if (v3 > 3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  __int128 v8 = v6;
  *(_DWORD *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF3LL | (4 * (v3 & 3))) = v5;
  if (v4 == 1) {
    a2[1] = v8;
  }
  else {
    a2[2] = v8;
  }
  return result;
}

uint64_t simd_float3x4.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  switch(result)
  {
    case 0LL:
      if (a2 <= 3)
      {
        __int128 v5 = *v3;
        *(float *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a2 & 3))) = a3;
        *unint64_t v3 = v5;
        return result;
      }

      goto LABEL_12;
    case 1LL:
      __int128 v4 = v3[1];
      break;
    case 2LL:
      __int128 v4 = v3[2];
      break;
    default:
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
  }

  if (a2 > 3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  __int128 v6 = v4;
  *(float *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a2 & 3))) = a3;
  if (result == 1) {
    v3[1] = v6;
  }
  else {
    v3[2] = v6;
  }
  return result;
}

uint64_t (*simd_float3x4.subscript.modify( uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)double result = a2;
  switch(a2)
  {
    case 0LL:
      __int128 v4 = *v3;
      if (a3 <= 3) {
        goto LABEL_6;
      }
LABEL_9:
      __break(1u);
      break;
    case 1LL:
      __int128 v4 = v3[1];
      if (a3 > 3) {
        goto LABEL_9;
      }
LABEL_6:
      __int128 v5 = v4;
      *((_DWORD *)result + 6) = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a3 & 3)));
      return simd_float3x3.subscript.modify;
    case 2LL:
      __int128 v4 = v3[2];
      if (a3 <= 3) {
        goto LABEL_6;
      }
      goto LABEL_9;
  }

  __break(1u);
  return result;
}

double simd_float3x3.subscript.modify( uint64_t a1, double a2, double a3, double a4, int64x2_t a5, int64x2_t a6)
{
  int v6 = *(_DWORD *)(a1 + 24);
  __int128 v7 = *(int8x16_t **)(a1 + 16);
  if (*(void *)a1)
  {
    a5.i64[0] = *(void *)a1;
    a6.i64[0] = 1LL;
    int8x16_t v8 = vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(a5, a6).i64[0], 0), v7[1], v7[2]);
    if (*(void *)a1 == 1LL) {
      ++v7;
    }
    else {
      v7 += 2;
    }
  }

  else
  {
    int8x16_t v8 = *v7;
  }

  float32x4_t v9 = (_DWORD *)((unint64_t)&v11 & 0xFFFFFFFFFFFFFFF3LL | (4 * (*(_DWORD *)(a1 + 8) & 3LL)));
  int8x16_t v11 = v8;
  _DWORD *v9 = v6;
  double result = *(double *)v11.i64;
  *__int128 v7 = v11;
  return result;
}

uint64_t simd_float3x4.debugDescription.getter()
{
  v0._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 8236LL;
  v3._object = (void *)0xE200000000000000LL;
  String.append(_:)(v3);
  v4._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 10589LL;
  v5._object = (void *)0xE200000000000000LL;
  String.append(_:)(v5);
  return 0x6F6C665F646D6973LL;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float3x4()
{
  return simd_float3x4.debugDescription.getter();
}

uint64_t static simd_float3x4.== infix(_:_:)( float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float32x4_t a6)
{
  return vminvq_u32((uint32x4_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f32(a2, a5), (int8x16_t)vceqq_f32(a1, a4)),  (int8x16_t)vceqq_f32(a3, a6))) >> 31;
}

uint64_t simd_equal(simd_float3x4 a1, simd_float3x4 a2)
{
  return vminvq_u32((uint32x4_t)vandq_s8( vandq_s8( (int8x16_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0]),  (int8x16_t)vceqq_f32((float32x4_t)a1.columns[1], (float32x4_t)a2.columns[1])),  (int8x16_t)vceqq_f32((float32x4_t)a1.columns[2], (float32x4_t)a2.columns[2]))) >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float3x4( __n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_float3x3( a1,  a2,  a3,  a4,  (uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128))simd_equal);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float3x3( __n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(__n128, __n128, __n128, __n128, __n128, __n128))
{
  return a5(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

double static simd_float3x4.+ infix(_:_:)(float32x4_t a1, double a2, double a3, float32x4_t a4)
{
  *(void *)&double result = vaddq_f32(a1, a4).u64[0];
  return result;
}

double static simd_float3x4.- prefix(_:)(float32x4_t a1)
{
  *(void *)&double result = vsubq_f32((float32x4_t)0, a1).u64[0];
  return result;
}

double static simd_float3x4.- infix(_:_:)(float32x4_t a1, double a2, double a3, float32x4_t a4)
{
  *(void *)&double result = vsubq_f32(a1, a4).u64[0];
  return result;
}

float32x4_t static simd_float3x4.+= infix(_:_:)( float32x4_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  float32x4_t result = vaddq_f32(*a1, a2);
  float32x4_t v5 = vaddq_f32(a1[1], a3);
  float32x4_t v6 = vaddq_f32(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

float32x4_t static simd_float3x4.-= infix(_:_:)( float32x4_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  float32x4_t result = vsubq_f32(*a1, a2);
  float32x4_t v5 = vsubq_f32(a1[1], a3);
  float32x4_t v6 = vsubq_f32(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

double static simd_float3x4.* infix(_:_:)(float a1, float32x4_t a2)
{
  *(void *)&double result = vmulq_n_f32(a2, a1).u64[0];
  return result;
}

double static simd_float3x4.* infix(_:_:)(float32x4_t a1, double a2, double a3, float a4)
{
  *(void *)&double result = vmulq_n_f32(a1, a4).u64[0];
  return result;
}

float32x4_t static simd_float3x4.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t v2 = vmulq_n_f32(*a1, a2);
  float32x4_t v3 = vmulq_n_f32(a1[1], a2);
  float32x4_t result = vmulq_n_f32(a1[2], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = result;
  return result;
}

double static simd_float3x4.* infix(_:_:)(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(a1, a4.f32[0]), a2, *(float32x2_t *)a4.f32, 1),  a3,  a4,  2).u64[0];
  return result;
}

double static simd_float3x4.* infix(_:_:)(float32x4_t a1, int32x4_t a2, int32x4_t a3, int32x4_t a4)
{
  int32x4_t v4 = vdupq_laneq_s32(a3, 2);
  float32x4_t v5 = (float32x4_t)vzip1q_s32(vzip1q_s32(a2, a4), a3);
  float32x4_t v6 = (float32x4_t)vtrn2q_s32(a2, a3);
  v6.i32[2] = a4.i32[1];
  float32x4_t v7 = (float32x4_t)vuzp2q_s32(vuzp2q_s32(a2, a3), a2);
  v7.i32[2] = a4.i32[3];
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(v5, a1.f32[0]), v6, *(float32x2_t *)a1.f32, 1),  (float32x4_t)vzip1q_s32(vzip2q_s32(a2, a4), v4),  a1,  2),  v7,  a1,  3).u64[0];
  return result;
}

double static simd_float3x4.* infix(_:_:)( float32x4_t a1, float32x4_t a2, float32x4_t a3, double a4, float a5)
{
  *(void *)&double result = vmlaq_n_f32(vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a4), a2, *(float32x2_t *)&a4, 1), a3, a5).u64[0];
  return result;
}

double static simd_float3x4.* infix(_:_:)(float32x2_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1->f32)), a3, *a1, 1),  a4,  *(float32x4_t *)a1->f32,  2).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1->f32)), a3, *a1, 1),  a4,  *(float32x4_t *)a1->f32,  2).u64[0];
  return result;
}

float32x4_t static simd_float3x4.*= infix(_:_:)(float32x4_t *a1, float32x2_t *a2)
{
  float32x4_t v2 = a1[1];
  float32x4_t v3 = a1[2];
  float32x4_t result = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[2].f32)), v2, a2[2], 1),  v3,  *(float32x4_t *)a2[2].f32,  2);
  float32x4_t v5 = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[4].f32)), v2, a2[4], 1),  v3,  *(float32x4_t *)a2[4].f32,  2);
  *a1 = vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2->f32)), v2, *a2, 1),  v3,  *(float32x4_t *)a2->f32,  2);
  a1[1] = result;
  a1[2] = v5;
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float3x4 *a1, simd_float3x4 *a2)
{
  return vminvq_u32((uint32x4_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f32(v3, v6), (int8x16_t)vceqq_f32(v2, v5)),  (int8x16_t)vceqq_f32(v4, v7))) >> 31;
}

  ;
}

double simd_float4x4.init(diagonal:)(float a1)
{
  HIDWORD(v1) = vdupq_lane_s32(0LL, 0).i32[1];
  *(float *)&double v1 = a1;
  return v1;
}

void __swiftcall simd_float4x4.init(_:)(simd_float4x4 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 4LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_float4x4.init(rows:)(simd_float4x4 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 4LL)
  {
    float32x4_t v2 = (const float *)((char *)rows._rawValue + 32);
    vld4q_f32(v2);
    swift_bridgeObjectRelease();
  }

  else
  {
    __break(1u);
  }

double simd_float4x4.transpose.getter(int32x4_t a1, int32x4_t a2, int32x4_t a3, int32x4_t a4)
{
  *(void *)&double result = vzip1q_s32(vzip1q_s32(a1, a3), vzip1q_s32(a2, a4)).u64[0];
  return result;
}

double simd_float4x4.subscript.getter(uint64_t a1, double a2, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 0LL:
      return result;
    case 1LL:
      double result = a3;
      break;
    case 2LL:
      double result = a4;
      break;
    case 3LL:
      double result = a5;
      break;
    default:
      __break(1u);
      JUMPOUT(0x186F0AFCCLL);
  }

  return result;
}

uint64_t simd_float4x3.subscript.setter(uint64_t result, __n128 a2)
{
  switch(result)
  {
    case 0LL:
      break;
    case 1LL:
      ++v2;
      break;
    case 2LL:
      v2 += 2;
      break;
    case 3LL:
      v2 += 3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x186F0B028LL);
  }

  *float32x4_t v2 = a2;
  return result;
}

uint64_t (*simd_float4x4.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  double result = (uint64_t (*)())malloc(0x20uLL);
  float32x4_t v6 = result;
  *a1 = result;
  *((void *)result + 2) = a2;
  *((void *)result + 3) = v2;
  switch(a2)
  {
    case 0LL:
      __int128 v7 = *v2;
      double result = simd_float4x3.subscript.modify;
LABEL_10:
      *(_OWORD *)float32x4_t v6 = v7;
      return result;
    case 1LL:
      __int128 v7 = v2[1];
      goto LABEL_9;
    case 2LL:
      __int128 v7 = v2[2];
LABEL_9:
      double result = simd_float4x3.subscript.modify;
      goto LABEL_10;
    case 3LL:
      __int128 v7 = v2[3];
      goto LABEL_9;
  }

  __break(1u);
  return result;
}

void simd_float4x3.subscript.modify(void **a1, char a2)
{
  float32x4_t v2 = *a1;
  __int128 v3 = *(_OWORD *)v2;
  uint64_t v4 = v2[2];
  BOOL v5 = v4 == 1;
  if ((a2 & 1) != 0)
  {
    if (v4 == 1)
    {
LABEL_10:
      *(_OWORD *)(v2[3] + 16LL) = v3;
      goto LABEL_9;
    }

    if (v4 == 2)
    {
LABEL_8:
      *(_OWORD *)(v2[3] + 32LL) = v3;
LABEL_9:
      free(v2);
      return;
    }

    BOOL v5 = v4 == 3;
    if (v4 == 3)
    {
LABEL_12:
      *(_OWORD *)(v2[3] + 48LL) = v3;
      goto LABEL_9;
    }

    __break(1u);
  }

  if (v5) {
    goto LABEL_10;
  }
  if (v4 == 2) {
    goto LABEL_8;
  }
  if (v4 == 3) {
    goto LABEL_12;
  }
  __break(1u);
}

float simd_float4x4.subscript.getter( uint64_t a1, unint64_t a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6)
{
  switch(a1)
  {
    case 0LL:
      goto LABEL_5;
    case 1LL:
      a3 = a4;
      goto LABEL_5;
    case 2LL:
      a3 = a5;
      goto LABEL_5;
    case 3LL:
      a3 = a6;
LABEL_5:
      if (a2 > 3)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x186F0B188LL);
      }

      __n128 v7 = a3;
      return *(float *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a2 & 3)));
    default:
      goto LABEL_8;
  }

uint64_t key path getter for simd_float4x4.subscript(_:_:) : simd_float4x4@<X0>( uint64_t result@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 2)
  {
    result += 32LL;
  }

  else if (v3 == 1)
  {
    result += 16LL;
  }

  else if (v3)
  {
    if (v3 != 3) {
      goto LABEL_11;
    }
    result += 48LL;
  }

  if ((unint64_t)a2[1] <= 3)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 3));
    return result;
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

int *key path setter for simd_float4x4.subscript(_:_:) : simd_float4x4( int *result, __int128 *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  int v5 = *result;
  if (!*a3)
  {
    if (v4 <= 3)
    {
      __int128 v7 = *a2;
      *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3LL | (4 * (v4 & 3))) = v5;
      *a2 = v7;
      return result;
    }

    goto LABEL_16;
  }

  switch(v3)
  {
    case 1LL:
      __int128 v6 = a2[1];
      break;
    case 2LL:
      __int128 v6 = a2[2];
      break;
    case 3LL:
      __int128 v6 = a2[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }

  if (v4 > 3)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  __int128 v8 = v6;
  *(_DWORD *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF3LL | (4 * (v4 & 3))) = v5;
  if (v3 == 1)
  {
    a2[1] = v8;
  }

  else if (v3 == 2)
  {
    a2[2] = v8;
  }

  else
  {
    a2[3] = v8;
  }

  return result;
}

uint64_t simd_float4x4.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  switch(result)
  {
    case 0LL:
      if (a2 <= 3)
      {
        __int128 v5 = *v3;
        *(float *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a2 & 3))) = a3;
        *uint64_t v3 = v5;
        return result;
      }

      goto LABEL_16;
    case 1LL:
      __int128 v4 = v3[1];
      break;
    case 2LL:
      __int128 v4 = v3[2];
      break;
    case 3LL:
      __int128 v4 = v3[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }

  if (a2 > 3)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  __int128 v6 = v4;
  *(float *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a2 & 3))) = a3;
  if (result == 1)
  {
    v3[1] = v6;
  }

  else if (result == 2)
  {
    v3[2] = v6;
  }

  else
  {
    v3[3] = v6;
  }

  return result;
}

uint64_t (*simd_float4x4.subscript.modify( uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)double result = a2;
  if (a2)
  {
    switch(a2)
    {
      case 1LL:
        __int128 v4 = v3[1];
        break;
      case 2LL:
        __int128 v4 = v3[2];
        break;
      case 3LL:
        __int128 v4 = v3[3];
        break;
      default:
        goto LABEL_12;
    }
  }

  else
  {
    __int128 v4 = *v3;
  }

  if (a3 <= 3)
  {
    __int128 v5 = v4;
    *((_DWORD *)result + 6) = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3LL | (4 * (a3 & 3)));
    return simd_float4x3.subscript.modify;
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

double simd_float4x3.subscript.modify(uint64_t *a1, char a2)
{
  int v2 = *((_DWORD *)a1 + 6);
  uint64_t v3 = a1[2];
  __int128 v5 = *(_OWORD *)(v3 + 48);
  __int128 v4 = (_OWORD *)(v3 + 48);
  __int128 v6 = v5;
  uint64_t v7 = a1[2];
  __int128 v9 = *(_OWORD *)(v7 + 32);
  __int128 v8 = (_OWORD *)(v7 + 32);
  __int128 v10 = v9;
  uint64_t v11 = a1[2];
  __int128 v13 = *(_OWORD *)(v11 + 16);
  float32x4_t v12 = (_OWORD *)(v11 + 16);
  __int128 v14 = v13;
  uint64_t v15 = *a1;
  if ((a2 & 1) != 0)
  {
    switch(v15)
    {
      case 0LL:
        goto LABEL_4;
      case 1LL:
        goto LABEL_5;
      case 2LL:
        goto LABEL_6;
      case 3LL:
        goto LABEL_7;
      default:
        __break(1u);
        goto LABEL_9;
    }
  }

  switch(v15)
  {
    case 0LL:
LABEL_4:
      __int128 v14 = *(_OWORD *)a1[2];
      float32x4_t v12 = (_OWORD *)a1[2];
      break;
    case 1LL:
      break;
    case 2LL:
LABEL_6:
      __int128 v14 = v10;
      float32x4_t v12 = v8;
      break;
    case 3LL:
LABEL_7:
      __int128 v14 = v6;
      float32x4_t v12 = v4;
      break;
    default:
LABEL_9:
      __break(1u);
      JUMPOUT(0x186F0B4B0LL);
  }

uint64_t simd_float4x4.debugDescription.getter()
{
  v0._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 8236LL;
  v3._object = (void *)0xE200000000000000LL;
  String.append(_:)(v3);
  v4._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 8236LL;
  v5._object = (void *)0xE200000000000000LL;
  String.append(_:)(v5);
  v6._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 10589LL;
  v7._object = (void *)0xE200000000000000LL;
  String.append(_:)(v7);
  return 0x6F6C665F646D6973LL;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float4x4()
{
  return simd_float4x4.debugDescription.getter();
}

uint64_t static simd_float4x4.== infix(_:_:)( float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float32x4_t a6, float32x4_t a7, float32x4_t a8)
{
  return vminvq_u32((uint32x4_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f32(a2, a6), (int8x16_t)vceqq_f32(a1, a5)),  vandq_s8((int8x16_t)vceqq_f32(a3, a7), (int8x16_t)vceqq_f32(a4, a8)))) >> 31;
}

uint64_t simd_equal(simd_float4x4 a1, simd_float4x4 a2)
{
  return vminvq_u32((uint32x4_t)vandq_s8( vandq_s8( (int8x16_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0]),  (int8x16_t)vceqq_f32((float32x4_t)a1.columns[1], (float32x4_t)a2.columns[1])),  vandq_s8( (int8x16_t)vceqq_f32((float32x4_t)a1.columns[2], (float32x4_t)a2.columns[2]),  (int8x16_t)vceqq_f32((float32x4_t)a1.columns[3], (float32x4_t)a2.columns[3])))) >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float4x4( __n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_float4x3( a1,  a2,  a3,  a4,  (uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128, __n128, __n128))simd_equal);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float4x3( __n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(__n128, __n128, __n128, __n128, __n128, __n128, __n128, __n128))
{
  return a5(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

float simd_float4x4.determinant.getter(float32x4_t a1, int8x16_t a2, int8x16_t a3, int8x16_t a4)
{
  float32x4_t v4 = (float32x4_t)vextq_s8(a3, a3, 8uLL);
  float32x4_t v5 = (float32x4_t)vextq_s8(a4, a4, 0xCuLL);
  float32x4_t v6 = (float32x4_t)vextq_s8(a3, a3, 0xCuLL);
  float32x4_t v7 = (float32x4_t)vextq_s8(a4, a4, 8uLL);
  float32x4_t v8 = (float32x4_t)vextq_s8(a4, a4, 4uLL);
  float32x4_t v9 = (float32x4_t)vextq_s8(a3, a3, 4uLL);
  int8x16_t v10 = (int8x16_t)vmulq_f32( vmlaq_f32( vmlaq_f32( vmulq_f32((float32x4_t)vextq_s8(a2, a2, 8uLL), vmlaq_f32(vmulq_f32(v5, vnegq_f32(v9)), v8, v6)),  vmlaq_f32(vmulq_f32(v7, vnegq_f32(v6)), v5, v4),  (float32x4_t)vextq_s8(a2, a2, 4uLL)),  vmlaq_f32(vmulq_f32(v8, vnegq_f32(v4)), v7, v9),  (float32x4_t)vextq_s8(a2, a2, 0xCuLL)),  a1);
  int32x2_t v11 = (int32x2_t)vextq_s8(v10, v10, 8uLL).u64[0];
  return vaddv_f32( vsub_f32( (float32x2_t)vzip1_s32(*(int32x2_t *)v10.i8, v11),  (float32x2_t)vzip2_s32(*(int32x2_t *)v10.i8, v11)));
}

double static simd_float4x4.+ infix(_:_:)(float32x4_t a1, double a2, double a3, double a4, float32x4_t a5)
{
  *(void *)&double result = vaddq_f32(a1, a5).u64[0];
  return result;
}

double static simd_float4x4.- prefix(_:)(float32x4_t a1)
{
  *(void *)&double result = vsubq_f32((float32x4_t)0, a1).u64[0];
  return result;
}

double static simd_float4x4.- infix(_:_:)(float32x4_t a1, double a2, double a3, double a4, float32x4_t a5)
{
  *(void *)&double result = vsubq_f32(a1, a5).u64[0];
  return result;
}

float32x4_t static simd_float4x4.+= infix(_:_:)( float32x4_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  float32x4_t result = vaddq_f32(*a1, a2);
  float32x4_t v6 = vaddq_f32(a1[1], a3);
  float32x4_t v7 = vaddq_f32(a1[2], a4);
  float32x4_t v8 = vaddq_f32(a1[3], a5);
  *a1 = result;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

float32x4_t static simd_float4x4.-= infix(_:_:)( float32x4_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  float32x4_t result = vsubq_f32(*a1, a2);
  float32x4_t v6 = vsubq_f32(a1[1], a3);
  float32x4_t v7 = vsubq_f32(a1[2], a4);
  float32x4_t v8 = vsubq_f32(a1[3], a5);
  *a1 = result;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

double static simd_float4x4.* infix(_:_:)(float a1, float32x4_t a2)
{
  *(void *)&double result = vmulq_n_f32(a2, a1).u64[0];
  return result;
}

double static simd_float4x4.* infix(_:_:)(float32x4_t a1, double a2, double a3, double a4, float a5)
{
  *(void *)&double result = vmulq_n_f32(a1, a5).u64[0];
  return result;
}

float32x4_t static simd_float4x4.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t v2 = vmulq_n_f32(*a1, a2);
  float32x4_t v3 = vmulq_n_f32(a1[1], a2);
  float32x4_t v4 = vmulq_n_f32(a1[2], a2);
  float32x4_t result = vmulq_n_f32(a1[3], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = result;
  return result;
}

double static simd_float4x4.* infix(_:_:)( float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1),  a3,  a5,  2),  a4,  a5,  3).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1),  a3,  a5,  2),  a4,  a5,  3).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1),  a3,  a5,  2),  a4,  a5,  3).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_laneq_f32( vmlaq_lane_f32(vmulq_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1),  a3,  a5,  2),  a4,  a5,  3).u64[0];
  return result;
}

double static simd_float4x4.* infix(_:_:)( float32x4_t a1, int32x4_t a2, int32x4_t a3, int32x4_t a4, int32x4_t a5)
{
  int32x4_t v5 = vzip1q_s32(a2, a4);
  int32x4_t v6 = vzip2q_s32(a2, a4);
  int32x4_t v7 = vzip1q_s32(a3, a5);
  int32x4_t v8 = vzip2q_s32(a3, a5);
  *(void *)&double result = vmlaq_laneq_f32( vmlaq_laneq_f32( vmlaq_lane_f32( vmulq_n_f32((float32x4_t)vzip1q_s32(v5, v7), a1.f32[0]),  (float32x4_t)vzip2q_s32(v5, v7),  *(float32x2_t *)a1.f32,  1),  (float32x4_t)vzip1q_s32(v6, v8),  a1,  2),  (float32x4_t)vzip2q_s32(v6, v8),  a1,  3).u64[0];
  return result;
}

float32x4_t static simd_float4x4.*= infix(_:_:)( float32x4_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  float32x4_t v5 = a1[1];
  float32x4_t v6 = a1[2];
  float32x4_t v7 = a1[3];
  float32x4_t v8 = vmlaq_laneq_f32( vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a2.f32[0]), v5, *(float32x2_t *)a2.f32, 1), v6, a2, 2),  v7,  a2,  3);
  float32x4_t result = vmlaq_laneq_f32( vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a3.f32[0]), v5, *(float32x2_t *)a3.f32, 1), v6, a3, 2),  v7,  a3,  3);
  float32x4_t v10 = vmlaq_laneq_f32( vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a4.f32[0]), v5, *(float32x2_t *)a4.f32, 1), v6, a4, 2),  v7,  a4,  3);
  float32x4_t v11 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a5.f32[0]), v5, *(float32x2_t *)a5.f32, 1), v6, a5, 2);
  *a1 = v8;
  a1[1] = result;
  a1[2] = v10;
  a1[3] = vmlaq_laneq_f32(v11, v7, a5, 3);
  return result;
}

double matrix_from_diagonal(_:)(float a1)
{
  HIDWORD(v1) = vdupq_lane_s32(0LL, 0).i32[1];
  *(float *)&double v1 = a1;
  return v1;
}

Swift::Float __swiftcall matrix_determinant(_:)(simd_float4x4 *a1)
{
  float32x4_t v5 = (float32x4_t)vextq_s8(v3, v3, 8uLL);
  float32x4_t v6 = (float32x4_t)vextq_s8(v4, v4, 0xCuLL);
  float32x4_t v7 = (float32x4_t)vextq_s8(v3, v3, 0xCuLL);
  float32x4_t v8 = (float32x4_t)vextq_s8(v4, v4, 8uLL);
  float32x4_t v9 = (float32x4_t)vextq_s8(v4, v4, 4uLL);
  float32x4_t v10 = (float32x4_t)vextq_s8(v3, v3, 4uLL);
  int8x16_t v11 = (int8x16_t)vmulq_f32( vmlaq_f32( vmlaq_f32( vmulq_f32( (float32x4_t)vextq_s8(v2, v2, 8uLL),  vmlaq_f32(vmulq_f32(v6, vnegq_f32(v10)), v9, v7)),  vmlaq_f32(vmulq_f32(v8, vnegq_f32(v7)), v6, v5),  (float32x4_t)vextq_s8(v2, v2, 4uLL)),  vmlaq_f32(vmulq_f32(v9, vnegq_f32(v5)), v8, v10),  (float32x4_t)vextq_s8(v2, v2, 0xCuLL)),  v1);
  int32x2_t v12 = (int32x2_t)vextq_s8(v11, v11, 8uLL).u64[0];
  return vaddv_f32( vsub_f32( (float32x2_t)vzip1_s32(*(int32x2_t *)v11.i8, v12),  (float32x2_t)vzip2_s32(*(int32x2_t *)v11.i8, v12)));
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float4x4 *a1, simd_float4x4 *a2)
{
  return vminvq_u32((uint32x4_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f32(v3, v7), (int8x16_t)vceqq_f32(v2, v6)),  vandq_s8((int8x16_t)vceqq_f32(v4, v8), (int8x16_t)vceqq_f32(v5, v9)))) >> 31;
}

  ;
}

  ;
}

void __swiftcall simd_double2x2.init(_:)(simd_double2x2 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 2LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_double2x2.init(rows:)(simd_double2x2 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 2LL)
  {
    float32x4_t v2 = (const double *)((char *)rows._rawValue + 32);
    vld2q_f64(v2);
    swift_bridgeObjectRelease();
  }

  else
  {
    __break(1u);
  }

double simd_double2x2.transpose.getter(int64x2_t a1, int64x2_t a2)
{
  *(void *)&double result = vzip1q_s64(a1, a2).u64[0];
  return result;
}

unint64_t simd_double2x2.subscript.getter(unint64_t result)
{
  if (result > 1) {
    __break(1u);
  }
  return result;
}

uint64_t simd_double2x2.subscript.setter(uint64_t result, __n128 a2)
{
  if (!result) {
    goto LABEL_4;
  }
  if (result == 1)
  {
    ++v2;
LABEL_4:
    *float32x4_t v2 = a2;
    return result;
  }

  __break(1u);
  return result;
}

_OWORD *simd_double2x2.subscript.modify(void *a1, uint64_t a2)
{
  double result = malloc(0x18uLL);
  float32x4_t v6 = result;
  *a1 = result;
  *((void *)result + 2) = v2;
  if (!a2)
  {
    double result = simd_float2x3.subscript.modify;
LABEL_5:
    *float32x4_t v6 = *v2;
    return result;
  }

  if (a2 == 1)
  {
    ++v2;
    double result = simd_float2x3.subscript.modify;
    goto LABEL_5;
  }

  __break(1u);
  return result;
}

unint64_t simd_double2x2.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 1)
  {
    if (a2 <= 1) {
      return result;
    }
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double2x2.subscript(_:_:) : simd_double2x2( uint64_t *result, uint64_t a2, void *a3)
{
  unint64_t v3 = a3[1];
  uint64_t v4 = *result;
  if (!*a3)
  {
    if (v3 <= 1)
    {
      *(void *)(a2 + 8LL * v3) = v4;
      return result;
    }

uint64_t simd_double2x2.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  if (!result)
  {
    if (a2 > 1) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (result == 1)
  {
    if (a2 > 1)
    {
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }

    v3 += 16LL;
LABEL_7:
    *(double *)(v3 + 8LL * a2) = a3;
    return result;
  }

double (*simd_double2x2.subscript.modify( double (*result)(uint64_t a1), uint64_t a2, unint64_t a3))(uint64_t a1)
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_7;
    }
    v3 += 16LL;
  }

  if (a3 <= 1)
  {
    *(void *)double result = *(void *)(v3 + 8 * (a3 & 1));
    return simd_double2x2.subscript.modify;
  }

  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

double simd_double2x2.subscript.modify(uint64_t a1)
{
  double result = *(double *)a1;
  *(void *)(*(void *)(a1 + 24) + 16LL * (*(void *)(a1 + 8) != 0LL) + 8LL * *(unsigned int *)(a1 + 16)) = *(void *)a1;
  return result;
}

unint64_t simd_double2x2.debugDescription.getter()
{
  v0._countAndFlagsBits = 91LL;
  v0._object = (void *)0xE100000000000000LL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 93LL;
  v2._object = (void *)0xE100000000000000LL;
  String.append(_:)(v2);
  v3._countAndFlagsBits = 0LL;
  v3._object = (void *)0xE000000000000000LL;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8236LL;
  v4._object = (void *)0xE200000000000000LL;
  String.append(_:)(v4);
  v5._countAndFlagsBits = 91LL;
  v5._object = (void *)0xE100000000000000LL;
  String.append(_:)(v5);
  _print_unlocked<A, B>(_:_:)();
  v6._countAndFlagsBits = 8236LL;
  v6._object = (void *)0xE200000000000000LL;
  String.append(_:)(v6);
  _print_unlocked<A, B>(_:_:)();
  v7._countAndFlagsBits = 93LL;
  v7._object = (void *)0xE100000000000000LL;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0LL;
  v8._object = (void *)0xE000000000000000LL;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 10589LL;
  v9._object = (void *)0xE200000000000000LL;
  String.append(_:)(v9);
  return 0xD000000000000010LL;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_double2x2()
{
  return simd_double2x2.debugDescription.getter();
}

unint64_t static simd_double2x2.== infix(_:_:)( float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  int64x2_t v4 = (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(a2, a4), (int8x16_t)vceqq_f64(a1, a3));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v4, 1), (int8x16_t)v4).u64[0] >> 63;
}

unint64_t simd_equal(simd_double2x2 a1, simd_double2x2 a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8( (int8x16_t)vceqq_f64((float64x2_t)a1.columns[0], (float64x2_t)a2.columns[0]),  (int8x16_t)vceqq_f64((float64x2_t)a1.columns[1], (float64x2_t)a2.columns[1]));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), (int8x16_t)v2).u64[0] >> 63;
}

unint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double2x2( simd_double2x2 *a1, simd_double2x2 *a2)
{
  return simd_equal(*a1, *a2);
}

double simd_double2x2.determinant.getter(__n128 a1, __n128 a2)
{
  return vmlad_n_f64(-a1.n128_f64[1] * a2.n128_f64[0], a2.n128_f64[1], a1.n128_f64[0]);
}

double static simd_double2x2.+ infix(_:_:)(float64x2_t a1, double a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(a1, a3);
  return result;
}

double static simd_double2x2.- prefix(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64((float64x2_t)0, a1);
  return result;
}

double static simd_double2x2.- infix(_:_:)(float64x2_t a1, double a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(a1, a3);
  return result;
}

float64x2_t static simd_double2x2.+= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t result = vaddq_f64(*a1, a2);
  float64x2_t v4 = vaddq_f64(a1[1], a3);
  *a1 = result;
  a1[1] = v4;
  return result;
}

float64x2_t static simd_double2x2.-= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t result = vsubq_f64(*a1, a2);
  float64x2_t v4 = vsubq_f64(a1[1], a3);
  *a1 = result;
  a1[1] = v4;
  return result;
}

double static simd_double2x2.* infix(_:_:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, a1);
  return result;
}

double static simd_double2x2.* infix(_:_:)(float64x2_t a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, a3);
  return result;
}

float64x2_t static simd_double2x2.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(*a1, a2);
  float64x2_t result = vmulq_n_f64(a1[1], a2);
  *a1 = v2;
  a1[1] = result;
  return result;
}

double static simd_double2x2.* infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a3.f64[0]), a2, a3, 1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a3.f64[0]), a2, a3, 1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a3.f64[0]), a2, a3, 1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a3.f64[0]), a2, a3, 1);
  return result;
}

double static simd_double2x2.* infix(_:_:)(float64x2_t a1, int64x2_t a2, int64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmulq_n_f64((float64x2_t)vzip1q_s64(a2, a3), a1.f64[0]),  (float64x2_t)vzip2q_s64(a2, a3),  a1,  1);
  return result;
}

float64x2_t static simd_double2x2.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = a1[1];
  float64x2_t v4 = vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), v3, a2, 1);
  float64x2_t result = vmlaq_laneq_f64(vmulq_n_f64(*a1, a3.f64[0]), v3, a3, 1);
  *a1 = v4;
  a1[1] = result;
  return result;
}

  ;
}

Swift::Double __swiftcall matrix_determinant(_:)(simd_double2x2 *a1)
{
  return vmlad_n_f64(-*((double *)&v1 + 1) * *(double *)&v2, *((double *)&v2 + 1), *(double *)&v1);
}

double matrix_from_rows(_:_:)(int64x2_t a1, int64x2_t a2)
{
  *(void *)&double result = vzip1q_s64(a1, a2).u64[0];
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double2x2 *a1, simd_double2x2 *a2)
{
  int64x2_t v6 = (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(v3, v5), (int8x16_t)vceqq_f64(v2, v4));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v6, 1), (int8x16_t)v6).u64[0] >> 63;
}

  ;
}

  ;
}

void __swiftcall simd_double3x2.init(_:)(simd_double3x2 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 3LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_double3x2.init(rows:)(simd_double3x2 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 2LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_double2x3.init(_:)(simd_double2x3 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 2LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

double simd_double2x3.transpose.getter(int64x2_t a1, double a2, int64x2_t a3)
{
  *(void *)&double result = vzip1q_s64(a1, a3).u64[0];
  return result;
}

unint64_t simd_double3x2.subscript.getter(unint64_t result)
{
  if (result > 2) {
    __break(1u);
  }
  return result;
}

uint64_t simd_double3x2.subscript.setter(uint64_t result, __n128 a2)
{
  switch(result)
  {
    case 0LL:
      goto LABEL_6;
    case 1LL:
      ++v2;
LABEL_6:
      *float64x2_t v2 = a2;
      return result;
    case 2LL:
      v2 += 2;
      goto LABEL_6;
  }

  __break(1u);
  return result;
}

_OWORD *simd_double3x2.subscript.modify(void *a1, uint64_t a2)
{
  double result = malloc(0x20uLL);
  int64x2_t v6 = result;
  *a1 = result;
  *((void *)result + 2) = a2;
  *((void *)result + 3) = v2;
  switch(a2)
  {
    case 0LL:
      __int128 v7 = *v2;
      double result = simd_float3x3.subscript.modify;
LABEL_8:
      *int64x2_t v6 = v7;
      return result;
    case 1LL:
      __int128 v7 = v2[1];
LABEL_7:
      double result = simd_float3x3.subscript.modify;
      goto LABEL_8;
    case 2LL:
      __int128 v7 = v2[2];
      goto LABEL_7;
  }

  __break(1u);
  return result;
}

unint64_t simd_double3x2.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 2)
  {
    if (a2 <= 1) {
      return result;
    }
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t key path getter for simd_double3x2.subscript(_:_:) : simd_double3x2@<X0>( uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 1)
  {
    result += 16LL;
  }

  else if (v3)
  {
    if (v3 != 2) {
      goto LABEL_9;
    }
    result += 32LL;
  }

  if ((unint64_t)a2[1] <= 1)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 1));
    return result;
  }

  __break(1u);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double3x2.subscript(_:_:) : simd_double3x2( uint64_t *result, __int128 *a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  unint64_t v3 = a3[1];
  uint64_t v5 = *result;
  if (!*a3)
  {
    if (v3 <= 1)
    {
      __int128 v7 = *a2;
      *(void *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF7LL | (8 * (v3 & 1))) = v5;
      *a2 = v7;
      return result;
    }

    goto LABEL_12;
  }

  if (v4 == 1)
  {
    __int128 v6 = a2[1];
  }

  else
  {
    if (v4 != 2)
    {
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
    }

    __int128 v6 = a2[2];
  }

  if (v3 > 1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  __int128 v8 = v6;
  *(void *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF7LL | (8 * (v3 & 1))) = v5;
  if (v4 == 1) {
    a2[1] = v8;
  }
  else {
    a2[2] = v8;
  }
  return result;
}

uint64_t simd_double3x2.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  switch(result)
  {
    case 0LL:
      if (a2 <= 1)
      {
        __int128 v5 = *v3;
        *(double *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF7LL | (8 * (a2 & 1))) = a3;
        *unint64_t v3 = v5;
        return result;
      }

      goto LABEL_12;
    case 1LL:
      __int128 v4 = v3[1];
      break;
    case 2LL:
      __int128 v4 = v3[2];
      break;
    default:
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
  }

  if (a2 > 1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  __int128 v6 = v4;
  *(double *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF7LL | (8 * (a2 & 1))) = a3;
  if (result == 1) {
    v3[1] = v6;
  }
  else {
    v3[2] = v6;
  }
  return result;
}

double (*simd_double3x2.subscript.modify( double (*result)(uint64_t *a1, double a2, double a3, double a4, int64x2_t a5, int64x2_t a6), uint64_t a2, unint64_t a3))(uint64_t *a1, double a2, double a3, double a4, int64x2_t a5, int64x2_t a6)
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  switch(a2)
  {
    case 0LL:
      __int128 v4 = *v3;
      if (a3 <= 1) {
        goto LABEL_6;
      }
LABEL_9:
      __break(1u);
      break;
    case 1LL:
      __int128 v4 = v3[1];
      if (a3 > 1) {
        goto LABEL_9;
      }
LABEL_6:
      __int128 v5 = v4;
      *(void *)double result = *(void *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF7LL | (8 * (a3 & 1)));
      return simd_double3x2.subscript.modify;
    case 2LL:
      __int128 v4 = v3[2];
      if (a3 <= 1) {
        goto LABEL_6;
      }
      goto LABEL_9;
  }

  __break(1u);
  return result;
}

double simd_double3x2.subscript.modify( uint64_t *a1, double a2, double a3, double a4, int64x2_t a5, int64x2_t a6)
{
  __int128 v6 = (int8x16_t *)a1[3];
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  if (v8)
  {
    a5.i64[0] = a1[1];
    a6.i64[0] = 1LL;
    int8x16_t v9 = vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(a5, a6).i64[0], 0), v6[1], v6[2]);
    if (v8 == 1) {
      ++v6;
    }
    else {
      v6 += 2;
    }
  }

  else
  {
    int8x16_t v9 = *v6;
  }

  float32x4_t v10 = (void *)((unint64_t)&v12 & 0xFFFFFFFFFFFFFFF7LL | (8 * (a1[2] & 1)));
  int8x16_t v12 = v9;
  *float32x4_t v10 = v7;
  double result = *(double *)v12.i64;
  *__int128 v6 = v12;
  return result;
}

unint64_t simd_double3x2.debugDescription.getter()
{
  v0._countAndFlagsBits = 91LL;
  v0._object = (void *)0xE100000000000000LL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 93LL;
  v2._object = (void *)0xE100000000000000LL;
  String.append(_:)(v2);
  v3._countAndFlagsBits = 0LL;
  v3._object = (void *)0xE000000000000000LL;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8236LL;
  v4._object = (void *)0xE200000000000000LL;
  String.append(_:)(v4);
  v5._countAndFlagsBits = 91LL;
  v5._object = (void *)0xE100000000000000LL;
  String.append(_:)(v5);
  _print_unlocked<A, B>(_:_:)();
  v6._countAndFlagsBits = 8236LL;
  v6._object = (void *)0xE200000000000000LL;
  String.append(_:)(v6);
  _print_unlocked<A, B>(_:_:)();
  v7._countAndFlagsBits = 93LL;
  v7._object = (void *)0xE100000000000000LL;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0LL;
  v8._object = (void *)0xE000000000000000LL;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 8236LL;
  v9._object = (void *)0xE200000000000000LL;
  String.append(_:)(v9);
  v10._countAndFlagsBits = 91LL;
  v10._object = (void *)0xE100000000000000LL;
  String.append(_:)(v10);
  _print_unlocked<A, B>(_:_:)();
  v11._countAndFlagsBits = 8236LL;
  v11._object = (void *)0xE200000000000000LL;
  String.append(_:)(v11);
  _print_unlocked<A, B>(_:_:)();
  v12._countAndFlagsBits = 93LL;
  v12._object = (void *)0xE100000000000000LL;
  String.append(_:)(v12);
  v13._countAndFlagsBits = 0LL;
  v13._object = (void *)0xE000000000000000LL;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 10589LL;
  v14._object = (void *)0xE200000000000000LL;
  String.append(_:)(v14);
  return 0xD000000000000010LL;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_double3x2()
{
  return simd_double3x2.debugDescription.getter();
}

unint64_t static simd_double3x2.== infix(_:_:)( float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, float64x2_t a6)
{
  int64x2_t v6 = (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a2, a5), (int8x16_t)vceqq_f64(a1, a4)),  (int8x16_t)vceqq_f64(a3, a6));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v6, 1), (int8x16_t)v6).u64[0] >> 63;
}

unint64_t simd_equal(simd_double3x2 a1, simd_double3x2 a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8( (int8x16_t)vceqq_f64((float64x2_t)a1.columns[0], (float64x2_t)a2.columns[0]),  (int8x16_t)vceqq_f64((float64x2_t)a1.columns[1], (float64x2_t)a2.columns[1])),  (int8x16_t)vceqq_f64((float64x2_t)a1.columns[2], (float64x2_t)a2.columns[2]));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), (int8x16_t)v2).u64[0] >> 63;
}

unint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double3x2( simd_double3x2 *a1, simd_double3x2 *a2)
{
  return simd_equal(*a1, *a2);
}

double simd_double3x2.transpose.getter(int64x2_t a1, int64x2_t a2)
{
  *(void *)&double result = vzip1q_s64(a1, a2).u64[0];
  return result;
}

double static simd_double3x2.+ infix(_:_:)(float64x2_t a1, double a2, double a3, float64x2_t a4)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(a1, a4);
  return result;
}

double static simd_double3x2.- prefix(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64((float64x2_t)0, a1);
  return result;
}

double static simd_double3x2.- infix(_:_:)(float64x2_t a1, double a2, double a3, float64x2_t a4)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(a1, a4);
  return result;
}

float64x2_t static simd_double3x2.+= infix(_:_:)( float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t result = vaddq_f64(*a1, a2);
  float64x2_t v5 = vaddq_f64(a1[1], a3);
  float64x2_t v6 = vaddq_f64(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

float64x2_t static simd_double3x2.-= infix(_:_:)( float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t result = vsubq_f64(*a1, a2);
  float64x2_t v5 = vsubq_f64(a1[1], a3);
  float64x2_t v6 = vsubq_f64(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

double static simd_double3x2.* infix(_:_:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, a1);
  return result;
}

double static simd_double3x2.* infix(_:_:)(float64x2_t a1, double a2, double a3, double a4)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, a4);
  return result;
}

float64x2_t static simd_double3x2.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(*a1, a2);
  float64x2_t v3 = vmulq_n_f64(a1[1], a2);
  float64x2_t result = vmulq_n_f64(a1[2], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = result;
  return result;
}

double static simd_double3x2.* infix(_:_:)( float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, double a5)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a1, a4.f64[0]), a2, a4, 1), a3, a5);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a1, a4.f64[0]), a2, a4, 1), a3, a5);
  return result;
}

double static simd_double3x2.* infix(_:_:)(float64x2_t a1, int64x2_t a2, int64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmulq_n_f64((float64x2_t)vzip1q_s64(a2, a3), a1.f64[0]),  (float64x2_t)vzip2q_s64(a2, a3),  a1,  1);
  return result;
}

double static simd_double3x2.* infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64( vmlaq_laneq_f64(vmulq_n_f64(a2, a1->f64[0]), a3, *a1, 1),  a4,  a1[1].f64[0]);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64( vmlaq_laneq_f64(vmulq_n_f64(a2, a1->f64[0]), a3, *a1, 1),  a4,  a1[1].f64[0]);
  return result;
}

float64x2_t static simd_double3x2.*= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = a1[1];
  float64x2_t v3 = a1[2];
  float64x2_t result = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2[2].f64[0]), v2, a2[2], 1), v3, a2[3].f64[0]);
  float64x2_t v5 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2[4].f64[0]), v2, a2[4], 1), v3, a2[5].f64[0]);
  *a1 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v2, *a2, 1), v3, a2[1].f64[0]);
  a1[1] = result;
  a1[2] = v5;
  return result;
}

double matrix_from_rows(_:_:)(int64x2_t a1, double a2, int64x2_t a3)
{
  *(void *)&double result = vzip1q_s64(a1, a3).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vzip1q_s64(a1, a3).u64[0];
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double3x2 *a1, simd_double3x2 *a2)
{
  int64x2_t v8 = (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(v3, v6), (int8x16_t)vceqq_f64(v2, v5)),  (int8x16_t)vceqq_f64(v4, v7));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), (int8x16_t)v8).u64[0] >> 63;
}

  ;
}

  ;
}

void __swiftcall simd_double4x2.init(_:)(simd_double4x2 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 4LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_double4x2.init(rows:)(simd_double4x2 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 2LL)
  {
    float64x2_t v2 = (const double *)((char *)rows._rawValue + 32);
    vld4q_f64(v2);
    swift_bridgeObjectRelease();
  }

  else
  {
    __break(1u);
  }

void __swiftcall simd_double2x4.init(_:)(simd_double2x4 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 2LL) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

double simd_double2x4.transpose.getter(int64x2_t a1, double a2, int64x2_t a3)
{
  *(void *)&double result = vzip1q_s64(a1, a3).u64[0];
  return result;
}

double simd_double4x2.subscript.getter(uint64_t a1, double a2, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 0LL:
      return result;
    case 1LL:
      double result = a3;
      break;
    case 2LL:
      double result = a4;
      break;
    case 3LL:
      double result = a5;
      break;
    default:
      __break(1u);
      JUMPOUT(0x186F0CBF8LL);
  }

  return result;
}

uint64_t simd_double4x2.subscript.setter(uint64_t result, __n128 a2)
{
  switch(result)
  {
    case 0LL:
      break;
    case 1LL:
      ++v2;
      break;
    case 2LL:
      v2 += 2;
      break;
    case 3LL:
      v2 += 3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x186F0CC50LL);
  }

  *float64x2_t v2 = a2;
  return result;
}

uint64_t (*simd_double4x2.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  double result = (uint64_t (*)())malloc(0x20uLL);
  float64x2_t v6 = result;
  *a1 = result;
  *((void *)result + 2) = a2;
  *((void *)result + 3) = v2;
  switch(a2)
  {
    case 0LL:
      __int128 v7 = *v2;
      double result = simd_float4x3.subscript.modify;
LABEL_10:
      *(_OWORD *)float64x2_t v6 = v7;
      return result;
    case 1LL:
      __int128 v7 = v2[1];
      goto LABEL_9;
    case 2LL:
      __int128 v7 = v2[2];
LABEL_9:
      double result = (uint64_t (*)())simd_float4x3.subscript.modify;
      goto LABEL_10;
    case 3LL:
      __int128 v7 = v2[3];
      goto LABEL_9;
  }

  __break(1u);
  return result;
}

double simd_double4x2.subscript.getter( uint64_t a1, unint64_t a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6)
{
  switch(a1)
  {
    case 0LL:
      goto LABEL_5;
    case 1LL:
      a3 = a4;
      goto LABEL_5;
    case 2LL:
      a3 = a5;
      goto LABEL_5;
    case 3LL:
      a3 = a6;
LABEL_5:
      if (a2 > 1)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x186F0CD48LL);
      }

      __n128 v7 = a3;
      return *(double *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF7LL | (8 * (a2 & 1)));
    default:
      goto LABEL_8;
  }

uint64_t key path getter for simd_double4x2.subscript(_:_:) : simd_double4x2@<X0>( uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 2)
  {
    result += 32LL;
  }

  else if (v3 == 1)
  {
    result += 16LL;
  }

  else if (v3)
  {
    if (v3 != 3) {
      goto LABEL_11;
    }
    result += 48LL;
  }

  if ((unint64_t)a2[1] <= 1)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 1));
    return result;
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double4x2.subscript(_:_:) : simd_double4x2( uint64_t *result, __int128 *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  uint64_t v5 = *result;
  if (!*a3)
  {
    if (v4 <= 1)
    {
      __int128 v7 = *a2;
      *(void *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF7LL | (8 * (v4 & 1))) = v5;
      *a2 = v7;
      return result;
    }

    goto LABEL_16;
  }

  switch(v3)
  {
    case 1LL:
      __int128 v6 = a2[1];
      break;
    case 2LL:
      __int128 v6 = a2[2];
      break;
    case 3LL:
      __int128 v6 = a2[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }

  if (v4 > 1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  __int128 v8 = v6;
  *(void *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF7LL | (8 * (v4 & 1))) = v5;
  if (v3 == 1)
  {
    a2[1] = v8;
  }

  else if (v3 == 2)
  {
    a2[2] = v8;
  }

  else
  {
    a2[3] = v8;
  }

  return result;
}

uint64_t simd_double4x2.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  switch(result)
  {
    case 0LL:
      if (a2 <= 1)
      {
        __int128 v5 = *v3;
        *(double *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF7LL | (8 * (a2 & 1))) = a3;
        *uint64_t v3 = v5;
        return result;
      }

      goto LABEL_16;
    case 1LL:
      __int128 v4 = v3[1];
      break;
    case 2LL:
      __int128 v4 = v3[2];
      break;
    case 3LL:
      __int128 v4 = v3[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }

  if (a2 > 1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  __int128 v6 = v4;
  *(double *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF7LL | (8 * (a2 & 1))) = a3;
  if (result == 1)
  {
    v3[1] = v6;
  }

  else if (result == 2)
  {
    v3[2] = v6;
  }

  else
  {
    v3[3] = v6;
  }

  return result;
}

double (*simd_double4x2.subscript.modify( double (*result)(uint64_t *a1, char a2), uint64_t a2, unint64_t a3))(uint64_t *a1, char a2)
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  if (a2)
  {
    switch(a2)
    {
      case 1LL:
        __int128 v4 = v3[1];
        break;
      case 2LL:
        __int128 v4 = v3[2];
        break;
      case 3LL:
        __int128 v4 = v3[3];
        break;
      default:
        goto LABEL_12;
    }
  }

  else
  {
    __int128 v4 = *v3;
  }

  if (a3 <= 1)
  {
    __int128 v5 = v4;
    *(void *)double result = *(void *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF7LL | (8 * (a3 & 1)));
    return simd_double4x2.subscript.modify;
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

double simd_double4x2.subscript.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[3];
  __int128 v4 = *(_OWORD *)(v2 + 48);
  uint64_t v3 = (_OWORD *)(v2 + 48);
  __int128 v5 = v4;
  uint64_t v6 = a1[3];
  __int128 v8 = *(_OWORD *)(v6 + 32);
  __int128 v7 = (_OWORD *)(v6 + 32);
  __int128 v9 = v8;
  uint64_t v10 = a1[3];
  __int128 v12 = *(_OWORD *)(v10 + 16);
  Swift::String v11 = (_OWORD *)(v10 + 16);
  __int128 v13 = v12;
  uint64_t v14 = *a1;
  uint64_t v15 = a1[1];
  if ((a2 & 1) != 0)
  {
    switch(v15)
    {
      case 0LL:
        goto LABEL_4;
      case 1LL:
        goto LABEL_5;
      case 2LL:
        goto LABEL_6;
      case 3LL:
        goto LABEL_7;
      default:
        __break(1u);
        goto LABEL_9;
    }
  }

  switch(v15)
  {
    case 0LL:
LABEL_4:
      __int128 v13 = *(_OWORD *)a1[3];
      Swift::String v11 = (_OWORD *)a1[3];
      break;
    case 1LL:
      break;
    case 2LL:
LABEL_6:
      __int128 v13 = v9;
      Swift::String v11 = v7;
      break;
    case 3LL:
LABEL_7:
      __int128 v13 = v5;
      Swift::String v11 = v3;
      break;
    default:
LABEL_9:
      __break(1u);
      JUMPOUT(0x186F0D070LL);
  }

unint64_t simd_double4x2.debugDescription.getter()
{
  v0._countAndFlagsBits = 91LL;
  v0._object = (void *)0xE100000000000000LL;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 93LL;
  v2._object = (void *)0xE100000000000000LL;
  String.append(_:)(v2);
  v3._countAndFlagsBits = 0LL;
  v3._object = (void *)0xE000000000000000LL;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8236LL;
  v4._object = (void *)0xE200000000000000LL;
  String.append(_:)(v4);
  v5._countAndFlagsBits = 91LL;
  v5._object = (void *)0xE100000000000000LL;
  String.append(_:)(v5);
  _print_unlocked<A, B>(_:_:)();
  v6._countAndFlagsBits = 8236LL;
  v6._object = (void *)0xE200000000000000LL;
  String.append(_:)(v6);
  _print_unlocked<A, B>(_:_:)();
  v7._countAndFlagsBits = 93LL;
  v7._object = (void *)0xE100000000000000LL;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0LL;
  v8._object = (void *)0xE000000000000000LL;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 8236LL;
  v9._object = (void *)0xE200000000000000LL;
  String.append(_:)(v9);
  v10._countAndFlagsBits = 91LL;
  v10._object = (void *)0xE100000000000000LL;
  String.append(_:)(v10);
  _print_unlocked<A, B>(_:_:)();
  v11._countAndFlagsBits = 8236LL;
  v11._object = (void *)0xE200000000000000LL;
  String.append(_:)(v11);
  _print_unlocked<A, B>(_:_:)();
  v12._countAndFlagsBits = 93LL;
  v12._object = (void *)0xE100000000000000LL;
  String.append(_:)(v12);
  v13._countAndFlagsBits = 0LL;
  v13._object = (void *)0xE000000000000000LL;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 8236LL;
  v14._object = (void *)0xE200000000000000LL;
  String.append(_:)(v14);
  v15._countAndFlagsBits = 91LL;
  v15._object = (void *)0xE100000000000000LL;
  String.append(_:)(v15);
  _print_unlocked<A, B>(_:_:)();
  v16._countAndFlagsBits = 8236LL;
  v16._object = (void *)0xE200000000000000LL;
  String.append(_:)(v16);
  _print_unlocked<A, B>(_:_:)();
  v17._countAndFlagsBits = 93LL;
  v17._object = (void *)0xE100000000000000LL;
  String.append(_:)(v17);
  v18._countAndFlagsBits = 0LL;
  v18._object = (void *)0xE000000000000000LL;
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  v19._countAndFlagsBits = 10589LL;
  v19._object = (void *)0xE200000000000000LL;
  String.append(_:)(v19);
  return 0xD000000000000010LL;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_double4x2()
{
  return simd_double4x2.debugDescription.getter();
}

unint64_t static simd_double4x2.== infix(_:_:)( float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, float64x2_t a6, float64x2_t a7, float64x2_t a8)
{
  int64x2_t v8 = (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a2, a6), (int8x16_t)vceqq_f64(a1, a5)),  vandq_s8((int8x16_t)vceqq_f64(a3, a7), (int8x16_t)vceqq_f64(a4, a8)));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), (int8x16_t)v8).u64[0] >> 63;
}

unint64_t simd_equal(simd_double4x2 a1, simd_double4x2 a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8( (int8x16_t)vceqq_f64((float64x2_t)a1.columns[0], (float64x2_t)a2.columns[0]),  (int8x16_t)vceqq_f64((float64x2_t)a1.columns[1], (float64x2_t)a2.columns[1])),  vandq_s8( (int8x16_t)vceqq_f64((float64x2_t)a1.columns[2], (float64x2_t)a2.columns[2]),  (int8x16_t)vceqq_f64((float64x2_t)a1.columns[3], (float64x2_t)a2.columns[3])));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), (int8x16_t)v2).u64[0] >> 63;
}

unint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double4x2( simd_double4x2 *a1, simd_double4x2 *a2)
{
  return simd_equal(*a1, *a2);
}

double simd_double4x2.transpose.getter(int64x2_t a1, int64x2_t a2)
{
  *(void *)&double result = vzip1q_s64(a1, a2).u64[0];
  return result;
}

double static simd_double4x2.+ infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(a1, a5);
  return result;
}

double static simd_double4x2.- prefix(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64((float64x2_t)0, a1);
  return result;
}

double static simd_double4x2.- infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(a1, a5);
  return result;
}

float64x2_t static simd_double4x2.+= infix(_:_:)( float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  float64x2_t result = vaddq_f64(*a1, a2);
  float64x2_t v6 = vaddq_f64(a1[1], a3);
  float64x2_t v7 = vaddq_f64(a1[2], a4);
  float64x2_t v8 = vaddq_f64(a1[3], a5);
  *a1 = result;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

float64x2_t static simd_double4x2.-= infix(_:_:)( float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  float64x2_t result = vsubq_f64(*a1, a2);
  float64x2_t v6 = vsubq_f64(a1[1], a3);
  float64x2_t v7 = vsubq_f64(a1[2], a4);
  float64x2_t v8 = vsubq_f64(a1[3], a5);
  *a1 = result;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

double static simd_double4x2.* infix(_:_:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, a1);
  return result;
}

double static simd_double4x2.* infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, a5);
  return result;
}

float64x2_t static simd_double4x2.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(*a1, a2);
  float64x2_t v3 = vmulq_n_f64(a1[1], a2);
  float64x2_t v4 = vmulq_n_f64(a1[2], a2);
  float64x2_t result = vmulq_n_f64(a1[3], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = result;
  return result;
}

double static simd_double4x2.* infix(_:_:)( float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, float64x2_t a6)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a1, a5.f64[0]), a2, a5, 1), a3, a6.f64[0]),  a4,  a6,  1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a1, a5.f64[0]), a2, a5, 1), a3, a6.f64[0]),  a4,  a6,  1);
  return result;
}

double static simd_double4x2.* infix(_:_:)(float64x2_t a1, int64x2_t a2, int64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmulq_n_f64((float64x2_t)vzip1q_s64(a2, a3), a1.f64[0]),  (float64x2_t)vzip2q_s64(a2, a3),  a1,  1);
  return result;
}

double static simd_double4x2.* infix(_:_:)( float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmlaq_n_f64( vmlaq_laneq_f64(vmulq_n_f64(a2, a1->f64[0]), a3, *a1, 1),  a4,  a1[1].f64[0]),  a5,  a1[1],  1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmlaq_n_f64( vmlaq_laneq_f64(vmulq_n_f64(a2, a1->f64[0]), a3, *a1, 1),  a4,  a1[1].f64[0]),  a5,  a1[1],  1);
  return result;
}

float64x2_t static simd_double4x2.*= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = a2[7];
  float64x2_t v3 = a1[1];
  float64x2_t v4 = a1[2];
  float64x2_t v5 = a1[3];
  float64x2_t result = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2[2].f64[0]), v3, a2[2], 1), v4, a2[3].f64[0]),  v5,  a2[3],  1);
  float64x2_t v7 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2[4].f64[0]), v3, a2[4], 1), v4, a2[5].f64[0]),  v5,  a2[5],  1);
  float64x2_t v8 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2[6].f64[0]), v3, a2[6], 1), v4, v2.f64[0]);
  *a1 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v3, *a2, 1), v4, a2[1].f64[0]),  v5,  a2[1],  1);
  a1[1] = result;
  a1[2] = v7;
  a1[3] = vmlaq_laneq_f64(v8, v5, v2, 1);
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double4x2 *a1, simd_double4x2 *a2)
{
  int64x2_t v10 = (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(v3, v7), (int8x16_t)vceqq_f64(v2, v6)),  vandq_s8((int8x16_t)vceqq_f64(v4, v8), (int8x16_t)vceqq_f64(v5, v9)));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v10, 1), (int8x16_t)v10).u64[0] >> 63;
}

  ;
}

  ;
}

void __swiftcall simd_double2x3.init(rows:)(simd_double2x3 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 3LL)
  {
    float64x2_t v2 = (const double *)((char *)rows._rawValue + 32);
    vld2q_f64(v2);
    swift_bridgeObjectRelease();
  }

  else
  {
    __break(1u);
  }

unint64_t simd_double2x3.subscript.getter(unint64_t result)
{
  if (result > 1) {
    __break(1u);
  }
  return result;
}

_OWORD *simd_double2x3.subscript.modify(void *a1, uint64_t a2)
{
  float64x2_t result = malloc(0x28uLL);
  float64x2_t v6 = result;
  *a1 = result;
  *((void *)result + 4) = v2;
  if (!a2)
  {
    float64x2_t result = simd_double2x3.subscript.modify;
LABEL_5:
    __int128 v7 = v2[1];
    *float64x2_t v6 = *v2;
    v6[1] = v7;
    return result;
  }

  if (a2 == 1)
  {
    v2 += 2;
    float64x2_t result = simd_double2x3.subscript.modify;
    goto LABEL_5;
  }

  __break(1u);
  return result;
}

void simd_double2x3.subscript.modify(void **a1)
{
  Swift::String v1 = *a1;
  float64x2_t v2 = (_OWORD *)v1[4];
  __int128 v3 = *((_OWORD *)v1 + 1);
  *float64x2_t v2 = *(_OWORD *)v1;
  v2[1] = v3;
  free(v1);
}

{
  void *v1;
  uint64_t v2;
  __int128 v3;
  Swift::String v1 = *a1;
  float64x2_t v2 = v1[4];
  __int128 v3 = *((_OWORD *)v1 + 1);
  *(_OWORD *)(v2 + 32) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 48) = v3;
  free(v1);
}

unint64_t simd_double2x3.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 1)
  {
    if (a2 <= 2) {
      return result;
    }
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double2x3.subscript(_:_:) : simd_double2x3( uint64_t *result, uint64_t a2, void *a3)
{
  unint64_t v3 = a3[1];
  uint64_t v4 = *result;
  if (!*a3)
  {
    if (v3 <= 2)
    {
      *(void *)(a2 + 8LL * v3) = v4;
      return result;
    }

uint64_t simd_double2x3.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  if (!result)
  {
    if (a2 > 2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (result == 1)
  {
    if (a2 > 2)
    {
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }

    v3 += 32LL;
LABEL_7:
    *(double *)(v3 + 8LL * a2) = a3;
    return result;
  }

uint64_t (*simd_double2x3.subscript.modify( uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_7;
    }
    v3 += 32LL;
  }

  if (a3 <= 2)
  {
    *(void *)float64x2_t result = *(void *)(v3 + 8 * (a3 & 3));
    return simd_double2x3.subscript.modify;
  }

  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

unint64_t simd_double2x3.debugDescription.getter()
{
  v0._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 10589LL;
  v3._object = (void *)0xE200000000000000LL;
  String.append(_:)(v3);
  return 0xD000000000000010LL;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_double2x3()
{
  return simd_double2x3.debugDescription.getter();
}

unint64_t static simd_double2x3.== infix(_:_:)( float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, float64x2_t a6, float64x2_t a7, float64x2_t a8)
{
  int64x2_t v8 = (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(a3, a7), (int8x16_t)vceqq_f64(a1, a5));
  return vandq_s8( (int8x16_t)vdupq_laneq_s64(v8, 1),  vandq_s8( (int8x16_t)vshlq_n_s64( (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(a4, a8), (int8x16_t)vceqq_f64(a2, a6)),  0x3FuLL),  (int8x16_t)v8)).u64[0] >> 63;
}

unint64_t simd_equal(float64x2_t *a1, float64x2_t *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2));
  return vandq_s8( (int8x16_t)vdupq_laneq_s64(v2, 1),  vandq_s8( (int8x16_t)vshlq_n_s64( (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])),  0x3FuLL),  (int8x16_t)v2)).u64[0] >> 63;
}

{
  int64x2_t v2;
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)),  (int8x16_t)vceqq_f64(a1[4], a2[4]));
  return vandq_s8( (int8x16_t)vdupq_laneq_s64(v2, 1),  vandq_s8( (int8x16_t)vshlq_n_s64( (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])),  (int8x16_t)vceqq_f64(a1[5], a2[5])),  0x3FuLL),  (int8x16_t)v2)).u64[0] >> 63;
}

{
  int64x2_t v2;
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)),  vandq_s8((int8x16_t)vceqq_f64(a1[4], a2[4]), (int8x16_t)vceqq_f64(a1[6], a2[6])));
  return vandq_s8( (int8x16_t)vdupq_laneq_s64(v2, 1),  vandq_s8( (int8x16_t)vshlq_n_s64( (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])),  vandq_s8((int8x16_t)vceqq_f64(a1[5], a2[5]), (int8x16_t)vceqq_f64(a1[7], a2[7]))),  0x3FuLL),  (int8x16_t)v2)).u64[0] >> 63;
}

{
  int64x2_t v2;
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)),  vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

{
  int64x2_t v2;
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)),  (int8x16_t)vceqq_f64(a1[4], a2[4])),  vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])),  (int8x16_t)vceqq_f64(a1[5], a2[5])));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

{
  int64x2_t v2;
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)),  vandq_s8((int8x16_t)vceqq_f64(a1[4], a2[4]), (int8x16_t)vceqq_f64(a1[6], a2[6]))),  vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])),  vandq_s8((int8x16_t)vceqq_f64(a1[5], a2[5]), (int8x16_t)vceqq_f64(a1[7], a2[7]))));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double2x3( _OWORD *a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_double2x3( a1,  a2,  a3,  a4,  (uint64_t (*)(_OWORD *, _OWORD *))simd_equal);
}

double static simd_double2x3.+ infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(a1, a5);
  return result;
}

double static simd_double2x3.- prefix(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64((float64x2_t)0, a1);
  return result;
}

double static simd_double2x3.- infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(a1, a5);
  return result;
}

float64x2_t static simd_double2x3.+= infix(_:_:)( float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  float64x2_t v5 = vaddq_f64(a3, a1[1]);
  float64x2_t result = vaddq_f64(a2, *a1);
  float64x2_t v7 = vaddq_f64(a5, a1[3]);
  float64x2_t v8 = vaddq_f64(a4, a1[2]);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v8;
  a1[3] = v7;
  return result;
}

float64x2_t static simd_double2x3.-= infix(_:_:)( float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  float64x2_t v5 = vsubq_f64(a1[1], a3);
  float64x2_t result = vsubq_f64(*a1, a2);
  float64x2_t v7 = vsubq_f64(a1[3], a5);
  float64x2_t v8 = vsubq_f64(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v8;
  a1[3] = v7;
  return result;
}

double static simd_double2x3.* infix(_:_:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, a1);
  return result;
}

double static simd_double2x3.* infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, a5);
  return result;
}

float64x2_t static simd_double2x3.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2)
{
  float64x2_t v2 = vmulq_f64(a2, a1[1]);
  float64x2_t v3 = vmulq_n_f64(*a1, a2.f64[0]);
  float64x2_t v4 = vmulq_f64(a2, a1[3]);
  float64x2_t result = vmulq_n_f64(a1[2], a2.f64[0]);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = result;
  a1[3] = v4;
  return result;
}

double static simd_double2x3.* infix(_:_:)( float64x2_t a1, double a2, float64x2_t a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a5.f64[0]), a3, a5, 1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a5.f64[0]), a3, a5, 1);
  return result;
}

double static simd_double2x3.* infix(_:_:)( float64x2_t a1, double a2, int64x2_t a3, float64x2_t a4, int64x2_t a5, float64_t a6)
{
  a4.f64[1] = a6;
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64( vmlaq_laneq_f64( vmulq_n_f64((float64x2_t)vzip1q_s64(a3, a5), a1.f64[0]),  (float64x2_t)vzip2q_s64(a3, a5),  a1,  1),  a4,  a2);
  return result;
}

float64x2_t static simd_double2x3.* infix(_:_:)@<Q0>( float64x2_t *a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>, float64x2_t a8@<Q6>)
{
  *a1 = vmlaq_laneq_f64(vmulq_n_f64(a2, a6.f64[0]), a4, a6, 1);
  a1[1] = vmlaq_laneq_f64(vmulq_f64(a3, a6), a5, a6, 1);
  a1[2] = vmlaq_laneq_f64(vmulq_n_f64(a2, a7.f64[0]), a4, a7, 1);
  a1[3] = vmlaq_laneq_f64(vmulq_f64(a3, a7), a5, a7, 1);
  float64x2_t result = vmlaq_laneq_f64(vmulq_n_f64(a2, a8.f64[0]), a4, a8, 1);
  a1[4] = result;
  a1[5] = vmlaq_laneq_f64(vmulq_f64(a3, a8), a5, a8, 1);
  return result;
}

float64x2_t static simd_double2x3.* infix(_:_:)@<Q0>( float64x2_t *a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>, float64x2_t a8@<Q6>, float64x2_t a9@<Q7>)
{
  *a1 = vmlaq_laneq_f64(vmulq_n_f64(a2, a6.f64[0]), a4, a6, 1);
  a1[1] = vmlaq_laneq_f64(vmulq_f64(a3, a6), a5, a6, 1);
  a1[2] = vmlaq_laneq_f64(vmulq_n_f64(a2, a7.f64[0]), a4, a7, 1);
  a1[3] = vmlaq_laneq_f64(vmulq_f64(a3, a7), a5, a7, 1);
  a1[4] = vmlaq_laneq_f64(vmulq_n_f64(a2, a8.f64[0]), a4, a8, 1);
  a1[5] = vmlaq_laneq_f64(vmulq_f64(a3, a8), a5, a8, 1);
  float64x2_t result = vmlaq_laneq_f64(vmulq_n_f64(a2, a9.f64[0]), a4, a9, 1);
  a1[6] = result;
  a1[7] = vmlaq_laneq_f64(vmulq_f64(a3, a9), a5, a9, 1);
  return result;
}

float64x2_t static simd_double2x3.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = a1[1];
  float64x2_t v4 = a1[2];
  float64x2_t v5 = a1[3];
  float64x2_t v6 = vmlaq_laneq_f64(vmulq_f64(v3, a2), v5, a2, 1);
  float64x2_t v7 = vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), v4, a2, 1);
  float64x2_t v8 = vmulq_n_f64(*a1, a3.f64[0]);
  *a1 = v7;
  a1[1] = v6;
  float64x2_t result = vmlaq_laneq_f64(v8, v4, a3, 1);
  a1[2] = result;
  a1[3] = vmlaq_laneq_f64(vmulq_f64(v3, a3), v5, a3, 1);
  return result;
}

double matrix_from_rows(_:_:_:)(int64x2_t a1, int64x2_t a2)
{
  *(void *)&double result = vzip1q_s64(a1, a2).u64[0];
  return result;
}

  ;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double2x3 *a1, simd_double2x3 *a2)
{
  int64x2_t v10 = (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(v4, v8), (int8x16_t)vceqq_f64(v2, v6));
  return vandq_s8( (int8x16_t)vdupq_laneq_s64(v10, 1),  vandq_s8( (int8x16_t)vshlq_n_s64( (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(v5, v9), (int8x16_t)vceqq_f64(v3, v7)),  0x3FuLL),  (int8x16_t)v10)).u64[0] >> 63;
}

void __swiftcall simd_double3x3.init(_:)(simd_double3x3 *__return_ptr retstr, Swift::Double a2)
{
  *(void *)&__int128 v2 = 0LL;
  *((Swift::Double *)&v2 + 1) = a2;
  *(_OWORD *)retstr->columns[0].f64 = *(unint64_t *)&a2;
  *(_OWORD *)&retstr->columns[0].f64[2] = 0u;
  *(_OWORD *)retstr->columns[1].f64 = v2;
  *(_OWORD *)&retstr->columns[1].f64[2] = 0u;
  *(_OWORD *)retstr->columns[2].f64 = 0u;
  *(_OWORD *)&retstr->columns[2].f64[2] = *(unint64_t *)&a2;
}

void simd_double3x3.init(diagonal:)(_OWORD *a1@<X8>, __n128 a2@<Q0>, unint64_t a3@<D1>)
{
  *(void *)&__int128 v3 = 0LL;
  *((void *)&v3 + 1) = a2.n128_u64[1];
  *a1 = a2.n128_u64[0];
  a1[1] = 0u;
  a1[2] = v3;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = a3;
}

void __swiftcall simd_double3x3.init(rows:)(simd_double3x3 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 3LL)
  {
    int64x2_t v8 = *((int64x2_t *)rows._rawValue + 3);
    int64x2_t v5 = *((int64x2_t *)rows._rawValue + 2);
    int64x2_t v6 = *((int64x2_t *)rows._rawValue + 5);
    int64x2_t v4 = *((int64x2_t *)rows._rawValue + 4);
    __int128 v7 = *((_OWORD *)rows._rawValue + 7);
    int64x2_t v3 = *((int64x2_t *)rows._rawValue + 6);
    swift_bridgeObjectRelease();
    *(int64x2_t *)retstr->columns[0].f64 = vzip1q_s64(v5, v4);
    *(int64x2_t *)&retstr->columns[0].f64[2] = v3;
    *(int64x2_t *)retstr->columns[1].f64 = vzip2q_s64(v5, v4);
    *(int64x2_t *)&retstr->columns[1].f64[2] = vdupq_laneq_s64(v3, 1);
    *(int64x2_t *)retstr->columns[2].f64 = vzip1q_s64(v8, v6);
    *(_OWORD *)&retstr->columns[2].f64[2] = v7;
  }

  else
  {
    __break(1u);
  }

int64x2_t simd_double3x3.transpose.getter@<Q0>(uint64_t a1@<X8>)
{
  int64x2_t v2 = *(int64x2_t *)(v1 + 32);
  int64x2_t v4 = *(int64x2_t *)(v1 + 64);
  __int128 v3 = *(_OWORD *)(v1 + 80);
  int64x2_t v5 = vzip2q_s64(*(int64x2_t *)v1, v2);
  int64x2_t result = vzip1q_s64(*(int64x2_t *)(v1 + 16), *(int64x2_t *)(v1 + 48));
  *(int64x2_t *)a1 = vzip1q_s64(*(int64x2_t *)v1, v2);
  *(int64x2_t *)(a1 + 16) = v4;
  *(int64x2_t *)(a1 + 32) = v5;
  *(int64x2_t *)(a1 + 48) = vdupq_laneq_s64(v4, 1);
  *(int64x2_t *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v3;
  return result;
}

void __swiftcall simd_double3x3.init(_:)(simd_double3x3 *__return_ptr retstr, simd_double3x3 *a2)
{
  __int128 v2 = *(_OWORD *)&a2->columns[1].f64[2];
  *(_OWORD *)retstr->columns[1].f64 = *(_OWORD *)a2->columns[1].f64;
  *(_OWORD *)&retstr->columns[1].f64[2] = v2;
  __int128 v3 = *(_OWORD *)&a2->columns[2].f64[2];
  *(_OWORD *)retstr->columns[2].f64 = *(_OWORD *)a2->columns[2].f64;
  *(_OWORD *)&retstr->columns[2].f64[2] = v3;
  __int128 v4 = *(_OWORD *)&a2->columns[0].f64[2];
  *(_OWORD *)retstr->columns[0].f64 = *(_OWORD *)a2->columns[0].f64;
  *(_OWORD *)&retstr->columns[0].f64[2] = v4;
}

__n128 simd_double3x3.cmatrix.getter@<Q0>(_OWORD *a1@<X8>)
{
  __int128 v2 = *(_OWORD *)(v1 + 48);
  a1[2] = *(_OWORD *)(v1 + 32);
  a1[3] = v2;
  __int128 v3 = *(_OWORD *)(v1 + 80);
  a1[4] = *(_OWORD *)(v1 + 64);
  a1[5] = v3;
  __n128 result = *(__n128 *)v1;
  __int128 v5 = *(_OWORD *)(v1 + 16);
  *a1 = *(_OWORD *)v1;
  a1[1] = v5;
  return result;
}

uint64_t (*simd_double3x3.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  __n128 result = (uint64_t (*)())malloc(0x30uLL);
  int64x2_t v6 = result;
  *a1 = result;
  *((void *)result + 4) = a2;
  *((void *)result + 5) = v2;
  switch(a2)
  {
    case 0LL:
      __int128 v8 = *v2;
      __int128 v7 = v2[1];
      __n128 result = (uint64_t (*)())simd_double3x3.subscript.modify;
LABEL_8:
      *(_OWORD *)int64x2_t v6 = v8;
      *((_OWORD *)v6 + 1) = v7;
      return result;
    case 1LL:
      __int128 v8 = v2[2];
      __int128 v7 = v2[3];
LABEL_7:
      __n128 result = simd_double3x3.subscript.modify;
      goto LABEL_8;
    case 2LL:
      __int128 v8 = v2[4];
      __int128 v7 = v2[5];
      goto LABEL_7;
  }

  __break(1u);
  return result;
}

void simd_double3x3.subscript.modify(void **a1)
{
  uint64_t v1 = *a1;
  __int128 v2 = (_OWORD *)v1[5];
  __int128 v3 = *((_OWORD *)v1 + 1);
  *__int128 v2 = *(_OWORD *)v1;
  v2[1] = v3;
  free(v1);
}

unint64_t simd_double3x3.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 2)
  {
    if (a2 <= 2) {
      return result;
    }
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t key path getter for simd_double3x3.subscript(_:_:) : simd_double3x3@<X0>( uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 1)
  {
    result += 32LL;
  }

  else if (v3)
  {
    if (v3 != 2) {
      goto LABEL_9;
    }
    result += 64LL;
  }

  if ((unint64_t)a2[1] <= 2)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 3));
    return result;
  }

  __break(1u);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double3x3.subscript(_:_:) : simd_double3x3( uint64_t *result, __int128 *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  uint64_t v5 = *result;
  if (!*a3)
  {
    if (v4 <= 2)
    {
      __int128 v8 = a2[1];
      __int128 v11 = *a2;
      __int128 v12 = v8;
      *((void *)&v11 + (v4 & 3)) = v5;
      __int128 v9 = v12;
      *a2 = v11;
      a2[1] = v9;
      return result;
    }

    goto LABEL_12;
  }

  if (v3 == 1)
  {
    __int128 v7 = a2[2];
    __int128 v6 = a2[3];
  }

  else
  {
    if (v3 != 2)
    {
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
    }

    __int128 v7 = a2[4];
    __int128 v6 = a2[5];
  }

  if (v4 > 2)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  __int128 v13 = v7;
  __int128 v14 = v6;
  *((void *)&v13 + (v4 & 3)) = v5;
  __int128 v10 = v14;
  if (v3 == 1)
  {
    a2[2] = v13;
    a2[3] = v10;
  }

  else
  {
    a2[4] = v13;
    a2[5] = v10;
  }

  return result;
}

uint64_t simd_double3x3.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  switch(result)
  {
    case 0LL:
      if (a2 <= 2)
      {
        __int128 v6 = v3[1];
        __int128 v9 = *v3;
        __int128 v10 = v6;
        *((double *)&v9 + (a2 & 3)) = a3;
        __int128 v7 = v10;
        *uint64_t v3 = v9;
        v3[1] = v7;
        return result;
      }

      goto LABEL_12;
    case 1LL:
      __int128 v5 = v3[2];
      __int128 v4 = v3[3];
      break;
    case 2LL:
      __int128 v5 = v3[4];
      __int128 v4 = v3[5];
      break;
    default:
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
  }

  if (a2 > 2)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  __int128 v11 = v5;
  __int128 v12 = v4;
  *((double *)&v11 + (a2 & 3)) = a3;
  __int128 v8 = v12;
  if (result == 1)
  {
    v3[2] = v11;
    v3[3] = v8;
  }

  else
  {
    v3[4] = v11;
    v3[5] = v8;
  }

  return result;
}

uint64_t (*simd_double3x3.subscript.modify( uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  switch(a2)
  {
    case 0LL:
      __int128 v5 = *v3;
      __int128 v4 = v3[1];
      if (a3 <= 2) {
        goto LABEL_6;
      }
LABEL_9:
      __break(1u);
      break;
    case 1LL:
      __int128 v5 = v3[2];
      __int128 v4 = v3[3];
      if (a3 > 2) {
        goto LABEL_9;
      }
LABEL_6:
      v6[0] = v5;
      v6[1] = v4;
      *(void *)__n128 result = *((void *)v6 + (a3 & 3));
      return simd_double3x3.subscript.modify;
    case 2LL:
      __int128 v5 = v3[4];
      __int128 v4 = v3[5];
      if (a3 <= 2) {
        goto LABEL_6;
      }
      goto LABEL_9;
  }

  __break(1u);
  return result;
}

unint64_t simd_double3x3.debugDescription.getter()
{
  return simd_double3x3.debugDescription.getter( 0x8000000186F1F810LL,  (uint64_t (*)(__n128, __n128))specialized SIMD3._descriptionAsArray.getter);
}

unint64_t static simd_double3x3.== infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)),  (int8x16_t)vceqq_f64(a1[4], a2[4]));
  return vandq_s8( (int8x16_t)vdupq_laneq_s64(v2, 1),  vandq_s8( (int8x16_t)vshlq_n_s64( (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])),  (int8x16_t)vceqq_f64(a1[5], a2[5])),  0x3FuLL),  (int8x16_t)v2)).u64[0] >> 63;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double3x3( _OWORD *a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_double3x3( a1,  a2,  a3,  a4,  (uint64_t (*)(_OWORD *, _OWORD *))simd_equal);
}

double simd_double3x3.inverse.getter@<D0>(_OWORD *a1@<X8>)
{
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  return result;
}

float64_t simd_double3x3.determinant.getter()
{
  float64x2_t v2 = v0[2];
  float64x2_t v1 = v0[3];
  float64x2_t v3 = v0[4];
  float64x2_t v4 = v0[5];
  float64x2_t v5 = (float64x2_t)vextq_s8((int8x16_t)v2, (int8x16_t)v1, 8uLL);
  v1.f64[1] = v0[2].f64[0];
  float64x2_t v6 = (float64x2_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL);
  v4.f64[1] = v0[4].f64[0];
  return vmulq_f64( v0[1],  vmlaq_laneq_f64(vmulq_f64(v3, vnegq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v2, 1))), v2, v3, 1)).f64[0] + vaddvq_f64(vmulq_f64(*v0, vmlaq_f64(vmulq_f64(v6, vnegq_f64(v1)), v4, v5)));
}

float64x2_t static simd_double3x3.+ infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vaddq_f64(a2[1], a1[1]);
  float64x2_t v4 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v5 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v6 = vaddq_f64(a2[4], a1[4]);
  float64x2_t v7 = vaddq_f64(a2[5], a1[5]);
  *a3 = vaddq_f64(*a2, *a1);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  return result;
}

float64x2_t static simd_double3x3.- prefix(_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>)
{
  float64x2_t result = vsubq_f64((float64x2_t)0, a1[1]);
  float64x2_t v3 = vsubq_f64((float64x2_t)0, a1[2]);
  float64x2_t v4 = vsubq_f64((float64x2_t)0, a1[3]);
  float64x2_t v5 = vsubq_f64((float64x2_t)0, a1[4]);
  float64x2_t v6 = vsubq_f64((float64x2_t)0, a1[5]);
  *a2 = vsubq_f64((float64x2_t)0, *a1);
  a2[1] = result;
  a2[2] = v3;
  a2[3] = v4;
  a2[4] = v5;
  a2[5] = v6;
  return result;
}

float64x2_t static simd_double3x3.- infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vsubq_f64(a1[1], a2[1]);
  float64x2_t v4 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v5 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v6 = vsubq_f64(a1[4], a2[4]);
  float64x2_t v7 = vsubq_f64(a1[5], a2[5]);
  *a3 = vsubq_f64(*a1, *a2);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  return result;
}

float64x2_t static simd_double3x3.+= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vaddq_f64(a2[1], a1[1]);
  float64x2_t result = vaddq_f64(*a2, *a1);
  float64x2_t v4 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v5 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v6 = vaddq_f64(a2[5], a1[5]);
  float64x2_t v7 = vaddq_f64(a2[4], a1[4]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  return result;
}

float64x2_t static simd_double3x3.-= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vsubq_f64(a1[1], a2[1]);
  float64x2_t result = vsubq_f64(*a1, *a2);
  float64x2_t v4 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v5 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v6 = vsubq_f64(a1[5], a2[5]);
  float64x2_t v7 = vsubq_f64(a1[4], a2[4]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  return result;
}

float64x2_t static simd_double3x3.* infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X8>, float64x2_t a3@<Q0>)
{
  float64x2_t v3 = vmulq_n_f64(*a1, a3.f64[0]);
  float64x2_t v4 = vmulq_f64(a3, a1[1]);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3.f64[0]);
  float64x2_t v6 = vmulq_f64(a3, a1[3]);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3.f64[0]);
  float64x2_t result = vmulq_f64(a3, a1[5]);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = result;
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t result;
  float64x2_t v3 = vmulq_n_f64(*a1, a3.f64[0]);
  float64x2_t v4 = vmulq_f64(a3, a1[1]);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3.f64[0]);
  float64x2_t v6 = vmulq_f64(a3, a1[3]);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3.f64[0]);
  float64x2_t result = vmulq_f64(a3, a1[5]);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = result;
  return result;
}

float64x2_t static simd_double3x3.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2)
{
  float64x2_t v2 = vmulq_f64(a2, a1[1]);
  float64x2_t v3 = vmulq_n_f64(*a1, a2.f64[0]);
  float64x2_t v4 = vmulq_f64(a2, a1[3]);
  float64x2_t v5 = vmulq_n_f64(a1[2], a2.f64[0]);
  float64x2_t v6 = vmulq_f64(a2, a1[5]);
  float64x2_t result = vmulq_n_f64(a1[4], a2.f64[0]);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = result;
  a1[5] = v6;
  return result;
}

double static simd_double3x3.* infix(_:_:)(float64x2_t *a1, float64x2_t a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1), a1[4], a3);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1), a1[4], a3);
  return result;
}

double static simd_double3x3.* infix(_:_:)(int64x2_t *a1, float64x2_t a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64( vmlaq_laneq_f64( vmulq_n_f64((float64x2_t)vzip1q_s64(*a1, a1[2]), a2.f64[0]),  (float64x2_t)vzip2q_s64(*a1, a1[2]),  a2,  1),  (float64x2_t)vzip1q_s64(a1[1], a1[3]),  a3);
  return result;
}

float64x2_t static simd_double3x3.* infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v3 = a2[1];
  float64x2_t v5 = a2[2];
  float64x2_t v4 = a2[3];
  float64x2_t v7 = a2[4];
  float64x2_t v6 = a2[5];
  float64x2_t v8 = a1[1];
  float64x2_t v9 = a1[2];
  float64x2_t v10 = a1[3];
  float64x2_t v12 = a1[4];
  float64x2_t v11 = a1[5];
  float64x2_t v13 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v9, *a2, 1), v12, v3.f64[0]);
  float64x2_t v14 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, *a2), v10, *a2, 1), v3, v11);
  float64x2_t result = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v9, v5, 1), v12, v4.f64[0]);
  float64x2_t v16 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, v5), v10, v5, 1), v4, v11);
  float64x2_t v17 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v9, v7, 1), v12, v6.f64[0]);
  *a3 = v13;
  a3[1] = v14;
  a3[2] = result;
  a3[3] = v16;
  a3[4] = v17;
  a3[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, v7), v10, v7, 1), v6, v11);
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t result;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v3 = a2[1];
  float64x2_t v5 = a2[2];
  float64x2_t v4 = a2[3];
  float64x2_t v7 = a2[4];
  float64x2_t v6 = a2[5];
  float64x2_t v9 = a2[6];
  float64x2_t v8 = a2[7];
  float64x2_t v10 = a1[1];
  float64x2_t v11 = a1[2];
  float64x2_t v12 = a1[3];
  float64x2_t v14 = a1[4];
  float64x2_t v13 = a1[5];
  Swift::String v15 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v11, *a2, 1), v14, v3.f64[0]);
  float64x2_t v16 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, *a2), v12, *a2, 1), v3, v13);
  float64x2_t result = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v11, v5, 1), v14, v4.f64[0]);
  Swift::String v18 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v5), v12, v5, 1), v4, v13);
  Swift::String v19 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v11, v7, 1), v14, v6.f64[0]);
  uint64_t v20 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v7), v12, v7, 1), v6, v13);
  uint64_t v21 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v9.f64[0]), v11, v9, 1), v14, v8.f64[0]);
  *a3 = v15;
  a3[1] = v16;
  a3[2] = result;
  a3[3] = v18;
  a3[4] = v19;
  a3[5] = v20;
  a3[6] = v21;
  a3[7] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v9), v12, v9, 1), v8, v13);
  return result;
}

float64x2_t static simd_double3x3.*= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = a2[1];
  float64x2_t v4 = a2[2];
  float64x2_t v3 = a2[3];
  float64x2_t v6 = a2[4];
  float64x2_t v5 = a2[5];
  float64x2_t v7 = a1[1];
  float64x2_t v9 = a1[2];
  float64x2_t v8 = a1[3];
  float64x2_t v10 = a1[4];
  float64x2_t v11 = a1[5];
  float64x2_t v12 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v7, *a2), v8, *a2, 1), v2, v11);
  float64x2_t v13 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v9, *a2, 1), v10, v2.f64[0]);
  float64x2_t result = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v7, v4), v8, v4, 1), v3, v11);
  float64x2_t v15 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v4.f64[0]), v9, v4, 1), v10, v3.f64[0]);
  float64x2_t v16 = vmlaq_laneq_f64(vmulq_n_f64(*a1, v6.f64[0]), v9, v6, 1);
  *a1 = v13;
  a1[1] = v12;
  a1[2] = v15;
  a1[3] = result;
  a1[4] = vmlaq_n_f64(v16, v10, v5.f64[0]);
  a1[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v7, v6), v8, v6, 1), v5, v11);
  return result;
}

void matrix_from_diagonal(_:)(_OWORD *a1@<X8>, __n128 a2@<Q0>, unint64_t a3@<D1>)
{
  *(void *)&__int128 v3 = 0LL;
  *((void *)&v3 + 1) = a2.n128_u64[1];
  *a1 = a2.n128_u64[0];
  a1[1] = 0u;
  a1[2] = v3;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = a3;
}

void __swiftcall matrix_invert(_:)(simd_double3x3 *__return_ptr retstr, simd_double3x3 *a2)
{
  *retstr = v3;
}

Swift::Double __swiftcall matrix_determinant(_:)(simd_double3x3 *a1)
{
  float64x2_t v2 = *(float64x2_t *)a1->columns[1].f64;
  float64x2_t v1 = *(float64x2_t *)&a1->columns[1].f64[2];
  float64x2_t v3 = *(float64x2_t *)a1->columns[2].f64;
  float64x2_t v4 = *(float64x2_t *)&a1->columns[2].f64[2];
  float64x2_t v5 = (float64x2_t)vextq_s8((int8x16_t)v2, (int8x16_t)v1, 8uLL);
  v1.f64[1] = a1->columns[1].f64[0];
  float64x2_t v6 = (float64x2_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL);
  v4.f64[1] = a1->columns[2].f64[0];
  return vmulq_f64( *(float64x2_t *)&a1->columns[0].f64[2],  vmlaq_laneq_f64(vmulq_f64(v3, vnegq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v2, 1))), v2, v3, 1)).f64[0] + vaddvq_f64(vmulq_f64(*(float64x2_t *)a1->columns[0].f64, vmlaq_f64(vmulq_f64(v6, vnegq_f64(v1)), v4, v5)));
}

int64x2_t matrix_from_rows(_:_:_:)@<Q0>( uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>, int64x2_t a4@<Q2>, int64x2_t a5@<Q3>, int64x2_t a6@<Q4>, __n128 a7@<Q5>)
{
  *(int64x2_t *)a1 = vzip1q_s64(a2, a4);
  *(int64x2_t *)(a1 + 16) = a6;
  *(int64x2_t *)(a1 + 32) = vzip2q_s64(a2, a4);
  *(int64x2_t *)(a1 + 48) = vdupq_laneq_s64(a6, 1);
  int64x2_t result = vzip1q_s64(a3, a5);
  *(int64x2_t *)(a1 + 64) = result;
  *(__n128 *)(a1 + 80) = a7;
  return result;
}

void __swiftcall matrix_transpose(_:)(simd_double3x3 *__return_ptr retstr, simd_double3x3 *a2)
{
  int64x2_t v2 = *(int64x2_t *)a2->columns[1].f64;
  int64x2_t v4 = *(int64x2_t *)a2->columns[2].f64;
  __int128 v3 = *(_OWORD *)&a2->columns[2].f64[2];
  int64x2_t v5 = vzip2q_s64(*(int64x2_t *)a2->columns[0].f64, v2);
  int64x2_t v6 = vzip1q_s64(*(int64x2_t *)&a2->columns[0].f64[2], *(int64x2_t *)&a2->columns[1].f64[2]);
  *(int64x2_t *)retstr->columns[0].f64 = vzip1q_s64(*(int64x2_t *)a2->columns[0].f64, v2);
  *(int64x2_t *)&retstr->columns[0].f64[2] = v4;
  *(int64x2_t *)retstr->columns[1].f64 = v5;
  *(int64x2_t *)&retstr->columns[1].f64[2] = vdupq_laneq_s64(v4, 1);
  *(int64x2_t *)retstr->columns[2].f64 = v6;
  *(_OWORD *)&retstr->columns[2].f64[2] = v3;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double3x3 *a1, simd_double3x3 *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8( (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[1].f64, *(float64x2_t *)a2->columns[1].f64),  (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[0].f64, *(float64x2_t *)a2->columns[0].f64)),  (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[2].f64, *(float64x2_t *)a2->columns[2].f64));
  return vandq_s8( (int8x16_t)vdupq_laneq_s64(v2, 1),  vandq_s8( (int8x16_t)vshlq_n_s64( (int64x2_t)vandq_s8( vandq_s8( (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[1].f64[2],  *(float64x2_t *)&a2->columns[1].f64[2]),  (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[0].f64[2],  *(float64x2_t *)&a2->columns[0].f64[2])),  (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[2].f64[2],  *(float64x2_t *)&a2->columns[2].f64[2])),  0x3FuLL),  (int8x16_t)v2)).u64[0] >> 63;
}

void __swiftcall simd_double4x3.init(_:)(simd_double4x3 *__return_ptr retstr, Swift::Double a2)
{
  *(void *)&__int128 v2 = 0LL;
  *((Swift::Double *)&v2 + 1) = a2;
  *(_OWORD *)retstr->columns[0].f64 = *(unint64_t *)&a2;
  *(_OWORD *)&retstr->columns[0].f64[2] = 0u;
  *(_OWORD *)retstr->columns[1].f64 = v2;
  *(_OWORD *)&retstr->columns[1].f64[2] = 0u;
  *(_OWORD *)retstr->columns[2].f64 = 0u;
  *(_OWORD *)&retstr->columns[2].f64[2] = *(unint64_t *)&a2;
  *(_OWORD *)retstr->columns[3].f64 = 0u;
  *(_OWORD *)&retstr->columns[3].f64[2] = 0u;
}

void simd_double4x3.init(diagonal:)(_OWORD *a1@<X8>, __n128 a2@<Q0>, unint64_t a3@<D1>)
{
  *(void *)&__int128 v3 = 0LL;
  *((void *)&v3 + 1) = a2.n128_u64[1];
  *a1 = a2.n128_u64[0];
  a1[1] = 0u;
  a1[2] = v3;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = a3;
  a1[6] = 0u;
  a1[7] = 0u;
}

void __swiftcall simd_double4x3.init(rows:)(simd_double4x3 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 3LL)
  {
    __int128 v3 = (const double *)((char *)rows._rawValue + 32);
    int64x2_t v4 = *((int64x2_t *)rows._rawValue + 6);
    int64x2_t v5 = *((int64x2_t *)rows._rawValue + 7);
    float64x2x4_t v7 = vld4q_f64(v3);
    float64x2x4_t v6 = v7;
    swift_bridgeObjectRelease();
    *(float64x2_t *)retstr->columns[0].f64 = v6.val[0];
    *(int64x2_t *)&retstr->columns[0].f64[2] = v4;
    *(float64x2_t *)retstr->columns[1].f64 = v6.val[1];
    *(int64x2_t *)&retstr->columns[1].f64[2] = vdupq_laneq_s64(v4, 1);
    *(float64x2_t *)retstr->columns[2].f64 = v6.val[2];
    *(int64x2_t *)&retstr->columns[2].f64[2] = v5;
    *(float64x2_t *)retstr->columns[3].f64 = v6.val[3];
    *(int64x2_t *)&retstr->columns[3].f64[2] = vdupq_laneq_s64(v5, 1);
  }

  else
  {
    __break(1u);
  }

uint64_t simd_double3x3.init(_:)@<X0>(uint64_t result@<X0>, _OWORD *a2@<X8>)
{
  if (*(void *)(result + 16) == 3LL)
  {
    __int128 v8 = *(_OWORD *)(result + 32);
    __int128 v5 = *(_OWORD *)(result + 48);
    __int128 v7 = *(_OWORD *)(result + 64);
    __int128 v6 = *(_OWORD *)(result + 96);
    __int128 v3 = *(_OWORD *)(result + 112);
    __int128 v4 = *(_OWORD *)(result + 80);
    int64x2_t result = swift_bridgeObjectRelease();
    *a2 = v8;
    a2[1] = v5;
    a2[2] = v7;
    a2[3] = v4;
    a2[4] = v6;
    a2[5] = v3;
  }

  else
  {
    __break(1u);
  }

  return result;
}

int64x2_t simd_double3x4.transpose.getter@<Q0>(int64x2_t *a1@<X8>)
{
  int64x2_t v2 = v1[1];
  int64x2_t v4 = v1[2];
  int64x2_t v3 = v1[3];
  int64x2_t v6 = v1[4];
  int64x2_t v5 = v1[5];
  int64x2_t v7 = vzip1q_s64(*v1, v4);
  int64x2_t v8 = vzip2q_s64(*v1, v4);
  int64x2_t v9 = vzip1q_s64(v2, v3);
  int64x2_t result = vzip2q_s64(v2, v3);
  *a1 = v7;
  a1[1] = v6;
  a1[2] = v8;
  a1[3] = vdupq_laneq_s64(v6, 1);
  a1[4] = v9;
  a1[5] = v5;
  a1[6] = result;
  a1[7] = vdupq_laneq_s64(v5, 1);
  return result;
}

void __swiftcall simd_double4x3.init(_:)(simd_double4x3 *__return_ptr retstr, simd_double4x3 *a2)
{
  __int128 v2 = *(_OWORD *)&a2->columns[2].f64[2];
  *(_OWORD *)retstr->columns[2].f64 = *(_OWORD *)a2->columns[2].f64;
  *(_OWORD *)&retstr->columns[2].f64[2] = v2;
  __int128 v3 = *(_OWORD *)&a2->columns[3].f64[2];
  *(_OWORD *)retstr->columns[3].f64 = *(_OWORD *)a2->columns[3].f64;
  *(_OWORD *)&retstr->columns[3].f64[2] = v3;
  __int128 v4 = *(_OWORD *)&a2->columns[0].f64[2];
  *(_OWORD *)retstr->columns[0].f64 = *(_OWORD *)a2->columns[0].f64;
  *(_OWORD *)&retstr->columns[0].f64[2] = v4;
  __int128 v5 = *(_OWORD *)&a2->columns[1].f64[2];
  *(_OWORD *)retstr->columns[1].f64 = *(_OWORD *)a2->columns[1].f64;
  *(_OWORD *)&retstr->columns[1].f64[2] = v5;
}

__n128 simd_double4x3.cmatrix.getter@<Q0>(uint64_t a1@<X8>)
{
  __int128 v2 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 80) = v2;
  __int128 v3 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(a1 + 112) = v3;
  __int128 v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v4;
  __n128 result = *(__n128 *)(v1 + 32);
  __int128 v6 = *(_OWORD *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v6;
  return result;
}

uint64_t (*simd_double4x3.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  __n128 result = (uint64_t (*)())malloc(0x30uLL);
  __int128 v6 = result;
  *a1 = result;
  *((void *)result + 4) = a2;
  *((void *)result + 5) = v2;
  switch(a2)
  {
    case 0LL:
      __int128 v8 = *v2;
      __int128 v7 = v2[1];
      __n128 result = simd_double4x3.subscript.modify;
LABEL_10:
      *(_OWORD *)__int128 v6 = v8;
      *((_OWORD *)v6 + 1) = v7;
      return result;
    case 1LL:
      __int128 v8 = v2[2];
      __int128 v7 = v2[3];
      goto LABEL_9;
    case 2LL:
      __int128 v8 = v2[4];
      __int128 v7 = v2[5];
LABEL_9:
      __n128 result = simd_double4x3.subscript.modify;
      goto LABEL_10;
    case 3LL:
      __int128 v8 = v2[6];
      __int128 v7 = v2[7];
      goto LABEL_9;
  }

  __break(1u);
  return result;
}

double simd_double4x3.subscript.getter(uint64_t a1, unint64_t a2)
{
  switch(a1)
  {
    case 0LL:
      goto LABEL_5;
    case 1LL:
      v2 += 32LL;
      goto LABEL_5;
    case 2LL:
      v2 += 64LL;
      goto LABEL_5;
    case 3LL:
      v2 += 96LL;
LABEL_5:
      if (a2 > 2)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x186F0EB14LL);
      }

      return *(double *)(v2 + 8 * (a2 & 3));
    default:
      goto LABEL_8;
  }

uint64_t key path getter for simd_double4x3.subscript(_:_:) : simd_double4x3@<X0>( uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 2)
  {
    result += 64LL;
  }

  else if (v3 == 1)
  {
    result += 32LL;
  }

  else if (v3)
  {
    if (v3 != 3) {
      goto LABEL_11;
    }
    result += 96LL;
  }

  if ((unint64_t)a2[1] <= 2)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 3));
    return result;
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double4x3.subscript(_:_:) : simd_double4x3( uint64_t *result, __int128 *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  uint64_t v5 = *result;
  if (!*a3)
  {
    if (v4 <= 2)
    {
      __int128 v8 = a2[1];
      __int128 v11 = *a2;
      __int128 v12 = v8;
      *((void *)&v11 + (v4 & 3)) = v5;
      __int128 v9 = v12;
      *a2 = v11;
      a2[1] = v9;
      return result;
    }

    goto LABEL_16;
  }

  switch(v3)
  {
    case 1LL:
      __int128 v7 = a2[2];
      __int128 v6 = a2[3];
      break;
    case 2LL:
      __int128 v7 = a2[4];
      __int128 v6 = a2[5];
      break;
    case 3LL:
      __int128 v7 = a2[6];
      __int128 v6 = a2[7];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }

  if (v4 > 2)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  __int128 v13 = v7;
  __int128 v14 = v6;
  *((void *)&v13 + (v4 & 3)) = v5;
  __int128 v10 = v14;
  if (v3 == 1)
  {
    a2[2] = v13;
    a2[3] = v10;
  }

  else if (v3 == 2)
  {
    a2[4] = v13;
    a2[5] = v10;
  }

  else
  {
    a2[6] = v13;
    a2[7] = v10;
  }

  return result;
}

uint64_t simd_double4x3.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  switch(result)
  {
    case 0LL:
      if (a2 <= 2)
      {
        __int128 v6 = v3[1];
        __int128 v9 = *v3;
        __int128 v10 = v6;
        *((double *)&v9 + (a2 & 3)) = a3;
        __int128 v7 = v10;
        *uint64_t v3 = v9;
        v3[1] = v7;
        return result;
      }

      goto LABEL_16;
    case 1LL:
      __int128 v5 = v3[2];
      __int128 v4 = v3[3];
      break;
    case 2LL:
      __int128 v5 = v3[4];
      __int128 v4 = v3[5];
      break;
    case 3LL:
      __int128 v5 = v3[6];
      __int128 v4 = v3[7];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }

  if (a2 > 2)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  __int128 v11 = v5;
  __int128 v12 = v4;
  *((double *)&v11 + (a2 & 3)) = a3;
  __int128 v8 = v12;
  if (result == 1)
  {
    v3[2] = v11;
    v3[3] = v8;
  }

  else if (result == 2)
  {
    v3[4] = v11;
    v3[5] = v8;
  }

  else
  {
    v3[6] = v11;
    v3[7] = v8;
  }

  return result;
}

uint64_t (*simd_double4x3.subscript.modify( uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  if (a2)
  {
    switch(a2)
    {
      case 1LL:
        __int128 v5 = v3[2];
        __int128 v4 = v3[3];
        break;
      case 2LL:
        __int128 v5 = v3[4];
        __int128 v4 = v3[5];
        break;
      case 3LL:
        __int128 v5 = v3[6];
        __int128 v4 = v3[7];
        break;
      default:
        goto LABEL_12;
    }
  }

  else
  {
    __int128 v5 = *v3;
    __int128 v4 = v3[1];
  }

  if (a3 <= 2)
  {
    v6[0] = v5;
    v6[1] = v4;
    *(void *)__n128 result = *((void *)v6 + (a3 & 3));
    return simd_double4x3.subscript.modify;
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t simd_double4x3.debugDescription.getter()
{
  return simd_double4x3.debugDescription.getter( 0x8000000186F1F830LL,  (uint64_t (*)(__n128, __n128))specialized SIMD3._descriptionAsArray.getter);
}

unint64_t static simd_double4x3.== infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)),  vandq_s8((int8x16_t)vceqq_f64(a1[4], a2[4]), (int8x16_t)vceqq_f64(a1[6], a2[6])));
  return vandq_s8( (int8x16_t)vdupq_laneq_s64(v2, 1),  vandq_s8( (int8x16_t)vshlq_n_s64( (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])),  vandq_s8((int8x16_t)vceqq_f64(a1[5], a2[5]), (int8x16_t)vceqq_f64(a1[7], a2[7]))),  0x3FuLL),  (int8x16_t)v2)).u64[0] >> 63;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double4x3( _OWORD *a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_double4x3( a1,  a2,  a3,  a4,  (uint64_t (*)(_OWORD *, _OWORD *))simd_equal);
}

int64x2_t simd_double4x3.transpose.getter@<Q0>(int64x2_t *a1@<X8>)
{
  int64x2_t v2 = v1[2];
  int64x2_t v3 = v1[4];
  int64x2_t v4 = v1[6];
  int64x2_t v5 = vzip2q_s64(*v1, v2);
  int64x2_t result = vzip1q_s64(v1[1], v1[3]);
  int64x2_t v7 = vzip1q_s64(v1[5], v1[7]);
  *a1 = vzip1q_s64(*v1, v2);
  a1[1] = vzip1q_s64(v3, v4);
  a1[2] = v5;
  a1[3] = vzip2q_s64(v3, v4);
  a1[4] = result;
  a1[5] = v7;
  return result;
}

float64x2_t static simd_double4x3.+ infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vaddq_f64(a2[1], a1[1]);
  float64x2_t v4 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v5 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v6 = vaddq_f64(a2[4], a1[4]);
  float64x2_t v7 = vaddq_f64(a2[5], a1[5]);
  float64x2_t v8 = vaddq_f64(a2[6], a1[6]);
  float64x2_t v9 = vaddq_f64(a2[7], a1[7]);
  *a3 = vaddq_f64(*a2, *a1);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  a3[6] = v8;
  a3[7] = v9;
  return result;
}

float64x2_t static simd_double4x3.- prefix(_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>)
{
  float64x2_t result = vsubq_f64((float64x2_t)0, a1[1]);
  float64x2_t v3 = vsubq_f64((float64x2_t)0, a1[2]);
  float64x2_t v4 = vsubq_f64((float64x2_t)0, a1[3]);
  float64x2_t v5 = vsubq_f64((float64x2_t)0, a1[4]);
  float64x2_t v6 = vsubq_f64((float64x2_t)0, a1[5]);
  float64x2_t v7 = vsubq_f64((float64x2_t)0, a1[6]);
  float64x2_t v8 = vsubq_f64((float64x2_t)0, a1[7]);
  *a2 = vsubq_f64((float64x2_t)0, *a1);
  a2[1] = result;
  a2[2] = v3;
  a2[3] = v4;
  a2[4] = v5;
  a2[5] = v6;
  a2[6] = v7;
  a2[7] = v8;
  return result;
}

float64x2_t static simd_double4x3.- infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vsubq_f64(a1[1], a2[1]);
  float64x2_t v4 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v5 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v6 = vsubq_f64(a1[4], a2[4]);
  float64x2_t v7 = vsubq_f64(a1[5], a2[5]);
  float64x2_t v8 = vsubq_f64(a1[6], a2[6]);
  float64x2_t v9 = vsubq_f64(a1[7], a2[7]);
  *a3 = vsubq_f64(*a1, *a2);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  a3[6] = v8;
  a3[7] = v9;
  return result;
}

float64x2_t static simd_double4x3.+= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vaddq_f64(a2[1], a1[1]);
  float64x2_t result = vaddq_f64(*a2, *a1);
  float64x2_t v4 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v5 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v6 = vaddq_f64(a2[5], a1[5]);
  float64x2_t v7 = vaddq_f64(a2[4], a1[4]);
  float64x2_t v8 = vaddq_f64(a2[7], a1[7]);
  float64x2_t v9 = vaddq_f64(a2[6], a1[6]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  a1[6] = v9;
  a1[7] = v8;
  return result;
}

float64x2_t static simd_double4x3.-= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vsubq_f64(a1[1], a2[1]);
  float64x2_t result = vsubq_f64(*a1, *a2);
  float64x2_t v4 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v5 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v6 = vsubq_f64(a1[5], a2[5]);
  float64x2_t v7 = vsubq_f64(a1[4], a2[4]);
  float64x2_t v8 = vsubq_f64(a1[7], a2[7]);
  float64x2_t v9 = vsubq_f64(a1[6], a2[6]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  a1[6] = v9;
  a1[7] = v8;
  return result;
}

float64x2_t static simd_double4x3.* infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X8>, float64x2_t a3@<Q0>)
{
  float64x2_t v3 = vmulq_n_f64(*a1, a3.f64[0]);
  float64x2_t v4 = vmulq_f64(a3, a1[1]);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3.f64[0]);
  float64x2_t v6 = vmulq_f64(a3, a1[3]);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3.f64[0]);
  float64x2_t v8 = vmulq_f64(a3, a1[5]);
  float64x2_t v9 = vmulq_n_f64(a1[6], a3.f64[0]);
  float64x2_t result = vmulq_f64(a3, a1[7]);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = v8;
  a2[6] = v9;
  a2[7] = result;
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t result;
  float64x2_t v3 = vmulq_n_f64(*a1, a3.f64[0]);
  float64x2_t v4 = vmulq_f64(a3, a1[1]);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3.f64[0]);
  float64x2_t v6 = vmulq_f64(a3, a1[3]);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3.f64[0]);
  float64x2_t v8 = vmulq_f64(a3, a1[5]);
  float64x2_t v9 = vmulq_n_f64(a1[6], a3.f64[0]);
  float64x2_t result = vmulq_f64(a3, a1[7]);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = v8;
  a2[6] = v9;
  a2[7] = result;
  return result;
}

float64x2_t static simd_double4x3.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2)
{
  float64x2_t v2 = vmulq_f64(a2, a1[1]);
  float64x2_t v3 = vmulq_n_f64(*a1, a2.f64[0]);
  float64x2_t v4 = vmulq_f64(a2, a1[3]);
  float64x2_t v5 = vmulq_n_f64(a1[2], a2.f64[0]);
  float64x2_t v6 = vmulq_f64(a2, a1[5]);
  float64x2_t v7 = vmulq_n_f64(a1[4], a2.f64[0]);
  float64x2_t v8 = vmulq_f64(a2, a1[7]);
  float64x2_t result = vmulq_n_f64(a1[6], a2.f64[0]);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  a1[6] = result;
  a1[7] = v8;
  return result;
}

double static simd_double4x3.* infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmlaq_n_f64( vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1),  a1[4],  a3.f64[0]),  a1[6],  a3,  1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmlaq_n_f64( vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1),  a1[4],  a3.f64[0]),  a1[6],  a3,  1);
  return result;
}

double static simd_double4x3.* infix(_:_:)(int64x2_t *a1, float64x2_t a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64( vmlaq_laneq_f64( vmulq_n_f64((float64x2_t)vzip1q_s64(*a1, a1[2]), a2.f64[0]),  (float64x2_t)vzip2q_s64(*a1, a1[2]),  a2,  1),  (float64x2_t)vzip1q_s64(a1[1], a1[3]),  a3);
  return result;
}

float64x2_t static simd_double4x3.* infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v3 = a2[1];
  float64x2_t v5 = a2[2];
  float64x2_t v4 = a2[3];
  float64x2_t v7 = a2[4];
  float64x2_t v6 = a2[5];
  float64x2_t v8 = a1[1];
  float64x2_t v10 = a1[2];
  float64x2_t v9 = a1[3];
  float64x2_t v11 = a1[4];
  float64x2_t v12 = a1[5];
  float64x2_t v14 = a1[6];
  float64x2_t v13 = a1[7];
  float64x2_t v15 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v10, *a2, 1), v11, v3.f64[0]),  v14,  v3,  1);
  float64x2_t v16 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, *a2), v9, *a2, 1), v3, v12), v13, v3, 1);
  float64x2_t v17 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v10, v5, 1), v11, v4.f64[0]),  v14,  v4,  1);
  float64x2_t result = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, v5), v9, v5, 1), v4, v12), v13, v4, 1);
  float64x2_t v19 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v10, v7, 1), v11, v6.f64[0]),  v14,  v6,  1);
  *a3 = v15;
  a3[1] = v16;
  a3[2] = v17;
  a3[3] = result;
  a3[4] = v19;
  a3[5] = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, v7), v9, v7, 1), v6, v12), v13, v6, 1);
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t result;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v3 = a2[1];
  float64x2_t v5 = a2[2];
  float64x2_t v4 = a2[3];
  float64x2_t v7 = a2[4];
  float64x2_t v6 = a2[5];
  float64x2_t v9 = a2[6];
  float64x2_t result = a2[7];
  float64x2_t v10 = a1[1];
  float64x2_t v12 = a1[2];
  float64x2_t v11 = a1[3];
  float64x2_t v13 = a1[4];
  float64x2_t v14 = a1[5];
  float64x2_t v16 = a1[6];
  float64x2_t v15 = a1[7];
  float64x2_t v17 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v12, *a2, 1), v13, v3.f64[0]),  v16,  v3,  1);
  Swift::String v18 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, *a2), v11, *a2, 1), v3, v14), v15, v3, 1);
  float64x2_t v19 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v12, v5, 1), v13, v4.f64[0]),  v16,  v4,  1);
  uint64_t v20 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v5), v11, v5, 1), v4, v14), v15, v4, 1);
  uint64_t v21 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v12, v7, 1), v13, v6.f64[0]),  v16,  v6,  1);
  v22 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v7), v11, v7, 1), v6, v14), v15, v6, 1);
  uint64_t v23 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v9.f64[0]), v12, v9, 1), v13, result.f64[0]),  v16,  result,  1);
  *a3 = v17;
  a3[1] = v18;
  a3[2] = v19;
  a3[3] = v20;
  a3[4] = v21;
  a3[5] = v22;
  a3[6] = v23;
  a3[7] = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v9), v11, v9, 1), result, v14), v15, result, 1);
  return result;
}

float64x2_t static simd_double4x3.*= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = a2[1];
  float64x2_t v4 = a2[2];
  float64x2_t v3 = a2[3];
  float64x2_t v6 = a2[4];
  float64x2_t v5 = a2[5];
  float64x2_t v8 = a2[6];
  float64x2_t result = a2[7];
  float64x2_t v9 = a1[1];
  float64x2_t v10 = a1[2];
  float64x2_t v11 = a1[3];
  float64x2_t v13 = a1[4];
  float64x2_t v12 = a1[5];
  float64x2_t v14 = a1[6];
  float64x2_t v15 = a1[7];
  float64x2_t v16 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v9, *a2), v11, *a2, 1), v2, v12), v15, v2, 1);
  float64x2_t v17 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v10, *a2, 1), v13, v2.f64[0]),  v14,  v2,  1);
  float64x2_t v18 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v9, v4), v11, v4, 1), v3, v12), v15, v3, 1);
  float64x2_t v19 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v4.f64[0]), v10, v4, 1), v13, v3.f64[0]),  v14,  v3,  1);
  float64x2_t v20 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v9, v6), v11, v6, 1), v5, v12), v15, v5, 1);
  float64x2_t v21 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v6.f64[0]), v10, v6, 1), v13, v5.f64[0]),  v14,  v5,  1);
  float64x2_t v22 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v8.f64[0]), v10, v8, 1), v13, result.f64[0]);
  *a1 = v17;
  a1[1] = v16;
  a1[2] = v19;
  a1[3] = v18;
  a1[4] = v21;
  a1[5] = v20;
  a1[6] = vmlaq_laneq_f64(v22, v14, result, 1);
  a1[7] = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v9, v8), v11, v8, 1), result, v12), v15, result, 1);
  return result;
}

int64x2_t matrix_from_rows(_:_:_:)@<Q0>( int64x2_t *a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>, int64x2_t a4@<Q2>, int64x2_t a5@<Q3>, int64x2_t a6@<Q4>, int64x2_t a7@<Q5>)
{
  *a1 = vzip1q_s64(a2, a4);
  a1[1] = a6;
  a1[2] = vzip2q_s64(a2, a4);
  a1[3] = vdupq_laneq_s64(a6, 1);
  int64x2_t result = vzip2q_s64(a3, a5);
  a1[4] = vzip1q_s64(a3, a5);
  a1[5] = a7;
  a1[6] = result;
  a1[7] = vdupq_laneq_s64(a7, 1);
  return result;
}

void simd_double3x3.init(_:_:_:)( __n128 *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>, __n128 a6@<Q4>, __n128 a7@<Q5>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  a1[4] = a6;
  a1[5] = a7;
}

void __swiftcall matrix_transpose(_:)(simd_double3x4 *__return_ptr retstr, simd_double4x3 *a2)
{
  int64x2_t v2 = *(int64x2_t *)a2->columns[1].f64;
  int64x2_t v3 = *(int64x2_t *)a2->columns[2].f64;
  int64x2_t v4 = *(int64x2_t *)a2->columns[3].f64;
  int64x2_t v5 = vzip2q_s64(*(int64x2_t *)a2->columns[0].f64, v2);
  int64x2_t v6 = vzip1q_s64(*(int64x2_t *)&a2->columns[0].f64[2], *(int64x2_t *)&a2->columns[1].f64[2]);
  int64x2_t v7 = vzip1q_s64(*(int64x2_t *)&a2->columns[2].f64[2], *(int64x2_t *)&a2->columns[3].f64[2]);
  *(int64x2_t *)retstr->columns[0].f64 = vzip1q_s64(*(int64x2_t *)a2->columns[0].f64, v2);
  *(int64x2_t *)&retstr->columns[0].f64[2] = vzip1q_s64(v3, v4);
  *(int64x2_t *)retstr->columns[1].f64 = v5;
  *(int64x2_t *)&retstr->columns[1].f64[2] = vzip2q_s64(v3, v4);
  *(int64x2_t *)retstr->columns[2].f64 = v6;
  *(int64x2_t *)&retstr->columns[2].f64[2] = v7;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double4x3 *a1, simd_double4x3 *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8( (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[1].f64, *(float64x2_t *)a2->columns[1].f64),  (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[0].f64, *(float64x2_t *)a2->columns[0].f64)),  vandq_s8( (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[2].f64, *(float64x2_t *)a2->columns[2].f64),  (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[3].f64, *(float64x2_t *)a2->columns[3].f64)));
  return vandq_s8( (int8x16_t)vdupq_laneq_s64(v2, 1),  vandq_s8( (int8x16_t)vshlq_n_s64( (int64x2_t)vandq_s8( vandq_s8( (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[1].f64[2],  *(float64x2_t *)&a2->columns[1].f64[2]),  (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[0].f64[2],  *(float64x2_t *)&a2->columns[0].f64[2])),  vandq_s8( (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[2].f64[2],  *(float64x2_t *)&a2->columns[2].f64[2]),  (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[3].f64[2],  *(float64x2_t *)&a2->columns[3].f64[2]))),  0x3FuLL),  (int8x16_t)v2)).u64[0] >> 63;
}

  ;
}

  ;
}

void __swiftcall simd_double2x4.init(rows:)(simd_double2x4 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 4LL)
  {
    int64x2_t v2 = (const double *)((char *)rows._rawValue + 32);
    vld2q_f64(v2);
    int64x2_t v3 = (const double *)((char *)rows._rawValue + 64);
    vld2q_f64(v3);
    swift_bridgeObjectRelease();
  }

  else
  {
    __break(1u);
  }

unint64_t simd_double2x4.subscript.getter(unint64_t result)
{
  if (result > 1) {
    __break(1u);
  }
  return result;
}

uint64_t simd_double2x3.subscript.setter(uint64_t result, __n128 a2, __n128 a3)
{
  if (!result) {
    goto LABEL_4;
  }
  if (result == 1)
  {
    v3 += 2;
LABEL_4:
    *int64x2_t v3 = a2;
    v3[1] = a3;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t (*simd_double2x4.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  int64x2_t result = (uint64_t (*)())malloc(0x28uLL);
  int64x2_t v6 = result;
  *a1 = result;
  *((void *)result + 4) = v2;
  if (!a2)
  {
    int64x2_t result = simd_double2x4.subscript.modify;
LABEL_5:
    __int128 v7 = v2[1];
    *(_OWORD *)int64x2_t v6 = *v2;
    *((_OWORD *)v6 + 1) = v7;
    return result;
  }

  if (a2 == 1)
  {
    v2 += 2;
    int64x2_t result = simd_double2x4.subscript.modify;
    goto LABEL_5;
  }

  __break(1u);
  return result;
}

unint64_t simd_double2x4.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 1)
  {
    if (a2 <= 3) {
      return result;
    }
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double2x4.subscript(_:_:) : simd_double2x4( uint64_t *result, uint64_t a2, void *a3)
{
  unint64_t v3 = a3[1];
  uint64_t v4 = *result;
  if (!*a3)
  {
    if (v3 <= 3)
    {
      *(void *)(a2 + 8LL * v3) = v4;
      return result;
    }

uint64_t simd_double2x4.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  if (!result)
  {
    if (a2 > 3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (result == 1)
  {
    if (a2 > 3)
    {
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }

    v3 += 32LL;
LABEL_7:
    *(double *)(v3 + 8LL * a2) = a3;
    return result;
  }

uint64_t (*simd_double2x4.subscript.modify( uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_7;
    }
    v3 += 32LL;
  }

  if (a3 <= 3)
  {
    *(void *)int64x2_t result = *(void *)(v3 + 8 * (a3 & 3));
    return simd_double2x3.subscript.modify;
  }

  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

double simd_double2x3.subscript.modify(uint64_t a1)
{
  double result = *(double *)a1;
  *(void *)(*(void *)(a1 + 24) + 32LL * (*(void *)(a1 + 8) != 0LL) + 8LL * *(unsigned int *)(a1 + 16)) = *(void *)a1;
  return result;
}

unint64_t simd_double2x4.debugDescription.getter()
{
  v0._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236LL;
  v1._object = (void *)0xE200000000000000LL;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 10589LL;
  v3._object = (void *)0xE200000000000000LL;
  String.append(_:)(v3);
  return 0xD000000000000010LL;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_double2x4()
{
  return simd_double2x4.debugDescription.getter();
}

unint64_t static simd_double2x4.== infix(_:_:)( float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, float64x2_t a6, float64x2_t a7, float64x2_t a8)
{
  int64x2_t v8 = (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a3, a7), (int8x16_t)vceqq_f64(a1, a5)),  vandq_s8((int8x16_t)vceqq_f64(a4, a8), (int8x16_t)vceqq_f64(a2, a6)));
  return vandq_s8((int8x16_t)v8, (int8x16_t)vdupq_laneq_s64(v8, 1)).u64[0] >> 63;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double2x4( _OWORD *a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_double2x3( a1,  a2,  a3,  a4,  (uint64_t (*)(_OWORD *, _OWORD *))simd_equal);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double2x3( _OWORD *a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_OWORD *, _OWORD *))
{
  __int128 v5 = a1[1];
  __int128 v6 = a1[2];
  __int128 v7 = a1[3];
  __int128 v8 = *a2;
  __int128 v9 = a2[1];
  __int128 v10 = a2[2];
  __int128 v11 = a2[3];
  v14[0] = *a1;
  v14[1] = v5;
  v14[2] = v6;
  v14[3] = v7;
  v13[0] = v8;
  v13[1] = v9;
  v13[2] = v10;
  v13[3] = v11;
  return a5(v14, v13);
}

double static simd_double2x4.+ infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(a1, a5);
  return result;
}

double static simd_double2x4.- prefix(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64((float64x2_t)0, a1);
  return result;
}

double static simd_double2x4.- infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(a1, a5);
  return result;
}

float64x2_t static simd_double2x4.+= infix(_:_:)( float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  float64x2_t v5 = vaddq_f64(a3, a1[1]);
  float64x2_t result = vaddq_f64(a2, *a1);
  float64x2_t v7 = vaddq_f64(a5, a1[3]);
  float64x2_t v8 = vaddq_f64(a4, a1[2]);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v8;
  a1[3] = v7;
  return result;
}

float64x2_t static simd_double2x4.-= infix(_:_:)( float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  float64x2_t v5 = vsubq_f64(a1[1], a3);
  float64x2_t result = vsubq_f64(*a1, a2);
  float64x2_t v7 = vsubq_f64(a1[3], a5);
  float64x2_t v8 = vsubq_f64(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v8;
  a1[3] = v7;
  return result;
}

double static simd_double2x4.* infix(_:_:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, a1);
  return result;
}

double static simd_double2x4.* infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, a5);
  return result;
}

float64x2_t static simd_double2x4.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(a1[1], a2);
  float64x2_t v3 = vmulq_n_f64(*a1, a2);
  float64x2_t v4 = vmulq_n_f64(a1[3], a2);
  float64x2_t result = vmulq_n_f64(a1[2], a2);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = result;
  a1[3] = v4;
  return result;
}

double static simd_double2x4.* infix(_:_:)( float64x2_t a1, double a2, float64x2_t a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a5.f64[0]), a3, a5, 1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a5.f64[0]), a3, a5, 1);
  return result;
}

double static simd_double2x4.* infix(_:_:)( float64x2_t a1, float64x2_t a2, int64x2_t a3, int64x2_t a4, int64x2_t a5, int64x2_t a6)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmlaq_n_f64( vmlaq_laneq_f64( vmulq_n_f64((float64x2_t)vzip1q_s64(a3, a5), a1.f64[0]),  (float64x2_t)vzip2q_s64(a3, a5),  a1,  1),  (float64x2_t)vzip1q_s64(a4, a6),  a2.f64[0]),  (float64x2_t)vzip2q_s64(a4, a6),  a2,  1);
  return result;
}

float64x2_t static simd_double2x4.* infix(_:_:)@<Q0>( float64x2_t *a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>, float64x2_t a8@<Q6>)
{
  float64x2_t v8 = vmlaq_laneq_f64(vmulq_n_f64(a2, a6.f64[0]), a4, a6, 1);
  float64x2_t v9 = vmlaq_laneq_f64(vmulq_n_f64(a2, a7.f64[0]), a4, a7, 1);
  float64x2_t result = vmlaq_laneq_f64(vmulq_n_f64(a2, a8.f64[0]), a4, a8, 1);
  *a1 = v8;
  a1[1] = vmlaq_laneq_f64(vmulq_n_f64(a3, a6.f64[0]), a5, a6, 1);
  a1[2] = v9;
  a1[3] = vmlaq_laneq_f64(vmulq_n_f64(a3, a7.f64[0]), a5, a7, 1);
  a1[4] = result;
  a1[5] = vmlaq_laneq_f64(vmulq_n_f64(a3, a8.f64[0]), a5, a8, 1);
  return result;
}

float64x2_t static simd_double2x4.* infix(_:_:)@<Q0>( float64x2_t *a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>, float64x2_t a8@<Q6>, float64x2_t a9@<Q7>)
{
  float64x2_t v9 = vmlaq_laneq_f64(vmulq_n_f64(a2, a6.f64[0]), a4, a6, 1);
  float64x2_t v10 = vmlaq_laneq_f64(vmulq_n_f64(a2, a7.f64[0]), a4, a7, 1);
  float64x2_t v11 = vmlaq_laneq_f64(vmulq_n_f64(a2, a8.f64[0]), a4, a8, 1);
  float64x2_t result = vmlaq_laneq_f64(vmulq_n_f64(a2, a9.f64[0]), a4, a9, 1);
  *a1 = v9;
  a1[1] = vmlaq_laneq_f64(vmulq_n_f64(a3, a6.f64[0]), a5, a6, 1);
  a1[2] = v10;
  a1[3] = vmlaq_laneq_f64(vmulq_n_f64(a3, a7.f64[0]), a5, a7, 1);
  a1[4] = v11;
  a1[5] = vmlaq_laneq_f64(vmulq_n_f64(a3, a8.f64[0]), a5, a8, 1);
  a1[6] = result;
  a1[7] = vmlaq_laneq_f64(vmulq_n_f64(a3, a9.f64[0]), a5, a9, 1);
  return result;
}

float64x2_t static simd_double2x4.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = a1[1];
  float64x2_t v4 = a1[2];
  float64x2_t v5 = a1[3];
  float64x2_t v6 = vmlaq_laneq_f64(vmulq_n_f64(v3, a2.f64[0]), v5, a2, 1);
  float64x2_t v7 = vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), v4, a2, 1);
  float64x2_t v8 = vmulq_n_f64(*a1, a3.f64[0]);
  *a1 = v7;
  a1[1] = v6;
  float64x2_t result = vmlaq_laneq_f64(v8, v4, a3, 1);
  a1[2] = result;
  a1[3] = vmlaq_laneq_f64(vmulq_n_f64(v3, a3.f64[0]), v5, a3, 1);
  return result;
}

double matrix_transpose(_:)(int64x2_t a1, int64x2_t a2)
{
  *(void *)&double result = vzip1q_s64(a1, a2).u64[0];
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double2x4 *a1, simd_double2x4 *a2)
{
  int64x2_t v10 = (int64x2_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f64(v4, v8), (int8x16_t)vceqq_f64(v2, v6)),  vandq_s8((int8x16_t)vceqq_f64(v5, v9), (int8x16_t)vceqq_f64(v3, v7)));
  return vandq_s8((int8x16_t)v10, (int8x16_t)vdupq_laneq_s64(v10, 1)).u64[0] >> 63;
}

void __swiftcall simd_double3x4.init(rows:)(simd_double3x4 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 4LL)
  {
    int64x2_t v9 = *((int64x2_t *)rows._rawValue + 3);
    int64x2_t v6 = *((int64x2_t *)rows._rawValue + 2);
    int64x2_t v7 = *((int64x2_t *)rows._rawValue + 5);
    int64x2_t v4 = *((int64x2_t *)rows._rawValue + 4);
    int64x2_t v10 = *((int64x2_t *)rows._rawValue + 7);
    int64x2_t v5 = *((int64x2_t *)rows._rawValue + 6);
    int64x2_t v8 = *((int64x2_t *)rows._rawValue + 9);
    int64x2_t v3 = *((int64x2_t *)rows._rawValue + 8);
    swift_bridgeObjectRelease();
    *(int64x2_t *)retstr->columns[0].f64 = vzip1q_s64(v6, v4);
    *(int64x2_t *)&retstr->columns[0].f64[2] = vzip1q_s64(v5, v3);
    *(int64x2_t *)retstr->columns[1].f64 = vzip2q_s64(v6, v4);
    *(int64x2_t *)&retstr->columns[1].f64[2] = vzip2q_s64(v5, v3);
    *(int64x2_t *)retstr->columns[2].f64 = vzip1q_s64(v9, v7);
    *(int64x2_t *)&retstr->columns[2].f64[2] = vzip1q_s64(v10, v8);
  }

  else
  {
    __break(1u);
  }

void __swiftcall simd_double3x4.init(_:)(simd_double3x4 *__return_ptr retstr, simd_double3x4 *a2)
{
  __int128 v2 = *(_OWORD *)&a2->columns[1].f64[2];
  *(_OWORD *)retstr->columns[1].f64 = *(_OWORD *)a2->columns[1].f64;
  *(_OWORD *)&retstr->columns[1].f64[2] = v2;
  __int128 v3 = *(_OWORD *)&a2->columns[2].f64[2];
  *(_OWORD *)retstr->columns[2].f64 = *(_OWORD *)a2->columns[2].f64;
  *(_OWORD *)&retstr->columns[2].f64[2] = v3;
  __int128 v4 = *(_OWORD *)&a2->columns[0].f64[2];
  *(_OWORD *)retstr->columns[0].f64 = *(_OWORD *)a2->columns[0].f64;
  *(_OWORD *)&retstr->columns[0].f64[2] = v4;
}

__n128 simd_double3x4.cmatrix.getter@<Q0>(_OWORD *a1@<X8>)
{
  __int128 v2 = *(_OWORD *)(v1 + 48);
  a1[2] = *(_OWORD *)(v1 + 32);
  a1[3] = v2;
  __int128 v3 = *(_OWORD *)(v1 + 80);
  a1[4] = *(_OWORD *)(v1 + 64);
  a1[5] = v3;
  __n128 result = *(__n128 *)v1;
  __int128 v5 = *(_OWORD *)(v1 + 16);
  *a1 = *(_OWORD *)v1;
  a1[1] = v5;
  return result;
}

unint64_t simd_double3x3.subscript.getter(unint64_t result)
{
  if (result > 2) {
    __break(1u);
  }
  return result;
}

uint64_t simd_double3x3.subscript.setter(uint64_t result, __n128 a2, __n128 a3)
{
  switch(result)
  {
    case 0LL:
      goto LABEL_6;
    case 1LL:
      v3 += 2;
LABEL_6:
      *__int128 v3 = a2;
      v3[1] = a3;
      return result;
    case 2LL:
      v3 += 4;
      goto LABEL_6;
  }

  __break(1u);
  return result;
}

uint64_t (*simd_double3x4.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  __n128 result = (uint64_t (*)())malloc(0x30uLL);
  int64x2_t v6 = result;
  *a1 = result;
  *((void *)result + 4) = a2;
  *((void *)result + 5) = v2;
  switch(a2)
  {
    case 0LL:
      __int128 v8 = *v2;
      __int128 v7 = v2[1];
      __n128 result = simd_double4x3.subscript.modify;
LABEL_8:
      *(_OWORD *)int64x2_t v6 = v8;
      *((_OWORD *)v6 + 1) = v7;
      return result;
    case 1LL:
      __int128 v8 = v2[2];
      __int128 v7 = v2[3];
LABEL_7:
      __n128 result = simd_double3x3.subscript.modify;
      goto LABEL_8;
    case 2LL:
      __int128 v8 = v2[4];
      __int128 v7 = v2[5];
      goto LABEL_7;
  }

  __break(1u);
  return result;
}

void simd_double3x3.subscript.modify(void **a1, char a2)
{
  __int128 v2 = *a1;
  __int128 v4 = *(_OWORD *)v2;
  __int128 v3 = *((_OWORD *)v2 + 1);
  uint64_t v5 = v2[4];
  BOOL v6 = v5 == 1;
  if ((a2 & 1) != 0)
  {
    if (v5 == 1)
    {
LABEL_7:
      __int128 v7 = (_OWORD *)(v2[5] + 32LL);
      *__int128 v7 = v4;
      v7[1] = v3;
LABEL_8:
      free(v2);
      return;
    }

    BOOL v6 = v5 == 2;
    if (v5 == 2)
    {
LABEL_10:
      __int128 v8 = (_OWORD *)(v2[5] + 64LL);
      *__int128 v8 = v4;
      v8[1] = v3;
      goto LABEL_8;
    }

    __break(1u);
  }

  if (v6) {
    goto LABEL_7;
  }
  if (v5 == 2) {
    goto LABEL_10;
  }
  __break(1u);
}

unint64_t simd_double3x4.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 2)
  {
    if (a2 <= 3) {
      return result;
    }
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t key path getter for simd_double3x4.subscript(_:_:) : simd_double3x4@<X0>( uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 1)
  {
    result += 32LL;
  }

  else if (v3)
  {
    if (v3 != 2) {
      goto LABEL_9;
    }
    result += 64LL;
  }

  if ((unint64_t)a2[1] <= 3)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 3));
    return result;
  }

  __break(1u);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double3x4.subscript(_:_:) : simd_double3x4( uint64_t *result, __int128 *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  uint64_t v5 = *result;
  if (!*a3)
  {
    if (v4 <= 3)
    {
      __int128 v8 = a2[1];
      __int128 v11 = *a2;
      __int128 v12 = v8;
      *((void *)&v11 + (v4 & 3)) = v5;
      __int128 v9 = v12;
      *a2 = v11;
      a2[1] = v9;
      return result;
    }

    goto LABEL_12;
  }

  if (v3 == 1)
  {
    __int128 v7 = a2[2];
    __int128 v6 = a2[3];
  }

  else
  {
    if (v3 != 2)
    {
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
    }

    __int128 v7 = a2[4];
    __int128 v6 = a2[5];
  }

  if (v4 > 3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  __int128 v13 = v7;
  __int128 v14 = v6;
  *((void *)&v13 + (v4 & 3)) = v5;
  __int128 v10 = v14;
  if (v3 == 1)
  {
    a2[2] = v13;
    a2[3] = v10;
  }

  else
  {
    a2[4] = v13;
    a2[5] = v10;
  }

  return result;
}

uint64_t simd_double3x4.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  switch(result)
  {
    case 0LL:
      if (a2 <= 3)
      {
        __int128 v6 = v3[1];
        __int128 v9 = *v3;
        __int128 v10 = v6;
        *((double *)&v9 + (a2 & 3)) = a3;
        __int128 v7 = v10;
        *uint64_t v3 = v9;
        v3[1] = v7;
        return result;
      }

      goto LABEL_12;
    case 1LL:
      __int128 v5 = v3[2];
      __int128 v4 = v3[3];
      break;
    case 2LL:
      __int128 v5 = v3[4];
      __int128 v4 = v3[5];
      break;
    default:
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
  }

  if (a2 > 3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  __int128 v11 = v5;
  __int128 v12 = v4;
  *((double *)&v11 + (a2 & 3)) = a3;
  __int128 v8 = v12;
  if (result == 1)
  {
    v3[2] = v11;
    v3[3] = v8;
  }

  else
  {
    v3[4] = v11;
    v3[5] = v8;
  }

  return result;
}

uint64_t (*simd_double3x4.subscript.modify( uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  switch(a2)
  {
    case 0LL:
      __int128 v5 = *v3;
      __int128 v4 = v3[1];
      if (a3 <= 3) {
        goto LABEL_6;
      }
LABEL_9:
      __break(1u);
      break;
    case 1LL:
      __int128 v5 = v3[2];
      __int128 v4 = v3[3];
      if (a3 > 3) {
        goto LABEL_9;
      }
LABEL_6:
      v6[0] = v5;
      v6[1] = v4;
      *(void *)__n128 result = *((void *)v6 + (a3 & 3));
      return simd_double3x3.subscript.modify;
    case 2LL:
      __int128 v5 = v3[4];
      __int128 v4 = v3[5];
      if (a3 <= 3) {
        goto LABEL_6;
      }
      goto LABEL_9;
  }

  __break(1u);
  return result;
}

double simd_double3x3.subscript.modify( uint64_t a1, double a2, double a3, double a4, double a5, double a6, int64x2_t a7, int64x2_t a8)
{
  __int128 v8 = *(int8x16_t **)(a1 + 24);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    a7.i64[0] = *(void *)(a1 + 8);
    a8.i64[0] = 1LL;
    int8x16_t v11 = (int8x16_t)vdupq_lane_s64(vceqq_s64(a7, a8).i64[0], 0);
    int8x16_t v12 = vbslq_s8(v11, v8[3], v8[5]);
    int8x16_t v13 = vbslq_s8(v11, v8[2], v8[4]);
    if (v10 == 1) {
      v8 += 2;
    }
    else {
      v8 += 4;
    }
  }

  else
  {
    int8x16_t v13 = *v8;
    int8x16_t v12 = v8[1];
  }

  uint64_t v14 = *(_DWORD *)(a1 + 16) & 3;
  int8x16_t v17 = v13;
  int8x16_t v18 = v12;
  v17.i64[v14] = v9;
  double result = *(double *)v17.i64;
  int8x16_t v16 = v18;
  *__int128 v8 = v17;
  v8[1] = v16;
  return result;
}

unint64_t simd_double3x4.debugDescription.getter()
{
  return simd_double3x3.debugDescription.getter( 0x8000000186F1F870LL,  (uint64_t (*)(__n128, __n128))specialized SIMD4._descriptionAsArray.getter);
}

unint64_t simd_double3x3.debugDescription.getter( uint64_t a1, uint64_t (*a2)(__n128, __n128))
{
  uint64_t v4 = swift_bridgeObjectRelease();
  __n128 v12 = v2[2];
  __n128 v13 = v2[3];
  __n128 v14 = v2[4];
  __n128 v15 = v2[5];
  v5._countAndFlagsBits = ((uint64_t (*)(uint64_t, __n128, __n128))a2)(v4, *v2, v2[1]);
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 8236LL;
  v6._object = (void *)0xE200000000000000LL;
  String.append(_:)(v6);
  v7._countAndFlagsBits = a2(v12, v13);
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 8236LL;
  v8._object = (void *)0xE200000000000000LL;
  String.append(_:)(v8);
  v9._countAndFlagsBits = a2(v14, v15);
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 10589LL;
  v10._object = (void *)0xE200000000000000LL;
  String.append(_:)(v10);
  return 0xD000000000000010LL;
}

unint64_t static simd_double3x4.== infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)),  (int8x16_t)vceqq_f64(a1[4], a2[4])),  vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])),  (int8x16_t)vceqq_f64(a1[5], a2[5])));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double3x4( _OWORD *a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_double3x3( a1,  a2,  a3,  a4,  (uint64_t (*)(_OWORD *, _OWORD *))simd_equal);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double3x3( _OWORD *a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_OWORD *, _OWORD *))
{
  __int128 v5 = a1[1];
  __int128 v6 = a1[2];
  __int128 v7 = a1[3];
  __int128 v8 = a1[4];
  __int128 v9 = a1[5];
  __int128 v10 = *a2;
  __int128 v11 = a2[1];
  __int128 v12 = a2[2];
  __int128 v13 = a2[3];
  __int128 v14 = a2[4];
  __int128 v15 = a2[5];
  v18[0] = *a1;
  v18[1] = v5;
  v18[2] = v6;
  v18[3] = v7;
  v18[4] = v8;
  v18[5] = v9;
  v17[0] = v10;
  v17[1] = v11;
  v17[2] = v12;
  v17[3] = v13;
  v17[4] = v14;
  v17[5] = v15;
  return a5(v18, v17);
}

float64x2_t static simd_double3x4.+ infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vaddq_f64(a2[1], a1[1]);
  float64x2_t v4 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v5 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v6 = vaddq_f64(a2[4], a1[4]);
  float64x2_t v7 = vaddq_f64(a2[5], a1[5]);
  *a3 = vaddq_f64(*a2, *a1);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  return result;
}

float64x2_t static simd_double3x4.- prefix(_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>)
{
  float64x2_t result = vsubq_f64((float64x2_t)0, a1[1]);
  float64x2_t v3 = vsubq_f64((float64x2_t)0, a1[2]);
  float64x2_t v4 = vsubq_f64((float64x2_t)0, a1[3]);
  float64x2_t v5 = vsubq_f64((float64x2_t)0, a1[4]);
  float64x2_t v6 = vsubq_f64((float64x2_t)0, a1[5]);
  *a2 = vsubq_f64((float64x2_t)0, *a1);
  a2[1] = result;
  a2[2] = v3;
  a2[3] = v4;
  a2[4] = v5;
  a2[5] = v6;
  return result;
}

float64x2_t static simd_double3x4.- infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vsubq_f64(a1[1], a2[1]);
  float64x2_t v4 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v5 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v6 = vsubq_f64(a1[4], a2[4]);
  float64x2_t v7 = vsubq_f64(a1[5], a2[5]);
  *a3 = vsubq_f64(*a1, *a2);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  return result;
}

float64x2_t static simd_double3x4.+= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vaddq_f64(a2[1], a1[1]);
  float64x2_t result = vaddq_f64(*a2, *a1);
  float64x2_t v4 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v5 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v6 = vaddq_f64(a2[5], a1[5]);
  float64x2_t v7 = vaddq_f64(a2[4], a1[4]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  return result;
}

float64x2_t static simd_double3x4.-= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vsubq_f64(a1[1], a2[1]);
  float64x2_t result = vsubq_f64(*a1, *a2);
  float64x2_t v4 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v5 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v6 = vsubq_f64(a1[5], a2[5]);
  float64x2_t v7 = vsubq_f64(a1[4], a2[4]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  return result;
}

float64x2_t static simd_double3x4.* infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X8>, double a3@<D0>)
{
  float64x2_t v3 = vmulq_n_f64(*a1, a3);
  float64x2_t v4 = vmulq_n_f64(a1[1], a3);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3);
  float64x2_t v6 = vmulq_n_f64(a1[3], a3);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3);
  float64x2_t result = vmulq_n_f64(a1[5], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = result;
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t result;
  float64x2_t v3 = vmulq_n_f64(*a1, a3);
  float64x2_t v4 = vmulq_n_f64(a1[1], a3);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3);
  float64x2_t v6 = vmulq_n_f64(a1[3], a3);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3);
  float64x2_t result = vmulq_n_f64(a1[5], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = result;
  return result;
}

float64x2_t static simd_double3x4.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(a1[1], a2);
  float64x2_t v3 = vmulq_n_f64(*a1, a2);
  float64x2_t v4 = vmulq_n_f64(a1[3], a2);
  float64x2_t v5 = vmulq_n_f64(a1[2], a2);
  float64x2_t v6 = vmulq_n_f64(a1[5], a2);
  float64x2_t result = vmulq_n_f64(a1[4], a2);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = result;
  a1[5] = v6;
  return result;
}

double static simd_double3x4.* infix(_:_:)(float64x2_t *a1, float64x2_t a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1), a1[4], a3);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1), a1[4], a3);
  return result;
}

double static simd_double3x4.* infix(_:_:)(int64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmlaq_n_f64( vmlaq_laneq_f64( vmulq_n_f64((float64x2_t)vzip1q_s64(*a1, a1[2]), a2.f64[0]),  (float64x2_t)vzip2q_s64(*a1, a1[2]),  a2,  1),  (float64x2_t)vzip1q_s64(a1[1], a1[3]),  a3.f64[0]),  (float64x2_t)vzip2q_s64(a1[1], a1[3]),  a3,  1);
  return result;
}

float64x2_t static simd_double3x4.* infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, uint64_t a2@<X1>, float64x2_t *a3@<X8>)
{
  __int128 v3 = *(_OWORD *)(a2 + 16);
  float64x2_t v5 = *(float64x2_t *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  float64x2_t v7 = *(float64x2_t *)(a2 + 64);
  __int128 v6 = *(_OWORD *)(a2 + 80);
  float64x2_t v8 = a1[1];
  float64x2_t v9 = a1[2];
  float64x2_t v10 = a1[3];
  float64x2_t v12 = a1[4];
  float64x2_t v11 = a1[5];
  float64x2_t v13 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, *(double *)a2), v9, *(float64x2_t *)a2, 1), v12, *(double *)&v3);
  float64x2_t v14 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v8, *(double *)a2), v10, *(float64x2_t *)a2, 1), v11, *(double *)&v3);
  float64x2_t result = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v9, v5, 1), v12, *(double *)&v4);
  float64x2_t v16 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v8, v5.f64[0]), v10, v5, 1), v11, *(double *)&v4);
  float64x2_t v17 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v9, v7, 1), v12, *(double *)&v6);
  *a3 = v13;
  a3[1] = v14;
  a3[2] = result;
  a3[3] = v16;
  a3[4] = v17;
  a3[5] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v8, v7.f64[0]), v10, v7, 1), v11, *(double *)&v6);
  return result;
}

{
  __int128 v3;
  __int128 v4;
  float64x2_t v5;
  __int128 v6;
  float64x2_t v7;
  __int128 v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t result;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  float64x2_t v5 = *(float64x2_t *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  float64x2_t v7 = *(float64x2_t *)(a2 + 64);
  __int128 v6 = *(_OWORD *)(a2 + 80);
  float64x2_t v9 = *(float64x2_t *)(a2 + 96);
  float64x2_t v8 = *(_OWORD *)(a2 + 112);
  float64x2_t v10 = a1[1];
  float64x2_t v11 = a1[2];
  float64x2_t v12 = a1[3];
  float64x2_t v14 = a1[4];
  float64x2_t v13 = a1[5];
  __int128 v15 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, *(double *)a2), v11, *(float64x2_t *)a2, 1), v14, *(double *)&v3);
  float64x2_t v16 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, *(double *)a2), v12, *(float64x2_t *)a2, 1), v13, *(double *)&v3);
  float64x2_t result = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v11, v5, 1), v14, *(double *)&v4);
  int8x16_t v18 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v5.f64[0]), v12, v5, 1), v13, *(double *)&v4);
  float64x2_t v19 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v11, v7, 1), v14, *(double *)&v6);
  float64x2_t v20 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v7.f64[0]), v12, v7, 1), v13, *(double *)&v6);
  float64x2_t v21 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v9.f64[0]), v11, v9, 1), v14, *(double *)&v8);
  *a3 = v15;
  a3[1] = v16;
  a3[2] = result;
  a3[3] = v18;
  a3[4] = v19;
  a3[5] = v20;
  a3[6] = v21;
  a3[7] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v9.f64[0]), v12, v9, 1), v13, *(double *)&v8);
  return result;
}

float64x2_t static simd_double3x4.*= infix(_:_:)(float64x2_t *a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a2 + 16);
  float64x2_t v4 = *(float64x2_t *)(a2 + 32);
  __int128 v3 = *(_OWORD *)(a2 + 48);
  float64x2_t v6 = *(float64x2_t *)(a2 + 64);
  __int128 v5 = *(_OWORD *)(a2 + 80);
  float64x2_t v7 = a1[1];
  float64x2_t v9 = a1[2];
  float64x2_t v8 = a1[3];
  float64x2_t v10 = a1[4];
  float64x2_t v11 = a1[5];
  float64x2_t v12 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v7, *(double *)a2), v8, *(float64x2_t *)a2, 1), v11, *(double *)&v2);
  float64x2_t v13 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, *(double *)a2), v9, *(float64x2_t *)a2, 1), v10, *(double *)&v2);
  float64x2_t result = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v7, v4.f64[0]), v8, v4, 1), v11, *(double *)&v3);
  float64x2_t v15 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v4.f64[0]), v9, v4, 1), v10, *(double *)&v3);
  float64x2_t v16 = vmlaq_laneq_f64(vmulq_n_f64(*a1, v6.f64[0]), v9, v6, 1);
  *a1 = v13;
  a1[1] = v12;
  a1[2] = v15;
  a1[3] = result;
  a1[4] = vmlaq_n_f64(v16, v10, *(double *)&v5);
  a1[5] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v7, v6.f64[0]), v8, v6, 1), v11, *(double *)&v5);
  return result;
}

int64x2_t matrix_from_rows(_:_:_:_:)@<Q0>( int64x2_t *a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>, int64x2_t a4@<Q2>, int64x2_t a5@<Q3>, int64x2_t a6@<Q4>, int64x2_t a7@<Q5>, int64x2_t a8@<Q6>, int64x2_t a9@<Q7>)
{
  *a1 = vzip1q_s64(a2, a4);
  a1[1] = vzip1q_s64(a6, a8);
  a1[2] = vzip2q_s64(a2, a4);
  a1[3] = vzip2q_s64(a6, a8);
  int64x2_t result = vzip1q_s64(a7, a9);
  a1[4] = vzip1q_s64(a3, a5);
  a1[5] = result;
  return result;
}

{
  int64x2_t result;
  *a1 = vzip1q_s64(a2, a4);
  a1[1] = vzip1q_s64(a6, a8);
  a1[2] = vzip2q_s64(a2, a4);
  a1[3] = vzip2q_s64(a6, a8);
  a1[4] = vzip1q_s64(a3, a5);
  a1[5] = vzip1q_s64(a7, a9);
  int64x2_t result = vzip2q_s64(a7, a9);
  a1[6] = vzip2q_s64(a3, a5);
  a1[7] = result;
  return result;
}

void __swiftcall matrix_transpose(_:)(simd_double4x3 *__return_ptr retstr, simd_double3x4 *a2)
{
  int64x2_t v2 = *(int64x2_t *)&a2->columns[0].f64[2];
  int64x2_t v4 = *(int64x2_t *)a2->columns[1].f64;
  int64x2_t v3 = *(int64x2_t *)&a2->columns[1].f64[2];
  int64x2_t v6 = *(int64x2_t *)a2->columns[2].f64;
  int64x2_t v5 = *(int64x2_t *)&a2->columns[2].f64[2];
  int64x2_t v7 = vzip2q_s64(*(int64x2_t *)a2->columns[0].f64, v4);
  *(int64x2_t *)retstr->columns[0].f64 = vzip1q_s64(*(int64x2_t *)a2->columns[0].f64, v4);
  *(int64x2_t *)&retstr->columns[0].f64[2] = v6;
  *(int64x2_t *)retstr->columns[1].f64 = v7;
  *(int64x2_t *)&retstr->columns[1].f64[2] = vdupq_laneq_s64(v6, 1);
  *(int64x2_t *)retstr->columns[2].f64 = vzip1q_s64(v2, v3);
  *(int64x2_t *)&retstr->columns[2].f64[2] = v5;
  *(int64x2_t *)retstr->columns[3].f64 = vzip2q_s64(v2, v3);
  *(int64x2_t *)&retstr->columns[3].f64[2] = vdupq_laneq_s64(v5, 1);
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double3x4 *a1, simd_double3x4 *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8( vandq_s8( (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[1].f64, *(float64x2_t *)a2->columns[1].f64),  (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[0].f64, *(float64x2_t *)a2->columns[0].f64)),  (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[2].f64, *(float64x2_t *)a2->columns[2].f64)),  vandq_s8( vandq_s8( (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[1].f64[2],  *(float64x2_t *)&a2->columns[1].f64[2]),  (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[0].f64[2],  *(float64x2_t *)&a2->columns[0].f64[2])),  (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[2].f64[2],  *(float64x2_t *)&a2->columns[2].f64[2])));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

void __swiftcall simd_double4x4.init(_:)(simd_double4x4 *__return_ptr retstr, Swift::Double a2)
{
  *(void *)&__int128 v2 = 0LL;
  *((Swift::Double *)&v2 + 1) = a2;
  *(_OWORD *)retstr->columns[0].f64 = *(unint64_t *)&a2;
  *(_OWORD *)&retstr->columns[0].f64[2] = 0u;
  *(_OWORD *)retstr->columns[1].f64 = v2;
  *(_OWORD *)&retstr->columns[1].f64[2] = 0u;
  *(_OWORD *)retstr->columns[2].f64 = 0u;
  *(_OWORD *)&retstr->columns[2].f64[2] = *(unint64_t *)&a2;
  *(_OWORD *)retstr->columns[3].f64 = 0u;
  *(_OWORD *)&retstr->columns[3].f64[2] = v2;
}

void simd_double4x4.init(diagonal:)(_OWORD *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>)
{
  *(void *)&__int128 v3 = 0LL;
  *((void *)&v3 + 1) = a2.n128_u64[1];
  *(void *)&__int128 v4 = 0LL;
  *((void *)&v4 + 1) = a3.n128_u64[1];
  *a1 = a2.n128_u64[0];
  a1[1] = 0u;
  a1[2] = v3;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = a3.n128_u64[0];
  a1[6] = 0u;
  a1[7] = v4;
}

uint64_t simd_double4x3.init(_:)@<X0>(uint64_t result@<X0>, _OWORD *a2@<X8>)
{
  if (*(void *)(result + 16) == 4LL)
  {
    __int128 v10 = *(_OWORD *)(result + 32);
    __int128 v6 = *(_OWORD *)(result + 48);
    __int128 v9 = *(_OWORD *)(result + 64);
    __int128 v5 = *(_OWORD *)(result + 80);
    __int128 v8 = *(_OWORD *)(result + 96);
    __int128 v7 = *(_OWORD *)(result + 128);
    __int128 v3 = *(_OWORD *)(result + 144);
    __int128 v4 = *(_OWORD *)(result + 112);
    int64x2_t result = swift_bridgeObjectRelease();
    *a2 = v10;
    a2[1] = v6;
    a2[2] = v9;
    a2[3] = v5;
    a2[4] = v8;
    a2[5] = v4;
    a2[6] = v7;
    a2[7] = v3;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void __swiftcall simd_double4x4.init(rows:)(simd_double4x4 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 4LL)
  {
    __int128 v3 = (const double *)((char *)rows._rawValue + 32);
    float64x2x4_t v7 = vld4q_f64(v3);
    float64x2x4_t v6 = v7;
    __int128 v4 = (const double *)((char *)rows._rawValue + 96);
    float64x2x4_t v8 = vld4q_f64(v4);
    float64x2x4_t v5 = v8;
    swift_bridgeObjectRelease();
    *(float64x2_t *)retstr->columns[0].f64 = v6.val[0];
    *(float64x2_t *)&retstr->columns[0].f64[2] = v5.val[0];
    *(float64x2_t *)retstr->columns[1].f64 = v6.val[1];
    *(float64x2_t *)&retstr->columns[1].f64[2] = v5.val[1];
    *(float64x2_t *)retstr->columns[2].f64 = v6.val[2];
    *(float64x2_t *)&retstr->columns[2].f64[2] = v5.val[2];
    *(float64x2_t *)retstr->columns[3].f64 = v6.val[3];
    *(float64x2_t *)&retstr->columns[3].f64[2] = v5.val[3];
  }

  else
  {
    __break(1u);
  }

int64x2_t simd_double4x4.transpose.getter@<Q0>(uint64_t a1@<X8>)
{
  int64x2_t v2 = *(int64x2_t *)(v1 + 16);
  int64x2_t v4 = *(int64x2_t *)(v1 + 32);
  int64x2_t v3 = *(int64x2_t *)(v1 + 48);
  float64x2x4_t v5 = (const double *)(v1 + 64);
  float64x2x4_t v10 = vld4q_f64(v5);
  int64x2_t v6 = vzip1q_s64(*(int64x2_t *)v1, v4);
  int64x2_t v7 = vzip2q_s64(*(int64x2_t *)v1, v4);
  int64x2_t v8 = vzip1q_s64(v2, v3);
  int64x2_t result = vzip2q_s64(v2, v3);
  *(int64x2_t *)a1 = v6;
  *(float64x2_t *)(a1 + 16) = v10.val[0];
  *(int64x2_t *)(a1 + 32) = v7;
  *(float64x2_t *)(a1 + 48) = v10.val[1];
  *(int64x2_t *)(a1 + 64) = v8;
  *(float64x2_t *)(a1 + 80) = v10.val[2];
  *(int64x2_t *)(a1 + 96) = result;
  *(float64x2_t *)(a1 + 112) = v10.val[3];
  return result;
}

void simd_double4x3.init(_:_:_:_:)( __n128 *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>, __n128 a6@<Q4>, __n128 a7@<Q5>, __n128 a8@<Q6>, __n128 a9@<Q7>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  a1[4] = a6;
  a1[5] = a7;
  a1[6] = a8;
  a1[7] = a9;
}

void __swiftcall simd_double4x4.init(_:)(simd_double4x4 *__return_ptr retstr, simd_double4x4 *a2)
{
  __int128 v2 = *(_OWORD *)&a2->columns[2].f64[2];
  *(_OWORD *)retstr->columns[2].f64 = *(_OWORD *)a2->columns[2].f64;
  *(_OWORD *)&retstr->columns[2].f64[2] = v2;
  __int128 v3 = *(_OWORD *)&a2->columns[3].f64[2];
  *(_OWORD *)retstr->columns[3].f64 = *(_OWORD *)a2->columns[3].f64;
  *(_OWORD *)&retstr->columns[3].f64[2] = v3;
  __int128 v4 = *(_OWORD *)&a2->columns[0].f64[2];
  *(_OWORD *)retstr->columns[0].f64 = *(_OWORD *)a2->columns[0].f64;
  *(_OWORD *)&retstr->columns[0].f64[2] = v4;
  __int128 v5 = *(_OWORD *)&a2->columns[1].f64[2];
  *(_OWORD *)retstr->columns[1].f64 = *(_OWORD *)a2->columns[1].f64;
  *(_OWORD *)&retstr->columns[1].f64[2] = v5;
}

__n128 simd_double4x4.cmatrix.getter@<Q0>(uint64_t a1@<X8>)
{
  __int128 v2 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 80) = v2;
  __int128 v3 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(a1 + 112) = v3;
  __int128 v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v4;
  __n128 result = *(__n128 *)(v1 + 32);
  __int128 v6 = *(_OWORD *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v6;
  return result;
}

__n128 simd_double4x3.subscript.getter(uint64_t a1)
{
  switch(a1)
  {
    case 0LL:
      break;
    case 1LL:
      v1 += 32LL;
      break;
    case 2LL:
      v1 += 64LL;
      break;
    case 3LL:
      v1 += 96LL;
      break;
    default:
      __break(1u);
      JUMPOUT(0x186F109A4LL);
  }

  return *(__n128 *)v1;
}

uint64_t simd_double4x3.subscript.setter(uint64_t result, __n128 a2, __n128 a3)
{
  switch(result)
  {
    case 0LL:
      break;
    case 1LL:
      v3 += 2;
      break;
    case 2LL:
      v3 += 4;
      break;
    case 3LL:
      v3 += 6;
      break;
    default:
      __break(1u);
      JUMPOUT(0x186F10A00LL);
  }

  *__int128 v3 = a2;
  v3[1] = a3;
  return result;
}

uint64_t (*simd_double4x4.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  __n128 result = (uint64_t (*)())malloc(0x30uLL);
  __int128 v6 = result;
  *a1 = result;
  *((void *)result + 4) = a2;
  *((void *)result + 5) = v2;
  switch(a2)
  {
    case 0LL:
      __int128 v8 = *v2;
      __int128 v7 = v2[1];
      __n128 result = simd_double4x3.subscript.modify;
LABEL_10:
      *(_OWORD *)__int128 v6 = v8;
      *((_OWORD *)v6 + 1) = v7;
      return result;
    case 1LL:
      __int128 v8 = v2[2];
      __int128 v7 = v2[3];
      goto LABEL_9;
    case 2LL:
      __int128 v8 = v2[4];
      __int128 v7 = v2[5];
LABEL_9:
      __n128 result = simd_double4x3.subscript.modify;
      goto LABEL_10;
    case 3LL:
      __int128 v8 = v2[6];
      __int128 v7 = v2[7];
      goto LABEL_9;
  }

  __break(1u);
  return result;
}

void simd_double4x3.subscript.modify(void **a1, char a2)
{
  __int128 v2 = *a1;
  __int128 v4 = *(_OWORD *)v2;
  __int128 v3 = *((_OWORD *)v2 + 1);
  uint64_t v5 = v2[4];
  BOOL v6 = v5 == 1;
  if ((a2 & 1) != 0)
  {
    if (v5 == 1)
    {
LABEL_10:
      __int128 v8 = (_OWORD *)(v2[5] + 32LL);
      *__int128 v8 = v4;
      v8[1] = v3;
      goto LABEL_9;
    }

    if (v5 == 2)
    {
LABEL_8:
      __int128 v7 = (_OWORD *)(v2[5] + 64LL);
      *__int128 v7 = v4;
      v7[1] = v3;
LABEL_9:
      free(v2);
      return;
    }

    BOOL v6 = v5 == 3;
    if (v5 == 3)
    {
LABEL_12:
      __int128 v9 = (_OWORD *)(v2[5] + 96LL);
      _OWORD *v9 = v4;
      v9[1] = v3;
      goto LABEL_9;
    }

    __break(1u);
  }

  if (v6) {
    goto LABEL_10;
  }
  if (v5 == 2) {
    goto LABEL_8;
  }
  if (v5 == 3) {
    goto LABEL_12;
  }
  __break(1u);
}

double simd_double4x4.subscript.getter(uint64_t a1, unint64_t a2)
{
  switch(a1)
  {
    case 0LL:
      goto LABEL_5;
    case 1LL:
      v2 += 32LL;
      goto LABEL_5;
    case 2LL:
      v2 += 64LL;
      goto LABEL_5;
    case 3LL:
      v2 += 96LL;
LABEL_5:
      if (a2 > 3)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x186F10B68LL);
      }

      return *(double *)(v2 + 8 * (a2 & 3));
    default:
      goto LABEL_8;
  }

uint64_t key path getter for simd_double4x4.subscript(_:_:) : simd_double4x4@<X0>( uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 2)
  {
    result += 64LL;
  }

  else if (v3 == 1)
  {
    result += 32LL;
  }

  else if (v3)
  {
    if (v3 != 3) {
      goto LABEL_11;
    }
    result += 96LL;
  }

  if ((unint64_t)a2[1] <= 3)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 3));
    return result;
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double4x4.subscript(_:_:) : simd_double4x4( uint64_t *result, __int128 *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  uint64_t v5 = *result;
  if (!*a3)
  {
    if (v4 <= 3)
    {
      __int128 v8 = a2[1];
      __int128 v11 = *a2;
      __int128 v12 = v8;
      *((void *)&v11 + (v4 & 3)) = v5;
      __int128 v9 = v12;
      *a2 = v11;
      a2[1] = v9;
      return result;
    }

    goto LABEL_16;
  }

  switch(v3)
  {
    case 1LL:
      __int128 v7 = a2[2];
      __int128 v6 = a2[3];
      break;
    case 2LL:
      __int128 v7 = a2[4];
      __int128 v6 = a2[5];
      break;
    case 3LL:
      __int128 v7 = a2[6];
      __int128 v6 = a2[7];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }

  if (v4 > 3)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  __int128 v13 = v7;
  __int128 v14 = v6;
  *((void *)&v13 + (v4 & 3)) = v5;
  __int128 v10 = v14;
  if (v3 == 1)
  {
    a2[2] = v13;
    a2[3] = v10;
  }

  else if (v3 == 2)
  {
    a2[4] = v13;
    a2[5] = v10;
  }

  else
  {
    a2[6] = v13;
    a2[7] = v10;
  }

  return result;
}

uint64_t simd_double4x4.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  switch(result)
  {
    case 0LL:
      if (a2 <= 3)
      {
        __int128 v6 = v3[1];
        __int128 v9 = *v3;
        __int128 v10 = v6;
        *((double *)&v9 + (a2 & 3)) = a3;
        __int128 v7 = v10;
        *uint64_t v3 = v9;
        v3[1] = v7;
        return result;
      }

      goto LABEL_16;
    case 1LL:
      __int128 v5 = v3[2];
      __int128 v4 = v3[3];
      break;
    case 2LL:
      __int128 v5 = v3[4];
      __int128 v4 = v3[5];
      break;
    case 3LL:
      __int128 v5 = v3[6];
      __int128 v4 = v3[7];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }

  if (a2 > 3)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  __int128 v11 = v5;
  __int128 v12 = v4;
  *((double *)&v11 + (a2 & 3)) = a3;
  __int128 v8 = v12;
  if (result == 1)
  {
    v3[2] = v11;
    v3[3] = v8;
  }

  else if (result == 2)
  {
    v3[4] = v11;
    v3[5] = v8;
  }

  else
  {
    v3[6] = v11;
    v3[7] = v8;
  }

  return result;
}

uint64_t (*simd_double4x4.subscript.modify( uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  if (a2)
  {
    switch(a2)
    {
      case 1LL:
        __int128 v5 = v3[2];
        __int128 v4 = v3[3];
        break;
      case 2LL:
        __int128 v5 = v3[4];
        __int128 v4 = v3[5];
        break;
      case 3LL:
        __int128 v5 = v3[6];
        __int128 v4 = v3[7];
        break;
      default:
        goto LABEL_12;
    }
  }

  else
  {
    __int128 v5 = *v3;
    __int128 v4 = v3[1];
  }

  if (a3 <= 3)
  {
    v6[0] = v5;
    v6[1] = v4;
    *(void *)__n128 result = *((void *)v6 + (a3 & 3));
    return simd_double4x3.subscript.modify;
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

double simd_double4x3.subscript.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = (__int128 *)a1[3];
  uint64_t v3 = v2 + 2;
  __int128 v4 = v2[2];
  uint64_t v5 = *a1;
  __int128 v6 = v2[3];
  uint64_t v7 = a1[1];
  if ((a2 & 1) != 0)
  {
    switch(v7)
    {
      case 0LL:
        goto LABEL_4;
      case 1LL:
        goto LABEL_5;
      case 2LL:
        goto LABEL_6;
      case 3LL:
        goto LABEL_7;
      default:
        __break(1u);
        goto LABEL_9;
    }
  }

  switch(v7)
  {
    case 0LL:
LABEL_4:
      __int128 v4 = *v2;
      __int128 v6 = v2[1];
      uint64_t v3 = (_OWORD *)a1[3];
      break;
    case 1LL:
      break;
    case 2LL:
LABEL_6:
      __int128 v4 = v2[4];
      __int128 v6 = v2[5];
      uint64_t v3 = v2 + 4;
      break;
    case 3LL:
LABEL_7:
      __int128 v4 = v2[6];
      __int128 v6 = v2[7];
      uint64_t v3 = v2 + 6;
      break;
    default:
LABEL_9:
      __break(1u);
      JUMPOUT(0x186F10EA4LL);
  }

unint64_t simd_double4x4.debugDescription.getter()
{
  return simd_double4x3.debugDescription.getter( 0x8000000186F1F890LL,  (uint64_t (*)(__n128, __n128))specialized SIMD4._descriptionAsArray.getter);
}

unint64_t simd_double4x3.debugDescription.getter( uint64_t a1, uint64_t (*a2)(__n128, __n128))
{
  uint64_t v4 = swift_bridgeObjectRelease();
  __n128 v14 = v2[2];
  __n128 v15 = v2[3];
  __n128 v16 = v2[4];
  __n128 v17 = v2[5];
  __n128 v19 = v2[7];
  __n128 v18 = v2[6];
  v5._countAndFlagsBits = ((uint64_t (*)(uint64_t, __n128, __n128))a2)(v4, *v2, v2[1]);
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 8236LL;
  v6._object = (void *)0xE200000000000000LL;
  String.append(_:)(v6);
  v7._countAndFlagsBits = a2(v14, v15);
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 8236LL;
  v8._object = (void *)0xE200000000000000LL;
  String.append(_:)(v8);
  v9._countAndFlagsBits = a2(v16, v17);
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 8236LL;
  v10._object = (void *)0xE200000000000000LL;
  String.append(_:)(v10);
  v11._countAndFlagsBits = a2(v18, v19);
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 10589LL;
  v12._object = (void *)0xE200000000000000LL;
  String.append(_:)(v12);
  return 0xD000000000000010LL;
}

unint64_t static simd_double4x4.== infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)),  vandq_s8((int8x16_t)vceqq_f64(a1[4], a2[4]), (int8x16_t)vceqq_f64(a1[6], a2[6]))),  vandq_s8( vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])),  vandq_s8((int8x16_t)vceqq_f64(a1[5], a2[5]), (int8x16_t)vceqq_f64(a1[7], a2[7]))));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double4x4( _OWORD *a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_double4x3( a1,  a2,  a3,  a4,  (uint64_t (*)(_OWORD *, _OWORD *))simd_equal);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double4x3( _OWORD *a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_OWORD *, _OWORD *))
{
  __int128 v5 = a1[1];
  __int128 v6 = a1[2];
  __int128 v7 = a1[3];
  __int128 v8 = a1[4];
  __int128 v9 = a1[5];
  __int128 v10 = a1[6];
  __int128 v11 = a1[7];
  __int128 v12 = *a2;
  __int128 v13 = a2[1];
  __int128 v14 = a2[2];
  __int128 v15 = a2[3];
  __int128 v16 = a2[4];
  __int128 v17 = a2[5];
  __int128 v18 = a2[6];
  __int128 v19 = a2[7];
  v22[0] = *a1;
  v22[1] = v5;
  v22[2] = v6;
  v22[3] = v7;
  v22[4] = v8;
  v22[5] = v9;
  v22[6] = v10;
  v22[7] = v11;
  v21[0] = v12;
  v21[1] = v13;
  v21[2] = v14;
  v21[3] = v15;
  v21[4] = v16;
  v21[5] = v17;
  v21[6] = v18;
  v21[7] = v19;
  return a5(v22, v21);
}

double simd_double4x4.inverse.getter@<D0>(_OWORD *a1@<X8>)
{
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  return result;
}

double simd_double4x4.determinant.getter()
{
  uint64_t v1 = v0;
  float64x2x2_t v18 = vld2q_f64(v1->f64);
  v1 += 2;
  float64x2_t v2 = v0[3];
  float64x2_t v3 = v0[4];
  float64x2_t v4 = v0[5];
  float64x2_t v5 = v0[6];
  float64x2_t v6 = v0[7];
  float64x2_t v7 = (float64x2_t)vextq_s8((int8x16_t)v2, *(int8x16_t *)v1, 8uLL);
  float64x2_t v8 = (float64x2_t)vextq_s8(*(int8x16_t *)v1, (int8x16_t)v2, 8uLL);
  float64x2_t v9 = (float64x2_t)vextq_s8((int8x16_t)v6, (int8x16_t)v5, 8uLL);
  float64x2_t v10 = (float64x2_t)vextq_s8((int8x16_t)v5, (int8x16_t)v6, 8uLL);
  float64x2_t v11 = (float64x2_t)vextq_s8((int8x16_t)v4, (int8x16_t)v3, 8uLL);
  float64x2_t v12 = (float64x2_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL);
  float64x2_t v13 = vnegq_f64(v12);
  float64x2_t v14 = vnegq_f64(v11);
  int64x2_t v15 = (int64x2_t)vmlaq_f64( vmlaq_f64( vmulq_f64(*v1, vmlaq_f64(vmulq_f64(v10, v14), v9, v12)),  vmlaq_f64(vmulq_f64(v5, v13), v10, v3),  v7),  vmlaq_f64(vmulq_f64(v9, vnegq_f64(v3)), v5, v11),  v8);
  int64x2_t v16 = (int64x2_t)vmlaq_f64( vmlaq_f64( vmulq_f64(v2, vmlaq_f64(vmulq_f64(v9, v13), v10, v11)),  vmlaq_f64(vmulq_f64(v6, v14), v9, v4),  v8),  vmlaq_f64(vmulq_f64(v10, vnegq_f64(v4)), v6, v12),  v7);
  return vaddvq_f64( vsubq_f64( vmulq_f64(v18.val[0], (float64x2_t)vzip1q_s64(v16, v15)),  vmulq_f64(v18.val[1], (float64x2_t)vzip2q_s64(v16, v15))));
}

float64x2_t static simd_double4x4.+ infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vaddq_f64(a2[1], a1[1]);
  float64x2_t v4 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v5 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v6 = vaddq_f64(a2[4], a1[4]);
  float64x2_t v7 = vaddq_f64(a2[5], a1[5]);
  float64x2_t v8 = vaddq_f64(a2[6], a1[6]);
  float64x2_t v9 = vaddq_f64(a2[7], a1[7]);
  *a3 = vaddq_f64(*a2, *a1);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  a3[6] = v8;
  a3[7] = v9;
  return result;
}

float64x2_t static simd_double4x4.- prefix(_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>)
{
  float64x2_t result = vsubq_f64((float64x2_t)0, a1[1]);
  float64x2_t v3 = vsubq_f64((float64x2_t)0, a1[2]);
  float64x2_t v4 = vsubq_f64((float64x2_t)0, a1[3]);
  float64x2_t v5 = vsubq_f64((float64x2_t)0, a1[4]);
  float64x2_t v6 = vsubq_f64((float64x2_t)0, a1[5]);
  float64x2_t v7 = vsubq_f64((float64x2_t)0, a1[6]);
  float64x2_t v8 = vsubq_f64((float64x2_t)0, a1[7]);
  *a2 = vsubq_f64((float64x2_t)0, *a1);
  a2[1] = result;
  a2[2] = v3;
  a2[3] = v4;
  a2[4] = v5;
  a2[5] = v6;
  a2[6] = v7;
  a2[7] = v8;
  return result;
}

float64x2_t static simd_double4x4.- infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vsubq_f64(a1[1], a2[1]);
  float64x2_t v4 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v5 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v6 = vsubq_f64(a1[4], a2[4]);
  float64x2_t v7 = vsubq_f64(a1[5], a2[5]);
  float64x2_t v8 = vsubq_f64(a1[6], a2[6]);
  float64x2_t v9 = vsubq_f64(a1[7], a2[7]);
  *a3 = vsubq_f64(*a1, *a2);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  a3[6] = v8;
  a3[7] = v9;
  return result;
}

float64x2_t static simd_double4x4.+= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vaddq_f64(a2[1], a1[1]);
  float64x2_t result = vaddq_f64(*a2, *a1);
  float64x2_t v4 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v5 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v6 = vaddq_f64(a2[5], a1[5]);
  float64x2_t v7 = vaddq_f64(a2[4], a1[4]);
  float64x2_t v8 = vaddq_f64(a2[7], a1[7]);
  float64x2_t v9 = vaddq_f64(a2[6], a1[6]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  a1[6] = v9;
  a1[7] = v8;
  return result;
}

float64x2_t static simd_double4x4.-= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vsubq_f64(a1[1], a2[1]);
  float64x2_t result = vsubq_f64(*a1, *a2);
  float64x2_t v4 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v5 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v6 = vsubq_f64(a1[5], a2[5]);
  float64x2_t v7 = vsubq_f64(a1[4], a2[4]);
  float64x2_t v8 = vsubq_f64(a1[7], a2[7]);
  float64x2_t v9 = vsubq_f64(a1[6], a2[6]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  a1[6] = v9;
  a1[7] = v8;
  return result;
}

float64x2_t static simd_double4x4.* infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X8>, double a3@<D0>)
{
  float64x2_t v3 = vmulq_n_f64(*a1, a3);
  float64x2_t v4 = vmulq_n_f64(a1[1], a3);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3);
  float64x2_t v6 = vmulq_n_f64(a1[3], a3);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3);
  float64x2_t v8 = vmulq_n_f64(a1[5], a3);
  float64x2_t v9 = vmulq_n_f64(a1[6], a3);
  float64x2_t result = vmulq_n_f64(a1[7], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = v8;
  a2[6] = v9;
  a2[7] = result;
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t result;
  float64x2_t v3 = vmulq_n_f64(*a1, a3);
  float64x2_t v4 = vmulq_n_f64(a1[1], a3);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3);
  float64x2_t v6 = vmulq_n_f64(a1[3], a3);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3);
  float64x2_t v8 = vmulq_n_f64(a1[5], a3);
  float64x2_t v9 = vmulq_n_f64(a1[6], a3);
  float64x2_t result = vmulq_n_f64(a1[7], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = v8;
  a2[6] = v9;
  a2[7] = result;
  return result;
}

float64x2_t static simd_double4x4.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(a1[1], a2);
  float64x2_t v3 = vmulq_n_f64(*a1, a2);
  float64x2_t v4 = vmulq_n_f64(a1[3], a2);
  float64x2_t v5 = vmulq_n_f64(a1[2], a2);
  float64x2_t v6 = vmulq_n_f64(a1[5], a2);
  float64x2_t v7 = vmulq_n_f64(a1[4], a2);
  float64x2_t v8 = vmulq_n_f64(a1[7], a2);
  float64x2_t result = vmulq_n_f64(a1[6], a2);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  a1[6] = result;
  a1[7] = v8;
  return result;
}

double static simd_double4x4.* infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmlaq_n_f64( vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1),  a1[4],  a3.f64[0]),  a1[6],  a3,  1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmlaq_n_f64( vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1),  a1[4],  a3.f64[0]),  a1[6],  a3,  1);
  return result;
}

double static simd_double4x4.* infix(_:_:)(int64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  i64 = (const double *)a1[4].i64;
  vld4q_f64(i64);
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64( vmlaq_n_f64( vmlaq_laneq_f64( vmulq_n_f64((float64x2_t)vzip1q_s64(*a1, a1[2]), a2.f64[0]),  (float64x2_t)vzip2q_s64(*a1, a1[2]),  a2,  1),  (float64x2_t)vzip1q_s64(a1[1], a1[3]),  a3.f64[0]),  (float64x2_t)vzip2q_s64(a1[1], a1[3]),  a3,  1);
  return result;
}

float64x2_t static simd_double4x4.* infix(_:_:)@<Q0>( float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v3 = a2[1];
  float64x2_t v5 = a2[2];
  float64x2_t v4 = a2[3];
  float64x2_t v7 = a2[4];
  float64x2_t v6 = a2[5];
  float64x2_t v8 = a1[1];
  float64x2_t v10 = a1[2];
  float64x2_t v9 = a1[3];
  float64x2_t v11 = a1[4];
  float64x2_t v12 = a1[5];
  float64x2_t v14 = a1[6];
  float64x2_t v13 = a1[7];
  float64x2_t v15 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v10, *a2, 1), v11, v3.f64[0]),  v14,  v3,  1);
  float64x2_t v16 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v8, a2->f64[0]), v9, *a2, 1), v12, v3.f64[0]),  v13,  v3,  1);
  float64x2_t v17 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v10, v5, 1), v11, v4.f64[0]),  v14,  v4,  1);
  float64x2_t result = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v8, v5.f64[0]), v9, v5, 1), v12, v4.f64[0]),  v13,  v4,  1);
  float64x2_t v19 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v10, v7, 1), v11, v6.f64[0]),  v14,  v6,  1);
  *a3 = v15;
  a3[1] = v16;
  a3[2] = v17;
  a3[3] = result;
  a3[4] = v19;
  a3[5] = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v8, v7.f64[0]), v9, v7, 1), v12, v6.f64[0]),  v13,  v6,  1);
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t result;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v3 = a2[1];
  float64x2_t v5 = a2[2];
  float64x2_t v4 = a2[3];
  float64x2_t v7 = a2[4];
  float64x2_t v6 = a2[5];
  float64x2_t v9 = a2[6];
  float64x2_t result = a2[7];
  float64x2_t v10 = a1[1];
  float64x2_t v12 = a1[2];
  float64x2_t v11 = a1[3];
  float64x2_t v13 = a1[4];
  float64x2_t v14 = a1[5];
  float64x2_t v16 = a1[6];
  float64x2_t v15 = a1[7];
  float64x2_t v17 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v12, *a2, 1), v13, v3.f64[0]),  v16,  v3,  1);
  float64x2x2_t v18 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, a2->f64[0]), v11, *a2, 1), v14, v3.f64[0]),  v15,  v3,  1);
  float64x2_t v19 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v12, v5, 1), v13, v4.f64[0]),  v16,  v4,  1);
  float64x2_t v20 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v5.f64[0]), v11, v5, 1), v14, v4.f64[0]),  v15,  v4,  1);
  float64x2_t v21 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v12, v7, 1), v13, v6.f64[0]),  v16,  v6,  1);
  float64x2_t v22 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v7.f64[0]), v11, v7, 1), v14, v6.f64[0]),  v15,  v6,  1);
  uint64_t v23 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v9.f64[0]), v12, v9, 1), v13, result.f64[0]),  v16,  result,  1);
  *a3 = v17;
  a3[1] = v18;
  a3[2] = v19;
  a3[3] = v20;
  a3[4] = v21;
  a3[5] = v22;
  a3[6] = v23;
  a3[7] = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v9.f64[0]), v11, v9, 1), v14, result.f64[0]),  v15,  result,  1);
  return result;
}

float64x2_t static simd_double4x4.*= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = a2[1];
  float64x2_t v4 = a2[2];
  float64x2_t v3 = a2[3];
  float64x2_t v6 = a2[4];
  float64x2_t v5 = a2[5];
  float64x2_t v8 = a2[6];
  float64x2_t result = a2[7];
  float64x2_t v9 = a1[1];
  float64x2_t v10 = a1[2];
  float64x2_t v11 = a1[3];
  float64x2_t v13 = a1[4];
  float64x2_t v12 = a1[5];
  float64x2_t v14 = a1[6];
  float64x2_t v15 = a1[7];
  float64x2_t v16 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v9, a2->f64[0]), v11, *a2, 1), v12, v2.f64[0]),  v15,  v2,  1);
  float64x2_t v17 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v10, *a2, 1), v13, v2.f64[0]),  v14,  v2,  1);
  float64x2_t v18 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v9, v4.f64[0]), v11, v4, 1), v12, v3.f64[0]),  v15,  v3,  1);
  float64x2_t v19 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v4.f64[0]), v10, v4, 1), v13, v3.f64[0]),  v14,  v3,  1);
  float64x2_t v20 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v9, v6.f64[0]), v11, v6, 1), v12, v5.f64[0]),  v15,  v5,  1);
  float64x2_t v21 = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v6.f64[0]), v10, v6, 1), v13, v5.f64[0]),  v14,  v5,  1);
  float64x2_t v22 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v8.f64[0]), v10, v8, 1), v13, result.f64[0]);
  *a1 = v17;
  a1[1] = v16;
  a1[2] = v19;
  a1[3] = v18;
  a1[4] = v21;
  a1[5] = v20;
  a1[6] = vmlaq_laneq_f64(v22, v14, result, 1);
  a1[7] = vmlaq_laneq_f64( vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v9, v8.f64[0]), v11, v8, 1), v12, result.f64[0]),  v15,  result,  1);
  return result;
}

void matrix_from_diagonal(_:)(_OWORD *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>)
{
  *(void *)&__int128 v3 = 0LL;
  *((void *)&v3 + 1) = a2.n128_u64[1];
  *(void *)&__int128 v4 = 0LL;
  *((void *)&v4 + 1) = a3.n128_u64[1];
  *a1 = a2.n128_u64[0];
  a1[1] = 0u;
  a1[2] = v3;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = a3.n128_u64[0];
  a1[6] = 0u;
  a1[7] = v4;
}

void __swiftcall matrix_invert(_:)(simd_double4x4 *__return_ptr retstr, simd_double4x4 *a2)
{
  *retstr = v3;
}

Swift::Double __swiftcall matrix_determinant(_:)(simd_double4x4 *a1)
{
  uint64_t v1 = (float64x2_t *)a1;
  float64x2x2_t v18 = vld2q_f64(v1->f64);
  v1 += 2;
  float64x2_t v2 = *(float64x2_t *)&a1->columns[1].f64[2];
  float64x2_t v3 = *(float64x2_t *)a1->columns[2].f64;
  float64x2_t v4 = *(float64x2_t *)&a1->columns[2].f64[2];
  float64x2_t v5 = *(float64x2_t *)a1->columns[3].f64;
  float64x2_t v6 = *(float64x2_t *)&a1->columns[3].f64[2];
  float64x2_t v7 = (float64x2_t)vextq_s8((int8x16_t)v2, *(int8x16_t *)v1, 8uLL);
  float64x2_t v8 = (float64x2_t)vextq_s8(*(int8x16_t *)v1, (int8x16_t)v2, 8uLL);
  float64x2_t v9 = (float64x2_t)vextq_s8((int8x16_t)v6, (int8x16_t)v5, 8uLL);
  float64x2_t v10 = (float64x2_t)vextq_s8((int8x16_t)v5, (int8x16_t)v6, 8uLL);
  float64x2_t v11 = (float64x2_t)vextq_s8((int8x16_t)v4, (int8x16_t)v3, 8uLL);
  float64x2_t v12 = (float64x2_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL);
  float64x2_t v13 = vnegq_f64(v12);
  float64x2_t v14 = vnegq_f64(v11);
  int64x2_t v15 = (int64x2_t)vmlaq_f64( vmlaq_f64( vmulq_f64(*v1, vmlaq_f64(vmulq_f64(v10, v14), v9, v12)),  vmlaq_f64(vmulq_f64(v5, v13), v10, v3),  v7),  vmlaq_f64(vmulq_f64(v9, vnegq_f64(v3)), v5, v11),  v8);
  int64x2_t v16 = (int64x2_t)vmlaq_f64( vmlaq_f64( vmulq_f64(v2, vmlaq_f64(vmulq_f64(v9, v13), v10, v11)),  vmlaq_f64(vmulq_f64(v6, v14), v9, v4),  v8),  vmlaq_f64(vmulq_f64(v10, vnegq_f64(v4)), v6, v12),  v7);
  return vaddvq_f64( vsubq_f64( vmulq_f64(v18.val[0], (float64x2_t)vzip1q_s64(v16, v15)),  vmulq_f64(v18.val[1], (float64x2_t)vzip2q_s64(v16, v15))));
}

void __swiftcall matrix_transpose(_:)(simd_double4x4 *__return_ptr retstr, simd_double4x4 *a2)
{
  int64x2_t v2 = *(int64x2_t *)&a2->columns[0].f64[2];
  int64x2_t v4 = *(int64x2_t *)a2->columns[1].f64;
  int64x2_t v3 = *(int64x2_t *)&a2->columns[1].f64[2];
  float64x2_t v5 = &a2->columns[2];
  float64x2x4_t v7 = vld4q_f64(v5->f64);
  int64x2_t v6 = vzip2q_s64(*(int64x2_t *)a2->columns[0].f64, v4);
  *(int64x2_t *)retstr->columns[0].f64 = vzip1q_s64(*(int64x2_t *)a2->columns[0].f64, v4);
  *(float64x2_t *)&retstr->columns[0].f64[2] = v7.val[0];
  *(int64x2_t *)retstr->columns[1].f64 = v6;
  *(float64x2_t *)&retstr->columns[1].f64[2] = v7.val[1];
  *(int64x2_t *)retstr->columns[2].f64 = vzip1q_s64(v2, v3);
  *(float64x2_t *)&retstr->columns[2].f64[2] = v7.val[2];
  *(int64x2_t *)retstr->columns[3].f64 = vzip2q_s64(v2, v3);
  *(float64x2_t *)&retstr->columns[3].f64[2] = v7.val[3];
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double4x4 *a1, simd_double4x4 *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8( vandq_s8( vandq_s8( (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[1].f64, *(float64x2_t *)a2->columns[1].f64),  (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[0].f64, *(float64x2_t *)a2->columns[0].f64)),  vandq_s8( (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[2].f64, *(float64x2_t *)a2->columns[2].f64),  (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[3].f64, *(float64x2_t *)a2->columns[3].f64))),  vandq_s8( vandq_s8( (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[1].f64[2],  *(float64x2_t *)&a2->columns[1].f64[2]),  (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[0].f64[2],  *(float64x2_t *)&a2->columns[0].f64[2])),  vandq_s8( (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[2].f64[2],  *(float64x2_t *)&a2->columns[2].f64[2]),  (int8x16_t)vceqq_f64( *(float64x2_t *)&a1->columns[3].f64[2],  *(float64x2_t *)&a2->columns[3].f64[2]))));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

double sincos(_:)()
{
  return sincos(_:)(MEMORY[0x1895F90D0]);
}

{
  return sincos(_:)(MEMORY[0x1895F90D8]);
}

double sincospi(_:)()
{
  return sincos(_:)(MEMORY[0x1895F90E0]);
}

{
  return sincos(_:)(MEMORY[0x1895F90E8]);
}

double sincos(_:)(void (*a1)(double *, __int128 *))
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  __int128 v2 = 0u;
  *(_OWORD *)int64x2_t v3 = 0u;
  a1(v3, &v2);
  return v3[0];
}

double fma(_:_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_f64(a3, a2, a1);
  return result;
}

double round(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vrndaq_f64(a1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vrndaq_f64(a1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vrndaq_f64(a1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vrndaq_f64(a1);
  return result;
}

double isfinite(_:)(float64x2_t a1)
{
  *(void *)&double result = vbicq_s8( vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1)),  (int8x16_t)vceqq_f64( (float64x2_t)vandq_s8( (int8x16_t)a1,  (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)),  (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL))).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vbicq_s8( vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1)),  (int8x16_t)vceqq_f64(vabsq_f64(a1), (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL))).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vbicq_s8( vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1)),  (int8x16_t)vceqq_f64(vabsq_f64(a1), (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL))).u64[0];
  return result;
}

double isinf(_:)(int8x16_t a1)
{
  *(void *)&double result = vceqq_f64( (float64x2_t)vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)),  (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL)).u64[0];
  return result;
}

double isnan(_:)(float64x2_t a1)
{
  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1))).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1))).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1))).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1))).u64[0];
  return result;
}

double isnormal(_:)(float64x2_t a1)
{
  int8x16_t v1 = vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1));
  float64x2_t v2 = (float64x2_t)vandq_s8((int8x16_t)a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  *(void *)&double result = vandq_s8( vbicq_s8(v1, (int8x16_t)vceqq_f64(v2, (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL))),  (int8x16_t)vcgeq_f64(v2, (float64x2_t)vdupq_n_s64(0x10000000000000uLL))).u64[0];
  return result;
}

{
  int8x16_t v1;
  float64x2_t v2;
  double result;
  int8x16_t v1 = vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1));
  float64x2_t v2 = vabsq_f64(a1);
  *(void *)&double result = vandq_s8( vbicq_s8(v1, (int8x16_t)vceqq_f64(v2, (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL))),  (int8x16_t)vcgeq_f64(v2, (float64x2_t)vdupq_n_s64(0x10000000000000uLL))).u64[0];
  return result;
}

{
  int8x16_t v1;
  float64x2_t v2;
  double result;
  int8x16_t v1 = vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1));
  float64x2_t v2 = vabsq_f64(a1);
  *(void *)&double result = vandq_s8( vbicq_s8(v1, (int8x16_t)vceqq_f64(v2, (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL))),  (int8x16_t)vcgeq_f64(v2, (float64x2_t)vdupq_n_s64(0x10000000000000uLL))).u64[0];
  return result;
}

double sincos(_:)(double a1, double a2)
{
  return sincos(_:)(MEMORY[0x1895F90D0], a1, a2);
}

double sincospi(_:)(double a1, double a2)
{
  return sincos(_:)(MEMORY[0x1895F90E0], a1, a2);
}

double sincos(_:)(void (*a1)(__int128 *, __int128 *), double a2, double a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  __n128 v5 = (__n128)*(unint64_t *)&a3;
  a1(&v8, &v6);
  ((void (*)(__int128 *, __int128 *, __n128))a1)(&v9, &v7, v5);
  return *(double *)&v8;
}

double cos(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F90], a1, a2).n128_u64[0];
  return result;
}

double cosh(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FA0], a1, a2).n128_u64[0];
  return result;
}

double cospi(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FB0], a1, a2).n128_u64[0];
  return result;
}

double acos(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F10], a1, a2).n128_u64[0];
  return result;
}

double acosh(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F20], a1, a2).n128_u64[0];
  return result;
}

double sin(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F90C0], a1, a2).n128_u64[0];
  return result;
}

double sinh(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F90F0], a1, a2).n128_u64[0];
  return result;
}

double sinpi(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9100], a1, a2).n128_u64[0];
  return result;
}

double asin(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F30], a1, a2).n128_u64[0];
  return result;
}

double asinh(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F40], a1, a2).n128_u64[0];
  return result;
}

double tan(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9110], a1, a2).n128_u64[0];
  return result;
}

double tanh(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9120], a1, a2).n128_u64[0];
  return result;
}

double tanpi(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9130], a1, a2).n128_u64[0];
  return result;
}

double atan(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F60], a1, a2).n128_u64[0];
  return result;
}

double atanh(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F70], a1, a2).n128_u64[0];
  return result;
}

double atan2(_:_:)(__n128 a1, double a2, __n128 a3, double a4)
{
  *(void *)&double result = atan2(_:_:)((double (*)(__n128, __n128))MEMORY[0x1895F8F50], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double exp(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9000], a1, a2).n128_u64[0];
  return result;
}

double exp2(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FF0], a1, a2).n128_u64[0];
  return result;
}

double exp10(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FE0], a1, a2).n128_u64[0];
  return result;
}

double expm1(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9010], a1, a2).n128_u64[0];
  return result;
}

double log(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9080], a1, a2).n128_u64[0];
  return result;
}

double log2(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9070], a1, a2).n128_u64[0];
  return result;
}

double log10(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9050], a1, a2).n128_u64[0];
  return result;
}

double log1p(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9060], a1, a2).n128_u64[0];
  return result;
}

double lgamma(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9040], a1, a2).n128_u64[0];
  return result;
}

double tgamma(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9140], a1, a2).n128_u64[0];
  return result;
}

double erf(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FC0], a1, a2).n128_u64[0];
  return result;
}

double erfc(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FD0], a1, a2).n128_u64[0];
  return result;
}

double cbrt(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F80], a1, a2).n128_u64[0];
  return result;
}

__n128 cos(_:)(double (*a1)(void), double a2, double a3)
{
  __n128 v7 = (__n128)*(unint64_t *)&a3;
  *(double *)&__int128 v4 = a1();
  __int128 v6 = v4;
  ((void (*)(__n128))a1)(v7);
  return (__n128)v6;
}

double pow(_:_:)(__n128 a1, double a2, __n128 a3, double a4)
{
  *(void *)&double result = atan2(_:_:)((double (*)(__n128, __n128))MEMORY[0x1895F90A0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double hypot(_:_:)(__n128 a1, double a2, __n128 a3, double a4)
{
  *(void *)&double result = atan2(_:_:)((double (*)(__n128, __n128))MEMORY[0x1895F9030], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double fma(_:_:_:)(float64x2_t a1, double a2, float64x2_t a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_f64(a5, a3, a1);
  return result;
}

{
  double result;
  *(void *)&double result = *(_OWORD *)&vmlaq_f64(a5, a3, a1);
  return result;
}

double fmod(_:_:)(__n128 a1, double a2, __n128 a3, double a4)
{
  *(void *)&double result = atan2(_:_:)((double (*)(__n128, __n128))MEMORY[0x1895F9020], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double remainder(_:_:)(__n128 a1, double a2, __n128 a3, double a4)
{
  *(void *)&double result = atan2(_:_:)((double (*)(__n128, __n128))MEMORY[0x1895F90B0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double nextafter(_:_:)(__n128 a1, double a2, __n128 a3, double a4)
{
  *(void *)&double result = atan2(_:_:)((double (*)(__n128, __n128))MEMORY[0x1895F9090], a1, a2, a3, a4).n128_u64[0];
  return result;
}

__n128 atan2(_:_:)(double (*a1)(__n128, __n128), __n128 a2, double a3, __n128 a4, double a5)
{
  __n128 v9 = (__n128)*(unint64_t *)&a5;
  __n128 v10 = (__n128)*(unint64_t *)&a3;
  *(double *)&__int128 v6 = a1(a2, a4);
  __int128 v8 = v6;
  a1(v10, v9);
  return (__n128)v8;
}

double isinf(_:)(float64x2_t a1)
{
  *(void *)&double result = vceqq_f64(vabsq_f64(a1), (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vceqq_f64(vabsq_f64(a1), (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vceqq_f64(vabsq_f64(a1), (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL)).u64[0];
  return result;
}

double sincos(_:)(double a1, __n128 a2)
{
  return sincos(_:)(MEMORY[0x1895F90D0], a1, a2);
}

{
  return sincos(_:)(MEMORY[0x1895F90D8], a1, a2);
}

double sincospi(_:)(double a1, __n128 a2)
{
  return sincos(_:)(MEMORY[0x1895F90E0], a1, a2);
}

{
  return sincos(_:)(MEMORY[0x1895F90E8], a1, a2);
}

double sincos(_:)(void (*a1)(__int128 *, __int128 *), double a2, __n128 a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  a1(&v8, &v6);
  ((void (*)(__int128 *, __int128 *, __n128))a1)(&v9, &v7, a3);
  return *(double *)&v8;
}

{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  a1(&v8, &v6);
  ((void (*)(__int128 *, __int128 *, __n128))a1)(&v9, &v7, a3);
  return *(double *)&v8;
}

__n128 cos(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_cos_d2(a1);
  _simd_cos_d2(a2);
  return (__n128)v3;
}

__n128 cosh(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_cosh_d2(a1);
  _simd_cosh_d2(a2);
  return (__n128)v3;
}

__n128 cospi(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_cospi_d2(a1);
  _simd_cospi_d2(a2);
  return (__n128)v3;
}

__n128 acos(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_acos_d2(a1);
  _simd_acos_d2(a2);
  return (__n128)v3;
}

__n128 acosh(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_acosh_d2(a1);
  _simd_acosh_d2(a2);
  return (__n128)v3;
}

__n128 sin(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_sin_d2(a1);
  _simd_sin_d2(a2);
  return (__n128)v3;
}

__n128 sinh(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_sinh_d2(a1);
  _simd_sinh_d2(a2);
  return (__n128)v3;
}

__n128 sinpi(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_sinpi_d2(a1);
  _simd_sinpi_d2(a2);
  return (__n128)v3;
}

__n128 asin(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_asin_d2(a1);
  _simd_asin_d2(a2);
  return (__n128)v3;
}

__n128 asinh(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_asinh_d2(a1);
  _simd_asinh_d2(a2);
  return (__n128)v3;
}

__n128 tan(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_tan_d2(a1);
  _simd_tan_d2(a2);
  return (__n128)v3;
}

__n128 tanh(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_tanh_d2(a1);
  _simd_tanh_d2(a2);
  return (__n128)v3;
}

__n128 tanpi(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_tanpi_d2(a1);
  _simd_tanpi_d2(a2);
  return (__n128)v3;
}

__n128 atan(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_atan_d2(a1);
  _simd_atan_d2(a2);
  return (__n128)v3;
}

__n128 atanh(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_atanh_d2(a1);
  _simd_atanh_d2(a2);
  return (__n128)v3;
}

__n128 atan2(_:_:)(simd_double2 a1, simd_double2 a2, simd_double2 a3, simd_double2 a4)
{
  simd_double2 v5 = _simd_atan2_d2(a1, a3);
  _simd_atan2_d2(a2, a4);
  return (__n128)v5;
}

__n128 exp(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_exp_d2(a1);
  _simd_exp_d2(a2);
  return (__n128)v3;
}

__n128 exp2(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_exp2_d2(a1);
  _simd_exp2_d2(a2);
  return (__n128)v3;
}

__n128 exp10(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_exp10_d2(a1);
  _simd_exp10_d2(a2);
  return (__n128)v3;
}

__n128 expm1(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_expm1_d2(a1);
  _simd_expm1_d2(a2);
  return (__n128)v3;
}

__n128 log(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_log_d2(a1);
  _simd_log_d2(a2);
  return (__n128)v3;
}

__n128 log2(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_log2_d2(a1);
  _simd_log2_d2(a2);
  return (__n128)v3;
}

__n128 log10(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_log10_d2(a1);
  _simd_log10_d2(a2);
  return (__n128)v3;
}

__n128 log1p(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_log1p_d2(a1);
  _simd_log1p_d2(a2);
  return (__n128)v3;
}

__n128 lgamma(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_lgamma_d2(a1);
  _simd_lgamma_d2(a2);
  return (__n128)v3;
}

__n128 tgamma(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_tgamma_d2(a1);
  _simd_tgamma_d2(a2);
  return (__n128)v3;
}

__n128 erf(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_erf_d2(a1);
  _simd_erf_d2(a2);
  return (__n128)v3;
}

__n128 erfc(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_erfc_d2(a1);
  _simd_erfc_d2(a2);
  return (__n128)v3;
}

__n128 cbrt(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_cbrt_d2(a1);
  _simd_cbrt_d2(a2);
  return (__n128)v3;
}

__n128 pow(_:_:)(simd_double2 a1, simd_double2 a2, simd_double2 a3, simd_double2 a4)
{
  simd_double2 v5 = _simd_pow_d2(a1, a3);
  _simd_pow_d2(a2, a4);
  return (__n128)v5;
}

__n128 hypot(_:_:)(simd_double2 a1, simd_double2 a2, simd_double2 a3, simd_double2 a4)
{
  simd_double2 v5 = _simd_hypot_d2(a1, a3);
  _simd_hypot_d2(a2, a4);
  return (__n128)v5;
}

__n128 fmod(_:_:)(simd_double2 a1, simd_double2 a2, simd_double2 a3, simd_double2 a4)
{
  simd_double2 v5 = _simd_fmod_d2(a1, a3);
  _simd_fmod_d2(a2, a4);
  return (__n128)v5;
}

__n128 remainder(_:_:)(simd_double2 a1, simd_double2 a2, simd_double2 a3, simd_double2 a4)
{
  simd_double2 v5 = _simd_remainder_d2(a1, a3);
  _simd_remainder_d2(a2, a4);
  return (__n128)v5;
}

__n128 nextafter(_:_:)(simd_double2 a1, simd_double2 a2, simd_double2 a3, simd_double2 a4)
{
  simd_double2 v5 = _simd_nextafter_d2(a1, a3);
  _simd_nextafter_d2(a2, a4);
  return (__n128)v5;
}

double sincos(_:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q1>, __n128 a3@<Q2>, __n128 a4@<Q3>)
{
  *(void *)&double result = sincos(_:)(MEMORY[0x1895F90D0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = sincos(_:)(MEMORY[0x1895F90D8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double sincospi(_:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q1>, __n128 a3@<Q2>, __n128 a4@<Q3>)
{
  *(void *)&double result = sincos(_:)(MEMORY[0x1895F90E0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = sincos(_:)(MEMORY[0x1895F90E8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

__n128 sincos(_:)@<Q0>( void (*a1)(__n128 *, __int128 *)@<X0>, uint64_t a2@<X8>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __n128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  a1(&v21, &v17);
  ((void (*)(__int128 *, __int128 *, __n128))a1)(&v22, &v18, a3);
  ((void (*)(__int128 *, __int128 *, __n128))a1)(&v23, &v19, a4);
  ((void (*)(__int128 *, __int128 *, __n128))a1)(&v24, &v20, a5);
  __n128 result = v21;
  __int128 v8 = v22;
  __int128 v9 = v24;
  __int128 v10 = v17;
  __int128 v11 = v18;
  __int128 v12 = v19;
  __int128 v13 = v20;
  *(_OWORD *)(a2 + 32) = v23;
  *(_OWORD *)(a2 + 48) = v9;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v8;
  *(_OWORD *)(a2 + 96) = v12;
  *(_OWORD *)(a2 + 112) = v13;
  *(_OWORD *)(a2 + 64) = v10;
  *(_OWORD *)(a2 + 80) = v11;
  return result;
}

double cos(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F90], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F98], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double cosh(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FA0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FA8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double cospi(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FB0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FB8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double acos(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F10], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F18], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double acosh(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F20], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F28], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double sin(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F90C0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F90C8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double sinh(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F90F0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F90F8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double sinpi(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9100], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9108], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double asin(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F30], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F38], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double asinh(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F40], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F48], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double tan(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9110], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9118], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double tanh(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9120], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9128], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double tanpi(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9130], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9138], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double atan(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F60], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F68], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double atanh(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F70], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F78], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double atan2(_:_:)(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8)
{
  *(void *)&double result = atan2(_:_:)( (double (*)(__n128, __n128))MEMORY[0x1895F8F50],  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = atan2(_:_:)( (double (*)(__n128, __n128))MEMORY[0x1895F8F58],  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8).n128_u64[0];
  return result;
}

double exp(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9000], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9008], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double exp2(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FF0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FF8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double exp10(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FE0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FE8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double expm1(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9010], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9018], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double log(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9080], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9088], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double log2(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9070], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9078], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double log10(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9050], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9058], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double log1p(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9060], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9068], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double lgamma(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9040], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9048], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double tgamma(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9140], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F9148], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double erf(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FC0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FC8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double erfc(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FD0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8FD8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double cbrt(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F80], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = cos(_:)((double (*)(void))MEMORY[0x1895F8F88], a1, a2, a3, a4).n128_u64[0];
  return result;
}

__n128 cos(_:)(double (*a1)(void), double a2, __n128 a3, __n128 a4, __n128 a5)
{
  *(double *)&__int128 v6 = a1();
  __int128 v10 = v6;
  ((void (*)(__n128))a1)(a3);
  ((void (*)(__n128))a1)(a4);
  ((void (*)(__n128))a1)(a5);
  return (__n128)v10;
}

double pow(_:_:)(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8)
{
  *(void *)&double result = atan2(_:_:)( (double (*)(__n128, __n128))MEMORY[0x1895F90A0],  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = atan2(_:_:)( (double (*)(__n128, __n128))MEMORY[0x1895F90A8],  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8).n128_u64[0];
  return result;
}

double hypot(_:_:)(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8)
{
  *(void *)&double result = atan2(_:_:)( (double (*)(__n128, __n128))MEMORY[0x1895F9030],  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = atan2(_:_:)( (double (*)(__n128, __n128))MEMORY[0x1895F9038],  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8).n128_u64[0];
  return result;
}

double fma(_:_:_:)( float64x2_t a1, double a2, double a3, double a4, float64x2_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, float64x2_t a14)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_f64(a14, a5, a1);
  return result;
}

double fmod(_:_:)(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8)
{
  *(void *)&double result = atan2(_:_:)( (double (*)(__n128, __n128))MEMORY[0x1895F9020],  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = atan2(_:_:)( (double (*)(__n128, __n128))MEMORY[0x1895F9028],  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8).n128_u64[0];
  return result;
}

double remainder(_:_:)( __n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8)
{
  *(void *)&double result = atan2(_:_:)( (double (*)(__n128, __n128))MEMORY[0x1895F90B0],  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = atan2(_:_:)( (double (*)(__n128, __n128))MEMORY[0x1895F90B8],  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8).n128_u64[0];
  return result;
}

double nextafter(_:_:)( __n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8)
{
  *(void *)&double result = atan2(_:_:)( (double (*)(__n128, __n128))MEMORY[0x1895F9090],  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8).n128_u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = atan2(_:_:)( (double (*)(__n128, __n128))MEMORY[0x1895F9098],  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8).n128_u64[0];
  return result;
}

__n128 atan2(_:_:)( double (*a1)(__n128, __n128), __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8, __n128 a9)
{
  *(double *)&__int128 v10 = a1(a2, a6);
  __int128 v15 = v10;
  a1(a3, a7);
  a1(a4, a8);
  a1(a5, a9);
  return (__n128)v15;
}

double isfinite(_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
  unsigned __int16 v5 = vmovn_s16((int16x8_t)vbicq_s8( (int8x16_t)vuzp1q_s16( (int16x8_t)vuzp1q_s32( (int32x4_t)vorrq_s8( (int8x16_t)vcltzq_f64(a1),  (int8x16_t)vcgezq_f64(a1)),  (int32x4_t)vorrq_s8( (int8x16_t)vcltzq_f64(a2),  (int8x16_t)vcgezq_f64(a2))),  (int16x8_t)vuzp1q_s32( (int32x4_t)vorrq_s8( (int8x16_t)vcltzq_f64(a3),  (int8x16_t)vcgezq_f64(a3)),  (int32x4_t)vorrq_s8( (int8x16_t)vcltzq_f64(a4),  (int8x16_t)vcgezq_f64(a4)))),  (int8x16_t)vuzp1q_s16( (int16x8_t)vuzp1q_s32( (int32x4_t)vceqq_f64(vabsq_f64(a1), v4),  (int32x4_t)vceqq_f64(vabsq_f64(a2), v4)),  (int16x8_t)vuzp1q_s32( (int32x4_t)vceqq_f64(vabsq_f64(a3), v4),  (int32x4_t)vceqq_f64(vabsq_f64(a4), v4))))).u16[0];
  v6.i64[0] = v5;
  v6.i64[1] = HIBYTE(v5);
  *(void *)&double result = vcltzq_s64(vshlq_n_s64(v6, 0x3FuLL)).u64[0];
  return result;
}

double isnormal(_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  int8x16_t v4 = (int8x16_t)vuzp1q_s16( (int16x8_t)vuzp1q_s32( (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1)),  (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(a2), (int8x16_t)vcgezq_f64(a2))),  (int16x8_t)vuzp1q_s32( (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(a3), (int8x16_t)vcgezq_f64(a3)),  (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(a4), (int8x16_t)vcgezq_f64(a4))));
  float64x2_t v5 = vabsq_f64(a1);
  float64x2_t v6 = vabsq_f64(a2);
  float64x2_t v7 = vabsq_f64(a3);
  float64x2_t v8 = vabsq_f64(a4);
  float64x2_t v9 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
  float64x2_t v10 = (float64x2_t)vdupq_n_s64(0x10000000000000uLL);
  LOWORD(v8.f64[0]) = vmovn_s16((int16x8_t)vandq_s8( vbicq_s8( v4,  (int8x16_t)vuzp1q_s16( (int16x8_t)vuzp1q_s32( (int32x4_t)vceqq_f64(v5, v9),  (int32x4_t)vceqq_f64(v6, v9)),  (int16x8_t)vuzp1q_s32( (int32x4_t)vceqq_f64(v7, v9),  (int32x4_t)vceqq_f64(v8, v9)))),  (int8x16_t)vuzp1q_s16( (int16x8_t)vuzp1q_s32( (int32x4_t)vcgeq_f64(v5, v10),  (int32x4_t)vcgeq_f64(v6, v10)),  (int16x8_t)vuzp1q_s32( (int32x4_t)vcgeq_f64(v7, v10),  (int32x4_t)vcgeq_f64(v8, v10))))).u16[0];
  v11.i64[0] = LOBYTE(v8.f64[0]);
  v11.i64[1] = BYTE1(v8.f64[0]);
  *(void *)&double result = vcltzq_s64(vshlq_n_s64(v11, 0x3FuLL)).u64[0];
  return result;
}

double sincos(_:)(double a1)
{
  return sincos(_:)(MEMORY[0x1895F90D8], a1);
}

double sincospi(_:)(double a1)
{
  return sincos(_:)(MEMORY[0x1895F90E8], a1);
}

double sincos(_:)(void (*a1)(double *, __int128 *, __n128), double a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  a1(v4, &v3, (__n128)*(unint64_t *)&a2);
  return v4[0];
}

double cos(_:)(double a1)
{
  *(void *)&double result = _simd_cos_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double cosh(_:)(double a1)
{
  *(void *)&double result = _simd_cosh_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double cospi(_:)(double a1)
{
  *(void *)&double result = _simd_cospi_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double acos(_:)(double a1)
{
  *(void *)&double result = _simd_acos_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double acosh(_:)(double a1)
{
  *(void *)&double result = _simd_acosh_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double sin(_:)(double a1)
{
  *(void *)&double result = _simd_sin_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double sinh(_:)(double a1)
{
  *(void *)&double result = _simd_sinh_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double sinpi(_:)(double a1)
{
  *(void *)&double result = _simd_sinpi_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double asin(_:)(double a1)
{
  *(void *)&double result = _simd_asin_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double asinh(_:)(double a1)
{
  *(void *)&double result = _simd_asinh_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double tan(_:)(double a1)
{
  *(void *)&double result = _simd_tan_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double tanh(_:)(double a1)
{
  *(void *)&double result = _simd_tanh_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double tanpi(_:)(double a1)
{
  *(void *)&double result = _simd_tanpi_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double atan(_:)(double a1)
{
  *(void *)&double result = _simd_atan_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double atanh(_:)(double a1)
{
  *(void *)&double result = _simd_atanh_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double atan2(_:_:)(double a1, double a2)
{
  *(void *)&double result = _simd_atan2_f4((simd_float4)*(unint64_t *)&a1, (simd_float4)*(unint64_t *)&a2).u64[0];
  return result;
}

double exp(_:)(double a1)
{
  *(void *)&double result = _simd_exp_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double exp2(_:)(double a1)
{
  *(void *)&double result = _simd_exp2_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double exp10(_:)(double a1)
{
  *(void *)&double result = _simd_exp10_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double expm1(_:)(double a1)
{
  *(void *)&double result = _simd_expm1_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double log(_:)(double a1)
{
  *(void *)&double result = _simd_log_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double log2(_:)(double a1)
{
  *(void *)&double result = _simd_log2_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double log10(_:)(double a1)
{
  *(void *)&double result = _simd_log10_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double log1p(_:)(double a1)
{
  *(void *)&double result = _simd_log1p_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double lgamma(_:)(double a1)
{
  *(void *)&double result = _simd_lgamma_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double tgamma(_:)(double a1)
{
  *(void *)&double result = _simd_tgamma_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double erf(_:)(double a1)
{
  *(void *)&double result = _simd_erf_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double erfc(_:)(double a1)
{
  *(void *)&double result = _simd_erfc_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double cbrt(_:)(double a1)
{
  *(void *)&double result = _simd_cbrt_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double pow(_:_:)(double a1, double a2)
{
  *(void *)&double result = _simd_pow_f4((simd_float4)*(unint64_t *)&a1, (simd_float4)*(unint64_t *)&a2).u64[0];
  return result;
}

double hypot(_:_:)(double a1, double a2)
{
  *(void *)&double result = _simd_hypot_f4((simd_float4)*(unint64_t *)&a1, (simd_float4)*(unint64_t *)&a2).u64[0];
  return result;
}

float32x2_t fma(_:_:_:)(float32x2_t a1, float32x2_t a2, float32x2_t a3)
{
  return vmla_f32(a3, a2, a1);
}

double round(_:)(double a1)
{
  *(void *)&double result = vrndaq_f32((float32x4_t)*(unint64_t *)&a1).u64[0];
  return result;
}

double fmod(_:_:)(double a1, double a2)
{
  *(void *)&double result = _simd_fmod_f4((simd_float4)*(unint64_t *)&a1, (simd_float4)*(unint64_t *)&a2).u64[0];
  return result;
}

double remainder(_:_:)(double a1, double a2)
{
  *(void *)&double result = _simd_remainder_f4((simd_float4)*(unint64_t *)&a1, (simd_float4)*(unint64_t *)&a2).u64[0];
  return result;
}

double nextafter(_:_:)(double a1, double a2)
{
  *(void *)&double result = _simd_nextafter_f4((simd_float4)*(unint64_t *)&a1, (simd_float4)*(unint64_t *)&a2).u64[0];
  return result;
}

int8x8_t isfinite(_:)(float32x2_t a1)
{
  return vbic_s8( vorr_s8((int8x8_t)vcltz_f32(a1), (int8x8_t)vcgez_f32(a1)),  (int8x8_t)vceq_f32( (float32x2_t)(*(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL),  (float32x2_t)vdup_n_s32(0x7F800000u)));
}

int32x2_t isinf(_:)(double a1)
{
  return vceq_f32((float32x2_t)(*(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL), (float32x2_t)vdup_n_s32(0x7F800000u));
}

int8x8_t isnan(_:)(float32x2_t a1)
{
  return vmvn_s8(vorr_s8((int8x8_t)vcltz_f32(a1), (int8x8_t)vcgez_f32(a1)));
}

int8x8_t isnormal(_:)(float32x2_t a1)
{
  return vand_s8( vbic_s8( vorr_s8((int8x8_t)vcltz_f32(a1), (int8x8_t)vcgez_f32(a1)),  (int8x8_t)vceq_f32( (float32x2_t)(*(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL),  (float32x2_t)vdup_n_s32(0x7F800000u))),  (int8x8_t)vcge_f32((float32x2_t)(*(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL), (float32x2_t)0x80000000800000LL));
}

double sincos(_:)(__n128 a1)
{
  return sincos(_:)(MEMORY[0x1895F90D8], a1);
}

double sincospi(_:)(__n128 a1)
{
  return sincos(_:)(MEMORY[0x1895F90E8], a1);
}

double sincos(_:)(void (*a1)(double *, __int128 *, __n128), __n128 a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  a2.n128_u32[3] = 0;
  a1(v4, &v3, a2);
  return v4[0];
}

double cos(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_cos_f4(a1).u64[0];
  return result;
}

double cosh(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_cosh_f4(a1).u64[0];
  return result;
}

double cospi(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_cospi_f4(a1).u64[0];
  return result;
}

double acos(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_acos_f4(a1).u64[0];
  return result;
}

double acosh(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_acosh_f4(a1).u64[0];
  return result;
}

double sin(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_sin_f4(a1).u64[0];
  return result;
}

double sinh(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_sinh_f4(a1).u64[0];
  return result;
}

double sinpi(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_sinpi_f4(a1).u64[0];
  return result;
}

double asin(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_asin_f4(a1).u64[0];
  return result;
}

double asinh(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_asinh_f4(a1).u64[0];
  return result;
}

double tan(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_tan_f4(a1).u64[0];
  return result;
}

double tanh(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_tanh_f4(a1).u64[0];
  return result;
}

double tanpi(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_tanpi_f4(a1).u64[0];
  return result;
}

double atan(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_atan_f4(a1).u64[0];
  return result;
}

double atanh(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_atanh_f4(a1).u64[0];
  return result;
}

double atan2(_:_:)(simd_float4 a1, simd_float4 a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  *(void *)&double result = _simd_atan2_f4(a1, a2).u64[0];
  return result;
}

double exp(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_exp_f4(a1).u64[0];
  return result;
}

double exp2(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_exp2_f4(a1).u64[0];
  return result;
}

double exp10(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_exp10_f4(a1).u64[0];
  return result;
}

double expm1(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_expm1_f4(a1).u64[0];
  return result;
}

double log(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_log_f4(a1).u64[0];
  return result;
}

double log2(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_log2_f4(a1).u64[0];
  return result;
}

double log10(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_log10_f4(a1).u64[0];
  return result;
}

double log1p(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_log1p_f4(a1).u64[0];
  return result;
}

double lgamma(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_lgamma_f4(a1).u64[0];
  return result;
}

double tgamma(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_tgamma_f4(a1).u64[0];
  return result;
}

double erf(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_erf_f4(a1).u64[0];
  return result;
}

double erfc(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_erfc_f4(a1).u64[0];
  return result;
}

double cbrt(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_cbrt_f4(a1).u64[0];
  return result;
}

double pow(_:_:)(simd_float4 a1, simd_float4 a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  *(void *)&double result = _simd_pow_f4(a1, a2).u64[0];
  return result;
}

double hypot(_:_:)(simd_float4 a1, simd_float4 a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  *(void *)&double result = _simd_hypot_f4(a1, a2).u64[0];
  return result;
}

double fma(_:_:_:)(float32x4_t a1, float32x4_t a2, float32x4_t a3)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  a3.i32[3] = 0;
  a1.i64[0] = vmlaq_f32(a3, a2, a1).u64[0];
  return *(double *)a1.i64;
}

{
  double result;
  *(void *)&double result = vmlaq_f32(a3, a2, a1).u64[0];
  return result;
}

double round(_:)(float32x4_t a1)
{
  a1.i32[3] = 0;
  a1.i64[0] = vrndaq_f32(a1).u64[0];
  return *(double *)a1.i64;
}

{
  double result;
  *(void *)&double result = vrndaq_f32(a1).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vrndaq_f32(a1).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vrndaq_f32(a1).u64[0];
  return result;
}

double fmod(_:_:)(simd_float4 a1, simd_float4 a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  *(void *)&double result = _simd_fmod_f4(a1, a2).u64[0];
  return result;
}

double remainder(_:_:)(simd_float4 a1, simd_float4 a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  *(void *)&double result = _simd_remainder_f4(a1, a2).u64[0];
  return result;
}

double nextafter(_:_:)(simd_float4 a1, simd_float4 a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  *(void *)&double result = _simd_nextafter_f4(a1, a2).u64[0];
  return result;
}

double isfinite(_:)(float32x4_t a1)
{
  *(void *)&double result = vbicq_s8( vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)),  (int8x16_t)vceqq_f32(vabsq_f32(a1), (float32x4_t)vdupq_n_s32(0x7F800000u))).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vbicq_s8( vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)),  (int8x16_t)vceqq_f32( (float32x4_t)(*(_OWORD *)&a1 & __PAIR128__( 0x7FFFFFFF7FFFFFFFLL,  0x7FFFFFFF7FFFFFFFLL)),  (float32x4_t)vdupq_n_s32(0x7F800000u))).u64[0];
  return result;
}

double isinf(_:)(float32x4_t a1)
{
  *(void *)&double result = vceqq_f32(vabsq_f32(a1), (float32x4_t)vdupq_n_s32(0x7F800000u)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vceqq_f32(vabsq_f32(a1), (float32x4_t)vdupq_n_s32(0x7F800000u)).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vceqq_f32(vabsq_f32(a1), (float32x4_t)vdupq_n_s32(0x7F800000u)).u64[0];
  return result;
}

double isnan(_:)(float32x4_t a1)
{
  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1))).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1))).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1))).u64[0];
  return result;
}

{
  double result;
  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1))).u64[0];
  return result;
}

double isnormal(_:)(float32x4_t a1)
{
  int8x16_t v1 = vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1));
  float32x4_t v2 = vabsq_f32(a1);
  v3.i64[0] = 0x80000000800000LL;
  v3.i64[1] = 0x80000000800000LL;
  *(void *)&double result = vandq_s8( vbicq_s8(v1, (int8x16_t)vceqq_f32(v2, (float32x4_t)vdupq_n_s32(0x7F800000u))),  (int8x16_t)vcgeq_f32(v2, v3)).u64[0];
  return result;
}

{
  float32x4_t v1;
  double result;
  v1.i64[0] = 0x80000000800000LL;
  v1.i64[1] = 0x80000000800000LL;
  *(void *)&double result = vandq_s8( vbicq_s8( vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)),  (int8x16_t)vceqq_f32( (float32x4_t)(*(_OWORD *)&a1 & __PAIR128__( 0x7FFFFFFF7FFFFFFFLL,  0x7FFFFFFF7FFFFFFFLL)),  (float32x4_t)vdupq_n_s32(0x7F800000u))),  (int8x16_t)vcgeq_f32( (float32x4_t)(*(_OWORD *)&a1 & __PAIR128__( 0x7FFFFFFF7FFFFFFFLL,  0x7FFFFFFF7FFFFFFFLL)),  v1)).u64[0];
  return result;
}

double isinf(_:)(__n128 a1)
{
  *(void *)&double result = vceqq_f32( (float32x4_t)(*(_OWORD *)&a1 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)),  (float32x4_t)vdupq_n_s32(0x7F800000u)).u64[0];
  return result;
}

__n128 cos(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_cos_f4(a1);
  _simd_cos_f4(a2);
  return (__n128)v3;
}

__n128 cosh(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_cosh_f4(a1);
  _simd_cosh_f4(a2);
  return (__n128)v3;
}

__n128 cospi(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_cospi_f4(a1);
  _simd_cospi_f4(a2);
  return (__n128)v3;
}

__n128 acos(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_acos_f4(a1);
  _simd_acos_f4(a2);
  return (__n128)v3;
}

__n128 acosh(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_acosh_f4(a1);
  _simd_acosh_f4(a2);
  return (__n128)v3;
}

__n128 sin(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_sin_f4(a1);
  _simd_sin_f4(a2);
  return (__n128)v3;
}

__n128 sinh(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_sinh_f4(a1);
  _simd_sinh_f4(a2);
  return (__n128)v3;
}

__n128 sinpi(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_sinpi_f4(a1);
  _simd_sinpi_f4(a2);
  return (__n128)v3;
}

__n128 asin(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_asin_f4(a1);
  _simd_asin_f4(a2);
  return (__n128)v3;
}

__n128 asinh(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_asinh_f4(a1);
  _simd_asinh_f4(a2);
  return (__n128)v3;
}

__n128 tan(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_tan_f4(a1);
  _simd_tan_f4(a2);
  return (__n128)v3;
}

__n128 tanh(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_tanh_f4(a1);
  _simd_tanh_f4(a2);
  return (__n128)v3;
}

__n128 tanpi(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_tanpi_f4(a1);
  _simd_tanpi_f4(a2);
  return (__n128)v3;
}

__n128 atan(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_atan_f4(a1);
  _simd_atan_f4(a2);
  return (__n128)v3;
}

__n128 atanh(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_atanh_f4(a1);
  _simd_atanh_f4(a2);
  return (__n128)v3;
}

__n128 atan2(_:_:)(simd_float4 a1, simd_float4 a2, simd_float4 a3, simd_float4 a4)
{
  simd_float4 v5 = _simd_atan2_f4(a1, a3);
  _simd_atan2_f4(a2, a4);
  return (__n128)v5;
}

__n128 exp(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_exp_f4(a1);
  _simd_exp_f4(a2);
  return (__n128)v3;
}

__n128 exp2(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_exp2_f4(a1);
  _simd_exp2_f4(a2);
  return (__n128)v3;
}

__n128 exp10(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_exp10_f4(a1);
  _simd_exp10_f4(a2);
  return (__n128)v3;
}

__n128 expm1(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_expm1_f4(a1);
  _simd_expm1_f4(a2);
  return (__n128)v3;
}

__n128 log(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_log_f4(a1);
  _simd_log_f4(a2);
  return (__n128)v3;
}

__n128 log2(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_log2_f4(a1);
  _simd_log2_f4(a2);
  return (__n128)v3;
}

__n128 log10(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_log10_f4(a1);
  _simd_log10_f4(a2);
  return (__n128)v3;
}

__n128 log1p(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_log1p_f4(a1);
  _simd_log1p_f4(a2);
  return (__n128)v3;
}

__n128 lgamma(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_lgamma_f4(a1);
  _simd_lgamma_f4(a2);
  return (__n128)v3;
}

__n128 tgamma(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_tgamma_f4(a1);
  _simd_tgamma_f4(a2);
  return (__n128)v3;
}

__n128 erf(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_erf_f4(a1);
  _simd_erf_f4(a2);
  return (__n128)v3;
}

__n128 erfc(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_erfc_f4(a1);
  _simd_erfc_f4(a2);
  return (__n128)v3;
}

__n128 cbrt(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_cbrt_f4(a1);
  _simd_cbrt_f4(a2);
  return (__n128)v3;
}

__n128 pow(_:_:)(simd_float4 a1, simd_float4 a2, simd_float4 a3, simd_float4 a4)
{
  simd_float4 v5 = _simd_pow_f4(a1, a3);
  _simd_pow_f4(a2, a4);
  return (__n128)v5;
}

__n128 hypot(_:_:)(simd_float4 a1, simd_float4 a2, simd_float4 a3, simd_float4 a4)
{
  simd_float4 v5 = _simd_hypot_f4(a1, a3);
  _simd_hypot_f4(a2, a4);
  return (__n128)v5;
}

double fma(_:_:_:)(float32x4_t a1, double a2, float32x4_t a3, double a4, float32x4_t a5)
{
  *(void *)&double result = vmlaq_f32(a5, a3, a1).u64[0];
  return result;
}

__n128 fmod(_:_:)(simd_float4 a1, simd_float4 a2, simd_float4 a3, simd_float4 a4)
{
  simd_float4 v5 = _simd_fmod_f4(a1, a3);
  _simd_fmod_f4(a2, a4);
  return (__n128)v5;
}

__n128 remainder(_:_:)(simd_float4 a1, simd_float4 a2, simd_float4 a3, simd_float4 a4)
{
  simd_float4 v5 = _simd_remainder_f4(a1, a3);
  _simd_remainder_f4(a2, a4);
  return (__n128)v5;
}

__n128 nextafter(_:_:)(simd_float4 a1, simd_float4 a2, simd_float4 a3, simd_float4 a4)
{
  simd_float4 v5 = _simd_nextafter_f4(a1, a3);
  _simd_nextafter_f4(a2, a4);
  return (__n128)v5;
}

double isfinite(_:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = (float32x4_t)vdupq_n_s32(0x7F800000u);
  int16x8_t v3 = (int16x8_t)vbicq_s8( (int8x16_t)vuzp1q_s16( (int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)),  (int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a2), (int8x16_t)vcgezq_f32(a2))),  (int8x16_t)vuzp1q_s16( (int16x8_t)vceqq_f32(vabsq_f32(a1), v2),  (int16x8_t)vceqq_f32(vabsq_f32(a2), v2)));
  *(void *)&double result = vcltzq_s32( vshlq_n_s32( (int32x4_t)vmovl_u16((uint16x4_t)vzip1_s8(vmovn_s16(v3), *(int8x8_t *)v3.i8)),  0x1FuLL)).u64[0];
  return result;
}

{
  int8x8_t v2;
  float32x4_t v3;
  int8x8_t v4;
  double result;
  float32x4_t v2 = vmovn_s16( vuzp1q_s16( (int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)),  (int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a2), (int8x16_t)vcgezq_f32(a2))));
  int16x8_t v3 = (float32x4_t)vdupq_n_s32(0x7F800000u);
  int8x16_t v4 = vmovn_s16((int16x8_t)vmvnq_s8((int8x16_t)vuzp1q_s16( (int16x8_t)vceqq_f32(vabsq_f32(a1), v3),  (int16x8_t)vceqq_f32(vabsq_f32(a2), v3))));
  *(void *)&double result = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vzip1_s8(vand_s8(v4, v2), v4)), 0x1FuLL)).u64[0];
  return result;
}

double isnormal(_:)(float32x4_t a1, float32x4_t a2)
{
  int8x16_t v2 = (int8x16_t)vuzp1q_s16( (int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)),  (int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a2), (int8x16_t)vcgezq_f32(a2)));
  float32x4_t v3 = vabsq_f32(a1);
  float32x4_t v4 = vabsq_f32(a2);
  float32x4_t v5 = (float32x4_t)vdupq_n_s32(0x7F800000u);
  int8x16_t v6 = vbicq_s8(v2, (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v3, v5), (int16x8_t)vceqq_f32(v4, v5)));
  v5.i64[0] = 0x80000000800000LL;
  v5.i64[1] = 0x80000000800000LL;
  int16x8_t v7 = (int16x8_t)vandq_s8(v6, (int8x16_t)vuzp1q_s16((int16x8_t)vcgeq_f32(v3, v5), (int16x8_t)vcgeq_f32(v4, v5)));
  *(void *)&double result = vcltzq_s32( vshlq_n_s32( (int32x4_t)vmovl_u16((uint16x4_t)vzip1_s8(vmovn_s16(v7), *(int8x8_t *)v7.i8)),  0x1FuLL)).u64[0];
  return result;
}

{
  int8x8_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  int8x8_t v6;
  float32x4_t v7;
  double result;
  int8x16_t v2 = vmovn_s16( vuzp1q_s16( (int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)),  (int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a2), (int8x16_t)vcgezq_f32(a2))));
  float32x4_t v3 = vabsq_f32(a1);
  float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x7F800000u);
  float32x4_t v5 = vabsq_f32(a2);
  int8x16_t v6 = vmovn_s16((int16x8_t)vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v3, v4), (int16x8_t)vceqq_f32(v5, v4))));
  v7.i64[0] = 0x80000000800000LL;
  v7.i64[1] = 0x80000000800000LL;
  *(int8x8_t *)v3.f32 = vand_s8(v2, vmovn_s16(vuzp1q_s16((int16x8_t)vcgeq_f32(v3, v7), (int16x8_t)vcgeq_f32(v5, v7))));
  *(void *)&double result = vcltzq_s32( vshlq_n_s32( (int32x4_t)vmovl_u16((uint16x4_t)vzip1_s8( vand_s8(v6, *(int8x8_t *)v3.f32),  *(int8x8_t *)v3.f32)),  0x1FuLL)).u64[0];
  return result;
}

double fma(_:_:_:)( float32x4_t a1, double a2, double a3, double a4, float32x4_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, float32x4_t a14)
{
  *(void *)&double result = vmlaq_f32(a14, a5, a1).u64[0];
  return result;
}

double ceil(_:)(int8x16_t _Q0, __n128 _Q1)
{
  __asm { FCVT            S2, H0 }

  _Q0.i16[1] = _Q1.n128_u16[0];
  v7.i64[0] = 0x3C003C003C003C00LL;
  v7.i64[1] = 0x3C003C003C003C00LL;
  _Q4 = vandq_s8(_Q0, v7);
  _H5 = _Q4.i16[7];
  __asm { FCVT            S5, H5 }

  _S6 = _S5 + _S5;
  __asm
  {
    FCVT            H6, S6
    FCVT            S6, H6
  }

  _S6 = 1.0 - _S6;
  __asm { FCVT            H6, S6 }

  _H16 = _Q4.i16[6];
  __asm { FCVT            S16, H16 }

  _S17 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  _S17 = 1.0 - _S17;
  __asm { FCVT            H17, S17 }

  _H18 = _Q4.i16[4];
  __asm { FCVT            S18, H18 }

  _S19 = _S18 + _S18;
  __asm
  {
    FCVT            H19, S19
    FCVT            S19, H19
  }

  *(float *)_D19.i32 = 1.0 - _S19;
  __asm { FCVT            H19, S19 }

  _H20 = _Q4.i16[5];
  __asm { FCVT            S20, H20 }

  _S21 = _S20 + _S20;
  __asm
  {
    FCVT            H21, S21
    FCVT            S21, H21
  }

  _S21 = 1.0 - _S21;
  _H22 = _Q4.i16[3];
  __asm { FCVT            S22, H22 }

  _S23 = _S22 + _S22;
  __asm
  {
    FCVT            H23, S23
    FCVT            S23, H23
  }

  _S23 = 1.0 - _S23;
  __asm { FCVT            H23, S23 }

  _H24 = _Q4.i16[2];
  __asm { FCVT            S24, H24 }

  _S25 = _S24 + _S24;
  __asm
  {
    FCVT            H25, S25
    FCVT            S25, H25
  }

  _S25 = 1.0 - _S25;
  __asm
  {
    FCVT            H25, S25
    FCVT            S26, H4
  }

  _S27 = _S26 + _S26;
  __asm
  {
    FCVT            H27, S27
    FCVT            S27, H27
  }

  *(float *)_D27.i32 = 1.0 - _S27;
  __asm { FCVT            H27, S27 }

  _Q4.i16[0] = _Q4.i16[1];
  __asm { FCVT            S4, H4 }

  _S28 = *(float *)_Q4.i32 + *(float *)_Q4.i32;
  __asm
  {
    FCVT            H28, S28
    FCVT            S28, H28
  }

  _S7 = 1.0 - _S28;
  __asm { FCVT            H7, S7 }

  _D27.i16[1] = LOWORD(_S7);
  _D27.i16[2] = LOWORD(_S25);
  _D27.i16[3] = LOWORD(_S23);
  __asm { FCVT            H7, S21 }

  _D19.i16[1] = LOWORD(_S7);
  *(int8x8_t *)v46.i8 = vand_s8(_D27, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D27))));
  _D19.i16[2] = LOWORD(_S17);
  _D19.i16[3] = LOWORD(_S6);
  v46.u64[1] = (unint64_t)vand_s8(_D19, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D19))));
  else {
    __int16 v47 = -1;
  }
  if (_S26 >= 1024.0) {
    __int16 v48 = 0;
  }
  else {
    __int16 v48 = -1;
  }
  v49.i16[0] = v48;
  v49.i16[1] = v47;
  if (_S24 >= 1024.0) {
    __int16 v50 = 0;
  }
  else {
    __int16 v50 = -1;
  }
  v49.i16[2] = v50;
  if (_S22 >= 1024.0) {
    __int16 v51 = 0;
  }
  else {
    __int16 v51 = -1;
  }
  v49.i16[3] = v51;
  if (_S18 >= 1024.0) {
    __int16 v52 = 0;
  }
  else {
    __int16 v52 = -1;
  }
  v49.i16[4] = v52;
  if (_S20 >= 1024.0) {
    __int16 v53 = 0;
  }
  else {
    __int16 v53 = -1;
  }
  v49.i16[5] = v53;
  if (_S16 >= 1024.0) {
    __int16 v54 = 0;
  }
  else {
    __int16 v54 = -1;
  }
  v49.i16[6] = v54;
  if (_S5 >= 1024.0) {
    __int16 v55 = 0;
  }
  else {
    __int16 v55 = -1;
  }
  v49.i16[7] = v55;
  _Q4 = vandq_s8(vornq_s8(vandq_s8(v46, v49), v49), _Q0);
  _H5 = _Q4.i16[1];
  __asm
  {
    FCVT            S1, H1
    FCVT            S5, H5
  }

  if (_S1 <= _S5) {
    __int16 v60 = 0;
  }
  else {
    __int16 v60 = -1;
  }
  __asm { FCVT            S1, H4 }

  if (_S2 <= _S1) {
    __int16 v62 = 0;
  }
  else {
    __int16 v62 = -1;
  }
  LOWORD(v63) = v62;
  HIWORD(v63) = v60;
  _H6 = _Q4.i16[7];
  _H7 = _Q4.i16[6];
  _H16 = _Q4.i16[5];
  _H17 = _Q4.i16[3];
  _H18 = _Q4.i16[2];
  _Q2 = vandq_s8(v7, (int8x16_t)v63);
  _H3 = _Q2.i16[1];
  __asm { FCVT            S3, H3 }

  _S3 = _S3 + _S5;
  __asm
  {
    FCVT            H3, S3
    FCVT            S5, H2
  }

  *(float *)&_Q1 = _S5 + _S1;
  __asm { FCVT            H1, S1 }

  WORD1(_Q1) = LOWORD(_S3);
  LOWORD(_S3) = _Q2.i16[2];
  __asm
  {
    FCVT            S3, H3
    FCVT            S5, H18
  }

  _S3 = _S3 + _S5;
  __asm { FCVT            H3, S3 }

  WORD2(_Q1) = LOWORD(_S3);
  LOWORD(_S3) = _Q2.i16[3];
  __asm
  {
    FCVT            S3, H3
    FCVT            S5, H17
  }

  _S3 = _S3 + _S5;
  __asm { FCVT            H3, S3 }

  WORD3(_Q1) = LOWORD(_S3);
  LOWORD(_S3) = _Q4.i16[4];
  _H4 = _Q2.i16[4];
  __asm
  {
    FCVT            S4, H4
    FCVT            S3, H3
  }

  _S3 = _S4 + _S3;
  __asm { FCVT            H3, S3 }

  WORD4(_Q1) = LOWORD(_S3);
  LOWORD(_S3) = _Q2.i16[5];
  __asm
  {
    FCVT            S3, H3
    FCVT            S4, H16
  }

  _S3 = _S3 + _S4;
  __asm { FCVT            H3, S3 }

  WORD5(_Q1) = LOWORD(_S3);
  LOWORD(_S3) = _Q2.i16[6];
  __asm
  {
    FCVT            S3, H3
    FCVT            S4, H7
  }

  _S3 = _S3 + _S4;
  __asm { FCVT            H3, S3 }

  WORD6(_Q1) = LOWORD(_S3);
  _Q2.i16[0] = _Q2.i16[7];
  __asm
  {
    FCVT            S2, H2
    FCVT            S3, H6
  }

  *(float *)_Q2.i32 = *(float *)_Q2.i32 + _S3;
  __asm { FCVT            H2, S2 }

  HIWORD(_Q1) = _Q2.i16[0];
  _Q2.i64[0] = 0x8000800080008000LL;
  _Q2.i64[1] = 0x8000800080008000LL;
  *(void *)&double result = vorrq_s8( (int8x16_t)(_Q1 & __PAIR128__(0x7FFF7FFF7FFF7FFFLL, 0x7FFF7FFF7FFF7FFFLL)),  vandq_s8(_Q0, _Q2)).u64[0];
  return result;
}

__n128 floor(_:)(int8x16_t _Q0, int8x16_t _Q1)
{
  __asm { FCVT            S2, H0 }

  _Q0.i16[1] = _Q1.i16[0];
  v7.i64[0] = 0x3C003C003C003C00LL;
  v7.i64[1] = 0x3C003C003C003C00LL;
  _Q4 = vandq_s8(_Q0, v7);
  _H5 = _Q4.i16[3];
  __asm { FCVT            S5, H5 }

  _S5 = _S5 + _S5;
  __asm
  {
    FCVT            H5, S5
    FCVT            S5, H5
  }

  _S5 = 1.0 - _S5;
  __asm { FCVT            H5, S5 }

  _H7 = _Q4.i16[2];
  __asm { FCVT            S7, H7 }

  _S7 = _S7 + _S7;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H7
  }

  _S7 = 1.0 - _S7;
  __asm
  {
    FCVT            H7, S7
    FCVT            S16, H4
  }

  _S17 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  *(float *)_D17.i32 = 1.0 - _S17;
  __asm { FCVT            H17, S17 }

  _Q4.i16[0] = _Q4.i16[1];
  __asm { FCVT            S4, H4 }

  _S18 = *(float *)_Q4.i32 + *(float *)_Q4.i32;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S6 = 1.0 - _S18;
  __asm { FCVT            H6, S6 }

  _D17.i16[1] = LOWORD(_S6);
  _D17.i16[2] = LOWORD(_S7);
  _D17.i16[3] = LOWORD(_S5);
  int32x4_t v26 = vclezq_f32(vcvtq_f32_f16(_D17));
  *(int8x8_t *)v26.i8 = vand_s8((int8x8_t)_D17, (int8x8_t)vmovn_s32(v26));
  else {
    __int16 v27 = -1;
  }
  if (_S16 >= 1024.0) {
    __int16 v28 = 0;
  }
  else {
    __int16 v28 = -1;
  }
  _Q4.i16[0] = v28;
  _Q4.i16[1] = v27;
  _S0 = vandq_s8(vornq_s8(vandq_s8((int8x16_t)v26, _Q4), _Q4), _Q0).u32[0];
  _H4 = HIWORD(_S0);
  __asm
  {
    FCVT            S1, H1
    FCVT            S4, H4
  }

  if (_S1 >= _S4) {
    unsigned __int16 v33 = 0;
  }
  else {
    unsigned __int16 v33 = -1;
  }
  __asm { FCVT            S0, H0 }

  if (_S2 >= _S0) {
    unsigned __int16 v35 = 0;
  }
  else {
    unsigned __int16 v35 = -1;
  }
  _Q1.i16[0] = v35;
  _Q1.i16[1] = v33;
  _S2 = vandq_s8(v7, _Q1).u32[0];
  _H1 = HIWORD(_S2);
  __asm { FCVT            S1, H1 }

  _S1 = _S4 - _S1;
  __asm
  {
    FCVT            H1, S1
    FCVT            S2, H2
  }

  _S0 = _S0 - _S2;
  __asm { FCVT            H0, S0 }

  result.n128_u16[1] = LOWORD(_S1);
  return result;
}

double trunc(_:)(int8x16_t a1, __n128 a2)
{
  a1.i16[1] = a2.n128_u16[0];
  v2.i64[0] = 0x3C003C003C003C00LL;
  v2.i64[1] = 0x3C003C003C003C00LL;
  _Q1 = vandq_s8(a1, v2);
  float32x4_t v4 = vcvtq_f32_f16(*(float16x4_t *)_Q1.i8);
  __asm { FMOV            V3.4S, #1.0 }

  *(float16x4_t *)v4.f32 = vcvt_f16_f32(vsubq_f32(_Q3, vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v4, v4)))));
  *(int8x8_t *)v10.i8 = vbsl_s8( (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16(*(float16x4_t *)v4.f32))),  *(int8x8_t *)v4.f32,  0LL);
  v10.i64[1] = a1.i64[0];
  _Q3.i16[0] = _Q1.i16[1];
  __asm { FCVT            S3, H3 }

  if (_Q3.f32[0] >= 1024.0) {
    __int16 v11 = 0;
  }
  else {
    __int16 v11 = -1;
  }
  __asm { FCVT            S1, H1 }

  if (_S1 >= 1024.0) {
    __int16 v13 = 0;
  }
  else {
    __int16 v13 = -1;
  }
  _Q1.i16[0] = v13;
  _Q1.i16[1] = v11;
  *(void *)&double result = vandq_s8(vornq_s8(vandq_s8(v10, _Q1), _Q1), a1).u64[0];
  return result;
}

double rint(_:)(int8x16_t _Q0, __n128 _Q1, int8x16_t _Q2)
{
  __asm { FCVT            S2, H0 }

  _Q0.i16[1] = _Q1.n128_u16[0];
  v7.i64[0] = 0x8000800080008000LL;
  v7.i64[1] = 0x8000800080008000LL;
  _S3 = vandq_s8(_Q0, v7).u32[0];
  _S4 = fabsf(*(float *)_Q0.i32);
  __asm { FCVT            H4, S4 }

  _S5 = fabsf(*(float *)_Q2.i32);
  __asm
  {
    FCVT            H5, S5
    FCVT            S1, H1
  }

  _S6 = fabsf(_S1);
  __asm
  {
    FCVT            H6, S6
    FCVT            S6, H6
  }

  if (_S6 >= 1024.0) {
    __int16 v16 = 0;
  }
  else {
    __int16 v16 = -1;
  }
  __asm { FCVT            S5, H5 }

  if (_S5 >= 1024.0) {
    __int16 v18 = 0;
  }
  else {
    __int16 v18 = -1;
  }
  __int16 v19 = v16;
  __asm { FCVT            S4, H4 }

  if (_S4 >= 1024.0) {
    __int16 v21 = 0;
  }
  else {
    __int16 v21 = -1;
  }
  LOWORD(_S3) = _S3 | 0x6400;
  __asm { FCVT            S4, H3 }

  *(float *)_Q2.i32 = *(float *)_Q2.i32 + _S4;
  __asm { FCVT            H2, S2 }

  _H3 = HIWORD(_S3) | 0x6400;
  __asm { FCVT            S3, H3 }

  _S1 = _S1 + _S3;
  __asm
  {
    FCVT            H1, S1
    FCVT            S1, H1
  }

  _S1 = _S1 - _S3;
  __asm
  {
    FCVT            H1, S1
    FCVT            S2, H2
  }

  *(float *)_Q2.i32 = *(float *)_Q2.i32 - _S4;
  __asm { FCVT            H2, S2 }

  _Q2.i16[1] = LOWORD(_S1);
  v28.i16[0] = v18 & 0x7FFF;
  v28.i16[1] = v19 & 0x7FFF;
  v28.i16[2] = v21 & 0x7FFF;
  v28.i16[3] = v21 & 0x7FFF;
  v28.i16[4] = v21 & 0x7FFF;
  v28.i16[5] = v21 & 0x7FFF;
  v28.i16[6] = v21 & 0x7FFF;
  v28.i16[7] = v21 & 0x7FFF;
  *(void *)&double result = vbslq_s8(v28, _Q2, _Q0).u64[0];
  return result;
}

float sqrt(_:)()
{
  float v1 = v0;
  __sqrtf16();
  return v1;
}

__n128 abs(_:)(__n128 _Q0, __n128 _Q1)
{
  __asm { FCVT            S1, H1 }

  _S1 = fabsf(_S1);
  __asm
  {
    FCVT            H1, S1
    FCVT            S0, H0
  }

  _S0 = fabsf(_S0);
  __asm { FCVT            H0, S0 }

  result.n128_u16[1] = LOWORD(_S1);
  return result;
}

int8x8_t min(_:_:)(float16x4_t a1, __n128 a2, float16x4_t a3, __n128 a4)
{
  a1.i16[1] = a2.n128_u16[0];
  a3.i16[1] = a4.n128_u16[0];
  float32x4_t v4 = vcvtq_f32_f16(a3);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(v4, vcvtq_f32_f16(a1))),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v4), (int8x16_t)vcgezq_f32(v4)))),  (int8x8_t)a1,  (int8x8_t)a3);
}

int8x8_t max(_:_:)(float16x4_t a1, __n128 a2, float16x4_t a3, __n128 a4)
{
  a1.i16[1] = a2.n128_u16[0];
  a3.i16[1] = a4.n128_u16[0];
  float32x4_t v4 = vcvtq_f32_f16(a3);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(vcvtq_f32_f16(a1), v4)),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v4), (int8x16_t)vcgezq_f32(v4)))),  (int8x8_t)a1,  (int8x8_t)a3);
}

int8x8_t min(_:_:)(float16x4_t a1, __n128 a2, int16x4_t a3)
{
  a1.i16[1] = a2.n128_u16[0];
  float16x4_t v3 = (float16x4_t)vdup_lane_s16(a3, 0);
  float32x4_t v4 = vcvtq_f32_f16(v3);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(v4, vcvtq_f32_f16(a1))),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v4), (int8x16_t)vcgezq_f32(v4)))),  (int8x8_t)a1,  (int8x8_t)v3);
}

int8x8_t max(_:_:)(float16x4_t a1, __n128 a2, int16x4_t a3)
{
  a1.i16[1] = a2.n128_u16[0];
  float16x4_t v3 = (float16x4_t)vdup_lane_s16(a3, 0);
  float32x4_t v4 = vcvtq_f32_f16(v3);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(vcvtq_f32_f16(a1), v4)),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v4), (int8x16_t)vcgezq_f32(v4)))),  (int8x8_t)a1,  (int8x8_t)v3);
}

int8x8_t ceil(_:)(int8x8_t _D0)
{
  *(int8x8_t *)v1.i8 = _D0;
  v1.u64[1] = (unint64_t)_D0;
  _Q2.i64[0] = 0x3C003C003C003C00LL;
  _Q2.i64[1] = 0x3C003C003C003C00LL;
  _Q19 = vandq_s8(v1, _Q2);
  _Q2.i16[0] = _Q19.i16[7];
  __asm { FCVT            S2, H2 }

  _S3 = _S2 + _S2;
  __asm
  {
    FCVT            H3, S3
    FCVT            S3, H3
  }

  _S3 = 1.0 - _S3;
  __asm { FCVT            H7, S3 }

  LOWORD(_S3) = _Q19.i16[6];
  __asm { FCVT            S3, H3 }

  _S4 = _S3 + _S3;
  __asm
  {
    FCVT            H4, S4
    FCVT            S4, H4
  }

  _S4 = 1.0 - _S4;
  __asm { FCVT            H18, S4 }

  LOWORD(_S4) = _Q19.i16[4];
  __asm { FCVT            S4, H4 }

  _S5 = _S4 + _S4;
  __asm
  {
    FCVT            H5, S5
    FCVT            S5, H5
  }

  _S5 = 1.0 - _S5;
  __asm { FCVT            H17, S5 }

  LOWORD(_S5) = _Q19.i16[5];
  __asm { FCVT            S5, H5 }

  _S6 = _S5 + _S5;
  __asm
  {
    FCVT            H6, S6
    FCVT            S6, H6
  }

  _S21 = 1.0 - _S6;
  LOWORD(_S6) = _Q19.i16[3];
  __asm { FCVT            S6, H6 }

  _S16 = _S6 + _S6;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H22, S16 }

  LOWORD(_S16) = _Q19.i16[2];
  __asm { FCVT            S16, H16 }

  _S23 = _S16 + _S16;
  __asm
  {
    FCVT            H23, S23
    FCVT            S23, H23
  }

  _S23 = 1.0 - _S23;
  __asm
  {
    FCVT            H23, S23
    FCVT            S24, H19
  }

  _S25 = _S24 + _S24;
  __asm
  {
    FCVT            H25, S25
    FCVT            S25, H25
  }

  *(float *)_D25.i32 = 1.0 - _S25;
  __asm { FCVT            H25, S25 }

  _Q19.i16[0] = _Q19.i16[1];
  __asm { FCVT            S19, H19 }

  _S26 = *(float *)_Q19.i32 + *(float *)_Q19.i32;
  __asm
  {
    FCVT            H26, S26
    FCVT            S26, H26
  }

  _S20 = 1.0 - _S26;
  __asm { FCVT            H20, S20 }

  _D25.i16[1] = LOWORD(_S20);
  _D25.i16[2] = LOWORD(_S23);
  _D25.i16[3] = _H22;
  __asm { FCVT            H20, S21 }

  _D17.i16[1] = LOWORD(_S20);
  *(int8x8_t *)v43.i8 = vand_s8(_D25, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D25))));
  _D17.i16[2] = _H18;
  _D17.i16[3] = _H7;
  v43.u64[1] = (unint64_t)vand_s8(_D17, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D17))));
  else {
    __int16 v44 = -1;
  }
  if (_S24 >= 1024.0) {
    __int16 v45 = 0;
  }
  else {
    __int16 v45 = -1;
  }
  v46.i16[0] = v45;
  v46.i16[1] = v44;
  if (_S16 >= 1024.0) {
    __int16 v47 = 0;
  }
  else {
    __int16 v47 = -1;
  }
  v46.i16[2] = v47;
  if (_S6 >= 1024.0) {
    __int16 v48 = 0;
  }
  else {
    __int16 v48 = -1;
  }
  v46.i16[3] = v48;
  if (_S4 >= 1024.0) {
    __int16 v49 = 0;
  }
  else {
    __int16 v49 = -1;
  }
  v46.i16[4] = v49;
  if (_S5 >= 1024.0) {
    __int16 v50 = 0;
  }
  else {
    __int16 v50 = -1;
  }
  v46.i16[5] = v50;
  if (_S3 >= 1024.0) {
    __int16 v51 = 0;
  }
  else {
    __int16 v51 = -1;
  }
  v46.i16[6] = v51;
  if (_S2 >= 1024.0) {
    __int16 v52 = 0;
  }
  else {
    __int16 v52 = -1;
  }
  v46.i16[7] = v52;
  int8x16_t v53 = vornq_s8(vandq_s8(v43, v46), v46);
  _D1 = vandq_s8(v53, v1).u64[0];
  _H3 = HIWORD(_D1);
  __asm { FCVT            S3, H3 }

  _H4 = _D0.i16[3];
  __asm { FCVT            S4, H4 }

  if (_S4 <= _S3) {
    __int16 v59 = 0;
  }
  else {
    __int16 v59 = -1;
  }
  _H3 = WORD2(_D1);
  __asm { FCVT            S3, H3 }

  _H4 = _D0.i16[2];
  __asm { FCVT            S4, H4 }

  if (_S4 <= _S3) {
    __int16 v64 = 0;
  }
  else {
    __int16 v64 = -1;
  }
  _H3 = WORD1(_D1);
  __asm { FCVT            S3, H3 }

  _H4 = _D0.i16[1];
  __asm { FCVT            S4, H4 }

  if (_S4 <= _S3) {
    __int16 v69 = 0;
  }
  else {
    __int16 v69 = -1;
  }
  __asm
  {
    FCVT            S1, H1
    FCVT            S3, H0
  }

  if (_S3 <= _S1) {
    __int16 v72 = 0;
  }
  else {
    __int16 v72 = -1;
  }
  v73.i16[0] = v72;
  v73.i16[1] = v69;
  v73.i16[2] = v64;
  v73.i16[3] = v59;
  return vorr_s8( (int8x8_t)(*(void *)&vcvt_f16_f32( vaddq_f32( vcvtq_f32_f16((float16x4_t)vbsl_s8(v73, (int8x8_t)0x3C003C003C003C00LL, 0LL)),  vcvtq_f32_f16((float16x4_t)vand_s8(*(int8x8_t *)v53.i8, _D0)))) & 0x7FFF7FFF7FFF7FFFLL),  vand_s8(_D0, (int8x8_t)0x8000800080008000LL));
}

{
  int8x16_t v1;
  int8x16_t v44;
  __int16 v45;
  __int16 v46;
  int8x16_t v47;
  __int16 v48;
  __int16 v49;
  __int16 v50;
  __int16 v51;
  __int16 v52;
  __int16 v53;
  int8x16_t v54;
  __int16 v60;
  __int16 v65;
  __int16 v70;
  __int16 v73;
  int8x8_t v74;
  *(int8x8_t *)v1.i8 = _D0;
  v1.u64[1] = (unint64_t)_D0;
  _Q2.i64[0] = 0x3C003C003C003C00LL;
  _Q2.i64[1] = 0x3C003C003C003C00LL;
  _Q19 = vandq_s8(v1, _Q2);
  _Q2.i16[0] = _Q19.i16[7];
  __asm { FCVT            S2, H2 }

  _S3 = _S2 + _S2;
  __asm
  {
    FCVT            H3, S3
    FCVT            S3, H3
  }

  _S3 = 1.0 - _S3;
  __asm { FCVT            H7, S3 }

  LOWORD(_S3) = _Q19.i16[6];
  __asm { FCVT            S3, H3 }

  _S4 = _S3 + _S3;
  __asm
  {
    FCVT            H4, S4
    FCVT            S4, H4
  }

  _S4 = 1.0 - _S4;
  __asm { FCVT            H18, S4 }

  LOWORD(_S4) = _Q19.i16[4];
  __asm { FCVT            S4, H4 }

  _S5 = _S4 + _S4;
  __asm
  {
    FCVT            H5, S5
    FCVT            S5, H5
  }

  _S5 = 1.0 - _S5;
  __asm { FCVT            H17, S5 }

  LOWORD(_S5) = _Q19.i16[5];
  __asm { FCVT            S5, H5 }

  _S6 = _S5 + _S5;
  __asm
  {
    FCVT            H6, S6
    FCVT            S6, H6
  }

  _S6 = 1.0 - _S6;
  __asm { FCVT            H21, S6 }

  LOWORD(_S6) = _Q19.i16[3];
  __asm { FCVT            S6, H6 }

  _S16 = _S6 + _S6;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H22, S16 }

  LOWORD(_S16) = _Q19.i16[2];
  __asm { FCVT            S16, H16 }

  _S23 = _S16 + _S16;
  __asm
  {
    FCVT            H23, S23
    FCVT            S23, H23
  }

  _S23 = 1.0 - _S23;
  __asm
  {
    FCVT            H23, S23
    FCVT            S24, H19
  }

  _S25 = _S24 + _S24;
  __asm
  {
    FCVT            H25, S25
    FCVT            S25, H25
  }

  *(float *)_D25.i32 = 1.0 - _S25;
  __asm { FCVT            H25, S25 }

  _Q19.i16[0] = _Q19.i16[1];
  __asm { FCVT            S19, H19 }

  _S26 = *(float *)_Q19.i32 + *(float *)_Q19.i32;
  __asm
  {
    FCVT            H26, S26
    FCVT            S26, H26
  }

  _S20 = 1.0 - _S26;
  __asm { FCVT            H20, S20 }

  _D25.i16[1] = LOWORD(_S20);
  _D25.i16[2] = LOWORD(_S23);
  _D25.i16[3] = _H22;
  *(int8x8_t *)v44.i8 = vand_s8(_D25, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D25))));
  _D17.i16[1] = _H21;
  _D17.i16[2] = _H18;
  _D17.i16[3] = _H7;
  v44.u64[1] = (unint64_t)vand_s8(_D17, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D17))));
  else {
    __int16 v45 = -1;
  }
  if (_S24 >= 1024.0) {
    int8x16_t v46 = 0;
  }
  else {
    int8x16_t v46 = -1;
  }
  v47.i16[0] = v46;
  v47.i16[1] = v45;
  if (_S16 >= 1024.0) {
    __int16 v48 = 0;
  }
  else {
    __int16 v48 = -1;
  }
  v47.i16[2] = v48;
  if (_S6 >= 1024.0) {
    __int16 v49 = 0;
  }
  else {
    __int16 v49 = -1;
  }
  v47.i16[3] = v49;
  if (_S4 >= 1024.0) {
    __int16 v50 = 0;
  }
  else {
    __int16 v50 = -1;
  }
  v47.i16[4] = v50;
  if (_S5 >= 1024.0) {
    __int16 v51 = 0;
  }
  else {
    __int16 v51 = -1;
  }
  v47.i16[5] = v51;
  if (_S3 >= 1024.0) {
    __int16 v52 = 0;
  }
  else {
    __int16 v52 = -1;
  }
  v47.i16[6] = v52;
  if (_S2 >= 1024.0) {
    int8x16_t v53 = 0;
  }
  else {
    int8x16_t v53 = -1;
  }
  v47.i16[7] = v53;
  __int16 v54 = vornq_s8(vandq_s8(v44, v47), v47);
  _D1 = vandq_s8(v54, v1).u64[0];
  _H3 = HIWORD(_D1);
  __asm { FCVT            S3, H3 }

  _H4 = _D0.i16[3];
  __asm { FCVT            S4, H4 }

  if (_S4 <= _S3) {
    __int16 v60 = 0;
  }
  else {
    __int16 v60 = -1;
  }
  _H3 = WORD2(_D1);
  __asm { FCVT            S3, H3 }

  _H4 = _D0.i16[2];
  __asm { FCVT            S4, H4 }

  if (_S4 <= _S3) {
    v65 = 0;
  }
  else {
    v65 = -1;
  }
  _H3 = WORD1(_D1);
  __asm { FCVT            S3, H3 }

  _H4 = _D0.i16[1];
  __asm { FCVT            S4, H4 }

  if (_S4 <= _S3) {
    v70 = 0;
  }
  else {
    v70 = -1;
  }
  __asm
  {
    FCVT            S1, H1
    FCVT            S3, H0
  }

  if (_S3 <= _S1) {
    int8x8_t v73 = 0;
  }
  else {
    int8x8_t v73 = -1;
  }
  v74.i16[0] = v73;
  v74.i16[1] = v70;
  v74.i16[2] = v65;
  v74.i16[3] = v60;
  return vorr_s8( (int8x8_t)(*(void *)&vcvt_f16_f32( vaddq_f32( vcvtq_f32_f16((float16x4_t)vand_s8(v74, (int8x8_t)0x3C003C003C003C00LL)),  vcvtq_f32_f16((float16x4_t)vand_s8(*(int8x8_t *)v54.i8, _D0)))) & 0x7FFF7FFF7FFF7FFFLL),  vand_s8(_D0, (int8x8_t)0x8000800080008000LL));
}

float16x4_t floor(_:)(int8x8_t _D0)
{
  *(int8x8_t *)v1.i8 = _D0;
  v1.u64[1] = (unint64_t)_D0;
  _Q2.i64[0] = 0x3C003C003C003C00LL;
  _Q2.i64[1] = 0x3C003C003C003C00LL;
  _Q19 = vandq_s8(v1, _Q2);
  _Q2.i16[0] = _Q19.i16[7];
  __asm { FCVT            S2, H2 }

  _S3 = _S2 + _S2;
  __asm
  {
    FCVT            H3, S3
    FCVT            S3, H3
  }

  _S3 = 1.0 - _S3;
  __asm { FCVT            H7, S3 }

  LOWORD(_S3) = _Q19.i16[6];
  __asm { FCVT            S3, H3 }

  _S4 = _S3 + _S3;
  __asm
  {
    FCVT            H4, S4
    FCVT            S4, H4
  }

  _S4 = 1.0 - _S4;
  __asm { FCVT            H18, S4 }

  LOWORD(_S4) = _Q19.i16[4];
  __asm { FCVT            S4, H4 }

  _S5 = _S4 + _S4;
  __asm
  {
    FCVT            H5, S5
    FCVT            S5, H5
  }

  _S5 = 1.0 - _S5;
  __asm { FCVT            H17, S5 }

  LOWORD(_S5) = _Q19.i16[5];
  __asm { FCVT            S5, H5 }

  _S6 = _S5 + _S5;
  __asm
  {
    FCVT            H6, S6
    FCVT            S6, H6
  }

  _S6 = 1.0 - _S6;
  __asm { FCVT            H21, S6 }

  LOWORD(_S6) = _Q19.i16[3];
  __asm { FCVT            S6, H6 }

  _S16 = _S6 + _S6;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H22, S16 }

  LOWORD(_S16) = _Q19.i16[2];
  __asm { FCVT            S16, H16 }

  _S23 = _S16 + _S16;
  __asm
  {
    FCVT            H23, S23
    FCVT            S23, H23
  }

  _S23 = 1.0 - _S23;
  __asm { FCVT            S24, H19 }

  _S25 = _S24 + _S24;
  __asm
  {
    FCVT            H25, S25
    FCVT            S25, H25
  }

  *(float *)_D25.i32 = 1.0 - _S25;
  __asm { FCVT            H25, S25 }

  _Q19.i16[0] = _Q19.i16[1];
  __asm { FCVT            S19, H19 }

  _S26 = *(float *)_Q19.i32 + *(float *)_Q19.i32;
  __asm
  {
    FCVT            H26, S26
    FCVT            S26, H26
  }

  _S20 = 1.0 - _S26;
  __asm { FCVT            H20, S20 }

  _D25.i16[1] = LOWORD(_S20);
  __asm { FCVT            H20, S23 }

  _D25.i16[2] = LOWORD(_S20);
  _D25.i16[3] = _H22;
  _D17.i16[1] = _H21;
  _D17.i16[2] = _H18;
  *(int8x8_t *)v44.i8 = vand_s8(_D25, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D25))));
  _D17.i16[3] = _H7;
  v44.u64[1] = (unint64_t)vand_s8(_D17, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D17))));
  else {
    __int16 v45 = -1;
  }
  if (_S24 >= 1024.0) {
    __int16 v46 = 0;
  }
  else {
    __int16 v46 = -1;
  }
  v47.i16[0] = v46;
  v47.i16[1] = v45;
  if (_S16 >= 1024.0) {
    __int16 v48 = 0;
  }
  else {
    __int16 v48 = -1;
  }
  v47.i16[2] = v48;
  if (_S6 >= 1024.0) {
    __int16 v49 = 0;
  }
  else {
    __int16 v49 = -1;
  }
  v47.i16[3] = v49;
  if (_S4 >= 1024.0) {
    __int16 v50 = 0;
  }
  else {
    __int16 v50 = -1;
  }
  v47.i16[4] = v50;
  if (_S5 >= 1024.0) {
    __int16 v51 = 0;
  }
  else {
    __int16 v51 = -1;
  }
  v47.i16[5] = v51;
  if (_S3 >= 1024.0) {
    __int16 v52 = 0;
  }
  else {
    __int16 v52 = -1;
  }
  v47.i16[6] = v52;
  if (_S2 >= 1024.0) {
    __int16 v53 = 0;
  }
  else {
    __int16 v53 = -1;
  }
  v47.i16[7] = v53;
  int8x16_t v54 = vornq_s8(vandq_s8(v44, v47), v47);
  _D1 = vandq_s8(v54, v1).u64[0];
  _H3 = HIWORD(_D1);
  __asm { FCVT            S3, H3 }

  _H4 = _D0.i16[3];
  __asm { FCVT            S4, H4 }

  if (_S4 >= _S3) {
    __int16 v60 = 0;
  }
  else {
    __int16 v60 = -1;
  }
  _H3 = WORD2(_D1);
  __asm { FCVT            S3, H3 }

  _H4 = _D0.i16[2];
  __asm { FCVT            S4, H4 }

  if (_S4 >= _S3) {
    __int16 v65 = 0;
  }
  else {
    __int16 v65 = -1;
  }
  _H3 = WORD1(_D1);
  __asm { FCVT            S3, H3 }

  _H4 = _D0.i16[1];
  __asm { FCVT            S4, H4 }

  if (_S4 >= _S3) {
    __int16 v70 = 0;
  }
  else {
    __int16 v70 = -1;
  }
  __asm
  {
    FCVT            S1, H1
    FCVT            S3, H0
  }

  if (_S3 >= _S1) {
    __int16 v73 = 0;
  }
  else {
    __int16 v73 = -1;
  }
  v74.i16[0] = v73;
  v74.i16[1] = v70;
  v74.i16[2] = v65;
  v74.i16[3] = v60;
  return vcvt_f16_f32( vsubq_f32( vcvtq_f32_f16((float16x4_t)vand_s8(*(int8x8_t *)v54.i8, _D0)),  vcvtq_f32_f16((float16x4_t)vbsl_s8(v74, (int8x8_t)0x3C003C003C003C00LL, 0LL))));
}

{
  int8x16_t v1;
  int8x16_t v43;
  __int16 v44;
  __int16 v45;
  int8x16_t v46;
  __int16 v47;
  __int16 v48;
  __int16 v49;
  __int16 v50;
  __int16 v51;
  __int16 v52;
  int8x16_t v53;
  __int16 v59;
  __int16 v64;
  __int16 v69;
  __int16 v72;
  int8x8_t v73;
  *(int8x8_t *)v1.i8 = _D0;
  v1.u64[1] = (unint64_t)_D0;
  _Q2.i64[0] = 0x3C003C003C003C00LL;
  _Q2.i64[1] = 0x3C003C003C003C00LL;
  _Q19 = vandq_s8(v1, _Q2);
  _Q2.i16[0] = _Q19.i16[7];
  __asm { FCVT            S2, H2 }

  _S3 = _S2 + _S2;
  __asm
  {
    FCVT            H3, S3
    FCVT            S3, H3
  }

  _S3 = 1.0 - _S3;
  __asm { FCVT            H7, S3 }

  LOWORD(_S3) = _Q19.i16[6];
  __asm { FCVT            S3, H3 }

  _S4 = _S3 + _S3;
  __asm
  {
    FCVT            H4, S4
    FCVT            S4, H4
  }

  _S4 = 1.0 - _S4;
  __asm { FCVT            H18, S4 }

  LOWORD(_S4) = _Q19.i16[4];
  __asm { FCVT            S4, H4 }

  _S5 = _S4 + _S4;
  __asm
  {
    FCVT            H5, S5
    FCVT            S5, H5
  }

  _S5 = 1.0 - _S5;
  __asm { FCVT            H17, S5 }

  LOWORD(_S5) = _Q19.i16[5];
  __asm { FCVT            S5, H5 }

  _S6 = _S5 + _S5;
  __asm
  {
    FCVT            H6, S6
    FCVT            S6, H6
  }

  _S21 = 1.0 - _S6;
  LOWORD(_S6) = _Q19.i16[3];
  __asm { FCVT            S6, H6 }

  _S16 = _S6 + _S6;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H22, S16 }

  LOWORD(_S16) = _Q19.i16[2];
  __asm { FCVT            S16, H16 }

  _S23 = _S16 + _S16;
  __asm
  {
    FCVT            H23, S23
    FCVT            S23, H23
  }

  _S23 = 1.0 - _S23;
  __asm
  {
    FCVT            H23, S23
    FCVT            S24, H19
  }

  _S25 = _S24 + _S24;
  __asm
  {
    FCVT            H25, S25
    FCVT            S25, H25
  }

  *(float *)_D25.i32 = 1.0 - _S25;
  __asm { FCVT            H25, S25 }

  _Q19.i16[0] = _Q19.i16[1];
  __asm { FCVT            S19, H19 }

  _S26 = *(float *)_Q19.i32 + *(float *)_Q19.i32;
  __asm
  {
    FCVT            H26, S26
    FCVT            S26, H26
  }

  _S20 = 1.0 - _S26;
  __asm { FCVT            H20, S20 }

  _D25.i16[1] = LOWORD(_S20);
  _D25.i16[2] = LOWORD(_S23);
  _D25.i16[3] = _H22;
  __asm { FCVT            H20, S21 }

  _D17.i16[1] = LOWORD(_S20);
  *(int8x8_t *)v43.i8 = vand_s8(_D25, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D25))));
  _D17.i16[2] = _H18;
  _D17.i16[3] = _H7;
  v43.u64[1] = (unint64_t)vand_s8(_D17, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D17))));
  else {
    int8x16_t v44 = -1;
  }
  if (_S24 >= 1024.0) {
    __int16 v45 = 0;
  }
  else {
    __int16 v45 = -1;
  }
  v46.i16[0] = v45;
  v46.i16[1] = v44;
  if (_S16 >= 1024.0) {
    int8x16_t v47 = 0;
  }
  else {
    int8x16_t v47 = -1;
  }
  v46.i16[2] = v47;
  if (_S6 >= 1024.0) {
    __int16 v48 = 0;
  }
  else {
    __int16 v48 = -1;
  }
  v46.i16[3] = v48;
  if (_S4 >= 1024.0) {
    __int16 v49 = 0;
  }
  else {
    __int16 v49 = -1;
  }
  v46.i16[4] = v49;
  if (_S5 >= 1024.0) {
    __int16 v50 = 0;
  }
  else {
    __int16 v50 = -1;
  }
  v46.i16[5] = v50;
  if (_S3 >= 1024.0) {
    __int16 v51 = 0;
  }
  else {
    __int16 v51 = -1;
  }
  v46.i16[6] = v51;
  if (_S2 >= 1024.0) {
    __int16 v52 = 0;
  }
  else {
    __int16 v52 = -1;
  }
  v46.i16[7] = v52;
  __int16 v53 = vornq_s8(vandq_s8(v43, v46), v46);
  _D1 = vandq_s8(v53, v1).u64[0];
  _H3 = HIWORD(_D1);
  __asm { FCVT            S3, H3 }

  _H4 = _D0.i16[3];
  __asm { FCVT            S4, H4 }

  if (_S4 >= _S3) {
    __int16 v59 = 0;
  }
  else {
    __int16 v59 = -1;
  }
  _H3 = WORD2(_D1);
  __asm { FCVT            S3, H3 }

  _H4 = _D0.i16[2];
  __asm { FCVT            S4, H4 }

  if (_S4 >= _S3) {
    __int16 v64 = 0;
  }
  else {
    __int16 v64 = -1;
  }
  _H3 = WORD1(_D1);
  __asm { FCVT            S3, H3 }

  _H4 = _D0.i16[1];
  __asm { FCVT            S4, H4 }

  if (_S4 >= _S3) {
    __int16 v69 = 0;
  }
  else {
    __int16 v69 = -1;
  }
  __asm
  {
    FCVT            S1, H1
    FCVT            S3, H0
  }

  if (_S3 >= _S1) {
    __int16 v72 = 0;
  }
  else {
    __int16 v72 = -1;
  }
  v73.i16[0] = v72;
  v73.i16[1] = v69;
  v73.i16[2] = v64;
  v73.i16[3] = v59;
  return vcvt_f16_f32( vsubq_f32( vcvtq_f32_f16((float16x4_t)vand_s8(*(int8x8_t *)v53.i8, _D0)),  vcvtq_f32_f16((float16x4_t)vand_s8(v73, (int8x8_t)0x3C003C003C003C00LL))));
}

int8x8_t trunc(_:)(int8x8_t a1)
{
  *(int8x8_t *)v1.i8 = a1;
  v1.u64[1] = (unint64_t)a1;
  v2.i64[0] = 0x3C003C003C003C00LL;
  v2.i64[1] = 0x3C003C003C003C00LL;
  _D1 = vandq_s8(v1, v2).u64[0];
  float32x4_t v4 = vcvtq_f32_f16((float16x4_t)vand_s8(a1, (int8x8_t)0x3C003C003C003C00LL));
  __asm { FMOV            V3.4S, #1.0 }

  *(float16x4_t *)v4.f32 = vcvt_f16_f32(vsubq_f32(_Q3, vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v4, v4)))));
  int8x8_t v10 = vbsl_s8((int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16(*(float16x4_t *)v4.f32))), *(int8x8_t *)v4.f32, 0LL);
  _Q3.i16[0] = HIWORD(_D1);
  __asm { FCVT            S3, H3 }

  if (_Q3.f32[0] >= 1024.0) {
    __int16 v11 = 0;
  }
  else {
    __int16 v11 = -1;
  }
  _H3 = WORD2(_D1);
  __asm { FCVT            S3, H3 }

  if (_S3 >= 1024.0) {
    __int16 v14 = 0;
  }
  else {
    __int16 v14 = -1;
  }
  _H3 = WORD1(_D1);
  __asm { FCVT            S3, H3 }

  if (_S3 >= 1024.0) {
    __int16 v17 = 0;
  }
  else {
    __int16 v17 = -1;
  }
  __asm { FCVT            S1, H1 }

  if (_S1 >= 1024.0) {
    __int16 v19 = 0;
  }
  else {
    __int16 v19 = -1;
  }
  v20.i16[0] = v19;
  v20.i16[1] = v17;
  v20.i16[2] = v14;
  v20.i16[3] = v11;
  return vand_s8(vorn_s8(vand_s8(v10, v20), v20), a1);
}

{
  int8x16_t v1;
  int8x16_t v2;
  float32x4_t v4;
  int8x8_t v10;
  __int16 v11;
  __int16 v14;
  __int16 v17;
  __int16 v19;
  int8x8_t v20;
  *(int8x8_t *)v1.i8 = a1;
  v1.u64[1] = (unint64_t)a1;
  v2.i64[0] = 0x3C003C003C003C00LL;
  v2.i64[1] = 0x3C003C003C003C00LL;
  _D1 = vandq_s8(v1, v2).u64[0];
  float32x4_t v4 = vcvtq_f32_f16((float16x4_t)vand_s8(a1, (int8x8_t)0x3C003C003C003C00LL));
  __asm { FMOV            V3.4S, #1.0 }

  *(float16x4_t *)v4.f32 = vcvt_f16_f32(vsubq_f32(_Q3, vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v4, v4)))));
  int8x8_t v10 = vand_s8(*(int8x8_t *)v4.f32, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16(*(float16x4_t *)v4.f32))));
  _Q3.i16[0] = HIWORD(_D1);
  __asm { FCVT            S3, H3 }

  if (_Q3.f32[0] >= 1024.0) {
    __int16 v11 = 0;
  }
  else {
    __int16 v11 = -1;
  }
  _H3 = WORD2(_D1);
  __asm { FCVT            S3, H3 }

  if (_S3 >= 1024.0) {
    __int16 v14 = 0;
  }
  else {
    __int16 v14 = -1;
  }
  _H3 = WORD1(_D1);
  __asm { FCVT            S3, H3 }

  if (_S3 >= 1024.0) {
    __int16 v17 = 0;
  }
  else {
    __int16 v17 = -1;
  }
  __asm { FCVT            S1, H1 }

  if (_S1 >= 1024.0) {
    __int16 v19 = 0;
  }
  else {
    __int16 v19 = -1;
  }
  v20.i16[0] = v19;
  v20.i16[1] = v17;
  v20.i16[2] = v14;
  v20.i16[3] = v11;
  return vand_s8(vorn_s8(vand_s8(v10, v20), v20), a1);
}

int8x8_t rint(_:)(double _D0)
{
  _H1 = HIWORD(_D0);
  __asm { FCVT            S1, H1 }

  _S1 = fabsf(_S1);
  __asm { FCVT            H1, S1 }

  _H2 = WORD2(_D0);
  __asm { FCVT            S2, H2 }

  _S2 = fabsf(_S2);
  __asm
  {
    FCVT            H2, S2
    FCVT            S3, H0
  }

  _S3 = fabsf(_S3);
  __asm { FCVT            H3, S3 }

  _H4 = WORD1(_D0);
  __asm { FCVT            S4, H4 }

  _S4 = fabsf(_S4);
  __asm { FCVT            H4, S4 }

  _S5 = fabsf(*(float *)&_D0);
  __asm { FCVT            S4, H4 }

  if (_S4 >= 1024.0) {
    __int16 v21 = 0;
  }
  else {
    __int16 v21 = -1;
  }
  __asm { FCVT            S3, H3 }

  if (_S3 >= 1024.0) {
    __int16 v23 = 0;
  }
  else {
    __int16 v23 = -1;
  }
  __int16 v24 = v21;
  __asm
  {
    FCVT            H4, S5
    FCVT            S2, H2
  }

  if (_S2 >= 1024.0) {
    __int16 v27 = 0;
  }
  else {
    __int16 v27 = -1;
  }
  __int16 v28 = v27;
  __asm { FCVT            S1, H1 }

  if (_S1 >= 1024.0) {
    __int16 v30 = 0;
  }
  else {
    __int16 v30 = -1;
  }
  __asm { FCVT            S1, H4 }

  v32.i16[0] = v23 & 0x7FFF;
  v32.i16[1] = v24 & 0x7FFF;
  v32.i16[2] = v28 & 0x7FFF;
  v32.i16[3] = v30 & 0x7FFF;
  float32x4_t v33 = vcvtq_f32_f16((float16x4_t)(*(void *)&vand_s8(*(int8x8_t *)&_D0, (int8x8_t)0x8000800080008000LL) | 0x6400640064006400LL));
  return vbsl_s8( v32,  (int8x8_t)vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(*(float16x4_t *)&_D0), v33))), v33)),  *(int8x8_t *)&_D0);
}

{
  __int16 v21;
  __int16 v23;
  __int16 v24;
  __int16 v27;
  __int16 v28;
  __int16 v30;
  int8x8_t v32;
  float32x4_t v33;
  _H1 = HIWORD(_D0);
  __asm { FCVT            S1, H1 }

  _S1 = fabsf(_S1);
  __asm { FCVT            H1, S1 }

  _H2 = WORD2(_D0);
  __asm { FCVT            S2, H2 }

  _S2 = fabsf(_S2);
  __asm
  {
    FCVT            H2, S2
    FCVT            S3, H0
  }

  _S3 = fabsf(_S3);
  __asm { FCVT            H3, S3 }

  _H4 = WORD1(_D0);
  __asm { FCVT            S4, H4 }

  _S4 = fabsf(_S4);
  __asm { FCVT            H4, S4 }

  _S5 = fabsf(*(float *)&_D0);
  __asm { FCVT            S4, H4 }

  if (_S4 >= 1024.0) {
    __int16 v21 = 0;
  }
  else {
    __int16 v21 = -1;
  }
  __asm { FCVT            S3, H3 }

  if (_S3 >= 1024.0) {
    __int16 v23 = 0;
  }
  else {
    __int16 v23 = -1;
  }
  __int16 v24 = v21;
  __asm
  {
    FCVT            H4, S5
    FCVT            S2, H2
  }

  if (_S2 >= 1024.0) {
    __int16 v27 = 0;
  }
  else {
    __int16 v27 = -1;
  }
  __int16 v28 = v27;
  __asm { FCVT            S1, H1 }

  if (_S1 >= 1024.0) {
    __int16 v30 = 0;
  }
  else {
    __int16 v30 = -1;
  }
  __asm { FCVT            S1, H4 }

  v32.i16[0] = v23 & 0x7FFF;
  v32.i16[1] = v24 & 0x7FFF;
  v32.i16[2] = v28 & 0x7FFF;
  v32.i16[3] = v30 & 0x7FFF;
  float32x4_t v33 = vcvtq_f32_f16((float16x4_t)(*(void *)&vand_s8(*(int8x8_t *)&_D0, (int8x8_t)0x8000800080008000LL) | 0x6400640064006400LL));
  return vbsl_s8( v32,  (int8x8_t)vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(*(float16x4_t *)&_D0), v33))), v33)),  *(int8x8_t *)&_D0);
}

double sqrt(_:)()
{
  double v6 = v0;
  __sqrtf16();
  __int16 v5 = v1;
  __sqrtf16();
  double v2 = v6;
  WORD1(v2) = v5;
  WORD2(v2) = v3;
  return v2;
}

{
  __int16 v0;
  __int16 v1;
  __int16 v2;
  double v3;
  __int16 v4;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __sqrtf16();
  float64x2_t v8 = v0;
  __sqrtf16();
  int8x16_t v7 = v1;
  __sqrtf16();
  double v6 = v2;
  __sqrtf16();
  LOWORD(v3) = v8;
  WORD1(v3) = v7;
  WORD2(v3) = v6;
  HIWORD(v3) = v4;
  return v3;
}

{
  __int16 v0;
  __int16 v1;
  __int16 v2;
  __int16 v3;
  double v4;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __sqrtf16();
  float64x2_t v9 = v0;
  __sqrtf16();
  float64x2_t v8 = v1;
  __sqrtf16();
  int8x16_t v7 = v2;
  __sqrtf16();
  double v6 = v3;
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  LOWORD(v4) = v9;
  WORD1(v4) = v8;
  WORD2(v4) = v7;
  HIWORD(v4) = v6;
  return v4;
}

double abs(_:)(double _D0)
{
  _H1 = WORD1(_D0);
  __asm { FCVT            S1, H1 }

  _S1 = fabsf(_S1);
  __asm
  {
    FCVT            H2, S1
    FCVT            S1, H0
  }

  *(float *)&_D1 = fabsf(_S1);
  __asm { FCVT            H1, S1 }

  WORD1(_D1) = _H2;
  _H2 = WORD2(_D0);
  __asm { FCVT            S2, H2 }

  _S2 = fabsf(_S2);
  __asm { FCVT            H2, S2 }

  WORD2(_D1) = LOWORD(_S2);
  _H0 = HIWORD(_D0);
  __asm { FCVT            S0, H0 }

  _S0 = fabsf(_S0);
  __asm { FCVT            H0, S0 }

  HIWORD(_D1) = LOWORD(_S0);
  return _D1;
}

{
  _H1 = WORD1(_D0);
  __asm { FCVT            S1, H1 }

  _S1 = fabsf(_S1);
  __asm
  {
    FCVT            H2, S1
    FCVT            S1, H0
  }

  *(float *)&_D1 = fabsf(_S1);
  __asm { FCVT            H1, S1 }

  WORD1(_D1) = _H2;
  _H2 = WORD2(_D0);
  __asm { FCVT            S2, H2 }

  _S2 = fabsf(_S2);
  __asm { FCVT            H2, S2 }

  WORD2(_D1) = LOWORD(_S2);
  _H0 = HIWORD(_D0);
  __asm { FCVT            S0, H0 }

  _S0 = fabsf(_S0);
  __asm { FCVT            H0, S0 }

  HIWORD(_D1) = LOWORD(_S0);
  return _D1;
}

int8x8_t min(_:_:)(float16x4_t a1, float16x4_t a2)
{
  float32x4_t v2 = vcvtq_f32_f16(a2);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(v2, vcvtq_f32_f16(a1))),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v2), (int8x16_t)vcgezq_f32(v2)))),  (int8x8_t)a1,  (int8x8_t)a2);
}

{
  float32x4_t v2;
  float32x4_t v2 = vcvtq_f32_f16(a2);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(v2, vcvtq_f32_f16(a1))),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v2), (int8x16_t)vcgezq_f32(v2)))),  (int8x8_t)a1,  (int8x8_t)a2);
}

{
  float32x4_t v2;
  float32x4_t v2 = vcvtq_f32_f16(a2);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(v2, vcvtq_f32_f16(a1))),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v2), (int8x16_t)vcgezq_f32(v2)))),  (int8x8_t)a1,  (int8x8_t)a2);
}

int8x8_t max(_:_:)(float16x4_t a1, float16x4_t a2)
{
  float32x4_t v2 = vcvtq_f32_f16(a2);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(vcvtq_f32_f16(a1), v2)),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v2), (int8x16_t)vcgezq_f32(v2)))),  (int8x8_t)a1,  (int8x8_t)a2);
}

{
  float32x4_t v2;
  float32x4_t v2 = vcvtq_f32_f16(a2);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(vcvtq_f32_f16(a1), v2)),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v2), (int8x16_t)vcgezq_f32(v2)))),  (int8x8_t)a1,  (int8x8_t)a2);
}

{
  float32x4_t v2;
  float32x4_t v2 = vcvtq_f32_f16(a2);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(vcvtq_f32_f16(a1), v2)),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v2), (int8x16_t)vcgezq_f32(v2)))),  (int8x8_t)a1,  (int8x8_t)a2);
}

int8x8_t min(_:_:)(float16x4_t a1, int16x4_t a2)
{
  float16x4_t v2 = (float16x4_t)vdup_lane_s16(a2, 0);
  float32x4_t v3 = vcvtq_f32_f16(v2);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(v3, vcvtq_f32_f16(a1))),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v3), (int8x16_t)vcgezq_f32(v3)))),  (int8x8_t)a1,  (int8x8_t)v2);
}

{
  float16x4_t v2;
  float32x4_t v3;
  float16x4_t v2 = (float16x4_t)vdup_lane_s16(a2, 0);
  float32x4_t v3 = vcvtq_f32_f16(v2);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(v3, vcvtq_f32_f16(a1))),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v3), (int8x16_t)vcgezq_f32(v3)))),  (int8x8_t)a1,  (int8x8_t)v2);
}

{
  float16x4_t v2;
  float32x4_t v3;
  float16x4_t v2 = (float16x4_t)vdup_lane_s16(a2, 0);
  float32x4_t v3 = vcvtq_f32_f16(v2);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(v3, vcvtq_f32_f16(a1))),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v3), (int8x16_t)vcgezq_f32(v3)))),  (int8x8_t)a1,  (int8x8_t)v2);
}

int8x8_t max(_:_:)(float16x4_t a1, int16x4_t a2)
{
  float16x4_t v2 = (float16x4_t)vdup_lane_s16(a2, 0);
  float32x4_t v3 = vcvtq_f32_f16(v2);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(vcvtq_f32_f16(a1), v3)),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v3), (int8x16_t)vcgezq_f32(v3)))),  (int8x8_t)a1,  (int8x8_t)v2);
}

{
  float16x4_t v2;
  float32x4_t v3;
  float16x4_t v2 = (float16x4_t)vdup_lane_s16(a2, 0);
  float32x4_t v3 = vcvtq_f32_f16(v2);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(vcvtq_f32_f16(a1), v3)),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v3), (int8x16_t)vcgezq_f32(v3)))),  (int8x8_t)a1,  (int8x8_t)v2);
}

{
  float16x4_t v2;
  float32x4_t v3;
  float16x4_t v2 = (float16x4_t)vdup_lane_s16(a2, 0);
  float32x4_t v3 = vcvtq_f32_f16(v2);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(vcvtq_f32_f16(a1), v3)),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v3), (int8x16_t)vcgezq_f32(v3)))),  (int8x8_t)a1,  (int8x8_t)v2);
}

double ceil(_:)(int8x16_t _Q0)
{
  v1.i64[0] = 0x3C003C003C003C00LL;
  v1.i64[1] = 0x3C003C003C003C00LL;
  _Q19 = vandq_s8(_Q0, v1);
  _H2 = _Q19.i16[7];
  __asm { FCVT            S2, H2 }

  _S3 = _S2 + _S2;
  __asm
  {
    FCVT            H3, S3
    FCVT            S3, H3
  }

  _S3 = 1.0 - _S3;
  __asm { FCVT            H7, S3 }

  LOWORD(_S3) = _Q19.i16[6];
  __asm { FCVT            S3, H3 }

  _S4 = _S3 + _S3;
  __asm
  {
    FCVT            H4, S4
    FCVT            S4, H4
  }

  _S4 = 1.0 - _S4;
  __asm { FCVT            H18, S4 }

  LOWORD(_S4) = _Q19.i16[4];
  __asm { FCVT            S4, H4 }

  _S5 = _S4 + _S4;
  __asm
  {
    FCVT            H5, S5
    FCVT            S5, H5
  }

  _S5 = 1.0 - _S5;
  __asm { FCVT            H17, S5 }

  LOWORD(_S5) = _Q19.i16[5];
  __asm { FCVT            S5, H5 }

  _S6 = _S5 + _S5;
  __asm
  {
    FCVT            H6, S6
    FCVT            S6, H6
  }

  _S6 = 1.0 - _S6;
  __asm { FCVT            H21, S6 }

  LOWORD(_S6) = _Q19.i16[3];
  __asm { FCVT            S6, H6 }

  _S16 = _S6 + _S6;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H22, S16 }

  LOWORD(_S16) = _Q19.i16[2];
  __asm { FCVT            S16, H16 }

  _S23 = _S16 + _S16;
  __asm
  {
    FCVT            H23, S23
    FCVT            S23, H23
  }

  _S23 = 1.0 - _S23;
  __asm { FCVT            S24, H19 }

  _S25 = _S24 + _S24;
  __asm
  {
    FCVT            H25, S25
    FCVT            S25, H25
  }

  *(float *)_D25.i32 = 1.0 - _S25;
  __asm { FCVT            H25, S25 }

  _Q19.i16[0] = _Q19.i16[1];
  __asm { FCVT            S19, H19 }

  _S26 = *(float *)_Q19.i32 + *(float *)_Q19.i32;
  __asm
  {
    FCVT            H26, S26
    FCVT            S26, H26
  }

  _S20 = 1.0 - _S26;
  __asm { FCVT            H20, S20 }

  _D25.i16[1] = LOWORD(_S20);
  __asm { FCVT            H20, S23 }

  _D25.i16[2] = LOWORD(_S20);
  _D25.i16[3] = _H22;
  _D17.i16[1] = _H21;
  _D17.i16[2] = _H18;
  *(int8x8_t *)v44.i8 = vand_s8(_D25, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D25))));
  _D17.i16[3] = _H7;
  v44.u64[1] = (unint64_t)vand_s8(_D17, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D17))));
  else {
    __int16 v45 = -1;
  }
  if (_S24 >= 1024.0) {
    __int16 v46 = 0;
  }
  else {
    __int16 v46 = -1;
  }
  v47.i16[0] = v46;
  v47.i16[1] = v45;
  if (_S16 >= 1024.0) {
    __int16 v48 = 0;
  }
  else {
    __int16 v48 = -1;
  }
  v47.i16[2] = v48;
  if (_S6 >= 1024.0) {
    __int16 v49 = 0;
  }
  else {
    __int16 v49 = -1;
  }
  v47.i16[3] = v49;
  if (_S4 >= 1024.0) {
    __int16 v50 = 0;
  }
  else {
    __int16 v50 = -1;
  }
  v47.i16[4] = v50;
  if (_S5 >= 1024.0) {
    __int16 v51 = 0;
  }
  else {
    __int16 v51 = -1;
  }
  v47.i16[5] = v51;
  if (_S3 >= 1024.0) {
    __int16 v52 = 0;
  }
  else {
    __int16 v52 = -1;
  }
  v47.i16[6] = v52;
  if (_S2 >= 1024.0) {
    __int16 v53 = 0;
  }
  else {
    __int16 v53 = -1;
  }
  v47.i16[7] = v53;
  _Q2 = vandq_s8(vornq_s8(vandq_s8(v44, v47), v47), _Q0);
  _H3 = _Q2.i16[1];
  _H4 = _Q0.u16[1];
  __asm
  {
    FCVT            S4, H4
    FCVT            S3, H3
  }

  if (_S3 >= _S4) {
    __int16 v59 = 0;
  }
  else {
    __int16 v59 = -1;
  }
  __asm
  {
    FCVT            S4, H0
    FCVT            S5, H2
  }

  if (_S5 >= _S4) {
    __int16 v62 = 0;
  }
  else {
    __int16 v62 = -1;
  }
  v63.i16[0] = v62;
  v63.i16[1] = v59;
  _H6 = _Q2.i16[2];
  _H7 = _Q0.u16[2];
  __asm
  {
    FCVT            S7, H7
    FCVT            S6, H6
  }

  if (_S6 >= _S7) {
    __int16 v68 = 0;
  }
  else {
    __int16 v68 = -1;
  }
  v63.i16[2] = v68;
  _H7 = _Q2.i16[3];
  _H16 = _Q0.u16[3];
  __asm
  {
    FCVT            S16, H16
    FCVT            S7, H7
  }

  if (_S7 >= _S16) {
    __int16 v73 = 0;
  }
  else {
    __int16 v73 = -1;
  }
  v63.i16[3] = v73;
  _H16 = _Q2.i16[4];
  _H17 = _Q0.u16[4];
  __asm
  {
    FCVT            S17, H17
    FCVT            S16, H16
  }

  if (_S16 >= _S17) {
    __int16 v78 = 0;
  }
  else {
    __int16 v78 = -1;
  }
  v63.i16[4] = v78;
  _H17 = _Q2.i16[5];
  _H18 = _Q0.u16[5];
  __asm
  {
    FCVT            S18, H18
    FCVT            S17, H17
  }

  if (_S17 >= _S18) {
    __int16 v83 = 0;
  }
  else {
    __int16 v83 = -1;
  }
  v63.i16[5] = v83;
  _H18 = _Q2.i16[6];
  _H19 = _Q0.u16[6];
  __asm
  {
    FCVT            S19, H19
    FCVT            S18, H18
  }

  if (_S18 >= _S19) {
    __int16 v88 = 0;
  }
  else {
    __int16 v88 = -1;
  }
  v63.i16[6] = v88;
  _H2 = _Q2.i16[7];
  _H19 = _Q0.u16[7];
  __asm
  {
    FCVT            S19, H19
    FCVT            S2, H2
  }

  if (_S2 >= _S19) {
    __int16 v93 = 0;
  }
  else {
    __int16 v93 = -1;
  }
  v63.i16[7] = v93;
  _Q1 = vandq_s8(v1, v63);
  _H4 = _Q1.i16[1];
  __asm { FCVT            S4, H4 }

  _S3 = _S4 + _S3;
  __asm
  {
    FCVT            H3, S3
    FCVT            S4, H1
  }

  *(float *)_Q4.i32 = _S4 + _S5;
  __asm { FCVT            H4, S4 }

  _Q4.i16[1] = LOWORD(_S3);
  LOWORD(_S3) = _Q1.i16[2];
  __asm { FCVT            S3, H3 }

  _S3 = _S3 + _S6;
  __asm { FCVT            H3, S3 }

  _Q4.i16[2] = LOWORD(_S3);
  LOWORD(_S3) = _Q1.i16[3];
  __asm { FCVT            S3, H3 }

  _S3 = _S3 + _S7;
  __asm { FCVT            H3, S3 }

  _Q4.i16[3] = LOWORD(_S3);
  LOWORD(_S3) = _Q1.i16[4];
  __asm { FCVT            S3, H3 }

  _S3 = _S3 + _S16;
  __asm { FCVT            H3, S3 }

  _Q4.i16[4] = LOWORD(_S3);
  LOWORD(_S3) = _Q1.i16[5];
  __asm { FCVT            S3, H3 }

  _S3 = _S3 + _S17;
  __asm { FCVT            H3, S3 }

  _Q4.i16[5] = LOWORD(_S3);
  LOWORD(_S3) = _Q1.i16[6];
  __asm { FCVT            S3, H3 }

  _S3 = _S3 + _S18;
  __asm { FCVT            H3, S3 }

  _Q4.i16[6] = LOWORD(_S3);
  _Q1.i16[0] = _Q1.i16[7];
  __asm { FCVT            S1, H1 }

  *(float *)_Q1.i32 = *(float *)_Q1.i32 + _S2;
  __asm { FCVT            H1, S1 }

  _Q4.i16[7] = _Q1.i16[0];
  _Q1.i64[0] = 0x8000800080008000LL;
  _Q1.i64[1] = 0x8000800080008000LL;
  *(void *)&double result = vbslq_s8(_Q1, _Q4, _Q0).u64[0];
  return result;
}

__n64 floor(_:)(int8x16_t _Q0)
{
  v1.i64[0] = 0x3C003C003C003C00LL;
  v1.i64[1] = 0x3C003C003C003C00LL;
  _Q19 = vandq_s8(_Q0, v1);
  _H2 = _Q19.i16[7];
  __asm { FCVT            S2, H2 }

  _S3 = _S2 + _S2;
  __asm
  {
    FCVT            H3, S3
    FCVT            S3, H3
  }

  _S3 = 1.0 - _S3;
  __asm { FCVT            H7, S3 }

  LOWORD(_S3) = _Q19.i16[6];
  __asm { FCVT            S3, H3 }

  _S4 = _S3 + _S3;
  __asm
  {
    FCVT            H4, S4
    FCVT            S4, H4
  }

  _S4 = 1.0 - _S4;
  __asm { FCVT            H18, S4 }

  LOWORD(_S4) = _Q19.i16[4];
  __asm { FCVT            S4, H4 }

  _S5 = _S4 + _S4;
  __asm
  {
    FCVT            H5, S5
    FCVT            S5, H5
  }

  _S5 = 1.0 - _S5;
  __asm { FCVT            H17, S5 }

  LOWORD(_S5) = _Q19.i16[5];
  __asm { FCVT            S5, H5 }

  _S6 = _S5 + _S5;
  __asm
  {
    FCVT            H6, S6
    FCVT            S6, H6
  }

  _S21 = 1.0 - _S6;
  LOWORD(_S6) = _Q19.i16[3];
  __asm { FCVT            S6, H6 }

  _S16 = _S6 + _S6;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H22, S16 }

  LOWORD(_S16) = _Q19.i16[2];
  __asm { FCVT            S16, H16 }

  _S23 = _S16 + _S16;
  __asm
  {
    FCVT            H23, S23
    FCVT            S23, H23
  }

  _S23 = 1.0 - _S23;
  __asm
  {
    FCVT            H23, S23
    FCVT            S24, H19
  }

  _S25 = _S24 + _S24;
  __asm
  {
    FCVT            H25, S25
    FCVT            S25, H25
  }

  *(float *)_D25.i32 = 1.0 - _S25;
  __asm { FCVT            H25, S25 }

  _Q19.i16[0] = _Q19.i16[1];
  __asm { FCVT            S19, H19 }

  _S26 = *(float *)_Q19.i32 + *(float *)_Q19.i32;
  __asm
  {
    FCVT            H26, S26
    FCVT            S26, H26
  }

  _S20 = 1.0 - _S26;
  __asm { FCVT            H20, S20 }

  _D25.i16[1] = LOWORD(_S20);
  _D25.i16[2] = LOWORD(_S23);
  _D25.i16[3] = _H22;
  __asm { FCVT            H20, S21 }

  _D17.i16[1] = LOWORD(_S20);
  *(int8x8_t *)v43.i8 = vand_s8(_D25, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D25))));
  _D17.i16[2] = _H18;
  _D17.i16[3] = _H7;
  v43.u64[1] = (unint64_t)vand_s8(_D17, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D17))));
  else {
    __int16 v44 = -1;
  }
  if (_S24 >= 1024.0) {
    __int16 v45 = 0;
  }
  else {
    __int16 v45 = -1;
  }
  v46.i16[0] = v45;
  v46.i16[1] = v44;
  if (_S16 >= 1024.0) {
    __int16 v47 = 0;
  }
  else {
    __int16 v47 = -1;
  }
  v46.i16[2] = v47;
  if (_S6 >= 1024.0) {
    __int16 v48 = 0;
  }
  else {
    __int16 v48 = -1;
  }
  v46.i16[3] = v48;
  if (_S4 >= 1024.0) {
    __int16 v49 = 0;
  }
  else {
    __int16 v49 = -1;
  }
  v46.i16[4] = v49;
  if (_S5 >= 1024.0) {
    __int16 v50 = 0;
  }
  else {
    __int16 v50 = -1;
  }
  v46.i16[5] = v50;
  if (_S3 >= 1024.0) {
    __int16 v51 = 0;
  }
  else {
    __int16 v51 = -1;
  }
  v46.i16[6] = v51;
  if (_S2 >= 1024.0) {
    __int16 v52 = 0;
  }
  else {
    __int16 v52 = -1;
  }
  v46.i16[7] = v52;
  _Q2 = vandq_s8(vornq_s8(vandq_s8(v43, v46), v46), _Q0);
  _H3 = _Q2.i16[1];
  _H4 = _Q0.u16[1];
  __asm
  {
    FCVT            S4, H4
    FCVT            S3, H3
  }

  if (_S3 <= _S4) {
    __int16 v58 = 0;
  }
  else {
    __int16 v58 = -1;
  }
  __asm
  {
    FCVT            S4, H0
    FCVT            S5, H2
  }

  if (_S5 <= _S4) {
    __int16 v61 = 0;
  }
  else {
    __int16 v61 = -1;
  }
  v62.i16[0] = v61;
  v62.i16[1] = v58;
  _H6 = _Q2.i16[2];
  _H7 = _Q0.u16[2];
  __asm
  {
    FCVT            S7, H7
    FCVT            S6, H6
  }

  if (_S6 <= _S7) {
    __int16 v67 = 0;
  }
  else {
    __int16 v67 = -1;
  }
  v62.i16[2] = v67;
  _H7 = _Q2.i16[3];
  _H16 = _Q0.u16[3];
  __asm
  {
    FCVT            S16, H16
    FCVT            S7, H7
  }

  if (_S7 <= _S16) {
    __int16 v72 = 0;
  }
  else {
    __int16 v72 = -1;
  }
  v62.i16[3] = v72;
  _H16 = _Q2.i16[4];
  _H17 = _Q0.u16[4];
  __asm
  {
    FCVT            S17, H17
    FCVT            S16, H16
  }

  if (_S16 <= _S17) {
    __int16 v77 = 0;
  }
  else {
    __int16 v77 = -1;
  }
  v62.i16[4] = v77;
  _H17 = _Q2.i16[5];
  _H18 = _Q0.u16[5];
  __asm
  {
    FCVT            S18, H18
    FCVT            S17, H17
  }

  if (_S17 <= _S18) {
    __int16 v82 = 0;
  }
  else {
    __int16 v82 = -1;
  }
  v62.i16[5] = v82;
  _H18 = _Q2.i16[6];
  _H19 = _Q0.u16[6];
  __asm
  {
    FCVT            S19, H19
    FCVT            S18, H18
  }

  if (_S18 <= _S19) {
    __int16 v87 = 0;
  }
  else {
    __int16 v87 = -1;
  }
  v62.i16[6] = v87;
  _H2 = _Q2.i16[7];
  _H0 = _Q0.u16[7];
  __asm
  {
    FCVT            S0, H0
    FCVT            S2, H2
  }

  if (_S2 <= _S0) {
    __int16 v92 = 0;
  }
  else {
    __int16 v92 = -1;
  }
  v62.i16[7] = v92;
  _Q1 = vandq_s8(v1, v62);
  _H0 = _Q1.i16[1];
  __asm { FCVT            S0, H0 }

  _S0 = _S3 - _S0;
  __asm
  {
    FCVT            H3, S0
    FCVT            S0, H1
  }

  _S0 = _S5 - _S0;
  __asm { FCVT            H0, S0 }

  result.n64_u16[1] = _H3;
  _H3 = _Q1.i16[2];
  __asm { FCVT            S3, H3 }

  _S3 = _S6 - _S3;
  __asm { FCVT            H3, S3 }

  result.n64_u16[2] = LOWORD(_S3);
  LOWORD(_S3) = _Q1.i16[3];
  __asm { FCVT            S3, H3 }

  _S3 = _S7 - _S3;
  __asm { FCVT            H3, S3 }

  result.n64_u16[3] = LOWORD(_S3);
  LOWORD(_S3) = _Q1.i16[4];
  __asm { FCVT            S3, H3 }

  _S3 = _S16 - _S3;
  __asm { FCVT            H3, S3 }

  LOWORD(_S3) = _Q1.i16[5];
  __asm { FCVT            S3, H3 }

  _S3 = _S17 - _S3;
  __asm { FCVT            H3, S3 }

  LOWORD(_S3) = _Q1.i16[6];
  __asm { FCVT            S3, H3 }

  _S3 = _S18 - _S3;
  __asm { FCVT            H3, S3 }

  _Q1.i16[0] = _Q1.i16[7];
  __asm { FCVT            S1, H1 }

  *(float *)_Q1.i32 = _S2 - *(float *)_Q1.i32;
  __asm { FCVT            H1, S1 }

  return result;
}

double trunc(_:)(int8x16_t a1)
{
  _Q1.i64[0] = 0x3C003C003C003C00LL;
  _Q1.i64[1] = 0x3C003C003C003C00LL;
  _Q18 = vandq_s8(a1, _Q1);
  _Q1.i16[0] = _Q18.i16[7];
  __asm { FCVT            S1, H1 }

  _S2 = _S1 + _S1;
  __asm
  {
    FCVT            H2, S2
    FCVT            S2, H2
  }

  _S2 = 1.0 - _S2;
  __asm { FCVT            H6, S2 }

  LOWORD(_S2) = _Q18.i16[6];
  __asm { FCVT            S2, H2 }

  _S3 = _S2 + _S2;
  __asm
  {
    FCVT            H3, S3
    FCVT            S3, H3
  }

  _S3 = 1.0 - _S3;
  __asm { FCVT            H17, S3 }

  LOWORD(_S3) = _Q18.i16[4];
  __asm { FCVT            S3, H3 }

  _S4 = _S3 + _S3;
  __asm
  {
    FCVT            H4, S4
    FCVT            S4, H4
  }

  _S4 = 1.0 - _S4;
  __asm { FCVT            H16, S4 }

  LOWORD(_S4) = _Q18.i16[5];
  __asm { FCVT            S4, H4 }

  _S5 = _S4 + _S4;
  __asm
  {
    FCVT            H5, S5
    FCVT            S5, H5
  }

  _S20 = 1.0 - _S5;
  LOWORD(_S5) = _Q18.i16[3];
  __asm { FCVT            S5, H5 }

  _S7 = _S5 + _S5;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H7
  }

  _S7 = 1.0 - _S7;
  __asm { FCVT            H21, S7 }

  LOWORD(_S7) = _Q18.i16[2];
  __asm { FCVT            S7, H7 }

  _S22 = _S7 + _S7;
  __asm
  {
    FCVT            H22, S22
    FCVT            S22, H22
  }

  _S22 = 1.0 - _S22;
  __asm
  {
    FCVT            H22, S22
    FCVT            S23, H18
  }

  _S24 = _S23 + _S23;
  __asm
  {
    FCVT            H24, S24
    FCVT            S24, H24
  }

  *(float *)_D24.i32 = 1.0 - _S24;
  __asm { FCVT            H24, S24 }

  _Q18.i16[0] = _Q18.i16[1];
  __asm { FCVT            S18, H18 }

  _S25 = *(float *)_Q18.i32 + *(float *)_Q18.i32;
  __asm
  {
    FCVT            H25, S25
    FCVT            S25, H25
  }

  _S19 = 1.0 - _S25;
  __asm { FCVT            H19, S19 }

  _D24.i16[1] = LOWORD(_S19);
  _D24.i16[2] = LOWORD(_S22);
  _D24.i16[3] = _H21;
  __asm { FCVT            H19, S20 }

  _D16.i16[1] = LOWORD(_S19);
  *(int8x8_t *)v42.i8 = vand_s8(_D24, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D24))));
  _D16.i16[2] = _H17;
  _D16.i16[3] = _H6;
  v42.u64[1] = (unint64_t)vand_s8(_D16, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D16))));
  else {
    __int16 v43 = -1;
  }
  if (_S23 >= 1024.0) {
    __int16 v44 = 0;
  }
  else {
    __int16 v44 = -1;
  }
  v45.i16[0] = v44;
  v45.i16[1] = v43;
  if (_S7 >= 1024.0) {
    __int16 v46 = 0;
  }
  else {
    __int16 v46 = -1;
  }
  v45.i16[2] = v46;
  if (_S5 >= 1024.0) {
    __int16 v47 = 0;
  }
  else {
    __int16 v47 = -1;
  }
  v45.i16[3] = v47;
  if (_S3 >= 1024.0) {
    __int16 v48 = 0;
  }
  else {
    __int16 v48 = -1;
  }
  v45.i16[4] = v48;
  if (_S4 >= 1024.0) {
    __int16 v49 = 0;
  }
  else {
    __int16 v49 = -1;
  }
  v45.i16[5] = v49;
  if (_S2 >= 1024.0) {
    __int16 v50 = 0;
  }
  else {
    __int16 v50 = -1;
  }
  v45.i16[6] = v50;
  if (_S1 >= 1024.0) {
    __int16 v51 = 0;
  }
  else {
    __int16 v51 = -1;
  }
  v45.i16[7] = v51;
  *(void *)&double result = vandq_s8(vornq_s8(vandq_s8(v42, v45), v45), a1).u64[0];
  return result;
}

double rint(_:)(int8x16_t _Q0)
{
  _Q1.i64[0] = 0x8000800080008000LL;
  _Q1.i64[1] = 0x8000800080008000LL;
  _Q2 = *(_OWORD *)&vandq_s8(_Q0, _Q1) | __PAIR128__(0x6400640064006400LL, 0x6400640064006400LL);
  _Q1.i16[0] = _Q0.i16[7];
  __asm { FCVT            S3, H1 }

  _S19 = fabsf(_S3);
  _Q1.i16[0] = _Q0.i16[6];
  __asm { FCVT            S4, H1 }

  _S20 = fabsf(_S4);
  _Q1.i16[0] = _Q0.i16[5];
  __asm { FCVT            S5, H1 }

  _S21 = fabsf(_S5);
  _Q1.i16[0] = _Q0.i16[4];
  __asm { FCVT            S6, H1 }

  _S22 = fabsf(_S6);
  _Q1.i16[0] = _Q0.i16[3];
  __asm { FCVT            S7, H1 }

  _S23 = fabsf(_S7);
  _Q1.i16[0] = _Q0.i16[2];
  __asm { FCVT            S16, H1 }

  _S24 = fabsf(_S16);
  __asm { FCVT            S17, H0 }

  *(float *)_Q1.i32 = fabsf(_S17);
  __asm { FCVT            H1, S1 }

  _H18 = _Q0.u16[1];
  __asm { FCVT            S18, H18 }

  _S25 = fabsf(_S18);
  __asm
  {
    FCVT            H25, S25
    FCVT            S25, H25
  }

  if (_S25 >= 1024.0) {
    __int16 v25 = 0;
  }
  else {
    __int16 v25 = -1;
  }
  __asm { FCVT            S1, H1 }

  if (_S1 >= 1024.0) {
    __int16 v27 = 0;
  }
  else {
    __int16 v27 = -1;
  }
  __int16 v28 = v25;
  __asm
  {
    FCVT            H24, S24
    FCVT            S24, H24
  }

  if (_S24 >= 1024.0) {
    __int16 v31 = 0;
  }
  else {
    __int16 v31 = -1;
  }
  LOWORD(v32) = v31;
  __asm
  {
    FCVT            H23, S23
    FCVT            S23, H23
  }

  if (_S23 >= 1024.0) {
    __int16 v35 = 0;
  }
  else {
    __int16 v35 = -1;
  }
  HIWORD(v32) = v35;
  __asm
  {
    FCVT            H22, S22
    FCVT            S22, H22
  }

  if (_S22 >= 1024.0) {
    __int16 v38 = 0;
  }
  else {
    __int16 v38 = -1;
  }
  LOWORD(v39) = v38;
  __asm
  {
    FCVT            H21, S21
    FCVT            S21, H21
  }

  if (_S21 >= 1024.0) {
    __int16 v42 = 0;
  }
  else {
    __int16 v42 = -1;
  }
  HIWORD(v39) = v42;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  if (_S20 >= 1024.0) {
    __int16 v45 = 0;
  }
  else {
    __int16 v45 = -1;
  }
  __int16 v46 = v45;
  __asm
  {
    FCVT            H19, S19
    FCVT            S19, H19
  }

  if (_S19 >= 1024.0) {
    __int16 v49 = 0;
  }
  else {
    __int16 v49 = -1;
  }
  _H19 = HIWORD(_Q2);
  __asm { FCVT            S19, H19 }

  _S3 = _S19 + _S3;
  __asm { FCVT            H3, S3 }

  _H20 = WORD6(_Q2);
  __asm { FCVT            S20, H20 }

  _S4 = _S20 + _S4;
  __asm { FCVT            H4, S4 }

  _H21 = WORD5(_Q2);
  __asm { FCVT            S21, H21 }

  _S5 = _S21 + _S5;
  __asm { FCVT            H5, S5 }

  _H22 = WORD4(_Q2);
  __asm { FCVT            S22, H22 }

  _S6 = _S22 + _S6;
  _H23 = WORD3(_Q2);
  __asm { FCVT            S23, H23 }

  _S7 = _S23 + _S7;
  _H24 = WORD2(_Q2);
  __asm { FCVT            S24, H24 }

  _S16 = _S24 + _S16;
  __asm { FCVT            S25, H2 }

  _S17 = _S25 + _S17;
  __asm { FCVT            H17, S17 }

  _H2 = WORD1(_Q2);
  __asm { FCVT            S2, H2 }

  _S18 = _S2 + _S18;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S2 = _S18 - _S2;
  __asm
  {
    FCVT            H2, S2
    FCVT            S17, H17
  }

  *(float *)_Q17.i32 = _S17 - _S25;
  __asm { FCVT            H17, S17 }

  _Q17.i16[1] = LOWORD(_S2);
  __asm
  {
    FCVT            H2, S16
    FCVT            S2, H2
  }

  _S2 = _S2 - _S24;
  __asm { FCVT            H2, S2 }

  _Q17.i16[2] = LOWORD(_S2);
  __asm
  {
    FCVT            H2, S7
    FCVT            S2, H2
  }

  _S2 = _S2 - _S23;
  __asm { FCVT            H2, S2 }

  _Q17.i16[3] = LOWORD(_S2);
  __asm
  {
    FCVT            H2, S6
    FCVT            S2, H2
  }

  _S2 = _S2 - _S22;
  __asm { FCVT            H2, S2 }

  _Q17.i16[4] = LOWORD(_S2);
  __asm { FCVT            S2, H5 }

  _S2 = _S2 - _S21;
  __asm { FCVT            H2, S2 }

  _Q17.i16[5] = LOWORD(_S2);
  __asm { FCVT            S2, H4 }

  _S2 = _S2 - _S20;
  __asm { FCVT            H2, S2 }

  _Q17.i16[6] = LOWORD(_S2);
  __asm { FCVT            S2, H3 }

  _S2 = _S2 - _S19;
  __asm { FCVT            H2, S2 }

  _Q17.i16[7] = LOWORD(_S2);
  v89.i16[0] = v27 & 0x7FFF;
  v89.i16[1] = v28 & 0x7FFF;
  v89.i32[1] = v32 & 0x7FFF7FFF;
  v89.i32[2] = v39 & 0x7FFF7FFF;
  v89.i16[6] = v46 & 0x7FFF;
  v89.i16[7] = v49 & 0x7FFF;
  *(void *)&double result = vbslq_s8(v89, _Q17, _Q0).u64[0];
  return result;
}

double abs(_:)(__n128 _Q0)
{
  _H1 = _Q0.n128_u16[1];
  __asm { FCVT            S1, H1 }

  _S1 = fabsf(_S1);
  __asm
  {
    FCVT            H2, S1
    FCVT            S1, H0
  }

  *(float *)&_D1 = fabsf(_S1);
  __asm { FCVT            H1, S1 }

  WORD1(_D1) = _H2;
  _H2 = _Q0.n128_u16[2];
  __asm { FCVT            S2, H2 }

  _S2 = fabsf(_S2);
  __asm { FCVT            H2, S2 }

  WORD2(_D1) = LOWORD(_S2);
  LOWORD(_S2) = _Q0.n128_u16[3];
  __asm { FCVT            S2, H2 }

  _S2 = fabsf(_S2);
  __asm { FCVT            H2, S2 }

  HIWORD(_D1) = LOWORD(_S2);
  LOWORD(_S2) = _Q0.n128_u16[4];
  __asm { FCVT            S2, H2 }

  _S2 = fabsf(_S2);
  __asm { FCVT            H2, S2 }

  LOWORD(_S2) = _Q0.n128_u16[5];
  __asm { FCVT            S2, H2 }

  _S2 = fabsf(_S2);
  __asm { FCVT            H2, S2 }

  LOWORD(_S2) = _Q0.n128_u16[6];
  __asm { FCVT            S2, H2 }

  _S2 = fabsf(_S2);
  __asm { FCVT            H2, S2 }

  _H0 = _Q0.n128_u16[7];
  __asm { FCVT            S0, H0 }

  _S0 = fabsf(_S0);
  __asm { FCVT            H0, S0 }

  return _D1;
}

void ceil(_:)(int8x16_t _Q0, int8x16_t _Q1)
{
  v2.i64[0] = 0x3C003C003C003C00LL;
  v2.i64[1] = 0x3C003C003C003C00LL;
  _Q21 = vandq_s8(_Q0, v2);
  _H3 = _Q21.i16[7];
  __asm { FCVT            S5, H3 }

  _S3 = _S5 + _S5;
  __asm
  {
    FCVT            H3, S3
    FCVT            S4, H3
  }

  _S4 = 1.0 - _S4;
  __asm { FCVT            H4, S4 }

  _H6 = _Q21.i16[6];
  __asm { FCVT            S6, H6 }

  _S7 = _S6 + _S6;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H7
  }

  _S7 = 1.0 - _S7;
  __asm { FCVT            H20, S7 }

  LOWORD(_S7) = _Q21.i16[4];
  __asm { FCVT            S7, H7 }

  _S16 = _S7 + _S7;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H19, S16 }

  LOWORD(_S16) = _Q21.i16[5];
  __asm { FCVT            S16, H16 }

  _S17 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  _S22 = 1.0 - _S17;
  LOWORD(_S17) = _Q21.i16[3];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S18 = 1.0 - _S18;
  __asm { FCVT            H23, S18 }

  LOWORD(_S18) = _Q21.i16[2];
  __asm { FCVT            S18, H18 }

  _S24 = _S18 + _S18;
  __asm
  {
    FCVT            H24, S24
    FCVT            S24, H24
  }

  _S24 = 1.0 - _S24;
  __asm
  {
    FCVT            H24, S24
    FCVT            S25, H21
  }

  _S26 = _S25 + _S25;
  __asm
  {
    FCVT            H26, S26
    FCVT            S26, H26
  }

  *(float *)_D26.i32 = 1.0 - _S26;
  __asm { FCVT            H26, S26 }

  _Q21.i16[0] = _Q21.i16[1];
  __asm { FCVT            S21, H21 }

  _S27 = *(float *)_Q21.i32 + *(float *)_Q21.i32;
  __asm
  {
    FCVT            H27, S27
    FCVT            S27, H27
  }

  _S27 = 1.0 - _S27;
  __asm { FCVT            H27, S27 }

  _D26.i16[1] = LOWORD(_S27);
  _D26.i16[2] = LOWORD(_S24);
  _D26.i16[3] = _H23;
  __asm { FCVT            H22, S22 }

  _D19.i16[1] = LOWORD(_S22);
  *(int8x8_t *)v44.i8 = vand_s8(_D26, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D26))));
  _D19.i16[2] = _H20;
  _D19.i16[3] = LOWORD(_S4);
  v44.u64[1] = (unint64_t)vand_s8(_D19, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D19))));
  else {
    __int16 v45 = -1;
  }
  if (_S25 >= 1024.0) {
    __int16 v46 = 0;
  }
  else {
    __int16 v46 = -1;
  }
  v47.i16[0] = v46;
  v47.i16[1] = v45;
  if (_S18 >= 1024.0) {
    __int16 v48 = 0;
  }
  else {
    __int16 v48 = -1;
  }
  v47.i16[2] = v48;
  if (_S17 >= 1024.0) {
    __int16 v49 = 0;
  }
  else {
    __int16 v49 = -1;
  }
  v47.i16[3] = v49;
  if (_S7 >= 1024.0) {
    __int16 v50 = 0;
  }
  else {
    __int16 v50 = -1;
  }
  v47.i16[4] = v50;
  if (_S16 >= 1024.0) {
    __int16 v51 = 0;
  }
  else {
    __int16 v51 = -1;
  }
  v47.i16[5] = v51;
  if (_S6 >= 1024.0) {
    __int16 v52 = 0;
  }
  else {
    __int16 v52 = -1;
  }
  v47.i16[6] = v52;
  if (_S5 >= 1024.0) {
    __int16 v53 = 0;
  }
  else {
    __int16 v53 = -1;
  }
  v47.i16[7] = v53;
  _Q5 = vandq_s8(vornq_s8(vandq_s8(v44, v47), v47), _Q0);
  _H6 = _Q5.i16[1];
  _H7 = _Q0.u16[1];
  __asm
  {
    FCVT            S7, H7
    FCVT            S6, H6
  }

  if (_S6 >= _S7) {
    __int16 v59 = 0;
  }
  else {
    __int16 v59 = -1;
  }
  __asm
  {
    FCVT            S7, H0
    FCVT            S16, H5
  }

  if (_S16 >= _S7) {
    __int16 v62 = 0;
  }
  else {
    __int16 v62 = -1;
  }
  v63.i16[0] = v62;
  v63.i16[1] = v59;
  _H17 = _Q5.i16[2];
  _H18 = _Q0.u16[2];
  __asm
  {
    FCVT            S18, H18
    FCVT            S17, H17
  }

  if (_S17 >= _S18) {
    __int16 v68 = 0;
  }
  else {
    __int16 v68 = -1;
  }
  v63.i16[2] = v68;
  _H18 = _Q5.i16[3];
  _H19 = _Q0.u16[3];
  __asm
  {
    FCVT            S19, H19
    FCVT            S18, H18
  }

  if (_S18 >= _S19) {
    __int16 v73 = 0;
  }
  else {
    __int16 v73 = -1;
  }
  v63.i16[3] = v73;
  _H19 = _Q5.i16[4];
  _H20 = _Q0.u16[4];
  __asm
  {
    FCVT            S20, H20
    FCVT            S19, H19
  }

  if (_S19 >= _S20) {
    __int16 v78 = 0;
  }
  else {
    __int16 v78 = -1;
  }
  v63.i16[4] = v78;
  _H20 = _Q5.i16[5];
  _H21 = _Q0.u16[5];
  __asm
  {
    FCVT            S21, H21
    FCVT            S20, H20
  }

  if (_S20 >= _S21) {
    __int16 v83 = 0;
  }
  else {
    __int16 v83 = -1;
  }
  v63.i16[5] = v83;
  _H21 = _Q5.i16[6];
  _H22 = _Q0.u16[6];
  __asm
  {
    FCVT            S22, H22
    FCVT            S21, H21
  }

  if (_S21 >= _S22) {
    __int16 v88 = 0;
  }
  else {
    __int16 v88 = -1;
  }
  v63.i16[6] = v88;
  _H5 = _Q5.i16[7];
  _H22 = _Q0.u16[7];
  __asm
  {
    FCVT            S22, H22
    FCVT            S23, H5
  }

  if (_S23 >= _S22) {
    __int16 v93 = 0;
  }
  else {
    __int16 v93 = -1;
  }
  v63.i16[7] = v93;
  _Q7 = vandq_s8(v2, v63);
  _H5 = _Q7.i16[1];
  __asm { FCVT            S5, H5 }

  _S5 = _S5 + _S6;
  __asm
  {
    FCVT            H6, S5
    FCVT            S5, H7
  }

  _S5 = _S5 + _S16;
  __asm { FCVT            H5, S5 }

  _H6 = _Q7.i16[2];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S17;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q7.i16[3];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S18;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q7.i16[4];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S19;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q7.i16[5];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S20;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q7.i16[6];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S21;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q7.i16[7];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S23;
  __asm { FCVT            H6, S6 }

  _Q20 = vandq_s8(_Q1, v2);
  LOWORD(_S6) = _Q20.i16[7];
  __asm { FCVT            S6, H6 }

  *(float *)_Q7.i32 = _S6 + _S6;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H7
  }

  _S21 = 1.0 - *(float *)_Q7.i32;
  _Q7.i16[0] = _Q20.i16[6];
  __asm { FCVT            S7, H7 }

  _S16 = _S7 + _S7;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S22 = 1.0 - _S16;
  LOWORD(_S16) = _Q20.i16[4];
  __asm { FCVT            S16, H16 }

  _S17 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  *(float *)_D23.i32 = 1.0 - _S17;
  LOWORD(_S17) = _Q20.i16[5];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S24 = 1.0 - _S18;
  LOWORD(_S18) = _Q20.i16[3];
  __asm { FCVT            S18, H18 }

  _S19 = _S18 + _S18;
  __asm
  {
    FCVT            H19, S19
    FCVT            S19, H19
  }

  _S25 = 1.0 - _S19;
  LOWORD(_S19) = _Q20.i16[2];
  __asm { FCVT            S19, H19 }

  _S26 = _S19 + _S19;
  __asm
  {
    FCVT            H26, S26
    FCVT            S26, H26
  }

  _S26 = 1.0 - _S26;
  __asm { FCVT            S27, H20 }

  _S28 = _S27 + _S27;
  __asm
  {
    FCVT            H28, S28
    FCVT            S28, H28
  }

  *(float *)_D28.i32 = 1.0 - _S28;
  _Q20.i16[0] = _Q20.i16[1];
  __asm { FCVT            S20, H20 }

  _S29 = *(float *)_Q20.i32 + *(float *)_Q20.i32;
  __asm
  {
    FCVT            H29, S29
    FCVT            S29, H29
  }

  _S29 = 1.0 - _S29;
  __asm
  {
    FCVT            H21, S21
    FCVT            H22, S22
    FCVT            H23, S23
    FCVT            H25, S25
    FCVT            H26, S26
    FCVT            H28, S28
    FCVT            H29, S29
  }

  _D28.i16[1] = LOWORD(_S29);
  _D28.i16[2] = LOWORD(_S26);
  _D28.i16[3] = LOWORD(_S25);
  __asm { FCVT            H24, S24 }

  _D23.i16[1] = LOWORD(_S24);
  *(int8x8_t *)v144.i8 = vand_s8(_D28, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D28))));
  _D23.i16[2] = LOWORD(_S22);
  _D23.i16[3] = LOWORD(_S21);
  v144.u64[1] = (unint64_t)vand_s8(_D23, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D23))));
  else {
    __int16 v145 = -1;
  }
  if (_S27 >= 1024.0) {
    __int16 v146 = 0;
  }
  else {
    __int16 v146 = -1;
  }
  v147.i16[0] = v146;
  v147.i16[1] = v145;
  if (_S19 >= 1024.0) {
    __int16 v148 = 0;
  }
  else {
    __int16 v148 = -1;
  }
  v147.i16[2] = v148;
  if (_S18 >= 1024.0) {
    __int16 v149 = 0;
  }
  else {
    __int16 v149 = -1;
  }
  v147.i16[3] = v149;
  if (_S16 >= 1024.0) {
    __int16 v150 = 0;
  }
  else {
    __int16 v150 = -1;
  }
  v147.i16[4] = v150;
  if (_S17 >= 1024.0) {
    __int16 v151 = 0;
  }
  else {
    __int16 v151 = -1;
  }
  v147.i16[5] = v151;
  if (_S7 >= 1024.0) {
    __int16 v152 = 0;
  }
  else {
    __int16 v152 = -1;
  }
  v147.i16[6] = v152;
  if (_S6 >= 1024.0) {
    __int16 v153 = 0;
  }
  else {
    __int16 v153 = -1;
  }
  v147.i16[7] = v153;
  _Q4 = vandq_s8(vornq_s8(vandq_s8(v144, v147), v147), _Q1);
  _H6 = _Q4.i16[1];
  _H7 = _Q1.u16[1];
  __asm
  {
    FCVT            S7, H7
    FCVT            S6, H6
  }

  if (_S6 >= _S7) {
    __int16 v159 = 0;
  }
  else {
    __int16 v159 = -1;
  }
  __asm
  {
    FCVT            S7, H1
    FCVT            S16, H4
  }

  if (_S16 >= _S7) {
    __int16 v162 = 0;
  }
  else {
    __int16 v162 = -1;
  }
  v163.i16[0] = v162;
  v163.i16[1] = v159;
  _H17 = _Q4.i16[2];
  _H18 = _Q1.u16[2];
  __asm
  {
    FCVT            S18, H18
    FCVT            S17, H17
  }

  if (_S17 >= _S18) {
    __int16 v168 = 0;
  }
  else {
    __int16 v168 = -1;
  }
  v163.i16[2] = v168;
  _H18 = _Q4.i16[3];
  _H19 = _Q1.u16[3];
  __asm
  {
    FCVT            S19, H19
    FCVT            S18, H18
  }

  if (_S18 >= _S19) {
    __int16 v173 = 0;
  }
  else {
    __int16 v173 = -1;
  }
  v163.i16[3] = v173;
  _H19 = _Q4.i16[4];
  _H20 = _Q1.u16[4];
  __asm
  {
    FCVT            S20, H20
    FCVT            S19, H19
  }

  if (_S19 >= _S20) {
    __int16 v178 = 0;
  }
  else {
    __int16 v178 = -1;
  }
  v163.i16[4] = v178;
  _H20 = _Q4.i16[5];
  _H21 = _Q1.u16[5];
  __asm
  {
    FCVT            S21, H21
    FCVT            S20, H20
  }

  if (_S20 >= _S21) {
    __int16 v183 = 0;
  }
  else {
    __int16 v183 = -1;
  }
  v163.i16[5] = v183;
  _H5 = _Q4.i16[6];
  _H21 = _Q1.u16[6];
  __asm
  {
    FCVT            S21, H21
    FCVT            S5, H5
  }

  if (_S5 >= _S21) {
    __int16 v188 = 0;
  }
  else {
    __int16 v188 = -1;
  }
  v163.i16[6] = v188;
  _H4 = _Q4.i16[7];
  _H21 = _Q1.u16[7];
  __asm
  {
    FCVT            S21, H21
    FCVT            S4, H4
  }

  if (_S4 >= _S21) {
    __int16 v193 = 0;
  }
  else {
    __int16 v193 = -1;
  }
  v163.i16[7] = v193;
  _Q2 = vandq_s8(v2, v163);
  _H7 = _Q2.i16[1];
  __asm { FCVT            S7, H7 }

  _S6 = _S7 + _S6;
  __asm
  {
    FCVT            H6, S6
    FCVT            S7, H2
  }

  _S7 = _S7 + _S16;
  __asm { FCVT            H7, S7 }

  LOWORD(_S6) = _Q2.i16[2];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S17;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q2.i16[3];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S18;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q2.i16[4];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S19;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q2.i16[5];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S20;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q2.i16[6];
  __asm { FCVT            S6, H6 }

  _S5 = _S6 + _S5;
  __asm { FCVT            H5, S5 }

  _Q2.i16[0] = _Q2.i16[7];
  __asm { FCVT            S2, H2 }

  *(float *)_Q2.i32 = *(float *)_Q2.i32 + _S4;
  __asm { FCVT            H2, S2 }

void floor(_:)(int8x16_t _Q0, int8x16_t _Q1)
{
  v2.i64[0] = 0x3C003C003C003C00LL;
  v2.i64[1] = 0x3C003C003C003C00LL;
  _Q21 = vandq_s8(_Q0, v2);
  _H3 = _Q21.i16[7];
  __asm { FCVT            S5, H3 }

  _S3 = _S5 + _S5;
  __asm
  {
    FCVT            H3, S3
    FCVT            S4, H3
  }

  _S4 = 1.0 - _S4;
  __asm { FCVT            H4, S4 }

  _H6 = _Q21.i16[6];
  __asm { FCVT            S6, H6 }

  _S7 = _S6 + _S6;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H7
  }

  _S7 = 1.0 - _S7;
  __asm { FCVT            H20, S7 }

  LOWORD(_S7) = _Q21.i16[4];
  __asm { FCVT            S7, H7 }

  _S16 = _S7 + _S7;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H19, S16 }

  LOWORD(_S16) = _Q21.i16[5];
  __asm { FCVT            S16, H16 }

  _S17 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  _S17 = 1.0 - _S17;
  __asm { FCVT            H22, S17 }

  LOWORD(_S17) = _Q21.i16[3];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S18 = 1.0 - _S18;
  __asm { FCVT            H23, S18 }

  LOWORD(_S18) = _Q21.i16[2];
  __asm { FCVT            S18, H18 }

  _S24 = _S18 + _S18;
  __asm
  {
    FCVT            H24, S24
    FCVT            S24, H24
  }

  _S24 = 1.0 - _S24;
  __asm
  {
    FCVT            H24, S24
    FCVT            S25, H21
  }

  _S26 = _S25 + _S25;
  __asm
  {
    FCVT            H26, S26
    FCVT            S26, H26
  }

  *(float *)_D26.i32 = 1.0 - _S26;
  __asm { FCVT            H26, S26 }

  _Q21.i16[0] = _Q21.i16[1];
  __asm { FCVT            S21, H21 }

  _S27 = *(float *)_Q21.i32 + *(float *)_Q21.i32;
  __asm
  {
    FCVT            H27, S27
    FCVT            S27, H27
  }

  _S27 = 1.0 - _S27;
  __asm { FCVT            H27, S27 }

  _D26.i16[1] = LOWORD(_S27);
  _D26.i16[2] = LOWORD(_S24);
  _D26.i16[3] = _H23;
  *(int8x8_t *)v45.i8 = vand_s8(_D26, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D26))));
  _D19.i16[1] = _H22;
  _D19.i16[2] = _H20;
  _D19.i16[3] = LOWORD(_S4);
  v45.u64[1] = (unint64_t)vand_s8(_D19, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D19))));
  else {
    __int16 v46 = -1;
  }
  if (_S25 >= 1024.0) {
    __int16 v47 = 0;
  }
  else {
    __int16 v47 = -1;
  }
  v48.i16[0] = v47;
  v48.i16[1] = v46;
  if (_S18 >= 1024.0) {
    __int16 v49 = 0;
  }
  else {
    __int16 v49 = -1;
  }
  v48.i16[2] = v49;
  if (_S17 >= 1024.0) {
    __int16 v50 = 0;
  }
  else {
    __int16 v50 = -1;
  }
  v48.i16[3] = v50;
  if (_S7 >= 1024.0) {
    __int16 v51 = 0;
  }
  else {
    __int16 v51 = -1;
  }
  v48.i16[4] = v51;
  if (_S16 >= 1024.0) {
    __int16 v52 = 0;
  }
  else {
    __int16 v52 = -1;
  }
  v48.i16[5] = v52;
  if (_S6 >= 1024.0) {
    __int16 v53 = 0;
  }
  else {
    __int16 v53 = -1;
  }
  v48.i16[6] = v53;
  if (_S5 >= 1024.0) {
    __int16 v54 = 0;
  }
  else {
    __int16 v54 = -1;
  }
  v48.i16[7] = v54;
  _Q5 = vandq_s8(vornq_s8(vandq_s8(v45, v48), v48), _Q0);
  _H6 = _Q5.i16[1];
  _H7 = _Q0.u16[1];
  __asm
  {
    FCVT            S7, H7
    FCVT            S6, H6
  }

  if (_S6 <= _S7) {
    __int16 v60 = 0;
  }
  else {
    __int16 v60 = -1;
  }
  __asm
  {
    FCVT            S7, H0
    FCVT            S16, H5
  }

  if (_S16 <= _S7) {
    __int16 v63 = 0;
  }
  else {
    __int16 v63 = -1;
  }
  v64.i16[0] = v63;
  v64.i16[1] = v60;
  _H17 = _Q5.i16[2];
  _H18 = _Q0.u16[2];
  __asm
  {
    FCVT            S18, H18
    FCVT            S17, H17
  }

  if (_S17 <= _S18) {
    __int16 v69 = 0;
  }
  else {
    __int16 v69 = -1;
  }
  v64.i16[2] = v69;
  _H18 = _Q5.i16[3];
  _H19 = _Q0.u16[3];
  __asm
  {
    FCVT            S19, H19
    FCVT            S18, H18
  }

  if (_S18 <= _S19) {
    __int16 v74 = 0;
  }
  else {
    __int16 v74 = -1;
  }
  v64.i16[3] = v74;
  _H19 = _Q5.i16[4];
  _H20 = _Q0.u16[4];
  __asm
  {
    FCVT            S20, H20
    FCVT            S19, H19
  }

  if (_S19 <= _S20) {
    __int16 v79 = 0;
  }
  else {
    __int16 v79 = -1;
  }
  v64.i16[4] = v79;
  _H20 = _Q5.i16[5];
  _H21 = _Q0.u16[5];
  __asm
  {
    FCVT            S21, H21
    FCVT            S20, H20
  }

  if (_S20 <= _S21) {
    __int16 v84 = 0;
  }
  else {
    __int16 v84 = -1;
  }
  v64.i16[5] = v84;
  _H21 = _Q5.i16[6];
  _H22 = _Q0.u16[6];
  __asm
  {
    FCVT            S22, H22
    FCVT            S21, H21
  }

  if (_S21 <= _S22) {
    __int16 v89 = 0;
  }
  else {
    __int16 v89 = -1;
  }
  v64.i16[6] = v89;
  _H5 = _Q5.i16[7];
  _H0 = _Q0.u16[7];
  __asm
  {
    FCVT            S0, H0
    FCVT            S5, H5
  }

  if (_S5 <= _S0) {
    __int16 v94 = 0;
  }
  else {
    __int16 v94 = -1;
  }
  v64.i16[7] = v94;
  _Q7 = vandq_s8(v2, v64);
  _H0 = _Q7.i16[1];
  __asm { FCVT            S0, H0 }

  _S0 = _S6 - _S0;
  __asm
  {
    FCVT            H6, S0
    FCVT            S0, H7
  }

  _S0 = _S16 - _S0;
  __asm { FCVT            H0, S0 }

  _H6 = _Q7.i16[2];
  __asm { FCVT            S6, H6 }

  _S6 = _S17 - _S6;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q7.i16[3];
  __asm { FCVT            S6, H6 }

  _S6 = _S18 - _S6;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q7.i16[4];
  __asm { FCVT            S6, H6 }

  _S6 = _S19 - _S6;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q7.i16[5];
  __asm { FCVT            S6, H6 }

  _S6 = _S20 - _S6;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q7.i16[6];
  __asm { FCVT            S6, H6 }

  _S6 = _S21 - _S6;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q7.i16[7];
  __asm { FCVT            S6, H6 }

  _S5 = _S5 - _S6;
  __asm { FCVT            H5, S5 }

  _Q22 = vandq_s8(_Q1, v2);
  LOWORD(_S5) = _Q22.i16[7];
  __asm { FCVT            S5, H5 }

  _S6 = _S5 + _S5;
  __asm
  {
    FCVT            H6, S6
    FCVT            S6, H6
  }

  _S6 = 1.0 - _S6;
  __asm { FCVT            H17, S6 }

  LOWORD(_S6) = _Q22.i16[6];
  __asm { FCVT            S6, H6 }

  *(float *)_Q7.i32 = _S6 + _S6;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H7
  }

  *(float *)_Q7.i32 = 1.0 - *(float *)_Q7.i32;
  __asm { FCVT            H21, S7 }

  _Q7.i16[0] = _Q22.i16[4];
  __asm { FCVT            S7, H7 }

  _S16 = _S7 + _S7;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H19, S16 }

  LOWORD(_S16) = _Q22.i16[5];
  __asm { FCVT            S16, H16 }

  _S18 = _S16 + _S16;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S18 = 1.0 - _S18;
  __asm { FCVT            H23, S18 }

  LOWORD(_S18) = _Q22.i16[3];
  __asm { FCVT            S18, H18 }

  _S20 = _S18 + _S18;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  _S20 = 1.0 - _S20;
  __asm { FCVT            H24, S20 }

  LOWORD(_S20) = _Q22.i16[2];
  __asm { FCVT            S20, H20 }

  _S25 = _S20 + _S20;
  __asm
  {
    FCVT            H25, S25
    FCVT            S25, H25
  }

  _S25 = 1.0 - _S25;
  __asm
  {
    FCVT            H25, S25
    FCVT            S26, H22
  }

  _S27 = _S26 + _S26;
  __asm
  {
    FCVT            H27, S27
    FCVT            S27, H27
  }

  *(float *)_D27.i32 = 1.0 - _S27;
  __asm { FCVT            H27, S27 }

  _Q22.i16[0] = _Q22.i16[1];
  __asm { FCVT            S22, H22 }

  _S28 = *(float *)_Q22.i32 + *(float *)_Q22.i32;
  __asm
  {
    FCVT            H28, S28
    FCVT            S28, H28
  }

  _S3 = 1.0 - _S28;
  __asm { FCVT            H3, S3 }

  _D27.i16[1] = LOWORD(_S3);
  _D27.i16[2] = LOWORD(_S25);
  _D27.i16[3] = _H24;
  *(int8x8_t *)v149.i8 = vand_s8(_D27, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D27))));
  _D19.i16[1] = _H23;
  _D19.i16[2] = _H21;
  _D19.i16[3] = _H17;
  v149.u64[1] = (unint64_t)vand_s8(_D19, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D19))));
  else {
    __int16 v150 = -1;
  }
  if (_S26 >= 1024.0) {
    __int16 v151 = 0;
  }
  else {
    __int16 v151 = -1;
  }
  v152.i16[0] = v151;
  v152.i16[1] = v150;
  if (_S20 >= 1024.0) {
    __int16 v153 = 0;
  }
  else {
    __int16 v153 = -1;
  }
  v152.i16[2] = v153;
  if (_S18 >= 1024.0) {
    __int16 v154 = 0;
  }
  else {
    __int16 v154 = -1;
  }
  v152.i16[3] = v154;
  if (_S7 >= 1024.0) {
    __int16 v155 = 0;
  }
  else {
    __int16 v155 = -1;
  }
  v152.i16[4] = v155;
  if (_S16 >= 1024.0) {
    __int16 v156 = 0;
  }
  else {
    __int16 v156 = -1;
  }
  v152.i16[5] = v156;
  if (_S6 >= 1024.0) {
    __int16 v157 = 0;
  }
  else {
    __int16 v157 = -1;
  }
  v152.i16[6] = v157;
  if (_S5 >= 1024.0) {
    __int16 v158 = 0;
  }
  else {
    __int16 v158 = -1;
  }
  v152.i16[7] = v158;
  _Q3 = vandq_s8(vornq_s8(vandq_s8(v149, v152), v152), _Q1);
  _H4 = _Q3.i16[1];
  _H5 = _Q1.u16[1];
  __asm
  {
    FCVT            S5, H5
    FCVT            S4, H4
  }

  if (_S4 <= _S5) {
    __int16 v164 = 0;
  }
  else {
    __int16 v164 = -1;
  }
  __asm
  {
    FCVT            S5, H1
    FCVT            S6, H3
  }

  if (_S6 <= _S5) {
    __int16 v167 = 0;
  }
  else {
    __int16 v167 = -1;
  }
  v168.i16[0] = v167;
  v168.i16[1] = v164;
  _H7 = _Q3.i16[2];
  _H16 = _Q1.u16[2];
  __asm
  {
    FCVT            S16, H16
    FCVT            S7, H7
  }

  if (_S7 <= _S16) {
    __int16 v173 = 0;
  }
  else {
    __int16 v173 = -1;
  }
  v168.i16[2] = v173;
  _H16 = _Q3.i16[3];
  _H17 = _Q1.u16[3];
  __asm
  {
    FCVT            S17, H17
    FCVT            S16, H16
  }

  if (_S16 <= _S17) {
    __int16 v178 = 0;
  }
  else {
    __int16 v178 = -1;
  }
  v168.i16[3] = v178;
  _H17 = _Q3.i16[4];
  _H18 = _Q1.u16[4];
  __asm
  {
    FCVT            S18, H18
    FCVT            S17, H17
  }

  if (_S17 <= _S18) {
    __int16 v183 = 0;
  }
  else {
    __int16 v183 = -1;
  }
  v168.i16[4] = v183;
  _H18 = _Q3.i16[5];
  _H19 = _Q1.u16[5];
  __asm
  {
    FCVT            S19, H19
    FCVT            S18, H18
  }

  if (_S18 <= _S19) {
    __int16 v188 = 0;
  }
  else {
    __int16 v188 = -1;
  }
  v168.i16[5] = v188;
  _H19 = _Q3.i16[6];
  _H20 = _Q1.u16[6];
  __asm
  {
    FCVT            S20, H20
    FCVT            S19, H19
  }

  if (_S19 <= _S20) {
    __int16 v193 = 0;
  }
  else {
    __int16 v193 = -1;
  }
  v168.i16[6] = v193;
  _H3 = _Q3.i16[7];
  _H1 = _Q1.u16[7];
  __asm
  {
    FCVT            S1, H1
    FCVT            S3, H3
  }

  if (_S3 <= _S1) {
    __int16 v198 = 0;
  }
  else {
    __int16 v198 = -1;
  }
  v168.i16[7] = v198;
  _Q2 = vandq_s8(v2, v168);
  _H1 = _Q2.i16[1];
  __asm { FCVT            S1, H1 }

  _S1 = _S4 - _S1;
  __asm
  {
    FCVT            H4, S1
    FCVT            S1, H2
  }

  _S1 = _S6 - _S1;
  __asm { FCVT            H1, S1 }

  _H4 = _Q2.i16[2];
  __asm { FCVT            S4, H4 }

  _S4 = _S7 - _S4;
  __asm { FCVT            H4, S4 }

  LOWORD(_S4) = _Q2.i16[3];
  __asm { FCVT            S4, H4 }

  _S4 = _S16 - _S4;
  __asm { FCVT            H4, S4 }

  LOWORD(_S4) = _Q2.i16[4];
  __asm { FCVT            S4, H4 }

  _S4 = _S17 - _S4;
  __asm { FCVT            H4, S4 }

  LOWORD(_S4) = _Q2.i16[5];
  __asm { FCVT            S4, H4 }

  _S4 = _S18 - _S4;
  __asm { FCVT            H4, S4 }

  LOWORD(_S4) = _Q2.i16[6];
  __asm { FCVT            S4, H4 }

  _S4 = _S19 - _S4;
  __asm { FCVT            H4, S4 }

  _Q2.i16[0] = _Q2.i16[7];
  __asm { FCVT            S2, H2 }

  *(float *)_Q2.i32 = _S3 - *(float *)_Q2.i32;
  __asm { FCVT            H2, S2 }

double trunc(_:)(int8x16_t a1, int8x16_t a2)
{
  v2.i64[0] = 0x3C003C003C003C00LL;
  v2.i64[1] = 0x3C003C003C003C00LL;
  _Q21 = vandq_s8(a1, v2);
  _H2 = _Q21.i16[7];
  __asm { FCVT            S5, H2 }

  _S2 = _S5 + _S5;
  __asm
  {
    FCVT            H2, S2
    FCVT            S3, H2
  }

  _S3 = 1.0 - _S3;
  __asm { FCVT            H3, S3 }

  _H6 = _Q21.i16[6];
  __asm { FCVT            S6, H6 }

  _S7 = _S6 + _S6;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H7
  }

  _S7 = 1.0 - _S7;
  __asm { FCVT            H20, S7 }

  LOWORD(_S7) = _Q21.i16[4];
  __asm { FCVT            S7, H7 }

  _S16 = _S7 + _S7;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H19, S16 }

  LOWORD(_S16) = _Q21.i16[5];
  __asm { FCVT            S16, H16 }

  _S17 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  _S22 = 1.0 - _S17;
  LOWORD(_S17) = _Q21.i16[3];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S18 = 1.0 - _S18;
  __asm { FCVT            H23, S18 }

  LOWORD(_S18) = _Q21.i16[2];
  __asm { FCVT            S18, H18 }

  _S24 = _S18 + _S18;
  __asm
  {
    FCVT            H24, S24
    FCVT            S24, H24
  }

  _S24 = 1.0 - _S24;
  __asm
  {
    FCVT            H24, S24
    FCVT            S25, H21
  }

  _S26 = _S25 + _S25;
  __asm
  {
    FCVT            H26, S26
    FCVT            S26, H26
  }

  *(float *)_D26.i32 = 1.0 - _S26;
  __asm { FCVT            H26, S26 }

  _Q21.i16[0] = _Q21.i16[1];
  __asm { FCVT            S21, H21 }

  _S27 = *(float *)_Q21.i32 + *(float *)_Q21.i32;
  __asm
  {
    FCVT            H27, S27
    FCVT            S27, H27
  }

  _S27 = 1.0 - _S27;
  __asm { FCVT            H27, S27 }

  _D26.i16[1] = LOWORD(_S27);
  _D26.i16[2] = LOWORD(_S24);
  _D26.i16[3] = _H23;
  __asm { FCVT            H22, S22 }

  _D19.i16[1] = LOWORD(_S22);
  *(int8x8_t *)v44.i8 = vand_s8(_D26, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D26))));
  _D19.i16[2] = _H20;
  _D19.i16[3] = LOWORD(_S3);
  v44.u64[1] = (unint64_t)vand_s8(_D19, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D19))));
  else {
    __int16 v45 = -1;
  }
  if (_S25 >= 1024.0) {
    __int16 v46 = 0;
  }
  else {
    __int16 v46 = -1;
  }
  v47.i16[0] = v46;
  v47.i16[1] = v45;
  if (_S18 >= 1024.0) {
    __int16 v48 = 0;
  }
  else {
    __int16 v48 = -1;
  }
  v47.i16[2] = v48;
  if (_S17 >= 1024.0) {
    __int16 v49 = 0;
  }
  else {
    __int16 v49 = -1;
  }
  v47.i16[3] = v49;
  if (_S7 >= 1024.0) {
    __int16 v50 = 0;
  }
  else {
    __int16 v50 = -1;
  }
  v47.i16[4] = v50;
  if (_S16 >= 1024.0) {
    __int16 v51 = 0;
  }
  else {
    __int16 v51 = -1;
  }
  v47.i16[5] = v51;
  if (_S6 >= 1024.0) {
    __int16 v52 = 0;
  }
  else {
    __int16 v52 = -1;
  }
  v47.i16[6] = v52;
  if (_S5 >= 1024.0) {
    __int16 v53 = 0;
  }
  else {
    __int16 v53 = -1;
  }
  v47.i16[7] = v53;
  int8x16_t v54 = vornq_s8(vandq_s8(v44, v47), v47);
  _Q19 = vandq_s8(a2, v2);
  _H4 = _Q19.i16[7];
  __asm { FCVT            S4, H4 }

  _S6 = _S4 + _S4;
  __asm
  {
    FCVT            H6, S6
    FCVT            S6, H6
  }

  _S20 = 1.0 - _S6;
  LOWORD(_S6) = _Q19.i16[6];
  __asm { FCVT            S6, H6 }

  _S7 = _S6 + _S6;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H7
  }

  _S21 = 1.0 - _S7;
  LOWORD(_S7) = _Q19.i16[4];
  __asm { FCVT            S7, H7 }

  _S16 = _S7 + _S7;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S22 = 1.0 - _S16;
  LOWORD(_S16) = _Q19.i16[5];
  __asm { FCVT            S16, H16 }

  _S17 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  _S23 = 1.0 - _S17;
  LOWORD(_S17) = _Q19.i16[3];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S24 = 1.0 - _S18;
  LOWORD(_S18) = _Q19.i16[2];
  __asm { FCVT            S18, H18 }

  _S25 = _S18 + _S18;
  __asm
  {
    FCVT            H25, S25
    FCVT            S25, H25
  }

  _S25 = 1.0 - _S25;
  __asm { FCVT            S26, H19 }

  _S27 = _S26 + _S26;
  __asm
  {
    FCVT            H27, S27
    FCVT            S27, H27
  }

  _S27 = 1.0 - _S27;
  _Q19.i16[0] = _Q19.i16[1];
  __asm { FCVT            S19, H19 }

  _S28 = *(float *)_Q19.i32 + *(float *)_Q19.i32;
  __asm
  {
    FCVT            H28, S28
    FCVT            S28, H28
  }

  _S2 = 1.0 - _S28;
  __asm
  {
    FCVT            H20, S20
    FCVT            H21, S21
    FCVT            H22, S22
    FCVT            H24, S24
    FCVT            H25, S25
    FCVT            H27, S27
    FCVT            H2, S2
    FCVT            H2, S23
  }

  *(void *)&double result = vandq_s8(v54, a1).u64[0];
  return result;
}

void rint(_:)(int8x16_t _Q0, int8x16_t _Q1)
{
  _Q3.i64[0] = 0x8000800080008000LL;
  _Q3.i64[1] = 0x8000800080008000LL;
  _Q5 = vandq_s8(_Q0, _Q3);
  _Q5.i16[0] |= 0x6400u;
  _H2 = _Q0.u16[7];
  __asm { FCVT            S6, H2 }

  _S22 = fabsf(_S6);
  _H2 = _Q0.u16[6];
  __asm { FCVT            S7, H2 }

  _S23 = fabsf(_S7);
  _H2 = _Q0.u16[5];
  __asm { FCVT            S16, H2 }

  _S24 = fabsf(_S16);
  _H2 = _Q0.u16[4];
  __asm { FCVT            S17, H2 }

  _S25 = fabsf(_S17);
  _H2 = _Q0.u16[3];
  __asm { FCVT            S18, H2 }

  _S26 = fabsf(_S18);
  _H2 = _Q0.u16[2];
  __asm { FCVT            S19, H2 }

  _S27 = fabsf(_S19);
  __asm { FCVT            S20, H0 }

  _S2 = fabsf(_S20);
  __asm { FCVT            H4, S2 }

  LOWORD(_S2) = _Q0.i16[1];
  __asm { FCVT            S21, H2 }

  _S2 = fabsf(_S21);
  __asm
  {
    FCVT            H2, S2
    FCVT            S28, H2
    FCVT            S4, H4
    FCVT            H27, S27
    FCVT            S27, H27
    FCVT            H26, S26
    FCVT            S26, H26
    FCVT            H25, S25
    FCVT            S25, H25
    FCVT            H24, S24
    FCVT            S24, H24
    FCVT            H23, S23
    FCVT            S23, H23
    FCVT            H22, S22
    FCVT            S22, H22
  }

  LOWORD(_S22) = _Q5.i16[7] | 0x6400;
  __asm { FCVT            S22, H22 }

  _S6 = _S22 + _S6;
  __asm { FCVT            H6, S6 }

  LOWORD(_S23) = _Q5.i16[6] | 0x6400;
  __asm { FCVT            S23, H23 }

  _S7 = _S23 + _S7;
  __asm { FCVT            H7, S7 }

  LOWORD(_S24) = _Q5.i16[5] | 0x6400;
  __asm { FCVT            S24, H24 }

  _S16 = _S24 + _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S25) = _Q5.i16[4] | 0x6400;
  __asm { FCVT            S25, H25 }

  _S17 = _S25 + _S17;
  LOWORD(_S26) = _Q5.i16[3] | 0x6400;
  __asm { FCVT            S26, H26 }

  _S18 = _S26 + _S18;
  LOWORD(_S27) = _Q5.i16[2] | 0x6400;
  __asm { FCVT            S27, H27 }

  _S19 = _S27 + _S19;
  __asm { FCVT            S28, H5 }

  _S20 = _S28 + _S20;
  __asm { FCVT            H20, S20 }

  _Q5.i16[0] = _Q5.i16[1] | 0x6400;
  __asm { FCVT            S5, H5 }

  _S21 = *(float *)_Q5.i32 + _S21;
  __asm
  {
    FCVT            H21, S21
    FCVT            S21, H21
  }

  *(float *)_Q5.i32 = _S21 - *(float *)_Q5.i32;
  __asm
  {
    FCVT            H5, S5
    FCVT            S20, H20
  }

  _S20 = _S20 - _S28;
  __asm
  {
    FCVT            H20, S20
    FCVT            H5, S19
    FCVT            S5, H5
  }

  *(float *)_Q5.i32 = *(float *)_Q5.i32 - _S27;
  __asm
  {
    FCVT            H5, S5
    FCVT            H5, S18
    FCVT            S5, H5
  }

  *(float *)_Q5.i32 = *(float *)_Q5.i32 - _S26;
  __asm
  {
    FCVT            H5, S5
    FCVT            H5, S17
    FCVT            S5, H5
  }

  *(float *)_Q5.i32 = *(float *)_Q5.i32 - _S25;
  __asm
  {
    FCVT            H5, S5
    FCVT            S5, H16
  }

  *(float *)_Q5.i32 = *(float *)_Q5.i32 - _S24;
  __asm
  {
    FCVT            H5, S5
    FCVT            S5, H7
  }

  *(float *)_Q5.i32 = *(float *)_Q5.i32 - _S23;
  __asm
  {
    FCVT            H5, S5
    FCVT            S5, H6
  }

  *(float *)_Q5.i32 = *(float *)_Q5.i32 - _S22;
  __asm { FCVT            H5, S5 }

  _Q4 = vandq_s8(_Q1, _Q3);
  _Q4.i16[0] |= 0x6400u;
  _Q3.i16[0] = _Q1.i16[7];
  __asm { FCVT            S5, H3 }

  *(float *)_Q3.i32 = fabsf(*(float *)_Q5.i32);
  __asm { FCVT            H21, S3 }

  _Q3.i16[0] = _Q1.i16[6];
  __asm { FCVT            S6, H3 }

  _S22 = fabsf(_S6);
  _Q3.i16[0] = _Q1.i16[5];
  __asm { FCVT            S7, H3 }

  _S23 = fabsf(_S7);
  _Q3.i16[0] = _Q1.i16[4];
  __asm { FCVT            S16, H3 }

  _S24 = fabsf(_S16);
  _Q3.i16[0] = _Q1.i16[3];
  __asm { FCVT            S17, H3 }

  _S25 = fabsf(_S17);
  _Q3.i16[0] = _Q1.i16[2];
  __asm { FCVT            S18, H3 }

  _S26 = fabsf(_S18);
  __asm { FCVT            S19, H1 }

  *(float *)_Q3.i32 = fabsf(_S19);
  __asm { FCVT            H3, S3 }

  LOWORD(_S20) = _Q1.i16[1];
  __asm { FCVT            S20, H20 }

  _S27 = fabsf(_S20);
  __asm
  {
    FCVT            H27, S27
    FCVT            S27, H27
    FCVT            S3, H3
    FCVT            H26, S26
    FCVT            S26, H26
    FCVT            H25, S25
    FCVT            S25, H25
    FCVT            H24, S24
    FCVT            S24, H24
    FCVT            H23, S23
    FCVT            S23, H23
    FCVT            H22, S22
    FCVT            S22, H22
    FCVT            S21, H21
  }

  LOWORD(_S2) = _Q4.i16[7] | 0x6400;
  __asm { FCVT            S2, H2 }

  *(float *)_Q5.i32 = _S2 + *(float *)_Q5.i32;
  __asm { FCVT            H5, S5 }

  LOWORD(_S21) = _Q4.i16[6] | 0x6400;
  __asm { FCVT            S21, H21 }

  _S6 = _S21 + _S6;
  __asm { FCVT            H6, S6 }

  LOWORD(_S22) = _Q4.i16[5] | 0x6400;
  __asm { FCVT            S22, H22 }

  _S7 = _S22 + _S7;
  __asm { FCVT            H7, S7 }

  LOWORD(_S23) = _Q4.i16[4] | 0x6400;
  __asm { FCVT            S23, H23 }

  _S16 = _S23 + _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S24) = _Q4.i16[3] | 0x6400;
  __asm { FCVT            S24, H24 }

  _S17 = _S24 + _S17;
  LOWORD(_S25) = _Q4.i16[2] | 0x6400;
  __asm { FCVT            S25, H25 }

  _S18 = _S25 + _S18;
  __asm { FCVT            S26, H4 }

  _S19 = _S26 + _S19;
  __asm { FCVT            H19, S19 }

  _Q4.i16[0] = _Q4.i16[1] | 0x6400;
  __asm { FCVT            S4, H4 }

  _S20 = *(float *)_Q4.i32 + _S20;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  *(float *)_Q4.i32 = _S20 - *(float *)_Q4.i32;
  __asm
  {
    FCVT            H4, S4
    FCVT            S19, H19
  }

  _S19 = _S19 - _S26;
  __asm
  {
    FCVT            H19, S19
    FCVT            H4, S18
    FCVT            S4, H4
  }

  *(float *)_Q4.i32 = *(float *)_Q4.i32 - _S25;
  __asm
  {
    FCVT            H4, S4
    FCVT            H4, S17
    FCVT            S4, H4
  }

  *(float *)_Q4.i32 = *(float *)_Q4.i32 - _S24;
  __asm
  {
    FCVT            H4, S4
    FCVT            S4, H16
  }

  *(float *)_Q4.i32 = *(float *)_Q4.i32 - _S23;
  __asm
  {
    FCVT            H4, S4
    FCVT            S4, H7
  }

  *(float *)_Q4.i32 = *(float *)_Q4.i32 - _S22;
  __asm
  {
    FCVT            H4, S4
    FCVT            S4, H6
  }

  *(float *)_Q4.i32 = *(float *)_Q4.i32 - _S21;
  __asm
  {
    FCVT            H4, S4
    FCVT            S4, H5
  }

  _S2 = *(float *)_Q4.i32 - _S2;
  __asm { FCVT            H2, S2 }

__n128 sqrt(_:)()
{
  __int16 v16 = v0;
  __sqrtf16();
  __int16 v14 = v1;
  __sqrtf16();
  __int16 v13 = v2;
  __sqrtf16();
  __int16 v12 = v3;
  __sqrtf16();
  __int16 v15 = v4;
  __sqrtf16();
  __int16 v11 = v5;
  __sqrtf16();
  __int16 v10 = v6;
  __sqrtf16();
  LOWORD(v7) = v16;
  WORD1(v7) = v14;
  WORD2(v7) = v13;
  WORD3(v7) = v12;
  WORD4(v7) = v15;
  WORD5(v7) = v11;
  WORD6(v7) = v10;
  HIWORD(v7) = v8;
  __int128 v17 = v7;
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  return (__n128)v17;
}

{
  __int16 v0;
  __int16 v1;
  __int16 v2;
  __int16 v3;
  __int16 v4;
  __int16 v5;
  __int16 v6;
  __int128 v7;
  __int16 v8;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int128 v17;
  __sqrtf16();
  __int16 v16 = v0;
  __sqrtf16();
  __int16 v14 = v1;
  __sqrtf16();
  __int16 v13 = v2;
  __sqrtf16();
  __int16 v12 = v3;
  __sqrtf16();
  __int16 v15 = v4;
  __sqrtf16();
  __int16 v11 = v5;
  __sqrtf16();
  __int16 v10 = v6;
  __sqrtf16();
  LOWORD(v7) = v16;
  WORD1(v7) = v14;
  WORD2(v7) = v13;
  WORD3(v7) = v12;
  WORD4(v7) = v15;
  WORD5(v7) = v11;
  WORD6(v7) = v10;
  HIWORD(v7) = v8;
  __int128 v17 = v7;
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  __sqrtf16();
  return (__n128)v17;
}

__n64 abs(_:)(__n64 result)
{
  result.n64_u32[0] &= 0x7FFF7FFFu;
  result.n64_u16[2] &= ~0x8000u;
  result.n64_u16[3] &= ~0x8000u;
  return result;
}

{
  result.n64_u32[0] &= 0x7FFF7FFFu;
  result.n64_u16[2] &= ~0x8000u;
  result.n64_u16[3] &= ~0x8000u;
  return result;
}

int8x8_t min(_:_:)(float16x4_t a1, double a2, float16x4_t a3)
{
  float32x4_t v3 = vcvtq_f32_f16(a3);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(v3, vcvtq_f32_f16(a1))),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v3), (int8x16_t)vcgezq_f32(v3)))),  (int8x8_t)a1,  (int8x8_t)a3);
}

int8x8_t max(_:_:)(float16x4_t a1, double a2, float16x4_t a3)
{
  float32x4_t v3 = vcvtq_f32_f16(a3);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(vcvtq_f32_f16(a1), v3)),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v3), (int8x16_t)vcgezq_f32(v3)))),  (int8x8_t)a1,  (int8x8_t)a3);
}

int8x8_t min(_:_:)(float16x4_t a1, double a2, int16x4_t a3)
{
  float16x4_t v3 = (float16x4_t)vdup_lane_s16(a3, 0);
  float32x4_t v4 = vcvtq_f32_f16(v3);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(v4, vcvtq_f32_f16(a1))),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v4), (int8x16_t)vcgezq_f32(v4)))),  (int8x8_t)a1,  (int8x8_t)v3);
}

int8x8_t max(_:_:)(float16x4_t a1, double a2, int16x4_t a3)
{
  float16x4_t v3 = (float16x4_t)vdup_lane_s16(a3, 0);
  float32x4_t v4 = vcvtq_f32_f16(v3);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(vcvtq_f32_f16(a1), v4)),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v4), (int8x16_t)vcgezq_f32(v4)))),  (int8x8_t)a1,  (int8x8_t)v3);
}

void ceil(_:)(int8x16_t _Q0, int8x16_t _Q1, int8x16_t _Q2, int8x16_t _Q3)
{
  v4.i64[0] = 0x3C003C003C003C00LL;
  v4.i64[1] = 0x3C003C003C003C00LL;
  _Q23 = vandq_s8(_Q0, v4);
  _H5 = _Q23.i16[7];
  __asm { FCVT            S7, H5 }

  _S5 = _S7 + _S7;
  __asm
  {
    FCVT            H5, S5
    FCVT            S6, H5
  }

  _S6 = 1.0 - _S6;
  __asm { FCVT            H6, S6 }

  _H16 = _Q23.i16[6];
  __asm { FCVT            S16, H16 }

  _S17 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  _S17 = 1.0 - _S17;
  __asm { FCVT            H22, S17 }

  LOWORD(_S17) = _Q23.i16[4];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S18 = 1.0 - _S18;
  __asm { FCVT            H21, S18 }

  LOWORD(_S18) = _Q23.i16[5];
  __asm { FCVT            S18, H18 }

  _S19 = _S18 + _S18;
  __asm
  {
    FCVT            H19, S19
    FCVT            S19, H19
  }

  _S19 = 1.0 - _S19;
  __asm { FCVT            H24, S19 }

  LOWORD(_S19) = _Q23.i16[3];
  __asm { FCVT            S19, H19 }

  _S20 = _S19 + _S19;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  _S20 = 1.0 - _S20;
  __asm { FCVT            H25, S20 }

  LOWORD(_S20) = _Q23.i16[2];
  __asm { FCVT            S20, H20 }

  _S26 = _S20 + _S20;
  __asm
  {
    FCVT            H26, S26
    FCVT            S26, H26
  }

  _S26 = 1.0 - _S26;
  __asm
  {
    FCVT            H26, S26
    FCVT            S27, H23
  }

  _S28 = _S27 + _S27;
  __asm
  {
    FCVT            H28, S28
    FCVT            S28, H28
  }

  *(float *)_D28.i32 = 1.0 - _S28;
  __asm { FCVT            H28, S28 }

  _Q23.i16[0] = _Q23.i16[1];
  __asm { FCVT            S23, H23 }

  _S29 = *(float *)_Q23.i32 + *(float *)_Q23.i32;
  __asm
  {
    FCVT            H29, S29
    FCVT            S29, H29
  }

  _S29 = 1.0 - _S29;
  __asm { FCVT            H29, S29 }

  _D28.i16[1] = LOWORD(_S29);
  _D28.i16[2] = LOWORD(_S26);
  _D28.i16[3] = _H25;
  *(int8x8_t *)v47.i8 = vand_s8(_D28, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D28))));
  _D21.i16[1] = _H24;
  _D21.i16[2] = _H22;
  _D21.i16[3] = LOWORD(_S6);
  v47.u64[1] = (unint64_t)vand_s8(_D21, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D21))));
  else {
    __int16 v48 = -1;
  }
  if (_S27 >= 1024.0) {
    __int16 v49 = 0;
  }
  else {
    __int16 v49 = -1;
  }
  v50.i16[0] = v49;
  v50.i16[1] = v48;
  if (_S20 >= 1024.0) {
    __int16 v51 = 0;
  }
  else {
    __int16 v51 = -1;
  }
  v50.i16[2] = v51;
  if (_S19 >= 1024.0) {
    __int16 v52 = 0;
  }
  else {
    __int16 v52 = -1;
  }
  v50.i16[3] = v52;
  if (_S17 >= 1024.0) {
    __int16 v53 = 0;
  }
  else {
    __int16 v53 = -1;
  }
  v50.i16[4] = v53;
  if (_S18 >= 1024.0) {
    __int16 v54 = 0;
  }
  else {
    __int16 v54 = -1;
  }
  v50.i16[5] = v54;
  if (_S16 >= 1024.0) {
    __int16 v55 = 0;
  }
  else {
    __int16 v55 = -1;
  }
  v50.i16[6] = v55;
  if (_S7 >= 1024.0) {
    __int16 v56 = 0;
  }
  else {
    __int16 v56 = -1;
  }
  v50.i16[7] = v56;
  _Q7 = vandq_s8(vornq_s8(vandq_s8(v47, v50), v50), _Q0);
  _H16 = _Q7.i16[1];
  _H17 = _Q0.u16[1];
  __asm
  {
    FCVT            S17, H17
    FCVT            S16, H16
  }

  if (_S16 >= _S17) {
    __int16 v62 = 0;
  }
  else {
    __int16 v62 = -1;
  }
  __asm
  {
    FCVT            S17, H0
    FCVT            S18, H7
  }

  if (_S18 >= _S17) {
    __int16 v65 = 0;
  }
  else {
    __int16 v65 = -1;
  }
  v66.i16[0] = v65;
  v66.i16[1] = v62;
  _H19 = _Q7.i16[2];
  _H20 = _Q0.u16[2];
  __asm
  {
    FCVT            S20, H20
    FCVT            S19, H19
  }

  if (_S19 >= _S20) {
    __int16 v71 = 0;
  }
  else {
    __int16 v71 = -1;
  }
  v66.i16[2] = v71;
  _H20 = _Q7.i16[3];
  _H21 = _Q0.u16[3];
  __asm
  {
    FCVT            S21, H21
    FCVT            S20, H20
  }

  if (_S20 >= _S21) {
    __int16 v76 = 0;
  }
  else {
    __int16 v76 = -1;
  }
  v66.i16[3] = v76;
  _H21 = _Q7.i16[4];
  _H22 = _Q0.u16[4];
  __asm
  {
    FCVT            S22, H22
    FCVT            S21, H21
  }

  if (_S21 >= _S22) {
    __int16 v81 = 0;
  }
  else {
    __int16 v81 = -1;
  }
  v66.i16[4] = v81;
  _H22 = _Q7.i16[5];
  _H23 = _Q0.u16[5];
  __asm
  {
    FCVT            S23, H23
    FCVT            S22, H22
  }

  if (_S22 >= _S23) {
    __int16 v86 = 0;
  }
  else {
    __int16 v86 = -1;
  }
  v66.i16[5] = v86;
  _H23 = _Q7.i16[6];
  _H24 = _Q0.u16[6];
  __asm
  {
    FCVT            S24, H24
    FCVT            S23, H23
  }

  if (_S23 >= _S24) {
    __int16 v91 = 0;
  }
  else {
    __int16 v91 = -1;
  }
  v66.i16[6] = v91;
  _H7 = _Q7.i16[7];
  _H24 = _Q0.u16[7];
  __asm
  {
    FCVT            S24, H24
    FCVT            S7, H7
  }

  if (_S7 >= _S24) {
    __int16 v96 = 0;
  }
  else {
    __int16 v96 = -1;
  }
  v66.i16[7] = v96;
  _Q17 = vandq_s8(v4, v66);
  _H24 = _Q17.i16[1];
  __asm { FCVT            S24, H24 }

  _S16 = _S24 + _S16;
  __asm
  {
    FCVT            H24, S16
    FCVT            S16, H17
  }

  _S16 = _S16 + _S18;
  __asm { FCVT            H16, S16 }

  _H18 = _Q17.i16[2];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S19;
  __asm { FCVT            H18, S18 }

  LOWORD(_S18) = _Q17.i16[3];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S20;
  __asm { FCVT            H18, S18 }

  LOWORD(_S18) = _Q17.i16[4];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S21;
  __asm { FCVT            H18, S18 }

  LOWORD(_S18) = _Q17.i16[5];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S22;
  __asm { FCVT            H18, S18 }

  LOWORD(_S18) = _Q17.i16[6];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S23;
  __asm { FCVT            H18, S18 }

  _Q17.i16[0] = _Q17.i16[7];
  __asm { FCVT            S17, H17 }

  _S7 = *(float *)_Q17.i32 + _S7;
  __asm { FCVT            H7, S7 }

  _Q25 = vandq_s8(_Q1, v4);
  LOWORD(_S7) = _Q25.i16[7];
  __asm { FCVT            S17, H7 }

  _S7 = _S17 + _S17;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H7
  }

  _S7 = 1.0 - _S7;
  __asm { FCVT            H7, S7 }

  LOWORD(_S18) = _Q25.i16[6];
  __asm { FCVT            S18, H18 }

  _S19 = _S18 + _S18;
  __asm
  {
    FCVT            H19, S19
    FCVT            S19, H19
  }

  _S19 = 1.0 - _S19;
  __asm { FCVT            H24, S19 }

  LOWORD(_S19) = _Q25.i16[4];
  __asm { FCVT            S19, H19 }

  _S20 = _S19 + _S19;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  _S20 = 1.0 - _S20;
  __asm { FCVT            H22, S20 }

  LOWORD(_S20) = _Q25.i16[5];
  __asm { FCVT            S20, H20 }

  _S21 = _S20 + _S20;
  __asm
  {
    FCVT            H21, S21
    FCVT            S21, H21
  }

  _S21 = 1.0 - _S21;
  __asm { FCVT            H26, S21 }

  LOWORD(_S21) = _Q25.i16[3];
  __asm { FCVT            S21, H21 }

  _S23 = _S21 + _S21;
  __asm
  {
    FCVT            H23, S23
    FCVT            S23, H23
  }

  _S23 = 1.0 - _S23;
  __asm { FCVT            H27, S23 }

  LOWORD(_S23) = _Q25.i16[2];
  __asm { FCVT            S23, H23 }

  _S28 = _S23 + _S23;
  __asm
  {
    FCVT            H28, S28
    FCVT            S28, H28
  }

  _S28 = 1.0 - _S28;
  __asm
  {
    FCVT            H28, S28
    FCVT            S29, H25
  }

  _S30 = _S29 + _S29;
  __asm
  {
    FCVT            H30, S30
    FCVT            S30, H30
  }

  *(float *)_D30.i32 = 1.0 - _S30;
  __asm { FCVT            H30, S30 }

  _Q25.i16[0] = _Q25.i16[1];
  __asm { FCVT            S25, H25 }

  _S31 = *(float *)_Q25.i32 + *(float *)_Q25.i32;
  __asm
  {
    FCVT            H31, S31
    FCVT            S31, H31
  }

  _S31 = 1.0 - _S31;
  __asm { FCVT            H31, S31 }

  _D30.i16[1] = LOWORD(_S31);
  _D30.i16[2] = LOWORD(_S28);
  _D30.i16[3] = _H27;
  *(int8x8_t *)v150.i8 = vand_s8(_D30, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D30))));
  _D22.i16[1] = _H26;
  _D22.i16[2] = LOWORD(_S24);
  _D22.i16[3] = LOWORD(_S7);
  v150.u64[1] = (unint64_t)vand_s8(_D22, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D22))));
  else {
    __int16 v151 = -1;
  }
  if (_S29 >= 1024.0) {
    __int16 v152 = 0;
  }
  else {
    __int16 v152 = -1;
  }
  v153.i16[0] = v152;
  v153.i16[1] = v151;
  if (_S23 >= 1024.0) {
    __int16 v154 = 0;
  }
  else {
    __int16 v154 = -1;
  }
  v153.i16[2] = v154;
  if (_S21 >= 1024.0) {
    __int16 v155 = 0;
  }
  else {
    __int16 v155 = -1;
  }
  v153.i16[3] = v155;
  if (_S19 >= 1024.0) {
    __int16 v156 = 0;
  }
  else {
    __int16 v156 = -1;
  }
  v153.i16[4] = v156;
  if (_S20 >= 1024.0) {
    __int16 v157 = 0;
  }
  else {
    __int16 v157 = -1;
  }
  v153.i16[5] = v157;
  if (_S18 >= 1024.0) {
    __int16 v158 = 0;
  }
  else {
    __int16 v158 = -1;
  }
  v153.i16[6] = v158;
  if (_S17 >= 1024.0) {
    __int16 v159 = 0;
  }
  else {
    __int16 v159 = -1;
  }
  v153.i16[7] = v159;
  _Q17 = vandq_s8(vornq_s8(vandq_s8(v150, v153), v153), _Q1);
  _H18 = _Q17.i16[1];
  _H19 = _Q1.u16[1];
  __asm
  {
    FCVT            S19, H19
    FCVT            S18, H18
  }

  if (_S18 >= _S19) {
    __int16 v165 = 0;
  }
  else {
    __int16 v165 = -1;
  }
  __asm
  {
    FCVT            S19, H1
    FCVT            S20, H17
  }

  if (_S20 >= _S19) {
    __int16 v168 = 0;
  }
  else {
    __int16 v168 = -1;
  }
  v169.i16[0] = v168;
  v169.i16[1] = v165;
  _H21 = _Q17.i16[2];
  _H22 = _Q1.u16[2];
  __asm
  {
    FCVT            S22, H22
    FCVT            S21, H21
  }

  if (_S21 >= _S22) {
    __int16 v174 = 0;
  }
  else {
    __int16 v174 = -1;
  }
  v169.i16[2] = v174;
  _H22 = _Q17.i16[3];
  _H23 = _Q1.u16[3];
  __asm
  {
    FCVT            S23, H23
    FCVT            S22, H22
  }

  if (_S22 >= _S23) {
    __int16 v179 = 0;
  }
  else {
    __int16 v179 = -1;
  }
  v169.i16[3] = v179;
  _H23 = _Q17.i16[4];
  _H24 = _Q1.u16[4];
  __asm
  {
    FCVT            S24, H24
    FCVT            S23, H23
  }

  if (_S23 >= _S24) {
    __int16 v184 = 0;
  }
  else {
    __int16 v184 = -1;
  }
  v169.i16[4] = v184;
  _H24 = _Q17.i16[5];
  _H25 = _Q1.u16[5];
  __asm
  {
    FCVT            S25, H25
    FCVT            S24, H24
  }

  if (_S24 >= _S25) {
    __int16 v189 = 0;
  }
  else {
    __int16 v189 = -1;
  }
  v169.i16[5] = v189;
  _H25 = _Q17.i16[6];
  _H26 = _Q1.u16[6];
  __asm
  {
    FCVT            S26, H26
    FCVT            S25, H25
  }

  if (_S25 >= _S26) {
    __int16 v194 = 0;
  }
  else {
    __int16 v194 = -1;
  }
  v169.i16[6] = v194;
  _H17 = _Q17.i16[7];
  _H26 = _Q1.u16[7];
  __asm
  {
    FCVT            S26, H26
    FCVT            S17, H17
  }

  if (_S17 >= _S26) {
    __int16 v199 = 0;
  }
  else {
    __int16 v199 = -1;
  }
  v169.i16[7] = v199;
  _Q19 = vandq_s8(v4, v169);
  _H16 = _Q19.i16[1];
  __asm { FCVT            S16, H16 }

  _S16 = _S16 + _S18;
  __asm
  {
    FCVT            H18, S16
    FCVT            S16, H19
  }

  _S16 = _S16 + _S20;
  __asm { FCVT            H16, S16 }

  _H18 = _Q19.i16[2];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S21;
  __asm { FCVT            H18, S18 }

  LOWORD(_S18) = _Q19.i16[3];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S22;
  __asm { FCVT            H18, S18 }

  LOWORD(_S18) = _Q19.i16[4];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S23;
  __asm { FCVT            H18, S18 }

  LOWORD(_S18) = _Q19.i16[5];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S24;
  __asm { FCVT            H18, S18 }

  LOWORD(_S18) = _Q19.i16[6];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S25;
  __asm { FCVT            H18, S18 }

  LOWORD(_S18) = _Q19.i16[7];
  __asm { FCVT            S18, H18 }

  _S17 = _S18 + _S17;
  __asm { FCVT            H17, S17 }

  _Q26 = vandq_s8(_Q2, v4);
  LOWORD(_S17) = _Q26.i16[7];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S18 = 1.0 - _S18;
  __asm { FCVT            H21, S18 }

  LOWORD(_S18) = _Q26.i16[6];
  __asm { FCVT            S18, H18 }

  *(float *)_Q19.i32 = _S18 + _S18;
  __asm
  {
    FCVT            H19, S19
    FCVT            S19, H19
  }

  *(float *)_Q19.i32 = 1.0 - *(float *)_Q19.i32;
  __asm { FCVT            H25, S19 }

  _Q19.i16[0] = _Q26.i16[4];
  __asm { FCVT            S19, H19 }

  _S20 = _S19 + _S19;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  _S20 = 1.0 - _S20;
  __asm { FCVT            H23, S20 }

  LOWORD(_S20) = _Q26.i16[5];
  __asm { FCVT            S20, H20 }

  _S22 = _S20 + _S20;
  __asm
  {
    FCVT            H22, S22
    FCVT            S22, H22
  }

  _S27 = 1.0 - _S22;
  LOWORD(_S22) = _Q26.i16[3];
  __asm { FCVT            S22, H22 }

  _S24 = _S22 + _S22;
  __asm
  {
    FCVT            H24, S24
    FCVT            S24, H24
  }

  _S24 = 1.0 - _S24;
  __asm { FCVT            H28, S24 }

  LOWORD(_S24) = _Q26.i16[2];
  __asm { FCVT            S24, H24 }

  _S29 = _S24 + _S24;
  __asm
  {
    FCVT            H29, S29
    FCVT            S29, H29
  }

  _S29 = 1.0 - _S29;
  __asm
  {
    FCVT            H29, S29
    FCVT            S30, H26
  }

  _S31 = _S30 + _S30;
  __asm
  {
    FCVT            H31, S31
    FCVT            S31, H31
  }

  *(float *)_D31.i32 = 1.0 - _S31;
  __asm { FCVT            H31, S31 }

  _Q26.i16[0] = _Q26.i16[1];
  __asm { FCVT            S26, H26 }

  _S8 = *(float *)_Q26.i32 + *(float *)_Q26.i32;
  __asm
  {
    FCVT            H8, S8
    FCVT            S8, H8
  }

  _S8 = 1.0 - _S8;
  __asm { FCVT            H8, S8 }

  _D31.i16[1] = LOWORD(_S8);
  _D31.i16[2] = LOWORD(_S29);
  _D31.i16[3] = _H28;
  __asm { FCVT            H27, S27 }

  _D23.i16[1] = LOWORD(_S27);
  *(int8x8_t *)v253.i8 = vand_s8(_D31, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D31))));
  _D23.i16[2] = _H25;
  _D23.i16[3] = _H21;
  v253.u64[1] = (unint64_t)vand_s8(_D23, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D23))));
  else {
    __int16 v254 = -1;
  }
  if (_S30 >= 1024.0) {
    __int16 v255 = 0;
  }
  else {
    __int16 v255 = -1;
  }
  v256.i16[0] = v255;
  v256.i16[1] = v254;
  if (_S24 >= 1024.0) {
    __int16 v257 = 0;
  }
  else {
    __int16 v257 = -1;
  }
  v256.i16[2] = v257;
  if (_S22 >= 1024.0) {
    __int16 v258 = 0;
  }
  else {
    __int16 v258 = -1;
  }
  v256.i16[3] = v258;
  if (_S19 >= 1024.0) {
    __int16 v259 = 0;
  }
  else {
    __int16 v259 = -1;
  }
  v256.i16[4] = v259;
  if (_S20 >= 1024.0) {
    __int16 v260 = 0;
  }
  else {
    __int16 v260 = -1;
  }
  v256.i16[5] = v260;
  if (_S18 >= 1024.0) {
    __int16 v261 = 0;
  }
  else {
    __int16 v261 = -1;
  }
  v256.i16[6] = v261;
  if (_S17 >= 1024.0) {
    __int16 v262 = 0;
  }
  else {
    __int16 v262 = -1;
  }
  v256.i16[7] = v262;
  _Q17 = vandq_s8(vornq_s8(vandq_s8(v253, v256), v256), _Q2);
  _H18 = _Q17.i16[1];
  _H19 = _Q2.u16[1];
  __asm
  {
    FCVT            S19, H19
    FCVT            S18, H18
  }

  if (_S19 <= _S18) {
    __int16 v268 = 0;
  }
  else {
    __int16 v268 = -1;
  }
  __asm
  {
    FCVT            S19, H2
    FCVT            S20, H17
  }

  if (_S19 <= _S20) {
    __int16 v271 = 0;
  }
  else {
    __int16 v271 = -1;
  }
  v272.i16[0] = v271;
  v272.i16[1] = v268;
  _H21 = _Q17.i16[2];
  _H22 = _Q2.u16[2];
  __asm
  {
    FCVT            S22, H22
    FCVT            S21, H21
  }

  if (_S22 <= _S21) {
    __int16 v277 = 0;
  }
  else {
    __int16 v277 = -1;
  }
  v272.i16[2] = v277;
  _H22 = _Q17.i16[3];
  _H23 = _Q2.u16[3];
  __asm
  {
    FCVT            S23, H23
    FCVT            S22, H22
  }

  if (_S23 <= _S22) {
    __int16 v282 = 0;
  }
  else {
    __int16 v282 = -1;
  }
  v272.i16[3] = v282;
  _H23 = _Q17.i16[4];
  _H24 = _Q2.u16[4];
  __asm
  {
    FCVT            S24, H24
    FCVT            S23, H23
  }

  if (_S24 <= _S23) {
    __int16 v287 = 0;
  }
  else {
    __int16 v287 = -1;
  }
  v272.i16[4] = v287;
  _H24 = _Q17.i16[5];
  _H25 = _Q2.u16[5];
  __asm
  {
    FCVT            S25, H25
    FCVT            S24, H24
  }

  if (_S25 <= _S24) {
    __int16 v292 = 0;
  }
  else {
    __int16 v292 = -1;
  }
  v272.i16[5] = v292;
  _H16 = _Q17.i16[6];
  _H25 = _Q2.u16[6];
  __asm
  {
    FCVT            S25, H25
    FCVT            S26, H16
  }

  if (_S25 <= _S26) {
    __int16 v297 = 0;
  }
  else {
    __int16 v297 = -1;
  }
  v272.i16[6] = v297;
  _H16 = _Q17.i16[7];
  _H17 = _Q2.u16[7];
  __asm
  {
    FCVT            S17, H17
    FCVT            S25, H16
  }

  if (_S17 <= _S25) {
    __int16 v302 = 0;
  }
  else {
    __int16 v302 = -1;
  }
  v272.i16[7] = v302;
  _Q17 = vandq_s8(v4, v272);
  _H16 = _Q17.i16[1];
  __asm { FCVT            S16, H16 }

  _S16 = _S16 + _S18;
  __asm
  {
    FCVT            H18, S16
    FCVT            S16, H17
  }

  _S16 = _S16 + _S20;
  __asm { FCVT            H16, S16 }

  _H18 = _Q17.i16[2];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S21;
  __asm { FCVT            H18, S18 }

  LOWORD(_S18) = _Q17.i16[3];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S22;
  __asm { FCVT            H18, S18 }

  LOWORD(_S18) = _Q17.i16[4];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S23;
  __asm { FCVT            H18, S18 }

  LOWORD(_S18) = _Q17.i16[5];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S24;
  __asm { FCVT            H18, S18 }

  LOWORD(_S18) = _Q17.i16[6];
  __asm { FCVT            S18, H18 }

  _S18 = _S18 + _S26;
  __asm { FCVT            H18, S18 }

  _Q17.i16[0] = _Q17.i16[7];
  __asm { FCVT            S17, H17 }

  *(float *)_Q17.i32 = *(float *)_Q17.i32 + _S25;
  __asm { FCVT            H17, S17 }

  _Q23 = vandq_s8(_Q3, v4);
  _Q17.i16[0] = _Q23.i16[7];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S24 = 1.0 - _S18;
  LOWORD(_S18) = _Q23.i16[6];
  __asm { FCVT            S18, H18 }

  _S19 = _S18 + _S18;
  __asm
  {
    FCVT            H19, S19
    FCVT            S19, H19
  }

  _S25 = 1.0 - _S19;
  LOWORD(_S19) = _Q23.i16[4];
  __asm { FCVT            S19, H19 }

  _S20 = _S19 + _S19;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  *(float *)_D26.i32 = 1.0 - _S20;
  LOWORD(_S20) = _Q23.i16[5];
  __asm { FCVT            S20, H20 }

  _S21 = _S20 + _S20;
  __asm
  {
    FCVT            H21, S21
    FCVT            S21, H21
  }

  _S27 = 1.0 - _S21;
  LOWORD(_S21) = _Q23.i16[3];
  __asm { FCVT            S21, H21 }

  _S22 = _S21 + _S21;
  __asm
  {
    FCVT            H22, S22
    FCVT            S22, H22
  }

  _S28 = 1.0 - _S22;
  LOWORD(_S22) = _Q23.i16[2];
  __asm { FCVT            S22, H22 }

  _S29 = _S22 + _S22;
  __asm
  {
    FCVT            H29, S29
    FCVT            S29, H29
  }

  _S29 = 1.0 - _S29;
  __asm { FCVT            S30, H23 }

  _S31 = _S30 + _S30;
  __asm
  {
    FCVT            H31, S31
    FCVT            S31, H31
  }

  *(float *)_D31.i32 = 1.0 - _S31;
  _Q23.i16[0] = _Q23.i16[1];
  __asm { FCVT            S23, H23 }

  _S8 = *(float *)_Q23.i32 + *(float *)_Q23.i32;
  __asm
  {
    FCVT            H8, S8
    FCVT            S8, H8
  }

  _S5 = 1.0 - _S8;
  __asm
  {
    FCVT            H24, S24
    FCVT            H25, S25
    FCVT            H26, S26
    FCVT            H27, S27
    FCVT            H28, S28
    FCVT            H31, S31
    FCVT            H5, S5
  }

  _D31.i16[1] = LOWORD(_S5);
  __asm { FCVT            H5, S29 }

  _D31.i16[2] = LOWORD(_S5);
  _D31.i16[3] = LOWORD(_S28);
  _D26.i16[1] = LOWORD(_S27);
  _D26.i16[2] = LOWORD(_S25);
  *(int8x8_t *)v353.i8 = vand_s8(_D31, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D31))));
  _D26.i16[3] = LOWORD(_S24);
  v353.u64[1] = (unint64_t)vand_s8(_D26, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D26))));
  else {
    __int16 v354 = -1;
  }
  if (_S30 >= 1024.0) {
    __int16 v355 = 0;
  }
  else {
    __int16 v355 = -1;
  }
  v356.i16[0] = v355;
  v356.i16[1] = v354;
  if (_S22 >= 1024.0) {
    __int16 v357 = 0;
  }
  else {
    __int16 v357 = -1;
  }
  v356.i16[2] = v357;
  if (_S21 >= 1024.0) {
    __int16 v358 = 0;
  }
  else {
    __int16 v358 = -1;
  }
  v356.i16[3] = v358;
  if (_S19 >= 1024.0) {
    __int16 v359 = 0;
  }
  else {
    __int16 v359 = -1;
  }
  v356.i16[4] = v359;
  if (_S20 >= 1024.0) {
    __int16 v360 = 0;
  }
  else {
    __int16 v360 = -1;
  }
  v356.i16[5] = v360;
  if (_S18 >= 1024.0) {
    __int16 v361 = 0;
  }
  else {
    __int16 v361 = -1;
  }
  v356.i16[6] = v361;
  if (_S17 >= 1024.0) {
    __int16 v362 = 0;
  }
  else {
    __int16 v362 = -1;
  }
  v356.i16[7] = v362;
  _Q5 = vandq_s8(vornq_s8(vandq_s8(v353, v356), v356), _Q3);
  _H6 = _Q5.i16[1];
  _H17 = _Q3.u16[1];
  __asm
  {
    FCVT            S17, H17
    FCVT            S6, H6
  }

  if (_S17 <= _S6) {
    __int16 v368 = 0;
  }
  else {
    __int16 v368 = -1;
  }
  __asm
  {
    FCVT            S17, H3
    FCVT            S18, H5
  }

  if (_S17 <= _S18) {
    __int16 v371 = 0;
  }
  else {
    __int16 v371 = -1;
  }
  v372.i16[0] = v371;
  v372.i16[1] = v368;
  _H19 = _Q5.i16[2];
  _H20 = _Q3.u16[2];
  __asm
  {
    FCVT            S20, H20
    FCVT            S19, H19
  }

  if (_S20 <= _S19) {
    __int16 v377 = 0;
  }
  else {
    __int16 v377 = -1;
  }
  v372.i16[2] = v377;
  _H20 = _Q5.i16[3];
  _H21 = _Q3.u16[3];
  __asm
  {
    FCVT            S21, H21
    FCVT            S20, H20
  }

  if (_S21 <= _S20) {
    __int16 v382 = 0;
  }
  else {
    __int16 v382 = -1;
  }
  v372.i16[3] = v382;
  _H21 = _Q5.i16[4];
  _H22 = _Q3.u16[4];
  __asm
  {
    FCVT            S22, H22
    FCVT            S21, H21
  }

  if (_S22 <= _S21) {
    __int16 v387 = 0;
  }
  else {
    __int16 v387 = -1;
  }
  v372.i16[4] = v387;
  _H22 = _Q5.i16[5];
  _H23 = _Q3.u16[5];
  __asm
  {
    FCVT            S23, H23
    FCVT            S22, H22
  }

  if (_S23 <= _S22) {
    __int16 v392 = 0;
  }
  else {
    __int16 v392 = -1;
  }
  v372.i16[5] = v392;
  _H23 = _Q5.i16[6];
  _H24 = _Q3.u16[6];
  __asm
  {
    FCVT            S24, H24
    FCVT            S23, H23
  }

  if (_S24 <= _S23) {
    __int16 v397 = 0;
  }
  else {
    __int16 v397 = -1;
  }
  v372.i16[6] = v397;
  _H5 = _Q5.i16[7];
  _H24 = _Q3.u16[7];
  __asm
  {
    FCVT            S24, H24
    FCVT            S5, H5
  }

  if (_S24 <= _S5) {
    __int16 v402 = 0;
  }
  else {
    __int16 v402 = -1;
  }
  v372.i16[7] = v402;
  _Q4 = vandq_s8(v4, v372);
  _H17 = _Q4.i16[1];
  __asm { FCVT            S17, H17 }

  _S6 = _S17 + _S6;
  __asm
  {
    FCVT            H6, S6
    FCVT            S17, H4
  }

  _S17 = _S17 + _S18;
  __asm { FCVT            H17, S17 }

  LOWORD(_S6) = _Q4.i16[2];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S19;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q4.i16[3];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S20;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q4.i16[4];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S21;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q4.i16[5];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S22;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q4.i16[6];
  __asm { FCVT            S6, H6 }

  _S6 = _S6 + _S23;
  __asm { FCVT            H6, S6 }

  _Q4.i16[0] = _Q4.i16[7];
  __asm { FCVT            S4, H4 }

  *(float *)_Q4.i32 = *(float *)_Q4.i32 + _S5;
  __asm { FCVT            H4, S4 }

void floor(_:)(int8x16_t _Q0, int8x16_t _Q1, int8x16_t _Q2, int8x16_t _Q3)
{
  v4.i64[0] = 0x3C003C003C003C00LL;
  v4.i64[1] = 0x3C003C003C003C00LL;
  _Q23 = vandq_s8(_Q0, v4);
  _H5 = _Q23.i16[7];
  __asm { FCVT            S7, H5 }

  _S5 = _S7 + _S7;
  __asm
  {
    FCVT            H5, S5
    FCVT            S6, H5
  }

  _S6 = 1.0 - _S6;
  __asm { FCVT            H6, S6 }

  _H16 = _Q23.i16[6];
  __asm { FCVT            S16, H16 }

  _S17 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  _S17 = 1.0 - _S17;
  __asm { FCVT            H22, S17 }

  LOWORD(_S17) = _Q23.i16[4];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S18 = 1.0 - _S18;
  __asm { FCVT            H21, S18 }

  LOWORD(_S18) = _Q23.i16[5];
  __asm { FCVT            S18, H18 }

  _S19 = _S18 + _S18;
  __asm
  {
    FCVT            H19, S19
    FCVT            S19, H19
  }

  _S19 = 1.0 - _S19;
  __asm { FCVT            H24, S19 }

  LOWORD(_S19) = _Q23.i16[3];
  __asm { FCVT            S19, H19 }

  _S20 = _S19 + _S19;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  _S20 = 1.0 - _S20;
  __asm { FCVT            H25, S20 }

  LOWORD(_S20) = _Q23.i16[2];
  __asm { FCVT            S20, H20 }

  _S26 = _S20 + _S20;
  __asm
  {
    FCVT            H26, S26
    FCVT            S26, H26
  }

  _S26 = 1.0 - _S26;
  __asm { FCVT            S27, H23 }

  _S28 = _S27 + _S27;
  __asm
  {
    FCVT            H28, S28
    FCVT            S28, H28
  }

  *(float *)_D28.i32 = 1.0 - _S28;
  __asm { FCVT            H28, S28 }

  _Q23.i16[0] = _Q23.i16[1];
  __asm { FCVT            S23, H23 }

  _S29 = *(float *)_Q23.i32 + *(float *)_Q23.i32;
  __asm
  {
    FCVT            H29, S29
    FCVT            S29, H29
  }

  _S29 = 1.0 - _S29;
  __asm { FCVT            H29, S29 }

  _D28.i16[1] = LOWORD(_S29);
  __asm { FCVT            H26, S26 }

  _D28.i16[2] = LOWORD(_S26);
  _D28.i16[3] = _H25;
  _D21.i16[1] = _H24;
  _D21.i16[2] = _H22;
  *(int8x8_t *)v47.i8 = vand_s8(_D28, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D28))));
  _D21.i16[3] = LOWORD(_S6);
  v47.u64[1] = (unint64_t)vand_s8(_D21, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D21))));
  else {
    __int16 v48 = -1;
  }
  if (_S27 >= 1024.0) {
    __int16 v49 = 0;
  }
  else {
    __int16 v49 = -1;
  }
  v50.i16[0] = v49;
  v50.i16[1] = v48;
  if (_S20 >= 1024.0) {
    __int16 v51 = 0;
  }
  else {
    __int16 v51 = -1;
  }
  v50.i16[2] = v51;
  if (_S19 >= 1024.0) {
    __int16 v52 = 0;
  }
  else {
    __int16 v52 = -1;
  }
  v50.i16[3] = v52;
  if (_S17 >= 1024.0) {
    __int16 v53 = 0;
  }
  else {
    __int16 v53 = -1;
  }
  v50.i16[4] = v53;
  if (_S18 >= 1024.0) {
    __int16 v54 = 0;
  }
  else {
    __int16 v54 = -1;
  }
  v50.i16[5] = v54;
  if (_S16 >= 1024.0) {
    __int16 v55 = 0;
  }
  else {
    __int16 v55 = -1;
  }
  v50.i16[6] = v55;
  if (_S7 >= 1024.0) {
    __int16 v56 = 0;
  }
  else {
    __int16 v56 = -1;
  }
  v50.i16[7] = v56;
  _Q7 = vandq_s8(vornq_s8(vandq_s8(v47, v50), v50), _Q0);
  _H16 = _Q7.i16[1];
  _H17 = _Q0.u16[1];
  __asm
  {
    FCVT            S17, H17
    FCVT            S16, H16
  }

  if (_S16 <= _S17) {
    __int16 v62 = 0;
  }
  else {
    __int16 v62 = -1;
  }
  __asm
  {
    FCVT            S17, H0
    FCVT            S18, H7
  }

  if (_S18 <= _S17) {
    __int16 v65 = 0;
  }
  else {
    __int16 v65 = -1;
  }
  v66.i16[0] = v65;
  v66.i16[1] = v62;
  _H19 = _Q7.i16[2];
  _H20 = _Q0.u16[2];
  __asm
  {
    FCVT            S20, H20
    FCVT            S19, H19
  }

  if (_S19 <= _S20) {
    __int16 v71 = 0;
  }
  else {
    __int16 v71 = -1;
  }
  v66.i16[2] = v71;
  _H20 = _Q7.i16[3];
  _H21 = _Q0.u16[3];
  __asm
  {
    FCVT            S21, H21
    FCVT            S20, H20
  }

  if (_S20 <= _S21) {
    __int16 v76 = 0;
  }
  else {
    __int16 v76 = -1;
  }
  v66.i16[3] = v76;
  _H21 = _Q7.i16[4];
  _H22 = _Q0.u16[4];
  __asm
  {
    FCVT            S22, H22
    FCVT            S21, H21
  }

  if (_S21 <= _S22) {
    __int16 v81 = 0;
  }
  else {
    __int16 v81 = -1;
  }
  v66.i16[4] = v81;
  _H22 = _Q7.i16[5];
  _H23 = _Q0.u16[5];
  __asm
  {
    FCVT            S23, H23
    FCVT            S22, H22
  }

  if (_S22 <= _S23) {
    __int16 v86 = 0;
  }
  else {
    __int16 v86 = -1;
  }
  v66.i16[5] = v86;
  _H23 = _Q7.i16[6];
  _H24 = _Q0.u16[6];
  __asm
  {
    FCVT            S24, H24
    FCVT            S23, H23
  }

  if (_S23 <= _S24) {
    __int16 v91 = 0;
  }
  else {
    __int16 v91 = -1;
  }
  v66.i16[6] = v91;
  _H7 = _Q7.i16[7];
  _H0 = _Q0.u16[7];
  __asm
  {
    FCVT            S0, H0
    FCVT            S7, H7
  }

  if (_S7 <= _S0) {
    __int16 v96 = 0;
  }
  else {
    __int16 v96 = -1;
  }
  v66.i16[7] = v96;
  _Q17 = vandq_s8(v4, v66);
  _H0 = _Q17.i16[1];
  __asm { FCVT            S0, H0 }

  _S0 = _S16 - _S0;
  __asm
  {
    FCVT            H16, S0
    FCVT            S0, H17
  }

  _S0 = _S18 - _S0;
  __asm { FCVT            H0, S0 }

  _H16 = _Q17.i16[2];
  __asm { FCVT            S16, H16 }

  _S16 = _S19 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[3];
  __asm { FCVT            S16, H16 }

  _S16 = _S20 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[4];
  __asm { FCVT            S16, H16 }

  _S16 = _S21 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[5];
  __asm { FCVT            S16, H16 }

  _S16 = _S22 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[6];
  __asm { FCVT            S16, H16 }

  _S16 = _S23 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[7];
  __asm { FCVT            S16, H16 }

  _S7 = _S7 - _S16;
  __asm { FCVT            H7, S7 }

  _Q24 = vandq_s8(_Q1, v4);
  LOWORD(_S7) = _Q24.i16[7];
  __asm { FCVT            S7, H7 }

  _S16 = _S7 + _S7;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H19, S16 }

  LOWORD(_S16) = _Q24.i16[6];
  __asm { FCVT            S16, H16 }

  *(float *)_Q17.i32 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  *(float *)_Q17.i32 = 1.0 - *(float *)_Q17.i32;
  __asm { FCVT            H23, S17 }

  _Q17.i16[0] = _Q24.i16[4];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S18 = 1.0 - _S18;
  __asm { FCVT            H21, S18 }

  LOWORD(_S18) = _Q24.i16[5];
  __asm { FCVT            S18, H18 }

  _S20 = _S18 + _S18;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  _S20 = 1.0 - _S20;
  __asm { FCVT            H25, S20 }

  LOWORD(_S20) = _Q24.i16[3];
  __asm { FCVT            S20, H20 }

  _S22 = _S20 + _S20;
  __asm
  {
    FCVT            H22, S22
    FCVT            S22, H22
  }

  _S22 = 1.0 - _S22;
  __asm { FCVT            H26, S22 }

  LOWORD(_S22) = _Q24.i16[2];
  __asm { FCVT            S22, H22 }

  _S27 = _S22 + _S22;
  __asm
  {
    FCVT            H27, S27
    FCVT            S27, H27
  }

  _S27 = 1.0 - _S27;
  __asm { FCVT            S28, H24 }

  _S29 = _S28 + _S28;
  __asm
  {
    FCVT            H29, S29
    FCVT            S29, H29
  }

  *(float *)_D29.i32 = 1.0 - _S29;
  __asm { FCVT            H29, S29 }

  _Q24.i16[0] = _Q24.i16[1];
  __asm { FCVT            S24, H24 }

  _S30 = *(float *)_Q24.i32 + *(float *)_Q24.i32;
  __asm
  {
    FCVT            H30, S30
    FCVT            S30, H30
  }

  _S30 = 1.0 - _S30;
  __asm { FCVT            H30, S30 }

  _D29.i16[1] = LOWORD(_S30);
  __asm { FCVT            H27, S27 }

  _D29.i16[2] = LOWORD(_S27);
  _D29.i16[3] = _H26;
  _D21.i16[1] = _H25;
  _D21.i16[2] = _H23;
  *(int8x8_t *)v151.i8 = vand_s8(_D29, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D29))));
  _D21.i16[3] = _H19;
  v151.u64[1] = (unint64_t)vand_s8(_D21, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D21))));
  else {
    __int16 v152 = -1;
  }
  if (_S28 >= 1024.0) {
    __int16 v153 = 0;
  }
  else {
    __int16 v153 = -1;
  }
  v154.i16[0] = v153;
  v154.i16[1] = v152;
  if (_S22 >= 1024.0) {
    __int16 v155 = 0;
  }
  else {
    __int16 v155 = -1;
  }
  v154.i16[2] = v155;
  if (_S20 >= 1024.0) {
    __int16 v156 = 0;
  }
  else {
    __int16 v156 = -1;
  }
  v154.i16[3] = v156;
  if (_S17 >= 1024.0) {
    __int16 v157 = 0;
  }
  else {
    __int16 v157 = -1;
  }
  v154.i16[4] = v157;
  if (_S18 >= 1024.0) {
    __int16 v158 = 0;
  }
  else {
    __int16 v158 = -1;
  }
  v154.i16[5] = v158;
  if (_S16 >= 1024.0) {
    __int16 v159 = 0;
  }
  else {
    __int16 v159 = -1;
  }
  v154.i16[6] = v159;
  if (_S7 >= 1024.0) {
    __int16 v160 = 0;
  }
  else {
    __int16 v160 = -1;
  }
  v154.i16[7] = v160;
  _Q7 = vandq_s8(vornq_s8(vandq_s8(v151, v154), v154), _Q1);
  _H16 = _Q7.i16[1];
  _H17 = _Q1.u16[1];
  __asm
  {
    FCVT            S17, H17
    FCVT            S16, H16
  }

  if (_S16 <= _S17) {
    __int16 v166 = 0;
  }
  else {
    __int16 v166 = -1;
  }
  __asm
  {
    FCVT            S17, H1
    FCVT            S18, H7
  }

  if (_S18 <= _S17) {
    __int16 v169 = 0;
  }
  else {
    __int16 v169 = -1;
  }
  v170.i16[0] = v169;
  v170.i16[1] = v166;
  _H19 = _Q7.i16[2];
  _H20 = _Q1.u16[2];
  __asm
  {
    FCVT            S20, H20
    FCVT            S19, H19
  }

  if (_S19 <= _S20) {
    __int16 v175 = 0;
  }
  else {
    __int16 v175 = -1;
  }
  v170.i16[2] = v175;
  _H20 = _Q7.i16[3];
  _H21 = _Q1.u16[3];
  __asm
  {
    FCVT            S21, H21
    FCVT            S20, H20
  }

  if (_S20 <= _S21) {
    __int16 v180 = 0;
  }
  else {
    __int16 v180 = -1;
  }
  v170.i16[3] = v180;
  _H21 = _Q7.i16[4];
  _H22 = _Q1.u16[4];
  __asm
  {
    FCVT            S22, H22
    FCVT            S21, H21
  }

  if (_S21 <= _S22) {
    __int16 v185 = 0;
  }
  else {
    __int16 v185 = -1;
  }
  v170.i16[4] = v185;
  _H22 = _Q7.i16[5];
  _H23 = _Q1.u16[5];
  __asm
  {
    FCVT            S23, H23
    FCVT            S22, H22
  }

  if (_S22 <= _S23) {
    __int16 v190 = 0;
  }
  else {
    __int16 v190 = -1;
  }
  v170.i16[5] = v190;
  _H23 = _Q7.i16[6];
  _H24 = _Q1.u16[6];
  __asm
  {
    FCVT            S24, H24
    FCVT            S23, H23
  }

  if (_S23 <= _S24) {
    __int16 v195 = 0;
  }
  else {
    __int16 v195 = -1;
  }
  v170.i16[6] = v195;
  _H7 = _Q7.i16[7];
  _H1 = _Q1.u16[7];
  __asm
  {
    FCVT            S1, H1
    FCVT            S7, H7
  }

  if (_S7 <= _S1) {
    __int16 v200 = 0;
  }
  else {
    __int16 v200 = -1;
  }
  v170.i16[7] = v200;
  _Q17 = vandq_s8(v4, v170);
  _H1 = _Q17.i16[1];
  __asm { FCVT            S1, H1 }

  _S1 = _S16 - _S1;
  __asm
  {
    FCVT            H16, S1
    FCVT            S1, H17
  }

  _S1 = _S18 - _S1;
  __asm { FCVT            H1, S1 }

  _H16 = _Q17.i16[2];
  __asm { FCVT            S16, H16 }

  _S16 = _S19 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[3];
  __asm { FCVT            S16, H16 }

  _S16 = _S20 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[4];
  __asm { FCVT            S16, H16 }

  _S16 = _S21 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[5];
  __asm { FCVT            S16, H16 }

  _S16 = _S22 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[6];
  __asm { FCVT            S16, H16 }

  _S16 = _S23 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[7];
  __asm { FCVT            S16, H16 }

  _S7 = _S7 - _S16;
  __asm { FCVT            H7, S7 }

  _Q24 = vandq_s8(_Q2, v4);
  LOWORD(_S7) = _Q24.i16[7];
  __asm { FCVT            S7, H7 }

  _S16 = _S7 + _S7;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H19, S16 }

  LOWORD(_S16) = _Q24.i16[6];
  __asm { FCVT            S16, H16 }

  *(float *)_Q17.i32 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  *(float *)_Q17.i32 = 1.0 - *(float *)_Q17.i32;
  __asm { FCVT            H23, S17 }

  _Q17.i16[0] = _Q24.i16[4];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S18 = 1.0 - _S18;
  __asm { FCVT            H21, S18 }

  LOWORD(_S18) = _Q24.i16[5];
  __asm { FCVT            S18, H18 }

  _S20 = _S18 + _S18;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  _S20 = 1.0 - _S20;
  __asm { FCVT            H25, S20 }

  LOWORD(_S20) = _Q24.i16[3];
  __asm { FCVT            S20, H20 }

  _S22 = _S20 + _S20;
  __asm
  {
    FCVT            H22, S22
    FCVT            S22, H22
  }

  _S22 = 1.0 - _S22;
  __asm { FCVT            H26, S22 }

  LOWORD(_S22) = _Q24.i16[2];
  __asm { FCVT            S22, H22 }

  _S27 = _S22 + _S22;
  __asm
  {
    FCVT            H27, S27
    FCVT            S27, H27
  }

  _S27 = 1.0 - _S27;
  __asm
  {
    FCVT            H27, S27
    FCVT            S28, H24
  }

  _S29 = _S28 + _S28;
  __asm
  {
    FCVT            H29, S29
    FCVT            S29, H29
  }

  *(float *)_D29.i32 = 1.0 - _S29;
  __asm { FCVT            H29, S29 }

  _Q24.i16[0] = _Q24.i16[1];
  __asm { FCVT            S24, H24 }

  _S30 = *(float *)_Q24.i32 + *(float *)_Q24.i32;
  __asm
  {
    FCVT            H30, S30
    FCVT            S30, H30
  }

  _S30 = 1.0 - _S30;
  __asm { FCVT            H30, S30 }

  _D29.i16[1] = LOWORD(_S30);
  _D29.i16[2] = LOWORD(_S27);
  _D29.i16[3] = _H26;
  *(int8x8_t *)v255.i8 = vand_s8(_D29, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D29))));
  _D21.i16[1] = _H25;
  _D21.i16[2] = _H23;
  _D21.i16[3] = _H19;
  v255.u64[1] = (unint64_t)vand_s8(_D21, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D21))));
  else {
    __int16 v256 = -1;
  }
  if (_S28 >= 1024.0) {
    __int16 v257 = 0;
  }
  else {
    __int16 v257 = -1;
  }
  v258.i16[0] = v257;
  v258.i16[1] = v256;
  if (_S22 >= 1024.0) {
    __int16 v259 = 0;
  }
  else {
    __int16 v259 = -1;
  }
  v258.i16[2] = v259;
  if (_S20 >= 1024.0) {
    __int16 v260 = 0;
  }
  else {
    __int16 v260 = -1;
  }
  v258.i16[3] = v260;
  if (_S17 >= 1024.0) {
    __int16 v261 = 0;
  }
  else {
    __int16 v261 = -1;
  }
  v258.i16[4] = v261;
  if (_S18 >= 1024.0) {
    __int16 v262 = 0;
  }
  else {
    __int16 v262 = -1;
  }
  v258.i16[5] = v262;
  if (_S16 >= 1024.0) {
    __int16 v263 = 0;
  }
  else {
    __int16 v263 = -1;
  }
  v258.i16[6] = v263;
  if (_S7 >= 1024.0) {
    __int16 v264 = 0;
  }
  else {
    __int16 v264 = -1;
  }
  v258.i16[7] = v264;
  _Q7 = vandq_s8(vornq_s8(vandq_s8(v255, v258), v258), _Q2);
  _H16 = _Q7.i16[1];
  _H17 = _Q2.u16[1];
  __asm
  {
    FCVT            S17, H17
    FCVT            S16, H16
  }

  if (_S17 >= _S16) {
    __int16 v270 = 0;
  }
  else {
    __int16 v270 = -1;
  }
  __asm
  {
    FCVT            S17, H2
    FCVT            S18, H7
  }

  if (_S17 >= _S18) {
    __int16 v273 = 0;
  }
  else {
    __int16 v273 = -1;
  }
  v274.i16[0] = v273;
  v274.i16[1] = v270;
  _H19 = _Q7.i16[2];
  _H20 = _Q2.u16[2];
  __asm
  {
    FCVT            S20, H20
    FCVT            S19, H19
  }

  if (_S20 >= _S19) {
    __int16 v279 = 0;
  }
  else {
    __int16 v279 = -1;
  }
  v274.i16[2] = v279;
  _H20 = _Q7.i16[3];
  _H21 = _Q2.u16[3];
  __asm
  {
    FCVT            S21, H21
    FCVT            S20, H20
  }

  if (_S21 >= _S20) {
    __int16 v284 = 0;
  }
  else {
    __int16 v284 = -1;
  }
  v274.i16[3] = v284;
  _H21 = _Q7.i16[4];
  _H22 = _Q2.u16[4];
  __asm
  {
    FCVT            S22, H22
    FCVT            S21, H21
  }

  if (_S22 >= _S21) {
    __int16 v289 = 0;
  }
  else {
    __int16 v289 = -1;
  }
  v274.i16[4] = v289;
  _H22 = _Q7.i16[5];
  _H23 = _Q2.u16[5];
  __asm
  {
    FCVT            S23, H23
    FCVT            S22, H22
  }

  if (_S23 >= _S22) {
    __int16 v294 = 0;
  }
  else {
    __int16 v294 = -1;
  }
  v274.i16[5] = v294;
  _H23 = _Q7.i16[6];
  _H24 = _Q2.u16[6];
  __asm
  {
    FCVT            S24, H24
    FCVT            S23, H23
  }

  if (_S24 >= _S23) {
    __int16 v299 = 0;
  }
  else {
    __int16 v299 = -1;
  }
  v274.i16[6] = v299;
  _H7 = _Q7.i16[7];
  _H2 = _Q2.u16[7];
  __asm
  {
    FCVT            S2, H2
    FCVT            S7, H7
  }

  if (_S2 >= _S7) {
    __int16 v304 = 0;
  }
  else {
    __int16 v304 = -1;
  }
  v274.i16[7] = v304;
  _Q17 = vandq_s8(v4, v274);
  _H2 = _Q17.i16[1];
  __asm { FCVT            S2, H2 }

  _S2 = _S16 - _S2;
  __asm
  {
    FCVT            H16, S2
    FCVT            S2, H17
  }

  _S2 = _S18 - _S2;
  __asm { FCVT            H2, S2 }

  _H16 = _Q17.i16[2];
  __asm { FCVT            S16, H16 }

  _S16 = _S19 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[3];
  __asm { FCVT            S16, H16 }

  _S16 = _S20 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[4];
  __asm { FCVT            S16, H16 }

  _S16 = _S21 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[5];
  __asm { FCVT            S16, H16 }

  _S16 = _S22 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[6];
  __asm { FCVT            S16, H16 }

  _S16 = _S23 - _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S16) = _Q17.i16[7];
  __asm { FCVT            S16, H16 }

  _S7 = _S7 - _S16;
  __asm { FCVT            H7, S7 }

  _Q24 = vandq_s8(_Q3, v4);
  LOWORD(_S7) = _Q24.i16[7];
  __asm { FCVT            S7, H7 }

  _S16 = _S7 + _S7;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H19, S16 }

  LOWORD(_S16) = _Q24.i16[6];
  __asm { FCVT            S16, H16 }

  *(float *)_Q17.i32 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  *(float *)_Q17.i32 = 1.0 - *(float *)_Q17.i32;
  __asm { FCVT            H23, S17 }

  _Q17.i16[0] = _Q24.i16[4];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S18 = 1.0 - _S18;
  __asm { FCVT            H21, S18 }

  LOWORD(_S18) = _Q24.i16[5];
  __asm { FCVT            S18, H18 }

  _S20 = _S18 + _S18;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  _S25 = 1.0 - _S20;
  LOWORD(_S20) = _Q24.i16[3];
  __asm { FCVT            S20, H20 }

  _S22 = _S20 + _S20;
  __asm
  {
    FCVT            H22, S22
    FCVT            S22, H22
  }

  _S22 = 1.0 - _S22;
  __asm { FCVT            H26, S22 }

  LOWORD(_S22) = _Q24.i16[2];
  __asm { FCVT            S22, H22 }

  _S27 = _S22 + _S22;
  __asm
  {
    FCVT            H27, S27
    FCVT            S27, H27
  }

  _S27 = 1.0 - _S27;
  __asm
  {
    FCVT            H27, S27
    FCVT            S28, H24
  }

  _S29 = _S28 + _S28;
  __asm
  {
    FCVT            H29, S29
    FCVT            S29, H29
  }

  *(float *)_D29.i32 = 1.0 - _S29;
  __asm { FCVT            H29, S29 }

  _Q24.i16[0] = _Q24.i16[1];
  __asm { FCVT            S24, H24 }

  _S30 = *(float *)_Q24.i32 + *(float *)_Q24.i32;
  __asm
  {
    FCVT            H30, S30
    FCVT            S30, H30
  }

  _S5 = 1.0 - _S30;
  __asm { FCVT            H5, S5 }

  _D29.i16[1] = LOWORD(_S5);
  _D29.i16[2] = LOWORD(_S27);
  _D29.i16[3] = _H26;
  __asm { FCVT            H5, S25 }

  _D21.i16[1] = LOWORD(_S5);
  *(int8x8_t *)v358.i8 = vand_s8(_D29, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D29))));
  _D21.i16[2] = _H23;
  _D21.i16[3] = _H19;
  v358.u64[1] = (unint64_t)vand_s8(_D21, (int8x8_t)vmovn_s32(vclezq_f32(vcvtq_f32_f16((float16x4_t)_D21))));
  else {
    __int16 v359 = -1;
  }
  if (_S28 >= 1024.0) {
    __int16 v360 = 0;
  }
  else {
    __int16 v360 = -1;
  }
  v361.i16[0] = v360;
  v361.i16[1] = v359;
  if (_S22 >= 1024.0) {
    __int16 v362 = 0;
  }
  else {
    __int16 v362 = -1;
  }
  v361.i16[2] = v362;
  if (_S20 >= 1024.0) {
    __int16 v363 = 0;
  }
  else {
    __int16 v363 = -1;
  }
  v361.i16[3] = v363;
  if (_S17 >= 1024.0) {
    __int16 v364 = 0;
  }
  else {
    __int16 v364 = -1;
  }
  v361.i16[4] = v364;
  if (_S18 >= 1024.0) {
    __int16 v365 = 0;
  }
  else {
    __int16 v365 = -1;
  }
  v361.i16[5] = v365;
  if (_S16 >= 1024.0) {
    __int16 v366 = 0;
  }
  else {
    __int16 v366 = -1;
  }
  v361.i16[6] = v366;
  if (_S7 >= 1024.0) {
    __int16 v367 = 0;
  }
  else {
    __int16 v367 = -1;
  }
  v361.i16[7] = v367;
  _Q5 = vandq_s8(vornq_s8(vandq_s8(v358, v361), v361), _Q3);
  _H6 = _Q5.i16[1];
  _H7 = _Q3.u16[1];
  __asm
  {
    FCVT            S7, H7
    FCVT            S6, H6
  }

  if (_S7 >= _S6) {
    __int16 v373 = 0;
  }
  else {
    __int16 v373 = -1;
  }
  __asm
  {
    FCVT            S7, H3
    FCVT            S16, H5
  }

  if (_S7 >= _S16) {
    __int16 v376 = 0;
  }
  else {
    __int16 v376 = -1;
  }
  v377.i16[0] = v376;
  v377.i16[1] = v373;
  _H17 = _Q5.i16[2];
  _H18 = _Q3.u16[2];
  __asm
  {
    FCVT            S18, H18
    FCVT            S17, H17
  }

  if (_S18 >= _S17) {
    __int16 v382 = 0;
  }
  else {
    __int16 v382 = -1;
  }
  v377.i16[2] = v382;
  _H18 = _Q5.i16[3];
  _H19 = _Q3.u16[3];
  __asm
  {
    FCVT            S19, H19
    FCVT            S18, H18
  }

  if (_S19 >= _S18) {
    __int16 v387 = 0;
  }
  else {
    __int16 v387 = -1;
  }
  v377.i16[3] = v387;
  _H19 = _Q5.i16[4];
  _H20 = _Q3.u16[4];
  __asm
  {
    FCVT            S20, H20
    FCVT            S19, H19
  }

  if (_S20 >= _S19) {
    __int16 v392 = 0;
  }
  else {
    __int16 v392 = -1;
  }
  v377.i16[4] = v392;
  _H20 = _Q5.i16[5];
  _H21 = _Q3.u16[5];
  __asm
  {
    FCVT            S21, H21
    FCVT            S20, H20
  }

  if (_S21 >= _S20) {
    __int16 v397 = 0;
  }
  else {
    __int16 v397 = -1;
  }
  v377.i16[5] = v397;
  _H21 = _Q5.i16[6];
  _H22 = _Q3.u16[6];
  __asm
  {
    FCVT            S22, H22
    FCVT            S21, H21
  }

  if (_S22 >= _S21) {
    __int16 v402 = 0;
  }
  else {
    __int16 v402 = -1;
  }
  v377.i16[6] = v402;
  _H5 = _Q5.i16[7];
  _H3 = _Q3.u16[7];
  __asm
  {
    FCVT            S3, H3
    FCVT            S5, H5
  }

  if (_S3 >= _S5) {
    __int16 v407 = 0;
  }
  else {
    __int16 v407 = -1;
  }
  v377.i16[7] = v407;
  _Q4 = vandq_s8(v4, v377);
  _H3 = _Q4.i16[1];
  __asm { FCVT            S3, H3 }

  _S3 = _S6 - _S3;
  __asm
  {
    FCVT            H6, S3
    FCVT            S3, H4
  }

  _S3 = _S16 - _S3;
  __asm { FCVT            H3, S3 }

  _H6 = _Q4.i16[2];
  __asm { FCVT            S6, H6 }

  _S6 = _S17 - _S6;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q4.i16[3];
  __asm { FCVT            S6, H6 }

  _S6 = _S18 - _S6;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q4.i16[4];
  __asm { FCVT            S6, H6 }

  _S6 = _S19 - _S6;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q4.i16[5];
  __asm { FCVT            S6, H6 }

  _S6 = _S20 - _S6;
  __asm { FCVT            H6, S6 }

  LOWORD(_S6) = _Q4.i16[6];
  __asm { FCVT            S6, H6 }

  _S6 = _S21 - _S6;
  __asm { FCVT            H6, S6 }

  _Q4.i16[0] = _Q4.i16[7];
  __asm { FCVT            S4, H4 }

  *(float *)_Q4.i32 = _S5 - *(float *)_Q4.i32;
  __asm { FCVT            H4, S4 }

void trunc(_:)(int8x16_t a1, int8x16_t a2, int8x16_t a3, int8x16_t a4)
{
  _Q6.i64[0] = 0x3C003C003C003C00LL;
  _Q6.i64[1] = 0x3C003C003C003C00LL;
  _Q23 = vandq_s8(a1, _Q6);
  _H4 = _Q23.i16[7];
  __asm { FCVT            S16, H4 }

  _S4 = _S16 + _S16;
  __asm
  {
    FCVT            H4, S4
    FCVT            S5, H4
  }

  _S5 = 1.0 - _S5;
  __asm { FCVT            H5, S5 }

  _H7 = _Q23.i16[6];
  __asm { FCVT            S17, H7 }

  _S7 = _S17 + _S17;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H7
  }

  _S7 = 1.0 - _S7;
  __asm { FCVT            H22, S7 }

  LOWORD(_S7) = _Q23.i16[4];
  __asm { FCVT            S18, H7 }

  _S7 = _S18 + _S18;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H7
  }

  _S7 = 1.0 - _S7;
  __asm { FCVT            H7, S7 }

  _H19 = _Q23.i16[5];
  __asm { FCVT            S19, H19 }

  _S20 = _S19 + _S19;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  _S20 = 1.0 - _S20;
  __asm { FCVT            H24, S20 }

  LOWORD(_S20) = _Q23.i16[3];
  __asm { FCVT            S20, H20 }

  _S21 = _S20 + _S20;
  __asm
  {
    FCVT            H21, S21
    FCVT            S21, H21
  }

  _S21 = 1.0 - _S21;
  __asm { FCVT            H25, S21 }

  LOWORD(_S21) = _Q23.i16[2];
  __asm { FCVT            S21, H21 }

  _S26 = _S21 + _S21;
  __asm
  {
    FCVT            H26, S26
    FCVT            S26, H26
  }

  _S26 = 1.0 - _S26;
  __asm
  {
    FCVT            H26, S26
    FCVT            S27, H23
  }

  _S28 = _S27 + _S27;
  __asm
  {
    FCVT            H28, S28
    FCVT            S28, H28
  }

  _S28 = 1.0 - _S28;
  __asm { FCVT            H28, S28 }

  _Q23.i16[0] = _Q23.i16[1];
  __asm { FCVT            S23, H23 }

  _S29 = *(float *)_Q23.i32 + *(float *)_Q23.i32;
  __asm
  {
    FCVT            H29, S29
    FCVT            S29, H29
  }

  _S29 = 1.0 - _S29;
  __asm { FCVT            H29, S29 }

  _Q25 = vandq_s8(a2, _Q6);
  LOWORD(_S16) = _Q25.i16[7];
  __asm { FCVT            S16, H16 }

  _S17 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  _S17 = 1.0 - _S17;
  __asm { FCVT            H21, S17 }

  LOWORD(_S17) = _Q25.i16[6];
  __asm { FCVT            S17, H17 }

  _S19 = _S17 + _S17;
  __asm
  {
    FCVT            H19, S19
    FCVT            S19, H19
  }

  _S19 = 1.0 - _S19;
  __asm { FCVT            H24, S19 }

  LOWORD(_S19) = _Q25.i16[4];
  __asm { FCVT            S19, H19 }

  _S20 = _S19 + _S19;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  _S20 = 1.0 - _S20;
  __asm { FCVT            H22, S20 }

  LOWORD(_S20) = _Q25.i16[5];
  __asm { FCVT            S20, H20 }

  *(float *)_Q23.i32 = _S20 + _S20;
  __asm
  {
    FCVT            H23, S23
    FCVT            S23, H23
  }

  *(float *)_Q23.i32 = 1.0 - *(float *)_Q23.i32;
  __asm { FCVT            H26, S23 }

  LOWORD(_S27) = _Q25.i16[3];
  _Q23.i16[0] = _Q25.i16[2];
  __asm
  {
    FCVT            S23, H23
    FCVT            S28, H25
  }

  _S29 = _S28 + _S28;
  __asm
  {
    FCVT            H29, S29
    FCVT            S29, H29
  }

  _S29 = 1.0 - _S29;
  __asm { FCVT            H29, S29 }

  _Q25.i16[0] = _Q25.i16[1];
  __asm { FCVT            S25, H25 }

  _S30 = *(float *)_Q25.i32 + *(float *)_Q25.i32;
  __asm
  {
    FCVT            H30, S30
    FCVT            S30, H30
  }

  _S30 = 1.0 - _S30;
  __asm { FCVT            H30, S30 }

  _S30 = *(float *)_Q23.i32 + *(float *)_Q23.i32;
  __asm
  {
    FCVT            H30, S30
    FCVT            S30, H30
  }

  _S30 = 1.0 - _S30;
  __asm
  {
    FCVT            H30, S30
    FCVT            S27, H27
  }

  _S30 = _S27 + _S27;
  __asm
  {
    FCVT            H30, S30
    FCVT            S30, H30
  }

  _S30 = 1.0 - _S30;
  __asm { FCVT            H30, S30 }

  _Q25 = vandq_s8(a3, _Q6);
  LOWORD(_S16) = _Q25.i16[7];
  __asm { FCVT            S16, H16 }

  _S17 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  _S17 = 1.0 - _S17;
  __asm { FCVT            H20, S17 }

  LOWORD(_S17) = _Q25.i16[6];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S18 = 1.0 - _S18;
  __asm { FCVT            H24, S18 }

  LOWORD(_S18) = _Q25.i16[4];
  __asm { FCVT            S18, H18 }

  _S19 = _S18 + _S18;
  __asm
  {
    FCVT            H19, S19
    FCVT            S19, H19
  }

  _S19 = 1.0 - _S19;
  __asm { FCVT            H22, S19 }

  LOWORD(_S19) = _Q25.i16[5];
  __asm { FCVT            S19, H19 }

  _S21 = _S19 + _S19;
  __asm
  {
    FCVT            H21, S21
    FCVT            S21, H21
  }

  _S26 = 1.0 - _S21;
  LOWORD(_S21) = _Q25.i16[3];
  __asm { FCVT            S21, H21 }

  *(float *)_Q23.i32 = _S21 + _S21;
  __asm
  {
    FCVT            H23, S23
    FCVT            S23, H23
  }

  *(float *)_Q23.i32 = 1.0 - *(float *)_Q23.i32;
  __asm { FCVT            H27, S23 }

  _Q23.i16[0] = _Q25.i16[2];
  __asm
  {
    FCVT            S23, H23
    FCVT            S28, H25
  }

  _S29 = _S28 + _S28;
  __asm
  {
    FCVT            H29, S29
    FCVT            S29, H29
  }

  _S29 = 1.0 - _S29;
  __asm { FCVT            H29, S29 }

  _Q25.i16[0] = _Q25.i16[1];
  __asm { FCVT            S25, H25 }

  _S30 = *(float *)_Q25.i32 + *(float *)_Q25.i32;
  __asm
  {
    FCVT            H30, S30
    FCVT            S30, H30
  }

  _S30 = 1.0 - _S30;
  __asm { FCVT            H30, S30 }

  _S30 = *(float *)_Q23.i32 + *(float *)_Q23.i32;
  __asm
  {
    FCVT            H30, S30
    FCVT            S30, H30
  }

  _S30 = 1.0 - _S30;
  __asm
  {
    FCVT            H30, S30
    FCVT            H26, S26
  }

  _Q24 = vandq_s8(a4, _Q6);
  _Q6.i16[0] = _Q24.i16[7];
  __asm { FCVT            S6, H6 }

  _S16 = *(float *)_Q6.i32 + *(float *)_Q6.i32;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
  }

  _S16 = 1.0 - _S16;
  __asm { FCVT            H19, S16 }

  LOWORD(_S16) = _Q24.i16[6];
  __asm { FCVT            S16, H16 }

  _S17 = _S16 + _S16;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  _S17 = 1.0 - _S17;
  __asm { FCVT            H23, S17 }

  LOWORD(_S17) = _Q24.i16[4];
  __asm { FCVT            S17, H17 }

  _S18 = _S17 + _S17;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
  }

  _S18 = 1.0 - _S18;
  __asm { FCVT            H21, S18 }

  LOWORD(_S18) = _Q24.i16[5];
  __asm { FCVT            S18, H18 }

  _S20 = _S18 + _S18;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  _S20 = 1.0 - _S20;
  __asm { FCVT            H25, S20 }

  LOWORD(_S20) = _Q24.i16[3];
  __asm { FCVT            S20, H20 }

  _S22 = _S20 + _S20;
  __asm
  {
    FCVT            H22, S22
    FCVT            S22, H22
  }

  _S22 = 1.0 - _S22;
  __asm { FCVT            H26, S22 }

  LOWORD(_S22) = _Q24.i16[2];
  __asm { FCVT            S22, H22 }

  _S27 = _S22 + _S22;
  __asm
  {
    FCVT            H27, S27
    FCVT            S27, H27
  }

  _S27 = 1.0 - _S27;
  __asm { FCVT            S28, H24 }

  _S29 = _S28 + _S28;
  __asm
  {
    FCVT            H29, S29
    FCVT            S29, H29
  }

  _S29 = 1.0 - _S29;
  __asm { FCVT            H29, S29 }

  _Q24.i16[0] = _Q24.i16[1];
  __asm { FCVT            S24, H24 }

  _S30 = *(float *)_Q24.i32 + *(float *)_Q24.i32;
  __asm
  {
    FCVT            H30, S30
    FCVT            S30, H30
  }

  _S4 = 1.0 - _S30;
  __asm
  {
    FCVT            H4, S4
    FCVT            H4, S27
  }

void rint(_:)(int8x16_t _Q0, int8x16_t _Q1, int8x16_t _Q2, int8x16_t _Q3)
{
  _Q5.i64[0] = 0x8000800080008000LL;
  _Q5.i64[1] = 0x8000800080008000LL;
  _Q7 = vandq_s8(_Q0, _Q5);
  _Q7.i16[0] |= 0x6400u;
  _H4 = _Q0.u16[7];
  __asm { FCVT            S16, H4 }

  _S24 = fabsf(_S16);
  _H4 = _Q0.u16[6];
  __asm { FCVT            S17, H4 }

  _S25 = fabsf(_S17);
  _H4 = _Q0.u16[5];
  __asm { FCVT            S18, H4 }

  _S26 = fabsf(_S18);
  _H4 = _Q0.u16[4];
  __asm { FCVT            S19, H4 }

  _S27 = fabsf(_S19);
  _H4 = _Q0.u16[3];
  __asm { FCVT            S20, H4 }

  _S28 = fabsf(_S20);
  _H4 = _Q0.u16[2];
  __asm { FCVT            S21, H4 }

  _S29 = fabsf(_S21);
  __asm { FCVT            S22, H0 }

  _S4 = fabsf(_S22);
  __asm { FCVT            H6, S4 }

  LOWORD(_S4) = _Q0.i16[1];
  __asm { FCVT            S23, H4 }

  _S4 = fabsf(_S23);
  __asm
  {
    FCVT            H4, S4
    FCVT            S30, H4
    FCVT            S6, H6
    FCVT            H29, S29
    FCVT            S29, H29
    FCVT            H28, S28
    FCVT            S28, H28
    FCVT            H27, S27
    FCVT            S27, H27
    FCVT            H26, S26
    FCVT            S26, H26
    FCVT            H25, S25
    FCVT            S25, H25
    FCVT            H24, S24
    FCVT            S24, H24
  }

  LOWORD(_S24) = _Q7.i16[7] | 0x6400;
  __asm { FCVT            S24, H24 }

  _S16 = _S24 + _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S25) = _Q7.i16[6] | 0x6400;
  __asm { FCVT            S25, H25 }

  _S17 = _S25 + _S17;
  __asm { FCVT            H17, S17 }

  LOWORD(_S26) = _Q7.i16[5] | 0x6400;
  __asm { FCVT            S26, H26 }

  _S18 = _S26 + _S18;
  __asm { FCVT            H18, S18 }

  LOWORD(_S27) = _Q7.i16[4] | 0x6400;
  __asm { FCVT            S27, H27 }

  _S19 = _S27 + _S19;
  LOWORD(_S28) = _Q7.i16[3] | 0x6400;
  __asm { FCVT            S28, H28 }

  _S20 = _S28 + _S20;
  LOWORD(_S29) = _Q7.i16[2] | 0x6400;
  __asm { FCVT            S29, H29 }

  _S21 = _S29 + _S21;
  __asm { FCVT            S30, H7 }

  _S22 = _S30 + _S22;
  __asm { FCVT            H22, S22 }

  _Q7.i16[0] = _Q7.i16[1] | 0x6400;
  __asm { FCVT            S7, H7 }

  _S23 = *(float *)_Q7.i32 + _S23;
  __asm
  {
    FCVT            H23, S23
    FCVT            S23, H23
  }

  *(float *)_Q7.i32 = _S23 - *(float *)_Q7.i32;
  __asm
  {
    FCVT            H7, S7
    FCVT            S22, H22
  }

  _S22 = _S22 - _S30;
  __asm
  {
    FCVT            H22, S22
    FCVT            H7, S21
    FCVT            S7, H7
  }

  *(float *)_Q7.i32 = *(float *)_Q7.i32 - _S29;
  __asm
  {
    FCVT            H7, S7
    FCVT            H7, S20
    FCVT            S7, H7
  }

  *(float *)_Q7.i32 = *(float *)_Q7.i32 - _S28;
  __asm
  {
    FCVT            H7, S7
    FCVT            H7, S19
    FCVT            S7, H7
  }

  *(float *)_Q7.i32 = *(float *)_Q7.i32 - _S27;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H18
  }

  *(float *)_Q7.i32 = *(float *)_Q7.i32 - _S26;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H17
  }

  *(float *)_Q7.i32 = *(float *)_Q7.i32 - _S25;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H16
  }

  *(float *)_Q7.i32 = *(float *)_Q7.i32 - _S24;
  __asm { FCVT            H7, S7 }

  _Q7 = vandq_s8(_Q1, _Q5);
  _Q7.i16[0] |= 0x6400u;
  LOWORD(_S6) = _Q1.i16[7];
  __asm { FCVT            S16, H6 }

  _S6 = fabsf(_S16);
  __asm { FCVT            H24, S6 }

  LOWORD(_S6) = _Q1.i16[6];
  __asm { FCVT            S17, H6 }

  _S25 = fabsf(_S17);
  LOWORD(_S6) = _Q1.i16[5];
  __asm { FCVT            S18, H6 }

  _S26 = fabsf(_S18);
  LOWORD(_S6) = _Q1.i16[4];
  __asm { FCVT            S19, H6 }

  _S27 = fabsf(_S19);
  LOWORD(_S6) = _Q1.i16[3];
  __asm { FCVT            S20, H6 }

  _S28 = fabsf(_S20);
  LOWORD(_S6) = _Q1.i16[2];
  __asm { FCVT            S21, H6 }

  _S29 = fabsf(_S21);
  __asm { FCVT            S22, H1 }

  _S6 = fabsf(_S22);
  __asm { FCVT            H6, S6 }

  LOWORD(_S23) = _Q1.i16[1];
  __asm { FCVT            S23, H23 }

  _S30 = fabsf(_S23);
  __asm
  {
    FCVT            H30, S30
    FCVT            S30, H30
    FCVT            S6, H6
    FCVT            H29, S29
    FCVT            S29, H29
    FCVT            H28, S28
    FCVT            S28, H28
    FCVT            H27, S27
    FCVT            S27, H27
    FCVT            H26, S26
    FCVT            S26, H26
    FCVT            H25, S25
    FCVT            S25, H25
    FCVT            S24, H24
  }

  LOWORD(_S24) = _Q7.i16[7] | 0x6400;
  __asm { FCVT            S24, H24 }

  _S16 = _S24 + _S16;
  __asm { FCVT            H16, S16 }

  LOWORD(_S25) = _Q7.i16[6] | 0x6400;
  __asm { FCVT            S25, H25 }

  _S17 = _S25 + _S17;
  __asm { FCVT            H17, S17 }

  LOWORD(_S26) = _Q7.i16[5] | 0x6400;
  __asm { FCVT            S26, H26 }

  _S18 = _S26 + _S18;
  __asm { FCVT            H18, S18 }

  LOWORD(_S27) = _Q7.i16[4] | 0x6400;
  __asm { FCVT            S27, H27 }

  _S19 = _S27 + _S19;
  __asm { FCVT            H19, S19 }

  LOWORD(_S28) = _Q7.i16[3] | 0x6400;
  __asm { FCVT            S28, H28 }

  _S20 = _S28 + _S20;
  LOWORD(_S29) = _Q7.i16[2] | 0x6400;
  __asm { FCVT            S29, H29 }

  _S21 = _S29 + _S21;
  __asm { FCVT            S30, H7 }

  _S22 = _S30 + _S22;
  __asm { FCVT            H22, S22 }

  _Q7.i16[0] = _Q7.i16[1] | 0x6400;
  __asm { FCVT            S7, H7 }

  _S23 = *(float *)_Q7.i32 + _S23;
  __asm
  {
    FCVT            H23, S23
    FCVT            S23, H23
  }

  *(float *)_Q7.i32 = _S23 - *(float *)_Q7.i32;
  __asm
  {
    FCVT            H23, S7
    FCVT            S7, H22
  }

  *(float *)_Q7.i32 = *(float *)_Q7.i32 - _S30;
  __asm
  {
    FCVT            H7, S7
    FCVT            H21, S21
    FCVT            S21, H21
  }

  _S21 = _S21 - _S29;
  __asm
  {
    FCVT            H21, S21
    FCVT            H20, S20
    FCVT            S20, H20
  }

  _S20 = _S20 - _S28;
  __asm
  {
    FCVT            H20, S20
    FCVT            S19, H19
  }

  _S19 = _S19 - _S27;
  __asm
  {
    FCVT            H19, S19
    FCVT            S18, H18
  }

  _S18 = _S18 - _S26;
  __asm
  {
    FCVT            H18, S18
    FCVT            S17, H17
  }

  _S17 = _S17 - _S25;
  __asm
  {
    FCVT            H17, S17
    FCVT            S16, H16
  }

  _S16 = _S16 - _S24;
  __asm { FCVT            H16, S16 }

  _Q16 = vandq_s8(_Q2, _Q5);
  _Q16.i16[0] |= 0x6400u;
  LOWORD(_S17) = _Q2.i16[7];
  __asm { FCVT            S21, H17 }

  _S17 = fabsf(_S21);
  __asm { FCVT            H26, S17 }

  LOWORD(_S17) = _Q2.i16[6];
  __asm { FCVT            S22, H17 }

  _S17 = fabsf(_S22);
  __asm { FCVT            H27, S17 }

  LOWORD(_S17) = _Q2.i16[5];
  __asm { FCVT            S23, H17 }

  _S17 = fabsf(_S23);
  __asm { FCVT            H28, S17 }

  LOWORD(_S17) = _Q2.i16[4];
  __asm { FCVT            S24, H17 }

  _S29 = fabsf(_S24);
  LOWORD(_S17) = _Q2.i16[3];
  __asm { FCVT            S18, H17 }

  _S30 = fabsf(_S18);
  LOWORD(_S17) = _Q2.i16[2];
  __asm
  {
    FCVT            S19, H17
    FCVT            S20, H2
  }

  LOWORD(_S17) = _Q2.i16[1];
  __asm { FCVT            S25, H17 }

  _S17 = fabsf(_S25);
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  _S17 = fabsf(_S20);
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }

  _S17 = fabsf(_S19);
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
    FCVT            H30, S30
    FCVT            S30, H30
    FCVT            H29, S29
    FCVT            S29, H29
    FCVT            S28, H28
    FCVT            S27, H27
    FCVT            S26, H26
  }

  LOWORD(_S26) = _Q16.i16[7] | 0x6400;
  __asm { FCVT            S26, H26 }

  _S21 = _S21 + _S26;
  LOWORD(_S27) = _Q16.i16[6] | 0x6400;
  __asm { FCVT            S27, H27 }

  _S22 = _S22 + _S27;
  LOWORD(_S28) = _Q16.i16[5] | 0x6400;
  __asm { FCVT            S28, H28 }

  _S23 = _S23 + _S28;
  LOWORD(_S29) = _Q16.i16[4] | 0x6400;
  __asm { FCVT            S29, H29 }

  _S24 = _S24 + _S29;
  LOWORD(_S30) = _Q16.i16[1] | 0x6400;
  __asm { FCVT            S30, H30 }

  _S25 = _S25 + _S30;
  __asm
  {
    FCVT            H25, S25
    FCVT            S25, H25
  }

  _S25 = _S25 - _S30;
  __asm { FCVT            S30, H16 }

  _S20 = _S20 + _S30;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
  }

  _S20 = _S20 - _S30;
  LOWORD(_S30) = _Q16.i16[3] | 0x6400;
  __asm { FCVT            S30, H30 }

  _S18 = _S18 + _S30;
  _Q16.i16[0] = _Q16.i16[2] | 0x6400;
  __asm { FCVT            S16, H16 }

  _S19 = _S19 + *(float *)_Q16.i32;
  __asm
  {
    FCVT            H25, S25
    FCVT            H20, S20
    FCVT            H19, S19
    FCVT            S19, H19
  }

  *(float *)_Q16.i32 = _S19 - *(float *)_Q16.i32;
  __asm
  {
    FCVT            H16, S16
    FCVT            H16, S18
    FCVT            S16, H16
  }

  *(float *)_Q16.i32 = *(float *)_Q16.i32 - _S30;
  __asm
  {
    FCVT            H16, S16
    FCVT            H16, S24
    FCVT            S16, H16
  }

  *(float *)_Q16.i32 = *(float *)_Q16.i32 - _S29;
  __asm
  {
    FCVT            H16, S16
    FCVT            H16, S23
    FCVT            S16, H16
  }

  *(float *)_Q16.i32 = *(float *)_Q16.i32 - _S28;
  __asm
  {
    FCVT            H16, S16
    FCVT            H16, S22
    FCVT            S16, H16
  }

  *(float *)_Q16.i32 = *(float *)_Q16.i32 - _S27;
  __asm
  {
    FCVT            H16, S16
    FCVT            H16, S21
    FCVT            S16, H16
  }

  *(float *)_Q16.i32 = *(float *)_Q16.i32 - _S26;
  __asm { FCVT            H16, S16 }

  _Q6 = vandq_s8(_Q3, _Q5);
  _Q6.i16[0] |= 0x6400u;
  _Q5.i16[0] = _Q3.i16[7];
  __asm { FCVT            S7, H5 }

  *(float *)_Q5.i32 = fabsf(*(float *)_Q7.i32);
  __asm { FCVT            H23, S5 }

  _Q5.i16[0] = _Q3.i16[6];
  __asm { FCVT            S16, H5 }

  *(float *)_Q5.i32 = fabsf(*(float *)_Q16.i32);
  __asm { FCVT            H24, S5 }

  _Q5.i16[0] = _Q3.i16[5];
  __asm { FCVT            S17, H5 }

  *(float *)_Q5.i32 = fabsf(_S17);
  __asm { FCVT            H25, S5 }

  _Q5.i16[0] = _Q3.i16[4];
  __asm { FCVT            S18, H5 }

  _S26 = fabsf(_S18);
  _Q5.i16[0] = _Q3.i16[3];
  __asm { FCVT            S19, H5 }

  _S27 = fabsf(_S19);
  _Q5.i16[0] = _Q3.i16[2];
  __asm { FCVT            S20, H5 }

  _S28 = fabsf(_S20);
  __asm { FCVT            S21, H3 }

  *(float *)_Q5.i32 = fabsf(_S21);
  __asm { FCVT            H5, S5 }

  LOWORD(_S22) = _Q3.i16[1];
  __asm { FCVT            S22, H22 }

  _S29 = fabsf(_S22);
  __asm
  {
    FCVT            H29, S29
    FCVT            S29, H29
    FCVT            S5, H5
    FCVT            H28, S28
    FCVT            S28, H28
    FCVT            H27, S27
    FCVT            S27, H27
    FCVT            H26, S26
    FCVT            S26, H26
    FCVT            S25, H25
    FCVT            S24, H24
    FCVT            S23, H23
  }

  LOWORD(_S4) = _Q6.i16[7] | 0x6400;
  __asm { FCVT            S4, H4 }

  *(float *)_Q7.i32 = *(float *)_Q7.i32 + _S4;
  LOWORD(_S23) = _Q6.i16[6] | 0x6400;
  __asm { FCVT            S23, H23 }

  *(float *)_Q16.i32 = *(float *)_Q16.i32 + _S23;
  LOWORD(_S24) = _Q6.i16[5] | 0x6400;
  __asm { FCVT            S24, H24 }

  _S17 = _S17 + _S24;
  LOWORD(_S25) = _Q6.i16[4] | 0x6400;
  __asm { FCVT            S25, H25 }

  _S18 = _S18 + _S25;
  LOWORD(_S26) = _Q6.i16[3] | 0x6400;
  __asm { FCVT            S26, H26 }

  _S19 = _S19 + _S26;
  LOWORD(_S27) = _Q6.i16[2] | 0x6400;
  __asm { FCVT            S27, H27 }

  _S20 = _S20 + _S27;
  __asm { FCVT            S28, H6 }

  _S21 = _S21 + _S28;
  __asm { FCVT            H21, S21 }

  _Q6.i16[0] = _Q6.i16[1] | 0x6400;
  __asm { FCVT            S6, H6 }

  _S22 = _S22 + *(float *)_Q6.i32;
  __asm
  {
    FCVT            H22, S22
    FCVT            S22, H22
  }

  *(float *)_Q6.i32 = _S22 - *(float *)_Q6.i32;
  __asm
  {
    FCVT            H6, S6
    FCVT            S21, H21
  }

  _S21 = _S21 - _S28;
  __asm
  {
    FCVT            H21, S21
    FCVT            H6, S20
    FCVT            S6, H6
  }

  *(float *)_Q6.i32 = *(float *)_Q6.i32 - _S27;
  __asm
  {
    FCVT            H6, S6
    FCVT            H6, S19
    FCVT            S6, H6
  }

  *(float *)_Q6.i32 = *(float *)_Q6.i32 - _S26;
  __asm
  {
    FCVT            H6, S6
    FCVT            H6, S18
    FCVT            S6, H6
  }

  *(float *)_Q6.i32 = *(float *)_Q6.i32 - _S25;
  __asm
  {
    FCVT            H6, S6
    FCVT            H6, S17
    FCVT            S6, H6
  }

  *(float *)_Q6.i32 = *(float *)_Q6.i32 - _S24;
  __asm
  {
    FCVT            H6, S6
    FCVT            H6, S16
    FCVT            S6, H6
  }

  *(float *)_Q6.i32 = *(float *)_Q6.i32 - _S23;
  __asm
  {
    FCVT            H6, S6
    FCVT            H6, S7
    FCVT            S6, H6
  }

  _S4 = *(float *)_Q6.i32 - _S4;
  __asm { FCVT            H4, S4 }

int8x8_t min(_:_:)(float16x4_t a1, double a2, double a3, double a4, float16x4_t a5)
{
  float32x4_t v5 = vcvtq_f32_f16(a5);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(v5, vcvtq_f32_f16(a1))),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v5), (int8x16_t)vcgezq_f32(v5)))),  (int8x8_t)a1,  (int8x8_t)a5);
}

int8x8_t max(_:_:)(float16x4_t a1, double a2, double a3, double a4, float16x4_t a5)
{
  float32x4_t v5 = vcvtq_f32_f16(a5);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(vcvtq_f32_f16(a1), v5)),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v5), (int8x16_t)vcgezq_f32(v5)))),  (int8x8_t)a1,  (int8x8_t)a5);
}

int8x8_t min(_:_:)(float16x4_t a1, double a2, double a3, double a4, int16x4_t a5)
{
  float16x4_t v5 = (float16x4_t)vdup_lane_s16(a5, 0);
  float32x4_t v6 = vcvtq_f32_f16(v5);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(v6, vcvtq_f32_f16(a1))),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v6), (int8x16_t)vcgezq_f32(v6)))),  (int8x8_t)a1,  (int8x8_t)v5);
}

int8x8_t max(_:_:)(float16x4_t a1, double a2, double a3, double a4, int16x4_t a5)
{
  float16x4_t v5 = (float16x4_t)vdup_lane_s16(a5, 0);
  float32x4_t v6 = vcvtq_f32_f16(v5);
  return vbsl_s8( vorn_s8( (int8x8_t)vmovn_s32(vcgeq_f32(vcvtq_f32_f16(a1), v6)),  (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v6), (int8x16_t)vcgezq_f32(v6)))),  (int8x8_t)a1,  (int8x8_t)v5);
}

void *sub_186F1B29C@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (!*a2) {
    goto LABEL_4;
  }
  if (*a2 == 1LL)
  {
    ++result;
LABEL_4:
    *a3 = *result;
    return result;
  }

  __break(1u);
  return result;
}

void *sub_186F1B2C0(void *result, void *a2, void *a3)
{
  if (!*a3) {
    goto LABEL_4;
  }
  if (*a3 == 1LL)
  {
    ++a2;
LABEL_4:
    *a2 = *result;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t sub_186F1B2E4()
{
  return 0LL;
}

uint64_t sub_186F1B2F4@<X0>(uint64_t result@<X0>, void *a2@<X1>, _DWORD *a3@<X8>)
{
  if (*a2)
  {
    if (*a2 != 1LL) {
      goto LABEL_7;
    }
    result += 8LL;
  }

  if (a2[1] <= 1uLL)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 1LL));
    return result;
  }

  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_186F1B32C()
{
  return 0LL;
}

void *sub_186F1B33C@<X0>(void *result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_6;
  }
  if (v3 == 1)
  {
    ++result;
LABEL_6:
    *a3 = *result;
    return result;
  }

  if (v3 == 2)
  {
    result += 2;
    goto LABEL_6;
  }

  __break(1u);
  return result;
}

uint64_t *sub_186F1B370(uint64_t *result, void *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  uint64_t v4 = *result;
  if (!*a3) {
    goto LABEL_4;
  }
  if (v3 == 1)
  {
    ++a2;
LABEL_4:
    *a2 = v4;
    return result;
  }

  if (v3 == 2) {
    a2[2] = v4;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_186F1B3A4()
{
  return 0LL;
}

uint64_t sub_186F1B3BC()
{
  return 0LL;
}

void *sub_186F1B3CC@<X0>(void *result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_8;
  }
  switch(v3)
  {
    case 2LL:
      result += 2;
      goto LABEL_8;
    case 1LL:
      ++result;
LABEL_8:
      *a3 = *result;
      return result;
    case 3LL:
      result += 3;
      goto LABEL_8;
  }

  __break(1u);
  return result;
}

uint64_t *sub_186F1B410(uint64_t *result, void *a2, void *a3)
{
  uint64_t v3 = *result;
  switch(*a3)
  {
    case 0LL:
      goto LABEL_3;
    case 1LL:
      ++a2;
LABEL_3:
      *a2 = v3;
      break;
    case 2LL:
      a2[2] = v3;
      break;
    case 3LL:
      a2[3] = v3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x186F1B458LL);
  }

  return result;
}

uint64_t sub_186F1B468()
{
  return 0LL;
}

uint64_t sub_186F1B480()
{
  return 0LL;
}

uint64_t sub_186F1B498()
{
  return 0LL;
}

uint64_t sub_186F1B4A8@<X0>(uint64_t result@<X0>, void *a2@<X1>, _DWORD *a3@<X8>)
{
  if (*a2)
  {
    if (*a2 != 1LL) {
      goto LABEL_7;
    }
    result += 16LL;
  }

  if (a2[1] <= 2uLL)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 3LL));
    return result;
  }

  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_186F1B4E0()
{
  return 0LL;
}

uint64_t sub_186F1B4F8()
{
  return 0LL;
}

uint64_t sub_186F1B510()
{
  return 0LL;
}

uint64_t sub_186F1B528()
{
  return 0LL;
}

uint64_t sub_186F1B540()
{
  return 0LL;
}

_OWORD *keypath_get_21Tm@<X0>(_OWORD *result@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  if (!*a2) {
    goto LABEL_4;
  }
  if (*a2 == 1LL)
  {
    ++result;
LABEL_4:
    *a3 = *result;
    return result;
  }

  __break(1u);
  return result;
}

_OWORD *keypath_set_22Tm(_OWORD *result, _OWORD *a2, void *a3)
{
  if (!*a3) {
    goto LABEL_4;
  }
  if (*a3 == 1LL)
  {
    ++a2;
LABEL_4:
    *a2 = *result;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t sub_186F1B5A0()
{
  return 0LL;
}

uint64_t sub_186F1B5B0@<X0>(uint64_t result@<X0>, void *a2@<X1>, _DWORD *a3@<X8>)
{
  if (*a2)
  {
    if (*a2 != 1LL) {
      goto LABEL_7;
    }
    result += 16LL;
  }

  if (a2[1] <= 3uLL)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 3LL));
    return result;
  }

  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_186F1B5E8()
{
  return 0LL;
}

_OWORD *keypath_get_29Tm@<X0>(_OWORD *result@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_6;
  }
  if (v3 == 1)
  {
    ++result;
LABEL_6:
    *a3 = *result;
    return result;
  }

  if (v3 == 2)
  {
    result += 2;
    goto LABEL_6;
  }

  __break(1u);
  return result;
}

__int128 *keypath_set_30Tm(__int128 *result, _OWORD *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  __int128 v4 = *result;
  if (!*a3) {
    goto LABEL_4;
  }
  if (v3 == 1)
  {
    ++a2;
LABEL_4:
    *a2 = v4;
    return result;
  }

  if (v3 == 2) {
    a2[2] = v4;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_186F1B668()
{
  return 0LL;
}

uint64_t sub_186F1B680()
{
  return 0LL;
}

_OWORD *keypath_get_37Tm@<X0>(_OWORD *result@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_8;
  }
  switch(v3)
  {
    case 2LL:
      result += 2;
      goto LABEL_8;
    case 1LL:
      ++result;
LABEL_8:
      *a3 = *result;
      return result;
    case 3LL:
      result += 3;
      goto LABEL_8;
  }

  __break(1u);
  return result;
}

__int128 *keypath_set_38Tm(__int128 *result, _OWORD *a2, void *a3)
{
  __int128 v3 = *result;
  switch(*a3)
  {
    case 0LL:
      goto LABEL_3;
    case 1LL:
      ++a2;
LABEL_3:
      *a2 = v3;
      break;
    case 2LL:
      a2[2] = v3;
      break;
    case 3LL:
      a2[3] = v3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x186F1B724LL);
  }

  return result;
}

uint64_t sub_186F1B734()
{
  return 0LL;
}

uint64_t sub_186F1B74C()
{
  return 0LL;
}

_OWORD *sub_186F1B75C@<X0>(_OWORD *result@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  if (!*a2) {
    goto LABEL_4;
  }
  if (*a2 == 1LL)
  {
    ++result;
LABEL_4:
    *a3 = *result;
    return result;
  }

  __break(1u);
  return result;
}

_OWORD *sub_186F1B780(_OWORD *result, _OWORD *a2, void *a3)
{
  if (!*a3) {
    goto LABEL_4;
  }
  if (*a3 == 1LL)
  {
    ++a2;
LABEL_4:
    *a2 = *result;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t sub_186F1B7A4()
{
  return 0LL;
}

uint64_t sub_186F1B7B4@<X0>(uint64_t result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*a2)
  {
    if (*a2 != 1LL) {
      goto LABEL_7;
    }
    result += 16LL;
  }

  if (a2[1] <= 1uLL)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 1LL));
    return result;
  }

  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_186F1B7EC()
{
  return 0LL;
}

_OWORD *sub_186F1B7FC@<X0>(_OWORD *result@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_6;
  }
  if (v3 == 1)
  {
    ++result;
LABEL_6:
    *a3 = *result;
    return result;
  }

  if (v3 == 2)
  {
    result += 2;
    goto LABEL_6;
  }

  __break(1u);
  return result;
}

__int128 *sub_186F1B830(__int128 *result, _OWORD *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  __int128 v4 = *result;
  if (!*a3) {
    goto LABEL_4;
  }
  if (v3 == 1)
  {
    ++a2;
LABEL_4:
    *a2 = v4;
    return result;
  }

  if (v3 == 2) {
    a2[2] = v4;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_186F1B864()
{
  return 0LL;
}

uint64_t sub_186F1B87C()
{
  return 0LL;
}

_OWORD *sub_186F1B88C@<X0>(_OWORD *result@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_8;
  }
  switch(v3)
  {
    case 2LL:
      result += 2;
      goto LABEL_8;
    case 1LL:
      ++result;
LABEL_8:
      *a3 = *result;
      return result;
    case 3LL:
      result += 3;
      goto LABEL_8;
  }

  __break(1u);
  return result;
}

__int128 *sub_186F1B8D0(__int128 *result, _OWORD *a2, void *a3)
{
  __int128 v3 = *result;
  switch(*a3)
  {
    case 0LL:
      goto LABEL_3;
    case 1LL:
      ++a2;
LABEL_3:
      *a2 = v3;
      break;
    case 2LL:
      a2[2] = v3;
      break;
    case 3LL:
      a2[3] = v3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x186F1B918LL);
  }

  return result;
}

uint64_t sub_186F1B928()
{
  return 0LL;
}

uint64_t sub_186F1B940()
{
  return 0LL;
}

uint64_t sub_186F1B958()
{
  return 0LL;
}

uint64_t sub_186F1B968@<X0>(uint64_t result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*a2)
  {
    if (*a2 != 1LL) {
      goto LABEL_7;
    }
    result += 32LL;
  }

  if (a2[1] <= 2uLL)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 3LL));
    return result;
  }

  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_186F1B9A0()
{
  return 0LL;
}

uint64_t sub_186F1B9B8()
{
  return 0LL;
}

uint64_t sub_186F1B9D0()
{
  return 0LL;
}

uint64_t sub_186F1B9E8()
{
  return 0LL;
}

uint64_t sub_186F1BA00()
{
  return 0LL;
}

_OWORD *keypath_get_93Tm@<X0>(_OWORD *result@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  if (!*a2) {
    goto LABEL_4;
  }
  if (*a2 == 1LL)
  {
    result += 2;
LABEL_4:
    __int128 v3 = result[1];
    *a3 = *result;
    a3[1] = v3;
    return result;
  }

  __break(1u);
  return result;
}

_OWORD *keypath_set_94Tm(_OWORD *result, _OWORD *a2, void *a3)
{
  __int128 v3 = result[1];
  if (!*a3) {
    goto LABEL_4;
  }
  if (*a3 == 1LL)
  {
    a2 += 2;
LABEL_4:
    *a2 = *result;
    a2[1] = v3;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t sub_186F1BA60()
{
  return 0LL;
}

uint64_t sub_186F1BA70@<X0>(uint64_t result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*a2)
  {
    if (*a2 != 1LL) {
      goto LABEL_7;
    }
    result += 32LL;
  }

  if (a2[1] <= 3uLL)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 3LL));
    return result;
  }

  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_186F1BAA8()
{
  return 0LL;
}

_OWORD *keypath_get_101Tm@<X0>(_OWORD *result@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_6;
  }
  if (v3 == 1)
  {
    result += 2;
LABEL_6:
    __int128 v4 = result[1];
    *a3 = *result;
    a3[1] = v4;
    return result;
  }

  if (v3 == 2)
  {
    result += 4;
    goto LABEL_6;
  }

  __break(1u);
  return result;
}

__int128 *keypath_set_102Tm(__int128 *result, _OWORD *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  __int128 v5 = *result;
  __int128 v4 = result[1];
  if (!*a3) {
    goto LABEL_4;
  }
  if (v3 == 1)
  {
    a2 += 2;
LABEL_4:
    *a2 = v5;
    a2[1] = v4;
    return result;
  }

  if (v3 == 2)
  {
    float32x4_t v6 = a2 + 4;
    *float32x4_t v6 = v5;
    v6[1] = v4;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_186F1BB2C()
{
  return 0LL;
}

uint64_t sub_186F1BB44()
{
  return 0LL;
}

_OWORD *keypath_get_109Tm@<X0>(_OWORD *result@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_8;
  }
  switch(v3)
  {
    case 2LL:
      result += 4;
      goto LABEL_8;
    case 1LL:
      result += 2;
LABEL_8:
      __int128 v4 = result[1];
      *a3 = *result;
      a3[1] = v4;
      return result;
    case 3LL:
      result += 6;
      goto LABEL_8;
  }

  __break(1u);
  return result;
}

__int128 *keypath_set_110Tm(__int128 *result, _OWORD *a2, void *a3)
{
  __int128 v4 = *result;
  __int128 v3 = result[1];
  switch(*a3)
  {
    case 0LL:
      goto LABEL_3;
    case 1LL:
      a2 += 2;
LABEL_3:
      *a2 = v4;
      a2[1] = v3;
      break;
    case 2LL:
      __int128 v5 = a2 + 4;
      *__int128 v5 = v4;
      v5[1] = v3;
      break;
    case 3LL:
      float32x4_t v6 = a2 + 6;
      *float32x4_t v6 = v4;
      v6[1] = v3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x186F1BBF0LL);
  }

  return result;
}

uint64_t sub_186F1BC00()
{
  return 0LL;
}

uint64_t sub_186F1BC18()
{
  return 0LL;
}

void __swiftcall simd_quatf.init(ix:iy:iz:r:)( simd_quatf *__return_ptr retstr, Swift::Float ix, Swift::Float iy, Swift::Float iz, Swift::Float r)
{
}

double simd_quatf.init(real:imag:)(double a1, double a2)
{
  return a2;
}

  ;
}

double simd_quatf.init(angle:axis:)(float a1, float32x4_t a2)
{
  *(void *)&double result = vmulq_n_f32(a2, __sincosf_stret(a1 * 0.5).__sinval).u64[0];
  return result;
}

double simd_quaternion(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(a1, a2);
  if (vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2),  vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))).f32[0] >= 0.0)
  {
    float32x4_t v34 = vaddq_f32(a1, a2);
    int32x4_t v35 = (int32x4_t)vmulq_f32(v34, v34);
    *(float32x2_t *)v35.i8  = vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v35, 2),  vadd_f32(*(float32x2_t *)v35.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v35.i8, 1)));
    v36  = vrsqrte_f32(*(float32x2_t *)v35.i8);
    v37  = vmul_f32(v36, vrsqrts_f32(*(float32x2_t *)v35.i8, vmul_f32(v36, v36)));
    float32x4_t v38 = vmulq_n_f32(v34, vmul_f32(v37, vrsqrts_f32(*(float32x2_t *)v35.i8, vmul_f32(v37, v37))).f32[0]);
    int32x4_t v39 = (int32x4_t)vmlaq_f32( vmulq_f32( (float32x4_t)vextq_s8( (int8x16_t)vuzp1q_s32((int32x4_t)v38, (int32x4_t)v38),  (int8x16_t)v38,  0xCuLL),  vnegq_f32(a1)),  v38,  (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL));
    unint64_t v33 = vextq_s8((int8x16_t)vuzp1q_s32(v39, v39), (int8x16_t)v39, 0xCuLL).u64[0];
  }

  else
  {
    int32x4_t v3 = (int32x4_t)vmulq_f32(a1, a1);
    *(float32x2_t *)v3.i8  = vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v3, 2),  vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v3.i8, 1)));
    float32x2_t v4 = vrsqrte_f32(*(float32x2_t *)v3.i8);
    float32x2_t v5 = vmul_f32(v4, vrsqrts_f32(*(float32x2_t *)v3.i8, vmul_f32(v4, v4)));
    v3.i32[0]  = vmul_f32(v5, vrsqrts_f32(*(float32x2_t *)v3.i8, vmul_f32(v5, v5))).u32[0];
    int32x4_t v6 = (int32x4_t)vmulq_f32(a2, a2);
    *(float32x2_t *)v6.i8  = vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v6, 2),  vadd_f32(*(float32x2_t *)v6.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v6.i8, 1)));
    float32x2_t v7 = vrsqrte_f32(*(float32x2_t *)v6.i8);
    float32x2_t v8 = vmul_f32(v7, vrsqrts_f32(*(float32x2_t *)v6.i8, vmul_f32(v7, v7)));
    float32x4_t v9 = vaddq_f32( vmulq_n_f32(a1, *(float *)v3.i32),  vmulq_n_f32(a2, vmul_f32(v8, vrsqrts_f32(*(float32x2_t *)v6.i8, vmul_f32(v8, v8))).f32[0]));
    float32x4_t v10 = vmulq_f32(v9, v9);
    float32x2_t v11 = (float32x2_t)vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2),  vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).u64[0];
    if (v11.f32[0] <= 1.4211e-14)
    {
      float32x4_t v40 = vabsq_f32(a1);
      v41  = v40.f32[1];
      float v42 = v40.f32[2];
      if (v40.f32[0] > v40.f32[1] || v40.f32[0] > v40.f32[2])
      {
        float32x4_t v43 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL);
        if (v41 <= v42)
        {
          float32x4_t v44 = vmulq_f32(a1, (float32x4_t)xmmword_186F1ED60);
          float32x4_t v45 = (float32x4_t)xmmword_186F1ED70;
        }

        else
        {
          float32x4_t v44 = vmulq_f32(a1, (float32x4_t)xmmword_186F1ED80);
          float32x4_t v45 = (float32x4_t)xmmword_186F1ED90;
        }
      }

      else
      {
        float32x4_t v43 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL);
        float32x4_t v44 = vmulq_f32(a1, (float32x4_t)xmmword_186F1ED40);
        float32x4_t v45 = (float32x4_t)xmmword_186F1ED50;
      }

      float32x4_t v46 = vmlaq_f32(v44, v45, v43);
      float32x4_t v47 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v46, (int32x4_t)v46), (int8x16_t)v46, 0xCuLL);
      int32x4_t v48 = (int32x4_t)vmulq_f32(v46, v46);
      *(float32x2_t *)v48.i8  = vadd_f32( (float32x2_t)vdup_lane_s32(*(int32x2_t *)v48.i8, 1),  vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v48, 2), *(float32x2_t *)v48.i8));
      float32x2_t v49 = vrsqrte_f32(*(float32x2_t *)v48.i8);
      float32x2_t v50 = vmul_f32(v49, vrsqrts_f32(*(float32x2_t *)v48.i8, vmul_f32(v49, v49)));
      unint64_t v33 = vmulq_n_f32(v47, vmul_f32(v50, vrsqrts_f32(*(float32x2_t *)v48.i8, vmul_f32(v50, v50))).f32[0]).u64[0];
    }

    else
    {
      float32x2_t v12 = vrsqrte_f32(v11);
      float32x2_t v13 = vmul_f32(v12, vrsqrts_f32(v11, vmul_f32(v12, v12)));
      float32x4_t v14 = vmulq_n_f32(v9, vmul_f32(v13, vrsqrts_f32(v11, vmul_f32(v13, v13))).f32[0]);
      float32x4_t v15 = vaddq_f32(a1, v14);
      int32x4_t v16 = (int32x4_t)vmulq_f32(v15, v15);
      *(float32x2_t *)v16.i8  = vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v16, 2),  vadd_f32(*(float32x2_t *)v16.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v16.i8, 1)));
      float32x2_t v17 = vrsqrte_f32(*(float32x2_t *)v16.i8);
      float32x2_t v18 = vmul_f32(v17, vrsqrts_f32(*(float32x2_t *)v16.i8, vmul_f32(v17, v17)));
      float32x4_t v19 = vmulq_n_f32(v15, vmul_f32(v18, vrsqrts_f32(*(float32x2_t *)v16.i8, vmul_f32(v18, v18))).f32[0]);
      float32x4_t v20 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL);
      float32x4_t v21 = vmulq_f32( (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v19, (int32x4_t)v19), (int8x16_t)v19, 0xCuLL),  vnegq_f32(a1));
      float32x4_t v22 = vmulq_f32(v19, a1);
      float32x4_t v23 = vmlaq_f32(v21, v19, v20);
      float32x4_t v24 = vaddq_f32(a2, v14);
      int32x4_t v25 = (int32x4_t)vmulq_f32(v24, v24);
      *(float32x2_t *)v25.i8  = vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v25, 2),  vadd_f32(*(float32x2_t *)v25.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v25.i8, 1)));
      *(float32x2_t *)v20.f32  = vrsqrte_f32(*(float32x2_t *)v25.i8);
      *(float32x2_t *)v20.f32  = vmul_f32( *(float32x2_t *)v20.f32,  vrsqrts_f32( *(float32x2_t *)v25.i8,  vmul_f32(*(float32x2_t *)v20.f32, *(float32x2_t *)v20.f32)));
      float32x4_t v26 = vmulq_n_f32( v24,  vmul_f32( *(float32x2_t *)v20.f32,  vrsqrts_f32(*(float32x2_t *)v25.i8, vmul_f32(*(float32x2_t *)v20.f32, *(float32x2_t *)v20.f32))).f32[0]);
      int32x4_t v27 = (int32x4_t)vmlaq_f32( vmulq_f32( (float32x4_t)vextq_s8( (int8x16_t)vuzp1q_s32((int32x4_t)v26, (int32x4_t)v26),  (int8x16_t)v26,  0xCuLL),  vnegq_f32(v14)),  v26,  (float32x4_t)vextq_s8( (int8x16_t)vuzp1q_s32((int32x4_t)v14, (int32x4_t)v14),  (int8x16_t)v14,  0xCuLL));
      float32x4_t v28 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v27, v27), (int8x16_t)v27, 0xCuLL);
      v29  = vmulq_f32(v14, v26);
      v28.i32[3]  = vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v29, 2),  vaddq_f32(v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.f32, 1))).u32[0];
      int32x4_t v30 = (int32x4_t)vnegq_f32(v28);
      int8x16_t v31 = (int8x16_t)vtrn2q_s32((int32x4_t)v28, vtrn1q_s32((int32x4_t)v28, v30));
      float32x4_t v32 = (float32x4_t)vrev64q_s32((int32x4_t)v28);
      v32.i32[0]  = v30.i32[1];
      v32.i32[3]  = v30.i32[2];
      unint64_t v33 = vaddq_f32( vmlaq_lane_f32( vmulq_n_f32( v28,  vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2),  vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]),  v32,  *(float32x2_t *)v23.f32,  1),  vmlaq_laneq_f32( vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v28, (int8x16_t)v30, 8uLL), v23.f32[0]),  (float32x4_t)vextq_s8(v31, v31, 8uLL),  v23,  2)).u64[0];
    }
  }

  return *(double *)&v33;
}

void __swiftcall simd_quatf.init(_:)(simd_quatf *__return_ptr retstr, simd_float3x3 *a2)
{
}

double simd_quaternion(simd_float3x3 a1, double a2, double a3)
{
  float v3 = a1.columns[2].f32[2] + (float)(a1.columns[0].f32[0] + a1.columns[1].f32[1]);
  if (v3 >= 0.0)
  {
    float v8 = sqrtf(v3 + 1.0);
    *(float *)&a3  = v8 + v8;
    float32x2_t v9 = vrecpe_f32(*(float32x2_t *)&a3);
    float32x2_t v10 = vmul_f32(v9, vrecps_f32(*(float32x2_t *)&a3, v9));
    float32x2_t v19 = vmul_n_f32( vsub_f32( (float32x2_t)vzip1_s32( (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[1], (int8x16_t)a1.columns[1], 8uLL),  *(int32x2_t *)a1.columns[2].f32),  (float32x2_t)vext_s8( *(int8x8_t *)a1.columns[2].f32,  (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[0], (int8x16_t)a1.columns[0], 8uLL),  4uLL)),  vmul_f32(v10, vrecps_f32(*(float32x2_t *)&a3, v10)).f32[0]);
  }

  else if (a1.columns[0].f32[0] < a1.columns[1].f32[1] || a1.columns[0].f32[0] < a1.columns[2].f32[2])
  {
    float v5 = 1.0 - a1.columns[0].f32[0];
    if (a1.columns[1].f32[1] >= a1.columns[2].f32[2])
    {
      *(float *)&a2  = sqrtf(a1.columns[1].f32[1] + (float)(v5 - a1.columns[2].f32[2]));
      *(float *)&a2  = *(float *)&a2 + *(float *)&a2;
      float32x2_t v20 = vrecpe_f32(*(float32x2_t *)&a2);
      float32x2_t v21 = vmul_f32(v20, vrecps_f32(*(float32x2_t *)&a2, v20));
      v21.i32[0]  = vmul_f32(v21, vrecps_f32(*(float32x2_t *)&a2, v21)).u32[0];
      v22.i32[0]  = vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)a1.columns[0].f32, 1),  *(float32x2_t *)a1.columns[1].f32).u32[0];
      v22.i32[1]  = LODWORD(a2);
      v21.i32[1]  = 0.25;
      float32x2_t v19 = vmul_f32(v22, v21);
    }

    else
    {
      *(float32x2_t *)a1.columns[2].f32  = vadd_f32( (float32x2_t)vzip1_s32( (int32x2_t)*(_OWORD *)&vextq_s8( (int8x16_t)a1.columns[0],  (int8x16_t)a1.columns[0],  8uLL),  (int32x2_t)*(_OWORD *)&vextq_s8( (int8x16_t)a1.columns[1],  (int8x16_t)a1.columns[1],  8uLL)),  *(float32x2_t *)a1.columns[2].f32);
      float32x2_t v6 = (float32x2_t)__PAIR64__( a1.columns[0].u32[1],  COERCE_UNSIGNED_INT(sqrtf(a1.columns[2].f32[2] + (float)(v5 - a1.columns[1].f32[1]))));
      *(int32x2_t *)a1.columns[1].f32  = vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
      *(float32x2_t *)a1.columns[0].f32  = vsub_f32(*(float32x2_t *)a1.columns[0].f32, *(float32x2_t *)a1.columns[1].f32);
      a1.columns[1].i32[0]  = 2.0;
      a1.columns[1].i32[0]  = vmul_f32(v6, *(float32x2_t *)a1.columns[1].f32).u32[0];
      a1.columns[1].i32[1]  = a1.columns[0].i32[1];
      *(float32x2_t *)a1.columns[0].f32  = vrecpe_f32(*(float32x2_t *)a1.columns[1].f32);
      *(float32x2_t *)a1.columns[0].f32  = vmul_f32( *(float32x2_t *)a1.columns[0].f32,  vrecps_f32( *(float32x2_t *)a1.columns[1].f32,  *(float32x2_t *)a1.columns[0].f32));
      float32x2_t v19 = vmul_n_f32( *(float32x2_t *)a1.columns[2].f32,  vmul_f32( *(float32x2_t *)a1.columns[0].f32,  vrecps_f32(*(float32x2_t *)a1.columns[1].f32, *(float32x2_t *)a1.columns[0].f32)).f32[0]);
      __asm { FMOV            V2.2S, #0.25 }
    }
  }

  else
  {
    float32x2_t v11 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
    float32x2_t v12 = vadd_f32(*(float32x2_t *)a1.columns[0].f32, v11);
    v11.i32[0]  = 2.0;
    v11.i32[0]  = vmul_f32( (float32x2_t)__PAIR64__( a1.columns[0].u32[1],  COERCE_UNSIGNED_INT( sqrtf( a1.columns[0].f32[0] + (float)((float)(1.0 - a1.columns[1].f32[1]) - a1.columns[2].f32[2])))),  v11).u32[0];
    v11.i32[1]  = v12.i32[1];
    float32x2_t v13 = vrecpe_f32(v11);
    float32x2_t v14 = vmul_f32(v13, vrecps_f32(v11, v13));
    __asm { FMOV            V5.2S, #0.25 }

    _D5.i32[1]  = vmul_f32(v14, vrecps_f32(v11, v14)).u32[0];
    float32x2_t v19 = vmul_f32(v11, _D5);
  }

  return *(double *)&v19;
}

float simd_quatf.real.getter(__n128 a1)
{
  return a1.n128_f32[3];
}

void simd_quatf.real.setter(float a1)
{
  *(float *)(v1 + 12)  = a1;
}

float (*simd_quatf.real.modify(uint64_t a1))(float *a1)
{
  *(void *)a1  = v1;
  *(_DWORD *)(a1 + 8)  = *(_DWORD *)(v1 + 12);
  return simd_quatf.real.modify;
}

float simd_quatf.real.modify(float *a1)
{
  float result = a1[2];
  *(float *)(*(void *)a1 + 12LL)  = result;
  return result;
}

__n128 simd_quatf.imag.setter(__n128 result)
{
  result.n128_u32[3]  = v1->n128_u32[3];
  *uint64_t v1 = result;
  return result;
}

__n128 (*simd_quatf.imag.modify(void *a1))(void **a1)
{
  float v3 = malloc(0x18uLL);
  *a1  = v3;
  v3[2]  = v1;
  *(_OWORD *)float v3 = *v1;
  return simd_quatf.imag.modify;
}

__n128 simd_quatf.imag.modify(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = v1[2];
  __int128 v3 = *(_OWORD *)v1;
  HIDWORD(v3)  = *(_DWORD *)(v2 + 12);
  *(_OWORD *)uint64_t v2 = v3;
  free(v1);
  return result;
}

float simd_quatf.angle.getter(float32x4_t a1)
{
  float32x4_t v1 = vmulq_f32(a1, a1);
  float v2 = atan2f( sqrtf(vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v1, 2),  vaddq_f32(v1, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v1.f32, 1))).f32[0]),  a1.f32[3]);
  return v2 + v2;
}

double simd_quatf.axis.getter(float32x4_t a1)
{
  int32x4_t v1 = (int32x4_t)vmulq_f32(a1, a1);
  *(float32x2_t *)v1.i8  = vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v1, 2),  vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v1.i8, 1)));
  float32x2_t v2 = vrsqrte_f32(*(float32x2_t *)v1.i8);
  float32x2_t v3 = vmul_f32(v2, vrsqrts_f32(*(float32x2_t *)v1.i8, vmul_f32(v2, v2)));
  *(void *)&double result = vmulq_n_f32(a1, vmul_f32(v3, vrsqrts_f32(*(float32x2_t *)v1.i8, vmul_f32(v3, v3))).f32[0]).u64[0];
  return result;
}

double simd_quatf.conjugate.getter(float32x4_t a1)
{
  *(void *)&double result = vmulq_f32(a1, (float32x4_t)xmmword_186F1EDA0).u64[0];
  return result;
}

double simd_quatf.inverse.getter(float32x4_t a1)
{
  float32x4_t v1 = vmulq_f32(a1, (float32x4_t)xmmword_186F1EDA0);
  int8x16_t v2 = (int8x16_t)vmulq_f32(a1, a1);
  *(float32x2_t *)v2.i8  = vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
  *(float32x2_t *)v2.i8  = vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 1));
  float32x2_t v3 = vrecpe_f32(*(float32x2_t *)v2.i8);
  float32x2_t v4 = vmul_f32(v3, vrecps_f32(*(float32x2_t *)v2.i8, v3));
  *(void *)&double result = vmulq_n_f32(v1, vmul_f32(v4, vrecps_f32(*(float32x2_t *)v2.i8, v4)).f32[0]).u64[0];
  return result;
}

double simd_quatf.normalized.getter(float32x4_t a1)
{
  int8x16_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  float32x2_t v2 = vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL));
  if (vaddv_f32(v2) == 0.0) {
    return 0.0;
  }
  float32x2_t v4 = vadd_f32(v2, (float32x2_t)vdup_lane_s32((int32x2_t)v2, 1));
  float32x2_t v5 = vrsqrte_f32(v4);
  float32x2_t v6 = vmul_f32(v5, vrsqrts_f32(v4, vmul_f32(v5, v5)));
  *(void *)&double result = vmulq_n_f32(a1, vmul_f32(v6, vrsqrts_f32(v4, vmul_f32(v6, v6))).f32[0]).u64[0];
  return result;
}

float simd_quatf.length.getter(float32x4_t a1)
{
  int8x16_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  return sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL))));
}

double simd_quatf.act(_:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(a2, (float32x4_t)xmmword_186F1EDA0);
  int32x4_t v3 = (int32x4_t)vnegq_f32(v2);
  int8x16_t v4 = (int8x16_t)vtrn2q_s32((int32x4_t)v2, vtrn1q_s32((int32x4_t)v2, v3));
  float32x4_t v5 = vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v2, (int8x16_t)v3, 8uLL), *(float32x2_t *)a1.f32, 1);
  float32x4_t v6 = (float32x4_t)vrev64q_s32((int32x4_t)v2);
  v6.i32[0]  = v3.i32[1];
  v6.i32[3]  = v3.i32[2];
  float32x4_t v7 = vmlaq_laneq_f32(vmlaq_n_f32(v5, (float32x4_t)vextq_s8(v4, v4, 8uLL), a1.f32[0]), v6, a1, 2);
  int32x4_t v8 = (int32x4_t)vnegq_f32(v7);
  int8x16_t v9 = (int8x16_t)vtrn2q_s32((int32x4_t)v7, vtrn1q_s32((int32x4_t)v7, v8));
  float32x4_t v10 = vmlaq_n_f32( vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v7, (int8x16_t)v8, 8uLL), *(float32x2_t *)a2.f32, 1),  (float32x4_t)vextq_s8(v9, v9, 8uLL),  a2.f32[0]);
  float32x4_t v11 = (float32x4_t)vrev64q_s32((int32x4_t)v7);
  v11.i32[0]  = v8.i32[1];
  v11.i32[3]  = v8.i32[2];
  *(void *)&double result = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v7, a2, 3), v11, a2, 2), v10).u64[0];
  return result;
}

void __swiftcall simd_float3x3.init(_:)(simd_float3x3 *__return_ptr retstr, simd_quatf *a2)
{
  *(double *)v4.i64  = simd_matrix3x3(v2);
  retstr->columns[0]  = v4;
  retstr->columns[1]  = v5;
  retstr->columns[2]  = v6;
}

double simd_matrix3x3(float32x4_t a1)
{
  return simd_matrix4x4(a1);
}

double simd_matrix4x4(float32x4_t a1)
{
  _S3  = a1.i32[1];
  _S5  = a1.i32[2];
  __asm { FMLS            S1, S5, V0.S[2] }

  _S7  = a1.i32[3];
  __asm { FMLA            S1, S7, V0.S[3] }

  float v10 = vmlas_n_f32(vmuls_lane_f32(a1.f32[2], a1, 3), a1.f32[1], a1.f32[0]);
  LODWORD(v11)  = _S1;
  *((float *)&v11 + 1)  = v10 + v10;
  __asm
  {
    FMLA            S6, S3, V0.S[1]
    FMLA            S6, S7, V0.S[3]
    FMLS            S6, S0, V0.S[0]
    FMLA            S18, S5, V0.S[1]
    FMLA            S17, S0, V0.S[2]
    FMLA            S16, S5, V0.S[1]
    FMLA            S7, S5, V0.S[2]
    FMLS            S7, S0, V0.S[0]
    FMLS            S7, S3, V0.S[1]
  }

  return v11;
}

uint64_t simd_quatf.debugDescription.getter()
{
  v0._object  = (void *)0x8000000186F1F8B0LL;
  v0._countAndFlagsBits  = 0xD000000000000011LL;
  String.append(_:)(v0);
  Float.write<A>(to:)();
  v1._countAndFlagsBits  = 0x203A67616D69202CLL;
  v1._object  = (void *)0xE800000000000000LL;
  String.append(_:)(v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SIMD3<Float>);
  lazy protocol witness table accessor for type SIMD3<Float> and conformance SIMD3<A>( &lazy protocol witness table cache variable for type SIMD3<Float> and conformance SIMD3<A>,  &demangling cache variable for type metadata for SIMD3<Float>);
  v2._countAndFlagsBits  = SIMD.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits  = 41LL;
  v3._object  = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  return 0LL;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x18959D8F8]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1  = result;
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x18959D904](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1  = result;
  }

  return result;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_quatf()
{
  return simd_quatf.debugDescription.getter();
}

uint64_t static simd_quatf.== infix(_:_:)(float32x4_t a1, float32x4_t a2)
{
  __int8 v2 = 0;
  int16x4_t v3 = vmovn_s32(vceqq_f32(a1, a2));
  if ((v3.i8[0] & 1) != 0 && (v3.i8[2] & 1) != 0 && (v3.i8[4] & 1) != 0) {
    __int8 v2 = v3.i8[6];
  }
  return v2 & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_quatf( float32x4_t *a1, float32x4_t *a2)
{
  __int8 v2 = 0;
  int16x4_t v3 = vmovn_s32(vceqq_f32(*a1, *a2));
  if ((v3.i8[0] & 1) != 0 && (v3.i8[2] & 1) != 0 && (v3.i8[4] & 1) != 0) {
    __int8 v2 = v3.i8[6];
  }
  return v2 & 1;
}

void simd_quatf.hash(into:)(int32x4_t a1, int32x4_t a2)
{
  a2.i32[0]  = 0;
  specialized SIMD.hash(into:)((__n128)vbslq_s8( (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(a2, a1), 0),  (int8x16_t)vnegq_f32((float32x4_t)a1),  (int8x16_t)a1));
}

double simd_negate(float32x4_t a1)
{
  *(void *)&double result = vnegq_f32(a1).u64[0];
  return result;
}

Swift::Int simd_quatf.hashValue.getter(int32x4_t a1)
{
  v1.i32[0]  = 0;
  specialized SIMD.hash(into:)((__n128)vbslq_s8( (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v1, a1), 0),  (int8x16_t)vnegq_f32((float32x4_t)a1),  (int8x16_t)a1));
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance simd_quatf()
{
  return simd_quatf.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance simd_quatf()
{
  __n128 v1 = *v0;
  if ((*(_OWORD *)v0 & 0x80000000) != 0) {
    v1.n128_f64[0]  = simd_negate((float32x4_t)v1);
  }
  specialized SIMD.hash(into:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance simd_quatf()
{
  simd_quatf v3 = *v0;
  Hasher.init(_seed:)();
  __n128 v1 = (__n128)v3;
  if (v3.vector.i32[0] < 0) {
    v1.n128_f64[0]  = simd_negate((float32x4_t)v3);
  }
  specialized SIMD.hash(into:)(v1);
  return Hasher._finalize()();
}

double static simd_quatf.+ infix(_:_:)(float32x4_t a1, float32x4_t a2)
{
  *(void *)&double result = vaddq_f32(a1, a2).u64[0];
  return result;
}

float32x4_t static simd_quatf.+= infix(_:_:)(float32x4_t *a1, float32x4_t a2)
{
  float32x4_t result = vaddq_f32(*a1, a2);
  *a1  = result;
  return result;
}

double static simd_quatf.- infix(_:_:)(float32x4_t a1, float32x4_t a2)
{
  *(void *)&double result = vsubq_f32(a1, a2).u64[0];
  return result;
}

float32x4_t static simd_quatf.-= infix(_:_:)(float32x4_t *a1, float32x4_t a2)
{
  float32x4_t result = vsubq_f32(*a1, a2);
  *a1  = result;
  return result;
}

double static simd_quatf.- prefix(_:)(float32x4_t a1)
{
  *(void *)&double result = vsubq_f32((float32x4_t)0, a1).u64[0];
  return result;
}

double static simd_quatf.* infix(_:_:)(float32x4_t a1, float32x4_t a2)
{
  int32x4_t v2 = (int32x4_t)vnegq_f32(a2);
  int8x16_t v3 = (int8x16_t)vtrn2q_s32((int32x4_t)a2, vtrn1q_s32((int32x4_t)a2, v2));
  float32x4_t v4 = vmlaq_n_f32( vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)a2, (int8x16_t)v2, 8uLL), *(float32x2_t *)a1.f32, 1),  (float32x4_t)vextq_s8(v3, v3, 8uLL),  a1.f32[0]);
  float32x4_t v5 = (float32x4_t)vrev64q_s32((int32x4_t)a2);
  v5.i32[0]  = v2.i32[1];
  v5.i32[3]  = v2.i32[2];
  *(void *)&double result = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(a2, a1, 3), v5, a1, 2), v4).u64[0];
  return result;
}

double static simd_quatf.* infix(_:_:)(float a1, float32x4_t a2)
{
  *(void *)&double result = vmulq_n_f32(a2, a1).u64[0];
  return result;
}

double static simd_quatf.* infix(_:_:)(float32x4_t a1, float a2)
{
  *(void *)&double result = vmulq_n_f32(a1, a2).u64[0];
  return result;
}

float32x4_t static simd_quatf.*= infix(_:_:)(float32x2_t *a1, float32x4_t a2)
{
  int32x4_t v2 = (int32x4_t)vnegq_f32(a2);
  int8x16_t v3 = (int8x16_t)vtrn2q_s32((int32x4_t)a2, vtrn1q_s32((int32x4_t)a2, v2));
  float32x4_t v4 = vmlaq_n_f32( vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)a2, (int8x16_t)v2, 8uLL), *a1, 1),  (float32x4_t)vextq_s8(v3, v3, 8uLL),  COERCE_FLOAT(*(_OWORD *)a1->f32));
  float32x4_t v5 = (float32x4_t)vrev64q_s32((int32x4_t)a2);
  v5.i32[0]  = v2.i32[1];
  v5.i32[3]  = v2.i32[2];
  float32x4_t result = vaddq_f32( v4,  vmlaq_laneq_f32(vmulq_laneq_f32(a2, *(float32x4_t *)a1->f32, 3), v5, *(float32x4_t *)a1->f32, 2));
  *(float32x4_t *)a1->f32  = result;
  return result;
}

float32x4_t static simd_quatf.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t result = vmulq_n_f32(*a1, a2);
  *a1  = result;
  return result;
}

double static simd_quatf./ infix(_:_:)(float32x4_t a1, float32x4_t a2)
{
  int8x16_t v2 = (int8x16_t)vmulq_f32(a2, a2);
  *(float32x2_t *)v2.i8  = vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
  float32x2_t v3 = vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 1));
  *(float32x2_t *)v2.i8  = vrecpe_f32(v3);
  *(float32x2_t *)v2.i8  = vmul_f32(*(float32x2_t *)v2.i8, vrecps_f32(v3, *(float32x2_t *)v2.i8));
  float32x4_t v4 = vmulq_n_f32( vmulq_f32(a2, (float32x4_t)xmmword_186F1EDA0),  vmul_f32(*(float32x2_t *)v2.i8, vrecps_f32(v3, *(float32x2_t *)v2.i8)).f32[0]);
  int32x4_t v5 = (int32x4_t)vnegq_f32(v4);
  int8x16_t v6 = (int8x16_t)vtrn2q_s32((int32x4_t)v4, vtrn1q_s32((int32x4_t)v4, v5));
  float32x4_t v7 = vmlaq_n_f32( vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v4, (int8x16_t)v5, 8uLL), *(float32x2_t *)a1.f32, 1),  (float32x4_t)vextq_s8(v6, v6, 8uLL),  a1.f32[0]);
  float32x4_t v8 = (float32x4_t)vrev64q_s32((int32x4_t)v4);
  v8.i32[0]  = v5.i32[1];
  v8.i32[3]  = v5.i32[2];
  *(void *)&double result = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v4, a1, 3), v8, a1, 2), v7).u64[0];
  return result;
}

double static simd_quatf./ infix(_:_:)(float32x4_t a1, int32x2_t a2)
{
  *(void *)&double result = vdivq_f32(a1, (float32x4_t)vdupq_lane_s32(a2, 0)).u64[0];
  return result;
}

float32x4_t static simd_quatf./= infix(_:_:)(float32x2_t *a1, float32x4_t a2)
{
  int8x16_t v2 = (int8x16_t)vmulq_f32(a2, a2);
  *(float32x2_t *)v2.i8  = vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
  float32x2_t v3 = vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 1));
  *(float32x2_t *)v2.i8  = vrecpe_f32(v3);
  *(float32x2_t *)v2.i8  = vmul_f32(*(float32x2_t *)v2.i8, vrecps_f32(v3, *(float32x2_t *)v2.i8));
  float32x4_t v4 = vmulq_n_f32( vmulq_f32(a2, (float32x4_t)xmmword_186F1EDA0),  vmul_f32(*(float32x2_t *)v2.i8, vrecps_f32(v3, *(float32x2_t *)v2.i8)).f32[0]);
  int32x4_t v5 = (int32x4_t)vnegq_f32(v4);
  int8x16_t v6 = (int8x16_t)vtrn2q_s32((int32x4_t)v4, vtrn1q_s32((int32x4_t)v4, v5));
  float32x4_t v7 = vmlaq_n_f32( vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v4, (int8x16_t)v5, 8uLL), *a1, 1),  (float32x4_t)vextq_s8(v6, v6, 8uLL),  COERCE_FLOAT(*(_OWORD *)a1->f32));
  float32x4_t v8 = (float32x4_t)vrev64q_s32((int32x4_t)v4);
  v8.i32[0]  = v5.i32[1];
  v8.i32[3]  = v5.i32[2];
  float32x4_t result = vaddq_f32( vmlaq_laneq_f32(vmulq_laneq_f32(v4, *(float32x4_t *)a1->f32, 3), v8, *(float32x4_t *)a1->f32, 2),  v7);
  *(float32x4_t *)a1->f32  = result;
  return result;
}

float32x4_t static simd_quatf./= infix(_:_:)(float32x4_t *a1, int32x2_t a2)
{
  float32x4_t result = vdivq_f32(*a1, (float32x4_t)vdupq_lane_s32(a2, 0));
  *a1  = result;
  return result;
}

Swift::Float __swiftcall dot(_:_:)(simd_quatf *a1, simd_quatf *a2)
{
  int8x16_t v4 = (int8x16_t)vmulq_f32(v2, v3);
  return vaddv_f32(vadd_f32(*(float32x2_t *)v4.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)));
}

void __swiftcall simd_quatd.init(ix:iy:iz:r:)( simd_quatd *__return_ptr retstr, Swift::Double ix, Swift::Double iy, Swift::Double iz, Swift::Double r)
{
}

double simd_quatd.init(real:imag:)(double a1, double a2)
{
  return a2;
}

double simd_quatd.init(angle:axis:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, __sincos_stret(a1 * 0.5).__sinval);
  return result;
}

float64_t simd_quatd.init(from:to:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  v7[0]  = a1;
  v7[1]  = a2;
  v6[0]  = a3;
  v6[1]  = a4;
  simd_quaternion(v7, v6, &v5);
  return v5.f64[0];
}

void __swiftcall simd_quatd.init(_:)(simd_quatd *__return_ptr retstr, simd_double3x3 *a2)
{
  __int128 v2 = *(_OWORD *)&a2->columns[0].f64[2];
  __int128 v3 = *(_OWORD *)a2->columns[1].f64;
  __int128 v4 = *(_OWORD *)&a2->columns[1].f64[2];
  __int128 v5 = *(_OWORD *)a2->columns[2].f64;
  __int128 v6 = *(_OWORD *)&a2->columns[2].f64[2];
  v8[0]  = *(_OWORD *)a2->columns[0].f64;
  v8[1]  = v2;
  v8[2]  = v3;
  v8[3]  = v4;
  v8[4]  = v5;
  v8[5]  = v6;
  simd_quaternion((uint64_t)v8, (uint64_t)&v7);
}

void __swiftcall simd_quatd.init(_:)(simd_quatd *__return_ptr retstr, simd_double4x4 *a2)
{
  __int128 v2 = *(_OWORD *)&a2->columns[0].f64[2];
  __int128 v3 = *(_OWORD *)a2->columns[1].f64;
  __int128 v4 = *(_OWORD *)&a2->columns[1].f64[2];
  __int128 v5 = *(_OWORD *)a2->columns[2].f64;
  __int128 v6 = *(_OWORD *)&a2->columns[2].f64[2];
  __int128 v7 = *(_OWORD *)a2->columns[3].f64;
  __int128 v8 = *(_OWORD *)&a2->columns[3].f64[2];
  v10[0]  = *(_OWORD *)a2->columns[0].f64;
  v10[1]  = v2;
  v10[2]  = v3;
  v10[3]  = v4;
  v10[4]  = v5;
  v10[5]  = v6;
  v10[6]  = v7;
  v10[7]  = v8;
  simd_quaternion((uint64_t)v10, (uint64_t)&v9);
}

double simd_quatd.real.getter(double a1, __n128 a2)
{
  return a2.n128_f64[1];
}

void simd_quatd.real.setter(double a1)
{
  *(double *)(v1 + 24)  = a1;
}

double (*simd_quatd.real.modify(void *a1))(uint64_t a1)
{
  a1[1]  = v1;
  *a1  = *(void *)(v1 + 24);
  return simd_quatd.real.modify;
}

double simd_quatd.real.modify(uint64_t a1)
{
  double result = *(double *)a1;
  *(void *)(*(void *)(a1 + 8) + 24LL)  = *(void *)a1;
  return result;
}

void simd_quatd.imag.setter(__n128 a1, __n128 a2)
{
  a2.n128_u64[1]  = v2[1].n128_u64[1];
  *__int128 v2 = a1;
  v2[1]  = a2;
}

void (*simd_quatd.imag.modify(void *a1))(void **a1)
{
  __int128 v3 = malloc(0x28uLL);
  *a1  = v3;
  v3[4]  = v1;
  __int128 v4 = v1[1];
  *(_OWORD *)__int128 v3 = *v1;
  *((_OWORD *)v3 + 1)  = v4;
  return simd_quatd.imag.modify;
}

void simd_quatd.imag.modify(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = v1[4];
  __int128 v3 = *((_OWORD *)v1 + 1);
  *((void *)&v3 + 1)  = *(void *)(v2 + 24);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 16)  = v3;
  free(v1);
}

double simd_quatd.angle.getter(float64x2_t a1, float64x2_t a2)
{
  double v2 = atan2(sqrt(vmulq_f64(a2, a2).f64[0] + vaddvq_f64(vmulq_f64(a1, a1))), a2.f64[1]);
  return v2 + v2;
}

double simd_quatd.axis.getter(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, 1.0 / sqrt(vmulq_f64(a2, a2).f64[0] + vaddvq_f64(vmulq_f64(a1, a1))));
  return result;
}

double simd_quatd.conjugate.getter(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vnegq_f64(a1);
  return result;
}

double simd_quatd.inverse.getter(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64( vnegq_f64(a1),  1.0 / vaddvq_f64(vaddq_f64(vmulq_f64(a1, a1), vmulq_f64(a2, a2))));
  return result;
}

double simd_quatd.normalized.getter(float64x2_t a1, float64x2_t a2)
{
  double v2 = vaddvq_f64(vaddq_f64(vmulq_f64(a1, a1), vmulq_f64(a2, a2)));
  if (v2 == 0.0) {
    return 0.0;
  }
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, 1.0 / sqrt(v2));
  return result;
}

double simd_quatd.length.getter(float64x2_t a1, float64x2_t a2)
{
  return sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(a1, a1), vmulq_f64(a2, a2))));
}

double simd_quatd.act(_:)(float64x2_t a1, double a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4 = vmulq_f64(a4, (float64x2_t)xmmword_186F1EDC0);
  int8x16_t v5 = (int8x16_t)vnegq_f64(a3);
  float64x2_t v6 = (float64x2_t)vextq_s8((int8x16_t)v4, (int8x16_t)vnegq_f64(v4), 8uLL);
  float64x2_t v7 = vmlaq_n_f64( vmlaq_n_f64(vmulq_laneq_f64(a3, a1, 1), (float64x2_t)vextq_s8(v5, (int8x16_t)a3, 8uLL), a1.f64[0]),  v6,  a2);
  float64x2_t v8 = vmlaq_n_f64( vmlaq_n_f64(vmulq_laneq_f64(v4, a1, 1), v6, a1.f64[0]),  (float64x2_t)vextq_s8((int8x16_t)a3, v5, 8uLL),  a2);
  *(void *)&double result = *(_OWORD *)&vaddq_f64( vmlaq_n_f64( vmulq_laneq_f64(v8, a4, 1),  (float64x2_t)vextq_s8((int8x16_t)vnegq_f64(v8), (int8x16_t)v8, 8uLL),  a4.f64[0]),  vmlaq_n_f64( vmulq_laneq_f64(v7, a3, 1),  (float64x2_t)vextq_s8((int8x16_t)v7, (int8x16_t)vnegq_f64(v7), 8uLL),  a3.f64[0]));
  return result;
}

void __swiftcall simd_double3x3.init(_:)(simd_double3x3 *__return_ptr retstr, simd_quatd *a2)
{
  simd_quatd v10 = v2;
  simd_matrix3x3(v2, (uint64_t)&v10, v9);
  __int128 v4 = v9[1];
  __int128 v5 = v9[2];
  __int128 v6 = v9[3];
  __int128 v7 = v9[4];
  __int128 v8 = v9[5];
  *(_OWORD *)retstr->columns[0].f64  = v9[0];
  *(_OWORD *)&retstr->columns[0].f64[2]  = v4;
  *(_OWORD *)retstr->columns[1].f64  = v5;
  *(_OWORD *)&retstr->columns[1].f64[2]  = v6;
  *(_OWORD *)retstr->columns[2].f64  = v7;
  *(_OWORD *)&retstr->columns[2].f64[2]  = v8;
}

void __swiftcall simd_double4x4.init(_:)(simd_double4x4 *__return_ptr retstr, simd_quatd *a2)
{
  float64x2_t v12 = *(float64x2_t *)v2.vector.f64;
  __int128 v13 = *(_OWORD *)&v2.vector.f64[2];
  simd_matrix4x4(v2, &v12, (uint64_t)v11);
  __int128 v4 = v11[1];
  __int128 v5 = v11[2];
  __int128 v6 = v11[3];
  __int128 v7 = v11[4];
  __int128 v8 = v11[5];
  __int128 v9 = v11[6];
  __int128 v10 = v11[7];
  *(_OWORD *)retstr->columns[0].f64  = v11[0];
  *(_OWORD *)&retstr->columns[0].f64[2]  = v4;
  *(_OWORD *)retstr->columns[1].f64  = v5;
  *(_OWORD *)&retstr->columns[1].f64[2]  = v6;
  *(_OWORD *)retstr->columns[2].f64  = v7;
  *(_OWORD *)&retstr->columns[2].f64[2]  = v8;
  *(_OWORD *)retstr->columns[3].f64  = v9;
  *(_OWORD *)&retstr->columns[3].f64[2]  = v10;
}

uint64_t simd_quatd.debugDescription.getter()
{
  v0._object  = (void *)0x8000000186F1F8D0LL;
  v0._countAndFlagsBits  = 0xD000000000000011LL;
  String.append(_:)(v0);
  Double.write<A>(to:)();
  v1._countAndFlagsBits  = 0x203A67616D69202CLL;
  v1._object  = (void *)0xE800000000000000LL;
  String.append(_:)(v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SIMD3<Double>);
  lazy protocol witness table accessor for type SIMD3<Float> and conformance SIMD3<A>( &lazy protocol witness table cache variable for type SIMD3<Double> and conformance SIMD3<A>,  &demangling cache variable for type metadata for SIMD3<Double>);
  v2._countAndFlagsBits  = SIMD.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits  = 41LL;
  v3._object  = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  return 0LL;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_quatd()
{
  return simd_quatd.debugDescription.getter();
}

uint64_t static simd_quatd.== infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  __int8 v4 = 0;
  if ((vmovn_s64(vceqq_f64(a1, a3)).u8[0] & 1) != 0)
  {
    v5.f64[0]  = a2.f64[0];
    v5.f64[1]  = a1.f64[1];
    v6.f64[0]  = a4.f64[0];
    v6.f64[1]  = a3.f64[1];
    int32x2_t v7 = vmovn_s64(vceqq_f64(v5, v6));
    if ((v7.i8[4] & 1) != 0 && (v7.i8[0] & 1) != 0) {
      __int8 v4 = vmovn_s64(vceqq_f64(a2, a4)).i8[4];
    }
  }

  return v4 & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_quatd( float64x2_t *a1, float64x2_t *a2)
{
  __int8 v2 = 0;
  if (a1->f64[0] == a2->f64[0])
  {
    int32x4_t v3 = (int32x4_t)vceqq_f64(a1[1], a2[1]);
    int16x4_t v4 = vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*a1, *a2), v3));
    if ((v4.i8[2] & 1) != 0 && (v4.i8[4] & 1) != 0) {
      __int8 v2 = vmovn_s32(vmovn_hight_s64(*(int32x2_t *)&v3, *(int64x2_t *)&v3)).i8[6];
    }
  }

  return v2 & 1;
}

void simd_quatd.hash(into:)(float64x2_t a1, float64x2_t a2)
{
  if ((*(void *)&a1.f64[0] & 0x8000000000000000LL) != 0)
  {
    a1  = vnegq_f64(a1);
    a2  = vnegq_f64(a2);
  }

  specialized SIMD.hash(into:)((__n128)a1, (__n128)a2);
}

Swift::Int simd_quatd.hashValue.getter(float64x2_t a1, float64x2_t a2)
{
  __n128 v2 = (__n128)a1;
  if ((*(void *)&a1.f64[0] & 0x8000000000000000LL) != 0)
  {
    __n128 v2 = (__n128)vnegq_f64(a1);
    __n128 v3 = (__n128)vnegq_f64(a2);
  }

  else
  {
    __n128 v3 = (__n128)a2;
  }

  specialized SIMD.hash(into:)(v2, v3);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance simd_quatd()
{
  float64x2_t v3 = *v0;
  float64x2_t v4 = v0[1];
  Hasher.init(_seed:)();
  *(float64x2_t *)v1.vector.f64  = v3;
  if ((*(void *)&v3.f64[0] & 0x8000000000000000LL) != 0)
  {
    v6[0]  = v3;
    *(float64x2_t *)v1.vector.f64  = v4;
    v6[1]  = v4;
    simd_negate(v1, v6, (float64x2_t *)&v5);
    simd_quatd v1 = v5;
  }

  else
  {
    *(float64x2_t *)&v1.vector.f64[2]  = v4;
  }

  specialized SIMD.hash(into:)(*(__n128 *)v1.vector.f64, *(__n128 *)&v1.vector.f64[2]);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance simd_quatd()
{
  simd_quatd v1 = *v0;
  if ((*(void *)&v0->vector.f64[0] & 0x8000000000000000LL) != 0)
  {
    v3[0]  = *(float64x2_t *)v0->vector.f64;
    v3[1]  = *(float64x2_t *)&v1.vector.f64[2];
    simd_negate(v1, v3, v2);
    *(float64x2_t *)v1.vector.f64  = v2[0];
    *(float64x2_t *)&v1.vector.f64[2]  = v2[1];
  }

  specialized SIMD.hash(into:)(*(__n128 *)v1.vector.f64, *(__n128 *)&v1.vector.f64[2]);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance simd_quatd()
{
  float64x2_t v3 = *v0;
  float64x2_t v4 = v0[1];
  Hasher.init(_seed:)();
  *(float64x2_t *)v1.vector.f64  = v3;
  if ((*(void *)&v3.f64[0] & 0x8000000000000000LL) != 0)
  {
    v6[0]  = v3;
    *(float64x2_t *)v1.vector.f64  = v4;
    v6[1]  = v4;
    simd_negate(v1, v6, (float64x2_t *)&v5);
    simd_quatd v1 = v5;
  }

  else
  {
    *(float64x2_t *)&v1.vector.f64[2]  = v4;
  }

  specialized SIMD.hash(into:)(*(__n128 *)v1.vector.f64, *(__n128 *)&v1.vector.f64[2]);
  return Hasher._finalize()();
}

double static simd_quatd.+ infix(_:_:)(float64x2_t a1, double a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(a1, a3);
  return result;
}

float64x2_t static simd_quatd.+= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = vaddq_f64(a3, a1[1]);
  float64x2_t result = vaddq_f64(a2, *a1);
  *a1  = result;
  a1[1]  = v3;
  return result;
}

double static simd_quatd.- infix(_:_:)(float64x2_t a1, double a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(a1, a3);
  return result;
}

float64x2_t static simd_quatd.-= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = vsubq_f64(a1[1], a3);
  float64x2_t result = vsubq_f64(*a1, a2);
  *a1  = result;
  a1[1]  = v3;
  return result;
}

double static simd_quatd.- prefix(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64((float64x2_t)0, a1);
  return result;
}

double static simd_quatd.* infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64( vmlaq_n_f64( vmulq_laneq_f64(a3, a2, 1),  (float64x2_t)vextq_s8((int8x16_t)vnegq_f64(a3), (int8x16_t)a3, 8uLL),  a2.f64[0]),  vmlaq_n_f64( vmulq_laneq_f64(a4, a1, 1),  (float64x2_t)vextq_s8((int8x16_t)a4, (int8x16_t)vnegq_f64(a4), 8uLL),  a1.f64[0]));
  return result;
}

double static simd_quatd.* infix(_:_:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, a1);
  return result;
}

double static simd_quatd.* infix(_:_:)(float64x2_t a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, a3);
  return result;
}

float64x2_t static simd_quatd.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2, int8x16_t a3)
{
  float64x2_t v3 = a1[1];
  float64x2_t v4 = vnegq_f64(a2);
  float64x2_t v5 = (float64x2_t)vextq_s8(a3, (int8x16_t)vnegq_f64((float64x2_t)a3), 8uLL);
  float64x2_t v6 = vmlaq_n_f64(vmulq_laneq_f64(v4, *a1, 1), (float64x2_t)vextq_s8((int8x16_t)a2, (int8x16_t)v4, 8uLL), a1->f64[0]);
  float64x2_t result = vaddq_f64( vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)a3, *a1, 1), v5, a1->f64[0]),  vmlaq_n_f64( vmulq_laneq_f64(a2, v3, 1),  (float64x2_t)vextq_s8((int8x16_t)v4, (int8x16_t)a2, 8uLL),  v3.f64[0]));
  *a1  = result;
  a1[1]  = vaddq_f64(v6, vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)a3, v3, 1), v5, v3.f64[0]));
  return result;
}

float64x2_t static simd_quatd.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(a1[1], a2);
  float64x2_t result = vmulq_n_f64(*a1, a2);
  *a1  = result;
  a1[1]  = v2;
  return result;
}

double static simd_quatd./ infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4 = vnegq_f64(a3);
  double v5 = 1.0 / vaddvq_f64(vaddq_f64(vmulq_f64(a3, a3), vmulq_f64(a4, a4)));
  float64x2_t v6 = vmulq_n_f64(vmulq_f64(a4, (float64x2_t)xmmword_186F1EDC0), v5);
  float64x2_t v7 = vmulq_n_f64(v4, v5);
  *(void *)&double result = *(_OWORD *)&vaddq_f64( vmlaq_n_f64( vmulq_laneq_f64(v7, a2, 1),  (float64x2_t)vextq_s8((int8x16_t)vnegq_f64(v7), (int8x16_t)v7, 8uLL),  a2.f64[0]),  vmlaq_n_f64( vmulq_laneq_f64(v6, a1, 1),  (float64x2_t)vextq_s8((int8x16_t)v6, (int8x16_t)vnegq_f64(v6), 8uLL),  a1.f64[0]));
  return result;
}

double static simd_quatd./ infix(_:_:)(float64x2_t a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vdivq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  return result;
}

float64x2_t static simd_quatd./= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = a1[1];
  float64x2_t v4 = vnegq_f64(a2);
  double v5 = 1.0 / vaddvq_f64(vaddq_f64(vmulq_f64(a2, a2), vmulq_f64(a3, a3)));
  float64x2_t v6 = vmulq_n_f64(vmulq_f64(a3, (float64x2_t)xmmword_186F1EDC0), v5);
  float64x2_t v7 = vmulq_n_f64(v4, v5);
  float64x2_t v8 = vnegq_f64(v7);
  float64x2_t v9 = (float64x2_t)vextq_s8((int8x16_t)v6, (int8x16_t)vnegq_f64(v6), 8uLL);
  float64x2_t v10 = vmlaq_n_f64(vmulq_laneq_f64(v8, *a1, 1), (float64x2_t)vextq_s8((int8x16_t)v7, (int8x16_t)v8, 8uLL), a1->f64[0]);
  float64x2_t result = vaddq_f64( vmlaq_n_f64(vmulq_laneq_f64(v6, *a1, 1), v9, a1->f64[0]),  vmlaq_n_f64( vmulq_laneq_f64(v7, v3, 1),  (float64x2_t)vextq_s8((int8x16_t)v8, (int8x16_t)v7, 8uLL),  v3.f64[0]));
  *a1  = result;
  a1[1]  = vaddq_f64(v10, vmlaq_n_f64(vmulq_laneq_f64(v6, v3, 1), v9, v3.f64[0]));
  return result;
}

float64x2_t static simd_quatd./= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0);
  float64x2_t v3 = vdivq_f64(a1[1], v2);
  float64x2_t result = vdivq_f64(*a1, v2);
  *a1  = result;
  a1[1]  = v3;
  return result;
}

Swift::Double __swiftcall dot(_:_:)(simd_quatd *a1, simd_quatd *a2)
{
  return vaddvq_f64(vaddq_f64(vmulq_f64(v2, v4), vmulq_f64(v3, v5)));
}

void __swiftcall log(_:)(simd_quatd *__return_ptr retstr, simd_quatd *a2)
{
  float64x2_t v4 = *(float64x2_t *)v2.vector.f64;
  __int128 v5 = *(_OWORD *)&v2.vector.f64[2];
  __tg_log(v2, &v4, &v3);
}

void __swiftcall exp(_:)(simd_quatd *__return_ptr retstr, simd_quatd *a2)
{
  float64x2_t v4 = *(float64x2_t *)v2.vector.f64;
  __int128 v5 = *(_OWORD *)&v2.vector.f64[2];
  __tg_exp(v2, &v4, &v3);
}

void specialized SIMD.hash(into:)(__n128 a1, __n128 a2)
{
  unint64_t v6 = a1.n128_u64[1];
  if ((a1.n128_u64[0] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v2 = a1.n128_u64[0];
  }
  else {
    Swift::UInt64 v2 = 0LL;
  }
  Hasher._combine(_:)(v2);
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v3 = v6;
  }
  else {
    Swift::UInt64 v3 = 0LL;
  }
  Hasher._combine(_:)(v3);
  if ((a2.n128_u64[0] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v4 = a2.n128_u64[0];
  }
  else {
    Swift::UInt64 v4 = 0LL;
  }
  Hasher._combine(_:)(v4);
  if ((a2.n128_u64[1] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v5 = a2.n128_u64[1];
  }
  else {
    Swift::UInt64 v5 = 0LL;
  }
  Hasher._combine(_:)(v5);
}

void specialized SIMD.hash(into:)(__n128 a1)
{
  if ((a1.n128_u32[0] & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v1 = a1.n128_u32[0];
  }
  else {
    Swift::UInt32 v1 = 0;
  }
  Hasher._combine(_:)(v1);
  if ((a1.n128_u32[1] & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v2 = a1.n128_u32[1];
  }
  else {
    Swift::UInt32 v2 = 0;
  }
  Hasher._combine(_:)(v2);
  if ((a1.n128_u32[2] & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v3 = a1.n128_u32[2];
  }
  else {
    Swift::UInt32 v3 = 0;
  }
  Hasher._combine(_:)(v3);
  if ((a1.n128_u32[3] & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v4 = a1.n128_u32[3];
  }
  else {
    Swift::UInt32 v4 = 0;
  }
  Hasher._combine(_:)(v4);
}

__n128 __tg_log(float32x4_t a1)
{
  int8x16_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  float v2 = vaddv_f32(vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL)));
  uint32x4_t v3 = (uint32x4_t)vceqzq_f32(a1);
  v3.i32[3]  = v3.i32[2];
  if ((vminvq_u32(v3) & 0x80000000) != 0)
  {
    float32x4_t v8 = 0uLL;
  }

  else
  {
    int32x4_t v10 = (int32x4_t)v1;
    float v4 = acosf(a1.f32[3] / sqrtf(v2));
    float32x2_t v5 = vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v10, 2),  vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v10.i8, 1)));
    float32x2_t v6 = vrsqrte_f32(v5);
    float32x2_t v7 = vmul_f32(v6, vrsqrts_f32(v5, vmul_f32(v6, v6)));
    float32x4_t v8 = vmulq_n_f32(vmulq_n_f32(a1, vmul_f32(v7, vrsqrts_f32(v5, vmul_f32(v7, v7))).f32[0]), v4);
  }

  float32x4_t v12 = v8;
  logf(v2);
  return (__n128)v12;
}

double __tg_exp(float32x4_t a1)
{
  float32x4_t v2 = vmulq_f32(a1, a1);
  float32x2_t v3 = (float32x2_t)vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2),  vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))).u64[0];
  float v4 = sqrtf(v3.f32[0]);
  if (v4 == 0.0)
  {
    expf(a1.f32[3]);
    return 0.0;
  }

  else
  {
    float32x2_t v6 = vrsqrte_f32(v3);
    float32x2_t v7 = vmul_f32(v6, vrsqrts_f32(v3, vmul_f32(v6, v6)));
    float32x4_t v10 = vmulq_n_f32(a1, vmul_f32(v7, vrsqrts_f32(v3, vmul_f32(v7, v7))).f32[0]);
    float v11 = a1.f32[3];
    __float2 v8 = __sincosf_stret(v4);
    float32x4_t v9 = vmulq_n_f32(v10, v8.__sinval);
    v9.i32[3]  = LODWORD(v8.__cosval);
    *(void *)&double result = vmulq_n_f32(v9, expf(v11)).u64[0];
  }

  return result;
}

_OWORD *simd_make_double4@<X0>(_OWORD *result@<X0>, _OWORD *a2@<X8>, double a3@<D0>)
{
  __int128 v3 = result[1];
  *((double *)&v3 + 1)  = a3;
  *a2  = *result;
  a2[1]  = v3;
  return result;
}

float64x2_t *simd_quaternion@<X0>(float64x2_t *result@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v3 = *result;
  float64x2_t v4 = result[1];
  float64x2_t v6 = *a2;
  float64x2_t v5 = a2[1];
  if (vmulq_f64(v4, v5).f64[0] + vaddvq_f64(vmulq_f64(*result, *a2)) >= 0.0)
  {
    float64x2_t v40 = vaddq_f64(v3, v6);
    v41  = vaddq_f64(v4, v5);
    float64x2_t v42 = vmulq_f64(v41, v41);
    v42.f64[0]  = 1.0 / sqrt(v42.f64[0] + vaddvq_f64(vmulq_f64(v40, v40)));
    float64x2_t v43 = vmulq_n_f64(v40, v42.f64[0]);
    float64x2_t v44 = vmulq_f64(v41, v42);
    v42.f64[0]  = result[1].f64[0];
    v42.f64[1]  = result->f64[0];
    *(void *)&v39.f64[0]  = *(_OWORD *)&vmlaq_laneq_f64(vmulq_laneq_f64(vnegq_f64(v4), v43, 1), v44, v3, 1);
    double v45 = vmulq_f64(v4, v44).f64[0];
    v44.f64[1]  = v43.f64[0];
    int64x2_t v46 = (int64x2_t)vmlaq_f64(vmulq_f64(v44, vnegq_f64(v3)), v43, v42);
    *(void *)&v39.f64[1]  = v46.i64[0];
    double v47 = v45 + vaddvq_f64(vmulq_f64(v3, v43));
    *(void *)&v38.f64[0]  = vdupq_laneq_s64(v46, 1).u64[0];
    v38.f64[1]  = v47;
  }

  else
  {
    float64x2_t v7 = (float64x2_t)vextq_s8((int8x16_t)v3, (int8x16_t)v3, 8uLL);
    float64x2_t v8 = vmulq_f64(v3, v3);
    v8.f64[0]  = 1.0 / sqrt(vmulq_f64(v4, v4).f64[0] + vaddvq_f64(v8));
    float64x2_t v9 = vmulq_n_f64(v3, v8.f64[0]);
    float64x2_t v10 = vmulq_f64(v5, v5);
    v10.f64[0]  = 1.0 / sqrt(v10.f64[0] + vaddvq_f64(vmulq_f64(v6, v6)));
    float64x2_t v11 = vaddq_f64(vmulq_f64(v4, v8), vmulq_f64(v5, v10));
    float64x2_t v12 = vaddq_f64(v9, vmulq_n_f64(v6, v10.f64[0]));
    float64x2_t v13 = vmulq_f64(v11, v11);
    v13.f64[0]  = v13.f64[0] + vaddvq_f64(vmulq_f64(v12, v12));
    if (v13.f64[0] <= 4.93038066e-32)
    {
      v48.f64[0]  = result->f64[0];
      v48.f64[1]  = v7.f64[0];
      float64x2_t v49 = vabsq_f64(v48);
      float64x2_t v50 = vabsq_f64(v4);
      double v51 = v49.f64[1];
      if (v49.f64[0] > v49.f64[1] || v49.f64[0] > v50.f64[0])
      {
        v58.f64[0]  = result[1].f64[0];
        v58.f64[1]  = result->f64[0];
        unint64_t v59 = vextq_s8((int8x16_t)v58, (int8x16_t)v58, 8uLL).u64[0];
        if (v51 <= v50.f64[0])
        {
          v3.f64[1]  = v7.f64[0];
          float64x2_t v60 = vnegq_f64(v4);
          *(void *)&v58.f64[1]  = v59;
          float64x2_t v38 = vmlaq_f64( vmulq_f64(v3, (float64x2_t)vdupq_n_s64(0x8000000000000000LL)),  (float64x2_t)xmmword_186F1EDD0,  v58);
          _Q3  = 0uLL;
        }

        else
        {
          v50.f64[0]  = -0.0;
          v3.f64[1]  = v7.f64[0];
          float64x2_t v60 = vmulq_f64(v4, v50);
          *(void *)&v58.f64[1]  = v59;
          float64x2_t v38 = vmlaq_f64(vmulq_f64(v3, (float64x2_t)xmmword_186F1EDE0), (float64x2_t)0, v58);
          __asm { FMOV            V3.2D, #1.0 }
        }

        float64x2_t v66 = vmlaq_f64(v60, _Q3, v7);
        float64x2_t v67 = vmulq_f64(v38, v38);
        float64x2_t v68 = vmulq_f64(v66, v66);
        v66.f64[1]  = v38.f64[0];
        v68.f64[0]  = 1.0 / sqrt(v67.f64[1] + v68.f64[0] + v67.f64[0]);
        float64x2_t v39 = vmulq_n_f64(v66, v68.f64[0]);
        *(void *)&v38.f64[0]  = *(_OWORD *)&vmulq_laneq_f64(v68, v38, 1);
      }

      else
      {
        v52.f64[0]  = result[1].f64[0];
        v52.f64[1]  = result->f64[0];
        v6.f64[0]  = -0.0;
        float64x2_t v53 = vmulq_f64(v4, v6);
        v54.f64[0]  = result->f64[0];
        v54.f64[1]  = v7.f64[0];
        float64x2_t v55 = vmlaq_f64(vmulq_f64(v54, (float64x2_t)xmmword_186F1EDF0), (float64x2_t)xmmword_186F1EE00, v52);
        float64x2_t v56 = vmlaq_laneq_f64(v53, (float64x2_t)0, v3, 1);
        float64x2_t v38 = vmulq_f64(v55, v55);
        v57  = vmulq_f64(v56, v56).f64[0];
        v56.f64[1]  = v55.f64[0];
        v38.f64[0]  = 1.0 / sqrt(v38.f64[1] + v57 + v38.f64[0]);
        float64x2_t v39 = vmulq_n_f64(v56, v38.f64[0]);
        *(void *)&v38.f64[0]  = *(_OWORD *)&vmulq_laneq_f64(v38, v55, 1);
      }

      v38.f64[1]  = 0.0;
    }

    else
    {
      v13.f64[0]  = 1.0 / sqrt(v13.f64[0]);
      float64x2_t v14 = vmulq_f64(v11, v13);
      *(void *)&v12.f64[1]  = vextq_s8((int8x16_t)v12, (int8x16_t)v12, 8uLL).u64[0];
      float64x2_t v15 = vmulq_n_f64(v12, v13.f64[0]);
      float64x2_t v16 = vaddq_f64(v3, v15);
      float64x2_t v17 = vaddq_f64(v4, v14);
      float64x2_t v18 = vmulq_f64(v17, v17);
      v18.f64[0]  = 1.0 / sqrt(v18.f64[0] + vaddvq_f64(vmulq_f64(v16, v16)));
      float64x2_t v19 = vmulq_n_f64(v16, v18.f64[0]);
      float64x2_t v20 = vmulq_f64(v17, v18);
      v18.f64[0]  = result[1].f64[0];
      v18.f64[1]  = result->f64[0];
      *(void *)&double v21 = *(_OWORD *)&vmlaq_laneq_f64(vmulq_laneq_f64(vnegq_f64(v4), v19, 1), v20, v3, 1);
      double v22 = vmulq_f64(v4, v20).f64[0];
      v20.f64[1]  = v19.f64[0];
      v23.f64[0]  = result->f64[0];
      v23.f64[1]  = v7.f64[0];
      float64x2_t v24 = vmlaq_f64(vmulq_f64(v20, vnegq_f64(v23)), v19, v18);
      double v25 = v22 + vaddvq_f64(vmulq_f64(v3, v19));
      float64x2_t v26 = vaddq_f64(v6, v15);
      float64x2_t v27 = vaddq_f64(v5, v14);
      float64x2_t v28 = vmulq_f64(v27, v27);
      v28.f64[0]  = 1.0 / sqrt(v28.f64[0] + vaddvq_f64(vmulq_f64(v26, v26)));
      v29  = vmulq_n_f64(v26, v28.f64[0]);
      float64x2_t v30 = vmulq_f64(v27, v28);
      float64x2_t v31 = vnegq_f64(v14);
      double v32 = vmulq_f64(v14, v30).f64[0];
      v14.f64[1]  = v15.f64[0];
      int8x16_t v33 = (int8x16_t)vmlaq_laneq_f64(vmulq_laneq_f64(v31, v29, 1), v30, v15, 1);
      v30.f64[1]  = v29.f64[0];
      int64x2_t v34 = (int64x2_t)vmlaq_f64(vmulq_f64(v30, vnegq_f64(v15)), v29, v14);
      *(void *)&v14.f64[0]  = v33.i64[0];
      *(void *)&v14.f64[1]  = v34.i64[0];
      v29.f64[0]  = vaddvq_f64(vmulq_f64(v15, v29));
      *(void *)&v15.f64[0]  = vdupq_laneq_s64(v34, 1).u64[0];
      v15.f64[1]  = v32 + v29.f64[0];
      float64x2_t v35 = vnegq_f64(v14);
      v36  = (float64x2_t)vextq_s8((int8x16_t)v15, (int8x16_t)vnegq_f64(v15), 8uLL);
      v37  = vmlaq_laneq_f64(vmulq_n_f64(v14, v25), (float64x2_t)vextq_s8((int8x16_t)v35, v33, 8uLL), v24, 1);
      float64x2_t v38 = vaddq_f64( vmlaq_n_f64(vmulq_n_f64(v35, v24.f64[0]), (float64x2_t)vzip1q_s64(v34, (int64x2_t)v35), v21),  vmlaq_laneq_f64(vmulq_n_f64(v15, v25), v36, v24, 1));
      float64x2_t v39 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v15, v24.f64[0]), v36, v21), v37);
    }
  }

  *a3  = v39;
  a3[1]  = v38;
  return result;
}

__n128 simd_quaternion@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int64x2_t v3 = *(int64x2_t *)a1;
  __n128 result = *(__n128 *)(a1 + 16);
  float64x2_t v4 = *(float64x2_t *)(a1 + 32);
  float64x2_t v5 = *(float64x2_t *)(a1 + 48);
  double v6 = *(double *)(a1 + 40);
  int64x2_t v7 = *(int64x2_t *)(a1 + 64);
  __int128 v8 = *(_OWORD *)(a1 + 80);
  double v9 = *(double *)a1 + v6 + *(double *)&v8;
  if (v9 >= 0.0)
  {
    double v27 = sqrt(v9 + 1.0);
    double v28 = v27 + v27;
    v29  = 1.0 / (v27 + v27);
    *(double *)&__int128 v33 = v29 * vsubq_f64(v5, (float64x2_t)vdupq_laneq_s64(v7, 1)).f64[0];
    double v34 = (*(double *)v7.i64 - result.n128_f64[0]) * v29;
    result.n128_f64[0]  = v29 * vsubq_f64((float64x2_t)vdupq_laneq_s64(v3, 1), v4).f64[0];
    double v35 = v28 * 0.25;
  }

  else if (*(double *)v3.i64 < v6 || *(double *)v3.i64 < *(double *)&v8)
  {
    double v11 = 1.0 - *(double *)v3.i64;
    BOOL v12 = v6 < *(double *)&v8;
    double v13 = sqrt(1.0 - *(double *)v3.i64 - v6 + *(double *)&v8);
    double v14 = v13 + v13;
    double v15 = 1.0 / v14;
    double v16 = (result.n128_f64[0] + *(double *)v7.i64) * (1.0 / v14);
    double v17 = vaddq_f64(v5, (float64x2_t)vdupq_laneq_s64(v7, 1)).f64[0];
    double v18 = 1.0 / v14 * v17;
    float64x2_t v19 = (float64x2_t)vdupq_laneq_s64(v3, 1);
    double v20 = v14 * 0.25;
    double v21 = v15 * vsubq_f64(v19, v4).f64[0];
    double v22 = sqrt(v6 + v11 - *(double *)&v8);
    double v23 = v22 + v22;
    double v24 = 1.0 / v23 * vaddq_f64(v19, v4).f64[0];
    double v25 = v23 * 0.25;
    double v26 = 1.0 / v23 * v17;
    double v35 = (*(double *)v7.i64 - result.n128_f64[0]) * (1.0 / v23);
    if (v12) {
      *(double *)&__int128 v33 = v16;
    }
    else {
      *(double *)&__int128 v33 = v24;
    }
    if (v12) {
      double v34 = v18;
    }
    else {
      double v34 = v25;
    }
    if (v12) {
      result.n128_f64[0]  = v20;
    }
    else {
      result.n128_f64[0]  = v26;
    }
    if (v12) {
      double v35 = v21;
    }
  }

  else
  {
    double v30 = sqrt(*(double *)v3.i64 + 1.0 - v6 - *(double *)&v8);
    double v31 = v30 + v30;
    double v32 = 1.0 / v31;
    *(double *)&__int128 v33 = v31 * 0.25;
    double v34 = v32 * vaddq_f64((float64x2_t)vdupq_laneq_s64(v3, 1), v4).f64[0];
    result.n128_f64[0]  = (result.n128_f64[0] + *(double *)v7.i64) * v32;
    double v35 = v32 * vsubq_f64(v5, (float64x2_t)vdupq_laneq_s64(v7, 1)).f64[0];
  }

  *((double *)&v33 + 1)  = v34;
  result.n128_f64[1]  = v35;
  *(_OWORD *)a2  = v33;
  *(__n128 *)(a2 + 16)  = result;
  return result;
}

__n128 simd_make_double3@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  __int128 v3 = *(_OWORD *)(a1 + 16);
  *a2  = *(_OWORD *)a1;
  a2[1]  = v3;
  return result;
}

double simd_matrix3x3@<D0>(simd_quatd a1@<0:Q0, 16:Q1>, uint64_t a2@<X0>, _OWORD *a3@<X8>)
{
  *(_OWORD *)&v12.vector.f64[2]  = *(_OWORD *)(a2 + 16);
  v8[0]  = *(float64x2_t *)a2;
  *(float64x2_t *)v12.vector.f64  = v8[0];
  v8[1]  = *(float64x2_t *)&v12.vector.f64[2];
  simd_matrix4x4(v12, v8, (uint64_t)v9);
  __int128 v4 = v9[1];
  *a3  = v9[0];
  a3[1]  = v4;
  __int128 v5 = v9[3];
  a3[2]  = v9[2];
  a3[3]  = v5;
  double result = *(double *)&v10;
  __int128 v7 = v11;
  a3[4]  = v10;
  a3[5]  = v7;
  return result;
}

double simd_matrix4x4@<D0>(simd_quatd a1@<0:Q0, 16:Q1>, float64x2_t *a2@<X0>, uint64_t a3@<X8>)
{
  _Q1  = *a2;
  _Q0  = a2[1];
  _D2  = a2->f64[1];
  __asm { FMLS            D3, D0, V0.D[0] }

  _D5  = a2[1].f64[1];
  __asm { FMLA            D3, D5, V0.D[1] }

  double v13 = vmlad_n_f64(vmuld_lane_f64(_Q0.f64[0], _Q0, 1), _D2, a2->f64[0]);
  v14.f64[0]  = vmuld_lane_f64(_D2, _Q0, 1);
  double v15 = vmlad_n_f64(-(_D2 * _D5), _Q0.f64[0], a2->f64[0]);
  *((double *)&_Q3 + 1)  = v13 + v13;
  *(_OWORD *)a3  = _Q3;
  *(_OWORD *)(a3 + 16)  = COERCE_UNSIGNED_INT64(v15 + v15);
  *(double *)&_Q3  = vmlad_n_f64(-(_Q0.f64[0] * _D5), _D2, _Q1.f64[0]);
  *(double *)&_Q3  = *(double *)&_Q3 + *(double *)&_Q3;
  __asm
  {
    FMLA            D4, D2, V1.D[1]
    FMLA            D4, D5, V0.D[1]
    FMLS            D4, D1, V1.D[0]
    FMLA            D6, D0, V1.D[1]
  }

  *((void *)&_Q3 + 1)  = _D4;
  *(double *)&unint64_t v20 = _D6 + _D6;
  float64_t v21 = -(_Q1.f64[0] * _D5);
  float64x2_t v22 = (float64x2_t)vzip1q_s64((int64x2_t)_Q1, (int64x2_t)_Q0);
  __asm
  {
    FMLS            D5, D1, V1.D[0]
    FMLS            D5, D2, V1.D[1]
  }

  _Q1.f64[0]  = _Q0.f64[0];
  v14.f64[1]  = v21;
  *(_OWORD *)(a3 + 32)  = _Q3;
  *(_OWORD *)(a3 + 48)  = v20;
  float64x2_t v25 = vmlaq_f64(v14, v22, _Q1);
  *(float64x2_t *)(a3 + 64)  = vaddq_f64(v25, v25);
  *(_OWORD *)(a3 + 80)  = _D5;
  *(void *)(a3 + 96)  = 0LL;
  *(void *)(a3 + 104)  = 0LL;
  double result = 0.0;
  *(_OWORD *)(a3 + 112)  = xmmword_186F1EDD0;
  return result;
}

uint64_t lazy protocol witness table accessor for type SIMD3<Float> and conformance SIMD3<A>( unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = MEMORY[0x18959D910](MEMORY[0x18961A558], v4);
    atomic_store(result, a1);
  }

  return result;
}

float64x2_t simd_negate@<Q0>(simd_quatd a1@<0:Q0, 16:Q1>, float64x2_t *a2@<X0>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vnegq_f64(a2[1]);
  *a3  = vnegq_f64(*a2);
  a3[1]  = result;
  return result;
}

__n128 __tg_log@<Q0>(simd_quatd a1@<0:Q0, 16:Q1>, float64x2_t *a2@<X0>, float64x2_t *a3@<X8>)
{
  float64x2_t v4 = a2[1];
  float64x2_t v5 = vmulq_f64(v4, v4);
  float64x2_t v6 = vmulq_f64(*a2, *a2);
  double v7 = vaddvq_f64(vaddq_f64(v6, v5));
  int64x2_t v8 = vceqzq_f64(*a2);
  if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), vandq_s8((int8x16_t)vceqzq_f64(v4), (int8x16_t)v8)).u64[0] & 0x8000000000000000LL) != 0)
  {
    float64_t v18 = 0.0;
    float64x2_t v20 = 0u;
  }

  else
  {
    float64x2_t v17 = *a2;
    float64x2_t v19 = a2[1];
    float64x2_t v15 = v6;
    double v16 = v5.f64[0];
    v9.f64[0]  = acos(v4.f64[1] / sqrt(v7));
    v10.f64[1]  = v15.f64[1];
    v10.f64[0]  = 1.0 / sqrt(v16 + vaddvq_f64(v15));
    float64x2_t v11 = vmulq_n_f64(v17, v10.f64[0]);
    *(void *)&float64_t v18 = *(_OWORD *)&vmulq_f64(vmulq_f64(v19, v10), v9);
    float64x2_t v20 = vmulq_n_f64(v11, v9.f64[0]);
  }

  double v12 = log(v7);
  v13.f64[0]  = v18;
  v13.f64[1]  = v12 * 0.5;
  __n128 result = (__n128)v20;
  *a3  = v20;
  a3[1]  = v13;
  return result;
}

void __tg_exp(simd_quatd a1@<0:Q0, 16:Q1>, float64x2_t *a2@<X0>, float64x2_t *a3@<X8>)
{
  float64x2_t v4 = *a2;
  float64x2_t v5 = a2[1];
  float64x2_t v6 = vmulq_f64(v4, v4);
  double v7 = sqrt(vmulq_f64(v5, v5).f64[0] + vaddvq_f64(v6));
  if (v7 == 0.0)
  {
    double v8 = exp(v5.f64[1]);
    float64x2_t v9 = 0uLL;
    v10.f64[0]  = 0.0;
    v10.f64[1]  = v8;
  }

  else
  {
    v6.f64[0]  = 1.0 / v7;
    float64x2_t v15 = vmulq_n_f64(v4, 1.0 / v7);
    float64x2_t v16 = vmulq_f64(v5, v6);
    float64x2_t v14 = a2[1];
    __double2 v12 = __sincos_stret(v7);
    v11.f64[0]  = v12.__sinval;
    *(void *)&v11.f64[0]  = *(_OWORD *)&vmulq_f64(v11, v16);
    v11.f64[1]  = v12.__cosval;
    float64x2_t v17 = v11;
    double v13 = exp(v14.f64[1]);
    float64x2_t v9 = vmulq_n_f64(vmulq_n_f64(v15, v12.__sinval), v13);
    float64x2_t v10 = vmulq_n_f64(v17, v13);
  }

  *a3  = v9;
  a3[1]  = v10;
}

uint64_t base witness table accessor for Equatable in simd_quatf()
{
  return lazy protocol witness table accessor for type simd_quatf and conformance simd_quatf( &lazy protocol witness table cache variable for type simd_quatf and conformance simd_quatf,  (uint64_t (*)(uint64_t))type metadata accessor for simd_quatf,  (uint64_t)&protocol conformance descriptor for simd_quatf);
}

uint64_t base witness table accessor for Equatable in simd_quatd()
{
  return lazy protocol witness table accessor for type simd_quatf and conformance simd_quatf( &lazy protocol witness table cache variable for type simd_quatd and conformance simd_quatd,  (uint64_t (*)(uint64_t))type metadata accessor for simd_quatd,  (uint64_t)&protocol conformance descriptor for simd_quatd);
}

uint64_t lazy protocol witness table accessor for type simd_quatf and conformance simd_quatf( unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = MEMORY[0x18959D910](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

float sub_186F1DEAC@<S0>(uint64_t a1@<X0>, float *a2@<X8>)
{
  float result = *(float *)(a1 + 12);
  *a2  = result;
  return result;
}

float sub_186F1DEB8(float *a1, uint64_t a2)
{
  float result = *a1;
  *(float *)(a2 + 12)  = *a1;
  return result;
}

void sub_186F1DEC4(__n128 *a1@<X0>, _OWORD *a2@<X8>)
{
  *(double *)&__int128 v3 = simd_make_float3(*a1);
  *a2  = v3;
}

void sub_186F1DEEC(uint64_t a1, _OWORD *a2)
{
  *a2  = v3;
}

double sub_186F1DF18@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result = *(double *)(a1 + 24);
  *a2  = result;
  return result;
}

double sub_186F1DF24(double *a1, uint64_t a2)
{
  double result = *a1;
  *(double *)(a2 + 24)  = *a1;
  return result;
}

double sub_186F1DF30@<D0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v2 = a1[1];
  v4[0]  = *a1;
  v4[1]  = v2;
  *(void *)&double result = simd_make_double3((uint64_t)v4, a2).n128_u64[0];
  return result;
}

_OWORD *sub_186F1DF58(_OWORD *a1, uint64_t a2)
{
  __int128 v2 = a1[1];
  double v3 = *(double *)(a2 + 24);
  v5[0]  = *a1;
  v5[1]  = v2;
  return simd_make_double4(v5, (_OWORD *)a2, v3);
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x189618530]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x189618600]();
}

uint64_t dispatch thunk of SIMDStorage.scalarCount.getter()
{
  return MEMORY[0x189619148]();
}

uint64_t dispatch thunk of SIMDStorage.init()()
{
  return MEMORY[0x189619150]();
}

uint64_t dispatch thunk of SIMDStorage.subscript.getter()
{
  return MEMORY[0x189619158]();
}

uint64_t dispatch thunk of SIMDStorage.subscript.setter()
{
  return MEMORY[0x189619160]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x189619660]();
}

uint64_t dispatch thunk of FixedWidthInteger.subtractingReportingOverflow(_:)()
{
  return MEMORY[0x189619788]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x189619FC0]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x18961A010]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x18961A310]();
}

uint64_t SIMD.description.getter()
{
  return MEMORY[0x18961A388]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x18961A680]();
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

simd_double2x2 __invert_d2(simd_double2x2 a1)
{
  result.columns[1].f64[1]  = v4;
  result.columns[1].f64[0]  = v3;
  result.columns[0].f64[1]  = v2;
  result.columns[0].f64[0]  = v1;
  return result;
}

uint64_t __invert_d3()
{
  return MEMORY[0x1895F88E8]();
}

uint64_t __invert_d4()
{
  return MEMORY[0x1895F88F0]();
}

simd_float2x2 __invert_f2(simd_float2x2 a1)
{
  result.columns[1]  = v2;
  result.columns[0]  = v1;
  return result;
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  result.columns[2].i64[1]  = v6;
  result.columns[2].i64[0]  = v5;
  result.columns[1].i64[1]  = v4;
  result.columns[1].i64[0]  = v3;
  result.columns[0].i64[1]  = v2;
  result.columns[0].i64[0]  = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  result.columns[3].i64[1]  = v8;
  result.columns[3].i64[0]  = v7;
  result.columns[2].i64[1]  = v6;
  result.columns[2].i64[0]  = v5;
  result.columns[1].i64[1]  = v4;
  result.columns[1].i64[0]  = v3;
  result.columns[0].i64[1]  = v2;
  result.columns[0].i64[0]  = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  result.__cosval  = v2;
  result.__sinval  = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  result.__cosval  = v2;
  result.__sinval  = v1;
  return result;
}

uint64_t __sqrtf16()
{
  return MEMORY[0x1895F89A8]();
}

simd_double2 _simd_acos_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_acos_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_acosh_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_acosh_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_asin_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_asin_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_asinh_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_asinh_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_atan2_d2(simd_double2 y, simd_double2 x)
{
  return result;
}

simd_float4 _simd_atan2_f4(simd_float4 y, simd_float4 x)
{
  return result;
}

simd_double2 _simd_atan_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_atan_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_atanh_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_atanh_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_cbrt_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_cbrt_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_cos_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_cos_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_cosh_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_cosh_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_cospi_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_cospi_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_erf_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_erf_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_erfc_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_erfc_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_exp10_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_exp10_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_exp2_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_exp2_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_exp_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_exp_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_expm1_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_expm1_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_fmod_d2(simd_double2 x, simd_double2 y)
{
  return result;
}

simd_float4 _simd_fmod_f4(simd_float4 x, simd_float4 y)
{
  return result;
}

simd_double2 _simd_hypot_d2(simd_double2 x, simd_double2 y)
{
  return result;
}

simd_float4 _simd_hypot_f4(simd_float4 x, simd_float4 y)
{
  return result;
}

simd_double2 _simd_lgamma_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_lgamma_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_log10_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_log10_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_log1p_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_log1p_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_log2_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_log2_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_log_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_log_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_nextafter_d2(simd_double2 x, simd_double2 y)
{
  return result;
}

simd_float4 _simd_nextafter_f4(simd_float4 x, simd_float4 y)
{
  return result;
}

simd_double2 _simd_pow_d2(simd_double2 x, simd_double2 y)
{
  return result;
}

simd_float4 _simd_pow_f4(simd_float4 x, simd_float4 y)
{
  return result;
}

simd_double2 _simd_remainder_d2(simd_double2 x, simd_double2 y)
{
  return result;
}

simd_float4 _simd_remainder_f4(simd_float4 x, simd_float4 y)
{
  return result;
}

simd_double2 _simd_sin_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_sin_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_sinh_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_sinh_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_sinpi_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_sinpi_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_tan_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_tan_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_tanh_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_tanh_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_tanpi_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_tanpi_f4(simd_float4 x)
{
  return result;
}

simd_double2 _simd_tgamma_d2(simd_double2 x)
{
  return result;
}

simd_float4 _simd_tgamma_f4(simd_float4 x)
{
  return result;
}

double acos(double a1)
{
  return result;
}

float acosf(float a1)
{
  return result;
}

double atan2(double a1, double a2)
{
  return result;
}

float atan2f(float a1, float a2)
{
  return result;
}

double exp(double a1)
{
  return result;
}

float expf(float a1)
{
  return result;
}

void free(void *a1)
{
}

double log(double a1)
{
  return result;
}

float logf(float a1)
{
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
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
ValueMetadata *_s13ASN1BitStringVMa()
{
  return &_s13ASN1BitStringVN;
}

Swift::Int sub_231EE0()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_231F24()
{
}

Swift::Int sub_231F4C()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_231F8C()
{
  v0._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt8,  &protocol witness table for UInt8);
  object = v0._object;
  String.append(_:)(v0);
  swift_bridgeObjectRelease(object);
  v2._countAndFlagsBits = 41LL;
  v2._object = (void *)0xE100000000000000LL;
  String.append(_:)(v2);
  return 0x6E656449314E5341LL;
}

uint64_t sub_232034()
{
  return sub_231F8C();
}

unint64_t sub_232040()
{
  unint64_t result = qword_3A8BD0;
  if (!qword_3A8BD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_281598, &_s14ASN1IdentifierVN);
    atomic_store(result, (unint64_t *)&qword_3A8BD0);
  }

  return result;
}

ValueMetadata *_s14ASN1IdentifierVMa()
{
  return &_s14ASN1IdentifierVN;
}

char *sub_232094(char *result, char *a2)
{
  int64_t v5 = a2 - result;
  if (result) {
    int64_t v6 = a2 - result;
  }
  else {
    int64_t v6 = 0LL;
  }
  v7 = (char *)*v2;
  int64_t v8 = *(void *)(*v2 + 16LL);
  int64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  v3 = a2;
  v4 = result;
  unint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native(*v2);
  if (!(_DWORD)result || (int64_t v10 = *((void *)v7 + 3) >> 1, v10 < v9))
  {
    if (v8 <= v9) {
      int64_t v11 = v8 + v6;
    }
    else {
      int64_t v11 = v8;
    }
    unint64_t result = sub_2121E4(result, v11, 1, v7);
    v7 = result;
    int64_t v10 = *((void *)result + 3) >> 1;
  }

  uint64_t v12 = *((void *)v7 + 2);
  int64_t v13 = v10 - v12;
  int64_t v14 = 0LL;
  if (v4 && v3 && v4 < v3 && v10 != v12)
  {
    if (v5 >= v13) {
      int64_t v14 = v10 - v12;
    }
    else {
      int64_t v14 = v5;
    }
    if (v14 < 0)
    {
      __break(1u);
      return result;
    }

    unint64_t result = (char *)memmove(&v7[v12 + 32], v4, v14);
    v4 += v14;
  }

  if (v14 < v6) {
    goto LABEL_27;
  }
  if (v14)
  {
    uint64_t v15 = *((void *)v7 + 2);
    BOOL v16 = __OFADD__(v15, v14);
    int64_t v17 = v15 + v14;
    if (v16)
    {
      __break(1u);
      goto LABEL_33;
    }

    *((void *)v7 + 2) = v17;
  }

  if (v14 != v13) {
    goto LABEL_25;
  }
LABEL_28:
  int64_t v17 = *((void *)v7 + 2);
  if (!v4)
  {
LABEL_33:
    if (!v3) {
      goto LABEL_25;
    }
    v4 = 0LL;
    goto LABEL_35;
  }

  if (!v3 || v4 != v3)
  {
LABEL_35:
    char v20 = *v4;
    v18 = v4 + 1;
    char v19 = v20;
    while (1)
    {
      while (1)
      {
        unint64_t v21 = *((void *)v7 + 3);
        int64_t v22 = v21 >> 1;
        uint64_t v23 = v17 + 1;
        v26 = v7;
        int64_t v27 = v17;
        unint64_t result = sub_2121E4((char *)(v21 > 1), v17 + 1, 1, v26);
        int64_t v17 = v27;
        v7 = result;
        int64_t v22 = *((void *)result + 3) >> 1;
        if (v17 < v22) {
          goto LABEL_39;
        }
LABEL_36:
        *((void *)v7 + 2) = v17;
      }

      if (v17 >= v22) {
        goto LABEL_36;
      }
LABEL_39:
      v7[v17 + 32] = v19;
      if (v3 && v3 == v18)
      {
LABEL_49:
        *((void *)v7 + 2) = v23;
        break;
      }

      uint64_t v24 = 0LL;
      while (1)
      {
        uint64_t v25 = (uint64_t)&v18[v24 + 1];
        char v19 = v18[v24];
        if (~v17 + v22 == v24) {
          break;
        }
        v7[v17 + 33 + v24++] = v19;
        if (v3 && (char *)v25 == v3)
        {
          uint64_t v23 = v17 + v24 + 1;
          goto LABEL_49;
        }
      }

      v18 += v24 + 1;
      int64_t v17 = v22;
      *((void *)v7 + 2) = v22;
    }
  }

char *sub_232298(char *result, unint64_t a2, unint64_t a3)
{
  int64_t v5 = (char *)((71 - __clz(a3)) >> 3);
  if (v5 < result)
  {
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v6 = a2;
  if ((unint64_t)v5 < a2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  int64_t v7 = (int64_t)result;
  int64_t v8 = &result[-a2];
  v3 = *v4;
  int64_t v9 = *((void *)*v4 + 2);
  int64_t v10 = &result[v9 - a2];
  if (__OFADD__(v9, &result[-a2]))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  unint64_t v11 = a3;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v4);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (uint64_t v13 = *((void *)v3 + 3) >> 1, v13 < (uint64_t)v10))
  {
    else {
      int64_t v14 = v9;
    }
    v3 = sub_2121E4(isUniquelyReferenced_nonNull_native, v14, 1, v3);
    uint64_t v13 = *((void *)v3 + 3) >> 1;
  }

  uint64_t v15 = *((void *)v3 + 2);
  BOOL v16 = (char *)(v13 - v15);
  unint64_t result = (char *)sub_232638(&v46, &v3[v15 + 32], v13 - v15, v7, v6, v11);
  if ((uint64_t)result >= 1)
  {
    uint64_t v17 = *((void *)v3 + 2);
    BOOL v18 = __OFADD__(v17, result);
    int64_t v5 = &result[v17];
    if (v18)
    {
      __break(1u);
LABEL_41:
      uint64_t v31 = v11 - v6 + 1;
      goto LABEL_42;
    }

    *((void *)v3 + 2) = v5;
  }

  if (result != v16)
  {
LABEL_15:
    char *v4 = v3;
    return result;
  }

uint64_t sub_232584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return swift_unknownObjectRelease(a2);
}

unint64_t sub_2325F4()
{
  unint64_t result = qword_3A8BD8;
  if (!qword_3A8BD8)
  {
    unint64_t result = swift_getWitnessTable(&unk_281638, &_s15ASN1OctetStringVN);
    atomic_store(result, (unint64_t *)&qword_3A8BD8);
  }

  return result;
}

int64_t *sub_232638( int64_t *result, _BYTE *a2, int64_t a3, int64_t a4, uint64_t a5, unint64_t a6)
{
  if (a2)
  {
    if (!a3) {
      goto LABEL_7;
    }
    if (a3 < 0) {
      goto LABEL_36;
    }
    if (__OFSUB__(a4, a5))
    {
LABEL_37:
      __break(1u);
      return result;
    }

    if (a4 != a5)
    {
      if (a4 <= a5) {
        goto LABEL_33;
      }
      uint64_t v7 = 0LL;
      int64_t v8 = (71 - __clz(a6)) >> 3;
      char v9 = 8 - 8 * a4;
      uint64_t v10 = 8 * a4 - 8;
      while (1)
      {
        if ((unint64_t)(a4 - 0x1000000000000001LL + v7) >> 61 != 7)
        {
          __break(1u);
LABEL_33:
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }

        if (v10 < -64)
        {
LABEL_13:
          LOBYTE(v11) = 0;
          if (v8 < a4) {
            goto LABEL_34;
          }
          goto LABEL_22;
        }

        if (v10 > 64) {
          break;
        }
        if (v10 < 0)
        {
          unint64_t v11 = a6 << (v9 & 0x38);
        }

        else
        {
          unint64_t v11 = a6 >> (v10 & 0x38);
        }

        if (v8 < a4) {
          goto LABEL_34;
        }
LABEL_22:
        if (a4 + v7 < 1) {
          goto LABEL_34;
        }
        *a2 = v11;
        if (!(a3 - 1 + v7))
        {
          uint64_t v6 = a4 + v7 - 1;
          goto LABEL_8;
        }

        if (__OFSUB__(a4 + v7 - 1, a5)) {
          goto LABEL_35;
        }
        if (!(a4 - a5 - 1 + v7))
        {
          uint64_t v6 = a5;
          a3 = a4 - a5;
          goto LABEL_8;
        }

        ++a2;
        --v7;
        v9 += 8;
        v10 -= 8LL;
        if (a4 + v7 <= a5) {
          goto LABEL_33;
        }
      }

      LOBYTE(v11) = 0;
      if (v8 < a4) {
        goto LABEL_34;
      }
      goto LABEL_22;
    }
  }

  a3 = 0LL;
LABEL_7:
  uint64_t v6 = a4;
LABEL_8:
  *unint64_t result = a4;
  result[1] = a5;
  result[2] = a6;
  result[3] = v6;
  return (int64_t *)a3;
}

uint64_t (*sub_232798@<X0>( _BYTE *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, _BYTE *a6@<X8>))()
{
  if (a3 < a2 || a4 >= a2)
  {
    __break(1u);
    goto LABEL_13;
  }

  int64_t v6 = (unint64_t)(a2 - 0x1000000000000001LL) >> 61;
  if (v6 != 7)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  a6 = a1;
  char v7 = 8 * a2;
  int64_t v6 = 8 * a2 - 8;
  if (v6 < -64)
  {
    LOBYTE(v8) = 0;
    goto LABEL_11;
  }

  if (v6 > 64)
  {
LABEL_7:
    LOBYTE(v8) = 0;
    goto LABEL_11;
  }

  if ((v6 & 0x8000000000000000LL) == 0)
  {
    if ((unint64_t)v6 < 0x40)
    {
      unint64_t v8 = a5 >> (v6 & 0x38);
      goto LABEL_11;
    }

    goto LABEL_7;
  }

unint64_t sub_232834@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, int64_t a5@<X8>)
{
  if (a2 < a1 || a3 >= a1)
  {
    __break(1u);
    goto LABEL_12;
  }

  a5 = (unint64_t)(a1 - 0x1000000000000001LL) >> 61;
  if (a5 != 7)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    uint64_t v7 = a4 << ((8 - v5) & 0x38);
    else {
      return v7;
    }
  }

  char v5 = 8 * a1;
  a5 = 8 * a1 - 8;
  if (a5 < -64) {
    return 0LL;
  }
  if (a5 > 64) {
    return 0LL;
  }
  if (a5 < 0) {
    goto LABEL_13;
  }
  return a4 >> (a5 & 0x38);
}

void sub_2328BC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v7 = *v4;
  int64_t v8 = *((void *)*v4 + 2);
  int64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v4);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > *((void *)v7 + 3) >> 1) {
    goto LABEL_8;
  }
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9) {
        int64_t v13 = v8 + v6;
      }
      else {
        int64_t v13 = v8;
      }
      isUniquelyReferenced_nonNull_native = sub_212358(isUniquelyReferenced_nonNull_native, v13, 1, v7);
      uint64_t v7 = isUniquelyReferenced_nonNull_native;
      if (v5 != a3) {
        goto LABEL_12;
      }
    }

    goto LABEL_16;
  }

void sub_2329B0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  int64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v7 = *v4;
  int64_t v8 = *((void *)*v4 + 2);
  int64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v4);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > *((void *)v7 + 3) >> 1) {
    goto LABEL_8;
  }
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9) {
        int64_t v13 = v8 + v6;
      }
      else {
        int64_t v13 = v8;
      }
      isUniquelyReferenced_nonNull_native = sub_2121E4(isUniquelyReferenced_nonNull_native, v13, 1, v7);
      uint64_t v7 = isUniquelyReferenced_nonNull_native;
      if (v5 != a3) {
        goto LABEL_12;
      }
    }

    goto LABEL_16;
  }

ValueMetadata *_s15ASN1OctetStringVMa()
{
  return &_s15ASN1OctetStringVN;
}

ValueMetadata *_s7ASN1AnyVMa()
{
  return &_s7ASN1AnyVN;
}

void sub_232AC4()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v3 = v0[1];
  Hasher._combine(_:)(v2 - v1);
  BOOL v4 = __OFSUB__(v2, v1);
  uint64_t v5 = v2 - v1;
  if (!v5) {
    return;
  }
  if ((v5 < 0) ^ v4 | (v5 == 0))
  {
LABEL_8:
    __break(1u);
    return;
  }

  int64_t v6 = (Swift::UInt8 *)(v3 + v1);
  do
  {
    Swift::UInt8 v7 = *v6++;
    Hasher._combine(_:)(v7);
    --v5;
  }

  while (v5);
}

unint64_t sub_232B30()
{
  unint64_t result = qword_3A8BE0;
  if (!qword_3A8BE0)
  {
    unint64_t result = swift_getWitnessTable(&unk_2816E8, &_s7ASN1AnyVN);
    atomic_store(result, (unint64_t *)&qword_3A8BE0);
  }

  return result;
}

void sub_232B74()
{
  uint64_t v1 = v0[2];
  unint64_t v2 = v0[3];
  uint64_t v3 = v2 >> 1;
  if (v1 == v2 >> 1) {
    goto LABEL_2;
  }
  if (v1 >= (uint64_t)(v2 >> 1))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v7 = *v0;
  uint64_t v8 = v0[1];
  uint64_t v9 = v0[2];
  if (*(char *)(v8 + v1) < 0)
  {
    uint64_t v9 = v1 + 1;
    if (v1 + 1 == v3)
    {
LABEL_2:
      unint64_t v4 = sub_222964();
      uint64_t v5 = swift_allocError(&type metadata for CryptoKitASN1Error, v4, 0LL, 0LL);
      *int64_t v6 = 3;
      swift_willThrow(v5);
      return;
    }

    while (v9 < v3)
    {
      uint64_t v13 = v9 + 1;
      if (__OFADD__(v9, 1LL)) {
        goto LABEL_15;
      }
      ++v9;
      if (v13 == v3) {
        goto LABEL_2;
      }
    }

    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

uint64_t sub_232C70(uint64_t result, void *a2)
{
  uint64_t v2 = a2[2];
  if (!v2)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  if (v2 == 1)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  unint64_t v4 = a2[4];
  if (!is_mul_ok(v4, 0x28uLL))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v5 = 40 * v4;
  uint64_t v6 = a2[5];
  unint64_t v7 = v5 + v6;
  if (!__CFADD__(v5, v6))
  {
    uint64_t v8 = (char **)result;
    swift_bridgeObjectRetain(a2);
    unint64_t result = sub_233578(v7, v8);
    uint64_t v9 = v2 - 2;
    if (!v9) {
      return swift_bridgeObjectRelease(a2);
    }
    uint64_t v10 = 0LL;
    while (v9 != v10)
    {
      unint64_t result = sub_233578(a2[v10++ + 6], v8);
      if (v9 == v10) {
        return swift_unknownObjectRelease(a2);
      }
    }

    __break(1u);
    goto LABEL_12;
  }

Swift::Int sub_232D4C(uint64_t a1)
{
  Swift::UInt v2 = *(void *)(a1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    uint64_t v3 = (Swift::UInt *)(a1 + 32);
    do
    {
      Swift::UInt v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }

    while (v2);
  }

  return Hasher._finalize()();
}

Swift::Int sub_232DB8()
{
  return sub_232D4C(*v0);
}

void sub_232DC0()
{
  uint64_t v1 = *v0;
  Swift::UInt v2 = *(void *)(*v0 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    uint64_t v3 = (Swift::UInt *)(v1 + 32);
    do
    {
      Swift::UInt v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }

    while (v2);
  }

Swift::Int sub_232E10()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v6);
  Swift::UInt v2 = *(void *)(v1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    uint64_t v3 = (Swift::UInt *)(v1 + 32);
    do
    {
      Swift::UInt v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }

    while (v2);
  }

  return Hasher._finalize()();
}

BOOL sub_232E78(void **a1, void **a2)
{
  return sub_233100(*a1, *a2);
}

unint64_t sub_232E88()
{
  unint64_t result = qword_3A8BE8;
  if (!qword_3A8BE8)
  {
    unint64_t result = swift_getWitnessTable(&unk_2817A0, &_s20ASN1ObjectIdentifierVN);
    atomic_store(result, (unint64_t *)&qword_3A8BE8);
  }

  return result;
}

uint64_t sub_232ECC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81D0);
  uint64_t result = swift_initStaticObject(v0, &unk_3A7EA8);
  qword_3AE7A0 = result;
  return result;
}

uint64_t sub_232EFC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81D0);
  uint64_t result = swift_initStaticObject(v0, &unk_3A7F60);
  qword_3AE7A8 = result;
  return result;
}

uint64_t sub_232F2C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81D0);
  uint64_t result = swift_initStaticObject(v0, &unk_3A7FB0);
  qword_3AE7B0 = result;
  return result;
}

uint64_t sub_232F5C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81D0);
  uint64_t result = swift_initStaticObject(v0, &unk_3A7F08);
  qword_3AE7B8 = result;
  return result;
}

uint64_t sub_232F8C(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  int64_t v8 = 7 * v6;
  if ((unsigned __int128)(v6 * (__int128)7LL) >> 64 != (7 * v6) >> 63)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  if (!__OFADD__(v8, 7LL))
  {
    uint64_t v9 = result;
    if (v8 + 7 > 71)
    {
      unint64_t v10 = sub_222964();
      uint64_t v11 = swift_allocError(&type metadata for CryptoKitASN1Error, v10, 0LL, 0LL);
      *uint64_t v12 = 3;
      swift_willThrow(v11);
      swift_unknownObjectRelease(v9);
      return v4;
    }

    uint64_t result = sub_2421AC(0LL, v8, 7LL);
    uint64_t v14 = *(void *)(result + 16);
    if (!v14)
    {
      swift_bridgeObjectRelease(result);
      swift_unknownObjectRelease(v9);
      return 0LL;
    }

    uint64_t v4 = 0LL;
    uint64_t v15 = 0LL;
    if (a3 <= v5) {
      uint64_t v16 = v5;
    }
    else {
      uint64_t v16 = a3;
    }
    unint64_t v17 = v16 - a3;
    while (v17 > v14 - 1)
    {
      unint64_t v19 = *(void *)(result + 8 * v15 + 32);
      if (v19 - 65 <= 0xFFFFFFFFFFFFFF7ELL)
      {
        unint64_t v18 = 0LL;
      }

      else
      {
        unint64_t v20 = *(_BYTE *)(a2 + a3 + v15) & 0x7F;
        if ((v19 & 0x8000000000000000LL) != 0)
        {
          unint64_t v22 = v20 >> -(char)v19;
          if (v19 <= 0xFFFFFFFFFFFFFFC0LL) {
            unint64_t v18 = 0LL;
          }
          else {
            unint64_t v18 = v22;
          }
        }

        else
        {
          uint64_t v21 = v20 << v19;
          if (v19 >= 0x40) {
            unint64_t v18 = 0LL;
          }
          else {
            unint64_t v18 = v21;
          }
        }
      }

      ++v15;
      v4 |= v18;
      if (v14 == v15)
      {
        swift_bridgeObjectRelease(result);
        swift_unknownObjectRelease(v9);
        return v4;
      }
    }

    __break(1u);
    goto LABEL_26;
  }

BOOL sub_233100(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0LL;
  }
  if (!v2 || a1 == a2) {
    return 1LL;
  }
  if (a1[4] != a2[4]) {
    return 0LL;
  }
  uint64_t v3 = a1 + 5;
  uint64_t v4 = a2 + 5;
  uint64_t v5 = v2 - 1;
  do
  {
    BOOL result = v5 == 0;
    if (!v5) {
      break;
    }
    uint64_t v8 = *v3++;
    uint64_t v7 = v8;
    uint64_t v9 = *v4++;
    --v5;
  }

  while (v7 == v9);
  return result;
}

char *sub_23316C(char *result, char a2, uint64_t a3, char *a4)
{
  uint64_t v9 = (uint64_t)result;
  if (*result != a2)
  {
    unint64_t v17 = sub_222964();
    uint64_t v18 = swift_allocError(&type metadata for CryptoKitASN1Error, v17, 0LL, 0LL);
    *unint64_t v19 = 1;
    swift_willThrow(v18);
    return (char *)sub_222A18(v9);
  }

  if (result[48] != 1)
  {
LABEL_48:
    __break(1u);
    return result;
  }

  uint64_t v10 = v5;
  unint64_t v11 = *((void *)result + 3);
  __int128 v12 = *(_OWORD *)(result + 8);
  uint64_t v45 = v12;
  unint64_t v46 = v11;
  unint64_t v47 = *((void *)result + 4);
  int64_t v13 = v47 >> 1;
  uint64_t v14 = (v47 >> 1) - v11;
  if (__OFSUB__(v47 >> 1, v11))
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }

  uint64_t v7 = v12;
  swift_unknownObjectRetain(v12);
  uint64_t v6 = (char *)_swiftEmptyArrayStorage;
  if (v14 >= 1)
  {
    do
    {
      sub_232B74();
      if (v10)
      {
        sub_222A18(v9);
        swift_bridgeObjectRelease(v6);
        return (char *)swift_unknownObjectRelease(v45);
      }

      uint64_t v7 = v15;
      if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0) {
        uint64_t v6 = sub_212358(0LL, *((void *)v6 + 2) + 1LL, 1, v6);
      }
      unint64_t v8 = *((void *)v6 + 2);
      unint64_t v16 = *((void *)v6 + 3);
      unint64_t v4 = v8 + 1;
      if (v8 >= v16 >> 1) {
        uint64_t v6 = sub_212358((char *)(v16 > 1), v8 + 1, 1, v6);
      }
      *((void *)v6 + 2) = v4;
      *(void *)&v6[8 * v8 + 32] = v7;
      unint64_t v11 = v47 >> 1;
      int64_t v13 = (v47 >> 1) - v46;
      if (__OFSUB__(v47 >> 1, v46))
      {
        __break(1u);
        goto LABEL_39;
      }
    }

    while (v13 > 0);
    uint64_t v7 = v45;
    if (v4 < 2) {
      goto LABEL_15;
    }
LABEL_19:
    BOOL result = sub_212358(0LL, v4 + 1, 0, (char *)_swiftEmptyArrayStorage);
    int64_t v13 = *((void *)v6 + 2);
    if (v13)
    {
      a4 = result;
      unint64_t v8 = (unint64_t)(v6 + 32);
      unint64_t v24 = *((void *)v6 + 4);
      if (v24 <= 0x27)
      {
        int64_t v13 = *((void *)result + 2);
        unint64_t v11 = *((void *)result + 3);
        unint64_t v4 = v13 + 1;
        if (v13 < v11 >> 1) {
          goto LABEL_22;
        }
        goto LABEL_41;
      }

      unint64_t v26 = *((void *)result + 2);
      unint64_t v27 = *((void *)result + 3);
      unint64_t v28 = v27 >> 1;
      unint64_t v29 = v26 + 1;
      if (v24 <= 0x4F)
      {
        if (v28 <= v26)
        {
          unint64_t v35 = v26 + 1;
          unint64_t v42 = *((void *)result + 2);
          BOOL result = sub_212358((char *)(v27 > 1), v26 + 1, 1, result);
          unint64_t v26 = v42;
          unint64_t v29 = v35;
          a4 = result;
        }

        *((void *)a4 + 2) = v29;
        *(void *)&a4[8 * v26 + 32] = 1LL;
        unint64_t v27 = *((void *)v6 + 2);
        if (!v27)
        {
          __break(1u);
          goto LABEL_45;
        }

        unint64_t v27 = *(void *)v8 - 40LL;
        if (*(void *)v8 >= 0x28uLL)
        {
LABEL_34:
          unint64_t v30 = *((void *)a4 + 3);
          unint64_t v31 = v26 + 2;
          if (v29 >= v30 >> 1)
          {
            unint64_t v38 = v27;
            unint64_t v41 = v29;
            v34 = sub_212358((char *)(v30 > 1), v26 + 2, 1, a4);
            unint64_t v27 = v38;
            unint64_t v29 = v41;
            a4 = v34;
          }

          *((void *)a4 + 2) = v31;
          *(void *)&a4[8 * v29 + 32] = v27;
          goto LABEL_37;
        }

        __break(1u);
      }

      if (v28 > v26)
      {
LABEL_32:
        *((void *)a4 + 2) = v29;
        *(void *)&a4[8 * v26 + 32] = 2LL;
        if (*((void *)v6 + 2))
        {
          unint64_t v27 = *(void *)v8 - 80LL;
          if (*(void *)v8 >= 0x50uLL) {
            goto LABEL_34;
          }
        }

        else
        {
          __break(1u);
        }

        __break(1u);
        goto LABEL_48;
      }

uint64_t sub_233578(unint64_t a1, char **a2)
{
  if (a1)
  {
    unint64_t v4 = __clz(a1);
    uint64_t v5 = *a2;
    if (v4 - 57 >= 7)
    {
      if ((swift_isUniquelyReferenced_nonNull_native(*a2) & 1) == 0) {
        uint64_t v5 = sub_2121E4(0LL, *((void *)v5 + 2) + 1LL, 1, v5);
      }
      uint64_t v7 = 7 * v6 - 7;
      uint64_t v8 = v6;
      while (v8 <= v6)
      {
        unint64_t v10 = *((void *)v5 + 2);
        unint64_t v9 = *((void *)v5 + 3);
        if (v10 >= v9 >> 1) {
          uint64_t v5 = sub_2121E4((char *)(v9 > 1), v10 + 1, 1, v5);
        }
        --v8;
        *((void *)v5 + 2) = v10 + 1;
        v5[v10 + 32] = (a1 >> v7) | 0x80;
        v7 -= 7LL;
        if (v8 == 1) {
          goto LABEL_17;
        }
      }

      __break(1u);
LABEL_17:
      *a2 = v5;
    }

    char v15 = a1 & 0x7F;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native(v5);
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_2121E4(0LL, *((void *)v5 + 2) + 1LL, 1, v5);
      uint64_t v5 = (char *)result;
    }

    unint64_t v13 = *((void *)v5 + 2);
    unint64_t v16 = *((void *)v5 + 3);
    unint64_t v14 = v13 + 1;
    if (v13 >= v16 >> 1)
    {
      uint64_t result = (uint64_t)sub_2121E4((char *)(v16 > 1), v13 + 1, 1, v5);
      uint64_t v5 = (char *)result;
    }
  }

  else
  {
    uint64_t v5 = *a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native(*a2);
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_2121E4(0LL, *((void *)v5 + 2) + 1LL, 1, v5);
      uint64_t v5 = (char *)result;
    }

    unint64_t v13 = *((void *)v5 + 2);
    unint64_t v12 = *((void *)v5 + 3);
    unint64_t v14 = v13 + 1;
    if (v13 >= v12 >> 1)
    {
      uint64_t result = (uint64_t)sub_2121E4((char *)(v12 > 1), v13 + 1, 1, v5);
      uint64_t v5 = (char *)result;
    }

    char v15 = 0;
  }

  *((void *)v5 + 2) = v14;
  v5[v13 + 32] = v15;
  *a2 = v5;
  return result;
}

ValueMetadata *_s20ASN1ObjectIdentifierVMa()
{
  return &_s20ASN1ObjectIdentifierVN;
}

uint64_t sub_23377C@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v52 = a3;
  uint64_t v53 = a5;
  v55 = a1;
  uint64_t v56 = a2;
  uint64_t v54 = a7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  a6,  a4,  &protocol requirements base descriptor for DataProtocol,  &associated type descriptor for DataProtocol.Regions);
  uint64_t v51 = *(void *)(swift_getAssociatedConformanceWitness( a6,  a4,  AssociatedTypeWitness,  &protocol requirements base descriptor for DataProtocol,  &associated conformance descriptor for DataProtocol.DataProtocol.Regions: BidirectionalCollection)
                  + 8);
  uint64_t v49 = swift_getAssociatedTypeWitness( 255LL,  *(void *)(v51 + 8),  AssociatedTypeWitness,  &protocol requirements base descriptor for Sequence,  &associated type descriptor for Sequence.Element);
  uint64_t v10 = type metadata accessor for Optional(0LL, v49);
  __chkstk_darwin(v10, v11);
  unint64_t v48 = (char *)&v47 - v12;
  uint64_t v13 = swift_checkMetadataState(0LL, AssociatedTypeWitness);
  uint64_t v50 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13, v14);
  unint64_t v47 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15, v17);
  unint64_t v19 = (char *)&v47 - v18;
  uint64_t v20 = type metadata accessor for Optional(0LL, a4);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v23 = __chkstk_darwin(v20, v22);
  uint64_t v25 = (char *)&v47 - v24;
  uint64_t v26 = *((void *)a4 - 1);
  uint64_t v28 = __chkstk_darwin(v23, v27);
  unint64_t v30 = (char *)&v47 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v28, v31);
  v33 = (char *)&v47 - v32;
  v55 = (void *)*v55;
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v25, v56, v20);
  if ((*(unsigned int (**)(char *, uint64_t, char *))(v26 + 48))(v25, 1LL, a4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v25, v20);
    size_t v34 = sub_2349C8((size_t)_swiftEmptyArrayStorage);
    size_t v35 = v34;
LABEL_7:
    v57 = v55;
    __chkstk_darwin(v34, v52);
    *(&v47 - 6) = (char *)v44;
    *(&v47 - 5) = a4;
    *(&v47 - 4) = (char *)v45;
    *(&v47 - 3) = (char *)a6;
    *(&v47 - 2) = (char *)v35;
    type metadata accessor for HashedAuthenticationCode(0LL, v44, v45, v46);
    sub_21E954((uint64_t (*)(uint64_t, uint64_t))sub_234AB0, (uint64_t)(&v47 - 8));
    return swift_release(v35);
  }

  (*(void (**)(char *, char *, char *))(v26 + 32))(v33, v25, a4);
  dispatch thunk of DataProtocol.regions.getter(a4, a6);
  uint64_t v36 = dispatch thunk of Collection.count.getter(v13, v51);
  uint64_t v37 = *(void (**)(char *, uint64_t))(v50 + 8);
  v37(v19, v13);
  if (v36 != 1)
  {
    (*(void (**)(char *, char *, char *))(v26 + 16))(v30, v33, a4);
    size_t v43 = Array.init<A>(_:)( v30,  &type metadata for UInt8,  a4,  *(void *)(*(void *)(*(void *)(*(void *)(a6 + 8) + 8LL) + 8LL) + 8LL));
    size_t v35 = sub_2349C8(v43);
    swift_bridgeObjectRelease(v43);
    size_t v34 = (*(uint64_t (**)(char *, char *))(v26 + 8))(v33, a4);
    goto LABEL_7;
  }

  unint64_t v38 = v47;
  dispatch thunk of DataProtocol.regions.getter(a4, a6);
  uint64_t v39 = (uint64_t)v48;
  Collection.first.getter(v13, v51);
  v37(v38, v13);
  uint64_t v40 = v49;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 48LL))(v39, 1LL, v49);
  if ((_DWORD)result != 1)
  {
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( a6,  a4,  v40,  &protocol requirements base descriptor for DataProtocol,  &associated conformance descriptor for DataProtocol.DataProtocol.Regions.Sequence.Element: ContiguousBytes);
    sub_21E9B8(v39, v40, AssociatedConformanceWitness, (uint64_t *)&v57);
    size_t v34 = (*(uint64_t (**)(char *, char *))(v26 + 8))(v33, a4);
    size_t v35 = (size_t)v57;
    goto LABEL_7;
  }

  __break(1u);
  return result;
}

uint64_t sub_233B88@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10)
{
  uint64_t v65 = a8;
  uint64_t v13 = a4;
  uint64_t v73 = a2;
  uint64_t v77 = a1;
  v61 = a9;
  uint64_t v68 = type metadata accessor for HashedAuthenticationCode(0LL, a4, a7, a4);
  uint64_t v72 = *(void *)(v68 - 8);
  __chkstk_darwin(v68, v15);
  v66 = (char *)&v61 - v16;
  uint64_t v17 = type metadata accessor for Optional(0LL, a6);
  uint64_t v70 = *(void *)(v17 - 8);
  uint64_t v71 = v17;
  uint64_t v19 = __chkstk_darwin(v17, v18);
  uint64_t v21 = (char *)&v61 - v20;
  uint64_t v75 = a6;
  uint64_t v69 = *(void *)(a6 - 8);
  __chkstk_darwin(v19, v22);
  v64 = (char *)&v61 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = type metadata accessor for HMAC(0LL, v13, a7, v24);
  uint64_t v67 = *(void *)(v25 - 8);
  uint64_t v27 = __chkstk_darwin(v25, v26);
  uint64_t v29 = (char *)&v61 - v28;
  uint64_t v30 = *(void *)(a5 - 8);
  __chkstk_darwin(v27, v31);
  v33 = (char *)&v61 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v62 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness(0LL, a7, v13, &unk_33EC10, &unk_33EC20);
  uint64_t v76 = a7;
  uint64_t v74 = v13;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( a7,  v13,  AssociatedTypeWitness,  &unk_33EC10,  &unk_33EC18);
  double v36 = ceil( (double)a3 / (double)(*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 40))( AssociatedTypeWitness,  AssociatedConformanceWitness));
  if ((~*(void *)&v36 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_21;
  }

  if (v36 <= -1.0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  if (v36 < 256.0)
  {
    uint64_t v13 = a5;
    LODWORD(a5) = (int)v36;
    if (qword_3A7D18 == -1) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }

uint64_t sub_234134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = swift_beginAccess(a4 + 16, v11, 0LL, 0LL);
  uint64_t v9 = *(void *)(a4 + 16);
  if (v9 < a3 || (a3 | a1) < 0 || v9 < a1)
  {
    __break(1u);
    goto LABEL_16;
  }

  uint64_t v10 = a3 - a1;
  if (a2 >= 1)
  {
    if (v10 < 0 || v10 >= a2) {
      goto LABEL_11;
    }
    return 0LL;
  }

  if (v10 <= 0 && v10 > a2) {
    return 0LL;
  }
LABEL_11:
  uint64_t result = a1 + a2;
  if (__OFADD__(a1, a2))
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }

  if (result < 0 || v9 < result) {
    goto LABEL_17;
  }
  return result;
}

uint64_t sub_2341F8@<X0>( uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v35 = a8;
  uint64_t v36 = a2;
  uint64_t v44 = a4;
  uint64_t v42 = a9;
  uint64_t v39 = a3;
  uint64_t v40 = a11;
  uint64_t v37 = a10;
  uint64_t v43 = type metadata accessor for Optional(0LL, a7);
  uint64_t v41 = *(void *)(v43 - 8);
  __chkstk_darwin(v43, v16);
  uint64_t v18 = (char *)&v34 - v17;
  uint64_t v19 = type metadata accessor for Optional(0LL, a6);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19, v21);
  uint64_t v23 = (char *)&v34 - v22;
  uint64_t v25 = type metadata accessor for HashedAuthenticationCode(0LL, a5, a8, v24);
  uint64_t v38 = *(void *)(v25 - 8);
  __chkstk_darwin(v25, v26);
  uint64_t v28 = (char *)&v34 - v27;
  uint64_t v45 = *a1;
  uint64_t v29 = *((void *)a6 - 1);
  (*(void (**)(char *, uint64_t, char *))(v29 + 16))(v23, v36, a6);
  (*(void (**)(char *, void, uint64_t, char *))(v29 + 56))(v23, 0LL, 1LL, a6);
  uint64_t v30 = v35;
  sub_23377C(&v45, (uint64_t)v23, a5, a6, v35, v37, (uint64_t)v28);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
  uint64_t v31 = *(void *)(a7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v18, v39, a7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v18, 0LL, 1LL, a7);
  uint64_t WitnessTable = swift_getWitnessTable(&unk_280724, v25);
  sub_233B88((uint64_t)v28, (uint64_t)v18, v44, a5, v25, a7, v30, WitnessTable, v42, v40);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v18, v43);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v28, v25);
}

uint64_t sub_234424@<X0>( uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  uint64_t v19 = *a1;
  uint64_t v18 = _swiftEmptyArrayStorage;
  uint64_t v15 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_3A8060);
  unint64_t v16 = sub_2350B8();
  return sub_2341F8(&v19, (uint64_t)&v18, a2, a3, a4, v15, a5, a6, a8, v16, a7);
}

uint64_t sub_2344CC@<X0>( uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  uint64_t v19 = *a1;
  uint64_t v18 = _swiftEmptyArrayStorage;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A8060);
  unint64_t v16 = sub_2350B8();
  return sub_2341F8(&v19, a2, (uint64_t)&v18, a3, a4, a5, v15, a6, a8, a7, v16);
}

uint64_t sub_234574@<X0>( uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v14 = *a1;
  uint64_t v12 = _swiftEmptyArrayStorage;
  uint64_t v13 = _swiftEmptyArrayStorage;
  uint64_t v9 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_3A8060);
  unint64_t v10 = sub_2350B8();
  return sub_2341F8(&v14, (uint64_t)&v13, (uint64_t)&v12, a2, a3, v9, (uint64_t)v9, a4, a5, v10, v10);
}

char *sub_234608(uint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v4 = *v1;
  swift_beginAccess(v4 + 2, v21, 0LL, 0LL);
  uint64_t v5 = v4[2];
  uint64_t result = (char *)swift_beginAccess(a1 + 16, v20, 0LL, 0LL);
  uint64_t v7 = *(void *)(a1 + 16);
  BOOL v8 = __OFADD__(v5, v7);
  uint64_t v9 = v5 + v7;
  if (v8)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native(*v2);
  if ((_DWORD)result)
  {
    uint64_t result = (char *)_swift_stdlib_malloc_size(*v2);
  }

  if (v9 < 0) {
    goto LABEL_15;
  }
  if (HIDWORD(v9))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  if ((_DWORD)v9)
  {
    unsigned int v10 = (v9 - 1) | ((v9 - 1) >> 1) | ((((_DWORD)v9 - 1) | ((v9 - 1) >> 1)) >> 2);
    unsigned int v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
    int v12 = v11 | HIWORD(v11);
    if (v12 == -1) {
      uint64_t v13 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v13 = (v12 + 1);
    }
  }

  else
  {
    uint64_t v13 = 1LL;
  }

  uint64_t v14 = type metadata accessor for SecureBytes.Backing(0LL);
  uint64_t v15 = swift_allocObject(v14, v13 + 32, 7LL);
  *(void *)(v15 + 16) = 0LL;
  *(void *)(v15 + 24) = v13;
  unint64_t v16 = (char *)*v2;
  uint64_t result = (char *)swift_beginAccess((char *)*v2 + 16, v19, 0LL, 0LL);
  uint64_t v17 = *((void *)v16 + 2);
  if ((v17 & 0x8000000000000000LL) == 0)
  {
    sub_238930(v16, 0LL, v17);
    uint64_t v18 = *v2;
    *uint64_t v2 = (const void *)v15;
    swift_release(v18);
    return sub_238A40(a1);
  }

size_t sub_234748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  unsigned int v10 = *v4;
  size_t result = swift_beginAccess(v10 + 2, v25, 0LL, 0LL);
  uint64_t v12 = a4 - a3;
  if (!a3) {
    uint64_t v12 = 0LL;
  }
  if (a1 < 0 || v12 < a1)
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  if (a2 < 0 || v12 < a2) {
    goto LABEL_21;
  }
  uint64_t v13 = v10[2];
  int64_t v14 = v13 + a2 - a1;
  if (__OFADD__(v13, a2 - a1))
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  size_t result = swift_isUniquelyReferenced_nonNull_native(*v5);
  if ((_DWORD)result)
  {
    size_t result = _swift_stdlib_malloc_size(*v5);
  }

  if (v14 < 0) {
    goto LABEL_23;
  }
  if (HIDWORD(v14))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  if ((_DWORD)v14)
  {
    unsigned int v15 = (v14 - 1) | ((v14 - 1) >> 1) | ((((_DWORD)v14 - 1) | ((v14 - 1) >> 1)) >> 2);
    unsigned int v16 = v15 | (v15 >> 4) | ((v15 | (v15 >> 4)) >> 8);
    int v17 = v16 | HIWORD(v16);
    if (v17 == -1) {
      uint64_t v18 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v18 = (v17 + 1);
    }
  }

  else
  {
    uint64_t v18 = 1LL;
  }

  uint64_t v19 = type metadata accessor for SecureBytes.Backing(0LL);
  uint64_t v20 = swift_allocObject(v19, v18 + 32, 7LL);
  *(void *)(v20 + 16) = 0LL;
  *(void *)(v20 + 24) = v18;
  uint64_t v21 = (char *)*v5;
  size_t result = swift_beginAccess((char *)*v5 + 16, &v24, 0LL, 0LL);
  uint64_t v22 = *((void *)v21 + 2);
  if ((v22 & 0x8000000000000000LL) == 0)
  {
    sub_238930(v21, 0LL, v22);
    uint64_t v23 = *v5;
    *uint64_t v5 = (const void *)v20;
    swift_release(v23);
    return sub_238BD4(a1, a2, a3, a4);
  }

size_t sub_2348C8(uint64_t a1)
{
  size_t result = swift_beginAccess(a1 + 16, v12, 0LL, 0LL);
  size_t v3 = *(void *)(a1 + 16);
  if (HIDWORD(v3))
  {
    __break(1u);
  }

  else
  {
    unint64_t v4 = (const void *)(a1 + 32);
    if ((_DWORD)v3)
    {
      unsigned int v5 = (v3 - 1) | ((v3 - 1) >> 1) | ((((_DWORD)v3 - 1) | ((v3 - 1) >> 1)) >> 2);
      unsigned int v6 = v5 | (v5 >> 4) | ((v5 | (v5 >> 4)) >> 8);
      int v7 = v6 | HIWORD(v6);
      if (v7 == -1) {
        uint64_t v8 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v8 = (v7 + 1);
      }
    }

    else
    {
      uint64_t v8 = 1LL;
    }

    uint64_t v9 = type metadata accessor for SecureBytes.Backing(0LL);
    unsigned int v10 = (void *)swift_allocObject(v9, v8 + 32, 7LL);
    v10[2] = 0LL;
    v10[3] = v8;
    _swift_stdlib_malloc_size(v10);
    memcpy(v10 + 4, v4, v3);
    swift_beginAccess(v10 + 2, &v11, 1LL, 0LL);
    v10[2] = v3;
    size_t result = _swift_stdlib_malloc_size(v10);
  }

  __break(1u);
  return result;
}

size_t sub_2349C8(size_t result)
{
  size_t v1 = *(void *)(result + 16);
  if (HIDWORD(v1))
  {
    __break(1u);
  }

  else
  {
    if ((_DWORD)v1)
    {
      unsigned int v2 = (v1 - 1) | ((v1 - 1) >> 1) | ((((_DWORD)v1 - 1) | ((v1 - 1) >> 1)) >> 2);
      unsigned int v3 = v2 | (v2 >> 4) | ((v2 | (v2 >> 4)) >> 8);
      int v4 = v3 | HIWORD(v3);
      if (v4 == -1) {
        uint64_t v5 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v5 = (v4 + 1);
      }
    }

    else
    {
      uint64_t v5 = 1LL;
    }

    unsigned int v6 = (const void *)(result + 32);
    uint64_t v7 = type metadata accessor for SecureBytes.Backing(0LL);
    uint64_t v8 = (void *)swift_allocObject(v7, v5 + 32, 7LL);
    v8[2] = 0LL;
    v8[3] = v5;
    _swift_stdlib_malloc_size(v8);
    memcpy(v8 + 4, v6, v1);
    swift_beginAccess(v8 + 2, v9, 1LL, 0LL);
    v8[2] = v1;
    size_t result = _swift_stdlib_malloc_size(v8);
  }

  __break(1u);
  return result;
}

uint64_t sub_234AB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v5 = v3[2];
  uint64_t v6 = v3[4];
  uint64_t v7 = v3[6];
  v11[0] = a1;
  v11[1] = a2;
  uint64_t v10 = v7;
  unint64_t v8 = sub_210E08();
  return sub_2115B8((uint64_t)v11, &v10, v5, (uint64_t)&type metadata for UnsafeRawBufferPointer, v6, v8, a3);
}

void sub_234B20(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

void *sub_234B60( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __src, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20, char a21, char a22, char a23, char a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37)
{
  uint64_t v45 = v37;
  __int16 v46 = v38;
  char v47 = BYTE2(v38);
  char v48 = BYTE3(v38);
  char v49 = BYTE4(v38);
  int64_t v39 = BYTE6(v38);
  char v50 = BYTE5(v38);
  if (BYTE6(v38))
  {
    unsigned int v40 = (BYTE6(v38) - 1) | ((BYTE6(v38) - 1) >> 1) | (((BYTE6(v38) - 1) | ((BYTE6(v38) - 1) >> 1)) >> 2);
    uint64_t v41 = (v40 | (v40 >> 4)) + 1;
  }

  else
  {
    uint64_t v41 = 1LL;
  }

  uint64_t v42 = type metadata accessor for SecureBytes.Backing(0LL);
  uint64_t v43 = (void *)swift_allocObject(v42, v41 + 32, 7LL);
  v43[2] = 0LL;
  v43[3] = v41;
  _swift_stdlib_malloc_size(v43);
  memcpy(v43 + 4, &v45, v39);
  swift_beginAccess(v43 + 2, &v51, 1LL, 0LL);
  v43[2] = v39;
  if ((uint64_t)(_swift_stdlib_malloc_size(v43) - 32) < v39)
  {
    __break(1u);
    JUMPOUT(0x234D74LL);
  }

  return v43;
}

size_t sub_234F3C(size_t result, uint64_t a2)
{
  int64_t v2 = a2 - result;
  if (result) {
    size_t v3 = a2 - result;
  }
  else {
    size_t v3 = 0LL;
  }
  if ((v3 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_17;
  }

  if (HIDWORD(v3))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  int v4 = (const void *)result;
  if ((_DWORD)v3)
  {
    unsigned int v5 = (v3 - 1) | ((v3 - 1) >> 1) | ((((_DWORD)v3 - 1) | ((v3 - 1) >> 1)) >> 2);
    unsigned int v6 = v5 | (v5 >> 4) | ((v5 | (v5 >> 4)) >> 8);
    int v7 = v6 | HIWORD(v6);
    if (v7 == -1) {
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v8 = (v7 + 1);
    }
  }

  else
  {
    uint64_t v8 = 1LL;
  }

  uint64_t v9 = type metadata accessor for SecureBytes.Backing(0LL);
  uint64_t v10 = (void *)swift_allocObject(v9, v8 + 32, 7LL);
  v10[2] = 0LL;
  v10[3] = v8;
  _swift_stdlib_malloc_size(v10);
  if (v4) {
    memmove(v10 + 4, v4, v2);
  }
  else {
    int64_t v2 = 0LL;
  }
  swift_beginAccess(v10 + 2, v11, 1LL, 0LL);
  v10[2] = v2;
  size_t result = _swift_stdlib_malloc_size(v10);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_235040(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 - a3;
  if (!a3) {
    uint64_t v4 = 0LL;
  }
  if (result < 0 || v4 < result)
  {
    __break(1u);
  }

  else if ((a2 & 0x8000000000000000LL) == 0 && v4 >= a2)
  {
    return a2 - result;
  }

  __break(1u);
  return result;
}

unint64_t sub_235074()
{
  unint64_t result = qword_3A8BF0[0];
  if (!qword_3A8BF0[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_2822A0, &type metadata for SecureBytes);
    atomic_store(result, qword_3A8BF0);
  }

  return result;
}

unint64_t sub_2350B8()
{
  unint64_t result = qword_3A8070;
  if (!qword_3A8070)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_3A8060);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_3A8070);
  }

  return result;
}

uint64_t sub_235104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 16LL);
}

uint64_t type metadata accessor for HKDF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HKDF);
}

unint64_t sub_23511C()
{
  unint64_t result = qword_3A8C78;
  if (!qword_3A8C78)
  {
    unint64_t result = swift_getWitnessTable(&unk_281884, &_s6ErrorsON);
    atomic_store(result, (unint64_t *)&qword_3A8C78);
  }

  return result;
}

uint64_t _s6ErrorsOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF8) {
    return ((uint64_t (*)(void))((char *)&loc_2351AC + 4 * byte_28187D[v4]))();
  }
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_2351E0 + 4 * byte_281878[v4]))();
}

uint64_t sub_2351E0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2351E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x2351F0LL);
  }
  return result;
}

uint64_t sub_2351FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x235204LL);
  }
  *(_BYTE *)unint64_t result = a2 + 7;
  return result;
}

uint64_t sub_235208(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235210(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s6ErrorsOMa()
{
  return &_s6ErrorsON;
}

uint64_t sub_23522C@<X0>( uint64_t a1@<X1>, int64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, int **a7@<X8>)
{
  uint64_t v15 = *v7;
  swift_beginAccess(v15 + 16, &v18, 0LL, 0LL);
  size_t v16 = sub_234F3C(v15 + 32, v15 + 32 + *(void *)(v15 + 16));
  size_t v19 = v16;
  sub_235A6C((uint64_t *)&v19, a1, a2, a3, a4, a5, a6, a7);
  return swift_release(v16);
}

uint64_t sub_2352DC@<X0>( uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, char *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, void *a8@<X8>, uint64_t a9, uint64_t a10)
{
  uint64_t v12 = *v10;
  return sub_2341F8(&v12, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_23530C()
{
  uint64_t v1 = *v0;
  swift_beginAccess(v1 + 16, v3, 0LL, 0LL);
  return Hasher.combine(bytes:)(v1 + 32, v1 + 32 + *(void *)(v1 + 16));
}

Swift::Int sub_23535C()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v4);
  swift_beginAccess(v1 + 16, &v3, 0LL, 0LL);
  Hasher.combine(bytes:)(v1 + 32, v1 + 32 + *(void *)(v1 + 16));
  return Hasher._finalize()();
}

Swift::Int sub_2353BC()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v4);
  swift_beginAccess(v1 + 16, &v3, 0LL, 0LL);
  Hasher.combine(bytes:)(v1 + 32, v1 + 32 + *(void *)(v1 + 16));
  return Hasher._finalize()();
}

uint64_t sub_235418(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess(*a1 + 16, v5, 0LL, 0LL);
  return sub_21EB3C((char *)(v2 + 32), v2 + 32 + *(void *)(v2 + 16), v3) & 1;
}

uint64_t sub_235478(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  a4,  a3,  &protocol requirements base descriptor for DataProtocol,  &associated type descriptor for DataProtocol.Regions);
  uint64_t v9 = *(void *)(swift_getAssociatedConformanceWitness( a4,  a3,  AssociatedTypeWitness,  &protocol requirements base descriptor for DataProtocol,  &associated conformance descriptor for DataProtocol.DataProtocol.Regions: BidirectionalCollection)
                 + 8);
  uint64_t v43 = swift_getAssociatedTypeWitness( 255LL,  *(void *)(v9 + 8),  AssociatedTypeWitness,  &protocol requirements base descriptor for Sequence,  &associated type descriptor for Sequence.Element);
  uint64_t v10 = type metadata accessor for Optional(0LL, v43);
  uint64_t v12 = __chkstk_darwin(v10, v11);
  uint64_t v42 = (char *)&v40 - v13;
  uint64_t v41 = *(void *)(a3 - 8);
  __chkstk_darwin(v12, v14);
  size_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = swift_checkMetadataState(0LL, AssociatedTypeWitness);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v20 = __chkstk_darwin(v17, v19);
  uint64_t v22 = (char *)&v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v20, v23);
  uint64_t v25 = (char *)&v40 - v24;
  uint64_t v26 = *a1;
  uint64_t v44 = a2;
  uint64_t v45 = a4;
  dispatch thunk of DataProtocol.regions.getter(a3, a4);
  uint64_t v27 = dispatch thunk of Collection.count.getter(v17, v9);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v18 + 8);
  v28(v25, v17);
  if (v27 != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v16, v44, a3);
    uint64_t v37 = Data.init<A>(_:)(v16, a3, *(void *)(*(void *)(*(void *)(*(void *)(v45 + 8) + 8LL) + 8LL) + 8LL));
    unint64_t v39 = v38;
    swift_beginAccess(v26 + 16, v46, 0LL, 0LL);
    char v36 = sub_21EBE0(v26 + 32, v26 + 32 + *(void *)(v26 + 16), v37, v39);
    sub_1F86D4(v37, v39);
    return v36 & 1;
  }

  v46[0] = v26;
  uint64_t v29 = v45;
  dispatch thunk of DataProtocol.regions.getter(a3, v45);
  uint64_t v30 = v42;
  Collection.first.getter(v17, v9);
  v28(v22, v17);
  uint64_t v31 = v43;
  uint64_t v32 = *(void *)(v43 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1LL, v43);
  if ((_DWORD)result != 1)
  {
    unint64_t v34 = sub_235924();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v29,  a3,  v31,  &protocol requirements base descriptor for DataProtocol,  &associated conformance descriptor for DataProtocol.DataProtocol.Regions.Sequence.Element: ContiguousBytes);
    char v36 = sub_23C734(v46, v30, &type metadata for SharedSecret, v31, v34, AssociatedConformanceWitness);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v30, v31);
    return v36 & 1;
  }

  __break(1u);
  return result;
}

uint64_t sub_235780()
{
  uint64_t v1 = *v0;
  strcpy((char *)v17, "SharedSecret: ");
  HIBYTE(v17[1]) = -18;
  uint64_t result = swift_beginAccess(v1 + 16, v16, 0LL, 0LL);
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3 + 0x4000000000000000LL < 0)
  {
    __break(1u);
    goto LABEL_8;
  }

  size_t v4 = 2 * v3;
  if (2 * v3 < 0)
  {
LABEL_8:
    __break(1u);
    return result;
  }

  swift_retain(v1);
  if (v4)
  {
    unsigned int v5 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(v4, &type metadata for UInt8);
    v5[2] = v4;
    bzero(v5 + 4, v4);
  }

  else
  {
    unsigned int v5 = _swiftEmptyArrayStorage;
  }

  uint64_t v14 = 0LL;
  uint64_t v15 = v5;
  uint64_t v6 = swift_retain(v1);
  sub_21361C(v6, (uint64_t *)&v15, &v14);
  swift_release(v1);
  uint64_t v7 = (uint64_t)v15;
  uint64_t v8 = v15 + 4;
  uint64_t v9 = v15[2];
  swift_bridgeObjectRetain(v15);
  uint64_t v10 = static String._fromUTF8Repairing(_:)(v8, v9);
  uint64_t v12 = v11;
  swift_release(v1);
  swift_bridgeObjectRelease_n(v7, 2LL);
  v13._countAndFlagsBits = v10;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v12);
  return v17[0];
}

uint64_t sub_2358C0(int a1, uint64_t a2, uint64_t a3)
{
  int v4 = a1;
  return (*(uint64_t (**)(int *, uint64_t *, uint64_t))(a3 + 40))(&v4, &v5, a2);
}

unint64_t sub_235924()
{
  unint64_t result = qword_3A8C80;
  if (!qword_3A8C80)
  {
    unint64_t result = swift_getWitnessTable(&unk_281960, &type metadata for SharedSecret);
    atomic_store(result, (unint64_t *)&qword_3A8C80);
  }

  return result;
}

unint64_t sub_23596C()
{
  unint64_t result = qword_3A8C88[0];
  if (!qword_3A8C88[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_2819F0, &type metadata for SharedSecret);
    atomic_store(result, qword_3A8C88);
  }

  return result;
}

uint64_t sub_2359B0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_2359B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

ValueMetadata *type metadata accessor for SharedSecret()
{
  return &type metadata for SharedSecret;
}

uint64_t sub_2359E4(uint64_t a1)
{
  v2[0] = (char *)&value witness table for Builtin.RawPointer + 64;
  v2[1] = (char *)&value witness table for Builtin.RawPointer + 64;
  return swift_initClassMetadata2(a1, 0LL, 2LL, v2, a1 + 96);
}

uint64_t sub_235A28()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t type metadata accessor for CoreCryptoDigestBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for CoreCryptoDigestBuffer);
}

uint64_t type metadata accessor for CoreCryptoDigestImpl(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CoreCryptoDigestImpl);
}

uint64_t sub_235A6C@<X0>( uint64_t *a1@<X0>, uint64_t a2@<X1>, int64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int **a8@<X8>)
{
  uint64_t v50 = a5;
  uint64_t v51 = a7;
  uint64_t v49 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness(0LL, a6, a4, &unk_33EC10, &unk_33EC20);
  uint64_t v48 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v16 = __chkstk_darwin(AssociatedTypeWitness, v15);
  uint64_t v53 = (char *)&v39 - v17;
  uint64_t v45 = *(void *)(a4 - 8);
  __chkstk_darwin(v16, v18);
  uint64_t v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3 < 0) {
    goto LABEL_18;
  }
  uint64_t v8 = *a1;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( a6,  a4,  AssociatedTypeWitness,  &unk_33EC10,  &unk_33EC18);
  __int16 v46 = *(uint64_t (**)(uint64_t))(AssociatedConformanceWitness + 40);
  uint64_t v47 = AssociatedConformanceWitness;
  unint64_t v22 = v46(AssociatedTypeWitness);
  if ((v22 & 0x8000000000000000LL) != 0) {
    goto LABEL_19;
  }
  if (!is_mul_ok(v22, 0xFFFFFFFFuLL)) {
    goto LABEL_20;
  }
  unint64_t v39 = a8;
  if (0xFFFFFFFF * v22 > a3)
  {
    if (qword_3A7D18 != -1) {
      goto LABEL_21;
    }
    while (1)
    {
      uint64_t v56 = off_3A8E78[0];
      swift_retain(off_3A8E78[0]);
      sub_2383F4(a3);
      int64_t v40 = a3;
      if (!a3) {
        break;
      }
      uint64_t v23 = *(void (**)(uint64_t, uint64_t))(a6 + 32);
      uint64_t v43 = v8 + 32;
      uint64_t v44 = v23;
      uint64_t v42 = (void *)(v8 + 16);
      swift_beginAccess(v8 + 16, v54, 0LL, 0LL);
      uint64_t v8 = 0LL;
      unsigned int v24 = 1;
      uint64_t v41 = (char *)&type metadata for () + 8;
      a3 = v40;
      while (1)
      {
        v44(a4, a6);
        uint64_t v25 = v43 + *v42;
        v55[0] = v43;
        v55[1] = v25;
        unint64_t v26 = sub_210E08();
        sub_235FD8((uint64_t)v55, a4, (uint64_t)&type metadata for UnsafeRawBufferPointer, a6, v26);
        sub_2358C0(bswap32(v24), a4, a6);
        sub_235FD8(v49, a4, v50, a6, v51);
        (*(void (**)(uint64_t, uint64_t))(a6 + 48))(a4, a6);
        if (v24 == -1) {
          break;
        }
        uint64_t v27 = AssociatedTypeWitness;
        uint64_t v28 = AssociatedTypeWitness;
        uint64_t v29 = v47;
        uint64_t v30 = ((uint64_t (*)(uint64_t, uint64_t))v46)(v27, v47);
        uint64_t v52 = &v39;
        if (v30 >= a3) {
          int64_t v32 = a3;
        }
        else {
          int64_t v32 = v30;
        }
        __chkstk_darwin(v30, v31);
        uint64_t v37 = &v56;
        int64_t v38 = v32;
        uint64_t v33 = *(void *)(v29 + 8);
        uint64_t AssociatedTypeWitness = v28;
        dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(sub_235EBC, &v39 - 4, v41, v28, v33);
        (*(void (**)(char *, uint64_t))(v48 + 8))(v53, v28);
        BOOL v34 = __OFSUB__(a3, v32);
        a3 -= v32;
        if (v34) {
          goto LABEL_17;
        }
        (*(void (**)(char *, uint64_t))(v45 + 8))(v20, a4);
        ++v24;
        if (a3 <= 0) {
          goto LABEL_14;
        }
      }

      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      swift_once(&qword_3A7D18, sub_2384DC);
    }

uint64_t sub_235E30@<X0>( uint64_t *a1@<X0>, int64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int **a5@<X8>)
{
  uint64_t v13 = *a1;
  uint64_t v12 = _swiftEmptyArrayStorage;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A8060);
  unint64_t v10 = sub_2350B8();
  return sub_235A6C(&v13, (uint64_t)&v12, a2, a3, v9, a4, v10, a5);
}

size_t sub_235EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_216EC4(*(void *)(v2 + 24), a1, a2);
  return sub_234748(v3, v4, v5, v6);
}

uint64_t type metadata accessor for ANSIKDFx963(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ANSIKDFx963);
}

uint64_t sub_235F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a3 - 8);
  __chkstk_darwin();
  unint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(uint64_t, uint64_t))(v11 + 32))(v12, v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 40))(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a4 + 48))(a3, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, a3);
}

uint64_t sub_235FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  a5,  a3,  &protocol requirements base descriptor for DataProtocol,  &associated type descriptor for DataProtocol.Regions);
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness, v12);
  uint64_t v14 = &v17[-v13];
  dispatch thunk of DataProtocol.regions.getter(a3, a5);
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  uint64_t v22 = v5;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( a5,  a3,  AssociatedTypeWitness,  &protocol requirements base descriptor for DataProtocol,  &associated conformance descriptor for DataProtocol.DataProtocol.Regions: BidirectionalCollection);
  Sequence.forEach(_:)( sub_2362BC,  v17,  AssociatedTypeWitness,  *(void *)(*(void *)(AssociatedConformanceWitness + 8) + 8LL));
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v11 + 8))(v14, AssociatedTypeWitness);
}

uint64_t sub_2360E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *(void *)(a2 - 8);
  __chkstk_darwin(a1, a2);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(uint64_t, uint64_t))(v13 + 32))(v14, v13);
  sub_235FD8(a1, a2, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t))(a4 + 48))(a2, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, a2);
}

uint64_t sub_2361C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  a6,  a4,  &protocol requirements base descriptor for DataProtocol,  &associated type descriptor for DataProtocol.Regions);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( a6,  a4,  AssociatedTypeWitness,  &protocol requirements base descriptor for DataProtocol,  &associated conformance descriptor for DataProtocol.DataProtocol.Regions: BidirectionalCollection);
  uint64_t v10 = swift_getAssociatedTypeWitness( 0LL,  *(void *)(*(void *)(AssociatedConformanceWitness + 8) + 8LL),  AssociatedTypeWitness,  &protocol requirements base descriptor for Sequence,  &associated type descriptor for Sequence.Element);
  uint64_t v11 = swift_getAssociatedConformanceWitness( a6,  a4,  v10,  &protocol requirements base descriptor for DataProtocol,  &associated conformance descriptor for DataProtocol.DataProtocol.Regions.Sequence.Element: ContiguousBytes);
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)( sub_2362EC,  v13,  (char *)&type metadata for () + 8,  v10,  v11);
}

uint64_t sub_2362BC(uint64_t a1)
{
  return sub_2361C0(a1, v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_2362DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t sub_2362E4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_2362EC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(v2 + 32) + 40LL))( a1,  a2,  *(void *)(v2 + 16));
}

uint64_t sub_236320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[2] = a3;
  v7[3] = a4;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a2;
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(sub_2363FC, v7, &type metadata for Bool, a3, a5);
  return v8;
}

unint64_t sub_236384@<X0>( char *a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, BOOL *a5@<X8>)
{
  unint64_t result = a4 - (void)a3;
  if (a3) {
    uint64_t v8 = a4 - (void)a3;
  }
  else {
    uint64_t v8 = 0LL;
  }
  if (a1)
  {
    if (v8 == a2 - (void)a1)
    {
      if (a3)
      {
        unint64_t result = cc_cmp_safe(result, a3, a1);
        BOOL v9 = (_DWORD)result == 0;
LABEL_10:
        *a5 = v9;
        return result;
      }

      goto LABEL_12;
    }

uint64_t sub_2363FC(uint64_t a1, uint64_t a2)
{
  v6[3] = a2;
  uint64_t v3 = *(void *)(v2 + 24);
  uint64_t v4 = *(void *)(v2 + 40);
  v6[2] = a1;
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(sub_236440, v6, &type metadata for Bool, v3, v4);
}

unint64_t sub_236440@<X0>(char *a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  return sub_236384(a1, a2, *(char **)(v3 + 16), *(void *)(v3 + 24), a3);
}

void sub_236458(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_2364B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = v4;
  __int16 v8 = v5;
  char v9 = BYTE2(v5);
  char v10 = BYTE3(v5);
  char v11 = BYTE4(v5);
  char v12 = BYTE5(v5);
  return sub_21EBE0((uint64_t)&v7, (uint64_t)&v7 + BYTE6(v5), a3, a4) & 1;
}

uint64_t sub_236634@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t result = sub_236678(&v5, 16LL, v6);
  uint64_t v4 = v6[1];
  *a2 = v6[0];
  a2[1] = v4;
  return result;
}

uint64_t sub_236678@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t result = swift_beginAccess(*a1 + 16, v13, 0LL, 0LL);
  unint64_t v7 = *(void *)(v5 + 16);
  if (v7 >> 60)
  {
    __break(1u);
  }

  else
  {
    uint64_t v8 = 8 * v7;
    if (v8 != 128 && v8 != 192 && v8 != 256) {
      goto LABEL_14;
    }
    uint64_t result = getCMACContextSize();
    if ((result & 0x8000000000000000LL) == 0)
    {
      size_t v9 = result;
      if (result)
      {
        char v10 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(result, &type metadata for UInt8);
        v10[2] = v9;
        bzero(v10 + 4, v9);
      }

      else
      {
        char v10 = _swiftEmptyArrayStorage;
      }

      unint64_t v11 = *(void *)(v5 + 16);
      char v12 = ccaes_cbc_encrypt_mode();
      LODWORD(v11) = cccmac_init(v12, (uint64_t)(v10 + 4), v11, v5 + 32);
      uint64_t result = swift_release(v5);
      if (!(_DWORD)v11)
      {
        *a3 = v10;
        a3[1] = a2;
        return result;
      }

      goto LABEL_13;
    }
  }

  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_23677C(char *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native(*v2);
  if ((result & 1) != 0)
  {
    if (a1) {
      goto LABEL_3;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  uint64_t result = (uint64_t)sub_237300(v5);
  uint64_t v5 = result;
  if (!a1) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t result = cccmac_update((void *)(v5 + 32), a2 - (void)a1, a1);
  if (!(_DWORD)result)
  {
    *uint64_t v2 = v5;
    return result;
  }

uint64_t sub_2367E8@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v8 = sub_215730(v1[1]);
  uint64_t v9 = v4;
  sub_23EC90((uint64_t)&v8);
  swift_bridgeObjectRetain(v3);
  sub_236EDC((uint64_t)&v8);
  sub_2144FC(v8, v9);
  *a1 = v5;
  a1[1] = v6;
  return swift_bridgeObjectRelease(v3);
}

uint64_t sub_236860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  a3,  a2,  &protocol requirements base descriptor for DataProtocol,  &associated type descriptor for DataProtocol.Regions);
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness, v8);
  char v10 = &v13[-v9];
  dispatch thunk of DataProtocol.regions.getter(a2, a3);
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  uint64_t v16 = v3;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( a3,  a2,  AssociatedTypeWitness,  &protocol requirements base descriptor for DataProtocol,  &associated conformance descriptor for DataProtocol.DataProtocol.Regions: BidirectionalCollection);
  Sequence.forEach(_:)( sub_237328,  v13,  AssociatedTypeWitness,  *(void *)(*(void *)(AssociatedConformanceWitness + 8) + 8LL));
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v10, AssociatedTypeWitness);
}

uint64_t sub_236960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v11[2] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  a4,  a3,  &protocol requirements base descriptor for DataProtocol,  &associated type descriptor for DataProtocol.Regions);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( a4,  a3,  AssociatedTypeWitness,  &protocol requirements base descriptor for DataProtocol,  &associated conformance descriptor for DataProtocol.DataProtocol.Regions: BidirectionalCollection);
  uint64_t v8 = swift_getAssociatedTypeWitness( 0LL,  *(void *)(*(void *)(AssociatedConformanceWitness + 8) + 8LL),  AssociatedTypeWitness,  &protocol requirements base descriptor for Sequence,  &associated type descriptor for Sequence.Element);
  uint64_t v9 = swift_getAssociatedConformanceWitness( a4,  a3,  v8,  &protocol requirements base descriptor for DataProtocol,  &associated conformance descriptor for DataProtocol.DataProtocol.Regions.Sequence.Element: ContiguousBytes);
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)( sub_237704,  v11,  (char *)&type metadata for () + 8,  v8,  v9);
}

uint64_t sub_236A54(char *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native(*a3);
  *a3 = v6;
  if ((result & 1) != 0)
  {
    if (a1) {
      goto LABEL_3;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  uint64_t result = (uint64_t)sub_237300(v6);
  uint64_t v6 = result;
  *a3 = result;
  if (!a1) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t result = cccmac_update((void *)(v6 + 32), a2 - (void)a1, a1);
  if (!(_DWORD)result)
  {
    *a3 = v6;
    return result;
  }

uint64_t sub_236ADC()
{
  return ((uint64_t (*)(void))((char *)&loc_236AF0 + dword_236B34[*(void *)(v0 + 8) >> 62]))(0LL);
}

uint64_t sub_236B00()
{
  return BYTE6(v0);
}

uint64_t sub_236B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Data.withUnsafeBytes<A>(_:)(a1, a2, *v3, v3[1], a3);
}

uint64_t sub_236B60(uint64_t a1)
{
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  sub_1F83C0(v4, v3);
  Data.hash(into:)(a1, v4, v3);
  return sub_1F86D4(v4, v3);
}

Swift::Int sub_236BAC()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  Hasher.init(_seed:)(v4);
  sub_1F83C0(v1, v2);
  Data.hash(into:)(v4, v1, v2);
  sub_1F86D4(v1, v2);
  return Hasher._finalize()();
}

uint64_t sub_236C0C()
{
  return ((uint64_t (*)(void))((char *)&loc_236C20 + dword_236C64[*(void *)(v0 + 8) >> 62]))(0LL);
}

uint64_t sub_236C30()
{
  return BYTE6(v0);
}

Swift::Int sub_236C74()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  Hasher.init(_seed:)(v4);
  sub_1F83C0(v1, v2);
  Data.hash(into:)(v4, v1, v2);
  sub_1F86D4(v1, v2);
  return Hasher._finalize()();
}

uint64_t sub_236CD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236B44(a1, a2, a3);
}

uint64_t sub_236CE4()
{
  return sub_236CEC(*(void *)v0, *(void *)(v0 + 8));
}

uint64_t sub_236CEC(uint64_t a1, unint64_t a2)
{
  uint64_t v19 = 0x203A43414DLL;
  unint64_t v20 = 0xE500000000000000LL;
  sub_1F83C0(a1, a2);
  uint64_t v4 = sub_2284CC(a1, a2);
  uint64_t result = sub_1F86D4(a1, a2);
  uint64_t v6 = *(void *)(v4 + 16);
  if (v6 + 0x4000000000000000LL < 0)
  {
    __break(1u);
    goto LABEL_8;
  }

  size_t v7 = 2 * v6;
  if (2 * v6 < 0)
  {
LABEL_8:
    __break(1u);
    return result;
  }

  if (v6)
  {
    uint64_t v8 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(2 * v6, &type metadata for UInt8);
    v8[2] = v7;
    bzero(v8 + 4, v7);
  }

  else
  {
    uint64_t v8 = _swiftEmptyArrayStorage;
  }

  uint64_t v17 = 0LL;
  uint64_t v18 = v8;
  uint64_t v9 = Array<A>.regions.getter(v4);
  sub_2127F4(v4, (uint64_t *)&v18, &v17);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = (uint64_t)v18;
  unint64_t v11 = v18 + 4;
  uint64_t v12 = v18[2];
  swift_bridgeObjectRetain(v18);
  uint64_t v13 = static String._fromUTF8Repairing(_:)(v11, v12);
  uint64_t v15 = v14;
  swift_release(v4);
  swift_bridgeObjectRelease_n(v10, 2LL);
  v16._countAndFlagsBits = v13;
  v16._object = v15;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v15);
  return v19;
}

uint64_t sub_236E28@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  sub_225C70(v4, v3);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t result = sub_1F86D4(v4, v3);
  *a1 = v6;
  a1[1] = v8;
  return result;
}

uint64_t sub_236E7C()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = sub_2284CC(v1, v2);
  sub_1F86D4(v1, v2);
  return v3;
}

uint64_t sub_236EC0(void *a1, _BYTE *a2, uint64_t a3)
{
  return sub_2291A8(a1, a2, a3, *(void *)v3, *(void *)(v3 + 8));
}

void sub_236EC8(uint64_t *a1)
{
}

void sub_236EDC(uint64_t a1)
{
  __asm { BR              X12 }

uint64_t sub_236F38()
{
  uint64_t v8 = v0;
  LOWORD(v9) = v3;
  BYTE2(v9) = BYTE2(v3);
  HIBYTE(v9) = BYTE3(v3);
  unsigned __int8 v10 = BYTE4(v3);
  unsigned __int8 v11 = BYTE5(v3);
  unsigned __int8 v12 = BYTE6(v3);
  uint64_t v4 = *v1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  *uint64_t v1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = sub_237300((uint64_t)v4);
    *uint64_t v1 = v4;
  }

  uint64_t result = cccmac_final_generate(v4 + 32, BYTE6(v3), &v8);
  if ((_DWORD)result)
  {
    __break(1u);
    JUMPOUT(0x237134LL);
  }

  *uint64_t v1 = v4;
  unint64_t v7 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *unint64_t v2 = v8;
  v2[1] = v7;
  return result;
}

uint64_t sub_237184(char *a1, char **a2)
{
  int64_t v5 = *(int *)a1;
  uint64_t v6 = *((int *)a1 + 1);
  if ((int)v6 < (int)v5)
  {
    __break(1u);
  }

  else
  {
    a1 = (char *)*((void *)a1 + 1);
    uint64_t result = __DataStorage._bytes.getter();
    if (!result) {
      goto LABEL_13;
    }
    unint64_t v2 = (char *)result;
    uint64_t v8 = __DataStorage._offset.getter();
    int64_t v9 = v5 - v8;
    if (!__OFSUB__(v5, v8))
    {
      int64_t v5 = v6 - v5;
      uint64_t v10 = __DataStorage._length.getter();
      if (v10 < v5) {
        int64_t v5 = v10;
      }
      v2 += v9;
      a1 = *a2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a2);
      *a2 = a1;
      if ((isUniquelyReferenced_nonNull_native & 1) != 0) {
        goto LABEL_7;
      }
      goto LABEL_11;
    }
  }

  __break(1u);
LABEL_11:
  a1 = sub_237300((uint64_t)a1);
  *a2 = a1;
LABEL_7:
  uint64_t result = cccmac_final_generate(a1 + 32, v5, v2);
  if (!(_DWORD)result)
  {
    *a2 = a1;
    return result;
  }

  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_237254(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v8 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }

    v8 += a1 - result;
  }

  BOOL v9 = __OFSUB__(a2, a1);
  uint64_t v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v11 = __DataStorage._length.getter();
  if (v11 >= v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = v8 + v12;
  if (v8) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0LL;
  }
  a3(&v16, v8, v14);
  if (!v3) {
    char v15 = v16;
  }
  return v15 & 1;
}

char *sub_237300(uint64_t a1)
{
  return sub_2121E4(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_237314(uint64_t a1)
{
  return sub_21234C(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_237328(uint64_t a1)
{
  return sub_236960(a1, v1[4], v1[2], v1[3]);
}

unint64_t sub_237348()
{
  unint64_t result = qword_3A8E10;
  if (!qword_3A8E10)
  {
    unint64_t result = swift_getWitnessTable(&unk_281C04, &_s4CMACV3MACVN);
    atomic_store(result, (unint64_t *)&qword_3A8E10);
  }

  return result;
}

unint64_t sub_23738C(void *a1)
{
  a1[1] = sub_2373C8();
  a1[2] = sub_23740C();
  a1[3] = sub_237450();
  unint64_t result = sub_237494();
  a1[4] = result;
  return result;
}

unint64_t sub_2373C8()
{
  unint64_t result = qword_3A8E50;
  if (!qword_3A8E50)
  {
    unint64_t result = swift_getWitnessTable(&unk_281C60, &_s4CMACV3MACVN);
    atomic_store(result, (unint64_t *)&qword_3A8E50);
  }

  return result;
}

unint64_t sub_23740C()
{
  unint64_t result = qword_3A8E58;
  if (!qword_3A8E58)
  {
    unint64_t result = swift_getWitnessTable(&unk_281C88, &_s4CMACV3MACVN);
    atomic_store(result, (unint64_t *)&qword_3A8E58);
  }

  return result;
}

unint64_t sub_237450()
{
  unint64_t result = qword_3A8E60;
  if (!qword_3A8E60)
  {
    unint64_t result = swift_getWitnessTable(&unk_281C20, &_s4CMACV3MACVN);
    atomic_store(result, (unint64_t *)&qword_3A8E60);
  }

  return result;
}

unint64_t sub_237494()
{
  unint64_t result = qword_3A8E68;
  if (!qword_3A8E68)
  {
    unint64_t result = swift_getWitnessTable(&unk_281CB0, &_s4CMACV3MACVN);
    atomic_store(result, (unint64_t *)&qword_3A8E68);
  }

  return result;
}

unint64_t sub_2374DC()
{
  unint64_t result = qword_3A8E70;
  if (!qword_3A8E70)
  {
    unint64_t result = swift_getWitnessTable(&unk_281D18, &_s4CMACV3MACVN);
    atomic_store(result, (unint64_t *)&qword_3A8E70);
  }

  return result;
}

unint64_t sub_237524()
{
  unint64_t result = qword_3A80B8;
  if (!qword_3A80B8)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_3A80C0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for IndexingIterator<A>, v1);
    atomic_store(result, (unint64_t *)&qword_3A80B8);
  }

  return result;
}

uint64_t *_s4CMACVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t _s4CMACVwxx(void *a1)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t *_s4CMACVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[1] = a2[1];
  return a1;
}

uint64_t *_s4CMACVwta(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  a1[1] = a2[1];
  return a1;
}

uint64_t _s4CMACVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t _s4CMACVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *_s4CMACVMa()
{
  return &_s4CMACVN;
}

ValueMetadata *_s4CMACV3MACVMa()
{
  return &_s4CMACV3MACVN;
}

uint64_t sub_2376D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_21EBE0(a1, a2, **(void **)(v3 + 16), *(void *)(*(void *)(v3 + 16) + 8LL));
  if (!v4) {
    *a3 = result & 1;
  }
  return result;
}

uint64_t sub_237704(char *a1, uint64_t a2)
{
  return sub_236A54(a1, a2, *(uint64_t **)(v2 + 16));
}

uint64_t sub_237720(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_3A80C0);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(sub_237C24, 0LL, v4, a1, v3);
  return v6;
}

uint64_t sub_237784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23C734(a1, a2, a3, a3, *(void *)(a4 + 8), *(void *)(a4 + 8));
}

uint64_t sub_237794(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = __chkstk_darwin(a1, a2);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = _typeName(_:qualified:)(v6, 0LL);
  uint64_t v27 = v9;
  v10._countAndFlagsBits = 8250LL;
  v10._object = (void *)0xE200000000000000LL;
  String.append(_:)(v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v2, a1);
  uint64_t result = Array.init<A>(_:)(v8, &type metadata for UInt8, a1, *(void *)(a2 + 32));
  uint64_t v12 = *(void *)(result + 16);
  if (v12 + 0x4000000000000000LL < 0)
  {
    __break(1u);
    goto LABEL_8;
  }

  size_t v13 = 2 * v12;
  if (2 * v12 < 0)
  {
LABEL_8:
    __break(1u);
    return result;
  }

  uint64_t v14 = result;
  if (v12)
  {
    char v15 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(2 * v12, &type metadata for UInt8);
    v15[2] = v13;
    bzero(v15 + 4, v13);
  }

  else
  {
    char v15 = _swiftEmptyArrayStorage;
  }

  uint64_t v24 = 0LL;
  uint64_t v25 = v15;
  uint64_t v16 = Array<A>.regions.getter(v14);
  sub_2127F4(v14, (uint64_t *)&v25, &v24);
  swift_bridgeObjectRelease(v16);
  uint64_t v17 = (uint64_t)v25;
  uint64_t v18 = v25[2];
  swift_bridgeObjectRetain(v25);
  uint64_t v19 = static String._fromUTF8Repairing(_:)(v17 + 32, v18);
  uint64_t v21 = v20;
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease_n(v17, 2LL);
  v22._countAndFlagsBits = v19;
  v22._object = v21;
  String.append(_:)(v22);
  swift_bridgeObjectRelease(v21);
  return v26;
}

uint64_t sub_237920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v48 = a5;
  uint64_t v49 = a1;
  uint64_t v50 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  a6,  a4,  &protocol requirements base descriptor for DataProtocol,  &associated type descriptor for DataProtocol.Regions);
  uint64_t v10 = *(void *)(swift_getAssociatedConformanceWitness( a6,  a4,  AssociatedTypeWitness,  &protocol requirements base descriptor for DataProtocol,  &associated conformance descriptor for DataProtocol.DataProtocol.Regions: BidirectionalCollection)
                  + 8);
  uint64_t v46 = swift_getAssociatedTypeWitness( 255LL,  *(void *)(v10 + 8),  AssociatedTypeWitness,  &protocol requirements base descriptor for Sequence,  &associated type descriptor for Sequence.Element);
  uint64_t v11 = type metadata accessor for Optional(0LL, v46);
  uint64_t v13 = __chkstk_darwin(v11, v12);
  uint64_t v45 = (char *)&v43 - v14;
  uint64_t v43 = *(void *)(a4 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = swift_checkMetadataState(0LL, AssociatedTypeWitness);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v21 = __chkstk_darwin(v18, v20);
  uint64_t v23 = (char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21, v24);
  uint64_t v26 = (char *)&v43 - v25;
  uint64_t v47 = a6;
  dispatch thunk of DataProtocol.regions.getter(a4, a6);
  uint64_t v44 = v10;
  uint64_t v27 = dispatch thunk of Collection.count.getter(v18, v10);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v19 + 8);
  v28(v26, v18);
  if (v27 != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v17, a2, a4);
    uint64_t v40 = Data.init<A>(_:)(v17, a4, *(void *)(*(void *)(*(void *)(*(void *)(v47 + 8) + 8LL) + 8LL) + 8LL));
    unint64_t v42 = v41;
    v51[0] = v40;
    v51[1] = v41;
    char v39 = sub_23C734(v49, v51, v50, &type metadata for Data, *(void *)(v48 + 8), &protocol witness table for Data);
    sub_1F86D4(v40, v42);
    return v39 & 1;
  }

  uint64_t v29 = v48;
  uint64_t v30 = v49;
  uint64_t v31 = v50;
  uint64_t v32 = v47;
  dispatch thunk of DataProtocol.regions.getter(a4, v47);
  uint64_t v33 = v45;
  Collection.first.getter(v18, v44);
  v28(v23, v18);
  uint64_t v34 = v46;
  uint64_t v35 = *(void *)(v46 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1LL, v46);
  if ((_DWORD)result != 1)
  {
    uint64_t v37 = *(void *)(v29 + 8);
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v32,  a4,  v34,  &protocol requirements base descriptor for DataProtocol,  &associated conformance descriptor for DataProtocol.DataProtocol.Regions.Sequence.Element: ContiguousBytes);
    char v39 = sub_23C734(v30, v33, v31, v34, v37, AssociatedConformanceWitness);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v33, v34);
    return v39 & 1;
  }

  __break(1u);
  return result;
}

void *sub_237C24@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (a1) {
    int64_t v4 = a2 - (void)a1;
  }
  else {
    int64_t v4 = 0LL;
  }
  uint64_t result = sub_23B5A4(a1, v4);
  *a3 = result;
  a3[1] = 0LL;
  return result;
}

uint64_t type metadata accessor for SecureBytes.Backing(uint64_t a1)
{
  uint64_t result = qword_3A8E80;
  if (!qword_3A8E80) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SecureBytes.Backing);
  }
  return result;
}

uint64_t sub_237C98(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_3AE7C0);
}

uint64_t sub_237CD4(uint64_t result, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  if (!a2)
  {
    uint64_t v6 = 0LL;
    goto LABEL_14;
  }

  uint64_t v6 = a3;
  if (!a3)
  {
LABEL_14:
    *uint64_t v5 = a4;
    v5[1] = v6;
    return v6;
  }

  if ((a3 & 0x8000000000000000LL) == 0)
  {
    uint64_t result = swift_beginAccess(a4 + 16, v11, 0LL, 0LL);
    uint64_t v8 = *(void *)(a4 + 16);
    if (v8)
    {
      *a2 = *(_BYTE *)(a4 + 32);
      uint64_t v9 = v6 - 1;
      if (v6 != 1)
      {
        uint64_t v10 = 0LL;
        while (v9 != v10)
        {
          if (__OFSUB__(v8, v10 + 1)) {
            goto LABEL_16;
          }
          if (v8 - 1 == v10) {
            goto LABEL_13;
          }
          a2[v10 + 1] = *(_BYTE *)(a4 + 33 + v10);
          if (v9 == ++v10) {
            goto LABEL_14;
          }
        }

        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }

    else
    {
LABEL_13:
      uint64_t v6 = v8;
    }

    goto LABEL_14;
  }

uint64_t ***sub_237DA8(uint64_t ***result, void *a2, char a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v7 = *result;
  if ((a3 & 1) == 0) {
    goto LABEL_8;
  }
  if (!v7)
  {
    __break(1u);
    goto LABEL_18;
  }

  uint64_t result = (uint64_t ***)a5();
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  uint64_t v8 = result;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  v14[0] = v8;
  swift_dynamicCast(&v13, v14, (char *)&type metadata for Any + 8, v15, 7LL);
  uint64_t v9 = v13;
  int v12 = 0;
  uint64_t result = (uint64_t ***)ccrng(&v12);
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t result = (uint64_t ***)ccec_compact_generate_key(v9, (uint64_t (**)(void, uint64_t, uint64_t *))result, v7);
  if (!(_DWORD)result)
  {
LABEL_13:
    *a2 = a4;
    return result;
  }

  __break(1u);
LABEL_8:
  if (!v7)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  uint64_t result = (uint64_t ***)a5();
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  uint64_t v10 = result;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  v14[0] = v10;
  swift_dynamicCast(&v13, v14, (char *)&type metadata for Any + 8, v15, 7LL);
  uint64_t v11 = v13;
  int v12 = 0;
  uint64_t result = (uint64_t ***)ccrng(&v12);
  if (result)
  {
    if (!v12)
    {
      uint64_t result = (uint64_t ***)ccec_generate_key_fips(v11, (uint64_t (**)(void, uint64_t, uint64_t *))result, v7);
      if (!(_DWORD)result) {
        goto LABEL_13;
      }
LABEL_16:
      __break(1u);
    }

void sub_237F30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }

void sub_237F9C()
{
  uint64_t v7 = v2;
  __int16 v8 = v3;
  char v9 = BYTE2(v3);
  char v10 = BYTE3(v3);
  char v11 = BYTE4(v3);
  char v12 = BYTE5(v3);
  sub_238204((uint64_t)&v7, (uint64_t)&v7 + BYTE6(v3), v6, v2, v3, v5, v4);
  *uint64_t v1 = v0;
}

void sub_238204(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void))
{
  if (a1)
  {
    if (*a3)
    {
      uint64_t v8 = a7();
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
        v11[0] = v9;
        swift_dynamicCast(&v10, v11, (char *)&type metadata for Any + 8, v12, 7LL);
        __asm { BR              X10 }
      }

uint64_t sub_238380(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3 + 32, a3 + 32 + *(void *)(a3 + 16));
}

size_t sub_2383F4(int64_t a1)
{
  uint64_t v2 = v1;
  int64_t v4 = (char *)*v2;
  size_t result = _swift_stdlib_malloc_size(*v2);
  if ((uint64_t)(result - 32) < a1)
  {
    if (a1 < 0)
    {
      __break(1u);
    }

    else if (!HIDWORD(a1))
    {
      if ((_DWORD)a1)
      {
        unsigned int v6 = (a1 - 1) | ((a1 - 1) >> 1) | ((((_DWORD)a1 - 1) | ((a1 - 1) >> 1)) >> 2);
        unsigned int v7 = v6 | (v6 >> 4) | ((v6 | (v6 >> 4)) >> 8);
        int v8 = v7 | HIWORD(v7);
        if (v8 == -1) {
          uint64_t v9 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v9 = (v8 + 1);
        }
      }

      else
      {
        uint64_t v9 = 1LL;
      }

      uint64_t v10 = type metadata accessor for SecureBytes.Backing(0LL);
      uint64_t v11 = swift_allocObject(v10, v9 + 32, 7LL);
      *(void *)(v11 + 16) = 0LL;
      *(void *)(v11 + 24) = v9;
      size_t result = swift_beginAccess(v4 + 16, v13, 0LL, 0LL);
      uint64_t v12 = *((void *)v4 + 2);
      if ((v12 & 0x8000000000000000LL) == 0)
      {
        sub_238930(v4, 0LL, v12);
        size_t result = swift_release(v4);
        *uint64_t v2 = (const void *)v11;
        return result;
      }

uint64_t sub_2384DC()
{
  uint64_t v0 = type metadata accessor for SecureBytes.Backing(0LL);
  uint64_t result = swift_allocObject(v0, 32LL, 7LL);
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = 0LL;
  off_3A8E78[0] = (int *)result;
  return result;
}

uint64_t sub_23850C(uint64_t **a1, uint64_t a2, uint64_t *a3, char a4, uint64_t a5, uint64_t (*a6)(void))
{
  uint64_t result = _swift_stdlib_malloc_size(a1);
  if (a2 < 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v14 = a1 + 4;
  uint64_t v15 = (uint64_t)a1 + result;
  uint64_t v16 = result - 32;
  uint64_t result = sub_2184E0(0LL, a2, result - 32, (uint64_t)v14, v15);
  if ((v17 & 1) != 0) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = result;
  }
  if (v18 < 0) {
    goto LABEL_10;
  }
  v23[0] = v14;
  v23[1] = (uint64_t **)((char *)v14 + v18);
  uint64_t v22 = 0LL;
  uint64_t result = (uint64_t)sub_237DA8(v23, &v22, a4 & 1, a5, a6);
  if (!v6)
  {
    uint64_t v19 = *a3;
    uint64_t v20 = v22;
    uint64_t result = swift_beginAccess(v19 + 16, &v21, 1LL, 0LL);
    *(void *)(v19 + 16) = v20;
  }

  return result;
}

uint64_t sub_2385F0( char *a1, uint64_t a2, uint64_t *a3, unint64_t **a4, unint64_t **a5, unint64_t *a6, uint64_t a7)
{
  size_t v14 = _swift_stdlib_malloc_size(a1);
  if (a2 < 0)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v15 = a1 + 32;
  uint64_t v16 = (uint64_t)&a1[v14];
  size_t v17 = v14 - 32;
  uint64_t v18 = sub_2184E0(0LL, a2, v14 - 32, (uint64_t)v15, v16);
  if ((v19 & 1) != 0) {
    uint64_t v20 = v17;
  }
  else {
    uint64_t v20 = v18;
  }
  if (v20 < 0) {
    goto LABEL_12;
  }
  v29[0] = 0;
  uint64_t v21 = ccrng(v29);
  if (!v21) {
    goto LABEL_14;
  }
  if (v29[0])
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }

  int v22 = ccecdh_compute_shared_secret(a4, a5, a6, v15, (uint64_t (**)(void, uint64_t, uint64_t *))v21);
  if (v22)
  {
    int v23 = v22;
    unint64_t v24 = sub_21719C();
    uint64_t v25 = swift_allocError(&type metadata for CryptoKitError, v24, 0LL, 0LL);
    *(_DWORD *)uint64_t v26 = v23;
    *(_BYTE *)(v26 + 4) = 0;
    return swift_willThrow(v25);
  }

  else
  {
    uint64_t v28 = *a3;
    uint64_t result = swift_beginAccess(v28 + 16, v29, 1LL, 0LL);
    *(void *)(v28 + 16) = a7;
  }

  return result;
}

uint64_t sub_23874C(const void *a1, uint64_t a2, uint64_t *a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = _swift_stdlib_malloc_size(a1);
  if (a2 < 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }

  char v19 = a3;
  uint64_t v12 = (uint64_t)a1 + 32;
  uint64_t v13 = (uint64_t)a1 + result;
  uint64_t v14 = result - 32;
  uint64_t result = sub_2184E0(0LL, a2, result - 32, v12, v13);
  if ((v15 & 1) != 0) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = result;
  }
  if (v16 < 0) {
    goto LABEL_10;
  }
  v21[0] = v12;
  v21[1] = v12 + v16;
  uint64_t v22 = 0LL;
  sub_237F30((uint64_t)v21, (uint64_t)&v22, a4, a5);
  if (!v5)
  {
    uint64_t v17 = *v19;
    uint64_t v18 = v22;
    swift_beginAccess(*v19 + 16, v20, 1LL, 0LL);
    *(void *)(v17 + 16) = v18;
  }

  return sub_1F86D4(a4, a5);
}

uint64_t sub_23885C( const void *a1, uint64_t a2, uint64_t (*a3)(void *, uint64_t *), uint64_t a4, uint64_t *a5)
{
  uint64_t result = _swift_stdlib_malloc_size(a1);
  if (a2 < 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v11 = (uint64_t)a1 + 32;
  uint64_t v12 = (uint64_t)a1 + result;
  uint64_t v13 = result - 32;
  uint64_t result = sub_2184E0(0LL, a2, result - 32, v11, v12);
  if ((v14 & 1) != 0) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = result;
  }
  if (v15 < 0) {
    goto LABEL_10;
  }
  v19[0] = v11;
  v19[1] = v11 + v15;
  uint64_t v20 = 0LL;
  uint64_t result = a3(v19, &v20);
  if (!v5)
  {
    uint64_t v16 = *a5;
    uint64_t v17 = v20;
    uint64_t result = swift_beginAccess(v16 + 16, v18, 1LL, 0LL);
    *(void *)(v16 + 16) = v17;
  }

  return result;
}

char *sub_238930(char *result, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_11;
  }

  int64_t v4 = v3;
  unsigned int v7 = result;
  uint64_t result = (char *)_swift_stdlib_malloc_size(result);
  if ((uint64_t)(result - 32) < a3)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  size_t v8 = _swift_stdlib_malloc_size(v4) - 32;
  uint64_t v9 = v4 + 2;
  uint64_t result = (char *)swift_beginAccess(v4 + 2, v17, 0LL, 0LL);
  uint64_t v10 = v4[2];
  size_t v11 = v8 - v10;
  if (__OFSUB__(v8, v10))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  BOOL v12 = __OFSUB__(a3, a2);
  size_t v13 = a3 - a2;
  if (v12)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  BOOL v12 = __OFSUB__(v11, v13);
  size_t v14 = v11 - v13;
  if (v12)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  if ((v14 & 0x8000000000000000LL) != 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  uint64_t result = (char *)_swift_stdlib_malloc_size(v4);
  if ((uint64_t)(result - 32) < v10)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t result = (char *)memmove((char *)v4 + v10 + 32, &v7[a2 + 32], v13);
  size_t v15 = *v9 + v13;
  if (!__OFADD__(*v9, v13))
  {
    uint64_t result = (char *)swift_beginAccess(v4 + 2, &v16, 1LL, 0LL);
    *uint64_t v9 = v15;
    return result;
  }

char *sub_238A40(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  size_t v4 = _swift_stdlib_malloc_size((const void *)v1) - 32;
  uint64_t result = (char *)swift_beginAccess(v1 + 16, v13, 1LL, 0LL);
  uint64_t v6 = *(void *)(v1 + 16);
  size_t v7 = v4 - v6;
  if (__OFSUB__(v4, v6))
  {
    __break(1u);
    goto LABEL_7;
  }

  BOOL v8 = __OFSUB__(v7, v3);
  size_t v9 = v7 - v3;
  if (v8)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if ((v9 & 0x8000000000000000LL) != 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  size_t v10 = _swift_stdlib_malloc_size((const void *)v1);
  uint64_t result = sub_23AD80((char *)(v1 + 32), v1 + v10, v6, a1);
  uint64_t v11 = *(void *)(v1 + 16);
  BOOL v8 = __OFADD__(v11, v3);
  uint64_t v12 = v11 + v3;
  if (!v8)
  {
    *(void *)(v1 + 16) = v12;
    return result;
  }

size_t sub_238B0C(char a1)
{
  uint64_t v2 = v1;
  size_t v4 = _swift_stdlib_malloc_size(v2) - 32;
  uint64_t v5 = v2 + 2;
  size_t result = swift_beginAccess(v2 + 2, v13, 0LL, 0LL);
  int64_t v7 = v2[2];
  size_t v8 = v4 - v7;
  if (__OFSUB__(v4, v7))
  {
    __break(1u);
    goto LABEL_8;
  }

  BOOL v9 = __OFSUB__(v8, 1LL);
  size_t v10 = v8 - 1;
  if (v9)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  if ((v10 & 0x8000000000000000LL) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  size_t result = _swift_stdlib_malloc_size(v2);
  if ((uint64_t)(result - 32) < v7)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  *((_BYTE *)v2 + v7 + 32) = a1;
  uint64_t v11 = *v5 + 1;
  if (!__OFADD__(*v5, 1LL))
  {
    size_t result = swift_beginAccess(v2 + 2, &v12, 1LL, 0LL);
    *uint64_t v5 = v11;
    return result;
  }

uint64_t sub_238BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_235040(a1, a2, a3, a4);
  size_t v10 = _swift_stdlib_malloc_size(v4) - 32;
  uint64_t result = swift_beginAccess(v4 + 2, v18, 1LL, 0LL);
  uint64_t v12 = v4[2];
  size_t v13 = v10 - v12;
  if (__OFSUB__(v10, v12))
  {
    __break(1u);
    goto LABEL_8;
  }

  BOOL v14 = __OFSUB__(v13, v9);
  size_t v15 = v13 - v9;
  if (v14)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  if ((v15 & 0x8000000000000000LL) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  uint64_t result = _swift_stdlib_malloc_size(v4);
  if (result - 32 < v12)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  uint64_t result = sub_23AE00(a1, a2, a3, a4, (uint64_t)v4 + v12 + 32);
  uint64_t v16 = v4[2];
  BOOL v14 = __OFADD__(v16, v9);
  uint64_t v17 = v16 + v9;
  if (!v14)
  {
    v4[2] = v17;
    return result;
  }

uint64_t sub_238CC0(const void *a1, size_t a2)
{
  uint64_t v3 = v2;
  size_t v6 = _swift_stdlib_malloc_size(v2) - 32;
  int64_t v7 = v2 + 2;
  uint64_t result = swift_beginAccess(v7, v13, 1LL, 0LL);
  uint64_t v9 = v3[2];
  size_t v10 = v6 - v9;
  if (__OFSUB__(v6, v9))
  {
    __break(1u);
    goto LABEL_11;
  }

  BOOL v11 = __OFSUB__(v10, a2);
  size_t v12 = v10 - a2;
  if (v11)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  if ((v12 & 0x8000000000000000LL) != 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  uint64_t result = _swift_stdlib_malloc_size(v3);
  if (result - 32 < v9)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  if (!a1) {
    goto LABEL_8;
  }
  if ((a2 & 0x8000000000000000LL) == 0)
  {
    uint64_t result = (uint64_t)memmove((char *)v3 + v9 + 32, a1, a2);
LABEL_8:
    if (!__OFADD__(*v7, a2))
    {
      *v7 += a2;
      return result;
    }

    goto LABEL_14;
  }

size_t sub_238D90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  size_t v4 = v3;
  uint64_t v8 = dispatch thunk of Collection.count.getter(a2, a3);
  size_t v9 = _swift_stdlib_malloc_size(v4) - 32;
  size_t result = swift_beginAccess(v4 + 2, v17, 1LL, 0LL);
  int64_t v11 = v4[2];
  size_t v12 = v9 - v11;
  if (__OFSUB__(v9, v11))
  {
    __break(1u);
    goto LABEL_8;
  }

  BOOL v13 = __OFSUB__(v12, v8);
  size_t v14 = v12 - v8;
  if (v13)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  if ((v14 & 0x8000000000000000LL) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  size_t result = _swift_stdlib_malloc_size(v4);
  if ((uint64_t)(result - 32) < v11)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  size_t result = UnsafeMutableRawBufferPointer.copyBytes<A>(from:)(a1, (char *)v4 + v11 + 32, (char *)v4 + result, a2, a3);
  uint64_t v15 = v4[2];
  BOOL v13 = __OFADD__(v15, v8);
  uint64_t v16 = v15 + v8;
  if (!v13)
  {
    v4[2] = v16;
    return result;
  }

void sub_238E7C(void *a1@<X8>)
{
  *a1 = 0LL;
}

uint64_t sub_238E84@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_beginAccess(v3 + 16, v5, 0LL, 0LL);
  *a1 = *(void *)(v3 + 16);
  return result;
}

uint64_t (*sub_238EC8(_BYTE *a1, void *a2))()
{
  *a1 = *(_BYTE *)(*v2 + *a2 + 32LL);
  return nullsub_1;
}

uint64_t sub_238EF0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v6 = *v2;
  uint64_t result = swift_beginAccess(v6 + 16, v9, 0LL, 0LL);
  uint64_t v8 = *(void *)(v6 + 16);
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (v5 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (v8 >= v4)
  {
    *a2 = v5;
    a2[1] = v4;
    a2[2] = v6;
    return swift_retain(v6);
  }

uint64_t sub_238F68@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_beginAccess(v3 + 16, v6, 0LL, 0LL);
  uint64_t v5 = *(void *)(v3 + 16);
  if (v5 < 0)
  {
    __break(1u);
  }

  else
  {
    *a1 = 0LL;
    a1[1] = v5;
  }

  return result;
}

BOOL sub_238FB4()
{
  uint64_t v1 = *v0;
  swift_beginAccess(*v0 + 16, v3, 0LL, 0LL);
  return *(void *)(v1 + 16) == 0LL;
}

void sub_238FF8(uint64_t a1@<X8>)
{
  *(void *)a1 = 0LL;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t *sub_239014(uint64_t *result, uint64_t *a2)
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

void *sub_239030(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

void *sub_23904C(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

void *sub_239068@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1LL)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1LL;
  }
  return result;
}

void *sub_239080(void *result)
{
  if (__OFADD__(*result, 1LL)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

void sub_239098(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0LL;
}

uint64_t sub_2390A4()
{
  uint64_t v1 = *v0;
  swift_beginAccess(*v0 + 16, v3, 0LL, 0LL);
  return *(void *)(v1 + 16);
}

void *sub_2390E0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_23B630(*v0);
  swift_release(v1);
  return v2;
}

uint64_t sub_239114(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  return sub_237CD4(a1, a2, a3, *v3);
}

uint64_t sub_23911C@<X0>(uint64_t (*a1)(uint64_t, void)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_239138(a1, a2, a3);
}

uint64_t sub_239138@<X0>(uint64_t (*a1)(uint64_t, void)@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return sub_23A588(a1, a2, a3);
}

void *sub_23915C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(*result, 1LL)) {
    __break(1u);
  }
  else {
    *a2 = *result - 1LL;
  }
  return result;
}

void *sub_239174(void *result)
{
  if (__OFSUB__(*result, 1LL)) {
    __break(1u);
  }
  else {
    --*result;
  }
  return result;
}

void *sub_23918C@<X0>(void *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }

  else
  {
    uint64_t v6 = *v3;
    uint64_t result = (void *)swift_beginAccess(v6 + 16, v7, 0LL, 0LL);
    if ((v5 & 0x8000000000000000LL) == 0 && *(void *)(v6 + 16) >= v5)
    {
      *a3 = v5;
      return result;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_2391F8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = sub_234134(*a1, a2, *a3, *v4);
  *(void *)a4 = result;
  *(_BYTE *)(a4 + 8) = v7 & 1;
  return result;
}

uint64_t sub_239230(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = *v2;
  uint64_t result = swift_beginAccess(v5 + 16, v8, 0LL, 0LL);
  uint64_t v7 = *(void *)(v5 + 16);
  if (v7 >= v4 && ((v4 | v3) & 0x8000000000000000LL) == 0 && v7 >= v3) {
    return v4 - v3;
  }
  __break(1u);
  return result;
}

_BYTE *sub_23929C(_BYTE *result, void *a2)
{
  *(_BYTE *)(*v2 + *a2 + 32LL) = *result;
  return result;
}

uint64_t (*sub_2392B4(uint64_t a1, uint64_t *a2))(uint64_t result)
{
  uint64_t v3 = *a2;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(*v2 + v3 + 32);
  return sub_2392E0;
}

uint64_t sub_2392E0(uint64_t result)
{
  *(_BYTE *)(**(void **)result + *(void *)(result + 8) + 32LL) = *(_BYTE *)(result + 16);
  return result;
}

uint64_t sub_2392F8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = a1[2];
  sub_23B490(v2, *a2, a2[1], *a1, a1[1], v3);
  return swift_release(v3);
}

void (*sub_239330(void *a1, uint64_t *a2))(void *a1)
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2393A8(v4, *a2, a2[1]);
  return sub_23937C;
}

void sub_23937C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

void (*sub_2393A8(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1)
{
  uint64_t v7 = malloc(0x48uLL);
  *a1 = v7;
  v7[7] = a3;
  v7[8] = v3;
  v7[6] = a2;
  uint64_t v8 = *v3;
  uint64_t result = (void (*)(uint64_t **))swift_beginAccess(*v3 + 16, v7 + 3, 0LL, 0LL);
  uint64_t v10 = *(void *)(v8 + 16);
  if (v10 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (v10 >= a3)
  {
    void *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    swift_retain(v8);
    return sub_23944C;
  }

void sub_23944C(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_23B490((uint64_t *)(*a1)[8], v1[6], (*a1)[7], *v1, v1[1], v1[2]);
  swift_release(v1[2]);
  free(v1);
}

uint64_t sub_239488@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_23B708(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void *sub_2394B0(void *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v4 = *a2;
  if (__OFSUB__(*a2, *result))
  {
    __break(1u);
  }

  else if (*a2 != *result)
  {
    uint64_t v5 = *v2 + 32LL;
    char v6 = *(_BYTE *)(v5 + v3);
    *(_BYTE *)(v5 + v3) = *(_BYTE *)(v5 + v4);
    *(_BYTE *)(v5 + v4) = v6;
  }

  return result;
}

uint64_t sub_2394E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)(a1, a2, a4, a3);
}

uint64_t sub_239504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)(a1, a2, a4, a3);
}

uint64_t sub_239524(int64_t a1, int64_t a2, size_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = (char *)*v3 + 16;
  uint64_t result = swift_beginAccess(v8, v24, 0LL, 0LL);
  int64_t v10 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_20;
  }

  BOOL v11 = __OFSUB__(*v8, v10);
  int64_t v12 = *v8 - v10;
  if (v11)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  uint64_t v13 = v12 + 1;
  if (__OFADD__(v12, 1LL))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  uint64_t result = swift_isUniquelyReferenced_nonNull_native(*v4);
  if ((_DWORD)result)
  {
    uint64_t result = _swift_stdlib_malloc_size(*v4);
    if (result - 32 >= v13)
    {
      if (a2 >= a1) {
        return sub_239A34(a1, a2, a3);
      }
      goto LABEL_26;
    }
  }

  if (v13 < 0) {
    goto LABEL_22;
  }
  if (HIDWORD(v13))
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  if ((_DWORD)v13)
  {
    unsigned int v14 = (v13 - 1) | ((v13 - 1) >> 1) | ((((_DWORD)v13 - 1) | ((v13 - 1) >> 1)) >> 2);
    unsigned int v15 = v14 | (v14 >> 4) | ((v14 | (v14 >> 4)) >> 8);
    int v16 = v15 | HIWORD(v15);
    if (v16 == -1) {
      uint64_t v17 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v17 = (v16 + 1);
    }
  }

  else
  {
    uint64_t v17 = 1LL;
  }

  uint64_t v18 = type metadata accessor for SecureBytes.Backing(0LL);
  uint64_t result = swift_allocObject(v18, v17 + 32, 7LL);
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = v17;
  if (a1 < 0) {
    goto LABEL_24;
  }
  char v19 = (const void *)result;
  uint64_t v20 = (char *)*v4;
  uint64_t result = swift_beginAccess((char *)*v4 + 16, &v23, 0LL, 0LL);
  uint64_t v21 = *((void *)v20 + 2);
  if (v21 < a2)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return result;
  }

  sub_238930(v20, 0LL, a1);
  sub_238B0C(a3);
  sub_238930((char *)*v4, a2, v21);
  uint64_t v22 = *v4;
  void *v4 = v19;
  return swift_release(v22);
}

size_t sub_2396C0(uint64_t a1, int64_t a2, void *a3, size_t a4)
{
  uint64_t v5 = v4;
  int64_t v10 = (char *)*v4 + 16;
  size_t result = swift_beginAccess(v10, v26, 0LL, 0LL);
  int64_t v12 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_20;
  }

  BOOL v13 = __OFSUB__(*v10, v12);
  int64_t v14 = *v10 - v12;
  if (v13)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  int64_t v15 = v14 + a4;
  if (__OFADD__(v14, a4))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  size_t result = swift_isUniquelyReferenced_nonNull_native(*v5);
  if ((_DWORD)result)
  {
    size_t result = _swift_stdlib_malloc_size(*v5);
    if ((uint64_t)(result - 32) >= v15)
    {
      if (a2 >= a1) {
        return sub_239B30(a1, a2, a3, a4);
      }
      goto LABEL_26;
    }
  }

  if (v15 < 0) {
    goto LABEL_22;
  }
  if (HIDWORD(v15))
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  if ((_DWORD)v15)
  {
    unsigned int v16 = (v15 - 1) | ((v15 - 1) >> 1) | ((((_DWORD)v15 - 1) | ((v15 - 1) >> 1)) >> 2);
    unsigned int v17 = v16 | (v16 >> 4) | ((v16 | (v16 >> 4)) >> 8);
    int v18 = v17 | HIWORD(v17);
    if (v18 == -1) {
      uint64_t v19 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v19 = (v18 + 1);
    }
  }

  else
  {
    uint64_t v19 = 1LL;
  }

  uint64_t v20 = type metadata accessor for SecureBytes.Backing(0LL);
  size_t result = swift_allocObject(v20, v19 + 32, 7LL);
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = v19;
  if (a1 < 0) {
    goto LABEL_24;
  }
  uint64_t v21 = (const void *)result;
  uint64_t v22 = (char *)*v5;
  size_t result = swift_beginAccess((char *)*v5 + 16, &v25, 0LL, 0LL);
  uint64_t v23 = *((void *)v22 + 2);
  if (v23 < a2)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return result;
  }

  sub_238930(v22, 0LL, a1);
  sub_238CC0(a3, a4);
  sub_238930((char *)*v5, a2, v23);
  unint64_t v24 = *v5;
  *uint64_t v5 = v21;
  return swift_release(v24);
}

size_t sub_239868(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v6 = v5;
  int64_t v12 = (char *)*v5 + 16;
  size_t result = swift_beginAccess(v12, v28, 0LL, 0LL);
  int64_t v14 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_20;
  }

  int64_t v15 = *v12 - v14;
  if (__OFSUB__(*v12, v14))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  size_t result = dispatch thunk of Collection.count.getter(a4, a5);
  BOOL v16 = __OFADD__(v15, result);
  int64_t v17 = v15 + result;
  if (v16)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  size_t result = swift_isUniquelyReferenced_nonNull_native(*v6);
  if ((_DWORD)result)
  {
    size_t result = _swift_stdlib_malloc_size(*v6);
    if ((uint64_t)(result - 32) >= v17)
    {
      if (a2 >= a1) {
        return sub_239C38(a1, a2, a3, a4, a5);
      }
      goto LABEL_26;
    }
  }

  if (v17 < 0) {
    goto LABEL_22;
  }
  if (HIDWORD(v17))
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  if ((_DWORD)v17)
  {
    unsigned int v18 = (v17 - 1) | ((v17 - 1) >> 1) | ((((_DWORD)v17 - 1) | ((v17 - 1) >> 1)) >> 2);
    unsigned int v19 = v18 | (v18 >> 4) | ((v18 | (v18 >> 4)) >> 8);
    int v20 = v19 | HIWORD(v19);
    if (v20 == -1) {
      uint64_t v21 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v21 = (v20 + 1);
    }
  }

  else
  {
    uint64_t v21 = 1LL;
  }

  uint64_t v22 = type metadata accessor for SecureBytes.Backing(0LL);
  size_t result = swift_allocObject(v22, v21 + 32, 7LL);
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = v21;
  if (a1 < 0) {
    goto LABEL_24;
  }
  uint64_t v23 = (const void *)result;
  unint64_t v24 = (char *)*v6;
  size_t result = swift_beginAccess((char *)*v6 + 16, &v27, 0LL, 0LL);
  uint64_t v25 = *((void *)v24 + 2);
  if (v25 < a2)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return result;
  }

  sub_238930(v24, 0LL, a1);
  sub_238D90(a3, a4, a5);
  sub_238930((char *)*v6, a2, v25);
  uint64_t v26 = *v6;
  *char v6 = v23;
  return swift_release(v26);
}

size_t sub_239A34(int64_t a1, int64_t a2, size_t a3)
{
  uint64_t v7 = v3 + 2;
  size_t result = swift_beginAccess(v3 + 2, v18, 0LL, 0LL);
  int64_t v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_10;
  }

  int64_t v10 = v3[2];
  int64_t v11 = v10 - v9;
  if (__OFSUB__(v10, v9))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  int64_t v12 = v11 + 1;
  if (__OFADD__(v11, 1LL))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  size_t result = _swift_stdlib_malloc_size(v3);
  if ((uint64_t)(result - 32) < v12)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  BOOL v13 = __OFSUB__(1LL, v9);
  uint64_t v14 = 1 - v9;
  if (v13)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  if (v10 < a2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  sub_23AA90(a2, v10, v14);
  size_t result = sub_23AB44(a3, a1);
  uint64_t v15 = v3[2];
  uint64_t v16 = v15 + v14;
  if (!__OFADD__(v15, v14))
  {
    size_t result = swift_beginAccess(v7, &v17, 1LL, 0LL);
    void *v7 = v16;
    return result;
  }

uint64_t sub_239B30(uint64_t a1, int64_t a2, void *a3, size_t a4)
{
  int64_t v9 = v4 + 2;
  uint64_t result = swift_beginAccess(v4 + 2, v20, 0LL, 0LL);
  int64_t v11 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_10;
  }

  int64_t v12 = v4[2];
  int64_t v13 = v12 - v11;
  if (__OFSUB__(v12, v11))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v14 = v13 + a4;
  if (__OFADD__(v13, a4))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  uint64_t result = _swift_stdlib_malloc_size(v4);
  if (result - 32 < v14)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  BOOL v15 = __OFSUB__(a4, v11);
  uint64_t v16 = a4 - v11;
  if (v15)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  if (v12 < a2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  sub_23AA90(a2, v12, v16);
  uint64_t result = (uint64_t)sub_23ABB4(a3, a4, a1);
  uint64_t v17 = v4[2];
  uint64_t v18 = v17 + v16;
  if (!__OFADD__(v17, v16))
  {
    uint64_t result = swift_beginAccess(v9, &v19, 1LL, 0LL);
    *int64_t v9 = v18;
    return result;
  }

uint64_t sub_239C38(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v6 = v5;
  uint64_t v12 = *(void *)(a4 - 8);
  __chkstk_darwin(a1, a2);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v16);
  uint64_t v17 = v6 + 2;
  uint64_t result = swift_beginAccess(v6 + 2, v30, 1LL, 0LL);
  int64_t v19 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_11;
  }

  int64_t v29 = a2;
  int64_t v20 = *v17 - v19;
  if (__OFSUB__(*v17, v19))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  uint64_t result = dispatch thunk of Collection.count.getter(a4, a5);
  BOOL v21 = __OFADD__(v20, result);
  int64_t v22 = v20 + result;
  if (v21)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v28 = a1;
  int64_t v23 = _swift_stdlib_malloc_size(v6) - 32;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, a4);
  if (v23 < v22)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  uint64_t result = dispatch thunk of Collection.count.getter(a4, a5);
  uint64_t v24 = result - v19;
  if (__OFSUB__(result, v19))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  uint64_t result = v29;
  if (*v17 < v29)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  sub_23AA90(v29, *v17, v24);
  sub_23AC5C(a3, v28, a4, a5);
  uint64_t result = dispatch thunk of Collection.count.getter(a4, a5);
  uint64_t v25 = result - v19;
  if (__OFSUB__(result, v19))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  BOOL v21 = __OFADD__(*v17, v25);
  int64_t v26 = *v17 + v25;
  if (!v21)
  {
    *uint64_t v17 = v26;
    return result;
  }

void *sub_239DC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(void *)(a2 - 8);
  __chkstk_darwin(a1, a2);
  int64_t v10 = &v21[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  v11,  a2,  &protocol requirements base descriptor for Sequence,  &associated type descriptor for Sequence.Iterator);
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness, v14);
  uint64_t v16 = &v21[-v15];
  int64_t v22 = v4;
  uint64_t result = dispatch thunk of Sequence.withContiguousStorageIfAvailable<A>(_:)( v23,  sub_23C530,  v21,  (char *)&type metadata for () + 8,  a2,  a3);
  if (LOBYTE(v23[0]) == 1)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v10, a1, a2);
    dispatch thunk of Sequence.makeIterator()(a2, a3);
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( a3,  a2,  AssociatedTypeWitness,  &protocol requirements base descriptor for Sequence,  &associated conformance descriptor for Sequence.Sequence.Iterator: IteratorProtocol);
    dispatch thunk of IteratorProtocol.next()(&v24, AssociatedTypeWitness, AssociatedConformanceWitness);
    if ((v24 & 0x100) == 0)
    {
      size_t v19 = v24;
      do
      {
        uint64_t v20 = *v4;
        swift_beginAccess(*v4 + 16LL, v23, 0LL, 0LL);
        sub_239524(*(void *)(v20 + 16), *(void *)(v20 + 16), v19);
        dispatch thunk of IteratorProtocol.next()(&v24, AssociatedTypeWitness, AssociatedConformanceWitness);
        size_t v19 = v24;
      }

      while (BYTE1(v24) != 1);
    }

    return (void *)(*(uint64_t (**)(_BYTE *, uint64_t))(v13 + 8))(v16, AssociatedTypeWitness);
  }

  return result;
}

uint64_t sub_239F98@<X0>(int **a1@<X8>)
{
  if (qword_3A7D18 != -1) {
    swift_once(&qword_3A7D18, sub_2384DC);
  }
  uint64_t v2 = off_3A8E78[0];
  *a1 = off_3A8E78[0];
  return swift_retain(v2);
}

uint64_t sub_239FE8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8LL))(a2, a3);
}

int *sub_23A03C@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, int **a3@<X8>)
{
  uint64_t result = sub_23C5A0(*a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return RangeReplaceableCollection.init<A>(_:)(a1, a4, a2, a5, a3);
}

uint64_t sub_23A07C(unsigned __int8 *a1)
{
  uint64_t v2 = *v1;
  size_t v3 = *a1;
  swift_beginAccess(*v1 + 16, v5, 0LL, 0LL);
  return sub_239524(*(void *)(v2 + 16), *(void *)(v2 + 16), v3);
}

uint64_t sub_23A0D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8LL))(a1, a2);
}

uint64_t sub_23A110(unsigned __int8 *a1, int64_t *a2)
{
  return sub_239524(*a2, *a2, *a1);
}

uint64_t sub_23A120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return RangeReplaceableCollection.insert<A>(contentsOf:at:)(a1, a2, a5, a3, a6, a4);
}

uint64_t sub_23A138@<X0>(int64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  int64_t v4 = *a1;
  uint64_t v5 = *v2;
  uint64_t result = swift_beginAccess(*v2 + 16, v9, 0LL, 0LL);
  if (!*(void *)(v5 + 16))
  {
    __break(1u);
    goto LABEL_6;
  }

  int64_t v7 = v4 + 1;
  if (__OFADD__(v4, 1LL))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (v7 >= v4)
  {
    char v8 = *(_BYTE *)(v5 + v4 + 32);
    uint64_t result = sub_23C3B4(v4, v7);
    *a2 = v8;
    return result;
  }

uint64_t sub_23A1B8(int64_t *a1)
{
  return sub_23C3B4(*a1, a1[1]);
}

void sub_23A1C4(_WORD *a1@<X8>)
{
  *a1 = 256;
}

uint64_t sub_23A1D0()
{
  return 0LL;
}

int64_t sub_23A1D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v3 = *v1;
  int64_t result = swift_beginAccess(*v1 + 16, v8, 0LL, 0LL);
  uint64_t v5 = *(void *)(v3 + 16);
  if (!v5)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  char v6 = *(_BYTE *)(v3 + 32);
  int64_t result = sub_234134(0LL, 1LL, v5, v3);
  if ((v7 & 1) == 0)
  {
    if ((result & 0x8000000000000000LL) == 0)
    {
      int64_t result = sub_23C3B4(0LL, result);
      *a1 = v6;
      return result;
    }

    goto LABEL_6;
  }

int64_t sub_23A260(int64_t result)
{
  if (result)
  {
    uint64_t v2 = result;
    if (result < 0)
    {
      __break(1u);
    }

    else
    {
      uint64_t v3 = *v1;
      swift_beginAccess(*v1 + 16, v5, 0LL, 0LL);
      int64_t result = sub_234134(0LL, v2, *(void *)(v3 + 16), v3);
      if ((v4 & 1) != 0)
      {
LABEL_9:
        __break(1u);
        return result;
      }

      if ((result & 0x8000000000000000LL) == 0) {
        return sub_23C3B4(0LL, result);
      }
    }

    __break(1u);
    goto LABEL_9;
  }

  return result;
}

uint64_t sub_23A2E4(char a1)
{
  uint64_t v2 = *v1;
  if ((a1 & 1) != 0)
  {
    swift_beginAccess(v2 + 16, v6, 0LL, 0LL);
    int64_t v3 = *(void *)(v2 + 16);
    if ((v3 & 0x8000000000000000LL) == 0) {
      return sub_23C3B4(0LL, v3);
    }
    __break(1u);
    goto LABEL_7;
  }

  swift_release(*v1);
  if (qword_3A7D18 != -1) {
LABEL_7:
  }
    swift_once(&qword_3A7D18, sub_2384DC);
  uint64_t v5 = off_3A8E78[0];
  *uint64_t v1 = off_3A8E78[0];
  return swift_retain(v5);
}

uint64_t sub_23A380(uint64_t (*a1)(char *))
{
  return sub_23A394(a1);
}

uint64_t sub_23A394(uint64_t (*a1)(char *))
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)(*v1 + 16LL);
  swift_retain(*v1);
  uint64_t result = swift_beginAccess(v5, v13, 0LL, 0LL);
  int64_t v7 = 0LL;
  uint64_t v8 = v4 + 32;
  do
  {
    if (__OFSUB__(*v5, v7))
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }

    if (v7 == *v5) {
      goto LABEL_9;
    }
    char v12 = *(_BYTE *)(v4 + v7 + 32);
    uint64_t result = a1(&v12);
    if (v2) {
      return swift_release(v4);
    }
    if ((result & 1) != 0)
    {
      uint64_t result = swift_release(v4);
      int64_t v10 = v7 + 1;
      if (__OFADD__(v7, 1LL))
      {
        __break(1u);
        goto LABEL_14;
      }

      while (!__OFSUB__(*v5, v10))
      {
        if (*v5 == v10)
        {
          if (v10 < v7) {
            goto LABEL_29;
          }
          return sub_23C3B4(v7, v10);
        }

        char v12 = *(_BYTE *)(v8 + v10);
        uint64_t result = a1(&v12);
        if ((result & 1) == 0)
        {
          if (__OFSUB__(v10, v7)) {
            goto LABEL_28;
          }
          if (v10 != v7)
          {
            char v11 = *(_BYTE *)(v8 + v7);
            *(_BYTE *)(v8 + v7) = *(_BYTE *)(v8 + v10);
            *(_BYTE *)(v8 + v10) = v11;
          }

uint64_t sub_23A518(uint64_t (*a1)(uint64_t, uint64_t))
{
  return a1(v1 + 32, v1 + 32 + *(void *)(v1 + 16));
}

uint64_t sub_23A588@<X0>(uint64_t (*a1)(uint64_t, void)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t result = a1(v3 + 32, *(void *)(v3 + 16));
  if (!v4) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56LL))(a3, 0LL, 1LL, a2);
  }
  return result;
}

uint64_t sub_23A620(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2)
{
  return sub_238380(a1, a2, *v2);
}

uint64_t sub_23A638( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return DataProtocol.firstRange<A, B>(of:in:)(a1, a2, a7, a3, a4, a8, a5, a6);
}

uint64_t sub_23A65C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return DataProtocol.lastRange<A, B>(of:in:)(a1, a2, a7, a3, a4, a8, a5, a6);
}

uint64_t sub_23A684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return DataProtocol.copyBytes<A>(to:count:)(a1, a2, a3, a5, a4);
}

uint64_t sub_23A694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return DataProtocol.copyBytes<A>(to:from:)(a1, a2, a3, a6, a4, a7, a5);
}

uint64_t sub_23A6AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return DataProtocol.copyBytes<A, B>(to:from:)(a1, a2, a3, a7, a4, a5, a8, a6);
}

uint64_t sub_23A6C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MutableDataProtocol.resetBytes<A>(in:)(a1, a4, a2, a5, a3);
}

Swift::Int sub_23A6E0()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_23A724()
{
}

Swift::Int sub_23A74C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void *sub_23A78C(void *result, void *a2)
{
  if (!__OFSUB__(*a2, *result)) {
    return (void *)(*a2 == *result);
  }
  __break(1u);
  return result;
}

BOOL sub_23A7A8(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL sub_23A7BC(void *a1, void *a2)
{
  return *a2 >= *a1;
}

BOOL sub_23A7D0(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL sub_23A7E4(void *a1, void *a2)
{
  return *a2 < *a1;
}

void *sub_23A7F8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(*result, *v2)) {
    __break(1u);
  }
  else {
    *a2 = *result - *v2;
  }
  return result;
}

void *sub_23A814@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*v2, *result)) {
    __break(1u);
  }
  else {
    *a2 = *v2 + *result;
  }
  return result;
}

void *sub_23A830(void *result, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  if (__OFADD__(*a4, *a6))
  {
    __break(1u);
  }

  else
  {
    *uint64_t result = *a4 + *a6;
    return 0LL;
  }

  return result;
}

uint64_t sub_23A854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for SecureBytes.Backing(0LL);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(sub_23A8B8, 0LL, v5, a2, a3);
  return v7;
}

size_t sub_23A8B8@<X0>(size_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  int64_t v4 = a2 - result;
  if (result) {
    size_t v5 = a2 - result;
  }
  else {
    size_t v5 = 0LL;
  }
  if ((v5 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_17;
  }

  if (HIDWORD(v5))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  char v6 = (const void *)result;
  if ((_DWORD)v5)
  {
    unsigned int v7 = (v5 - 1) | ((v5 - 1) >> 1) | ((((_DWORD)v5 - 1) | ((v5 - 1) >> 1)) >> 2);
    unsigned int v8 = v7 | (v7 >> 4) | ((v7 | (v7 >> 4)) >> 8);
    int v9 = v8 | HIWORD(v8);
    if (v9 == -1) {
      uint64_t v10 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v10 = (v9 + 1);
    }
  }

  else
  {
    uint64_t v10 = 1LL;
  }

  uint64_t v11 = type metadata accessor for SecureBytes.Backing(0LL);
  char v12 = (void *)swift_allocObject(v11, v10 + 32, 7LL);
  v12[2] = 0LL;
  v12[3] = v10;
  _swift_stdlib_malloc_size(v12);
  if (v6) {
    memmove(v12 + 4, v6, v4);
  }
  else {
    int64_t v4 = 0LL;
  }
  swift_beginAccess(v12 + 2, v13, 1LL, 0LL);
  v12[2] = v4;
  uint64_t result = _swift_stdlib_malloc_size(v12);
  if ((uint64_t)(result - 32) >= v4)
  {
    *a3 = v12;
    return result;
  }

uint64_t sub_23A9D0()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t sub_23AA20()
{
  return type metadata accessor for SecureBytes.Backing(0LL);
}

uint64_t getEnumTagSinglePayload for SecureBytes.BackingHeader(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for SecureBytes.BackingHeader(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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

ValueMetadata *type metadata accessor for SecureBytes.BackingHeader()
{
  return &type metadata for SecureBytes.BackingHeader;
}

ValueMetadata *type metadata accessor for SecureBytes()
{
  return &type metadata for SecureBytes;
}

size_t sub_23AA90(size_t result, int64_t a2, uint64_t a3)
{
  if ((result & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }

  int64_t v4 = v3;
  size_t v7 = result;
  uint64_t result = _swift_stdlib_malloc_size(v4);
  uint64_t v8 = v7 + a3;
  if (__OFADD__(v7, a3))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  BOOL v9 = __OFADD__(a2, a3);
  uint64_t v10 = a2 + a3;
  if (v9)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  if (v10 < v8)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  uint64_t result = _swift_stdlib_malloc_size(v4);
  if ((uint64_t)(result - 32) >= v10)
  {
    _swift_stdlib_malloc_size(v4);
    return (size_t)memmove(&v4[v8 + 32], &v4[v7 + 32], a2 - v7);
  }

size_t sub_23AB44(size_t result, int64_t a2)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }

  int64_t v4 = a2 + 1;
  if (__OFADD__(a2, 1LL))
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  char v5 = result;
  uint64_t result = _swift_stdlib_malloc_size(v2);
  if ((uint64_t)(result - 32) < v4)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  if (v4 >= a2)
  {
    uint64_t result = _swift_stdlib_malloc_size(v2);
    *((_BYTE *)v2 + a2 + 32) = v5;
    return result;
  }

void *sub_23ABB4(void *result, size_t a2, uint64_t a3)
{
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v6 = a3 + a2;
  if (__OFADD__(a3, a2))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  size_t v7 = v3;
  uint64_t v8 = result;
  uint64_t result = (void *)_swift_stdlib_malloc_size(v7);
  if ((uint64_t)result - 32 < v6)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  if (v6 < a3)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }

  uint64_t result = (void *)_swift_stdlib_malloc_size(v7);
  if (v8)
  {
    if ((a2 & 0x8000000000000000LL) == 0) {
      return memmove(&v7[a3 + 32], v8, a2);
    }
    goto LABEL_13;
  }

  return result;
}

uint64_t sub_23AC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v5 = v4;
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t result = __chkstk_darwin();
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v14 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, a3);
  uint64_t result = dispatch thunk of Collection.count.getter(a3, a4);
  int64_t v15 = a2 + result;
  if (__OFADD__(a2, result))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  int64_t v16 = _swift_stdlib_malloc_size(v5) - 32;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, a3);
  if (v16 < v15)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  uint64_t result = dispatch thunk of Collection.count.getter(a3, a4);
  uint64_t v17 = a2 + result;
  if (__OFADD__(a2, result))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  if (v17 >= a2)
  {
    _swift_stdlib_malloc_size(v5);
    return UnsafeMutableRawBufferPointer.copyBytes<A>(from:)(a1, &v5[a2 + 32], &v5[v17 + 32], a3, a4);
  }

char *sub_23AD80(char *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    if (a2 - (uint64_t)result >= a3)
    {
      char v5 = &result[a3];
      swift_beginAccess(a4 + 16, v6, 0LL, 0LL);
      return (char *)memmove(v5, (const void *)(a4 + 32), *(void *)(a4 + 16));
    }

    __break(1u);
    goto LABEL_7;
  }

  if (a3 > 0) {
LABEL_7:
  }
    __break(1u);
  return result;
}

uint64_t sub_23AE00(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7[4] = result;
  v7[5] = a2;
  v7[6] = a3;
  v7[7] = a4;
  if (a5)
  {
    v7[0] = result;
    v7[1] = a2;
    v7[2] = a3;
    v7[3] = a4;
    if (a3)
    {
      uint64_t v5 = a4 - a3;
      uint64_t v6 = a3;
    }

    else
    {
      uint64_t v6 = 0LL;
      uint64_t v5 = 0LL;
    }

    return sub_23B830(v6, v5, v7, (uint64_t (*)(uint64_t, uint64_t))sub_23C66C);
  }

  return result;
}

uint64_t sub_23AEBC(uint64_t (*a1)(uint64_t, uint64_t))
{
  return sub_23A518(a1);
}

unint64_t sub_23AEE0()
{
  unint64_t result = qword_3A8ED0;
  if (!qword_3A8ED0)
  {
    unint64_t result = swift_getWitnessTable(&unk_281E40, &type metadata for SecureBytes.Index);
    atomic_store(result, (unint64_t *)&qword_3A8ED0);
  }

  return result;
}

void *sub_23AF24()
{
  return &protocol witness table for Int;
}

void *sub_23AF30()
{
  return &protocol witness table for Int;
}

unint64_t sub_23AF40()
{
  unint64_t result = qword_3A8ED8;
  if (!qword_3A8ED8)
  {
    unint64_t result = swift_getWitnessTable(&unk_281E88, &type metadata for SecureBytes.Index);
    atomic_store(result, (unint64_t *)&qword_3A8ED8);
  }

  return result;
}

unint64_t sub_23AF8C()
{
  unint64_t result = qword_3A8EE0;
  if (!qword_3A8EE0)
  {
    unint64_t result = swift_getWitnessTable(&unk_281FE8, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_3A8EE0);
  }

  return result;
}

unint64_t sub_23AFD4()
{
  unint64_t result = qword_3A8EE8;
  if (!qword_3A8EE8)
  {
    unint64_t result = swift_getWitnessTable(&unk_281F30, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_3A8EE8);
  }

  return result;
}

unint64_t sub_23B01C()
{
  unint64_t result = qword_3A8EF0;
  if (!qword_3A8EF0)
  {
    unint64_t result = swift_getWitnessTable(&unk_282170, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_3A8EF0);
  }

  return result;
}

uint64_t sub_23B060()
{
  return sub_23B428( &qword_3A8EF8,  (void (*)(void))sub_23AFD4,  (uint64_t)&protocol conformance descriptor for <> Slice<A>);
}

uint64_t sub_23B08C()
{
  return sub_23B428( &qword_3A8F00,  (void (*)(void))sub_23AF8C,  (uint64_t)&protocol conformance descriptor for <> Slice<A>);
}

unint64_t sub_23B0BC()
{
  unint64_t result = qword_3A8F08;
  if (!qword_3A8F08)
  {
    unint64_t result = swift_getWitnessTable(&unk_2820A8, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_3A8F08);
  }

  return result;
}

uint64_t sub_23B100()
{
  return sub_23B304(&qword_3A8F10, (uint64_t)&protocol conformance descriptor for <> Range<A>);
}

unint64_t sub_23B124()
{
  unint64_t result = qword_3A8F20;
  if (!qword_3A8F20)
  {
    unint64_t result = swift_getWitnessTable(&unk_281DE8, &type metadata for SecureBytes.Index);
    atomic_store(result, (unint64_t *)&qword_3A8F20);
  }

  return result;
}

unint64_t sub_23B168()
{
  unint64_t result = qword_3A8F28;
  if (!qword_3A8F28)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_3A8F28);
  }

  return result;
}

uint64_t sub_23B1AC()
{
  return sub_23B428( &qword_3A8F30,  (void (*)(void))sub_23B1D8,  (uint64_t)&protocol conformance descriptor for <> Slice<A>);
}

unint64_t sub_23B1D8()
{
  unint64_t result = qword_3A8F38;
  if (!qword_3A8F38)
  {
    unint64_t result = swift_getWitnessTable(&unk_282058, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_3A8F38);
  }

  return result;
}

uint64_t sub_23B21C()
{
  return sub_23B304(&qword_3A8F40, (uint64_t)&protocol conformance descriptor for <> Range<A>);
}

uint64_t sub_23B240()
{
  return sub_23B428( &qword_3A8F48,  (void (*)(void))sub_23B0BC,  (uint64_t)&protocol conformance descriptor for <> Slice<A>);
}

uint64_t sub_23B26C()
{
  return sub_2129F8(&qword_3A8F50, &qword_3A8F58, (uint64_t)&protocol conformance descriptor for IndexingIterator<A>);
}

unint64_t sub_23B29C()
{
  unint64_t result = qword_3A8F60;
  if (!qword_3A8F60)
  {
    unint64_t result = swift_getWitnessTable(&unk_282108, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_3A8F60);
  }

  return result;
}

uint64_t sub_23B2E0()
{
  return sub_23B304(&qword_3A8F68, (uint64_t)&protocol conformance descriptor for <> Range<A>);
}

uint64_t sub_23B304(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_3A8F18);
    sub_23B124();
    sub_23B168();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_23B370()
{
  return sub_2129F8(&qword_3A8F70, &qword_3A89B8, (uint64_t)&protocol conformance descriptor for Slice<A>);
}

uint64_t sub_23B3A0()
{
  return sub_2129F8(&qword_3A8F78, &qword_3A8F80, (uint64_t)&protocol conformance descriptor for CollectionOfOne<A>);
}

uint64_t sub_23B3CC()
{
  return sub_23B428( &qword_3A8F88,  (void (*)(void))sub_235074,  (uint64_t)&protocol conformance descriptor for <> Slice<A>);
}

uint64_t sub_23B3FC()
{
  return sub_23B428(qword_3A8F90, (void (*)(void))sub_22E92C, (uint64_t)&protocol conformance descriptor for <> Slice<A>);
}

uint64_t sub_23B428(unint64_t *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_3A89B8);
    a2();
    uint64_t result = swift_getWitnessTable(a3, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_23B490(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *a1;
  uint64_t result = swift_beginAccess(*a1 + 16, v15, 0LL, 0LL);
  uint64_t v13 = *(void *)(v11 + 16);
  if (v13 < 0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  if (a2 < 0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  if (v13 < a3)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  if (__OFSUB__(a3, a2))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  if (a3 != a2)
  {
    if (__OFSUB__(a5, a4))
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }

    if (a5 == a4)
    {
LABEL_29:
      __break(1u);
      return result;
    }

    while (a4 < a5)
    {
      *(_BYTE *)(v11 + 32 + a2) = *(_BYTE *)(a6 + 32 + a4);
      uint64_t v14 = a2 + 1;
      if (__OFADD__(a2, 1LL)) {
        goto LABEL_19;
      }
      if (__OFSUB__(a3, v14)) {
        goto LABEL_20;
      }
      ++a4;
      if (v14 == a3) {
        goto LABEL_6;
      }
      if (__OFSUB__(a5, a4)) {
        goto LABEL_21;
      }
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }

    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

void *sub_23B5A4(const void *a1, int64_t a2)
{
  if (!a2) {
    return _swiftEmptyArrayStorage;
  }
  if (a2 <= 0)
  {
    uint64_t v5 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F0);
    uint64_t v5 = (void *)swift_allocObject(v4, a2 + 32, 7LL);
    size_t v6 = _swift_stdlib_malloc_size(v5);
    v5[2] = a2;
    v5[3] = 2 * v6 - 64;
  }

  memcpy(v5 + 4, a1, a2);
  return v5;
}

void *sub_23B630(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  if (v2 <= 0)
  {
    uint64_t v4 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F0);
    uint64_t v4 = (void *)swift_allocObject(v3, v2 + 32, 7LL);
    size_t v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = v2;
    v4[3] = 2 * v5 - 64;
  }

  uint64_t v6 = sub_237CD4((uint64_t)&v9, (_BYTE *)v4 + 32, v2, a1);
  uint64_t v7 = v9;
  swift_retain(a1);
  uint64_t result = (void *)swift_release(v7);
  if (v6 == v2) {
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B708(uint64_t (*a1)(char *))
{
  uint64_t v4 = *v1;
  swift_beginAccess(*v1 + 16, v14, 0LL, 0LL);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5 < 1) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  uint64_t v7 = v4 + 32;
  uint64_t v8 = v4 + 31;
  do
  {
    char v15 = *(_BYTE *)(v7 + v6);
    char v9 = a1(&v15);
    if (v2) {
      break;
    }
    if ((v9 & 1) != 0)
    {
      if (v6 >= v5 - 1) {
        return v6;
      }
      while (1)
      {
        char v15 = *(_BYTE *)(v8 + v5);
        uint64_t result = a1(&v15);
        uint64_t v11 = v5 - 1;
        if ((result & 1) == 0) {
          break;
        }
        uint64_t v12 = v5 - 2;
        if (__OFSUB__(v11, 1LL))
        {
          __break(1u);
          goto LABEL_17;
        }

        --v5;
        if (v6 >= v12) {
          return v6;
        }
      }

      if (!__OFSUB__(v11, v6))
      {
        char v13 = *(_BYTE *)(v7 + v6);
        *(_BYTE *)(v7 + v6) = *(_BYTE *)(v8 + v5);
        *(_BYTE *)(v8 + v5--) = v13;
        goto LABEL_3;
      }

uint64_t sub_23B830(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = *a3;
  uint64_t v7 = a3[1];
  uint64_t v9 = a3[2];
  uint64_t v8 = a3[3];
  uint64_t v10 = sub_235040(0LL, *a3, v9, v8);
  uint64_t result = sub_235040(v6, v7, v9, v8);
  if (__OFADD__(v10, result))
  {
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v12 = result;
  if (v10 + result < v10)
  {
LABEL_8:
    __break(1u);
    return result;
  }

  if (a1) {
    uint64_t v13 = a1 + v10;
  }
  else {
    uint64_t v13 = 0LL;
  }
  return a4(v13, v12);
}

uint64_t sub_23B8E0(_BYTE *__src, _BYTE *a2)
{
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

unint64_t sub_23B9A0(unint64_t a1, char a2, uint64_t a3)
{
  return sub_23B9F4(a1, a2, a3, ccec_cp_256);
}

unint64_t sub_23B9BC(unint64_t a1, char a2, uint64_t a3)
{
  return sub_23B9F4(a1, a2, a3, ccec_cp_384);
}

unint64_t sub_23B9D8(unint64_t a1, char a2, uint64_t a3)
{
  return sub_23B9F4(a1, a2, a3, (uint64_t (*)(void))ccec_cp_521);
}

unint64_t sub_23B9F4(unint64_t result, char a2, uint64_t a3, uint64_t (*a4)(void))
{
  if ((result & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }

  uint64_t v5 = result;
  if (HIDWORD(result))
  {
LABEL_12:
    __break(1u);
    return result;
  }

  if ((_DWORD)result)
  {
    unsigned int v9 = (result - 1) | ((result - 1) >> 1) | ((((_DWORD)result - 1) | ((result - 1) >> 1)) >> 2);
    unsigned int v10 = v9 | (v9 >> 4) | ((v9 | (v9 >> 4)) >> 8);
    int v11 = v10 | HIWORD(v10);
    if (v11 == -1) {
      uint64_t v12 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v12 = (v11 + 1);
    }
  }

  else
  {
    uint64_t v12 = 1LL;
  }

  uint64_t v13 = type metadata accessor for SecureBytes.Backing(0LL);
  uint64_t v14 = swift_allocObject(v13, v12 + 32, 7LL);
  *(void *)(v14 + 16) = 0LL;
  *(void *)(v14 + 24) = v12;
  uint64_t v16 = v14;
  char v15 = (uint64_t **)swift_retain(v14);
  sub_23850C(v15, v5, &v16, a2 & 1, a3, a4);
  swift_release(v14);
  if (v4) {
    swift_release(v14);
  }
  return v14;
}

unint64_t sub_23BAE4( unint64_t a1, unint64_t **a2, unint64_t **a3, unint64_t *a4, uint64_t a5)
{
  return sub_23BAF8(a1, a2, a3, a4, a5);
}

unint64_t sub_23BAF8( unint64_t result, unint64_t **a2, unint64_t **a3, unint64_t *a4, uint64_t a5)
{
  if ((result & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }

  uint64_t v6 = result;
  if (HIDWORD(result))
  {
LABEL_12:
    __break(1u);
    return result;
  }

  if ((_DWORD)result)
  {
    unsigned int v11 = (result - 1) | ((result - 1) >> 1) | ((((_DWORD)result - 1) | ((result - 1) >> 1)) >> 2);
    unsigned int v12 = v11 | (v11 >> 4) | ((v11 | (v11 >> 4)) >> 8);
    int v13 = v12 | HIWORD(v12);
    if (v13 == -1) {
      uint64_t v14 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v14 = (v13 + 1);
    }
  }

  else
  {
    uint64_t v14 = 1LL;
  }

  uint64_t v15 = type metadata accessor for SecureBytes.Backing(0LL);
  uint64_t v16 = swift_allocObject(v15, v14 + 32, 7LL);
  *(void *)(v16 + 16) = 0LL;
  *(void *)(v16 + 24) = v14;
  uint64_t v18 = v16;
  uint64_t v17 = (char *)swift_retain(v16);
  sub_2385F0(v17, v6, &v18, a2, a3, a4, a5);
  swift_release(v16);
  if (v5) {
    swift_release(v16);
  }
  return v16;
}

unint64_t sub_23BBF8( unint64_t result, uint64_t (*a2)(void *, uint64_t *), uint64_t a3)
{
  if ((result & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }

  uint64_t v4 = result;
  if (HIDWORD(result))
  {
LABEL_12:
    __break(1u);
    return result;
  }

  if ((_DWORD)result)
  {
    unsigned int v7 = (result - 1) | ((result - 1) >> 1) | ((((_DWORD)result - 1) | ((result - 1) >> 1)) >> 2);
    unsigned int v8 = v7 | (v7 >> 4) | ((v7 | (v7 >> 4)) >> 8);
    int v9 = v8 | HIWORD(v8);
    if (v9 == -1) {
      uint64_t v10 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v10 = (v9 + 1);
    }
  }

  else
  {
    uint64_t v10 = 1LL;
  }

  uint64_t v11 = type metadata accessor for SecureBytes.Backing(0LL);
  uint64_t v12 = swift_allocObject(v11, v10 + 32, 7LL);
  *(void *)(v12 + 16) = 0LL;
  *(void *)(v12 + 24) = v10;
  uint64_t v14 = v12;
  int v13 = (const void *)swift_retain(v12);
  sub_23885C(v13, v4, a2, a3, &v14);
  swift_release(v12);
  if (v3) {
    swift_release(v12);
  }
  return v12;
}

unint64_t sub_23BCE0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_23BD18(a1, a2, a3);
}

unint64_t sub_23BCFC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_23BD18(a1, a2, a3);
}

unint64_t sub_23BD18(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }

  uint64_t v4 = result;
  if (HIDWORD(result))
  {
LABEL_12:
    __break(1u);
    return result;
  }

  if ((_DWORD)result)
  {
    unsigned int v7 = (result - 1) | ((result - 1) >> 1) | ((((_DWORD)result - 1) | ((result - 1) >> 1)) >> 2);
    unsigned int v8 = v7 | (v7 >> 4) | ((v7 | (v7 >> 4)) >> 8);
    int v9 = v8 | HIWORD(v8);
    if (v9 == -1) {
      uint64_t v10 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v10 = (v9 + 1);
    }
  }

  else
  {
    uint64_t v10 = 1LL;
  }

  uint64_t v11 = type metadata accessor for SecureBytes.Backing(0LL);
  uint64_t v12 = swift_allocObject(v11, v10 + 32, 7LL);
  *(void *)(v12 + 16) = 0LL;
  *(void *)(v12 + 24) = v10;
  uint64_t v14 = v12;
  sub_1F83C0(a2, a3);
  int v13 = (const void *)swift_retain(v12);
  sub_23874C(v13, v4, &v14, a2, a3);
  swift_release(v12);
  if (v3) {
    swift_release(v12);
  }
  return v12;
}

unint64_t sub_23BE30(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_23BD18(a1, a2, a3);
}

uint64_t *sub_23BE4C(int64_t a1)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_15;
  }

  if (HIDWORD(a1))
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  if ((_DWORD)a1)
  {
    unsigned int v2 = (a1 - 1) | ((a1 - 1) >> 1) | ((((_DWORD)a1 - 1) | ((a1 - 1) >> 1)) >> 2);
    unsigned int v3 = v2 | (v2 >> 4) | ((v2 | (v2 >> 4)) >> 8);
    int v4 = v3 | HIWORD(v3);
    if (v4 == -1) {
      uint64_t v5 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v5 = (v4 + 1);
    }
  }

  else
  {
    uint64_t v5 = 1LL;
  }

  uint64_t v6 = type metadata accessor for SecureBytes.Backing(0LL);
  unsigned int v7 = (void *)swift_allocObject(v6, v5 + 32, 7LL);
  v7[2] = 0LL;
  v7[3] = v5;
  size_t v8 = _swift_stdlib_malloc_size(v7);
  if (!a1) {
    goto LABEL_13;
  }
  v10[0] = 0;
  uint64_t result = ccrng(v10);
  if (result)
  {
    if (!v10[0])
    {
      ccrng_generate_bridge((uint64_t (**)(void))result);
LABEL_13:
      swift_beginAccess(v7 + 2, v10, 1LL, 0LL);
      v7[2] = a1;
      return v7;
    }

uint64_t sub_23BF74(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  if (!a2)
  {
    swift_release(result);
    return 0LL;
  }

  if (a2 > 14)
  {
    uint64_t v10 = type metadata accessor for Data.RangeReference(0LL);
    uint64_t v4 = swift_allocObject(v10, 32LL, 7LL);
    *(void *)(v4 + 16) = 0LL;
    *(void *)(v4 + 24) = a2;
    return v4;
  }

  if (a2 < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v5 = (_BYTE *)__DataStorage._bytes.getter();
    if (!v5)
    {
LABEL_10:
      uint64_t v6 = __DataStorage._length.getter();
      if (v6 >= a2) {
        uint64_t v7 = a2;
      }
      else {
        uint64_t v7 = v6;
      }
      size_t v8 = &v5[v7];
      if (v5) {
        int v9 = v8;
      }
      else {
        int v9 = 0LL;
      }
      uint64_t v4 = sub_23B8E0(v5, v9);
      swift_release(v2);
      return v4;
    }

    uint64_t result = __DataStorage._offset.getter();
    if (!__OFSUB__(0LL, result))
    {
      v5 -= result;
      goto LABEL_10;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_23C058(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Data.Deallocator(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (uint64_t (**)())&v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  swift_beginAccess(a1 + 16, v23, 0LL, 0LL);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = a1 + 32;
  uint64_t v9 = swift_allocObject(&unk_353DA8, 24LL, 7LL);
  *(void *)(v9 + 16) = a1;
  *uint64_t v6 = sub_23C664;
  v6[1] = (uint64_t (*)())v9;
  (*(void (**)(uint64_t (**)(), void, uint64_t))(v3 + 104))( v6,  enum case for Data.Deallocator.custom(_:),  v2);
  uint64_t v10 = swift_retain(a1);
  uint64_t v11 = Data.Deallocator._deallocator.getter(v10);
  uint64_t v13 = v12;
  if (v7)
  {
    uint64_t v14 = v11;
    uint64_t v15 = type metadata accessor for __DataStorage(0LL);
    swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
    swift_retain(v13);
    uint64_t v16 = __DataStorage.init(bytes:length:copy:deallocator:offset:)(v8, v7, 0LL, v14, v13, 0LL);
    uint64_t v17 = sub_23BF74(v16, v7);
    swift_release(v13);
  }

  else
  {
    uint64_t v18 = (void (*)(uint64_t, void))Data.Deallocator._deallocator.getter(v11);
    uint64_t v20 = v19;
    v18(v8, 0LL);
    swift_release(v13);
    swift_release(v20);
    uint64_t v17 = 0LL;
  }

  (*(void (**)(uint64_t (**)(), uint64_t))(v3 + 8))(v6, v2);
  return v17;
}

uint64_t sub_23C1EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A854(a1, a2, a3);
}

size_t sub_23C230()
{
  size_t v1 = _swift_stdlib_malloc_size(v0) - 32;
  size_t result = swift_beginAccess(v0 + 2, v4, 1LL, 0LL);
  int64_t v3 = v0[2];
  if (__OFSUB__(v1, v3))
  {
    __break(1u);
    goto LABEL_6;
  }

  if (((v1 - v3) & 0x8000000000000000LL) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  size_t result = _swift_stdlib_malloc_size(v0);
  if ((uint64_t)(result - 32) >= v3)
  {
    v0[2] = v3;
    return result;
  }

size_t sub_23C2B0(int64_t a1, int64_t a2)
{
  uint64_t v5 = v2 + 2;
  size_t result = swift_beginAccess(v2 + 2, v14, 0LL, 0LL);
  int64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_11;
  }

  int64_t v8 = v2[2];
  if (__OFSUB__(v8, v7))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  size_t result = _swift_stdlib_malloc_size(v2);
  if ((uint64_t)(result - 32) < v8 - v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  BOOL v9 = __OFSUB__(0LL, v7);
  uint64_t v10 = a1 - a2;
  if (v9)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  if (v8 < a2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  size_t result = sub_23AA90(a2, v8, v10);
  if (a1 < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  size_t result = _swift_stdlib_malloc_size(v2);
  if ((uint64_t)(result - 32) < a1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  size_t result = _swift_stdlib_malloc_size(v2);
  uint64_t v11 = v2[2];
  uint64_t v12 = v11 + v10;
  if (!__OFADD__(v11, v10))
  {
    size_t result = swift_beginAccess(v5, &v13, 1LL, 0LL);
    *uint64_t v5 = v12;
    return result;
  }

uint64_t sub_23C3B4(int64_t a1, int64_t a2)
{
  int64_t v3 = v2;
  uint64_t v6 = (char *)*v2 + 16;
  uint64_t result = swift_beginAccess(v6, v20, 0LL, 0LL);
  int64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_19;
  }

  uint64_t v9 = *v6 - v8;
  if (__OFSUB__(*v6, v8))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  uint64_t result = swift_isUniquelyReferenced_nonNull_native(*v3);
  if ((_DWORD)result)
  {
    uint64_t result = _swift_stdlib_malloc_size(*v3);
    if (result - 32 >= v9)
    {
      if (a2 >= a1) {
        return sub_23C2B0(a1, a2);
      }
      goto LABEL_24;
    }
  }

  if (v9 < 0) {
    goto LABEL_20;
  }
  if (HIDWORD(v9))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  if ((_DWORD)v9)
  {
    unsigned int v10 = (v9 - 1) | ((v9 - 1) >> 1) | ((((_DWORD)v9 - 1) | ((v9 - 1) >> 1)) >> 2);
    unsigned int v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
    int v12 = v11 | HIWORD(v11);
    if (v12 == -1) {
      uint64_t v13 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v13 = (v12 + 1);
    }
  }

  else
  {
    uint64_t v13 = 1LL;
  }

  uint64_t v14 = type metadata accessor for SecureBytes.Backing(0LL);
  uint64_t result = swift_allocObject(v14, v13 + 32, 7LL);
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = v13;
  if (a1 < 0) {
    goto LABEL_22;
  }
  uint64_t v15 = (const void *)result;
  uint64_t v16 = (char *)*v3;
  uint64_t result = swift_beginAccess((char *)*v3 + 16, &v19, 0LL, 0LL);
  uint64_t v17 = *((void *)v16 + 2);
  if (v17 < a2)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    return result;
  }

  sub_238930(v16, 0LL, a1);
  sub_23C230();
  sub_238930((char *)*v3, a2, v17);
  uint64_t v18 = *v3;
  char *v3 = v15;
  return swift_release(v18);
}

size_t sub_23C530(void *a1, size_t a2)
{
  uint64_t v5 = **(void **)(v2 + 16);
  swift_beginAccess(v5 + 16, v7, 0LL, 0LL);
  return sub_2396C0(*(void *)(v5 + 16), *(void *)(v5 + 16), a1, a2);
}

int *sub_23C5A0(size_t a1, uint64_t a2)
{
  if (qword_3A7D18 != -1) {
    swift_once(&qword_3A7D18, sub_2384DC);
  }
  uint64_t result = off_3A8E78[0];
  int64_t v7 = off_3A8E78[0];
  if (!a2) {
    return (int *)swift_retain(off_3A8E78[0]);
  }
  if (a2 < 0)
  {
    __break(1u);
  }

  else
  {
    swift_retain(off_3A8E78[0]);
    do
    {
      uint64_t v5 = v7;
      swift_beginAccess(v7 + 4, &v6, 0LL, 0LL);
      sub_239524(*((void *)v5 + 2), *((void *)v5 + 2), a1);
      --a2;
    }

    while (a2);
    return v7;
  }

  return result;
}

uint64_t sub_23C654()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_23C664()
{
  return swift_release(*(void *)(v0 + 16));
}

void *sub_23C66C(void *__src, size_t __len)
{
  if (__src)
  {
    if ((__len & 0x8000000000000000LL) != 0) {
      __break(1u);
    }
    else {
      return memmove(*(void **)(v2 + 40), __src, __len);
    }
  }

  return __src;
}

ValueMetadata *type metadata accessor for SecureBytes.Index()
{
  return &type metadata for SecureBytes.Index;
}

uint64_t sub_23C6A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_3A80C0);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(sub_23C708, 0LL, v4, a1, v3);
  return v6;
}

size_t sub_23C708@<X0>(size_t a1@<X0>, unint64_t a2@<X1>, size_t *a3@<X8>)
{
  size_t result = sub_23EEF8(a1, a2);
  *a3 = result;
  a3[1] = 0LL;
  return result;
}

uint64_t sub_23C738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_23C750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

ValueMetadata *_s5DHKEMOMa()
{
  return &_s5DHKEMON;
}

uint64_t sub_23C778@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _BYTE *a5@<X8>)
{
  char v10 = *a2;
  char v16 = *a2;
  uint64_t v11 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(a4 + 8) + 16LL))(&v16, a3);
  if (v5) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8LL))(a1, a3);
  }
  sub_1F86D4(v11, v12);
  uint64_t v15 = _s5DHKEMO9PublicKeyVMa(0LL, a3, a4, v14);
  uint64_t result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32LL))( &a5[*(int *)(v15 + 36)],  a1,  a3);
  *a5 = v10;
  return result;
}

uint64_t sub_23C82C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v35 = a3;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v36 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(a1, a2);
  int64_t v38 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *(void *)(v6 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness(0LL, v8, v5, &unk_33EF50, &unk_33EF68);
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness, v11);
  uint64_t v13 = (char *)&v30 - v12;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v8,  v5,  AssociatedTypeWitness,  &unk_33EF50,  &unk_33EF60);
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))( AssociatedTypeWitness,  AssociatedConformanceWitness);
  uint64_t v15 = *(int *)(a1 + 36);
  uint64_t v37 = v3;
  uint64_t v16 = *(void *)(*(void *)(AssociatedConformanceWitness + 8) + 8LL);
  uint64_t v17 = v39;
  (*(void (**)(void *__return_ptr, _BYTE *, uint64_t, uint64_t))(v16 + 24))( v42,  &v3[v15],  AssociatedTypeWitness,  v16);
  if (v17) {
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, AssociatedTypeWitness);
  }
  uint64_t v39 = v10;
  uint64_t v34 = v42[0];
  (*(void (**)(uint64_t, uint64_t))(v16 + 16))(AssociatedTypeWitness, v16);
  uint64_t v19 = v37;
  LOBYTE(v42[0]) = *v37;
  uint64_t v20 = *(void *)(v8 + 8);
  uint64_t v31 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v32 = v31(v42, v5, v20);
  uint64_t v33 = v21;
  (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v5);
  LOBYTE(v42[0]) = *v19;
  char v22 = v42[0];
  uint64_t v23 = v31(v42, v5, v20);
  unint64_t v25 = v24;
  v42[3] = &type metadata for SharedSecret;
  v42[4] = sub_235924();
  uint64_t v26 = v34;
  v42[0] = v34;
  char v41 = v22;
  char v40 = 0x20100u >> (8 * v22);
  swift_retain(v34);
  uint64_t v28 = v32;
  uint64_t v27 = v33;
  sub_21CF28((uint64_t)v42, v32, v33, v23, v25, 0LL, 0xF000000000000000LL, &v41, &v43, &v40);
  sub_1F86D4(v23, v25);
  swift_release(v26);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v13, AssociatedTypeWitness);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm(v42);
  int64_t v29 = v35;
  *uint64_t v35 = v43;
  v29[1] = v28;
  v29[2] = v27;
  return result;
}

uint64_t sub_23CB50@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v24[0] = a5;
  uint64_t v9 = *(void *)(a4 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  v9,  a3,  &protocol descriptor for DiffieHellmanKeyAgreement.NumRequirements,  &unk_33EA28);
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness, v12);
  uint64_t v14 = (char *)v24 - v13;
  char v15 = *a2;
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(a3, v9);
  char v25 = v15;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( a4,  a3,  AssociatedTypeWitness,  &unk_33EF98,  &unk_33EFA8);
  uint64_t v17 = v24[1];
  uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(AssociatedConformanceWitness + 8) + 16LL))( &v25,  AssociatedTypeWitness);
  if (v17)
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8LL))(a1, a3);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, AssociatedTypeWitness);
  }

  else
  {
    sub_1F86D4(v18, v19);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, AssociatedTypeWitness);
    uint64_t v22 = _s5DHKEMO10PrivateKeyVMa(0LL, a3, a4, v21);
    uint64_t v23 = (_BYTE *)v24[0];
    uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32LL))( v24[0] + *(int *)(v22 + 36),  a1,  a3);
    *uint64_t v23 = v15;
  }

  return result;
}

void *sub_23CCC8(size_t *a1, uint64_t a2, uint64_t a3)
{
  void (*v22)(void *__return_ptr, unint64_t, uint64_t, uint64_t);
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned __int8 *v33;
  void (*v34)(void *__return_ptr, unint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  unsigned __int8 *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t *, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  unint64_t v55;
  char *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  __int128 v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  size_t *v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  unsigned __int8 *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  __int128 v87;
  uint64_t v88;
  unint64_t v89;
  char v90[24];
  char v91[24];
  void v92[3];
  ValueMetadata *v93;
  void *v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v77 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v81 = a3;
  v84 = *(void *)(v4 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  v84,  v5,  &protocol descriptor for DiffieHellmanKeyAgreement.NumRequirements,  &unk_33EA28);
  uint64_t v79 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = __chkstk_darwin(AssociatedTypeWitness, v7);
  uint64_t v78 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8, v10);
  uint64_t v80 = (char *)&v71 - v11;
  v83 = v5;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v4,  v5,  AssociatedTypeWitness,  &unk_33EF98,  &unk_33EFA8);
  uint64_t v13 = swift_getAssociatedTypeWitness( 0LL,  AssociatedConformanceWitness,  AssociatedTypeWitness,  &unk_33EF50,  &unk_33EF68);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v71 - v16;
  uint64_t v18 = swift_getAssociatedConformanceWitness( AssociatedConformanceWitness,  AssociatedTypeWitness,  v13,  &unk_33EF50,  &unk_33EF60);
  (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v13, v18);
  unint64_t v20 = a2 + *(int *)(_s5DHKEMO9PublicKeyVMa(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v19) + 36);
  uint64_t v21 = *(void *)(*(void *)(v18 + 8) + 8LL);
  uint64_t v22 = *(void (**)(void *__return_ptr, unint64_t, uint64_t, uint64_t))(v21 + 24);
  v93 = &type metadata for SharedSecret;
  uint64_t v23 = sub_235924();
  v94 = (void *)v23;
  v85 = v20;
  unint64_t v24 = v97;
  v22(v92, v20, v13, v21);
  if (v24)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    return __swift_deallocate_boxed_opaque_existential_1(v92);
  }

  else
  {
    uint64_t v74 = AssociatedTypeWitness;
    uint64_t v75 = v14;
    uint64_t v76 = v13;
    v97 = v17;
    char v25 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v92, (uint64_t)v93);
    __chkstk_darwin(v25, v25);
    uint64_t v27 = (uint64_t *)((char *)&v71 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    (*(void (**)(uint64_t *))(v28 + 16))(v27);
    int64_t v29 = *v27;
    swift_beginAccess(*v27 + 16, v91, 0LL, 0LL);
    uint64_t v30 = sub_213EA0(v29 + 32, v29 + 32 + *(void *)(v29 + 16));
    uint64_t v32 = v31;
    swift_release(v29);
    __swift_destroy_boxed_opaque_existential_1Tm(v92);
    v95 = v30;
    v96 = v32;
    uint64_t v33 = v82;
    uint64_t v34 = *(void (**)(void *__return_ptr, unint64_t, uint64_t))(v84 + 24);
    v93 = &type metadata for SharedSecret;
    v94 = (void *)v23;
    v34(v92, v85, v83);
    uint64_t v81 = 0LL;
    uint64_t v36 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v92, (uint64_t)v93);
    __chkstk_darwin(v36, v36);
    int64_t v38 = (uint64_t *)((char *)&v71 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    (*(void (**)(uint64_t *))(v39 + 16))(v38);
    char v40 = *v38;
    swift_beginAccess(*v38 + 16, v90, 0LL, 0LL);
    char v41 = sub_213EA0(v40 + 32, v40 + 32 + *(void *)(v40 + 16));
    size_t v43 = v42;
    swift_release(v40);
    __swift_destroy_boxed_opaque_existential_1Tm(v92);
    Data.append(_:)(v41, v43);
    sub_1F86D4(v41, v43);
    uint64_t v44 = v80;
    uint64_t v45 = v33;
    uint64_t v46 = v97;
    uint64_t v47 = v76;
    (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v76, v21);
    LOBYTE(v92[0]) = *v45;
    uint64_t v48 = *(void *)(AssociatedConformanceWitness + 8);
    uint64_t v49 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v48 + 16);
    uint64_t v50 = v81;
    uint64_t v51 = v74;
    uint64_t v52 = v49(v92, v74, v48);
    if (v50)
    {
      (*(void (**)(char *, uint64_t))(v79 + 8))(v44, v51);
      sub_1F86D4(v95, v96);
      return (void *)(*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v46, v47);
    }

    else
    {
      uint64_t v72 = v53;
      uint64_t v73 = v52;
      uint64_t v54 = *(void (**)(char *, uint64_t))(v79 + 8);
      v54(v44, v51);
      v93 = (ValueMetadata *)&type metadata for Data;
      v94 = &protocol witness table for Data;
      v92[0] = v95;
      v92[1] = v96;
      LODWORD(v81) = *v45;
      LOBYTE(v88) = v81;
      sub_1F83C0(v95, v96);
      uint64_t v80 = (char *)v49(&v88, v51, v48);
      v85 = v55;
      uint64_t v56 = v78;
      (*(void (**)(uint64_t))(v84 + 16))(v83);
      LOBYTE(v88) = v81;
      uint64_t v57 = v49(&v88, v51, v48);
      unint64_t v59 = v58;
      uint64_t v81 = 0LL;
      v54(v56, v51);
      v60 = (char)*v82;
      LODWORD(v84) = *v82;
      LODWORD(v83) = 0x20100u >> (8 * v84);
      if (qword_3A7C80 != -1) {
        swift_once(&qword_3A7C80, sub_21CEFC);
      }
      v88 = qword_3A8688;
      v89 = qword_3A8690;
      v61 = qword_2824B0[v60];
      sub_1F83C0(qword_3A8688, qword_3A8690);
      sub_2308A8(v61, 2LL);
      uint64_t v63 = v62;
      uint64_t v65 = v64;
      Data.append(_:)(v62, v64);
      sub_1F86D4(v63, v65);
      v87 = xmmword_280350;
      Data.append(_:)(v73, v72);
      v66 = (uint64_t)v80;
      uint64_t v67 = v85;
      Data.append(_:)(v80, v85);
      sub_1F83C0(v57, v59);
      Data.append(_:)(v57, v59);
      sub_1F86D4(v57, v59);
      uint64_t v68 = v87;
      uint64_t v69 = v88;
      uint64_t v70 = v89;
      LOBYTE(v87) = v84;
      v86 = v83;
      sub_1F83C0(v88, v89);
      sub_22CE10((uint64_t)v92, v68, *((uint64_t *)&v68 + 1), v69, v70, (unsigned __int8 *)&v87, &v86, v77);
      sub_1F86D4(v69, v70);
      sub_1F86D4(v68, *((unint64_t *)&v68 + 1));
      sub_1F86D4(v69, v70);
      sub_1F86D4(v57, v59);
      sub_1F86D4(v66, v67);
      sub_1F86D4(v95, v96);
      (*(void (**)(char *, uint64_t))(v75 + 8))(v97, v76);
      __swift_destroy_boxed_opaque_existential_1Tm(v92);
      return (void *)v73;
    }
  }

uint64_t sub_23D508@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, size_t *a5@<X8>)
{
  void (*v26)(uint64_t *__return_ptr, char *, uint64_t, uint64_t);
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(void, void);
  uint64_t v47;
  uint64_t (*v48)(uint64_t *, uint64_t, uint64_t);
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  __int128 v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  size_t *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE *v78;
  uint64_t v79;
  char v80;
  __int128 v81;
  uint64_t v82;
  unint64_t v83;
  char v84[24];
  _BYTE v85[24];
  uint64_t v86;
  unint64_t v87;
  ValueMetadata *v88;
  void *v89;
  uint64_t v90;
  unint64_t v91;
  void (*v92)(void, void);
  uint64_t v6 = v5;
  uint64_t v75 = a3;
  uint64_t v74 = a5;
  uint64_t v11 = *(void *)(a4 + 16);
  uint64_t v10 = *(void *)(a4 + 24);
  uint64_t v77 = *(void *)(v10 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  v77,  v11,  &protocol descriptor for DiffieHellmanKeyAgreement.NumRequirements,  &unk_33EA28);
  uint64_t v76 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v14 = __chkstk_darwin(AssociatedTypeWitness, v13);
  uint64_t v16 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14, v17);
  uint64_t v19 = (char *)&v67 - v18;
  v86 = a1;
  v87 = a2;
  uint64_t v78 = v6;
  v85[0] = *v6;
  uint64_t v79 = v11;
  uint64_t v20 = *(void *)(swift_getAssociatedConformanceWitness(v10, v11, AssociatedTypeWitness, &unk_33EF98, &unk_33EFA8) + 8);
  uint64_t v21 = *(uint64_t (**)(uint64_t *, _BYTE *, void *, void *, uint64_t, uint64_t))(v20 + 8);
  sub_1F83C0(a1, a2);
  uint64_t v22 = v92;
  uint64_t result = v21(&v86, v85, &type metadata for Data, &protocol witness table for Data, AssociatedTypeWitness, v20);
  if (!v22)
  {
    uint64_t v72 = v20;
    v92 = (void (*)(void, void))v16;
    uint64_t v70 = a1;
    uint64_t v73 = AssociatedTypeWitness;
    uint64_t v71 = a2;
    unint64_t v24 = (uint64_t *)&v78[*(int *)(a4 + 36)];
    uint64_t v25 = v77;
    uint64_t v26 = *(void (**)(uint64_t *__return_ptr, char *, uint64_t, uint64_t))(v77 + 24);
    v88 = &type metadata for SharedSecret;
    uint64_t v27 = sub_235924();
    v89 = (void *)v27;
    v26(&v86, v19, v79, v25);
    uint64_t v68 = v19;
    uint64_t v28 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v86, (uint64_t)v88);
    uint64_t v69 = &v67;
    __chkstk_darwin(v28, v28);
    uint64_t v30 = v24;
    uint64_t v31 = (uint64_t *)((char *)&v67 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    (*(void (**)(uint64_t *))(v32 + 16))(v31);
    uint64_t v33 = *v31;
    swift_beginAccess(*v31 + 16, v85, 0LL, 0LL);
    uint64_t v34 = sub_213EA0(v33 + 32, v33 + 32 + *(void *)(v33 + 16));
    uint64_t v36 = v35;
    swift_release(v33);
    __swift_destroy_boxed_opaque_existential_1Tm(&v86);
    v90 = v34;
    v91 = v36;
    v88 = &type metadata for SharedSecret;
    v89 = (void *)v27;
    uint64_t v69 = v30;
    v26(&v86, v75, v79, v25);
    uint64_t v37 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v86, (uint64_t)v88);
    __chkstk_darwin(v37, v37);
    uint64_t v39 = (uint64_t *)((char *)&v67 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    (*(void (**)(uint64_t *))(v40 + 16))(v39);
    char v41 = *v39;
    swift_beginAccess(*v39 + 16, v84, 0LL, 0LL);
    unint64_t v42 = sub_213EA0(v41 + 32, v41 + 32 + *(void *)(v41 + 16));
    uint64_t v44 = v43;
    swift_release(v41);
    __swift_destroy_boxed_opaque_existential_1Tm(&v86);
    Data.append(_:)(v42, v44);
    sub_1F86D4(v42, v44);
    v88 = (ValueMetadata *)&type metadata for Data;
    v89 = &protocol witness table for Data;
    v86 = v90;
    v87 = v91;
    uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v25 + 16);
    sub_1F83C0(v90, v91);
    uint64_t v46 = v92;
    v45(v79, v25);
    LOBYTE(v82) = *v78;
    uint64_t v47 = v72;
    uint64_t v48 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v72 + 16);
    uint64_t v49 = v73;
    uint64_t v50 = v78;
    uint64_t v51 = v48(&v82, v73, v72);
    uint64_t v53 = v52;
    v92 = *(void (**)(void, void))(v76 + 8);
    v92(v46, v49);
    uint64_t v54 = (char)*v50;
    LOBYTE(v82) = *v50;
    char v55 = v48(&v82, v49, v47);
    uint64_t v57 = v56;
    uint64_t v58 = v55;
    uint64_t v79 = 0LL;
    LODWORD(v78) = v54;
    LODWORD(v77) = 0x20100u >> (8 * v54);
    if (qword_3A7C80 != -1) {
      swift_once(&qword_3A7C80, sub_21CEFC);
    }
    v82 = qword_3A8688;
    v83 = qword_3A8690;
    unint64_t v59 = qword_2824B0[v54];
    sub_1F83C0(qword_3A8688, qword_3A8690);
    sub_2308A8(v59, 2LL);
    v61 = v60;
    uint64_t v63 = v62;
    Data.append(_:)(v60, v62);
    sub_1F86D4(v61, v63);
    uint64_t v81 = xmmword_280350;
    Data.append(_:)(v70, v71);
    Data.append(_:)(v51, v53);
    sub_1F83C0(v58, v57);
    Data.append(_:)(v58, v57);
    sub_1F86D4(v58, v57);
    v64 = v81;
    uint64_t v65 = v82;
    v66 = v83;
    LOBYTE(v81) = (_BYTE)v78;
    uint64_t v80 = v77;
    sub_1F83C0(v82, v83);
    sub_22CE10((uint64_t)&v86, v64, *((uint64_t *)&v64 + 1), v65, v66, (unsigned __int8 *)&v81, &v80, v74);
    sub_1F86D4(v65, v66);
    sub_1F86D4(v64, *((unint64_t *)&v64 + 1));
    sub_1F86D4(v65, v66);
    sub_1F86D4(v58, v57);
    sub_1F86D4(v51, v53);
    sub_1F86D4(v90, v91);
    v92(v68, v49);
    return __swift_destroy_boxed_opaque_existential_1Tm(&v86);
  }

  return result;
}

uint64_t sub_23DC08@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, size_t *a4@<X8>)
{
  uint64_t v5 = v4;
  int64_t v38 = a4;
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(a3 + 24);
  uint64_t v42 = *(void *)(v8 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  v42,  v9,  &protocol descriptor for DiffieHellmanKeyAgreement.NumRequirements,  &unk_33EA28);
  uint64_t v40 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = __chkstk_darwin(AssociatedTypeWitness, v11);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12, v15);
  uint64_t v17 = (char *)&v35 - v16;
  v44[0] = a1;
  v44[1] = a2;
  uint64_t v39 = v5;
  int v18 = *v5;
  char v47 = v18;
  uint64_t v41 = v9;
  uint64_t v19 = *(void *)(swift_getAssociatedConformanceWitness(v8, v9, AssociatedTypeWitness, &unk_33EF98, &unk_33EFA8) + 8);
  uint64_t v20 = *(uint64_t (**)(void *, char *, void *, void *, uint64_t, uint64_t))(v19 + 8);
  sub_1F83C0(a1, a2);
  uint64_t v21 = v43;
  uint64_t result = v20(v44, &v47, &type metadata for Data, &protocol witness table for Data, AssociatedTypeWitness, v19);
  if (!v21)
  {
    int v45 = v18;
    uint64_t v43 = AssociatedTypeWitness;
    uint64_t v36 = a1;
    unint64_t v37 = a2;
    uint64_t v23 = v39;
    (*(void (**)(void *__return_ptr, char *, uint64_t))(v42 + 24))(v44, v17, v41);
    unint64_t v24 = v17;
    uint64_t v25 = v23;
    uint64_t v35 = v24;
    uint64_t v26 = v44[0];
    v44[3] = &type metadata for SharedSecret;
    v44[4] = sub_235924();
    v44[0] = v26;
    uint64_t v27 = v42;
    uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v42 + 16);
    swift_retain(v26);
    int64_t v29 = v14;
    v28(v41, v27);
    char v47 = v45;
    uint64_t v30 = v43;
    uint64_t v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 16))(&v47, v43, v19);
    unint64_t v33 = v32;
    uint64_t v34 = *(void (**)(char *, uint64_t))(v40 + 8);
    v34(v29, v30);
    char v47 = *v25;
    char v46 = 0x20100u >> (8 * v47);
    sub_21CF28((uint64_t)v44, v36, v37, v31, v33, 0LL, 0xF000000000000000LL, &v47, v38, &v46);
    sub_1F86D4(v31, v33);
    swift_release(v26);
    v34(v35, v30);
    return __swift_destroy_boxed_opaque_existential_1Tm(v44);
  }

  return result;
}

uint64_t _s5DHKEMO10PrivateKeyVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s5DHKEMO10PrivateKeyVMn);
}

uint64_t _s5DHKEMO9PublicKeyVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s5DHKEMO9PublicKeyVMn);
}

uint64_t sub_23DF18(uint64_t a1)
{
  v4[0] = &unk_282438;
  uint64_t result = swift_checkMetadataState(319LL, *(void *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 0LL, 2LL, v4, a1 + 32);
    return 0LL;
  }

  return result;
}

uint64_t *sub_23DF90(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = ~v5;
  if (v5 > 7
    || (*(_DWORD *)(v4 + 80) & 0x100000) != 0
    || ((v5 + 1) & (unint64_t)~v5) + *(void *)(v4 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    uint64_t *v3 = *a2;
    unint64_t v3 = (uint64_t *)(v9 + ((v5 + 16) & v6));
    swift_retain(v9);
  }

  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    (*(void (**)(unint64_t, unint64_t))(v4 + 16))( ((unint64_t)a1 + v5 + 1) & v6,  ((unint64_t)a2 + v5 + 1) & v6);
  }

  return v3;
}

uint64_t sub_23E02C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8LL) + 8LL))((a1 + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8LL) + 80LL) + 1) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8LL) + 80LL));
}

_BYTE *sub_23E04C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(unint64_t, unint64_t))(v4 + 16))( (unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80),  (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_BYTE *sub_23E09C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(unint64_t, unint64_t))(v4 + 24))( (unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80),  (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_BYTE *sub_23E0EC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))( (unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80),  (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_BYTE *sub_23E13C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(unint64_t, unint64_t))(v4 + 40))( (unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80),  (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

uint64_t sub_23E18C(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0xFC) {
    unsigned int v6 = 252;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
  int v8 = a2 - v6;
  if (a2 <= v6) {
    goto LABEL_22;
  }
  uint64_t v9 = ((v7 + 1) & ~v7) + *(void *)(v4 + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)&a1[v9];
      if (!v11) {
        goto LABEL_22;
      }
      goto LABEL_15;
    }

    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)&a1[v9];
      if (!*(_WORD *)&a1[v9]) {
        goto LABEL_22;
      }
      goto LABEL_15;
    }

    if (v13 < 2)
    {
LABEL_22:
      if (v5 > 0xFC) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))((unint64_t)&a1[v7 + 1] & ~v7);
      }
      unsigned int v15 = *a1;
      if (v15 >= 4) {
        return v15 - 3;
      }
      else {
        return 0LL;
      }
    }
  }

  int v11 = a1[v9];
  if (!a1[v9]) {
    goto LABEL_22;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (!(_DWORD)v9) {
    return v6 + v14 + 1;
  }
  return ((uint64_t (*)(void))((char *)&loc_23E260 + 4 * byte_282370[(v9 - 1)]))();
}

void sub_23E2D0(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  if (*(_DWORD *)(v5 + 84) <= 0xFCu) {
    unsigned int v6 = 252;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  size_t v7 = ((*(unsigned __int8 *)(v5 + 80) + 1LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)) + *(void *)(v5 + 64);
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      unsigned int v10 = ((a3 - v6 + ~(-1 << (8 * v7))) >> (8 * v7)) + 1;
      if (HIWORD(v10))
      {
        unsigned int v8 = &dword_4;
      }

      else if (v10 >= 0x100)
      {
        unsigned int v8 = 2;
      }

      else
      {
        unsigned int v8 = v10 > 1;
      }
    }

    else
    {
      unsigned int v8 = &dword_0 + 1;
    }
  }

  else
  {
    unsigned int v8 = 0;
  }

  if (v6 < a2)
  {
    int v9 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        int v11 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v11;
          *((_BYTE *)a1 + 2) = BYTE2(v11);
        }

        else if ((_DWORD)v7 == 2)
        {
          *a1 = v11;
        }

        else
        {
          *(_BYTE *)a1 = v11;
        }
      }
    }

    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v9;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X13 }

_UNKNOWN **sub_23E4BC()
{
  return &off_3542C0;
}

uint64_t sub_23E4C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_23C82C(a1, a2, a3);
}

void sub_23E4DC()
{
}

uint64_t sub_23E534@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(v4 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  v6,  v5,  &protocol descriptor for DiffieHellmanKeyAgreement.NumRequirements,  &unk_33EA28);
  __chkstk_darwin(AssociatedTypeWitness, v8);
  unsigned int v10 = (char *)&v13 - v9;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v5, v6);
  char v14 = *v2;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v4,  v5,  AssociatedTypeWitness,  &unk_33EF98,  &unk_33EFA8);
  return sub_23C778((uint64_t)v10, &v14, AssociatedTypeWitness, AssociatedConformanceWitness, a2);
}

void sub_23E650()
{
}

uint64_t sub_23E65C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, size_t *a4@<X8>)
{
  return sub_23DC08(a1, a2, a3, a4);
}

uint64_t sub_23E674@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  __chkstk_darwin(a1, a2);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(v9 + 8) + 8LL) + 8LL);
  if (dispatch thunk of Collection.count.getter(v11, v10) >= 12)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
    uint64_t v16 = Data.init<A>(_:)(v8, a2, *(void *)(v10 + 8));
    uint64_t v18 = v17;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
    *a3 = v16;
    a3[1] = v18;
  }

  else
  {
    unint64_t v12 = sub_21719C();
    uint64_t v13 = swift_allocError(&type metadata for CryptoKitError, v12, 0LL, 0LL);
    *(_DWORD *)uint64_t v14 = 1;
    *(_BYTE *)(v14 + 4) = 1;
    swift_willThrow(v13);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  }

  return result;
}

uint64_t sub_23E790@<X0>(void *a1@<X8>)
{
  return sub_23E8F0(a1);
}

uint64_t sub_23E7D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  __chkstk_darwin(a1, a2);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(v9 + 8) + 8LL) + 8LL);
  if (dispatch thunk of Collection.count.getter(v11, v10) == 12)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
    uint64_t v12 = Data.init<A>(_:)(v8, a2, *(void *)(v10 + 8));
    uint64_t v14 = v13;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
    *a3 = v12;
    a3[1] = v14;
  }

  else
  {
    unint64_t v16 = sub_21719C();
    uint64_t v17 = swift_allocError(&type metadata for CryptoKitError, v16, 0LL, 0LL);
    *(_DWORD *)uint64_t v18 = 1;
    *(_BYTE *)(v18 + 4) = 1;
    swift_willThrow(v17);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  }

  return result;
}

uint64_t sub_23E8F0@<X0>(void *a1@<X8>)
{
  unsigned __int8 v6 = 12;
  memset(v5, 0, sizeof(v5));
  uint64_t v2 = ccrng(v5);
  if (!v2) {
LABEL_5:
  }
    __break(1u);
  if (*(_DWORD *)v5)
  {
    __break(1u);
    goto LABEL_5;
  }

  uint64_t result = ccrng_generate_bridge((uint64_t (**)(void))v2);
  unint64_t v4 = *(unsigned int *)&v5[12] | ((unint64_t)v5[16] << 32) | ((unint64_t)v5[17] << 40) | ((unint64_t)v6 << 48);
  *a1 = *(void *)&v5[4];
  a1[1] = v4;
  return result;
}

void sub_23E9A0()
{
}

uint64_t sub_23E9E4@<X0>(uint64_t *a1@<X8>)
{
  return sub_23EC58((uint64_t (*)(void))sub_23E9A0, a1);
}

uint64_t sub_23E9F0()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = sub_227E90(v1, v2);
  sub_1F86D4(v1, v2);
  return v3;
}

uint64_t sub_23EA34(uint64_t *a1, _BYTE *a2, uint64_t a3)
{
  return sub_228BFC(a1, a2, a3, *(void *)v3, *(void *)(v3 + 8));
}

void sub_23EA3C()
{
  __asm { BR              X10 }

size_t sub_23EA84()
{
  uint64_t v3 = v0;
  __int16 v4 = v1;
  char v5 = BYTE2(v1);
  char v6 = BYTE3(v1);
  char v7 = BYTE4(v1);
  char v8 = BYTE5(v1);
  return sub_23EEF8((size_t)&v3, (unint64_t)&v3 + BYTE6(v1));
}

uint64_t sub_23EC58@<X0>(uint64_t (*a1)(void)@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v4 = a1();
  uint64_t result = sub_1F86D4(*(void *)v2, *(void *)(v2 + 8));
  *a2 = v4;
  a2[1] = 0LL;
  return result;
}

void sub_23EC90(uint64_t a1)
{
  __asm { BR              X13 }

void *sub_23ECEC( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __b, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  uint64_t v30 = v25;
  LOWORD(v31) = v24;
  BYTE2(v31) = BYTE2(v24);
  HIBYTE(v31) = BYTE3(v24);
  unsigned __int8 v32 = BYTE4(v24);
  unsigned __int8 v33 = BYTE5(v24);
  unsigned __int8 v34 = BYTE6(v24);
  uint64_t result = memset(&v30, v27, BYTE6(v24));
  unint64_t v29 = v31 | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40) | ((unint64_t)v34 << 48);
  void *v26 = v30;
  v26[1] = v29;
  return result;
}

void sub_23EE78(int *a1, int a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v6 = __DataStorage._bytes.getter();
  if (!v6)
  {
LABEL_10:
    __break(1u);
    return;
  }

  uint64_t v7 = v6;
  uint64_t v8 = __DataStorage._offset.getter();
  uint64_t v9 = v4 - v8;
  if (__OFSUB__(v4, v8))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  int64_t v10 = v5 - v4;
  uint64_t v11 = __DataStorage._length.getter();
  if (v11 >= v10) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v11;
  }
  memset((void *)(v7 + v9), a2, v12);
}

size_t sub_23EEF8(size_t result, unint64_t a2)
{
  if (!result) {
    return (size_t)_swiftEmptyArrayStorage;
  }
  uint64_t v3 = (const void *)result;
  int64_t v4 = a2 - result;
  if (a2 == result) {
    return (size_t)_swiftEmptyArrayStorage;
  }
  if (v4 < 1)
  {
    uint64_t v5 = _swiftEmptyArrayStorage;
    if (!a2) {
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F0);
    uint64_t v5 = (void *)swift_allocObject(v6, v4 + 32, 7LL);
    uint64_t result = _swift_stdlib_malloc_size(v5);
    v5[2] = v4;
    v5[3] = 2 * result - 64;
    if (!a2) {
      goto LABEL_13;
    }
  }

  if ((unint64_t)v3 < a2)
  {
    if ((v4 & 0x8000000000000000LL) == 0)
    {
      memmove(v5 + 4, v3, v4);
      return (size_t)v5;
    }

    __break(1u);
  }

ValueMetadata *_s5NonceVMa()
{
  return &_s5NonceVN;
}

ValueMetadata *_s5NonceVMa_0()
{
  return &_s5NonceVN_0;
}

uint64_t sub_23EFDC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = __chkstk_darwin();
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = v16(v12, v12 + *(void *)(*(void *)(v15 - 8) + 64LL), v14);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  }
  return result;
}

uint64_t sub_23F074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v5 = v3[1];
  v10[0] = *v3;
  v10[1] = v5;
  uint64_t v12 = a3;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A90C8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A7BA8);
  return sub_23EFDC( (uint64_t)v10,  (uint64_t)sub_23F13C,  (uint64_t)v11,  v6,  v7,  a3,  (uint64_t)&protocol self-conformance witness table for Error,  (uint64_t)&v9);
}

uint64_t sub_23F13C(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1) {
    uint64_t v6 = a1 + 32;
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(a1, v6);
  if (v4) {
    *a3 = v4;
  }
  return result;
}

void *sub_23F178()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = *v0;
  uint64_t v6 = _swiftEmptyArrayStorage;
  sub_232094((char *)&v5, (char *)&v6);
  uint64_t v5 = v1;
  sub_232094((char *)&v5, (char *)&v6);
  uint64_t v5 = v2;
  sub_232094((char *)&v5, (char *)&v6);
  uint64_t v5 = v3;
  sub_232094((char *)&v5, (char *)&v6);
  uint64_t result = v6;
  if (v6[2] < 0x20uLL) {
    __break(1u);
  }
  return result;
}

void *sub_23F25C()
{
  uint64_t v23 = 0x6420363532414853LL;
  unint64_t v24 = 0xEF203A7473656769LL;
  __int128 v1 = v0[1];
  v22[0] = *v0;
  v22[1] = v1;
  uint64_t result = sub_23F178();
  unint64_t v6 = (v5 >> 1) - v4;
  if (__OFSUB__(v5 >> 1, v4))
  {
    __break(1u);
    goto LABEL_9;
  }

  if ((uint64_t)(v6 + 0x4000000000000000LL) < 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  size_t v7 = 2 * v6;
  if (((2 * v6) & 0x8000000000000000LL) != 0)
  {
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v8 = (uint64_t)result;
  uint64_t v9 = v3;
  uint64_t v10 = v4;
  unint64_t v11 = v5;
  if (v7)
  {
    uint64_t v12 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(2 * v6, &type metadata for UInt8);
    v12[2] = v7;
    bzero(v12 + 4, v7);
  }

  else
  {
    uint64_t v12 = _swiftEmptyArrayStorage;
  }

  uint64_t v21 = 0LL;
  *(void *)&v22[0] = v12;
  uint64_t v13 = ArraySlice<A>.regions.getter(v8, v9, v10, v11);
  sub_2137A4(v8, v9, v10, v11, (uint64_t *)v22, &v21);
  swift_unknownObjectRelease(v13);
  uint64_t v14 = *(void *)&v22[0];
  uint64_t v15 = *(void *)&v22[0] + 32LL;
  uint64_t v16 = *(void *)(*(void *)&v22[0] + 16LL);
  swift_bridgeObjectRetain(*(void *)&v22[0]);
  uint64_t v17 = static String._fromUTF8Repairing(_:)(v15, v16);
  uint64_t v19 = v18;
  swift_unknownObjectRelease(v8);
  swift_bridgeObjectRelease_n(v14, 2LL);
  v20._countAndFlagsBits = v17;
  v20._object = v19;
  String.append(_:)(v20);
  swift_bridgeObjectRelease(v19);
  return (void *)v23;
}

uint64_t sub_23F3CC()
{
  __int128 v1 = v0[1];
  v3[0] = *v0;
  v3[1] = v1;
  return Hasher.combine(bytes:)(v3, &v4);
}

Swift::Int sub_23F438()
{
  __int128 v4 = *v0;
  uint64_t v1 = *((void *)v0 + 2);
  uint64_t v2 = *((void *)v0 + 3);
  Hasher.init(_seed:)(v8);
  __int128 v5 = v4;
  uint64_t v6 = v1;
  uint64_t v7 = v2;
  Hasher.combine(bytes:)(&v5, v8);
  return Hasher._finalize()();
}

Swift::Int sub_23F4C4()
{
  __int128 v4 = *v0;
  uint64_t v1 = *((void *)v0 + 2);
  uint64_t v2 = *((void *)v0 + 3);
  Hasher.init(_seed:)(v8);
  __int128 v5 = v4;
  uint64_t v6 = v1;
  uint64_t v7 = v2;
  Hasher.combine(bytes:)(&v5, v8);
  return Hasher._finalize()();
}

uint64_t sub_23F54C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23F074(a1, a2, a3);
}

size_t sub_23F564@<X0>(size_t *a1@<X8>)
{
  __int128 v3 = v1[1];
  v5[0] = *v1;
  v5[1] = v3;
  size_t result = sub_23EEF8((size_t)v5, (unint64_t)&v6);
  *a1 = result;
  a1[1] = 0LL;
  return result;
}

void *sub_23F5D0()
{
  return sub_227E9C(*v0, v0[1], v0[2], v0[3]);
}

size_t sub_23F5DC(size_t *a1, _BYTE *a2, size_t a3)
{
  return sub_228C08(a1, a2, a3, *v3, v3[1], v3[2], v3[3]);
}

BOOL sub_23F5E8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  v6[0] = *a1;
  v6[1] = v2;
  __int128 v3 = a2[1];
  v5[0] = *a2;
  v5[1] = v3;
  return cc_cmp_safe(32LL, (char *)v6, (char *)v5) == 0;
}

uint64_t sub_23F654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v5 = v3[1];
  v10[0] = *v3;
  v10[1] = v5;
  _OWORD v10[2] = v3[2];
  uint64_t v12 = a3;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A90D0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A7BA8);
  return sub_23EFDC( (uint64_t)v10,  (uint64_t)sub_240EE8,  (uint64_t)v11,  v6,  v7,  a3,  (uint64_t)&protocol self-conformance witness table for Error,  (uint64_t)&v9);
}

void *sub_23F724()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = *v0;
  uint64_t v8 = _swiftEmptyArrayStorage;
  sub_232094((char *)&v7, (char *)&v8);
  uint64_t v7 = v1;
  sub_232094((char *)&v7, (char *)&v8);
  uint64_t v7 = v2;
  sub_232094((char *)&v7, (char *)&v8);
  uint64_t v7 = v3;
  sub_232094((char *)&v7, (char *)&v8);
  uint64_t v7 = v4;
  sub_232094((char *)&v7, (char *)&v8);
  uint64_t v7 = v5;
  sub_232094((char *)&v7, (char *)&v8);
  size_t result = v8;
  if (v8[2] < 0x30uLL) {
    __break(1u);
  }
  return result;
}

void *sub_23F83C()
{
  uint64_t v23 = 0x6420343833414853LL;
  unint64_t v24 = 0xEF203A7473656769LL;
  __int128 v1 = v0[1];
  v22[0] = *v0;
  v22[1] = v1;
  _OWORD v22[2] = v0[2];
  size_t result = sub_23F724();
  unint64_t v6 = (v5 >> 1) - v4;
  if (__OFSUB__(v5 >> 1, v4))
  {
    __break(1u);
    goto LABEL_9;
  }

  if ((uint64_t)(v6 + 0x4000000000000000LL) < 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  size_t v7 = 2 * v6;
  if (((2 * v6) & 0x8000000000000000LL) != 0)
  {
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v8 = (uint64_t)result;
  uint64_t v9 = v3;
  uint64_t v10 = v4;
  unint64_t v11 = v5;
  if (v7)
  {
    uint64_t v12 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(2 * v6, &type metadata for UInt8);
    v12[2] = v7;
    bzero(v12 + 4, v7);
  }

  else
  {
    uint64_t v12 = _swiftEmptyArrayStorage;
  }

  uint64_t v21 = 0LL;
  *(void *)&v22[0] = v12;
  uint64_t v13 = ArraySlice<A>.regions.getter(v8, v9, v10, v11);
  sub_2137A4(v8, v9, v10, v11, (uint64_t *)v22, &v21);
  swift_unknownObjectRelease(v13);
  uint64_t v14 = *(void *)&v22[0];
  uint64_t v15 = *(void *)&v22[0] + 32LL;
  uint64_t v16 = *(void *)(*(void *)&v22[0] + 16LL);
  swift_bridgeObjectRetain(*(void *)&v22[0]);
  uint64_t v17 = static String._fromUTF8Repairing(_:)(v15, v16);
  uint64_t v19 = v18;
  swift_unknownObjectRelease(v8);
  swift_bridgeObjectRelease_n(v14, 2LL);
  v20._countAndFlagsBits = v17;
  v20._object = v19;
  String.append(_:)(v20);
  swift_bridgeObjectRelease(v19);
  return (void *)v23;
}

uint64_t sub_23F9B4()
{
  __int128 v1 = v0[1];
  v3[0] = *v0;
  v3[1] = v1;
  _OWORD v3[2] = v0[2];
  return Hasher.combine(bytes:)(v3, &v4);
}

Swift::Int sub_23FA28()
{
  __int128 v4 = v0[1];
  __int128 v5 = *v0;
  uint64_t v1 = *((void *)v0 + 4);
  uint64_t v2 = *((void *)v0 + 5);
  Hasher.init(_seed:)(v9);
  v6[0] = v5;
  v6[1] = v4;
  uint64_t v7 = v1;
  uint64_t v8 = v2;
  Hasher.combine(bytes:)(v6, v9);
  return Hasher._finalize()();
}

Swift::Int sub_23FABC()
{
  __int128 v4 = v0[1];
  __int128 v5 = *v0;
  uint64_t v1 = *((void *)v0 + 4);
  uint64_t v2 = *((void *)v0 + 5);
  Hasher.init(_seed:)(v9);
  v6[0] = v5;
  v6[1] = v4;
  uint64_t v7 = v1;
  uint64_t v8 = v2;
  Hasher.combine(bytes:)(v6, v9);
  return Hasher._finalize()();
}

uint64_t sub_23FB4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23F654(a1, a2, a3);
}

size_t sub_23FB64@<X0>(size_t *a1@<X8>)
{
  __int128 v3 = v1[1];
  v5[0] = *v1;
  v5[1] = v3;
  _OWORD v5[2] = v1[2];
  size_t result = sub_23EEF8((size_t)v5, (unint64_t)&v6);
  *a1 = result;
  a1[1] = 0LL;
  return result;
}

void *sub_23FBD8()
{
  __int128 v1 = v0[1];
  v3[0] = *v0;
  v3[1] = v1;
  _OWORD v3[2] = v0[2];
  return sub_228028(v3);
}

size_t sub_23FC08(size_t *a1, _BYTE *a2, size_t a3)
{
  return sub_228D64(a1, a2, a3);
}

BOOL sub_23FC40(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  v6[0] = *a1;
  v6[1] = v2;
  _OWORD v6[2] = a1[2];
  __int128 v3 = a2[1];
  v5[0] = *a2;
  v5[1] = v3;
  _OWORD v5[2] = a2[2];
  return cc_cmp_safe(48LL, (char *)v6, (char *)v5) == 0;
}

__int128 *sub_23FCBC@<X0>(__int128 *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (result) {
    BOOL v3 = a2 - (void)result == 64;
  }
  else {
    BOOL v3 = 0;
  }
  char v4 = !v3;
  __int128 v5 = 0uLL;
  __int128 v6 = 0uLL;
  __int128 v7 = 0uLL;
  __int128 v8 = 0uLL;
  if (v3)
  {
    __int128 v5 = *result;
    __int128 v6 = result[1];
    __int128 v7 = result[2];
    __int128 v8 = result[3];
  }

  *(_OWORD *)a3 = v5;
  *(_OWORD *)(a3 + 16) = v6;
  *(_OWORD *)(a3 + 32) = v7;
  *(_OWORD *)(a3 + 48) = v8;
  *(_BYTE *)(a3 + 64) = v4;
  return result;
}

uint64_t sub_23FD3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v5 = v3[1];
  v11[0] = *v3;
  v11[1] = v5;
  __int128 v6 = v3[3];
  void v11[2] = v3[2];
  uint64_t v11[3] = v6;
  uint64_t v13 = a3;
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A90D8);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A7BA8);
  return sub_23EFDC( (uint64_t)v11,  (uint64_t)sub_240F24,  (uint64_t)v12,  v7,  v8,  a3,  (uint64_t)&protocol self-conformance witness table for Error,  (uint64_t)&v10);
}

void *sub_23FE0C()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[7];
  uint64_t v9 = *v0;
  uint64_t v10 = _swiftEmptyArrayStorage;
  sub_232094((char *)&v9, (char *)&v10);
  uint64_t v9 = v1;
  sub_232094((char *)&v9, (char *)&v10);
  uint64_t v9 = v2;
  sub_232094((char *)&v9, (char *)&v10);
  uint64_t v9 = v3;
  sub_232094((char *)&v9, (char *)&v10);
  uint64_t v9 = v4;
  sub_232094((char *)&v9, (char *)&v10);
  uint64_t v9 = v5;
  sub_232094((char *)&v9, (char *)&v10);
  uint64_t v9 = v6;
  sub_232094((char *)&v9, (char *)&v10);
  uint64_t v9 = v7;
  sub_232094((char *)&v9, (char *)&v10);
  size_t result = v10;
  if (v10[2] < 0x40uLL) {
    __break(1u);
  }
  return result;
}

void *sub_23FF58()
{
  uint64_t v24 = 0x6420323135414853LL;
  unint64_t v25 = 0xEF203A7473656769LL;
  __int128 v1 = v0[1];
  v23[0] = *v0;
  v23[1] = v1;
  __int128 v2 = v0[3];
  v23[2] = v0[2];
  void v23[3] = v2;
  size_t result = sub_23FE0C();
  unint64_t v7 = (v6 >> 1) - v5;
  if (__OFSUB__(v6 >> 1, v5))
  {
    __break(1u);
    goto LABEL_9;
  }

  if ((uint64_t)(v7 + 0x4000000000000000LL) < 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  size_t v8 = 2 * v7;
  if (((2 * v7) & 0x8000000000000000LL) != 0)
  {
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v9 = (uint64_t)result;
  uint64_t v10 = v4;
  uint64_t v11 = v5;
  unint64_t v12 = v6;
  if (v8)
  {
    uint64_t v13 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(2 * v7, &type metadata for UInt8);
    v13[2] = v8;
    bzero(v13 + 4, v8);
  }

  else
  {
    uint64_t v13 = _swiftEmptyArrayStorage;
  }

  uint64_t v22 = 0LL;
  *(void *)&v23[0] = v13;
  uint64_t v14 = ArraySlice<A>.regions.getter(v9, v10, v11, v12);
  sub_2137A4(v9, v10, v11, v12, (uint64_t *)v23, &v22);
  swift_unknownObjectRelease(v14);
  uint64_t v15 = *(void *)&v23[0];
  uint64_t v16 = *(void *)&v23[0] + 32LL;
  uint64_t v17 = *(void *)(*(void *)&v23[0] + 16LL);
  swift_bridgeObjectRetain(*(void *)&v23[0]);
  uint64_t v18 = static String._fromUTF8Repairing(_:)(v16, v17);
  Swift::String v20 = v19;
  swift_unknownObjectRelease(v9);
  swift_bridgeObjectRelease_n(v15, 2LL);
  v21._countAndFlagsBits = v18;
  v21._object = v20;
  String.append(_:)(v21);
  swift_bridgeObjectRelease(v20);
  return (void *)v24;
}

uint64_t sub_2400D0()
{
  __int128 v1 = v0[1];
  v4[0] = *v0;
  v4[1] = v1;
  __int128 v2 = v0[3];
  void v4[2] = v0[2];
  v4[3] = v2;
  return Hasher.combine(bytes:)(v4, &v5);
}

Swift::Int sub_240144()
{
  __int128 v5 = v0[1];
  __int128 v6 = *v0;
  __int128 v4 = v0[2];
  uint64_t v1 = *((void *)v0 + 6);
  uint64_t v2 = *((void *)v0 + 7);
  Hasher.init(_seed:)(v10);
  v7[0] = v6;
  v7[1] = v5;
  v7[2] = v4;
  uint64_t v8 = v1;
  uint64_t v9 = v2;
  Hasher.combine(bytes:)(v7, v10);
  return Hasher._finalize()();
}

Swift::Int sub_2401E4()
{
  __int128 v5 = v0[1];
  __int128 v6 = *v0;
  __int128 v4 = v0[2];
  uint64_t v1 = *((void *)v0 + 6);
  uint64_t v2 = *((void *)v0 + 7);
  Hasher.init(_seed:)(v10);
  v7[0] = v6;
  v7[1] = v5;
  v7[2] = v4;
  uint64_t v8 = v1;
  uint64_t v9 = v2;
  Hasher.combine(bytes:)(v7, v10);
  return Hasher._finalize()();
}

uint64_t sub_240280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23FD3C(a1, a2, a3);
}

size_t sub_240298@<X0>(size_t *a1@<X8>)
{
  __int128 v3 = v1[1];
  v6[0] = *v1;
  v6[1] = v3;
  __int128 v4 = v1[3];
  _OWORD v6[2] = v1[2];
  _OWORD v6[3] = v4;
  size_t result = sub_23EEF8((size_t)v6, (unint64_t)&v7);
  *a1 = result;
  a1[1] = 0LL;
  return result;
}

void *sub_24030C()
{
  __int128 v1 = v0[1];
  v4[0] = *v0;
  v4[1] = v1;
  __int128 v2 = v0[3];
  void v4[2] = v0[2];
  v4[3] = v2;
  return sub_2281BC(v4);
}

size_t sub_24033C(size_t *a1, _BYTE *a2, size_t a3)
{
  return sub_228EC8(a1, a2, a3);
}

BOOL sub_240374(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  v8[0] = *a1;
  v8[1] = v2;
  __int128 v3 = a1[3];
  v8[2] = a1[2];
  v8[3] = v3;
  __int128 v4 = a2[1];
  v7[0] = *a2;
  v7[1] = v4;
  __int128 v5 = a2[3];
  v7[2] = a2[2];
  _OWORD v7[3] = v5;
  return cc_cmp_safe(64LL, (char *)v8, (char *)v7) == 0;
}

uint64_t sub_2403F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *((void *)v3 + 2);
  __int128 v10 = *v3;
  uint64_t v11 = v5;
  uint64_t v13 = a3;
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A90E0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A7BA8);
  return sub_23EFDC( (uint64_t)&v10,  (uint64_t)sub_240F60,  (uint64_t)v12,  v6,  v7,  a3,  (uint64_t)&protocol self-conformance witness table for Error,  (uint64_t)&v9);
}

void *sub_2404C0()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  uint64_t v4 = *v0;
  uint64_t v5 = _swiftEmptyArrayStorage;
  sub_232094((char *)&v4, (char *)&v5);
  uint64_t v4 = v1;
  sub_232094((char *)&v4, (char *)&v5);
  uint64_t v4 = v2;
  sub_232094((char *)&v4, (char *)&v5);
  size_t result = v5;
  if (v5[2] < 0x14uLL) {
    __break(1u);
  }
  return result;
}

void *sub_240588()
{
  uint64_t v1 = *((void *)v0 + 2);
  strcpy((char *)v24, "SHA1 digest: ");
  HIWORD(v24[1]) = -4864;
  __int128 v22 = *v0;
  uint64_t v23 = v1;
  size_t result = sub_2404C0();
  unint64_t v6 = (v5 >> 1) - v4;
  if (__OFSUB__(v5 >> 1, v4))
  {
    __break(1u);
    goto LABEL_9;
  }

  if ((uint64_t)(v6 + 0x4000000000000000LL) < 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  size_t v7 = 2 * v6;
  if (((2 * v6) & 0x8000000000000000LL) != 0)
  {
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v8 = (uint64_t)result;
  uint64_t v9 = v3;
  uint64_t v10 = v4;
  unint64_t v11 = v5;
  if (v7)
  {
    unint64_t v12 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(2 * v6, &type metadata for UInt8);
    v12[2] = v7;
    bzero(v12 + 4, v7);
  }

  else
  {
    unint64_t v12 = _swiftEmptyArrayStorage;
  }

  uint64_t v21 = 0LL;
  *(void *)&__int128 v22 = v12;
  uint64_t v13 = ArraySlice<A>.regions.getter(v8, v9, v10, v11);
  sub_2137A4(v8, v9, v10, v11, (uint64_t *)&v22, &v21);
  swift_unknownObjectRelease(v13);
  uint64_t v14 = v22;
  uint64_t v15 = v22 + 32;
  uint64_t v16 = *(void *)(v22 + 16);
  swift_bridgeObjectRetain(v22);
  uint64_t v17 = static String._fromUTF8Repairing(_:)(v15, v16);
  uint64_t v19 = v18;
  swift_unknownObjectRelease(v8);
  swift_bridgeObjectRelease_n(v14, 2LL);
  v20._countAndFlagsBits = v17;
  v20._object = v19;
  String.append(_:)(v20);
  swift_bridgeObjectRelease(v19);
  return (void *)v24[0];
}

uint64_t sub_240700()
{
  uint64_t v1 = *((void *)v0 + 2);
  __int128 v3 = *v0;
  uint64_t v4 = v1;
  return Hasher.combine(bytes:)(&v3, (char *)&v4 + 4);
}

Swift::Int sub_240774()
{
  __int128 v3 = *v0;
  uint64_t v1 = *((void *)v0 + 2);
  Hasher.init(_seed:)(v6);
  __int128 v4 = v3;
  uint64_t v5 = v1;
  Hasher.combine(bytes:)(&v4, (char *)&v5 + 4);
  return Hasher._finalize()();
}

Swift::Int sub_240800()
{
  __int128 v3 = *v0;
  uint64_t v1 = *((void *)v0 + 2);
  Hasher.init(_seed:)(v6);
  __int128 v4 = v3;
  uint64_t v5 = v1;
  Hasher.combine(bytes:)(&v4, (char *)&v5 + 4);
  return Hasher._finalize()();
}

uint64_t sub_240888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2403F0(a1, a2, a3);
}

size_t sub_2408A0@<X0>(size_t *a1@<X8>)
{
  uint64_t v3 = *((void *)v1 + 2);
  __int128 v5 = *v1;
  uint64_t v6 = v3;
  size_t result = sub_23EEF8((size_t)&v5, (unint64_t)&v6 + 4);
  *a1 = result;
  a1[1] = 0LL;
  return result;
}

void *sub_240914()
{
  return sub_228668(*v0, v0[1], v0[2]);
}

size_t sub_240920(size_t *a1, _BYTE *a2, size_t a3)
{
  return sub_229614(a1, a2, a3, *v3, v3[1], v3[2]);
}

BOOL sub_24092C(__int128 *a1, __int128 *a2)
{
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a2 + 2);
  __int128 v7 = *a1;
  uint64_t v8 = v2;
  __int128 v5 = *a2;
  uint64_t v6 = v3;
  return cc_cmp_safe(20LL, (char *)&v7, (char *)&v5) == 0;
}

uint64_t sub_2409A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v9 = *v3;
  uint64_t v11 = a3;
  uint64_t v12 = a1;
  uint64_t v13 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A90E8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A7BA8);
  return sub_23EFDC( (uint64_t)&v9,  (uint64_t)sub_240F9C,  (uint64_t)v10,  v5,  v6,  a3,  (uint64_t)&protocol self-conformance witness table for Error,  (uint64_t)&v8);
}

void *sub_240A70()
{
  uint64_t v1 = v0[1];
  uint64_t v3 = *v0;
  __int128 v4 = _swiftEmptyArrayStorage;
  sub_232094((char *)&v3, (char *)&v4);
  uint64_t v3 = v1;
  sub_232094((char *)&v3, (char *)&v4);
  size_t result = v4;
  if (v4[2] < 0x10uLL) {
    __break(1u);
  }
  return result;
}

void *sub_240B20()
{
  BYTE5(v22[1]) = 0;
  HIWORD(v22[1]) = -5120;
  __int128 v21 = *v0;
  size_t result = sub_240A70();
  unint64_t v5 = (v4 >> 1) - v3;
  if (__OFSUB__(v4 >> 1, v3))
  {
    __break(1u);
    goto LABEL_9;
  }

  if ((uint64_t)(v5 + 0x4000000000000000LL) < 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  size_t v6 = 2 * v5;
  if (((2 * v5) & 0x8000000000000000LL) != 0)
  {
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v7 = (uint64_t)result;
  uint64_t v8 = v2;
  uint64_t v9 = v3;
  unint64_t v10 = v4;
  if (v6)
  {
    uint64_t v11 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(2 * v5, &type metadata for UInt8);
    void v11[2] = v6;
    bzero(v11 + 4, v6);
  }

  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  uint64_t v20 = 0LL;
  *(void *)&__int128 v21 = v11;
  uint64_t v12 = ArraySlice<A>.regions.getter(v7, v8, v9, v10);
  sub_2137A4(v7, v8, v9, v10, (uint64_t *)&v21, &v20);
  swift_unknownObjectRelease(v12);
  uint64_t v13 = v21;
  uint64_t v14 = v21 + 32;
  uint64_t v15 = *(void *)(v21 + 16);
  swift_bridgeObjectRetain(v21);
  uint64_t v16 = static String._fromUTF8Repairing(_:)(v14, v15);
  uint64_t v18 = v17;
  swift_unknownObjectRelease(v7);
  swift_bridgeObjectRelease_n(v13, 2LL);
  v19._countAndFlagsBits = v16;
  v19._object = v18;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v18);
  return (void *)v22[0];
}

uint64_t sub_240C8C()
{
  __int128 v2 = *v0;
  return Hasher.combine(bytes:)(&v2, &v3);
}

Swift::Int sub_240CF8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  Hasher.init(_seed:)(v5);
  v4[0] = v1;
  v4[1] = v2;
  Hasher.combine(bytes:)(v4, v5);
  return Hasher._finalize()();
}

Swift::Int sub_240D74()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  Hasher.init(_seed:)(v5);
  v4[0] = v1;
  v4[1] = v2;
  Hasher.combine(bytes:)(v4, v5);
  return Hasher._finalize()();
}

uint64_t sub_240DEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2409A8(a1, a2, a3);
}

size_t sub_240E04@<X0>(size_t *a1@<X8>)
{
  __int128 v4 = *v1;
  size_t result = sub_23EEF8((size_t)&v4, (unint64_t)&v5);
  *a1 = result;
  a1[1] = 0LL;
  return result;
}

void *sub_240E70()
{
  return sub_2287F4(*v0, v0[1]);
}

size_t sub_240E78(size_t *a1, _BYTE *a2, size_t a3)
{
  return sub_229770(a1, a2, a3, *v3, v3[1]);
}

BOOL sub_240E80(__int128 *a1, __int128 *a2)
{
  __int128 v2 = *a1;
  __int128 v4 = *a2;
  *(_OWORD *)uint64_t v5 = v2;
  return cc_cmp_safe(16LL, v5, (char *)&v4) == 0;
}

uint64_t sub_240EE8(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1) {
    uint64_t v6 = a1 + 48;
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(a1, v6);
  if (v4) {
    *a3 = v4;
  }
  return result;
}

uint64_t sub_240F24(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1) {
    uint64_t v6 = a1 + 64;
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(a1, v6);
  if (v4) {
    *a3 = v4;
  }
  return result;
}

uint64_t sub_240F60(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1) {
    uint64_t v6 = a1 + 20;
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(a1, v6);
  if (v4) {
    *a3 = v4;
  }
  return result;
}

uint64_t sub_240F9C(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1) {
    uint64_t v6 = a1 + 16;
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(a1, v6);
  if (v4) {
    *a3 = v4;
  }
  return result;
}

unint64_t sub_240FD8(uint64_t a1)
{
  unint64_t result = sub_2306CC();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_240FFC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2416A0( a1,  a2,  a3,  (uint64_t (*)(void))sub_241020,  (uint64_t (*)(void))sub_241064,  (uint64_t (*)(void))sub_2410A8,  (uint64_t (*)(void))sub_2410EC);
}

unint64_t sub_241020()
{
  unint64_t result = qword_3A90F0;
  if (!qword_3A90F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_282678, &type metadata for SHA256Digest);
    atomic_store(result, (unint64_t *)&qword_3A90F0);
  }

  return result;
}

unint64_t sub_241064()
{
  unint64_t result = qword_3A90F8;
  if (!qword_3A90F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_2826A0, &type metadata for SHA256Digest);
    atomic_store(result, (unint64_t *)&qword_3A90F8);
  }

  return result;
}

unint64_t sub_2410A8()
{
  unint64_t result = qword_3A9100;
  if (!qword_3A9100)
  {
    unint64_t result = swift_getWitnessTable(&unk_282638, &type metadata for SHA256Digest);
    atomic_store(result, (unint64_t *)&qword_3A9100);
  }

  return result;
}

unint64_t sub_2410EC()
{
  unint64_t result = qword_3A9108;
  if (!qword_3A9108)
  {
    unint64_t result = swift_getWitnessTable(&unk_2826C8, &type metadata for SHA256Digest);
    atomic_store(result, (unint64_t *)&qword_3A9108);
  }

  return result;
}

unint64_t sub_241134()
{
  unint64_t result = qword_3A9110;
  if (!qword_3A9110)
  {
    unint64_t result = swift_getWitnessTable(&unk_282730, &type metadata for SHA256Digest);
    atomic_store(result, (unint64_t *)&qword_3A9110);
  }

  return result;
}

unint64_t sub_241178(uint64_t a1)
{
  unint64_t result = sub_230780();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24119C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2416A0( a1,  a2,  a3,  (uint64_t (*)(void))sub_2411C0,  (uint64_t (*)(void))sub_241204,  (uint64_t (*)(void))sub_241248,  (uint64_t (*)(void))sub_24128C);
}

unint64_t sub_2411C0()
{
  unint64_t result = qword_3A9118;
  if (!qword_3A9118)
  {
    unint64_t result = swift_getWitnessTable(&unk_2827D0, &type metadata for SHA384Digest);
    atomic_store(result, (unint64_t *)&qword_3A9118);
  }

  return result;
}

unint64_t sub_241204()
{
  unint64_t result = qword_3A9120;
  if (!qword_3A9120)
  {
    unint64_t result = swift_getWitnessTable(&unk_2827F8, &type metadata for SHA384Digest);
    atomic_store(result, (unint64_t *)&qword_3A9120);
  }

  return result;
}

unint64_t sub_241248()
{
  unint64_t result = qword_3A9128;
  if (!qword_3A9128)
  {
    unint64_t result = swift_getWitnessTable(&unk_282790, &type metadata for SHA384Digest);
    atomic_store(result, (unint64_t *)&qword_3A9128);
  }

  return result;
}

unint64_t sub_24128C()
{
  unint64_t result = qword_3A9130;
  if (!qword_3A9130)
  {
    unint64_t result = swift_getWitnessTable(&unk_282820, &type metadata for SHA384Digest);
    atomic_store(result, (unint64_t *)&qword_3A9130);
  }

  return result;
}

unint64_t sub_2412D4()
{
  unint64_t result = qword_3A9138;
  if (!qword_3A9138)
  {
    unint64_t result = swift_getWitnessTable(&unk_282888, &type metadata for SHA384Digest);
    atomic_store(result, (unint64_t *)&qword_3A9138);
  }

  return result;
}

unint64_t sub_241318(uint64_t a1)
{
  unint64_t result = sub_230834();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24133C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2416A0( a1,  a2,  a3,  (uint64_t (*)(void))sub_241360,  (uint64_t (*)(void))sub_2413A4,  (uint64_t (*)(void))sub_2413E8,  (uint64_t (*)(void))sub_24142C);
}

unint64_t sub_241360()
{
  unint64_t result = qword_3A9140;
  if (!qword_3A9140)
  {
    unint64_t result = swift_getWitnessTable(&unk_282928, &type metadata for SHA512Digest);
    atomic_store(result, (unint64_t *)&qword_3A9140);
  }

  return result;
}

unint64_t sub_2413A4()
{
  unint64_t result = qword_3A9148;
  if (!qword_3A9148)
  {
    unint64_t result = swift_getWitnessTable(&unk_282950, &type metadata for SHA512Digest);
    atomic_store(result, (unint64_t *)&qword_3A9148);
  }

  return result;
}

unint64_t sub_2413E8()
{
  unint64_t result = qword_3A9150;
  if (!qword_3A9150)
  {
    unint64_t result = swift_getWitnessTable(&unk_2828E8, &type metadata for SHA512Digest);
    atomic_store(result, (unint64_t *)&qword_3A9150);
  }

  return result;
}

unint64_t sub_24142C()
{
  unint64_t result = qword_3A9158;
  if (!qword_3A9158)
  {
    unint64_t result = swift_getWitnessTable(&unk_282978, &type metadata for SHA512Digest);
    atomic_store(result, (unint64_t *)&qword_3A9158);
  }

  return result;
}

unint64_t sub_241474()
{
  unint64_t result = qword_3A9160;
  if (!qword_3A9160)
  {
    unint64_t result = swift_getWitnessTable(&unk_2829E0, &type metadata for SHA512Digest);
    atomic_store(result, (unint64_t *)&qword_3A9160);
  }

  return result;
}

unint64_t sub_2414B8(uint64_t a1)
{
  unint64_t result = sub_21DAB0();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2414DC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2416A0( a1,  a2,  a3,  (uint64_t (*)(void))sub_241500,  (uint64_t (*)(void))sub_241544,  (uint64_t (*)(void))sub_241588,  (uint64_t (*)(void))sub_2415CC);
}

unint64_t sub_241500()
{
  unint64_t result = qword_3A9168;
  if (!qword_3A9168)
  {
    unint64_t result = swift_getWitnessTable(&unk_282A80, &_s10SHA1DigestVN);
    atomic_store(result, (unint64_t *)&qword_3A9168);
  }

  return result;
}

unint64_t sub_241544()
{
  unint64_t result = qword_3A9170;
  if (!qword_3A9170)
  {
    unint64_t result = swift_getWitnessTable(&unk_282AA8, &_s10SHA1DigestVN);
    atomic_store(result, (unint64_t *)&qword_3A9170);
  }

  return result;
}

unint64_t sub_241588()
{
  unint64_t result = qword_3A9178;
  if (!qword_3A9178)
  {
    unint64_t result = swift_getWitnessTable(&unk_282A40, &_s10SHA1DigestVN);
    atomic_store(result, (unint64_t *)&qword_3A9178);
  }

  return result;
}

unint64_t sub_2415CC()
{
  unint64_t result = qword_3A9180;
  if (!qword_3A9180)
  {
    unint64_t result = swift_getWitnessTable(&unk_282AD0, &_s10SHA1DigestVN);
    atomic_store(result, (unint64_t *)&qword_3A9180);
  }

  return result;
}

unint64_t sub_241614()
{
  unint64_t result = qword_3A9188;
  if (!qword_3A9188)
  {
    unint64_t result = swift_getWitnessTable(&unk_282B38, &_s10SHA1DigestVN);
    atomic_store(result, (unint64_t *)&qword_3A9188);
  }

  return result;
}

unint64_t sub_241658(uint64_t a1)
{
  unint64_t result = sub_21DBA8();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24167C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2416A0( a1,  a2,  a3,  (uint64_t (*)(void))sub_2416F0,  (uint64_t (*)(void))sub_241734,  (uint64_t (*)(void))sub_241778,  (uint64_t (*)(void))sub_2417BC);
}

uint64_t sub_2416A0( void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  a1[1] = a4();
  a1[2] = a5();
  a1[3] = a6();
  uint64_t result = a7();
  a1[4] = result;
  return result;
}

unint64_t sub_2416F0()
{
  unint64_t result = qword_3A9190;
  if (!qword_3A9190)
  {
    unint64_t result = swift_getWitnessTable(&unk_282BD8, &_s9MD5DigestVN);
    atomic_store(result, (unint64_t *)&qword_3A9190);
  }

  return result;
}

unint64_t sub_241734()
{
  unint64_t result = qword_3A9198;
  if (!qword_3A9198)
  {
    unint64_t result = swift_getWitnessTable(&unk_282C00, &_s9MD5DigestVN);
    atomic_store(result, (unint64_t *)&qword_3A9198);
  }

  return result;
}

unint64_t sub_241778()
{
  unint64_t result = qword_3A91A0;
  if (!qword_3A91A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_282B98, &_s9MD5DigestVN);
    atomic_store(result, (unint64_t *)&qword_3A91A0);
  }

  return result;
}

unint64_t sub_2417BC()
{
  unint64_t result = qword_3A91A8;
  if (!qword_3A91A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_282C28, &_s9MD5DigestVN);
    atomic_store(result, (unint64_t *)&qword_3A91A8);
  }

  return result;
}

unint64_t sub_241804()
{
  unint64_t result = qword_3A91B0;
  if (!qword_3A91B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_282C90, &_s9MD5DigestVN);
    atomic_store(result, (unint64_t *)&qword_3A91B0);
  }

  return result;
}

ValueMetadata *type metadata accessor for SHA256Digest()
{
  return &type metadata for SHA256Digest;
}

uint64_t getEnumTagSinglePayload for SHA384Digest(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for SHA384Digest(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = (a2 - 1);
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

ValueMetadata *type metadata accessor for SHA384Digest()
{
  return &type metadata for SHA384Digest;
}

uint64_t getEnumTagSinglePayload for SHA512Digest(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for SHA512Digest(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = (a2 - 1);
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

ValueMetadata *type metadata accessor for SHA512Digest()
{
  return &type metadata for SHA512Digest;
}

uint64_t _s10SHA1DigestVwet(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t _s10SHA1DigestVwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)unint64_t result = (a2 - 1);
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

ValueMetadata *_s10SHA1DigestVMa()
{
  return &_s10SHA1DigestVN;
}

ValueMetadata *_s9MD5DigestVMa()
{
  return &_s9MD5DigestVN;
}

uint64_t sub_241998@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_241AA0( a1,  (uint64_t (*)(void))ccec_cp_256,  (uint64_t (*)(void *, uint64_t, uint64_t, void **, void *))sub_23BAE4,  a2);
}

uint64_t sub_2419F0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_241AA0( a1,  (uint64_t (*)(void))ccec_cp_384,  (uint64_t (*)(void *, uint64_t, uint64_t, void **, void *))sub_23BAE4,  a2);
}

uint64_t sub_241A48@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_241AA0( a1,  (uint64_t (*)(void))ccec_cp_521,  (uint64_t (*)(void *, uint64_t, uint64_t, void **, void *))sub_23BAE4,  a2);
}

uint64_t sub_241AA0@<X0>( uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t (*a3)(void *, uint64_t, uint64_t, void **, void *)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = *a1;
  uint64_t v9 = *v4;
  uint64_t v10 = a2();
  if (!v10) {
LABEL_7:
  }
    __break(1u);
  uint64_t v11 = v10;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  v16[0] = v11;
  swift_dynamicCast(&v15, v16, (char *)&type metadata for Any + 8, v17, 7LL);
  unint64_t v12 = groupOrderByteCountForCP(v15);
  if ((v12 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_7;
  }

  uint64_t v13 = (void *)v12;
  swift_beginAccess(v9 + 16, v16, 0LL, 0LL);
  uint64_t v15 = v13;
  uint64_t result = a3(v13, v9 + 32, v8 + 32, &v15, v13);
  if (!v5) {
    *a4 = result;
  }
  return result;
}

uint64_t sub_241BA4@<X0>(char a1@<W0>, uint64_t *a2@<X8>)
{
  return sub_244E00(a1, ccec_cp_256, (uint64_t (*)(uint64_t, void, uint64_t))sub_23B9A0, a2);
}

uint64_t sub_241BB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_2452F0( a1,  a2,  a3,  (uint64_t (*)(uint64_t))sub_2461F4,  (uint64_t)&type metadata for P256,  (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_219060,  a4);
}

uint64_t sub_241BE8@<X0>(char a1@<W0>, uint64_t *a2@<X8>)
{
  return sub_244E00(a1, ccec_cp_384, (uint64_t (*)(uint64_t, void, uint64_t))sub_23B9BC, a2);
}

uint64_t sub_241BFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_2452F0( a1,  a2,  a3,  (uint64_t (*)(uint64_t))sub_246238,  (uint64_t)&type metadata for P384,  (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_219060,  a4);
}

uint64_t sub_241C28@<X0>(char a1@<W0>, uint64_t *a2@<X8>)
{
  return sub_244E00( a1,  (uint64_t (*)(void))ccec_cp_521,  (uint64_t (*)(uint64_t, void, uint64_t))sub_23B9D8,  a2);
}

uint64_t sub_241C3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_2452F0( a1,  a2,  a3,  (uint64_t (*)(uint64_t))sub_24627C,  (uint64_t)&type metadata for P521,  (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_219060,  a4);
}

uint64_t sub_241C68( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(void *, uint64_t *))
{
  v16[0] = a1;
  v16[1] = a2;
  v16[2] = a3;
  void v16[3] = a4;
  uint64_t result = a5();
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
    v14[0] = v8;
    swift_dynamicCast(&v17, v14, (char *)&type metadata for Any + 8, v15, 7LL);
    uint64_t v9 = getccec_full_ctx_size(v17);
    __chkstk_darwin(v9, v10);
    v13[2] = v16;
    v13[3] = v11;
    unint64_t v12 = sub_23BBF8(v11, a6, (uint64_t)v13);
    swift_unknownObjectRelease(v16[0]);
    return v12;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_241D3C(uint64_t result, uint64_t a2, uint64_t ***a3, uint64_t (*a4)(void))
{
  uint64_t v4 = *a3;
  if (!*a3)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v7 = result;
  uint64_t result = a4();
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  uint64_t v8 = result;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  v18[0] = v8;
  uint64_t result = swift_dynamicCast(&v17, v18, (char *)&type metadata for Any + 8, v19, 7LL);
  if (!v7)
  {
LABEL_16:
    __break(1u);
    return result;
  }

  int v9 = ccec_raw_import_priv_only(v17, a2 - v7, v7, v4);
  int v20 = v9;
  if (v9)
  {
    int v10 = v9;
    unint64_t v11 = sub_21719C();
    uint64_t v12 = swift_allocError(&type metadata for CryptoKitError, v11, 0LL, 0LL);
    *(_DWORD *)uint64_t v13 = v10;
    *(_BYTE *)(v13 + 4) = 0;
    return swift_willThrow(v12);
  }

  else
  {
    int64_t v14 = ccec_der_export_priv_size((uint64_t *)v4, 0LL, 0);
    if (v14)
    {
      uint64_t v15 = sub_23BE4C(v14);
    }

    else
    {
      if (qword_3A7D18 != -1) {
        swift_once(&qword_3A7D18, sub_2384DC);
      }
      uint64_t v15 = (uint64_t *)off_3A8E78[0];
      swift_retain(off_3A8E78[0]);
    }

    if ((swift_isUniquelyReferenced_nonNull_native(v15) & 1) == 0)
    {
      size_t v16 = sub_2348C8((uint64_t)v15);
      swift_release(v15);
      uint64_t v15 = (uint64_t *)v16;
    }

    swift_beginAccess(v15 + 2, v18, 0LL, 0LL);
    sub_241EE8((uint64_t)(v15 + 4), (uint64_t)v15 + v15[2] + 32, &v20, (unint64_t **)v4, a4);
    return swift_release(v15);
  }

uint64_t sub_241EE8(uint64_t result, uint64_t a2, _DWORD *a3, unint64_t **a4, uint64_t (*a5)(void))
{
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v8 = (unsigned __int8 *)result;
  uint64_t v9 = a2 - result;
  int v10 = ccec_der_export_priv(a4, 0LL, 0, a2 - result, result);
  *a3 = v10;
  if (v10)
  {
    int v11 = v10;
    unint64_t v12 = sub_21719C();
    uint64_t v13 = swift_allocError(&type metadata for CryptoKitError, v12, 0LL, 0LL);
    *(_DWORD *)uint64_t v14 = v11;
    goto LABEL_7;
  }

  uint64_t result = a5();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v15 = result;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  v18[0] = v15;
  swift_dynamicCast(&v20, v18, (char *)&type metadata for Any + 8, v19, 7LL);
  uint64_t result = ccec_der_import_priv(v20, v9, v8, (uint64_t **)a4);
  *a3 = result;
  if (!(_DWORD)result) {
    return result;
  }
  int v16 = result;
  unint64_t v17 = sub_21719C();
  uint64_t v13 = swift_allocError(&type metadata for CryptoKitError, v17, 0LL, 0LL);
  *(_DWORD *)uint64_t v14 = v16;
LABEL_7:
  *(_BYTE *)(v14 + 4) = 0;
  return swift_willThrow(v13);
}

unint64_t sub_242024(uint64_t a1, uint64_t (*a2)(void))
{
  char v3 = (const void *)ccec_ctx_k((void **)(a1 + 32));
  unint64_t result = a2();
  if (result)
  {
    unint64_t v5 = result;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
    v10[0] = v5;
    swift_dynamicCast(&v9, v10, (char *)&type metadata for Any + 8, v11, 7LL);
    unint64_t result = groupOrderByteCountForCP(v9);
    if ((result & 0x8000000000000000LL) == 0)
    {
      size_t v6 = sub_2420F0(v3, result);
      size_t v7 = sub_2349C8(v6);
      swift_bridgeObjectRelease(v6);
      uint64_t v8 = sub_23C058(v7);
      swift_release(v7);
      return v8;
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_2420F0(const void *a1, int64_t a2)
{
  uint64_t result = (uint64_t)sub_23B5A4(a1, a2);
  uint64_t v3 = result;
  unint64_t v4 = *(void *)(result + 16);
  if (v4 < 2) {
    return v3;
  }
  unint64_t v5 = 0LL;
  unint64_t v6 = v4 >> 1;
  for (unint64_t i = v4 + 31; ; --i)
  {
    if (v5 == i - 32) {
      goto LABEL_5;
    }
    unint64_t v8 = *(void *)(v3 + 16);
    if (v5 >= v8) {
      break;
    }
    if (i - 32 >= v8) {
      goto LABEL_12;
    }
    char v9 = *(_BYTE *)(v3 + v5 + 32);
    char v10 = *(_BYTE *)(v3 + i);
    uint64_t result = swift_isUniquelyReferenced_nonNull_native(v3);
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_237300(v3);
      uint64_t v3 = result;
    }

    *(_BYTE *)(v3 + v5 + 32) = v10;
    *(_BYTE *)(v3 + i) = v9;
LABEL_5:
    if (v6 == ++v5) {
      return v3;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_2421AC(int64_t a1, int64_t a2, uint64_t a3)
{
  uint64_t result = sub_22897C(a1, a2, a3);
  uint64_t v4 = result;
  unint64_t v5 = *(void *)(result + 16);
  if (v5 < 2) {
    return v4;
  }
  unint64_t v6 = 0LL;
  unint64_t v7 = v5 >> 1;
  for (unint64_t i = v5 + 3; ; --i)
  {
    if (v6 == i - 4) {
      goto LABEL_5;
    }
    unint64_t v9 = *(void *)(v4 + 16);
    if (v6 >= v9) {
      break;
    }
    if (i - 4 >= v9) {
      goto LABEL_12;
    }
    uint64_t v10 = *(void *)(v4 + 8 * v6 + 32);
    uint64_t v11 = *(void *)(v4 + 8 * i);
    uint64_t result = swift_isUniquelyReferenced_nonNull_native(v4);
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_237314(v4);
      uint64_t v4 = result;
    }

    *(void *)(v4 + 8 * v6 + 32) = v11;
    *(void *)(v4 + 8 * i) = v10;
LABEL_5:
    if (v7 == ++v6) {
      return v4;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_242268( uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(void *, uint64_t *))
{
  uint64_t v24 = result;
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  unint64_t v27 = a4;
  uint64_t v23 = 0LL;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
  }

  else
  {
    uint64_t v9 = result;
    unint64_t v10 = sub_2423D0((_BYTE *)(a2 + a3), (_BYTE *)(a2 + (a4 >> 1)), a5);
    if (v6)
    {
      uint64_t v11 = v9;
      goto LABEL_7;
    }

    uint64_t result = ((uint64_t (*)(unint64_t))a5)(v10);
    if (result)
    {
      uint64_t v12 = result;
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
      v21[0] = v12;
      swift_dynamicCast(&v20, v21, (char *)&type metadata for Any + 8, v22, 7LL);
      uint64_t v13 = getccec_pub_ctx_size(v20);
      uint64_t v19 = __chkstk_darwin(v13, v14);
      a6 = (uint64_t (*)(void *, uint64_t *))sub_215258(v19, a6);
      if (!v23)
      {
        swift_unknownObjectRelease(v24);
        return (uint64_t)a6;
      }

      unint64_t v15 = sub_21719C();
      uint64_t v16 = swift_allocError(&type metadata for CryptoKitError, v15, 0LL, 0LL);
      *(_DWORD *)uint64_t v17 = 1;
      *(_BYTE *)(v17 + 4) = 1;
      swift_willThrow(v16);
      uint64_t v18 = v24;
      swift_bridgeObjectRelease(a6);
      uint64_t v11 = v18;
LABEL_7:
      swift_unknownObjectRelease(v11);
      return (uint64_t)a6;
    }
  }

  __break(1u);
  return result;
}

unint64_t sub_2423D0(_BYTE *a1, _BYTE *a2, uint64_t (*a3)(void))
{
  unint64_t result = a3();
  if (!result) {
    goto LABEL_15;
  }
  unint64_t v6 = result;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  v12[0] = v6;
  swift_dynamicCast(&v11, v12, (char *)&type metadata for Any + 8, v13, 7LL);
  unint64_t result = groupOrderByteCountForCP(v11);
  if ((result & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }

  if ((uint64_t)(result + 0x4000000000000000LL) < 0)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    return result;
  }

  if (!a1 || a2 - a1 != ((2 * result) | 1))
  {
    unint64_t v10 = sub_21719C();
    uint64_t v8 = swift_allocError(&type metadata for CryptoKitError, v10, 0LL, 0LL);
    *(_DWORD *)uint64_t v9 = 1;
    goto LABEL_10;
  }

  if (a2 == a1) {
    goto LABEL_14;
  }
  if (*a1 == 4) {
    return result;
  }
  unint64_t v7 = sub_21719C();
  uint64_t v8 = swift_allocError(&type metadata for CryptoKitError, v7, 0LL, 0LL);
  *(_DWORD *)uint64_t v9 = 5;
LABEL_10:
  *(_BYTE *)(v9 + 4) = 1;
  return swift_willThrow(v8);
}

uint64_t sub_2424FC( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(void))
{
  uint64_t v10 = (a5 >> 1) - a4;
  if (__OFSUB__(a5 >> 1, a4))
  {
    __break(1u);
  }

  else
  {
    uint64_t v16 = result;
    unint64_t result = a10();
    if (result)
    {
      uint64_t v17 = result;
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
      v18[0] = v17;
      swift_dynamicCast(&v20, v18, (char *)&type metadata for Any + 8, v19, 7LL);
      unint64_t result = ccec_import_pub(v20, v10, a3 + a4, v16);
      *a6 = (int)result;
      *a7 = a8;
      return result;
    }
  }

  __break(1u);
  return result;
}

void sub_2425D8(uint64_t a1)
{
  uint64_t v1 = (uint64_t *)(a1 + 32);
  swift_bridgeObjectRetain(a1);
  unint64_t v2 = ccec_export_pub_size(v1);
  uint64_t v3 = static Array._allocateBufferUninitialized(minimumCapacity:)(v2, &type metadata for UInt8);
  *(void *)(v3 + 16) = v2;
  ccec_export_pub(v1, (char *)(v3 + 32));
  *(void *)(v3 + 16) = v2;
  sub_2157CC(v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease(v3);
  __asm { BR              X10 }

uint64_t sub_242678()
{
  uint64_t v13 = v2;
  __int16 v14 = v1;
  char v15 = BYTE2(v1);
  char v16 = BYTE3(v1);
  char v17 = BYTE4(v1);
  char v18 = BYTE5(v1);
  uint64_t v4 = v3();
  if (!v4)
  {
    __break(1u);
    JUMPOUT(0x2429D4LL);
  }

  uint64_t v5 = v4;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  uint64_t v19 = v5;
  swift_dynamicCast(&v12, &v19, (char *)&type metadata for Any + 8, v20, 7LL);
  BOOL IsCompactRepresentable = keyIsCompactRepresentable((unsigned __int8 *)&v13, BYTE6(v1), v12);
  sub_1F86D4(v2, v1);
  if (IsCompactRepresentable)
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v0) & 1) == 0) {
      uint64_t v0 = sub_237300((uint64_t)v0);
    }
    unint64_t v7 = ccec_signature_r_s_size((uint64_t *)v0 + 4);
    unint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)(v7, &type metadata for UInt8);
      *((void *)v9 + 2) = v8;
    }

    else
    {
      uint64_t v9 = (char *)_swiftEmptyArrayStorage;
    }

    ccec_compact_export_pub(v9 + 32, (uint64_t *)v0 + 4);
    *((void *)v9 + 2) = v8;
    uint64_t v10 = sub_2157CC((uint64_t)v9);
    swift_bridgeObjectRelease(v0);
    swift_bridgeObjectRelease(v9);
  }

  else
  {
    swift_bridgeObjectRelease(v0);
    return 0LL;
  }

  return v10;
}

uint64_t sub_2429F8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
    v10[0] = v4;
    swift_dynamicCast(&v9, v10, (char *)&type metadata for Any + 8, v11, 7LL);
    uint64_t result = ccec_compressed_x962_export_pub_size(v9);
    if (result < 0)
    {
      __break(1u);
    }

    else
    {
      uint64_t v5 = result;
      unint64_t v6 = (uint64_t *)(a1 + 32);
      if (result)
      {
        unint64_t v7 = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)(result, &type metadata for UInt8);
        *((void *)v7 + 2) = v5;
      }

      else
      {
        unint64_t v7 = (char *)_swiftEmptyArrayStorage;
      }

      uint64_t result = ccec_compressed_x962_export_pub(v6, v7 + 32);
      if (!(_DWORD)result)
      {
        *((void *)v7 + 2) = v5;
        uint64_t v8 = sub_2157CC((uint64_t)v7);
        swift_bridgeObjectRelease(v7);
        return v8;
      }
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

void sub_242AE0(uint64_t a1)
{
  unint64_t v1 = (uint64_t *)(a1 + 32);
  unint64_t v2 = ccec_export_pub_size((uint64_t *)(a1 + 32));
  uint64_t v3 = static Array._allocateBufferUninitialized(minimumCapacity:)(v2, &type metadata for UInt8);
  *(void *)(v3 + 16) = v2;
  ccec_export_pub(v1, (char *)(v3 + 32));
  *(void *)(v3 + 16) = v2;
  sub_2157CC(v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease(v3);
  __asm { BR              X10 }

uint64_t sub_242B58()
{
  if (!BYTE6(v0))
  {
    __break(1u);
    JUMPOUT(0x242BB4LL);
  }

  uint64_t v2 = ((uint64_t (*)(uint64_t, void, uint64_t, unint64_t))Data._Representation.subscript.getter)( 1LL,  BYTE6(v0),  v1,  v0);
  sub_1F86D4(v1, v0);
  return v2;
}

uint64_t sub_242BC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_24525C(a1, a2, a3, (uint64_t (*)(void))sub_2461F4, (uint64_t)&type metadata for P256, sub_2199B0, a4);
}

uint64_t sub_242BF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_24525C(a1, a2, a3, (uint64_t (*)(void))sub_2461F4, (uint64_t)&type metadata for P256, sub_2198F0, a4);
}

uint64_t sub_242C1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_2452F0( a1,  a2,  a3,  (uint64_t (*)(uint64_t))sub_2461F4,  (uint64_t)&type metadata for P256,  (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_2192F0,  a4);
}

uint64_t sub_242C48@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2453D4(a1, a2, ccec_cp_256, sub_246790, a3);
}

uint64_t sub_242C6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_2455BC(a1, a2, a3, ccec_cp_256, sub_246790, a4);
}

uint64_t sub_242C90()
{
  uint64_t v1 = *v0;
  if (qword_3A7C90 != -1) {
    swift_once(&qword_3A7C90, sub_224284);
  }
  uint64_t v2 = qword_3AE728;
  uint64_t v3 = unk_3AE730;
  __int128 v16 = xmmword_3AE738;
  uint64_t v4 = qword_3AE748;
  swift_unknownObjectRetain(unk_3AE730);
  swift_bridgeObjectRetain(v1);
  swift_bridgeObjectRetain(v2);
  unint64_t v5 = ccec_export_pub_size((uint64_t *)(v1 + 32));
  uint64_t v6 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5, &type metadata for UInt8);
  *(void *)(v6 + 16) = v5;
  ccec_export_pub((uint64_t *)(v1 + 32), (char *)(v6 + 32));
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = sub_2157CC(v6);
  unint64_t v9 = v8;
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(v6);
  sub_245FE8(v7, v9);
  uint64_t v11 = v10;
  sub_1F86D4(v7, v9);
  uint64_t v12 = (2LL * *(void *)(v11 + 16)) | 1;
  v18[0] = v2;
  v18[1] = v3;
  __int128 v19 = v16;
  uint64_t v20 = v4;
  uint64_t v21 = v11;
  uint64_t v22 = v11 + 32;
  uint64_t v23 = 0LL;
  uint64_t v24 = v12;
  char v17 = sub_2121E4(0LL, 1024LL, 0, (char *)_swiftEmptyArrayStorage);
  swift_bridgeObjectRetain(v2);
  swift_unknownObjectRetain(v3);
  swift_unknownObjectRetain(v11);
  sub_22B0D4(48, &v17, (char *)v18);
  swift_unknownObjectRelease(v11);
  swift_unknownObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  uint64_t v13 = v17;
  uint64_t v14 = sub_2157CC((uint64_t)v17);
  swift_unknownObjectRelease(v11);
  swift_unknownObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v13);
  return v14;
}

uint64_t sub_242E7C()
{
  return sub_2434A4(sub_242C90);
}

uint64_t sub_242E88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_24525C( a1,  a2,  a3,  (uint64_t (*)(void))sub_2461F4,  (uint64_t)&type metadata for P256,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2196A4,  a4);
}

uint64_t sub_242EB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_24525C( a1,  a2,  a3,  (uint64_t (*)(void))sub_2461F4,  (uint64_t)&type metadata for P256,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2196C0,  a4);
}

uint64_t sub_242EE0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_243530(a1, a2, a3);
}

uint64_t sub_242F04@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_243588(a1, a2, ccec_cp_256, (uint64_t (*)(void *, uint64_t *))sub_246770, a3);
}

uint64_t sub_242F28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_2438EC(a1, a2, a3, ccec_cp_256, (uint64_t (*)(void *, uint64_t *))sub_246770, a4);
}

uint64_t sub_242F4C@<X0>(void *a1@<X8>)
{
  return sub_245968(ccec_cp_256, a1);
}

uint64_t sub_242F5C()
{
  uint64_t v1 = *v0;
  if (qword_3A7C90 != -1) {
    swift_once(&qword_3A7C90, sub_224284);
  }
  uint64_t v2 = qword_3AE728;
  uint64_t v3 = unk_3AE730;
  __int128 v4 = xmmword_3AE738;
  uint64_t v5 = qword_3AE748;
  swift_unknownObjectRetain(unk_3AE730);
  swift_retain(v1);
  swift_bridgeObjectRetain(v2);
  unint64_t v6 = sub_242024(v1, (uint64_t (*)(void))ccec_cp_256);
  unint64_t v8 = v7;
  swift_release(v1);
  sub_245FE8(v6, v8);
  uint64_t v10 = v9;
  uint64_t v11 = sub_1F86D4(v6, v8);
  uint64_t v12 = ccec_cp_256(v11);
  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v13 = v12;
  *((void *)&v38 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  *(void *)&__int128 v37 = v13;
  swift_retain(v1);
  swift_dynamicCast(v30, &v37, (char *)&type metadata for Any + 8, *((void *)&v38 + 1), 7LL);
  uint64_t v14 = getccec_pub_ctx_size(*(void **)&v30[0]);
  if (v14 < 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    uint64_t result = swift_unexpectedError(v10, "CryptoKit_Static/ECDH.swift", 27LL, 1LL, 294LL);
    __break(1u);
    return result;
  }

  size_t v15 = v14;
  if (v14)
  {
    __int128 v16 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(v14, &type metadata for UInt8);
    v16[2] = v15;
  }

  else
  {
    __int128 v16 = _swiftEmptyArrayStorage;
  }

  memcpy(v16 + 4, (const void *)(v1 + 32), v15);
  v16[2] = v15;
  swift_release(v1);
  unint64_t v17 = ccec_export_pub_size(v16 + 4);
  uint64_t v18 = static Array._allocateBufferUninitialized(minimumCapacity:)(v17, &type metadata for UInt8);
  *(void *)(v18 + 16) = v17;
  ccec_export_pub(v16 + 4, (char *)(v18 + 32));
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = sub_2157CC(v18);
  unint64_t v21 = v20;
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v18);
  sub_245FE8(v19, v21);
  uint64_t v23 = v22;
  sub_1F86D4(v19, v21);
  uint64_t v24 = *(void *)(v23 + 16);
  uint64_t v25 = (2LL * *(void *)(v10 + 16)) | 1;
  *(void *)&v30[0] = v2;
  *((void *)&v30[0] + 1) = v3;
  v30[1] = v4;
  *(void *)unsigned int v31 = v5;
  memset(&v31[8], 0, 32);
  uint64_t v32 = 0LL;
  *(void *)&__int128 v33 = v10;
  *((void *)&v33 + 1) = v10 + 32;
  *(void *)&__int128 v34 = 0LL;
  *((void *)&v34 + 1) = v25;
  *(void *)&__int128 v35 = v23;
  *((void *)&v35 + 1) = v23 + 32;
  *(void *)&__int128 v36 = 0LL;
  *((void *)&v36 + 1) = (2 * v24) | 1;
  __int128 v39 = *(_OWORD *)v31;
  __int128 v40 = *(_OWORD *)&v31[16];
  __int128 v37 = v30[0];
  __int128 v38 = v4;
  __int128 v44 = v35;
  __int128 v45 = v36;
  __int128 v42 = v33;
  __int128 v43 = v34;
  __int128 v41 = 0uLL;
  unint64_t v29 = sub_2121E4(0LL, 1024LL, 0, (char *)_swiftEmptyArrayStorage);
  sub_2464E0((uint64_t *)v30);
  sub_22B468(48, &v29, (char *)&v37);
  sub_225AF4(v30);
  uint64_t v26 = v29;
  uint64_t v27 = sub_2157CC((uint64_t)v29);
  swift_bridgeObjectRelease(v26);
  sub_225AF4(v30);
  return v27;
}

uint64_t sub_243248()
{
  return sub_243E54(sub_242F5C);
}

void sub_243254()
{
}

void sub_243274()
{
}

uint64_t sub_24328C()
{
  return sub_2429F8(*v0, (uint64_t (*)(void))ccec_cp_256);
}

uint64_t sub_2432AC()
{
  uint64_t v1 = *v0;
  if (qword_3A7C90 != -1) {
    swift_once(&qword_3A7C90, sub_224284);
  }
  uint64_t v2 = qword_3AE728;
  uint64_t v3 = unk_3AE730;
  __int128 v16 = xmmword_3AE738;
  uint64_t v4 = qword_3AE748;
  swift_unknownObjectRetain(unk_3AE730);
  swift_bridgeObjectRetain(v1);
  swift_bridgeObjectRetain(v2);
  unint64_t v5 = ccec_export_pub_size((uint64_t *)(v1 + 32));
  uint64_t v6 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5, &type metadata for UInt8);
  *(void *)(v6 + 16) = v5;
  ccec_export_pub((uint64_t *)(v1 + 32), (char *)(v6 + 32));
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = sub_2157CC(v6);
  unint64_t v9 = v8;
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(v6);
  sub_245FE8(v7, v9);
  uint64_t v11 = v10;
  sub_1F86D4(v7, v9);
  uint64_t v12 = (2LL * *(void *)(v11 + 16)) | 1;
  v18[0] = v2;
  v18[1] = v3;
  __int128 v19 = v16;
  uint64_t v20 = v4;
  uint64_t v21 = v11;
  uint64_t v22 = v11 + 32;
  uint64_t v23 = 0LL;
  uint64_t v24 = v12;
  unint64_t v17 = sub_2121E4(0LL, 1024LL, 0, (char *)_swiftEmptyArrayStorage);
  swift_bridgeObjectRetain(v2);
  swift_unknownObjectRetain(v3);
  swift_unknownObjectRetain(v11);
  sub_22B0D4(48, &v17, (char *)v18);
  swift_unknownObjectRelease(v11);
  swift_unknownObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  uint64_t v13 = v17;
  uint64_t v14 = sub_2157CC((uint64_t)v17);
  swift_unknownObjectRelease(v11);
  swift_unknownObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v13);
  return v14;
}

uint64_t sub_243498()
{
  return sub_2434A4(sub_2432AC);
}

uint64_t sub_2434A4(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  unint64_t v3 = v2;
  uint64_t v4 = sub_222CE4(0x4B2043494C425550LL, (void *)0xEA00000000005945LL);
  swift_bridgeObjectRelease(0xEA00000000005945LL);
  sub_1F86D4(v1, v3);
  return v4;
}

uint64_t sub_243530@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v8 = v7;
  uint64_t result = sub_1F86D4(a1, a2);
  if (!v3) {
    *a3 = v8;
  }
  return result;
}

uint64_t sub_243588@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t (*a4)(void *, uint64_t *)@<X3>, uint64_t *a5@<X8>)
{
  uint64_t result = sub_2238E0(a1, a2);
  if (!v5)
  {
    uint64_t v13 = result;
    uint64_t v14 = v10;
    uint64_t v15 = v11;
    unint64_t v16 = v12;
    if (result == 0x4156495250204345LL && v10 == 0xEE0059454B204554LL
      || (_stringCompareWithSmolCheck(_:_:expecting:)(0x4156495250204345LL, 0xEE0059454B204554LL, result, v10, 0LL) & 1) != 0)
    {
      sub_1F83C0(v15, v16);
      sub_245FE8(v15, v16);
      uint64_t v18 = v17;
      sub_1F86D4(v15, v16);
      sub_22AC40(v18, v18 + 32, 0LL, (2LL * *(void *)(v18 + 16)) | 1, (uint64_t)v34);
      swift_release(v18);
      sub_2226E4(v34, 0x30u, (uint64_t)v35);
      uint64_t v19 = v35[6];
      uint64_t v20 = v35[7];
      uint64_t v21 = v35[8];
      uint64_t v22 = swift_unknownObjectRetain(v35[5]);
      uint64_t v32 = sub_241C68(v22, v19, v20, v21, a3, a4);
      swift_bridgeObjectRelease(v14);
      sub_1F86D4(v15, v16);
      uint64_t result = (uint64_t)sub_225AA4(v35);
      *a5 = v32;
    }

    else if (v13 == 0x2045544156495250LL && v14 == 0xEB0000000059454BLL {
           || (_stringCompareWithSmolCheck(_:_:expecting:)(0x2045544156495250LL, 0xEB0000000059454BLL, v13, v14, 0LL) & 1) != 0)
    }
    {
      sub_1F83C0(v15, v16);
      sub_245FE8(v15, v16);
      uint64_t v24 = v23;
      sub_1F86D4(v15, v16);
      sub_22AC40(v24, v24 + 32, 0LL, (2LL * *(void *)(v24 + 16)) | 1, (uint64_t)v36);
      swift_release(v24);
      sub_225858(v36, 0x30u, v37);
      uint64_t v25 = v39;
      uint64_t v26 = v40;
      uint64_t v27 = v41;
      uint64_t v28 = swift_unknownObjectRetain(v38);
      uint64_t v33 = sub_241C68(v28, v25, v26, v27, a3, a4);
      swift_bridgeObjectRelease(v14);
      sub_1F86D4(v15, v16);
      uint64_t result = (uint64_t)sub_225AF4(v37);
      *a5 = v33;
    }

    else
    {
      unint64_t v29 = sub_222964();
      uint64_t v30 = swift_allocError(&type metadata for CryptoKitASN1Error, v29, 0LL, 0LL);
      *unsigned int v31 = 7;
      swift_willThrow(v30);
      swift_bridgeObjectRelease(v14);
      return sub_1F86D4(v15, v16);
    }
  }

  return result;
}

uint64_t sub_2438EC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(void)@<X3>, uint64_t (*a5)(void *, uint64_t *)@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v40 = a5;
  unsigned int v31 = a4;
  uint64_t v7 = v6;
  uint64_t v12 = *(void *)(a2 - 8);
  double v13 = __chkstk_darwin(a1, a2);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v12 + 16))(v15, a1, a2, v13);
  uint64_t v16 = Array.init<A>(_:)(v15, &type metadata for UInt8, a2, *(void *)(*(void *)(*(void *)(a3 + 8) + 8LL) + 8LL));
  unint64_t v17 = (2LL * *(void *)(v16 + 16)) | 1;
  sub_22AC40(v16, v16 + 32, 0LL, v17, (uint64_t)v32);
  uint64_t v30 = a6;
  if (v6)
  {
    sub_22AC40(v16, v16 + 32, 0LL, v17, (uint64_t)v38);
    swift_bridgeObjectRelease(v16);
    sub_2226E4(v38, 0x30u, (uint64_t)v39);
    uint64_t v21 = v39[6];
    uint64_t v22 = v39[7];
    uint64_t v23 = v39[8];
    uint64_t v24 = swift_unknownObjectRetain(v39[5]);
    uint64_t v25 = sub_241C68(v24, v21, v22, v23, v31, v40);
    swift_errorRelease(v7);
    sub_225AA4(v39);
    uint64_t v26 = v25;
  }

  else
  {
    sub_225858(v32, 0x30u, v33);
    uint64_t v18 = v35;
    uint64_t v19 = v36;
    uint64_t v29 = v37;
    uint64_t v20 = swift_unknownObjectRetain(v34);
    uint64_t v26 = sub_241C68(v20, v18, v19, v29, v31, v40);
    swift_bridgeObjectRelease(v16);
    sub_225AF4(v33);
  }

  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(a1, a2);
  *uint64_t v30 = v26;
  return result;
}

unint64_t sub_243B3C()
{
  return sub_242024(*v0, (uint64_t (*)(void))ccec_cp_256);
}

uint64_t sub_243B5C()
{
  uint64_t v1 = *v0;
  if (qword_3A7C90 != -1) {
    swift_once(&qword_3A7C90, sub_224284);
  }
  uint64_t v2 = qword_3AE728;
  uint64_t v3 = unk_3AE730;
  __int128 v4 = xmmword_3AE738;
  uint64_t v5 = qword_3AE748;
  swift_unknownObjectRetain(unk_3AE730);
  swift_retain(v1);
  swift_bridgeObjectRetain(v2);
  unint64_t v6 = sub_242024(v1, (uint64_t (*)(void))ccec_cp_256);
  unint64_t v8 = v7;
  swift_release(v1);
  sub_245FE8(v6, v8);
  uint64_t v10 = v9;
  uint64_t v11 = sub_1F86D4(v6, v8);
  uint64_t v12 = ccec_cp_256(v11);
  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v13 = v12;
  *((void *)&v38 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  *(void *)&__int128 v37 = v13;
  swift_retain(v1);
  swift_dynamicCast(v30, &v37, (char *)&type metadata for Any + 8, *((void *)&v38 + 1), 7LL);
  uint64_t v14 = getccec_pub_ctx_size(*(void **)&v30[0]);
  if (v14 < 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    uint64_t result = swift_unexpectedError(v10, "CryptoKit_Static/ECDH.swift", 27LL, 1LL, 574LL);
    __break(1u);
    return result;
  }

  size_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(v14, &type metadata for UInt8);
    v16[2] = v15;
  }

  else
  {
    uint64_t v16 = _swiftEmptyArrayStorage;
  }

  memcpy(v16 + 4, (const void *)(v1 + 32), v15);
  v16[2] = v15;
  swift_release(v1);
  unint64_t v17 = ccec_export_pub_size(v16 + 4);
  uint64_t v18 = static Array._allocateBufferUninitialized(minimumCapacity:)(v17, &type metadata for UInt8);
  *(void *)(v18 + 16) = v17;
  ccec_export_pub(v16 + 4, (char *)(v18 + 32));
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = sub_2157CC(v18);
  unint64_t v21 = v20;
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v18);
  sub_245FE8(v19, v21);
  uint64_t v23 = v22;
  sub_1F86D4(v19, v21);
  uint64_t v24 = *(void *)(v23 + 16);
  uint64_t v25 = (2LL * *(void *)(v10 + 16)) | 1;
  *(void *)&v30[0] = v2;
  *((void *)&v30[0] + 1) = v3;
  v30[1] = v4;
  *(void *)unsigned int v31 = v5;
  memset(&v31[8], 0, 32);
  uint64_t v32 = 0LL;
  *(void *)&__int128 v33 = v10;
  *((void *)&v33 + 1) = v10 + 32;
  *(void *)&__int128 v34 = 0LL;
  *((void *)&v34 + 1) = v25;
  *(void *)&__int128 v35 = v23;
  *((void *)&v35 + 1) = v23 + 32;
  *(void *)&__int128 v36 = 0LL;
  *((void *)&v36 + 1) = (2 * v24) | 1;
  __int128 v39 = *(_OWORD *)v31;
  __int128 v40 = *(_OWORD *)&v31[16];
  __int128 v37 = v30[0];
  __int128 v38 = v4;
  __int128 v44 = v35;
  __int128 v45 = v36;
  __int128 v42 = v33;
  __int128 v43 = v34;
  __int128 v41 = 0uLL;
  uint64_t v29 = sub_2121E4(0LL, 1024LL, 0, (char *)_swiftEmptyArrayStorage);
  sub_2464E0((uint64_t *)v30);
  sub_22B468(48, &v29, (char *)&v37);
  sub_225AF4(v30);
  uint64_t v26 = v29;
  uint64_t v27 = sub_2157CC((uint64_t)v29);
  swift_bridgeObjectRelease(v26);
  sub_225AF4(v30);
  return v27;
}

uint64_t sub_243E48()
{
  return sub_243E54(sub_243B5C);
}

uint64_t sub_243E54(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  unint64_t v3 = v2;
  uint64_t v4 = sub_222CE4(0x2045544156495250LL, (void *)0xEB0000000059454BLL);
  swift_bridgeObjectRelease(0xEB0000000059454BLL);
  sub_1F86D4(v1, v3);
  return v4;
}

uint64_t sub_243EE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_24525C(a1, a2, a3, (uint64_t (*)(void))sub_246238, (uint64_t)&type metadata for P384, sub_2199B0, a4);
}

uint64_t sub_243F14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_24525C(a1, a2, a3, (uint64_t (*)(void))sub_246238, (uint64_t)&type metadata for P384, sub_2198F0, a4);
}

uint64_t sub_243F40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_2452F0( a1,  a2,  a3,  (uint64_t (*)(uint64_t))sub_246238,  (uint64_t)&type metadata for P384,  (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_2192F0,  a4);
}

uint64_t sub_243F6C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2453D4(a1, a2, ccec_cp_384, sub_24674C, a3);
}

uint64_t sub_243F90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_2455BC(a1, a2, a3, ccec_cp_384, sub_24674C, a4);
}

uint64_t sub_243FB4()
{
  uint64_t v1 = *v0;
  if (qword_3A7C98 != -1) {
    swift_once(&qword_3A7C98, sub_2243B0);
  }
  uint64_t v2 = qword_3AE750;
  uint64_t v3 = *(void *)algn_3AE758;
  __int128 v16 = xmmword_3AE760;
  uint64_t v4 = qword_3AE770;
  swift_unknownObjectRetain(*(void *)algn_3AE758);
  swift_bridgeObjectRetain(v1);
  swift_bridgeObjectRetain(v2);
  unint64_t v5 = ccec_export_pub_size((uint64_t *)(v1 + 32));
  uint64_t v6 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5, &type metadata for UInt8);
  *(void *)(v6 + 16) = v5;
  ccec_export_pub((uint64_t *)(v1 + 32), (char *)(v6 + 32));
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = sub_2157CC(v6);
  unint64_t v9 = v8;
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(v6);
  sub_245FE8(v7, v9);
  uint64_t v11 = v10;
  sub_1F86D4(v7, v9);
  uint64_t v12 = (2LL * *(void *)(v11 + 16)) | 1;
  v18[0] = v2;
  v18[1] = v3;
  __int128 v19 = v16;
  uint64_t v20 = v4;
  uint64_t v21 = v11;
  uint64_t v22 = v11 + 32;
  uint64_t v23 = 0LL;
  uint64_t v24 = v12;
  unint64_t v17 = sub_2121E4(0LL, 1024LL, 0, (char *)_swiftEmptyArrayStorage);
  swift_bridgeObjectRetain(v2);
  swift_unknownObjectRetain(v3);
  swift_unknownObjectRetain(v11);
  sub_22B0D4(48, &v17, (char *)v18);
  swift_unknownObjectRelease(v11);
  swift_unknownObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  uint64_t v13 = v17;
  uint64_t v14 = sub_2157CC((uint64_t)v17);
  swift_unknownObjectRelease(v11);
  swift_unknownObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v13);
  return v14;
}

uint64_t sub_2441A0()
{
  return sub_2434A4(sub_243FB4);
}

uint64_t sub_2441AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_24525C( a1,  a2,  a3,  (uint64_t (*)(void))sub_246238,  (uint64_t)&type metadata for P384,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2196A4,  a4);
}

uint64_t sub_2441D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_24525C( a1,  a2,  a3,  (uint64_t (*)(void))sub_246238,  (uint64_t)&type metadata for P384,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2196C0,  a4);
}

uint64_t sub_244204@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_243530(a1, a2, a3);
}

uint64_t sub_244228@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_243588(a1, a2, ccec_cp_384, (uint64_t (*)(void *, uint64_t *))sub_24672C, a3);
}

uint64_t sub_24424C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_2438EC(a1, a2, a3, ccec_cp_384, (uint64_t (*)(void *, uint64_t *))sub_24672C, a4);
}

uint64_t sub_244270@<X0>(void *a1@<X8>)
{
  return sub_245968(ccec_cp_384, a1);
}

uint64_t sub_24427C()
{
  uint64_t v1 = *v0;
  if (qword_3A7C98 != -1) {
    swift_once(&qword_3A7C98, sub_2243B0);
  }
  uint64_t v2 = qword_3AE750;
  uint64_t v3 = *(void *)algn_3AE758;
  __int128 v4 = xmmword_3AE760;
  uint64_t v5 = qword_3AE770;
  swift_unknownObjectRetain(*(void *)algn_3AE758);
  swift_retain(v1);
  swift_bridgeObjectRetain(v2);
  unint64_t v6 = sub_242024(v1, (uint64_t (*)(void))ccec_cp_384);
  unint64_t v8 = v7;
  swift_release(v1);
  sub_245FE8(v6, v8);
  uint64_t v10 = v9;
  uint64_t v11 = sub_1F86D4(v6, v8);
  uint64_t v12 = ccec_cp_384(v11);
  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v13 = v12;
  *((void *)&v38 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  *(void *)&__int128 v37 = v13;
  swift_retain(v1);
  swift_dynamicCast(v30, &v37, (char *)&type metadata for Any + 8, *((void *)&v38 + 1), 7LL);
  uint64_t v14 = getccec_pub_ctx_size(*(void **)&v30[0]);
  if (v14 < 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    uint64_t result = swift_unexpectedError(v10, "CryptoKit_Static/ECDH.swift", 27LL, 1LL, 853LL);
    __break(1u);
    return result;
  }

  size_t v15 = v14;
  if (v14)
  {
    __int128 v16 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(v14, &type metadata for UInt8);
    v16[2] = v15;
  }

  else
  {
    __int128 v16 = _swiftEmptyArrayStorage;
  }

  memcpy(v16 + 4, (const void *)(v1 + 32), v15);
  v16[2] = v15;
  swift_release(v1);
  unint64_t v17 = ccec_export_pub_size(v16 + 4);
  uint64_t v18 = static Array._allocateBufferUninitialized(minimumCapacity:)(v17, &type metadata for UInt8);
  *(void *)(v18 + 16) = v17;
  ccec_export_pub(v16 + 4, (char *)(v18 + 32));
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = sub_2157CC(v18);
  unint64_t v21 = v20;
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v18);
  sub_245FE8(v19, v21);
  uint64_t v23 = v22;
  sub_1F86D4(v19, v21);
  uint64_t v24 = *(void *)(v23 + 16);
  uint64_t v25 = (2LL * *(void *)(v10 + 16)) | 1;
  *(void *)&v30[0] = v2;
  *((void *)&v30[0] + 1) = v3;
  v30[1] = v4;
  *(void *)unsigned int v31 = v5;
  memset(&v31[8], 0, 32);
  uint64_t v32 = 0LL;
  *(void *)&__int128 v33 = v10;
  *((void *)&v33 + 1) = v10 + 32;
  *(void *)&__int128 v34 = 0LL;
  *((void *)&v34 + 1) = v25;
  *(void *)&__int128 v35 = v23;
  *((void *)&v35 + 1) = v23 + 32;
  *(void *)&__int128 v36 = 0LL;
  *((void *)&v36 + 1) = (2 * v24) | 1;
  __int128 v39 = *(_OWORD *)v31;
  __int128 v40 = *(_OWORD *)&v31[16];
  __int128 v37 = v30[0];
  __int128 v38 = v4;
  __int128 v44 = v35;
  __int128 v45 = v36;
  __int128 v42 = v33;
  __int128 v43 = v34;
  __int128 v41 = 0uLL;
  uint64_t v29 = sub_2121E4(0LL, 1024LL, 0, (char *)_swiftEmptyArrayStorage);
  sub_2464E0((uint64_t *)v30);
  sub_22B468(48, &v29, (char *)&v37);
  sub_225AF4(v30);
  uint64_t v26 = v29;
  uint64_t v27 = sub_2157CC((uint64_t)v29);
  swift_bridgeObjectRelease(v26);
  sub_225AF4(v30);
  return v27;
}

uint64_t sub_244568()
{
  return sub_243E54(sub_24427C);
}

void sub_244574()
{
}

uint64_t sub_244594()
{
  return sub_2429F8(*v0, (uint64_t (*)(void))ccec_cp_384);
}

uint64_t sub_2445B4()
{
  uint64_t v1 = *v0;
  if (qword_3A7C98 != -1) {
    swift_once(&qword_3A7C98, sub_2243B0);
  }
  uint64_t v2 = qword_3AE750;
  uint64_t v3 = *(void *)algn_3AE758;
  __int128 v16 = xmmword_3AE760;
  uint64_t v4 = qword_3AE770;
  swift_unknownObjectRetain(*(void *)algn_3AE758);
  swift_bridgeObjectRetain(v1);
  swift_bridgeObjectRetain(v2);
  unint64_t v5 = ccec_export_pub_size((uint64_t *)(v1 + 32));
  uint64_t v6 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5, &type metadata for UInt8);
  *(void *)(v6 + 16) = v5;
  ccec_export_pub((uint64_t *)(v1 + 32), (char *)(v6 + 32));
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = sub_2157CC(v6);
  unint64_t v9 = v8;
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(v6);
  sub_245FE8(v7, v9);
  uint64_t v11 = v10;
  sub_1F86D4(v7, v9);
  uint64_t v12 = (2LL * *(void *)(v11 + 16)) | 1;
  v18[0] = v2;
  v18[1] = v3;
  __int128 v19 = v16;
  uint64_t v20 = v4;
  uint64_t v21 = v11;
  uint64_t v22 = v11 + 32;
  uint64_t v23 = 0LL;
  uint64_t v24 = v12;
  unint64_t v17 = sub_2121E4(0LL, 1024LL, 0, (char *)_swiftEmptyArrayStorage);
  swift_bridgeObjectRetain(v2);
  swift_unknownObjectRetain(v3);
  swift_unknownObjectRetain(v11);
  sub_22B0D4(48, &v17, (char *)v18);
  swift_unknownObjectRelease(v11);
  swift_unknownObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  uint64_t v13 = v17;
  uint64_t v14 = sub_2157CC((uint64_t)v17);
  swift_unknownObjectRelease(v11);
  swift_unknownObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v13);
  return v14;
}

uint64_t sub_2447A0()
{
  return sub_2434A4(sub_2445B4);
}

unint64_t sub_2447AC()
{
  return sub_242024(*v0, (uint64_t (*)(void))ccec_cp_384);
}

uint64_t sub_2447CC()
{
  uint64_t v1 = *v0;
  if (qword_3A7C98 != -1) {
    swift_once(&qword_3A7C98, sub_2243B0);
  }
  uint64_t v2 = qword_3AE750;
  uint64_t v3 = *(void *)algn_3AE758;
  __int128 v4 = xmmword_3AE760;
  uint64_t v5 = qword_3AE770;
  swift_unknownObjectRetain(*(void *)algn_3AE758);
  swift_retain(v1);
  swift_bridgeObjectRetain(v2);
  unint64_t v6 = sub_242024(v1, (uint64_t (*)(void))ccec_cp_384);
  unint64_t v8 = v7;
  swift_release(v1);
  sub_245FE8(v6, v8);
  uint64_t v10 = v9;
  uint64_t v11 = sub_1F86D4(v6, v8);
  uint64_t v12 = ccec_cp_384(v11);
  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v13 = v12;
  *((void *)&v38 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  *(void *)&__int128 v37 = v13;
  swift_retain(v1);
  swift_dynamicCast(v30, &v37, (char *)&type metadata for Any + 8, *((void *)&v38 + 1), 7LL);
  uint64_t v14 = getccec_pub_ctx_size(*(void **)&v30[0]);
  if (v14 < 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    uint64_t result = swift_unexpectedError(v10, "CryptoKit_Static/ECDH.swift", 27LL, 1LL, 1133LL);
    __break(1u);
    return result;
  }

  size_t v15 = v14;
  if (v14)
  {
    __int128 v16 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(v14, &type metadata for UInt8);
    v16[2] = v15;
  }

  else
  {
    __int128 v16 = _swiftEmptyArrayStorage;
  }

  memcpy(v16 + 4, (const void *)(v1 + 32), v15);
  v16[2] = v15;
  swift_release(v1);
  unint64_t v17 = ccec_export_pub_size(v16 + 4);
  uint64_t v18 = static Array._allocateBufferUninitialized(minimumCapacity:)(v17, &type metadata for UInt8);
  *(void *)(v18 + 16) = v17;
  ccec_export_pub(v16 + 4, (char *)(v18 + 32));
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = sub_2157CC(v18);
  unint64_t v21 = v20;
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v18);
  sub_245FE8(v19, v21);
  uint64_t v23 = v22;
  sub_1F86D4(v19, v21);
  uint64_t v24 = *(void *)(v23 + 16);
  uint64_t v25 = (2LL * *(void *)(v10 + 16)) | 1;
  *(void *)&v30[0] = v2;
  *((void *)&v30[0] + 1) = v3;
  v30[1] = v4;
  *(void *)unsigned int v31 = v5;
  memset(&v31[8], 0, 32);
  uint64_t v32 = 0LL;
  *(void *)&__int128 v33 = v10;
  *((void *)&v33 + 1) = v10 + 32;
  *(void *)&__int128 v34 = 0LL;
  *((void *)&v34 + 1) = v25;
  *(void *)&__int128 v35 = v23;
  *((void *)&v35 + 1) = v23 + 32;
  *(void *)&__int128 v36 = 0LL;
  *((void *)&v36 + 1) = (2 * v24) | 1;
  __int128 v39 = *(_OWORD *)v31;
  __int128 v40 = *(_OWORD *)&v31[16];
  __int128 v37 = v30[0];
  __int128 v38 = v4;
  __int128 v44 = v35;
  __int128 v45 = v36;
  __int128 v42 = v33;
  __int128 v43 = v34;
  __int128 v41 = 0uLL;
  uint64_t v29 = sub_2121E4(0LL, 1024LL, 0, (char *)_swiftEmptyArrayStorage);
  sub_2464E0((uint64_t *)v30);
  sub_22B468(48, &v29, (char *)&v37);
  sub_225AF4(v30);
  uint64_t v26 = v29;
  uint64_t v27 = sub_2157CC((uint64_t)v29);
  swift_bridgeObjectRelease(v26);
  sub_225AF4(v30);
  return v27;
}

uint64_t sub_244AB8()
{
  return sub_243E54(sub_2447CC);
}

uint64_t sub_244AC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_24525C(a1, a2, a3, (uint64_t (*)(void))sub_24627C, (uint64_t)&type metadata for P521, sub_2199B0, a4);
}

uint64_t sub_244AF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_24525C(a1, a2, a3, (uint64_t (*)(void))sub_24627C, (uint64_t)&type metadata for P521, sub_2198F0, a4);
}

uint64_t sub_244B1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_2452F0( a1,  a2,  a3,  (uint64_t (*)(uint64_t))sub_24627C,  (uint64_t)&type metadata for P521,  (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_2192F0,  a4);
}

uint64_t sub_244B48@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2453D4(a1, a2, (uint64_t (*)(void))ccec_cp_521, sub_246708, a3);
}

uint64_t sub_244B6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_2455BC(a1, a2, a3, (uint64_t (*)(void))ccec_cp_521, sub_246708, a4);
}

uint64_t sub_244B90()
{
  uint64_t v1 = (uint64_t *)(*v0 + 32LL);
  unint64_t v2 = ccec_export_pub_size(v1);
  uint64_t v3 = static Array._allocateBufferUninitialized(minimumCapacity:)(v2, &type metadata for UInt8);
  *(void *)(v3 + 16) = v2;
  ccec_export_pub(v1, (char *)(v3 + 32));
  *(void *)(v3 + 16) = v2;
  uint64_t v4 = sub_2157CC(v3);
  swift_bridgeObjectRelease(v3);
  return v4;
}

uint64_t sub_244C08()
{
  uint64_t v1 = *v0;
  if (qword_3A7CA0 != -1) {
    swift_once(&qword_3A7CA0, sub_2244DC);
  }
  uint64_t v2 = qword_3AE778;
  uint64_t v3 = unk_3AE780;
  __int128 v16 = xmmword_3AE788;
  uint64_t v4 = qword_3AE798;
  swift_unknownObjectRetain(unk_3AE780);
  swift_bridgeObjectRetain(v1);
  swift_bridgeObjectRetain(v2);
  unint64_t v5 = ccec_export_pub_size((uint64_t *)(v1 + 32));
  uint64_t v6 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5, &type metadata for UInt8);
  *(void *)(v6 + 16) = v5;
  ccec_export_pub((uint64_t *)(v1 + 32), (char *)(v6 + 32));
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = sub_2157CC(v6);
  unint64_t v9 = v8;
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(v6);
  sub_245FE8(v7, v9);
  uint64_t v11 = v10;
  sub_1F86D4(v7, v9);
  uint64_t v12 = (2LL * *(void *)(v11 + 16)) | 1;
  v18[0] = v2;
  v18[1] = v3;
  __int128 v19 = v16;
  uint64_t v20 = v4;
  uint64_t v21 = v11;
  uint64_t v22 = v11 + 32;
  uint64_t v23 = 0LL;
  uint64_t v24 = v12;
  unint64_t v17 = sub_2121E4(0LL, 1024LL, 0, (char *)_swiftEmptyArrayStorage);
  swift_bridgeObjectRetain(v2);
  swift_unknownObjectRetain(v3);
  swift_unknownObjectRetain(v11);
  sub_22B0D4(48, &v17, (char *)v18);
  swift_unknownObjectRelease(v11);
  swift_unknownObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  uint64_t v13 = v17;
  uint64_t v14 = sub_2157CC((uint64_t)v17);
  swift_unknownObjectRelease(v11);
  swift_unknownObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v13);
  return v14;
}

uint64_t sub_244DF4()
{
  return sub_2434A4(sub_244C08);
}

uint64_t sub_244E00@<X0>( char a1@<W0>, uint64_t (*a2)(void)@<X1>, uint64_t (*a3)(uint64_t, void, uint64_t)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = a2();
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
    v11[0] = v8;
    swift_dynamicCast(&v10, v11, (char *)&type metadata for Any + 8, v12, 7LL);
    uint64_t v9 = getccec_full_ctx_size(v10);
    uint64_t result = a3(v9, a1 & 1, v9);
    *a4 = result;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_244E94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_24525C( a1,  a2,  a3,  (uint64_t (*)(void))sub_24627C,  (uint64_t)&type metadata for P521,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2196A4,  a4);
}

uint64_t sub_244EC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_24525C( a1,  a2,  a3,  (uint64_t (*)(void))sub_24627C,  (uint64_t)&type metadata for P521,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2196C0,  a4);
}

uint64_t sub_244EEC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_243530(a1, a2, a3);
}

uint64_t sub_244F10@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_243588(a1, a2, (uint64_t (*)(void))ccec_cp_521, (uint64_t (*)(void *, uint64_t *))sub_2466E8, a3);
}

uint64_t sub_244F34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_2438EC( a1,  a2,  a3,  (uint64_t (*)(void))ccec_cp_521,  (uint64_t (*)(void *, uint64_t *))sub_2466E8,  a4);
}

uint64_t sub_244F58@<X0>(void *a1@<X8>)
{
  return sub_245968((uint64_t (*)(void))ccec_cp_521, a1);
}

uint64_t sub_244F64()
{
  uint64_t v1 = *v0;
  if (qword_3A7CA0 != -1) {
    swift_once(&qword_3A7CA0, sub_2244DC);
  }
  uint64_t v2 = qword_3AE778;
  uint64_t v3 = unk_3AE780;
  __int128 v4 = xmmword_3AE788;
  uint64_t v5 = qword_3AE798;
  swift_unknownObjectRetain(unk_3AE780);
  swift_retain(v1);
  swift_bridgeObjectRetain(v2);
  unint64_t v6 = sub_242024(v1, (uint64_t (*)(void))ccec_cp_521);
  unint64_t v8 = v7;
  swift_release(v1);
  sub_245FE8(v6, v8);
  uint64_t v10 = v9;
  sub_1F86D4(v6, v8);
  uint64_t v11 = ccec_cp_521();
  if (!v11) {
    goto LABEL_10;
  }
  uint64_t v12 = v11;
  *((void *)&v37 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  *(void *)&__int128 v36 = v12;
  swift_retain(v1);
  swift_dynamicCast(v29, &v36, (char *)&type metadata for Any + 8, *((void *)&v37 + 1), 7LL);
  uint64_t v13 = getccec_pub_ctx_size(*(void **)&v29[0]);
  if (v13 < 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    uint64_t result = swift_unexpectedError(v10, "CryptoKit_Static/ECDH.swift", 27LL, 1LL, 1412LL);
    __break(1u);
    return result;
  }

  size_t v14 = v13;
  if (v13)
  {
    size_t v15 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(v13, &type metadata for UInt8);
    v15[2] = v14;
  }

  else
  {
    size_t v15 = _swiftEmptyArrayStorage;
  }

  memcpy(v15 + 4, (const void *)(v1 + 32), v14);
  v15[2] = v14;
  swift_release(v1);
  unint64_t v16 = ccec_export_pub_size(v15 + 4);
  uint64_t v17 = static Array._allocateBufferUninitialized(minimumCapacity:)(v16, &type metadata for UInt8);
  *(void *)(v17 + 16) = v16;
  ccec_export_pub(v15 + 4, (char *)(v17 + 32));
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = sub_2157CC(v17);
  unint64_t v20 = v19;
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v17);
  sub_245FE8(v18, v20);
  uint64_t v22 = v21;
  sub_1F86D4(v18, v20);
  uint64_t v23 = *(void *)(v22 + 16);
  uint64_t v24 = (2LL * *(void *)(v10 + 16)) | 1;
  *(void *)&v29[0] = v2;
  *((void *)&v29[0] + 1) = v3;
  v29[1] = v4;
  *(void *)uint64_t v30 = v5;
  memset(&v30[8], 0, 32);
  uint64_t v31 = 0LL;
  *(void *)&__int128 v32 = v10;
  *((void *)&v32 + 1) = v10 + 32;
  *(void *)&__int128 v33 = 0LL;
  *((void *)&v33 + 1) = v24;
  *(void *)&__int128 v34 = v22;
  *((void *)&v34 + 1) = v22 + 32;
  *(void *)&__int128 v35 = 0LL;
  *((void *)&v35 + 1) = (2 * v23) | 1;
  __int128 v38 = *(_OWORD *)v30;
  __int128 v39 = *(_OWORD *)&v30[16];
  __int128 v36 = v29[0];
  __int128 v37 = v4;
  __int128 v43 = v34;
  __int128 v44 = v35;
  __int128 v41 = v32;
  __int128 v42 = v33;
  __int128 v40 = 0uLL;
  uint64_t v28 = sub_2121E4(0LL, 1024LL, 0, (char *)_swiftEmptyArrayStorage);
  sub_2464E0((uint64_t *)v29);
  sub_22B468(48, &v28, (char *)&v36);
  sub_225AF4(v29);
  uint64_t v25 = v28;
  uint64_t v26 = sub_2157CC((uint64_t)v28);
  swift_bridgeObjectRelease(v25);
  sub_225AF4(v29);
  return v26;
}

uint64_t sub_245250()
{
  return sub_243E54(sub_244F64);
}

uint64_t sub_24525C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(void)@<X3>, uint64_t a5@<X4>, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v14 = a4();
  uint64_t v15 = a6(a1, a5, a2, v14, a3);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8LL))(a1, a2);
  if (!v7) {
    *a7 = v15;
  }
  return result;
}

uint64_t sub_2452F0@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(uint64_t)@<X3>, uint64_t a5@<X4>, uint64_t (*a6)(char *, uint64_t, uint64_t, uint64_t, uint64_t)@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v22 = a7;
  uint64_t v14 = *(void *)(a2 - 8);
  __chkstk_darwin();
  unint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, a2);
  uint64_t v18 = a4(v17);
  uint64_t v19 = a6(v16, a5, a2, v18, a3);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(a1, a2);
  if (!v7) {
    *uint64_t v22 = v19;
  }
  return result;
}

uint64_t sub_2453D4@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t (*a4)(void *, uint64_t *)@<X3>, uint64_t *a5@<X8>)
{
  uint64_t result = sub_2238E0(a1, a2);
  if (!v5)
  {
    uint64_t v13 = v10;
    uint64_t v14 = v11;
    unint64_t v15 = v12;
    if (result == 0x4B2043494C425550LL && v10 == 0xEA00000000005945LL
      || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      sub_1F83C0(v14, v15);
      sub_245FE8(v14, v15);
      uint64_t v17 = v16;
      sub_22AC40(v16, v16 + 32, 0LL, (2LL * *(void *)(v16 + 16)) | 1, (uint64_t)v26);
      swift_release(v17);
      sub_224608(v26, 0x30u, v27);
      uint64_t v18 = v27[6];
      uint64_t v19 = v27[7];
      unint64_t v20 = v27[8];
      uint64_t v21 = swift_unknownObjectRetain(v27[5]);
      uint64_t v25 = sub_242268(v21, (uint64_t)v18, (uint64_t)v19, (unint64_t)v20, a3, a4);
      sub_246470((uint64_t *)v27);
      sub_1F86D4(v14, v15);
      swift_bridgeObjectRelease(v13);
      uint64_t result = sub_1F86D4(v14, v15);
      *a5 = v25;
    }

    else
    {
      unint64_t v22 = sub_222964();
      uint64_t v23 = swift_allocError(&type metadata for CryptoKitASN1Error, v22, 0LL, 0LL);
      *uint64_t v24 = 7;
      swift_willThrow(v23);
      swift_bridgeObjectRelease(v13);
      return sub_1F86D4(v14, v15);
    }
  }

  return result;
}

uint64_t sub_2455BC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(void)@<X3>, uint64_t (*a5)(void *, uint64_t *)@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v13 = *(void *)(a2 - 8);
  __chkstk_darwin(a1, a2);
  unint64_t v15 = &v23[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t))(v13 + 16))(v15, a1, a2);
  uint64_t v16 = Array.init<A>(_:)(v15, &type metadata for UInt8, a2, *(void *)(*(void *)(*(void *)(a3 + 8) + 8LL) + 8LL));
  sub_22AC40(v16, v16 + 32, 0LL, (2LL * *(void *)(v16 + 16)) | 1, (uint64_t)v23);
  swift_bridgeObjectRelease(v16);
  if (v6) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(a1, a2);
  }
  sub_224608(v23, 0x30u, v24);
  uint64_t v17 = v24[6];
  uint64_t v18 = v24[7];
  uint64_t v19 = v24[8];
  uint64_t v20 = swift_unknownObjectRetain(v24[5]);
  uint64_t v21 = sub_242268(v20, (uint64_t)v17, (uint64_t)v18, (unint64_t)v19, a4, a5);
  sub_246470((uint64_t *)v24);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(a1, a2);
  *a6 = v21;
  return result;
}

void sub_245730()
{
}

uint64_t sub_245750()
{
  return sub_2429F8(*v0, (uint64_t (*)(void))ccec_cp_521);
}

uint64_t sub_245770()
{
  uint64_t v1 = *v0;
  if (qword_3A7CA0 != -1) {
    swift_once(&qword_3A7CA0, sub_2244DC);
  }
  uint64_t v2 = qword_3AE778;
  uint64_t v3 = unk_3AE780;
  __int128 v16 = xmmword_3AE788;
  uint64_t v4 = qword_3AE798;
  swift_unknownObjectRetain(unk_3AE780);
  swift_bridgeObjectRetain(v1);
  swift_bridgeObjectRetain(v2);
  unint64_t v5 = ccec_export_pub_size((uint64_t *)(v1 + 32));
  uint64_t v6 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5, &type metadata for UInt8);
  *(void *)(v6 + 16) = v5;
  ccec_export_pub((uint64_t *)(v1 + 32), (char *)(v6 + 32));
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = sub_2157CC(v6);
  unint64_t v9 = v8;
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(v6);
  sub_245FE8(v7, v9);
  uint64_t v11 = v10;
  sub_1F86D4(v7, v9);
  uint64_t v12 = (2LL * *(void *)(v11 + 16)) | 1;
  v18[0] = v2;
  v18[1] = v3;
  __int128 v19 = v16;
  uint64_t v20 = v4;
  uint64_t v21 = v11;
  uint64_t v22 = v11 + 32;
  uint64_t v23 = 0LL;
  uint64_t v24 = v12;
  uint64_t v17 = sub_2121E4(0LL, 1024LL, 0, (char *)_swiftEmptyArrayStorage);
  swift_bridgeObjectRetain(v2);
  swift_unknownObjectRetain(v3);
  swift_unknownObjectRetain(v11);
  sub_22B0D4(48, &v17, (char *)v18);
  swift_unknownObjectRelease(v11);
  swift_unknownObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  uint64_t v13 = v17;
  uint64_t v14 = sub_2157CC((uint64_t)v17);
  swift_unknownObjectRelease(v11);
  swift_unknownObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v13);
  return v14;
}

uint64_t sub_24595C()
{
  return sub_2434A4(sub_245770);
}

uint64_t sub_245968@<X0>(uint64_t (*a1)(void)@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *v2;
  uint64_t result = a1();
  if (!result) {
    goto LABEL_8;
  }
  uint64_t v6 = result;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  v10[0] = v6;
  swift_dynamicCast(&v9, v10, (char *)&type metadata for Any + 8, v11, 7LL);
  uint64_t result = getccec_pub_ctx_size(v9);
  if (result < 0)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }

  size_t v7 = result;
  swift_retain(v4);
  if (v7)
  {
    unint64_t v8 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(v7, &type metadata for UInt8);
    v8[2] = v7;
  }

  else
  {
    unint64_t v8 = _swiftEmptyArrayStorage;
  }

  memcpy(v8 + 4, (const void *)(v4 + 32), v7);
  v8[2] = v7;
  uint64_t result = swift_release(v4);
  *a2 = v8;
  return result;
}

unint64_t sub_245A40()
{
  return sub_242024(*v0, (uint64_t (*)(void))ccec_cp_521);
}

uint64_t sub_245A60()
{
  uint64_t v1 = (uint64_t *)(*v0 + 32LL);
  unint64_t v2 = ccec_x963_export_size(v1);
  uint64_t v3 = static Array._allocateBufferUninitialized(minimumCapacity:)(v2, &type metadata for UInt8);
  *(void *)(v3 + 16) = v2;
  ccec_x963_export(1, (char *)(v3 + 32), v1);
  *(void *)(v3 + 16) = v2;
  uint64_t v4 = sub_2157CC(v3);
  swift_bridgeObjectRelease(v3);
  return v4;
}

uint64_t sub_245ADC()
{
  uint64_t v1 = *v0;
  if (qword_3A7CA0 != -1) {
    swift_once(&qword_3A7CA0, sub_2244DC);
  }
  uint64_t v2 = qword_3AE778;
  uint64_t v3 = unk_3AE780;
  __int128 v4 = xmmword_3AE788;
  uint64_t v5 = qword_3AE798;
  swift_unknownObjectRetain(unk_3AE780);
  swift_retain(v1);
  swift_bridgeObjectRetain(v2);
  unint64_t v6 = sub_242024(v1, (uint64_t (*)(void))ccec_cp_521);
  unint64_t v8 = v7;
  swift_release(v1);
  sub_245FE8(v6, v8);
  uint64_t v10 = v9;
  sub_1F86D4(v6, v8);
  uint64_t v11 = ccec_cp_521();
  if (!v11) {
    goto LABEL_10;
  }
  uint64_t v12 = v11;
  *((void *)&v37 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  *(void *)&__int128 v36 = v12;
  swift_retain(v1);
  swift_dynamicCast(v29, &v36, (char *)&type metadata for Any + 8, *((void *)&v37 + 1), 7LL);
  uint64_t v13 = getccec_pub_ctx_size(*(void **)&v29[0]);
  if (v13 < 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    uint64_t result = swift_unexpectedError(v10, "CryptoKit_Static/ECDH.swift", 27LL, 1LL, 1692LL);
    __break(1u);
    return result;
  }

  size_t v14 = v13;
  if (v13)
  {
    unint64_t v15 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(v13, &type metadata for UInt8);
    v15[2] = v14;
  }

  else
  {
    unint64_t v15 = _swiftEmptyArrayStorage;
  }

  memcpy(v15 + 4, (const void *)(v1 + 32), v14);
  v15[2] = v14;
  swift_release(v1);
  unint64_t v16 = ccec_export_pub_size(v15 + 4);
  uint64_t v17 = static Array._allocateBufferUninitialized(minimumCapacity:)(v16, &type metadata for UInt8);
  *(void *)(v17 + 16) = v16;
  ccec_export_pub(v15 + 4, (char *)(v17 + 32));
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = sub_2157CC(v17);
  unint64_t v20 = v19;
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v17);
  sub_245FE8(v18, v20);
  uint64_t v22 = v21;
  sub_1F86D4(v18, v20);
  uint64_t v23 = *(void *)(v22 + 16);
  uint64_t v24 = (2LL * *(void *)(v10 + 16)) | 1;
  *(void *)&v29[0] = v2;
  *((void *)&v29[0] + 1) = v3;
  v29[1] = v4;
  *(void *)uint64_t v30 = v5;
  memset(&v30[8], 0, 32);
  uint64_t v31 = 0LL;
  *(void *)&__int128 v32 = v10;
  *((void *)&v32 + 1) = v10 + 32;
  *(void *)&__int128 v33 = 0LL;
  *((void *)&v33 + 1) = v24;
  *(void *)&__int128 v34 = v22;
  *((void *)&v34 + 1) = v22 + 32;
  *(void *)&__int128 v35 = 0LL;
  *((void *)&v35 + 1) = (2 * v23) | 1;
  __int128 v38 = *(_OWORD *)v30;
  __int128 v39 = *(_OWORD *)&v30[16];
  __int128 v36 = v29[0];
  __int128 v37 = v4;
  __int128 v43 = v34;
  __int128 v44 = v35;
  __int128 v41 = v32;
  __int128 v42 = v33;
  __int128 v40 = 0uLL;
  uint64_t v28 = sub_2121E4(0LL, 1024LL, 0, (char *)_swiftEmptyArrayStorage);
  sub_2464E0((uint64_t *)v29);
  sub_22B468(48, &v28, (char *)&v36);
  sub_225AF4(v29);
  uint64_t v25 = v28;
  uint64_t v26 = sub_2157CC((uint64_t)v28);
  swift_bridgeObjectRelease(v25);
  sub_225AF4(v29);
  return v26;
}

uint64_t sub_245DC8()
{
  return sub_243E54(sub_245ADC);
}

uint64_t sub_245DD4(uint64_t a1)
{
  return sub_245E78(a1, (uint64_t (*)(void *))sub_241998);
}

uint64_t sub_245DF0@<X0>(void *a1@<X8>)
{
  return sub_245EBC((uint64_t (*)(void))ccec_cp_256, a1);
}

uint64_t sub_245DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245FB0(a1, a2, a3, (uint64_t (*)(void *))sub_241998);
}

uint64_t sub_245E18(uint64_t a1)
{
  return sub_245E78(a1, (uint64_t (*)(void *))sub_2419F0);
}

uint64_t sub_245E34@<X0>(void *a1@<X8>)
{
  return sub_245EBC((uint64_t (*)(void))ccec_cp_384, a1);
}

uint64_t sub_245E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245FB0(a1, a2, a3, (uint64_t (*)(void *))sub_2419F0);
}

uint64_t sub_245E5C(uint64_t a1)
{
  return sub_245E78(a1, (uint64_t (*)(void *))sub_241A48);
}

uint64_t sub_245E78(uint64_t a1, uint64_t (*a2)(void *))
{
  void v4[2] = *v2;
  return a2(v4);
}

uint64_t sub_245EB0@<X0>(void *a1@<X8>)
{
  return sub_245EBC((uint64_t (*)(void))ccec_cp_521, a1);
}

uint64_t sub_245EBC@<X0>(uint64_t (*a1)(void)@<X2>, void *a2@<X8>)
{
  uint64_t v4 = *v2;
  uint64_t result = a1();
  if (!result) {
    goto LABEL_8;
  }
  uint64_t v6 = result;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  v10[0] = v6;
  swift_dynamicCast(&v9, v10, (char *)&type metadata for Any + 8, v11, 7LL);
  uint64_t result = getccec_pub_ctx_size(v9);
  if (result < 0)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }

  size_t v7 = result;
  swift_retain(v4);
  if (v7)
  {
    unint64_t v8 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(v7, &type metadata for UInt8);
    v8[2] = v7;
  }

  else
  {
    unint64_t v8 = _swiftEmptyArrayStorage;
  }

  memcpy(v8 + 4, (const void *)(v4 + 32), v7);
  v8[2] = v7;
  uint64_t result = swift_release(v4);
  *a2 = v8;
  return result;
}

uint64_t sub_245F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245FB0(a1, a2, a3, (uint64_t (*)(void *))sub_241A48);
}

uint64_t sub_245FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *))
{
  _OWORD v6[2] = *v4;
  return a4(v6);
}

void sub_245FE8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

void *sub_246064()
{
  if (BYTE6(v0))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F0);
    uint64_t v4 = (void *)swift_allocObject(v6, BYTE6(v0) + 32LL, 7LL);
    size_t v7 = _swift_stdlib_malloc_size(v4);
    void v4[2] = BYTE6(v0);
    void v4[3] = 2 * v7 - 64;
    sub_1F83C0(v2, v0);
    uint64_t v8 = ((uint64_t (*)(uint64_t, void *, void, uint64_t, unint64_t))Data._copyContents(initializing:))( v3,  v4 + 4,  BYTE6(v0),  v2,  v0);
    sub_1F86D4(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v8 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x246138LL);
    }
  }

  return v4;
}

uint64_t sub_246150(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t (*a6)(void))
{
  uint64_t result = *a1;
  if (result) {
    return sub_2424FC( result,  *(void *)a4,  *(void *)(a4 + 8),  *(void *)(a4 + 16),  *(void *)(a4 + 24),  a5,  a2,  a3,  (uint64_t)v7,  a6);
  }
  __break(1u);
  return result;
}

uint64_t ***sub_24619C(uint64_t ***result, void *a2, void *a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a3[2];
  uint64_t v7 = a3[3] >> 1;
  BOOL v8 = __OFSUB__(v7, v6);
  uint64_t v9 = v7 - v6;
  if (v8)
  {
    __break(1u);
  }

  else
  {
    uint64_t result = (uint64_t ***)sub_241D3C(a3[1] + v6, a3[1] + v6 + v9, result, a5);
    if (!v5) {
      *a2 = a4;
    }
  }

  return result;
}

unint64_t sub_2461F4()
{
  unint64_t result = qword_3A91B8;
  if (!qword_3A91B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_2809E0, &type metadata for P256);
    atomic_store(result, (unint64_t *)&qword_3A91B8);
  }

  return result;
}

unint64_t sub_246238()
{
  unint64_t result = qword_3A91C0;
  if (!qword_3A91C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_2809FC, &type metadata for P384);
    atomic_store(result, (unint64_t *)&qword_3A91C0);
  }

  return result;
}

unint64_t sub_24627C()
{
  unint64_t result = qword_3A91C8;
  if (!qword_3A91C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_280A18, &type metadata for P521);
    atomic_store(result, (unint64_t *)&qword_3A91C8);
  }

  return result;
}

void sub_2462C0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_246314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v8 = a4();
  if (!v8)
  {
    __break(1u);
    JUMPOUT(0x246460LL);
  }

  uint64_t v9 = v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_3A81F8);
  uint64_t v20 = v10;
  v19[0] = v9;
  swift_dynamicCast(v21, v19, (char *)&type metadata for Any + 8, v10, 7LL);
  unint64_t v11 = groupOrderByteCountForCP(v21[0]);
  if ((v11 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }

  if (__OFADD__(v11, 8LL))
  {
LABEL_14:
    __break(1u);
    JUMPOUT(0x246454LL);
  }

  if (BYTE6(v5) == v11 + 8)
  {
    uint64_t v20 = v10;
    v19[0] = v9;
    else {
      uint64_t v12 = 0LL;
    }
    uint64_t v13 = getccec_full_ctx_size(v12);
    if ((v7 & 1) != 0) {
      uint64_t v14 = 9LL;
    }
    else {
      uint64_t v14 = 1LL;
    }
    return v4(v13, v6, v5, v14, v13);
  }

  else
  {
    unint64_t v16 = sub_21719C();
    uint64_t v17 = swift_allocError(&type metadata for CryptoKitError, v16, 0LL, 0LL);
    *(_DWORD *)uint64_t v18 = 1;
    *(_BYTE *)(v18 + 4) = 1;
    return swift_willThrow(v17);
  }

uint64_t *sub_246470(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  swift_unknownObjectRelease(a1[5]);
  swift_bridgeObjectRelease(v2);
  swift_unknownObjectRelease(v3);
  return a1;
}

unint64_t ccec_x963_export_size(uint64_t *a1)
{
  return 3 * ((unint64_t)(cczp_bitlen(*a1) + 7) >> 3) + 1;
}

uint64_t *sub_2464E0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[10];
  uint64_t v6 = a1[14];
  swift_unknownObjectRetain(a1[1]);
  swift_bridgeObjectRetain(v2);
  sub_2228E4(v3, v4);
  swift_unknownObjectRetain(v6);
  swift_unknownObjectRetain(v5);
  return a1;
}

_UNKNOWN **sub_246568()
{
  return &off_354908;
}

_UNKNOWN **sub_246574()
{
  return &off_354958;
}

_UNKNOWN **sub_246580()
{
  return &off_3549A8;
}

_UNKNOWN **sub_24658C()
{
  return &off_3549F8;
}

_UNKNOWN **sub_246598()
{
  return &off_354A48;
}

_UNKNOWN **sub_2465A4()
{
  return &off_354A98;
}

ValueMetadata *_s7SigningOMa()
{
  return &_s7SigningON;
}

ValueMetadata *_s7SigningO9PublicKeyVMa()
{
  return &_s7SigningO9PublicKeyVN;
}

ValueMetadata *_s7SigningO10PrivateKeyVMa()
{
  return &_s7SigningO10PrivateKeyVN;
}

ValueMetadata *_s12KeyAgreementOMa()
{
  return &_s12KeyAgreementON;
}

ValueMetadata *_s12KeyAgreementO9PublicKeyVMa()
{
  return &_s12KeyAgreementO9PublicKeyVN;
}

ValueMetadata *_s12KeyAgreementO10PrivateKeyVMa()
{
  return &_s12KeyAgreementO10PrivateKeyVN;
}

ValueMetadata *_s7SigningOMa_0()
{
  return &_s7SigningON_0;
}

ValueMetadata *_s7SigningO9PublicKeyVMa_0()
{
  return &_s7SigningO9PublicKeyVN_0;
}

ValueMetadata *_s7SigningO10PrivateKeyVMa_0()
{
  return &_s7SigningO10PrivateKeyVN_0;
}

ValueMetadata *_s12KeyAgreementOMa_0()
{
  return &_s12KeyAgreementON_0;
}

ValueMetadata *_s12KeyAgreementO9PublicKeyVMa_0()
{
  return &_s12KeyAgreementO9PublicKeyVN_0;
}

ValueMetadata *_s12KeyAgreementO10PrivateKeyVMa_0()
{
  return &_s12KeyAgreementO10PrivateKeyVN_0;
}

ValueMetadata *_s7SigningOMa_1()
{
  return &_s7SigningON_1;
}

ValueMetadata *_s7SigningO9PublicKeyVMa_1()
{
  return &_s7SigningO9PublicKeyVN_1;
}

ValueMetadata *_s7SigningO10PrivateKeyVMa_1()
{
  return &_s7SigningO10PrivateKeyVN_1;
}

ValueMetadata *_s12KeyAgreementOMa_1()
{
  return &_s12KeyAgreementON_1;
}

ValueMetadata *_s12KeyAgreementO9PublicKeyVMa_1()
{
  return &_s12KeyAgreementO9PublicKeyVN_1;
}

ValueMetadata *_s12KeyAgreementO10PrivateKeyVMa_1()
{
  return &_s12KeyAgreementO10PrivateKeyVN_1;
}

uint64_t ccec_ctx_k(void **a1)
{
  return (uint64_t)&a1[3 * **a1 + 2];
}

uint64_t ***sub_2466E8(uint64_t ***a1, void *a2)
{
  return sub_24619C(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), (uint64_t (*)(void))ccec_cp_521);
}

uint64_t sub_246708(uint64_t *a1, void *a2)
{
  return sub_246150( a1,  a2,  *(void *)(v2 + 16),  *(void *)(v2 + 24),  *(void **)(v2 + 32),  (uint64_t (*)(void))ccec_cp_521);
}

uint64_t ***sub_24672C(uint64_t ***a1, void *a2)
{
  return sub_24619C(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), ccec_cp_384);
}

uint64_t sub_24674C(uint64_t *a1, void *a2)
{
  return sub_246150(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), ccec_cp_384);
}

uint64_t ***sub_246770(uint64_t ***a1, void *a2)
{
  return sub_24619C(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), ccec_cp_256);
}

uint64_t sub_246790(uint64_t *a1, void *a2)
{
  return sub_246150(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), ccec_cp_256);
}

void _MobileAssetLog_cold_2()
{
}

void _MobileAssetFault_cold_1()
{
}

void _hashCFStringOfLength_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _hashCFStringOfLength_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _hashCFStringOfLength_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _hashCFDataOfLength_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __os_cleanup_iorelease_cold_1(void *a1, _OWORD *a2)
{
  uint64_t v6 = OUTLINED_FUNCTION_0_3(v2, v3, v4, v5, (uint64_t)&dword_0);
  OUTLINED_FUNCTION_4_3(v6);
  __break(1u);
}

void __os_cleanup_ioclose_cold_1(void *a1, _OWORD *a2)
{
  uint64_t v6 = OUTLINED_FUNCTION_0_3(v2, v3, v4, v5, (uint64_t)&dword_0);
  OUTLINED_FUNCTION_4_3(v6);
  __break(1u);
}

void __os_cleanup_close_cold_1(void *a1, _OWORD *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  __error();
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &dword_0, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void ccec_verify_internal_with_base_ws_cold_1(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_0,  a2,  OS_LOG_TYPE_FAULT,  "Digest should be at least 128 bits long: argument digest_len = %lu",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend__addDescriptor_withRepresentation_toSummary_withStageGroupType_withTargetOS_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addDescriptor:withRepresentation:toSummary:withStageGroupType:withTargetOS:");
}

id objc_msgSend__clearAllTrackingOfActiveOperations_alsoPerformingPurgeAll_removingDetermined_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearAllTrackingOfActiveOperations:alsoPerformingPurgeAll:removingDetermined:");
}

id objc_msgSend__clearSetConfigurationLatestToVend_forSetDesriptor_forSetAtomicInstance_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearSetConfigurationLatestToVend:forSetDesriptor:forSetAtomicInstance:fromLocation:");
}

id objc_msgSend__combinedStatisticsWithStagerClientRepliesSuccess_withStagerClientRepliesFailure_withStagerTotalStaged_withStagerTotalUnstaged_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_combinedStatisticsWithStagerClientRepliesSuccess:withStagerClientRepliesFailure:withStagerTotalStaged:withSt agerTotalUnstaged:");
}

id objc_msgSend__continuedLockByClient_forClientDomainName_forAssetSetIdentifier_forAssetSelector_forSetAtomicInstance_forLockReason_withUsagePolicy_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_continuedLockByClient:forClientDomainName:forAssetSetIdentifier:forAssetSelector:forSetAtomicInstance:forLoc kReason:withUsagePolicy:");
}

id objc_msgSend__currentSetStatusClearDownloadProgress_clearingSetStatus_forClearingReason_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentSetStatusClearDownloadProgress:clearingSetStatus:forClearingReason:");
}

id objc_msgSend__decideRemoveDescriptorWithNewerDownloaded_maintainingRemoveDescriptors_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_decideRemoveDescriptorWithNewerDownloaded:maintainingRemoveDescriptors:fromLocation:");
}

id objc_msgSend__doesEliminateSelector_matchAssetType_withAssetSpecifier_withAssetVersion_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_doesEliminateSelector:matchAssetType:withAssetSpecifier:withAssetVersion:fromLocation:");
}

id objc_msgSend__eliminateAtomicTriggeredByClient_forClientDomainName_forAssetSetIdentifier_awaitingUnlocked_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_eliminateAtomicTriggeredByClient:forClientDomainName:forAssetSetIdentifier:awaitingUnlocked:");
}

id objc_msgSend__eliminateAtomicTriggeredWhileLoading_forClientDomainName_forAssetSetIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_eliminateAtomicTriggeredWhileLoading:forClientDomainName:forAssetSetIdentifier:");
}

id objc_msgSend__endLocksByClient_forAllClientNames_forClientProcessName_withClientProcessID_forClientDomainName_forAssetSetIdentifier_forAssetSelector_forSetAtomicInstance_forLockReason_removingLockCount_endError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_endLocksByClient:forAllClientNames:forClientProcessName:withClientProcessID:forClientDomainName:forAssetSetI dentifier:forAssetSelector:forSetAtomicInstance:forLockReason:removingLockCount:endError:");
}

id objc_msgSend__endedLockByClient_forClientDomainName_forAssetSetIdentifier_forAssetSelector_forSetAtomicInstance_forLockReason_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_endedLockByClient:forClientDomainName:forAssetSetIdentifier:forAssetSelector:forSetAtomicInstance:forLockReason:");
}

id objc_msgSend__extendAssetDownloadOptionsWithAnalyticsData_forDescriptor_withBaseForPatch_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extendAssetDownloadOptionsWithAnalyticsData:forDescriptor:withBaseForPatch:");
}

id objc_msgSend__extendLookupByAssetType_fromSource_withAssetType_withAssetSpecifier_withDownloadDecryptionKey_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_extendLookupByAssetType:fromSource:withAssetType:withAssetSpecifier:withDownloadDecryptionKey:");
}

id objc_msgSend__formCandidateSetLookupArray_involvingRequired_involvingOptional_providingOptional_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_formCandidateSetLookupArray:involvingRequired:involvingOptional:providingOptional:");
}

id objc_msgSend__informConnectorActiveJobFinishedforSelector_withPotentialNetworkFailure_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_informConnectorActiveJobFinishedforSelector:withPotentialNetworkFailure:");
}

id objc_msgSend__jobFinishedForSetDomainName_forAssetSetIdentifier_withPotentialNetworkFailure_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_jobFinishedForSetDomainName:forAssetSetIdentifier:withPotentialNetworkFailure:");
}

id objc_msgSend__latestDownloadedDescriptor_forAssetType_withAssetSpecifier_matchingAssetVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_latestDownloadedDescriptor:forAssetType:withAssetSpecifier:matchingAssetVersion:");
}

id objc_msgSend__lockAutoAssetByClient_forClientProcessName_withClientProcessID_forClientDomainName_forAssetSetIdentifier_forAssetSelector_forSetAtomicInstance_forLockReason_withUsagePolicy_withLocalContentURL_withAssetAttributes_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_lockAutoAssetByClient:forClientProcessName:withClientProcessID:forClientDomainName:forAssetSetIdentifier:for AssetSelector:forSetAtomicInstance:forLockReason:withUsagePolicy:withLocalContentURL:withAssetAttributes:");
}

id objc_msgSend__logPersistedAvailableForStagingByTarget_operation_forPersistedEntryID_withAvailableForStaging_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedAvailableForStagingByTarget:operation:forPersistedEntryID:withAvailableForStaging:message:");
}

id objc_msgSend__logPersistedAvailableForStagingByTargetRemoved_removedPersistedEntryID_removedAvailableForStaging_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedAvailableForStagingByTargetRemoved:removedPersistedEntryID:removedAvailableForStaging:message:");
}

id objc_msgSend__logPersistedConfigLoad_activityIntervalSecs_pushTriggerSecs_lastTickDate_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logPersistedConfigLoad:activityIntervalSecs:pushTriggerSecs:lastTickDate:message:");
}

id objc_msgSend__logPersistedConfigLoad_lastStagingFromOSVersion_lastStagingFromBuildVersion_assetTargetOSVersion_assetTargetBuildVersion_usingModeByGroups_candidateAssetCount_determinedAvailableAssetCount_activelyStagingAssetCount_awaitingStagingAssetCount_stagedAssetCount_stagedAssetTotalContentBytes_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedConfigLoad:lastStagingFromOSVersion:lastStagingFromBuildVersion:assetTargetOSVersion:assetTarget BuildVersion:usingModeByGroups:candidateAssetCount:determinedAvailableAssetCount:activelyStagingAssetCount:aw aitingStagingAssetCount:stagedAssetCount:stagedAssetTotalContentBytes:message:");
}

id objc_msgSend__logPersistedConfigSet_activityIntervalSecs_pushTriggerSecs_lastTickDate_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logPersistedConfigSet:activityIntervalSecs:pushTriggerSecs:lastTickDate:message:");
}

id objc_msgSend__logPersistedEntry_forComponentType_operation_forPersistedEntryID_forClientRequest_withJobUUID_withAssetDescriptor_baseForPatchDescriptor_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedEntry:forComponentType:operation:forPersistedEntryID:forClientRequest:withJobUUID:withAssetDescr iptor:baseForPatchDescriptor:message:");
}

id objc_msgSend__logPersistedEntry_operation_persistingDescriptor_withRepresentation_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logPersistedEntry:operation:persistingDescriptor:withRepresentation:message:");
}

id objc_msgSend__logPersistedEntry_operation_persistingSelector_intervalSecs_remainingSecs_pushedJob_setJob_setPolicy_pushedPolicy_requiringRetry_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedEntry:operation:persistingSelector:intervalSecs:remainingSecs:pushedJob:setJob:setPolicy:pushedP olicy:requiringRetry:message:");
}

id objc_msgSend__logPersistedRemovedEntry_forComponentType_removedPersistedEntryID_removedDescriptor_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedRemovedEntry:forComponentType:removedPersistedEntryID:removedDescriptor:message:");
}

id objc_msgSend__logPersistedSetAtomicInstance_operation_forPersistedEntryID_withSetAtomicInstance_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logPersistedSetAtomicInstance:operation:forPersistedEntryID:withSetAtomicInstance:message:");
}

id objc_msgSend__logPersistedSetAtomicInstanceRemoved_removedPersistedEntryID_removedSetAtomicInstance_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedSetAtomicInstanceRemoved:removedPersistedEntryID:removedSetAtomicInstance:message:");
}

id objc_msgSend__logPersistedSetConfiguration_operation_forPersistedEntryID_withSetConfiguration_historyOperation_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedSetConfiguration:operation:forPersistedEntryID:withSetConfiguration:historyOperation:message:");
}

id objc_msgSend__logPersistedSetConfiguration_operation_forPersistedEntryID_withSetConfiguration_historyOperation_recordingSpecifiers_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedSetConfiguration:operation:forPersistedEntryID:withSetConfiguration:historyOperation:recordingSp ecifiers:message:");
}

id objc_msgSend__logPersistedSetConfigurationRemoved_removedPersistedEntryID_removedSetConfiguration_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedSetConfigurationRemoved:removedPersistedEntryID:removedSetConfiguration:message:");
}

id objc_msgSend__logPersistedSetDescriptor_forComponentType_operation_forPersistedEntryID_forClientRequest_withJobUUID_withSetDescriptor_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedSetDescriptor:forComponentType:operation:forPersistedEntryID:forClientRequest:withJobUUID:withSe tDescriptor:message:");
}

id objc_msgSend__logPersistedSetDescriptorRemoved_forComponentType_removedPersistedEntryID_removedSetDescriptor_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedSetDescriptorRemoved:forComponentType:removedPersistedEntryID:removedSetDescriptor:message:");
}

id objc_msgSend__logPersistedSetLookupResult_operation_forPersistedEntryID_withSetLookupResult_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logPersistedSetLookupResult:operation:forPersistedEntryID:withSetLookupResult:message:");
}

id objc_msgSend__logPersistedSetLookupResultRemoved_removedPersistedEntryID_removedSetLookupResult_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logPersistedSetLookupResultRemoved:removedPersistedEntryID:removedSetLookupResult:message:");
}

id objc_msgSend__logPersistedSetTarget_operation_forPersistedEntryID_withSetTarget_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logPersistedSetTarget:operation:forPersistedEntryID:withSetTarget:message:");
}

id objc_msgSend__logPersistedSetTargetRemoved_removedPersistedEntryID_removedSetTarget_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logPersistedSetTargetRemoved:removedPersistedEntryID:removedSetTarget:message:");
}

id objc_msgSend__logPersistedTargetLookupResults_operation_forPersistedEntryID_withTargetLookupResults_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedTargetLookupResults:operation:forPersistedEntryID:withTargetLookupResults:message:");
}

id objc_msgSend__logPersistedTargetLookupResultsRemoved_removedPersistedEntryID_removedTargetLookupResults_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logPersistedTargetLookupResultsRemoved:removedPersistedEntryID:removedTargetLookupResults:message:");
}

id objc_msgSend__logTrackedDescriptors_forAssetType_withAssetSpecifier_matchingAssetVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logTrackedDescriptors:forAssetType:withAssetSpecifier:matchingAssetVersion:");
}

id objc_msgSend__newStagingInfoAvailable_fromAvailableForStaging_providingTotalExpectedBytes_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_newStagingInfoAvailable:fromAvailableForStaging:providingTotalExpectedBytes:");
}

id objc_msgSend__persistDescriptor_operation_persistingDescriptor_withRepresentation_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_persistDescriptor:operation:persistingDescriptor:withRepresentation:message:");
}

id objc_msgSend__persistStatusChange_ofEntryName_withEntrySummary_currentStatus_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_persistStatusChange:ofEntryName:withEntrySummary:currentStatus:fromLocation:");
}

id objc_msgSend__personalizeGraftSetDownloaded_forSetDescriptor_allowingNetwork_requiringPersonalization_requiringGrafting_shouldGraft_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_personalizeGraftSetDownloaded:forSetDescriptor:allowingNetwork:requiringPersonalization:requiringGrafting:sh ouldGraft:completion:");
}

id objc_msgSend__removeDescriptorFromFilesystem_droppingDescriptor_forHistoryOperation_firstClientName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeDescriptorFromFilesystem:droppingDescriptor:forHistoryOperation:firstClientName:");
}

id objc_msgSend__replyToStagingClient_replyingToRequest_withErrorCode_withUnderlyingError_withDescription_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_replyToStagingClient:replyingToRequest:withErrorCode:withUnderlyingError:withDescription:");
}

id objc_msgSend__replyToStagingClient_withStagedInfo_replyingToStagingRequest_recordingOperation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_replyToStagingClient:withStagedInfo:replyingToStagingRequest:recordingOperation:");
}

id objc_msgSend__replyToStagingClient_withStagingInfo_replyingToStagingRequest_recordingOperation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_replyToStagingClient:withStagingInfo:replyingToStagingRequest:recordingOperation:");
}

id objc_msgSend__scheduleSelector_triggeringAtIntervalSecs_withRemainingSecs_forPushedJob_forSetJob_withSetPolicy_triggeringIfLearned_resettingRemaining_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_scheduleSelector:triggeringAtIntervalSecs:withRemainingSecs:forPushedJob:forSetJob:withSetPolicy:triggeringI fLearned:resettingRemaining:");
}

id objc_msgSend__shortTermCreateSymbolicLink_symbolicLinkFilename_linkedToFilename_forSetDescriptor_usingFileManager_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_shortTermCreateSymbolicLink:symbolicLinkFilename:linkedToFilename:forSetDescriptor:usingFileManager:");
}

id objc_msgSend__shortTermPersistSetStatus_forSetDescriptor_persistingSetStatus_toFilename_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shortTermPersistSetStatus:forSetDescriptor:persistingSetStatus:toFilename:");
}

id objc_msgSend__shortTermSharedLockOpenExclusive_forSetDescriptor_atomicInstanceFilename_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shortTermSharedLockOpenExclusive:forSetDescriptor:atomicInstanceFilename:error:");
}

id objc_msgSend__shortTermSharedLockRemove_removingSharedLockFilename_usingFileManager_removingDescription_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shortTermSharedLockRemove:removingSharedLockFilename:usingFileManager:removingDescription:");
}

id objc_msgSend__stagingClientRequestDetermineClear_forStagingTargetName_replyingToCleared_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stagingClientRequestDetermineClear:forStagingTargetName:replyingToCleared:");
}

id objc_msgSend__stagingClientRequestDetermineTrack_trackingRequest_forStagingTargetName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stagingClientRequestDetermineTrack:trackingRequest:forStagingTargetName:");
}

id objc_msgSend__stagingClientRequestDownloadClear_forStagingTargetName_replyingToCleared_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stagingClientRequestDownloadClear:forStagingTargetName:replyingToCleared:");
}

id objc_msgSend__startTimer_ofTimerCategory_forOneShotSecs_withFiredMessage_postingEvent_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startTimer:ofTimerCategory:forOneShotSecs:withFiredMessage:postingEvent:");
}

id objc_msgSend__trackActiveDescriptor_operation_usingSelector_withJobUUID_triggeredByClientMessage_downloadingDescriptor_baseForPatchDescriptor_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_trackActiveDescriptor:operation:usingSelector:withJobUUID:triggeredByClientMessage:downloadingDescriptor:bas eForPatchDescriptor:message:");
}

id objc_msgSend__updateSandboxExtensionForResponse_responseError_clientRequest_alreadyOnStateQueue_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateSandboxExtensionForResponse:responseError:clientRequest:alreadyOnStateQueue:");
}

id objc_msgSend__vendingAtomicInstanceForConfiguredEntriesForClientDomainName_forAssetSetIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_vendingAtomicInstanceForConfiguredEntriesForClientDomainName:forAssetSetIdentifier:");
}

id objc_msgSend_addLiveServerRequest_forAssetType_withPurpose_audience_pallasUrl_using_with_clientName_autoAssetJobID_task_options_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addLiveServerRequest:forAssetType:withPurpose:audience:pallasUrl:using:with:clientName:autoAssetJobID:task:options:");
}

id objc_msgSend_addToCurrentJobs_usingSelector_withJobUUID_triggeredByClientMessage_downloadingDescriptor_baseForPatchDescriptor_usingSetDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addToCurrentJobs:usingSelector:withJobUUID:triggeredByClientMessage:downloadingDescriptor:baseForPatchDescrip tor:usingSetDescriptor:");
}

id objc_msgSend_alterSecondsBeforeCollection_forAssetTypeDir_determinedDescriptorType_fromDescriptors_isAutoAsset_autoAssetDescriptor_assetFilesystemSize_retentionPolicy_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "alterSecondsBeforeCollection:forAssetTypeDir:determinedDescriptorType:fromDescriptors:isAutoAsset:autoAssetDe scriptor:assetFilesystemSize:retentionPolicy:");
}

id objc_msgSend_alteredMonitoringMarkers_withTriggeredNoRetry_withTriggeredRequiringRetry_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alteredMonitoringMarkers:withTriggeredNoRetry:withTriggeredRequiringRetry:");
}

id objc_msgSend_analyticsReportSecureOperationResults_clientName_secureReason_operation_fromLocation_mountError_graftError_personalizeError_mapToExclaveError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "analyticsReportSecureOperationResults:clientName:secureReason:operation:fromLocation:mountError:graftError:pe rsonalizeError:mapToExclaveError:");
}

id objc_msgSend_applyTransformsAndCheckReceipts_transformations_assetType_assets_receiptResults_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyTransformsAndCheckReceipts:transformations:assetType:assets:receiptResults:");
}

id objc_msgSend_assessDownloadCompletion_originalUrl_taskDescription_taskId_error_moveFile_extractorExists_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assessDownloadCompletion:originalUrl:taskDescription:taskId:error:moveFile:extractorExists:");
}

id objc_msgSend_assetMetadataFromAssetCatalog_forAssetype_forAssetSpecifier_preferringBestFormat_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetMetadataFromAssetCatalog:forAssetype:forAssetSpecifier:preferringBestFormat:");
}

id objc_msgSend_atomicInstanceNewSetAtomicInstance_recordingHistoryOperation_forClientDomainName_forSetClientName_forAssetSetIdentifier_representingInstanceEntries_recoveringAtomicInstanceUUID_asSubAtomicFrom_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "atomicInstanceNewSetAtomicInstance:recordingHistoryOperation:forClientDomainName:forSetClientName:forAssetSet Identifier:representingInstanceEntries:recoveringAtomicInstanceUUID:asSubAtomicFrom:");
}

id objc_msgSend_atomicInstanceNewSetAtomicInstance_recordingHistoryOperation_forSetInfoInstance_asSubAtomicFrom_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "atomicInstanceNewSetAtomicInstance:recordingHistoryOperation:forSetInfoInstance:asSubAtomicFrom:");
}

id objc_msgSend_atomicInstanceNewSetAtomicInstance_recordingHistoryOperation_recoveringForSetDescriptor_usingAsSetClient_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "atomicInstanceNewSetAtomicInstance:recordingHistoryOperation:recoveringForSetDescriptor:usingAsSetClient:");
}

id objc_msgSend_atomicInstanceNextCreationIndex_forClientDomainName_forAssetSetIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomicInstanceNextCreationIndex:forClientDomainName:forAssetSetIdentifier:");
}

id objc_msgSend_atomicInstanceRemove_setAtomicInstanceUUID_removingForReason_historyOperation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomicInstanceRemove:setAtomicInstanceUUID:removingForReason:historyOperation:");
}

id objc_msgSend_autoAssetJobFinished_withAutoAssetUUID_schedulerInvolved_potentialNetworkFailure_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoAssetJobFinished:withAutoAssetUUID:schedulerInvolved:potentialNetworkFailure:");
}

id objc_msgSend_autoAssetJobIssueProgress_forAutoAssetSelector_withAutoAssetUUID_withJobInformation_withResponseError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "autoAssetJobIssueProgress:forAutoAssetSelector:withAutoAssetUUID:withJobInformation:withResponseError:");
}

id objc_msgSend_autoAssetJobIssueReply_forAutoAssetSelector_withAutoAssetUUID_fromAutoAssetJob_withOriginalSelector_withJobInformation_withResponseError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "autoAssetJobIssueReply:forAutoAssetSelector:withAutoAssetUUID:fromAutoAssetJob:withOriginalSelector:withJobIn formation:withResponseError:");
}

id objc_msgSend_autoAssetJobReadyToDownload_withAutoAssetUUID_fromAutoAssetJob_withOriginalSelector_downloadingDescriptor_baseForPatchDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "autoAssetJobReadyToDownload:withAutoAssetUUID:fromAutoAssetJob:withOriginalSelector:downloadingDescriptor:bas eForPatchDescriptor:");
}

id objc_msgSend_autoAssetStagerJobDetermineDone_withBaseForStagingDescriptors_withDetermineError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoAssetStagerJobDetermineDone:withBaseForStagingDescriptors:withDetermineError:");
}

id objc_msgSend_autoAssetStagerJobDownloadDone_withDownloadedDescriptor_withDownloadError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoAssetStagerJobDownloadDone:withDownloadedDescriptor:withDownloadError:");
}

id objc_msgSend_autoAssetStagerSetJobDetermineDone_withBaseForStagingDescriptors_withDetermineError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoAssetStagerSetJobDetermineDone:withBaseForStagingDescriptors:withDetermineError:");
}

id objc_msgSend_autoSetJobFinished_forAssetSetIdentifier_withAutoAssetUUID_fromAutoAssetJob_withSetJobInformation_schedulerInvolved_potentialNetworkFailure_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "autoSetJobFinished:forAssetSetIdentifier:withAutoAssetUUID:fromAutoAssetJob:withSetJobInformation:schedulerIn volved:potentialNetworkFailure:");
}

id objc_msgSend_autoSetJobIssueProgress_forAssetSetIdentifier_withAutoAssetUUID_withSetJobInformation_withResponseError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "autoSetJobIssueProgress:forAssetSetIdentifier:withAutoAssetUUID:withSetJobInformation:withResponseError:");
}

id objc_msgSend_autoSetJobIssueReply_forDomainName_forAssetSetIdentifier_withAutoAssetUUID_fromAutoAssetJob_withSetJobInformation_withResponseError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "autoSetJobIssueReply:forDomainName:forAssetSetIdentifier:withAutoAssetUUID:fromAutoAssetJob:withSetJobInforma tion:withResponseError:");
}

id objc_msgSend_buildFoundResponseMessage_forClientRequest_withFoundDescriptor_withInstance_withDesire_fromLocation_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "buildFoundResponseMessage:forClientRequest:withFoundDescriptor:withInstance:withDesire:fromLocation:error:");
}

id objc_msgSend_buildPotentialDescriptors_fromLookupResults_buildingPatchDescriptors_andFullDescriptors_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildPotentialDescriptors:fromLookupResults:buildingPatchDescriptors:andFullDescriptors:");
}

id objc_msgSend_buildReportedSetStatus_forClientDomainName_forSetIdentifier_forAtomicInstance_withFoundSetDescriptor_withSubAtomicInstance_reportingLocalContentURLs_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "buildReportedSetStatus:forClientDomainName:forSetIdentifier:forAtomicInstance:withFoundSetDescriptor:withSubA tomicInstance:reportingLocalContentURLs:");
}

id objc_msgSend_buildSetFoundResponseMessage_forClientRequest_withFoundSetDescriptor_withSubAtomicInstance_forLatestDownloaded_withInstance_withDesire_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "buildSetFoundResponseMessage:forClientRequest:withFoundSetDescriptor:withSubAtomicInstance:forLatestDownloade d:withInstance:withDesire:fromLocation:");
}

id objc_msgSend_buildShortTermLockError_code_description_forSetDescriptor_underlyingError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildShortTermLockError:code:description:forSetDescriptor:underlyingError:");
}

id objc_msgSend_cancelAllDownloading_withPurpose_includingAssets_includingCatalog_includingOther_clientName_then_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "cancelAllDownloading:withPurpose:includingAssets:includingCatalog:includingOther:clientName:then:");
}

id objc_msgSend_cancelAssetDownloadJob_forAssetType_withPurpose_matchingAssetId_forAutoAssetName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAssetDownloadJob:forAssetType:withPurpose:matchingAssetId:forAutoAssetName:");
}

id objc_msgSend_categorizeAssetResults_fromCatalogIds_repositoryIds_andPreinstalledIds_intoServerOnlyIds_installedCatalogIds_andObsoleteIds_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "categorizeAssetResults:fromCatalogIds:repositoryIds:andPreinstalledIds:intoServerOnlyIds:installedCatalogIds:andObsoleteIds:");
}

id objc_msgSend_checkAndInitiateDownloadForAssetType_message_forClientName_usingConnection_requiringClientExtractor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "checkAndInitiateDownloadForAssetType:message:forClientName:usingConnection:requiringClientExtractor:");
}

id objc_msgSend_checkEntitlementAndRespondIfErrorForConnection_usingMessage_forAssetType_withCommand_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkEntitlementAndRespondIfErrorForConnection:usingMessage:forAssetType:withCommand:");
}

id objc_msgSend_checkEntitlementAndRespondIfErrorForConnection_usingMessage_forAssetTypes_withCommand_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkEntitlementAndRespondIfErrorForConnection:usingMessage:forAssetTypes:withCommand:");
}

id objc_msgSend_checkSplunkStatus_failureReason_productVersion_sessionId_nonce_url_statusCode_assetAudience_version_receiptResults_baseUrl_discretionary_deviceCheck_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "checkSplunkStatus:failureReason:productVersion:sessionId:nonce:url:statusCode:assetAudience:version:receiptRe sults:baseUrl:discretionary:deviceCheck:");
}

id objc_msgSend_configAssetDownload_withPurpose_matchingAssetId_usingDownloadConfig_usingXPCConnection_withXPCMessage_performingAutoAssetJob_asClientName_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "configAssetDownload:withPurpose:matchingAssetId:usingDownloadConfig:usingXPCConnection:withXPCMessage:perform ingAutoAssetJob:asClientName:");
}

id objc_msgSend_configAssetDownloadJob_forAssetType_withPurpose_matchingAssetId_usingDownloadConfig_forAutoAssetName_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "configAssetDownloadJob:forAssetType:withPurpose:matchingAssetId:usingDownloadConfig:forAutoAssetName:");
}

id objc_msgSend_continuedLockByClient_forAssetSelector_forLockReason_withUsagePolicy_continueError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "continuedLockByClient:forAssetSelector:forLockReason:withUsagePolicy:continueError:");
}

id objc_msgSend_continuedSetLockByClient_forSetDescriptor_forLockReason_withSetUsagePolicy_continueError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "continuedSetLockByClient:forSetDescriptor:forLockReason:withSetUsagePolicy:continueError:");
}

id objc_msgSend_controlAlreadyDownloadedDescriptors_withSetConfigurations_withSetTargets_withScheduledJobs_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controlAlreadyDownloadedDescriptors:withSetConfigurations:withSetTargets:withScheduledJobs:");
}

id objc_msgSend_controlEliminateSetDomainName_forAssetSetIdentifier_indicatingWhenEliminated_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controlEliminateSetDomainName:forAssetSetIdentifier:indicatingWhenEliminated:");
}

id objc_msgSend_controlStatisticsClientRepliesSuccess_clientRepliesFailure_totalStaged_totalUnstaged_clearingAfter_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "controlStatisticsClientRepliesSuccess:clientRepliesFailure:totalStaged:totalUnstaged:clearingAfter:");
}

id objc_msgSend_copyCurrentDownloadedDescriptors_unlockedUnreferencedDescriptors_unlockedReferencedDescriptors_lockedOverridableDescriptors_lockedNeverRemoveDescriptors_stagedDescriptors_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "copyCurrentDownloadedDescriptors:unlockedUnreferencedDescriptors:unlockedReferencedDescriptors:lockedOverrida bleDescriptors:lockedNeverRemoveDescriptors:stagedDescriptors:");
}

id objc_msgSend_copyDeviceIdentityOptionsForCertAndRequestType_skipNetworkRequest_invalidateExistingCert_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDeviceIdentityOptionsForCertAndRequestType:skipNetworkRequest:invalidateExistingCert:");
}

id objc_msgSend_createGetDecryptionKeyRequestForKnox_authData_keyFetchBaseURLString_apTicket_assetAttributes_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "createGetDecryptionKeyRequestForKnox:authData:keyFetchBaseURLString:apTicket:assetAttributes:error:");
}

id objc_msgSend_currentJobByUUID_potentiallyResumingJob_withOriginalSelector_fromLocation_notFoundCode_notFoundReason_downloadingDescriptor_baseForPatchDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "currentJobByUUID:potentiallyResumingJob:withOriginalSelector:fromLocation:notFoundCode:notFoundReason:downloa dingDescriptor:baseForPatchDescriptor:");
}

id objc_msgSend_decideSetDescriptorAsLatestToVend_currentlyVendingSetDescriptor_withOtherCandidateSetDescriptors_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "decideSetDescriptorAsLatestToVend:currentlyVendingSetDescriptor:withOtherCandidateSetDescriptors:");
}

id objc_msgSend_determineAssets_clientName_connection_downloadingTasks_message_resultTypes_queryArray_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "determineAssets:clientName:connection:downloadingTasks:message:resultTypes:queryArray:");
}

id objc_msgSend_determineAssets_clientName_connection_downloadingTasks_message_resultTypes_queryArray_isForSpecificAsset_specificAssetId_specificAllowedDifferences_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "determineAssets:clientName:connection:downloadingTasks:message:resultTypes:queryArray:isForSpecificAsset:spec ificAssetId:specificAllowedDifferences:");
}

id objc_msgSend_determineBestMatchFor_absoluteId_allowedDifferences_fromResults_isExact_candidates_bestMatch_differencesFound_missedTypeAndAssetIdMatch_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "determineBestMatchFor:absoluteId:allowedDifferences:fromResults:isExact:candidates:bestMatch:differencesFound :missedTypeAndAssetIdMatch:");
}

id objc_msgSend_determineOneAsset_clientName_connection_message_specificAssetId_specificAllowedDifferences_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "determineOneAsset:clientName:connection:message:specificAssetId:specificAllowedDifferences:");
}

id objc_msgSend_doesSetDescriptorInvolveSecureOperations_forSetDescriptor_withAutoAssetDescriptors_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doesSetDescriptorInvolveSecureOperations:forSetDescriptor:withAutoAssetDescriptors:");
}

id objc_msgSend_eliminateUngraftDescriptor_forAutoAssetDescriptor_failingClientRequestForEventInfo_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eliminateUngraftDescriptor:forAutoAssetDescriptor:failingClientRequestForEventInfo:");
}

id objc_msgSend_endedAllPreviousLocksByClientProcessName_withClientProcessID_forAssetSelector_endError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endedAllPreviousLocksByClientProcessName:withClientProcessID:forAssetSelector:endError:");
}

id objc_msgSend_endedPreviousLocksByClient_forAssetSelector_forLockReason_removingLockCount_endError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endedPreviousLocksByClient:forAssetSelector:forLockReason:removingLockCount:endError:");
}

id objc_msgSend_endedPreviousSetLocksByClient_forSetDescriptor_forLockReason_removingLockCount_endError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endedPreviousSetLocksByClient:forSetDescriptor:forLockReason:removingLockCount:endError:");
}

id objc_msgSend_finishSetEliminateIfAwaitingUnlocked_forClientDomain_forAssetSetIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishSetEliminateIfAwaitingUnlocked:forClientDomain:forAssetSetIdentifier:");
}

id objc_msgSend_garbageCollectionOperationComplete_originalUnlockedUnreferencedDescriptors_originalUnlockedReferencedDescriptors_originalLockedOverridableDescriptors_originalLockedNeverRemoveDescriptors_originalStagedDescriptors_totalReclaimedSpace_results_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "garbageCollectionOperationComplete:originalUnlockedUnreferencedDescriptors:originalUnlockedReferencedDescript ors:originalLockedOverridableDescriptors:originalLockedNeverRemoveDescriptors:originalStagedDescriptors:total ReclaimedSpace:results:");
}

id objc_msgSend_getAvailableForUseAttributesAssetFormat_assetBuild_minOSVersion_maxOSVersion_prerequisiteBuilds_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "getAvailableForUseAttributesAssetFormat:assetBuild:minOSVersion:maxOSVersion:prerequisiteBuilds:");
}

id objc_msgSend_getDecryptionKey_downloadOptions_apTicket_skipKnoxLookup_disableUI_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDecryptionKey:downloadOptions:apTicket:skipKnoxLookup:disableUI:error:");
}

id objc_msgSend_getDecryptionKeyFromAssetMetadataOrDownloadOptionsInternal_downloadOptions_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDecryptionKeyFromAssetMetadataOrDownloadOptionsInternal:downloadOptions:error:");
}

id objc_msgSend_getDecryptionKeyFromKnoxUsingAssetAttributesInternal_downloadOptions_apTicket_disableUI_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "getDecryptionKeyFromKnoxUsingAssetAttributesInternal:downloadOptions:apTicket:disableUI:error:");
}

id objc_msgSend_handleClientPotentialJob_alreadyScheduledSelector_forAutoJob_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleClientPotentialJob:alreadyScheduledSelector:forAutoJob:fromLocation:");
}

id objc_msgSend_handleSetClientAlterEntriesRepresentingAtomicRequest_forAutoJob_alteringFromSetConfiguration_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "handleSetClientAlterEntriesRepresentingAtomicRequest:forAutoJob:alteringFromSetConfiguration:");
}

id objc_msgSend_handleSuccessfulDownload_task_taskId_shouldMove_extractorExists_postedDate_notModified_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSuccessfulDownload:task:taskId:shouldMove:extractorExists:postedDate:notModified:");
}

id objc_msgSend_hasOnlyAllowedDifferencesFrom_inAttributes_assetId_assetType_allowed_foundAbsoluteId_foundDiff_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "hasOnlyAllowedDifferencesFrom:inAttributes:assetId:assetType:allowed:foundAbsoluteId:foundDiff:");
}

id objc_msgSend_indicateDownloadJobFinished_usingXPCConnection_withXPCMessage_performingAutoAssetJob_ofJobType_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:");
}

id objc_msgSend_initClearingAfter_forcingUnlock_limitedToAssetTypes_withVolumeToReclaim_withUrgency_targetingPurgeAmount_simulateOperation_simulateEnd_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simu lateOperation:simulateEnd:");
}

id objc_msgSend_initForAssetSelector_withActivityInterval_forPushedJob_forSetJob_withSetPolicy_requiringRetry_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForAssetSelector:withActivityInterval:forPushedJob:forSetJob:withSetPolicy:requiringRetry:");
}

id objc_msgSend_initForAssetSelector_withActivityInterval_forPushedJob_forSetJob_withSetPolicy_withPushedPolicy_requiringRetry_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForAssetSelector:withActivityInterval:forPushedJob:forSetJob:withSetPolicy:withPushedPolicy:requiringRetry:");
}

id objc_msgSend_initForAssetType_forClientDomainName_forAssetSetIdentifier_forAssetSelector_forSetJob_withSetPolicy_withPushedPolicy_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForAssetType:forClientDomainName:forAssetSetIdentifier:forAssetSelector:forSetJob:withSetPolicy:withPushedPolicy:");
}

id objc_msgSend_initForAssetType_withAssetSpecifier_matchingAssetVersion_usingDecryptionKey_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:");
}

id objc_msgSend_initForAssetType_withAssetSpecifier_usingDecryptionKey_assetLockedInhibitsRemoval_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:");
}

id objc_msgSend_initForAssetType_withAssetSpecifier_withAssetVersion_usingDecryptionKey_assetLockedInhibitsRemoval_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:");
}

id objc_msgSend_initForAssetType_withCatalogCachedAssetSetID_withCatalogDownloadedFromLive_withCatalogLastTimeChecked_withCatalogPostedDate_withRequestedAutoAssetEntries_withDiscoveredAtomicEntries_withCatalogFromPallasResponse_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForAssetType:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCat alogPostedDate:withRequestedAutoAssetEntries:withDiscoveredAtomicEntries:withCatalogFromPallasResponse:");
}

id objc_msgSend_initForClientAssetSetPolicy_reasonDesired_awaitingDownloadOfDiscovered_withCheckWaitTimeout_withLockWaitTimeout_desiringProgress_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeo ut:desiringProgress:");
}

id objc_msgSend_initForClientDomainName_forAssetSetIdentifier_fromMinTargetOSVersion_toMaxTargetOSVersion_asEntriesWhenTargeting_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForClientDomainName:forAssetSetIdentifier:fromMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:");
}

id objc_msgSend_initForClientDomainName_forAssetSetIdentifier_withAtomicInstanceEntries_withFullyDownloaded_withNeverBeenLocked_withDownloadUserInitiated_withDownloadedNetworkBytes_withDownloadedFilesystemBytes_withStagedPriorToAvailable_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForClientDomainName:forAssetSetIdentifier:withAtomicInstanceEntries:withFullyDownloaded:withNeverBeenLock ed:withDownloadUserInitiated:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withStagedPriorToAvailable:");
}

id objc_msgSend_initForClientDomainName_forAssetSetIdentifier_withDiscoveredAtomicInstance_withDiscoveredAtomicEntries_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForClientDomainName:forAssetSetIdentifier:withDiscoveredAtomicInstance:withDiscoveredAtomicEntries:");
}

id objc_msgSend_initForClientDomainName_forSetClientName_forAssetSetIdentifier_withAtomicInstanceUUID_asSubAtomicFrom_originallyCreatedOnDate_withCreationIndex_representingInstanceEntries_inUseBySetJob_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForClientDomainName:forSetClientName:forAssetSetIdentifier:withAtomicInstanceUUID:asSubAtomicFrom:origina llyCreatedOnDate:withCreationIndex:representingInstanceEntries:inUseBySetJob:");
}

id objc_msgSend_initForClientDomainName_forSetClientName_forAssetSetIdentifier_withAutoAssetEntries_withLatestAtomicInstanceToVend_inhibitingImpliedScheduling_havingReceivedLookupResponse_vendingAtomicInstanceForConfiguredEntries_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForClientDomainName:forSetClientName:forAssetSetIdentifier:withAutoAssetEntries:withLatestAtomicInstanceT oVend:inhibitingImpliedScheduling:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:");
}

id objc_msgSend_initForClientID_withClientRequestMessage_withClientProgressProxy_withClientReplyCompletion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:");
}

id objc_msgSend_initForClientLockReason_forClientProcessName_withClientProcessID_lockingWithUsagePolicy_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForClientLockReason:forClientProcessName:withClientProcessID:lockingWithUsagePolicy:");
}

id objc_msgSend_initForClientName_withProcessName_withProcessID_usingAssetSelector_associatingFrameworkUUID_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:");
}

id objc_msgSend_initForFinishedJobSelector_withAutoAssetUUID_withSchedulerInvolved_withPotentialNetworkFailure_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForFinishedJobSelector:withAutoAssetUUID:withSchedulerInvolved:withPotentialNetworkFailure:");
}

id objc_msgSend_initForFinishedSetJob_forAssetSetIdentifier_withSetAtomicInstance_withAutoAssetUUID_withSetJobInformation_withSchedulerInvolved_withPotentialNetworkFailure_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForFinishedSetJob:forAssetSetIdentifier:withSetAtomicInstance:withAutoAssetUUID:withSetJobInformation:wit hSchedulerInvolved:withPotentialNetworkFailure:");
}

id objc_msgSend_initForInstance_orForSelector_orForDescriptor_orForSetInstance_withSetDesire_withSchedulerSetPolicy_withStagerSetPolicy_usingSetConfiguration_usingSetDescriptor_withBaseForPatchDescriptor_withAutoAssetUUID_downloadingUserInitiated_asStagerJob_usingCachedAutoAssetCatalog_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStage rSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingU serInitiated:asStagerJob:usingCachedAutoAssetCatalog:");
}

id objc_msgSend_initForJobIssueReply_forAutoAssetSelector_withAutoAssetUUID_withResponseMessage_withResponseError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForJobIssueReply:forAutoAssetSelector:withAutoAssetUUID:withResponseMessage:withResponseError:");
}

id objc_msgSend_initForModule_ofModuleVersion_usingDispatchQueue_usingLogger_loggingByName_withVersionMigrator_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForModule:ofModuleVersion:usingDispatchQueue:usingLogger:loggingByName:withVersionMigrator:");
}

id objc_msgSend_initForSecureOperationsFinished_forSetDescriptor_forAutoAssetDescriptors_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForSecureOperationsFinished:forSetDescriptor:forAutoAssetDescriptors:");
}

id objc_msgSend_initForSecureOperationsFinished_forSetDescriptor_forAutoAssetDescriptors_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForSecureOperationsFinished:forSetDescriptor:forAutoAssetDescriptors:withError:");
}

id objc_msgSend_initForSelector_withAutoAssetUUID_asStagerJob_withStagerSetPolicy_usingCachedAutoAssetCatalog_usingBaseForPatching_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForSelector:withAutoAssetUUID:asStagerJob:withStagerSetPolicy:usingCachedAutoAssetCatalog:usingBaseForPatching:");
}

id objc_msgSend_initForSetConfiguration_withAutoAssetUUID_asStagerJob_withStagerSetPolicy_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForSetConfiguration:withAutoAssetUUID:asStagerJob:withStagerSetPolicy:");
}

id objc_msgSend_initForSetInstance_withSchedulerSetPolicy_usingSetConfiguration_usingSetDescriptor_withAutoAssetUUID_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForSetInstance:withSchedulerSetPolicy:usingSetConfiguration:usingSetDescriptor:withAutoAssetUUID:");
}

id objc_msgSend_initForSetInstance_withSetDesire_usingSetConfiguration_usingSetDescriptor_withAutoAssetUUID_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForSetInstance:withSetDesire:usingSetConfiguration:usingSetDescriptor:withAutoAssetUUID:");
}

id objc_msgSend_initForSetJobIssueReply_forDomainName_forAssetSetIdentifier_withAutoAssetUUID_withSetJobInformation_withResponseError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForSetJobIssueReply:forDomainName:forAssetSetIdentifier:withAutoAssetUUID:withSetJobInformation:withResponseError:");
}

id objc_msgSend_initForStagerJobLookupResults_withBaseForStagingDescriptors_withDetermineError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForStagerJobLookupResults:withBaseForStagingDescriptors:withDetermineError:");
}

id objc_msgSend_initForStagerJobStart_withStagerSetConfiguration_usingCachedAutoAssetCatalog_usingBaseForPatching_withAssetTargetOSVersion_withAssetTargetBuildVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForStagerJobStart:withStagerSetConfiguration:usingCachedAutoAssetCatalog:usingBaseForPatching:withAssetTa rgetOSVersion:withAssetTargetBuildVersion:");
}

id objc_msgSend_initForStagerSetJobStart_withAssetTargetOSVersion_withAssetTargetBuildVersion_withAssetTargetTrainName_withAssetTargetRestoreVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForStagerSetJobStart:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAs setTargetRestoreVersion:");
}

id objc_msgSend_initForTargetOSVersion_forTargetBuild_forTargetTrainName_forTargetRestoreVersion_targetingGroupNames_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForTargetOSVersion:forTargetBuild:forTargetTrainName:forTargetRestoreVersion:targetingGroupNames:");
}

id objc_msgSend_initForTargetOSVersion_forTargetBuild_forTargetTrainName_forTargetRestoreVersion_withRequiredDescriptors_withOptionalDescriptors_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initForTargetOSVersion:forTargetBuild:forTargetTrainName:forTargetRestoreVersion:withRequiredDescriptors:with OptionalDescriptors:");
}

id objc_msgSend_initStatusForClientDomain_forAssetSetIdentifier_withAtomicInstancesDownloaded_withNewerAtomicInstanceDiscovered_withNewerDiscoveredAtomicEntries_withLatestDownloadedAtomicInstance_withLatestDowloadedAtomicInstanceEntries_withAllDownloadedAtomicInstanceEntries_withCurrentNotifications_withCurrentNeedPolicy_withSchedulerPolicy_withStagerPolicy_withDownloadUserInitiated_withDownloadProgress_withDownloadedNetworkBytes_withDownloadedFilesystemBytes_withCurrentLockUsage_withSelectorsForStaging_withAvailableForUseError_withNewerVersionError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initStatusForClientDomain:forAssetSetIdentifier:withAtomicInstancesDownloaded:withNewerAtomicInstanceDiscover ed:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntri es:withAllDownloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy: withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFile systemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:");
}

id objc_msgSend_initStatusForClientDomain_forAssetSetIdentifier_withConfiguredAssetEntries_withAtomicInstancesDownloaded_withCatalogCachedAssetSetID_withCatalogDownloadedFromLive_withCatalogLastTimeChecked_withCatalogPostedDate_withNewerAtomicInstanceDiscovered_withNewerDiscoveredAtomicEntries_withLatestDownloadedAtomicInstance_withLatestDowloadedAtomicInstanceEntries_withCurrentNotifications_withCurrentNeedPolicy_withSchedulerPolicy_withStagerPolicy_withDownloadUserInitiated_withDownloadProgress_withDownloadedNetworkBytes_withDownloadedFilesystemBytes_withCurrentLockUsage_withSelectorsForStaging_withAvailableForUseError_withNewerVersionError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:with CatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNe werAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDow loadedAtomicInstanceEntries:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPoli cy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:wi thCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:");
}

id objc_msgSend_initStatusForClientDomain_forAssetSetIdentifier_withConfiguredAssetEntries_withAtomicInstancesDownloaded_withCatalogCachedAssetSetID_withCatalogDownloadedFromLive_withCatalogLastTimeChecked_withCatalogPostedDate_withNewerAtomicInstanceDiscovered_withNewerDiscoveredAtomicEntries_withLatestDownloadedAtomicInstance_withLatestDowloadedAtomicInstanceEntries_withDownloadedCatalogCachedAssetSetID_withDownloadedCatalogDownloadedFromLive_withDownloadedCatalogLastTimeChecked_withDownloadedCatalogPostedDate_withCurrentNotifications_withCurrentNeedPolicy_withSchedulerPolicy_withStagerPolicy_havingReceivedLookupResponse_vendingAtomicInstanceForConfiguredEntries_withDownloadUserInitiated_withDownloadProgress_withDownloadedNetworkBytes_withDownloadedFilesystemBytes_withCurrentLockUsage_withSelectorsForStaging_withAvailableForUseError_withNewerVersionError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:with CatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNe werAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDow loadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:wit hDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPol icy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntri es:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:wi thCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:");
}

id objc_msgSend_initStatusForClientDomain_forAssetSetIdentifier_withConfiguredAssetEntries_withAtomicInstancesDownloaded_withCatalogCachedAssetSetID_withCatalogDownloadedFromLive_withCatalogLastTimeChecked_withCatalogPostedDate_withNewerAtomicInstanceDiscovered_withNewerDiscoveredAtomicEntries_withLatestDownloadedAtomicInstance_withLatestDowloadedAtomicInstanceEntries_withDownloadedCatalogCachedAssetSetID_withDownloadedCatalogDownloadedFromLive_withDownloadedCatalogLastTimeChecked_withDownloadedCatalogPostedDate_withCurrentNotifications_withCurrentNeedPolicy_withSchedulerPolicy_withStagerPolicy_havingReceivedLookupResponse_withDownloadUserInitiated_withDownloadProgress_withDownloadedNetworkBytes_withDownloadedFilesystemBytes_withCurrentLockUsage_withSelectorsForStaging_withAvailableForUseError_withNewerVersionError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:with CatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNe werAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDow loadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:wit hDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPol icy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:withDownloadUserInitiated:withDownloadP rogress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging :withAvailableForUseError:withNewerVersionError:");
}

id objc_msgSend_initStatusForClientDomain_forAssetSetIdentifier_withConfiguredAssetEntries_withAtomicInstancesDownloaded_withCatalogCachedAssetSetID_withCatalogDownloadedFromLive_withCatalogLastTimeChecked_withCatalogPostedDate_withNewerAtomicInstanceDiscovered_withNewerDiscoveredAtomicEntries_withLatestDownloadedAtomicInstance_withLatestDowloadedAtomicInstanceEntries_withDownloadedCatalogCachedAssetSetID_withDownloadedCatalogDownloadedFromLive_withDownloadedCatalogLastTimeChecked_withDownloadedCatalogPostedDate_withCurrentNotifications_withCurrentNeedPolicy_withSchedulerPolicy_withStagerPolicy_withDownloadUserInitiated_withDownloadProgress_withDownloadedNetworkBytes_withDownloadedFilesystemBytes_withCurrentLockUsage_withSelectorsForStaging_withAvailableForUseError_withNewerVersionError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:with CatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNe werAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDow loadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:wit hDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPol icy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetwork Bytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:wit hNewerVersionError:");
}

id objc_msgSend_initStatusForClientDomain_forAssetSetIdentifier_withConfiguredAssetEntries_withAtomicInstancesDownloaded_withNewerAtomicInstanceDiscovered_withNewerDiscoveredAtomicEntries_withLatestDownloadedAtomicInstance_withLatestDowloadedAtomicInstanceEntries_withAllDownloadedAtomicInstanceEntries_withCurrentNotifications_withCurrentNeedPolicy_withSchedulerPolicy_withStagerPolicy_withDownloadUserInitiated_withDownloadProgress_withDownloadedNetworkBytes_withDownloadedFilesystemBytes_withCurrentLockUsage_withSelectorsForStaging_withAvailableForUseError_withNewerVersionError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:with NewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestD owloadedAtomicInstanceEntries:withAllDownloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentNeed Policy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetw orkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError: withNewerVersionError:");
}

id objc_msgSend_initUsingClientDomain_forClientName_withProcessName_withProcessID_forAssetSetIdentifier_forAtomicInstance_comprisedOfEntries_asEntriesWhenTargeting_associatingFrameworkUUID_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:com prisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:");
}

id objc_msgSend_initWithAlreadyDownloadedDescriptors_withSetConfigurations_withSetTargets_withScheduledJobs_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithAlreadyDownloadedDescriptors:withSetConfigurations:withSetTargets:withScheduledJobs:");
}

id objc_msgSend_initWithAssetCatalog_forAssetSelector_forSetConfiguration_forAssetAudience_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAssetCatalog:forAssetSelector:forSetConfiguration:forAssetAudience:");
}

id objc_msgSend_initWithAssetSelector_withAssetRepresentation_withAssetWasPatched_withAssetIsStaged_withJobStatus_withScheduledIntervalSecs_withScheduledRemainingSecs_withPushDelaySecs_withActiveClientCount_withActiveMonitorCount_withMaximumClientCount_withTotalClientCount_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withSchedul edIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:with MaximumClientCount:withTotalClientCount:");
}

id objc_msgSend_initWithAssetSelector_withAssetRepresentation_withAssetWasPatched_withAssetIsStaged_withJobStatus_withScheduledIntervalSecs_withScheduledRemainingSecs_withPushDelaySecs_withActiveClientCount_withActiveMonitorCount_withMaximumClientCount_withTotalClientCount_withIsSecureMobileAsset_withPersonalizationStatus_withPrePersonalizationStatus_withGraftStatus_withGraftPoint_withStageGroupType_withTargetOS_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withSchedul edIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:with MaximumClientCount:withTotalClientCount:withIsSecureMobileAsset:withPersonalizationStatus:withPrePersonalizat ionStatus:withGraftStatus:withGraftPoint:withStageGroupType:withTargetOS:");
}

id objc_msgSend_initWithAssetSelector_withNotifications_withAvailableForUseAttributes_withNewerVersionAttributes_withDownloadUserInitiated_withDownloadProgress_withDownloadedNetworkBytes_withDownloadedFilesystemBytes_withDownloadedAsPatch_withPatchedFromBaseSelector_withPatchedFromBaseFilesystemBytes_withPatchingAttempted_withStagedPriorToAvailable_withStagedFromOSVersion_withStagedFromBuildVersion_withCurrentLockUsage_withAvailableForUseError_withPatchingAttemptError_withNewerVersionError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownload UserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsP atch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAv ailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:with PatchingAttemptError:withNewerVersionError:");
}

id objc_msgSend_initWithAssetSelector_withNotifications_withAvailableForUseAttributes_withNewerVersionAttributes_withNeverBeenLocked_withDownloadUserInitiated_withDownloadProgress_withDownloadedNetworkBytes_withDownloadedFilesystemBytes_withDownloadedAsPatch_withPatchedFromBaseSelector_withPatchedFromBaseFilesystemBytes_withPatchingAttempted_withStagedPriorToAvailable_withStagedFromOSVersion_withStagedFromBuildVersion_withCurrentLockUsage_withAvailableForUseError_withPatchingAttemptError_withNewerVersionError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBee nLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemByt es:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted :withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvail ableForUseError:withPatchingAttemptError:withNewerVersionError:");
}

id objc_msgSend_initWithAssetTargetOSVersion_withAssetTargetBuildVersion_withAssetTargetTrainName_withAssetTargetRestoreVersion_withControlInformation_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersi on:withControlInformation:");
}

id objc_msgSend_initWithAutoAssetCatalog_withBaseForStagingDescriptors_withOperationError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAutoAssetCatalog:withBaseForStagingDescriptors:withOperationError:");
}

id objc_msgSend_initWithClientRequest_withAssetSelector_forClientDomain_forSetIdentifier_withDownloadedSetDescriptors_awaitingUnlocked_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithClientRequest:withAssetSelector:forClientDomain:forSetIdentifier:withDownloadedSetDescriptors:awaitingUnlocked:");
}

id objc_msgSend_initWithDesiredCategory_forClientAssetPolicy_reasonDesired_withCheckWaitTimeout_withLockWaitTimeout_desiringProgress_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:");
}

id objc_msgSend_initWithDispatchQueue_withPersistencePath_forPolicyVersion_issuingDefaultLevelLogging_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:");
}

id objc_msgSend_initWithDomainName_forAssetSetIdentifier_withAssetSetRepresentation_withSetJobStatus_withScheduledIntervalSecs_withScheduledRemainingSecs_withPushDelaySecs_withActiveClientCount_withActiveMonitorCount_withMaximumClientCount_withTotalClientCount_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithDomainName:forAssetSetIdentifier:withAssetSetRepresentation:withSetJobStatus:withScheduledIntervalSec s:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaximumClient Count:withTotalClientCount:");
}

id objc_msgSend_initWithDomainName_forAssetSetIdentifier_withConfiguredAssetEntries_withLatestDownloadedAtomicInstance_withDownloadedAtomicInstances_withDiscoveredAtomicInstance_withActiveClientCount_withActiveMonitorCount_withMaximumClientCount_withTotalClientCount_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithDomainName:forAssetSetIdentifier:withConfiguredAssetEntries:withLatestDownloadedAtomicInstance:withDo wnloadedAtomicInstances:withDiscoveredAtomicInstance:withActiveClientCount:withActiveMonitorCount:withMaximum ClientCount:withTotalClientCount:");
}

id objc_msgSend_initWithError_spaceCheckedID_totalRequiredFreeSpace_cacheDeleteUrgency_completionQueue_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithError:spaceCheckedID:totalRequiredFreeSpace:cacheDeleteUrgency:completionQueue:completion:");
}

id objc_msgSend_initWithFullAssetSelector_withAssetID_withLocalContentURL_withAssetAttributes_inhibitedFromEmergencyRemoval_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:");
}

id objc_msgSend_initWithParamType_withSafeSummary_withClientRequest_withAutoAssetSelector_withAutoAssetJobID_withAutoAssetCatalog_whereCatalogFromLookupCache_withFinishedError_withDownloadProgress_withAssetTargetOSVersion_withAssetTargetBuildVersion_withAssetTargetTrainName_withAssetTargetRestoreVersion_withAutoAssetDescriptor_withControlInformation_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithParamType:withSafeSummary:withClientRequest:withAutoAssetSelector:withAutoAssetJobID:withAutoAssetCat alog:whereCatalogFromLookupCache:withFinishedError:withDownloadProgress:withAssetTargetOSVersion:withAssetTar getBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withAutoAssetDescriptor:withControlInformation:");
}

id objc_msgSend_initWithParamType_withSafeSummary_withMonitorMarkers_withMarkersNoRetry_withMarkersRequiringRetry_withFinishedMarker_withPotentialNetworkFailure_withObservedNetworkPath_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithParamType:withSafeSummary:withMonitorMarkers:withMarkersNoRetry:withMarkersRequiringRetry:withFinishe dMarker:withPotentialNetworkFailure:withObservedNetworkPath:");
}

id objc_msgSend_initWithParamType_withSafeSummary_withScheduledJobs_withClientID_withClientRequestMessage_withClientProgressProxy_withClientReplyCompletion_withResponseMessage_withResponseError_withDownloadsInFlight_withAutoAssetJobID_withAutoAssetCatalog_withLockForUseError_withFinishedError_withDownloadProgress_withJobCurrentStatus_withAutoAssetSelector_withAutoAssetUUID_withSetOfAutoAssetSelectors_withPushNotifications_withSetDescriptor_withAutoAssetDescriptors_withSetPolicy_withAssetTargetOSVersion_withAssetTargetBuildVersion_withAssetTargetTrainName_withAssetTargetRestoreVersion_withStagedToDownloaded_withStagedLookupResults_withDownloadingDescriptor_withBaseForPatchDescriptor_withBaseForStagingDescriptors_withSchedulerInvolved_withPotentialNetworkFailure_withClientDomainName_withAssetSetIdentifier_withSetConfiguration_withSetAtomicInstance_withSetJobInformation_withTriggeredSets_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:");
}

id objc_msgSend_initWithParamType_withSafeSummary_withStagingClientRequest_withBaseForStagingDescriptors_withJobInformation_withAutoAssetCatalog_withOperationError_withAssetType_withAssetSelector_withSetIdentifierConfiguration_withTimerUUID_withAlreadyDownloaded_withSetConfigurations_withSetTargets_withScheduledJobs_withDownloadedDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:w ithAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTim erUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:");
}

id objc_msgSend_initWithPushReason_forAssetType_withAssetSpecifier_matchingAssetVersion_withUpdatePolicy_withAdditional_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:");
}

id objc_msgSend_initWithReclaimV2AssetSpace_reclaimV2AssetCount_reclaimUnlockedUnreferencedAutoAssetSpace_reclaimUnlockedUnreferencedAutoAssetCount_reclaimUnlockedReferencedAutoAssetSpace_reclaimUnlockedReferencedAutoAssetCount_reclaimLockedOverridableAutoAssetSpace_reclaimLockedOverridableAutoAssetCount_reclaimLockedNeverRemoveAutoAssetSpace_reclaimLockedNeverRemoveAutoAssetCount_reclaimStagedAutoAssetSpace_reclaimStagedAutoAssetCount_reclaimMetadataBlockedSpace_reclaimMetadataBlockedCount_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithReclaimV2AssetSpace:reclaimV2AssetCount:reclaimUnlockedUnreferencedAutoAssetSpace:reclaimUnlockedUnre ferencedAutoAssetCount:reclaimUnlockedReferencedAutoAssetSpace:reclaimUnlockedReferencedAutoAssetCount:reclai mLockedOverridableAutoAssetSpace:reclaimLockedOverridableAutoAssetCount:reclaimLockedNeverRemoveAutoAssetSpac e:reclaimLockedNeverRemoveAutoAssetCount:reclaimStagedAutoAssetSpace:reclaimStagedAutoAssetCount:reclaimMetad ataBlockedSpace:reclaimMetadataBlockedCount:");
}

id objc_msgSend_initWithTotalRequiredFreeSpace_cacheDeleteUrgency_completionQueue_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTotalRequiredFreeSpace:cacheDeleteUrgency:completionQueue:completion:");
}

id objc_msgSend_initWithUpdateAttributes_withByGroupAvailableForStaging_withByGroupTotalExpectedBytes_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUpdateAttributes:withByGroupAvailableForStaging:withByGroupTotalExpectedBytes:");
}

id objc_msgSend_initialStatusForJob_usingSelector_withJobUUID_downloadingDescriptor_baseForPatchDescriptor_withClientAssetPolicy_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initialStatusForJob:usingSelector:withJobUUID:downloadingDescriptor:baseForPatchDescriptor:withClientAssetPolicy:");
}

id objc_msgSend_isSetIdentifierCurrentlyLocked_forClientDomainName_forAssetSetIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSetIdentifierCurrentlyLocked:forClientDomainName:forAssetSetIdentifier:");
}

id objc_msgSend_issueBuiltResponseForEventInfo_issuingResponseMessage_withResponseError_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "issueBuiltResponseForEventInfo:issuingResponseMessage:withResponseError:fromLocation:");
}

id objc_msgSend_issueResponseToFailedAutoAssetLockRequest_forEventInfo_withResponseError_forAttemptedDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "issueResponseToFailedAutoAssetLockRequest:forEventInfo:withResponseError:forAttemptedDescriptor:");
}

id objc_msgSend_issueResponseToFailedSetLockRequest_forEventInfo_forAtomicInstance_withResponseError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "issueResponseToFailedSetLockRequest:forEventInfo:forAtomicInstance:withResponseError:");
}

id objc_msgSend_jobFinishedForSetDomainName_forAssetSetIdentifier_withPotentialNetworkFailure_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "jobFinishedForSetDomainName:forAssetSetIdentifier:withPotentialNetworkFailure:");
}

id objc_msgSend_latestShortTermLockableAtomicInstanceForClientDomain_forAssetSetIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestShortTermLockableAtomicInstanceForClientDomain:forAssetSetIdentifier:");
}

id objc_msgSend_loadCatalog_catalogAssets_assetIds_postedDate_lastFetchDate_catalogInfo_withPurpose_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadCatalog:catalogAssets:assetIds:postedDate:lastFetchDate:catalogInfo:withPurpose:");
}

id objc_msgSend_loadDescriptorsForJobSelector_promotingIfCurrentlyStaged_immediatelyPromotedDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadDescriptorsForJobSelector:promotingIfCurrentlyStaged:immediatelyPromotedDescriptor:");
}

id objc_msgSend_locateSetDescriptorDownloadedByClientDomain_forAssetSetIdentifier_consideringPreviouslyStaged_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "locateSetDescriptorDownloadedByClientDomain:forAssetSetIdentifier:consideringPreviouslyStaged:");
}

id objc_msgSend_locateSetDescriptorDownloadedByClientDomain_forAssetSetIdentifier_forSetConfiguration_requestedAutoAssetEntries_performingNoWait_consideringPreviouslyStaged_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "locateSetDescriptorDownloadedByClientDomain:forAssetSetIdentifier:forSetConfiguration:requestedAutoAssetEntri es:performingNoWait:consideringPreviouslyStaged:");
}

id objc_msgSend_locateSetDescriptorDownloadedPreferringByAtomicInstance_elseByClientDomain_forAssetSetIdentifier_forSetConfiguration_requestedAutoAssetEntries_performingNoWait_creatingIfPreviouslyStagedFound_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "locateSetDescriptorDownloadedPreferringByAtomicInstance:elseByClientDomain:forAssetSetIdentifier:forSetConfig uration:requestedAutoAssetEntries:performingNoWait:creatingIfPreviouslyStagedFound:fromLocation:");
}

id objc_msgSend_locateSetDescriptorDownloadedPreferringByAtomicInstance_elseByClientDomain_forAssetSetIdentifier_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "locateSetDescriptorDownloadedPreferringByAtomicInstance:elseByClientDomain:forAssetSetIdentifier:fromLocation:");
}

id objc_msgSend_locateSetStatusPreferringByInstance_elseByClientDomain_forAssetSetIdentifier_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locateSetStatusPreferringByInstance:elseByClientDomain:forAssetSetIdentifier:fromLocation:");
}

id objc_msgSend_lockedByClient_forClientProcessName_withClientProcessID_forAssetSelector_forLockReason_withUsagePolicy_withLocalContentURL_withAssetAttributes_lockError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "lockedByClient:forClientProcessName:withClientProcessID:forAssetSelector:forLockReason:withUsagePolicy:withLo calContentURL:withAssetAttributes:lockError:");
}

id objc_msgSend_lockedSetByClient_forClientProcessName_withClientProcessID_lockingSetDescriptor_forLockReason_withSetUsagePolicy_lockError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "lockedSetByClient:forClientProcessName:withClientProcessID:lockingSetDescriptor:forLockReason:withSetUsagePolicy:lockError:");
}

id objc_msgSend_maintainReclaimCountsByCollectionType_reclaimAssetSpace_cacheDeleteResults_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maintainReclaimCountsByCollectionType:reclaimAssetSpace:cacheDeleteResults:");
}

id objc_msgSend_massageXmlAndPersist_catalogInfo_descriptor_assets_transformations_to_postedDate_receiptResults_assetSetId_pallasUrl_considerCaching_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "massageXmlAndPersist:catalogInfo:descriptor:assets:transformations:to:postedDate:receiptResults:assetSetId:pa llasUrl:considerCaching:");
}

id objc_msgSend_migrateMismatchedPersistedAvailableForStagingPromotionVersion_forEntryID_withMismatchedState_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "migrateMismatchedPersistedAvailableForStagingPromotionVersion:forEntryID:withMismatchedState:");
}

id objc_msgSend_migrateMismatchedPersistedDescriptorVersion_forEntryID_withMismatchedState_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateMismatchedPersistedDescriptorVersion:forEntryID:withMismatchedState:");
}

id objc_msgSend_migrateMismatchedPersistedSetAtomicInstanceVersion_forEntryID_withMismatchedState_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateMismatchedPersistedSetAtomicInstanceVersion:forEntryID:withMismatchedState:");
}

id objc_msgSend_migrateMismatchedPersistedSetConfigurationVersion_forEntryID_withMismatchedState_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateMismatchedPersistedSetConfigurationVersion:forEntryID:withMismatchedState:");
}

id objc_msgSend_migrateMismatchedPersistedSetDescriptorVersion_forEntryID_withMismatchedState_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateMismatchedPersistedSetDescriptorVersion:forEntryID:withMismatchedState:");
}

id objc_msgSend_migrateMismatchedPersistedSetPromotionVersion_forEntryID_withMismatchedState_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateMismatchedPersistedSetPromotionVersion:forEntryID:withMismatchedState:");
}

id objc_msgSend_migrateMismatchedPersistedSetTargetVersion_forEntryID_withMismatchedState_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateMismatchedPersistedSetTargetVersion:forEntryID:withMismatchedState:");
}

id objc_msgSend_migrateMismatchedPersistedStagedSetConfiguration_forEntryID_withMismatchedState_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateMismatchedPersistedStagedSetConfiguration:forEntryID:withMismatchedState:");
}

id objc_msgSend_migrateMismatchedPersistedTargetPromotionVersion_forEntryID_withMismatchedState_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateMismatchedPersistedTargetPromotionVersion:forEntryID:withMismatchedState:");
}

id objc_msgSend_newAssetSetStatus_forReason_forClientDomain_forAssetSetIdentifier_withAtomicInstancesDownloaded_withCatalogCachedAssetSetID_withCatalogDownloadedFromLive_withCatalogLastTimeChecked_withCatalogPostedDate_withNewerAtomicInstanceDiscovered_withNewerDiscoveredAtomicEntries_withLatestDownloadedAtomicInstance_withLatestDowloadedAtomicInstanceEntries_withDownloadedCatalogCachedAssetSetID_withDownloadedCatalogDownloadedFromLive_withDownloadedCatalogLastTimeChecked_withDownloadedCatalogPostedDate_withCurrentNotifications_withCurrentNeedPolicy_withSchedulerPolicy_withStagerPolicy_havingReceivedLookupResponse_vendingAtomicInstanceForConfiguredEntries_withDownloadUserInitiated_withDownloadProgress_withDownloadedNetworkBytes_withDownloadedFilesystemBytes_extendingWithCurrentLockUsage_withSelectorsForStaging_withAvailableForUseError_withNewerVersionError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "newAssetSetStatus:forReason:forClientDomain:forAssetSetIdentifier:withAtomicInstancesDownloaded:withCatalogCa chedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomic InstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAto micInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownload edCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withS chedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDo wnloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:extendingWi thCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:");
}

id objc_msgSend_newAssetStatusForSelector_withNotifications_withAvailableForUseAttributes_withNewerVersionAttributes_withNeverBeenLocked_withDownloadUserInitiated_withDownloadProgress_withDownloadedNetworkBytes_withDownloadedFilesystemBytes_withDownloadedAsPatch_withPatchedFromBaseSelector_withPatchedFromBaseFilesystemBytes_withPatchingAttempted_withStagedPriorToAvailable_withStagedFromOSVersion_withStagedFromBuildVersion_extendingWithCurrentLockUsage_withAvailableForUseError_withPatchingAttemptError_withNewerVersionError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "newAssetStatusForSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeve rBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesyste mBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttem pted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:extendingWithCurrentLockUs age:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:");
}

id objc_msgSend_newDefaultEventDictionary_sessionId_nonce_url_statusCode_assetAudience_uuid_assetType_version_receiptResults_baseUrl_discretionary_deviceCheck_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "newDefaultEventDictionary:sessionId:nonce:url:statusCode:assetAudience:uuid:assetType:version:receiptResults: baseUrl:discretionary:deviceCheck:");
}

id objc_msgSend_newSetDescriptorFromAlreadyDownloaded_forSetInfoInstance_fromDownloadedSetDescriptor_forAtomicInstance_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "newSetDescriptorFromAlreadyDownloaded:forSetInfoInstance:fromDownloadedSetDescriptor:forAtomicInstance:");
}

id objc_msgSend_newSetEntryIDForClientDomainName_forAssetSetIdentifier_forMinTargetOS_forMaxTargetOS_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newSetEntryIDForClientDomainName:forAssetSetIdentifier:forMinTargetOS:forMaxTargetOS:");
}

id objc_msgSend_newSetInfoLimitedToCheckInformation_forAssetSetIdentifier_fromSetInfoFound_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newSetInfoLimitedToCheckInformation:forAssetSetIdentifier:fromSetInfoFound:");
}

id objc_msgSend_newSetTargetFromClientProvidedSetTarget_forClientDomainName_forSetIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newSetTargetFromClientProvidedSetTarget:forClientDomainName:forSetIdentifier:");
}

id objc_msgSend_newStagingInfoWithGroupsAvailableForStaging_indicatingHaveAvailable_usingTargetLookupKey_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newStagingInfoWithGroupsAvailableForStaging:indicatingHaveAvailable:usingTargetLookupKey:");
}

id objc_msgSend_notifyLockerAsIndicatedBySetJob_withSetInstance_withSetDesire_forSetDescriptor_withClientReplyCompletion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "notifyLockerAsIndicatedBySetJob:withSetInstance:withSetDesire:forSetDescriptor:withClientReplyCompletion:");
}

id objc_msgSend_notifyLockerJustLockedDescriptor_forClientInstance_withClientDesire_respondingToClientRequest_withClientCompletion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "notifyLockerJustLockedDescriptor:forClientInstance:withClientDesire:respondingToClientRequest:withClientCompletion:");
}

id objc_msgSend_pallasRequestV2_normalizedType_withPurpose_options_using_with_autoAssetJob_clientName_then_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:");
}

id objc_msgSend_performCacheDeleteCollection_forCollectionType_withGarbageCollectionTypes_cacheDeleteResults_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "performCacheDeleteCollection:forCollectionType:withGarbageCollectionTypes:cacheDeleteResults:");
}

id objc_msgSend_performGarbageCollectionOfType_forAssetTypeDir_fromDescriptors_cacheDeleteResults_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performGarbageCollectionOfType:forAssetTypeDir:fromDescriptors:cacheDeleteResults:");
}

id objc_msgSend_persistForJobSelector_persistingJobDescriptor_justDownloaded_justPatched_withJobInformation_withFirstClientName_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "persistForJobSelector:persistingJobDescriptor:justDownloaded:justPatched:withJobInformation:withFirstClientName:");
}

id objc_msgSend_persistForJobSelector_persistingJobDescriptor_justPatched_withJobInformation_withFirstClientName_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "persistForJobSelector:persistingJobDescriptor:justPatched:withJobInformation:withFirstClientName:");
}

id objc_msgSend_persistForJobSelector_persistingJobDescriptor_withJobInformation_withFirstClientName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistForJobSelector:persistingJobDescriptor:withJobInformation:withFirstClientName:");
}

id objc_msgSend_personalizeDownloaded_personalizingDescriptor_allowingNetwork_committingPersonalization_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "personalizeDownloaded:personalizingDescriptor:allowingNetwork:committingPersonalization:completion:");
}

id objc_msgSend_personalizeGraftSetDownloaded_forSetDescriptor_allowingNetwork_withAutoAssetDescriptors_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "personalizeGraftSetDownloaded:forSetDescriptor:allowingNetwork:withAutoAssetDescriptors:completion:");
}

id objc_msgSend_personalizeSetDownloaded_forSetDescriptor_allowingNetwork_withAutoAssetDescriptors_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "personalizeSetDownloaded:forSetDescriptor:allowingNetwork:withAutoAssetDescriptors:completion:");
}

id objc_msgSend_personalizeSetDownloaded_forSetDescriptor_shouldGraft_allowingNetwork_withAutoAssetDescriptors_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "personalizeSetDownloaded:forSetDescriptor:shouldGraft:allowingNetwork:withAutoAssetDescriptors:completion:");
}

id objc_msgSend_postNotificationName_forAssetType_forAssetSpecifier_fromModule_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:forAssetType:forAssetSpecifier:fromModule:fromLocation:");
}

id objc_msgSend_preInstalledSetDescriptor_forClientDomainName_forSetClientName_forAssetSetIdentifier_representingInstanceEntries_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "preInstalledSetDescriptor:forClientDomainName:forSetClientName:forAssetSetIdentifier:representingInstanceEntries:");
}

id objc_msgSend_purgeAlreadyStagedNotApplicableForRequiredByTarget_andNotApplicableForOptionalByTarget_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeAlreadyStagedNotApplicableForRequiredByTarget:andNotApplicableForOptionalByTarget:");
}

id objc_msgSend_recordCacheDeleteAttempt_timeTakenSecs_cacheDeleteUrgency_results_targetPurgeVolume_triggeringOperation_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordCacheDeleteAttempt:timeTakenSecs:cacheDeleteUrgency:results:targetPurgeVolume:triggeringOperation:");
}

id objc_msgSend_recordDownloadAttemptForAssetType_clientName_baseUrl_relativePath_purpose_result_analyticsFileType_isAutoDownload_isPallas_pallasAssetAudience_isUserPriority_bytesWritten_bytesTransferredEst_brainVersion_additionalData_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordDownloadAttemptForAssetType:clientName:baseUrl:relativePath:purpose:result:analyticsFileType:isAutoDown load:isPallas:pallasAssetAudience:isUserPriority:bytesWritten:bytesTransferredEst:brainVersion:additionalData:");
}

id objc_msgSend_recordFailedOperation_fromClient_forAssetID_withSelector_failingWithError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:");
}

id objc_msgSend_recordFailedOperation_fromClient_forClientDomainName_forAssetSetIdentifier_forAtomicInstance_failingWithError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordFailedOperation:fromClient:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:");
}

id objc_msgSend_recordFailedOperation_fromLayer_forAssetID_withSelector_failingWithError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:");
}

id objc_msgSend_recordFailedOperation_fromLayer_forClientDomainName_forAssetSetIdentifier_forAtomicInstance_failingWithError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:");
}

id objc_msgSend_recordHistoryEntry_toHistoryType_fromClient_fromLayer_forAssetID_withSelector_usageCount_configuredCount_requestedCount_fromPallasCount_vendingCount_forClientDomainName_forAssetSetIdentifier_forAtomicInstance_withAddendumMessage_failingWithError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordHistoryEntry:toHistoryType:fromClient:fromLayer:forAssetID:withSelector:usageCount:configuredCount:requ estedCount:fromPallasCount:vendingCount:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:withAdden dumMessage:failingWithError:");
}

id objc_msgSend_recordMobileAssetPromotionAttempt_assetType_assetVersion_osPromotion_successfullyPromoted_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordMobileAssetPromotionAttempt:assetType:assetVersion:osPromotion:successfullyPromoted:");
}

id objc_msgSend_recordMobileAssetSecureAttempt_assetType_assetVersion_clientName_operation_secureReason_fromLocation_sucessfullyPersonalized_personalizeFailureReason_sucessfullyMounted_mountingFailureReason_successfullyGrafted_graftingFailureReason_successfullyMappedToExclave_mapToExclaveFailureReason_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordMobileAssetSecureAttempt:assetType:assetVersion:clientName:operation:secureReason:fromLocation:sucessfu llyPersonalized:personalizeFailureReason:sucessfullyMounted:mountingFailureReason:successfullyGrafted:graftin gFailureReason:successfullyMappedToExclave:mapToExclaveFailureReason:");
}

id objc_msgSend_recordOperation_toHistoryType_fromClient_fromLayer_forAssetID_withSelector_usageCount_configuredCount_requestedCount_fromPallasCount_vendingCount_forClientDomainName_forAssetSetIdentifier_forAtomicInstance_withAddendumMessage_failingWithError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordOperation:toHistoryType:fromClient:fromLayer:forAssetID:withSelector:usageCount:configuredCount:request edCount:fromPallasCount:vendingCount:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:withAddendum Message:failingWithError:");
}

id objc_msgSend_recordOperation_toHistoryType_fromClient_usageCount_forAssetID_withSelector_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:");
}

id objc_msgSend_recordOperation_toHistoryType_fromLayer_configuredCount_requestedCount_fromPallasCount_vendingCount_forClientDomainName_forAssetSetIdentifier_forAtomicInstance_withAddendumMessage_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordOperation:toHistoryType:fromLayer:configuredCount:requestedCount:fromPallasCount:vendingCount:forClient DomainName:forAssetSetIdentifier:forAtomicInstance:withAddendumMessage:");
}

id objc_msgSend_recordOperation_toHistoryType_fromLayer_usageCount_forAssetID_withSelector_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordOperation:toHistoryType:fromLayer:usageCount:forAssetID:withSelector:");
}

id objc_msgSend_recordOperation_toHistoryType_fromLayer_usageCount_forClientDomainName_forAssetSetIdentifier_forAtomicInstance_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordOperation:toHistoryType:fromLayer:usageCount:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:");
}

id objc_msgSend_recordOperation_toHistoryType_fromLayer_usageCount_forClientDomainName_forAssetSetIdentifier_forAtomicInstance_withAddendumMessage_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordOperation:toHistoryType:fromLayer:usageCount:forClientDomainName:forAssetSetIdentifier:forAtomicInstanc e:withAddendumMessage:");
}

id objc_msgSend_recordPushNotification_assetType_cloudChannel_forPopulationType_userInitiated_interestAcrossTerm_lockAcrossReboot_lockAcrossTermination_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordPushNotification:assetType:cloudChannel:forPopulationType:userInitiated:interestAcrossTerm:lockAcrossRe boot:lockAcrossTermination:");
}

id objc_msgSend_recordPushNotification_assetType_cloudChannels_forPopulationType_userInitiated_interestAcrossTerm_lockAcrossReboot_lockAcrossTermination_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordPushNotification:assetType:cloudChannels:forPopulationType:userInitiated:interestAcrossTerm:lockAcrossR eboot:lockAcrossTermination:");
}

id objc_msgSend_recordQueryAttemptForAssetType_clientName_purpose_result_assetCount_returnTypes_filtered_requireSpecificAsset_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordQueryAttemptForAssetType:clientName:purpose:result:assetCount:returnTypes:filtered:requireSpecificAsset:");
}

id objc_msgSend_registerAssetDownloadJob_forAssetType_withPurpose_clientName_usingDownloadOptions_forAssetId_withCatalogMetadata_withSpaceCheckedUUID_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "registerAssetDownloadJob:forAssetType:withPurpose:clientName:usingDownloadOptions:forAssetId:withCatalogMetad ata:withSpaceCheckedUUID:");
}

id objc_msgSend_registerAssetDownloadJob_forThis_withBase_relativeTo_startingAt_withLength_extractWith_allocateExtractorIfNecessary_connection_message_clientName_notify_withCatalogMetadata_withSpaceCheckedUUID_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "registerAssetDownloadJob:forThis:withBase:relativeTo:startingAt:withLength:extractWith:allocateExtractorIfNec essary:connection:message:clientName:notify:withCatalogMetadata:withSpaceCheckedUUID:");
}

id objc_msgSend_registerAssetDownloadJob_withPurpose_usingDownloadOptions_forAssetId_withBase_relativeTo_startingAt_withLength_extractWith_allocateExtractorIfNecessary_usingXPCConnection_withXPCMessage_clientName_performingAutoAssetJob_notify_withCatalogMetadata_withSpaceCheckedUUID_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativeTo:startingAt:withLengt h:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:clientName:performingAutoAssetJo b:notify:withCatalogMetadata:withSpaceCheckedUUID:");
}

id objc_msgSend_registerCatalogDownloadJob_forAssetType_withPurpose_usingDownloadOptions_forAutoAssetName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerCatalogDownloadJob:forAssetType:withPurpose:usingDownloadOptions:forAutoAssetName:");
}

id objc_msgSend_registerCatalogDownloadJob_withPurpose_usingDownloadOptions_usingXPCConnection_withXPCMessage_performingAutoAssetJob_asClientName_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:withXPCMessage:performingAutoA ssetJob:asClientName:");
}

id objc_msgSend_removeActiveJobForFullSelector_removingFullSelector_alsoRemovingNoVersionSelector_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeActiveJobForFullSelector:removingFullSelector:alsoRemovingNoVersionSelector:");
}

id objc_msgSend_removeCurrentSetJob_schedulerInvolved_potentialNetworkFailure_fromLocation_historyOperation_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "removeCurrentSetJob:schedulerInvolved:potentialNetworkFailure:fromLocation:historyOperation:");
}

id objc_msgSend_removeSetDescriptorActiveJobByClientDomain_forAssetSetIdentifier_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSetDescriptorActiveJobByClientDomain:forAssetSetIdentifier:fromLocation:");
}

id objc_msgSend_removeSetDescriptorDownloaded_fromLocation_checkingByInstance_regardlessOfLatest_historyOperationAI_historyOperationSD_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "removeSetDescriptorDownloaded:fromLocation:checkingByInstance:regardlessOfLatest:historyOperationAI:historyOperationSD:");
}

id objc_msgSend_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestServerForDecryptionKey:recipientPrivateKey:downloadOptions:disableUI:err:");
}

id objc_msgSend_respondToCacheDelete_targetingPurgeAmount_cacheDeleteResults_withUrgency_forVolume_then_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "respondToCacheDelete:targetingPurgeAmount:cacheDeleteResults:withUrgency:forVolume:then:");
}

id objc_msgSend_scheduleSetDomainName_forAssetSetIdentifier_usingSetUpdatePolicy_forSetConfiguration_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleSetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:forSetConfiguration:");
}

id objc_msgSend_securePersonalizeGraftLockSet_lockingSetDescriptor_forEventInfo_fallingBackToSetDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "securePersonalizeGraftLockSet:lockingSetDescriptor:forEventInfo:fallingBackToSetDescriptor:");
}

id objc_msgSend_securePersonalizeGraftLockSet_lockingSetDescriptor_forEventInfo_replyingOnError_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "securePersonalizeGraftLockSet:lockingSetDescriptor:forEventInfo:replyingOnError:completion:");
}

id objc_msgSend_secureStartupEstablishOperationSequence_forRequiringPersonalization_forRequiringGrafting_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secureStartupEstablishOperationSequence:forRequiringPersonalization:forRequiringGrafting:");
}

id objc_msgSend_sendDownloadCannotStartResult_assetType_connection_requestMessage_clientName_autoAssetJobID_ofJobType_underlyingError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:");
}

id objc_msgSend_sendPmvResults_pmvInfo_postedDate_lastFetchedDate_result_connection_message_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendPmvResults:pmvInfo:postedDate:lastFetchedDate:result:connection:message:");
}

id objc_msgSend_sendQueryResults_assetType_purpose_catalogInfo_returnTypes_postedDate_lastFetchedDate_result_isFiltered_requireSpecificAsset_connection_message_clientName_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendQueryResults:assetType:purpose:catalogInfo:returnTypes:postedDate:lastFetchedDate:result:isFiltered:requi reSpecificAsset:connection:message:clientName:");
}

id objc_msgSend_setConfigurationFromMessageName_withInfoInstance_errorCode_errorDescription_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigurationFromMessageName:withInfoInstance:errorCode:errorDescription:");
}

id objc_msgSend_setConfigurationNewSetConfiguration_forSetInfoInstance_dueToMessageName_selectedConfig_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigurationNewSetConfiguration:forSetInfoInstance:dueToMessageName:selectedConfig:");
}

id objc_msgSend_setConfigurationPotentialLatestToVend_forSetDescriptor_forSetConfiguration_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigurationPotentialLatestToVend:forSetDescriptor:forSetConfiguration:");
}

id objc_msgSend_setDescriptorEliminate_triggeredByClient_forClientDomainName_forAssetSetIdentifier_awaitingUnlocked_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setDescriptorEliminate:triggeredByClient:forClientDomainName:forAssetSetIdentifier:awaitingUnlocked:");
}

id objc_msgSend_setDescriptorEliminateMatching_forClientDomainName_forAssetSetIdentifier_eliminatingSetIdentifer_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setDescriptorEliminateMatching:forClientDomainName:forAssetSetIdentifier:eliminatingSetIdentifer:");
}

id objc_msgSend_setIdentifierEliminate_usingEliminateTracker_whenCurrentlyLocked_beginningToEliminate_removingContent_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setIdentifierEliminate:usingEliminateTracker:whenCurrentlyLocked:beginningToEliminate:removingContent:");
}

id objc_msgSend_setTargetNewEntryIDForClientDomainName_forAssetSetIdentifier_forClientProvidedSetTarget_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetNewEntryIDForClientDomainName:forAssetSetIdentifier:forClientProvidedSetTarget:");
}

id objc_msgSend_stagerStartJobDownloadForStaging_withStagerSetConfiguration_usingCachedAutoAssetCatalog_usingBaseForPatching_withAssetTargetOSVersion_withAssetTargetBuildVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "stagerStartJobDownloadForStaging:withStagerSetConfiguration:usingCachedAutoAssetCatalog:usingBaseForPatching: withAssetTargetOSVersion:withAssetTargetBuildVersion:");
}

id objc_msgSend_stagerStartSetJobDetermineIfAvailable_withAssetTargetOSVersion_withAssetTargetBuildVersion_withAssetTargetTrainName_withAssetTargetRestoreVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "stagerStartSetJobDetermineIfAvailable:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTra inName:withAssetTargetRestoreVersion:");
}

id objc_msgSend_startDownloadAndUpdateState_for_modified_options_using_with_clientName_autoAssetJob_ofJobType_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startDownloadAndUpdateState:for:modified:options:using:with:clientName:autoAssetJob:ofJobType:");
}

id objc_msgSend_startDownloadAndUpdateState_for_startingAt_withLength_extractWith_modified_options_downloadSize_using_with_clientName_autoAssetJob_ofJobType_notify_spaceCheckedUUID_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startDownloadAndUpdateState:for:startingAt:withLength:extractWith:modified:options:downloadSize:using:with:cl ientName:autoAssetJob:ofJobType:notify:spaceCheckedUUID:");
}

id objc_msgSend_startDownloadTask_downloadSize_for_startingAt_withLength_extractWith_options_modified_session_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:modified:session:");
}

id objc_msgSend_startDownloadTask_downloadSize_for_startingAt_withLength_extractWith_options_modified_session_isCachingServer_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:modified:session:isCachingServer:");
}

id objc_msgSend_startStagerDetermineIfAvailable_withAssetTargetBuildVersion_withAssetTargetTrainName_withAssetTargetRestoreVersion_withControlInformation_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startStagerDetermineIfAvailable:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVe rsion:withControlInformation:");
}

id objc_msgSend_startStagerDownloadForStaging_withAssetTargetBuildVersion_withControlInformation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startStagerDownloadForStaging:withAssetTargetBuildVersion:withControlInformation:");
}

id objc_msgSend_targetLookupResultsKeyForTrainName_withRestoreVersion_withTargetBuildVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetLookupResultsKeyForTrainName:withRestoreVersion:withTargetBuildVersion:");
}

id objc_msgSend_trackDescriptor_persisting_fromLocation_changedWhileTerminated_changedNeverBeenLocked_historyOperation_firstClientName_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "trackDescriptor:persisting:fromLocation:changedWhileTerminated:changedNeverBeenLocked:historyOperation:firstClientName:");
}

id objc_msgSend_trackSetDescriptor_fromLocation_forLatestDownloaded_forSpecificAtomicInstance_withCurrentSetStatus_changedWhileTerminated_changedNeverBeenLocked_notifyingIfJustDownloaded_latestToVend_historyOperation_firstClientName_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "trackSetDescriptor:fromLocation:forLatestDownloaded:forSpecificAtomicInstance:withCurrentSetStatus:changedWhi leTerminated:changedNeverBeenLocked:notifyingIfJustDownloaded:latestToVend:historyOperation:firstClientName:");
}

id objc_msgSend_triggerWithRetrySetDomainName_forAssetSetIdentifier_usingSetUpdatePolicy_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerWithRetrySetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:");
}

id objc_msgSend_updateAutoAssetSetStatus_forClientDomain_forAssetSetIdentifier_forJobResponse_withResponseError_clearingDownloadProgressReason_withAssetSetStatus_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateAutoAssetSetStatus:forClientDomain:forAssetSetIdentifier:forJobResponse:withResponseError:clearingDownl oadProgressReason:withAssetSetStatus:");
}

id objc_msgSend_updateAutoAssetStatus_forActiveJobUUID_withLatestJobStatus_matchingAssetVersion_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateAutoAssetStatus:forActiveJobUUID:withLatestJobStatus:matchingAssetVersion:fromLocation:");
}

id objc_msgSend_updateAutoAssetStatusForChosenDownloadedDescriptor_matchingAssetVersion_fromLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAutoAssetStatusForChosenDownloadedDescriptor:matchingAssetVersion:fromLocation:");
}

id objc_msgSend_updateCurrentAssetStatus_currentStatus_forAssetSelector_forActiveJobUUID_matchingAssetVersion_downloadingDescriptor_baseForPatchDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateCurrentAssetStatus:currentStatus:forAssetSelector:forActiveJobUUID:matchingAssetVersion:downloadingDesc riptor:baseForPatchDescriptor:");
}

id objc_msgSend_updateSetResults_atomicInstanceDiscovered_availableForUse_downloading_buildingResultSetFound_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateSetResults:atomicInstanceDiscovered:availableForUse:downloading:buildingResultSetFound:");
}
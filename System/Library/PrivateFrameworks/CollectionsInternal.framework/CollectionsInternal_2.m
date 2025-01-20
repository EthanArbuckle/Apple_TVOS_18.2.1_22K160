uint64_t _HashNode.isSubset<A>(_:of:)( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result;
  BOOL v18;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int8x8_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  BOOL v32;
  unsigned __int8 v33;
  result = 1LL;
  if (a5 >= 1 && a4 != a2)
  {
    if (a3 < a5) {
      return 0LL;
    }
    v18 = _HashNode.isCollisionNode.getter(a4, a5, a6, a7, a9);
    v29 = a8;
    v19 = _HashNode.isCollisionNode.getter(a2, a3, a6, a8, a9);
    if (v18)
    {
      v20 = _HashNode.collisionHash.getter(a4, a5, a6, a7, a9);
      if (!v19)
      {
        v25 = nullsub_1(a2 + 16, a2 + 32, a6, v29, a9);
        sub_188DDA990(v25, v26, (v20 >> a1) & 0x1F, a4, a5, a1, a6, a7, &v31, v27, v29, a9);
        return v31;
      }

      if (v20 == _HashNode.collisionHash.getter(a2, a3, a6, v29, a9))
      {
        nullsub_1(a4 + 16, a4 + 32, a6, a7, a9);
        nullsub_1(a2 + 16, a2 + 32, a6, v29, a9);
        sub_188DDA5B4((char *)&v30);
        return v30;
      }

      return 0LL;
    }

    v21 = a4 + 16;
    v22 = a4 + 32;
    if (v19)
    {
      v23 = nullsub_1(v21, v22, a6, a7, a9);
      sub_188DDAA8C(v23, v24, a1, a2, a6, a7, v29, &v32, a9);
      return v32;
    }

    else
    {
      nullsub_1(v21, v22, a6, a7, a9);
      sub_188DDACB4(v28, a2, a6, v29, (char *)&v33, a9);
      return v33;
    }
  }

  return result;
}

uint64_t sub_188DDA5B4@<X0>(char *a1@<X8>)
{
  uint64_t v1 = _HashNode.UnsafeHandle.reverseItems.getter();
  uint64_t v3 = v2;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t result = MEMORY[0x1895D6C60](v1, v3, TupleTypeMetadata2);
  if (result == v6)
  {
LABEL_6:
    char v9 = 1;
LABEL_8:
    *a1 = v9;
  }

  else
  {
    uint64_t v7 = result;
    uint64_t v8 = v6;
    if (v6 >= result)
    {
      while (v7 < v8)
      {
        uint64_t result = sub_188DDA728();
        if ((result & 1) == 0)
        {
          char v9 = 0;
          goto LABEL_8;
        }

        if (v8 == ++v7) {
          goto LABEL_6;
        }
      }

      __break(1u);
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_188DDA728()
{
  uint64_t v0 = sub_188DF83F0();
  MEMORY[0x1895D7620](MEMORY[0x189618B38], v0);
  return sub_188DF806C() & 1;
}

uint64_t sub_188DDA7D0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v35 = a1;
  uint64_t v36 = a8;
  uint64_t v12 = *(void *)(a5 - 8);
  MEMORY[0x1895F8858](a1);
  v34 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v33 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v15 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = MEMORY[0x1895F8858](v15);
  v20 = (char *)&v31 - v19;
  uint64_t v21 = *(int *)(v18 + 48);
  v22 = (char *)&v31 + v21 - v19;
  uint64_t v24 = a2 + *(void *)(v23 + 72) * a4 + v21;
  v25 = *(void (**)(char *))(v12 + 16);
  v25((char *)&v31 - v19);
  uint64_t v26 = a6;
  uint64_t v32 = a6;
  uint64_t v27 = *(void *)(a6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v22, v24, v26);
  v28 = &v17[*(int *)(TupleTypeMetadata2 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v20, a5);
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v28, v22, v32);
  v29 = v34;
  ((void (*)(char *, char *, uint64_t))v25)(v34, v17, a5);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v17, TupleTypeMetadata2);
  LOBYTE(v17) = sub_188DF7D90();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v29, a5);
  return v17 & 1;
}

uint64_t sub_188DDA990@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _BYTE *a9@<X8>, int8x8_t a10@<D0>, uint64_t a11, uint64_t a12)
{
  int v13 = *(_DWORD *)(result + 4);
  if ((v13 & (1 << a3)) != 0)
  {
    a10.i32[0] = v13 & ((1 << a3) - 1);
    uint8x8_t v15 = (uint8x8_t)vcnt_s8(a10);
    v15.i16[0] = vaddlv_u8(v15);
    uint64_t v16 = (a6 + 5);
    v20 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v15.u32[0], result, a2, a7, a11, a12);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    swift_retain();
    LOBYTE(a8) = _HashNode.isSubset<A>(_:of:)(v16, v21, v22, a4, a5, a7, a8, a11, a12);
    uint64_t result = swift_release();
    char v23 = a8 & 1;
  }

  else
  {
    char v23 = 0;
  }

  *a9 = v23;
  return result;
}

uint64_t sub_188DDAA8C@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, BOOL *a8@<X8>, uint64_t a9)
{
  if (a3 || (v15 = result, uint64_t result = _HashNode.UnsafeHandle.hasSingletonItem.getter((int *)result), (result & 1) == 0))
  {
    *a8 = 0;
  }

  else
  {
    uint64_t v16 = nullsub_1(a4 + 16, a4 + 32, a5, a7, a9);
    return sub_188DDAB58(v16, v17, v15, a2, 0, a5, a6, a7, a8, a9);
  }

  return result;
}

uint64_t sub_188DDAB58@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unsigned int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, BOOL *a9@<X8>, uint64_t a10)
{
  uint64_t v30 = a2;
  uint64_t v31 = a8;
  unsigned int v29 = a5;
  uint64_t v28 = a1;
  uint64_t v32 = a9;
  uint64_t v14 = *(void *)(a6 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(0LL, v17, v18, v19, v20, a10);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v22(v16, v21, a6);
  uint64_t v23 = sub_188DF5A9C();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v14 + 8);
  v24(v16, a6);
  uint64_t v25 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(0LL, a3, a4, a6, a7, a10);
  v22(v16, v25, a6);
  LOBYTE(a7) = _HashNode.UnsafeHandle.find(_:_:_:)(v29, (uint64_t)v16, v23, v28, v30, a6, v31, a10);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v24)(v16, a6);
  *uint64_t v32 = a7 != 2LL;
  return result;
}

uint64_t sub_188DDACB4@<X0>( uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X5>, uint64_t a4@<X7>, char *a5@<X8>, uint64_t a6)
{
  char v9 = (_DWORD *)nullsub_1(a2 + 16, a2 + 32, a3, a4, a6);
  return sub_188DDAD58(v9, a1, a3, a5, a6);
}

uint64_t sub_188DDAD58@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X5>, char *a4@<X8>, uint64_t a5)
{
  v66 = a4;
  uint64_t v73 = a2;
  uint64_t v6 = a1;
  uint64_t v7 = MEMORY[0x1895F8858](a1);
  uint64_t result = MEMORY[0x1895F8858](v7);
  unsigned int v18 = v10[1];
  int v19 = *(_DWORD *)(result + 4);
  if ((v18 & ~v19) == 0)
  {
    unsigned int v20 = *v10;
    if ((*v10 & ~(*v6 | v19)) == 0)
    {
      uint64_t v69 = v9;
      uint64_t v70 = v12;
      v67 = v6;
      uint64_t v68 = a5;
      uint64_t v71 = v13;
      v72 = v10;
      if (v20)
      {
        v64 = (char *)&v59 - v14;
        uint64_t v65 = v15;
        v62 = v16;
        uint64_t v22 = 0LL;
        int v60 = v11;
        unsigned int v61 = v11 + 5;
        do
        {
          int v34 = 1 << __clz(__rbit32(v20));
          if ((v34 & *v6) != 0)
          {
            v17.i32[0] = (v34 - 1) & *v6;
            uint8x8_t v35 = (uint8x8_t)vcnt_s8(v17);
            v35.i16[0] = vaddlv_u8(v35);
            uint64_t v36 = v35.u32[0];
            uint64_t v37 = v68;
            uint64_t v38 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v22, v72, v73, a3, v70, v68);
            v39 = v6;
            v41 = v64;
            uint64_t v40 = v65;
            v42 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 16);
            v42(v64, v38, a3);
            uint64_t v43 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v36, v39, v69, a3, v71, v37);
            v44 = v62;
            v42(v62, v43, a3);
            LOBYTE(v36) = sub_188DF7D90();
            v45 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
            v45((uint64_t)v44, a3);
            uint64_t result = ((uint64_t (*)(char *, uint64_t))v45)(v41, a3);
            if ((v36 & 1) == 0) {
              goto LABEL_3;
            }
          }

          else
          {
            uint64_t v23 = v68;
            uint64_t v24 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v22, v72, v73, a3, v70, v68);
            uint64_t v26 = (uint64_t)v64;
            uint64_t v25 = v65;
            uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 16);
            v27(v64, v24, a3);
            uint64_t v63 = sub_188DF5A9C();
            uint64_t v28 = *(__n128 (**)(uint64_t, uint64_t))(v25 + 8);
            __n128 v29 = v28(v26, a3);
            v29.n128_u32[0] = v6[1] & (v34 - 1);
            v29.n128_u64[0] = (unint64_t)vcnt_s8((int8x8_t)v29.n128_u64[0]);
            v29.n128_u16[0] = vaddlv_u8((uint8x8_t)v29.n128_u64[0]);
            uint64_t v30 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v29.n128_u32[0], v6, v69, a3, v71, v23);
            uint64_t v32 = *v30;
            uint64_t v31 = v30[1];
            uint64_t v33 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v22, v72, v73, a3, v70, v23);
            v27((char *)v26, v33, a3);
            swift_retain();
            LOBYTE(v31) = _HashNode.containsKey(_:_:_:)(v61, v26, v63, v32, v31, a3, v71, v23);
            swift_release();
            uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v28)(v26, a3);
            if ((v31 & 1) == 0) {
              goto LABEL_3;
            }
          }

          uint64_t v22 = (v22 + 1);
          v20 &= v20 - 1;
          uint64_t v6 = v67;
        }

        while (v20);
        unsigned int v18 = v72[1];
        int v11 = v60;
      }

      if (!v18)
      {
        char v21 = 1;
        goto LABEL_4;
      }

      uint64_t v46 = 0LL;
      LODWORD(v65) = v11 + 5;
      uint64_t v48 = v70;
      uint64_t v47 = v71;
      uint64_t v49 = v68;
      while (1)
      {
        v17.i32[0] = v6[1] & ~(-1 << __clz(__rbit32(v18)));
        uint8x8_t v50 = (uint8x8_t)vcnt_s8(v17);
        v50.i16[0] = vaddlv_u8(v50);
        uint64_t v51 = v50.u32[0];
        v52 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v46, v72, v73, a3, v48, v49);
        v53 = v6;
        uint64_t v54 = *v52;
        uint64_t v55 = v52[1];
        v56 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v51, v53, v69, a3, v47, v49);
        uint64_t v58 = *v56;
        uint64_t v57 = v56[1];
        swift_retain();
        swift_retain();
        LOBYTE(v55) = _HashNode.isSubset<A>(_:of:)(v65, v58, v57, v54, v55, a3, v48, v47, v49);
        swift_release();
        uint64_t result = swift_release();
        if ((v55 & 1) == 0) {
          break;
        }
        uint64_t v46 = (v46 + 1);
        char v21 = 1;
        v18 &= v18 - 1;
        uint64_t v6 = v67;
        if (!v18) {
          goto LABEL_4;
        }
      }
    }
  }

uint64_t sub_188DDB148(uint64_t a1)
{
  return sub_188DDA7D0(a1, v1[6], v1[7], v1[8], v1[2], v1[3], v1[4], v1[5]) & 1;
}

_BYTE *BitSet.formSymmetricDifference(_:)(int8x16_t *a1)
{
  unint64_t v4 = a1[1].u64[0];
  if (v4 << 6 >= 0xFFFFFFFFFFFFFFC0LL)
  {
    __break(1u);
LABEL_24:
    uint64_t v1 = sub_188CF73DC((uint64_t)v1);
LABEL_6:
    unint64_t v8 = *((void *)v1 + 2);
    if (v4 < v8) {
      unint64_t v8 = v4;
    }
    if (!v8) {
      goto LABEL_22;
    }
    if (v8 >= 6
      && ((uint64_t v9 = 8 * v8 + 32, v1 + 32 < &v3->i8[v9]) ? (v10 = &v3[2] >= (int8x16_t *)&v1[v9]) : (v10 = 1), v10))
    {
      uint64_t v11 = v8 & 0x7FFFFFFFFFFFFFFCLL;
      uint64_t v12 = v3 + 3;
      uint64_t v13 = (int8x16_t *)(v1 + 48);
      uint64_t v14 = v8 & 0x7FFFFFFFFFFFFFFCLL;
      do
      {
        int8x16_t v15 = veorq_s8(*v13, *v12);
        v13[-1] = veorq_s8(v13[-1], v12[-1]);
        *uint64_t v13 = v15;
        v12 += 2;
        v13 += 2;
        v14 -= 4LL;
      }

      while (v14);
      if (v8 == v11) {
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    unint64_t v16 = v8 - v11;
    uint64_t v17 = 8 * v11 + 32;
    unsigned int v18 = &v1[v17];
    int v19 = (uint64_t *)((char *)v3->i64 + v17);
    do
    {
      uint64_t v20 = *v19++;
      *(void *)v18 ^= v20;
      v18 += 8;
      --v16;
    }

    while (v16);
LABEL_22:
    *uint64_t v2 = (uint64_t)v1;
    return sub_188D8FB84(&v21, v2);
  }

  uint64_t v3 = a1;
  unint64_t v5 = ((v4 << 6) + 63) >> 6;
  uint64_t v1 = (char *)*v2;
  unint64_t v6 = *(void *)(*v2 + 16);
  uint64_t result = (_BYTE *)(v5 - v6);
  if (v5 <= v6)
  {
LABEL_5:
    char v21 = 1;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }

  if ((uint64_t)(v5 - v6) >= 0)
  {
    sub_188D2EF64((uint64_t)result, 0LL);
    uint64_t v1 = (char *)*v2;
    goto LABEL_5;
  }

  __break(1u);
  return result;
}

uint64_t BitSet.formSymmetricDifference(_:)(uint64_t result, unint64_t a2)
{
  if (((a2 | result) & 0x8000000000000000LL) != 0)
  {
    __break(1u);
LABEL_10:
    unint64_t v6 = sub_188CF73DC((uint64_t)v6);
    goto LABEL_7;
  }

  unint64_t v4 = a2;
  unint64_t v5 = result;
  if (result == a2) {
    return result;
  }
  uint64_t v2 = v3;
  unint64_t v7 = (a2 + 63) >> 6;
  unint64_t v6 = (char *)*v3;
  unint64_t v8 = *(void *)(*v3 + 16);
  uint64_t result = v7 - v8;
  if (v7 > v8)
  {
    if ((uint64_t)(v7 - v8) < 0)
    {
      __break(1u);
      return result;
    }

    sub_188D2EF64(result, 0LL);
    unint64_t v6 = (char *)*v3;
  }

  char v9 = 1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  _UnsafeBitSet.formSymmetricDifference(_:)(v5, v4);
  *uint64_t v2 = (uint64_t)v6;
  return (uint64_t)sub_188D8FB84(&v9, v2);
}

uint64_t BitSet.formSymmetricDifference<A>(_:)(uint64_t a1, ValueMetadata *a2)
{
  Description = (void (**)(char *, void, ValueMetadata *))a2[-1].Description;
  MEMORY[0x1895F8858](a1);
  unint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C749F60);
  Description[2](v6, a1, a2);
  if ((ValueMetadata *)v7 == a2)
  {
    swift_dynamicCast();
    BitSet.formSymmetricDifference(_:)(v10[0], v10[1]);
  }

  else
  {
    unint64_t v8 = (int8x16_t *)BitSet.init<A>(_:)((uint64_t)v6, a2);
    BitSet.formSymmetricDifference(_:)(v8);
    swift_bridgeObjectRelease();
  }

  return ((uint64_t (*)(uint64_t, ValueMetadata *))Description[1])(a1, a2);
}

uint64_t OrderedSet.isEqualSet<A>(to:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v51 = a2;
  uint64_t v45 = *(void *)(a4 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v48 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_188DF8384();
  MEMORY[0x1895F8858](v14);
  unint64_t v16 = (char *)&v44 - v15;
  uint64_t v46 = a7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v18 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v49 = (char *)&v44 - v19;
  uint64_t v20 = *(void *)(a5 - 8);
  uint64_t v21 = MEMORY[0x1895F8858](v18);
  uint64_t v23 = (char *)&v44 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v21);
  uint64_t v25 = (char *)&v44 - v24;
  if (type metadata accessor for OrderedSet(0LL, a4, a6, v26) == a5)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v25, a1, a5);
    swift_dynamicCast();
    char v30 = OrderedSet.isEqualSet(to:)(v52[0], v52[1], v51, a3, a4, a6);
    swift_release();
    swift_release();
    return v30 & 1;
  }

  uint64_t v44 = v17;
  uint64_t v47 = a3;
  v52[0] = a3;
  uint64_t v27 = sub_188DF8738();
  MEMORY[0x1895D7620](MEMORY[0x189619590], v27);
  uint64_t v28 = sub_188DF827C();
  if ((v28 & 1) != 0)
  {
    MEMORY[0x1895F8858](v28);
    *(&v44 - 4) = a4;
    *(&v44 - 3) = a5;
    uint64_t v29 = v46;
    *(&v44 - 2) = a6;
    *(&v44 - 1) = v29;
    char v30 = sub_188DF8018();
    return v30 & 1;
  }

  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v31(v23, a1, a5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C74A0C8);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
    uint64_t v32 = sub_188DF7FF4();
    if (_s19CollectionsInternal4HeapV5countSivg_0() >= v32)
    {
      v31(v25, a1, a5);
      sub_188DF7FDC();
      swift_getAssociatedConformanceWitness();
      sub_188DF84D4();
      uint64_t v33 = v45;
      int v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48);
      if (v34(v16, 1LL, a4) == 1)
      {
        uint64_t v35 = 0LL;
LABEL_15:
        (*(void (**)(char *, uint64_t))(v44 + 8))(v49, AssociatedTypeWitness);
        uint64_t result = _s19CollectionsInternal4HeapV5countSivg_0();
        if (result >= v35)
        {
          char v30 = v35 == _s19CollectionsInternal4HeapV5countSivg_0();
          return v30 & 1;
        }

        goto LABEL_21;
      }

      uint64_t v35 = 0LL;
      v41 = *(void (**)(char *, char *, uint64_t))(v33 + 32);
      v42 = v48;
      while (1)
      {
        v41(v42, v16, a4);
        BOOL v43 = OrderedSet.contains(_:)();
        (*(void (**)(char *, uint64_t))(v33 + 8))(v42, a4);
        if (!v43) {
          break;
        }
        ++v35;
        sub_188DF84D4();
        if (v34(v16, 1LL, a4) == 1) {
          goto LABEL_15;
        }
      }

      (*(void (**)(char *, uint64_t))(v44 + 8))(v49, AssociatedTypeWitness);
    }

    char v30 = 0;
    return v30 & 1;
  }

  uint64_t v36 = v47;
  uint64_t v37 = _s19CollectionsInternal4HeapV5countSivg_0();
  uint64_t result = MEMORY[0x1895F8858](v37);
  *(&v44 - 8) = a4;
  *(&v44 - 7) = a5;
  uint64_t v39 = v46;
  *(&v44 - 6) = a6;
  *(&v44 - 5) = v39;
  uint64_t v40 = v51;
  *(&v44 - 4) = a1;
  *(&v44 - 3) = v40;
  *(&v44 - 2) = v36;
  if (result < 0)
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  LOBYTE(v52[0]) = 2;
  uint64_t result = (uint64_t)sub_188DC2460( (unint64_t)(result + 63) >> 6,  v52,  (void *(*)(char *__return_ptr, _BYTE **))sub_188DDBD34);
  if (LOBYTE(v52[0]) != 2)
  {
    char v30 = v52[0] & 1;
    return v30 & 1;
  }

uint64_t OrderedSet.isEqualSet(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  LOBYTE(a6) = static OrderedSet.UnorderedView.== infix(_:_:)(a3, a4, a1, a2, a5, a6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a6 & 1;
}

{
  swift_retain();
  swift_retain();
  LOBYTE(a6) = static OrderedSet.UnorderedView.== infix(_:_:)(a3, a4, a1, a2, a5, a6);
  swift_release();
  swift_release();
  return a6 & 1;
}

unint64_t sub_188DDBA70@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, BOOL *a8@<X8>)
{
  int v34 = a8;
  uint64_t v38 = a3;
  uint64_t v39 = a7;
  uint64_t v42 = a4;
  uint64_t v41 = a2;
  uint64_t v37 = a1;
  uint64_t v35 = *(void *)(a5 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_188DF8384();
  uint64_t v13 = MEMORY[0x1895F8858](v12);
  uint64_t v15 = (char *)&v33 - v14;
  uint64_t v16 = *(void *)(a6 - 8);
  MEMORY[0x1895F8858](v13);
  uint64_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v21 = (char *)&v33 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v41, a6);
  sub_188DF7FDC();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v40 = v21;
  uint64_t v41 = AssociatedTypeWitness;
  uint64_t v36 = AssociatedConformanceWitness;
  sub_188DF84D4();
  uint64_t v23 = v35;
  uint64_t v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
  uint64_t v25 = 0LL;
  if (v24(v15, 1LL, a5) == 1)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v33 + 8))(v40, v41);
    unint64_t result = _s19CollectionsInternal4HeapV5countSivg_0();
    BOOL v32 = v25 == result;
LABEL_8:
    BOOL *v34 = v32;
  }

  else
  {
    uint64_t v25 = 0LL;
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
    while (1)
    {
      v26(v11, v15, a5);
      unint64_t result = OrderedSet._find(_:)();
      if ((v28 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t))(v23 + 8))(v11, a5);
        unint64_t result = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v40, v41);
        BOOL v32 = 0;
        goto LABEL_8;
      }

      char v29 = result;
      if ((result & 0x8000000000000000LL) != 0) {
        break;
      }
      uint64_t v30 = (result >> 3) & 0x1FFFFFFFFFFFFFF8LL;
      uint64_t v31 = *(void *)(*v37 + v30);
      *(void *)(*v37 + v30) = v31 | (1LL << result);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v11, a5);
      v25 += ((unint64_t)~v31 >> v29) & 1;
      sub_188DF84D4();
      if (v24(v15, 1LL, a5) == 1) {
        goto LABEL_6;
      }
    }

    __break(1u);
  }

  return result;
}

unint64_t sub_188DDBD34@<X0>(void *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_188DDBA70(a1, v2[6], v2[7], v2[8], v2[2], v2[3], v2[4], a2);
}

uint64_t Deque<A>.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v21[1] = a4;
  uint64_t v7 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858](a1);
  char v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_188DF8384();
  MEMORY[0x1895F8858](v10);
  uint64_t v12 = (char *)v21 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v13 = v7;
  sub_188DF8AF8();
  v21[2] = Deque.makeIterator()(a2, a3);
  v21[3] = v14;
  v21[4] = v15;
  uint64_t v17 = type metadata accessor for Deque.Iterator(0LL, a3, v15, v16);
  Deque.Iterator.next()(v17, (uint64_t)v12);
  uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v18(v12, 1LL, a3) != 1)
  {
    v21[0] = *(void *)(v13 + 32);
    do
    {
      ((void (*)(char *, char *, uint64_t))v21[0])(v9, v12, a3);
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
      uint64_t v19 = v24;
      sub_188DF8930();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v9, a3);
      if (v19) {
        break;
      }
      uint64_t v24 = 0LL;
      Deque.Iterator.next()(v17, (uint64_t)v12);
    }

    while (v18(v12, 1LL, a3) != 1);
  }

  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
}

uint64_t sub_188DDBF4C(void *a1, uint64_t a2, uint64_t a3)
{
  return Deque<A>.encode(to:)(a1, *v3, *(void *)(a2 + 16), *(void *)(a3 - 8));
}

void *Deque<A>.init(from:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a3;
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v8 = (char *)&v21[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = Deque.init()(v9);
  uint64_t v10 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_188DF8AD4();
  if (v3)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }

  else
  {
    __swift_project_boxed_opaque_existential_1(v21, v22);
    uint64_t v11 = sub_188DF88F4();
    if ((v14 & 1) == 0)
    {
      Swift::Int v15 = v11;
      type metadata accessor for Deque(0LL, a2, v12, v13);
      Deque.reserveCapacity(_:)(v15);
    }

    while (1)
    {
      __swift_project_boxed_opaque_existential_1(v21, v22);
      if ((sub_188DF8918() & 1) != 0) {
        break;
      }
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
      sub_188DF8900();
      uint64_t v18 = type metadata accessor for Deque(0LL, a2, v16, v17);
      Deque.append(_:)((uint64_t)v8, v18);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a2);
    }

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    uint64_t v10 = (void *)v23;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }

  return v10;
}

void *sub_188DDC148@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  unint64_t result = Deque<A>.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a3 - 8));
  if (!v4) {
    *a4 = result;
  }
  return result;
}

void sub_188DDC178()
{
  uint64_t v1 = *(void *)(v0 + 64);
  if (!v1) {
    return;
  }
  uint64_t v2 = (void *)v0;
  uint64_t v3 = *(void *)(v0 + 48);
  unint64_t v4 = *(void *)(v0 + 56);
  __int128 v5 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)Swift::Int v15 = *(_OWORD *)v0;
  *(_OWORD *)&v15[16] = v5;
  *(_OWORD *)&v15[32] = *(_OWORD *)(v0 + 32);
  if (v3 != *(void *)&v15[40])
  {
    __break(1u);
    goto LABEL_11;
  }

  __int128 v13 = *(_OWORD *)&v15[8];
  __int128 v14 = *(_OWORD *)&v15[24];
  uint64_t v6 = *(void *)v15;
  swift_unknownObjectRetain();
  sub_188D07F48((uint64_t)v15);
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_188D36DF0();
  sub_188D087F8((uint64_t)v15);
  if (v4 >= v7)
  {
LABEL_11:
    __break(1u);
    return;
  }

  unint64_t v8 = v2[7];
  char v9 = (4 * *(_BYTE *)(v1 + 18) + 8) & 0x3C;
  unint64_t v10 = ((v8 >> v9) & 0xF) + 1;
  if (v10 < *(unsigned __int16 *)(v1 + 16))
  {
    v2[7] = (v10 << v9) | ((-15LL << v9) - 1) & v8;
LABEL_8:
    sub_188D087F8((uint64_t)v15);
    return;
  }

  uint64_t v16 = v6;
  __int128 v17 = v13;
  __int128 v18 = v14;
  swift_unknownObjectRetain();
  char v11 = sub_188D7F780((uint64_t)(v2 + 6));
  sub_188D087F8((uint64_t)v15);
  if ((v11 & 1) != 0) {
    goto LABEL_8;
  }
  unint64_t v12 = sub_188D36DF0();
  sub_188D087F8((uint64_t)v15);
  v2[6] = v3;
  v2[7] = v12;
  v2[8] = 0LL;
}

void sub_188DDC2F8(void *a1@<X8>)
{
  *a1 = v2;
  a1[1] = v3;
}

uint64_t _s13ChunkIteratorVwcp(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_unknownObjectRetain();
  return a1;
}

void *_s13ChunkIteratorVwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  return a1;
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

uint64_t _s13ChunkIteratorVwta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

uint64_t _s13ChunkIteratorVwet(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 72)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s13ChunkIteratorVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 72) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 72) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }

  return result;
}

ValueMetadata *_s13ChunkIteratorVMa()
{
  return &_s13ChunkIteratorVN;
}

uint64_t sub_188DDC53C()
{
  return 11050466LL;
}

uint64_t sub_188DDC6B0()
{
  return sub_188DDC53C();
}

uint64_t sub_188DDC6BC()
{
  return 15LL;
}

uint64_t sub_188DDC6C4()
{
  return 4LL;
}

double sub_188DDC6CC@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

BOOL sub_188DDC6D8()
{
  return *(void *)(v0 + 24) == 0LL;
}

void *sub_188DDC6E8(void *result)
{
  if (__OFADD__(*v1, *result))
  {
    __break(1u);
    goto LABEL_7;
  }

  uint64_t v3 = result[2];
  uint64_t v2 = result[3];
  uint64_t v4 = result[1];
  *v1 += *result;
  uint64_t v5 = v1[1];
  BOOL v6 = __OFADD__(v5, v4);
  uint64_t v7 = v5 + v4;
  if (v6)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  v1[1] = v7;
  uint64_t v8 = v1[2];
  BOOL v6 = __OFADD__(v8, v3);
  uint64_t v9 = v8 + v3;
  if (v6)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  v1[2] = v9;
  uint64_t v10 = v1[3];
  BOOL v6 = __OFADD__(v10, v2);
  uint64_t v11 = v10 + v2;
  if (!v6)
  {
    v1[3] = v11;
    return result;
  }

void *sub_188DDC748(void *result)
{
  if (__OFSUB__(*v1, *result))
  {
    __break(1u);
    goto LABEL_7;
  }

  uint64_t v3 = result[2];
  uint64_t v2 = result[3];
  uint64_t v4 = result[1];
  *v1 -= *result;
  uint64_t v5 = v1[1];
  BOOL v6 = __OFSUB__(v5, v4);
  uint64_t v7 = v5 - v4;
  if (v6)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  v1[1] = v7;
  uint64_t v8 = v1[2];
  BOOL v6 = __OFSUB__(v8, v3);
  uint64_t v9 = v8 - v3;
  if (v6)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  v1[2] = v9;
  uint64_t v10 = v1[3];
  BOOL v6 = __OFSUB__(v10, v2);
  uint64_t v11 = v10 - v2;
  if (!v6)
  {
    v1[3] = v11;
    return result;
  }

BOOL sub_188DDC7A8(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

unint64_t sub_188DDC7E4(uint64_t a1)
{
  unint64_t result = sub_188DDC808();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_188DDC808()
{
  unint64_t result = qword_18C74B780[0];
  if (!qword_18C74B780[0])
  {
    unint64_t result = MEMORY[0x1895D7620](&unk_188DFFB28, &_s7SummaryVN);
    atomic_store(result, qword_18C74B780);
  }

  return result;
}

ValueMetadata *_s7SummaryVMa()
{
  return &_s7SummaryVN;
}

uint64_t OrderedSet.formIntersection(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_188D812BC(a1, a2, *v3, v3[1], *(void *)(a3 + 16), *(void *)(a3 + 24));
  uint64_t v6 = v5;
  swift_release();
  uint64_t result = swift_release();
  *uint64_t v3 = v4;
  v3[1] = v6;
  return result;
}

uint64_t OrderedSet.formIntersection<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_188D81428(a1, *v3, v3[1], *(void *)(a2 + 16), a3, *(void *)(a2 + 24));
  uint64_t v6 = v5;
  swift_release();
  uint64_t result = swift_release();
  *uint64_t v3 = v4;
  v3[1] = v6;
  return result;
}

uint64_t sub_188DDC91C(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4 = a2;
  uint64_t v5 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000LL) == 0) {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v6 = a1;
  unint64_t v7 = HIDWORD(a3);
  uint64_t result = *(void *)(v3 + 48);
  uint64_t v9 = *(void *)(v3 + 56);
  uint64_t v10 = *(unsigned __int16 *)(v3 + 68);
  uint64_t v11 = *(unsigned int *)(v3 + 64);
  *(void *)(v3 + 48) = 0LL;
  *(void *)(v3 + 56) = 0LL;
  *(void *)(v3 + 62) = 0LL;
  if (!v9)
  {
    *(void *)(v3 + 48) = v6;
    *(void *)(v3 + 56) = v4;
    *(_DWORD *)(v3 + 64) = a3;
    *(_WORD *)(v3 + 68) = WORD2(a3);
    return result;
  }

  uint64_t v25 = result;
  uint64_t v26 = v9;
  unint64_t v12 = v11 | (v10 << 32);
  LOWORD(v27) = v12;
  BYTE2(v27) = BYTE2(v12);
  HIBYTE(v27) = BYTE3(v12);
  unsigned __int8 v28 = BYTE4(v12);
  unint64_t v13 = v12 >> 40;
  unsigned __int8 v29 = BYTE5(v12);
  unint64_t v14 = a3 >> 40;
  uint64_t v20 = v6;
  unint64_t v21 = v4;
  LOWORD(v22) = a3;
  BYTE2(v22) = BYTE2(a3);
  HIBYTE(v22) = BYTE3(a3);
  char v23 = BYTE4(a3);
  unsigned __int8 v24 = BYTE5(a3);
  if ((v12 & 0xFC) < 0x7C || (a3 & 0xFC) < 0x7C)
  {
    if ((sub_188D32D64((uint64_t)&v20) & 1) != 0)
    {
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v16 = v26;
      unsigned int v17 = v27;
      unint64_t v18 = ((unint64_t)v29 << 40) | ((unint64_t)v28 << 32);
      *(void *)(v3 + 48) = v25;
      *(void *)(v3 + 56) = v16;
      *(_DWORD *)(v3 + 64) = v17;
      *(_WORD *)(v3 + 68) = WORD2(v18);
      return result;
    }

    uint64_t result = v25;
    uint64_t v9 = v26;
    uint64_t v15 = v28;
    unint64_t v13 = v29;
    uint64_t v6 = v20;
    unint64_t v4 = v21;
    LOBYTE(v7) = v23;
    unint64_t v14 = v24;
  }

  else
  {
    uint64_t v15 = BYTE4(v12);
  }

  sub_188DDCACC(result, v9, v27 | (unint64_t)(v15 << 32) | (v13 << 40));
  uint64_t result = swift_bridgeObjectRelease();
  int v19 = v22;
  *(void *)(v3 + 48) = v6;
  *(void *)(v3 + 56) = v4;
  *(_WORD *)(v3 + 68) = ((v14 << 40) | ((unint64_t)v7 << 32)) >> 32;
  *(_DWORD *)(v3 + 64) = v19;
  return result;
}

uint64_t sub_188DDCACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v8 = *(void *)(v4 + 8);
  __int128 v9 = *(_OWORD *)(v4 + 16);
  __int128 v10 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(v4 + 8) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  *(void *)(v4 + 40) = 0LL;
  if (v8)
  {
    unint64_t v17 = v8;
    __int128 v18 = v9;
    __int128 v19 = v10;
  }

  else
  {
    sub_188DF0858((uint64_t)&v17);
  }

  uint64_t result = sub_188DEFFD8(a1, a2, a3 & 0xFFFFFFFFFFFFLL);
  __int128 v15 = v18;
  __int128 v16 = v19;
  if (*(_WORD *)(v17 + 16) == 15)
  {
    unint64_t v20 = v17;
    __int128 v21 = v18;
    __int128 v22 = v19;
    return sub_188DDCB8C(&v20, v12, v13, v14);
  }

  else
  {
    *(void *)(v4 + 8) = v17;
    *(_OWORD *)(v4 + 16) = v15;
    *(_OWORD *)(v4 + 32) = v16;
  }

  return result;
}

uint64_t sub_188DDCB8C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  unint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  int64_t v10 = a1[2];
  uint64_t v9 = a1[3];
  uint64_t v11 = a1[4];
  __int128 v12 = *((_OWORD *)a1 + 1);
  __int128 v99 = *(_OWORD *)a1;
  __int128 v100 = v12;
  v101 = (uint64_t *)a1[4];
  uint64_t v13 = *v4;
  if (!v13[2])
  {
LABEL_65:
    uint64_t v73 = v11;
    uint64_t v74 = v9;
    v92[0] = 0LL;
    unint64_t v75 = v7;
    swift_unknownObjectRetain();
    MEMORY[0x1895D76E0](v92, 8LL);
    uint64_t v76 = v92[0];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0) {
      v77 = v13;
    }
    else {
      v77 = sub_188CF73F0(0LL, v13[2] + 1, 1, v13);
    }
    unint64_t v79 = v77[2];
    unint64_t v78 = v77[3];
    if (v79 >= v78 >> 1) {
      v77 = sub_188CF73F0((void *)(v78 > 1), v79 + 1, 1, v77);
    }
    v77[2] = v79 + 1;
    v80 = &v77[6 * v79];
    v80[4] = v75;
    v80[5] = v8;
    v80[6] = v10;
    v80[7] = v74;
    v80[8] = v73;
    v80[9] = v76;
    uint64_t v71 = v77;
LABEL_70:
    uint64_t result = swift_unknownObjectRelease();
    *v88 = v71;
    return result;
  }

  while (2)
  {
    v121[0] = v7;
    v121[1] = v8;
    v121[2] = v10;
    v121[3] = v9;
    v121[4] = v11;
    unint64_t v14 = v13[2];
    if (!v14)
    {
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      a4 = sub_188CF73F0((void *)(v14 > 1), (int64_t)v13, 1, a4);
LABEL_62:
      a4[2] = (uint64_t)v13;
      uint64_t v68 = &a4[6 * v7];
      __int128 v69 = v102;
      __int128 v70 = v104;
      *((_OWORD *)v68 + 3) = v103;
      *((_OWORD *)v68 + 4) = v70;
      *((_OWORD *)v68 + 2) = v69;
      uint64_t v71 = a4;
      sub_188D087F8((uint64_t)&v102);
      goto LABEL_70;
    }

    uint64_t v86 = v11;
    uint64_t v87 = v9;
    v91 = (uint64_t *)v7;
    unint64_t v7 = (unint64_t)v13;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0) {
      uint64_t result = (uint64_t)v13;
    }
    else {
      uint64_t result = (uint64_t)sub_188CF73C8(v13);
    }
    unint64_t v14 = *(void *)(result + 16);
    uint64_t v16 = (uint64_t)v91;
    if (!v14) {
      goto LABEL_72;
    }
    uint64_t v84 = v10;
    uint64_t v85 = v8;
    unint64_t v17 = v14 - 1;
    uint64_t v18 = result + 32;
    __int128 v19 = (int64_t *)(result + 32 + 48 * v17);
    int64_t v21 = *v19;
    uint64_t v20 = v19[1];
    int64_t v22 = v19[2];
    uint64_t v23 = v19[3];
    unint64_t v24 = v19[4];
    uint64_t v25 = v19[5];
    *(void *)(result + 16) = v17;
    int64_t v94 = v21;
    uint64_t v95 = v20;
    int64_t v96 = v22;
    uint64_t v97 = v23;
    unint64_t v98 = v24;
    uint64_t v89 = result + 32;
    v90 = (uint64_t *)result;
    while (1)
    {
      unint64_t v26 = v24;
      uint64_t v27 = v23;
      unsigned __int8 v28 = (uint64_t *)v22;
      uint64_t v29 = v20;
      int64_t v10 = v21;
      uint64_t v30 = v25;
      unsigned int v31 = v21 ? *(unsigned __int8 *)(v21 + 18) : 0;
      uint64_t v32 = *(void *)(result + 16);
      if (!v32)
      {
        int64_t v94 = v21;
        uint64_t v95 = v20;
        int64_t v96 = v22;
        uint64_t v97 = v23;
        unint64_t v98 = v24;
        v92[0] = 0LL;
        uint64_t v63 = v16;
        int64_t v64 = v22;
        uint64_t v65 = v20;
        uint64_t v66 = v30;
        swift_unknownObjectRetain();
        MEMORY[0x1895D76E0](v92, 8LL);
        uint64_t v67 = v92[0];
        v92[0] = v63;
        v92[1] = v85;
        v92[2] = v84;
        v92[3] = v87;
        v92[4] = v86;
        v93[0] = v67;
        uint64_t v111 = v21;
        v112 = (uint64_t *)v65;
        v113 = (uint64_t *)v64;
        v114 = (uint64_t *)v23;
        unint64_t v115 = v24;
        uint64_t v116 = v66;
        sub_188DEEA7C((uint64_t)&v111, v92, (uint64_t *)&v102);
        sub_188D011B8((uint64_t)&v102, (uint64_t)&v106);
        sub_188D07F48((uint64_t)&v106);
        a4 = v90;
        unint64_t v7 = v90[2];
        unint64_t v14 = v90[3];
        uint64_t v13 = (uint64_t *)(v7 + 1);
        if (v7 >= v14 >> 1) {
          goto LABEL_83;
        }
        goto LABEL_62;
      }

      uint64_t v33 = v32 - 1;
      int v34 = (uint64_t *)(v18 + 48 * v33);
      uint64_t v6 = *v34;
      uint64_t v35 = v34[1];
      uint64_t v8 = v34[2];
      unint64_t v7 = v34[3];
      int64_t v21 = *v34;
      unint64_t v5 = v34[4];
      uint64_t v25 = v34[5];
      *(void *)(result + 16) = v33;
      uint64_t v20 = v35;
      int64_t v22 = v8;
      uint64_t v23 = v7;
      unint64_t v24 = v5;
      if (v10)
      {
        if (*(_WORD *)(v10 + 16))
        {
          uint64_t v25 = v30;
          int64_t v21 = v10;
          uint64_t v20 = v29;
          int64_t v22 = (int64_t)v28;
          uint64_t v23 = v27;
          unint64_t v24 = v26;
          if (v6)
          {
            if (*(_WORD *)(v6 + 16))
            {
              uint64_t v111 = v6;
              v112 = (uint64_t *)v35;
              v113 = (uint64_t *)v8;
              v114 = (uint64_t *)v7;
              unint64_t v115 = v5;
              *(void *)&__int128 v102 = v10;
              *((void *)&v102 + 1) = v29;
              *(void *)&__int128 v103 = v28;
              *((void *)&v103 + 1) = v27;
              *(void *)&__int128 v104 = v26;
              if (*(unsigned __int8 *)(v6 + 18) >= *(unsigned __int8 *)(v10 + 18))
              {
                uint64_t v13 = &v111;
                sub_188DEEDC0(v93, (uint64_t *)&v102, &v106);
                if (v106)
                {
                  uint64_t v45 = v111;
                  unsigned int v46 = *(unsigned __int8 *)(v111 + 18) + 1;
                  unint64_t v14 = v46 >> 8;
                  if ((v46 & 0x100) != 0) {
                    goto LABEL_74;
                  }
                  uint64_t v83 = v106;
                  uint64_t v13 = v107;
                  unint64_t v47 = v108;
                  uint64_t v48 = v109;
                  uint64_t v49 = v110;
                  uint64_t v8 = (uint64_t)v112;
                  unint64_t v7 = (unint64_t)v113;
                  uint64_t v51 = v114;
                  unint64_t v50 = v115;
                  __swift_instantiateConcreteTypeFromMangledName(&qword_18C74A228);
                  uint64_t v52 = swift_allocObject();
                  v53 = v13;
                  *(_WORD *)(v52 + 16) = 0;
                  *(_BYTE *)(v52 + 18) = v46;
                  uint64_t v54 = (uint64_t *)((char *)v13 + v8);
                  if (__OFADD__(v8, v13)) {
                    goto LABEL_76;
                  }
                  uint64_t v55 = (char *)(v7 + v47);
                  if (__OFADD__(v7, v47)) {
                    goto LABEL_78;
                  }
                  unint64_t v14 = v47;
                  uint64_t v23 = (uint64_t)v51 + v48;
                  if (__OFADD__(v51, v48)) {
                    goto LABEL_80;
                  }
                  unint64_t v24 = v50 + v49;
                  if (__OFADD__(v50, v49)) {
                    goto LABEL_82;
                  }
                  int64_t v21 = v52;
                  *(void *)(v52 + 24) = v45;
                  *(void *)(v52 + 32) = v8;
                  *(void *)(v52 + 40) = v7;
                  *(void *)(v52 + 48) = v51;
                  *(void *)(v52 + 56) = v50;
                  *(void *)(v52 + 64) = v83;
                  *(void *)(v52 + 72) = v53;
                  *(void *)(v52 + 80) = v14;
                  *(void *)(v52 + 88) = v48;
                  *(void *)(v52 + 96) = v49;
                  *(_WORD *)(v52 + 16) = 2;
                  uint64_t v106 = 0LL;
                  unint64_t v7 = (unint64_t)v54;
                  unint64_t v5 = (unint64_t)v55;
                  swift_unknownObjectRetain();
                  MEMORY[0x1895D76E0](&v106, 8LL);
                  uint64_t v25 = v106;
                  uint64_t v6 = v102;
                  swift_unknownObjectRelease();
                }

                else
                {
                  int64_t v21 = v111;
                  unint64_t v7 = (unint64_t)v112;
                  unint64_t v5 = (unint64_t)v113;
                  uint64_t v23 = (uint64_t)v114;
                  unint64_t v24 = v115;
                  uint64_t v106 = 0LL;
                  swift_unknownObjectRetain();
                  MEMORY[0x1895D76E0](&v106, 8LL);
                  uint64_t v25 = v106;
                  swift_unknownObjectRelease();
                }
              }

              else
              {
                uint64_t v13 = (uint64_t *)&v102;
                sub_188DEF120(v93, &v111, &v106);
                if (v106)
                {
                  unsigned int v36 = *(unsigned __int8 *)(v106 + 18) + 1;
                  unint64_t v14 = v36 >> 8;
                  if ((v36 & 0x100) != 0) {
                    goto LABEL_73;
                  }
                  uint64_t v37 = v107;
                  unint64_t v38 = v108;
                  uint64_t v6 = v109;
                  uint64_t v39 = v110;
                  uint64_t v8 = *((void *)&v102 + 1);
                  uint64_t v81 = v102;
                  uint64_t v82 = v106;
                  unint64_t v40 = *((void *)&v103 + 1);
                  unint64_t v7 = v103;
                  uint64_t v41 = v104;
                  __swift_instantiateConcreteTypeFromMangledName(&qword_18C74A228);
                  uint64_t v42 = swift_allocObject();
                  *(_WORD *)(v42 + 16) = 0;
                  *(_BYTE *)(v42 + 18) = v36;
                  if (__OFADD__(v37, v8)) {
                    goto LABEL_75;
                  }
                  BOOL v43 = (char *)(v38 + v7);
                  if (__OFADD__(v38, v7)) {
                    goto LABEL_77;
                  }
                  unint64_t v14 = v40;
                  BOOL v44 = __OFADD__(v6, v40);
                  uint64_t v23 = v6 + v40;
                  if (v44) {
                    goto LABEL_79;
                  }
                  unint64_t v24 = v39 + v41;
                  if (__OFADD__(v39, v41)) {
                    goto LABEL_81;
                  }
                  int64_t v21 = v42;
                  *(void *)(v42 + 24) = v82;
                  *(void *)(v42 + 32) = v37;
                  *(void *)(v42 + 40) = v38;
                  *(void *)(v42 + 48) = v6;
                  *(void *)(v42 + 56) = v39;
                  *(void *)(v42 + 64) = v81;
                  *(void *)(v42 + 72) = v8;
                  *(void *)(v42 + 80) = v7;
                  *(void *)(v42 + 88) = v14;
                  *(void *)(v42 + 96) = v41;
                  *(_WORD *)(v42 + 16) = 2;
                  uint64_t v106 = 0LL;
                  unint64_t v7 = (unint64_t)v37 + v8;
                  unint64_t v5 = (unint64_t)v43;
                }

                else
                {
                  unint64_t v7 = *((void *)&v102 + 1);
                  int64_t v21 = v102;
                  uint64_t v23 = *((void *)&v103 + 1);
                  unint64_t v5 = v103;
                  unint64_t v24 = v104;
                  uint64_t v106 = 0LL;
                }

                MEMORY[0x1895D76E0](&v106, 8LL);
                uint64_t v25 = v106;
              }

              swift_unknownObjectRelease();
              int64_t v22 = v5;
              uint64_t v20 = v7;
              uint64_t result = (uint64_t)v90;
              uint64_t v16 = (uint64_t)v91;
              uint64_t v18 = v89;
            }

            else
            {
              unint64_t v24 = v26;
              uint64_t v23 = v27;
              unint64_t v7 = (unint64_t)v28;
              unint64_t v5 = v29;
              uint64_t v25 = v30;
              swift_unknownObjectRelease();
              uint64_t v18 = v89;
              uint64_t result = (uint64_t)v90;
              uint64_t v16 = (uint64_t)v91;
              int64_t v21 = v10;
              uint64_t v20 = v5;
              int64_t v22 = v7;
            }
          }
        }

        else
        {
          swift_unknownObjectRelease();
          uint64_t v18 = v89;
          uint64_t result = (uint64_t)v90;
          uint64_t v16 = (uint64_t)v91;
          int64_t v21 = v6;
          uint64_t v20 = v35;
          int64_t v22 = v8;
          uint64_t v23 = v7;
          unint64_t v24 = v5;
        }
      }
    }

    int64_t v94 = v21;
    uint64_t v95 = v20;
    int64_t v96 = v22;
    uint64_t v97 = v23;
    unint64_t v98 = v24;
    if (v21)
    {
      int v56 = *(unsigned __int8 *)(v16 + 18);
      if (*(unsigned __int8 *)(v21 + 18) == v56)
      {
        int64_t v21 = (int64_t)&v94;
        BOOL v57 = sub_188DEF4CC((uint64_t *)&v99);
        uint64_t v8 = v95;
        int64_t v10 = v96;
        if (v57)
        {
          unint64_t v7 = v94;
          uint64_t v58 = v97;
          unint64_t v59 = v98;
          swift_unknownObjectRelease();
          uint64_t v11 = v59;
          uint64_t v9 = v58;
LABEL_51:
          *(void *)&__int128 v99 = v7;
          goto LABEL_52;
        }

        v117[0] = v94;
        v117[1] = v95;
        v117[2] = v96;
        v117[3] = v97;
        v117[4] = v98;
        unint64_t v7 = (unint64_t)v101;
        v120 = v101;
        __int128 v118 = v99;
        __int128 v119 = v100;
        unint64_t v5 = v94;
        unsigned int v62 = *(unsigned __int8 *)(v94 + 18) + 1;
        if (((v62 >> 8) & 1) == 0)
        {
          uint64_t v6 = v97;
          uint64_t v23 = v98;
          int64_t v21 = *((void *)&v119 + 1);
          unint64_t v24 = v119;
          uint64_t v25 = *((void *)&v118 + 1);
          sub_188DF08A4(v62, (uint64_t)v105);
          BOOL v44 = __OFADD__(v8, v25);
          v8 += v25;
          if (!v44)
          {
            BOOL v44 = __OFADD__(v10, v24);
            v10 += v24;
            if (!v44)
            {
              BOOL v44 = __OFADD__(v6, v21);
              v6 += v21;
              if (!v44)
              {
                unint64_t v24 = v23 + v7;
                if (!__OFADD__(v23, v7))
                {
                  unint64_t v7 = v105[0];
                  sub_188DF08F4((_WORD *)(v105[0] + 16), v105[0] + 24, (uint64_t)v117, (uint64_t)&v118);
                  swift_unknownObjectRelease();
                  sub_188D087F8((uint64_t)&v118);
                  *(void *)&__int128 v99 = v7;
                  uint64_t v9 = v6;
                  uint64_t v11 = v24;
LABEL_52:
                  *((void *)&v99 + 1) = v8;
                  *(void *)&__int128 v100 = v10;
                  *((void *)&v100 + 1) = v9;
                  v101 = (uint64_t *)v11;
                  uint64_t v13 = v90;
                  if (v90[2]) {
                    continue;
                  }
                  goto LABEL_65;
                }

                goto LABEL_90;
              }

LABEL_89:
              __break(1u);
LABEL_90:
              __break(1u);
              goto LABEL_91;
            }

  __break(1u);
  return result;
}

LABEL_87:
          __break(1u);
          goto LABEL_88;
        }

LABEL_86:
        __break(1u);
        goto LABEL_87;
      }
    }

    else
    {
      int v56 = *(unsigned __int8 *)(v16 + 18);
      if (!*(_BYTE *)(v16 + 18)) {
        goto LABEL_93;
      }
    }

    break;
  }

  if (*(_WORD *)(v16 + 16) != 15 || *(_WORD *)(v21 + 16) == 15) {
    goto LABEL_63;
  }
  if (v21)
  {
    int v60 = *(unsigned __int8 *)(v21 + 18);
    int v56 = *(unsigned __int8 *)(v16 + 18);
  }

  else
  {
    int v60 = 0;
  }

  unsigned int v61 = v56 + 1;
  if (((v61 >> 8) & 1) != 0)
  {
    __break(1u);
    goto LABEL_86;
  }

  if (v60 != v61)
  {
LABEL_63:
    uint64_t v23 = v25;
    uint64_t v6 = v20;
    uint64_t v8 = v22;
    unint64_t v5 = v27;
    uint64_t v25 = v24;
    unint64_t v7 = *(void *)(result + 16);
    unint64_t v24 = *(void *)(result + 24);
    int64_t v21 = v7 + 1;
    swift_unknownObjectRetain();
    if (v7 < v24 >> 1)
    {
LABEL_64:
      v90[2] = v21;
      v72 = &v90[6 * v7];
      v72[4] = v10;
      v72[5] = v6;
      v72[6] = v8;
      v72[7] = v5;
      v72[8] = v25;
      v72[9] = v23;
      swift_unknownObjectRelease();
      uint64_t v13 = v90;
      unint64_t v7 = (unint64_t)v91;
      int64_t v10 = v84;
      uint64_t v8 = v85;
      uint64_t v11 = v86;
      uint64_t v9 = v87;
      goto LABEL_65;
    }

uint64_t String.init(_:)(_OWORD *a1)
{
  __int128 v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  v3[2] = a1[2];
  return _sSS19CollectionsInternalEySSAA9BigStringVcfC_0(v3);
}

uint64_t _sSS19CollectionsInternalEySSAA12BigSubstringVcfC_0(_OWORD *a1)
{
  __int128 v1 = a1[1];
  v8[0] = *a1;
  v8[1] = v1;
  __int128 v2 = a1[3];
  v8[2] = a1[2];
  __int128 v3 = a1[4];
  __int128 v4 = a1[5];
  v7[0] = v2;
  v7[1] = v3;
  __int128 v5 = a1[6];
  v7[2] = v4;
  v7[3] = v5;
  return sub_188DDD874((uint64_t)v8, (uint64_t)v7);
}

uint64_t sub_188DDD440()
{
  unint64_t v0 = sub_188DF7FD0();
  uint64_t v4 = sub_188DDD4BC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_188DDD4BC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000LL) != 0)
  {
    unint64_t v9 = sub_188D82544(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = sub_188DDD600(v9, 0LL);
      unint64_t v12 = sub_188DDD664((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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

    uint64_t v13 = MEMORY[0x1895D66FC](v11 + 4, v11[2]);
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
        JUMPOUT(0x1895D66FCLL);
LABEL_9:
      sub_188DF8684();
      goto LABEL_12;
    }

    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1895D66FC]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }

void *sub_188DDD600(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FB548);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_188DDD664( unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  unint64_t v9 = (void *)result;
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
    *unint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
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
      uint64_t result = sub_188D37044(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000LL) != 0)
    {
      uint64_t result = sub_188DF7F34();
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
          uint64_t result = sub_188DF8684();
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

    uint64_t result = sub_188D37044(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000LL) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000LL) + 65540;
      goto LABEL_29;
    }

uint64_t sub_188DDD874(uint64_t a1, uint64_t a2)
{
  uint64_t v117 = 0LL;
  unint64_t v118 = 0xE000000000000000LL;
  unint64_t v4 = sub_188DCF614(*(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
  unint64_t v8 = sub_188D097FC(v4, v5, v6, v7, 0);
  uint64_t v10 = v9;
  unint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v15 = a1;
  unint64_t v16 = sub_188DCF614(*(void *)(a2 + 32), *(void *)(a2 + 40), *(void *)(a2 + 48), *(void *)(a2 + 56));
  unint64_t v22 = sub_188D097FC(v16, v17, v18, v19, 1);
  unint64_t v112 = v23;
  if ((uint64_t)((v22 >> 11) - (v8 >> 11)) < 1)
  {
    sub_188D087F8(a1);
    return v117;
  }

  uint64_t v24 = v20;
  uint64_t v25 = v21;
  uint64_t result = MEMORY[0x1895D6690]();
  if (v14 == 1) {
    goto LABEL_81;
  }
  if (v25 != 1)
  {
    if (v12 == v112)
    {
      if (v10 != *(void *)(a1 + 40)) {
        goto LABEL_74;
      }
      if (v14)
      {
        uint64_t result = swift_bridgeObjectRetain();
      }

      else
      {
        __int128 v32 = *(_OWORD *)(a1 + 8);
        __int128 v33 = *(_OWORD *)(a1 + 24);
        *(void *)__int128 v119 = *(void *)a1;
        *(_OWORD *)&v119[8] = v32;
        *(_OWORD *)&v119[24] = v33;
        swift_unknownObjectRetain();
        sub_188D36E50(v12, (uint64_t)&v132);
        uint64_t result = sub_188D087F8(a1);
      }

      uint64_t v34 = sub_188DF7FD0();
      uint64_t v36 = v35;
      uint64_t v38 = v37;
      uint64_t v40 = v39;
      swift_bridgeObjectRelease();
      *(void *)&__int128 v132 = v34;
      *((void *)&v132 + 1) = v36;
      *(void *)&__int128 v133 = v38;
      *((void *)&v133 + 1) = v40;
      sub_188D2DC60();
LABEL_71:
      sub_188DF7EC8();
      sub_188D087F8(v15);
      swift_bridgeObjectRelease();
      return v117;
    }

    __int128 v27 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)__int128 v119 = *(_OWORD *)a1;
    *(_OWORD *)&v119[16] = v27;
    *(_OWORD *)&v119[32] = *(_OWORD *)(a1 + 32);
    if (v10 != *(void *)&v119[40]) {
      goto LABEL_75;
    }
    uint64_t v100 = v24;
    uint64_t v99 = v25;
    uint64_t v28 = *(void *)v119;
    uint64_t v108 = *(void *)&v119[16];
    uint64_t v109 = *(void *)&v119[8];
    uint64_t v106 = *(void *)&v119[32];
    uint64_t v107 = *(void *)&v119[24];
    if (v14)
    {
      unint64_t v29 = v14 + 24 * ((v12 >> ((4 * *(_BYTE *)(v14 + 18) + 8) & 0x3C)) & 0xF);
      uint64_t v31 = *(void *)(v29 + 24);
      unint64_t v30 = *(void *)(v29 + 32);
      swift_bridgeObjectRetain();
    }

    else
    {
      __int128 v132 = *(_OWORD *)v119;
      __int128 v133 = *(_OWORD *)&v119[16];
      uint64_t v134 = *(void *)&v119[32];
      swift_unknownObjectRetain();
      sub_188D36E50(v12, (uint64_t)&v127);
      sub_188D087F8(a1);
      uint64_t v31 = v127;
      unint64_t v30 = v128;
    }

    unint64_t v41 = sub_188D0EFD0( (16 * (int)v8) & 0x4000LL | ((unint64_t)v8 << 16) | (v8 >> 8) & 3 | 4,  v31,  v30);
    unint64_t v43 = v42;
    uint64_t v45 = v44;
    uint64_t v47 = v46;
    swift_bridgeObjectRelease();
    uint64_t v127 = v41;
    unint64_t v128 = v43;
    uint64_t v129 = v45;
    uint64_t v130 = v47;
    sub_188D2DC60();
    sub_188DF7EC8();
    swift_bridgeObjectRelease();
    swift_unknownObjectRetain();
    uint64_t v48 = sub_188D36584(v10, v12, v14);
    unint64_t v50 = v49;
    uint64_t v52 = v51;
    uint64_t result = sub_188D087F8(v15);
    uint64_t v114 = v48;
    uint64_t v115 = v50;
    uint64_t v116 = v52;
    uint64_t v53 = v15;
    if (v50 < v112)
    {
      if (v48 == v10)
      {
        uint64_t v111 = *(void *)v119 + 24LL;
        uint64_t v101 = v15;
        uint64_t v105 = v10;
        while (1)
        {
          if (v52)
          {
            swift_bridgeObjectRetain();
          }

          else
          {
            uint64_t v127 = v28;
            unint64_t v128 = v109;
            uint64_t v129 = v108;
            uint64_t v130 = v107;
            uint64_t v131 = v106;
            swift_unknownObjectRetain();
            sub_188D36E50(v50, (uint64_t)v120);
            sub_188D087F8(v53);
          }

          sub_188DF7EE0();
          uint64_t result = swift_bridgeObjectRelease();
          if (!v28
            || (int v54 = *(unsigned __int8 *)(v28 + 18),
                uint64_t v55 = *(unsigned __int16 *)(v28 + 16),
                swift_unknownObjectRetain_n(),
                sub_188D087F8(v53),
                uint64_t result = sub_188D087F8(v53),
                v50 >= (((-15LL << ((4 * v54 + 8) & 0x3C)) - 1) & v54 | (unint64_t)(v55 << ((4 * v54 + 8) & 0x3C)))))
          {
            __break(1u);
LABEL_74:
            __break(1u);
LABEL_75:
            __break(1u);
LABEL_76:
            __break(1u);
LABEL_77:
            __break(1u);
LABEL_78:
            __break(1u);
LABEL_79:
            __break(1u);
LABEL_80:
            __break(1u);
LABEL_81:
            __break(1u);
            goto LABEL_82;
          }

          if (v52)
          {
            char v56 = (4 * *(_BYTE *)(v52 + 18) + 8) & 0x3C;
            unint64_t v57 = ((v50 >> v56) & 0xF) + 1;
          }

          char v58 = (4 * *(_BYTE *)(v28 + 18) + 8) & 0x3C;
          uint64_t v59 = (v50 >> v58) & 0xF;
          if (*(_BYTE *)(v28 + 18))
          {
            uint64_t v60 = *(void *)(v111 + 40 * ((v50 >> v58) & 0xF));
            char v61 = (4 * *(_BYTE *)(v60 + 18) + 8) & 0x3C;
            uint64_t v62 = (v50 >> v61) & 0xF;
            if (*(_BYTE *)(v60 + 18))
            {
              uint64_t v63 = *(void *)(v60 + 24 + 40 * ((v50 >> v61) & 0xF));
              char v64 = (4 * *(_BYTE *)(v63 + 18) + 8) & 0x3C;
              uint64_t v65 = (v50 >> v64) & 0xF;
              if (*(_BYTE *)(v63 + 18))
              {
                uint64_t v104 = v60 + 24;
                uint64_t v110 = *(void *)(v111 + 40 * ((v50 >> v58) & 0xF));
                uint64_t v66 = *(void *)(v63 + 24 + 40 * ((v50 >> v64) & 0xF));
                int v67 = *(unsigned __int8 *)(v66 + 18);
                char v68 = (4 * v67 + 8) & 0x3C;
                v120[0] = (v50 >> v68) & 0xF;
                if (v67)
                {
                  uint64_t v69 = v63 + 24;
                  char v102 = v64;
                  char v103 = v61;
                  sub_188D07F48(v53);
                  swift_unknownObjectRetain();
                  swift_unknownObjectRetain();
                  swift_unknownObjectRetain();
                  char v70 = sub_188D800A4(v66 + 24, v120, (uint64_t)&v114, v66, v67);
                  swift_unknownObjectRelease();
                  if ((v70 & 1) != 0)
                  {
                    unint64_t v50 = v115;
                    uint64_t v53 = v101;
                    goto LABEL_49;
                  }

LABEL_82:
  __break(1u);
  return result;
}

      __break(1u);
      goto LABEL_83;
    }

    if (result <= 0)
    {
LABEL_52:
      v26(v21, a1, a3);
      sub_188DF7FDC();
      int v54 = v67;
      swift_getAssociatedConformanceWitness();
      sub_188DF84D4();
      if ((v71 & 1) == 0)
      {
        uint64_t v55 = 0LL;
        uint64_t v65 = v70;
        char v56 = v68;
        while ((v65 & 0x8000000000000000LL) == 0
             && v65 >> 6 < *(void *)&v56[2]
             && ((*(void *)&v27[v65 >> 6] >> v65) & 1) != 0)
        {
          ++v55;
          sub_188DF84D4();
          uint64_t v65 = v70;
          if ((v71 & 1) != 0) {
            goto LABEL_54;
          }
        }

        (*(void (**)(char *, uint64_t))(v66 + 8))(v12, v54);
        unint64_t v22 = 0;
        return v22 & 1;
      }

      uint64_t v55 = 0LL;
      char v56 = v68;
LABEL_54:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v12, v54);
      unint64_t v57 = v56[2];
      if (!*(void *)&v57)
      {
        if (v55 <= 0)
        {
          uint64_t v63 = 0LL;
LABEL_78:
          unint64_t v22 = v55 == v63;
          return v22 & 1;
        }

        goto LABEL_87;
      }

      char v58 = 0LL;
      uint64_t v59 = 8LL * *(void *)&v57;
      uint64_t v60 = v59;
      char v61 = v27;
      while (1)
      {
        uint64_t v62 = (uint8x8_t)vcnt_s8(*v61);
        v62.i16[0] = vaddlv_u8(v62);
        __int128 v33 = __OFADD__(v58, v62.u32[0]);
        v58 += v62.u32[0];
        if (v33) {
          break;
        }
        ++v61;
        v60 -= 8LL;
        if (!v60)
        {
          if (v58 < v55) {
            goto LABEL_86;
          }
          uint64_t v63 = 0LL;
          while (1)
          {
            char v64 = (uint8x8_t)vcnt_s8(*v27);
            v64.i16[0] = vaddlv_u8(v64);
            __int128 v33 = __OFADD__(v63, v64.u32[0]);
            v63 += v64.u32[0];
            if (v33) {
              goto LABEL_84;
            }
            ++v27;
            v59 -= 8LL;
            if (!v59) {
              goto LABEL_78;
            }
          }
        }
      }

uint64_t _sSS19CollectionsInternalEySSAA9BigStringVcfC_0(_OWORD *a1)
{
  __int128 v2 = a1[1];
  __int128 v72 = a1[2];
  *(_OWORD *)unint64_t v71 = *a1;
  *(_OWORD *)&v71[16] = v2;
  uint64_t v3 = *(void *)v71;
  if (!*(void *)v71
    || (__int128 v4 = *a1,
        __int128 v5 = a1[1],
        __int128 v6 = a1[2],
        __int128 v74 = *(_OWORD *)&v71[8],
        uint64_t v73 = *(void *)v71,
        uint64_t v75 = *(void *)&v71[24],
        (uint64_t v76 = v72) == 0))
  {
    sub_188D087F8((uint64_t)a1);
    return 0LL;
  }

  if (!*(_BYTE *)(*(void *)v71 + 18LL) && *(_WORD *)(*(void *)v71 + 16LL) == 1)
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    sub_188D36E50(0LL, (uint64_t)v65);
    sub_188D087F8((uint64_t)a1);
    sub_188D087F8((uint64_t)a1);
    sub_188D087F8((uint64_t)a1);
    return *(void *)&v65[0];
  }

  __int128 v57 = v6;
  __int128 v59 = v5;
  __int128 v61 = v4;
  uint64_t v69 = 0LL;
  unint64_t v70 = 0xE000000000000000LL;
  MEMORY[0x1895D6690]();
  uint64_t v8 = *((void *)&v72 + 1);
  unint64_t v9 = *(unsigned __int8 *)(*(void *)v71 + 18LL);
  swift_unknownObjectRetain_n();
  if (sub_188D36DF0() <= v9)
  {
    sub_188D087F8((uint64_t)a1);
    uint64_t result = sub_188D087F8((uint64_t)a1);
    uint64_t v10 = 0LL;
  }

  else
  {
    swift_unknownObjectRetain();
    uint64_t v10 = sub_188D7F6E0(v9);
    sub_188D087F8((uint64_t)a1);
    sub_188D087F8((uint64_t)a1);
    uint64_t result = sub_188D087F8((uint64_t)a1);
  }

  v65[0] = v61;
  v65[1] = v59;
  v65[2] = v57;
  uint64_t v66 = *((void *)&v72 + 1);
  uint64_t v67 = v9;
  uint64_t v68 = v10;
  if (!v10)
  {
LABEL_52:
    sub_188D087F8((uint64_t)a1);
    sub_188D087F8((uint64_t)a1);
    return v69;
  }

  uint64_t v60 = *(void *)v71 + 24LL;
  uint64_t v63 = *((void *)&v72 + 1);
  while (v66 == v8)
  {
    unint64_t v11 = v67;
    int v12 = *(unsigned __int8 *)(v3 + 18);
    swift_unknownObjectRetain_n();
    sub_188D07F48((uint64_t)a1);
    swift_bridgeObjectRetain();
    swift_unknownObjectRelease();
    uint64_t v13 = *(unsigned __int16 *)(v3 + 16);
    char v14 = *(_BYTE *)(v3 + 18);
    sub_188D087F8((uint64_t)a1);
    uint64_t result = sub_188D087F8((uint64_t)a1);
    char v15 = (4 * *(_BYTE *)(v10 + 18) + 8) & 0x3C;
    unint64_t v16 = ((v11 >> v15) & 0xF) + 1;
    if (v16 < *(unsigned __int16 *)(v10 + 16))
    {
      uint64_t v67 = (v16 << v15) | ((-15LL << v15) - 1) & v11;
LABEL_13:
      sub_188D087F8((uint64_t)a1);
      goto LABEL_14;
    }

    char v17 = (4 * *(_BYTE *)(v3 + 18) + 8) & 0x3C;
    uint64_t v18 = (v11 >> v17) & 0xF;
    if (*(_BYTE *)(v3 + 18))
    {
      uint64_t v10 = *(void *)(v60 + 40 * ((v11 >> v17) & 0xF));
      char v19 = (4 * *(_BYTE *)(v10 + 18) + 8) & 0x3C;
      uint64_t v20 = (v11 >> v19) & 0xF;
      if (*(_BYTE *)(v10 + 18))
      {
        uint64_t v21 = v10 + 24;
        uint64_t v22 = *(void *)(v10 + 24 + 40 * ((v11 >> v19) & 0xF));
        char v23 = (4 * *(_BYTE *)(v22 + 18) + 8) & 0x3C;
        uint64_t v24 = (v11 >> v23) & 0xF;
        if (*(_BYTE *)(v22 + 18))
        {
          uint64_t v62 = *(void *)(v60 + 40 * ((v11 >> v17) & 0xF));
          uint64_t v10 = *(void *)(v22 + 24 + 40 * ((v11 >> v23) & 0xF));
          int v25 = *(unsigned __int8 *)(v10 + 18);
          char v26 = (4 * v25 + 8) & 0x3C;
          unint64_t v64 = (v11 >> v26) & 0xF;
          if (v25)
          {
            uint64_t v55 = (v11 >> v23) & 0xF;
            char v56 = v19;
            char v53 = v23;
            uint64_t v54 = v22 + 24;
            uint64_t v58 = v21;
            uint64_t v27 = v22;
            sub_188D07F48((uint64_t)a1);
            swift_unknownObjectRetain();
            swift_unknownObjectRetain();
            swift_unknownObjectRetain();
            char v28 = sub_188D800A4(v10 + 24, (uint64_t *)&v64, (uint64_t)&v66, v10, v25);
            swift_unknownObjectRelease();
            if ((v28 & 1) != 0)
            {
              uint64_t v10 = v68;
              goto LABEL_39;
            }

double sub_188DDEAD8@<D0>(__int128 *a1@<X0>, unint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  char v28 = a3;
  uint64_t v27 = sub_188DF8B4C();
  uint64_t v26 = *(void *)(v27 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](v27);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v5);
  unint64_t v9 = (char *)&v25 - v8;
  __int128 v10 = a1[1];
  __int128 v39 = *a1;
  __int128 v40 = v10;
  __int128 v41 = a1[2];
  unint64_t v11 = *a2;
  unint64_t v12 = a2[1];
  uint64_t v13 = (uint64_t *)a2[3];
  unint64_t v14 = a2[2];
  sub_188DB152C(*a2 >> 11, a2[4] >> 11, (uint64_t)v36);
  uint64_t v15 = v38;
  __int128 v25 = v36[0];
  __int128 v33 = v36[0];
  __int128 v34 = v36[1];
  uint64_t v35 = v37;
  LOBYTE(v29) = 1;
  sub_188D20C84(v11, v12, v14, v13, 0x100000000uLL, (unint64_t)v9);
  uint64_t v16 = sub_188DF8B40();
  if ((void)v25) {
    uint64_t v17 = *(unsigned __int8 *)(v25 + 18);
  }
  else {
    uint64_t v17 = 0LL;
  }
  v32[0] = v15;
  v32[1] = v17;
  v32[2] = 0LL;
  MEMORY[0x1895F8858](v16);
  *((void *)&v25 - 2) = v9;
  *((void *)&v25 - 1) = v7;
  uint64_t v30 = 0LL;
  char v31 = 1;
  if (v18)
  {
    sub_188D25420( &v29,  (uint64_t)v32,  &v33,  (uint64_t)&v30,  (void (*)(void *__return_ptr))sub_188D955B4,  (uint64_t)(&v25 - 2));
    sub_188D087F8((uint64_t)a1);
    ++v15;
  }

  else
  {
    sub_188D087F8((uint64_t)a1);
  }

  char v19 = *(void (**)(char *, uint64_t))(v26 + 8);
  uint64_t v20 = v27;
  v19(v7, v27);
  v19(v9, v20);
  uint64_t v21 = v35;
  double result = *(double *)&v33;
  __int128 v23 = v34;
  uint64_t v24 = v28;
  _OWORD *v28 = v33;
  v24[1] = v23;
  *((void *)v24 + 4) = v21;
  *((void *)v24 + 5) = v15;
  return result;
}

__n128 sub_188DDECEC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X8>)
{
  uint64_t v30 = a3;
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v29.n128_u64[0] = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  __int128 v10 = (char *)&v28 - v9;
  uint64_t v11 = _s7BuilderVMa();
  MEMORY[0x1895F8858](v11);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = MEMORY[0x18961AFE8];
  *(void *)uint64_t v13 = MEMORY[0x18961AFE8];
  *(_OWORD *)(v13 + 8) = 0u;
  *(_OWORD *)(v13 + 24) = 0u;
  *(_OWORD *)(v13 + 40) = 0u;
  *(_OWORD *)(v13 + 54) = 0u;
  *((void *)v13 + 9) = 0LL;
  *((void *)v13 + 10) = 0LL;
  *(void *)(v13 + 86) = 0LL;
  *((void *)v13 + 12) = v14;
  sub_188DF8B40();
  sub_188DF8B40();
  uint64_t v31 = 0LL;
  unint64_t v32 = 0xE000000000000000LL;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, a2);
  sub_188DF7FDC();
  swift_getAssociatedConformanceWitness();
  sub_188DF84D4();
  uint64_t v15 = *((void *)&v33[0] + 1);
  if (*((void *)&v33[0] + 1))
  {
    uint64_t v16 = *(void *)&v33[0];
    do
    {
      MEMORY[0x1895D6774](v16, v15);
      swift_bridgeObjectRelease();
      if ((v32 & 0x1000000000000000LL) != 0)
      {
        if (sub_188DF7EF8() < 124) {
          goto LABEL_3;
        }
      }

      else if ((v32 & 0x2000000000000000LL) != 0 || (v31 & 0xFFFFFFFFFFFFuLL) < 0x7C)
      {
        goto LABEL_3;
      }

      swift_bridgeObjectRetain();
      uint64_t v17 = sub_188DF7FD0();
      uint64_t v19 = v18;
      uint64_t v21 = v20;
      unint64_t v23 = v22;
      swift_bridgeObjectRelease();
      sub_188DB0EC0(v17, v19, v21, v23);
      swift_bridgeObjectRelease();
      uint64_t v31 = 0LL;
      unint64_t v32 = 0xE000000000000000LL;
LABEL_3:
      sub_188DF84D4();
      uint64_t v15 = *((void *)&v33[0] + 1);
      uint64_t v16 = *(void *)&v33[0];
    }

    while (*((void *)&v33[0] + 1));
  }

  (*(void (**)(char *, uint64_t))(v29.n128_u64[0] + 8))(v10, AssociatedTypeWitness);
  swift_bridgeObjectRetain();
  sub_188DB1460();
  sub_188D435A0((uint64_t)v13, (uint64_t)v13);
  sub_188DB8024((uint64_t *)v33);
  __n128 v28 = (__n128)v33[1];
  __n128 v29 = (__n128)v33[0];
  unint64_t v24 = v34;
  unint64_t v25 = v35;
  sub_188D394BC((uint64_t)v13, (uint64_t (*)(void))_s7BuilderVMa);
  swift_bridgeObjectRelease();
  uint64_t v26 = v30;
  __n128 result = v28;
  *uint64_t v30 = v29;
  v26[1] = result;
  v26[2].n128_u64[0] = v24;
  v26[2].n128_u64[1] = v25;
  return result;
}

__n128 sub_188DDF018@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X8>)
{
  uint64_t v37 = a3;
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v36.n128_u64[0] = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  __int128 v10 = (char *)&v35 - v9;
  uint64_t v11 = _s7BuilderVMa();
  MEMORY[0x1895F8858](v11);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = MEMORY[0x18961AFE8];
  *(void *)uint64_t v13 = MEMORY[0x18961AFE8];
  *(_OWORD *)(v13 + 8) = 0u;
  *(_OWORD *)(v13 + 24) = 0u;
  *(_OWORD *)(v13 + 40) = 0u;
  *(_OWORD *)(v13 + 54) = 0u;
  *((void *)v13 + 9) = 0LL;
  *((void *)v13 + 10) = 0LL;
  *(void *)(v13 + 86) = 0LL;
  *((void *)v13 + 12) = v14;
  sub_188DF8B40();
  sub_188DF8B40();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, a2);
  sub_188DF7FDC();
  swift_getAssociatedConformanceWitness();
  sub_188DF84D4();
  if ((BYTE4(v38[0]) & 1) == 0)
  {
    uint64_t v26 = 0LL;
    unint64_t v27 = 0xE000000000000000LL;
    do
    {
      *(void *)&v38[0] = v26;
      *((void *)&v38[0] + 1) = v27;
      sub_188DF7E38();
      unint64_t v27 = *((void *)&v38[0] + 1);
      uint64_t v26 = *(void *)&v38[0];
      if ((*((void *)&v38[0] + 1) & 0x1000000000000000LL) != 0)
      {
        if (sub_188DF7EF8() < 124) {
          goto LABEL_4;
        }
      }

      else if ((*((void *)&v38[0] + 1) & 0x2000000000000000LL) != 0 {
             || (*(void *)&v38[0] & 0xFFFFFFFFFFFFuLL) < 0x7C)
      }
      {
        goto LABEL_4;
      }

      swift_bridgeObjectRetain();
      uint64_t v28 = sub_188DF7FD0();
      uint64_t v30 = v29;
      uint64_t v32 = v31;
      unint64_t v34 = v33;
      swift_bridgeObjectRelease();
      sub_188DB0EC0(v28, v30, v32, v34);
      swift_bridgeObjectRelease();
      uint64_t v26 = 0LL;
      unint64_t v27 = 0xE000000000000000LL;
LABEL_4:
      sub_188DF84D4();
    }

    while ((BYTE4(v38[0]) & 1) == 0);
  }

  (*(void (**)(char *, uint64_t))(v36.n128_u64[0] + 8))(v10, AssociatedTypeWitness);
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_188DF7FD0();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  unint64_t v21 = v20;
  swift_bridgeObjectRelease();
  sub_188DB0EC0(v15, v17, v19, v21);
  sub_188D435A0((uint64_t)v13, (uint64_t)v13);
  sub_188DB8024((uint64_t *)v38);
  __n128 v35 = (__n128)v38[1];
  __n128 v36 = (__n128)v38[0];
  unint64_t v22 = v39;
  unint64_t v23 = v40;
  sub_188D394BC((uint64_t)v13, (uint64_t (*)(void))_s7BuilderVMa);
  swift_bridgeObjectRelease();
  unint64_t v24 = v37;
  __n128 result = v35;
  *uint64_t v37 = v36;
  v24[1] = result;
  v24[2].n128_u64[0] = v22;
  v24[2].n128_u64[1] = v23;
  return result;
}

unint64_t sub_188DDF3A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v112 = a3;
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v7 = (char *)&v111 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v118 = _s9_IngesterVMa();
  MEMORY[0x1895F8858](v118);
  uint64_t v9 = (uint64_t *)((char *)&v111 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v134 = MEMORY[0x18961AFE8];
  __int128 v135 = 0u;
  __int128 v136 = 0u;
  memset(v137, 0, 30);
  uint64_t v138 = 0LL;
  memset(v139, 0, 14);
  v139[2] = MEMORY[0x18961AFE8];
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, a2);
  sub_188D8CEA8((uint64_t)v7, a2, v9);
  uint64_t v10 = 0LL;
  uint64_t v115 = v9;
  while (1)
  {
    uint64_t v11 = *v9;
    unint64_t v12 = v9[1];
    unint64_t v13 = v9[2];
    unint64_t v14 = v9[3];
    unint64_t v15 = v9[4];
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_188DF848C();
    swift_bridgeObjectRelease();
    uint64_t v17 = v16 - 124;
    if (v16 >= 379) {
      uint64_t v17 = 255LL;
    }
    if (v16 <= 255) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = v17;
    }
    unint64_t v19 = sub_188D8CFEC(v15, v12, v18, v13, v14);
    if ((v21 & 1) != 0 || (v19 ^ v20) < 0x4000)
    {
      sub_188DB8024((uint64_t *)v140);
      __int128 v132 = v140[0];
      __int128 v131 = v140[1];
      uint64_t v106 = (uint64_t)v9;
      uint64_t v107 = v141;
      uint64_t v108 = v142;
      sub_188D394BC(v106, (uint64_t (*)(void))_s9_IngesterVMa);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t result = swift_bridgeObjectRelease();
      uint64_t v109 = v112;
      __int128 v110 = v131;
      _OWORD *v112 = v132;
      v109[1] = v110;
      *((void *)v109 + 4) = v107;
      *((void *)v109 + 5) = v108;
      return result;
    }

    v9[4] = v20;
    unint64_t v122 = v19;
    uint64_t v121 = v20;
    unint64_t v124 = v13;
    unint64_t v123 = v14;
    unint64_t v22 = sub_188DF84BC();
    unint64_t v24 = v23;
    unint64_t v26 = v25;
    unint64_t v28 = v27;
    unint64_t v29 = sub_188D82544(v22, v23, v25, v27);
    *(void *)&__int128 v131 = v26;
    unint64_t result = sub_188D62E54(v22, v24, v26, v28);
    *(void *)&__int128 v132 = v10;
    if ((v31 & 0x100) != 0) {
      break;
    }
    if ((v31 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      unint64_t v32 = sub_188DF8480();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      unint64_t v33 = sub_188DF8480();
      unint64_t result = swift_bridgeObjectRelease();
      unint64_t v34 = v33 >> 14;
      if (v33 >> 14 < v32 >> 14) {
        goto LABEL_164;
      }
      unint64_t v35 = v24 >> 14;
LABEL_68:
      if (v35 >= v34)
      {
        unint64_t v116 = v12;
        uint64_t v117 = v11;
        unint64_t v54 = sub_188DF84BC();
        unint64_t v56 = v55;
        uint64_t v58 = v57;
        unint64_t v60 = v59;
        unint64_t result = swift_bridgeObjectRelease();
        *(void *)&__int128 v131 = v32;
        uint64_t v90 = 1LL;
        while (1)
        {
          if ((v60 & 0x1000000000000000LL) != 0)
          {
            unint64_t v74 = v56 >> 14;
            if (v54 >> 14 >= v56 >> 14) {
              goto LABEL_129;
            }
            unint64_t v81 = v54 >> 14;
            uint64_t v82 = 4LL << ((v58 & 0x800000000000000LL) != 0);
            uint64_t v83 = HIBYTE(v60) & 0xF;
            if ((v60 & 0x2000000000000000LL) == 0) {
              uint64_t v83 = v58 & 0xFFFFFFFFFFFFLL;
            }
            unint64_t v129 = v83;
            unint64_t v84 = v54;
            uint64_t v128 = v54 >> 14;
            uint64_t v130 = 4LL << ((v58 & 0x800000000000000LL) != 0);
            while (1)
            {
              unint64_t v85 = v84 & 0xC;
              BOOL v86 = v85 == v82 || (v84 & 1) == 0;
              unint64_t v127 = v81;
              if (v86)
              {
                unint64_t v87 = v84;
                if (v85 == v82)
                {
                  unint64_t result = sub_188D37044(v84, v58, v60);
                  unint64_t v85 = v84 & 0xC;
                  unint64_t v87 = result;
                }

                if (v129 <= v87 >> 16) {
                  goto LABEL_166;
                }
                uint64_t v126 = v85;
                if ((v87 & 1) == 0) {
                  sub_188D36F34(v87, v58, v60);
                }
                unint64_t v88 = sub_188DF7E08();
                unint64_t result = v84;
                if (v126 == v130) {
                  unint64_t result = sub_188D37044(v84, v58, v60);
                }
                if (result >> 14 < v128 || result >> 14 >= v74) {
                  goto LABEL_167;
                }
                if ((result & 1) == 0) {
                  sub_188D36F34(result, v58, v60);
                }
              }

              else
              {
                if (v129 <= v84 >> 16) {
                  goto LABEL_168;
                }
                unint64_t result = sub_188DF7E08();
                if (v84 >> 14 < v128) {
                  goto LABEL_169;
                }
                unint64_t v88 = result;
                unint64_t result = v84;
                if (v84 >> 14 >= v74) {
                  goto LABEL_169;
                }
              }

              sub_188DF85F4();
              unint64_t result = sub_188DF8B34();
              unint64_t v75 = v88 >> 14;
              if ((result & 1) != 0) {
                break;
              }
              unint64_t v84 = v88;
              unint64_t v81 = v88 >> 14;
              uint64_t v82 = v130;
              if (v75 >= v74) {
                goto LABEL_129;
              }
            }

            if (v75 < v127) {
              goto LABEL_170;
            }
          }

          else
          {
            if ((v60 & 0x2000000000000000LL) != 0)
            {
              *(void *)&v140[0] = v58;
              *((void *)&v140[0] + 1) = v60 & 0xFFFFFFFFFFFFFFLL;
              uint64_t v62 = v140;
              unint64_t v63 = v54;
              unint64_t v64 = v56;
              unint64_t v65 = v58;
              unint64_t v66 = v60;
              uint64_t v61 = v132;
            }

            else
            {
              uint64_t v61 = v132;
              if ((v58 & 0x1000000000000000LL) != 0) {
                uint64_t v62 = (_OWORD *)((v60 & 0xFFFFFFFFFFFFFFFLL) + 32);
              }
              else {
                uint64_t v62 = (_OWORD *)sub_188DF8684();
              }
              unint64_t v63 = v54;
              unint64_t v64 = v56;
              unint64_t v65 = v58;
              unint64_t v66 = v60;
            }

            uint64_t v67 = sub_188D632DC((uint64_t)v62, v63, v64, v65, v66);
            uint64_t v69 = v68;
            char v133 = v70 & 1;
            *(void *)&__int128 v132 = v61;
            if ((v70 & 1) != 0)
            {
LABEL_129:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              unint64_t v29 = sub_188DF848C();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              uint64_t v130 = sub_188DF848C();
              swift_bridgeObjectRelease();
              unint64_t v22 = sub_188DF84BC();
              unint64_t v28 = v89;
              goto LABEL_130;
            }

            unint64_t result = v54;
            if ((v54 & 0xC) == 8)
            {
              unint64_t result = sub_188D37044(v54, v58, v60);
              unint64_t v71 = v67 + (result >> 16);
              if (__OFADD__(v67, result >> 16))
              {
LABEL_142:
                __break(1u);
LABEL_143:
                __break(1u);
LABEL_144:
                __break(1u);
LABEL_145:
                __break(1u);
LABEL_146:
                __break(1u);
LABEL_147:
                __break(1u);
LABEL_148:
                __break(1u);
LABEL_149:
                __break(1u);
LABEL_150:
                __break(1u);
LABEL_151:
                __break(1u);
LABEL_152:
                __break(1u);
LABEL_153:
                __break(1u);
LABEL_154:
                __break(1u);
LABEL_155:
                __break(1u);
                goto LABEL_156;
              }
            }

            else
            {
              unint64_t v71 = v67 + (v54 >> 16);
              if (__OFADD__(v67, v54 >> 16)) {
                goto LABEL_142;
              }
            }

            if ((v71 & 0x8000000000000000LL) != 0) {
              goto LABEL_143;
            }
            if ((v60 & 0x2000000000000000LL) != 0) {
              unint64_t v72 = HIBYTE(v60) & 0xF;
            }
            else {
              unint64_t v72 = v58 & 0xFFFFFFFFFFFFLL;
            }
            if (v72 < v71) {
              goto LABEL_144;
            }
            unint64_t result = v54;
            if ((v54 & 0xC) == 8)
            {
              unint64_t result = sub_188D37044(v54, v58, v60);
              unint64_t v73 = v69 + (result >> 16);
              if (__OFADD__(v69, result >> 16)) {
                goto LABEL_145;
              }
            }

            else
            {
              unint64_t v73 = v69 + (v54 >> 16);
              if (__OFADD__(v69, v54 >> 16)) {
                goto LABEL_145;
              }
            }

            if ((v73 & 0x8000000000000000LL) != 0) {
              goto LABEL_146;
            }
            if (v72 < v73) {
              goto LABEL_147;
            }
            if (v73 < v71) {
              goto LABEL_148;
            }
            unint64_t v74 = v56 >> 14;
            unint64_t v75 = 4 * v73;
          }

          if (v74 < v75) {
            goto LABEL_149;
          }
          unint64_t v54 = sub_188DF84BC();
          unint64_t v56 = v76;
          uint64_t v58 = v77;
          unint64_t v79 = v78;
          unint64_t result = swift_bridgeObjectRelease();
          unint64_t v60 = v79;
          if (__OFADD__(v90++, 1LL)) {
            goto LABEL_150;
          }
        }
      }

      goto LABEL_163;
    }

    uint64_t v90 = 0LL;
    uint64_t v130 = v29;
    unint64_t v37 = v24;
LABEL_65:
    uint64_t v38 = v131;
LABEL_130:
    uint64_t v91 = MEMORY[0x1895D6684](v22, v37, v38, v28);
    unint64_t v93 = v92;
    uint64_t v128 = v29;
    if ((v92 & 0x1000000000000000LL) != 0)
    {
      uint64_t v91 = sub_188DDD440();
      unint64_t v105 = v104;
      swift_bridgeObjectRelease();
      unint64_t v93 = v105;
    }

    swift_bridgeObjectRetain();
    unint64_t v94 = sub_188DF7FD0();
    unint64_t v96 = v95;
    unint64_t v98 = v97;
    unint64_t v100 = v99;
    swift_bridgeObjectRelease();
    unint64_t result = sub_188D82544(v94, v96, v98, v100);
    int64_t v101 = sub_188D82544(v94, v96, v98, v100);
    uint64_t v102 = sub_188DF7F7C();
    int64_t v103 = sub_188D62BEC(v94, v96, v98, v100);
    swift_bridgeObjectRelease();
    unint64_t result = swift_bridgeObjectRelease();
    if (v101 > 255)
    {
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
LABEL_160:
      __break(1u);
LABEL_161:
      __break(1u);
LABEL_162:
      __break(1u);
LABEL_163:
      __break(1u);
LABEL_164:
      __break(1u);
      goto LABEL_165;
    }

    if (v102 > 255) {
      goto LABEL_157;
    }
    if (v103 > 255) {
      goto LABEL_158;
    }
    if (v90 > 255) {
      goto LABEL_159;
    }
    if (v128 > 255) {
      goto LABEL_160;
    }
    if ((v128 | v90 | v130 | v101 | v102 | v103) < 0) {
      goto LABEL_161;
    }
    if (v130 > 255) {
      goto LABEL_162;
    }
    unint64_t v125 = ((_DWORD)v90 << 24) | v125 & 0xFFFF000000000000LL | ((unint64_t)v128 << 32) & 0xFFFF00FFFFFF0000LL | ((unint64_t)v130 << 40) | v101 | ((unint64_t)v102 << 8) | ((unint64_t)v103 << 16);
    sub_188DDC91C(v91, v93, v125);
    uint64_t v9 = v115;
    uint64_t v10 = v132;
  }

  unint64_t v36 = v22 >> 14;
  unint64_t v35 = v24 >> 14;
  unint64_t v37 = v24;
  if (v22 >> 14 >= v24 >> 14)
  {
    uint64_t v90 = 0LL;
    uint64_t v130 = v29;
    goto LABEL_65;
  }

  unint64_t v113 = v24;
  uint64_t v128 = v29;
  unint64_t v116 = v12;
  uint64_t v117 = v11;
  uint64_t v38 = v131;
  unint64_t v39 = ((unint64_t)v131 >> 59) & 1;
  if ((v28 & 0x1000000000000000LL) == 0) {
    LOBYTE(v39) = 1;
  }
  uint64_t v40 = 4LL << v39;
  uint64_t v41 = HIBYTE(v28) & 0xF;
  uint64_t v120 = v41;
  uint64_t v119 = v131 & 0xFFFFFFFFFFFFLL;
  if ((v28 & 0x2000000000000000LL) == 0) {
    uint64_t v41 = v131 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v130 = v41;
  unint64_t v127 = v28 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v126 = (v28 & 0xFFFFFFFFFFFFFFFLL) + 32;
  unint64_t v114 = v22;
  unint64_t v42 = v22;
  unint64_t v129 = v22 >> 14;
  while (1)
  {
    unint64_t v43 = v42 & 0xC;
    BOOL v44 = (v42 & 1) == 0 || v43 == v40;
    BOOL v45 = v44;
    unint64_t v46 = v42;
    if (v44)
    {
      if (v43 == v40)
      {
        unint64_t result = sub_188D37044(v42, v38, v28);
        uint64_t v38 = v131;
        unint64_t v42 = result;
      }

      if (v130 <= v42 >> 16) {
        goto LABEL_151;
      }
      if ((v42 & 1) == 0)
      {
        unint64_t result = sub_188D36F34(v42, v38, v28);
        uint64_t v38 = v131;
        unint64_t v42 = v42 & 0xC | result & 0xFFFFFFFFFFFFFFF3LL | 1;
      }
    }

    else if (v130 <= v42 >> 16)
    {
      goto LABEL_152;
    }

    if ((v28 & 0x1000000000000000LL) != 0)
    {
      unint64_t result = sub_188DF7E08();
      unint64_t v42 = result;
    }

    else
    {
      unint64_t v47 = v42 >> 16;
      if ((v28 & 0x2000000000000000LL) != 0)
      {
        *(void *)&v140[0] = v38;
        *((void *)&v140[0] + 1) = v127;
        int v48 = *((unsigned __int8 *)v140 + v47);
      }

      else
      {
        unint64_t result = v126;
        if ((v38 & 0x1000000000000000LL) == 0) {
          unint64_t result = sub_188DF8684();
        }
        int v48 = *(unsigned __int8 *)(result + v47);
      }

      int v49 = (char)v48;
      unsigned int v50 = __clz(v48 ^ 0xFF) - 24;
      if (v49 >= 0) {
        LOBYTE(v50) = 1;
      }
      unint64_t v42 = ((v47 + v50) << 16) | 5;
    }

    unint64_t v51 = v129;
    if (v45)
    {
      unint64_t result = v46;
      uint64_t v52 = v131;
      if (v43 == v40)
      {
        unint64_t result = sub_188D37044(v46, v131, v28);
        uint64_t v52 = v131;
      }

      if (result >> 14 < v51 || result >> 14 >= v35) {
        goto LABEL_153;
      }
      if ((result & 1) == 0)
      {
        sub_188D36F34(result, v52, v28);
        uint64_t v52 = v131;
      }
    }

    else
    {
      uint64_t v52 = v131;
      if (v46 >> 14 < v129) {
        goto LABEL_154;
      }
      unint64_t result = v46;
      if (v46 >> 14 >= v35) {
        goto LABEL_154;
      }
    }

    if ((v28 & 0x1000000000000000LL) != 0)
    {
      sub_188DF85F4();
    }

    else
    {
      if ((v28 & 0x2000000000000000LL) != 0)
      {
        *(void *)&v140[0] = v52;
        *((void *)&v140[0] + 1) = v127;
        swift_bridgeObjectRetain();
      }

      else
      {
        if ((v52 & 0x1000000000000000LL) == 0) {
          sub_188DF8684();
        }
        swift_bridgeObjectRetain();
      }

      sub_188DF8690();
      swift_bridgeObjectRelease();
    }

    unint64_t result = sub_188DF8B34();
    unint64_t v34 = v42 >> 14;
    if ((result & 1) != 0) {
      break;
    }
    unint64_t v36 = v42 >> 14;
    uint64_t v38 = v131;
    if (v34 >= v35)
    {
      uint64_t v90 = 0LL;
      unint64_t v29 = v128;
      uint64_t v130 = v128;
      unint64_t v22 = v114;
      unint64_t v37 = v113;
      goto LABEL_130;
    }
  }

  BOOL v53 = v34 >= v36;
  uint64_t v11 = v117;
  unint64_t v12 = v116;
  unint64_t v32 = v46;
  if (v53) {
    goto LABEL_68;
  }
LABEL_165:
  __break(1u);
LABEL_166:
  __break(1u);
LABEL_167:
  __break(1u);
LABEL_168:
  __break(1u);
LABEL_169:
  __break(1u);
LABEL_170:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for BigString()
{
  return &type metadata for BigString;
}

uint64_t _HashNode.subtracting<A>(_:_:)( unsigned int a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v35 = a5;
  uint64_t v36 = a8;
  unint64_t v33 = a3;
  uint64_t v34 = a4;
  uint64_t v32 = a2;
  unsigned int v31 = a1;
  uint64_t v11 = type metadata accessor for _HashNode.Builder(0LL, a6, a7, a9);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  unint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v13);
  uint64_t v30 = (char *)&v29 - v16;
  uint64_t v17 = sub_188DF8384();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x1895F8858](v17);
  char v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v19);
  unint64_t v23 = (char *)&v29 - v22;
  _HashNode._subtracting<A>(_:_:)(v31, v32, v33, v34, v35, a6, a7, v36, (_BYTE *)&v29 - v22, a9);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v21, 1LL, v11) == 1)
  {
    unint64_t v24 = *(void (**)(char *, uint64_t))(v18 + 8);
    v24(v23, v17);
    v24(v21, v17);
    return 0LL;
  }

  else
  {
    unint64_t v26 = v30;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v30, v21, v11);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v26, v11);
    sub_188D9B09C(v11);
    uint64_t v25 = v27;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v26, v11);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v23, v17);
  }

  return v25;
}

uint64_t _HashNode._subtracting<A>(_:_:)@<X0>( unsigned int a1@<W0>, uint64_t a2@<X1>, void (*a3)(uint64_t, uint64_t, uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _BYTE *a9@<X8>, uint64_t a10)
{
  uint64_t v29 = a8;
  uint64_t v18 = type metadata accessor for _HashNode.Builder.Kind(0LL, a6, a7, a10);
  MEMORY[0x1895F8858](v18);
  uint64_t v20 = (char *)&v27 - v19;
  if (a4 == a2)
  {
    swift_storeEnumTagMultiPayload();
    _HashNode.Builder.init(_:_:)(a1, (uint64_t)v20, a6, a7, a10, a9);
    uint64_t v24 = type metadata accessor for _HashNode.Builder(0LL, a6, a7, a10);
    return (*(uint64_t (**)(_BYTE *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56LL))( a9,  0LL,  1LL,  v24);
  }

  else
  {
    uint64_t v28 = a5;
    BOOL v21 = _HashNode.isCollisionNode.getter(a4, a5, a6, a7, a10);
    uint64_t v22 = v29;
    if (v21 || _HashNode.isCollisionNode.getter(a2, (uint64_t)a3, a6, v29, a10))
    {
      return _HashNode._subtracting_slow<A>(_:_:)(a1, a2, a3, a4, v28, a6, a7, v22, (uint64_t)a9, a10);
    }

    else
    {
      uint64_t v25 = (unsigned int *)nullsub_1(a4 + 16, a4 + 32, a6, a7, a10);
      return sub_188DE0690(v25, v26, a2, a1, a6, (uint64_t)a9, a7, v22, a10);
    }
  }

uint64_t _HashNode._subtracting_slow<A>(_:_:)@<X0>( unsigned int a1@<W0>, uint64_t a2@<X1>, void (*a3)(uint64_t, uint64_t, uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  BOOL v17 = _HashNode.isCollisionNode.getter(a4, a5, a6, a7, a10);
  BOOL v18 = _HashNode.isCollisionNode.getter(a2, (uint64_t)a3, a6, a8, a10);
  uint64_t v19 = (int *)nullsub_1(a4 + 16, a4 + 32, a6, a7, a10);
  if (!v17) {
    return sub_188DE1C74(v19, (uint64_t)v20, a2, a3, a1, a4, a5, a6, a9, a7, a8, a10);
  }
  if (!v18) {
    return sub_188DE17B8((uint64_t)v19, v20, a2, a1, a4, a5, a6, a9, a7, a8, a10);
  }
  BOOL v21 = v19;
  uint64_t v22 = v20;
  uint64_t v23 = nullsub_1(a2 + 16, a2 + 32, a6, a8, a10);
  return sub_188DE13B8(v23, v24, v21, v22, a1, a6, a9, a7, a8, a10);
}

uint64_t sub_188DE0690@<X0>( unsigned int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W4>, uint64_t a5@<X7>, uint64_t a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14 = (_DWORD *)nullsub_1(a3 + 16, a3 + 32, a5, a8, a9);
  return sub_188DE0738(v14, v15, a4, a1, a2, a5, a6, a7, a8, a9);
}

uint64_t sub_188DE0738@<X0>( _DWORD *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, unsigned int *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v191 = a5;
  uint64_t v187 = a2;
  v189 = a1;
  uint64_t v155 = a7;
  uint64_t v13 = a10;
  uint64_t v186 = a9;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v15 = type metadata accessor for _HashNode.Builder(255LL, a6, a8, a10);
  uint64_t v169 = swift_getTupleTypeMetadata2();
  uint64_t v162 = sub_188DF8384();
  uint64_t v161 = *(void *)(v162 - 8);
  MEMORY[0x1895F8858](v162);
  uint64_t v180 = (uint64_t)&v154 - v16;
  uint64_t v171 = sub_188DF8384();
  uint64_t v170 = *(void *)(v171 - 8);
  uint64_t v17 = MEMORY[0x1895F8858](v171);
  v158 = (char *)&v154 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = MEMORY[0x1895F8858](v17);
  v157 = (char *)&v154 - v20;
  uint64_t v21 = MEMORY[0x1895F8858](v19);
  v168 = (char *)&v154 - v22;
  uint64_t v23 = MEMORY[0x1895F8858](v21);
  v167 = (char *)&v154 - v24;
  uint64_t v165 = TupleTypeMetadata2;
  uint64_t v25 = MEMORY[0x1895F8858](v23);
  v159 = (char *)&v154 - v26;
  uint64_t v179 = *(void *)(a6 - 8);
  uint64_t v27 = MEMORY[0x1895F8858](v25);
  v166 = (char *)&v154 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v27);
  v178 = (char *)&v154 - v29;
  uint64_t v30 = type metadata accessor for _HashNode.Builder.Kind(0LL, a6, a8, a10);
  uint64_t v31 = MEMORY[0x1895F8858](v30);
  unint64_t v33 = (char *)&v154 - v32;
  uint64_t v34 = *(void *)(v15 - 8);
  uint64_t v35 = MEMORY[0x1895F8858](v31);
  v156 = (char *)&v154 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v37 = MEMORY[0x1895F8858](v35);
  v164 = (char *)&v154 - v38;
  uint64_t v39 = MEMORY[0x1895F8858](v37);
  v160 = (char *)&v154 - v40;
  MEMORY[0x1895F8858](v39);
  unint64_t v42 = (char *)&v154 - v41;
  swift_storeEnumTagMultiPayload();
  v177 = v42;
  unint64_t v43 = v42;
  LODWORD(v42) = a3;
  char v44 = a3;
  uint64_t v193 = a6;
  uint64_t v45 = a8;
  _HashNode.Builder.init(_:_:)(v44, (uint64_t)v33, a6, a8, a10, v43);
  unsigned int v47 = v42;
  unsigned int v48 = *a4;
  v181 = a4;
  unsigned int v176 = v47;
  uint64_t v185 = v15;
  uint64_t v190 = a10;
  uint64_t v192 = a8;
  uint64_t v172 = v34;
  if (!v48)
  {
    unsigned int v84 = a4[1];
    BOOL v86 = v177;
    uint64_t v85 = v34;
    if (v84)
    {
      int v87 = 0;
      unsigned int v173 = v176 + 5;
LABEL_27:
      unint64_t v88 = v189;
      for (uint64_t i = 0LL; ; uint64_t i = (i + 1))
      {
        unsigned int v93 = __clz(__rbit32(v84));
        v84 &= v84 - 1;
        int v94 = *v88;
        int v95 = 1 << v93;
        LODWORD(v182) = v93;
        if (((1 << v93) & v94) != 0) {
          break;
        }
        int v113 = v88[1];
        if ((v113 & v95) != 0)
        {
          unint64_t v114 = v88;
          unsigned int v183 = v87;
          unsigned int v184 = i;
          int v188 = v84;
          v46.i32[0] = v113 & (v95 - 1);
          uint8x8_t v115 = (uint8x8_t)vcnt_s8(v46);
          v115.i16[0] = vaddlv_u8(v115);
          uint64_t v116 = v115.u32[0];
          uint64_t v117 = i;
          uint64_t v118 = v192;
          uint64_t v119 = v193;
          uint64_t v120 = v190;
          uint64_t v121 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v117, a4, v191, v193, v192, v190);
          uint64_t v122 = *v121;
          uint64_t v123 = v121[1];
          unint64_t v124 = v114;
          uint64_t v125 = v186;
          uint64_t v126 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v116, v124, v187, v119, v186, v120);
          uint64_t v127 = *v126;
          uint64_t v128 = v126[1];
          swift_retain();
          swift_retain();
          uint64_t v153 = v120;
          unint64_t v129 = v157;
          uint64_t v130 = v118;
          uint64_t v131 = v170;
          uint64_t v132 = v171;
          _HashNode._subtracting<A>(_:_:)(v173, v127, v128, v122, v123, v119, v130, v125, v153);
          swift_release();
          char v133 = v129;
          uint64_t v85 = v172;
          swift_release();
          uint64_t v134 = v158;
          (*(void (**)(char *, char *, uint64_t))(v131 + 16))(v158, v129, v132);
          uint64_t i = v185;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v85 + 48))(v134, 1LL, v185) != 1)
          {
            uint64_t v142 = v156;
            (*(void (**)(char *, char *, uint64_t))(v85 + 32))(v156, v134, i);
            uint64_t v143 = v85;
            BOOL v86 = v177;
            v175 = v133;
            goto LABEL_47;
          }

          __int128 v135 = *(void (**)(char *, uint64_t))(v131 + 8);
          v135(v129, v132);
          v135(v134, v132);
          uint64_t v109 = v192;
          a4 = v181;
LABEL_40:
          unsigned int v84 = v188;
          uint64_t i = v184;
          if ((v183 & 1) != 0) {
            goto LABEL_28;
          }
          goto LABEL_44;
        }

        uint64_t v109 = v192;
        if ((v87 & 1) != 0)
        {
LABEL_28:
          uint64_t v90 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(i, a4, v191, v193, v109, v190);
          uint64_t v92 = *v90;
          uint64_t v91 = v90[1];
          swift_retain();
          _HashNode.Builder.addNewChildNode(_:_:at:)(v176, v92, v91, v182, v185);
          if (!v84) {
            goto LABEL_50;
          }
          goto LABEL_29;
        }

uint64_t sub_188DE13B8@<X0>( uint64_t a1@<X0>, void *a2@<X1>, __int32 *a3@<X2>, uint64_t *a4@<X3>, unsigned int a5@<W4>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10)
{
  unsigned int v51 = a5;
  uint64_t v61 = a1;
  uint64_t v48 = a7;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x1895F8858](TupleTypeMetadata2);
  unsigned int v49 = (char *)&v46 - v14;
  uint64_t v15 = type metadata accessor for _HashNode.Builder.Kind(0LL, a6, a8, a10);
  MEMORY[0x1895F8858](v15);
  uint64_t v17 = (char *)&v46 - v16;
  uint64_t v18 = type metadata accessor for _HashNode.Builder(0LL, a6, a8, a10);
  MEMORY[0x1895F8858](v18);
  uint64_t v22 = (char *)&v46 - v21;
  uint64_t v62 = a4;
  uint64_t v23 = *a4;
  unint64_t v65 = a2;
  if (v23 != *a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v48, 1LL, 1LL, v19);
  }
  uint64_t v47 = v20;
  uint64_t v53 = v19;
  uint64_t v24 = v22;
  swift_storeEnumTagMultiPayload();
  uint64_t v52 = v24;
  _HashNode.Builder.init(_:_:)(v51, (uint64_t)v17, a6, a8, a10, v24);
  uint64_t v59 = a9;
  uint64_t v25 = _HashNode.UnsafeHandle.reverseItems.getter();
  uint64_t v57 = v26;
  uint64_t v58 = v25;
  __int32 v27 = *a3;
  uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)*a3);
  v28.i16[0] = vaddlv_u8(v28);
  if (*a3 != a3[1]) {
    __int32 v27 = v28.i32[0];
  }
  unsigned int v56 = v27;
  if (!v27)
  {
LABEL_18:
    uint64_t v41 = v53;
    uint64_t v42 = v47;
    (*(void (**)(_BYTE *, uint64_t))(v47 + 8))(v52, v53);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v48, 1LL, 1LL, v41);
  }

  uint64_t v60 = a8;
  uint64_t v61 = a6;
  int v54 = (unsigned int *)a3;
  uint64_t v55 = a10;
  LODWORD(v65) = 0;
  for (unsigned int i = 1; ; ++i)
  {
    while (1)
    {
      uint64_t v30 = v61;
      uint64_t v31 = v60;
      uint64_t v32 = v55;
      uint64_t v33 = _HashNode.UnsafeHandle.itemPtr(at:)(i - 1, (uint64_t)a3, (uint64_t)v62);
      uint64_t v63 = v58;
      uint64_t v64 = v57;
      uint64_t v34 = MEMORY[0x1895F8858](v33);
      *(&v46 - 6) = v30;
      *(&v46 - 5) = v31;
      *(&v46 - 4) = v59;
      *(&v46 - 3) = v32;
      *(&v46 - 2) = v34;
      swift_getTupleTypeMetadata2();
      uint64_t v35 = sub_188DF83F0();
      MEMORY[0x1895D7620](MEMORY[0x189618B38], v35);
      if ((sub_188DF806C() & 1) == 0) {
        break;
      }
      a3 = (__int32 *)v54;
      _HashNode.Builder.copyCollisions(from:upTo:)((uint64_t)v54, v62, i - 1, v53);
      if (i >= v56) {
        goto LABEL_19;
      }
LABEL_7:
      LODWORD(v65) = 1;
      ++i;
    }

    if (i >= v56) {
      goto LABEL_18;
    }
    LODWORD(v65) = 0;
    a3 = (__int32 *)v54;
  }

  uint64_t v36 = (uint64_t)v49;
  uint64_t v37 = *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v38 = (uint64_t)&v49[v37];
  uint64_t v39 = v33 + v37;
  (*(void (**)(char *, uint64_t))(*(void *)(v61 - 8) + 16LL))(v49, v33);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v60 - 8) + 16LL))(v38, v39);
  _HashNode.Builder.addNewCollision(_:_:_:)(v51, v36, v38, *v62, v53);
LABEL_13:
  a3 = (__int32 *)v54;
  if (i < v56) {
    goto LABEL_7;
  }
LABEL_19:
  uint64_t v44 = v47;
  uint64_t v43 = v48;
  uint64_t v45 = v53;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v47 + 32))(v48, v52, v53);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v44 + 56))(v43, 0LL, 1LL, v45);
}

uint64_t sub_188DE17B8@<X0>( uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v17 = (int *)nullsub_1(a3 + 16, a3 + 32, a7, a10, a11);
  return sub_188DE1860(v17, v18, a1, a2, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_188DE1860@<X0>( int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v13 = v12;
  uint64_t v72 = a6;
  uint64_t v73 = a7;
  uint64_t v74 = a3;
  uint64_t v80 = a2;
  uint64_t v77 = a9;
  uint64_t v79 = a11;
  uint64_t v18 = type metadata accessor for _HashNode.Builder(255LL, a8, a10, a12);
  uint64_t v19 = sub_188DF8384();
  uint64_t v20 = MEMORY[0x1895F8858](v19);
  uint64_t v76 = v18;
  uint64_t v21 = MEMORY[0x1895F8858](v20);
  uint64_t v22 = *(void *)(a10 - 8);
  uint64_t v23 = MEMORY[0x1895F8858](v21);
  uint64_t v24 = *(void *)(a8 - 8);
  uint64_t v25 = MEMORY[0x1895F8858](v23);
  uint64_t v33 = (char *)&v66 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v75 = a4;
  uint64_t v34 = (*a4 >> a5) & 0x1FLL;
  int v35 = *a1;
  int v36 = 1 << (*a4 >> a5);
  uint64_t v78 = v13;
  if ((v36 & v35) != 0)
  {
    uint64_t v67 = v26;
    uint64_t v68 = v22;
    uint64_t v69 = v29;
    uint64_t v70 = v27;
    int v71 = v34;
    v31.i32[0] = (v36 - 1) & v35;
    uint8x8_t v37 = (uint8x8_t)vcnt_s8(v31);
    v37.i16[0] = vaddlv_u8(v37);
    uint64_t v38 = _HashNode.UnsafeHandle.itemPtr(at:)(v37.u32[0], (uint64_t)a1, v80);
    uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 16);
    v39(v33, v38, a8);
    uint64_t v40 = sub_188DF5A9C();
    uint64_t v41 = *(void (**)(char *, uint64_t))(v24 + 8);
    v41(v33, a8);
    v39(v33, v38, a8);
    unint64_t v42 = _HashNode.UnsafeHandle.find(_:_:_:)(a5, (uint64_t)v33, v40, v74, (uint64_t)v75, a8, a10, a12);
    v41(v33, a8);
    if (v42 == 2LL)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56))(v77, 1LL, 1LL, v76);
    }

    else
    {
      unint64_t v55 = HIDWORD(v42);
      uint64_t v56 = v67;
      uint64_t v57 = v69;
      _HashNode._removingItemFromLeaf(_:at:_:)((uint64_t)v33, v67, v69, a5, v71, v55, v72, v73, a8, a10, a12);
      (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v56, a10);
      v41(v33, a8);
      uint64_t v58 = v70;
      uint64_t v59 = v77;
      uint64_t v60 = v57;
      uint64_t v61 = v76;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 32))(v77, v60, v76);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v58 + 56))(v59, 0LL, 1LL, v61);
    }
  }

  else
  {
    uint64_t v44 = v80;
    uint64_t v45 = v79;
    int v46 = a1[1];
    if ((v46 & v36) != 0)
    {
      v31.i32[0] = v46 & (v36 - 1);
      uint8x8_t v47 = (uint8x8_t)vcnt_s8(v31);
      v47.i16[0] = vaddlv_u8(v47);
      uint64_t v75 = (void *)v25;
      int v71 = v34;
      uint64_t v80 = v28;
      uint64_t v48 = v30;
      unsigned int v49 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v47.u32[0], a1, v44, a8, v79, a12);
      uint64_t v51 = *v49;
      uint64_t v50 = v49[1];
      swift_retain();
      _HashNode._subtracting<A>(_:_:)((a5 + 5), v51, v50, v72, v73, a8, a10, v45, a12);
      uint64_t v52 = swift_release();
      MEMORY[0x1895F8858](v52);
      *(&v66 - 6) = a8;
      *(&v66 - 5) = a10;
      uint64_t v62 = v45;
      uint64_t v63 = a12;
      char v64 = a5;
      char v65 = v71;
      uint64_t v53 = (uint64_t)v75;
      sub_188D1BE44( (void (*)(char *, char *))sub_188D61E94,  (uint64_t)(&v66 - 8),  MEMORY[0x18961A520],  v76,  v54,  v77);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v80 + 8))(v48, v53);
    }

    else
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v77, 1LL, 1LL, v76);
    }
  }

uint64_t sub_188DE1C74@<X0>( int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, uint64_t, uint64_t)@<X3>, unsigned int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v18 = (void (*)(uint64_t, uint64_t, uint64_t))nullsub_1(a3 + 16, a3 + 32, a8, a11, a12);
  return sub_188DE1D20(v18, v19, a5, a1, a2, a6, a7, a3, a9, a4, a8, a10, a11, a12);
}

uint64_t sub_188DE1D20@<X0>( void (*a1)(uint64_t, uint64_t, uint64_t)@<X0>, void *a2@<X1>, uint64_t a3@<X2>, int *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, void (*a10)(uint64_t, uint64_t, uint64_t), uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v92 = a8;
  uint64_t v95 = a6;
  uint64_t v96 = a7;
  uint64_t v102 = a5;
  uint64_t v103 = a9;
  uint64_t v97 = a1;
  uint64_t v100 = a13;
  uint64_t v17 = type metadata accessor for _HashNode.Builder(255LL, a11, a12, a14);
  uint64_t v18 = sub_188DF8384();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x1895F8858](v18);
  uint64_t v21 = MEMORY[0x1895F8858](v20);
  uint64_t v101 = v17;
  uint64_t v22 = MEMORY[0x1895F8858](v21);
  uint64_t v23 = MEMORY[0x1895F8858](v22);
  uint64_t v24 = MEMORY[0x1895F8858](v23);
  uint64_t v25 = MEMORY[0x1895F8858](v24);
  uint64_t v27 = (char *)&v85 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = *(void *)(a11 - 8);
  uint64_t v29 = MEMORY[0x1895F8858](v25);
  uint64_t v40 = (char *)&v85 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v98 = a2;
  uint64_t v41 = a3;
  uint64_t v42 = (*a2 >> a3) & 0x1FLL;
  int v43 = *a4;
  int v44 = 1 << (*a2 >> a3);
  if ((v44 & *a4) != 0)
  {
    uint64_t v92 = v31;
    int v93 = v42;
    int v94 = v34;
    uint64_t v99 = v35;
    v38.i32[0] = (v44 - 1) & v43;
    uint8x8_t v45 = (uint8x8_t)vcnt_s8(v38);
    v45.i16[0] = vaddlv_u8(v45);
    LODWORD(v91) = v45.i32[0];
    uint64_t v46 = v102;
    uint64_t v102 = v36;
    uint64_t v47 = _HashNode.UnsafeHandle.itemPtr(at:)(v45.u32[0], (uint64_t)a4, v46);
    uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 16);
    v48(v40, v47, a11);
    uint64_t v49 = sub_188DF5A9C();
    uint64_t v50 = *(void (**)(char *, uint64_t))(v28 + 8);
    v50(v40, a11);
    v48(v40, v47, a11);
    LOBYTE(v47) = _HashNode.UnsafeHandle.find(_:_:_:)( v41,  (uint64_t)v40,  v49,  (uint64_t)v97,  (uint64_t)v98,  a11,  v100,  a14);
    v50(v40, a11);
    if (v47 == 2LL)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v99 + 56))(v103, 1LL, 1LL, v101);
    }

    else
    {
      uint64_t v70 = v41;
      uint64_t v71 = v102;
      uint64_t v72 = v94;
      _HashNode._removingItemFromLeaf(_:at:_:)( (uint64_t)v40,  (uint64_t)v27,  (uint64_t)v94,  v70,  v93,  v91,  v95,  v96,  a11,  v102,  a14);
      (*(void (**)(char *, uint64_t))(v92 + 8))(v27, v71);
      v50(v40, a11);
      uint64_t v73 = v99;
      uint64_t v74 = v103;
      uint64_t v75 = v72;
      uint64_t v76 = v101;
      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v99 + 32))(v103, v75, v101);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v73 + 56))(v74, 0LL, 1LL, v76);
    }
  }

  else
  {
    int v52 = a4[1];
    if ((v52 & v44) != 0)
    {
      uint64_t v53 = a3;
      uint64_t v89 = v32;
      uint64_t v90 = v33;
      int v93 = v42;
      int v94 = v34;
      uint64_t v97 = a10;
      uint64_t v98 = (void *)v29;
      v38.i32[0] = v52 & (v44 - 1);
      uint8x8_t v54 = (uint8x8_t)vcnt_s8(v38);
      v54.i16[0] = vaddlv_u8(v54);
      int v88 = v54.i32[0];
      uint64_t v55 = v37;
      uint64_t v91 = v37;
      uint64_t v56 = v30;
      uint64_t v57 = v36;
      uint64_t v99 = v35;
      uint64_t v58 = v19;
      uint64_t v59 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v54.u32[0], a4, v102, a11, v36, a14);
      uint64_t v60 = *v59;
      uint64_t v61 = v59[1];
      uint64_t v86 = v53;
      swift_retain();
      uint64_t v87 = a14;
      uint64_t v62 = v99;
      uint64_t v102 = v57;
      _HashNode._subtracting<A>(_:_:)((v53 + 5), v92, v97, v60, v61, a11, v57, v100, a14);
      swift_release();
      uint64_t v100 = v58;
      (*(void (**)(uint64_t, uint64_t, void *))(v58 + 16))(v56, v55, v98);
      uint64_t v63 = v62;
      uint64_t v64 = v56;
      uint64_t v65 = v101;
      int v66 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v56, 1LL, v101);
      uint64_t v67 = v103;
      if (v66 == 1)
      {
        uint64_t v68 = *(void (**)(uint64_t, void *))(v100 + 8);
        uint64_t v69 = (uint64_t)v98;
        v68(v91, v98);
        v68(v56, (void *)v69);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v63 + 56))(v67, 1LL, 1LL, v65);
      }

      else
      {
        uint64_t v97 = *(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 32);
        uint64_t v77 = v86;
        uint64_t v78 = v90;
        v97(v90, v64, v65);
        uint64_t v79 = v94;
        uint64_t v80 = v77;
        uint64_t v81 = v63;
        int v82 = v93;
        _HashNode._removingChild(_:at:_:)(v77, v93, v88, v95, v96, a11, v102, v87, v94);
        uint64_t v83 = v89;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v81 + 16))(v89, v78, v65);
        _HashNode.Builder.addNewChildBranch(_:_:at:)(v80, v83, v82, v65);
        (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v78, v65);
        (*(void (**)(uint64_t, void *))(v100 + 8))(v91, v98);
        uint64_t v84 = v103;
        v97(v103, (uint64_t)v79, v65);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v81 + 56))(v84, 0LL, 1LL, v65);
      }
    }

    else
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v103, 1LL, 1LL, v101);
    }
  }

uint64_t Heap.init(arrayLiteral:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1;
  uint64_t v3 = sub_188DF8120();
  MEMORY[0x1895D7620](MEMORY[0x189618470], v3);
  return Heap.init<A>(_:)((uint64_t)&v5, a2, v3);
}

uint64_t sub_188DE2318@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = Heap.init(arrayLiteral:)(a1, *(void *)(a2 + 16));
  *a3 = result;
  return result;
}

BOOL OrderedSet.isStrictSuperset(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = _s19CollectionsInternal4HeapV5countSivg_0();
  return _s19CollectionsInternal4HeapV5countSivg_0() < v10 && OrderedSet.isSubset(of:)(a3, a4, a1, a2, a5);
}

uint64_t OrderedSet.isStrictSuperset(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = _s19CollectionsInternal4HeapV5countSivg_0();
  if (sub_188DF815C() >= v7)
  {
    char v10 = 0;
  }

  else
  {
    uint64_t v9 = type metadata accessor for OrderedSet(0LL, a4, a5, v8);
    MEMORY[0x1895D7620](&protocol conformance descriptor for OrderedSet<A>, v9);
    char v10 = sub_188DF818C();
  }

  return v10 & 1;
}

uint64_t OrderedSet.isStrictSuperset<A>(of:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = *(void *)(a4 - 8);
  uint64_t v46 = a7;
  uint64_t v47 = v13;
  uint64_t v14 = MEMORY[0x1895F8858](a1);
  uint64_t v49 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  uint64_t v18 = (char *)&v43 - v17;
  uint64_t v19 = MEMORY[0x1895F8858](v16);
  uint64_t v21 = (char *)&v43 - v20;
  uint64_t v22 = MEMORY[0x1895F8858](v19);
  uint64_t v50 = (char *)&v43 - v23;
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x1895F8858](v22);
  uint64_t v27 = (char *)&v43 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (type metadata accessor for OrderedSet(0LL, v28, v29, v28) == a5)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, a1, a5);
    swift_dynamicCast();
    char v37 = OrderedSet.isStrictSuperset(of:)(v52[0], v52[1], a2, a3, a4);
    goto LABEL_9;
  }

  uint64_t v51 = a1;
  uint64_t v48 = a2;
  if (sub_188DF8198() == a5)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, v51, a5);
    swift_dynamicCast();
    char v37 = OrderedSet.isStrictSuperset(of:)(v52[0], v48, a3, a4, a6);
    swift_bridgeObjectRelease();
    return v37 & 1;
  }

  uint64_t v45 = *(void *)(a3 + 16);
  if (!v45)
  {
LABEL_20:
    char v37 = 0;
    return v37 & 1;
  }

  uint64_t v30 = a3;
  swift_retain();
  swift_retain();
  sub_188DF8774();
  uint64_t v31 = v47;
  int v44 = *(void (**)(char *, char *, uint64_t))(v47 + 32);
  v44(v50, v21, a4);
  uint64_t v32 = v51;
  uint64_t v33 = v46;
  uint64_t v34 = sub_188DF8000();
  if (v34 != 2)
  {
    char v38 = v34;
    uint64_t v43 = (uint64_t)&v43;
    MEMORY[0x1895F8858](v34);
    *(&v43 - 6) = a4;
    *(&v43 - 5) = a5;
    *(&v43 - 4) = a6;
    *(&v43 - 3) = v33;
    *(&v43 - 2) = v48;
    *(&v43 - 1) = v30;
    if ((sub_188DF8018() & 1) != 0)
    {
      if ((v38 & 1) == 0)
      {
        (*(void (**)(char *, uint64_t))(v31 + 8))(v50, a4);
LABEL_18:
        swift_release();
        swift_release();
        char v37 = 1;
        return v37 & 1;
      }

      uint64_t v39 = 1LL;
      while (v45 != v39)
      {
        uint64_t v40 = v49;
        sub_188DF8774();
        ++v39;
        v44(v18, v40, a4);
        char v41 = sub_188DF8084();
        uint64_t v42 = *(void (**)(char *, uint64_t))(v31 + 8);
        v42(v18, a4);
        if ((v41 & 1) == 0)
        {
          v42(v50, a4);
          goto LABEL_18;
        }
      }
    }

    (*(void (**)(char *, uint64_t))(v31 + 8))(v50, a4);
    swift_release();
    swift_release();
    goto LABEL_20;
  }

  uint64_t v35 = _s19CollectionsInternal4HeapV5countSivg_0();
  uint64_t result = MEMORY[0x1895F8858](v35);
  *(&v43 - 8) = a4;
  *(&v43 - 7) = a5;
  *(&v43 - 6) = a6;
  *(&v43 - 5) = v33;
  *(&v43 - 4) = v32;
  *(&v43 - 3) = v48;
  *(&v43 - 2) = v30;
  if (result < 0)
  {
    __break(1u);
  }

  else
  {
    LOBYTE(v52[0]) = 2;
    uint64_t result = (uint64_t)sub_188DC2478( (unint64_t)(result + 63) >> 6,  v52,  (void *(*)(char *__return_ptr, _BYTE **))sub_188DE2BE4);
    if (LOBYTE(v52[0]) != 2)
    {
      char v37 = v52[0] & 1;
      (*(void (**)(char *, uint64_t))(v31 + 8))(v50, a4);
LABEL_9:
      swift_release();
      swift_release();
      return v37 & 1;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_188DE28EC@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, BOOL *a8@<X8>)
{
  uint64_t v35 = a8;
  uint64_t v39 = a3;
  uint64_t v40 = a7;
  uint64_t v42 = a4;
  uint64_t v41 = a2;
  char v38 = a1;
  uint64_t v36 = *(void *)(a5 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_188DF8384();
  uint64_t v13 = MEMORY[0x1895F8858](v12);
  uint64_t v15 = (char *)&v33 - v14;
  uint64_t v16 = *(void *)(a6 - 8);
  MEMORY[0x1895F8858](v13);
  uint64_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v34 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v21 = (char *)&v33 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v41, a6);
  sub_188DF7FDC();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v41 = AssociatedTypeWitness;
  uint64_t v37 = AssociatedConformanceWitness;
  sub_188DF84D4();
  uint64_t v23 = v36;
  uint64_t v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
  uint64_t v25 = 0LL;
  if (v24(v15, 1LL, a5) == 1)
  {
LABEL_2:
    (*(void (**)(char *, uint64_t))(v34 + 8))(v21, v41);
    uint64_t result = _s19CollectionsInternal4HeapV5countSivg_0();
    BOOL v27 = v25 < result;
LABEL_14:
    *uint64_t v35 = v27;
  }

  else
  {
    uint64_t v25 = 0LL;
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
    v28(v11, v15, a5);
    while (1)
    {
      uint64_t result = OrderedSet._find(_:)();
      if ((v29 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t))(v23 + 8))(v11, a5);
LABEL_13:
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v21, v41);
        BOOL v27 = 0;
        goto LABEL_14;
      }

      if (result < 0) {
        break;
      }
      uint64_t v30 = ((unint64_t)result >> 3) & 0x1FFFFFFFFFFFFFF8LL;
      uint64_t v31 = *(void *)(*v38 + v30);
      *(void *)(*v38 + v30) = v31 | (1LL << result);
      if ((v31 & (1LL << result)) != 0)
      {
        (*(void (**)(char *, uint64_t))(v23 + 8))(v11, a5);
      }

      else
      {
        ++v25;
        uint64_t v32 = _s19CollectionsInternal4HeapV5countSivg_0();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v11, a5);
        if (v25 == v32) {
          goto LABEL_13;
        }
      }

      sub_188DF84D4();
      if (v24(v15, 1LL, a5) == 1) {
        goto LABEL_2;
      }
      v28(v11, v15, a5);
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_188DE2BE4@<X0>(void *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_188DE28EC(a1, v2[6], v2[7], v2[8], v2[2], v2[3], v2[4], a2);
}

uint64_t BitSet.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0LL; i != v4; ++i)
    {
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
      sub_188DF893C();
      if (v2) {
        break;
      }
    }

    swift_bridgeObjectRelease();
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

int64_t BitSet.init(from:)(void *a1)
{
  int64_t v3 = (int64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_188DF8AD4();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1(v8, v8[3]);
    uint64_t v4 = sub_188DF88F4();
    uint64_t v6 = sub_188D58CD4(v8, v4, v5 & 1);
    int64_t v3 = _s19CollectionsInternal6BitSetV6_wordsACSayAA07_UnsafecD0V5_WordVG_tcfC_0((int64_t)v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_188DE2DB0@<X0>(void *a1@<X0>, int64_t *a2@<X8>)
{
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  uint64_t v5 = sub_188DF88F4();
  uint64_t v7 = sub_188D58CD4(v10, v5, v6 & 1);
  int64_t v8 = _s19CollectionsInternal6BitSetV6_wordsACSayAA07_UnsafecD0V5_WordVG_tcfC_0((int64_t)v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v8;
  return result;
}

uint64_t sub_188DE2E8C(void *a1)
{
  return BitSet.encode(to:)(a1, *v1);
}

uint64_t static OrderedSet._UnstableInternals.isConsistencyCheckingEnabled.getter()
{
  return 0LL;
}

char *OrderedSet._UnstableInternals.hashTableContents.getter(uint64_t a1)
{
  if (!a1) {
    return (char *)MEMORY[0x18961AFE8];
  }
  uint64_t v1 = (void *)(a1 + 16);
  uint64_t v2 = a1 + 32;
  swift_retain();
  int64_t v3 = sub_188D4B608(v1, v2);
  swift_release();
  return v3;
}

int64_t OrderedSet.init<A>(_scale:bias:contents:)( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *(void *)(a5 - 8);
  MEMORY[0x1895F8858](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))( (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v14,  v15);
  uint64_t v16 = sub_188DF812C();
  int64_t v17 = _s19CollectionsInternal4HeapV5countSivg_0();
  int64_t result = sub_188D52F00(v17);
  if ((a2 & 0x8000000000000000LL) != 0 || a1 > 56 || result > a1)
  {
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  unint64_t v19 = 1LL;
  if (a1)
  {
    unint64_t v19 = (1LL << a1) - 1;
    if (__OFSUB__(1LL << a1, 1LL)) {
      goto LABEL_24;
    }
  }

  if (v19 <= a2) {
    goto LABEL_20;
  }
  if (a1 <= 4 && a2) {
    goto LABEL_25;
  }
  uint64_t v24 = a3;
  if (a1 <= 5) {
    uint64_t v20 = 5LL;
  }
  else {
    uint64_t v20 = a1;
  }
  uint64_t v21 = _s19CollectionsInternal10_HashTableV5scale13reservedScaleACSi_SitcfC_0(v20, 0LL);
  swift_beginAccess();
  _HashTable.Header.bias.setter(a2);
  int64_t result = sub_188DE3120((void *)(v21 + 16), v21 + 32, v16, a4, a5, a6);
  if ((result & 1) == 0) {
    goto LABEL_21;
  }
  if (a1 >= 5)
  {
    swift_retain();
    uint64_t v22 = v21;
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  uint64_t v23 = OrderedSet.init(_uniqueElements:_:)(v16, v22);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v24, a5);
  int64_t result = OrderedSet._scale.getter(v23);
  if (result == a1)
  {
    int64_t result = OrderedSet._bias.getter(v23);
    if (result == a2) {
      return v23;
    }
    goto LABEL_23;
  }

uint64_t sub_188DE3120(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = a3;
  uint64_t v9 = sub_188DF8738();
  uint64_t v10 = MEMORY[0x1895D7620](MEMORY[0x189619588], v9);
  return _HashTable.UnsafeHandle.fill<A>(untilFirstDuplicateIn:)((char *)&v13, (uint64_t)&v12, a1, a2, v9, v10, a6) & 1;
}

uint64_t TreeSet.description.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7[0] = a1;
  v7[1] = a2;
  v7[2] = a3;
  uint64_t v5 = type metadata accessor for TreeSet(0LL, a4, a5, a4);
  MEMORY[0x1895D7620](&protocol conformance descriptor for TreeSet<A>, v5);
  return _arrayDescription<A>(for:debug:typeName:)((uint64_t)v7, 0, 0LL, 0LL, v5);
}

uint64_t sub_188DE3208(uint64_t a1, uint64_t a2)
{
  return sub_188DE32C4(a1, a2, TreeSet.description.getter);
}

uint64_t TreeSet.debugDescription.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v14[0] = a1;
  v14[1] = a2;
  v14[2] = a3;
  uint64_t v7 = sub_188DE32DC();
  uint64_t v9 = v8;
  uint64_t v11 = type metadata accessor for TreeSet(0LL, a4, a5, v10);
  MEMORY[0x1895D7620](&protocol conformance descriptor for TreeSet<A>, v11);
  uint64_t v12 = _arrayDescription<A>(for:debug:typeName:)((uint64_t)v14, 1, v7, v9, v11);
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_188DE32B8(uint64_t a1, uint64_t a2)
{
  return sub_188DE32C4(a1, a2, TreeSet.debugDescription.getter);
}

uint64_t sub_188DE32C4( uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void, void, void, void))
{
  return a3(*v3, v3[1], v3[2], *(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_188DE32DC()
{
  return 0x3C74655365657254LL;
}

uint64_t TreeDictionary.Values._base.getter()
{
  return swift_retain();
}

uint64_t TreeDictionary.Values._base.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = swift_release();
  *int64_t v3 = a1;
  v3[1] = a2;
  v3[2] = a3;
  return result;
}

uint64_t (*TreeDictionary.Values._base.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

uint64_t TreeDictionary.values.getter()
{
  return swift_retain();
}

uint64_t TreeDictionary.Values.description.getter( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v8[0] = a1;
  v8[1] = a2;
  v8[2] = a3;
  uint64_t v6 = type metadata accessor for TreeDictionary.Values(0LL, a4, a5, a6);
  MEMORY[0x1895D7620](&protocol conformance descriptor for TreeDictionary<A, B>.Values, v6);
  return _arrayDescription<A>(for:debug:typeName:)((uint64_t)v8, 0, 0LL, 0LL, v6);
}

uint64_t type metadata accessor for TreeDictionary.Values(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TreeDictionary.Values);
}

uint64_t sub_188DE3464(void *a1, uint64_t a2)
{
  return sub_188D3DB2C(a1, a2, TreeDictionary.Values.description.getter);
}

uint64_t TreeDictionary.Values.debugDescription.getter( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v15[0] = a1;
  v15[1] = a2;
  v15[2] = a3;
  uint64_t v13 = sub_188DAB480();
  uint64_t v14 = v9;
  sub_188DF7EE0();
  uint64_t v10 = type metadata accessor for TreeDictionary.Values(0LL, a4, a5, a6);
  MEMORY[0x1895D7620](&protocol conformance descriptor for TreeDictionary<A, B>.Values, v10);
  uint64_t v11 = _arrayDescription<A>(for:debug:typeName:)((uint64_t)v15, 1, v13, v14, v10);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_188DE3544(void *a1, uint64_t a2)
{
  return sub_188D3DB2C(a1, a2, TreeDictionary.Values.debugDescription.getter);
}

uint64_t TreeDictionary.Values.Iterator._base.getter@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TreeDictionary.Iterator(0LL, a1[2], a1[3], a1[4]);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, v2, v4);
}

__n128 TreeDictionary.Values.Iterator._base.setter(uint64_t a1)
{
  __int128 v3 = v1[7];
  v11[6] = v1[6];
  v12[0] = v3;
  *(_OWORD *)((char *)v12 + 11) = *(_OWORD *)((char *)v1 + 123);
  __int128 v4 = v1[3];
  v11[2] = v1[2];
  v11[3] = v4;
  __int128 v5 = v1[5];
  v11[4] = v1[4];
  v11[5] = v5;
  __int128 v6 = v1[1];
  v11[0] = *v1;
  v11[1] = v6;
  sub_188CFE7A8((uint64_t)v11);
  __int128 v7 = *(_OWORD *)(a1 + 112);
  v1[6] = *(_OWORD *)(a1 + 96);
  v1[7] = v7;
  *(_OWORD *)((char *)v1 + 123) = *(_OWORD *)(a1 + 123);
  __int128 v8 = *(_OWORD *)(a1 + 48);
  v1[2] = *(_OWORD *)(a1 + 32);
  v1[3] = v8;
  __int128 v9 = *(_OWORD *)(a1 + 80);
  v1[4] = *(_OWORD *)(a1 + 64);
  v1[5] = v9;
  __n128 result = *(__n128 *)(a1 + 16);
  *uint64_t v1 = *(_OWORD *)a1;
  v1[1] = result;
  return result;
}

uint64_t (*TreeDictionary.Values.Iterator._base.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

__n128 TreeDictionary.Values.Iterator.init(_base:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 112) = v2;
  *(_OWORD *)(a2 + 123) = *(_OWORD *)(a1 + 123);
  __int128 v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v3;
  __int128 v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v4;
  __n128 result = *(__n128 *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t TreeDictionary.Values.Iterator.next()@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v7 = sub_188DF8384();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  uint64_t v10 = (char *)&v14 - v9;
  uint64_t v11 = (void *)type metadata accessor for TreeDictionary.Iterator(0LL, v5, v4, a1[4]);
  TreeDictionary.Iterator.next()(v11, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48LL))( v10,  1LL,  TupleTypeMetadata2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))( a2,  1LL,  1LL,  v4);
  }

  else
  {
    uint64_t v13 = *(void *)(v4 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(a2, &v10[*(int *)(TupleTypeMetadata2 + 48)], v4);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(a2, 0LL, 1LL, v4);
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v10, v5);
  }

uint64_t TreeDictionary.Values.makeIterator()@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v3 = v9[0];
  a2[6] = v8[6];
  a2[7] = v3;
  *(_OWORD *)((char *)a2 + 123) = *(_OWORD *)((char *)v9 + 11);
  __int128 v4 = v8[3];
  a2[2] = v8[2];
  a2[3] = v4;
  __int128 v5 = v8[5];
  a2[4] = v8[4];
  a2[5] = v5;
  __int128 v6 = v8[1];
  *a2 = v8[0];
  a2[1] = v6;
  return swift_retain();
}

__n128 sub_188DE37FC@<Q0>(uint64_t a1@<X8>)
{
  __int128 v3 = v8[0];
  *(_OWORD *)(a1 + 96) = v7[6];
  *(_OWORD *)(a1 + 112) = v3;
  *(_OWORD *)(a1 + 123) = *(_OWORD *)((char *)v8 + 11);
  __int128 v4 = v7[3];
  *(_OWORD *)(a1 + 32) = v7[2];
  *(_OWORD *)(a1 + 48) = v4;
  __int128 v5 = v7[5];
  *(_OWORD *)(a1 + 64) = v7[4];
  *(_OWORD *)(a1 + 80) = v5;
  __n128 result = (__n128)v7[1];
  *(_OWORD *)a1 = v7[0];
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_188DE3874(uint64_t a1)
{
  return sub_188DF8240();
}

uint64_t sub_188DE38A8(uint64_t a1)
{
  return sub_188DF824C();
}

double TreeDictionary.Values.startIndex.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_188D6589C((void (*)(__int128 *__return_ptr))TreeDictionary.startIndex.getter, a1);
}

double TreeDictionary.Values.endIndex.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_188D6589C((void (*)(__int128 *__return_ptr))TreeDictionary.endIndex.getter, a1);
}

uint64_t TreeDictionary.Values.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a5 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  TreeDictionary.subscript.getter((uint64_t)v8, v9, v10, v11, v12, v13, a5, v15, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a5);
}

__n128 TreeDictionary.Values.index(after:)@<Q0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  __int128 v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)a1;
  *(_OWORD *)&v12[16] = v6;
  *(void *)&v12[30] = *(void *)(a1 + 30);
  TreeDictionary.formIndex(after:)((uint64_t)v12, a2, a3, a4);
  uint64_t v7 = *(void *)&v12[24];
  int v8 = *(_DWORD *)&v12[32];
  char v9 = v12[36];
  char v10 = v12[37];
  __n128 result = *(__n128 *)&v12[8];
  *(void *)a5 = *(void *)v12;
  *(__n128 *)(a5 + 8) = result;
  *(void *)(a5 + 24) = v7;
  *(_DWORD *)(a5 + 32) = v8;
  *(_BYTE *)(a5 + 36) = v9;
  *(_BYTE *)(a5 + 37) = v10;
  return result;
}

double TreeDictionary.Values.index(_:offsetBy:)@<D0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  double result = *(double *)&v8;
  __int128 v7 = *(_OWORD *)v9;
  *(_OWORD *)a5 = v8;
  *(_OWORD *)(a5 + 16) = v7;
  *(void *)(a5 + 30) = *(void *)&v9[14];
  return result;
}

uint64_t TreeDictionary.Values.index(_:offsetBy:limitedBy:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v12 = sub_188DF8384();
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(*(void *)(v12 - 8) + 32LL))(a8, v14, v12);
}

void sub_188DE3ABC()
{
}

void sub_188DE3ACC()
{
}

double sub_188DE3ADC@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_188D65AB8( a1,  (void (*)(__int128 *__return_ptr, void, void, void, void, void, void))TreeDictionary.Values.startIndex.getter,  a2);
}

double sub_188DE3AE8@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_188D65AB8( a1,  (void (*)(__int128 *__return_ptr, void, void, void, void, void, void))TreeDictionary.Values.endIndex.getter,  a2);
}

void (*sub_188DE3AF4(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  __int128 v7 = (char *)malloc(0x50uLL);
  *a1 = v7;
  __int128 v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)__int128 v7 = *(_OWORD *)a2;
  *((_OWORD *)v7 + 1) = v8;
  *(void *)(v7 + 30) = *(void *)(a2 + 30);
  *((void *)v7 + 9) = sub_188DE3B70( (void *)v7 + 5,  (uint64_t)v7,  *v3,  v3[1],  v3[2],  *(void *)(a3 + 16),  *(void *)(a3 + 24));
  return sub_188D5CBE4;
}

void (*sub_188DE3B70( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(void *a1)
{
  uint64_t v12 = *(void *)(a7 - 8);
  *a1 = a7;
  a1[1] = v12;
  a1[2] = malloc(*(void *)(v12 + 64));
  TreeDictionary.Values.subscript.getter(a2, a3, a4, a5, a6);
  return sub_188D5CC98;
}

uint64_t sub_188DE3C10(void *a1)
{
  return TreeDictionary.Values.isEmpty.getter(*v1, v1[1], v1[2], a1[2], a1[3], a1[4]);
}

uint64_t sub_188DE3C28(void *a1)
{
  return TreeDictionary.Values.count.getter(*v1, v1[1], v1[2], a1[2], a1[3], a1[4]);
}

double sub_188DE3C40@<D0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v5 = a1[1];
  __int128 v10 = *a1;
  v11[0] = v5;
  *(void *)((char *)v11 + 14) = *(void *)((char *)a1 + 30);
  TreeDictionary.Values.index(_:offsetBy:)((uint64_t)&v10, a2, *v3, v3[2], (uint64_t)&v8);
  double result = *(double *)&v8;
  __int128 v7 = *(_OWORD *)v9;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v7;
  *(void *)(a3 + 30) = *(void *)&v9[14];
  return result;
}

uint64_t sub_188DE3CA8@<X0>( __int128 *a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  __int128 v7 = a1[1];
  __int128 v17 = *a1;
  v18[0] = v7;
  *(void *)((char *)v18 + 14) = *(void *)((char *)a1 + 30);
  __int128 v8 = a3[1];
  __int128 v19 = *a3;
  v20[0] = v8;
  *(void *)((char *)v20 + 14) = *(void *)((char *)a3 + 30);
  uint64_t v9 = *v5;
  uint64_t v10 = v5[2];
  uint64_t v11 = a4[2];
  uint64_t v12 = a4[3];
  uint64_t v13 = a4[4];
  TreeDictionary.Values.index(_:offsetBy:limitedBy:)( (uint64_t)&v17,  a2,  (uint64_t)&v19,  v9,  v10,  v11,  v12,  (uint64_t)v16,  v13);
  type metadata accessor for TreeDictionary.Index(255LL, v11, v12, v13);
  uint64_t v14 = sub_188DF8384();
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(*(void *)(v14 - 8) + 32LL))(a5, v16, v14);
}

uint64_t sub_188DE3D5C(__int128 *a1, __int128 *a2, void *a3)
{
  __int128 v4 = a1[1];
  __int128 v7 = *a1;
  v8[0] = v4;
  *(void *)((char *)v8 + 14) = *(void *)((char *)a1 + 30);
  __int128 v5 = a2[1];
  __int128 v9 = *a2;
  v10[0] = v5;
  *(void *)((char *)v10 + 14) = *(void *)((char *)a2 + 30);
  return ((uint64_t (*)(__int128 *, __int128 *, void, void, void, void, void, void))TreeDictionary.Values.distance(from:to:))( &v7,  &v9,  *v3,  v3[1],  v3[2],  a3[2],  a3[3],  a3[4]);
}

double sub_188DE3DB4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result = *(double *)&v6;
  __int128 v5 = *(_OWORD *)v7;
  *(_OWORD *)a2 = v6;
  *(_OWORD *)(a2 + 16) = v5;
  *(void *)(a2 + 30) = *(void *)&v7[14];
  return result;
}

uint64_t sub_188DE3E08(uint64_t a1, void *a2)
{
  return TreeDictionary.Values.formIndex(after:)(a1, *v2, v2[1], v2[2], a2[2], a2[3], a2[4]);
}

uint64_t type metadata accessor for TreeDictionary.Values.Iterator( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for TreeDictionary.Values.Iterator);
}

uint64_t sub_188DE3E2C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v5 = sub_188DF833C();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1895F8858](v5);
  __int128 v9 = (char *)&v16 - v8;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](v7);
  uint64_t v12 = (char *)&v16 - v11;
  char v13 = sub_188DF7CDC();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, a2, v5);
  if ((v13 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
    goto LABEL_5;
  }

  char v14 = sub_188DF7CC4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
  if ((v14 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_188DE3FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_188DF833C();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](v4);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v6);
  uint64_t v10 = (char *)&v17 - v9;
  char v11 = sub_188DF7CDC();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, a1, v4);
  v12(v8, a2, v4);
  if ((v11 & 1) == 0)
  {
    uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v16)(v10, v4);
    goto LABEL_5;
  }

  char v13 = sub_188DF7CDC();
  char v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v14)(v10, v4);
  if ((v13 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

BOOL BitSet.isSubset(of:)(void *a1, void *a2)
{
  unint64_t v2 = a2[2];
  if (a1[2] < v2) {
    return 0LL;
  }
  if (!v2) {
    return 1LL;
  }
  if ((a2[4] & ~a1[4]) != 0LL) {
    return 0LL;
  }
  uint64_t v4 = a2 + 5;
  uint64_t v5 = a1 + 5;
  unint64_t v6 = v2 - 1;
  do
  {
    BOOL result = v6 == 0;
    if (!v6) {
      break;
    }
    uint64_t v8 = *v4++;
    uint64_t v7 = v8;
    uint64_t v9 = *v5++;
    --v6;
  }

  while ((v7 & ~v9) == 0);
  return result;
}

unint64_t BitSet.isSubset(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 <= 0) {
    unint64_t v3 = 0LL;
  }
  else {
    unint64_t v3 = a1 & ~(a1 >> 63);
  }
  return _UnsafeBitSet.isSubset(of:)(v3, a2 & ~(a2 >> 63), (void *)(a3 + 32), *(void *)(a3 + 16));
}

uint64_t BitSet.isSubset<A>(of:)(uint64_t a1, char *a2, ValueMetadata *a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v53 - v9;
  Description = (void (**)(char *, void, ValueMetadata *))a3[-1].Description;
  uint64_t v12 = MEMORY[0x1895F8858](v8);
  char v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v12);
  uint64_t v16 = (char *)&v53 - v15;
  if (a3 == &type metadata for BitSet)
  {
    Description[2]((char *)&v53 - v15, a1, &type metadata for BitSet);
LABEL_45:
    swift_dynamicCast();
    char v41 = BitSet.isSubset(of:)((void *)v55, a2);
    swift_bridgeObjectRelease();
    return v41 & 1;
  }

  if (a3 == &type metadata for BitSet.Counted)
  {
    Description[2]((char *)&v53 - v15, a1, &type metadata for BitSet.Counted);
    goto LABEL_45;
  }

  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_18C749F60);
  if ((ValueMetadata *)result == a3)
  {
    Description[2](v14, a1, a3);
    swift_dynamicCast();
    if (v56 <= 0) {
      unint64_t v42 = 0LL;
    }
    else {
      unint64_t v42 = v55 & ~(v55 >> 63);
    }
    char v41 = _UnsafeBitSet.isSubset(of:)(v42, v56 & ~(v56 >> 63), (void *)a2 + 4, *((void *)a2 + 2));
    return v41 & 1;
  }

  unint64_t v18 = *((void *)a2 + 2);
  if (!v18) {
    goto LABEL_77;
  }
  uint8x8_t v54 = a2 + 32;
  unint64_t v19 = *((void *)a2 + 4);
  if (!v19)
  {
    if (v18 > 1)
    {
      unint64_t v49 = *((void *)a2 + 5);
      if (v49)
      {
        uint64_t v53 = v7;
        uint64_t v20 = 1LL;
        uint64_t v50 = 64LL;
      }

      else
      {
        uint64_t v51 = 0LL;
        unint64_t v52 = v18 - 2;
        uint64_t v50 = 64LL;
        do
        {
          if (v52 == v51) {
            goto LABEL_77;
          }
          unint64_t v49 = *(void *)&a2[8 * v51++ + 48];
          v50 += 64LL;
        }

        while (!v49);
        if (v50 < 0) {
          goto LABEL_85;
        }
        uint64_t v53 = v7;
        uint64_t v20 = v51 + 1;
      }

      unint64_t v22 = (v49 - 1) & v49;
      uint64_t v21 = (void *)(__clz(__rbit64(v49)) + v50);
      goto LABEL_7;
    }

LABEL_78:
  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, AssociatedTypeWitness);
LABEL_79:
  swift_bridgeObjectRelease();
  char v41 = 1;
  return v41 & 1;
}

    unint64_t v24 = v140;
    uint64_t result = sub_188DF8B34();
    uint64_t v64 = v15 >> 14;
    if ((result & 1) != 0) {
      break;
    }
    a1 = v15 >> 14;
    uint64_t v68 = v139;
    if (v64 >= v9)
    {
      uint64_t v107 = 0LL;
      uint64_t v57 = v135;
      v139 = v135;
      uint64_t v65 = v121;
      goto LABEL_145;
    }
  }

  if (v64 >= a1) {
    goto LABEL_84;
  }
LABEL_188:
  __break(1u);
LABEL_189:
  __break(1u);
LABEL_190:
  __break(1u);
LABEL_191:
  __break(1u);
LABEL_192:
  __break(1u);
LABEL_193:
  __break(1u);
LABEL_194:
  __break(1u);
LABEL_195:
  __break(1u);
  return result;
}

BOOL BitSet.isSubset(of:)(void *a1, uint64_t a2, void *a3)
{
  return BitSet.isSubset(of:)(a1, a3);
}

BOOL BitSet.isEqualSet(to:)(void *a1, void *a2)
{
  return _s19CollectionsInternal6BitSetV2eeoiySbAC_ACtFZ_0(a2, a1);
}

unint64_t BitSet.isEqualSet(to:)(unint64_t a1, unint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000LL) != 0 || (a2 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return _UnsafeBitSet.isEqualSet(to:)(a1, a2, (void *)(a3 + 32), *(void *)(a3 + 16));
  }
}

uint64_t BitSet.isEqualSet<A>(to:)(uint64_t a1, int8x8_t *a2, ValueMetadata *a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v66 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v67 = AssociatedTypeWitness;
  uint64_t v7 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = MEMORY[0x1895F8858](v7);
  uint64_t v12 = (char *)&v66 - v11;
  Description = (void (**)(char *, void, ValueMetadata *))a3[-1].Description;
  uint64_t v14 = MEMORY[0x1895F8858](v10);
  uint64_t v16 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = MEMORY[0x1895F8858](v14);
  unint64_t v19 = (char *)&v66 - v18;
  MEMORY[0x1895F8858](v17);
  uint64_t v21 = (char *)&v66 - v20;
  if (a3 == &type metadata for BitSet)
  {
    Description[2]((char *)&v66 - v20, a1, &type metadata for BitSet);
    swift_dynamicCast();
    uint64_t v23 = (void *)v70;
    unint64_t v24 = a2;
LABEL_8:
    char v22 = _s19CollectionsInternal6BitSetV2eeoiySbAC_ACtFZ_0(v24, v23);
    swift_bridgeObjectRelease();
    return v22 & 1;
  }

  uint64_t v68 = a2;
  if (a3 == &type metadata for BitSet.Counted)
  {
    Description[2]((char *)&v66 - v20, a1, &type metadata for BitSet.Counted);
    swift_dynamicCast();
    uint64_t v23 = (void *)v70;
    unint64_t v24 = v68;
    goto LABEL_8;
  }

  if ((ValueMetadata *)__swift_instantiateConcreteTypeFromMangledName(&qword_18C749F60) == a3)
  {
    Description[2](v19, a1, a3);
    swift_dynamicCast();
    char v22 = 0;
    if ((v70 & 0x8000000000000000LL) == 0 && (v71 & 0x8000000000000000LL) == 0) {
      char v22 = _UnsafeBitSet.isEqualSet(to:)(v70, v71, &v68[4], *(void *)&v68[2]);
    }
    return v22 & 1;
  }

  if ((BitSet.isEmpty.getter((uint64_t)v68) & 1) != 0)
  {
    char v22 = sub_188DF8018();
    return v22 & 1;
  }

  uint64_t v26 = Description[2];
  v26(v16, a1, a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C74A0C8);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
    uint64_t result = sub_188DF7FF4();
    uint64_t v27 = v68 + 4;
    int8x8_t v28 = v68[2];
    if (v28)
    {
      uint64_t v29 = 0LL;
      uint64_t v30 = 8LL * *(void *)&v28;
      int64_t v31 = v68 + 4;
      while (1)
      {
        uint8x8_t v32 = (uint8x8_t)vcnt_s8(*v31);
        v32.i16[0] = vaddlv_u8(v32);
        BOOL v33 = __OFADD__(v29, v32.u32[0]);
        v29 += v32.u32[0];
        if (v33) {
          break;
        }
        ++v31;
        v30 -= 8LL;
        if (!v30)
        {
          if (v29 < result) {
            goto LABEL_51;
          }
          goto LABEL_52;
        }
      }

BOOL BitSet.isEqualSet(to:)(void *a1, uint64_t a2, void *a3)
{
  return _s19CollectionsInternal6BitSetV2eeoiySbAC_ACtFZ_0(a3, a1);
}

uint64_t _HashNode.mapValuesToVoid(copy:extraBytes:)( uint64_t a1, Swift::Int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = MEMORY[0x18961AFC8];
  uint64_t v13 = MEMORY[0x18961AFC8] + 8LL;
  if (a6 != MEMORY[0x18961AFC8] + 8LL)
  {
    MEMORY[0x1895F8858](a1);
    v19[2] = a5;
    v19[3] = v14;
    v19[4] = a7;
    _HashNode.mapValues<A>(_:)( (void (*)(char *, char *))sub_188D651D4,  (uint64_t)v19,  a3,  a4,  a5,  v14,  v13,  a7);
    a3 = v15;
    a4 = v16;
    if (_HashNode.hasFreeSpace(_:)(a2)) {
      return a3;
    }
    goto LABEL_8;
  }

  if ((a1 & 1) != 0 || !_HashNode.hasFreeSpace(_:)(a2))
  {
    swift_retain();
LABEL_8:
    uint64_t v17 = _HashNode.copy(withFreeSpace:)(a2, a3, a4, a5, v12 + 8, a7);
    swift_release();
    return v17;
  }

  swift_retain();
  return a3;
}

void _HashNode.mapValues<A>(_:)( void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = nullsub_1(a3 + 16, a3 + 32, a5, a6, a8);
  sub_188DE50F4(v16, v17, a3, a4, a4, a1, a2, a5, &v18, a6, a7, a8);
}

void sub_188DE50F4( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int64_t a5@<X4>, void (*a6)(char *, char *)@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int64_t v38 = a6;
  uint64_t v39 = a7;
  BOOL v18 = _HashNode.isCollisionNode.getter(a3, a4, a8, a10, a12);
  uint64_t v37 = a9;
  if (v18)
  {
    uint64_t v19 = MEMORY[0x1895F8858](v18);
    uint64_t v33 = a8;
    uint64_t v34 = a10;
    uint64_t v35 = a11;
    uint64_t v36 = a12;
    uint64_t v21 = static _HashNode.allocateCollision<A>(count:_:extraBytes:initializingWith:)( v19,  a5,  v20,  0LL,  (uint64_t (*)(uint64_t))nullsub_1,  (uint64_t)v32,  a8,  a11,  MEMORY[0x18961AFC8] + 8LL,  a12);
  }

  else
  {
    uint64_t v23 = MEMORY[0x1895F8858](v18);
    uint64_t v33 = a8;
    uint64_t v34 = a10;
    uint64_t v35 = a11;
    uint64_t v36 = a12;
    uint64_t v21 = static _HashNode.allocate<A>(itemMap:childMap:count:extraBytes:initializingWith:)( v26,  v23,  v24,  v25,  a5,  0LL,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))nullsub_1,  (uint64_t)v32,  a8,  a11,  MEMORY[0x18961AFC8] + 8LL,  a12);
  }

  uint64_t v27 = v21;
  uint64_t v28 = v22;
  uint64_t v29 = nullsub_1(v21 + 16, v21 + 32, a8, a11, a12);
  sub_188DE52A0(v29, v30, a1, a2, v38, v39, a8, a10, a11, a12);
  if (v12)
  {
    swift_release();
  }

  else
  {
    int64_t v31 = v37;
    *uint64_t v37 = v27;
    v31[1] = v28;
  }

void sub_188DE52A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11 = v10;
  uint64_t v95 = a5;
  uint64_t v96 = a6;
  uint64_t v99 = a4;
  uint64_t v79 = a2;
  uint64_t v16 = a9;
  uint64_t v17 = a10;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v18 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  uint64_t v85 = (char *)&v75 - v19;
  uint64_t v84 = *(void *)(a9 - 8);
  MEMORY[0x1895F8858](v18);
  uint64_t v90 = (char *)&v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v100 = a8;
  uint64_t v88 = swift_getTupleTypeMetadata2();
  uint64_t v92 = *(void *)(v88 - 8);
  uint64_t v21 = MEMORY[0x1895F8858](v88);
  uint64_t v89 = (char *)&v75 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = MEMORY[0x1895F8858](v21);
  uint64_t v87 = (char *)&v75 - v24;
  uint64_t v91 = *(void *)(a7 - 8);
  MEMORY[0x1895F8858](v23);
  uint64_t v101 = (char *)&v75 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = v99;
  uint64_t v98 = _HashNode.UnsafeHandle.reverseItems.getter();
  uint64_t v27 = v79;
  uint64_t v93 = _HashNode.UnsafeHandle.reverseItems.getter();
  uint64_t v29 = v28;
  uint64_t v30 = _HashNode.UnsafeHandle.children.getter(a3, v26, a7, v100, a10);
  uint64_t v80 = _HashNode.UnsafeHandle.children.getter(a1, v27, a7, a9, a10);
  uint64_t v81 = v31;
  uint64_t v105 = 0LL;
  v104[0] = 0LL;
  char v103 = 0;
  uint64_t v78 = a1;
  uint64_t v94 = v29;
  if (v29 < 1)
  {
    uint64_t v62 = 0LL;
LABEL_8:
    if (v62 >= v81)
    {
LABEL_12:
      char v103 = 1;
      sub_188DE58A4(&v103, v93, v94, (uint64_t)&v105, v80, v81, (uint64_t)v104, v78, v79, a7, v100, v16, v17);
    }

    else
    {
      uint64_t v63 = (uint64_t *)(v30 + 16 * v62 + 8);
      while (1)
      {
        uint64_t v65 = *(v63 - 1);
        uint64_t v64 = *v63;
        swift_retain();
        uint64_t v66 = _HashNode.mapValues<A>(_:)(v95, v96, v65, v64, a7, v100, v16, v17);
        uint64_t v68 = v16;
        uint64_t v69 = v17;
        if (v11) {
          break;
        }
        uint64_t v70 = v66;
        uint64_t v71 = v67;
        swift_release();
        v102[0] = v70;
        v102[1] = v71;
        uint64_t v72 = type metadata accessor for _HashNode(0LL, a7, v68, v69);
        uint64_t v73 = v81;
        sub_188DA6E38(v62++, (uint64_t)v102, v80, v81, v72);
        v104[0] = v62;
        v63 += 2;
        uint64_t v16 = v68;
        uint64_t v17 = v69;
        if (v73 == v62) {
          goto LABEL_12;
        }
      }

      swift_release();
      sub_188DE58A4(&v103, v93, v94, (uint64_t)&v105, v80, v81, (uint64_t)v104, v78, v79, a7, v100, v16, v17);
    }
  }

  else
  {
    uint64_t v32 = v100;
    uint64_t v76 = v30;
    uint64_t v77 = a10;
    uint64_t v99 = v10;
    uint64_t v33 = 0LL;
    uint64_t v82 = *(void *)(v92 + 72);
    uint64_t v34 = *(void (**)(char *))(v91 + 16);
    uint64_t v83 = a9;
    while (1)
    {
      uint64_t v36 = v87;
      uint64_t v35 = v88;
      uint64_t v37 = *(int *)(v88 + 48);
      int64_t v38 = &v87[v37];
      uint64_t v39 = v82;
      uint64_t v40 = a7;
      uint64_t v41 = v98 + v82 * v33 + v37;
      v34(v87);
      uint64_t v42 = *(void *)(v32 - 8);
      uint64_t v43 = v32;
      unint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v42 + 16);
      v44(v38, v41, v43);
      ((void (*)(char *, char *, uint64_t))v34)(v101, v36, v40);
      (*(void (**)(char *, uint64_t))(v92 + 8))(v36, v35);
      uint64_t v45 = v105;
      uint64_t v46 = *(int *)(v35 + 48);
      uint64_t v47 = v89;
      uint8x8_t v48 = &v89[v46];
      uint64_t v49 = v98 + v105 * v39 + v46;
      v34(v89);
      uint64_t v50 = v49;
      uint64_t v51 = v100;
      v44(v48, v50, v100);
      unint64_t v52 = v90;
      uint64_t v53 = v99;
      v95(v47, v48);
      uint64_t v99 = v53;
      if (v53)
      {
        uint64_t v74 = *(void (**)(char *, uint64_t))(v91 + 8);
        v74(v101, v40);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v48, v51);
        v74(v47, v40);
        sub_188DE58A4(&v103, v93, v94, (uint64_t)&v105, v80, v81, (uint64_t)v104, v78, v79, v40, v51, v83, v77);
        return;
      }

      (*(void (**)(char *, uint64_t))(v42 + 8))(v48, v51);
      uint64_t v97 = *(void (**)(char *, uint64_t))(v91 + 8);
      v97(v47, v40);
      uint64_t v54 = TupleTypeMetadata2;
      uint64_t v55 = v52;
      uint64_t v56 = v85;
      int8x8_t v57 = &v85[*(int *)(TupleTypeMetadata2 + 48)];
      ((void (*)(char *, char *, uint64_t))v34)(v85, v101, v40);
      uint64_t v58 = v84;
      uint64_t v59 = v57;
      uint64_t v16 = v83;
      (*(void (**)(char *, char *, uint64_t))(v84 + 16))(v59, v55, v83);
      uint64_t v60 = (uint64_t)v56;
      uint64_t v61 = v94;
      sub_188DA6E38(v45, v60, v93, v94, v54);
      (*(void (**)(char *, uint64_t))(v58 + 8))(v55, v16);
      v97(v101, v40);
      uint64_t v33 = v105 + 1;
      uint64_t v32 = v100;
      if (__OFADD__(v105, 1LL)) {
        break;
      }
      a7 = v40;
      ++v105;
      if (v33 >= v61)
      {
        uint64_t v62 = v104[0];
        uint64_t v11 = v99;
        uint64_t v17 = v77;
        uint64_t v30 = v76;
        goto LABEL_8;
      }
    }

    __break(1u);
  }

void sub_188DE58A4( _BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if ((*a1 & 1) == 0)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    uint64_t v14 = sub_188DF83F0();
    MEMORY[0x1895D7620](MEMORY[0x189618B48], v14);
    sub_188DF8270();
    sub_188DE59F4(v17, v18, v19, v20, TupleTypeMetadata2);
    uint64_t v15 = type metadata accessor for _HashNode(255LL, a10, a12, a13);
    uint64_t v16 = sub_188DF83F0();
    MEMORY[0x1895D7620](MEMORY[0x189618B48], v16);
    sub_188DF8270();
    sub_188DE59F4(v17, v18, v19, v20, v15);
    _HashNode.UnsafeHandle.clear()();
  }

uint64_t sub_188DE59F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v5 = *(void *)(*(void *)(a5 - 8) + 72LL);
  uint64_t v6 = a3 + v5 * a1;
  uint64_t v7 = a2 - a1;
  uint64_t result = swift_arrayDestroy();
  __break(1u);
  return result;
}

uint64_t TreeDictionary.init(dictionaryLiteral:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a1;
  swift_getTupleTypeMetadata2();
  uint64_t v7 = sub_188DF8120();
  uint64_t v8 = (void (*)(char *, char *, uint64_t))MEMORY[0x1895D7620](MEMORY[0x189618470], v7);
  uint64_t v9 = sub_188D35274((void (*)(char *, char *, uint64_t))&v11, a2, a3, v7, a4, v8);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_188DE5B10@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v16 = a1;
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  swift_getTupleTypeMetadata2();
  uint64_t v7 = sub_188DF8120();
  uint64_t v8 = a2[4];
  uint64_t v9 = (void (*)(char *, char *, uint64_t))MEMORY[0x1895D7620](MEMORY[0x189618470], v7);
  uint64_t v10 = sub_188D35274((void (*)(char *, char *, uint64_t))&v16, v5, v6, v7, v8, v9);
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v10;
  a3[1] = v12;
  a3[2] = v14;
  return result;
}

uint64_t TreeDictionary<>.hash(into:)( __int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v46 = a8;
  uint64_t v51 = a1;
  uint64_t v44 = *(void *)(a6 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](a1);
  uint64_t v40 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v43 = *(void *)(v14 - 8);
  MEMORY[0x1895F8858](v12);
  uint64_t v39 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v17 = sub_188DF8384();
  uint64_t v49 = *(void *)(v17 - 8);
  uint64_t v50 = v17;
  uint64_t v18 = MEMORY[0x1895F8858](v17);
  uint64_t v48 = (uint64_t)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v18);
  uint64_t v21 = (char *)&v38 - v20;
  TreeDictionary.makeIterator()(a2, (uint64_t)v60);
  uint64_t v41 = a5;
  uint64_t v42 = a6;
  uint64_t v45 = a7;
  uint64_t v47 = (void *)type metadata accessor for TreeDictionary.Iterator(0LL, a5, a6, a7);
  swift_retain();
  uint64_t v22 = 0LL;
  uint64_t v38 = TupleTypeMetadata2;
  uint64_t v24 = v42;
  uint64_t v23 = v43;
  uint64_t v26 = v39;
  uint64_t v25 = v40;
  while (1)
  {
    uint64_t v27 = v48;
    TreeDictionary.Iterator.next()(v47, v48);
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 32))(v21, v27, v50);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48LL))( v21,  1LL,  TupleTypeMetadata2) == 1) {
      break;
    }
    uint64_t v28 = &v21[*(int *)(TupleTypeMetadata2 + 48)];
    uint64_t v29 = v41;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v26, v21, v41);
    uint64_t v30 = v22;
    uint64_t v31 = v44;
    (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v25, v28, v24);
    uint64_t v32 = *((void *)v51 + 8);
    __int128 v33 = v51[1];
    __int128 v52 = *v51;
    __int128 v53 = v33;
    __int128 v34 = v51[3];
    __int128 v54 = v51[2];
    __int128 v55 = v34;
    *(void *)&__int128 v56 = v32;
    sub_188DF7C4C();
    sub_188DF7C4C();
    v61[4] = v54;
    v61[5] = v55;
    uint64_t v62 = v56;
    v61[2] = v52;
    v61[3] = v53;
    uint64_t v35 = sub_188DF8A8C();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v25, v24);
    uint64_t v36 = v29;
    TupleTypeMetadata2 = v38;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v36);
    uint64_t v22 = v35 ^ v30;
  }

  __int128 v58 = v60[6];
  v59[0] = v61[0];
  *(_OWORD *)((char *)v59 + 11) = *(_OWORD *)((char *)v61 + 11);
  __int128 v54 = v60[2];
  __int128 v55 = v60[3];
  __int128 v56 = v60[4];
  __int128 v57 = v60[5];
  __int128 v52 = v60[0];
  __int128 v53 = v60[1];
  sub_188CFE7A8((uint64_t)&v52);
  return sub_188DF8A50();
}

uint64_t TreeDictionary<>.hashValue.getter( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_188DF8A98();
}

uint64_t sub_188DE5F4C(uint64_t *a1, uint64_t a2)
{
  return TreeDictionary<>.hashValue.getter(*v2, v2[1], v2[2], a1[2], a1[3], a1[4], *(void *)(a2 - 8));
}

uint64_t sub_188DE5F68(__int128 *a1, uint64_t *a2, uint64_t a3)
{
  return TreeDictionary<>.hash(into:)(a1, *v3, v3[1], v3[2], a2[2], a2[3], a2[4], *(void *)(a3 - 8));
}

uint64_t sub_188DE5F84(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  sub_188DF8A38();
  TreeDictionary<>.hash(into:)(v7, *v3, v3[1], v3[2], a2[2], a2[3], a2[4], v5);
  return sub_188DF8A98();
}

uint64_t sub_188DE5FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 - 8) + 8LL);
  return MEMORY[0x1895D7620](&protocol conformance descriptor for <> TreeDictionary<A, B>, a1, &v4);
}

BOOL _HashNode.containsKey(_:_:_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  while (1)
  {
    uint64_t v14 = a4 + 32;
    uint64_t v15 = nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
    unint64_t v17 = _HashNode.UnsafeHandle.find(_:_:_:)(a1, a2, a3, v15, v16, a6, a7, a8);
    if ((v17 & 1) == 0) {
      break;
    }
    a4 = *(void *)(v14 + ((v17 >> 28) & 0xFFFFFFFF0LL));
    a1 = (a1 + 5);
  }

  return v17 != 2LL;
}

uint64_t _HashNode.findForInsertion(_:_:_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_188DE6430(a1, a2, a3, a4, a5, a6, a7, a8, _HashNode.UnsafeHandle.findForInsertion(_:_:_:));
}

uint64_t _HashNode.get(_:_:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  while (1)
  {
    uint64_t v15 = a4 + 32;
    uint64_t v16 = nullsub_1(a4 + 16, a4 + 32, a5, a6, a7);
    uint64_t v18 = v17;
    unint64_t v19 = _HashNode.UnsafeHandle.find(_:_:_:)(a1, a2, a3, v16, v17, a5, a6, a7);
    if (v19 == 2LL)
    {
      uint64_t v20 = 1LL;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 - 8) + 56LL))( a8,  v20,  1LL,  a6);
    }

    if ((v19 & 1) == 0) {
      break;
    }
    a4 = *(void *)(v15 + ((v19 >> 28) & 0xFFFFFFFF0LL));
    a1 = (a1 + 5);
  }

  sub_188DE67BC(v16, v18, v19 & 0xFFFFFFFF00000000LL, a5, a6, a7, a8);
  uint64_t v20 = 0LL;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 - 8) + 56LL))(a8, v20, 1LL, a6);
}

uint64_t _HashNode.lookup(_:_:_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  while (1)
  {
    uint64_t v15 = nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
    unint64_t v17 = _HashNode.UnsafeHandle.find(_:_:_:)(a1, a2, a3, v15, v16, a6, a7, a8);
    if ((v17 & 1) == 0) {
      return a4;
    }
    a4 = *(void *)(a4 + 32 + 16 * HIDWORD(v17));
    a1 = (a1 + 5);
  }

  return 0LL;
}

unint64_t _HashNode.UnsafeHandle.find(_:_:_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a6 - 8);
  unsigned __int8 v12 = MEMORY[0x1895F8858](a1);
  unint64_t v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int v20 = *v14;
  int v21 = v14[1];
  if ((v21 & *v14) != 0)
  {
    else {
      return v22 << 32;
    }
  }

  else
  {
    int v24 = 1 << (v13 >> v12);
    if ((v20 & v24) != 0)
    {
      v17.i32[0] = v20 & (v24 - 1);
      uint8x8_t v25 = (uint8x8_t)vcnt_s8(v17);
      v25.i16[0] = vaddlv_u8(v25);
      uint64_t v26 = v25.u32[0];
      uint64_t v27 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v25.u32[0], v14, v15, a6, v16, a8);
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v19, v27, a6);
      char v28 = sub_188DF7D90();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v19, a6);
      if ((v28 & 1) != 0) {
        return v26 << 32;
      }
    }

    else if ((v21 & v24) != 0)
    {
      v17.i32[0] = v21 & (v24 - 1);
      uint8x8_t v29 = (uint8x8_t)vcnt_s8(v17);
      v29.i16[0] = vaddlv_u8(v29);
      return ((unint64_t)v29.u32[0] << 32) | 1;
    }

    return 2LL;
  }

uint64_t _HashNode.find(_:_:_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_188DE6430( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_HashNode.UnsafeHandle.find(_:_:_:));
}

uint64_t sub_188DE6430( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v15 = nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
  return a9(a1, a2, a3, v15, v16, a6, a7, a8);
}

uint64_t _HashNode.UnsafeHandle._findInCollision(_:_:_:)( unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a1 <= 0x3Fu && *a5 != a3) {
    return 2LL;
  }
  uint64_t v7 = _HashNode.UnsafeHandle.reverseItems.getter();
  MEMORY[0x1895F8858](v7);
  swift_getTupleTypeMetadata2();
  uint64_t v5 = sub_188DF83F0();
  MEMORY[0x1895D7620](MEMORY[0x189618B48], v5);
  sub_188DF8234();
  return (v8 & 1) != 0;
}

uint64_t _HashNode.UnsafeHandle.findForInsertion(_:_:_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a6 - 8);
  unsigned __int8 v12 = MEMORY[0x1895F8858](a1);
  unint64_t v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int v20 = *v14;
  int v21 = v14[1];
  if ((v21 & *v14) != 0)
  {
    uint64_t v22 = _HashNode.UnsafeHandle._findInCollision(_:_:_:)(v12, a2, v13, (uint64_t)v14, v15);
    uint64_t v24 = 2147483649LL;
    if (!v22) {
      uint64_t v24 = (v23 << 32) | 0xFF;
    }
    if (v22 == 1) {
      return 0x80000000LL;
    }
    else {
      return v24;
    }
  }

  else
  {
    uint64_t v26 = (v13 >> v12) & 0x1F;
    int v27 = 1 << (v13 >> v12);
    if ((v20 & v27) != 0)
    {
      v17.i32[0] = v20 & (v27 - 1);
      uint8x8_t v28 = (uint8x8_t)vcnt_s8(v17);
      v28.i16[0] = vaddlv_u8(v28);
      uint64_t v29 = v28.u32[0];
      uint64_t v30 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v28.u32[0], v14, v15, a6, v16, a8);
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v19, v30, a6);
      char v31 = sub_188DF7D90();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v19, a6);
      if ((v31 & 1) != 0) {
        return v26 | (v29 << 32);
      }
      else {
        return v26 | (v29 << 32) | 0x40000000;
      }
    }

    else
    {
      int v32 = v27 - 1;
      if ((v21 & v27) != 0)
      {
        v17.i32[0] = v21 & v32;
        uint8x8_t v33 = (uint8x8_t)vcnt_s8(v17);
        v33.i16[0] = vaddlv_u8(v33);
        return v26 | ((unint64_t)v33.u32[0] << 32) | 0x60000000;
      }

      else
      {
        v17.i32[0] = v20 & v32;
        uint8x8_t v34 = (uint8x8_t)vcnt_s8(v17);
        v34.i16[0] = vaddlv_u8(v34);
        return v26 | ((unint64_t)v34.u32[0] << 32) | 0x20000000;
      }
    }
  }

uint64_t sub_188DE67BC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v9 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(HIDWORD(a3), a1, a2, a4, a5, a6);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16LL))( a7,  v9 + *(int *)(TupleTypeMetadata2 + 48),  a5);
}

unint64_t _HashNode.position(forKey:_:_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = a4 + 16;
  uint64_t v15 = a4 + 32;
  uint64_t v16 = nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
  unint64_t v18 = _HashNode.UnsafeHandle.find(_:_:_:)(a2, a1, a3, v16, v17, a6, a7, a8);
  unint64_t v20 = v18;
  if ((v18 & 1) == 0) {
    return HIDWORD(v18);
  }
  uint64_t v21 = nullsub_1(v14, v15, a6, a7, a8);
  sub_188DE695C(v21, v22, v20 & 0xFFFFFFFF00000000LL | 1, a1, a2, a3, a6, a7, (uint64_t)&v23, a8);
  return v23;
}

uint64_t sub_188DE695C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v25 = HIDWORD(a3);
  uint64_t v15 = *(void *)(_HashNode.UnsafeHandle.children.getter(a1, a2, a7, a8, a10) + 16 * HIDWORD(a3));
  swift_retain();
  uint64_t v16 = a4;
  uint64_t v17 = a8;
  uint64_t v18 = _HashNode.position(forKey:_:_:)(v16, (a5 + 5), a6, v15);
  char v20 = v19;
  uint64_t result = swift_release();
  if ((v20 & 1) == 0)
  {
    type metadata accessor for _HashNode(255LL, a7, v17, a10);
    uint64_t v22 = sub_188DF83F0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C74AC60);
    MEMORY[0x1895D7620](MEMORY[0x189618B30], v22);
    sub_188D6D390();
    uint64_t v23 = sub_188DF7D3C();
    MEMORY[0x1895F8858](v23);
    MEMORY[0x1895D7620](MEMORY[0x189618B48], v22);
    uint64_t v24 = sub_188DF8A14();
    MEMORY[0x1895D7620](MEMORY[0x18961A5D8], v24);
    uint64_t result = sub_188DF8054();
    uint64_t v18 = v25;
  }

  *(void *)a9 = v18;
  *(_BYTE *)(a9 + 8) = v20 & 1;
  return result;
}

uint64_t _HashNode.item(position:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x1895F8858](TupleTypeMetadata2);
  uint64_t v17 = (char *)&v22 - v16;
  uint64_t v18 = (unsigned int *)nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
  sub_188DE6CA0(v18, v19, a3, a6, a7, a8, (uint64_t)v17);
  char v20 = &v17[*(int *)(TupleTypeMetadata2 + 48)];
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(a6 - 8) + 32LL))(a1, v17, a6);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(a7 - 8) + 32LL))(a2, v20, a7);
}

uint64_t sub_188DE6CA0@<X0>( unsigned int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v10 = a7;
  LODWORD(a7) = *a1;
  uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)*a1);
  v11.i16[0] = vaddlv_u8(v11);
  if (*a1 == a1[1]) {
    a7 = a7;
  }
  else {
    a7 = v11.u32[0];
  }
  uint64_t v12 = a3 - a7;
  if (a3 < a7)
  {
    uint64_t v13 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(a3, a1, a2, a4, a5, a6);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 16LL))( v10,  v13,  TupleTypeMetadata2);
  }

  uint64_t v16 = _HashNode.UnsafeHandle.children.getter((uint64_t)a1, a2, a4, a5, a6);
  uint64_t v18 = v17;
  uint64_t v19 = type metadata accessor for _HashNode(0LL, a4, a5, a6);
  uint64_t v20 = MEMORY[0x1895D6C60](v16, v18, v19);
  if (v20 == v21) {
    goto LABEL_22;
  }
  if (v21 < v20) {
    goto LABEL_20;
  }
  if (v20 >= v21)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    uint64_t result = sub_188DF881C();
    __break(1u);
    return result;
  }

  uint64_t v22 = v16 + 16 * v20;
  uint64_t v23 = *(void *)(v22 + 8);
  if (v12 >= v23)
  {
    uint64_t v25 = (uint64_t *)(v22 + 24);
    uint64_t v24 = v20;
    while (1)
    {
      BOOL v26 = __OFSUB__(v12, v23);
      v12 -= v23;
      if (v26) {
        break;
      }
      if (v21 - 1 == v24) {
        goto LABEL_22;
      }
      if (++v24 < v20 || v24 >= v21) {
        goto LABEL_19;
      }
      uint64_t v27 = *v25;
      v25 += 2;
      uint64_t v23 = v27;
      if (v12 < v27) {
        goto LABEL_17;
      }
    }

    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  uint64_t v24 = v20;
LABEL_17:
  uint64_t v28 = v10 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  uint64_t v29 = *(void *)(v16 + 16 * v24);
  swift_retain();
  _HashNode.item(position:)(v10, v28, v12, v29);
  return swift_release();
}

uint64_t sub_188DE6ED8()
{
  return sub_188DF7D90() & 1;
}

uint64_t getEnumTagSinglePayload for _FindResult(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 > 0xFFFFFB && *(_BYTE *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 16777212);
  }
  if ((((*(_DWORD *)a1 >> 5) & 0xFFFFF8 | (*(_DWORD *)a1 >> 29)) ^ 0xFFFFFFu) >= 0xFFFFFB) {
    int v3 = -1;
  }
  else {
    int v3 = ((*(_DWORD *)a1 >> 5) & 0xFFFFF8 | (*(_DWORD *)a1 >> 29)) ^ 0xFFFFFF;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for _FindResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFFFFFB)
  {
    *(void *)uint64_t result = a2 - 16777212;
    if (a3 >= 0xFFFFFC) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFFFFFC) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = (((-a2 >> 3) & 0x1FFFFF) << 8) - (a2 << 29);
    }
  }

  return result;
}

uint64_t sub_188DE6FD0(void *a1)
{
  else {
    return ((*a1 >> 24) & 0xFFFFFF00 | *a1) + 4;
  }
}

void *sub_188DE6FF0(void *result)
{
  *result &= 0xFFFFFFFF1FFFFFFFLL;
  return result;
}

unint64_t *sub_188DE7000(unint64_t *result, unsigned int a2)
{
  if (a2 < 4) {
    *uint64_t result = *result & 0xFFFFFFFF000000FFLL | (a2 << 29);
  }
  else {
    *uint64_t result = ((a2 - 4) | ((unint64_t)(a2 - 4) << 24)) & 0xFFFFFFFF000000FFLL | 0x80000000;
  }
  return result;
}

ValueMetadata *type metadata accessor for _FindResult()
{
  return &type metadata for _FindResult;
}

void *sub_188DE7044(void *result, uint64_t a2)
{
  *result += *(void *)(a2 + 8);
  return result;
}

uint64_t OrderedSet.description.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6[0] = a1;
  v6[1] = a2;
  uint64_t v4 = type metadata accessor for OrderedSet(0LL, a3, a4, a4);
  MEMORY[0x1895D7620](&protocol conformance descriptor for OrderedSet<A>, v4);
  return _arrayDescription<A>(for:debug:typeName:)((uint64_t)v6, 0, 0LL, 0LL, v4);
}

uint64_t sub_188DE70BC()
{
  return 0x536465726564724FLL;
}

uint64_t sub_188DE712C(uint64_t a1)
{
  return OrderedSet.description.getter(*v1, v1[1], *(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t OrderedSet.debugDescription.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v13[0] = a1;
  v13[1] = a2;
  uint64_t v6 = sub_188DE70BC();
  uint64_t v8 = v7;
  uint64_t v10 = type metadata accessor for OrderedSet(0LL, a3, a4, v9);
  MEMORY[0x1895D7620](&protocol conformance descriptor for OrderedSet<A>, v10);
  uint64_t v11 = _arrayDescription<A>(for:debug:typeName:)((uint64_t)v13, 1, v6, v8, v10);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_188DE71D8(uint64_t a1)
{
  return OrderedSet.debugDescription.getter(*v1, v1[1], *(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_188DE71E8(uint64_t result, void *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v13 = result;
  if (qword_18C749D80 != -1) {
    uint64_t result = swift_once();
  }
  if ((char *)_emptySingleton != a3)
  {
    uint64_t v14 = nullsub_1(a3 + 16, a3 + 32, a5, a6, a7);
    return sub_188DE7430(v14, v15, a2, a3, a4, v13, a5, a6, a7);
  }

  return result;
}

uint64_t _HashTreeStatistics.nodeCount.getter()
{
  return *(void *)v0;
}

uint64_t _HashTreeStatistics.collisionNodeCount.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t _HashTreeStatistics.itemCount.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t _HashTreeStatistics.collisionCount.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t _HashTreeStatistics._collisionChainCount.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t _HashTreeStatistics.maxItemDepth.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t _HashTreeStatistics.capacityBytes.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t _HashTreeStatistics.itemBytes.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t _HashTreeStatistics.childBytes.getter()
{
  return *(void *)(v0 + 72);
}

uint64_t _HashTreeStatistics.freeBytes.getter()
{
  return *(void *)(v0 + 80);
}

uint64_t _HashTreeStatistics.grossBytes.getter()
{
  return *(void *)(v0 + 88);
}

double _HashTreeStatistics.averageItemDepth.getter()
{
  if (*v0 < 1) {
    return 0.0;
  }
  else {
    return (double)v0[6] / (double)v0[2];
  }
}

double _HashTreeStatistics.memoryEfficiency.getter()
{
  uint64_t v1 = *(void *)(v0 + 88);
  if (v1 < 1) {
    return 1.0;
  }
  else {
    return (double)*(uint64_t *)(v0 + 64) / (double)v1;
  }
}

double _HashTreeStatistics.averageNodeSize.getter()
{
  if (*v0 < 1) {
    return 0.0;
  }
  else {
    return (double)v0[7] / (double)*v0;
  }
}

void _HashTreeStatistics.averageLookupChainLength.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (v1 >= 1 && __OFADD__(v1, *(void *)(v0 + 32))) {
    __break(1u);
  }
}

uint64_t getEnumTagSinglePayload for _HashTreeStatistics(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 96)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for _HashTreeStatistics(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 88) = 0LL;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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

  *(_BYTE *)(result + 96) = v3;
  return result;
}

ValueMetadata *type metadata accessor for _HashTreeStatistics()
{
  return &type metadata for _HashTreeStatistics;
}

uint64_t sub_188DE7430( uint64_t result, uint64_t a2, void *a3, const void *a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (__OFADD__(*a3, 1LL))
  {
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  uint64_t v10 = result;
  ++*a3;
  unsigned int v11 = *(_DWORD *)result;
  __int32 v12 = *(_DWORD *)(result + 4);
  uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)*(unsigned int *)result);
  v13.i16[0] = vaddlv_u8(v13);
  if (*(_DWORD *)result == v12) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = v13.u32[0];
  }
  uint64_t v15 = a3[2];
  BOOL v16 = __OFADD__(v15, v14);
  uint64_t v17 = v15 + v14;
  if (v16) {
    goto LABEL_33;
  }
  a3[2] = v17;
  uint64_t result = _HashNode.isCollisionNode.getter((uint64_t)a4, a5, a7, a8, a9);
  if ((result & 1) != 0)
  {
    uint64_t v22 = a3[1];
    BOOL v16 = __OFADD__(v22, 1LL);
    uint64_t v23 = v22 + 1;
    if (v16)
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }

    a3[1] = v23;
    uint64_t v24 = a3[3];
    BOOL v16 = __OFADD__(v24, v14);
    uint64_t v25 = v24 + v14;
    if (v16)
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }

    a3[3] = v25;
    uint64_t v26 = v14 * (v14 - 1);
    if ((unsigned __int128)(v14 * (__int128)(v14 - 1)) >> 64 != v26 >> 63)
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }

    uint64_t v27 = a3[4];
    BOOL v16 = __OFADD__(v27, v26 / 2);
    uint64_t v28 = v27 + v26 / 2;
    if (v16)
    {
LABEL_46:
      __break(1u);
      return result;
    }

    a3[4] = v28;
  }

  uint64_t v29 = *(void *)(*(void *)(a7 - 8) + 72LL);
  uint64_t v30 = *(void *)(*(void *)(a8 - 8) + 72LL);
  uint64_t v31 = (13108 * a6 + 52432) >> 16;
  uint64_t v32 = a3[5];
  uint64_t v33 = a3[6];
  if (v31 > v32) {
    uint64_t v32 = (13108 * a6 + 52432) >> 16;
  }
  a3[5] = v32;
  uint64_t v34 = v14 + v14 * (unint64_t)v31;
  BOOL v16 = __OFADD__(v33, v34);
  uint64_t v35 = v33 + v34;
  if (v16) {
    goto LABEL_34;
  }
  a3[6] = v35;
  uint64_t v36 = *(unsigned int *)(v10 + 8);
  uint64_t v37 = a3[7];
  BOOL v16 = __OFADD__(v37, v36);
  uint64_t v38 = v37 + v36;
  if (v16)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }

  a3[7] = v38;
  uint64_t v39 = *(unsigned int *)(v10 + 12);
  uint64_t v40 = a3[10];
  BOOL v16 = __OFADD__(v40, v39);
  uint64_t v41 = v40 + v39;
  if (v16)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }

  a3[10] = v41;
  BOOL v16 = __OFADD__(v29, v30);
  uint64_t v42 = v29 + v30;
  if (v16)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }

  uint64_t v43 = v14 * v42;
  if ((unsigned __int128)(v14 * (__int128)v42) >> 64 != (v14 * v42) >> 63)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }

  uint64_t v44 = a3[8];
  BOOL v16 = __OFADD__(v44, v43);
  uint64_t v45 = v44 + v43;
  if (v16)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }

  a3[8] = v45;
  if (v11 == v12)
  {
    uint64_t v46 = 0LL;
  }

  else
  {
    v21.i32[0] = v12;
    uint8x8_t v47 = (uint8x8_t)vcnt_s8(v21);
    v47.i16[0] = vaddlv_u8(v47);
    uint64_t v46 = (16 * v47.i32[0]);
  }

  uint64_t v48 = a3[9];
  BOOL v16 = __OFADD__(v48, v46);
  uint64_t v49 = v48 + v46;
  if (v16) {
    goto LABEL_40;
  }
  a3[9] = v49;
  uint64_t result = _swift_stdlib_malloc_size(a4);
  uint64_t v50 = result - 32;
  if (result < 32) {
    uint64_t v50 = result - 17;
  }
  unint64_t v51 = a2 + (v50 & 0xFFFFFFFFFFFFFFF0LL) - (void)a4 - 16;
  BOOL v16 = __OFADD__(v51, 16LL);
  unint64_t v52 = v51 + 16;
  if (v16) {
    goto LABEL_41;
  }
  uint64_t v53 = a3[11];
  BOOL v16 = __OFADD__(v53, v52);
  uint64_t v54 = v53 + v52;
  if (v16)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }

  a3[11] = v54;
  uint64_t v55 = _HashNode.UnsafeHandle.children.getter(v10, a2, a7, a8, a9);
  uint64_t v57 = v56;
  uint64_t v58 = type metadata accessor for _HashNode(0LL, a7, a8, a9);
  MEMORY[0x1895D6C3C](v55, v57, v58);
  sub_188DF7DC0();
  uint64_t result = sub_188DF7DB4();
  uint64_t v59 = v62;
  if (v62)
  {
    for (uint64_t i = v63; ; uint64_t i = v63)
    {
      sub_188DE71E8((a6 + 5), a3, v59, i, a7, a8, a9);
      swift_release();
      sub_188DF7DB4();
      uint64_t v59 = v62;
    }
  }

  return result;
}

uint64_t Range<>._toUInt()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a2 + 8) + 24LL) + 16LL);
  uint64_t v73 = a1;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v78 = (char *)&v69 - v6;
  uint64_t v7 = *(void *)(v4 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v5);
  uint64_t v69 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = MEMORY[0x1895F8858](v8);
  uint64_t v75 = (char *)&v69 - v11;
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  uint64_t v79 = (char *)&v69 - v13;
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  uint64_t v76 = (char *)&v69 - v15;
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  uint64_t v70 = (char *)&v69 - v17;
  uint64_t v18 = MEMORY[0x1895F8858](v16);
  uint64_t v77 = (char *)&v69 - v19;
  uint64_t v20 = MEMORY[0x1895F8858](v18);
  uint64_t v22 = (char *)&v69 - v21;
  uint64_t v23 = MEMORY[0x1895F8858](v20);
  uint64_t v25 = (char *)&v69 - v24;
  MEMORY[0x1895F8858](v23);
  uint64_t v27 = (char *)&v69 - v26;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v74 = v2;
  v28((char *)&v69 - v26, v2, v4);
  char v29 = sub_188DF8540();
  uint64_t v81 = (void (*)(char *, char *, uint64_t))v28;
  v28(v25, (uint64_t)v27, v4);
  uint64_t v71 = v7;
  uint64_t v72 = v3;
  if ((v29 & 1) != 0)
  {
    swift_getAssociatedConformanceWitness();
    sub_188DF89CC();
    sub_188DF896C();
    char v30 = sub_188DF7CC4();
    uint64_t v31 = *(void (**)(char *, uint64_t))(v7 + 8);
    v31(v22, v4);
    v31(v25, v4);
    if ((v30 & 1) != 0)
    {
      uint64_t v32 = v27;
LABEL_38:
      v31(v32, v4);
      return 0LL;
    }
  }

  else
  {
    uint64_t v31 = *(void (**)(char *, uint64_t))(v7 + 8);
    v31(v25, v4);
  }

  uint64_t v33 = v77;
  uint64_t v34 = sub_188DF8534();
  v81(v33, v27, v4);
  uint64_t v77 = v22;
  if (v34 <= 63)
  {
    uint64_t v35 = v33;
LABEL_7:
    v31(v35, v4);
    goto LABEL_8;
  }

  unint64_t v82 = -1LL;
  char v46 = sub_188DF8540();
  uint64_t v47 = sub_188DF8534();
  if ((v46 & 1) != 0)
  {
    if (v47 > 64)
    {
      sub_188CF78D0();
      sub_188DF84E0();
      char v48 = sub_188DF7CC4();
      uint64_t v49 = v22;
      goto LABEL_26;
    }

    swift_getAssociatedConformanceWitness();
    sub_188DF89CC();
    sub_188DF896C();
    char v62 = sub_188DF7CB8();
    v31(v22, v4);
    unint64_t v63 = v82;
    uint64_t v64 = v70;
    (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v70, v33, v4);
    if ((v62 & 1) == 0)
    {
      uint64_t v35 = v64;
      goto LABEL_7;
    }

    unint64_t v65 = sub_188DF8528();
    v31(v64, v4);
    if (v63 >= v65) {
      goto LABEL_8;
    }
LABEL_35:
    uint64_t v32 = v27;
    goto LABEL_38;
  }

  if (v47 < 65)
  {
    unint64_t v66 = sub_188DF8528();
    v31(v33, v4);
    if (v82 >= v66) {
      goto LABEL_8;
    }
    goto LABEL_35;
  }

  sub_188CF78D0();
  uint64_t v59 = v77;
  sub_188DF84E0();
  char v48 = sub_188DF7CC4();
  uint64_t v49 = v59;
LABEL_26:
  v31(v49, v4);
  v31(v33, v4);
  if ((v48 & 1) != 0) {
    goto LABEL_35;
  }
LABEL_8:
  uint64_t v36 = sub_188DF8528();
  v31(v27, v4);
  uint64_t v37 = v76;
  uint64_t v38 = v81;
  v81(v76, (char *)(v74 + *(int *)(v73 + 36)), v4);
  char v39 = sub_188DF8540();
  v38(v79, v37, v4);
  if ((v39 & 1) != 0)
  {
    swift_getAssociatedConformanceWitness();
    sub_188DF89CC();
    uint64_t v40 = v36;
    uint64_t v41 = v79;
    uint64_t v42 = v77;
    sub_188DF896C();
    char v43 = sub_188DF7CC4();
    v31(v42, v4);
    uint64_t v44 = v41;
    uint64_t v36 = v40;
    v31(v44, v4);
    uint64_t v45 = v75;
    if ((v43 & 1) != 0) {
      goto LABEL_37;
    }
  }

  else
  {
    v31(v79, v4);
    uint64_t v45 = v75;
  }

  uint64_t v50 = sub_188DF8534();
  v81(v45, v37, v4);
  if (v50 <= 63)
  {
    unint64_t v51 = v45;
LABEL_17:
    v31(v51, v4);
    goto LABEL_18;
  }

  unint64_t v82 = -1LL;
  char v52 = sub_188DF8540();
  uint64_t v53 = sub_188DF8534();
  if ((v52 & 1) == 0)
  {
    if (v53 < 65)
    {
      unint64_t v67 = sub_188DF8528();
      v31(v45, v4);
      if (v82 < v67)
      {
LABEL_37:
        uint64_t v32 = v37;
        goto LABEL_38;
      }

      goto LABEL_18;
    }

uint64_t Range<>._clampedToUInt()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v100 = *(void *)(*(void *)(*(void *)(a2 + 8) + 24LL) + 16LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v98 = (char *)&v87 - v6;
  uint64_t v7 = *(void *)(v4 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v5);
  uint64_t v89 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = MEMORY[0x1895F8858](v8);
  uint64_t v94 = (char *)&v87 - v11;
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  uint64_t v96 = (char *)&v87 - v13;
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  uint64_t v92 = (char *)&v87 - v15;
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  uint64_t v97 = (char *)&v87 - v17;
  uint64_t v18 = MEMORY[0x1895F8858](v16);
  uint64_t v88 = (char *)&v87 - v19;
  uint64_t v20 = MEMORY[0x1895F8858](v18);
  uint64_t v93 = (char *)&v87 - v21;
  uint64_t v22 = MEMORY[0x1895F8858](v20);
  uint64_t v95 = (char *)&v87 - v23;
  uint64_t v24 = MEMORY[0x1895F8858](v22);
  uint64_t v90 = (char *)&v87 - v25;
  uint64_t v26 = MEMORY[0x1895F8858](v24);
  uint64_t v28 = (char *)&v87 - v27;
  uint64_t v29 = MEMORY[0x1895F8858](v26);
  uint64_t v31 = (char *)&v87 - v30;
  uint64_t v32 = MEMORY[0x1895F8858](v29);
  uint64_t v34 = (char *)&v87 - v33;
  uint64_t v35 = MEMORY[0x1895F8858](v32);
  uint64_t v37 = (char *)&v87 - v36;
  MEMORY[0x1895F8858](v35);
  char v39 = (char *)&v87 - v38;
  uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v101 = v2 + *(int *)(v3 + 36);
  uint64_t v102 = v2;
  char v103 = v40;
  ((void (*)(char *))v40)((char *)&v87 - v38);
  LOBYTE(v3) = sub_188DF8540();
  uint64_t v41 = sub_188DF8534();
  uint64_t v91 = v7;
  if ((v3 & 1) != 0)
  {
    if (v41 <= 64) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v104 = 0LL;
    sub_188CF7620();
    sub_188DF84E0();
    char v45 = sub_188DF7CC4();
    char v43 = *(void (**)(char *, uint64_t))(v7 + 8);
    v43(v37, v4);
    v43(v39, v4);
    uint64_t v44 = 0LL;
    if ((v45 & 1) == 0) {
      return v44;
    }
    goto LABEL_7;
  }

  if (v41 > 63) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v42 = sub_188DF8528();
  char v43 = *(void (**)(char *, uint64_t))(v7 + 8);
  v43(v39, v4);
  if (v42 <= 0) {
    return 0LL;
  }
LABEL_7:
  v103(v34, v102, v4);
  if ((sub_188DF8540() & 1) != 0)
  {
    char v46 = sub_188DF8540();
    uint64_t v47 = sub_188DF8534();
    if ((v46 & 1) != 0)
    {
      if (v47 <= 64)
      {
        swift_getAssociatedConformanceWitness();
        sub_188DF89CC();
        sub_188DF896C();
        char v48 = sub_188DF7CC4();
        v43(v37, v4);
        v103(v31, (uint64_t)v34, v4);
        if ((v48 & 1) != 0)
        {
          v43(v31, v4);
          v43(v34, v4);
          goto LABEL_18;
        }

        uint64_t v49 = sub_188DF8528();
        v43(v31, v4);
        goto LABEL_14;
      }

uint64_t BitSet.intersection(_:)(int8x16_t *a1, int8x16_t *a2)
{
  else {
    unint64_t v2 = a1[1].u64[0];
  }
  if (!v2)
  {
    int64_t v7 = 0LL;
    uint64_t result = MEMORY[0x18961AFE8];
    goto LABEL_23;
  }

  uint64_t result = sub_188DF80D8();
  *(void *)(result + 16) = v2;
  if (v2 < 0xA)
  {
    uint64_t v6 = 0LL;
LABEL_13:
    unint64_t v13 = v2 - v6;
    uint64_t v14 = 8 * v6 + 32;
    uint64_t v15 = (uint64_t *)(result + v14);
    uint64_t v16 = (uint64_t *)((char *)a1->i64 + v14);
    uint64_t v17 = (uint64_t *)((char *)a2->i64 + v14);
    do
    {
      uint64_t v19 = *v17++;
      uint64_t v18 = v19;
      uint64_t v20 = *v16++;
      *v15++ = v20 & v18;
      --v13;
    }

    while (v13);
    goto LABEL_15;
  }

  uint64_t v6 = 0LL;
  uint64_t v6 = v2 & 0x7FFFFFFFFFFFFFFCLL;
  uint64_t v8 = a2 + 3;
  uint64_t v9 = a1 + 3;
  uint64_t v10 = (int8x16_t *)(result + 48);
  uint64_t v11 = v2 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v12 = vandq_s8(*v9, *v8);
    v10[-1] = vandq_s8(v9[-1], v8[-1]);
    int8x16_t *v10 = v12;
    v8 += 2;
    v9 += 2;
    v10 += 2;
    v11 -= 4LL;
  }

  while (v11);
  if (v2 != v6) {
    goto LABEL_13;
  }
LABEL_15:
  if (*(void *)(result + 32 + 8 * v2 - 8))
  {
    int64_t v7 = v2;
  }

  else
  {
    unint64_t v21 = v2;
    while (1)
    {
      int64_t v7 = v21 - 1;
      if (*(void *)(result + 8 * v21-- + 16))
      {
        __break(1u);
        break;
      }
    }

    int64_t v7 = 0LL;
  }

uint64_t BitSet.intersection(_:)(int8x16_t *a1, uint64_t a2, int8x16_t *a3)
{
  return BitSet.intersection(_:)(a1, a3);
}

uint64_t BitSet.intersection(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t BitSet.intersection<A>(_:)(uint64_t a1, int8x16_t *a2, ValueMetadata *a3)
{
  Description = (void (**)(char *, void, ValueMetadata *))a3[-1].Description;
  MEMORY[0x1895F8858](a1);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C749F60);
  Description[2](v8, a1, a3);
  if ((ValueMetadata *)v9 == a3)
  {
    swift_dynamicCast();
    uint64_t v12 = v17;
    uint64_t v13 = v18;
    uint64_t v16 = a2;
    swift_bridgeObjectRetain();
    BitSet.formIntersection(_:)(v12, v13);
    uint64_t v11 = (uint64_t)v16;
  }

  else
  {
    uint64_t v10 = (int8x16_t *)BitSet.init<A>(_validMembersOf:)((uint64_t)v8, a3);
    uint64_t v11 = BitSet.intersection(_:)(v10, a2);
    swift_bridgeObjectRelease();
  }

  ((void (*)(uint64_t, ValueMetadata *))Description[1])(a1, a3);
  return v11;
}

BOOL BitSet.isStrictSubset(of:)(void *a1, void *a2)
{
  unint64_t v2 = a2[2];
  unint64_t v3 = a1[2];
  if (v3 >= v2)
  {
    BOOL result = v2 < v3;
    if (!v2) {
      return result;
    }
    uint64_t v6 = a2[4];
    uint64_t v7 = a1[4];
    if ((v6 & ~v7) == 0)
    {
      unint64_t v8 = v2 - 1;
      uint64_t v9 = a2 + 5;
      uint64_t v10 = a1 + 5;
      do
      {
        if (result)
        {
          BOOL result = 1LL;
          if (!v8) {
            return result;
          }
        }

        else
        {
          BOOL result = v6 != v7;
          if (!v8) {
            return result;
          }
        }

        uint64_t v11 = *v9++;
        uint64_t v6 = v11;
        uint64_t v12 = *v10++;
        uint64_t v7 = v12;
        --v8;
      }

      while ((v6 & ~v12) == 0);
    }
  }

  return 0LL;
}

uint64_t BitSet.isStrictSubset(of:)(uint64_t a1, int64_t a2, uint64_t a3)
{
  uint64_t v6 = a3 + 32;
  if (a2 <= 0) {
    unint64_t v7 = 0LL;
  }
  else {
    unint64_t v7 = a1 & ~(a1 >> 63);
  }
  char v8 = _UnsafeBitSet.isSubset(of:)(v7, a2 & ~(a2 >> 63), (void *)(a3 + 32), *(void *)(a3 + 16));
  char v9 = 0;
  if ((v8 & 1) != 0 && a1 != a2)
  {
    if ((a2 | a1) < 0) {
      char v9 = 1;
    }
    else {
      char v9 = _UnsafeBitSet.isSuperset(of:)(a1, a2, v6, *(void *)(a3 + 16)) ^ 1;
    }
  }

  return v9 & 1;
}

unint64_t BitSet.isStrictSubset<A>(of:)(uint64_t a1, int8x8_t *a2, ValueMetadata *a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v25 - v11;
  Description = (void (**)(char *, void, ValueMetadata *))a3[-1].Description;
  MEMORY[0x1895F8858](v10);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3 == &type metadata for BitSet)
  {
    Description[2](v15, a1, &type metadata for BitSet);
LABEL_8:
    swift_dynamicCast();
    char v16 = BitSet.isStrictSubset(of:)(v26, a2);
    swift_bridgeObjectRelease();
    return v16 & 1;
  }

  if (a3 == &type metadata for BitSet.Counted)
  {
    Description[2](v15, a1, &type metadata for BitSet.Counted);
    goto LABEL_8;
  }

  if ((ValueMetadata *)__swift_instantiateConcreteTypeFromMangledName(&qword_18C749F60) == a3)
  {
    Description[2](v15, a1, a3);
    swift_dynamicCast();
    char v16 = BitSet.isStrictSubset(of:)((uint64_t)v26, v27, (uint64_t)a2);
    return v16 & 1;
  }

  if ((BitSet.isEmpty.getter((uint64_t)a2) & 1) != 0)
  {
    Description[2](v15, a1, a3);
    sub_188DF7FDC();
    swift_getAssociatedConformanceWitness();
    sub_188DF84D4();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, AssociatedTypeWitness);
    char v16 = v27 ^ 1;
    return v16 & 1;
  }

  unint64_t result = (unint64_t)a2[2];
  if (result)
  {
    uint64_t v18 = 0LL;
    uint64_t v19 = a2 + 4;
    uint64_t v20 = 8 * result;
    while (1)
    {
      uint8x8_t v21 = (uint8x8_t)vcnt_s8(*v19);
      v21.i16[0] = vaddlv_u8(v21);
      BOOL v22 = __OFADD__(v18, v21.u32[0]);
      v18 += v21.u32[0];
      if (v22) {
        break;
      }
      ++v19;
      v20 -= 8LL;
      if (!v20) {
        goto LABEL_15;
      }
    }

    __break(1u);
  }

  else
  {
LABEL_15:
    uint64_t v23 = MEMORY[0x1895F8858](result);
    *(&v25 - 6) = (uint64_t)a3;
    *(&v25 - 5) = a4;
    *(&v25 - 4) = a1;
    *(&v25 - 3) = (uint64_t)a2;
    *(&v25 - 2) = v24;
    LOBYTE(v26) = 2;
    unint64_t result = (unint64_t)sub_188DC2478( v23,  &v26,  (void *(*)(char *__return_ptr, _BYTE **))sub_188DE9774);
    if (v26 != 2)
    {
      char v16 = v26 & 1;
      return v16 & 1;
    }
  }

  __break(1u);
  return result;
}

BOOL BitSet.isStrictSubset(of:)(void *a1, uint64_t a2, void *a3)
{
  return BitSet.isStrictSubset(of:)(a1, a3);
}

uint64_t sub_188DE94E0@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v25 = a4;
  uint64_t v26 = a1;
  uint64_t v28 = a6;
  uint64_t v9 = *(void *)(a5 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v27 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v14 = (char *)&v25 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, a5);
  sub_188DF7FDC();
  swift_getAssociatedConformanceWitness();
  sub_188DF84D4();
  if ((v30 & 1) == 0)
  {
    char v17 = 0;
    uint64_t v18 = 0LL;
    uint64_t v19 = a3 + 32;
    while (1)
    {
      if ((v29 & 0x8000000000000000LL) != 0 || (unint64_t v20 = v29 >> 6, v29 >> 6 >= *(void *)(a3 + 16)))
      {
LABEL_9:
        while (1)
        {
          sub_188DF84D4();
          if ((v30 & 1) != 0) {
            goto LABEL_2;
          }
          if ((v29 & 0x8000000000000000LL) == 0)
          {
            unint64_t v20 = v29 >> 6;
            if (v29 >> 6 < *(void *)(a3 + 16))
            {
              uint64_t v21 = *(void *)(v19 + 8 * v20);
              char v17 = 1;
              uint64_t v22 = 1LL << v29;
              goto LABEL_8;
            }
          }
        }
      }

      uint64_t v21 = *(void *)(v19 + 8 * v20);
      uint64_t v22 = 1LL << v29;
LABEL_8:
      if ((v21 & v22) == 0) {
        goto LABEL_9;
      }
      uint64_t v23 = 8 * v20;
      uint64_t v24 = *(void *)(*v26 + v23);
      *(void *)(*v26 + v23) = v24 | v22;
      if ((v24 & v22) == 0 && ++v18 == v25) {
        break;
      }
      sub_188DF84D4();
      if (v30 == 1) {
        goto LABEL_2;
      }
    }

    if ((v17 & 1) != 0)
    {
LABEL_22:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v14, AssociatedTypeWitness);
      char v16 = 1;
      goto LABEL_3;
    }

    while (1)
    {
      sub_188DF84D4();
      if (v30 == 1) {
        break;
      }
      if ((v29 & 0x8000000000000000LL) != 0
        || v29 >> 6 >= *(void *)(a3 + 16)
        || ((*(void *)(v19 + 8 * (v29 >> 6)) >> v29) & 1) == 0)
      {
        goto LABEL_22;
      }
    }
  }

uint64_t sub_188DE9774@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  return sub_188DE94E0(a1, v2[4], v2[5], v2[6], v2[2], a2);
}

uint64_t sub_188DE979C(uint64_t result, unint64_t a2)
{
  if ((a2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v3 = *(void *)(*v2 + 8 * (a2 >> 6));
    uint64_t v4 = v3 & ((-1LL << (a2 & 0x3F)) - 1);
    uint64_t v5 = v3 | (1LL << (a2 & 0x3F));
    if ((result & 1) == 0) {
      uint64_t v5 = v4;
    }
    *(void *)(*v2 + 8 * (a2 >> 6)) = v5;
  }

  return result;
}

unint64_t sub_188DE97E0(unint64_t result, unint64_t a2)
{
  if ((result & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }

  int64_t v3 = v2[2];
  if (v3 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  if (v3 < (uint64_t)a2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  if (__OFSUB__(a2, result))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  if ((a2 & 0x8000000000000000LL) != 0) {
    goto LABEL_28;
  }
  int64_t v4 = result >> 6;
  char v5 = result & 0x3F;
  BOOL v6 = a2 > 0x3F;
  BOOL v7 = (a2 & 0x3F) == 0;
  uint64_t v8 = v6 & v7;
  if (v6 && v7) {
    char v9 = 64;
  }
  else {
    char v9 = a2 & 0x3F;
  }
  int64_t v10 = (a2 >> 6) - v8;
  uint64_t v11 = *v2;
  if (v4 == v10)
  {
    if (a2 > 0x3F && v7) {
      uint64_t v12 = -1LL;
    }
    else {
      uint64_t v12 = ~(-1LL << v9);
    }
    uint64_t v13 = (-1LL << v5) ^ ~v12;
    int64_t v10 = result >> 6;
    goto LABEL_22;
  }

  *(void *)(v11 + 8 * v4) |= -1LL << v5;
  if (v10 <= v4) {
    goto LABEL_29;
  }
  if (v4 + 1 == v10) {
    goto LABEL_19;
  }
  if (v4 + 1 >= v10)
  {
LABEL_30:
    __break(1u);
    return result;
  }

  uint64_t result = (unint64_t)memset((void *)(v11 + 8 * v4 + 8), 255, 8 * (v10 + ~v4));
LABEL_19:
  if ((v8 & 1) != 0) {
    uint64_t v13 = -1LL;
  }
  else {
    uint64_t v13 = ~(-1LL << v9);
  }
LABEL_22:
  *(void *)(v11 + 8 * v10) |= v13;
  return result;
}

void sub_188DE990C(unint64_t a1, unint64_t a2)
{
  if ((a1 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }

  int64_t v3 = v2[2];
  if (v3 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  if (v3 < (uint64_t)a2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  if (__OFSUB__(a2, a1))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  if ((a2 & 0x8000000000000000LL) != 0) {
    goto LABEL_28;
  }
  int64_t v4 = a1 >> 6;
  char v5 = a1 & 0x3F;
  unint64_t v6 = a2 >> 6;
  BOOL v7 = a2 > 0x3F;
  BOOL v8 = (a2 & 0x3F) == 0;
  uint64_t v9 = v7 & v8;
  if (v7 && v8) {
    char v10 = 64;
  }
  else {
    char v10 = a2 & 0x3F;
  }
  int64_t v11 = v6 - v9;
  uint64_t v12 = *v2;
  if (v4 == v6 - v9)
  {
    if (a2 > 0x3F && v8) {
      uint64_t v13 = -1LL;
    }
    else {
      uint64_t v13 = ~(-1LL << v10);
    }
    uint64_t v14 = v13 ^ (-1LL << v5);
    int64_t v11 = a1 >> 6;
    goto LABEL_22;
  }

  *(void *)(v12 + 8 * v4) &= ~(-1LL << v5);
  if (v11 <= v4) {
    goto LABEL_29;
  }
  if (v4 + 1 == v11) {
    goto LABEL_19;
  }
  if (v4 + 1 >= v11)
  {
LABEL_30:
    __break(1u);
    return;
  }

  bzero((void *)(v12 + 8 * v4 + 8), 8 * (v11 + ~v4));
LABEL_19:
  if ((v9 & 1) != 0) {
    uint64_t v14 = 0LL;
  }
  else {
    uint64_t v14 = -1LL << v10;
  }
LABEL_22:
  *(void *)(v12 + 8 * v11) &= v14;
}

uint64_t BitArray._UnsafeHandle._count.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t BitArray._UnsafeHandle._count.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*BitArray._UnsafeHandle._count.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

ValueMetadata *type metadata accessor for BitArray._UnsafeHandle()
{
  return &type metadata for BitArray._UnsafeHandle;
}

uint64_t _HashTable.UnsafeHandle.bucketCount.getter(void *a1)
{
  return 1LL << *a1;
}

uint64_t _HashTable.UnsafeHandle._find<A>(_:in:)( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v35 = a2;
  uint64_t v39 = a6;
  uint64_t v11 = *(void *)(*(void *)(a6 + 8) + 8LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v34 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v12);
  char v16 = (char *)&v32 - v15;
  uint64_t v37 = v11;
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void *)(v17 - 8);
  MEMORY[0x1895F8858](v17);
  uint64_t v19 = (char *)&v32 - v18;
  uint64_t v38 = a1;
  uint64_t v40 = a7;
  uint64_t result = sub_188DF7C40();
  uint64_t v21 = 1LL << *a3;
  BOOL v22 = __OFSUB__(v21, 1LL);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }

  else
  {
    _HashTable.UnsafeHandle.startFind(_:)(v23 & result, a3, a4, (uint64_t)&v42);
    unint64_t v24 = v44;
    if ((v45 & 1) == 0)
    {
      uint64_t v25 = AssociatedTypeWitness;
      while (1)
      {
        sub_188DF81C8();
        sub_188DF81A4();
        uint64_t v26 = *(void (**)(char *, uint64_t))(v34 + 8);
        v26(v14, v25);
        uint64_t v27 = sub_188DF82C4();
        uint64_t v28 = v33;
        (*(void (**)(char *))(v33 + 16))(v19);
        ((void (*)(char *, void))v27)(v41, 0LL);
        v26(v16, v25);
        LOBYTE(v27) = sub_188DF7D90();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v19, v17);
        if ((v27 & 1) != 0) {
          break;
        }
        _HashTable.BucketIterator.advance()();
        if (!*((void *)&v43 + 1)) {
          return 0LL;
        }
        uint64_t v29 = -1LL << *(void *)v42;
        unint64_t v30 = (v29 ^ ~*((void *)&v43 + 1)) + (*(uint64_t *)(v42 + 8) >> 6);
        if (v30 >= ~v29) {
          uint64_t v31 = ~v29;
        }
        else {
          uint64_t v31 = 0LL;
        }
        unint64_t v24 = v30 - v31;
      }
    }

    return v24;
  }

  return result;
}

uint64_t _HashTable.UnsafeHandle.scale.getter(void *a1)
{
  return *a1 & 0x3FLL;
}

uint64_t _HashTable.UnsafeHandle.seed.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t _HashTable.UnsafeHandle.position(of:)(uint64_t a1, void *a2)
{
  return ((*a2 & 0x3FLL) * a1) >> 6;
}

uint64_t _HashTable.UnsafeHandle.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)(a3 + 8 * a1);
}

uint64_t _HashTable.UnsafeHandle.bucketMask.getter(void *a1)
{
  return ~(-1LL << *a1);
}

void *_HashTable.UnsafeHandle.wordCount.getter(void *result)
{
  uint64_t v1 = (*result & 0x3FLL) << *result;
  BOOL v2 = __OFADD__(v1, 64LL);
  uint64_t v3 = v1 + 64;
  if (v2)
  {
    __break(1u);
  }

  else
  {
    uint64_t v5 = v3 - 1;
    BOOL v4 = v3 < 1;
    uint64_t v6 = v3 + 62;
    if (!v4) {
      uint64_t v6 = v5;
    }
    return (void *)(v6 >> 6);
  }

  return result;
}

Swift::Int __swiftcall _HashTable.UnsafeHandle.word(after:)(Swift::Int after)
{
  if (__OFADD__(after, 1LL))
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v2 = (*v1 & 0x3FLL) << *v1;
  BOOL v3 = __OFADD__(v2, 64LL);
  uint64_t v4 = v2 + 64;
  if (v3)
  {
LABEL_9:
    __break(1u);
    return after;
  }

  uint64_t v6 = v4 - 1;
  BOOL v5 = v4 < 1;
  uint64_t v7 = v4 + 62;
  if (!v5) {
    uint64_t v7 = v6;
  }
  if (after + 1 == v7 >> 6) {
    return 0LL;
  }
  return ++after;
}

Swift::Int_optional __swiftcall _HashTable.UnsafeHandle._value(forBucketContents:)(Swift::UInt64 forBucketContents)
{
  if (forBucketContents)
  {
    uint64_t v2 = -1LL << *v1;
    Swift::UInt64 v3 = (v2 ^ ~forBucketContents) + ((uint64_t)v1[1] >> 6);
    if (v3 >= ~v2) {
      uint64_t v4 = ~v2;
    }
    else {
      uint64_t v4 = 0LL;
    }
    Swift::Int v5 = v3 - v4;
  }

  else
  {
    Swift::Int v5 = 0LL;
  }

  Swift::Bool v6 = forBucketContents == 0;
  Swift::Int v7 = v5;
  result.value = v7;
  result.is_nil = v6;
  return result;
}

Swift::UInt64 __swiftcall _HashTable.UnsafeHandle._bucketContents(for:)(Swift::Int_optional a1)
{
  if (a1.is_nil) {
    return 0LL;
  }
  else {
    return (-1LL << *v1) ^ ~((((a1.value - ((uint64_t)v1[1] >> 6)) >> 63) & ~(-1LL << *v1))
  }
                           + a1.value
                           - ((uint64_t)v1[1] >> 6));
}

uint64_t _HashTable.UnsafeHandle.subscript.setter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a4 + 8 * a2) = result;
  return result;
}

uint64_t _HashTable.UnsafeHandle.fill<A>(uncheckedUniqueElements:)( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v75 = a6;
  uint64_t v80 = a1;
  uint64_t v9 = *(void *)(*(void *)(a5 + 8) + 8LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v71 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v72 = AssociatedTypeWitness;
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  char v70 = (char *)&v64 - v11;
  uint64_t v12 = swift_getAssociatedTypeWitness();
  uint64_t v81 = *(void *)(v12 - 8);
  uint64_t v79 = v12;
  MEMORY[0x1895F8858](v12);
  unint64_t v69 = (char *)&v64 - v13;
  uint64_t v14 = sub_188DF8384();
  MEMORY[0x1895F8858](v14);
  uint64_t v78 = (char *)&v64 - v15;
  uint64_t v16 = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](v16);
  swift_getAssociatedConformanceWitness();
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v65 = *(void *)(v17 - 8);
  MEMORY[0x1895F8858](v17);
  uint64_t v19 = (char *)&v64 - v18;
  uint64_t v73 = v9;
  uint64_t v74 = a4;
  sub_188DF8204();
  sub_188DF7FDC();
  unint64_t v20 = v78;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  char v76 = v19;
  uint64_t v77 = v17;
  uint64_t v68 = AssociatedConformanceWitness;
  sub_188DF84D4();
  uint64_t v22 = v79;
  unint64_t v67 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v81 + 48);
  if (v67(v20, 1LL, v79) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v76, v77);
  }
  uint64_t v23 = 0LL;
  unint64_t v66 = *(void (**)(char *, char *, uint64_t))(v81 + 32);
  unint64_t v24 = v69;
  while (1)
  {
    v66(v24, v20, v22);
    uint64_t v25 = a2;
    uint64_t v26 = v22;
    uint64_t v27 = (void (*)(void *, void))sub_188DF82C4();
    uint64_t v29 = v70;
    uint64_t v28 = v71;
    uint64_t v30 = v72;
    (*(void (**)(char *))(v71 + 16))(v70);
    v27(v82, 0LL);
    uint64_t v31 = v26;
    a2 = v25;
    (*(void (**)(char *, uint64_t))(v81 + 8))(v24, v31);
    uint64_t v32 = sub_188DF7C40();
    uint64_t v33 = 1LL << *v25;
    BOOL v34 = __OFSUB__(v33, 1LL);
    uint64_t v35 = v33 - 1;
    if (v34) {
      goto LABEL_40;
    }
    uint64_t v36 = v35 & v32;
    uint64_t v37 = _HashTable.UnsafeHandle._startIterator(bucket:)(v35 & v32, v25, a3);
    uint64_t v38 = v29;
    uint64_t v39 = v37;
    uint64_t v40 = v30;
    unint64_t v42 = v41;
    uint64_t v43 = v28;
    uint64_t v45 = v44;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v38, v40);
    v82[0] = v25;
    v82[1] = a3;
    uint64_t v83 = v36;
    uint64_t v84 = v39;
    unint64_t v85 = v42;
    uint64_t v86 = v45;
    char v87 = 0;
    if (v39) {
      break;
    }
LABEL_33:
    _HashTable.BucketIterator.currentValue.setter(v23, 0);
    BOOL v34 = __OFADD__(v23++, 1LL);
    if (v34) {
      goto LABEL_41;
    }
    unint64_t v20 = v78;
    sub_188DF84D4();
    uint64_t v22 = v79;
    if (v67(v20, 1LL, v79) == 1) {
      return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v76, v77);
    }
  }

  char v46 = 0;
  uint64_t v47 = *v25 & 0x3FLL;
  uint64_t v48 = 1LL << *v25;
  uint64_t v49 = v47 << *v25;
  uint64_t v50 = v49 + 64;
  BOOL v51 = __OFADD__(v49, 64LL);
  uint64_t v53 = v50 - 1;
  BOOL v52 = v50 < 1;
  uint64_t v54 = v50 + 62;
  if (!v52) {
    uint64_t v54 = v53;
  }
  uint64_t v55 = v54 >> 6;
  while (1)
  {
    if (++v36 == v48)
    {
      if ((v46 & 1) != 0) {
        goto LABEL_42;
      }
      uint64_t v36 = 0LL;
      char v46 = 1;
    }

    if (v45 >= v47) {
      break;
    }
    uint64_t v56 = (v36 * v47) >> 6;
    if (v45)
    {
      if (v51) {
        goto LABEL_39;
      }
      if (v56 + 1 == v55) {
        uint64_t v56 = 0LL;
      }
      else {
        ++v56;
      }
    }

    uint64_t v57 = v47 - v45;
    if (__OFSUB__(v47, v45)) {
      goto LABEL_37;
    }
    if (v56 == 2 && v47 == 5) {
      uint64_t v59 = 32LL;
    }
    else {
      uint64_t v59 = 64LL;
    }
    BOOL v34 = __OFSUB__(v59, v57);
    uint64_t v60 = v59 - v57;
    if (v34) {
      goto LABEL_38;
    }
    unint64_t v61 = *(void *)(a3 + 8 * v56);
    uint64_t v62 = (v61 << v45) | v42;
    unint64_t v42 = v61 >> v57;
    uint64_t v45 = v60;
LABEL_11:
    if ((v62 & (v48 - 1)) == 0)
    {
      char v87 = v46;
      unint64_t v85 = v42;
      uint64_t v86 = v45;
      uint64_t v83 = v36;
      uint64_t v84 = 0LL;
      goto LABEL_33;
    }
  }

  BOOL v34 = __OFSUB__(v45, v47);
  v45 -= v47;
  if (!v34)
  {
    uint64_t v62 = v42;
    v42 >>= v47;
    goto LABEL_11;
  }

  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  uint64_t result = sub_188DF881C();
  __break(1u);
  return result;
}

uint64_t _HashTable.UnsafeHandle.fill<A>(untilFirstDuplicateIn:)( char *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v78 = a7;
  uint64_t v64 = a4;
  char v70 = a3;
  uint64_t v83 = a2;
  uint64_t v60 = a1;
  uint64_t v74 = a6;
  uint64_t v8 = *(void *)(*(void *)(a6 + 8) + 8LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v69 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v73 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v10);
  uint64_t v84 = (char *)&v59 - v12;
  uint64_t v13 = swift_getAssociatedTypeWitness();
  uint64_t v81 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x1895F8858](v13);
  uint64_t v72 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  uint64_t v71 = (char *)&v59 - v17;
  MEMORY[0x1895F8858](v16);
  unint64_t v82 = (char *)&v59 - v18;
  uint64_t v19 = sub_188DF8384();
  MEMORY[0x1895F8858](v19);
  uint64_t v68 = (char *)&v59 - v20;
  uint64_t v21 = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](v21);
  swift_getAssociatedConformanceWitness();
  uint64_t v22 = swift_getAssociatedTypeWitness();
  uint64_t v59 = *(void *)(v22 - 8);
  MEMORY[0x1895F8858](v22);
  unint64_t v24 = (char *)&v59 - v23;
  uint64_t v79 = a5;
  uint64_t v25 = v68;
  uint64_t v80 = v8;
  sub_188DF8204();
  sub_188DF7FDC();
  uint64_t v26 = v70;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  unint64_t v66 = v24;
  uint64_t v28 = v69;
  uint64_t v67 = v22;
  uint64_t v62 = AssociatedConformanceWitness;
  sub_188DF84D4();
  unint64_t v61 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v81 + 48);
  if (v61(v25, 1LL, v13) == 1)
  {
LABEL_2:
    (*(void (**)(char *, uint64_t))(v59 + 8))(v66, v67);
    sub_188DF821C();
    return 1LL;
  }

  else
  {
    uint64_t v30 = 0LL;
    uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v81 + 32);
    uint64_t v77 = v13;
    while (1)
    {
      v63(v82, v25, v13);
      uint64_t v31 = (void (*)(_BYTE *, void))sub_188DF82C4();
      uint64_t v32 = v84;
      char v76 = *(void (**)(char *))(v28 + 16);
      v76(v84);
      v31(v85, 0LL);
      uint64_t result = sub_188DF7C40();
      uint64_t v33 = 1LL << *v26;
      BOOL v34 = __OFSUB__(v33, 1LL);
      uint64_t v35 = v33 - 1;
      if (v34)
      {
        __break(1u);
LABEL_13:
        __break(1u);
        return result;
      }

      uint64_t v65 = v30;
      uint64_t v36 = v35 & result;
      uint64_t v37 = v32;
      uint64_t v38 = v64;
      uint64_t v39 = _HashTable.UnsafeHandle._startIterator(bucket:)(v35 & result, v26, v64);
      uint64_t v41 = v40;
      uint64_t v43 = v42;
      uint64_t v75 = *(void (**)(char *, uint64_t))(v28 + 8);
      v75(v37, AssociatedTypeWitness);
      uint64_t v86 = v26;
      uint64_t v87 = v38;
      uint64_t v88 = v36;
      uint64_t v89 = v39;
      uint64_t v90 = v41;
      uint64_t v91 = v43;
      char v92 = 0;
      if (v39) {
        break;
      }
LABEL_8:
      uint64_t v57 = v65;
      _HashTable.BucketIterator.currentValue.setter(v65, 0);
      uint64_t v13 = v77;
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v82, v77);
      BOOL v34 = __OFADD__(v57, 1LL);
      uint64_t v30 = v57 + 1;
      if (v34) {
        goto LABEL_13;
      }
      uint64_t v25 = v68;
      sub_188DF84D4();
      int v58 = v61(v25, 1LL, v13);
      uint64_t v26 = v70;
      uint64_t v28 = v69;
      if (v58 == 1) {
        goto LABEL_2;
      }
    }

    while (1)
    {
      uint64_t v44 = v72;
      sub_188DF81C8();
      uint64_t v45 = v71;
      sub_188DF81A4();
      uint64_t v46 = v81;
      uint64_t v47 = *(void (**)(char *, uint64_t))(v81 + 8);
      uint64_t v48 = v77;
      v47(v44, v77);
      uint64_t v49 = (void (*)(_BYTE *, void))sub_188DF82C4();
      uint64_t v50 = AssociatedTypeWitness;
      BOOL v51 = v76;
      v76(v84);
      v49(v85, 0LL);
      v47(v45, v48);
      BOOL v52 = v47;
      (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v45, v82, v48);
      uint64_t v53 = sub_188DF82C4();
      uint64_t v54 = v73;
      v51(v73);
      uint64_t AssociatedTypeWitness = v50;
      ((void (*)(_BYTE *, void))v53)(v85, 0LL);
      v52(v45, v48);
      uint64_t v55 = v84;
      LOBYTE(v53) = sub_188DF7D90();
      uint64_t v56 = v75;
      v75(v54, v50);
      v56(v55, v50);
      if ((v53 & 1) != 0) {
        break;
      }
      _HashTable.BucketIterator.advance()();
      if (!v89) {
        goto LABEL_8;
      }
    }

    (*(void (**)(char *, uint64_t))(v59 + 8))(v66, v67);
    v63(v60, v82, v77);
    return 0LL;
  }

BOOL _HashTable.UnsafeHandle.isOccupied(_:)(uint64_t a1, void *a2, uint64_t a3)
{
  return _HashTable.UnsafeHandle.subscript.getter(a1, a2, a3) != 0;
}

unint64_t _HashTable.UnsafeHandle.subscript.setter( uint64_t a1, char a2, uint64_t a3, void *a4, uint64_t a5)
{
  if ((a2 & 1) != 0) {
    unint64_t v5 = 0LL;
  }
  else {
    unint64_t v5 = (-1LL << *a4) ^ ~((((a1 - ((uint64_t)a4[1] >> 6)) >> 63) & ~(-1LL << *a4)) + a1 - ((uint64_t)a4[1] >> 6));
  }
  return _HashTable.UnsafeHandle.subscript.setter(v5, a3, a4, a5);
}

uint64_t _HashTable.UnsafeHandle.adjustContents<A>(preparingForInsertionOfElementAtOffset:in:)( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v196 = a7;
  uint64_t v189 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v176 = sub_188DF8798();
  uint64_t v175 = *(void *)(v176 - 8);
  MEMORY[0x1895F8858](v176);
  v174 = (char *)&v173 - v13;
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v197 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x1895F8858](v14);
  v194 = (char *)&v173 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v15);
  v195 = (char *)&v173 - v17;
  uint64_t v181 = v18;
  uint64_t v19 = sub_188DF8384();
  uint64_t v20 = MEMORY[0x1895F8858](v19);
  uint64_t v191 = (void (*)(char *, char *, uint64_t))((char *)&v173 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  MEMORY[0x1895F8858](v20);
  uint64_t v190 = (char *)&v173 - v22;
  uint64_t v23 = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](v23);
  unsigned int v183 = (char *)&v173 - v24;
  uint64_t v185 = AssociatedConformanceWitness;
  uint64_t v179 = sub_188DF87A4();
  uint64_t v178 = *(void *)(v179 - 8);
  MEMORY[0x1895F8858](v179);
  v177 = (char *)&v173 - v25;
  uint64_t v182 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t v184 = v23;
  uint64_t v198 = swift_getAssociatedTypeWitness();
  uint64_t v180 = *(void *)(v198 - 8);
  uint64_t v26 = MEMORY[0x1895F8858](v198);
  uint64_t v192 = (char *)&v173 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = MEMORY[0x1895F8858](v26);
  uint64_t v193 = (char *)&v173 - v29;
  uint64_t v30 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v31 = MEMORY[0x1895F8858](v28);
  uint64_t v33 = (char *)&v173 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v31);
  uint64_t v35 = (char *)&v173 - v34;
  sub_188DF81C8();
  int v188 = v35;
  sub_188DF81A4();
  uint64_t v36 = *(uint64_t (**)(char *, uint64_t))(v30 + 8);
  uint64_t v189 = AssociatedTypeWitness;
  uint64_t v186 = v36;
  v36(v33, AssociatedTypeWitness);
  uint64_t v187 = a2;
  uint64_t v37 = sub_188DF81E0();
  if (v37 >= 0) {
    uint64_t v38 = v37;
  }
  else {
    uint64_t v38 = v37 + 1;
  }
  if (a1 < v38 >> 1)
  {
    uint64_t v39 = 1LL << *a3;
    BOOL v40 = __OFSUB__(v39, 1LL);
    uint64_t v41 = v39 - 1;
    if (v40) {
      goto LABEL_167;
    }
    uint64_t v42 = *a3 & 0x3FLL;
    uint64_t v43 = a3[1];
    if (v43 >= -64) {
      uint64_t v44 = 0LL;
    }
    else {
      uint64_t v44 = v41;
    }
    uint64_t v45 = v44 + (v43 >> 6) + 1;
    if (v45 < v41) {
      uint64_t v41 = 0LL;
    }
    a3[1] = a3[1] & 0x3FLL | ((v45 - v41) << 6);
    if (_s19CollectionsInternal10_HashTableV15maximumCapacity8forScaleS2i_tFZ_0(v42) / 3 < a1)
    {
      uint64_t v46 = _HashTable.UnsafeHandle._startIterator(bucket:)(0LL, a3, a4);
      uint64_t v47 = 0LL;
      v199 = a3;
      uint64_t v200 = a4;
      uint64_t v201 = 0LL;
      uint64_t v202 = v46;
      unint64_t v203 = v48;
      uint64_t v204 = v49;
      char v205 = 0;
      while (1)
      {
        if (v202)
        {
          uint64_t v50 = v199;
          unint64_t v51 = ~(-1LL << *v199);
          uint64_t v52 = (uint64_t)v199[1] >> 6;
          unint64_t v53 = v52 + (v202 ^ v51);
          uint64_t v54 = v53 >= v51 ? ~(-1LL << *v199) : 0LL;
          uint64_t v55 = v53 - v54;
          if (v55 <= a1)
          {
            BOOL v40 = __OFSUB__(v55, 1LL);
            uint64_t v56 = v55 - 1;
            if (v40) {
              goto LABEL_164;
            }
            uint64_t v57 = *v199 & 0x3FLL;
            uint64_t v58 = ((v51 & ((v56 - v52) >> 63)) + v56 - v52) ^ v51;
            unint64_t v59 = v58 ^ v202;
            char v60 = v57 * v47;
            uint64_t v61 = (v57 * v47) >> 6;
            uint64_t v62 = (v57 * v47) & 0x3F;
            uint64_t v63 = v200;
            *(void *)(v200 + 8 * v61) ^= (v58 ^ v202) << v60;
            unint64_t v64 = *v50 & 0x3FLL;
            if (64 - v62 < v64)
            {
              unint64_t v65 = v64 << v64;
              BOOL v40 = __OFADD__(v65, 64LL);
              uint64_t v66 = v65 + 64;
              if (v40) {
                goto LABEL_166;
              }
              uint64_t v68 = v66 - 1;
              BOOL v67 = v66 < 1;
              uint64_t v69 = v66 + 62;
              if (!v67) {
                uint64_t v69 = v68;
              }
              if (v61 + 1 == v69 >> 6) {
                uint64_t v70 = 0LL;
              }
              else {
                uint64_t v70 = v61 + 1;
              }
              *(void *)(v63 + 8 * v70) ^= v59 >> (64 - v62);
            }

            uint64_t v202 = v58;
          }
        }

        _HashTable.BucketIterator.advance()();
        uint64_t v47 = v201;
        if (!v201) {
          return v186(v188, v189);
        }
      }
    }

LABEL_173:
  __break(1u);
LABEL_174:
  uint64_t result = sub_188DF881C();
  __break(1u);
  return result;
}

Swift::Void __swiftcall _HashTable.UnsafeHandle.clear()()
{
  uint64_t v2 = (*v0 & 0x3FLL) << *v0;
  BOOL v3 = __OFADD__(v2, 64LL);
  uint64_t v4 = v2 + 64;
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return;
  }

  uint64_t v5 = v4 - 1;
  if (v4 < 1) {
    uint64_t v5 = v4 + 62;
  }
  if (v4 < -62) {
    goto LABEL_8;
  }
}

unint64_t _HashTable.UnsafeHandle.delete(bucket:hashValueGenerator:)( uint64_t a1, uint64_t (*a2)(unint64_t, void), uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v8 = a1;
  uint64_t v29 = _HashTable.UnsafeHandle._startIterator(bucket:)(a1, a4, a5);
  _HashTable.BucketIterator.advance()();
  uint64_t v9 = v29;
  if (!v29) {
    return _HashTable.UnsafeHandle.subscript.setter(0LL, v8, a4, a5);
  }
  uint64_t v26 = a5;
  uint64_t v10 = _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)(v8, a4, a5);
  uint64_t v11 = a1;
  while (1)
  {
    uint64_t v16 = -1LL << *a4;
    unint64_t v17 = (v16 ^ ~v9) + ((uint64_t)a4[1] >> 6);
    uint64_t v18 = v17 >= ~v16 ? ~v16 : 0LL;
    unint64_t result = a2(v17 - v18, *a4);
    uint64_t v20 = 1LL << *a4;
    BOOL v21 = __OFSUB__(v20, 1LL);
    uint64_t v22 = v20 - 1;
    if (v21) {
      break;
    }
    int64_t v23 = v22 & result;
    if (v8 >= v10)
    {
      if (v23 >= v10 && v8 >= v23)
      {
LABEL_3:
        uint64_t v12 = -1LL << *a4;
        unint64_t v13 = (v12 ^ ~v9) + ((uint64_t)a4[1] >> 6);
        if (v13 >= ~v12) {
          uint64_t v14 = v12 + 1;
        }
        else {
          uint64_t v14 = 0LL;
        }
        uint64_t v15 = v13 - ((uint64_t)a4[1] >> 6) + v14;
        _HashTable.UnsafeHandle.subscript.setter(((v22 & (v15 >> 63)) + v15) ^ v22, v8, a4, v26);
        uint64_t v8 = v11;
      }
    }

    else if (v23 >= v10 || v8 >= v23)
    {
      goto LABEL_3;
    }

    _HashTable.BucketIterator.advance()();
    uint64_t v11 = a1;
    uint64_t v9 = v29;
  }

  __break(1u);
  return result;
}

uint64_t _HashTable.UnsafeHandle.adjustContents<A>(preparingForRemovalOf:in:)( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v46 = a4;
  uint64_t v47 = a7;
  uint64_t v45 = a3;
  uint64_t v49 = a6;
  uint64_t v50 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v10 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v10);
  uint64_t v14 = (char *)&v37 - v13;
  swift_getAssociatedConformanceWitness();
  uint64_t v15 = sub_188DF833C();
  uint64_t v42 = *(void *)(v15 - 8);
  uint64_t v43 = v15;
  uint64_t v16 = MEMORY[0x1895F8858](v15);
  BOOL v40 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = MEMORY[0x1895F8858](v16);
  uint64_t v20 = (char *)&v37 - v19;
  BOOL v21 = *(void **)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](v18);
  int64_t v23 = (char *)&v37 - v22;
  uint64_t v44 = a2;
  uint64_t v48 = a5;
  uint64_t v24 = v50;
  sub_188DF81EC();
  uint64_t result = sub_188DF7CDC();
  if ((result & 1) != 0)
  {
    uint64_t v38 = v20;
    uint64_t v26 = TupleTypeMetadata2;
    uint64_t v27 = &v14[*(int *)(TupleTypeMetadata2 + 48)];
    uint64_t v28 = (void (*)(char *, uint64_t, uint64_t))v21[2];
    v28(v14, v24, AssociatedTypeWitness);
    uint64_t v39 = v23;
    v28(v27, (uint64_t)v23, AssociatedTypeWitness);
    uint64_t v29 = &v12[*(int *)(v26 + 48)];
    v28(v12, (uint64_t)v14, AssociatedTypeWitness);
    v28(v29, (uint64_t)v27, AssociatedTypeWitness);
    uint64_t v30 = (void (*)(char *, char *, uint64_t))v21[4];
    uint64_t v31 = v40;
    v30(v40, v12, AssociatedTypeWitness);
    uint64_t v32 = (void (*)(char *, uint64_t))v21[1];
    v32(v29, AssociatedTypeWitness);
    uint64_t v33 = &v12[*(int *)(v26 + 48)];
    v30(v12, v14, AssociatedTypeWitness);
    v30(v33, v27, AssociatedTypeWitness);
    uint64_t v34 = v43;
    v30(&v31[*(int *)(v43 + 36)], v33, AssociatedTypeWitness);
    v32(v12, AssociatedTypeWitness);
    uint64_t v35 = v42;
    uint64_t v36 = (uint64_t)v38;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v38, v31, v34);
    _HashTable.UnsafeHandle.adjustContents<A>(preparingForRemovalOf:in:)(v36, v44, v45, v46, v48, v49, v47);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v34);
    return ((uint64_t (*)(char *, uint64_t))v32)(v39, AssociatedTypeWitness);
  }

  else
  {
    __break(1u);
  }

  return result;
}

void _HashTable.UnsafeHandle.adjustContents<A>(preparingForRemovalOf:in:)( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v186 = a7;
  v177 = a3;
  uint64_t v178 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v168 = sub_188DF87A4();
  uint64_t v167 = *(void *)(v168 - 8);
  MEMORY[0x1895F8858](v168);
  unint64_t v169 = (char *)&v164 - v11;
  uint64_t v12 = swift_getAssociatedTypeWitness();
  uint64_t v188 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v12);
  uint64_t v185 = (char *)&v164 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v13);
  uint64_t v184 = (char *)&v164 - v15;
  uint64_t v187 = v16;
  uint64_t v17 = sub_188DF8384();
  uint64_t v18 = MEMORY[0x1895F8858](v17);
  uint64_t v181 = (char *)&v164 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v18);
  uint64_t v180 = (void (*)(char *, char *, uint64_t))((char *)&v164 - v20);
  uint64_t v21 = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](v21);
  uint64_t v173 = (char *)&v164 - v22;
  uint64_t v165 = sub_188DF8798();
  uint64_t v164 = *(void *)(v165 - 8);
  MEMORY[0x1895F8858](v165);
  unint64_t v166 = (char *)&v164 - v23;
  uint64_t v172 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t v174 = v21;
  uint64_t v189 = swift_getAssociatedTypeWitness();
  uint64_t v171 = *(void *)(v189 - 8);
  uint64_t v24 = MEMORY[0x1895F8858](v189);
  unsigned int v183 = (char *)&v164 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = MEMORY[0x1895F8858](v24);
  uint64_t v182 = (char *)&v164 - v27;
  uint64_t v28 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](v26);
  uint64_t v30 = (char *)&v164 - v29;
  sub_188DF81C8();
  uint64_t v31 = sub_188DF81B0();
  uint64_t v175 = v28;
  uint64_t v32 = *(void (**)(char *, uint64_t))(v28 + 8);
  v32(v30, AssociatedTypeWitness);
  uint64_t v176 = AssociatedConformanceWitness;
  uint64_t v33 = *(int *)(sub_188DF833C() + 36);
  uint64_t v170 = a1;
  uint64_t v34 = a1 + v33;
  sub_188DF81C8();
  uint64_t v179 = a2;
  uint64_t v35 = sub_188DF81B0();
  v32(v30, AssociatedTypeWitness);
  uint64_t v36 = v35 - v31;
  if (__OFSUB__(v35, v31)) {
    goto LABEL_160;
  }
  if (v36 < 1) {
    return;
  }
  uint64_t v37 = sub_188DF81E0();
  if (__OFSUB__(v37, v36)) {
    goto LABEL_162;
  }
  if (v31 < (v37 - v36) / 2)
  {
    uint64_t v38 = v177;
    uint64_t v39 = _s19CollectionsInternal10_HashTableV15maximumCapacity8forScaleS2i_tFZ_0(*v177 & 0x3FLL);
    uint64_t v40 = v178;
    if (v31 >= v39 / 3)
    {
      uint64_t v115 = _HashTable.UnsafeHandle._startIterator(bucket:)(0LL, v38, v178);
      uint64_t v116 = 0LL;
      uint64_t v190 = v38;
      uint64_t v191 = v40;
      uint64_t v192 = 0LL;
      uint64_t v193 = v115;
      unint64_t v194 = v117;
      uint64_t v195 = v118;
      uint64_t v35 = -1LL;
      uint64_t v81 = 64LL;
      char v196 = 0;
      while (1)
      {
        if (v193)
        {
          uint64_t v123 = v190;
          unint64_t v124 = ~(-1LL << *v190);
          uint64_t v125 = (uint64_t)v190[1] >> 6;
          unint64_t v126 = v125 + (v193 ^ v124);
          uint64_t v127 = v126 >= v124 ? ~(-1LL << *v190) : 0LL;
          int64_t v128 = v126 - v127;
          if (v128 < v31)
          {
            BOOL v71 = __OFADD__(v128, v36);
            int64_t v129 = v128 + v36;
            if (v71) {
              goto LABEL_158;
            }
            uint64_t v130 = *v190 & 0x3FLL;
            uint64_t v131 = ((v124 & ((v129 - v125) >> 63)) + v129 - v125) ^ v124;
            unint64_t v132 = v131 ^ v193;
            char v133 = v130 * v116;
            uint64_t v134 = (v130 * v116) >> 6;
            uint64_t v135 = (v130 * v116) & 0x3F;
            uint64_t v136 = v191;
            *(void *)(v191 + 8 * v134) ^= (v131 ^ v193) << v133;
            unint64_t v137 = *v123 & 0x3FLL;
            if (64 - v135 < v137)
            {
              unint64_t v138 = v137 << v137;
              BOOL v71 = __OFADD__(v138, 64LL);
              uint64_t v139 = v138 + 64;
              if (v71)
              {
                __break(1u);
                goto LABEL_127;
              }

              uint64_t v120 = v139 - 1;
              BOOL v119 = v139 < 1;
              uint64_t v121 = v139 + 62;
              if (!v119) {
                uint64_t v121 = v120;
              }
              if (v134 + 1 == v121 >> 6) {
                uint64_t v122 = 0LL;
              }
              else {
                uint64_t v122 = v134 + 1;
              }
              *(void *)(v136 + 8 * v122) ^= v132 >> (64 - v135);
            }

            uint64_t v193 = v131;
          }
        }

        _HashTable.BucketIterator.advance()();
        uint64_t v116 = v192;
        if (!v192) {
          goto LABEL_53;
        }
      }
    }

    uint64_t v41 = v169;
    (*(void (**)(char *, uint64_t, uint64_t))(v175 + 16))(v169, v170, AssociatedTypeWitness);
    if ((sub_188DF7D90() & 1) == 0) {
      goto LABEL_166;
    }
    uint64_t v42 = v168;
    MEMORY[0x1895D7620](MEMORY[0x1896196A8], v168);
    sub_188DF8294();
    (*(void (**)(char *, uint64_t))(v167 + 8))(v41, v42);
    sub_188DF7FDC();
    uint64_t v43 = swift_getAssociatedConformanceWitness();
    uint64_t v44 = v181;
    uint64_t v184 = (char *)v43;
    sub_188DF84D4();
    uint64_t v45 = v187;
    uint64_t v182 = *(char **)(v188 + 48);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v182)(v44, 1LL, v187) != 1)
    {
      uint64_t v46 = 0LL;
      uint64_t v180 = *(void (**)(char *, char *, uint64_t))(v188 + 32);
      do
      {
        v180(v185, v44, v45);
        uint64_t v47 = sub_188DF7C40();
        uint64_t v48 = *v38;
        uint64_t v49 = 1LL << *v38;
        uint64_t v50 = v49 - 1;
        if (__OFSUB__(v49, 1LL)) {
          goto LABEL_152;
        }
        uint64_t v51 = v50 & v47;
        uint64_t v52 = _HashTable.UnsafeHandle._startIterator(bucket:)(v50 & v47, v38, v40);
        uint64_t v190 = v38;
        uint64_t v191 = v40;
        uint64_t v192 = v51;
        uint64_t v193 = v52;
        unint64_t v194 = v53;
        uint64_t v195 = v54;
        char v196 = 0;
        if (v52)
        {
          uint64_t v55 = -1LL << *v38;
          unint64_t v56 = ~v55;
          uint64_t v57 = (uint64_t)v38[1] >> 6;
          unint64_t v58 = (v55 ^ ~v52) + v57;
          if (v58 >= ~v55) {
            uint64_t v59 = ~v55;
          }
          else {
            uint64_t v59 = 0LL;
          }
          if (v58 - v59 != v46)
          {
            char v60 = 0;
            uint64_t v61 = v48 & 0x3F;
            BOOL v62 = __OFADD__(v61 << v61, 64LL);
            uint64_t v63 = (v61 << v61) + 126;
            if ((v61 << v61) + 64 >= 1) {
              uint64_t v63 = (v61 << v61) + 63;
            }
            uint64_t v64 = v63 >> 6;
            while (1)
            {
              if (++v51 == v49)
              {
                if ((v60 & 1) != 0) {
                  goto LABEL_168;
                }
                uint64_t v51 = 0LL;
                char v60 = 1;
              }

              if (v54 >= v61)
              {
                BOOL v71 = __OFSUB__(v54, v61);
                v54 -= v61;
                if (v71)
                {
                  __break(1u);
LABEL_145:
                  __break(1u);
LABEL_146:
                  __break(1u);
LABEL_147:
                  __break(1u);
LABEL_148:
                  __break(1u);
                  goto LABEL_149;
                }

                unint64_t v75 = v53 >> v61;
                uint64_t v52 = v53 & v50;
                if ((v53 & v50) == 0) {
                  goto LABEL_47;
                }
              }

              else
              {
                uint64_t v67 = (v51 * v61) >> 6;
                if (v54)
                {
                  if (v62) {
                    goto LABEL_150;
                  }
                  if (v67 + 1 == v64) {
                    uint64_t v67 = 0LL;
                  }
                  else {
                    ++v67;
                  }
                }

                uint64_t v68 = v61 - v54;
                if (__OFSUB__(v61, v54)) {
                  goto LABEL_145;
                }
                if (v67 == 2 && v61 == 5) {
                  uint64_t v70 = 32LL;
                }
                else {
                  uint64_t v70 = 64LL;
                }
                BOOL v71 = __OFSUB__(v70, v68);
                uint64_t v72 = v70 - v68;
                if (v71) {
                  goto LABEL_147;
                }
                unint64_t v73 = *(void *)(v40 + 8 * v67);
                uint64_t v74 = (v73 << v54) | v53;
                unint64_t v75 = v73 >> v68;
                uint64_t v54 = v72;
                uint64_t v52 = v74 & v50;
                if ((v74 & v50) == 0)
                {
LABEL_47:
                  unint64_t v53 = v75;
                  goto LABEL_48;
                }
              }

              unint64_t v65 = (v52 ^ v56) + v57;
              if (v65 >= v56) {
                unint64_t v66 = v56;
              }
              else {
                unint64_t v66 = 0LL;
              }
              unint64_t v53 = v75;
              if (v65 - v66 == v46) {
                goto LABEL_47;
              }
            }
          }

          char v60 = 0;
LABEL_48:
          char v196 = v60;
          uint64_t v192 = v51;
          uint64_t v193 = v52;
          unint64_t v194 = v53;
          uint64_t v195 = v54;
        }

        if (__OFADD__(v46, v36)) {
          goto LABEL_154;
        }
        _HashTable.BucketIterator.currentValue.setter(v46 + v36, 0);
        uint64_t v45 = v187;
        (*(void (**)(char *, uint64_t))(v188 + 8))(v185, v187);
        BOOL v71 = __OFADD__(v46++, 1LL);
        if (v71) {
          goto LABEL_155;
        }
        uint64_t v44 = v181;
        sub_188DF84D4();
      }

      while (((unsigned int (*)(char *, uint64_t, uint64_t))v182)(v44, 1LL, v45) != 1);
    }

    (*(void (**)(char *, uint64_t))(v171 + 8))(v183, v189);
LABEL_53:
    uint64_t v76 = v38[1];
    if (__OFSUB__(v76 >> 6, v36)) {
      goto LABEL_164;
    }
    uint64_t v77 = 1LL << *v38;
    BOOL v71 = __OFSUB__(v77, 1LL);
    uint64_t v78 = v77 - 1;
    if (v71) {
      goto LABEL_165;
    }
    uint64_t v79 = (v78 & (((v76 >> 6) - v36) >> 63)) + (v76 >> 6) - v36;
    if (v79 < v78) {
      uint64_t v78 = 0LL;
    }
    v38[1] = v38[1] & 0x3FLL | ((v79 - v78) << 6);
    return;
  }

  uint64_t v80 = sub_188DF81E0();
  uint64_t v38 = v177;
  uint64_t v81 = v178;
  if (__OFSUB__(v80, v35)) {
    goto LABEL_163;
  }
  if (v80 - v35 >= _s19CollectionsInternal10_HashTableV15maximumCapacity8forScaleS2i_tFZ_0(*v177 & 0x3FLL) / 3)
  {
LABEL_127:
    uint64_t v140 = _HashTable.UnsafeHandle._startIterator(bucket:)(0LL, v38, v81);
    uint64_t v141 = 0LL;
    uint64_t v190 = v38;
    uint64_t v191 = v81;
    uint64_t v192 = 0LL;
    uint64_t v193 = v140;
    unint64_t v194 = v142;
    uint64_t v195 = v143;
    char v196 = 0;
    while (1)
    {
      if (v193)
      {
        uint64_t v144 = v190;
        unint64_t v145 = ~(-1LL << *v190);
        uint64_t v146 = (uint64_t)v190[1] >> 6;
        unint64_t v147 = v146 + (v193 ^ v145);
        uint64_t v148 = v147 >= v145 ? ~(-1LL << *v190) : 0LL;
        int64_t v149 = v147 - v148;
        if (v149 >= v35)
        {
          BOOL v71 = __OFSUB__(v149, v36);
          int64_t v150 = v149 - v36;
          if (v71) {
            goto LABEL_159;
          }
          uint64_t v151 = *v190 & 0x3FLL;
          uint64_t v152 = ((v145 & ((v150 - v146) >> 63)) + v150 - v146) ^ v145;
          unint64_t v153 = v152 ^ v193;
          char v154 = v151 * v141;
          uint64_t v155 = (v151 * v141) >> 6;
          uint64_t v156 = (v151 * v141) & 0x3F;
          uint64_t v157 = v191;
          *(void *)(v191 + 8 * v155) ^= (v152 ^ v193) << v154;
          unint64_t v158 = *v144 & 0x3FLL;
          if (64 - v156 < v158)
          {
            unint64_t v159 = v158 << v158;
            BOOL v71 = __OFADD__(v159, 64LL);
            uint64_t v160 = v159 + 64;
            if (v71) {
              goto LABEL_161;
            }
            uint64_t v161 = v160 - 1;
            BOOL v119 = v160 < 1;
            uint64_t v162 = v160 + 62;
            if (!v119) {
              uint64_t v162 = v161;
            }
            if (v155 + 1 == v162 >> 6) {
              uint64_t v163 = 0LL;
            }
            else {
              uint64_t v163 = v155 + 1;
            }
            *(void *)(v157 + 8 * v163) ^= v153 >> (64 - v156);
          }

          uint64_t v193 = v152;
        }
      }

      _HashTable.BucketIterator.advance()();
      uint64_t v141 = v192;
      if (!v192) {
        return;
      }
    }
  }

  uint64_t v82 = v166;
  (*(void (**)(char *, uint64_t, uint64_t))(v175 + 16))(v166, v34, AssociatedTypeWitness);
  if ((sub_188DF7D90() & 1) == 0) {
    goto LABEL_167;
  }
  uint64_t v83 = v165;
  MEMORY[0x1895D7620](MEMORY[0x189619690], v165);
  sub_188DF8294();
  (*(void (**)(char *, uint64_t))(v164 + 8))(v82, v83);
  sub_188DF7FDC();
  uint64_t v84 = swift_getAssociatedConformanceWitness();
  uint64_t v85 = v180;
  uint64_t v185 = (char *)v84;
  sub_188DF84D4();
  uint64_t v86 = v187;
  unsigned int v183 = *(char **)(v188 + 48);
  if (((unsigned int (*)(void, uint64_t, uint64_t))v183)(v85, 1LL, v187) == 1)
  {
LABEL_106:
    (*(void (**)(char *, uint64_t))(v171 + 8))(v182, v189);
    return;
  }

  uint64_t v181 = *(char **)(v188 + 32);
  while (1)
  {
    ((void (*)(char *, void, uint64_t))v181)(v184, v85, v86);
    uint64_t v87 = sub_188DF7C40();
    uint64_t v88 = *v38;
    uint64_t v89 = 1LL << *v38;
    uint64_t v90 = v89 - 1;
    if (__OFSUB__(v89, 1LL)) {
      goto LABEL_153;
    }
    uint64_t v91 = v90 & v87;
    uint64_t v92 = _HashTable.UnsafeHandle._startIterator(bucket:)(v90 & v87, v38, v81);
    uint64_t v190 = v38;
    uint64_t v191 = v81;
    uint64_t v192 = v91;
    uint64_t v193 = v92;
    unint64_t v194 = v93;
    uint64_t v195 = v94;
    char v196 = 0;
    if (!v92) {
      goto LABEL_103;
    }
    uint64_t v95 = -1LL << *v38;
    unint64_t v96 = ~v95;
    uint64_t v97 = (uint64_t)v38[1] >> 6;
    unint64_t v98 = (v95 ^ ~v92) + v97;
    uint64_t v99 = v98 >= ~v95 ? ~v95 : 0LL;
    if (v98 - v99 != v35) {
      break;
    }
    char v100 = 0;
LABEL_102:
    char v196 = v100;
    uint64_t v192 = v91;
    uint64_t v193 = v92;
    unint64_t v194 = v93;
    uint64_t v195 = v94;
LABEL_103:
    if (__OFSUB__(v35, v36)) {
      goto LABEL_156;
    }
    _HashTable.BucketIterator.currentValue.setter(v35 - v36, 0);
    uint64_t v86 = v187;
    (*(void (**)(char *, uint64_t))(v188 + 8))(v184, v187);
    BOOL v71 = __OFADD__(v35++, 1LL);
    if (v71) {
      goto LABEL_157;
    }
    uint64_t v85 = v180;
    sub_188DF84D4();
  }

  char v100 = 0;
  uint64_t v101 = v88 & 0x3F;
  BOOL v102 = __OFADD__(v101 << v101, 64LL);
  uint64_t v103 = (v101 << v101) + 126;
  if ((v101 << v101) + 64 >= 1) {
    uint64_t v103 = (v101 << v101) + 63;
  }
  uint64_t v104 = v103 >> 6;
  while (1)
  {
    if (++v91 == v89)
    {
      if ((v100 & 1) != 0) {
        goto LABEL_168;
      }
      uint64_t v91 = 0LL;
      char v100 = 1;
    }

    if (v94 < v101) {
      break;
    }
    BOOL v71 = __OFSUB__(v94, v101);
    v94 -= v101;
    if (v71) {
      goto LABEL_146;
    }
    unint64_t v114 = v93 >> v101;
    uint64_t v92 = v93 & v90;
    if ((v93 & v90) == 0)
    {
LABEL_101:
      unint64_t v93 = v114;
      goto LABEL_102;
    }

uint64_t _HashTable.UnsafeHandle.bias.setter(uint64_t result, void *a2)
{
  uint64_t v2 = 1LL << *a2;
  BOOL v3 = __OFSUB__(v2, 1LL);
  uint64_t v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }

  else
  {
    uint64_t v5 = (v4 & (result >> 63)) + result;
    if (v5 < v4) {
      uint64_t v4 = 0LL;
    }
    a2[1] = a2[1] & 0x3FLL | ((v5 - v4) << 6);
  }

  return result;
}

uint64_t _HashTable.UnsafeHandle._header.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*_HashTable.UnsafeHandle._header.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

uint64_t _HashTable.UnsafeHandle._buckets.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t _HashTable.UnsafeHandle._buckets.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*_HashTable.UnsafeHandle._buckets.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

uint64_t _HashTable.UnsafeHandle.reservedScale.getter(uint64_t a1)
{
  return *(void *)(a1 + 8) & 0x3FLL;
}

uint64_t _HashTable.UnsafeHandle.bias.getter(uint64_t a1)
{
  return *(uint64_t *)(a1 + 8) >> 6;
}

uint64_t *(*_HashTable.UnsafeHandle.bias.modify( uint64_t *a1, uint64_t a2))(uint64_t *result, char a2)
{
  *a1 = *(uint64_t *)(a2 + 8) >> 6;
  a1[1] = a2;
  return sub_188DECC14;
}

uint64_t *sub_188DECC14(uint64_t *result, char a2)
{
  uint64_t v2 = (void *)result[1];
  uint64_t v3 = 1LL << *v2;
  BOOL v4 = __OFSUB__(v3, 1LL);
  uint64_t v5 = v3 - 1;
  char v6 = v4;
  if ((a2 & 1) != 0)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    __break(1u);
  }

  if ((v6 & 1) != 0)
  {
    __break(1u);
    return result;
  }

uint64_t _HashTable.UnsafeHandle.bitCount.getter(void *a1)
{
  return (*a1 & 0x3FLL) << *a1;
}

uint64_t _HashTable.UnsafeHandle.capacity.getter(uint64_t result)
{
  unint64_t v1 = *(void *)result & 0x3FLL;
  if (v1 < 5) {
    return 15LL;
  }
  double v2 = (double)(1LL << v1) * 0.75;
  if ((~*(void *)&v2 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }

  if (v2 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  if (v2 < 9.22337204e18) {
    return (uint64_t)v2;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t _HashTable.UnsafeHandle.bucket(after:)(uint64_t result, void *a2)
{
  if (__OFADD__(result, 1LL))
  {
    __break(1u);
  }

  else if (result + 1 == 1LL << *a2)
  {
    return 0LL;
  }

  else
  {
    ++result;
  }

  return result;
}

uint64_t _HashTable.UnsafeHandle.bucket(before:)(uint64_t a1, void *a2)
{
  if (!a1) {
    a1 = 1LL << *a2;
  }
  BOOL v2 = __OFSUB__(a1, 1LL);
  uint64_t result = a1 - 1;
  if (v2) {
    __break(1u);
  }
  return result;
}

Swift::Int __swiftcall _HashTable.UnsafeHandle.word(before:)(Swift::Int before)
{
  if (before)
  {
    BOOL v2 = __OFSUB__(before--, 1LL);
    if (!v2) {
      return before;
    }
    __break(1u);
LABEL_9:
    __break(1u);
    return before;
  }

  uint64_t v3 = (*v1 & 0x3FLL) << *v1;
  BOOL v2 = __OFADD__(v3, 64LL);
  uint64_t v4 = v3 + 64;
  if (v2) {
    goto LABEL_9;
  }
  uint64_t v6 = v4 - 1;
  BOOL v5 = v4 < 1;
  uint64_t v7 = v4 + 62;
  if (!v5) {
    uint64_t v7 = v6;
  }
  return (v7 >> 6) - 1;
}

void *(*_HashTable.UnsafeHandle.subscript.modify( void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(void *result)
{
  a1[1] = a2;
  a1[2] = a4;
  *a1 = *(void *)(a4 + 8 * a2);
  return sub_188DECD94;
}

void *sub_188DECD94(void *result)
{
  *(void *)(result[2] + 8LL * result[1]) = *result;
  return result;
}

uint64_t _HashTable.UnsafeHandle.subscript.getter(uint64_t result, void *a2, uint64_t a3)
{
  unint64_t v3 = *a2 & 0x3FLL;
  uint64_t v4 = (uint64_t)(v3 * result) >> 6;
  uint64_t v5 = *(void *)(a3 + 8 * v4) >> (v3 * result);
  unint64_t v6 = 64 - ((v3 * result) & 0x3F);
  if (v6 >= v3) {
    return v5 & ~(-1LL << v3);
  }
  if (!__OFADD__(v3 << v3, 64LL))
  {
    uint64_t v7 = (v3 << v3) + 126;
    if (v4 + 1 == v7 >> 6) {
      uint64_t v8 = 0LL;
    }
    else {
      uint64_t v8 = v4 + 1;
    }
    uint64_t v5 = (*(void *)(a3 + 8 * v8) << v6) | v5 & ~(-1LL << v6);
    return v5 & ~(-1LL << v3);
  }

  __break(1u);
  return result;
}

unint64_t _HashTable.UnsafeHandle.subscript.setter( unint64_t result, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = (*a3 & 0x3FLL) * a2;
  uint64_t v5 = v4 >> 6;
  *(void *)(a4 + 8 * (v4 >> 6)) = ((((-1LL << *a3) + 1) << v4) - 1) & *(void *)(a4 + 8 * (v4 >> 6)) | (result << v4);
  unint64_t v6 = 64 - (v4 & 0x3F);
  unint64_t v7 = *a3 & 0x3FLL;
  if (v6 < v7)
  {
    unint64_t v8 = v7 << v7;
    BOOL v9 = __OFADD__(v8, 64LL);
    uint64_t v10 = v8 + 64;
    if (v9)
    {
      __break(1u);
    }

    else
    {
      uint64_t v12 = v10 - 1;
      BOOL v11 = v10 < 1;
      uint64_t v13 = v10 + 62;
      if (!v11) {
        uint64_t v13 = v12;
      }
      if (v5 + 1 == v13 >> 6) {
        uint64_t v14 = 0LL;
      }
      else {
        uint64_t v14 = v5 + 1;
      }
      *(void *)(a4 + 8 * v14) = *(void *)(a4 + 8 * v14) & (-1LL << (*a3 - v6)) | (result >> v6);
    }
  }

  return result;
}

unint64_t (*_HashTable.UnsafeHandle.subscript.modify( uint64_t *a1, uint64_t a2, void *a3, uint64_t a4))(uint64_t a1)
{
  a1[2] = (uint64_t)a3;
  a1[3] = a4;
  a1[1] = a2;
  *a1 = _HashTable.UnsafeHandle.subscript.getter(a2, a3, a4);
  return sub_188DECF0C;
}

unint64_t sub_188DECF0C(uint64_t a1)
{
  return _HashTable.UnsafeHandle.subscript.setter( *(void *)a1,  *(void *)(a1 + 8),  *(void **)(a1 + 16),  *(void *)(a1 + 24));
}

unint64_t _HashTable.UnsafeHandle.subscript.getter(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = _HashTable.UnsafeHandle.subscript.getter(a1, a2, a3);
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = -1LL << *a2;
  unint64_t v6 = (v5 ^ ~v4) + ((uint64_t)a2[1] >> 6);
  if (v6 >= ~v5) {
    uint64_t v7 = ~v5;
  }
  else {
    uint64_t v7 = 0LL;
  }
  return v6 - v7;
}

void (*_HashTable.UnsafeHandle.subscript.modify( void *a1, uint64_t a2, void *a3, uint64_t a4))(uint64_t a1)
{
  unint64_t v8 = malloc(0x28uLL);
  *a1 = v8;
  void v8[3] = a3;
  void v8[4] = a4;
  _OWORD v8[2] = a2;
  uint64_t v9 = _HashTable.UnsafeHandle.subscript.getter(a2, a3, a4);
  if (v9)
  {
    uint64_t v10 = -1LL << *a3;
    unint64_t v11 = (v10 ^ ~v9) + ((uint64_t)a3[1] >> 6);
    if (v11 >= ~v10) {
      uint64_t v12 = ~v10;
    }
    else {
      uint64_t v12 = 0LL;
    }
    unint64_t v13 = v11 - v12;
  }

  else
  {
    unint64_t v13 = 0LL;
  }

  *unint64_t v8 = v13;
  *((_BYTE *)v8 + 8) = v9 == 0;
  return sub_188DED020;
}

void sub_188DED020(uint64_t a1)
{
  unint64_t v1 = *(void **)a1;
  BOOL v2 = *(void **)(*(void *)a1 + 24LL);
  if ((*(_BYTE *)(*(void *)a1 + 8LL) & 1) != 0)
  {
    unint64_t v3 = 0LL;
  }

  else
  {
    uint64_t v4 = *v1 - ((uint64_t)v2[1] >> 6);
    unint64_t v3 = (-1LL << *v2) ^ ~(((v4 >> 63) & ~(-1LL << *v2)) + v4);
  }

  _HashTable.UnsafeHandle.subscript.setter(v3, v1[2], v2, v1[4]);
  free(v1);
}

uint64_t _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)(uint64_t result, void *a2, uint64_t a3)
{
  unint64_t v3 = *a2 & 0x3FLL;
  uint64_t v4 = 1LL << *a2;
  unint64_t v5 = v3 << *a2;
  uint64_t v6 = v5 + 64;
  BOOL v7 = __OFADD__(v5, 64LL);
  uint64_t v9 = v6 - 1;
  BOOL v8 = v6 < 1;
  uint64_t v10 = v6 + 62;
  if (!v8) {
    uint64_t v10 = v9;
  }
  uint64_t v11 = v10 >> 6;
  while (1)
  {
    if (result) {
      uint64_t v14 = result;
    }
    else {
      uint64_t v14 = 1LL << *a2;
    }
    uint64_t result = v14 - 1;
    if (__OFSUB__(v14, 1LL))
    {
      __break(1u);
      goto LABEL_24;
    }

    uint64_t v15 = (uint64_t)(result * v3) >> 6;
    uint64_t v13 = *(void *)(a3 + 8 * v15) >> (result * v3);
    unint64_t v16 = 64 - ((result * v3) & 0x3F);
    if (v16 < v3) {
      break;
    }
LABEL_11:
    if ((v13 & (v4 - 1)) == 0) {
      goto LABEL_19;
    }
  }

  if (!v7)
  {
    if (v15 + 1 == v11) {
      uint64_t v12 = 0LL;
    }
    else {
      uint64_t v12 = v15 + 1;
    }
    uint64_t v13 = (*(void *)(a3 + 8 * v12) << v16) | v13 & ~(-1LL << v16);
    goto LABEL_11;
  }

  __break(1u);
LABEL_19:
  if (__OFADD__(result, 1LL))
  {
LABEL_24:
    __break(1u);
    return result;
  }

  if (result + 1 == v4) {
    return 0LL;
  }
  return ++result;
}

ValueMetadata *type metadata accessor for _HashTable.UnsafeHandle()
{
  return &type metadata for _HashTable.UnsafeHandle;
}

CollectionsInternal::_RopeVersion __swiftcall _RopeVersion.init()()
{
  v1._value = 0LL;
  MEMORY[0x1895D76E0](&v1, 8LL);
  return v1;
}

BOOL static _RopeVersion.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

Swift::Void __swiftcall _RopeVersion.bump()()
{
}

uint64_t _RopeVersion._value.setter(uint64_t result)
{
  *CollectionsInternal::_RopeVersion v1 = result;
  return result;
}

uint64_t (*_RopeVersion._value.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

Swift::Void __swiftcall _RopeVersion.reset()()
{
  uint64_t v1 = 0LL;
  MEMORY[0x1895D76E0](&v1, 8LL);
  *uint64_t v0 = v1;
}

ValueMetadata *type metadata accessor for _RopeVersion()
{
  return &type metadata for _RopeVersion;
}

uint64_t Rope.find<A>(at:in:preferEnd:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v95 = a5;
  uint64_t v96 = a6;
  int v97 = a3;
  uint64_t v94 = a2;
  uint64_t AssociatedConformanceWitness = a1;
  uint64_t v91 = a4;
  uint64_t v9 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(a4 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v87 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v86 = (char *)&v81 - v10;
  uint64_t v98 = v9;
  uint64_t v84 = v8;
  uint64_t v12 = type metadata accessor for Rope._Node(0LL, v9, v8, v11);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  unint64_t v16 = (uint64_t *)((char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v17 = MEMORY[0x1895F8858](v14);
  uint64_t v99 = (uint64_t *)((char *)&v81 - v18);
  uint64_t v19 = MEMORY[0x1895F8858](v17);
  uint64_t v21 = (char *)&v81 - v20;
  MEMORY[0x1895F8858](v19);
  uint64_t v85 = (char *)&v81 - v22;
  uint64_t v23 = sub_188DF8384();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = MEMORY[0x1895F8858](v23);
  uint64_t v83 = (char *)&v81 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = MEMORY[0x1895F8858](v25);
  uint64_t v29 = (char *)&v81 - v28;
  MEMORY[0x1895F8858](v27);
  uint64_t v31 = (char *)&v81 - v30;
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 16);
  uint64_t v93 = v7;
  uint64_t v88 = v32;
  v32((char *)&v81 - v30, v7, v23);
  uint64_t v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  LODWORD(v9) = v33(v31, 1LL, v12);
  uint64_t v34 = *(uint64_t (**)(char *, uint64_t))(v24 + 8);
  uint64_t v89 = v23;
  uint64_t v82 = v34;
  v34(v31, v23);
  uint64_t v38 = 0LL;
  if ((_DWORD)v9 != 1)
  {
    v88(v29, v93, v89);
    if (v33(v29, 1LL, v12) == 1)
    {
LABEL_15:
      uint64_t v79 = v29;
      uint64_t v80 = v89;
LABEL_17:
      uint64_t result = v82(v79, v80);
      __break(1u);
      return result;
    }

    uint64_t v39 = v85;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v85, v29, v12);
    uint64_t v41 = v86;
    uint64_t v40 = v87;
    uint64_t v42 = AssociatedTypeWitness;
    (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v86, &v39[*(int *)(v12 + 36)], AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v39, v12);
    uint64_t v38 = (*(uint64_t (**)(char *, uint64_t))(v96 + 24))(v41, v95);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v42);
  }

  uint64_t v29 = (char *)AssociatedConformanceWitness;
  if (AssociatedConformanceWitness < 0 || v38 < AssociatedConformanceWitness)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v43 = v91;
  v102[0] = (uint64_t)v29;
  uint64_t v44 = v83;
  uint64_t v45 = v89;
  v88(v83, v93, v89);
  if (v33(v44, 1LL, v12) == 1)
  {
    uint64_t v79 = v44;
    uint64_t v80 = v45;
    goto LABEL_17;
  }

  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v46(v21, v44, v12);
  uint64_t v47 = Rope._Node.header.getter() >> 16;
  uint64_t v48 = v84;
  uint64_t v49 = v98;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v101 = _RopePath.init(height:)(v47);
  uint64_t v50 = Rope._Node.header.getter();
  uint64_t v51 = *(void (**)(uint64_t *, char *, uint64_t))(v13 + 16);
  uint64_t v52 = v99;
  if ((v50 & 0xFF0000) != 0)
  {
    do
    {
      v51(v16, v21, v12);
      uint64_t v53 = *v16 + 16;
      unint64_t v54 = *v16 + ((*(unsigned __int8 *)(v13 + 80) + 19LL) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
      MEMORY[0x1895D7620](&protocol conformance descriptor for Rope<A>._Node, v12);
      uint64_t v55 = nullsub_1(v53, v54, v98, v12, v48);
      uint64_t v57 = v56;
      swift_unknownObjectRetain();
      uint64_t v58 = v55;
      uint64_t v52 = v99;
      uint64_t v59 = v57;
      uint64_t v49 = v98;
      sub_188DEDCB0(v58, v59, v102, v94, v97 & 1, v98, v95, (uint64_t)v99, v96);
      swift_unknownObjectRelease();
      char v60 = *(void (**)(char *, uint64_t))(v13 + 8);
      v60((char *)v16, v12);
      v60(v21, v12);
      v46(v21, (char *)v52, v12);
    }

    while ((Rope._Node.header.getter() & 0xFF0000) != 0);
  }

  v51(v52, v21, v12);
  uint64_t v61 = *v52;
  uint64_t v62 = *v52 + 16;
  uint64_t v64 = v49;
  uint64_t v65 = type metadata accessor for Rope._Item(0LL, v49, v48, v63);
  uint64_t v66 = *(unsigned __int8 *)(*(void *)(v65 - 8) + 80LL);
  uint64_t v67 = v61 + ((v66 + 19) & ~v66);
  MEMORY[0x1895D7620](&protocol conformance descriptor for Rope<A>._Item, v65);
  uint64_t v68 = (unsigned __int16 *)nullsub_1(v62, v67, v64, v65, v48);
  uint64_t v70 = v69;
  swift_unknownObjectRetain();
  sub_188DEDE38(v68, v70, v102, v94, v97 & 1, v64, v95, v96, &v100);
  swift_unknownObjectRelease();
  BOOL v71 = *(void (**)(uint64_t *, uint64_t))(v13 + 8);
  v71(v99, v12);
  uint64_t v72 = v100;
  uint64_t v74 = type metadata accessor for _RopePath(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v73);
  _RopePath.subscript.setter(v72, 0, v74);
  uint64_t v75 = *(void *)(v93 + *(int *)(v91 + 36));
  uint64_t v76 = v101;
  uint64_t v77 = Rope._Node.asUnmanagedLeaf.getter();
  v71((uint64_t *)v21, v12);
  return Rope.Index.init(version:path:leaf:)(v75, v76, v77, v64, v48);
}

uint64_t Rope._UnsafeHandle.findSlot<A>(at:in:preferEnd:)( uint64_t a1, uint64_t a2, int a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v34 = a3;
  uint64_t v39 = a2;
  uint64_t v40 = a8;
  uint64_t v41 = a10;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v37 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v38 = AssociatedTypeWitness;
  uint64_t v17 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v19 = &v33[-v18];
  uint64_t v20 = *(void *)(a7 - 8);
  MEMORY[0x1895F8858](v17);
  uint64_t v22 = &v33[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v43 = a4;
  uint64_t v44 = a5;
  uint64_t v45 = a6;
  uint64_t v42 = AssociatedConformanceWitness;
  uint64_t result = Rope._UnsafeHandle.childCount.getter(a4);
  if (result < 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  uint64_t v24 = result;
  if (result)
  {
    uint64_t v25 = 0LL;
    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(a9 + 24);
    uint64_t v35 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v41 + 24);
    uint64_t v36 = v26;
    uint64_t v27 = ~v34 & 1LL;
    while (v24 != v25)
    {
      uint64_t v28 = Rope._UnsafeHandle.children.getter(v43, v44, v45, a7, v42, a9);
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v20 + 16))(v22, v28 + *(void *)(v20 + 72) * v25, a7);
      v36(a7, a9);
      (*(void (**)(_BYTE *, uint64_t))(v20 + 8))(v22, a7);
      uint64_t v29 = v35(v19, v40, v41);
      uint64_t result = (*(uint64_t (**)(_BYTE *, uint64_t))(v37 + 8))(v19, v38);
      uint64_t v30 = a1 - v29;
      if (__OFSUB__(a1, v29)) {
        goto LABEL_17;
      }
      if (__OFADD__(v30, v27)) {
        goto LABEL_18;
      }
      if (v30 + v27 < 1) {
        return v25;
      }
      ++v25;
      a1 -= v29;
      if (v24 == v25)
      {
        a1 = v30;
        goto LABEL_10;
      }
    }

    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

uint64_t Rope._UnsafeHandle.findSlot<A>(from:offsetBy:in:preferEnd:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, unsigned __int16 *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v44 = a4;
  uint64_t v47 = a12;
  uint64_t v43 = a10;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v41 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v42 = AssociatedTypeWitness;
  uint64_t v21 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v40 = (char *)&v36 - v22;
  uint64_t v39 = *(void *)(a9 - 8);
  uint64_t result = MEMORY[0x1895F8858](v21);
  uint64_t v25 = (char *)&v36 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  BOOL v26 = __OFADD__(a2, a3);
  uint64_t v27 = a2 + a3;
  if (!v26)
  {
    uint64_t v45 = a6;
    uint64_t v46 = a7;
    if (Rope._UnsafeHandle.childCount.getter(a6) <= a1) {
      return a1;
    }
    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(a11 + 24);
    BOOL v38 = (a5 & 1) == 0;
    uint64_t v28 = v46;
    uint64_t v36 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 24);
    uint64_t v29 = a8;
    uint64_t v30 = v45;
    while (1)
    {
      uint64_t v31 = AssociatedConformanceWitness;
      uint64_t v32 = Rope._UnsafeHandle.children.getter(v30, v28, v29, a9, AssociatedConformanceWitness, a11);
      uint64_t v33 = v39;
      (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v25, v32 + *(void *)(v39 + 72) * a1, a9);
      int v34 = v40;
      v37(a9, a11);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v25, a9);
      uint64_t v35 = v36(v34, v43, v47);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v34, v42);
      if (__OFADD__(v27, v38)) {
        break;
      }
      if (v35 >= v27 + v38) {
        return a1;
      }
      BOOL v26 = __OFSUB__(v27, v35);
      v27 -= v35;
      if (v26) {
        goto LABEL_10;
      }
      ++a1;
      uint64_t v30 = v45;
      uint64_t v28 = v46;
      uint64_t AssociatedConformanceWitness = v31;
      if (a1 >= Rope._UnsafeHandle.childCount.getter(v45)) {
        return a1;
      }
    }

    __break(1u);
LABEL_10:
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_188DEDCB0@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v11 = a3;
  uint64_t v14 = *a3;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v17 = type metadata accessor for Rope._Node(0LL, a6, AssociatedConformanceWitness, v16);
  uint64_t v18 = MEMORY[0x1895D7620](&protocol conformance descriptor for Rope<A>._Node, v17);
  uint64_t v19 = v14;
  uint64_t v20 = a2;
  uint64_t v21 = Rope._UnsafeHandle.findSlot<A>(at:in:preferEnd:)(v19, a4, a5, (unsigned __int16 *)a1, a2, a6, v17, a7, v18, a9);
  *uint64_t v11 = v22;
  LOBYTE(v11) = *(_BYTE *)(a1 + 2);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v24 = swift_getAssociatedConformanceWitness();
  uint64_t v26 = type metadata accessor for _RopePath(0LL, AssociatedTypeWitness, v24, v25);
  _RopePath.subscript.setter(v21, v11, v26);
  uint64_t v27 = Rope._UnsafeHandle.children.getter((unsigned __int16 *)a1, v20, a6, v17, AssociatedConformanceWitness, v18);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16LL))( a8,  v27 + *(void *)(*(void *)(v17 - 8) + 72LL) * v21,  v17);
}

uint64_t sub_188DEDE38@<X0>( unsigned __int16 *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t v17 = *a3;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v20 = type metadata accessor for Rope._Item(0LL, a6, AssociatedConformanceWitness, v19);
  uint64_t v21 = MEMORY[0x1895D7620](&protocol conformance descriptor for Rope<A>._Item, v20);
  uint64_t result = Rope._UnsafeHandle.findSlot<A>(at:in:preferEnd:)(v17, a4, a5, a1, a2, a6, v20, a7, v21, a8);
  *a9 = result;
  a9[1] = v23;
  return result;
}

uint64_t static BitArray.|= infix(_:_:)(uint64_t *a1, int8x16_t *a2, uint64_t a3)
{
  uint64_t v6 = a1[1];
  if ((v6 | a3) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }

  if (v6 != a3)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t result = (uint64_t)sub_188CF73DC(v4);
    uint64_t v4 = result;
    *unint64_t v3 = result;
    unint64_t v8 = *(void *)(result + 16);
    if (!v8) {
      goto LABEL_18;
    }
    goto LABEL_5;
  }

  unint64_t v5 = a2;
  unint64_t v3 = a1;
  uint64_t v4 = *a1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v3 = v4;
  if ((result & 1) == 0) {
    goto LABEL_21;
  }
  unint64_t v8 = *(void *)(v4 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  if (v8 < 6
    || ((uint64_t v9 = 8 * v8 + 32, v4 + 32 < (unint64_t)v5->u64 + v9)
      ? (BOOL v10 = (unint64_t)&v5[2] >= v4 + v9)
      : (BOOL v10 = 1),
        !v10))
  {
    uint64_t v11 = 0LL;
LABEL_16:
    unint64_t v16 = v8 - v11;
    uint64_t v17 = 8 * v11 + 32;
    uint64_t v18 = (void *)(v4 + v17);
    uint64_t v19 = (uint64_t *)((char *)v5->i64 + v17);
    do
    {
      uint64_t v20 = *v19++;
      *v18++ |= v20;
      --v16;
    }

    while (v16);
    goto LABEL_18;
  }

  uint64_t v11 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  uint64_t v12 = v5 + 3;
  uint64_t v13 = (int8x16_t *)(v4 + 48);
  uint64_t v14 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v15 = vorrq_s8(*v13, *v12);
    v13[-1] = vorrq_s8(v13[-1], v12[-1]);
    *uint64_t v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 4LL;
  }

  while (v14);
  if (v8 != v11) {
    goto LABEL_16;
  }
LABEL_18:
  *unint64_t v3 = v4;
  return result;
}

char *static BitArray.| infix(_:_:)(char *a1, uint64_t a2, int8x16_t *a3, uint64_t a4)
{
  if ((a4 | a2) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }

  if (a2 != a4)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t v4 = sub_188CF73DC((uint64_t)v4);
    unint64_t v6 = *((void *)v4 + 2);
    if (!v6) {
      return v4;
    }
    goto LABEL_5;
  }

  unint64_t v5 = a3;
  uint64_t v4 = a1;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_21;
  }
  unint64_t v6 = *((void *)v4 + 2);
  if (!v6) {
    return v4;
  }
LABEL_5:
  if (v6 < 6 || ((uint64_t v7 = 8 * v6 + 32, v4 + 32 < &v5->i8[v7]) ? (v8 = &v5[2] >= (int8x16_t *)&v4[v7]) : (v8 = 1), !v8))
  {
    uint64_t v9 = 0LL;
LABEL_16:
    unint64_t v14 = v6 - v9;
    uint64_t v15 = 8 * v9 + 32;
    unint64_t v16 = &v4[v15];
    uint64_t v17 = (uint64_t *)((char *)v5->i64 + v15);
    do
    {
      uint64_t v18 = *v17++;
      *(void *)v16 |= v18;
      v16 += 8;
      --v14;
    }

    while (v14);
    return v4;
  }

  uint64_t v9 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  BOOL v10 = v5 + 3;
  uint64_t v11 = (int8x16_t *)(v4 + 48);
  uint64_t v12 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v13 = vorrq_s8(*v11, *v10);
    v11[-1] = vorrq_s8(v11[-1], v10[-1]);
    *uint64_t v11 = v13;
    v10 += 2;
    v11 += 2;
    v12 -= 4LL;
  }

  while (v12);
  if (v6 != v9) {
    goto LABEL_16;
  }
  return v4;
}

uint64_t static BitArray.&= infix(_:_:)(uint64_t *a1, int8x16_t *a2, uint64_t a3)
{
  uint64_t v6 = a1[1];
  if ((v6 | a3) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }

  if (v6 != a3)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t result = (uint64_t)sub_188CF73DC(v4);
    uint64_t v4 = result;
    *unint64_t v3 = result;
    unint64_t v8 = *(void *)(result + 16);
    if (!v8) {
      goto LABEL_18;
    }
    goto LABEL_5;
  }

  unint64_t v5 = a2;
  unint64_t v3 = a1;
  uint64_t v4 = *a1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v3 = v4;
  if ((result & 1) == 0) {
    goto LABEL_21;
  }
  unint64_t v8 = *(void *)(v4 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  if (v8 < 6
    || ((uint64_t v9 = 8 * v8 + 32, v4 + 32 < (unint64_t)v5->u64 + v9)
      ? (BOOL v10 = (unint64_t)&v5[2] >= v4 + v9)
      : (BOOL v10 = 1),
        !v10))
  {
    uint64_t v11 = 0LL;
LABEL_16:
    unint64_t v16 = v8 - v11;
    uint64_t v17 = 8 * v11 + 32;
    uint64_t v18 = (void *)(v4 + v17);
    uint64_t v19 = (uint64_t *)((char *)v5->i64 + v17);
    do
    {
      uint64_t v20 = *v19++;
      *v18++ &= v20;
      --v16;
    }

    while (v16);
    goto LABEL_18;
  }

  uint64_t v11 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  uint64_t v12 = v5 + 3;
  int8x16_t v13 = (int8x16_t *)(v4 + 48);
  uint64_t v14 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v15 = vandq_s8(*v13, *v12);
    v13[-1] = vandq_s8(v13[-1], v12[-1]);
    *int8x16_t v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 4LL;
  }

  while (v14);
  if (v8 != v11) {
    goto LABEL_16;
  }
LABEL_18:
  *unint64_t v3 = v4;
  return result;
}

char *static BitArray.& infix(_:_:)(char *a1, uint64_t a2, int8x16_t *a3, uint64_t a4)
{
  if ((a4 | a2) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }

  if (a2 != a4)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t v4 = sub_188CF73DC((uint64_t)v4);
    unint64_t v6 = *((void *)v4 + 2);
    if (!v6) {
      return v4;
    }
    goto LABEL_5;
  }

  unint64_t v5 = a3;
  uint64_t v4 = a1;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_21;
  }
  unint64_t v6 = *((void *)v4 + 2);
  if (!v6) {
    return v4;
  }
LABEL_5:
  if (v6 < 6 || ((uint64_t v7 = 8 * v6 + 32, v4 + 32 < &v5->i8[v7]) ? (v8 = &v5[2] >= (int8x16_t *)&v4[v7]) : (v8 = 1), !v8))
  {
    uint64_t v9 = 0LL;
LABEL_16:
    unint64_t v14 = v6 - v9;
    uint64_t v15 = 8 * v9 + 32;
    unint64_t v16 = &v4[v15];
    uint64_t v17 = (uint64_t *)((char *)v5->i64 + v15);
    do
    {
      uint64_t v18 = *v17++;
      *(void *)v16 &= v18;
      v16 += 8;
      --v14;
    }

    while (v14);
    return v4;
  }

  uint64_t v9 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  BOOL v10 = v5 + 3;
  uint64_t v11 = (int8x16_t *)(v4 + 48);
  uint64_t v12 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v13 = vandq_s8(*v11, *v10);
    v11[-1] = vandq_s8(v11[-1], v10[-1]);
    *uint64_t v11 = v13;
    v10 += 2;
    v11 += 2;
    v12 -= 4LL;
  }

  while (v12);
  if (v6 != v9) {
    goto LABEL_16;
  }
  return v4;
}

uint64_t static BitArray.^= infix(_:_:)(uint64_t *a1, int8x16_t *a2, uint64_t a3)
{
  uint64_t v6 = a1[1];
  if ((v6 | a3) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }

  if (v6 != a3)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t result = (uint64_t)sub_188CF73DC(v4);
    uint64_t v4 = result;
    *unint64_t v3 = result;
    unint64_t v8 = *(void *)(result + 16);
    if (!v8) {
      goto LABEL_18;
    }
    goto LABEL_5;
  }

  unint64_t v5 = a2;
  unint64_t v3 = a1;
  uint64_t v4 = *a1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v3 = v4;
  if ((result & 1) == 0) {
    goto LABEL_21;
  }
  unint64_t v8 = *(void *)(v4 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  if (v8 < 6
    || ((uint64_t v9 = 8 * v8 + 32, v4 + 32 < (unint64_t)v5->u64 + v9)
      ? (BOOL v10 = (unint64_t)&v5[2] >= v4 + v9)
      : (BOOL v10 = 1),
        !v10))
  {
    uint64_t v11 = 0LL;
LABEL_16:
    unint64_t v16 = v8 - v11;
    uint64_t v17 = 8 * v11 + 32;
    uint64_t v18 = (void *)(v4 + v17);
    uint64_t v19 = (uint64_t *)((char *)v5->i64 + v17);
    do
    {
      uint64_t v20 = *v19++;
      *v18++ ^= v20;
      --v16;
    }

    while (v16);
    goto LABEL_18;
  }

  uint64_t v11 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  uint64_t v12 = v5 + 3;
  int8x16_t v13 = (int8x16_t *)(v4 + 48);
  uint64_t v14 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v15 = veorq_s8(*v13, *v12);
    v13[-1] = veorq_s8(v13[-1], v12[-1]);
    *int8x16_t v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 4LL;
  }

  while (v14);
  if (v8 != v11) {
    goto LABEL_16;
  }
LABEL_18:
  *unint64_t v3 = v4;
  return result;
}

char *static BitArray.^ infix(_:_:)(char *a1, uint64_t a2, int8x16_t *a3, uint64_t a4)
{
  if ((a4 | a2) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }

  if (a2 != a4)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t v4 = sub_188CF73DC((uint64_t)v4);
    unint64_t v6 = *((void *)v4 + 2);
    if (!v6) {
      return v4;
    }
    goto LABEL_5;
  }

  unint64_t v5 = a3;
  uint64_t v4 = a1;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_21;
  }
  unint64_t v6 = *((void *)v4 + 2);
  if (!v6) {
    return v4;
  }
LABEL_5:
  if (v6 < 6 || ((uint64_t v7 = 8 * v6 + 32, v4 + 32 < &v5->i8[v7]) ? (v8 = &v5[2] >= (int8x16_t *)&v4[v7]) : (v8 = 1), !v8))
  {
    uint64_t v9 = 0LL;
LABEL_16:
    unint64_t v14 = v6 - v9;
    uint64_t v15 = 8 * v9 + 32;
    unint64_t v16 = &v4[v15];
    uint64_t v17 = (uint64_t *)((char *)v5->i64 + v15);
    do
    {
      uint64_t v18 = *v17++;
      *(void *)v16 ^= v18;
      v16 += 8;
      --v14;
    }

    while (v14);
    return v4;
  }

  uint64_t v9 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  BOOL v10 = v5 + 3;
  uint64_t v11 = (int8x16_t *)(v4 + 48);
  uint64_t v12 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v13 = veorq_s8(*v11, *v10);
    v11[-1] = veorq_s8(v11[-1], v10[-1]);
    *uint64_t v11 = v13;
    v10 += 2;
    v11 += 2;
    v12 -= 4LL;
  }

  while (v12);
  if (v6 != v9) {
    goto LABEL_16;
  }
  return v4;
}

int8x16_t *static BitArray.~ prefix(_:)(int8x16_t *a1, int8x16_t *a2)
{
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    a1 = (int8x16_t *)sub_188CF73DC((uint64_t)a1);
  }
  uint64_t v4 = (int8x16_t *)a1[1].i64[0];
  v6[0] = a1 + 2;
  v6[1] = v4;
  void v6[2] = a2;
  sub_188DEE680(v6);
  return a1;
}

Swift::Void __swiftcall BitArray.toggleAll()()
{
  uint64_t v1 = *v0;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v1 = (int8x16_t *)sub_188CF73DC((uint64_t)v1);
    *uint64_t v0 = v1;
  }

  unint64_t v3 = (int8x16_t *)v1[1].i64[0];
  uint64_t v4 = v0[1];
  v5[0] = v1 + 2;
  v5[1] = v3;
  v5[2] = v4;
  sub_188DEE680(v5);
  *uint64_t v0 = v1;
}

int8x16_t **sub_188DEE680(int8x16_t **result)
{
  unint64_t v1 = (unint64_t)result[1];
  if ((v1 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    return result;
  }

  BOOL v2 = *result;
  if (v1)
  {
    if (v1 >= 4)
    {
      unint64_t v3 = v1 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v4 = v2 + 1;
      unint64_t v5 = v1 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        int8x16_t v6 = vmvnq_s8(*v4);
        v4[-1] = vmvnq_s8(v4[-1]);
        *uint64_t v4 = v6;
        v4 += 2;
        v5 -= 4LL;
      }

      while (v5);
      if (v1 == v3) {
        goto LABEL_10;
      }
    }

    else
    {
      unint64_t v3 = 0LL;
    }

    unint64_t v7 = v1 - v3;
    BOOL v8 = &v2->i64[v3];
    do
    {
      *BOOL v8 = ~*v8;
      ++v8;
      --v7;
    }

    while (v7);
  }

uint64_t *BitArray.toggleAll(in:)(unint64_t a1, int64_t a2)
{
  uint64_t v6 = *(void *)(v3 + 8);
  if (v6 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  unint64_t v2 = a2;
  if (v6 < a2)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  unint64_t v4 = a1;
  unint64_t v5 = *(char **)v3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v3 = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_7:
    unint64_t v5 = sub_188CF73DC((uint64_t)v5);
    *(void *)uint64_t v3 = v5;
  }

  uint64_t v8 = *((void *)v5 + 2);
  v10[0] = (uint64_t)(v5 + 32);
  v10[1] = v8;
  _OWORD v10[2] = v6;
  uint64_t result = sub_188DEE7BC(v10, v4, v2);
  *(void *)uint64_t v3 = v5;
  return result;
}

uint64_t *sub_188DEE7BC(uint64_t *result, unint64_t a2, unint64_t a3)
{
  if (((a3 | a2) & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v3 = *result;
    unint64_t v4 = a2 >> 6;
    unint64_t v5 = a3 >> 6;
    char v6 = a2 & 0x3F;
    if (a2 >> 6 == a3 >> 6)
    {
      *(void *)(v3 + 8 * v4) ^= (-1LL << a3) ^ (-1LL << v6);
    }

    else
    {
      *(void *)(v3 + 8 * v4) ^= -1LL << v6;
      unint64_t v7 = v4 + 1;
      if (v4 + 1 < v5)
      {
        unint64_t v8 = v5 + ~v4;
        if (v8 < 4) {
          goto LABEL_9;
        }
        v7 += v8 & 0xFFFFFFFFFFFFFFFCLL;
        unint64_t v9 = (int8x16_t *)(v3 + 8 * v4 + 24);
        unint64_t v10 = v8 & 0xFFFFFFFFFFFFFFFCLL;
        do
        {
          int8x16_t v11 = vmvnq_s8(*v9);
          v9[-1] = vmvnq_s8(v9[-1]);
          *unint64_t v9 = v11;
          v9 += 2;
          v10 -= 4LL;
        }

        while (v10);
        if (v8 != (v8 & 0xFFFFFFFFFFFFFFFCLL))
        {
LABEL_9:
          unint64_t v12 = v5 - v7;
          int8x16_t v13 = (void *)(v3 + 8 * v7);
          do
          {
            *int8x16_t v13 = ~*v13;
            ++v13;
            --v12;
          }

          while (v12);
        }
      }

      if ((a3 & 0x3F) != 0) {
        *(void *)(v3 + 8 * v5) = (-1LL << (a3 & 0x3F)) ^ ~*(void *)(v3 + 8 * v5);
      }
    }
  }

  return result;
}

uint64_t *BitArray.toggleAll<A>(in:)()
{
  return BitArray.toggleAll(in:)(v1, v2);
}

uint64_t sub_188DEE920@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  char v7 = *(_BYTE *)(v6 + 18);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C74A228);
    uint64_t result = swift_allocObject();
    *(_WORD *)(result + 16) = 0;
    *(_BYTE *)(result + 18) = v7;
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FB038);
    uint64_t result = swift_allocObject();
    *(_WORD *)(result + 16) = 0;
    *(_BYTE *)(result + 18) = 0;
  }

  uint64_t v13 = result;
  __int128 v9 = 0uLL;
  if (*(unsigned __int16 *)(v6 + 16) <= a1)
  {
    uint64_t v6 = result;
    __int128 v12 = 0uLL;
  }

  else if (a1 < 1)
  {
    __int128 v9 = *(_OWORD *)(v3 + 1);
    __int128 v12 = *(_OWORD *)(v3 + 3);
    *uint64_t v3 = result;
    *(_OWORD *)(v3 + 1) = 0u;
    *(_OWORD *)(v3 + 3) = 0u;
  }

  else
  {
    if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
    {
      __int128 v10 = *((_OWORD *)v3 + 1);
      __int128 v16 = *(_OWORD *)v3;
      __int128 v17 = v10;
      uint64_t v18 = v3[4];
      sub_188D26268((uint64_t)v14);
      swift_unknownObjectRelease();
      __int128 v11 = v14[1];
      *(_OWORD *)uint64_t v3 = v14[0];
      *((_OWORD *)v3 + 1) = v11;
      v3[4] = v15;
    }

    uint64_t result = sub_188DF0A3C( v3,  *(unsigned __int16 *)(*v3 + 16) - a1,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188DF0E8C,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188DF0D98);
    uint64_t v6 = v13;
    __int128 v9 = 0u;
    __int128 v12 = 0u;
  }

  *(void *)a2 = v6;
  *(_OWORD *)(a2 + 8) = v9;
  *(_OWORD *)(a2 + 24) = v12;
  return result;
}

uint64_t sub_188DEEA7C@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3 = (uint64_t *)result;
  uint64_t v5 = *a2;
  if (!*a2) {
    goto LABEL_14;
  }
  if (!*(_WORD *)(v5 + 16))
  {
    uint64_t result = sub_188D087F8((uint64_t)a2);
LABEL_14:
    uint64_t v5 = *v3;
    uint64_t v7 = v3[1];
    uint64_t v8 = v3[2];
    uint64_t v9 = v3[3];
    uint64_t v10 = v3[4];
    uint64_t v22 = v3[5];
LABEL_27:
    *a3 = v5;
    a3[1] = v7;
    a3[2] = v8;
    a3[3] = v9;
    a3[4] = v10;
    a3[5] = v22;
    return result;
  }

  uint64_t v7 = a2[1];
  uint64_t v8 = a2[2];
  uint64_t v9 = a2[3];
  uint64_t v10 = a2[4];
  uint64_t v11 = *(void *)result;
  if (!*(void *)result)
  {
LABEL_16:
    uint64_t v22 = a2[5];
    goto LABEL_27;
  }

  if (!*(_WORD *)(v11 + 16))
  {
    uint64_t result = sub_188D087F8(result);
    goto LABEL_16;
  }

  __int128 v12 = *(_OWORD *)(result + 8);
  __int128 v13 = *(_OWORD *)(result + 24);
  uint64_t v35 = a2[4];
  *(void *)uint64_t v36 = v11;
  *(_OWORD *)&v36[8] = v12;
  *(_OWORD *)&v36[24] = v13;
  *(void *)&__int128 v33 = v5;
  *((void *)&v33 + 1) = v7;
  *(void *)&__int128 v34 = v8;
  *((void *)&v34 + 1) = v9;
  if (*(unsigned __int8 *)(v11 + 18) < *(unsigned __int8 *)(v5 + 18))
  {
    uint64_t result = sub_188DEF120(v32, (uint64_t *)v36, (uint64_t *)&v40);
    uint64_t v14 = v40;
    if (!(void)v40)
    {
      uint64_t v7 = *((void *)&v33 + 1);
      uint64_t v5 = v33;
      uint64_t v9 = *((void *)&v34 + 1);
      uint64_t v8 = v34;
      uint64_t v10 = v35;
      *(void *)&__int128 v40 = 0LL;
      MEMORY[0x1895D76E0](&v40, 8LL);
      uint64_t v22 = v40;
      goto LABEL_26;
    }

    uint64_t v15 = *((void *)&v40 + 1);
    __int128 v16 = v41;
    __int128 v37 = v40;
    __int128 v38 = v41;
    uint64_t v29 = v42;
    uint64_t v39 = v42;
    uint64_t v17 = v35;
    uint64_t v42 = v35;
    __int128 v40 = v33;
    __int128 v41 = v34;
    unsigned int v18 = *(unsigned __int8 *)(v14 + 18) + 1;
    if (((v18 >> 8) & 1) != 0)
    {
      __break(1u);
    }

    else
    {
      __int128 v19 = v41;
      uint64_t v20 = *((void *)&v40 + 1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C74A228);
      uint64_t v5 = swift_allocObject();
      *(_WORD *)(v5 + 16) = 0;
      uint64_t result = v5 + 16;
      *(_BYTE *)(v5 + 18) = v18;
      BOOL v21 = __OFADD__(v15, v20);
      uint64_t v7 = v15 + v20;
      if (!v21)
      {
        uint64_t v8 = v16 + v19;
        if (!__OFADD__((void)v16, (void)v19))
        {
          uint64_t v9 = *((void *)&v16 + 1) + *((void *)&v19 + 1);
          if (!__OFADD__(*((void *)&v16 + 1), *((void *)&v19 + 1)))
          {
            BOOL v21 = __OFADD__(v29, v17);
            uint64_t v10 = v29 + v17;
            if (!v21)
            {
              sub_188DF08F4((_WORD *)result, v5 + 24, (uint64_t)&v37, (uint64_t)&v40);
              uint64_t v31 = 0LL;
              MEMORY[0x1895D76E0](&v31, 8LL);
              swift_unknownObjectRelease();
              sub_188D087F8((uint64_t)&v40);
              uint64_t v22 = v31;
LABEL_26:
              uint64_t result = swift_unknownObjectRelease();
              goto LABEL_27;
            }

            goto LABEL_36;
          }

          goto LABEL_31;
        }

uint64_t sub_188DEEDC0@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v4 = v3;
  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    __int128 v8 = v3[1];
    __int128 v69 = *v3;
    __int128 v70 = v8;
    uint64_t v71 = *((void *)v3 + 4);
    sub_188D26268((uint64_t)v59);
    swift_unknownObjectRelease();
    __int128 v9 = v59[1];
    *uint64_t v3 = v59[0];
    v3[1] = v9;
    *((void *)v3 + 4) = v60;
  }

  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    __int128 v10 = *((_OWORD *)a2 + 1);
    __int128 v66 = *(_OWORD *)a2;
    __int128 v67 = v10;
    uint64_t v68 = a2[4];
    sub_188D26268((uint64_t)v61);
    swift_unknownObjectRelease();
    __int128 v11 = v61[1];
    *(_OWORD *)a2 = v61[0];
    *((_OWORD *)a2 + 1) = v11;
    a2[4] = v62;
  }

  if (*(unsigned __int8 *)(*a2 + 18) >= *(unsigned __int8 *)(*(void *)v3 + 18LL))
  {
    uint64_t v36 = *((void *)v3 + 1);
    uint64_t v35 = *((void *)v3 + 2);
    uint64_t v50 = *((void *)v3 + 4);
    uint64_t v52 = *((void *)v3 + 3);
    if (sub_188DEF4CC(a2))
    {
      uint64_t result = 0LL;
      uint64_t v12 = 0LL;
      uint64_t v13 = 0LL;
      uint64_t v14 = 0LL;
      uint64_t v15 = 0LL;
    }

    else
    {
      uint64_t v12 = a2[1];
      uint64_t v13 = a2[2];
      uint64_t v14 = a2[3];
      uint64_t v15 = a2[4];
      uint64_t result = swift_unknownObjectRetain();
    }

    uint64_t v37 = v4[1];
    BOOL v19 = __OFSUB__(v37, v36);
    uint64_t v38 = v37 - v36;
    if (!v19)
    {
      uint64_t v39 = v4[2];
      BOOL v19 = __OFSUB__(v39, v35);
      uint64_t v40 = v39 - v35;
      if (!v19)
      {
        uint64_t v41 = v4[3];
        BOOL v19 = __OFSUB__(v41, v52);
        uint64_t v42 = v41 - v52;
        if (!v19)
        {
          uint64_t v43 = v4[4];
          BOOL v19 = __OFSUB__(v43, v50);
          uint64_t v44 = v43 - v50;
          if (!v19)
          {
            *a1 = v38;
            a1[1] = v40;
            a1[2] = v42;
            a1[3] = v44;
            goto LABEL_31;
          }

          goto LABEL_39;
        }

uint64_t sub_188DEF120@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v4 = (uint64_t *)v3;
  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    __int128 v8 = v3[1];
    __int128 v77 = *v3;
    __int128 v78 = v8;
    uint64_t v79 = *((void *)v3 + 4);
    sub_188D26268((uint64_t)v67);
    swift_unknownObjectRelease();
    __int128 v9 = v67[1];
    *uint64_t v3 = v67[0];
    v3[1] = v9;
    *((void *)v3 + 4) = v68;
  }

  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    __int128 v10 = *((_OWORD *)a2 + 1);
    __int128 v74 = *(_OWORD *)a2;
    __int128 v75 = v10;
    uint64_t v76 = a2[4];
    sub_188D26268((uint64_t)v69);
    swift_unknownObjectRelease();
    __int128 v11 = v69[1];
    *(_OWORD *)a2 = v69[0];
    *((_OWORD *)a2 + 1) = v11;
    a2[4] = v70;
  }

  if (*(unsigned __int8 *)(*a2 + 18) >= *(unsigned __int8 *)(*(void *)v3 + 18LL))
  {
    uint64_t v59 = a1;
    uint64_t v41 = a2[1];
    uint64_t v42 = a2[2];
    uint64_t v44 = a2[3];
    uint64_t v43 = a2[4];
    uint64_t result = sub_188DEF4CC((uint64_t *)v3);
    if ((result & 1) != 0)
    {
      uint64_t result = 0LL;
      uint64_t v12 = 0LL;
      uint64_t v13 = 0LL;
      uint64_t v45 = v43;
      uint64_t v14 = 0LL;
      uint64_t v15 = 0LL;
      uint64_t v46 = *v4;
      __int128 v47 = *(_OWORD *)(a2 + 1);
      __int128 v48 = *(_OWORD *)(a2 + 3);
      *unint64_t v4 = *a2;
      __int128 v49 = *(_OWORD *)(v4 + 1);
      *(_OWORD *)(v4 + 1) = v47;
      __int128 v50 = *(_OWORD *)(v4 + 3);
      *(_OWORD *)(v4 + 3) = v48;
      *a2 = v46;
      *(_OWORD *)(a2 + 1) = v49;
      *(_OWORD *)(a2 + 3) = v50;
      *uint64_t v59 = v41;
      v59[1] = v42;
      _OWORD v59[2] = v44;
      v59[3] = v45;
      goto LABEL_30;
    }

    uint64_t v12 = a2[1];
    if (!__OFSUB__(v41, v12))
    {
      uint64_t v13 = a2[2];
      if (!__OFSUB__(v42, v13))
      {
        uint64_t v51 = v43;
        uint64_t v14 = a2[3];
        if (!__OFSUB__(v44, v14))
        {
          uint64_t v15 = a2[4];
          BOOL v19 = __OFSUB__(v51, v15);
          uint64_t v52 = v51 - v15;
          if (!v19)
          {
            *uint64_t v59 = v41 - v12;
            v59[1] = v42 - v13;
            _OWORD v59[2] = v44 - v14;
            v59[3] = v52;
            uint64_t result = swift_unknownObjectRetain();
            goto LABEL_30;
          }

          goto LABEL_38;
        }

BOOL sub_188DEF4CC(uint64_t *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(unsigned __int16 *)(*v1 + 16);
  if (*(_WORD *)(*v1 + 16))
  {
    uint64_t v5 = *(unsigned __int16 *)(*a1 + 16);
    if (v4 >= 8 && v5 >= 8)
    {
      return 0LL;
    }

    else
    {
      sub_188DEFD8C(v1, a1, (unint64_t)(v5 + v4) >> ((unint64_t)(v5 + v4) > 0xF));
      return *(_WORD *)(*a1 + 16) == 0;
    }
  }

  else
  {
    __int128 v8 = *(_OWORD *)(a1 + 1);
    __int128 v9 = *(_OWORD *)(a1 + 3);
    *unint64_t v1 = *a1;
    __int128 v10 = *(_OWORD *)(v1 + 1);
    *(_OWORD *)(v1 + 1) = v8;
    __int128 v11 = *(_OWORD *)(v1 + 3);
    *(_OWORD *)(v1 + 3) = v9;
    *a1 = v3;
    *(_OWORD *)(a1 + 1) = v10;
    BOOL result = 1LL;
    *(_OWORD *)(a1 + 3) = v11;
  }

  return result;
}

uint64_t sub_188DEF570(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    __int128 v8 = v1[1];
    __int128 v25 = *v1;
    __int128 v26 = v8;
    uint64_t v27 = *((void *)v1 + 4);
    sub_188D26268((uint64_t)v23);
    uint64_t result = swift_unknownObjectRelease();
    __int128 v9 = v23[1];
    *unint64_t v1 = v23[0];
    v1[1] = v9;
    *((void *)v1 + 4) = v24;
  }

  uint64_t v10 = *((void *)v1 + 1);
  BOOL v11 = __OFADD__(v10, v4);
  uint64_t v12 = v10 + v4;
  if (v11)
  {
    __break(1u);
    goto LABEL_10;
  }

  *((void *)v1 + 1) = v12;
  uint64_t v13 = *((void *)v1 + 2);
  BOOL v11 = __OFADD__(v13, v3);
  uint64_t v14 = v13 + v3;
  if (v11)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  *((void *)v1 + 2) = v14;
  uint64_t v15 = *((void *)v1 + 3);
  BOOL v11 = __OFADD__(v15, v6);
  uint64_t v16 = v15 + v6;
  if (v11)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  *((void *)v1 + 3) = v16;
  uint64_t v17 = *((void *)v1 + 4);
  BOOL v11 = __OFADD__(v17, v5);
  uint64_t v18 = v17 + v5;
  if (v11)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  *((void *)v1 + 4) = v18;
  uint64_t v19 = *(void *)v1;
  int v20 = *(unsigned __int16 *)(*(void *)v1 + 16LL);
  uint64_t v21 = *(void *)v1 + 40LL * *(unsigned __int16 *)(*(void *)v1 + 16LL);
  __int128 v22 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v21 + 24) = *(_OWORD *)a1;
  *(_OWORD *)(v21 + 40) = v22;
  *(void *)(v21 + 56) = *(void *)(a1 + 32);
  if (v20 != 0xFFFF)
  {
    *(_WORD *)(v19 + 16) = v20 + 1;
    return result;
  }

_WORD *sub_188DEF688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  ++v4[5];
  if (!*v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FB038);
    uint64_t v25 = swift_allocObject();
    *(_WORD *)(v25 + 16) = 0;
    *(_BYTE *)(v25 + 18) = 0;
    v31[0] = v25;
    uint64_t result = (_WORD *)sub_188DEFFD8(a1, a2, a3 & 0xFFFFFFFFFFFFLL);
    uint64_t v19 = v31[0];
    uint64_t v22 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v23 = 0LL;
    goto LABEL_10;
  }

  sub_188DEF844(a1, a2, a3 & 0xFFFFFFFFFFFFLL, (uint64_t)v28);
  uint64_t v8 = v28[0];
  uint64_t v9 = v28[1];
  uint64_t v11 = v28[2];
  uint64_t v10 = v28[3];
  uint64_t v12 = v28[4];
  uint64_t result = (_WORD *)sub_188D011B8((uint64_t)v28, (uint64_t)v29);
  if (!v29[0]) {
    return result;
  }
  v31[0] = v8;
  v31[1] = v9;
  v31[2] = v11;
  v31[3] = v10;
  uint64_t v27 = v10;
  v31[4] = v12;
  uint64_t v14 = v4[1];
  uint64_t v16 = v4[2];
  uint64_t v15 = v4[3];
  uint64_t v17 = v4[4];
  v30[0] = *v4;
  v30[1] = v14;
  v30[2] = v16;
  v30[3] = v15;
  v30[4] = v17;
  unsigned int v18 = *(unsigned __int8 *)(v30[0] + 18LL) + 1;
  if (((v18 >> 8) & 1) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v26 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C74A228);
  uint64_t v19 = swift_allocObject();
  *(_WORD *)(v19 + 16) = 0;
  uint64_t result = (_WORD *)(v19 + 16);
  *(_BYTE *)(v19 + 18) = v18;
  BOOL v20 = __OFADD__(v14, v9);
  uint64_t v21 = v14 + v9;
  if (v20)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  BOOL v20 = __OFADD__(v16, v11);
  uint64_t v22 = v16 + v11;
  if (v20)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v23 = v15 + v27;
  if (__OFADD__(v15, v27))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  uint64_t v24 = v17 + v26;
  if (__OFADD__(v17, v26))
  {
LABEL_16:
    __break(1u);
    return result;
  }

  sub_188DF08F4(result, v19 + 24, (uint64_t)v30, (uint64_t)v31);
  sub_188D087F8((uint64_t)v28);
  uint64_t result = (_WORD *)swift_unknownObjectRelease();
LABEL_10:
  *uint64_t v4 = v19;
  v4[1] = v21;
  v4[2] = v22;
  v4[3] = v23;
  v4[4] = v24;
  return result;
}

double sub_188DEF844@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  LOWORD(v37) = a3;
  BYTE2(v37) = BYTE2(a3);
  HIBYTE(v37) = BYTE3(a3);
  unsigned __int8 v38 = BYTE4(a3);
  unsigned __int8 v39 = BYTE5(a3);
  uint64_t v7 = *v4;
  if ((a3 & 0xFCu) <= 0x7BuLL
    && *(_WORD *)(v7 + 16)
    && (v45[0] = *(unsigned __int8 *)(v7 + 18),
        sub_188DF13F0(v45, (uint64_t)v28),
        char v8 = sub_188D32D64((uint64_t)&v35),
        sub_188DF153C((uint64_t)v45, (uint64_t)v28, v9),
        swift_bridgeObjectRelease(),
        (v8 & 1) != 0))
  {
    memset(v40, 0, 40);
  }

  else
  {
    if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
    {
      __int128 v10 = *((_OWORD *)v4 + 1);
      v28[0] = *(_OWORD *)v4;
      v28[1] = v10;
      uint64_t v29 = v4[4];
      sub_188D26268((uint64_t)v41);
      swift_unknownObjectRelease();
      __int128 v11 = v41[1];
      *(_OWORD *)uint64_t v4 = v41[0];
      *((_OWORD *)v4 + 1) = v11;
      v4[4] = v42;
    }

    uint64_t v12 = *v4;
    if (*(_BYTE *)(*v5 + 18))
    {
      __int128 v13 = *(_OWORD *)(v5 + 3);
      __int128 v33 = *(_OWORD *)(v5 + 1);
      __int128 v34 = v13;
      swift_unknownObjectRetain();
      sub_188DEFBA8((unsigned __int16 *)(v12 + 16), v12 + 24, &v33, &v35, (uint64_t)v43);
      uint64_t v14 = v43[0];
      uint64_t v15 = v43[1];
      uint64_t v16 = v43[2];
      uint64_t v17 = v43[3];
      uint64_t v18 = v43[4];
      swift_unknownObjectRelease();
      __int128 v19 = v34;
      *(_OWORD *)(v5 + 1) = v33;
      *(_OWORD *)(v5 + 3) = v19;
      sub_188D011B8((uint64_t)v43, (uint64_t)v44);
      if (v44[0])
      {
        v45[0] = v14;
        v45[1] = v15;
        v45[2] = v16;
        v45[3] = v17;
        v45[4] = v18;
        BOOL v20 = (_WORD *)(*v5 + 16);
        uint64_t v21 = *v5 + 24;
        sub_188D07F48((uint64_t)v43);
        swift_unknownObjectRetain();
        sub_188DEFD0C(v20, v21);
        swift_unknownObjectRelease();
        if (*(_WORD *)(*v5 + 16) == 15)
        {
          sub_188DEE920(8LL, (uint64_t)&v30);
          sub_188DEF570((uint64_t)v45);
          sub_188D087F8((uint64_t)v43);
          *(void *)&v40[0] = v30;
          *(_OWORD *)((char *)v40 + 8) = v31;
          *(_OWORD *)((char *)&v40[1] + 8) = v32;
        }

        else
        {
          sub_188DEF570((uint64_t)v45);
          sub_188D087F8((uint64_t)v43);
          memset(v40, 0, 40);
        }
      }

      else
      {
        sub_188D011B8((uint64_t)v43, (uint64_t)v40);
      }
    }

    else
    {
      if (*(_WORD *)(v12 + 16) != 15)
      {
        sub_188DEFFD8(v35, v36, v37 | ((unint64_t)v38 << 32) | ((unint64_t)v39 << 40));
        memset(v40, 0, 40);
        goto LABEL_16;
      }

      sub_188DEE920(8LL, (uint64_t)v40);
      uint64_t v22 = v35;
      uint64_t v23 = v36;
      unint64_t v24 = v37 | ((unint64_t)v38 << 32) | ((unint64_t)v39 << 40);
      swift_bridgeObjectRetain();
      sub_188DEFFD8(v22, v23, v24);
    }
  }

  swift_bridgeObjectRelease();
LABEL_16:
  uint64_t v25 = *(void *)&v40[2];
  double result = *(double *)v40;
  __int128 v27 = v40[1];
  *(_OWORD *)a4 = v40[0];
  *(_OWORD *)(a4 + 16) = v27;
  *(void *)(a4 + 32) = v25;
  return result;
}

uint64_t (*sub_188DEFB40(void *a1))()
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  v3[8] = v1;
  uint64_t v5 = *(unsigned __int8 *)(*(void *)v1 + 18LL);
  sub_188DF13F0(&v5, (uint64_t)v3);
  return sub_188DEFBA4;
}

unsigned __int16 *sub_188DEFBA8@<X0>( unsigned __int16 *result@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = a2 + 40LL * *result;
  uint64_t v9 = *(void *)(v6 - 16);
  char v8 = (uint64_t *)(v6 - 16);
  uint64_t v7 = v9;
  __int128 v11 = v8 - 2;
  uint64_t v10 = *(v8 - 2);
  uint64_t v12 = *a3 - v10;
  if (__OFSUB__(*a3, v10))
  {
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v14 = v8[1];
  uint64_t v15 = *(v8 - 1);
  *a3 = v12;
  uint64_t v16 = a3[1];
  BOOL v17 = __OFSUB__(v16, v15);
  uint64_t v18 = v16 - v15;
  if (v17)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  a3[1] = v18;
  uint64_t v19 = a3[2];
  BOOL v17 = __OFSUB__(v19, v7);
  uint64_t v20 = v19 - v7;
  if (v17)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  a3[2] = v20;
  uint64_t v21 = a3[3];
  BOOL v17 = __OFSUB__(v21, v14);
  uint64_t v22 = v21 - v14;
  if (v17)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  a3[3] = v22;
  uint64_t v23 = *a4;
  uint64_t v24 = a4[1];
  unint64_t v25 = *((unsigned int *)a4 + 4) | ((unint64_t)*((unsigned __int8 *)a4 + 20) << 32) | ((unint64_t)*((unsigned __int8 *)a4 + 21) << 40);
  swift_bridgeObjectRetain();
  double result = (unsigned __int16 *)sub_188DEF844(v35, v23, v24, v25);
  if (__OFADD__(*a3, *v11))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v26 = *v8;
  uint64_t v27 = v8[1];
  uint64_t v28 = *(v8 - 1);
  *a3 += *v11;
  uint64_t v29 = a3[1];
  BOOL v17 = __OFADD__(v29, v28);
  uint64_t v30 = v29 + v28;
  if (v17)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  a3[1] = v30;
  uint64_t v31 = a3[2];
  BOOL v17 = __OFADD__(v31, v26);
  uint64_t v32 = v31 + v26;
  if (v17)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  a3[2] = v32;
  uint64_t v33 = a3[3];
  BOOL v17 = __OFADD__(v33, v27);
  uint64_t v34 = v33 + v27;
  if (!v17)
  {
    a3[3] = v34;
    return (unsigned __int16 *)sub_188D011B8((uint64_t)v35, a5);
  }

uint64_t *sub_188DEFD0C(_WORD *a1, uint64_t a2)
{
  uint64_t v4 = (unsigned __int16)*a1;
  uint64_t v5 = a2 + 40 * v4;
  uint64_t v7 = *(void *)(v5 - 40);
  uint64_t v6 = (uint64_t *)(v5 - 40);
  double result = v6 - 5;
  unint64_t v9 = *(unsigned __int16 *)(v7 + 16) + (unint64_t)*(unsigned __int16 *)(*(v6 - 5) + 16);
  if (v9 <= 0xF)
  {
    uint64_t v10 = (void *)(v4 - 1);
    sub_188DEFD8C(result, v6, v9);
    sub_188DEFEBC(v10, a1, a2, (uint64_t)v11);
    return (uint64_t *)sub_188D087F8((uint64_t)v11);
  }

  return result;
}

uint64_t sub_188DEFD8C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    __int128 v6 = *((_OWORD *)a1 + 1);
    __int128 v25 = *(_OWORD *)a1;
    __int128 v26 = v6;
    uint64_t v27 = a1[4];
    sub_188D26268((uint64_t)v18);
    swift_unknownObjectRelease();
    __int128 v7 = v18[1];
    *(_OWORD *)a1 = v18[0];
    *((_OWORD *)a1 + 1) = v7;
    a1[4] = v19;
  }

  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    __int128 v9 = *((_OWORD *)a2 + 1);
    __int128 v22 = *(_OWORD *)a2;
    __int128 v23 = v9;
    uint64_t v24 = a2[4];
    sub_188D26268((uint64_t)v20);
    uint64_t result = swift_unknownObjectRelease();
    __int128 v10 = v20[1];
    *(_OWORD *)a2 = v20[0];
    *((_OWORD *)a2 + 1) = v10;
    a2[4] = v21;
  }

  uint64_t v11 = *(unsigned __int16 *)(*a1 + 16);
  uint64_t v12 = *(unsigned __int16 *)(*a2 + 16) + v11;
  if (v12 >= a3) {
    uint64_t v12 = a3;
  }
  uint64_t v13 = v12 - v11;
  if (__OFSUB__(v12, v11))
  {
    __break(1u);
    goto LABEL_16;
  }

  if (!v13) {
    return result;
  }
  if (v13 <= 0)
  {
    BOOL v17 = __OFSUB__(0LL, v13);
    uint64_t v13 = v11 - v12;
    if (!v17)
    {
      uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188DF0E8C;
      uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188DF0D98;
      uint64_t v16 = a1;
      return sub_188DF0A3C(v16, v13, v14, v15);
    }

void *sub_188DEFEBC@<X0>(void *result@<X0>, _WORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = (unsigned __int16)*a2;
  BOOL v6 = __OFSUB__(v5, result);
  uint64_t v7 = v5 - (void)result;
  if (v6)
  {
    __break(1u);
    goto LABEL_6;
  }

  BOOL v6 = __OFSUB__(v7, 1LL);
  uint64_t v8 = v7 - 1;
  if (v6)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  __int128 v10 = (uint64_t *)(a3 + 40LL * (void)result);
  uint64_t v11 = *v10;
  __int128 v12 = *(_OWORD *)(v10 + 3);
  __int128 v13 = *(_OWORD *)(v10 + 1);
  uint64_t result = memmove(v10, v10 + 5, 40 * v8);
  if (*a2)
  {
    --*a2;
    *(void *)a4 = v11;
    *(_OWORD *)(a4 + 8) = v13;
    *(_OWORD *)(a4 + 24) = v12;
    return result;
  }

void *sub_188DEFF58@<X0>(uint64_t a1@<X0>, _WORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = (void *)(a3 + 24 * a1);
  uint64_t v6 = result[1];
  __int16 v7 = *((_WORD *)result + 10);
  *(void *)a4 = *result;
  *(void *)(a4 + 8) = v6;
  *(_DWORD *)(a4 + 16) = *((_DWORD *)result + 4);
  *(_WORD *)(a4 + 20) = v7;
  uint64_t v8 = (unsigned __int16)*a2;
  BOOL v9 = __OFSUB__(v8, a1);
  uint64_t v10 = v8 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_6;
  }

  BOOL v9 = __OFSUB__(v10, 1LL);
  uint64_t v11 = v10 - 1;
  if (v9)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  uint64_t result = memmove(result, result + 3, 24 * v11);
  if (*a2)
  {
    --*a2;
    return result;
  }

uint64_t sub_188DEFFD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    __int128 v8 = v3[1];
    __int128 v23 = *v3;
    __int128 v24 = v8;
    uint64_t v25 = *((void *)v3 + 4);
    sub_188D26268((uint64_t)v21);
    uint64_t result = swift_unknownObjectRelease();
    __int128 v9 = v21[1];
    *uint64_t v3 = v21[0];
    v3[1] = v9;
    *((void *)v3 + 4) = v22;
  }

  uint64_t v10 = *((void *)v3 + 1);
  if (__OFADD__(v10, BYTE3(a3)))
  {
    __break(1u);
    goto LABEL_10;
  }

  *((void *)v3 + 1) = v10 + BYTE3(a3);
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, BYTE2(a3));
  uint64_t v13 = v11 + BYTE2(a3);
  if (v12)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  *((void *)v3 + 2) = v13;
  uint64_t v14 = *((void *)v3 + 3);
  BOOL v12 = __OFADD__(v14, BYTE1(a3));
  uint64_t v15 = v14 + BYTE1(a3);
  if (v12)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  *((void *)v3 + 3) = v15;
  uint64_t v16 = *((void *)v3 + 4);
  BOOL v12 = __OFADD__(v16, a3);
  uint64_t v17 = v16 + a3;
  if (v12)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  *((void *)v3 + 4) = v17;
  uint64_t v18 = *(void *)v3;
  int v19 = *(unsigned __int16 *)(*(void *)v3 + 16LL);
  uint64_t v20 = *(void *)v3 + 24LL * *(unsigned __int16 *)(*(void *)v3 + 16LL);
  *(void *)(v20 + 24) = a1;
  *(void *)(v20 + 32) = a2;
  *(_WORD *)(v20 + 40) = a3;
  *(_BYTE *)(v20 + 42) = BYTE2(a3);
  *(_BYTE *)(v20 + 43) = BYTE3(a3);
  *(_BYTE *)(v20 + 44) = BYTE4(a3);
  *(_BYTE *)(v20 + 45) = BYTE5(a3);
  if (v19 != 0xFFFF)
  {
    *(_WORD *)(v18 + 16) = v19 + 1;
    return result;
  }

uint64_t sub_188DF010C(_OWORD *a1)
{
  uint64_t v3 = sub_188DF8B4C();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](v3);
  __int16 v7 = (char *)&v21[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = MEMORY[0x1895F8858](v5);
  uint64_t v10 = (char *)&v21[-1] - v9;
  __int128 v11 = a1[2];
  v22[1] = a1[1];
  __int128 v23 = v11;
  v22[0] = *a1;
  if (*(void *)&v22[0])
  {
    uint64_t v12 = v23;
    if (!(void)v23) {
      return sub_188D087F8((uint64_t)a1);
    }
    uint64_t v13 = *v1;
    if (*v1)
    {
      uint64_t v15 = v1[3];
      uint64_t v14 = v1[4];
      uint64_t v24 = *v1;
      __int128 v25 = *(_OWORD *)(v1 + 1);
      uint64_t v26 = v15;
      uint64_t v27 = v14;
      if (v14)
      {
        unint64_t v16 = *(unsigned __int8 *)(v13 + 18);
        swift_unknownObjectRetain();
        sub_188D36E50(v16, (uint64_t)v21);
        swift_unknownObjectRelease();
        unint64_t v17 = sub_188DC6D38(v21[0], v21[1]);
        uint64_t result = swift_bridgeObjectRelease();
        if ((v17 & 0x100000000LL) != 0)
        {
          __break(1u);
        }

        else
        {
          sub_188DF8B40();
          LOBYTE(v21[0]) = 0;
          sub_188D20C84((v12 << 11) | 0x300, 0LL, 0LL, (uint64_t *)1, v17, (unint64_t)v7);
          sub_188D22708((uint64_t)v10);
          sub_188DF3508((uint64_t *)v22);
          uint64_t v18 = *(void (**)(char *, uint64_t))(v4 + 8);
          v18(v7, v3);
          return ((uint64_t (*)(char *, uint64_t))v18)(v10, v3);
        }

        return result;
      }

      uint64_t result = swift_unknownObjectRelease();
    }

    __int128 v19 = a1[1];
    *(_OWORD *)uint64_t v1 = *a1;
    *((_OWORD *)v1 + 1) = v19;
    *((_OWORD *)v1 + 2) = a1[2];
  }

  return result;
}

void sub_188DF02D8(__int128 *a1, unint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_188DF8B4C();
  uint64_t v7 = MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v7);
  uint64_t v12 = (char *)&v30 - v11;
  if ((a2[4] ^ *a2) < 0x800)
  {
    sub_188D087F8((uint64_t)a1);
    return;
  }

  uint64_t v13 = *v3;
  if (!*v3) {
    goto LABEL_9;
  }
  if (!v3[4])
  {
    swift_unknownObjectRelease();
LABEL_9:
    sub_188DDEAD8(a1, a2, &v59);
    __int128 v22 = v60;
    *(_OWORD *)uint64_t v3 = v59;
    *((_OWORD *)v3 + 1) = v22;
    *((_OWORD *)v3 + 2) = v61;
    return;
  }

  uint64_t v37 = v3[4];
  uint64_t v39 = v10;
  uint64_t v14 = v3[1];
  uint64_t v35 = v3[2];
  uint64_t v36 = v14;
  uint64_t v34 = v3[3];
  __int128 v15 = a1[1];
  v52[0] = *a1;
  v52[1] = v15;
  v52[2] = a1[2];
  sub_188D011B8((uint64_t)v52, (uint64_t)v53);
  sub_188D07F48((uint64_t)v53);
  sub_188DDEAD8(a1, a2, &v47);
  uint64_t v16 = v47;
  uint64_t v38 = v51;
  __int128 v43 = v47;
  uint64_t v44 = v48;
  uint64_t v45 = v49;
  uint64_t v46 = v50;
  __int128 v62 = v47;
  uint64_t v32 = v48;
  uint64_t v33 = *((void *)&v47 + 1);
  uint64_t v63 = v48;
  uint64_t v64 = v49;
  uint64_t v30 = v50;
  uint64_t v31 = v49;
  uint64_t v65 = v50;
  unint64_t v17 = *(unsigned __int8 *)(v47 + 18);
  swift_unknownObjectRetain();
  sub_188D36E50(v17, (uint64_t)&v59);
  unint64_t v18 = sub_188DC6D38(v59, *((unint64_t *)&v59 + 1));
  swift_bridgeObjectRelease();
  if ((v18 & 0x100000000LL) != 0)
  {
    __break(1u);
  }

  else
  {
    sub_188D087F8((uint64_t)&v47);
    sub_188DF8B40();
    uint64_t v19 = v3[5];
    *(void *)&__int128 v59 = v13;
    *((void *)&v59 + 1) = v36;
    *(void *)&__int128 v60 = v35;
    *((void *)&v60 + 1) = v34;
    *(void *)&__int128 v61 = v37;
    *((void *)&v61 + 1) = v19;
    LOBYTE(v54) = 0;
    uint64_t v20 = sub_188D20C84((v37 << 11) | 0x300, 0LL, 0LL, (uint64_t *)1, v18, (unint64_t)v9);
    if (v16) {
      uint64_t v21 = *(unsigned __int8 *)(v16 + 18);
    }
    else {
      uint64_t v21 = 0LL;
    }
    uint64_t v23 = v38;
    v42[0] = v38;
    v42[1] = v21;
    v42[2] = 0LL;
    MEMORY[0x1895F8858](v20);
    *(&v30 - 2) = (uint64_t)v12;
    *(&v30 - 1) = (uint64_t)v9;
    uint64_t v40 = 0LL;
    char v41 = 1;
    if (v16)
    {
      sub_188D25420( &v54,  (uint64_t)v42,  &v43,  (uint64_t)&v40,  (void (*)(void *__return_ptr))sub_188D955B4,  (uint64_t)(&v30 - 4));
      ++v23;
      uint64_t v25 = *((void *)&v43 + 1);
      uint64_t v24 = v43;
      uint64_t v26 = v44;
      uint64_t v27 = v45;
      uint64_t v28 = v46;
    }

    else
    {
      uint64_t v24 = 0LL;
      uint64_t v26 = v32;
      uint64_t v25 = v33;
      uint64_t v28 = v30;
      uint64_t v27 = v31;
    }

    *(void *)&__int128 v54 = v24;
    *((void *)&v54 + 1) = v25;
    uint64_t v55 = v26;
    uint64_t v56 = v27;
    uint64_t v57 = v28;
    uint64_t v58 = v23;
    swift_unknownObjectRetain();
    sub_188DF32E8((uint64_t *)&v54);
    sub_188D087F8((uint64_t)a1);
    uint64_t v29 = *(void (**)(char *, uint64_t))(v39 + 8);
    v29(v9, v6);
    v29(v12, v6);
    swift_unknownObjectRelease();
  }

uint64_t sub_188DF05EC(__int128 *a1, unint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_188DF8B4C();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v6);
  uint64_t v10 = &v23[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v8);
  uint64_t v12 = &v23[-v11];
  if ((a2[4] ^ *a2) < 0x800) {
    return sub_188D087F8((uint64_t)a1);
  }
  __int128 v14 = a1[1];
  v29[0] = *a1;
  v29[1] = v14;
  v29[2] = a1[2];
  sub_188D011B8((uint64_t)v29, (uint64_t)v30);
  sub_188D07F48((uint64_t)v30);
  sub_188DDEAD8(a1, a2, &v24);
  uint64_t v15 = *v3;
  if (!*v3)
  {
    uint64_t result = sub_188D087F8((uint64_t)a1);
LABEL_12:
    __int128 v22 = v25;
    *(_OWORD *)uint64_t v3 = v24;
    *((_OWORD *)v3 + 1) = v22;
    *((_OWORD *)v3 + 2) = v26;
    return result;
  }

  uint64_t v17 = v3[3];
  uint64_t v16 = v3[4];
  uint64_t v31 = *v3;
  __int128 v32 = *(_OWORD *)(v3 + 1);
  uint64_t v33 = v17;
  uint64_t v34 = v16;
  if (!v16)
  {
    sub_188D087F8((uint64_t)a1);
    uint64_t result = swift_unknownObjectRelease();
    goto LABEL_12;
  }

  unint64_t v18 = *(unsigned __int8 *)(v15 + 18);
  swift_unknownObjectRetain();
  sub_188D36E50(v18, (uint64_t)v27);
  swift_unknownObjectRelease();
  unint64_t v19 = sub_188DC6D38(*(unint64_t *)&v27[0], *((unint64_t *)&v27[0] + 1));
  uint64_t result = swift_bridgeObjectRelease();
  if ((v19 & 0x100000000LL) != 0)
  {
    __break(1u);
  }

  else
  {
    sub_188DF8B40();
    v27[0] = v24;
    v27[1] = v25;
    __int128 v28 = v26;
    if ((void)v24) {
      unint64_t v20 = ((void)v28 << 11) | 0x300LL;
    }
    else {
      unint64_t v20 = 768LL;
    }
    v23[12] = 0;
    sub_188D20C84(v20, 0LL, 0LL, (uint64_t *)1, v19, (unint64_t)v10);
    sub_188D22708((uint64_t)v12);
    swift_unknownObjectRetain();
    sub_188DF3508((uint64_t *)v27);
    sub_188D087F8((uint64_t)a1);
    sub_188D087F8((uint64_t)&v24);
    uint64_t v21 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v21(v10, v6);
    return ((uint64_t (*)(_BYTE *, uint64_t))v21)(v12, v6);
  }

  return result;
}

double sub_188DF0858@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  *(_WORD *)(v2 + 16) = 0;
  *(_BYTE *)(v2 + 18) = 0;
  *(void *)a1 = v2;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  return result;
}

double sub_188DF08A4@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = swift_allocObject();
  *(_WORD *)(v4 + 16) = 0;
  *(_BYTE *)(v4 + 18) = a1;
  *(void *)a2 = v4;
  double result = 0.0;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  return result;
}

_WORD *sub_188DF08F4(_WORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = (unsigned __int16)*result;
  uint64_t v5 = a2 + 40LL * (unsigned __int16)*result;
  __int128 v6 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a3;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a3 + 32);
  if (v4 == 0xFFFF)
  {
    __break(1u);
  }

  else
  {
    *double result = v4 + 1;
    uint64_t v8 = a2 + 40LL * (v4 + 1);
    __int128 v9 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)a4;
    *(_OWORD *)(v8 + 16) = v9;
    *(void *)(v8 + 32) = *(void *)(a4 + 32);
    if (v4 != 65534)
    {
      *double result = v4 + 2;
      sub_188D07F48(a3);
      return (_WORD *)sub_188D07F48(a4);
    }
  }

  __break(1u);
  return result;
}

void *sub_188DF097C(void *result, uint64_t a2, unint64_t a3, uint64_t a4, _WORD *a5, uint64_t a6)
{
  uint64_t v6 = (unsigned __int16)*a5;
  BOOL v7 = __OFSUB__(v6, a4);
  uint64_t v8 = v6 - a4;
  if (v7)
  {
    __break(1u);
  }

  else
  {
    char v10 = a3;
    uint64_t v12 = result;
    unint64_t v13 = a3 >> 40;
    unint64_t v14 = HIDWORD(a3);
    uint64_t v15 = (void *)(a6 + 24 * a4);
    unint64_t v16 = a3 >> 24;
    unint64_t v17 = a3 >> 16;
    unint64_t v18 = a3 >> 8;
    double result = memmove(v15 + 3, v15, 24 * v8);
    *uint64_t v15 = v12;
    v15[1] = a2;
    *((_BYTE *)v15 + 16) = v10;
    *((_BYTE *)v15 + 17) = v18;
    *((_BYTE *)v15 + 18) = v17;
    *((_BYTE *)v15 + 19) = v16;
    *((_BYTE *)v15 + 20) = v14;
    *((_BYTE *)v15 + 21) = v13;
    int v19 = (unsigned __int16)*a5;
    if (v19 != 0xFFFF)
    {
      *a5 = v19 + 1;
      return result;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_188DF0A3C( uint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = *v4;
  int v10 = *(unsigned __int8 *)(*v4 + 18LL);
  uint64_t v11 = *v4 + 24LL;
  uint64_t v12 = *a1;
  uint64_t v13 = *a1 + 24;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v14 = v9 + 16;
  uint64_t v15 = v12 + 16;
  if (v10) {
    uint64_t v16 = a4(v15, v13, a2, v14, v11);
  }
  else {
    uint64_t v16 = a3(v15, v13, a2, v14, v11);
  }
  uint64_t v20 = v16;
  uint64_t v21 = v17;
  uint64_t v22 = v18;
  uint64_t v23 = v19;
  swift_unknownObjectRelease();
  uint64_t result = swift_unknownObjectRelease();
  uint64_t v25 = v4[1];
  BOOL v26 = __OFADD__(v25, v20);
  uint64_t v27 = v25 + v20;
  if (v26)
  {
    __break(1u);
    goto LABEL_14;
  }

  v4[1] = v27;
  uint64_t v28 = v4[2];
  BOOL v26 = __OFADD__(v28, v21);
  uint64_t v29 = v28 + v21;
  if (v26)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  v4[2] = v29;
  uint64_t v30 = v4[3];
  BOOL v26 = __OFADD__(v30, v22);
  uint64_t v31 = v30 + v22;
  if (v26)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  v4[3] = v31;
  uint64_t v32 = v4[4];
  BOOL v26 = __OFADD__(v32, v23);
  uint64_t v33 = v32 + v23;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  v4[4] = v33;
  uint64_t v34 = a1[1];
  BOOL v26 = __OFSUB__(v34, v20);
  uint64_t v35 = v34 - v20;
  if (v26)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  a1[1] = v35;
  uint64_t v36 = a1[2];
  BOOL v26 = __OFSUB__(v36, v21);
  uint64_t v37 = v36 - v21;
  if (v26)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  a1[2] = v37;
  uint64_t v38 = a1[3];
  BOOL v26 = __OFSUB__(v38, v22);
  uint64_t v39 = v38 - v22;
  if (v26)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  a1[3] = v39;
  uint64_t v40 = a1[4];
  BOOL v26 = __OFSUB__(v40, v23);
  uint64_t v41 = v40 - v23;
  if (!v26)
  {
    a1[4] = v41;
    return result;
  }

void *sub_188DF0B8C(_WORD *a1, char *__dst, uint64_t a3, _WORD *a4, uint64_t a5)
{
  if (a3 < 1) {
    return 0LL;
  }
  int v10 = (char *)(a5 + 40LL * (unsigned __int16)*a4);
  uint64_t v11 = &__dst[40 * a3];
  if (v10 != __dst || v10 >= v11) {
    memmove(v10, __dst, 40 * a3);
  }
  uint64_t result = memmove(__dst, v11, 40 * ((unsigned __int16)*a1 - a3));
  uint64_t v14 = (unsigned __int16)*a4;
  BOOL v15 = __OFADD__(v14, a3);
  unint64_t v16 = v14 + a3;
  if (v15)
  {
    __break(1u);
    goto LABEL_18;
  }

  if ((v16 & 0x8000000000000000LL) != 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  if (v16 >> 16)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  *a4 = v16;
  uint64_t v17 = (unsigned __int16)*a1 - a3;
  if (v17 < 0)
  {
LABEL_20:
    __break(1u);
    return result;
  }

  *a1 = v17;
  unint64_t v18 = (unsigned __int16)*a4;
  if (v18 >= a3) {
    uint64_t v19 = v18 - a3;
  }
  else {
    uint64_t v19 = 0LL;
  }
  return (void *)sub_188DF1710(v19, v18, a5);
}

char *sub_188DF0C80(_WORD *a1, char *__dst, uint64_t a3, _WORD *a4, uint64_t a5)
{
  if (a3 < 1) {
    return 0LL;
  }
  uint64_t result = (char *)(a5 + 24LL * (unsigned __int16)*a4);
  uint64_t v11 = 24 * a3;
  uint64_t v12 = &__dst[24 * a3];
  if (result != __dst || result >= v12) {
    uint64_t result = (char *)memmove(result, __dst, 24 * a3);
  }
  size_t v14 = 24 * ((unsigned __int16)*a1 - a3);
  if (v11 > 0 || &v12[v14] <= __dst || v11) {
    uint64_t result = (char *)memmove(__dst, v12, v14);
  }
  uint64_t v15 = (unsigned __int16)*a4;
  BOOL v16 = __OFADD__(v15, a3);
  unint64_t v17 = v15 + a3;
  if (v16)
  {
    __break(1u);
    goto LABEL_22;
  }

  if ((v17 & 0x8000000000000000LL) != 0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  if (v17 >> 16)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  *a4 = v17;
  uint64_t v18 = (unsigned __int16)*a1 - a3;
  if (v18 < 0)
  {
LABEL_24:
    __break(1u);
    return result;
  }

  *a1 = v18;
  unint64_t v19 = (unsigned __int16)*a4;
  if (v19 >= a3) {
    uint64_t v20 = v19 - a3;
  }
  else {
    uint64_t v20 = 0LL;
  }
  return (char *)sub_188DF17A0(v20, v19, a5);
}

void *sub_188DF0D98(_WORD *a1, uint64_t a2, uint64_t a3, _WORD *a4, char *__src)
{
  if (a3 < 1) {
    return 0LL;
  }
  uint64_t result = memmove(&__src[40 * a3], __src, 40LL * (unsigned __int16)*a4);
  unint64_t v11 = a2 + 40LL * (unsigned __int16)*a1;
  uint64_t v12 = (char *)(v11 - 40 * a3);
  uint64_t v14 = (unsigned __int16)*a4;
  BOOL v15 = __OFADD__(v14, a3);
  unint64_t v16 = v14 + a3;
  if (v15)
  {
    __break(1u);
    goto LABEL_17;
  }

  if ((v16 & 0x8000000000000000LL) != 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  if (v16 >> 16)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  *a4 = v16;
  uint64_t v17 = (unsigned __int16)*a1 - a3;
  if (v17 < 0)
  {
LABEL_19:
    __break(1u);
    return result;
  }

  *a1 = v17;
  else {
    uint64_t v18 = (unsigned __int16)*a4;
  }
  return (void *)sub_188DF1710(0LL, v18, (uint64_t)__src);
}

void *sub_188DF0E8C(_WORD *a1, uint64_t a2, uint64_t a3, _WORD *a4, char *__src)
{
  if (a3 < 1) {
    return 0LL;
  }
  size_t v10 = 24 * a3;
  uint64_t result = memmove(&__src[24 * a3], __src, 24LL * (unsigned __int16)*a4);
  uint64_t v12 = (char *)(a2 + 24LL * (unsigned __int16)*a1 - 24 * a3);
  if (v12 != __src || &v12[v10] <= __src) {
    uint64_t result = memmove(__src, v12, v10);
  }
  uint64_t v14 = (unsigned __int16)*a4;
  BOOL v15 = __OFADD__(v14, a3);
  unint64_t v16 = v14 + a3;
  if (v15)
  {
    __break(1u);
    goto LABEL_17;
  }

  if ((v16 & 0x8000000000000000LL) != 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  if (v16 >> 16)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  *a4 = v16;
  uint64_t v17 = (unsigned __int16)*a1 - a3;
  if (v17 < 0)
  {
LABEL_19:
    __break(1u);
    return result;
  }

  *a1 = v17;
  else {
    uint64_t v18 = (unsigned __int16)*a4;
  }
  return (void *)sub_188DF17A0(0LL, v18, (uint64_t)__src);
}

uint64_t *sub_188DF0F88(uint64_t *result)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v3 = *v1;
  if (*(_WORD *)(v3 + 16))
  {
    int v4 = result;
    uint64_t v5 = *(unsigned __int16 *)(v3 + 16) - 1LL;
    int v6 = *(unsigned __int8 *)(v3 + 18);
    *uint64_t result = ((-15LL << ((4 * v6 + 8) & 0x3C)) - 1) & *result | (v5 << ((4 * v6 + 8) & 0x3C));
    if (v6)
    {
      uint64_t v7 = v3 + 40LL * (int)v5;
      __int128 v8 = *(_OWORD *)(v7 + 24);
      __int128 v9 = *(_OWORD *)(v7 + 40);
      uint64_t v11 = *(void *)(v7 + 56);
      v10[0] = v8;
      v10[1] = v9;
      sub_188D07F48(v2);
      sub_188D07F48((uint64_t)v10);
      uint64_t v3 = sub_188DF0F88(v4);
      sub_188D087F8((uint64_t)v10);
      sub_188D087F8(v2);
    }

    return (uint64_t *)v3;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_188DF1050(uint64_t a1)
{
  uint64_t v3 = *(void *)v1;
  int v4 = *(unsigned __int8 *)(*(void *)v1 + 18LL);
  unint64_t v5 = *(void *)(a1 + 8);
  char v6 = (4 * v4 + 8) & 0x3C;
  uint64_t v7 = (v5 >> v6) & 0xF;
  uint64_t v12 = v7;
  if (v4)
  {
    __int128 v8 = (unsigned __int16 *)(v3 + 16);
    uint64_t v9 = v3 + 24;
    swift_unknownObjectRetain();
    char v10 = sub_188DF1114(v8, v9, &v12, a1, v4);
    sub_188D087F8(v1);
  }

  else if (v7)
  {
    *(void *)(a1 + 8) = ((v7 - 1) << v6) | ((-15LL << v6) - 1) & v5;
    *(void *)(a1 + 16) = v3;
    char v10 = 1;
  }

  else
  {
    char v10 = 0;
  }

  return v10 & 1;
}

uint64_t sub_188DF1114(unsigned __int16 *a1, uint64_t a2, uint64_t *a3, uint64_t a4, char a5)
{
  uint64_t v9 = *a3;
  if (*a3 < *a1)
  {
    uint64_t v10 = a2 + 40 * v9;
    __int128 v11 = *(_OWORD *)(v10 + 16);
    v23[0] = *(_OWORD *)v10;
    v23[1] = v11;
    uint64_t v24 = *(void *)(v10 + 32);
    swift_unknownObjectRetain();
    char v12 = sub_188DF1050(a4);
    sub_188D087F8((uint64_t)v23);
    if ((v12 & 1) != 0) {
      return 1LL;
    }
    uint64_t v9 = *a3;
  }

  BOOL v13 = v9 < 1;
  uint64_t v14 = v9 - 1;
  if (!v13)
  {
    *a3 = v14;
    uint64_t v16 = *(void *)(a4 + 8);
    BOOL v15 = (uint64_t *)(a4 + 8);
    *BOOL v15 = v16 & ((-15LL << ((4 * a5 + 8) & 0x3C)) - 1) | (v14 << ((4 * a5 + 8) & 0x3C));
    uint64_t v17 = a2 + 40 * *a3;
    __int128 v18 = *(_OWORD *)(v17 + 16);
    v21[0] = *(_OWORD *)v17;
    v21[1] = v18;
    uint64_t v22 = *(void *)(v17 + 32);
    swift_unknownObjectRetain();
    unint64_t v19 = sub_188DF0F88(v15);
    sub_188D087F8((uint64_t)v21);
    v15[1] = (uint64_t)v19;
    return 1LL;
  }

  return 0LL;
}

uint64_t (*sub_188DF1228(void *a1, unint64_t a2))()
{
  unint64_t v5 = malloc(0x48uLL);
  *a1 = v5;
  v5[8] = v2;
  sub_188DF12BC(a2, (uint64_t)v5);
  return sub_188DEFBA4;
}

void sub_188DF127C(uint64_t *a1, uint8x8_t a2)
{
  uint64_t v2 = (void *)*a1;
  sub_188DF153C((uint64_t)&v3, *a1, a2);
  swift_bridgeObjectRelease();
  free(v2);
}

uint64_t sub_188DF12BC@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    __int128 v7 = v2[1];
    __int128 v19 = *v2;
    __int128 v20 = v7;
    uint64_t v21 = *((void *)v2 + 4);
    sub_188D26268((uint64_t)v17);
    uint64_t result = swift_unknownObjectRelease();
    v6.i32[1] = DWORD1(v17[0]);
    __int128 v8 = v17[1];
    *uint64_t v2 = v17[0];
    v2[1] = v8;
    *((void *)v2 + 4) = v18;
  }

  uint64_t v9 = *(void *)v2;
  if (((a1 >> ((4 * *(_BYTE *)(*(void *)v2 + 18LL) + 8) & 0x3C)) & 0xF) >= *(unsigned __int16 *)(*(void *)v2 + 16LL))
  {
    __break(1u);
  }

  else if (*(_BYTE *)(v9 + 18))
  {
    swift_unknownObjectRetain();
    sub_188DF12BC(a1);
    return swift_unknownObjectRelease();
  }

  else
  {
    uint64_t v10 = v9 + 24 + 24 * ((a1 >> ((4 * *(_BYTE *)(*(void *)v2 + 18LL) + 8) & 0x3C)) & 0xF);
    uint64_t v11 = *(void *)(v10 + 8);
    uint64_t v12 = *(unsigned __int8 *)(v10 + 16);
    uint64_t v13 = *(unsigned __int8 *)(v10 + 17);
    *(void *)(a2 + 8) = *(void *)v10;
    *(void *)(a2 + 16) = v11;
    *(_BYTE *)(a2 + 24) = v12;
    *(_BYTE *)(a2 + 25) = v13;
    v6.i32[0] = *(_DWORD *)(v10 + 18);
    unsigned __int32 v14 = vmovl_u8(v6).u32[0];
    *(_DWORD *)(a2 + 26) = v6.i32[0];
    v15.i64[0] = HIWORD(v14);
    v15.i64[1] = (unsigned __int16)v14;
    v16.i64[0] = 255LL;
    v16.i64[1] = 255LL;
    *(int8x16_t *)(a2 + 32) = vandq_s8(v15, v16);
    *(void *)(a2 + 48) = v13;
    *(void *)(a2 + 56) = v12;
    *(void *)a2 = a1;
  }

  return result;
}

uint64_t sub_188DF13F0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    __int128 v7 = v2[1];
    __int128 v23 = *v2;
    __int128 v24 = v7;
    uint64_t v25 = *((void *)v2 + 4);
    sub_188D26268((uint64_t)v21);
    uint64_t result = swift_unknownObjectRelease();
    v6.i32[1] = DWORD1(v21[0]);
    __int128 v8 = v21[1];
    *uint64_t v2 = v21[0];
    v2[1] = v8;
    *((void *)v2 + 4) = v22;
  }

  uint64_t v9 = *(void *)v2;
  uint64_t v10 = *(unsigned __int16 *)(*(void *)v2 + 16LL);
  if (*(_WORD *)(*(void *)v2 + 16LL))
  {
    int v11 = v10 - 1;
    int v12 = *(unsigned __int8 *)(v9 + 18);
    uint64_t v13 = ((-15LL << ((4 * v12 + 8) & 0x3C)) - 1) & *a1 | ((v10 - 1) << ((4 * v12 + 8) & 0x3C));
    *a1 = v13;
    if (v12)
    {
      swift_unknownObjectRetain();
      sub_188DF13F0(a1);
      return swift_unknownObjectRelease();
    }

    else
    {
      uint64_t v14 = v9 + 24 + 24LL * v11;
      uint64_t v15 = *(void *)(v14 + 8);
      uint64_t v16 = *(unsigned __int8 *)(v14 + 16);
      uint64_t v17 = *(unsigned __int8 *)(v14 + 17);
      *(void *)(a2 + 8) = *(void *)v14;
      *(void *)(a2 + 16) = v15;
      *(_BYTE *)(a2 + 24) = v16;
      *(_BYTE *)(a2 + 25) = v17;
      v6.i32[0] = *(_DWORD *)(v14 + 18);
      unsigned __int32 v18 = vmovl_u8(v6).u32[0];
      *(_DWORD *)(a2 + 26) = v6.i32[0];
      v19.i64[0] = HIWORD(v18);
      v19.i64[1] = (unsigned __int16)v18;
      v20.i64[0] = 255LL;
      v20.i64[1] = 255LL;
      *(int8x16_t *)(a2 + 32) = vandq_s8(v19, v20);
      *(void *)(a2 + 48) = v17;
      *(void *)(a2 + 56) = v16;
      *(void *)a2 = v13;
    }
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_188DF153C(uint64_t result, uint64_t a2, uint8x8_t a3)
{
  int v4 = v3;
  uint8x8_t v6 = (void *)result;
  uint64_t v7 = *v3;
  uint64_t v8 = (*(void *)a2 >> ((4 * *(_BYTE *)(*v3 + 18LL) + 8) & 0x3C)) & 0xFLL;
  if (*(_BYTE *)(*v3 + 18LL))
  {
    swift_unknownObjectRetain();
    uint64_t v9 = sub_188DF153C(v44, a2);
    uint64_t v10 = v44[0];
    uint64_t v11 = v44[1];
    uint64_t v12 = v44[2];
    uint64_t v13 = v44[3];
    uint64_t result = swift_unknownObjectRelease();
    uint64_t v14 = v4[1];
    BOOL v15 = __OFADD__(v14, v10);
    uint64_t v16 = v14 + v10;
    if (v15)
    {
      __break(1u);
    }

    else
    {
      v4[1] = v16;
      uint64_t v17 = v4[2];
      BOOL v15 = __OFADD__(v17, v11);
      uint64_t v18 = v17 + v11;
      if (!v15)
      {
        v4[2] = v18;
        uint64_t v19 = v4[3];
        BOOL v15 = __OFADD__(v19, v12);
        uint64_t v20 = v19 + v12;
        if (!v15)
        {
          v4[3] = v20;
          uint64_t v21 = v4[4];
          BOOL v15 = __OFADD__(v21, v13);
          uint64_t v22 = v21 + v13;
          if (!v15)
          {
            v4[4] = v22;
            *uint8x8_t v6 = v10;
            v6[1] = v11;
            uint64_t v7 = v9;
            void v6[2] = v12;
            v6[3] = v13;
            return v7;
          }

          goto LABEL_20;
        }

uint64_t sub_188DF1710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2 - a1;
  if (a2 == a1) {
    return 0LL;
  }
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t result = 0LL;
  for (uint64_t i = (void *)(a3 + 40 * a1 + 16); ; i += 5)
  {
    uint64_t v11 = *(i - 1);
    BOOL v12 = __OFADD__(result, v11);
    result += v11;
    if (v12) {
      break;
    }
    BOOL v12 = __OFADD__(v9, *i);
    v9 += *i;
    if (v12) {
      goto LABEL_11;
    }
    uint64_t v13 = i[1];
    BOOL v12 = __OFADD__(v8, v13);
    v8 += v13;
    if (v12) {
      goto LABEL_12;
    }
    uint64_t v14 = i[2];
    BOOL v12 = __OFADD__(v7, v14);
    v7 += v14;
    if (v12) {
      goto LABEL_13;
    }
    if (!--v3) {
      return result;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_188DF17A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2 - a1;
  if (a2 == a1) {
    return 0LL;
  }
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t result = 0LL;
  for (uint64_t i = (unsigned __int8 *)(a3 + 24 * a1 + 19); ; i += 24)
  {
    uint64_t v11 = *i;
    BOOL v12 = __OFADD__(result, v11);
    result += v11;
    if (v12) {
      break;
    }
    uint64_t v13 = *(i - 1);
    BOOL v12 = __OFADD__(v9, v13);
    v9 += v13;
    if (v12) {
      goto LABEL_11;
    }
    uint64_t v14 = *(i - 2);
    BOOL v12 = __OFADD__(v8, v14);
    v8 += v14;
    if (v12) {
      goto LABEL_12;
    }
    uint64_t v15 = *(i - 3);
    BOOL v12 = __OFADD__(v7, v15);
    v7 += v15;
    if (v12) {
      goto LABEL_13;
    }
    if (!--v3) {
      return result;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

unint64_t _s19CollectionsInternal9BigStringV6append10contentsOfySsn_tF_0( unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  *(void *)&__int128 v141 = a3;
  unint64_t v8 = sub_188DF8B4C();
  unint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](v8);
  BOOL v12 = (char *)&v120 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v10);
  unint64_t v14 = (unint64_t)&v120 - v13;
  unint64_t v15 = _s9_IngesterVMa();
  MEMORY[0x1895F8858](v15);
  uint64_t v136 = (unint64_t *)((char *)&v120 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  if (!((a2 ^ a1) >> 14)) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v18 = *(void *)v4;
  if (!*(void *)v4 || (uint64_t v19 = *(void *)(v4 + 32)) == 0)
  {
    sub_188D939DC(a1, a2, v141, a4, v142);
    unint64_t result = swift_unknownObjectRelease();
    __int128 v41 = *(_OWORD *)&v142[16];
    *(_OWORD *)uint64_t v4 = *(_OWORD *)v142;
    *(_OWORD *)(v4 + 16) = v41;
    *(_OWORD *)(v4 + 32) = *(_OWORD *)&v142[32];
    return result;
  }

  uint64_t v20 = *(void *)(v4 + 24);
  uint64_t v21 = *(void *)(v4 + 40);
  __int128 v153 = *(_OWORD *)(v4 + 8);
  uint64_t v152 = v18;
  uint64_t v154 = v20;
  uint64_t v155 = v19;
  uint64_t v156 = v21;
  uint64_t v139 = v18;
  *(void *)&__int128 v140 = (v19 << 11) | 0x300;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v22 = sub_188DC6C68(a1, a2, v141, a4);
  uint64_t v130 = (_OWORD *)v4;
  unint64_t v23 = v22;
  swift_bridgeObjectRelease();
  sub_188D20C84(v140, 0LL, 0LL, (uint64_t *)1, v23 | ((HIDWORD(v23) & 1) << 32), v14);
  (*(void (**)(char *, unint64_t, unint64_t))(v9 + 16))(v12, v14, v8);
  unint64_t v24 = (unint64_t)v136;
  *uint64_t v136 = a1;
  *(void *)(v24 + 8) = a2;
  *(void *)(v24 + 16) = v141;
  *(void *)(v24 + 24) = a4;
  if ((a4 & 0x1000000000000000LL) != 0) {
    goto LABEL_182;
  }
LABEL_6:
  *(void *)(v24 + 32) = a1;
  uint64_t v25 = *(void (**)(void))(v9 + 32);
  *(void *)&__int128 v140 = v24 + *(int *)(v15 + 24);
  v25();
  (*(void (**)(unint64_t, unint64_t))(v9 + 8))(v14, v8);
  swift_unknownObjectRelease();
  __int128 v26 = v130[1];
  v150[0] = *v130;
  v150[1] = v26;
  __int128 v151 = v130[2];
  __int128 v27 = v150[0];
  __int128 v28 = v26;
  uint64_t v29 = *((void *)&v151 + 1);
  uint64_t v30 = (unint64_t *)v151;
  swift_unknownObjectRetain();
  unint64_t v31 = sub_188D36DF0();
  *(void *)unint64_t v142 = v29;
  *(void *)&v142[8] = v31;
  *(void *)&v142[16] = 0LL;
  if (!(void)v27)
  {
    if (v31) {
      goto LABEL_8;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

LABEL_186:
    __break(1u);
LABEL_187:
    __break(1u);
    goto LABEL_188;
  }

LABEL_185:
      __break(1u);
      goto LABEL_186;
    }

    uint64_t v107 = 0LL;
    uint64_t v139 = v57;
    uint64_t v65 = v60;
LABEL_145:
    unint64_t v66 = v131;
LABEL_146:
    unint64_t v8 = MEMORY[0x1895D6684](v65, v66, v54, v56);
    unint64_t v109 = v108;
    uint64_t v135 = v57;
    if ((v108 & 0x1000000000000000LL) != 0)
    {
      unint64_t v8 = sub_188DDD440();
      unint64_t v114 = v113;
      swift_bridgeObjectRelease();
      unint64_t v109 = v114;
    }

    swift_bridgeObjectRetain();
    unint64_t v14 = sub_188DF7FD0();
    unint64_t v24 = v110;
    a1 = v111;
    unint64_t v9 = v112;
    swift_bridgeObjectRelease();
    unint64_t v138 = v8;
    unint64_t v8 = sub_188D82544(v14, v24, a1, v9);
    unint64_t v15 = sub_188DF7F7C();
    unint64_t v14 = sub_188D62BEC(v14, v24, a1, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((uint64_t)v8 > 255)
    {
LABEL_174:
      __break(1u);
LABEL_175:
      __break(1u);
LABEL_176:
      __break(1u);
LABEL_177:
      __break(1u);
LABEL_178:
      __break(1u);
LABEL_179:
      __break(1u);
LABEL_180:
      __break(1u);
LABEL_181:
      __break(1u);
LABEL_182:
      sub_188D8D12C();
      goto LABEL_6;
    }

    if (v107 > 255) {
      goto LABEL_177;
    }
    if (v135 > 255) {
      goto LABEL_178;
    }
    if (((v135 | v107 | v139 | v8 | v15 | v14) & 0x8000000000000000LL) != 0) {
      goto LABEL_179;
    }
    if (v139 > 255) {
      goto LABEL_180;
    }
    unint64_t v132 = ((_DWORD)v107 << 24) | v132 & 0xFFFF000000000000LL | ((unint64_t)v135 << 32) & 0xFFFF00FFFF0000FFLL | ((unint64_t)v139 << 40) | (unsigned __int16)(v15 << 8) | ((unint64_t)v14 << 16) | v8;
    sub_188DDC91C(v138, v109, v132);
    uint64_t v30 = v136;
    unint64_t v42 = v136[1];
    unint64_t v24 = v136[4];
  }

  unint64_t v122 = v42;
  unint64_t v9 = v52 >> 14;
  uint64_t v65 = v50;
  unint64_t v66 = v52;
  if (v50 >> 14 >= v52 >> 14)
  {
    uint64_t v107 = 0LL;
    uint64_t v139 = v57;
    goto LABEL_146;
  }

  unint64_t v131 = v52;
  uint64_t v67 = (v54 >> 59) & 1;
  if ((v56 & 0x1000000000000000LL) == 0) {
    LOBYTE(v67) = 1;
  }
  uint64_t v68 = 4LL << v67;
  uint64_t v69 = HIBYTE(v56) & 0xF;
  uint64_t v123 = v54 & 0xFFFFFFFFFFFFLL;
  uint64_t v124 = v69;
  if ((v56 & 0x2000000000000000LL) == 0) {
    uint64_t v69 = v54 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v137 = v50 >> 14;
  unint64_t v138 = v69;
  unint64_t v134 = v56 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v135 = v57;
  unint64_t v133 = (v56 & 0xFFFFFFFFFFFFFFFLL) + 32;
  unint64_t v121 = v50;
  unint64_t v15 = v50;
  a1 = v50 >> 14;
  uint64_t v139 = v68;
  while (1)
  {
    unint64_t v8 = v15 & 0xC;
    BOOL v70 = (v15 & 1) == 0 || v8 == v68;
    unint64_t v14 = v70;
    if (v70)
    {
      unint64_t v62 = v15;
      if (v8 == v68)
      {
        uint64_t v79 = sub_188D37044(v15, v54, v56);
        uint64_t v68 = v139;
        unint64_t v15 = v79;
      }

      if (v138 <= v15 >> 16) {
        goto LABEL_169;
      }
      if ((v15 & 1) == 0)
      {
        unint64_t v71 = sub_188D36F34(v15, v54, v56);
        uint64_t v68 = v139;
        unint64_t v15 = v15 & 0xC | v71 & 0xFFFFFFFFFFFFFFF3LL | 1;
      }
    }

    else
    {
      unint64_t v62 = v15;
      if (v138 <= v15 >> 16) {
        goto LABEL_170;
      }
    }

    if ((v56 & 0x1000000000000000LL) != 0)
    {
      uint64_t v75 = sub_188DF7E08();
      uint64_t v68 = v139;
      unint64_t v15 = v75;
      unint64_t v24 = v137;
      if (!(_DWORD)v14) {
        goto LABEL_58;
      }
    }

    else
    {
      unint64_t v72 = v15 >> 16;
      if ((v56 & 0x2000000000000000LL) != 0)
      {
        v149[0] = v54;
        v149[1] = v134;
        int v74 = *((unsigned __int8 *)v149 + v72);
      }

      else
      {
        uint64_t v73 = v133;
        if ((v54 & 0x1000000000000000LL) == 0)
        {
          uint64_t v73 = sub_188DF8684();
          uint64_t v68 = v139;
        }

        int v74 = *(unsigned __int8 *)(v73 + v72);
      }

      int v76 = (char)v74;
      unsigned int v77 = __clz(v74 ^ 0xFF) - 24;
      if (v76 >= 0) {
        LOBYTE(v77) = 1;
      }
      unint64_t v15 = ((v72 + v77) << 16) | 5;
      unint64_t v24 = v137;
      if (!(_DWORD)v14)
      {
LABEL_58:
        if (v62 >> 14 < v24 || v62 >> 14 >= v9) {
          goto LABEL_171;
        }
LABEL_70:
        if ((v56 & 0x1000000000000000LL) != 0) {
          goto LABEL_77;
        }
        goto LABEL_71;
      }
    }

    unint64_t v78 = v62;
    if (v8 == v68) {
      unint64_t v78 = sub_188D37044(v62, v54, v56);
    }
    if (v78 >> 14 < v24 || v78 >> 14 >= v9) {
      goto LABEL_172;
    }
    if ((v78 & 1) != 0) {
      goto LABEL_70;
    }
    sub_188D36F34(v78, v54, v56);
    if ((v56 & 0x1000000000000000LL) != 0)
    {
LABEL_77:
      sub_188DF85F4();
      goto LABEL_78;
    }

uint64_t _s19CollectionsInternal9BigStringV6append10contentsOfyACn_tF_0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_188DF8B4C();
  uint64_t v5 = MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = MEMORY[0x1895F8858](v5);
  uint64_t v11 = (char *)&v24 - v10;
  uint64_t v12 = *(void *)a1;
  if (*(void *)a1)
  {
    uint64_t v14 = *(void *)(a1 + 8);
    uint64_t v13 = *(void *)(a1 + 16);
    uint64_t v15 = *(void *)(a1 + 24);
    __int128 v16 = *(_OWORD *)(a1 + 32);
    uint64_t v43 = *(void *)a1;
    uint64_t v44 = v14;
    uint64_t v45 = v13;
    uint64_t v46 = v15;
    uint64_t v47 = v16;
    if (!(void)v16) {
      return sub_188D087F8(a1);
    }
    unint64_t v17 = *v1;
    if (*v1)
    {
      uint64_t v18 = v1[4];
      if (v18)
      {
        __int128 v28 = v16;
        unint64_t v29 = v17;
        uint64_t v30 = v18;
        uint64_t v31 = v9;
        uint64_t v32 = result;
        unint64_t v27 = v1[1];
        uint64_t v26 = v1[2];
        uint64_t v25 = v1[3];
        sub_188D36E50(*(unsigned __int8 *)(v12 + 18), (uint64_t)&v37);
        unint64_t v19 = sub_188DC6D38(v37, v38);
        uint64_t result = swift_bridgeObjectRelease();
        if ((v19 & 0x100000000LL) != 0)
        {
          __break(1u);
        }

        else
        {
          *(void *)&__int128 v33 = v12;
          *((void *)&v33 + 1) = v14;
          *(void *)&__int128 v34 = v13;
          *((void *)&v34 + 1) = v15;
          __int128 v35 = v28;
          swift_unknownObjectRetain();
          sub_188DF8B40();
          uint64_t v20 = v2[5];
          unint64_t v37 = v29;
          unint64_t v38 = v27;
          uint64_t v39 = v26;
          uint64_t v40 = v25;
          uint64_t v41 = v30;
          uint64_t v42 = v20;
          LOBYTE(v36[0]) = 0;
          sub_188D20C84((v30 << 11) | 0x300, 0LL, 0LL, (uint64_t *)1, v19, (unint64_t)v7);
          sub_188D22708((uint64_t)v11);
          v36[0] = v33;
          v36[1] = v34;
          _OWORD v36[2] = v35;
          sub_188D011B8((uint64_t)v36, (uint64_t)v48);
          sub_188D07F48((uint64_t)v48);
          sub_188DF32E8((uint64_t *)v36);
          sub_188D087F8(a1);
          uint64_t v21 = *(void (**)(char *, uint64_t))(v31 + 8);
          uint64_t v22 = v32;
          v21(v7, v32);
          v21(v11, v22);
          return swift_unknownObjectRelease();
        }

        return result;
      }

      uint64_t result = swift_unknownObjectRelease();
    }

    __int128 v23 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)uint64_t v1 = *(_OWORD *)a1;
    *((_OWORD *)v1 + 1) = v23;
    *((_OWORD *)v1 + 2) = *(_OWORD *)(a1 + 32);
  }

  return result;
}

_WORD *sub_188DF2A24(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  __int128 v10 = *((_OWORD *)v4 + 1);
  v32[0] = *(_OWORD *)v4;
  v32[1] = v10;
  __int128 v33 = *((_OWORD *)v4 + 2);
  sub_188D011B8((uint64_t)v32, (uint64_t)v34);
  sub_188D07F48((uint64_t)v34);
  unint64_t v11 = sub_188D36DF0();
  sub_188D087F8((uint64_t)v32);
  if (v11 == a4) {
    return sub_188DEF688((uint64_t)a1, a2, a3 & 0xFFFFFFFFFFFFLL);
  }
  uint64_t result = (_WORD *)sub_188D011B8((uint64_t)v34, (uint64_t)v35);
  if (!v35[0]) {
    goto LABEL_18;
  }
  sub_188DF2BF8(a1, a2, a3 & 0xFFFFFFFFFFFFLL, a4, v28);
  uint64_t v13 = v28[0];
  uint64_t v14 = v28[1];
  uint64_t v16 = v28[2];
  uint64_t v15 = v28[3];
  uint64_t v17 = v28[4];
  uint64_t result = (_WORD *)sub_188D011B8((uint64_t)v28, (uint64_t)v29);
  if (v29[0])
  {
    v31[0] = v13;
    v31[1] = v14;
    v31[2] = v16;
    v31[3] = v15;
    uint64_t v27 = v15;
    v31[4] = v17;
    uint64_t v18 = v5[1];
    uint64_t v20 = v5[2];
    uint64_t v19 = v5[3];
    uint64_t v21 = v5[4];
    v30[0] = *v5;
    v30[1] = v18;
    v30[2] = v20;
    v30[3] = v19;
    v30[4] = v21;
    unsigned int v22 = *(unsigned __int8 *)(v30[0] + 18LL) + 1;
    if (((v22 >> 8) & 1) != 0)
    {
      __break(1u);
    }

    else
    {
      uint64_t v26 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C74A228);
      uint64_t v23 = swift_allocObject();
      *(_WORD *)(v23 + 16) = 0;
      uint64_t result = (_WORD *)(v23 + 16);
      *(_BYTE *)(v23 + 18) = v22;
      BOOL v24 = __OFADD__(v18, v14);
      uint64_t v25 = v18 + v14;
      if (!v24)
      {
        if (!__OFADD__(v20, v16))
        {
          if (!__OFADD__(v19, v27))
          {
            if (!__OFADD__(v21, v26))
            {
              sub_188DF08F4(result, v23 + 24, (uint64_t)v30, (uint64_t)v31);
              sub_188D087F8((uint64_t)v28);
              uint64_t result = (_WORD *)swift_unknownObjectRelease();
              *uint64_t v5 = v23;
              v5[1] = v25;
              v5[2] = v20 + v16;
              v5[3] = v19 + v27;
              v5[4] = v21 + v26;
              goto LABEL_11;
            }

            goto LABEL_17;
          }

uint64_t sub_188DF2BF8@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v6 = v5;
  unint64_t v29 = a1;
  uint64_t v30 = a2;
  LOWORD(v31) = a3;
  BYTE2(v31) = BYTE2(a3);
  HIBYTE(v31) = BYTE3(a3);
  char v32 = BYTE4(a3);
  char v33 = BYTE5(a3);
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    __int128 v13 = v5[1];
    __int128 v44 = *v5;
    __int128 v45 = v13;
    uint64_t v46 = *((void *)v5 + 4);
    sub_188D26268((uint64_t)v34);
    uint64_t result = swift_unknownObjectRelease();
    __int128 v14 = v34[1];
    *uint64_t v5 = v34[0];
    v5[1] = v14;
    *((void *)v5 + 4) = v35;
  }

  unint64_t v15 = a4 >> ((4 * *(_BYTE *)(*(void *)v5 + 18LL) + 8) & 0x3C);
  uint64_t v16 = v15 & 0xF;
  unint64_t v17 = *(unsigned __int16 *)(*(void *)v6 + 16LL);
  if (*(_BYTE *)(*(void *)v6 + 18LL))
  {
    if ((v15 & 0xF) < v17)
    {
      v26[1] = v26;
      MEMORY[0x1895F8858](result);
      __int128 v18 = *(__int128 *)((char *)v6 + 24);
      __int128 v27 = *(__int128 *)((char *)v6 + 8);
      __int128 v28 = v18;
      uint64_t v19 = *(void *)v6 + 24LL;
      swift_unknownObjectRetain();
      sub_188DF3A80(v19, v16, &v27, (void *(*)(_OWORD *__return_ptr))sub_188DF3A78, (uint64_t)v36);
      uint64_t v20 = v36[0];
      uint64_t v21 = v36[1];
      uint64_t v22 = v36[2];
      uint64_t v23 = v36[3];
      uint64_t v24 = v36[4];
      swift_unknownObjectRelease();
      __int128 v25 = v28;
      *(__int128 *)((char *)v6 + 8) = v27;
      *(__int128 *)((char *)v6 + 24) = v25;
      sub_188D011B8((uint64_t)v36, (uint64_t)v38);
      if (v38[0])
      {
        uint64_t v39 = v20;
        uint64_t v40 = v21;
        uint64_t v41 = v22;
        uint64_t v42 = v23;
        uint64_t v43 = v24;
        sub_188DF2FC0((uint64_t)&v39, v16, v37);
        uint64_t v20 = v37[0];
        uint64_t v21 = v37[1];
        uint64_t v22 = v37[2];
        uint64_t v23 = v37[3];
        uint64_t v24 = v37[4];
      }

      uint64_t result = swift_bridgeObjectRelease();
      goto LABEL_10;
    }

    __break(1u);
  }

  else if ((v15 & 0xF) <= v17)
  {
    uint64_t result = sub_188DF2E18(a1, a2, a3 & 0xFFFF00000000LL | v31, v15 & 0xF, &v39);
    uint64_t v20 = v39;
    uint64_t v21 = v40;
    uint64_t v22 = v41;
    uint64_t v23 = v42;
    uint64_t v24 = v43;
LABEL_10:
    *a5 = v20;
    a5[1] = v21;
    a5[2] = v22;
    a5[3] = v23;
    a5[4] = v24;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t sub_188DF2E18@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  unint64_t v15 = a1;
  uint64_t v16 = a2;
  LOWORD(v17) = a3;
  BYTE2(v17) = BYTE2(a3);
  HIBYTE(v17) = BYTE3(a3);
  unsigned __int8 v18 = BYTE4(a3);
  unsigned __int8 v19 = BYTE5(a3);
  uint64_t v8 = *v5;
  if ((a3 & 0xFCu) <= 0x7BuLL && *(_WORD *)(v8 + 16))
  {
    if ((sub_188DF321C((uint64_t)&v15, a4) & 1) != 0)
    {
LABEL_9:
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
      uint64_t v11 = 0LL;
      uint64_t v12 = 0LL;
      uint64_t v13 = 0LL;
      goto LABEL_11;
    }

    uint64_t v8 = *v5;
  }

  if (*(_WORD *)(v8 + 16) != 15)
  {
    sub_188DF3DE0(v15, v16, v17 | ((unint64_t)v18 << 32) | ((unint64_t)v19 << 40), a4);
    goto LABEL_9;
  }

  if (a4 >= 8)
  {
    sub_188DEE920(8LL, (uint64_t)&v20);
    sub_188DF3DE0( v15,  v16,  ((unint64_t)v19 << 40) | ((unint64_t)v18 << 32) | v17,  a4 - *(unsigned __int16 *)(*v5 + 16));
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v9 = v20;
    uint64_t v10 = v21;
    uint64_t v11 = v22;
    uint64_t v12 = v23;
    uint64_t v13 = v24;
  }

  else
  {
    sub_188DEE920(7LL, (uint64_t)&v20);
    uint64_t v9 = v20;
    uint64_t v10 = v21;
    uint64_t v11 = v22;
    uint64_t v12 = v23;
    uint64_t v13 = v24;
    sub_188DF3DE0(v15, v16, v17 | ((unint64_t)v18 << 32) | ((unint64_t)v19 << 40), a4);
    uint64_t result = swift_bridgeObjectRelease();
  }

uint64_t sub_188DF2FC0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  __int128 v5 = *(_OWORD *)(result + 16);
  v37[0] = *(_OWORD *)result;
  v37[1] = v5;
  uint64_t v38 = *(void *)(result + 32);
  uint64_t v6 = a2 + 1;
  if (__OFADD__(a2, 1LL))
  {
    __break(1u);
    goto LABEL_22;
  }

  uint64_t v8 = (void *)result;
  if (a2 >= 1)
  {
    uint64_t v9 = *v3;
    uint64_t v10 = *v3 + 24LL;
    uint64_t v11 = v10 + 40 * a2;
    uint64_t v13 = *(void *)(v11 - 40);
    uint64_t v12 = (uint64_t *)(v11 - 40);
    unint64_t v14 = *(unsigned __int16 *)(*(void *)(v10 + 40 * a2) + 16LL) + (unint64_t)*(unsigned __int16 *)(v13 + 16);
    if (v14 >= 0x10)
    {
      swift_unknownObjectRetain();
LABEL_6:
      swift_unknownObjectRelease();
      goto LABEL_7;
    }

    swift_unknownObjectRetain();
    sub_188DEFD8C(v12, (uint64_t *)(v10 + 40 * a2), v14);
    sub_188DEFEBC((void *)a2, (_WORD *)(v9 + 16), v10, (uint64_t)v39);
    uint64_t result = sub_188D087F8((uint64_t)v39);
    BOOL v15 = __OFSUB__(v6--, 1LL);
    if (!v15) {
      goto LABEL_6;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

uint64_t sub_188DF321C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2 + 24LL;
  swift_unknownObjectRetain();
  sub_188DF3D08(v5, a2, a1, (uint64_t)v21);
  uint64_t v6 = v21[0];
  uint64_t v8 = v22;
  uint64_t v7 = v23;
  uint64_t v10 = v24;
  uint64_t v9 = v25;
  uint64_t result = swift_unknownObjectRelease();
  uint64_t v12 = v2[1];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (v13)
  {
    __break(1u);
    goto LABEL_7;
  }

  v2[1] = v14;
  uint64_t v15 = v2[2];
  BOOL v13 = __OFADD__(v15, v7);
  uint64_t v16 = v15 + v7;
  if (v13)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  v2[2] = v16;
  uint64_t v17 = v2[3];
  BOOL v13 = __OFADD__(v17, v10);
  uint64_t v18 = v17 + v10;
  if (v13)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  v2[3] = v18;
  uint64_t v19 = v2[4];
  BOOL v13 = __OFADD__(v19, v9);
  uint64_t v20 = v19 + v9;
  if (!v13)
  {
    v2[4] = v20;
    return v6;
  }

uint64_t *sub_188DF32E8(uint64_t *result)
{
  uint64_t v2 = *result;
  if (!*result) {
    return result;
  }
  uint64_t v3 = (uint64_t)result;
  uint64_t v4 = result[1];
  uint64_t v5 = result[2];
  uint64_t v7 = result[3];
  uint64_t v6 = result[4];
  uint64_t v8 = result[5];
  uint64_t v27 = *result;
  uint64_t v28 = v4;
  uint64_t v29 = v5;
  uint64_t v30 = v7;
  uint64_t v31 = v6;
  int v9 = *(unsigned __int16 *)(v2 + 16);
  if (!*(_WORD *)(v2 + 16)) {
    return (uint64_t *)sub_188D087F8(v3);
  }
  uint64_t v10 = v1;
  uint64_t v11 = *v1;
  if (!*v1)
  {
LABEL_10:
    *uint64_t v1 = v2;
    v1[1] = v4;
    v1[2] = v5;
    v1[3] = v7;
    v1[4] = v6;
    v1[5] = v8;
    return result;
  }

  uint64_t v13 = v1[1];
  uint64_t v12 = v1[2];
  uint64_t v15 = v1[3];
  uint64_t v14 = v1[4];
  uint64_t v32 = *v1;
  uint64_t v33 = v13;
  uint64_t v34 = v12;
  uint64_t v35 = v15;
  uint64_t v36 = v14;
  if (!*(_WORD *)(v11 + 16))
  {
    uint64_t result = (uint64_t *)swift_unknownObjectRelease();
    goto LABEL_10;
  }

  if (v9 != 1 || *(_BYTE *)(v2 + 18))
  {
    uint64_t v16 = v1[5];
    if (v14 > 123)
    {
      uint64_t v37 = v11;
      uint64_t v38 = v13;
      uint64_t v39 = v12;
      uint64_t v40 = v15;
      uint64_t v41 = v14;
      uint64_t v42 = v16;
      uint64_t result = (uint64_t *)sub_188DEEA7C((uint64_t)&v37, result, (uint64_t *)&v24);
      __int128 v18 = v25;
      *(_OWORD *)uint64_t v1 = v24;
      *((_OWORD *)v1 + 1) = v18;
      *((_OWORD *)v1 + 2) = v26;
      return result;
    }

    uint64_t v37 = v11;
    uint64_t v38 = v13;
    uint64_t v39 = v12;
    uint64_t v40 = v15;
    uint64_t v41 = v14;
    uint64_t v42 = v16;
    unint64_t v22 = *(unsigned __int8 *)(v11 + 18);
    swift_unknownObjectRetain();
    if (sub_188D36DF0() != v22)
    {
      swift_unknownObjectRetain();
      sub_188D36E50(v22, (uint64_t)&v24);
      swift_unknownObjectRelease_n();
      uint64_t v21 = *((void *)&v24 + 1);
      uint64_t v23 = (void *)v24;
      uint64_t v20 = v25;
      uint64_t v19 = BYTE4(v25);
      uint64_t v17 = BYTE5(v25);
      sub_188D07F48(v3);
      swift_unknownObjectRelease();
      uint64_t *v10 = v2;
      v10[1] = v4;
      _OWORD v10[2] = v5;
      uint64_t v10[3] = v7;
      void v10[4] = v6;
      v10[5] = v8;
      sub_188DF38B4(v23, v21, v20 | (v19 << 32) | (v17 << 40));
      return (uint64_t *)sub_188D087F8(v3);
    }
  }

  else
  {
    if (sub_188D36DF0())
    {
      swift_unknownObjectRetain();
      sub_188D36E50(0LL, (uint64_t)&v37);
      sub_188D087F8(v3);
      sub_188DF3724( v37,  v38,  v39 | ((unint64_t)BYTE4(v39) << 32) | ((unint64_t)BYTE5(v39) << 40));
      return (uint64_t *)sub_188D087F8(v3);
    }

    __break(1u);
  }

  uint64_t result = (uint64_t *)swift_unknownObjectRelease();
  __break(1u);
  return result;
}

uint64_t *sub_188DF3508(uint64_t *result)
{
  uint64_t v2 = *result;
  if (!*result) {
    return result;
  }
  uint64_t v3 = (uint64_t)result;
  uint64_t v4 = result[1];
  uint64_t v5 = result[2];
  uint64_t v7 = result[3];
  uint64_t v6 = result[4];
  uint64_t v8 = result[5];
  uint64_t v27 = *result;
  uint64_t v28 = v4;
  uint64_t v29 = v5;
  uint64_t v30 = v7;
  uint64_t v31 = v6;
  int v9 = *(unsigned __int16 *)(v2 + 16);
  if (!*(_WORD *)(v2 + 16)) {
    return (uint64_t *)sub_188D087F8(v3);
  }
  uint64_t v10 = v1;
  uint64_t v11 = (unsigned __int8 *)*v1;
  if (!*v1)
  {
LABEL_10:
    *uint64_t v1 = v2;
    v1[1] = v4;
    v1[2] = v5;
    v1[3] = v7;
    v1[4] = v6;
    v1[5] = v8;
    return result;
  }

  uint64_t v13 = v1[1];
  uint64_t v12 = v1[2];
  uint64_t v15 = v1[3];
  uint64_t v14 = v1[4];
  uint64_t v32 = *v1;
  uint64_t v33 = v13;
  uint64_t v34 = v12;
  uint64_t v35 = v15;
  uint64_t v36 = v14;
  if (!v14)
  {
    uint64_t result = (uint64_t *)swift_unknownObjectRelease();
    goto LABEL_10;
  }

  if (v9 != 1 || *(_BYTE *)(v2 + 18))
  {
    uint64_t v16 = v1[5];
    if (v14 > 123)
    {
      uint64_t v37 = v11;
      uint64_t v38 = v13;
      uint64_t v39 = v12;
      uint64_t v40 = v15;
      uint64_t v41 = v14;
      uint64_t v42 = v16;
      uint64_t result = (uint64_t *)sub_188DEEA7C((uint64_t)result, (uint64_t *)&v37, (uint64_t *)&v24);
      __int128 v18 = v25;
      *(_OWORD *)uint64_t v1 = v24;
      *((_OWORD *)v1 + 1) = v18;
      *((_OWORD *)v1 + 2) = v26;
      return result;
    }

    uint64_t v37 = v11;
    uint64_t v38 = v13;
    uint64_t v39 = v12;
    uint64_t v40 = v15;
    uint64_t v41 = v14;
    uint64_t v42 = v16;
    unint64_t v22 = v11[18];
    swift_unknownObjectRetain();
    if (sub_188D36DF0() != v22)
    {
      swift_unknownObjectRetain();
      sub_188D36E50(v22, (uint64_t)&v24);
      swift_unknownObjectRelease_n();
      uint64_t v21 = *((void *)&v24 + 1);
      uint64_t v23 = v24;
      uint64_t v20 = v25;
      uint64_t v19 = BYTE4(v25);
      uint64_t v17 = BYTE5(v25);
      sub_188D07F48(v3);
      swift_unknownObjectRelease();
      void *v10 = v2;
      v10[1] = v4;
      _OWORD v10[2] = v5;
      uint64_t v10[3] = v7;
      void v10[4] = v6;
      v10[5] = v8;
      sub_188DF3724(v23, v21, v20 | (v19 << 32) | (v17 << 40));
      return (uint64_t *)sub_188D087F8(v3);
    }
  }

  else
  {
    if (sub_188D36DF0())
    {
      swift_unknownObjectRetain();
      sub_188D36E50(0LL, (uint64_t)&v37);
      sub_188D087F8(v3);
      sub_188DF38B4( v37,  v38,  v39 | ((unint64_t)BYTE4(v39) << 32) | ((unint64_t)BYTE5(v39) << 40));
      return (uint64_t *)sub_188D087F8(v3);
    }

    __break(1u);
  }

  uint64_t result = (uint64_t *)swift_unknownObjectRelease();
  __break(1u);
  return result;
}

_WORD *sub_188DF3724(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = *v3;
  if (!*v3) {
    return sub_188DEF688(a1, a2, a3 & 0xFFFFFFFFFFFFLL);
  }
  uint64_t v6 = v3[1];
  uint64_t v7 = v3[2];
  uint64_t v9 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v24 = *v3;
  uint64_t v25 = v6;
  uint64_t v26 = v7;
  uint64_t v27 = v9;
  uint64_t v28 = v8;
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  LOWORD(v21) = a3;
  BYTE2(v21) = BYTE2(a3);
  HIBYTE(v21) = BYTE3(a3);
  unsigned __int8 v22 = BYTE4(a3);
  unsigned __int8 v23 = BYTE5(a3);
  uint64_t v11 = v3[5];
  uint64_t v29 = v5;
  uint64_t v30 = v6;
  uint64_t v31 = v7;
  uint64_t v32 = v9;
  uint64_t v33 = v8;
  uint64_t v34 = v11;
  swift_unknownObjectRetain();
  uint64_t result = (_WORD *)sub_188D36DF0();
  uint64_t v16 = v11;
  uint64_t v17 = result;
  uint64_t v18 = 0LL;
  if ((unint64_t)result <= *(unsigned __int8 *)(v5 + 18))
  {
    __break(1u);
    goto LABEL_14;
  }

  swift_unknownObjectRetain();
  char v12 = sub_188DF1050((uint64_t)&v16);
  uint64_t result = (_WORD *)swift_unknownObjectRelease_n();
  if ((v12 & 1) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  if (v16 != v11)
  {
LABEL_15:
    __break(1u);
    return result;
  }

  sub_188DF12BC((unint64_t)v17, (uint64_t)&v16);
  char v13 = sub_188D32D64((uint64_t)&v19);
  sub_188DF153C((uint64_t)&v15, (uint64_t)&v16, v14);
  swift_bridgeObjectRelease();
  v4[5] = v11 + 1;
  if ((v13 & 1) != 0) {
    return (_WORD *)swift_bridgeObjectRelease();
  }
  else {
    return sub_188DEF688(v19, v20, v21 | ((unint64_t)v22 << 32) | ((unint64_t)v23 << 40));
  }
}

_WORD *sub_188DF38B4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *v3;
  if (!*v3)
  {
    unint64_t v6 = 0LL;
    ++v3[5];
    goto LABEL_7;
  }

  uint64_t v5 = v3[4];
  if (!v5 || v5 >= 124 && (a3 & 0xFCu) > 0x7BuLL)
  {
    ++v3[5];
    unint64_t v6 = *(unsigned __int8 *)(v4 + 18);
LABEL_7:
    uint64_t v7 = a3 & 0xFFFFFFFFFFFFLL;
    return sub_188DF2A24(a1, a2, v7, v6);
  }

  uint64_t v17 = a1;
  uint64_t v18 = a2;
  LOWORD(v19) = a3;
  BYTE2(v19) = BYTE2(a3);
  HIBYTE(v19) = BYTE3(a3);
  unsigned __int8 v20 = BYTE4(a3);
  unsigned __int8 v21 = BYTE5(a3);
  uint64_t v9 = v3[5];
  sub_188DF12BC(*(unsigned __int8 *)(v4 + 18), (uint64_t)v16);
  BOOL v10 = sub_188D32F0C((uint64_t)&v17);
  sub_188DF153C((uint64_t)v15, (uint64_t)v16, v11);
  swift_bridgeObjectRelease();
  v3[5] = v9 + 1;
  if (!v10)
  {
    a1 = v17;
    a2 = v18;
    uint64_t v12 = v19;
    uint64_t v13 = v20;
    uint64_t v14 = v21;
    v3[5] = v9 + 2;
    if (*v3) {
      unint64_t v6 = *(unsigned __int8 *)(*v3 + 18LL);
    }
    else {
      unint64_t v6 = 0LL;
    }
    uint64_t v7 = v12 | (v13 << 32) | (v14 << 40);
    return sub_188DF2A24(a1, a2, v7, v6);
  }

  return (_WORD *)swift_bridgeObjectRelease();
}

uint64_t sub_188DF39F8@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  unint64_t v7 = *((unsigned int *)a1 + 4) | ((unint64_t)*((unsigned __int8 *)a1 + 20) << 32) | ((unint64_t)*((unsigned __int8 *)a1 + 21) << 40);
  swift_bridgeObjectRetain();
  sub_188DF2BF8(v9, v5, v6, v7, a2);
  return sub_188D011B8((uint64_t)v9, a3);
}

uint64_t sub_188DF3A78@<X0>(uint64_t a1@<X8>)
{
  return sub_188DF39F8(*(uint64_t **)(v1 + 16), *(void *)(v1 + 24), a1);
}

void *sub_188DF3A80@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *(*a4)(_OWORD *__return_ptr)@<X3>, uint64_t a5@<X8>)
{
  uint64_t result = (void *)(a1 + 40 * a2);
  uint64_t v8 = result + 1;
  uint64_t v7 = result[1];
  uint64_t v9 = *a3 - v7;
  if (__OFSUB__(*a3, v7))
  {
    __break(1u);
    goto LABEL_11;
  }

  uint8x8_t v11 = result + 2;
  uint64_t v13 = result + 3;
  uint64_t v12 = result[3];
  uint64_t v15 = result + 4;
  uint64_t v14 = result[4];
  uint64_t v16 = result[2];
  *a3 = v9;
  uint64_t v17 = a3[1];
  BOOL v18 = __OFSUB__(v17, v16);
  uint64_t v19 = v17 - v16;
  if (v18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  a3[1] = v19;
  uint64_t v20 = a3[2];
  BOOL v18 = __OFSUB__(v20, v12);
  uint64_t v21 = v20 - v12;
  if (v18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  a3[2] = v21;
  uint64_t v22 = a3[3];
  BOOL v18 = __OFSUB__(v22, v14);
  uint64_t v23 = v22 - v14;
  if (v18)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  a3[3] = v23;
  uint64_t result = a4(v35);
  if (__OFADD__(*a3, *v8))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v24 = *v13;
  uint64_t v25 = *v15;
  uint64_t v26 = *v11;
  *a3 += *v8;
  uint64_t v27 = a3[1];
  BOOL v18 = __OFADD__(v27, v26);
  uint64_t v28 = v27 + v26;
  if (v18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  a3[1] = v28;
  uint64_t v29 = a3[2];
  BOOL v18 = __OFADD__(v29, v24);
  uint64_t v30 = v29 + v24;
  if (v18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  a3[2] = v30;
  uint64_t v31 = a3[3];
  BOOL v18 = __OFADD__(v31, v25);
  uint64_t v32 = v31 + v25;
  if (!v18)
  {
    a3[3] = v32;
    uint64_t v33 = v36;
    __int128 v34 = v35[1];
    *(_OWORD *)a5 = v35[0];
    *(_OWORD *)(a5 + 16) = v34;
    *(void *)(a5 + 32) = v33;
    return result;
  }

uint64_t sub_188DF3BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    __int128 v10 = v2[1];
    __int128 v30 = *v2;
    __int128 v31 = v10;
    uint64_t v32 = *((void *)v2 + 4);
    sub_188D26268((uint64_t)v28);
    uint64_t result = swift_unknownObjectRelease();
    __int128 v11 = v28[1];
    *uint64_t v2 = v28[0];
    v2[1] = v11;
    *((void *)v2 + 4) = v29;
  }

  uint64_t v12 = *((void *)v2 + 1);
  BOOL v13 = __OFADD__(v12, v6);
  uint64_t v14 = v12 + v6;
  if (v13)
  {
    __break(1u);
    goto LABEL_11;
  }

  *((void *)v2 + 1) = v14;
  uint64_t v15 = *((void *)v2 + 2);
  BOOL v13 = __OFADD__(v15, v5);
  uint64_t v16 = v15 + v5;
  if (v13)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  *((void *)v2 + 2) = v16;
  uint64_t v17 = *((void *)v2 + 3);
  BOOL v13 = __OFADD__(v17, v8);
  uint64_t v18 = v17 + v8;
  if (v13)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  *((void *)v2 + 3) = v18;
  uint64_t v19 = *((void *)v2 + 4);
  BOOL v13 = __OFADD__(v19, v7);
  uint64_t v20 = v19 + v7;
  if (v13)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  *((void *)v2 + 4) = v20;
  uint64_t v21 = *(void *)v2;
  swift_unknownObjectRetain();
  uint64_t result = sub_188D07F48(a1);
  uint64_t v22 = *(unsigned __int16 *)(v21 + 16);
  BOOL v13 = __OFSUB__(v22, a2);
  uint64_t v23 = v22 - a2;
  if (v13)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v24 = v21 + 40 * a2;
  uint64_t result = (uint64_t)memmove((void *)(v24 + 64), (const void *)(v24 + 24), 40 * v23);
  __int128 v26 = *(_OWORD *)a1;
  __int128 v25 = *(_OWORD *)(a1 + 16);
  *(void *)(v24 + 56) = *(void *)(a1 + 32);
  *(_OWORD *)(v24 + 24) = v26;
  *(_OWORD *)(v24 + 40) = v25;
  int v27 = *(unsigned __int16 *)(v21 + 16);
  if (v27 != 0xFFFF)
  {
    *(_WORD *)(v21 + 16) = v27 + 1;
    return swift_unknownObjectRelease();
  }

uint64_t sub_188DF3D08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = 24 * a2;
  if (a2 < 1)
  {
    uint64_t v9 = (unsigned __int8 *)(a1 + v5 + 16);
    unsigned int v8 = *v9;
    uint64_t v7 = (unsigned __int8 *)(a1 + v5 + 17);
    unsigned int v6 = *v7;
    __int128 v10 = (unsigned __int8 *)(a1 + v5 + 18);
    unsigned int v11 = *v10;
    uint64_t v12 = (unsigned __int8 *)(a1 + v5 + 19);
    unsigned int v13 = *v12;
    uint64_t result = sub_188D32F0C(a3);
  }

  else
  {
    uint64_t v7 = (unsigned __int8 *)(v5 + a1 - 7);
    unsigned int v6 = *v7;
    uint64_t v9 = (unsigned __int8 *)(v5 + a1 - 8);
    unsigned int v8 = *v9;
    __int128 v10 = (unsigned __int8 *)(v5 + a1 - 6);
    unsigned int v11 = *v10;
    uint64_t v12 = (unsigned __int8 *)(v5 + a1 - 5);
    unsigned int v13 = *v12;
    uint64_t result = sub_188D32D64(a3);
  }

  uint64_t v15 = *v9;
  unint64_t v16 = *v12 - (unint64_t)v13;
  unint64_t v17 = *v10 - (unint64_t)v11;
  unint64_t v18 = *v7 - (unint64_t)v6;
  *(_BYTE *)a4 = result & 1;
  *(void *)(a4 + 8) = v16;
  *(void *)(a4 + 16) = v17;
  *(void *)(a4 + 24) = v18;
  *(void *)(a4 + 32) = v15 - v8;
  return result;
}

uint64_t sub_188DF3DE0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    __int128 v11 = v4[1];
    __int128 v23 = *v4;
    __int128 v24 = v11;
    uint64_t v25 = *((void *)v4 + 4);
    sub_188D26268((uint64_t)v21);
    uint64_t result = swift_unknownObjectRelease();
    __int128 v12 = v21[1];
    *uint64_t v4 = v21[0];
    v4[1] = v12;
    *((void *)v4 + 4) = v22;
  }

  uint64_t v13 = *((void *)v4 + 1);
  if (__OFADD__(v13, BYTE3(a3)))
  {
    __break(1u);
    goto LABEL_9;
  }

  *((void *)v4 + 1) = v13 + BYTE3(a3);
  uint64_t v14 = *((void *)v4 + 2);
  if (__OFADD__(v14, BYTE2(a3)))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  *((void *)v4 + 2) = v14 + BYTE2(a3);
  uint64_t v15 = *((void *)v4 + 3);
  if (__OFADD__(v15, BYTE1(a3)))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  *((void *)v4 + 3) = v15 + BYTE1(a3);
  uint64_t v16 = *((void *)v4 + 4);
  BOOL v17 = __OFADD__(v16, a3);
  uint64_t v18 = v16 + a3;
  if (!v17)
  {
    *((void *)v4 + 4) = v18;
    uint64_t v19 = *(void *)v4;
    uint64_t v20 = (_WORD *)(*v5 + 16LL);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    sub_188DF097C( a1,  a2,  ((unint64_t)BYTE2(a3) << 16) | ((unint64_t)BYTE1(a3) << 8) | ((unint64_t)BYTE3(a3) << 24) | a3 & 0xFFFF000000FFLL,  a4,  v20,  v19 + 24);
    return swift_unknownObjectRelease();
  }

BOOL _HeapNode.isRoot.getter(uint64_t a1)
{
  return a1 == 0;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.parent()()
{
  uint64_t v2 = v0 - 1;
  if (v0 - 1 < 0) {
    uint64_t v2 = v0;
  }
  Swift::Int v3 = v2 >> 1;
  Swift::Int v4 = v1 - 1;
  result.level = v4;
  result.offset = v3;
  return result;
}

BOOL _HeapNode.isMinLevel.getter(uint64_t a1, char a2)
{
  return (a2 & 1) == 0LL;
}

CollectionsInternal::_HeapNode_optional __swiftcall _HeapNode.grandParent()()
{
  BOOL v3 = __OFSUB__(v0, 3LL);
  BOOL v2 = v0 - 3 < 0;
  Swift::Bool v4 = v0 < 3;
  if (v0 >= 3) {
    Swift::Int v5 = (unint64_t)(v0 - 3) >> 2;
  }
  else {
    Swift::Int v5 = 0LL;
  }
  if (v2 != v3) {
    Swift::Int v6 = 0LL;
  }
  else {
    Swift::Int v6 = v1 - 2;
  }
  result.value.level = v6;
  result.value.offset = v5;
  result.is_nil = v4;
  return result;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.firstGrandchild()()
{
  Swift::Int v2 = (4 * v0) | 3;
  Swift::Int v3 = v1 + 2;
  result.level = v3;
  result.offset = v2;
  return result;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.leftChild()()
{
  Swift::Int v2 = (2 * v0) | 1;
  Swift::Int v3 = v1 + 1;
  result.level = v3;
  result.offset = v2;
  return result;
}

BOOL static _HeapNode.< infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 < a3;
}

unint64_t static _HeapNode.level(forOffset:)(unint64_t result)
{
  if (result <= 0x7FFFFFFFFFFFFFFELL) {
    return __clz(result + 1) ^ 0x3F;
  }
  __break(1u);
  return result;
}

uint64_t static _HeapNode.allNodes(onLevel:limit:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = ~(-1LL << result);
  uint64_t v4 = (1LL << (result + 1)) - 2;
  if (v4 >= a2) {
    uint64_t v4 = a2 - 1;
  }
  BOOL v5 = v3 < a2;
  if (v3 < a2) {
    uint64_t v6 = ~(-1LL << result);
  }
  else {
    uint64_t v6 = 0LL;
  }
  if (v3 < a2) {
    uint64_t v7 = result;
  }
  else {
    uint64_t v7 = 0LL;
  }
  if (!v5) {
    uint64_t v4 = 0LL;
  }
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v7;
  char v8 = !v5;
  *(void *)(a3 + 16) = v4;
  *(void *)(a3 + 24) = v7;
  *(_BYTE *)(a3 + 32) = v8;
  return result;
}

BOOL static _HeapNode.isMinLevel(_:)(char a1)
{
  return (a1 & 1) == 0LL;
}

uint64_t ClosedRange<>._forEach(_:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 >= a3)
  {
    uint64_t v7 = a3;
    char v8 = (uint64_t (*)(uint64_t, uint64_t))result;
    do
      CollectionsInternal::_HeapNode result = v8(v7++, a4);
    while (v7 <= a5);
  }

  return result;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.init(offset:)(Swift::Int offset)
{
  else {
    Swift::Int v1 = __clz(offset + 1) ^ 0x3F;
  }
  result.level = v1;
  result.offset = offset;
  return result;
}

uint64_t static _HeapNode.root.getter()
{
  return 0LL;
}

uint64_t static _HeapNode.leftMax.getter()
{
  return 1LL;
}

uint64_t static _HeapNode.rightMax.getter()
{
  return 2LL;
}

uint64_t _HeapNode.offset.setter(uint64_t result)
{
  *Swift::Int v1 = result;
  return result;
}

uint64_t (*_HeapNode.offset.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

uint64_t _HeapNode.level.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t _HeapNode.level.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*_HeapNode.level.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

BOOL static _HeapNode.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

uint64_t _HeapNode.description.getter()
{
  return 0x3A74657366666F28LL;
}

uint64_t sub_188DF4204()
{
  return _HeapNode.description.getter();
}

uint64_t static _HeapNode.firstNode(onLevel:)(char a1)
{
  return ~(-1LL << a1);
}

uint64_t static _HeapNode.lastNode(onLevel:)(char a1)
{
  return (1LL << (a1 + 1)) - 2;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.rightChild()()
{
  Swift::Int v2 = 2 * v0 + 2;
  Swift::Int v3 = v1 + 1;
  result.level = v3;
  result.offset = v2;
  return result;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.lastGrandchild()()
{
  Swift::Int v2 = 4 * v0 + 6;
  Swift::Int v3 = v1 + 2;
  result.level = v3;
  result.offset = v2;
  return result;
}

unint64_t sub_188DF425C()
{
  unint64_t result = qword_18C74B888;
  if (!qword_18C74B888)
  {
    unint64_t result = MEMORY[0x1895D7620](&protocol conformance descriptor for _HeapNode, &type metadata for _HeapNode);
    atomic_store(result, (unint64_t *)&qword_18C74B888);
  }

  return result;
}

ValueMetadata *type metadata accessor for _HeapNode()
{
  return &type metadata for _HeapNode;
}

uint64_t OrderedSet<>.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = a3;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
  uint64_t v7 = sub_188DF8738();
  uint64_t v9 = a5;
  MEMORY[0x1895D7620](MEMORY[0x189619560], v7, &v9);
  sub_188DF899C();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

uint64_t sub_188DF4384(void *a1, uint64_t a2, uint64_t a3)
{
  return OrderedSet<>.encode(to:)(a1, a2, *(void *)(v3 + 8), *(void *)(a2 + 16), *(void *)(a3 - 8));
}

uint64_t OrderedSet<>.init(from:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v29 = a3;
  uint64_t v30 = a2;
  uint64_t v7 = sub_188DF8648();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  __int128 v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_188DF8AE0();
  if (v4) {
    goto LABEL_8;
  }
  __int128 v26 = v10;
  uint64_t v27 = v8;
  uint64_t v28 = v7;
  __swift_project_boxed_opaque_existential_1(v33, v34);
  uint64_t v12 = sub_188DF8738();
  uint64_t v35 = v29;
  MEMORY[0x1895D7620](MEMORY[0x189619580], v12, &v35);
  sub_188DF8990();
  uint64_t v13 = v31[0];
  uint64_t v32 = v31[0];
  uint64_t v14 = sub_188D10D98();
  uint64_t v15 = (uint64_t (*)(char *, uint64_t, uint64_t))MEMORY[0x1895D7620](MEMORY[0x189619588], v12);
  uint64_t v16 = static _HashTable.create<A>(untilFirstDuplicateIn:scale:reservedScale:)( (uint64_t)v31,  (uint64_t)&v32,  0LL,  1,  v14,  v12,  v15,  a4);
  uint64_t v17 = v31[0];
  if (v31[0] != *(void *)(v13 + 16))
  {
    swift_release();
    __swift_project_boxed_opaque_existential_1(v33, v34);
    sub_188DF88DC();
    v31[0] = 0LL;
    v31[1] = 0xE000000000000000LL;
    sub_188DF8600();
    sub_188DF7EE0();
    uint64_t v32 = v17;
    sub_188DF8954();
    sub_188DF7EE0();
    uint64_t v19 = v26;
    sub_188DF863C();
    uint64_t v11 = sub_188DF8654();
    swift_allocError();
    uint64_t v21 = v20;
    uint64_t v22 = v27;
    uint64_t v23 = v28;
    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 16))(v20, v19, v28);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104LL))( v21,  *MEMORY[0x189619360],  v11);
    swift_willThrow();
    swift_release();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
LABEL_8:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v11;
  }

  if (_s19CollectionsInternal4HeapV5countSivg_0() < 16)
  {
    uint64_t v18 = 0LL;
  }

  else
  {
    swift_retain();
    uint64_t v18 = v16;
  }

  uint64_t v11 = OrderedSet.init(_uniqueElements:_:)(v13, v18);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v11;
}

uint64_t sub_188DF46C4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = OrderedSet<>.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a3 - 8), *(void *)(a2 + 24));
  if (!v4)
  {
    *a4 = result;
    a4[1] = v7;
  }

  return result;
}

uint64_t _HashTable.Header._description.getter()
{
  return 0x203A656C61637328LL;
}

unint64_t _HashTable.Header.description.getter()
{
  return 0xD000000000000011LL;
}

unint64_t sub_188DF4924()
{
  return _HashTable.Header.description.getter();
}

uint64_t sub_188DF492C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t result = 0LL;
  if (1LL << *a3 <= 127)
  {
    sub_188DF7EE0();
    sub_188D4B608(a3, a4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C74B890);
    sub_188DF4C68();
    sub_188DF7CAC();
    swift_bridgeObjectRelease();
    sub_188DF7EE0();
    swift_bridgeObjectRelease();
    return 0LL;
  }

  return result;
}

uint64_t sub_188DF4AA0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    unint64_t v3 = 0xE100000000000000LL;
    uint64_t result = 95LL;
  }

  else
  {
    uint64_t result = sub_188DF88D0();
  }

  *a2 = result;
  a2[1] = v3;
  return result;
}

uint64_t _HashTable.UnsafeHandle.description.getter(void *a1, uint64_t a2)
{
  return sub_188DF492C(0xD000000000000017LL, 0x8000000188E008F0LL, a1, a2);
}

uint64_t sub_188DF4B20()
{
  return sub_188DF492C(0xD000000000000017LL, 0x8000000188E008F0LL, *(void **)v0, *(void *)(v0 + 8));
}

uint64_t _HashTable.description.getter(uint64_t a1)
{
  return sub_188DF492C(0x626154687361485FLL, 0xEA0000000000656CLL, (void *)(a1 + 16), a1 + 32);
}

uint64_t sub_188DF4B64()
{
  return sub_188DF492C( 0x626154687361485FLL,  0xEA0000000000656CLL,  (void *)(*(void *)v0 + 16LL),  *(void *)v0 + 32LL);
}

uint64_t _HashTable.Storage.description.getter()
{
  uint64_t v1 = sub_188DF492C(0xD000000000000012LL, 0x8000000188E00910LL, (void *)(v0 + 16), v0 + 32);
  swift_release();
  return v1;
}

uint64_t sub_188DF4BF8()
{
  uint64_t v1 = *v0;
  Swift::Int v2 = (void *)(*v0 + 16LL);
  swift_retain();
  uint64_t v3 = sub_188DF492C(0xD000000000000012LL, 0x8000000188E00910LL, v2, v1 + 32);
  swift_release();
  return v3;
}

unint64_t sub_188DF4C68()
{
  unint64_t result = qword_18C74B898;
  if (!qword_18C74B898)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C74B890);
    unint64_t v2 = sub_188DF4CCC();
    unint64_t result = MEMORY[0x1895D7620](MEMORY[0x189619610], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_18C74B898);
  }

  return result;
}

unint64_t sub_188DF4CCC()
{
  unint64_t result = qword_18C74B8A0;
  if (!qword_18C74B8A0)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C74B8A8);
    unint64_t result = MEMORY[0x1895D7620](MEMORY[0x189618458], v1);
    atomic_store(result, (unint64_t *)&qword_18C74B8A0);
  }

  return result;
}

uint64_t TreeSet.isSuperset(of:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _HashNode.isSubset<A>(_:of:)(0, a4, a5, a1, a2, a7, MEMORY[0x18961AFC8] + 8LL, MEMORY[0x18961AFC8] + 8LL, a8) & 1;
}

uint64_t TreeSet.isSuperset<A>(of:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _HashNode.isSubset<A>(_:of:)(0, a4, a5, a1, a2, a7, a8, MEMORY[0x18961AFC8] + 8LL, a9);
}

uint64_t TreeSet.isSuperset<A>(of:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = *(void *)(a6 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = type metadata accessor for TreeSet(0LL, v20, v21, v19);
  if (v22 == a6)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, a6);
    swift_dynamicCast();
    char v23 = _HashNode.isSubset<A>(_:of:)( 0,  a2,  a3,  v26[0],  v26[1],  a5,  MEMORY[0x18961AFC8] + 8LL,  MEMORY[0x18961AFC8] + 8LL,  a7);
    swift_release();
  }

  else
  {
    MEMORY[0x1895F8858](v22);
    v26[-8] = a5;
    v26[-7] = a6;
    v26[-6] = a7;
    v26[-5] = a8;
    v26[-4] = a2;
    v26[-3] = a3;
    uint64_t v25 = a4;
    char v23 = sub_188DF8018();
  }

  return v23 & 1;
}

void TreeDictionary.mapValues<A>(_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _OWORD v14[2] = a6;
  void v14[3] = a7;
  v14[4] = a8;
  v14[5] = a9;
  v14[6] = a1;
  v14[7] = a2;
  _HashNode.mapValues<A>(_:)((void (*)(char *, char *))sub_188DF50A0, (uint64_t)v14, a3, a4, a6, a7, a8, a9);
  if (!v9) {
    TreeDictionary.init(_new:)(v12, v13, a6, a8, a9);
  }
}

uint64_t sub_188DF4F90( uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = a3;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v11 = *(void *)(TupleTypeMetadata2 - 8);
  MEMORY[0x1895F8858](TupleTypeMetadata2);
  uint64_t v13 = (char *)&v16 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16LL))((char *)&v16 - v12, a1, a5);
  uint64_t v14 = &v13[*(int *)(TupleTypeMetadata2 + 48)];
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 16LL))(v14, a2, a6);
  v17(v14);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, TupleTypeMetadata2);
}

uint64_t sub_188DF50A0(uint64_t a1, uint64_t a2)
{
  return sub_188DF4F90( a1,  a2,  *(void (**)(char *))(v2 + 48),  *(void *)(v2 + 56),  *(void *)(v2 + 16),  *(void *)(v2 + 24));
}

uint64_t TreeDictionary.compactMapValues<A>(_:)( void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v28 = a4;
  uint64_t v29 = a7;
  uint64_t v27 = a3;
  uint64_t v13 = type metadata accessor for _HashNode.Builder(0LL, a6, a8, a9);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x1895F8858](v13);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v15);
  uint64_t v19 = (char *)&v26 - v18;
  uint64_t v20 = v30;
  uint64_t result = _HashNode.compactMapValues<A>(_:_:)(0, a1, a2, v27, v28, a6, v29, a8, (uint64_t)&v26 - v18, a9);
  if (!v20)
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
    sub_188D9B09C(v13);
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    return TreeDictionary.init(_new:)(v23, v25, a6, a8, a9);
  }

  return result;
}

uint64_t sub_188DF5210(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_WORD *)(a1 + 20) = *(_WORD *)(a2 + 20);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s6_ChunkVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_BYTE *)(a1 + 19) = *(_BYTE *)(a2 + 19);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 21) = *(_BYTE *)(a2 + 21);
  return a1;
}

uint64_t _s6_ChunkVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_WORD *)(a1 + 20) = *(_WORD *)(a2 + 20);
  return a1;
}

ValueMetadata *_s6_ChunkVMa()
{
  return &_s6_ChunkVN;
}

unint64_t sub_188DF531C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v4 = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v9 = sub_188CF73DC((uint64_t)v9);
    *uint64_t v4 = v9;
  }

  unint64_t result = sub_188DF55E8(a1, a2, a3, a4);
  *uint64_t v4 = v9;
  return result;
}

unint64_t sub_188DF53C8(unint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a3 + a2;
  if (__CFADD__(a3, a2))
  {
    __break(1u);
  }

  else
  {
    unint64_t v5 = a3 >> 6;
    char v6 = a3 & 0x3F;
    unint64_t v7 = v4 >> 6;
    BOOL v8 = v4 > 0x3F;
    unint64_t v9 = v4 & 0x3F;
    uint64_t v10 = v8 & (v9 == 0);
    char v11 = 64;
    if (!(_DWORD)v10) {
      char v11 = v9;
    }
    uint64_t v12 = v7 - v10;
    uint64_t v13 = *v3;
    if (v5 == v12)
    {
      uint64_t v14 = -1LL << v11;
      if ((v10 & 1) != 0) {
        uint64_t v15 = -1LL;
      }
      else {
        uint64_t v15 = ~v14;
      }
      *(void *)(v13 + 8 * v5) = *(void *)(v13 + 8 * v5) & (v15 ^ (-1LL << v6)) | (result << v6);
    }

    else
    {
      *(void *)(v13 + 8 * v5) = *(void *)(v13 + 8 * v5) & ~(-1LL << v6) | (result << v6);
      uint64_t v16 = -1LL << v11;
      if ((v10 & 1) != 0) {
        uint64_t v16 = 0LL;
      }
      *(void *)(v13 + 8 * v12) = *(void *)(v13 + 8 * v12) & v16 | (result >> -(char)a3);
    }
  }

  return result;
}

unint64_t sub_188DF548C( unint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v6 = a2 - result;
  if (a2 == result) {
    return result;
  }
  unint64_t v7 = a5;
  unint64_t v10 = result;
  unint64_t result = sub_188DF57E8(a5, result, a2, v5, a3);
  unint64_t v11 = a2 | v10;
  if ((result & 1) != 0)
  {
    if (((v11 | v7) & 0x8000000000000000LL) == 0)
    {
      if (a2 <= v10) {
        return result;
      }
      unint64_t v12 = a2 >> 6;
      unint64_t v13 = a2 & 0x3F;
      while (1)
      {
        unint64_t v14 = v10 >> 6;
        unint64_t v15 = v10 & 0x3F;
        if (v10 >> 6 == v12)
        {
          uint64_t v16 = v13 - v15;
          if (v13 < v15) {
            goto LABEL_23;
          }
          unint64_t v17 = *(void *)(a3 + 8 * v12) & ~(-1LL << a2);
          unint64_t v10 = a2;
        }

        else
        {
          uint64_t v16 = 64 - v15;
          v10 += 64 - v15;
          unint64_t v17 = *(void *)(a3 + 8 * v14);
        }

        unint64_t result = sub_188DF53C8(v17 >> v15, v16, v7);
        BOOL v18 = __CFADD__(v7, v16);
        v7 += v16;
        if (v18) {
          break;
        }
        if (v10 >= a2) {
          return result;
        }
      }

      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
    }

    __break(1u);
    goto LABEL_25;
  }

  if ((v11 & 0x8000000000000000LL) != 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  BOOL v19 = __OFADD__(v7, v6);
  unint64_t v20 = v7 + v6;
  if (v19)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  if ((v20 & 0x8000000000000000LL) != 0)
  {
LABEL_27:
    __break(1u);
    return result;
  }

  while (1)
  {
    unint64_t result = sub_188D37E88();
    if ((v22 & 1) != 0) {
      return result;
    }
    BOOL v18 = v20 >= v21;
    v20 -= v21;
    if (!v18) {
      goto LABEL_22;
    }
    sub_188DF53C8(result, v21, v20);
  }

unint64_t sub_188DF55E8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a3;
  uint64_t v7 = *(void *)(a4 - 8);
  MEMORY[0x1895F8858](a1);
  unint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t result = MEMORY[0x1895F8858](AssociatedTypeWitness);
  unint64_t v14 = (char *)&v23 - v13;
  if ((a2 & 0x8000000000000000LL) != 0)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a4);
  sub_188DF7FDC();
  if ((a2 & 0x3F) == 0) {
    goto LABEL_6;
  }
  swift_getAssociatedConformanceWitness();
  unint64_t v15 = sub_188D37F3C(64 - (a2 & 0x3F));
  uint64_t v17 = v16;
  sub_188DF53C8(v15, v16, a2);
  BOOL v18 = __CFADD__(a2, v17);
  a2 += v17;
  if (v18)
  {
    __break(1u);
LABEL_6:
    swift_getAssociatedConformanceWitness();
  }

  unint64_t v19 = sub_188D37F3C(64LL);
  if (v20)
  {
    uint64_t v21 = v20;
    while (1)
    {
      unint64_t result = sub_188DF53C8(v19, v21, a2);
      BOOL v18 = __CFADD__(a2, v21);
      a2 += v21;
      if (v18) {
        break;
      }
      unint64_t v19 = sub_188D37F3C(64LL);
      uint64_t v21 = v22;
      if (!v22) {
        goto LABEL_11;
      }
    }

    __break(1u);
    goto LABEL_15;
  }

unint64_t sub_188DF57E8( unint64_t result, unint64_t a2, unint64_t a3, void *a4, uint64_t a5)
{
  if (((a2 | result | a3) & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else
  {
    BOOL v5 = (a3 & 0x3F) == 0 && a3 > 0x3F;
    unint64_t v6 = *a4 + 8 * (result >> 6);
    unint64_t v7 = a5 + 8 * (a2 >> 6);
    uint64_t v8 = 1LL;
    if (v6 >= v7)
    {
      unint64_t v9 = a5 + 8 * ((a3 >> 6) - v5);
      if (v9 >= v6)
      {
        if ((result & 0x3F) < (a2 & 0x3F) && v6 == v7) {
          return 1LL;
        }
        LODWORD(v8) = ((a3 & 0x3F) <= (result & 0x3F)) ^ v5;
        if (v6 == v9) {
          return v8;
        }
        else {
          return 0LL;
        }
      }
    }

    return v8;
  }

  return result;
}

uint64_t _Hash.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_188DF5A9C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8LL))(a1, a2);
  return v4;
}

BOOL static _Hash.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _Hash.subscript.getter(char a1, unint64_t a2)
{
  return (a2 >> a1) & 0x1F;
}

BOOL _Hash.isEqual(to:upTo:)(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return a2 < 0x40u || a3 == a1;
}

uint64_t _Hash.description.getter()
{
  uint64_t result = sub_188DF7E74();
  if (__OFSUB__(13LL, result))
  {
    __break(1u);
  }

  else
  {
    MEMORY[0x1895D6828](48LL, 0xE100000000000000LL, (13 - result) & ~((13 - result) >> 63));
    swift_bridgeObjectRetain();
    sub_188DF7EE0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C74A238);
    sub_188D277D0();
    return sub_188DF7FB8();
  }

  return result;
}

uint64_t static _Hash.emptyPath.getter()
{
  return 0LL;
}

uint64_t static _Hash.bitWidth.getter()
{
  return 64LL;
}

uint64_t _Hash.value.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*_Hash.value.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

uint64_t sub_188DF59F0()
{
  return _Hash.description.getter();
}

uint64_t _Hash.subscript.setter(uint64_t result, char a2)
{
  *uint64_t v2 = *v2 & ((-31LL << a2) - 1) | ((unint64_t)result << a2);
  return result;
}

uint64_t (*_Hash.subscript.modify(uint64_t a1, char a2))(uint64_t result)
{
  *(void *)a1 = v2;
  *(_BYTE *)(a1 + 9) = a2;
  *(_BYTE *)(a1 + 8) = (*v2 >> a2) & 0x1F;
  return sub_188DF5A4C;
}

uint64_t sub_188DF5A4C(uint64_t result)
{
  **(void **)uint64_t result = ((-31LL << *(_BYTE *)(result + 9)) - 1) & **(void **)result | ((unint64_t)*(unsigned __int8 *)(result + 8) << *(_BYTE *)(result + 9));
  return result;
}

unint64_t _Hash.appending(_:at:)(unsigned __int8 a1, char a2, uint64_t a3)
{
  return ((-31LL << a2) - 1) & a3 | ((unint64_t)a1 << a2);
}

uint64_t sub_188DF5A9C()
{
  return sub_188DF7C40();
}

ValueMetadata *type metadata accessor for _Hash()
{
  return &type metadata for _Hash;
}

uint64_t static Deque._isConsistencyCheckingEnabled.getter()
{
  return 0LL;
}

uint64_t Deque._capacity.getter(uint64_t a1, uint64_t a2)
{
  return v4;
}

uint64_t Deque._startSlot.getter(uint64_t a1, uint64_t a2)
{
  return v4;
}

uint64_t Deque.init<A>(_capacity:startSlot:contents:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *(void *)(a5 - 8);
  MEMORY[0x1895F8858](a1);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(&v23[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)], v14, v15);
  uint64_t result = sub_188DF812C();
  if ((a2 | a1) < 0)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v17 = result;
  if (a2 >= a1 && a2 | a1) {
    goto LABEL_10;
  }
  uint64_t result = _s19CollectionsInternal4HeapV5countSivg_0();
  if (result > a1)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v20 = type metadata accessor for _DequeBuffer(0LL, a4, v18, v19);
  MEMORY[0x1895F8858](v20);
  *(void *)&v23[-48] = a5;
  *(void *)&v23[-40] = a6;
  *(void *)&v23[-32] = a1;
  *(void *)&v23[-24] = v17;
  *(void *)&v23[-16] = a2;
  sub_188DF8660();
  swift_retain();
  uint64_t v21 = Deque._Storage.init(_:)();
  uint64_t v22 = _s19CollectionsInternal4HeapV5countSivg_0();
  if (v22 >= 1)
  {
    MEMORY[0x1895F8858](v22);
    *(void *)&v23[-32] = a4;
    *(void *)&v23[-24] = a5;
    *(void *)&v23[-16] = a6;
    *(void *)&v23[-8] = v21;
    sub_188DF86E4();
  }

  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a3, a5);
  return Deque.init(_storage:)(v21, a4);
}

uint64_t sub_188DF5D8C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 48);
  uint64_t result = _s19CollectionsInternal4HeapV5countSivg_0();
  *a1 = v3;
  a1[1] = result;
  a1[2] = v4;
  return result;
}

uint64_t sub_188DF5DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = a4;
  uint64_t v16 = a5;
  uint64_t v17 = a6;
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  uint64_t v11 = a4;
  uint64_t v12 = sub_188DF609C;
  uint64_t v13 = &v14;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_18C749FB0);
  return sub_188D0D240( (uint64_t)sub_188D6CC80,  (uint64_t)v10,  a3,  (uint64_t)&type metadata for _DequeBufferHeader,  a4,  v8,  MEMORY[0x18961AFC8] + 8LL,  MEMORY[0x18961A3E8],  (uint64_t)v20);
}

uint64_t sub_188DF5E94(uint64_t a1, uint64_t a2)
{
  return sub_188DF5DE8(a1, a2, v2[5], v2[2], v2[3], v2[4]);
}

uint64_t sub_188DF5EB0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v31 = sub_188DF83D8();
  uint64_t v9 = v8;
  uint64_t v10 = sub_188DF7DCC();
  uint64_t v11 = sub_188DF8384();
  uint64_t v12 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 32LL);
  v12(v30, &v29, v11);
  v12((uint64_t *)&v24, v30, v11);
  uint64_t v23 = a5;
  uint64_t v13 = sub_188DF83F0();
  sub_188D1BE44( (void (*)(char *, char *))sub_188D878F4,  (uint64_t)v22,  MEMORY[0x18961A520],  v13,  v14,  (uint64_t)&v26);
  *((void *)&v21 + 1) = a4;
  uint64_t v20 = v26;
  *(void *)&__int128 v21 = a3;
  char v15 = v27;
  *(void *)&__int128 v24 = a3;
  *((void *)&v24 + 1) = a4;
  uint64_t v16 = *((void *)&v26 + 1);
  MEMORY[0x1895D7620](MEMORY[0x189617C80], v10);
  sub_188DF8270();
  __int128 v24 = v26;
  __int128 v25 = v27;
  uint64_t v17 = sub_188DF8A14();
  uint64_t v18 = MEMORY[0x1895D7620](MEMORY[0x18961A5E8], v17);
  uint64_t result = UnsafeMutableBufferPointer.initialize<A>(fromContentsOf:)((uint64_t)&v24, v31, v9, a5, v17, v18);
  if ((v15 & 1) == 0)
  {
    if (v16)
    {
      __int128 v24 = v21;
      sub_188DF8288();
      __int128 v24 = v26;
      __int128 v25 = v27;
      return UnsafeMutableBufferPointer.initialize<A>(fromContentsOf:)((uint64_t)&v24, v20, v16, a5, v17, v18);
    }
  }

  return result;
}

uint64_t sub_188DF609C(void *a1, uint64_t a2)
{
  return sub_188DF5EB0(a1, a2, v2[5], v2[6], v2[2]);
}

unint64_t UInt._reversed.getter(unint64_t a1)
{
  return __rbit64(a1);
}

char *BitArray.init(arrayLiteral:)(unint64_t a1)
{
  uint64_t v3 = sub_188CF7528(0LL, (unint64_t)(*(void *)(a1 + 16) + 63LL) >> 6, 0, MEMORY[0x18961AFE8]);
  sub_188DF61A4(a1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_188DF6130@<X0>(unint64_t a1@<X0>, char **a2@<X8>)
{
  BOOL v5 = sub_188CF7528(0LL, (unint64_t)(*(void *)(a1 + 16) + 63LL) >> 6, 0, MEMORY[0x18961AFE8]);
  sub_188DF61A4(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5;
  a2[1] = 0LL;
  return result;
}

unint64_t sub_188DF61A4(unint64_t result)
{
  uint64_t v3 = v1;
  uint64_t v4 = result;
  unint64_t v5 = (unint64_t)v1[1];
  unint64_t v6 = v5 & 0x3F;
  if ((v5 & 0x3F) != 0)
  {
    unint64_t v7 = 0LL;
    unint64_t v8 = 0LL;
    uint64_t v9 = (char *)(64 - v6);
    unint64_t v10 = *(void *)(result + 16);
    unint64_t v11 = v6 ^ 0x3F;
    if (v10 >= v11) {
      uint64_t v12 = (char *)v11;
    }
    else {
      uint64_t v12 = *(char **)(result + 16);
    }
    while ((char *)v10 != v7)
    {
      uint64_t v13 = v7 + 1;
      if (v7[result + 32]) {
        uint64_t v14 = 1LL << (char)v7;
      }
      else {
        uint64_t v14 = 0LL;
      }
      v8 |= v14;
      unint64_t v7 = v13;
      if (v9 == v13)
      {
        uint64_t v12 = v9;
        goto LABEL_13;
      }
    }

    if (!v12) {
      return result;
    }
LABEL_13:
    unint64_t v15 = (unint64_t)&v12[v5];
    if (__CFADD__(v5, v12))
    {
LABEL_47:
      __break(1u);
    }

    else
    {
      v1[1] = (char *)v15;
      uint64_t v2 = *v1;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v1 = v2;
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
LABEL_15:
        uint64_t result = sub_188DF53C8(v8, (uint64_t)v12, v5);
        *uint64_t v3 = v2;
        goto LABEL_16;
      }
    }

    uint64_t v2 = sub_188CF73DC((uint64_t)v2);
    *uint64_t v3 = v2;
    goto LABEL_15;
  }

  uint64_t v12 = 0LL;
  unint64_t v15 = (unint64_t)v1[1];
LABEL_16:
  unint64_t v8 = 0LL;
  unint64_t v5 = 0LL;
  uint64_t v2 = *(char **)(v4 + 16);
  int64_t v17 = v2 - v12;
  if (v2 < v12) {
    int64_t v17 = 0LL;
  }
  while (v12 - v2 + v8)
  {
    if (v17 == v8) {
      goto LABEL_46;
    }
    unint64_t v18 = v8 + 1;
    if (v12[v4 + 32 + v8]) {
      uint64_t v19 = 1LL << v8;
    }
    else {
      uint64_t v19 = 0LL;
    }
    v5 |= v19;
    ++v8;
    if (v18 == 64)
    {
      uint64_t v20 = v12 + 64;
      goto LABEL_26;
    }
  }

  uint64_t v20 = *(char **)(v4 + 16);
  if (!v8) {
    return result;
  }
LABEL_26:
  uint64_t v12 = *v3;
  __int128 v26 = v3;
  uint64_t v27 = v4 + 32;
  uint64_t v4 = 1LL;
LABEL_28:
  while (2)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v12 = sub_188CF7528(0LL, *((void *)v12 + 2) + 1LL, 1, v12);
    }
    unint64_t v22 = *((void *)v12 + 2);
    unint64_t v21 = *((void *)v12 + 3);
    if (v22 >= v21 >> 1) {
      uint64_t v12 = sub_188CF7528((char *)(v21 > 1), v22 + 1, 1, v12);
    }
    *((void *)v12 + 2) = v22 + 1;
    *(void *)&v12[8 * v22 + 32] = 0LL;
    uint64_t v3 = (char **)(v15 + v8);
    if (__CFADD__(v15, v8))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }

    uint64_t result = sub_188DF53C8(v5, v8, v15);
    unint64_t v8 = 0LL;
    unint64_t v5 = 0LL;
    uint64_t v23 = (char *)(v2 - v20);
    if (v2 < v20) {
      uint64_t v23 = 0LL;
    }
    while (v20 - v2 + v8)
    {
      if (v23 == (char *)v8)
      {
        __break(1u);
        goto LABEL_45;
      }

      unint64_t v24 = v8 + 1;
      if (v20[v27 + v8]) {
        uint64_t v25 = 1LL << v8;
      }
      else {
        uint64_t v25 = 0LL;
      }
      v5 |= v25;
      ++v8;
      if (v24 == 64)
      {
        v20 += 64;
        unint64_t v15 = (unint64_t)v3;
        goto LABEL_28;
      }
    }

    uint64_t v20 = v2;
    unint64_t v15 = (unint64_t)v3;
    if (v8) {
      continue;
    }
    break;
  }

  *__int128 v26 = v12;
  v26[1] = (char *)v3;
  return result;
}

unint64_t UInt._lastSetBit.getter(unint64_t a1)
{
  return __clz(__rbit64(a1)) & 0x3F;
}

unint64_t UInt._firstSetBit.getter(unint64_t a1)
{
  unint64_t v1 = __clz(a1) ^ 0x3F;
  if (a1) {
    return v1;
  }
  else {
    return 0LL;
  }
}

uint64_t _HashNode.insertChild(_:_:)(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  return swift_release();
}

uint64_t _HashNode.UnsafeHandle._makeRoomForNewItem(at:_:)(unsigned int a1, char a2, int *a3, uint64_t a4)
{
  int v8 = ~a2;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)*a3);
  v9.i16[0] = vaddlv_u8(v9);
  if (*a3 == a3[1]) {
    uint64_t v10 = *a3;
  }
  else {
    uint64_t v10 = v9.u32[0];
  }
  uint64_t v11 = *(void *)(*(void *)(swift_getTupleTypeMetadata2() - 8) + 72LL);
  uint64_t v12 = a3[2];
  a3[3] -= v11;
  uint64_t v13 = a4 + v12 + v11 * ~v10;
  uint64_t v14 = v10 - a1;
  sub_188DF836C();
  int v15 = *a3;
  if (v8)
  {
    int v16 = v15 | (1 << a2);
  }

  else
  {
    int v16 = v15 + 1;
    a3[1] = v16;
  }

  *a3 = v16;
  return v13 + v14 * v11;
}

uint64_t _HashNode.insertItem(_:at:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v5 = v4;
  uint64_t v57 = a3;
  uint64_t v48 = a2;
  uint64_t v8 = a4[2];
  uint64_t v9 = a4[3];
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v53 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v11 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  unint64_t v52 = &v45[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  unint64_t v51 = &v45[-v14];
  uint64_t v15 = MEMORY[0x1895F8858](v13);
  unint64_t v50 = &v45[-v16];
  uint64_t v17 = MEMORY[0x1895F8858](v15);
  unint64_t v54 = &v45[-v18];
  uint64_t v19 = MEMORY[0x1895F8858](v17);
  unint64_t v21 = &v45[-v20];
  uint64_t v22 = MEMORY[0x1895F8858](v19);
  unint64_t v24 = &v45[-v23];
  uint64_t v25 = &v45[*(int *)(v22 + 48) - v23];
  uint64_t v26 = *(void *)(v8 - 8);
  unint64_t v56 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v26 + 32);
  char v49 = &v45[-v23];
  v56(&v45[-v23], a1, v8);
  uint64_t v27 = *(void *)(v9 - 8);
  unint64_t v55 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v27 + 32);
  v55(v25, v48, v9);
  uint64_t v47 = (int *)nullsub_1(*v5 + 16LL, *v5 + 32LL, v8, v9, a4[4]);
  uint64_t v48 = v28;
  v29.i32[0] = *v47 & ~(-1 << v57);
  uint8x8_t v30 = (uint8x8_t)vcnt_s8(v29);
  v30.i16[0] = vaddlv_u8(v30);
  unsigned int v46 = v30.i32[0];
  uint64_t v31 = &v21[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v32 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v26 + 16);
  v32(v21, v24, v8);
  uint64_t v33 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v27 + 16);
  v33(v31, v25, v9);
  uint64_t v34 = v54;
  uint64_t v35 = &v54[*(int *)(TupleTypeMetadata2 + 48)];
  v56(v54, (uint64_t)v21, v8);
  v55(v35, (uint64_t)v31, v9);
  ++v5[1];
  uint64_t v36 = v50;
  uint64_t v37 = &v50[*(int *)(TupleTypeMetadata2 + 48)];
  v32(v50, v34, v8);
  v33(v37, v35, v9);
  uint64_t v38 = _HashNode.UnsafeHandle._makeRoomForNewItem(at:_:)(v46, v57, v47, v48);
  uint64_t v39 = v51;
  uint64_t v40 = &v51[*(int *)(TupleTypeMetadata2 + 48)];
  v32(v51, v36, v8);
  v33(v40, v37, v9);
  uint64_t v41 = (uint64_t)v52;
  uint64_t v42 = &v52[*(int *)(TupleTypeMetadata2 + 48)];
  v56(v52, (uint64_t)v39, v8);
  v55(v42, (uint64_t)v40, v9);
  sub_188D8A1FC(v41, v38, TupleTypeMetadata2);
  uint64_t v43 = *(void (**)(_BYTE *, uint64_t))(v53 + 8);
  v43(v54, TupleTypeMetadata2);
  v43(v36, TupleTypeMetadata2);
  return ((uint64_t (*)(_BYTE *, uint64_t))v43)(v49, TupleTypeMetadata2);
}

uint64_t _HashNode.UnsafeHandle._insertChild(_:at:)( uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_DWORD *)(a4 + 12) -= 16;
  uint64_t v10 = a5 + 16LL * a3;
  uint64_t v11 = type metadata accessor for _HashNode(0LL, a6, a7, a8);
  sub_188DF836C();
  v13[0] = a1;
  v13[1] = a2;
  return sub_188D8A1FC((uint64_t)v13, v10, v11);
}

uint64_t _HashNode.insertItem(_:at:_:)(uint64_t a1, uint64_t a2, unsigned int a3, int a4, uint64_t a5)
{
  unsigned int v40 = a3;
  LODWORD(v41) = a4;
  uint64_t v38 = a5;
  uint64_t v8 = *(void *)(a5 + 16);
  uint64_t v9 = *(void *)(a5 + 24);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v42 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v11 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  uint64_t v39 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  uint64_t v37 = (char *)&v35 - v14;
  uint64_t v15 = MEMORY[0x1895F8858](v13);
  uint64_t v17 = (char *)&v35 - v16;
  uint64_t v18 = MEMORY[0x1895F8858](v15);
  uint64_t v20 = (char *)&v35 - v19;
  unint64_t v21 = (char *)&v35 + *(int *)(v18 + 48) - v19;
  uint64_t v22 = *(void *)(v8 - 8);
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 32);
  v36((char *)&v35 - v19, a1, v8);
  uint64_t v23 = *(void *)(v9 - 8);
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 32);
  v35(v21, a2, v9);
  ++v5[1];
  unint64_t v24 = &v17[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  v25(v17, v20, v8);
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
  v26(v24, v21, v9);
  uint64_t v27 = (int *)nullsub_1(*v5 + 16LL, *v5 + 32LL, v8, v9, *(void *)(v38 + 32));
  uint64_t v41 = _HashNode.UnsafeHandle._makeRoomForNewItem(at:_:)(v40, v41, v27, v28);
  int8x8_t v29 = v37;
  uint8x8_t v30 = &v37[*(int *)(TupleTypeMetadata2 + 48)];
  v25(v37, v17, v8);
  v26(v30, v24, v9);
  uint64_t v31 = (uint64_t)v39;
  uint64_t v32 = &v39[*(int *)(TupleTypeMetadata2 + 48)];
  v36(v39, (uint64_t)v29, v8);
  v35(v32, (uint64_t)v30, v9);
  sub_188D8A1FC(v31, v41, TupleTypeMetadata2);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v42 + 8);
  v33(v20, TupleTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v33)(v17, TupleTypeMetadata2);
}

uint64_t sub_188DF6B94(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v7 = *v4;
  v4[1] += a2;
  uint64_t v8 = a4[2];
  uint64_t v9 = a4[3];
  uint64_t v10 = a4[4];
  uint64_t v11 = nullsub_1(v7 + 16, v7 + 32, v8, v9, v10);
  uint64_t v13 = v12;
  int v14 = 1 << a3;
  v15.i32[0] = *(_DWORD *)(v11 + 4) & ((1 << a3) - 1);
  uint8x8_t v16 = (uint8x8_t)vcnt_s8(v15);
  v16.i16[0] = vaddlv_u8(v16);
  unsigned int v17 = v16.i32[0];
  uint64_t v18 = swift_retain();
  uint64_t result = _HashNode.UnsafeHandle._insertChild(_:at:)(v18, a2, v17, v11, v13, v8, v9, v10);
  *(_DWORD *)(v11 + 4) |= v14;
  return result;
}

_BYTE *BitSet.formIntersection(_:)(int8x16_t *a1)
{
  unint64_t v3 = a1[1].u64[0];
  uint64_t v4 = (char *)*v1;
  unint64_t v5 = *(void *)(*v1 + 16);
  if (v5 > v3)
  {
    sub_188DF6D8C(v5 - v3);
    uint64_t v4 = (char *)*v1;
  }

  char v20 = 1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_188CF73DC((uint64_t)v4);
  }
  unint64_t v6 = *((void *)v4 + 2);
  if (v3 < v6) {
    unint64_t v6 = v3;
  }
  if (v6)
  {
    if (v6 < 6 || ((uint64_t v7 = 8 * v6 + 32, v4 + 32 < &a1->i8[v7]) ? (v8 = &a1[2] >= (int8x16_t *)&v4[v7]) : (v8 = 1), !v8))
    {
      uint64_t v9 = 0LL;
LABEL_19:
      unint64_t v14 = v6 - v9;
      uint64_t v15 = 8 * v9 + 32;
      uint8x8_t v16 = &v4[v15];
      unsigned int v17 = (uint64_t *)((char *)a1->i64 + v15);
      do
      {
        uint64_t v18 = *v17++;
        *(void *)v16 &= v18;
        v16 += 8;
        --v14;
      }

      while (v14);
      goto LABEL_21;
    }

    uint64_t v9 = v6 & 0x7FFFFFFFFFFFFFFCLL;
    uint64_t v10 = a1 + 3;
    uint64_t v11 = (int8x16_t *)(v4 + 48);
    uint64_t v12 = v6 & 0x7FFFFFFFFFFFFFFCLL;
    do
    {
      int8x16_t v13 = vandq_s8(*v11, *v10);
      v11[-1] = vandq_s8(v11[-1], v10[-1]);
      *uint64_t v11 = v13;
      v10 += 2;
      v11 += 2;
      v12 -= 4LL;
    }

    while (v12);
    if (v6 != v9) {
      goto LABEL_19;
    }
  }

unint64_t sub_188DF6D8C(unint64_t result)
{
  if (result)
  {
    if ((result & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else
    {
      unint64_t v2 = *(void *)(*(void *)v1 + 16LL);
      BOOL v3 = v2 >= result;
      uint64_t result = v2 - result;
      if (v3) {
        return sub_188D74F94(result, v2);
      }
    }

    __break(1u);
  }

  return result;
}

_BYTE *BitSet.formIntersection(_:)(uint64_t a1, uint64_t a2)
{
  if (a2 <= 0) {
    unint64_t v4 = 0LL;
  }
  else {
    unint64_t v4 = a1 & ~(a1 >> 63);
  }
  unint64_t v5 = a2 & ~(a2 >> 63);
  if (v4 == v5)
  {
    uint64_t result = (_BYTE *)swift_bridgeObjectRelease();
    *unint64_t v2 = MEMORY[0x18961AFE8];
    return result;
  }

  if (v4 >= v5)
  {
    __break(1u);
  }

  else
  {
    BOOL v3 = (char *)*v2;
    int64_t v7 = *(void *)(*v2 + 16) + ~((v5 - 1) >> 6);
    if (v7 >= 1)
    {
      sub_188DF6D8C(v7);
      BOOL v3 = (char *)*v2;
    }

    char v8 = 1;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0) {
      goto LABEL_10;
    }
  }

  BOOL v3 = sub_188CF73DC((uint64_t)v3);
LABEL_10:
  _UnsafeBitSet.formIntersection(_:)(v4, v5);
  *unint64_t v2 = (uint64_t)v3;
  return sub_188D8FB84(&v8, v2);
}

uint64_t BitSet.formIntersection<A>(_:)(uint64_t a1, ValueMetadata *a2)
{
  Description = (void (**)(char *, void, ValueMetadata *))a2[-1].Description;
  MEMORY[0x1895F8858](a1);
  unint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C749F60);
  Description[2](v6, a1, a2);
  if ((ValueMetadata *)v7 == a2)
  {
    swift_dynamicCast();
    BitSet.formIntersection(_:)(v10[0], v10[1]);
  }

  else
  {
    char v8 = (int8x16_t *)BitSet.init<A>(_validMembersOf:)((uint64_t)v6, a2);
    BitSet.formIntersection(_:)(v8);
    swift_bridgeObjectRelease();
  }

  return ((uint64_t (*)(uint64_t, ValueMetadata *))Description[1])(a1, a2);
}

uint64_t TreeDictionary.merge<A>(_:uniquingKeysWith:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_188D768F4(a1, a2, a3, a4, a5, a6, (void (*)(void))sub_188DF740C);
}

{
  return sub_188D768F4(a1, a2, a3, a4, a5, a6, (void (*)(void))sub_188DF78B0);
}

_DWORD *TreeDictionary.merge(_:uniquingKeysWith:)( uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, char *), uint64_t a5, uint64_t *a6)
{
  uint64_t v11 = (void *)type metadata accessor for _HashNode(0LL, a6[2], a6[3], a6[4]);
  return _HashNode.merge(_:_:_:)(0, a1, a2, a4, a5, v11);
}

uint64_t sub_188DF7024( uint64_t a1, void (*a2)(char *, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = a3;
  unint64_t v24 = a2;
  uint64_t v9 = sub_188DF8384();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1895F8858](v9);
  int8x16_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = MEMORY[0x1895F8858](v11);
  uint8x8_t v16 = (char *)&v23 - v15;
  uint64_t v17 = *(void *)(a6 - 8);
  MEMORY[0x1895F8858](v14);
  uint64_t v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v16, a1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1LL, a6) == 1)
  {
    char v20 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v20(a1, v9);
    v20((uint64_t)v16, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(a1, a4, a6);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(a1, 0LL, 1LL, a6);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v16, a6);
    uint64_t v22 = v25;
    v24(v19, a4);
    if (v22)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, a6);
    }

    else
    {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, a6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v13, 0LL, 1LL, a6);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v13, v9);
    }
  }

uint64_t TreeDictionary.merging(_:uniquingKeysWith:)( uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, char *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12 = v11;
  uint64_t v17 = (uint64_t *)type metadata accessor for TreeDictionary(0LL, a9, a10, a11);
  swift_retain();
  TreeDictionary.merge(_:uniquingKeysWith:)(a1, a2, v18, a4, a5, v17);
  uint64_t result = a6;
  if (v12) {
    return swift_release();
  }
  return result;
}

uint64_t TreeDictionary.merging<A>(_:uniquingKeysWith:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return sub_188DF7340( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188DF740C);
}

{
  return sub_188DF7340( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188DF78B0);
}

uint64_t sub_188DF7340( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void (*a12)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13 = v12;
  uint64_t v17 = type metadata accessor for TreeDictionary(0LL, a7, a8, a10);
  swift_retain();
  a12(a1, a2, a3, v17, a9, a11);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a9 - 8) + 8LL))(a1, a9);
  uint64_t result = a4;
  if (v13) {
    return swift_release();
  }
  return result;
}

uint64_t sub_188DF740C( uint64_t a1, void (*a2)(char *, uint64_t), uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v68 = a6;
  unint64_t v62 = a2;
  uint64_t v63 = a3;
  uint64_t v66 = a1;
  uint64_t v9 = a4[2];
  uint64_t v10 = a4[3];
  uint64_t v11 = a4[4];
  uint64_t updated = type metadata accessor for _HashNode.ValueUpdateState(0LL, v9, v10, v11);
  uint64_t v13 = *(void *)(updated - 8);
  uint64_t v60 = updated;
  uint64_t v61 = v13;
  uint64_t v14 = MEMORY[0x1895F8858](updated);
  uint8x8_t v16 = (char *)&v52 - v15;
  uint64_t v71 = *(void *)(v10 - 8);
  uint64_t v17 = MEMORY[0x1895F8858](v14);
  BOOL v70 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v72 = *(void *)(v9 - 8);
  uint64_t v19 = MEMORY[0x1895F8858](v17);
  uint64_t v69 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v19);
  uint64_t v22 = (char *)&v52 - v21;
  uint64_t v53 = v9;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v23 = sub_188DF8384();
  uint64_t v24 = MEMORY[0x1895F8858](v23);
  unint64_t v54 = (char *)&v52 - v25;
  uint64_t v65 = *(char **)(a5 - 8);
  MEMORY[0x1895F8858](v24);
  uint64_t v27 = (char *)&v52 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v55 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint8x8_t v30 = (char *)&v52 - v29;
  uint64_t v31 = (void (*)(char *, uint64_t, uint64_t))*((void *)v65 + 2);
  uint64_t v67 = a5;
  v31(v27, v66, a5);
  sub_188DF7FDC();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v65 = v30;
  uint64_t v66 = AssociatedTypeWitness;
  uint64_t v33 = AssociatedConformanceWitness;
  uint64_t v34 = v54;
  sub_188DF84D4();
  uint64_t v35 = TupleTypeMetadata2;
  uint64_t v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48LL);
  if (v36(v34, 1LL, TupleTypeMetadata2) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v65, v66);
  }
  unint64_t v56 = v36;
  uint64_t v57 = v33;
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v72 + 32);
  uint64_t v58 = v22;
  __int16 v59 = v37;
  uint64_t v38 = v53;
  while (1)
  {
    uint64_t v39 = &v34[*(int *)(v35 + 48)];
    v59(v22, v34, v38);
    uint64_t v40 = (uint64_t)v70;
    (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v70, v39, v10);
    uint64_t v41 = v22;
    uint64_t v42 = v10;
    uint64_t v43 = v69;
    (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v69, v41, v38);
    ++*(void *)(v7 + 16);
    uint64_t v44 = sub_188DF5A9C();
    __int128 v45 = (void *)type metadata accessor for _HashNode(0LL, v38, v42, v11);
    uint64_t v46 = (uint64_t)v43;
    uint64_t v10 = v42;
    _HashNode.prepareValueUpdate(_:_:)(v46, v44, v45, (uint64_t)v16);
    uint64_t v47 = v60;
    uint64_t v48 = v73;
    sub_188DF7024((uint64_t)&v16[*(int *)(v60 + 44)], v62, v63, v40, v38, v10);
    if (v48) {
      break;
    }
    uint64_t v73 = 0LL;
    sub_188D317C0(v7, (uint64_t)v16, v38, v10, v11);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v16, v47);
    char v49 = *(void (**)(char *, uint64_t))(v72 + 8);
    v49(v69, v38);
    uint64_t v22 = v58;
    v49(v58, v38);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v10);
    sub_188DF84D4();
    uint64_t v35 = TupleTypeMetadata2;
    if (v56(v34, 1LL, TupleTypeMetadata2) == 1) {
      return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v65, v66);
    }
  }

  sub_188D317C0(v7, (uint64_t)v16, v38, v10, v11);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v16, v47);
  unint64_t v51 = *(void (**)(char *, uint64_t))(v72 + 8);
  v51(v69, v38);
  v51(v58, v38);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v65, v66);
  return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v70, v10);
}

uint64_t sub_188DF78B0( uint64_t a1, void (*a2)(char *, uint64_t), uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v27 = a3;
  uint64_t v26 = a2;
  uint64_t v9 = sub_188DF860C();
  uint64_t v25 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v9);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = a4[3];
  uint64_t v21 = a4[2];
  uint64_t v22 = a4;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v13 = sub_188DF8780();
  uint64_t v24 = *(void *)(v13 - 8);
  MEMORY[0x1895F8858](v13);
  uint64_t v15 = (char *)&v21 - v14;
  sub_188DF8048();
  uint8x8_t v16 = (void *)swift_allocObject();
  v16[2] = v21;
  v16[3] = v12;
  uint64_t v17 = v22;
  uint64_t v18 = v22[4];
  v16[4] = a5;
  v16[5] = v18;
  v16[6] = a6;
  MEMORY[0x1895D7620](MEMORY[0x189619258], v9);
  sub_188DF8858();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v9);
  uint64_t v19 = MEMORY[0x1895D7620](MEMORY[0x189619618], v13);
  sub_188DF740C((uint64_t)v15, v26, v27, v17, v13, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v15, v13);
}

uint64_t sub_188DF7A8C()
{
  return swift_deallocObject();
}

uint64_t Deque.customMirror.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_188DF8AB0();
  MEMORY[0x1895F8858](v4);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C749ED0);
  MEMORY[0x1895F8858](v7);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v17[0] = a1;
  v17[1] = a1;
  uint64_t v10 = *MEMORY[0x18961A6F8];
  uint64_t v11 = sub_188DF8AA4();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 104))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0LL, 1LL, v11);
  uint64_t v15 = type metadata accessor for Deque(0LL, a2, v13, v14);
  MEMORY[0x1895D7620](&protocol conformance descriptor for Deque<A>, v15);
  sub_188D2B03C((uint64_t)v6);
  swift_retain_n();
  return sub_188DF8ABC();
}

uint64_t sub_188DF7C00(uint64_t a1)
{
  return Deque.customMirror.getter(*v1, *(void *)(a1 + 16));
}

uint64_t sub_188DF7C10()
{
  return MEMORY[0x189617790]();
}

uint64_t sub_188DF7C1C()
{
  return MEMORY[0x189617848]();
}

uint64_t sub_188DF7C28()
{
  return MEMORY[0x1896178E0]();
}

uint64_t sub_188DF7C34()
{
  return MEMORY[0x1896179F0]();
}

uint64_t sub_188DF7C40()
{
  return MEMORY[0x1896179F8]();
}

uint64_t sub_188DF7C4C()
{
  return MEMORY[0x189617A00]();
}

uint64_t sub_188DF7C58()
{
  return MEMORY[0x189617AE8]();
}

uint64_t sub_188DF7C64()
{
  return MEMORY[0x189617AF8]();
}

uint64_t sub_188DF7C70()
{
  return MEMORY[0x189617B00]();
}

uint64_t sub_188DF7C7C()
{
  return MEMORY[0x189617B08]();
}

uint64_t sub_188DF7C88()
{
  return MEMORY[0x189617B10]();
}

uint64_t sub_188DF7C94()
{
  return MEMORY[0x189617B18]();
}

uint64_t sub_188DF7CA0()
{
  return MEMORY[0x189617B28]();
}

uint64_t sub_188DF7CAC()
{
  return MEMORY[0x189617B30]();
}

uint64_t sub_188DF7CB8()
{
  return MEMORY[0x189617B38]();
}

uint64_t sub_188DF7CC4()
{
  return MEMORY[0x189617B40]();
}

uint64_t sub_188DF7CD0()
{
  return MEMORY[0x189617B48]();
}

uint64_t sub_188DF7CDC()
{
  return MEMORY[0x189617B50]();
}

uint64_t sub_188DF7CE8()
{
  return MEMORY[0x189617B58]();
}

uint64_t sub_188DF7CF4()
{
  return MEMORY[0x189617B60]();
}

uint64_t sub_188DF7D00()
{
  return MEMORY[0x189617B68]();
}

uint64_t sub_188DF7D0C()
{
  return MEMORY[0x189617B78]();
}

uint64_t sub_188DF7D18()
{
  return MEMORY[0x189617B80]();
}

uint64_t sub_188DF7D24()
{
  return MEMORY[0x189617B88]();
}

uint64_t sub_188DF7D30()
{
  return MEMORY[0x189617B90]();
}

uint64_t sub_188DF7D3C()
{
  return MEMORY[0x189617BA0]();
}

uint64_t sub_188DF7D48()
{
  return MEMORY[0x189617BA8]();
}

uint64_t sub_188DF7D54()
{
  return MEMORY[0x189617BB0]();
}

uint64_t sub_188DF7D60()
{
  return MEMORY[0x189617BB8]();
}

uint64_t sub_188DF7D6C()
{
  return MEMORY[0x189617BC0]();
}

uint64_t sub_188DF7D78()
{
  return MEMORY[0x189617BC8]();
}

uint64_t sub_188DF7D84()
{
  return MEMORY[0x189617BE0]();
}

uint64_t sub_188DF7D90()
{
  return MEMORY[0x189617C20]();
}

uint64_t sub_188DF7D9C()
{
  return MEMORY[0x189617C28]();
}

uint64_t sub_188DF7DA8()
{
  return MEMORY[0x189617C30]();
}

uint64_t sub_188DF7DB4()
{
  return MEMORY[0x189617C38]();
}

uint64_t sub_188DF7DC0()
{
  return MEMORY[0x189617C40]();
}

uint64_t sub_188DF7DCC()
{
  return MEMORY[0x189617C50]();
}

uint64_t sub_188DF7DD8()
{
  return MEMORY[0x189617C60]();
}

uint64_t sub_188DF7DE4()
{
  return MEMORY[0x189617CE0]();
}

uint64_t sub_188DF7DF0()
{
  return MEMORY[0x189617D08]();
}

uint64_t sub_188DF7DFC()
{
  return MEMORY[0x189617D18]();
}

uint64_t sub_188DF7E08()
{
  return MEMORY[0x189617D20]();
}

uint64_t sub_188DF7E14()
{
  return MEMORY[0x189617D28]();
}

uint64_t sub_188DF7E20()
{
  return MEMORY[0x189617D30]();
}

uint64_t sub_188DF7E2C()
{
  return MEMORY[0x189617D38]();
}

uint64_t sub_188DF7E38()
{
  return MEMORY[0x189617D40]();
}

uint64_t sub_188DF7E44()
{
  return MEMORY[0x189617D68]();
}

uint64_t sub_188DF7E50()
{
  return MEMORY[0x189617D70]();
}

uint64_t sub_188DF7E5C()
{
  return MEMORY[0x189617D80]();
}

uint64_t sub_188DF7E68()
{
  return MEMORY[0x189617DA8]();
}

uint64_t sub_188DF7E74()
{
  return MEMORY[0x189617E20]();
}

uint64_t sub_188DF7E80()
{
  return MEMORY[0x189617E28]();
}

uint64_t sub_188DF7E8C()
{
  return MEMORY[0x189617E30]();
}

uint64_t sub_188DF7E98()
{
  return MEMORY[0x189617E38]();
}

uint64_t sub_188DF7EA4()
{
  return MEMORY[0x189617E48]();
}

uint64_t sub_188DF7EB0()
{
  return MEMORY[0x189617E50]();
}

uint64_t sub_188DF7EBC()
{
  return MEMORY[0x189617E58]();
}

uint64_t sub_188DF7EC8()
{
  return MEMORY[0x189617E60]();
}

uint64_t sub_188DF7ED4()
{
  return MEMORY[0x189617E68]();
}

uint64_t sub_188DF7EE0()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_188DF7EEC()
{
  return MEMORY[0x189617E80]();
}

uint64_t sub_188DF7EF8()
{
  return MEMORY[0x189617EB0]();
}

uint64_t sub_188DF7F04()
{
  return MEMORY[0x189617EB8]();
}

uint64_t sub_188DF7F10()
{
  return MEMORY[0x189617EC8]();
}

uint64_t sub_188DF7F1C()
{
  return MEMORY[0x189617ED0]();
}

uint64_t sub_188DF7F28()
{
  return MEMORY[0x189617ED8]();
}

uint64_t sub_188DF7F34()
{
  return MEMORY[0x189617EE0]();
}

uint64_t sub_188DF7F40()
{
  return MEMORY[0x189617F08]();
}

uint64_t sub_188DF7F4C()
{
  return MEMORY[0x189617F18]();
}

uint64_t sub_188DF7F58()
{
  return MEMORY[0x189617F30]();
}

uint64_t sub_188DF7F64()
{
  return MEMORY[0x189617F40]();
}

uint64_t sub_188DF7F70()
{
  return MEMORY[0x189617F48]();
}

uint64_t sub_188DF7F7C()
{
  return MEMORY[0x189617F58]();
}

uint64_t sub_188DF7F88()
{
  return MEMORY[0x189617F90]();
}

uint64_t sub_188DF7F94()
{
  return MEMORY[0x189617F98]();
}

uint64_t sub_188DF7FA0()
{
  return MEMORY[0x189617FF8]();
}

uint64_t sub_188DF7FAC()
{
  return MEMORY[0x189618058]();
}

uint64_t sub_188DF7FB8()
{
  return MEMORY[0x189618068]();
}

uint64_t sub_188DF7FC4()
{
  return MEMORY[0x189618070]();
}

uint64_t sub_188DF7FD0()
{
  return MEMORY[0x189618078]();
}

uint64_t sub_188DF7FDC()
{
  return MEMORY[0x189618080]();
}

uint64_t sub_188DF7FE8()
{
  return MEMORY[0x189618088]();
}

uint64_t sub_188DF7FF4()
{
  return MEMORY[0x189618090]();
}

uint64_t sub_188DF8000()
{
  return MEMORY[0x1896180A0]();
}

uint64_t sub_188DF800C()
{
  return MEMORY[0x1896180A8]();
}

uint64_t sub_188DF8018()
{
  return MEMORY[0x1896180C8]();
}

uint64_t sub_188DF8024()
{
  return MEMORY[0x1896180E0]();
}

uint64_t sub_188DF8030()
{
  return MEMORY[0x1896180E8]();
}

uint64_t sub_188DF803C()
{
  return MEMORY[0x1896180F8]();
}

uint64_t sub_188DF8048()
{
  return MEMORY[0x189618118]();
}

uint64_t sub_188DF8054()
{
  return MEMORY[0x189618140]();
}

uint64_t sub_188DF8060()
{
  return MEMORY[0x189618150]();
}

uint64_t sub_188DF806C()
{
  return MEMORY[0x189618160]();
}

uint64_t sub_188DF8078()
{
  return MEMORY[0x189618188]();
}

uint64_t sub_188DF8084()
{
  return MEMORY[0x189618198]();
}

uint64_t sub_188DF8090()
{
  return MEMORY[0x189618208]();
}

uint64_t sub_188DF809C()
{
  return MEMORY[0x189618338]();
}

uint64_t sub_188DF80A8()
{
  return MEMORY[0x189618348]();
}

uint64_t sub_188DF80B4()
{
  return MEMORY[0x189618370]();
}

uint64_t sub_188DF80C0()
{
  return MEMORY[0x189618378]();
}

uint64_t sub_188DF80CC()
{
  return MEMORY[0x189618388]();
}

uint64_t sub_188DF80D8()
{
  return MEMORY[0x189618390]();
}

uint64_t sub_188DF80E4()
{
  return MEMORY[0x189618398]();
}

uint64_t sub_188DF80F0()
{
  return MEMORY[0x1896183A0]();
}

uint64_t sub_188DF80FC()
{
  return MEMORY[0x1896183D8]();
}

uint64_t sub_188DF8108()
{
  return MEMORY[0x1896183E8]();
}

uint64_t sub_188DF8114()
{
  return MEMORY[0x1896183F0]();
}

uint64_t sub_188DF8120()
{
  return MEMORY[0x189618410]();
}

uint64_t sub_188DF812C()
{
  return MEMORY[0x189618438]();
}

uint64_t sub_188DF8138()
{
  return MEMORY[0x1896184A0]();
}

uint64_t sub_188DF8144()
{
  return MEMORY[0x1896184A8]();
}

uint64_t sub_188DF8150()
{
  return MEMORY[0x189618530]();
}

uint64_t sub_188DF815C()
{
  return MEMORY[0x189618688]();
}

uint64_t sub_188DF8168()
{
  return MEMORY[0x1896186A0]();
}

uint64_t sub_188DF8174()
{
  return MEMORY[0x1896186A8]();
}

uint64_t sub_188DF8180()
{
  return MEMORY[0x1896186C0]();
}

uint64_t sub_188DF818C()
{
  return MEMORY[0x1896186C8]();
}

uint64_t sub_188DF8198()
{
  return MEMORY[0x1896186D0]();
}

uint64_t sub_188DF81A4()
{
  return MEMORY[0x1896187E8]();
}

uint64_t sub_188DF81B0()
{
  return MEMORY[0x1896187F0]();
}

uint64_t sub_188DF81BC()
{
  return MEMORY[0x189618818]();
}

uint64_t sub_188DF81C8()
{
  return MEMORY[0x189618828]();
}

uint64_t sub_188DF81D4()
{
  return MEMORY[0x189618838]();
}

uint64_t sub_188DF81E0()
{
  return MEMORY[0x189618848]();
}

uint64_t sub_188DF81EC()
{
  return MEMORY[0x189618850]();
}

uint64_t sub_188DF81F8()
{
  return MEMORY[0x189618860]();
}

uint64_t sub_188DF8204()
{
  return MEMORY[0x189618870]();
}

uint64_t sub_188DF8210()
{
  return MEMORY[0x189618878]();
}

uint64_t sub_188DF821C()
{
  return MEMORY[0x189618888]();
}

uint64_t sub_188DF8228()
{
  return MEMORY[0x189618890]();
}

uint64_t sub_188DF8234()
{
  return MEMORY[0x1896188B0]();
}

uint64_t sub_188DF8240()
{
  return MEMORY[0x1896188B8]();
}

uint64_t sub_188DF824C()
{
  return MEMORY[0x1896188C0]();
}

uint64_t sub_188DF8258()
{
  return MEMORY[0x1896188C8]();
}

uint64_t sub_188DF8264()
{
  return MEMORY[0x1896188D0]();
}

uint64_t sub_188DF8270()
{
  return MEMORY[0x1896188E8]();
}

uint64_t sub_188DF827C()
{
  return MEMORY[0x1896188F8]();
}

uint64_t sub_188DF8288()
{
  return MEMORY[0x189618910]();
}

uint64_t sub_188DF8294()
{
  return MEMORY[0x189618918]();
}

uint64_t sub_188DF82A0()
{
  return MEMORY[0x189618928]();
}

uint64_t sub_188DF82AC()
{
  return MEMORY[0x189618930]();
}

uint64_t sub_188DF82B8()
{
  return MEMORY[0x189618940]();
}

uint64_t sub_188DF82C4()
{
  return MEMORY[0x189618950]();
}

uint64_t sub_188DF82D0()
{
  return MEMORY[0x189618970]();
}

uint64_t sub_188DF82DC()
{
  return MEMORY[0x189618980]();
}

uint64_t sub_188DF82E8()
{
  return MEMORY[0x189618988]();
}

uint64_t sub_188DF82F4()
{
  return MEMORY[0x1896189C0]();
}

uint64_t sub_188DF8300()
{
  return MEMORY[0x1896189D0]();
}

uint64_t sub_188DF830C()
{
  return MEMORY[0x1896189D8]();
}

uint64_t sub_188DF8318()
{
  return MEMORY[0x1896189E0]();
}

uint64_t sub_188DF8324()
{
  return MEMORY[0x1896189E8]();
}

uint64_t sub_188DF8330()
{
  return MEMORY[0x1896189F0]();
}

uint64_t sub_188DF833C()
{
  return MEMORY[0x189618A18]();
}

uint64_t sub_188DF8348()
{
  return MEMORY[0x189618A70]();
}

uint64_t sub_188DF8354()
{
  return MEMORY[0x189618A78]();
}

uint64_t sub_188DF8360()
{
  return MEMORY[0x189618A80]();
}

uint64_t sub_188DF836C()
{
  return MEMORY[0x189618A88]();
}

uint64_t sub_188DF8378()
{
  return MEMORY[0x189618A90]();
}

uint64_t sub_188DF8384()
{
  return MEMORY[0x189618AC0]();
}

uint64_t sub_188DF8390()
{
  return MEMORY[0x189618AD0]();
}

uint64_t sub_188DF839C()
{
  return MEMORY[0x189618AD8]();
}

uint64_t sub_188DF83A8()
{
  return MEMORY[0x189618AE0]();
}

uint64_t sub_188DF83B4()
{
  return MEMORY[0x189618AE8]();
}

uint64_t sub_188DF83C0()
{
  return MEMORY[0x189618AF0]();
}

uint64_t sub_188DF83CC()
{
  return MEMORY[0x189618AF8]();
}

uint64_t sub_188DF83D8()
{
  return MEMORY[0x189618B00]();
}

uint64_t sub_188DF83E4()
{
  return MEMORY[0x189618B08]();
}

uint64_t sub_188DF83F0()
{
  return MEMORY[0x189618B10]();
}

uint64_t sub_188DF83FC()
{
  return MEMORY[0x189618B20]();
}

uint64_t sub_188DF8408()
{
  return MEMORY[0x189618B50]();
}

uint64_t sub_188DF8414()
{
  return MEMORY[0x189618B68]();
}

uint64_t sub_188DF8420()
{
  return MEMORY[0x189618B78]();
}

uint64_t sub_188DF842C()
{
  return MEMORY[0x189618B88]();
}

uint64_t sub_188DF8438()
{
  return MEMORY[0x189618BC0]();
}

uint64_t sub_188DF8444()
{
  return MEMORY[0x189618BD0]();
}

uint64_t sub_188DF8450()
{
  return MEMORY[0x189618BD8]();
}

uint64_t sub_188DF845C()
{
  return MEMORY[0x189618BE0]();
}

uint64_t sub_188DF8468()
{
  return MEMORY[0x189618BE8]();
}

uint64_t sub_188DF8474()
{
  return MEMORY[0x189618BF0]();
}

uint64_t sub_188DF8480()
{
  return MEMORY[0x189618C10]();
}

uint64_t sub_188DF848C()
{
  return MEMORY[0x189618C18]();
}

uint64_t sub_188DF8498()
{
  return MEMORY[0x189618C40]();
}

uint64_t sub_188DF84A4()
{
  return MEMORY[0x189618C88]();
}

uint64_t sub_188DF84B0()
{
  return MEMORY[0x189618C90]();
}

uint64_t sub_188DF84BC()
{
  return MEMORY[0x189618CA0]();
}

uint64_t sub_188DF84C8()
{
  return MEMORY[0x189618CA8]();
}

uint64_t sub_188DF84D4()
{
  return MEMORY[0x189618CB0]();
}

uint64_t sub_188DF84E0()
{
  return MEMORY[0x189618E20]();
}

uint64_t sub_188DF84EC()
{
  return MEMORY[0x189618E28]();
}

uint64_t sub_188DF84F8()
{
  return MEMORY[0x189618E70]();
}

uint64_t sub_188DF8504()
{
  return MEMORY[0x189618E78]();
}

uint64_t sub_188DF8510()
{
  return MEMORY[0x189618E80]();
}

uint64_t sub_188DF851C()
{
  return MEMORY[0x189618E90]();
}

uint64_t sub_188DF8528()
{
  return MEMORY[0x189618EA0]();
}

uint64_t sub_188DF8534()
{
  return MEMORY[0x189618EA8]();
}

uint64_t sub_188DF8540()
{
  return MEMORY[0x189618EB8]();
}

uint64_t sub_188DF854C()
{
  return MEMORY[0x189618F38]();
}

uint64_t sub_188DF8558()
{
  return MEMORY[0x189618F40]();
}

uint64_t sub_188DF8564()
{
  return MEMORY[0x189618F58]();
}

uint64_t sub_188DF8570()
{
  return MEMORY[0x189618F60]();
}

uint64_t sub_188DF857C()
{
  return MEMORY[0x189618F68]();
}

uint64_t sub_188DF8588()
{
  return MEMORY[0x189618F70]();
}

uint64_t sub_188DF8594()
{
  return MEMORY[0x189618F78]();
}

uint64_t sub_188DF85A0()
{
  return MEMORY[0x189618FB0]();
}

uint64_t sub_188DF85AC()
{
  return MEMORY[0x189619008]();
}

uint64_t sub_188DF85B8()
{
  return MEMORY[0x189619058]();
}

uint64_t sub_188DF85C4()
{
  return MEMORY[0x189619098]();
}

uint64_t sub_188DF85D0()
{
  return MEMORY[0x1896190B8]();
}

uint64_t sub_188DF85DC()
{
  return MEMORY[0x1896191B8]();
}

uint64_t sub_188DF85E8()
{
  return MEMORY[0x1896191D0]();
}

uint64_t sub_188DF85F4()
{
  return MEMORY[0x1896191E0]();
}

uint64_t sub_188DF8600()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_188DF860C()
{
  return MEMORY[0x189619240]();
}

uint64_t sub_188DF8618()
{
  return MEMORY[0x1896192D8]();
}

uint64_t sub_188DF8624()
{
  return MEMORY[0x1896192F8]();
}

uint64_t sub_188DF8630()
{
  return MEMORY[0x189619348]();
}

uint64_t sub_188DF863C()
{
  return MEMORY[0x189619378]();
}

uint64_t sub_188DF8648()
{
  return MEMORY[0x189619390]();
}

uint64_t sub_188DF8654()
{
  return MEMORY[0x1896193A0]();
}

uint64_t sub_188DF8660()
{
  return MEMORY[0x1896193E8]();
}

uint64_t sub_188DF866C()
{
  return MEMORY[0x1896193F0]();
}

uint64_t sub_188DF8678()
{
  return MEMORY[0x189619410]();
}

uint64_t sub_188DF8684()
{
  return MEMORY[0x189619440]();
}

uint64_t sub_188DF8690()
{
  return MEMORY[0x189619448]();
}

uint64_t sub_188DF869C()
{
  return MEMORY[0x1896194A8]();
}

uint64_t sub_188DF86A8()
{
  return MEMORY[0x1896194B0]();
}

uint64_t sub_188DF86B4()
{
  return MEMORY[0x1896194B8]();
}

uint64_t sub_188DF86C0()
{
  return MEMORY[0x1896194C8]();
}

uint64_t sub_188DF86CC()
{
  return MEMORY[0x1896194D0]();
}

uint64_t sub_188DF86D8()
{
  return MEMORY[0x1896194E8]();
}

uint64_t sub_188DF86E4()
{
  return MEMORY[0x1896194F0]();
}

uint64_t _s19CollectionsInternal4HeapV5countSivg_0()
{
  return MEMORY[0x189619508]();
}

uint64_t sub_188DF86FC()
{
  return MEMORY[0x189619510]();
}

uint64_t sub_188DF8708()
{
  return MEMORY[0x189619518]();
}

uint64_t sub_188DF8714()
{
  return MEMORY[0x189619520]();
}

uint64_t sub_188DF8720()
{
  return MEMORY[0x189619528]();
}

uint64_t sub_188DF872C()
{
  return MEMORY[0x189619530]();
}

uint64_t sub_188DF8738()
{
  return MEMORY[0x189619538]();
}

uint64_t sub_188DF8744()
{
  return MEMORY[0x189619548]();
}

uint64_t sub_188DF8750()
{
  return MEMORY[0x189619550]();
}

uint64_t sub_188DF875C()
{
  return MEMORY[0x189619558]();
}

uint64_t sub_188DF8768()
{
  return MEMORY[0x1896195A0]();
}

uint64_t sub_188DF8774()
{
  return MEMORY[0x1896195A8]();
}

uint64_t sub_188DF8780()
{
  return MEMORY[0x189619600]();
}

uint64_t sub_188DF878C()
{
  return MEMORY[0x189619660]();
}

uint64_t sub_188DF8798()
{
  return MEMORY[0x189619680]();
}

uint64_t sub_188DF87A4()
{
  return MEMORY[0x189619698]();
}

uint64_t sub_188DF87B0()
{
  return MEMORY[0x1896196C0]();
}

uint64_t sub_188DF87BC()
{
  return MEMORY[0x1896196C8]();
}

uint64_t sub_188DF87C8()
{
  return MEMORY[0x1896196D0]();
}

uint64_t sub_188DF87D4()
{
  return MEMORY[0x189619740]();
}

uint64_t sub_188DF87E0()
{
  return MEMORY[0x189619758]();
}

uint64_t sub_188DF87EC()
{
  return MEMORY[0x189619760]();
}

uint64_t sub_188DF87F8()
{
  return MEMORY[0x189619788]();
}

uint64_t sub_188DF8804()
{
  return MEMORY[0x189619790]();
}

uint64_t sub_188DF8810()
{
  return MEMORY[0x1896197C0]();
}

uint64_t sub_188DF881C()
{
  return MEMORY[0x1896198A8]();
}

uint64_t sub_188DF8828()
{
  return MEMORY[0x1896198D8]();
}

uint64_t sub_188DF8834()
{
  return MEMORY[0x1896199B0]();
}

uint64_t sub_188DF8840()
{
  return MEMORY[0x1896199C0]();
}

uint64_t sub_188DF884C()
{
  return MEMORY[0x1896199D0]();
}

uint64_t sub_188DF8858()
{
  return MEMORY[0x1896199E0]();
}

uint64_t sub_188DF8864()
{
  return MEMORY[0x1896199E8]();
}

uint64_t sub_188DF8870()
{
  return MEMORY[0x1896199F0]();
}

uint64_t sub_188DF887C()
{
  return MEMORY[0x1896199F8]();
}

uint64_t sub_188DF8888()
{
  return MEMORY[0x189619A50]();
}

uint64_t sub_188DF8894()
{
  return MEMORY[0x189619A58]();
}

uint64_t sub_188DF88A0()
{
  return MEMORY[0x189619B28]();
}

uint64_t sub_188DF88AC()
{
  return MEMORY[0x189619B58]();
}

uint64_t sub_188DF88B8()
{
  return MEMORY[0x189619C20]();
}

uint64_t sub_188DF88C4()
{
  return MEMORY[0x189619CB8]();
}

uint64_t sub_188DF88D0()
{
  return MEMORY[0x189619CC8]();
}

uint64_t sub_188DF88DC()
{
  return MEMORY[0x189619D18]();
}

uint64_t sub_188DF88E8()
{
  return MEMORY[0x189619D20]();
}

uint64_t sub_188DF88F4()
{
  return MEMORY[0x189619D38]();
}

uint64_t sub_188DF8900()
{
  return MEMORY[0x189619D58]();
}

uint64_t sub_188DF890C()
{
  return MEMORY[0x189619D78]();
}

uint64_t sub_188DF8918()
{
  return MEMORY[0x189619D80]();
}

uint64_t sub_188DF8924()
{
  return MEMORY[0x189619E48]();
}

uint64_t sub_188DF8930()
{
  return MEMORY[0x189619E78]();
}

uint64_t sub_188DF893C()
{
  return MEMORY[0x189619E90]();
}

uint64_t sub_188DF8948()
{
  return MEMORY[0x189619FC0]();
}

uint64_t sub_188DF8954()
{
  return MEMORY[0x189619FC8]();
}

uint64_t sub_188DF8960()
{
  return MEMORY[0x18961A008]();
}

uint64_t sub_188DF896C()
{
  return MEMORY[0x18961A010]();
}

uint64_t sub_188DF8978()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_188DF8984()
{
  return MEMORY[0x18961A068]();
}

uint64_t sub_188DF8990()
{
  return MEMORY[0x18961A0A0]();
}

uint64_t sub_188DF899C()
{
  return MEMORY[0x18961A0F0]();
}

uint64_t sub_188DF89A8()
{
  return MEMORY[0x18961A2C0]();
}

uint64_t sub_188DF89B4()
{
  return MEMORY[0x18961A2D0]();
}

uint64_t sub_188DF89C0()
{
  return MEMORY[0x18961A2E8]();
}

uint64_t sub_188DF89CC()
{
  return MEMORY[0x18961A310]();
}

uint64_t sub_188DF89D8()
{
  return MEMORY[0x18961A320]();
}

uint64_t sub_188DF89E4()
{
  return MEMORY[0x18961A390]();
}

uint64_t sub_188DF89F0()
{
  return MEMORY[0x18961A590]();
}

uint64_t sub_188DF89FC()
{
  return MEMORY[0x18961A598]();
}

uint64_t sub_188DF8A08()
{
  return MEMORY[0x18961A5A0]();
}

uint64_t sub_188DF8A14()
{
  return MEMORY[0x18961A5B0]();
}

uint64_t sub_188DF8A20()
{
  return MEMORY[0x18961A660]();
}

uint64_t sub_188DF8A2C()
{
  return MEMORY[0x18961A668]();
}

uint64_t sub_188DF8A38()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_188DF8A44()
{
  return MEMORY[0x18961A688]();
}

uint64_t sub_188DF8A50()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_188DF8A5C()
{
  return MEMORY[0x18961A698]();
}

uint64_t sub_188DF8A68()
{
  return MEMORY[0x18961A6A0]();
}

uint64_t sub_188DF8A74()
{
  return MEMORY[0x18961A6A8]();
}

uint64_t sub_188DF8A80()
{
  return MEMORY[0x18961A6B0]();
}

uint64_t sub_188DF8A8C()
{
  return MEMORY[0x18961A6B8]();
}

uint64_t sub_188DF8A98()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t sub_188DF8AA4()
{
  return MEMORY[0x18961A728]();
}

uint64_t sub_188DF8AB0()
{
  return MEMORY[0x18961A750]();
}

uint64_t sub_188DF8ABC()
{
  return MEMORY[0x18961A770]();
}

uint64_t sub_188DF8AC8()
{
  return MEMORY[0x18961A930]();
}

uint64_t sub_188DF8AD4()
{
  return MEMORY[0x18961A938]();
}

uint64_t sub_188DF8AE0()
{
  return MEMORY[0x18961A940]();
}

uint64_t sub_188DF8AEC()
{
  return MEMORY[0x18961A950]();
}

uint64_t sub_188DF8AF8()
{
  return MEMORY[0x18961A960]();
}

uint64_t sub_188DF8B04()
{
  return MEMORY[0x18961A968]();
}

uint64_t sub_188DF8B10()
{
  return MEMORY[0x18961A978]();
}

uint64_t sub_188DF8B1C()
{
  return MEMORY[0x18961AB18]();
}

uint64_t sub_188DF8B28()
{
  return MEMORY[0x18961AB20]();
}

uint64_t sub_188DF8B34()
{
  return MEMORY[0x18961AB28]();
}

uint64_t sub_188DF8B40()
{
  return MEMORY[0x18961AB30]();
}

uint64_t sub_188DF8B4C()
{
  return MEMORY[0x18961AB38]();
}

uint64_t sub_188DF8B58()
{
  return MEMORY[0x18961AE18]();
}

uint64_t sub_188DF8B64()
{
  return MEMORY[0x18961AF48]();
}

uint64_t sub_188DF8B70()
{
  return MEMORY[0x18961AF58]();
}

uint64_t sub_188DF8B7C()
{
  return MEMORY[0x18961AF60]();
}

uint64_t sub_188DF8B88()
{
  return MEMORY[0x18961AF68]();
}

uint64_t sub_188DF8B94()
{
  return MEMORY[0x18961AF88]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x18961B018]();
}

void bzero(void *a1, size_t a2)
{
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x18961B0C0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x18961B0D8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x18961B0E0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x18961B0F8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x18961B110]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x18961B120]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x18961B128]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x18961B140]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x18961B1D8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x18961B218]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x18961B220]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x18961B250]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x18961B258]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x18961B2D0]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x18961B2D8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x18961B2E0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x18961B2F0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x18961B2F8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x18961B300]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x18961B338]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x18961B358]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x18961B378]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x18961B380]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x18961B3A8]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x18961B420]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x18961B428]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x18961B430]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x18961B438]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x18961B460]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x18961B470]();
}
uint64_t sub_189453374()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  v1 = v0[5];
  v2 = v0[6];
  v3 = v0[7];
  v4 = v0[8];
  v5 = v0[10];
  v16 = v0[9];
  v6 = v0[11];
  sub_189473A58();
  sub_189473A58();
  sub_189473A58();
  sub_189473A64();
  v7 = v3 >> 1;
  result = (v3 >> 1) - v2;
  if (__OFSUB__(v3 >> 1, v2))
  {
    __break(1u);
    goto LABEL_16;
  }

  result = sub_189473A58();
  v9 = __OFSUB__(v7, v2);
  v10 = v7 - v2;
  if (v10)
  {
    if ((v10 < 0) ^ v9 | (v10 == 0))
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }

    v11 = v1 + v2;
    do
    {
      ++v11;
      sub_189473A64();
      --v10;
    }

    while (v10);
  }

  if (!v4) {
    return sub_189473A64();
  }
  sub_189473A64();
  v12 = v6 >> 1;
  result = (v6 >> 1) - v5;
  if (__OFSUB__(v6 >> 1, v5))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  result = sub_189473A58();
  v13 = __OFSUB__(v12, v5);
  v14 = v12 - v5;
  if (!v14) {
    return result;
  }
  if ((v14 < 0) ^ v13 | (v14 == 0))
  {
LABEL_18:
    __break(1u);
    return result;
  }

  v15 = v16 + v5;
  do
  {
    ++v15;
    result = sub_189473A64();
    --v14;
  }

  while (v14);
  return result;
}

uint64_t sub_189453488()
{
  return sub_189473A7C();
}

uint64_t sub_189453500()
{
  return sub_189473A7C();
}

uint64_t sub_189453574()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[10];
  unint64_t v3 = v0[11];
  sub_18947395C();
  sub_189473794();
  ASN1Identifier.description.getter();
  sub_189473794();
  swift_bridgeObjectRelease();
  sub_189473794();
  sub_1894739EC();
  sub_189473794();
  swift_bridgeObjectRelease();
  sub_189473794();
  if (v1 && __OFSUB__(v3 >> 1, v2)) {
    __break(1u);
  }
  sub_1894739EC();
  sub_189473794();
  swift_bridgeObjectRelease();
  sub_189473794();
  return 0LL;
}

uint64_t static DER.sequence<A>(_:identifier:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(void *)@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  BOOL v7 = *(void *)a1 == *(void *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
  if (v7 && (*(_BYTE *)(a1 + 56) & 1) == 0)
  {
    uint64_t v13 = *(void *)(a1 + 16);
    uint64_t v12 = *(void *)(a1 + 24);
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    v22[0] = v13;
    v22[1] = v12;
    v22[2] = v15;
    v22[3] = v14;
    v22[4] = v16;
    swift_unknownObjectRetain_n();
    a3(v22);
    if (v5
      || (ASN1NodeCollection.Iterator.next()((uint64_t)v19),
          uint64_t v17 = v21,
          sub_18945AD8C(v19[0], v19[1], v19[2], v19[3], v19[4], v19[5], v19[6], v20, v21),
          !v17))
    {
      swift_unknownObjectRelease();
      return j__swift_unknownObjectRelease(v13, v12, v15, v14, v16, 0LL);
    }

    else
    {
      sub_18945AD44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD000000000000019LL,  0x8000000189475AB0LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  92LL,  v18);
      swift_willThrow();
      j__swift_unknownObjectRelease(v13, v12, v15, v14, v16, 0LL);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8LL))(a5, a4);
      return swift_unknownObjectRelease();
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20LL, 2, 84LL, v8);
    return swift_willThrow();
  }
}

uint64_t ASN1NodeCollection.makeIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  __int128 v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = v2;
  return swift_unknownObjectRetain();
}

void ASN1NodeCollection.Iterator.next()(uint64_t a1@<X8>)
{
  int64_t v3 = v1[2];
  unint64_t v4 = v1[3];
  if (v3 == v4 >> 1)
  {
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    return;
  }

  if (v3 >= (uint64_t)(v4 >> 1))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  uint64_t v5 = *v1;
  uint64_t v6 = v1[1];
  BOOL v7 = (__int128 *)(v6 + 96 * v3);
  __int128 v8 = v7[1];
  __int128 v37 = *v7;
  __int128 v38 = v8;
  __int128 v9 = v7[2];
  __int128 v10 = v7[3];
  __int128 v11 = v7[5];
  v41[0] = v7[4];
  v41[1] = v11;
  __int128 v39 = v9;
  __int128 v40 = v10;
  uint64_t v12 = v3 + 1;
  v1[2] = v3 + 1;
  if ((BYTE8(v38) & 1) != 0)
  {
    sub_18945C538(v5, v6, v12, v4, (uint64_t)&v37);
    uint64_t v21 = v20;
    if (!__OFSUB__(v19 >> 1, v18))
    {
      uint64_t v22 = v17;
      uint64_t v23 = v18;
      unint64_t v24 = v19;
      *uint64_t v1 = sub_189456D1C((v19 >> 1) - v18, v5, v6, v12, v4);
      v1[1] = v25;
      v1[2] = v26;
      v1[3] = v27;
      uint64_t v28 = v37;
      uint64_t v29 = BYTE8(v37);
      sub_1894570DC(v21, v22, v23, v24, v38, &v34);
      uint64_t v30 = v36;
      __int128 v32 = v34;
      __int128 v31 = v35;
      *(void *)a1 = v28;
      *(void *)(a1 + 8) = v29;
      *(_OWORD *)(a1 + 16) = v32;
      *(_OWORD *)(a1 + 32) = v31;
      *(void *)(a1 + 48) = v30;
      *(void *)(a1 + 56) = 0LL;
      __int128 v33 = v40;
      *(_OWORD *)(a1 + 64) = v39;
      *(_OWORD *)(a1 + 80) = v33;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      return;
    }

    goto LABEL_11;
  }

  sub_18945ADDC((uint64_t)v41, (uint64_t)v42);
  sub_18945ADDC((uint64_t)v42, (uint64_t)&v34);
  uint64_t v13 = v34;
  if (!(void)v34)
  {
LABEL_12:
    __break(1u);
    return;
  }

  uint64_t v14 = *((void *)&v34 + 1);
  uint64_t v15 = BYTE8(v37);
  *(void *)a1 = v37;
  *(void *)(a1 + 8) = v15;
  *(void *)(a1 + 16) = v13;
  *(void *)(a1 + 24) = v14;
  *(_OWORD *)(a1 + 32) = v35;
  *(_OWORD *)(a1 + 48) = xmmword_189473C60;
  __int128 v16 = v40;
  *(_OWORD *)(a1 + 64) = v39;
  *(_OWORD *)(a1 + 80) = v16;
  sub_18945AE64((uint64_t)v42);
  swift_unknownObjectRetain();
}

uint64_t static DER.sequence<A>(of:identifier:rootNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v5 = *(void *)a3 == *(void *)a2 && *(unsigned __int8 *)(a3 + 8) == *(unsigned __int8 *)(a2 + 8);
  if (v5 && (*(_BYTE *)(a3 + 56) & 1) == 0)
  {
    uint64_t v20 = &v18;
    uint64_t v9 = *(void *)(a3 + 16);
    uint64_t v19 = *(void *)(a3 + 24);
    uint64_t v10 = *(void *)(a3 + 32);
    uint64_t v11 = *(void *)(a3 + 40);
    uint64_t v12 = *(void *)(a3 + 48);
    uint64_t v21 = v9;
    uint64_t v22 = v19;
    uint64_t v23 = v10;
    uint64_t v24 = v11;
    uint64_t v25 = v12;
    MEMORY[0x1895F8858](a1);
    v17[2] = v13;
    v17[3] = v14;
    swift_unknownObjectRetain();
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C505898);
    unint64_t v16 = sub_18945B550();
    uint64_t v4 = sub_189453C88( (void (*)(char *, char *))sub_18945ED70,  (uint64_t)v17,  (uint64_t)&type metadata for ASN1NodeCollection,  a4,  v15,  v16,  MEMORY[0x18961A3E8],  (uint64_t)&v26);
    j__swift_unknownObjectRelease(v9, v19, v10, v11, v12, 0LL);
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20LL, 2, 109LL, v6);
    swift_willThrow();
  }

  return v4;
}

uint64_t sub_189453C88( void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v40 = a8;
  uint64_t v41 = a5;
  uint64_t v9 = v8;
  uint64_t v53 = a4;
  v54 = a1;
  uint64_t v55 = a2;
  uint64_t v39 = *(void *)(a5 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  v52 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v10);
  v51 = (char *)v37 - v12;
  uint64_t v45 = v13;
  uint64_t v15 = v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  __int128 v38 = (char *)v37 - v18;
  uint64_t v19 = sub_1894738A8();
  uint64_t v42 = *(void *)(v19 - 8);
  uint64_t v43 = v19;
  uint64_t v20 = MEMORY[0x1895F8858](v19);
  v49 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = MEMORY[0x1895F8858](v20);
  uint64_t v24 = (char *)v37 - v23;
  uint64_t v25 = MEMORY[0x1895F8858](v22);
  v37[1] = (char *)v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = MEMORY[0x1895F8858](v25);
  uint64_t v48 = *((void *)v15 - 1);
  MEMORY[0x1895F8858](v27);
  v47 = (char *)v37 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v56 = swift_getAssociatedTypeWitness();
  uint64_t v44 = *(void *)(v56 - 8);
  MEMORY[0x1895F8858](v56);
  v46 = (char *)v37 - v29;
  uint64_t v30 = v15;
  uint64_t v31 = sub_1894737B8();
  uint64_t v57 = sub_189473998();
  uint64_t v53 = sub_1894739A4();
  sub_189473980();
  (*(void (**)(char *, void, void *))(v48 + 16))(v47, v50, v15);
  __int128 v32 = v46;
  v50 = v30;
  uint64_t result = sub_1894737AC();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }

  if (v31)
  {
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_1894738B4();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v24, 1LL, AssociatedTypeWitness);
      if ((_DWORD)result == 1) {
        goto LABEL_18;
      }
      v54(v24, v52);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v52, v41);
        return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      }

      uint64_t v9 = 0LL;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      sub_18947398C();
      if (!--v31)
      {
        __int128 v34 = v49;
        goto LABEL_9;
      }
    }
  }

  swift_getAssociatedConformanceWitness();
  __int128 v34 = v49;
LABEL_9:
  sub_1894738B4();
  v52 = *(char **)(v17 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v34, 1LL, AssociatedTypeWitness) == 1)
  {
    __int128 v35 = v49;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v43);
    return v57;
  }

  else
  {
    v50 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    uint64_t v36 = v38;
    __int128 v35 = v49;
    while (1)
    {
      v50(v36, v35, AssociatedTypeWitness);
      v54(v36, v51);
      if (v9) {
        break;
      }
      uint64_t v9 = 0LL;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
      sub_18947398C();
      sub_1894738B4();
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v51, v41);
  }

uint64_t static DER.sequence<A>(of:identifier:nodes:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_189454280( a1,  a2,  a3,  a4,  a5,  (uint64_t (*)(void))static DER.sequence<A>(of:identifier:rootNode:),  0xD00000000000002FLL,  0x8000000189475AD0LL,  127LL);
}

uint64_t static DER.set<A>(_:identifier:_:)@<X0>( uint64_t *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void *)@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  char v5 = *((_BYTE *)a1 + 8);
  uint64_t v6 = a1[6];
  char v7 = *((_BYTE *)a1 + 56);
  uint64_t v8 = *a2;
  char v9 = *((_BYTE *)a2 + 8);
  uint64_t v15 = *a1;
  char v16 = v5;
  __int128 v10 = *((_OWORD *)a1 + 2);
  __int128 v17 = *((_OWORD *)a1 + 1);
  __int128 v18 = v10;
  uint64_t v19 = v6;
  char v20 = v7;
  __int128 v11 = *((_OWORD *)a1 + 5);
  __int128 v21 = *((_OWORD *)a1 + 4);
  __int128 v22 = v11;
  uint64_t v13 = v8;
  char v14 = v9;
  return static DER.sequence<A>(_:identifier:_:)((uint64_t)&v15, (uint64_t)&v13, a3, a4, a5);
}

uint64_t static DER.set<A>(of:identifier:nodes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_189454280( a1,  a2,  a3,  a4,  a5,  (uint64_t (*)(void))static DER.set<A>(of:identifier:rootNode:),  0xD000000000000029LL,  0x8000000189475B00LL,  158LL);
}

uint64_t sub_189454280( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void), uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v28 = a4;
  ASN1NodeCollection.Iterator.next()((uint64_t)v25);
  uint64_t v12 = v27;
  if (v27)
  {
    uint64_t v23 = v25[5];
    uint64_t v24 = v25[6];
    uint64_t v22 = v25[4];
    char v20 = v26;
    uint64_t v21 = v25[3];
    uint64_t v13 = a6;
    uint64_t v15 = v25[1];
    uint64_t v14 = v25[2];
    uint64_t v16 = v25[0];
    LOBYTE(v26) = v26 & 1;
    uint64_t v17 = v13();
    sub_18945AD8C(v16, v15, v14, v21, v22, v23, v24, v20, v12);
  }

  else
  {
    uint64_t v17 = a9;
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(a7, a8, (uint64_t)"SwiftASN1/ASN1.swift", 20LL, 2, a9, v18);
    swift_willThrow();
  }

  return v17;
}

uint64_t static DER.set<A>(of:identifier:rootNode:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v7 = *(void *)a3 == *(void *)a2 && *(unsigned __int8 *)(a3 + 8) == *(unsigned __int8 *)(a2 + 8);
  if (v7 && (*(_BYTE *)(a3 + 56) & 1) == 0)
  {
    uint64_t v6 = v5;
    uint64_t v13 = *(void *)(a3 + 16);
    uint64_t v12 = *(void *)(a3 + 24);
    uint64_t v15 = *(void *)(a3 + 32);
    uint64_t v14 = *(void *)(a3 + 40);
    uint64_t v16 = *(void *)(a3 + 48);
    uint64_t v24 = v13;
    uint64_t v25 = v12;
    uint64_t v26 = v15;
    uint64_t v27 = v14;
    uint64_t v28 = v16;
    swift_unknownObjectRetain();
    uint64_t v17 = sub_189454628();
    if ((v17 & 1) != 0)
    {
      v22[1] = v22;
      uint64_t v24 = v13;
      uint64_t v25 = v12;
      uint64_t v26 = v15;
      uint64_t v27 = v14;
      uint64_t v28 = v16;
      MEMORY[0x1895F8858](v17);
      uint64_t v23 = v16;
      v21[2] = a4;
      v21[3] = a5;
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C505898);
      unint64_t v19 = sub_18945B550();
      uint64_t v6 = sub_189453C88( (void (*)(char *, char *))sub_18945B594,  (uint64_t)v21,  (uint64_t)&type metadata for ASN1NodeCollection,  a4,  v18,  v19,  MEMORY[0x18961A3E8],  (uint64_t)&v29);
      j__swift_unknownObjectRelease(v13, v12, v15, v14, v23, 0LL);
    }

    else
    {
      sub_18945AD44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD00000000000002FLL,  0x8000000189475B30LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  179LL,  v20);
      swift_willThrow();
      j__swift_unknownObjectRelease(v13, v12, v15, v14, v16, 0LL);
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20LL, 2, 175LL, v8);
    swift_willThrow();
  }

  return v6;
}

uint64_t sub_189454628()
{
  uint64_t v1 = *((void *)v0 + 4);
  __int128 v2 = v0[1];
  __int128 v83 = *v0;
  __int128 v84 = v2;
  uint64_t v85 = v1;
  ASN1NodeCollection.Iterator.next()((uint64_t)v75);
  uint64_t v3 = v79;
  if (!v79)
  {
    swift_unknownObjectRetain();
LABEL_41:
    swift_unknownObjectRelease();
    return 1LL;
  }

  uint64_t v4 = v75[4];
  uint64_t v58 = v75[3];
  uint64_t v59 = v75[2];
  uint64_t v5 = v76;
  uint64_t v57 = v77;
  char v6 = v78;
  uint64_t v7 = v78 & 1;
  unint64_t v9 = *((void *)&v84 + 1);
  int64_t v8 = v84;
  int64_t v10 = *((void *)&v84 + 1) >> 1;
  if ((void)v84 == *((void *)&v84 + 1) >> 1)
  {
    swift_unknownObjectRetain();
    uint64_t v11 = v57;
LABEL_40:
    j__swift_unknownObjectRelease(v59, v58, v4, v5, v11, v7);
    swift_unknownObjectRelease();
    goto LABEL_41;
  }

  char v74 = v78 & 1;
  uint64_t v53 = v75[1];
  uint64_t v54 = v75[0];
  uint64_t v55 = v80;
  uint64_t v56 = v76;
  unint64_t v51 = v82;
  int64_t v52 = v81;
  __int128 v12 = v83;
  swift_unknownObjectRetain();
  char v48 = v6;
  sub_18945EBAC(v54, v53, v59, v58, v4, v5, v57, v6, v3);
  unint64_t v61 = v9 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v60 = *((void *)&v12 + 1) + 112LL;
  uint64_t v49 = v3;
  uint64_t v50 = v4;
  uint64_t v13 = v3;
  uint64_t result = v55;
  uint64_t v15 = v5;
  unint64_t v17 = v51;
  int64_t v16 = v52;
  uint64_t v18 = v59;
  uint64_t v19 = v58;
  uint64_t v20 = v4;
  uint64_t v21 = v57;
  while (v8 < (uint64_t)(v9 >> 1))
  {
    if (v10 <= v8) {
      goto LABEL_47;
    }
    if (v9 >> 1 < v10) {
      goto LABEL_48;
    }
    uint64_t v22 = *((void *)&v12 + 1) + 96 * v8;
    int v23 = *(unsigned __int8 *)(v22 + 24);
    uint64_t v25 = *(void *)(v22 + 32);
    uint64_t v24 = *(void *)(v22 + 40);
    uint64_t v26 = *(void *)(v22 + 48);
    unint64_t v27 = *(void *)(v22 + 56);
    uint64_t v28 = v8 + 1;
    unint64_t v29 = v9 & 1;
    uint64_t v72 = v15;
    uint64_t v73 = v20;
    uint64_t v70 = v19;
    uint64_t v71 = v21;
    uint64_t v69 = v18;
    unint64_t v63 = v29;
    int64_t v68 = v16;
    if (*(_BYTE *)(v22 + 24))
    {
      uint64_t v30 = *(void *)(v22 + 16);
      int64_t v31 = v10;
      if (v28 != v10)
      {
        __int128 v32 = (uint64_t *)(v60 + 96 * v8);
        int64_t v31 = v8 + 1;
        do
        {
          if (v31 >= v10)
          {
LABEL_44:
            __break(1u);
LABEL_45:
            __break(1u);
            goto LABEL_46;
          }

          if (v30 >= *v32) {
            goto LABEL_17;
          }
          uint64_t v33 = v31 + 1;
          if (__OFADD__(v31, 1LL)) {
            goto LABEL_45;
          }
          ++v31;
          v32 += 12;
        }

        while (v33 != v10);
        int64_t v31 = v10;
LABEL_17:
        if (v31 <= v8) {
          goto LABEL_49;
        }
        if (v31 < 0) {
          goto LABEL_50;
        }
      }

      uint64_t v34 = v31 - v28;
      if (__OFSUB__(v31, v28)) {
        goto LABEL_51;
      }
      if (v34 < 0) {
        goto LABEL_52;
      }
      int64_t v35 = v10 - v28;
      if (__OFSUB__(v10, v28)) {
        goto LABEL_53;
      }
      if (!v34 || v35 < 0 || (int64_t v36 = v10, v35 >= v34))
      {
        int64_t v36 = v31;
        if (__OFADD__(v28, v34)) {
          goto LABEL_56;
        }
        if (v10 < v31) {
          goto LABEL_54;
        }
      }

      if (v36 <= v8) {
        goto LABEL_55;
      }
      if (v28 != v31)
      {
        if (v28 >= v31) {
          goto LABEL_57;
        }
        __int128 v37 = (uint64_t *)(v60 + 96 * v8);
        do
        {
          uint64_t v38 = *v37;
          v37 += 12;
          if (v30 >= v38)
          {
            __break(1u);
            goto LABEL_44;
          }

          --v34;
        }

        while (v34);
        if (*(void *)(*((void *)&v12 + 1) + 96 * v28 + 16) != v30 + 1) {
          goto LABEL_58;
        }
      }

      int64_t v62 = v36;
      uint64_t v39 = v26;
      uint64_t v40 = v13;
      uint64_t v41 = result;
      uint64_t v67 = v29 | (2 * v31);
      uint64_t v65 = *((void *)&v12 + 1);
      uint64_t v66 = swift_unknownObjectRetain();
      uint64_t v64 = v28;
    }

    else
    {
      uint64_t v41 = result;
      uint64_t result = *(void *)(v22 + 64);
      if (!result) {
        goto LABEL_59;
      }
      uint64_t v39 = *(void *)(v22 + 48);
      uint64_t v40 = v13;
      uint64_t v64 = *(void *)(v22 + 80);
      uint64_t v65 = *(void *)(v22 + 72);
      uint64_t v66 = *(void *)(v22 + 64);
      uint64_t v67 = *(void *)(v22 + 88);
      swift_unknownObjectRetain();
      uint64_t v30 = 0LL;
      int64_t v62 = v28;
    }

    uint64_t v42 = v23 ^ 1u;
    swift_unknownObjectRetain();
    uint64_t v43 = swift_unknownObjectRetain();
    uint64_t v44 = v39;
    sub_189458858(v43, v24, v39, v27, v40, v41, v68, v17);
    char v46 = v45;
    j__swift_unknownObjectRelease(v69, v70, v73, v72, v71, v74 & 1);
    swift_unknownObjectRelease_n();
    if ((v46 & 1) != 0)
    {
      swift_unknownObjectRelease();
      sub_18945AD8C(v54, v53, v59, v58, v50, v56, v57, v48, v49);
      j__swift_unknownObjectRelease(v66, v65, v64, v67, v30, v42);
      swift_unknownObjectRelease();
      return 0LL;
    }

    unint64_t v9 = v63 | v61;
    uint64_t v13 = v25;
    uint64_t result = v24;
    int64_t v16 = v44;
    unint64_t v17 = v27;
    int64_t v8 = v62;
    uint64_t v18 = v66;
    uint64_t v19 = v65;
    uint64_t v4 = v64;
    uint64_t v20 = v64;
    uint64_t v15 = v67;
    uint64_t v21 = v30;
    char v74 = v42;
    if (v62 == v10)
    {
      sub_18945AD8C(v54, v53, v59, v58, v50, v56, v57, v48, v49);
      uint64_t v47 = v42;
      uint64_t v58 = v65;
      uint64_t v59 = v66;
      uint64_t v5 = v67;
      uint64_t v11 = v30;
      uint64_t v7 = v47;
      goto LABEL_40;
    }
  }

LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
  return result;
}

uint64_t sub_189454ACC(uint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  char v8 = *((_BYTE *)a1 + 8);
  uint64_t v10 = a1[2];
  uint64_t v9 = a1[3];
  uint64_t v11 = a1[4];
  uint64_t v12 = a1[5];
  uint64_t v13 = a1[6];
  uint64_t v14 = *((unsigned __int8 *)a1 + 56);
  uint64_t v18 = *a1;
  char v19 = v8;
  uint64_t v20 = v10;
  uint64_t v21 = v9;
  uint64_t v22 = v11;
  uint64_t v23 = v12;
  uint64_t v24 = v13;
  char v25 = v14;
  __int128 v15 = *((_OWORD *)a1 + 5);
  __int128 v26 = *((_OWORD *)a1 + 4);
  __int128 v27 = v15;
  int64_t v16 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a3 + 8);
  j__swift_unknownObjectRetain(v10, v9, v11, v12, v13, v14);
  swift_unknownObjectRetain();
  uint64_t result = v16(&v18, a2, a3);
  if (v4) {
    *a4 = v4;
  }
  return result;
}

void static DER.optionalExplicitlyTagged<A>(_:tagNumber:tagClass:_:)( __int128 *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, void (*a4)(uint64_t *)@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  int v11 = *a3;
  uint64_t v12 = *((void *)a1 + 4);
  __int128 v13 = a1[1];
  __int128 v68 = *a1;
  __int128 v69 = v13;
  uint64_t v70 = v12;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v56);
  uint64_t v14 = v64;
  if (!v64)
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56LL))(a6, 1LL, 1LL, a5);
    return;
  }

  uint64_t v52 = a6;
  uint64_t v51 = a5;
  uint64_t v15 = v56;
  uint64_t v16 = v58;
  uint64_t v17 = v59;
  uint64_t v18 = a2;
  uint64_t v20 = v60;
  uint64_t v19 = v61;
  uint64_t v22 = v62;
  char v21 = v63;
  uint64_t v50 = v18;
  uint64_t v71 = v63;
  if (v56 != v18 || v11 != v57)
  {
    uint64_t v54 = v62;
    uint64_t v55 = v61;
    uint64_t v28 = v57;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    sub_18945AD8C(v15, v28, v16, v17, v20, v55, v54, v71, v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56LL))(v52, 1LL, 1LL);
    return;
  }

  uint64_t v49 = v57;
  uint64_t v23 = v70;
  __int128 v24 = v69;
  *a1 = v68;
  a1[1] = v24;
  *((void *)a1 + 4) = v23;
  if ((v21 & 1) != 0)
  {
    __break(1u);
    return;
  }

  uint64_t v25 = v22;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v56);
  if (!v64)
  {
    j__swift_unknownObjectRetain(v16, v17, v20, v19, v25, 0LL);
    j__swift_unknownObjectRetain(v16, v17, v20, v19, v25, 0LL);
    swift_unknownObjectRetain();
    goto LABEL_11;
  }

  uint64_t v44 = v64;
  uint64_t v40 = v56;
  uint64_t v41 = v58;
  uint64_t v42 = v57;
  uint64_t v43 = v59;
  uint64_t v45 = v60;
  uint64_t v46 = v61;
  uint64_t v47 = v62;
  char v48 = v63;
  uint64_t v38 = v66;
  uint64_t v39 = v65;
  uint64_t v37 = v67;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v56);
  uint64_t v26 = v56;
  uint64_t v35 = v58;
  uint64_t v36 = v57;
  uint64_t v33 = v60;
  uint64_t v34 = v59;
  uint64_t v31 = v62;
  uint64_t v32 = v61;
  uint64_t v27 = v64;
  char v30 = v63;
  j__swift_unknownObjectRetain(v16, v17, v20, v19, v25, 0LL);
  j__swift_unknownObjectRetain(v16, v17, v20, v19, v25, 0LL);
  swift_unknownObjectRetain();
  sub_18945AD8C(v26, v36, v35, v34, v33, v32, v31, v30, v27);
  if (v27)
  {
    sub_18945AD8C(v40, v42, v41, v43, v45, v46, v47, v48, v44);
LABEL_11:
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD000000000000041LL,  0x8000000189475B60LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  222LL,  v29);
    swift_willThrow();
    j__swift_unknownObjectRelease(v16, v17, v20, v19, v25, 0LL);
    sub_18945AD8C(v50, v49, v16, v17, v20, v19, v25, v71, v14);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return;
  }

  uint64_t v56 = v40;
  LOBYTE(v57) = v42;
  uint64_t v58 = v41;
  uint64_t v59 = v43;
  uint64_t v60 = v45;
  uint64_t v61 = v46;
  uint64_t v62 = v47;
  LOBYTE(v63) = v48 & 1;
  uint64_t v64 = v44;
  uint64_t v65 = v39;
  uint64_t v66 = v38;
  uint64_t v67 = v37;
  a4(&v56);
  j__swift_unknownObjectRelease(v16, v17, v20, v19, v25, 0LL);
  sub_18945AD8C(v50, v49, v16, v17, v20, v19, v25, v71, v14);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_18945AD8C(v40, v42, v41, v43, v45, v46, v47, v48, v44);
  if (!v6) {
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56LL))(v52, 0LL, 1LL, v51);
  }
}

uint64_t static DER.optionalImplicitlyTagged<A>(_:tag:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = *(void *)a2;
  int v11 = *(unsigned __int8 *)(a2 + 8);
  uint64_t v12 = *(void *)(a1 + 32);
  __int128 v13 = *(_OWORD *)(a1 + 16);
  __int128 v34 = *(_OWORD *)a1;
  __int128 v35 = v13;
  uint64_t v36 = v12;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v25);
  uint64_t v14 = v33;
  if (v33)
  {
    uint64_t v37 = a5;
    uint64_t v16 = v25;
    uint64_t v15 = v26;
    uint64_t v23 = v28;
    uint64_t v24 = v27;
    uint64_t v21 = v30;
    uint64_t v22 = v29;
    char v19 = v32;
    uint64_t v20 = v31;
    if (v25 == v10 && v11 == v26)
    {
      uint64_t v25 = v10;
      LOBYTE(v26) = v11;
      swift_unknownObjectRetain();
      a5 = v37;
      DERImplicitlyTaggable.init(derEncoded:withIdentifier:)(a1, &v25, a3, a4);
      swift_unknownObjectRelease();
      uint64_t result = sub_18945AD8C(v10, v15, v24, v23, v22, v21, v20, v19, v14);
      if (v5) {
        return result;
      }
      uint64_t v18 = 0LL;
    }

    else
    {
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      sub_18945AD8C(v16, v15, v24, v23, v22, v21, v20, v19, v14);
      uint64_t v18 = 1LL;
      a5 = v37;
    }
  }

  else
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    uint64_t v18 = 1LL;
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56LL))(a5, v18, 1LL, a3);
}

uint64_t DERImplicitlyTaggable.init(derEncoded:withIdentifier:)( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  char v7 = *((_BYTE *)a2 + 8);
  ASN1NodeCollection.Iterator.next()((uint64_t)&v12);
  if (v14)
  {
    LOBYTE(v13) = v13 & 1;
    uint64_t v10 = v6;
    char v11 = v7;
    return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(a4 + 32))(&v12, &v10, a3, a4);
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD00000000000002ALL,  0x8000000189475BB0LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  1107LL,  v9);
    return swift_willThrow();
  }

{
  uint64_t v4;
  uint64_t v7;
  char v8;
  uint64_t result;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;
  char v7 = *a2;
  char v8 = *((_BYTE *)a2 + 8);
  static DER.parse(_:)(a1, a1 + 32, 0LL, (2LL * *(void *)(a1 + 16)) | 1, (uint64_t)&v20);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v4)
  {
    uint64_t v12 = v20;
    int v13 = v21;
    uint64_t v14 = v22;
    uint64_t v15 = v23;
    uint64_t v16 = v24;
    uint64_t v17 = v25;
    uint64_t v18 = v26;
    char v19 = v27;
    uint64_t v10 = v7;
    char v11 = v8;
    return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(a4 + 32))(&v12, &v10, a3, a4);
  }

  return result;
}

uint64_t static DER.optionalImplicitlyTagged<A>(_:tagNumber:tagClass:_:)@<X0>( __int128 *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, void (*a4)(uint64_t *)@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  int v12 = *a3;
  uint64_t v13 = *((void *)a1 + 4);
  __int128 v14 = a1[1];
  __int128 v55 = *a1;
  __int128 v56 = v14;
  uint64_t v57 = v13;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v43);
  uint64_t v15 = v51;
  if (v51)
  {
    uint64_t v37 = a4;
    uint64_t v58 = a6;
    uint64_t v38 = a5;
    uint64_t v17 = v43;
    uint64_t v16 = v44;
    uint64_t v19 = v45;
    uint64_t v18 = v46;
    uint64_t v21 = v47;
    uint64_t v20 = v48;
    uint64_t v23 = v49;
    char v22 = v50;
    uint64_t v25 = v52;
    uint64_t v24 = v53;
    uint64_t v26 = v54;
    uint64_t v40 = v49;
    char v41 = v50;
    uint64_t v39 = v48;
    if (v43 == a2 && v12 == v44)
    {
      uint64_t v27 = v57;
      __int128 v28 = v56;
      *a1 = v55;
      a1[1] = v28;
      *((void *)a1 + 4) = v27;
      uint64_t v43 = a2;
      LOBYTE(v44) = v12;
      uint64_t v45 = v19;
      uint64_t v46 = v18;
      uint64_t v47 = v21;
      uint64_t v48 = v20;
      uint64_t v49 = v23;
      LOBYTE(v50) = v22 & 1;
      uint64_t v51 = v15;
      uint64_t v52 = v25;
      uint64_t v53 = v24;
      uint64_t v54 = v26;
      uint64_t v42 = v21;
      uint64_t v35 = v19;
      uint64_t v36 = v18;
      uint64_t v29 = v16;
      swift_unknownObjectRetain();
      v37(&v43);
      swift_unknownObjectRelease();
      uint64_t result = sub_18945AD8C(a2, v29, v35, v36, v42, v39, v40, v41, v15);
      if (v6) {
        return result;
      }
      uint64_t v31 = 0LL;
    }

    else
    {
      uint64_t v32 = v47;
      uint64_t v33 = v46;
      uint64_t v34 = v44;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      sub_18945AD8C(v17, v34, v19, v33, v32, v39, v40, v41, v15);
      uint64_t v31 = 1LL;
    }

    a5 = v38;
    a6 = v58;
  }

  else
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    uint64_t v31 = 1LL;
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56LL))(a6, v31, 1LL, a5);
}

uint64_t static DER.decodeDefault<A>(_:identifier:defaultValue:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X2>, void (*a3)(uint64_t *)@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v53 = a6;
  uint64_t v55 = a4;
  __int128 v56 = a3;
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](a1);
  uint64_t v57 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = *(void *)v14;
  int v16 = *(unsigned __int8 *)(v14 + 8);
  uint64_t v17 = *(void *)(v12 + 32);
  __int128 v18 = *(_OWORD *)(v12 + 16);
  __int128 v60 = *(_OWORD *)v12;
  __int128 v73 = v60;
  __int128 v74 = v18;
  uint64_t v75 = v17;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v61);
  uint64_t v19 = v69;
  if (v69)
  {
    uint64_t v51 = a2;
    uint64_t v52 = a5;
    uint64_t v50 = v11;
    uint64_t v49 = a7;
    uint64_t v20 = v61;
    uint64_t v21 = v62;
    uint64_t v22 = v65;
    uint64_t v58 = v63;
    uint64_t v59 = v64;
    uint64_t v24 = v66;
    uint64_t v23 = v67;
    uint64_t v25 = v68;
    uint64_t v27 = v70;
    uint64_t v26 = v71;
    uint64_t v28 = v72;
    uint64_t v54 = v67;
    if (v61 == v15 && v16 == v62)
    {
      uint64_t v46 = v62;
      uint64_t v29 = v75;
      __int128 v30 = v74;
      *(_OWORD *)a1 = v73;
      *(_OWORD *)(a1 + 16) = v30;
      *(void *)(a1 + 32) = v29;
      uint64_t v61 = v15;
      LOBYTE(v62) = v16;
      uint64_t v63 = v58;
      uint64_t v64 = v59;
      uint64_t v65 = v22;
      uint64_t v66 = v24;
      uint64_t v67 = v23;
      LOBYTE(v68) = v25 & 1;
      uint64_t v69 = v19;
      uint64_t v70 = v27;
      uint64_t v71 = v26;
      uint64_t v72 = v28;
      uint64_t v31 = v15;
      *(void *)&__int128 v60 = v25;
      uint64_t v48 = v24;
      uint64_t v47 = v22;
      uint64_t v32 = v27;
      uint64_t v33 = (void (*)(uint64_t *))v26;
      uint64_t v34 = v28;
      swift_unknownObjectRetain();
      uint64_t v35 = v57;
      uint64_t v36 = v76;
      v56(&v61);
      if (v36)
      {
        swift_unknownObjectRelease();
        return sub_18945AD8C(v31, v46, v58, v59, v47, v48, v54, v60, v19);
      }

      else
      {
        uint64_t v45 = v31;
        uint64_t v55 = v34;
        __int128 v56 = v33;
        uint64_t v76 = v32;
        char v41 = v60;
        uint64_t v42 = v52;
        if ((sub_189473770() & 1) != 0)
        {
          sub_18945AD44();
          swift_allocError();
          static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD000000000000047LL,  0x8000000189475BE0LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  323LL,  v43);
          swift_willThrow();
          sub_18945AD8C(v45, v46, v58, v59, v47, v48, v54, v41, v19);
          (*(void (**)(char *, uint64_t))(v50 + 8))(v35, v42);
          return swift_unknownObjectRelease();
        }

        else
        {
          swift_unknownObjectRelease();
          sub_18945AD8C(v45, v46, v58, v59, v47, v48, v54, v41, v19);
          return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v50 + 32))(v49, v35, v42);
        }
      }
    }

    else
    {
      char v38 = v68;
      uint64_t v39 = v66;
      uint64_t v40 = v65;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      sub_18945AD8C(v20, v21, v58, v59, v40, v39, v54, v38, v19);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v49, v51, v52);
    }
  }

  else
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(a7, a2, a5);
  }

uint64_t static DER.decodeDefault<A>(_:identifier:defaultValue:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  char v7 = *(_BYTE *)(a2 + 8);
  v9[6] = *(void *)a2;
  char v10 = v7;
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = a6;
  return static DER.decodeDefault<A>(_:identifier:defaultValue:_:)( a1,  a3,  (void (*)(uint64_t *))sub_18945B5B4,  (uint64_t)v9,  a4,  a5,  a7);
}

uint64_t static DER.decodeDefault<A>(_:defaultValue:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 24))(&v14, a3, a5);
  uint64_t v12 = *(void *)(a5 + 8);
  uint64_t v20 = v14;
  char v21 = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = v12;
  return static DER.decodeDefault<A>(_:identifier:defaultValue:_:)( a1,  a2,  (void (*)(uint64_t *))sub_18945B5B4,  (uint64_t)v16,  a3,  a4,  a6);
}

void static DER.decodeDefaultExplicitlyTagged<A>(_:tagNumber:tagClass:defaultValue:_:)( __int128 *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t *)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>)
{
  uint64_t v31 = a6;
  uint64_t v27 = a8;
  uint64_t v28 = a9;
  uint64_t v29 = a4;
  uint64_t v14 = sub_1894738A8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  uint64_t v18 = (char *)&v27 - v17;
  uint64_t v30 = *(void *)(a7 - 8);
  MEMORY[0x1895F8858](v16);
  uint64_t v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unsigned __int8 v33 = *a3;
  uint64_t v21 = v32;
  static DER.optionalExplicitlyTagged<A>(_:tagNumber:tagClass:_:)(a1, a2, &v33, a5, a7, (uint64_t)v18);
  if (!v21)
  {
    uint64_t v23 = v28;
    uint64_t v22 = v29;
    uint64_t v24 = v30;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v18, 1LL, a7) == 1)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
      (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v23, v22, a7);
    }

    else
    {
      uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
      v25(v20, v18, a7);
      if ((sub_189473770() & 1) != 0)
      {
        sub_18945AD44();
        swift_allocError();
        static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD000000000000051LL,  0x8000000189475C30LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  377LL,  v26);
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v20, a7);
      }

      else
      {
        v25(v23, v20, a7);
      }
    }
  }

void static DER.decodeDefaultExplicitlyTagged<A>(_:tagNumber:tagClass:defaultValue:)( __int128 *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X8>)
{
  unsigned __int8 v12 = *a3;
  uint64_t v9 = a5;
  uint64_t v10 = a6;
  uint64_t v11 = a7;
  static DER.decodeDefaultExplicitlyTagged<A>(_:tagNumber:tagClass:defaultValue:_:)( a1,  a2,  &v12,  a4,  (void (*)(uint64_t *))sub_18945ED98,  (uint64_t)v8,  a5,  a6,  a8);
}

uint64_t sub_189455D58(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v6 = *((_BYTE *)a1 + 8);
  uint64_t v8 = a1[2];
  uint64_t v7 = a1[3];
  uint64_t v9 = a1[4];
  uint64_t v10 = a1[5];
  uint64_t v11 = a1[6];
  uint64_t v12 = *((unsigned __int8 *)a1 + 56);
  uint64_t v16 = *a1;
  char v17 = v6;
  uint64_t v18 = v8;
  uint64_t v19 = v7;
  uint64_t v20 = v9;
  uint64_t v21 = v10;
  uint64_t v22 = v11;
  char v23 = v12;
  __int128 v13 = *((_OWORD *)a1 + 5);
  __int128 v24 = *((_OWORD *)a1 + 4);
  __int128 v25 = v13;
  uint64_t v14 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a4 + 8);
  j__swift_unknownObjectRetain(v8, v7, v9, v10, v11, v12);
  swift_unknownObjectRetain();
  return v14(&v16, a2, a4);
}

uint64_t static DER.explicitlyTagged<A>(_:tagNumber:tagClass:_:)( uint64_t a1, uint64_t a2, unsigned __int8 *a3, void (*a4)(uint64_t *))
{
  unsigned __int8 v6 = *a3;
  ASN1NodeCollection.Iterator.next()((uint64_t)v20);
  uint64_t v7 = v22;
  if (v22)
  {
    uint64_t v18 = v20[5];
    uint64_t v19 = v20[6];
    char v16 = v21;
    uint64_t v17 = v20[4];
    uint64_t v9 = v20[2];
    uint64_t v8 = v20[3];
    uint64_t v10 = a4;
    uint64_t v11 = a2;
    uint64_t v13 = v20[0];
    uint64_t v12 = v20[1];
    LOBYTE(v21) = v21 & 1;
    unsigned __int8 v23 = v6;
    static DER.explicitlyTagged<A>(_:tagNumber:tagClass:_:)((uint64_t)v20, v11, &v23, v10);
    return sub_18945AD8C(v13, v12, v9, v8, v17, v18, v19, v16, v7);
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD000000000000040LL,  0x8000000189475C90LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  423LL,  v15);
    return swift_willThrow();
  }

{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v9;
  uint64_t v10;
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
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  if (*(void *)a1 != a2 || *(unsigned __int8 *)(a1 + 8) != *a3)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20LL, 2, 442LL, v5);
    return swift_willThrow();
  }

  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD00000000000001DLL,  0x8000000189475CE0LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  447LL,  v6);
    return swift_willThrow();
  }

  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v59 = *(void *)(a1 + 16);
  uint64_t v54 = v59;
  uint64_t v55 = v9;
  __int128 v56 = v11;
  uint64_t v57 = v10;
  uint64_t v58 = v12;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v42);
  if (!v50)
  {
    uint64_t v20 = v59;
    j__swift_unknownObjectRetain(v59, v9, v11, v10, v12, 0LL);
    j__swift_unknownObjectRetain(v20, v9, v11, v10, v12, 0LL);
    uint64_t v14 = v10;
    goto LABEL_13;
  }

  uint64_t v37 = v50;
  unsigned __int8 v33 = v42;
  uint64_t v34 = v44;
  uint64_t v35 = v43;
  uint64_t v36 = v45;
  char v38 = v46;
  uint64_t v39 = v47;
  uint64_t v40 = v48;
  char v41 = v49;
  uint64_t v31 = v52;
  uint64_t v32 = v51;
  uint64_t v22 = v53;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v42);
  uint64_t v29 = v43;
  uint64_t v30 = v42;
  uint64_t v27 = v45;
  uint64_t v28 = v44;
  __int128 v25 = v47;
  uint64_t v26 = v46;
  uint64_t v13 = v50;
  unsigned __int8 v23 = v49;
  __int128 v24 = v48;
  uint64_t v14 = v10;
  uint64_t v15 = v12;
  char v16 = v11;
  uint64_t v17 = v9;
  uint64_t v18 = v59;
  j__swift_unknownObjectRetain(v59, v17, v16, v14, v15, 0LL);
  uint64_t v19 = v18;
  uint64_t v9 = v17;
  uint64_t v11 = v16;
  uint64_t v12 = v15;
  j__swift_unknownObjectRetain(v19, v9, v11, v14, v15, 0LL);
  sub_18945AD8C(v30, v29, v28, v27, v26, v25, v24, v23, v13);
  if (v13)
  {
    sub_18945AD8C(v33, v35, v34, v36, v38, v39, v40, v41, v37);
    uint64_t v20 = v59;
LABEL_13:
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD000000000000033LL,  0x8000000189475D00LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  452LL,  v21);
    swift_willThrow();
    j__swift_unknownObjectRelease(v20, v9, v11, v14, v12, 0LL);
    return swift_unknownObjectRelease();
  }

  uint64_t v42 = v33;
  LOBYTE(v43) = v35;
  uint64_t v44 = v34;
  uint64_t v45 = v36;
  uint64_t v46 = v38;
  uint64_t v47 = v39;
  uint64_t v48 = v40;
  LOBYTE(v49) = v41 & 1;
  uint64_t v50 = v37;
  uint64_t v51 = v32;
  uint64_t v52 = v31;
  uint64_t v53 = v22;
  a4(&v42);
  swift_unknownObjectRelease();
  j__swift_unknownObjectRelease(v59, v9, v11, v14, v15, 0LL);
  return sub_18945AD8C(v33, v35, v34, v36, v38, v39, v40, v41, v37);
}

uint64_t sub_189456384(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  v9[0] = a1;
  v9[1] = a2;
  uint64_t v10 = a3;
  unint64_t v11 = a4;
  swift_unknownObjectRetain();
  uint64_t v8 = sub_18945B080(0LL, 16LL, 0, MEMORY[0x18961AFE8]);
  uint64_t result = sub_1894564AC(v9, 1LL, &v8);
  if (v4) {
    goto LABEL_6;
  }
  if (!__OFSUB__(v11 >> 1, v10))
  {
    if (v11 >> 1 == v10)
    {
      uint64_t v5 = v8;
      swift_unknownObjectRelease();
      return (uint64_t)v5;
    }

    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD000000000000021LL,  0x8000000189475DA0LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  479LL,  v7);
    swift_willThrow();
LABEL_6:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v5;
  }

  __break(1u);
  return result;
}

uint64_t sub_1894564AC(uint64_t *a1, uint64_t a2, char **a3)
{
  if (a2 > 50)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD000000000000021LL,  0x8000000189475E20LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  490LL,  v4);
    return swift_willThrow();
  }

  uint64_t v7 = a1;
  uint64_t v8 = *a1;
  uint64_t v9 = a1[1];
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  __int16 v12 = sub_18946F330();
  if ((v12 & 0x100) != 0)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.truncatedASN1Field(file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20LL, 2, 496LL, v21);
    return swift_willThrow();
  }

  uint64_t v64 = v9;
  unsigned int v13 = v12;
  unint64_t v14 = v12 & 0x1F;
  if ((_DWORD)v14 == 31)
  {
    swift_unknownObjectRetain();
    sub_1894696E0();
    if (v3) {
      return swift_unknownObjectRelease();
    }
    unint64_t v14 = v15;
    if (v15 <= 0x1E)
    {
      sub_18945AD44();
      swift_allocError();
      uint64_t v16 = 0xD00000000000002BLL;
      uint64_t v18 = v17;
      uint64_t v19 = 0x8000000189475DF0LL;
      uint64_t v20 = 510LL;
LABEL_26:
      static ASN1Error.invalidASN1Object(reason:file:line:)( v16,  v19,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  v20,  v18);
      goto LABEL_27;
    }
  }

  else
  {
    swift_unknownObjectRetain();
  }

  sub_189456A20();
  if (v3) {
    return swift_unknownObjectRelease();
  }
  if ((v24 & 1) != 0)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.truncatedASN1Field(file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20LL, 2, 518LL, v39);
LABEL_27:
    swift_willThrow();
    return swift_unknownObjectRelease();
  }

  if (v23 < 0)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v18 = v40;
    uint64_t v16 = 0xD000000000000018LL;
    uint64_t v19 = 0x8000000189475DD0LL;
    uint64_t v20 = 523LL;
    goto LABEL_26;
  }

  uint64_t v60 = *v7;
  int64_t v54 = v7[2];
  unint64_t v55 = v7[1];
  uint64_t v52 = v10;
  unint64_t v53 = v7[3];
  uint64_t v25 = v23;
  uint64_t v26 = sub_189456CA0(v23, *v7, v55, v54, v53);
  unint64_t v58 = v28;
  uint64_t v59 = v27;
  uint64_t v56 = v26;
  uint64_t v57 = v25;
  v61[0] = v26;
  v61[1] = v29;
  uint64_t v51 = v29;
  uint64_t v62 = v27;
  unint64_t v63 = v28;
  *uint64_t v7 = sub_189456D1C(v25, v60, v55, v54, v53);
  v7[1] = v30;
  v7[2] = v31;
  v7[3] = v32;
  uint64_t v33 = v58 >> 1;
  if (__OFSUB__(v58 >> 1, v59)) {
    goto LABEL_41;
  }
  uint64_t v25 = v52;
  if ((v58 >> 1) - v59 != v57)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.truncatedASN1Field(file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20LL, 2, 530LL, v41);
    swift_unknownObjectRetain();
    swift_willThrow();
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }

  if (v33 < v52) {
    goto LABEL_42;
  }
  if ((uint64_t)(v11 >> 1) < v52)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }

  if (v11 >> 1 < v33)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }

  unint64_t v55 = v58 & 0xFFFFFFFFFFFFFFFELL | v11 & 1;
  if ((v13 & 0x20) != 0)
  {
    uint64_t v42 = *a3;
    swift_unknownObjectRetain_n();
    swift_unknownObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v42 = sub_18945B080(0LL, *((void *)v42 + 2) + 1LL, 1, v42);
    }
    unint64_t v44 = *((void *)v42 + 2);
    unint64_t v43 = *((void *)v42 + 3);
    unint64_t v45 = v44 + 1;
    uint64_t v46 = v57;
    if (v44 >= v43 >> 1)
    {
      uint64_t v50 = sub_18945B080((char *)(v43 > 1), v44 + 1, 1, v42);
      unint64_t v45 = v44 + 1;
      uint64_t v42 = v50;
      uint64_t v46 = v57;
    }

    *((void *)v42 + 2) = v45;
    uint64_t v47 = &v42[96 * v44];
    *((void *)v47 + 4) = v14;
    v47[40] = v13 >> 6;
    *((void *)v47 + 6) = a2;
    v47[56] = 1;
    uint64_t v48 = v64;
    *((void *)v47 + 8) = v8;
    *((void *)v47 + 9) = v48;
    *((void *)v47 + 10) = v52;
    *((void *)v47 + 11) = v55;
    *((_OWORD *)v47 + 6) = 0u;
    *((_OWORD *)v47 + 7) = 0u;
    *a3 = v42;
    if (!v46)
    {
      swift_unknownObjectRelease_n();
      return swift_unknownObjectRelease();
    }

    uint64_t v7 = (uint64_t *)(a2 + 1);
    while (1)
    {
      sub_1894564AC(v61, a2 + 1, a3);
      if (__OFSUB__(v63 >> 1, v62)) {
        break;
      }
      if ((uint64_t)((v63 >> 1) - v62) <= 0)
      {
        swift_unknownObjectRelease_n();
        return swift_unknownObjectRelease();
      }
    }

    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }

  uint64_t v7 = (uint64_t *)*a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_45:
  }
    uint64_t v7 = (uint64_t *)sub_18945B080(0LL, v7[2] + 1, 1, (char *)v7);
  unint64_t v35 = v7[2];
  unint64_t v34 = v7[3];
  uint64_t v36 = v35 + 1;
  if (v35 >= v34 >> 1)
  {
    uint64_t v49 = sub_18945B080((char *)(v34 > 1), v35 + 1, 1, (char *)v7);
    uint64_t v36 = v35 + 1;
    uint64_t v7 = (uint64_t *)v49;
  }

  v7[2] = v36;
  uint64_t v37 = &v7[12 * v35];
  v37[4] = v14;
  *((_BYTE *)v37 + 40) = v13 >> 6;
  v37[6] = a2;
  *((_BYTE *)v37 + 56) = 0;
  uint64_t v38 = v64;
  v37[8] = v8;
  v37[9] = v38;
  v37[10] = v25;
  v37[11] = v55;
  v37[12] = v56;
  v37[13] = v51;
  v37[14] = v59;
  v37[15] = v58;
  swift_unknownObjectRelease();
  uint64_t result = swift_unknownObjectRelease();
  *a3 = (char *)v7;
  return result;
}

void sub_189456A20()
{
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  int64_t v4 = v3 >> 1;
  if (v2 == v3 >> 1) {
    return;
  }
  if (v2 >= v4)
  {
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v5 = *v0;
  uint64_t v6 = v0[1];
  int v7 = *(unsigned __int8 *)(v6 + v2);
  int64_t v8 = v2 + 1;
  v0[2] = v2 + 1;
  if (v7 == 128)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unsupportedFieldLength(reason:file:line:)( 0xD000000000000035LL,  0x8000000189475EE0LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  1149LL,  v9);
    swift_willThrow();
    return;
  }

  if ((v7 & 0x80) != 0)
  {
    BOOL v10 = __OFSUB__(v4, v8);
    int64_t v11 = v4 - v8;
    if (!v10)
    {
      unint64_t v12 = v7 & 0x7F;
      sub_189456CA0(v7 & 0x7F, v5, v6, v2 + 1, v3);
      uint64_t v29 = v13;
      uint64_t v15 = v14;
      unint64_t v28 = v16;
      uint64_t *v0 = sub_189456D1C(v12, v5, v6, v8, v3);
      v0[1] = v17;
      v0[2] = v18;
      v0[3] = v19;
      swift_unknownObjectRetain();
      uint64_t v20 = swift_unknownObjectRetain();
      sub_18945EDB0(v20, v29, v15, v28);
      if (!v1)
      {
        if (v21 <= 0x7F)
        {
          sub_18945AD44();
          swift_allocError();
          uint64_t v24 = 0xD00000000000004FLL;
          uint64_t v23 = v27;
          uint64_t v25 = 0x8000000189475E50LL;
          uint64_t v26 = 1168LL;
        }

        else
        {
          if (v12 <= (71 - __clz(v21)) >> 3) {
            goto LABEL_15;
          }
          sub_18945AD44();
          swift_allocError();
          uint64_t v23 = v22;
          uint64_t v24 = 0xD000000000000031LL;
          uint64_t v25 = 0x8000000189475EA0LL;
          uint64_t v26 = 1173LL;
        }

        static ASN1Error.unsupportedFieldLength(reason:file:line:)( v24,  v25,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  v26,  v23);
        swift_willThrow();
      }

LABEL_15:
      swift_unknownObjectRelease();
      return;
    }

      __break(1u);
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }

    __break(1u);
    goto LABEL_15;
  }

  return result;
}

        unint64_t v45 = v56;
        uint64_t v46 = sub_189473914();
        v28(v45, v9);
        v28((char *)v49, v9);
        v28(v50, v9);
        return v46;
      }
    }

    else if (v36 < 9)
    {
      unint64_t v43 = v48;
      unint64_t v44 = sub_189473914();
      v28(v43, v9);
      goto LABEL_15;
    }

    sub_18945EA04();
    sub_1894738D8();
    swift_getAssociatedConformanceWitness();
    char v41 = v48;
    uint64_t v42 = sub_18947374C();
    v28(v31, v9);
    v28(v41, v9);
    if ((v42 & 1) != 0) {
      goto LABEL_13;
    }
    goto LABEL_15;
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

LABEL_18:
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_189456CA0(uint64_t result, uint64_t a2, uint64_t a3, int64_t a4, unint64_t a5)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_13;
  }

  int64_t v5 = a5 >> 1;
  uint64_t v6 = (a5 >> 1) - a4;
  if (__OFSUB__(a5 >> 1, a4))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  if (!result || v6 < 0 || (int64_t v7 = a5 >> 1, v6 >= result))
  {
    int64_t v7 = a4 + result;
    if (__OFADD__(a4, result)) {
      goto LABEL_18;
    }
  }

  if (v7 < a4) {
    goto LABEL_14;
  }
  if (v5 < a4)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  if (v5 >= v7)
  {
    if ((v7 & 0x8000000000000000LL) == 0) {
      return a2;
    }
    goto LABEL_17;
  }

LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

uint64_t sub_189456D1C(uint64_t result, uint64_t a2, uint64_t a3, int64_t a4, unint64_t a5)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_12;
  }

  int64_t v5 = a5 >> 1;
  uint64_t v6 = (a5 >> 1) - a4;
  if (__OFSUB__(a5 >> 1, a4))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  if (result)
  {
    if ((v6 & 0x8000000000000000LL) == 0)
    {
      int64_t v7 = a5 >> 1;
      if (v6 < result)
      {
LABEL_8:
        if (v7 >= a4)
        {
          if (v5 >= a4) {
            return a2;
          }
          goto LABEL_15;
        }

LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
  }

  int64_t v7 = a4 + result;
  if (!__OFADD__(a4, result))
  {
    if (v5 >= v7) {
      goto LABEL_8;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

    unint64_t v21 = *((void *)v12 + 2);
    a5 = v21 - v15;
    if (v21 <= v14)
    {
      __break(1u);
      goto LABEL_45;
    }

    uint64_t v6 = 71 - __clz(a5);
    a4 = (uint64_t *)(v6 >> 3);
    sub_189458F84(v6 >> 3, v15, v21);
    unint64_t v12 = *a3;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0) {
      goto LABEL_46;
    }
LABEL_17:
    if (v14 >= *((void *)v12 + 2))
    {
      __break(1u);
      goto LABEL_48;
    }

    uint64_t v23 = v12 + 32;
    v12[v14 + 32] = (v6 >> 3) | 0x80;
    *a3 = v12;
    if (v14 + 1 < *((void *)v12 + 2))
    {
      v23[v14 + 1] = a5 >> (8 * (((_BYTE)a4 - 1) & 7u));
      if (v14 + 2 < *((void *)v12 + 2))
      {
        v23[v14 + 2] = a5 >> (8 * (((_BYTE)a4 - 2) & 7u));
        if (v14 + 3 < *((void *)v12 + 2))
        {
          v23[v14 + 3] = a5 >> (8 * (((_BYTE)a4 - 3) & 7u));
          if (v14 + 4 < *((void *)v12 + 2))
          {
            v23[v14 + 4] = a5 >> (8 * (((_BYTE)a4 - 4) & 7u));
            if (v14 + 5 < *((void *)v12 + 2))
            {
              v23[v14 + 5] = a5 >> (8 * (((_BYTE)a4 - 5) & 7u));
              if (v14 + 6 < *((void *)v12 + 2))
              {
                v23[v14 + 6] = a5 >> (8 * (((_BYTE)a4 - 6) & 7u));
                if (v14 + 7 < *((void *)v12 + 2))
                {
                  v23[v14 + 7] = a5 >> (8 * (((_BYTE)a4 - 7) & 7u));
                  if (v14 + 8 < *((void *)v12 + 2))
                  {
                    v23[v14 + 8] = a5 >> (v6 & 0x38);
LABEL_38:
                    *a3 = v12;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }

      *a3 = v5;
      a3[1] = v4;
      a3[2] = v7;
      a3[3] = v6;
      return result;
    }

    goto LABEL_16;
  }

uint64_t sub_189456D8C()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_189473A4C();
  sub_18945C3D0((uint64_t)v5, v1, v2, v3);
  return sub_189473A7C();
}

uint64_t sub_189456DE4(uint64_t a1)
{
  return sub_18945C3D0(a1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_189456DF0()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_189473A4C();
  sub_18945C3D0((uint64_t)v5, v1, v2, v3);
  return sub_189473A7C();
}

uint64_t sub_189456E44(uint64_t a1, uint64_t a2)
{
  return sub_18945B5D0( *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a2 + 8),  *(void *)(a2 + 16),  *(void *)(a2 + 24));
}

uint64_t static DER.parse(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1 + 32;
  unint64_t v4 = (2LL * *(void *)(a1 + 16)) | 1;
  uint64_t v5 = swift_bridgeObjectRetain();
  static DER.parse(_:)(v5, v3, 0LL, v4, a2);
  return swift_bridgeObjectRelease();
}

uint64_t static DER.parse(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t result = sub_189456384(a1, a2, a3, a4);
  if (!v5)
  {
    unint64_t v11 = v10;
    unint64_t v12 = v10 >> 1;
    if (v9 == v10 >> 1)
    {
      __break(1u);
    }

    else if (v9 < (uint64_t)(v10 >> 1))
    {
      uint64_t v13 = result;
      uint64_t v14 = v8;
      uint64_t v15 = (__int128 *)(v8 + 96 * v9);
      __int128 v16 = v15[1];
      __int128 v44 = *v15;
      __int128 v45 = v16;
      __int128 v17 = v15[2];
      __int128 v18 = v15[3];
      __int128 v19 = v15[5];
      v48[0] = v15[4];
      v48[1] = v19;
      __int128 v46 = v17;
      __int128 v47 = v18;
      int64_t v20 = v9 + 1;
      int v51 = BYTE8(v45);
      if ((BYTE8(v45) & 1) != 0)
      {
        sub_18945C538(result, v8, v9 + 1, v10, (uint64_t)&v44);
        uint64_t v41 = v29;
        uint64_t result = (v28 >> 1) - v27;
        if (__OFSUB__(v28 >> 1, v27))
        {
LABEL_17:
          __break(1u);
          goto LABEL_18;
        }

        uint64_t v30 = v26;
        uint64_t v31 = v27;
        unint64_t v32 = v28;
        sub_189456D1C(result, v13, v14, v20, v11);
        unint64_t v37 = v33;
        int64_t v20 = v34;
        sub_1894570DC(v41, v30, v31, v32, v45, v42);
        uint64_t v21 = v42[0];
        uint64_t v39 = v42[1];
        uint64_t v22 = v42[2];
        __int128 v38 = v43;
        __int128 v40 = v46;
        uint64_t v24 = *((void *)&v47 + 1);
        uint64_t v25 = v47;
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        uint64_t result = swift_unknownObjectRelease();
        unint64_t v12 = v37 >> 1;
      }

      else
      {
        sub_18945ADDC((uint64_t)v48, (uint64_t)v49);
        uint64_t result = sub_18945ADDC((uint64_t)v49, (uint64_t)v50);
        uint64_t v21 = v50[0];
        if (!v50[0])
        {
LABEL_18:
          __break(1u);
          return result;
        }

        uint64_t v22 = v50[2];
        uint64_t v39 = v50[1];
        *((void *)&v23 + 1) = *((void *)&v46 + 1);
        __int128 v40 = v46;
        uint64_t v24 = *((void *)&v47 + 1);
        uint64_t v25 = v47;
        *(void *)&__int128 v23 = v50[3];
        __int128 v38 = v23;
        sub_18945AE64((uint64_t)v49);
        swift_unknownObjectRetain();
        uint64_t result = swift_unknownObjectRelease();
      }

      if (!__OFSUB__(v12, v20))
      {
        if (v12 == v20)
        {
          char v35 = BYTE8(v44);
          BOOL v36 = (v51 & 1) == 0;
          *(void *)a5 = v44;
          *(_BYTE *)(a5 + 8) = v35;
          *(void *)(a5 + 16) = v21;
          *(void *)(a5 + 24) = v39;
          *(void *)(a5 + 32) = v22;
          *(_OWORD *)(a5 + 40) = v38;
          *(_BYTE *)(a5 + 56) = v36;
          *(_OWORD *)(a5 + 64) = v40;
          *(void *)(a5 + 80) = v25;
          *(void *)(a5 + 88) = v24;
          return result;
        }

        goto LABEL_16;
      }

uint64_t sub_1894570DC@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  int64_t v6 = a4 >> 1;
  if (a4 >> 1 == a3)
  {
LABEL_7:
    *a6 = result;
    a6[1] = a2;
    a6[2] = a3;
    a6[3] = a4;
    a6[4] = a5;
  }

  else
  {
    int64_t v7 = (void *)(a2 + 96 * a3 + 16);
    uint64_t v8 = a3;
    do
    {
      if (v8 >= v6)
      {
        __break(1u);
LABEL_9:
        __break(1u);
        goto LABEL_10;
      }

      if (*v7 <= a5) {
        goto LABEL_9;
      }
      ++v8;
      v7 += 12;
    }

    while (v6 != v8);
    if (*(void *)(a2 + 96 * a3 + 16) == a5 + 1) {
      goto LABEL_7;
    }
LABEL_10:
    __break(1u);
  }

  return result;
}

uint64_t ASN1NodeCollection.hash(into:)(uint64_t a1)
{
  return sub_189473A58();
}

uint64_t static ASN1NodeCollection.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a2[4];
  return sub_18945B5D0(a1[1], a1[2], a1[3], a2[1], a2[2], a2[3]) & (v2 == v3);
}

uint64_t ASN1NodeCollection.hashValue.getter()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_189473A4C();
  sub_18945C3D0((uint64_t)v5, v1, v2, v3);
  sub_189473A58();
  return sub_189473A7C();
}

uint64_t sub_189457230()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_189473A4C();
  sub_18945C3D0((uint64_t)v5, v1, v2, v3);
  sub_189473A58();
  return sub_189473A7C();
}

uint64_t sub_18945729C(uint64_t a1)
{
  return sub_189473A58();
}

uint64_t sub_1894572D0()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_189473A4C();
  sub_18945C3D0((uint64_t)v5, v1, v2, v3);
  sub_189473A58();
  return sub_189473A7C();
}

uint64_t sub_189457338(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a2[4];
  return sub_18945B5D0(a1[1], a1[2], a1[3], a2[1], a2[2], a2[3]) & (v2 == v3);
}

__n128 sub_18945737C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  __n128 result = *(__n128 *)v1;
  __int128 v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v2;
  return result;
}

uint64_t sub_189457390()
{
  return 0LL;
}

uint64_t sub_189457398()
{
  return 2LL;
}

char *sub_1894573A0()
{
  __int128 v1 = *(_OWORD *)(v0 + 16);
  v4[0] = *(_OWORD *)v0;
  v4[1] = v1;
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v2 = sub_189464FB0((char *)v4);
  sub_18945E9DC((uint64_t)v4);
  return v2;
}

uint64_t sub_1894573E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18946850C(a1, a2, a3);
}

uint64_t sub_189457420()
{
  return sub_1894737D0();
}

void ASN1Node.identifier.getter(uint64_t a1@<X8>)
{
  char v2 = *(_BYTE *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t ASN1Node.identifier.setter(uint64_t result)
{
  char v2 = *(_BYTE *)(result + 8);
  *(void *)uint64_t v1 = *(void *)result;
  *(_BYTE *)(v1 + 8) = v2;
  return result;
}

uint64_t (*ASN1Node.identifier.modify())()
{
  return nullsub_1;
}

uint64_t ASN1Node.content.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = *(void *)(v1 + 48);
  char v6 = *(_BYTE *)(v1 + 56);
  *(void *)a1 = *(void *)(v1 + 16);
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  return j__swift_unknownObjectRetain();
}

__n128 ASN1Node.content.setter(__int128 *a1)
{
  __n128 v5 = (__n128)a1[1];
  __int128 v6 = *a1;
  uint64_t v2 = *((void *)a1 + 4);
  char v3 = *((_BYTE *)a1 + 40);
  j__swift_unknownObjectRelease( *(void *)(v1 + 16),  *(void *)(v1 + 24),  *(void *)(v1 + 32),  *(void *)(v1 + 40),  *(void *)(v1 + 48),  *(unsigned __int8 *)(v1 + 56));
  __n128 result = v5;
  *(_OWORD *)(v1 + 16) = v6;
  *(__n128 *)(v1 + 32) = v5;
  *(void *)(v1 + 48) = v2;
  *(_BYTE *)(v1 + 56) = v3;
  return result;
}

uint64_t (*ASN1Node.content.modify())()
{
  return nullsub_1;
}

uint64_t ASN1Node.encodedBytes.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t ASN1Node.encodedBytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = swift_unknownObjectRelease();
  v4[8] = a1;
  v4[9] = a2;
  v4[10] = a3;
  v4[11] = a4;
  return result;
}

uint64_t (*ASN1Node.encodedBytes.modify())()
{
  return nullsub_1;
}

uint64_t ASN1Node.hash(into:)(uint64_t a1)
{
  uint64_t v3 = v1[9];
  uint64_t v4 = v1[10];
  unint64_t v5 = v1[11];
  sub_189473A58();
  sub_189473A58();
  ASN1Node.Content.hash(into:)(a1);
  unint64_t v6 = v5 >> 1;
  uint64_t result = (v5 >> 1) - v4;
  if (__OFSUB__(v5 >> 1, v4))
  {
    __break(1u);
    goto LABEL_8;
  }

  uint64_t result = sub_189473A58();
  BOOL v8 = __OFSUB__(v6, v4);
  uint64_t v9 = v6 - v4;
  if (!v9) {
    return result;
  }
  if ((v9 < 0) ^ v8 | (v9 == 0))
  {
LABEL_8:
    __break(1u);
    return result;
  }

  uint64_t v10 = v3 + v4;
  do
  {
    ++v10;
    uint64_t result = sub_189473A64();
    --v9;
  }

  while (v9);
  return result;
}

uint64_t ASN1Node.hashValue.getter()
{
  char v1 = *((_BYTE *)v0 + 8);
  uint64_t v2 = v0[6];
  char v3 = *((_BYTE *)v0 + 56);
  uint64_t v8 = *v0;
  char v9 = v1;
  __int128 v4 = *((_OWORD *)v0 + 2);
  __int128 v10 = *((_OWORD *)v0 + 1);
  __int128 v11 = v4;
  uint64_t v12 = v2;
  char v13 = v3;
  __int128 v5 = *((_OWORD *)v0 + 5);
  __int128 v14 = *((_OWORD *)v0 + 4);
  __int128 v15 = v5;
  sub_189473A4C();
  ASN1Node.hash(into:)((uint64_t)v7);
  return sub_189473A7C();
}

uint64_t sub_1894576F0()
{
  char v1 = *((_BYTE *)v0 + 8);
  uint64_t v2 = v0[6];
  char v3 = *((_BYTE *)v0 + 56);
  uint64_t v8 = *v0;
  char v9 = v1;
  __int128 v4 = *((_OWORD *)v0 + 2);
  __int128 v10 = *((_OWORD *)v0 + 1);
  __int128 v11 = v4;
  uint64_t v12 = v2;
  char v13 = v3;
  __int128 v5 = *((_OWORD *)v0 + 5);
  __int128 v14 = *((_OWORD *)v0 + 4);
  __int128 v15 = v5;
  sub_189473A4C();
  ASN1Node.hash(into:)((uint64_t)v7);
  return sub_189473A7C();
}

uint64_t sub_189457768()
{
  char v1 = *((_BYTE *)v0 + 8);
  uint64_t v2 = v0[6];
  char v3 = *((_BYTE *)v0 + 56);
  uint64_t v8 = *v0;
  char v9 = v1;
  __int128 v4 = *((_OWORD *)v0 + 2);
  __int128 v10 = *((_OWORD *)v0 + 1);
  __int128 v11 = v4;
  uint64_t v12 = v2;
  char v13 = v3;
  __int128 v5 = *((_OWORD *)v0 + 5);
  __int128 v14 = *((_OWORD *)v0 + 4);
  __int128 v15 = v5;
  sub_189473A4C();
  ASN1Node.hash(into:)((uint64_t)v7);
  return sub_189473A7C();
}

uint64_t ASN1Node.Content.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 8);
  uint64_t v5 = *(void *)(v2 + 16);
  unint64_t v6 = *(void *)(v2 + 24);
  if ((*(_BYTE *)(v2 + 40) & 1) == 0)
  {
    sub_189473A58();
    sub_18945C3D0(a1, v4, v5, v6);
    return sub_189473A58();
  }

  sub_189473A58();
  unint64_t v7 = v6 >> 1;
  uint64_t result = v7 - v5;
  if (__OFSUB__(v7, v5))
  {
    __break(1u);
    goto LABEL_11;
  }

  uint64_t result = sub_189473A58();
  BOOL v9 = __OFSUB__(v7, v5);
  uint64_t v10 = v7 - v5;
  if (!v10) {
    return result;
  }
  if ((v10 < 0) ^ v9 | (v10 == 0))
  {
LABEL_11:
    __break(1u);
    return result;
  }

  uint64_t v11 = v4 + v5;
  do
  {
    ++v11;
    uint64_t result = sub_189473A64();
    --v10;
  }

  while (v10);
  return result;
}

uint64_t ASN1Node.Content.hashValue.getter()
{
  uint64_t v1 = *((void *)v0 + 4);
  char v2 = *((_BYTE *)v0 + 40);
  __int128 v3 = v0[1];
  __int128 v6 = *v0;
  __int128 v7 = v3;
  uint64_t v8 = v1;
  char v9 = v2;
  sub_189473A4C();
  ASN1Node.Content.hash(into:)((uint64_t)v5);
  return sub_189473A7C();
}

uint64_t sub_1894578E0()
{
  uint64_t v1 = *((void *)v0 + 4);
  char v2 = *((_BYTE *)v0 + 40);
  __int128 v3 = v0[1];
  __int128 v6 = *v0;
  __int128 v7 = v3;
  uint64_t v8 = v1;
  char v9 = v2;
  sub_189473A4C();
  ASN1Node.Content.hash(into:)((uint64_t)v5);
  return sub_189473A7C();
}

uint64_t sub_18945793C()
{
  uint64_t v1 = *((void *)v0 + 4);
  char v2 = *((_BYTE *)v0 + 40);
  __int128 v3 = v0[1];
  __int128 v6 = *v0;
  __int128 v7 = v3;
  uint64_t v8 = v1;
  char v9 = v2;
  sub_189473A4C();
  ASN1Node.Content.hash(into:)((uint64_t)v5);
  return sub_189473A7C();
}

uint64_t DER.Serializer.serializedBytes.getter()
{
  return swift_bridgeObjectRetain();
}

char *DER.Serializer.init()@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_18945AF98(0LL, 1024LL, 0, MEMORY[0x18961AFE8]);
  *a1 = result;
  return result;
}

uint64_t DER.Serializer.appendPrimitiveNode(identifier:_:)(uint64_t a1, uint64_t (*a2)(char **))
{
  char v3 = *(_BYTE *)(a1 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = v3;
  return sub_18945C5F8(&v5, 0, v2, a2);
}

uint64_t sub_189457A14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_18945DC58(a4);
}

uint64_t sub_189457A44(uint64_t *a1, char a2, uint64_t *a3)
{
  char v6 = *((_BYTE *)a1 + 8);
  uint64_t v15 = *a1;
  char v16 = v6;
  sub_189472E7C((uint64_t)&v15, a2);
  uint64_t v7 = *a3;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_29;
  }
  while (1)
  {
    unint64_t v10 = *(void *)(v7 + 16);
    unint64_t v9 = *(void *)(v7 + 24);
    unint64_t v11 = v10 + 1;
    if (v10 >= v9 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v9 > 1), v10 + 1, 1, (char *)v7);
      uint64_t v7 = result;
    }

    *(void *)(v7 + 16) = v11;
    *(_BYTE *)(v7 + 32 + v10) = 0;
    *a3 = v7;
    unint64_t v12 = *(void *)(v7 + 16);
    unint64_t v13 = v12 - v11;
    if (v12 <= v10)
    {
      __break(1u);
    }

    else
    {
      unint64_t v4 = 71 - __clz(v13);
      unint64_t v3 = v4 >> 3;
      sub_189458F84(v4 >> 3, v10 + 1, v12);
      uint64_t v7 = *a3;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) != 0) {
        goto LABEL_7;
      }
    }

    uint64_t result = (uint64_t)sub_189465604(v7);
    uint64_t v7 = result;
LABEL_7:
    if (v10 >= *(void *)(v7 + 16))
    {
      __break(1u);
      goto LABEL_33;
    }

    uint64_t v14 = v7 + 32;
    *(_BYTE *)(v7 + 32 + v10) = (v4 >> 3) | 0x80;
    *a3 = v7;
    if (v10 + 1 < *(void *)(v7 + 16))
    {
      *(_BYTE *)(v14 + v10 + 1) = v13 >> (8 * ((v3 - 1) & 7));
      if (v3 == 1) {
        goto LABEL_27;
      }
      if (v10 + 2 < *(void *)(v7 + 16))
      {
        *(_BYTE *)(v14 + v10 + 2) = v13 >> (8 * ((v3 - 2) & 7));
        if (v3 == 2) {
          goto LABEL_27;
        }
        if (v10 + 3 < *(void *)(v7 + 16))
        {
          *(_BYTE *)(v14 + v10 + 3) = v13 >> (8 * ((v3 - 3) & 7));
          if (v3 == 3) {
            goto LABEL_27;
          }
          if (v10 + 4 < *(void *)(v7 + 16))
          {
            *(_BYTE *)(v14 + v10 + 4) = v13 >> (8 * ((v3 - 4) & 7));
            if (v3 == 4) {
              goto LABEL_27;
            }
            if (v10 + 5 < *(void *)(v7 + 16))
            {
              *(_BYTE *)(v14 + v10 + 5) = v13 >> (8 * ((v3 - 5) & 7));
              if (v3 == 5) {
                goto LABEL_27;
              }
              if (v10 + 6 < *(void *)(v7 + 16))
              {
                *(_BYTE *)(v14 + v10 + 6) = v13 >> (8 * ((v3 - 6) & 7));
                if (v3 == 6) {
                  goto LABEL_27;
                }
                if (v10 + 7 < *(void *)(v7 + 16))
                {
                  *(_BYTE *)(v14 + v10 + 7) = v13 >> (8 * ((v3 - 7) & 7));
                  if (v3 == 7) {
                    goto LABEL_27;
                  }
                  if (v10 + 8 < *(void *)(v7 + 16))
                  {
                    *(_BYTE *)(v14 + v10 + 8) = v13 >> (v4 & 0x38);
LABEL_27:
                    *a3 = v7;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }

    __break(1u);
LABEL_29:
    uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v7 + 16) + 1LL, 1, (char *)v7);
    uint64_t v7 = result;
  }

  if ((v13 & 0x8000000000000000LL) != 0)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }

  if (v10 < v12)
  {
    *(_BYTE *)(v7 + 32 + v10) = v13;
    goto LABEL_27;
  }

LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_189457CC8(uint64_t *a1, char a2, uint64_t (*a3)(char **))
{
  char v6 = v3;
  char v8 = *((_BYTE *)a1 + 8);
  uint64_t v17 = *a1;
  char v18 = v8;
  sub_189472E7C((uint64_t)&v17, a2);
  unint64_t v9 = *v3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_32;
  }
  while (1)
  {
    unint64_t v11 = *((void *)v9 + 2);
    unint64_t v10 = *((void *)v9 + 3);
    unint64_t v12 = v11 + 1;
    if (v11 >= v10 >> 1) {
      unint64_t v9 = sub_18945AF98((char *)(v10 > 1), v11 + 1, 1, v9);
    }
    *((void *)v9 + 2) = v12;
    v9[v11 + 32] = 0;
    *char v6 = v9;
    uint64_t result = a3(v6);
    if (v4) {
      return result;
    }
    unint64_t v9 = *v6;
    unint64_t v14 = *((void *)*v6 + 2);
    unint64_t v15 = v14 - v12;
    if (v14 <= v11)
    {
      __break(1u);
    }

    else
    {
      unint64_t v5 = 71 - __clz(v15);
      a3 = (uint64_t (*)(char **))(v5 >> 3);
      sub_189458F84(v5 >> 3, v11 + 1, v14);
      unint64_t v9 = *v6;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) != 0) {
        goto LABEL_8;
      }
    }

    uint64_t result = (uint64_t)sub_189465604((uint64_t)v9);
    unint64_t v9 = (char *)result;
LABEL_8:
    if (v11 >= *((void *)v9 + 2))
    {
      __break(1u);
      goto LABEL_36;
    }

    char v16 = v9 + 32;
    v9[v11 + 32] = (v5 >> 3) | 0x80;
    *char v6 = v9;
    if (v11 + 1 < *((void *)v9 + 2))
    {
      v16[v11 + 1] = v15 >> (8 * (((_BYTE)a3 - 1) & 7u));
      if (v11 + 2 < *((void *)v9 + 2))
      {
        v16[v11 + 2] = v15 >> (8 * (((_BYTE)a3 - 2) & 7u));
        if (v11 + 3 < *((void *)v9 + 2))
        {
          v16[v11 + 3] = v15 >> (8 * (((_BYTE)a3 - 3) & 7u));
          if (v11 + 4 < *((void *)v9 + 2))
          {
            v16[v11 + 4] = v15 >> (8 * (((_BYTE)a3 - 4) & 7u));
            if (v11 + 5 < *((void *)v9 + 2))
            {
              v16[v11 + 5] = v15 >> (8 * (((_BYTE)a3 - 5) & 7u));
              if (v11 + 6 < *((void *)v9 + 2))
              {
                v16[v11 + 6] = v15 >> (8 * (((_BYTE)a3 - 6) & 7u));
                if (v11 + 7 < *((void *)v9 + 2))
                {
                  v16[v11 + 7] = v15 >> (8 * (((_BYTE)a3 - 7) & 7u));
                  if (v11 + 8 < *((void *)v9 + 2))
                  {
                    v16[v11 + 8] = v15 >> (v5 & 0x38);
LABEL_29:
                    *char v6 = v9;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }

    __break(1u);
LABEL_32:
    unint64_t v9 = sub_18945AF98(0LL, *((void *)v9 + 2) + 1LL, 1, v9);
  }

  if ((v15 & 0x8000000000000000LL) != 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }

  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0) {
    goto LABEL_27;
  }
LABEL_37:
  uint64_t result = (uint64_t)sub_189465604((uint64_t)v9);
  unint64_t v9 = (char *)result;
LABEL_27:
  if (v11 < *((void *)v9 + 2))
  {
    v9[v11 + 32] = v15;
    goto LABEL_29;
  }

  __break(1u);
  return result;
}

uint64_t DER.Serializer.appendConstructedNode(identifier:_:)(uint64_t a1, uint64_t (*a2)(char **))
{
  char v2 = *(_BYTE *)(a1 + 8);
  uint64_t v4 = *(void *)a1;
  char v5 = v2;
  return sub_189457CC8(&v4, 1, a2);
}

uint64_t DER.Serializer.serialize<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 8))(v3);
}

uint64_t DER.Serializer.serialize<A>(_:explicitlyTaggedWithTagNumber:tagClass:)( uint64_t a1, uint64_t a2, char *a3)
{
  char v3 = *a3;
  uint64_t v5 = a2;
  char v6 = v3;
  return sub_189457CC8(&v5, 1, (uint64_t (*)(char **))sub_18945C5D0);
}

uint64_t DER.Serializer.serialize<A>(_:explicitlyTaggedWithIdentifier:)(uint64_t a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_189457CC8(&v4, 1, (uint64_t (*)(char **))sub_18945C5D0);
}

uint64_t DER.Serializer.serializeOptionalImplicitlyTagged<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1894738A8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v6);
  unint64_t v10 = (char *)v15 - v9;
  uint64_t v11 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](v8);
  unint64_t v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v10, a2);
  (*(void (**)(void, uint64_t, uint64_t))(a3 + 8))(v15[1], a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, a2);
}

uint64_t DER.Serializer.serializeOptionalImplicitlyTagged<A>(_:withIdentifier:)( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a4;
  uint64_t v7 = sub_1894738A8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1895F8858](v7);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v12 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858](v9);
  unint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = *a2;
  char v16 = *((_BYTE *)a2 + 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, a3);
  uint64_t v20 = v15;
  char v21 = v16;
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v19 + 40))(v18, &v20, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, a3);
}

uint64_t DER.Serializer.serialize(explicitlyTaggedWithTagNumber:tagClass:_:)( uint64_t a1, char *a2, uint64_t (*a3)(char **))
{
  char v4 = *a2;
  uint64_t v6 = a1;
  char v7 = v4;
  return sub_18945C5F8(&v6, 1, v3, a3);
}

uint64_t DER.Serializer.serializeSequenceOf<A>(_:identifier:)(uint64_t a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_189457CC8(&v4, 1, (uint64_t (*)(char **))sub_18945C8CC);
}

uint64_t sub_1894583A0(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5)
{
  uint64_t v27 = a1;
  uint64_t v28 = a5;
  uint64_t v32 = a2;
  uint64_t v31 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = sub_1894738A8();
  uint64_t v11 = MEMORY[0x1895F8858](v10);
  uint64_t v13 = (char *)&v27 - v12;
  uint64_t v14 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858](v11);
  char v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v29 = *(void *)(v17 - 8);
  MEMORY[0x1895F8858](v17);
  uint64_t v19 = (char *)&v27 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v32, a3);
  sub_1894737AC();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v31 = v19;
  uint64_t v32 = v17;
  sub_1894738B4();
  uint64_t v21 = v33;
  uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48);
  if (v22(v13, 1LL, AssociatedTypeWitness) != 1)
  {
    uint64_t v30 = AssociatedConformanceWitness;
    uint64_t v23 = v27;
    uint64_t v24 = v28;
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
    while (1)
    {
      v25(v9, v13, AssociatedTypeWitness);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 8))(v23, AssociatedTypeWitness, v24);
      if (v5) {
        break;
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v9, AssociatedTypeWitness);
      sub_1894738B4();
      if (v22(v13, 1LL, AssociatedTypeWitness) == 1) {
        return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v31, v32);
      }
    }

    (*(void (**)(char *, uint64_t))(v33 + 8))(v9, AssociatedTypeWitness);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v31, v32);
}

uint64_t DER.Serializer.serializeSetOf<A>(_:identifier:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v7 = v5;
  uint64_t v11 = *(char **)a2;
  char v12 = *(_BYTE *)(a2 + 8);
  uint64_t v22 = sub_18945AF98(0LL, 1024LL, 0, MEMORY[0x18961AFE8]);
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = &v22;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C5058A8);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C505898);
  uint64_t v15 = (char *)sub_189453C88( (void (*)(char *, char *))sub_18945C8E8,  (uint64_t)v19,  a3,  v13,  v14,  a4,  MEMORY[0x18961A3E8],  (uint64_t)&v20);
  if (v6) {
    return swift_bridgeObjectRelease();
  }
  unint64_t v17 = (unint64_t)v22;
  uint64_t v20 = v15;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_18945DB60(&v20, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v18 = (uint64_t *)v20;
  uint64_t v20 = v11;
  char v21 = v12;
  sub_18945C908((uint64_t *)&v20, 1, v7, v18, v17);
  swift_release();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_1894587A8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X4>, void *a3@<X5>, unint64_t *a4@<X8>)
{
  unint64_t v9 = *(void *)(*(void *)a1 + 16LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 8))(a1, AssociatedTypeWitness, a2);
  if (v4)
  {
    *a3 = v4;
  }

  else
  {
    unint64_t v12 = *(void *)(*(void *)a1 + 16LL);
    if (v12 < v9)
    {
      __break(1u);
    }

    else
    {
      *a4 = v9;
      a4[1] = v12;
    }
  }

  return result;
}

void sub_189458858( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, int64_t a7, unint64_t a8)
{
  int64_t v8 = a4 >> 1;
  if (a4 >> 1 == a3) {
    goto LABEL_4;
  }
  int64_t v9 = a8 >> 1;
  if (a8 >> 1 == a7)
  {
LABEL_4:
    if (!__OFSUB__(v8, a3))
    {
      sub_189456D1C(v8 - a3, a5, a6, a7, a8);
      int64_t v13 = v12 >> 1;
      if (v11 == v12 >> 1)
      {
LABEL_20:
        swift_unknownObjectRetain();
        swift_unknownObjectRelease();
        return;
      }

      if (*(_BYTE *)(v10 + v11) || v11 + 1 == v13) {
        goto LABEL_20;
      }
      while (v11 + 1 < v13)
      {
        if (*(_BYTE *)(v10 + 1 + v11)) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = v13 - 2 == v11;
        }
        ++v11;
        if (v16) {
          goto LABEL_20;
        }
      }

      __break(1u);
    }

    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }

  if ((uint64_t)(a8 >> 1) <= a7)
  {
LABEL_36:
    __break(1u);
    return;
  }

  unsigned int v14 = *(unsigned __int8 *)(a2 + a3);
  unsigned int v15 = *(unsigned __int8 *)(a6 + a7);
  if (v14 >= v15 && v15 >= v14)
  {
    uint64_t v17 = 0LL;
    int64_t v18 = a7 + 1;
    while (~a3 + v8 != v17)
    {
      if (a3 + 1 + v17 >= v8) {
        goto LABEL_32;
      }
      if (~a7 + v9 == v17) {
        break;
      }
      if (v18 + v17 < a7 || v18 + v17 >= v9) {
        goto LABEL_33;
      }
      int v19 = *(unsigned __int8 *)(a2 + a3 + 1 + v17);
      int v20 = *(unsigned __int8 *)(a6 + a7 + 1 + v17++);
      if (v20 != v19) {
        return;
      }
    }

    goto LABEL_4;
  }

uint64_t DER.Serializer.serializeRawBytes<A>(_:)(uint64_t a1)
{
  return sub_1894737E8();
}

uint64_t DER.Serializer.serialize(_:)(__int128 *a1)
{
  __int128 v2 = a1[3];
  __int128 v3 = a1[4];
  __int128 v4 = a1[1];
  v11[1] = a1[2];
  v11[2] = v2;
  __int128 v5 = a1[5];
  v11[3] = v3;
  v11[4] = v5;
  __int128 v10 = *a1;
  v11[0] = v4;
  uint64_t v8 = *(void *)a1;
  char v9 = *((_BYTE *)a1 + 8);
  sub_18945DC00(v11, v12);
  sub_18945DC00(v12, &v13);
  char v6 = v14;
  sub_18945DC18((uint64_t)&v10);
  sub_18945C108(&v8, (v6 & 1) == 0, v1, (uint64_t)&v10);
  return sub_18945DC58((uint64_t)&v10);
}

uint64_t sub_189458B3C(uint64_t result, uint64_t a2)
{
  uint64_t v5 = v3;
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  unint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(unsigned __int8 *)(a2 + 56);
  uint64_t v38 = v6;
  if ((v11 & 1) != 0)
  {
    j__swift_unknownObjectRetain(v7, v6, v8, v9, v10, 1LL);
    sub_189469594(v7, v6, v8, v9);
    return j__swift_unknownObjectRelease(v7, v6, v8, v9, v10, v11);
  }

  else
  {
    unsigned int v33 = *(unsigned __int8 *)(a2 + 56);
    int64_t v12 = v9 >> 1;
    if (v8 != v9 >> 1)
    {
      uint64_t v37 = result;
      uint64_t v55 = v3;
      uint64_t v30 = v10;
      j__swift_unknownObjectRetain(v7, v6, v8, v9, v10, 0LL);
      uint64_t v35 = v7;
      unint64_t v36 = v9 & 0xFFFFFFFFFFFFFFFELL;
      swift_unknownObjectRetain();
      uint64_t v34 = v6 + 112;
      unint64_t v31 = v9;
      uint64_t v32 = v8;
      uint64_t v13 = v8;
      unint64_t v14 = v9;
      while (v13 < (uint64_t)(v14 >> 1))
      {
        if (v12 <= v13) {
          goto LABEL_46;
        }
        if (v14 >> 1 < v12) {
          goto LABEL_47;
        }
        uint64_t v15 = v6 + 96 * v13;
        uint64_t v16 = *(void *)v15;
        char v17 = *(_BYTE *)(v15 + 8);
        uint64_t v18 = *(unsigned __int8 *)(v15 + 24);
        __int128 v42 = *(_OWORD *)(v15 + 32);
        uint64_t v8 = v13 + 1;
        unint64_t v19 = v14 & 1;
        unint64_t v41 = v19;
        __int128 v40 = *(_OWORD *)(v15 + 48);
        if (*(_BYTE *)(v15 + 24))
        {
          uint64_t v4 = *(void *)(v15 + 16);
          if (v8 == v12)
          {
            uint64_t v20 = v12;
          }

          else
          {
            uint64_t v22 = (void *)(v34 + 96 * v13);
            uint64_t v20 = v13 + 1;
            do
            {
              if (v20 >= v12)
              {
LABEL_43:
                __break(1u);
LABEL_44:
                __break(1u);
                goto LABEL_45;
              }

              if (v4 >= *v22) {
                goto LABEL_19;
              }
              uint64_t v23 = v20 + 1;
              if (__OFADD__(v20, 1LL)) {
                goto LABEL_44;
              }
              ++v20;
              v22 += 12;
            }

            while (v23 != v12);
            uint64_t v20 = v12;
LABEL_19:
            if (v20 <= v13) {
              goto LABEL_48;
            }
            if (v20 < 0) {
              goto LABEL_49;
            }
          }

          uint64_t v24 = v20 - v8;
          if (__OFSUB__(v20, v8)) {
            goto LABEL_50;
          }
          if (v24 < 0) {
            goto LABEL_51;
          }
          int64_t v25 = v12 - v8;
          if (__OFSUB__(v12, v8)) {
            goto LABEL_52;
          }
          if (!v24 || v25 < 0 || (uint64_t v26 = v12, v25 >= v24))
          {
            uint64_t v26 = v20;
            if (__OFADD__(v8, v24)) {
              goto LABEL_55;
            }
            if (v12 < v20) {
              goto LABEL_53;
            }
          }

          if (v26 <= v13) {
            goto LABEL_54;
          }
          if (v8 != v20)
          {
            if (v8 >= v20) {
              goto LABEL_56;
            }
            uint64_t v27 = (uint64_t *)(v34 + 96 * v13);
            do
            {
              uint64_t v28 = *v27;
              v27 += 12;
              if (v4 >= v28)
              {
                __break(1u);
                goto LABEL_43;
              }

              --v24;
            }

            while (v24);
            if (*(void *)(v6 + 96 * v8 + 16) != v4 + 1) {
              goto LABEL_57;
            }
          }

          uint64_t v39 = v26;
          uint64_t v21 = v18;
          uint64_t v7 = v19 | (2 * v20);
          uint64_t v5 = v35;
          swift_unknownObjectRetain();
          uint64_t v2 = v8;
        }

        else
        {
          uint64_t v5 = *(void *)(v15 + 64);
          if (!v5) {
            goto LABEL_58;
          }
          uint64_t v21 = *(unsigned __int8 *)(v15 + 24);
          uint64_t v6 = *(void *)(v15 + 72);
          uint64_t v2 = *(void *)(v15 + 80);
          uint64_t v7 = *(void *)(v15 + 88);
          swift_unknownObjectRetain();
          uint64_t v4 = 0LL;
          uint64_t v39 = v8;
        }

        uint64_t v8 = v21 ^ 1;
        uint64_t v45 = v16;
        char v46 = v17;
        uint64_t v47 = v5;
        uint64_t v48 = v6;
        uint64_t v49 = v2;
        uint64_t v50 = v7;
        uint64_t v51 = v4;
        char v52 = v21 ^ 1;
        __int128 v53 = v42;
        __int128 v54 = v40;
        uint64_t v43 = v16;
        char v44 = v17;
        j__swift_unknownObjectRetain(v5, v6, v2, v7, v4, v8);
        swift_unknownObjectRetain();
        j__swift_unknownObjectRetain(v5, v6, v2, v7, v4, v8);
        swift_unknownObjectRetain_n();
        uint64_t v29 = v55;
        sub_189457A14((uint64_t)&v43, v21, v37, (uint64_t)&v45);
        uint64_t v55 = v29;
        if (v29) {
          goto LABEL_59;
        }
        unint64_t v14 = v41 | v36;
        j__swift_unknownObjectRelease(v5, v6, v2, v7, v4, v8);
        swift_unknownObjectRelease();
        j__swift_unknownObjectRelease(v5, v6, v2, v7, v4, v8);
        swift_unknownObjectRelease();
        uint64_t v6 = v38;
        uint64_t v13 = v39;
        if (v39 == v12)
        {
          uint64_t v7 = v35;
          swift_unknownObjectRelease();
          unint64_t v9 = v31;
          uint64_t v8 = v32;
          uint64_t v10 = v30;
          uint64_t v11 = v33;
          return j__swift_unknownObjectRelease(v7, v6, v8, v9, v10, v11);
        }
      }

LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      j__swift_unknownObjectRelease(v5, v6, v2, v7, v4, v8);
      swift_unknownObjectRelease();
      uint64_t result = swift_unexpectedError();
      __break(1u);
    }
  }

  return result;
}

uint64_t sub_189458F84(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < 1) {
    goto LABEL_28;
  }
  uint64_t v6 = a3;
  uint64_t v7 = *v4;
  uint64_t v8 = *(void *)(*v4 + 16);
  uint64_t v9 = v8 - a3;
  if (__OFSUB__(v8, a3)) {
    goto LABEL_29;
  }
  uint64_t v3 = a2;
  uint64_t v5 = result;
  if (v9 >= result) {
    goto LABEL_13;
  }
  uint64_t v10 = result - v9;
  if (__OFSUB__(result, v9))
  {
    __break(1u);
    goto LABEL_32;
  }

  if (v10 < 0)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    uint64_t result = (uint64_t)sub_18945AF98(0LL, v8 + 1, 1, (char *)v7);
    uint64_t v7 = result;
LABEL_8:
    unint64_t v11 = *(void *)(v7 + 16);
    do
    {
      unint64_t v12 = *(void *)(v7 + 24);
      if (v11 >= v12 >> 1)
      {
        uint64_t result = (uint64_t)sub_18945AF98((char *)(v12 > 1), v11 + 1, 1, (char *)v7);
        uint64_t v7 = result;
      }

      *(void *)(v7 + 16) = v11 + 1;
      *(_BYTE *)(v7 + v11++ + 32) = 0;
      --v10;
    }

    while (v10);
    *uint64_t v4 = v7;
    goto LABEL_13;
  }

  if (v10)
  {
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }

LABEL_13:
  if (v6 == v3) {
    return result;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_30;
  }
  do
  {
    while (1)
    {
      if (v6 <= v3)
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }

      unint64_t v13 = v6 - 1 + v5;
      if (__OFADD__(v6 - 1, v5)) {
        goto LABEL_24;
      }
      unint64_t v14 = v6 - 1;
      if (v6 < 1) {
        goto LABEL_25;
      }
      unint64_t v15 = *(void *)(v7 + 16);
      if (v14 >= v15) {
        goto LABEL_26;
      }
      if (v13 < v15) {
        break;
      }
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      uint64_t result = (uint64_t)sub_189465604(v7);
      uint64_t v7 = result;
    }

    *(_BYTE *)(v7 + 32 + v13) = *(_BYTE *)(v7 + v6-- + 31);
  }

  while (v14 != v3);
  *uint64_t v4 = v7;
  return result;
}

          sub_189465838(v5, v4, v7, v6);
          uint64_t v3 = v11;
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
          return v3;
        }

        goto LABEL_22;
      }
    }

    __break(1u);
LABEL_22:
    __break(1u);
  }

  __break(1u);
  return result;
}

          sub_18946588C(v5, v4, v7, v6);
          uint64_t v3 = v11;
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
          return v3;
        }

        goto LABEL_22;
      }
    }

    __break(1u);
LABEL_22:
    __break(1u);
  }

  __break(1u);
  return result;
}

          sub_1894659B4(v5, v4, v7, v6);
          uint64_t v3 = v11;
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
          return v3;
        }

        goto LABEL_22;
      }
    }

    __break(1u);
LABEL_22:
    __break(1u);
  }

  __break(1u);
  return result;
}

          sub_189465AE4(v5, v4, v7, v6);
          uint64_t v3 = v11;
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
          return v3;
        }

        goto LABEL_22;
      }
    }

    __break(1u);
LABEL_22:
    __break(1u);
  }

  __break(1u);
  return result;
}

  *uint64_t v1 = v4;
  return result;
}

  *uint64_t v1 = v4;
  return result;
}

  *uint64_t v3 = v6;
  return result;
}

      j__swift_unknownObjectRelease(v6, v5, v8, v7, v9, 1LL);
      return;
    }

uint64_t DERParseable.init(derEncoded:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (v9)
  {
    LOBYTE(v8) = v8 & 1;
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a3 + 8))(&v7, a2, a3);
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD00000000000002ALL,  0x8000000189475BB0LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  1026LL,  v6);
    return swift_willThrow();
  }

{
  uint64_t v3;
  uint64_t result;
  uint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  static DER.parse(_:)(a1, a1 + 32, 0LL, (2LL * *(void *)(a1 + 16)) | 1, (uint64_t)&v15);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v3)
  {
    uint64_t v7 = v15;
    int v8 = v16;
    uint64_t v9 = v17;
    uint64_t v10 = v18;
    unint64_t v11 = v19;
    unint64_t v12 = v20;
    unint64_t v13 = v21;
    unint64_t v14 = v22;
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a3 + 8))(&v7, a2, a3);
  }

  return result;
}

uint64_t DERParseable.init(derEncoded:)( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!v6)
  {
    uint64_t v10 = v18;
    char v11 = v19;
    __int128 v12 = v20;
    __int128 v13 = v21;
    uint64_t v14 = v22;
    char v15 = v23;
    __int128 v16 = v24;
    __int128 v17 = v25;
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(a6 + 8))(&v10, a5, a6);
  }

  return swift_unknownObjectRelease();
}

uint64_t DERImplicitlyTaggable.init(derEncoded:withIdentifier:)( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = *a5;
  char v11 = *((_BYTE *)a5 + 8);
  static DER.parse(_:)(a1, a2, a3, a4, (uint64_t)&v23);
  if (!v7)
  {
    uint64_t v15 = v23;
    char v16 = v24;
    __int128 v17 = v25;
    __int128 v18 = v26;
    uint64_t v19 = v27;
    char v20 = v28;
    __int128 v21 = v29;
    __int128 v22 = v30;
    uint64_t v13 = v10;
    char v14 = v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(a7 + 32))(&v15, &v13, a6, a7);
  }

  return swift_unknownObjectRelease();
}

uint64_t sub_189459530@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result;
  if (*(void *)result == 12LL && *(_BYTE *)(result + 8) == 0)
  {
    if (*(_BYTE *)(result + 56) == 1)
    {
      uint64_t v7 = *(void *)(result + 32);
      uint64_t v6 = *(void *)(result + 40);
      __int128 v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      uint64_t result = sub_18945DC58(v2);
      *(_OWORD *)a2 = v8;
      *(void *)(a2 + 16) = v7;
      *(void *)(a2 + 24) = v6;
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31LL, 2, 26LL, v5);
    sub_18945DC58(v2);
    return swift_willThrow();
  }

  return result;
}

uint64_t sub_189459614@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result;
  if (*(void *)result == 4LL && *(_BYTE *)(result + 8) == 0)
  {
    if (*(_BYTE *)(result + 56) == 1)
    {
      uint64_t v7 = *(void *)(result + 32);
      uint64_t v6 = *(void *)(result + 40);
      __int128 v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      uint64_t result = sub_18945DC58(v2);
      *(_OWORD *)a2 = v8;
      *(void *)(a2 + 16) = v7;
      *(void *)(a2 + 24) = v6;
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31LL, 2, 26LL, v5);
    sub_18945DC58(v2);
    return swift_willThrow();
  }

  return result;
}

uint64_t sub_1894596F8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result;
  if (*(void *)result == 20LL && *(_BYTE *)(result + 8) == 0)
  {
    if (*(_BYTE *)(result + 56) == 1)
    {
      uint64_t v7 = *(void *)(result + 32);
      uint64_t v6 = *(void *)(result + 40);
      __int128 v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      uint64_t result = sub_18945DC58(v2);
      *(_OWORD *)a2 = v8;
      *(void *)(a2 + 16) = v7;
      *(void *)(a2 + 24) = v6;
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31LL, 2, 26LL, v5);
    sub_18945DC58(v2);
    return swift_willThrow();
  }

  return result;
}

uint64_t sub_1894597DC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result;
  if (*(void *)result == 28LL && *(_BYTE *)(result + 8) == 0)
  {
    if (*(_BYTE *)(result + 56) == 1)
    {
      uint64_t v7 = *(void *)(result + 32);
      uint64_t v6 = *(void *)(result + 40);
      __int128 v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      uint64_t result = sub_18945DC58(v2);
      *(_OWORD *)a2 = v8;
      *(void *)(a2 + 16) = v7;
      *(void *)(a2 + 24) = v6;
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31LL, 2, 26LL, v5);
    sub_18945DC58(v2);
    return swift_willThrow();
  }

  return result;
}

uint64_t sub_1894598C0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result;
  if (*(void *)result == 30LL && *(_BYTE *)(result + 8) == 0)
  {
    if (*(_BYTE *)(result + 56) == 1)
    {
      uint64_t v7 = *(void *)(result + 32);
      uint64_t v6 = *(void *)(result + 40);
      __int128 v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      uint64_t result = sub_18945DC58(v2);
      *(_OWORD *)a2 = v8;
      *(void *)(a2 + 16) = v7;
      *(void *)(a2 + 24) = v6;
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31LL, 2, 26LL, v5);
    sub_18945DC58(v2);
    return swift_willThrow();
  }

  return result;
}

uint64_t DERImplicitlyTaggable.init(derEncoded:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  char v5 = *((_BYTE *)a1 + 8);
  uint64_t v6 = a1[6];
  char v7 = *((_BYTE *)a1 + 56);
  uint64_t v15 = *a1;
  char v16 = v5;
  __int128 v8 = *((_OWORD *)a1 + 2);
  __int128 v17 = *((_OWORD *)a1 + 1);
  __int128 v18 = v8;
  uint64_t v19 = v6;
  char v20 = v7;
  __int128 v9 = *((_OWORD *)a1 + 5);
  __int128 v21 = *((_OWORD *)a1 + 4);
  __int128 v22 = v9;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 24))(&v13, a2, a3);
  uint64_t v11 = v13;
  char v12 = v14;
  return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(a3 + 32))(&v15, &v11, a2, a3);
}

uint64_t DERImplicitlyTaggable.serialize(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 24))(&v9, a2, a3);
  uint64_t v7 = v9;
  char v8 = v10;
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(a3 + 40))(a1, &v7, a2, a3);
}

uint64_t sub_189459AF0@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8 = a1;
  uint64_t v34 = a5;
  uint64_t v32 = *(void *)(a2 - 8);
  uint64_t v9 = MEMORY[0x1895F8858](a1);
  unsigned int v33 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v9);
  __int128 v29 = (char *)v27 - v11;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v28 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v35 = (char *)v27 - v12;
  v27[1] = *(void *)(a4 + 8);
  uint64_t v13 = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](v13);
  uint64_t v31 = sub_189473830();
  if (v31 <= sub_1894739C8() / 8)
  {
    swift_getAssociatedConformanceWitness();
    sub_189473A10();
    sub_1894739F8();
    uint64_t result = sub_189473830();
    if ((unint64_t)(result - 0x1000000000000000LL) >> 61 == 7)
    {
      uint64_t v16 = sub_18945F73C(0LL, 8 * result, 8LL);
      sub_189473824();
      uint64_t v17 = a3;
      uint64_t v31 = v16;
      uint64_t v18 = *(void *)(v16 + 16);
      uint64_t v19 = v29;
      if (v18)
      {
        char v20 = (uint64_t *)(v31 + 32);
        uint64_t v38 = v8;
        uint64_t v36 = v17;
        __int128 v21 = v33;
        do
        {
          uint64_t v22 = *v20++;
          uint64_t v23 = (void (*)(void *, void))sub_189473890();
          char v25 = *v24;
          v23(v37, 0LL);
          LOBYTE(v37[0]) = v25;
          sub_18945EA04();
          sub_1894738D8();
          v37[0] = v22;
          sub_18945EA48();
          sub_1894738FC();
          __int128 v26 = *(void (**)(char *, uint64_t))(v32 + 8);
          v26(v21, a2);
          sub_189473908();
          v26(v19, a2);
          sub_18947383C();
          uint64_t v8 = v38;
          uint64_t v17 = v36;
          --v18;
        }

        while (v18);
      }

      (*(void (**)(uint64_t))(*(void *)(v17 - 8) + 8LL))(v8);
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v35, AssociatedTypeWitness);
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD00000000000001ALL,  0x8000000189475D80LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  1191LL,  v14);
    swift_willThrow();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8LL))(v8, a3);
  }

  return result;
}

uint64_t sub_189459EE4()
{
  uint64_t v0 = sub_189473920();
  uint64_t result = sub_1894739D4();
  uint64_t v2 = v0 - result;
  if (__OFSUB__(v0, result))
  {
    __break(1u);
  }

  else
  {
    BOOL v3 = __OFADD__(v2, 7LL);
    uint64_t v4 = v2 + 7;
    if (!v3) {
      return v4 / 8;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_189459F4C@<X0>(_OWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_189459FD4(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_18945FACC, a2);
}

uint64_t sub_189459F68(char **a1)
{
  char v5 = *v1;
  uint64_t v3 = 2LL;
  char v4 = 0;
  return sub_18945C5F8(&v3, 0, a1, (uint64_t (*)(char **))sub_18945E9BC);
}

uint64_t sub_189459FB8@<X0>(_OWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_189459FD4(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_18946042C, a2);
}

uint64_t sub_189459FD4@<X0>( _OWORD *a1@<X0>, uint64_t (*a2)(_OWORD *, uint64_t, void)@<X3>, _BYTE *a3@<X8>)
{
  __int128 v5 = a1[3];
  uint64_t v9[2] = a1[2];
  v9[3] = v5;
  __int128 v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  __int128 v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  uint64_t result = a2(v9, 2LL, 0LL);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_18945A028(char **a1)
{
  char v5 = *v1;
  uint64_t v3 = 2LL;
  char v4 = 0;
  return sub_18945C5F8(&v3, 0, a1, sub_18945E99C);
}

uint64_t sub_18945A078@<X0>(_OWORD *a1@<X0>, _WORD *a2@<X8>)
{
  return sub_18945A100(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_18945FD24, a2);
}

uint64_t sub_18945A094(char **a1)
{
  __int16 v5 = *v1;
  uint64_t v3 = 2LL;
  char v4 = 0;
  return sub_18945C5F8(&v3, 0, a1, (uint64_t (*)(char **))sub_18945E97C);
}

uint64_t sub_18945A0E4@<X0>(_OWORD *a1@<X0>, _WORD *a2@<X8>)
{
  return sub_18945A100(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_1894606D0, a2);
}

uint64_t sub_18945A100@<X0>( _OWORD *a1@<X0>, uint64_t (*a2)(_OWORD *, uint64_t, void)@<X3>, _WORD *a3@<X8>)
{
  __int128 v5 = a1[3];
  uint64_t v9[2] = a1[2];
  v9[3] = v5;
  __int128 v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  __int128 v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  uint64_t result = a2(v9, 2LL, 0LL);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_18945A154(char **a1)
{
  __int16 v5 = *v1;
  uint64_t v3 = 2LL;
  char v4 = 0;
  return sub_18945C5F8(&v3, 0, a1, sub_18945E95C);
}

uint64_t sub_18945A1A4@<X0>(_OWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_18945A22C(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_18945FF7C, a2);
}

uint64_t sub_18945A1C0(char **a1)
{
  int v5 = *v1;
  uint64_t v3 = 2LL;
  char v4 = 0;
  return sub_18945C5F8(&v3, 0, a1, (uint64_t (*)(char **))sub_18945E93C);
}

uint64_t sub_18945A210@<X0>(_OWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_18945A22C(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_189460974, a2);
}

uint64_t sub_18945A22C@<X0>( _OWORD *a1@<X0>, uint64_t (*a2)(_OWORD *, uint64_t, void)@<X3>, _DWORD *a3@<X8>)
{
  __int128 v5 = a1[3];
  uint64_t v9[2] = a1[2];
  v9[3] = v5;
  __int128 v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  __int128 v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  uint64_t result = a2(v9, 2LL, 0LL);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_18945A280(char **a1)
{
  int v5 = *v1;
  uint64_t v3 = 2LL;
  char v4 = 0;
  return sub_18945C5F8(&v3, 0, a1, sub_18945E91C);
}

uint64_t sub_18945A2D0@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_18945A3C4(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_18945F808, a2);
}

uint64_t sub_18945A2EC(char **a1)
{
  uint64_t v5 = *v1;
  uint64_t v3 = 2LL;
  char v4 = 0;
  return sub_18945C5F8(&v3, 0, a1, (uint64_t (*)(char **))sub_18945E8FC);
}

uint64_t sub_18945A33C@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_18945A3C4(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_189460C18, a2);
}

uint64_t sub_18945A358(char **a1)
{
  uint64_t v5 = *v1;
  uint64_t v3 = 2LL;
  char v4 = 0;
  return sub_18945C5F8(&v3, 0, a1, sub_18945E8D8);
}

uint64_t sub_18945A3A8@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_18945A3C4(a1, (uint64_t (*)(_OWORD *, uint64_t, void))sub_18945F81C, a2);
}

uint64_t sub_18945A3C4@<X0>( _OWORD *a1@<X0>, uint64_t (*a2)(_OWORD *, uint64_t, void)@<X3>, uint64_t *a3@<X8>)
{
  __int128 v5 = a1[3];
  uint64_t v9[2] = a1[2];
  v9[3] = v5;
  __int128 v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  __int128 v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  uint64_t result = a2(v9, 2LL, 0LL);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_18945A418@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  char v4 = *((_BYTE *)a1 + 8);
  uint64_t v5 = a1[6];
  char v6 = *((_BYTE *)a1 + 56);
  uint64_t v12 = *a1;
  char v13 = v4;
  __int128 v7 = *((_OWORD *)a1 + 2);
  __int128 v14 = *((_OWORD *)a1 + 1);
  __int128 v15 = v7;
  uint64_t v16 = v5;
  char v17 = v6;
  __int128 v8 = *((_OWORD *)a1 + 5);
  __int128 v18 = *((_OWORD *)a1 + 4);
  __int128 v19 = v8;
  uint64_t v10 = 6LL;
  char v11 = 0;
  uint64_t result = ASN1ObjectIdentifier.init(derEncoded:withIdentifier:)((uint64_t)&v12, (uint64_t)&v10, &v20);
  if (!v2) {
    *a2 = v20;
  }
  return result;
}

uint64_t sub_18945A494(char **a1)
{
  uint64_t v2 = 6LL;
  char v3 = 0;
  return sub_18945C5F8(&v2, 0, a1, (uint64_t (*)(char **))sub_18945E8C0);
}

uint64_t sub_18945A4DC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  char v4 = *((_BYTE *)a1 + 8);
  uint64_t v5 = a1[6];
  char v6 = *((_BYTE *)a1 + 56);
  uint64_t v12 = *a1;
  char v13 = v4;
  __int128 v7 = *((_OWORD *)a1 + 2);
  __int128 v14 = *((_OWORD *)a1 + 1);
  __int128 v15 = v7;
  uint64_t v16 = v5;
  char v17 = v6;
  __int128 v8 = *((_OWORD *)a1 + 5);
  __int128 v18 = *((_OWORD *)a1 + 4);
  __int128 v19 = v8;
  uint64_t v10 = 1LL;
  char v11 = 0;
  uint64_t result = sub_18946B82C((uint64_t)&v12, (uint64_t)&v10);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_18945A554(char **a1)
{
  uint64_t v2 = 1LL;
  char v3 = 0;
  return sub_18945C5F8(&v2, 0, a1, (uint64_t (*)(char **))sub_18945E8A8);
}

uint64_t sub_18945A59C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  __int128 v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  __int128 v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_189459530((uint64_t)v6, a2);
}

uint64_t sub_18945A5D4(char **a1)
{
  uint64_t v2 = 12LL;
  char v3 = 0;
  return sub_18945C5F8(&v2, 0, a1, (uint64_t (*)(char **))sub_18945ED84);
}

uint64_t sub_18945A61C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  __int128 v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  __int128 v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_1894596F8((uint64_t)v6, a2);
}

uint64_t sub_18945A654(char **a1)
{
  uint64_t v2 = 20LL;
  char v3 = 0;
  return sub_18945C5F8(&v2, 0, a1, (uint64_t (*)(char **))sub_18945ED84);
}

double sub_18945A69C@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_18945A824( a1,  19LL,  (void (*)(_OWORD *__return_ptr, uint64_t *, uint64_t *))ASN1PrintableString.init(derEncoded:withIdentifier:),  a2);
}

uint64_t sub_18945A6BC(char **a1)
{
  uint64_t v2 = 19LL;
  char v3 = 0;
  return sub_18945C5F8(&v2, 0, a1, (uint64_t (*)(char **))sub_18945ED84);
}

uint64_t sub_18945A704@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  __int128 v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  __int128 v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_1894597DC((uint64_t)v6, a2);
}

uint64_t sub_18945A73C(char **a1)
{
  uint64_t v2 = 28LL;
  char v3 = 0;
  return sub_18945C5F8(&v2, 0, a1, (uint64_t (*)(char **))sub_18945ED84);
}

uint64_t sub_18945A784@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  __int128 v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  __int128 v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_1894598C0((uint64_t)v6, a2);
}

uint64_t sub_18945A7BC(char **a1)
{
  uint64_t v2 = 30LL;
  char v3 = 0;
  return sub_18945C5F8(&v2, 0, a1, (uint64_t (*)(char **))sub_18945ED84);
}

double sub_18945A804@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_18945A824( a1,  22LL,  (void (*)(_OWORD *__return_ptr, uint64_t *, uint64_t *))ASN1IA5String.init(derEncoded:withIdentifier:),  a2);
}

double sub_18945A824@<D0>( uint64_t *a1@<X0>, uint64_t a2@<X3>, void (*a3)(_OWORD *__return_ptr, uint64_t *, uint64_t *)@<X4>, _OWORD *a4@<X8>)
{
  char v6 = *((_BYTE *)a1 + 8);
  uint64_t v7 = a1[6];
  char v8 = *((_BYTE *)a1 + 56);
  uint64_t v15 = *a1;
  char v16 = v6;
  __int128 v9 = *((_OWORD *)a1 + 2);
  __int128 v17 = *((_OWORD *)a1 + 1);
  __int128 v18 = v9;
  uint64_t v19 = v7;
  char v20 = v8;
  __int128 v10 = *((_OWORD *)a1 + 5);
  __int128 v21 = *((_OWORD *)a1 + 4);
  __int128 v22 = v10;
  uint64_t v13 = a2;
  char v14 = 0;
  a3(v23, &v15, &v13);
  if (!v4)
  {
    double result = *(double *)v23;
    __int128 v12 = v23[1];
    *a4 = v23[0];
    a4[1] = v12;
  }

  return result;
}

uint64_t sub_18945A89C(char **a1)
{
  uint64_t v2 = 22LL;
  char v3 = 0;
  return sub_18945C5F8(&v2, 0, a1, (uint64_t (*)(char **))sub_18945ED84);
}

uint64_t sub_18945A8E4@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  __int128 v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  __int128 v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_189459614((uint64_t)v6, a2);
}

uint64_t sub_18945A91C(char **a1)
{
  uint64_t v2 = 4LL;
  char v3 = 0;
  return sub_18945C5F8(&v2, 0, a1, (uint64_t (*)(char **))sub_18945E88C);
}

double sub_18945A964@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  char v4 = *((_BYTE *)a1 + 8);
  uint64_t v5 = a1[6];
  char v6 = *((_BYTE *)a1 + 56);
  uint64_t v13 = *a1;
  char v14 = v4;
  __int128 v7 = *((_OWORD *)a1 + 2);
  __int128 v15 = *((_OWORD *)a1 + 1);
  __int128 v16 = v7;
  uint64_t v17 = v5;
  char v18 = v6;
  __int128 v8 = *((_OWORD *)a1 + 5);
  __int128 v19 = *((_OWORD *)a1 + 4);
  __int128 v20 = v8;
  uint64_t v11 = 23LL;
  char v12 = 0;
  UTCTime.init(derEncoded:withIdentifier:)((uint64_t)&v13, (uint64_t)&v11, v21);
  if (!v2)
  {
    __int128 v10 = v21[1];
    *a2 = v21[0];
    a2[1] = v10;
    double result = *(double *)&v22;
    a2[2] = v22;
  }

  return result;
}

uint64_t sub_18945A9E8(char **a1)
{
  __int128 v2 = v1[1];
  __int128 v6 = *v1;
  __int128 v7 = v2;
  __int128 v8 = v1[2];
  uint64_t v4 = 23LL;
  char v5 = 0;
  return sub_18945C5F8(&v4, 0, a1, (uint64_t (*)(char **))sub_18945E874);
}

uint64_t sub_18945AA40(char **a1)
{
  __int128 v2 = v1[1];
  __int128 v6 = *v1;
  __int128 v7 = v2;
  uint64_t v4 = 2LL;
  char v5 = 0;
  return sub_18945C5F8(&v4, 0, a1, sub_18945E85C);
}

uint64_t sub_18945AA90@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  __int128 v4 = a1[3];
  v11[2] = a1[2];
  v11[3] = v4;
  __int128 v5 = a1[5];
  v11[4] = a1[4];
  __int128 v11[5] = v5;
  __int128 v6 = a1[1];
  v11[0] = *a1;
  v11[1] = v6;
  uint64_t result = sub_18945F838((uint64_t)v11, 2LL, 0);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v8;
    a2[2] = v9;
    a2[3] = v10;
  }

  return result;
}

double sub_18945AAE8@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  char v4 = *((_BYTE *)a1 + 8);
  uint64_t v5 = a1[6];
  char v6 = *((_BYTE *)a1 + 56);
  uint64_t v13 = *a1;
  char v14 = v4;
  __int128 v7 = *((_OWORD *)a1 + 2);
  __int128 v15 = *((_OWORD *)a1 + 1);
  __int128 v16 = v7;
  uint64_t v17 = v5;
  char v18 = v6;
  __int128 v8 = *((_OWORD *)a1 + 5);
  __int128 v19 = *((_OWORD *)a1 + 4);
  __int128 v20 = v8;
  uint64_t v11 = 24LL;
  char v12 = 0;
  GeneralizedTime.init(derEncoded:withIdentifier:)((uint64_t)&v13, (uint64_t)&v11, (uint64_t)v21);
  if (!v2)
  {
    double result = v22;
    __int128 v10 = v21[1];
    *(_OWORD *)a2 = v21[0];
    *(_OWORD *)(a2 + 16) = v10;
    *(_OWORD *)(a2 + 32) = v21[2];
    *(double *)(a2 + 48) = result;
  }

  return result;
}

uint64_t sub_18945AB74(char **a1)
{
  __int128 v2 = v1[1];
  __int128 v6 = *v1;
  __int128 v7 = v2;
  __int128 v8 = v1[2];
  uint64_t v9 = *((void *)v1 + 6);
  uint64_t v4 = 24LL;
  char v5 = 0;
  return sub_18945C5F8(&v4, 0, a1, (uint64_t (*)(char **))sub_18945E844);
}

uint64_t sub_18945ABD4(uint64_t *a1)
{
  char v1 = *((_BYTE *)a1 + 8);
  uint64_t v2 = a1[6];
  char v3 = *((_BYTE *)a1 + 56);
  uint64_t v9 = *a1;
  char v10 = v1;
  __int128 v4 = *((_OWORD *)a1 + 2);
  __int128 v11 = *((_OWORD *)a1 + 1);
  __int128 v12 = v4;
  uint64_t v13 = v2;
  char v14 = v3;
  __int128 v5 = *((_OWORD *)a1 + 5);
  __int128 v15 = *((_OWORD *)a1 + 4);
  __int128 v16 = v5;
  uint64_t v7 = 5LL;
  char v8 = 0;
  return ASN1Null.init(derEncoded:withIdentifier:)((uint64_t)&v9, (uint64_t)&v7);
}

uint64_t sub_18945AC34(uint64_t *a1)
{
  uint64_t v2 = 5LL;
  char v3 = 0;
  return sub_189457A44(&v2, 0, a1);
}

double sub_18945AC68@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  char v4 = *((_BYTE *)a1 + 8);
  uint64_t v5 = a1[6];
  char v6 = *((_BYTE *)a1 + 56);
  uint64_t v14 = *a1;
  char v15 = v4;
  __int128 v7 = *((_OWORD *)a1 + 2);
  __int128 v16 = *((_OWORD *)a1 + 1);
  __int128 v17 = v7;
  uint64_t v18 = v5;
  char v19 = v6;
  __int128 v8 = *((_OWORD *)a1 + 5);
  __int128 v20 = *((_OWORD *)a1 + 4);
  __int128 v21 = v8;
  uint64_t v12 = 3LL;
  char v13 = 0;
  ASN1BitString.init(derEncoded:withIdentifier:)((uint64_t)&v14, (uint64_t)&v12, v22);
  if (!v2)
  {
    uint64_t v10 = v23;
    double result = *(double *)v22;
    __int128 v11 = v22[1];
    *(_OWORD *)a2 = v22[0];
    *(_OWORD *)(a2 + 16) = v11;
    *(void *)(a2 + 32) = v10;
  }

  return result;
}

uint64_t sub_18945ACEC(char **a1)
{
  __int128 v2 = v1[1];
  __int128 v6 = *v1;
  __int128 v7 = v2;
  uint64_t v8 = *((void *)v1 + 4);
  uint64_t v4 = 3LL;
  char v5 = 0;
  return sub_18945C5F8(&v4, 0, a1, sub_18945E82C);
}

unint64_t sub_18945AD44()
{
  unint64_t result = qword_18C797618;
  if (!qword_18C797618)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1Error, &type metadata for ASN1Error);
    atomic_store(result, (unint64_t *)&qword_18C797618);
  }

  return result;
}

uint64_t sub_18945AD8C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  if (a9)
  {
    j__swift_unknownObjectRelease(a3, a4, a5, a6, a7, a8 & 1);
    return swift_unknownObjectRelease();
  }

  return result;
}

uint64_t sub_18945ADDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C505890);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E6DA0]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_18945AE64(uint64_t a1)
{
  return a1;
}

char *sub_18945AE8C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_18945AEA4(a1, a2, a3, a4, &qword_18C5058B8);
}

char *sub_18945AE98(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_18945AEA4(a1, a2, a3, a4, &qword_18C797650);
}

char *sub_18945AEA4(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v8 = a2;
  }

  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    __int128 v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    __int128 v11 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v14 = v11 + 32;
  char v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 8 * v9);
  }

  swift_bridgeObjectRelease();
  return v11;
}

char *sub_18945AF98(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
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

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C5058C8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  int64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v12, v13, v8);
  }

  swift_bridgeObjectRelease();
  return v10;
}

char *sub_18945B080(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C5058D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 96);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  int64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[96 * v8]) {
      memmove(v12, v13, 96 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy();
  }

  swift_bridgeObjectRelease();
  return v10;
}

char *sub_18945B198(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C5058C0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, 16 * v8);
  }

  swift_bridgeObjectRelease();
  return v10;
}

char *sub_18945B290(uint64_t a1)
{
  return sub_18945B198(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_18945B2A4(uint64_t *a1, int64_t *a2)
{
  return sub_189461294(*a2, a1);
}

uint64_t sub_18945B2C4(char **a1, unint64_t *a2)
{
  return sub_1894612C0(*a2, a1);
}

uint64_t sub_18945B2E4(uint64_t *a1, unsigned __int8 *a2)
{
  return sub_1894614B0(*a2, a1);
}

uint64_t sub_18945B304(uint64_t *a1, unsigned __int16 *a2)
{
  return sub_189461594(*a2, a1);
}

uint64_t sub_18945B324(uint64_t *a1, unsigned int *a2)
{
  return sub_189461668(*a2, a1);
}

uint64_t sub_18945B344(char **a1, unsigned __int8 *a2)
{
  return sub_189461814(*a2, a1);
}

uint64_t sub_18945B364(char **a1, unsigned __int16 *a2)
{
  return sub_189461998(*a2, a1);
}

uint64_t sub_18945B384(char **a1, unsigned int *a2)
{
  return sub_189461B28(*a2, a1);
}

uint64_t sub_18945B3A4( uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int64_t v6 = a3 >> 1;
  uint64_t v7 = (a3 >> 1) - a2;
  if (!__OFSUB__(a3 >> 1, a2))
  {
    int64_t v8 = a6 >> 1;
    if (__OFSUB__(a6 >> 1, a5)) {
      goto LABEL_20;
    }
    if (v7 != (a6 >> 1) - a5) {
      return 0LL;
    }
    if (!v7 || result + a2 == a4 + a5 || v6 == a2) {
      return 1LL;
    }
    if (v6 <= a2) {
      goto LABEL_22;
    }
    uint64_t v9 = a2 + 1;
    int v10 = *(unsigned __int8 *)(result + a2);
    if (v6 == a2) {
      return 1LL;
    }
    uint64_t v11 = a5;
    if (v8 == a5) {
      return 0LL;
    }
    while (v11 >= a5 && v11 < v8)
    {
      if (v6 == v9) {
        return 1LL;
      }
      if (v9 >= v6) {
        goto LABEL_21;
      }
      int v10 = *(unsigned __int8 *)(result + v9++);
      if (v8 == ++v11) {
        return 0LL;
      }
    }

    __break(1u);
  }

  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_18945B478(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (*(void *)a1 == *(void *)a2
    && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8)
    && *(void *)(a1 + 16) == *(void *)(a2 + 16)
    && ((*(unsigned __int8 *)(a1 + 24) ^ *(unsigned __int8 *)(a2 + 24)) & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 80);
    unint64_t v6 = *(void *)(a1 + 88);
    uint64_t v7 = *(void *)(a2 + 72);
    uint64_t v8 = *(void *)(a2 + 80);
    unint64_t v9 = *(void *)(a2 + 88);
    uint64_t v10 = *(void *)(a2 + 64);
    uint64_t v11 = *(void *)(a1 + 64);
    if ((sub_18945B3A4( *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a2 + 40),  *(void *)(a2 + 48),  *(void *)(a2 + 56)) & 1) != 0)
    {
      if (v11)
      {
        if (v10 && (sub_18945B3A4(v4, v5, v6, v7, v8, v9) & 1) != 0) {
          return 1LL;
        }
      }

      else if (!v10)
      {
        return 1LL;
      }
    }

    return 0LL;
  }

  return result;
}

unint64_t sub_18945B550()
{
  unint64_t result = qword_18C5058A0;
  if (!qword_18C5058A0)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1NodeCollection,  &type metadata for ASN1NodeCollection);
    atomic_store(result, (unint64_t *)&qword_18C5058A0);
  }

  return result;
}

uint64_t sub_18945B594(uint64_t *a1, void *a2)
{
  return sub_189454ACC(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_18945B5B4(uint64_t *a1)
{
  return sub_189455D58(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_18945B5D0( uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int64_t v6 = a3 >> 1;
  uint64_t v7 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
  {
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    return result;
  }

  uint64_t v8 = a5;
  int64_t v9 = a6 >> 1;
  if (__OFSUB__(a6 >> 1, a5)) {
    goto LABEL_44;
  }
  if (v7 != (a6 >> 1) - a5) {
    return 0LL;
  }
  if (!v7) {
    return 1LL;
  }
  uint64_t v10 = a4;
  uint64_t v11 = result + 96 * a2;
  if (v11 == a4 + 96 * a5) {
    return 1LL;
  }
  unint64_t v50 = a6 >> 1;
  if (v6 != a2)
  {
    uint64_t v18 = a5;
    if (v6 > a2) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }

  uint64_t v47 = a2;
  int64_t v48 = a3 >> 1;
  uint64_t v45 = result;
  uint64_t v64 = 0LL;
  uint64_t v67 = 0LL;
  uint64_t v68 = 0LL;
  uint64_t v12 = 0LL;
  char v13 = 0;
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  unint64_t v69 = 0LL;
  uint64_t v66 = 0LL;
  uint64_t v56 = 0LL;
  uint64_t v57 = 0LL;
  unint64_t v16 = 0LL;
  uint64_t v17 = a5;
  uint64_t v18 = a5;
LABEL_10:
  __int128 v21 = (unint64_t *)(v10 + 96 * v17 + 88);
  uint64_t v52 = v17;
  while (1)
  {
    if (!v14) {
      return 1LL;
    }
    uint64_t v65 = v13 & 1;
    if (v9 == v18)
    {
      uint64_t v22 = v12;
      uint64_t v31 = 0LL;
      uint64_t v32 = 0LL;
      uint64_t v33 = 0LL;
      uint64_t v27 = 0LL;
      uint64_t v34 = 0LL;
      uint64_t v35 = 0LL;
      uint64_t v36 = 0LL;
      uint64_t v37 = 0LL;
      uint64_t v25 = 0LL;
      uint64_t v38 = 0LL;
      uint64_t v26 = 0LL;
LABEL_33:
      v70[0] = v64;
      v70[1] = v68;
      v70[2] = v22;
      v70[3] = v65;
      v70[4] = v14;
      v70[5] = v15;
      v70[6] = v67;
      v70[7] = v69;
      v70[8] = v66;
      v70[9] = v57;
      v70[10] = v56;
      v70[11] = v16;
      v70[12] = v26;
      v70[13] = v38;
      v70[14] = v25;
      v70[15] = v37;
      v70[16] = 0LL;
      v70[17] = v36;
      v70[18] = v35;
      v70[19] = v34;
      v70[20] = v27;
      v70[21] = v33;
      v70[22] = v32;
      v70[23] = v31;
      sub_18945EA8C(v70);
      return 0LL;
    }

    if (v17 < v8 || v18 >= v9) {
      goto LABEL_45;
    }
    uint64_t v53 = v18;
    uint64_t v22 = v12;
    uint64_t v23 = *(v21 - 7);
    uint64_t v62 = *((unsigned __int8 *)v21 - 64);
    uint64_t v63 = *((unsigned __int8 *)v21 - 80);
    unint64_t v54 = *v21;
    uint64_t v55 = *(v21 - 1);
    uint64_t v24 = *(v21 - 3);
    uint64_t v60 = *(v21 - 6);
    unint64_t v61 = *(v21 - 4);
    uint64_t v58 = *(v21 - 2);
    uint64_t v59 = *(v21 - 5);
    uint64_t v25 = *(v21 - 9);
    uint64_t v26 = *(v21 - 11);
    swift_unknownObjectRetain();
    uint64_t v27 = v24;
    swift_unknownObjectRetain();
    if (!v23)
    {
      uint64_t v38 = v63;
      uint64_t v36 = v60;
      uint64_t v34 = v61;
      uint64_t v33 = v58;
      uint64_t v35 = v59;
      uint64_t v37 = v62;
      uint64_t v31 = v54;
      uint64_t v32 = v55;
      goto LABEL_33;
    }

    if (v64 != v26)
    {
      uint64_t v29 = v22;
      uint64_t v39 = v22;
      uint64_t v30 = v64;
      sub_18945EB7C(v64, v68, v39, v65, v14);
      uint64_t v40 = v23;
      uint64_t v41 = v26;
      uint64_t v28 = v65;
      uint64_t v42 = v63;
      uint64_t v43 = v25;
LABEL_38:
      uint64_t v44 = v62;
      goto LABEL_39;
    }

    if (v63 != v68)
    {
      sub_18945EB7C(v64, v68, v22, v65, v14);
      uint64_t v40 = v23;
      uint64_t v29 = v22;
      uint64_t v41 = v64;
      uint64_t v30 = v64;
      uint64_t v42 = v63;
      uint64_t v43 = v25;
      uint64_t v28 = v65;
      goto LABEL_38;
    }

    uint64_t v28 = v65;
    if (v22 != v25)
    {
      sub_18945EB7C(v64, v68, v22, v65, v14);
      uint64_t v40 = v23;
      uint64_t v29 = v22;
      uint64_t v30 = v64;
      uint64_t v41 = v64;
      uint64_t v42 = v63;
      uint64_t v43 = v25;
      uint64_t v28 = v65;
      goto LABEL_38;
    }

    if ((_DWORD)v62 != (_DWORD)v65 || (sub_18945B3A4(v15, v67, v69, v60, v59, v61) & 1) == 0)
    {
      sub_18945EB7C(v64, v68, v22, v65, v14);
      uint64_t v40 = v23;
      uint64_t v29 = v22;
      uint64_t v28 = v65;
      uint64_t v30 = v64;
      uint64_t v41 = v64;
      uint64_t v42 = v63;
      uint64_t v43 = v29;
      goto LABEL_38;
    }

    if (v66)
    {
      if (!v24) {
        break;
      }
      char v49 = sub_18945B3A4(v57, v56, v16, v58, v55, v54);
      sub_18945EB7C(v64, v68, v22, v65, v14);
      uint64_t v28 = v65;
      uint64_t v29 = v22;
      uint64_t v30 = v64;
      sub_18945EB4C(v64, v63, v29, v62, v23);
      if ((v49 & 1) == 0) {
        goto LABEL_40;
      }
      goto LABEL_27;
    }

    if (v24) {
      break;
    }
    uint64_t v29 = v22;
    sub_18945EB7C(v64, v68, v22, v65, v14);
    uint64_t v30 = v64;
    sub_18945EB4C(v64, v63, v29, v62, v23);
LABEL_27:
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    unint64_t result = sub_18945EB4C(v30, v68, v29, v28, v14);
    uint64_t v64 = 0LL;
    uint64_t v67 = 0LL;
    uint64_t v68 = 0LL;
    uint64_t v12 = 0LL;
    char v13 = 0;
    uint64_t v14 = 0LL;
    uint64_t v15 = 0LL;
    unint64_t v69 = 0LL;
    uint64_t v66 = 0LL;
    uint64_t v56 = 0LL;
    uint64_t v57 = 0LL;
    unint64_t v16 = 0LL;
    v21 += 12;
    uint64_t v18 = v53 + 1;
    int64_t v9 = v50;
    uint64_t v8 = a5;
    uint64_t v17 = v52;
    if (v47 != v48)
    {
      if (v47 >= v48) {
        goto LABEL_47;
      }
      unint64_t result = v45;
      uint64_t v10 = a4;
      a2 = v47;
      int64_t v6 = v48;
      uint64_t v11 = v45 + 96 * v47;
LABEL_9:
      int64_t v48 = v6;
      uint64_t v45 = result;
      uint64_t v19 = result + 96 * a2;
      uint64_t v14 = *(void *)(v19 + 32);
      uint64_t v15 = *(void *)(v19 + 40);
      uint64_t v20 = a2 + 1;
      char v13 = *(_BYTE *)(v19 + 24);
      uint64_t v68 = *(unsigned __int8 *)(v11 + 8);
      unint64_t v16 = *(void *)(v19 + 88);
      uint64_t v56 = *(void *)(v19 + 80);
      uint64_t v57 = *(void *)(v19 + 72);
      unint64_t v69 = *(void *)(v19 + 56);
      uint64_t v66 = *(void *)(v19 + 64);
      uint64_t v67 = *(void *)(v19 + 48);
      uint64_t v12 = *(void *)(v19 + 16);
      uint64_t v64 = *(void *)v11;
      swift_unknownObjectRetain();
      unint64_t result = swift_unknownObjectRetain();
      uint64_t v17 = v18;
      uint64_t v47 = v20;
      goto LABEL_10;
    }
  }

  sub_18945EB7C(v64, v68, v22, v65, v14);
  uint64_t v28 = v65;
  uint64_t v29 = v22;
  uint64_t v30 = v64;
  uint64_t v41 = v64;
  uint64_t v44 = v62;
  uint64_t v42 = v63;
  uint64_t v43 = v29;
  uint64_t v40 = v23;
LABEL_39:
  sub_18945EB4C(v41, v42, v43, v44, v40);
LABEL_40:
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_18945EB4C(v30, v68, v29, v28, v14);
  return 0LL;
}

uint64_t _s9SwiftASN10B4NodeV7ContentO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  unint64_t v3 = a1[3];
  uint64_t v5 = a1[4];
  uint64_t v6 = *((unsigned __int8 *)a1 + 40);
  uint64_t v8 = *a2;
  uint64_t v7 = a2[1];
  uint64_t v10 = a2[2];
  unint64_t v9 = a2[3];
  uint64_t v11 = a2[4];
  uint64_t v12 = *((unsigned __int8 *)a2 + 40);
  if ((v6 & 1) != 0)
  {
    if ((v12 & 1) != 0)
    {
      uint64_t v26 = *a2;
      uint64_t v13 = a2[1];
      uint64_t v14 = a2[4];
      uint64_t v15 = *a1;
      char v23 = sub_18945B3A4(v2, v4, v3, v7, v10, v9);
      j__swift_unknownObjectRetain(v15, v2, v4, v3, v5, 1LL);
      j__swift_unknownObjectRetain(v26, v13, v10, v9, v14, 1LL);
      j__swift_unknownObjectRelease(v15, v2, v4, v3, v5, 1LL);
      j__swift_unknownObjectRelease(v26, v13, v10, v9, v14, 1LL);
      return v23 & 1;
    }

    goto LABEL_5;
  }

  if ((v12 & 1) != 0)
  {
LABEL_5:
    uint64_t v22 = a1[4];
    uint64_t v24 = a1[3];
    uint64_t v17 = a2[1];
    uint64_t v18 = *a1;
    j__swift_unknownObjectRetain(*a1, v2, v4, v24, v22, v6);
    j__swift_unknownObjectRetain(v8, v17, v10, v9, v11, v12);
    j__swift_unknownObjectRelease(v18, v2, v4, v24, v22, v6);
    j__swift_unknownObjectRelease(v8, v17, v10, v9, v11, v12);
    return 0LL;
  }

  uint64_t v27 = *a2;
  uint64_t v19 = a2[1];
  uint64_t v20 = a2[4];
  uint64_t v21 = *a1;
  j__swift_unknownObjectRetain(v8, v7, v10, v9, v20, 0LL);
  j__swift_unknownObjectRetain(v21, v2, v4, v3, v5, 0LL);
  j__swift_unknownObjectRetain(v21, v2, v4, v3, v5, 0LL);
  j__swift_unknownObjectRetain(v27, v19, v10, v9, v20, 0LL);
  unsigned __int8 v25 = sub_18945B5D0(v2, v4, v3, v19, v10, v9);
  j__swift_unknownObjectRelease(v21, v2, v4, v3, v5, 0LL);
  j__swift_unknownObjectRelease(v27, v19, v10, v9, v20, 0LL);
  j__swift_unknownObjectRelease(v27, v19, v10, v9, v20, 0LL);
  j__swift_unknownObjectRelease(v21, v2, v4, v3, v5, 0LL);
  return v25 & (v5 == v20);
}

uint64_t _s9SwiftASN10B4NodeV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  unint64_t v5 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 80);
  unint64_t v8 = *(void *)(a2 + 88);
  char v9 = *(_BYTE *)(a2 + 56);
  uint64_t v10 = *(void *)(a2 + 48);
  char v11 = *(_BYTE *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 48);
  __int128 v13 = *(_OWORD *)(a1 + 32);
  v19[0] = *(_OWORD *)(a1 + 16);
  v19[1] = v13;
  uint64_t v20 = v12;
  char v21 = v11;
  __int128 v14 = *(_OWORD *)(a2 + 32);
  v16[0] = *(_OWORD *)(a2 + 16);
  v16[1] = v14;
  uint64_t v17 = v10;
  char v18 = v9;
  else {
    return 0LL;
  }
}

uint64_t sub_18945C108(uint64_t *a1, char a2, uint64_t a3, uint64_t a4)
{
  char v8 = *((_BYTE *)a1 + 8);
  uint64_t v17 = *a1;
  char v18 = v8;
  sub_189472E7C((uint64_t)&v17, a2);
  char v9 = *(char **)a3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_32;
  }
  while (1)
  {
    unint64_t v11 = *((void *)v9 + 2);
    unint64_t v10 = *((void *)v9 + 3);
    unint64_t v12 = v11 + 1;
    if (v11 >= v10 >> 1) {
      char v9 = sub_18945AF98((char *)(v10 > 1), v11 + 1, 1, v9);
    }
    *((void *)v9 + 2) = v12;
    v9[v11 + 32] = 0;
    *(void *)a3 = v9;
    uint64_t result = sub_189458B3C(a3, a4);
    if (v4) {
      return result;
    }
    a4 = *(void *)a3;
    unint64_t v14 = *(void *)(*(void *)a3 + 16LL);
    unint64_t v15 = v14 - v12;
    if (v14 <= v11)
    {
      __break(1u);
    }

    else
    {
      unint64_t v5 = 71 - __clz(v15);
      char v9 = (char *)(v5 >> 3);
      sub_189458F84(v5 >> 3, v11 + 1, v14);
      a4 = *(void *)a3;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) != 0) {
        goto LABEL_8;
      }
    }

    uint64_t result = (uint64_t)sub_189465604(a4);
    a4 = result;
LABEL_8:
    if (v11 >= *(void *)(a4 + 16))
    {
      __break(1u);
      goto LABEL_36;
    }

    uint64_t v16 = a4 + 32;
    *(_BYTE *)(a4 + 32 + v11) = (v5 >> 3) | 0x80;
    *(void *)a3 = a4;
    if (v11 + 1 < *(void *)(a4 + 16))
    {
      *(_BYTE *)(v16 + v11 + 1) = v15 >> (8 * (((_BYTE)v9 - 1) & 7u));
      if (v11 + 2 < *(void *)(a4 + 16))
      {
        *(_BYTE *)(v16 + v11 + 2) = v15 >> (8 * (((_BYTE)v9 - 2) & 7u));
        if (v11 + 3 < *(void *)(a4 + 16))
        {
          *(_BYTE *)(v16 + v11 + 3) = v15 >> (8 * (((_BYTE)v9 - 3) & 7u));
          if (v11 + 4 < *(void *)(a4 + 16))
          {
            *(_BYTE *)(v16 + v11 + 4) = v15 >> (8 * (((_BYTE)v9 - 4) & 7u));
            if (v11 + 5 < *(void *)(a4 + 16))
            {
              *(_BYTE *)(v16 + v11 + 5) = v15 >> (8 * (((_BYTE)v9 - 5) & 7u));
              if (v11 + 6 < *(void *)(a4 + 16))
              {
                *(_BYTE *)(v16 + v11 + 6) = v15 >> (8 * (((_BYTE)v9 - 6) & 7u));
                if (v11 + 7 < *(void *)(a4 + 16))
                {
                  *(_BYTE *)(v16 + v11 + 7) = v15 >> (8 * (((_BYTE)v9 - 7) & 7u));
                  if (v11 + 8 < *(void *)(a4 + 16))
                  {
                    *(_BYTE *)(v16 + v11 + 8) = v15 >> (v5 & 0x38);
LABEL_29:
                    *(void *)a3 = a4;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }

    __break(1u);
LABEL_32:
    char v9 = sub_18945AF98(0LL, *((void *)v9 + 2) + 1LL, 1, v9);
  }

  if ((v15 & 0x8000000000000000LL) != 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }

  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0) {
    goto LABEL_27;
  }
LABEL_37:
  uint64_t result = (uint64_t)sub_189465604(a4);
  a4 = result;
LABEL_27:
  if (v11 < *(void *)(a4 + 16))
  {
    *(_BYTE *)(a4 + v11 + 32) = v15;
    goto LABEL_29;
  }

  __break(1u);
  return result;
}

uint64_t sub_18945C3D0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t result = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_25:
    __break(1u);
    return result;
  }

  uint64_t v6 = a3;
  uint64_t result = sub_189473A58();
  if (v4 != v6)
  {
    uint64_t v21 = v4;
    while (v6 < v4)
    {
      uint64_t v7 = (void *)(a2 + 96 * v6);
      uint64_t v8 = v7[5];
      uint64_t v9 = v7[6];
      uint64_t v10 = v7[10];
      uint64_t v23 = v7[9];
      unint64_t v24 = v7[11];
      unint64_t v12 = v7[7];
      uint64_t v11 = v7[8];
      sub_189473A58();
      sub_189473A58();
      sub_189473A58();
      sub_189473A64();
      unint64_t v13 = v12 >> 1;
      uint64_t result = (v12 >> 1) - v9;
      if (__OFSUB__(v12 >> 1, v9)) {
        goto LABEL_21;
      }
      uint64_t result = sub_189473A58();
      BOOL v14 = __OFSUB__(v13, v9);
      uint64_t v15 = v13 - v9;
      if (v15)
      {
        if ((v15 < 0) ^ v14 | (v15 == 0)) {
          goto LABEL_23;
        }
        uint64_t v16 = v8 + v9;
        do
        {
          ++v16;
          sub_189473A64();
          --v15;
        }

        while (v15);
      }

      if (v11)
      {
        sub_189473A64();
        unint64_t v17 = v24 >> 1;
        uint64_t result = (v24 >> 1) - v10;
        if (__OFSUB__(v24 >> 1, v10)) {
          goto LABEL_22;
        }
        uint64_t result = sub_189473A58();
        BOOL v18 = __OFSUB__(v17, v10);
        uint64_t v19 = v17 - v10;
        if (v19)
        {
          if ((v19 < 0) ^ v18 | (v19 == 0)) {
            goto LABEL_24;
          }
          uint64_t v20 = v23 + v10;
          do
          {
            ++v20;
            uint64_t result = sub_189473A64();
            --v19;
          }

          while (v19);
        }
      }

      else
      {
        uint64_t result = sub_189473A64();
      }

      ++v6;
      int64_t v4 = v21;
      if (v6 == v21) {
        return result;
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

  return result;
}

void sub_18945C538(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  int64_t v5 = a4 >> 1;
  int64_t v6 = a3;
  if (a4 >> 1 != a3)
  {
    uint64_t v7 = (void *)(a2 + 96 * a3 + 16);
    int64_t v6 = a3;
    while (1)
    {
      if (v6 >= v5)
      {
        __break(1u);
        goto LABEL_13;
      }

      if (*(void *)(a5 + 16) >= *v7) {
        break;
      }
      ++v6;
      v7 += 12;
      if (v5 == v6)
      {
        int64_t v6 = a4 >> 1;
        break;
      }
    }

    if (v6 >= a3) {
      goto LABEL_8;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

LABEL_8:
  if (v5 < a3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  if (v5 < v6)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  if (v6 < 0) {
LABEL_16:
  }
    __break(1u);
}

uint64_t sub_18945C5BC(uint64_t *a1, char a2, char **a3, uint64_t (*a4)(char **))
{
  return sub_18945C5F8(a1, a2, a3, a4);
}

uint64_t sub_18945C5D0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 + 24) + 8LL))(a1, *(void *)(v1 + 16));
}

uint64_t sub_18945C5F8(uint64_t *a1, char a2, char **a3, uint64_t (*a4)(char **))
{
  char v8 = *((_BYTE *)a1 + 8);
  uint64_t v17 = *a1;
  char v18 = v8;
  sub_189472E7C((uint64_t)&v17, a2);
  uint64_t v9 = *a3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_32;
  }
  while (1)
  {
    unint64_t v11 = *((void *)v9 + 2);
    unint64_t v10 = *((void *)v9 + 3);
    unint64_t v12 = v11 + 1;
    if (v11 >= v10 >> 1) {
      uint64_t v9 = sub_18945AF98((char *)(v10 > 1), v11 + 1, 1, v9);
    }
    *((void *)v9 + 2) = v12;
    v9[v11 + 32] = 0;
    *a3 = v9;
    uint64_t result = a4(a3);
    if (v4) {
      return result;
    }
    uint64_t v9 = *a3;
    unint64_t v14 = *((void *)*a3 + 2);
    unint64_t v15 = v14 - v12;
    if (v14 <= v11)
    {
      __break(1u);
    }

    else
    {
      unint64_t v5 = 71 - __clz(v15);
      a4 = (uint64_t (*)(char **))(v5 >> 3);
      sub_189458F84(v5 >> 3, v11 + 1, v14);
      uint64_t v9 = *a3;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) != 0) {
        goto LABEL_8;
      }
    }

    uint64_t result = (uint64_t)sub_189465604((uint64_t)v9);
    uint64_t v9 = (char *)result;
LABEL_8:
    if (v11 >= *((void *)v9 + 2))
    {
      __break(1u);
      goto LABEL_36;
    }

    uint64_t v16 = v9 + 32;
    v9[v11 + 32] = (v5 >> 3) | 0x80;
    *a3 = v9;
    if (v11 + 1 < *((void *)v9 + 2))
    {
      v16[v11 + 1] = v15 >> (8 * (((_BYTE)a4 - 1) & 7u));
      if (v11 + 2 < *((void *)v9 + 2))
      {
        v16[v11 + 2] = v15 >> (8 * (((_BYTE)a4 - 2) & 7u));
        if (v11 + 3 < *((void *)v9 + 2))
        {
          v16[v11 + 3] = v15 >> (8 * (((_BYTE)a4 - 3) & 7u));
          if (v11 + 4 < *((void *)v9 + 2))
          {
            v16[v11 + 4] = v15 >> (8 * (((_BYTE)a4 - 4) & 7u));
            if (v11 + 5 < *((void *)v9 + 2))
            {
              v16[v11 + 5] = v15 >> (8 * (((_BYTE)a4 - 5) & 7u));
              if (v11 + 6 < *((void *)v9 + 2))
              {
                v16[v11 + 6] = v15 >> (8 * (((_BYTE)a4 - 6) & 7u));
                if (v11 + 7 < *((void *)v9 + 2))
                {
                  v16[v11 + 7] = v15 >> (8 * (((_BYTE)a4 - 7) & 7u));
                  if (v11 + 8 < *((void *)v9 + 2))
                  {
                    v16[v11 + 8] = v15 >> (v5 & 0x38);
LABEL_29:
                    *a3 = v9;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }

    __break(1u);
LABEL_32:
    uint64_t v9 = sub_18945AF98(0LL, *((void *)v9 + 2) + 1LL, 1, v9);
  }

  if ((v15 & 0x8000000000000000LL) != 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }

  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0) {
    goto LABEL_27;
  }
LABEL_37:
  uint64_t result = (uint64_t)sub_189465604((uint64_t)v9);
  uint64_t v9 = (char *)result;
LABEL_27:
  if (v11 < *((void *)v9 + 2))
  {
    v9[v11 + 32] = v15;
    goto LABEL_29;
  }

  __break(1u);
  return result;
}

uint64_t sub_18945C8CC(uint64_t a1)
{
  return sub_1894583A0(a1, *(void *)(v1 + 40), *(void *)(v1 + 16), *(char **)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_18945C8E8@<X0>(void *a1@<X1>, unint64_t *a2@<X8>)
{
  return sub_1894587A8(*(void *)(v2 + 40), *(void *)(v2 + 32), a1, a2);
}

uint64_t sub_18945C908(uint64_t *a1, char a2, char **a3, uint64_t *a4, unint64_t a5)
{
  uint64_t v7 = v5;
  char v11 = *((_BYTE *)a1 + 8);
  uint64_t v24 = *a1;
  char v25 = v11;
  sub_189472E7C((uint64_t)&v24, a2);
  unint64_t v12 = *a3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_43;
  }
  while (1)
  {
    unint64_t v14 = *((void *)v12 + 2);
    unint64_t v13 = *((void *)v12 + 3);
    uint64_t v15 = v14 + 1;
    if (v14 >= v13 >> 1) {
      unint64_t v12 = sub_18945AF98((char *)(v13 > 1), v14 + 1, 1, v12);
    }
    *((void *)v12 + 2) = v15;
    v12[v14 + 32] = 0;
    *a3 = v12;
    uint64_t v16 = a4[2];
    if (v16)
    {
      uint64_t v26 = v7;
      unint64_t v12 = (char *)(a5 + 32);
      uint64_t v7 = *(void *)(a5 + 16);
      swift_bridgeObjectRetain();
      a4 += 5;
      while (1)
      {
        uint64_t v17 = *(a4 - 1);
        if (v17 < 0) {
          break;
        }
        uint64_t v18 = *a4;
        if (v7 < v17 || v7 < v18) {
          goto LABEL_40;
        }
        if (v18 < 0) {
          goto LABEL_41;
        }
        a4 += 2;
        unint64_t v6 = (2 * v18) | 1;
        uint64_t v20 = swift_bridgeObjectRetain();
        sub_189469594(v20, a5 + 32, v17, v6);
        swift_bridgeObjectRelease();
        if (!--v16)
        {
          swift_bridgeObjectRelease();
          unint64_t v12 = *a3;
          uint64_t v7 = v26;
          uint64_t v15 = v14 + 1;
          goto LABEL_14;
        }
      }

      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }

LABEL_42:
    __break(1u);
LABEL_43:
    unint64_t v12 = sub_18945AF98(0LL, *((void *)v12 + 2) + 1LL, 1, v12);
  }

  if ((a5 & 0x8000000000000000LL) != 0)
  {
LABEL_45:
    __break(1u);
LABEL_46:
    uint64_t result = (uint64_t)sub_189465604((uint64_t)v12);
    unint64_t v12 = (char *)result;
    goto LABEL_17;
  }

  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0) {
    goto LABEL_36;
  }
LABEL_48:
  uint64_t result = (uint64_t)sub_189465604((uint64_t)v12);
  unint64_t v12 = (char *)result;
LABEL_36:
  if (v14 < *((void *)v12 + 2))
  {
    v12[v14 + 32] = a5;
    goto LABEL_38;
  }

  __break(1u);
  return result;
}

uint64_t sub_18945CC58(uint64_t __src, uint64_t *__dst, unint64_t a3, char *a4, uint64_t a5)
{
  unint64_t v6 = __dst;
  uint64_t v7 = (uint64_t *)__src;
  uint64_t v8 = (uint64_t)__dst - __src;
  uint64_t v9 = (uint64_t)__dst - __src + 15;
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)__dst;
  uint64_t v12 = a3 - (void)__dst + 15;
  uint64_t v13 = v12 >> 4;
  if (v10 < v12 >> 4)
  {
    unint64_t v14 = (int64_t *)a4;
    uint64_t v15 = &a4[16 * v10];
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      uint64_t v16 = *(void *)(a5 + 16);
      while (1)
      {
        uint64_t v17 = *v6;
        if (*v6 < 0)
        {
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
          goto LABEL_80;
        }

        uint64_t v18 = v6[1];
        if (v18 < 0) {
          goto LABEL_75;
        }
        int64_t v19 = *v14;
        if (*v14 < 0) {
          goto LABEL_76;
        }
        int64_t v20 = v14[1];
        if (v16 < v17 || v16 < v18 || v16 < v19 || v16 < v20) {
          goto LABEL_77;
        }
        if (v20 < 0) {
          goto LABEL_78;
        }
        uint64_t v24 = v6;
        char v25 = v15;
        unint64_t v26 = (2 * v18) | 1;
        unint64_t v27 = (2 * v20) | 1;
        uint64_t v28 = swift_bridgeObjectRetain();
        sub_189458858(v28, a5 + 32, v17, v26, a5, a5 + 32, v19, v27);
        LOBYTE(v27) = v29;
        __src = swift_bridgeObjectRelease();
        if ((v27 & 1) == 0) {
          break;
        }
        uint64_t v30 = v24;
        unint64_t v6 = v24 + 2;
        uint64_t v15 = v25;
        if (v7 != v24) {
          goto LABEL_30;
        }
LABEL_31:
        v7 += 2;
        if (v14 >= (int64_t *)v15 || (unint64_t)v6 >= a3)
        {
          unint64_t v6 = v7;
          goto LABEL_70;
        }
      }

      uint64_t v30 = v14;
      BOOL v31 = v7 == v14;
      v14 += 2;
      unint64_t v6 = v24;
      uint64_t v15 = v25;
      if (v31) {
        goto LABEL_31;
      }
LABEL_30:
      *(_OWORD *)uint64_t v7 = *(_OWORD *)v30;
      goto LABEL_31;
    }

    unint64_t v6 = v7;
LABEL_70:
    if (v6 != v14
      || v6 >= (int64_t *)((char *)v14
                                + ((v15 - (char *)v14 + (v15 - (char *)v14 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0LL)))
    {
      memmove(v6, v14, 16 * ((v15 - (char *)v14) / 16));
    }

    return 1LL;
  }

  uint64_t v15 = &a4[16 * v13];
  unint64_t v14 = (int64_t *)a4;
  if (v7 >= v6 || v11 < 16) {
    goto LABEL_70;
  }
  unint64_t v50 = (int64_t *)a4;
  uint64_t v51 = *(void *)(a5 + 16);
  uint64_t v32 = (uint64_t *)(a3 - 16);
  char v49 = v7;
  while (1)
  {
    uint64_t v34 = v15 - 16;
    uint64_t v33 = *((void *)v15 - 2);
    if (v33 < 0) {
      goto LABEL_79;
    }
    uint64_t v35 = *((void *)v15 - 1);
    if (v35 < 0) {
      break;
    }
    uint64_t v36 = v6 - 2;
    int64_t v37 = *(v6 - 2);
    if (v37 < 0) {
      goto LABEL_81;
    }
    uint64_t v38 = *(v6 - 1);
    if (v51 < v33 || v51 < v35 || v51 < v37 || v51 < v38) {
      goto LABEL_82;
    }
    if (v38 < 0) {
      goto LABEL_83;
    }
    uint64_t v53 = (uint64_t *)v15;
    uint64_t v42 = v32 + 2;
    unint64_t v43 = (2 * v35) | 1;
    unint64_t v44 = (2 * v38) | 1;
    uint64_t v45 = swift_bridgeObjectRetain();
    sub_189458858(v45, a5 + 32, v33, v43, a5, a5 + 32, v37, v44);
    LOBYTE(v43) = v46;
    __src = swift_bridgeObjectRelease();
    if ((v43 & 1) == 0)
    {
      unint64_t v47 = (unint64_t)v49;
      uint64_t v36 = (uint64_t *)v34;
      if (v42 == v53)
      {
        uint64_t v15 = v34;
        unint64_t v14 = v50;
        if (v32 < v53) {
          goto LABEL_66;
        }
        goto LABEL_65;
      }

      uint64_t v15 = v34;
LABEL_64:
      unint64_t v14 = v50;
LABEL_65:
      *(_OWORD *)uint64_t v32 = *(_OWORD *)v36;
      goto LABEL_66;
    }

    unint64_t v47 = (unint64_t)v49;
    uint64_t v15 = (char *)v53;
    if (v42 != v6)
    {
      v6 -= 2;
      goto LABEL_64;
    }

    BOOL v48 = v32 >= v6;
    v6 -= 2;
    unint64_t v14 = v50;
    if (v48) {
      goto LABEL_65;
    }
LABEL_66:
    if ((unint64_t)v6 > v47)
    {
      v32 -= 2;
    }

    goto LABEL_70;
  }

LABEL_80:
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
  return __src;
}

uint64_t sub_18945CFF0(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = a1[1];
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_1894739E0();
  uint64_t v174 = a2;
  uint64_t v162 = v5;
  if (v6 < v5)
  {
    if (v5 >= 0) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = v5 + 1;
    }
    if (v5 < -1)
    {
LABEL_258:
      __break(1u);
      goto LABEL_259;
    }

    uint64_t v157 = v6;
    uint64_t v170 = v2;
    v154 = a1;
    if (v5 <= 1)
    {
      uint64_t v11 = MEMORY[0x18961AFE8];
      v161 = (char *)(MEMORY[0x18961AFE8] + 32LL);
      if (v5 != 1)
      {
        unint64_t v71 = *(void *)(MEMORY[0x18961AFE8] + 16LL);
        unint64_t v14 = (char *)MEMORY[0x18961AFE8];
        goto LABEL_191;
      }

      uint64_t v156 = MEMORY[0x18961AFE8];
    }

    else
    {
      uint64_t v8 = v7 >> 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C5058A8);
      uint64_t v9 = sub_1894737DC();
      *(void *)(v9 + 16) = v8;
      uint64_t v156 = v9;
      v161 = (char *)(v9 + 32);
    }

    uint64_t v12 = 0LL;
    uint64_t v13 = *a1;
    uint64_t v165 = a2 + 32;
    uint64_t v155 = *a1 + 40;
    uint64_t v153 = *a1 - 16;
    uint64_t v158 = a2 + 33;
    unint64_t v14 = (char *)MEMORY[0x18961AFE8];
    uint64_t v171 = *a1;
LABEL_15:
    while (2)
    {
      uint64_t v15 = v12++;
      v160 = v14;
      *(void *)v167 = v15;
      if (v12 >= v5) {
        goto LABEL_59;
      }
      uint64_t v16 = (uint64_t *)(v13 + 16 * v12);
      uint64_t v17 = *v16;
      if (*v16 < 0) {
        goto LABEL_252;
      }
      uint64_t v18 = v16[1];
      if (v18 < 0) {
        goto LABEL_253;
      }
      int64_t v19 = (unint64_t *)(v13 + 16 * v15);
      unint64_t v20 = *v19;
      if ((*v19 & 0x8000000000000000LL) != 0) {
        goto LABEL_254;
      }
      int64_t v21 = v19[1];
      int64_t v22 = *(void *)(a2 + 16);
      BOOL v23 = v22 >= v21 && v22 >= v20;
      BOOL v24 = !v23 || v22 < v17;
      if (v24 || v22 < v18) {
        goto LABEL_255;
      }
      if (v21 < 0) {
        goto LABEL_256;
      }
      unint64_t v26 = (2 * v18) | 1;
      unint64_t v27 = (2 * v21) | 1;
      uint64_t v28 = swift_bridgeObjectRetain();
      sub_189458858(v28, v165, v17, v26, a2, v165, v20, v27);
      int v30 = v29;
      swift_bridgeObjectRelease();
      uint64_t v12 = *(void *)v167 + 2LL;
      if (*(void *)v167 + 2LL >= v5)
      {
LABEL_51:
        uint64_t v13 = v171;
        uint64_t v15 = *(void *)v167;
        if ((v30 & 1) == 0) {
          goto LABEL_59;
        }
      }

      else
      {
        BOOL v31 = (int64_t *)(v155 + 16LL * *(void *)v167);
        do
        {
          uint64_t v32 = *(v31 - 1);
          if (v32 < 0) {
            goto LABEL_230;
          }
          int64_t v33 = *v31;
          if (*v31 < 0) {
            goto LABEL_231;
          }
          int64_t v34 = *(v31 - 3);
          if (v34 < 0) {
            goto LABEL_232;
          }
          int64_t v35 = *(v31 - 2);
          if (v22 < v32 || v22 < v33 || v22 < v34 || v22 < v35) {
            goto LABEL_233;
          }
          if (v35 < 0) {
            goto LABEL_234;
          }
          unint64_t v39 = (2 * v33) | 1;
          unint64_t v40 = (2 * v35) | 1;
          uint64_t v41 = swift_bridgeObjectRetain();
          sub_189458858(v41, v165, v32, v39, v174, v165, v34, v40);
          LODWORD(v40) = v42;
          swift_bridgeObjectRelease();
          if (((v30 ^ v40) & 1) != 0)
          {
            a2 = v174;
            unint64_t v14 = v160;
            goto LABEL_51;
          }

          v31 += 2;
          ++v12;
          unint64_t v14 = v160;
          uint64_t v13 = v171;
        }

        while (v5 != v12);
        uint64_t v12 = v5;
        a2 = v174;
        uint64_t v15 = *(void *)v167;
        if ((v30 & 1) == 0) {
          goto LABEL_59;
        }
      }

      if (v12 < v15) {
        goto LABEL_262;
      }
      if (v15 < v12)
      {
        unint64_t v43 = (__int128 *)(v153 + 16 * v12);
        uint64_t v44 = v12;
        uint64_t v45 = v15;
        char v46 = (__int128 *)(v13 + 16 * v15);
        do
        {
          if (v45 != --v44)
          {
            if (!v13) {
              goto LABEL_266;
            }
            __int128 v47 = *v46;
            __int128 *v46 = *v43;
            *unint64_t v43 = v47;
          }

          ++v45;
          --v43;
          ++v46;
        }

        while (v45 < v44);
      }

LABEL_59:
      if (v12 < v5)
      {
        if (__OFSUB__(v12, v15)) {
          goto LABEL_257;
        }
        if (v12 - v15 < v157)
        {
          uint64_t v48 = v15 + v157;
          if (__OFADD__(v15, v157)) {
            goto LABEL_260;
          }
          if (v48 >= v5) {
            uint64_t v48 = v5;
          }
          if (v48 < v15) {
            goto LABEL_261;
          }
          if (v12 != v48)
          {
            uint64_t v49 = *(void *)(a2 + 16);
            uint64_t v159 = v48;
LABEL_70:
            __int128 v50 = *(_OWORD *)(v13 + 16 * v12);
            uint64_t v163 = v12;
            uint64_t v51 = v12;
            while (1)
            {
              uint64_t v52 = v50;
              if ((v50 & 0x8000000000000000LL) != 0) {
                goto LABEL_212;
              }
              uint64_t v53 = *((void *)&v50 + 1);
              if ((*((void *)&v50 + 1) & 0x8000000000000000LL) != 0) {
                goto LABEL_213;
              }
              uint64_t v54 = v51 - 1;
              uint64_t v55 = (uint64_t *)(v13 + 16 * (v51 - 1));
              uint64_t v56 = *v55;
              if (*v55 < 0) {
                goto LABEL_214;
              }
              uint64_t v57 = v55[1];
              BOOL v58 = v49 < *((uint64_t *)&v50 + 1) || v49 < v56;
              if (v58 || v49 < v57) {
                goto LABEL_215;
              }
              if (v57 < 0) {
                goto LABEL_216;
              }
              uint64_t v60 = *((void *)&v50 + 1) - v50;
              if (*((void *)&v50 + 1) != (void)v50)
              {
                if (v57 != v56)
                {
                  unsigned int v63 = *(unsigned __int8 *)(v165 + v50);
                  unsigned int v64 = *(unsigned __int8 *)(v165 + v56);
                  if (v63 < v64) {
                    goto LABEL_98;
                  }
                  if (v64 < v63) {
                    goto LABEL_69;
                  }
                  uint64_t v65 = 0LL;
                  while (~(void)v50 + *((void *)&v50 + 1) != v65)
                  {
                    if (~v56 + v57 == v65) {
                      break;
                    }
                    uint64_t v66 = v56 + v65 + 1;
                    if (v66 < v56 || v66 >= v57) {
                      goto LABEL_218;
                    }
                    unsigned int v67 = *(unsigned __int8 *)(v158 + v50 + v65);
                    unsigned int v68 = *(unsigned __int8 *)(v158 + v56 + v65);
                    if (v67 < v68) {
                      goto LABEL_98;
                    }
                    ++v65;
                    if (v68 < v67) {
                      goto LABEL_69;
                    }
                  }
                }
              }

              swift_unknownObjectRetain();
              if (v60 < 0) {
                goto LABEL_224;
              }
              if (v53 == v52 || v57 - v56 < 0 || (uint64_t v61 = v57, v57 - v56 >= v60))
              {
                uint64_t v61 = v56 + v60;
                if (__OFADD__(v56, v60)) {
                  goto LABEL_228;
                }
                if (v57 < v61) {
                  goto LABEL_220;
                }
              }

              if (v61 < v56) {
                goto LABEL_225;
              }
              if (v57 < v56) {
                goto LABEL_226;
              }
              if (v61 == v57) {
                goto LABEL_68;
              }
              if (v61 >= v57) {
                goto LABEL_227;
              }
              if (!*(_BYTE *)(v165 + v61))
              {
                if (v61 + 1 != v57)
                {
                  while (v61 + 1 < v57)
                  {
                    if (*(_BYTE *)(a2 + v61 + 33)) {
                      goto LABEL_97;
                    }
                    if (v57 - 1 == ++v61) {
                      goto LABEL_68;
                    }
                  }

                  __break(1u);
                  goto LABEL_207;
                }

  __break(1u);
  return result;
}

LABEL_68:
                swift_bridgeObjectRelease();
                uint64_t v13 = v171;
LABEL_69:
                uint64_t v12 = v163 + 1;
                if (v163 + 1 != v159) {
                  goto LABEL_70;
                }
                uint64_t v12 = v159;
                uint64_t v5 = v162;
                unint64_t v14 = v160;
                uint64_t v15 = *(void *)v167;
                break;
              }

LABEL_97:
              swift_bridgeObjectRelease();
              uint64_t v13 = v171;
LABEL_98:
              if (!v13) {
                goto LABEL_265;
              }
              uint64_t v62 = (__int128 *)(v13 + 16 * v51);
              __int128 v50 = *v62;
              *uint64_t v62 = *(_OWORD *)v55;
              *(_OWORD *)uint64_t v55 = v50;
              --v51;
              if (v54 == *(void *)v167) {
                goto LABEL_69;
              }
            }
          }
        }
      }

      if (v12 < v15) {
        goto LABEL_251;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v14 = sub_18945B198(0LL, *((void *)v14 + 2) + 1LL, 1, v14);
      }
      unint64_t v70 = *((void *)v14 + 2);
      unint64_t v69 = *((void *)v14 + 3);
      unint64_t v71 = v70 + 1;
      uint64_t v13 = v171;
      if (v70 >= v69 >> 1)
      {
        v122 = sub_18945B198((char *)(v69 > 1), v70 + 1, 1, v14);
        uint64_t v13 = v171;
        unint64_t v14 = v122;
      }

      *((void *)v14 + 2) = v71;
      uint64_t v72 = v14 + 32;
      __int128 v73 = &v14[16 * v70 + 32];
      *(void *)__int128 v73 = *(void *)v167;
      *((void *)v73 + 1) = v12;
      if (v70)
      {
        uint64_t v164 = v12;
        while (1)
        {
          unint64_t v74 = v71 - 1;
          if (v71 >= 4)
          {
            uint64_t v79 = &v72[16 * v71];
            uint64_t v80 = *((void *)v79 - 8);
            uint64_t v81 = *((void *)v79 - 7);
            BOOL v85 = __OFSUB__(v81, v80);
            uint64_t v82 = v81 - v80;
            if (v85) {
              goto LABEL_235;
            }
            uint64_t v84 = *((void *)v79 - 6);
            uint64_t v83 = *((void *)v79 - 5);
            BOOL v85 = __OFSUB__(v83, v84);
            uint64_t v77 = v83 - v84;
            char v78 = v85;
            if (v85) {
              goto LABEL_236;
            }
            unint64_t v86 = v71 - 2;
            v87 = &v72[16 * v71 - 32];
            uint64_t v89 = *(void *)v87;
            uint64_t v88 = *((void *)v87 + 1);
            BOOL v85 = __OFSUB__(v88, v89);
            uint64_t v90 = v88 - v89;
            if (v85) {
              goto LABEL_237;
            }
            BOOL v85 = __OFADD__(v77, v90);
            uint64_t v91 = v77 + v90;
            if (v85) {
              goto LABEL_239;
            }
            if (v91 >= v82)
            {
              v109 = &v72[16 * v74];
              uint64_t v111 = *(void *)v109;
              uint64_t v110 = *((void *)v109 + 1);
              BOOL v85 = __OFSUB__(v110, v111);
              uint64_t v112 = v110 - v111;
              if (v85) {
                goto LABEL_246;
              }
              BOOL v102 = v77 < v112;
              goto LABEL_157;
            }
          }

          else
          {
            if (v71 != 3)
            {
              uint64_t v103 = *((void *)v14 + 4);
              uint64_t v104 = *((void *)v14 + 5);
              BOOL v85 = __OFSUB__(v104, v103);
              uint64_t v96 = v104 - v103;
              char v97 = v85;
LABEL_151:
              if ((v97 & 1) != 0) {
                goto LABEL_241;
              }
              v105 = &v72[16 * v74];
              uint64_t v107 = *(void *)v105;
              uint64_t v106 = *((void *)v105 + 1);
              BOOL v85 = __OFSUB__(v106, v107);
              uint64_t v108 = v106 - v107;
              if (v85) {
                goto LABEL_243;
              }
              if (v108 < v96) {
                goto LABEL_14;
              }
              goto LABEL_159;
            }

            uint64_t v76 = *((void *)v14 + 4);
            uint64_t v75 = *((void *)v14 + 5);
            BOOL v85 = __OFSUB__(v75, v76);
            uint64_t v77 = v75 - v76;
            char v78 = v85;
          }

          if ((v78 & 1) != 0) {
            goto LABEL_238;
          }
          unint64_t v86 = v71 - 2;
          v92 = &v72[16 * v71 - 32];
          uint64_t v94 = *(void *)v92;
          uint64_t v93 = *((void *)v92 + 1);
          BOOL v95 = __OFSUB__(v93, v94);
          uint64_t v96 = v93 - v94;
          char v97 = v95;
          if (v95) {
            goto LABEL_240;
          }
          v98 = &v72[16 * v74];
          uint64_t v100 = *(void *)v98;
          uint64_t v99 = *((void *)v98 + 1);
          BOOL v85 = __OFSUB__(v99, v100);
          uint64_t v101 = v99 - v100;
          if (v85) {
            goto LABEL_242;
          }
          if (__OFADD__(v96, v101)) {
            goto LABEL_244;
          }
          if (v96 + v101 < v77) {
            goto LABEL_151;
          }
          BOOL v102 = v77 < v101;
LABEL_157:
          if (v102) {
            unint64_t v74 = v86;
          }
LABEL_159:
          unint64_t v113 = v74 - 1;
          if (v74 - 1 >= v71) {
            goto LABEL_219;
          }
          if (!v13) {
            goto LABEL_264;
          }
          v114 = &v72[16 * v113];
          uint64_t v115 = *(void *)v114;
          unint64_t v116 = v74;
          v117 = &v72[16 * v74];
          uint64_t v118 = *((void *)v117 + 1);
          uint64_t v119 = v13 + 16LL * *(void *)v114;
          v120 = (uint64_t *)(v13 + 16LL * *(void *)v117);
          unint64_t v168 = v13 + 16 * v118;
          swift_bridgeObjectRetain();
          sub_18945CC58(v119, v120, v168, v161, v174);
          if (v170)
          {
LABEL_169:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            *(void *)(v156 + 16) = 0LL;
            swift_bridgeObjectRelease_n();
            return swift_bridgeObjectRelease();
          }

          swift_bridgeObjectRelease();
          if (v118 < v115) {
            goto LABEL_221;
          }
          if (v116 > *((void *)v14 + 2)) {
            goto LABEL_222;
          }
          *(void *)v114 = v115;
          uint64_t v72 = v14 + 32;
          *(void *)&v14[16 * v113 + 40] = v118;
          unint64_t v121 = *((void *)v14 + 2);
          if (v116 >= v121) {
            goto LABEL_223;
          }
          uint64_t v170 = 0LL;
          unint64_t v71 = v121 - 1;
          memmove(v117, v117 + 16, 16 * (v121 - 1 - v116));
          *((void *)v14 + 2) = v121 - 1;
          BOOL v24 = v121 > 2;
          a2 = v174;
          uint64_t v5 = v162;
          uint64_t v12 = v164;
          uint64_t v13 = v171;
          if (!v24)
          {
LABEL_14:
            if (v12 >= v5) {
              goto LABEL_205;
            }
            goto LABEL_15;
          }
        }
      }

      unint64_t v71 = 1LL;
      if (v12 < v5) {
        continue;
      }
      break;
    }

LABEL_205:
    uint64_t v11 = v156;
LABEL_191:
    uint64_t v156 = v11;
    if (v71 < 2)
    {
LABEL_202:
      swift_bridgeObjectRelease();
      *(void *)(v156 + 16) = 0LL;
      swift_bridgeObjectRelease_n();
      return swift_bridgeObjectRelease();
    }

    uint64_t v143 = *v154;
    uint64_t v173 = *v154;
    while (1)
    {
      unint64_t v144 = v71 - 2;
      if (v71 < 2) {
        break;
      }
      if (!v143) {
        goto LABEL_267;
      }
      uint64_t v145 = (uint64_t)v14;
      uint64_t v146 = *(void *)&v14[16 * v144 + 32];
      uint64_t v147 = *(void *)&v14[16 * v71 + 24];
      uint64_t v148 = v143 + 16 * v146;
      v149 = (uint64_t *)(v143 + 16LL * *(void *)&v14[16 * v71 + 16]);
      unint64_t v150 = v143 + 16 * v147;
      swift_bridgeObjectRetain();
      sub_18945CC58(v148, v149, v150, v161, v174);
      if (v170) {
        goto LABEL_169;
      }
      swift_bridgeObjectRelease();
      if (v147 < v146) {
        goto LABEL_248;
      }
      unint64_t v14 = (char *)v145;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v14 = sub_18945B290(v145);
      }
      if (v144 >= *((void *)v14 + 2)) {
        goto LABEL_249;
      }
      v151 = &v14[16 * v144 + 32];
      *(void *)v151 = v146;
      *((void *)v151 + 1) = v147;
      unint64_t v152 = *((void *)v14 + 2);
      if (v71 > v152) {
        goto LABEL_250;
      }
      memmove(&v14[16 * v71 + 16], &v14[16 * v71 + 32], 16 * (v152 - v71));
      *((void *)v14 + 2) = v152 - 1;
      unint64_t v71 = v152 - 1;
      uint64_t v143 = v173;
      if (v152 <= 2) {
        goto LABEL_202;
      }
    }

LABEL_247:
    __break(1u);
LABEL_248:
    __break(1u);
LABEL_249:
    __break(1u);
LABEL_250:
    __break(1u);
LABEL_251:
    __break(1u);
LABEL_252:
    __break(1u);
LABEL_253:
    __break(1u);
LABEL_254:
    __break(1u);
LABEL_255:
    __break(1u);
LABEL_256:
    __break(1u);
LABEL_257:
    __break(1u);
    goto LABEL_258;
  }

  if ((v5 & 0x8000000000000000LL) == 0)
  {
    uint64_t v123 = *a1;
    uint64_t v124 = a2 + 32;
    uint64_t v125 = *(void *)(a2 + 16);
    swift_bridgeObjectRetain();
    uint64_t v126 = -1LL;
    uint64_t v127 = v123;
    uint64_t v128 = v123;
    uint64_t v129 = 1LL;
LABEL_172:
    uint64_t v166 = v129;
    __int128 v130 = *(_OWORD *)(v127 + 16 * v129);
    uint64_t v172 = v126;
    *(void *)v169 = v128;
    while (1)
    {
      uint64_t v131 = v130;
      if ((v130 & 0x8000000000000000LL) != 0) {
        break;
      }
      if ((*((void *)&v130 + 1) & 0x8000000000000000LL) != 0) {
        goto LABEL_208;
      }
      int64_t v132 = *(void *)v128;
      if ((*(void *)v128 & 0x8000000000000000LL) != 0) {
        goto LABEL_209;
      }
      uint64_t v133 = *(void *)(v128 + 8);
      BOOL v134 = v125 < *((uint64_t *)&v130 + 1) || v125 < v132;
      if (v134 || v125 < v133) {
        goto LABEL_210;
      }
      if (v133 < 0) {
        goto LABEL_211;
      }
      unint64_t v136 = (2LL * *((void *)&v130 + 1)) | 1;
      unint64_t v137 = (2 * v133) | 1;
      uint64_t v138 = swift_bridgeObjectRetain();
      sub_189458858(v138, v124, v131, v136, v174, v124, v132, v137);
      char v140 = v139;
      swift_bridgeObjectRelease();
      if ((v140 & 1) != 0)
      {
        if (!v127) {
          goto LABEL_263;
        }
        v141 = (_OWORD *)(v128 + 16);
        __int128 v142 = *(_OWORD *)v128;
        __int128 v130 = *(_OWORD *)(v128 + 16);
        *(_OWORD *)uint64_t v128 = v130;
        v128 -= 16LL;
        _OWORD *v141 = v142;
        BOOL v23 = __CFADD__(v126++, 1LL);
        if (!v23) {
          continue;
        }
      }

      uint64_t v129 = v166 + 1;
      uint64_t v128 = *(void *)v169 + 16LL;
      uint64_t v126 = v172 - 1;
      if (v166 + 1 == v162) {
        return swift_bridgeObjectRelease_n();
      }
      goto LABEL_172;
    }

LABEL_207:
    __break(1u);
LABEL_208:
    __break(1u);
LABEL_209:
    __break(1u);
LABEL_210:
    __break(1u);
LABEL_211:
    __break(1u);
LABEL_212:
    __break(1u);
LABEL_213:
    __break(1u);
LABEL_214:
    __break(1u);
LABEL_215:
    __break(1u);
LABEL_216:
    __break(1u);
LABEL_217:
    __break(1u);
LABEL_218:
    __break(1u);
LABEL_219:
    __break(1u);
LABEL_220:
    __break(1u);
LABEL_221:
    __break(1u);
LABEL_222:
    __break(1u);
LABEL_223:
    __break(1u);
LABEL_224:
    __break(1u);
LABEL_225:
    __break(1u);
LABEL_226:
    __break(1u);
LABEL_227:
    __break(1u);
LABEL_228:
    __break(1u);
LABEL_229:
    __break(1u);
LABEL_230:
    __break(1u);
LABEL_231:
    __break(1u);
LABEL_232:
    __break(1u);
LABEL_233:
    __break(1u);
LABEL_234:
    __break(1u);
LABEL_235:
    __break(1u);
LABEL_236:
    __break(1u);
LABEL_237:
    __break(1u);
LABEL_238:
    __break(1u);
LABEL_239:
    __break(1u);
LABEL_240:
    __break(1u);
LABEL_241:
    __break(1u);
LABEL_242:
    __break(1u);
LABEL_243:
    __break(1u);
LABEL_244:
    __break(1u);
LABEL_245:
    __break(1u);
LABEL_246:
    __break(1u);
    goto LABEL_247;
  }

LABEL_259:
  __break(1u);
LABEL_260:
  __break(1u);
LABEL_261:
  __break(1u);
LABEL_262:
  __break(1u);
LABEL_263:
  __break(1u);
LABEL_264:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_265:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_266:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_267:
  uint64_t result = swift_bridgeObjectRelease_n();
  __break(1u);
  return result;
}

uint64_t sub_18945DB60(char **a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_1894707D8((uint64_t)v4);
  }
  uint64_t v5 = *((void *)v4 + 2);
  v7[0] = (uint64_t)(v4 + 32);
  v7[1] = v5;
  swift_bridgeObjectRetain();
  sub_18945CFF0(v7, a2);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return swift_bridgeObjectRelease_n();
}

_OWORD *sub_18945DC00(__int128 *a1, _OWORD *a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(__int128 *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

uint64_t sub_18945DC18(uint64_t a1)
{
  return a1;
}

uint64_t sub_18945DC58(uint64_t a1)
{
  return a1;
}

unint64_t sub_18945DC9C()
{
  unint64_t result = qword_18C797628;
  if (!qword_18C797628)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1NodeCollection,  &type metadata for ASN1NodeCollection);
    atomic_store(result, (unint64_t *)&qword_18C797628);
  }

  return result;
}

unint64_t sub_18945DCE4()
{
  unint64_t result = qword_18C5058B0;
  if (!qword_18C5058B0)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1NodeCollection.Iterator,  &type metadata for ASN1NodeCollection.Iterator);
    atomic_store(result, (unint64_t *)&qword_18C5058B0);
  }

  return result;
}

unint64_t sub_18945DD2C()
{
  unint64_t result = qword_18C797630;
  if (!qword_18C797630)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1Node, &type metadata for ASN1Node);
    atomic_store(result, (unint64_t *)&qword_18C797630);
  }

  return result;
}

unint64_t sub_18945DD74()
{
  unint64_t result = qword_18C797638;
  if (!qword_18C797638)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1Node.Content,  &type metadata for ASN1Node.Content);
    atomic_store(result, (unint64_t *)&qword_18C797638);
  }

  return result;
}

ValueMetadata *type metadata accessor for DER()
{
  return &type metadata for DER;
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

ValueMetadata *type metadata accessor for ASN1NodeCollection()
{
  return &type metadata for ASN1NodeCollection;
}

uint64_t initializeBufferWithCopyOfBuffer for ASN1NodeCollection.Iterator(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ASN1NodeCollection.Iterator()
{
  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for ASN1BitString(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_unknownObjectRetain();
  return a1;
}

void *assignWithCopy for ASN1BitString(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  return a1;
}

uint64_t assignWithTake for ASN1BitString(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASN1BitString(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASN1BitString(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 40) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ASN1NodeCollection.Iterator()
{
  return &type metadata for ASN1NodeCollection.Iterator;
}

uint64_t destroy for ASN1Node(uint64_t a1)
{
  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for ASN1Node(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v9 = *(unsigned __int8 *)(a2 + 56);
  j__swift_unknownObjectRetain(v4, v5, v6, v7, v8, v9);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ASN1Node(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v9 = *(unsigned __int8 *)(a2 + 56);
  j__swift_unknownObjectRetain(v4, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(unsigned __int8 *)(a1 + 56);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 56) = v9;
  j__swift_unknownObjectRelease(v10, v11, v12, v13, v14, v15);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ASN1Node(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 48);
  char v5 = *(_BYTE *)(a2 + 56);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
  __int128 v12 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v12;
  *(void *)(a1 + 48) = v4;
  *(_BYTE *)(a1 + 56) = v5;
  j__swift_unknownObjectRelease(v6, v7, v8, v9, v10, v11);
  swift_unknownObjectRelease();
  __int128 v13 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v13;
  return a1;
}

uint64_t getEnumTagSinglePayload for ASN1Node(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASN1Node(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0LL;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 96) = 1;
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
      *(void *)(result + 64) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ASN1Node()
{
  return &type metadata for ASN1Node;
}

uint64_t destroy for ASN1Node.Content(uint64_t a1)
{
  return j__swift_unknownObjectRelease( *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

uint64_t initializeWithCopy for ASN1Node.Content(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = *((unsigned __int8 *)a2 + 40);
  j__swift_unknownObjectRetain(*a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t *assignWithCopy for ASN1Node.Content(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = *((unsigned __int8 *)a2 + 40);
  j__swift_unknownObjectRetain(*a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v11 = a1[2];
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  uint64_t v14 = *((unsigned __int8 *)a1 + 40);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  *((_BYTE *)a1 + 40) = v8;
  j__swift_unknownObjectRelease(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t *assignWithTake for ASN1Node.Content(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(_BYTE *)(a2 + 40);
  uint64_t v5 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  uint64_t v10 = *((unsigned __int8 *)a1 + 40);
  __int128 v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  a1[4] = v3;
  *((_BYTE *)a1 + 40) = v4;
  j__swift_unknownObjectRelease(v5, v7, v6, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASN1Node.Content(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASN1Node.Content(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 41) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 41) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 40) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_18945E4A4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_18945E4AC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ASN1Node.Content()
{
  return &type metadata for ASN1Node.Content;
}

ValueMetadata *type metadata accessor for DER.Serializer()
{
  return &type metadata for DER.Serializer;
}

uint64_t dispatch thunk of DERParseable.init(derEncoded:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DERSerializable.serialize(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static DERImplicitlyTaggable.defaultIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of DERImplicitlyTaggable.init(derEncoded:withIdentifier:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of DERImplicitlyTaggable.serialize(into:withIdentifier:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t destroy for DER.ParserNode()
{
  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for DER.ParserNode(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v3 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v3;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DER.ParserNode(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

uint64_t assignWithTake for DER.ParserNode(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_unknownObjectRelease();
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  swift_unknownObjectRelease();
  __int128 v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for DER.ParserNode(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DER.ParserNode(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0LL;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 96) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for DER.ParserNode()
{
  return &type metadata for DER.ParserNode;
}

unint64_t sub_18945E7A0()
{
  unint64_t result = qword_18C797640;
  if (!qword_18C797640)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&unk_189473EE4, &type metadata for DER.ParseResult);
    atomic_store(result, (unint64_t *)&qword_18C797640);
  }

  return result;
}

unint64_t sub_18945E7E8()
{
  unint64_t result = qword_18C797648;
  if (!qword_18C797648)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&unk_189473F74, &type metadata for DER.ParserNode);
    atomic_store(result, (unint64_t *)&qword_18C797648);
  }

  return result;
}

uint64_t sub_18945E82C(char **a1)
{
  return sub_1894729BC(a1, *(uint64_t **)(v1 + 16));
}

uint64_t sub_18945E844(uint64_t a1)
{
  return sub_189471984(a1, *(void *)(v1 + 16));
}

uint64_t sub_18945E85C(char **a1)
{
  return sub_189465668(a1, *(void *)(v1 + 16));
}

uint64_t sub_18945E874(uint64_t a1)
{
  return sub_18946ECB4(a1, *(_OWORD **)(v1 + 16));
}

uint64_t sub_18945E88C(uint64_t a1)
{
  return sub_18946DBC8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_18945E8A8(uint64_t *a1)
{
  return sub_18946B694(a1, *(_BYTE *)(v1 + 16));
}

uint64_t sub_18945E8C0(uint64_t a1)
{
  return sub_189469C8C(a1, *(void **)(v1 + 16));
}

uint64_t sub_18945E8D8(char **a1)
{
  return sub_1894612C0(**(void **)(v1 + 16), a1);
}

uint64_t sub_18945E8FC(uint64_t *a1)
{
  return sub_189461294(**(void **)(v1 + 16), a1);
}

uint64_t sub_18945E91C(char **a1)
{
  return sub_189461B28(**(unsigned int **)(v1 + 16), a1);
}

uint64_t sub_18945E93C(uint64_t *a1)
{
  return sub_189461668(**(unsigned int **)(v1 + 16), a1);
}

uint64_t sub_18945E95C(char **a1)
{
  return sub_189461998(**(unsigned __int16 **)(v1 + 16), a1);
}

uint64_t sub_18945E97C(uint64_t *a1)
{
  return sub_189461594(**(unsigned __int16 **)(v1 + 16), a1);
}

uint64_t sub_18945E99C(char **a1)
{
  return sub_189461814(**(unsigned __int8 **)(v1 + 16), a1);
}

uint64_t sub_18945E9BC(uint64_t *a1)
{
  return sub_1894614B0(**(unsigned __int8 **)(v1 + 16), a1);
}

uint64_t sub_18945E9DC(uint64_t a1)
{
  return a1;
}

unint64_t sub_18945EA04()
{
  unint64_t result = qword_18C797658;
  if (!qword_18C797658)
  {
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x18961A640], MEMORY[0x18961A610]);
    atomic_store(result, (unint64_t *)&qword_18C797658);
  }

  return result;
}

unint64_t sub_18945EA48()
{
  unint64_t result = qword_18C797660;
  if (!qword_18C797660)
  {
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x189618788], MEMORY[0x189618740]);
    atomic_store(result, (unint64_t *)&qword_18C797660);
  }

  return result;
}

uint64_t *sub_18945EA8C(uint64_t *a1)
{
  uint64_t v2 = a1[13];
  uint64_t v7 = a1[12];
  uint64_t v3 = a1[14];
  uint64_t v4 = a1[15];
  uint64_t v5 = a1[16];
  sub_18945EB4C(*a1, a1[1], a1[2], a1[3], a1[4]);
  sub_18945EB4C(v7, v2, v3, v4, v5);
  return a1;
}

uint64_t sub_18945EB4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }

  return result;
}

uint64_t sub_18945EB7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    swift_unknownObjectRetain();
    return swift_unknownObjectRetain();
  }

  return result;
}

uint64_t sub_18945EBAC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  if (a9)
  {
    j__swift_unknownObjectRetain(a3, a4, a5, a6, a7, a8 & 1);
    return swift_unknownObjectRetain();
  }

  return result;
}

uint64_t initializeWithCopy for DER.ParseResult(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_unknownObjectRetain();
  return a1;
}

void *assignWithCopy for DER.ParseResult(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for DER.ParseResult(_OWORD *a1, _OWORD *a2)
{
  __int128 v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for DER.ParseResult(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DER.ParseResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 32) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for DER.ParseResult()
{
  return &type metadata for DER.ParseResult;
}

uint64_t sub_18945ED70(uint64_t *a1, void *a2)
{
  return sub_18945B594(a1, a2);
}

uint64_t sub_18945ED84(uint64_t a1)
{
  return sub_18945E88C(a1);
}

uint64_t sub_18945ED98(uint64_t *a1)
{
  return sub_18945B5B4(a1);
}

void sub_18945EDB0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 8)
    {
      sub_18945AD44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD00000000000001ALL,  0x8000000189475D80LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  1191LL,  v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v9 = sub_18945F73C(0LL, 8 * v5, 8LL);
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    if (a3 <= v4) {
      uint64_t v13 = v4;
    }
    else {
      uint64_t v13 = a3;
    }
    unint64_t v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      unint64_t v16 = *(void *)(v9 + 8 * v11 + 32);
      if (v16 - 65 < 0xFFFFFFFFFFFFFF7FLL)
      {
        unint64_t v15 = 0LL;
      }

      else
      {
        unint64_t v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000LL) != 0)
        {
          unint64_t v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFC0LL) {
            unint64_t v15 = 0LL;
          }
          else {
            unint64_t v15 = v19;
          }
        }

        else
        {
          uint64_t v18 = v17 << v16;
          if (v16 >= 0x40) {
            unint64_t v15 = 0LL;
          }
          else {
            unint64_t v15 = v18;
          }
        }
      }

      ++v11;
      v12 |= v15;
      if (v10 == v11) {
        goto LABEL_21;
      }
    }

    __break(1u);
  }

  __break(1u);
LABEL_24:
  __break(1u);
}

void sub_18945EF44(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 1)
    {
      sub_18945AD44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD00000000000001ALL,  0x8000000189475D80LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  1191LL,  v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v9 = sub_18945F73C(0LL, 8 * v5, 8LL);
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_23:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v11 = 0LL;
    int v12 = 0;
    if (a3 <= v4) {
      uint64_t v13 = v4;
    }
    else {
      uint64_t v13 = a3;
    }
    unint64_t v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      uint64_t v16 = *(void *)(v9 + 8 * v11 + 32);
      int v17 = *(unsigned __int8 *)(a2 + a3 + v11);
      if (v16 <= -9)
      {
        int v15 = (char)v17 >> 7;
      }

      else if (v16 < 9)
      {
        if (v16 < 0)
        {
          int v19 = (char)v17 >> -(char)v16;
          int v20 = (char)v17 >> 7;
          else {
            int v15 = v19;
          }
        }

        else
        {
          BOOL v18 = (unint64_t)v16 >= 8;
          int v15 = v17 << v16;
          if (v18) {
            int v15 = 0;
          }
        }
      }

      else
      {
        int v15 = 0;
      }

      ++v11;
      v12 |= v15;
      if (v10 == v11) {
        goto LABEL_23;
      }
    }

    __break(1u);
  }

  __break(1u);
LABEL_26:
  __break(1u);
}

void sub_18945F0EC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 2)
    {
      sub_18945AD44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD00000000000001ALL,  0x8000000189475D80LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  1191LL,  v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v9 = sub_18945F73C(0LL, 8 * v5, 8LL);
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v11 = 0LL;
    int v12 = 0;
    if (a3 <= v4) {
      uint64_t v13 = v4;
    }
    else {
      uint64_t v13 = a3;
    }
    unint64_t v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      unint64_t v16 = *(void *)(v9 + 8 * v11 + 32);
      if (v16 - 17 <= 0xFFFFFFFFFFFFFFDELL)
      {
        int v15 = 0;
      }

      else
      {
        unsigned int v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000LL) != 0)
        {
          unsigned int v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFF0LL) {
            int v15 = 0;
          }
          else {
            int v15 = v19;
          }
        }

        else
        {
          BOOL v18 = v16 >= 0x10;
          int v15 = v17 << v16;
          if (v18) {
            int v15 = 0;
          }
        }
      }

      ++v11;
      v12 |= v15;
      if (v10 == v11) {
        goto LABEL_21;
      }
    }

    __break(1u);
  }

  __break(1u);
LABEL_24:
  __break(1u);
}

void sub_18945F280(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 4)
    {
      sub_18945AD44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD00000000000001ALL,  0x8000000189475D80LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  1191LL,  v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v9 = sub_18945F73C(0LL, 8 * v5, 8LL);
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v11 = 0LL;
    int v12 = 0;
    if (a3 <= v4) {
      uint64_t v13 = v4;
    }
    else {
      uint64_t v13 = a3;
    }
    unint64_t v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      unint64_t v16 = *(void *)(v9 + 8 * v11 + 32);
      if (v16 - 33 <= 0xFFFFFFFFFFFFFFBELL)
      {
        int v15 = 0;
      }

      else
      {
        unsigned int v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000LL) != 0)
        {
          unsigned int v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFE0LL) {
            int v15 = 0;
          }
          else {
            int v15 = v19;
          }
        }

        else
        {
          BOOL v18 = v16 >= 0x20;
          int v15 = v17 << v16;
          if (v18) {
            int v15 = 0;
          }
        }
      }

      ++v11;
      v12 |= v15;
      if (v10 == v11) {
        goto LABEL_21;
      }
    }

    __break(1u);
  }

  __break(1u);
LABEL_24:
  __break(1u);
}

void sub_18945F414(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 8)
    {
      sub_18945AD44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD00000000000001ALL,  0x8000000189475D80LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  1191LL,  v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v9 = sub_18945F73C(0LL, 8 * v5, 8LL);
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    if (a3 <= v4) {
      uint64_t v13 = v4;
    }
    else {
      uint64_t v13 = a3;
    }
    unint64_t v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      unint64_t v16 = *(void *)(v9 + 8 * v11 + 32);
      if (v16 - 65 <= 0xFFFFFFFFFFFFFF7ELL)
      {
        unint64_t v15 = 0LL;
      }

      else
      {
        unint64_t v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000LL) != 0)
        {
          unint64_t v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFC0LL) {
            unint64_t v15 = 0LL;
          }
          else {
            unint64_t v15 = v19;
          }
        }

        else
        {
          uint64_t v18 = v17 << v16;
          if (v16 >= 0x40) {
            unint64_t v15 = 0LL;
          }
          else {
            unint64_t v15 = v18;
          }
        }
      }

      ++v11;
      v12 |= v15;
      if (v10 == v11) {
        goto LABEL_21;
      }
    }

    __break(1u);
  }

  __break(1u);
LABEL_24:
  __break(1u);
}

void sub_18945F5A8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 1)
    {
      sub_18945AD44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD00000000000001ALL,  0x8000000189475D80LL,  (uint64_t)"SwiftASN1/ASN1.swift",  20LL,  2,  1191LL,  v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v9 = sub_18945F73C(0LL, 8 * v5, 8LL);
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v11 = 0LL;
    int v12 = 0;
    if (a3 <= v4) {
      uint64_t v13 = v4;
    }
    else {
      uint64_t v13 = a3;
    }
    unint64_t v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      unint64_t v16 = *(void *)(v9 + 8 * v11 + 32);
      if (v16 - 9 <= 0xFFFFFFFFFFFFFFEELL)
      {
        int v15 = 0;
      }

      else
      {
        unsigned int v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000LL) != 0)
        {
          unsigned int v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFF8LL) {
            int v15 = 0;
          }
          else {
            int v15 = v19;
          }
        }

        else
        {
          BOOL v18 = v16 >= 8;
          int v15 = v17 << v16;
          if (v18) {
            int v15 = 0;
          }
        }
      }

      ++v11;
      v12 |= v15;
      if (v10 == v11) {
        goto LABEL_21;
      }
    }

    __break(1u);
  }

  __break(1u);
LABEL_24:
  __break(1u);
}

uint64_t sub_18945F73C(uint64_t a1, int64_t a2, uint64_t a3)
{
  uint64_t result = sub_189465370(a1, a2, a3);
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
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_1894655F0(v4);
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

void static ASN1IntegerRepresentable.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 2LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_18945F808(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return sub_1894601D4(a1, a2, a3);
}

uint64_t sub_18945F81C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return sub_189460C34( a1,  a2,  a3,  (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t))sub_18945EDB0);
}

uint64_t sub_18945F838(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v4 = result;
  if (*(void *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27LL, 2, 46LL, v11);
    sub_18945DC58(v4);
    swift_willThrow();
    return v3;
  }

  if (*(_BYTE *)(result + 56) == 1)
  {
    uint64_t v3 = *(void *)(result + 16);
    uint64_t v5 = *(void *)(result + 24);
    uint64_t v7 = *(void *)(result + 32);
    unint64_t v6 = *(void *)(result + 40);
    uint64_t v8 = *(void *)(result + 48);
    swift_unknownObjectRetain();
    uint64_t result = sub_18945DC58(v4);
    int64_t v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
      goto LABEL_25;
    }

    if ((uint64_t)((v6 >> 1) - v7) < 1)
    {
      sub_18945AD44();
      swift_allocError();
      uint64_t v13 = v12;
      uint64_t v14 = 0xD00000000000001FLL;
      uint64_t v15 = 0x8000000189475F40LL;
      uint64_t v16 = 55LL;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)( v14,  v15,  (uint64_t)"SwiftASN1/ASN1Integer.swift",  27LL,  2,  v16,  v13);
      swift_willThrow();
      j__swift_unknownObjectRelease(v3, v5, v7, v6, v8, 1LL);
      return v3;
    }

    if (v7 != v9)
    {
      if (v7 < v9)
      {
        int v10 = *(unsigned __int8 *)(v5 + v7);
        if (v7 + 1 == v9)
        {
          if (!*(_BYTE *)(v5 + v7)) {
            return v3;
          }
LABEL_19:
          if ((v10 & 0x80) == 0) {
            return v3;
          }
          goto LABEL_21;
        }

        if (v7 + 1 < v9)
        {
          int v17 = *(char *)(v5 + v7 + 1);
          if (*(_BYTE *)(v5 + v7))
          {
            if (v10 != 255) {
              goto LABEL_19;
            }
            if ((v17 & 0x80000000) == 0)
            {
LABEL_21:
              sub_18945AD44();
              swift_allocError();
              uint64_t v14 = 0xD000000000000021LL;
              uint64_t v13 = v18;
              uint64_t v15 = 0x8000000189475F60LL;
              uint64_t v16 = 77LL;
              goto LABEL_13;
            }
          }

          else if (v17 < 0)
          {
            return v3;
          }

          sub_18945AD44();
          swift_allocError();
          uint64_t v14 = 0xD00000000000002ELL;
          uint64_t v13 = v19;
          uint64_t v15 = 0x8000000189475F90LL;
          uint64_t v16 = 67LL;
          goto LABEL_13;
        }

        goto LABEL_26;
      }

LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }

    return v3;
  }

LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_18945FACC(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = result;
  if (*(void *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27LL, 2, 46LL, v12);
    sub_18945DC58(v3);
    swift_willThrow();
    return v3;
  }

  if (*(_BYTE *)(result + 56) == 1)
  {
    uint64_t v5 = *(void *)(result + 16);
    uint64_t v4 = *(void *)(result + 24);
    uint64_t v7 = *(void *)(result + 32);
    unint64_t v6 = *(void *)(result + 40);
    uint64_t v8 = *(void *)(result + 48);
    swift_unknownObjectRetain();
    uint64_t result = sub_18945DC58(v3);
    int64_t v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
    }

    else
    {
      if ((uint64_t)((v6 >> 1) - v7) < 1)
      {
        sub_18945AD44();
        swift_allocError();
        uint64_t v14 = v13;
        uint64_t v15 = 0xD00000000000001FLL;
        uint64_t v16 = 0x8000000189475F40LL;
        uint64_t v17 = 55LL;
LABEL_16:
        static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)( v15,  v16,  (uint64_t)"SwiftASN1/ASN1Integer.swift",  27LL,  2,  v17,  v14);
        swift_willThrow();
        j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
        return v3;
      }

      if (v7 == v9) {
        goto LABEL_13;
      }
      if (v7 < v9)
      {
        if (v7 + 1 == v9) {
          goto LABEL_13;
        }
        if (v7 + 1 < v9)
        {
          int v10 = *(char *)(v4 + v7 + 1);
          if (*(_BYTE *)(v4 + v7))
          {
            goto LABEL_19;
          }

          if ((v10 & 0x80000000) == 0)
          {
LABEL_19:
            sub_18945AD44();
            swift_allocError();
            uint64_t v15 = 0xD00000000000002ELL;
            uint64_t v14 = v18;
            uint64_t v16 = 0x8000000189475F90LL;
            uint64_t v17 = 67LL;
            goto LABEL_16;
          }

uint64_t sub_18945FD24(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = result;
  if (*(void *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27LL, 2, 46LL, v12);
    sub_18945DC58(v3);
    swift_willThrow();
    return v3;
  }

  if (*(_BYTE *)(result + 56) == 1)
  {
    uint64_t v5 = *(void *)(result + 16);
    uint64_t v4 = *(void *)(result + 24);
    uint64_t v7 = *(void *)(result + 32);
    unint64_t v6 = *(void *)(result + 40);
    uint64_t v8 = *(void *)(result + 48);
    swift_unknownObjectRetain();
    uint64_t result = sub_18945DC58(v3);
    int64_t v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
    }

    else
    {
      if ((uint64_t)((v6 >> 1) - v7) < 1)
      {
        sub_18945AD44();
        swift_allocError();
        uint64_t v14 = v13;
        uint64_t v15 = 0xD00000000000001FLL;
        uint64_t v16 = 0x8000000189475F40LL;
        uint64_t v17 = 55LL;
LABEL_16:
        static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)( v15,  v16,  (uint64_t)"SwiftASN1/ASN1Integer.swift",  27LL,  2,  v17,  v14);
        swift_willThrow();
        j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
        return v3;
      }

      if (v7 == v9) {
        goto LABEL_13;
      }
      if (v7 < v9)
      {
        if (v7 + 1 == v9) {
          goto LABEL_13;
        }
        if (v7 + 1 < v9)
        {
          int v10 = *(char *)(v4 + v7 + 1);
          if (*(_BYTE *)(v4 + v7))
          {
            goto LABEL_19;
          }

          if ((v10 & 0x80000000) == 0)
          {
LABEL_19:
            sub_18945AD44();
            swift_allocError();
            uint64_t v15 = 0xD00000000000002ELL;
            uint64_t v14 = v18;
            uint64_t v16 = 0x8000000189475F90LL;
            uint64_t v17 = 67LL;
            goto LABEL_16;
          }

uint64_t sub_18945FF7C(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = result;
  if (*(void *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27LL, 2, 46LL, v12);
    sub_18945DC58(v3);
    swift_willThrow();
    return v3;
  }

  if (*(_BYTE *)(result + 56) == 1)
  {
    uint64_t v5 = *(void *)(result + 16);
    uint64_t v4 = *(void *)(result + 24);
    uint64_t v7 = *(void *)(result + 32);
    unint64_t v6 = *(void *)(result + 40);
    uint64_t v8 = *(void *)(result + 48);
    swift_unknownObjectRetain();
    uint64_t result = sub_18945DC58(v3);
    int64_t v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
    }

    else
    {
      if ((uint64_t)((v6 >> 1) - v7) < 1)
      {
        sub_18945AD44();
        swift_allocError();
        uint64_t v14 = v13;
        uint64_t v15 = 0xD00000000000001FLL;
        uint64_t v16 = 0x8000000189475F40LL;
        uint64_t v17 = 55LL;
LABEL_16:
        static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)( v15,  v16,  (uint64_t)"SwiftASN1/ASN1Integer.swift",  27LL,  2,  v17,  v14);
        swift_willThrow();
        j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
        return v3;
      }

      if (v7 == v9) {
        goto LABEL_13;
      }
      if (v7 < v9)
      {
        if (v7 + 1 == v9) {
          goto LABEL_13;
        }
        if (v7 + 1 < v9)
        {
          int v10 = *(char *)(v4 + v7 + 1);
          if (*(_BYTE *)(v4 + v7))
          {
            goto LABEL_19;
          }

          if ((v10 & 0x80000000) == 0)
          {
LABEL_19:
            sub_18945AD44();
            swift_allocError();
            uint64_t v15 = 0xD00000000000002ELL;
            uint64_t v14 = v18;
            uint64_t v16 = 0x8000000189475F90LL;
            uint64_t v17 = 67LL;
            goto LABEL_16;
          }

uint64_t sub_1894601D4(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = result;
  if (*(void *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27LL, 2, 46LL, v12);
    sub_18945DC58(v3);
    swift_willThrow();
    return v3;
  }

  if (*(_BYTE *)(result + 56) == 1)
  {
    uint64_t v5 = *(void *)(result + 16);
    uint64_t v4 = *(void *)(result + 24);
    uint64_t v7 = *(void *)(result + 32);
    unint64_t v6 = *(void *)(result + 40);
    uint64_t v8 = *(void *)(result + 48);
    swift_unknownObjectRetain();
    uint64_t result = sub_18945DC58(v3);
    int64_t v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
    }

    else
    {
      if ((uint64_t)((v6 >> 1) - v7) < 1)
      {
        sub_18945AD44();
        swift_allocError();
        uint64_t v14 = v13;
        uint64_t v15 = 0xD00000000000001FLL;
        uint64_t v16 = 0x8000000189475F40LL;
        uint64_t v17 = 55LL;
LABEL_16:
        static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)( v15,  v16,  (uint64_t)"SwiftASN1/ASN1Integer.swift",  27LL,  2,  v17,  v14);
        swift_willThrow();
        j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
        return v3;
      }

      if (v7 == v9) {
        goto LABEL_13;
      }
      if (v7 < v9)
      {
        if (v7 + 1 == v9) {
          goto LABEL_13;
        }
        if (v7 + 1 < v9)
        {
          int v10 = *(char *)(v4 + v7 + 1);
          if (*(_BYTE *)(v4 + v7))
          {
            goto LABEL_19;
          }

          if ((v10 & 0x80000000) == 0)
          {
LABEL_19:
            sub_18945AD44();
            swift_allocError();
            uint64_t v15 = 0xD00000000000002ELL;
            uint64_t v14 = v18;
            uint64_t v16 = 0x8000000189475F90LL;
            uint64_t v17 = 67LL;
            goto LABEL_16;
          }

void sub_18946042C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (*(void *)a1 != a2 || *(unsigned __int8 *)(a1 + 8) != a3)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27LL, 2, 46LL, v12);
    sub_18945DC58(a1);
    swift_willThrow();
    return;
  }

  if (*(_BYTE *)(a1 + 56) != 1) {
    goto LABEL_28;
  }
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  swift_unknownObjectRetain();
  sub_18945DC58(a1);
  int64_t v9 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v7))
  {
    __break(1u);
  }

  else
  {
    if ((uint64_t)((v6 >> 1) - v7) < 1)
    {
      sub_18945AD44();
      swift_allocError();
      uint64_t v14 = v13;
      uint64_t v15 = 0xD00000000000001FLL;
      uint64_t v16 = 0x8000000189475F40LL;
      uint64_t v17 = 55LL;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)( v15,  v16,  (uint64_t)"SwiftASN1/ASN1Integer.swift",  27LL,  2,  v17,  v14);
      swift_willThrow();
      j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
      return;
    }

    if (v7 == v9)
    {
LABEL_20:
      uint64_t v11 = v7;
      goto LABEL_21;
    }

    if (v7 < v9)
    {
      int v10 = *(unsigned __int8 *)(v4 + v7);
      uint64_t v11 = v7 + 1;
      if (v7 + 1 == v9)
      {
        if (!*(_BYTE *)(v4 + v7))
        {
          uint64_t v11 = v6 >> 1;
LABEL_21:
          sub_18945F5A8(v5, v4, v11, v6);
          return;
        }

LABEL_19:
        if ((v10 & 0x80) == 0) {
          goto LABEL_20;
        }
        goto LABEL_22;
      }

      if (v7 + 1 < v9)
      {
        int v18 = *(char *)(v4 + v11);
        if (*(_BYTE *)(v4 + v7))
        {
          if (v10 != 255) {
            goto LABEL_19;
          }
          if ((v18 & 0x80000000) == 0)
          {
LABEL_22:
            sub_18945AD44();
            swift_allocError();
            uint64_t v15 = 0xD000000000000021LL;
            uint64_t v14 = v19;
            uint64_t v16 = 0x8000000189475F60LL;
            uint64_t v17 = 77LL;
            goto LABEL_13;
          }
        }

        else if (v18 < 0)
        {
          goto LABEL_21;
        }

        sub_18945AD44();
        swift_allocError();
        uint64_t v15 = 0xD00000000000002ELL;
        uint64_t v14 = v20;
        uint64_t v16 = 0x8000000189475F90LL;
        uint64_t v17 = 67LL;
        goto LABEL_13;
      }

      goto LABEL_27;
    }
  }

  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

        if ((v10 & 0x80) == 0) {
          goto LABEL_20;
        }
        goto LABEL_22;
      }

      if (v7 + 1 < v9)
      {
        int v18 = *(char *)(v4 + v11);
        if (*(_BYTE *)(v4 + v7))
        {
          if (v10 != 255) {
            goto LABEL_19;
          }
          if ((v18 & 0x80000000) == 0)
          {
LABEL_22:
            sub_18945AD44();
            swift_allocError();
            uint64_t v15 = 0xD000000000000021LL;
            uint64_t v14 = v19;
            uint64_t v16 = 0x8000000189475F60LL;
            uint64_t v17 = 77LL;
            goto LABEL_13;
          }
        }

        else if (v18 < 0)
        {
          goto LABEL_21;
        }

        sub_18945AD44();
        swift_allocError();
        uint64_t v15 = 0xD00000000000002ELL;
        uint64_t v14 = v20;
        uint64_t v16 = 0x8000000189475F90LL;
        uint64_t v17 = 67LL;
        goto LABEL_13;
      }

      goto LABEL_27;
    }
  }

  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

        if ((v10 & 0x80) == 0) {
          goto LABEL_20;
        }
        goto LABEL_22;
      }

      if (v7 + 1 < v9)
      {
        int v18 = *(char *)(v4 + v11);
        if (*(_BYTE *)(v4 + v7))
        {
          if (v10 != 255) {
            goto LABEL_19;
          }
          if ((v18 & 0x80000000) == 0)
          {
LABEL_22:
            sub_18945AD44();
            swift_allocError();
            uint64_t v15 = 0xD000000000000021LL;
            uint64_t v14 = v19;
            uint64_t v16 = 0x8000000189475F60LL;
            uint64_t v17 = 77LL;
            goto LABEL_13;
          }
        }

        else if (v18 < 0)
        {
          goto LABEL_21;
        }

        sub_18945AD44();
        swift_allocError();
        uint64_t v15 = 0xD00000000000002ELL;
        uint64_t v14 = v20;
        uint64_t v16 = 0x8000000189475F90LL;
        uint64_t v17 = 67LL;
        goto LABEL_13;
      }

      goto LABEL_27;
    }
  }

  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

        if ((v12 & 0x80) == 0) {
          goto LABEL_20;
        }
        goto LABEL_22;
      }

      if (v9 + 1 < v11)
      {
        int v20 = *(char *)(v6 + v13);
        if (*(_BYTE *)(v6 + v9))
        {
          if (v12 != 255) {
            goto LABEL_19;
          }
          if ((v20 & 0x80000000) == 0)
          {
LABEL_22:
            sub_18945AD44();
            swift_allocError();
            uint64_t v17 = 0xD000000000000021LL;
            uint64_t v16 = v21;
            int v18 = 0x8000000189475F60LL;
            unsigned int v19 = 77LL;
            goto LABEL_13;
          }
        }

        else if (v20 < 0)
        {
          return a4(v7, v6, v13, v8);
        }

        sub_18945AD44();
        swift_allocError();
        uint64_t v17 = 0xD00000000000002ELL;
        uint64_t v16 = v22;
        int v18 = 0x8000000189475F90LL;
        unsigned int v19 = 67LL;
        goto LABEL_13;
      }

      goto LABEL_27;
    }
  }

  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

void sub_1894606D0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (*(void *)a1 != a2 || *(unsigned __int8 *)(a1 + 8) != a3)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27LL, 2, 46LL, v12);
    sub_18945DC58(a1);
    swift_willThrow();
    return;
  }

  if (*(_BYTE *)(a1 + 56) != 1) {
    goto LABEL_28;
  }
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  swift_unknownObjectRetain();
  sub_18945DC58(a1);
  int64_t v9 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v7))
  {
    __break(1u);
  }

  else
  {
    if ((uint64_t)((v6 >> 1) - v7) < 1)
    {
      sub_18945AD44();
      swift_allocError();
      uint64_t v14 = v13;
      uint64_t v15 = 0xD00000000000001FLL;
      uint64_t v16 = 0x8000000189475F40LL;
      uint64_t v17 = 55LL;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)( v15,  v16,  (uint64_t)"SwiftASN1/ASN1Integer.swift",  27LL,  2,  v17,  v14);
      swift_willThrow();
      j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
      return;
    }

    if (v7 == v9)
    {
LABEL_20:
      uint64_t v11 = v7;
      goto LABEL_21;
    }

    if (v7 < v9)
    {
      int v10 = *(unsigned __int8 *)(v4 + v7);
      uint64_t v11 = v7 + 1;
      if (v7 + 1 == v9)
      {
        if (!*(_BYTE *)(v4 + v7))
        {
          uint64_t v11 = v6 >> 1;
LABEL_21:
          sub_18945F0EC(v5, v4, v11, v6);
          return;
        }

void sub_189460974(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (*(void *)a1 != a2 || *(unsigned __int8 *)(a1 + 8) != a3)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27LL, 2, 46LL, v12);
    sub_18945DC58(a1);
    swift_willThrow();
    return;
  }

  if (*(_BYTE *)(a1 + 56) != 1) {
    goto LABEL_28;
  }
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  swift_unknownObjectRetain();
  sub_18945DC58(a1);
  int64_t v9 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v7))
  {
    __break(1u);
  }

  else
  {
    if ((uint64_t)((v6 >> 1) - v7) < 1)
    {
      sub_18945AD44();
      swift_allocError();
      uint64_t v14 = v13;
      uint64_t v15 = 0xD00000000000001FLL;
      uint64_t v16 = 0x8000000189475F40LL;
      uint64_t v17 = 55LL;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)( v15,  v16,  (uint64_t)"SwiftASN1/ASN1Integer.swift",  27LL,  2,  v17,  v14);
      swift_willThrow();
      j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
      return;
    }

    if (v7 == v9)
    {
LABEL_20:
      uint64_t v11 = v7;
      goto LABEL_21;
    }

    if (v7 < v9)
    {
      int v10 = *(unsigned __int8 *)(v4 + v7);
      uint64_t v11 = v7 + 1;
      if (v7 + 1 == v9)
      {
        if (!*(_BYTE *)(v4 + v7))
        {
          uint64_t v11 = v6 >> 1;
LABEL_21:
          sub_18945F280(v5, v4, v11, v6);
          return;
        }

uint64_t sub_189460C18(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return sub_189460C34( a1,  a2,  a3,  (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t))sub_18945F414);
}

uint64_t sub_189460C34( uint64_t result, uint64_t a2, unsigned __int8 a3, uint64_t (*a4)(uint64_t, uint64_t, unint64_t, unint64_t))
{
  uint64_t v4 = result;
  if (*(void *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27LL, 2, 46LL, v14);
    sub_18945DC58(v4);
    return swift_willThrow();
  }

  if (*(_BYTE *)(result + 56) != 1) {
    goto LABEL_28;
  }
  uint64_t v7 = *(void *)(result + 16);
  uint64_t v6 = *(void *)(result + 24);
  uint64_t v9 = *(void *)(result + 32);
  unint64_t v8 = *(void *)(result + 40);
  uint64_t v10 = *(void *)(result + 48);
  swift_unknownObjectRetain();
  uint64_t result = sub_18945DC58(v4);
  int64_t v11 = v8 >> 1;
  if (__OFSUB__(v8 >> 1, v9))
  {
    __break(1u);
  }

  else
  {
    if ((uint64_t)((v8 >> 1) - v9) < 1)
    {
      sub_18945AD44();
      swift_allocError();
      uint64_t v16 = v15;
      uint64_t v17 = 0xD00000000000001FLL;
      uint64_t v18 = 0x8000000189475F40LL;
      uint64_t v19 = 55LL;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)( v17,  v18,  (uint64_t)"SwiftASN1/ASN1Integer.swift",  27LL,  2,  v19,  v16);
      swift_willThrow();
      return j__swift_unknownObjectRelease(v7, v6, v9, v8, v10, 1LL);
    }

    if (v9 == v11)
    {
LABEL_20:
      unint64_t v13 = v9;
      return a4(v7, v6, v13, v8);
    }

    if (v9 < v11)
    {
      int v12 = *(unsigned __int8 *)(v6 + v9);
      unint64_t v13 = v9 + 1;
      if (v9 + 1 == v11)
      {
        if (!*(_BYTE *)(v6 + v9))
        {
          unint64_t v13 = v8 >> 1;
          return a4(v7, v6, v13, v8);
        }

uint64_t ASN1IntegerRepresentable.init(derEncoded:withIdentifier:)( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v4 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  unint64_t v6 = *(void *)(result + 40);
  uint64_t v8 = *(void *)(result + 48);
  uint64_t v9 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result != *(void *)a2 || *(unsigned __int8 *)(result + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27LL, 2, 46LL, v16);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }

  if (!*(_BYTE *)(result + 56)) {
    goto LABEL_31;
  }
  uint64_t v12 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v12, v4, v7, v6, v8, 1LL);
  uint64_t result = swift_unknownObjectRelease();
  int64_t v13 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v7))
  {
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }

  if ((uint64_t)((v6 >> 1) - v7) < 1)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v18 = v17;
    uint64_t v19 = 0xD00000000000001FLL;
    uint64_t v20 = 0x8000000189475F40LL;
    uint64_t v21 = 55LL;
    goto LABEL_19;
  }

  if (v7 == v13) {
    goto LABEL_13;
  }
  if (v7 >= v13) {
    goto LABEL_28;
  }
  if (v7 + 1 == v13) {
    goto LABEL_13;
  }
  if (v7 + 1 < v13)
  {
    int v14 = *(char *)(v4 + v7 + 1);
    if (*(_BYTE *)(v4 + v7))
    {
      if (*(unsigned __int8 *)(v4 + v7) != 255 || (v14 & 0x80000000) == 0)
      {
LABEL_13:
        uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 32);
        swift_unknownObjectRetain();
        uint64_t result = v15(a3, a4);
        if ((result & 1) != 0 || v7 == v13)
        {
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a4 + 40))( v5,  v4,  v7,  v6,  a3,  a4);
        }

        if (v7 < v13)
        {
          int v22 = *(char *)(v4 + v7);
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
          if (!v22) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a4 + 40))( v5,  v4,  ++v7,  v6,  a3,  a4);
          }
          if ((v22 & 0x80000000) == 0) {
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a4 + 40))( v5,  v4,  v7,  v6,  a3,  a4);
          }
          sub_18945AD44();
          swift_allocError();
          uint64_t v19 = 0xD000000000000021LL;
          uint64_t v18 = v23;
          uint64_t v20 = 0x8000000189475F60LL;
          uint64_t v21 = 77LL;
          goto LABEL_19;
        }

        goto LABEL_30;
      }
    }

    else if (v14 < 0)
    {
      goto LABEL_13;
    }

    sub_18945AD44();
    swift_allocError();
    uint64_t v19 = 0xD00000000000002ELL;
    uint64_t v18 = v24;
    uint64_t v20 = 0x8000000189475F90LL;
    uint64_t v21 = 67LL;
LABEL_19:
    static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)( v19,  v20,  (uint64_t)"SwiftASN1/ASN1Integer.swift",  27LL,  2,  v21,  v18);
    swift_willThrow();
    return j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
  }

LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t ASN1IntegerRepresentable.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_189465618);
}

uint64_t sub_189461294(int64_t a1, uint64_t *a2)
{
  return sub_189461738( a1,  a2,  (uint64_t (*)(unint64_t, unint64_t, void, int64_t))sub_189469304,  (uint64_t (*)(unint64_t, void, unint64_t))sub_189467D20,  (uint64_t (*)(unint64_t, unint64_t, unint64_t))sub_189466B90);
}

uint64_t sub_1894612C0(unint64_t a1, char **a2)
{
  return sub_189461CB0( a1,  a2,  (uint64_t (*)(unint64_t, unint64_t, void, int64_t))sub_189469308,  (uint64_t (*)(unint64_t, void, unint64_t))sub_189467D20,  (uint64_t (*)(unint64_t, unint64_t, unint64_t))sub_189466BA4,  (uint64_t (*)(unint64_t))sub_189466E0C);
}

uint64_t sub_1894612F4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char **a5)
{
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_16;
  }

  char v5 = a5;
  if (a4 >> 1 != a3)
  {
    if ((uint64_t)(a4 >> 1) <= a3)
    {
      __break(1u);
    }

    else
    {
      unint64_t v6 = a4;
      uint64_t v7 = a2;
      if ((*(char *)(a2 + a3) & 0x80000000) == 0)
      {
        uint64_t v13 = sub_189462164(a1, a2, a3, a4);
        sub_189469594(v13, v14, v15, v16);
        return swift_unknownObjectRelease();
      }

      uint64_t v8 = *a5;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *char v5 = v8;
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
LABEL_11:
        unint64_t v18 = *((void *)v8 + 2);
        unint64_t v19 = *((void *)v8 + 3);
        unint64_t v20 = v18 + 1;
        if (v18 >= v19 >> 1)
        {
          unint64_t v25 = v18 + 1;
          int v22 = v8;
          unint64_t v23 = *((void *)v8 + 2);
          BOOL v24 = sub_18945AF98((char *)(v19 > 1), v18 + 1, 1, v22);
          unint64_t v18 = v23;
          unint64_t v20 = v25;
          uint64_t v8 = v24;
        }

        *((void *)v8 + 2) = v20;
        v8[v18 + 32] = 0;
        *char v5 = v8;
        uint64_t v21 = swift_unknownObjectRetain();
        sub_189469594(v21, v7, a3, v6);
        return swift_unknownObjectRelease();
      }
    }

    uint64_t v8 = sub_18945AF98(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
    *char v5 = v8;
    goto LABEL_11;
  }

  unint64_t v6 = (unint64_t)*a5;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *char v5 = v6;
  if ((result & 1) == 0)
  {
LABEL_16:
    uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v6 + 16) + 1LL, 1, (char *)v6);
    unint64_t v6 = result;
    *char v5 = result;
  }

  unint64_t v11 = *(void *)(v6 + 16);
  unint64_t v10 = *(void *)(v6 + 24);
  if (v11 >= v10 >> 1)
  {
    uint64_t result = (uint64_t)sub_18945AF98((char *)(v10 > 1), v11 + 1, 1, (char *)v6);
    unint64_t v6 = result;
  }

  *(void *)(v6 + 16) = v11 + 1;
  *(_BYTE *)(v6 + v11 + 32) = 0;
  *char v5 = v6;
  return result;
}

uint64_t sub_1894614B0(uint64_t a1, uint64_t *a2)
{
  if ((_BYTE)a1)
  {
    sub_1894625E0( a1,  (uint64_t (*)(uint64_t, uint64_t, void, uint64_t))sub_18946930C,  (uint64_t (*)(uint64_t, void, uint64_t))sub_189467D24,  (uint64_t)v7);
    return sub_189466E18(v7[0], v7[1], v8);
  }

  else
  {
    uint64_t v4 = *a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v4;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v4 + 16) + 1LL, 1, (char *)v4);
      uint64_t v4 = result;
      *a2 = result;
    }

    unint64_t v6 = *(void *)(v4 + 16);
    unint64_t v5 = *(void *)(v4 + 24);
    if (v6 >= v5 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v5 > 1), v6 + 1, 1, (char *)v4);
      uint64_t v4 = result;
    }

    *(void *)(v4 + 16) = v6 + 1;
    *(_BYTE *)(v4 + v6 + 32) = 0;
    *a2 = v4;
  }

  return result;
}

uint64_t sub_189461594(uint64_t a1, uint64_t *a2)
{
  if ((_WORD)a1)
  {
    sub_18946226C(a1, (uint64_t)v7);
    return sub_189466E2C(v7[0], v7[1], v8);
  }

  else
  {
    uint64_t v4 = *a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v4;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v4 + 16) + 1LL, 1, (char *)v4);
      uint64_t v4 = result;
      *a2 = result;
    }

    unint64_t v6 = *(void *)(v4 + 16);
    unint64_t v5 = *(void *)(v4 + 24);
    if (v6 >= v5 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v5 > 1), v6 + 1, 1, (char *)v4);
      uint64_t v4 = result;
    }

    *(void *)(v4 + 16) = v6 + 1;
    *(_BYTE *)(v4 + v6 + 32) = 0;
    *a2 = v4;
  }

  return result;
}

uint64_t sub_189461668(uint64_t a1, uint64_t *a2)
{
  if ((_DWORD)a1)
  {
    sub_18946236C(a1, (uint64_t)v7);
    return sub_189466E40(v7[0], v7[1], v8);
  }

  else
  {
    uint64_t v4 = *a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v4;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v4 + 16) + 1LL, 1, (char *)v4);
      uint64_t v4 = result;
      *a2 = result;
    }

    unint64_t v6 = *(void *)(v4 + 16);
    unint64_t v5 = *(void *)(v4 + 24);
    if (v6 >= v5 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v5 > 1), v6 + 1, 1, (char *)v4);
      uint64_t v4 = result;
    }

    *(void *)(v4 + 16) = v6 + 1;
    *(_BYTE *)(v4 + v6 + 32) = 0;
    *a2 = v4;
  }

  return result;
}

uint64_t sub_189461738( int64_t a1, uint64_t *a2, uint64_t (*a3)(unint64_t, unint64_t, void, int64_t), uint64_t (*a4)(unint64_t, void, unint64_t), uint64_t (*a5)(unint64_t, unint64_t, unint64_t))
{
  if (a1)
  {
    sub_1894624B0(a1, a3, a4, v11);
    return a5(v11[0], v11[1], v11[2]);
  }

  else
  {
    uint64_t v8 = *a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v8;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v8 + 16) + 1LL, 1, (char *)v8);
      uint64_t v8 = result;
      *a2 = result;
    }

    unint64_t v10 = *(void *)(v8 + 16);
    unint64_t v9 = *(void *)(v8 + 24);
    if (v10 >= v9 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v9 > 1), v10 + 1, 1, (char *)v8);
      uint64_t v8 = result;
    }

    *(void *)(v8 + 16) = v10 + 1;
    *(_BYTE *)(v8 + v10 + 32) = 0;
    *a2 = v8;
  }

  return result;
}

uint64_t sub_189461814(uint64_t a1, char **a2)
{
  if ((_BYTE)a1)
  {
    unsigned int v3 = a1;
    if ((a1 & 0x80) != 0)
    {
      uint64_t v8 = *a2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v8;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v8 = sub_18945AF98(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        *a2 = v8;
      }

      unint64_t v10 = *((void *)v8 + 2);
      unint64_t v11 = *((void *)v8 + 3);
      unint64_t v12 = v10 + 1;
      if (v10 >= v11 >> 1)
      {
        unint64_t v18 = v10 + 1;
        uint64_t v13 = v8;
        unint64_t v14 = v10;
        uint64_t v15 = sub_18945AF98((char *)(v11 > 1), v10 + 1, 1, v13);
        unint64_t v10 = v14;
        unint64_t v12 = v18;
        uint64_t v8 = v15;
      }

      *((void *)v8 + 2) = v12;
      v8[v10 + 32] = 0;
      *a2 = v8;
      return sub_1894670D0(v3);
    }

    else
    {
      sub_1894625E0( a1,  (uint64_t (*)(uint64_t, uint64_t, void, uint64_t))sub_1894693FC,  (uint64_t (*)(uint64_t, void, uint64_t))sub_189467D24,  (uint64_t)v16);
      return sub_189466E54(v16[0], v16[1], v17);
    }
  }

  else
  {
    uint64_t v5 = (uint64_t)*a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v5;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v5 + 16) + 1LL, 1, (char *)v5);
      uint64_t v5 = result;
      *a2 = (char *)result;
    }

    unint64_t v7 = *(void *)(v5 + 16);
    unint64_t v6 = *(void *)(v5 + 24);
    if (v7 >= v6 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v6 > 1), v7 + 1, 1, (char *)v5);
      uint64_t v5 = result;
    }

    *(void *)(v5 + 16) = v7 + 1;
    *(_BYTE *)(v5 + v7 + 32) = 0;
    *a2 = (char *)v5;
  }

  return result;
}

uint64_t sub_189461998(uint64_t a1, char **a2)
{
  if ((_WORD)a1)
  {
    if ((sub_18946348C((unsigned __int16)(39 - __clz((unsigned __int16)a1)) >> 3, a1) & 0x80) != 0)
    {
      uint64_t v8 = *a2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v8;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v8 = sub_18945AF98(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        *a2 = v8;
      }

      unint64_t v10 = *((void *)v8 + 2);
      unint64_t v11 = *((void *)v8 + 3);
      unint64_t v12 = v10 + 1;
      if (v10 >= v11 >> 1)
      {
        unint64_t v18 = v10 + 1;
        uint64_t v13 = v8;
        unint64_t v14 = v10;
        uint64_t v15 = sub_18945AF98((char *)(v11 > 1), v10 + 1, 1, v13);
        unint64_t v10 = v14;
        unint64_t v12 = v18;
        uint64_t v8 = v15;
      }

      *((void *)v8 + 2) = v12;
      v8[v10 + 32] = 0;
      *a2 = v8;
      return sub_1894674E0(a1);
    }

    else
    {
      sub_189462684(a1, (uint64_t)v16);
      return sub_189467244(v16[0], v16[1], v17);
    }
  }

  else
  {
    uint64_t v5 = (uint64_t)*a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v5;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v5 + 16) + 1LL, 1, (char *)v5);
      uint64_t v5 = result;
      *a2 = (char *)result;
    }

    unint64_t v7 = *(void *)(v5 + 16);
    unint64_t v6 = *(void *)(v5 + 24);
    if (v7 >= v6 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v6 > 1), v7 + 1, 1, (char *)v5);
      uint64_t v5 = result;
    }

    *(void *)(v5 + 16) = v7 + 1;
    *(_BYTE *)(v5 + v7 + 32) = 0;
    *a2 = (char *)v5;
  }

  return result;
}

uint64_t sub_189461B28(uint64_t a1, char **a2)
{
  if ((_DWORD)a1)
  {
    if ((sub_1894634E0((39 - __clz(a1)) >> 3, a1) & 0x80) != 0)
    {
      uint64_t v8 = *a2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v8;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v8 = sub_18945AF98(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        *a2 = v8;
      }

      unint64_t v10 = *((void *)v8 + 2);
      unint64_t v11 = *((void *)v8 + 3);
      unint64_t v12 = v10 + 1;
      if (v10 >= v11 >> 1)
      {
        unint64_t v18 = v10 + 1;
        uint64_t v13 = v8;
        unint64_t v14 = v10;
        uint64_t v15 = sub_18945AF98((char *)(v11 > 1), v10 + 1, 1, v13);
        unint64_t v10 = v14;
        unint64_t v12 = v18;
        uint64_t v8 = v15;
      }

      *((void *)v8 + 2) = v12;
      v8[v10 + 32] = 0;
      *a2 = v8;
      return sub_18946795C(a1);
    }

    else
    {
      sub_18946275C(a1, (uint64_t)v16);
      return sub_1894676CC(v16[0], v16[1], v17);
    }
  }

  else
  {
    uint64_t v5 = (uint64_t)*a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v5;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v5 + 16) + 1LL, 1, (char *)v5);
      uint64_t v5 = result;
      *a2 = (char *)result;
    }

    unint64_t v7 = *(void *)(v5 + 16);
    unint64_t v6 = *(void *)(v5 + 24);
    if (v7 >= v6 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v6 > 1), v7 + 1, 1, (char *)v5);
      uint64_t v5 = result;
    }

    *(void *)(v5 + 16) = v7 + 1;
    *(_BYTE *)(v5 + v7 + 32) = 0;
    *a2 = (char *)v5;
  }

  return result;
}

uint64_t sub_189461CB0( unint64_t a1, char **a2, uint64_t (*a3)(unint64_t, unint64_t, void, int64_t), uint64_t (*a4)(unint64_t, void, unint64_t), uint64_t (*a5)(unint64_t, unint64_t, unint64_t), uint64_t (*a6)(unint64_t))
{
  if (a1)
  {
    if ((sub_189463530((71 - __clz(a1)) >> 3, a1) & 0x80) != 0)
    {
      unint64_t v16 = *a2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v16;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v16 = sub_18945AF98(0LL, *((void *)v16 + 2) + 1LL, 1, v16);
        *a2 = v16;
      }

      unint64_t v19 = *((void *)v16 + 2);
      unint64_t v18 = *((void *)v16 + 3);
      if (v19 >= v18 >> 1) {
        unint64_t v16 = sub_18945AF98((char *)(v18 > 1), v19 + 1, 1, v16);
      }
      *((void *)v16 + 2) = v19 + 1;
      v16[v19 + 32] = 0;
      *a2 = v16;
      return a6(a1);
    }

    else
    {
      sub_18946293C(a1, a3, a4, v20);
      return a5(v20[0], v20[1], v20[2]);
    }
  }

  else
  {
    uint64_t v13 = (uint64_t)*a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v13;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v13 + 16) + 1LL, 1, (char *)v13);
      uint64_t v13 = result;
      *a2 = (char *)result;
    }

    unint64_t v15 = *(void *)(v13 + 16);
    unint64_t v14 = *(void *)(v13 + 24);
    if (v15 >= v14 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v14 > 1), v15 + 1, 1, (char *)v13);
      uint64_t v13 = result;
    }

    *(void *)(v13 + 16) = v15 + 1;
    *(_BYTE *)(v13 + v15 + 32) = 0;
    *a2 = (char *)v13;
  }

  return result;
}

uint64_t sub_189461E48(uint64_t a1, char **a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  unint64_t v10 = (char *)&v23 - v9;
  uint64_t v11 = swift_checkMetadataState();
  uint64_t v24 = *(void *)(v11 - 8);
  MEMORY[0x1895F8858](v11);
  unint64_t v25 = (char *)&v23 - v12;
  uint64_t v27 = a1;
  if (sub_189473830())
  {
    if (((*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4) & 1) != 0
      || (sub_189473854(), v29 == 1)
      || (v28 & 0x80000000) == 0)
    {
      sub_189462A44((uint64_t)v10);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C797620);
      swift_getAssociatedConformanceWitness();
      return sub_1894737E8();
    }

    else
    {
      unsigned int v17 = *a2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v17;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unsigned int v17 = sub_18945AF98(0LL, *((void *)v17 + 2) + 1LL, 1, v17);
        *a2 = v17;
      }

      uint64_t v20 = v24;
      unint64_t v19 = v25;
      unint64_t v22 = *((void *)v17 + 2);
      unint64_t v21 = *((void *)v17 + 3);
      if (v22 >= v21 >> 1) {
        unsigned int v17 = sub_18945AF98((char *)(v21 > 1), v22 + 1, 1, v17);
      }
      *((void *)v17 + 2) = v22 + 1;
      v17[v22 + 32] = 0;
      *a2 = v17;
      (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v19, v27, v11);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C797620);
      return sub_1894737E8();
    }
  }

  else
  {
    uint64_t v14 = (uint64_t)*a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v14;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v14 + 16) + 1LL, 1, (char *)v14);
      uint64_t v14 = result;
      *a2 = (char *)result;
    }

    unint64_t v16 = *(void *)(v14 + 16);
    unint64_t v15 = *(void *)(v14 + 24);
    if (v16 >= v15 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v15 > 1), v16 + 1, 1, (char *)v14);
      uint64_t v14 = result;
    }

    *(void *)(v14 + 16) = v16 + 1;
    *(_BYTE *)(v14 + v16 + 32) = 0;
    *a2 = (char *)v14;
  }

  return result;
}

uint64_t sub_189462164(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  if ((uint64_t)(a4 >> 1) < a3)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }

  uint64_t v5 = a3;
  if (a4 >> 1 == a3) {
    return swift_unknownObjectRetain();
  }
  if (v4 <= a3) {
    goto LABEL_31;
  }
  int v6 = *(unsigned __int8 *)(a2 + a3);
  if (v6 != 255 && v6 != 0) {
    return swift_unknownObjectRetain();
  }
  if (!__OFSUB__(v4, a3))
  {
    if (v4 - a3 >= 2)
    {
      if (a3 <= v4) {
        unint64_t v8 = a4 >> 1;
      }
      else {
        unint64_t v8 = a3;
      }
      int v9 = *(unsigned __int8 *)(a2 + a3);
      while (v4 != v5)
      {
        if (v8 == v5)
        {
          __break(1u);
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }

        if (v9 != v6) {
          return swift_unknownObjectRetain();
        }
        if (__OFSUB__(v4, v5)) {
          goto LABEL_26;
        }
        if (v4 - 1 == v5) {
          goto LABEL_27;
        }
        uint64_t v10 = v5 + 1;
        if (v5 + 1 >= v4) {
          goto LABEL_28;
        }
        int v9 = *(unsigned __int8 *)(a2 + 1 + v5);
        if (((v9 ^ v6) & 0x80) != 0) {
          return swift_unknownObjectRetain();
        }
        BOOL v11 = __OFSUB__(v4, v10);
        uint64_t v12 = v4 - v10;
        if (v11) {
          goto LABEL_29;
        }
        ++v5;
        if (v12 <= 1) {
          return swift_unknownObjectRetain();
        }
      }
    }

    return swift_unknownObjectRetain();
  }

LABEL_32:
  __break(1u);
  return result;
}

    *((void *)v4 + 2) = v3;
  }

    *((void *)v4 + 2) = v3;
  }

    *((void *)v6 + 2) = v5;
  }

uint64_t sub_18946226C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if ((_WORD)result)
  {
    int v3 = result;
    unint64_t v4 = (unsigned __int16)(32 - __clz((unsigned __int16)result)) + 7LL;
    unint64_t v5 = v4 >> 3;
    uint64_t result = sub_189463300(v4 >> 3, result);
    unsigned __int8 v6 = result;
    if ((_BYTE)result && result != 255
      || (uint64_t result = sub_189467D28(v5, 0LL, v3), result < 2)
      || v6 != ((unsigned __int16)v3 >> (8 * ((v5 - 1) & 1))))
    {
LABEL_12:
      *(void *)a2 = v5;
      *(void *)(a2 + 8) = 0LL;
      *(_WORD *)(a2 + 16) = v3;
      return result;
    }

    if (v5 == 1)
    {
      __break(1u);
    }

    else if ((unsigned __int16)v3 >= 0x100u)
    {
      int v7 = (unsigned __int16)v3 >> (v4 & 8);
      if (((v7 ^ v6) & 0x80u) == 0) {
        --v5;
      }
      goto LABEL_12;
    }

    __break(1u);
  }

  else
  {
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
    *(_WORD *)(a2 + 16) = 0;
  }

  return result;
}

uint64_t sub_18946236C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if ((_DWORD)result)
  {
    unsigned int v3 = result;
    unint64_t v4 = 32 - __clz(result) + 7LL;
    unint64_t v5 = v4 >> 3;
    uint64_t result = sub_1894633A0(v4 >> 3, result);
    int v6 = result;
    if ((_BYTE)result && result != 255 || (uint64_t result = sub_189467D2C(v5, 0LL, v3), result < 2))
    {
LABEL_20:
      *(void *)a2 = v5;
      *(void *)(a2 + 8) = 0LL;
      *(_DWORD *)(a2 + 16) = v3;
    }

    else
    {
      uint64_t v7 = 0LL;
      uint64_t v8 = 8 * v5;
      uint64_t v9 = 8 * v5 - 8;
      int v10 = -16;
      int v11 = -8;
      while (1)
      {
        if (v8 == v7)
        {
          unint64_t v5 = 0LL;
          goto LABEL_20;
        }

        else {
          unsigned __int8 v12 = v3 << ((v7 - (v4 & 0xF8) + 8) & 0x18);
        }
        if (v9 == v7) {
          break;
        }
        else {
          unsigned int v13 = v3 << ((v7 - (v4 & 0xF8) + 16) & 0x18);
        }
        if (((v6 ^ v13) & 0x80) != 0) {
          goto LABEL_20;
        }
        --v5;
        v7 += 8LL;
        v10 -= 8;
        v11 -= 8;
        if (v5 <= 1)
        {
          unint64_t v5 = 1LL;
          goto LABEL_20;
        }
      }

      __break(1u);
    }
  }

  else
  {
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
    *(_DWORD *)(a2 + 16) = 0;
  }

  return result;
}

int64_t sub_1894624B0@<X0>( int64_t result@<X0>, uint64_t (*a2)(unint64_t, unint64_t, void, int64_t)@<X1>, uint64_t (*a3)(unint64_t, void, unint64_t)@<X2>, unint64_t *a4@<X8>)
{
  if (result)
  {
    unint64_t v6 = result;
    unint64_t v7 = (71 - __clz(result)) >> 3;
    uint64_t result = a2(v7, v7, 0LL, result);
    int v8 = result;
    if ((_BYTE)result && result != 255 || (uint64_t result = a3(v7, 0LL, v6), result < 2))
    {
LABEL_19:
      *a4 = v7;
      a4[1] = 0LL;
      a4[2] = v6;
    }

    else
    {
      uint64_t v9 = 8 * v7;
      char v10 = 16 - 8 * v7;
      while (1)
      {
        if (!v9)
        {
          unint64_t v7 = 0LL;
          goto LABEL_19;
        }

        if (v9 - 8 < 0) {
          unint64_t v11 = v6 << ((v10 - 8) & 0x38);
        }
        else {
          unint64_t v11 = v6 >> ((v9 - 8) & 0x38);
        }
        uint64_t v12 = v9 - 8;
        if (v9 == 8) {
          break;
        }
        BOOL v13 = v9 < 16;
        unint64_t v14 = v6 >> ((v9 + 48) & 0x38);
        if (v13) {
          unint64_t v14 = v6 << (v10 & 0x38);
        }
        --v7;
        v10 += 8;
        uint64_t v9 = v12;
        if (v7 <= 1)
        {
          unint64_t v7 = 1LL;
          goto LABEL_19;
        }
      }

      __break(1u);
    }
  }

  else
  {
    *a4 = 0LL;
    a4[1] = 0LL;
    a4[2] = 0LL;
  }

  return result;
}

uint64_t sub_1894625E0@<X0>( uint64_t result@<X0>, uint64_t (*a2)(uint64_t, uint64_t, void, uint64_t)@<X1>, uint64_t (*a3)(uint64_t, void, uint64_t)@<X2>, uint64_t a4@<X8>)
{
  if ((_BYTE)result)
  {
    uint64_t v6 = result;
    uint64_t result = a2(1LL, 1LL, 0LL, result);
    unsigned __int8 v7 = result;
    if ((!(_BYTE)result || result == 255)
      && (uint64_t result = a3(1LL, 0LL, v6), v7 == v6)
      && result > 1)
    {
      __break(1u);
    }

    else
    {
      *(_OWORD *)a4 = xmmword_189473FF0;
      *(_BYTE *)(a4 + 16) = v6;
    }
  }

  else
  {
    *(void *)a4 = 0LL;
    *(void *)(a4 + 8) = 0LL;
    *(_BYTE *)(a4 + 16) = 0;
  }

  return result;
}

uint64_t sub_189462684@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if ((_WORD)result)
  {
    unsigned __int16 v3 = result;
    unint64_t v4 = ((unint64_t)(unsigned __int16)(32 - __clz((unsigned __int16)result)) + 7) >> 3;
    uint64_t result = sub_18946348C(v4, result);
    unsigned __int8 v5 = result;
    uint64_t result = sub_189467D28(v4, 0LL, v3);
    if (v4 == 1)
    {
      __break(1u);
    }

    else if (v3 >= 0x100u)
    {
      if (((v5 ^ v3) & 0x80u) == 0) {
        --v4;
      }
LABEL_10:
      *(void *)a2 = v4;
      *(void *)(a2 + 8) = 0LL;
      *(_WORD *)(a2 + 16) = v3;
      return result;
    }

    __break(1u);
  }

  else
  {
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
    *(_WORD *)(a2 + 16) = 0;
  }

  return result;
}

uint64_t sub_18946275C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (!(_DWORD)result)
  {
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
    *(_DWORD *)(a2 + 16) = 0;
    return result;
  }

  unsigned int v3 = result;
  uint64_t v4 = 32 - __clz(result);
  unint64_t v5 = (unint64_t)(v4 + 7) >> 3;
  uint64_t result = sub_1894634E0(v5, result);
  int v6 = result;
  if ((_BYTE)result && result != 255)
  {
    *(void *)a2 = v5;
    goto LABEL_30;
  }

  uint64_t result = sub_189467D2C((unint64_t)(v4 + 7) >> 3, 0LL, v3);
  if (result < 2 || (unint64_t v7 = v5 - 1, v6 != (v3 >> (8 * ((v5 - 1) & 3)))))
  {
    unint64_t v8 = (unint64_t)(v4 + 7) >> 3;
    goto LABEL_28;
  }

  if (v5 == 1) {
    goto LABEL_34;
  }
  if (v3 < 0x100) {
    goto LABEL_35;
  }
  unint64_t v8 = (unint64_t)(v4 + 7) >> 3;
  if (((v6 ^ (v3 >> ((v4 + 23) & 0x18))) & 0x80) != 0)
  {
LABEL_28:
    *(void *)a2 = v8;
LABEL_30:
    *(void *)(a2 + 8) = 0LL;
    *(_DWORD *)(a2 + 16) = v3;
    return result;
  }

  if (v7 < 2)
  {
LABEL_31:
    unint64_t v8 = 1LL;
    goto LABEL_28;
  }

  unint64_t v9 = v5 - 2;
  if (v6 != (v3 >> (8 * ((v5 - 2) & 3))))
  {
LABEL_32:
    unint64_t v8 = v7;
    goto LABEL_28;
  }

  if (v5 == 2)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (v3 < 0x10000) {
    goto LABEL_35;
  }
  unint64_t v8 = v5 - 1;
  if (((v6 ^ (v3 >> ((8 * v7 + 16) & 0x18))) & 0x80) != 0) {
    goto LABEL_28;
  }
  if (v9 < 2) {
    goto LABEL_31;
  }
  unint64_t v7 = v5 - 3;
  if (v6 != (v3 >> (8 * ((v5 - 3) & 3))))
  {
    unint64_t v8 = v5 - 2;
    goto LABEL_28;
  }

  if (v5 == 3) {
    goto LABEL_34;
  }
  if (!HIBYTE(v3)) {
    goto LABEL_35;
  }
  unint64_t v8 = v5 - 2;
  if (((v6 ^ (v3 >> ((8 * v9 + 16) & 0x18))) & 0x80) != 0) {
    goto LABEL_28;
  }
  if (v7 < 2) {
    goto LABEL_31;
  }
  if (v5 == 4) {
    goto LABEL_34;
  }
  if (v4 >= 0x21)
  {
    if (((v6 ^ (v3 >> ((8 * v7 + 16) & 0x18))) & 0x80u) == 0) {
      unint64_t v8 = 1LL;
    }
    else {
      unint64_t v8 = v5 - 3;
    }
    goto LABEL_28;
  }

LABEL_35:
  __break(1u);
  return result;
}

int64_t sub_18946293C@<X0>( int64_t result@<X0>, uint64_t (*a2)(unint64_t, unint64_t, void, int64_t)@<X1>, uint64_t (*a3)(unint64_t, void, unint64_t)@<X2>, unint64_t *a4@<X8>)
{
  if (result)
  {
    unint64_t v6 = result;
    unint64_t v7 = (71 - __clz(result)) >> 3;
    uint64_t result = a2(v7, v7, 0LL, result);
    int v8 = result;
    if ((_BYTE)result && result != 255 || (uint64_t result = a3(v7, 0LL, v6), result < 2))
    {
LABEL_15:
      *a4 = v7;
      a4[1] = 0LL;
      a4[2] = v6;
    }

    else
    {
      uint64_t v9 = 8 * v7;
      while (1)
      {
        if (!v9)
        {
          unint64_t v7 = 0LL;
          goto LABEL_15;
        }

        if (v9 == 8) {
          break;
        }
        if (v9 < 16) {
          goto LABEL_17;
        }
        --v7;
        v9 -= 8LL;
        if (v7 <= 1)
        {
          unint64_t v7 = 1LL;
          goto LABEL_15;
        }
      }

      __break(1u);
LABEL_17:
      __break(1u);
    }
  }

  else
  {
    *a4 = 0LL;
    a4[1] = 0LL;
    a4[2] = 0LL;
  }

  return result;
}

uint64_t sub_189462A44@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v20 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = MEMORY[0x1895F8858](v4);
  int v8 = (char *)&v18 - v7;
  uint64_t v9 = MEMORY[0x1895F8858](v6);
  unint64_t v11 = (char *)&v18 - v10;
  MEMORY[0x1895F8858](v9);
  BOOL v13 = (char *)&v18 - v12;
  sub_189473878();
  swift_getAssociatedConformanceWitness();
  sub_189473854();
  if ((v26 & 1) != 0) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v13, AssociatedTypeWitness);
  }
  int v14 = v25;
  if (v25)
  {
    if (v25 != 255) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v13, AssociatedTypeWitness);
    }
  }

  uint64_t v19 = a1;
  if (sub_189473830() >= 2)
  {
    while (1)
    {
      sub_189473854();
      if ((v24 & 1) != 0 || v23 != v14) {
        break;
      }
      unint64_t v15 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
      v15(v8, v13, AssociatedTypeWitness);
      sub_18947386C();
      sub_189473854();
      unint64_t v16 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
      uint64_t result = v16(v11, AssociatedTypeWitness);
      if ((v22 & 1) != 0)
      {
        __break(1u);
        return result;
      }

      if (((v21 ^ v14) & 0x80) == 0)
      {
        v15(v20, v13, AssociatedTypeWitness);
        sub_18947386C();
        v16(v13, AssociatedTypeWitness);
        (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v13, v8, AssociatedTypeWitness);
        if (sub_189473830() > 1) {
          continue;
        }
      }

      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(v19, v13, AssociatedTypeWitness);
    }
  }

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(v19, v13, AssociatedTypeWitness);
}

uint64_t ASN1IntegerRepresentable<>.init(derIntegerBytes:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v43 = a7;
  uint64_t v49 = a8;
  uint64_t v47 = *(void *)(a6 + 8);
  uint64_t v46 = *(void *)(*(void *)(v47 + 24) + 16LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v45 = (char *)v38 - v15;
  uint64_t v48 = *(void *)(a5 - 8);
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  uint64_t v18 = (char *)v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = MEMORY[0x1895F8858](v16);
  unsigned __int8 v21 = (char *)v38 - v20;
  MEMORY[0x1895F8858](v19);
  unsigned __int8 v23 = (char *)v38 - v22;
  v50[0] = a1;
  v50[1] = a2;
  uint64_t v40 = a2;
  unint64_t v41 = a4;
  uint64_t AssociatedConformanceWitness = a3;
  v50[2] = a3;
  v50[3] = a4;
  swift_unknownObjectRetain();
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C797668);
  sub_1894661F0(&qword_18C797670, &qword_18C797668, MEMORY[0x189618FA0]);
  unsigned __int8 v25 = v51;
  sub_189459AF0((uint64_t)v50, a5, v24, a6, (uint64_t)v23);
  if (v25) {
    return swift_unknownObjectRelease();
  }
  v38[1] = 0LL;
  v38[2] = a1;
  unint64_t v39 = v21;
  uint64_t v51 = v18;
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v49, v23, a5);
  uint64_t result = (*(uint64_t (**)(uint64_t))(v43 + 32))(a5);
  if ((result & 1) == 0 || v41 >> 1 == AssociatedConformanceWitness) {
    return swift_unknownObjectRelease();
  }
  if ((uint64_t)(v41 >> 1) <= AssociatedConformanceWitness)
  {
    __break(1u);
    goto LABEL_17;
  }

  if (*(char *)(v40 + AssociatedConformanceWitness) < 0)
  {
    uint64_t v27 = sub_189473920();
    uint64_t result = sub_1894739D4();
    BOOL v28 = __OFSUB__(v27, result);
    uint64_t v29 = v27 - result;
    if (!v28)
    {
      uint64_t v30 = sub_189473920();
      if (v29 < v30)
      {
        uint64_t v31 = v30;
        uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
        uint64_t v32 = v51;
        do
        {
          if (__OFADD__(v29, 8LL)) {
            uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v33 = v29 + 8;
          }
          sub_189473A10();
          sub_1894739F8();
          v50[0] = v29;
          sub_18945EA48();
          uint64_t v34 = v31;
          int64_t v35 = v39;
          sub_1894738FC();
          uint64_t v36 = *(void (**)(char *, uint64_t))(v48 + 8);
          v36(v32, a5);
          sub_189473908();
          int64_t v37 = v35;
          uint64_t v31 = v34;
          v36(v37, a5);
          uint64_t v29 = v33;
        }

        while (v33 < v34);
      }

      return swift_unknownObjectRelease();
    }

LABEL_17:
    __break(1u);
    return result;
  }

  return swift_unknownObjectRelease();
}

  uint64_t v6 = *a1;
  uint64_t v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  uint64_t v6 = *a1;
  uint64_t v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)( void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v17 = a1;
  uint64_t v5 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for IntegerBytesCollection(0LL, v8, v10, v9);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1895F8858](v11);
  uint64_t v14 = (char *)&v16 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v3, a3);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v14, v7, a3);
  v17(v14);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t IntegerBytesCollection.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 32LL))(a3, a1);
}

uint64_t IntegerBytesCollection.hash(into:)()
{
  return sub_189473728();
}

uint64_t static IntegerBytesCollection.== infix(_:_:)()
{
  return sub_189473770() & 1;
}

uint64_t IntegerBytesCollection.hashValue.getter()
{
  return sub_189473A7C();
}

uint64_t sub_1894631E8()
{
  return sub_189473A7C();
}

uint64_t sub_189463228()
{
  return static IntegerBytesCollection.== infix(_:_:)();
}

uint64_t sub_189463234()
{
  if (__OFSUB__(*v0, 1LL))
  {
    __break(1u);
  }

  else if ((unint64_t)(*v0 - 0x1000000000000001LL) >> 61 == 7)
  {
    sub_18945EA48();
    return sub_189473938();
  }

  __break(1u);
  return result;
}

uint64_t IntegerBytesCollection.startIndex.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_189459EE4();
  *a1 = result;
  return result;
}

void IntegerBytesCollection.endIndex.getter(void *a1@<X8>)
{
  *a1 = 0LL;
}

uint64_t IntegerBytesCollection.count.getter()
{
  return sub_189459EE4();
}

uint64_t sub_189463300(uint64_t result, int a2)
{
  uint64_t v2 = result - 1;
  if (__OFSUB__(result, 1LL))
  {
    __break(1u);
    goto LABEL_16;
  }

  if ((unint64_t)(result - 0x1000000000000001LL) >> 61 != 7)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v3 = 8 * v2;
  if (8 * v2 < -32768)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  if (v3 >= 0x8000)
  {
LABEL_18:
    __break(1u);
    return result;
  }

  uint64_t v4 = v2 << 51;
  unsigned int v5 = (unsigned __int16)a2 >> (v3 & 8);
  else {
    unsigned int v6 = a2 << (-BYTE6(v4) & 8);
  }
  if (v4 < 0) {
    return v6;
  }
  else {
    return v5;
  }
}

uint64_t sub_1894633A0(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1 - 1;
  if (__OFSUB__(a1, 1LL))
  {
    __break(1u);
    goto LABEL_12;
  }

  if ((unint64_t)(a1 - 0x1000000000000001LL) >> 61 != 7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v3 = 8 * v2;
  if (8 * v2 < (uint64_t)0xFFFFFFFF80000000LL)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  if (v3 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    else {
      return a2 << (-BYTE4(v2) & 0x18);
    }
  }

  v2 <<= 35;
  if (v2 < 0) {
    goto LABEL_15;
  }
  return a2 >> (v3 & 0x18);
}

uint64_t sub_189463444(uint64_t result, unsigned int a2)
{
  uint64_t v2 = result - 1;
  if (__OFSUB__(result, 1LL))
  {
    __break(1u);
    goto LABEL_9;
  }

  if ((unint64_t)(result - 0x1000000000000001LL) >> 61 != 7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  if (8 * v2 < 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  if ((unint64_t)(8 * v2) > 0xFF)
  {
LABEL_11:
    __break(1u);
    return result;
  }

  if ((v2 & 0x1F) != 0) {
    return 0LL;
  }
  else {
    return a2;
  }
}

uint64_t sub_18946348C(uint64_t result, unsigned __int16 a2)
{
  uint64_t v2 = result - 1;
  if (__OFSUB__(result, 1LL))
  {
    __break(1u);
    goto LABEL_9;
  }

  if ((unint64_t)(result - 0x1000000000000001LL) >> 61 != 7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  unint64_t v3 = 8 * v2;
  if (8 * v2 < 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  if (v3 >> 16)
  {
LABEL_11:
    __break(1u);
    return result;
  }

  unsigned int v4 = a2 >> (v3 & 8);
  if ((v2 & 0x1FFE) != 0) {
    return 0LL;
  }
  else {
    return v4;
  }
}

uint64_t sub_1894634E0(uint64_t result, unsigned int a2)
{
  uint64_t v2 = result - 1;
  if (__OFSUB__(result, 1LL))
  {
    __break(1u);
    goto LABEL_9;
  }

  if ((unint64_t)(result - 0x1000000000000001LL) >> 61 != 7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  unint64_t v3 = 8 * v2;
  if (8 * v2 < 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  if (HIDWORD(v3))
  {
LABEL_11:
    __break(1u);
    return result;
  }

  unsigned int v4 = a2 >> (v3 & 0x18);
  if ((v2 & 0x1FFFFFFC) != 0) {
    return 0LL;
  }
  else {
    return v4;
  }
}

uint64_t sub_189463530(uint64_t result, unint64_t a2)
{
  if (__OFSUB__(result, 1LL))
  {
    __break(1u);
    goto LABEL_8;
  }

  if ((unint64_t)(result - 0x1000000000000001LL) >> 61 != 7)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v2 = 8 * (result - 1);
  if ((v2 & 0x8000000000000000LL) != 0)
  {
LABEL_9:
    __break(1u);
    return result;
  }

  if (v2 >= 0x40) {
    return 0LL;
  }
  else {
    return (a2 >> (v2 & 0x38));
  }
}

uint64_t IntegerBytesCollection.subscript.getter(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v53 = *(void *)(a2 + 24);
  v47[1] = *(void *)(*(void *)(v53 + 8) + 24LL);
  swift_getAssociatedTypeWitness();
  uint64_t v52 = *(void *)(swift_getAssociatedConformanceWitness() + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v51 = (char *)v47 - v5;
  uint64_t v49 = *(void (***)(char *, char *, uint64_t))(v3 - 8);
  unsigned int v6 = v49;
  MEMORY[0x1895F8858](v4);
  uint64_t v8 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = swift_checkMetadataState();
  uint64_t v55 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](v9);
  v47[0] = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  uint64_t v48 = (char *)v47 - v13;
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  uint64_t v56 = (char *)v47 - v15;
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  uint64_t v18 = (void (**)(char *, char *, uint64_t))((char *)v47 - v17);
  uint64_t v19 = MEMORY[0x1895F8858](v16);
  unsigned __int8 v21 = (char *)v47 - v20;
  MEMORY[0x1895F8858](v19);
  unsigned __int8 v23 = (char *)v47 - v22;
  uint64_t v24 = *a1;
  v6[2](v8, v50, v3);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_1894738D8();
  uint64_t v58 = v24;
  type metadata accessor for IntegerBytesCollection.Index(0LL, v3, v53, v26);
  sub_189463234();
  sub_1894738F0();
  uint64_t v27 = v49[1];
  v47[2] = v3;
  ((void (*)(char *))v27)(v8);
  BOOL v28 = *(void (**)(char *, uint64_t))(v55 + 8);
  v28(v21, v9);
  swift_getAssociatedConformanceWitness();
  uint64_t v29 = v51;
  sub_189473A10();
  sub_1894739F8();
  __int128 v50 = v23;
  uint64_t v30 = v29;
  uint64_t v31 = v21;
  sub_1894738E4();
  v28(v21, v9);
  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
  uint64_t v49 = v18;
  v32(v56, (char *)v18, v9);
  uint64_t v53 = AssociatedConformanceWitness;
  if ((sub_18947392C() & 1) == 0
    || (sub_189473A10(),
        sub_1894739F8(),
        swift_getAssociatedConformanceWitness(),
        char v33 = sub_189473758(),
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v28)(v31, v9),
        (v33 & 1) != 0))
  {
    if (sub_189473920() < 8) {
      goto LABEL_15;
    }
    v32(v48, v56, v9);
    unsigned __int8 v57 = -1;
    char v35 = sub_18947392C();
    uint64_t v36 = sub_189473920();
    if ((v35 & 1) != 0)
    {
      if (v36 <= 8)
      {
        sub_189473A10();
        sub_1894739F8();
        swift_getAssociatedConformanceWitness();
        int64_t v37 = v48;
        char v38 = sub_189473740();
        v28(v31, v9);
        unsigned int v39 = v57;
        uint64_t v30 = (char *)v47[0];
        (*(void (**)(void, char *, uint64_t))(v55 + 32))(v47[0], v37, v9);
        if ((v38 & 1) == 0)
        {
LABEL_14:
          v28(v30, v9);
          goto LABEL_15;
        }

        unsigned __int8 v40 = sub_189473914();
        v28(v30, v9);
        if (v39 < v40)
        {
LABEL_13:
          __break(1u);
          goto LABEL_14;
        }

uint64_t sub_189463BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = type metadata accessor for IntegerBytesCollection.Index(255LL, *(void *)(a3 + 16), *(void *)(a3 + 24), a4);
  MEMORY[0x1895E6DB8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v4);
  return sub_189473800();
}

uint64_t sub_189463C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = type metadata accessor for IntegerBytesCollection.Index(255LL, *(void *)(a3 + 16), *(void *)(a3 + 24), a4);
  MEMORY[0x1895E6DB8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v4);
  return sub_189473818();
}

uint64_t sub_189463CB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189463FE0(a1, a2, a3, MEMORY[0x189618808]);
}

void *sub_189463CC4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_189464070(a1, a2, a3, MEMORY[0x189618808]);
}

uint64_t sub_189463CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1894737F4();
}

void sub_189463D40(void *a1@<X8>)
{
}

void (*sub_189463D54(void *a1, uint64_t *a2, uint64_t a3))(void *a1)
{
  unsigned int v6 = malloc(0x30uLL);
  *a1 = v6;
  uint64_t v7 = sub_189463DE4((uint64_t)v6, a2, a3);
  v6[40] = v8;
  *((void *)v6 + 4) = v7;
  return sub_189463DB8;
}

void sub_189463DB8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

uint64_t (*sub_189463DE4(uint64_t a1, uint64_t *a2, uint64_t a3))()
{
  return nullsub_1;
}

uint64_t sub_189463E10(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for IntegerBytesCollection.Index(255LL, *(void *)(a1 + 16), *(void *)(a1 + 24), v2);
  MEMORY[0x1895E6DB8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v3);
  return sub_18947380C();
}

void sub_189463E80(uint64_t a1@<X8>)
{
  *(void *)a1 = 0LL;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t sub_189463E90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for IntegerBytesCollection.Index(255LL, *(void *)(a3 + 16), *(void *)(a3 + 24), v4);
  MEMORY[0x1895E6DB8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v5);
  return sub_189473800();
}

uint64_t sub_189463F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for IntegerBytesCollection.Index(255LL, *(void *)(a3 + 16), *(void *)(a3 + 24), v4);
  MEMORY[0x1895E6DB8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v5);
  return sub_189473818();
}

uint64_t sub_189463F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_18946568C( a1,  a2,  a3,  a4,  (uint64_t (*)(void, uint64_t, uint64_t))MEMORY[0x189618A18],  (uint64_t (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x189617B40]);
}

uint64_t sub_189463FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_18946568C( a1,  a2,  a3,  a4,  MEMORY[0x189617BE0],  (uint64_t (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x189617B50]);
}

uint64_t sub_189463FD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189463FE0(a1, a2, a3, MEMORY[0x189618800]);
}

uint64_t sub_189463FE0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = MEMORY[0x1895E6DB8](&protocol conformance descriptor for IntegerBytesCollection<A>);
  uint64_t v8 = type metadata accessor for IntegerBytesCollection.Index(255LL, *(void *)(a2 + 16), *(void *)(a2 + 24), v7);
  uint64_t v9 = MEMORY[0x1895E6DB8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v8);
  return a4(a1, a2, v6, v9);
}

void *sub_189464064(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_189464070(a1, a2, a3, MEMORY[0x189618800]);
}

void *sub_189464070( void *a1, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr, void *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = MEMORY[0x1895E6DB8](&protocol conformance descriptor for IntegerBytesCollection<A>);
  uint64_t v9 = type metadata accessor for IntegerBytesCollection.Index(255LL, *(void *)(a2 + 16), *(void *)(a2 + 24), v8);
  uint64_t v10 = MEMORY[0x1895E6DB8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v9);
  uint64_t result = a4(&v12, a1, a2, v7, v10);
  *a1 = v12;
  return result;
}

uint64_t sub_1894640F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(a1 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, v2, a1);
  IntegerBytesCollection.startIndex.getter(&v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, a1);
  MEMORY[0x1895E6DB8](&protocol conformance descriptor for IntegerBytesCollection<A>, a1);
  uint64_t result = sub_1894739BC();
  *(void *)(a2 + *(int *)(result + 36)) = v7;
  return result;
}

uint64_t sub_189464188(uint64_t a1)
{
  return sub_189473848();
}

uint64_t sub_1894641BC(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x1895E6DB8](&protocol conformance descriptor for IntegerBytesCollection<A>, a1);
  uint64_t v4 = sub_189466A58(v1, a1, v3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
  return v4;
}

uint64_t IntegerBytesCollection.Index.hash(into:)()
{
  return sub_189473A58();
}

uint64_t IntegerBytesCollection.Index.hashValue.getter()
{
  return sub_189473A7C();
}

uint64_t sub_189464294()
{
  return sub_189473A7C();
}

uint64_t sub_1894642CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1894738C0();
}

BOOL static IntegerBytesCollection.Index.< infix(_:_:)(void *a1, void *a2)
{
  return *a2 < *a1;
}

BOOL static IntegerBytesCollection.Index.> infix(_:_:)(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL static IntegerBytesCollection.Index.<= infix(_:_:)(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL static IntegerBytesCollection.Index.>= infix(_:_:)(void *a1, void *a2)
{
  return *a2 >= *a1;
}

uint64_t IntegerBytesCollection.Index.advanced(by:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(*v2, result)) {
    __break(1u);
  }
  else {
    *a2 = *v2 - result;
  }
  return result;
}

uint64_t IntegerBytesCollection.Index.distance(to:)(void *a1)
{
  BOOL v2 = __OFSUB__(*v1, *a1);
  uint64_t result = *v1 - *a1;
  if (v2) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1894643A8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = IntegerBytesCollection.Index.distance(to:)(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1894643CC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return IntegerBytesCollection.Index.advanced(by:)(*a1, a2);
}

uint64_t sub_1894643D4()
{
  return sub_1894738CC();
}

uint64_t sub_1894643F0()
{
  return 1LL;
}

uint64_t sub_1894643F8@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _BYTE *a5@<X8>)
{
  char v8 = v7;
  uint64_t result = swift_unknownObjectRelease();
  if (!v5) {
    *a5 = v8;
  }
  return result;
}

uint64_t sub_189464440(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_18946449C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  return sub_1894645B4(a1, a2, (uint64_t (*)(_OWORD *, void, void))sub_18945FACC, a3);
}

uint64_t sub_1894644B8(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  char v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_18945C5BC(&v6, 0, a1, (uint64_t (*)(char **))sub_1894669FC);
}

uint64_t sub_18946450C()
{
  return 0LL;
}

void sub_189464514( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _BYTE *a5@<X8>)
{
  if (!v5) {
    *a5 = v7;
  }
}

uint64_t sub_18946453C(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_189464598@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  return sub_1894645B4(a1, a2, (uint64_t (*)(_OWORD *, void, void))sub_18946042C, a3);
}

uint64_t sub_1894645B4@<X0>( _OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_OWORD *, void, void)@<X4>, _BYTE *a4@<X8>)
{
  __int128 v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  __int128 v7 = a1[5];
  v10[4] = a1[4];
  v10[5] = v7;
  __int128 v8 = a1[1];
  v10[0] = *a1;
  v10[1] = v8;
  uint64_t result = a3(v10, *(void *)a2, *(unsigned __int8 *)(a2 + 8));
  if (!v4) {
    *a4 = result;
  }
  return result;
}

uint64_t sub_18946460C(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  char v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_18945C5BC(&v6, 0, a1, sub_1894669A0);
}

uint64_t sub_189464660@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _WORD *a5@<X8>)
{
  __int16 v8 = v7;
  uint64_t result = swift_unknownObjectRelease();
  if (!v5) {
    *a5 = v8;
  }
  return result;
}

uint64_t sub_1894646A8(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_189464704@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X8>)
{
  return sub_189464814(a1, a2, (uint64_t (*)(_OWORD *, void, void))sub_18945FD24, a3);
}

uint64_t sub_189464720(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  __int16 v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_18945C5BC(&v6, 0, a1, (uint64_t (*)(char **))sub_189466944);
}

void sub_189464774( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _WORD *a5@<X8>)
{
  if (!v5) {
    *a5 = v7;
  }
}

uint64_t sub_18946479C(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_1894647F8@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X8>)
{
  return sub_189464814(a1, a2, (uint64_t (*)(_OWORD *, void, void))sub_1894606D0, a3);
}

uint64_t sub_189464814@<X0>( _OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_OWORD *, void, void)@<X4>, _WORD *a4@<X8>)
{
  __int128 v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  __int128 v7 = a1[5];
  v10[4] = a1[4];
  v10[5] = v7;
  __int128 v8 = a1[1];
  v10[0] = *a1;
  v10[1] = v8;
  uint64_t result = a3(v10, *(void *)a2, *(unsigned __int8 *)(a2 + 8));
  if (!v4) {
    *a4 = result;
  }
  return result;
}

uint64_t sub_18946486C(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  __int16 v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_18945C5BC(&v6, 0, a1, sub_1894668E8);
}

uint64_t sub_1894648C0@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _DWORD *a5@<X8>)
{
  int v8 = v7;
  uint64_t result = swift_unknownObjectRelease();
  if (!v5) {
    *a5 = v8;
  }
  return result;
}

uint64_t sub_189464908(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_189464964@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  return sub_189464A74(a1, a2, (uint64_t (*)(_OWORD *, void, void))sub_18945FF7C, a3);
}

uint64_t sub_189464980(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  int v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_18945C5BC(&v6, 0, a1, (uint64_t (*)(char **))sub_18946688C);
}

void sub_1894649D4( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _DWORD *a5@<X8>)
{
  if (!v5) {
    *a5 = v7;
  }
}

uint64_t sub_1894649FC(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_189464A58@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  return sub_189464A74(a1, a2, (uint64_t (*)(_OWORD *, void, void))sub_189460974, a3);
}

uint64_t sub_189464A74@<X0>( _OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_OWORD *, void, void)@<X4>, _DWORD *a4@<X8>)
{
  __int128 v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  __int128 v7 = a1[5];
  v10[4] = a1[4];
  v10[5] = v7;
  __int128 v8 = a1[1];
  v10[0] = *a1;
  v10[1] = v8;
  uint64_t result = a3(v10, *(void *)a2, *(unsigned __int8 *)(a2 + 8));
  if (!v4) {
    *a4 = result;
  }
  return result;
}

uint64_t sub_189464ACC(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  int v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_18945C5BC(&v6, 0, a1, sub_189466830);
}

uint64_t sub_189464B20@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X8>)
{
  return sub_189464D34(a1, a2, a3, a4, a5);
}

uint64_t sub_189464B34(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_189464B90@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_189464DE8(a1, a2, a3);
}

uint64_t sub_189464BA4(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  uint64_t v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_18945C5BC(&v6, 0, a1, (uint64_t (*)(char **))sub_18946674C);
}

uint64_t sub_189464BF4@<X0>(uint64_t *a1@<X8>)
{
  return sub_189464E5C((uint64_t (*)(void))sub_18945F414, a1);
}

uint64_t sub_189464C10(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_189464C6C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_189464C88( a1,  a2,  (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t))sub_18945F414,  a3);
}

uint64_t sub_189464C88@<X0>( _OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, unint64_t)@<X4>, uint64_t *a4@<X8>)
{
  __int128 v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  __int128 v7 = a1[5];
  v10[4] = a1[4];
  v10[5] = v7;
  __int128 v8 = a1[1];
  v10[0] = *a1;
  v10[1] = v8;
  uint64_t result = sub_189460C34((uint64_t)v10, *(void *)a2, *(_BYTE *)(a2 + 8), a3);
  if (!v4) {
    *a4 = result;
  }
  return result;
}

uint64_t sub_189464CE4(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  uint64_t v8 = *v2;
  uint64_t v6 = v3;
  char v7 = v4;
  return sub_18945C5BC(&v6, 0, a1, sub_1894666F0);
}

uint64_t sub_189464D34@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v8 = v7;
  uint64_t result = swift_unknownObjectRelease();
  if (!v5) {
    *a5 = v8;
  }
  return result;
}

uint64_t sub_189464D7C(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

void sub_189464DD8(uint64_t a1@<X8>)
{
  *(void *)a1 = 2LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_189464DE8@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  __int128 v5 = a1[3];
  uint64_t v9[2] = a1[2];
  v9[3] = v5;
  __int128 v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  __int128 v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  uint64_t result = sub_1894601D4((uint64_t)v9, *(void *)a2, *(_BYTE *)(a2 + 8));
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_189464E40@<X0>(uint64_t *a1@<X8>)
{
  return sub_189464E5C((uint64_t (*)(void))sub_18945EDB0, a1);
}

uint64_t sub_189464E5C@<X0>(uint64_t (*a1)(void)@<X6>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_189464E84(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_189464EE0@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_189464C88( a1,  a2,  (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t))sub_18945EDB0,  a3);
}

uint64_t sub_189464F00@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  __int128 v5 = a1[3];
  v12[2] = a1[2];
  __int128 v12[3] = v5;
  __int128 v6 = a1[5];
  v12[4] = a1[4];
  v12[5] = v6;
  __int128 v7 = a1[1];
  v12[0] = *a1;
  v12[1] = v7;
  uint64_t result = sub_18945F838((uint64_t)v12, *(void *)a2, *(_BYTE *)(a2 + 8));
  if (!v3)
  {
    *a3 = result;
    a3[1] = v9;
    a3[2] = v10;
    a3[3] = v11;
  }

  return result;
}

uint64_t sub_189464F5C(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  __int128 v5 = v2[1];
  __int128 v9 = *v2;
  __int128 v10 = v5;
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_18945C5BC(&v7, 0, a1, sub_1894666CC);
}

char *sub_189464FB0(char *result)
{
  uint64_t v3 = *((void *)result + 2);
  unint64_t v2 = *((void *)result + 3);
  int64_t v4 = v2 >> 1;
  __int128 v5 = (char *)MEMORY[0x18961AFE8];
  if (v3 != v2 >> 1)
  {
    uint64_t v36 = *(void *)result;
    uint64_t v38 = *((void *)result + 1);
    uint64_t result = (char *)sub_18945AE64((uint64_t)result);
    if (v3 >= v4)
    {
LABEL_50:
      __break(1u);
LABEL_51:
      uint64_t result = (char *)swift_unknownObjectRelease();
      goto LABEL_52;
    }

    uint64_t v1 = 0LL;
    uint64_t v34 = v2 & 1;
    uint64_t v35 = v38 + 112;
    uint64_t v6 = (uint64_t)(v5 + 32);
    while (1)
    {
      if (v4 <= v3)
      {
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
        return result;
      }

      uint64_t v7 = (uint64_t *)(v38 + 96 * v3);
      uint64_t v8 = *v7;
      char v9 = *((_BYTE *)v7 + 24);
      uint64_t v10 = v3 + 1;
      __int128 v43 = *((_OWORD *)v7 + 3);
      __int128 v44 = *((_OWORD *)v7 + 2);
      char v42 = *((_BYTE *)v7 + 8);
      if (v9)
      {
        uint64_t v11 = v7[2];
        uint64_t v12 = v4;
        if (v10 != v4)
        {
          uint64_t v13 = (void *)(v35 + 96 * v3);
          uint64_t v12 = v3 + 1;
          do
          {
            if (v12 >= v4)
            {
LABEL_57:
              __break(1u);
LABEL_58:
              __break(1u);
              goto LABEL_59;
            }

            if (v11 >= *v13) {
              goto LABEL_14;
            }
            uint64_t v14 = v12 + 1;
            if (__OFADD__(v12, 1LL)) {
              goto LABEL_58;
            }
            ++v12;
            v13 += 12;
          }

          while (v14 != v4);
          uint64_t v12 = v4;
LABEL_14:
          if (v12 <= v3) {
            goto LABEL_61;
          }
          if (v12 < 0) {
            goto LABEL_62;
          }
        }

        uint64_t v15 = v12 - v10;
        if (__OFSUB__(v12, v10)) {
          goto LABEL_63;
        }
        if (v15 < 0) {
          goto LABEL_64;
        }
        uint64_t v16 = v4 - v10;
        if (__OFSUB__(v4, v10)) {
          goto LABEL_65;
        }
        int64_t v37 = v5;
        if (!v15 || v16 < 0 || (uint64_t v17 = v4, v16 >= v15))
        {
          uint64_t v17 = v12;
          if (__OFADD__(v10, v15)) {
            goto LABEL_69;
          }
          if (v4 < v12) {
            goto LABEL_66;
          }
        }

        if (v17 <= v3) {
          goto LABEL_67;
        }
        if (v10 != v12)
        {
          if (v10 >= v12) {
            goto LABEL_70;
          }
          uint64_t v18 = (uint64_t *)(v35 + 96 * v3);
          do
          {
            uint64_t v19 = *v18;
            v18 += 12;
            if (v11 >= v19)
            {
              __break(1u);
              goto LABEL_57;
            }

            --v15;
          }

          while (v15);
          if (*(void *)(v38 + 96 * v10 + 16) != v11 + 1) {
            goto LABEL_71;
          }
        }

        uint64_t v41 = v34 | (2 * v12);
        uint64_t v20 = v36;
        uint64_t result = (char *)swift_unknownObjectRetain();
        uint64_t v39 = v3 + 1;
        uint64_t v40 = v38;
        uint64_t v3 = v17;
        __int128 v5 = v37;
        if (v1)
        {
LABEL_43:
          uint64_t result = (char *)swift_unknownObjectRetain();
          BOOL v30 = __OFSUB__(v1--, 1LL);
          if (v30) {
            goto LABEL_60;
          }
          goto LABEL_48;
        }
      }

      else
      {
        uint64_t v20 = v7[8];
        if (!v20) {
          goto LABEL_73;
        }
        uint64_t v39 = v7[10];
        uint64_t v40 = v7[9];
        uint64_t v41 = v7[11];
        uint64_t result = (char *)swift_unknownObjectRetain();
        uint64_t v11 = 0LL;
        ++v3;
        if (v1) {
          goto LABEL_43;
        }
      }

      unint64_t v21 = *((void *)v5 + 3);
      int64_t v22 = v21 & 0xFFFFFFFFFFFFFFFELL;
      if (v22 <= 1) {
        uint64_t v23 = 1LL;
      }
      else {
        uint64_t v23 = v22;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C797AA0);
      uint64_t v24 = (char *)swift_allocObject();
      uint64_t v25 = (uint64_t)(_swift_stdlib_malloc_size(v24) - 32) / 96;
      *((void *)v24 + 2) = v23;
      *((void *)v24 + 3) = 2 * v25;
      uint64_t v26 = v24 + 32;
      uint64_t v27 = *((void *)v5 + 3) >> 1;
      uint64_t v6 = (uint64_t)&v24[96 * v27 + 32];
      uint64_t v28 = (v25 & 0x7FFFFFFFFFFFFFFFLL) - v27;
      if (*((void *)v5 + 2))
      {
        uint64_t v29 = v5 + 32;
        if (v24 != v5 || v26 >= &v29[96 * v27]) {
          memmove(v26, v29, 96 * v27);
        }
        swift_unknownObjectRetain();
        *((void *)v5 + 2) = 0LL;
      }

      else
      {
        swift_unknownObjectRetain();
      }

      uint64_t result = (char *)swift_release();
      __int128 v5 = v24;
      BOOL v30 = __OFSUB__(v28, 1LL);
      uint64_t v1 = v28 - 1;
      if (v30) {
        goto LABEL_60;
      }
LABEL_48:
      *(void *)uint64_t v6 = v8;
      *(_BYTE *)(v6 + 8) = v42;
      *(void *)(v6 + 16) = v20;
      *(void *)(v6 + 24) = v40;
      *(void *)(v6 + 32) = v39;
      *(void *)(v6 + 40) = v41;
      *(void *)(v6 + 48) = v11;
      *(_BYTE *)(v6 + 56) = v9 ^ 1;
      *(_OWORD *)(v6 + 64) = v44;
      *(_OWORD *)(v6 + 80) = v43;
      if (v3 == v4) {
        goto LABEL_51;
      }
      v6 += 96LL;
      if (v3 >= v4) {
        goto LABEL_50;
      }
    }
  }

  uint64_t v1 = 0LL;
LABEL_52:
  unint64_t v31 = *((void *)v5 + 3);
  if (v31 >= 2)
  {
    unint64_t v32 = v31 >> 1;
    BOOL v30 = __OFSUB__(v32, v1);
    uint64_t v33 = v32 - v1;
    if (v30) {
      goto LABEL_72;
    }
    *((void *)v5 + 2) = v33;
  }

  return v5;
}

uint64_t sub_189465370(uint64_t result, int64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  uint64_t v6 = 0LL;
  uint64_t v7 = 32LL;
  int64_t v8 = result;
  while (1)
  {
    BOOL v9 = v8 <= a2;
    if (a3 > 0) {
      BOOL v9 = v8 >= a2;
    }
    if (v9) {
      break;
    }
    BOOL v10 = __OFADD__(v8, a3);
    v8 += a3;
    if (v10) {
      int64_t v8 = (v8 >> 63) ^ 0x8000000000000000LL;
    }
    v7 += 8LL;
    BOOL v10 = __OFADD__(v6++, 1LL);
    if (v10)
    {
      __break(1u);
      break;
    }
  }

  if (v6 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C5058B8);
    uint64_t v11 = (int64_t *)swift_allocObject();
    uint64_t result = _swift_stdlib_malloc_size(v11);
    uint64_t v12 = result - 32;
    if (result < 32) {
      uint64_t v12 = result - 25;
    }
    uint64_t v13 = v12 >> 3;
    v11[2] = v6;
    unint64_t v11[3] = 2 * v13;
    uint64_t v14 = v11 + 4;
    uint64_t v15 = v13 & 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:
    v15 -= v6;
    while (1)
    {
      BOOL v16 = v5 <= a2;
      if (a3 > 0) {
        BOOL v16 = v5 >= a2;
      }
      if (v16) {
        break;
      }
      if (__OFADD__(v5, a3)) {
        int64_t v17 = ((v5 + a3) >> 63) ^ 0x8000000000000000LL;
      }
      else {
        int64_t v17 = v5 + a3;
      }
      *v14++ = v5;
      uint64_t v5 = v17;
      if (!--v6) {
        goto LABEL_23;
      }
    }

    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }

  uint64_t v11 = (int64_t *)MEMORY[0x18961AFE8];
  uint64_t v14 = (int64_t *)(MEMORY[0x18961AFE8] + 32LL);
  uint64_t v15 = *(void *)(MEMORY[0x18961AFE8] + 24LL) >> 1;
  if (v6) {
    goto LABEL_15;
  }
  int64_t v17 = result;
LABEL_23:
  BOOL v18 = v17 <= a2;
  if (a3 > 0) {
    BOOL v18 = v17 >= a2;
  }
  if (!v18)
  {
    uint64_t v19 = (a3 >> 63) ^ 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      int64_t v20 = v17 + a3;
      if (__OFADD__(v17, a3))
      {
        int64_t v20 = v19;
        if (!v15) {
          goto LABEL_32;
        }
        int64_t v20 = v19;
      }

      else if (!v15)
      {
LABEL_32:
        unint64_t v21 = v11[3];
        int64_t v22 = v21 & 0xFFFFFFFFFFFFFFFELL;
        if (v22 <= 1) {
          uint64_t v23 = 1LL;
        }
        else {
          uint64_t v23 = v22;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C5058B8);
        uint64_t v24 = (int64_t *)swift_allocObject();
        int64_t v25 = _swift_stdlib_malloc_size(v24);
        uint64_t v26 = v25 - 32;
        if (v25 < 32) {
          uint64_t v26 = v25 - 25;
        }
        uint64_t v27 = v26 >> 3;
        v24[2] = v23;
        v24[3] = 2 * (v26 >> 3);
        unint64_t v28 = (unint64_t)(v24 + 4);
        unint64_t v29 = (unint64_t)v11[3] >> 1;
        if (v11[2])
        {
          v11[2] = 0LL;
        }

        uint64_t v14 = (int64_t *)(v28 + 8 * v29);
        uint64_t v15 = (v27 & 0x7FFFFFFFFFFFFFFFLL) - v29;
        uint64_t result = swift_release();
        uint64_t v11 = v24;
        uint64_t v19 = (a3 >> 63) ^ 0x7FFFFFFFFFFFFFFFLL;
      }

      BOOL v10 = __OFSUB__(v15--, 1LL);
      if (v10) {
        goto LABEL_57;
      }
      *v14++ = v17;
      BOOL v31 = v20 <= a2;
      if (a3 > 0) {
        BOOL v31 = v20 >= a2;
      }
      int64_t v17 = v20;
    }

    while (!v31);
  }

  unint64_t v32 = v11[3];
  if (v32 < 2) {
    return (uint64_t)v11;
  }
  unint64_t v33 = v32 >> 1;
  BOOL v10 = __OFSUB__(v33, v15);
  unint64_t v34 = v33 - v15;
  if (!v10)
  {
    v11[2] = v34;
    return (uint64_t)v11;
  }

char *sub_1894655F0(uint64_t a1)
{
  return sub_18945AE8C(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_189465604(uint64_t a1)
{
  return sub_18945AF98(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_189465618(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  _OWORD v4[2] = *(void *)(v1 + 16);
  v4[3] = v2;
  v4[4] = a1;
  return (*(uint64_t (**)(uint64_t (*)(uint64_t), void *, uint64_t))(v2 + 48))( sub_189466A5C,  v4,  MEMORY[0x18961AFC8] + 8LL);
}

uint64_t sub_189465668(char **a1, uint64_t a2)
{
  return sub_1894612F4(*(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24), a1);
}

uint64_t sub_18946568C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t), uint64_t (*a6)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v23 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v11 = a5(0LL, AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](v13);
  BOOL v18 = (char *)&v22 - v17;
  char v19 = sub_189473764();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a2, v11);
  if ((v19 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
    goto LABEL_5;
  }

  char v20 = v23(v18, &v15[*(int *)(v11 + 36)], AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
  if ((v20 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

void sub_189465838(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = swift_unknownObjectRetain();
  sub_18945EF44(v8, a2, a3, a4);
}

void sub_18946588C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = swift_unknownObjectRetain();
  sub_18945F0EC(v8, a2, a3, a4);
}

void sub_1894659B4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = swift_unknownObjectRetain();
  sub_18945F280(v8, a2, a3, a4);
}

void sub_189465AE4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = swift_unknownObjectRetain();
  sub_18945F414(v8, a2, a3, a4);
}

uint64_t sub_189465C68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18947389C();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](v4);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v6);
  BOOL v10 = (char *)&v17 - v9;
  char v11 = sub_189473764();
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

  char v13 = sub_189473764();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v14)(v10, v4);
  if ((v13 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E6DAC](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t type metadata accessor for IntegerBytesCollection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for IntegerBytesCollection);
}

uint64_t type metadata accessor for IntegerBytesCollection.Index( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for IntegerBytesCollection.Index);
}

void sub_189465E4C()
{
}

void sub_189465E5C()
{
}

uint64_t sub_189465E6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189465F94(a1, a2, a3, MEMORY[0x189618A58]);
}

unint64_t sub_189465E78()
{
  unint64_t result = qword_18C797678;
  if (!qword_18C797678)
  {
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x189618768], MEMORY[0x189618740]);
    atomic_store(result, (unint64_t *)&qword_18C797678);
  }

  return result;
}

uint64_t sub_189465EBC(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x1895E6DB8](&protocol conformance descriptor for IntegerBytesCollection<A>);
  return MEMORY[0x1895E6DB8](MEMORY[0x18961A5E0], a1, &v3);
}

void sub_189465F04()
{
}

uint64_t sub_189465F14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189465F94(a1, a2, a3, MEMORY[0x189618A40]);
}

uint64_t sub_189465F20(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x1895E6DB8](&protocol conformance descriptor for IntegerBytesCollection<A>);
  return MEMORY[0x1895E6DB8](MEMORY[0x18961A5C8], a1, &v3);
}

void sub_189465F68()
{
}

void sub_189465F78()
{
}

uint64_t sub_189465F88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189465F94(a1, a2, a3, MEMORY[0x189618A60]);
}

uint64_t sub_189465F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7[0] = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for IntegerBytesCollection<A>.Index,  *(void *)(a1 + 16));
  v7[1] = sub_189465E78();
  return MEMORY[0x1895E6DB8](a4, a1, v7);
}

void sub_189465FF0()
{
}

void sub_189466000()
{
}

void sub_189466010()
{
}

uint64_t sub_189466020()
{
  return MEMORY[0x189618758];
}

uint64_t sub_18946602C()
{
  return MEMORY[0x189618790];
}

uint64_t sub_189466038()
{
  return sub_1894661F0( &qword_18C797680,  &qword_18C797688,  (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_189466064()
{
  return sub_1894661F0( &qword_18C7976C8,  &qword_18C7976D0,  (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_189466090()
{
  return sub_1894661F0( &qword_18C797710,  &qword_18C797718,  (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_1894660BC()
{
  return sub_1894661F0( &qword_18C797758,  &qword_18C797760,  (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_1894660E8()
{
  return sub_1894661F0( &qword_18C7977A0,  &qword_18C7977A8,  (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_189466114()
{
  return sub_1894661F0( &qword_18C7977E8,  &qword_18C7977F0,  (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_189466140()
{
  return sub_1894661F0( &qword_18C797830,  &qword_18C797838,  (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_18946616C()
{
  return sub_1894661F0( &qword_18C797878,  &qword_18C797880,  (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_189466198()
{
  return sub_1894661F0( &qword_18C7978C0,  &qword_18C7978C8,  (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_1894661C4()
{
  return sub_1894661F0( &qword_18C797908,  &qword_18C797910,  (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_1894661F0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = MEMORY[0x1895E6DB8](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t dispatch thunk of static ASN1IntegerRepresentable.isSigned.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ASN1IntegerRepresentable.init(derIntegerBytes:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t dispatch thunk of ASN1IntegerRepresentable.withBigEndianIntegerBytes<A>(_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t sub_189466268()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_189466270()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *sub_1894662DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(void *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }

  else
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }

  return v3;
}

uint64_t sub_18946634C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8LL) + 8LL))();
}

uint64_t sub_18946635C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_18946638C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1894663BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1894663EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_18946641C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  char v8 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)(a1 + v7);
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7)) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 < 2)
    {
LABEL_18:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0LL;
    }
  }

  int v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7)) {
    goto LABEL_18;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (!(_DWORD)v7) {
    return v5 + v11 + 1;
  }
  return ((uint64_t (*)(void))((char *)&loc_1894664CC + 4 * byte_1894740A0[(v7 - 1)]))();
}

void sub_18946651C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        unsigned int v11 = 4u;
      }

      else if (v13 >= 0x100)
      {
        unsigned int v11 = 2;
      }

      else
      {
        unsigned int v11 = v13 > 1;
      }
    }

    else
    {
      unsigned int v11 = 1u;
    }
  }

  else
  {
    unsigned int v11 = 0u;
  }

  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        int v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }

        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }

        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }

    else
    {
      bzero(a1, *(void *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X11 }

uint64_t sub_1894666CC(char **a1)
{
  return sub_1894612F4( **(void **)(v1 + 16),  *(void *)(*(void *)(v1 + 16) + 8LL),  *(void *)(*(void *)(v1 + 16) + 16LL),  *(void *)(*(void *)(v1 + 16) + 24LL),  a1);
}

uint64_t sub_1894666F0(char **a1)
{
  return sub_18945B2C4(a1, *(unint64_t **)(v1 + 16));
}

unint64_t sub_189466708()
{
  unint64_t result = qword_18C797A50;
  if (!qword_18C797A50)
  {
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x189618D00], MEMORY[0x189618CD8]);
    atomic_store(result, (unint64_t *)&qword_18C797A50);
  }

  return result;
}

uint64_t sub_18946674C(uint64_t *a1)
{
  return sub_18945B2A4(a1, *(int64_t **)(v1 + 16));
}

unint64_t sub_189466764()
{
  unint64_t result = qword_18C797A58;
  if (!qword_18C797A58)
  {
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x189618798], MEMORY[0x189618740]);
    atomic_store(result, (unint64_t *)&qword_18C797A58);
  }

  return result;
}

unint64_t sub_1894667A8()
{
  unint64_t result = qword_18C797A60;
  if (!qword_18C797A60)
  {
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x18961A8F8], MEMORY[0x18961A8C8]);
    atomic_store(result, (unint64_t *)&qword_18C797A60);
  }

  return result;
}

unint64_t sub_1894667EC()
{
  unint64_t result = qword_18C797A68;
  if (!qword_18C797A68)
  {
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x18961A4F8], MEMORY[0x18961A4C0]);
    atomic_store(result, (unint64_t *)&qword_18C797A68);
  }

  return result;
}

uint64_t sub_189466830(char **a1)
{
  return sub_18945B384(a1, *(unsigned int **)(v1 + 16));
}

unint64_t sub_189466848()
{
  unint64_t result = qword_18C797A70;
  if (!qword_18C797A70)
  {
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x18961A890], MEMORY[0x18961A860]);
    atomic_store(result, (unint64_t *)&qword_18C797A70);
  }

  return result;
}

uint64_t sub_18946688C(uint64_t *a1)
{
  return sub_18945B324(a1, *(unsigned int **)(v1 + 16));
}

unint64_t sub_1894668A4()
{
  unint64_t result = qword_18C797A78;
  if (!qword_18C797A78)
  {
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x18961A488], MEMORY[0x18961A458]);
    atomic_store(result, (unint64_t *)&qword_18C797A78);
  }

  return result;
}

uint64_t sub_1894668E8(char **a1)
{
  return sub_18945B364(a1, *(unsigned __int16 **)(v1 + 16));
}

unint64_t sub_189466900()
{
  unint64_t result = qword_18C797A80;
  if (!qword_18C797A80)
  {
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x18961A828], MEMORY[0x18961A800]);
    atomic_store(result, (unint64_t *)&qword_18C797A80);
  }

  return result;
}

uint64_t sub_189466944(uint64_t *a1)
{
  return sub_18945B304(a1, *(unsigned __int16 **)(v1 + 16));
}

unint64_t sub_18946695C()
{
  unint64_t result = qword_18C797A88;
  if (!qword_18C797A88)
  {
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x18961A430], MEMORY[0x18961A408]);
    atomic_store(result, (unint64_t *)&qword_18C797A88);
  }

  return result;
}

uint64_t sub_1894669A0(char **a1)
{
  return sub_18945B344(a1, *(unsigned __int8 **)(v1 + 16));
}

unint64_t sub_1894669B8()
{
  unint64_t result = qword_18C797A90;
  if (!qword_18C797A90)
  {
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x18961A648], MEMORY[0x18961A610]);
    atomic_store(result, (unint64_t *)&qword_18C797A90);
  }

  return result;
}

uint64_t sub_1894669FC(uint64_t *a1)
{
  return sub_18945B2E4(a1, *(unsigned __int8 **)(v1 + 16));
}

unint64_t sub_189466A14()
{
  unint64_t result = qword_18C797A98;
  if (!qword_18C797A98)
  {
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x18961A378], MEMORY[0x18961A350]);
    atomic_store(result, (unint64_t *)&qword_18C797A98);
  }

  return result;
}

uint64_t sub_189466A5C(uint64_t a1)
{
  return sub_189461E48(a1, *(char ***)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1895E6D94](a1, v6, a5);
}

uint64_t sub_189466AB0(uint64_t result)
{
  int64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v6 = result;
  unint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

  if (v4 <= v5) {
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  unint64_t result = (uint64_t)sub_18945AF98((char *)result, v11, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }

LABEL_5:
  uint64_t v7 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  unint64_t result = (uint64_t)memcpy((void *)(v3 + v7 + 32), (const void *)(v6 + 32), v2);
  if (!v2)
  {
LABEL_14:
    unint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }

  uint64_t v8 = *(void *)(v3 + 16);
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    *(void *)(v3 + 16) = v10;
    goto LABEL_14;
  }

  unsigned int v12 = v11 + 1;
  if (v11 + 1 < v1)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  if (v11 >= -1)
  {
    if (v10 != -128 && v1 != v12)
    {
      unsigned int v13 = v0[3] & 1LL | (2 * v12);
      v0[2] = v12;
      int v14 = swift_unknownObjectRetain();
      sub_18946A844(v14, v9, v1, v13);
      return;
    }

    sub_18945AD44();
    swift_allocError();
    uint64_t v6 = 0xD00000000000002DLL;
    int64_t v5 = v16;
    uint64_t v7 = 0x8000000189476040LL;
    uint64_t v8 = 283LL;
    goto LABEL_17;
  }

uint64_t sub_189466B90(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return sub_189466BB8( a1,  a2,  a3,  (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, unint64_t))sub_189468DB8,  (uint64_t (*)(uint64_t))sub_189469374);
}

uint64_t sub_189466BA4(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return sub_189466BB8( a1,  a2,  a3,  (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, unint64_t))sub_189469214,  (uint64_t (*)(uint64_t))sub_189469450);
}

uint64_t sub_189466BB8( uint64_t result, unint64_t a2, unint64_t a3, uint64_t (*a4)(uint64_t *, char *, int64_t, uint64_t, unint64_t, unint64_t), uint64_t (*a5)(uint64_t))
{
  unint64_t v8 = (71 - __clz(a3)) >> 3;
  if (v8 < result)
  {
    __break(1u);
    goto LABEL_17;
  }

  if (v8 < a2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v10 = result;
  uint64_t v11 = result - a2;
  uint64_t v7 = *v6;
  int64_t v12 = *((void *)*v6 + 2);
  int64_t v13 = v12 + result - a2;
  if (__OFADD__(v12, result - a2))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  int64_t v5 = a5;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (int64_t v17 = *((void *)v7 + 3) >> 1, v17 < v13))
  {
    if (v12 <= v13) {
      int64_t v18 = v13;
    }
    else {
      int64_t v18 = v12;
    }
    uint64_t v7 = sub_18945AF98(isUniquelyReferenced_nonNull_native, v18, 1, v7);
    int64_t v17 = *((void *)v7 + 3) >> 1;
  }

  uint64_t v19 = *((void *)v7 + 2);
  int64_t v20 = v17 - v19;
  unint64_t result = a4(&v35, &v7[v19 + 32], v17 - v19, v10, a2, a3);
  if (result < v11) {
    goto LABEL_19;
  }
  if (result >= 1)
  {
    uint64_t v21 = *((void *)v7 + 2);
    BOOL v22 = __OFADD__(v21, result);
    uint64_t v23 = v21 + result;
    if (v22)
    {
      __break(1u);
LABEL_38:
      *((void *)v7 + 2) = v20 + 1;
      goto LABEL_15;
    }

    *((void *)v7 + 2) = v23;
  }

  if (result != v20)
  {
LABEL_15:
    *uint64_t v6 = v7;
    return result;
  }

LABEL_20:
  uint64_t v24 = v38;
  uint64_t v25 = v36;
  if (!__OFSUB__(v38, v36))
  {
    if (v38 == v36) {
      goto LABEL_15;
    }
    int64_t v20 = *((void *)v7 + 2);
    unint64_t v26 = v37;
    uint64_t v34 = v35;
    unint64_t result = v5(v38);
    int64_t v27 = v24 - 1;
    if (v24 >= 1)
    {
      int64_t v33 = (71 - __clz(v26)) >> 3;
      if (v33 >= v24) {
        goto LABEL_26;
      }
    }

    __break(1u);
    do
    {
LABEL_25:
      while (1)
      {
        *((void *)v7 + 2) = v20;
LABEL_26:
        unint64_t v28 = *((void *)v7 + 3);
        int64_t v29 = v28 >> 1;
        if (v20 < v29) {
          goto LABEL_28;
        }
      }

      uint64_t v32 = result;
      uint64_t v7 = sub_18945AF98((char *)(v28 > 1), v20 + 1, 1, v7);
      unint64_t result = v32;
      int64_t v29 = *((void *)v7 + 3) >> 1;
    }

    while (v20 >= v29);
LABEL_28:
    uint64_t v30 = v27;
    while (1)
    {
      v7[v20 + 32] = result;
      if (__OFSUB__(v30, v25)) {
        break;
      }
      if (v25 == v30) {
        goto LABEL_38;
      }
      unint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t))v5)(v30, v34, v25, v26);
      if (v27 > v33) {
        goto LABEL_40;
      }
      if (v30-- < 1) {
        goto LABEL_40;
      }
      if (v29 == ++v20)
      {
        int64_t v20 = v29;
        int64_t v27 = v30;
        goto LABEL_25;
      }
    }

    __break(1u);
LABEL_40:
    __break(1u);
  }

  __break(1u);
  return result;
}

  uint64_t v24 = v38;
  uint64_t v25 = v36;
  if (!__OFSUB__(v38, v36))
  {
    if (v38 == v36) {
      goto LABEL_15;
    }
    int64_t v20 = *((void *)v7 + 2);
    unint64_t v26 = v37;
    uint64_t v34 = v35;
    unint64_t result = v5(v38);
    int64_t v27 = v24 - 1;
    if (v24 >= 1)
    {
      int64_t v33 = ((unint64_t)(32 - __clz(v26)) + 7) >> 3;
      if (v33 >= v24) {
        goto LABEL_26;
      }
    }

    __break(1u);
    do
    {
LABEL_25:
      while (1)
      {
        *((void *)v7 + 2) = v20;
LABEL_26:
        unint64_t v28 = *((void *)v7 + 3);
        int64_t v29 = v28 >> 1;
        if (v20 < v29) {
          goto LABEL_28;
        }
      }

      uint64_t v32 = result;
      uint64_t v7 = sub_18945AF98((char *)(v28 > 1), v20 + 1, 1, v7);
      unint64_t result = v32;
      int64_t v29 = *((void *)v7 + 3) >> 1;
    }

    while (v20 >= v29);
LABEL_28:
    uint64_t v30 = v27;
    while (1)
    {
      v7[v20 + 32] = result;
      if (__OFSUB__(v30, v25)) {
        break;
      }
      if (v25 == v30) {
        goto LABEL_38;
      }
      unint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v5)(v30, v34, v25, v26);
      if (v27 > v33) {
        goto LABEL_40;
      }
      if (v30-- < 1) {
        goto LABEL_40;
      }
      if (v29 == ++v20)
      {
        int64_t v20 = v29;
        int64_t v27 = v30;
        goto LABEL_25;
      }
    }

    __break(1u);
LABEL_40:
    __break(1u);
  }

  __break(1u);
  return result;
}

  uint64_t v24 = v38;
  uint64_t v25 = v36;
  if (__OFSUB__(v38, v36))
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }

  if (v38 == v36) {
    goto LABEL_15;
  }
  if (v36 < v38)
  {
    uint64_t v34 = v35;
    if (v35 >= v38)
    {
      int64_t v20 = *((void *)v7 + 2);
      unint64_t v26 = v37;
      unint64_t result = v5(v38, v37);
      int64_t v27 = v24 - 1;
      if (v24 >= 1)
      {
        int64_t v33 = ((unint64_t)(unsigned __int16)(32 - __clz(v26)) + 7) >> 3;
        if (v33 >= v24) {
          goto LABEL_28;
        }
      }

      __break(1u);
      do
      {
LABEL_27:
        while (1)
        {
          *((void *)v7 + 2) = v20;
LABEL_28:
          unint64_t v28 = *((void *)v7 + 3);
          int64_t v29 = v28 >> 1;
          if (v20 < v29) {
            goto LABEL_30;
          }
        }

        uint64_t v32 = result;
        uint64_t v7 = sub_18945AF98((char *)(v28 > 1), v20 + 1, 1, v7);
        unint64_t result = v32;
        int64_t v29 = *((void *)v7 + 3) >> 1;
      }

      while (v20 >= v29);
LABEL_30:
      uint64_t v30 = v27;
      while (1)
      {
        v7[v20 + 32] = result;
        if (__OFSUB__(v30, v25)) {
          break;
        }
        if (v25 == v30) {
          goto LABEL_42;
        }
        if (v27 > v34 || v25 >= v30) {
          goto LABEL_44;
        }
        unint64_t result = v5(v30, v26);
        if (v27 > v33) {
          goto LABEL_45;
        }
        if (v30-- < 1) {
          goto LABEL_45;
        }
        if (v29 == ++v20)
        {
          int64_t v20 = v29;
          int64_t v27 = v30;
          goto LABEL_27;
        }
      }

      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
  }

  uint64_t v24 = v38;
  uint64_t v25 = v36;
  if (__OFSUB__(v38, v36))
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }

  if (v38 == v36) {
    goto LABEL_15;
  }
  if (v36 < v38)
  {
    uint64_t v34 = v35;
    if (v35 >= v38)
    {
      int64_t v20 = *((void *)v7 + 2);
      unint64_t v26 = v37;
      unint64_t result = v5(v38, v37);
      int64_t v27 = v24 - 1;
      if (v24 >= 1)
      {
        int64_t v33 = ((unint64_t)(32 - __clz(v26)) + 7) >> 3;
        if (v33 >= v24) {
          goto LABEL_28;
        }
      }

      __break(1u);
      do
      {
LABEL_27:
        while (1)
        {
          *((void *)v7 + 2) = v20;
LABEL_28:
          unint64_t v28 = *((void *)v7 + 3);
          int64_t v29 = v28 >> 1;
          if (v20 < v29) {
            goto LABEL_30;
          }
        }

        uint64_t v32 = result;
        uint64_t v7 = sub_18945AF98((char *)(v28 > 1), v20 + 1, 1, v7);
        unint64_t result = v32;
        int64_t v29 = *((void *)v7 + 3) >> 1;
      }

      while (v20 >= v29);
LABEL_30:
      uint64_t v30 = v27;
      while (1)
      {
        v7[v20 + 32] = result;
        if (__OFSUB__(v30, v25)) {
          break;
        }
        if (v25 == v30) {
          goto LABEL_42;
        }
        if (v27 > v34 || v25 >= v30) {
          goto LABEL_44;
        }
        unint64_t result = v5(v30, v26);
        if (v27 > v33) {
          goto LABEL_45;
        }
        if (v30-- < 1) {
          goto LABEL_45;
        }
        if (v29 == ++v20)
        {
          int64_t v20 = v29;
          int64_t v27 = v30;
          goto LABEL_27;
        }
      }

      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
  }

    uint64_t v15 = __OFSUB__(v12--, 1LL);
    if (v13 - 1 < 0 != v15) {
      goto LABEL_25;
    }
    *(_BYTE *)(a2 + v6) = v14;
    v9 -= 8LL;
    v10 -= 0x8000000000000LL;
    v11 -= 0x8000000000000LL;
    if (a3 == ++v6)
    {
      uint64_t v16 = v13 - 1;
      goto LABEL_29;
    }
  }

  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

  __break(1u);
}

  __break(1u);
}

  if (v26 == v27)
  {
LABEL_28:
    sub_18945AD44();
    swift_allocError();
    uint64_t v39 = 0xD000000000000024LL;
    uint64_t v38 = v36;
    uint64_t v40 = 0x8000000189476370LL;
    uint64_t v41 = 44LL;
    goto LABEL_29;
  }

  if (v26 >= v27)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }

  if (*(_BYTE *)(a1 + v26) != 90) {
    goto LABEL_28;
  }
  if (__OFSUB__(v27, v26 + 1))
  {
LABEL_31:
    __break(1u);
    return;
  }

  if (v27 != v26 + 1)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v38 = v37;
    uint64_t v39 = 0xD000000000000021LL;
    uint64_t v40 = 0x80000001894763A0LL;
    uint64_t v41 = 49LL;
LABEL_29:
    static ASN1Error.invalidASN1Object(reason:file:line:)( v39,  v40,  (uint64_t)"SwiftASN1/TimeUtilities.swift",  29LL,  2,  v41,  v38);
    swift_willThrow();
    goto LABEL_12;
  }

  sub_189470AA8();
  swift_unknownObjectRelease();
  if (!v5)
  {
    *a4 = v12 + 100 * v9;
    a4[1] = v15;
    a4[2] = v18;
    a4[3] = v21;
    a4[4] = v44;
    a4[5] = v43;
    a4[6] = v28;
  }

int64_t sub_189466E0C(int64_t a1)
{
  return sub_189467B3C(a1, sub_1894632FC);
}

uint64_t sub_189466E18(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_189466E68( a1,  a2,  a3,  (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_189468974,  (uint64_t (*)(uint64_t))sub_18946930C);
}

uint64_t sub_189466E2C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_189467258( a1,  a2,  a3,  (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_189468A98,  (uint64_t (*)(uint64_t, uint64_t))sub_189463300);
}

uint64_t sub_189466E40(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_1894676E0( a1,  a2,  a3,  (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_189468C28,  (uint64_t (*)(uint64_t, uint64_t))sub_1894633A0);
}

uint64_t sub_189466E54(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_189466E68( a1,  a2,  a3,  (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_189468F00,  (uint64_t (*)(uint64_t))sub_1894693FC);
}

uint64_t sub_189466E68( uint64_t result, unint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t), uint64_t (*a5)(uint64_t))
{
  unint64_t v8 = ((unint64_t)(32 - __clz(a3)) + 7) >> 3;
  if (v8 < result)
  {
    __break(1u);
    goto LABEL_17;
  }

  if (v8 < a2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v10 = result;
  uint64_t v11 = result - a2;
  uint64_t v7 = *v6;
  int64_t v12 = *((void *)*v6 + 2);
  int64_t v13 = v12 + result - a2;
  if (__OFADD__(v12, result - a2))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  int64_t v5 = a5;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (int64_t v17 = *((void *)v7 + 3) >> 1, v17 < v13))
  {
    if (v12 <= v13) {
      int64_t v18 = v13;
    }
    else {
      int64_t v18 = v12;
    }
    uint64_t v7 = sub_18945AF98(isUniquelyReferenced_nonNull_native, v18, 1, v7);
    int64_t v17 = *((void *)v7 + 3) >> 1;
  }

  uint64_t v19 = *((void *)v7 + 2);
  int64_t v20 = v17 - v19;
  unint64_t result = a4(&v35, &v7[v19 + 32], v17 - v19, v10, a2, a3);
  if (result < v11) {
    goto LABEL_19;
  }
  if (result >= 1)
  {
    uint64_t v21 = *((void *)v7 + 2);
    BOOL v22 = __OFADD__(v21, result);
    uint64_t v23 = v21 + result;
    if (v22)
    {
      __break(1u);
LABEL_38:
      *((void *)v7 + 2) = v20 + 1;
      goto LABEL_15;
    }

    *((void *)v7 + 2) = v23;
  }

  if (result != v20)
  {
LABEL_15:
    *uint64_t v6 = v7;
    return result;
  }

uint64_t sub_1894670D0(unsigned int a1)
{
  unint64_t v3 = ((unint64_t)(32 - __clz(a1)) + 7) >> 3;
  int64_t v4 = *v1;
  unint64_t v5 = *((void *)*v1 + 2) + v3;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (unint64_t v7 = *((void *)v4 + 3) >> 1, v7 < v5))
  {
    int64_t v4 = sub_18945AF98(isUniquelyReferenced_nonNull_native, v5, 1, v4);
    unint64_t v7 = *((void *)v4 + 3) >> 1;
  }

  int64_t v8 = *((void *)v4 + 2);
  uint64_t result = v3;
  unint64_t v10 = v7 - v8;
  if (v7 != v8)
  {
    if ((v10 & 0x8000000000000000LL) != 0)
    {
      __break(1u);
      return result;
    }

    if (!(_BYTE)a1) {
      goto LABEL_17;
    }
    uint64_t result = 0LL;
    v4[v8 + 32] = a1;
    if (v10 != 1) {
      goto LABEL_11;
    }
  }

  if (v10 < v3)
  {
    __break(1u);
LABEL_19:
    uint64_t result = sub_189463444(result, a1);
    char v13 = result;
    int64_t v14 = v8 + 1;
    while (1)
    {
      unint64_t v15 = *((void *)v4 + 3);
      if ((uint64_t)(v15 >> 1) < v14)
      {
        int64_t v16 = v8;
        int64_t v17 = v14;
        uint64_t result = (uint64_t)sub_18945AF98((char *)(v15 > 1), v14, 1, v4);
        int64_t v14 = v17;
        int64_t v8 = v16;
        int64_t v4 = (char *)result;
        if (v16 < *(void *)(result + 24) >> 1)
        {
LABEL_24:
          v4[v8 + 32] = v13;
          *((void *)v4 + 2) = v14;
          goto LABEL_17;
        }
      }

      else if (v8 < (uint64_t)(v15 >> 1))
      {
        goto LABEL_24;
      }

      *((void *)v4 + 2) = v8;
    }
  }

  if (v7 == v8)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
LABEL_11:
    *((void *)v4 + 2) = ++v8;
    uint64_t v11 = 1LL;
  }

  if (v11 == v10 && result != 0) {
    goto LABEL_19;
  }
LABEL_17:
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_189467244(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_189467258( a1,  a2,  a3,  (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_189469000,  (uint64_t (*)(uint64_t, uint64_t))sub_18946348C);
}

uint64_t sub_189467258( uint64_t result, unint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  unint64_t v8 = ((unint64_t)(unsigned __int16)(32 - __clz((unsigned __int16)a3)) + 7) >> 3;
  if (v8 < result)
  {
    __break(1u);
    goto LABEL_17;
  }

  if (v8 < a2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v10 = result;
  uint64_t v11 = result - a2;
  unint64_t v7 = *v6;
  int64_t v12 = *((void *)*v6 + 2);
  int64_t v13 = v12 + result - a2;
  if (__OFADD__(v12, result - a2))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  unint64_t v5 = a5;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (int64_t v17 = *((void *)v7 + 3) >> 1, v17 < v13))
  {
    if (v12 <= v13) {
      int64_t v18 = v13;
    }
    else {
      int64_t v18 = v12;
    }
    unint64_t v7 = sub_18945AF98(isUniquelyReferenced_nonNull_native, v18, 1, v7);
    int64_t v17 = *((void *)v7 + 3) >> 1;
  }

  uint64_t v19 = *((void *)v7 + 2);
  int64_t v20 = v17 - v19;
  uint64_t result = a4(&v35, &v7[v19 + 32], v17 - v19, v10, a2, a3);
  if (result < v11) {
    goto LABEL_19;
  }
  if (result >= 1)
  {
    uint64_t v21 = *((void *)v7 + 2);
    BOOL v22 = __OFADD__(v21, result);
    uint64_t v23 = v21 + result;
    if (v22)
    {
      __break(1u);
LABEL_42:
      *((void *)v7 + 2) = v20 + 1;
      goto LABEL_15;
    }

    *((void *)v7 + 2) = v23;
  }

  if (result != v20)
  {
LABEL_15:
    *uint64_t v6 = v7;
    return result;
  }

LABEL_47:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

uint64_t sub_1894674E0(uint64_t result)
{
  int64_t v3 = ((unint64_t)(unsigned __int16)(32 - __clz((unsigned __int16)result)) + 7) >> 3;
  int64_t v4 = *v1;
  int64_t v5 = *((void *)*v1 + 2);
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  unsigned __int16 v7 = result;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (int64_t v9 = *((void *)v4 + 3) >> 1, v9 < v6))
  {
    if (v5 <= v6) {
      int64_t v10 = v5 + v3;
    }
    else {
      int64_t v10 = v5;
    }
    int64_t v4 = sub_18945AF98(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    int64_t v9 = *((void *)v4 + 3) >> 1;
  }

  uint64_t v11 = *((void *)v4 + 2);
  uint64_t v12 = v9 - v11;
  uint64_t result = sub_1894687C8((unint64_t)&v24, (uint64_t)&v4[v11 + 32], v9 - v11, v7);
  if (result < v3) {
    goto LABEL_15;
  }
  if (result >= 1)
  {
    uint64_t v13 = *((void *)v4 + 2);
    BOOL v14 = __OFADD__(v13, result);
    uint64_t v15 = v13 + result;
    if (v14)
    {
      __break(1u);
      goto LABEL_32;
    }

    *((void *)v4 + 2) = v15;
  }

  if (result == v12)
  {
LABEL_16:
    uint64_t v16 = v25;
    if (!v25) {
      goto LABEL_13;
    }
    int64_t v3 = *((void *)v4 + 2);
    unsigned int v17 = v24;
    uint64_t result = sub_18946348C(v25, v24);
    int64_t v18 = v16 - 1;
    if (v16 >= 1)
    {
      int64_t v2 = ((unint64_t)(unsigned __int16)(32 - __clz(v17)) + 7) >> 3;
      if (v2 >= v16) {
        goto LABEL_21;
      }
    }

    __break(1u);
    do
    {
LABEL_20:
      while (1)
      {
        *((void *)v4 + 2) = v3;
LABEL_21:
        unint64_t v19 = *((void *)v4 + 3);
        int64_t v20 = v19 >> 1;
        if (v3 < v20) {
          goto LABEL_23;
        }
      }

      uint64_t v23 = result;
      int64_t v4 = sub_18945AF98((char *)(v19 > 1), v3 + 1, 1, v4);
      uint64_t result = v23;
      int64_t v20 = *((void *)v4 + 3) >> 1;
    }

    while (v3 >= v20);
LABEL_23:
    uint64_t v21 = v18;
    while (1)
    {
      v4[v3++ + 32] = result;
      if (!v21) {
        break;
      }
      uint64_t result = sub_18946348C(v21, v17);
      if (v18 > v2 || (BOOL v22 = v21 < 1, --v21, v22))
      {
        __break(1u);
        return result;
      }

      if (v20 == v3)
      {
        int64_t v3 = v20;
        int64_t v18 = v21;
        goto LABEL_20;
      }
    }

uint64_t sub_1894676CC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_1894676E0( a1,  a2,  a3,  (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_189469110,  (uint64_t (*)(uint64_t, uint64_t))sub_1894634E0);
}

uint64_t sub_1894676E0( uint64_t result, unint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  unint64_t v8 = ((unint64_t)(32 - __clz(a3)) + 7) >> 3;
  if (v8 < result)
  {
    __break(1u);
    goto LABEL_17;
  }

  if (v8 < a2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v10 = result;
  uint64_t v11 = result - a2;
  unsigned __int16 v7 = *v6;
  int64_t v12 = *((void *)*v6 + 2);
  int64_t v13 = v12 + result - a2;
  if (__OFADD__(v12, result - a2))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  int64_t v5 = a5;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (int64_t v17 = *((void *)v7 + 3) >> 1, v17 < v13))
  {
    if (v12 <= v13) {
      int64_t v18 = v13;
    }
    else {
      int64_t v18 = v12;
    }
    unsigned __int16 v7 = sub_18945AF98(isUniquelyReferenced_nonNull_native, v18, 1, v7);
    int64_t v17 = *((void *)v7 + 3) >> 1;
  }

  uint64_t v19 = *((void *)v7 + 2);
  int64_t v20 = v17 - v19;
  uint64_t result = a4(&v35, &v7[v19 + 32], v17 - v19, v10, a2, a3);
  if (result < v11) {
    goto LABEL_19;
  }
  if (result >= 1)
  {
    uint64_t v21 = *((void *)v7 + 2);
    BOOL v22 = __OFADD__(v21, result);
    uint64_t v23 = v21 + result;
    if (v22)
    {
      __break(1u);
LABEL_42:
      *((void *)v7 + 2) = v20 + 1;
      goto LABEL_15;
    }

    *((void *)v7 + 2) = v23;
  }

  if (result != v20)
  {
LABEL_15:
    *int64_t v6 = v7;
    return result;
  }

uint64_t sub_18946795C(uint64_t result)
{
  int64_t v3 = ((unint64_t)(32 - __clz(result)) + 7) >> 3;
  int64_t v4 = *v1;
  int64_t v5 = *((void *)*v1 + 2);
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  unsigned int v7 = result;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (int64_t v9 = *((void *)v4 + 3) >> 1, v9 < v6))
  {
    if (v5 <= v6) {
      int64_t v10 = v5 + v3;
    }
    else {
      int64_t v10 = v5;
    }
    int64_t v4 = sub_18945AF98(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    int64_t v9 = *((void *)v4 + 3) >> 1;
  }

  uint64_t v11 = *((void *)v4 + 2);
  uint64_t v12 = v9 - v11;
  uint64_t result = sub_18946885C((unint64_t)&v24, (uint64_t)&v4[v11 + 32], v9 - v11, v7);
  if (result < v3) {
    goto LABEL_15;
  }
  if (result >= 1)
  {
    uint64_t v13 = *((void *)v4 + 2);
    BOOL v14 = __OFADD__(v13, result);
    uint64_t v15 = v13 + result;
    if (v14)
    {
      __break(1u);
      goto LABEL_32;
    }

    *((void *)v4 + 2) = v15;
  }

  if (result == v12)
  {
LABEL_16:
    uint64_t v16 = v25;
    if (!v25) {
      goto LABEL_13;
    }
    int64_t v3 = *((void *)v4 + 2);
    unsigned int v17 = v24;
    uint64_t result = sub_1894634E0(v25, v24);
    int64_t v18 = v16 - 1;
    if (v16 >= 1)
    {
      int64_t v2 = ((unint64_t)(32 - __clz(v17)) + 7) >> 3;
      if (v2 >= v16) {
        goto LABEL_21;
      }
    }

    __break(1u);
    do
    {
LABEL_20:
      while (1)
      {
        *((void *)v4 + 2) = v3;
LABEL_21:
        unint64_t v19 = *((void *)v4 + 3);
        int64_t v20 = v19 >> 1;
        if (v3 < v20) {
          goto LABEL_23;
        }
      }

      uint64_t v23 = result;
      int64_t v4 = sub_18945AF98((char *)(v19 > 1), v3 + 1, 1, v4);
      uint64_t result = v23;
      int64_t v20 = *((void *)v4 + 3) >> 1;
    }

    while (v3 >= v20);
LABEL_23:
    uint64_t v21 = v18;
    while (1)
    {
      v4[v3++ + 32] = result;
      if (!v21) {
        break;
      }
      uint64_t result = sub_1894634E0(v21, v17);
      if (v18 > v2 || (BOOL v22 = v21 < 1, --v21, v22))
      {
        __break(1u);
        return result;
      }

      if (v20 == v3)
      {
        int64_t v3 = v20;
        int64_t v18 = v21;
        goto LABEL_20;
      }
    }

int64_t sub_189467B3C(int64_t result, uint64_t (*a2)(uint64_t, unint64_t))
{
  int64_t v5 = (71 - __clz(result)) >> 3;
  int64_t v6 = *v3;
  int64_t v7 = *((void *)*v3 + 2);
  int64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  int64_t v2 = a2;
  unint64_t v9 = result;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (int64_t v11 = *((void *)v6 + 3) >> 1, v11 < v8))
  {
    if (v7 <= v8) {
      int64_t v12 = v7 + v5;
    }
    else {
      int64_t v12 = v7;
    }
    int64_t v6 = sub_18945AF98(isUniquelyReferenced_nonNull_native, v12, 1, v6);
    int64_t v11 = *((void *)v6 + 3) >> 1;
  }

  uint64_t v13 = *((void *)v6 + 2);
  uint64_t v14 = v11 - v13;
  uint64_t result = (int64_t)sub_1894688EC(&v26, (uint64_t)&v6[v13 + 32], v11 - v13, v9);
  if (result < v5) {
    goto LABEL_15;
  }
  if (result >= 1)
  {
    uint64_t v15 = *((void *)v6 + 2);
    BOOL v16 = __OFADD__(v15, result);
    uint64_t v17 = v15 + result;
    if (v16)
    {
      __break(1u);
      goto LABEL_32;
    }

    *((void *)v6 + 2) = v17;
  }

  if (result == v14)
  {
LABEL_16:
    uint64_t v18 = v27;
    if (!v27) {
      goto LABEL_13;
    }
    int64_t v5 = *((void *)v6 + 2);
    unint64_t v19 = v26;
    uint64_t result = v2(v27, v26);
    int64_t v20 = v18 - 1;
    if (v18 >= 1)
    {
      int64_t v4 = (71 - __clz(v19)) >> 3;
      if (v4 >= v18) {
        goto LABEL_21;
      }
    }

    __break(1u);
    do
    {
LABEL_20:
      while (1)
      {
        *((void *)v6 + 2) = v5;
LABEL_21:
        unint64_t v21 = *((void *)v6 + 3);
        int64_t v22 = v21 >> 1;
        if (v5 < v22) {
          goto LABEL_23;
        }
      }

      int64_t v25 = result;
      int64_t v6 = sub_18945AF98((char *)(v21 > 1), v5 + 1, 1, v6);
      uint64_t result = v25;
      int64_t v22 = *((void *)v6 + 3) >> 1;
    }

    while (v5 >= v22);
LABEL_23:
    uint64_t v23 = v20;
    while (1)
    {
      v6[v5++ + 32] = result;
      if (!v23) {
        break;
      }
      uint64_t result = v2(v23, v19);
      if (v20 > v4 || (BOOL v24 = v23 < 1, --v23, v24))
      {
        __break(1u);
        return result;
      }

      if (v22 == v5)
      {
        int64_t v5 = v22;
        int64_t v20 = v23;
        goto LABEL_20;
      }
    }

unint64_t sub_189467D30(unint64_t result, unint64_t a2, unsigned __int8 a3)
{
  unint64_t v3 = ((unint64_t)(32 - __clz(a3)) + 7) >> 3;
  if (v3 < result)
  {
    __break(1u);
  }

  else if (v3 >= a2)
  {
    result -= a2;
    return result;
  }

  __break(1u);
  return result;
}

unint64_t sub_189467D6C(unint64_t result, unint64_t a2, unsigned __int16 a3)
{
  unint64_t v3 = ((unint64_t)(unsigned __int16)(32 - __clz(a3)) + 7) >> 3;
  if (v3 < result)
  {
    __break(1u);
  }

  else if (v3 >= a2)
  {
    result -= a2;
    return result;
  }

  __break(1u);
  return result;
}

unint64_t sub_189467DA8(unint64_t result, unint64_t a2, unsigned int a3)
{
  unint64_t v3 = ((unint64_t)(32 - __clz(a3)) + 7) >> 3;
  if (v3 < result)
  {
    __break(1u);
  }

  else if (v3 >= a2)
  {
    result -= a2;
    return result;
  }

  __break(1u);
  return result;
}

unint64_t sub_189467DDC(unint64_t result, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = (71 - __clz(a3)) >> 3;
  if (v3 < result)
  {
    __break(1u);
  }

  else if (v3 >= a2)
  {
    result -= a2;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t ASN1Any.init<A>(erasing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>)
{
  uint64_t v13 = sub_18945AF98(0LL, 1024LL, 0, MEMORY[0x18961AFE8]);
  (*(void (**)(char **, uint64_t, uint64_t))(a3 + 8))(&v13, a2, a3);
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8LL))(a1, a2);
    return swift_bridgeObjectRelease();
  }

  else
  {
    int64_t v10 = v13;
    int64_t v11 = v13 + 32;
    uint64_t v12 = (2LL * *((void *)v13 + 2)) | 1;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8LL))(a1, a2);
    *a4 = v10;
    a4[1] = v11;
    a4[2] = 0LL;
    a4[3] = (char *)v12;
  }

  return result;
}

uint64_t ASN1Any.init<A>(erasing:withIdentifier:)@<X0>( uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char **a5@<X8>)
{
  uint64_t v10 = *a2;
  char v11 = *((_BYTE *)a2 + 8);
  uint64_t v18 = sub_18945AF98(0LL, 1024LL, 0, MEMORY[0x18961AFE8]);
  uint64_t v16 = v10;
  char v17 = v11;
  (*(void (**)(char **, uint64_t *, uint64_t, uint64_t))(a4 + 40))(&v18, &v16, a3, a4);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8LL))(a1, a3);
    return swift_bridgeObjectRelease();
  }

  else
  {
    uint64_t v13 = v18;
    uint64_t v14 = v18 + 32;
    uint64_t v15 = (2LL * *((void *)v18 + 2)) | 1;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8LL))(a1, a3);
    *a5 = v13;
    a5[1] = v14;
    a5[2] = 0LL;
    a5[3] = (char *)v15;
  }

  return result;
}

uint64_t ASN1Any.init(derEncoded:)@<X0>(_OWORD *a1@<X0>, char **a2@<X8>)
{
  int64_t v2 = a1;
  __int128 v4 = a1[3];
  v14[1] = a1[2];
  v14[2] = v4;
  __int128 v5 = a1[5];
  v14[3] = a1[4];
  v14[4] = v5;
  __int128 v6 = a1[1];
  __int128 v13 = *a1;
  v14[0] = v6;
  uint64_t v12 = sub_18945AF98(0LL, 1024LL, 0, MEMORY[0x18961AFE8]);
  uint64_t v10 = *(void *)v2;
  char v11 = *((_BYTE *)v2 + 8);
  sub_18945DC00(v14, v15);
  sub_18945DC00(v15, &v16);
  LOBYTE(v2) = v17;
  sub_18945DC18((uint64_t)&v13);
  sub_18945C108(&v10, (v2 & 1) == 0, (uint64_t)&v12, (uint64_t)&v13);
  sub_18945DC58((uint64_t)&v13);
  uint64_t result = sub_18945DC58((uint64_t)&v13);
  int64_t v8 = v12 + 32;
  uint64_t v9 = (2LL * *((void *)v12 + 2)) | 1;
  *a2 = v12;
  a2[1] = v8;
  a2[2] = 0LL;
  a2[3] = (char *)v9;
  return result;
}

uint64_t ASN1Any.serialize(into:)()
{
  uint64_t v1 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v2 = v0[3];
  uint64_t v4 = swift_unknownObjectRetain();
  sub_189469594(v4, v1, v3, v2);
  return swift_unknownObjectRelease();
}

uint64_t ASN1Any.hash(into:)()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3] >> 1;
  uint64_t result = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v4 = v0[1];
  uint64_t result = sub_189473A58();
  BOOL v5 = __OFSUB__(v2, v1);
  uint64_t v6 = v2 - v1;
  if (!v6) {
    return result;
  }
  if ((v6 < 0) ^ v5 | (v6 == 0))
  {
LABEL_8:
    __break(1u);
    return result;
  }

  uint64_t v7 = v4 + v1;
  do
  {
    ++v7;
    uint64_t result = sub_189473A64();
    --v6;
  }

  while (v6);
  return result;
}

uint64_t static ASN1Any.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_18945B3A4( *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a2 + 8),  *(void *)(a2 + 16),  *(void *)(a2 + 24));
}

uint64_t ASN1Any.hashValue.getter()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_189473A4C();
  unint64_t v4 = v3 >> 1;
  uint64_t result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }

  else
  {
    uint64_t result = sub_189473A58();
    BOOL v6 = __OFSUB__(v4, v2);
    uint64_t v7 = v4 - v2;
    if (!v7) {
      return sub_189473A7C();
    }
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      uint64_t v8 = v1 + v2;
      do
      {
        ++v8;
        sub_189473A64();
        --v7;
      }

      while (v7);
      return sub_189473A7C();
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_189468244@<X0>(_OWORD *a1@<X0>, char **a2@<X8>)
{
  return ASN1Any.init(derEncoded:)(a1, a2);
}

uint64_t sub_189468268()
{
  uint64_t v1 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v2 = v0[3];
  uint64_t v4 = swift_unknownObjectRetain();
  sub_189469594(v4, v1, v3, v2);
  return swift_unknownObjectRelease();
}

uint64_t sub_1894682D0()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_189473A4C();
  unint64_t v4 = v3 >> 1;
  uint64_t result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }

  else
  {
    uint64_t result = sub_189473A58();
    BOOL v6 = __OFSUB__(v4, v2);
    uint64_t v7 = v4 - v2;
    if (!v7) {
      return sub_189473A7C();
    }
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      uint64_t v8 = v1 + v2;
      do
      {
        ++v8;
        sub_189473A64();
        --v7;
      }

      while (v7);
      return sub_189473A7C();
    }
  }

  __break(1u);
  return result;
}

uint64_t _s9SwiftASN10B10UTF8StringV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  return sub_18945B3A4( *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a2 + 8),  *(void *)(a2 + 16),  *(void *)(a2 + 24));
}

uint64_t ASN1Any.description.getter()
{
  return 0x28796E41314E5341LL;
}

uint64_t sub_189468404()
{
  return 0x28796E41314E5341LL;
}

uint64_t DERParseable.init(asn1Any:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return DERParseable.init(derEncoded:)( *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  a2,  a3);
}

uint64_t DERImplicitlyTaggable.init(asn1Any:withIdentifier:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v8 = a1[2];
  unint64_t v9 = a1[3];
  char v10 = *(_BYTE *)(a2 + 8);
  uint64_t v12 = *(void *)a2;
  char v13 = v10;
  return DERImplicitlyTaggable.init(derEncoded:withIdentifier:)(v6, v7, v8, v9, &v12, a3, a4);
}

uint64_t sub_18946850C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *v3;
  uint64_t v6 = v3[1];
  int64_t v7 = v3[2];
  __int128 v29 = *(_OWORD *)(v3 + 3);
  if (!a2) {
    goto LABEL_5;
  }
  uint64_t v8 = a3;
  if (!a3)
  {
LABEL_44:
    *(void *)uint64_t result = v5;
    *(void *)(result + 8) = v6;
    *(void *)(result + 16) = v7;
    *(_OWORD *)(result + 24) = v29;
    return v8;
  }

  if ((a3 & 0x8000000000000000LL) == 0)
  {
    int64_t v9 = (unint64_t)v29 >> 1;
    if (v7 == (unint64_t)v29 >> 1)
    {
LABEL_5:
      uint64_t v8 = 0LL;
      goto LABEL_44;
    }

    uint64_t v28 = v5;
    uint64_t v26 = result;
    if (v7 >= (uint64_t)((unint64_t)v29 >> 1))
    {
LABEL_40:
      __break(1u);
LABEL_41:
      uint64_t v6 = v31;
LABEL_43:
      swift_unknownObjectRetain();
      int64_t v7 = v4;
      uint64_t result = v26;
      uint64_t v5 = v28;
      goto LABEL_44;
    }

    uint64_t v10 = a2;
    uint64_t v27 = v6 + 112;
    uint64_t v11 = 1LL;
    uint64_t v31 = v6;
    while (v9 > v7)
    {
      uint64_t v12 = (uint64_t *)(v6 + 96 * v7);
      uint64_t v13 = *v12;
      char v14 = *((_BYTE *)v12 + 8);
      char v15 = *((_BYTE *)v12 + 24);
      int64_t v16 = v7 + 1;
      __int128 v33 = *((_OWORD *)v12 + 3);
      __int128 v34 = *((_OWORD *)v12 + 2);
      if (v15)
      {
        uint64_t v17 = v12[2];
        int64_t v18 = (unint64_t)v29 >> 1;
        if (v16 != v9)
        {
          unint64_t v19 = (void *)(v27 + 96 * v7);
          int64_t v18 = v7 + 1;
          do
          {
            if (v18 >= v9)
            {
LABEL_46:
              __break(1u);
LABEL_47:
              __break(1u);
              goto LABEL_48;
            }

            if (v17 >= *v19) {
              goto LABEL_17;
            }
            int64_t v20 = v18 + 1;
            if (__OFADD__(v18, 1LL)) {
              goto LABEL_47;
            }
            ++v18;
            v19 += 12;
          }

          while (v20 != v9);
          int64_t v18 = (unint64_t)v29 >> 1;
LABEL_17:
          if (v18 <= v7) {
            goto LABEL_49;
          }
          if (v18 < 0) {
            goto LABEL_50;
          }
        }

        int64_t v21 = v18 - v16;
        if (__OFSUB__(v18, v16)) {
          goto LABEL_51;
        }
        if (v21 < 0) {
          goto LABEL_52;
        }
        int64_t v22 = v9 - v16;
        if (__OFSUB__(v9, v16)) {
          goto LABEL_53;
        }
        if (!v21 || v22 < 0 || (int64_t v4 = (unint64_t)v29 >> 1, v22 >= v21))
        {
          int64_t v4 = v18;
          if (__OFADD__(v16, v21)) {
            goto LABEL_56;
          }
          if (v9 < v18) {
            goto LABEL_54;
          }
        }

        if (v4 <= v7) {
          goto LABEL_55;
        }
        if (v16 != v18)
        {
          if (v16 >= v18) {
            goto LABEL_57;
          }
          uint64_t v23 = (uint64_t *)(v27 + 96 * v7);
          do
          {
            uint64_t v24 = *v23;
            v23 += 12;
            if (v17 >= v24)
            {
              __break(1u);
              goto LABEL_46;
            }

            --v21;
          }

          while (v21);
          if (*(void *)(v6 + 96 * v16 + 16) != v17 + 1) {
            goto LABEL_58;
          }
        }

        uint64_t v32 = v29 & 1 | (2 * v18);
        uint64_t v25 = swift_unknownObjectRetain();
      }

      else
      {
        uint64_t result = v12[8];
        if (!result) {
          goto LABEL_60;
        }
        int64_t v4 = v7 + 1;
        uint64_t v6 = v12[9];
        int64_t v16 = v12[10];
        uint64_t v32 = v12[11];
        uint64_t v25 = swift_unknownObjectRetain();
        uint64_t v17 = 0LL;
      }

      *(void *)uint64_t v10 = v13;
      *(_BYTE *)(v10 + 8) = v14;
      *(void *)(v10 + 16) = v25;
      *(void *)(v10 + 24) = v6;
      *(void *)(v10 + 32) = v16;
      *(void *)(v10 + 40) = v32;
      *(void *)(v10 + 48) = v17;
      *(_BYTE *)(v10 + 56) = v15 ^ 1;
      *(_OWORD *)(v10 + 64) = v34;
      *(_OWORD *)(v10 + 80) = v33;
      uint64_t v8 = a3;
      if (v11 == a3) {
        goto LABEL_41;
      }
      uint64_t v6 = v31;
      if (v4 == v9)
      {
        int64_t v4 = (unint64_t)v29 >> 1;
        uint64_t v8 = v11;
        goto LABEL_43;
      }

      ++v11;
      v10 += 96LL;
      uint64_t result = swift_unknownObjectRetain();
      int64_t v7 = v4;
      if (v4 >= v9) {
        goto LABEL_40;
      }
    }

LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
  }

  __break(1u);
LABEL_60:
  __break(1u);
  return result;
}

unint64_t sub_1894687C8( unint64_t result, uint64_t a2, unint64_t a3, unsigned __int16 a4)
{
  unint64_t v4 = ((unint64_t)(unsigned __int16)(32 - __clz(a4)) + 7) >> 3;
  if (!a2)
  {
    unint64_t v6 = v4;
    unint64_t v4 = 0LL;
    goto LABEL_12;
  }

  if (!a3)
  {
    unint64_t v6 = v4;
LABEL_11:
    unint64_t v4 = a3;
    goto LABEL_12;
  }

  if ((a3 & 0x8000000000000000LL) == 0)
  {
    if (a4)
    {
      uint64_t v5 = 0LL;
      unint64_t v6 = v4 - 1;
      do
      {
        *(_BYTE *)(a2 + v5) = a4 >> (8 * (v6 & 1));
        if (a3 - 1 == v5) {
          goto LABEL_11;
        }
        ++v5;
      }

      while (--v6 != -1LL);
    }

    unint64_t v6 = 0LL;
LABEL_12:
    *(_WORD *)uint64_t result = a4;
    *(void *)(result + 8) = v6;
    return v4;
  }

  __break(1u);
  return result;
}

unint64_t sub_18946885C(unint64_t result, uint64_t a2, unint64_t a3, unsigned int a4)
{
  unint64_t v4 = 32 - __clz(a4) + 7LL;
  unint64_t v5 = v4 >> 3;
  if (!a2)
  {
    unint64_t v7 = v4 >> 3;
    unint64_t v5 = 0LL;
    goto LABEL_12;
  }

  if (!a3)
  {
    unint64_t v7 = v4 >> 3;
LABEL_11:
    unint64_t v5 = a3;
    goto LABEL_12;
  }

  if ((a3 & 0x8000000000000000LL) == 0)
  {
    if (a4)
    {
      uint64_t v6 = 0LL;
      unint64_t v7 = v5 - 1;
      char v8 = (v4 & 0xF8) - 8;
      do
      {
        *(_BYTE *)(a2 + v6) = a4 >> (v8 & 0x18);
        if (a3 - 1 == v6) {
          goto LABEL_11;
        }
        ++v6;
        --v7;
        v8 -= 8;
      }

      while (v7 != -1LL);
    }

    unint64_t v7 = 0LL;
LABEL_12:
    *(_DWORD *)uint64_t result = a4;
    *(void *)(result + 8) = v7;
    return v5;
  }

  __break(1u);
  return result;
}

unint64_t *sub_1894688EC( unint64_t *result, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4 = (71 - __clz(a4)) >> 3;
  if (!a2)
  {
    unint64_t v6 = v4;
    unint64_t v4 = 0LL;
    goto LABEL_12;
  }

  if (!a3)
  {
    unint64_t v6 = v4;
LABEL_11:
    unint64_t v4 = a3;
    goto LABEL_12;
  }

  if ((a3 & 0x8000000000000000LL) == 0)
  {
    if (a4)
    {
      uint64_t v5 = 0LL;
      unint64_t v6 = v4 - 1;
      char v7 = 8 * v4 - 8;
      do
      {
        *(_BYTE *)(a2 + v5) = a4 >> (v7 & 0x38);
        if (a3 - 1 == v5) {
          goto LABEL_11;
        }
        ++v5;
        --v6;
        v7 -= 8;
      }

      while (v6 != -1LL);
    }

    unint64_t v6 = 0LL;
LABEL_12:
    *uint64_t result = a4;
    result[1] = v6;
    return (unint64_t *)v4;
  }

  __break(1u);
  return result;
}

uint64_t sub_189468974( uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned __int8 a6)
{
  if (!a2)
  {
    a3 = 0LL;
LABEL_24:
    int64_t v16 = a4;
LABEL_26:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(_BYTE *)(result + 16) = a6;
    *(void *)(result + 24) = v16;
    return a3;
  }

  if (!a3) {
    goto LABEL_24;
  }
  if ((a3 & 0x8000000000000000LL) == 0)
  {
    uint64_t v6 = 0LL;
    int64_t v7 = ((unint64_t)(32 - __clz(a6)) + 7) >> 3;
    if (a5 >= a4) {
      int64_t v8 = a4;
    }
    else {
      int64_t v8 = a5;
    }
    uint64_t v9 = 8 * a4;
    unint64_t v10 = (a4 << 59) - 0x800000000000000LL;
    int64_t v11 = a4;
    while (!__OFSUB__(v11, a5))
    {
      if (v11 == a5)
      {
        int64_t v16 = a5;
        a3 = a4 - a5;
        goto LABEL_26;
      }

      int64_t v12 = v11;
      if (v8 == v11) {
        goto LABEL_28;
      }
      v9 -= 8LL;
      if (v9 < -128) {
        goto LABEL_30;
      }
      if (v9 > 127) {
        goto LABEL_31;
      }
      if (v7 < a4) {
        goto LABEL_32;
      }
      BOOL v13 = __OFSUB__(v11--, 1LL);
      if (v12 - 1 < 0 != v13) {
        goto LABEL_32;
      }
      if (v10) {
        unsigned __int8 v14 = 0;
      }
      else {
        unsigned __int8 v14 = a6;
      }
      BOOL v15 = v10 > 0x800000000000000LL;
      v10 -= 0x800000000000000LL;
      if (v15) {
        unsigned __int8 v14 = 0;
      }
      *(_BYTE *)(a2 + v6++) = v14;
      if (a3 == v6)
      {
        int64_t v16 = v12 - 1;
        goto LABEL_26;
      }
    }

    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_189468A98( uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, int a6)
{
  if (!a2)
  {
LABEL_26:
    a3 = 0LL;
LABEL_27:
    int64_t v16 = a4;
LABEL_29:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(_WORD *)(result + 16) = a6;
    *(void *)(result + 24) = v16;
    return a3;
  }

  if (!a3) {
    goto LABEL_27;
  }
  if (a3 < 0) {
    goto LABEL_35;
  }
  uint64_t v6 = 0LL;
  int64_t v7 = ((unint64_t)(unsigned __int16)(32 - __clz((unsigned __int16)a6)) + 7) >> 3;
  if (a5 >= a4) {
    int64_t v8 = a4;
  }
  else {
    int64_t v8 = a5;
  }
  uint64_t v9 = 8 * a4 - 8;
  unint64_t v10 = (a4 << 51) - 0x18000000000001LL;
  unint64_t v11 = (a4 << 51) - 0x8000000000000LL;
  int64_t v12 = a4;
  while (!__OFSUB__(v12, a5))
  {
    if (v12 == a5)
    {
      int64_t v16 = a5;
      a3 = a4 - a5;
      goto LABEL_29;
    }

    int64_t v13 = v12;
    if (v8 == v12) {
      goto LABEL_31;
    }
    if (v9 < -32768) {
      goto LABEL_33;
    }
    if (v9 >= 0x8000) {
      goto LABEL_34;
    }
    if (v10 <= 0xFFDFFFFFFFFFFFFELL)
    {
LABEL_15:
      LOBYTE(v14) = 0;
      if (v7 < a4) {
        goto LABEL_25;
      }
      goto LABEL_20;
    }

    if ((v11 & 0x8000000000000000LL) != 0)
    {
      if (v11 <= 0xFFF0000000000000LL) {
        goto LABEL_15;
      }
      int v14 = a6 << (-BYTE6(v11) & 8);
      if (v7 < a4)
      {
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
    }

    else
    {
      if (v11 >> 52) {
        goto LABEL_15;
      }
      int v14 = (unsigned __int16)a6 >> (v9 & 8);
      if (v7 < a4) {
        goto LABEL_25;
      }
    }

uint64_t sub_189468C28( uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned int a6)
{
  if (!a2)
  {
    a3 = 0LL;
LABEL_30:
    int64_t v15 = a4;
LABEL_32:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(_DWORD *)(result + 16) = a6;
    *(void *)(result + 24) = v15;
    return a3;
  }

  if (!a3) {
    goto LABEL_30;
  }
  if (a3 < 0) {
    goto LABEL_39;
  }
  uint64_t v6 = 0LL;
  int64_t v7 = ((unint64_t)(32 - __clz(a6)) + 7) >> 3;
  if (a5 >= a4) {
    int64_t v8 = a4;
  }
  else {
    int64_t v8 = a5;
  }
  uint64_t v9 = 8 * a4 - 8;
  int64_t v10 = a4;
  uint64_t v11 = (a4 << 35) - 0x800000000LL;
  while (!__OFSUB__(v10, a5))
  {
    if (v10 == a5)
    {
      int64_t v15 = a5;
      a3 = a4 - a5;
      goto LABEL_32;
    }

    int64_t v12 = v10;
    if (v8 == v10) {
      goto LABEL_34;
    }
    if (v9 > 0x7FFFFFFF) {
      goto LABEL_37;
    }
    if (v11 < (uint64_t)0xFFFFFFE000000000LL)
    {
LABEL_15:
      LOBYTE(v13) = 0;
      if (v7 < a4) {
        goto LABEL_38;
      }
      goto LABEL_24;
    }

    if (v11 > 0x2000000000LL)
    {
LABEL_18:
      LOBYTE(v13) = 0;
      if (v7 < a4) {
        goto LABEL_38;
      }
      goto LABEL_24;
    }

    if (v11 < 0)
    {
      unsigned int v13 = a6 << (-BYTE4(v11) & 0x18);
    }

    else
    {
      unsigned int v13 = a6 >> (v9 & 0x18);
    }

    if (v7 < a4) {
      goto LABEL_38;
    }
LABEL_24:
    BOOL v14 = __OFSUB__(v10--, 1LL);
    if (v12 - 1 < 0 != v14) {
      goto LABEL_38;
    }
    *(_BYTE *)(a2 + v6) = v13;
    v9 -= 8LL;
    v11 -= 0x800000000LL;
    if (a3 == ++v6)
    {
      int64_t v15 = v12 - 1;
      goto LABEL_32;
    }
  }

  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
  return result;
}

int64_t *sub_189468DB8( int64_t *result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unint64_t a6)
{
  if (!a2)
  {
    a3 = 0LL;
LABEL_28:
    int64_t v15 = a4;
LABEL_30:
    *uint64_t result = a4;
    result[1] = a5;
    result[2] = a6;
    result[3] = v15;
    return (int64_t *)a3;
  }

  if (!a3) {
    goto LABEL_28;
  }
  if (a3 < 0) {
    goto LABEL_35;
  }
  uint64_t v6 = 0LL;
  int64_t v7 = (71 - __clz(a6)) >> 3;
  if (a5 >= a4) {
    int64_t v8 = a4;
  }
  else {
    int64_t v8 = a5;
  }
  char v9 = 8 - 8 * a4;
  uint64_t v10 = 8 * a4 - 8;
  int64_t v11 = a4;
  while (!__OFSUB__(v11, a5))
  {
    if (v11 == a5)
    {
      int64_t v15 = a5;
      a3 = a4 - a5;
      goto LABEL_30;
    }

    int64_t v12 = v11;
    if (v8 == v11) {
      goto LABEL_32;
    }
    if (v10 < -64)
    {
LABEL_13:
      LOBYTE(v13) = 0;
      if (v7 < a4) {
        goto LABEL_34;
      }
      goto LABEL_22;
    }

    if (v10 > 64)
    {
LABEL_16:
      LOBYTE(v13) = 0;
      if (v7 < a4) {
        goto LABEL_34;
      }
      goto LABEL_22;
    }

    if (v10 < 0)
    {
      unint64_t v13 = a6 << (v9 & 0x38);
    }

    else
    {
      unint64_t v13 = a6 >> (v10 & 0x38);
    }

    if (v7 < a4) {
      goto LABEL_34;
    }
LABEL_22:
    BOOL v14 = __OFSUB__(v11--, 1LL);
    if (v12 - 1 < 0 != v14) {
      goto LABEL_34;
    }
    *(_BYTE *)(a2 + v6) = v13;
    v9 += 8;
    v10 -= 8LL;
    if (a3 == ++v6)
    {
      int64_t v15 = v12 - 1;
      goto LABEL_30;
    }
  }

  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_189468F00( uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned __int8 a6)
{
  if (!a2)
  {
    a3 = 0LL;
LABEL_22:
    uint64_t v12 = a4;
LABEL_24:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(_BYTE *)(result + 16) = a6;
    *(void *)(result + 24) = v12;
    return a3;
  }

  if (!a3) {
    goto LABEL_22;
  }
  if ((a3 & 0x8000000000000000LL) == 0)
  {
    uint64_t v6 = 0LL;
    int64_t v7 = ((unint64_t)(32 - __clz(a6)) + 7) >> 3;
    if (a5 >= a4) {
      int64_t v8 = a4;
    }
    else {
      int64_t v8 = a5;
    }
    unint64_t v9 = 8 * a4;
    uint64_t v10 = a4;
    while (!__OFSUB__(v10, a5))
    {
      if (v10 == a5)
      {
        uint64_t v12 = a5;
        a3 = a4 - a5;
        goto LABEL_24;
      }

      if (v8 == v10) {
        goto LABEL_26;
      }
      v9 -= 8LL;
      if ((v9 & 0x8000000000000000LL) != 0) {
        goto LABEL_28;
      }
      if (v9 > 0xFF) {
        goto LABEL_29;
      }
      if (v7 < a4) {
        goto LABEL_30;
      }
      uint64_t v11 = v10 - 1;
      if (v10 < 1) {
        goto LABEL_30;
      }
      uint64_t v12 = v10 - 1;
      if (((v10 - 1) & 0x1F) != 0) {
        unsigned __int8 v13 = 0;
      }
      else {
        unsigned __int8 v13 = a6;
      }
      *(_BYTE *)(a2 + v6) = v13;
      uint64_t v10 = v11;
      if (a3 == ++v6) {
        goto LABEL_24;
      }
    }

    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_189469000( uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned __int16 a6)
{
  if (!a2)
  {
    a3 = 0LL;
LABEL_21:
    uint64_t v12 = a4;
LABEL_23:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(_WORD *)(result + 16) = a6;
    *(void *)(result + 24) = v12;
    return a3;
  }

  if (!a3) {
    goto LABEL_21;
  }
  if ((a3 & 0x8000000000000000LL) == 0)
  {
    uint64_t v6 = 0LL;
    int64_t v7 = ((unint64_t)(unsigned __int16)(32 - __clz(a6)) + 7) >> 3;
    if (a5 >= a4) {
      int64_t v8 = a4;
    }
    else {
      int64_t v8 = a5;
    }
    unint64_t v9 = 8 * a4 - 8;
    uint64_t v10 = a4;
    while (!__OFSUB__(v10, a5))
    {
      if (v10 == a5)
      {
        uint64_t v12 = a5;
        a3 = a4 - a5;
        goto LABEL_23;
      }

      if (v8 == v10) {
        goto LABEL_25;
      }
      if ((v9 & 0x8000000000000000LL) != 0) {
        goto LABEL_27;
      }
      if (v9 >> 16) {
        goto LABEL_28;
      }
      if (v7 < a4) {
        goto LABEL_29;
      }
      uint64_t v11 = v10 - 1;
      if (v10 < 1) {
        goto LABEL_29;
      }
      uint64_t v12 = v10 - 1;
      int v13 = a6 >> (v9 & 8);
      if ((v12 & 0x1FFE) != 0) {
        LOBYTE(v13) = 0;
      }
      *(_BYTE *)(a2 + v6) = v13;
      v9 -= 8LL;
      uint64_t v10 = v11;
      if (a3 == ++v6) {
        goto LABEL_23;
      }
    }

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
  }

  __break(1u);
  return result;
}

uint64_t sub_189469110( uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned int a6)
{
  if (!a2)
  {
    a3 = 0LL;
LABEL_21:
    uint64_t v12 = a4;
LABEL_23:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(_DWORD *)(result + 16) = a6;
    *(void *)(result + 24) = v12;
    return a3;
  }

  if (!a3) {
    goto LABEL_21;
  }
  if ((a3 & 0x8000000000000000LL) == 0)
  {
    uint64_t v6 = 0LL;
    int64_t v7 = ((unint64_t)(32 - __clz(a6)) + 7) >> 3;
    if (a5 >= a4) {
      int64_t v8 = a4;
    }
    else {
      int64_t v8 = a5;
    }
    unint64_t v9 = 8 * a4 - 8;
    uint64_t v10 = a4;
    while (!__OFSUB__(v10, a5))
    {
      if (v10 == a5)
      {
        uint64_t v12 = a5;
        a3 = a4 - a5;
        goto LABEL_23;
      }

      if (v8 == v10) {
        goto LABEL_25;
      }
      if ((v9 & 0x8000000000000000LL) != 0) {
        goto LABEL_27;
      }
      if (HIDWORD(v9)) {
        goto LABEL_28;
      }
      if (v7 < a4) {
        goto LABEL_29;
      }
      uint64_t v11 = v10 - 1;
      if (v10 < 1) {
        goto LABEL_29;
      }
      uint64_t v12 = v10 - 1;
      unsigned int v13 = a6 >> (v9 & 0x18);
      if ((v12 & 0x1FFFFFFC) != 0) {
        LOBYTE(v13) = 0;
      }
      *(_BYTE *)(a2 + v6) = v13;
      v9 -= 8LL;
      uint64_t v10 = v11;
      if (a3 == ++v6) {
        goto LABEL_23;
      }
    }

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
  }

  __break(1u);
  return result;
}

int64_t *sub_189469214( int64_t *result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unint64_t a6)
{
  if (!a2)
  {
    a3 = 0LL;
LABEL_20:
    int64_t v14 = a4;
LABEL_22:
    *uint64_t result = a4;
    result[1] = a5;
    result[2] = a6;
    result[3] = v14;
    return (int64_t *)a3;
  }

  if (!a3) {
    goto LABEL_20;
  }
  if ((a3 & 0x8000000000000000LL) == 0)
  {
    uint64_t v6 = 0LL;
    int64_t v7 = (71 - __clz(a6)) >> 3;
    if (a5 >= a4) {
      int64_t v8 = a4;
    }
    else {
      int64_t v8 = a5;
    }
    unint64_t v9 = 8 * a4 - 8;
    int64_t v10 = a4;
    while (!__OFSUB__(v10, a5))
    {
      if (v10 == a5)
      {
        int64_t v14 = a5;
        a3 = a4 - a5;
        goto LABEL_22;
      }

      int64_t v11 = v10;
      if (v8 == v10) {
        goto LABEL_24;
      }
      if ((v9 & 0x8000000000000000LL) != 0) {
        goto LABEL_26;
      }
      if (v7 < a4) {
        goto LABEL_27;
      }
      BOOL v12 = __OFSUB__(v10--, 1LL);
      if (v11 - 1 < 0 != v12) {
        goto LABEL_27;
      }
      unint64_t v13 = a6 >> (v9 & 0x38);
      if (v9 >= 0x40) {
        LOBYTE(v13) = 0;
      }
      *(_BYTE *)(a2 + v6) = v13;
      v9 -= 8LL;
      if (a3 == ++v6)
      {
        int64_t v14 = v11 - 1;
        goto LABEL_22;
      }
    }

    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_18946930C(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a2 < result || a3 >= result)
  {
    __break(1u);
    goto LABEL_13;
  }

  if ((unint64_t)(result - 0x1000000000000001LL) >> 61 != 7)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v4 = 8 * (result - 1);
  if (v4 < -128)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  if (v4 > 127)
  {
LABEL_15:
    __break(1u);
    return result;
  }

  unint64_t v5 = (result - 1) << 59;
  if (v5) {
    a4 = 0;
  }
  if (v5 <= 0x800000000000000LL) {
    return a4;
  }
  else {
    return 0LL;
  }
}

unint64_t sub_189469374@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, int64_t a5@<X8>)
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

uint64_t sub_1894693FC(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a2 < result || a3 >= result)
  {
    __break(1u);
    goto LABEL_10;
  }

  if ((unint64_t)(result - 0x1000000000000001LL) >> 61 != 7)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  unint64_t v4 = 8 * result - 8;
  if ((v4 & 0x8000000000000000LL) != 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  if (v4 > 0xFF)
  {
LABEL_12:
    __break(1u);
    return result;
  }

  if ((v4 & 0xF8) != 0) {
    return 0LL;
  }
  else {
    return a4;
  }
}

uint64_t sub_189469450(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 < result || a3 >= result)
  {
    __break(1u);
    goto LABEL_9;
  }

  if ((unint64_t)(result - 0x1000000000000001LL) >> 61 != 7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  unint64_t v4 = 8 * result - 8;
  if ((v4 & 0x8000000000000000LL) != 0)
  {
LABEL_10:
    __break(1u);
    return result;
  }

  if (v4 >= 0x40) {
    return 0LL;
  }
  else {
    return (a4 >> (v4 & 0x38));
  }
}

void sub_1894694A0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
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

  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
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
      char isUniquelyReferenced_nonNull_native = sub_18945AE98(isUniquelyReferenced_nonNull_native, v13, 1, v7);
      uint64_t v7 = isUniquelyReferenced_nonNull_native;
      if (v5 != a3) {
        goto LABEL_12;
      }
    }

    goto LABEL_16;
  }

LABEL_12:
  uint64_t v14 = *((void *)v7 + 2);
  if ((*((void *)v7 + 3) >> 1) - v14 < v6) {
    goto LABEL_19;
  }
  memcpy(&v7[8 * v14 + 32], (const void *)(a2 + 8 * a3), 8 * v6);
  if (v6 <= 0)
  {
LABEL_16:
    *unint64_t v4 = v7;
    return;
  }

  uint64_t v15 = *((void *)v7 + 2);
  BOOL v16 = __OFADD__(v15, v6);
  uint64_t v17 = v15 + v6;
  if (!v16)
  {
    *((void *)v7 + 2) = v17;
    goto LABEL_16;
  }

  uint64_t v14 = *((void *)v7 + 2);
  if ((*((void *)v7 + 3) >> 1) - v14 < v6) {
    goto LABEL_19;
  }
  memcpy(&v7[v14 + 32], (const void *)(a2 + a3), v6);
  if (v6 <= 0)
  {
LABEL_16:
    *unint64_t v4 = v7;
    return;
  }

  uint64_t v15 = *((void *)v7 + 2);
  BOOL v16 = __OFADD__(v15, v6);
  uint64_t v17 = v15 + v6;
  if (!v16)
  {
    *((void *)v7 + 2) = v17;
    goto LABEL_16;
  }

    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidStringRepresentation(reason:file:line:)( 0xD00000000000001FLL,  0x80000001894761B0LL,  (uint64_t)"SwiftASN1/ASN1Strings.swift",  27LL,  2,  321LL,  v7);
    swift_willThrow();
    return swift_unknownObjectRelease();
  }

    swift_unknownObjectRelease();
    return;
  }

    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD000000000000044LL,  0x80000001894766C0LL,  (uint64_t)"SwiftASN1/ASN1BitString.swift",  29LL,  2,  62LL,  v14);
    swift_willThrow();
    goto LABEL_13;
  }

  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
}

void sub_189469594(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
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

  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
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
      char isUniquelyReferenced_nonNull_native = sub_18945AF98(isUniquelyReferenced_nonNull_native, v13, 1, v7);
      uint64_t v7 = isUniquelyReferenced_nonNull_native;
      if (v5 != a3) {
        goto LABEL_12;
      }
    }

    goto LABEL_16;
  }

unint64_t sub_18946968C()
{
  unint64_t result = qword_18C797AA8;
  if (!qword_18C797AA8)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1Any, &type metadata for ASN1Any);
    atomic_store(result, (unint64_t *)&qword_18C797AA8);
  }

  return result;
}

ValueMetadata *type metadata accessor for ASN1Any()
{
  return &type metadata for ASN1Any;
}

void sub_1894696E0()
{
  uint64_t v1 = v0[2];
  unint64_t v2 = v0[3];
  uint64_t v3 = v2 >> 1;
  if (v1 == v2 >> 1) {
    goto LABEL_2;
  }
  if (v1 >= (uint64_t)(v2 >> 1))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  uint64_t v9 = v0[1];
  int v10 = *(char *)(v9 + v1);
  uint64_t v11 = v0[2];
  if (v10 < 0)
  {
    uint64_t v11 = v1 + 1;
    if (v1 + 1 == v3)
    {
LABEL_2:
      sub_18945AD44();
      swift_allocError();
      unint64_t v5 = v4;
      uint64_t v6 = 0xD000000000000026LL;
      uint64_t v7 = 0x8000000189476010LL;
      uint64_t v8 = 275LL;
LABEL_17:
      static ASN1Error.invalidASN1Object(reason:file:line:)( v6,  v7,  (uint64_t)"SwiftASN1/ObjectIdentifier.swift",  32LL,  2,  v8,  v5);
      swift_willThrow();
      return;
    }

    while (v11 < v3)
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1LL)) {
        goto LABEL_19;
      }
      ++v11;
      if (v15 == v3) {
        goto LABEL_2;
      }
    }

    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

LABEL_22:
  __break(1u);
}

void static ASN1ObjectIdentifier.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 6LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t ASN1ObjectIdentifier.init(derEncoded:withIdentifier:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  uint64_t v4 = *(void *)(result + 16);
  unint64_t v5 = *(void *)(result + 24);
  int64_t v6 = *(void *)(result + 32);
  unint64_t v7 = *(void *)(result + 40);
  unint64_t v8 = *(void *)(result + 48);
  unint64_t v9 = *(unsigned __int8 *)(result + 56);
  uint64_t v10 = *(void *)(result + 64);
  if (*(void *)result != *(void *)a2 || *(unsigned __int8 *)(result + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ObjectIdentifier.swift", 32LL, 2, 38LL, v18);
    j__swift_unknownObjectRelease(v4, v5, v6, v7, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }

  if (!*(_BYTE *)(result + 56))
  {
    __break(1u);
    return result;
  }

  uint64_t v11 = v3;
  uint64_t v12 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v12, v5, v6, v7, v8, 1LL);
  swift_unknownObjectRelease();
  int64_t v28 = v6;
  unint64_t v29 = v7;
  uint64_t v13 = (v7 >> 1) - v6;
  if (!__OFSUB__(v7 >> 1, v6))
  {
    unint64_t v7 = MEMORY[0x18961AFE8];
    if (v13 < 1)
    {
      int64_t v6 = *(void *)(MEMORY[0x18961AFE8] + 16LL);
LABEL_17:
      unint64_t v19 = sub_18945AE98(0LL, v6 + 1, 0, MEMORY[0x18961AFE8]);
      uint64_t v3 = v19;
      uint64_t v20 = *(void *)(v7 + 16);
      if (!v20)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_18945AD44();
        swift_allocError();
        static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD000000000000016LL,  0x8000000189475FF0LL,  (uint64_t)"SwiftASN1/ObjectIdentifier.swift",  32LL,  2,  79LL,  v23);
        swift_willThrow();
        swift_unknownObjectRelease();
        return swift_bridgeObjectRelease_n();
      }

      unint64_t v8 = *(void *)(v7 + 32);
      unint64_t v25 = (2 * v20) | 1;
      uint64_t v26 = v7 + 32;
      unint64_t v9 = v8 / 0x28;
      uint64_t v10 = 40LL;
      unint64_t v5 = *((void *)v19 + 2);
      unint64_t v24 = *((void *)v19 + 3);
      int64_t v21 = v24 >> 1;
      int64_t v6 = v5 + 1;
      swift_bridgeObjectRetain();
      if (v24 >> 1 > v5) {
        goto LABEL_19;
      }
      goto LABEL_25;
    }

    while (1)
    {
      uint64_t v3 = v11;
      sub_1894696E0();
      if (v11)
      {
        swift_bridgeObjectRelease();
        return swift_unknownObjectRelease();
      }

      uint64_t v15 = v14;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v7 = (unint64_t)sub_18945AE98(0LL, *(void *)(v7 + 16) + 1LL, 1, (char *)v7);
      }
      unint64_t v17 = *(void *)(v7 + 16);
      unint64_t v16 = *(void *)(v7 + 24);
      int64_t v6 = v17 + 1;
      if (v17 >= v16 >> 1) {
        unint64_t v7 = (unint64_t)sub_18945AE98((char *)(v16 > 1), v17 + 1, 1, (char *)v7);
      }
      *(void *)(v7 + 16) = v6;
      *(void *)(v7 + 8 * v17 + 32) = v15;
      if (__OFSUB__(v29 >> 1, v28)) {
        break;
      }
    }

    __break(1u);
  }

  __break(1u);
LABEL_25:
  uint64_t v3 = sub_18945AE98((char *)(v24 > 1), v6, 1, v3);
  unint64_t v24 = *((void *)v3 + 3);
  int64_t v21 = v24 >> 1;
LABEL_19:
  uint64_t v22 = v8 - v9 * v10;
  *((void *)v3 + 2) = v6;
  *(void *)&v3[8 * v5 + 32] = v9;
  *((void *)v3 + 2) = v5 + 2;
  *(void *)&v3[8 * v6 + 32] = v22;
  sub_1894694A0(v7, v26, 1LL, v25);
  swift_unknownObjectRelease();
  unint64_t result = swift_bridgeObjectRelease_n();
  *a3 = v3;
  return result;
}

uint64_t ASN1ObjectIdentifier.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_18945E8C0);
}

uint64_t sub_189469C8C(uint64_t a1, void *a2)
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
    swift_bridgeObjectRetain();
    uint64_t result = sub_189469D60(v7);
    uint64_t v9 = v2 - 2;
    if (!v9) {
      return swift_bridgeObjectRelease();
    }
    uint64_t v10 = 0LL;
    while (v9 != v10)
    {
      uint64_t result = sub_189469D60(a2[v10++ + 6]);
      if (v9 == v10) {
        return swift_unknownObjectRelease();
      }
    }

    __break(1u);
    goto LABEL_12;
  }

uint64_t sub_189469D60(unint64_t a1)
{
  if (a1)
  {
    unint64_t v3 = __clz(a1);
    unint64_t v4 = *v1;
    if (v3 - 57 >= 7)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v4 = sub_18945AF98(0LL, *((void *)v4 + 2) + 1LL, 1, v4);
      }
      uint64_t v6 = 7 * v5 - 7;
      uint64_t v7 = v5;
      while (v7 <= v5)
      {
        unint64_t v9 = *((void *)v4 + 2);
        unint64_t v8 = *((void *)v4 + 3);
        if (v9 >= v8 >> 1) {
          unint64_t v4 = sub_18945AF98((char *)(v8 > 1), v9 + 1, 1, v4);
        }
        --v7;
        *((void *)v4 + 2) = v9 + 1;
        v4[v9 + 32] = (a1 >> v6) | 0x80;
        v6 -= 7LL;
        if (v7 == 1) {
          goto LABEL_17;
        }
      }

      __break(1u);
LABEL_17:
      *uint64_t v1 = v4;
    }

    char v14 = a1 & 0x7F;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *((void *)v4 + 2) + 1LL, 1, v4);
      unint64_t v4 = (char *)result;
    }

    unint64_t v12 = *((void *)v4 + 2);
    unint64_t v15 = *((void *)v4 + 3);
    unint64_t v13 = v12 + 1;
    if (v12 >= v15 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v15 > 1), v12 + 1, 1, v4);
      unint64_t v4 = (char *)result;
    }
  }

  else
  {
    unint64_t v4 = *v1;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *((void *)v4 + 2) + 1LL, 1, v4);
      unint64_t v4 = (char *)result;
    }

    unint64_t v12 = *((void *)v4 + 2);
    unint64_t v11 = *((void *)v4 + 3);
    unint64_t v13 = v12 + 1;
    if (v12 >= v11 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v11 > 1), v12 + 1, 1, v4);
      unint64_t v4 = (char *)result;
    }

    char v14 = 0;
  }

  *((void *)v4 + 2) = v13;
  v4[v12 + 32] = v14;
  *uint64_t v1 = v4;
  return result;
}

void sub_189469F50(uint64_t a1@<X8>)
{
  *(void *)a1 = 6LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_189469F60@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, char **a3@<X8>)
{
  char v3 = *((_BYTE *)a2 + 8);
  uint64_t v5 = *a2;
  char v6 = v3;
  return ASN1ObjectIdentifier.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v5, a3);
}

uint64_t sub_189469F90(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_18946AB04);
}

uint64_t ASN1ObjectIdentifier.hash(into:)()
{
  uint64_t v1 = *v0;
  uint64_t result = sub_189473A58();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = v1 + 32;
    do
    {
      v4 += 8LL;
      uint64_t result = sub_189473A58();
      --v3;
    }

    while (v3);
  }

  return result;
}

BOOL static ASN1ObjectIdentifier.== infix(_:_:)(void **a1, void **a2)
{
  return sub_18946A038(*a1, *a2);
}

BOOL sub_18946A038(void *a1, void *a2)
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
  if (v2 == 1) {
    return 1LL;
  }
  uint64_t v4 = v2 - 2;
  char v5 = a1 + 5;
  char v6 = a2 + 5;
  do
  {
    uint64_t v8 = *v5++;
    uint64_t v7 = v8;
    uint64_t v10 = *v6++;
    uint64_t v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }

  while (v7 == v9 && v12);
  return result;
}

uint64_t ASN1ObjectIdentifier.hashValue.getter()
{
  uint64_t v1 = *v0;
  sub_189473A4C();
  sub_189473A58();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      v3 += 8LL;
      sub_189473A58();
      --v2;
    }

    while (v2);
  }

  return sub_189473A7C();
}

uint64_t sub_18946A120()
{
  uint64_t v1 = *v0;
  sub_189473A4C();
  uint64_t v2 = *(void *)(v1 + 16);
  sub_189473A58();
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      v3 += 8LL;
      sub_189473A58();
      --v2;
    }

    while (v2);
  }

  return sub_189473A7C();
}

BOOL sub_18946A188(void **a1, void **a2)
{
  return sub_18946A038(*a1, *a2);
}

uint64_t ASN1ObjectIdentifier.init(arrayLiteral:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_18946A19C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t ASN1ObjectIdentifier.description.getter()
{
  int64_t v1 = *(void *)(*(void *)v0 + 16LL);
  if (v1)
  {
    uint64_t v11 = MEMORY[0x18961AFE8];
    swift_bridgeObjectRetain();
    sub_18946A9E8(0LL, v1, 0);
    uint64_t v2 = 0LL;
    do
    {
      uint64_t v3 = sub_1894739EC();
      uint64_t v5 = v4;
      unint64_t v7 = *(void *)(v11 + 16);
      unint64_t v6 = *(void *)(v11 + 24);
      if (v7 >= v6 >> 1) {
        sub_18946A9E8((char *)(v6 > 1), v7 + 1, 1);
      }
      ++v2;
      *(void *)(v11 + 16) = v7 + 1;
      uint64_t v8 = v11 + 16 * v7;
      *(void *)(v8 + 32) = v3;
      *(void *)(v8 + 40) = v5;
    }

    while (v1 != v2);
    swift_bridgeObjectRelease();
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C5058D8);
  sub_18946AA20();
  uint64_t v9 = sub_189473734();
  swift_bridgeObjectRelease();
  return v9;
}

void sub_18946A2F4()
{
  qword_18C797AB0 = (uint64_t)&unk_18A3A7F08;
}

uint64_t static ASN1ObjectIdentifier.NamedCurves.secp256r1.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797540, &qword_18C797AB0, a1);
}

void sub_18946A324()
{
  qword_18C797AB8 = (uint64_t)&unk_18A3A7F60;
}

uint64_t static ASN1ObjectIdentifier.NamedCurves.secp384r1.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797548, &qword_18C797AB8, a1);
}

void sub_18946A354()
{
  qword_18C797AC0 = (uint64_t)&unk_18A3A7FA8;
}

uint64_t static ASN1ObjectIdentifier.NamedCurves.secp521r1.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797550, &qword_18C797AC0, a1);
}

void sub_18946A384()
{
  qword_18C797AC8 = (uint64_t)&unk_18A3A7FF0;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.idEcPublicKey.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797558, &qword_18C797AC8, a1);
}

void sub_18946A3B4()
{
  qword_18C797AD0 = (uint64_t)&unk_18A3A8040;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.sha256WithRSAEncryption.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797560, &qword_18C797AD0, a1);
}

void sub_18946A3E4()
{
  qword_18C797AD8 = (uint64_t)&unk_18A3A8098;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.sha384WithRSAEncryption.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797568, &qword_18C797AD8, a1);
}

void sub_18946A414()
{
  qword_18C797AE0 = (uint64_t)&unk_18A3A80F0;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.sha512WithRSAEncryption.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797570, &qword_18C797AE0, a1);
}

void sub_18946A444()
{
  qword_18C797AE8 = (uint64_t)&unk_18A3A8148;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.rsaPSS.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797578, &qword_18C797AE8, a1);
}

void sub_18946A474()
{
  qword_18C797AF0 = (uint64_t)&unk_18A3A81A0;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.rsaEncryption.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797580, &qword_18C797AF0, a1);
}

void sub_18946A4A4()
{
  qword_18C797AF8 = (uint64_t)&unk_18A3A81F8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.name.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797588, &qword_18C797AF8, a1);
}

void sub_18946A4D4()
{
  qword_18C797B00 = (uint64_t)&unk_18A3A8238;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.surname.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797590, &qword_18C797B00, a1);
}

void sub_18946A504()
{
  qword_18C797B08 = (uint64_t)&unk_18A3A8278;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.givenName.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797598, &qword_18C797B08, a1);
}

void sub_18946A534()
{
  qword_18C797B10 = (uint64_t)&unk_18A3A82B8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.initials.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C7975A0, &qword_18C797B10, a1);
}

void sub_18946A564()
{
  qword_18C797B18 = (uint64_t)&unk_18A3A82F8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.generationQualifier.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C7975A8, &qword_18C797B18, a1);
}

void sub_18946A594()
{
  qword_18C797B20 = (uint64_t)&unk_18A3A8338;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.commonName.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C7975B0, &qword_18C797B20, a1);
}

void sub_18946A5C4()
{
  qword_18C797B28 = (uint64_t)&unk_18A3A8378;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.localityName.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C7975B8, &qword_18C797B28, a1);
}

void sub_18946A5F4()
{
  qword_18C797B30 = (uint64_t)&unk_18A3A83B8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.stateOrProvinceName.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C7975C0, &qword_18C797B30, a1);
}

void sub_18946A624()
{
  qword_18C797B38 = (uint64_t)&unk_18A3A83F8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.organizationName.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C7975C8, &qword_18C797B38, a1);
}

void sub_18946A654()
{
  qword_18C797B40 = (uint64_t)&unk_18A3A8438;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.organizationalUnitName.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C7975D0, &qword_18C797B40, a1);
}

void sub_18946A684()
{
  qword_18C797B48 = (uint64_t)&unk_18A3A8478;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.title.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C7975D8, &qword_18C797B48, a1);
}

void sub_18946A6B4()
{
  qword_18C797B50 = (uint64_t)&unk_18A3A84B8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.dnQualifier.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C7975E0, &qword_18C797B50, a1);
}

void sub_18946A6E4()
{
  qword_18C797B58 = (uint64_t)&unk_18A3A84F8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.countryName.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C7975E8, &qword_18C797B58, a1);
}

void sub_18946A714()
{
  qword_18C797B60 = (uint64_t)&unk_18A3A8538;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.serialNumber.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C7975F0, &qword_18C797B60, a1);
}

void sub_18946A744()
{
  qword_18C797B68 = (uint64_t)&unk_18A3A8578;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.pseudonym.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C7975F8, &qword_18C797B68, a1);
}

void sub_18946A774()
{
  qword_18C797B70 = (uint64_t)&unk_18A3A85B8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.domainComponent.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797600, &qword_18C797B70, a1);
}

void sub_18946A7A4()
{
  qword_18C797B78 = (uint64_t)&unk_18A3A8610;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.emailAddress.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797608, &qword_18C797B78, a1);
}

void sub_18946A7D4()
{
  qword_18C797B80 = (uint64_t)&unk_18A3A8668;
}

uint64_t static ASN1ObjectIdentifier.OCSP.basicResponse.getter@<X0>(void *a1@<X8>)
{
  return sub_18946A804(&qword_18C797610, &qword_18C797B80, a1);
}

uint64_t sub_18946A804@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  *a3 = *a2;
  return swift_bridgeObjectRetain();
}

void sub_18946A844(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  int64_t v7 = 7 * v5;
  if ((unsigned __int128)(v5 * (__int128)7LL) >> 64 != (7 * v5) >> 63)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  if (!__OFADD__(v7, 7LL))
  {
    if (v7 + 7 > 71)
    {
      sub_18945AD44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD000000000000021LL,  0x8000000189476070LL,  (uint64_t)"SwiftASN1/ObjectIdentifier.swift",  32LL,  2,  298LL,  v8);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v10 = sub_18945F73C(0LL, v7, 7LL);
    uint64_t v11 = *(void *)(v10 + 16);
    if (!v11)
    {
LABEL_22:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }

    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    if (a3 <= v4) {
      uint64_t v14 = v4;
    }
    else {
      uint64_t v14 = a3;
    }
    unint64_t v15 = v14 - a3;
    while (v15 > v11 - 1)
    {
      unint64_t v17 = *(void *)(v10 + 8 * v13 + 32);
      if (v17 - 65 <= 0xFFFFFFFFFFFFFF7ELL)
      {
        unint64_t v16 = 0LL;
      }

      else
      {
        unint64_t v18 = *(_BYTE *)(a2 + a3 + v13) & 0x7F;
        if ((v17 & 0x8000000000000000LL) != 0)
        {
          unint64_t v20 = v18 >> -(char)v17;
          if (v17 <= 0xFFFFFFFFFFFFFFC0LL) {
            unint64_t v16 = 0LL;
          }
          else {
            unint64_t v16 = v20;
          }
        }

        else
        {
          uint64_t v19 = v18 << v17;
          if (v17 >= 0x40) {
            unint64_t v16 = 0LL;
          }
          else {
            unint64_t v16 = v19;
          }
        }
      }

      ++v13;
      v12 |= v16;
      if (v11 == v13) {
        goto LABEL_22;
      }
    }

    __break(1u);
    goto LABEL_24;
  }

LABEL_26:
  __break(1u);
}

char *sub_18946A9E8(char *a1, int64_t a2, char a3)
{
  BOOL result = sub_1894704F8(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_18946AA04(char *a1, int64_t a2, char a3)
{
  BOOL result = sub_1894706F0(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

unint64_t sub_18946AA20()
{
  unint64_t result = qword_18C5058E0;
  if (!qword_18C5058E0)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C5058D8);
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x189618458], v1);
    atomic_store(result, (unint64_t *)&qword_18C5058E0);
  }

  return result;
}

unint64_t sub_18946AA70()
{
  unint64_t result = qword_18C797B88;
  if (!qword_18C797B88)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1ObjectIdentifier,  &type metadata for ASN1ObjectIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C797B88);
  }

  return result;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier()
{
  return &type metadata for ASN1ObjectIdentifier;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier.NamedCurves()
{
  return &type metadata for ASN1ObjectIdentifier.NamedCurves;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier.AlgorithmIdentifier()
{
  return &type metadata for ASN1ObjectIdentifier.AlgorithmIdentifier;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier.NameAttributes()
{
  return &type metadata for ASN1ObjectIdentifier.NameAttributes;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier.OCSP()
{
  return &type metadata for ASN1ObjectIdentifier.OCSP;
}

uint64_t sub_18946AB04(uint64_t a1)
{
  return sub_18945E8C0(a1);
}

uint64_t static ASN1Error.unexpectedFieldType(_:file:line:)@<X0>( uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t result = swift_allocObject();
  *(_BYTE *)(result + 16) = 0;
  *(void *)(result + 24) = 0xD000000000000013LL;
  *(void *)(result + 32) = 0x80000001894760A0LL;
  *(void *)(result + 40) = a1;
  *(void *)(result + 48) = a2;
  *(_BYTE *)(result + 56) = a3;
  *(void *)(result + 64) = a4;
  *a5 = result;
  return result;
}

uint64_t type metadata accessor for ASN1Error.Backing()
{
  return objc_opt_self();
}

uint64_t static ASN1Error.invalidASN1Object(reason:file:line:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = 1;
  *(void *)(v14 + 24) = a1;
  *(void *)(v14 + 32) = a2;
  *(void *)(v14 + 40) = a3;
  *(void *)(v14 + 48) = a4;
  *(_BYTE *)(v14 + 56) = a5;
  *(void *)(v14 + 64) = a6;
  *a7 = v14;
  return swift_bridgeObjectRetain();
}

uint64_t static ASN1Error.truncatedASN1Field(file:line:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t result = swift_allocObject();
  *(_BYTE *)(result + 16) = 3;
  *(void *)(result + 24) = 0LL;
  *(void *)(result + 32) = 0xE000000000000000LL;
  *(void *)(result + 40) = a1;
  *(void *)(result + 48) = a2;
  *(_BYTE *)(result + 56) = a3;
  *(void *)(result + 64) = a4;
  *a5 = result;
  return result;
}

uint64_t static ASN1Error.unsupportedFieldLength(reason:file:line:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = 4;
  *(void *)(v14 + 24) = a1;
  *(void *)(v14 + 32) = a2;
  *(void *)(v14 + 40) = a3;
  *(void *)(v14 + 48) = a4;
  *(_BYTE *)(v14 + 56) = a5;
  *(void *)(v14 + 64) = a6;
  *a7 = v14;
  return swift_bridgeObjectRetain();
}

uint64_t static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = 2;
  *(void *)(v14 + 24) = a1;
  *(void *)(v14 + 32) = a2;
  *(void *)(v14 + 40) = a3;
  *(void *)(v14 + 48) = a4;
  *(_BYTE *)(v14 + 56) = a5;
  *(void *)(v14 + 64) = a6;
  *a7 = v14;
  return swift_bridgeObjectRetain();
}

void ASN1Error.code.getter(_BYTE *a1@<X8>)
{
  *a1 = *(_BYTE *)(*(void *)v1 + 16LL);
}

uint64_t static ASN1Error.invalidPEMDocument(reason:file:line:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = 5;
  *(void *)(v14 + 24) = a1;
  *(void *)(v14 + 32) = a2;
  *(void *)(v14 + 40) = a3;
  *(void *)(v14 + 48) = a4;
  *(_BYTE *)(v14 + 56) = a5;
  *(void *)(v14 + 64) = a6;
  *a7 = v14;
  return swift_bridgeObjectRetain();
}

uint64_t static ASN1Error.invalidStringRepresentation(reason:file:line:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = 6;
  *(void *)(v14 + 24) = a1;
  *(void *)(v14 + 32) = a2;
  *(void *)(v14 + 40) = a3;
  *(void *)(v14 + 48) = a4;
  *(_BYTE *)(v14 + 56) = a5;
  *(void *)(v14 + 64) = a6;
  *a7 = v14;
  return swift_bridgeObjectRetain();
}

uint64_t ASN1Error.hash(into:)()
{
  return sub_189473A58();
}

BOOL static ASN1Error.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(*(void *)a1 + 16LL) == *(unsigned __int8 *)(*(void *)a2 + 16LL);
}

uint64_t ASN1Error.hashValue.getter()
{
  return sub_189473A7C();
}

uint64_t sub_18946AF38()
{
  return sub_189473A7C();
}

uint64_t sub_18946AF7C()
{
  return sub_189473A58();
}

uint64_t sub_18946AFA8()
{
  return sub_189473A7C();
}

BOOL sub_18946AFE8(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(*(void *)a1 + 16LL) == *(unsigned __int8 *)(*(void *)a2 + 16LL);
}

uint64_t ASN1Error.description.getter()
{
  return 0x6F727245314E5341LL;
}

BOOL sub_18946B144(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_18946B158()
{
  return sub_189473A7C();
}

uint64_t sub_18946B19C()
{
  return sub_189473A58();
}

uint64_t sub_18946B1C4()
{
  return sub_189473A7C();
}

void static ASN1Error.ErrorCode.unexpectedFieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static ASN1Error.ErrorCode.invalidASN1Object.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void static ASN1Error.ErrorCode.invalidASN1IntegerEncoding.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

void static ASN1Error.ErrorCode.truncatedASN1Field.getter(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

void static ASN1Error.ErrorCode.unsupportedFieldLength.getter(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

void static ASN1Error.ErrorCode.invalidPEMDocument.getter(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

void static ASN1Error.ErrorCode.invalidStringRepresentation.getter(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t ASN1Error.ErrorCode.hash(into:)()
{
  return sub_189473A58();
}

BOOL static ASN1Error.ErrorCode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ASN1Error.ErrorCode.hashValue.getter()
{
  return sub_189473A7C();
}

uint64_t ASN1Error.ErrorCode.description.getter()
{
  return sub_18947377C();
}

uint64_t sub_18946B304()
{
  return sub_18947377C();
}

uint64_t sub_18946B334()
{
  return swift_deallocClassInstance();
}

unint64_t sub_18946B35C()
{
  unint64_t result = qword_18C797B90;
  if (!qword_18C797B90)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1Error, &type metadata for ASN1Error);
    atomic_store(result, (unint64_t *)&qword_18C797B90);
  }

  return result;
}

unint64_t sub_18946B3A4()
{
  unint64_t result = qword_18C797B98;
  if (!qword_18C797B98)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1Error.ErrorCode,  &type metadata for ASN1Error.ErrorCode);
    atomic_store(result, (unint64_t *)&qword_18C797B98);
  }

  return result;
}

ValueMetadata *type metadata accessor for ASN1Error()
{
  return &type metadata for ASN1Error;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ASN1Error.ErrorCode()
{
  return &type metadata for ASN1Error.ErrorCode;
}

uint64_t _s9SwiftASN19ASN1ErrorV9ErrorCodeV11BackingCodeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }

uint64_t _s9SwiftASN19ASN1ErrorV9ErrorCodeV11BackingCodeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF9) {
    return ((uint64_t (*)(void))((char *)&loc_18946B4FC + 4 * byte_1894749CD[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_18946B530 + 4 * asc_1894749C8[v4]))();
}

uint64_t sub_18946B530(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18946B538(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x18946B540LL);
  }
  return result;
}

uint64_t sub_18946B54C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x18946B554LL);
  }
  *(_BYTE *)unint64_t result = a2 + 6;
  return result;
}

uint64_t sub_18946B558(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18946B560(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18946B56C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_18946B574(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ASN1Error.ErrorCode.BackingCode()
{
  return &type metadata for ASN1Error.ErrorCode.BackingCode;
}

unint64_t sub_18946B590()
{
  unint64_t result = qword_18C797C58;
  if (!qword_18C797C58)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&unk_189474BC4, &type metadata for ASN1Error.ErrorCode.BackingCode);
    atomic_store(result, (unint64_t *)&qword_18C797C58);
  }

  return result;
}

unint64_t sub_18946B5D8()
{
  unint64_t result = qword_18C797C60;
  if (!qword_18C797C60)
  {
    uint64_t v1 = type metadata accessor for ASN1Error.Backing();
    unint64_t result = MEMORY[0x1895E6DB8](&unk_189474BEC, v1);
    atomic_store(result, (unint64_t *)&qword_18C797C60);
  }

  return result;
}

void static Bool.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 1LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t Bool.init(derEncoded:withIdentifier:)(uint64_t a1, uint64_t a2)
{
  return sub_18946B82C(a1, a2) & 1;
}

uint64_t Bool.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_18945E8A8);
}

uint64_t sub_18946B694(uint64_t *a1, char a2)
{
  uint64_t v4 = *a1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((a2 & 1) != 0)
  {
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v4 + 16) + 1LL, 1, (char *)v4);
      uint64_t v4 = result;
    }

    unint64_t v7 = *(void *)(v4 + 16);
    unint64_t v6 = *(void *)(v4 + 24);
    unint64_t v8 = v7 + 1;
    if (v7 >= v6 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v6 > 1), v7 + 1, 1, (char *)v4);
      uint64_t v4 = result;
    }

    char v9 = -1;
  }

  else
  {
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v4 + 16) + 1LL, 1, (char *)v4);
      uint64_t v4 = result;
    }

    unint64_t v7 = *(void *)(v4 + 16);
    unint64_t v10 = *(void *)(v4 + 24);
    unint64_t v8 = v7 + 1;
    if (v7 >= v10 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v10 > 1), v7 + 1, 1, (char *)v4);
      uint64_t v4 = result;
    }

    char v9 = 0;
  }

  *(void *)(v4 + 16) = v8;
  *(_BYTE *)(v4 + v7 + 32) = v9;
  *a1 = v4;
  return result;
}

void sub_18946B7A4(uint64_t a1@<X8>)
{
  *(void *)a1 = 1LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_18946B7B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_18946B82C(a1, a2);
  if (!v3) {
    *a3 = result & 1;
  }
  return result;
}

uint64_t sub_18946B7E0(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_18946BAE0);
}

uint64_t sub_18946B82C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  if (*(void *)a1 != *(void *)a2 || *(unsigned __int8 *)(a1 + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Boolean.swift", 27LL, 2, 22LL, v11);
    j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, v7);
    swift_unknownObjectRelease();
LABEL_14:
    swift_willThrow();
    return v8 & 1;
  }

  if (!*(_BYTE *)(a1 + 56))
  {
    j__swift_unknownObjectRelease(*(void *)(a1 + 16), v2, v5, v4, v6, 0LL);
    swift_unknownObjectRelease();
LABEL_13:
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD00000000000001CLL,  0x8000000189476120LL,  (uint64_t)"SwiftASN1/ASN1Boolean.swift",  27LL,  2,  26LL,  v12);
    goto LABEL_14;
  }

  uint64_t v9 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v9, v2, v5, v4, v6, 1LL);
  uint64_t result = swift_unknownObjectRelease();
  if (__OFSUB__(v4 >> 1, v5))
  {
    __break(1u);
    goto LABEL_19;
  }

  if ((v4 >> 1) - v5 != 1)
  {
    j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1LL);
    goto LABEL_13;
  }

  if (v5 < (uint64_t)(v4 >> 1))
  {
    if (*(unsigned __int8 *)(v2 + v5) == 255)
    {
      LOBYTE(v8) = 1;
      j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1LL);
    }

    else if (*(_BYTE *)(v2 + v5))
    {
      sub_18945AD44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD000000000000019LL,  0x8000000189476140LL,  (uint64_t)"SwiftASN1/ASN1Boolean.swift",  27LL,  2,  38LL,  v13);
      swift_willThrow();
      j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1LL);
    }

    else
    {
      j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1LL);
      LOBYTE(v8) = 0;
    }

    return v8 & 1;
  }

uint64_t sub_18946BAE0(uint64_t *a1)
{
  return sub_18945E8A8(a1);
}

void static ASN1UTF8String.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 12LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t (*ASN1UTF8String.bytes.modify())()
{
  return nullsub_1;
}

unint64_t sub_18946BB20(unint64_t result, int64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    if (result) {
      return (unint64_t)sub_18946CFD0((const void *)result, a2);
    }
    __break(1u);
    goto LABEL_9;
  }

  if (HIDWORD(result))
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  if (result >> 11 != 27)
  {
    if (WORD1(result) <= 0x10u) {
      return (unint64_t)sub_18946CF04(result);
    }
    goto LABEL_10;
  }

LABEL_11:
  __break(1u);
  return result;
}

      *a5 = result;
      a5[1] = a2;
      a5[2] = a3;
      a5[3] = a4;
      return result;
    }

uint64_t ASN1UTF8String.init(derEncoded:withIdentifier:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_18946C3A8(a1, a2, a3);
}

uint64_t ASN1UTF8String.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_18945E88C);
}

uint64_t ASN1UTF8String.withUnsafeBytes<A>(_:)()
{
  return sub_18946CB28();
}

void sub_18946BC1C(uint64_t a1@<X8>)
{
  *(void *)a1 = 12LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_18946BC2C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_18946BD88( a1,  a2,  a3,  a4,  (uint64_t (*)(uint64_t, uint64_t *))ASN1UTF8String.init(derEncoded:withIdentifier:));
}

uint64_t sub_18946BC48(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_18945ED84);
}

uint64_t sub_18946BCA0(void *a1)
{
  return ASN1UTF8String.init(stringLiteral:)(*a1, a1[1]);
}

void static ASN1TeletexString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 20LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t (*ASN1TeletexString.bytes.modify())()
{
  return nullsub_1;
}

uint64_t ASN1TeletexString.init(derEncoded:withIdentifier:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_18946C3A8(a1, a2, a3);
}

uint64_t ASN1TeletexString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_18945ED84);
}

uint64_t ASN1TeletexString.withUnsafeBytes<A>(_:)()
{
  return sub_18946CB28();
}

void sub_18946BD5C(uint64_t a1@<X8>)
{
  *(void *)a1 = 20LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_18946BD6C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_18946BD88( a1,  a2,  a3,  a4,  (uint64_t (*)(uint64_t, uint64_t *))ASN1TeletexString.init(derEncoded:withIdentifier:));
}

uint64_t sub_18946BD88( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t *))
{
  char v5 = *((_BYTE *)a2 + 8);
  uint64_t v7 = *a2;
  char v8 = v5;
  return a5(a1, &v7);
}

void static ASN1PrintableString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 19LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t ASN1PrintableString.bytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return swift_unknownObjectRelease();
}

uint64_t (*ASN1PrintableString.bytes.modify(void *a1))(uint64_t result, char a2)
{
  *a1 = v1;
  return sub_18946BE08;
}

uint64_t sub_18946BE08(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void *)(*(void *)result + 16LL);
    uint64_t v3 = *(void *)(*(void *)result + 24LL) >> 1;
    uint64_t v4 = v3 - v2;
    if (v3 != v2)
    {
      if (v2 > v3) {
        uint64_t v3 = *(void *)(*(void *)result + 16LL);
      }
      uint64_t v5 = v3 - v2;
      uint64_t v6 = (unsigned __int8 *)(*(void *)(*(void *)result + 8LL) + v2);
      while (v5)
      {
        unsigned int v7 = *v6;
        BOOL v8 = v7 - 58 > 0xFFFFFFF5 || (v7 & 0xFFFFFFDF) - 91 > 0xFFFFFFE5;
        if (!v8)
        {
          BOOL v8 = v7 > 0x3F;
          unint64_t v9 = (1LL << v7) & 0xA400FB8100000000LL;
          if (v8 || v9 == 0)
          {
            __break(1u);
            break;
          }
        }

        --v5;
        ++v6;
        if (!--v4) {
          return result;
        }
      }

      __break(1u);
    }
  }

  return result;
}

uint64_t ASN1PrintableString.init(derEncoded:withIdentifier:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v4 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  unint64_t v6 = *(void *)(result + 40);
  uint64_t v8 = *(void *)(result + 48);
  uint64_t v9 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result == *(void *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(_BYTE *)(result + 56))
    {
      uint64_t v10 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v10, v4, v7, v6, v8, 1LL);
      swift_unknownObjectRelease();
      uint64_t result = sub_18946D158(v4, v7, v6);
      if ((result & 1) != 0)
      {
        *a3 = v5;
        a3[1] = v4;
        a3[2] = v7;
        a3[3] = v6;
      }

      else
      {
        sub_18945AD44();
        swift_allocError();
        static ASN1Error.invalidStringRepresentation(reason:file:line:)( 0xD000000000000025LL,  0x8000000189476160LL,  (uint64_t)"SwiftASN1/ASN1Strings.swift",  27LL,  2,  138LL,  v12);
        swift_willThrow();
        return j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
      }
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31LL, 2, 26LL, v11);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }

  return result;
}

uint64_t ASN1PrintableString.init(contentBytes:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  int64_t v5 = a4 >> 1;
  if (a4 >> 1 == a3)
  {
LABEL_2:
    *a5 = result;
    a5[1] = a2;
    a5[2] = a3;
    a5[3] = a4;
  }

  else
  {
    uint64_t v6 = a3;
    while (v6 < v5)
    {
      unsigned int v7 = *(unsigned __int8 *)(a2 + v6);
      BOOL v8 = (v7 & 0xFFFFFFDF) - 91 > 0xFFFFFFE5 || v7 - 58 > 0xFFFFFFF5;
      if (!v8)
      {
        BOOL v8 = v7 > 0x3F;
        unint64_t v9 = (1LL << v7) & 0xA400FB8100000000LL;
        if (v8 || v9 == 0)
        {
          sub_18945AD44();
          swift_allocError();
          static ASN1Error.invalidStringRepresentation(reason:file:line:)( 0xD000000000000025LL,  0x8000000189476160LL,  (uint64_t)"SwiftASN1/ASN1Strings.swift",  27LL,  2,  146LL,  v11);
          swift_willThrow();
          return swift_unknownObjectRelease();
        }
      }

      if (v5 == ++v6) {
        goto LABEL_2;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t ASN1PrintableString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_18945ED84);
}

uint64_t ASN1PrintableString.withUnsafeBytes<A>(_:)()
{
  return sub_18946CB28();
}

void sub_18946C1C4(uint64_t a1@<X8>)
{
  *(void *)a1 = 19LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_18946C1D4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_18946BD88( a1,  a2,  a3,  a4,  (uint64_t (*)(uint64_t, uint64_t *))ASN1PrintableString.init(derEncoded:withIdentifier:));
}

uint64_t ASN1PrintableString.init(stringLiteral:)@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_18946CC80(a1, a2, (uint64_t (*)(uint64_t, void, uint64_t))sub_18946D158, a3);
}

uint64_t ASN1PrintableString.init(_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_18946CD2C( a1,  a2,  (uint64_t (*)(uint64_t, void, uint64_t))sub_18946D158,  0xD000000000000025LL,  0x8000000189476160LL,  193LL,  a3);
}

uint64_t sub_18946C234@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_18946CE24(a1, (uint64_t (*)(uint64_t, void, uint64_t))sub_18946D158, a2);
}

void static ASN1UniversalString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 28LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t (*ASN1UniversalString.bytes.modify())()
{
  return nullsub_1;
}

uint64_t ASN1UniversalString.init(derEncoded:withIdentifier:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_18946C3A8(a1, a2, a3);
}

uint64_t ASN1UniversalString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_18945ED84);
}

uint64_t ASN1UniversalString.withUnsafeBytes<A>(_:)()
{
  return sub_18946CB28();
}

void sub_18946C2F0(uint64_t a1@<X8>)
{
  *(void *)a1 = 28LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_18946C300(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_18946BD88( a1,  a2,  a3,  a4,  (uint64_t (*)(uint64_t, uint64_t *))ASN1UniversalString.init(derEncoded:withIdentifier:));
}

void static ASN1BMPString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 30LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t _s9SwiftASN10B10UTF8StringV5bytess10ArraySliceVys5UInt8VGvs_0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = swift_unknownObjectRelease();
  *uint64_t v4 = a1;
  v4[1] = a2;
  _OWORD v4[2] = a3;
  v4[3] = a4;
  return result;
}

uint64_t (*ASN1BMPString.bytes.modify())()
{
  return nullsub_1;
}

uint64_t ASN1BMPString.init(derEncoded:withIdentifier:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_18946C3A8(a1, a2, a3);
}

uint64_t sub_18946C3A8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v4 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  uint64_t v6 = *(void *)(result + 40);
  uint64_t v8 = *(void *)(result + 48);
  uint64_t v9 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result == *(void *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(_BYTE *)(result + 56))
    {
      uint64_t v10 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v10, v4, v7, v6, v8, 1LL);
      uint64_t result = swift_unknownObjectRelease();
      *a3 = v5;
      a3[1] = v4;
      a3[2] = v7;
      a3[3] = v6;
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31LL, 2, 26LL, v11);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }

  return result;
}

uint64_t _s9SwiftASN10B10UTF8StringV12contentBytesACs10ArraySliceVys5UInt8VG_tcfC_0@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t ASN1BMPString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_18945ED84);
}

uint64_t ASN1BMPString.withUnsafeBytes<A>(_:)()
{
  return sub_18946CB28();
}

void sub_18946C550(uint64_t a1@<X8>)
{
  *(void *)a1 = 30LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_18946C560(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_18946BD88( a1,  a2,  a3,  a4,  (uint64_t (*)(uint64_t, uint64_t *))ASN1BMPString.init(derEncoded:withIdentifier:));
}

uint64_t _s9SwiftASN10B10UTF8StringV13stringLiteralACSS_tcfC_0@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_9;
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
      char v5 = sub_18946D0F4(v4, 0LL);
      uint64_t result = sub_189473968();
      if ((v7 & 1) != 0) {
        break;
      }
      if (result == v4) {
        goto LABEL_11;
      }
      __break(1u);
LABEL_9:
      uint64_t v4 = sub_1894737A0();
      if (!v4) {
        goto LABEL_10;
      }
    }

    __break(1u);
  }

  else
  {
LABEL_10:
    char v5 = (void *)MEMORY[0x18961AFE8];
LABEL_11:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v8 = (2LL * v5[2]) | 1;
    *a3 = v5;
    a3[1] = v5 + 4;
    a3[2] = 0LL;
    a3[3] = v8;
  }

  return result;
}

void static ASN1IA5String.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 22LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t _s9SwiftASN10B10UTF8StringV5bytess10ArraySliceVys5UInt8VGvg_0()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_18946C68C( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v8 = a1[3];
  uint64_t v9 = swift_unknownObjectRetain();
  a5(v9, v6, v7, v8);
  return swift_unknownObjectRelease();
}

uint64_t ASN1IA5String.bytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return swift_unknownObjectRelease();
}

uint64_t (*ASN1IA5String.bytes.modify(void *a1))(uint64_t result, char a2)
{
  *a1 = v1;
  return sub_18946C718;
}

uint64_t sub_18946C718(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void *)(*(void *)result + 16LL);
    uint64_t v3 = *(void *)(*(void *)result + 24LL) >> 1;
    if (v2 != v3)
    {
      if (v2 >= v3)
      {
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }

      uint64_t v4 = *(void *)(*(void *)result + 8LL);
      if (*(char *)(v4 + v2) < 0)
      {
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }

      uint64_t v5 = v2 + 1;
      if (v2 + 1 != v3)
      {
        if (v2 + 1 >= v3)
        {
LABEL_14:
          __break(1u);
          return result;
        }

        uint64_t v6 = ~v2 + v3;
        uint64_t v7 = (char *)(v4 + v5);
        while (1)
        {
          int v8 = *v7++;
          if (v8 < 0) {
            break;
          }
          if (!--v6) {
            return result;
          }
        }

        __break(1u);
        goto LABEL_12;
      }
    }
  }

  return result;
}

unint64_t _s9SwiftASN10B10UTF8StringVyACs06StaticD0VcfC_0@<X0>( unint64_t a1@<X0>, int64_t a2@<X1>, char a3@<W2>, unint64_t *a4@<X8>)
{
  unint64_t result = sub_18946BB20(a1, a2, a3);
  uint64_t v6 = (2LL * *(void *)(result + 16)) | 1;
  *a4 = result;
  a4[1] = result + 32;
  a4[2] = 0LL;
  a4[3] = v6;
  return result;
}

uint64_t ASN1IA5String.init(derEncoded:withIdentifier:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v4 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  unint64_t v6 = *(void *)(result + 40);
  uint64_t v8 = *(void *)(result + 48);
  uint64_t v9 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result != *(void *)a2 || *(unsigned __int8 *)(result + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31LL, 2, 26LL, v13);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }

  if (!*(_BYTE *)(result + 56)) {
    goto LABEL_20;
  }
  uint64_t v10 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v10, v4, v7, v6, v8, 1LL);
  unint64_t result = swift_unknownObjectRelease();
  int64_t v11 = v6 >> 1;
  if (v7 == v6 >> 1) {
    goto LABEL_14;
  }
  if (v7 >= (uint64_t)(v6 >> 1))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  if (*(char *)(v4 + v7) < 0)
  {
LABEL_16:
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidStringRepresentation(reason:file:line:)( 0xD00000000000001FLL,  0x80000001894761B0LL,  (uint64_t)"SwiftASN1/ASN1Strings.swift",  27LL,  2,  313LL,  v14);
    swift_willThrow();
    return j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1LL);
  }

  if (v7 + 1 == v11) {
    goto LABEL_14;
  }
  if (v7 + 1 < v11)
  {
    if ((*(char *)(v4 + v7 + 1) & 0x80000000) == 0)
    {
      uint64_t v12 = v7 + 2;
      if (v7 + 2 != v11)
      {
        while (v12 < v11)
        {
          if (v11 == ++v12) {
            goto LABEL_14;
          }
        }

        __break(1u);
        goto LABEL_18;
      }

uint64_t ASN1IA5String.init(contentBytes:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  int64_t v5 = a4 >> 1;
  if (a4 >> 1 == a3) {
    goto LABEL_11;
  }
  if ((uint64_t)(a4 >> 1) <= a3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  if (a3 + 1 == v5) {
    goto LABEL_11;
  }
  if (a3 + 1 < v5)
  {
    if ((*(char *)(a2 + a3 + 1) & 0x80000000) == 0)
    {
      uint64_t v6 = a3 + 2;
      if (a3 + 2 != v5)
      {
        while (v6 < v5)
        {
          if (v5 == ++v6) {
            goto LABEL_11;
          }
        }

        __break(1u);
        goto LABEL_14;
      }

uint64_t ASN1IA5String.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_18945ED84);
}

uint64_t ASN1IA5String.withUnsafeBytes<A>(_:)()
{
  return sub_18946CB28();
}

uint64_t sub_18946CB28()
{
  return sub_189473950();
}

uint64_t _s9SwiftASN10B10UTF8StringV4hash4intoys6HasherVz_tF_0()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3] >> 1;
  uint64_t result = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v4 = v0[1];
  uint64_t result = sub_189473A58();
  BOOL v5 = __OFSUB__(v2, v1);
  uint64_t v6 = v2 - v1;
  if (!v6) {
    return result;
  }
  if ((v6 < 0) ^ v5 | (v6 == 0))
  {
LABEL_8:
    __break(1u);
    return result;
  }

  uint64_t v7 = v4 + v1;
  do
  {
    ++v7;
    uint64_t result = sub_189473A64();
    --v6;
  }

  while (v6);
  return result;
}

uint64_t _s9SwiftASN10B10UTF8StringV9hashValueSivg_0()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_189473A4C();
  unint64_t v4 = v3 >> 1;
  uint64_t result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }

  else
  {
    uint64_t result = sub_189473A58();
    BOOL v6 = __OFSUB__(v4, v2);
    uint64_t v7 = v4 - v2;
    if (!v7) {
      return sub_189473A7C();
    }
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      uint64_t v8 = v1 + v2;
      do
      {
        ++v8;
        sub_189473A64();
        --v7;
      }

      while (v7);
      return sub_189473A7C();
    }
  }

  __break(1u);
  return result;
}

void sub_18946CC48(uint64_t a1@<X8>)
{
  *(void *)a1 = 22LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_18946CC58(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_18946BD88( a1,  a2,  a3,  a4,  (uint64_t (*)(uint64_t, uint64_t *))ASN1IA5String.init(derEncoded:withIdentifier:));
}

uint64_t ASN1IA5String.init(stringLiteral:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_18946CC80(a1, a2, (uint64_t (*)(uint64_t, void, uint64_t))sub_18946D328, a3);
}

uint64_t sub_18946CC80@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t (*a3)(uint64_t, void, uint64_t)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6 = sub_18946D05C(a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v7 = (2LL * *(void *)(v6 + 16)) | 1;
  uint64_t result = a3(v6 + 32, 0LL, v7);
  if ((result & 1) != 0)
  {
    *a4 = v6;
    a4[1] = v6 + 32;
    a4[2] = 0LL;
    a4[3] = v7;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t ASN1IA5String.init(_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_18946CD2C( a1,  a2,  (uint64_t (*)(uint64_t, void, uint64_t))sub_18946D328,  0xD00000000000001FLL,  0x80000001894761B0LL,  354LL,  a3);
}

uint64_t sub_18946CD2C@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t (*a3)(uint64_t, void, uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v12 = sub_18946D05C(a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v13 = (2LL * *(void *)(v12 + 16)) | 1;
  uint64_t result = a3(v12 + 32, 0LL, v13);
  if ((result & 1) != 0)
  {
    *a7 = v12;
    a7[1] = v12 + 32;
    a7[2] = 0LL;
    a7[3] = v13;
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.invalidStringRepresentation(reason:file:line:)( a4,  a5,  (uint64_t)"SwiftASN1/ASN1Strings.swift",  27LL,  2,  a6,  v15);
    swift_willThrow();
    return swift_release();
  }

  return result;
}

uint64_t sub_18946CE18@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_18946CE24(a1, (uint64_t (*)(uint64_t, void, uint64_t))sub_18946D328, a2);
}

uint64_t sub_18946CE24@<X0>( uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, void, uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v5 = sub_18946D05C(*(void *)a1, *(void *)(a1 + 8));
  swift_bridgeObjectRelease();
  uint64_t v6 = (2LL * *(void *)(v5 + 16)) | 1;
  uint64_t result = a2(v5 + 32, 0LL, v6);
  if ((result & 1) != 0)
  {
    *a3 = v5;
    a3[1] = v5 + 32;
    a3[2] = 0LL;
    a3[3] = v6;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t _sSS9SwiftASN1EySSAA0B10UTF8StringVcfC_0(uint64_t result)
{
  if (__OFSUB__(*(void *)(result + 24) >> 1, *(void *)(result + 16)))
  {
    __break(1u);
  }

  else
  {
    uint64_t v1 = sub_189473788();
    swift_unknownObjectRelease();
    return v1;
  }

  return result;
}

void *sub_18946CF04(unsigned int a1)
{
  if (a1 > 0x7F)
  {
    int v4 = (a1 & 0x3F) << 8;
    if (a1 >= 0x800)
    {
      int v5 = (v4 | (a1 >> 6) & 0x3F) << 8;
      int v6 = (((v5 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
      unsigned int v1 = (v5 | (a1 >> 12)) + 8487393;
      if (HIWORD(a1)) {
        unsigned int v1 = v6;
      }
    }

    else
    {
      unsigned int v1 = (v4 | (a1 >> 6)) + 33217;
    }
  }

  else
  {
    unsigned int v1 = a1 + 1;
  }

  unsigned int v2 = __clz(v1);
  uint64_t v7 = (v1 + 0xFEFEFEFEFEFEFFLL) & ~(-1LL << (8 * (4 - (v2 >> 3))));
  return sub_18946CFD0(&v7, 4 - (v2 >> 3));
}

void *sub_18946CFD0(const void *a1, int64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x18961AFE8];
  }
  if (a2 <= 0)
  {
    int v4 = (void *)MEMORY[0x18961AFE8];
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C5058C8);
    int v4 = (void *)swift_allocObject();
    size_t v5 = _swift_stdlib_malloc_size(v4);
    _OWORD v4[2] = a2;
    v4[3] = 2 * v5 - 64;
  }

  memcpy(v4 + 4, a1, a2);
  return v4;
}

uint64_t sub_18946D05C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_9;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_18946D0F4(v2, 0LL);
      uint64_t result = sub_189473968();
      if ((v5 & 1) != 0) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_1894737A0();
      if (!v2) {
        return MEMORY[0x18961AFE8];
      }
    }

    __break(1u);
  }

  else
  {
    return MEMORY[0x18961AFE8];
  }

  return result;
}

void *sub_18946D0F4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C5058C8);
  int v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_18946D158(uint64_t result, uint64_t a2, unint64_t a3)
{
  int64_t v3 = a3 >> 1;
  if (a3 >> 1 == a2) {
    return 1LL;
  }
  while (a2 < v3)
  {
    unsigned int v4 = *(unsigned __int8 *)(result + a2);
    BOOL v5 = (v4 & 0xFFFFFFDF) - 91 > 0xFFFFFFE5 || v4 - 58 > 0xFFFFFFF5;
    if (!v5)
    {
      BOOL v5 = v4 > 0x3F;
      unint64_t v6 = (1LL << v4) & 0xA400FB8100000000LL;
      if (v5 || v6 == 0) {
        return 0LL;
      }
    }

    if (v3 == ++a2) {
      return 1LL;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_18946D1CC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result = swift_unknownObjectRelease();
  *unsigned int v4 = a1;
  v4[1] = a2;
  _OWORD v4[2] = a3;
  v4[3] = a4;
  int64_t v10 = a4 >> 1;
  if (a4 >> 1 != a3)
  {
    while (a3 < v10)
    {
      unsigned int v11 = *(unsigned __int8 *)(a2 + a3);
      BOOL v12 = (v11 & 0xFFFFFFDF) - 91 > 0xFFFFFFE5 || v11 - 58 > 0xFFFFFFF5;
      if (!v12)
      {
        BOOL v12 = v11 > 0x3F;
        unint64_t v13 = (1LL << v11) & 0xA400FB8100000000LL;
        if (v12 || v13 == 0)
        {
          __break(1u);
          break;
        }
      }

      if (v10 == ++a3) {
        return result;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_18946D284(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result = swift_unknownObjectRelease();
  *unsigned int v4 = a1;
  v4[1] = a2;
  _OWORD v4[2] = a3;
  v4[3] = a4;
  int64_t v10 = a4 >> 1;
  if (a4 >> 1 != a3)
  {
    if ((uint64_t)(a4 >> 1) <= a3)
    {
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }

    if (*(char *)(a2 + a3) < 0)
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }

    if (a3 + 1 != v10)
    {
      if (a3 + 1 >= v10)
      {
LABEL_13:
        __break(1u);
        return result;
      }

      uint64_t v11 = ~a3 + v10;
      BOOL v12 = (char *)(a2 + a3 + 1);
      while (1)
      {
        int v13 = *v12++;
        if (v13 < 0) {
          break;
        }
        if (!--v11) {
          return result;
        }
      }

      __break(1u);
      goto LABEL_11;
    }
  }

  return result;
}

uint64_t sub_18946D328(uint64_t result, uint64_t a2, unint64_t a3)
{
  int64_t v3 = a3 >> 1;
  if (a3 >> 1 != a2)
  {
    if ((uint64_t)(a3 >> 1) > a2)
    {
      if (a2 + 1 == v3) {
        return 1LL;
      }
      uint64_t v4 = result + 1;
      while (a2 + 1 < v3)
      {
        int v5 = *(char *)(v4 + a2);
        uint64_t result = v5 >= 0;
        if ((v5 & 0x80000000) == 0 && v3 - 2 != a2++) {
          continue;
        }
        return result;
      }

      __break(1u);
    }

    __break(1u);
    return result;
  }

  return 1LL;
}

unint64_t sub_18946D39C()
{
  unint64_t result = qword_18C797C68;
  if (!qword_18C797C68)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1UTF8String, &type metadata for ASN1UTF8String);
    atomic_store(result, (unint64_t *)&qword_18C797C68);
  }

  return result;
}

unint64_t sub_18946D3E4()
{
  unint64_t result = qword_18C797C70;
  if (!qword_18C797C70)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1UTF8String, &type metadata for ASN1UTF8String);
    atomic_store(result, (unint64_t *)&qword_18C797C70);
  }

  return result;
}

uint64_t sub_18946D428()
{
  return MEMORY[0x189618028];
}

unint64_t sub_18946D438()
{
  unint64_t result = qword_18C797C78;
  if (!qword_18C797C78)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1UTF8String, &type metadata for ASN1UTF8String);
    atomic_store(result, (unint64_t *)&qword_18C797C78);
  }

  return result;
}

uint64_t sub_18946D47C()
{
  return MEMORY[0x189618038];
}

uint64_t sub_18946D488()
{
  return MEMORY[0x189618030];
}

unint64_t sub_18946D498()
{
  unint64_t result = qword_18C797C80;
  if (!qword_18C797C80)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1TeletexString,  &type metadata for ASN1TeletexString);
    atomic_store(result, (unint64_t *)&qword_18C797C80);
  }

  return result;
}

unint64_t sub_18946D4E0()
{
  unint64_t result = qword_18C797C88;
  if (!qword_18C797C88)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1TeletexString,  &type metadata for ASN1TeletexString);
    atomic_store(result, (unint64_t *)&qword_18C797C88);
  }

  return result;
}

unint64_t sub_18946D528()
{
  unint64_t result = qword_18C797C90;
  if (!qword_18C797C90)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1TeletexString,  &type metadata for ASN1TeletexString);
    atomic_store(result, (unint64_t *)&qword_18C797C90);
  }

  return result;
}

unint64_t sub_18946D570()
{
  unint64_t result = qword_18C797C98;
  if (!qword_18C797C98)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1PrintableString,  &type metadata for ASN1PrintableString);
    atomic_store(result, (unint64_t *)&qword_18C797C98);
  }

  return result;
}

unint64_t sub_18946D5B8()
{
  unint64_t result = qword_18C797CA0;
  if (!qword_18C797CA0)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1PrintableString,  &type metadata for ASN1PrintableString);
    atomic_store(result, (unint64_t *)&qword_18C797CA0);
  }

  return result;
}

unint64_t sub_18946D600()
{
  unint64_t result = qword_18C797CA8;
  if (!qword_18C797CA8)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1PrintableString,  &type metadata for ASN1PrintableString);
    atomic_store(result, (unint64_t *)&qword_18C797CA8);
  }

  return result;
}

unint64_t sub_18946D648()
{
  unint64_t result = qword_18C797CB0;
  if (!qword_18C797CB0)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1UniversalString,  &type metadata for ASN1UniversalString);
    atomic_store(result, (unint64_t *)&qword_18C797CB0);
  }

  return result;
}

unint64_t sub_18946D690()
{
  unint64_t result = qword_18C797CB8;
  if (!qword_18C797CB8)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1UniversalString,  &type metadata for ASN1UniversalString);
    atomic_store(result, (unint64_t *)&qword_18C797CB8);
  }

  return result;
}

unint64_t sub_18946D6D8()
{
  unint64_t result = qword_18C797CC0;
  if (!qword_18C797CC0)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1UniversalString,  &type metadata for ASN1UniversalString);
    atomic_store(result, (unint64_t *)&qword_18C797CC0);
  }

  return result;
}

unint64_t sub_18946D720()
{
  unint64_t result = qword_18C797CC8;
  if (!qword_18C797CC8)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1BMPString, &type metadata for ASN1BMPString);
    atomic_store(result, (unint64_t *)&qword_18C797CC8);
  }

  return result;
}

unint64_t sub_18946D768()
{
  unint64_t result = qword_18C797CD0;
  if (!qword_18C797CD0)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1BMPString, &type metadata for ASN1BMPString);
    atomic_store(result, (unint64_t *)&qword_18C797CD0);
  }

  return result;
}

unint64_t sub_18946D7B0()
{
  unint64_t result = qword_18C797CD8;
  if (!qword_18C797CD8)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1BMPString, &type metadata for ASN1BMPString);
    atomic_store(result, (unint64_t *)&qword_18C797CD8);
  }

  return result;
}

unint64_t sub_18946D7F8()
{
  unint64_t result = qword_18C797CE0;
  if (!qword_18C797CE0)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1IA5String, &type metadata for ASN1IA5String);
    atomic_store(result, (unint64_t *)&qword_18C797CE0);
  }

  return result;
}

unint64_t sub_18946D840()
{
  unint64_t result = qword_18C797CE8;
  if (!qword_18C797CE8)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1IA5String, &type metadata for ASN1IA5String);
    atomic_store(result, (unint64_t *)&qword_18C797CE8);
  }

  return result;
}

unint64_t sub_18946D888()
{
  unint64_t result = qword_18C797CF0;
  if (!qword_18C797CF0)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1IA5String, &type metadata for ASN1IA5String);
    atomic_store(result, (unint64_t *)&qword_18C797CF0);
  }

  return result;
}

uint64_t sub_18946D8D0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_18946C68C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_18946D1CC);
}

uint64_t keypath_getTm@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return swift_unknownObjectRetain();
}

uint64_t sub_18946D900(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_18946C68C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_18946D284);
}

uint64_t dispatch thunk of ASN1String.bytes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ASN1String.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

ValueMetadata *type metadata accessor for ASN1UTF8String()
{
  return &type metadata for ASN1UTF8String;
}

ValueMetadata *type metadata accessor for ASN1TeletexString()
{
  return &type metadata for ASN1TeletexString;
}

ValueMetadata *type metadata accessor for ASN1PrintableString()
{
  return &type metadata for ASN1PrintableString;
}

ValueMetadata *type metadata accessor for ASN1UniversalString()
{
  return &type metadata for ASN1UniversalString;
}

ValueMetadata *type metadata accessor for ASN1BMPString()
{
  return &type metadata for ASN1BMPString;
}

ValueMetadata *type metadata accessor for ASN1IA5String()
{
  return &type metadata for ASN1IA5String;
}

uint64_t ASN1OctetString.init(derEncoded:withIdentifier:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v4 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  uint64_t v6 = *(void *)(result + 40);
  uint64_t v8 = *(void *)(result + 48);
  uint64_t v9 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result == *(void *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(_BYTE *)(result + 56))
    {
      uint64_t v10 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v10, v4, v7, v6, v8, 1LL);
      unint64_t result = swift_unknownObjectRelease();
      *a3 = v5;
      a3[1] = v4;
      a3[2] = v7;
      a3[3] = v6;
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31LL, 2, 26LL, v11);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }

  return result;
}

uint64_t ASN1OctetString.init(contentBytes:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t ASN1OctetString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_18946DDF8);
}

void static ASN1OctetString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 4LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t ASN1OctetString.bytes.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t ASN1OctetString.bytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = swift_unknownObjectRelease();
  *uint64_t v4 = a1;
  v4[1] = a2;
  _OWORD v4[2] = a3;
  v4[3] = a4;
  return result;
}

uint64_t (*ASN1OctetString.bytes.modify())()
{
  return nullsub_1;
}

uint64_t sub_18946DBC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return swift_unknownObjectRelease();
}

void sub_18946DC34(uint64_t a1@<X8>)
{
  *(void *)a1 = 4LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_18946DC44@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  char v3 = *((_BYTE *)a2 + 8);
  uint64_t v5 = *a2;
  char v6 = v3;
  return ASN1OctetString.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v5, a3);
}

uint64_t sub_18946DC74(char **a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_18945C5BC(&v4, 0, a1, (uint64_t (*)(char **))sub_18946DDF8);
}

uint64_t ASN1OctetString.hash(into:)()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3] >> 1;
  uint64_t result = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v4 = v0[1];
  uint64_t result = sub_189473A58();
  BOOL v5 = __OFSUB__(v2, v1);
  uint64_t v6 = v2 - v1;
  if (!v6) {
    return result;
  }
  if ((v6 < 0) ^ v5 | (v6 == 0))
  {
LABEL_8:
    __break(1u);
    return result;
  }

  uint64_t v7 = v4 + v1;
  do
  {
    ++v7;
    uint64_t result = sub_189473A64();
    --v6;
  }

  while (v6);
  return result;
}

uint64_t static ASN1OctetString.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_18945B3A4( *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a2 + 8),  *(void *)(a2 + 16),  *(void *)(a2 + 24));
}

uint64_t ASN1OctetString.hashValue.getter()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_189473A4C();
  unint64_t v4 = v3 >> 1;
  uint64_t result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }

  else
  {
    uint64_t result = sub_189473A58();
    BOOL v6 = __OFSUB__(v4, v2);
    uint64_t v7 = v4 - v2;
    if (!v7) {
      return sub_189473A7C();
    }
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      uint64_t v8 = v1 + v2;
      do
      {
        ++v8;
        sub_189473A64();
        --v7;
      }

      while (v7);
      return sub_189473A7C();
    }
  }

  __break(1u);
  return result;
}

uint64_t ASN1OctetString.withUnsafeBytes<A>(_:)()
{
  return sub_189473950();
}

uint64_t sub_18946DDF8()
{
  return sub_18946DE64();
}

unint64_t sub_18946DE10()
{
  unint64_t result = qword_18C5058E8;
  if (!qword_18C5058E8)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1OctetString,  &type metadata for ASN1OctetString);
    atomic_store(result, (unint64_t *)&qword_18C5058E8);
  }

  return result;
}

ValueMetadata *type metadata accessor for ASN1OctetString()
{
  return &type metadata for ASN1OctetString;
}

uint64_t sub_18946DE64()
{
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[4];
  unint64_t v2 = v0[5];
  uint64_t v4 = swift_unknownObjectRetain();
  sub_189469594(v4, v1, v3, v2);
  return swift_unknownObjectRelease();
}

void static UTCTime.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 23LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t UTCTime.year.getter()
{
  return *(void *)v0;
}

uint64_t sub_18946DEDC(void *a1, void *a2)
{
  *a2 = *a1;
  return sub_18946DFD0();
}

uint64_t UTCTime.year.setter(uint64_t a1)
{
  *uint64_t v1 = a1;
  return sub_18946DFD0();
}

uint64_t sub_18946DFD0()
{
  if ((unint64_t)(*v0 - 1950) > 0x63)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v10 = v13;
    uint64_t v8 = 0xD000000000000018LL;
    uint64_t v11 = 0x80000001894761F0LL;
    uint64_t v12 = 143LL;
    goto LABEL_11;
  }

  unint64_t v2 = v0[3];
  unint64_t v1 = v0[4];
  unint64_t v3 = v0[5];
  uint64_t v4 = v0[2];
  uint64_t result = sub_189470800(v0[1], *v0);
  if ((v6 & 1) != 0)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v8 = 0xD000000000000021LL;
    uint64_t v10 = v14;
    uint64_t v11 = 0x8000000189476210LL;
    uint64_t v12 = 148LL;
    goto LABEL_11;
  }

  if (v4 < 1 || result < v4)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v8 = 0xD000000000000020LL;
    uint64_t v10 = v9;
    uint64_t v11 = 0x80000001894762A0LL;
    uint64_t v12 = 152LL;
LABEL_11:
    static ASN1Error.invalidASN1Object(reason:file:line:)( v8,  v11,  (uint64_t)"SwiftASN1/UTCTime.swift",  23LL,  2,  v12,  v10);
    return swift_willThrow();
  }

  if (v2 > 0x17)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v10 = v16;
    uint64_t v8 = 0xD000000000000018LL;
    uint64_t v11 = 0x8000000189476240LL;
    uint64_t v12 = 156LL;
    goto LABEL_11;
  }

  if (v1 > 0x3B)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v8 = 0xD00000000000001ALL;
    uint64_t v10 = v17;
    uint64_t v11 = 0x8000000189476260LL;
    uint64_t v12 = 160LL;
    goto LABEL_11;
  }

  if (v3 > 0x3D)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v8 = 0xD00000000000001BLL;
    uint64_t v10 = v15;
    uint64_t v11 = 0x8000000189476280LL;
    uint64_t v12 = 168LL;
    goto LABEL_11;
  }

  return result;
}

uint64_t (*UTCTime.year.modify(void *a1))(uint64_t a1)
{
  *a1 = *v1;
  a1[1] = v1;
  return sub_18946E288;
}

uint64_t sub_18946E288(uint64_t a1)
{
  **(void **)(a1 + 8) = *(void *)a1;
  return sub_18946DFD0();
}

uint64_t UTCTime.month.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_18946E308(void *a1, uint64_t a2)
{
  *(void *)(a2 + 8) = *a1;
  return sub_18946DFD0();
}

uint64_t UTCTime.month.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
  return sub_18946DFD0();
}

uint64_t (*UTCTime.month.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 8);
  a1[1] = v1;
  return sub_18946E3FC;
}

uint64_t sub_18946E3FC(void *a1)
{
  *(void *)(a1[1] + 8LL) = *a1;
  return sub_18946DFD0();
}

uint64_t UTCTime.day.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_18946E47C(void *a1, uint64_t a2)
{
  *(void *)(a2 + 16) = *a1;
  return sub_18946DFD0();
}

uint64_t UTCTime.day.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_18946DFD0();
}

uint64_t (*UTCTime.day.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 16);
  a1[1] = v1;
  return sub_18946E588;
}

uint64_t sub_18946E588(void *a1)
{
  *(void *)(a1[1] + 16LL) = *a1;
  return sub_18946DFD0();
}

uint64_t UTCTime.hours.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_18946E608(void *a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *a1;
  return sub_18946DFD0();
}

uint64_t UTCTime.hours.setter(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return sub_18946DFD0();
}

uint64_t (*UTCTime.hours.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 24);
  a1[1] = v1;
  return sub_18946E70C;
}

uint64_t sub_18946E70C(void *a1)
{
  *(void *)(a1[1] + 24LL) = *a1;
  return sub_18946DFD0();
}

uint64_t UTCTime.minutes.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t sub_18946E78C(void *a1, uint64_t a2)
{
  *(void *)(a2 + 32) = *a1;
  return sub_18946DFD0();
}

uint64_t UTCTime.minutes.setter(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return sub_18946DFD0();
}

uint64_t (*UTCTime.minutes.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 32);
  a1[1] = v1;
  return sub_18946E880;
}

uint64_t sub_18946E880(void *a1)
{
  *(void *)(a1[1] + 32LL) = *a1;
  return sub_18946DFD0();
}

uint64_t UTCTime.seconds.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t sub_18946E900(void *a1, uint64_t a2)
{
  *(void *)(a2 + 40) = *a1;
  return sub_18946DFD0();
}

uint64_t UTCTime.seconds.setter(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return sub_18946DFD0();
}

uint64_t (*UTCTime.seconds.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 40);
  a1[1] = v1;
  return sub_18946E9F4;
}

uint64_t sub_18946E9F4(void *a1)
{
  *(void *)(a1[1] + 40LL) = *a1;
  return sub_18946DFD0();
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> UTCTime.init(year:month:day:hours:minutes:seconds:)( SwiftASN1::UTCTime *__return_ptr retstr, Swift::Int year, Swift::Int month, Swift::Int day, Swift::Int hours, Swift::Int minutes, Swift::Int seconds)
{
  if (!v7)
  {
    retstr->_year = year;
    retstr->_month = month;
    retstr->_day = day;
    retstr->_hours = hours;
    retstr->_minutes = minutes;
    retstr->_seconds = seconds;
  }

uint64_t UTCTime.init(derEncoded:withIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v6 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  unint64_t v8 = *(void *)(result + 40);
  uint64_t v9 = *(void *)(result + 48);
  uint64_t v10 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result == *(void *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(_BYTE *)(result + 56))
    {
      uint64_t v11 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v11, v6, v7, v8, v9, 1LL);
      swift_unknownObjectRelease();
      sub_18946F378(v6, v7, v8, (uint64_t *)v15);
      uint64_t result = j__swift_unknownObjectRelease(v5, v6, v7, v8, v9, 1LL);
      if (!v3)
      {
        __int128 v12 = v15[1];
        __int128 v13 = v15[2];
        *a3 = v15[0];
        a3[1] = v12;
        a3[2] = v13;
      }
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/UTCTime.swift", 23LL, 2, 123LL, v14);
    j__swift_unknownObjectRelease(v5, v6, v7, v8, v9, v10);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }

  return result;
}

uint64_t UTCTime.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  __int128 v5 = v2[1];
  __int128 v9 = *v2;
  __int128 v10 = v5;
  __int128 v11 = v2[2];
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_18945C5BC(&v7, 0, a1, (uint64_t (*)(char **))sub_18946F058);
}

uint64_t sub_18946ECB4(uint64_t a1, _OWORD *a2)
{
  __int128 v2 = a2[1];
  v4[0] = *a2;
  v4[1] = v2;
  _OWORD v4[2] = a2[2];
  return sub_18946F674((unint64_t *)v4);
}

uint64_t UTCTime.hash(into:)()
{
  return sub_189473A58();
}

uint64_t UTCTime.hashValue.getter()
{
  return sub_189473A7C();
}

void sub_18946EE0C(uint64_t a1@<X8>)
{
  *(void *)a1 = 23LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_18946EE1C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  char v3 = *((_BYTE *)a2 + 8);
  uint64_t v5 = *a2;
  char v6 = v3;
  return UTCTime.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v5, a3);
}

uint64_t sub_18946EE4C(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  __int128 v5 = v2[1];
  __int128 v9 = *v2;
  __int128 v10 = v5;
  __int128 v11 = v2[2];
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_18945C5BC(&v7, 0, a1, (uint64_t (*)(char **))sub_18946F220);
}

uint64_t sub_18946EEA8()
{
  return sub_189473A7C();
}

uint64_t sub_18946EF48()
{
  return sub_189473A58();
}

uint64_t sub_18946EFB8()
{
  return sub_189473A7C();
}

uint64_t sub_18946F058()
{
  uint64_t v1 = *(_OWORD **)(v0 + 16);
  __int128 v2 = v1[1];
  v4[0] = *v1;
  v4[1] = v2;
  _OWORD v4[2] = v1[2];
  return sub_18946F674((unint64_t *)v4);
}

BOOL _s9SwiftASN17UTCTimeV2eeoiySbAC_ACtFZ_0(int64x2_t *a1, int64x2_t *a2)
{
  BOOL result = 0LL;
  if ((vminv_u16((uint16x4_t)vcltz_s16( vshl_n_s16( vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*a1, *a2), (int32x4_t)vceqq_s64( a1[1],  a2[1]))),  0xFuLL))) & 1) != 0 && a1[2].i64[0] == a2[2].i64[0])
  {
    return a1[2].i64[1] == a2[2].i64[1];
  }

  return result;
}

unint64_t sub_18946F100()
{
  unint64_t result = qword_18C797CF8;
  if (!qword_18C797CF8)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for UTCTime, &type metadata for UTCTime);
    atomic_store(result, (unint64_t *)&qword_18C797CF8);
  }

  return result;
}

void *sub_18946F144@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_18946F154@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 8);
  return result;
}

uint64_t sub_18946F164@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 16);
  return result;
}

uint64_t sub_18946F174@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 24);
  return result;
}

uint64_t sub_18946F184@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 32);
  return result;
}

uint64_t sub_18946F194@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 40);
  return result;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for UTCTime(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for UTCTime(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for UTCTime()
{
  return &type metadata for UTCTime;
}

uint64_t sub_18946F220()
{
  return sub_18946F058();
}

uint64_t static ArraySlice<A>.isSigned.getter()
{
  return 0LL;
}

uint64_t ArraySlice<A>.withBigEndianIntegerBytes<A>(_:)( uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return a1(a3, a4, a5, a6);
}

unint64_t sub_18946F278()
{
  unint64_t result = qword_18C797D00;
  if (!qword_18C797D00)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C797668);
    unint64_t result = MEMORY[0x1895E6DB8](MEMORY[0x189618F98], v1);
    atomic_store(result, (unint64_t *)&qword_18C797D00);
  }

  return result;
}

uint64_t sub_18946F2C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[2] = a3;
  v5[3] = a1;
  v5[4] = a2;
  return ArraySlice<A>.withBigEndianIntegerBytes<A>(_:)(sub_18946F2FC, (uint64_t)v5, *v3, v3[1], v3[2], v3[3]);
}

uint64_t sub_18946F2FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7[3] = a4;
  __int128 v5 = *(uint64_t (**)(void *))(v4 + 24);
  v7[0] = a1;
  v7[1] = a2;
  void v7[2] = a3;
  return v5(v7);
}

uint64_t sub_18946F330()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3] >> 1;
  if (v1 == v2)
  {
    int v3 = 0;
  }

  else
  {
    if (v1 >= v2)
    {
      __break(1u);
      return result;
    }

    int v3 = *(unsigned __int8 *)(v0[1] + v1);
    v0[2] = v1 + 1;
  }

  return v3 | ((v1 == v2) << 8);
}

void sub_18946F378(uint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  if ((v7 & 1) != 0 || (uint64_t v8 = v6, sub_18946FAD0(), (v10 & 1) != 0) || (v11 = v9, sub_18946FAD0(), (v13 & 1) != 0))
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v30 = 0xD00000000000002FLL;
    unint64_t v29 = v25;
    uint64_t v31 = 0x8000000189476440LL;
    uint64_t v32 = 69LL;
    goto LABEL_19;
  }

  uint64_t v14 = v12;
  sub_18946FAD0();
  if ((v16 & 1) != 0 || (uint64_t v17 = v15, sub_18946FAD0(), (v19 & 1) != 0) || (v20 = v18, sub_18946FAD0(), (v22 & 1) != 0))
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v30 = 0xD000000000000035LL;
    unint64_t v29 = v26;
    uint64_t v31 = 0x8000000189476470LL;
    uint64_t v32 = 77LL;
    goto LABEL_19;
  }

  unint64_t v23 = a3 >> 1;
  if (a2 == a3 >> 1) {
    goto LABEL_22;
  }
  if (a2 >= (uint64_t)(a3 >> 1))
  {
    __break(1u);
LABEL_23:
    __break(1u);
    return;
  }

  if (*(_BYTE *)(a1 + a2) != 90)
  {
LABEL_22:
    sub_18945AD44();
    swift_allocError();
    uint64_t v30 = 0xD00000000000001CLL;
    unint64_t v29 = v27;
    uint64_t v31 = 0x80000001894764B0LL;
    uint64_t v32 = 82LL;
    goto LABEL_19;
  }

  if (__OFSUB__(v23, a2 + 1)) {
    goto LABEL_23;
  }
  if (v23 != a2 + 1)
  {
    sub_18945AD44();
    swift_allocError();
    unint64_t v29 = v28;
    uint64_t v30 = 0xD000000000000019LL;
    uint64_t v31 = 0x80000001894764D0LL;
    uint64_t v32 = 87LL;
LABEL_19:
    static ASN1Error.invalidASN1Object(reason:file:line:)( v30,  v31,  (uint64_t)"SwiftASN1/TimeUtilities.swift",  29LL,  2,  v32,  v29);
    swift_unknownObjectRetain();
    swift_willThrow();
    swift_unknownObjectRelease();
    return;
  }

  uint64_t v24 = 1900LL;
  if (v8 < 50) {
    uint64_t v24 = 2000LL;
  }
  uint64_t v37 = v24 + v8;
  uint64_t v33 = v21;
  swift_unknownObjectRetain();
  sub_18946DFD0();
  swift_unknownObjectRelease();
  if (!v4)
  {
    *a4 = v37;
    a4[1] = v11;
    a4[2] = v14;
    a4[3] = v17;
    a4[4] = v20;
    a4[5] = v33;
  }

uint64_t sub_18946F674(unint64_t *a1)
{
  unint64_t v3 = *a1;
  if (*a1 - 2050 < 0xFFFFFFFFFFFFFF9CLL)
  {
    __break(1u);
LABEL_9:
    uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v1 + 16) + 1LL, 1, (char *)v1);
    uint64_t v1 = result;
    goto LABEL_5;
  }

  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v7 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v8 = a1[1];
  uint64_t v9 = -2000LL;
  if (v3 < 0x7D0) {
    uint64_t v9 = -1900LL;
  }
  sub_1894703DC(v3 + v9);
  sub_1894703DC(v8);
  sub_1894703DC(v7);
  sub_1894703DC(v6);
  sub_1894703DC(v5);
  sub_1894703DC(v4);
  uint64_t v1 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  unint64_t v12 = *(void *)(v1 + 16);
  unint64_t v11 = *(void *)(v1 + 24);
  if (v12 >= v11 >> 1)
  {
    uint64_t result = (uint64_t)sub_18945AF98((char *)(v11 > 1), v12 + 1, 1, (char *)v1);
    uint64_t v1 = result;
  }

  *(void *)(v1 + 16) = v12 + 1;
  *(_BYTE *)(v1 + v12 + 32) = 90;
  *uint64_t v2 = v1;
  return result;
}

void sub_18946F770(uint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t a3@<X3>, void *a4@<X8>)
{
  uint64_t v5 = v4;
  sub_18946FAD0();
  if ((v8 & 1) != 0
    || (uint64_t v9 = v7, sub_18946FAD0(), (v11 & 1) != 0)
    || (uint64_t v12 = v10, sub_18946FAD0(), (v14 & 1) != 0)
    || (uint64_t v15 = v13, sub_18946FAD0(), (v17 & 1) != 0))
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v29 = 0xD000000000000037LL;
    uint64_t v31 = v30;
    uint64_t v32 = 0x80000001894762D0LL;
    uint64_t v33 = 24LL;
LABEL_11:
    static ASN1Error.invalidASN1Object(reason:file:line:)( v29,  v32,  (uint64_t)"SwiftASN1/TimeUtilities.swift",  29LL,  2,  v33,  v31);
    swift_unknownObjectRetain();
    swift_willThrow();
    goto LABEL_12;
  }

  uint64_t v18 = v16;
  sub_18946FAD0();
  if ((v20 & 1) != 0 || (uint64_t v21 = v19, sub_18946FAD0(), v44 = v22, (v23 & 1) != 0) || (sub_18946FAD0(), (v25 & 1) != 0))
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v29 = 0xD00000000000003DLL;
    uint64_t v31 = v34;
    uint64_t v32 = 0x8000000189476330LL;
    uint64_t v33 = 33LL;
    goto LABEL_11;
  }

  uint64_t v43 = v24;
  uint64_t v26 = a2;
  int64_t v27 = a3 >> 1;
  if (a2 == a3 >> 1)
  {
    swift_unknownObjectRetain();
    uint64_t v28 = 0LL;
    goto LABEL_20;
  }

  if (a2 >= (uint64_t)(a3 >> 1))
  {
    __break(1u);
    goto LABEL_30;
  }

  int v42 = *(unsigned __int8 *)(a1 + a2);
  swift_unknownObjectRetain();
  uint64_t v28 = 0LL;
  if (v42 == 46)
  {
    sub_18946FB54();
    if (!v5)
    {
      uint64_t v28 = v35;
      uint64_t v26 = a2;
      int64_t v27 = a3 >> 1;
      goto LABEL_20;
    }

void sub_18946FAD0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24) >> 1;
  if (v1 != v2)
  {
    if (v1 < v2)
    {
      *(void *)(v0 + 16) = v1 + 1;
      sub_18946F330();
    }

    else
    {
      __break(1u);
    }
  }

uint64_t sub_18946FB54()
{
  uint64_t result = sub_18946F330();
  if ((result & 0x100) != 0) {
    goto LABEL_32;
  }
  if (result != 46)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    return result;
  }

  int64_t v3 = v0[2];
  unint64_t v2 = v0[3];
  unint64_t v4 = v2 >> 1;
  if (v3 == v2 >> 1) {
    goto LABEL_6;
  }
  uint64_t v5 = v0[1];
  unsigned int v6 = *(unsigned __int8 *)(v5 + v3);
  if (v6 - 58 < 0xFFFFFFF6)
  {
LABEL_6:
    sub_18945AD44();
    swift_allocError();
    char v8 = v7;
    uint64_t v9 = 0xD000000000000024LL;
    uint64_t v10 = 0x80000001894763D0LL;
    uint64_t v11 = 194LL;
LABEL_7:
    static ASN1Error.invalidASN1Object(reason:file:line:)( v9,  v10,  (uint64_t)"SwiftASN1/TimeUtilities.swift",  29LL,  2,  v11,  v8);
    return swift_willThrow();
  }

  uint64_t v12 = 0LL;
  unint64_t v13 = v2 & 0xFFFFFFFFFFFFFFFELL;
  int64_t v14 = v3 + 1;
  uint64_t v15 = 1LL;
  while (1)
  {
    uint64_t v16 = v6 - 48LL;
    if (__OFSUB__(v4, v14 - 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }

    if (v2 >> 1 < v4) {
      goto LABEL_29;
    }
    unint64_t v17 = v2 & 1;
    uint64_t v18 = (unsigned __int128)(v12 * (__int128)10LL) >> 64;
    uint64_t v19 = 10 * v12;
    BOOL v20 = v18 != v19 >> 63;
    uint64_t result = 10 * v15;
    BOOL v21 = __OFADD__(v19, v16);
    uint64_t v12 = v19 + v16;
    char v22 = v21;
    unint64_t v2 = v17 | v13;
    if (v20 || (v22 & 1) != 0)
    {
      v0[2] = v14;
      v0[3] = v2;
      sub_18945AD44();
      swift_allocError();
      uint64_t v9 = 0xD000000000000036LL;
      char v8 = v23;
      uint64_t v10 = 0x8000000189476400LL;
      uint64_t v11 = 185LL;
      goto LABEL_7;
    }

    if (v4 == v14) {
      break;
    }
    unsigned int v6 = *(unsigned __int8 *)(v5 + v14++);
    if (v6 - 58 < 0xFFFFFFF6)
    {
      unint64_t v4 = v14 - 1;
      break;
    }
  }

  v0[2] = v4;
  v0[3] = v2;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v12 + 0x1999999999999998LL, 1) <= 0x1999999999999998uLL) {
    goto LABEL_6;
  }
  return result;
}

uint64_t sub_18946FD64(uint64_t a1)
{
  unint64_t v2 = *(char **)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(double *)(a1 + 48);
  sub_1894701D4(*(void *)a1);
  sub_1894703DC((uint64_t)v2);
  sub_1894703DC(v3);
  sub_1894703DC(v4);
  sub_1894703DC(v5);
  sub_1894703DC(v6);
  if (v7 == 0.0) {
    goto LABEL_46;
  }
  double v8 = v7 * 1.0e18;
  if ((~COERCE__INT64(v7 * 1.0e18) & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_56;
  }

  if (v8 <= -9.22337204e18)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }

  if (v8 < 9.22337204e18)
  {
    unint64_t v9 = (uint64_t)v8;
    if ((uint64_t)v8 < 1)
    {
      unint64_t v2 = (char *)MEMORY[0x18961AFE8];
    }

    else
    {
      unint64_t v2 = sub_18945AF98(0LL, 1LL, 1, MEMORY[0x18961AFE8]);
      unint64_t v10 = *((void *)v2 + 2);
      do
      {
        unint64_t v11 = *((void *)v2 + 3);
        if (v10 >= v11 >> 1) {
          unint64_t v2 = sub_18945AF98((char *)(v11 > 1), v10 + 1, 1, v2);
        }
        *((void *)v2 + 2) = v10 + 1;
        v2[v10++ + 32] = (v9 % 0xA) | 0x30;
        BOOL v12 = v9 > 9;
        v9 /= 0xAuLL;
      }

      while (v12);
    }

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0) {
      goto LABEL_13;
    }
    goto LABEL_58;
  }

LABEL_57:
  __break(1u);
LABEL_58:
  unint64_t v2 = sub_18945AF98(0LL, *((void *)v2 + 2) + 1LL, 1, v2);
LABEL_13:
  unint64_t v14 = *((void *)v2 + 2);
  unint64_t v13 = *((void *)v2 + 3);
  uint64_t v15 = v14 + 1;
  if (v14 >= v13 >> 1) {
    unint64_t v2 = sub_18945AF98((char *)(v13 > 1), v14 + 1, 1, v2);
  }
  uint64_t v16 = v2 + 32;
  *((void *)v2 + 2) = v15;
  v2[v14 + 32] = 46;
  uint64_t v36 = (void *)v1;
  if (v14)
  {
    int64_t v17 = 0LL;
    do
    {
      unint64_t v18 = *((void *)v2 + 2);
      if (v17 >= v18)
      {
LABEL_51:
        __break(1u);
LABEL_52:
        __break(1u);
LABEL_53:
        __break(1u);
        goto LABEL_54;
      }

      if (v14 >= v18) {
        goto LABEL_52;
      }
      char v19 = v16[v17];
      v16[v17] = v16[v14];
      v16[v14] = v19;
      ++v17;
      --v14;
    }

    while (v17 < (uint64_t)v14);
    uint64_t v20 = *((void *)v2 + 2);
    if (v20) {
      goto LABEL_23;
    }
  }

  else
  {
    uint64_t v20 = 1LL;
LABEL_23:
    if (v16[v20 - 1] == 48)
    {
      uint64_t v15 = (uint64_t)v2;
      do
      {
        unint64_t v21 = 0LL;
        char v22 = (char *)MEMORY[0x18961AFE8];
        unint64_t v2 = (char *)MEMORY[0x18961AFE8];
        do
        {
          while (1)
          {
            if (v21 >= *(void *)(v15 + 16))
            {
              __break(1u);
              goto LABEL_51;
            }

            char v23 = *(_BYTE *)(v15 + 32 + v21);
            unint64_t v24 = v21 + 1;
            if (*((void *)v22 + 2)) {
              break;
            }
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v37 = v22;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              unint64_t v1 = (unint64_t)&v37;
              sub_18946AA04(0LL, 1LL, 1);
              char v22 = v37;
            }

            unint64_t v27 = *((void *)v22 + 2);
            unint64_t v26 = *((void *)v22 + 3);
            if (v27 >= v26 >> 1)
            {
              unint64_t v1 = (unint64_t)&v37;
              sub_18946AA04((char *)(v26 > 1), v27 + 1, 1);
              char v22 = v37;
            }

            *((void *)v22 + 2) = v27 + 1;
            v22[v27 + 32] = v23;
            unint64_t v21 = v24;
            if (v20 == v24) {
              goto LABEL_43;
            }
          }

          unint64_t v1 = v22[32];
          char v28 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v38 = v2;
          if ((v28 & 1) == 0)
          {
            sub_18946AA04(0LL, *((void *)v2 + 2) + 1LL, 1);
            unint64_t v2 = v38;
          }

          unint64_t v30 = *((void *)v2 + 2);
          unint64_t v29 = *((void *)v2 + 3);
          unint64_t v31 = v30 + 1;
          if (v30 >= v29 >> 1)
          {
            sub_18946AA04((char *)(v29 > 1), v30 + 1, 1);
            unint64_t v31 = v30 + 1;
            unint64_t v1 = v1;
            unint64_t v2 = v38;
          }

          *((void *)v2 + 2) = v31;
          v2[v30 + 32] = v1;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v22 = sub_1894707EC((uint64_t)v22);
          }
          if (!*((void *)v22 + 2)) {
            goto LABEL_53;
          }
          v22[32] = v23;
        }

        while (v20 - 1 != v21++);
LABEL_43:
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v20 = *((void *)v2 + 2);
        if (!v20) {
          break;
        }
        uint64_t v15 = (uint64_t)v2;
      }

      while (v2[v20 + 31] == 48);
    }
  }

  unint64_t v1 = (unint64_t)v36;
  sub_189466AB0((uint64_t)v2);
LABEL_46:
  uint64_t v15 = *(void *)v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
LABEL_54:
    uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v15 + 16) + 1LL, 1, (char *)v15);
    uint64_t v15 = result;
  }

  unint64_t v35 = *(void *)(v15 + 16);
  unint64_t v34 = *(void *)(v15 + 24);
  if (v35 >= v34 >> 1)
  {
    uint64_t result = (uint64_t)sub_18945AF98((char *)(v34 > 1), v35 + 1, 1, (char *)v15);
    uint64_t v15 = result;
  }

  *(void *)(v15 + 16) = v35 + 1;
  *(_BYTE *)(v15 + v35 + 32) = 90;
  *(void *)unint64_t v1 = v15;
  return result;
}

uint64_t sub_1894701D4(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v3 + 16) + 1LL, 1, (char *)v3);
    uint64_t v3 = result;
  }

  unint64_t v6 = *(void *)(v3 + 16);
  unint64_t v5 = *(void *)(v3 + 24);
  int64_t v7 = v5 >> 1;
  unint64_t v8 = v6 + 1;
  if (v5 >> 1 <= v6)
  {
    uint64_t result = (uint64_t)sub_18945AF98((char *)(v5 > 1), v6 + 1, 1, (char *)v3);
    uint64_t v3 = result;
    unint64_t v5 = *(void *)(result + 24);
    int64_t v7 = v5 >> 1;
  }

  uint64_t v9 = (unsigned __int128)(a1 / 1000 * (__int128)0x6666666666666667LL) >> 64;
  *(void *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + v6 + 32) = a1 / 1000 - 10 * ((v9 < 0) + (v9 >> 2)) + 48;
  unint64_t v10 = v6 + 2;
  if (v7 < (uint64_t)(v6 + 2))
  {
    uint64_t result = (uint64_t)sub_18945AF98((char *)(v5 > 1), v6 + 2, 1, (char *)v3);
    uint64_t v3 = result;
    unint64_t v5 = *(void *)(result + 24);
    int64_t v7 = v5 >> 1;
  }

  uint64_t v11 = (unsigned __int128)(a1 / 100 * (__int128)0x6666666666666667LL) >> 64;
  *(void *)(v3 + 16) = v10;
  *(_BYTE *)(v3 + v8 + 32) = a1 / 100 - 10 * ((v11 < 0) + (v11 >> 2)) + 48;
  unint64_t v12 = v6 + 3;
  if (v7 < (uint64_t)(v6 + 3))
  {
    uint64_t result = (uint64_t)sub_18945AF98((char *)(v5 > 1), v6 + 3, 1, (char *)v3);
    uint64_t v3 = result;
    unint64_t v5 = *(void *)(result + 24);
    int64_t v7 = v5 >> 1;
  }

  uint64_t v13 = (unsigned __int128)(a1 / 10 * (__int128)0x6666666666666667LL) >> 64;
  *(void *)(v3 + 16) = v12;
  *(_BYTE *)(v3 + v10 + 32) = a1 / 10 - 10 * ((v13 < 0) + (v13 >> 2)) + 48;
  if (v7 < (uint64_t)(v6 + 4))
  {
    uint64_t result = (uint64_t)sub_18945AF98((char *)(v5 > 1), v6 + 4, 1, (char *)v3);
    uint64_t v3 = result;
  }

  *(void *)(v3 + 16) = v6 + 4;
  *(_BYTE *)(v3 + v12 + 32) = a1 % 10 + 48;
  *unint64_t v1 = v3;
  return result;
}

uint64_t sub_1894703DC(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v3 + 16) + 1LL, 1, (char *)v3);
    uint64_t v3 = result;
  }

  unint64_t v6 = *(void *)(v3 + 16);
  unint64_t v5 = *(void *)(v3 + 24);
  int64_t v7 = v5 >> 1;
  unint64_t v8 = v6 + 1;
  if (v5 >> 1 <= v6)
  {
    uint64_t result = (uint64_t)sub_18945AF98((char *)(v5 > 1), v6 + 1, 1, (char *)v3);
    uint64_t v3 = result;
    unint64_t v5 = *(void *)(result + 24);
    int64_t v7 = v5 >> 1;
  }

  uint64_t v9 = (unsigned __int128)(a1 / 10 * (__int128)0x6666666666666667LL) >> 64;
  *(void *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + v6 + 32) = a1 / 10 - 10 * ((v9 < 0) + (v9 >> 2)) + 48;
  int64_t v10 = v6 + 2;
  if (v7 < v10)
  {
    uint64_t result = (uint64_t)sub_18945AF98((char *)(v5 > 1), v10, 1, (char *)v3);
    uint64_t v3 = result;
  }

  *(void *)(v3 + 16) = v10;
  *(_BYTE *)(v3 + v8 + 32) = a1 % 10 + 48;
  *unint64_t v1 = v3;
  return result;
}

char *sub_1894704F8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C5058F0);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }

  else
  {
    int64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy();
  }

  swift_release();
  return v10;
}

char *sub_1894705F8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C5058C0);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }

  else
  {
    int64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, 16 * v8);
  }

  swift_release();
  return v10;
}

char *sub_1894706F0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
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

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C5058C8);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }

  else
  {
    int64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v12, v13, v8);
  }

  swift_release();
  return v10;
}

char *sub_1894707D8(uint64_t a1)
{
  return sub_1894705F8(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_1894707EC(uint64_t a1)
{
  return sub_1894706F0(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_189470800(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 - 1;
  uint64_t result = 31LL;
  switch(v2)
  {
    case 0LL:
    case 2LL:
    case 4LL:
    case 6LL:
    case 7LL:
    case 9LL:
    case 11LL:
      return result;
    case 1LL:
      if ((a2 & 3) == 0
        && (__ROR8__(0x8F5C28F5C28F5C29LL * a2 + 0x51EB851EB851EB8LL, 2) <= 0x28F5C28F5C28F5CuLL
          ? (BOOL v4 = a2 % 400 == 0)
          : (BOOL v4 = 1),
            v4))
      {
        uint64_t result = 29LL;
      }

      else
      {
        uint64_t result = 28LL;
      }

      break;
    case 3LL:
    case 5LL:
    case 8LL:
    case 10LL:
      uint64_t result = 30LL;
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> GeneralizedTime.init(year:month:day:hours:minutes:seconds:fractionalSeconds:)( SwiftASN1::GeneralizedTime *__return_ptr retstr, Swift::Int year, Swift::Int month, Swift::Int day, Swift::Int hours, Swift::Int minutes, Swift::Int seconds, Swift::Double fractionalSeconds)
{
  if (!v8)
  {
    retstr->_year = year;
    retstr->_month = month;
    retstr->_day = day;
    retstr->_hours = hours;
    retstr->_minutes = minutes;
    retstr->_seconds = seconds;
    retstr->_fractionalSeconds = fractionalSeconds;
  }

uint64_t GeneralizedTime.year.getter()
{
  return *(void *)v0;
}

uint64_t GeneralizedTime.month.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t GeneralizedTime.day.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t GeneralizedTime.hours.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t GeneralizedTime.minutes.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t GeneralizedTime.seconds.getter()
{
  return *(void *)(v0 + 40);
}

double GeneralizedTime.fractionalSeconds.getter()
{
  return *(double *)(v0 + 48);
}

void static GeneralizedTime.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 24LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_1894709AC(void *a1, void *a2)
{
  *a2 = *a1;
  return sub_189470AA8();
}

uint64_t GeneralizedTime.year.setter(uint64_t a1)
{
  *unint64_t v1 = a1;
  return sub_189470AA8();
}

uint64_t sub_189470AA8()
{
  if (*(void *)v0 >> 4 > 0x270uLL)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v2 = v1;
    uint64_t v3 = 0xD000000000000020LL;
    uint64_t v4 = 0x8000000189476620LL;
    uint64_t v5 = 153LL;
LABEL_11:
    static ASN1Error.invalidASN1Object(reason:file:line:)( v3,  v4,  (uint64_t)"SwiftASN1/GeneralizedTime.swift",  31LL,  2,  v5,  v2);
    return swift_willThrow();
  }

  unint64_t v7 = *(void *)(v0 + 24);
  unint64_t v6 = *(void *)(v0 + 32);
  unint64_t v8 = *(void *)(v0 + 40);
  double v9 = *(double *)(v0 + 48);
  uint64_t v10 = *(void *)(v0 + 16);
  uint64_t result = sub_189470800(*(void *)(v0 + 8), *(void *)v0);
  if ((v12 & 1) != 0)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v3 = 0xD000000000000029LL;
    uint64_t v2 = v15;
    uint64_t v4 = 0x8000000189476510LL;
    uint64_t v5 = 158LL;
    goto LABEL_11;
  }

  if (v10 < 1 || result < v10)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v3 = 0xD000000000000028LL;
    uint64_t v2 = v14;
    uint64_t v4 = 0x80000001894765F0LL;
    uint64_t v5 = 162LL;
    goto LABEL_11;
  }

  if (v7 > 0x17)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v2 = v17;
    uint64_t v3 = 0xD000000000000020LL;
    uint64_t v4 = 0x8000000189476540LL;
    uint64_t v5 = 166LL;
    goto LABEL_11;
  }

  if (v6 > 0x3B)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v3 = 0xD000000000000022LL;
    uint64_t v2 = v18;
    uint64_t v4 = 0x8000000189476570LL;
    uint64_t v5 = 170LL;
    goto LABEL_11;
  }

  if (v8 > 0x3D)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v3 = 0xD00000000000001FLL;
    uint64_t v2 = v16;
    uint64_t v4 = 0x80000001894765D0LL;
    uint64_t v5 = 178LL;
    goto LABEL_11;
  }

  if (v9 < 0.0 || v9 >= 1.0)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v3 = 0xD00000000000002ELL;
    uint64_t v2 = v19;
    uint64_t v4 = 0x80000001894765A0LL;
    uint64_t v5 = 183LL;
    goto LABEL_11;
  }

  return result;
}

uint64_t (*GeneralizedTime.year.modify(void *a1))(uint64_t a1)
{
  *a1 = *v1;
  a1[1] = v1;
  return sub_189470DE0;
}

uint64_t sub_189470DE0(uint64_t a1)
{
  **(void **)(a1 + 8) = *(void *)a1;
  return sub_189470AA8();
}

uint64_t sub_189470E60(void *a1, uint64_t a2)
{
  *(void *)(a2 + 8) = *a1;
  return sub_189470AA8();
}

uint64_t GeneralizedTime.month.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
  return sub_189470AA8();
}

uint64_t (*GeneralizedTime.month.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 8);
  a1[1] = v1;
  return sub_189470F6C;
}

uint64_t sub_189470F6C(void *a1)
{
  *(void *)(a1[1] + 8LL) = *a1;
  return sub_189470AA8();
}

uint64_t sub_189470FEC(void *a1, uint64_t a2)
{
  *(void *)(a2 + 16) = *a1;
  return sub_189470AA8();
}

uint64_t GeneralizedTime.day.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_189470AA8();
}

uint64_t (*GeneralizedTime.day.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 16);
  a1[1] = v1;
  return sub_189471108;
}

uint64_t sub_189471108(void *a1)
{
  *(void *)(a1[1] + 16LL) = *a1;
  return sub_189470AA8();
}

uint64_t sub_189471188(void *a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *a1;
  return sub_189470AA8();
}

uint64_t GeneralizedTime.hours.setter(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return sub_189470AA8();
}

uint64_t (*GeneralizedTime.hours.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 24);
  a1[1] = v1;
  return sub_18947129C;
}

uint64_t sub_18947129C(void *a1)
{
  *(void *)(a1[1] + 24LL) = *a1;
  return sub_189470AA8();
}

uint64_t sub_18947131C(void *a1, uint64_t a2)
{
  *(void *)(a2 + 32) = *a1;
  return sub_189470AA8();
}

uint64_t GeneralizedTime.minutes.setter(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return sub_189470AA8();
}

uint64_t (*GeneralizedTime.minutes.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 32);
  a1[1] = v1;
  return sub_189471420;
}

uint64_t sub_189471420(void *a1)
{
  *(void *)(a1[1] + 32LL) = *a1;
  return sub_189470AA8();
}

uint64_t sub_1894714A0(void *a1, uint64_t a2)
{
  *(void *)(a2 + 40) = *a1;
  return sub_189470AA8();
}

uint64_t GeneralizedTime.seconds.setter(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return sub_189470AA8();
}

uint64_t (*GeneralizedTime.seconds.modify(void *a1))(void *a1)
{
  *a1 = *(void *)(v1 + 40);
  a1[1] = v1;
  return sub_1894715A4;
}

uint64_t sub_1894715A4(void *a1)
{
  *(void *)(a1[1] + 40LL) = *a1;
  return sub_189470AA8();
}

uint64_t sub_189471624(void *a1, uint64_t a2)
{
  *(void *)(a2 + 48) = *a1;
  return sub_189470AA8();
}

uint64_t GeneralizedTime.fractionalSeconds.setter(double a1)
{
  *(double *)(v1 + 48) = a1;
  return sub_189470AA8();
}

uint64_t (*GeneralizedTime.fractionalSeconds.modify(void *a1))(void *a1)
{
  a1[1] = v1;
  *a1 = *(void *)(v1 + 48);
  return sub_189471724;
}

uint64_t sub_189471724(void *a1)
{
  *(void *)(a1[1] + 48LL) = *a1;
  return sub_189470AA8();
}

uint64_t GeneralizedTime.init(derEncoded:withIdentifier:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(result + 16);
  uint64_t v6 = *(void *)(result + 24);
  uint64_t v7 = *(void *)(result + 32);
  unint64_t v8 = *(void *)(result + 40);
  uint64_t v9 = *(void *)(result + 48);
  uint64_t v10 = *(unsigned __int8 *)(result + 56);
  if (*(void *)result == *(void *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(_BYTE *)(result + 56))
    {
      uint64_t v11 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v11, v6, v7, v8, v9, 1LL);
      swift_unknownObjectRelease();
      sub_18946F770(v6, v7, v8, v16);
      uint64_t result = j__swift_unknownObjectRelease(v5, v6, v7, v8, v9, 1LL);
      if (!v3)
      {
        uint64_t v12 = v17;
        __int128 v13 = v16[1];
        __int128 v14 = v16[2];
        *(_OWORD *)a3 = v16[0];
        *(_OWORD *)(a3 + 16) = v13;
        *(_OWORD *)(a3 + 32) = v14;
        *(void *)(a3 + 48) = v12;
      }
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/GeneralizedTime.swift", 31LL, 2, 134LL, v15);
    j__swift_unknownObjectRelease(v5, v6, v7, v8, v9, v10);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }

  return result;
}

uint64_t GeneralizedTime.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  __int128 v5 = v2[1];
  __int128 v9 = *v2;
  __int128 v10 = v5;
  __int128 v11 = v2[2];
  uint64_t v12 = *((void *)v2 + 6);
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_18945C5BC(&v7, 0, a1, (uint64_t (*)(char **))sub_189471C68);
}

uint64_t sub_189471984(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a2 + 16);
  v4[0] = *(_OWORD *)a2;
  v4[1] = v2;
  _OWORD v4[2] = *(_OWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  return sub_18946FD64((uint64_t)v4);
}

uint64_t GeneralizedTime.hash(into:)()
{
  return sub_189473A70();
}

uint64_t GeneralizedTime.hashValue.getter()
{
  return sub_189473A7C();
}

void sub_189471B08(uint64_t a1@<X8>)
{
  *(void *)a1 = 24LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_189471B18@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  char v3 = *((_BYTE *)a2 + 8);
  uint64_t v5 = *a2;
  char v6 = v3;
  return GeneralizedTime.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v5, a3);
}

uint64_t sub_189471B48(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  __int128 v5 = v2[1];
  __int128 v9 = *v2;
  __int128 v10 = v5;
  __int128 v11 = v2[2];
  uint64_t v12 = *((void *)v2 + 6);
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_18945C5BC(&v7, 0, a1, (uint64_t (*)(char **))sub_189471E64);
}

uint64_t sub_189471BB4()
{
  return sub_189473A7C();
}

uint64_t sub_189471C68()
{
  uint64_t v1 = *(void *)(v0 + 16);
  __int128 v2 = *(_OWORD *)(v1 + 16);
  v4[0] = *(_OWORD *)v1;
  v4[1] = v2;
  _OWORD v4[2] = *(_OWORD *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 48);
  return sub_18946FD64((uint64_t)v4);
}

BOOL _s9SwiftASN115GeneralizedTimeV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  BOOL result = 0LL;
  if ((vminv_u16((uint16x4_t)vcltz_s16( vshl_n_s16( vmovn_s32( vuzp1q_s32( (int32x4_t)vceqq_s64(*(int64x2_t *)a1, *(int64x2_t *)a2),  (int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 16), *(int64x2_t *)(a2 + 16)))),  0xFuLL))) & 1) != 0 && *(void *)(a1 + 32) == *(void *)(a2 + 32)
    && *(void *)(a1 + 40) == *(void *)(a2 + 40))
  {
    return *(double *)(a1 + 48) == *(double *)(a2 + 48);
  }

  return result;
}

unint64_t sub_189471D2C()
{
  unint64_t result = qword_18C797D40;
  if (!qword_18C797D40)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for GeneralizedTime,  &type metadata for GeneralizedTime);
    atomic_store(result, (unint64_t *)&qword_18C797D40);
  }

  return result;
}

void *sub_189471D70@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_189471D80@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 8);
  return result;
}

uint64_t sub_189471D90@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 16);
  return result;
}

uint64_t sub_189471DA0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 24);
  return result;
}

uint64_t sub_189471DB0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 32);
  return result;
}

uint64_t sub_189471DC0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 40);
  return result;
}

double sub_189471DD0@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result = *(double *)(a1 + 48);
  *a2 = result;
  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for GeneralizedTime(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for GeneralizedTime(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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

  *(_BYTE *)(result + 56) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GeneralizedTime()
{
  return &type metadata for GeneralizedTime;
}

uint64_t sub_189471E64()
{
  return sub_189471C68();
}

void static ASN1Null.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 5LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t ASN1Null.init(derEncoded:withIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  if (*(void *)a1 == *(void *)a2
    && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8)
    && *(_BYTE *)(a1 + 56))
  {
    uint64_t v8 = swift_unknownObjectRetain();
    j__swift_unknownObjectRelease(v8, v2, v5, v4, v6, 1LL);
    uint64_t result = swift_unknownObjectRelease();
    if (__OFSUB__(v4 >> 1, v5))
    {
      __break(1u);
    }

    else
    {
      if (v4 >> 1 != v5)
      {
        sub_18945AD44();
        swift_allocError();
        static ASN1Error.invalidASN1Object(reason:file:line:)( 0xD000000000000026LL,  0x8000000189476670LL,  (uint64_t)"SwiftASN1/ASN1Null.swift",  24LL,  2,  30LL,  v10);
        swift_willThrow();
      }

      return j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1LL);
    }
  }

  else
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Null.swift", 24LL, 2, 26LL, v11);
    j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, v7);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }

  return result;
}

uint64_t ASN1Null.serialize(into:withIdentifier:)(uint64_t *a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_189457A44(&v4, 0, a1);
}

uint64_t static ASN1Null.== infix(_:_:)()
{
  return 1LL;
}

uint64_t ASN1Null.hashValue.getter()
{
  return sub_189473A7C();
}

void sub_1894720A8(uint64_t a1@<X8>)
{
  *(void *)a1 = 5LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_1894720B8(uint64_t a1, uint64_t *a2)
{
  char v2 = *((_BYTE *)a2 + 8);
  uint64_t v4 = *a2;
  char v5 = v2;
  return ASN1Null.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v4);
}

uint64_t sub_1894720E8(uint64_t *a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  char v5 = v2;
  return sub_189457A44(&v4, 0, a1);
}

uint64_t sub_189472120()
{
  return sub_189473A7C();
}

uint64_t sub_189472154()
{
  return sub_189473A7C();
}

unint64_t sub_189472188()
{
  unint64_t result = qword_18C797D48;
  if (!qword_18C797D48)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1Null, &type metadata for ASN1Null);
    atomic_store(result, (unint64_t *)&qword_18C797D48);
  }

  return result;
}

ValueMetadata *type metadata accessor for ASN1Null()
{
  return &type metadata for ASN1Null;
}

void static ASN1BitString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 3LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t ASN1BitString.bytes.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_189472224(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  swift_unknownObjectRetain_n();
  swift_unknownObjectRelease();
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  sub_189472360();
  return swift_unknownObjectRelease();
}

uint64_t ASN1BitString.bytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *uint64_t v4 = a1;
  v4[1] = a2;
  _OWORD v4[2] = a3;
  _OWORD v4[3] = a4;
  sub_189472360();
  return swift_unknownObjectRelease();
}

void sub_189472360()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[3] >> 1;
  if (v1 == v3)
  {
    if (!v2) {
      return;
    }
    sub_18945AD44();
    swift_allocError();
    uint64_t v5 = v4;
    uint64_t v6 = 0xD000000000000030LL;
    uint64_t v7 = 0x8000000189476750LL;
    uint64_t v8 = 93LL;
    goto LABEL_16;
  }

  if (v3 <= v1)
  {
    __break(1u);
    return;
  }

  int v9 = *(unsigned __int8 *)(v3 + v0[1] - 1);
  unint64_t v10 = v2 - 9;
  int v11 = -1 << v2;
  unsigned int v12 = 0xFFu >> -(char)v2;
  if (v2 < 0) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = v11;
  }
  if (v10 < 0xFFFFFFFFFFFFFFEFLL) {
    unsigned int v13 = 0;
  }
  if ((v9 & ~v13) != 0)
  {
    sub_18945AD44();
    swift_allocError();
    uint64_t v6 = 0xD00000000000003CLL;
    uint64_t v5 = v14;
    uint64_t v7 = 0x8000000189476710LL;
    uint64_t v8 = 104LL;
LABEL_16:
    static ASN1Error.invalidASN1Object(reason:file:line:)( v6,  v7,  (uint64_t)"SwiftASN1/ASN1BitString.swift",  29LL,  2,  v8,  v5);
    swift_willThrow();
  }

void (*ASN1BitString.bytes.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  return sub_1894724C0;
}

void sub_1894724C0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_189472360();
  }
}

uint64_t ASN1BitString.paddingBits.getter()
{
  return *(void *)(v0 + 32);
}

void sub_189472538(unint64_t *a1, uint64_t a2)
{
  unint64_t v2 = *a1;
  *(void *)(a2 + 32) = *a1;
  if (v2 > 7)
  {
    __break(1u);
    swift_unexpectedError();
    __break(1u);
  }

  else
  {
    sub_189472360();
  }

void ASN1BitString.paddingBits.setter(unint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  if (a1 > 7)
  {
    __break(1u);
    swift_unexpectedError();
    __break(1u);
  }

  else
  {
    sub_189472360();
  }

void (*ASN1BitString.paddingBits.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  return sub_189472638;
}

void sub_189472638(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    if (*(void *)(*(void *)a1 + 32LL) > 7uLL)
    {
      __break(1u);
      swift_unexpectedError();
      __break(1u);
    }

    else
    {
      sub_189472360();
    }
  }

void ASN1BitString.init(derEncoded:withIdentifier:)(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  unint64_t v7 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 56);
  if (*(void *)a1 != *(void *)a2 || *(unsigned __int8 *)(a1 + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_18945AD44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1BitString.swift", 29LL, 2, 53LL, v13);
    j__swift_unknownObjectRelease(v6, v5, v8, v7, v9, v10);
    swift_unknownObjectRelease();
    swift_willThrow();
    return;
  }

  if (!*(_BYTE *)(a1 + 56)) {
    goto LABEL_15;
  }
  uint64_t v11 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v11, v5, v8, v7, v9, 1LL);
  swift_unknownObjectRelease();
  if (v8 == v7 >> 1) {
    goto LABEL_12;
  }
  if (v8 < (uint64_t)(v7 >> 1))
  {
    unint64_t v12 = *(unsigned __int8 *)(v5 + v8);
    if (v12 <= 7)
    {
      if (__OFSUB__(v7 >> 1, v8)) {
        goto LABEL_14;
      }
      sub_189472360();
      if (!v3)
      {
        *a3 = v6;
        a3[1] = v5;
        a3[2] = v8 + 1;
        a3[3] = v7;
        a3[4] = v12;
        return;
      }

uint64_t ASN1BitString.init(bytes:paddingBits:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t result = swift_unknownObjectRelease();
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t ASN1BitString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  __int128 v5 = v2[1];
  __int128 v9 = *v2;
  __int128 v10 = v5;
  uint64_t v11 = *((void *)v2 + 4);
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_18945C5BC(&v7, 0, a1, sub_18945E82C);
}

uint64_t sub_1894729BC(char **a1, uint64_t *a2)
{
  char v4 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    char v4 = sub_18945AF98(0LL, *((void *)v4 + 2) + 1LL, 1, v4);
  }
  unint64_t v6 = *((void *)v4 + 2);
  unint64_t v5 = *((void *)v4 + 3);
  if (v6 >= v5 >> 1) {
    char v4 = sub_18945AF98((char *)(v5 > 1), v6 + 1, 1, v4);
  }
  uint64_t v7 = a2[4];
  *((void *)v4 + 2) = v6 + 1;
  v4[v6 + 32] = v7;
  *a1 = v4;
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  uint64_t v10 = a2[2];
  unint64_t v11 = a2[3];
  sub_18945AE64((uint64_t)a2);
  sub_189469594(v8, v9, v10, v11);
  return sub_18945E9DC((uint64_t)a2);
}

void sub_189472A9C(uint64_t a1@<X8>)
{
  *(void *)a1 = 3LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void sub_189472AAC(uint64_t a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  char v3 = *((_BYTE *)a2 + 8);
  uint64_t v4 = *a2;
  char v5 = v3;
  ASN1BitString.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v4, a3);
}

uint64_t sub_189472ADC(char **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  __int128 v5 = v2[1];
  __int128 v9 = *v2;
  __int128 v10 = v5;
  uint64_t v11 = *((void *)v2 + 4);
  uint64_t v7 = v3;
  char v8 = v4;
  return sub_18945C5BC(&v7, 0, a1, sub_189472E0C);
}

uint64_t ASN1BitString.hash(into:)()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3] >> 1;
  uint64_t result = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }

  else
  {
    uint64_t v4 = v0[1];
    uint64_t result = sub_189473A58();
    BOOL v5 = __OFSUB__(v2, v1);
    uint64_t v6 = v2 - v1;
    if (!v6) {
      return sub_189473A58();
    }
    if (!((v6 < 0) ^ v5 | (v6 == 0)))
    {
      uint64_t v7 = v4 + v1;
      do
      {
        ++v7;
        sub_189473A64();
        --v6;
      }

      while (v6);
      return sub_189473A58();
    }
  }

  __break(1u);
  return result;
}

uint64_t static ASN1BitString.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a2[4];
  return sub_18945B3A4(a1[1], a1[2], a1[3], a2[1], a2[2], a2[3]) & (v2 == v3);
}

uint64_t ASN1BitString.hashValue.getter()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_189473A4C();
  unint64_t v4 = v3 >> 1;
  uint64_t result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }

  else
  {
    uint64_t result = sub_189473A58();
    BOOL v6 = __OFSUB__(v4, v2);
    uint64_t v7 = v4 - v2;
    if (!v7)
    {
LABEL_6:
      sub_189473A58();
      return sub_189473A7C();
    }

    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      uint64_t v8 = v1 + v2;
      do
      {
        ++v8;
        sub_189473A64();
        --v7;
      }

      while (v7);
      goto LABEL_6;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_189472C94()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_189473A4C();
  unint64_t v4 = v3 >> 1;
  uint64_t result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }

  else
  {
    uint64_t result = sub_189473A58();
    BOOL v6 = __OFSUB__(v4, v2);
    uint64_t v7 = v4 - v2;
    if (!v7)
    {
LABEL_6:
      sub_189473A58();
      return sub_189473A7C();
    }

    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      uint64_t v8 = v1 + v2;
      do
      {
        ++v8;
        sub_189473A64();
        --v7;
      }

      while (v7);
      goto LABEL_6;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_189472D28(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a2[4];
  return sub_18945B3A4(a1[1], a1[2], a1[3], a2[1], a2[2], a2[3]) & (v2 == v3);
}

uint64_t ASN1BitString.withUnsafeBytes<A>(_:)()
{
  return sub_189473950();
}

unint64_t sub_189472D94()
{
  unint64_t result = qword_18C797D50;
  if (!qword_18C797D50)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1BitString, &type metadata for ASN1BitString);
    atomic_store(result, (unint64_t *)&qword_18C797D50);
  }

  return result;
}

uint64_t sub_189472DD8@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return swift_unknownObjectRetain();
}

uint64_t sub_189472DEC@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 32);
  return result;
}

ValueMetadata *type metadata accessor for ASN1BitString()
{
  return &type metadata for ASN1BitString;
}

uint64_t sub_189472E0C(char **a1)
{
  return sub_18945E82C(a1);
}

BOOL static ASN1Identifier.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
}

SwiftASN1::ASN1Identifier __swiftcall ASN1Identifier.init(tagWithNumber:tagClass:)( Swift::UInt tagWithNumber, SwiftASN1::ASN1Identifier::TagClass tagClass)
{
  char v3 = *(_BYTE *)tagClass;
  *(void *)uint64_t v2 = tagWithNumber;
  *(_BYTE *)(v2 + 8) = v3;
  result.tagNumber = tagWithNumber;
  result.tagClass = tagClass;
  return result;
}

void static ASN1Identifier.sequence.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 16LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.set.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 17LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_189472E7C(uint64_t a1, char a2)
{
  unint64_t v3 = *(void *)a1;
  char v4 = *(_BYTE *)(a1 + 8) << 6;
  if (*(void *)a1 > 0x1EuLL)
  {
    if ((a2 & 1) != 0) {
      char v10 = 63;
    }
    else {
      char v10 = 31;
    }
    uint64_t v11 = *v2;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_18945AF98(0LL, *((void *)v11 + 2) + 1LL, 1, v11);
    }
    char v12 = v4 | v10;
    unint64_t v14 = *((void *)v11 + 2);
    unint64_t v13 = *((void *)v11 + 3);
    if (v14 >= v13 >> 1) {
      uint64_t v11 = sub_18945AF98((char *)(v13 > 1), v14 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v14 + 1;
    v11[v14 + 32] = v12;
    *uint64_t v2 = v11;
    return sub_189469D60(v3);
  }

  else
  {
    if ((a2 & 1) != 0) {
      char v5 = v4 | v3 | 0x20;
    }
    else {
      char v5 = v4 | v3;
    }
    uint64_t v6 = (uint64_t)*v2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18945AF98(0LL, *(void *)(v6 + 16) + 1LL, 1, (char *)v6);
      uint64_t v6 = result;
    }

    unint64_t v9 = *(void *)(v6 + 16);
    unint64_t v8 = *(void *)(v6 + 24);
    if (v9 >= v8 >> 1)
    {
      uint64_t result = (uint64_t)sub_18945AF98((char *)(v8 > 1), v9 + 1, 1, (char *)v6);
      uint64_t v6 = result;
    }

    *(void *)(v6 + 16) = v9 + 1;
    *(_BYTE *)(v6 + v9 + 32) = v5;
    *uint64_t v2 = (char *)v6;
  }

  return result;
}

uint64_t ASN1Identifier.tagNumber.getter()
{
  return *(void *)v0;
}

uint64_t ASN1Identifier.tagNumber.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*ASN1Identifier.tagNumber.modify())()
{
  return nullsub_1;
}

void ASN1Identifier.tagClass.getter(_BYTE *a1@<X8>)
{
  *a1 = *(_BYTE *)(v1 + 8);
}

_BYTE *ASN1Identifier.tagClass.setter(_BYTE *result)
{
  *(_BYTE *)(v1 + 8) = *result;
  return result;
}

uint64_t (*ASN1Identifier.tagClass.modify())()
{
  return nullsub_1;
}

BOOL static ASN1Identifier.TagClass.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ASN1Identifier.TagClass.hash(into:)()
{
  return sub_189473A58();
}

uint64_t ASN1Identifier.TagClass.hashValue.getter()
{
  return sub_189473A7C();
}

void static ASN1Identifier.objectIdentifier.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 6LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.bitString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 3LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.octetString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 4LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.integer.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 2LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.null.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 5LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.BOOLean.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 1LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.enumerated.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 10LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.utf8String.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 12LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.numericString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 18LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.printableString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 19LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.teletexString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 20LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.videotexString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 21LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.ia5String.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 22LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.graphicString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 25LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.visibleString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 26LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.generalString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 27LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.universalString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 28LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.bmpString.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 30LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.generalizedTime.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 24LL;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.utcTime.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 23LL;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t ASN1Identifier.hash(into:)()
{
  return sub_189473A58();
}

uint64_t ASN1Identifier.hashValue.getter()
{
  return sub_189473A7C();
}

uint64_t sub_189473274()
{
  return sub_189473A7C();
}

uint64_t sub_1894732D0()
{
  return sub_189473A58();
}

uint64_t sub_18947330C()
{
  return sub_189473A7C();
}

BOOL sub_189473364(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
}

uint64_t ASN1Identifier.description.getter()
{
  return 0LL;
}

unint64_t sub_189473490()
{
  unint64_t result = qword_18C797D58;
  if (!qword_18C797D58)
  {
    unint64_t result = MEMORY[0x1895E6DB8]( &protocol conformance descriptor for ASN1Identifier.TagClass,  &type metadata for ASN1Identifier.TagClass);
    atomic_store(result, (unint64_t *)&qword_18C797D58);
  }

  return result;
}

unint64_t sub_1894734D8()
{
  unint64_t result = qword_18C797D60;
  if (!qword_18C797D60)
  {
    unint64_t result = MEMORY[0x1895E6DB8](&protocol conformance descriptor for ASN1Identifier, &type metadata for ASN1Identifier);
    atomic_store(result, (unint64_t *)&qword_18C797D60);
  }

  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ASN1Identifier(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  BOOL v4 = v3 >= 4;
  int v5 = v3 - 4;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ASN1Identifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 9) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 9) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 8) = a2 + 3;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ASN1Identifier()
{
  return &type metadata for ASN1Identifier;
}

uint64_t getEnumTagSinglePayload for ASN1Identifier.TagClass(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }

uint64_t storeEnumTagSinglePayload for ASN1Identifier.TagClass(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_1894736A8 + 4 * byte_189475975[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1894736DC + 4 * asc_189475970[v4]))();
}

uint64_t sub_1894736DC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1894736E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1894736ECLL);
  }
  return result;
}

uint64_t sub_1894736F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189473700LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_189473704(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18947370C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ASN1Identifier.TagClass()
{
  return &type metadata for ASN1Identifier.TagClass;
}

uint64_t sub_189473728()
{
  return MEMORY[0x189617A00]();
}

uint64_t sub_189473734()
{
  return MEMORY[0x189617B30]();
}

uint64_t sub_189473740()
{
  return MEMORY[0x189617B38]();
}

uint64_t sub_18947374C()
{
  return MEMORY[0x189617B40]();
}

uint64_t sub_189473758()
{
  return MEMORY[0x189617B48]();
}

uint64_t sub_189473764()
{
  return MEMORY[0x189617B50]();
}

uint64_t sub_189473770()
{
  return MEMORY[0x189617C20]();
}

uint64_t sub_18947377C()
{
  return MEMORY[0x189617C90]();
}

uint64_t sub_189473788()
{
  return MEMORY[0x189617D78]();
}

uint64_t sub_189473794()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_1894737A0()
{
  return MEMORY[0x189617EB0]();
}

uint64_t sub_1894737AC()
{
  return MEMORY[0x189618080]();
}

uint64_t sub_1894737B8()
{
  return MEMORY[0x189618090]();
}

uint64_t sub_1894737C4()
{
  return MEMORY[0x1896180E0]();
}

uint64_t sub_1894737D0()
{
  return MEMORY[0x1896180F8]();
}

uint64_t sub_1894737DC()
{
  return MEMORY[0x189618390]();
}

uint64_t sub_1894737E8()
{
  return MEMORY[0x1896183E0]();
}

uint64_t sub_1894737F4()
{
  return MEMORY[0x1896187F8]();
}

uint64_t sub_189473800()
{
  return MEMORY[0x189618810]();
}

uint64_t sub_18947380C()
{
  return MEMORY[0x189618818]();
}

uint64_t sub_189473818()
{
  return MEMORY[0x189618820]();
}

uint64_t sub_189473824()
{
  return MEMORY[0x189618828]();
}

uint64_t sub_189473830()
{
  return MEMORY[0x189618848]();
}

uint64_t sub_18947383C()
{
  return MEMORY[0x189618890]();
}

uint64_t sub_189473848()
{
  return MEMORY[0x1896188B8]();
}

uint64_t sub_189473854()
{
  return MEMORY[0x1896188D0]();
}

uint64_t sub_189473860()
{
  return MEMORY[0x1896188F8]();
}

uint64_t sub_18947386C()
{
  return MEMORY[0x189618910]();
}

uint64_t sub_189473878()
{
  return MEMORY[0x189618920]();
}

uint64_t sub_189473884()
{
  return MEMORY[0x189618940]();
}

uint64_t sub_189473890()
{
  return MEMORY[0x189618950]();
}

uint64_t sub_18947389C()
{
  return MEMORY[0x189618A18]();
}

uint64_t sub_1894738A8()
{
  return MEMORY[0x189618AC0]();
}

uint64_t sub_1894738B4()
{
  return MEMORY[0x189618CB0]();
}

uint64_t sub_1894738C0()
{
  return MEMORY[0x189618D80]();
}

uint64_t sub_1894738CC()
{
  return MEMORY[0x189618D88]();
}

uint64_t sub_1894738D8()
{
  return MEMORY[0x189618E20]();
}

uint64_t sub_1894738E4()
{
  return MEMORY[0x189618E28]();
}

uint64_t sub_1894738F0()
{
  return MEMORY[0x189618E68]();
}

uint64_t sub_1894738FC()
{
  return MEMORY[0x189618E70]();
}

uint64_t sub_189473908()
{
  return MEMORY[0x189618E78]();
}

uint64_t sub_189473914()
{
  return MEMORY[0x189618EA0]();
}

uint64_t sub_189473920()
{
  return MEMORY[0x189618EA8]();
}

uint64_t sub_18947392C()
{
  return MEMORY[0x189618EB8]();
}

uint64_t sub_189473938()
{
  return MEMORY[0x189618ED8]();
}

uint64_t sub_189473944()
{
  return MEMORY[0x189618F48]();
}

uint64_t sub_189473950()
{
  return MEMORY[0x189618F50]();
}

uint64_t sub_18947395C()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_189473968()
{
  return MEMORY[0x1896191F0]();
}

uint64_t sub_189473974()
{
  return MEMORY[0x189619260]();
}

uint64_t sub_189473980()
{
  return MEMORY[0x1896194D0]();
}

uint64_t sub_18947398C()
{
  return MEMORY[0x189619510]();
}

uint64_t sub_189473998()
{
  return MEMORY[0x189619530]();
}

uint64_t sub_1894739A4()
{
  return MEMORY[0x189619538]();
}

uint64_t sub_1894739B0()
{
  return MEMORY[0x189619660]();
}

uint64_t sub_1894739BC()
{
  return MEMORY[0x189619668]();
}

uint64_t sub_1894739C8()
{
  return MEMORY[0x189619740]();
}

uint64_t sub_1894739D4()
{
  return MEMORY[0x189619760]();
}

uint64_t sub_1894739E0()
{
  return MEMORY[0x189619CA8]();
}

uint64_t sub_1894739EC()
{
  return MEMORY[0x189619CC8]();
}

uint64_t sub_1894739F8()
{
  return MEMORY[0x18961A010]();
}

uint64_t sub_189473A04()
{
  return MEMORY[0x18961A2E8]();
}

uint64_t sub_189473A10()
{
  return MEMORY[0x18961A310]();
}

uint64_t sub_189473A1C()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_189473A28()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t sub_189473A34()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t sub_189473A40()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_189473A4C()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_189473A58()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_189473A64()
{
  return MEMORY[0x18961A698]();
}

uint64_t sub_189473A70()
{
  return MEMORY[0x18961A6B0]();
}

uint64_t sub_189473A7C()
{
  return MEMORY[0x18961A6C0]();
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x18961B0C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x18961B0E0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x18961B218]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x18961B220]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x18961B358]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x18961B450]();
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
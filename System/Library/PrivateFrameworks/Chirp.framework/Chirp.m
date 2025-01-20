uint64_t sub_188F14DC4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_188F14DCC()
{
  uint64_t result = sub_188F2A3A4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *sub_188F14E40(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = sub_188F2A3A4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 36)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 36));
  }

  return a1;
}

uint64_t sub_188F14EC8(uint64_t a1)
{
  uint64_t v2 = sub_188F2A3A4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
}

uint64_t sub_188F14EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_188F2A3A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_188F14F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_188F2A3A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_188F14FB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_188F2A3A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_188F15010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_188F2A3A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_188F1506C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_188F15078(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_188F2A3A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(a1, a2, v4);
}

uint64_t sub_188F150B4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_188F150C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_188F2A3A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CipherState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CipherState);
}

uint64_t sub_188F1510C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_188F2A3A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(a4, a1, v8);
  uint64_t result = type metadata accessor for CipherState(0LL, a2, a3, v9);
  *(void *)(a4 + *(int *)(result + 36)) = 0LL;
  return result;
}

uint64_t sub_188F15174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v45 = a7;
  uint64_t v8 = v7;
  uint64_t v43 = a5;
  uint64_t v44 = a6;
  uint64_t v42 = a4;
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = *(void *)(a3 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v41 = sub_188F2A5FC();
  uint64_t v38 = *(void *)(v41 - 8);
  ((void (*)(void))MEMORY[0x1895F8858])();
  v14 = (char *)&v35 - v13;
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void *)(v15 - 8);
  uint64_t v37 = v15;
  uint64_t v16 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  v49 = (char *)&v35 - v17;
  uint64_t v18 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v19 = MEMORY[0x1895F8858](v16);
  v21 = (char *)&v35 - v20;
  uint64_t v22 = *(int *)(a3 + 36);
  unint64_t v23 = *(void *)(v8 + v22);
  uint64_t result = sub_188F1543C(v19, v23, v10, v11);
  if (v23 == -1LL)
  {
    __break(1u);
  }

  else
  {
    *(void *)(v8 + v22) = v23 + 1;
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v14, v21, AssociatedTypeWitness);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v14, 0LL, 1LL, AssociatedTypeWitness);
    uint64_t v25 = v46;
    (*(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 72))( v39,  v8,  v14,  v40,  v42,  v43,  v44,  v45,  v10,  v11);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v41);
    if (v25)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v21, AssociatedTypeWitness);
    }

    else
    {
      uint64_t v26 = v37;
      uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      uint64_t v46 = 0LL;
      uint64_t v28 = AssociatedConformanceWitness;
      uint64_t v29 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32))( v26,  AssociatedConformanceWitness);
      unint64_t v31 = v30;
      uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 24))(v26, v28);
      unint64_t v34 = v33;
      uint64_t v47 = v29;
      unint64_t v48 = v31;
      sub_188F15B18(v29, v31);
      sub_188F1DCF8(v32, v34);
      sub_188F15B5C(v32, v34);
      sub_188F15B5C(v29, v31);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v49, v26);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, AssociatedTypeWitness);
      return v47;
    }
  }

  return result;
}

uint64_t sub_188F1543C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  v18[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = sub_188F2A5C0();
  *(void *)(v7 + 16) = 4LL;
  *(_DWORD *)(v7 + 32) = 0;
  v18[0] = v7;
  char v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
  unint64_t v9 = bswap64(a2);
  if ((v8 & 1) == 0) {
    unint64_t v9 = a2;
  }
  unint64_t v17 = v9;
  sub_188F230F4((char *)&v17, (char *)v18);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = v18[0];
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v12 = *(void (**)(uint64_t *, uint64_t, unint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 24);
  swift_bridgeObjectRetain();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C759308);
  unint64_t v14 = sub_188F15A88();
  v12(&v16, v13, v14, AssociatedTypeWitness, AssociatedConformanceWitness);
  return swift_bridgeObjectRelease();
}

uint64_t sub_188F155C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v52 = a5;
  uint64_t v53 = a7;
  uint64_t v51 = a2;
  uint64_t v66 = a1;
  uint64_t v62 = *(void *)(a4 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v60 = v12;
  uint64_t v54 = *(void *)(*(void *)(v12 + 8) + 8LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  v56 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v13);
  v55 = (char *)&v48 - v15;
  uint64_t v17 = *(void *)(a3 + 16);
  uint64_t v16 = *(void *)(a3 + 24);
  uint64_t v59 = swift_getAssociatedTypeWitness();
  uint64_t v50 = *(void *)(v59 - 8);
  MEMORY[0x1895F8858](v59);
  v58 = (char *)&v48 - v18;
  uint64_t v19 = swift_getAssociatedTypeWitness();
  uint64_t v64 = *(void *)(v19 - 8);
  uint64_t v65 = v19;
  uint64_t v20 = MEMORY[0x1895F8858](v19);
  uint64_t v22 = (char *)&v48 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = MEMORY[0x1895F8858](v20);
  uint64_t v24 = *(int *)(a3 + 36);
  unint64_t v25 = *(void *)(v7 + v24);
  v63 = (char *)&v48 - v26;
  uint64_t result = sub_188F1543C(v23, v25, v17, v16);
  if (v25 == -1LL)
  {
    __break(1u);
  }

  else
  {
    uint64_t v49 = v7;
    *(void *)(v7 + v24) = v25 + 1;
    uint64_t v28 = sub_188F2A5CC();
    uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 64);
    uint64_t v30 = v17;
    if (v28 < v29(v17, v16))
    {
      sub_188F15A04();
      swift_allocError();
      *unint64_t v31 = 6;
      swift_willThrow();
      goto LABEL_7;
    }

    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
    unint64_t v48 = v22;
    v32(v22, v63, v65);
    unint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v62 + 16);
    v33(v11, v66, a4);
    uint64_t v34 = sub_188F2A5CC();
    uint64_t v35 = v29(v17, v16);
    BOOL v36 = __OFSUB__(v34, v35);
    uint64_t result = v34 - v35;
    if (!v36)
    {
      uint64_t v37 = v55;
      sub_188F2A5D8();
      v33(v11, v66, a4);
      v29(v17, v16);
      uint64_t v38 = v56;
      sub_188F2A4AC();
      uint64_t v39 = v59;
      uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      uint64_t v41 = *(void (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 48);
      uint64_t v42 = AssociatedTypeWitness;
      uint64_t v43 = swift_getAssociatedConformanceWitness();
      uint64_t v44 = v58;
      uint64_t v45 = v42;
      uint64_t v46 = v42;
      uint64_t v30 = v39;
      uint64_t v47 = v61;
      v41(v48, v37, v38, v45, v46, v43, v43, v39, AssociatedConformanceWitness);
      if (!v47)
      {
        uint64_t v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 80))( v44,  v49,  v51,  v52,  v53,  v17,  v16);
        (*(void (**)(char *, uint64_t))(v50 + 8))(v44, v39);
        (*(void (**)(char *, uint64_t))(v64 + 8))(v63, v65);
        return v30;
      }

LABEL_7:
      (*(void (**)(char *, uint64_t))(v64 + 8))(v63, v65);
      return v30;
    }
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

  __break(1u);
  return result;
}

unint64_t sub_188F15A04()
{
  unint64_t result = qword_18C759300;
  if (!qword_18C759300)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&protocol conformance descriptor for ChirpErrors, &type metadata for ChirpErrors);
    atomic_store(result, (unint64_t *)&qword_18C759300);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895DA4BC]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_188F15A88()
{
  unint64_t result = qword_18C759310;
  if (!qword_18C759310)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C759308);
    unint64_t result = MEMORY[0x1895DA4D4](MEMORY[0x1896071F8], v1);
    atomic_store(result, (unint64_t *)&qword_18C759310);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895DA4C8](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_188F15B18(uint64_t a1, unint64_t a2)
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

uint64_t sub_188F15B5C(uint64_t a1, unint64_t a2)
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

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1895DA4A4](a1, v6, a5);
}

uint64_t dispatch thunk of static NoiseDH.noiseName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NoiseDHPrivate.init(rawRepresentation:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of NoiseDHPublic.noiseRepresentation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NoiseDHPublic.init(noiseRepresentation:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of static NoiseDHPublic.noiseRepresentationByteCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NoiseCipherNonce.init<A>(data:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of NoiseAEADSealedBox.tag.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NoiseAEADSealedBox.ciphertext.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of NoiseAEADSealedBox.nonce.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of NoiseAEADSealedBox.init<A, B>(nonce:ciphertext:tag:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t))(a9 + 48))(a1);
}

uint64_t dispatch thunk of static NoiseCipher.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static NoiseCipher.bigEndianNonce.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of static NoiseCipher.tagByteCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of static NoiseCipher.seal<A, B>(_:using:nonce:authenticating:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 72))(a1, a2);
}

uint64_t dispatch thunk of static NoiseCipher.open<A>(_:using:authenticating:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 80))();
}

uint64_t TransportState.readKey.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v7 = (char *)&v11 - v6;
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)&v11 - v6, v3 + *(int *)(a1 + 44));
  uint64_t v9 = sub_188F2A3A4();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(a3, v7, v9);
}

uint64_t TransportState.writeKey.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v7 = (char *)&v11 - v6;
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)&v11 - v6, v3 + *(int *)(a1 + 40));
  uint64_t v9 = sub_188F2A3A4();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(a3, v7, v9);
}

uint64_t TransportState.encryptOutgoingPayload<A>(_:authenticating:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_188F2A5CC();
  uint64_t v12 = *(void *)(a4 + 16);
  uint64_t v13 = *(void *)(a4 + 24);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 64))(v12, v13);
  if (__OFSUB__(0xFFFFLL, result))
  {
    __break(1u);
    goto LABEL_11;
  }

  if (0xFFFF - result < v11)
  {
    sub_188F15A04();
    swift_allocError();
    *uint64_t v16 = 5;
    return swift_willThrow();
  }

  if (*v6 != 1)
  {
    if ((v6[1] & 1) == 0)
    {
      uint64_t v21 = a2;
      uint64_t v22 = a3;
      goto LABEL_8;
    }

LABEL_11:
    __break(1u);
    return result;
  }

  uint64_t v21 = a2;
  uint64_t v22 = a3;
LABEL_8:
  uint64_t v17 = type metadata accessor for CipherState(0LL, v12, v13, v15);
  unint64_t v18 = sub_188F15F50();
  return sub_188F15174(a1, (uint64_t)&v21, v17, a5, MEMORY[0x189606D70], a6, v18);
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

unint64_t sub_188F15F50()
{
  unint64_t result = qword_18C759318;
  if (!qword_18C759318)
  {
    unint64_t result = MEMORY[0x1895DA4D4](MEMORY[0x189606D48], MEMORY[0x189606D70]);
    atomic_store(result, (unint64_t *)&qword_18C759318);
  }

  return result;
}

uint64_t TransportState.decryptIncomingPayload<A>(_:authenticating:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = sub_188F2A5CC();
  if (result >= 0x10000)
  {
    sub_188F15A04();
    swift_allocError();
    *uint64_t v15 = 5;
    return swift_willThrow();
  }

  if (*v6 != 1)
  {
    uint64_t v18 = a2;
    uint64_t v19 = a3;
    goto LABEL_7;
  }

  if ((v6[1] & 1) == 0)
  {
    uint64_t v18 = a2;
    uint64_t v19 = a3;
LABEL_7:
    uint64_t v16 = type metadata accessor for CipherState(0LL, *(void *)(a4 + 16), *(void *)(a4 + 24), v14);
    unint64_t v17 = sub_188F15F50();
    return sub_188F155C8(a1, (uint64_t)&v18, v16, a5, MEMORY[0x189606D70], a6, v17);
  }

  __break(1u);
  return result;
}

uint64_t sub_188F160C0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_188F160C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for CipherState(319LL, *(void *)(a1 + 16), *(void *)(a1 + 24), a4);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

char *sub_188F16140(char *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (char *)(v17 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    uint64_t v7 = *(int *)(a3 + 40);
    uint64_t v8 = &a1[v7];
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_188F2A3A4();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL);
    v11(v8, v9, v10);
    uint64_t v13 = type metadata accessor for CipherState(0LL, *(void *)(a3 + 16), *(void *)(a3 + 24), v12);
    *(void *)&v8[*(int *)(v13 + 36)] = *(void *)&v9[*(int *)(v13 + 36)];
    uint64_t v14 = *(int *)(a3 + 44);
    uint64_t v15 = &v4[v14];
    uint64_t v16 = (char *)a2 + v14;
    v11(&v4[v14], v16, v10);
    *(void *)&v15[*(int *)(v13 + 36)] = *(void *)&v16[*(int *)(v13 + 36)];
  }

  return v4;
}

uint64_t sub_188F16228(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = sub_188F2A3A4();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL);
  v7(v4, v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v7)(a1 + *(int *)(a2 + 44), v5);
}

char *sub_188F16298(char *a1, _WORD *a2, uint64_t a3)
{
  *(_WORD *)a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_188F2A3A4();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16LL);
  v10(v7, v8, v9);
  uint64_t v12 = type metadata accessor for CipherState(0LL, *(void *)(a3 + 16), *(void *)(a3 + 24), v11);
  *(void *)&v7[*(int *)(v12 + 36)] = *(void *)&v8[*(int *)(v12 + 36)];
  uint64_t v13 = *(int *)(a3 + 44);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = (char *)a2 + v13;
  v10(&a1[v13], v15, v9);
  *(void *)&v14[*(int *)(v12 + 36)] = *(void *)&v15[*(int *)(v12 + 36)];
  return a1;
}

_BYTE *sub_188F16354(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_188F2A3A4();
  uint64_t v10 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v9 - 8) + 24LL);
  v10(v7, v8, v9);
  uint64_t v12 = type metadata accessor for CipherState(0LL, *(void *)(a3 + 16), *(void *)(a3 + 24), v11);
  *(void *)&v7[*(int *)(v12 + 36)] = *(void *)&v8[*(int *)(v12 + 36)];
  uint64_t v13 = *(int *)(a3 + 44);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  v10(&a1[v13], v15, v9);
  *(void *)&v14[*(int *)(v12 + 36)] = *(void *)&v15[*(int *)(v12 + 36)];
  return a1;
}

char *sub_188F16418(char *a1, _WORD *a2, uint64_t a3)
{
  *(_WORD *)a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_188F2A3A4();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL);
  v10(v7, v8, v9);
  uint64_t v12 = type metadata accessor for CipherState(0LL, *(void *)(a3 + 16), *(void *)(a3 + 24), v11);
  *(void *)&v7[*(int *)(v12 + 36)] = *(void *)&v8[*(int *)(v12 + 36)];
  uint64_t v13 = *(int *)(a3 + 44);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = (char *)a2 + v13;
  v10(&a1[v13], v15, v9);
  *(void *)&v14[*(int *)(v12 + 36)] = *(void *)&v15[*(int *)(v12 + 36)];
  return a1;
}

_BYTE *sub_188F164D4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_188F2A3A4();
  uint64_t v10 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v9 - 8) + 40LL);
  v10(v7, v8, v9);
  uint64_t v12 = type metadata accessor for CipherState(0LL, *(void *)(a3 + 16), *(void *)(a3 + 24), v11);
  *(void *)&v7[*(int *)(v12 + 36)] = *(void *)&v8[*(int *)(v12 + 36)];
  uint64_t v13 = *(int *)(a3 + 44);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  v10(&a1[v13], v15, v9);
  *(void *)&v14[*(int *)(v12 + 36)] = *(void *)&v15[*(int *)(v12 + 36)];
  return a1;
}

uint64_t sub_188F16598()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_188F165A4(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((_DWORD)a2 == 254)
  {
    unsigned int v5 = *a1;
    BOOL v6 = v5 >= 2;
    int v7 = (v5 + 2147483646) & 0x7FFFFFFF;
    if (v6) {
      return (v7 + 1);
    }
    else {
      return 0LL;
    }
  }

  else
  {
    uint64_t v11 = type metadata accessor for CipherState(0LL, *(void *)(a3 + 16), *(void *)(a3 + 24), a4);
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48LL))( &a1[*(int *)(a3 + 40)],  a2,  v11);
  }
}

uint64_t sub_188F16624()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_188F16630(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v5 = result;
  if (a3 == 254)
  {
    *uint64_t result = a2 + 1;
  }

  else
  {
    uint64_t v7 = type metadata accessor for CipherState(0LL, *(void *)(a4 + 16), *(void *)(a4 + 24), a4);
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( &v5[*(int *)(a4 + 40)],  a2,  a2,  v7);
  }

  return result;
}

uint64_t type metadata accessor for TransportState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TransportState);
}

uint64_t sub_188F166B0@<X0>( char a1@<W0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _BYTE *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  uint64_t v12 = type metadata accessor for TransportState(0LL, a5, a6, a4);
  uint64_t v13 = &a7[*(int *)(v12 + 40)];
  uint64_t v15 = type metadata accessor for CipherState(0LL, a5, a6, v14);
  uint64_t v17 = *(void (**)(_BYTE *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32LL);
  v17(v13, a3, v15);
  return ((uint64_t (*)(_BYTE *, uint64_t, uint64_t))v17)(&a7[*(int *)(v12 + 44)], a4, v15);
}

uint64_t type metadata accessor for SecureBytes.Backing()
{
  uint64_t result = qword_18C759328;
  if (!qword_18C759328) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_188F167A4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_188F167E0()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = 0LL;
  qword_18C759320 = result;
  return result;
}

char *sub_188F16810(char *result, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v4 = v3;
  uint64_t v7 = result;
  uint64_t result = (char *)_swift_stdlib_malloc_size(result);
  if ((uint64_t)(result - 32) < a3)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  size_t v8 = _swift_stdlib_malloc_size(v4) - 32;
  uint64_t v9 = v4 + 2;
  uint64_t result = (char *)swift_beginAccess();
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
    uint64_t result = (char *)swift_beginAccess();
    *uint64_t v9 = v15;
    return result;
  }

LABEL_17:
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

  BOOL v6 = *a1;
  uint64_t v7 = v6 >= 5;
  size_t v8 = v6 - 5;
  if (!v7) {
    size_t v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  uint64_t v7 = v6 >= 8;
  size_t v8 = v6 - 8;
  if (!v7) {
    size_t v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  uint64_t v7 = v6 >= 0x26;
  size_t v8 = v6 - 38;
  if (!v7) {
    size_t v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  uint64_t v7 = v6 >= 7;
  size_t v8 = v6 - 7;
  if (!v7) {
    size_t v8 = -1;
  }
  return (v8 + 1);
}

size_t sub_188F16920(char a1)
{
  uint64_t v2 = v1;
  size_t v4 = _swift_stdlib_malloc_size(v2) - 32;
  unsigned int v5 = v2 + 2;
  size_t result = swift_beginAccess();
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
    size_t result = swift_beginAccess();
    *unsigned int v5 = v11;
    return result;
  }

size_t sub_188F169E8(const void *a1, size_t a2)
{
  uint64_t v3 = v2;
  size_t v6 = _swift_stdlib_malloc_size(v2) - 32;
  int64_t v7 = v2 + 2;
  size_t result = swift_beginAccess();
  int64_t v9 = v3[2];
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

  size_t result = _swift_stdlib_malloc_size(v3);
  if ((uint64_t)(result - 32) < v9)
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
    size_t result = (size_t)memmove((char *)v3 + v9 + 32, a1, a2);
LABEL_8:
    if (!__OFADD__(*v7, a2))
    {
      *v7 += a2;
      return result;
    }

    goto LABEL_14;
  }

LABEL_15:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

size_t sub_188F16AB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_188F2A5CC();
  size_t v3 = _swift_stdlib_malloc_size(v1) - 32;
  size_t result = swift_beginAccess();
  int64_t v5 = v1[2];
  size_t v6 = v3 - v5;
  if (__OFSUB__(v3, v5))
  {
    __break(1u);
    goto LABEL_8;
  }

  BOOL v7 = __OFSUB__(v6, v2);
  size_t v8 = v6 - v2;
  if (v7)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  if ((v8 & 0x8000000000000000LL) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  size_t result = _swift_stdlib_malloc_size(v1);
  if ((uint64_t)(result - 32) < v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  size_t result = sub_188F2A644();
  uint64_t v9 = v1[2];
  BOOL v7 = __OFADD__(v9, v2);
  uint64_t v10 = v9 + v2;
  if (!v7)
  {
    v1[2] = v10;
    return result;
  }

size_t sub_188F16BA4(int64_t a1)
{
  uint64_t v2 = v1;
  size_t v4 = (char *)*v2;
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

      type metadata accessor for SecureBytes.Backing();
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = 0LL;
      *(void *)(v10 + 24) = v9;
      size_t result = swift_beginAccess();
      uint64_t v11 = *((void *)v4 + 2);
      if ((v11 & 0x8000000000000000LL) == 0)
      {
        sub_188F16810(v4, 0LL, v11);
        size_t result = swift_release();
        *uint64_t v2 = (const void *)v10;
        return result;
      }

LABEL_14:
      __break(1u);
      return result;
    }

    __break(1u);
    goto LABEL_14;
  }

  return result;
}

          uint64_t v9 = __OFADD__(v7++, 1LL);
          if (v9) {
            goto LABEL_27;
          }
        }

        uint64_t v9 = __OFADD__(v10++, 1LL);
        if (v9) {
          goto LABEL_26;
        }
      }

      goto LABEL_25;
    }

    uint64_t v9 = __OFADD__(v7++, 1LL);
  }

  while (!v9);
  __break(1u);
LABEL_9:
  swift_release();
  uint64_t v10 = *(void *)(v4 + 16);
  unsigned int v7 = v10;
  return sub_188F1986C(v7, v10);
}

  __break(1u);
  return result;
}

      unsigned int v7 = v5;
      return v7 << 16;
    }

    uint64_t v9 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000LL) == 0) {
      uint64_t v9 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (v5 != v9) {
      return sub_188F2A650();
    }
  }

  return result;
}

uint64_t sub_188F16C8C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  return sub_188F19344(v2 + 32, v2 + 32 + *(void *)(v2 + 16), v3) & 1;
}

void sub_188F16CEC(void *a1@<X8>)
{
  *a1 = 0LL;
}

uint64_t sub_188F16CF4@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_beginAccess();
  *a1 = *(void *)(v3 + 16);
  return result;
}

uint64_t (*sub_188F16D38(_BYTE *a1, void *a2))()
{
  *a1 = *(_BYTE *)(*v2 + *a2 + 32LL);
  return nullsub_1;
}

uint64_t sub_188F16D64@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v6 = *v2;
  uint64_t result = swift_beginAccess();
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
    return swift_retain();
  }

uint64_t sub_188F16DDC@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_beginAccess();
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

BOOL sub_188F16E28()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(void *)(v1 + 16) == 0LL;
}

void sub_188F16E6C(uint64_t a1@<X8>)
{
  *(void *)a1 = 0LL;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t sub_188F16E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = swift_beginAccess();
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

uint64_t *sub_188F16F4C(uint64_t *result, uint64_t *a2)
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

void *sub_188F16F68(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

void *sub_188F16F84(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

void *sub_188F16FA0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1LL)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1LL;
  }
  return result;
}

void *sub_188F16FB8(void *result)
{
  if (__OFADD__(*result, 1LL)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

void sub_188F16FD0(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0LL;
}

uint64_t sub_188F16FDC()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(void *)(v1 + 16);
}

uint64_t sub_188F17018()
{
  return 2LL;
}

uint64_t sub_188F17020()
{
  uint64_t v1 = sub_188F194E4(*v0);
  swift_release();
  return v1;
}

uint64_t sub_188F17054(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  return sub_188F1705C(a1, a2, a3, *v3);
}

uint64_t sub_188F1705C(uint64_t result, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  BOOL v5 = (void *)result;
  if (!a2)
  {
    uint64_t v6 = 0LL;
    goto LABEL_14;
  }

  uint64_t v6 = a3;
  if (!a3)
  {
LABEL_14:
    *BOOL v5 = a4;
    v5[1] = v6;
    return v6;
  }

  if ((a3 & 0x8000000000000000LL) == 0)
  {
    uint64_t result = swift_beginAccess();
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

uint64_t sub_188F17130@<X0>(uint64_t (*a1)(uint64_t, void)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_188F1714C(a1, a2, a3);
}

uint64_t sub_188F1714C@<X0>(uint64_t (*a1)(uint64_t, void)@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return sub_188F18610(a1, a2, a3);
}

void *sub_188F17170@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(*result, 1LL)) {
    __break(1u);
  }
  else {
    *a2 = *result - 1LL;
  }
  return result;
}

void *sub_188F17188(void *result)
{
  if (__OFSUB__(*result, 1LL)) {
    __break(1u);
  }
  else {
    --*result;
  }
  return result;
}

void *sub_188F171A0@<X0>(void *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }

  else
  {
    uint64_t v6 = *v3;
    uint64_t result = (void *)swift_beginAccess();
    if ((v5 & 0x8000000000000000LL) == 0 && *(void *)(v6 + 16) >= v5)
    {
      *a3 = v5;
      return result;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_188F1720C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = sub_188F16E84(*a1, a2, *a3, *v4);
  *(void *)a4 = result;
  *(_BYTE *)(a4 + 8) = v7 & 1;
  return result;
}

uint64_t sub_188F17244(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = *v2;
  uint64_t result = swift_beginAccess();
  uint64_t v7 = *(void *)(v5 + 16);
  if (v7 >= v4 && ((v4 | v3) & 0x8000000000000000LL) == 0 && v7 >= v3) {
    return v4 - v3;
  }
  __break(1u);
  return result;
}

_BYTE *sub_188F172B0(_BYTE *result, void *a2)
{
  *(_BYTE *)(*v2 + *a2 + 32LL) = *result;
  return result;
}

uint64_t (*sub_188F172C8(uint64_t a1, uint64_t *a2))(uint64_t result)
{
  uint64_t v3 = *a2;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(*v2 + v3 + 32);
  return sub_188F172F4;
}

uint64_t sub_188F172F4(uint64_t result)
{
  *(_BYTE *)(**(void **)result + *(void *)(result + 8) + 32LL) = *(_BYTE *)(result + 16);
  return result;
}

uint64_t sub_188F1730C(uint64_t *a1, uint64_t *a2)
{
  return swift_release();
}

void (*sub_188F17344(void *a1, uint64_t *a2))(void *a1)
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_188F173BC(v4, *a2, a2[1]);
  return sub_188F17390;
}

void sub_188F17390(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

void (*sub_188F173BC(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1)
{
  uint64_t v7 = malloc(0x48uLL);
  *a1 = v7;
  v7[7] = a3;
  v7[8] = v3;
  v7[6] = a2;
  uint64_t v8 = *v3;
  uint64_t result = (void (*)(uint64_t **))swift_beginAccess();
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
    *uint64_t v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    swift_retain();
    return sub_188F17460;
  }

void sub_188F17460(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_188F193D0((uint64_t *)(*a1)[8], v1[6], (*a1)[7], *v1, v1[1], v1[2]);
  swift_release();
  free(v1);
}

uint64_t sub_188F1749C@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_188F195C0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void *sub_188F174C4(void *result, void *a2)
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

uint64_t sub_188F174F8()
{
  return sub_188F2A4D0();
}

uint64_t sub_188F17518()
{
  return sub_188F2A4C4();
}

uint64_t sub_188F17538(int64_t a1, int64_t a2, size_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = (char *)*v3 + 16;
  uint64_t result = swift_beginAccess();
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

  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result)
  {
    uint64_t result = _swift_stdlib_malloc_size(*v4);
    if (result - 32 >= v13)
    {
      if (a2 >= a1) {
        return sub_188F17A48(a1, a2, a3);
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

  type metadata accessor for SecureBytes.Backing();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = v17;
  if (a1 < 0) {
    goto LABEL_24;
  }
  uint64_t v18 = (const void *)result;
  uint64_t v19 = (char *)*v4;
  uint64_t result = swift_beginAccess();
  uint64_t v20 = *((void *)v19 + 2);
  if (v20 < a2)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return result;
  }

  sub_188F16810(v19, 0LL, a1);
  sub_188F16920(a3);
  sub_188F16810((char *)*v4, a2, v20);
  *uint64_t v4 = v18;
  return swift_release();
}

uint64_t sub_188F176D4(uint64_t a1, int64_t a2, void *a3, size_t a4)
{
  uint64_t v5 = v4;
  int64_t v10 = (char *)*v4 + 16;
  uint64_t result = swift_beginAccess();
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

  uint64_t v15 = v14 + a4;
  if (__OFADD__(v14, a4))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result)
  {
    uint64_t result = _swift_stdlib_malloc_size(*v5);
    if (result - 32 >= v15)
    {
      if (a2 >= a1) {
        return sub_188F17B44(a1, a2, a3, a4);
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

  type metadata accessor for SecureBytes.Backing();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = v19;
  if (a1 < 0) {
    goto LABEL_24;
  }
  uint64_t v20 = (const void *)result;
  uint64_t v21 = (char *)*v5;
  uint64_t result = swift_beginAccess();
  uint64_t v22 = *((void *)v21 + 2);
  if (v22 < a2)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return result;
  }

  sub_188F16810(v21, 0LL, a1);
  sub_188F169E8(a3, a4);
  sub_188F16810((char *)*v5, a2, v22);
  *uint64_t v5 = v20;
  return swift_release();
}

uint64_t sub_188F1787C(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  int64_t v10 = (char *)*v4 + 16;
  uint64_t result = swift_beginAccess();
  int64_t v12 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_20;
  }

  int64_t v13 = *v10 - v12;
  if (__OFSUB__(*v10, v12))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  uint64_t result = sub_188F2A5CC();
  BOOL v14 = __OFADD__(v13, result);
  uint64_t v15 = v13 + result;
  if (v14)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result)
  {
    uint64_t result = _swift_stdlib_malloc_size(*v5);
    if (result - 32 >= v15)
    {
      if (a2 >= a1) {
        return sub_188F17C4C(a1, a2, a3, a4);
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

  type metadata accessor for SecureBytes.Backing();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = v19;
  if (a1 < 0) {
    goto LABEL_24;
  }
  uint64_t v20 = (const void *)result;
  uint64_t v21 = (char *)*v5;
  uint64_t result = swift_beginAccess();
  uint64_t v22 = *((void *)v21 + 2);
  if (v22 < a2)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return result;
  }

  sub_188F16810(v21, 0LL, a1);
  sub_188F16AB8();
  sub_188F16810((char *)*v5, a2, v22);
  *uint64_t v5 = v20;
  return swift_release();
}

size_t sub_188F17A48(int64_t a1, int64_t a2, size_t a3)
{
  uint64_t v7 = v3 + 2;
  size_t result = swift_beginAccess();
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

  sub_188F189B8(a2, v10, v14);
  size_t result = sub_188F18A6C(a3, a1);
  uint64_t v15 = v3[2];
  uint64_t v16 = v15 + v14;
  if (!__OFADD__(v15, v14))
  {
    size_t result = swift_beginAccess();
    *uint64_t v7 = v16;
    return result;
  }

size_t sub_188F17B44(uint64_t a1, int64_t a2, void *a3, size_t a4)
{
  int64_t v9 = v4 + 2;
  size_t result = swift_beginAccess();
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

  int64_t v14 = v13 + a4;
  if (__OFADD__(v13, a4))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  size_t result = _swift_stdlib_malloc_size(v4);
  if ((uint64_t)(result - 32) < v14)
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

  sub_188F189B8(a2, v12, v16);
  size_t result = (size_t)sub_188F18ADC(a3, a4, a1);
  uint64_t v17 = v4[2];
  uint64_t v18 = v17 + v16;
  if (!__OFADD__(v17, v16))
  {
    size_t result = swift_beginAccess();
    *int64_t v9 = v18;
    return result;
  }

uint64_t sub_188F17C4C(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *(void *)(a4 - 8);
  MEMORY[0x1895F8858](a1);
  int64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v14);
  BOOL v15 = v5 + 2;
  uint64_t result = swift_beginAccess();
  int64_t v17 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_11;
  }

  int64_t v27 = a2;
  int64_t v18 = *v15 - v17;
  if (__OFSUB__(*v15, v17))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  uint64_t result = sub_188F2A5CC();
  BOOL v19 = __OFADD__(v18, result);
  int64_t v20 = v18 + result;
  if (v19)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v26 = a1;
  int64_t v21 = _swift_stdlib_malloc_size(v5) - 32;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, a4);
  if (v21 < v20)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  uint64_t result = sub_188F2A5CC();
  uint64_t v22 = result - v17;
  if (__OFSUB__(result, v17))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  uint64_t result = v27;
  if (*v15 < v27)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  sub_188F189B8(v27, *v15, v22);
  sub_188F18B84(a3, v26, a4);
  uint64_t result = sub_188F2A5CC();
  uint64_t v23 = result - v17;
  if (__OFSUB__(result, v17))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  BOOL v19 = __OFADD__(*v15, v23);
  int64_t v24 = *v15 + v23;
  if (!v19)
  {
    *BOOL v15 = v24;
    return result;
  }

uint64_t sub_188F17DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  int64_t v12 = &v16[-v11];
  int64_t v17 = v3;
  uint64_t result = sub_188F2A5B4();
  if (v18 == 1)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
    sub_188F2A5A8();
    swift_getAssociatedConformanceWitness();
    sub_188F2A638();
    if ((v20 & 1) == 0)
    {
      size_t v14 = v19;
      do
      {
        uint64_t v15 = *v3;
        swift_beginAccess();
        sub_188F17538(*(void *)(v15 + 16), *(void *)(v15 + 16), v14);
        sub_188F2A638();
        size_t v14 = v19;
      }

      while (v20 != 1);
    }

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
  }

  return result;
}

uint64_t sub_188F17FAC@<X0>(void *a1@<X8>)
{
  if (qword_18C7592F0 != -1) {
    swift_once();
  }
  *a1 = qword_18C759320;
  return swift_retain();
}

uint64_t sub_188F17FFC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8LL))(a2, a3);
}

uint64_t sub_188F18050@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_188F19A58(*a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_188F18078()
{
  return sub_188F2A5F0();
}

uint64_t sub_188F18090(unsigned __int8 *a1)
{
  uint64_t v2 = *v1;
  size_t v3 = *a1;
  swift_beginAccess();
  return sub_188F17538(*(void *)(v2 + 16), *(void *)(v2 + 16), v3);
}

uint64_t sub_188F180E8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8LL))(a1, a2);
}

uint64_t sub_188F18124(unsigned __int8 *a1, int64_t *a2)
{
  return sub_188F17538(*a2, *a2, *a1);
}

uint64_t sub_188F18134()
{
  return sub_188F2A5E4();
}

uint64_t sub_188F1814C@<X0>(int64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  int64_t v4 = *a1;
  uint64_t v5 = *v2;
  uint64_t result = swift_beginAccess();
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
    uint64_t result = sub_188F1986C(v4, v7);
    *a2 = v8;
    return result;
  }

uint64_t sub_188F181CC(int64_t *a1)
{
  return sub_188F1986C(*a1, a1[1]);
}

void sub_188F181D8(_WORD *a1@<X8>)
{
  *a1 = 256;
}

uint64_t sub_188F181E4()
{
  return 0LL;
}

int64_t sub_188F181EC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v3 = *v1;
  int64_t result = swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 16);
  if (!v5)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  char v6 = *(_BYTE *)(v3 + 32);
  int64_t result = sub_188F16E84(0LL, 1LL, v5, v3);
  if ((v7 & 1) == 0)
  {
    if ((result & 0x8000000000000000LL) == 0)
    {
      int64_t result = sub_188F1986C(0LL, result);
      *a1 = v6;
      return result;
    }

    goto LABEL_6;
  }

int64_t sub_188F18274(int64_t result)
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
      swift_beginAccess();
      int64_t result = sub_188F16E84(0LL, v2, *(void *)(v3 + 16), v3);
      if ((v4 & 1) != 0)
      {
LABEL_9:
        __break(1u);
        return result;
      }

      if ((result & 0x8000000000000000LL) == 0) {
        return sub_188F1986C(0LL, result);
      }
    }

    __break(1u);
    goto LABEL_9;
  }

  return result;
}

uint64_t sub_188F182F8(char a1)
{
  uint64_t v2 = *v1;
  if ((a1 & 1) != 0)
  {
    swift_beginAccess();
    int64_t v3 = *(void *)(v2 + 16);
    if ((v3 & 0x8000000000000000LL) == 0) {
      return sub_188F1986C(0LL, v3);
    }
    __break(1u);
    goto LABEL_7;
  }

  swift_release();
  if (qword_18C7592F0 != -1) {
LABEL_7:
  }
    swift_once();
  *uint64_t v1 = qword_18C759320;
  return swift_retain();
}

uint64_t sub_188F18394(uint64_t (*a1)(char *))
{
  return sub_188F183A8(a1);
}

uint64_t sub_188F183A8(uint64_t (*a1)(char *))
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)(*v1 + 16LL);
  swift_retain();
  uint64_t result = swift_beginAccess();
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
      return swift_release();
    }
    if ((result & 1) != 0)
    {
      uint64_t result = swift_release();
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
          return sub_188F1986C(v7, v10);
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

uint64_t sub_188F1852C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3 + 32, a3 + 32 + *(void *)(a3 + 16));
}

uint64_t sub_188F185A0(uint64_t (*a1)(uint64_t, uint64_t))
{
  return a1(v1 + 32, v1 + 32 + *(void *)(v1 + 16));
}

uint64_t sub_188F18610@<X0>(uint64_t (*a1)(uint64_t, void)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t result = a1(v3 + 32, *(void *)(v3 + 16));
  if (!v4) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56LL))(a3, 0LL, 1LL, a2);
  }
  return result;
}

uint64_t sub_188F186A8(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2)
{
  return sub_188F1852C(a1, a2, *v2);
}

uint64_t sub_188F186C0@<X0>(void *a1@<X8>)
{
  *a1 = *v1;
  return swift_retain();
}

uint64_t sub_188F186CC()
{
  return sub_188F2A200();
}

uint64_t sub_188F186F0()
{
  return sub_188F2A23C();
}

uint64_t sub_188F18718()
{
  return sub_188F2A224();
}

uint64_t sub_188F18728()
{
  return sub_188F2A218();
}

uint64_t sub_188F18740()
{
  return sub_188F2A20C();
}

uint64_t sub_188F1875C()
{
  return sub_188F2A29C();
}

uint64_t sub_188F18774()
{
  return sub_188F2A758();
}

uint64_t sub_188F187B8()
{
  return sub_188F2A74C();
}

uint64_t sub_188F187E0()
{
  return sub_188F2A758();
}

void *sub_188F18820(void *result, void *a2)
{
  if (!__OFSUB__(*a2, *result)) {
    return (void *)(*a2 == *result);
  }
  __break(1u);
  return result;
}

BOOL sub_188F1883C(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL sub_188F18850(void *a1, void *a2)
{
  return *a2 >= *a1;
}

BOOL sub_188F18864(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL sub_188F18878(void *a1, void *a2)
{
  return *a2 < *a1;
}

void *sub_188F1888C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(*result, *v2)) {
    __break(1u);
  }
  else {
    *a2 = *result - *v2;
  }
  return result;
}

void *sub_188F188A8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*v2, *result)) {
    __break(1u);
  }
  else {
    *a2 = *v2 + *result;
  }
  return result;
}

void *sub_188F188C4(void *result, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
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

uint64_t sub_188F188E8()
{
  return swift_deallocClassInstance();
}

uint64_t sub_188F18938()
{
  return type metadata accessor for SecureBytes.Backing();
}

ValueMetadata *type metadata accessor for SecureBytes()
{
  return &type metadata for SecureBytes;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
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

ValueMetadata *type metadata accessor for SecureBytes.BackingHeader()
{
  return &type metadata for SecureBytes.BackingHeader;
}

size_t sub_188F189B8(size_t result, int64_t a2, uint64_t a3)
{
  if ((result & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v4 = v3;
  size_t v7 = result;
  __n128 result = _swift_stdlib_malloc_size(v4);
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

  __n128 result = _swift_stdlib_malloc_size(v4);
  if ((uint64_t)(result - 32) >= v10)
  {
    _swift_stdlib_malloc_size(v4);
    return (size_t)memmove(&v4[v8 + 32], &v4[v7 + 32], a2 - v7);
  }

size_t sub_188F18A6C(size_t result, int64_t a2)
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
  __n128 result = _swift_stdlib_malloc_size(v2);
  if ((uint64_t)(result - 32) < v4)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  if (v4 >= a2)
  {
    __n128 result = _swift_stdlib_malloc_size(v2);
    *((_BYTE *)v2 + a2 + 32) = v5;
    return result;
  }

LABEL_9:
  __break(1u);
  return result;
}

void *sub_188F18ADC(void *result, size_t a2, uint64_t a3)
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
  __n128 result = (void *)_swift_stdlib_malloc_size(v7);
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

  __n128 result = (void *)_swift_stdlib_malloc_size(v7);
  if (v8)
  {
    if ((a2 & 0x8000000000000000LL) == 0) {
      return memmove(&v7[a3 + 32], v8, a2);
    }
    goto LABEL_13;
  }

  return result;
}

uint64_t sub_188F18B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v4 = v3;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t result = MEMORY[0x1895F8858](a1);
  char v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v12 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, a3);
  uint64_t result = sub_188F2A5CC();
  int64_t v13 = a2 + result;
  if (__OFADD__(a2, result))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  int64_t v14 = _swift_stdlib_malloc_size(v4) - 32;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, a3);
  if (v14 < v13)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  uint64_t result = sub_188F2A5CC();
  if (__OFADD__(a2, result))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  if (a2 + result >= a2)
  {
    _swift_stdlib_malloc_size(v4);
    return sub_188F2A644();
  }

uint64_t sub_188F18CA8(uint64_t (*a1)(uint64_t, uint64_t))
{
  return sub_188F185A0(a1);
}

unint64_t sub_188F18CCC()
{
  unint64_t result = qword_18C759338;
  if (!qword_18C759338)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&unk_188F2ABC0, &type metadata for SecureBytes.Index);
    atomic_store(result, (unint64_t *)&qword_18C759338);
  }

  return result;
}

uint64_t sub_188F18D10()
{
  return MEMORY[0x189618758];
}

uint64_t sub_188F18D1C()
{
  return MEMORY[0x189618790];
}

unint64_t sub_188F18D2C()
{
  unint64_t result = qword_18C759340;
  if (!qword_18C759340)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&unk_188F2AC08, &type metadata for SecureBytes.Index);
    atomic_store(result, (unint64_t *)&qword_18C759340);
  }

  return result;
}

unint64_t sub_188F18D74()
{
  unint64_t result = qword_18C759348;
  if (!qword_18C759348)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&unk_188F2ACB0, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_18C759348);
  }

  return result;
}

unint64_t sub_188F18DBC()
{
  unint64_t result = qword_18C759350;
  if (!qword_18C759350)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&unk_188F2AE20, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_18C759350);
  }

  return result;
}

unint64_t sub_188F18E04()
{
  unint64_t result = qword_18C759358;
  if (!qword_18C759358)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&unk_188F2AD68, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_18C759358);
  }

  return result;
}

unint64_t sub_188F18E4C()
{
  unint64_t result = qword_18C759360;
  if (!qword_18C759360)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&unk_188F2AE90, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_18C759360);
  }

  return result;
}

uint64_t sub_188F18E90()
{
  return sub_188F19304(&qword_18C759368, &qword_18C759370, MEMORY[0x189619490]);
}

uint64_t sub_188F18EBC()
{
  return sub_188F1916C(&qword_18C759378, (uint64_t (*)(void))sub_188F18D74, MEMORY[0x189607400]);
}

unint64_t sub_188F18EEC()
{
  unint64_t result = qword_18C759388;
  if (!qword_18C759388)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&unk_188F2AD40, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_18C759388);
  }

  return result;
}

uint64_t sub_188F18F30()
{
  return sub_188F1916C(&qword_18C759390, (uint64_t (*)(void))sub_188F18EEC, MEMORY[0x189607408]);
}

unint64_t sub_188F18F60()
{
  unint64_t result = qword_18C759398;
  if (!qword_18C759398)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&unk_188F2AFA8, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_18C759398);
  }

  return result;
}

uint64_t sub_188F18FA4()
{
  return sub_188F1916C(&qword_18C7593A0, (uint64_t (*)(void))sub_188F18E04, MEMORY[0x18961A5F0]);
}

uint64_t sub_188F18FD0()
{
  return sub_188F1916C(&qword_18C7593A8, (uint64_t (*)(void))sub_188F18DBC, MEMORY[0x18961A5D0]);
}

unint64_t sub_188F19000()
{
  unint64_t result = qword_18C7593B0;
  if (!qword_18C7593B0)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&unk_188F2AEE0, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_18C7593B0);
  }

  return result;
}

uint64_t sub_188F19044()
{
  return sub_188F1926C(&qword_18C7593B8, MEMORY[0x189618A58]);
}

unint64_t sub_188F19068()
{
  unint64_t result = qword_18C7593C8;
  if (!qword_18C7593C8)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&unk_188F2AB68, &type metadata for SecureBytes.Index);
    atomic_store(result, (unint64_t *)&qword_18C7593C8);
  }

  return result;
}

unint64_t sub_188F190AC()
{
  unint64_t result = qword_18C7593D0;
  if (!qword_18C7593D0)
  {
    unint64_t result = MEMORY[0x1895DA4D4](MEMORY[0x189618768], MEMORY[0x189618740]);
    atomic_store(result, (unint64_t *)&qword_18C7593D0);
  }

  return result;
}

uint64_t sub_188F190F0()
{
  return sub_188F1916C(&qword_18C7593D8, (uint64_t (*)(void))sub_188F18E4C, MEMORY[0x18961A5E0]);
}

uint64_t sub_188F1911C()
{
  return sub_188F1926C(&qword_18C7593E0, MEMORY[0x189618A40]);
}

uint64_t sub_188F19140()
{
  return sub_188F1916C(&qword_18C7593E8, (uint64_t (*)(void))sub_188F19000, MEMORY[0x18961A5C8]);
}

uint64_t sub_188F1916C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C759380);
    uint64_t v8 = a2();
    uint64_t result = MEMORY[0x1895DA4D4](a3, v7, &v8);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_188F191D4()
{
  return sub_188F19304(&qword_18C7593F0, &qword_18C7593F8, MEMORY[0x189619678]);
}

unint64_t sub_188F19204()
{
  unint64_t result = qword_18C759400;
  if (!qword_18C759400)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&unk_188F2AF40, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_18C759400);
  }

  return result;
}

uint64_t sub_188F19248()
{
  return sub_188F1926C(&qword_18C759408, MEMORY[0x189618A60]);
}

uint64_t sub_188F1926C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C7593C0);
    v6[0] = sub_188F19068();
    v6[1] = sub_188F190AC();
    uint64_t result = MEMORY[0x1895DA4D4](a2, v5, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_188F192D8()
{
  return sub_188F19304(&qword_18C759410, &qword_18C759380, MEMORY[0x18961A5E8]);
}

uint64_t sub_188F19304(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = MEMORY[0x1895DA4D4](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_188F19344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = a2 - a1;
  if (a1) {
    uint64_t v7 = a2 - a1;
  }
  else {
    uint64_t v7 = 0LL;
  }
  if (v7 != *(void *)(a3 + 16)) {
    return 0LL;
  }
  if (a1) {
    return cc_cmp_safe() == 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_188F193D0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *a1;
  uint64_t result = swift_beginAccess();
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

LABEL_6:
  if (__OFSUB__(a5, a4))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  if (a4 != a5)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  return result;
}

uint64_t sub_188F194E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return MEMORY[0x18961AFE8];
  }
  if (v2 <= 0)
  {
    uint64_t v3 = MEMORY[0x18961AFE8];
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C759418);
    uint64_t v3 = swift_allocObject();
    size_t v4 = _swift_stdlib_malloc_size((const void *)v3);
    *(void *)(v3 + 16) = v2;
    *(void *)(v3 + 24) = 2 * v4 - 64;
  }

  uint64_t v5 = sub_188F1705C((uint64_t)&v7, (_BYTE *)(v3 + 32), v2, a1);
  swift_retain();
  uint64_t result = swift_release();
  if (v5 == v2) {
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_188F195C0(uint64_t (*a1)(char *))
{
  uint64_t v4 = *v1;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5 < 1) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  uint64_t v7 = v4 + 32;
  uint64_t v8 = v4 + 31;
  do
  {
    char v14 = *(_BYTE *)(v7 + v6);
    char v9 = a1(&v14);
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
        char v14 = *(_BYTE *)(v8 + v5);
        uint64_t result = a1(&v14);
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

LABEL_3:
    ++v6;
  }

  while (v6 < v5);
  return v6;
}

size_t sub_188F196E8()
{
  size_t v1 = _swift_stdlib_malloc_size(v0) - 32;
  size_t result = swift_beginAccess();
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

size_t sub_188F19768(int64_t a1, int64_t a2)
{
  uint64_t v5 = v2 + 2;
  size_t result = swift_beginAccess();
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

  size_t result = sub_188F189B8(a2, v8, v10);
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
    size_t result = swift_beginAccess();
    *uint64_t v5 = v12;
    return result;
  }

uint64_t sub_188F1986C(int64_t a1, int64_t a2)
{
  int64_t v3 = v2;
  uint64_t v6 = (char *)*v2 + 16;
  uint64_t result = swift_beginAccess();
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

  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result)
  {
    uint64_t result = _swift_stdlib_malloc_size(*v3);
    if (result - 32 >= v9)
    {
      if (a2 >= a1) {
        return sub_188F19768(a1, a2);
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

  type metadata accessor for SecureBytes.Backing();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = v13;
  if (a1 < 0) {
    goto LABEL_22;
  }
  char v14 = (const void *)result;
  uint64_t v15 = (char *)*v3;
  uint64_t result = swift_beginAccess();
  uint64_t v16 = *((void *)v15 + 2);
  if (v16 < a2)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    return result;
  }

  sub_188F16810(v15, 0LL, a1);
  sub_188F196E8();
  sub_188F16810((char *)*v3, a2, v16);
  *int64_t v3 = v14;
  return swift_release();
}

uint64_t sub_188F199E8(void *a1, size_t a2)
{
  uint64_t v5 = **(void **)(v2 + 16);
  swift_beginAccess();
  return sub_188F176D4(*(void *)(v5 + 16), *(void *)(v5 + 16), a1, a2);
}

uint64_t sub_188F19A58(size_t a1, uint64_t a2)
{
  if (qword_18C7592F0 != -1) {
    swift_once();
  }
  uint64_t result = qword_18C759320;
  uint64_t v5 = qword_18C759320;
  if (!a2) {
    return swift_retain();
  }
  if (a2 < 0)
  {
    __break(1u);
  }

  else
  {
    swift_retain();
    do
    {
      swift_beginAccess();
      sub_188F17538(*(void *)(v5 + 16), *(void *)(v5 + 16), a1);
      --a2;
    }

    while (a2);
    return v5;
  }

  return result;
}

ValueMetadata *type metadata accessor for SecureBytes.Index()
{
  return &type metadata for SecureBytes.Index;
}

uint64_t HandshakeState.e.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 84);
  swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_188F2A5FC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, v4, v5);
}

uint64_t HandshakeState.e.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 84);
  swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_188F2A5FC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40LL))(v4, a1, v5);
}

uint64_t (*HandshakeState.e.modify())()
{
  return nullsub_1;
}

void HandshakeState.init(handshakePattern:isInitiator:prologue:psk:responderStaticPriv:responderStaticPublic:initiatorStaticPriv:initiatorStaticPublic:)( int a1@<W1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v35 = a7;
  uint64_t v36 = a6;
  uint64_t v37 = a5;
  uint64_t v33 = a4;
  uint64_t v43 = a2;
  uint64_t v44 = a3;
  int v32 = a1;
  uint64_t v47 = a15;
  uint64_t v45 = a12;
  uint64_t v31 = a11;
  uint64_t v46 = a14;
  uint64_t v34 = a9;
  swift_getAssociatedTypeWitness();
  uint64_t v39 = sub_188F2A5FC();
  uint64_t v41 = *(void *)(v39 - 8);
  uint64_t v16 = MEMORY[0x1895F8858](v39);
  v30[8] = (char *)v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = MEMORY[0x1895F8858](v16);
  v30[6] = (char *)v30 - v19;
  uint64_t v20 = MEMORY[0x1895F8858](v18);
  v30[7] = (char *)v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v20);
  v30[4] = (char *)v30 - v22;
  uint64_t v42 = a13;
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  uint64_t v38 = sub_188F2A5FC();
  uint64_t v40 = *(void *)(v38 - 8);
  uint64_t v23 = MEMORY[0x1895F8858](v38);
  v30[5] = (char *)v30 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = MEMORY[0x1895F8858](v23);
  v30[2] = (char *)v30 - v26;
  uint64_t v27 = MEMORY[0x1895F8858](v25);
  v30[3] = (char *)v30 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v27);
  v30[1] = (char *)v30 - v29;
  *(_OWORD *)(a8 + 8) = 0u;
  *(_OWORD *)(a8 + 24) = 0u;
  uint64_t v48 = a10;
  uint64_t v49 = v31;
  uint64_t v50 = v45;
  uint64_t v51 = a13;
  uint64_t v52 = v46;
  uint64_t v53 = v47;
  type metadata accessor for HandshakeState();
}

void type metadata accessor for HandshakeState()
{
}

uint64_t sub_188F1A814( unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v33 = a4;
  uint64_t v34 = a7;
  uint64_t v31 = a3;
  uint64_t v32 = a6;
  uint64_t v29 = a2;
  uint64_t v30 = a5;
  uint64_t v8 = sub_188F2A4F4();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  unsigned int v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unsigned __int8 v12 = *a1;
  uint64_t v13 = *((void *)a1 + 1);
  if (v13)
  {
    if (*(void *)(v13 + 16))
    {
      v26[3] = *a1;
      uint64_t v27 = v9;
      uint64_t v28 = v8;
      swift_bridgeObjectRetain();
      __asm { BR              X9 }
    }

    uint64_t v35 = MEMORY[0x18961AFE8];
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C759428);
    sub_188F208A8();
    sub_188F2A4B8();
    swift_bridgeObjectRelease();
  }

  uint64_t v35 = 0LL;
  unint64_t v36 = 0xE000000000000000LL;
  sub_188F2A668();
  swift_bridgeObjectRelease();
  uint64_t v35 = 0x5F6573696F4ELL;
  unint64_t v36 = 0xE600000000000000LL;
  if (qword_18C7592F8 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_18C759540;
  if (!*(void *)(qword_18C759540 + 16))
  {
    __break(1u);
    goto LABEL_13;
  }

  unint64_t v15 = sub_188F25854(v12);
  if ((v16 & 1) == 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v17 = (uint64_t *)(*(void *)(v14 + 56) + 32 * v15);
  uint64_t v18 = *v17;
  uint64_t v19 = v17[1];
  uint64_t v21 = v17[2];
  uint64_t v20 = v17[3];
  swift_bridgeObjectRetain();
  MEMORY[0x1895DA0FC](v18, v19, v21, v20);
  swift_bridgeObjectRelease();
  sub_188F2A554();
  swift_bridgeObjectRelease();
  sub_188F2A554();
  swift_bridgeObjectRelease();
  sub_188F2A554();
  (*(void (**)(void))(v30 + 24))();
  sub_188F2A554();
  swift_bridgeObjectRelease();
  sub_188F2A554();
  (*(void (**)(void))(v32 + 48))();
  sub_188F2A554();
  swift_bridgeObjectRelease();
  sub_188F2A554();
  (*(void (**)(void))(v34 + 16))();
  sub_188F2A554();
  swift_bridgeObjectRelease();
  sub_188F2A4E8();
  uint64_t v22 = sub_188F2A4DC();
  unint64_t v24 = v23;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v24 >> 60 == 15)
  {
LABEL_14:
    __break(1u);
    JUMPOUT(0x188F1ABE0LL);
  }

  return v22;
}

void sub_188F1ABF4(char *a1, uint64_t a2)
{
  uint64_t v49 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_188F2A5FC();
  uint64_t v45 = *(void *)(v5 - 8);
  uint64_t v46 = v5;
  uint64_t v6 = MEMORY[0x1895F8858](v5);
  uint64_t v43 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)&v42 - v8;
  uint64_t v44 = *(void *)(*(void *)(*(void *)(swift_getAssociatedConformanceWitness() + 8) + 8LL) + 8LL);
  uint64_t v47 = swift_getAssociatedTypeWitness();
  uint64_t v48 = sub_188F2A5FC();
  uint64_t v50 = *(void *)(v48 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](v48);
  uint64_t v11 = MEMORY[0x1895F8858](v10);
  uint64_t v13 = (char *)&v42 - v12;
  uint64_t v14 = MEMORY[0x1895F8858](v11);
  char v16 = (char *)&v42 - v15;
  uint64_t v17 = MEMORY[0x1895F8858](v14);
  uint64_t v19 = (char *)&v42 - v18;
  uint64_t v20 = MEMORY[0x1895F8858](v17);
  uint64_t v22 = (char *)&v42 - v21;
  MEMORY[0x1895F8858](v20);
  uint64_t v25 = (char *)&v42 - v24;
  char v26 = *a1;
  if (*(_BYTE *)(v2 + 1) != 1)
  {
    uint64_t v42 = v23;
    char v54 = v26;
    sub_188F238C0();
    uint64_t v30 = v48;
    if ((v34 & 1) != 0)
    {
      uint64_t v35 = v49;
      (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v13, v2 + *(int *)(v49 + 88), v48);
      uint64_t v36 = v47;
      uint64_t v37 = *(void *)(v47 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v13, 1LL, v47) == 1)
      {
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }

      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v16, v13, v36);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v16, 0LL, 1LL, v36);
      sub_188F1B09C((uint64_t)v16, v35);
      (*(void (**)(char *, uint64_t))(v50 + 8))(v16, v30);
    }

    char v53 = v26;
    sub_188F233BC();
    uint64_t v38 = v2;
    uint64_t v27 = v49;
    if ((v39 & 1) == 0) {
      return;
    }
    uint64_t v40 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v43, v38 + *(int *)(v49 + 80), v46);
    uint64_t v41 = *(void *)(AssociatedTypeWitness - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v40, 1LL, AssociatedTypeWitness) != 1)
    {
      uint64_t v22 = v42;
      sub_188F2A3BC();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v40, AssociatedTypeWitness);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56LL))(v22, 0LL, 1LL, v47);
      goto LABEL_14;
    }

LABEL_19:
    __break(1u);
    return;
  }

  char v52 = *a1;
  sub_188F238C0();
  uint64_t v27 = v49;
  if ((v28 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v9, v2 + *(int *)(v49 + 80), v46);
    uint64_t v29 = *(void *)(AssociatedTypeWitness - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v9, 1LL, AssociatedTypeWitness) == 1)
    {
      __break(1u);
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }

    sub_188F2A3BC();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v9, AssociatedTypeWitness);
    (*(void (**)(char *, void, uint64_t))(*(void *)(v47 - 8) + 56LL))(v25, 0LL, 1LL);
    sub_188F1B09C((uint64_t)v25, v27);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v25, v48);
  }

  char v51 = v26;
  sub_188F233BC();
  uint64_t v30 = v48;
  if ((v31 & 1) == 0) {
    return;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v19, v2 + *(int *)(v27 + 88), v48);
  uint64_t v32 = v47;
  uint64_t v33 = *(void *)(v47 - 8);
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v22, v19, v32);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v22, 0LL, 1LL, v32);
LABEL_14:
  sub_188F1B09C((uint64_t)v22, v27);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v22, v30);
}

uint64_t sub_188F1B09C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_188F2A5FC();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v14 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v14 - v7, a1, v5);
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1LL, AssociatedTypeWitness) != 1)
  {
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 8))( AssociatedTypeWitness,  AssociatedConformanceWitness);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v8, AssociatedTypeWitness);
    uint64_t v12 = *(void *)(a2 + 48);
    uint64_t v13 = *(void *)(*(void *)(a2 + 56) + 8LL);
    __int128 v14 = *(_OWORD *)(a2 + 24);
    uint64_t v15 = v12;
    uint64_t v16 = v13;
    type metadata accessor for SymmetricState();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_188F1B274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = a3;
  uint64_t v42 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_188F2A5FC();
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  MEMORY[0x1895F8858](v5);
  uint64_t v38 = (char *)&v26 - v6;
  uint64_t v7 = sub_188F2A380();
  uint64_t v28 = *(void *)(v7 - 8);
  uint64_t v29 = v7;
  MEMORY[0x1895F8858](v7);
  char v34 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v32 = *(void *)(*(void *)(*(void *)(swift_getAssociatedConformanceWitness() + 8) + 8LL) + 8LL);
  uint64_t v9 = swift_getAssociatedTypeWitness();
  uint64_t v10 = sub_188F2A5FC();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  __int128 v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v12);
  uint64_t v16 = (char *)&v26 - v15;
  uint64_t v31 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
  uint64_t v37 = a1;
  LODWORD(a1) = v17(a1, 1LL, AssociatedTypeWitness);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v18(v16, v42, v10);
  if ((_DWORD)a1 == 1
    || (uint64_t v27 = *(void *)(v9 - 8),
        uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48),
        v19(v16, 1LL, v9) == 1))
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    sub_188F15A04();
    swift_allocError();
    *uint64_t v20 = 2;
    return swift_willThrow();
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  uint64_t v22 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v38, v37, v36);
  uint64_t result = v17((uint64_t)v22, 1LL, AssociatedTypeWitness);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_10;
  }

  v18(v14, v42, v10);
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v19)(v14, 1LL, v9);
  if ((_DWORD)result == 1)
  {
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v23 = v33;
  sub_188F2A3B0();
  if (!v23)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v9);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v22, AssociatedTypeWitness);
    uint64_t v24 = *(void *)(v30 + 48);
    uint64_t v25 = *(void *)(*(void *)(v30 + 56) + 8LL);
    __int128 v39 = *(_OWORD *)(v30 + 24);
    uint64_t v40 = v24;
    uint64_t v41 = v25;
    type metadata accessor for SymmetricState();
  }

  (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v22, AssociatedTypeWitness);
}

void HandshakeState.readPayload(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X10 }

void sub_188F1B8D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v43 = a3;
  uint64_t v55 = a2;
  uint64_t v50 = a1;
  uint64_t v52 = a6;
  uint64_t v53 = a9;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = sub_188F2A5FC();
  uint64_t v45 = *(void *)(v13 - 8);
  uint64_t v46 = v13;
  uint64_t v14 = MEMORY[0x1895F8858](v13);
  uint64_t v40 = (char *)v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  v36[4] = (char *)v36 - v17;
  uint64_t v18 = MEMORY[0x1895F8858](v16);
  v36[3] = (char *)v36 - v19;
  uint64_t v20 = MEMORY[0x1895F8858](v18);
  v36[2] = (char *)v36 - v21;
  uint64_t v22 = MEMORY[0x1895F8858](v20);
  v36[1] = (char *)v36 - v23;
  MEMORY[0x1895F8858](v22);
  __int128 v39 = (char *)v36 - v24;
  uint64_t v51 = a5;
  uint64_t v54 = a8;
  uint64_t v38 = type metadata accessor for CipherState(255LL, a5, a8, v25);
  uint64_t v37 = sub_188F2A5FC();
  v36[5] = *(void *)(v37 - 8);
  MEMORY[0x1895F8858](v37);
  uint64_t v49 = a7;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v42 = AssociatedTypeWitness;
  uint64_t v44 = swift_getAssociatedTypeWitness();
  uint64_t v26 = sub_188F2A5FC();
  uint64_t v47 = *(void *)(v26 - 8);
  uint64_t v48 = v26;
  uint64_t v27 = MEMORY[0x1895F8858](v26);
  uint64_t v28 = MEMORY[0x1895F8858](v27);
  uint64_t v29 = MEMORY[0x1895F8858](v28);
  uint64_t v30 = MEMORY[0x1895F8858](v29);
  uint64_t v31 = MEMORY[0x1895F8858](v30);
  uint64_t v32 = MEMORY[0x1895F8858](v31);
  uint64_t v33 = MEMORY[0x1895F8858](v32);
  uint64_t v34 = MEMORY[0x1895F8858](v33);
  uint64_t v35 = MEMORY[0x1895F8858](v34);
  MEMORY[0x1895F8858](v35);
  __asm { BR              X10 }

void sub_188F1BC50()
{
  *(void *)(v2 - 176) = v0;
  uint64_t v3 = *(void *)(v2 - 168);
  *(void *)(v2 - 136) = v1;
  *(void *)(v2 - 128) = v3;
  uint64_t v4 = *(void *)(v2 - 184);
  *(void *)(v2 - 120) = *(void *)(v2 - 160);
  *(void *)(v2 - 112) = v4;
  uint64_t v5 = *(void *)(v2 - 152);
  *(void *)(v2 - 104) = *(void *)(v2 - 144);
  *(void *)(v2 - 96) = v5;
  type metadata accessor for HandshakeState();
}

uint64_t sub_188F1BC80(uint64_t a1)
{
  uint64_t v5 = *(void *)(v2 - 200);
  uint64_t v4 = *(void *)(v2 - 192);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v1, *(void *)(v2 - 72) + *(int *)(a1 + 92), v4);
  uint64_t v6 = *(void *)(v2 - 232);
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48LL))(v1, 1LL, v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
  if (v7 == 1)
  {
    *(void *)(v2 - 184) = a1;
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))( v6,  AssociatedConformanceWitness);
    uint64_t v10 = *(uint64_t **)(v2 - 240);
    uint64_t v11 = *v10;
    unint64_t v12 = v10[1];
    sub_188F15B18(*v10, v12);
    sub_188F2631C(v9, v11, v12);
    __asm { BR              X10 }
  }

  sub_188F15A04();
  swift_allocError();
  *uint64_t v13 = 2;
  return swift_willThrow();
}

void sub_188F1C848(uint64_t a1, uint64_t a2)
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[3] = MEMORY[0x189606D70];
  v3[4] = MEMORY[0x189606D58];
  v3[0] = a1;
  v3[1] = a2;
  uint64_t v2 = (char *)&loc_188F1C8AC
     + *((int *)qword_188F1CAE0 + (__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x189606D70])[1] >> 62));
  __asm { BR              X10 }

uint64_t sub_188F1C8BC()
{
  uint64_t v6 = v2;
  __int16 v7 = v3;
  char v8 = BYTE2(v3);
  char v9 = BYTE3(v3);
  char v10 = BYTE4(v3);
  char v11 = BYTE5(v3);
  sub_188F15B18(v1, v0);
  sub_188F293E0(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  sub_188F15B5C(v1, v0);
  uint64_t v4 = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  return v4;
}

uint64_t sub_188F1CAF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5 = type metadata accessor for TransportState(0LL, *(void *)(a1 + 24), *(void *)(a1 + 48), a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))(a3, 1LL, 1LL, v5);
}

uint64_t HandshakeState.writePayload(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = v4;
  __int128 v32 = xmmword_188F2B0C0;
  __int16 v7 = (uint64_t *)(v4 + *(int *)(a4 + 96));
  uint64_t v9 = v7[2];
  unint64_t v8 = v7[3];
  uint64_t v10 = v8 >> 1;
  if (v9 == v8 >> 1)
  {
    sub_188F15A04();
    swift_allocError();
    *char v11 = 3;
    swift_willThrow();
    goto LABEL_13;
  }

  if (v9 >= (uint64_t)(v8 >> 1))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    JUMPOUT(0x188F1CF54LL);
  }

  uint64_t v14 = *v7;
  uint64_t v13 = v7[1];
  sub_188F1DF10(v13 + 40 * v9, (uint64_t)v29);
  if (__OFSUB__(v10, v9)) {
    goto LABEL_14;
  }
  *__int16 v7 = v14;
  v7[1] = v13;
  v7[2] = v9 + 1;
  v7[3] = v8;
  uint64_t v15 = v30;
  uint64_t v16 = v31;
  __swift_project_boxed_opaque_existential_1(v29, v30);
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(v15, v16);
  uint64_t v18 = *(void *)(v17 + 16);
  if (!v18)
  {
    swift_bridgeObjectRelease();
    __asm { BR              X12 }
  }

  uint64_t v33 = v6;
  uint64_t v19 = 0LL;
  uint64_t v20 = (void *)a4;
  uint64_t v21 = *(void *)(a4 + 16);
  uint64_t v23 = v20[3];
  uint64_t v22 = v20[4];
  uint64_t v24 = v20[5];
  uint64_t v10 = v20[6];
  uint64_t v25 = v20[7];
  while (1)
  {
    LOBYTE(v28) = *(_BYTE *)(v17 + v19 + 32);
    sub_188F1CF88((uint64_t)&v28, v33, (uint64_t)&v32, v21, v23, v22, v24, v10, v25);
    if (v5) {
      break;
    }
    if (v18 == ++v19)
    {
      swift_bridgeObjectRelease();
      __asm { BR              X13 }
    }
  }

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
LABEL_13:
  sub_188F15B5C(v32, *((unint64_t *)&v32 + 1));
  return v10;
}

void sub_188F1CF88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v55 = a5;
  uint64_t v56 = a8;
  uint64_t v57 = a6;
  v41[7] = a3;
  uint64_t v53 = a1;
  uint64_t v54 = a2;
  uint64_t v52 = a9;
  swift_getAssociatedTypeWitness();
  uint64_t v50 = a4;
  uint64_t v51 = a7;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v41[0] = *(void *)(AssociatedConformanceWitness + 8);
  v41[12] = *(void *)(*(void *)(v41[0] + 8LL) + 8LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = sub_188F2A5FC();
  uint64_t v46 = *(void *)(v12 - 8);
  uint64_t v47 = v12;
  uint64_t v13 = MEMORY[0x1895F8858](v12);
  v41[9] = (char *)v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = MEMORY[0x1895F8858](v13);
  v41[5] = (char *)v41 - v16;
  uint64_t v17 = MEMORY[0x1895F8858](v15);
  v41[4] = (char *)v41 - v18;
  uint64_t v19 = MEMORY[0x1895F8858](v17);
  v41[3] = (char *)v41 - v20;
  uint64_t v21 = MEMORY[0x1895F8858](v19);
  v41[2] = (char *)v41 - v22;
  MEMORY[0x1895F8858](v21);
  v41[8] = (char *)v41 - v23;
  uint64_t v24 = swift_checkMetadataState();
  uint64_t v45 = *(void *)(v24 - 8);
  uint64_t v25 = MEMORY[0x1895F8858](v24);
  v41[10] = (char *)v41 - v26;
  uint64_t v43 = AssociatedTypeWitness;
  v41[11] = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v27 = MEMORY[0x1895F8858](v25);
  v41[1] = (char *)v41 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v27);
  v41[6] = (char *)v41 - v29;
  uint64_t v44 = v30;
  uint64_t v31 = sub_188F2A5FC();
  uint64_t v48 = *(void *)(v31 - 8);
  uint64_t v49 = v31;
  uint64_t v32 = MEMORY[0x1895F8858](v31);
  uint64_t v33 = MEMORY[0x1895F8858](v32);
  uint64_t v34 = MEMORY[0x1895F8858](v33);
  uint64_t v35 = MEMORY[0x1895F8858](v34);
  uint64_t v36 = MEMORY[0x1895F8858](v35);
  uint64_t v37 = MEMORY[0x1895F8858](v36);
  uint64_t v38 = MEMORY[0x1895F8858](v37);
  uint64_t v39 = MEMORY[0x1895F8858](v38);
  uint64_t v40 = MEMORY[0x1895F8858](v39);
  MEMORY[0x1895F8858](v40);
  __asm { BR              X10 }

void sub_188F1D354()
{
  uint64_t v1 = *(void *)(v0 - 152);
  uint64_t v2 = *(void *)(v0 - 144);
  if ((**(_BYTE **)(v0 - 160) & 1) == 0)
  {
    *(void *)(v0 - 136) = *(void *)(v0 - 192);
    *(void *)(v0 - 128) = v1;
    uint64_t v3 = *(void *)(v0 - 184);
    *(void *)(v0 - 120) = *(void *)(v0 - 72);
    *(void *)(v0 - 112) = v3;
    uint64_t v4 = *(void *)(v0 - 176);
    *(void *)(v0 - 104) = v2;
    *(void *)(v0 - 96) = v4;
    type metadata accessor for HandshakeState();
  }

  *(void *)(v0 - 136) = *(void *)(v0 - 192);
  *(void *)(v0 - 128) = v1;
  uint64_t v5 = *(void *)(v0 - 184);
  uint64_t v6 = *(void *)(v0 - 176);
  *(void *)(v0 - 120) = *(void *)(v0 - 72);
  *(void *)(v0 - 112) = v5;
  *(void *)(v0 - 104) = v2;
  *(void *)(v0 - 96) = v6;
  type metadata accessor for HandshakeState();
}

void sub_188F1D44C(uint64_t a1)
{
  uint64_t v7 = *(void *)(v6 - 248);
  uint64_t v8 = *(void *)(v6 - 240);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v5, 1LL, v7) != 1)
  {
    uint64_t v9 = *(void *)(v6 - 320);
    sub_188F2A3BC();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
    uint64_t v10 = *(void *)(v6 - 256);
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 8))( v10,  AssociatedConformanceWitness);
    uint64_t v14 = v13;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 280) + 8LL))(v9, v10);
    sub_188F1DCF8(v12, v14);
    uint64_t v15 = *(void *)(v4 + 8);
    uint64_t v16 = *(void *)(v6 - 72);
    *(void *)(v6 - 136) = *(void *)(v6 - 152);
    *(void *)(v6 - 128) = v16;
    *(void *)(v6 - 120) = *(void *)(v6 - 144);
    *(void *)(v6 - 112) = v15;
    type metadata accessor for SymmetricState();
  }

  __break(1u);
  JUMPOUT(0x188F1DCDCLL);
}

void sub_188F1D558(void *a1)
{
  if (*(void *)(v3 + 8))
  {
    *(void *)(v4 - 136) = v2;
    *(void *)(v4 - 128) = v1;
    sub_188F26C04(v4 - 136, a1, MEMORY[0x189606D70]);
  }

  sub_188F15B5C(v2, v1);
  JUMPOUT(0x188F1DC58LL);
}

void sub_188F1D5A4()
{
  uint64_t v2 = *(void *)(v0 - 152);
  uint64_t v1 = *(void *)(v0 - 144);
  *(void *)(v0 - 136) = *(void *)(v0 - 192);
  *(void *)(v0 - 128) = v2;
  uint64_t v3 = *(void *)(v0 - 184);
  uint64_t v4 = *(void *)(v0 - 176);
  *(void *)(v0 - 120) = *(void *)(v0 - 72);
  *(void *)(v0 - 112) = v3;
  *(void *)(v0 - 104) = v1;
  *(void *)(v0 - 96) = v4;
  type metadata accessor for HandshakeState();
}

void sub_188F1D5CC(uint64_t a1)
{
  uint64_t v7 = *(void *)(v5 - 208);
  uint64_t v6 = *(void *)(v5 - 200);
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 16))(v1, *(void *)(v5 - 160) + *(int *)(a1 + 80), v6);
  uint64_t v8 = *(void *)(v5 - 248);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 240) + 48LL))(v1, 1LL, v8) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v6);
    JUMPOUT(0x188F1D620LL);
  }

  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v5 - 240) + 32LL))(*(void *)(v5 - 288), v1, v8);
  uint64_t v9 = *(void *)(v5 - 360);
  sub_188F2A3BC();
  uint64_t v10 = *(void *)(v5 - 256);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 8))(v10, AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 280) + 8LL))(v9, v10);
  uint64_t v12 = *(void *)(v3 + 8);
  uint64_t v13 = *(void *)(v5 - 72);
  *(void *)(v5 - 136) = v4;
  *(void *)(v5 - 128) = v13;
  *(void *)(v5 - 120) = v2;
  *(void *)(v5 - 112) = v12;
  type metadata accessor for SymmetricState();
}

void sub_188F1D648()
{
  uint64_t v1 = *(void *)(v0 - 152);
  *(void *)(v0 - 136) = *(void *)(v0 - 192);
  *(void *)(v0 - 128) = v1;
  uint64_t v2 = *(void *)(v0 - 184);
  *(void *)(v0 - 120) = *(void *)(v0 - 72);
  *(void *)(v0 - 112) = v2;
  uint64_t v3 = *(void *)(v0 - 176);
  *(void *)(v0 - 104) = *(void *)(v0 - 144);
  *(void *)(v0 - 96) = v3;
  type metadata accessor for HandshakeState();
}

void sub_188F1D678(uint64_t a1)
{
  uint64_t v4 = *(void *)(v2 - 160);
  uint64_t v6 = *(void *)(v2 - 208);
  uint64_t v5 = *(void *)(v2 - 200);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v1, v4 + *(int *)(a1 + 84), v5);
  uint64_t v7 = *(void *)(v2 - 232);
  uint64_t v8 = *(void *)(v2 - 304);
  uint64_t v9 = *(void *)(v2 - 224);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v8, v4 + *(int *)(a1 + 92), v9);
  sub_188F1B274(v1, v8, a1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v5);
  JUMPOUT(0x188F1DC58LL);
}

void sub_188F1D6B4()
{
  if (*(_BYTE *)(*(void *)(v0 - 160) + 1LL) == 1)
  {
    uint64_t v1 = *(void *)(v0 - 152);
    *(void *)(v0 - 136) = *(void *)(v0 - 192);
    *(void *)(v0 - 128) = v1;
    uint64_t v2 = *(void *)(v0 - 184);
    *(void *)(v0 - 120) = *(void *)(v0 - 72);
    *(void *)(v0 - 112) = v2;
    uint64_t v3 = *(void *)(v0 - 176);
    *(void *)(v0 - 104) = *(void *)(v0 - 144);
    *(void *)(v0 - 96) = v3;
    type metadata accessor for HandshakeState();
  }

  uint64_t v4 = *(void *)(v0 - 152);
  *(void *)(v0 - 136) = *(void *)(v0 - 192);
  *(void *)(v0 - 128) = v4;
  uint64_t v5 = *(void *)(v0 - 184);
  *(void *)(v0 - 120) = *(void *)(v0 - 72);
  *(void *)(v0 - 112) = v5;
  uint64_t v6 = *(void *)(v0 - 176);
  *(void *)(v0 - 104) = *(void *)(v0 - 144);
  *(void *)(v0 - 96) = v6;
  type metadata accessor for HandshakeState();
}

void sub_188F1D6F4(uint64_t a1)
{
  uint64_t v6 = *(void *)(v3 - 208);
  uint64_t v5 = *(void *)(v3 - 200);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v1, v2 + *(int *)(a1 + 84), v5);
  uint64_t v8 = *(void *)(v3 - 232);
  uint64_t v7 = *(void *)(v3 - 224);
  uint64_t v9 = *(void *)(v3 - 352);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v9, v2 + *(int *)(a1 + 88), v7);
  sub_188F1B274(v1, v9, a1);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v7);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v5);
  JUMPOUT(0x188F1DC58LL);
}

void sub_188F1D774()
{
  if (*(_BYTE *)(*(void *)(v0 - 160) + 1LL) == 1)
  {
    uint64_t v1 = *(void *)(v0 - 152);
    *(void *)(v0 - 136) = *(void *)(v0 - 192);
    *(void *)(v0 - 128) = v1;
    uint64_t v2 = *(void *)(v0 - 184);
    *(void *)(v0 - 120) = *(void *)(v0 - 72);
    *(void *)(v0 - 112) = v2;
    uint64_t v3 = *(void *)(v0 - 176);
    *(void *)(v0 - 104) = *(void *)(v0 - 144);
    *(void *)(v0 - 96) = v3;
    type metadata accessor for HandshakeState();
  }

  uint64_t v4 = *(void *)(v0 - 152);
  *(void *)(v0 - 136) = *(void *)(v0 - 192);
  *(void *)(v0 - 128) = v4;
  uint64_t v5 = *(void *)(v0 - 184);
  *(void *)(v0 - 120) = *(void *)(v0 - 72);
  *(void *)(v0 - 112) = v5;
  uint64_t v6 = *(void *)(v0 - 176);
  *(void *)(v0 - 104) = *(void *)(v0 - 144);
  *(void *)(v0 - 96) = v6;
  type metadata accessor for HandshakeState();
}

void sub_188F1D7B4(uint64_t a1)
{
  uint64_t v6 = *(void *)(v3 - 232);
  uint64_t v5 = *(void *)(v3 - 224);
  uint64_t v7 = *(void *)(v3 - 336);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v1 + *(int *)(a1 + 92), v5);
  sub_188F1B274(v2, v7, a1);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v5);
  JUMPOUT(0x188F1DC1CLL);
}

void sub_188F1D82C()
{
  uint64_t v1 = *(void *)(v0 - 152);
  *(void *)(v0 - 136) = *(void *)(v0 - 192);
  *(void *)(v0 - 128) = v1;
  uint64_t v2 = *(void *)(v0 - 184);
  *(void *)(v0 - 120) = *(void *)(v0 - 72);
  *(void *)(v0 - 112) = v2;
  uint64_t v3 = *(void *)(v0 - 176);
  *(void *)(v0 - 104) = *(void *)(v0 - 144);
  *(void *)(v0 - 96) = v3;
  type metadata accessor for HandshakeState();
}

void sub_188F1D85C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v2 - 160);
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)(v2 - 208) + 16LL))( v1,  v4 + *(int *)(a1 + 80),  *(void *)(v2 - 200));
  uint64_t v6 = *(void *)(v2 - 232);
  uint64_t v5 = *(void *)(v2 - 224);
  uint64_t v7 = *(void *)(v2 - 296);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v4 + *(int *)(a1 + 88), v5);
  sub_188F1B274(v1, v7, a1);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v5);
  JUMPOUT(0x188F1DC1CLL);
}

void sub_188F1D8D8()
{
  uint64_t v1 = *(void **)(v0 - 160);
  uint64_t v2 = v1[1];
  if (v2)
  {
    uint64_t v4 = v1[3];
    unint64_t v3 = v1[4];
    if (v4 == v3 >> 1)
    {
      __break(1u);
    }

    else
    {
      *(void *)(v0 - 208) = v3;
      *(void *)(v0 - 200) = v3 >> 1;
      *(void *)(v0 - 168) = v2;
      if (v4 < (uint64_t)(v3 >> 1))
      {
        *(void *)(v0 - 224) = v1[2];
        uint64_t v5 = *(void *)(v0 - 152);
        uint64_t v6 = *(void *)(v0 - 144);
        *(void *)(v0 - 136) = *(void *)(v0 - 192);
        *(void *)(v0 - 128) = v5;
        uint64_t v7 = *(void *)(v0 - 184);
        uint64_t v8 = *(void *)(v0 - 176);
        *(void *)(v0 - 120) = *(void *)(v0 - 72);
        *(void *)(v0 - 112) = v7;
        *(void *)(v0 - 104) = v6;
        *(void *)(v0 - 96) = v8;
        type metadata accessor for HandshakeState();
      }
    }

    __break(1u);
    JUMPOUT(0x188F1DCD4LL);
  }

  sub_188F15A04();
  swift_allocError();
  JUMPOUT(0x188F1DC4CLL);
}

void sub_188F1D938()
{
  uint64_t v7 = *(void *)(v4 + 8);
  swift_unknownObjectRetain();
  *(void *)(v6 - 136) = v0;
  *(void *)(v6 - 128) = v5;
  *(void *)(v6 - 120) = v3;
  *(void *)(v6 - 112) = v7;
  type metadata accessor for SymmetricState();
}

void sub_188F1D970(void *a1)
{
  if (!__OFSUB__(*(void *)(v6 - 200), v3))
  {
    uint64_t v7 = *(void *)(v6 - 224);
    v5[1] = v4;
    v5[2] = v7;
    uint64_t v8 = *(void *)(v6 - 208);
    v5[3] = v3 + 1;
    v5[4] = v8;
    swift_unknownObjectRelease();
    JUMPOUT(0x188F1D9B4LL);
  }

  __break(1u);
  JUMPOUT(0x188F1DCD8LL);
}

void sub_188F1DA84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(v7 - 216);
  uint64_t v9 = sub_188F2729C(v5, v4, a1, a4);
  if (v8)
  {
    (*(void (**)(void, uint64_t))(*(void *)(v7 - 240) + 8LL))(*(void *)(v7 - 288), v6);
    sub_188F15B5C(v5, v4);
  }

  else
  {
    uint64_t v11 = v9;
    unint64_t v12 = v10;
    sub_188F15B5C(v5, v4);
    sub_188F1DCF8(v11, v12);
    sub_188F15B5C(v11, v12);
    (*(void (**)(void, uint64_t))(*(void *)(v7 - 240) + 8LL))(*(void *)(v7 - 288), v6);
  }

  JUMPOUT(0x188F1DC58LL);
}

void sub_188F1DAF8(uint64_t a1)
{
  uint64_t v6 = *(void *)(v3 - 232);
  uint64_t v5 = *(void *)(v3 - 224);
  uint64_t v7 = *(void *)(v3 - 344);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v1 + *(int *)(a1 + 92), v5);
  sub_188F1B274(v2, v7, a1);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v5);
  JUMPOUT(0x188F1DC1CLL);
}

void sub_188F1DBA4(uint64_t a1)
{
}

void sub_188F1DCF8(uint64_t a1, uint64_t a2)
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[3] = MEMORY[0x189606D70];
  v3[4] = MEMORY[0x189606D58];
  v3[0] = a1;
  v3[1] = a2;
  uint64_t v2 = (char *)&loc_188F1DD5C
     + *((int *)qword_188F1DF00 + (__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x189606D70])[1] >> 62));
  __asm { BR              X10 }

uint64_t sub_188F1DD6C()
{
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v3);
}

uint64_t sub_188F1DF10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

uint64_t sub_188F1DF98()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_188F1DFA0()
{
  uint64_t result = sub_188F2A5FC();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    uint64_t result = sub_188F2A5FC();
    if (v2 <= 0x3F) {
      type metadata accessor for SymmetricState();
    }
  }

  return result;
}

_BYTE *sub_188F1E100(_BYTE *a1, _BYTE *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = v5;
  if (*(_DWORD *)(v4 + 84)) {
    uint64_t v7 = *(void *)(v4 + 64);
  }
  else {
    uint64_t v7 = *(void *)(v4 + 64) + 1LL;
  }
  uint64_t v69 = v7 + v5;
  swift_getAssociatedConformanceWitness();
  uint64_t v8 = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(v8 - 8);
  int v11 = *(_DWORD *)(v9 + 80);
  int v10 = *(_DWORD *)(v9 + 84);
  uint64_t v12 = v11;
  uint64_t v73 = v9;
  uint64_t v74 = v8;
  size_t v13 = *(void *)(v9 + 64);
  if (!v10) {
    ++v13;
  }
  size_t __n = v7;
  size_t v71 = v13 + v11;
  size_t v72 = v13;
  size_t v75 = v13 + 7;
  unint64_t v14 = (v13
       + 7
       + ((v71
         + ((v7
  uint64_t v15 = sub_188F2A3A4();
  uint64_t v16 = *(void *)(v15 - 8);
  int v17 = *(_DWORD *)(v16 + 80);
  uint64_t v18 = v17;
  unint64_t v19 = v17 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v77 = v16;
  uint64_t v78 = v15;
  uint64_t v20 = *(void *)(v16 + 64) + 7LL;
  unsigned int v76 = *(_DWORD *)(v16 + 84);
  if (v76) {
    unint64_t v21 = (v20 & 0xFFFFFFFFFFFFFFF8LL) + 8;
  }
  else {
    unint64_t v21 = (v20 & 0xFFFFFFFFFFFFFFF8LL) + 9;
  }
  unint64_t v22 = v11 | v5 | (unint64_t)v17;
  int v23 = (v11 | v5 | v17) & 0x100000;
  if (v22 <= 7
    && v23 == 0
    && ((v18 + 32 + v14) & v19) + ((v20 + ((v21 + v18) & ~v18)) & 0xFFFFFFFFFFFFFFF8LL) + 16 <= 0x18)
  {
    uint64_t v66 = v18 + 32;
    unint64_t v67 = v19;
    size_t v63 = v21;
    unint64_t v64 = (v20 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    uint64_t v65 = v21 + v18;
    uint64_t v68 = *(void *)(v16 + 64) + 7LL;
    unint64_t v28 = ~(unint64_t)v5;
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    uint64_t v29 = (void *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8LL);
    uint64_t v30 = (void *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8LL);
    *uint64_t v29 = *v30;
    v29[1] = v30[1];
    v29[2] = v30[2];
    void v29[3] = v30[3];
    uint64_t v31 = (void *)(((unint64_t)v29 + v6 + 32) & ~v6);
    uint64_t v32 = (void *)(((unint64_t)v30 + v6 + 32) & ~v6);
    uint64_t v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48);
    swift_unknownObjectRetain();
    uint64_t v34 = v33;
    if (v33((char *)v32, 1LL, AssociatedTypeWitness))
    {
      size_t v36 = __n;
      memcpy(v31, v32, __n);
    }

    else
    {
      (*(void (**)(void *, void *, uint64_t))(v4 + 16))(v31, v32, AssociatedTypeWitness);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v4 + 56))(v31, 0LL, 1LL, AssociatedTypeWitness);
      size_t v36 = __n;
    }

    uint64_t v37 = v34;
    uint64_t v38 = ~v12;
    uint64_t v39 = (void *)(((unint64_t)v31 + v69) & v28);
    uint64_t v40 = (char *)(((unint64_t)v32 + v69) & v28);
    if (v37(v40, 1LL, AssociatedTypeWitness))
    {
      memcpy(v39, v40, v36);
    }

    else
    {
      (*(void (**)(void *, char *, uint64_t))(v4 + 16))(v39, v40, AssociatedTypeWitness);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v4 + 56))(v39, 0LL, 1LL, AssociatedTypeWitness);
    }

    uint64_t v41 = &v40[v36];
    uint64_t v42 = (void *)(((unint64_t)v39 + v36 + v12) & v38);
    uint64_t v43 = (const void *)((unint64_t)&v41[v12] & v38);
    uint64_t v44 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v73 + 48);
    if (v44(v43, 1LL, v74))
    {
      size_t v45 = v72;
      memcpy(v42, v43, v72);
    }

    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v73 + 16))(v42, v43, v74);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v73 + 56))(v42, 0LL, 1LL, v74);
      size_t v45 = v72;
    }

    uint64_t v46 = (void *)(((unint64_t)v42 + v71) & v38);
    uint64_t v47 = (const void *)(((unint64_t)v43 + v71) & v38);
    if (v44(v47, 1LL, v74))
    {
      memcpy(v46, v47, v45);
    }

    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v73 + 16))(v46, v47, v74);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v73 + 56))(v46, 0LL, 1LL, v74);
    }

    uint64_t v48 = ~v18;
    uint64_t v49 = (void *)(((unint64_t)v46 + v75) & 0xFFFFFFFFFFFFFFF8LL);
    uint64_t v50 = (void *)(((unint64_t)v47 + v75) & 0xFFFFFFFFFFFFFFF8LL);
    void *v49 = *v50;
    v49[1] = v50[1];
    v49[2] = v50[2];
    v49[3] = v50[3];
    uint64_t v51 = (_BYTE *)(((unint64_t)v49 + v66) & v67);
    uint64_t v52 = (_DWORD *)(((unint64_t)v50 + v66) & v67);
    swift_unknownObjectRetain();
    if (v76)
    {
      uint64_t v53 = v78;
      if (!(*(unsigned int (**)(_DWORD *, void, uint64_t))(v77 + 48))(v52, v76, v78))
      {
LABEL_38:
        uint64_t v56 = *(void (**)(_BYTE *, _DWORD *, uint64_t))(v77 + 16);
        v56(v51, v52, v53);
        *(void *)((unint64_t)&v51[v68] & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v52 + v68) & 0xFFFFFFFFFFFFF8LL);
        if (!v76) {
          v51[v64] = 0;
        }
        goto LABEL_40;
      }
    }

    else
    {
      uint64_t v53 = v78;
      if (!*((_BYTE *)v52 + v64)) {
        goto LABEL_38;
      }
      int v54 = *((unsigned __int8 *)v52 + v64) - 1;
      int v55 = v64 & 0xFFFFFFF8;
      if ((v64 & 0xFFFFFFF8) != 0)
      {
        int v54 = 0;
        int v55 = *v52;
      }

      if ((v55 | v54) == 0xFFFFFFFF) {
        goto LABEL_38;
      }
    }

    memcpy(v51, v52, v63);
    uint64_t v56 = *(void (**)(_BYTE *, _DWORD *, uint64_t))(v77 + 16);
LABEL_40:
    unint64_t v57 = ((unint64_t)v52 + v65) & v48;
    v56((_BYTE *)((unint64_t)&v51[v65] & v48), (_DWORD *)v57, v53);
    v58 = (void *)((v68 + ((unint64_t)&v51[v65] & v48)) & 0xFFFFFFFFFFFFFFF8LL);
    uint64_t v59 = (uint64_t *)((v68 + v57) & 0xFFFFFFFFFFFFFFF8LL);
    uint64_t v60 = *v59;
    unint64_t v61 = v59[1];
    sub_188F15B18(*v59, v61);
    void *v58 = v60;
    v58[1] = v61;
    return a1;
  }

  uint64_t v26 = *(void *)a2;
  *(void *)a1 = *(void *)a2;
  uint64_t v27 = v26 + ((v22 & 0xF8 ^ 0x1F8) & (v22 + 16));
  swift_retain();
  return (_BYTE *)v27;
}

uint64_t sub_188F1E678(uint64_t a1)
{
  unint64_t v1 = (a1 + 10) & 0xFFFFFFFFFFFFFFF8LL;
  swift_unknownObjectRelease();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = v1 + v4 + 32;
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (!v6(v5 & ~v4, 1LL, AssociatedTypeWitness)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5 & ~v4, AssociatedTypeWitness);
  }
  if (*(_DWORD *)(v3 + 84)) {
    uint64_t v7 = *(void *)(v3 + 64);
  }
  else {
    uint64_t v7 = *(void *)(v3 + 64) + 1LL;
  }
  uint64_t v8 = ((v5 | v4) + v7) & ~v4;
  if (!v6(v8, 1LL, AssociatedTypeWitness)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v8, AssociatedTypeWitness);
  }
  uint64_t v9 = v8 + v7;
  swift_getAssociatedConformanceWitness();
  uint64_t v10 = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = v9 + v12;
  uint64_t v14 = (v9 + v12) & ~v12;
  uint64_t v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (!v15(v14, 1LL, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v10);
  }
  if (*(_DWORD *)(v11 + 84)) {
    uint64_t v16 = *(void *)(v11 + 64);
  }
  else {
    uint64_t v16 = *(void *)(v11 + 64) + 1LL;
  }
  uint64_t v17 = ((v13 | v12) + v16) & ~v12;
  if (!v15(v17, 1LL, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v17, v10);
  }
  unint64_t v18 = (v16 + v17 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  swift_unknownObjectRelease();
  uint64_t v19 = sub_188F2A3A4();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(unsigned __int8 *)(v20 + 80);
  uint64_t v22 = v18 + (v21 | 7) + 32;
  int v23 = (_DWORD *)(v22 & ~(v21 | 7));
  int v24 = *(_DWORD *)(v20 + 84);
  uint64_t v25 = *(void *)(v20 + 64) + 7LL;
  unint64_t v26 = v25 & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v27 = (v25 & 0xFFFFFFFFFFFFFFF8LL) + 8;
  if (!v24)
  {
    if (!*((_BYTE *)v23 + v27)) {
      goto LABEL_23;
    }
    int v28 = *((unsigned __int8 *)v23 + v27) - 1;
    int v29 = v27 & 0xFFFFFFF8;
    if ((v27 & 0xFFFFFFF8) != 0)
    {
      int v28 = 0;
      int v29 = *v23;
    }

    if ((v29 | v28) == 0xFFFFFFFF) {
      goto LABEL_23;
    }
LABEL_22:
    uint64_t v30 = *(void (**)(_DWORD *, uint64_t))(v20 + 8);
    goto LABEL_24;
  }

  if ((*(unsigned int (**)(uint64_t, void, uint64_t))(v20 + 48))( v22 & ~(v21 | 7),  *(unsigned int *)(v20 + 84),  v19))
  {
    goto LABEL_22;
  }

LABEL_23:
  uint64_t v30 = *(void (**)(_DWORD *, uint64_t))(v20 + 8);
  v30(v23, v19);
LABEL_24:
  unint64_t v31 = v26 + 9;
  if (v24) {
    unint64_t v31 = v26 + 8;
  }
  unint64_t v32 = ((unint64_t)v23 + v21 + v31) & ~v21;
  v30((_DWORD *)v32, v19);
  return sub_188F15B5C( *(void *)((v25 + v32) & 0xFFFFFFFFFFFFFFF8LL),  *(void *)(((v25 + v32) & 0xFFFFFFFFFFFFFFF8LL) + 8));
}

_BYTE *sub_188F1E918(_BYTE *a1, _BYTE *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  unint64_t v2 = (void *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v3 = (void *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8LL);
  *unint64_t v2 = *v3;
  v2[1] = v3[1];
  v2[2] = v3[2];
  v2[3] = v3[3];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (unint64_t)v2 + v6 + 32;
  uint64_t v58 = ~v6;
  unint64_t v8 = (unint64_t)v3 + v6 + 32;
  uint64_t v9 = *(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48);
  swift_unknownObjectRetain();
  if (v9(v8 & ~v6, 1LL, AssociatedTypeWitness))
  {
    int v10 = *(_DWORD *)(v5 + 84);
    size_t v11 = *(void *)(v5 + 64);
    if (v10) {
      size_t v12 = *(void *)(v5 + 64);
    }
    else {
      size_t v12 = v11 + 1;
    }
    memcpy((void *)(v7 & ~v6), (const void *)(v8 & ~v6), v12);
  }

  else
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))( v7 & ~v6,  v8 & ~v6,  AssociatedTypeWitness);
    (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v5 + 56))( v7 & ~v6,  0LL,  1LL,  AssociatedTypeWitness);
    int v10 = *(_DWORD *)(v5 + 84);
    size_t v11 = *(void *)(v5 + 64);
  }

  if (v10) {
    size_t v13 = v11;
  }
  else {
    size_t v13 = v11 + 1;
  }
  uint64_t v14 = (char *)(((v7 | v6) + v13) & v58);
  uint64_t v15 = (char *)(((v8 | v6) + v13) & v58);
  if (v9((unint64_t)v15, 1LL, AssociatedTypeWitness))
  {
    memcpy(v14, v15, v13);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v14, v15, AssociatedTypeWitness);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v14, 0LL, 1LL, AssociatedTypeWitness);
  }

  uint64_t v16 = &v14[v13];
  uint64_t v17 = &v15[v13];
  swift_getAssociatedConformanceWitness();
  uint64_t v18 = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = &v16[v20];
  uint64_t v22 = ~v20;
  int v23 = (void *)((unint64_t)&v16[v20] & ~v20);
  int v24 = &v17[v20];
  uint64_t v25 = (const void *)((unint64_t)&v17[v20] & ~v20);
  uint64_t v59 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48);
  if (v59(v25, 1LL, v18))
  {
    int v26 = *(_DWORD *)(v19 + 84);
    size_t v27 = *(void *)(v19 + 64);
    if (v26) {
      size_t v28 = *(void *)(v19 + 64);
    }
    else {
      size_t v28 = v27 + 1;
    }
    memcpy(v23, v25, v28);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v23, v25, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v23, 0LL, 1LL, v18);
    int v26 = *(_DWORD *)(v19 + 84);
    size_t v27 = *(void *)(v19 + 64);
  }

  if (v26) {
    size_t v29 = v27;
  }
  else {
    size_t v29 = v27 + 1;
  }
  uint64_t v30 = (void *)((((unint64_t)v21 | v20) + v29) & v22);
  unint64_t v31 = (const void *)((((unint64_t)v24 | v20) + v29) & v22);
  if (v59(v31, 1LL, v18))
  {
    memcpy(v30, v31, v29);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v30, v31, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v30, 0LL, 1LL, v18);
  }

  size_t v32 = v29 + 7;
  uint64_t v33 = (void *)(((unint64_t)v30 + v29 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v34 = (void *)(((unint64_t)v31 + v32) & 0xFFFFFFFFFFFFFFF8LL);
  *uint64_t v33 = *v34;
  v33[1] = v34[1];
  v33[2] = v34[2];
  v33[3] = v34[3];
  uint64_t v35 = sub_188F2A3A4();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = *(unsigned int *)(v36 + 84);
  uint64_t v38 = *(_DWORD *)(v36 + 80);
  unint64_t v39 = *(_DWORD *)(v36 + 80) & 0xF8LL ^ 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v40 = (void *)(((unint64_t)v33 + v38 + 32) & v39);
  uint64_t v41 = (_DWORD *)(((unint64_t)v34 + v38 + 32) & v39);
  uint64_t v42 = *(void *)(v36 + 64) + 7LL;
  unint64_t v43 = v42 & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v44 = (v42 & 0xFFFFFFFFFFFFFFF8LL) + 8;
  swift_unknownObjectRetain();
  if (!(_DWORD)v37)
  {
    size_t v45 = a1;
    if (!*((_BYTE *)v41 + v44)) {
      goto LABEL_36;
    }
    int v46 = *((unsigned __int8 *)v41 + v44) - 1;
    int v47 = v44 & 0xFFFFFFF8;
    if ((v44 & 0xFFFFFFF8) != 0)
    {
      int v46 = 0;
      int v47 = *v41;
    }

    if ((v47 | v46) == 0xFFFFFFFF) {
      goto LABEL_36;
    }
LABEL_32:
    if ((_DWORD)v37) {
      size_t v48 = v43 + 8;
    }
    else {
      size_t v48 = v43 + 9;
    }
    memcpy(v40, v41, v48);
    uint64_t v49 = *(void (**)(void *, _DWORD *, uint64_t))(v36 + 16);
    goto LABEL_38;
  }

  size_t v45 = a1;
LABEL_36:
  uint64_t v49 = *(void (**)(void *, _DWORD *, uint64_t))(v36 + 16);
  v49(v40, v41, v35);
  *(void *)(((unint64_t)v40 + v42) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v41 + v42) & 0xFFFFFFFFFFFFF8LL);
  if (!(_DWORD)v37) {
    *((_BYTE *)v40 + v44) = 0;
  }
LABEL_38:
  unint64_t v50 = v43 + 9;
  if ((_DWORD)v37) {
    unint64_t v50 = v43 + 8;
  }
  unint64_t v51 = ((unint64_t)v40 + v38 + v50) & ~v38;
  unint64_t v52 = ((unint64_t)v41 + v38 + v50) & ~v38;
  v49((void *)v51, (_DWORD *)v52, v35);
  uint64_t v53 = (void *)((v42 + v51) & 0xFFFFFFFFFFFFFFF8LL);
  int v54 = (uint64_t *)((v42 + v52) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v55 = *v54;
  unint64_t v56 = v54[1];
  sub_188F15B18(*v54, v56);
  *uint64_t v53 = v55;
  v53[1] = v56;
  return v45;
}

_BYTE *sub_188F1EDBC(_BYTE *a1, _BYTE *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  unint64_t v2 = (void *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v3 = (void *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8LL);
  *unint64_t v2 = *v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v2[1] = v3[1];
  v2[2] = v3[2];
  v2[3] = v3[3];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (unint64_t)v2 + v6 + 32;
  uint64_t v8 = ~v6;
  unint64_t v9 = (unint64_t)v3 + v6 + 32;
  int v10 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v5 + 48);
  int v11 = v10(v7 & ~v6, 1LL, AssociatedTypeWitness);
  int v12 = v10(v9 & ~v6, 1LL, AssociatedTypeWitness);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))( v7 & ~v6,  v9 & ~v6,  AssociatedTypeWitness);
      (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v5 + 56))( v7 & ~v6,  0LL,  1LL,  AssociatedTypeWitness);
      goto LABEL_10;
    }
  }

  else
  {
    if (!v12)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 24))( v7 & ~v6,  v9 & ~v6,  AssociatedTypeWitness);
      goto LABEL_10;
    }

    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7 & ~v6, AssociatedTypeWitness);
  }

  if (*(_DWORD *)(v5 + 84)) {
    size_t v13 = *(void *)(v5 + 64);
  }
  else {
    size_t v13 = *(void *)(v5 + 64) + 1LL;
  }
  memcpy((void *)(v7 & ~v6), (const void *)(v9 & ~v6), v13);
LABEL_10:
  if (*(_DWORD *)(v5 + 84)) {
    size_t v14 = *(void *)(v5 + 64);
  }
  else {
    size_t v14 = *(void *)(v5 + 64) + 1LL;
  }
  uint64_t v15 = (char *)(((v7 | v6) + v14) & v8);
  uint64_t v16 = (char *)(((v9 | v6) + v14) & v8);
  int v17 = v10((unint64_t)v15, 1LL, AssociatedTypeWitness);
  int v18 = v10((unint64_t)v16, 1LL, AssociatedTypeWitness);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v15, v16, AssociatedTypeWitness);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v15, 0LL, 1LL, AssociatedTypeWitness);
      goto LABEL_19;
    }

    goto LABEL_18;
  }

  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v15, AssociatedTypeWitness);
LABEL_18:
    memcpy(v15, v16, v14);
    goto LABEL_19;
  }

  (*(void (**)(char *, char *, uint64_t))(v5 + 24))(v15, v16, AssociatedTypeWitness);
LABEL_19:
  uint64_t v19 = &v15[v14];
  swift_getAssociatedConformanceWitness();
  uint64_t v20 = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  int v23 = &v19[v22];
  uint64_t v24 = ~v22;
  uint64_t v25 = (void *)((unint64_t)&v19[v22] & ~v22);
  unint64_t v26 = (unint64_t)&v16[v14 + v22];
  size_t v27 = (void *)(v26 & ~v22);
  size_t v28 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  int v29 = v28(v25, 1LL, v20);
  int v30 = v28(v27, 1LL, v20);
  if (v29)
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v25, v27, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v25, 0LL, 1LL, v20);
      goto LABEL_28;
    }
  }

  else
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 24))(v25, v27, v20);
      goto LABEL_28;
    }

    (*(void (**)(void *, uint64_t))(v21 + 8))(v25, v20);
  }

  if (*(_DWORD *)(v21 + 84)) {
    size_t v31 = *(void *)(v21 + 64);
  }
  else {
    size_t v31 = *(void *)(v21 + 64) + 1LL;
  }
  memcpy(v25, v27, v31);
LABEL_28:
  if (*(_DWORD *)(v21 + 84)) {
    size_t v32 = *(void *)(v21 + 64);
  }
  else {
    size_t v32 = *(void *)(v21 + 64) + 1LL;
  }
  uint64_t v33 = (void *)((((unint64_t)v23 | v22) + v32) & v24);
  uint64_t v34 = (void *)(((v26 | v22) + v32) & v24);
  int v35 = v28(v33, 1LL, v20);
  int v36 = v28(v34, 1LL, v20);
  if (v35)
  {
    if (!v36)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v33, v34, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v33, 0LL, 1LL, v20);
      goto LABEL_37;
    }

    goto LABEL_36;
  }

  if (v36)
  {
    (*(void (**)(void *, uint64_t))(v21 + 8))(v33, v20);
LABEL_36:
    memcpy(v33, v34, v32);
    goto LABEL_37;
  }

  (*(void (**)(void *, void *, uint64_t))(v21 + 24))(v33, v34, v20);
LABEL_37:
  uint64_t v37 = (void *)(((unint64_t)v33 + v32 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v38 = (void *)(((unint64_t)v34 + v32 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  *uint64_t v37 = *v38;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v37[1] = v38[1];
  v37[2] = v38[2];
  v37[3] = v38[3];
  uint64_t v39 = sub_188F2A3A4();
  uint64_t v40 = v39;
  uint64_t v41 = *(void *)(v39 - 8);
  uint64_t v42 = *(unsigned int *)(v41 + 84);
  uint64_t v43 = *(_DWORD *)(v41 + 80);
  unint64_t v44 = *(_DWORD *)(v41 + 80) & 0xF8LL ^ 0xFFFFFFFFFFFFFFF8LL;
  size_t v45 = (_DWORD *)(((unint64_t)v37 + v43 + 32) & v44);
  int v46 = (_DWORD *)(((unint64_t)v38 + v43 + 32) & v44);
  uint64_t v47 = *(void *)(v41 + 64);
  uint64_t v48 = v47 + 7;
  unint64_t v49 = (v47 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  size_t v50 = v49 + 8;
  if ((_DWORD)v42)
  {
    uint64_t v78 = v47 + 7;
    unint64_t v51 = (v47 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v52 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v41 + 48);
    int v53 = v52(v45, v42, v39);
    uint64_t v54 = v40;
    int v55 = v53;
    unint64_t v56 = v46;
    unint64_t v57 = v46;
    uint64_t v58 = v54;
    int v59 = ((uint64_t (*)(_DWORD *, uint64_t))v52)(v57, v42);
    unint64_t v49 = v51;
    if (v55) {
      goto LABEL_39;
    }
    goto LABEL_64;
  }

  if (!*((_BYTE *)v45 + v50)
    || ((int v60 = *((unsigned __int8 *)v45 + v50) - 1, (_DWORD)v49 == -8) ? (v61 = 0) : (int v60 = 0, v61 = *v45),
        (v61 | v60) == 0xFFFFFFFF))
  {
    if (!*((_BYTE *)v46 + v50)) {
      goto LABEL_70;
    }
    int v64 = *((unsigned __int8 *)v46 + v50) - 1;
    if ((_DWORD)v49 != -8) {
      int v64 = 0;
    }
    uint64_t v78 = v48;
    if ((_DWORD)v49 == -8)
    {
      unint64_t v56 = v46;
      uint64_t v58 = v39;
      int v66 = 0;
    }

    else
    {
      uint64_t v65 = v46;
      uint64_t v58 = v39;
      unint64_t v56 = v65;
      int v66 = *v65;
    }

    int v59 = (v66 | v64) + 1;
LABEL_64:
    uint64_t v40 = v58;
    int v46 = v56;
    uint64_t v48 = v78;
    if (v59)
    {
      (*(void (**)(_DWORD *, uint64_t))(v41 + 8))(v45, v40);
      goto LABEL_66;
    }

LABEL_70:
    (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v41 + 24))(v45, v46, v40);
    *(void *)(((unint64_t)v45 + v48) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v46 + v48) & 0xFFFFFFFFFFFFF8LL);
    goto LABEL_71;
  }

  if (!*((_BYTE *)v46 + v50)) {
    goto LABEL_55;
  }
  uint64_t v78 = v48;
  unint64_t v56 = v46;
  int v62 = *((unsigned __int8 *)v46 + v50) - 1;
  if ((_DWORD)v49 != -8) {
    int v62 = 0;
  }
  uint64_t v58 = v39;
  if ((_DWORD)v49 == -8) {
    int v63 = 0;
  }
  else {
    int v63 = *v56;
  }
  int v59 = (v63 | v62) + 1;
LABEL_39:
  uint64_t v40 = v58;
  int v46 = v56;
  uint64_t v48 = v78;
  if (v59)
  {
LABEL_66:
    if ((_DWORD)v42) {
      size_t v67 = v50;
    }
    else {
      size_t v67 = v49 + 9;
    }
    memcpy(v45, v46, v67);
    goto LABEL_71;
  }

LABEL_55:
  (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v41 + 16))(v45, v46, v40);
  *(void *)(((unint64_t)v45 + v48) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v46 + v48) & 0xFFFFFFFFFFFFF8LL);
  if (!(_DWORD)v42) {
    *((_BYTE *)v45 + v50) = 0;
  }
LABEL_71:
  unint64_t v68 = v49 + 9;
  if ((_DWORD)v42) {
    unint64_t v68 = v50;
  }
  unint64_t v69 = ((unint64_t)v45 + v43 + v68) & ~v43;
  unint64_t v70 = ((unint64_t)v46 + v43 + v68) & ~v43;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v41 + 24))(v69, v70, v40);
  size_t v71 = (uint64_t *)((v48 + v69) & 0xFFFFFFFFFFFFFFF8LL);
  size_t v72 = (uint64_t *)((v48 + v70) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v73 = *v72;
  unint64_t v74 = v72[1];
  sub_188F15B18(*v72, v74);
  uint64_t v75 = *v71;
  unint64_t v76 = v71[1];
  *size_t v71 = v73;
  v71[1] = v74;
  sub_188F15B5C(v75, v76);
  return a1;
}

_BYTE *sub_188F1F478(_BYTE *a1, _BYTE *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  unint64_t v2 = (_OWORD *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v3 = (_OWORD *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8LL);
  __int128 v4 = v3[1];
  *unint64_t v2 = *v3;
  v2[1] = v4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  unint64_t v8 = (unint64_t)v2 + v7 + 32;
  uint64_t v9 = ~v7;
  unint64_t v10 = (unint64_t)v3 + v7 + 32;
  uint64_t v54 = *(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v54(v10 & ~v7, 1LL, AssociatedTypeWitness))
  {
    int v11 = *(_DWORD *)(v6 + 84);
    size_t v12 = *(void *)(v6 + 64);
    if (v11) {
      size_t v13 = *(void *)(v6 + 64);
    }
    else {
      size_t v13 = v12 + 1;
    }
    memcpy((void *)(v8 & ~v7), (const void *)(v10 & ~v7), v13);
  }

  else
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 32))( v8 & ~v7,  v10 & ~v7,  AssociatedTypeWitness);
    (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v6 + 56))( v8 & ~v7,  0LL,  1LL,  AssociatedTypeWitness);
    int v11 = *(_DWORD *)(v6 + 84);
    size_t v12 = *(void *)(v6 + 64);
  }

  if (v11) {
    size_t v14 = v12;
  }
  else {
    size_t v14 = v12 + 1;
  }
  uint64_t v15 = (char *)(((v8 | v7) + v14) & v9);
  uint64_t v16 = (char *)(((v10 | v7) + v14) & v9);
  if (v54((unint64_t)v16, 1LL, AssociatedTypeWitness))
  {
    memcpy(v15, v16, v14);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v15, v16, AssociatedTypeWitness);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v15, 0LL, 1LL, AssociatedTypeWitness);
  }

  int v17 = &v15[v14];
  int v18 = &v16[v14];
  swift_getAssociatedConformanceWitness();
  uint64_t v19 = swift_getAssociatedTypeWitness();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(unsigned __int8 *)(v20 + 80);
  uint64_t v22 = &v17[v21];
  uint64_t v23 = ~v21;
  uint64_t v24 = &v18[v21];
  uint64_t v25 = (const void *)((unint64_t)&v18[v21] & ~v21);
  int v55 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48);
  if (v55(v25, 1LL, v19))
  {
    int v26 = *(_DWORD *)(v20 + 84);
    size_t v27 = *(void *)(v20 + 64);
    if (v26) {
      size_t v28 = *(void *)(v20 + 64);
    }
    else {
      size_t v28 = v27 + 1;
    }
    memcpy((void *)((unint64_t)v22 & ~v21), v25, v28);
  }

  else
  {
    (*(void (**)(unint64_t, const void *, uint64_t))(v20 + 32))((unint64_t)v22 & ~v21, v25, v19);
    (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v20 + 56))( (unint64_t)v22 & ~v21,  0LL,  1LL,  v19);
    int v26 = *(_DWORD *)(v20 + 84);
    size_t v27 = *(void *)(v20 + 64);
  }

  if (v26) {
    size_t v29 = v27;
  }
  else {
    size_t v29 = v27 + 1;
  }
  int v30 = (void *)((((unint64_t)v22 | v21) + v29) & v23);
  size_t v31 = (const void *)((((unint64_t)v24 | v21) + v29) & v23);
  if (v55(v31, 1LL, v19))
  {
    memcpy(v30, v31, v29);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 32))(v30, v31, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v30, 0LL, 1LL, v19);
  }

  size_t v32 = (_OWORD *)(((unint64_t)v31 + v29 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  __int128 v33 = v32[1];
  uint64_t v34 = (_OWORD *)(((unint64_t)v30 + v29 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  *uint64_t v34 = *v32;
  v34[1] = v33;
  uint64_t v35 = sub_188F2A3A4();
  uint64_t v36 = *(void *)(v35 - 8);
  int v37 = *(_DWORD *)(v36 + 84);
  uint64_t v38 = *(_DWORD *)(v36 + 80);
  unint64_t v39 = *(_DWORD *)(v36 + 80) & 0xF8LL ^ 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v40 = (void *)(((unint64_t)v34 + v38 + 32) & v39);
  uint64_t v41 = (_DWORD *)(((unint64_t)v32 + v38 + 32) & v39);
  uint64_t v42 = *(void *)(v36 + 64) + 7LL;
  unint64_t v43 = v42 & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v44 = (v42 & 0xFFFFFFFFFFFFFFF8LL) + 8;
  if (!v37)
  {
    if (!*((_BYTE *)v41 + v44)) {
      goto LABEL_36;
    }
    int v45 = *((unsigned __int8 *)v41 + v44) - 1;
    int v46 = v44 & 0xFFFFFFF8;
    if ((v44 & 0xFFFFFFF8) != 0)
    {
      int v45 = 0;
      int v46 = *v41;
    }

    if ((v46 | v45) == 0xFFFFFFFF) {
      goto LABEL_36;
    }
LABEL_32:
    if (v37) {
      size_t v47 = v43 + 8;
    }
    else {
      size_t v47 = v43 + 9;
    }
    memcpy(v40, v41, v47);
    uint64_t v48 = *(void (**)(void *, _DWORD *, uint64_t))(v36 + 32);
    goto LABEL_38;
  }

LABEL_36:
  uint64_t v48 = *(void (**)(void *, _DWORD *, uint64_t))(v36 + 32);
  v48(v40, v41, v35);
  *(void *)(((unint64_t)v40 + v42) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v41 + v42) & 0xFFFFFFFFFFFFF8LL);
  if (!v37) {
    *((_BYTE *)v40 + v44) = 0;
  }
LABEL_38:
  unint64_t v49 = v43 + 9;
  if (v37) {
    unint64_t v49 = v43 + 8;
  }
  unint64_t v50 = ((unint64_t)v40 + v38 + v49) & ~v38;
  unint64_t v51 = ((unint64_t)v41 + v38 + v49) & ~v38;
  v48((void *)v50, (_DWORD *)v51, v35);
  *(_OWORD *)((v42 + v50) & 0xFFFFFFFFFFFFF8LL) = *(_OWORD *)((v42 + v51) & 0xFFFFFFFFFFFFF8LL);
  return a1;
}

_BYTE *sub_188F1F8C8(_BYTE *a1, _BYTE *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  unint64_t v2 = (void *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v3 = (void *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8LL);
  *unint64_t v2 = *v3;
  swift_unknownObjectRelease();
  v2[1] = v3[1];
  v2[2] = v3[2];
  v2[3] = v3[3];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (unint64_t)v2 + v6 + 32;
  uint64_t v8 = ~v6;
  unint64_t v9 = (unint64_t)v3 + v6 + 32;
  unint64_t v10 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v5 + 48);
  int v11 = v10(v7 & ~v6, 1LL, AssociatedTypeWitness);
  int v12 = v10(v9 & ~v6, 1LL, AssociatedTypeWitness);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 32))( v7 & ~v6,  v9 & ~v6,  AssociatedTypeWitness);
      (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v5 + 56))( v7 & ~v6,  0LL,  1LL,  AssociatedTypeWitness);
      goto LABEL_10;
    }
  }

  else
  {
    if (!v12)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 40))( v7 & ~v6,  v9 & ~v6,  AssociatedTypeWitness);
      goto LABEL_10;
    }

    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7 & ~v6, AssociatedTypeWitness);
  }

  if (*(_DWORD *)(v5 + 84)) {
    size_t v13 = *(void *)(v5 + 64);
  }
  else {
    size_t v13 = *(void *)(v5 + 64) + 1LL;
  }
  memcpy((void *)(v7 & ~v6), (const void *)(v9 & ~v6), v13);
LABEL_10:
  if (*(_DWORD *)(v5 + 84)) {
    size_t v14 = *(void *)(v5 + 64);
  }
  else {
    size_t v14 = *(void *)(v5 + 64) + 1LL;
  }
  uint64_t v15 = (char *)(((v7 | v6) + v14) & v8);
  uint64_t v16 = (char *)(((v9 | v6) + v14) & v8);
  int v17 = v10((unint64_t)v15, 1LL, AssociatedTypeWitness);
  int v18 = v10((unint64_t)v16, 1LL, AssociatedTypeWitness);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v15, v16, AssociatedTypeWitness);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v15, 0LL, 1LL, AssociatedTypeWitness);
      goto LABEL_19;
    }

    goto LABEL_18;
  }

  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v15, AssociatedTypeWitness);
LABEL_18:
    memcpy(v15, v16, v14);
    goto LABEL_19;
  }

  (*(void (**)(char *, char *, uint64_t))(v5 + 40))(v15, v16, AssociatedTypeWitness);
LABEL_19:
  uint64_t v19 = &v15[v14];
  swift_getAssociatedConformanceWitness();
  uint64_t v20 = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v23 = &v19[v22];
  uint64_t v24 = ~v22;
  uint64_t v25 = (void *)((unint64_t)&v19[v22] & ~v22);
  unint64_t v26 = (unint64_t)&v16[v14 + v22];
  size_t v27 = (void *)(v26 & ~v22);
  size_t v28 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  int v29 = v28(v25, 1LL, v20);
  int v30 = v28(v27, 1LL, v20);
  if (v29)
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v25, v27, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v25, 0LL, 1LL, v20);
      goto LABEL_28;
    }
  }

  else
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v25, v27, v20);
      goto LABEL_28;
    }

    (*(void (**)(void *, uint64_t))(v21 + 8))(v25, v20);
  }

  if (*(_DWORD *)(v21 + 84)) {
    size_t v31 = *(void *)(v21 + 64);
  }
  else {
    size_t v31 = *(void *)(v21 + 64) + 1LL;
  }
  memcpy(v25, v27, v31);
LABEL_28:
  if (*(_DWORD *)(v21 + 84)) {
    size_t v32 = *(void *)(v21 + 64);
  }
  else {
    size_t v32 = *(void *)(v21 + 64) + 1LL;
  }
  __int128 v33 = (void *)((((unint64_t)v23 | v22) + v32) & v24);
  uint64_t v34 = (void *)(((v26 | v22) + v32) & v24);
  int v35 = v28(v33, 1LL, v20);
  int v36 = v28(v34, 1LL, v20);
  if (v35)
  {
    if (!v36)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v33, v34, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v33, 0LL, 1LL, v20);
      goto LABEL_37;
    }

    goto LABEL_36;
  }

  if (v36)
  {
    (*(void (**)(void *, uint64_t))(v21 + 8))(v33, v20);
LABEL_36:
    memcpy(v33, v34, v32);
    goto LABEL_37;
  }

  (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v33, v34, v20);
LABEL_37:
  int v37 = (void *)(((unint64_t)v33 + v32 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v38 = (void *)(((unint64_t)v34 + v32 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  *int v37 = *v38;
  swift_unknownObjectRelease();
  v37[1] = v38[1];
  v37[2] = v38[2];
  v37[3] = v38[3];
  uint64_t v39 = sub_188F2A3A4();
  uint64_t v40 = v39;
  uint64_t v41 = *(void *)(v39 - 8);
  uint64_t v42 = *(unsigned int *)(v41 + 84);
  uint64_t v43 = *(_DWORD *)(v41 + 80);
  unint64_t v44 = *(_DWORD *)(v41 + 80) & 0xF8LL ^ 0xFFFFFFFFFFFFFFF8LL;
  int v45 = (_DWORD *)(((unint64_t)v37 + v43 + 32) & v44);
  int v46 = (_DWORD *)(((unint64_t)v38 + v43 + 32) & v44);
  uint64_t v47 = *(void *)(v41 + 64);
  uint64_t v48 = v47 + 7;
  unint64_t v49 = (v47 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  size_t v50 = v49 + 8;
  if ((_DWORD)v42)
  {
    unint64_t v75 = v49 + 8;
    uint64_t v76 = v47 + 7;
    unint64_t v51 = (v47 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v52 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v41 + 48);
    int v53 = v52(v45, v42, v39);
    uint64_t v54 = v46;
    int v55 = v46;
    uint64_t v56 = v40;
    int v57 = v52(v55, v42, v40);
    uint64_t v58 = a1;
    if (v53) {
      goto LABEL_39;
    }
    goto LABEL_62;
  }

  uint64_t v58 = a1;
  if (!*((_BYTE *)v45 + v50)
    || ((int v59 = *((unsigned __int8 *)v45 + v50) - 1, (_DWORD)v49 == -8) ? (v60 = 0) : (int v59 = 0, v60 = *v45),
        (v60 | v59) == 0xFFFFFFFF))
  {
    if (!*((_BYTE *)v46 + v50)) {
      goto LABEL_68;
    }
    int v64 = *((unsigned __int8 *)v46 + v50) - 1;
    if ((_DWORD)v49 != -8) {
      int v64 = 0;
    }
    unint64_t v75 = v49 + 8;
    uint64_t v76 = v48;
    if ((_DWORD)v49 == -8)
    {
      uint64_t v54 = v46;
      uint64_t v56 = v39;
      unint64_t v51 = v49;
      int v66 = 0;
    }

    else
    {
      uint64_t v65 = v46;
      uint64_t v56 = v39;
      unint64_t v51 = v49;
      uint64_t v54 = v65;
      int v66 = *v65;
    }

    int v57 = (v66 | v64) + 1;
LABEL_62:
    unint64_t v49 = v51;
    uint64_t v40 = v56;
    int v46 = v54;
    size_t v50 = v75;
    uint64_t v48 = v76;
    if (v57)
    {
      (*(void (**)(_DWORD *, uint64_t))(v41 + 8))(v45, v40);
      goto LABEL_64;
    }

LABEL_68:
    (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v41 + 40))(v45, v46, v40);
    *(void *)(((unint64_t)v45 + v48) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v46 + v48) & 0xFFFFFFFFFFFFF8LL);
    goto LABEL_69;
  }

  int v61 = *((unsigned __int8 *)v46 + v50);
  if (!*((_BYTE *)v46 + v50)) {
    goto LABEL_53;
  }
  unint64_t v75 = v49 + 8;
  uint64_t v76 = v48;
  uint64_t v54 = v46;
  uint64_t v56 = v39;
  int v62 = v61 - 1;
  if ((_DWORD)v49 == -8)
  {
    unint64_t v51 = v49;
    int v63 = 0;
  }

  else
  {
    int v62 = 0;
    unint64_t v51 = v49;
    int v63 = *v54;
  }

  int v57 = (v63 | v62) + 1;
LABEL_39:
  unint64_t v49 = v51;
  uint64_t v40 = v56;
  int v46 = v54;
  size_t v50 = v75;
  uint64_t v48 = v76;
  if (v57)
  {
LABEL_64:
    if ((_DWORD)v42) {
      size_t v67 = v50;
    }
    else {
      size_t v67 = v49 + 9;
    }
    memcpy(v45, v46, v67);
    goto LABEL_69;
  }

LABEL_53:
  (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v41 + 32))(v45, v46, v40);
  *(void *)(((unint64_t)v45 + v48) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v46 + v48) & 0xFFFFFFFFFFFFF8LL);
  if (!(_DWORD)v42) {
    *((_BYTE *)v45 + v50) = 0;
  }
LABEL_69:
  unint64_t v68 = v49 + 9;
  if ((_DWORD)v42) {
    unint64_t v68 = v50;
  }
  unint64_t v69 = ((unint64_t)v45 + v43 + v68) & ~v43;
  unint64_t v70 = ((unint64_t)v46 + v43 + v68) & ~v43;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v41 + 40))(v69, v70, v40);
  size_t v71 = (uint64_t *)((v48 + v69) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v72 = *v71;
  unint64_t v73 = v71[1];
  *(_OWORD *)size_t v71 = *(_OWORD *)((v48 + v70) & 0xFFFFFFFFFFFFF8LL);
  sub_188F15B5C(v72, v73);
  return v58;
}

uint64_t sub_188F1FF84(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v5 = *(unsigned int *)(v4 + 84);
  if ((_DWORD)v5) {
    unsigned int v6 = v5 - 1;
  }
  else {
    unsigned int v6 = 0;
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if ((_DWORD)v9) {
    unsigned int v10 = v9 - 1;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v6 <= v10) {
    unsigned int v11 = v10;
  }
  else {
    unsigned int v11 = v6;
  }
  uint64_t v12 = sub_188F2A3A4();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned int *)(v13 + 84);
  if ((_DWORD)v14) {
    int v15 = v14 - 1;
  }
  else {
    int v15 = 0;
  }
  else {
    unsigned int v16 = *(_DWORD *)(v13 + 84);
  }
  if (v11 <= v16) {
    unsigned int v17 = v16;
  }
  else {
    unsigned int v17 = v11;
  }
  if (v17 <= 0x7FFFFFFF) {
    unsigned int v18 = 0x7FFFFFFF;
  }
  else {
    unsigned int v18 = v17;
  }
  if ((_DWORD)v5) {
    uint64_t v19 = *(void *)(v4 + 64);
  }
  else {
    uint64_t v19 = *(void *)(v4 + 64) + 1LL;
  }
  if ((_DWORD)v9) {
    uint64_t v20 = *(void *)(v8 + 64);
  }
  else {
    uint64_t v20 = *(void *)(v8 + 64) + 1LL;
  }
  if ((_DWORD)v14) {
    uint64_t v21 = 8LL;
  }
  else {
    uint64_t v21 = 9LL;
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v22 = v12;
  uint64_t v23 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v24 = v19 + v23;
  uint64_t v25 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v46 = v19 + v25;
  uint64_t v26 = v20 + v25;
  uint64_t v27 = v20 + 7;
  uint64_t v28 = *(_DWORD *)(v13 + 80);
  uint64_t v29 = v28 + 32;
  uint64_t v30 = *(void *)(v13 + 64) + 7LL;
  uint64_t v31 = (v30 & 0xFFFFFFFFFFFFFFF8LL) + v21 + v28;
  if (v18 < a2)
  {
    if ((((((_DWORD)v30 + (v31 & ~(_DWORD)v28)) & 0xFFFFFFF8)
         + (((_DWORD)v29
           + (((_DWORD)v27
             + (((_DWORD)v26
               + (((_DWORD)v46 + (((_DWORD)v24 + (((_DWORD)v23 + 40) & ~(_DWORD)v23)) & ~(_DWORD)v23)) & ~(_DWORD)v25)) & ~(_DWORD)v25)) & 0xFFFFFFF8)) & (*(_DWORD *)(v13 + 80) & 0xF8 ^ 0xFFFFFFF8))
         + 16) & 0xFFFFFFF8) != 0)
      unsigned int v32 = 2;
    else {
      unsigned int v32 = a2 - v18 + 1;
    }
    if (v32 >= 0x10000) {
      unsigned int v33 = 4;
    }
    else {
      unsigned int v33 = 2;
    }
    if (v32 < 0x100) {
      unsigned int v33 = 1;
    }
    if (v32 >= 2) {
      uint64_t v34 = v33;
    }
    else {
      uint64_t v34 = 0LL;
    }
    __asm { BR              X19 }
  }

  uint64_t v35 = ~v23;
  unint64_t v36 = (((a1 + 10) & 0xFFFFFFFFFFFFFFF8LL) + v23 + 32) & ~v23;
  if (v6 == v18)
  {
    if (v5 >= 2)
    {
      unsigned int v37 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 48))( v36,  v5,  AssociatedTypeWitness,  v29,  v27,  v26,  v24);
      goto LABEL_56;
    }

    return 0LL;
  }

  uint64_t v38 = ~v25;
  unint64_t v39 = (v46 + ((v24 + v36) & v35)) & v38;
  if (v10 == v18)
  {
    unsigned int v37 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 48))( v39,  v9,  v7,  v29,  v27,  v26,  v24);
LABEL_56:
    if (v37 >= 2) {
      return v37 - 1;
    }
    else {
      return 0LL;
    }
  }

  uint64_t v41 = (uint64_t *)((v27 + ((v26 + v39) & v38)) & 0xFFFFFFFFFFFFFFF8LL);
  if ((v17 & 0x80000000) != 0)
  {
    unint64_t v43 = ((unint64_t)v41 + v29) & (*(_DWORD *)(v13 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8LL);
    if (v15 == v16)
    {
      unsigned int v37 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 48))( v43,  v14,  v22,  v29,  v27,  v26,  v24);
      goto LABEL_56;
    }

    unint64_t v44 = (v31 + v43) & ~v28;
    if (v14 < 0xC)
    {
      uint64_t v45 = *(void *)(((v30 + v44) & 0xFFFFFFFFFFFFF8LL) + 8) >> 60;
      if (((4 * (_DWORD)v45) & 0xC) != 0) {
        return 16 - ((4 * (_DWORD)v45) & 0xC | (v45 >> 2));
      }
      else {
        return 0LL;
      }
    }

    else
    {
      return (*(uint64_t (**)(unint64_t))(v13 + 48))(v44);
    }
  }

  else
  {
    uint64_t v42 = *v41;
    return (v42 + 1);
  }

void sub_188F2037C(unsigned int *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  int v5 = *(_DWORD *)(v4 + 84);
  if (v5) {
    unsigned int v6 = v5 - 1;
  }
  else {
    unsigned int v6 = 0;
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v7 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  if (v8) {
    unsigned int v9 = v8 - 1;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v6 <= v9) {
    unsigned int v10 = v9;
  }
  else {
    unsigned int v10 = v6;
  }
  int v11 = 0u;
  uint64_t v12 = *(void *)(sub_188F2A3A4() - 8);
  unsigned int v13 = *(_DWORD *)(v12 + 84);
  if (v13 <= 0xC) {
    unsigned int v14 = 12;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v12 + 84);
  }
  if (v10 <= v14) {
    unsigned int v15 = v14;
  }
  else {
    unsigned int v15 = v10;
  }
  if (v15 <= 0x7FFFFFFF) {
    unsigned int v16 = 0x7FFFFFFF;
  }
  else {
    unsigned int v16 = v15;
  }
  uint64_t v17 = *(void *)(v4 + 64);
  if (!v5) {
    ++v17;
  }
  uint64_t v18 = *(unsigned __int8 *)(v7 + 80);
  unint64_t v19 = (v17
       + v18
       + ((v17
  uint64_t v20 = *(void *)(v7 + 64);
  if (!v8) {
    ++v20;
  }
  uint64_t v21 = *(_DWORD *)(v12 + 80);
  unint64_t v22 = (v21 + 32 + ((v20 + 7 + ((v20 + v18 + v19) & ~v18)) & 0xFFFFFFFFFFFFFFF8LL)) & (*(_DWORD *)(v12 + 80) & 0xF8LL ^ 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v23 = *(void *)(v12 + 64) + 7LL;
  unint64_t v24 = (v23 & 0xFFFFFFFFFFFFFFF8LL) + 9;
  if (v13) {
    unint64_t v24 = (v23 & 0xFFFFFFFFFFFFFFF8LL) + 8;
  }
  size_t v25 = ((v23 + ((v24 + v21) & ~v21)) & 0xFFFFFFFFFFFFFFF8LL) + v22 + 16;
  if (v16 < a3)
  {
    if ((((_DWORD)v23 + (((_DWORD)v24 + (_DWORD)v21) & ~(_DWORD)v21)) & 0xFFFFFFF8) + (_DWORD)v22 == -16) {
      unsigned int v26 = a3 - v16 + 1;
    }
    else {
      unsigned int v26 = 2;
    }
    if (v26 >= 0x10000) {
      int v11 = 4;
    }
    else {
      int v11 = 2;
    }
    if (v26 < 0x100) {
      int v11 = 1;
    }
    if (v26 < 2) {
      int v11 = 0;
    }
  }

  if (a2 > v16)
  {
    if ((_DWORD)v25)
    {
      unsigned int v27 = ~v16 + a2;
      bzero(a1, v25);
      *a1 = v27;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X7 }

void sub_188F205EC( uint64_t a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  *(_BYTE *)(v37 + v22) = 0;
  if (!v38) {
    return;
  }
  unint64_t v25 = (((v37 + 10) & 0xFFFFFFFFFFFFFFF8LL) + a1 + 32) & a7;
  if (v24 == v11)
  {
    if (v18 >= 2)
    {
      uint64_t v26 = v38 + 1;
      unsigned int v27 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56);
      a3 = v18;
      uint64_t v28 = v17;
LABEL_8:
      v27(v25, v26, a3, v28);
      return;
    }

    return;
  }

  unint64_t v25 = (a6 + ((a5 + v25) & a7)) & v21;
  if (v19 != v11)
  {
    uint64_t v29 = (void *)((v15 + ((a4 + v25) & v21)) & 0xFFFFFFFFFFFFFFF8LL);
    if ((v9 & 0x80000000) == 0)
    {
      if ((v38 & 0x80000000) == 0)
      {
        *uint64_t v29 = v38 - 1;
        return;
      }

      uint64_t v32 = v38 ^ 0x80000000;
      v29[2] = 0LL;
      void v29[3] = 0LL;
LABEL_18:
      *uint64_t v29 = v32;
      v29[1] = 0LL;
      return;
    }

    uint64_t v30 = (_DWORD *)(((unint64_t)v29 + v14) & v12);
    if (v35 == v8)
    {
      if (v38 + 1 > a3)
      {
        if ((_DWORD)a2)
        {
          int v31 = v38 - a3;
          bzero(v30, a2);
          *uint64_t v30 = v31;
        }

        return;
      }

      if (v38 == -1) {
        return;
      }
      unsigned int v27 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
      unint64_t v25 = ((unint64_t)v29 + v14) & v12;
      uint64_t v26 = v38 + 1;
    }

    else
    {
      unint64_t v25 = ((unint64_t)v30 + v13) & v33;
      if (a3 < 0xC)
      {
        uint64_t v29 = (void *)((v10 + v25) & 0xFFFFFFFFFFFFFFF8LL);
        if (v38 <= 0xC)
        {
          *uint64_t v29 = 0LL;
          v29[1] = (unint64_t)(((-v38 >> 2) & 3) - 4 * v38) << 60;
          return;
        }

        uint64_t v32 = v38 - 13;
        goto LABEL_18;
      }

      unsigned int v27 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
      uint64_t v26 = v38;
    }

    uint64_t v28 = v34;
    goto LABEL_8;
  }

  if (v20 >= 2)
  {
    uint64_t v26 = v38 + 1;
    unsigned int v27 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
    a3 = v20;
    uint64_t v28 = v36;
    goto LABEL_8;
  }

uint64_t sub_188F207D0(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_188F2A260();
  if (!result || (uint64_t result = sub_188F2A284(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_188F2A278();
      return sub_188F2A2CC();
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

unint64_t sub_188F20860()
{
  unint64_t result = qword_18C759420;
  if (!qword_18C759420)
  {
    uint64_t v1 = sub_188F2A380();
    unint64_t result = MEMORY[0x1895DA4D4](MEMORY[0x189605978], v1);
    atomic_store(result, (unint64_t *)&qword_18C759420);
  }

  return result;
}

unint64_t sub_188F208A8()
{
  unint64_t result = qword_18C759430;
  if (!qword_18C759430)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C759428);
    unint64_t result = MEMORY[0x1895DA4D4](MEMORY[0x189618458], v1);
    atomic_store(result, (unint64_t *)&qword_18C759430);
  }

  return result;
}

uint64_t sub_188F208F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = swift_bridgeObjectRetain() + 56;
    uint64_t v3 = (char *)MEMORY[0x18961AFE8];
    while (1)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v4 = sub_188F229E8((uint64_t)&unk_18A315C40);
      swift_bridgeObjectRelease();
      if (!*(void *)(v4 + 16)) {
        break;
      }
      char v5 = *(_BYTE *)(v4 + 32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_188F28D14(0LL, *((void *)v3 + 2) + 1LL, 1, v3);
      }
      unint64_t v7 = *((void *)v3 + 2);
      unint64_t v6 = *((void *)v3 + 3);
      if (v7 >= v6 >> 1) {
        uint64_t v3 = sub_188F28D14((char *)(v6 > 1), v7 + 1, 1, v3);
      }
      *((void *)v3 + 2) = v7 + 1;
      v3[v7 + 32] = v5;
      v2 += 32LL;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v3;
      }
    }

    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }

  else
  {
    return MEMORY[0x18961AFE8];
  }

  return result;
}

Chirp::Modifiers_optional __swiftcall Modifiers.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_188F2A6C8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static Modifiers.allCases.getter()
{
  return &unk_18A315D00;
}

uint64_t Modifiers.rawValue.getter()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_188F20ADC + 4 * byte_188F2B160[*v0]))( 812348272LL,  0xE400000000000000LL);
}

uint64_t sub_188F20ADC()
{
  return 829125488LL;
}

uint64_t sub_188F20AE8()
{
  return 845902704LL;
}

uint64_t sub_188F20AF4()
{
  return 862679920LL;
}

uint64_t sub_188F20B00()
{
  return 0x6B6361626C6C6166LL;
}

void sub_188F20B18(char *a1)
{
}

void sub_188F20B24(char a1)
{
  __asm { BR              X10 }

uint64_t sub_188F20B64(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_188F20BBC + 4 * byte_188F2B16A[a2]))(829125488LL);
}

uint64_t sub_188F20BBC(uint64_t a1)
{
  if (a1 == 829125488 && v1 == v2) {
    char v3 = 1;
  }
  else {
    char v3 = sub_188F2A6E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_188F20C5C()
{
  uint64_t v1 = *v0;
  sub_188F2A740();
  __asm { BR              X9 }

uint64_t sub_188F20CA0()
{
  return sub_188F2A758();
}

void sub_188F20D04()
{
  __asm { BR              X10 }

uint64_t sub_188F20D38()
{
  return swift_bridgeObjectRelease();
}

void sub_188F20D88()
{
  uint64_t v1 = *v0;
  sub_188F2A740();
  __asm { BR              X9 }

uint64_t sub_188F20DC8()
{
  return sub_188F2A758();
}

Chirp::Modifiers_optional sub_188F20E2C(Swift::String *a1)
{
  return Modifiers.init(rawValue:)(*a1);
}

uint64_t sub_188F20E38()
{
  return ((uint64_t (*)(void))((char *)sub_188F20E60 + 4 * byte_188F2B17E[*v0]))();
}

void sub_188F20E60(void *a1@<X8>)
{
  *a1 = 829125488LL;
  a1[1] = v1;
}

void sub_188F20E70(void *a1@<X8>)
{
  *a1 = 845902704LL;
  a1[1] = v1;
}

void sub_188F20E80(void *a1@<X8>)
{
  *a1 = 862679920LL;
  a1[1] = v1;
}

void sub_188F20E90(void *a1@<X8>)
{
  *a1 = 0x6B6361626C6C6166LL;
  a1[1] = 0xE800000000000000LL;
}

void sub_188F20EAC(void *a1@<X8>)
{
  *a1 = &unk_18A315D28;
}

_BYTE *HandshakeAndModifiers.init(_:modifiers:)@<X0>(_BYTE *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_BYTE *)a3 = *result;
  *(void *)(a3 + 8) = a2;
  return result;
}

uint64_t HandshakeAndModifiers.init(_:)@<X0>( unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  int v61 = a5;
  uint64_t v10 = sub_188F2A77C();
  uint64_t v62 = *(void *)(v10 - 8);
  unint64_t v63 = v10;
  MEMORY[0x1895F8858](v10);
  uint64_t v12 = (char *)v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v13 = a2 >> 14;
  unint64_t v14 = a1 >> 14;
  uint64_t v64 = a3;
  if (a1 >> 14 == a2 >> 14)
  {
    swift_bridgeObjectRetain();
    unint64_t v15 = a1;
  }

  else
  {
    swift_bridgeObjectRetain();
    unint64_t v15 = a1;
    unint64_t v60 = a1 >> 14;
    do
    {
      swift_bridgeObjectRetain();
      unint64_t v17 = sub_188F2A620();
      unint64_t v19 = v18;
      swift_bridgeObjectRelease();
      if ((sub_188F2A494() & 1) == 0) {
        goto LABEL_4;
      }
      if ((sub_188F2A488() & 1) != 0)
      {
        uint64_t result = sub_188F22188(v17, v19);
        if ((result & 0x100000000LL) != 0) {
          goto LABEL_39;
        }
        sub_188F2A788();
        unint64_t v5 = sub_188F2A764();
        (*(void (**)(char *, unint64_t))(v62 + 8))(v12, v63);
        if ((v5 & 1) != 0) {
          goto LABEL_16;
        }
      }

      if ((sub_188F2A47C() & 1) == 0) {
        goto LABEL_4;
      }
      if ((sub_188F2A488() & 1) != 0)
      {
        uint64_t result = sub_188F22188(v17, v19);
        if ((result & 0x100000000LL) != 0) {
          goto LABEL_41;
        }
        sub_188F2A788();
        unint64_t v5 = sub_188F2A770();
        (*(void (**)(char *, unint64_t))(v62 + 8))(v12, v63);
        if ((v5 & 1) != 0) {
          goto LABEL_16;
        }
      }

      if ((sub_188F2A47C() & 1) == 0 || (sub_188F2A470() & 1) == 0)
      {
LABEL_16:
        swift_bridgeObjectRelease();
      }

      else
      {
LABEL_4:
        char v16 = sub_188F2A4A0();
        swift_bridgeObjectRelease();
        if ((v16 & 1) == 0) {
          goto LABEL_18;
        }
      }

      unint64_t v15 = sub_188F2A608();
      unint64_t v14 = v15 >> 14;
    }

    while (v15 >> 14 != v13);
    unint64_t v14 = a2 >> 14;
LABEL_18:
    if (v14 < v60)
    {
      __break(1u);
      goto LABEL_35;
    }
  }

  uint64_t v21 = sub_188F2A62C();
  unint64_t v5 = v22;
  uint64_t v62 = v23;
  unint64_t v25 = v24;
  swift_bridgeObjectRelease();
  if (v13 >= v5 >> 14)
  {
    unint64_t v60 = v25;
    unint64_t v63 = v21;
    swift_bridgeObjectRetain();
    unint64_t v26 = sub_188F2A62C();
    unint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v31 = swift_bridgeObjectRelease();
    uint64_t v65 = 43LL;
    unint64_t v66 = 0xE100000000000000LL;
    MEMORY[0x1895F8858](v31);
    v54[-2] = &v65;
    swift_bridgeObjectRetain();
    unint64_t v57 = v28;
    unint64_t v58 = v26;
    uint64_t v56 = v30;
    unint64_t v15 = 0LL;
    unint64_t v59 = sub_188F217F4(0x7FFFFFFFFFFFFFFFLL, 1, sub_188F22614, (uint64_t)&v54[-4], v26, v28, v30);
    if (qword_18C7592F8 == -1) {
      goto LABEL_21;
    }
    goto LABEL_36;
  }

LABEL_35:
  __break(1u);
LABEL_36:
  swift_once();
LABEL_21:
  uint64_t v32 = v60;
  swift_bridgeObjectRetain();
  uint64_t v33 = swift_bridgeObjectRetain();
  uint64_t v34 = v62;
  unint64_t v35 = sub_188F21C0C(v33, v63, v5, v62, v32);
  swift_bridgeObjectRelease();
  uint64_t result = sub_188F224F4(v35);
  if ((v37 & 1) == 0)
  {
    if (*(_DWORD *)(v35 + 36) == v36)
    {
      if (result == 1LL << *(_BYTE *)(v35 + 32))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C759438);
        uint64_t v38 = swift_allocObject();
        *(_OWORD *)(v38 + 16) = xmmword_188F2B2B0;
        uint64_t v65 = 0LL;
        unint64_t v66 = 0xE000000000000000LL;
        sub_188F2A668();
        uint64_t v39 = MEMORY[0x1895DA0FC](v63, v5, v34, v32);
        unint64_t v41 = v40;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v65 = v39;
        unint64_t v66 = v41;
LABEL_25:
        sub_188F2A554();
        uint64_t v43 = v65;
        unint64_t v42 = v66;
        *(void *)(v38 + 56) = MEMORY[0x189617FA8];
        *(void *)(v38 + 32) = v43;
        *(void *)(v38 + 40) = v42;
        sub_188F2A734();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v44 = 0LL;
        uint64_t v45 = 1LL;
        uint64_t v46 = v61;
LABEL_32:
        *uint64_t v46 = v44;
        v46[1] = v45;
        return result;
      }

      v54[1] = v15;
      sub_188F2257C(&v65, result, v36, 0LL, v35);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v55 = v65;
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_188F2A614();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_188F2A614();
      swift_bridgeObjectRelease();
      if (v47 == v48)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v45 = 0LL;
        goto LABEL_31;
      }

      uint64_t v49 = sub_188F2A614();
      swift_bridgeObjectRelease();
      uint64_t v50 = sub_188F2A614();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v51 = v49 + v50;
      if (!__OFADD__(v49, v50))
      {
        swift_bridgeObjectRetain();
        uint64_t v52 = v64;
        uint64_t v53 = sub_188F2A614();
        swift_bridgeObjectRelease();
        if (v51 != v53)
        {
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_18C759438);
          uint64_t v38 = swift_allocObject();
          *(_OWORD *)(v38 + 16) = xmmword_188F2B2B0;
          uint64_t v65 = 0LL;
          unint64_t v66 = 0xE000000000000000LL;
          sub_188F2A668();
          sub_188F2A554();
          MEMORY[0x1895DA0FC](a1, a2, v52, a4);
          sub_188F2A554();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }

        swift_bridgeObjectRelease();
        uint64_t v45 = sub_188F208F4(v59);
        uint64_t result = swift_bridgeObjectRelease();
LABEL_31:
        uint64_t v46 = v61;
        uint64_t v44 = v55;
        goto LABEL_32;
      }
    }

    else
    {
      __break(1u);
    }

    __break(1u);
LABEL_39:
    __break(1u);
  }

  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

  __break(1u);
LABEL_36:
  uint64_t v12 = (unint64_t)sub_188F28D20(0LL, *(void *)(v12 + 16) + 1LL, 1, (char *)v12);
LABEL_29:
  uint64_t v30 = *(void *)(v12 + 16);
  uint64_t v29 = *(void *)(v12 + 24);
  if (v30 >= v29 >> 1) {
    uint64_t v12 = (unint64_t)sub_188F28D20((char *)(v29 > 1), v30 + 1, 1, (char *)v12);
  }
  *(void *)(v12 + 16) = v30 + 1;
  uint64_t v31 = (void *)(v12 + 32 * v30);
  v31[4] = v7;
  v31[5] = v9;
  v31[6] = v10;
  v31[7] = v11;
  *(void *)(v33 + 16) = v12;
LABEL_32:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_5:
  swift_release();
  return v12;
}

char *sub_188F215D4(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_188F2160C(a1, a2, a3, *v3);
  *char v3 = result;
  return result;
}

char *sub_188F215F0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_188F2170C(a1, a2, a3, *v3);
  *char v3 = result;
  return result;
}

char *sub_188F2160C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C759468);
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

  unint64_t v13 = v10 + 32;
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

char *sub_188F2170C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C759458);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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

unint64_t sub_188F217F4( uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  v44[3] = a4;
  if (a1 < 0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  uint64_t v11 = a7;
  unint64_t v12 = a6;
  unint64_t v9 = a5;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = MEMORY[0x18961AFE8];
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v9;
  if (!a1 || (unint64_t v42 = v12 >> 14, v12 >> 14 == v9 >> 14))
  {
    sub_188F22074(v12, v41, a2 & 1, v14);
    swift_bridgeObjectRelease();
    unint64_t v12 = *(void *)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_5;
  }

  uint64_t v32 = a1;
  uint64_t v33 = v14;
  unint64_t v40 = (char *)MEMORY[0x18961AFE8];
  unint64_t v16 = v9;
  unint64_t v10 = v9;
  unint64_t v37 = v9;
  while (1)
  {
    v44[0] = sub_188F2A620();
    v44[1] = v17;
    uint64_t v18 = a3(v44);
    if (v8)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v12;
    }

    unint64_t v7 = v18;
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0) {
      break;
    }
    unint64_t v16 = sub_188F2A608();
LABEL_9:
    if (v42 == v16 >> 14) {
      goto LABEL_24;
    }
  }

  if (v10 >> 14 == v16 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v16 = sub_188F2A608();
    *(void *)(v41 + 16) = v16;
    unint64_t v10 = v16;
    unint64_t v37 = v16;
    goto LABEL_9;
  }

  if (v16 >> 14 < v10 >> 14)
  {
    __break(1u);
    goto LABEL_34;
  }

  uint64_t v19 = sub_188F2A62C();
  uint64_t v36 = v20;
  uint64_t v38 = v19;
  uint64_t v34 = v22;
  uint64_t v35 = v21;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v40 = sub_188F28D20(0LL, *((void *)v40 + 2) + 1LL, 1, v40);
  }
  unint64_t v7 = *((void *)v40 + 2);
  unint64_t v23 = *((void *)v40 + 3);
  if (v7 >= v23 >> 1) {
    unint64_t v40 = sub_188F28D20((char *)(v23 > 1), v7 + 1, 1, v40);
  }
  *((void *)v40 + 2) = v7 + 1;
  unint64_t v24 = &v40[32 * v7];
  *((void *)v24 + 4) = v38;
  *((void *)v24 + 5) = v36;
  *((void *)v24 + 6) = v35;
  *((void *)v24 + 7) = v34;
  *(void *)(v33 + 16) = v40;
  uint64_t v25 = sub_188F2A608();
  unint64_t v16 = v25;
  *(void *)(v41 + 16) = v25;
  if (*((void *)v40 + 2) != v32)
  {
    unint64_t v10 = v25;
    unint64_t v37 = v25;
    goto LABEL_9;
  }

  unint64_t v37 = v25;
  unint64_t v10 = v25;
LABEL_24:
  if (v42 == v10 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    unint64_t v12 = (unint64_t)v40;
    goto LABEL_32;
  }

  if (v42 >= v37 >> 14)
  {
    unint64_t v7 = sub_188F2A62C();
    unint64_t v9 = v26;
    unint64_t v10 = v27;
    uint64_t v11 = v28;
    swift_bridgeObjectRelease();
    unint64_t v12 = (unint64_t)v40;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_36;
    }
    goto LABEL_29;
  }

unint64_t sub_188F21C0C( uint64_t isStackAllocationSafe, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  v16[0] = a5;
  uint64_t v9 = isStackAllocationSafe;
  v16[1] = *MEMORY[0x1895F89C0];
  char v10 = *(_BYTE *)(isStackAllocationSafe + 32);
  unint64_t v11 = (unint64_t)((1LL << v10) + 63) >> 6;
  size_t v12 = 8 * v11;
  if ((v10 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1895F8858](isStackAllocationSafe);
    bzero((char *)v16 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0LL), v12);
    uint64_t v13 = sub_188F22BE0((uint64_t)v16 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0LL), v11, v9, a2, a3, a4, v16[0]);
    if (v5) {
      swift_willThrow();
    }
    else {
      a2 = v13;
    }
    swift_bridgeObjectRelease();
  }

  else
  {
    uint64_t v14 = (void *)swift_slowAlloc();
    bzero(v14, v12);
    a2 = sub_188F22BE0((uint64_t)v14, v11, v9, a2, a3, a4, v16[0]);
    MEMORY[0x1895DA54C](v14, -1LL, -1LL);
    swift_bridgeObjectRelease();
  }

  return a2;
}

uint64_t sub_188F21DBC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x18961AFF0];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C759460);
  uint64_t result = sub_188F2A6BC();
  uint64_t v8 = result;
  uint64_t v34 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0LL;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0LL;
  uint64_t v11 = result + 64;
  uint64_t v36 = v4;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      uint64_t v37 = v10;
      unint64_t v13 = v12 | (v10 << 6);
    }

    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1LL)) {
        goto LABEL_40;
      }
      if (v14 >= v34) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      uint64_t v16 = v10 + 1;
      if (!v15)
      {
        uint64_t v16 = v10 + 2;
        if (v10 + 2 >= v34) {
          return v8;
        }
        unint64_t v15 = a1[v16];
        if (!v15)
        {
          uint64_t v16 = v10 + 3;
          if (v10 + 3 >= v34) {
            return v8;
          }
          unint64_t v15 = a1[v16];
          if (!v15)
          {
            uint64_t v17 = v10 + 4;
            if (v10 + 4 >= v34) {
              return v8;
            }
            unint64_t v15 = a1[v17];
            if (!v15)
            {
              while (1)
              {
                uint64_t v16 = v17 + 1;
                if (__OFADD__(v17, 1LL)) {
                  goto LABEL_41;
                }
                if (v16 >= v34) {
                  return v8;
                }
                unint64_t v15 = a1[v16];
                ++v17;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }

            uint64_t v16 = v10 + 4;
          }
        }
      }

LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      uint64_t v37 = v16;
      unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
    }

    char v18 = *(_BYTE *)(*(void *)(v4 + 48) + v13);
    uint64_t v19 = (uint64_t *)(*(void *)(v4 + 56) + 32 * v13);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    uint64_t v22 = v19[2];
    uint64_t v23 = v19[3];
    sub_188F2A740();
    sub_188F2A74C();
    uint64_t result = sub_188F2A758();
    uint64_t v24 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v27 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        BOOL v30 = v26 == v29;
        if (v26 == v29) {
          unint64_t v26 = 0LL;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v11 + 8 * v26);
      }

      while (v31 == -1);
      unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
    }

    *(void *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v27;
    *(_BYTE *)(*(void *)(v8 + 48) + v27) = v18;
    uint64_t v32 = (void *)(*(void *)(v8 + 56) + 32 * v27);
    *uint64_t v32 = v21;
    v32[1] = v20;
    v32[2] = v22;
    v32[3] = v23;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1LL)) {
      break;
    }
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = v36;
    uint64_t v10 = v37;
    if (!v5) {
      return v8;
    }
  }

LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

            __break(1u);
LABEL_40:
            __break(1u);
            return result;
          }

          ++v8;
        }

uint64_t sub_188F22074(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v10 = *(void *)(a2 + 16) >> 14;
  int v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1) {
    return v11 ^ 1u;
  }
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v4 = a4;
  uint64_t v5 = sub_188F2A62C();
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  uint64_t v8 = v14;
  unint64_t v9 = *(char **)(v4 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    unint64_t v9 = sub_188F28D20(0LL, *((void *)v9 + 2) + 1LL, 1, v9);
    *(void *)(v4 + 16) = v9;
  }

  unint64_t v17 = *((void *)v9 + 2);
  unint64_t v16 = *((void *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    unint64_t v9 = sub_188F28D20((char *)(v16 > 1), v17 + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }

  *((void *)v9 + 2) = v17 + 1;
  char v18 = &v9[32 * v17];
  *((void *)v18 + 4) = v5;
  *((void *)v18 + 5) = v6;
  *((void *)v18 + 6) = v7;
  *((void *)v18 + 7) = v8;
  return v11 ^ 1u;
}

unint64_t sub_188F22188(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    sub_188F22264(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000LL) != 0)
    {
      unsigned int v5 = sub_188F2A65C();
    }

    else
    {
      if ((a2 & 0x2000000000000000LL) == 0 && (a1 & 0x1000000000000000LL) == 0) {
        sub_188F2A674();
      }
      unsigned int v5 = sub_188F2A680();
    }
  }

  else
  {
    unsigned int v5 = 0;
  }

  return v5 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t sub_188F22264(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000LL) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4LL << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000LL) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    uint64_t result = sub_188F22300(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_188F2236C(result, a2, a3) & 0xFFFFFFFFFFFFFFF3LL | 1;
    }
  }

  return result;
}

unint64_t sub_188F22300(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000LL) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4LL << v5) {
    uint64_t result = sub_188F2247C(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000LL) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t sub_188F2236C(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000LL;
  }

  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000LL) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000LL) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((_BYTE *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v7 = v5 - 1;
            int v11 = *((_BYTE *)&v12 + v5-- + 7) & 0xC0;
          }

          while (v11 == 128);
          return v7 << 16;
        }

        goto LABEL_14;
      }

      if ((a2 & 0x1000000000000000LL) != 0)
      {
        uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 == (a2 & 0xFFFFFFFFFFFFLL)) {
          goto LABEL_14;
        }
      }

      else
      {
        unint64_t v12 = result >> 16;
        uint64_t v6 = sub_188F2A674();
        unint64_t v5 = v12;
        if (v12 == v10) {
          goto LABEL_14;
        }
      }

      if ((*(_BYTE *)(v6 + v5) & 0xC0) == 0x80)
      {
        do
        {
          unint64_t v7 = v5 - 1;
          int v8 = *(_BYTE *)(v6 - 1 + v5--) & 0xC0;
        }

        while (v8 == 128);
        return v7 << 16;
      }

uint64_t sub_188F2247C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000LL) == 0 || (a2 & 0x800000000000000LL) != 0)
  {
    uint64_t v10 = sub_188F2A578();
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
    uint64_t v5 = MEMORY[0x1895DA15C](15LL, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000LL;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }

uint64_t sub_188F224F4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0LL;
    return __clz(__rbit64(v1)) + v2;
  }

  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1LL << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2LL;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64LL;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64LL;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

_BYTE *sub_188F2257C(_BYTE *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1LL << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }

  if (((*(void *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8LL) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(a5 + 56);
    *uint64_t result = *(_BYTE *)(*(void *)(a5 + 48) + a2);
    uint64_t v6 = *(void *)(v5 + 32 * a2);
    swift_bridgeObjectRetain();
    return (_BYTE *)v6;
  }

LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_188F22614(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1LL;
  }
  else {
    return sub_188F2A6E0() & 1;
  }
}

unint64_t sub_188F2266C()
{
  unint64_t result = qword_18C759440;
  if (!qword_18C759440)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&protocol conformance descriptor for Modifiers, &type metadata for Modifiers);
    atomic_store(result, (unint64_t *)&qword_18C759440);
  }

  return result;
}

unint64_t sub_188F226B4()
{
  unint64_t result = qword_18C759448;
  if (!qword_18C759448)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C759450);
    unint64_t result = MEMORY[0x1895DA4D4](MEMORY[0x189618488], v1);
    atomic_store(result, (unint64_t *)&qword_18C759448);
  }

  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Modifiers(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

uint64_t storeEnumTagSinglePayload for Modifiers(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_188F227E8 + 4 * byte_188F2B188[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_188F2281C + 4 * byte_188F2B183[v4]))();
}

uint64_t sub_188F2281C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_188F22824(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x188F2282CLL);
  }
  return result;
}

uint64_t sub_188F22838(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x188F22840LL);
  }
  *(_BYTE *)unint64_t result = a2 + 4;
  return result;
}

uint64_t sub_188F22844(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_188F2284C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_188F22858(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_188F22860(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Modifiers()
{
  return &type metadata for Modifiers;
}

uint64_t initializeBufferWithCopyOfBuffer for HandshakeAndModifiers(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HandshakeAndModifiers()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for HandshakeAndModifiers(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HandshakeAndModifiers(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HandshakeAndModifiers(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HandshakeAndModifiers( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for HandshakeAndModifiers()
{
  return &type metadata for HandshakeAndModifiers;
}

uint64_t sub_188F229E8(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    __asm { BR              X8 }
  }

  return MEMORY[0x18961AFE8];
}

uint64_t sub_188F22BE0( uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  char v28 = (unint64_t *)result;
  uint64_t v10 = 0LL;
  int64_t v11 = 0LL;
  uint64_t v12 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(a3 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  unint64_t v16 = a4 >> 16;
  unint64_t v17 = a5 >> 16;
LABEL_4:
  uint64_t v29 = v10;
  while (v14)
  {
    unint64_t v18 = __clz(__rbit64(v14));
    v14 &= v14 - 1;
    unint64_t v19 = v18 | (v11 << 6);
LABEL_21:
    uint64_t v23 = (void *)(*(void *)(a3 + 56) + 32 * v19);
    unint64_t result = v23[2];
    if (result != a6 || v23[3] != a7 || *v23 >> 16 != v16 || v23[1] >> 16 != v17)
    {
      unint64_t result = sub_188F2A6D4();
      if ((result & 1) == 0) {
        continue;
      }
    }

    *(unint64_t *)((char *)v28 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v19;
    uint64_t v10 = v29 + 1;
    if (!__OFADD__(v29, 1LL)) {
      goto LABEL_4;
    }
    __break(1u);
    return sub_188F21DBC(v28, a2, v29, a3);
  }

  int64_t v20 = v11 + 1;
  if (__OFADD__(v11, 1LL))
  {
    __break(1u);
    goto LABEL_37;
  }

  if (v20 >= v15) {
    return sub_188F21DBC(v28, a2, v29, a3);
  }
  unint64_t v21 = *(void *)(v30 + 8 * v20);
  ++v11;
  if (v21) {
    goto LABEL_20;
  }
  int64_t v11 = v20 + 1;
  if (v20 + 1 >= v15) {
    return sub_188F21DBC(v28, a2, v29, a3);
  }
  unint64_t v21 = *(void *)(v30 + 8 * v11);
  if (v21) {
    goto LABEL_20;
  }
  int64_t v11 = v20 + 2;
  if (v20 + 2 >= v15) {
    return sub_188F21DBC(v28, a2, v29, a3);
  }
  unint64_t v21 = *(void *)(v30 + 8 * v11);
  if (v21)
  {
LABEL_20:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v11 << 6);
    goto LABEL_21;
  }

  int64_t v22 = v20 + 3;
  if (v22 >= v15) {
    return sub_188F21DBC(v28, a2, v29, a3);
  }
  unint64_t v21 = *(void *)(v30 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_20;
  }

  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v11 >= v15) {
      return sub_188F21DBC(v28, a2, v29, a3);
    }
    unint64_t v21 = *(void *)(v30 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_20;
    }
  }

LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_188F22DC8()
{
  return swift_deallocObject();
}

uint64_t sub_188F22DEC()
{
  return swift_deallocObject();
}

BOOL static ChirpErrors.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ChirpErrors.hash(into:)()
{
  return sub_188F2A74C();
}

uint64_t ChirpErrors.hashValue.getter()
{
  return sub_188F2A758();
}

BOOL sub_188F22E80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_188F22E94()
{
  return sub_188F2A758();
}

uint64_t sub_188F22ED8()
{
  return sub_188F2A74C();
}

uint64_t sub_188F22F00()
{
  return sub_188F2A758();
}

unint64_t sub_188F22F44()
{
  unint64_t result = qword_18C759470;
  if (!qword_18C759470)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&protocol conformance descriptor for ChirpErrors, &type metadata for ChirpErrors);
    atomic_store(result, (unint64_t *)&qword_18C759470);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for ChirpErrors(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }

uint64_t storeEnumTagSinglePayload for ChirpErrors(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_188F23074 + 4 * byte_188F2B2C5[v4]))();
  }
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_188F230A8 + 4 * byte_188F2B2C0[v4]))();
}

uint64_t sub_188F230A8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_188F230B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x188F230B8LL);
  }
  return result;
}

uint64_t sub_188F230C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x188F230CCLL);
  }
  *(_BYTE *)unint64_t result = a2 + 7;
  return result;
}

uint64_t sub_188F230D0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_188F230D8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ChirpErrors()
{
  return &type metadata for ChirpErrors;
}

char *sub_188F230F4(char *result, char *a2)
{
  if (result) {
    uint64_t v3 = a2 - result;
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  unint64_t v7 = (unint64_t)a2;
  uint64_t v8 = (uint64_t)result;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (int64_t v10 = *((void *)v4 + 3) >> 1, v10 < v6))
  {
    if (v5 <= v6) {
      int64_t v11 = v5 + v3;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_188F28298(isUniquelyReferenced_nonNull_native, v11, 1, v4);
    int64_t v10 = *((void *)v4 + 3) >> 1;
  }

  uint64_t v12 = *((void *)v4 + 2);
  uint64_t v13 = v10 - v12;
  unint64_t result = sub_188F29584(&v4[v12 + 32], v10 - v12, (char *)v8, v7);
  if (v14 < v3) {
    goto LABEL_18;
  }
  if (v14 >= 1)
  {
    uint64_t v15 = *((void *)v4 + 2);
    BOOL v16 = __OFADD__(v15, v14);
    uint64_t v17 = v15 + v14;
    if (v16)
    {
      __break(1u);
      goto LABEL_26;
    }

    *((void *)v4 + 2) = v17;
  }

  if (v14 != v13) {
    goto LABEL_16;
  }
LABEL_19:
  uint64_t v8 = *((void *)v4 + 2);
  if (!result)
  {
LABEL_26:
    if (!a2) {
      goto LABEL_16;
    }
    unint64_t result = 0LL;
    goto LABEL_28;
  }

  if (a2) {
    BOOL v18 = result == a2;
  }
  else {
    BOOL v18 = 0;
  }
  if (!v18)
  {
LABEL_28:
    char v20 = *result++;
    char v19 = v20;
    while (1)
    {
      while (1)
      {
        unint64_t v21 = *((void *)v4 + 3);
        int64_t v22 = (char *)(v21 >> 1);
        uint64_t v23 = v8 + 1;
        unint64_t v26 = result;
        unint64_t v27 = a2;
        char v28 = sub_188F28298((char *)(v21 > 1), v8 + 1, 1, v4);
        a2 = v27;
        uint64_t v4 = v28;
        unint64_t result = v26;
        int64_t v22 = (char *)(*((void *)v4 + 3) >> 1);
LABEL_29:
        *((void *)v4 + 2) = v8;
      }

LABEL_32:
      v4[v8 + 32] = v19;
      if (a2 && a2 == result)
      {
LABEL_42:
        *((void *)v4 + 2) = v23;
        break;
      }

      uint64_t v24 = 0LL;
      while (1)
      {
        uint64_t v25 = (uint64_t)&v24[(void)result + 1];
        char v19 = v24[(void)result];
        if (&v22[~v8] == v24) {
          break;
        }
        v4[v8 + 33 + (void)v24++] = v19;
        if (a2 && (char *)v25 == a2)
        {
          uint64_t v23 = (uint64_t)&v24[v8 + 1];
          goto LABEL_42;
        }
      }

      unint64_t result = &v24[(void)result + 1];
      uint64_t v8 = (uint64_t)v22;
      *((void *)v4 + 2) = v22;
    }
  }

LABEL_16:
  *int v2 = v4;
  return result;
}

uint64_t sub_188F232DC(uint64_t result)
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
  unint64_t result = (uint64_t)sub_188F28E20((char *)result, v11, 1, (char *)v3);
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
    *__int16 v1 = v3;
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

  *a3 = result;
  a3[1] = v5;
  return result;
}

LABEL_18:
  __break(1u);
  return result;
}

void sub_188F233BC()
{
  unsigned __int8 v1 = *v0;
  sub_188F23A80();
  if ((v2 & 1) != 0) {
    return;
  }
  if (qword_18C7592F8 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_18C759540;
  if (!*(void *)(qword_18C759540 + 16))
  {
    __break(1u);
    goto LABEL_17;
  }

  unint64_t v4 = sub_188F25854(v1);
  if ((v5 & 1) == 0)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    return;
  }

  uint64_t v6 = (uint64_t *)(*(void *)(v3 + 56) + 32 * v4);
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  uint64_t v9 = v6[2];
  uint64_t v10 = v6[3];
  swift_bridgeObjectRetain();
  MEMORY[0x1895DA0FC](v7, v8, v9, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_188F2A560();
  if (v12)
  {
    uint64_t v13 = v11;
    uint64_t v14 = v12;
    do
    {
      if ((sub_188F2A494() & 1) != 0) {
        MEMORY[0x1895DA138](v13, v14);
      }
      swift_bridgeObjectRelease();
      uint64_t v13 = sub_188F2A560();
      uint64_t v14 = v15;
    }

    while (v15);
  }

  swift_bridgeObjectRelease();
  uint64_t v16 = sub_188F240B0(0LL, 0xE000000000000000LL);
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  if (!v18) {
    goto LABEL_18;
  }
  if (v16 != 75 || v18 != 0xE100000000000000LL) {
    sub_188F2A6E0();
  }
  swift_bridgeObjectRelease();
}

void sub_188F2357C()
{
  unsigned __int8 v1 = *v0;
  sub_188F23A80();
  if ((v2 & 1) != 0) {
    return;
  }
  if (qword_18C7592F8 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_18C759540;
  if (!*(void *)(qword_18C759540 + 16))
  {
    __break(1u);
    goto LABEL_24;
  }

  unint64_t v4 = sub_188F25854(v1);
  if ((v5 & 1) == 0)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return;
  }

  uint64_t v6 = (uint64_t *)(*(void *)(v3 + 56) + 32 * v4);
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  uint64_t v9 = v6[2];
  uint64_t v10 = v6[3];
  swift_bridgeObjectRetain();
  MEMORY[0x1895DA0FC](v7, v8, v9, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_188F2A560();
  if (v12)
  {
    uint64_t v13 = v11;
    uint64_t v14 = v12;
    uint64_t v15 = (void *)MEMORY[0x18961AFE8];
    do
    {
      if ((sub_188F2A494() & 1) != 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_188F215D4(0LL, v15[2] + 1LL, 1);
        }
        unint64_t v18 = v15[2];
        unint64_t v17 = v15[3];
        if (v18 >= v17 >> 1) {
          sub_188F215D4((char *)(v17 > 1), v18 + 1, 1);
        }
        v15[2] = v18 + 1;
        char v19 = &v15[2 * v18];
        v19[4] = v13;
        v19[5] = v14;
      }

      else
      {
        swift_bridgeObjectRelease();
      }

      uint64_t v13 = sub_188F2A560();
      uint64_t v14 = v16;
    }

    while (v16);
  }

  else
  {
    uint64_t v15 = (void *)MEMORY[0x18961AFE8];
  }

  swift_bridgeObjectRelease();
  if (v15[2] < 2uLL) {
    goto LABEL_25;
  }
  uint64_t v21 = v15[6];
  uint64_t v20 = v15[7];
  swift_bridgeObjectRetain();
  swift_release();
  if (v21 == 78 && v20 == 0xE100000000000000LL)
  {
    swift_bridgeObjectRelease();
  }

  else
  {
    sub_188F2A6E0();
    swift_bridgeObjectRelease();
  }

void sub_188F237A4()
{
  unsigned __int8 v1 = *v0;
  if (qword_18C7592F8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_18C759540;
  if (!*(void *)(qword_18C759540 + 16))
  {
    __break(1u);
    goto LABEL_14;
  }

  unint64_t v3 = sub_188F25854(v1);
  if ((v4 & 1) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v5 = (uint64_t *)(*(void *)(v2 + 56) + 32 * v3);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = v5[2];
  uint64_t v9 = v5[3];
  swift_bridgeObjectRetain();
  uint64_t v10 = MEMORY[0x1895DA0FC](v6, v7, v8, v9);
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_188F23BE0(v10, v12);
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  if (!v15)
  {
LABEL_15:
    __break(1u);
    return;
  }

  if (v13 != 78 || v15 != 0xE100000000000000LL) {
    sub_188F2A6E0();
  }
  swift_bridgeObjectRelease();
}

void sub_188F238C0()
{
  unsigned __int8 v1 = *v0;
  if (qword_18C7592F8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_18C759540;
  if (!*(void *)(qword_18C759540 + 16))
  {
    __break(1u);
    goto LABEL_16;
  }

  unint64_t v3 = sub_188F25854(v1);
  if ((v4 & 1) == 0)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    return;
  }

  char v5 = (uint64_t *)(*(void *)(v2 + 56) + 32 * v3);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = v5[2];
  uint64_t v9 = v5[3];
  swift_bridgeObjectRetain();
  MEMORY[0x1895DA0FC](v6, v7, v8, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_188F2A560();
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = v10;
    do
    {
      if ((sub_188F2A494() & 1) != 0) {
        MEMORY[0x1895DA138](v13, v12);
      }
      swift_bridgeObjectRelease();
      uint64_t v13 = sub_188F2A560();
      uint64_t v12 = v14;
    }

    while (v14);
  }

  swift_bridgeObjectRelease();
  uint64_t v15 = sub_188F2A590();
  uint64_t v17 = sub_188F23BE0(v15, v16);
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  if (!v19) {
    goto LABEL_17;
  }
  if (v17 != 75 || v19 != 0xE100000000000000LL) {
    sub_188F2A6E0();
  }
  swift_bridgeObjectRelease();
}

void sub_188F23A80()
{
  unsigned __int8 v1 = *v0;
  if (qword_18C7592F8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_18C759540;
  if (!*(void *)(qword_18C759540 + 16))
  {
    __break(1u);
    goto LABEL_12;
  }

  unint64_t v3 = sub_188F25854(v1);
  if ((v4 & 1) == 0)
  {
LABEL_12:
    __break(1u);
    return;
  }

  char v5 = (uint64_t *)(*(void *)(v2 + 56) + 32 * v3);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = v5[2];
  uint64_t v9 = v5[3];
  swift_bridgeObjectRetain();
  MEMORY[0x1895DA0FC](v6, v7, v8, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_188F2A560();
  if (v11)
  {
    uint64_t v12 = v10;
    uint64_t v13 = v11;
    do
    {
      if ((sub_188F2A494() & 1) != 0) {
        MEMORY[0x1895DA138](v12, v13);
      }
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_188F2A560();
      uint64_t v13 = v14;
    }

    while (v14);
  }

  swift_bridgeObjectRelease();
  sub_188F2A524();
  swift_bridgeObjectRelease();
}

uint64_t sub_188F23BE0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000LL) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2) {
    return sub_188F2A584();
  }
  else {
    return 0LL;
  }
}

BOOL static HandshakePattern.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HandshakePattern.hash(into:)()
{
  return sub_188F2A74C();
}

void *static HandshakePattern.allCases.getter()
{
  return &unk_18A314C08;
}

uint64_t HandshakePattern.hashValue.getter()
{
  return sub_188F2A758();
}

unint64_t sub_188F23CB0()
{
  unint64_t result = qword_18C759478;
  if (!qword_18C759478)
  {
    unint64_t result = MEMORY[0x1895DA4D4]( &protocol conformance descriptor for HandshakePattern,  &type metadata for HandshakePattern);
    atomic_store(result, (unint64_t *)&qword_18C759478);
  }

  return result;
}

unint64_t sub_188F23CF8()
{
  unint64_t result = qword_18C759480;
  if (!qword_18C759480)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C759488);
    unint64_t result = MEMORY[0x1895DA4D4](MEMORY[0x189618488], v1);
    atomic_store(result, (unint64_t *)&qword_18C759480);
  }

  return result;
}

void sub_188F23D44(void *a1@<X8>)
{
  *a1 = &unk_18A314C08;
}

uint64_t getEnumTagSinglePayload for HandshakePattern(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xDB) {
    goto LABEL_17;
  }
  if (a2 + 37 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 37) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 37;
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
      return (*a1 | (v4 << 8)) - 37;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 37;
    }
  }

uint64_t storeEnumTagSinglePayload for HandshakePattern(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 37 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 37) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xDB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xDA) {
    return ((uint64_t (*)(void))((char *)&loc_188F23E30 + 4 * byte_188F2B3B5[v4]))();
  }
  *a1 = a2 + 37;
  return ((uint64_t (*)(void))((char *)sub_188F23E64 + 4 * byte_188F2B3B0[v4]))();
}

uint64_t sub_188F23E64(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_188F23E6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x188F23E74LL);
  }
  return result;
}

uint64_t sub_188F23E80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x188F23E88LL);
  }
  *(_BYTE *)unint64_t result = a2 + 37;
  return result;
}

uint64_t sub_188F23E8C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_188F23E94(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HandshakePattern()
{
  return &type metadata for HandshakePattern;
}

uint64_t sub_188F23EB0()
{
  uint64_t v0 = 38LL;
  __int16 v1 = (void *)MEMORY[0x18961AFF0];
  int v2 = (unsigned __int8 *)&byte_18A314C28;
  while (1)
  {
    uint64_t v31 = v0;
    unsigned __int8 v6 = *v2++;
    unsigned __int8 v5 = v6;
    uint64_t v7 = sub_188F2A500();
    unint64_t v9 = v8;
    unint64_t v10 = sub_188F2A524();
    unint64_t v11 = sub_188F25DC0(v10, v7, v9);
    unint64_t v13 = v12;
    unint64_t v15 = v14;
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v20 = sub_188F25854(v6);
    uint64_t v21 = v1[2];
    BOOL v22 = (v19 & 1) == 0;
    uint64_t v23 = v21 + v22;
    if (__OFADD__(v21, v22)) {
      break;
    }
    char v24 = v19;
    if (v1[3] >= v23)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v19 & 1) != 0) {
          goto LABEL_2;
        }
      }

      else
      {
        sub_188F25C28();
        if ((v24 & 1) != 0) {
          goto LABEL_2;
        }
      }
    }

    else
    {
      sub_188F2594C(v23, isUniquelyReferenced_nonNull_native);
      unint64_t v25 = sub_188F25854(v5);
      if ((v24 & 1) != (v26 & 1)) {
        goto LABEL_18;
      }
      unint64_t v20 = v25;
      if ((v24 & 1) != 0)
      {
LABEL_2:
        int v3 = (unint64_t *)(v1[7] + 32 * v20);
        *int v3 = v11;
        v3[1] = v13;
        v3[2] = v15;
        v3[3] = v17;
        swift_bridgeObjectRelease();
        goto LABEL_3;
      }
    }

    v1[(v20 >> 6) + 8] |= 1LL << v20;
    *(_BYTE *)(v1[6] + v20) = v5;
    unint64_t v27 = (unint64_t *)(v1[7] + 32 * v20);
    *unint64_t v27 = v11;
    v27[1] = v13;
    v27[2] = v15;
    v27[3] = v17;
    uint64_t v28 = v1[2];
    BOOL v29 = __OFADD__(v28, 1LL);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_17;
    }
    v1[2] = v30;
LABEL_3:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v0 = v31 - 1;
    if (v31 == 1)
    {
      qword_18C759540 = (uint64_t)v1;
      return result;
    }
  }

  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  uint64_t result = sub_188F2A6EC();
  __break(1u);
  return result;
}

uint64_t sub_188F240B0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000LL) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0LL;
  }
  sub_188F2A530();
  return sub_188F2A584();
}

void sub_188F24128()
{
  __asm { BR              X10 }

uint64_t sub_188F24150()
{
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_188F2B2B0;
  *(_BYTE *)(result + 32) = 1;
  *(void *)(result + 56) = &type metadata for 🔜;
  *(void *)(result + 64) = &off_18A316920;
  *(void *)(result + 40) = &unk_18A314C50;
  return result;
}

void sub_188F25494(uint64_t a1)
{
  __asm { BR              X10 }

uint64_t sub_188F254D4()
{
  if (v0[2] > 0 || (unint64_t)v0[3] < 2)
  {
    __break(1u);
    JUMPOUT(0x188F2581CLL);
  }

  sub_188F1DF10(v0[1], (uint64_t)v19);
  uint64_t v2 = v20;
  uint64_t v3 = v21;
  __swift_project_boxed_opaque_existential_1(v19, v20);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  sub_188F232DC(v4);
  unint64_t v5 = v0[3];
  uint64_t v6 = *v0;
  if ((v5 & 1) != 0
    && (isUniquelyReferenced_nonNull = swift_isUniquelyReferenced_nonNull(), uint64_t *v0 = v6, isUniquelyReferenced_nonNull))
  {
    uint64_t v8 = v0[2];
  }

  else
  {
    sub_188F25E5C(v0[1], v0[2], v5);
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v8 = v13;
    unint64_t v5 = v14;
    swift_unknownObjectRelease();
    uint64_t *v0 = v10;
    v0[1] = v12;
    v0[2] = v8;
    v0[3] = v5;
  }

  if (v5 < 2 || v8 > 0)
  {
    __break(1u);
    JUMPOUT(0x188F2583CLL);
  }

  uint64_t v15 = v0[1];
  uint64_t v16 = *(void *)(v15 + 24);
  uint64_t v17 = *(void *)(v15 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v15, v16);
  return (*(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 24))(&unk_18A315C18, v16, v17);
}

unint64_t sub_188F25854(unsigned __int8 a1)
{
  uint64_t v2 = sub_188F2A758();
  return sub_188F258AC(a1, v2);
}

unint64_t sub_188F258AC(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
      }
    }
  }

  return result;
}

uint64_t sub_188F2594C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C759460);
  char v34 = a2;
  uint64_t result = sub_188F2A6B0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0LL;
    uint64_t v33 = (void *)(v5 + 64);
    uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }

      else
      {
        if (__OFADD__(v8++, 1LL)) {
          goto LABEL_40;
        }
        uint64_t result = v5 + 64;
        if (v8 >= v12)
        {
LABEL_31:
          if ((v34 & 1) == 0)
          {
            uint64_t result = swift_release();
            uint64_t v3 = v2;
            goto LABEL_38;
          }

          uint64_t v32 = 1LL << *(_BYTE *)(v5 + 32);
          if (v32 >= 64) {
            bzero(v33, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
          }
          else {
            *uint64_t v33 = -1LL << v32;
          }
          uint64_t v3 = v2;
          *(void *)(v5 + 16) = 0LL;
          break;
        }

        unint64_t v22 = v33[v8];
        if (!v22)
        {
          int64_t v23 = v8 + 1;
          if (v8 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v22 = v33[v23];
          if (!v22)
          {
            while (1)
            {
              int64_t v8 = v23 + 1;
              if (__OFADD__(v23, 1LL)) {
                break;
              }
              if (v8 >= v12) {
                goto LABEL_31;
              }
              unint64_t v22 = v33[v8];
              ++v23;
              if (v22) {
                goto LABEL_20;
              }
            }

LABEL_20:
        unint64_t v11 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }

      char v24 = *(_BYTE *)(*(void *)(v5 + 48) + v20);
      uint64_t v25 = *(void *)(v5 + 56) + 32 * v20;
      __int128 v35 = *(_OWORD *)v25;
      uint64_t v26 = *(void *)(v25 + 16);
      uint64_t v27 = *(void *)(v25 + 24);
      if ((v34 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_188F2A740();
      sub_188F2A74C();
      uint64_t result = sub_188F2A758();
      uint64_t v14 = -1LL << *(_BYTE *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1LL << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }

          BOOL v30 = v16 == v29;
          if (v16 == v29) {
            unint64_t v16 = 0LL;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v13 + 8 * v16);
        }

        while (v31 == -1);
        unint64_t v17 = __clz(__rbit64(~v31)) + (v16 << 6);
      }

      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
      *(_BYTE *)(*(void *)(v7 + 48) + v17) = v24;
      uint64_t v18 = *(void *)(v7 + 56) + 32 * v17;
      *(_OWORD *)uint64_t v18 = v35;
      *(void *)(v18 + 16) = v26;
      *(void *)(v18 + 24) = v27;
      ++*(void *)(v7 + 16);
    }
  }

  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

void *sub_188F25C28()
{
  __int16 v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C759460);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_188F2A6A4();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    *__int16 v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    if (__OFADD__(v9++, 1LL)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    if (!v22) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(v2 + 56) + 32 * v15;
    uint64_t v18 = *(void *)(v16 + 16);
    uint64_t v17 = *(void *)(v16 + 24);
    __int128 v19 = *(_OWORD *)v16;
    *(_BYTE *)(*(void *)(v4 + 48) + v15) = *(_BYTE *)(*(void *)(v2 + 48) + v15);
    uint64_t v20 = *(void *)(v4 + 56) + 32 * v15;
    *(_OWORD *)uint64_t v20 = v19;
    *(void *)(v20 + 16) = v18;
    *(void *)(v20 + 24) = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }

  int64_t v23 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    ++v9;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_23;
    }
  }

  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

unint64_t sub_188F25DC0(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else
  {
    if ((a3 & 0x2000000000000000LL) != 0) {
      uint64_t v3 = HIBYTE(a3) & 0xF;
    }
    else {
      uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v4 = 7LL;
    if (((a3 >> 60) & ((a2 & 0x800000000000000LL) == 0)) != 0) {
      uint64_t v4 = 11LL;
    }
    unint64_t v5 = v4 | (v3 << 16);
    uint64_t result = sub_188F2A53C();
    if ((v6 & 1) != 0) {
      uint64_t result = v5;
    }
    if (4 * v3 >= result >> 14) {
      return sub_188F2A59C();
    }
  }

  __break(1u);
  return result;
}

void sub_188F25E5C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t v3 = a3 >> 1;
  uint64_t v4 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2)) {
    goto LABEL_11;
  }
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C759490);
    char v6 = (void *)swift_allocObject();
    size_t v7 = _swift_stdlib_malloc_size(v6);
    void v6[2] = v4;
    void v6[3] = 2 * ((uint64_t)(v7 - 32) / 40);
    if (v3 >= a2) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }

  char v6 = (void *)MEMORY[0x18961AFE8];
  if (v3 < a2)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

LABEL_4:
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C759498);
  swift_arrayInitWithCopy();
  if (__OFSUB__(0LL, a2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v8 = v6[2];
  BOOL v9 = __OFADD__(a2, v8);
  uint64_t v10 = a2 + v8;
  if (v9)
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

  if (v10 < 0) {
LABEL_15:
  }
    __break(1u);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

uint64_t assignWithTake for 🔙(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for 🔙()
{
  return &type metadata for 🔙;
}

uint64_t _s5Chirp4____Vwca_0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5Chirp4____Vwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(sub_188F15B5C(v1, v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_188F2607C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for 🔜()
{
  return &type metadata for 🔜;
}

uint64_t getEnumTagSinglePayload for MessagePatternTokens(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MessagePatternTokens(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_188F261A4 + 4 * byte_188F2B5F5[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_188F261D8 + 4 * asc_188F2B5F0[v4]))();
}

uint64_t sub_188F261D8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_188F261E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x188F261E8LL);
  }
  return result;
}

uint64_t sub_188F261F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x188F261FCLL);
  }
  *(_BYTE *)uint64_t result = a2 + 6;
  return result;
}

uint64_t sub_188F26200(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_188F26208(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MessagePatternTokens()
{
  return &type metadata for MessagePatternTokens;
}

unint64_t sub_188F26228()
{
  unint64_t result = qword_18C7594A0;
  if (!qword_18C7594A0)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C7594A8);
    unint64_t result = MEMORY[0x1895DA4D4](MEMORY[0x189618488], v1);
    atomic_store(result, (unint64_t *)&qword_18C7594A0);
  }

  return result;
}

void sub_188F26274(void *a1@<X8>)
{
  *a1 = &unk_18A315D50;
}

unint64_t sub_188F26288()
{
  unint64_t result = qword_18C7594B0;
  if (!qword_18C7594B0)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&unk_188F2B6B0, &type metadata for MessagePatternTokens);
    atomic_store(result, (unint64_t *)&qword_18C7594B0);
  }

  return result;
}

uint64_t (*sub_188F262CC())()
{
  return nullsub_1;
}

uint64_t sub_188F262DC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_188F262E4(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

void sub_188F2631C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000LL) == 0) {
    __asm { BR              X9 }
  }

  __break(1u);
  JUMPOUT(0x188F26464LL);
}

uint64_t sub_188F26498(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < 0)
  {
    __break(1u);
  }

  else
  {
    if (a2) {
      uint64_t v3 = a3 - a2;
    }
    else {
      uint64_t v3 = 0LL;
    }
    uint64_t result = sub_188F2981C(0LL, result, v3, a2, a3);
    if ((v4 & 1) != 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = result;
    }
    if ((v5 & 0x8000000000000000LL) == 0) {
      return 0LL;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_188F26508(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }

  if (a2) {
    uint64_t v3 = a3 - a2;
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t result = sub_188F2981C(v3, -result, 0LL, a2, a3);
  if ((v4 & 1) != 0) {
    uint64_t result = 0LL;
  }
  if (v3 < result) {
    goto LABEL_10;
  }
  return result;
}

void sub_188F2657C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000LL) == 0) {
    __asm { BR              X9 }
  }

  __break(1u);
  JUMPOUT(0x188F266C8LL);
}

void sub_188F266FC(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v10 = type metadata accessor for CipherState(0LL, a2, a3, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(a4, 1LL, 1LL, v10);
  __asm { BR              X9 }

uint64_t sub_188F267E4()
{
  *(void *)(v6 - 176) = v3;
  swift_getAssociatedConformanceWitness();
  if (sub_188F2A464() < BYTE6(v5))
  {
    *(void *)(v6 - 136) = v1;
    *(void *)(v6 - 128) = v5;
    sub_188F15F50();
    sub_188F2A374();
    sub_188F2A2F0();
    uint64_t v7 = *(void *)(v6 - 160);
    *(void *)(v6 - 136) = *(void *)(v6 - 152);
    *(void *)(v6 - 128) = v2;
    *(void *)(v6 - 120) = v7;
    *(void *)(v6 - 112) = v4;
    type metadata accessor for SymmetricState();
  }

  uint64_t v8 = sub_188F2A464();
  return ((uint64_t (*)(uint64_t))((char *)&loc_188F268EC + dword_188F26A8C[v0]))(v8);
}

void sub_188F26900(uint64_t a1)
{
  BOOL v7 = __OFSUB__(a1, BYTE6(v1));
  uint64_t v8 = a1 - BYTE6(v1);
  if (!v7)
  {
    *(void *)(v6 - 136) = sub_188F29AFC(v8);
    *(void *)(v6 - 128) = v9;
    sub_188F28F10(v6 - 136);
    uint64_t v10 = *(void *)(v6 - 136);
    unint64_t v11 = *(void *)(v6 - 128);
    *(void *)(v6 - 96) = v3;
    *(void *)(v6 - 88) = v1;
    sub_188F15B18(v3, v1);
    sub_188F15B18(v10, v11);
    sub_188F1DCF8(v10, v11);
    sub_188F15B5C(v10, v11);
    sub_188F15B5C(v10, v11);
    *(void *)(v6 - 136) = v5;
    *(void *)(v6 - 128) = v2;
    *(void *)(v6 - 120) = *(void *)(v6 - 160);
    *(void *)(v6 - 112) = v4;
    type metadata accessor for SymmetricState();
  }

  __break(1u);
  JUMPOUT(0x188F26A6CLL);
}

void sub_188F269AC(uint64_t a1)
{
  uint64_t v4 = (void *)(v3 + *(int *)(a1 + 56));
  *uint64_t v4 = v1;
  v4[1] = v2;
  JUMPOUT(0x188F269B8LL);
}

uint64_t sub_188F26A08(uint64_t a1)
{
  uint64_t v5 = (uint64_t *)(v3 + *(int *)(a1 + 56));
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  *(void *)(v4 - 136) = *v5;
  *(void *)(v4 - 128) = v7;
  sub_188F15B18(v6, v7);
  sub_188F2A398();
  return sub_188F15B5C(v2, v1);
}

uint64_t sub_188F26A9C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v8 = (uint64_t *)(v3 + *(int *)(a3 + 56));
  uint64_t v9 = *v8;
  uint64_t v14 = *v8;
  unint64_t v15 = v8[1];
  sub_188F15B18(*v8, v15);
  sub_188F15B18(a1, a2);
  sub_188F1DCF8(a1, a2);
  sub_188F15B5C(a1, a2);
  sub_188F15F50();
  sub_188F2A374();
  sub_188F15B5C(v14, v15);
  swift_getAssociatedConformanceWitness();
  uint64_t v10 = sub_188F2A2F0();
  uint64_t v12 = v11;
  uint64_t result = sub_188F15B5C(v9, v15);
  *uint64_t v8 = v10;
  v8[1] = v12;
  return result;
}

uint64_t sub_188F26C04(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_188F2A3A4();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v9);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a3);
  sub_188F2A398();
  sub_188F27420((uint64_t)v12, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_188F26CF8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v20 = a2;
  uint64_t v7 = type metadata accessor for CipherState(255LL, *(void *)(a3 + 16), *(void *)(a3 + 32), a4);
  uint64_t v8 = sub_188F2A5FC();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v19 - v10;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)&v19 - v10, v4, v8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48LL);
  int v13 = v12(v11, 1LL, v7);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v13 == 1)
  {
    unint64_t v14 = v20;
    sub_188F15B18(a1, v20);
    uint64_t v7 = a1;
    goto LABEL_6;
  }

  unint64_t v14 = v20;
  v22[0] = a1;
  v22[1] = v20;
  __int128 v21 = *(_OWORD *)&v4[*(int *)(a3 + 56)];
  uint64_t result = v12(v4, 1LL, v7);
  if ((_DWORD)result != 1)
  {
    unint64_t v16 = sub_188F15F50();
    uint64_t v17 = v19;
    uint64_t v18 = sub_188F155C8((uint64_t)v22, (uint64_t)&v21, v7, MEMORY[0x189606D70], MEMORY[0x189606D70], v16, v16);
    if (v17) {
      return v7;
    }
    uint64_t v7 = v18;
LABEL_6:
    sub_188F26A9C(a1, v14, a3);
    return v7;
  }

  __break(1u);
  return result;
}

uint64_t sub_188F26E7C(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v6 = sub_188F2A3A4();
  uint64_t v22 = *(void *)(v6 - 8);
  uint64_t v23 = v6;
  uint64_t v7 = MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v7);
  uint64_t v11 = (char *)&v20 - v10;
  uint64_t v12 = a3[5];
  uint64_t v13 = a3[3];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t result = sub_188F2A464();
  if ((unsigned __int128)(result * (__int128)3LL) >> 64 == (3 * result) >> 63)
  {
    *(void *)&__int128 v25 = a1;
    *((void *)&v25 + 1) = a2;
    uint64_t v21 = result;
    sub_188F15B18(a1, a2);
    sub_188F2A398();
    unint64_t v15 = v11;
    uint64_t v17 = v23;
    uint64_t v16 = v24;
    __int128 v25 = xmmword_188F2B0C0;
    sub_188F15F50();
    static HKDF.deriveKey<A>(inputKeyMaterial:salt:info:outputByteCount:)();
    uint64_t v18 = *(uint64_t (**)(char *, uint64_t))(v22 + 8);
    uint64_t v19 = v18(v9, v17);
    MEMORY[0x1895F8858](v19);
    *(&v20 - 6) = a3[2];
    *(&v20 - 5) = v13;
    *(&v20 - 4) = a3[4];
    *(&v20 - 3) = v12;
    *(&v20 - 2) = v21;
    *(&v20 - 1) = v16;
    sub_188F2A38C();
    return v18(v15, v17);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_188F27088@<X0>(int a1@<W0>, int a2@<W1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  int v21 = a1;
  int v22 = a2;
  uint64_t v23 = a4;
  uint64_t v5 = sub_188F2A3A4();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1895F8858](v5);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v7);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = a3[5];
  uint64_t v13 = a3[3];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v14 = sub_188F2A464();
  __int128 v24 = xmmword_188F2B0C0;
  __int128 v25 = xmmword_188F2B0C0;
  uint64_t result = sub_188F2A398();
  __int128 v25 = v24;
  if (v14 + 0x4000000000000000LL < 0)
  {
    __break(1u);
  }

  else
  {
    sub_188F15F50();
    static HKDF.deriveKey<A>(inputKeyMaterial:salt:info:outputByteCount:)();
    uint64_t v16 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
    uint64_t v17 = v16(v9, v5);
    MEMORY[0x1895F8858](v17);
    uint64_t v18 = a3[2];
    *((void *)&v21 - 6) = v18;
    *((void *)&v21 - 5) = v13;
    uint64_t v19 = a3[4];
    *((void *)&v21 - 4) = v19;
    *((void *)&v21 - 3) = v12;
    *((void *)&v21 - 2) = v14;
    *((_BYTE *)&v21 - 8) = v21 & 1;
    *((_BYTE *)&v21 - 7) = v22 & 1;
    type metadata accessor for TransportState(0LL, v18, v19, v20);
    sub_188F2A38C();
    return v16(v11, v5);
  }

  return result;
}

uint64_t sub_188F2729C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v21 = a2;
  uint64_t v7 = type metadata accessor for CipherState(255LL, *(void *)(a3 + 16), *(void *)(a3 + 32), a4);
  uint64_t v8 = sub_188F2A5FC();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v20 - v10;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)&v20 - v10, v4, v8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48LL);
  int v13 = v12(v11, 1LL, v7);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v13 == 1)
  {
    unint64_t v14 = v21;
    sub_188F26A9C(a1, v21, a3);
    sub_188F15B18(a1, v14);
    return a1;
  }

  v23[0] = a1;
  v23[1] = v21;
  __int128 v22 = *(_OWORD *)&v4[*(int *)(a3 + 56)];
  uint64_t result = v12(v4, 1LL, v7);
  if ((_DWORD)result != 1)
  {
    unint64_t v16 = sub_188F15F50();
    uint64_t v17 = v20;
    uint64_t v18 = sub_188F15174((uint64_t)v23, (uint64_t)&v22, v7, MEMORY[0x189606D70], MEMORY[0x189606D70], v16, v16);
    if (!v17)
    {
      a1 = v18;
      sub_188F26A9C(v18, v19, a3);
    }

    return a1;
  }

  __break(1u);
  return result;
}

uint64_t sub_188F27420(uint64_t a1, void *a2)
{
  uint64_t v20 = a1;
  uint64_t v3 = sub_188F2A3A4();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](v3);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = MEMORY[0x1895F8858](v5);
  uint64_t v10 = (char *)&v19 - v9;
  MEMORY[0x1895F8858](v8);
  uint64_t v12 = (char *)&v19 - v11;
  uint64_t v13 = a2[5];
  uint64_t v14 = a2[3];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t result = sub_188F2A464();
  if (result + 0x4000000000000000LL < 0)
  {
    __break(1u);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v20, v3);
    sub_188F295F4();
    sub_188F2A398();
    uint64_t v16 = v21;
    __int128 v22 = xmmword_188F2B0C0;
    sub_188F15F50();
    static HKDF.deriveKey<A>(inputKeyMaterial:salt:info:outputByteCount:)();
    uint64_t v17 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
    uint64_t v18 = v17(v10, v3);
    MEMORY[0x1895F8858](v18);
    *(&v19 - 6) = a2[2];
    *(&v19 - 5) = v14;
    *(&v19 - 4) = a2[4];
    *(&v19 - 3) = v13;
    *(&v19 - 2) = v16;
    sub_188F2A38C();
    return v17(v12, v3);
  }

  return result;
}

uint64_t static HKDF.deriveKey<A>(inputKeyMaterial:salt:info:outputByteCount:)()
{
  int v0 = (char *)v3;
  sub_188F15A88();
  sub_188F2A428();
  rsize_t v1 = *(void *)(v3 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    int v0 = sub_188F28E2C(0LL, v1, 0, (char *)v3, &qword_18C759418);
  }
  memset_s(v0 + 32, v1, 0, v1);
  return swift_bridgeObjectRelease();
}

void sub_188F27738( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v23 = a4;
  uint64_t v24 = a6;
  uint64_t v35 = a3;
  v22[1] = a1;
  void v22[2] = a2;
  uint64_t v28 = type metadata accessor for CipherState(255LL, a4, a6, a4);
  uint64_t v11 = sub_188F2A5FC();
  uint64_t v29 = *(void *)(v11 - 8);
  uint64_t v30 = v11;
  MEMORY[0x1895F8858](v11);
  uint64_t v27 = (char *)v22 - v12;
  uint64_t v13 = sub_188F2A3A4();
  uint64_t v14 = MEMORY[0x1895F8858](v13);
  __int128 v25 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  uint64_t v26 = (char *)v22 - v17;
  MEMORY[0x1895F8858](v16);
  v22[0] = a7;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v18 = sub_188F2A464();
  uint64_t v31 = sub_188F26498(v18, a1, a2);
  uint64_t v32 = v19;
  uint64_t v33 = v20;
  uint64_t v34 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7594C8);
  sub_188F2965C();
  sub_188F2A398();
  uint64_t v31 = v23;
  uint64_t v32 = a5;
  uint64_t v33 = v24;
  uint64_t v34 = v22[0];
  type metadata accessor for SymmetricState();
}

uint64_t sub_188F278F8(uint64_t a1)
{
  uint64_t v7 = sub_188F2A464();
  *(void *)(v6 - 112) = sub_188F26508(v7, *(void *)(v6 - 200), *(void *)(v6 - 192));
  *(void *)(v6 - 104) = v8;
  *(void *)(v6 - 96) = v9;
  *(void *)(v6 - 88) = v10;
  sub_188F2A398();
  sub_188F279FC();
  (*(void (**)(void, uint64_t, uint64_t))(v1 + 16))(*(void *)(v6 - 168), v4, v5);
  sub_188F295F4();
  uint64_t v11 = *(void *)(v6 - 160);
  sub_188F2A398();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v5);
  uint64_t v12 = *(void *)(v6 - 152);
  sub_188F1510C(v11, v2, v3, v12);
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(*(void *)(v6 - 144) - 8LL) + 56LL))(v12, 0LL, 1LL);
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(v6 - 136) + 40LL))( *(void *)(v6 - 72),  v12,  *(void *)(v6 - 128));
}

uint64_t sub_188F279FC()
{
  uint64_t v1 = sub_188F2A3A4();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1895F8858](v1);
  uint64_t v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  uint64_t v7 = v0;
  sub_188F2A38C();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

void sub_188F27AB0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v29 = a8;
  uint64_t v24 = a6;
  v23[9] = type metadata accessor for CipherState(255LL, a5, a7, a4);
  uint64_t v13 = sub_188F2A5FC();
  v23[7] = *(void *)(v13 - 8);
  v23[8] = v13;
  MEMORY[0x1895F8858](v13);
  v23[6] = (char *)v23 - v14;
  uint64_t v15 = sub_188F2A3A4();
  uint64_t v16 = MEMORY[0x1895F8858](v15);
  v23[5] = (char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = MEMORY[0x1895F8858](v16);
  v23[4] = (char *)v23 - v19;
  MEMORY[0x1895F8858](v18);
  v23[0] = a1;
  void v23[2] = a2;
  uint64_t v25 = sub_188F26498(a3, a1, a2);
  uint64_t v26 = v20;
  uint64_t v27 = v21;
  uint64_t v28 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7594C8);
  sub_188F2965C();
  sub_188F2A398();
  uint64_t v25 = a5;
  uint64_t v26 = v24;
  v23[10] = a5;
  uint64_t v24 = a7;
  uint64_t v27 = a7;
  uint64_t v28 = v29;
  type metadata accessor for SymmetricState();
}

uint64_t sub_188F27C2C(uint64_t a1)
{
  uint64_t v10 = v2;
  uint64_t v11 = v2 + *(int *)(a1 + 52);
  *(void *)(v8 - 72) = v5;
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 40);
  *(void *)(v8 - 264) = v4;
  uint64_t result = v12(v11, v7, v4);
  if (v6 + 0x4000000000000000LL < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v14 = sub_188F26508(2 * v6, *(void *)(v8 - 272), *(void *)(v8 - 256));
    uint64_t v16 = v15;
    uint64_t v17 = v10;
    *(void *)(v8 - 256) = a1;
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    *(void *)(v8 - 104) = v1;
    *(void *)(v8 - 96) = v3;
    uint64_t v22 = (void *)swift_allocObject();
    *(void *)(v8 - 128) = v22;
    void v22[2] = v14;
    void v22[3] = v16;
    v22[4] = v19;
    v22[5] = v21;
    uint64_t v23 = __swift_project_boxed_opaque_existential_1((void *)(v8 - 128), v1);
    __int128 v24 = v23[1];
    *(_OWORD *)(v8 - 176) = *v23;
    *(_OWORD *)(v8 - 160) = v24;
    sub_188F2A728();
    uint64_t v25 = *(void *)(v8 - 144);
    unint64_t v26 = *(void *)(v8 - 136);
    __swift_destroy_boxed_opaque_existential_1(v8 - 128);
    *(void *)(v8 - 128) = v25;
    *(void *)(v8 - 120) = v26;
    sub_188F15B18(v25, v26);
    sub_188F15B18(v25, v26);
    sub_188F2631C(v6, v25, v26);
    uint64_t v28 = *(void *)(v8 - 176);
    unint64_t v27 = *(void *)(v8 - 168);
    sub_188F2657C(v6, v25, v26);
    *(_OWORD *)(v8 - 144) = *(_OWORD *)(v8 - 176);
    sub_188F2A398();
    uint64_t v29 = v17;
    sub_188F26A9C(v28, v27, *(void *)(v8 - 256));
    sub_188F279FC();
    uint64_t v30 = *(void *)(v8 - 72);
    uint64_t v31 = *(void *)(v8 - 264);
    (*(void (**)(void, uint64_t, uint64_t))(v30 + 16))(*(void *)(v8 - 232), v7, v31);
    sub_188F295F4();
    uint64_t v32 = *(void *)(v8 - 240);
    sub_188F2A398();
    uint64_t v33 = *(void *)(v8 - 224);
    sub_188F1510C(v32, *(void *)(v8 - 192), *(void *)(v8 - 184), v33);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(*(void *)(v8 - 200) - 8LL) + 56LL))(v33, 0LL, 1LL);
    (*(void (**)(uint64_t, uint64_t, void))(*(void *)(v8 - 216) + 40LL))(v29, v33, *(void *)(v8 - 208));
    sub_188F290F8(v8 - 128);
    sub_188F15B5C(v28, v27);
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v7, v31);
    return sub_188F15B5C(*(void *)(v8 - 128), *(void *)(v8 - 120));
  }

  return result;
}

uint64_t sub_188F27E74@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v22 = a7;
  int v23 = a4;
  int v24 = a5;
  uint64_t v25 = a9;
  uint64_t v15 = sub_188F2A3A4();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1895F8858](v15);
  uint64_t v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  sub_188F2A398();
  uint64_t v26 = a6;
  uint64_t v27 = v22;
  uint64_t v28 = a8;
  uint64_t v29 = a10;
  uint64_t v30 = a3;
  char v31 = v23;
  char v32 = v24;
  type metadata accessor for TransportState(0LL, a6, a8, v19);
  sub_188F2A38C();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t sub_188F27F98@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X7>, _BYTE *a8@<X8>)
{
  uint64_t v34 = a7;
  int v37 = a4;
  int v38 = a5;
  uint64_t v36 = a8;
  uint64_t v12 = type metadata accessor for CipherState(0LL, a6, a7, a4);
  uint64_t v13 = MEMORY[0x1895F8858](v12);
  uint64_t v35 = (uint64_t)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v13);
  uint64_t v33 = (uint64_t)&v32 - v15;
  uint64_t v16 = sub_188F2A3A4();
  uint64_t v17 = MEMORY[0x1895F8858](v16);
  uint64_t v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v17);
  uint64_t v21 = (char *)&v32 - v20;
  uint64_t v39 = sub_188F26498(a3, a1, a2);
  uint64_t v40 = v22;
  uint64_t v41 = v23;
  uint64_t v42 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7594C8);
  sub_188F2965C();
  sub_188F2A398();
  sub_188F279FC();
  uint64_t v39 = sub_188F26508(a3, a1, a2);
  uint64_t v40 = v25;
  uint64_t v41 = v26;
  uint64_t v42 = v27;
  sub_188F2A398();
  sub_188F279FC();
  uint64_t v29 = v33;
  uint64_t v28 = v34;
  sub_188F1510C((uint64_t)v21, a6, v34, v33);
  uint64_t v30 = v35;
  sub_188F1510C((uint64_t)v19, a6, v28, v35);
  return sub_188F166B0(v37, v38, v29, v30, a6, v28, v36);
}

uint64_t sub_188F28178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_188F2A3A4();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = MEMORY[0x1895F8858](v6);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!a1) {
    goto LABEL_6;
  }
  if (a2 - a1 == 32) {
    return result;
  }
  if (a2 - a1 != 64)
  {
LABEL_6:
    __break(1u);
    return result;
  }

  v14[0] = sub_188F26498(32LL, a1, a2);
  v14[1] = v11;
  v14[2] = v12;
  v14[3] = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7594C8);
  sub_188F2965C();
  sub_188F2A398();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 40))(a3, v10, v6);
}

size_t sub_188F2826C@<X0>(size_t a1@<X0>, unint64_t a2@<X1>, size_t *a3@<X8>)
{
  size_t result = sub_188F294D4(a1, a2);
  *a3 = result;
  return result;
}

char *sub_188F28298(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_188F28E2C(a1, a2, a3, a4, &qword_18C759418);
}

uint64_t sub_188F282A4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_188F282AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_188F2A5FC();
  if (v5 <= 0x3F)
  {
    uint64_t result = sub_188F2A3A4();
    if (v6 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0LL;
    }
  }

  return result;
}

uint64_t *sub_188F2834C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  int v6 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain();
  }

  else
  {
    uint64_t v8 = type metadata accessor for CipherState(0LL, *(void *)(a3 + 16), *(void *)(a3 + 32), a4);
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v9 + 48))(a2, 1LL, v8))
    {
      uint64_t v10 = sub_188F2A5FC();
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    }

    else
    {
      uint64_t v12 = sub_188F2A3A4();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16LL))(a1, a2, v12);
      *(uint64_t *)((char *)a1 + *(int *)(v8 + 36)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 36));
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0LL, 1LL, v8);
    }

    uint64_t v13 = *(int *)(a3 + 52);
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_188F2A3A4();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16LL))(v14, v15, v16);
    uint64_t v17 = *(int *)(a3 + 56);
    uint64_t v18 = (uint64_t *)((char *)a1 + v17);
    uint64_t v19 = (uint64_t *)((char *)a2 + v17);
    uint64_t v20 = *v19;
    unint64_t v21 = v19[1];
    sub_188F15B18(*v19, v21);
    *uint64_t v18 = v20;
    v18[1] = v21;
  }

  return a1;
}

uint64_t sub_188F28494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for CipherState(0LL, *(void *)(a2 + 16), *(void *)(a2 + 32), a4);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48LL))(a1, 1LL, v6))
  {
    uint64_t v7 = sub_188F2A3A4();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(a1, v7);
  }

  uint64_t v8 = a1 + *(int *)(a2 + 52);
  uint64_t v9 = sub_188F2A3A4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);
  return sub_188F15B5C(*(void *)(a1 + *(int *)(a2 + 56)), *(void *)(a1 + *(int *)(a2 + 56) + 8));
}

char *sub_188F28534(char *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for CipherState(0LL, *(void *)(a3 + 16), *(void *)(a3 + 32), a4);
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1LL, v7))
  {
    uint64_t v9 = sub_188F2A5FC();
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64LL));
  }

  else
  {
    uint64_t v10 = sub_188F2A3A4();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL))(a1, a2, v10);
    *(void *)&a1[*(int *)(v7 + 36)] = *(void *)&a2[*(int *)(v7 + 36)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0LL, 1LL, v7);
  }

  uint64_t v11 = *(int *)(a3 + 52);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = sub_188F2A3A4();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16LL))(v12, v13, v14);
  uint64_t v15 = *(int *)(a3 + 56);
  uint64_t v16 = (uint64_t *)&a1[v15];
  uint64_t v17 = (uint64_t *)&a2[v15];
  uint64_t v18 = *v17;
  unint64_t v19 = v17[1];
  sub_188F15B18(*v17, v19);
  *uint64_t v16 = v18;
  v16[1] = v19;
  return a1;
}

char *sub_188F28650(char *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for CipherState(0LL, *(void *)(a3 + 16), *(void *)(a3 + 32), a4);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(a1, 1LL, v7);
  int v11 = v9(a2, 1LL, v7);
  if (!v10)
  {
    if (!v11)
    {
      uint64_t v26 = sub_188F2A3A4();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 24LL))(a1, a2, v26);
      *(void *)&a1[*(int *)(v7 + 36)] = *(void *)&a2[*(int *)(v7 + 36)];
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(a1, v7);
    goto LABEL_6;
  }

  if (v11)
  {
LABEL_6:
    uint64_t v13 = sub_188F2A5FC();
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64LL));
    goto LABEL_7;
  }

  uint64_t v12 = sub_188F2A3A4();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL))(a1, a2, v12);
  *(void *)&a1[*(int *)(v7 + 36)] = *(void *)&a2[*(int *)(v7 + 36)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0LL, 1LL, v7);
LABEL_7:
  uint64_t v14 = *(int *)(a3 + 52);
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = sub_188F2A3A4();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24LL))(v15, v16, v17);
  uint64_t v18 = *(int *)(a3 + 56);
  unint64_t v19 = (uint64_t *)&a1[v18];
  uint64_t v20 = (uint64_t *)&a2[v18];
  uint64_t v21 = *v20;
  unint64_t v22 = v20[1];
  sub_188F15B18(*v20, v22);
  uint64_t v23 = *v19;
  unint64_t v24 = v19[1];
  *unint64_t v19 = v21;
  v19[1] = v22;
  sub_188F15B5C(v23, v24);
  return a1;
}

char *sub_188F287D8(char *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for CipherState(0LL, *(void *)(a3 + 16), *(void *)(a3 + 32), a4);
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1LL, v7))
  {
    uint64_t v9 = sub_188F2A5FC();
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64LL));
  }

  else
  {
    uint64_t v10 = sub_188F2A3A4();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32LL))(a1, a2, v10);
    *(void *)&a1[*(int *)(v7 + 36)] = *(void *)&a2[*(int *)(v7 + 36)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0LL, 1LL, v7);
  }

  uint64_t v11 = *(int *)(a3 + 52);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = sub_188F2A3A4();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32LL))(v12, v13, v14);
  *(_OWORD *)&a1[*(int *)(a3 + 56)] = *(_OWORD *)&a2[*(int *)(a3 + 56)];
  return a1;
}

char *sub_188F288E0(char *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for CipherState(0LL, *(void *)(a3 + 16), *(void *)(a3 + 32), a4);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(a1, 1LL, v7);
  int v11 = v9(a2, 1LL, v7);
  if (!v10)
  {
    if (!v11)
    {
      uint64_t v22 = sub_188F2A3A4();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 40LL))(a1, a2, v22);
      *(void *)&a1[*(int *)(v7 + 36)] = *(void *)&a2[*(int *)(v7 + 36)];
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(a1, v7);
    goto LABEL_6;
  }

  if (v11)
  {
LABEL_6:
    uint64_t v13 = sub_188F2A5FC();
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64LL));
    goto LABEL_7;
  }

  uint64_t v12 = sub_188F2A3A4();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32LL))(a1, a2, v12);
  *(void *)&a1[*(int *)(v7 + 36)] = *(void *)&a2[*(int *)(v7 + 36)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0LL, 1LL, v7);
LABEL_7:
  uint64_t v14 = *(int *)(a3 + 52);
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = sub_188F2A3A4();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40LL))(v15, v16, v17);
  uint64_t v18 = *(int *)(a3 + 56);
  uint64_t v19 = *(void *)&a1[v18];
  unint64_t v20 = *(void *)&a1[v18 + 8];
  *(_OWORD *)&a1[v18] = *(_OWORD *)&a2[v18];
  sub_188F15B5C(v19, v20);
  return a1;
}

uint64_t sub_188F28A58()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_188F28A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_188F2A5FC();
  uint64_t v8 = *(void *)(v7 - 8);
  if (*(_DWORD *)(v8 + 84) == (_DWORD)a2)
  {
    uint64_t v9 = v7;
    int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    uint64_t v11 = a1;
    return v10(v11, a2, v9);
  }

  uint64_t v12 = sub_188F2A3A4();
  uint64_t v13 = *(void *)(v12 - 8);
  if (*(_DWORD *)(v13 + 84) == (_DWORD)a2)
  {
    uint64_t v9 = v12;
    uint64_t v11 = a1 + *(int *)(a3 + 52);
    int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
    return v10(v11, a2, v9);
  }

  uint64_t v15 = *(void *)(a1 + *(int *)(a3 + 56) + 8) >> 60;
  if (((4 * (_DWORD)v15) & 0xC) != 0) {
    return 16 - ((4 * (_DWORD)v15) & 0xC | (v15 >> 2));
  }
  else {
    return 0LL;
  }
}

uint64_t sub_188F28B34()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_188F28B40(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_188F2A5FC();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
    return v11(v12, a2, a2, v10);
  }

  uint64_t result = sub_188F2A3A4();
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 52);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }

  uint64_t v15 = (void *)(a1 + *(int *)(a4 + 56));
  *uint64_t v15 = 0LL;
  v15[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  return result;
}

void type metadata accessor for SymmetricState()
{
}

char *sub_188F28C14(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7594E0);
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
    swift_arrayInitWithCopy();
  }

  swift_bridgeObjectRelease();
  return v10;
}

char *sub_188F28D14(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_188F28E2C(a1, a2, a3, a4, &qword_18C759458);
}

char *sub_188F28D20(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7594B8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
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

char *sub_188F28E20(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_188F28E2C(a1, a2, a3, a4, &qword_18C7594D8);
}

char *sub_188F28E2C(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
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

  int64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    int64_t v10 = *((void *)a4 + 2);
  }
  else {
    int64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    int64_t v11 = (char *)swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    int64_t v11 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v9]) {
      memmove(v13, v14, v9);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, v9);
  }

  swift_bridgeObjectRelease();
  return v11;
}

void sub_188F28F10(uint64_t a1)
{
  __asm { BR              X13 }

void *sub_188F28F6C( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __b, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
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
  *uint64_t v26 = v30;
  v26[1] = v29;
  return result;
}

void sub_188F290F8(uint64_t a1)
{
  __asm { BR              X11 }

uint64_t sub_188F29150@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t __s, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v21 = v18;
  LOWORD(v22) = a1;
  BYTE2(v22) = BYTE2(a1);
  HIBYTE(v22) = BYTE3(a1);
  unsigned __int8 v23 = BYTE4(a1);
  unsigned __int8 v24 = BYTE5(a1);
  unsigned __int8 v25 = BYTE6(a1);
  uint64_t result = memset_s(&v21, BYTE6(a1), 0, BYTE6(a1));
  unint64_t v20 = v22 | ((unint64_t)v23 << 32) | ((unint64_t)v24 << 40) | ((unint64_t)v25 << 48);
  *uint64_t v17 = v21;
  v17[1] = v20;
  return result;
}

_BYTE *sub_188F293E0@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, void *a3@<X8>)
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
    uint64_t result = (_BYTE *)sub_188F298D4(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }

  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (_BYTE *)sub_188F29994((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000LL;
  }

  else
  {
    uint64_t result = (_BYTE *)sub_188F29A0C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000LL;
  }

char *sub_188F29454(int *a1, int a2)
{
  uint64_t result = (char *)sub_188F2A2B4();
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t result = (char *)sub_188F2A260();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v7 = result;
  uint64_t result = (char *)sub_188F2A284();
  uint64_t v8 = v5 - (void)result;
  if (__OFSUB__(v5, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  int64_t v9 = v6 - v5;
  uint64_t v10 = sub_188F2A278();
  if (v10 >= v9) {
    size_t v11 = v9;
  }
  else {
    size_t v11 = v10;
  }
  return (char *)memset(&v7[v8], a2, v11);
}

size_t sub_188F294D4(size_t result, unint64_t a2)
{
  if (!result) {
    return MEMORY[0x18961AFE8];
  }
  uint64_t v3 = (const void *)result;
  int64_t v4 = a2 - result;
  if (a2 == result) {
    return MEMORY[0x18961AFE8];
  }
  if (v4 < 1)
  {
    uint64_t v5 = (void *)MEMORY[0x18961AFE8];
    if (!a2) {
      goto LABEL_13;
    }
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C759418);
    uint64_t v5 = (void *)swift_allocObject();
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

LABEL_13:
  __break(1u);
  return result;
}

char *sub_188F29584(char *result, int64_t a2, char *__src, unint64_t a4)
{
  int64_t v4 = __src;
  else {
    size_t v5 = a4 - (void)__src;
  }
  if ((v5 & 0x8000000000000000LL) == 0)
  {
    memmove(result, __src, v5);
    v4 += v5;
    return v4;
  }

  __break(1u);
  return result;
}

unint64_t sub_188F295F4()
{
  unint64_t result = qword_18C7594C0;
  if (!qword_18C7594C0)
  {
    uint64_t v1 = sub_188F2A3A4();
    unint64_t result = MEMORY[0x1895DA4D4](MEMORY[0x189605998], v1);
    atomic_store(result, (unint64_t *)&qword_18C7594C0);
  }

  return result;
}

void sub_188F2963C(uint64_t a1, uint64_t a2)
{
}

  ;
}

unint64_t sub_188F2965C()
{
  unint64_t result = qword_18C7594D0;
  if (!qword_18C7594D0)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C7594C8);
    uint64_t v2 = MEMORY[0x1896071B0];
    unint64_t result = MEMORY[0x1895DA4D4](MEMORY[0x189607408], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_18C7594D0);
  }

  return result;
}

uint64_t sub_188F296B8(uint64_t a1, uint64_t a2)
{
  return sub_188F28178(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_188F296D0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return ((uint64_t (*)(void))((char *)&loc_188F296E0 + *((int *)qword_188F29788 + (a4 >> 62))))();
}

uint64_t sub_188F296F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, unsigned int a3@<W8>)
{
  if (BYTE6(a2) < a1 || a1 < 0)
  {
    __break(1u);
    JUMPOUT(0x188F29780LL);
  }

  return ((uint64_t (*)(void))((char *)&loc_188F29730 + *((int *)qword_188F29798 + a3)))();
}

uint64_t sub_188F297A8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  BOOL v4 = __OFADD__(a1, a2);
  uint64_t v5 = a1 + a2;
  if (v4)
  {
    __break(1u);
    JUMPOUT(0x188F29808LL);
  }

  return ((uint64_t (*)(uint64_t))((char *)&loc_188F297C0 + dword_188F2980C[a4 >> 62]))(v5);
}

uint64_t sub_188F2981C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a5 - a4;
  if (!a4) {
    uint64_t v5 = 0LL;
  }
  if (result < 0 || v5 < result)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  if (a3 < 0 || v5 < a3) {
    goto LABEL_19;
  }
  uint64_t v6 = a3 - result;
  if (a2 > 0)
  {
    return 0LL;
  }

  if (v6 <= 0 && v6 > a2) {
    return 0LL;
  }
LABEL_14:
  BOOL v7 = __OFADD__(result, a2);
  result += a2;
  if (v7)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }

  if (result < 0 || v5 < result) {
    goto LABEL_21;
  }
  return result;
}

void sub_188F298A4(uint64_t a1, uint64_t a2)
{
}

  ;
}

uint64_t sub_188F298C4()
{
  return swift_deallocObject();
}

uint64_t sub_188F298D4(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_188F29994(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0LL;
  }
  sub_188F2A290();
  swift_allocObject();
  uint64_t result = sub_188F2A254();
  if (v2 < 0)
  {
    __break(1u);
  }

  else
  {
    sub_188F2A2C0();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = v2;
  }

  return result;
}

uint64_t sub_188F29A0C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0LL;
  }
  sub_188F2A290();
  swift_allocObject();
  uint64_t result = sub_188F2A254();
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

uint64_t sub_188F29A8C(uint64_t a1, uint64_t a2)
{
  return sub_188F29AC4( a1,  a2,  (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void))sub_188F27E74);
}

uint64_t sub_188F29AA8(uint64_t a1, uint64_t a2)
{
  return sub_188F29AC4( a1,  a2,  (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void))sub_188F27F98);
}

uint64_t sub_188F29AC4( uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, void, void, void, void, void, void, void))
{
  return a3( a1,  a2,  *(void *)(v3 + 48),  *(unsigned __int8 *)(v3 + 56),  *(unsigned __int8 *)(v3 + 57),  *(void *)(v3 + 16),  *(void *)(v3 + 24),  *(void *)(v3 + 32),  *(void *)(v3 + 40));
}

uint64_t sub_188F29AFC(uint64_t result)
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
      sub_188F2A290();
      swift_allocObject();
      sub_188F2A26C();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_188F2A2C0();
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

uint64_t sub_188F29B98()
{
  return sub_188F2A314();
}

uint64_t sub_188F29BAC()
{
  return sub_188F2A32C();
}

uint64_t sub_188F29BB4()
{
  return sub_188F2A320();
}

uint64_t sub_188F29BBC()
{
  return sub_188F2A344();
}

uint64_t sub_188F29BC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_188F2A338();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }

  return result;
}

uint64_t static ChaChaPoly.tagByteCount.getter()
{
  return 16LL;
}

uint64_t static ChaChaPoly.name.getter()
{
  return 0x6F50616843616843LL;
}

uint64_t static ChaChaPoly.bigEndianNonce.getter()
{
  return 0LL;
}

uint64_t sub_188F29C18()
{
  return 0x6F50616843616843LL;
}

uint64_t sub_188F29C34()
{
  return 16LL;
}

uint64_t sub_188F29C3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_188F2A308();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }

  return result;
}

uint64_t sub_188F29C64()
{
  return sub_188F2A2FC();
}

uint64_t sub_188F29C90()
{
  return sub_188F2A3EC();
}

uint64_t sub_188F29CB0()
{
  return sub_188F2A410();
}

uint64_t static AES.GCM.tagByteCount.getter()
{
  return 16LL;
}

uint64_t static AES.GCM.name.getter()
{
  return 0x4D4347534541LL;
}

uint64_t static AES.GCM.bigEndianNonce.getter()
{
  return 1LL;
}

uint64_t sub_188F29CE8(uint64_t a1)
{
  uint64_t v2 = (uint64_t (*)(uint64_t))MEMORY[0x189605800];
  *(void *)(a1 + 8) = sub_188F29EC4(&qword_18C7594E8, MEMORY[0x189605800], MEMORY[0x1896057F0]);
  uint64_t result = sub_188F29EC4(&qword_18C7594F0, v2, MEMORY[0x189605810]);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_188F29D44()
{
  return sub_188F29EC4(&qword_18C7594F0, MEMORY[0x189605800], MEMORY[0x189605810]);
}

uint64_t sub_188F29D70()
{
  return sub_188F29EC4( &qword_18C7594F8,  MEMORY[0x189605800],  (uint64_t)&protocol conformance descriptor for ChaChaPoly.Nonce);
}

unint64_t sub_188F29DA0()
{
  unint64_t result = qword_18C759500;
  if (!qword_18C759500)
  {
    unint64_t result = MEMORY[0x1895DA4D4](&protocol conformance descriptor for ChaChaPoly.SealedBox, MEMORY[0x189605840]);
    atomic_store(result, (unint64_t *)&qword_18C759500);
  }

  return result;
}

uint64_t sub_188F29DE4(uint64_t a1)
{
  uint64_t v2 = (uint64_t (*)(uint64_t))MEMORY[0x189605A80];
  *(void *)(a1 + 8) = sub_188F29EC4(&qword_18C759508, MEMORY[0x189605A80], MEMORY[0x189605A68]);
  uint64_t result = sub_188F29EC4(&qword_18C759510, v2, MEMORY[0x189605A90]);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_188F29E40()
{
  return sub_188F29EC4(&qword_18C759510, MEMORY[0x189605A80], MEMORY[0x189605A90]);
}

uint64_t sub_188F29E6C()
{
  return sub_188F29EC4( &qword_18C759518,  MEMORY[0x189605A80],  (uint64_t)&protocol conformance descriptor for AES.GCM.Nonce);
}

uint64_t sub_188F29E98()
{
  return sub_188F29EC4( &qword_18C759520,  MEMORY[0x189605AB8],  (uint64_t)&protocol conformance descriptor for AES.GCM.SealedBox);
}

uint64_t sub_188F29EC4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = MEMORY[0x1895DA4D4](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_188F29F04()
{
  return 0x4D4347534541LL;
}

uint64_t sub_188F29F18()
{
  return 1LL;
}

uint64_t sub_188F29F20()
{
  return sub_188F2A3E0();
}

uint64_t sub_188F29F34()
{
  return sub_188F2A3D4();
}

uint64_t static Curve25519.noiseName.getter()
{
  return 0x3931353532LL;
}

uint64_t sub_188F29F5C()
{
  return 0x3931353532LL;
}

uint64_t sub_188F29F70()
{
  return sub_188F2A368();
}

uint64_t Curve25519.KeyAgreement.PublicKey.init(noiseRepresentation:)()
{
  return sub_188F2A35C();
}

uint64_t static Curve25519.KeyAgreement.PublicKey.noiseRepresentationByteCount.getter()
{
  return 32LL;
}

uint64_t sub_188F29FE8()
{
  return sub_188F2A35C();
}

uint64_t sub_188F2A01C()
{
  return 32LL;
}

uint64_t static P256.noiseName.getter()
{
  return 909455952LL;
}

uint64_t sub_188F2A034()
{
  return 909455952LL;
}

uint64_t P256.KeyAgreement.PrivateKey.init()()
{
  return sub_188F2A458();
}

uint64_t sub_188F2A04C()
{
  return sub_188F2A44C();
}

uint64_t P256.KeyAgreement.PublicKey.init(noiseRepresentation:)()
{
  return sub_188F2A440();
}

uint64_t static P256.KeyAgreement.PublicKey.noiseRepresentationByteCount.getter()
{
  return 65LL;
}

_UNKNOWN **sub_188F2A0C0()
{
  return &protocol witness table for Curve25519.KeyAgreement.PrivateKey;
}

_UNKNOWN **sub_188F2A0CC()
{
  return &protocol witness table for Curve25519.KeyAgreement.PublicKey;
}

_UNKNOWN **sub_188F2A0D8()
{
  return &protocol witness table for P256.KeyAgreement.PrivateKey;
}

_UNKNOWN **sub_188F2A0E4()
{
  return &protocol witness table for P256.KeyAgreement.PublicKey;
}

uint64_t sub_188F2A0F4()
{
  return sub_188F2A440();
}

uint64_t sub_188F2A128()
{
  return 65LL;
}

uint64_t static SHA256.noiseName.getter()
{
  return 0x363532414853LL;
}

uint64_t sub_188F2A144()
{
  return 0x363532414853LL;
}

uint64_t static SHA512.noiseName.getter()
{
  return 0x323135414853LL;
}

uint64_t sub_188F2A16C(uint64_t a1)
{
  uint64_t result = sub_188F29EC4((unint64_t *)&unk_18C4F9610, MEMORY[0x189605DF8], MEMORY[0x189605DE8]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_188F2A1A8()
{
  return 0x323135414853LL;
}

uint64_t sub_188F2A1BC(uint64_t a1)
{
  uint64_t result = sub_188F29EC4(&qword_18C759528, MEMORY[0x189605E20], MEMORY[0x189605E18]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of static NoiseHashFunction.noiseName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_188F2A200()
{
  return MEMORY[0x189606160]();
}

uint64_t sub_188F2A20C()
{
  return MEMORY[0x189606168]();
}

uint64_t sub_188F2A218()
{
  return MEMORY[0x189606170]();
}

uint64_t sub_188F2A224()
{
  return MEMORY[0x189606178]();
}

uint64_t sub_188F2A230()
{
  return MEMORY[0x189606180]();
}

uint64_t sub_188F2A23C()
{
  return MEMORY[0x189606188]();
}

uint64_t sub_188F2A248()
{
  return MEMORY[0x1896061F0]();
}

uint64_t sub_188F2A254()
{
  return MEMORY[0x189606200]();
}

uint64_t sub_188F2A260()
{
  return MEMORY[0x189606208]();
}

uint64_t sub_188F2A26C()
{
  return MEMORY[0x189606218]();
}

uint64_t sub_188F2A278()
{
  return MEMORY[0x189606230]();
}

uint64_t sub_188F2A284()
{
  return MEMORY[0x189606240]();
}

uint64_t sub_188F2A290()
{
  return MEMORY[0x189606260]();
}

uint64_t sub_188F2A29C()
{
  return MEMORY[0x189606398]();
}

uint64_t sub_188F2A2A8()
{
  return MEMORY[0x189606AF8]();
}

uint64_t sub_188F2A2B4()
{
  return MEMORY[0x189606B60]();
}

uint64_t sub_188F2A2C0()
{
  return MEMORY[0x189606BA8]();
}

uint64_t sub_188F2A2CC()
{
  return MEMORY[0x189606BF0]();
}

uint64_t sub_188F2A2D8()
{
  return MEMORY[0x189606C18]();
}

uint64_t sub_188F2A2E4()
{
  return MEMORY[0x189606CF8]();
}

uint64_t sub_188F2A2F0()
{
  return MEMORY[0x189606DB8]();
}

uint64_t sub_188F2A2FC()
{
  return MEMORY[0x1896057E0]();
}

uint64_t sub_188F2A308()
{
  return MEMORY[0x1896057E8]();
}

uint64_t sub_188F2A314()
{
  return MEMORY[0x1896057F8]();
}

uint64_t sub_188F2A320()
{
  return MEMORY[0x189605818]();
}

uint64_t sub_188F2A32C()
{
  return MEMORY[0x189605820]();
}

uint64_t sub_188F2A338()
{
  return MEMORY[0x189605828]();
}

uint64_t sub_188F2A344()
{
  return MEMORY[0x189605830]();
}

uint64_t _s9CryptoKit10Curve25519O12KeyAgreementO06PublicD0V5ChirpE19noiseRepresentation10Foundation4DataVvg_0()
{
  return MEMORY[0x189605878]();
}

uint64_t sub_188F2A35C()
{
  return MEMORY[0x189605880]();
}

uint64_t sub_188F2A368()
{
  return MEMORY[0x1896058B0]();
}

uint64_t sub_188F2A374()
{
  return MEMORY[0x189605928]();
}

uint64_t sub_188F2A380()
{
  return MEMORY[0x189605988]();
}

uint64_t sub_188F2A38C()
{
  return MEMORY[0x1896059A0]();
}

uint64_t sub_188F2A398()
{
  return MEMORY[0x1896059A8]();
}

uint64_t sub_188F2A3A4()
{
  return MEMORY[0x1896059B0]();
}

uint64_t sub_188F2A3B0()
{
  return MEMORY[0x189605A10]();
}

uint64_t sub_188F2A3BC()
{
  return MEMORY[0x189605A18]();
}

uint64_t sub_188F2A3C8()
{
  return MEMORY[0x189605A50]();
}

uint64_t sub_188F2A3D4()
{
  return MEMORY[0x189605A58]();
}

uint64_t sub_188F2A3E0()
{
  return MEMORY[0x189605A60]();
}

uint64_t sub_188F2A3EC()
{
  return MEMORY[0x189605A78]();
}

uint64_t sub_188F2A3F8()
{
  return MEMORY[0x189605A98]();
}

uint64_t sub_188F2A404()
{
  return MEMORY[0x189605AA0]();
}

uint64_t sub_188F2A410()
{
  return MEMORY[0x189605AA8]();
}

uint64_t sub_188F2A41C()
{
  return MEMORY[0x189605AB0]();
}

uint64_t sub_188F2A428()
{
  return MEMORY[0x189605AF0]();
}

uint64_t sub_188F2A434()
{
  return MEMORY[0x189605BE0]();
}

uint64_t sub_188F2A440()
{
  return MEMORY[0x189605BF0]();
}

uint64_t sub_188F2A44C()
{
  return MEMORY[0x189605C38]();
}

uint64_t sub_188F2A458()
{
  return MEMORY[0x189605C58]();
}

uint64_t sub_188F2A464()
{
  return MEMORY[0x189605DC0]();
}

uint64_t sub_188F2A470()
{
  return MEMORY[0x189617A58]();
}

uint64_t sub_188F2A47C()
{
  return MEMORY[0x189617A60]();
}

uint64_t sub_188F2A488()
{
  return MEMORY[0x189617A70]();
}

uint64_t sub_188F2A494()
{
  return MEMORY[0x189617A98]();
}

uint64_t sub_188F2A4A0()
{
  return MEMORY[0x189617AA0]();
}

uint64_t sub_188F2A4AC()
{
  return MEMORY[0x189617B10]();
}

uint64_t sub_188F2A4B8()
{
  return MEMORY[0x189617B30]();
}

uint64_t sub_188F2A4C4()
{
  return MEMORY[0x189617B80]();
}

uint64_t sub_188F2A4D0()
{
  return MEMORY[0x189617B88]();
}

uint64_t sub_188F2A4DC()
{
  return MEMORY[0x189607118]();
}

uint64_t sub_188F2A4E8()
{
  return MEMORY[0x189607160]();
}

uint64_t sub_188F2A4F4()
{
  return MEMORY[0x189607178]();
}

uint64_t sub_188F2A500()
{
  return MEMORY[0x189617CA0]();
}

uint64_t sub_188F2A50C()
{
  return MEMORY[0x189617CE0]();
}

uint64_t sub_188F2A518()
{
  return MEMORY[0x189617DD8]();
}

uint64_t sub_188F2A524()
{
  return MEMORY[0x189617E20]();
}

uint64_t sub_188F2A530()
{
  return MEMORY[0x189617E30]();
}

uint64_t sub_188F2A53C()
{
  return MEMORY[0x189617E38]();
}

uint64_t sub_188F2A548()
{
  return MEMORY[0x189617E68]();
}

uint64_t sub_188F2A554()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_188F2A560()
{
  return MEMORY[0x189617EA8]();
}

uint64_t sub_188F2A56C()
{
  return MEMORY[0x189617ED0]();
}

uint64_t sub_188F2A578()
{
  return MEMORY[0x189617F48]();
}

uint64_t sub_188F2A584()
{
  return MEMORY[0x189618040]();
}

uint64_t sub_188F2A590()
{
  return MEMORY[0x189618070]();
}

uint64_t sub_188F2A59C()
{
  return MEMORY[0x189618078]();
}

uint64_t sub_188F2A5A8()
{
  return MEMORY[0x189618080]();
}

uint64_t sub_188F2A5B4()
{
  return MEMORY[0x1896180A8]();
}

uint64_t sub_188F2A5C0()
{
  return MEMORY[0x189618390]();
}

uint64_t sub_188F2A5CC()
{
  return MEMORY[0x189618848]();
}

uint64_t sub_188F2A5D8()
{
  return MEMORY[0x1896188E8]();
}

uint64_t sub_188F2A5E4()
{
  return MEMORY[0x1896189B8]();
}

uint64_t sub_188F2A5F0()
{
  return MEMORY[0x1896189C8]();
}

uint64_t sub_188F2A5FC()
{
  return MEMORY[0x189618AC0]();
}

uint64_t sub_188F2A608()
{
  return MEMORY[0x189618BD0]();
}

uint64_t sub_188F2A614()
{
  return MEMORY[0x189618C40]();
}

uint64_t sub_188F2A620()
{
  return MEMORY[0x189618C90]();
}

uint64_t sub_188F2A62C()
{
  return MEMORY[0x189618CA0]();
}

uint64_t sub_188F2A638()
{
  return MEMORY[0x189618CB0]();
}

uint64_t sub_188F2A644()
{
  return MEMORY[0x189618D38]();
}

uint64_t sub_188F2A650()
{
  return MEMORY[0x1896191D0]();
}

uint64_t sub_188F2A65C()
{
  return MEMORY[0x1896191E0]();
}

uint64_t sub_188F2A668()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_188F2A674()
{
  return MEMORY[0x189619440]();
}

uint64_t sub_188F2A680()
{
  return MEMORY[0x189619448]();
}

uint64_t sub_188F2A68C()
{
  return MEMORY[0x189619660]();
}

uint64_t sub_188F2A698()
{
  return MEMORY[0x1896198A8]();
}

uint64_t sub_188F2A6A4()
{
  return MEMORY[0x189619948]();
}

uint64_t sub_188F2A6B0()
{
  return MEMORY[0x189619950]();
}

uint64_t sub_188F2A6BC()
{
  return MEMORY[0x189619960]();
}

uint64_t sub_188F2A6C8()
{
  return MEMORY[0x189619A40]();
}

uint64_t sub_188F2A6D4()
{
  return MEMORY[0x189619CB0]();
}

uint64_t sub_188F2A6E0()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_188F2A6EC()
{
  return MEMORY[0x18961A3A0]();
}

uint64_t sub_188F2A6F8()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_188F2A704()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t sub_188F2A710()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t sub_188F2A71C()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_188F2A728()
{
  return MEMORY[0x1896073F0]();
}

uint64_t sub_188F2A734()
{
  return MEMORY[0x18961A668]();
}

uint64_t sub_188F2A740()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_188F2A74C()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_188F2A758()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t sub_188F2A764()
{
  return MEMORY[0x18961AC48]();
}

uint64_t sub_188F2A770()
{
  return MEMORY[0x18961ADC8]();
}

uint64_t sub_188F2A77C()
{
  return MEMORY[0x18961ADF0]();
}

uint64_t sub_188F2A788()
{
  return MEMORY[0x18961AE00]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1895F9750]();
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

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x18961B218]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x18961B220]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x18961B358]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x18961B420]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x18961B438]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x18961B450]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}
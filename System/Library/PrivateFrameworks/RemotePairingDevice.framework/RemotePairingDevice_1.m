uint64_t sub_188496244@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  v7 = *(unsigned __int8 *)(a1 + 16);
  v8 = *(void *)(a1 + 24);
  sub_18841E590(a2, a3);
  sub_188470394(40LL, a2, a3);
  if ((_DWORD)v7 == 6)
  {
    OUTLINED_FUNCTION_35_4();
    sub_188494F80();
    OUTLINED_FUNCTION_19_8(a2);
    OUTLINED_FUNCTION_25_9(v8);
    result = OUTLINED_FUNCTION_28_6();
    if (!v14)
    {
      v7 = v13;
      v10 = 0LL;
      goto LABEL_12;
    }

uint64_t type metadata accessor for TunnelInterfaceParameters()
{
  uint64_t result = qword_18C4DE770;
  if (!qword_18C4DE770) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t TunnelPacket.protocolFamily.getter()
{
  return *v0;
}

uint64_t TunnelPacket.length.getter()
{
  return ((uint64_t (*)(void))((char *)&loc_1884963F8 + dword_18849643C[*(void *)(v0 + 88) >> 62]))(0LL);
}

uint64_t sub_188496408()
{
  return BYTE6(v0);
}

uint64_t TunnelPacket.ipHeader.getter@<X0>(uint64_t a1@<X8>)
{
  char v2 = *(_BYTE *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  unint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = *(void *)(v1 + 48);
  unint64_t v6 = *(void *)(v1 + 56);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 8);
  *(_BYTE *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v6;
  sub_18841E590(v3, v4);
  return sub_18841E590(v5, v6);
}

uint64_t TunnelPacket.transportProtocolHeader.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 64);
  unint64_t v3 = *(void *)(v1 + 72);
  *a1 = v2;
  a1[1] = v3;
  return sub_188459598(v2, v3);
}

uint64_t TunnelPacket.packetData.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  sub_18841E590(v1, *(void *)(v0 + 88));
  return v1;
}

uint64_t TunnelPacket.packetData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_18842A58C(*(void *)(v2 + 80), *(void *)(v2 + 88));
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = a2;
  return result;
}

uint64_t (*TunnelPacket.packetData.modify())()
{
  return nullsub_1;
}

uint64_t TunnelPacket.init(data:ipHeader:)@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *a3;
  uint64_t v8 = a3[1];
  char v9 = *((_BYTE *)a3 + 16);
  uint64_t v10 = a3[3];
  uint64_t v11 = a3[4];
  uint64_t v12 = a3[5];
  uint64_t v13 = a3[6];
  sub_18841E590(a1, a2);
  OUTLINED_FUNCTION_76_5(v10);
  OUTLINED_FUNCTION_43_7();
  if (qword_18C4DE4C8 != -1) {
    swift_once();
  }
  if (byte_18C71D060 == 1)
  {
    v16[0] = v7;
    v16[1] = v8;
    char v17 = v9;
    uint64_t v18 = v10;
    uint64_t v19 = v11;
    uint64_t v20 = v12;
    uint64_t v21 = v13;
    uint64_t result = sub_188496244((uint64_t)v16, a1, a2, (unint64_t *)&v22);
    __int128 v15 = v22;
  }

  else
  {
    sub_18842A58C(a1, a2);
    OUTLINED_FUNCTION_25_9(v10);
    uint64_t result = OUTLINED_FUNCTION_19_8(v12);
    __int128 v15 = xmmword_1884CEDF0;
  }

  *(_DWORD *)a4 = 30;
  *(void *)(a4 + 8) = v7;
  *(void *)(a4 + 16) = v8;
  *(_BYTE *)(a4 + 24) = v9;
  *(void *)(a4 + 32) = v10;
  *(void *)(a4 + 40) = v11;
  *(void *)(a4 + 48) = v12;
  *(void *)(a4 + 56) = v13;
  *(_OWORD *)(a4 + 64) = v15;
  *(void *)(a4 + 80) = a1;
  *(void *)(a4 + 88) = a2;
  return result;
}

uint64_t TunnelPacket.isValidPacket.getter()
{
  return ((uint64_t (*)(void))((char *)&loc_188496644 + dword_1884966A4[*(void *)(v0 + 88) >> 62]))();
}

BOOL sub_188496654@<W0>(int a1@<W8>)
{
  uint64_t v3 = BYTE6(v1);
  uint64_t v4 = *(void *)(v2 + 8);
  uint64_t v5 = *(void *)(v2 + 16);
  BOOL v6 = __OFADD__(v4, v5);
  uint64_t v7 = v4 + v5;
  if (v6)
  {
    __break(1u);
    JUMPOUT(0x18849669CLL);
  }

  return a1 == 30 && v3 == v7;
}

void TunnelPacket.isValidInboundPacket(localInterface:remoteAddress:)(uint64_t a1, uint64_t a2)
{
  void (*v36)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  void v48[4];
  void v49[3];
  uint64_t v50;
  uint64_t v51;
  uint64_t v3 = v2;
  int v6 = *v2;
  uint64_t v7 = TunnelPacket.length.getter();
  uint64_t v8 = *((void *)v2 + 1);
  uint64_t v9 = *((void *)v2 + 2);
  BOOL v10 = __OFADD__(v8, v9);
  uint64_t v11 = v8 + v9;
  if (v10)
  {
    __break(1u);
  }

  else
  {
    v47 = a1;
    v42 = v6;
    uint64_t v12 = *((void *)v2 + 4);
    v39 = *((void *)v2 + 5);
    uint64_t v14 = *((void *)v2 + 6);
    unint64_t v13 = *((void *)v2 + 7);
    uint64_t v15 = *((void *)v2 + 8);
    unint64_t v16 = *((void *)v2 + 9);
    uint64_t v17 = *((void *)v2 + 10);
    unint64_t v18 = *((void *)v2 + 11);
    v41 = v7;
    v40 = v11;
    uint64_t v19 = sub_1884C9B3C();
    MEMORY[0x1895F8858](v19);
    OUTLINED_FUNCTION_59_6();
    v43 = v21;
    v44 = v20;
    (*(void (**)(int *, uint64_t))(v21 + 16))(v2, a2);
    sub_18841E590(v12, v39);
    v45 = v14;
    sub_18841E590(v14, v13);
    sub_188459598(v15, v16);
    sub_18841E590(v17, v18);
    if (v42 == 30 && v41 == v40)
    {
      sub_18841E590(v12, v39);
      uint64_t v24 = sub_1884C9B24();
      char v23 = MEMORY[0x1895C5ED8](v12, v39, v24, v25);
      OUTLINED_FUNCTION_19_8(v24);
      OUTLINED_FUNCTION_48_5(v12);
    }

    else
    {
      char v23 = 0;
    }

    (*(void (**)(int *, uint64_t))(v43 + 8))(v2, v44);
    OUTLINED_FUNCTION_48_5(v12);
    sub_18842A58C(v45, v13);
    sub_1884595C4(v15, v16);
    OUTLINED_FUNCTION_70_5();
    uint64_t v26 = *((void *)v2 + 4);
    unint64_t v27 = *((void *)v2 + 5);
    uint64_t v28 = *((void *)v2 + 6);
    uint64_t v29 = *((void *)v2 + 8);
    unint64_t v30 = *((void *)v2 + 9);
    uint64_t v31 = *((void *)v2 + 10);
    unint64_t v32 = *((void *)v3 + 11);
    sub_18842FFC8(v47, (uint64_t)v49);
    if ((v23 & 1) != 0)
    {
      uint64_t v33 = v50;
      uint64_t v34 = v51;
      __swift_project_boxed_opaque_existential_0Tm(v49, v50);
      unint64_t v35 = v27;
      v46 = v27;
      v36 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v34 + 48);
      sub_18841E590(v26, v35);
      OUTLINED_FUNCTION_43_7();
      sub_188459598(v29, v30);
      sub_18841E590(v31, v32);
      OUTLINED_FUNCTION_43_7();
      v36(v48, v33, v34);
      __swift_project_boxed_opaque_existential_0Tm(v48, v48[3]);
      v37 = sub_1884C9E30();
      v38 = OUTLINED_FUNCTION_20_9();
      MEMORY[0x1895C5ED8](v38);
      OUTLINED_FUNCTION_19_8(v28);
      OUTLINED_FUNCTION_25_9(v37);
      sub_18842A58C(v26, v46);
      OUTLINED_FUNCTION_19_8(v28);
      sub_1884595C4(v29, v30);
      OUTLINED_FUNCTION_48_5(v31);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v48);
    }

    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v49);
    OUTLINED_FUNCTION_17();
  }

void TunnelPacket.isValidOutboundPacket(localInterface:remoteAddress:)(uint64_t a1, uint64_t *a2)
{
  void (*v35)(void *__return_ptr, uint64_t, uint64_t);
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void v45[4];
  void v46[3];
  uint64_t v47;
  uint64_t v48;
  int v5 = *v2;
  uint64_t v6 = TunnelPacket.length.getter();
  uint64_t v7 = *((void *)v2 + 1);
  uint64_t v8 = *((void *)v2 + 2);
  uint64_t v9 = v7 + v8;
  if (__OFADD__(v7, v8))
  {
    __break(1u);
  }

  else
  {
    uint64_t v10 = v6;
    v40 = a2;
    uint64_t v12 = *((void *)v2 + 4);
    unint64_t v11 = *((void *)v2 + 5);
    uint64_t v13 = *((void *)v2 + 6);
    unint64_t v14 = *((void *)v2 + 7);
    unint64_t v15 = *((void *)v2 + 9);
    v38 = *((void *)v2 + 8);
    uint64_t v16 = *((void *)v2 + 10);
    unint64_t v17 = *((void *)v2 + 11);
    v44 = v16;
    sub_18842FFC8(a1, (uint64_t)v46);
    BOOL v18 = v5 == 30 && v10 == v9;
    v42 = v13;
    v43 = v12;
    v37 = v14;
    v41 = v11;
    v39 = v15;
    if (v18)
    {
      uint64_t v23 = v47;
      uint64_t v24 = v48;
      __swift_project_boxed_opaque_existential_0Tm(v46, v47);
      unint64_t v35 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v24 + 48);
      v36 = v17;
      OUTLINED_FUNCTION_73_5();
      sub_18841E590(v13, v14);
      sub_188459598(v38, v15);
      sub_18841E590(v44, v17);
      OUTLINED_FUNCTION_73_5();
      v35(v45, v23, v24);
      __swift_project_boxed_opaque_existential_0Tm(v45, v45[3]);
      uint64_t v25 = sub_1884C9E30();
      unint64_t v27 = v26;
      char v22 = MEMORY[0x1895C5ED8](v12, v11, v25, v26);
      OUTLINED_FUNCTION_52_7(v12);
      sub_18842A58C(v25, v27);
      OUTLINED_FUNCTION_52_7(v12);
      sub_18842A58C(v42, v14);
      unint64_t v17 = v36;
      uint64_t v20 = v38;
      sub_1884595C4(v38, v15);
      uint64_t v21 = v44;
      unint64_t v19 = v36;
      sub_18842A58C(v44, v36);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v45);
    }

    else
    {
      unint64_t v19 = v17;
      uint64_t v20 = v38;
      uint64_t v21 = v44;
      char v22 = 0;
    }

    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v46);
    uint64_t v28 = OUTLINED_FUNCTION_161_0();
    uint64_t v29 = *(void *)(v28 - 8);
    MEMORY[0x1895F8858](v28);
    OUTLINED_FUNCTION_59_6();
    (*(void (**)(unint64_t, uint64_t *, uint64_t))(v29 + 16))(v17, v40, v28);
    if ((v22 & 1) != 0)
    {
      sub_18841E590(v43, v41);
      uint64_t v30 = v42;
      v40 = &v34;
      unint64_t v31 = v37;
      OUTLINED_FUNCTION_76_5(v42);
      sub_188459598(v20, v39);
      sub_18841E590(v21, v19);
      OUTLINED_FUNCTION_76_5(v30);
      uint64_t v32 = sub_1884C9B24();
      MEMORY[0x1895C5ED8](v30, v31, v32, v33);
      OUTLINED_FUNCTION_48_5(v32);
      OUTLINED_FUNCTION_25_9(v30);
      OUTLINED_FUNCTION_54_6();
      OUTLINED_FUNCTION_70_5();
      sub_18842A58C(v30, v31);
      sub_1884595C4(v20, v39);
      sub_18842A58C(v44, v19);
    }

    else
    {
      OUTLINED_FUNCTION_54_6();
    }

    OUTLINED_FUNCTION_17();
  }

uint64_t ReadPacketGroup.packets.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ReadPacketGroup.finalize.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_retain();
  return v1;
}

uint64_t sub_188496C48(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73736572646461LL && a2 == 0xE700000000000000LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else
  {
    BOOL v6 = a1 == 0x6B73616D74656ELL && a2 == 0xE700000000000000LL;
    if (v6 || (sub_1884CA820() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1LL;
    }

    else if (a1 == 7697517 && a2 == 0xE300000000000000LL)
    {
      swift_bridgeObjectRelease();
      return 2LL;
    }

    else
    {
      char v8 = sub_1884CA820();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0) {
        return 2LL;
      }
      else {
        return 3LL;
      }
    }
  }

uint64_t sub_188496D8C(char a1)
{
  if (!a1) {
    return 0x73736572646461LL;
  }
  if (a1 == 1) {
    return 0x6B73616D74656ELL;
  }
  return 7697517LL;
}

uint64_t sub_188496DDC()
{
  return sub_188496D8C(*v0);
}

uint64_t sub_188496DE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_188496C48(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_188496E08()
{
  return sub_1884CA9F4();
}

uint64_t sub_188496E30()
{
  return sub_1884CAA00();
}

void TunnelInterfaceParameters.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DE9A0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  OUTLINED_FUNCTION_34();
  uint64_t v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_188496F94();
  sub_1884CA9E8();
  OUTLINED_FUNCTION_161_0();
  sub_188497264(&qword_18C4DE910, (uint64_t)&protocol conformance descriptor for IPv6Address);
  OUTLINED_FUNCTION_32_7();
  if (!v1)
  {
    OUTLINED_FUNCTION_162_0();
    OUTLINED_FUNCTION_32_7();
    sub_1884CA7A8();
  }

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_188496F94()
{
  unint64_t result = qword_18C4DE750;
  if (!qword_18C4DE750)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D261C, &type metadata for TunnelInterfaceParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DE750);
  }

  return result;
}

void TunnelInterfaceParameters.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C70F838);
  uint64_t v4 = *(void *)(v30 - 8);
  MEMORY[0x1895F8858](v30);
  OUTLINED_FUNCTION_34();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = OUTLINED_FUNCTION_162_0();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v9);
  OUTLINED_FUNCTION_34();
  uint64_t v12 = v11 - v10;
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_188496F94();
  uint64_t v29 = v7;
  sub_1884CA9D0();
  if (v2)
  {
    OUTLINED_FUNCTION_70_3();
  }

  else
  {
    uint64_t v27 = v4;
    uint64_t v24 = v8;
    uint64_t v25 = v12;
    uint64_t v13 = OUTLINED_FUNCTION_161_0();
    unint64_t v26 = &v21;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = *(void *)(v14 + 64);
    MEMORY[0x1895F8858](v13);
    unint64_t v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    char v33 = 0;
    sub_188497264(&qword_18C70EDC8, (uint64_t)&protocol conformance descriptor for IPv6Address);
    OUTLINED_FUNCTION_56_3();
    char v22 = *(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32);
    uint64_t v23 = v14;
    uint64_t v17 = v22(v25, (char *)&v21 - v16, v13);
    MEMORY[0x1895F8858](v17);
    BOOL v18 = (char *)&v21 - v16;
    char v32 = 1;
    OUTLINED_FUNCTION_56_3();
    uint64_t v20 = v24;
    uint64_t v19 = v25;
    v22(v25 + *(int *)(v24 + 20), v18, v13);
    char v31 = 2;
    LOWORD(v18) = sub_1884CA6DC();
    OUTLINED_FUNCTION_13_14(v27);
    *(_WORD *)(v19 + *(int *)(v20 + 24)) = (_WORD)v18;
    sub_1884972A0(v19, v28);
    OUTLINED_FUNCTION_70_3();
    sub_1884972E4(v19);
  }

  OUTLINED_FUNCTION_0_2();
}

void sub_188497264(unint64_t *a1, uint64_t a2)
{
  if (!*a1)
  {
    uint64_t v4 = sub_1884C9B3C();
    atomic_store(MEMORY[0x1895C7AEC](a2, v4), a1);
  }

  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_1884972A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TunnelInterfaceParameters();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1884972E4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TunnelInterfaceParameters();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_188497320(void *a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_188497334(void *a1)
{
}

uint64_t destroy for TunnelPacket(void *a1)
{
  unint64_t v2 = a1[9];
  if (v2 >> 60 != 15) {
    sub_1884595D8(a1[8], v2);
  }
  return sub_18842A58C(a1[10], a1[11]);
}

uint64_t initializeWithCopy for TunnelPacket(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  unint64_t v5 = *(void *)(a2 + 40);
  sub_18841E590(v4, v5);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  unint64_t v7 = *(void *)(a2 + 56);
  sub_18841E590(v6, v7);
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  uint64_t v8 = (uint64_t *)(a2 + 64);
  unint64_t v9 = *(void *)(a2 + 72);
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 64) = *(_OWORD *)v8;
  }

  else
  {
    uint64_t v10 = *v8;
    sub_1884595AC(*v8, *(void *)(a2 + 72));
    *(void *)(a1 + 64) = v10;
    *(void *)(a1 + 72) = v9;
  }

  uint64_t v12 = *(void *)(a2 + 80);
  unint64_t v11 = *(void *)(a2 + 88);
  sub_18841E590(v12, v11);
  *(void *)(a1 + 80) = v12;
  *(void *)(a1 + 88) = v11;
  return a1;
}

uint64_t assignWithCopy for TunnelPacket(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  unint64_t v5 = *(void *)(a2 + 40);
  sub_18841E590(v4, v5);
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  sub_18842A58C(v6, v7);
  uint64_t v8 = *(void *)(a2 + 48);
  unint64_t v9 = *(void *)(a2 + 56);
  sub_18841E590(v8, v9);
  uint64_t v10 = *(void *)(a1 + 48);
  unint64_t v11 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  sub_18842A58C(v10, v11);
  uint64_t v12 = (uint64_t *)(a2 + 64);
  unint64_t v13 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72) >> 60 != 15LL)
  {
    if (v13 >> 60 != 15)
    {
      uint64_t v15 = *v12;
      sub_1884595AC(*v12, *(void *)(a2 + 72));
      uint64_t v16 = *(void *)(a1 + 64);
      unint64_t v17 = *(void *)(a1 + 72);
      *(void *)(a1 + 64) = v15;
      *(void *)(a1 + 72) = v13;
      sub_1884595D8(v16, v17);
      goto LABEL_8;
    }

    sub_188497570(a1 + 64);
    goto LABEL_6;
  }

  if (v13 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 64) = *(_OWORD *)v12;
    goto LABEL_8;
  }

  uint64_t v14 = *v12;
  sub_1884595AC(*v12, *(void *)(a2 + 72));
  *(void *)(a1 + 64) = v14;
  *(void *)(a1 + 72) = v13;
LABEL_8:
  uint64_t v19 = *(void *)(a2 + 80);
  unint64_t v18 = *(void *)(a2 + 88);
  sub_18841E590(v19, v18);
  uint64_t v20 = *(void *)(a1 + 80);
  unint64_t v21 = *(void *)(a1 + 88);
  *(void *)(a1 + 80) = v19;
  *(void *)(a1 + 88) = v18;
  sub_18842A58C(v20, v21);
  return a1;
}

uint64_t sub_188497570(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t assignWithTake for TunnelPacket(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_18842A58C(v4, v5);
  uint64_t v6 = *(void *)(a1 + 48);
  unint64_t v7 = *(void *)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  sub_18842A58C(v6, v7);
  uint64_t v8 = (void *)(a2 + 64);
  unint64_t v9 = *(void *)(a1 + 72);
  if (v9 >> 60 != 15)
  {
    unint64_t v10 = *(void *)(a2 + 72);
    if (v10 >> 60 != 15)
    {
      uint64_t v11 = *(void *)(a1 + 64);
      *(void *)(a1 + 64) = *v8;
      *(void *)(a1 + 72) = v10;
      sub_1884595D8(v11, v9);
      goto LABEL_6;
    }

    sub_188497570(a1 + 64);
  }

  *(_OWORD *)(a1 + 64) = *(_OWORD *)v8;
LABEL_6:
  uint64_t v12 = *(void *)(a1 + 80);
  unint64_t v13 = *(void *)(a1 + 88);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  sub_18842A58C(v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for TunnelPacket(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xD && *(_BYTE *)(a1 + 96))
    {
      unsigned int v2 = *(_DWORD *)a1 + 12;
    }

    else
    {
      unsigned int v2 = (((*(void *)(a1 + 40) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 40) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC) {
        unsigned int v2 = -1;
      }
    }
  }

  else
  {
    unsigned int v2 = -1;
  }

  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for TunnelPacket(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 88) = 0LL;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 - 13;
    if (a3 >= 0xD) {
      *(_BYTE *)(result + 96) = 1;
    }
  }

  else
  {
    if (a3 >= 0xD) {
      *(_BYTE *)(result + 96) = 0;
    }
    if (a2)
    {
      *(void *)(result + 32) = 0LL;
      *(void *)(result + 40) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }

  return result;
}

void type metadata accessor for TunnelPacket()
{
}

void *__swift_memcpy15_4(void *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(void *)((char *)result + 7) = *(uint64_t *)((char *)a2 + 7);
  *unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TunnelPacket.TCPSegmentHeader(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 15)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for TunnelPacket.TCPSegmentHeader(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_BYTE *)(result + 14) = 0;
    *(_WORD *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
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

  *(_BYTE *)(result + 15) = v3;
  return result;
}

void type metadata accessor for TunnelPacket.TCPSegmentHeader()
{
}

uint64_t __swift_memcpy6_2(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TunnelPacket.UDPDatagramHeader(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 6)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for TunnelPacket.UDPDatagramHeader(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_WORD *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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

  *(_BYTE *)(result + 6) = v3;
  return result;
}

void type metadata accessor for TunnelPacket.UDPDatagramHeader()
{
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TunnelPacket.ICMPv6Header(unsigned __int16 *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 4;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 0xFFFF;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        return 0LL;
      }
      return (*a1 | (v4 << 16)) - 0xFFFF;
    }

    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 0xFFFF;
    }
  }

  return 0LL;
}

uint64_t storeEnumTagSinglePayload for TunnelPacket.ICMPv6Header(_WORD *a1, int a2, int a3)
{
  else {
    int v3 = 4;
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
  if (!a2) {
    return ((uint64_t (*)(void))((char *)sub_1884978FC + 4 * byte_1884D2205[v4]))();
  }
  *a1 = a2 - 1;
  return ((uint64_t (*)(void))((char *)sub_1884978DC + 4 * asc_1884D2200[v4]))();
}

uint64_t sub_1884978DC(uint64_t result)
{
  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_1884978FC(uint64_t result)
{
  *(_BYTE *)(result + 2) = 0;
  return result;
}

uint64_t sub_188497904(uint64_t result)
{
  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_18849790C(uint64_t result)
{
  *(_WORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_188497914(uint64_t result)
{
  *(_WORD *)(result + 2) = 0;
  return result;
}

uint64_t sub_18849791C(uint64_t result)
{
  *(_DWORD *)(result + 2) = 0;
  return result;
}

void type metadata accessor for TunnelPacket.ICMPv6Header()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for TunnelPacket.TransportProtocolHeader(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_1884595AC(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

void destroy for TunnelPacket.TransportProtocolHeader(uint64_t a1)
{
}

uint64_t *assignWithCopy for TunnelPacket.TransportProtocolHeader(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_1884595AC(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_1884595D8(v5, v6);
  return a1;
}

uint64_t *assignWithTake for TunnelPacket.TransportProtocolHeader(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_1884595D8(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TunnelPacket.TransportProtocolHeader(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xC && *(_BYTE *)(a1 + 16))
    {
      unsigned int v2 = *(_DWORD *)a1 + 11;
    }

    else
    {
      unsigned int v2 = (((*(void *)(a1 + 8) >> 60) >> 1) & 0xFFFFFFF7 | (8
                                                                           * ((*(void *)(a1 + 8) & 0x1000000000000000LL) != 0))) ^ 0xF;
      if (v2 >= 0xB) {
        unsigned int v2 = -1;
      }
    }
  }

  else
  {
    unsigned int v2 = -1;
  }

  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for TunnelPacket.TransportProtocolHeader( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(void *)unint64_t result = a2 - 12;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xC) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0xC) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)unint64_t result = 0LL;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 3) & 1) - 2 * a2) << 60;
    }
  }

  return result;
}

uint64_t sub_188497A90(uint64_t a1)
{
  return *(void *)(a1 + 8) >> 61;
}

uint64_t sub_188497A9C(uint64_t result)
{
  *(void *)(result + 8) &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_188497AAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 8) = *(void *)(result + 8) & 0xFFFFFFFFFFFFFFFLL | (a2 << 61);
  return result;
}

void type metadata accessor for TunnelPacket.TransportProtocolHeader()
{
}

uint64_t destroy for ReadPacketGroup()
{
  return swift_release();
}

void type metadata accessor for ReadPacketGroup()
{
}

void _s19RemotePairingDevice15ReadPacketGroupVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_1_0();
}

void *_s19RemotePairingDevice15ReadPacketGroupVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

void _s19RemotePairingDevice15ReadPacketGroupVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  OUTLINED_FUNCTION_1_0();
}

void type metadata accessor for ReadPacketDataGroup()
{
}

void *__swift_memcpy89_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x59uLL);
}

uint64_t getEnumTagSinglePayload for TunnelInterfaceStatistics(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 89)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for TunnelInterfaceStatistics(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 88) = 0;
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

  *(_BYTE *)(result + 89) = v3;
  return result;
}

void type metadata accessor for TunnelInterfaceStatistics()
{
}

uint64_t dispatch thunk of static TunnelInterface.defaultMTU.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static TunnelInterface.minSupportedMTU.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static TunnelInterface.maxSupportedMTU.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static TunnelInterface.maxSupportedPendingPackets.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TunnelInterface.interfaceName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of TunnelInterface.address.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of TunnelInterface.init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)( uint64_t a1, uint64_t a2, uint64_t a3, int a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, unint64_t))(a9 + 56))( a1,  a2,  a3,  a4 & 0x1FFFF,  a5 | ((HIDWORD(a5) & 1) << 32));
}

uint64_t dispatch thunk of TunnelInterface.writePackets(_:completion:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t dispatch thunk of TunnelInterface.readPackets(completion:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of TunnelInterface.getInterfaceStatistics()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t *initializeBufferWithCopyOfBuffer for TunnelInterfaceParameters( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = sub_1884C9B3C();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    *(_WORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_WORD *)((char *)a2 + *(int *)(a3 + 24));
  }

  return a1;
}

uint64_t destroy for TunnelInterfaceParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1884C9B3C();
  unint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL);
  v6(a1, v4);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 20), v4);
}

uint64_t initializeWithCopy for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1884C9B3C();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_WORD *)(a1 + *(int *)(a3 + 24)) = *(_WORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1884C9B3C();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_WORD *)(a1 + *(int *)(a3 + 24)) = *(_WORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1884C9B3C();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_WORD *)(a1 + *(int *)(a3 + 24)) = *(_WORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1884C9B3C();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_WORD *)(a1 + *(int *)(a3 + 24)) = *(_WORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for TunnelInterfaceParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_188498008(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_161_0();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TunnelInterfaceParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_188498044(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_161_0();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t sub_188498078()
{
  uint64_t result = sub_1884C9B3C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

void type metadata accessor for TunnelPacket.TCPSegmentHeader.Flags()
{
}

uint64_t storeEnumTagSinglePayload for TunnelInterfaceParameters.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_188498148 + 4 * byte_1884D220F[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_18849817C + 4 * byte_1884D220A[v4]))();
}

uint64_t sub_18849817C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_188498184(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x18849818CLL);
  }
  return result;
}

uint64_t sub_188498198(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1884981A0LL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1884981A4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884981AC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TunnelInterfaceParameters.CodingKeys()
{
  return &type metadata for TunnelInterfaceParameters.CodingKeys;
}

unint64_t sub_1884981CC()
{
  unint64_t result = qword_18C70F840;
  if (!qword_18C70F840)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D243C, &type metadata for TunnelInterfaceParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70F840);
  }

  return result;
}

unint64_t sub_18849820C()
{
  unint64_t result = qword_18C70F848;
  if (!qword_18C70F848)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D2494, &unk_18A243118);
    atomic_store(result, (unint64_t *)&qword_18C70F848);
  }

  return result;
}

unint64_t sub_18849824C()
{
  unint64_t result = qword_18C70F850;
  if (!qword_18C70F850)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D2464, &unk_18A243118);
    atomic_store(result, (unint64_t *)&qword_18C70F850);
  }

  return result;
}

unint64_t sub_18849828C()
{
  unint64_t result = qword_18C70F858;
  if (!qword_18C70F858)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D24BC, &unk_18A243118);
    atomic_store(result, (unint64_t *)&qword_18C70F858);
  }

  return result;
}

unint64_t sub_1884982CC()
{
  unint64_t result = qword_18C70F860;
  if (!qword_18C70F860)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D24F4, &unk_18A243118);
    atomic_store(result, (unint64_t *)&qword_18C70F860);
  }

  return result;
}

unint64_t sub_18849830C()
{
  unint64_t result = qword_18C4DE760;
  if (!qword_18C4DE760)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D23AC, &type metadata for TunnelInterfaceParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DE760);
  }

  return result;
}

unint64_t sub_18849834C()
{
  unint64_t result = qword_18C4DE758;
  if (!qword_18C4DE758)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D23D4, &type metadata for TunnelInterfaceParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DE758);
  }

  return result;
}

uint64_t sub_188498388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a1;
  __int16 v6 = a2;
  char v7 = BYTE2(a2);
  char v8 = BYTE3(a2);
  char v9 = BYTE4(a2);
  char v10 = BYTE5(a2);
  return *((unsigned __int8 *)&v5 + a4);
}

uint64_t sub_18849843C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a1;
  __int16 v6 = a2;
  char v7 = BYTE2(a2);
  char v8 = BYTE3(a2);
  char v9 = BYTE4(a2);
  char v10 = BYTE5(a2);
  return bswap32(*(_DWORD *)((char *)&v5 + a4));
}

uint64_t sub_1884984F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_1884C95C0();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t result = sub_1884C95E4();
    if (__OFSUB__(a1, result))
    {
      __break(1u);
      goto LABEL_8;
    }

    uint64_t v9 = v7 + a1 - result;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  uint64_t result = sub_1884C95D8();
  if (v9) {
    return *(unsigned __int8 *)(v9 + a4);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_188498568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_1884C95C0();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t result = sub_1884C95E4();
    if (__OFSUB__(a1, result))
    {
      __break(1u);
      goto LABEL_8;
    }

    uint64_t v9 = v7 + a1 - result;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  uint64_t result = sub_1884C95D8();
  if (v9) {
    return bswap32(*(_DWORD *)(v9 + a4));
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_1_18()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_2_18()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_3_20()
{
  return 0LL;
}

uint64_t OUTLINED_FUNCTION_4_18()
{
  return sub_1884CA0E8();
}

uint64_t OUTLINED_FUNCTION_7_11()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_12()
{
  return sub_1884CA7D8();
}

uint64_t OUTLINED_FUNCTION_13_14@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, void))(a1 + 8))(v1, *(void *)(v2 - 88));
}

  ;
}

uint64_t OUTLINED_FUNCTION_15_12()
{
  return swift_release();
}

  ;
}

uint64_t OUTLINED_FUNCTION_19_8(uint64_t a1)
{
  return sub_18842A58C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_20_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_188469E5C(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_23_10()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_24_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_188469E5C(a1, a2, a3, 0LL);
}

uint64_t OUTLINED_FUNCTION_25_9(uint64_t a1)
{
  return sub_18842A58C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_27_7()
{
  return sub_1884CA8C8();
}

uint64_t OUTLINED_FUNCTION_28_6()
{
  return sub_18842A58C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_29_4()
{
  return sub_18842A58C(v1, v0);
}

  ;
}

  ;
}

uint64_t OUTLINED_FUNCTION_32_7()
{
  return sub_1884CA784();
}

uint64_t OUTLINED_FUNCTION_35_4()
{
  return v0;
}

void OUTLINED_FUNCTION_36_4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void OUTLINED_FUNCTION_38_7(uint64_t a1@<X8>)
{
}

uint64_t OUTLINED_FUNCTION_39_4()
{
  return sub_1884C9758();
}

uint64_t OUTLINED_FUNCTION_40_6()
{
  return sub_18841E590(v1, v0);
}

uint64_t OUTLINED_FUNCTION_41_6()
{
  return sub_1884CA8C8();
}

uint64_t OUTLINED_FUNCTION_43_7()
{
  return sub_18841E590(v0, v1);
}

uint64_t OUTLINED_FUNCTION_44_7()
{
  return sub_18841E590(v1, v0);
}

uint64_t OUTLINED_FUNCTION_45_5()
{
  return sub_1884C9758();
}

uint64_t OUTLINED_FUNCTION_46_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_188469D88(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_47_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_48_5(uint64_t a1)
{
  return sub_18842A58C(a1, v1);
}

  ;
}

uint64_t OUTLINED_FUNCTION_50_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_52_7(uint64_t a1)
{
  return sub_18842A58C(a1, v1);
}

  ;
}

uint64_t OUTLINED_FUNCTION_54_6()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_56_3()
{
  return sub_1884CA6B8();
}

uint64_t OUTLINED_FUNCTION_57_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_188498568(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_58_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1884984F4(a1, a2, a3, a4);
}

  ;
}

void OUTLINED_FUNCTION_61_6(uint64_t a1@<X8>)
{
  *(void *)a1 = v1;
  *(_BYTE *)(a1 + 8) = v2;
}

void OUTLINED_FUNCTION_62_5(void *a1@<X8>)
{
  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_63_5()
{
  return sub_1884CA0E8();
}

uint64_t OUTLINED_FUNCTION_66_5()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_67_5()
{
  return sub_1884C95E4();
}

uint64_t OUTLINED_FUNCTION_69_3()
{
  return sub_18842A58C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_70_5()
{
  return sub_18842A58C(*(void *)(v0 - 184), *(void *)(v0 - 200));
}

uint64_t OUTLINED_FUNCTION_71_4()
{
  return sub_18841E590(v0, v1);
}

uint64_t OUTLINED_FUNCTION_73_5()
{
  return sub_18841E590(v1, v0);
}

uint64_t OUTLINED_FUNCTION_74_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1884984F4(a1, a2, a3, 0LL);
}

uint64_t OUTLINED_FUNCTION_76_5(uint64_t a1)
{
  return sub_18841E590(a1, v1);
}

uint64_t OUTLINED_FUNCTION_77_4()
{
  return sub_1884C9758();
}

  ;
}

uint64_t OUTLINED_FUNCTION_81_2()
{
  return 0x73726F727245LL;
}

uint64_t OUTLINED_FUNCTION_82_2()
{
  return 0x74656B636150LL;
}

void OUTLINED_FUNCTION_83_3(uint64_t a1@<X8>)
{
  *unint64_t v1 = a1;
}

uint64_t sub_188498920(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x18961AFE8];
  if (v1)
  {
    uint64_t v10 = MEMORY[0x18961AFE8];
    sub_18842546C();
    uint64_t v2 = v10;
    uint64_t v4 = (unint64_t *)(a1 + 120);
    do
    {
      uint64_t v5 = *(v4 - 1);
      unint64_t v6 = *v4;
      sub_18841E590(v5, *v4);
      unint64_t v7 = *(void *)(v10 + 16);
      if (v7 >= *(void *)(v10 + 24) >> 1) {
        sub_18842546C();
      }
      v4 += 12;
      *(void *)(v10 + 16) = v7 + 1;
      uint64_t v8 = v10 + 16 * v7;
      *(void *)(v8 + 32) = v5;
      *(void *)(v8 + 40) = v6;
      --v1;
    }

    while (v1);
  }

  return v2;
}

uint64_t sub_1884989F8()
{
  uint64_t result = sub_1884CA400();
  qword_18C4DE800 = result;
  return result;
}

uint64_t sub_188498A70()
{
  if (qword_18C4DE7A0 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  if (byte_18C4DE79A) {
    __int16 v1 = 16032;
  }
  else {
    __int16 v1 = 4096;
  }
  word_18C4DE6F8 = v1;
  return result;
}

uint64_t sub_188498AF0()
{
  uint64_t result = sub_188498B10();
  byte_18C4DE79A = result & 1;
  return result;
}

uint64_t sub_188498B10()
{
  uint64_t v0 = sub_1884C9EF0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858](v0);
  int v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x18961B6C8], v0);
  uint64_t v4 = (void *)sub_1884CA328();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v5 = sub_188498D48();

  if (!v5)
  {
    sub_1884CA274();
    if (qword_18C4DE810 != -1) {
      swift_once();
    }
    sub_1884C9824();
    return 0LL;
  }

  if (!NEVirtualInterfaceSetMTU())
  {
    sub_1884CA274();
    if (qword_18C4DE810 != -1) {
      swift_once();
    }
    sub_1884C9824();
    swift_release();
    return 0LL;
  }

  NEVirtualInterfaceInvalidate();
  sub_1884CA274();
  if (qword_18C4DE810 != -1) {
    swift_once();
  }
  sub_1884C9824();
  swift_release();
  return 1LL;
}

uint64_t sub_188498D48()
{
  uint64_t v0 = (void *)sub_1884C9FA4();
  swift_bridgeObjectRelease();
  uint64_t NexusExtendedWithOptions = NEVirtualInterfaceCreateNexusExtendedWithOptions();

  uint64_t result = 0LL;
  if (NexusExtendedWithOptions)
  {
    type metadata accessor for _ManagedOpaqueCFTypeWrapper();
    swift_allocObject();
    return _ManagedOpaqueCFTypeWrapper.init(retainedValue:)(NexusExtendedWithOptions);
  }

  return result;
}

uint64_t static SkywalkChannelVirtualInterface.wideSkywalkChannelSupported.getter()
{
  if (qword_18C4DE7A0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_1();
  return byte_18C4DE79A;
}

uint64_t static SkywalkChannelVirtualInterface.wideSkywalkChannelSupported.setter(char a1)
{
  if (qword_18C4DE7A0 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  byte_18C4DE79A = a1 & 1;
  return result;
}

void static SkywalkChannelVirtualInterface.wideSkywalkChannelSupported.modify()
{
  if (qword_18C4DE7A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  OUTLINED_FUNCTION_1_0();
}

uint64_t static SkywalkChannelVirtualInterface.minSupportedMTU.getter()
{
  return 1280LL;
}

uint64_t sub_188498FE4()
{
  if (qword_18C4DE6E8 != -1) {
    uint64_t result = swift_once();
  }
  else {
    word_18C4DE7BC = word_18C4DE6F8 - 32;
  }
  return result;
}

uint64_t static SkywalkChannelVirtualInterface.maxSupportedMTU.getter()
{
  if (qword_18C4DE7A8 != -1) {
    swift_once();
  }
  return (unsigned __int16)word_18C4DE7BC;
}

void static SkywalkChannelVirtualInterface.maxSupportedPendingPackets.getter()
{
  if (qword_18C4DE8A0 != -1) {
    swift_once();
  }
  uint64_t v0 = OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_13(v0, v1, v2, v3, v4, v5, v6, v7, v12, v13, v14, v15, v16, v17, v18);
  uint64_t v8 = sub_188417A64();
  OUTLINED_FUNCTION_57_2(v8, v9, v10, v11);
  OUTLINED_FUNCTION_24();
}

void static SkywalkChannelVirtualInterface.defaultMTU.getter()
{
  if (qword_18C4DE848 != -1) {
    swift_once();
  }
  uint64_t v0 = OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_13(v0, v1, v2, v3, v4, v5, v6, v7, v12, v13, v14, v15, v16[0], v16[1], v17);
  uint64_t v8 = sub_188417A64();
  OUTLINED_FUNCTION_57_2(v8, v9, v10, v11);
  if ((v16 & 1) == 0 && !((unint64_t)&qword_18C4DE818 >> 16))
  {
    if (qword_18C4DE7A8 == -1) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }

  if (qword_18C4DE7A8 != -1) {
LABEL_9:
  }
    swift_once();
LABEL_8:
  OUTLINED_FUNCTION_24();
}

uint64_t sub_1884991EC()
{
  uint64_t v0 = nw_context_create();
  nw_context_set_isolate_protocol_stack();
  nw_context_set_scheduling_mode();
  uint64_t result = nw_context_activate();
  qword_18C70F870 = v0;
  return result;
}

void SkywalkChannelVirtualInterface.interfaceName.getter()
{
}

uint64_t SkywalkChannelVirtualInterface.address.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_18842FFC8(v1 + 32, a1);
}

void SkywalkChannelVirtualInterface.__allocating_init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)( uint64_t *a1, uint64_t a2, uint64_t a3, int a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
}

void SkywalkChannelVirtualInterface.init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = v8;
  uint64_t v10 = v7;
  *(void *)(v7 + 152) = 0LL;
  *(_OWORD *)(v7 + 88) = 0u;
  *(_OWORD *)(v7 + 104) = 0u;
  *(void *)(v7 + 120) = 0LL;
  if (qword_18C4DE8C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v15 = qword_18C4DE8A8;
  unint64_t v16 = unk_18C4DE8B0;
  char v17 = byte_18C4DE8B8;
  OUTLINED_FUNCTION_56_0();
  sub_188417948(v15, v16, v17);
  char v19 = v18;
  OUTLINED_FUNCTION_42_2();
  if ((v19 & 1) != 0)
  {
    sub_188499F08(a2, a1);
    uint64_t v20 = *(void **)(v10 + 152);
    *(void *)(v10 + 152) = v21;
  }

  if ((a4 & 0x10000) != 0)
  {
    static SkywalkChannelVirtualInterface.defaultMTU.getter();
    a4 = v22;
  }

  if ((((unsigned __int16)a4 + 32) & 0x10000) != 0)
  {
    __break(1u);
LABEL_53:
    swift_once();
LABEL_11:
    *(void *)(v10 + 144) = qword_18C70F870;
    char v70 = 0;
    swift_unknownObjectRetain();
    OUTLINED_FUNCTION_56_0();
    sub_1884CA4D8();
    swift_bridgeObjectRelease();
    uint64_t v66 = 0xD000000000000029LL;
    unint64_t v67 = 0x80000001884DDCE0LL;
    sub_1884CA0E8();
    sub_1884CA0AC();
    swift_bridgeObjectRelease();
    uint64_t v26 = os_transaction_create();
    swift_release();
    if (v26)
    {
      uint64_t v59 = v9;
      unint64_t v60 = v16;
      uint64_t v61 = a3;
      uint64_t v58 = v26;
      if (a7)
      {
        os_log_type_t v27 = sub_1884CA274();
        if (qword_18C4DE810 != -1) {
          swift_once();
        }
        uint64_t v28 = (os_log_s *)qword_18C4DE800;
        if (os_log_type_enabled((os_log_t)qword_18C4DE800, v27))
        {
          swift_bridgeObjectRetain_n();
          uint64_t v29 = (uint8_t *)OUTLINED_FUNCTION_4_7();
          uint64_t v66 = OUTLINED_FUNCTION_4_7();
          *(_DWORD *)uint64_t v29 = 136446210;
          OUTLINED_FUNCTION_211();
          OUTLINED_FUNCTION_18_13();
          uint64_t v68 = v30;
          sub_1884CA430();
          OUTLINED_FUNCTION_32_8();
          _os_log_impl(&dword_18840C000, v28, v27, "Physical interface name is:%{public}s", v29, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_0_11();
        }

        char v31 = (void *)sub_1884CA040();
        char v32 = (os_log_s *)NEVirtualInterfaceSetDelegateInterface();

        if ((_DWORD)v32)
        {
          os_log_type_t v33 = sub_1884CA274();
          if (OUTLINED_FUNCTION_34_7(v33))
          {
            OUTLINED_FUNCTION_211();
            uint64_t v34 = (uint8_t *)OUTLINED_FUNCTION_4_7();
            uint64_t v66 = OUTLINED_FUNCTION_4_7();
            *(_DWORD *)uint64_t v34 = 136315138;
            OUTLINED_FUNCTION_211();
            OUTLINED_FUNCTION_18_13();
            OUTLINED_FUNCTION_17_9(v35);
            OUTLINED_FUNCTION_32_8();
            v36 = "Assigned %s as the delegate interface on virtual interface successfully";
            goto LABEL_27;
          }
        }

        else
        {
          os_log_type_t v39 = sub_1884CA268();
          if (OUTLINED_FUNCTION_34_7(v39))
          {
            OUTLINED_FUNCTION_211();
            uint64_t v34 = (uint8_t *)OUTLINED_FUNCTION_4_7();
            uint64_t v66 = OUTLINED_FUNCTION_4_7();
            *(_DWORD *)uint64_t v34 = 136315138;
            OUTLINED_FUNCTION_211();
            OUTLINED_FUNCTION_18_13();
            OUTLINED_FUNCTION_17_9(v40);
            OUTLINED_FUNCTION_32_8();
            v36 = "Failed to set %s as the delegate interface on virtual interface";
LABEL_27:
            _os_log_impl(&dword_18840C000, v32, v27, v36, v34, 0xCu);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_0_11();
          }
        }

        OUTLINED_FUNCTION_115();
        a3 = v61;
      }

      else
      {
        sub_1884CA274();
        if (qword_18C4DE810 != -1) {
          swift_once();
        }
        sub_1884C9824();
      }

      sub_18842FFC8(a2, (uint64_t)&v66);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DE938);
      OUTLINED_FUNCTION_55_5();
      sub_18842FFC8(a3, (uint64_t)&v66);
      OUTLINED_FUNCTION_55_5();
      v41 = (void *)sub_1884CA040();
      v42 = (void *)sub_1884CA040();
      int v43 = NEVirtualInterfaceAddAddress();

      if (v43)
      {
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_115();
        if (NEVirtualInterfaceSetRankNever())
        {
          if (NEVirtualInterfaceUpdateAdHocService()
            && NEVirtualInterfaceSetMTU()
            && ((a5 & 0x100000000LL) != 0 || NEVirtualInterfaceSetMaxPendingPackets()))
          {
            *(void *)(v10 + 16) = v59;
            *(void *)(v10 + 24) = v60;
            sub_18842FFC8(a2, v10 + 32);
            *(void *)(v10 + 72) = a4;
            *(void *)(v10 + 80) = a1;
            *(void *)(v10 + 128) = v58;
            swift_bridgeObjectRetain();
            swift_retain();
            v64 = a1;
            swift_unknownObjectRetain();
            swift_unknownObjectRetain();
            v44 = sub_18849A7B4();
            if (!v57)
            {
              uint64_t v63 = (uint64_t)v44;
              swift_unknownObjectRelease();
              uint64_t v46 = *(void *)(v10 + 144);
              uint64_t v47 = sub_1884C9ED8();
              MEMORY[0x1895F8858](v47);
              OUTLINED_FUNCTION_34();
              uint64_t v50 = v49 - v48;
              *(void *)(v49 - v48) = 10LL;
              (*(void (**)(uint64_t, void))(v51 + 104))(v49 - v48, *MEMORY[0x18961B668]);
              type metadata accessor for SkywalkVirtualInterfaceNetworkProtocol();
              swift_allocObject();
              v52 = v64;
              swift_unknownObjectRetain();
              uint64_t v53 = sub_1884C5B94(v63, v52, v59, v60, v46, v50);
              swift_unknownObjectRelease();
              *(void *)(v10 + 136) = v53;
              OUTLINED_FUNCTION_48_6();
              OUTLINED_FUNCTION_37_6();
              uint64_t v54 = *(void *)(v53 + 16);
              *(void *)(v53 + 16) = sub_18849C7B4;
              *(void *)(v53 + 24) = 0LL;
              sub_188426020(v54);
              uint64_t v55 = *(void *)(v10 + 136);
              OUTLINED_FUNCTION_48_6();
              OUTLINED_FUNCTION_37_6();
              uint64_t v56 = *(void *)(v55 + 32);
              *(void *)(v55 + 32) = sub_18849C7BC;
              *(void *)(v55 + 40) = 0LL;
              sub_188426020(v56);
              OUTLINED_FUNCTION_271();
              swift_release();

              OUTLINED_FUNCTION_68_4();
              __swift_destroy_boxed_opaque_existential_0Tm(a2);
LABEL_51:
              OUTLINED_FUNCTION_0_2();
              return;
            }

            OUTLINED_FUNCTION_271();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            sub_18849A5FC(&v70, v59, v60);
            OUTLINED_FUNCTION_271();
            OUTLINED_FUNCTION_54_2();

            OUTLINED_FUNCTION_68_4();
            __swift_destroy_boxed_opaque_existential_0Tm(a2);
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_0Tm(v10 + 32);
            swift_release();

            int v45 = 1;
LABEL_46:
            sub_188426020(*(void *)(v10 + 88));
            sub_188499ED8(*(void *)(v10 + 104));
            if (v45) {
              swift_unknownObjectRelease();
            }
            if (a4) {
              swift_unknownObjectRelease();
            }

            swift_deallocPartialClassInstance();
            goto LABEL_51;
          }

          OUTLINED_FUNCTION_42_2();
          sub_18842E9B8();
          OUTLINED_FUNCTION_3_3();
          OUTLINED_FUNCTION_0_23();
          OUTLINED_FUNCTION_10_9();
          OUTLINED_FUNCTION_3_9();
          OUTLINED_FUNCTION_1_8();
          OUTLINED_FUNCTION_179_0();
          OUTLINED_FUNCTION_54_7();
          OUTLINED_FUNCTION_28_7();
          OUTLINED_FUNCTION_42_2();
          OUTLINED_FUNCTION_54_2();

          OUTLINED_FUNCTION_68_4();
          uint64_t v37 = a2;
LABEL_45:
          __swift_destroy_boxed_opaque_existential_0Tm(v37);
          int v45 = 0;
          goto LABEL_46;
        }

        OUTLINED_FUNCTION_42_2();
        sub_18842E9B8();
        OUTLINED_FUNCTION_3_3();
        OUTLINED_FUNCTION_0_23();
        OUTLINED_FUNCTION_10_9();
        OUTLINED_FUNCTION_3_9();
      }

      else
      {
        OUTLINED_FUNCTION_42_2();
        sub_18842E9B8();
        OUTLINED_FUNCTION_3_3();
        sub_1884CA904();
        uint64_t v68 = v66;
        unint64_t v69 = v67;
        sub_1884CA4D8();
        OUTLINED_FUNCTION_123_1();
        sub_1884CA0E8();
        OUTLINED_FUNCTION_115();
        OUTLINED_FUNCTION_123_1();
        sub_1884CA0E8();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_44_4(0x6F742027u);
        sub_1884CA0E8();
        sub_18842FF50();
        OUTLINED_FUNCTION_109();
      }

      sub_1884CA910();
      OUTLINED_FUNCTION_179_0();
      OUTLINED_FUNCTION_54_7();
      OUTLINED_FUNCTION_28_7();
      OUTLINED_FUNCTION_42_2();
      OUTLINED_FUNCTION_54_2();

      uint64_t v38 = v61;
    }

    else
    {
      OUTLINED_FUNCTION_42_2();
      OUTLINED_FUNCTION_115();
      sub_18842E9B8();
      OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_0_23();
      OUTLINED_FUNCTION_10_9();
      OUTLINED_FUNCTION_3_9();
      OUTLINED_FUNCTION_1_8();
      swift_willThrow();
      sub_18849A5FC(&v70, v9, v16);
      OUTLINED_FUNCTION_42_2();
      OUTLINED_FUNCTION_54_2();

      uint64_t v38 = a3;
    }

    __swift_destroy_boxed_opaque_existential_0Tm(v38);
    __swift_destroy_boxed_opaque_existential_0Tm(a2);
    int v45 = 0;
    goto LABEL_46;
  }

  a4 = sub_188498D48();
  if (!a4)
  {
    OUTLINED_FUNCTION_115();
    sub_18842E9B8();
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_10_9();
    OUTLINED_FUNCTION_3_9();
    OUTLINED_FUNCTION_1_8();
    OUTLINED_FUNCTION_179_0();

    __swift_destroy_boxed_opaque_existential_0Tm(a3);
    uint64_t v37 = a2;
    goto LABEL_45;
  }

  uint64_t v57 = v9;
  uint64_t v23 = NEVirtualInterfaceCopyName();
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    uint64_t v9 = sub_1884CA064();
    unint64_t v16 = v25;

    if (qword_18C70D720 == -1) {
      goto LABEL_11;
    }
    goto LABEL_53;
  }

  __break(1u);
}

uint64_t sub_188499ED8(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }

  return result;
}

void sub_188499F08(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = OUTLINED_FUNCTION_71_1();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x1895F8858](v3);
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  id v7 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  id v8 = objc_msgSend(v7, sel_URLsForDirectory_inDomains_, 13, 1);

  uint64_t v9 = sub_1884CA1D8();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70EAF0);
  MEMORY[0x1895F8858](v10);
  OUTLINED_FUNCTION_101();
  sub_188468B6C(v9, (uint64_t)v7);
  OUTLINED_FUNCTION_58_0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1LL, v3) == 1)
  {
    sub_188437B70((uint64_t)v7, (uint64_t *)&unk_18C70EAF0);
    sub_1884CA25C();
    if (qword_18C4DE810 != -1) {
      swift_once();
    }
    sub_1884C9824();
LABEL_16:
    OUTLINED_FUNCTION_17();
    return;
  }

  uint64_t v66 = *(void (**)(char *, id, uint64_t))(v4 + 32);
  unint64_t v67 = a2;
  v66((char *)v62 - v6, v7, v3);
  uint64_t v73 = 0LL;
  unint64_t v74 = 0xE000000000000000LL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DE938);
  sub_1884CA598();
  sub_1884CA0E8();
  uint64_t v71 = 58LL;
  unint64_t v72 = 0xE100000000000000LL;
  uint64_t v69 = 45LL;
  unint64_t v70 = 0xE100000000000000LL;
  sub_18845971C();
  sub_1884CA448();
  uint64_t v11 = swift_bridgeObjectRelease();
  v62[1] = (uint64_t)v62;
  MEMORY[0x1895F8858](v11);
  uint64_t v65 = v3;
  uint64_t v12 = (char *)v62 - v6;
  uint64_t v63 = (uint64_t)v62 - v6;
  sub_1884C962C();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_1884CA28C();
  v64 = v62;
  MEMORY[0x1895F8858](v13);
  OUTLINED_FUNCTION_34();
  (*(void (**)(uint64_t, void))(v16 + 104))(v15 - v14, *MEMORY[0x18961B850]);
  uint64_t v73 = sub_1884C9638();
  unint64_t v74 = v17;
  uint64_t v18 = sub_1884CA094();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1895F8858](v18);
  OUTLINED_FUNCTION_34();
  uint64_t v22 = v21 - v20;
  sub_1884CA088();
  uint64_t v23 = sub_1884CA454();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v22, v18);
  swift_bridgeObjectRelease();
  if (v23)
  {
    sub_188437C18(0LL, (unint64_t *)&unk_18C70EB00);
    MEMORY[0x1895F8858](v24);
    unint64_t v25 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
    uint64_t v68 = v12;
    uint64_t v26 = v12;
    uint64_t v27 = v65;
    v25((char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL), v26, v65);
    v62[0] = v4;
    unint64_t v28 = (*(unsigned __int8 *)(v4 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v29 = swift_allocObject();
    v66((char *)(v29 + v28), (char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL), v27);
    uint64_t v30 = v67;
    uint64_t v31 = sub_1884CA2B0();
    OUTLINED_FUNCTION_58_0();
    uint64_t v32 = sub_1884CA25C();
    if (v31)
    {
      if (qword_18C4DE810 != -1) {
        uint64_t v32 = swift_once();
      }
      unint64_t v67 = v62;
      uint64_t v33 = MEMORY[0x1895F8858](v32);
      OUTLINED_FUNCTION_14_4(v33, v34, v35, v36, v37, v38, v39, v40, v62[0]);
      if (OUTLINED_FUNCTION_52_2())
      {
        v41 = (_DWORD *)OUTLINED_FUNCTION_4_7();
        uint64_t v73 = OUTLINED_FUNCTION_4_7();
        _DWORD *v41 = 136315138;
        uint64_t v66 = (void (*)(char *, id, uint64_t))(v41 + 1);
        sub_18841729C( (unint64_t *)&unk_18C70F8F0,  (uint64_t (*)(uint64_t))MEMORY[0x189606A98],  MEMORY[0x189606AD8]);
        uint64_t v42 = OUTLINED_FUNCTION_77_1();
        sub_18844EF4C(v42, v43, &v73);
        OUTLINED_FUNCTION_51_3(v44);
        sub_1884CA430();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_8_4();
        OUTLINED_FUNCTION_43_3(&dword_18840C000, v45, v46, "Successfully created packet tracing logger at %s");
        OUTLINED_FUNCTION_47_2();
        OUTLINED_FUNCTION_0_11();
      }
    }

    else
    {
      if (qword_18C4DE810 != -1) {
        uint64_t v32 = swift_once();
      }
      uint64_t v47 = MEMORY[0x1895F8858](v32);
      OUTLINED_FUNCTION_14_4(v47, v48, v49, v50, v51, v52, v53, v54, v62[0]);
      if (OUTLINED_FUNCTION_52_2())
      {
        uint64_t v55 = (_DWORD *)OUTLINED_FUNCTION_4_7();
        uint64_t v56 = OUTLINED_FUNCTION_4_7();
        unint64_t v67 = v62;
        uint64_t v73 = v56;
        *uint64_t v55 = 136315138;
        uint64_t v66 = (void (*)(char *, id, uint64_t))(v55 + 1);
        sub_18841729C( (unint64_t *)&unk_18C70F8F0,  (uint64_t (*)(uint64_t))MEMORY[0x189606A98],  MEMORY[0x189606AD8]);
        uint64_t v57 = OUTLINED_FUNCTION_77_1();
        sub_18844EF4C(v57, v58, &v73);
        OUTLINED_FUNCTION_51_3(v59);
        sub_1884CA430();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_8_4();
        OUTLINED_FUNCTION_43_3(&dword_18840C000, v60, v61, "Failed to create packet tracing logger at %s");
        OUTLINED_FUNCTION_47_2();
        OUTLINED_FUNCTION_0_11();
      }
    }

    OUTLINED_FUNCTION_8_4();
    OUTLINED_FUNCTION_9_4(v27);
    OUTLINED_FUNCTION_9_4(v63);
    goto LABEL_16;
  }

  __break(1u);
}

_BYTE *sub_18849A5FC(_BYTE *result, uint64_t a2, unint64_t a3)
{
  if ((*result & 1) == 0)
  {
    os_log_type_t v5 = sub_1884CA25C();
    if (qword_18C4DE810 != -1) {
      swift_once();
    }
    unint64_t v6 = (os_log_s *)qword_18C4DE800;
    if (os_log_type_enabled((os_log_t)qword_18C4DE800, v5))
    {
      swift_bridgeObjectRetain_n();
      id v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v10 = v8;
      *(_DWORD *)id v7 = 136446210;
      if (a3)
      {
        unint64_t v9 = a3;
      }

      else
      {
        a2 = 0x6E776F6E6B6E753CLL;
        unint64_t v9 = 0xE90000000000003ELL;
      }

      swift_bridgeObjectRetain();
      sub_18844EF4C(a2, v9, &v10);
      sub_1884CA430();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_18840C000, v6, v5, "Cleaning up virtual interface %{public}s due to throwing init", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895C7BD0](v8, -1LL, -1LL);
      MEMORY[0x1895C7BD0](v7, -1LL, -1LL);
    }

    return (_BYTE *)NEVirtualInterfaceInvalidate();
  }

  return result;
}

ValueMetadata *sub_18849A7B4()
{
  uint64_t v0 = NEVirtualInterfaceCopyNexusInstances();
  if (!v0) {
    __break(1u);
  }
  uint64_t v1 = (void *)v0;
  type metadata accessor for CFUUID(0LL);
  sub_1884CA1CC();

  sub_18842E9B8();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_23();
  sub_18842FF50();
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_3_3();
  sub_1884CA910();
  swift_willThrow();
  return &type metadata for RemotePairingError;
}

uint64_t sub_18849A9E4()
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = *(void *)(result + 88);
    if (v1)
    {
      uint64_t v2 = *(void *)(result + 96);
      *(void *)(result + 88) = 0LL;
      *(void *)(result + 96) = 0LL;
      swift_retain();
      sub_188426020(v1);
      SkywalkChannelVirtualInterface.readPackets(completion:)(v1, v2);
      sub_188426020(v1);
    }

    return swift_release();
  }

  return result;
}

void SkywalkChannelVirtualInterface.readPackets(completion:)(uint64_t a1, uint64_t a2)
{
  os_log_type_t v5 = (void *)swift_allocObject();
  v5[2] = v2;
  v5[3] = a1;
  v5[4] = a2;
  unint64_t v6 = OUTLINED_FUNCTION_1_9((uint64_t)sub_1884530E8, MEMORY[0x1895F87A8], 1107296256LL, v7, v8);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_124();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v6);
  OUTLINED_FUNCTION_36_5();
}

void *sub_18849AB28()
{
  uint64_t result = (void *)swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = result[13];
    if (v2)
    {
      uint64_t v4 = result[14];
      uint64_t v3 = result[15];
      result[13] = 0LL;
      result[14] = 0LL;
      result[15] = 0LL;
      sub_18849CFBC(v2);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_188499ED8(v2);
      os_log_type_t v5 = (void *)swift_allocObject();
      v5[2] = v1;
      v5[3] = v3;
      v5[4] = v2;
      v5[5] = v4;
      aBlock[4] = sub_18849D024;
      aBlock[5] = v5;
      aBlock[0] = MEMORY[0x1895F87A8];
      aBlock[1] = 1107296256LL;
      aBlock[2] = sub_1884530E8;
      aBlock[3] = &block_descriptor_28_0;
      unint64_t v6 = _Block_copy(aBlock);
      swift_retain();
      swift_unknownObjectRetain();
      swift_retain();
      swift_release();
      nw_queue_context_async_if_needed();
      _Block_release(v6);
      swift_release();
      swift_unknownObjectRelease();
      sub_188499ED8(v2);
    }

    return (void *)swift_release();
  }

  return result;
}

void SkywalkChannelVirtualInterface.writePackets(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v7[5] = a3;
  uint64_t v8 = OUTLINED_FUNCTION_1_9((uint64_t)sub_1884530E8, MEMORY[0x1895F87A8], 1107296256LL, v9, v10);
  OUTLINED_FUNCTION_2_3();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_124();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v8);
  OUTLINED_FUNCTION_36_5();
}

void SkywalkChannelVirtualInterface.deinit()
{
  uint64_t v1 = v0;
  os_log_type_t v2 = sub_1884CA274();
  if (qword_18C4DE810 != -1) {
    swift_once();
  }
  uint64_t v3 = (os_log_s *)qword_18C4DE800;
  uint64_t v4 = v2;
  if (os_log_type_enabled((os_log_t)qword_18C4DE800, v2))
  {
    OUTLINED_FUNCTION_124();
    os_log_type_t v5 = (uint8_t *)OUTLINED_FUNCTION_4_7();
    aBlock[0] = OUTLINED_FUNCTION_4_7();
    *(_DWORD *)os_log_type_t v5 = 136446210;
    uint64_t v6 = *(void *)(v1 + 16);
    unint64_t v7 = *(void *)(v1 + 24);
    swift_bridgeObjectRetain();
    sub_18844EF4C(v6, v7, aBlock);
    sub_1884CA430();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl( &dword_18840C000,  v3,  (os_log_type_t)v4,  "Invalidating virtual interface ref for interface %{public}s",  v5,  0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_11();
  }

  NEVirtualInterfaceInvalidate();
  uint64_t v8 = *(void **)(v1 + 152);
  if (v8)
  {
    uint64_t v9 = sub_1884CA280();
    uint64_t v10 = *(void *)(v9 - 8);
    MEMORY[0x1895F8858](v9);
    OUTLINED_FUNCTION_101();
    aBlock[0] = MEMORY[0x18961AFE8];
    sub_18841729C((unint64_t *)&unk_18C70EAC0, v11, MEMORY[0x18961B848]);
    id v12 = v8;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70F920);
    sub_188459640((unint64_t *)&unk_18C70EAD0, (uint64_t *)&unk_18C70F920);
    sub_1884CA484();
    sub_1884CA2BC();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v4, v9);
  }

  uint64_t v13 = *(void *)(v1 + 136);
  aBlock[4] = (uint64_t)sub_18849CD40;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = (uint64_t)sub_1884530E8;
  aBlock[3] = (uint64_t)&block_descriptor_13_0;
  uint64_t v14 = _Block_copy(aBlock);
  OUTLINED_FUNCTION_2_3();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v14);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm(v1 + 32);
  swift_release();

  sub_188426020(*(void *)(v1 + 88));
  sub_188499ED8(*(void *)(v1 + 104));
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

  OUTLINED_FUNCTION_17();
}

uint64_t sub_18849B034()
{
  return sub_1884C6960(0);
}

uint64_t SkywalkChannelVirtualInterface.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_18849B078(void *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v8 = sub_188498920(a2);
  uint64_t v9 = sub_1884C6444(v8);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 16);
  if (v9 >= v11) {
    return a3(0LL);
  }
  if (v9 < 0)
  {
    __break(1u);
  }

  else
  {
    unint64_t v12 = (2 * v11) | 1;
    swift_retain();
    uint64_t v13 = swift_bridgeObjectRetain();
    uint64_t v14 = sub_18849B150(v13, a2 + 32, v9, v12);
    uint64_t v15 = a1[13];
    a1[13] = a3;
    a1[14] = a4;
    a1[15] = v14;
    return sub_188499ED8(v15);
  }

  return result;
}

uint64_t sub_18849B150(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_1884CA85C();
  swift_unknownObjectRetain_n();
  uint64_t v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    uint64_t v10 = MEMORY[0x18961AFE8];
  }

  uint64_t v11 = *(void *)(v10 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }

  if (v11 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    sub_18848D730(a1, a2, a3, a4);
    uint64_t v9 = v8;
    goto LABEL_9;
  }

  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x18961AFE8];
  }

uint64_t sub_18849B234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v27;
  __int128 v24 = aBlock;
  unint64_t v7 = *(void **)(a1 + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = v24;
  *(void *)(v8 + 32) = v6;
  *(void *)(v8 + 40) = a1;
  *(void *)(v8 + 48) = a2;
  *(void *)(v8 + 56) = a3;
  uint64_t v29 = sub_18849CF18;
  uint64_t v30 = v8;
  *(void *)&__int128 aBlock = MEMORY[0x1895F87A8];
  *((void *)&aBlock + 1) = 1107296256LL;
  uint64_t v27 = sub_1884530E8;
  unint64_t v28 = &block_descriptor_19;
  uint64_t v21 = _Block_copy(&aBlock);
  uint64_t v9 = sub_1884C9F14();
  uint64_t v22 = *(void *)(v9 - 8);
  uint64_t v23 = v9;
  MEMORY[0x1895F8858](v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v12 = v7;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1884C9EFC();
  uint64_t v13 = sub_1884C9EE4();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1895F8858](v13);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = MEMORY[0x18961AFE8];
  sub_18841729C((unint64_t *)&qword_18C4DDA40, v17, MEMORY[0x18961B6C0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C4DDAB0);
  sub_188459640((unint64_t *)&qword_18C4DDAC0, (uint64_t *)&unk_18C4DDAB0);
  sub_1884CA484();
  uint64_t v18 = v21;
  MEMORY[0x1895C6AC0](0LL, v11, v16, v21);
  _Block_release(v18);
  swift_release();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v23);
  return swift_release();
}

uint64_t sub_18849B47C( uint64_t a1, uint64_t (*a2)(void), uint64_t a3, void *a4, void (*a5)(void), uint64_t a6)
{
  uint64_t v6 = a5;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_18849C7C4(v10, a1);
    uint64_t v13 = v12;
    uint64_t v14 = (void *)a4[19];
    if (v14)
    {
      uint64_t v15 = *(void *)(v12 + 16);
      if (v15)
      {
        uint64_t v30 = v6;
        uint64_t v31 = a2;
        uint64_t v32 = a3;
        id v33 = v14;
        swift_bridgeObjectRetain();
        uint64_t v29 = v13;
        uint64_t v16 = (uint64_t *)(v13 + 64);
        do
        {
          uint64_t v34 = v15;
          char v17 = *((_BYTE *)v16 - 8);
          uint64_t v18 = *v16;
          unint64_t v19 = v16[1];
          uint64_t v21 = v16[2];
          unint64_t v20 = v16[3];
          uint64_t v23 = v16[4];
          unint64_t v22 = v16[5];
          uint64_t v24 = v16[6];
          unint64_t v25 = v16[7];
          LODWORD(v35) = *((_DWORD *)v16 - 8);
          __int128 v36 = *(_OWORD *)(v16 - 3);
          char v37 = v17;
          uint64_t v38 = v18;
          unint64_t v39 = v19;
          uint64_t v40 = v21;
          unint64_t v41 = v20;
          uint64_t v42 = v23;
          unint64_t v43 = v22;
          uint64_t v44 = v24;
          unint64_t v45 = v25;
          sub_18841E590(v18, v19);
          sub_18841E590(v21, v20);
          sub_188459598(v23, v22);
          sub_18841E590(v24, v25);
          sub_18849B65C(&v35, (uint64_t)v33);
          sub_18842A58C(v18, v19);
          sub_18842A58C(v21, v20);
          sub_1884595C4(v23, v22);
          sub_18842A58C(v24, v25);
          v16 += 12;
          uint64_t v15 = v34 - 1;
        }

        while (v34 != 1);

        uint64_t v13 = v29;
        swift_bridgeObjectRelease();
        a3 = v32;
        uint64_t v6 = v30;
        a2 = v31;
      }
    }

    uint64_t v35 = v13;
    *(void *)&__int128 v36 = a2;
    *((void *)&v36 + 1) = a3;
    swift_retain();
    v6(&v35);
    swift_release();
    return swift_bridgeObjectRelease();
  }

  else
  {
    uint64_t v27 = a4[11];
    a4[11] = a5;
    a4[12] = a6;
    sub_188426020(v27);
    uint64_t v28 = swift_retain();
    return a2(v28);
  }

void sub_18849B65C(void *a1, uint64_t a2)
{
  unint64_t v3 = a1[9];
  if (v3 >> 60 != 15)
  {
    uint64_t v29 = v2;
    uint64_t v30 = a2;
    uint64_t v5 = a1[4];
    unint64_t v4 = a1[5];
    unint64_t v6 = a1[7];
    uint64_t v43 = a1[6];
    uint64_t v7 = a1[8];
    uint64_t v8 = sub_1884C9B3C();
    char v37 = &v24;
    uint64_t v41 = *(void *)(v8 - 8);
    MEMORY[0x1895F8858](v8);
    unint64_t v35 = (unint64_t)(v9 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    __int128 v36 = v9;
    uint64_t v40 = (char *)&v24 - v35;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DE920);
    unint64_t v39 = &v24;
    MEMORY[0x1895F8858](v10);
    unint64_t v33 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v34 = v11;
    uint64_t v12 = (char *)&v24 - v33;
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70EAE0);
    unint64_t v38 = (unint64_t)&v24;
    uint64_t v14 = *(void *)(*(void *)(v13 - 8) + 64LL);
    MEMORY[0x1895F8858](v13);
    unint64_t v32 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v15 = (char *)&v24 - v32;
    uint64_t v31 = sub_1884C9B90();
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1LL, 1LL, v31);
    sub_188459598(v7, v3);
    OUTLINED_FUNCTION_53_4();
    unint64_t v42 = v6;
    sub_18841E590(v43, v6);
    OUTLINED_FUNCTION_53_4();
    sub_1884C9B48();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1LL, v8) == 1)
    {
      sub_1884595C4(v7, v3);
      sub_18842A58C(v5, v4);
      sub_18842A58C(v43, v42);
      sub_188437B70((uint64_t)v12, &qword_18C4DE920);
    }

    else
    {
      uint64_t v26 = v7;
      uint64_t v27 = v5;
      unint64_t v38 = v3;
      unint64_t v28 = v4;
      unint64_t v25 = *(uint64_t (**)(char *, char *, uint64_t))(v41 + 32);
      uint64_t v16 = v25(v40, v12, v8);
      uint64_t v17 = MEMORY[0x1895F8858](v16);
      uint64_t v18 = (char *)&v24 - v35;
      uint64_t v19 = MEMORY[0x1895F8858](v17);
      unint64_t v20 = (char *)&v24 - v33;
      MEMORY[0x1895F8858](v19);
      __swift_storeEnumTagSinglePayload((uint64_t)&v24 - v32, 1LL, 1LL, v31);
      unint64_t v22 = v42;
      uint64_t v21 = v43;
      sub_18841E590(v43, v42);
      sub_1884C9B48();
      if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1LL, v8) != 1)
      {
        __int128 v36 = v18;
        v25(v18, v20, v8);
        uint64_t v23 = (char *)&loc_18849B9C0 + 4 * byte_1884D2670[v38 >> 61];
        unint64_t v39 = &v24;
        __asm { BR              X10 }
      }

      (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v8);
      sub_1884595C4(v26, v38);
      sub_18842A58C(v27, v28);
      sub_18842A58C(v21, v22);
      sub_188437B70((uint64_t)v20, &qword_18C4DE920);
    }
  }

uint64_t sub_18849BF18(int a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = sub_1884C9554();
    uint64_t v5 = (uint64_t (*)(uint64_t))MEMORY[0x189605FC0];
    uint64_t v6 = *(void *)(v4 - 8);
    uint64_t v7 = *(void *)(v6 + 64);
    MEMORY[0x1895F8858](v4);
    unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    int v47 = a1;
    uint64_t v9 = sub_1884C9830();
    if ((v9 & 0x100000000LL) != 0) {
      int v10 = 5;
    }
    else {
      int v10 = v9;
    }
    LODWORD(v52) = v10;
    sub_18842FE04(MEMORY[0x18961AFE8]);
    sub_18841729C(qword_18C70EB10, v5, MEMORY[0x189605FB8]);
    uint64_t v11 = v4;
    sub_1884C9608();
    LODWORD(v48) = sub_1884CA25C();
    if (qword_18C4DE810 != -1) {
      swift_once();
    }
    uint64_t v12 = (os_log_s *)qword_18C4DE800;
    uint64_t v13 = sub_1884C9644();
    uint64_t v50 = &v43;
    uint64_t v14 = *(void *)(v13 - 8);
    MEMORY[0x1895F8858](v13);
    uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a2, v13);
    uint64_t v49 = &v43;
    MEMORY[0x1895F8858](v17);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)&v43 - v8, (char *)&v43 - v8, v11);
    int v18 = v48;
    os_log_t v48 = v12;
    if (os_log_type_enabled(v12, (os_log_type_t)v18))
    {
      uint64_t v19 = swift_slowAlloc();
      int v45 = v18;
      uint64_t v20 = v19;
      uint64_t v46 = swift_slowAlloc();
      uint64_t v52 = v46;
      *(_DWORD *)uint64_t v20 = 136446722;
      sub_18841729C( (unint64_t *)&unk_18C70F8F0,  (uint64_t (*)(uint64_t))MEMORY[0x189606A98],  MEMORY[0x189606AD8]);
      uint64_t v21 = sub_1884CA7D8();
      sub_18844EF4C(v21, v22, &v52);
      uint64_t v51 = v23;
      uint64_t v43 = v6;
      uint64_t v44 = (char *)&v43 - v8;
      sub_1884CA430();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      *(_WORD *)(v20 + 12) = 1024;
      LODWORD(v51) = v47;
      sub_1884CA430();
      *(_WORD *)(v20 + 18) = 2080;
      sub_18841729C(&qword_18C70F900, (uint64_t (*)(uint64_t))MEMORY[0x189605FC0], MEMORY[0x189605FD0]);
      uint64_t v24 = sub_1884CA8B0();
      sub_18844EF4C(v24, v25, &v52);
      uint64_t v51 = v26;
      sub_1884CA430();
      swift_bridgeObjectRelease();
      uint64_t v27 = *(void (**)(char *, uint64_t))(v43 + 8);
      v27((char *)&v43 - v8, v11);
      _os_log_impl( &dword_18840C000,  v48,  (os_log_type_t)v45,  "%{public}s: IO cleanup error: %d, %s",  (uint8_t *)v20,  0x1Cu);
      uint64_t v28 = v46;
      swift_arrayDestroy();
      MEMORY[0x1895C7BD0](v28, -1LL, -1LL);
      MEMORY[0x1895C7BD0](v20, -1LL, -1LL);
      return ((uint64_t (*)(char *, uint64_t))v27)(v44, v11);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      unint64_t v42 = *(void (**)(char *, uint64_t))(v6 + 8);
      v42((char *)&v43 - v8, v11);
      return ((uint64_t (*)(char *, uint64_t))v42)((char *)&v43 - v8, v11);
    }
  }

  else
  {
    os_log_type_t v30 = sub_1884CA244();
    if (qword_18C4DE810 != -1) {
      swift_once();
    }
    uint64_t v31 = (os_log_s *)qword_18C4DE800;
    uint64_t v32 = sub_1884C9644();
    uint64_t v33 = *(void *)(v32 - 8);
    MEMORY[0x1895F8858](v32);
    unint64_t v35 = (char *)&v43 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v35, a2, v32);
    os_log_type_t v36 = v30;
    if (os_log_type_enabled(v31, v30))
    {
      char v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v52 = v38;
      *(_DWORD *)char v37 = 136446210;
      sub_18841729C( (unint64_t *)&unk_18C70F8F0,  (uint64_t (*)(uint64_t))MEMORY[0x189606A98],  MEMORY[0x189606AD8]);
      uint64_t v39 = sub_1884CA7D8();
      sub_18844EF4C(v39, v40, &v52);
      uint64_t v51 = v41;
      sub_1884CA430();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v32);
      _os_log_impl(&dword_18840C000, v31, v36, "%{public}s: IO cleanup complete", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895C7BD0](v38, -1LL, -1LL);
      return MEMORY[0x1895C7BD0](v37, -1LL, -1LL);
    }

    else
    {
      return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v35, v32);
    }
  }

void SkywalkChannelVirtualInterface.getInterfaceStatistics()()
{
  uint64_t v0 = (void *)NEVirtualInterfaceCopyStatistics();
  if (v0)
  {
    id v1 = v0;
    sub_1884C9FB0();

    sub_18842E9B8();
    OUTLINED_FUNCTION_3_3();
    sub_1884CA904();
    sub_1884CA4D8();
    sub_1884CA0E8();
    type metadata accessor for CFDictionary(0LL);
    id v2 = v1;
    sub_1884CA0A0();
    sub_1884CA0E8();
    OUTLINED_FUNCTION_115();
    OUTLINED_FUNCTION_44_4(0x726F6620u);
    sub_1884CA0E8();
    swift_bridgeObjectRetain();
    sub_1884CA0E8();
    swift_bridgeObjectRelease();
    sub_18842FF50();
    OUTLINED_FUNCTION_109();
    sub_1884CA910();
    swift_willThrow();
  }

  else
  {
    __break(1u);
  }

void sub_18849C67C()
{
}

uint64_t sub_18849C690()
{
  return static SkywalkChannelVirtualInterface.maxSupportedMTU.getter();
}

void sub_18849C6A4()
{
}

void sub_18849C6B8()
{
}

uint64_t sub_18849C6D8@<X0>(uint64_t a1@<X8>)
{
  return SkywalkChannelVirtualInterface.address.getter(a1);
}

void sub_18849C6F8( uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, unint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  if (!v8) {
    *a8 = v10;
  }
}

void sub_18849C730(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_18849C750(uint64_t a1, uint64_t a2)
{
}

void sub_18849C770()
{
}

uint64_t sub_18849C790()
{
  return swift_deallocObject();
}

uint64_t sub_18849C7B4()
{
  return sub_18849A9E4();
}

void *sub_18849C7BC()
{
  return sub_18849AB28();
}

uint64_t sub_18849C7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v4;
  if (*(void *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    __asm { BR              X9 }
  }

  if (a1 < 0)
  {
    __break(1u);
    JUMPOUT(0x18849CCD0LL);
  }

  *(void *)(v4 + 16) = 0LL;
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_18849CCE0()
{
  return swift_deallocObject();
}

uint64_t sub_18849CD0C()
{
  return sub_18849B234(v0[2], v0[3], v0[4]);
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t sub_18849CD34()
{
  return sub_18849B078( *(void **)(v0 + 16),  *(void *)(v0 + 24),  *(uint64_t (**)(void))(v0 + 32),  *(void *)(v0 + 40));
}

uint64_t sub_18849CD40()
{
  return sub_18849B034();
}

uint64_t type metadata accessor for SkywalkChannelVirtualInterface()
{
  return objc_opt_self();
}

uint64_t method lookup function for SkywalkChannelVirtualInterface()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SkywalkChannelVirtualInterface.__allocating_init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)( uint64_t a1, uint64_t a2, uint64_t a3, int a4, unint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, unint64_t))(v5 + 160))( a1,  a2,  a3,  a4 & 0x1FFFF,  a5 | ((HIDWORD(a5) & 1) << 32));
}

uint64_t destroy for PendingPacketWrite()
{
  return swift_bridgeObjectRelease();
}

void _s19RemotePairingDevice18PendingPacketWriteVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_1_0();
}

void *assignWithCopy for PendingPacketWrite(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PendingPacketWrite(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PendingPacketWrite()
{
  return &type metadata for PendingPacketWrite;
}

unint64_t sub_18849CEB8(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else if (*(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10) > result)
    {
      return result;
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_18849CEDC()
{
  return swift_deallocObject();
}

uint64_t sub_18849CF18()
{
  return sub_18849B47C( *(void *)(v0 + 16),  *(uint64_t (**)(void))(v0 + 24),  *(void *)(v0 + 32),  *(void **)(v0 + 40),  *(void (**)(void))(v0 + 48),  *(void *)(v0 + 56));
}

uint64_t sub_18849CF28()
{
  uint64_t v1 = OUTLINED_FUNCTION_71_1();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8LL))( v0 + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL)),  v1);
  return swift_deallocObject();
}

uint64_t sub_18849CF84(int a1)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(OUTLINED_FUNCTION_71_1() - 8) + 80LL);
  return sub_18849BF18(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_18849CFBC(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_bridgeObjectRetain();
  }

  return result;
}

uint64_t objectdestroy_6Tm()
{
  return swift_deallocObject();
}

void sub_18849D024()
{
}

uint64_t OUTLINED_FUNCTION_0_23()
{
  return sub_1884CA904();
}

uint64_t OUTLINED_FUNCTION_3_21()
{
  return sub_1884CA598();
}

unint64_t OUTLINED_FUNCTION_10_9()
{
  uint64_t v1 = *(void *)(v0 - 160);
  *(void *)(v0 - 128) = *(void *)(v0 - 168);
  *(void *)(v0 - 120) = v1;
  return sub_18842FF50();
}

uint64_t OUTLINED_FUNCTION_17_9(uint64_t a1)
{
  *(void *)(v1 - 128) = a1;
  return sub_1884CA430();
}

void OUTLINED_FUNCTION_18_13()
{
}

_BYTE *OUTLINED_FUNCTION_28_7()
{
  return sub_18849A5FC((_BYTE *)(v1 - 65), *(void *)(v1 - 264), v0);
}

uint64_t OUTLINED_FUNCTION_32_8()
{
  return swift_bridgeObjectRelease_n();
}

BOOL OUTLINED_FUNCTION_34_7(os_log_type_t a1)
{
  return os_log_type_enabled(*(os_log_t *)(v1 + 2048), a1);
}

  ;
}

uint64_t OUTLINED_FUNCTION_37_6()
{
  return swift_weakInit();
}

uint64_t OUTLINED_FUNCTION_40_7()
{
  return sub_1884CA7D8();
}

uint64_t OUTLINED_FUNCTION_48_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_53_4()
{
  return sub_18841E590(v1, v0);
}

uint64_t OUTLINED_FUNCTION_54_7()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_55_5()
{
  return sub_1884CA0A0();
}

  ;
}

uint64_t OUTLINED_FUNCTION_58_6()
{
  return *(void *)(v0 - 176);
}

uint64_t OUTLINED_FUNCTION_68_4()
{
  return __swift_destroy_boxed_opaque_existential_0Tm(*(void *)(v0 - 232));
}

uint64_t sub_18849D19C(uint64_t a1, unint64_t a2)
{
  return ((uint64_t (*)(void))((char *)sub_18849D1C0 + 4 * byte_1884D2760[a2 >> 62]))();
}

BOOL sub_18849D1C0(uint64_t a1, uint64_t a2)
{
  return BYTE6(a2) == 0LL;
}

void sub_18849D1E8(uint64_t a1, void *a2, uint64_t a3)
{
  if (*a2 < a3)
  {
    if (((unint64_t)", device supports >=" & 0x2000000000000000LL) == 0
      || (((unint64_t)", device supports >=" >> 56) & 0xF) != 0)
    {
      uint64_t v3 = sub_1884CA0D0();
      if (v3 < 0)
      {
        __break(1u);
      }

      else if (v3)
      {
        OUTLINED_FUNCTION_39_5();
      }

      __break(1u);
    }

    sub_1884CA4D8();
    swift_bridgeObjectRelease();
    sub_1884CA5E0();
    __break(1u);
  }

uint64_t NWConnection.receive(minLength:maxLength:completion:)()
{
  uint64_t v3 = (void *)OUTLINED_FUNCTION_19_0();
  v3[2] = v2;
  v3[3] = v1;
  v3[4] = v0;
  OUTLINED_FUNCTION_124();
  sub_1884C9C80();
  return OUTLINED_FUNCTION_18_14();
}

uint64_t sub_18849D3D8()
{
  uint64_t result = sub_1884CA400();
  qword_18C4DE900 = result;
  return result;
}

id powerLog.getter()
{
  if (qword_18C4DE908 != -1) {
    swift_once();
  }
  return (id)qword_18C4DE900;
}

uint64_t sub_18849D484()
{
  uint64_t result = sub_1884CA400();
  qword_18C70F908 = result;
  return result;
}

RemotePairingDevice::TransportProtocolType_optional __swiftcall TransportProtocolType.init(rawValue:)( Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1884CA628();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t TransportProtocolType.rawValue.getter()
{
  uint64_t v1 = 7365492LL;
  if (*v0 != 1) {
    uint64_t v1 = 7365749LL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1667855729LL;
  }
}

void sub_18849D59C(char *a1, char *a2)
{
}

void sub_18849D5A8()
{
}

uint64_t sub_18849D5B0()
{
  return sub_188438A4C();
}

void sub_18849D5B8()
{
}

RemotePairingDevice::TransportProtocolType_optional sub_18849D5C0(Swift::String *a1)
{
  return TransportProtocolType.init(rawValue:)(*a1);
}

void sub_18849D5CC(uint64_t *a1@<X8>)
{
  *a1 = TransportProtocolType.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_18849D5EC()
{
  return sub_1884CA1A8();
}

uint64_t sub_18849D648()
{
  return sub_1884CA190();
}

BOOL static TunnelConnectionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void TunnelConnectionState.hash(into:)()
{
}

void TunnelConnectionState.hashValue.getter()
{
}

void PeerConnectionInfo.description.getter()
{
}

uint64_t PeerConnectionInfo.init(owningPID:owningProcessName:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_DWORD *)a4 = result;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = a3;
  return result;
}

uint64_t sub_18849D794(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4950676E696E776FLL && a2 == 0xE900000000000044LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0xD000000000000011LL && a2 == 0x80000001884E01D0LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = sub_1884CA820();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_18849D88C(char a1)
{
  if ((a1 & 1) != 0) {
    return 0xD000000000000011LL;
  }
  else {
    return 0x4950676E696E776FLL;
  }
}

void sub_18849D8CC()
{
}

uint64_t sub_18849D8FC()
{
  return sub_18849D88C(*v0);
}

uint64_t sub_18849D904@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_18849D794(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_18849D928()
{
  return sub_1884CA9F4();
}

uint64_t sub_18849D950()
{
  return sub_1884CAA00();
}

void PeerConnectionInfo.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70F910);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  OUTLINED_FUNCTION_101();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_18849F8B0();
  sub_1884CA9E8();
  sub_1884CA790();
  if (!v1) {
    sub_1884CA754();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  OUTLINED_FUNCTION_0_2();
}

void PeerConnectionInfo.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DE990);
  MEMORY[0x1895F8858](v5);
  OUTLINED_FUNCTION_9_0();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_18849F8B0();
  sub_1884CA9D0();
  if (!v2)
  {
    int v6 = sub_1884CA6C4();
    uint64_t v7 = sub_1884CA688();
    uint64_t v9 = v8;
    OUTLINED_FUNCTION_12();
    *(_DWORD *)a2 = v6;
    *(void *)(a2 + 8) = v7;
    *(void *)(a2 + 16) = v9;
  }

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  OUTLINED_FUNCTION_0_2();
}

void sub_18849DB90(void *a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_18849DBA4(void *a1)
{
}

uint64_t static TunnelConnectionIdentifierCategory.numberOfCharacters.getter()
{
  return 8LL;
}

uint64_t static TunnelConnectionIdentifierCategory.prefix.getter()
{
  return 1852793716LL;
}

uint64_t sub_18849DBD4()
{
  return 1852793716LL;
}

uint64_t sub_18849DBE4()
{
  uint64_t v0 = sub_1884CA094();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858](v0);
  OUTLINED_FUNCTION_101();
  sub_1884CA088();
  uint64_t v2 = sub_1884CA070();
  unint64_t v4 = v3;
  uint64_t result = OUTLINED_FUNCTION_78_0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  if (v4 >> 60 == 15)
  {
    __break(1u);
  }

  else
  {
    qword_18C4DE6C0 = v2;
    unk_18C4DE6C8 = v4;
  }

  return result;
}

uint64_t StreamBasedTunnelConnection.send(packets:completion:)( uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a5;
  int v6 = a2;
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    uint64_t v8 = (unint64_t *)(swift_bridgeObjectRetain() + 120);
    do
    {
      uint64_t v9 = *(v8 - 7);
      unint64_t v10 = *(v8 - 6);
      uint64_t v12 = *(v8 - 5);
      unint64_t v11 = *(v8 - 4);
      uint64_t v14 = *(v8 - 3);
      unint64_t v13 = *(v8 - 2);
      uint64_t v15 = *(v8 - 1);
      unint64_t v16 = *v8;
      sub_18841E590(v9, v10);
      sub_18841E590(v12, v11);
      sub_188459598(v14, v13);
      sub_18841E590(v15, v16);
      sub_1884C9764();
      sub_18842A58C(v9, v10);
      sub_18842A58C(v12, v11);
      sub_1884595C4(v14, v13);
      sub_18842A58C(v15, v16);
      v8 += 12;
      --v7;
    }

    while (v7);
    swift_bridgeObjectRelease();
    uint64_t v5 = a5;
    int v6 = a2;
  }

  uint64_t v17 = OUTLINED_FUNCTION_354();
  if ((sub_18849D19C(v17, v18) & 1) != 0)
  {
    v6(0LL);
  }

  else
  {
    uint64_t v19 = *(void (**)(uint64_t))(v5 + 88);
    uint64_t v20 = OUTLINED_FUNCTION_354();
    sub_18841E590(v20, v21);
    uint64_t v22 = OUTLINED_FUNCTION_354();
    v19(v22);
    uint64_t v23 = OUTLINED_FUNCTION_354();
    sub_18842A58C(v23, v24);
  }

  uint64_t v25 = OUTLINED_FUNCTION_354();
  return sub_18842A58C(v25, v26);
}

uint64_t StreamBasedTunnelConnection.receivePackets(completion:)()
{
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 40))(v6, v5);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 64))(v2, v0);
  uint64_t v9 = (void *)OUTLINED_FUNCTION_19_0();
  v9[2] = v2;
  v9[3] = v0;
  v9[4] = v1;
  v9[5] = v4;
  v9[6] = v3;
  swift_unknownObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_54_8(v7, v8, (uint64_t)sub_18849F918, (uint64_t)v9);
  return swift_release();
}

void sub_18849DEB0(id a1, unint64_t a2, char a3, uint64_t a4, void (*a5)(id, uint64_t))
{
  id v6 = a1;
  if ((a3 & 1) != 0)
  {
    id v9 = a1;
    uint64_t v8 = 1LL;
  }

  else
  {
    sub_18841E590((uint64_t)a1, a2);
    sub_18849DF68((uint64_t)&v10);
    sub_188455A4C(v6, a2, 0);
    id v6 = v10;
    uint64_t v8 = v11;
  }

  a5(v6, v8);
  sub_1884298BC(v6, v8);
}

uint64_t sub_18849DF68@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_18849E248((void (*)(uint64_t *__return_ptr, uint64_t *))sub_1884A1700);
  *(void *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

void sub_18849DFB8( uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X5>, void *a6@<X8>)
{
  if (v6) {
    *a5 = v6;
  }
  else {
    *a6 = v9;
  }
}

void sub_18849E00C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  if (v7 >> 60 == 15)
  {
    uint64_t v8 = sub_18841E590(a1, a2);
  }

  else
  {
    uint64_t v9 = v6;
    unint64_t v10 = v7;
    unint64_t v11 = v7;
    sub_18842A484(v6, v7);
    sub_18841E590(a1, a2);
    sub_18849EA8C(a1, a2);
    sub_18842A58C(a1, a2);
    uint64_t v8 = sub_18842A578(v9, v10);
    a2 = v11;
  }

  MEMORY[0x1895F8858](v8);
  __asm { BR              X10 }

uint64_t sub_18849E10C()
{
  if (v3) {
    return swift_bridgeObjectRelease();
  }
  else {
    return *(void *)(v4 - 96);
  }
}

uint64_t sub_18849E248(void (*a1)(uint64_t *__return_ptr, uint64_t *))
{
  return v3;
}

uint64_t sub_18849E2A0(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  if (!a1)
  {
LABEL_35:
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a6 + 48))(40LL, a5, a6);
    return (*(uint64_t (**)(void, unint64_t, uint64_t, uint64_t))(a6 + 24))( 0LL,  0xF000000000000000LL,  a5,  a6);
  }

  uint64_t v9 = a1;
  while (1)
  {
    uint64_t v10 = a2 - v9;
    if (a2 - v9 < 40)
    {
      if (a2 == v9) {
        goto LABEL_35;
      }
      uint64_t result = 40 - v10;
      if (__OFSUB__(40LL, v10)) {
        goto LABEL_41;
      }
      uint64_t v36 = a5;
      uint64_t v35 = a6;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(a6 + 48))(result, a5, a6);
      uint64_t v37 = v9;
LABEL_38:
      uint64_t v38 = sub_18846EB8C(v37, a2);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 24))(v38, v39, v36, v35);
    }

    uint64_t v11 = sub_1884A1740(0LL, a2 - v9, v9, a2);
    uint64_t v49 = a2 - v9;
    else {
      uint64_t v12 = a2 - v9;
    }
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DE9C8);
    *((void *)&v55 + 1) = v13;
    unint64_t v14 = sub_1884A1774();
    unint64_t v56 = v14;
    uint64_t v15 = (void *)swift_allocObject();
    *(void *)&__int128 v54 = v15;
    v15[2] = 0LL;
    v15[3] = v12;
    v15[4] = v9;
    v15[5] = a2;
    __int128 v51 = *(_OWORD *)__swift_project_boxed_opaque_existential_0Tm(&v54, v13);
    sub_1884CA958();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v54);
    uint64_t result = IPv6Header.init(_:)(v52, v53);
    if (v7) {
      return result;
    }
    uint64_t v46 = v58;
    int v47 = v57;
    unint64_t v17 = (unint64_t)v57 + v58;
    if (__OFADD__(v57, v58)) {
      break;
    }
    uint64_t v48 = v9;
    uint64_t v19 = v60;
    unint64_t v18 = v61;
    uint64_t v50 = v62;
    unint64_t v64 = v63;
    if ((uint64_t)v17 > v49)
    {
      sub_18842A58C(v60, v61);
      sub_18842A58C(v50, v64);
      if (a2 == v48) {
        goto LABEL_35;
      }
      uint64_t v36 = a5;
      uint64_t v35 = a6;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(a6 + 48))(v17 - v49, a5, a6);
      uint64_t v37 = v48;
      goto LABEL_38;
    }

    if ((v17 & 0x8000000000000000LL) != 0) {
      goto LABEL_40;
    }
    char v45 = v59;
    if (v11 >= v17) {
      uint64_t v20 = (char *)v57 + v58;
    }
    else {
      uint64_t v20 = (char *)v49;
    }
    if (v11 < 0 || v17 == 0) {
      uint64_t v22 = (char *)v57 + v58;
    }
    else {
      uint64_t v22 = v20;
    }
    uint64_t v60 = v13;
    unint64_t v61 = v14;
    uint64_t v23 = (void *)swift_allocObject();
    uint64_t v57 = v23;
    v23[2] = 0LL;
    v23[3] = v22;
    v23[4] = v48;
    v23[5] = a2;
    unint64_t v24 = (__int128 *)__swift_project_boxed_opaque_existential_0Tm(&v57, v13);
    __int128 v25 = v24[1];
    __int128 v54 = *v24;
    __int128 v55 = v25;
    sub_1884CA958();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v57);
    sub_18841E590(v19, v18);
    unint64_t v26 = v64;
    sub_18841E590(v50, v64);
    sub_18841E590(v19, v18);
    sub_18841E590(v50, v26);
    sub_18841E590(v51, *((unint64_t *)&v51 + 1));
    if (qword_18C4DE4C8 != -1) {
      swift_once();
    }
    if (byte_18C71D060 == 1)
    {
      uint64_t v57 = v47;
      uint64_t v58 = v46;
      char v59 = v45;
      uint64_t v60 = v19;
      unint64_t v61 = v18;
      uint64_t v62 = v50;
      unint64_t v63 = v64;
      sub_188496244((uint64_t)&v57, v51, *((unint64_t *)&v51 + 1), (unint64_t *)&v54);
      unint64_t v27 = *((void *)&v54 + 1);
      uint64_t v44 = v54;
    }

    else
    {
      sub_18842A58C(v51, *((unint64_t *)&v51 + 1));
      sub_18842A58C(v19, v18);
      sub_18842A58C(v50, v64);
      uint64_t v44 = 0LL;
      unint64_t v27 = 0xF000000000000000LL;
    }

    unint64_t v43 = v27;
    uint64_t v28 = *a3;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a3 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_18844D694();
      uint64_t v28 = v33;
      *a3 = v33;
    }

    unint64_t v30 = *(void *)(v28 + 16);
    if (v30 >= *(void *)(v28 + 24) >> 1)
    {
      sub_18844D694();
      uint64_t v28 = v34;
    }

    *(void *)(v28 + 16) = v30 + 1;
    uint64_t v31 = v28 + 96 * v30;
    *(_DWORD *)(v31 + 32) = 30;
    *(void *)(v31 + 40) = v47;
    *(void *)(v31 + 48) = v46;
    *(_BYTE *)(v31 + 56) = v45;
    *(void *)(v31 + 64) = v19;
    *(void *)(v31 + 72) = v18;
    unint64_t v32 = v64;
    *(void *)(v31 + 80) = v50;
    *(void *)(v31 + 88) = v32;
    *(void *)(v31 + 96) = v44;
    *(void *)(v31 + 104) = v43;
    *(_OWORD *)(v31 + 112) = v51;
    *a3 = v28;
    sub_18842A58C(v19, v18);
    sub_18842A58C(v50, v32);
    uint64_t v9 = v48 + v17;
    a2 = v48 + v49;
    uint64_t v7 = 0LL;
    if (!v48) {
      goto LABEL_35;
    }
  }

  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

void StreamBasedTunnelConnection.send(controlMessage:completion:)()
{
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  type metadata accessor for TunnelMessage();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v10);
  OUTLINED_FUNCTION_34();
  uint64_t v13 = v12 - v11;
  sub_188463DE4(v9, v12 - v11);
  sub_1884C959C();
  OUTLINED_FUNCTION_21_5();
  sub_1884C9590();
  sub_1884A1544(&qword_18C4DE508);
  uint64_t v14 = sub_1884C9584();
  unint64_t v16 = v15;
  swift_release();
  sub_18841E590(v14, v16);
  if (OUTLINED_FUNCTION_30_9() >= 0x10000)
  {
    sub_1884CA4D8();
    OUTLINED_FUNCTION_40_8();
    OUTLINED_FUNCTION_30_9();
    OUTLINED_FUNCTION_17_10();
    sub_1884CA7D8();
    OUTLINED_FUNCTION_49_6();
    OUTLINED_FUNCTION_11();
    sub_1884CA0E8();
    sub_18842E9B8();
    sub_1884CA8C8();
    sub_18842FF50();
    unint64_t v17 = (void *)OUTLINED_FUNCTION_3_9();
    sub_1884CA910();
    OUTLINED_FUNCTION_28_8();

    OUTLINED_FUNCTION_17_10();
    sub_18849F924(v13);
LABEL_3:
    OUTLINED_FUNCTION_17();
    return;
  }

  if (qword_18C4DE6D8 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_18C4DE6C0;
  unint64_t v22 = unk_18C4DE6C8;
  sub_18841E590(qword_18C4DE6C0, unk_18C4DE6C8);
  unint64_t v18 = OUTLINED_FUNCTION_30_9();
  if ((v18 & 0x8000000000000000LL) == 0 && v18 < 0x10000)
  {
    uint64_t v20 = v3;
    sub_18849EC2C(bswap32(v18) >> 16);
    if (sub_1884C9758() == 10)
    {
      sub_1884C9764();
      OUTLINED_FUNCTION_17_10();
      uint64_t v19 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 88);
      sub_18841E590(v21, v22);
      v19(v21, v22, v7, v5, v20, v1);
      OUTLINED_FUNCTION_46_7();
      OUTLINED_FUNCTION_17_10();
      sub_18849F924(v13);
      OUTLINED_FUNCTION_46_7();
      goto LABEL_3;
    }

    __break(1u);
  }

  OUTLINED_FUNCTION_3_7();
  sub_1884CA5D4();
  __break(1u);
}

void sub_18849EA8C(uint64_t a1, uint64_t a2)
{
  v3[3] = MEMORY[0x189606D78];
  v3[4] = MEMORY[0x189606D50];
  v3[0] = a1;
  v3[1] = a2;
  uint64_t v2 = (char *)&loc_18849EAE0
     + dword_18849EC1C[__swift_project_boxed_opaque_existential_0Tm(v3, MEMORY[0x189606D78])[1] >> 62];
  __asm { BR              X10 }

uint64_t sub_18849EAF0()
{
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v3);
}

uint64_t sub_18849EC2C(__int16 a1)
{
  void v3[5] = *MEMORY[0x1895F89C0];
  __int16 v2 = a1;
  v3[3] = MEMORY[0x1896181D0];
  v3[4] = MEMORY[0x1896071B8];
  v3[0] = &v2;
  v3[1] = v3;
  __swift_project_boxed_opaque_existential_0Tm(v3, MEMORY[0x1896181D0]);
  sub_1884C96E0();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
}

uint64_t sub_18849ECC4()
{
  return sub_1884C96E0();
}

uint64_t sub_18849ED94( uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *, char *), uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v6 = a1;
  __int16 v7 = a2;
  char v8 = BYTE2(a2);
  char v9 = BYTE3(a2);
  char v10 = BYTE4(a2);
  char v11 = BYTE5(a2);
  return a3(&v6, (char *)&v6 + a5);
}

uint64_t StreamBasedTunnelConnection.receiveControlMessage(completion:)()
{
  uint64_t v5 = (void *)OUTLINED_FUNCTION_19_0();
  v5[2] = v2;
  v5[3] = v0;
  v5[4] = v4;
  v5[5] = v3;
  v5[6] = v1;
  swift_retain();
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_54_8(10LL, 10LL, (uint64_t)sub_18849F98C, (uint64_t)v5);
  return OUTLINED_FUNCTION_18_14();
}

void sub_18849EECC( void *a1, unint64_t a2, char a3, void (*a4)(void *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C4DE9D0);
  MEMORY[0x1895F8858](v15);
  unint64_t v17 = (void *)((char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  if ((a3 & 1) != 0)
  {
    id v21 = a1;
    swift_willThrow();
    unint64_t v22 = a1;
  }

  else
  {
    v24[0] = a6;
    v24[1] = a7;
    v24[2] = a8;
    sub_18841E590((uint64_t)a1, a2);
    if (qword_18C4DE6D8 != -1) {
      swift_once();
    }
    uint64_t v18 = qword_18C4DE6C0;
    unint64_t v19 = unk_18C4DE6C8;
    sub_18841E590(qword_18C4DE6C0, unk_18C4DE6C8);
    char v20 = sub_1884A225C();
    sub_18842A58C(v18, v19);
    if ((v20 & 1) != 0)
    {
      sub_1884C9758();
      __asm { BR              X11 }
    }

    sub_18842E9B8();
    sub_1884CA8C8();
    v24[4] = v24[6];
    v24[5] = v24[7];
    sub_18842FF50();
    unint64_t v22 = (void *)swift_allocError();
    sub_1884CA910();
    swift_willThrow();
    sub_188455A4C(a1, a2, 0);
  }

  *unint64_t v17 = v22;
  swift_storeEnumTagMultiPayload();
  id v23 = v22;
  a4(v17);

  sub_188437B70((uint64_t)v17, (uint64_t *)&unk_18C4DE9D0);
}

void sub_18849F388()
{
  char v3 = v2;
  unint64_t v5 = v4;
  __int16 v7 = v6;
  type metadata accessor for TunnelMessage();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v8);
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C4DE9D0);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v9);
  OUTLINED_FUNCTION_9_0();
  if ((v3 & 1) != 0)
  {
    void *v0 = v7;
    OUTLINED_FUNCTION_43_8();
    id v10 = v7;
    OUTLINED_FUNCTION_28_8();
    sub_188437B70((uint64_t)v0, (uint64_t *)&unk_18C4DE9D0);
  }

  else
  {
    sub_1884C9578();
    OUTLINED_FUNCTION_21_5();
    sub_18841E590((uint64_t)v7, v5);
    sub_1884C956C();
    sub_1884A1544(&qword_18C4DE518);
    sub_1884C9560();
    sub_188463DE4(v1, (uint64_t)v0);
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_28_8();
    swift_release();
    OUTLINED_FUNCTION_32_9();
    sub_188437B70((uint64_t)v0, (uint64_t *)&unk_18C4DE9D0);
    sub_18849F924(v1);
  }

  OUTLINED_FUNCTION_17();
}

void sub_18849F508()
{
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  __int16 v7 = v6;
  id v23 = v8;
  uint64_t v22 = v9;
  if ((v10 & 1) != 0 && v1) {
    sub_1884C9BE4();
  }
  uint64_t v11 = sub_1884C9E18();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1895F8858](v11);
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70F628);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v13);
  OUTLINED_FUNCTION_34();
  uint64_t v16 = v15 - v14;
  sub_1884A17E0(v3, v15 - v14);
  if (__swift_getEnumTagSinglePayload(v16, 1LL, v11) != 1)
  {
    unint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32);
    v17(v0, v16, v11);
    sub_188467EA4(qword_18C70FAA0, (void (*)(uint64_t))MEMORY[0x189608CC8]);
    __int16 v7 = (void *)swift_allocError();
    v17(v18, v0, v11);
    uint64_t v20 = 1LL;
    unint64_t v5 = 0LL;
    goto LABEL_11;
  }

  sub_188437B70(v16, &qword_18C70F628);
  if (v5 >> 60 == 15)
  {
    sub_18842E9B8();
    OUTLINED_FUNCTION_35_5();
    OUTLINED_FUNCTION_26_9();
    __int16 v7 = (void *)OUTLINED_FUNCTION_3_9();
    sub_1884CA910();
    unint64_t v5 = 0LL;
    uint64_t v20 = 1LL;
LABEL_11:
    unint64_t v19 = v23;
    goto LABEL_12;
  }

  sub_18841E590((uint64_t)v7, v5);
  if (OUTLINED_FUNCTION_59_7() >= v22)
  {
    uint64_t v20 = 0LL;
    goto LABEL_11;
  }

  unint64_t v19 = v23;
  sub_1884CA4D8();
  sub_1884CA0E8();
  OUTLINED_FUNCTION_59_7();
  OUTLINED_FUNCTION_41_7();
  sub_1884CA0E8();
  OUTLINED_FUNCTION_179();
  sub_1884CA0E8();
  OUTLINED_FUNCTION_41_7();
  sub_1884CA0E8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_40_8();
  sub_18842E9B8();
  sub_1884CA8C8();
  OUTLINED_FUNCTION_26_9();
  uint64_t v21 = OUTLINED_FUNCTION_3_9();
  sub_1884CA910();
  sub_18842A578((uint64_t)v7, v5);
  unint64_t v5 = 0LL;
  uint64_t v20 = 1LL;
  __int16 v7 = (void *)v21;
LABEL_12:
  v19(v7, v5, v20);
  sub_188455A4C(v7, v5, v20);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_18849F88C()
{
  return swift_deallocObject();
}

unint64_t sub_18849F8B0()
{
  unint64_t result = qword_18C4DE708;
  if (!qword_18C4DE708)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D2BDC, &type metadata for PeerConnectionInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DE708);
  }

  return result;
}

uint64_t sub_18849F8EC()
{
  return swift_deallocObject();
}

uint64_t sub_18849F918(uint64_t a1, uint64_t a2, char a3)
{
  return sub_18849F998( a1,  a2,  a3,  (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void))sub_18849DEB0);
}

uint64_t sub_18849F924(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TunnelMessage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_18849F960()
{
  return swift_deallocObject();
}

uint64_t sub_18849F98C(uint64_t a1, uint64_t a2, char a3)
{
  return sub_18849F998( a1,  a2,  a3,  (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void))sub_18849EECC);
}

uint64_t sub_18849F998( uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t, uint64_t, void, void, void, void, void, void))
{
  return a4(a1, a2, a3 & 1, v4[4], v4[5], v4[6], v4[2], v4[3]);
}

uint64_t sub_18849F9B0()
{
  return 0x10000LL;
}

void sub_18849F9C0()
{
}

uint64_t SocketTunnelConnection.identifier.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_18849F9D4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_18842A484(*a1, v2);
  return sub_18849FA54(v1, v2);
}

void sub_18849FA14()
{
}

uint64_t sub_18849FA54(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 64);
  unint64_t v6 = *(void *)(v2 + 72);
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return sub_18842A578(v5, v6);
}

void sub_18849FAA0()
{
}

uint64_t sub_18849FAD4()
{
  return *(void *)(v0 + 80);
}

void sub_18849FB00(uint64_t a1)
{
  *(void *)(v1 + 80) = a1;
  OUTLINED_FUNCTION_26();
}

void sub_18849FB30()
{
}

uint64_t sub_18849FB64()
{
  return *(void *)(v0 + 88);
}

void sub_18849FB90(uint64_t a1)
{
  *(void *)(v1 + 88) = a1;
  OUTLINED_FUNCTION_26();
}

void sub_18849FBC0()
{
}

uint64_t SocketTunnelConnection.__allocating_init(socket:queue:logPrefix:)()
{
  uint64_t v0 = OUTLINED_FUNCTION_19_0();
  SocketTunnelConnection.init(socket:queue:logPrefix:)();
  return v0;
}

void SocketTunnelConnection.init(socket:queue:logPrefix:)()
{
  uint64_t v1 = (void *)v0;
  unint64_t v3 = v2;
  uint64_t v5 = v4;
  int v7 = v6;
  *(_OWORD *)(v0 + 64) = xmmword_1884CEDF0;
  *(_OWORD *)(v0 + 80) = xmmword_1884D2C30;
  uint64_t v8 = sub_1884CA1F0();
  *(void *)(v8 + 16) = 8LL;
  unint64_t v19 = 8LL;
  uint64_t v20 = 0LL;
  unint64_t v18 = v8 + 32;
  sub_18849D1E8((uint64_t)&v18, &v20, 8LL);
  uint64_t v9 = v20;
  if (v20 <= 8)
  {
    *(void *)(v8 + 16) = v20;
    unint64_t v18 = v8;
    OUTLINED_FUNCTION_18_9();
    OUTLINED_FUNCTION_19_6((unint64_t *)&qword_18C70EA58);
    v1[2] = sub_1884CA148();
    v1[3] = v10;
    if (!v3)
    {
      unint64_t v18 = 0x2074656B636F73LL;
      unint64_t v19 = 0xE700000000000000LL;
      LODWORD(v20) = v7;
      sub_1884CA7D8();
      OUTLINED_FUNCTION_49_6();
      OUTLINED_FUNCTION_11();
      unint64_t v3 = v19;
    }

    unint64_t v18 = 0xD000000000000018LL;
    unint64_t v19 = 0x80000001884E0060LL;
    sub_1884CA0E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_24_4();
    OUTLINED_FUNCTION_11();
    unint64_t v12 = v18;
    unint64_t v11 = v19;
    sub_188437C18(0LL, (unint64_t *)&unk_18C70EB00);
    uint64_t v13 = sub_1884CA28C();
    MEMORY[0x1895F8858](v13);
    OUTLINED_FUNCTION_9_0();
    (*(void (**)(unint64_t, void))(v14 + 104))(v3, *MEMORY[0x18961B850]);
    uint64_t v15 = OUTLINED_FUNCTION_19_0();
    *(void *)(v15 + 16) = v12;
    *(void *)(v15 + 24) = v11;
    *(_DWORD *)(v15 + 32) = v7;
    id v16 = v5;
    swift_bridgeObjectRetain();
    unint64_t v17 = (dispatch_io_s *)sub_1884CA2A4();
    v1[4] = v17;
    dispatch_io_set_low_water(v17, 1uLL);
    v1[5] = v16;
    v1[6] = v12;
    v1[7] = v11;
    OUTLINED_FUNCTION_17();
  }

  else
  {
    __break(1u);
    __break(1u);
    *(void *)(v8 + 16) = v9;
    OUTLINED_FUNCTION_13_3();
    __break(1u);
  }

uint64_t sub_18849FE98(int a1, uint64_t a2, unint64_t a3, int a4)
{
  int v4 = a4;
  if (a1)
  {
    unint64_t v38 = a3;
    unint64_t v40 = (uint64_t *)a2;
    int v42 = a4;
    uint64_t v8 = sub_1884C9554();
    uint64_t v41 = &v35;
    uint64_t v9 = (void (*)(uint64_t))MEMORY[0x189605FC0];
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = *(void *)(v10 + 64);
    MEMORY[0x1895F8858](v8);
    unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v13 = (char *)&v35 - v12;
    uint64_t v14 = sub_1884C9830();
    if ((v14 & 0x100000000LL) != 0) {
      int v15 = 5;
    }
    else {
      int v15 = v14;
    }
    LODWORD(v44) = v15;
    sub_18842FE04(MEMORY[0x18961AFE8]);
    sub_188467EA4(qword_18C70EB10, v9);
    sub_1884C9608();
    uint64_t v16 = sub_1884CA25C();
    os_log_type_t v17 = v16;
    if (qword_18C70D730 != -1) {
      uint64_t v16 = swift_once();
    }
    unint64_t v18 = (os_log_s *)qword_18C70F908;
    MEMORY[0x1895F8858](v16);
    unint64_t v19 = (char *)&v35 - v12;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)&v35 - v12, (char *)&v35 - v12, v8);
    os_log_t v39 = v18;
    if (os_log_type_enabled(v18, v17))
    {
      unint64_t v20 = v38;
      swift_bridgeObjectRetain_n();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v44 = v37;
      *(_DWORD *)uint64_t v21 = 136315650;
      uint64_t v36 = v10;
      swift_bridgeObjectRetain();
      sub_18844EF4C((uint64_t)v40, v20, &v44);
      uint64_t v43 = v22;
      unint64_t v40 = &v35;
      sub_1884CA430();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 12) = 1024;
      LODWORD(v43) = a1;
      sub_1884CA430();
      *(_WORD *)(v21 + 18) = 2080;
      sub_188467EA4(&qword_18C70F900, (void (*)(uint64_t))MEMORY[0x189605FC0]);
      uint64_t v23 = sub_1884CA8B0();
      sub_18844EF4C(v23, v24, &v44);
      uint64_t v43 = v25;
      sub_1884CA430();
      swift_bridgeObjectRelease();
      unint64_t v26 = *(void (**)(char *, uint64_t))(v36 + 8);
      v26(v19, v8);
      _os_log_impl(&dword_18840C000, v39, v17, "%s: IO cleanup error: %d, %s", (uint8_t *)v21, 0x1Cu);
      uint64_t v27 = v37;
      swift_arrayDestroy();
      MEMORY[0x1895C7BD0](v27, -1LL, -1LL);
      MEMORY[0x1895C7BD0](v21, -1LL, -1LL);
      v26(v13, v8);
    }

    else
    {
      uint64_t v33 = *(void (**)(char *, uint64_t))(v10 + 8);
      v33((char *)&v35 - v12, v8);
      v33((char *)&v35 - v12, v8);
    }

    int v4 = v42;
  }

  else
  {
    os_log_type_t v28 = sub_1884CA244();
    if (qword_18C70D730 != -1) {
      swift_once();
    }
    uint64_t v29 = (os_log_s *)qword_18C70F908;
    if (os_log_type_enabled((os_log_t)qword_18C70F908, v28))
    {
      swift_bridgeObjectRetain_n();
      unint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v44 = v31;
      *(_DWORD *)unint64_t v30 = 136315138;
      swift_bridgeObjectRetain();
      sub_18844EF4C(a2, a3, &v44);
      uint64_t v43 = v32;
      sub_1884CA430();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_18840C000, v29, v28, "%s: IO cleanup done", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895C7BD0](v31, -1LL, -1LL);
      MEMORY[0x1895C7BD0](v30, -1LL, -1LL);
    }
  }

  return close(v4);
}

void sub_1884A0324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_1884A0330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_1884A033C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, void, uint64_t, uint64_t))
{
}

void sub_1884A0368()
{
  if (qword_18C70D730 != -1) {
    swift_once();
  }
  uint64_t v0 = (os_log_s *)qword_18C70F908;
  if (OUTLINED_FUNCTION_16_11())
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_7_12();
    uint64_t v4 = OUTLINED_FUNCTION_8_13();
    uint64_t v1 = OUTLINED_FUNCTION_4_19(4.8149e-34);
    OUTLINED_FUNCTION_13_15(v1, v2, &v4);
    OUTLINED_FUNCTION_85_0();
    OUTLINED_FUNCTION_98();
    OUTLINED_FUNCTION_179();
    OUTLINED_FUNCTION_6_16(&dword_18840C000, v0, v3, "%s: receiving a datagram socket connection");
    OUTLINED_FUNCTION_5_16();
    OUTLINED_FUNCTION_0_11();
  }

  sub_1884CA4D8();
  OUTLINED_FUNCTION_36_6();
  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_40_8();
  OUTLINED_FUNCTION_25_10();
  __break(1u);
}

void sub_1884A04A4()
{
  uint64_t v0 = (_DWORD *)sub_1884CA274();
  if (qword_18C70D730 != -1) {
    swift_once();
  }
  uint64_t v1 = (os_log_s *)qword_18C70F908;
  if (os_log_type_enabled((os_log_t)qword_18C70F908, (os_log_type_t)v0))
  {
    swift_retain();
    OUTLINED_FUNCTION_7_12();
    uint64_t v9 = OUTLINED_FUNCTION_8_13();
    _DWORD *v0 = 136315138;
    uint64_t v2 = swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_13_15(v2, v3, &v9);
    OUTLINED_FUNCTION_14_10(v4);
    swift_release();
    OUTLINED_FUNCTION_179();
    OUTLINED_FUNCTION_6_16(&dword_18840C000, v1, v5, "%s: closing IO on cancel()");
    OUTLINED_FUNCTION_5_16();
    OUTLINED_FUNCTION_0_11();
  }

  uint64_t v6 = sub_1884CA280();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_101();
  uint64_t v9 = MEMORY[0x18961AFE8];
  sub_188467EA4(qword_18C70EAC0, v8);
  OUTLINED_FUNCTION_18_9();
  OUTLINED_FUNCTION_19_6((unint64_t *)&unk_18C70EAD0);
  sub_1884CA484();
  sub_1884CA2BC();
  OUTLINED_FUNCTION_78_0(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  OUTLINED_FUNCTION_17();
}

void sub_1884A0640()
{
  if (qword_18C70D730 != -1) {
    swift_once();
  }
  uint64_t v0 = (os_log_s *)qword_18C70F908;
  if (OUTLINED_FUNCTION_16_11())
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_7_12();
    uint64_t v4 = OUTLINED_FUNCTION_8_13();
    uint64_t v1 = OUTLINED_FUNCTION_4_19(4.8149e-34);
    OUTLINED_FUNCTION_13_15(v1, v2, &v4);
    OUTLINED_FUNCTION_85_0();
    OUTLINED_FUNCTION_98();
    OUTLINED_FUNCTION_179();
    OUTLINED_FUNCTION_6_16(&dword_18840C000, v0, v3, "%s: starting a QUIC based socket connection");
    OUTLINED_FUNCTION_5_16();
    OUTLINED_FUNCTION_0_11();
  }

  sub_1884CA4D8();
  OUTLINED_FUNCTION_36_6();
  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_40_8();
  OUTLINED_FUNCTION_25_10();
  __break(1u);
}

void SocketTunnelConnection.deinit()
{
  uint64_t v1 = v0;
  sub_1884CA274();
  if (qword_18C70D730 != -1) {
    swift_once();
  }
  uint64_t v2 = (os_log_s *)qword_18C70F908;
  if (OUTLINED_FUNCTION_16_11())
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_7_12();
    uint64_t v13 = OUTLINED_FUNCTION_8_13();
    uint64_t v3 = OUTLINED_FUNCTION_4_19(4.8149e-34);
    OUTLINED_FUNCTION_13_15(v3, v4, &v13);
    OUTLINED_FUNCTION_14_10(v5);
    OUTLINED_FUNCTION_98();
    OUTLINED_FUNCTION_179();
    OUTLINED_FUNCTION_6_16(&dword_18840C000, v2, v6, "%s: closing IO on deinit");
    OUTLINED_FUNCTION_5_16();
    OUTLINED_FUNCTION_0_11();
  }

  uint64_t v7 = sub_1884CA280();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  OUTLINED_FUNCTION_34();
  uint64_t v11 = v10 - v9;
  uint64_t v13 = MEMORY[0x18961AFE8];
  sub_188467EA4(qword_18C70EAC0, v12);
  OUTLINED_FUNCTION_18_9();
  OUTLINED_FUNCTION_19_6((unint64_t *)&unk_18C70EAD0);
  sub_1884CA484();
  sub_1884CA2BC();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_18842A578(*(void *)(v1 + 64), *(void *)(v1 + 72));
  OUTLINED_FUNCTION_17();
}

uint64_t SocketTunnelConnection.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t (*sub_1884A0960())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_1884A09A4())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_1884A09E8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1884A0A2C@<X0>(void *a1@<X8>)
{
  return SocketTunnelConnection.identifier.getter(a1);
}

uint64_t sub_1884A0A4C(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  return StreamBasedTunnelConnection.send(packets:completion:)( a1,  a2,  a3,  a4,  (uint64_t)&protocol witness table for SocketTunnelConnection);
}

void sub_1884A0A74()
{
}

uint64_t sub_1884A0A9C()
{
  return StreamBasedTunnelConnection.receivePackets(completion:)();
}

uint64_t sub_1884A0AC4()
{
  return StreamBasedTunnelConnection.receiveControlMessage(completion:)();
}

void sub_1884A0AEC()
{
}

void sub_1884A0B0C()
{
}

uint64_t sub_1884A0B20()
{
  return sub_18849F9B0() & 0x1FFFF;
}

void sub_1884A0B40(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
}

void sub_1884A0B64()
{
}

void sub_1884A0B88()
{
}

void sub_1884A0BAC()
{
}

uint64_t sub_1884A0BD0()
{
  return swift_deallocObject();
}

uint64_t sub_1884A0BF4(int a1)
{
  return sub_18849FE98(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(_DWORD *)(v1 + 32));
}

unint64_t sub_1884A0C04()
{
  unint64_t result = qword_18C70F930;
  if (!qword_18C70F930)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for TransportProtocolType,  &type metadata for TransportProtocolType);
    atomic_store(result, (unint64_t *)&qword_18C70F930);
  }

  return result;
}

unint64_t sub_1884A0C44()
{
  unint64_t result = qword_18C70F938;
  if (!qword_18C70F938)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for TunnelConnectionState,  &type metadata for TunnelConnectionState);
    atomic_store(result, (unint64_t *)&qword_18C70F938);
  }

  return result;
}

void sub_1884A0C80(void *a1@<X8>)
{
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_1_0();
}

void sub_1884A0CA8(uint64_t *a1@<X8>)
{
  *a1 = sub_18849FAD4();
  OUTLINED_FUNCTION_1_0();
}

void sub_1884A0CCC(uint64_t *a1)
{
}

void sub_1884A0CEC(uint64_t *a1@<X8>)
{
  *a1 = sub_18849FB64();
  OUTLINED_FUNCTION_1_0();
}

void sub_1884A0D10(uint64_t *a1)
{
}

uint64_t storeEnumTagSinglePayload for TransportProtocolType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_1884A0D7C + 4 * byte_1884D2769[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1884A0DB0 + 4 * byte_1884D2764[v4]))();
}

uint64_t sub_1884A0DB0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884A0DB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1884A0DC0LL);
  }
  return result;
}

uint64_t sub_1884A0DCC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1884A0DD4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1884A0DD8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884A0DE0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for TransportProtocolType()
{
}

uint64_t sub_1884A0DF8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 0x2000000000000000LL) != 0) {
    return sub_18841E590(a1, a2);
  }
  sub_18841E590(a1, a2);
  sub_18841E590(a3, a4);
  return swift_unknownObjectRetain();
}

uint64_t destroy for NetworkParamsType(uint64_t a1)
{
  return sub_1884A0E54(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_1884A0E54(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 0x2000000000000000LL) != 0) {
    return sub_18842A58C(a1, a2);
  }
  sub_18842A58C(a1, a2);
  sub_18842A58C(a3, a4);
  return swift_unknownObjectRelease();
}

uint64_t *initializeWithCopy for NetworkParamsType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  sub_1884A0DF8(*a2, v4, v5, v6);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  return a1;
}

uint64_t *assignWithCopy for NetworkParamsType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  sub_1884A0DF8(*a2, v4, v5, v6);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  sub_1884A0E54(v8, v9, v10, v11);
  return a1;
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

uint64_t *assignWithTake for NetworkParamsType(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  uint64_t v4 = *a1;
  unint64_t v6 = a1[1];
  uint64_t v5 = a1[2];
  unint64_t v7 = a1[3];
  __int128 v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v8;
  a1[4] = v3;
  sub_1884A0E54(v4, v6, v5, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkParamsType(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xF && *(_BYTE *)(a1 + 40))
    {
      unsigned int v2 = *(_DWORD *)a1 + 14;
    }

    else
    {
      unsigned int v2 = (((*(void *)(a1 + 24) >> 58) >> 3) & 1 | (2
                                                                   * ((*(void *)(a1 + 24) >> 58) & 4 | (*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xE) {
        unsigned int v2 = -1;
      }
    }
  }

  else
  {
    unsigned int v2 = -1;
  }

  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for NetworkParamsType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 15;
    if (a3 >= 0xF) {
      *(_BYTE *)(result + 40) = 1;
    }
  }

  else
  {
    if (a3 >= 0xF) {
      *(_BYTE *)(result + 40) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0LL;
      *(void *)(result + 8) = (unint64_t)((-a2 >> 1) & 3) << 60;
      *(void *)(result + 16) = 0LL;
      *(void *)(result + 24) = ((unint64_t)((-a2 >> 1) & 7 | (8 * (-a2 & 0xF))) << 58) & 0x3000000000000000LL;
      *(void *)(result + 32) = 0LL;
    }
  }

  return result;
}

uint64_t sub_1884A1088(uint64_t a1)
{
  return (*(void *)(a1 + 24) >> 61) & 1LL;
}

uint64_t sub_1884A1094(uint64_t result)
{
  *(void *)(result + 24) &= ~0x2000000000000000uLL;
  return result;
}

uint64_t sub_1884A10A4(uint64_t result, char a2)
{
  unint64_t v2 = *(void *)(result + 24) & 0xCFFFFFFFFFFFFFFFLL | ((unint64_t)(a2 & 1) << 61);
  *(void *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  *(void *)(result + 24) = v2;
  return result;
}

void type metadata accessor for NetworkParamsType()
{
}

void type metadata accessor for TunnelConnectionState()
{
}

void sub_1884A10E8(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_1_0();
}

uint64_t assignWithCopy for PeerConnectionInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PeerConnectionInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for PeerConnectionInfo()
{
}

void type metadata accessor for TunnelConnectionIdentifierCategory()
{
}

uint64_t dispatch thunk of TunnelConnection.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TunnelConnection.send(packets:completion:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of TunnelConnection.send(controlMessage:completion:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of TunnelConnection.receivePackets(completion:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of TunnelConnection.receiveControlMessage(completion:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of TunnelConnection.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of TunnelConnection.start(on:reportingTunnelStateChangesWith:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of TunnelConnection.maxSupportedMTU.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))() & 0x1FFFF;
}

uint64_t dispatch thunk of TunnelConnection.physicalInterfaceName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._partialReceivedPacket.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._partialReceivedPacket.setter( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._partialReceivedPacket.modify( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._nextMinReceiveLength.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._nextMinReceiveLength.setter( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._nextMinReceiveLength.modify( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._maxReceiveLength.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._maxReceiveLength.setter( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._maxReceiveLength.modify( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection.send(content:completion:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 88))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection.receive(minLength:maxLength:completion:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 96))();
}

uint64_t type metadata accessor for SocketTunnelConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for SocketTunnelConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SocketTunnelConnection.maxSupportedMTU.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))() & 0x1FFFF;
}

uint64_t dispatch thunk of SocketTunnelConnection.physicalInterfaceName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection._partialReceivedPacket.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection._partialReceivedPacket.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection._partialReceivedPacket.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection._nextMinReceiveLength.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection._nextMinReceiveLength.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection._nextMinReceiveLength.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection._maxReceiveLength.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection._maxReceiveLength.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection._maxReceiveLength.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection.__allocating_init(socket:queue:logPrefix:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of SocketTunnelConnection.send(content:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection.receive(minLength:maxLength:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection.receive(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256LL))();
}

uint64_t dispatch thunk of SocketTunnelConnection.start(on:reportingTunnelStateChangesWith:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264LL))();
}

uint64_t _s19RemotePairingDevice21TunnelConnectionStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1884A13C8 + 4 * byte_1884D2773[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1884A13FC + 4 * byte_1884D276E[v4]))();
}

uint64_t sub_1884A13FC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884A1404(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1884A140CLL);
  }
  return result;
}

uint64_t sub_1884A1418(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1884A1420LL);
  }
  *(_BYTE *)__n128 result = a2 + 1;
  return result;
}

uint64_t sub_1884A1424(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884A142C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PeerConnectionInfo.CodingKeys()
{
  return &type metadata for PeerConnectionInfo.CodingKeys;
}

unint64_t sub_1884A144C()
{
  unint64_t result = qword_18C70FA90;
  if (!qword_18C70FA90)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D2BB4, &type metadata for PeerConnectionInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FA90);
  }

  return result;
}

unint64_t sub_1884A148C()
{
  unint64_t result = qword_18C4DE718;
  if (!qword_18C4DE718)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D2B24, &type metadata for PeerConnectionInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DE718);
  }

  return result;
}

unint64_t sub_1884A14CC()
{
  unint64_t result = qword_18C4DE710;
  if (!qword_18C4DE710)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D2B4C, &type metadata for PeerConnectionInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DE710);
  }

  return result;
}

unint64_t sub_1884A1508()
{
  unint64_t result = qword_18C4DDED8;
  if (!qword_18C4DDED8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for TransportProtocolType,  &type metadata for TransportProtocolType);
    atomic_store(result, (unint64_t *)&qword_18C4DDED8);
  }

  return result;
}

void sub_1884A1544(void *a1)
{
  if (!*a1)
  {
    type metadata accessor for TunnelMessage();
    OUTLINED_FUNCTION_123();
  }

  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_1884A1578(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1884C95C0();
  if (!result || (uint64_t result = sub_1884C95E4(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1884C95D8();
      return sub_1884C96E0();
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_1884A1608(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t result = sub_1884C95C0();
  uint64_t v7 = result;
  if (result)
  {
    uint64_t result = sub_1884C95E4();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }

    v7 += a1 - result;
  }

  BOOL v8 = __OFSUB__(a2, a1);
  uint64_t v9 = a2 - a1;
  if (v8)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v10 = sub_1884C95D8();
  if (v10 >= v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = v7 + v11;
  if (v7) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0LL;
  }
  return a3(v7, v13);
}

uint64_t sub_1884A16A8()
{
  return swift_deallocObject();
}

void sub_1884A16CC()
{
}

uint64_t sub_1884A16D8()
{
  return sub_1884C96E0();
}

void sub_1884A1700(void *a1@<X0>, void *a2@<X8>)
{
}

uint64_t sub_1884A1724(uint64_t a1, uint64_t a2)
{
  return sub_18849E2A0(a1, a2, *(uint64_t **)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1884A1740(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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

unint64_t sub_1884A1774()
{
  unint64_t result = qword_18C4DE9C0;
  if (!qword_18C4DE9C0)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C4DE9C8);
    uint64_t v2 = MEMORY[0x1896071B8];
    unint64_t result = MEMORY[0x1895C7AEC](MEMORY[0x189607410], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_18C4DE9C0);
  }

  return result;
}

uint64_t sub_1884A17D0()
{
  return swift_deallocObject();
}

uint64_t sub_1884A17E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C70F628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_4_19(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_5_16()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_6_16(void *a1, os_log_s *a2, uint64_t a3, const char *a4)
{
}

uint64_t OUTLINED_FUNCTION_7_12()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_8_13()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_13_15(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

uint64_t OUTLINED_FUNCTION_14_10(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1884CA430();
}

BOOL OUTLINED_FUNCTION_16_11()
{
  return os_log_type_enabled(v0, v1);
}

uint64_t OUTLINED_FUNCTION_17_10()
{
  return sub_18842A58C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_18_14()
{
  return swift_release();
}

  ;
}

uint64_t OUTLINED_FUNCTION_25_10()
{
  return sub_1884CA5E0();
}

unint64_t OUTLINED_FUNCTION_26_9()
{
  uint64_t v1 = *(void *)(v0 - 88);
  *(void *)(v0 - 112) = *(void *)(v0 - 96);
  *(void *)(v0 - 104) = v1;
  return sub_18842FF50();
}

uint64_t OUTLINED_FUNCTION_28_8()
{
  return v0();
}

uint64_t OUTLINED_FUNCTION_30_9()
{
  return sub_1884C9758();
}

void OUTLINED_FUNCTION_32_9()
{
}

uint64_t OUTLINED_FUNCTION_35_5()
{
  return sub_1884CA8C8();
}

uint64_t OUTLINED_FUNCTION_36_6()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_39_5()
{
}

uint64_t OUTLINED_FUNCTION_40_8()
{
  return sub_1884CA0E8();
}

uint64_t OUTLINED_FUNCTION_41_7()
{
  return sub_1884CA7D8();
}

uint64_t OUTLINED_FUNCTION_43_8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_46_7()
{
  return sub_18842A58C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_49_6()
{
  return sub_1884CA0E8();
}

uint64_t OUTLINED_FUNCTION_54_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return v6(a1, a2, a3, a4, v5, v4);
}

uint64_t OUTLINED_FUNCTION_59_7()
{
  return sub_1884C9758();
}

uint64_t sub_1884A19B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  OUTLINED_FUNCTION_2_3();
  v3(a2);
  return swift_release();
}

uint64_t sub_1884A19EC(uint64_t a1, void (*a2)(void *))
{
  uint64_t v4 = type metadata accessor for TunnelMessage();
  MEMORY[0x1895F8858](v4);
  unint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_188463DE4(a1, (uint64_t)v6);
  sub_1884C959C();
  swift_allocObject();
  sub_1884C9590();
  sub_1884AA200();
  uint64_t v7 = sub_1884C9584();
  unint64_t v9 = v8;
  swift_release();
  sub_18841E590(v7, v9);
  if (sub_1884C9758() >= 0x10000)
  {
    uint64_t v17 = 0LL;
    unint64_t v18 = 0xE000000000000000LL;
    sub_1884CA4D8();
    sub_1884CA0E8();
    uint64_t v10 = sub_1884C9758();
    sub_18842A58C(v7, v9);
    v16[0] = v10;
    sub_1884CA7D8();
    sub_1884CA0E8();
    swift_bridgeObjectRelease();
    sub_1884CA0E8();
    sub_18842E9B8();
    sub_1884CA8C8();
    v16[0] = v17;
    v16[1] = v18;
    sub_18842FF50();
    uint64_t v11 = (void *)swift_allocError();
    sub_1884CA910();
    a2(v11);

    sub_18842A58C(v7, v9);
    return sub_18849F924((uint64_t)v6);
  }

  if (qword_18C4DE6D8 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_18C4DE6C0;
  unint64_t v18 = unk_18C4DE6C8;
  sub_18841E590(qword_18C4DE6C0, unk_18C4DE6C8);
  unint64_t v13 = sub_1884C9758();
  if ((v13 & 0x8000000000000000LL) == 0 && v13 < 0x10000)
  {
    sub_18849EC2C(bswap32(v13) >> 16);
    if (sub_1884C9758() == 10)
    {
      sub_1884C9764();
      sub_18842A58C(v7, v9);
      uint64_t v14 = v17;
      unint64_t v15 = v18;
      sub_18841E590(v17, v18);
      sub_1884A3064();
      sub_18842A58C(v14, v15);
      sub_18842A58C(v7, v9);
      sub_18849F924((uint64_t)v6);
      return sub_18842A58C(v14, v15);
    }

    __break(1u);
  }

  uint64_t result = sub_1884CA5D4();
  __break(1u);
  return result;
}

void sub_1884A1DB8( void *a1, unint64_t a2, char a3, void (*a4)(void *), uint64_t a5, uint64_t a6)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C4DE9D0);
  MEMORY[0x1895F8858](v11);
  unint64_t v13 = (void *)((char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  if ((a3 & 1) != 0)
  {
    id v17 = a1;
    swift_willThrow();
    unint64_t v18 = a1;
  }

  else
  {
    v20[0] = a6;
    sub_18841E590((uint64_t)a1, a2);
    if (qword_18C4DE6D8 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_18C4DE6C0;
    unint64_t v15 = unk_18C4DE6C8;
    sub_18841E590(qword_18C4DE6C0, unk_18C4DE6C8);
    char v16 = sub_1884A225C();
    sub_18842A58C(v14, v15);
    if ((v16 & 1) != 0)
    {
      sub_1884C9758();
      __asm { BR              X11 }
    }

    sub_18842E9B8();
    sub_1884CA8C8();
    v20[2] = v20[4];
    v20[3] = v20[5];
    sub_18842FF50();
    unint64_t v18 = (void *)swift_allocError();
    sub_1884CA910();
    swift_willThrow();
    sub_188455A4C(a1, a2, 0);
  }

  *unint64_t v13 = v18;
  swift_storeEnumTagMultiPayload();
  id v19 = v18;
  a4(v13);

  sub_188437B70((uint64_t)v13, (uint64_t *)&unk_18C4DE9D0);
}

uint64_t sub_1884A225C()
{
  uint64_t v17 = v0;
  uint64_t v18 = v1;
  unint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_1884C9770();
  uint64_t v11 = (uint64_t (*)(uint64_t))MEMORY[0x189606D10];
  uint64_t v12 = *(void *)(*(void *)(v10 - 8) + 64LL);
  MEMORY[0x1895F8858](v10);
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  sub_18841E590(v9, v7);
  sub_1884C9698();
  uint64_t v14 = sub_18842A58C(v9, v7);
  MEMORY[0x1895F8858](v14);
  sub_18841E590(v5, v3);
  sub_1884C9698();
  sub_18842A58C(v5, v3);
  sub_18841729C(&qword_18C4DC680, v11, MEMORY[0x189606D18]);
  while (1)
  {
    OUTLINED_FUNCTION_43_9();
    if ((v16[15] & 1) != 0)
    {
      OUTLINED_FUNCTION_35_6((uint64_t)&v16[-v13]);
      OUTLINED_FUNCTION_43_9();
      OUTLINED_FUNCTION_35_6((uint64_t)&v16[-v13]);
      return v16[13];
    }

    OUTLINED_FUNCTION_43_9();
    if ((v16[11] & 1) != 0) {
      break;
    }
    if (v16[14] != v16[10])
    {
      OUTLINED_FUNCTION_59_8((uint64_t)&v16[-v13]);
      OUTLINED_FUNCTION_59_8((uint64_t)&v16[-v13]);
      return 0LL;
    }
  }

  OUTLINED_FUNCTION_59_8((uint64_t)&v16[-v13]);
  OUTLINED_FUNCTION_59_8((uint64_t)&v16[-v13]);
  return 1LL;
}

uint64_t sub_1884A2400()
{
  uint64_t result = sub_1884CA400();
  qword_18C70FAB0 = result;
  return result;
}

void sub_1884A2478()
{
  uint64_t v4 = v1;
  uint64_t v5 = sub_1884C9E0C();
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_12_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70F450);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v7);
  OUTLINED_FUNCTION_100();
  sub_1884C9BCC();
  uint64_t EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v0, 1LL, v5);
  if ((_DWORD)EnumTagSinglePayload == 1)
  {
    OUTLINED_FUNCTION_94_2(EnumTagSinglePayload, &qword_18C70F450);
    sub_1884CA268();
    if (qword_18C70D740 != -1) {
      goto LABEL_31;
    }
    goto LABEL_3;
  }

  uint64_t v74 = v5;
  v75 = v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v3, v0, v5);
  uint64_t v17 = v3;
  uint64_t v18 = sub_1884C9E00();
  uint64_t v91 = MEMORY[0x18961AFE8];
  uint64_t v80 = *(void *)(v18 + 16);
  uint64_t v19 = sub_1884C9B90();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1895F8858](v19);
  uint64_t v90 = v21;
  OUTLINED_FUNCTION_84_1();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70EAE0);
  uint64_t v4 = &v73;
  OUTLINED_FUNCTION_28_9();
  MEMORY[0x1895F8858](v22);
  OUTLINED_FUNCTION_49_7();
  uint64_t v78 = v3;
  uint64_t v79 = v2;
  if (!v23)
  {
LABEL_20:
    OUTLINED_FUNCTION_316(v0, 1LL);
LABEL_21:
    uint64_t v48 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_94_2(v48, (uint64_t *)&unk_18C70EAE0);
    uint64_t v50 = MEMORY[0x1895F8858](v49);
    OUTLINED_FUNCTION_19_10(v50, v51, v52, v53, v54, v55, v56, v57, v73);
    OUTLINED_FUNCTION_98();
    if (__swift_getEnumTagSinglePayload(v17, 1LL, v19) == 1)
    {
      sub_188437B70(v17, (uint64_t *)&unk_18C70EAE0);
      uint64_t v58 = 0LL;
      uint64_t v59 = 0LL;
    }

    else
    {
      uint64_t v58 = sub_1884C9B6C();
      uint64_t v59 = v60;
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v17, v19);
    }

    sub_1884CA244();
    if (qword_18C70D740 != -1) {
      swift_once();
    }
    unint64_t v61 = v75;
    OUTLINED_FUNCTION_20_2();
    if (OUTLINED_FUNCTION_81_0())
    {
      OUTLINED_FUNCTION_89_2();
      OUTLINED_FUNCTION_20_2();
      uint64_t v62 = OUTLINED_FUNCTION_4_7();
      uint64_t v90 = OUTLINED_FUNCTION_4_7();
      v93[0] = v90;
      *(_DWORD *)uint64_t v62 = 136446722;
      uint64_t v63 = v61[2];
      OUTLINED_FUNCTION_30_10();
      OUTLINED_FUNCTION_82_3(v63, v64, v93);
      OUTLINED_FUNCTION_38_8(v65);
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_179();
      *(_WORD *)(v62 + 12) = 2080;
      OUTLINED_FUNCTION_68_5();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_83_4();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_18_15(v91, v66, v93);
      OUTLINED_FUNCTION_38_8(v67);
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_13_3();
      *(_WORD *)(v62 + 22) = 2080;
      uint64_t v91 = v58;
      uint64_t v92 = v59;
      OUTLINED_FUNCTION_29_2();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70E500);
      uint64_t v68 = sub_1884CA0A0();
      sub_18844EF4C(v68, v69, v93);
      uint64_t v91 = v70;
      sub_1884CA430();
      OUTLINED_FUNCTION_88_3();
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_42_6(&dword_18840C000, v71, v72, "%{public}s/%s: Tunnel connection path interface name: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_11();
    }

    OUTLINED_FUNCTION_12_2();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v74);
    goto LABEL_29;
  }

  unint64_t v24 = 0LL;
  uint64_t v76 = v20;
  uint64_t v77 = v18;
  while (v24 < *(void *)(v18 + 16))
  {
    unint64_t v87 = v24;
    v88 = &v73;
    unint64_t v84 = (*(unsigned __int8 *)(v20 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    uint64_t v83 = *(void *)(v20 + 72);
    uint64_t v25 = *(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 16);
    v25(v0, v18 + v84 + v83 * v24, v19);
    OUTLINED_FUNCTION_316(v0, 0LL);
    v89 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32);
    v89(v5, v0, v19);
    unint64_t v26 = (uint64_t (*)(char *, uint64_t))sub_1884C9B60();
    v86 = &v73;
    uint64_t v27 = v19;
    uint64_t v28 = *((void *)v26 - 1);
    uint64_t v29 = *(void *)(v28 + 64);
    MEMORY[0x1895F8858](v26);
    unint64_t v30 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v31 = sub_1884C9B78();
    v85 = &v73;
    MEMORY[0x1895F8858](v31);
    uint64_t v32 = *MEMORY[0x1896088F8];
    v82 = *(void (**)(char *, uint64_t, uint64_t (*)(char *, uint64_t)))(v28 + 104);
    v82((char *)&v73 - v30, v32, v26);
    sub_18841729C(&qword_18C70FAB8, (uint64_t (*)(uint64_t))MEMORY[0x189608908], MEMORY[0x189608910]);
    uint64_t v81 = v33;
    char v34 = sub_1884CA034();
    OUTLINED_FUNCTION_35_6((uint64_t)&v73 - v30);
    uint64_t v35 = OUTLINED_FUNCTION_35_6((uint64_t)&v73 - v30);
    MEMORY[0x1895F8858](v35);
    uint64_t v37 = (char *)&v73 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v86 = (uint64_t *)v5;
    uint64_t v38 = v5;
    uint64_t v5 = v27;
    uint64_t v39 = ((uint64_t (*)(char *, uint64_t, uint64_t))v25)(v37, v38, v27);
    if ((v34 & 1) == 0)
    {
      uint64_t v20 = v76;
      uint64_t v41 = (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v37, v27);
      uint64_t v2 = v79;
      uint64_t v19 = v5;
LABEL_14:
      MEMORY[0x1895F8858](v41);
      OUTLINED_FUNCTION_33_7();
      OUTLINED_FUNCTION_100_2((uint64_t)v26, (uint64_t)v86);
      uint64_t v17 = v91;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v3 = v78;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        OUTLINED_FUNCTION_52_8(0LL, *(void *)(v17 + 16) + 1LL);
        uint64_t v17 = v91;
      }

      unint64_t v45 = *(void *)(v17 + 16);
      unint64_t v44 = *(void *)(v17 + 24);
      uint64_t v5 = v45 + 1;
      if (v45 >= v44 >> 1)
      {
        OUTLINED_FUNCTION_52_8(v44 > 1, v45 + 1);
        uint64_t v17 = v91;
      }

      *(void *)(v17 + 16) = v5;
      uint64_t v42 = OUTLINED_FUNCTION_100_2(v17 + v84 + v45 * v83, (uint64_t)v26);
      uint64_t v91 = v17;
      goto LABEL_19;
    }

    MEMORY[0x1895F8858](v39);
    v85 = &v73;
    uint64_t v40 = sub_1884C9B78();
    MEMORY[0x1895F8858](v40);
    v82((char *)&v73 - v30, *MEMORY[0x189608900], v26);
    uint64_t v17 = sub_1884CA034();
    OUTLINED_FUNCTION_35_6((uint64_t)&v73 - v30);
    OUTLINED_FUNCTION_35_6((uint64_t)&v73 - v30);
    uint64_t v20 = v76;
    unint64_t v26 = *(uint64_t (**)(char *, uint64_t))(v76 + 8);
    uint64_t v41 = v26(v37, v27);
    uint64_t v2 = v79;
    uint64_t v19 = v5;
    if ((v17 & 1) == 0) {
      goto LABEL_14;
    }
    uint64_t v42 = v26((char *)v86, v5);
    uint64_t v3 = v78;
LABEL_19:
    uint64_t v18 = v77;
    uint64_t v0 = v87 + 1;
    MEMORY[0x1895F8858](v42);
    OUTLINED_FUNCTION_84_1();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70EAE0);
    uint64_t v4 = &v73;
    OUTLINED_FUNCTION_28_9();
    MEMORY[0x1895F8858](v46);
    OUTLINED_FUNCTION_49_7();
    if (v47 == v24) {
      goto LABEL_20;
    }
  }

  __break(1u);
LABEL_31:
  swift_once();
LABEL_3:
  uint64_t v9 = (os_log_s *)qword_18C70FAB0;
  if (OUTLINED_FUNCTION_75_2())
  {
    OUTLINED_FUNCTION_20_2();
    uint64_t v10 = v4;
    uint64_t v11 = OUTLINED_FUNCTION_4_7();
    v93[0] = OUTLINED_FUNCTION_4_7();
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v12 = v10[2];
    unint64_t v13 = v10[3];
    swift_bridgeObjectRetain();
    sub_18844EF4C(v12, v13, v93);
    uint64_t v91 = v14;
    OUTLINED_FUNCTION_246();
    OUTLINED_FUNCTION_115();
    *(_WORD *)(v11 + 12) = 2080;
    OUTLINED_FUNCTION_68_5();
    OUTLINED_FUNCTION_6_7();
    OUTLINED_FUNCTION_103_0();
    OUTLINED_FUNCTION_58_0();
    OUTLINED_FUNCTION_18_15(v91, v15, v93);
    uint64_t v91 = v16;
    sub_1884CA430();
    OUTLINED_FUNCTION_12_2();
    OUTLINED_FUNCTION_13_3();
    _os_log_impl( &dword_18840C000,  v9,  (os_log_type_t)v5,  "%{public}s/%s: Tunnel connection path is nil",  (uint8_t *)v11,  0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_11();
  }

LABEL_29:
  OUTLINED_FUNCTION_17();
}

      OUTLINED_FUNCTION_15_13((uint64_t)v37);
      OUTLINED_FUNCTION_15_13(v34);
      OUTLINED_FUNCTION_19_12();
      goto LABEL_30;
    }
  }

  else
  {
    if (!MEMORY[0x189608D58] || v41 != *MEMORY[0x189608D58])
    {
      if (MEMORY[0x189608D50] && v41 == *MEMORY[0x189608D50])
      {
        ((void (*)(char *, uint64_t))v32[12])(v37, v254);
        v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C710220);
        v245 = v233;
        v131 = &v37[*(int *)(v130 + 48)];
        v246 = &v37[*(int *)(v130 + 64)];
        MEMORY[0x1895F8858](v130);
        v132 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0LL;
        v244 = v233;
        v234 = v32;
        v133 = *(uint64_t (**)(char *, char *, uint64_t *))(v34 + 32);
        v242 = (uint64_t)v233 - v132;
        v238 = v37;
        v134 = v249;
        v135 = v133((char *)v233 - v132, v39, v249);
        v243 = v233;
        MEMORY[0x1895F8858](v135);
        v136 = v133((char *)v233 - v132, v131, v134);
        v241 = v233;
        v137 = v253;
        MEMORY[0x1895F8858](v136);
        v138 = v34;
        v233[0] = v34;
        v139 = ((unint64_t)v137 + 15) & 0xFFFFFFFFFFFFFFF0LL;
        v240 = *(void (**)(char *, char *, uint64_t *))(v138 + 16);
        v240((char *)v233 - v139, (char *)v233 - v132, v134);
        v140 = *MEMORY[0x189608D58];
        v141 = v254;
        v239 = (void (*)(char *, uint64_t, uint64_t))v234[13];
        v239((char *)v233 - v139, v140, v254);
        OUTLINED_FUNCTION_46_9();
        v142 = (void (*)(char *, uint64_t))v250;
        v143 = ((uint64_t (*)(char *, uint64_t))v250)((char *)v233 - v139, v141);
        v241 = v233;
        MEMORY[0x1895F8858](v143);
        v240((char *)v233 - v139, (char *)v233 - v132, v134);
        v239((char *)v233 - v139, *(unsigned int *)v42, v141);
        OUTLINED_FUNCTION_46_9();
        v142((char *)v233 - v139, v141);
        OUTLINED_FUNCTION_14_11((uint64_t)v233 - v132);
        OUTLINED_FUNCTION_14_11(v242);
        v142(v238, v141);
        v144 = sub_1884C9E78();
        (*(void (**)(char *, uint64_t))(*(void *)(v144 - 8) + 8LL))(v246, v144);
      }

      else
      {
        ((void (*)(char *, uint64_t))v250)(v37, v254);
        OUTLINED_FUNCTION_15_13((uint64_t)v37);
      }

      goto LABEL_30;
    }

    unint64_t v87 = OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_34_10(v87, v88, v89, v90, v91, v92, v93, v94, v233[0]);
    v96 = MEMORY[0x1895F8858](v95);
    OUTLINED_FUNCTION_2_20(v96, v97, v98, v99, v100, v101, v102, v103, v233[0]);
    if ((OUTLINED_FUNCTION_45_7() & 1) != 0)
    {
      v104 = sub_1884CA274();
      v105 = v104;
      v253 = (os_log_s *)v233;
      v106 = (os_log_s *)qword_18C710060;
      v107 = MEMORY[0x1895F8858](v104);
      OUTLINED_FUNCTION_9_18(v107, v108, v109, v110, v111, v112, v113, v114, v233[0]);
      v248 = v106;
      if (os_log_type_enabled(v106, v105))
      {
        v115 = OUTLINED_FUNCTION_4_7();
        v238 = v37;
        v116 = (uint8_t *)v115;
        v247 = OUTLINED_FUNCTION_4_7();
        *(void *)v255 = v247;
        LODWORD(v246) = v105;
        OUTLINED_FUNCTION_37_7(4.8149e-34);
        v245 = v117;
        v119 = MEMORY[0x1895F8858](v118);
        OUTLINED_FUNCTION_6_19(v119, v120, v121, v122, v123, v124, v125, v126, v233[0]);
        v127 = OUTLINED_FUNCTION_40_11();
        OUTLINED_FUNCTION_42_7(v127, v128);
        OUTLINED_FUNCTION_335_0(v129);
        OUTLINED_FUNCTION_31_9();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_14_11((uint64_t)v37);
        OUTLINED_FUNCTION_34_1( &dword_18840C000,  v248,  (os_log_type_t)v246,  "Received bonjour notification to remove result %s, but result is still present in full results set. Ignoring",  v116);
        OUTLINED_FUNCTION_33_3();
        OUTLINED_FUNCTION_0_11();
      }

      goto LABEL_29;
    }
  }

  v234 = v32;
  v238 = v37;
  v145 = v245;
  v146 = ((uint64_t (*)(uint64_t *, uint64_t, void))v40)(v245, v34, v24);
  MEMORY[0x1895F8858](v146);
  v147 = v42;
  ((void (*)(char *, uint64_t *, void))v42[2])( (char *)v233 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v145,  v24);
  v148 = v247;
  v149 = *(unsigned __int8 *)(v247 + 24);
  v255[0] = *(_BYTE *)(v247 + 24);
  v150 = *(id *)(v247 + 32);
  v151 = v242;
  sub_1884C2DDC((uint64_t)v233 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL), v255, v150, v242);
  v152 = (uint64_t)v246;
  if (__swift_getEnumTagSinglePayload(v151, 1LL, (uint64_t)v246) == 1)
  {
    sub_1884BE228(v151);
    v153 = sub_1884CA25C();
    if (os_log_type_enabled((os_log_t)qword_18C710060, v153))
    {
      swift_retain_n();
      v154 = (_DWORD *)OUTLINED_FUNCTION_4_7();
      *(void *)v255 = OUTLINED_FUNCTION_4_7();
      *v154 = 136315138;
      __asm { BR              X9 }
    }

    OUTLINED_FUNCTION_19_12();
    v147[1](v145, v249);
    goto LABEL_30;
  }

  v155 = (uint64_t)v147;
  v156 = (uint64_t)v243;
  sub_1884BE268(v151, (uint64_t)v243);
  v157 = *(unsigned __int8 *)(v148 + 80);
  v158 = v240;
  v159 = sub_1884BB6E8(v156, (uint64_t)v240);
  if (v157 == 1)
  {
    v160 = *(void *)((char *)v158 + *(int *)(v152 + 48));
    OUTLINED_FUNCTION_25_13(v159, (uint64_t (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
    OUTLINED_FUNCTION_21_9();
    v161 = v244;
    v162 = v238;
    if ((v160 & 1) != 0)
    {
      sub_188464284(v35, (uint64_t (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
LABEL_32:
      sub_1884CA25C();
      sub_1884C9824();
      sub_188464284(v156, (uint64_t (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
      OUTLINED_FUNCTION_19_12();
      (*(void (**)(uint64_t *, void (*)(char *, char *, uint64_t)))(v155 + 8))(v245, v24);
      goto LABEL_30;
    }
  }

  else
  {
    OUTLINED_FUNCTION_25_13(v159, (uint64_t (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
    OUTLINED_FUNCTION_21_9();
    v161 = v244;
    v162 = v238;
  }

  v163 = v239;
  sub_1884BB6E8(v35, (uint64_t)v239);
  if ((v157 & 1) != 0)
  {
    OUTLINED_FUNCTION_22_8((uint64_t)v163);
    OUTLINED_FUNCTION_22_8(v35);
    v164 = (uint64_t)v246;
  }

  else
  {
    v164 = (uint64_t)v246;
    v165 = (uint64_t)v163;
    v166 = *(void *)((char *)v163 + *((int *)v246 + 12));
    OUTLINED_FUNCTION_22_8(v165);
    OUTLINED_FUNCTION_22_8(v35);
    if ((v166 & 1) == 0) {
      goto LABEL_32;
    }
  }

  v233[0] = v155;
  v238 = v162;
  v244 = v161;
  sub_18842FFC8(v148 + 40, (uint64_t)v255);
  v167 = v256;
  v250 = v257;
  v248 = (os_log_s *)__swift_project_boxed_opaque_existential_0Tm(v255, v256);
  v168 = (uint64_t *)(v156 + *(int *)(v164 + 28));
  v170 = *v168;
  v169 = v168[1];
  sub_18841E590(*v168, v169);
  sub_1884C97C4();
  v171 = sub_1884CA094();
  v251 = v233;
  v172 = *(void *)(v171 - 8);
  MEMORY[0x1895F8858](v171);
  OUTLINED_FUNCTION_34();
  v175 = v174 - v173;
  sub_1884CA088();
  v176 = sub_1884CA070();
  v178 = v177;
  OUTLINED_FUNCTION_13_3();
  (*(void (**)(uint64_t, uint64_t))(v172 + 8))(v175, v171);
  if (v178 >> 60 == 15)
  {
    __break(1u);
    JUMPOUT(0x1884BD32CLL);
  }

  v179 = (void *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v250 + 32))( v170,  v169,  v176,  v178,  1LL,  v167);
  sub_18842A578(v176, v178);
  sub_18842A58C(v170, v169);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v255);
  v180 = (uint64_t)v237;
  if (v179)
  {
    v181 = v179;
    v251 = (uint64_t *)CUPairedPeer.udid.getter();
    v183 = v182;
  }

  else
  {
    v251 = 0LL;
    v183 = 0LL;
  }

  v184 = (uint64_t)v243;
  v185 = sub_1884CA274();
  v186 = (os_log_s *)qword_18C710060;
  sub_1884BB6E8(v184, v180);
  v187 = os_log_type_enabled(v186, v185);
  if (v187)
  {
    swift_bridgeObjectRetain_n();
    v188 = v179;
    v189 = OUTLINED_FUNCTION_4_7();
    v250 = OUTLINED_FUNCTION_4_7();
    v258 = v250;
    *(_DWORD *)v189 = 136446722;
    sub_1884C97F4();
    sub_18841729C( (unint64_t *)&qword_18C4DC6A8,  (uint64_t (*)(uint64_t))MEMORY[0x189606F18],  MEMORY[0x189606F78]);
    v190 = sub_1884CA7D8();
    OUTLINED_FUNCTION_28_11(v190, v191);
    *(void *)v255 = v192;
    OUTLINED_FUNCTION_18_18();
    v193 = OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_25_13(v193, (uint64_t (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
    *(_WORD *)(v189 + 12) = 2082;
    *(void *)v255 = v179;
    v194 = v188;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C710218);
    v195 = OUTLINED_FUNCTION_47_6();
    OUTLINED_FUNCTION_28_11(v195, v196);
    *(void *)v255 = v197;
    OUTLINED_FUNCTION_18_18();

    swift_bridgeObjectRelease();
    *(_WORD *)(v189 + 22) = 2082;
    OUTLINED_FUNCTION_29_5();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70E500);
    v198 = OUTLINED_FUNCTION_47_6();
    OUTLINED_FUNCTION_28_11(v198, v199);
    *(void *)v255 = v200;
    OUTLINED_FUNCTION_18_18();
    OUTLINED_FUNCTION_38_10();
    OUTLINED_FUNCTION_13_3();
    _os_log_impl( &dword_18840C000,  v186,  v185,  "Resolved bonjour advert %{public}s to identity %{public}s, udid %{public}s",  (uint8_t *)v189,  0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_11();
  }

  OUTLINED_FUNCTION_25_13(v187, (uint64_t (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
  v201 = v252;
  v202 = v249;
  v203 = v238;
  v204 = v233[0];
  v205 = v234;
  MEMORY[0x1895F8858](v206);
  v208 = (char *)v233 - ((v207 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v209 = v254;
  ((void (*)(char *, char *, uint64_t))v233[2])(v208, v203, v254);
  v210 = ((uint64_t (*)(char *, uint64_t))v233[1])(v208, v209);
  if (MEMORY[0x189608D58] && v210 == *MEMORY[0x189608D58])
  {
    OUTLINED_FUNCTION_271();
    ((void (*)(char *, uint64_t))v205[1])(v208, v254);
    v211 = OUTLINED_FUNCTION_4_21();
    if (v241)
    {
      v212 = v235;
      v213 = v236;
      OUTLINED_FUNCTION_51_7(v211, (uint64_t)&v236[*(int *)(v235 + 20)]);
      *v213 = 1;
      *(void *)&v213[*(int *)(v212 + 24)] = v179;
      v214 = v179;
      OUTLINED_FUNCTION_7_14();
      OUTLINED_FUNCTION_17_12();
      sub_188464284((uint64_t)v213, (uint64_t (*)(void))type metadata accessor for BonjourBrowser.Change);
      sub_188464284(v183, (uint64_t (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
      OUTLINED_FUNCTION_36_7();
      (*(void (**)(uint64_t *, uint64_t *))(v233[0] + 8))(v245, v249);
    }

    else
    {

      sub_188464284((uint64_t)v243, (uint64_t (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
      OUTLINED_FUNCTION_36_7();
      (*(void (**)(uint64_t *, uint64_t *))(v204 + 8))(v245, v249);
    }
  }

  else
  {
    v215 = v179;
    v216 = (void (*)(char *, uint64_t))v205[1];
    v216(v208, v254);
    if (*(void *)(*(uint64_t *)((char *)v243 + *((int *)v246 + 13)) + 16))
    {
      OUTLINED_FUNCTION_271();
      OUTLINED_FUNCTION_4_21();
      if (v241)
      {
        OUTLINED_FUNCTION_10_12();
        v217 = (uint64_t)v243;
        sub_1884BB6E8((uint64_t)v243, v218);
        *(_BYTE *)v201 = 0;
        OUTLINED_FUNCTION_50_7();
        OUTLINED_FUNCTION_7_14();
        OUTLINED_FUNCTION_17_12();
        sub_188464284((uint64_t)v201, (uint64_t (*)(void))type metadata accessor for BonjourBrowser.Change);
        v219 = v217;
      }

      else
      {

        v219 = (uint64_t)v243;
      }

      sub_188464284(v219, (uint64_t (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
      v227 = v203;
      v228 = v254;
    }

    else
    {
      v220 = sub_1884CA274();
      v221 = (os_log_s *)qword_18C710060;
      v222 = v220;
      if (os_log_type_enabled((os_log_t)qword_18C710060, v220))
      {
        swift_bridgeObjectRetain();
        v223 = (uint8_t *)OUTLINED_FUNCTION_4_7();
        v258 = OUTLINED_FUNCTION_4_7();
        *(_DWORD *)v223 = 136315138;
        OUTLINED_FUNCTION_29_5();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70E500);
        v224 = OUTLINED_FUNCTION_47_6();
        OUTLINED_FUNCTION_28_11(v224, v225);
        *(void *)v255 = v226;
        OUTLINED_FUNCTION_31_9();
        OUTLINED_FUNCTION_38_10();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_34_1( &dword_18840C000,  v221,  v222,  "Discovered bonjour advert for device %s but it is not visible through any valid interface. Treating as lost event.",  v223);
        OUTLINED_FUNCTION_33_3();
        OUTLINED_FUNCTION_0_11();
      }

      OUTLINED_FUNCTION_271();
      OUTLINED_FUNCTION_4_21();
      v229 = v254;
      if (v241)
      {
        OUTLINED_FUNCTION_10_12();
        OUTLINED_FUNCTION_51_7(v230, v231);
        *(_BYTE *)v201 = 1;
        OUTLINED_FUNCTION_50_7();
        OUTLINED_FUNCTION_7_14();
        OUTLINED_FUNCTION_17_12();
        sub_188464284((uint64_t)v201, (uint64_t (*)(void))type metadata accessor for BonjourBrowser.Change);
        v232 = v183;
      }

      else
      {

        v232 = (uint64_t)v243;
      }

      sub_188464284(v232, (uint64_t (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
      v227 = v203;
      v228 = v229;
    }

    v216(v227, v228);
    (*(void (**)(uint64_t *, uint64_t *))(v233[0] + 8))(v245, v202);
  }

void TCPTunnelConnection.tunnelIdentifier.getter()
{
}

uint64_t TCPTunnelConnection.identifier.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_50_6(*(void *)(v1 + 40), a1);
}

uint64_t TCPTunnelConnection.stream.getter()
{
  return swift_retain();
}

void sub_1884A2D78(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_18842A484(*a1, v2);
  sub_1884A2DF4(v1, v2);
}

uint64_t sub_1884A2DB8()
{
  uint64_t v0 = OUTLINED_FUNCTION_69();
  sub_18842A484(v0, v1);
  return OUTLINED_FUNCTION_69();
}

void sub_1884A2DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 56);
  unint64_t v6 = *(void *)(v2 + 64);
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  sub_18842A578(v5, v6);
  OUTLINED_FUNCTION_5();
}

void sub_1884A2E34()
{
}

void sub_1884A2E68()
{
}

void sub_1884A2E8C(uint64_t a1)
{
  *(void *)(v1 + 72) = a1;
  OUTLINED_FUNCTION_26();
}

void sub_1884A2EBC()
{
}

void sub_1884A2EF0()
{
}

void sub_1884A2F14()
{
}

uint64_t TCPTunnelConnection.__allocating_init(tunnelIdentifier:stream:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OUTLINED_FUNCTION_19_0();
  TCPTunnelConnection.init(tunnelIdentifier:stream:)(a1, a2, a3);
  return v6;
}

uint64_t TCPTunnelConnection.init(tunnelIdentifier:stream:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)(v3 + 56) = xmmword_1884CEDF0;
  *(_OWORD *)(v3 + 72) = xmmword_1884D2C30;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  uint64_t v6 = OUTLINED_FUNCTION_90_3();
  OUTLINED_FUNCTION_16_12(v6, v7, v8, v9, v10, v11, v12, v13, v16, v17, v18, v19);
  if (!v4)
  {
    if (v20 <= 8)
    {
      *(void *)(v6 + 16) = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C70EA50);
      sub_188459640((unint64_t *)&qword_18C70EA58, &qword_18C70EA50);
      *(void *)(v3 + 32) = sub_1884CA148();
      *(void *)(v3 + 4sub_188455A4C(v0, v1, 0) = v14;
      *(void *)(v3 + 48) = a3;
      return v3;
    }

    __break(1u);
  }

  if (v20 > 8) {
    __break(1u);
  }
  *(void *)(v6 + 16) = v20;
  uint64_t result = OUTLINED_FUNCTION_19_2();
  __break(1u);
  return result;
}

void sub_1884A3064()
{
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_1884C9BFC();
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x1895F8858](v7);
  OUTLINED_FUNCTION_9_0();
  uint64_t v8 = OUTLINED_FUNCTION_19_0();
  *(void *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = v3;
  void *v0 = sub_18847DAC0;
  v0[1] = (void (*)(uint64_t))v8;
  (*(void (**)(void (**)(uint64_t), void, uint64_t))(v1 + 104))( v0,  *MEMORY[0x1896089B0],  v6);
  sub_1884C9BF0();
  OUTLINED_FUNCTION_91_1();
  sub_1884C9BD8();
  OUTLINED_FUNCTION_305_0();
  sub_1884C9C38();
  OUTLINED_FUNCTION_355();
  (*(void (**)(void (**)(uint64_t), uint64_t))(v1 + 8))(v0, v6);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1884A3134()
{
  uint64_t v3 = (void *)OUTLINED_FUNCTION_19_0();
  v3[2] = v2;
  v3[3] = v1;
  v3[4] = v0;
  OUTLINED_FUNCTION_124();
  OUTLINED_FUNCTION_305_0();
  sub_1884C9C80();
  return swift_release();
}

void sub_1884A319C()
{
}

uint64_t sub_1884A31B8()
{
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = (void *)OUTLINED_FUNCTION_19_0();
  v6[2] = v5;
  v6[3] = v3;
  v6[4] = v1;
  uint64_t v7 = OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_27_8();
  uint64_t v8 = OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_345();
  uint64_t v9 = (void *)OUTLINED_FUNCTION_19_0();
  v9[2] = v7;
  v9[3] = v8;
  v9[4] = sub_1884A9A74;
  v9[5] = v6;
  id v10 = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_124();
  sub_188425FE0((uint64_t)sub_1884A9AEC);
  sub_1884C9C08();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v11 = OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_27_8();
  uint64_t v12 = OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_345();
  uint64_t v13 = OUTLINED_FUNCTION_19_0();
  *(void *)(v13 + 16) = v11;
  *(void *)(v13 + 24) = v12;
  OUTLINED_FUNCTION_347();
  OUTLINED_FUNCTION_80_1();
  uint64_t v14 = OUTLINED_FUNCTION_102_1();
  sub_188425FE0(v14);
  OUTLINED_FUNCTION_102_1();
  sub_1884C9C14();
  OUTLINED_FUNCTION_264();
  OUTLINED_FUNCTION_34_8();
  OUTLINED_FUNCTION_295();
  sub_1884C9C5C();
  return swift_release();
}

uint64_t sub_1884A3348(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *), uint64_t a5)
{
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  uint64_t v9 = result;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return swift_release();
  }
  uint64_t v11 = Strong;
  uint64_t v100 = a5;
  uint64_t v12 = sub_1884C9C50();
  v101 = v92;
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1895F8858](v12);
  uint64_t v15 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v13 + 16);
  v15(&v92[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)], a1, v12);
  uint64_t v16 = (*(uint64_t (**)(_BYTE *, uint64_t))(v13 + 88))(&v92[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)], v12);
  if (MEMORY[0x189608A48] && (_DWORD)v16 == *MEMORY[0x189608A48])
  {
    v98 = a4;
    (*(void (**)(_BYTE *, uint64_t))(v13 + 96))(&v92[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)], v12);
    uint64_t v17 = sub_1884C9E18();
    os_log_t v95 = (os_log_t)v92;
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = *(void *)(v18 + 64);
    MEMORY[0x1895F8858](v17);
    unint64_t v20 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v18 + 32))( &v92[-v20],  &v92[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v17);
    uint64_t v21 = sub_1884CA274();
    os_log_type_t v22 = v21;
    if (qword_18C70D740 != -1) {
      uint64_t v21 = swift_once();
    }
    v96 = v92;
    uint64_t v23 = (os_log_s *)qword_18C70FAB0;
    MEMORY[0x1895F8858](v21);
    unint64_t v24 = &v92[-v20];
    uint64_t v25 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v18 + 16);
    v97 = &v92[-v20];
    v25(&v92[-v20], &v92[-v20], v17);
    int v26 = v22;
    os_log_t v94 = v23;
    if (os_log_type_enabled(v23, v22))
    {
      swift_retain_n();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      os_log_t v102 = (os_log_t)v28;
      *(_DWORD *)uint64_t v27 = 136446722;
      int v93 = v26;
      uint64_t v99 = v11;
      uint64_t v29 = *(void *)(v9 + 16);
      unint64_t v30 = *(void *)(v9 + 24);
      swift_bridgeObjectRetain();
      sub_18844EF4C(v29, v30, (uint64_t *)&v102);
      uint64_t v103 = v31;
      sub_1884CA430();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2080;
      uint64_t v103 = 0x5F6E6F6374LL;
      unint64_t v104 = 0xE500000000000000LL;
      swift_bridgeObjectRetain();
      sub_1884CA0E8();
      swift_bridgeObjectRelease();
      sub_18844EF4C(v103, v104, (uint64_t *)&v102);
      uint64_t v103 = v32;
      sub_1884CA430();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 22) = 2082;
      sub_18841729C(qword_18C70FAA0, (uint64_t (*)(uint64_t))MEMORY[0x189608CC8], MEMORY[0x189608CE8]);
      uint64_t v33 = sub_1884CA8B0();
      sub_18844EF4C(v33, v34, (uint64_t *)&v102);
      uint64_t v103 = v35;
      sub_1884CA430();
      swift_bridgeObjectRelease();
      uint64_t v36 = *(void (**)(_BYTE *, uint64_t))(v18 + 8);
      v36(v24, v17);
      _os_log_impl( &dword_18840C000,  v94,  (os_log_type_t)v93,  "%{public}s/%s: Tunnel connection waiting, error: %{public}s",  (uint8_t *)v27,  0x20u);
      swift_arrayDestroy();
      MEMORY[0x1895C7BD0](v28, -1LL, -1LL);
      MEMORY[0x1895C7BD0](v27, -1LL, -1LL);
    }

    else
    {
      uint64_t v36 = *(void (**)(_BYTE *, uint64_t))(v18 + 8);
      v36(&v92[-v20], v17);
    }

    sub_1884C9C74();
    LOBYTE(v103) = 1;
    v98(&v103);
    swift_release();
    swift_release();
    return ((uint64_t (*)(_BYTE *, uint64_t))v36)(v97, v17);
  }

  if (!MEMORY[0x189608A40] || (_DWORD)v16 != *MEMORY[0x189608A40])
  {
    if (MEMORY[0x189608A30] && (_DWORD)v16 == *MEMORY[0x189608A30])
    {
      uint64_t v99 = v11;
      os_log_type_t v57 = sub_1884CA274();
      if (qword_18C70D740 != -1) {
        swift_once();
      }
      uint64_t v58 = (os_log_s *)qword_18C70FAB0;
      swift_retain();
      os_log_type_t v59 = v57;
      if (os_log_type_enabled(v58, v57))
      {
        swift_retain();
        uint64_t v60 = swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        os_log_t v102 = (os_log_t)v61;
        *(_DWORD *)uint64_t v60 = 136446466;
        uint64_t v62 = *(void *)(v9 + 16);
        unint64_t v63 = *(void *)(v9 + 24);
        swift_bridgeObjectRetain();
        sub_18844EF4C(v62, v63, (uint64_t *)&v102);
        uint64_t v103 = v64;
        sub_1884CA430();
        swift_bridgeObjectRelease();
        *(_WORD *)(v60 + 12) = 2080;
        uint64_t v103 = 0x5F6E6F6374LL;
        unint64_t v104 = 0xE500000000000000LL;
        swift_bridgeObjectRetain();
        sub_1884CA0E8();
        swift_bridgeObjectRelease();
        sub_18844EF4C(v103, v104, (uint64_t *)&v102);
        uint64_t v103 = v65;
        sub_1884CA430();
        swift_release_n();
        swift_bridgeObjectRelease();
        uint64_t v66 = "%{public}s/%s: Tunnel connection setup";
LABEL_28:
        _os_log_impl(&dword_18840C000, v58, v59, v66, (uint8_t *)v60, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1895C7BD0](v61, -1LL, -1LL);
        MEMORY[0x1895C7BD0](v60, -1LL, -1LL);
LABEL_44:
        swift_release();
        return swift_release();
      }
    }

    else
    {
      if (!MEMORY[0x189608A60] || (_DWORD)v16 != *MEMORY[0x189608A60])
      {
        if (MEMORY[0x189608A28] && (_DWORD)v16 == *MEMORY[0x189608A28])
        {
          os_log_type_t v72 = sub_1884CA274();
          if (qword_18C70D740 != -1) {
            swift_once();
          }
          uint64_t v73 = (os_log_s *)qword_18C70FAB0;
          if (os_log_type_enabled((os_log_t)qword_18C70FAB0, v72))
          {
            swift_retain_n();
            uint64_t v74 = swift_slowAlloc();
            uint64_t v75 = swift_slowAlloc();
            v98 = a4;
            uint64_t v76 = v75;
            os_log_t v102 = (os_log_t)v75;
            *(_DWORD *)uint64_t v74 = 136446466;
            uint64_t v99 = v11;
            uint64_t v77 = *(void *)(v9 + 16);
            unint64_t v78 = *(void *)(v9 + 24);
            swift_bridgeObjectRetain();
            sub_18844EF4C(v77, v78, (uint64_t *)&v102);
            uint64_t v103 = v79;
            sub_1884CA430();
            swift_bridgeObjectRelease();
            *(_WORD *)(v74 + 12) = 2080;
            uint64_t v103 = 0x5F6E6F6374LL;
            unint64_t v104 = 0xE500000000000000LL;
            swift_bridgeObjectRetain();
            sub_1884CA0E8();
            swift_bridgeObjectRelease();
            sub_18844EF4C(v103, v104, (uint64_t *)&v102);
            uint64_t v103 = v80;
            sub_1884CA430();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl( &dword_18840C000,  v73,  v72,  "%{public}s/%s: Tunnel connection established",  (uint8_t *)v74,  0x16u);
            swift_arrayDestroy();
            uint64_t v81 = v76;
            a4 = v98;
            MEMORY[0x1895C7BD0](v81, -1LL, -1LL);
            MEMORY[0x1895C7BD0](v74, -1LL, -1LL);
          }

          LOBYTE(v103) = 0;
        }

        else
        {
          if (!MEMORY[0x189608A58] || (_DWORD)v16 != *MEMORY[0x189608A58])
          {
            MEMORY[0x1895F8858](v16);
            v15(&v92[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)], a1, v12);
            uint64_t v103 = 0LL;
            unint64_t v104 = 0xE000000000000000LL;
            sub_1884CA4D8();
            sub_1884CA0E8();
            sub_1884CA598();
            uint64_t result = sub_1884CA5E0();
            __break(1u);
            return result;
          }

          os_log_type_t v82 = sub_1884CA274();
          if (qword_18C70D740 != -1) {
            swift_once();
          }
          uint64_t v83 = (os_log_s *)qword_18C70FAB0;
          if (os_log_type_enabled((os_log_t)qword_18C70FAB0, v82))
          {
            swift_retain_n();
            uint64_t v84 = swift_slowAlloc();
            uint64_t v85 = swift_slowAlloc();
            v98 = a4;
            uint64_t v86 = v85;
            os_log_t v102 = (os_log_t)v85;
            *(_DWORD *)uint64_t v84 = 136446466;
            uint64_t v99 = v11;
            uint64_t v87 = *(void *)(v9 + 16);
            unint64_t v88 = *(void *)(v9 + 24);
            swift_bridgeObjectRetain();
            sub_18844EF4C(v87, v88, (uint64_t *)&v102);
            uint64_t v103 = v89;
            sub_1884CA430();
            swift_bridgeObjectRelease();
            *(_WORD *)(v84 + 12) = 2080;
            uint64_t v103 = 0x5F6E6F6374LL;
            unint64_t v104 = 0xE500000000000000LL;
            swift_bridgeObjectRetain();
            sub_1884CA0E8();
            swift_bridgeObjectRelease();
            sub_18844EF4C(v103, v104, (uint64_t *)&v102);
            uint64_t v103 = v90;
            sub_1884CA430();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl( &dword_18840C000,  v83,  v82,  "%{public}s/%s: Tunnel connection cancelled",  (uint8_t *)v84,  0x16u);
            swift_arrayDestroy();
            uint64_t v91 = v86;
            a4 = v98;
            MEMORY[0x1895C7BD0](v91, -1LL, -1LL);
            MEMORY[0x1895C7BD0](v84, -1LL, -1LL);
          }

          sub_1884C9C74();
          LOBYTE(v103) = 1;
        }

        a4(&v103);
        goto LABEL_44;
      }

      uint64_t v99 = v11;
      os_log_type_t v67 = sub_1884CA274();
      if (qword_18C70D740 != -1) {
        swift_once();
      }
      uint64_t v58 = (os_log_s *)qword_18C70FAB0;
      swift_retain();
      os_log_type_t v59 = v67;
      if (os_log_type_enabled(v58, v67))
      {
        swift_retain();
        uint64_t v60 = swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        os_log_t v102 = (os_log_t)v61;
        *(_DWORD *)uint64_t v60 = 136446466;
        uint64_t v68 = *(void *)(v9 + 16);
        unint64_t v69 = *(void *)(v9 + 24);
        swift_bridgeObjectRetain();
        sub_18844EF4C(v68, v69, (uint64_t *)&v102);
        uint64_t v103 = v70;
        sub_1884CA430();
        swift_bridgeObjectRelease();
        *(_WORD *)(v60 + 12) = 2080;
        uint64_t v103 = 0x5F6E6F6374LL;
        unint64_t v104 = 0xE500000000000000LL;
        swift_bridgeObjectRetain();
        sub_1884CA0E8();
        swift_bridgeObjectRelease();
        sub_18844EF4C(v103, v104, (uint64_t *)&v102);
        uint64_t v103 = v71;
        sub_1884CA430();
        swift_release_n();
        swift_bridgeObjectRelease();
        uint64_t v66 = "%{public}s/%s: Tunnel connection preparing";
        goto LABEL_28;
      }
    }

    swift_release_n();
    return swift_release();
  }

  v98 = a4;
  (*(void (**)(_BYTE *, uint64_t))(v13 + 96))(&v92[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)], v12);
  uint64_t v37 = sub_1884C9E18();
  v96 = v92;
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = *(void *)(v38 + 64);
  MEMORY[0x1895F8858](v37);
  unint64_t v40 = (v39 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v41 = &v92[-v40];
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v38 + 32))( &v92[-v40],  &v92[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v37);
  uint64_t v42 = sub_1884CA25C();
  os_log_type_t v43 = v42;
  if (qword_18C70D740 != -1) {
    uint64_t v42 = swift_once();
  }
  v97 = v92;
  unint64_t v44 = (os_log_s *)qword_18C70FAB0;
  MEMORY[0x1895F8858](v42);
  unint64_t v45 = &v92[-v40];
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v38 + 16))(&v92[-v40], &v92[-v40], v37);
  int v46 = v43;
  os_log_t v95 = v44;
  if (os_log_type_enabled(v44, v43))
  {
    swift_retain_n();
    uint64_t v47 = swift_slowAlloc();
    os_log_t v94 = (os_log_t)swift_slowAlloc();
    os_log_t v102 = v94;
    *(_DWORD *)uint64_t v47 = 136446722;
    int v93 = v46;
    uint64_t v99 = v11;
    uint64_t v48 = *(void *)(v9 + 16);
    unint64_t v49 = *(void *)(v9 + 24);
    swift_bridgeObjectRetain();
    sub_18844EF4C(v48, v49, (uint64_t *)&v102);
    uint64_t v103 = v50;
    sub_1884CA430();
    swift_bridgeObjectRelease();
    *(_WORD *)(v47 + 12) = 2080;
    uint64_t v103 = 0x5F6E6F6374LL;
    unint64_t v104 = 0xE500000000000000LL;
    swift_bridgeObjectRetain();
    sub_1884CA0E8();
    swift_bridgeObjectRelease();
    sub_18844EF4C(v103, v104, (uint64_t *)&v102);
    uint64_t v103 = v51;
    sub_1884CA430();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v47 + 22) = 2082;
    sub_18841729C(qword_18C70FAA0, (uint64_t (*)(uint64_t))MEMORY[0x189608CC8], MEMORY[0x189608CE8]);
    uint64_t v52 = sub_1884CA8B0();
    sub_18844EF4C(v52, v53, (uint64_t *)&v102);
    uint64_t v103 = v54;
    sub_1884CA430();
    swift_bridgeObjectRelease();
    uint64_t v55 = *(void (**)(_BYTE *, uint64_t))(v38 + 8);
    v55(v45, v37);
    _os_log_impl( &dword_18840C000,  v95,  (os_log_type_t)v93,  "%{public}s/%s: Tunnel connection failed, error: %{public}s",  (uint8_t *)v47,  0x20u);
    os_log_t v56 = v94;
    swift_arrayDestroy();
    MEMORY[0x1895C7BD0](v56, -1LL, -1LL);
    MEMORY[0x1895C7BD0](v47, -1LL, -1LL);
  }

  else
  {
    uint64_t v55 = *(void (**)(_BYTE *, uint64_t))(v38 + 8);
    v55(&v92[-v40], v37);
  }

  sub_1884C9C74();
  LOBYTE(v103) = 1;
  v98(&v103);
  swift_release();
  swift_release();
  return ((uint64_t (*)(_BYTE *, uint64_t))v55)(v41, v37);
}

uint64_t sub_1884A4334(char a1)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      if ((a1 & 1) == 0)
      {
        os_log_type_t v4 = sub_1884CA25C();
        if (qword_18C70D740 != -1) {
          swift_once();
        }
        uint64_t v5 = (os_log_s *)qword_18C70FAB0;
        if (os_log_type_enabled((os_log_t)qword_18C70FAB0, v4))
        {
          swift_retain_n();
          uint64_t v6 = swift_slowAlloc();
          uint64_t v7 = swift_slowAlloc();
          uint64_t v10 = v7;
          *(_DWORD *)uint64_t v6 = 136446466;
          uint64_t v8 = *(void *)(v3 + 16);
          unint64_t v9 = *(void *)(v3 + 24);
          swift_bridgeObjectRetain();
          sub_18844EF4C(v8, v9, &v10);
          sub_1884CA430();
          swift_bridgeObjectRelease();
          *(_WORD *)(v6 + 12) = 2080;
          swift_bridgeObjectRetain();
          sub_1884CA0E8();
          swift_bridgeObjectRelease();
          sub_18844EF4C(0x5F6E6F6374LL, 0xE500000000000000LL, &v10);
          sub_1884CA430();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl( &dword_18840C000,  v5,  v4,  "%{public}s/%s: Cancelling tunnel connection as it is no longer viable",  (uint8_t *)v6,  0x16u);
          swift_arrayDestroy();
          MEMORY[0x1895C7BD0](v7, -1LL, -1LL);
          MEMORY[0x1895C7BD0](v6, -1LL, -1LL);
        }

        sub_1884C9C74();
        sub_1884C9C74();
      }

      swift_release();
    }

    return swift_release();
  }

  return result;
}

uint64_t sub_1884A45A4()
{
  uint64_t v8 = 0LL;
  unint64_t v9 = 0xE000000000000000LL;
  sub_1884CA4D8();
  sub_1884CA0E8();
  swift_getMetatypeMetadata();
  sub_1884CA0A0();
  sub_1884CA0E8();
  OUTLINED_FUNCTION_11();
  sub_1884CA0E8();
  OUTLINED_FUNCTION_7_13();
  v7[0] = v0;
  v7[1] = v1;
  OUTLINED_FUNCTION_29_2();
  sub_1884CA0E8();
  sub_1884CA0E8();
  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_11();
  sub_1884CA0E8();
  uint64_t v2 = sub_1884C9B00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1884C9C8C();
  sub_1884CA598();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1884CA0E8();
  return v8;
}

uint64_t TCPTunnelConnection.deinit()
{
  return v0;
}

uint64_t TCPTunnelConnection.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t (*sub_1884A4764())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_1884A47A8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1884A47F0()
{
  return sub_1884A45A4();
}

uint64_t sub_1884A4810@<X0>(void *a1@<X8>)
{
  return TCPTunnelConnection.identifier.getter(a1);
}

void sub_1884A4830()
{
}

uint64_t sub_1884A4850()
{
  return sub_1884A31B8();
}

void sub_1884A4870()
{
}

uint64_t sub_1884A4890(__int16 a1, __int16 a2)
{
  if ((a2 & 0xFE) == 2) {
    return 0LL;
  }
  if (((a1 & 1) == 0) == (a2 & 1)) {
    return 0LL;
  }
  else {
    return ((a1 & 0x100) == 0) ^ ((unsigned __int16)(a2 & 0x100) >> 8);
  }
}

uint64_t sub_1884A4908(__int16 *a1, __int16 *a2)
{
  return sub_1884A4890(*a1, *a2);
}

uint64_t sub_1884A4914()
{
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_4_6();
  if (!*(void *)(v0 + 48)) {
    return 1280LL;
  }
  uint64_t v2 = OUTLINED_FUNCTION_124();
  uint64_t v3 = (nw_connection *)MEMORY[0x1895C63D0](v2);
  uint64_t v4 = nw_protocol_copy_quic_definition();
  nw_protocol_metadata_t v5 = nw_connection_copy_protocol_metadata(v3, v4);
  swift_unknownObjectRelease();
  uint64_t result = swift_unknownObjectRelease();
  if (v5)
  {
    unsigned int v7 = MEMORY[0x1895C7624](v5);
    os_log_type_t v8 = sub_1884CA274();
    if (qword_18C70D740 != -1) {
      swift_once();
    }
    unint64_t v9 = (os_log_s *)qword_18C70FAB0;
    OUTLINED_FUNCTION_20_2();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = OUTLINED_FUNCTION_4_7();
      v16[0] = OUTLINED_FUNCTION_4_7();
      *(_DWORD *)uint64_t v10 = 136446722;
      uint64_t v11 = *(void *)(v1 + 56);
      OUTLINED_FUNCTION_30_10();
      OUTLINED_FUNCTION_82_3(v11, v12, v16);
      OUTLINED_FUNCTION_246();
      OUTLINED_FUNCTION_179();
      *(_WORD *)(v10 + 12) = 2080;
      OUTLINED_FUNCTION_7_13();
      uint64_t v15 = v13;
      OUTLINED_FUNCTION_29_2();
      sub_1884CA0E8();
      OUTLINED_FUNCTION_19_2();
      OUTLINED_FUNCTION_18_15(v15, v14, v16);
      sub_1884CA430();
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_13_3();
      *(_WORD *)(v10 + 22) = 2048;
      sub_1884CA430();
      _os_log_impl(&dword_18840C000, v9, v8, "%{public}s/%s: Tunnel MTU datagaram = %ld", (uint8_t *)v10, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_11();
    }

    OUTLINED_FUNCTION_12_2();
    OUTLINED_FUNCTION_98();
    swift_unknownObjectRelease();
    if (v7) {
      return v7;
    }
    else {
      return 1280LL;
    }
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_1884A4B78()
{
  uint64_t v3 = *(void **)(v1 + 48);
  if (!v3)
  {
    sub_1884CA268();
    if (qword_18C70D740 != -1) {
      goto LABEL_37;
    }
    goto LABEL_9;
  }

  uint64_t v91 = v1;
  uint64_t v4 = sub_1884C9E0C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  OUTLINED_FUNCTION_12_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70F450);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_100();
  swift_retain();
  sub_1884C9BCC();
  uint64_t v7 = OUTLINED_FUNCTION_76_6(v0);
  if (v8)
  {
    OUTLINED_FUNCTION_94_2(v7, &qword_18C70F450);
    os_log_type_t v9 = sub_1884CA268();
    if (qword_18C70D740 != -1) {
      swift_once();
    }
    uint64_t v10 = (os_log_s *)qword_18C70FAB0;
    uint64_t v11 = v91;
    if (os_log_type_enabled((os_log_t)qword_18C70FAB0, v9))
    {
      OUTLINED_FUNCTION_20_2();
      uint64_t v12 = OUTLINED_FUNCTION_4_7();
      v108[0] = OUTLINED_FUNCTION_4_7();
      *(_DWORD *)uint64_t v12 = 136446466;
      uint64_t v13 = *(void *)(v11 + 56);
      unint64_t v14 = *(void *)(v11 + 64);
      swift_bridgeObjectRetain();
      sub_18844EF4C(v13, v14, v108);
      v107[0] = v15;
      OUTLINED_FUNCTION_246();
      OUTLINED_FUNCTION_115();
      *(_WORD *)(v12 + 12) = 2080;
      OUTLINED_FUNCTION_69_4();
      OUTLINED_FUNCTION_6_7();
      uint64_t v90 = v3;
      OUTLINED_FUNCTION_103_0();
      OUTLINED_FUNCTION_58_0();
      OUTLINED_FUNCTION_18_15(v107[0], v16, v108);
      v107[0] = v17;
      OUTLINED_FUNCTION_105_2();
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_24_9(&dword_18840C000, v10, v9, "%{public}s/%s: Tunnel connection path is nil");
      OUTLINED_FUNCTION_12_11();
      OUTLINED_FUNCTION_0_11();
    }

    swift_release();
    goto LABEL_35;
  }

  v89[1] = (uint64_t)v89;
  uint64_t v90 = v3;
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
  v89[0] = v4;
  v18(v2, v0, v4);
  uint64_t v19 = v2;
  uint64_t v20 = sub_1884C9E00();
  v107[0] = MEMORY[0x18961AFE8];
  uint64_t v95 = *(void *)(v20 + 16);
  uint64_t v21 = sub_1884C9B90();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x1895F8858](v21);
  uint64_t v106 = v23;
  OUTLINED_FUNCTION_33_7();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70EAE0);
  OUTLINED_FUNCTION_28_9();
  MEMORY[0x1895F8858](v24);
  OUTLINED_FUNCTION_48_7();
  uint64_t v93 = v2;
  uint64_t v94 = v5;
  if (!v25)
  {
LABEL_25:
    OUTLINED_FUNCTION_78_4((uint64_t)v3, 1LL);
LABEL_27:
    OUTLINED_FUNCTION_19_2();
    sub_188437B70((uint64_t)v3, (uint64_t *)&unk_18C70EAE0);
    uint64_t v66 = MEMORY[0x1895F8858](v65);
    OUTLINED_FUNCTION_19_10(v66, v67, v68, v69, v70, v71, v72, v73, v89[0]);
    OUTLINED_FUNCTION_98();
    OUTLINED_FUNCTION_76_6(v19);
    if (v8)
    {
      sub_188437B70(v19, (uint64_t *)&unk_18C70EAE0);
      uint64_t v74 = 0LL;
      uint64_t v76 = 0LL;
    }

    else
    {
      uint64_t v74 = sub_1884C9B6C();
      uint64_t v76 = v75;
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v19, v21);
    }

    sub_1884CA274();
    if (qword_18C70D740 != -1) {
      swift_once();
    }
    uint64_t v77 = v91;
    OUTLINED_FUNCTION_20_2();
    if (OUTLINED_FUNCTION_81_0())
    {
      OUTLINED_FUNCTION_89_2();
      OUTLINED_FUNCTION_20_2();
      uint64_t v78 = OUTLINED_FUNCTION_4_7();
      uint64_t v106 = OUTLINED_FUNCTION_4_7();
      v108[0] = v106;
      *(_DWORD *)uint64_t v78 = 136446722;
      uint64_t v79 = *(void *)(v77 + 56);
      OUTLINED_FUNCTION_30_10();
      OUTLINED_FUNCTION_82_3(v79, v80, v108);
      v107[0] = v81;
      OUTLINED_FUNCTION_246();
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_179();
      *(_WORD *)(v78 + 12) = 2080;
      OUTLINED_FUNCTION_69_4();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_83_4();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_18_15(v107[0], v82, v108);
      v107[0] = v83;
      OUTLINED_FUNCTION_105_2();
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_13_3();
      *(_WORD *)(v78 + 22) = 2080;
      v107[0] = v74;
      v107[1] = v76;
      OUTLINED_FUNCTION_29_2();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70E500);
      uint64_t v84 = sub_1884CA0A0();
      sub_18844EF4C(v84, v85, v108);
      v107[0] = v86;
      OUTLINED_FUNCTION_246();
      OUTLINED_FUNCTION_88_3();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_42_6(&dword_18840C000, v87, v88, "%{public}s/%s: Tunnel connection path interface name: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_11();
    }

    OUTLINED_FUNCTION_104_0();
    OUTLINED_FUNCTION_12_2();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v89[0]);
    goto LABEL_35;
  }

  unint64_t v26 = 0LL;
  uint64_t v101 = v22;
  uint64_t v105 = v21;
  uint64_t v92 = v20;
  while (v26 < *(void *)(v20 + 16))
  {
    unint64_t v103 = v26;
    unint64_t v104 = v89;
    unint64_t v100 = (*(unsigned __int8 *)(v22 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
    uint64_t v99 = *(void *)(v22 + 72);
    uint64_t v27 = *(uint64_t (**)(void))(v22 + 16);
    ((void (*)(void *, unint64_t, uint64_t))v27)(v3, v20 + v100 + v99 * v26, v21);
    OUTLINED_FUNCTION_78_4((uint64_t)v3, 0LL);
    OUTLINED_FUNCTION_76_6((uint64_t)v3);
    if (v8) {
      goto LABEL_27;
    }
    v98 = *(void **)(v22 + 32);
    ((void (*)(uint64_t, void *, uint64_t))v98)(v0, v3, v21);
    uint64_t v3 = (void *)sub_1884C9B60();
    os_log_t v102 = v89;
    uint64_t v28 = *(v3 - 1);
    uint64_t v29 = *(void *)(v28 + 64);
    MEMORY[0x1895F8858](v3);
    unint64_t v30 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v31 = (char *)v89 - v30;
    uint64_t v32 = sub_1884C9B78();
    MEMORY[0x1895F8858](v32);
    uint64_t v33 = *MEMORY[0x1896088F8];
    v97 = *(void (**)(char *, uint64_t, void *))(v28 + 104);
    v97((char *)v89 - v30, v33, v3);
    sub_18841729C(&qword_18C70FAB8, (uint64_t (*)(uint64_t))MEMORY[0x189608908], MEMORY[0x189608910]);
    uint64_t v96 = v34;
    uint64_t v19 = sub_1884CA034();
    OUTLINED_FUNCTION_58_7((uint64_t)v89 - v30);
    uint64_t v35 = OUTLINED_FUNCTION_58_7((uint64_t)v89 - v30);
    uint64_t v36 = v105;
    uint64_t v37 = MEMORY[0x1895F8858](v35);
    unint64_t v45 = OUTLINED_FUNCTION_25_11(v37, v38, v39, v40, v41, v42, v43, v44, v89[0]);
    uint64_t v46 = v27(v45);
    if ((v19 & 1) == 0)
    {
      uint64_t v49 = (*(uint64_t (**)(char *, uint64_t))(v101 + 8))((char *)v89 - v30, v36);
      uint64_t v2 = v93;
      uint64_t v5 = v94;
LABEL_18:
      uint64_t v51 = MEMORY[0x1895F8858](v49);
      os_log_type_t v59 = OUTLINED_FUNCTION_25_11(v51, v52, v53, v54, v55, v56, v57, v58, v89[0]);
      uint64_t v3 = v98;
      ((void (*)(char *))v98)(v59);
      uint64_t v0 = v107[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        uint64_t v19 = (uint64_t)v107;
        OUTLINED_FUNCTION_52_8(0LL, *(void *)(v0 + 16) + 1LL);
        uint64_t v0 = v107[0];
      }

      unint64_t v61 = *(void *)(v0 + 16);
      unint64_t v60 = *(void *)(v0 + 24);
      if (v61 >= v60 >> 1)
      {
        uint64_t v19 = (uint64_t)v107;
        OUTLINED_FUNCTION_52_8(v60 > 1, v61 + 1);
        uint64_t v0 = v107[0];
      }

      *(void *)(v0 + 16) = v61 + 1;
      uint64_t v21 = v105;
      uint64_t v50 = ((uint64_t (*)(unint64_t, char *, uint64_t))v3)(v0 + v100 + v61 * v99, v31, v105);
      v107[0] = v0;
      uint64_t v22 = v101;
      goto LABEL_23;
    }

    MEMORY[0x1895F8858](v46);
    os_log_t v102 = v89;
    uint64_t v47 = sub_1884C9B78();
    MEMORY[0x1895F8858](v47);
    v97((char *)v89 - v30, *MEMORY[0x189608900], v3);
    uint64_t v19 = sub_1884CA034();
    OUTLINED_FUNCTION_58_7((uint64_t)v89 - v30);
    OUTLINED_FUNCTION_58_7((uint64_t)v89 - v30);
    uint64_t v21 = v105;
    uint64_t v22 = v101;
    uint64_t v48 = *(uint64_t (**)(char *, uint64_t))(v101 + 8);
    uint64_t v49 = v48(v31, v105);
    uint64_t v2 = v93;
    uint64_t v5 = v94;
    if ((v19 & 1) == 0) {
      goto LABEL_18;
    }
    uint64_t v50 = v48((char *)v0, v21);
LABEL_23:
    unint64_t v62 = v103 + 1;
    MEMORY[0x1895F8858](v50);
    OUTLINED_FUNCTION_33_7();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70EAE0);
    OUTLINED_FUNCTION_28_9();
    MEMORY[0x1895F8858](v63);
    OUTLINED_FUNCTION_48_7();
    BOOL v8 = v64 == v62;
    uint64_t v20 = v92;
    if (v8) {
      goto LABEL_25;
    }
  }

  __break(1u);
LABEL_37:
  swift_once();
LABEL_9:
  sub_1884C9824();
LABEL_35:
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1884A54E8()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  if (v1 == 3)
  {
    uint64_t v4 = *(void (**)(char *))(v0 + 88);
    if (v4)
    {
      char v6 = 1;
      swift_retain();
      v4(&v6);
      sub_188426020((uint64_t)v4);
    }

    return sub_1884A5828(0LL, 0LL);
  }

  else if (v1 == 2)
  {
    uint64_t v2 = *(void (**)(char *))(v0 + 88);
    if (v2)
    {
      char v5 = 0;
      swift_retain();
      v2(&v5);
      return sub_188426020((uint64_t)v2);
    }
  }

  return result;
}

void sub_1884A55A0()
{
  uint64_t v0 = swift_retain();
  sub_1884A55F0(v0);
}

void sub_1884A55C8()
{
}

void sub_1884A55F0(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  swift_release();
  OUTLINED_FUNCTION_26();
}

void sub_1884A5628()
{
}

void sub_1884A565C()
{
}

void sub_1884A5684()
{
  uint64_t v0 = swift_retain();
  sub_1884A56D4(v0);
}

void sub_1884A56AC()
{
}

void sub_1884A56D4(uint64_t a1)
{
  *(void *)(v1 + 4sub_188455A4C(v0, v1, 0) = a1;
  swift_release();
  OUTLINED_FUNCTION_26();
}

void sub_1884A570C()
{
}

void sub_1884A5740()
{
  uint64_t v0 = swift_retain();
  sub_1884A5790(v0);
}

void sub_1884A5768()
{
}

void sub_1884A5790(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  swift_release();
  OUTLINED_FUNCTION_26();
}

void sub_1884A57C8()
{
}

void QUICTunnelConnection.tunnelIdentifier.getter()
{
}

uint64_t QUICTunnelConnection.identifier.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_50_6(*(void *)(v1 + 80), a1);
}

uint64_t sub_1884A5828(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 88);
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = a2;
  return sub_188426020(v3);
}

uint64_t QUICTunnelConnection.__allocating_init(tunnelIdentifier:group:options:)()
{
  uint64_t v2 = OUTLINED_FUNCTION_19_0();
  uint64_t v3 = OUTLINED_FUNCTION_305_0();
  QUICTunnelConnection.init(tunnelIdentifier:group:options:)(v3, v4, v1, v0);
  return v2;
}

uint64_t QUICTunnelConnection.init(tunnelIdentifier:group:options:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_WORD *)(v4 + 16) = 0;
  *(void *)(v4 + 4sub_188455A4C(v0, v1, 0) = 0LL;
  *(void *)(v4 + 48) = 0LL;
  *(void *)(v4 + 88) = 0LL;
  *(void *)(v4 + 96) = 0LL;
  uint64_t v10 = OUTLINED_FUNCTION_90_3();
  OUTLINED_FUNCTION_16_12(v10, v11, v12, v13, v14, v15, v16, v17, v20, v21, v22, v23);
  if (!v5)
  {
    if (v24 <= 8)
    {
      *(void *)(v10 + 16) = v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C70EA50);
      sub_188459640((unint64_t *)&qword_18C70EA58, &qword_18C70EA50);
      *(void *)(v4 + 72) = sub_1884CA148();
      *(void *)(v4 + 8sub_188455A4C(v0, v1, 0) = v18;
      *(void *)(v4 + 56) = a1;
      *(void *)(v4 + 64) = a2;
      *(void *)(v4 + 24) = a3;
      *(void *)(v4 + 32) = a4;
      return v4;
    }

    __break(1u);
  }

  if (v24 > 8) {
    __break(1u);
  }
  *(void *)(v10 + 16) = v24;
  uint64_t result = OUTLINED_FUNCTION_115();
  __break(1u);
  return result;
}

uint64_t sub_1884A5968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(v3 + 48);
  if (!v7)
  {
    sub_1884CA25C();
    if (qword_18C70D740 == -1) {
      goto LABEL_11;
    }
    goto LABEL_15;
  }

  unint64_t v8 = *(void *)(a1 + 16);
  if (v8 >> 60)
  {
    __break(1u);
LABEL_15:
    swift_once();
LABEL_11:
    uint64_t v25 = (os_log_s *)qword_18C70FAB0;
    uint64_t result = OUTLINED_FUNCTION_75_2();
    if ((_DWORD)result)
    {
      OUTLINED_FUNCTION_20_2();
      uint64_t v26 = OUTLINED_FUNCTION_4_7();
      uint64_t v47 = OUTLINED_FUNCTION_4_7();
      *(_DWORD *)uint64_t v26 = 136446466;
      uint64_t v27 = OUTLINED_FUNCTION_6_7();
      OUTLINED_FUNCTION_44_8(v27, v28, &v47);
      OUTLINED_FUNCTION_246();
      OUTLINED_FUNCTION_58_0();
      *(_WORD *)(v26 + 12) = 2080;
      OUTLINED_FUNCTION_7_13();
      uint64_t aBlock = v29;
      uint64_t v42 = v30;
      OUTLINED_FUNCTION_30_10();
      OUTLINED_FUNCTION_46_8();
      OUTLINED_FUNCTION_179();
      OUTLINED_FUNCTION_18_15(aBlock, v31, &v47);
      uint64_t aBlock = v32;
      OUTLINED_FUNCTION_81_3();
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_24_9( &dword_18840C000,  v25,  (os_log_type_t)v7,  "%{public}s/%s: Tunnel stream trying to send packets on a nil datagram stream");
      OUTLINED_FUNCTION_12_11();
      OUTLINED_FUNCTION_0_11();
    }

    return result;
  }

  OUTLINED_FUNCTION_20_2();
  uint64_t v9 = OUTLINED_FUNCTION_4_7();
  if (v8)
  {
    uint64_t v34 = a2;
    uint64_t v37 = a3;
    swift_bridgeObjectRetain();
    unint64_t v35 = v8;
    uint64_t v36 = a1;
    uint64_t v10 = (unint64_t *)(a1 + 120);
    uint64_t v33 = v9;
    uint64_t v11 = (uint64_t *)v9;
    while (1)
    {
      unint64_t v39 = v8;
      uint64_t v40 = v11;
      uint64_t v13 = *(v10 - 7);
      unint64_t v12 = *(v10 - 6);
      uint64_t v15 = *(v10 - 5);
      unint64_t v14 = *(v10 - 4);
      uint64_t v16 = *(v10 - 3);
      unint64_t v17 = *(v10 - 2);
      uint64_t v18 = *(v10 - 1);
      unint64_t v19 = *v10;
      sub_18841E590(v13, v12);
      sub_18841E590(v15, v14);
      uint64_t v38 = v16;
      sub_188459598(v16, v17);
      sub_18841E590(v18, v19);
      uint64_t v20 = (void *)sub_1884C971C();
      uint64_t v21 = NWCreateDispatchDataFromNSData();

      if (!v21) {
        break;
      }
      v10 += 12;
      *uint64_t v40 = v21;
      uint64_t v11 = v40 + 1;
      sub_18842A58C(v13, v12);
      sub_18842A58C(v15, v14);
      sub_1884595C4(v38, v17);
      sub_18842A58C(v18, v19);
      unint64_t v8 = v39 - 1;
      if (v39 == 1)
      {
        a1 = v36;
        swift_bridgeObjectRelease();
        a3 = v37;
        a2 = v34;
        unint64_t v8 = v35;
        uint64_t v9 = v33;
        goto LABEL_8;
      }
    }

    __break(1u);
  }

  else
  {
LABEL_8:
    MEMORY[0x1895C63D0]();
    OUTLINED_FUNCTION_34_8();
    if (!HIDWORD(v8))
    {
      uint64_t v22 = (void *)OUTLINED_FUNCTION_19_0();
      v22[2] = v9;
      v22[3] = a1;
      v22[4] = a2;
      v22[5] = a3;
      unint64_t v45 = sub_1884A9B24;
      uint64_t v46 = v22;
      uint64_t aBlock = MEMORY[0x1895F87A8];
      uint64_t v42 = 1107296256LL;
      uint64_t v43 = sub_1884A19B4;
      uint64_t v44 = &block_descriptor_12;
      uint64_t v23 = _Block_copy(&aBlock);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_347();
      OUTLINED_FUNCTION_16_5();
      nw_connection_write_multiple();
      OUTLINED_FUNCTION_34_8();
      _Block_release(v23);
      return swift_unknownObjectRelease();
    }
  }

  uint64_t result = sub_1884CA5D4();
  __break(1u);
  return result;
}

void sub_1884A5D10(int a1, uint64_t a2, uint64_t a3, void (*a4)(void *))
{
  if (a1)
  {
    uint64_t v7 = sub_1884C9554();
    uint64_t v8 = *(void *)(v7 - 8);
    MEMORY[0x1895F8858](v7);
    uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    sub_1884C9FD4();
    sub_1884C9530();
    uint64_t v11 = (void *)sub_1884C9548();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  a4(v11);
}

uint64_t sub_1884A5E44(uint64_t a1, void (*a2)(void *))
{
  uint64_t result = OUTLINED_FUNCTION_4_6();
  if (*(void *)(v2 + 40))
  {
    OUTLINED_FUNCTION_235();
    sub_1884A19EC(a1, a2);
    return OUTLINED_FUNCTION_302();
  }

  return result;
}

uint64_t sub_1884A5EB0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(v2 + 48))
  {
    uint64_t v5 = OUTLINED_FUNCTION_19_0();
    *(void *)(v5 + 16) = MEMORY[0x18961AFE8];
    uint64_t v6 = OUTLINED_FUNCTION_2_3();
    MEMORY[0x1895C63D0](v6);
    uint64_t v7 = OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_369_0();
    uint64_t v8 = (void *)OUTLINED_FUNCTION_19_0();
    v8[2] = v7;
    v8[3] = a1;
    v8[4] = a2;
    v8[5] = v5;
    uint64_t v23 = sub_1884A9B8C;
    uint64_t v24 = v8;
    uint64_t v19 = MEMORY[0x1895F87A8];
    uint64_t v20 = 1107296256LL;
    uint64_t v21 = sub_1884A67F8;
    uint64_t v22 = &block_descriptor_35;
    uint64_t v9 = _Block_copy(&v19);
    OUTLINED_FUNCTION_235();
    OUTLINED_FUNCTION_80_1();
    OUTLINED_FUNCTION_295();
    nw_connection_receive_multiple();
    OUTLINED_FUNCTION_16_5();
    _Block_release(v9);
    OUTLINED_FUNCTION_34_8();
    return swift_unknownObjectRelease();
  }

  else
  {
    sub_1884CA25C();
    if (qword_18C70D740 != -1) {
      swift_once();
    }
    uint64_t v11 = (os_log_s *)qword_18C70FAB0;
    uint64_t result = OUTLINED_FUNCTION_71_5();
    if ((_DWORD)result)
    {
      OUTLINED_FUNCTION_20_2();
      uint64_t v12 = OUTLINED_FUNCTION_4_7();
      uint64_t v25 = OUTLINED_FUNCTION_4_7();
      *(_DWORD *)uint64_t v12 = 136446466;
      uint64_t v13 = OUTLINED_FUNCTION_6_7();
      OUTLINED_FUNCTION_44_8(v13, v14, &v25);
      OUTLINED_FUNCTION_246();
      OUTLINED_FUNCTION_58_0();
      *(_WORD *)(v12 + 12) = 2080;
      OUTLINED_FUNCTION_7_13();
      uint64_t v19 = v15;
      uint64_t v20 = v16;
      OUTLINED_FUNCTION_30_10();
      OUTLINED_FUNCTION_46_8();
      OUTLINED_FUNCTION_179();
      OUTLINED_FUNCTION_18_15(v19, v17, &v25);
      uint64_t v19 = v18;
      OUTLINED_FUNCTION_81_3();
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_24_9( &dword_18840C000,  v11,  (os_log_type_t)a2,  "%{public}s/%s: Tunnel stream trying to receive packets on a nil datagram stream");
      OUTLINED_FUNCTION_12_11();
      OUTLINED_FUNCTION_0_11();
    }
  }

  return result;
}

uint64_t sub_1884A6120( uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void (*a6)(void *, uint64_t), uint64_t a7, uint64_t a8)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (a4)
    {
      uint64_t v14 = sub_1884C9E18();
      uint64_t v15 = (uint64_t (*)(uint64_t))MEMORY[0x189608CC8];
      uint64_t v16 = *(void *)(v14 - 8);
      MEMORY[0x1895F8858](v14);
      uint64_t v18 = (char *)v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      swift_unknownObjectRetain();
      sub_1884C9E24();
      sub_18841729C(qword_18C70FAA0, v15, MEMORY[0x189608CE8]);
      uint64_t v19 = (void *)swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v16 + 16))(v20, v18, v14);
      a6(v19, 1LL);

      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v14);
    }

    else
    {
      uint64_t v21 = NWCreateNSDataFromDispatchData();
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        uint64_t v23 = sub_1884C9734();
        unint64_t v25 = v24;

        sub_18841E590(v23, v25);
        TunnelPacket.init(data:)(v23, v25, (uint64_t)&v62);
        v48[1] = a7;
        uint64_t v49 = a6;
        uint64_t v60 = v23;
        unint64_t v61 = v25;
        uint64_t v27 = (uint64_t *)(a8 + 16);
        int v58 = v62;
        uint64_t v57 = v63;
        uint64_t v56 = v64;
        int v55 = v65;
        uint64_t v29 = v66;
        unint64_t v28 = v67;
        uint64_t v53 = v66;
        unint64_t v54 = v67;
        uint64_t v31 = v68;
        unint64_t v30 = v69;
        uint64_t v52 = v68;
        uint64_t v32 = v70;
        uint64_t v59 = v70;
        unint64_t v50 = v71;
        uint64_t v33 = v72;
        unint64_t v34 = v73;
        uint64_t v51 = v72;
        swift_beginAccess();
        sub_18841E590(v29, v28);
        unint64_t v35 = v30;
        sub_18841E590(v31, v30);
        uint64_t v36 = v32;
        unint64_t v37 = v50;
        sub_188459598(v36, v50);
        unint64_t v38 = v34;
        sub_18841E590(v33, v34);
        sub_188493660();
        uint64_t v39 = *(void *)(*v27 + 16);
        sub_188493734(v39);
        uint64_t v40 = *v27;
        *(void *)(v40 + 16) = v39 + 1;
        uint64_t v41 = v40 + 96 * v39;
        *(_DWORD *)(v41 + 32) = v58;
        uint64_t v42 = v56;
        *(void *)(v41 + 4sub_188455A4C(v0, v1, 0) = v57;
        *(void *)(v41 + 48) = v42;
        *(_BYTE *)(v41 + 56) = v55;
        uint64_t v43 = v53;
        unint64_t v44 = v54;
        *(void *)(v41 + 64) = v53;
        *(void *)(v41 + 72) = v44;
        uint64_t v45 = v52;
        *(void *)(v41 + 8sub_188455A4C(v0, v1, 0) = v52;
        *(void *)(v41 + 88) = v35;
        *(void *)(v41 + 96) = v59;
        *(void *)(v41 + 104) = v37;
        uint64_t v46 = v51;
        *(void *)(v41 + 112) = v51;
        *(void *)(v41 + 12sub_188455A4C(v0, v1, 0) = v38;
        swift_endAccess();
        sub_18842A58C(v43, v44);
        sub_18842A58C(v45, v35);
        sub_1884595C4(v59, v37);
        sub_18842A58C(v46, v38);
        if ((a3 & 1) != 0)
        {
          swift_beginAccess();
          uint64_t v47 = swift_bridgeObjectRetain();
          v49((void *)v47, 0LL);
          swift_release();
          sub_18842A58C(v60, v61);
          return swift_bridgeObjectRelease();
        }

        else
        {
          swift_release();
          return sub_18842A58C(v60, v61);
        }
      }

      else
      {
        sub_18842E9B8();
        sub_1884CA8C8();
        uint64_t v74 = v62;
        uint64_t v75 = v63;
        sub_18842FF50();
        uint64_t v26 = (void *)swift_allocError();
        sub_1884CA910();
        a6(v26, 1LL);

        return swift_release();
      }
    }
  }

  return result;
}

void sub_1884A67F8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  id v10 = a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v9(a2, a3, a4, a5);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

void sub_1884A6890(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 40);
  if (v5)
  {
    uint64_t v6 = (void *)OUTLINED_FUNCTION_19_0();
    v6[2] = a1;
    v6[3] = a2;
    v6[4] = v5;
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_124();
    sub_1884A3134();
    OUTLINED_FUNCTION_16_5();
    OUTLINED_FUNCTION_302();
  }

  OUTLINED_FUNCTION_5();
}

uint64_t sub_1884A6910()
{
  if (*(void *)(v0 + 40))
  {
    OUTLINED_FUNCTION_80_1();
    sub_1884C9C74();
    OUTLINED_FUNCTION_34_8();
  }

  OUTLINED_FUNCTION_4_6();
  if (*(void *)(v0 + 48))
  {
    OUTLINED_FUNCTION_2_3();
    sub_1884C9C74();
    OUTLINED_FUNCTION_16_5();
  }

  sub_1884A56D4(0LL);
  sub_1884A5790(0LL);
  *(_WORD *)(v0 + 16) = 3;
  return sub_1884A54E8();
}

uint64_t sub_1884A69BC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)OUTLINED_FUNCTION_19_0();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  id v7 = a1;
  OUTLINED_FUNCTION_2_3();
  sub_1884A5828((uint64_t)sub_1884A9BE8, (uint64_t)v6);
  OUTLINED_FUNCTION_4_6();
  uint64_t v8 = OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_369_0();
  uint64_t v9 = OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_345();
  id v10 = (void *)OUTLINED_FUNCTION_19_0();
  v10[2] = v8;
  v10[3] = v9;
  v10[4] = v7;
  id v11 = v7;
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_347();
  OUTLINED_FUNCTION_189();
  sub_188425FE0((uint64_t)sub_1884A9C40);
  sub_1884C9DA0();
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_264();
  OUTLINED_FUNCTION_295();
  OUTLINED_FUNCTION_355();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_369_0();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_235();
  uint64_t v12 = OUTLINED_FUNCTION_305_0();
  sub_188425FE0(v12);
  OUTLINED_FUNCTION_305_0();
  sub_1884C9DAC();
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_2_3();
  sub_1884C9DC4();
  return OUTLINED_FUNCTION_16_5();
}

void sub_1884A6B3C()
{
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  v22[0] = v9;
  char v11 = *v10;
  uint64_t v12 = OUTLINED_FUNCTION_19_0();
  *(void *)(v12 + 16) = v8;
  *(void *)(v12 + 24) = v6;
  *(_BYTE *)(v12 + 32) = v11;
  v23[4] = v4;
  v23[5] = v12;
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 1107296256LL;
  v23[2] = sub_1884530E8;
  v23[3] = v2;
  uint64_t v13 = _Block_copy(v23);
  uint64_t v14 = sub_1884C9F14();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1895F8858](v14);
  uint64_t v17 = (char *)v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  OUTLINED_FUNCTION_189();
  sub_1884C9EFC();
  uint64_t v18 = sub_1884C9EE4();
  MEMORY[0x1895F8858](v18);
  OUTLINED_FUNCTION_32_0();
  v22[1] = MEMORY[0x18961AFE8];
  sub_18841729C((unint64_t *)&qword_18C4DDA40, v19, MEMORY[0x18961B6C0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C4DDAB0);
  sub_188459640((unint64_t *)&qword_18C4DDAC0, (uint64_t *)&unk_18C4DDAB0);
  sub_1884CA484();
  MEMORY[0x1895C6AC0](0LL, v17, v0, v13);
  _Block_release(v13);
  uint64_t v20 = OUTLINED_FUNCTION_102_1();
  v21(v20);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  swift_release();
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1884A6CE0(uint64_t a1)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (!Strong) {
      return swift_release();
    }
    uint64_t v5 = Strong;
    uint64_t v6 = sub_1884C9DB8();
    uint64_t v74 = &v67;
    uint64_t v7 = *(void *)(v6 - 8);
    uint64_t v8 = *(void *)(v7 + 64);
    MEMORY[0x1895F8858](v6);
    uint64_t v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    id v10 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v10(v9, a1, v6);
    uint64_t v11 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
    if (MEMORY[0x189608C60] && (_DWORD)v11 == *MEMORY[0x189608C60])
    {
      (*(void (**)(char *, uint64_t))(v7 + 96))((char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL), v6);
      uint64_t v12 = sub_1884C9E18();
      unint64_t v73 = &v67;
      uint64_t v13 = *(void *)(v12 - 8);
      uint64_t v14 = *(void *)(v13 + 64);
      MEMORY[0x1895F8858](v12);
      unint64_t v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v16 = (char *)&v67 - v15;
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))((char *)&v67 - v15, v9, v12);
      uint64_t v17 = sub_1884CA274();
      os_log_type_t v18 = v17;
      if (qword_18C70D740 != -1) {
        uint64_t v17 = swift_once();
      }
      uint64_t v19 = (os_log_s *)qword_18C70FAB0;
      MEMORY[0x1895F8858](v17);
      uint64_t v20 = (char *)&v67 - v15;
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v20, v16, v12);
      swift_retain();
      int v21 = v18;
      os_log_t v71 = v19;
      if (os_log_type_enabled(v19, v18))
      {
        swift_retain();
        uint64_t v22 = swift_slowAlloc();
        uint64_t v69 = swift_slowAlloc();
        uint64_t v77 = (void *)v69;
        *(_DWORD *)uint64_t v22 = 136446722;
        LODWORD(v68) = v21;
        uint64_t v72 = v5;
        uint64_t v70 = &v67;
        uint64_t v24 = *(void *)(v3 + 56);
        unint64_t v23 = *(void *)(v3 + 64);
        swift_bridgeObjectRetain();
        sub_18844EF4C(v24, v23, (uint64_t *)&v77);
        uint64_t v75 = v25;
        sub_1884CA430();
        swift_bridgeObjectRelease();
        *(_WORD *)(v22 + 12) = 2080;
        uint64_t v75 = 0x5F6E6F6374LL;
        unint64_t v76 = 0xE500000000000000LL;
        swift_bridgeObjectRetain();
        sub_1884CA0E8();
        swift_bridgeObjectRelease();
        sub_18844EF4C(v75, v76, (uint64_t *)&v77);
        uint64_t v75 = v26;
        sub_1884CA430();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v22 + 22) = 2080;
        sub_18841729C(qword_18C70FAA0, (uint64_t (*)(uint64_t))MEMORY[0x189608CC8], MEMORY[0x189608CE8]);
        uint64_t v27 = sub_1884CA8B0();
        sub_18844EF4C(v27, v28, (uint64_t *)&v77);
        uint64_t v75 = v29;
        sub_1884CA430();
        swift_bridgeObjectRelease();
        unint64_t v30 = *(void (**)(char *, uint64_t))(v13 + 8);
        v30(v20, v12);
        _os_log_impl( &dword_18840C000,  v71,  (os_log_type_t)v68,  "%{public}s/%s: Group tunnel connection waiting, error: %s",  (uint8_t *)v22,  0x20u);
        uint64_t v31 = v69;
        swift_arrayDestroy();
        MEMORY[0x1895C7BD0](v31, -1LL, -1LL);
        MEMORY[0x1895C7BD0](v22, -1LL, -1LL);
        swift_release();
        swift_release();
      }

      else
      {
        swift_release_n();
        swift_release();
        unint64_t v30 = *(void (**)(char *, uint64_t))(v13 + 8);
        v30(v20, v12);
      }

      return ((uint64_t (*)(char *, uint64_t))v30)(v16, v12);
    }

    else
    {
      if (!MEMORY[0x189608C58] || (_DWORD)v11 != *MEMORY[0x189608C58])
      {
        if (MEMORY[0x189608C50] && (_DWORD)v11 == *MEMORY[0x189608C50])
        {
          os_log_type_t v51 = sub_1884CA274();
          if (qword_18C70D740 != -1) {
            swift_once();
          }
          uint64_t v52 = (os_log_s *)qword_18C70FAB0;
          swift_retain_n();
          if (os_log_type_enabled(v52, v51))
          {
            uint64_t v53 = swift_slowAlloc();
            uint64_t v54 = swift_slowAlloc();
            uint64_t v77 = (void *)v54;
            *(_DWORD *)uint64_t v53 = 136446466;
            uint64_t v55 = *(void *)(v3 + 56);
            unint64_t v56 = *(void *)(v3 + 64);
            swift_bridgeObjectRetain();
            sub_18844EF4C(v55, v56, (uint64_t *)&v77);
            uint64_t v75 = v57;
            sub_1884CA430();
            swift_bridgeObjectRelease();
            *(_WORD *)(v53 + 12) = 2080;
            uint64_t v75 = 0x5F6E6F6374LL;
            unint64_t v76 = 0xE500000000000000LL;
            swift_bridgeObjectRetain();
            sub_1884CA0E8();
            swift_bridgeObjectRelease();
            sub_18844EF4C(v75, v76, (uint64_t *)&v77);
            uint64_t v75 = v58;
            sub_1884CA430();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl( &dword_18840C000,  v52,  v51,  "%{public}s/%s: Group tunnel connection setup",  (uint8_t *)v53,  0x16u);
            swift_arrayDestroy();
            MEMORY[0x1895C7BD0](v54, -1LL, -1LL);
            MEMORY[0x1895C7BD0](v53, -1LL, -1LL);
            swift_release();
          }

          else
          {
            swift_release_n();
          }
        }

        else
        {
          if (MEMORY[0x189608C48] && (_DWORD)v11 == *MEMORY[0x189608C48])
          {
            swift_beginAccess();
            swift_retain();
            sub_1884A7BC0();
            swift_release();
            swift_retain();
            sub_1884A7BC0();
            swift_release();
          }

          else
          {
            if (!MEMORY[0x189608C68] || (_DWORD)v11 != *MEMORY[0x189608C68])
            {
              MEMORY[0x1895F8858](v11);
              v10((char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL), a1, v6);
              uint64_t v75 = 0LL;
              unint64_t v76 = 0xE000000000000000LL;
              sub_1884CA4D8();
              sub_1884CA0E8();
              sub_1884CA598();
              uint64_t result = sub_1884CA5E0();
              __break(1u);
              return result;
            }

            os_log_type_t v59 = sub_1884CA274();
            if (qword_18C70D740 != -1) {
              swift_once();
            }
            uint64_t v60 = (os_log_s *)qword_18C70FAB0;
            if (os_log_type_enabled((os_log_t)qword_18C70FAB0, v59))
            {
              swift_retain_n();
              uint64_t v61 = swift_slowAlloc();
              uint64_t v62 = swift_slowAlloc();
              uint64_t v77 = (void *)v62;
              *(_DWORD *)uint64_t v61 = 136446466;
              uint64_t v63 = *(void *)(v3 + 56);
              unint64_t v64 = *(void *)(v3 + 64);
              swift_bridgeObjectRetain();
              sub_18844EF4C(v63, v64, (uint64_t *)&v77);
              uint64_t v75 = v65;
              sub_1884CA430();
              swift_bridgeObjectRelease();
              *(_WORD *)(v61 + 12) = 2080;
              uint64_t v75 = 0x5F6E6F6374LL;
              unint64_t v76 = 0xE500000000000000LL;
              swift_bridgeObjectRetain();
              sub_1884CA0E8();
              swift_bridgeObjectRelease();
              sub_18844EF4C(v75, v76, (uint64_t *)&v77);
              uint64_t v75 = v66;
              sub_1884CA430();
              swift_release_n();
              swift_bridgeObjectRelease();
              _os_log_impl( &dword_18840C000,  v60,  v59,  "%{public}s/%s: Group tunnel connection cancelled",  (uint8_t *)v61,  0x16u);
              swift_arrayDestroy();
              MEMORY[0x1895C7BD0](v62, -1LL, -1LL);
              MEMORY[0x1895C7BD0](v61, -1LL, -1LL);
            }

            sub_1884A6910();
          }

          swift_release();
        }

        return swift_release();
      }

      (*(void (**)(char *, uint64_t))(v7 + 96))((char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL), v6);
      uint64_t v32 = sub_1884C9E18();
      unint64_t v73 = &v67;
      uint64_t v33 = *(void *)(v32 - 8);
      uint64_t v34 = *(void *)(v33 + 64);
      MEMORY[0x1895F8858](v32);
      unint64_t v35 = (v34 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v36 = (char *)&v67 - v35;
      (*(void (**)(char *, char *, uint64_t))(v33 + 32))((char *)&v67 - v35, v9, v32);
      uint64_t v37 = sub_1884CA25C();
      os_log_type_t v38 = v37;
      if (qword_18C70D740 != -1) {
        uint64_t v37 = swift_once();
      }
      os_log_t v71 = (os_log_t)&v67;
      uint64_t v39 = (os_log_s *)qword_18C70FAB0;
      MEMORY[0x1895F8858](v37);
      uint64_t v40 = (char *)&v67 - v35;
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v40, v36, v32);
      if (os_log_type_enabled(v39, v38))
      {
        swift_retain_n();
        uint64_t v41 = swift_slowAlloc();
        uint64_t v70 = (uint64_t *)swift_slowAlloc();
        uint64_t v77 = v70;
        *(_DWORD *)uint64_t v41 = 136446722;
        LODWORD(v69) = v38;
        uint64_t v72 = v5;
        os_log_t v68 = v39;
        uint64_t v43 = *(void *)(v3 + 56);
        unint64_t v42 = *(void *)(v3 + 64);
        swift_bridgeObjectRetain();
        sub_18844EF4C(v43, v42, (uint64_t *)&v77);
        uint64_t v75 = v44;
        sub_1884CA430();
        swift_bridgeObjectRelease();
        *(_WORD *)(v41 + 12) = 2080;
        uint64_t v75 = 0x5F6E6F6374LL;
        unint64_t v76 = 0xE500000000000000LL;
        swift_bridgeObjectRetain();
        sub_1884CA0E8();
        swift_bridgeObjectRelease();
        sub_18844EF4C(v75, v76, (uint64_t *)&v77);
        uint64_t v75 = v45;
        sub_1884CA430();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v41 + 22) = 2080;
        sub_18841729C(qword_18C70FAA0, (uint64_t (*)(uint64_t))MEMORY[0x189608CC8], MEMORY[0x189608CE8]);
        uint64_t v46 = sub_1884CA8B0();
        sub_18844EF4C(v46, v47, (uint64_t *)&v77);
        uint64_t v75 = v48;
        sub_1884CA430();
        swift_bridgeObjectRelease();
        uint64_t v49 = *(void (**)(char *, uint64_t))(v33 + 8);
        v49(v40, v32);
        _os_log_impl( &dword_18840C000,  v68,  (os_log_type_t)v69,  "%{public}s/%s: Group tunnel connection failed, error: %s",  (uint8_t *)v41,  0x20u);
        unint64_t v50 = v70;
        swift_arrayDestroy();
        MEMORY[0x1895C7BD0](v50, -1LL, -1LL);
        MEMORY[0x1895C7BD0](v41, -1LL, -1LL);
      }

      else
      {
        uint64_t v49 = *(void (**)(char *, uint64_t))(v33 + 8);
        v49(v40, v32);
      }

      sub_1884A6910();
      swift_release();
      swift_release();
      return ((uint64_t (*)(char *, uint64_t))v49)(v36, v32);
    }
  }

  return result;
}

uint64_t sub_1884A79A4()
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    os_log_type_t v2 = sub_1884CA25C();
    if (qword_18C70D740 != -1) {
      swift_once();
    }
    uint64_t v3 = (os_log_s *)qword_18C70FAB0;
    if (os_log_type_enabled((os_log_t)qword_18C70FAB0, v2))
    {
      swift_retain_n();
      uint64_t v4 = swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      uint64_t v8 = v5;
      *(_DWORD *)uint64_t v4 = 136446466;
      uint64_t v6 = *(void *)(v1 + 56);
      unint64_t v7 = *(void *)(v1 + 64);
      swift_bridgeObjectRetain();
      sub_18844EF4C(v6, v7, &v8);
      sub_1884CA430();
      swift_bridgeObjectRelease();
      *(_WORD *)(v4 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1884CA0E8();
      swift_bridgeObjectRelease();
      sub_18844EF4C(0x5F6E6F6374LL, 0xE500000000000000LL, &v8);
      sub_1884CA430();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_18840C000, v3, v2, "%{public}s/%s: Unexpected stream received", (uint8_t *)v4, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1895C7BD0](v5, -1LL, -1LL);
      MEMORY[0x1895C7BD0](v4, -1LL, -1LL);
    }

    return swift_release();
  }

  return result;
}

void sub_1884A7BC0()
{
  os_log_type_t v2 = v1;
  sub_1884C9D64();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70F448);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v3);
  OUTLINED_FUNCTION_32_0();
  uint64_t v4 = sub_1884C9B00();
  __swift_storeEnumTagSinglePayload(v0, 1LL, 1LL, v4);
  uint64_t v5 = sub_1884C9DDC();
  uint64_t v6 = OUTLINED_FUNCTION_102_1();
  sub_188437B70(v6, v7);
  if (v5)
  {
    sub_1884A7DB4(v5, v2 & 1);
    OUTLINED_FUNCTION_264();
  }

  else
  {
    sub_1884CA25C();
    if (qword_18C70D740 != -1) {
      swift_once();
    }
    uint64_t v8 = (os_log_s *)qword_18C70FAB0;
    if (OUTLINED_FUNCTION_71_5())
    {
      OUTLINED_FUNCTION_20_2();
      uint64_t v9 = OUTLINED_FUNCTION_4_7();
      uint64_t v15 = OUTLINED_FUNCTION_4_7();
      *(_DWORD *)uint64_t v9 = 136446466;
      uint64_t v10 = OUTLINED_FUNCTION_6_7();
      OUTLINED_FUNCTION_44_8(v10, v11, &v15);
      OUTLINED_FUNCTION_246();
      OUTLINED_FUNCTION_58_0();
      *(_WORD *)(v9 + 12) = 2080;
      OUTLINED_FUNCTION_7_13();
      uint64_t v14 = v12;
      OUTLINED_FUNCTION_30_10();
      OUTLINED_FUNCTION_46_8();
      OUTLINED_FUNCTION_179();
      OUTLINED_FUNCTION_18_15(v14, v13, &v15);
      OUTLINED_FUNCTION_81_3();
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_24_9( &dword_18840C000,  v8,  v2,  "%{public}s/%s: Can't extract a stream from the group connection");
      OUTLINED_FUNCTION_12_11();
      OUTLINED_FUNCTION_0_11();
    }

    sub_1884A6910();
  }

  OUTLINED_FUNCTION_17();
}

uint64_t sub_1884A7DB4(uint64_t a1, char a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_27_8();
  uint64_t v5 = OUTLINED_FUNCTION_19_0();
  *(void *)(v5 + 16) = v4;
  *(_BYTE *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = a1;
  OUTLINED_FUNCTION_189();
  OUTLINED_FUNCTION_2_3();
  sub_188425FE0((uint64_t)sub_1884AA19C);
  sub_1884C9C08();
  OUTLINED_FUNCTION_295();
  OUTLINED_FUNCTION_355();
  uint64_t v6 = OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_27_8();
  uint64_t v7 = OUTLINED_FUNCTION_19_0();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = a1;
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_235();
  sub_188425FE0((uint64_t)sub_1884AA1D4);
  sub_1884C9C14();
  OUTLINED_FUNCTION_302();
  OUTLINED_FUNCTION_34_8();
  return sub_1884C9C5C();
}

uint64_t sub_1884A7EC4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = (os_log_s *)sub_1884C9C50();
    uint64_t v101 = &v93;
    uint64_t v10 = *((void *)v9 - 1);
    uint64_t v11 = *(void *)(v10 + 64);
    MEMORY[0x1895F8858](v9);
    uint64_t v12 = (char *)&v93 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = *(void (**)(char *, uint64_t, os_log_s *))(v10 + 16);
    v13(v12, a1, v9);
    uint64_t v14 = (*(uint64_t (**)(char *, os_log_s *))(v10 + 88))(v12, v9);
    if (MEMORY[0x189608A48] && (_DWORD)v14 == *MEMORY[0x189608A48])
    {
      LODWORD(v99) = a3;
      uint64_t v100 = a4;
      (*(void (**)(char *, os_log_s *))(v10 + 96))((char *)&v93 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL), v9);
      uint64_t v15 = sub_1884C9E18();
      v98 = &v93;
      uint64_t v16 = *(void *)(v15 - 8);
      uint64_t v17 = *(void *)(v16 + 64);
      MEMORY[0x1895F8858](v15);
      unint64_t v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v19 = (char *)&v93 - v18;
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))((char *)&v93 - v18, v12, v15);
      uint64_t v20 = sub_1884CA274();
      os_log_type_t v21 = v20;
      if (qword_18C70D740 != -1) {
        uint64_t v20 = swift_once();
      }
      uint64_t v22 = (os_log_s *)qword_18C70FAB0;
      MEMORY[0x1895F8858](v20);
      unint64_t v23 = (char *)&v93 - v18;
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))((char *)&v93 - v18, (char *)&v93 - v18, v15);
      os_log_t v97 = v22;
      if (os_log_type_enabled(v22, v21))
      {
        swift_retain_n();
        uint64_t v24 = swift_slowAlloc();
        os_log_t v96 = (os_log_t)swift_slowAlloc();
        os_log_t v104 = v96;
        *(_DWORD *)uint64_t v24 = 136446978;
        int v95 = v21;
        uint64_t v25 = *(void *)(v8 + 56);
        unint64_t v26 = *(void *)(v8 + 64);
        swift_bridgeObjectRetain();
        sub_18844EF4C(v25, v26, (uint64_t *)&v104);
        uint64_t v102 = v27;
        sub_1884CA430();
        swift_bridgeObjectRelease();
        *(_WORD *)(v24 + 12) = 2080;
        uint64_t v94 = v24 + 14;
        uint64_t v102 = 0x5F6E6F6374LL;
        unint64_t v103 = 0xE500000000000000LL;
        swift_bridgeObjectRetain();
        sub_1884CA0E8();
        swift_bridgeObjectRelease();
        sub_18844EF4C(v102, v103, (uint64_t *)&v104);
        uint64_t v102 = v28;
        sub_1884CA430();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v24 + 22) = 1024;
        LODWORD(v102) = v99 & 1;
        sub_1884CA430();
        *(_WORD *)(v24 + 28) = 2080;
        sub_18841729C(qword_18C70FAA0, (uint64_t (*)(uint64_t))MEMORY[0x189608CC8], MEMORY[0x189608CE8]);
        uint64_t v29 = sub_1884CA8B0();
        sub_18844EF4C(v29, v30, (uint64_t *)&v104);
        uint64_t v102 = v31;
        sub_1884CA430();
        swift_bridgeObjectRelease();
        uint64_t v32 = *(void (**)(char *, uint64_t))(v16 + 8);
        v32(v23, v15);
        _os_log_impl( &dword_18840C000,  v97,  (os_log_type_t)v95,  "%{public}s/%s: Tunnel stream (datagram=%{BOOL}d) connection waiting, error: %s",  (uint8_t *)v24,  0x26u);
        os_log_t v33 = v96;
LABEL_14:
        swift_arrayDestroy();
        MEMORY[0x1895C7BD0](v33, -1LL, -1LL);
        MEMORY[0x1895C7BD0](v24, -1LL, -1LL);
LABEL_42:
        sub_1884C9C74();
        sub_1884A6910();
        swift_release();
        return ((uint64_t (*)(char *, uint64_t))v32)(v19, v15);
      }

      goto LABEL_41;
    }

    if (MEMORY[0x189608A40] && (_DWORD)v14 == *MEMORY[0x189608A40])
    {
      LODWORD(v99) = a3;
      uint64_t v100 = a4;
      (*(void (**)(char *, os_log_s *))(v10 + 96))((char *)&v93 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL), v9);
      uint64_t v15 = sub_1884C9E18();
      v98 = &v93;
      uint64_t v16 = *(void *)(v15 - 8);
      uint64_t v34 = *(void *)(v16 + 64);
      MEMORY[0x1895F8858](v15);
      unint64_t v35 = (v34 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v19 = (char *)&v93 - v35;
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))((char *)&v93 - v35, v12, v15);
      uint64_t v36 = sub_1884CA25C();
      os_log_type_t v37 = v36;
      if (qword_18C70D740 != -1) {
        uint64_t v36 = swift_once();
      }
      os_log_type_t v38 = (os_log_s *)qword_18C70FAB0;
      MEMORY[0x1895F8858](v36);
      unint64_t v23 = (char *)&v93 - v35;
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))((char *)&v93 - v35, (char *)&v93 - v35, v15);
      if (os_log_type_enabled(v38, v37))
      {
        swift_retain_n();
        uint64_t v39 = swift_slowAlloc();
        os_log_t v96 = v38;
        uint64_t v24 = v39;
        os_log_t v97 = (os_log_t)swift_slowAlloc();
        os_log_t v104 = v97;
        *(_DWORD *)uint64_t v24 = 136446978;
        int v95 = v37;
        uint64_t v40 = *(void *)(v8 + 56);
        unint64_t v41 = *(void *)(v8 + 64);
        swift_bridgeObjectRetain();
        sub_18844EF4C(v40, v41, (uint64_t *)&v104);
        uint64_t v102 = v42;
        sub_1884CA430();
        swift_bridgeObjectRelease();
        *(_WORD *)(v24 + 12) = 2080;
        uint64_t v94 = v24 + 14;
        uint64_t v102 = 0x5F6E6F6374LL;
        unint64_t v103 = 0xE500000000000000LL;
        swift_bridgeObjectRetain();
        sub_1884CA0E8();
        swift_bridgeObjectRelease();
        sub_18844EF4C(v102, v103, (uint64_t *)&v104);
        uint64_t v102 = v43;
        sub_1884CA430();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v24 + 22) = 1024;
        LODWORD(v102) = v99 & 1;
        sub_1884CA430();
        *(_WORD *)(v24 + 28) = 2080;
        sub_18841729C(qword_18C70FAA0, (uint64_t (*)(uint64_t))MEMORY[0x189608CC8], MEMORY[0x189608CE8]);
        uint64_t v44 = sub_1884CA8B0();
        sub_18844EF4C(v44, v45, (uint64_t *)&v104);
        uint64_t v102 = v46;
        sub_1884CA430();
        swift_bridgeObjectRelease();
        uint64_t v32 = *(void (**)(char *, uint64_t))(v16 + 8);
        v32(v23, v15);
        _os_log_impl( &dword_18840C000,  v96,  (os_log_type_t)v95,  "%{public}s/%s: Tunnel stream (datagram=%{BOOL}d) connection failed, error: %s",  (uint8_t *)v24,  0x26u);
        os_log_t v33 = v97;
        goto LABEL_14;
      }

uint64_t sub_1884A9038(uint64_t result)
{
  if ((result & 1) == 0)
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      uint64_t v1 = result;
      os_log_type_t v2 = sub_1884CA25C();
      if (qword_18C70D740 != -1) {
        swift_once();
      }
      uint64_t v3 = (os_log_s *)qword_18C70FAB0;
      if (os_log_type_enabled((os_log_t)qword_18C70FAB0, v2))
      {
        swift_retain_n();
        uint64_t v4 = swift_slowAlloc();
        uint64_t v5 = swift_slowAlloc();
        uint64_t v8 = v5;
        *(_DWORD *)uint64_t v4 = 136446466;
        uint64_t v6 = *(void *)(v1 + 56);
        unint64_t v7 = *(void *)(v1 + 64);
        swift_bridgeObjectRetain();
        sub_18844EF4C(v6, v7, &v8);
        sub_1884CA430();
        swift_bridgeObjectRelease();
        *(_WORD *)(v4 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_1884CA0E8();
        swift_bridgeObjectRelease();
        sub_18844EF4C(0x5F6E6F6374LL, 0xE500000000000000LL, &v8);
        sub_1884CA430();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl( &dword_18840C000,  v3,  v2,  "%{public}s/%s: Cancelling tunnel connection as it is no longer viable",  (uint8_t *)v4,  0x16u);
        swift_arrayDestroy();
        MEMORY[0x1895C7BD0](v5, -1LL, -1LL);
        MEMORY[0x1895C7BD0](v4, -1LL, -1LL);
      }

      sub_1884C9C74();
      sub_1884A6910();
      return swift_release();
    }
  }

  return result;
}

void sub_1884A926C()
{
  uint64_t v2 = static Data.randomBytes(ofLength:)();
  unint64_t v4 = v3;
  uint64_t v5 = sub_1884C9BFC();
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_9_0();
  uint64_t v7 = OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_345();
  void *v0 = sub_1884AA178;
  v0[1] = (void (*)(uint64_t))v7;
  (*(void (**)(void (**)(uint64_t), void, uint64_t))(v1 + 104))( v0,  *MEMORY[0x1896089B0],  v5);
  sub_1884C9BF0();
  OUTLINED_FUNCTION_91_1();
  sub_1884C9BD8();
  sub_1884C9C38();
  swift_release();
  sub_18842A58C(v2, v4);
  (*(void (**)(void (**)(uint64_t), uint64_t))(v1 + 8))(v0, v5);
  OUTLINED_FUNCTION_355();
  OUTLINED_FUNCTION_17();
}

void sub_1884A9358(uint64_t a1)
{
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = Strong;
    os_log_type_t v4 = sub_1884CA274();
    if (qword_18C70D740 != -1) {
      swift_once();
    }
    uint64_t v5 = (os_log_s *)qword_18C70FAB0;
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C70F628);
    uint64_t v7 = *(void *)(*(void *)(v6 - 8) + 64LL);
    MEMORY[0x1895F8858](v6);
    unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    sub_1884A17E0(a1, (uint64_t)&v20 - v8);
    if (os_log_type_enabled(v5, v4))
    {
      swift_retain_n();
      uint64_t v9 = swift_slowAlloc();
      os_log_t v21 = v5;
      uint64_t v10 = v9;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v26 = v22;
      *(_DWORD *)uint64_t v10 = 136446722;
      uint64_t v20 = v6;
      uint64_t v12 = *(void *)(v3 + 56);
      unint64_t v11 = *(void *)(v3 + 64);
      swift_bridgeObjectRetain();
      sub_18844EF4C(v12, v11, &v26);
      uint64_t v24 = v13;
      sub_1884CA430();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2080;
      unint64_t v23 = &v20;
      uint64_t v24 = 0x5F6E6F6374LL;
      unint64_t v25 = 0xE500000000000000LL;
      swift_bridgeObjectRetain();
      sub_1884CA0E8();
      swift_bridgeObjectRelease();
      sub_18844EF4C(v24, v25, &v26);
      uint64_t v24 = v14;
      sub_1884CA430();
      swift_release_n();
      uint64_t v15 = swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 22) = 2080;
      MEMORY[0x1895F8858](v15);
      sub_1884A17E0((uint64_t)&v20 - v8, (uint64_t)&v20 - v8);
      uint64_t v16 = sub_1884CA0A0();
      sub_18844EF4C(v16, v17, &v26);
      uint64_t v24 = v18;
      sub_1884CA430();
      swift_bridgeObjectRelease();
      sub_188437B70((uint64_t)&v20 - v8, &qword_18C70F628);
      _os_log_impl( &dword_18840C000,  v21,  v4,  "%{public}s/%s: Tunnel datagram stream initial send completed with error %s",  (uint8_t *)v10,  0x20u);
      uint64_t v19 = v22;
      swift_arrayDestroy();
      MEMORY[0x1895C7BD0](v19, -1LL, -1LL);
      MEMORY[0x1895C7BD0](v10, -1LL, -1LL);
      swift_release();
    }

    else
    {
      swift_release();
      sub_188437B70((uint64_t)&v20 - v8, &qword_18C70F628);
    }
  }

uint64_t QUICTunnelConnection.deinit()
{
  return v0;
}

uint64_t QUICTunnelConnection.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1884A96E0@<X0>(void *a1@<X8>)
{
  return QUICTunnelConnection.identifier.getter(a1);
}

uint64_t sub_1884A9700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1884A5968(a1, a2, a3);
}

uint64_t sub_1884A9720(uint64_t a1, void (*a2)(void *))
{
  return sub_1884A5E44(a1, a2);
}

uint64_t sub_1884A9740(uint64_t a1, uint64_t a2)
{
  return sub_1884A5EB0(a1, a2);
}

void sub_1884A9760(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1884A9780()
{
  return sub_1884A6910();
}

uint64_t sub_1884A97A0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1884A69BC(a1, a2, a3);
}

uint64_t sub_1884A97C0()
{
  return sub_1884A4914() & 0x1FFFF;
}

void sub_1884A97EC()
{
}

uint64_t sub_1884A980C(uint64_t (*a1)(void))
{
  return _swift_stdlib_bridgeErrorToNSError();
}

void sub_1884A9828(uint64_t (*a1)(void))
{
}

void sub_1884A9840(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5 = *a1 + 8;
  OUTLINED_FUNCTION_95_1();
  *a1 = v5;
  OUTLINED_FUNCTION_13_16();
}

void sub_1884A988C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5 = *a1 + 2;
  OUTLINED_FUNCTION_95_1();
  *a1 = v5;
  OUTLINED_FUNCTION_13_16();
}

void sub_1884A98D8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5 = *a1 + 4;
  OUTLINED_FUNCTION_95_1();
  *a1 = v5;
  OUTLINED_FUNCTION_13_16();
}

uint64_t sub_1884A9924()
{
  return sub_1884CA430();
}

void sub_1884A9948(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_1884CA430();
  *a1 = v7;
  unint64_t v8 = *a2;
  if (*a2)
  {
    *unint64_t v8 = v6;
    *a2 = v8 + 1;
  }

  else
  {
  }

  OUTLINED_FUNCTION_13_16();
}

void sub_1884A99F4(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  *a2 = a1();
  OUTLINED_FUNCTION_1_0();
}

void sub_1884A9A18(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  *a2 = OUTLINED_FUNCTION_80_4(a1);
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_1884A9A38()
{
  return swift_deallocObject();
}

uint64_t sub_1884A9A58()
{
  return swift_deallocObject();
}

void sub_1884A9A74()
{
}

uint64_t sub_1884A9AA8()
{
  return swift_deallocObject();
}

uint64_t sub_1884A9ACC()
{
  return swift_deallocObject();
}

uint64_t sub_1884A9AEC(uint64_t a1)
{
  return sub_1884A3348( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24),  *(void (**)(uint64_t *))(v1 + 32),  *(void *)(v1 + 40));
}

uint64_t sub_1884A9AFC(char a1)
{
  return sub_1884A4334(a1);
}

uint64_t sub_1884A9B04()
{
  return swift_deallocObject();
}

void sub_1884A9B24(int a1)
{
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

uint64_t sub_1884A9B48()
{
  return swift_deallocObject();
}

uint64_t sub_1884A9B6C()
{
  return swift_deallocObject();
}

uint64_t sub_1884A9B8C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_1884A6120( a1,  a2,  a3,  a4,  *(void *)(v4 + 16),  *(void (**)(void *, uint64_t))(v4 + 24),  *(void *)(v4 + 32),  *(void *)(v4 + 40));
}

uint64_t sub_1884A9B98()
{
  return swift_deallocObject();
}

void sub_1884A9BB4(void *a1, unint64_t a2, char a3)
{
}

uint64_t objectdestroy_5Tm()
{
  OUTLINED_FUNCTION_37_5();
  OUTLINED_FUNCTION_44_5();
  return swift_deallocObject();
}

void sub_1884A9BE8()
{
}

uint64_t sub_1884A9C1C()
{
  OUTLINED_FUNCTION_44_5();
  return swift_deallocObject();
}

uint64_t sub_1884A9C40(uint64_t a1)
{
  return sub_1884A6CE0(a1);
}

uint64_t sub_1884A9C4C()
{
  return sub_1884A79A4();
}

void sub_1884A9C54()
{
  uint64_t *v0 = sub_1884A2DB8();
  v0[1] = v1;
  OUTLINED_FUNCTION_1_0();
}

void sub_1884A9C78()
{
  void *v0 = v1;
  OUTLINED_FUNCTION_1_0();
}

void sub_1884A9C98(uint64_t *a1)
{
}

void sub_1884A9CB8()
{
  void *v0 = v1;
  OUTLINED_FUNCTION_1_0();
}

void sub_1884A9CD8(uint64_t *a1)
{
}

void sub_1884A9CF8()
{
  void *v0 = v1;
  OUTLINED_FUNCTION_1_0();
}

void sub_1884A9D1C()
{
  void *v0 = v1;
  OUTLINED_FUNCTION_1_0();
}

void sub_1884A9D40()
{
  void *v0 = v1;
  OUTLINED_FUNCTION_1_0();
}

void sub_1884A9D64()
{
  void *v0 = v1;
  OUTLINED_FUNCTION_1_0();
}

uint64_t type metadata accessor for TCPTunnelConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for TCPTunnelConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TCPTunnelConnection.maxSupportedMTU.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128LL))() & 0x1FFFF;
}

uint64_t dispatch thunk of TCPTunnelConnection.physicalInterfaceName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t dispatch thunk of TCPTunnelConnection._partialReceivedPacket.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144LL))();
}

uint64_t dispatch thunk of TCPTunnelConnection._partialReceivedPacket.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152LL))();
}

uint64_t dispatch thunk of TCPTunnelConnection._partialReceivedPacket.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160LL))();
}

uint64_t dispatch thunk of TCPTunnelConnection._nextMinReceiveLength.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168LL))();
}

uint64_t dispatch thunk of TCPTunnelConnection._nextMinReceiveLength.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176LL))();
}

uint64_t dispatch thunk of TCPTunnelConnection._nextMinReceiveLength.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184LL))();
}

uint64_t dispatch thunk of TCPTunnelConnection._maxReceiveLength.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192LL))();
}

uint64_t dispatch thunk of TCPTunnelConnection._maxReceiveLength.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208LL))();
}

uint64_t dispatch thunk of TCPTunnelConnection.__allocating_init(tunnelIdentifier:stream:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of TCPTunnelConnection.send(content:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224LL))();
}

uint64_t dispatch thunk of TCPTunnelConnection.receive(minLength:maxLength:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232LL))();
}

uint64_t dispatch thunk of TCPTunnelConnection.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240LL))();
}

uint64_t dispatch thunk of TCPTunnelConnection.start(on:reportingTunnelStateChangesWith:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248LL))();
}

uint64_t type metadata accessor for QUICTunnelConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for QUICTunnelConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QUICTunnelConnection.maxSupportedMTU.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144LL))() & 0x1FFFF;
}

uint64_t dispatch thunk of QUICTunnelConnection.physicalInterfaceName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.group.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.group.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.options.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.options.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.options.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.nonDatagramStream.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.nonDatagramStream.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.nonDatagramStream.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.datagramStream.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.datagramStream.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.__allocating_init(tunnelIdentifier:group:options:)()
{
  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t dispatch thunk of QUICTunnelConnection.send(packets:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.send(controlMessage:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.receivePackets(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.receiveControlMessage(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344LL))();
}

uint64_t dispatch thunk of QUICTunnelConnection.start(on:reportingTunnelStateChangesWith:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352LL))();
}

uint64_t getEnumTagSinglePayload for QUICTunnelConnection.State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFD)
  {
    unsigned int v6 = *a1;
    if (v6 >= 2)
    {
      unsigned int v7 = (v6 + 2147483646) & 0x7FFFFFFF;
      uint64_t result = v7 - 1;
      if (v7 > 1) {
        return result;
      }
    }

    return 0LL;
  }

  unsigned int v2 = a2 + 65283;
  if (a2 + 65283 <= 0xFFFEFFFF) {
    unsigned int v3 = 2;
  }
  else {
    unsigned int v3 = 4;
  }
  if (v2 < 0xFF0000) {
    unsigned int v3 = 1;
  }
  if (v2 >= 0x10000) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0LL;
  }
  return ((uint64_t (*)(void))((char *)&loc_1884AA008 + 4 * byte_1884D2C50[v4]))();
}

uint64_t storeEnumTagSinglePayload for QUICTunnelConnection.State( _WORD *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 65283;
  if (a3 + 65283 <= 0xFFFEFFFF) {
    int v4 = 2;
  }
  else {
    int v4 = 4;
  }
  if (v3 < 0xFF0000) {
    int v4 = 1;
  }
  if (v3 >= 0x10000) {
    LODWORD(v5) = v4;
  }
  else {
    LODWORD(v5) = 0;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v5;
  }
  else {
    uint64_t v5 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_1884AA0B8 + 4 * byte_1884D2C5A[v5]))();
  }
  *a1 = a2 - 253;
  return ((uint64_t (*)(void))((char *)sub_1884AA0EC + 4 * byte_1884D2C55[v5]))();
}

uint64_t sub_1884AA0EC(uint64_t result)
{
  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_1884AA0F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2) {
    JUMPOUT(0x1884AA0FCLL);
  }
  return result;
}

uint64_t sub_1884AA108(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2) {
    JUMPOUT(0x1884AA110LL);
  }
  *(_BYTE *)uint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1884AA114(uint64_t result)
{
  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1884AA11C(uint64_t result)
{
  *(_WORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1884AA128(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0LL;
  }
}

_WORD *sub_1884AA144(_WORD *result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *uint64_t result = a2 - 255;
  }

  else if (a2)
  {
    *(_BYTE *)uint64_t result = a2 + 1;
  }

  return result;
}

ValueMetadata *type metadata accessor for QUICTunnelConnection.State()
{
  return &type metadata for QUICTunnelConnection.State;
}

void sub_1884AA178(uint64_t a1)
{
}

uint64_t sub_1884AA180()
{
  return swift_deallocObject();
}

uint64_t sub_1884AA19C(uint64_t a1)
{
  return sub_1884A7EC4(a1, *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t objectdestroy_19Tm()
{
  return swift_deallocObject();
}

uint64_t sub_1884AA1D4(uint64_t result)
{
  return sub_1884A9038(result);
}

uint64_t sub_1884AA1DC()
{
  return swift_deallocObject();
}

unint64_t sub_1884AA200()
{
  unint64_t result = qword_18C4DE508;
  if (!qword_18C4DE508)
  {
    uint64_t v1 = type metadata accessor for TunnelMessage();
    unint64_t result = MEMORY[0x1895C7AEC](&protocol conformance descriptor for TunnelMessage, v1);
    atomic_store(result, (unint64_t *)&qword_18C4DE508);
  }

  return result;
}

uint64_t sub_1884AA240()
{
  uint64_t v1 = *(uint64_t (**)(char *))(v0 + 16);
  char v3 = *(_BYTE *)(v0 + 32);
  return v1(&v3);
}

  ;
}

uint64_t OUTLINED_FUNCTION_12_11()
{
  return swift_arrayDestroy();
}

  ;
}

void OUTLINED_FUNCTION_16_12( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(void *)(a1 + 16) = v12;
  a11 = v12;
  a12 = 0LL;
  a10 = a1 + 32;
  sub_18849D1E8((uint64_t)&a10, &a12, 8LL);
}

void OUTLINED_FUNCTION_18_15(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

uint64_t OUTLINED_FUNCTION_19_10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_188468CBC(v9, (uint64_t)&a9 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
}

void OUTLINED_FUNCTION_24_9(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

char *OUTLINED_FUNCTION_25_11( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (char *)&a9 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t OUTLINED_FUNCTION_27_8()
{
  return swift_weakInit();
}

  ;
}

uint64_t OUTLINED_FUNCTION_30_10()
{
  return swift_bridgeObjectRetain();
}

  ;
}

uint64_t OUTLINED_FUNCTION_34_8()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_35_6(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_38_8(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return sub_1884CA430();
}

uint64_t OUTLINED_FUNCTION_39_6()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256LL))();
}

uint64_t OUTLINED_FUNCTION_40_9()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200LL))();
}

void OUTLINED_FUNCTION_42_6(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t OUTLINED_FUNCTION_43_9()
{
  return sub_1884CA424();
}

void OUTLINED_FUNCTION_44_8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

uint64_t OUTLINED_FUNCTION_46_8()
{
  return sub_1884CA0E8();
}

  ;
}

  ;
}

uint64_t OUTLINED_FUNCTION_50_6@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = v2;
  a2[1] = a1;
  return swift_bridgeObjectRetain();
}

size_t OUTLINED_FUNCTION_52_8(size_t a1, int64_t a2)
{
  return sub_188425434(a1, a2, 1);
}

uint64_t OUTLINED_FUNCTION_58_7(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_59_8(uint64_t a1)
{
  return v2(a1, v1);
}

void OUTLINED_FUNCTION_68_5()
{
  *(void *)(v0 - 112) = 0x5F6E6F6374LL;
  *(void *)(v0 - 104) = 0xE500000000000000LL;
}

void OUTLINED_FUNCTION_69_4()
{
  *(void *)(v0 - 136) = 0x5F6E6F6374LL;
  *(void *)(v0 - 128) = 0xE500000000000000LL;
}

BOOL OUTLINED_FUNCTION_71_5()
{
  return os_log_type_enabled(v1, v0);
}

BOOL OUTLINED_FUNCTION_75_2()
{
  return os_log_type_enabled(v0, v1);
}

uint64_t OUTLINED_FUNCTION_76_6(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1LL, v1);
}

uint64_t OUTLINED_FUNCTION_78_4(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1LL, v2);
}

uint64_t OUTLINED_FUNCTION_80_4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_81_3()
{
  return sub_1884CA430();
}

void OUTLINED_FUNCTION_82_3(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

uint64_t OUTLINED_FUNCTION_83_4()
{
  return sub_1884CA0E8();
}

  ;
}

uint64_t OUTLINED_FUNCTION_88_3()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_89_2()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_90_3()
{
  return sub_1884CA1F0();
}

uint64_t OUTLINED_FUNCTION_91_1()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_94_2(uint64_t a1, uint64_t *a2)
{
}

uint64_t OUTLINED_FUNCTION_95_1()
{
  return sub_1884CA430();
}

uint64_t OUTLINED_FUNCTION_96_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_100_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 128))(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_102_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_103_0()
{
  return sub_1884CA0E8();
}

uint64_t OUTLINED_FUNCTION_104_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_105_2()
{
  return sub_1884CA430();
}

uint64_t AtomicCounter.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  AtomicCounter.init()();
  return v0;
}

id sub_1884AA5BC()
{
  id result = objc_msgSend(*(id *)(v0 + 24), sel_lock);
  uint64_t v2 = *(void *)(v0 + 16);
  if (v2 == -1)
  {
    __break(1u);
  }

  else
  {
    *(void *)(v0 + 16) = v2 + 1;
    objc_msgSend(*(id *)(v0 + 24), sel_unlock);
    return (id)v2;
  }

  return result;
}

uint64_t AtomicCounter.init()()
{
  *(void *)(v0 + 16) = 0LL;
  *(void *)(v0 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x189607918]), sel_init);
  return v0;
}

uint64_t AtomicCounter.deinit()
{
  return v0;
}

uint64_t AtomicCounter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AtomicCounter()
{
  return objc_opt_self();
}

uint64_t method lookup function for AtomicCounter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AtomicCounter.next()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144LL))();
}

uint64_t dispatch thunk of AtomicCounter.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_1884AA6C0()
{
  if ((*v0 & 1) != 0) {
    uint64_t v1 = 0x2D656369766544LL;
  }
  else {
    uint64_t v1 = 0x2D74736F48LL;
  }
  uint64_t v3 = v1;
  sub_1884CA7D8();
  sub_1884CA0E8();
  OUTLINED_FUNCTION_5_5();
  return v3;
}

id sub_1884AA748(uint64_t a1, uint64_t a2)
{
  if (*(uint64_t *)(a2 + OBJC_IVAR____TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion_rawValue) >= 12)
  {
    *(void *)&__int128 v29 = a1;
    uint64_t v3 = sub_1884B6BC4((uint64_t)&v29);
    OUTLINED_FUNCTION_154_1(v3, v4, v5, v6, v7, v8, v9, v10, v21, v22);
    return OUTLINED_FUNCTION_42_3();
  }

  else
  {
    uint64_t v28 = a1;
    OUTLINED_FUNCTION_42_3();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDDE0);
    if (swift_dynamicCast())
    {
      LOBYTE(v29) = v22;
      *((void *)&v29 + 1) = v23;
      *(void *)unint64_t v30 = v24;
      *(_OWORD *)&v30[8] = v25;
      __int128 v31 = v26;
      uint64_t v32 = v27;
    }

    else
    {
      __int128 v29 = 0u;
      *(_OWORD *)unint64_t v30 = 0u;
      v30[16] = 2;
      HIBYTE(v21) = 4;
      OUTLINED_FUNCTION_42_3();
      Swift::String v12 = ControlChannelConnectionError.Message.format(code:)((RemotePairingDevice::ControlChannelConnectionError::Code)((char *)&v21 + 7));
      sub_18844D660((uint64_t)&v29);
      LOBYTE(v29) = 4;
      *((void *)&v29 + 1) = v12._countAndFlagsBits;
      *(void *)unint64_t v30 = v12._object;
      *(_OWORD *)&v30[8] = 0u;
      __int128 v31 = 0u;
      uint64_t v32 = a1;
    }

    uint64_t v13 = sub_18844F7A0((uint64_t)&v29);
    return OUTLINED_FUNCTION_154_1(v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  }

uint64_t PeerDeviceInfo.init(name:model:udid:ecid:deviceKVSData:deviceKVSIncludesSensitiveInfo:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char a12)
{
  *(void *)a9 = a5;
  *(void *)(a9 + 8) = a6;
  *(void *)(a9 + 16) = a1;
  *(void *)(a9 + 24) = a2;
  *(void *)(a9 + 32) = a3;
  *(void *)(a9 + 4sub_188455A4C(v0, v1, 0) = a4;
  *(void *)(a9 + 48) = a5;
  *(void *)(a9 + 56) = a6;
  *(void *)(a9 + 64) = a7;
  *(_BYTE *)(a9 + 72) = a8 & 1;
  *(void *)(a9 + 8sub_188455A4C(v0, v1, 0) = a10;
  *(void *)(a9 + 88) = a11;
  *(_BYTE *)(a9 + 96) = a12;
  return swift_bridgeObjectRetain();
}

char *PairingData.init(kind:data:startNewSession:)@<X0>( char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  char v5 = *result;
  *(_BYTE *)a5 = a4;
  *(_BYTE *)(a5 + 1) = v5;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 32) = 0LL;
  *(void *)(a5 + 4sub_188455A4C(v0, v1, 0) = 0LL;
  *(void *)(a5 + 24) = 0LL;
  return result;
}

uint64_t PropertyListCodable.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 32LL))(a3, a1);
}

void sub_1884AA8E0(void *a1@<X8>)
{
  *a1 = 0LL;
}

uint64_t sub_1884AA8E8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E456D6165727473LL && a2 == 0xEF64657470797263LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x6E69616C70LL && a2 == 0xE500000000000000LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v7 = sub_1884CA820();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1884AA9F0(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x6E69616C70LL;
  }
  else {
    return 0x6E456D6165727473LL;
  }
}

void sub_1884AAA30()
{
  uint64_t v3 = v0;
  char v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD78);
  uint64_t v19 = *(void *)(v6 - 8);
  uint64_t v20 = v6;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v7);
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD80);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v8);
  OUTLINED_FUNCTION_12_5();
  uint64_t v21 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD70) - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v9);
  OUTLINED_FUNCTION_9_0();
  sub_18844F728(v3, v23);
  __swift_project_boxed_opaque_existential_0Tm(v5, v5[3]);
  sub_1884B6748();
  sub_1884CA9E8();
  sub_18844F728(v23, v24);
  if (sub_188451394((uint64_t)v24) == 1)
  {
    uint64_t v10 = (const void *)sub_1884513A0((uint64_t)v24);
    LOBYTE(v22[0]) = 1;
    uint64_t v11 = OUTLINED_FUNCTION_137_1();
    sub_1884B6A28(v11);
    sub_1884B6784();
    OUTLINED_FUNCTION_40_10();
    sub_18844F728(v10, v22);
    sub_1884519F0();
    OUTLINED_FUNCTION_132_1();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v2, v20);
  }

  else
  {
    Swift::String v12 = (uint64_t *)sub_1884513A0((uint64_t)v24);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    uint64_t v15 = OUTLINED_FUNCTION_137_1();
    OUTLINED_FUNCTION_127_2(v15);
    sub_1884B6848();
    OUTLINED_FUNCTION_40_10();
    v22[0] = v13;
    v22[1] = v14;
    sub_18845D554();
    OUTLINED_FUNCTION_132_1();
    uint64_t v16 = OUTLINED_FUNCTION_364();
    v18(v16, v17);
  }

  OUTLINED_FUNCTION_29_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
  sub_1884B67C0((uint64_t)v23);
  OUTLINED_FUNCTION_0_2();
}

void sub_1884AAC6C()
{
  uint64_t v4 = v3;
  uint64_t v24 = v5;
  uint64_t v26 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC80) - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_90_4(v7, v23);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC88);
  uint64_t v8 = *(void *)(v25 - 8);
  MEMORY[0x1895F8858](v25);
  OUTLINED_FUNCTION_15_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC78);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x1895F8858](v9);
  OUTLINED_FUNCTION_32_0();
  uint64_t v27 = (uint64_t)v4;
  __swift_project_boxed_opaque_existential_0Tm(v4, v4[3]);
  sub_1884B6748();
  OUTLINED_FUNCTION_122_1();
  sub_1884CA9D0();
  if (v0) {
    goto LABEL_9;
  }
  uint64_t v32 = v2;
  uint64_t v10 = sub_1884CA6F4();
  uint64_t v11 = *(void *)(v10 + 16);
  if (!v11)
  {
    uint64_t v17 = v1;
LABEL_8:
    uint64_t v18 = OUTLINED_FUNCTION_93_2();
    OUTLINED_FUNCTION_109();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C70E040);
    *uint64_t v20 = &unk_18A244840;
    sub_1884CA640();
    OUTLINED_FUNCTION_78();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104LL))( v20,  *MEMORY[0x189619358],  v18);
    swift_willThrow();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_48_0(v17, *(uint64_t (**)(uint64_t, uint64_t))(v32 + 8));
LABEL_9:
    __swift_destroy_boxed_opaque_existential_0Tm(v27);
    goto LABEL_10;
  }

  char v12 = *(_BYTE *)(v10 + 32);
  sub_18842949C(1LL, v11, v10, v10 + 32, 0LL, (2 * v11) | 1);
  uint64_t v14 = v13;
  unint64_t v16 = v15;
  OUTLINED_FUNCTION_102_0();
  if (v14 != v16 >> 1)
  {
    uint64_t v17 = v1;
    goto LABEL_8;
  }

  if ((v12 & 1) != 0)
  {
    LOBYTE(v30[0]) = 1;
    sub_1884B6784();
    OUTLINED_FUNCTION_65_6();
    sub_188451498();
    OUTLINED_FUNCTION_43_10();
    OUTLINED_FUNCTION_21_8(v26);
    OUTLINED_FUNCTION_18_16();
    OUTLINED_FUNCTION_35(v1, *(uint64_t (**)(uint64_t, uint64_t))(v32 + 8));
    sub_18844F728(v30, &v28);
    sub_18844F728(&v28, v29);
    sub_188451990((uint64_t)v29);
    uint64_t v21 = v29;
  }

  else
  {
    LOBYTE(v30[0]) = 0;
    sub_1884B6848();
    OUTLINED_FUNCTION_65_6();
    sub_18845FEF8();
    OUTLINED_FUNCTION_43_10();
    OUTLINED_FUNCTION_21_8(v8);
    OUTLINED_FUNCTION_18_16();
    OUTLINED_FUNCTION_149_1();
    OUTLINED_FUNCTION_35(v1, v22);
    v30[0] = v29[0];
    sub_1884519E0((uint64_t)v30);
    uint64_t v21 = v30;
  }

  sub_18844F728(v21, v31);
  sub_18844F728(v31, v24);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v4);
LABEL_10:
  OUTLINED_FUNCTION_119_2();
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1884AB00C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x74616E696769726FLL && a2 == 0xEC00000079426465LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else
  {
    BOOL v6 = a1 == 0x65636E6575716573LL && a2 == 0xEE007265626D754ELL;
    if (v6 || (sub_1884CA820() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1LL;
    }

    else if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000LL)
    {
      swift_bridgeObjectRelease();
      return 2LL;
    }

    else
    {
      char v8 = sub_1884CA820();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0) {
        return 2LL;
      }
      else {
        return 3LL;
      }
    }
  }

uint64_t sub_1884AB194(char a1)
{
  if (!a1) {
    return 0x74616E696769726FLL;
  }
  if (a1 == 1) {
    return 0x65636E6575716573LL;
  }
  return 0x6567617373656DLL;
}

uint64_t sub_1884AB204()
{
  return sub_1884AA9F0(*v0);
}

uint64_t sub_1884AB20C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884AA8E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884AB230()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884AB258()
{
  return sub_1884CAA00();
}

uint64_t sub_1884AB284()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884AB2AC()
{
  return sub_1884CAA00();
}

uint64_t sub_1884AB2D4()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884AB2FC()
{
  return sub_1884CAA00();
}

void sub_1884AB324()
{
}

void sub_1884AB338()
{
}

uint64_t sub_1884AB34C()
{
  return sub_1884AB194(*v0);
}

uint64_t sub_1884AB354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884AB00C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884AB378()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884AB3A0()
{
  return sub_1884CAA00();
}

void ControlChannelMessageEnvelope.encode(to:)()
{
  char v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD88);
  OUTLINED_FUNCTION_55_4();
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_15_0();
  char v7 = *v0;
  sub_18844F728(v0 + 16, v9);
  __swift_project_boxed_opaque_existential_0Tm(v5, v5[3]);
  sub_1884AB4FC();
  sub_1884CA9E8();
  v8[0] = v7;
  sub_1884AB538();
  OUTLINED_FUNCTION_145_1();
  sub_1884CA784();
  if (!v1)
  {
    v8[0] = 1;
    sub_1884CA7B4();
    sub_18844F728(v9, v8);
    OUTLINED_FUNCTION_63_6();
    sub_1884AB574();
    OUTLINED_FUNCTION_145_1();
    sub_1884CA784();
  }

  OUTLINED_FUNCTION_30_4(v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_143_1();
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_1884AB4FC()
{
  unint64_t result = qword_18C4DD850;
  if (!qword_18C4DD850)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3938, &type metadata for ControlChannelMessageEnvelope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD850);
  }

  return result;
}

unint64_t sub_1884AB538()
{
  unint64_t result = qword_18C4DD168;
  if (!qword_18C4DD168)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884CECF8, &unk_18A23D290);
    atomic_store(result, (unint64_t *)&qword_18C4DD168);
  }

  return result;
}

unint64_t sub_1884AB574()
{
  unint64_t result = qword_18C4DD840;
  if (!qword_18C4DD840)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3910, &unk_18A244840);
    atomic_store(result, (unint64_t *)&qword_18C4DD840);
  }

  return result;
}

void ControlChannelMessageEnvelope.init(from:)()
{
  uint64_t v3 = v2;
  char v5 = v4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC90);
  uint64_t v6 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v9);
  OUTLINED_FUNCTION_16_0();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1884AB4FC();
  sub_1884CA9D0();
  if (!v0)
  {
    v12[0] = 0;
    sub_1884AB738();
    OUTLINED_FUNCTION_92_1();
    char v7 = v11[0];
    v13[0] = v11[0];
    LOBYTE(v11[0]) = 1;
    uint64_t v8 = sub_1884CA6E8();
    uint64_t v14 = v8;
    OUTLINED_FUNCTION_63_6();
    sub_1884AB774();
    OUTLINED_FUNCTION_92_1();
    OUTLINED_FUNCTION_30_4(v1, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    sub_18844F728(v12, &v10);
    OUTLINED_FUNCTION_138_1((uint64_t)v13);
    LOBYTE(v11[0]) = v7;
    v11[1] = v8;
    OUTLINED_FUNCTION_138_1((uint64_t)v11);
    memcpy(v5, v11, 0x92uLL);
  }

  OUTLINED_FUNCTION_112_2();
  OUTLINED_FUNCTION_143_1();
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_1884AB738()
{
  unint64_t result = qword_18C4DD180;
  if (!qword_18C4DD180)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884CECD0, &unk_18A23D290);
    atomic_store(result, (unint64_t *)&qword_18C4DD180);
  }

  return result;
}

unint64_t sub_1884AB774()
{
  unint64_t result = qword_18C4DD848;
  if (!qword_18C4DD848)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D38E8, &unk_18A244840);
    atomic_store(result, (unint64_t *)&qword_18C4DD848);
  }

  return result;
}

uint64_t sub_1884AB7B0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x44676E6972696170LL && a2 == 0xEB00000000617461LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else
  {
    BOOL v6 = a1 == 0x52676E6972696170LL && a2 == 0xEF64657463656A65LL;
    if (v6 || (sub_1884CA820() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1LL;
    }

    else if (a1 == 0xD000000000000010LL && a2 == 0x80000001884E0690LL || (sub_1884CA820() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2LL;
    }

    else
    {
      BOOL v7 = a1 == 1735289200 && a2 == 0xE400000000000000LL;
      if (v7 || (sub_1884CA820() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3LL;
      }

      else if (a1 == 0xD000000000000013LL && a2 == 0x80000001884DABF0LL || (sub_1884CA820() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4LL;
      }

      else if (a1 == 0xD000000000000018LL && a2 == 0x80000001884E06B0LL || (sub_1884CA820() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 5LL;
      }

      else
      {
        BOOL v8 = a1 == 0x726961706E75LL && a2 == 0xE600000000000000LL;
        if (v8 || (sub_1884CA820() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 6LL;
        }

        else if (a1 == 0xD000000000000011LL && a2 == 0x80000001884E06D0LL)
        {
          swift_bridgeObjectRelease();
          return 7LL;
        }

        else
        {
          char v9 = sub_1884CA820();
          swift_bridgeObjectRelease();
          if ((v9 & 1) != 0) {
            return 7LL;
          }
          else {
            return 8LL;
          }
        }
      }
    }
  }

uint64_t sub_1884ABAEC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1884ABB28 + 4 * byte_1884D2E40[a1]))( 0x44676E6972696170LL,  0xEB00000000617461LL);
}

uint64_t sub_1884ABB28()
{
  return 0x52676E6972696170LL;
}

unint64_t sub_1884ABB4C()
{
  return 0xD000000000000010LL;
}

uint64_t sub_1884ABB68()
{
  return 1735289200LL;
}

unint64_t sub_1884ABB78()
{
  return 0xD000000000000013LL;
}

uint64_t sub_1884ABBDC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x4564657070617277LL && a2 == 0xEC000000726F7272LL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }

  else
  {
    char v3 = sub_1884CA820();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }

  return v4 & 1;
}

uint64_t sub_1884ABC78()
{
  return 0x4564657070617277LL;
}

void sub_1884ABC98( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  a19 = v21;
  a20 = v22;
  uint64_t v24 = v23;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDCF0);
  OUTLINED_FUNCTION_35_7(v25, (uint64_t)&a11);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v26);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_44_9(v27);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD08);
  OUTLINED_FUNCTION_35_7(v28, (uint64_t)&v51);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v29);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_44_9(v30);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDCE8);
  OUTLINED_FUNCTION_35_7(v31, (uint64_t)&v55);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v32);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_44_9(v33);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD18);
  OUTLINED_FUNCTION_35_7(v34, (uint64_t)v50);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v35);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_44_9(v36);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD00);
  OUTLINED_FUNCTION_35_7(v37, (uint64_t)&v52);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v38);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_44_9(v39);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD10);
  OUTLINED_FUNCTION_35_7(v40, (uint64_t)&v53);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v41);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_44_9(v42);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDCE0);
  OUTLINED_FUNCTION_35_7(v43, (uint64_t)&v54);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v44);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_44_9(v45);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDCD8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v46);
  OUTLINED_FUNCTION_16_0();
  v50[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDCF8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v47);
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_126_2();
  uint64_t v48 = v20[7];
  v50[0] = v20[6];
  v50[1] = v48;
  uint64_t v49 = v20[9];
  __swift_project_boxed_opaque_existential_0Tm(v24, v24[3]);
  sub_1884B8B14();
  OUTLINED_FUNCTION_122_1();
  sub_1884CA9E8();
  __asm { BR              X10 }

void sub_1884ABF58()
{
  *(void *)(v2 - 32sub_188455A4C(v0, v1, 0) = v0 >> 8;
  *(_BYTE *)(v2 - 192) = 0;
  uint64_t v3 = *(void *)(v2 - 72);
  unint64_t v4 = *(void *)(v2 - 248);
  sub_18841E590(v3, v4);
  sub_1884B8CF4();
  uint64_t v5 = *(void *)(v2 - 232);
  swift_bridgeObjectRetain();
  uint64_t v6 = *(void *)(v2 - 224);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_67_6();
  *(_BYTE *)(v2 - 192) = v0 & 1;
  *(_BYTE *)(v2 - 191) = *(void *)(v2 - 320);
  *(void *)(v2 - 184) = v3;
  *(void *)(v2 - 176) = v4;
  uint64_t v7 = *(void *)(v2 - 240);
  *(void *)(v2 - 168) = v7;
  *(void *)(v2 - 16sub_188455A4C(v0, v1, 0) = v5;
  *(void *)(v2 - 152) = v6;
  sub_1884B8E84();
  OUTLINED_FUNCTION_85_2();
  OUTLINED_FUNCTION_48_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 368) + 8LL));
  OUTLINED_FUNCTION_76_7();
  BOOL v8 = (void *)OUTLINED_FUNCTION_28_10();
  sub_188450B24( v8,  *(void *)(v2 - 72),  v4,  v7,  v5,  v6,  *(void *)(v2 - 216),  *(void *)(v2 - 208),  v9,  v10,  v11,  v12);
  OUTLINED_FUNCTION_0_2();
}

void sub_1884AC484( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  a19 = v23;
  a20 = v24;
  a10 = v20;
  uint64_t v26 = v25;
  uint64_t v79 = v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC00);
  OUTLINED_FUNCTION_35_7(v28, (uint64_t)&a11);
  v74[13] = v29;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v30);
  OUTLINED_FUNCTION_91_2(v31, v74[0]);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC18);
  OUTLINED_FUNCTION_35_7(v32, (uint64_t)&a14);
  v74[14] = v33;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v34);
  OUTLINED_FUNCTION_28_0();
  uint64_t v77 = v35;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDBF8);
  v74[16] = *(void *)(v75 - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v36);
  OUTLINED_FUNCTION_28_0();
  uint64_t v78 = v37;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC28);
  OUTLINED_FUNCTION_35_7(v38, (uint64_t)&v85);
  uint64_t v81 = v39;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v40);
  OUTLINED_FUNCTION_28_0();
  uint64_t v76 = v41;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC10);
  OUTLINED_FUNCTION_35_7(v42, (uint64_t)&a10);
  v74[10] = v43;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v44);
  OUTLINED_FUNCTION_28_0();
  uint64_t v80 = v45;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC20);
  OUTLINED_FUNCTION_35_7(v46, (uint64_t)&v84);
  v74[7] = v47;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v48);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_44_9(v49);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDBF0);
  OUTLINED_FUNCTION_35_7(v50, (uint64_t)&v83);
  v74[5] = v51;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v52);
  OUTLINED_FUNCTION_44_9((uint64_t)v74 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDBE8);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x1895F8858](v55);
  OUTLINED_FUNCTION_101();
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC08);
  uint64_t v57 = *(void *)(v56 - 8);
  MEMORY[0x1895F8858](v56);
  unint64_t v59 = (char *)v74 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v60 = v26[3];
  uint64_t v82 = v26;
  __swift_project_boxed_opaque_existential_0Tm(v26, v60);
  sub_1884B8B14();
  uint64_t v61 = a10;
  sub_1884CA9D0();
  if (!v61)
  {
    v74[3] = v21;
    v74[1] = v22;
    v74[2] = v54;
    a10 = v57;
    uint64_t v62 = sub_1884CA6F4();
    uint64_t v63 = *(void *)(v62 + 16);
    if (v63)
    {
      v74[4] = (uint64_t)v59;
      v74[0] = 0LL;
      uint64_t v64 = *(unsigned __int8 *)(v62 + 32);
      sub_18842949C(1LL, v63, v62, v62 + 32, 0LL, (2 * v63) | 1);
      uint64_t v66 = v65;
      unint64_t v68 = v67;
      OUTLINED_FUNCTION_102_0();
      if (v66 == v68 >> 1) {
        __asm { BR              X9 }
      }
    }

    uint64_t v69 = OUTLINED_FUNCTION_93_2();
    OUTLINED_FUNCTION_109();
    uint64_t v71 = v70;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C70E040);
    *uint64_t v71 = &unk_18A245330;
    sub_1884CA640();
    OUTLINED_FUNCTION_78();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v69 - 8) + 104LL))( v71,  *MEMORY[0x189619358],  v69);
    swift_willThrow();
    OUTLINED_FUNCTION_18_16();
    uint64_t v72 = OUTLINED_FUNCTION_130_1();
    OUTLINED_FUNCTION_48_0(v72, v73);
  }

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v82);
  OUTLINED_FUNCTION_58_8();
  OUTLINED_FUNCTION_0_2();
}

void sub_1884AC900()
{
  if (!v0)
  {
    uint64_t v2 = OUTLINED_FUNCTION_38_9();
    OUTLINED_FUNCTION_32_5(v2, v3);
    OUTLINED_FUNCTION_18_16();
    OUTLINED_FUNCTION_8_14(*(void *)(v1 - 72));
    uint64_t v4 = *(void *)(v1 - 232);
    *(void *)uint64_t v4 = 0LL;
    *(_OWORD *)(v4 + 8) = 0u;
    *(void *)(v4 + 24) = 0LL;
    *(void *)(v4 + 32) = 0LL;
    *(void *)(v4 + 4sub_188455A4C(v0, v1, 0) = 0LL;
    *(void *)(v4 + 48) = 0LL;
    *(void *)(v4 + 56) = 0LL;
    *(void *)(v4 + 64) = 0LL;
    *(void *)(v4 + 72) = 0xC000000000000000LL;
    *(_OWORD *)(v4 + 8sub_188455A4C(v0, v1, 0) = 0u;
    *(_BYTE *)(v4 + 96) = 0;
    JUMPOUT(0x1884AC8F0LL);
  }

  JUMPOUT(0x1884AC8DCLL);
}

void sub_1884AC978()
{
  if (!v0)
  {
    uint64_t v2 = OUTLINED_FUNCTION_38_9();
    OUTLINED_FUNCTION_32_5(v2, v3);
    OUTLINED_FUNCTION_18_16();
    OUTLINED_FUNCTION_8_14(*(void *)(v1 - 72));
    *(double *)&__int128 v4 = OUTLINED_FUNCTION_5_17();
    uint64_t v5 = *(void *)(v1 - 232);
    *(void *)uint64_t v5 = 1LL;
    *(_OWORD *)(v5 + 8) = v4;
    *(void *)(v5 + 24) = v6;
    *(void *)(v5 + 32) = v7;
    *(void *)(v5 + 4sub_188455A4C(v0, v1, 0) = v9;
    *(void *)(v5 + 48) = v8;
    *(void *)(v5 + 56) = v10;
    *(void *)(v5 + 64) = v11;
    *(void *)(v5 + 72) = v12;
    *(_OWORD *)(v5 + 8sub_188455A4C(v0, v1, 0) = v13;
    *(_BYTE *)(v5 + 96) = v14;
    JUMPOUT(0x1884AC8F0LL);
  }

  JUMPOUT(0x1884AC8DCLL);
}

void sub_1884AC9CC()
{
  if (!v0)
  {
    uint64_t v2 = OUTLINED_FUNCTION_38_9();
    OUTLINED_FUNCTION_32_5(v2, v3);
    OUTLINED_FUNCTION_18_16();
    OUTLINED_FUNCTION_8_14(*(void *)(v1 - 72));
    *(double *)&__int128 v4 = OUTLINED_FUNCTION_5_17();
    uint64_t v5 = *(void *)(v1 - 232);
    *(void *)uint64_t v5 = 2LL;
    *(_OWORD *)(v5 + 8) = v4;
    *(void *)(v5 + 24) = v6;
    *(void *)(v5 + 32) = v7;
    *(void *)(v5 + 4sub_188455A4C(v0, v1, 0) = v9;
    *(void *)(v5 + 48) = v8;
    *(void *)(v5 + 56) = v10;
    *(void *)(v5 + 64) = v11;
    *(void *)(v5 + 72) = v12;
    *(_OWORD *)(v5 + 8sub_188455A4C(v0, v1, 0) = v13;
    *(_BYTE *)(v5 + 96) = v14;
    JUMPOUT(0x1884AC8F0LL);
  }

  JUMPOUT(0x1884AC8DCLL);
}

void sub_1884ACA18()
{
  uint64_t v3 = *(void *)(v2 - 256);
  OUTLINED_FUNCTION_6_17();
  if (!v0)
  {
    OUTLINED_FUNCTION_32_5(v3, *(uint64_t (**)(uint64_t, void))(v1 + 8));
    OUTLINED_FUNCTION_18_16();
    OUTLINED_FUNCTION_8_14(*(void *)(v2 - 72));
    *(double *)&__int128 v4 = OUTLINED_FUNCTION_5_17();
    uint64_t v5 = *(void *)(v2 - 232);
    *(void *)uint64_t v5 = 3LL;
    *(_OWORD *)(v5 + 8) = v4;
    *(void *)(v5 + 24) = v6;
    *(void *)(v5 + 32) = v7;
    *(void *)(v5 + 4sub_188455A4C(v0, v1, 0) = v9;
    *(void *)(v5 + 48) = v8;
    *(void *)(v5 + 56) = v10;
    *(void *)(v5 + 64) = v11;
    *(void *)(v5 + 72) = v12;
    *(_OWORD *)(v5 + 8sub_188455A4C(v0, v1, 0) = v13;
    *(_BYTE *)(v5 + 96) = v14;
    JUMPOUT(0x1884AC8F0LL);
  }

  JUMPOUT(0x1884AC8DCLL);
}

void sub_1884ACA68()
{
  *(_BYTE *)(v1 - 192) = 5;
  sub_1884B8BC8();
  uint64_t v2 = *(void *)(v1 - 240);
  uint64_t v3 = *(void *)(v1 - 384);
  OUTLINED_FUNCTION_25_12();
  if (v0) {
    JUMPOUT(0x1884ACAACLL);
  }
  sub_188430098();
  OUTLINED_FUNCTION_22_7();
  uint64_t v4 = *(void *)(v1 - 72);
  OUTLINED_FUNCTION_30_4(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 288) + 8LL));
  OUTLINED_FUNCTION_18_16();
  OUTLINED_FUNCTION_48_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  uint64_t v5 = *(void *)(v1 - 232);
  *(void *)uint64_t v5 = *(void *)(v1 - 192);
  *(_OWORD *)(v5 + 8) = 0u;
  *(void *)(v5 + 24) = 0LL;
  *(void *)(v5 + 32) = 0LL;
  *(void *)(v5 + 4sub_188455A4C(v0, v1, 0) = 0LL;
  *(void *)(v5 + 48) = 0LL;
  *(void *)(v5 + 56) = 0LL;
  *(void *)(v5 + 64) = 0LL;
  *(void *)(v5 + 72) = 0x4000000000000000LL;
  *(_OWORD *)(v5 + 8sub_188455A4C(v0, v1, 0) = 0u;
  *(_BYTE *)(v5 + 96) = 0;
  JUMPOUT(0x1884AC8F0LL);
}

void sub_1884ACAB8()
{
  if (!v0)
  {
    uint64_t v2 = OUTLINED_FUNCTION_38_9();
    OUTLINED_FUNCTION_32_5(v2, v3);
    OUTLINED_FUNCTION_18_16();
    OUTLINED_FUNCTION_8_14(*(void *)(v1 - 72));
    *(double *)&__int128 v4 = OUTLINED_FUNCTION_5_17();
    uint64_t v5 = *(void *)(v1 - 232);
    *(void *)uint64_t v5 = 4LL;
    *(_OWORD *)(v5 + 8) = v4;
    *(void *)(v5 + 24) = v6;
    *(void *)(v5 + 32) = v7;
    *(void *)(v5 + 4sub_188455A4C(v0, v1, 0) = v9;
    *(void *)(v5 + 48) = v8;
    *(void *)(v5 + 56) = v10;
    *(void *)(v5 + 64) = v11;
    *(void *)(v5 + 72) = v12;
    *(_OWORD *)(v5 + 8sub_188455A4C(v0, v1, 0) = v13;
    *(_BYTE *)(v5 + 96) = v14;
    JUMPOUT(0x1884AC8F0LL);
  }

  JUMPOUT(0x1884AC8DCLL);
}

void sub_1884ACB08()
{
  *(_BYTE *)(v2 - 192) = 7;
  sub_1884B8B50();
  uint64_t v3 = *(void *)(v2 - 384);
  OUTLINED_FUNCTION_25_12();
  if (v0)
  {
    OUTLINED_FUNCTION_18_16();
    OUTLINED_FUNCTION_149_1();
    JUMPOUT(0x1884AC8E8LL);
  }

  sub_1884B6D74();
  OUTLINED_FUNCTION_43_10();
  uint64_t v4 = *(void *)(v2 - 72);
  OUTLINED_FUNCTION_35(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 312) + 8LL));
  OUTLINED_FUNCTION_18_16();
  OUTLINED_FUNCTION_48_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  JUMPOUT(0x1884ACC98LL);
}

uint64_t sub_1884ACCC4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6B616873646E6168LL && a2 == 0xE900000000000065LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else
  {
    BOOL v6 = a1 == 0x6F666E4972656570LL && a2 == 0xE800000000000000LL;
    if (v6 || (sub_1884CA820() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1LL;
    }

    else
    {
      BOOL v7 = a1 == 0x694C657461657263LL && a2 == 0xEE0072656E657473LL;
      if (v7 || (sub_1884CA820() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2LL;
      }

      else
      {
        BOOL v8 = a1 == 0x61506C65636E6163LL && a2 == 0xEF70757465537269LL;
        if (v8 || (sub_1884CA820() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3LL;
        }

        else if (a1 == 0xD000000000000015LL && a2 == 0x80000001884E0630LL || (sub_1884CA820() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4LL;
        }

        else if (a1 == 0x6E5565746F6D6572LL && a2 == 0xEC0000006B636F6CLL)
        {
          swift_bridgeObjectRelease();
          return 5LL;
        }

        else
        {
          char v10 = sub_1884CA820();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0) {
            return 5LL;
          }
          else {
            return 6LL;
          }
        }
      }
    }
  }

uint64_t sub_1884ACF98(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1884ACFD0 + 4 * byte_1884D2E54[a1]))( 0x6B616873646E6168LL,  0xE900000000000065LL);
}

uint64_t sub_1884ACFD0()
{
  return 0x6F666E4972656570LL;
}

uint64_t sub_1884ACFE8()
{
  return 0x694C657461657263LL;
}

uint64_t sub_1884AD00C()
{
  return 0x61506C65636E6163LL;
}

unint64_t sub_1884AD030()
{
  return 0xD000000000000015LL;
}

uint64_t sub_1884AD04C()
{
  return 0x6E5565746F6D6572LL;
}

uint64_t sub_1884AD06C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7955819 && a2 == 0xE300000000000000LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0xD000000000000015LL && a2 == 0x80000001884E0650LL || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else if (a1 == 0xD000000000000013LL && a2 == 0x80000001884E0670LL)
  {
    swift_bridgeObjectRelease();
    return 2LL;
  }

  else
  {
    char v6 = sub_1884CA820();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

uint64_t sub_1884AD1A8(char a1)
{
  if (!a1) {
    return 7955819LL;
  }
  if (a1 == 1) {
    return 0xD000000000000015LL;
  }
  return 0xD000000000000013LL;
}

uint64_t sub_1884AD204(uint64_t a1, uint64_t a2)
{
  if (a1 == 7955819 && a2 == 0xE300000000000000LL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }

  else
  {
    char v3 = sub_1884CA820();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }

  return v4 & 1;
}

uint64_t sub_1884AD278()
{
  return 7955819LL;
}

void sub_1884AD288()
{
  BOOL v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FF90);
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v4);
  OUTLINED_FUNCTION_89_3(v5, v21[0]);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FF98);
  uint64_t v23 = *(void *)(v24 - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_44_9((uint64_t)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FFA0);
  v21[2] = *(void *)(v22 - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v8);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_44_9(v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FFA8);
  uint64_t v31 = *(void *)(v10 - 8);
  uint64_t v32 = v10;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v11);
  OUTLINED_FUNCTION_87_3(v12, v21[0]);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FFB0);
  uint64_t v25 = *(void *)(v13 - 8);
  uint64_t v26 = v13;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v14);
  OUTLINED_FUNCTION_15_0();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FFB8);
  uint64_t v27 = *(void *)(v15 - 8);
  uint64_t v28 = v15;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v16);
  OUTLINED_FUNCTION_12_5();
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FFC0);
  uint64_t v36 = *(void *)(v35 - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v17);
  OUTLINED_FUNCTION_101();
  uint64_t v18 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_126_2();
  uint64_t v33 = v19;
  uint64_t v34 = v20;
  OUTLINED_FUNCTION_55_6(v2);
  sub_1884B88BC();
  OUTLINED_FUNCTION_24_0();
  __asm { BR              X10 }

void sub_1884AD444()
{
  *(_BYTE *)(v3 - 12sub_188455A4C(v0, v1, 0) = 0;
  sub_1884B8A9C();
  *(void *)(v3 - 304) = v0;
  id v4 = v0;
  uint64_t v5 = *(void *)(v3 - 168);
  swift_bridgeObjectRetain();
  uint64_t v6 = *(void *)(v3 - 152);
  sub_1884CA70C();
  *(void *)(v3 - 12sub_188455A4C(v0, v1, 0) = v4;
  *(_BYTE *)(v3 - 112) = v1 & 1;
  *(void *)(v3 - 104) = *(void *)(v3 - 160);
  *(void *)(v3 - 96) = v5;
  sub_1884B8E48();
  OUTLINED_FUNCTION_165_1();
  OUTLINED_FUNCTION_35(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 232) + 8LL));
  OUTLINED_FUNCTION_30_4(v6, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 128) + 8LL));
  sub_18844F66C(*(void **)(v3 - 304), v1);
  OUTLINED_FUNCTION_58_8();
  OUTLINED_FUNCTION_0_2();
}

void sub_1884AD7E0()
{
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC38);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v4);
  OUTLINED_FUNCTION_87_3(v5, v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC30);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_28_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC60);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v7);
  OUTLINED_FUNCTION_91_2(v8, v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC58);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v9);
  OUTLINED_FUNCTION_28_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC48);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v10);
  OUTLINED_FUNCTION_89_3(v11, v28);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC50);
  MEMORY[0x1895F8858](v12);
  OUTLINED_FUNCTION_15_0();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC40);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x1895F8858](v14);
  OUTLINED_FUNCTION_32_0();
  uint64_t v29 = (uint64_t)v3;
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1884B88BC();
  OUTLINED_FUNCTION_122_1();
  sub_1884CA9D0();
  if (!v0)
  {
    uint64_t v15 = sub_1884CA6F4();
    uint64_t v16 = *(void *)(v15 + 16);
    if (v16)
    {
      uint64_t v17 = *(unsigned __int8 *)(v15 + 32);
      sub_18842949C(1LL, v16, v15, v15 + 32, 0LL, (2 * v16) | 1);
      uint64_t v19 = v18;
      unint64_t v21 = v20;
      swift_bridgeObjectRelease();
      if (v19 == v21 >> 1) {
        __asm { BR              X9 }
      }
    }

    uint64_t v22 = OUTLINED_FUNCTION_93_2();
    OUTLINED_FUNCTION_109();
    uint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C70E040);
    *uint64_t v24 = &unk_18A2452A0;
    sub_1884CA640();
    OUTLINED_FUNCTION_78();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104LL))( v24,  *MEMORY[0x189619358],  v22);
    swift_willThrow();
    OUTLINED_FUNCTION_30_11();
    OUTLINED_FUNCTION_80_5();
    v25(v1, v13);
  }

  __swift_destroy_boxed_opaque_existential_0Tm(v29);
  OUTLINED_FUNCTION_119_2();
  OUTLINED_FUNCTION_0_2();
}

void sub_1884ADD0C()
{
  *(_BYTE *)(v3 - 128) = 5;
  sub_1884B88F8();
  uint64_t v4 = *(void *)(v3 - 192);
  sub_1884CA634();
  if (v0)
  {
    OUTLINED_FUNCTION_30_11();
    OUTLINED_FUNCTION_80_5();
    JUMPOUT(0x1884ADCF4LL);
  }

  sub_18845FEF8();
  OUTLINED_FUNCTION_97_1();
  OUTLINED_FUNCTION_72_6();
  uint64_t v5 = *(void *)(v3 - 280);
  OUTLINED_FUNCTION_145_0(v4, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_30_11();
  OUTLINED_FUNCTION_45_6(v2, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  JUMPOUT(0x1884ADEA0LL);
}

uint64_t sub_1884ADF7C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6B616873646E6168LL && a2 == 0xE900000000000065LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else
  {
    BOOL v6 = a1 == 0x6F666E4972656570LL && a2 == 0xE800000000000000LL;
    if (v6 || (sub_1884CA820() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1LL;
    }

    else
    {
      BOOL v7 = a1 == 0x694C657461657263LL && a2 == 0xEE0072656E657473LL;
      if (v7 || (sub_1884CA820() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2LL;
      }

      else if (a1 == 0xD000000000000015LL && a2 == 0x80000001884E0630LL || (sub_1884CA820() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3LL;
      }

      else
      {
        BOOL v8 = a1 == 0x6E5565746F6D6572LL && a2 == 0xEC0000006B636F6CLL;
        if (v8 || (sub_1884CA820() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4LL;
        }

        else
        {
          BOOL v9 = a1 == 0x726F727265LL && a2 == 0xE500000000000000LL;
          if (v9 || (sub_1884CA820() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5LL;
          }

          else
          {
            BOOL v10 = a1 == 0x73736563637573LL && a2 == 0xE700000000000000LL;
            if (v10 || (sub_1884CA820() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6LL;
            }

            else if (a1 == 0x747845726F727265LL && a2 == 0xED00006465646E65LL)
            {
              swift_bridgeObjectRelease();
              return 7LL;
            }

            else
            {
              char v12 = sub_1884CA820();
              swift_bridgeObjectRelease();
              if ((v12 & 1) != 0) {
                return 7LL;
              }
              else {
                return 8LL;
              }
            }
          }
        }
      }
    }
  }

uint64_t sub_1884AE308(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1884AE340 + 4 * byte_1884D2E64[a1]))( 0x6B616873646E6168LL,  0xE900000000000065LL);
}

uint64_t sub_1884AE340()
{
  return 0x6F666E4972656570LL;
}

uint64_t sub_1884AE358()
{
  return 0x694C657461657263LL;
}

unint64_t sub_1884AE37C()
{
  return 0xD000000000000015LL;
}

uint64_t sub_1884AE398()
{
  return 0x6E5565746F6D6572LL;
}

uint64_t sub_1884AE3B8()
{
  return 0x726F727265LL;
}

uint64_t sub_1884AE3CC()
{
  return 0x73736563637573LL;
}

uint64_t sub_1884AE3E4()
{
  return 0x747845726F727265LL;
}

uint64_t sub_1884AE408(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1953656688 && a2 == 0xE400000000000000LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x7550656369766564LL && a2 == 0xEF79654B63696C62LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v7 = sub_1884CA820();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1884AE508(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x7550656369766564LL;
  }
  else {
    return 1953656688LL;
  }
}

uint64_t sub_1884AE544(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x79654B74736F68LL && a2 == 0xE700000000000000LL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }

  else
  {
    char v3 = sub_1884CA820();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }

  return v4 & 1;
}

uint64_t sub_1884AE5C8()
{
  return 0x79654B74736F68LL;
}

void sub_1884AE5E0()
{
  uint64_t v14 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD28) - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v5);
  OUTLINED_FUNCTION_101();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD20);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_28_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD60);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v7);
  OUTLINED_FUNCTION_90_4(v8, v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD48);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v9);
  OUTLINED_FUNCTION_28_0();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD50);
  MEMORY[0x1895F8858](v10);
  OUTLINED_FUNCTION_12_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDD30);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v11);
  OUTLINED_FUNCTION_15_0();
  sub_18844F7AC(v0, v15);
  OUTLINED_FUNCTION_141_0();
  sub_1884CA9E8();
  sub_18844F7AC(v15, v16);
  char v12 = (char *)sub_1884AE814 + 4 * word_1884D2E6C[sub_188450C64((uint64_t)v16)];
  __asm { BR              X10 }

void sub_1884AE814()
{
  uint64_t v1 = (const void *)OUTLINED_FUNCTION_69_5();
  *(_BYTE *)(v0 + 232) = 0;
  sub_18844F7AC((const void *)(v0 + 488), (void *)(v0 + 360));
  uint64_t v2 = nullsub_1(v0 + 360);
  sub_1884515EC(v2);
  sub_1884B6DB0();
  uint64_t v4 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 208);
  OUTLINED_FUNCTION_40_10();
  OUTLINED_FUNCTION_142((void *)(v0 + 232), v1);
  sub_1884B6F00();
  sub_1884CA784();
  uint64_t v5 = OUTLINED_FUNCTION_364();
  v6(v5);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 224) + 8LL))(v4, v3);
  sub_1884B6E28(v0 + 488);
  OUTLINED_FUNCTION_119_2();
  OUTLINED_FUNCTION_0_2();
}

void sub_1884AED34()
{
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FE68);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v5);
  OUTLINED_FUNCTION_28_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FE70);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_28_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FE78);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v7);
  OUTLINED_FUNCTION_28_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FE80);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v8);
  OUTLINED_FUNCTION_28_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FE88);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v9);
  OUTLINED_FUNCTION_28_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FE90);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v10);
  OUTLINED_FUNCTION_28_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FE98);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v11);
  OUTLINED_FUNCTION_28_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FEA0);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x1895F8858](v12);
  OUTLINED_FUNCTION_9_0();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FEA8);
  OUTLINED_FUNCTION_55_4();
  MEMORY[0x1895F8858](v14);
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_141_0();
  sub_1884CA9D0();
  if (!v0)
  {
    uint64_t v26 = v1;
    uint64_t v15 = v13;
    uint64_t v16 = sub_1884CA6F4();
    uint64_t v17 = *(void *)(v16 + 16);
    if (v17)
    {
      uint64_t v18 = *(unsigned __int8 *)(v16 + 32);
      sub_18842949C(1LL, v17, v16, v16 + 32, 0LL, (2 * v17) | 1);
      uint64_t v20 = v19;
      unint64_t v22 = v21;
      OUTLINED_FUNCTION_271();
      if (v20 == v22 >> 1) {
        __asm { BR              X9 }
      }
    }

    uint64_t v23 = OUTLINED_FUNCTION_93_2();
    OUTLINED_FUNCTION_109();
    uint64_t v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C70E040);
    *uint64_t v25 = &unk_18A2449F0;
    sub_1884CA640();
    OUTLINED_FUNCTION_78();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 104LL))( v25,  *MEMORY[0x189619358],  v23);
    swift_willThrow();
    OUTLINED_FUNCTION_12_8();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v2, v15);
  }

  __swift_destroy_boxed_opaque_existential_0Tm(v4);
  OUTLINED_FUNCTION_58_8();
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1884AF680(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E657665LL && a2 == 0xE500000000000000LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else
  {
    BOOL v6 = a1 == 0x74736575716572LL && a2 == 0xE700000000000000LL;
    if (v6 || (sub_1884CA820() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1LL;
    }

    else if (a1 == 0x65736E6F70736572LL && a2 == 0xE800000000000000LL)
    {
      swift_bridgeObjectRelease();
      return 2LL;
    }

    else
    {
      char v8 = sub_1884CA820();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0) {
        return 2LL;
      }
      else {
        return 3LL;
      }
    }
  }

uint64_t sub_1884AF7C4(char a1)
{
  if (!a1) {
    return 0x746E657665LL;
  }
  if (a1 == 1) {
    return 0x74736575716572LL;
  }
  return 0x65736E6F70736572LL;
}

uint64_t sub_1884AF818(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014LL && a2 == 0x80000001884E0610LL || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 12639 && a2 == 0xE200000000000000LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = sub_1884CA820();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1884AF8E8(char a1)
{
  if ((a1 & 1) != 0) {
    return 12639LL;
  }
  else {
    return 0xD000000000000014LL;
  }
}

void sub_1884AF918()
{
  uint64_t v4 = v0;
  char v6 = v5;
  uint64_t v35 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDCD0) - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v7);
  OUTLINED_FUNCTION_88_4(v8, v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDCC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v9);
  OUTLINED_FUNCTION_32_0();
  uint64_t v32 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDCC0) - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v10);
  OUTLINED_FUNCTION_101();
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDCB8);
  uint64_t v39 = *(void *)(v41 - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v11);
  OUTLINED_FUNCTION_16_0();
  sub_18844F728(v4, v51);
  __swift_project_boxed_opaque_existential_0Tm(v6, v6[3]);
  sub_1884B6884();
  uint64_t v40 = v3;
  sub_1884CA9E8();
  sub_18844F728(v51, v52);
  int v12 = sub_1884513B0((uint64_t)v52);
  if (!v12)
  {
    uint64_t v22 = OUTLINED_FUNCTION_136_1();
    __int128 v36 = *(_OWORD *)(v22 + 16);
    __int128 v38 = *(_OWORD *)v22;
    __int128 v34 = *(_OWORD *)(v22 + 32);
    __int128 v30 = *(_OWORD *)(v22 + 64);
    __int128 v31 = *(_OWORD *)(v22 + 48);
    uint64_t v23 = *(void *)(v22 + 80);
    uint64_t v24 = *(void *)(v22 + 88);
    char v25 = *(_BYTE *)(v22 + 96);
    LOBYTE(v42) = 0;
    sub_18844F728(v51, v50);
    uint64_t v26 = sub_188451488((uint64_t)v50);
    sub_1884511B0( *(id *)v26,  *(void *)(v26 + 8),  *(void *)(v26 + 16),  *(void *)(v26 + 24),  *(void *)(v26 + 32),  *(void *)(v26 + 40),  *(void *)(v26 + 48),  *(void *)(v26 + 56),  *(void *)(v26 + 64),  *(void *)(v26 + 72),  *(void *)(v26 + 80),  *(void *)(v26 + 88));
    sub_1884B69B0();
    uint64_t v17 = v41;
    sub_1884CA70C();
    __int128 v42 = v38;
    __int128 v43 = v36;
    __int128 v44 = v34;
    __int128 v45 = v31;
    __int128 v46 = v30;
    uint64_t v47 = v23;
    uint64_t v48 = v24;
    char v49 = v25;
    sub_1884B6B10();
    sub_1884CA784();
    OUTLINED_FUNCTION_366_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v32 + 8));
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    uint64_t v21 = v40;
    goto LABEL_5;
  }

  if (v12 == 1)
  {
    uint64_t v13 = OUTLINED_FUNCTION_136_1();
    __int128 v37 = *(_OWORD *)v13;
    uint64_t v14 = *(void *)(v13 + 16);
    uint64_t v15 = *(void *)(v13 + 24);
    uint64_t v16 = OUTLINED_FUNCTION_111_0(1);
    sub_188451284(*(id *)v16, *(void *)(v16 + 8));
    sub_1884B6938();
    uint64_t v17 = v41;
    OUTLINED_FUNCTION_133_1();
    __int128 v42 = v37;
    *(void *)&__int128 v43 = v14;
    *((void *)&v43 + 1) = v15;
    sub_1884B6AD4();
    sub_1884CA784();
    uint64_t v18 = OUTLINED_FUNCTION_347_0();
    OUTLINED_FUNCTION_48_0(v18, v19);
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    uint64_t v21 = v40;
LABEL_5:
    v20(v21, v17);
    goto LABEL_6;
  }

  uint64_t v27 = OUTLINED_FUNCTION_136_1();
  uint64_t v28 = OUTLINED_FUNCTION_111_0(2);
  sub_188451424(v28);
  sub_1884B68C0();
  OUTLINED_FUNCTION_133_1();
  LOBYTE(v42) = 0;
  sub_1884CA7B4();
  if (v1)
  {
    sub_1884B6A28((uint64_t)v51);
    OUTLINED_FUNCTION_29_0(v33, *(uint64_t (**)(uint64_t, uint64_t))(v35 + 8));
    OUTLINED_FUNCTION_30_4(v3, *(uint64_t (**)(uint64_t, uint64_t))(v39 + 8));
    goto LABEL_9;
  }

  sub_18844F7AC((const void *)(v27 + 8), &v42);
  OUTLINED_FUNCTION_54_9();
  sub_1884B6A98();
  sub_1884CA784();
  OUTLINED_FUNCTION_29_0(v33, *(uint64_t (**)(uint64_t, uint64_t))(v35 + 8));
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v3, v41);
LABEL_6:
  sub_1884B6A28((uint64_t)v51);
LABEL_9:
  OUTLINED_FUNCTION_143_1();
  OUTLINED_FUNCTION_0_2();
}

void sub_1884AFD48()
{
  uint64_t v7 = v6;
  uint64_t v27 = v8;
  uint64_t v29 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDBE0) - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v9);
  OUTLINED_FUNCTION_28_0();
  uint64_t v28 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDBD8) - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v10);
  OUTLINED_FUNCTION_28_0();
  uint64_t v30 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDBD0);
  OUTLINED_FUNCTION_55_4();
  MEMORY[0x1895F8858](v12);
  OUTLINED_FUNCTION_12_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDBC8);
  OUTLINED_FUNCTION_160_1();
  MEMORY[0x1895F8858](v13);
  OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_55_6(v7);
  sub_1884B6884();
  OUTLINED_FUNCTION_81_4();
  if (v0) {
    goto LABEL_9;
  }
  uint64_t v26 = v5;
  uint64_t v31 = v2;
  uint64_t v14 = sub_1884CA6F4();
  uint64_t v15 = *(void *)(v14 + 16);
  uint64_t v16 = v3;
  if (!v15)
  {
LABEL_8:
    uint64_t v22 = OUTLINED_FUNCTION_93_2();
    OUTLINED_FUNCTION_109();
    uint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C70E040);
    *uint64_t v24 = &unk_18A244960;
    sub_1884CA640();
    OUTLINED_FUNCTION_78();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104LL))( v24,  *MEMORY[0x189619358],  v22);
    swift_willThrow();
    OUTLINED_FUNCTION_12_8();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v4, v16);
    goto LABEL_9;
  }

  int v17 = *(unsigned __int8 *)(v14 + 32);
  sub_18842949C(1LL, v15, v14, v14 + 32, 0LL, (2 * v15) | 1);
  uint64_t v19 = v18;
  unint64_t v21 = v20;
  OUTLINED_FUNCTION_42_2();
  if (v19 != v21 >> 1)
  {
    uint64_t v16 = v3;
    goto LABEL_8;
  }

  if (v17)
  {
    if (v17 == 1)
    {
      LOBYTE(v34[0]) = 1;
      sub_1884B6938();
      OUTLINED_FUNCTION_96_1();
      sub_1884B6974();
      OUTLINED_FUNCTION_109_2();
      OUTLINED_FUNCTION_145_0(v30, *(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
      OUTLINED_FUNCTION_9_6();
      OUTLINED_FUNCTION_35(v4, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
      v34[0] = v33[0];
      v34[1] = v33[1];
      sub_188451A2C((uint64_t)v34);
    }

    else
    {
      sub_1884B68C0();
      OUTLINED_FUNCTION_97_1();
      OUTLINED_FUNCTION_96_1();
      LOBYTE(v34[0]) = 0;
      uint64_t v25 = sub_1884CA6E8();
      OUTLINED_FUNCTION_54_9();
      sub_1884B68FC();
      OUTLINED_FUNCTION_109_2();
      OUTLINED_FUNCTION_9_17(v29);
      OUTLINED_FUNCTION_9_6();
      OUTLINED_FUNCTION_45_6(v4, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
      sub_18844F7AC(&v35, v32);
      *(void *)&v33[0] = v25;
      sub_18844F7AC(v32, (char *)v33 + 8);
      memcpy(v34, v33, 0x82uLL);
      sub_1884514D4((uint64_t)v34);
    }
  }

  else
  {
    LOBYTE(v34[0]) = 0;
    sub_1884B69B0();
    OUTLINED_FUNCTION_96_1();
    sub_1884B69EC();
    OUTLINED_FUNCTION_109_2();
    OUTLINED_FUNCTION_35(v26, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    OUTLINED_FUNCTION_9_6();
    OUTLINED_FUNCTION_145_0(v4, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    v34[0] = v33[0];
    v34[1] = v33[1];
    v34[2] = v33[2];
    v34[3] = v33[3];
    v34[4] = v33[4];
    v34[5] = v33[5];
    LOBYTE(v34[6]) = v33[6];
    sub_18844F718((uint64_t)v34);
  }

  sub_18844F728(v34, v36);
  sub_18844F728(v36, v27);
LABEL_9:
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v7);
  OUTLINED_FUNCTION_0_2();
}

void sub_1884B0264()
{
}

void sub_1884B0278()
{
}

uint64_t sub_1884B028C()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B02B4()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B02DC()
{
  return sub_1884ABAEC(*v0);
}

uint64_t sub_1884B02E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884AB7B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884B0308()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0330()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0358()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0380()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B03A8()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B03D0()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B03F8()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0420()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0448()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0470()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B049C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884ABBDC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1884B04C4()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B04EC()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0514()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B053C()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0564()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B058C()
{
  return sub_1884CAA00();
}

#error "1884B05BC: call analysis failed (funcsize=5)"
#error "1884B05D0: call analysis failed (funcsize=5)"
uint64_t sub_1884B05DC()
{
  sub_1884B8970();
  return sub_1884CA9F4();
}

uint64_t sub_1884B0604()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B062C()
{
  return sub_1884ACF98(*v0);
}

uint64_t sub_1884B0634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884ACCC4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884B0658()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0680()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B06A8()
{
  return sub_1884AD1A8(*v0);
}

uint64_t sub_1884B06B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884AD06C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884B06D4()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B06FC()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0724()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B074C()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0774()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B079C()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B07C4()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B07EC()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0818@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884AD204(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1884B0840()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0868()
{
  return sub_1884CAA00();
}

void sub_1884B0890()
{
}

void sub_1884B08A4()
{
}

uint64_t sub_1884B08B8()
{
  return sub_1884AE308(*v0);
}

uint64_t sub_1884B08C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884ADF7C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884B08E4()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B090C()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0934()
{
  return sub_1884AE508(*v0);
}

uint64_t sub_1884B093C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884AE408(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884B0960()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0988()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B09B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884AE544(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1884B09DC()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0A04()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0A2C()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0A54()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0A7C()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0AA4()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0ACC()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0AF4()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0B1C()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0B44()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0B6C()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0B94()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0BBC()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0BE4()
{
  return sub_1884CAA00();
}

void sub_1884B0C0C()
{
}

void sub_1884B0C20()
{
}

uint64_t sub_1884B0C34()
{
  return sub_1884AF7C4(*v0);
}

uint64_t sub_1884B0C3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884AF680(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884B0C60()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0C88()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0CB0()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0CD8()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0D00()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0D28()
{
  return sub_1884CAA00();
}

uint64_t sub_1884B0D50()
{
  return sub_1884AF8E8(*v0);
}

uint64_t sub_1884B0D58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884AF818(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884B0D7C()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B0DA4()
{
  return sub_1884CAA00();
}

void sub_1884B0DCC()
{
}

void sub_1884B0DE0()
{
}

uint64_t static ControlChannelConnectionIdentifierCategory.numberOfCharacters.getter()
{
  return 6LL;
}

uint64_t static ControlChannelConnectionIdentifierCategory.prefix.getter()
{
  return 1852793699LL;
}

uint64_t sub_1884B0E0C()
{
  return 1852793699LL;
}

uint64_t sub_1884B0E1C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013LL && a2 == 0x80000001884E06F0LL || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else
  {
    BOOL v5 = a1 == 0x6974704F74736F68LL && a2 == 0xEB00000000736E6FLL;
    if (v5 || (sub_1884CA820() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1LL;
    }

    else if (a1 == 0xD000000000000015LL && a2 == 0x80000001884DC980LL)
    {
      swift_bridgeObjectRelease();
      return 2LL;
    }

    else
    {
      char v6 = sub_1884CA820();
      swift_bridgeObjectRelease();
      if ((v6 & 1) != 0) {
        return 2LL;
      }
      else {
        return 3LL;
      }
    }
  }

uint64_t sub_1884B0F7C(char a1)
{
  uint64_t result = 0xD000000000000013LL;
  if (a1)
  {
    if (a1 == 1) {
      return 0x6974704F74736F68LL;
    }
    else {
      return 0xD000000000000015LL;
    }
  }

  return result;
}

void sub_1884B0FE4()
{
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C710040);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x1895F8858](v5);
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_126_2();
  OUTLINED_FUNCTION_55_6(v4);
  sub_1884BA0CC();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_116_2();
  sub_1884B8F38((uint64_t)&unk_18C4DD938);
  OUTLINED_FUNCTION_134_1();
  OUTLINED_FUNCTION_14_6();
  if (!v0)
  {
    OUTLINED_FUNCTION_54_9();
    sub_1884BA144();
    OUTLINED_FUNCTION_14_6();
    OUTLINED_FUNCTION_63_6();
    OUTLINED_FUNCTION_18_9();
    OUTLINED_FUNCTION_151_1((uint64_t)&unk_18C710050);
    OUTLINED_FUNCTION_134_1();
    OUTLINED_FUNCTION_60_4();
  }

  OUTLINED_FUNCTION_30_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_58_8();
  OUTLINED_FUNCTION_0_2();
}

void sub_1884B1124()
{
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDB80);
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x1895F8858](v4);
  char v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  OUTLINED_FUNCTION_50_0();
  sub_1884BA0CC();
  OUTLINED_FUNCTION_122_1();
  OUTLINED_FUNCTION_16_2();
  if (v0)
  {
    OUTLINED_FUNCTION_70_3();
    OUTLINED_FUNCTION_115_2();
  }

  else
  {
    OUTLINED_FUNCTION_116_2();
    sub_1884B8F38((uint64_t)&unk_18C4DD940);
    OUTLINED_FUNCTION_121_1();
    OUTLINED_FUNCTION_72_6();
    uint64_t v7 = (void *)v11[0];
    OUTLINED_FUNCTION_54_9();
    sub_1884BA108();
    id v8 = v7;
    OUTLINED_FUNCTION_97_1();
    OUTLINED_FUNCTION_72_6();
    char v12 = v11[0];
    OUTLINED_FUNCTION_18_9();
    OUTLINED_FUNCTION_63_6();
    OUTLINED_FUNCTION_151_1((uint64_t)&unk_18C4DC640);
    sub_1884CA670();
    OUTLINED_FUNCTION_145_0((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    uint64_t v10 = v11[0];
    uint64_t v9 = v11[1];
    OUTLINED_FUNCTION_7_3();
    OUTLINED_FUNCTION_115_2();
    *(void *)uint64_t v3 = v8;
    *(_BYTE *)(v3 + 8) = v12;
    *(void *)(v3 + 16) = v10;
    *(void *)(v3 + 24) = v9;
    OUTLINED_FUNCTION_70_3();
    swift_bridgeObjectRelease();
  }

  OUTLINED_FUNCTION_119_2();
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1884B12F0()
{
  return sub_1884B0F7C(*v0);
}

uint64_t sub_1884B12F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884B0E1C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884B131C()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B1344()
{
  return sub_1884CAA00();
}

void sub_1884B136C()
{
}

void sub_1884B1380()
{
}

uint64_t sub_1884B1394(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013LL && a2 == 0x80000001884E06F0LL || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0xD000000000000023LL && a2 == 0x80000001884E0710LL || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    BOOL v5 = a1 == 0x704F656369766564LL && a2 == 0xED0000736E6F6974LL;
    if (v5 || (sub_1884CA820() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2LL;
    }

    else if (a1 == 0x6976654472656570LL && a2 == 0xEE006F666E496563LL)
    {
      swift_bridgeObjectRelease();
      return 3LL;
    }

    else
    {
      char v7 = sub_1884CA820();
      swift_bridgeObjectRelease();
      if ((v7 & 1) != 0) {
        return 3LL;
      }
      else {
        return 4LL;
      }
    }
  }

uint64_t sub_1884B1584(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1884B15BC + 4 * byte_1884D2E84[a1]))( 0xD000000000000013LL,  0x80000001884E06F0LL);
}

uint64_t sub_1884B15BC(uint64_t a1)
{
  return a1 + 16;
}

uint64_t sub_1884B15D4()
{
  return 0x704F656369766564LL;
}

uint64_t sub_1884B15F8()
{
  return 0x6976654472656570LL;
}

void sub_1884B161C()
{
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDCB0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  OUTLINED_FUNCTION_101();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1884B8EC0();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_116_2();
  sub_1884B8F38((uint64_t)&unk_18C4DD938);
  OUTLINED_FUNCTION_14_6();
  if (!v0)
  {
    OUTLINED_FUNCTION_54_9();
    OUTLINED_FUNCTION_14_6();
    OUTLINED_FUNCTION_63_6();
    sub_1884B8F6C();
    OUTLINED_FUNCTION_14_6();
    sub_1884B6EC4();
    OUTLINED_FUNCTION_60_4();
  }

  OUTLINED_FUNCTION_366_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_58_8();
  OUTLINED_FUNCTION_0_2();
}

void sub_1884B18B8()
{
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FFE8);
  OUTLINED_FUNCTION_55_4();
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_12_5();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1884B8EC0();
  OUTLINED_FUNCTION_81_4();
  if (v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_157_0();
    OUTLINED_FUNCTION_34_9(v7, v8, v9, v10, v11, v12, v13, v14, v32, v34, v36, v38);
  }

  else
  {
    uint64_t v55 = v5;
    OUTLINED_FUNCTION_116_2();
    sub_1884B8F38((uint64_t)&unk_18C4DD940);
    OUTLINED_FUNCTION_43_10();
    id v15 = v76[0];
    OUTLINED_FUNCTION_43_10();
    LOBYTE(v57[0]) = 2;
    sub_1884B8EFC();
    id v16 = v76[0];
    sub_1884CA6B8();
    char v53 = BYTE2(v76[0]);
    char v54 = (char)v76[0];
    char v52 = BYTE3(v76[0]);
    char v50 = BYTE1(v76[0]);
    char v51 = BYTE4(v76[0]);
    char v97 = 3;
    sub_1884B6D74();
    sub_1884CA670();
    OUTLINED_FUNCTION_9_17(v1);
    __int128 v42 = v16;
    uint64_t v43 = v99;
    uint64_t v17 = v100;
    uint64_t v18 = v101;
    uint64_t v56 = v102;
    uint64_t v40 = v103;
    uint64_t v41 = v15;
    uint64_t v19 = v104;
    id v20 = v15;
    uint64_t v45 = v106;
    uint64_t v46 = v107;
    id v21 = v16;
    uint64_t v47 = v108;
    unint64_t v48 = v109;
    char v49 = v110;
    uint64_t v22 = v98;
    uint64_t v35 = v104;
    uint64_t v37 = v98;
    uint64_t v33 = v100;
    uint64_t v44 = v101;
    uint64_t v23 = v105;
    unint64_t v39 = v105;
    uint64_t v24 = sub_18843A2CC(v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109);
    OUTLINED_FUNCTION_34_9(v24, v25, v26, v27, v28, v29, v30, v31, v33, v35, v37, v39);
    v57[0] = v20;
    v57[1] = v21;
    char v58 = v54;
    char v59 = v50;
    char v60 = v53;
    char v61 = v52;
    char v62 = v51;
    uint64_t v63 = v22;
    uint64_t v64 = v43;
    uint64_t v65 = v17;
    uint64_t v66 = v18;
    uint64_t v67 = v56;
    uint64_t v68 = v40;
    uint64_t v69 = v19;
    uint64_t v70 = v23;
    uint64_t v71 = v45;
    uint64_t v72 = v46;
    uint64_t v73 = v47;
    unint64_t v74 = v48;
    char v75 = v49;
    sub_1884515EC((uint64_t)v57);
    sub_18843A3CC(v47, v43, v45, v44, v56, v40, v46, v48, v45, v46, v47, v48);

    OUTLINED_FUNCTION_142(v55, v57);
    OUTLINED_FUNCTION_157_0();
    v76[0] = v41;
    v76[1] = v42;
    char v77 = v54;
    char v78 = v50;
    char v79 = v53;
    char v80 = v52;
    char v81 = v51;
    __int16 v82 = v111;
    char v83 = v112;
    uint64_t v84 = v47;
    uint64_t v85 = v43;
    uint64_t v86 = v45;
    uint64_t v87 = v44;
    uint64_t v88 = v56;
    uint64_t v89 = v40;
    uint64_t v90 = v46;
    unint64_t v91 = v48;
    uint64_t v92 = v45;
    uint64_t v93 = v46;
    uint64_t v94 = v47;
    unint64_t v95 = v48;
    char v96 = v49;
    sub_18845169C((uint64_t)v76);
  }

  OUTLINED_FUNCTION_58_8();
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1884B1CAC()
{
  return sub_1884B1584(*v0);
}

uint64_t sub_1884B1CB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884B1394(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884B1CD8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_188430CE0();
  *a1 = result;
  return result;
}

uint64_t sub_1884B1CFC()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B1D24()
{
  return sub_1884CAA00();
}

void sub_1884B1D4C()
{
}

void sub_1884B1D60()
{
}

void PeerDeviceInfo.identifier.getter()
{
}

void PeerDeviceInfo.identifier.setter()
{
  *uint64_t v1 = v2;
  v1[1] = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PeerDeviceInfo.identifier.modify())()
{
  return nullsub_1;
}

void PeerDeviceInfo.name.getter()
{
}

void PeerDeviceInfo.name.setter()
{
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PeerDeviceInfo.name.modify())()
{
  return nullsub_1;
}

void PeerDeviceInfo.model.getter()
{
}

void PeerDeviceInfo.model.setter()
{
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 4sub_188455A4C(v0, v1, 0) = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PeerDeviceInfo.model.modify())()
{
  return nullsub_1;
}

void PeerDeviceInfo.udid.getter()
{
}

void PeerDeviceInfo.udid.setter()
{
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 56) = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PeerDeviceInfo.udid.modify())()
{
  return nullsub_1;
}

uint64_t PeerDeviceInfo.ecid.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t PeerDeviceInfo.ecid.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 64) = result;
  *(_BYTE *)(v2 + 72) = a2 & 1;
  return result;
}

uint64_t (*PeerDeviceInfo.ecid.modify())()
{
  return nullsub_1;
}

void PeerDeviceInfo.deviceKVSData.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_69();
  sub_18842A484(v0, v1);
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1_0();
}

void PeerDeviceInfo.deviceKVSData.setter()
{
  *(void *)(v1 + 8sub_188455A4C(v0, v1, 0) = v2;
  *(void *)(v1 + 88) = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PeerDeviceInfo.deviceKVSData.modify())()
{
  return nullsub_1;
}

uint64_t PeerDeviceInfo.deviceKVSIncludesSensitiveInfo.getter()
{
  return *(unsigned __int8 *)(v0 + 96);
}

uint64_t PeerDeviceInfo.deviceKVSIncludesSensitiveInfo.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 96) = result;
  return result;
}

uint64_t (*PeerDeviceInfo.deviceKVSIncludesSensitiveInfo.modify())()
{
  return nullsub_1;
}

uint64_t sub_1884B1F7C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469LL && a2 == 0xEA00000000007265LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else
  {
    BOOL v6 = a1 == 1701667182 && a2 == 0xE400000000000000LL;
    if (v6 || (sub_1884CA820() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1LL;
    }

    else
    {
      BOOL v7 = a1 == 0x6C65646F6DLL && a2 == 0xE500000000000000LL;
      if (v7 || (sub_1884CA820() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2LL;
      }

      else
      {
        BOOL v8 = a1 == 1684628597 && a2 == 0xE400000000000000LL;
        if (v8 || (sub_1884CA820() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3LL;
        }

        else
        {
          BOOL v9 = a1 == 1684628325 && a2 == 0xE400000000000000LL;
          if (v9 || (sub_1884CA820() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4LL;
          }

          else
          {
            BOOL v10 = a1 == 0x564B656369766564LL && a2 == 0xED00006174614453LL;
            if (v10 || (sub_1884CA820() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5LL;
            }

            else if (a1 == 0xD00000000000001ELL && a2 == 0x80000001884E05D0LL)
            {
              swift_bridgeObjectRelease();
              return 6LL;
            }

            else
            {
              char v11 = sub_1884CA820();
              swift_bridgeObjectRelease();
              if ((v11 & 1) != 0) {
                return 6LL;
              }
              else {
                return 7LL;
              }
            }
          }
        }
      }
    }
  }

uint64_t sub_1884B223C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1884B2274 + 4 * byte_1884D2E88[a1]))( 0x696669746E656469LL,  0xEA00000000007265LL);
}

uint64_t sub_1884B2274()
{
  return 1701667182LL;
}

uint64_t sub_1884B2284()
{
  return 0x6C65646F6DLL;
}

uint64_t sub_1884B2298()
{
  return 1684628597LL;
}

uint64_t sub_1884B22AC()
{
  return 1684628325LL;
}

uint64_t sub_1884B22BC()
{
  return 0x564B656369766564LL;
}

unint64_t sub_1884B22E0()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_1884B22FC()
{
  return sub_1884B223C(*v0);
}

uint64_t sub_1884B2304@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884B1F7C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884B2328()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B2350()
{
  return sub_1884CAA00();
}

void PeerDeviceInfo.encode(to:)()
{
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDC98);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_126_2();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1884B2554();
  sub_1884CA9E8();
  sub_1884CA718();
  if (!v0)
  {
    OUTLINED_FUNCTION_118_1(1);
    OUTLINED_FUNCTION_59_9();
    OUTLINED_FUNCTION_118_1(2);
    OUTLINED_FUNCTION_59_9();
    OUTLINED_FUNCTION_118_1(3);
    OUTLINED_FUNCTION_364();
    OUTLINED_FUNCTION_59_9();
    OUTLINED_FUNCTION_118_1(4);
    OUTLINED_FUNCTION_110_1();
    sub_1884CA748();
    OUTLINED_FUNCTION_114_1(5);
    OUTLINED_FUNCTION_60_4();
    OUTLINED_FUNCTION_110_1();
    sub_1884CA724();
  }

  OUTLINED_FUNCTION_30_4(v1, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_58_8();
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_1884B2554()
{
  unint64_t result = qword_18C4DC7F8;
  if (!qword_18C4DC7F8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3898, &type metadata for PeerDeviceInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DC7F8);
  }

  return result;
}

void PeerDeviceInfo.init(from:)()
{
  BOOL v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FDD0);
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x1895F8858](v5);
  OUTLINED_FUNCTION_9_0();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1884B2554();
  sub_1884CA9D0();
  if (v0)
  {
    uint64_t v12 = 0LL;
    unint64_t v11 = 0xF000000000000000LL;
    OUTLINED_FUNCTION_70_3();
    OUTLINED_FUNCTION_42_2();
  }

  else
  {
    OUTLINED_FUNCTION_74_4();
    uint64_t v6 = sub_1884CA64C();
    uint64_t v8 = v7;
    LOBYTE(v23) = 1;
    swift_bridgeObjectRetain();
    uint64_t v18 = OUTLINED_FUNCTION_52_9();
    uint64_t v19 = v6;
    OUTLINED_FUNCTION_62_6(2);
    uint64_t v22 = v6;
    uint64_t v17 = OUTLINED_FUNCTION_52_9();
    OUTLINED_FUNCTION_62_6(3);
    uint64_t v21 = v6;
    uint64_t v16 = OUTLINED_FUNCTION_52_9();
    OUTLINED_FUNCTION_62_6(4);
    OUTLINED_FUNCTION_74_4();
    uint64_t v20 = v6;
    uint64_t v9 = sub_1884CA67C();
    char v25 = v10;
    uint64_t v15 = v9;
    sub_18845FEF8();
    sub_1884CA670();
    uint64_t v14 = v4;
    uint64_t v12 = v23;
    unint64_t v11 = v24;
    OUTLINED_FUNCTION_155_0();
    OUTLINED_FUNCTION_74_4();
    char v13 = sub_1884CA658();
    OUTLINED_FUNCTION_10_10();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_124_1();
    OUTLINED_FUNCTION_155_0();
    sub_18842A578(v23, v24);
    OUTLINED_FUNCTION_42_2();
    OUTLINED_FUNCTION_102_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_271();
    *(void *)uint64_t v14 = v19;
    *(void *)(v14 + 8) = v8;
    *(void *)(v14 + 16) = v18;
    *(void *)(v14 + 24) = v22;
    *(void *)(v14 + 32) = v17;
    *(void *)(v14 + 4sub_188455A4C(v0, v1, 0) = v21;
    *(void *)(v14 + 48) = v16;
    *(void *)(v14 + 56) = v20;
    *(void *)(v14 + 64) = v15;
    *(_BYTE *)(v14 + 72) = v25 & 1;
    *(void *)(v14 + 8sub_188455A4C(v0, v1, 0) = v23;
    *(void *)(v14 + 88) = v24;
    *(_BYTE *)(v14 + 96) = v13;
    OUTLINED_FUNCTION_70_3();
    OUTLINED_FUNCTION_271();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_102_0();
    swift_bridgeObjectRelease();
  }

  sub_18842A578(v12, v11);
  OUTLINED_FUNCTION_119_2();
  OUTLINED_FUNCTION_0_2();
}

void sub_1884B28FC()
{
}

void sub_1884B2910()
{
}

uint64_t ListenerStartedResponse.port.getter()
{
  return *v0;
}

void ListenerStartedResponse.deviceRawPublicKey.getter()
{
}

uint64_t ListenerStartedResponse.init(port:deviceRawPublicKey:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_WORD *)a4 = result;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = a3;
  return result;
}

uint64_t sub_1884B2958(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1953656688 && a2 == 0xE400000000000000LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0xD000000000000012LL && a2 == 0x80000001884E05F0LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = sub_1884CA820();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1884B2A34(char a1)
{
  if ((a1 & 1) != 0) {
    return 0xD000000000000012LL;
  }
  else {
    return 1953656688LL;
  }
}

void sub_1884B2A68()
{
}

uint64_t sub_1884B2A8C()
{
  return sub_1884B2A34(*v0);
}

uint64_t sub_1884B2A94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884B2958(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884B2AB8()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B2AE0()
{
  return sub_1884CAA00();
}

void ListenerStartedResponse.encode(to:)()
{
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FDD8);
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x1895F8858](v5);
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_55_6(v4);
  sub_1884B2BEC();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_110_1();
  sub_1884CA7A8();
  if (!v0)
  {
    OUTLINED_FUNCTION_114_1(1);
    OUTLINED_FUNCTION_14_6();
  }

  OUTLINED_FUNCTION_30_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_58_8();
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_1884B2BEC()
{
  unint64_t result = qword_18C70FDE0;
  if (!qword_18C70FDE0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3848, &type metadata for ListenerStartedResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FDE0);
  }

  return result;
}

void ListenerStartedResponse.init(from:)()
{
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FDE8);
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x1895F8858](v4);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  OUTLINED_FUNCTION_50_0();
  sub_1884B2BEC();
  OUTLINED_FUNCTION_122_1();
  OUTLINED_FUNCTION_16_2();
  if (!v0)
  {
    LOBYTE(v9) = 0;
    __int16 v7 = sub_1884CA6DC();
    OUTLINED_FUNCTION_54_9();
    sub_18845FEF8();
    sub_1884CA6B8();
    OUTLINED_FUNCTION_29_0((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    __int128 v8 = v9;
    *(_WORD *)uint64_t v3 = v7;
    *(_OWORD *)(v3 + 8) = v8;
  }

  OUTLINED_FUNCTION_70_3();
  OUTLINED_FUNCTION_143_1();
  OUTLINED_FUNCTION_0_2();
}

void sub_1884B2D3C()
{
}

void sub_1884B2D50()
{
}

void StreamEncryptedMessage.encryptedData.getter()
{
}

uint64_t sub_1884B2D84(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6574707972636E65LL && a2 == 0xED00006174614464LL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }

  else
  {
    char v3 = sub_1884CA820();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }

  return v4 & 1;
}

uint64_t sub_1884B2E2C()
{
  return 0x6574707972636E65LL;
}

void sub_1884B2E50()
{
}

uint64_t sub_1884B2E7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884B2D84(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1884B2EA4()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B2ECC()
{
  return sub_1884CAA00();
}

void StreamEncryptedMessage.encode(to:)()
{
  char v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FDF0);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x1895F8858](v4);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_55_6(v3);
  sub_1884B2FA4();
  OUTLINED_FUNCTION_24_0();
  sub_18845D554();
  OUTLINED_FUNCTION_132_1();
  OUTLINED_FUNCTION_35(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_1884B2FA4()
{
  unint64_t result = qword_18C70FDF8;
  if (!qword_18C70FDF8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D37F8, &type metadata for StreamEncryptedMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FDF8);
  }

  return result;
}

void StreamEncryptedMessage.init(from:)()
{
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C70FE00);
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x1895F8858](v5);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_50_0();
  sub_1884B2FA4();
  OUTLINED_FUNCTION_16_2();
  if (!v0)
  {
    sub_18845FEF8();
    OUTLINED_FUNCTION_109_2();
    OUTLINED_FUNCTION_29_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    *uint64_t v4 = v6;
  }

  OUTLINED_FUNCTION_70_3();
  OUTLINED_FUNCTION_0_2();
}

void sub_1884B30A8()
{
}

void sub_1884B30BC()
{
}

uint64_t PropertyListCodable.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t PropertyListCodable.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8LL) + 40LL))(v2, a1);
}

uint64_t (*PropertyListCodable.wrappedValue.modify())()
{
  return nullsub_1;
}

void PropertyListCodable.init(from:)()
{
  uint64_t v39 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v37 = v6;
  v41[5] = *MEMORY[0x1895F89C0];
  uint64_t v7 = sub_1884CA418();
  uint64_t v35 = *(void *)(v7 - 8);
  uint64_t v36 = v7;
  MEMORY[0x1895F8858](v7);
  unint64_t v38 = (char *)&v30 - v8;
  uint64_t v34 = *(void *)(v3 - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v9);
  OUTLINED_FUNCTION_9_0();
  uint64_t v12 = type metadata accessor for PropertyListCodable(0LL, v3, v10, v11);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1895F8858](v12);
  uint64_t v15 = (char *)&v30 - v14;
  __swift_project_boxed_opaque_existential_0Tm(v5, v5[3]);
  uint64_t v16 = v39;
  sub_1884CA9C4();
  if (v16) {
    goto LABEL_10;
  }
  uint64_t v31 = v15;
  uint64_t v32 = v13;
  uint64_t v33 = v1;
  uint64_t v39 = v12;
  __swift_project_boxed_opaque_existential_0Tm(v41, v41[3]);
  sub_18845FEF8();
  sub_1884CA838();
  uint64_t v17 = (void *)objc_opt_self();
  uint64_t v18 = (void *)sub_1884C971C();
  id v40 = 0LL;
  id v19 = objc_msgSend(v17, sel_propertyListWithData_options_format_error_, v18, 0, 0, &v40);

  if (!v19)
  {
    id v27 = v40;
    sub_1884C9620();

    goto LABEL_8;
  }

  uint64_t v20 = v5;
  id v21 = v40;
  sub_1884CA46C();
  swift_unknownObjectRelease();
  uint64_t v22 = (uint64_t)v38;
  if ((swift_dynamicCast() & 1) == 0)
  {
    OUTLINED_FUNCTION_166_0(v22, 1LL);
    uint64_t v28 = OUTLINED_FUNCTION_347_0();
    v29(v28);
    sub_18842FF50();
    OUTLINED_FUNCTION_109();
    sub_18842E9B8();
    sub_1884CA8C8();
LABEL_8:
    swift_willThrow();
    OUTLINED_FUNCTION_125_2();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v41);
LABEL_10:
    uint64_t v26 = (uint64_t)v5;
    goto LABEL_11;
  }

  OUTLINED_FUNCTION_166_0(v22, 0LL);
  OUTLINED_FUNCTION_125_2();
  uint64_t v23 = v33;
  unint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32);
  v24(v33, v22, v3);
  char v25 = v31;
  v24((uint64_t)v31, v23, v3);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v41);
  (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v37, v25, v39);
  uint64_t v26 = (uint64_t)v20;
LABEL_11:
  __swift_destroy_boxed_opaque_existential_0Tm(v26);
  OUTLINED_FUNCTION_0_2();
}

uint64_t type metadata accessor for PropertyListCodable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PropertyListCodable);
}

uint64_t PropertyListCodable.encode(to:)(void *a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1884CA9DC();
  uint64_t v1 = (void *)objc_opt_self();
  v9[0] = 0LL;
  id v2 = objc_msgSend(v1, sel_dataWithPropertyList_format_options_error_, sub_1884CA814(), 200, 0, v9);
  swift_unknownObjectRelease();
  id v3 = v9[0];
  if (v2)
  {
    uint64_t v4 = (void *)sub_1884C9734();
    uint64_t v6 = v5;

    v9[0] = v4;
    v9[1] = v6;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
    sub_18845D554();
    sub_1884CA850();
    sub_18842A58C((uint64_t)v4, (unint64_t)v6);
  }

  else
  {
    uint64_t v7 = v3;
    sub_1884C9620();

    swift_willThrow();
  }

  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
}

void sub_1884B3590()
{
}

uint64_t sub_1884B35A8(void *a1)
{
  return PropertyListCodable.encode(to:)(a1);
}

RemotePairingDevice::PairingData::Kind_optional __swiftcall PairingData.Kind.init(rawValue:)(Swift::String rawValue)
{
  id v2 = v1;
  unint64_t v3 = sub_1884CA628();
  OUTLINED_FUNCTION_5_5();
  char v4 = 4;
  if (v3 < 4) {
    char v4 = v3;
  }
  *id v2 = v4;
  OUTLINED_FUNCTION_40();
  return result;
}

uint64_t PairingData.Kind.rawValue.getter()
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1884B3640 + 4 * byte_1884D2E8F[*v0]))( 0xD000000000000013LL,  0x80000001884DAB10LL);
}

unint64_t sub_1884B3640()
{
  return 0xD000000000000012LL;
}

uint64_t sub_1884B365C@<X0>(uint64_t a1@<X8>)
{
  return a1 + 17;
}

void sub_1884B3684(char *a1)
{
}

void sub_1884B3690()
{
}

void sub_1884B3698(uint64_t a1)
{
}

void sub_1884B36A0()
{
}

RemotePairingDevice::PairingData::Kind_optional sub_1884B36A8(Swift::String *a1)
{
  return PairingData.Kind.init(rawValue:)(*a1);
}

uint64_t sub_1884B36B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PairingData.Kind.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1884B36D8()
{
  return sub_1884CA1A8();
}

uint64_t sub_1884B3734()
{
  return sub_1884CA190();
}

uint64_t PairingData.startNewSession.getter()
{
  return *v0;
}

uint64_t PairingData.startNewSession.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*PairingData.startNewSession.modify())()
{
  return nullsub_1;
}

void PairingData.kind.getter(_BYTE *a1@<X8>)
{
  *a1 = *(_BYTE *)(v1 + 1);
}

_BYTE *PairingData.kind.setter(_BYTE *result)
{
  *(_BYTE *)(v1 + 1) = *result;
  return result;
}

uint64_t (*PairingData.kind.modify())()
{
  return nullsub_1;
}

void PairingData.data.getter()
{
}

void PairingData.data.setter()
{
  *(void *)(v1 + 8) = v2;
  *(void *)(v1 + 16) = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PairingData.data.modify())()
{
  return nullsub_1;
}

void PairingData.sendingHost.getter()
{
}

void PairingData.sendingHost.setter()
{
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PairingData.sendingHost.modify())()
{
  return nullsub_1;
}

uint64_t PairingData.pairingOptions.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t PairingData.pairingOptions.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 4sub_188455A4C(v0, v1, 0) = v2;
  return result;
}

uint64_t (*PairingData.pairingOptions.modify())()
{
  return nullsub_1;
}

uint64_t sub_1884B38BC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x77654E7472617473LL && a2 == 0xEF6E6F6973736553LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else
  {
    BOOL v6 = a1 == 1684957547 && a2 == 0xE400000000000000LL;
    if (v6 || (sub_1884CA820() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1LL;
    }

    else
    {
      BOOL v7 = a1 == 1635017060 && a2 == 0xE400000000000000LL;
      if (v7 || (sub_1884CA820() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2LL;
      }

      else
      {
        BOOL v8 = a1 == 0x48676E69646E6573LL && a2 == 0xEB0000000074736FLL;
        if (v8 || (sub_1884CA820() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3LL;
        }

        else if (a1 == 0x4F676E6972696170LL && a2 == 0xEE00736E6F697470LL)
        {
          swift_bridgeObjectRelease();
          return 4LL;
        }

        else
        {
          char v10 = sub_1884CA820();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0) {
            return 4LL;
          }
          else {
            return 5LL;
          }
        }
      }
    }
  }

uint64_t sub_1884B3B10(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1884B3B50 + 4 * byte_1884D2E93[a1]))( 0x77654E7472617473LL,  0xEF6E6F6973736553LL);
}

uint64_t sub_1884B3B50()
{
  return 1684957547LL;
}

uint64_t sub_1884B3B60()
{
  return 1635017060LL;
}

uint64_t sub_1884B3B70()
{
  return 0x48676E69646E6573LL;
}

uint64_t sub_1884B3B90()
{
  return 0x4F676E6972696170LL;
}

uint64_t sub_1884B3BB4()
{
  return sub_1884B3B10(*v0);
}

uint64_t sub_1884B3BBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884B38BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884B3BE0()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884B3C08()
{
  return sub_1884CAA00();
}

void PairingData.encode(to:)()
{
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDCA0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  OUTLINED_FUNCTION_101();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1884B404C();
  sub_1884CA9E8();
  OUTLINED_FUNCTION_110_1();
  sub_1884CA760();
  if (!v0)
  {
    OUTLINED_FUNCTION_54_9();
    sub_1884B4088();
    OUTLINED_FUNCTION_14_6();
    OUTLINED_FUNCTION_63_6();
    sub_18845D554();
    OUTLINED_FUNCTION_14_6();
    OUTLINED_FUNCTION_118_1(3);
    OUTLINED_FUNCTION_110_1();
    sub_1884CA718();
    OUTLINED_FUNCTION_18_9();
    OUTLINED_FUNCTION_151_1((uint64_t)&unk_18C4DCD68);
    OUTLINED_FUNCTION_60_4();
  }

  OUTLINED_FUNCTION_366_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_58_8();
  OUTLINED_FUNCTION_0_2();
}

void PairingData.init(from:)()
{
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDB78);
  OUTLINED_FUNCTION_160_1();
  MEMORY[0x1895F8858](v7);
  OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_55_6(v4);
  sub_1884B404C();
  OUTLINED_FUNCTION_81_4();
  if (v0)
  {
    OUTLINED_FUNCTION_112_2();
    OUTLINED_FUNCTION_115_2();
  }

  else
  {
    LOBYTE(v15) = 0;
    OUTLINED_FUNCTION_153();
    char v8 = sub_1884CA694();
    OUTLINED_FUNCTION_54_9();
    sub_1884B40C4();
    OUTLINED_FUNCTION_64_5();
    OUTLINED_FUNCTION_63_6();
    sub_18845FEF8();
    OUTLINED_FUNCTION_64_5();
    uint64_t v14 = v6;
    uint64_t v9 = v15;
    LOBYTE(v15) = 3;
    OUTLINED_FUNCTION_39_3();
    OUTLINED_FUNCTION_153();
    uint64_t v10 = sub_1884CA64C();
    uint64_t v12 = v11;
    uint64_t v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DCD78);
    sub_1884BA180((uint64_t)&unk_18C4DCD70);
    OUTLINED_FUNCTION_124_1();
    OUTLINED_FUNCTION_121_1();
    sub_1884CA670();
    OUTLINED_FUNCTION_145_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    OUTLINED_FUNCTION_7_3();
    OUTLINED_FUNCTION_115_2();
    OUTLINED_FUNCTION_39_3();
    OUTLINED_FUNCTION_68_1();
    *(_BYTE *)uint64_t v14 = v8 & 1;
    *(_BYTE *)(v14 + 1) = 0;
    *(void *)(v14 + 8) = v9;
    *(void *)(v14 + 16) = v16;
    *(void *)(v14 + 24) = v13;
    *(void *)(v14 + 32) = v12;
    *(void *)(v14 + 4sub_188455A4C(v0, v1, 0) = v15;
    OUTLINED_FUNCTION_112_2();
    OUTLINED_FUNCTION_68_1();
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_2();
}

void sub_1884B4024()
{
}

void sub_1884B4038()
{
}

unint64_t sub_1884B404C()
{
  unint64_t result = qword_18C4DCA90;
  if (!qword_18C4DCA90)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D37A8, &type metadata for PairingData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCA90);
  }

  return result;
}

unint64_t sub_1884B4088()
{
  unint64_t result = qword_18C4DCAA8;
  if (!qword_18C4DCAA8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for PairingData.Kind,  &type metadata for PairingData.Kind);
    atomic_store(result, (unint64_t *)&qword_18C4DCAA8);
  }

  return result;
}

unint64_t sub_1884B40C4()
{
  unint64_t result = qword_18C4DCAB8;
  if (!qword_18C4DCAB8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for PairingData.Kind,  &type metadata for PairingData.Kind);
    atomic_store(result, (unint64_t *)&qword_18C4DCAB8);
  }

  return result;
}

unint64_t sub_1884B4104()
{
  unint64_t result = qword_18C70FE08;
  if (!qword_18C70FE08)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for PairingData.Kind,  &type metadata for PairingData.Kind);
    atomic_store(result, (unint64_t *)&qword_18C70FE08);
  }

  return result;
}

uint64_t destroy for ControlChannelMessageEnvelope(uint64_t a1)
{
  return sub_1884510A4( *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void *)(a1 + 88),  *(void *)(a1 + 96),  *(void *)(a1 + 104),  *(void *)(a1 + 112),  *(void *)(a1 + 120),  *(void *)(a1 + 128),  *(void *)(a1 + 136),  *(_WORD *)(a1 + 144),  (uint64_t (*)(void))sub_18842A58C,  (uint64_t (*)(void))sub_188450B24,  (uint64_t (*)(void))sub_18844F66C,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450E84);
}

uint64_t initializeWithCopy for ControlChannelMessageEnvelope(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v9 = *(void *)(a2 + 64);
  uint64_t v10 = *(void *)(a2 + 72);
  uint64_t v13 = *(void *)(a2 + 88);
  uint64_t v14 = *(void *)(a2 + 96);
  uint64_t v15 = *(void *)(a2 + 104);
  uint64_t v16 = *(void *)(a2 + 112);
  uint64_t v17 = *(void *)(a2 + 120);
  uint64_t v18 = *(void *)(a2 + 128);
  uint64_t v19 = *(void *)(a2 + 136);
  __int16 v20 = *(_WORD *)(a2 + 144);
  uint64_t v11 = *(void *)(a2 + 80);
  sub_1884510A4( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t (*)(void))sub_18841E590,  (uint64_t (*)(void))sub_1884511B0,  (uint64_t (*)(void))sub_188451284,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450C7C);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v6;
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v11;
  *(void *)(a1 + 88) = v13;
  *(void *)(a1 + 96) = v14;
  *(void *)(a1 + 104) = v15;
  *(void *)(a1 + 112) = v16;
  *(void *)(a1 + 12sub_188455A4C(v0, v1, 0) = v17;
  *(void *)(a1 + 128) = v18;
  *(void *)(a1 + 136) = v19;
  *(_WORD *)(a1 + 144) = v20;
  return a1;
}

uint64_t assignWithCopy for ControlChannelMessageEnvelope(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v9 = *(void *)(a2 + 64);
  uint64_t v10 = *(void *)(a2 + 72);
  uint64_t v11 = *(void *)(a2 + 80);
  uint64_t v27 = *(void *)(a2 + 88);
  uint64_t v28 = *(void *)(a2 + 96);
  uint64_t v29 = *(void *)(a2 + 104);
  uint64_t v30 = *(void *)(a2 + 112);
  uint64_t v31 = *(void *)(a2 + 120);
  uint64_t v32 = *(void *)(a2 + 128);
  uint64_t v33 = *(void *)(a2 + 136);
  __int16 v34 = *(_WORD *)(a2 + 144);
  sub_1884510A4( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t (*)(void))sub_18841E590,  (uint64_t (*)(void))sub_1884511B0,  (uint64_t (*)(void))sub_188451284,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450C7C);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 56);
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v19 = *(void *)(a1 + 72);
  __int128 v20 = *(_OWORD *)(a1 + 80);
  __int128 v21 = *(_OWORD *)(a1 + 96);
  __int128 v22 = *(_OWORD *)(a1 + 112);
  uint64_t v23 = *(void *)(a1 + 128);
  uint64_t v24 = *(void *)(a1 + 136);
  __int16 v25 = *(_WORD *)(a1 + 144);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v6;
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v11;
  *(void *)(a1 + 88) = v27;
  *(void *)(a1 + 96) = v28;
  *(void *)(a1 + 104) = v29;
  *(void *)(a1 + 112) = v30;
  *(void *)(a1 + 12sub_188455A4C(v0, v1, 0) = v31;
  *(void *)(a1 + 128) = v32;
  *(void *)(a1 + 136) = v33;
  *(_WORD *)(a1 + 144) = v34;
  sub_1884510A4( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  *((uint64_t *)&v20 + 1),  v21,  *((uint64_t *)&v21 + 1),  v22,  *((uint64_t *)&v22 + 1),  v23,  v24,  v25,  (uint64_t (*)(void))sub_18842A58C,  (uint64_t (*)(void))sub_188450B24,  (uint64_t (*)(void))sub_18844F66C,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450E84);
  return a1;
}

uint64_t assignWithTake for ControlChannelMessageEnvelope(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v3 = *(void *)(a2 + 136);
  __int16 v4 = *(_WORD *)(a2 + 144);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  __int128 v13 = *(_OWORD *)(a1 + 80);
  __int128 v14 = *(_OWORD *)(a1 + 96);
  __int128 v15 = *(_OWORD *)(a1 + 112);
  uint64_t v16 = *(void *)(a1 + 128);
  uint64_t v17 = *(void *)(a1 + 136);
  __int16 v18 = *(_WORD *)(a1 + 144);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 4sub_188455A4C(v0, v1, 0) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 12sub_188455A4C(v0, v1, 0) = *(_OWORD *)(a2 + 120);
  *(void *)(a1 + 136) = v3;
  *(_WORD *)(a1 + 144) = v4;
  sub_1884510A4( v5,  v7,  v6,  v8,  v9,  v10,  v11,  v12,  v13,  *((uint64_t *)&v13 + 1),  v14,  *((uint64_t *)&v14 + 1),  v15,  *((uint64_t *)&v15 + 1),  v16,  v17,  v18,  (uint64_t (*)(void))sub_18842A58C,  (uint64_t (*)(void))sub_188450B24,  (uint64_t (*)(void))sub_18844F66C,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450E84);
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlChannelMessageEnvelope(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[146])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }

    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = v3 - 2;
      if (!v4) {
        int v2 = -1;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ControlChannelMessageEnvelope( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 136) = 0LL;
    *(_OWORD *)(result + 12sub_188455A4C(v0, v1, 0) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4sub_188455A4C(v0, v1, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 144) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 146) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 146) = 0;
    }
    if (a2) {
      *(_BYTE *)unint64_t result = a2 + 1;
    }
  }

  return result;
}

void type metadata accessor for ControlChannelMessageEnvelope()
{
}

void type metadata accessor for ControlChannelConnectionIdentifierCategory()
{
}

uint64_t destroy for PeerDeviceInfo(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v3 = *(void *)(a1 + 88);
  if (v3 >> 60 != 15) {
    return sub_18842A58C(*(void *)(a1 + 80), v3);
  }
  return result;
}

uint64_t initializeWithCopy for PeerDeviceInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  uint64_t v8 = *(void *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(void *)(a1 + 64) = v8;
  uint64_t v9 = (uint64_t *)(a2 + 80);
  unint64_t v10 = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v10 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 8sub_188455A4C(v0, v1, 0) = *(_OWORD *)v9;
  }

  else
  {
    uint64_t v11 = *v9;
    sub_18841E590(*v9, v10);
    *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v11;
    *(void *)(a1 + 88) = v10;
  }

  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

uint64_t assignWithCopy for PeerDeviceInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(void *)(a1 + 64) = v4;
  uint64_t v5 = (uint64_t *)(a2 + 80);
  unint64_t v6 = *(void *)(a2 + 88);
  if (*(void *)(a1 + 88) >> 60 != 15LL)
  {
    if (v6 >> 60 != 15)
    {
      uint64_t v8 = *v5;
      sub_18841E590(*v5, *(void *)(a2 + 88));
      uint64_t v9 = *(void *)(a1 + 80);
      unint64_t v10 = *(void *)(a1 + 88);
      *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v8;
      *(void *)(a1 + 88) = v6;
      sub_18842A58C(v9, v10);
      goto LABEL_8;
    }

    sub_1884B489C(a1 + 80);
    goto LABEL_6;
  }

  if (v6 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 8sub_188455A4C(v0, v1, 0) = *(_OWORD *)v5;
    goto LABEL_8;
  }

  uint64_t v7 = *v5;
  sub_18841E590(*v5, *(void *)(a2 + 88));
  *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v7;
  *(void *)(a1 + 88) = v6;
LABEL_8:
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

uint64_t sub_1884B489C(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy97_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x61uLL);
}

uint64_t assignWithTake for PeerDeviceInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  uint64_t v8 = (void *)(a2 + 80);
  unint64_t v9 = *(void *)(a1 + 88);
  if (v9 >> 60 != 15)
  {
    unint64_t v10 = *(void *)(a2 + 88);
    if (v10 >> 60 != 15)
    {
      uint64_t v11 = *(void *)(a1 + 80);
      *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = *v8;
      *(void *)(a1 + 88) = v10;
      sub_18842A58C(v11, v9);
      goto LABEL_6;
    }

    sub_1884B489C(a1 + 80);
  }

  *(_OWORD *)(a1 + 8sub_188455A4C(v0, v1, 0) = *(_OWORD *)v8;
LABEL_6:
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for PeerDeviceInfo(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 97))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PeerDeviceInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0LL;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4sub_188455A4C(v0, v1, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 96) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 97) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 97) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for PeerDeviceInfo()
{
}

uint64_t destroy for ListenerStartedResponse(uint64_t a1)
{
  return sub_18842A58C(*(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t _s19RemotePairingDevice23ListenerStartedResponseVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_18841E590(v3, v4);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for ListenerStartedResponse(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_18841E590(v3, v4);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  sub_18842A58C(v5, v6);
  return a1;
}

uint64_t assignWithTake for ListenerStartedResponse(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_18842A58C(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ListenerStartedResponse(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xD && *(_BYTE *)(a1 + 24))
    {
      unsigned int v2 = *(_DWORD *)a1 + 12;
    }

    else
    {
      unsigned int v2 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC) {
        unsigned int v2 = -1;
      }
    }
  }

  else
  {
    unsigned int v2 = -1;
  }

  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for ListenerStartedResponse( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)uint64_t result = a2 - 13;
    if (a3 >= 0xD) {
      *(_BYTE *)(result + 24) = 1;
    }
  }

  else
  {
    if (a3 >= 0xD) {
      *(_BYTE *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)(result + 8) = 0LL;
      *(void *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }

  return result;
}

void type metadata accessor for ListenerStartedResponse()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for StreamEncryptedMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_18841E590(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for StreamEncryptedMessage(uint64_t a1)
{
  return sub_18842A58C(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *assignWithCopy for StreamEncryptedMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_18841E590(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_18842A58C(v5, v6);
  return a1;
}

uint64_t *assignWithTake for StreamEncryptedMessage(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_18842A58C(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for StreamEncryptedMessage(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xD && *(_BYTE *)(a1 + 16))
    {
      unsigned int v2 = *(_DWORD *)a1 + 12;
    }

    else
    {
      unsigned int v2 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC) {
        unsigned int v2 = -1;
      }
    }
  }

  else
  {
    unsigned int v2 = -1;
  }

  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for StreamEncryptedMessage( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)uint64_t result = a2 - 13;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xD) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0xD) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0LL;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }

  return result;
}

void type metadata accessor for StreamEncryptedMessage()
{
}

uint64_t sub_1884B4D40()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *sub_1884B4DAC(uint64_t *a1, uint64_t *a2, uint64_t a3)
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

uint64_t sub_1884B4E1C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8LL) + 8LL))();
}

uint64_t sub_1884B4E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1884B4E5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1884B4E8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1884B4EBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1884B4EEC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  int v7 = a2 - v6;
  uint64_t v8 = *(void *)(v5 + 64);
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
      if ((_DWORD)v6) {
        return __swift_getEnumTagSinglePayload(a1, v6, v4);
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
    return (v6 + v12 + 1);
  }
  return ((uint64_t (*)(void))((char *)&loc_1884B4F9C + 4 * byte_1884D2EA4[(v8 - 1)]))();
}

void sub_1884B4FE8(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  char v9 = 8 * v8;
  BOOL v10 = a3 >= v7;
  unsigned int v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v11 + ~(-1 << v9)) >> v9) + 1;
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
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        int v15 = v13 & ~(-1 << v9);
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v15;
          *((_BYTE *)a1 + 2) = BYTE2(v15);
        }

        else if ((_DWORD)v8 == 2)
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
      bzero(a1, v8);
      *(_DWORD *)a1 = v13;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X10 }

uint64_t destroy for PairingData(uint64_t a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PairingData(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  sub_18841E590(v4, v5);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PairingData(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  uint64_t v4 = *(void *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  sub_18841E590(v4, v5);
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  sub_18842A58C(v6, v7);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PairingData(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_18842A58C(v4, v5);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PairingData(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 48))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }

    else
    {
      unint64_t v3 = *(void *)(a1 + 32);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PairingData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 4sub_188455A4C(v0, v1, 0) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 48) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 32) = a2;
    }
  }

  return result;
}

void type metadata accessor for PairingData()
{
}

void type metadata accessor for PairingData.Kind()
{
}

uint64_t storeEnumTagSinglePayload for PairingData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1884B5440 + 4 * byte_1884D2EB7[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1884B5474 + 4 * byte_1884D2EB2[v4]))();
}

uint64_t sub_1884B5474(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884B547C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1884B5484LL);
  }
  return result;
}

uint64_t sub_1884B5490(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1884B5498LL);
  }
  *(_BYTE *)uint64_t result = a2 + 4;
  return result;
}

uint64_t sub_1884B549C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884B54A4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PairingData.CodingKeys()
{
  return &type metadata for PairingData.CodingKeys;
}

ValueMetadata *type metadata accessor for StreamEncryptedMessage.CodingKeys()
{
  return &type metadata for StreamEncryptedMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for ListenerStartedResponse.CodingKeys()
{
  return &type metadata for ListenerStartedResponse.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for PeerDeviceInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1884B5538 + 4 * byte_1884D2EC1[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1884B556C + 4 * byte_1884D2EBC[v4]))();
}

uint64_t sub_1884B556C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884B5574(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1884B557CLL);
  }
  return result;
}

uint64_t sub_1884B5588(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1884B5590LL);
  }
  *(_BYTE *)uint64_t result = a2 + 6;
  return result;
}

uint64_t sub_1884B5594(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884B559C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PeerDeviceInfo.CodingKeys()
{
  return &type metadata for PeerDeviceInfo.CodingKeys;
}

uint64_t sub_1884B55B8(uint64_t a1)
{
  return sub_1884510A4( *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void *)(a1 + 88),  *(void *)(a1 + 96),  *(void *)(a1 + 104),  *(void *)(a1 + 112),  *(void *)(a1 + 120),  *(_WORD *)(a1 + 128),  (uint64_t (*)(void))sub_18842A58C,  (uint64_t (*)(void))sub_188450B24,  (uint64_t (*)(void))sub_18844F66C,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450E84);
}

uint64_t sub_1884B5630(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  uint64_t v15 = *(void *)(a2 + 88);
  uint64_t v16 = *(void *)(a2 + 96);
  uint64_t v17 = *(void *)(a2 + 104);
  uint64_t v18 = *(void *)(a2 + 112);
  uint64_t v19 = *(void *)(a2 + 120);
  __int16 v20 = *(_WORD *)(a2 + 128);
  uint64_t v11 = *(void *)(a2 + 64);
  sub_1884510A4( *(void *)a2,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t (*)(void))sub_18841E590,  (uint64_t (*)(void))sub_1884511B0,  (uint64_t (*)(void))sub_188451284,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450C7C);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(void *)(a1 + 12sub_188455A4C(v0, v1, 0) = v19;
  *(_WORD *)(a1 + 128) = v20;
  return a1;
}

uint64_t sub_1884B5758(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v27 = *(void *)(a2 + 72);
  uint64_t v28 = *(void *)(a2 + 80);
  uint64_t v29 = *(void *)(a2 + 88);
  uint64_t v30 = *(void *)(a2 + 96);
  uint64_t v31 = *(void *)(a2 + 104);
  uint64_t v32 = *(void *)(a2 + 112);
  uint64_t v33 = *(void *)(a2 + 120);
  __int16 v34 = *(_WORD *)(a2 + 128);
  sub_1884510A4( *(void *)a2,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t (*)(void))sub_18841E590,  (uint64_t (*)(void))sub_1884511B0,  (uint64_t (*)(void))sub_188451284,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450C7C);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  __int128 v20 = *(_OWORD *)(a1 + 64);
  __int128 v21 = *(_OWORD *)(a1 + 80);
  __int128 v22 = *(_OWORD *)(a1 + 96);
  uint64_t v23 = *(void *)(a1 + 112);
  uint64_t v24 = *(void *)(a1 + 120);
  __int16 v25 = *(_WORD *)(a1 + 128);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v27;
  *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v28;
  *(void *)(a1 + 88) = v29;
  *(void *)(a1 + 96) = v30;
  *(void *)(a1 + 104) = v31;
  *(void *)(a1 + 112) = v32;
  *(void *)(a1 + 12sub_188455A4C(v0, v1, 0) = v33;
  *(_WORD *)(a1 + 128) = v34;
  sub_1884510A4( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  *((uint64_t *)&v20 + 1),  v21,  *((uint64_t *)&v21 + 1),  v22,  *((uint64_t *)&v22 + 1),  v23,  v24,  v25,  (uint64_t (*)(void))sub_18842A58C,  (uint64_t (*)(void))sub_188450B24,  (uint64_t (*)(void))sub_18844F66C,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450E84);
  return a1;
}

void *__swift_memcpy130_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x82uLL);
}

uint64_t sub_1884B58EC(uint64_t a1, uint64_t a2)
{
  __int16 v3 = *(_WORD *)(a2 + 128);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  __int128 v12 = *(_OWORD *)(a1 + 64);
  __int128 v13 = *(_OWORD *)(a1 + 80);
  __int128 v14 = *(_OWORD *)(a1 + 96);
  uint64_t v15 = *(void *)(a1 + 112);
  uint64_t v16 = *(void *)(a1 + 120);
  __int16 v17 = *(_WORD *)(a1 + 128);
  __int128 v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  __int128 v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  __int128 v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 8sub_188455A4C(v0, v1, 0) = v20;
  __int128 v21 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v21;
  *(_WORD *)(a1 + 128) = v3;
  sub_1884510A4( v4,  v6,  v5,  v7,  v8,  v9,  v10,  v11,  v12,  *((uint64_t *)&v12 + 1),  v13,  *((uint64_t *)&v13 + 1),  v14,  *((uint64_t *)&v14 + 1),  v15,  v16,  v17,  (uint64_t (*)(void))sub_18842A58C,  (uint64_t (*)(void))sub_188450B24,  (uint64_t (*)(void))sub_18844F66C,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450E84);
  return a1;
}

uint64_t sub_1884B59A0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 7 && *(_BYTE *)(a1 + 130))
    {
      unsigned int v2 = *(_DWORD *)a1 + 6;
    }

    else
    {
      unsigned int v2 = ((*(unsigned __int16 *)(a1 + 128) >> 10) & 6 | (*(unsigned __int16 *)(a1 + 128) >> 13) & 1) ^ 7;
      if (v2 >= 6) {
        unsigned int v2 = -1;
      }
    }
  }

  else
  {
    unsigned int v2 = -1;
  }

  return v2 + 1;
}

uint64_t sub_1884B59EC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 6)
  {
    *(void *)(result + 12sub_188455A4C(v0, v1, 0) = 0LL;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4sub_188455A4C(v0, v1, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 128) = 0;
    *(void *)uint64_t result = a2 - 7;
    if (a3 >= 7) {
      *(_BYTE *)(result + 13sub_188455A4C(v0, v1, 0) = 1;
    }
  }

  else
  {
    if (a3 >= 7) {
      *(_BYTE *)(result + 13sub_188455A4C(v0, v1, 0) = 0;
    }
    if (a2)
    {
      *(_OWORD *)(result + 96) = 0u;
      *(_OWORD *)(result + 112) = 0u;
      *(_OWORD *)(result + 64) = 0u;
      *(_OWORD *)(result + 8sub_188455A4C(v0, v1, 0) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)uint64_t result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_WORD *)(result + 128) = ((((-a2 >> 1) & 3) - 4 * (_BYTE)a2) & 7) << 11;
    }
  }

  return result;
}

uint64_t sub_1884B5A74(uint64_t result, char a2)
{
  *(_WORD *)(result + 128) = *(_WORD *)(result + 128) & 0xC7FF | ((a2 & 1) << 13);
  return result;
}

void type metadata accessor for ControlChannelMessageEnvelope.Message()
{
}

ValueMetadata *type metadata accessor for ControlChannelMessageEnvelope.CodingKeys()
{
  return &type metadata for ControlChannelMessageEnvelope.CodingKeys;
}

uint64_t sub_1884B5AB0(uint64_t a1)
{
  return sub_18845111C( *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void *)(a1 + 88),  *(void *)(a1 + 96),  *(void *)(a1 + 104),  *(void *)(a1 + 112),  *(void *)(a1 + 120),  *(_WORD *)(a1 + 128),  (uint64_t (*)(void))sub_188450B24,  (uint64_t (*)(void))sub_18844F66C,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450E84);
}

uint64_t sub_1884B5B20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  uint64_t v15 = *(void *)(a2 + 88);
  uint64_t v16 = *(void *)(a2 + 96);
  uint64_t v17 = *(void *)(a2 + 104);
  uint64_t v18 = *(void *)(a2 + 112);
  uint64_t v19 = *(void *)(a2 + 120);
  unsigned __int16 v20 = *(_WORD *)(a2 + 128);
  uint64_t v11 = *(void *)(a2 + 64);
  sub_18845111C( *(void *)a2,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t (*)(void))sub_1884511B0,  (uint64_t (*)(void))sub_188451284,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450C7C);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(void *)(a1 + 12sub_188455A4C(v0, v1, 0) = v19;
  *(_WORD *)(a1 + 128) = v20;
  return a1;
}

uint64_t sub_1884B5C40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v27 = *(void *)(a2 + 72);
  uint64_t v28 = *(void *)(a2 + 80);
  uint64_t v29 = *(void *)(a2 + 88);
  uint64_t v30 = *(void *)(a2 + 96);
  uint64_t v31 = *(void *)(a2 + 104);
  uint64_t v32 = *(void *)(a2 + 112);
  uint64_t v33 = *(void *)(a2 + 120);
  unsigned __int16 v34 = *(_WORD *)(a2 + 128);
  sub_18845111C( *(void *)a2,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t (*)(void))sub_1884511B0,  (uint64_t (*)(void))sub_188451284,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450C7C);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  __int128 v20 = *(_OWORD *)(a1 + 64);
  __int128 v21 = *(_OWORD *)(a1 + 80);
  __int128 v22 = *(_OWORD *)(a1 + 96);
  uint64_t v23 = *(void *)(a1 + 112);
  uint64_t v24 = *(void *)(a1 + 120);
  unsigned __int16 v25 = *(_WORD *)(a1 + 128);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v27;
  *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v28;
  *(void *)(a1 + 88) = v29;
  *(void *)(a1 + 96) = v30;
  *(void *)(a1 + 104) = v31;
  *(void *)(a1 + 112) = v32;
  *(void *)(a1 + 12sub_188455A4C(v0, v1, 0) = v33;
  *(_WORD *)(a1 + 128) = v34;
  sub_18845111C( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  *((uint64_t *)&v20 + 1),  v21,  *((uint64_t *)&v21 + 1),  v22,  *((uint64_t *)&v22 + 1),  v23,  v24,  v25,  (uint64_t (*)(void))sub_188450B24,  (uint64_t (*)(void))sub_18844F66C,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450E84);
  return a1;
}

uint64_t sub_1884B5DBC(uint64_t a1, uint64_t a2)
{
  __int16 v3 = *(_WORD *)(a2 + 128);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  __int128 v12 = *(_OWORD *)(a1 + 64);
  __int128 v13 = *(_OWORD *)(a1 + 80);
  __int128 v14 = *(_OWORD *)(a1 + 96);
  uint64_t v15 = *(void *)(a1 + 112);
  uint64_t v16 = *(void *)(a1 + 120);
  unsigned __int16 v17 = *(_WORD *)(a1 + 128);
  __int128 v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  __int128 v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  __int128 v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 8sub_188455A4C(v0, v1, 0) = v20;
  __int128 v21 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v21;
  *(_WORD *)(a1 + 128) = v3;
  sub_18845111C( v4,  v6,  v5,  v7,  v8,  v9,  v10,  v11,  v12,  *((uint64_t *)&v12 + 1),  v13,  *((uint64_t *)&v13 + 1),  v14,  *((uint64_t *)&v14 + 1),  v15,  v16,  v17,  (uint64_t (*)(void))sub_188450B24,  (uint64_t (*)(void))sub_18844F66C,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450E84);
  return a1;
}

uint64_t sub_1884B5E68(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x1E && *(_BYTE *)(a1 + 130))
    {
      unsigned int v2 = *(_DWORD *)a1 + 29;
    }

    else
    {
      unsigned int v2 = ((*(unsigned __int16 *)(a1 + 128) >> 9) & 0x1C | (*(unsigned __int16 *)(a1 + 128) >> 14)) ^ 0x1F;
      if (v2 >= 0x1D) {
        unsigned int v2 = -1;
      }
    }
  }

  else
  {
    unsigned int v2 = -1;
  }

  return v2 + 1;
}

uint64_t sub_1884B5EB4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1D)
  {
    *(void *)(result + 12sub_188455A4C(v0, v1, 0) = 0LL;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4sub_188455A4C(v0, v1, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 128) = 0;
    *(void *)uint64_t result = a2 - 30;
    if (a3 >= 0x1E) {
      *(_BYTE *)(result + 13sub_188455A4C(v0, v1, 0) = 1;
    }
  }

  else
  {
    if (a3 >= 0x1E) {
      *(_BYTE *)(result + 13sub_188455A4C(v0, v1, 0) = 0;
    }
    if (a2)
    {
      *(_OWORD *)(result + 96) = 0u;
      *(_OWORD *)(result + 112) = 0u;
      *(_OWORD *)(result + 64) = 0u;
      *(_OWORD *)(result + 8sub_188455A4C(v0, v1, 0) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)uint64_t result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_WORD *)(result + 128) = (((-a2 >> 2) & 7) - 8 * (_WORD)a2) << 11;
    }
  }

  return result;
}

uint64_t sub_1884B5F3C(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 128) = *(_WORD *)(result + 128) & 0x7FF | (a2 << 14);
  return result;
}

void type metadata accessor for ControlChannelMessage()
{
}

void sub_1884B5F5C(uint64_t a1)
{
}

uint64_t sub_1884B5FAC(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  uint64_t v15 = *(void *)(a2 + 88);
  uint64_t v16 = *(void *)(a2 + 96);
  uint64_t v17 = *(void *)(a2 + 104);
  unint64_t v18 = *(void *)(a2 + 112);
  char v19 = *(_BYTE *)(a2 + 120);
  char v20 = *(_BYTE *)(a2 + 121);
  sub_188450C7C(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(_BYTE *)(a1 + 12sub_188455A4C(v0, v1, 0) = v19;
  *(_BYTE *)(a1 + 121) = v20;
  return a1;
}

uint64_t sub_1884B60BC(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v26 = *(void *)(a2 + 72);
  uint64_t v27 = *(void *)(a2 + 80);
  uint64_t v28 = *(void *)(a2 + 88);
  uint64_t v29 = *(void *)(a2 + 96);
  uint64_t v30 = *(void *)(a2 + 104);
  unint64_t v31 = *(void *)(a2 + 112);
  char v32 = *(_BYTE *)(a2 + 120);
  char v33 = *(_BYTE *)(a2 + 121);
  sub_188450C7C(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v26, v27, v28, v29, v30, v31, v32, v33);
  __int128 v12 = *(void **)a1;
  uint64_t v13 = *(void **)(a1 + 8);
  unint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  __int128 v20 = *(_OWORD *)(a1 + 64);
  __int128 v21 = *(_OWORD *)(a1 + 80);
  __int128 v22 = *(_OWORD *)(a1 + 96);
  unint64_t v23 = *(void *)(a1 + 112);
  __int16 v24 = *(_WORD *)(a1 + 120);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v26;
  *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v27;
  *(void *)(a1 + 88) = v28;
  *(void *)(a1 + 96) = v29;
  *(void *)(a1 + 104) = v30;
  *(void *)(a1 + 112) = v31;
  *(_BYTE *)(a1 + 12sub_188455A4C(v0, v1, 0) = v32;
  *(_BYTE *)(a1 + 121) = v33;
  sub_188450E84( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  *((uint64_t *)&v20 + 1),  v21,  *((uint64_t *)&v21 + 1),  v22,  *((uint64_t *)&v22 + 1),  v23,  v24,  SHIBYTE(v24));
  return a1;
}

void *__swift_memcpy122_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x7AuLL);
}

uint64_t sub_1884B6208(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 112);
  __int16 v4 = *(_WORD *)(a2 + 120);
  unint64_t v5 = *(void **)a1;
  uint64_t v7 = *(void **)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  __int128 v13 = *(_OWORD *)(a1 + 64);
  __int128 v14 = *(_OWORD *)(a1 + 80);
  __int128 v15 = *(_OWORD *)(a1 + 96);
  unint64_t v16 = *(void *)(a1 + 112);
  __int16 v17 = *(_WORD *)(a1 + 120);
  __int128 v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  __int128 v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  __int128 v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 8sub_188455A4C(v0, v1, 0) = v20;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(void *)(a1 + 112) = v3;
  *(_WORD *)(a1 + 12sub_188455A4C(v0, v1, 0) = v4;
  sub_188450E84( v5,  v7,  v6,  v8,  v9,  v10,  v11,  v12,  v13,  *((uint64_t *)&v13 + 1),  v14,  *((uint64_t *)&v14 + 1),  v15,  *((uint64_t *)&v15 + 1),  v16,  v17,  SHIBYTE(v17));
  return a1;
}

uint64_t sub_1884B629C(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFA && *(_BYTE *)(a1 + 122))
    {
      int v2 = *(_DWORD *)a1 + 249;
    }

    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 121);
      if (v3 <= 6) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t sub_1884B62DC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4sub_188455A4C(v0, v1, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 12sub_188455A4C(v0, v1, 0) = 0;
    *(void *)uint64_t result = a2 - 250;
    if (a3 >= 0xFA) {
      *(_BYTE *)(result + 122) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFA) {
      *(_BYTE *)(result + 122) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 121) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_1884B6340(uint64_t result, unsigned int a2)
{
  if (a2 >= 6)
  {
    *(void *)uint64_t result = a2 - 6;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 4sub_188455A4C(v0, v1, 0) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    LOBYTE(a2) = 6;
    *(_BYTE *)(result + 12sub_188455A4C(v0, v1, 0) = 0;
  }

  *(_BYTE *)(result + 121) = a2;
  return result;
}

void type metadata accessor for ControlChannelMessage.Response()
{
}

unint64_t sub_1884B638C()
{
  unint64_t result = qword_18C70FE10;
  if (!qword_18C70FE10)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D34A0, &type metadata for ControlChannelMessageEnvelope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FE10);
  }

  return result;
}

unint64_t sub_1884B63CC()
{
  unint64_t result = qword_18C70FE18;
  if (!qword_18C70FE18)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3558, &type metadata for PeerDeviceInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FE18);
  }

  return result;
}

unint64_t sub_1884B640C()
{
  unint64_t result = qword_18C70FE20;
  if (!qword_18C70FE20)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3610, &type metadata for ListenerStartedResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FE20);
  }

  return result;
}

unint64_t sub_1884B644C()
{
  unint64_t result = qword_18C70FE28;
  if (!qword_18C70FE28)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D36C8, &type metadata for StreamEncryptedMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FE28);
  }

  return result;
}

unint64_t sub_1884B648C()
{
  unint64_t result = qword_18C70FE30;
  if (!qword_18C70FE30)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3780, &type metadata for PairingData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FE30);
  }

  return result;
}

unint64_t sub_1884B64CC()
{
  unint64_t result = qword_18C4DCAA0;
  if (!qword_18C4DCAA0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D36F0, &type metadata for PairingData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCAA0);
  }

  return result;
}

unint64_t sub_1884B650C()
{
  unint64_t result = qword_18C4DCA98;
  if (!qword_18C4DCA98)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3718, &type metadata for PairingData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCA98);
  }

  return result;
}

unint64_t sub_1884B654C()
{
  unint64_t result = qword_18C70FE38;
  if (!qword_18C70FE38)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3638, &type metadata for StreamEncryptedMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FE38);
  }

  return result;
}

unint64_t sub_1884B658C()
{
  unint64_t result = qword_18C70FE40;
  if (!qword_18C70FE40)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3660, &type metadata for StreamEncryptedMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FE40);
  }

  return result;
}

unint64_t sub_1884B65CC()
{
  unint64_t result = qword_18C70FE48;
  if (!qword_18C70FE48)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3580, &type metadata for ListenerStartedResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FE48);
  }

  return result;
}

unint64_t sub_1884B660C()
{
  unint64_t result = qword_18C70FE50;
  if (!qword_18C70FE50)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D35A8, &type metadata for ListenerStartedResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FE50);
  }

  return result;
}

unint64_t sub_1884B664C()
{
  unint64_t result = qword_18C4DC808;
  if (!qword_18C4DC808)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D34C8, &type metadata for PeerDeviceInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DC808);
  }

  return result;
}

unint64_t sub_1884B668C()
{
  unint64_t result = qword_18C4DC800;
  if (!qword_18C4DC800)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D34F0, &type metadata for PeerDeviceInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DC800);
  }

  return result;
}

unint64_t sub_1884B66CC()
{
  unint64_t result = qword_18C4DD860;
  if (!qword_18C4DD860)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3410, &type metadata for ControlChannelMessageEnvelope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD860);
  }

  return result;
}

unint64_t sub_1884B670C()
{
  unint64_t result = qword_18C4DD858;
  if (!qword_18C4DD858)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3438, &type metadata for ControlChannelMessageEnvelope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD858);
  }

  return result;
}

unint64_t sub_1884B6748()
{
  unint64_t result = qword_18C4DD7F8;
  if (!qword_18C4DD7F8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4B74, &type metadata for ControlChannelMessageEnvelope.Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD7F8);
  }

  return result;
}

unint64_t sub_1884B6784()
{
  unint64_t result = qword_18C4DD810;
  if (!qword_18C4DD810)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4B24,  &type metadata for ControlChannelMessageEnvelope.Message.PlainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD810);
  }

  return result;
}

uint64_t sub_1884B67C0(uint64_t a1)
{
  return a1;
}

unint64_t sub_1884B6848()
{
  unint64_t result = qword_18C4DD828;
  if (!qword_18C4DD828)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4AD4,  &type metadata for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD828);
  }

  return result;
}

unint64_t sub_1884B6884()
{
  unint64_t result = qword_18C4DCE18;
  if (!qword_18C4DCE18)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4A84, &type metadata for ControlChannelMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE18);
  }

  return result;
}

unint64_t sub_1884B68C0()
{
  unint64_t result = qword_18C4DCE60;
  if (!qword_18C4DCE60)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4A34, &type metadata for ControlChannelMessage.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE60);
  }

  return result;
}

unint64_t sub_1884B68FC()
{
  unint64_t result = qword_18C70FE58;
  if (!qword_18C70FE58)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3398, &unk_18A2449F0);
    atomic_store(result, (unint64_t *)&qword_18C70FE58);
  }

  return result;
}

unint64_t sub_1884B6938()
{
  unint64_t result = qword_18C4DCE48;
  if (!qword_18C4DCE48)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D49E4, &type metadata for ControlChannelMessage.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE48);
  }

  return result;
}

unint64_t sub_1884B6974()
{
  unint64_t result = qword_18C4DCFB0;
  if (!qword_18C4DCFB0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D49BC, &unk_18A2452A0);
    atomic_store(result, (unint64_t *)&qword_18C4DCFB0);
  }

  return result;
}

unint64_t sub_1884B69B0()
{
  unint64_t result = qword_18C4DCE30;
  if (!qword_18C4DCE30)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D496C, &type metadata for ControlChannelMessage.EventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE30);
  }

  return result;
}

unint64_t sub_1884B69EC()
{
  unint64_t result = qword_18C4DCF20;
  if (!qword_18C4DCF20)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4944, &unk_18A245330);
    atomic_store(result, (unint64_t *)&qword_18C4DCF20);
  }

  return result;
}

uint64_t sub_1884B6A28(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_289(a1);
  sub_18845111C( v2,  *(void *)(v1 + 8),  *(void *)(v1 + 16),  *(void *)(v1 + 24),  *(void *)(v1 + 32),  *(void *)(v1 + 40),  *(void *)(v1 + 48),  *(void *)(v1 + 56),  *(void *)(v1 + 64),  *(void *)(v1 + 72),  *(void *)(v1 + 80),  *(void *)(v1 + 88),  *(void *)(v1 + 96),  *(void *)(v1 + 104),  *(void *)(v1 + 112),  *(void *)(v1 + 120),  *(_WORD *)(v1 + 128),  v3,  v4,  v5);
  return v1;
}

unint64_t sub_1884B6A98()
{
  unint64_t result = qword_18C4DD060;
  if (!qword_18C4DD060)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3370, &unk_18A2449F0);
    atomic_store(result, (unint64_t *)&qword_18C4DD060);
  }

  return result;
}

unint64_t sub_1884B6AD4()
{
  unint64_t result = qword_18C70FE60;
  if (!qword_18C70FE60)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D491C, &unk_18A2452A0);
    atomic_store(result, (unint64_t *)&qword_18C70FE60);
  }

  return result;
}

unint64_t sub_1884B6B10()
{
  unint64_t result = qword_18C4DCF18;
  if (!qword_18C4DCF18)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D48F4, &unk_18A245330);
    atomic_store(result, (unint64_t *)&qword_18C4DCF18);
  }

  return result;
}

unint64_t sub_1884B6B4C()
{
  unint64_t result = qword_18C4DCFD8;
  if (!qword_18C4DCFD8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D48A4, &type metadata for ControlChannelMessage.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCFD8);
  }

  return result;
}

unint64_t sub_1884B6B88()
{
  unint64_t result = qword_18C4DD038;
  if (!qword_18C4DD038)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4854,  &type metadata for ControlChannelMessage.Response.ErrorExtendedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD038);
  }

  return result;
}

uint64_t sub_1884B6BC4(uint64_t result)
{
  *(_BYTE *)(result + 121) = 5;
  return result;
}

unint64_t sub_1884B6BD0()
{
  unint64_t result = qword_18C70FEB0;
  if (!qword_18C70FEB0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4804, &type metadata for ControlChannelMessage.Response.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FEB0);
  }

  return result;
}

unint64_t sub_1884B6C0C()
{
  unint64_t result = qword_18C70FEB8;
  if (!qword_18C70FEB8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D47B4, &type metadata for ControlChannelMessage.Response.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FEB8);
  }

  return result;
}

unint64_t sub_1884B6C48()
{
  unint64_t result = qword_18C70FEC0;
  if (!qword_18C70FEC0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for ControlChannelConnectionError,  &type metadata for ControlChannelConnectionError);
    atomic_store(result, (unint64_t *)&qword_18C70FEC0);
  }

  return result;
}

unint64_t sub_1884B6C84()
{
  unint64_t result = qword_18C70FEC8;
  if (!qword_18C70FEC8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4764,  &type metadata for ControlChannelMessage.Response.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FEC8);
  }

  return result;
}

unint64_t sub_1884B6CC0()
{
  unint64_t result = qword_18C70FED0;
  if (!qword_18C70FED0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4714,  &type metadata for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FED0);
  }

  return result;
}

unint64_t sub_1884B6CFC()
{
  unint64_t result = qword_18C4DDEC8;
  if (!qword_18C4DDEC8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D46C4,  &type metadata for ControlChannelMessage.Response.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DDEC8);
  }

  return result;
}

unint64_t sub_1884B6D38()
{
  unint64_t result = qword_18C4DC668;
  if (!qword_18C4DC668)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4674, &type metadata for ControlChannelMessage.Response.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DC668);
  }

  return result;
}

unint64_t sub_1884B6D74()
{
  unint64_t result = qword_18C70FED8;
  if (!qword_18C70FED8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&protocol conformance descriptor for PeerDeviceInfo, &type metadata for PeerDeviceInfo);
    atomic_store(result, (unint64_t *)&qword_18C70FED8);
  }

  return result;
}

unint64_t sub_1884B6DB0()
{
  unint64_t result = qword_18C4DD020;
  if (!qword_18C4DD020)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4624, &type metadata for ControlChannelMessage.Response.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD020);
  }

  return result;
}

unint64_t sub_1884B6DEC()
{
  unint64_t result = qword_18C70FEE0;
  if (!qword_18C70FEE0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D45FC, &unk_18A2453A8);
    atomic_store(result, (unint64_t *)&qword_18C70FEE0);
  }

  return result;
}

uint64_t sub_1884B6E28(uint64_t a1)
{
  return a1;
}

unint64_t sub_1884B6E88()
{
  unint64_t result = qword_18C70FEE8;
  if (!qword_18C70FEE8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for ControlChannelConnectionError,  &type metadata for ControlChannelConnectionError);
    atomic_store(result, (unint64_t *)&qword_18C70FEE8);
  }

  return result;
}

unint64_t sub_1884B6EC4()
{
  unint64_t result = qword_18C4DC810;
  if (!qword_18C4DC810)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&protocol conformance descriptor for PeerDeviceInfo, &type metadata for PeerDeviceInfo);
    atomic_store(result, (unint64_t *)&qword_18C4DC810);
  }

  return result;
}

unint64_t sub_1884B6F00()
{
  unint64_t result = qword_18C4DCC50;
  if (!qword_18C4DCC50)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D45D4, &unk_18A2453A8);
    atomic_store(result, (unint64_t *)&qword_18C4DCC50);
  }

  return result;
}

unint64_t sub_1884B6F3C()
{
  unint64_t result = qword_18C4DCAB0;
  if (!qword_18C4DCAB0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for PairingData.Kind,  &type metadata for PairingData.Kind);
    atomic_store(result, (unint64_t *)&qword_18C4DCAB0);
  }

  return result;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.CodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.HandshakeCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.HandshakeCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.PeerInfoCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.PeerInfoCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.CreateListenerCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.CreateListenerCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.RemoteUnlockCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.RemoteUnlockCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.ErrorCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.ErrorCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.SuccessCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.SuccessCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.ErrorExtendedCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.ErrorExtendedCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.CodingKeys()
{
  return &type metadata for ControlChannelMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.EventCodingKeys()
{
  return &type metadata for ControlChannelMessage.EventCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.RequestCodingKeys()
{
  return &type metadata for ControlChannelMessage.RequestCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.ResponseCodingKeys()
{
  return &type metadata for ControlChannelMessage.ResponseCodingKeys;
}

uint64_t _s19RemotePairingDevice23ListenerStartedResponseV10CodingKeysOwet_0( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_106_2(-1);
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
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 2);
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
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 2);
    }

    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 2);
    }
  }

uint64_t _s19RemotePairingDevice23ListenerStartedResponseV10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1884B7120 + 4 * byte_1884D2ECB[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_104_1 + 4 * byte_1884D2EC6[v4]))();
}

uint64_t sub_1884B7158(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1884B7160LL);
  }
  return result;
}

uint64_t sub_1884B7168(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1884B7170LL);
  }
  return OUTLINED_FUNCTION_103_1();
}

ValueMetadata *type metadata accessor for ControlChannelMessageEnvelope.Message.CodingKeys()
{
  return &type metadata for ControlChannelMessageEnvelope.Message.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys()
{
  return &type metadata for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessageEnvelope.Message.PlainCodingKeys()
{
  return &type metadata for ControlChannelMessageEnvelope.Message.PlainCodingKeys;
}

void *sub_1884B71B0(uint64_t a1)
{
  return sub_18844F66C(*(void **)a1, *(void *)(a1 + 8));
}

void *sub_1884B71C0(void *a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  sub_188451284(*(id *)a2, v4);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  return a1;
}

uint64_t sub_1884B7214(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  sub_188451284(*(id *)a2, v4);
  BOOL v7 = *(void **)a1;
  unint64_t v8 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  sub_18844F66C(v7, v8);
  return a1;
}

uint64_t sub_1884B7274(uint64_t a1, _OWORD *a2)
{
  id v3 = *(void **)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  __int128 v5 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v5;
  sub_18844F66C(v3, v4);
  return a1;
}

uint64_t sub_1884B72B0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1884B72D0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)unint64_t result = (a2 - 1);
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

uint64_t sub_1884B72FC(uint64_t a1)
{
  if (((*(void *)(a1 + 8) >> 60) & 3) == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return (*(void *)(a1 + 8) >> 60) & 3LL;
  }
}

uint64_t sub_1884B7318(uint64_t result)
{
  *(void *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  return result;
}

void *sub_1884B7328(void *result, uint64_t a2)
{
  if (a2 < 3)
  {
    result[1] = result[1] & 0xCFFFFFFFFFFFFFFFLL | (a2 << 60);
  }

  else
  {
    *unint64_t result = (a2 - 3);
    result[1] = 0x3000000000000000LL;
    result[2] = 0LL;
    result[3] = 0LL;
  }

  return result;
}

void type metadata accessor for ControlChannelMessage.Request()
{
}

void sub_1884B7360(uint64_t a1)
{
}

uint64_t sub_1884B73A8(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  unint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  unint64_t v15 = *(void *)(a2 + 88);
  char v16 = *(_BYTE *)(a2 + 96);
  sub_1884511B0(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v14;
  *(void *)(a1 + 88) = v15;
  *(_BYTE *)(a1 + 96) = v16;
  return a1;
}

uint64_t sub_1884B7474(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  unint64_t v24 = *(void *)(a2 + 72);
  uint64_t v25 = *(void *)(a2 + 80);
  unint64_t v26 = *(void *)(a2 + 88);
  char v27 = *(_BYTE *)(a2 + 96);
  sub_1884511B0(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25, v26);
  uint64_t v12 = *(void **)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  unint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  __int128 v20 = *(_OWORD *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 80);
  unint64_t v22 = *(void *)(a1 + 88);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v24;
  *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v25;
  *(void *)(a1 + 88) = v26;
  *(_BYTE *)(a1 + 96) = v27;
  sub_188450B24(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((unint64_t *)&v20 + 1), v21, v22);
  return a1;
}

uint64_t sub_1884B7570(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 96);
  uint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  __int128 v12 = *(_OWORD *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 80);
  unint64_t v14 = *(void *)(a1 + 88);
  __int128 v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  __int128 v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  __int128 v17 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 8sub_188455A4C(v0, v1, 0) = v17;
  *(_BYTE *)(a1 + 96) = v3;
  sub_188450B24(v4, v6, v5, v7, v8, v9, v10, v11, v12, *((unint64_t *)&v12 + 1), v13, v14);
  return a1;
}

uint64_t sub_1884B75EC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 97))
    {
      int v3 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      uint64_t v2 = *(void *)(a1 + 72) >> 1;
      else {
        int v3 = -1;
      }
    }
  }

  else
  {
    int v3 = -1;
  }

  return (v3 + 1);
}

double sub_1884B7634(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(a1 + 88) = 0LL;
    double result = 0.0;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 4sub_188455A4C(v0, v1, 0) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_BYTE *)(a1 + 96) = 0;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(a1 + 97) = 1;
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
      double result = 0.0;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(void *)(a1 + 64) = 0LL;
      *(void *)(a1 + 72) = 2LL * -a2;
      *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = 0LL;
      *(void *)(a1 + 88) = 0LL;
      *(_BYTE *)(a1 + 96) = 0;
      return result;
    }

    *(_BYTE *)(a1 + 97) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

uint64_t sub_1884B76A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72) >> 62;
  if ((_DWORD)v1 == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return v1;
  }
}

uint64_t sub_1884B76C4(uint64_t result)
{
  *(void *)(result + 72) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_1884B76D4(uint64_t result, uint64_t a2)
{
  if (a2 < 3)
  {
    *(void *)(result + 72) = *(void *)(result + 72) & 1LL | (a2 << 62);
  }

  else
  {
    *(void *)double result = (a2 - 3);
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 4sub_188455A4C(v0, v1, 0) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)(result + 8sub_188455A4C(v0, v1, 0) = 0LL;
    *(void *)(result + 88) = 0LL;
    *(void *)(result + 72) = 0xC000000000000000LL;
    *(_BYTE *)(result + 96) = 0;
  }

  return result;
}

void type metadata accessor for ControlChannelMessage.Event()
{
}

uint64_t sub_1884B7728(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v3 = *(void *)(a1 + 112);
    if (v3 >> 60 != 15) {
      return sub_18842A58C(*(void *)(a1 + 104), v3);
    }
  }

  return result;
}

uint64_t sub_1884B779C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  unint64_t v5 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 2sub_188455A4C(v0, v1, 0) = *(_BYTE *)(a2 + 20);
  uint64_t v6 = *(void *)(a2 + 48);
  id v7 = v4;
  id v8 = v5;
  if (v6)
  {
    uint64_t v9 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = v6;
    uint64_t v10 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = v10;
    uint64_t v11 = *(void *)(a2 + 80);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v11;
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
    __int128 v12 = (uint64_t *)(a2 + 104);
    unint64_t v13 = *(void *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 104) = *(_OWORD *)v12;
    }

    else
    {
      uint64_t v14 = *v12;
      sub_18841E590(*v12, v13);
      *(void *)(a1 + 104) = v14;
      *(void *)(a1 + 112) = v13;
    }

    *(_BYTE *)(a1 + 12sub_188455A4C(v0, v1, 0) = *(_BYTE *)(a2 + 120);
  }

  else
  {
    memcpy((void *)(a1 + 24), (const void *)(a2 + 24), 0x61uLL);
  }

  return a1;
}

uint64_t sub_1884B78A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  unint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_BYTE *)(a1 + 19) = *(_BYTE *)(a2 + 19);
  *(_BYTE *)(a1 + 2sub_188455A4C(v0, v1, 0) = *(_BYTE *)(a2 + 20);
  uint64_t v10 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48))
  {
    if (v10)
    {
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = *(void *)(a2 + 80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v11 = *(void *)(a2 + 88);
      *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
      *(void *)(a1 + 88) = v11;
      __int128 v12 = (uint64_t *)(a2 + 104);
      unint64_t v13 = *(void *)(a2 + 112);
      if (*(void *)(a1 + 112) >> 60 == 15LL)
      {
        if (v13 >> 60 != 15)
        {
          uint64_t v14 = *v12;
LABEL_15:
          sub_18841E590(v14, v13);
          *(void *)(a1 + 104) = v14;
          *(void *)(a1 + 112) = v13;
          goto LABEL_17;
        }
      }

      else
      {
        if (v13 >> 60 != 15)
        {
          uint64_t v17 = *v12;
          sub_18841E590(*v12, *(void *)(a2 + 112));
          uint64_t v18 = *(void *)(a1 + 104);
          unint64_t v19 = *(void *)(a1 + 112);
          *(void *)(a1 + 104) = v17;
          *(void *)(a1 + 112) = v13;
          sub_18842A58C(v18, v19);
          goto LABEL_17;
        }

        sub_1884B489C(a1 + 104);
      }

      *(_OWORD *)(a1 + 104) = *(_OWORD *)v12;
      goto LABEL_17;
    }

    sub_1884B7B10(a1 + 24);
  }

  else if (v10)
  {
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = *(void *)(a2 + 80);
    uint64_t v15 = *(void *)(a2 + 88);
    *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
    *(void *)(a1 + 88) = v15;
    __int128 v16 = (uint64_t *)(a2 + 104);
    unint64_t v13 = *(void *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 >> 60 != 15)
    {
      uint64_t v14 = *v16;
      goto LABEL_15;
    }

    *(_OWORD *)(a1 + 104) = *(_OWORD *)v16;
LABEL_17:
    *(_BYTE *)(a1 + 12sub_188455A4C(v0, v1, 0) = *(_BYTE *)(a2 + 120);
    return a1;
  }

  memcpy((void *)(a1 + 24), (const void *)(a2 + 24), 0x61uLL);
  return a1;
}

uint64_t sub_1884B7B10(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy121_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x79uLL);
}

uint64_t sub_1884B7B44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  unint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_WORD *)(a1 + 19) = *(_WORD *)(a2 + 19);
  if (*(void *)(a1 + 48))
  {
    uint64_t v6 = *(void *)(a2 + 48);
    if (v6)
    {
      uint64_t v7 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = v7;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = v6;
      swift_bridgeObjectRelease();
      uint64_t v8 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = v8;
      swift_bridgeObjectRelease();
      uint64_t v9 = *(void *)(a2 + 80);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 8sub_188455A4C(v0, v1, 0) = v9;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
      uint64_t v10 = (void *)(a2 + 104);
      unint64_t v11 = *(void *)(a1 + 112);
      if (v11 >> 60 != 15)
      {
        unint64_t v12 = *(void *)(a2 + 112);
        if (v12 >> 60 != 15)
        {
          uint64_t v13 = *(void *)(a1 + 104);
          *(void *)(a1 + 104) = *v10;
          *(void *)(a1 + 112) = v12;
          sub_18842A58C(v13, v11);
          goto LABEL_10;
        }

        sub_1884B489C(a1 + 104);
      }

      *(_OWORD *)(a1 + 104) = *(_OWORD *)v10;
LABEL_10:
      *(_BYTE *)(a1 + 12sub_188455A4C(v0, v1, 0) = *(_BYTE *)(a2 + 120);
      return a1;
    }

    sub_1884B7B10(a1 + 24);
  }

  memcpy((void *)(a1 + 24), (const void *)(a2 + 24), 0x61uLL);
  return a1;
}

uint64_t sub_1884B7C90(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 121))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      uint64_t v2 = *a1;
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t sub_1884B7CD0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4sub_188455A4C(v0, v1, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 12sub_188455A4C(v0, v1, 0) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 121) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 121) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for HandshakeResponse()
{
}

unint64_t sub_1884B7D40()
{
  unint64_t result = qword_18C70FEF0;
  if (!qword_18C70FEF0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D3BB4,  &type metadata for ControlChannelMessageEnvelope.Message.PlainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FEF0);
  }

  return result;
}

unint64_t sub_1884B7D80()
{
  unint64_t result = qword_18C70FEF8;
  if (!qword_18C70FEF8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D3C6C,  &type metadata for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FEF8);
  }

  return result;
}

unint64_t sub_1884B7DC0()
{
  unint64_t result = qword_18C70FF00;
  if (!qword_18C70FF00)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3D24, &type metadata for ControlChannelMessageEnvelope.Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF00);
  }

  return result;
}

unint64_t sub_1884B7E00()
{
  unint64_t result = qword_18C70FF08;
  if (!qword_18C70FF08)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3DDC, &type metadata for ControlChannelMessage.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF08);
  }

  return result;
}

unint64_t sub_1884B7E40()
{
  unint64_t result = qword_18C70FF10;
  if (!qword_18C70FF10)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3E94, &type metadata for ControlChannelMessage.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF10);
  }

  return result;
}

unint64_t sub_1884B7E80()
{
  unint64_t result = qword_18C70FF18;
  if (!qword_18C70FF18)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3F4C, &type metadata for ControlChannelMessage.EventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF18);
  }

  return result;
}

unint64_t sub_1884B7EC0()
{
  unint64_t result = qword_18C70FF20;
  if (!qword_18C70FF20)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4004, &type metadata for ControlChannelMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF20);
  }

  return result;
}

unint64_t sub_1884B7F00()
{
  unint64_t result = qword_18C70FF28;
  if (!qword_18C70FF28)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D40BC,  &type metadata for ControlChannelMessage.Response.ErrorExtendedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF28);
  }

  return result;
}

unint64_t sub_1884B7F40()
{
  unint64_t result = qword_18C70FF30;
  if (!qword_18C70FF30)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D41C4, &type metadata for ControlChannelMessage.Response.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF30);
  }

  return result;
}

unint64_t sub_1884B7F80()
{
  unint64_t result = qword_18C70FF38;
  if (!qword_18C70FF38)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D42CC,  &type metadata for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF38);
  }

  return result;
}

unint64_t sub_1884B7FC0()
{
  unint64_t result = qword_18C70FF40;
  if (!qword_18C70FF40)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4384,  &type metadata for ControlChannelMessage.Response.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF40);
  }

  return result;
}

unint64_t sub_1884B8000()
{
  unint64_t result = qword_18C70FF48;
  if (!qword_18C70FF48)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D443C, &type metadata for ControlChannelMessage.Response.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF48);
  }

  return result;
}

unint64_t sub_1884B8040()
{
  unint64_t result = qword_18C70FF50;
  if (!qword_18C70FF50)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D44F4, &type metadata for ControlChannelMessage.Response.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF50);
  }

  return result;
}

unint64_t sub_1884B8080()
{
  unint64_t result = qword_18C70FF58;
  if (!qword_18C70FF58)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D45AC, &type metadata for ControlChannelMessage.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF58);
  }

  return result;
}

unint64_t sub_1884B80C0()
{
  unint64_t result = qword_18C4DD030;
  if (!qword_18C4DD030)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4464, &type metadata for ControlChannelMessage.Response.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD030);
  }

  return result;
}

unint64_t sub_1884B8100()
{
  unint64_t result = qword_18C4DD028;
  if (!qword_18C4DD028)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D448C, &type metadata for ControlChannelMessage.Response.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD028);
  }

  return result;
}

unint64_t sub_1884B8140()
{
  unint64_t result = qword_18C4DD018;
  if (!qword_18C4DD018)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D43AC, &type metadata for ControlChannelMessage.Response.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD018);
  }

  return result;
}

unint64_t sub_1884B8180()
{
  unint64_t result = qword_18C4DD010;
  if (!qword_18C4DD010)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D43D4, &type metadata for ControlChannelMessage.Response.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD010);
  }

  return result;
}

unint64_t sub_1884B81C0()
{
  unint64_t result = qword_18C4DD058;
  if (!qword_18C4DD058)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D42F4,  &type metadata for ControlChannelMessage.Response.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD058);
  }

  return result;
}

unint64_t sub_1884B8200()
{
  unint64_t result = qword_18C4DD050;
  if (!qword_18C4DD050)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D431C,  &type metadata for ControlChannelMessage.Response.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD050);
  }

  return result;
}

unint64_t sub_1884B8240()
{
  unint64_t result = qword_18C4DCFC0;
  if (!qword_18C4DCFC0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D423C,  &type metadata for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCFC0);
  }

  return result;
}

unint64_t sub_1884B8280()
{
  unint64_t result = qword_18C4DCFB8;
  if (!qword_18C4DCFB8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4264,  &type metadata for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCFB8);
  }

  return result;
}

unint64_t sub_1884B82C0()
{
  unint64_t result = qword_18C4DCFD0;
  if (!qword_18C4DCFD0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D41EC,  &type metadata for ControlChannelMessage.Response.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCFD0);
  }

  return result;
}

unint64_t sub_1884B8300()
{
  unint64_t result = qword_18C4DCFC8;
  if (!qword_18C4DCFC8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4214,  &type metadata for ControlChannelMessage.Response.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCFC8);
  }

  return result;
}

unint64_t sub_1884B8340()
{
  unint64_t result = qword_18C4DCFF8;
  if (!qword_18C4DCFF8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4134, &type metadata for ControlChannelMessage.Response.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCFF8);
  }

  return result;
}

unint64_t sub_1884B8380()
{
  unint64_t result = qword_18C4DCFF0;
  if (!qword_18C4DCFF0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D415C, &type metadata for ControlChannelMessage.Response.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCFF0);
  }

  return result;
}

unint64_t sub_1884B83C0()
{
  unint64_t result = qword_18C4DD008;
  if (!qword_18C4DD008)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D40E4, &type metadata for ControlChannelMessage.Response.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD008);
  }

  return result;
}

unint64_t sub_1884B8400()
{
  unint64_t result = qword_18C4DD000;
  if (!qword_18C4DD000)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D410C, &type metadata for ControlChannelMessage.Response.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD000);
  }

  return result;
}

unint64_t sub_1884B8440()
{
  unint64_t result = qword_18C4DD048;
  if (!qword_18C4DD048)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D402C,  &type metadata for ControlChannelMessage.Response.ErrorExtendedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD048);
  }

  return result;
}

unint64_t sub_1884B8480()
{
  unint64_t result = qword_18C4DD040;
  if (!qword_18C4DD040)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4054,  &type metadata for ControlChannelMessage.Response.ErrorExtendedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD040);
  }

  return result;
}

unint64_t sub_1884B84C0()
{
  unint64_t result = qword_18C4DCFE8;
  if (!qword_18C4DCFE8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D451C, &type metadata for ControlChannelMessage.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCFE8);
  }

  return result;
}

unint64_t sub_1884B8500()
{
  unint64_t result = qword_18C4DCFE0;
  if (!qword_18C4DCFE0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4544, &type metadata for ControlChannelMessage.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCFE0);
  }

  return result;
}

unint64_t sub_1884B8540()
{
  unint64_t result = qword_18C4DCE40;
  if (!qword_18C4DCE40)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3EBC, &type metadata for ControlChannelMessage.EventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE40);
  }

  return result;
}

unint64_t sub_1884B8580()
{
  unint64_t result = qword_18C4DCE38;
  if (!qword_18C4DCE38)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3EE4, &type metadata for ControlChannelMessage.EventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE38);
  }

  return result;
}

unint64_t sub_1884B85C0()
{
  unint64_t result = qword_18C4DCE58;
  if (!qword_18C4DCE58)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3E04, &type metadata for ControlChannelMessage.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE58);
  }

  return result;
}

unint64_t sub_1884B8600()
{
  unint64_t result = qword_18C4DCE50;
  if (!qword_18C4DCE50)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3E2C, &type metadata for ControlChannelMessage.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE50);
  }

  return result;
}

unint64_t sub_1884B8640()
{
  unint64_t result = qword_18C4DCE70;
  if (!qword_18C4DCE70)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3D4C, &type metadata for ControlChannelMessage.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE70);
  }

  return result;
}

unint64_t sub_1884B8680()
{
  unint64_t result = qword_18C4DCE68;
  if (!qword_18C4DCE68)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3D74, &type metadata for ControlChannelMessage.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE68);
  }

  return result;
}

unint64_t sub_1884B86C0()
{
  unint64_t result = qword_18C4DCE28;
  if (!qword_18C4DCE28)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3F74, &type metadata for ControlChannelMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE28);
  }

  return result;
}

unint64_t sub_1884B8700()
{
  unint64_t result = qword_18C4DCE20;
  if (!qword_18C4DCE20)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3F9C, &type metadata for ControlChannelMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE20);
  }

  return result;
}

unint64_t sub_1884B8740()
{
  unint64_t result = qword_18C4DD838;
  if (!qword_18C4DD838)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D3BDC,  &type metadata for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD838);
  }

  return result;
}

unint64_t sub_1884B8780()
{
  unint64_t result = qword_18C4DD830;
  if (!qword_18C4DD830)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D3C04,  &type metadata for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD830);
  }

  return result;
}

unint64_t sub_1884B87C0()
{
  unint64_t result = qword_18C4DD820;
  if (!qword_18C4DD820)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D3B24,  &type metadata for ControlChannelMessageEnvelope.Message.PlainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD820);
  }

  return result;
}

unint64_t sub_1884B8800()
{
  unint64_t result = qword_18C4DD818;
  if (!qword_18C4DD818)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D3B4C,  &type metadata for ControlChannelMessageEnvelope.Message.PlainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD818);
  }

  return result;
}

unint64_t sub_1884B8840()
{
  unint64_t result = qword_18C4DD808;
  if (!qword_18C4DD808)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3C94, &type metadata for ControlChannelMessageEnvelope.Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD808);
  }

  return result;
}

unint64_t sub_1884B8880()
{
  unint64_t result = qword_18C4DD800;
  if (!qword_18C4DD800)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D3CBC, &type metadata for ControlChannelMessageEnvelope.Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DD800);
  }

  return result;
}

unint64_t sub_1884B88BC()
{
  unint64_t result = qword_18C4DCF50;
  if (!qword_18C4DCF50)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D5B4C, &type metadata for ControlChannelMessage.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF50);
  }

  return result;
}

unint64_t sub_1884B88F8()
{
  unint64_t result = qword_18C70FF60;
  if (!qword_18C70FF60)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D5AFC,  &type metadata for ControlChannelMessage.Request.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF60);
  }

  return result;
}

unint64_t sub_1884B8934()
{
  unint64_t result = qword_18C4DCF28;
  if (!qword_18C4DCF28)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D5AAC,  &type metadata for ControlChannelMessage.Request.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF28);
  }

  return result;
}

unint64_t sub_1884B8970()
{
  unint64_t result = qword_18C70FF68;
  if (!qword_18C70FF68)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D5A5C,  &type metadata for ControlChannelMessage.Request.CancelPairSetupCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF68);
  }

  return result;
}

unint64_t sub_1884B89AC()
{
  unint64_t result = qword_18C4DDEC0;
  if (!qword_18C4DDEC0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D5A0C,  &type metadata for ControlChannelMessage.Request.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DDEC0);
  }

  return result;
}

unint64_t sub_1884B89E8()
{
  unint64_t result = qword_18C4DDEE0;
  if (!qword_18C4DDEE0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for TransportProtocolType,  &type metadata for TransportProtocolType);
    atomic_store(result, (unint64_t *)&qword_18C4DDEE0);
  }

  return result;
}

unint64_t sub_1884B8A24()
{
  unint64_t result = qword_18C4DE720;
  if (!qword_18C4DE720)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for PeerConnectionInfo,  &type metadata for PeerConnectionInfo);
    atomic_store(result, (unint64_t *)&qword_18C4DE720);
  }

  return result;
}

unint64_t sub_1884B8A60()
{
  unint64_t result = qword_18C4DC660;
  if (!qword_18C4DC660)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D59BC, &type metadata for ControlChannelMessage.Request.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DC660);
  }

  return result;
}

unint64_t sub_1884B8A9C()
{
  unint64_t result = qword_18C4DCF78;
  if (!qword_18C4DCF78)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D596C, &type metadata for ControlChannelMessage.Request.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF78);
  }

  return result;
}

unint64_t sub_1884B8AD8()
{
  unint64_t result = qword_18C4DCC30;
  if (!qword_18C4DCC30)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D5944, &unk_18A245A40);
    atomic_store(result, (unint64_t *)&qword_18C4DCC30);
  }

  return result;
}

unint64_t sub_1884B8B14()
{
  unint64_t result = qword_18C4DCEC0;
  if (!qword_18C4DCEC0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D58F4, &type metadata for ControlChannelMessage.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCEC0);
  }

  return result;
}

unint64_t sub_1884B8B50()
{
  unint64_t result = qword_18C4DC650;
  if (!qword_18C4DC650)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D58A4,  &type metadata for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DC650);
  }

  return result;
}

unint64_t sub_1884B8B8C()
{
  unint64_t result = qword_18C70FF70;
  if (!qword_18C70FF70)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D5854, &type metadata for ControlChannelMessage.Event.UnpairCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF70);
  }

  return result;
}

unint64_t sub_1884B8BC8()
{
  unint64_t result = qword_18C70FF78;
  if (!qword_18C70FF78)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D5804,  &type metadata for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF78);
  }

  return result;
}

unint64_t sub_1884B8C04()
{
  unint64_t result = qword_18C70FF80;
  if (!qword_18C70FF80)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D57B4,  &type metadata for ControlChannelMessage.Event.AwaitingUserConsentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF80);
  }

  return result;
}

unint64_t sub_1884B8C40()
{
  unint64_t result = qword_18C4DC658;
  if (!qword_18C4DC658)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D5764, &type metadata for ControlChannelMessage.Event.PingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DC658);
  }

  return result;
}

unint64_t sub_1884B8C7C()
{
  unint64_t result = qword_18C4DDE30;
  if (!qword_18C4DDE30)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D5714,  &type metadata for ControlChannelMessage.Event.PairVerifyFailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DDE30);
  }

  return result;
}

unint64_t sub_1884B8CB8()
{
  unint64_t result = qword_18C70FF88;
  if (!qword_18C70FF88)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D56C4,  &type metadata for ControlChannelMessage.Event.PairingRejectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FF88);
  }

  return result;
}

unint64_t sub_1884B8CF4()
{
  unint64_t result = qword_18C4DCE78;
  if (!qword_18C4DCE78)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D5674, &type metadata for ControlChannelMessage.Event.PairingDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE78);
  }

  return result;
}

unint64_t sub_1884B8D30()
{
  unint64_t result = qword_18C4DCAD8;
  if (!qword_18C4DCAD8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&protocol conformance descriptor for PairingData, &type metadata for PairingData);
    atomic_store(result, (unint64_t *)&qword_18C4DCAD8);
  }

  return result;
}

unint64_t sub_1884B8D6C()
{
  unint64_t result = qword_18C70FFC8;
  if (!qword_18C70FFC8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for TransportProtocolType,  &type metadata for TransportProtocolType);
    atomic_store(result, (unint64_t *)&qword_18C70FFC8);
  }

  return result;
}

unint64_t sub_1884B8DA8(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_289(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    uint64_t v6 = v3;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C4DE940);
    uint64_t v8 = v6();
    unint64_t result = MEMORY[0x1895C7AEC](v5, v7, &v8);
    atomic_store(result, v1);
  }

  return result;
}

unint64_t sub_1884B8E0C()
{
  unint64_t result = qword_18C70FFD8;
  if (!qword_18C70FFD8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for PeerConnectionInfo,  &type metadata for PeerConnectionInfo);
    atomic_store(result, (unint64_t *)&qword_18C70FFD8);
  }

  return result;
}

unint64_t sub_1884B8E48()
{
  unint64_t result = qword_18C70FFE0;
  if (!qword_18C70FFE0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D564C, &unk_18A245A40);
    atomic_store(result, (unint64_t *)&qword_18C70FFE0);
  }

  return result;
}

unint64_t sub_1884B8E84()
{
  unint64_t result = qword_18C4DCAD0;
  if (!qword_18C4DCAD0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&protocol conformance descriptor for PairingData, &type metadata for PairingData);
    atomic_store(result, (unint64_t *)&qword_18C4DCAD0);
  }

  return result;
}

unint64_t sub_1884B8EC0()
{
  unint64_t result = qword_18C4DCC38;
  if (!qword_18C4DCC38)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D55FC, &type metadata for HandshakeResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCC38);
  }

  return result;
}

unint64_t sub_1884B8EFC()
{
  unint64_t result = qword_18C70FFF0;
  if (!qword_18C70FFF0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for ControlChannelConnection.Options.Device,  &type metadata for ControlChannelConnection.Options.Device);
    atomic_store(result, (unint64_t *)&qword_18C70FFF0);
  }

  return result;
}

uint64_t sub_1884B8F38(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_289(a1);
  if (!result)
  {
    type metadata accessor for ControlChannelConnectionWireProtocolVersion();
    OUTLINED_FUNCTION_123();
  }

  return result;
}

unint64_t sub_1884B8F6C()
{
  unint64_t result = qword_18C4DD140;
  if (!qword_18C4DD140)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for ControlChannelConnection.Options.Device,  &type metadata for ControlChannelConnection.Options.Device);
    atomic_store(result, (unint64_t *)&qword_18C4DD140);
  }

  return result;
}

uint64_t _s19RemotePairingDevice11PairingDataV4KindOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_106_2(-1);
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
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 4);
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
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 4);
    }

    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 4);
    }
  }

uint64_t _s19RemotePairingDevice11PairingDataV4KindOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1884B9078 + 4 * byte_1884D2ED5[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_104_1_0 + 4 * byte_1884D2ED0[v4]))();
}

uint64_t sub_1884B90B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1884B90B8LL);
  }
  return result;
}

uint64_t sub_1884B90C0(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1884B90C8LL);
  }
  return OUTLINED_FUNCTION_103_1();
}

ValueMetadata *type metadata accessor for HandshakeResponse.CodingKeys()
{
  return &type metadata for HandshakeResponse.CodingKeys;
}

uint64_t _s19RemotePairingDevice21ControlChannelMessageO8ResponseO10CodingKeysOwet_0( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_106_2(-1);
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
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 8);
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
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 8);
    }

    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 8);
    }
  }

uint64_t _s19RemotePairingDevice21ControlChannelMessageO8ResponseO10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1884B91B8 + 4 * byte_1884D2EDF[v4]))();
  }
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_104_1_1 + 4 * byte_1884D2EDA[v4]))();
}

uint64_t sub_1884B91F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1884B91F8LL);
  }
  return result;
}

uint64_t sub_1884B9200(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1884B9208LL);
  }
  return OUTLINED_FUNCTION_103_1();
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.CodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PairingDataCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PairingDataCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PairingRejectedCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PairingRejectedCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PairVerifyFailedCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PairVerifyFailedCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PingCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PingCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.AwaitingUserConsentCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.AwaitingUserConsentCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.UnpairCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.UnpairCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys;
}

uint64_t storeEnumTagSinglePayload for ControlChannelMessage.Request.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1884B92F4 + 4 * byte_1884D2EE9[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1884B9328 + 4 * byte_1884D2EE4[v4]))();
}

uint64_t sub_1884B9328(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884B9330(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1884B9338LL);
  }
  return result;
}

uint64_t sub_1884B9344(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1884B934CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 5;
  return result;
}

uint64_t sub_1884B9350(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884B9358(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.CodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.HandshakeCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.HandshakeCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.PeerInfoCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.PeerInfoCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.CreateListenerCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.CreateListenerCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.CancelPairSetupCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.CancelPairSetupCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.CreateRemoteUnlockKeyCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.CreateRemoteUnlockKeyCodingKeys;
}

uint64_t _s19RemotePairingDevice22StreamEncryptedMessageV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1884B9404 + 4 * byte_1884D2EEE[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1884B9424 + 4 * byte_1884D2EF3[v4]))();
  }
}

_BYTE *sub_1884B9404(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1884B9424(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1884B942C(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1884B9434(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1884B943C(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1884B9444(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.RemoteUnlockCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.RemoteUnlockCodingKeys;
}

uint64_t sub_1884B9460(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1884B9488(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1884B94CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1884B9534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1884B9580(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      uint64_t v2 = *a1;
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t sub_1884B95C0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for HandshakeRequest()
{
}

unint64_t sub_1884B9610()
{
  unint64_t result = qword_18C70FFF8;
  if (!qword_18C70FFF8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4D94,  &type metadata for ControlChannelMessage.Request.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C70FFF8);
  }

  return result;
}

unint64_t sub_1884B9650()
{
  unint64_t result = qword_18C710000;
  if (!qword_18C710000)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4EEC,  &type metadata for ControlChannelMessage.Request.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710000);
  }

  return result;
}

unint64_t sub_1884B9690()
{
  unint64_t result = qword_18C710008;
  if (!qword_18C710008)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4FF4, &type metadata for ControlChannelMessage.Request.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710008);
  }

  return result;
}

unint64_t sub_1884B96D0()
{
  unint64_t result = qword_18C710010;
  if (!qword_18C710010)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D50AC, &type metadata for ControlChannelMessage.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710010);
  }

  return result;
}

unint64_t sub_1884B9710()
{
  unint64_t result = qword_18C710018;
  if (!qword_18C710018)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D5164,  &type metadata for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710018);
  }

  return result;
}

unint64_t sub_1884B9750()
{
  unint64_t result = qword_18C710020;
  if (!qword_18C710020)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D526C,  &type metadata for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710020);
  }

  return result;
}

unint64_t sub_1884B9790()
{
  unint64_t result = qword_18C710028;
  if (!qword_18C710028)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D5464, &type metadata for ControlChannelMessage.Event.PairingDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710028);
  }

  return result;
}

unint64_t sub_1884B97D0()
{
  unint64_t result = qword_18C710030;
  if (!qword_18C710030)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D551C, &type metadata for ControlChannelMessage.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710030);
  }

  return result;
}

unint64_t sub_1884B9810()
{
  unint64_t result = qword_18C710038;
  if (!qword_18C710038)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D55D4, &type metadata for HandshakeResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710038);
  }

  return result;
}

unint64_t sub_1884B9850()
{
  unint64_t result = qword_18C4DCC48;
  if (!qword_18C4DCC48)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D5544, &type metadata for HandshakeResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCC48);
  }

  return result;
}

unint64_t sub_1884B9890()
{
  unint64_t result = qword_18C4DCC40;
  if (!qword_18C4DCC40)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D556C, &type metadata for HandshakeResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCC40);
  }

  return result;
}

unint64_t sub_1884B98D0()
{
  unint64_t result = qword_18C4DCE88;
  if (!qword_18C4DCE88)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D53D4, &type metadata for ControlChannelMessage.Event.PairingDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE88);
  }

  return result;
}

unint64_t sub_1884B9910()
{
  unint64_t result = qword_18C4DCE80;
  if (!qword_18C4DCE80)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D53FC, &type metadata for ControlChannelMessage.Event.PairingDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE80);
  }

  return result;
}

unint64_t sub_1884B9950()
{
  unint64_t result = qword_18C4DCE98;
  if (!qword_18C4DCE98)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D5384,  &type metadata for ControlChannelMessage.Event.PairingRejectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE98);
  }

  return result;
}

unint64_t sub_1884B9990()
{
  unint64_t result = qword_18C4DCE90;
  if (!qword_18C4DCE90)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D53AC,  &type metadata for ControlChannelMessage.Event.PairingRejectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCE90);
  }

  return result;
}

unint64_t sub_1884B99D0()
{
  unint64_t result = qword_18C4DCF00;
  if (!qword_18C4DCF00)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D5334,  &type metadata for ControlChannelMessage.Event.PairVerifyFailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF00);
  }

  return result;
}

unint64_t sub_1884B9A10()
{
  unint64_t result = qword_18C4DCEF8;
  if (!qword_18C4DCEF8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D535C,  &type metadata for ControlChannelMessage.Event.PairVerifyFailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCEF8);
  }

  return result;
}

unint64_t sub_1884B9A50()
{
  unint64_t result = qword_18C4DCEE0;
  if (!qword_18C4DCEE0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D52E4, &type metadata for ControlChannelMessage.Event.PingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCEE0);
  }

  return result;
}

unint64_t sub_1884B9A90()
{
  unint64_t result = qword_18C4DCED8;
  if (!qword_18C4DCED8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D530C, &type metadata for ControlChannelMessage.Event.PingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCED8);
  }

  return result;
}

unint64_t sub_1884B9AD0()
{
  unint64_t result = qword_18C4DCF10;
  if (!qword_18C4DCF10)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D5294,  &type metadata for ControlChannelMessage.Event.AwaitingUserConsentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF10);
  }

  return result;
}

unint64_t sub_1884B9B10()
{
  unint64_t result = qword_18C4DCF08;
  if (!qword_18C4DCF08)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D52BC,  &type metadata for ControlChannelMessage.Event.AwaitingUserConsentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF08);
  }

  return result;
}

unint64_t sub_1884B9B50()
{
  unint64_t result = qword_18C4DCEA8;
  if (!qword_18C4DCEA8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D51DC,  &type metadata for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCEA8);
  }

  return result;
}

unint64_t sub_1884B9B90()
{
  unint64_t result = qword_18C4DCEA0;
  if (!qword_18C4DCEA0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D5204,  &type metadata for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCEA0);
  }

  return result;
}

unint64_t sub_1884B9BD0()
{
  unint64_t result = qword_18C4DCEF0;
  if (!qword_18C4DCEF0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D518C, &type metadata for ControlChannelMessage.Event.UnpairCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCEF0);
  }

  return result;
}

unint64_t sub_1884B9C10()
{
  unint64_t result = qword_18C4DCEE8;
  if (!qword_18C4DCEE8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D51B4, &type metadata for ControlChannelMessage.Event.UnpairCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCEE8);
  }

  return result;
}

unint64_t sub_1884B9C50()
{
  unint64_t result = qword_18C4DCEB8;
  if (!qword_18C4DCEB8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D50D4,  &type metadata for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCEB8);
  }

  return result;
}

unint64_t sub_1884B9C90()
{
  unint64_t result = qword_18C4DCEB0;
  if (!qword_18C4DCEB0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D50FC,  &type metadata for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCEB0);
  }

  return result;
}

unint64_t sub_1884B9CD0()
{
  unint64_t result = qword_18C4DCED0;
  if (!qword_18C4DCED0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D548C, &type metadata for ControlChannelMessage.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCED0);
  }

  return result;
}

unint64_t sub_1884B9D10()
{
  unint64_t result = qword_18C4DCEC8;
  if (!qword_18C4DCEC8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D54B4, &type metadata for ControlChannelMessage.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCEC8);
  }

  return result;
}

unint64_t sub_1884B9D50()
{
  unint64_t result = qword_18C4DCF88;
  if (!qword_18C4DCF88)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4F64, &type metadata for ControlChannelMessage.Request.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF88);
  }

  return result;
}

unint64_t sub_1884B9D90()
{
  unint64_t result = qword_18C4DCF80;
  if (!qword_18C4DCF80)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4F8C, &type metadata for ControlChannelMessage.Request.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF80);
  }

  return result;
}

unint64_t sub_1884B9DD0()
{
  unint64_t result = qword_18C4DCF70;
  if (!qword_18C4DCF70)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4F14, &type metadata for ControlChannelMessage.Request.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF70);
  }

  return result;
}

unint64_t sub_1884B9E10()
{
  unint64_t result = qword_18C4DCF68;
  if (!qword_18C4DCF68)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D4F3C, &type metadata for ControlChannelMessage.Request.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF68);
  }

  return result;
}

unint64_t sub_1884B9E50()
{
  unint64_t result = qword_18C4DCF98;
  if (!qword_18C4DCF98)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4E5C,  &type metadata for ControlChannelMessage.Request.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF98);
  }

  return result;
}

unint64_t sub_1884B9E90()
{
  unint64_t result = qword_18C4DCF90;
  if (!qword_18C4DCF90)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4E84,  &type metadata for ControlChannelMessage.Request.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF90);
  }

  return result;
}

unint64_t sub_1884B9ED0()
{
  unint64_t result = qword_18C4DCFA8;
  if (!qword_18C4DCFA8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4E0C,  &type metadata for ControlChannelMessage.Request.CancelPairSetupCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCFA8);
  }

  return result;
}

unint64_t sub_1884B9F10()
{
  unint64_t result = qword_18C4DCFA0;
  if (!qword_18C4DCFA0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4E34,  &type metadata for ControlChannelMessage.Request.CancelPairSetupCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCFA0);
  }

  return result;
}

unint64_t sub_1884B9F50()
{
  unint64_t result = qword_18C4DCF38;
  if (!qword_18C4DCF38)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4DBC,  &type metadata for ControlChannelMessage.Request.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF38);
  }

  return result;
}

unint64_t sub_1884B9F90()
{
  unint64_t result = qword_18C4DCF30;
  if (!qword_18C4DCF30)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4DE4,  &type metadata for ControlChannelMessage.Request.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF30);
  }

  return result;
}

unint64_t sub_1884B9FD0()
{
  unint64_t result = qword_18C4DCF48;
  if (!qword_18C4DCF48)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4D04,  &type metadata for ControlChannelMessage.Request.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF48);
  }

  return result;
}

unint64_t sub_1884BA010()
{
  unint64_t result = qword_18C4DCF40;
  if (!qword_18C4DCF40)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D4D2C,  &type metadata for ControlChannelMessage.Request.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF40);
  }

  return result;
}

unint64_t sub_1884BA050()
{
  unint64_t result = qword_18C4DCF60;
  if (!qword_18C4DCF60)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D501C, &type metadata for ControlChannelMessage.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF60);
  }

  return result;
}

unint64_t sub_1884BA090()
{
  unint64_t result = qword_18C4DCF58;
  if (!qword_18C4DCF58)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D5044, &type metadata for ControlChannelMessage.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCF58);
  }

  return result;
}

unint64_t sub_1884BA0CC()
{
  unint64_t result = qword_18C4DCC18;
  if (!qword_18C4DCC18)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D5C54, &type metadata for HandshakeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCC18);
  }

  return result;
}

unint64_t sub_1884BA108()
{
  unint64_t result = qword_18C4DD160;
  if (!qword_18C4DD160)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for ControlChannelConnection.Options.Host,  &type metadata for ControlChannelConnection.Options.Host);
    atomic_store(result, (unint64_t *)&qword_18C4DD160);
  }

  return result;
}

unint64_t sub_1884BA144()
{
  unint64_t result = qword_18C710048;
  if (!qword_18C710048)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for ControlChannelConnection.Options.Host,  &type metadata for ControlChannelConnection.Options.Host);
    atomic_store(result, (unint64_t *)&qword_18C710048);
  }

  return result;
}

uint64_t sub_1884BA180(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_289(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v2);
    OUTLINED_FUNCTION_123();
  }

  return result;
}

uint64_t _s19RemotePairingDevice29ControlChannelMessageEnvelopeV10CodingKeysOwet_0( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_106_2(-1);
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 3);
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
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 3);
    }

    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 3);
    }
  }

uint64_t _s19RemotePairingDevice29ControlChannelMessageEnvelopeV10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_1884BA284 + 4 * byte_1884D2EFD[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_104_1_2 + 4 * byte_1884D2EF8[v4]))();
}

uint64_t sub_1884BA2BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1884BA2C4LL);
  }
  return result;
}

uint64_t sub_1884BA2CC(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1884BA2D4LL);
  }
  return OUTLINED_FUNCTION_103_1();
}

ValueMetadata *type metadata accessor for HandshakeRequest.CodingKeys()
{
  return &type metadata for HandshakeRequest.CodingKeys;
}

unint64_t sub_1884BA2F8()
{
  unint64_t result = qword_18C710058;
  if (!qword_18C710058)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D5C2C, &type metadata for HandshakeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710058);
  }

  return result;
}

unint64_t sub_1884BA338()
{
  unint64_t result = qword_18C4DCC28;
  if (!qword_18C4DCC28)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D5B9C, &type metadata for HandshakeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCC28);
  }

  return result;
}

unint64_t sub_1884BA378()
{
  unint64_t result = qword_18C4DCC20;
  if (!qword_18C4DCC20)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D5BC4, &type metadata for HandshakeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C4DCC20);
  }

  return result;
}

double OUTLINED_FUNCTION_5_17()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_6_17()
{
  return sub_1884CA634();
}

uint64_t OUTLINED_FUNCTION_8_14@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_9_17@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_10_10()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_11_13()
{
  return sub_1884CA70C();
}

uint64_t OUTLINED_FUNCTION_13_17()
{
  return sub_1884CA634();
}

uint64_t OUTLINED_FUNCTION_16_13@<X0>(char a1@<W8>)
{
  v1[232] = a1;
  sub_18844F7AC(v1 + 488, v1 + 360);
  return nullsub_1(v1 + 360);
}

uint64_t OUTLINED_FUNCTION_18_16()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21_8@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_22_7()
{
  return sub_1884CA6B8();
}

uint64_t OUTLINED_FUNCTION_25_12()
{
  return sub_1884CA634();
}

uint64_t OUTLINED_FUNCTION_28_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30_11()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_31_8()
{
  return sub_1884CA634();
}

uint64_t OUTLINED_FUNCTION_34_9( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12)
{
  return sub_18843A3CC(0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, a9, a10, a11, a12);
}

uint64_t OUTLINED_FUNCTION_35_7@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_38_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_40_10()
{
  return sub_1884CA70C();
}

uint64_t OUTLINED_FUNCTION_43_10()
{
  return sub_1884CA6B8();
}

void OUTLINED_FUNCTION_44_9(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_45_6@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_52_9()
{
  return sub_1884CA688();
}

void OUTLINED_FUNCTION_54_9()
{
  *(_BYTE *)(v0 - 65) = 1;
}

void *OUTLINED_FUNCTION_55_6(void *a1)
{
  return __swift_project_boxed_opaque_existential_0Tm(a1, v1);
}

uint64_t OUTLINED_FUNCTION_57_8()
{
  return sub_1884CA634();
}

  ;
}

uint64_t OUTLINED_FUNCTION_59_9()
{
  return sub_1884CA754();
}

uint64_t OUTLINED_FUNCTION_60_4()
{
  return sub_1884CA73C();
}

uint64_t OUTLINED_FUNCTION_62_6@<X0>(char a1@<W8>)
{
  *(_BYTE *)(v1 - 96) = a1;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_63_6()
{
  *(_BYTE *)(v0 - 65) = 2;
}

uint64_t OUTLINED_FUNCTION_64_5()
{
  return sub_1884CA6B8();
}

uint64_t OUTLINED_FUNCTION_65_6()
{
  return sub_1884CA634();
}

uint64_t OUTLINED_FUNCTION_67_6()
{
  return sub_1884CA70C();
}

uint64_t OUTLINED_FUNCTION_69_5()
{
  return nullsub_1(v0 - 216);
}

void *OUTLINED_FUNCTION_71_6()
{
  return sub_18844F7AC((const void *)(v0 + 352), (void *)(v1 - 224));
}

uint64_t OUTLINED_FUNCTION_72_6()
{
  return sub_1884CA6B8();
}

uint64_t OUTLINED_FUNCTION_74_4()
{
  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_76_7()
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 288) + 8LL))(v0, *(void *)(v1 - 200));
}

uint64_t OUTLINED_FUNCTION_77_5()
{
  return v0;
}

  ;
}

uint64_t OUTLINED_FUNCTION_81_4()
{
  return sub_1884CA9D0();
}

uint64_t OUTLINED_FUNCTION_82_4()
{
  return sub_1884CA70C();
}

uint64_t OUTLINED_FUNCTION_83_5()
{
  return sub_1884CA784();
}

uint64_t OUTLINED_FUNCTION_84_2()
{
  return sub_1884CA70C();
}

uint64_t OUTLINED_FUNCTION_85_2()
{
  return sub_1884CA784();
}

void OUTLINED_FUNCTION_87_3(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 192) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

void OUTLINED_FUNCTION_88_4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 + 48) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

void OUTLINED_FUNCTION_89_3(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 216) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

void OUTLINED_FUNCTION_90_4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 + 56) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

void OUTLINED_FUNCTION_91_2(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 208) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t OUTLINED_FUNCTION_92_1()
{
  return sub_1884CA6B8();
}

uint64_t OUTLINED_FUNCTION_93_2()
{
  return sub_1884CA514();
}

uint64_t OUTLINED_FUNCTION_95_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_96_1()
{
  return sub_1884CA634();
}

  ;
}

uint64_t OUTLINED_FUNCTION_99_1@<X0>(char a1@<W8>)
{
  *(_BYTE *)(v3 - 12sub_188455A4C(v0, v1, 0) = a1;
  return sub_18841E590(v2, v1);
}

uint64_t OUTLINED_FUNCTION_100_3(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_101_2(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

_BYTE *OUTLINED_FUNCTION_103_1@<X0>(_BYTE *result@<X0>, char a2@<W8>)
{
  *unint64_t result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_104_1(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_106_2@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_107_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_108_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_109_2()
{
  return sub_1884CA6B8();
}

  ;
}

uint64_t OUTLINED_FUNCTION_111_0@<X0>(char a1@<W8>)
{
  v1[128] = a1;
  sub_18844F728(v1 + 392, v1 + 256);
  return sub_188451488((uint64_t)(v1 + 256));
}

uint64_t OUTLINED_FUNCTION_112_2()
{
  return __swift_destroy_boxed_opaque_existential_0Tm(v0);
}

unint64_t OUTLINED_FUNCTION_114_1@<X0>(char a1@<W8>)
{
  *(_BYTE *)(v1 - 65) = a1;
  return sub_18845D554();
}

uint64_t OUTLINED_FUNCTION_115_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_116_2()
{
  return type metadata accessor for ControlChannelConnectionWireProtocolVersion();
}

uint64_t OUTLINED_FUNCTION_117_2()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_118_1(char a1@<W8>)
{
  *(_BYTE *)(v1 - 96) = a1;
}

  ;
}

  ;
}

uint64_t OUTLINED_FUNCTION_121_1()
{
  return v0;
}

  ;
}

uint64_t OUTLINED_FUNCTION_124_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_125_2()
{
  return sub_18842A58C(v1, v0);
}

  ;
}

uint64_t OUTLINED_FUNCTION_127_2(uint64_t a1)
{
  return sub_18841E590(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t OUTLINED_FUNCTION_129_1@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_130_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_131_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_132_1()
{
  return sub_1884CA784();
}

uint64_t OUTLINED_FUNCTION_133_1()
{
  return sub_1884CA70C();
}

uint64_t OUTLINED_FUNCTION_134_1()
{
  return v0 - 96;
}

unint64_t OUTLINED_FUNCTION_135_0()
{
  *(_BYTE *)(v0 - 192) = 1;
  return sub_1884B8CB8();
}

uint64_t OUTLINED_FUNCTION_136_1()
{
  return sub_188451488(v0 - 224);
}

uint64_t OUTLINED_FUNCTION_137_1()
{
  return sub_1884513A0(v0 + 176);
}

void *OUTLINED_FUNCTION_138_1@<X0>(uint64_t a1@<X8>)
{
  return sub_18844F728((const void *)(v1 + 24), (void *)(a1 + 16));
}

uint64_t OUTLINED_FUNCTION_139_0()
{
  return sub_1884CA97C();
}

unint64_t OUTLINED_FUNCTION_141_0()
{
  return sub_1884B6B4C();
}

void *OUTLINED_FUNCTION_142(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x79uLL);
}

  ;
}

unint64_t OUTLINED_FUNCTION_144_0()
{
  *(_BYTE *)(v0 - 192) = 6;
  return sub_1884B8B8C();
}

uint64_t OUTLINED_FUNCTION_145_1()
{
  return v0 + 24;
}

unint64_t OUTLINED_FUNCTION_146_1()
{
  *(_BYTE *)(v0 - 192) = 4;
  return sub_1884B8C04();
}

unint64_t OUTLINED_FUNCTION_147_1()
{
  *(_BYTE *)(v0 - 192) = 3;
  return sub_1884B8C40();
}

  ;
}

uint64_t OUTLINED_FUNCTION_150_1()
{
  return sub_18842A58C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_151_1(uint64_t a1)
{
  return sub_1884BA180(a1);
}

unint64_t OUTLINED_FUNCTION_152_1()
{
  *(_BYTE *)(v0 - 192) = 2;
  return sub_1884B8C7C();
}

uint64_t OUTLINED_FUNCTION_153()
{
  return v0 - 96;
}

void *OUTLINED_FUNCTION_154_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  return sub_18844F7AC(va, v10);
}

uint64_t OUTLINED_FUNCTION_155_0()
{
  return sub_18842A484(v1, v0);
}

uint64_t OUTLINED_FUNCTION_157_0()
{
  return __swift_destroy_boxed_opaque_existential_0Tm(*(void *)(v0 - 72));
}

uint64_t OUTLINED_FUNCTION_158_1()
{
  return sub_1884CA73C();
}

  ;
}

uint64_t OUTLINED_FUNCTION_165_1()
{
  return sub_1884CA784();
}

uint64_t OUTLINED_FUNCTION_166_0(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1LL, v2);
}

uint64_t sub_1884BAAB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_1884BAE48();
  OUTLINED_FUNCTION_10_2();
  uint64_t v5 = *(void *)(v4 + 16);
  unint64_t v6 = *(void *)(v4 + 24);
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_18842A578(v5, v6);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_11();
  swift_release();
  return v4;
}

uint64_t sub_1884BAB60()
{
  return swift_willThrow();
}

uint64_t sub_1884BABF4()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1884BAC04()
{
  return sub_1884BAB60();
}

void sub_1884BAC18()
{
}

void sub_1884BAC58(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  unint64_t v6 = *(void *)(v2 + 24);
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  sub_18842A578(v5, v6);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1884BAC98( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, unint64_t))
{
  uint64_t v7 = *a1;
  unint64_t v6 = a1[1];
  sub_18842A484(*a1, v6);
  return a5(v7, v6);
}

void sub_1884BACDC()
{
}

void sub_1884BAD1C()
{
}

void sub_1884BAD54(uint64_t a1)
{
}

void sub_1884BAD8C(uint64_t a1@<X8>)
{
}

void sub_1884BADC8(__int128 *a1)
{
  uint64_t v3 = v1 + 48;
  OUTLINED_FUNCTION_10_2();
  __swift_destroy_boxed_opaque_existential_0Tm(v3);
  sub_18841D4F4(a1, v3);
  swift_endAccess();
  OUTLINED_FUNCTION_26();
}

void sub_1884BAE14()
{
}

void *sub_1884BAE48()
{
  *((_OWORD *)v0 + 1) = xmmword_1884CEDF0;
  *((_OWORD *)v0 + 2) = xmmword_1884CEDF0;
  OUTLINED_FUNCTION_10_2();
  uint64_t v1 = v0[2];
  unint64_t v2 = v0[3];
  *((_OWORD *)v0 + 1) = xmmword_1884CEDF0;
  sub_18842A578(v1, v2);
  OUTLINED_FUNCTION_10_2();
  uint64_t v3 = v0[4];
  unint64_t v4 = v0[5];
  *((_OWORD *)v0 + 2) = xmmword_1884CEDF0;
  sub_18842A578(v3, v4);
  uint64_t v5 = type metadata accessor for KeybagUnsupportedKeybagProvider();
  uint64_t v6 = swift_allocObject();
  v0[9] = v5;
  v0[10] = &off_18A245BF8;
  v0[6] = v6;
  return v0;
}

void sub_1884BAEFC()
{
  uint64_t v1 = (uint64_t *)(v0 + 16);
  OUTLINED_FUNCTION_10_2();
  unint64_t v2 = *(void *)(v0 + 24);
  if (v2 >> 60 == 15) {
    goto LABEL_4;
  }
  uint64_t v3 = *v1;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_298();
  OUTLINED_FUNCTION_298();
  uint64_t v4 = sub_1884C9758();
  sub_18842A578(v3, v2);
  if ((v4 & 0x8000000000000000LL) == 0)
  {
    sub_1884C96BC();
    sub_18842A58C(v5, v2);
LABEL_4:
    sub_1884BAC58(0LL, 0xF000000000000000LL);
    return;
  }

  __break(1u);
}

uint64_t sub_1884BAFA8()
{
  uint64_t v1 = OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_20_10(v1, v2, v3);
  uint64_t v4 = v13;
  uint64_t v5 = v14;
  __swift_project_boxed_opaque_existential_0Tm(v12, v13);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  if (v0) {
    return OUTLINED_FUNCTION_19_11(v6, v7, v8);
  }
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  OUTLINED_FUNCTION_19_11(v6, v7, v8);
  OUTLINED_FUNCTION_71_4();
  OUTLINED_FUNCTION_17_11();
  OUTLINED_FUNCTION_18_17();
  sub_1884BAC58(v10, v11);
  OUTLINED_FUNCTION_71_4();
  OUTLINED_FUNCTION_17_11();
  OUTLINED_FUNCTION_12_12();
  sub_1884BAD1C();
  OUTLINED_FUNCTION_12_12();
  return OUTLINED_FUNCTION_18_17();
}

uint64_t sub_1884BB088()
{
  unint64_t v1 = v0[3];
  if (v1 >> 60 == 15)
  {
    sub_18842E9B8();
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_4_20();
    uint64_t v18 = v15[0];
    uint64_t v19 = v15[1];
    sub_18842FF50();
    OUTLINED_FUNCTION_3_9();
    OUTLINED_FUNCTION_3_3();
    sub_1884CA910();
    return swift_willThrow();
  }

  else
  {
    uint64_t v3 = v0[2];
    OUTLINED_FUNCTION_4_6();
    unint64_t v4 = v0[5];
    if (v4 >> 60 == 15)
    {
      sub_18841E590(v3, v1);
      sub_18842E9B8();
      OUTLINED_FUNCTION_3_3();
      sub_1884CA904();
      sub_18842FF50();
      OUTLINED_FUNCTION_3_9();
      OUTLINED_FUNCTION_3_3();
      sub_1884CA910();
      swift_willThrow();
      return OUTLINED_FUNCTION_13_18();
    }

    else
    {
      uint64_t v5 = v0[4];
      uint64_t v6 = OUTLINED_FUNCTION_4_6();
      OUTLINED_FUNCTION_20_10(v6, v7, v8);
      uint64_t v9 = v16;
      uint64_t v10 = v17;
      __swift_project_boxed_opaque_existential_0Tm(v15, v16);
      uint64_t v11 = *(void (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v10 + 16);
      sub_18842A484(v3, v1);
      sub_18842A484(v5, v4);
      v11(v3, v1, v5, v4, v9, v10);
      sub_18842A578(v5, v4);
      uint64_t v12 = OUTLINED_FUNCTION_13_18();
      return OUTLINED_FUNCTION_19_11(v12, v13, v14);
    }
  }

uint64_t sub_1884BB2A0(uint64_t a1)
{
  return swift_endAccess();
}

uint64_t RemoteUnlockKeypair.deinit()
{
  return v0;
}

uint64_t RemoteUnlockKeypair.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void sub_1884BB344(void *a1@<X8>)
{
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_1884BB368(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1884BAC98(a1, a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t))sub_1884BAC58);
}

void sub_1884BB384(void *a1@<X8>)
{
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_1884BB3A8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1884BAC98(a1, a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t))sub_1884BAD1C);
}

void sub_1884BB3C4(uint64_t a1@<X8>)
{
}

uint64_t dispatch thunk of KeybagProvider.newKeypair()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of KeybagProvider.unlock(hostKey:deviceKey:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t type metadata accessor for KeybagUnsupportedKeybagProvider()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for RemoteUnlockKeypair()
{
  return objc_opt_self();
}

uint64_t method lookup function for RemoteUnlockKeypair()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.hostKey.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104LL))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.hostKey.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112LL))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.hostKey.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120LL))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.deviceKey.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128LL))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.deviceKey.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.deviceKey.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144LL))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.keybagProvider.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152LL))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.keybagProvider.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160LL))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.keybagProvider.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168LL))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.populateWithNewKeypair()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192LL))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.unlockDevice()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200LL))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.configure(newKeybagProvider:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208LL))();
}

uint64_t OUTLINED_FUNCTION_2_19()
{
  return sub_1884CA8F8();
}

uint64_t OUTLINED_FUNCTION_4_20()
{
  return sub_1884CA904();
}

void OUTLINED_FUNCTION_6_18()
{
}

uint64_t OUTLINED_FUNCTION_10_11()
{
  uint64_t v3 = *(void *)(v1 + 32);
  unint64_t v4 = *(void *)(v1 + 40);
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 4sub_188455A4C(v0, v1, 0) = v0;
  return sub_18842A578(v3, v4);
}

uint64_t OUTLINED_FUNCTION_12_12()
{
  return sub_18842A58C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_13_18()
{
  return sub_18842A578(v1, v0);
}

uint64_t OUTLINED_FUNCTION_17_11()
{
  return sub_18841E590(v0, v1);
}

uint64_t OUTLINED_FUNCTION_18_17()
{
  return sub_18842A58C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_19_11(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_20_10(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  return sub_18842FFC8(v3, (uint64_t)va);
}

uint64_t sub_1884BB598()
{
  uint64_t result = sub_1884CA400();
  qword_18C710060 = result;
  return result;
}

BOOL static BonjourBrowser.Mode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void BonjourBrowser.Mode.hash(into:)()
{
}

void _s19RemotePairingDevice14BonjourBrowserC4ModeO9hashValueSivg_0()
{
}

void BonjourBrowser.Change.kind.getter(_BYTE *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t BonjourBrowser.Change.advert.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(OUTLINED_FUNCTION_44_10() + 20);
  return sub_1884BB6E8(v3, a1);
}

uint64_t type metadata accessor for BonjourBrowser.Change()
{
  uint64_t result = qword_18C7101D0;
  if (!qword_18C7101D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1884BB6E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DiscoveredBonjourAdvert();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void BonjourBrowser.Change.resolvedPairing.getter()
{
  id v1 = *(id *)(v0 + *(int *)(OUTLINED_FUNCTION_44_10() + 24));
  OUTLINED_FUNCTION_1_0();
}

uint64_t BonjourBrowser.__allocating_init(service:includePeerToPeer:netLinkManager:pairingManager:mode:)( unsigned __int8 *a1)
{
  uint64_t v2 = swift_allocObject();
  BonjourBrowser.init(service:includePeerToPeer:netLinkManager:pairingManager:mode:)(a1);
  return v2;
}

void BonjourBrowser.init(service:includePeerToPeer:netLinkManager:pairingManager:mode:)(unsigned __int8 *a1)
{
  uint64_t v2 = *a1;
  sub_1884C9CF8();
  *(void *)(v1 + 88) = 0LL;
  *(void *)(v1 + 96) = 0LL;
  sub_1884C9CD4();
  sub_1884C9CB0();
  uint64_t v3 = sub_1884C9E3C();
  MEMORY[0x1895F8858](v3);
  OUTLINED_FUNCTION_34();
  __asm { BR              X11 }

uint64_t sub_1884BB87C()
{
  *uint64_t v2 = 0xD000000000000013LL;
  v2[1] = 0x80000001884DAD10LL;
  v2[2] = 0LL;
  v2[3] = 0LL;
  (*(void (**)(void *, void))(v0 + 104))(v2, *MEMORY[0x189608D08]);
  sub_1884C9ECC();
  swift_allocObject();
  swift_retain();
  *(void *)(v1 + 16) = sub_1884C9E54();
  *(_BYTE *)(v1 + 24) = v6;
  *(void *)(v1 + 32) = v4;
  sub_18842FFC8(v3, v1 + 40);
  *(_BYTE *)(v1 + 8sub_188455A4C(v0, v1, 0) = v5;
  swift_allocObject();
  swift_weakInit();
  id v7 = v4;
  swift_retain();
  sub_188425FE0((uint64_t)sub_1884BBA78);
  sub_1884C9E48();
  swift_release();

  __swift_destroy_boxed_opaque_existential_0Tm(v3);
  OUTLINED_FUNCTION_12_2();
  return v1;
}

uint64_t sub_1884BB9E4()
{
  return swift_deallocObject();
}

uint64_t sub_1884BBA08(os_log_s *a1, uint64_t a2)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1884BBC34(a1, a2);
    return swift_release();
  }

  return result;
}

uint64_t sub_1884BBA78(os_log_s *a1, uint64_t a2)
{
  return sub_1884BBA08(a1, a2);
}

uint64_t sub_1884BBA80@<X0>(void (**a1)()@<X8>)
{
  uint64_t result = sub_1884BBB64();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    char v6 = sub_188425FF8;
  }

  else
  {
    char v6 = 0LL;
  }

  *a1 = v6;
  a1[1] = (void (*)())result;
  return result;
}

uint64_t sub_1884BBAE4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_188425FF8;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v3 = 0LL;
  }

  sub_188425FE0(v1);
  return sub_1884BBBA8((uint64_t)v4, v3);
}

uint64_t sub_1884BBB64()
{
  uint64_t v1 = *(void *)(v0 + 88);
  sub_188425FE0(v1);
  return v1;
}

uint64_t sub_1884BBBA8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 88);
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = a2;
  return sub_188426020(v5);
}

uint64_t (*sub_1884BBBF8())()
{
  return j__swift_endAccess;
}

void sub_1884BBC34(os_log_s *a1, uint64_t a2)
{
  LOBYTE(v5) = sub_1884CA250();
  if (qword_18C70D748 == -1) {
    goto LABEL_2;
  }
LABEL_27:
  swift_once();
LABEL_2:
  if (os_log_type_enabled((os_log_t)qword_18C710060, (os_log_type_t)v5))
  {
    swift_retain_n();
    char v6 = (_DWORD *)OUTLINED_FUNCTION_4_7();
    OUTLINED_FUNCTION_4_7();
    *char v6 = 136446210;
    __asm { BR              X10 }
  }

  uint64_t v7 = a2 + 56;
  uint64_t v8 = 1LL << *(_BYTE *)(a2 + 32);
  uint64_t v9 = -1LL;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  unint64_t v10 = v9 & *(void *)(a2 + 56);
  uint64_t v5 = sub_1884C9E84();
  uint64_t v11 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  OUTLINED_FUNCTION_34();
  uint64_t v14 = v13 - v12;
  int64_t v15 = (unint64_t)(v8 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v16 = 0LL;
  if (v10)
  {
LABEL_7:
    unint64_t v17 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v18 = v17 | (v16 << 6);
    goto LABEL_22;
  }

  while (1)
  {
    int64_t v19 = v16 + 1;
    if (__OFADD__(v16, 1LL))
    {
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }

    if (v19 >= v15) {
      goto LABEL_24;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v16;
    if (!v20)
    {
      int64_t v16 = v19 + 1;
      if (v19 + 1 >= v15) {
        goto LABEL_24;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v16);
      if (!v20)
      {
        int64_t v16 = v19 + 2;
        if (v19 + 2 >= v15) {
          goto LABEL_24;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v16);
        if (!v20) {
          break;
        }
      }
    }

void sub_1884BBF64(os_log_s *a1, uint64_t a2)
{
  v248 = a1;
  uint64_t v235 = OUTLINED_FUNCTION_44_10();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v3);
  OUTLINED_FUNCTION_28_0();
  v236 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C710210);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v5);
  OUTLINED_FUNCTION_28_0();
  uint64_t v242 = v6;
  v246 = (char *)type metadata accessor for DiscoveredBonjourAdvert();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v7);
  v237 = (char *)v233 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  OUTLINED_FUNCTION_16_10();
  MEMORY[0x1895F8858](v9);
  v239 = (void (*)(char *, uint64_t, uint64_t))((char *)v233 - v10);
  OUTLINED_FUNCTION_16_10();
  MEMORY[0x1895F8858](v11);
  v241 = (uint64_t *)((char *)v233 - v12);
  OUTLINED_FUNCTION_16_10();
  MEMORY[0x1895F8858](v13);
  v240 = (void (*)(char *, char *, uint64_t *))((char *)v233 - v14);
  OUTLINED_FUNCTION_16_10();
  MEMORY[0x1895F8858](v15);
  v243 = (uint64_t *)((char *)v233 - v16);
  os_log_type_t v17 = sub_1884CA250();
  if (qword_18C70D748 != -1) {
    swift_once();
  }
  unint64_t v18 = (os_log_s *)qword_18C710060;
  uint64_t v19 = sub_1884C9E84();
  unint64_t v20 = *(void **)(v19 - 8);
  int64_t v21 = (os_log_s *)v20[8];
  MEMORY[0x1895F8858](v19);
  unint64_t v22 = ((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  unint64_t v23 = (char *)v233 - v22;
  unint64_t v24 = (void (*)(char *, char *, uint64_t))v20[2];
  v251 = (uint64_t *)a2;
  OUTLINED_FUNCTION_49_8((uint64_t)v233 - v22, a2);
  v252 = v18;
  BOOL v25 = os_log_type_enabled(v18, v17);
  v253 = v21;
  if (v25)
  {
    uint64_t v26 = v19;
    char v27 = (uint8_t *)OUTLINED_FUNCTION_4_7();
    uint64_t v28 = OUTLINED_FUNCTION_4_7();
    v249 = v233;
    *(void *)v255 = v28;
    *(_DWORD *)char v27 = 136315138;
    uint64_t v250 = (uint64_t)(v27 + 4);
    MEMORY[0x1895F8858](v28);
    v24((char *)v233 - v22, v23, v26);
    uint64_t v29 = sub_1884CA0A0();
    OUTLINED_FUNCTION_42_7(v29, v30);
    OUTLINED_FUNCTION_335_0(v31);
    sub_1884CA430();
    swift_bridgeObjectRelease();
    uint64_t v250 = v20[1];
    ((void (*)(char *, uint64_t))v250)(v23, v26);
    OUTLINED_FUNCTION_34_1(&dword_18840C000, v252, v17, "Handling result change from bonjour browser: %s", v27);
    OUTLINED_FUNCTION_33_3();
    OUTLINED_FUNCTION_0_11();
  }

  uint64_t v250 = v20[1];
  ((void (*)(char *, uint64_t))v250)((char *)v233 - v22, v19);
  char v32 = v20;
  uint64_t v33 = sub_1884C9EB4();
  v252 = (os_log_s *)v233;
  v249 = (uint64_t *)v33;
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(void *)(v34 + 64);
  uint64_t v36 = MEMORY[0x1895F8858](v33);
  v245 = (uint64_t *)((char *)v233 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  MEMORY[0x1895F8858](v36);
  uint64_t v37 = (char *)v233 - (((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v38 = OUTLINED_FUNCTION_49_8((uint64_t)v37, (uint64_t)v251);
  v251 = v233;
  MEMORY[0x1895F8858](v38);
  uint64_t v39 = v37;
  OUTLINED_FUNCTION_49_8((uint64_t)v37, (uint64_t)v37);
  id v40 = (uint64_t (*)(char *, uint64_t))v20[11];
  uint64_t v254 = v19;
  int v41 = v40(v37, v19);
  __int128 v42 = (void (**)(uint64_t *, uint64_t *))MEMORY[0x189608D48];
  if (MEMORY[0x189608D48] && v41 == *MEMORY[0x189608D48])
  {
    uint64_t v43 = OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_34_10(v43, v44, v45, v46, v47, v48, v49, v50, v233[0]);
    uint64_t v52 = MEMORY[0x1895F8858](v51);
    OUTLINED_FUNCTION_2_20(v52, v53, v54, v55, v56, v57, v58, v59, v233[0]);
    if ((OUTLINED_FUNCTION_45_7() & 1) == 0)
    {
      uint64_t v60 = sub_1884CA274();
      os_log_type_t v61 = v60;
      char v62 = (os_log_s *)qword_18C710060;
      uint64_t v63 = MEMORY[0x1895F8858](v60);
      OUTLINED_FUNCTION_9_18(v63, v64, v65, v66, v67, v68, v69, v70, v233[0]);
      v253 = v62;
      if (os_log_type_enabled(v62, v61))
      {
        uint64_t v71 = OUTLINED_FUNCTION_4_7();
        v238 = v37;
        v248 = (os_log_s *)v233;
        uint64_t v72 = (uint8_t *)v71;
        uint64_t v73 = OUTLINED_FUNCTION_4_7();
        v245 = v233;
        *(void *)v255 = v73;
        LODWORD(v247) = v61;
        OUTLINED_FUNCTION_37_7(4.8149e-34);
        v246 = (char *)v74;
        uint64_t v76 = MEMORY[0x1895F8858](v75);
        OUTLINED_FUNCTION_6_19(v76, v77, v78, v79, v80, v81, v82, v83, v233[0]);
        uint64_t v84 = OUTLINED_FUNCTION_40_11();
        OUTLINED_FUNCTION_42_7(v84, v85);
        OUTLINED_FUNCTION_335_0(v86);
        OUTLINED_FUNCTION_31_9();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_14_11((uint64_t)v37);
        OUTLINED_FUNCTION_34_1( &dword_18840C000,  v253,  (os_log_type_t)v247,  "Received bonjour notification to add result %s, but result is not present in full results set. Ignoring",  v72);
        OUTLINED_FUNCTION_33_3();
        OUTLINED_FUNCTION_0_11();
      }

uint64_t sub_1884BD340(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (uint64_t v4 = sub_1884C9EB4(),
        sub_18841729C(&qword_18C710228, (uint64_t (*)(uint64_t))MEMORY[0x189608D88], MEMORY[0x189608D98]),
        uint64_t v5 = sub_1884C9FEC(),
        uint64_t v6 = -1LL << *(_BYTE *)(a2 + 32),
        unint64_t v7 = v5 & ~v6,
        uint64_t v17 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) != 0))
  {
    uint64_t v15 = ~v6;
    uint64_t v16 = a1;
    uint64_t v8 = *(void *)(v4 - 8);
    uint64_t v10 = *(void *)(v8 + 64);
    uint64_t v9 = *(void *)(v8 + 72);
    uint64_t v11 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
    do
    {
      MEMORY[0x1895F8858](v5);
      v11((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL), *(void *)(a2 + 48) + v9 * v7, v4);
      sub_18841729C(&qword_18C710230, (uint64_t (*)(uint64_t))MEMORY[0x189608D88], MEMORY[0x189608DA0]);
      char v12 = sub_1884CA034();
      uint64_t v5 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL), v4);
      if ((v12 & 1) != 0) {
        break;
      }
      unint64_t v7 = (v7 + 1) & v15;
    }

    while (((*(void *)(v17 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) != 0);
  }

  else
  {
    char v12 = 0;
  }

  return v12 & 1;
}

uint64_t sub_1884BD4CC()
{
  if (*(void *)(v0 + 88)) {
    return sub_1884C9E60();
  }
  uint64_t result = sub_1884CA5E0();
  __break(1u);
  return result;
}

void sub_1884BD55C()
{
}

void BonjourBrowser.deinit()
{
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 40);
  sub_188426020(*(void *)(v0 + 88));
  OUTLINED_FUNCTION_1_0();
}

uint64_t BonjourBrowser.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_1884BD5E0()
{
  unint64_t result = qword_18C710068;
  if (!qword_18C710068)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for BonjourBrowser.Mode,  &type metadata for BonjourBrowser.Mode);
    atomic_store(result, (unint64_t *)&qword_18C710068);
  }

  return result;
}

unint64_t sub_1884BD620()
{
  unint64_t result = qword_18C710070;
  if (!qword_18C710070)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for BonjourBrowser.Change.Kind,  &type metadata for BonjourBrowser.Change.Kind);
    atomic_store(result, (unint64_t *)&qword_18C710070);
  }

  return result;
}

uint64_t type metadata accessor for BonjourBrowser()
{
  return objc_opt_self();
}

uint64_t method lookup function for BonjourBrowser()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BonjourBrowser.__allocating_init(service:includePeerToPeer:netLinkManager:pairingManager:mode:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of BonjourBrowser.resultsChangedHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t dispatch thunk of BonjourBrowser.resultsChangedHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144LL))();
}

uint64_t dispatch thunk of BonjourBrowser.resultsChangedHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152LL))();
}

uint64_t dispatch thunk of BonjourBrowser.start(queue:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176LL))();
}

uint64_t dispatch thunk of BonjourBrowser.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184LL))();
}

ValueMetadata *type metadata accessor for BonjourBrowser.Mode()
{
  return &type metadata for BonjourBrowser.Mode;
}

uint64_t *initializeBufferWithCopyOfBuffer for BonjourBrowser.Change(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v40 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v40 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_1884C9B00();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
    uint64_t v11 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
    v8[v11[5]] = v9[v11[5]];
    uint64_t v12 = v11[6];
    uint64_t v13 = &v8[v12];
    uint64_t v14 = &v9[v12];
    uint64_t v15 = sub_1884C97F4();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(void *)(v15 - 8) + 16LL))(v13, v14, v15);
    uint64_t v16 = v11[7];
    uint64_t v17 = (uint64_t *)&v8[v16];
    unint64_t v18 = (uint64_t *)&v9[v16];
    uint64_t v19 = *v18;
    unint64_t v20 = v18[1];
    sub_18841E590(*v18, v20);
    *uint64_t v17 = v19;
    v17[1] = v20;
    uint64_t v21 = v11[8];
    unint64_t v22 = *(void **)&v9[v21];
    *(void *)&v8[v21] = v22;
    uint64_t v23 = v11[9];
    __int128 v42 = *(void **)&v9[v23];
    *(void *)&v8[v23] = v42;
    uint64_t v24 = v11[10];
    BOOL v25 = &v8[v24];
    uint64_t v26 = &v9[v24];
    uint64_t v27 = *((void *)v26 + 1);
    *BOOL v25 = *(void *)v26;
    v25[1] = v27;
    uint64_t v28 = v11[11];
    uint64_t v29 = &v8[v28];
    unint64_t v30 = &v9[v28];
    uint64_t v31 = *((void *)v30 + 1);
    *uint64_t v29 = *(void *)v30;
    v29[1] = v31;
    *(void *)&v8[v11[12]] = *(void *)&v9[v11[12]];
    *(void *)&v8[v11[13]] = *(void *)&v9[v11[13]];
    uint64_t v32 = v11[14];
    uint64_t v33 = *(void **)&v9[v32];
    *(void *)&v8[v32] = v33;
    *(void *)&v8[v11[15]] = *(void *)&v9[v11[15]];
    uint64_t v34 = *(int *)(a3 + 24);
    uint64_t v35 = *(void **)((char *)a2 + v34);
    *(uint64_t *)((char *)v4 + v34) = (uint64_t)v35;
    id v36 = v22;
    id v37 = v42;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v38 = v33;
    swift_bridgeObjectRetain();
    id v39 = v35;
  }

  return v4;
}

void destroy for BonjourBrowser.Change(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1884C9B00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  uint64_t v6 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  uint64_t v7 = v4 + v6[6];
  uint64_t v8 = sub_1884C97F4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  sub_18842A58C(*(void *)(v4 + v6[7]), *(void *)(v4 + v6[7] + 8));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

_BYTE *initializeWithCopy for BonjourBrowser.Change(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = &a1[v5];
  uint64_t v7 = &a2[v5];
  uint64_t v8 = sub_1884C9B00();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v8 - 8) + 16LL))(v6, v7, v8);
  uint64_t v9 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  v6[v9[5]] = v7[v9[5]];
  uint64_t v10 = v9[6];
  uint64_t v11 = &v6[v10];
  uint64_t v12 = &v7[v10];
  uint64_t v13 = sub_1884C97F4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v11, v12, v13);
  uint64_t v14 = v9[7];
  uint64_t v15 = (uint64_t *)&v6[v14];
  uint64_t v16 = (uint64_t *)&v7[v14];
  uint64_t v17 = *v16;
  unint64_t v18 = v16[1];
  sub_18841E590(*v16, v18);
  *uint64_t v15 = v17;
  v15[1] = v18;
  uint64_t v19 = v9[8];
  unint64_t v20 = *(void **)&v7[v19];
  *(void *)&v6[v19] = v20;
  uint64_t v21 = v9[9];
  unint64_t v22 = *(void **)&v7[v21];
  *(void *)&v6[v21] = v22;
  uint64_t v23 = v9[10];
  uint64_t v24 = &v6[v23];
  BOOL v25 = &v7[v23];
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = v9[11];
  uint64_t v28 = &v6[v27];
  uint64_t v29 = &v7[v27];
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  *(void *)&v6[v9[12]] = *(void *)&v7[v9[12]];
  *(void *)&v6[v9[13]] = *(void *)&v7[v9[13]];
  uint64_t v31 = v9[14];
  uint64_t v32 = *(void **)&v7[v31];
  *(void *)&v6[v31] = v32;
  *(void *)&v6[v9[15]] = *(void *)&v7[v9[15]];
  uint64_t v33 = *(int *)(a3 + 24);
  uint64_t v34 = *(void **)&a2[v33];
  *(void *)&a1[v33] = v34;
  id v35 = v20;
  id v36 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v37 = v32;
  swift_bridgeObjectRetain();
  id v38 = v34;
  return a1;
}

_BYTE *assignWithCopy for BonjourBrowser.Change(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1884C9B00();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v9 - 8) + 24LL))(v7, v8, v9);
  uint64_t v10 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  v7[v10[5]] = v8[v10[5]];
  uint64_t v11 = v10[6];
  uint64_t v12 = &v7[v11];
  uint64_t v13 = &v8[v11];
  uint64_t v14 = sub_1884C97F4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v14 - 8) + 24LL))(v12, v13, v14);
  uint64_t v15 = v10[7];
  uint64_t v16 = (uint64_t *)&v7[v15];
  uint64_t v17 = (uint64_t *)&v8[v15];
  uint64_t v18 = *v17;
  unint64_t v19 = v17[1];
  sub_18841E590(*v17, v19);
  uint64_t v20 = *v16;
  unint64_t v21 = v16[1];
  *uint64_t v16 = v18;
  v16[1] = v19;
  sub_18842A58C(v20, v21);
  uint64_t v22 = v10[8];
  uint64_t v23 = *(void **)&v7[v22];
  uint64_t v24 = *(void **)&v8[v22];
  *(void *)&v7[v22] = v24;
  id v25 = v24;

  uint64_t v26 = v10[9];
  uint64_t v27 = *(void **)&v7[v26];
  uint64_t v28 = *(void **)&v8[v26];
  *(void *)&v7[v26] = v28;
  id v29 = v28;

  uint64_t v30 = v10[10];
  uint64_t v31 = &v7[v30];
  uint64_t v32 = &v8[v30];
  *uint64_t v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v33 = v10[11];
  uint64_t v34 = &v7[v33];
  id v35 = &v8[v33];
  *uint64_t v34 = *v35;
  v34[1] = v35[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&v7[v10[12]] = *(void *)&v8[v10[12]];
  *(void *)&v7[v10[13]] = *(void *)&v8[v10[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v36 = v10[14];
  id v37 = *(void **)&v8[v36];
  id v38 = *(void **)&v7[v36];
  *(void *)&v7[v36] = v37;
  id v39 = v37;

  *(void *)&v7[v10[15]] = *(void *)&v8[v10[15]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v40 = *(int *)(a3 + 24);
  int v41 = *(void **)&a1[v40];
  __int128 v42 = *(void **)&a2[v40];
  *(void *)&a1[v40] = v42;
  id v43 = v42;

  return a1;
}

_BYTE *initializeWithTake for BonjourBrowser.Change(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1884C9B00();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
  uint64_t v10 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  v7[v10[5]] = v8[v10[5]];
  uint64_t v11 = v10[6];
  uint64_t v12 = &v7[v11];
  uint64_t v13 = &v8[v11];
  uint64_t v14 = sub_1884C97F4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v14 - 8) + 32LL))(v12, v13, v14);
  *(_OWORD *)&v7[v10[7]] = *(_OWORD *)&v8[v10[7]];
  *(void *)&v7[v10[8]] = *(void *)&v8[v10[8]];
  *(void *)&v7[v10[9]] = *(void *)&v8[v10[9]];
  *(_OWORD *)&v7[v10[10]] = *(_OWORD *)&v8[v10[10]];
  *(_OWORD *)&v7[v10[11]] = *(_OWORD *)&v8[v10[11]];
  *(void *)&v7[v10[12]] = *(void *)&v8[v10[12]];
  *(void *)&v7[v10[13]] = *(void *)&v8[v10[13]];
  *(void *)&v7[v10[14]] = *(void *)&v8[v10[14]];
  *(void *)&v7[v10[15]] = *(void *)&v8[v10[15]];
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *assignWithTake for BonjourBrowser.Change(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1884C9B00();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v9 - 8) + 40LL))(v7, v8, v9);
  uint64_t v10 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  v7[v10[5]] = v8[v10[5]];
  uint64_t v11 = v10[6];
  uint64_t v12 = &v7[v11];
  uint64_t v13 = &v8[v11];
  uint64_t v14 = sub_1884C97F4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v14 - 8) + 40LL))(v12, v13, v14);
  uint64_t v15 = v10[7];
  uint64_t v16 = *(void *)&v7[v15];
  unint64_t v17 = *(void *)&v7[v15 + 8];
  *(_OWORD *)&v7[v15] = *(_OWORD *)&v8[v15];
  sub_18842A58C(v16, v17);
  uint64_t v18 = v10[8];
  unint64_t v19 = *(void **)&v7[v18];
  *(void *)&v7[v18] = *(void *)&v8[v18];

  uint64_t v20 = v10[9];
  unint64_t v21 = *(void **)&v7[v20];
  *(void *)&v7[v20] = *(void *)&v8[v20];

  uint64_t v22 = v10[10];
  uint64_t v23 = &v7[v22];
  uint64_t v24 = (uint64_t *)&v8[v22];
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = v10[11];
  uint64_t v28 = &v7[v27];
  id v29 = (uint64_t *)&v8[v27];
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  *uint64_t v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  *(void *)&v7[v10[12]] = *(void *)&v8[v10[12]];
  *(void *)&v7[v10[13]] = *(void *)&v8[v10[13]];
  swift_bridgeObjectRelease();
  uint64_t v32 = v10[14];
  uint64_t v33 = *(void **)&v7[v32];
  *(void *)&v7[v32] = *(void *)&v8[v32];

  *(void *)&v7[v10[15]] = *(void *)&v8[v10[15]];
  swift_bridgeObjectRelease();
  uint64_t v34 = *(int *)(a3 + 24);
  id v35 = *(void **)&a1[v34];
  *(void *)&a1[v34] = *(void *)&a2[v34];

  return a1;
}

uint64_t getEnumTagSinglePayload for BonjourBrowser.Change()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1884BDFEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OUTLINED_FUNCTION_23_11();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)v3) {
    return __swift_getEnumTagSinglePayload(v4 + *(int *)(a3 + 20), v3, v6);
  }
  unint64_t v8 = *(void *)(v4 + *(int *)(a3 + 24));
  if (v8 >= 0xFFFFFFFF) {
    LODWORD(v8) = -1;
  }
  int v9 = v8 - 1;
  if (v9 < 0) {
    int v9 = -1;
  }
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for BonjourBrowser.Change()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1884BE074(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = OUTLINED_FUNCTION_23_11();
  if (*(_DWORD *)(*(void *)(result - 8) + 84LL) == a3) {
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 20), v4, v4, result);
  }
  *(void *)(v5 + *(int *)(a4 + sub_18842A578(*(void *)(v0 + 16), *(void *)(v0 + 24)) = v4;
  return result;
}

uint64_t sub_1884BE0E0()
{
  uint64_t result = type metadata accessor for DiscoveredBonjourAdvert();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t _s19RemotePairingDevice14BonjourBrowserC4ModeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1884BE1A8 + 4 * byte_1884D5D6A[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1884BE1DC + 4 * byte_1884D5D65[v4]))();
}

uint64_t sub_1884BE1DC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884BE1E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1884BE1ECLL);
  }
  return result;
}

uint64_t sub_1884BE1F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1884BE200LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1884BE204(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884BE20C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BonjourBrowser.Change.Kind()
{
  return &type metadata for BonjourBrowser.Change.Kind;
}

uint64_t sub_1884BE228(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C710210);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1884BE268(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DiscoveredBonjourAdvert();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1884BE2AC()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_2_20( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(char *, uint64_t, void))(v11 + 32))( (char *)&a9 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v9,  *(void *)(v12 - 184));
}

uint64_t OUTLINED_FUNCTION_4_21()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_18()
{
  *(void *)(v5 - 328) = v0;
  *(void *)(v5 - 32sub_188455A4C(v0, v1, 0) = v2;
  *(void *)(v5 - 224) = v1;
  return (*(uint64_t (**)(uint64_t, void))(v4 + 96))(v3, *(void *)(v5 - 144));
}

uint64_t OUTLINED_FUNCTION_6_19( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return v9((char *)&a9 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL), v10, v12);
}

uint64_t OUTLINED_FUNCTION_7_14()
{
  return v0(v1);
}

uint64_t OUTLINED_FUNCTION_9_18( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&a9 - v9, v12, v10);
}

  ;
}

uint64_t OUTLINED_FUNCTION_14_11(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_15_13(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_16_14()
{
  return (*(uint64_t (**)(void, void))(v0 - 176))(*(void *)(v0 - 272), *(void *)(v0 - 144));
}

void OUTLINED_FUNCTION_17_12()
{
}

uint64_t OUTLINED_FUNCTION_18_18()
{
  return sub_1884CA430();
}

uint64_t OUTLINED_FUNCTION_19_12()
{
  return (*(uint64_t (**)(void))(v0 - 176))();
}

uint64_t OUTLINED_FUNCTION_21_9()
{
  return sub_1884BB6E8(v0, *(void *)(v1 - 248));
}

void OUTLINED_FUNCTION_22_8(uint64_t a1)
{
}

uint64_t OUTLINED_FUNCTION_23_11()
{
  return type metadata accessor for DiscoveredBonjourAdvert();
}

void OUTLINED_FUNCTION_25_13(uint64_t a1, uint64_t (*a2)(void))
{
}

void OUTLINED_FUNCTION_28_11(uint64_t a1, unint64_t a2)
{
}

uint64_t OUTLINED_FUNCTION_29_5()
{
  *(void *)(v1 - 136) = *(void *)(v1 - 168);
  *(void *)(v1 - 128) = v0;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_30_12()
{
  return 0x6E6E75742D70725FLL;
}

uint64_t OUTLINED_FUNCTION_31_9()
{
  return sub_1884CA430();
}

void OUTLINED_FUNCTION_34_10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v9 - 304) = &a9;
}

uint64_t OUTLINED_FUNCTION_36_7()
{
  return v0(v2, v1);
}

void OUTLINED_FUNCTION_37_7(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t OUTLINED_FUNCTION_38_10()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_40_11()
{
  return sub_1884CA0A0();
}

void OUTLINED_FUNCTION_42_7(uint64_t a1, unint64_t a2)
{
}

uint64_t OUTLINED_FUNCTION_44_10()
{
  return type metadata accessor for BonjourBrowser.Change();
}

uint64_t OUTLINED_FUNCTION_45_7()
{
  return sub_1884BD340(v0, *(void *)(v1 - 192));
}

uint64_t OUTLINED_FUNCTION_46_9()
{
  return sub_1884BBF64(v1, v0);
}

uint64_t OUTLINED_FUNCTION_47_6()
{
  return sub_1884CA0A0();
}

uint64_t OUTLINED_FUNCTION_49_8(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, v3);
}

id OUTLINED_FUNCTION_50_7()
{
  *(void *)(v1 + *(int *)(v0 + sub_18842A578(*(void *)(v0 + 16), *(void *)(v0 + 24)) = v2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_51_7(uint64_t a1, uint64_t a2)
{
  return sub_1884BB6E8(*(void *)(v2 - 232), a2);
}

uint64_t sub_1884BE520()
{
  uint64_t v0 = sub_1884CA304();
  MEMORY[0x1895F8858](v0);
  OUTLINED_FUNCTION_34();
  (*(void (**)(uint64_t, void))(v3 + 104))(v2 - v1, *MEMORY[0x18961B910]);
  sub_1884C9F14();
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v4);
  OUTLINED_FUNCTION_101();
  sub_1884C9EFC();
  sub_1884CA2E0();
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v5);
  OUTLINED_FUNCTION_15_0();
  sub_188460E6C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C4DEC50);
  sub_188460EAC();
  sub_1884CA484();
  uint64_t result = sub_1884CA31C();
  qword_18C710238 = result;
  return result;
}

id defaultPairingOperationQ.getter()
{
  if (qword_18C70D750 != -1) {
    swift_once();
  }
  return (id)qword_18C710238;
}

uint64_t AttemptPairingPinCommand.pinAttempt.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1884BE6E0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6D657474416E6970LL && a2 == 0xEA00000000007470LL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }

  else
  {
    char v3 = sub_1884CA820();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }

  return v4 & 1;
}

uint64_t sub_1884BE770()
{
  return 0x6D657474416E6970LL;
}

uint64_t sub_1884BE790@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884BE6E0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1884BE7B8()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884BE7E0()
{
  return sub_1884CAA00();
}

void AttemptPairingPinCommand.encode(to:)()
{
  uint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C710240);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  OUTLINED_FUNCTION_9_0();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1884BE8C4();
  sub_1884CA9E8();
  sub_1884CA754();
  OUTLINED_FUNCTION_29_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_1884BE8C4()
{
  unint64_t result = qword_18C710248;
  if (!qword_18C710248)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D692C, &type metadata for AttemptPairingPinCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710248);
  }

  return result;
}

void AttemptPairingPinCommand.init(from:)()
{
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C710250);
  OUTLINED_FUNCTION_152();
  MEMORY[0x1895F8858](v7);
  OUTLINED_FUNCTION_9_0();
  __swift_project_boxed_opaque_existential_0Tm(v4, v4[3]);
  sub_1884BE8C4();
  OUTLINED_FUNCTION_16_2();
  if (!v0)
  {
    uint64_t v8 = sub_1884CA688();
    uint64_t v10 = v9;
    OUTLINED_FUNCTION_29_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    *uint64_t v6 = v8;
    v6[1] = v10;
  }

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v4);
  OUTLINED_FUNCTION_0_2();
}

void sub_1884BE9D4()
{
}

void sub_1884BE9E8()
{
}

uint64_t PairingChallengeEvent.lastAttemptIncorrect.getter()
{
  return *v0;
}

uint64_t PairingChallengeEvent.throttleSeconds.getter()
{
  return *(void *)(v0 + 8);
}

RemotePairingDevice::PairingChallengeEvent __swiftcall PairingChallengeEvent.init(lastAttemptIncorrect:throttleSeconds:)( Swift::Bool lastAttemptIncorrect, Swift::Int_optional throttleSeconds)
{
  *(_BYTE *)uint64_t v2 = lastAttemptIncorrect;
  *(void *)(v2 + 8) = throttleSeconds.value;
  *(_BYTE *)(v2 + 16) = throttleSeconds.is_nil;
  result.throttleSeconds = throttleSeconds;
  result.lastAttemptIncorrect = lastAttemptIncorrect;
  return result;
}

uint64_t sub_1884BEA24(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014LL && a2 == 0x80000001884DABB0LL || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x656C74746F726874LL && a2 == 0xEF73646E6F636553LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = sub_1884CA820();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1884BEB30(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x656C74746F726874LL;
  }
  else {
    return 0xD000000000000014LL;
  }
}

uint64_t sub_1884BEB7C()
{
  return sub_1884BEB30(*v0);
}

uint64_t sub_1884BEB84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884BEA24(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884BEBA8()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884BEBD0()
{
  return sub_1884CAA00();
}

void PairingChallengeEvent.encode(to:)()
{
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C710258);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  OUTLINED_FUNCTION_101();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1884BECFC();
  sub_1884CA9E8();
  sub_1884CA760();
  if (!v0) {
    sub_1884CA730();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_1884BECFC()
{
  unint64_t result = qword_18C710260;
  if (!qword_18C710260)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D68DC, &type metadata for PairingChallengeEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710260);
  }

  return result;
}

void PairingChallengeEvent.init(from:)()
{
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C710268);
  OUTLINED_FUNCTION_152();
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_34();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1884BECFC();
  OUTLINED_FUNCTION_16_2();
  if (!v0)
  {
    char v10 = sub_1884CA694();
    uint64_t v11 = sub_1884CA664();
    char v13 = v12;
    OUTLINED_FUNCTION_29_0(v9, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    *(_BYTE *)uint64_t v5 = v10 & 1;
    *(void *)(v5 + 8) = v11;
    *(_BYTE *)(v5 + 16) = v13 & 1;
  }

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
  OUTLINED_FUNCTION_0_2();
}

void sub_1884BEE54()
{
}

void sub_1884BEE68()
{
}

uint64_t sub_1884BEE7C()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884BEEA4()
{
  return sub_1884CAA00();
}

uint64_t CancelPairingCommand.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C710270);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  OUTLINED_FUNCTION_15_0();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1884BEF80();
  sub_1884CA9E8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
}

unint64_t sub_1884BEF80()
{
  unint64_t result = qword_18C710278;
  if (!qword_18C710278)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D688C, &type metadata for CancelPairingCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710278);
  }

  return result;
}

uint64_t CancelPairingCommand.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0Tm(a1);
}

uint64_t sub_1884BEFE0(uint64_t a1)
{
  return CancelPairingCommand.init(from:)(a1);
}

uint64_t sub_1884BEFF4(void *a1)
{
  return CancelPairingCommand.encode(to:)(a1);
}

uint64_t sub_1884BF008(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7974706D65LL && a2 == 0xE500000000000000LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else
  {
    BOOL v6 = a1 == 2003789939 && a2 == 0xE400000000000000LL;
    if (v6 || (sub_1884CA820() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1LL;
    }

    else
    {
      BOOL v7 = a1 == 0x73736563637573LL && a2 == 0xE700000000000000LL;
      if (v7 || (sub_1884CA820() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2LL;
      }

      else if (a1 == 0x6572756C696166LL && a2 == 0xE700000000000000LL)
      {
        swift_bridgeObjectRelease();
        return 3LL;
      }

      else
      {
        char v9 = sub_1884CA820();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0) {
          return 3LL;
        }
        else {
          return 4LL;
        }
      }
    }
  }

uint64_t sub_1884BF1A4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1884BF1D4 + 4 * byte_1884D5F20[a1]))( 0x7974706D65LL,  0xE500000000000000LL);
}

uint64_t sub_1884BF1D4()
{
  return 2003789939LL;
}

uint64_t sub_1884BF1E4()
{
  return 0x73736563637573LL;
}

uint64_t sub_1884BF1FC()
{
  return 0x6572756C696166LL;
}

uint64_t sub_1884BF214(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x726F727265LL && a2 == 0xE500000000000000LL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }

  else
  {
    char v3 = sub_1884CA820();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }

  return v4 & 1;
}

uint64_t sub_1884BF290()
{
  return 0x726F727265LL;
}

uint64_t sub_1884BF2A4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7235952 && a2 == 0xE300000000000000LL;
  if (v2 || (sub_1884CA820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x44676E69646E6573LL && a2 == 0xED00006563697665LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v7 = sub_1884CA820();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1884BF3A4(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x44676E69646E6573LL;
  }
  else {
    return 7235952LL;
  }
}

uint64_t sub_1884BF3E0()
{
  return sub_1884BF1A4(*v0);
}

uint64_t sub_1884BF3E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884BF008(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884BF40C()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884BF434()
{
  return sub_1884CAA00();
}

uint64_t sub_1884BF45C()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884BF484()
{
  return sub_1884CAA00();
}

uint64_t sub_1884BF4B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884BF214(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1884BF4D8()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884BF500()
{
  return sub_1884CAA00();
}

void sub_1884BF528()
{
}

uint64_t sub_1884BF55C()
{
  return sub_1884BF3A4(*v0);
}

uint64_t sub_1884BF564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884BF2A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1884BF588()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884BF5B0()
{
  return sub_1884CAA00();
}

uint64_t sub_1884BF5D8()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884BF600()
{
  return sub_1884CAA00();
}

void CodableDeviceInitiatedPairingBeaconingSessionEvent.encode(to:)()
{
  uint64_t v16 = v0;
  BOOL v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C710280);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v3);
  OUTLINED_FUNCTION_15_14(v4, v15);
  sub_1884C992C();
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v5);
  OUTLINED_FUNCTION_28_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C710288);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_28_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C710290);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v7);
  OUTLINED_FUNCTION_28_0();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C710298);
  MEMORY[0x1895F8858](v8);
  OUTLINED_FUNCTION_34();
  type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v9);
  OUTLINED_FUNCTION_34();
  uint64_t v12 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7102A0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v13);
  OUTLINED_FUNCTION_15_0();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1884BFA1C();
  sub_1884CA9E8();
  sub_1884BFA58(v16, v12);
  uint64_t v14 = (char *)sub_1884BF7F4 + 4 * byte_1884D5F24[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }

void sub_1884BF7F4()
{
  uint64_t v1 = *(void *)(v0 - 184);
  uint64_t v2 = *(void *)(v0 - 104);
  OUTLINED_FUNCTION_10_13();
  *(_BYTE *)(v0 - 68) = 0;
  uint64_t v3 = *(void *)(v0 - 168);
  uint64_t v4 = *(void *)(v0 - 96);
  sub_1884CA754();
  swift_bridgeObjectRelease();
  if (!v4)
  {
    *(_BYTE *)(v0 - 69) = 1;
    sub_1884CA718();
  }

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v0 - 176) + 8LL))(v1, v3);
  uint64_t v5 = OUTLINED_FUNCTION_17_13();
  v6(v5, v2);
  OUTLINED_FUNCTION_0_2();
}

uint64_t type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent()
{
  uint64_t result = qword_18C710378;
  if (!qword_18C710378) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1884BFA1C()
{
  unint64_t result = qword_18C7102A8;
  if (!qword_18C7102A8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D683C,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7102A8);
  }

  return result;
}

uint64_t sub_1884BFA58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_1884BFA9C()
{
  unint64_t result = qword_18C7102B0;
  if (!qword_18C7102B0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D67EC,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7102B0);
  }

  return result;
}

unint64_t sub_1884BFAD8()
{
  unint64_t result = qword_18C7102C0;
  if (!qword_18C7102C0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D679C,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7102C0);
  }

  return result;
}

unint64_t sub_1884BFB14()
{
  unint64_t result = qword_18C7102C8;
  if (!qword_18C7102C8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D674C,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7102C8);
  }

  return result;
}

unint64_t sub_1884BFB50()
{
  unint64_t result = qword_18C7102D0;
  if (!qword_18C7102D0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D66FC,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.EmptyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7102D0);
  }

  return result;
}

void CodableDeviceInitiatedPairingBeaconingSessionEvent.init(from:)()
{
  uint64_t v53 = v0;
  uint64_t v3 = v2;
  uint64_t v46 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7102D8);
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v45 = v5;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v6);
  OUTLINED_FUNCTION_28_0();
  uint64_t v48 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7102E0);
  v42[7] = *(void *)(v8 - 8);
  v42[8] = v8;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v9);
  OUTLINED_FUNCTION_15_14(v10, v42[0]);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7102E8);
  uint64_t v49 = *(void *)(v43 - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v11);
  OUTLINED_FUNCTION_28_0();
  uint64_t v51 = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7102F0);
  v42[5] = *(void *)(v13 - 8);
  v42[6] = v13;
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v14);
  OUTLINED_FUNCTION_28_0();
  uint64_t v47 = v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7102F8);
  uint64_t v50 = *(void *)(v16 - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1895F8858](v17);
  OUTLINED_FUNCTION_101();
  uint64_t v18 = type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  OUTLINED_FUNCTION_4_1();
  uint64_t v20 = MEMORY[0x1895F8858](v19);
  uint64_t v22 = (char *)v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = MEMORY[0x1895F8858](v20);
  uint64_t v25 = (char *)v42 - v24;
  MEMORY[0x1895F8858](v23);
  uint64_t v27 = (char *)v42 - v26;
  uint64_t v28 = v3[3];
  uint64_t v52 = v3;
  __swift_project_boxed_opaque_existential_0Tm(v3, v28);
  sub_1884BFA1C();
  uint64_t v29 = v53;
  sub_1884CA9D0();
  if (!v29)
  {
    v42[2] = (uint64_t)v25;
    v42[3] = (uint64_t)v22;
    v42[4] = (uint64_t)v27;
    uint64_t v30 = v1;
    uint64_t v31 = sub_1884CA6F4();
    uint64_t v32 = *(void *)(v31 + 16);
    if (v32)
    {
      uint64_t v53 = v1;
      v42[1] = 0LL;
      uint64_t v33 = *(unsigned __int8 *)(v31 + 32);
      sub_18842949C(1LL, v32, v31, v31 + 32, 0LL, (2 * v32) | 1);
      uint64_t v35 = v34;
      unint64_t v37 = v36;
      swift_bridgeObjectRelease();
      uint64_t v38 = v18;
      if (v35 == v37 >> 1) {
        __asm { BR              X9 }
      }

      uint64_t v30 = v53;
    }

    else
    {
      uint64_t v38 = v18;
    }

    uint64_t v39 = sub_1884CA514();
    swift_allocError();
    int v41 = v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C70E040);
    uint64_t *v41 = v38;
    sub_1884CA640();
    sub_1884CA508();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v39 - 8) + 104LL))( v41,  *MEMORY[0x189619358],  v39);
    swift_willThrow();
    OUTLINED_FUNCTION_12_8();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v30, v16);
  }

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v52);
  OUTLINED_FUNCTION_0_2();
}

void sub_1884BFF04()
{
  if (v0)
  {
    OUTLINED_FUNCTION_12_8();
    JUMPOUT(0x1884BFEE8LL);
  }

  *(_BYTE *)(v2 - 68) = 0;
  uint64_t v3 = sub_1884CA688();
  uint64_t v5 = v4;
  *(_BYTE *)(v2 - 69) = 1;
  uint64_t v6 = sub_1884CA64C();
  *(void *)(v2 - 144) = v7;
  *(void *)(v2 - 136) = v6;
  uint64_t v8 = *(void *)(v2 - 120);
  OUTLINED_FUNCTION_3_22(*(void *)(v2 - 128));
  OUTLINED_FUNCTION_12_8();
  (*(void (**)(void, uint64_t))(v8 + 8))(*(void *)(v2 - 96), v1);
  uint64_t v9 = *(uint64_t **)(v2 - 240);
  *uint64_t v9 = v3;
  v9[1] = v5;
  uint64_t v10 = *(void *)(v2 - 144);
  id v9[2] = *(void *)(v2 - 136);
  v9[3] = v10;
  swift_storeEnumTagMultiPayload();
  sub_1884C01F8((uint64_t)v9, *(void *)(v2 - 224));
  JUMPOUT(0x1884C0178LL);
}

void sub_1884BFF44()
{
  uint64_t v2 = *(void *)(v1 - 144);
  OUTLINED_FUNCTION_5_19();
  if (!v0)
  {
    (*(void (**)(uint64_t, void))(*(void *)(v1 - 200) + 8LL))(v2, *(void *)(v1 - 192));
    OUTLINED_FUNCTION_12_8();
    OUTLINED_FUNCTION_3_22(*(void *)(v1 - 120));
    JUMPOUT(0x1884BFF98LL);
  }

  JUMPOUT(0x1884BFED4LL);
}

void sub_1884BFFA0()
{
  uint64_t v1 = *(void *)(v0 - 136);
  uint64_t v2 = *(void *)(v0 - 96);
  uint64_t v3 = *(void *)(v0 - 248);
  sub_1884CA634();
  if (!v3)
  {
    sub_1884C992C();
    sub_1884C01B8(&qword_18C710300, MEMORY[0x189610DB8]);
    sub_1884CA6B8();
    OUTLINED_FUNCTION_145_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v0 - 176) + 8LL));
    OUTLINED_FUNCTION_12_8();
    OUTLINED_FUNCTION_29_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v0 - 120) + 8LL));
    swift_storeEnumTagMultiPayload();
    JUMPOUT(0x1884C016CLL);
  }

  OUTLINED_FUNCTION_12_8();
  JUMPOUT(0x1884BFEE8LL);
}

void sub_1884C0190()
{
}

void sub_1884C01A4()
{
}

uint64_t sub_1884C01B8(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = sub_1884C992C();
    uint64_t result = MEMORY[0x1895C7AEC](a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1884C01F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1884C023C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1884C0264(a1, a2, a3, (uint64_t (*)(void))sub_1884296C0, (uint64_t (*)(void))sub_1884296FC);
}

uint64_t sub_1884C0250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1884C0264(a1, a2, a3, (uint64_t (*)(void))sub_188429648, (uint64_t (*)(void))sub_188429684);
}

uint64_t sub_1884C0264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

id sub_1884C0298(id result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 0x3Fu) {
    return result;
  }
  return result;
}

void destroy for PairingOutcome(uint64_t a1)
{
}

uint64_t _s19RemotePairingDevice14PairingOutcomeOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 16);
  sub_1884C0298(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PairingOutcome(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 16);
  sub_1884C0298(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1884313AC(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for PairingOutcome(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1884313AC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PairingOutcome(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >> 1 >= 0xFFF && *(_BYTE *)(a1 + 17))
    {
      unsigned int v2 = *(_DWORD *)a1 + 8189;
    }

    else
    {
      unsigned int v2 = ((*(unsigned __int8 *)(a1 + 16) >> 6) | (4
                                                  * ((*(void *)a1 >> 58) & 0x3C | (*(void *)a1 >> 1) & 3 | (((*(unsigned __int8 *)(a1 + 16) >> 1) & 0x1F) << 6)))) ^ 0x1FFF;
      if (v2 >= 0x1FFD) {
        unsigned int v2 = -1;
      }
    }
  }

  else
  {
    unsigned int v2 = -1;
  }

  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for PairingOutcome(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >> 1 > 0xFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 8190;
    *(void *)(result + 8) = 0LL;
    if (a3 >> 1 >= 0xFFF) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >> 1 >= 0xFFF) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x7FF | ((-a2 & 0x1FFF) << 11);
      *(void *)uint64_t result = ((v3 << 58) | (2 * v3)) & 0xF000000000000007LL;
      *(void *)(result + 8) = 0LL;
      *(_BYTE *)(result + 16) = (v3 >> 5) & 0xFE;
    }
  }

  return result;
}

uint64_t sub_1884C047C(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 16);
  int v2 = (char)v1;
  unsigned int v3 = v1 >> 6;
  if (v2 >= 0) {
    return v3;
  }
  else {
    return ((*(void *)a1 >> 2) & 0xFFFFFFFE | *(void *)a1 & 1) + 2;
  }
}

uint64_t sub_1884C04A4(uint64_t result)
{
  *(_BYTE *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_1884C04B4(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    char v2 = *(_BYTE *)(result + 16) & 1 | ((_BYTE)a2 << 6);
    *(void *)result &= 0xFFFFFFFFFFFFFF9uLL;
    *(_BYTE *)(result + 16) = v2;
  }

  else
  {
    *(void *)uint64_t result = (a2 - 2) & 1LL | (8LL * ((a2 - 2) >> 1));
    *(void *)(result + 8) = 0LL;
    *(_BYTE *)(result + 16) = 0x80;
  }

  return result;
}

void type metadata accessor for PairingOutcome()
{
}

void type metadata accessor for AttemptPairingPinCommand()
{
}

uint64_t getEnumTagSinglePayload for PairingChallengeEvent(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[17])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }

    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
        int v2 = -1;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PairingChallengeEvent( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2) {
      *(_BYTE *)uint64_t result = a2 + 1;
    }
  }

  return result;
}

void type metadata accessor for PairingChallengeEvent()
{
}

void type metadata accessor for CancelPairingCommand()
{
}

id sub_1884C05BC(id result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 1) {
    return result;
  }
  if (!a5)
  {
    swift_bridgeObjectRetain();
    return (id)swift_bridgeObjectRetain();
  }

  return result;
}

void destroy for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1)
{
}

void sub_1884C0610(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 1)
  {
  }

  else if (!a5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

uint64_t initializeWithCopy for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(_BYTE *)(a2 + 32);
  sub_1884C05BC(*(id *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(_BYTE *)(a2 + 32);
  sub_1884C05BC(*(id *)a2, v4, v5, v6, v7);
  unsigned __int8 v8 = *(void **)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_1884C0610(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 32);
  uint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  __int128 v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_1884C0610(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 33))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }

    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceInitiatedPairingBeaconingSessionEvent( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(_BYTE *)(result + 32) = 0;
    *(void *)uint64_t result = a2 - 254;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 33) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 33) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 32) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_1884C07F0(uint64_t a1)
{
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_1884C0808(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0LL;
    LOBYTE(a2) = 2;
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
  }

  *(_BYTE *)(result + 32) = a2;
  return result;
}

void type metadata accessor for DeviceInitiatedPairingBeaconingSessionEvent()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for CodableDeviceInitiatedPairingBeaconingSessionEvent( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain();
  }

  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v12 = sub_1884C992C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16LL))(a1, a2, v12);
    }

    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(v5 + 64));
        return a1;
      }

      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      uint64_t v9 = a2[2];
      uint64_t v10 = a2[3];
      a1[2] = v9;
      a1[3] = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }

    swift_storeEnumTagMultiPayload();
  }

  return a1;
}

uint64_t destroy for CodableDeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
  {
    uint64_t v3 = sub_1884C992C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  }

  else if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }

  return result;
}

void *initializeWithCopy for CodableDeviceInitiatedPairingBeaconingSessionEvent( void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v10 = sub_1884C992C();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16LL))(a1, a2, v10);
  }

  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
      return a1;
    }

    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[2];
    uint64_t v9 = a2[3];
    a1[2] = v8;
    a1[3] = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }

  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for CodableDeviceInitiatedPairingBeaconingSessionEvent( void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1884C0B14((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_1884C992C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    }

    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
        return a1;
      }

      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }

    swift_storeEnumTagMultiPayload();
  }

  return a1;
}

uint64_t sub_1884C0B14(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void *initializeWithTake for CodableDeviceInitiatedPairingBeaconingSessionEvent( void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1884C992C();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }

  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  return a1;
}

void *assignWithTake for CodableDeviceInitiatedPairingBeaconingSessionEvent( void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1884C0B14((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1884C992C();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }

    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    }
  }

  return a1;
}

uint64_t sub_1884C0C78()
{
  uint64_t result = sub_1884C992C();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0LL;
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1884C0D34 + 4 * byte_1884D5F31[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1884C0D68 + 4 * byte_1884D5F2C[v4]))();
}

uint64_t sub_1884C0D68(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884C0D70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1884C0D78LL);
  }
  return result;
}

uint64_t sub_1884C0D84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1884C0D8CLL);
  }
  *(_BYTE *)uint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1884C0D90(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884C0D98(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.EmptyCodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.EmptyCodingKeys;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.SuccessCodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.SuccessCodingKeys;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys;
}

ValueMetadata *type metadata accessor for CancelPairingCommand.CodingKeys()
{
  return &type metadata for CancelPairingCommand.CodingKeys;
}

uint64_t _s19RemotePairingDevice50CodableDeviceInitiatedPairingBeaconingSessionEventO14ShowCodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1884C0E58 + 4 * byte_1884D5F3B[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1884C0E8C + 4 * byte_1884D5F36[v4]))();
}

uint64_t sub_1884C0E8C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884C0E94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1884C0E9CLL);
  }
  return result;
}

uint64_t sub_1884C0EA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1884C0EB0LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1884C0EB4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1884C0EBC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PairingChallengeEvent.CodingKeys()
{
  return &type metadata for PairingChallengeEvent.CodingKeys;
}

uint64_t _s19RemotePairingDevice50CodableDeviceInitiatedPairingBeaconingSessionEventO17FailureCodingKeysOwst_0( uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1884C0F18 + 4 * byte_1884D5F40[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1884C0F38 + 4 * byte_1884D5F45[v4]))();
  }
}

_BYTE *sub_1884C0F18(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_1884C0F38(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1884C0F40(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_1884C0F48(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_1884C0F50(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1884C0F58(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AttemptPairingPinCommand.CodingKeys()
{
  return &type metadata for AttemptPairingPinCommand.CodingKeys;
}

unint64_t sub_1884C0F78()
{
  unint64_t result = qword_18C7103B0;
  if (!qword_18C7103B0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D6304, &type metadata for AttemptPairingPinCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7103B0);
  }

  return result;
}

unint64_t sub_1884C0FB8()
{
  unint64_t result = qword_18C7103B8;
  if (!qword_18C7103B8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D63BC, &type metadata for PairingChallengeEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7103B8);
  }

  return result;
}

unint64_t sub_1884C0FF8()
{
  unint64_t result = qword_18C7103C0;
  if (!qword_18C7103C0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D64C4,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7103C0);
  }

  return result;
}

unint64_t sub_1884C1038()
{
  unint64_t result = qword_18C7103C8;
  if (!qword_18C7103C8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D65CC,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7103C8);
  }

  return result;
}

unint64_t sub_1884C1078()
{
  unint64_t result = qword_18C7103D0;
  if (!qword_18C7103D0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D66D4,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7103D0);
  }

  return result;
}

unint64_t sub_1884C10B8()
{
  unint64_t result = qword_18C7103D8;
  if (!qword_18C7103D8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D65F4,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.EmptyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7103D8);
  }

  return result;
}

unint64_t sub_1884C10F8()
{
  unint64_t result = qword_18C7103E0;
  if (!qword_18C7103E0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D661C,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.EmptyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7103E0);
  }

  return result;
}

unint64_t sub_1884C1138()
{
  unint64_t result = qword_18C7103E8;
  if (!qword_18C7103E8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D653C,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7103E8);
  }

  return result;
}

unint64_t sub_1884C1178()
{
  unint64_t result = qword_18C7103F0;
  if (!qword_18C7103F0)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D6564,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7103F0);
  }

  return result;
}

unint64_t sub_1884C11B8()
{
  unint64_t result = qword_18C7103F8;
  if (!qword_18C7103F8)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D64EC,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7103F8);
  }

  return result;
}

unint64_t sub_1884C11F8()
{
  unint64_t result = qword_18C710400;
  if (!qword_18C710400)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D6514,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710400);
  }

  return result;
}

unint64_t sub_1884C1238()
{
  unint64_t result = qword_18C710408;
  if (!qword_18C710408)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D6434,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710408);
  }

  return result;
}

unint64_t sub_1884C1278()
{
  unint64_t result = qword_18C710410;
  if (!qword_18C710410)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D645C,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710410);
  }

  return result;
}

unint64_t sub_1884C12B8()
{
  unint64_t result = qword_18C710418;
  if (!qword_18C710418)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D6644,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710418);
  }

  return result;
}

unint64_t sub_1884C12F8()
{
  unint64_t result = qword_18C710420;
  if (!qword_18C710420)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &unk_1884D666C,  &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710420);
  }

  return result;
}

unint64_t sub_1884C1338()
{
  unint64_t result = qword_18C710428;
  if (!qword_18C710428)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D63E4, &type metadata for CancelPairingCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710428);
  }

  return result;
}

unint64_t sub_1884C1378()
{
  unint64_t result = qword_18C710430;
  if (!qword_18C710430)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D640C, &type metadata for CancelPairingCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710430);
  }

  return result;
}

unint64_t sub_1884C13B8()
{
  unint64_t result = qword_18C710438;
  if (!qword_18C710438)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D632C, &type metadata for PairingChallengeEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710438);
  }

  return result;
}

unint64_t sub_1884C13F8()
{
  unint64_t result = qword_18C710440;
  if (!qword_18C710440)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D6354, &type metadata for PairingChallengeEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710440);
  }

  return result;
}

unint64_t sub_1884C1438()
{
  unint64_t result = qword_18C710448;
  if (!qword_18C710448)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D6274, &type metadata for AttemptPairingPinCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710448);
  }

  return result;
}

unint64_t sub_1884C1478()
{
  unint64_t result = qword_18C710450;
  if (!qword_18C710450)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D629C, &type metadata for AttemptPairingPinCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710450);
  }

  return result;
}

uint64_t OUTLINED_FUNCTION_3_22@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_5_19()
{
  return sub_1884CA634();
}

uint64_t OUTLINED_FUNCTION_10_13()
{
  return sub_1884CA70C();
}

void OUTLINED_FUNCTION_15_14(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t OUTLINED_FUNCTION_17_13()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_21_10()
{
  *(_BYTE *)(v0 - 66) = 2;
  return sub_1884BFAD8();
}

unint64_t OUTLINED_FUNCTION_23_12()
{
  *(_BYTE *)(v0 - 65) = 3;
  return sub_1884BFA9C();
}

unint64_t OUTLINED_FUNCTION_24_10()
{
  *(_BYTE *)(v0 - 67) = 1;
  return sub_1884BFB14();
}

uint64_t JSONDataBasedControlChannelTransport.startReceivingMessages(usingEventHandler:)()
{
  uint64_t v4 = OUTLINED_FUNCTION_19_0();
  swift_unknownObjectWeakInit();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_19_0();
  v5[2] = v1;
  v5[3] = v0;
  v5[4] = v4;
  v5[5] = v3;
  v5[6] = v2;
  swift_retain();
  swift_retain();
  sub_1884C1D6C();
  swift_release();
  return OUTLINED_FUNCTION_10_0();
}

uint64_t sub_1884C15CC()
{
  return swift_deallocObject();
}

void sub_1884C15F0(const void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void JSONDataBasedControlChannelTransport.send(message:invokingCompletionHandlerOn:completion:)( const void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_1884C9584();
  unint64_t v14 = v13;
  swift_release();
  sub_18841E590(v12, v14);
  if (OUTLINED_FUNCTION_5_20() >= 0x10000)
  {
    unint64_t v28 = 0LL;
    unint64_t v29 = 0xE000000000000000LL;
    sub_1884CA4D8();
    swift_bridgeObjectRelease();
    unint64_t v28 = 0xD000000000000026LL;
    unint64_t v29 = 0x80000001884E09A0LL;
    uint64_t v15 = OUTLINED_FUNCTION_5_20();
    OUTLINED_FUNCTION_294();
    uint64_t v27 = v15;
    sub_1884CA7D8();
    sub_1884CA0E8();
    swift_bridgeObjectRelease();
    sub_1884CA0E8();
    uint64_t v30 = MEMORY[0x189617FA8];
    char v31 = 1;
    sub_18842FF14();
    swift_allocError();
    uint64_t v17 = v16;
    LOBYTE(v27) = 3;
    Swift::String v18 = ControlChannelConnectionError.Message.format(code:)((RemotePairingDevice::ControlChannelConnectionError::Code)&v27);
    sub_18844D660((uint64_t)&v28);
    *(_BYTE *)uint64_t v17 = 3;
    *(Swift::String *)(v17 + 8) = v18;
    *(_OWORD *)(v17 + 24) = 0u;
    *(_OWORD *)(v17 + 4sub_188455A4C(v0, v1, 0) = 0u;
    *(void *)(v17 + 56) = 0LL;
    OUTLINED_FUNCTION_14_12();
    OUTLINED_FUNCTION_294();
    OUTLINED_FUNCTION_52_0();
    return;
  }

  if (qword_18C4DD958 != -1) {
    swift_once();
  }
  unint64_t v28 = qword_18C4E6C98;
  unint64_t v29 = qword_18C4E6CA0;
  sub_18841E590(qword_18C4E6C98, qword_18C4E6CA0);
  unint64_t v19 = OUTLINED_FUNCTION_5_20();
  if ((v19 & 0x8000000000000000LL) == 0 && v19 < 0x10000)
  {
    sub_18849EC2C(bswap32(v19) >> 16);
    uint64_t v20 = sub_1884C9758();
    if (qword_18C4DD950 != -1) {
      swift_once();
    }
    uint64_t v26 = a5;
    if (v20 == qword_18C4E6C90)
    {
      sub_1884C9764();
      OUTLINED_FUNCTION_294();
      uint64_t v21 = v28;
      unint64_t v22 = v29;
      uint64_t v23 = (void *)OUTLINED_FUNCTION_19_0();
      v23[2] = a2;
      v23[3] = a3;
      v23[4] = a4;
      uint64_t v24 = *(void (**)(uint64_t, unint64_t, uint64_t (*)(void *), void *, uint64_t, uint64_t))(a6 + 24);
      sub_18841E590(v21, v22);
      id v25 = a2;
      swift_retain();
      v24(v21, v22, sub_1884C27F8, v23, v26, a6);
      OUTLINED_FUNCTION_294();
      swift_release();
      OUTLINED_FUNCTION_15_15();
      OUTLINED_FUNCTION_15_15();
      return;
    }

    __break(1u);
  }

  OUTLINED_FUNCTION_3_7();
  sub_1884CA5D4();
  __break(1u);
}

void sub_1884C19A4(const void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_1884C19C8()
{
  qword_18C4DD900 = sub_1884CA400();
  OUTLINED_FUNCTION_1_0();
}

void sub_1884C1A28()
{
  if (qword_18C4DD958 != -1) {
    swift_once();
  }
  __asm { BR              X13 }

uint64_t sub_1884C1AE0()
{
  uint64_t v0 = sub_1884CA094();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1884CA088();
  uint64_t v4 = sub_1884CA070();
  unint64_t v6 = v5;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15)
  {
    __break(1u);
  }

  else
  {
    qword_18C4E6C98 = v4;
    unk_18C4E6CA0 = v6;
  }

  return result;
}

uint64_t sub_1884C1BA4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)swift_allocObject();
  void v7[2] = a3;
  v7[3] = a4;
  v7[4] = a1;
  aBlock[4] = sub_188467F1C;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1884530E8;
  aBlock[3] = &block_descriptor_13;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = sub_1884C9F14();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v9);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_retain();
  id v13 = a1;
  sub_1884C9EFC();
  uint64_t v14 = sub_1884C9EE4();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1895F8858](v14);
  uint64_t v17 = (char *)v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v19[1] = MEMORY[0x18961AFE8];
  sub_18842E460();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C4DDAB0);
  sub_18842984C();
  sub_1884CA484();
  MEMORY[0x1895C6AC0](0LL, v12, v17, v8);
  _Block_release(v8);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

uint64_t sub_1884C1D6C()
{
  if (qword_18C4DD950 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_18C4E6C90;
  unint64_t v6 = (void *)OUTLINED_FUNCTION_19_0();
  v6[2] = v2;
  v6[3] = v0;
  v6[4] = v4;
  v6[5] = v3;
  v6[6] = v1;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, void (*)(void *, unint64_t, char), void *, uint64_t, uint64_t))(v0 + 16);
  swift_retain();
  swift_unknownObjectRetain();
  v7(v5, v5, sub_1884C2904, v6, v2, v0);
  return OUTLINED_FUNCTION_10_0();
}

void sub_1884C1E18(id a1, unint64_t a2, char a3, void (*a4)(_BYTE *))
{
  if ((a3 & 1) != 0)
  {
    id v10 = a1;
    swift_willThrow();
    id v11 = a1;
  }

  else
  {
    sub_18841E590((uint64_t)a1, a2);
    if (qword_18C4DD958 != -1) {
      swift_once();
    }
    uint64_t v7 = qword_18C4E6C98;
    unint64_t v8 = qword_18C4E6CA0;
    sub_18841E590(qword_18C4E6C98, qword_18C4E6CA0);
    char v9 = sub_1884A225C();
    sub_18842A58C(v7, v8);
    if ((v9 & 1) != 0)
    {
      sub_1884C9758();
      __asm { BR              X11 }
    }

    v17[3] = MEMORY[0x189617FA8];
    v17[0] = 0xD00000000000001ALL;
    v17[1] = 0x80000001884DF2B0LL;
    char v18 = 1;
    sub_18842FF14();
    id v11 = (id)swift_allocError();
    uint64_t v13 = v12;
    v16[0] = 2;
    Swift::String v14 = ControlChannelConnectionError.Message.format(code:)((RemotePairingDevice::ControlChannelConnectionError::Code)v16);
    sub_18844D660((uint64_t)v17);
    *(_BYTE *)uint64_t v13 = 2;
    *(Swift::String *)(v13 + 8) = v14;
    *(_OWORD *)(v13 + 24) = 0u;
    *(_OWORD *)(v13 + 4sub_188455A4C(v0, v1, 0) = 0u;
    *(void *)(v13 + 56) = 0LL;
    swift_willThrow();
    sub_188455A4C(a1, a2, 0);
  }

  v17[0] = v11;
  sub_18847E630((uint64_t)v17);
  sub_18847E63C((uint64_t)v17, (uint64_t)v16);
  id v15 = v11;
  a4(v16);
}

void sub_1884C2254(void *a1, unint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
  {
    *(void *)uint64_t v80 = a1;
    uint64_t v5 = sub_18847E630((uint64_t)v80);
    OUTLINED_FUNCTION_4_22( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v39,  v42,  v43,  v44,  v45,  v46,  v47,  v48,  v49,  v50,  v51,  v52,  v53,  v54,  v55,  v56,  v57,  v58,  v59,  v60,  v61,  v62,  v63,  v64,  v65,  v66,  v67,  v68,  v69,  v70,  v71,  v72,  v73,  v74,  v75,  v76,  v77,  v78,  v79,  v80[0]);
    id v13 = a1;
    OUTLINED_FUNCTION_3_23( (uint64_t)v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  v40,  v42,  v43,  v44,  v45,  v46,  v47,  v48,  v49,  v50,  v51,  v52,  v53,  v54,  v55,  v56,  v57,  v58,  v59,  v60,  v61);
    sub_188455A4C(a1, a2, 1);
  }

  else
  {
    sub_1884C9578();
    OUTLINED_FUNCTION_21_5();
    sub_18841E590((uint64_t)a1, a2);
    sub_1884C956C();
    sub_18847D900();
    sub_1884C9560();
    OUTLINED_FUNCTION_169(&v42, v81);
    OUTLINED_FUNCTION_169(v80, v81);
    uint64_t v21 = sub_1884C2814((uint64_t)v80);
    OUTLINED_FUNCTION_4_22( v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  v39,  v42,  v43,  v44,  v45,  v46,  v47,  v48,  v49,  v50,  v51,  v52,  v53,  v54,  v55,  v56,  v57,  v58,  v59,  v60,  v61,  v62,  v63,  v64,  v65,  v66,  v67,  v68,  v69,  v70,  v71,  v72,  v73,  v74,  v75,  v76,  v77,  v78,  v79,  v80[0]);
    uint64_t v29 = sub_1884C281C( (uint64_t)&v42,  (uint64_t (*)(void))sub_18841E590,  (uint64_t (*)(void))sub_1884511B0,  (uint64_t (*)(void))sub_188451284,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450C7C);
    OUTLINED_FUNCTION_3_23( v29,  v30,  v31,  v32,  v33,  v34,  v35,  v36,  v41,  v42,  v43,  v44,  v45,  v46,  v47,  v48,  v49,  v50,  v51,  v52,  v53,  v54,  v55,  v56,  v57,  v58,  v59,  v60,  v61);
    swift_release();
    OUTLINED_FUNCTION_8_15();
    uint64_t v38 = OUTLINED_FUNCTION_2_21(v37);
    OUTLINED_FUNCTION_2_21(v38);
  }

uint64_t sub_1884C23DC( uint64_t a1, uint64_t a2, void (*a3)(void *), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = MEMORY[0x1895C7C84](a2 + 16);
  if (result)
  {
    uint64_t v12 = result;
    sub_18847E63C((uint64_t)v33, (uint64_t)v32);
    if (sub_18847E690((uint64_t)v32) == 1)
    {
      uint64_t v13 = *(void *)nullsub_1(v32);
      sub_18847E63C((uint64_t)v33, (uint64_t)v31);
      uint64_t v14 = *(void **)nullsub_1(v31);
      id v15 = v14;
      os_log_type_t v16 = sub_1884CA25C();
      if (qword_18C4DD908 != -1) {
        swift_once();
      }
      uint64_t v17 = (os_log_s *)qword_18C4DD900;
      if (os_log_type_enabled((os_log_t)qword_18C4DD900, v16))
      {
        sub_18847E748( (uint64_t)v33,  (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18847E7B4);
        swift_unknownObjectRetain();
        sub_18847E748( (uint64_t)v33,  (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18847E7B4);
        swift_unknownObjectRetain();
        uint64_t v18 = swift_slowAlloc();
        uint64_t v28 = swift_slowAlloc();
        __dst[0] = v28;
        *(_DWORD *)uint64_t v18 = 136446466;
        v29[0] = v12;
        uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)(a6 + 8) + 8LL))(a5);
        sub_18844EF4C(v19, v20, __dst);
        sub_1884CA430();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v18 + 12) = 2080;
        id v21 = v14;
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDDE0);
        uint64_t v22 = sub_1884CA0A0();
        sub_18844EF4C(v22, v23, __dst);
        v29[0] = v24;
        sub_1884CA430();
        swift_bridgeObjectRelease();
        sub_18847E748( (uint64_t)v33,  (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18847E698);
        sub_18847E748( (uint64_t)v33,  (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18847E698);
        _os_log_impl( &dword_18840C000,  v17,  v16,  "%{public}s: received error reading message: %s",  (uint8_t *)v18,  0x16u);
        swift_arrayDestroy();
        MEMORY[0x1895C7BD0](v28, -1LL, -1LL);
        MEMORY[0x1895C7BD0](v18, -1LL, -1LL);
      }

      __dst[0] = v13;
      sub_1884753D4((uint64_t)__dst);
      sub_1884517B0(__dst, v29);
      id v25 = v14;
      a3(v29);
      sub_18847E748( (uint64_t)v33,  (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18847E698);
      swift_unknownObjectRelease();
    }

    else
    {
      uint64_t v26 = (const void *)nullsub_1(v32);
      memcpy(__dst, v26, 0x92uLL);
      sub_18847E864((uint64_t)__dst);
      sub_1884517B0(__dst, v29);
      sub_18847E63C((uint64_t)v33, (uint64_t)v31);
      uint64_t v27 = nullsub_1(v31);
      sub_1884C281C( v27,  (uint64_t (*)(void))sub_18841E590,  (uint64_t (*)(void))sub_1884511B0,  (uint64_t (*)(void))sub_188451284,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_188450C7C);
      a3(v29);
      JSONDataBasedControlChannelTransport.startReceivingMessages(usingEventHandler:)(a3, a4, a5, a6);
      swift_unknownObjectRelease();
    }

    return sub_18847E748( (uint64_t)v33,  (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18847E698);
  }

  return result;
}

uint64_t sub_1884C2790()
{
  return swift_deallocObject();
}

uint64_t sub_1884C27BC(uint64_t a1)
{
  return sub_1884C23DC( a1,  *(void *)(v1 + 32),  *(void (**)(void *))(v1 + 40),  *(void *)(v1 + 48),  *(void *)(v1 + 16),  *(void *)(v1 + 24));
}

uint64_t sub_1884C27CC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1884C27F8(void *a1)
{
  return sub_1884C1BA4(a1, v1[2], v1[3], v1[4]);
}

uint64_t dispatch thunk of JSONDataBasedControlChannelTransport.receive(minLength:maxLength:completion:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of JSONDataBasedControlChannelTransport.send(content:completion:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t sub_1884C2814(uint64_t result)
{
  *(_BYTE *)(result + 146) = 0;
  return result;
}

uint64_t sub_1884C281C( uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(void), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  return a1;
}

uint64_t sub_1884C2894()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_188455A4C(v0, v1, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_13()
{
  return swift_release();
}

uint64_t sub_1884C28D8()
{
  return swift_deallocObject();
}

void sub_1884C2904(void *a1, unint64_t a2, char a3)
{
}

uint64_t sub_1884C2918()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_2_21(uint64_t a1, ...)
{
  return sub_1884C281C((uint64_t)va, v1, v2, v3, v4);
}

uint64_t OUTLINED_FUNCTION_3_23( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
  return v29(&a29);
}

uint64_t OUTLINED_FUNCTION_4_22( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, char a48)
{
  return sub_18847E63C((uint64_t)&a48, (uint64_t)&a29);
}

uint64_t OUTLINED_FUNCTION_5_20()
{
  return sub_1884C9758();
}

void OUTLINED_FUNCTION_8_15()
{
}

uint64_t OUTLINED_FUNCTION_14_12()
{
  return v1(v0);
}

uint64_t OUTLINED_FUNCTION_15_15()
{
  return sub_18842A58C(v0, v1);
}

uint64_t sub_1884C29A0(uint64_t a1)
{
  else {
    return 2LL;
  }
}

uint64_t sub_1884C29F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1884C2A5C(a1, MEMORY[0x189618740], a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1884C2A00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  else {
    return 0LL;
  }
}

uint64_t sub_1884C2A50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1884C2A5C(a1, MEMORY[0x189618560], a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1884C2A5C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = OUTLINED_FUNCTION_53();
  uint64_t v9 = v12;
  if (!v8) {
    return 0LL;
  }
  return v9;
}

double sub_1884C2AB8@<D0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _OWORD *a9@<X8>)
{
  if ((OUTLINED_FUNCTION_53() & 1) == 0)
  {
    double result = 0.0;
    *a9 = xmmword_1884CEDF0;
  }

  return result;
}

uint64_t sub_1884C2B14(unsigned int a1, int a2)
{
  return a2 & a1;
}

uint64_t sub_1884C2B1C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_1884C2B28(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_1884C2B38(uint64_t result)
{
  *v1 &= result;
  return result;
}

BOOL sub_1884C2B48(char a1, unsigned __int8 a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1884C2B58(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1884C2B64(unsigned __int8 a1, char a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_1884C2B74(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

unint64_t sub_1884C2B80(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  if ((a2 & 0x1000000000000000LL) != 0)
  {
    unint64_t v8 = sub_1884767FC(a1, a2, 10LL);
    char v10 = v22;
    goto LABEL_39;
  }

  if ((a2 & 0x2000000000000000LL) == 0)
  {
    if ((a1 & 0x1000000000000000LL) != 0) {
      uint64_t v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v7 = (unsigned __int8 *)sub_1884CA520();
    }
    unint64_t v8 = (unint64_t)sub_1884765FC(v7, v5);
    char v10 = v9 & 1;
    goto LABEL_39;
  }

  v23[0] = a1;
  v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (a1 == 43)
  {
    if (!v4) {
      goto LABEL_52;
    }
    unint64_t v8 = (BYTE1(a1) - 48);
    uint64_t v15 = v4 - 2;
    if (v15)
    {
      os_log_type_t v16 = (unsigned __int8 *)v23 + 2;
      while (1)
      {
        unsigned int v17 = *v16 - 48;
        if (v17 > 9) {
          goto LABEL_36;
        }
        if (!is_mul_ok(v8, 0xAuLL)) {
          goto LABEL_36;
        }
        BOOL v14 = __CFADD__(10 * v8, v17);
        unint64_t v8 = 10 * v8 + v17;
        if (v14) {
          goto LABEL_36;
        }
        char v10 = 0;
        ++v16;
        if (!--v15) {
          goto LABEL_39;
        }
      }
    }

void sub_1884C2DDC(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  char v9 = (int *)OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v10);
  OUTLINED_FUNCTION_34();
  uint64_t v169 = v12 - v11;
  int v168 = *a2;
  uint64_t v170 = sub_1884C9BA8();
  uint64_t v13 = *(void *)(v170 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1895F8858](v170);
  uint64_t v171 = (char *)v145 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_1884C9E90();
  os_log_type_t v16 = *(uint64_t (***)(uint64_t, uint64_t))(v15 - 8);
  MEMORY[0x1895F8858](v15);
  OUTLINED_FUNCTION_101();
  sub_1884C9EA8();
  int v17 = v16[11](v4, v15);
  if (!MEMORY[0x189608D68] || v17 != *MEMORY[0x189608D68])
  {
    OUTLINED_FUNCTION_64_4(v4, v16[1]);
    sub_1884CA25C();
    if (qword_18C70D760 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_34_11();

    OUTLINED_FUNCTION_11_14();
    uint64_t v25 = OUTLINED_FUNCTION_32_10();
    v26(v25);
    goto LABEL_8;
  }

  id v167 = a3;
  OUTLINED_FUNCTION_64_4(v4, v16[12]);
  uint64_t v18 = v171;
  uint64_t v19 = v4;
  uint64_t v20 = v170;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v171, v19, v170);
  OUTLINED_FUNCTION_17_0();
  uint64_t v166 = (void (*)(unint64_t, unint64_t, uint64_t))sub_1884C9BB4();
  unint64_t v22 = v21;
  uint64_t v160 = v145;
  MEMORY[0x1895F8858](v166);
  OUTLINED_FUNCTION_22_9();
  unint64_t v23 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v23(v18, v18, v20);
  if (v22)
  {
    OUTLINED_FUNCTION_10_14();
    uint64_t v24 = v20;
  }

  else
  {
    uint64_t v30 = sub_1884C9B9C();
    uint64_t v31 = OUTLINED_FUNCTION_17_0();
    sub_188433E94(v31, v32, v30);
    uint64_t v166 = v33;
    unint64_t v22 = v34;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_14();
    uint64_t v24 = v20;
    if (!v22)
    {
LABEL_28:
      sub_1884CA25C();
      id v74 = v167;
      if (qword_18C70D760 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_34_11();

      uint64_t v75 = OUTLINED_FUNCTION_11_14();
      OUTLINED_FUNCTION_3_24(v75);
      uint64_t v70 = v171;
      goto LABEL_31;
    }
  }

  OUTLINED_FUNCTION_26_10();
  uint64_t v35 = v171;
  uint64_t v36 = sub_1884C9BB4();
  uint64_t v38 = v37;
  v154 = v145;
  MEMORY[0x1895F8858](v36);
  v23((char *)v145 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL), v35, v24);
  uint64_t v153 = a4;
  if (v38)
  {
    uint64_t v165 = (uint64_t *)v36;
    OUTLINED_FUNCTION_7_15();
    goto LABEL_15;
  }

  uint64_t v39 = a1;
  uint64_t v40 = sub_1884C9B9C();
  uint64_t v41 = OUTLINED_FUNCTION_26_10();
  sub_188433E94(v41, v42, v40);
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_15();
  if (!v46)
  {
    OUTLINED_FUNCTION_11();
    goto LABEL_28;
  }

  uint64_t v165 = v44;
  a1 = v39;
LABEL_15:
  uint64_t v47 = OUTLINED_FUNCTION_31_0();
  uint64_t v48 = *(void *)(v47 - 8);
  MEMORY[0x1895F8858](v47);
  OUTLINED_FUNCTION_34();
  uint64_t v51 = v50 - v49;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C4DC6B0);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v52);
  OUTLINED_FUNCTION_34();
  uint64_t v55 = v54 - v53;
  sub_1884C97B8();
  if (__swift_getEnumTagSinglePayload(v55, 1LL, v47) == 1)
  {
    swift_bridgeObjectRelease();
    sub_188437B70(v55, (uint64_t *)&unk_18C4DC6B0);
    OUTLINED_FUNCTION_1_19();
    os_log_type_t v56 = sub_1884CA25C();
    if (qword_18C70D760 != -1) {
      swift_once();
    }
    uint64_t v57 = (os_log_s *)qword_18C710458;
    os_log_type_t v58 = v56;
    BOOL v59 = os_log_type_enabled((os_log_t)qword_18C710458, v56);
    a4 = v153;
    if (v59)
    {
      swift_bridgeObjectRetain();
      uint64_t v60 = (uint8_t *)OUTLINED_FUNCTION_4_7();
      *(void *)&v174[0] = OUTLINED_FUNCTION_4_7();
      *(_DWORD *)uint64_t v60 = 136446210;
      swift_bridgeObjectRetain();
      sub_18844EF4C((uint64_t)v166, v22, (uint64_t *)v174);
      v172[0] = v61;
      sub_1884CA430();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_18840C000, v57, v58, "Unable to turn identifier %{public}s into UUID object", v60, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_11();
    }

    OUTLINED_FUNCTION_11();

    OUTLINED_FUNCTION_11_14();
    uint64_t v68 = OUTLINED_FUNCTION_32_10();
    v69(v68);
    uint64_t v70 = v171;
LABEL_31:
    v162(v70);
LABEL_8:
    uint64_t v27 = a4;
    uint64_t v28 = 1LL;
    uint64_t v29 = (uint64_t)v9;
    goto LABEL_9;
  }

  uint64_t v152 = v145;
  OUTLINED_FUNCTION_11();
  uint64_t v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 32);
  v62(v51, v55, v47);
  uint64_t v63 = sub_1884C96A4();
  unint64_t v65 = v64;
  swift_bridgeObjectRelease();
  if (v65 >> 60 == 15)
  {
    sub_1884CA25C();
    id v66 = v167;
    if (qword_18C70D760 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_34_11();

    uint64_t v67 = OUTLINED_FUNCTION_11_14();
    OUTLINED_FUNCTION_3_24(v67);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v51, v47);
    OUTLINED_FUNCTION_7_15();
    OUTLINED_FUNCTION_1_19();
    a4 = v153;
    goto LABEL_8;
  }

  unint64_t v146 = v65;
  uint64_t v147 = v63;
  uint64_t v148 = v62;
  uint64_t v149 = v51;
  uint64_t v150 = v47;
  OUTLINED_FUNCTION_25_14();
  id v71 = v167;
  if (v72)
  {
    OUTLINED_FUNCTION_21_11();
    uint64_t v73 = OUTLINED_FUNCTION_19_13();
  }

  else
  {
    uint64_t v73 = 0LL;
  }

  uint64_t v76 = v169;
  *(void *)(v169 + v9[8]) = v73;
  OUTLINED_FUNCTION_25_14();
  if (v77)
  {
    OUTLINED_FUNCTION_21_11();
    uint64_t v78 = OUTLINED_FUNCTION_19_13();
  }

  else
  {
    uint64_t v78 = 0LL;
  }

  *(void *)(v76 + v9[9]) = v78;
  uint64_t v79 = OUTLINED_FUNCTION_25_14();
  if (v80)
  {
    unint64_t v81 = sub_1884C2B80(v79, v80);
    if ((v82 & 1) != 0) {
      unint64_t v83 = 0LL;
    }
    else {
      unint64_t v83 = v81;
    }
  }

  else
  {
    unint64_t v83 = 0LL;
  }

  *(void *)(v76 + v9[12]) = v83;
  uint64_t v84 = OUTLINED_FUNCTION_25_14();
  unint64_t v85 = (uint64_t *)(v76 + v9[11]);
  uint64_t *v85 = v84;
  v85[1] = v86;
  uint64_t v87 = sub_1884C9BB4();
  uint64_t v151 = v9;
  uint64_t v88 = (uint64_t *)(v76 + v9[10]);
  uint64_t *v88 = v87;
  v88[1] = v89;
  uint64_t v90 = sub_1884C9E6C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70EAE0);
  v145[1] = (uint64_t)v145;
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v91);
  OUTLINED_FUNCTION_101();
  uint64_t v92 = *(void *)(v90 + 16);
  v145[2] = v90;
  if (v92)
  {
    uint64_t v93 = OUTLINED_FUNCTION_24_11();
    uint64_t v94 = *(void *)(v93 - 8);
    unint64_t v157 = (*(unsigned __int8 *)(v94 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80);
    unint64_t v95 = v90 + v157;
    uint64_t v96 = MEMORY[0x18961AFE8];
    uint64_t v156 = *(void *)(v94 + 72);
    uint64_t v166 = *(void (**)(unint64_t, unint64_t, uint64_t))(v94 + 16);
    uint64_t v155 = MEMORY[0x18961AFE8];
    unint64_t v159 = v65;
    uint64_t v158 = v94;
    while (1)
    {
      v166(v65, v95, v93);
      __swift_storeEnumTagSinglePayload(v65, 0LL, 1LL, v93);
      uint64_t EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v65, 1LL, v93);
      if ((_DWORD)EnumTagSinglePayload == 1) {
        goto LABEL_76;
      }
      uint64_t v164 = v96;
      uint64_t v165 = v145;
      uint64_t v98 = *(void *)(v94 + 64);
      MEMORY[0x1895F8858](EnumTagSinglePayload);
      OUTLINED_FUNCTION_22_9();
      uint64_t v99 = *(void (**)(uint64_t, unint64_t, uint64_t))(v94 + 32);
      v99(a1, v65, v93);
      if (qword_18C70D5E8 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_4_6();
      int v161 = byte_18C70DD71;
      v163 = (void (*)(unint64_t, uint64_t, uint64_t))v99;
      if ((byte_18C70DD70 & 1) != 0)
      {
        uint64_t v100 = qword_18C70D660;
        swift_bridgeObjectRetain();
        uint64_t v101 = &qword_18C70DED0;
        if (v100 != -1)
        {
          swift_once();
          uint64_t v101 = &qword_18C70DED0;
        }
      }

      else
      {
        uint64_t v102 = qword_18C4DC828;
        swift_bridgeObjectRetain();
        uint64_t v101 = &qword_18C4DC818;
        if (v102 != -1)
        {
          swift_once();
          uint64_t v101 = &qword_18C4DC818;
        }
      }

      id v103 = (id)*v101;
      uint64_t v104 = (void *)sub_1884CA040();
      id v105 = objc_msgSend(v103, sel_valueForKey_, v104);

      if (v105)
      {
        sub_1884CA46C();
        swift_unknownObjectRelease();
      }

      else
      {
        memset(v174, 0, sizeof(v174));
      }

      sub_18841D670((uint64_t)v174, (uint64_t)v172);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C4DDE00);
      else {
        char v106 = 2;
      }
      sub_188437B70((uint64_t)v174, &qword_18C4DDE00);
      uint64_t v107 = swift_bridgeObjectRelease();
      if (v106 == 2)
      {
        if ((v161 & 1) != 0) {
          goto LABEL_67;
        }
      }

      else if ((v106 & 1) != 0)
      {
        goto LABEL_67;
      }

      uint64_t v108 = sub_1884C9B84();
      uint64_t v107 = InterfaceIndexCorrespondsToAppleNCMInterface(v108);
      if ((_DWORD)v107)
      {
        uint64_t v109 = MEMORY[0x1895F8858](v107);
        OUTLINED_FUNCTION_2_22(v109, v110, v111, v112, v113, v114, v115, v116, v145[0]);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v96 = v164;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          uint64_t v155 = sub_18844D900(0LL, *(void *)(v155 + 16) + 1LL, 1LL, v155);
        }
        unint64_t v119 = *(void *)(v155 + 16);
        unint64_t v118 = *(void *)(v155 + 24);
        if (v119 >= v118 >> 1) {
          uint64_t v155 = sub_18844D900(v118 > 1, v119 + 1, 1LL, v155);
        }
        uint64_t v120 = v155;
        *(void *)(v155 + 16) = v119 + 1;
        unint64_t v121 = v120 + v157;
        goto LABEL_72;
      }

BOOL DiscoveredBonjourAdvert.isValid.getter()
{
  return *(void *)(*(void *)(v0 + *(int *)(OUTLINED_FUNCTION_0_24() + 52)) + 16LL) != 0LL;
}

uint64_t type metadata accessor for DiscoveredBonjourAdvert()
{
  uint64_t result = qword_18C7104B8;
  if (!qword_18C7104B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1884C3B88()
{
  uint64_t result = sub_1884CA400();
  qword_18C710458 = result;
  return result;
}

uint64_t DiscoveredBonjourAdvert.endpoint.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_69();
  return OUTLINED_FUNCTION_68_0(v0, v1, v2, v3);
}

uint64_t DiscoveredBonjourAdvert.service.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = OUTLINED_FUNCTION_0_24();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t DiscoveredBonjourAdvert.identifier.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_69();
  return OUTLINED_FUNCTION_68_0(v0, v1, v2, v3);
}

void DiscoveredBonjourAdvert.authTag.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_69();
  sub_18841E590(v0, v1);
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1_0();
}

void DiscoveredBonjourAdvert.wireProtocolVersion.getter()
{
  id v1 = *(id *)(v0 + *(int *)(OUTLINED_FUNCTION_0_24() + 32));
  OUTLINED_FUNCTION_1_0();
}

void DiscoveredBonjourAdvert.minimumSupportedWireProtocolVersion.getter()
{
  id v1 = *(id *)(v0 + *(int *)(OUTLINED_FUNCTION_0_24() + 36));
  OUTLINED_FUNCTION_1_0();
}

void DiscoveredBonjourAdvert.userAssignedName.getter()
{
}

void DiscoveredBonjourAdvert.model.getter()
{
}

uint64_t DiscoveredBonjourAdvert.flags.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = OUTLINED_FUNCTION_0_24();
  *a1 = *(void *)(v1 + *(int *)(result + 48));
  return result;
}

uint64_t DiscoveredBonjourAdvert.validInterfaces.getter()
{
  return swift_bridgeObjectRetain();
}

id DiscoveredBonjourAdvert.netLinkManager.getter()
{
  return *(id *)(v0 + *(int *)(OUTLINED_FUNCTION_0_24() + 56));
}

uint64_t DiscoveredBonjourAdvert.prohibitedInterfaces.getter()
{
  return swift_bridgeObjectRetain();
}

void DiscoveredBonjourAdvert.prohibitedInterfaces.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(OUTLINED_FUNCTION_0_24() + 60);
  swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  OUTLINED_FUNCTION_40();
}

uint64_t (*DiscoveredBonjourAdvert.prohibitedInterfaces.modify())(void)
{
  return nullsub_1;
}

void DiscoveredBonjourAdvert.createTransport(withTargetQueue:)(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = (int *)OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_3_1();
  uint64_t v6 = MEMORY[0x1895F8858](v5);
  uint64_t v56 = (uint64_t)v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v6);
  char v9 = (char *)v51 - v8;
  sub_1884C9D4C();
  OUTLINED_FUNCTION_21_5();
  uint64_t v10 = sub_1884C9D40();
  int v11 = *(unsigned __int8 *)(v2 + v4[5]);
  if (*(_BYTE *)(v2 + v4[5])) {
    BOOL v12 = v11 == 4;
  }
  else {
    BOOL v12 = 1;
  }
  os_log_type_t v58 = (uint64_t *)a1;
  if (v12) {
    goto LABEL_6;
  }
  if (v11 != 1)
  {
    sub_1884BB6E8(v2, (uint64_t)v9);
    v63[0] = 0LL;
    v63[1] = 0xE000000000000000LL;
    sub_1884CA4D8();
    sub_1884CA0E8();
    LOBYTE(v62) = v9[v4[5]];
    sub_1884CA598();
    sub_1884CA5E0();
    __break(1u);
    return;
  }

  if ((*(_BYTE *)(v2 + v4[12]) & 1) != 0)
  {
LABEL_6:
    sub_1884C9D04();
    sub_1884C9D10();
    sub_1884C9D1C();
    sub_1884C9D28();
    id v53 = 0LL;
  }

  else
  {
    id v53 = *(id *)(v2 + v4[14]);
    id v28 = v53;
  }

  sub_1884C9D34();
  sub_1884C9CF8();
  swift_retain();
  uint64_t v57 = v10;
  uint64_t v13 = sub_1884C9CE0();
  swift_bridgeObjectRetain();
  sub_1884C9CC8();
  uint64_t v59 = v13;
  sub_1884C9CEC();
  uint64_t v54 = (uint64_t)v4;
  uint64_t v55 = v2;
  uint64_t v14 = *(void *)(v2 + v4[13]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C70EAE0);
  v51[1] = v51;
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1895F8858](v15);
  OUTLINED_FUNCTION_101();
  uint64_t v16 = *(void *)(v14 + 16);
  uint64_t v52 = (void (*)(char *, uint64_t, uint64_t))v14;
  if (v16)
  {
    uint64_t v17 = OUTLINED_FUNCTION_24_11();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = v14 + ((*(unsigned __int8 *)(v18 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
    id v60 = *(id *)(v18 + 72);
    uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
    swift_bridgeObjectRetain();
    while (1)
    {
      v20(a1, v19, v17);
      __swift_storeEnumTagSinglePayload(a1, 0LL, 1LL, v17);
      uint64_t EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, 1LL, v17);
      if ((_DWORD)EnumTagSinglePayload == 1) {
        break;
      }
      MEMORY[0x1895F8858](EnumTagSinglePayload);
      OUTLINED_FUNCTION_34();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v23 - v22, a1, v17);
      if (sub_1884C9B6C() == 0x306C647761LL && v24 == 0xE500000000000000LL)
      {
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_23_13();
LABEL_24:
        swift_bridgeObjectRelease();
        sub_1884C9CB0();
        goto LABEL_25;
      }

      char v26 = sub_1884CA820();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_23_13();
      if ((v26 & 1) != 0) {
        goto LABEL_24;
      }
      v19 += (uint64_t)v60;
      if (!--v16) {
        goto LABEL_18;
      }
    }
  }

  else
  {
    swift_bridgeObjectRetain();
LABEL_18:
    uint64_t v27 = OUTLINED_FUNCTION_24_11();
    OUTLINED_FUNCTION_13_19(v27);
  }

  swift_bridgeObjectRelease();
LABEL_25:
  uint64_t v29 = OUTLINED_FUNCTION_33_6();
  uint64_t v30 = *(void *)(*(void *)(v29 - 8) + 64LL);
  MEMORY[0x1895F8858](v29);
  uint64_t v32 = v55;
  uint64_t v52 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  v52((char *)v51 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL), v55, v29);
  sub_1884C9CA4();
  OUTLINED_FUNCTION_21_5();
  swift_retain();
  uint64_t v33 = sub_1884C9C2C();
  v63[3] = v54;
  v63[4] = (uint64_t)&protocol witness table for DiscoveredBonjourAdvert;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v63);
  sub_1884BB6E8(v32, (uint64_t)boxed_opaque_existential_0);
  uint64_t v54 = type metadata accessor for NWConnectionControlChannelTransport();
  swift_allocObject();
  id v35 = v53;
  id v60 = v53;
  uint64_t v36 = swift_retain();
  uint64_t v37 = NWConnectionControlChannelTransport.init(connection:endpoint:netLinkManager:)(v36, (uint64_t)v63, v35);
  sub_18847A088((uint64_t)sub_1884C44D0, 0LL);
  os_log_type_t v38 = sub_1884CA274();
  if (qword_18C70D760 != -1) {
    swift_once();
  }
  uint64_t v39 = (os_log_s *)qword_18C710458;
  uint64_t v40 = v56;
  sub_1884BB6E8(v32, v56);
  os_log_type_t v41 = v38;
  if (os_log_type_enabled(v39, v38))
  {
    swift_retain();
    uint64_t v42 = OUTLINED_FUNCTION_4_7();
    id v53 = (id)OUTLINED_FUNCTION_4_7();
    id v62 = v53;
    *(_DWORD *)uint64_t v42 = 136446466;
    uint64_t v55 = v33;
    OUTLINED_FUNCTION_4_6();
    uint64_t v43 = *(void *)(v37 + 16);
    unint64_t v44 = *(void *)(v37 + 24);
    swift_bridgeObjectRetain();
    sub_18844EF4C(v43, v44, (uint64_t *)&v62);
    uint64_t v61 = v45;
    sub_1884CA430();
    swift_release();
    uint64_t v46 = swift_bridgeObjectRelease();
    *(_WORD *)(v42 + 12) = 2080;
    MEMORY[0x1895F8858](v46);
    v52((char *)v51 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL), v40, v29);
    uint64_t v47 = sub_1884CA0A0();
    sub_18844EF4C(v47, v48, (uint64_t *)&v62);
    uint64_t v61 = v49;
    sub_1884CA430();
    swift_bridgeObjectRelease();
    sub_1884C4590(v40);
    _os_log_impl( &dword_18840C000,  v39,  v41,  "Created control channel transport %{public}s from bonjour advert: %s",  (uint8_t *)v42,  0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_11();
  }

  sub_1884C4590(v40);
  uint64_t v50 = v58;
  v58[3] = v54;
  v50[4] = (uint64_t)&protocol witness table for NWConnectionControlChannelTransport;
  swift_release();
  swift_release();
  swift_release();

  *uint64_t v50 = v37;
  OUTLINED_FUNCTION_17();
}

BOOL sub_1884C44D0()
{
  if (qword_18C70D5E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = qword_18C70DD60;
  uint64_t v1 = *(void *)algn_18C70DD68;
  char v2 = byte_18C70DD70;
  swift_bridgeObjectRetain();
  sub_188417948(v0, v1, v2);
  char v4 = v3;
  swift_bridgeObjectRelease();
  BOOL result = 0LL;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = sub_1884C9B84();
    return InterfaceIndexCorrespondsToAppleNCMInterface(v6);
  }

  return result;
}

uint64_t sub_1884C4590(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DiscoveredBonjourAdvert();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t DiscoveredBonjourAdvert.endpointIdentifier.getter()
{
  BYTE8(v2) = 0;
  *(void *)&__int128 v2 = *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_0_24() + 20));
  sub_1884CA598();
  sub_1884CA0E8();
  OUTLINED_FUNCTION_31_0();
  sub_1884C46AC();
  sub_1884CA7D8();
  sub_1884CA0E8();
  swift_bridgeObjectRelease();
  return *(void *)((char *)&v2 + 1);
}

void sub_1884C4680(uint64_t a1@<X8>)
{
}

unint64_t sub_1884C46AC()
{
  unint64_t result = qword_18C4DC6A8;
  if (!qword_18C4DC6A8)
  {
    uint64_t v1 = sub_1884C97F4();
    unint64_t result = MEMORY[0x1895C7AEC](MEMORY[0x189606F78], v1);
    atomic_store(result, (unint64_t *)&qword_18C4DC6A8);
  }

  return result;
}

void *initializeBufferWithCopyOfBuffer for DiscoveredBonjourAdvert(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v36 = *a2;
    *a1 = *a2;
    a1 = (void *)(v36 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = sub_1884C9B00();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    char v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1884C97F4();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
    uint64_t v12 = a3[7];
    uint64_t v13 = (void *)((char *)a1 + v12);
    uint64_t v14 = (void *)((char *)a2 + v12);
    uint64_t v15 = *v14;
    unint64_t v16 = v14[1];
    sub_18841E590(*v14, v16);
    *uint64_t v13 = v15;
    v13[1] = v16;
    uint64_t v17 = a3[8];
    uint64_t v18 = a3[9];
    uint64_t v19 = *(void **)((char *)a2 + v17);
    *(void *)((char *)a1 + v17) = v19;
    uint64_t v20 = *(void **)((char *)a2 + v18);
    *(void *)((char *)a1 + v18) = v20;
    uint64_t v21 = a3[10];
    uint64_t v22 = a3[11];
    uint64_t v23 = (void *)((char *)a1 + v21);
    uint64_t v24 = (void *)((char *)a2 + v21);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    char v26 = (void *)((char *)a1 + v22);
    uint64_t v27 = (void *)((char *)a2 + v22);
    uint64_t v28 = v27[1];
    *char v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = a3[13];
    *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
    *(void *)((char *)a1 + v29) = *(void *)((char *)a2 + v29);
    uint64_t v30 = a3[14];
    uint64_t v31 = a3[15];
    uint64_t v32 = *(void **)((char *)a2 + v30);
    *(void *)((char *)a1 + v3sub_188455A4C(v1, v0, 0) = v32;
    *(void *)((char *)a1 + v31) = *(void *)((char *)a2 + v31);
    id v33 = v19;
    id v34 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v35 = v32;
    swift_bridgeObjectRetain();
  }

  return a1;
}

uint64_t destroy for DiscoveredBonjourAdvert(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1884C9B00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = sub_1884C97F4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  sub_18842A58C(*(void *)(a1 + a2[7]), *(void *)(a1 + a2[7] + 8));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1884C9B00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1884C97F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = (uint64_t *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  unint64_t v15 = v13[1];
  sub_18841E590(*v13, v15);
  *uint64_t v12 = v14;
  v12[1] = v15;
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = *(void **)(a2 + v16);
  *(void *)(a1 + v16) = v18;
  uint64_t v19 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v19;
  uint64_t v20 = a3[10];
  uint64_t v21 = a3[11];
  uint64_t v22 = (void *)(a1 + v20);
  uint64_t v23 = (void *)(a2 + v20);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = (void *)(a1 + v21);
  char v26 = (void *)(a2 + v21);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  uint64_t v28 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + v28) = *(void *)(a2 + v28);
  uint64_t v29 = a3[14];
  uint64_t v30 = a3[15];
  uint64_t v31 = *(void **)(a2 + v29);
  *(void *)(a1 + v29) = v31;
  *(void *)(a1 + v3sub_188455A4C(v1, v0, 0) = *(void *)(a2 + v30);
  id v32 = v18;
  id v33 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v34 = v31;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1884C9B00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1884C97F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = (uint64_t *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  unint64_t v15 = v13[1];
  sub_18841E590(*v13, v15);
  uint64_t v16 = *v12;
  unint64_t v17 = v12[1];
  *uint64_t v12 = v14;
  v12[1] = v15;
  sub_18842A58C(v16, v17);
  uint64_t v18 = a3[8];
  uint64_t v19 = *(void **)(a1 + v18);
  uint64_t v20 = *(void **)(a2 + v18);
  *(void *)(a1 + v18) = v20;
  id v21 = v20;

  uint64_t v22 = a3[9];
  uint64_t v23 = *(void **)(a1 + v22);
  uint64_t v24 = *(void **)(a2 + v22);
  *(void *)(a1 + v22) = v24;
  id v25 = v24;

  uint64_t v26 = a3[10];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (void *)(a2 + v26);
  *uint64_t v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = a3[11];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  *uint64_t v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[14];
  id v33 = *(void **)(a2 + v32);
  id v34 = *(void **)(a1 + v32);
  *(void *)(a1 + v32) = v33;
  id v35 = v33;

  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1884C9B00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1884C97F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(void *)(a1 + OUTLINED_FUNCTION_88_4(v3, v13) = *(void *)(a2 + v13);
  uint64_t v14 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  return a1;
}

uint64_t assignWithTake for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1884C9B00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1884C97F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = *(void *)(a1 + v11);
  unint64_t v13 = *(void *)(a1 + v11 + 8);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  sub_18842A58C(v12, v13);
  uint64_t v14 = a3[8];
  unint64_t v15 = *(void **)(a1 + v14);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);

  uint64_t v16 = a3[9];
  unint64_t v17 = *(void **)(a1 + v16);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);

  uint64_t v18 = a3[10];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[11];
  uint64_t v24 = (void *)(a1 + v23);
  id v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + v28) = *(void *)(a2 + v28);
  swift_bridgeObjectRelease();
  uint64_t v29 = a3[14];
  uint64_t v30 = *(void **)(a1 + v29);
  *(void *)(a1 + v29) = *(void *)(a2 + v29);

  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DiscoveredBonjourAdvert()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1884C4E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OUTLINED_FUNCTION_33_6();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }

  uint64_t v9 = OUTLINED_FUNCTION_31_0();
  if (*(_DWORD *)(*(void *)(v9 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v9;
    uint64_t v8 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }

  unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 52));
  if (v11 >= 0xFFFFFFFF) {
    LODWORD(v11) = -1;
  }
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for DiscoveredBonjourAdvert()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1884C4EE4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = OUTLINED_FUNCTION_33_6();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = a1;
LABEL_5:
    __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
    return;
  }

  uint64_t v11 = OUTLINED_FUNCTION_31_0();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v11;
    uint64_t v10 = a1 + *(int *)(a4 + 24);
    goto LABEL_5;
  }

  *(void *)(a1 + *(int *)(a4 + 52)) = (a2 - 1);
  OUTLINED_FUNCTION_40();
}

uint64_t sub_1884C4F70()
{
  uint64_t result = sub_1884C9B00();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1884C97F4();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0LL;
    }
  }

  return result;
}

uint64_t OUTLINED_FUNCTION_0_24()
{
  return type metadata accessor for DiscoveredBonjourAdvert();
}

  ;
}

uint64_t OUTLINED_FUNCTION_2_22( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 - 232))( (char *)&a9 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v10,  v11);
}

uint64_t OUTLINED_FUNCTION_3_24(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_7_15()
{
  return (*(uint64_t (**)(void))(v0 - 264))();
}

uint64_t OUTLINED_FUNCTION_10_14()
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  *(void *)(v3 - 264) = v4;
  return v4(v0, v1);
}

uint64_t OUTLINED_FUNCTION_11_14()
{
  return sub_1884C9EB4();
}

uint64_t OUTLINED_FUNCTION_13_19(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1LL, 1LL, a1);
}

uint64_t OUTLINED_FUNCTION_19_13()
{
  return ControlChannelConnectionWireProtocolVersion.__allocating_init(_:)(v0, v1);
}

uint64_t OUTLINED_FUNCTION_21_11()
{
  return type metadata accessor for ControlChannelConnectionWireProtocolVersion();
}

  ;
}

uint64_t OUTLINED_FUNCTION_23_13()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_24_11()
{
  return sub_1884C9B90();
}

uint64_t OUTLINED_FUNCTION_25_14()
{
  return sub_1884C9BB4();
}

uint64_t OUTLINED_FUNCTION_26_10()
{
  return 0x67615468747561LL;
}

uint64_t OUTLINED_FUNCTION_31_10(uint64_t a1, uint64_t a2)
{
  return sub_18844D900(a1, a2, 1LL, v2);
}

uint64_t OUTLINED_FUNCTION_32_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_34_11()
{
  return sub_1884C9824();
}

uint64_t OUTLINED_FUNCTION_37_8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_18841D670(a1, (uint64_t)&a9);
}

uint64_t sub_1884C5194()
{
  uint64_t result = sub_1884CA400();
  qword_18C710520 = result;
  return result;
}

id sub_1884C51F0()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x189607918]), sel_init);
  qword_18C4DE738 = (uint64_t)result;
  return result;
}

uint64_t sub_1884C5220()
{
  if (qword_18C4DE740 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_18C4DE738;
  objc_msgSend((id)qword_18C4DE738, sel_lock);
  uint64_t v1 = qword_18C4DE728;
  if (qword_18C4DE728)
  {
    uint64_t v2 = qword_18C4DE730;
    uint64_t v3 = swift_slowAlloc();
    *(void *)uint64_t v3 = 0LL;
    *(void *)(v3 + 8) = 0LL;
    *(_OWORD *)(v3 + 32) = 0u;
    *(_OWORD *)(v3 + __swift_destroy_boxed_opaque_existential_0Tm(v0 + 48) = 0u;
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    objc_msgSend(v0, sel_unlock);
    return v3;
  }

  else
  {
    sub_1884CA4D8();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1884CA5E0();
    __break(1u);
  }

  return result;
}

uint64_t sub_1884C5338()
{
  if (qword_18C4DE740 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_18C4DE738;
  objc_msgSend((id)qword_18C4DE738, sel_lock);
  uint64_t v1 = qword_18C4DE728;
  if (qword_18C4DE728)
  {
    objc_msgSend(v0, sel_unlock);
  }

  else
  {
    uint64_t v1 = swift_slowAlloc();
    *(_OWORD *)uint64_t v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
    *(void *)(v1 + 32) = 0LL;
    uint64_t v2 = (void *)swift_slowAlloc();
    bzero(v2, 0x110uLL);
    uint64_t v4 = MEMORY[0x1895F8858](v3);
    if (((unint64_t)" to fit packet of size " & 0x1000000000000000LL) != 0)
    {
      sub_1884CA4CC();
    }

    else
    {
      MEMORY[0x1895F8858](v4);
      if ((v5 & 0x2000000000000000LL) != 0)
      {
        *(void *)__source = 0xD000000000000016LL;
        uint64_t v8 = v5 & 0xFFFFFFFFFFFFFFLL;
        strlcpy((char *)v1, __source, 0x20uLL);
      }

      else
      {
        sub_1884C74B8((v5 & 0xFFFFFFFFFFFFFFFLL) + 32, 22LL, (uint64_t (*)(void))sub_1884C74F0);
      }
    }

    *(void *)(v1 + 32) = 0x100000002LL;
    v2[8] = sub_1884C5520;
    v2[9] = sub_1884C5760;
    qword_18C4DE728 = v1;
    qword_18C4DE730 = (uint64_t)v2;
    nw_protocol_register();
    objc_msgSend((id)qword_18C4DE738, sel_unlock);
  }

  return v1;
}

uint64_t sub_1884C5524(uint64_t result)
{
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }

  uint64_t v1 = *(void **)(result + 40);
  if (!v1)
  {
LABEL_7:
    __break(1u);
    return result;
  }

  uint64_t v2 = v1[2];
  swift_retain();
  if (!v2) {
    return swift_release();
  }
  uint64_t v3 = v1[3];
  uint64_t v16 = v1[14];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v3;
  aBlock[4] = sub_1884596FC;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1884530E8;
  aBlock[3] = &block_descriptor_46;
  uint64_t v5 = _Block_copy(aBlock);
  uint64_t v14 = sub_1884C9F14();
  unint64_t v15 = &v12;
  uint64_t v13 = *(void *)(v14 - 8);
  MEMORY[0x1895F8858](v14);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_retain_n();
  sub_1884C9EFC();
  uint64_t v8 = sub_1884C9EE4();
  uint64_t v12 = (uint64_t)&v12;
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = MEMORY[0x18961AFE8];
  sub_18842E460();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C4DDAB0);
  sub_18842984C();
  sub_1884CA484();
  MEMORY[0x1895C6AC0](0LL, v7, v11, v5);
  _Block_release(v5);
  sub_188426020(v2);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v14);
  swift_release();
  return swift_release();
}

uint64_t sub_1884C5764(uint64_t result)
{
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }

  uint64_t v1 = *(void **)(result + 40);
  if (!v1)
  {
LABEL_7:
    __break(1u);
    return result;
  }

  uint64_t v2 = v1[4];
  swift_retain();
  if (!v2) {
    return swift_release();
  }
  uint64_t v3 = v1[5];
  uint64_t v16 = v1[14];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v3;
  aBlock[4] = sub_1884C7590;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1884530E8;
  aBlock[3] = &block_descriptor_40;
  uint64_t v5 = _Block_copy(aBlock);
  uint64_t v14 = sub_1884C9F14();
  unint64_t v15 = &v12;
  uint64_t v13 = *(void *)(v14 - 8);
  MEMORY[0x1895F8858](v14);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_retain_n();
  sub_1884C9EFC();
  uint64_t v8 = sub_1884C9EE4();
  uint64_t v12 = (uint64_t)&v12;
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = MEMORY[0x18961AFE8];
  sub_18842E460();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C4DDAB0);
  sub_18842984C();
  sub_1884CA484();
  MEMORY[0x1895C6AC0](0LL, v7, v11, v5);
  _Block_release(v5);
  sub_188426020(v2);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v14);
  swift_release();
  return swift_release();
}

uint64_t sub_1884C59A4()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v2 = 30;
  uint64_t result = MEMORY[0x1895C5EF0](&v2, 4LL);
  qword_18C4E6CA8 = result;
  unk_18C4E6CB0 = v1;
  return result;
}

void sub_1884C5A08()
{
  if (qword_18C4DE7C8 != -1) {
    swift_once();
  }
  __asm { BR              X13 }

uint64_t sub_1884C5AB4()
{
  if (qword_18C4DE7D0 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_18C4E6CB8 < 0 || HIDWORD(qword_18C4E6CB8))
  {
    uint64_t result = sub_1884CA5D4();
    __break(1u);
  }

  else
  {
    dword_18C4E6CC0 = qword_18C4E6CB8;
  }

  return result;
}

uint64_t sub_1884C5B94(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 64) = 0LL;
  *(_BYTE *)(v6 + 72) = 0;
  *(void *)(v6 + 8sub_188455A4C(v1, v0, 0) = 0LL;
  *(_OWORD *)(v6 + 16) = 0u;
  *(_OWORD *)(v6 + 32) = 0u;
  *(void *)(v6 + 104) = a4;
  *(void *)(v6 + 112) = a2;
  *(void *)(v6 + 96) = a3;
  uint64_t v11 = v6
      + OBJC_IVAR____TtC19RemotePairingDevice38SkywalkVirtualInterfaceNetworkProtocol_deferredCleanupTimeoutInterval;
  uint64_t v12 = sub_1884C9ED8();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, a6, v12);
  *(void *)(v6 + 56) = a1;
  id v14 = a2;
  swift_unknownObjectRetain();
  sub_1884C5338();
  uint64_t result = nw_protocol_create();
  if (!result)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  *(void *)(v6 + __swift_destroy_boxed_opaque_existential_0Tm(v0 + 48) = result;
  *(void *)(v6 + 88) = a5;
  *(void *)(result + 4sub_188455A4C(v1, v0, 0) = v6;
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t result = nw_channel_get_protocol_handler();
  if (!result)
  {
LABEL_6:

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a6, v12);
    return v6;
  }

  uint64_t v16 = *(void (***)(void))(result + 24);
  if (!v16) {
    goto LABEL_8;
  }
  uint64_t v17 = *v16;
  if (v17)
  {
    v17();
    goto LABEL_6;
  }

uint64_t sub_1884C5CC0@<X0>(void *a1@<X8>)
{
  void v19[2] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *v1;
  uint64_t v5 = OUTLINED_FUNCTION_9_5();
  *(void *)(v5 + 16) = 0LL;
  *(void *)(v5 + 24) = 0LL;
  nw_frame_array_init();
  uint64_t v10 = *(void *)(v1[6] + 32);
  if (!v10)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v9 = *(void *)(v10 + 24);
  if (!v9)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v9 = *(void *)(v9 + 80);
  if (v9)
  {
    uint64_t v11 = ((unsigned int (*)(void))v9)();
    int v18 = 0;
    sub_188468AC0(v11);
    uint64_t v2 = v12;
    uint64_t v17 = 0LL;
    v19[0] = v13;
    v19[1] = v11;
    sub_1884C5E2C(v19, (uint64_t)&v17, v5 + 16, (uint64_t)&v18, v4);
    uint64_t v9 = v17;
    BOOL v8 = __OFSUB__(v17, v11);
    BOOL v6 = v17 == v11;
    BOOL v7 = v17 - v11 < 0;
    if (v17 <= v11)
    {
      *(void *)(v2 + 16) = v17;
      uint64_t v14 = OUTLINED_FUNCTION_9_5();
      *(void *)(v14 + 16) = v1;
      *(void *)(v14 + 24) = v5;
      uint64_t v15 = v1[8];
      BOOL v8 = __OFADD__(v15, 1LL);
      uint64_t v9 = v15 + 1;
      BOOL v6 = v9 == 0;
      BOOL v7 = v9 < 0;
      if (!v8)
      {
        v1[8] = v9;
        *a1 = v2;
        a1[1] = sub_1884C741C;
        a1[2] = v14;
        return swift_retain();
      }
    }

    else
    {
      __break(1u);
    }

    __break(1u);
    goto LABEL_9;
  }

uint64_t *sub_1884C5E2C(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*result)
  {
    uint64_t v12 = *result;
    BOOL v8 = (void *)swift_allocObject();
    v8[2] = a4;
    v8[3] = &v12;
    v8[4] = a2;
    v8[5] = a5;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_1884C7468;
    *(void *)(v9 + 24) = v8;
    aBlock[4] = sub_1884C758C;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x1895F87A8];
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1884C60AC;
    aBlock[3] = &block_descriptor_34_0;
    uint64_t v10 = _Block_copy(aBlock);
    swift_release();
    nw_frame_array_foreach();
    _Block_release(v10);
    return (uint64_t *)swift_release();
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_1884C5F34(uint64_t a1, unsigned int *a2, uint64_t **a3, void *a4)
{
  uint64_t result = nw_frame_unclaimed_bytes();
  uint64_t v8 = result;
  unsigned int v9 = *a2;
  if (qword_18C4DE7D8 != -1) {
    uint64_t result = swift_once();
  }
  if (v9 < dword_18C4E6CC0) {
    return 1LL;
  }
  unsigned int v10 = *a2;
  uint64_t v11 = *a2 - dword_18C4E6CC0;
  if (v10 < dword_18C4E6CC0)
  {
    __break(1u);
LABEL_11:
    swift_once();
    goto LABEL_7;
  }

  if (!v8) {
    goto LABEL_13;
  }
  if (qword_18C4DE7D0 != -1) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v12 = v8 + qword_18C4E6CB8;
  uint64_t v13 = sub_1884C9674();
  MEMORY[0x1895F8858](v13);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void))(v16 + 104))(v15, *MEMORY[0x189606B38]);
  uint64_t result = MEMORY[0x1895C5E3C](v12, v11, v15);
  uint64_t v17 = *a3;
  *uint64_t v17 = result;
  v17[1] = v18;
  *a3 += 2;
  if (!__OFADD__(*a4, 1LL))
  {
    ++*a4;
    return 1LL;
  }

  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_1884C6090()
{
  return 1LL;
}

uint64_t sub_1884C60AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  char v4 = v3(a2);
  swift_unknownObjectRelease();
  return v4 & 1;
}

void sub_1884C60F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  v6[4] = sub_1884C7454;
  v6[5] = v4;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 1107296256LL;
  v6[2] = sub_1884530E8;
  v6[3] = &block_descriptor_21_0;
  uint64_t v5 = _Block_copy(v6);
  swift_retain();
  swift_retain();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v5);
}

uint64_t sub_1884C61BC(uint64_t a1)
{
  aBlock[4] = (uint64_t)sub_1884C6090;
  aBlock[5] = 0LL;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = (uint64_t)sub_1884C60AC;
  aBlock[3] = (uint64_t)&block_descriptor_24_0;
  uint64_t v2 = _Block_copy(aBlock);
  swift_release();
  swift_beginAccess();
  nw_frame_array_foreach();
  swift_endAccess();
  _Block_release(v2);
  uint64_t v3 = *(void *)(a1 + 64);
  BOOL v4 = __OFSUB__(v3, 1LL);
  uint64_t v5 = v3 - 1;
  if (v4)
  {
    __break(1u);
    goto LABEL_13;
  }

  *(void *)(a1 + 64) = v5;
  if (*(_BYTE *)(a1 + 72) != 1 || v5) {
    goto LABEL_10;
  }
  LOBYTE(v2) = sub_1884CA274();
  if (qword_18C70D768 != -1) {
    goto LABEL_14;
  }
  while (1)
  {
    BOOL v6 = (os_log_s *)qword_18C710520;
    os_log_type_t v7 = v2;
    if (os_log_type_enabled((os_log_t)qword_18C710520, (os_log_type_t)v2))
    {
      swift_retain();
      uint64_t v2 = (_DWORD *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      aBlock[0] = v8;
      *uint64_t v2 = 136446210;
      uint64_t v9 = *(void *)(a1 + 96);
      unint64_t v10 = *(void *)(a1 + 104);
      swift_bridgeObjectRetain();
      sub_18844EF4C(v9, v10, aBlock);
      sub_1884CA430();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl( &dword_18840C000,  v6,  v7,  "Executing deferred destroyProtocol for interface %{public}s as last outstanding frames are cleaned up",  (uint8_t *)v2,  0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895C7BD0](v8, -1LL, -1LL);
      MEMORY[0x1895C7BD0](v2, -1LL, -1LL);
    }

    *(_BYTE *)(a1 + 72) = 0;
    if (*(void *)(a1 + 80))
    {
      swift_retain();
      sub_1884C9F68();
      swift_release();
    }

    *(void *)(a1 + 8sub_188455A4C(v1, v0, 0) = 0LL;
    swift_release();
    sub_1884C6960(0);
LABEL_10:
    uint64_t result = swift_isEscapingClosureAtFileLocation();
    if ((result & 1) == 0) {
      break;
    }
LABEL_13:
    __break(1u);
LABEL_14:
    swift_once();
  }

  return result;
}

uint64_t sub_1884C6444(uint64_t a1)
{
  uint64_t v19[3] = *MEMORY[0x1895F89C0];
  unint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 0LL;
  }
  uint64_t v4 = *v1;
  v19[1] = 0LL;
  void v19[2] = 0LL;
  nw_frame_array_init();
  uint64_t v5 = v1[6];
  uint64_t v6 = *(void *)(v5 + 32);
  if (!v6)
  {
LABEL_7:
    v19[0] = 0LL;
    int v18 = 0;
    uint64_t v9 = (void *)swift_allocObject();
    id v9[2] = a1;
    v9[3] = v19;
    v9[4] = &v18;
    v9[5] = v1;
    v9[6] = v4;
    uint64_t v10 = OUTLINED_FUNCTION_9_5();
    *(void *)(v10 + 16) = sub_1884C73CC;
    *(void *)(v10 + 24) = v9;
    aBlock[4] = sub_1884C73E8;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x1895F87A8];
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1884C60AC;
    aBlock[3] = &block_descriptor_9_1;
    uint64_t v11 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    nw_frame_array_foreach();
    _Block_release(v11);
    if ((nw_frame_array_is_empty() & 1) != 0)
    {
LABEL_12:
      uint64_t v15 = v19[0];
      swift_release();
      return v15;
    }

    uint64_t v12 = *(void *)(v5 + 32);
    if (v12)
    {
      uint64_t v13 = *(void *)(v12 + 24);
      if (v13)
      {
        uint64_t v14 = *(void (**)(void))(v13 + 96);
        if (v14)
        {
          v14();
          goto LABEL_12;
        }

        goto LABEL_19;
      }

uint64_t sub_1884C665C(uint64_t a1, uint64_t a2, uint64_t *a3, unsigned int *a4)
{
  unint64_t v9 = *a3;
  if (*a3 < 0)
  {
    __break(1u);
    goto LABEL_12;
  }

  unint64_t v10 = *(void *)(a2 + 16);
  if (v9 >= v10)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    swift_once();
    goto LABEL_5;
  }

  uint64_t v8 = a4;
  uint64_t v4 = a3;
  uint64_t v11 = a2 + 16 * v9;
  uint64_t v6 = *(void *)(v11 + 32);
  unint64_t v7 = *(void *)(v11 + 40);
  sub_18841E590(v6, v7);
  if (!nw_frame_unclaimed_bytes())
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v16 = v10;
  uint64_t v5 = sub_1884C9758();
  if (qword_18C4DE7D0 != -1) {
    goto LABEL_13;
  }
LABEL_5:
  BOOL v12 = __OFADD__(v5, qword_18C4E6CB8);
  uint64_t v13 = v5 + qword_18C4E6CB8;
  if (v12)
  {
    __break(1u);
LABEL_15:
    swift_once();
    goto LABEL_8;
  }

  if (v13 > *v8)
  {
LABEL_18:
    sub_1884CA4D8();
    sub_1884CA0E8();
    sub_1884CA7D8();
    sub_1884CA0E8();
    swift_bridgeObjectRelease();
    sub_1884CA0E8();
    sub_1884CA7D8();
    sub_1884CA0E8();
    swift_bridgeObjectRelease();
    sub_1884CA5E0();
    __break(1u);
    goto LABEL_19;
  }

  if (qword_18C4DE7C8 != -1) {
    goto LABEL_15;
  }
LABEL_8:
  sub_1884C977C();
  sub_1884C9758();
  sub_1884C977C();
  if ((v13 & 0x8000000000000000LL) == 0)
  {
    nw_frame_claim();
    nw_frame_collapse();
    nw_frame_unclaim();
    sub_18842A58C(v6, v7);
    uint64_t v14 = *v4 + 1;
    if (!__OFADD__(*v4, 1LL))
    {
      *uint64_t v4 = v14;
      return v14 < v16;
    }

    __break(1u);
    goto LABEL_17;
  }

LABEL_19:
  uint64_t result = sub_1884CA5D4();
  __break(1u);
  return result;
}

        __break(1u);
LABEL_20:
        __break(1u);
        return result;
      }
    }

    else
    {
      __break(1u);
    }

    __break(1u);
    goto LABEL_19;
  }

  sub_1884CA274();
  if (qword_18C70D768 != -1) {
    swift_once();
  }
  uint64_t v4 = (os_log_s *)qword_18C710520;
  if (OUTLINED_FUNCTION_16_11())
  {
    OUTLINED_FUNCTION_124();
    uint64_t v5 = OUTLINED_FUNCTION_4_7();
    aBlock[0] = OUTLINED_FUNCTION_4_7();
    *(_DWORD *)uint64_t v5 = 136446466;
    uint64_t v6 = *(void *)(v3 + 96);
    unint64_t v7 = *(void *)(v3 + 104);
    swift_bridgeObjectRetain();
    sub_18844EF4C(v6, v7, aBlock);
    uint64_t v29 = v8;
    sub_1884CA430();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2048;
    uint64_t v29 = *(void *)(v3 + 64);
    sub_1884CA430();
    swift_release();
    _os_log_impl( &dword_18840C000,  v4,  v2,  "Deferring destroyProtocol for interface %{public}s until %ld packet groups are cleaned up",  (uint8_t *)v5,  0x16u);
    OUTLINED_FUNCTION_5_16();
    OUTLINED_FUNCTION_0_11();
  }

  *(_BYTE *)(v3 + 72) = 1;
  aBlock[4] = (uint64_t)sub_1884C7378;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = (uint64_t)sub_1884530E8;
  aBlock[3] = (uint64_t)&block_descriptor_14;
  _Block_copy(aBlock);
  unint64_t v9 = sub_1884C9EE4();
  MEMORY[0x1895F8858](v9);
  uint64_t v29 = MEMORY[0x18961AFE8];
  sub_18842E460();
  OUTLINED_FUNCTION_124();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C4DDAB0);
  sub_18842984C();
  sub_1884CA484();
  sub_1884C9F74();
  swift_allocObject();
  unint64_t v10 = sub_1884C9F5C();
  swift_release();
  *(void *)(v3 + 8sub_188455A4C(v1, v0, 0) = v10;
  swift_retain();
  swift_release();
  uint64_t v11 = sub_1884C9F50();
  BOOL v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v13);
  uint64_t v17 = (char *)&v28 - v16;
  sub_1884C9F44();
  MEMORY[0x1895C673C]( v17,  v3 + OBJC_IVAR____TtC19RemotePairingDevice38SkywalkVirtualInterfaceNetworkProtocol_deferredCleanupTimeoutInterval);
  int v18 = *(void (**)(char *, uint64_t))(v12 + 8);
  v18(v17, v11);
  sub_1884CA2F8();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v18)(v15, v11);
}

uint64_t sub_1884C6960(char a1)
{
  uint64_t v3 = v1;
  if ((a1 & 1) != 0 || !*(void *)(v1 + 64))
  {
    sub_1884CA274();
    if (qword_18C70D768 != -1) {
      swift_once();
    }
    uint64_t v20 = (os_log_s *)qword_18C710520;
    if (OUTLINED_FUNCTION_16_11())
    {
      OUTLINED_FUNCTION_124();
      uint64_t v21 = (uint8_t *)OUTLINED_FUNCTION_4_7();
      aBlock[0] = OUTLINED_FUNCTION_4_7();
      *(_DWORD *)uint64_t v21 = 136446210;
      uint64_t v22 = *(void *)(v3 + 96);
      unint64_t v23 = *(void *)(v3 + 104);
      swift_bridgeObjectRetain();
      sub_18844EF4C(v22, v23, aBlock);
      uint64_t v29 = v24;
      sub_1884CA430();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_18840C000, v20, v2, "destroyProtocol invoked for interface %{public}s", v21, 0xCu);
      OUTLINED_FUNCTION_5_16();
      OUTLINED_FUNCTION_0_11();
    }

    uint64_t v25 = *(void *)(v3 + 48);
    uint64_t result = *(void *)(v25 + 32);
    if (result)
    {
      uint64_t v26 = *(void *)(result + 24);
      if (v26)
      {
        uint64_t v27 = *(void (**)(void))(v26 + 8);
        if (v27)
        {
          v27();
          nw_channel_close();
          uint64_t result = *(void *)(v25 + 40);
          if (result)
          {
            swift_release();
            OUTLINED_FUNCTION_0_11();
          }

          goto LABEL_20;
        }

void sub_1884C6DFC(uint64_t a1)
{
  v2[4] = sub_1884C7398;
  v2[5] = a1;
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 1107296256LL;
  v2[2] = sub_1884530E8;
  v2[3] = &block_descriptor_3_0;
  uint64_t v1 = _Block_copy(v2);
  swift_retain();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v1);
}

uint64_t sub_1884C6E98(uint64_t result)
{
  if (*(_BYTE *)(result + 72) == 1)
  {
    uint64_t v1 = result;
    os_log_type_t v2 = sub_1884CA268();
    if (qword_18C70D768 != -1) {
      swift_once();
    }
    uint64_t v3 = (os_log_s *)qword_18C710520;
    os_log_type_t v4 = v2;
    if (os_log_type_enabled((os_log_t)qword_18C710520, v2))
    {
      swift_retain();
      uint64_t v5 = swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v9 = v6;
      *(_DWORD *)uint64_t v5 = 136446466;
      uint64_t v7 = *(void *)(v1 + 96);
      unint64_t v8 = *(void *)(v1 + 104);
      swift_bridgeObjectRetain();
      sub_18844EF4C(v7, v8, &v9);
      sub_1884CA430();
      swift_bridgeObjectRelease();
      *(_WORD *)(v5 + 12) = 2048;
      sub_1884CA430();
      swift_release();
      _os_log_impl( &dword_18840C000,  v3,  v4,  "Forcibly executing destroyProtocol for interface %{public}s since %ld packet groups were not cleaned up by timeout",  (uint8_t *)v5,  0x16u);
      swift_arrayDestroy();
      MEMORY[0x1895C7BD0](v6, -1LL, -1LL);
      MEMORY[0x1895C7BD0](v5, -1LL, -1LL);
    }

    return sub_1884C6960(1LL);
  }

  return result;
}

uint64_t sub_1884C703C()
{
  os_log_type_t v1 = sub_1884CA274();
  if (qword_18C70D768 != -1) {
    swift_once();
  }
  os_log_type_t v2 = (os_log_s *)qword_18C710520;
  if (os_log_type_enabled((os_log_t)qword_18C710520, v1))
  {
    swift_retain_n();
    uint64_t v3 = OUTLINED_FUNCTION_4_7();
    uint64_t v11 = OUTLINED_FUNCTION_4_7();
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v4 = sub_1884CAA0C();
    sub_18844EF4C(v4, v5, &v11);
    sub_1884CA430();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2082;
    uint64_t v6 = *(void *)(v0 + 96);
    unint64_t v7 = *(void *)(v0 + 104);
    swift_bridgeObjectRetain();
    sub_18844EF4C(v6, v7, &v11);
    sub_1884CA430();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_18840C000, v2, v1, "%s.deinit invoked for interface %{public}s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_11();
  }

  sub_188426020(*(void *)(v0 + 16));
  sub_188426020(*(void *)(v0 + 32));
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v8 = v0 + OBJC_IVAR____TtC19RemotePairingDevice38SkywalkVirtualInterfaceNetworkProtocol_deferredCleanupTimeoutInterval;
  uint64_t v9 = sub_1884C9ED8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);
  return v0;
}

uint64_t sub_1884C7248()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1884C726C()
{
  return type metadata accessor for SkywalkVirtualInterfaceNetworkProtocol();
}

uint64_t type metadata accessor for SkywalkVirtualInterfaceNetworkProtocol()
{
  uint64_t result = qword_18C710528;
  if (!qword_18C710528) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1884C72AC()
{
  uint64_t result = sub_1884C9ED8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

void sub_1884C7378()
{
}

uint64_t block_copy_helper_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_188455A4C(v1, v0, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_14()
{
  return swift_release();
}

uint64_t sub_1884C7398()
{
  return sub_1884C6E98(v0);
}

uint64_t sub_1884C73A0()
{
  return swift_deallocObject();
}

uint64_t sub_1884C73CC(uint64_t a1)
{
  return sub_1884C665C(a1, *(void *)(v1 + 16), *(uint64_t **)(v1 + 24), *(unsigned int **)(v1 + 32));
}

uint64_t sub_1884C73DC()
{
  return OUTLINED_FUNCTION_3_8();
}

uint64_t sub_1884C73E8()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_1884C740C()
{
  return OUTLINED_FUNCTION_3_8();
}

void sub_1884C741C()
{
}

uint64_t objectdestroy_14Tm()
{
  return swift_deallocObject();
}

uint64_t sub_1884C7454()
{
  return sub_1884C61BC(*(void *)(v0 + 16));
}

uint64_t sub_1884C745C()
{
  return OUTLINED_FUNCTION_3_8();
}

uint64_t sub_1884C7468(uint64_t a1)
{
  return sub_1884C5F34(a1, *(unsigned int **)(v1 + 16), *(uint64_t ***)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_1884C7474()
{
  return OUTLINED_FUNCTION_3_8();
}

size_t sub_1884C7480@<X0>(char *__source@<X0>, size_t *a2@<X8>)
{
  size_t result = strlcpy(*(char **)(v2 + 16), __source, 0x20uLL);
  *a2 = result;
  return result;
}

uint64_t sub_1884C74B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (!v3) {
    return v5;
  }
  return result;
}

void *sub_1884C74F0@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_1884C752C()
{
  return swift_deallocObject();
}

uint64_t RemoteUnlockDeviceKeyForTunnelRequest.tunnelDeviceName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1884C75C0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010LL && a2 == 0x80000001884E0DF0LL)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }

  else
  {
    char v3 = sub_1884CA820();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }

  return v2 & 1;
}

unint64_t sub_1884C7644()
{
  return 0xD000000000000010LL;
}

uint64_t sub_1884C7664@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884C75C0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1884C768C()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884C76B4()
{
  return sub_1884CAA00();
}

void RemoteUnlockDeviceKeyForTunnelRequest.encode(to:)()
{
  char v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C710600);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  OUTLINED_FUNCTION_9_0();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1884C779C();
  sub_1884CA9E8();
  sub_1884CA754();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0, v3);
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_1884C779C()
{
  unint64_t result = qword_18C710608;
  if (!qword_18C710608)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D6FAC, &type metadata for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710608);
  }

  return result;
}

void RemoteUnlockDeviceKeyForTunnelRequest.init(from:)()
{
  char v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C710610);
  OUTLINED_FUNCTION_152();
  MEMORY[0x1895F8858](v5);
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1884C779C();
  OUTLINED_FUNCTION_18_0();
  if (!v0)
  {
    uint64_t v6 = sub_1884CA688();
    uint64_t v8 = v7;
    OUTLINED_FUNCTION_12();
    *uint64_t v4 = v6;
    v4[1] = v8;
  }

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  OUTLINED_FUNCTION_0_2();
}

void sub_1884C78A0()
{
}

void sub_1884C78B4()
{
}

uint64_t RemoteUnlockDeviceKeyForTunnelResponse.deviceKey.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_18841E590(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t RemoteUnlockDeviceKeyForTunnelResponse.init(deviceKey:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_1884C7900(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x654B656369766564LL && a2 == 0xE900000000000079LL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }

  else
  {
    char v3 = sub_1884CA820();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }

  return v4 & 1;
}

uint64_t sub_1884C7990()
{
  return 0x654B656369766564LL;
}

uint64_t sub_1884C79B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1884C7900(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1884C79D8()
{
  return sub_1884CA9F4();
}

uint64_t sub_1884C7A00()
{
  return sub_1884CAA00();
}

void RemoteUnlockDeviceKeyForTunnelResponse.encode(to:)()
{
  char v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C710618);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  OUTLINED_FUNCTION_9_0();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1884C7AFC();
  sub_1884CA9E8();
  sub_18845D554();
  sub_1884CA784();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0, v3);
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_1884C7AFC()
{
  unint64_t result = qword_18C710620;
  if (!qword_18C710620)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D6F5C, &type metadata for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710620);
  }

  return result;
}

void RemoteUnlockDeviceKeyForTunnelResponse.init(from:)()
{
  char v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C710628);
  OUTLINED_FUNCTION_152();
  MEMORY[0x1895F8858](v5);
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1884C7AFC();
  OUTLINED_FUNCTION_18_0();
  if (!v0)
  {
    sub_18845FEF8();
    sub_1884CA6B8();
    OUTLINED_FUNCTION_12();
    *uint64_t v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  OUTLINED_FUNCTION_0_2();
}

void sub_1884C7C10()
{
}

void sub_1884C7C24()
{
}

id RemotePairingDeviceTunnelServiceConnection.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id RemotePairingDeviceTunnelServiceConnection.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1884C99E0();
  char v2 = v0;
  sub_1884C99C8();
  sub_1884C99F8();
  *(void *)&v2[OBJC_IVAR____TtC19RemotePairingDevice42RemotePairingDeviceTunnelServiceConnection_connection] = swift_dynamicCastClassUnconditional();
  swift_retain();
  sub_1884C98B4();
  swift_release();

  v4.receiver = v2;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t RemotePairingDeviceTunnelServiceConnection.copyRemoteUnlockDeviceKeyForTunnel(tunnelName:)()
{
  uint64_t result = swift_bridgeObjectRelease();
  if (!v0) {
    return v2;
  }
  return result;
}

unint64_t sub_1884C7E20()
{
  unint64_t result = qword_18C710638;
  if (!qword_18C710638)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for RemoteUnlockDeviceKeyForTunnelRequest,  &type metadata for RemoteUnlockDeviceKeyForTunnelRequest);
    atomic_store(result, (unint64_t *)&qword_18C710638);
  }

  return result;
}

unint64_t sub_1884C7E5C()
{
  unint64_t result = qword_18C710640;
  if (!qword_18C710640)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for RemoteUnlockDeviceKeyForTunnelRequest,  &type metadata for RemoteUnlockDeviceKeyForTunnelRequest);
    atomic_store(result, (unint64_t *)&qword_18C710640);
  }

  return result;
}

unint64_t sub_1884C7E98()
{
  unint64_t result = qword_18C710648;
  if (!qword_18C710648)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for RemoteUnlockDeviceKeyForTunnelResponse,  &type metadata for RemoteUnlockDeviceKeyForTunnelResponse);
    atomic_store(result, (unint64_t *)&qword_18C710648);
  }

  return result;
}

unint64_t sub_1884C7ED4()
{
  unint64_t result = qword_18C710650;
  if (!qword_18C710650)
  {
    unint64_t result = MEMORY[0x1895C7AEC]( &protocol conformance descriptor for RemoteUnlockDeviceKeyForTunnelResponse,  &type metadata for RemoteUnlockDeviceKeyForTunnelResponse);
    atomic_store(result, (unint64_t *)&qword_18C710650);
  }

  return result;
}

id RemotePairingDeviceTunnelServiceConnection.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1884C8018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1884C0264(a1, a2, a3, (uint64_t (*)(void))sub_1884C7E20, (uint64_t (*)(void))sub_1884C7E5C);
}

uint64_t sub_1884C802C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1884C0264(a1, a2, a3, (uint64_t (*)(void))sub_1884C7E98, (uint64_t (*)(void))sub_1884C7ED4);
}

ValueMetadata *type metadata accessor for RemoteUnlockDeviceKeyForTunnelRequest()
{
  return &type metadata for RemoteUnlockDeviceKeyForTunnelRequest;
}

ValueMetadata *type metadata accessor for RemoteUnlockDeviceKeyForTunnelResponse()
{
  return &type metadata for RemoteUnlockDeviceKeyForTunnelResponse;
}

uint64_t type metadata accessor for RemotePairingDeviceTunnelServiceConnection()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys()
{
  return &type metadata for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys;
}

uint64_t _s19RemotePairingDevice38RemoteUnlockDeviceKeyForTunnelResponseV10CodingKeysOwst_0( uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1884C80E4 + 4 * byte_1884D6C30[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1884C8104 + 4 * byte_1884D6C35[v4]))();
  }
}

_BYTE *sub_1884C80E4(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1884C8104(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1884C810C(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1884C8114(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1884C811C(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1884C8124(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys()
{
  return &type metadata for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys;
}

unint64_t sub_1884C8144()
{
  unint64_t result = qword_18C710680;
  if (!qword_18C710680)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D6E7C, &type metadata for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710680);
  }

  return result;
}

unint64_t sub_1884C8184()
{
  unint64_t result = qword_18C710688;
  if (!qword_18C710688)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D6F34, &type metadata for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710688);
  }

  return result;
}

unint64_t sub_1884C81C4()
{
  unint64_t result = qword_18C710690;
  if (!qword_18C710690)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D6EA4, &type metadata for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710690);
  }

  return result;
}

unint64_t sub_1884C8204()
{
  unint64_t result = qword_18C710698;
  if (!qword_18C710698)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D6ECC, &type metadata for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C710698);
  }

  return result;
}

unint64_t sub_1884C8244()
{
  unint64_t result = qword_18C7106A0;
  if (!qword_18C7106A0)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D6DEC, &type metadata for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7106A0);
  }

  return result;
}

unint64_t sub_1884C8284()
{
  unint64_t result = qword_18C7106A8;
  if (!qword_18C7106A8)
  {
    unint64_t result = MEMORY[0x1895C7AEC](&unk_1884D6E14, &type metadata for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7106A8);
  }

  return result;
}

void OS_dispatch_io.write(content:completingOn:completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1884C9F38();
  MEMORY[0x1895F8858](v3);
  __asm { BR              X10 }

uint64_t sub_1884C8358()
{
  *(void *)(v7 - 112) = v5;
  *(_WORD *)(v7 - 104) = v6;
  *(_BYTE *)(v7 - 102) = BYTE2(v6);
  *(_BYTE *)(v7 - 101) = BYTE3(v6);
  *(_BYTE *)(v7 - 10sub_188455A4C(v1, v0, 0) = BYTE4(v6);
  *(_BYTE *)(v7 - 99) = BYTE5(v6);
  sub_1884C9F20();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v1;
  *(void *)(v8 + 24) = v2;
  swift_retain();
  sub_1884CA2C8();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v0);
}

uint64_t OS_dispatch_io.read(minLength:maxLength:competingOn:completion:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = swift_allocBox();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1884C9F38();
  __swift_storeEnumTagSinglePayload(v9, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject();
  void v11[2] = v7;
  v11[3] = a4;
  v11[4] = a5;
  swift_retain();
  swift_retain();
  sub_1884CA298();
  swift_release();
  return swift_release();
}

uint64_t sub_1884C85E8()
{
  uint64_t result = sub_1884CA400();
  qword_18C7106B0 = result;
  return result;
}

void sub_1884C8648( int a1, uint64_t a2, int a3, uint64_t a4, void (*a5)(void *, unint64_t, uint64_t), uint64_t a6)
{
  uint64_t v54 = a6;
  uint64_t v55 = a5;
  LODWORD(v56) = a3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7106B8);
  uint64_t v9 = swift_projectBox();
  uint64_t v10 = sub_1884C9F38();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  uint64_t v14 = &v51[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v15 = *(void *)(*(void *)(v8 - 8) + 64LL);
  MEMORY[0x1895F8858](v12);
  unint64_t v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  sub_1884C9118(a2, (uint64_t)&v51[-v16]);
  if (__swift_getEnumTagSinglePayload((uint64_t)&v51[-v16], 1LL, v10) == 1)
  {
    sub_1884C9160((uint64_t)&v51[-v16]);
    int v17 = (int)v56;
    if ((_DWORD)v56)
    {
LABEL_3:
      uint64_t v18 = sub_1884C9554();
      uint64_t v56 = v51;
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v20 = *(void *)(v19 + 64);
      MEMORY[0x1895F8858](v18);
      unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v22 = &v51[-v21];
      uint64_t v23 = sub_1884C9830();
      if ((v23 & 0x100000000LL) != 0) {
        int v24 = 5;
      }
      else {
        int v24 = v23;
      }
      LODWORD(v60[0]) = v24;
      sub_18842FE04(MEMORY[0x18961AFE8]);
      sub_1884C91A0(qword_18C70EB10, MEMORY[0x189605FB8]);
      sub_1884C9608();
      uint64_t v25 = sub_1884CA25C();
      os_log_type_t v26 = v25;
      if (qword_18C70D770 != -1) {
        uint64_t v25 = swift_once();
      }
      uint64_t v27 = (os_log_s *)qword_18C7106B0;
      MEMORY[0x1895F8858](v25);
      uint64_t v28 = &v51[-v21];
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v19 + 16))(&v51[-v21], &v51[-v21], v18);
      if (os_log_type_enabled(v27, v26))
      {
        uint64_t v29 = swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        v60[0] = v30;
        *(_DWORD *)uint64_t v29 = 67109378;
        LODWORD(v57) = v17;
        sub_1884CA430();
        *(_WORD *)(v29 + 8) = 2082;
        id v53 = v51;
        sub_1884C91A0(&qword_18C70F900, MEMORY[0x189605FD0]);
        uint64_t v31 = sub_1884CA8B0();
        sub_18844EF4C(v31, v32, v60);
        uint64_t v57 = v33;
        sub_1884CA430();
        swift_bridgeObjectRelease();
        id v34 = *(void (**)(_BYTE *, uint64_t))(v19 + 8);
        v34(v28, v18);
        _os_log_impl(&dword_18840C000, v27, v26, "Read error: %d, %{public}s", (uint8_t *)v29, 0x12u);
        swift_arrayDestroy();
        MEMORY[0x1895C7BD0](v30, -1LL, -1LL);
        MEMORY[0x1895C7BD0](v29, -1LL, -1LL);
      }

      else
      {
        id v34 = *(void (**)(_BYTE *, uint64_t))(v19 + 8);
        v34(&v51[-v21], v18);
      }

      uint64_t v39 = (void *)sub_1884C9548();
      v55(v39, 0LL, 1LL);

      v34(v22, v18);
      return;
    }
  }

  else
  {
    int v52 = a1;
    id v53 = (_BYTE *)v8;
    id v35 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v11 + 32);
    v35(v14, &v51[-v16], v10);
    uint64_t v36 = swift_beginAccess();
    MEMORY[0x1895F8858](v36);
    sub_1884C9118(v9, (uint64_t)&v51[-v16]);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)&v51[-v16], 1LL, v10);
    uint64_t v38 = sub_1884C9160((uint64_t)&v51[-v16]);
    if (EnumTagSinglePayload == 1)
    {
      MEMORY[0x1895F8858](v38);
      v35(&v51[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)], v14, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)&v51[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)], 0LL, 1LL, v10);
      swift_beginAccess();
      sub_1884C91E0((uint64_t)&v51[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)], v9);
      int v17 = (int)v56;
    }

    else
    {
      swift_beginAccess();
      int v40 = __swift_getEnumTagSinglePayload(v9, 1LL, v10);
      int v17 = (int)v56;
      if (!v40) {
        sub_1884C9F2C();
      }
      swift_endAccess();
      (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v14, v10);
    }

    LOBYTE(a1) = v52;
    if (v17) {
      goto LABEL_3;
    }
  }

  if ((a1 & 1) == 0) {
    return;
  }
  uint64_t v41 = swift_beginAccess();
  MEMORY[0x1895F8858](v41);
  sub_1884C9118(v9, (uint64_t)&v51[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)]);
  uint64_t v42 = sub_1884CA40C();
  sub_1884C9160((uint64_t)&v51[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)]);
  uint64_t v59 = v42;
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v43 = v57;
    unint64_t v44 = v58;
    if (sub_1884C9758() >= 1)
    {
      sub_18841E590(v43, v44);
      v55((void *)v43, v44, 0LL);
      sub_18842A58C(v43, v44);
      sub_18842A58C(v43, v44);
      return;
    }

    sub_18842A58C(v43, v44);
  }

  sub_1884CA25C();
  if (qword_18C70D770 != -1) {
    swift_once();
  }
  uint64_t v45 = MEMORY[0x18961AFE8];
  sub_1884C9824();
  uint64_t v46 = sub_1884C9554();
  uint64_t v47 = *(void *)(v46 - 8);
  MEMORY[0x1895F8858](v46);
  uint64_t v49 = &v51[-((v48 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  LODWORD(v57) = 32;
  sub_18842FE04(v45);
  sub_1884C91A0(qword_18C70EB10, MEMORY[0x189605FB8]);
  sub_1884C9608();
  uint64_t v50 = (void *)sub_1884C9548();
  (*(void (**)(_BYTE *, uint64_t))(v47 + 8))(v49, v46);
  v55(v50, 0LL, 1LL);
}

uint64_t sub_1884C8D40(uint64_t result, uint64_t a2, int a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v5 = a4;
  if (a3)
  {
    v26[3] = a5;
    uint64_t v7 = sub_1884C9554();
    v26[2] = v26;
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void *)(v8 + 64);
    MEMORY[0x1895F8858](v7);
    unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v11 = (char *)v26 - v10;
    uint64_t v12 = sub_1884C9830();
    if ((v12 & 0x100000000LL) != 0) {
      int v13 = 5;
    }
    else {
      int v13 = v12;
    }
    LODWORD(v28) = v13;
    sub_18842FE04(MEMORY[0x18961AFE8]);
    sub_1884C91A0(qword_18C70EB10, MEMORY[0x189605FB8]);
    sub_1884C9608();
    uint64_t v14 = sub_1884CA25C();
    os_log_type_t v15 = v14;
    if (qword_18C70D770 != -1) {
      uint64_t v14 = swift_once();
    }
    v26[1] = v26;
    unint64_t v16 = (os_log_s *)qword_18C7106B0;
    MEMORY[0x1895F8858](v14);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v26 - v10, (char *)v26 - v10, v7);
    if (os_log_type_enabled(v16, v15))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      v26[0] = v5;
      uint64_t v19 = v18;
      uint64_t v28 = v18;
      *(_DWORD *)uint64_t v17 = 67109378;
      LODWORD(v27) = a3;
      sub_1884CA430();
      *(_WORD *)(v17 + 8) = 2082;
      sub_1884C91A0(&qword_18C70F900, MEMORY[0x189605FD0]);
      uint64_t v20 = sub_1884CA8B0();
      sub_18844EF4C(v20, v21, &v28);
      uint64_t v27 = v22;
      sub_1884CA430();
      swift_bridgeObjectRelease();
      uint64_t v23 = *(void (**)(char *, uint64_t))(v8 + 8);
      v23((char *)v26 - v10, v7);
      _os_log_impl(&dword_18840C000, v16, v15, "Write error: %d, %{public}s", (uint8_t *)v17, 0x12u);
      swift_arrayDestroy();
      uint64_t v24 = v19;
      uint64_t v5 = (void (*)(void))v26[0];
      MEMORY[0x1895C7BD0](v24, -1LL, -1LL);
      MEMORY[0x1895C7BD0](v17, -1LL, -1LL);
    }

    else
    {
      uint64_t v23 = *(void (**)(char *, uint64_t))(v8 + 8);
      v23((char *)v26 - v10, v7);
    }

    uint64_t v25 = (void *)sub_1884C9548();
    v5();

    return ((uint64_t (*)(char *, uint64_t))v23)(v11, v7);
  }

  else if ((result & 1) != 0)
  {
    return ((uint64_t (*)(void))a4)(0LL);
  }

  return result;
}

uint64_t sub_1884C9024(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1884C95C0();
  if (!result || (uint64_t result = sub_1884C95E4(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1884C95D8();
      return sub_1884C9F20();
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_1884C90B4()
{
  return swift_deallocObject();
}

uint64_t sub_1884C90D8(uint64_t a1, uint64_t a2, int a3)
{
  return sub_1884C8D40(a1, a2, a3, *(void (**)(void))(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_1884C90E0()
{
  return swift_deallocObject();
}

void sub_1884C910C(int a1, uint64_t a2, int a3)
{
}

uint64_t sub_1884C9118(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7106B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1884C9160(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7106B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1884C91A0(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = sub_1884C9554();
    uint64_t result = MEMORY[0x1895C7AEC](a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1884C91E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7106B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_1()
{
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_2()
{
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_3()
{
  OUTLINED_FUNCTION_1( &dword_18840C000,  v0,  v1,  "%s IOBSDNameMatching returned nil for inteface name %s.",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_3();
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_4(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ServiceHasAppleNCMParent";
  OUTLINED_FUNCTION_0(&dword_18840C000, (int)a2, a3, "%s interface parent does not conform to AppleUSBNCMData", a1);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_5(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ServiceHasAppleNCMParent";
  OUTLINED_FUNCTION_0(&dword_18840C000, (int)a2, a3, "%s interface parent does have valid USB vendor ID property", a1);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_6(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ServiceHasAppleNCMParent";
  OUTLINED_FUNCTION_0(&dword_18840C000, (int)a2, a3, "%s Figuring out if service has NCM as parent.", a1);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_7()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_4();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( &dword_18840C000,  v1,  OS_LOG_TYPE_ERROR,  "%s IOServiceGetMatchingServices failed for inteface name %s. Result: %d",  (uint8_t *)v2,  0x1Cu);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_8()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl( &dword_18840C000,  v0,  OS_LOG_TYPE_DEBUG,  "%s Trying to determine whether interface index %ld comes from NCM.",  (uint8_t *)v1,  0x16u);
  OUTLINED_FUNCTION_3();
}

uint64_t sub_1884C9530()
{
  return MEMORY[0x189610CD8]();
}

uint64_t sub_1884C953C()
{
  return MEMORY[0x189610CE0]();
}

uint64_t sub_1884C9548()
{
  return MEMORY[0x189605F98]();
}

uint64_t sub_1884C9554()
{
  return MEMORY[0x189605FC0]();
}

uint64_t sub_1884C9560()
{
  return MEMORY[0x189606008]();
}

uint64_t sub_1884C956C()
{
  return MEMORY[0x189606020]();
}

uint64_t sub_1884C9578()
{
  return MEMORY[0x189606030]();
}

uint64_t sub_1884C9584()
{
  return MEMORY[0x1896060A0]();
}

uint64_t sub_1884C9590()
{
  return MEMORY[0x1896060B8]();
}

uint64_t sub_1884C959C()
{
  return MEMORY[0x1896060C8]();
}

uint64_t sub_1884C95A8()
{
  return MEMORY[0x1896061E8]();
}

uint64_t sub_1884C95B4()
{
  return MEMORY[0x1896061F8]();
}

uint64_t sub_1884C95C0()
{
  return MEMORY[0x189606210]();
}

uint64_t sub_1884C95CC()
{
  return MEMORY[0x189606220]();
}

uint64_t sub_1884C95D8()
{
  return MEMORY[0x189606228]();
}

uint64_t sub_1884C95E4()
{
  return MEMORY[0x189606238]();
}

uint64_t sub_1884C95F0()
{
  return MEMORY[0x189606258]();
}

uint64_t sub_1884C95FC()
{
  return MEMORY[0x189606310]();
}

uint64_t sub_1884C9608()
{
  return MEMORY[0x189606918]();
}

uint64_t sub_1884C9614()
{
  return MEMORY[0x189606930]();
}

uint64_t sub_1884C9620()
{
  return MEMORY[0x189606938]();
}

uint64_t sub_1884C962C()
{
  return MEMORY[0x189606A00]();
}

uint64_t sub_1884C9638()
{
  return MEMORY[0x189606A58]();
}

uint64_t sub_1884C9644()
{
  return MEMORY[0x189606A98]();
}

uint64_t sub_1884C9650()
{
  return MEMORY[0x189606AE0]();
}

uint64_t sub_1884C965C()
{
  return MEMORY[0x189606AF0]();
}

uint64_t sub_1884C9668()
{
  return MEMORY[0x189606B00]();
}

uint64_t sub_1884C9674()
{
  return MEMORY[0x189606B50]();
}

uint64_t sub_1884C9680()
{
  return MEMORY[0x189606B68]();
}

uint64_t sub_1884C968C()
{
  return MEMORY[0x189606B78]();
}

uint64_t sub_1884C9698()
{
  return MEMORY[0x189606B88]();
}

uint64_t sub_1884C96A4()
{
  return MEMORY[0x189606BA0]();
}

uint64_t sub_1884C96B0()
{
  return MEMORY[0x189606BB0]();
}

uint64_t sub_1884C96BC()
{
  return MEMORY[0x189606BB8]();
}

uint64_t sub_1884C96C8()
{
  return MEMORY[0x189606BC8]();
}

uint64_t sub_1884C96D4()
{
  return MEMORY[0x189606BE0]();
}

uint64_t sub_1884C96E0()
{
  return MEMORY[0x189606BF8]();
}

uint64_t sub_1884C96EC()
{
  return MEMORY[0x189606C10]();
}

uint64_t sub_1884C96F8()
{
  return MEMORY[0x189606C20]();
}

uint64_t sub_1884C9704()
{
  return MEMORY[0x189606C28]();
}

uint64_t sub_1884C9710()
{
  return MEMORY[0x189606C40]();
}

uint64_t sub_1884C971C()
{
  return MEMORY[0x189606C60]();
}

uint64_t sub_1884C9728()
{
  return MEMORY[0x189606C80]();
}

uint64_t sub_1884C9734()
{
  return MEMORY[0x189606C98]();
}

uint64_t sub_1884C9740()
{
  return MEMORY[0x189606CB0]();
}

uint64_t sub_1884C974C()
{
  return MEMORY[0x189606CC0]();
}

uint64_t sub_1884C9758()
{
  return MEMORY[0x189606CD8]();
}

uint64_t sub_1884C9764()
{
  return MEMORY[0x189606CF0]();
}

uint64_t sub_1884C9770()
{
  return MEMORY[0x189606D10]();
}

uint64_t sub_1884C977C()
{
  return MEMORY[0x189606D30]();
}

uint64_t sub_1884C9788()
{
  return MEMORY[0x189606DC8]();
}

uint64_t sub_1884C9794()
{
  return MEMORY[0x189606E18]();
}

uint64_t sub_1884C97A0()
{
  return MEMORY[0x189606E28]();
}

uint64_t sub_1884C97AC()
{
  return MEMORY[0x189606E58]();
}

uint64_t sub_1884C97B8()
{
  return MEMORY[0x189606EB0]();
}

uint64_t sub_1884C97C4()
{
  return MEMORY[0x189606EC0]();
}

uint64_t sub_1884C97D0()
{
  return MEMORY[0x189606ED0]();
}

uint64_t sub_1884C97DC()
{
  return MEMORY[0x189606EE0]();
}

uint64_t sub_1884C97E8()
{
  return MEMORY[0x189606EF8]();
}

uint64_t sub_1884C97F4()
{
  return MEMORY[0x189606F18]();
}

uint64_t sub_1884C9800()
{
  return MEMORY[0x18961B558]();
}

uint64_t sub_1884C980C()
{
  return MEMORY[0x18961B570]();
}

uint64_t sub_1884C9818()
{
  return MEMORY[0x18961B578]();
}

uint64_t sub_1884C9824()
{
  return MEMORY[0x18961D148]();
}

uint64_t sub_1884C9830()
{
  return MEMORY[0x18961D0E8]();
}

uint64_t sub_1884C983C()
{
  return MEMORY[0x189610CE8]();
}

uint64_t _s7Mercury12RemoteDeviceC0b7PairingC0E18endpointIdentifierSSvg_0()
{
  return MEMORY[0x189610CF0]();
}

uint64_t sub_1884C9854()
{
  return MEMORY[0x189610CF8]();
}

uint64_t sub_1884C9860()
{
  return MEMORY[0x189610D00]();
}

uint64_t sub_1884C986C()
{
  return MEMORY[0x189610D08]();
}

uint64_t sub_1884C9878()
{
  return MEMORY[0x189610D18]();
}

uint64_t sub_1884C9884()
{
  return MEMORY[0x189610D20]();
}

uint64_t sub_1884C9890()
{
  return MEMORY[0x189610D28]();
}

uint64_t sub_1884C989C()
{
  return MEMORY[0x189610D30]();
}

uint64_t sub_1884C98A8()
{
  return MEMORY[0x189610D38]();
}

uint64_t sub_1884C98B4()
{
  return MEMORY[0x189610D40]();
}

uint64_t sub_1884C98C0()
{
  return MEMORY[0x189610D48]();
}

uint64_t sub_1884C98CC()
{
  return MEMORY[0x189610D50]();
}

uint64_t sub_1884C98D8()
{
  return MEMORY[0x189610D58]();
}

uint64_t sub_1884C98E4()
{
  return MEMORY[0x189610D68]();
}

uint64_t sub_1884C98F0()
{
  return MEMORY[0x189610D70]();
}

uint64_t sub_1884C98FC()
{
  return MEMORY[0x189610D78]();
}

uint64_t sub_1884C9908()
{
  return MEMORY[0x189610D88]();
}

uint64_t sub_1884C9914()
{
  return MEMORY[0x189610D90]();
}

uint64_t sub_1884C9920()
{
  return MEMORY[0x189610D98]();
}

uint64_t sub_1884C992C()
{
  return MEMORY[0x189610DA0]();
}

uint64_t sub_1884C9938()
{
  return MEMORY[0x189610DC0]();
}

uint64_t sub_1884C9944()
{
  return MEMORY[0x189610DC8]();
}

uint64_t sub_1884C9950()
{
  return MEMORY[0x189610DD8]();
}

uint64_t sub_1884C995C()
{
  return MEMORY[0x189610DE0]();
}

uint64_t sub_1884C9968()
{
  return MEMORY[0x189610DF8]();
}

uint64_t sub_1884C9974()
{
  return MEMORY[0x189610E00]();
}

uint64_t sub_1884C9980()
{
  return MEMORY[0x189610E08]();
}

uint64_t _s19RemotePairingDevice014CreateWirelessB14SessionRequestV8endpointSo13OS_xpc_object_pvg_0()
{
  return MEMORY[0x189610E10]();
}

uint64_t _s19RemotePairingDevice014CreateWirelessB14SessionRequestV8endpointSo13OS_xpc_object_pvs_0()
{
  return MEMORY[0x189610E18]();
}

uint64_t sub_1884C99A4()
{
  return MEMORY[0x189610E20]();
}

uint64_t sub_1884C99B0()
{
  return MEMORY[0x189610E40]();
}

uint64_t sub_1884C99BC()
{
  return MEMORY[0x189610E48]();
}

uint64_t sub_1884C99C8()
{
  return MEMORY[0x189610E50]();
}

uint64_t sub_1884C99D4()
{
  return MEMORY[0x189610E58]();
}

uint64_t sub_1884C99E0()
{
  return MEMORY[0x189610E60]();
}

uint64_t sub_1884C99EC()
{
  return MEMORY[0x189610E70]();
}

uint64_t sub_1884C99F8()
{
  return MEMORY[0x189610E88]();
}

uint64_t sub_1884C9A04()
{
  return MEMORY[0x189610E98]();
}

uint64_t sub_1884C9A10()
{
  return MEMORY[0x189610EA0]();
}

uint64_t sub_1884C9A1C()
{
  return MEMORY[0x189610EB0]();
}

uint64_t sub_1884C9A28()
{
  return MEMORY[0x189610EB8]();
}

uint64_t sub_1884C9A34()
{
  return MEMORY[0x189610EC0]();
}

uint64_t sub_1884C9A40()
{
  return MEMORY[0x189610EC8]();
}

uint64_t sub_1884C9A4C()
{
  return MEMORY[0x189610ED0]();
}

uint64_t sub_1884C9A58()
{
  return MEMORY[0x189610ED8]();
}

uint64_t sub_1884C9A64()
{
  return MEMORY[0x189610EE0]();
}

uint64_t sub_1884C9A70()
{
  return MEMORY[0x189610EE8]();
}

uint64_t sub_1884C9A7C()
{
  return MEMORY[0x189610EF0]();
}

uint64_t sub_1884C9A88()
{
  return MEMORY[0x189610EF8]();
}

uint64_t sub_1884C9A94()
{
  return MEMORY[0x189610F00]();
}

uint64_t sub_1884C9AA0()
{
  return MEMORY[0x189610F08]();
}

uint64_t sub_1884C9AAC()
{
  return MEMORY[0x189610F10]();
}

uint64_t sub_1884C9AB8()
{
  return MEMORY[0x189610F18]();
}

uint64_t sub_1884C9AC4()
{
  return MEMORY[0x189610F20]();
}

uint64_t sub_1884C9AD0()
{
  return MEMORY[0x189610F30]();
}

uint64_t sub_1884C9ADC()
{
  return MEMORY[0x1896087E8]();
}

uint64_t sub_1884C9AE8()
{
  return MEMORY[0x189608800]();
}

uint64_t sub_1884C9AF4()
{
  return MEMORY[0x189608830]();
}

uint64_t sub_1884C9B00()
{
  return MEMORY[0x189608840]();
}

uint64_t sub_1884C9B0C()
{
  return MEMORY[0x1896088A8]();
}

uint64_t sub_1884C9B18()
{
  return MEMORY[0x1896088B0]();
}

uint64_t sub_1884C9B24()
{
  return MEMORY[0x1896088B8]();
}

uint64_t sub_1884C9B30()
{
  return MEMORY[0x1896088C0]();
}

uint64_t sub_1884C9B3C()
{
  return MEMORY[0x1896088D0]();
}

uint64_t sub_1884C9B48()
{
  return MEMORY[0x1896088E8]();
}

uint64_t sub_1884C9B54()
{
  return MEMORY[0x1896088F0]();
}

uint64_t sub_1884C9B60()
{
  return MEMORY[0x189608908]();
}

uint64_t sub_1884C9B6C()
{
  return MEMORY[0x189608920]();
}

uint64_t sub_1884C9B78()
{
  return MEMORY[0x189608928]();
}

uint64_t sub_1884C9B84()
{
  return MEMORY[0x189608930]();
}

uint64_t sub_1884C9B90()
{
  return MEMORY[0x189608938]();
}

uint64_t sub_1884C9B9C()
{
  return MEMORY[0x189608960]();
}

uint64_t sub_1884C9BA8()
{
  return MEMORY[0x189608968]();
}

uint64_t sub_1884C9BB4()
{
  return MEMORY[0x189608970]();
}

uint64_t sub_1884C9BC0()
{
  return MEMORY[0x189608978]();
}

uint64_t sub_1884C9BCC()
{
  return MEMORY[0x189608980]();
}

uint64_t sub_1884C9BD8()
{
  return MEMORY[0x189608988]();
}

uint64_t sub_1884C9BE4()
{
  return MEMORY[0x189608998]();
}

uint64_t sub_1884C9BF0()
{
  return MEMORY[0x1896089A0]();
}

uint64_t sub_1884C9BFC()
{
  return MEMORY[0x1896089C8]();
}

uint64_t sub_1884C9C08()
{
  return MEMORY[0x1896089D8]();
}

uint64_t sub_1884C9C14()
{
  return MEMORY[0x1896089E0]();
}

uint64_t sub_1884C9C20()
{
  return MEMORY[0x1896089E8]();
}

uint64_t sub_1884C9C2C()
{
  return MEMORY[0x1896089F0]();
}

uint64_t sub_1884C9C38()
{
  return MEMORY[0x189608A00]();
}

uint64_t sub_1884C9C44()
{
  return MEMORY[0x189608A10]();
}

uint64_t sub_1884C9C50()
{
  return MEMORY[0x189608A70]();
}

uint64_t sub_1884C9C5C()
{
  return MEMORY[0x189608A88]();
}

uint64_t sub_1884C9C68()
{
  return MEMORY[0x189608A90]();
}

uint64_t sub_1884C9C74()
{
  return MEMORY[0x189608AA0]();
}

uint64_t sub_1884C9C80()
{
  return MEMORY[0x189608AB0]();
}

uint64_t sub_1884C9C8C()
{
  return MEMORY[0x189608AC0]();
}

uint64_t sub_1884C9C98()
{
  return MEMORY[0x189608AD0]();
}

uint64_t sub_1884C9CA4()
{
  return MEMORY[0x189608AD8]();
}

uint64_t sub_1884C9CB0()
{
  return MEMORY[0x189608AF8]();
}

uint64_t sub_1884C9CBC()
{
  return MEMORY[0x189608B10]();
}

uint64_t sub_1884C9CC8()
{
  return MEMORY[0x189608B18]();
}

uint64_t sub_1884C9CD4()
{
  return MEMORY[0x189608B38]();
}

uint64_t sub_1884C9CE0()
{
  return MEMORY[0x189608B40]();
}

uint64_t sub_1884C9CEC()
{
  return MEMORY[0x189608B48]();
}

uint64_t sub_1884C9CF8()
{
  return MEMORY[0x189608B50]();
}

uint64_t sub_1884C9D04()
{
  return MEMORY[0x189608B60]();
}

uint64_t sub_1884C9D10()
{
  return MEMORY[0x189608B68]();
}

uint64_t sub_1884C9D1C()
{
  return MEMORY[0x189608B70]();
}

uint64_t sub_1884C9D28()
{
  return MEMORY[0x189608B78]();
}

uint64_t sub_1884C9D34()
{
  return MEMORY[0x189608B80]();
}

uint64_t sub_1884C9D40()
{
  return MEMORY[0x189608B88]();
}

uint64_t sub_1884C9D4C()
{
  return MEMORY[0x189608B90]();
}

uint64_t sub_1884C9D58()
{
  return MEMORY[0x189608B98]();
}

uint64_t sub_1884C9D64()
{
  return MEMORY[0x189608BA0]();
}

uint64_t sub_1884C9D70()
{
  return MEMORY[0x189608BB8]();
}

uint64_t sub_1884C9D7C()
{
  return MEMORY[0x189608BC0]();
}

uint64_t sub_1884C9D88()
{
  return MEMORY[0x189608BC8]();
}

uint64_t sub_1884C9D94()
{
  return MEMORY[0x189608BD0]();
}

uint64_t sub_1884C9DA0()
{
  return MEMORY[0x189608C38]();
}

uint64_t sub_1884C9DAC()
{
  return MEMORY[0x189608C40]();
}

uint64_t sub_1884C9DB8()
{
  return MEMORY[0x189608C70]();
}

uint64_t sub_1884C9DC4()
{
  return MEMORY[0x189608C78]();
}

uint64_t sub_1884C9DD0()
{
  return MEMORY[0x189608C80]();
}

uint64_t sub_1884C9DDC()
{
  return MEMORY[0x189608C88]();
}

uint64_t sub_1884C9DE8()
{
  return MEMORY[0x189608CA0]();
}

uint64_t sub_1884C9DF4()
{
  return MEMORY[0x189608CA8]();
}

uint64_t sub_1884C9E00()
{
  return MEMORY[0x189608CB0]();
}

uint64_t sub_1884C9E0C()
{
  return MEMORY[0x189608CB8]();
}

uint64_t sub_1884C9E18()
{
  return MEMORY[0x189608CC8]();
}

uint64_t sub_1884C9E24()
{
  return MEMORY[0x189608CF0]();
}

uint64_t sub_1884C9E30()
{
  return MEMORY[0x189608D00]();
}

uint64_t sub_1884C9E3C()
{
  return MEMORY[0x189608D10]();
}

uint64_t sub_1884C9E48()
{
  return MEMORY[0x189608D18]();
}

uint64_t sub_1884C9E54()
{
  return MEMORY[0x189608D20]();
}

uint64_t sub_1884C9E60()
{
  return MEMORY[0x189608D28]();
}

uint64_t sub_1884C9E6C()
{
  return MEMORY[0x189608D30]();
}

uint64_t sub_1884C9E78()
{
  return MEMORY[0x189608D38]();
}

uint64_t sub_1884C9E84()
{
  return MEMORY[0x189608D60]();
}

uint64_t sub_1884C9E90()
{
  return MEMORY[0x189608D70]();
}

uint64_t sub_1884C9E9C()
{
  return MEMORY[0x189608D78]();
}

uint64_t sub_1884C9EA8()
{
  return MEMORY[0x189608D80]();
}

uint64_t sub_1884C9EB4()
{
  return MEMORY[0x189608D88]();
}

uint64_t sub_1884C9EC0()
{
  return MEMORY[0x189608DA8]();
}

uint64_t sub_1884C9ECC()
{
  return MEMORY[0x189608DB0]();
}

uint64_t sub_1884C9ED8()
{
  return MEMORY[0x18961B678]();
}

uint64_t sub_1884C9EE4()
{
  return MEMORY[0x18961B698]();
}

uint64_t sub_1884C9EF0()
{
  return MEMORY[0x18961B6D8]();
}

uint64_t sub_1884C9EFC()
{
  return MEMORY[0x18961B6F0]();
}

uint64_t sub_1884C9F08()
{
  return MEMORY[0x18961B700]();
}

uint64_t sub_1884C9F14()
{
  return MEMORY[0x18961B710]();
}

uint64_t sub_1884C9F20()
{
  return MEMORY[0x18961B730]();
}

uint64_t sub_1884C9F2C()
{
  return MEMORY[0x18961B738]();
}

uint64_t sub_1884C9F38()
{
  return MEMORY[0x18961B748]();
}

uint64_t sub_1884C9F44()
{
  return MEMORY[0x18961B780]();
}

uint64_t sub_1884C9F50()
{
  return MEMORY[0x18961B790]();
}

uint64_t sub_1884C9F5C()
{
  return MEMORY[0x18961B7A0]();
}

uint64_t sub_1884C9F68()
{
  return MEMORY[0x18961B7B8]();
}

uint64_t sub_1884C9F74()
{
  return MEMORY[0x18961B7C8]();
}

uint64_t sub_1884C9F80()
{
  return MEMORY[0x18961B808]();
}

uint64_t sub_1884C9F8C()
{
  return MEMORY[0x18961B818]();
}

uint64_t sub_1884C9F98()
{
  return MEMORY[0x18961B830]();
}

uint64_t sub_1884C9FA4()
{
  return MEMORY[0x189607058]();
}

uint64_t sub_1884C9FB0()
{
  return MEMORY[0x189607068]();
}

uint64_t sub_1884C9FBC()
{
  return MEMORY[0x189607070]();
}

uint64_t sub_1884C9FC8()
{
  return MEMORY[0x189617818]();
}

uint64_t sub_1884C9FD4()
{
  return MEMORY[0x189617838]();
}

uint64_t sub_1884C9FE0()
{
  return MEMORY[0x1896178C0]();
}

uint64_t sub_1884C9FEC()
{
  return MEMORY[0x1896179F8]();
}

uint64_t sub_1884C9FF8()
{
  return MEMORY[0x189617A00]();
}

uint64_t sub_1884CA004()
{
  return MEMORY[0x189617B30]();
}

uint64_t sub_1884CA010()
{
  return MEMORY[0x189617B58]();
}

uint64_t sub_1884CA01C()
{
  return MEMORY[0x189617B60]();
}

uint64_t sub_1884CA028()
{
  return MEMORY[0x189617B68]();
}

uint64_t sub_1884CA034()
{
  return MEMORY[0x189617C20]();
}

uint64_t sub_1884CA040()
{
  return MEMORY[0x1896070D0]();
}

uint64_t sub_1884CA04C()
{
  return MEMORY[0x1896070E0]();
}

uint64_t sub_1884CA058()
{
  return MEMORY[0x1896070F0]();
}

uint64_t sub_1884CA064()
{
  return MEMORY[0x189607108]();
}

uint64_t sub_1884CA070()
{
  return MEMORY[0x189607110]();
}

uint64_t sub_1884CA07C()
{
  return MEMORY[0x189607130]();
}

uint64_t sub_1884CA088()
{
  return MEMORY[0x189607158]();
}

uint64_t sub_1884CA094()
{
  return MEMORY[0x189607180]();
}

uint64_t sub_1884CA0A0()
{
  return MEMORY[0x189617C90]();
}

uint64_t sub_1884CA0AC()
{
  return MEMORY[0x189617CB0]();
}

uint64_t sub_1884CA0B8()
{
  return MEMORY[0x189617D80]();
}

uint64_t sub_1884CA0C4()
{
  return MEMORY[0x189617DD8]();
}

uint64_t sub_1884CA0D0()
{
  return MEMORY[0x189617E20]();
}

uint64_t sub_1884CA0DC()
{
  return MEMORY[0x189617E40]();
}

uint64_t sub_1884CA0E8()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_1884CA0F4()
{
  return MEMORY[0x189617EB0]();
}

uint64_t sub_1884CA100()
{
  return MEMORY[0x189617EB8]();
}

uint64_t sub_1884CA10C()
{
  return MEMORY[0x189617ED0]();
}

uint64_t sub_1884CA118()
{
  return MEMORY[0x189617ED8]();
}

uint64_t sub_1884CA124()
{
  return MEMORY[0x189617EE0]();
}

uint64_t sub_1884CA130()
{
  return MEMORY[0x189617F48]();
}

uint64_t sub_1884CA13C()
{
  return MEMORY[0x189618040]();
}

uint64_t sub_1884CA148()
{
  return MEMORY[0x189618068]();
}

uint64_t sub_1884CA154()
{
  return MEMORY[0x189618070]();
}

uint64_t sub_1884CA160()
{
  return MEMORY[0x189618078]();
}

uint64_t sub_1884CA16C()
{
  return MEMORY[0x1896180D0]();
}

uint64_t sub_1884CA178()
{
  return MEMORY[0x189618220]();
}

uint64_t sub_1884CA184()
{
  return MEMORY[0x189618230]();
}

uint64_t sub_1884CA190()
{
  return MEMORY[0x189618248]();
}

uint64_t sub_1884CA19C()
{
  return MEMORY[0x189618250]();
}

uint64_t sub_1884CA1A8()
{
  return MEMORY[0x1896182A8]();
}

uint64_t sub_1884CA1B4()
{
  return MEMORY[0x1896182B0]();
}

uint64_t sub_1884CA1C0()
{
  return MEMORY[0x1896071C8]();
}

uint64_t sub_1884CA1CC()
{
  return MEMORY[0x1896071D8]();
}

uint64_t sub_1884CA1D8()
{
  return MEMORY[0x1896071E8]();
}

uint64_t sub_1884CA1E4()
{
  return MEMORY[0x189618378]();
}

uint64_t sub_1884CA1F0()
{
  return MEMORY[0x189618390]();
}

uint64_t sub_1884CA1FC()
{
  return MEMORY[0x189618410]();
}

uint64_t sub_1884CA208()
{
  return MEMORY[0x189607258]();
}

uint64_t sub_1884CA214()
{
  return MEMORY[0x189618828]();
}

uint64_t sub_1884CA220()
{
  return MEMORY[0x189618848]();
}

uint64_t sub_1884CA22C()
{
  return MEMORY[0x189618890]();
}

uint64_t sub_1884CA238()
{
  return MEMORY[0x189618950]();
}

uint64_t sub_1884CA244()
{
  return MEMORY[0x18961D208]();
}

uint64_t sub_1884CA250()
{
  return MEMORY[0x18961D218]();
}

uint64_t sub_1884CA25C()
{
  return MEMORY[0x18961D230]();
}

uint64_t sub_1884CA268()
{
  return MEMORY[0x18961D240]();
}

uint64_t sub_1884CA274()
{
  return MEMORY[0x18961D250]();
}

uint64_t sub_1884CA280()
{
  return MEMORY[0x18961B838]();
}

uint64_t sub_1884CA28C()
{
  return MEMORY[0x18961B858]();
}

uint64_t sub_1884CA298()
{
  return MEMORY[0x18961B860]();
}

uint64_t sub_1884CA2A4()
{
  return MEMORY[0x18961B868]();
}

uint64_t sub_1884CA2B0()
{
  return MEMORY[0x18961B870]();
}

uint64_t sub_1884CA2BC()
{
  return MEMORY[0x18961B878]();
}

uint64_t sub_1884CA2C8()
{
  return MEMORY[0x18961B880]();
}

uint64_t sub_1884CA2D4()
{
  return MEMORY[0x1896072C0]();
}

uint64_t sub_1884CA2E0()
{
  return MEMORY[0x18961B8A0]();
}

uint64_t sub_1884CA2EC()
{
  return MEMORY[0x18961B8D8]();
}

uint64_t sub_1884CA2F8()
{
  return MEMORY[0x18961B8E0]();
}

uint64_t sub_1884CA304()
{
  return MEMORY[0x18961B918]();
}

uint64_t sub_1884CA310()
{
  return MEMORY[0x18961B940]();
}

uint64_t sub_1884CA31C()
{
  return MEMORY[0x18961B960]();
}

uint64_t sub_1884CA328()
{
  return MEMORY[0x18961B968]();
}

uint64_t sub_1884CA334()
{
  return MEMORY[0x18961B980]();
}

uint64_t sub_1884CA340()
{
  return MEMORY[0x18961B9A8]();
}

uint64_t sub_1884CA34C()
{
  return MEMORY[0x18961B9B0]();
}

uint64_t sub_1884CA358()
{
  return MEMORY[0x18961B9C0]();
}

uint64_t sub_1884CA364()
{
  return MEMORY[0x18961B9D0]();
}

uint64_t sub_1884CA370()
{
  return MEMORY[0x18961B9E0]();
}

uint64_t sub_1884CA37C()
{
  return MEMORY[0x18961B9E8]();
}

uint64_t sub_1884CA388()
{
  return MEMORY[0x18961B9F8]();
}

uint64_t sub_1884CA394()
{
  return MEMORY[0x18961BA00]();
}

uint64_t sub_1884CA3A0()
{
  return MEMORY[0x18961BA08]();
}

uint64_t sub_1884CA3AC()
{
  return MEMORY[0x189610F40]();
}

uint64_t sub_1884CA3B8()
{
  return MEMORY[0x18961BA58]();
}

uint64_t sub_1884CA3C4()
{
  return MEMORY[0x189610F48]();
}

uint64_t sub_1884CA3D0()
{
  return MEMORY[0x189610F50]();
}

uint64_t sub_1884CA3DC()
{
  return MEMORY[0x189610F58]();
}

uint64_t sub_1884CA3E8()
{
  return MEMORY[0x18961BAE8]();
}

uint64_t sub_1884CA3F4()
{
  return MEMORY[0x189610F60]();
}

uint64_t sub_1884CA400()
{
  return MEMORY[0x18961D288]();
}

uint64_t sub_1884CA40C()
{
  return MEMORY[0x189618AB8]();
}

uint64_t sub_1884CA418()
{
  return MEMORY[0x189618AC0]();
}

uint64_t sub_1884CA424()
{
  return MEMORY[0x189618CB0]();
}

uint64_t sub_1884CA430()
{
  return MEMORY[0x189618D30]();
}

uint64_t sub_1884CA43C()
{
  return MEMORY[0x189618D50]();
}

uint64_t sub_1884CA448()
{
  return MEMORY[0x189607338]();
}

uint64_t sub_1884CA454()
{
  return MEMORY[0x189607360]();
}

uint64_t sub_1884CA460()
{
  return MEMORY[0x189618ED0]();
}

uint64_t sub_1884CA46C()
{
  return MEMORY[0x189618EE0]();
}

uint64_t sub_1884CA478()
{
  return MEMORY[0x189619010]();
}

uint64_t sub_1884CA484()
{
  return MEMORY[0x189619018]();
}

uint64_t sub_1884CA490()
{
  return MEMORY[0x189619028]();
}

uint64_t sub_1884CA49C()
{
  return MEMORY[0x1896190B0]();
}

uint64_t sub_1884CA4A8()
{
  return MEMORY[0x1896190C8]();
}

uint64_t sub_1884CA4B4()
{
  return MEMORY[0x1896190D0]();
}

uint64_t sub_1884CA4C0()
{
  return MEMORY[0x189619100]();
}

uint64_t sub_1884CA4CC()
{
  return MEMORY[0x1896191C0]();
}

uint64_t sub_1884CA4D8()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_1884CA4E4()
{
  return MEMORY[0x1896191F0]();
}

uint64_t sub_1884CA4F0()
{
  return MEMORY[0x189619300]();
}

uint64_t sub_1884CA4FC()
{
  return MEMORY[0x189619338]();
}

uint64_t sub_1884CA508()
{
  return MEMORY[0x189619378]();
}

uint64_t sub_1884CA514()
{
  return MEMORY[0x1896193A0]();
}

uint64_t sub_1884CA520()
{
  return MEMORY[0x189619440]();
}

uint64_t sub_1884CA52C()
{
  return MEMORY[0x1896194A0]();
}

uint64_t sub_1884CA538()
{
  return MEMORY[0x1896194C0]();
}

uint64_t sub_1884CA544()
{
  return MEMORY[0x1896194D0]();
}

uint64_t sub_1884CA550()
{
  return MEMORY[0x1896194D8]();
}

uint64_t sub_1884CA55C()
{
  return MEMORY[0x1896194F8]();
}

uint64_t sub_1884CA568()
{
  return MEMORY[0x189619500]();
}

uint64_t sub_1884CA574()
{
  return MEMORY[0x189619510]();
}

uint64_t sub_1884CA580()
{
  return MEMORY[0x189619530]();
}

uint64_t sub_1884CA58C()
{
  return MEMORY[0x189619538]();
}

uint64_t sub_1884CA598()
{
  return MEMORY[0x189619660]();
}

uint64_t sub_1884CA5A4()
{
  return MEMORY[0x1896197B8]();
}

uint64_t sub_1884CA5B0()
{
  return MEMORY[0x189619810]();
}

uint64_t sub_1884CA5BC()
{
  return MEMORY[0x189619820]();
}

uint64_t sub_1884CA5C8()
{
  return MEMORY[0x189619828]();
}

uint64_t sub_1884CA5D4()
{
  return MEMORY[0x1896198A0]();
}

uint64_t sub_1884CA5E0()
{
  return MEMORY[0x1896198A8]();
}

uint64_t sub_1884CA5EC()
{
  return MEMORY[0x189619930]();
}

uint64_t sub_1884CA5F8()
{
  return MEMORY[0x189619950]();
}

uint64_t sub_1884CA604()
{
  return MEMORY[0x189619960]();
}

uint64_t sub_1884CA610()
{
  return MEMORY[0x189619978]();
}

uint64_t sub_1884CA61C()
{
  return MEMORY[0x189619A08]();
}

uint64_t sub_1884CA628()
{
  return MEMORY[0x189619A40]();
}

uint64_t sub_1884CA634()
{
  return MEMORY[0x189619A68]();
}

uint64_t sub_1884CA640()
{
  return MEMORY[0x189619A70]();
}

uint64_t sub_1884CA64C()
{
  return MEMORY[0x189619A80]();
}

uint64_t sub_1884CA658()
{
  return MEMORY[0x189619A88]();
}

uint64_t sub_1884CA664()
{
  return MEMORY[0x189619AA0]();
}

uint64_t sub_1884CA670()
{
  return MEMORY[0x189619AB0]();
}

uint64_t sub_1884CA67C()
{
  return MEMORY[0x189619AF0]();
}

uint64_t sub_1884CA688()
{
  return MEMORY[0x189619AF8]();
}

uint64_t sub_1884CA694()
{
  return MEMORY[0x189619B00]();
}

uint64_t sub_1884CA6A0()
{
  return MEMORY[0x189619B08]();
}

uint64_t sub_1884CA6AC()
{
  return MEMORY[0x189619B18]();
}

uint64_t sub_1884CA6B8()
{
  return MEMORY[0x189619B28]();
}

uint64_t sub_1884CA6C4()
{
  return MEMORY[0x189619B30]();
}

uint64_t sub_1884CA6D0()
{
  return MEMORY[0x189619B38]();
}

uint64_t sub_1884CA6DC()
{
  return MEMORY[0x189619B40]();
}

uint64_t sub_1884CA6E8()
{
  return MEMORY[0x189619B50]();
}

uint64_t sub_1884CA6F4()
{
  return MEMORY[0x189619B58]();
}

uint64_t sub_1884CA700()
{
  return MEMORY[0x189619B70]();
}

uint64_t sub_1884CA70C()
{
  return MEMORY[0x189619B98]();
}

uint64_t sub_1884CA718()
{
  return MEMORY[0x189619BB0]();
}

uint64_t sub_1884CA724()
{
  return MEMORY[0x189619BB8]();
}

uint64_t sub_1884CA730()
{
  return MEMORY[0x189619BC8]();
}

uint64_t sub_1884CA73C()
{
  return MEMORY[0x189619BD8]();
}

uint64_t sub_1884CA748()
{
  return MEMORY[0x189619BE8]();
}

uint64_t sub_1884CA754()
{
  return MEMORY[0x189619BF0]();
}

uint64_t sub_1884CA760()
{
  return MEMORY[0x189619BF8]();
}

uint64_t sub_1884CA76C()
{
  return MEMORY[0x189619C00]();
}

uint64_t sub_1884CA778()
{
  return MEMORY[0x189619C10]();
}

uint64_t sub_1884CA784()
{
  return MEMORY[0x189619C20]();
}

uint64_t sub_1884CA790()
{
  return MEMORY[0x189619C38]();
}

uint64_t sub_1884CA79C()
{
  return MEMORY[0x189619C40]();
}

uint64_t sub_1884CA7A8()
{
  return MEMORY[0x189619C50]();
}

uint64_t sub_1884CA7B4()
{
  return MEMORY[0x189619C60]();
}

uint64_t sub_1884CA7C0()
{
  return MEMORY[0x189619C70]();
}

uint64_t sub_1884CA7CC()
{
  return MEMORY[0x189619CA8]();
}

uint64_t sub_1884CA7D8()
{
  return MEMORY[0x189619CC8]();
}

uint64_t sub_1884CA7E4()
{
  return MEMORY[0x189619CD0]();
}

uint64_t sub_1884CA7F0()
{
  return MEMORY[0x189619F40]();
}

uint64_t sub_1884CA7FC()
{
  return MEMORY[0x189619FC0]();
}

uint64_t sub_1884CA808()
{
  return MEMORY[0x189619FE0]();
}

uint64_t sub_1884CA814()
{
  return MEMORY[0x18961A040]();
}

uint64_t sub_1884CA820()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_1884CA82C()
{
  return MEMORY[0x18961A070]();
}

uint64_t sub_1884CA838()
{
  return MEMORY[0x18961A0A0]();
}

uint64_t sub_1884CA844()
{
  return MEMORY[0x18961A0C8]();
}

uint64_t sub_1884CA850()
{
  return MEMORY[0x18961A0F0]();
}

uint64_t sub_1884CA85C()
{
  return MEMORY[0x18961A120]();
}

uint64_t sub_1884CA868()
{
  return MEMORY[0x189610F68]();
}

uint64_t sub_1884CA874()
{
  return MEMORY[0x189610F70]();
}

uint64_t sub_1884CA880()
{
  return MEMORY[0x18961A318]();
}

uint64_t sub_1884CA88C()
{
  return MEMORY[0x18961A3A0]();
}

uint64_t sub_1884CA898()
{
  return MEMORY[0x1896073A8]();
}

uint64_t sub_1884CA8A4()
{
  return MEMORY[0x1896073B8]();
}

uint64_t sub_1884CA8B0()
{
  return MEMORY[0x1896073C0]();
}

uint64_t sub_1884CA8BC()
{
  return MEMORY[0x189610F78]();
}

uint64_t sub_1884CA8C8()
{
  return MEMORY[0x189610F80]();
}

uint64_t sub_1884CA8D4()
{
  return MEMORY[0x189610F88]();
}

uint64_t sub_1884CA8E0()
{
  return MEMORY[0x189610F90]();
}

uint64_t sub_1884CA8EC()
{
  return MEMORY[0x189610F98]();
}

uint64_t sub_1884CA8F8()
{
  return MEMORY[0x189610FA0]();
}

uint64_t sub_1884CA904()
{
  return MEMORY[0x189610FA8]();
}

uint64_t sub_1884CA910()
{
  return MEMORY[0x189610FB0]();
}

uint64_t sub_1884CA91C()
{
  return MEMORY[0x189610FB8]();
}

uint64_t sub_1884CA928()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_1884CA934()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t sub_1884CA940()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t sub_1884CA94C()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_1884CA958()
{
  return MEMORY[0x1896073F8]();
}

uint64_t sub_1884CA964()
{
  return MEMORY[0x18961A668]();
}

uint64_t sub_1884CA970()
{
  return MEMORY[0x18961A678]();
}

uint64_t sub_1884CA97C()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_1884CA988()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_1884CA994()
{
  return MEMORY[0x18961A6B8]();
}

uint64_t sub_1884CA9A0()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t sub_1884CA9AC()
{
  return MEMORY[0x18961A6C8]();
}

uint64_t sub_1884CA9B8()
{
  return MEMORY[0x18961A788]();
}

uint64_t sub_1884CA9C4()
{
  return MEMORY[0x18961A940]();
}

uint64_t sub_1884CA9D0()
{
  return MEMORY[0x18961A950]();
}

uint64_t sub_1884CA9DC()
{
  return MEMORY[0x18961A968]();
}

uint64_t sub_1884CA9E8()
{
  return MEMORY[0x18961A978]();
}

uint64_t sub_1884CA9F4()
{
  return MEMORY[0x18961AF60]();
}

uint64_t sub_1884CAA00()
{
  return MEMORY[0x18961AF68]();
}

uint64_t sub_1884CAA0C()
{
  return MEMORY[0x18961AF88]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1896038A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t CryptoHKDF()
{
  return MEMORY[0x18960EAB0]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x189607C80](*(void *)&mainPort, *(void *)&options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1896082F0](*(void *)&iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x189608360](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetParentEntry( io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1896084D0](*(void *)&entry, plane, parent);
}

kern_return_t IOServiceGetMatchingServices( mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x189608578](*(void *)&mainPort, matching, existing);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F8]();
}

uint64_t NEVirtualInterfaceAddAddress()
{
  return MEMORY[0x18960AEB0]();
}

uint64_t NEVirtualInterfaceCopyName()
{
  return MEMORY[0x18960AEB8]();
}

uint64_t NEVirtualInterfaceCopyNexusInstances()
{
  return MEMORY[0x18960AEC0]();
}

uint64_t NEVirtualInterfaceCopyStatistics()
{
  return MEMORY[0x18960AEC8]();
}

uint64_t NEVirtualInterfaceCreateNexusExtendedWithOptions()
{
  return MEMORY[0x18960AED0]();
}

uint64_t NEVirtualInterfaceCreateWithOptions()
{
  return MEMORY[0x18960AED8]();
}

uint64_t NEVirtualInterfaceInvalidate()
{
  return MEMORY[0x18960AEE0]();
}

uint64_t NEVirtualInterfaceReadyToReadMultiple()
{
  return MEMORY[0x18960AEE8]();
}

uint64_t NEVirtualInterfaceSetDelegateInterface()
{
  return MEMORY[0x18960AEF0]();
}

uint64_t NEVirtualInterfaceSetMTU()
{
  return MEMORY[0x18960AEF8]();
}

uint64_t NEVirtualInterfaceSetMaxPendingPackets()
{
  return MEMORY[0x18960AF00]();
}

uint64_t NEVirtualInterfaceSetRankNever()
{
  return MEMORY[0x18960AF08]();
}

uint64_t NEVirtualInterfaceSetReadAutomatically()
{
  return MEMORY[0x18960AF10]();
}

uint64_t NEVirtualInterfaceSetReadMultipleIPPacketsHandler()
{
  return MEMORY[0x18960AF18]();
}

uint64_t NEVirtualInterfaceUpdateAdHocService()
{
  return MEMORY[0x18960AF20]();
}

uint64_t NEVirtualInterfaceWriteMultipleIPPackets()
{
  return MEMORY[0x18960AF28]();
}

uint64_t NWCreateDispatchDataFromNSData()
{
  return MEMORY[0x189608DC0]();
}

uint64_t NWCreateNSDataFromDispatchData()
{
  return MEMORY[0x189608DC8]();
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return (CFStringRef)MEMORY[0x18960C190](store, nameEncoding);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x18960B288](certificate);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x18960B3D0]();
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x18960B3E8]();
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x18960B458](key);
}

uint64_t SecKeyCopySubjectPublicKeyInfo()
{
  return MEMORY[0x18960B468]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x18960B4B0](parameters, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x18960B5F0](rnd, count, bytes);
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x18960EF28]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x18961B048]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x18961B058]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cced25519_make_key_pair()
{
  return MEMORY[0x1895F9CE8]();
}

uint64_t ccrng()
{
  return MEMORY[0x1895FA120]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1895FA290]();
}

int close(int a1)
{
  return MEMORY[0x1895FA588](*(void *)&a1);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1895FB7C8](*(void *)&a1, a2);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC180](*(void *)&token);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C8](name, out_token, queue, handler);
}

uint64_t nw_channel_close()
{
  return MEMORY[0x1896090D8]();
}

uint64_t nw_channel_create_with_attributes()
{
  return MEMORY[0x1896090E0]();
}

uint64_t nw_channel_get_protocol_handler()
{
  return MEMORY[0x189609108]();
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata( nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x189609198](connection, definition);
}

uint64_t nw_connection_receive_multiple()
{
  return MEMORY[0x1896092A0]();
}

uint64_t nw_connection_write_multiple()
{
  return MEMORY[0x189609378]();
}

uint64_t nw_context_activate()
{
  return MEMORY[0x189609400]();
}

uint64_t nw_context_create()
{
  return MEMORY[0x189609428]();
}

uint64_t nw_context_set_isolate_protocol_stack()
{
  return MEMORY[0x189609470]();
}

uint64_t nw_context_set_scheduling_mode()
{
  return MEMORY[0x189609488]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x189609628]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x189609640]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x189609658]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x1896096A0]();
}

uint64_t nw_frame_collapse()
{
  return MEMORY[0x1896096B8]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x1896096D8]();
}

uint64_t nw_frame_unclaim()
{
  return MEMORY[0x189609740]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x189609758]();
}

nw_protocol_definition_t nw_protocol_copy_quic_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x18960A000]();
}

uint64_t nw_protocol_create()
{
  return MEMORY[0x18960A030]();
}

uint64_t nw_protocol_register()
{
  return MEMORY[0x18960A4C8]();
}

uint64_t nw_queue_context_async_if_needed()
{
  return MEMORY[0x18960A5F8]();
}

uint16_t nw_quic_get_stream_usable_datagram_frame_size(nw_protocol_metadata_t metadata)
{
  return MEMORY[0x18960A8D0](metadata);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1896166B0](object, key);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1895FC6A8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1895FC6D8]();
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return (sec_identity_t)MEMORY[0x18960BEE8](identity);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0A8](__dst, __source, __size);
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x18961B0E8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x18961B0F0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x18961B160]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x18961B168]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x18961B188]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x18961B190]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x18961B1A8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x18961B1D8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x18961B1F0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x18961B220]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x18961B248]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x18961B250]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x18961B258]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x18961B260]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x18961B2A0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x18961B2A8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x18961B2C0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x18961B2D0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x18961B2E0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x18961B2E8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x18961B2F8]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x18961B340]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x18961B348]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x18961B358]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x18961B368]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x18961B378]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x18961B3A0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x18961B3A8]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x18961B3C0]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x18961B478]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x18961B480]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x18961B488]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x18961B490]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x18961B498]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x18961B4A0]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x18961B4A8]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x18961B4B0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x18961B4D0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x18961B4F0]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x18961B4F8]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x18961B500]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x18961B520]();
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1895FD958](endpoint);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1895FDD68](connection);
}

uint64_t xpc_remote_connection_get_remote_service_version()
{
  return MEMORY[0x189612058]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t objc_msgSend_initiateWirelessPairingSessionWithQueue_completionHandler_customPinHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initiateWirelessPairingSessionWithQueue_completionHandler_customPinHandler_);
}
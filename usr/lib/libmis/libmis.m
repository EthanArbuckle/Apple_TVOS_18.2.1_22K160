uint64_t sub_18404CBB8()
{
  uint64_t v0;
  v0 = sub_18406FE20();
  sub_18404D0B8(v0, qword_18C671E58);
  sub_18404CC18(v0, (uint64_t)qword_18C671E58);
  return sub_18406FDD8();
}

uint64_t sub_18404CC18(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_18404CC30(char a1)
{
  v2 = v1;
  id v4 = objc_allocWithZone(v1);
  if (qword_18C671330 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_18406FE20();
  sub_18404CC18(v5, (uint64_t)qword_18C671E58);
  v6 = (void *)sub_18406FDE4();
  v9.receiver = v4;
  v9.super_class = v2;
  id v7 = objc_msgSendSuper2(&v9, sel_initWithDatabaseURL_asReadOnly_, v6, a1 & 1);

  return v7;
}

uint64_t type metadata accessor for UserTrustDB()
{
  return objc_opt_self();
}

uint64_t sub_18404CE80()
{
  v1 = v0;
  uint64_t v2 = sub_18406FE20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v6 = objc_msgSend(v1, sel_dbURL);
  sub_18406FDFC();

  sub_18406FE08();
  id v7 = *(void (**)(char *, uint64_t))(v3 + 8);
  v7(v5, v2);
  uint64_t v8 = sub_18406FF34();
  swift_bridgeObjectRelease();
  sub_18406F7D0((const char *)(v8 + 32));
  swift_release();
  id v9 = objc_msgSend(v1, sel_shmURL);
  sub_18406FDFC();

  sub_18406FE08();
  v7(v5, v2);
  uint64_t v10 = sub_18406FF34();
  swift_bridgeObjectRelease();
  sub_18406F7D0((const char *)(v10 + 32));
  swift_release();
  id v11 = objc_msgSend(v1, sel_walURL);
  sub_18406FDFC();

  sub_18406FE08();
  v7(v5, v2);
  uint64_t v12 = sub_18406FF34();
  swift_bridgeObjectRelease();
  sub_18406F7D0((const char *)(v12 + 32));
  return swift_release();
}

id sub_18404D084()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserTrustDB();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t *sub_18404D0B8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }

  return a2;
}

uint64_t sub_18404D0F8(uint64_t a1, unint64_t a2)
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

uint64_t sub_18404D13C(uint64_t a1, unint64_t a2)
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

uint64_t sub_18404D180(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = 0u;
  uint64_t v6 = v5 + 16;
  *(_OWORD *)(v5 + 32) = 0u;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_184055DA0(0xD000000000000046LL, 0x8000000184071450LL, (uint64_t)sub_18404D7F8, v7, (uint64_t)sub_18404D7FC, v5);
  swift_release();
  swift_release();
  if (!v2)
  {
    swift_beginAccess();
    uint64_t v6 = *(void *)(v5 + 16);
    sub_18404D8C4(v6, *(void *)(v5 + 24), *(void *)(v5 + 32), *(void *)(v5 + 40));
  }

  swift_release();
  return v6;
}

uint64_t sub_18404D2C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v14[0] = a2;
  uint64_t v3 = sub_18406FEBC();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x1895F8858](v3);
  sub_18404D8FC(&qword_18C671218);
  uint64_t v6 = swift_allocBox();
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for UserTrustedProfileEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v8, 1LL, 1LL, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL), a1, v3);
  unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))( v11 + v10,  (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v3);
  swift_retain();
  uint64_t v12 = v14[5];
  sub_184055DA0(0xD0000000000000BFLL, 0x80000001840714A0LL, (uint64_t)sub_18404D940, v11, (uint64_t)sub_18404D944, v6);
  swift_release();
  if (v12) {
    return swift_release_n();
  }
  swift_release();
  swift_beginAccess();
  sub_18404D96C(v8, v14[0]);
  return swift_release();
}

uint64_t sub_18404D464(uint64_t a1)
{
  uint64_t v2 = sub_18404D8FC(&qword_18C671228);
  MEMORY[0x1895F8858](v2);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_18404D8FC(&qword_18C671218);
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = swift_projectBox();
  uint64_t v8 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 192LL);
  v8(0LL);
  uint64_t v10 = v9;
  uint64_t v11 = v8(1LL);
  unint64_t v13 = v12;
  uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128LL))(2LL);
  uint64_t v16 = v14;
  unint64_t v17 = v15;
  if (v13)
  {
    sub_18404D13C(v14, v15);
    uint64_t v18 = nullsub_1(v11);
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    unint64_t v13 = v23;
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    sub_18404DCA4(v18, v20, v22, v13);
    __break(1u);
    goto LABEL_7;
  }

  uint64_t v18 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v22 = 0LL;
  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  sub_18406FEA4();
  swift_bridgeObjectRelease();
  uint64_t v24 = sub_18406FEBC();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48LL))(v4, 1LL, v24) != 1)
  {
    sub_18404DDA0((uint64_t)v4, v18, v20, v22, v13, (uint64_t)v7);
    sub_18404D0F8(v16, v17);
    uint64_t v25 = type metadata accessor for UserTrustedProfileEntry();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56LL))(v7, 0LL, 1LL, v25);
    uint64_t v26 = v28;
    swift_beginAccess();
    return sub_18404DCDC((uint64_t)v7, v26);
  }

LABEL_7:
  uint64_t result = sub_18404DCA4(v18, v20, v22, v13);
  __break(1u);
  return result;
}

    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }

  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

  __break(1u);
  return result;
}

      unint64_t v12 = 3892346881LL;

      goto LABEL_8;
    }

    unint64_t v12 = 3892346919LL;
  }

uint64_t sub_18404D690()
{
  return sub_18404D6CC((uint64_t)&unk_189DA95E0, 0xD000000000000026LL, 0x8000000184071560LL, (uint64_t)sub_18404D9D8);
}

uint64_t sub_18404D6CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = MEMORY[0x18961AFE8];
  uint64_t v9 = v8 + 16;
  swift_retain();
  sub_184055DA0(a2, a3, 0LL, 0LL, a4, v8);
  swift_release();
  if (!v4)
  {
    swift_beginAccess();
    uint64_t v9 = *(void *)(v8 + 16);
    swift_bridgeObjectRetain();
  }

  swift_release();
  return v9;
}

uint64_t sub_18404D7A4()
{
  return swift_deallocObject();
}

uint64_t sub_18404D7C8()
{
  if (v0[3])
  {
    swift_bridgeObjectRelease();
    sub_18404D0F8(v0[4], v0[5]);
  }

  return swift_deallocObject();
}

uint64_t sub_18404D7FC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)a1 + 192LL))(0LL);
  uint64_t v6 = v5;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128LL))(1LL);
  if (v6)
  {
    uint64_t v8 = nullsub_1(v4);
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    swift_beginAccess();
    uint64_t v15 = v2[2];
    uint64_t v16 = v2[3];
    uint64_t v17 = v2[4];
    unint64_t v18 = v2[5];
    v2[2] = v8;
    v2[3] = v10;
    v2[4] = v12;
    v2[5] = v14;
    return sub_18404DCA4(v15, v16, v17, v18);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_18404D8C4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return sub_18404D13C(a3, a4);
  }

  return result;
}

uint64_t sub_18404D8FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x186E2C0CC]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_18404D944(uint64_t a1)
{
  return sub_18404D464(a1);
}

uint64_t sub_18404D96C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18404D8FC(&qword_18C671218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_18404D9B4()
{
  return swift_deallocObject();
}

uint64_t sub_18404D9D8(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)a1 + 192LL))(0LL);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(v1 + 16);
    uint64_t v5 = sub_18406FF28();
    uint64_t v7 = v6;
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v8 = *v4;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v4 = v8;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_18404DBA0(0LL, *(void *)(v8 + 16) + 1LL, 1, (char *)v8);
      uint64_t v8 = result;
      *uint64_t v4 = result;
    }

    unint64_t v10 = *(void *)(v8 + 16);
    unint64_t v9 = *(void *)(v8 + 24);
    if (v10 >= v9 >> 1)
    {
      uint64_t result = (uint64_t)sub_18404DBA0((char *)(v9 > 1), v10 + 1, 1, (char *)v8);
      uint64_t v8 = result;
      *uint64_t v4 = result;
    }

    *(void *)(v8 + 16) = v10 + 1;
    unint64_t v11 = v8 + 16 * v10;
    *(void *)(v11 + 32) = v5;
    *(void *)(v11 + 40) = v7;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_18404DAE0()
{
  uint64_t v1 = sub_18406FEBC();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8LL))( v0 + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL)),  v1);
  return swift_deallocObject();
}

uint64_t sub_18404DB40(uint64_t a1)
{
  uint64_t v2 = sub_18406FEB0();
  (*(void (**)(uint64_t))(*(void *)a1 + 184LL))(v2);
  return swift_bridgeObjectRelease();
}

char *sub_18404DBA0(char *result, int64_t a2, char a3, char *a4)
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
    sub_18404D8FC(&qword_18C671220);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }

  else
  {
    unint64_t v10 = (char *)MEMORY[0x18961AFE8];
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

uint64_t sub_18404DCA4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return sub_18404D0F8(a3, a4);
  }

  return result;
}

uint64_t sub_18404DCDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18404D8FC(&qword_18C671218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_18404DD24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)a1 + 184LL))( *(void *)(v1 + 16),  *(void *)(v1 + 24),  1LL);
}

uint64_t type metadata accessor for UserTrustedProfileEntry()
{
  uint64_t result = qword_18C671338;
  if (!qword_18C671338) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_18404DDA0@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = sub_18406FEBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32LL))(a6, a1, v12);
  uint64_t result = type metadata accessor for UserTrustedProfileEntry();
  uint64_t v14 = (void *)(a6 + *(int *)(result + 20));
  *uint64_t v14 = a2;
  v14[1] = a3;
  v14[2] = a4;
  v14[3] = a5;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TrustedTeamIdEntry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TrustedTeamIdEntry(uint64_t a1)
{
  return sub_18404D0F8(*(void *)(a1 + 16), *(void *)(a1 + 24));
}

void *initializeWithCopy for TrustedTeamIdEntry(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  sub_18404D13C(v4, v5);
  a1[2] = v4;
  a1[3] = v5;
  return a1;
}

void *assignWithCopy for TrustedTeamIdEntry(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[2];
  unint64_t v4 = a2[3];
  sub_18404D13C(v5, v4);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  a1[2] = v5;
  a1[3] = v4;
  sub_18404D0F8(v6, v7);
  return a1;
}

__n128 initializeWithTake for TrustedTeamIdEntry(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for TrustedTeamIdEntry(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a1[2];
  unint64_t v6 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_18404D0F8(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedTeamIdEntry(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrustedTeamIdEntry(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TrustedTeamIdEntry()
{
  return &type metadata for TrustedTeamIdEntry;
}

uint64_t *sub_18404E008(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = sub_18406FEBC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    unint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    if (v11)
    {
      *uint64_t v9 = *v10;
      v9[1] = v11;
      uint64_t v12 = v10[2];
      unint64_t v13 = v10[3];
      swift_bridgeObjectRetain();
      sub_18404D13C(v12, v13);
      v9[2] = v12;
      v9[3] = v13;
    }

    else
    {
      __int128 v15 = *((_OWORD *)v10 + 1);
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v15;
    }
  }

  return a1;
}

uint64_t sub_18404E0C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18406FEBC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  int v5 = (void *)(a1 + *(int *)(a2 + 20));
  uint64_t result = v5[1];
  if (result)
  {
    swift_bridgeObjectRelease();
    return sub_18404D0F8(v5[2], v5[3]);
  }

  return result;
}

uint64_t sub_18404E124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18406FEBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  if (v10)
  {
    *uint64_t v8 = *v9;
    v8[1] = v10;
    uint64_t v11 = v9[2];
    unint64_t v12 = v9[3];
    swift_bridgeObjectRetain();
    sub_18404D13C(v11, v12);
    v8[2] = v11;
    v8[3] = v12;
  }

  else
  {
    __int128 v13 = *((_OWORD *)v9 + 1);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v13;
  }

  return a1;
}

uint64_t sub_18404E1B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18406FEBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void *)(a1 + v7 + 8);
  uint64_t v11 = v9[1];
  if (v10)
  {
    if (v11)
    {
      *uint64_t v8 = *v9;
      v8[1] = v9[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v12 = v9[2];
      unint64_t v13 = v9[3];
      sub_18404D13C(v12, v13);
      uint64_t v14 = v8[2];
      unint64_t v15 = v8[3];
      v8[2] = v12;
      v8[3] = v13;
      sub_18404D0F8(v14, v15);
    }

    else
    {
      sub_18404E2A8((uint64_t)v8);
      __int128 v18 = *((_OWORD *)v9 + 1);
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
      *((_OWORD *)v8 + 1) = v18;
    }
  }

  else if (v11)
  {
    *uint64_t v8 = *v9;
    v8[1] = v9[1];
    uint64_t v16 = v9[2];
    unint64_t v17 = v9[3];
    swift_bridgeObjectRetain();
    sub_18404D13C(v16, v17);
    v8[2] = v16;
    v8[3] = v17;
  }

  else
  {
    __int128 v19 = *((_OWORD *)v9 + 1);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v19;
  }

  return a1;
}

uint64_t sub_18404E2A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_18404E2D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18406FEBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  __int128 v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  return a1;
}

uint64_t sub_18404E33C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18406FEBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  if (!*(void *)(a1 + v7 + 8)) {
    goto LABEL_5;
  }
  uint64_t v10 = *(void *)(v9 + 8);
  if (!v10)
  {
    sub_18404E2A8(v8);
LABEL_5:
    __int128 v13 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v13;
    return a1;
  }

  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v8 + 16);
  unint64_t v12 = *(void *)(v8 + 24);
  *(_OWORD *)(v8 + 16) = *(_OWORD *)(v9 + 16);
  sub_18404D0F8(v11, v12);
  return a1;
}

uint64_t sub_18404E3D8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18404E3E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18406FEBC();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  int v10 = v9 - 1;
  if (v10 < 0) {
    int v10 = -1;
  }
  return (v10 + 1);
}

uint64_t sub_18404E470()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18404E47C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_18406FEBC();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  return result;
}

uint64_t sub_18404E4F8()
{
  uint64_t result = sub_18406FEBC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

BOOL sub_18404E568(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_18404E580()
{
  return sub_184070078();
}

uint64_t sub_18404E5C4()
{
  return sub_18407006C();
}

uint64_t sub_18404E5EC()
{
  return sub_184070078();
}

uint64_t sub_18404E63C(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(_BYTE *)(result + 16) = 1;
  *(void *)(result + 24) = a1;
  return result;
}

uint64_t sub_18404E674(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_18404E6C8(a1, a2);
  return v4;
}

void sub_18404E6C8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_18404E714()
{
  if (!BYTE6(v2))
  {
    char v5 = 1;
    goto LABEL_13;
  }

  if (sub_18406FE74() != 1)
  {
    char v5 = 0;
    goto LABEL_13;
  }

  if (v1)
  {
    if (v1 == 1)
    {
      LODWORD(v4) = HIDWORD(v3) - v3;
      if (!__OFSUB__(HIDWORD(v3), (_DWORD)v3))
      {
        uint64_t v4 = (int)v4;
        goto LABEL_11;
      }

      __break(1u);
LABEL_15:
      __break(1u);
      JUMPOUT(0x18404E918LL);
    }

    uint64_t v7 = *(void *)(v3 + 16);
    uint64_t v6 = *(void *)(v3 + 24);
    BOOL v8 = __OFSUB__(v6, v7);
    uint64_t v4 = v6 - v7;
    if (v8) {
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v4 = BYTE6(v2);
  }

LABEL_11:
  char v5 = 1;
  if (v4 == 9)
  {
    *(_BYTE *)(v0 + 16) = 1;
    uint64_t v9 = sub_18404E9B8(1LL, 8LL, v3, v2);
    sub_18404EA34(v9, v10);
    __asm { BR              X10 }
  }
  }

LABEL_13:
  sub_18404E954();
  swift_allocError();
  *unint64_t v12 = v5;
  swift_willThrow();
  sub_18404D0F8(v3, v2);
  type metadata accessor for LaunchWarningMark();
  swift_deallocPartialClassInstance();
  return v0;
}

    if (*(_BYTE *)(v3 + 17)) {
      uint64_t result = sub_1840577A0((void *)v3, a2);
    }
    goto LABEL_15;
  }

  if ((v4 & 0x1C00000000LL) == 0) {
    goto LABEL_15;
  }
  uint64_t result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if ((_DWORD)result) {
    goto LABEL_13;
  }
  char v5 = *(void *)(a2 + 240) | 0x1C00000000LL;
LABEL_11:
  *(void *)(a2 + 240) = v5;
LABEL_15:
  if (*(_BYTE *)(v3 + 16))
  {
    if (*(_BYTE *)(v3 + 17))
    {
      uint64_t result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!(_DWORD)result
        || (uint64_t result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !(_DWORD)result)
        || (uint64_t result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !(_DWORD)result))
      {
        *(void *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }

    if (*(_BYTE *)(v3 + 16) && *(_BYTE *)(v3 + 17))
    {
      uint64_t result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!(_DWORD)result) {
        *(void *)(a2 + 240) |= 0x6400000uLL;
      }
    }
  }

  return result;
}

  uint64_t v10 = 0LL;
LABEL_23:
  if (v10 == a2) {
    return 0LL;
  }
  else {
    return 589829LL;
  }
}

    __break(0x5519u);
  }

  return result;
}

  __break(0x5513u);
  return result;
}

unint64_t sub_18404E954()
{
  unint64_t result = qword_18C671230;
  if (!qword_18C671230)
  {
    unint64_t result = MEMORY[0x186E2C0D8](&unk_184073434, &type metadata for LaunchWarningMarkError);
    atomic_store(result, (unint64_t *)&qword_18C671230);
  }

  return result;
}

uint64_t type metadata accessor for LaunchWarningMark()
{
  return objc_opt_self();
}

uint64_t sub_18404E9B8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return ((uint64_t (*)(void))((char *)&loc_18404E9C8 + dword_18404EA24[a4 >> 62]))();
}

uint64_t sub_18404E9DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (BYTE6(a4) <= a2)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (a2 + 1 < a1)
  {
LABEL_7:
    __break(1u);
    JUMPOUT(0x18404EA24LL);
  }

  return sub_18406FE44();
}

void sub_18404EA34(uint64_t a1, uint64_t a2)
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[3] = MEMORY[0x189606D70];
  v3[4] = MEMORY[0x189606D58];
  v3[0] = a1;
  v3[1] = a2;
  unint64_t v2 = (char *)&loc_18404EA98 + dword_18404ECCC[sub_18404F1A8(v3, MEMORY[0x189606D70])[1] >> 62];
  __asm { BR              X10 }

uint64_t sub_18404EAA8()
{
  uint64_t v6 = v2;
  __int16 v7 = v3;
  char v8 = BYTE2(v3);
  char v9 = BYTE3(v3);
  char v10 = BYTE4(v3);
  char v11 = BYTE5(v3);
  sub_18404D13C(v1, v0);
  sub_18404F134(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  sub_18404D0F8(v1, v0);
  uint64_t v4 = v12;
  sub_18404F1CC((uint64_t)&v13);
  return v4;
}

uint64_t sub_18404ECDC(uint64_t a1, uint64_t a2)
{
  v8[3] = MEMORY[0x1896181D0];
  v8[4] = MEMORY[0x1896071B0];
  v8[0] = a1;
  v8[1] = a2;
  uint64_t v2 = sub_18404F1A8(v8, MEMORY[0x1896181D0]);
  uint64_t v3 = (_BYTE *)*v2;
  if (*v2 && (uint64_t v4 = (_BYTE *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      uint64_t v6 = sub_18404F1EC(v3, v4);
    }

    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      uint64_t v6 = sub_18404F2AC((uint64_t)v3, (uint64_t)v4);
    }

    else
    {
      uint64_t v6 = sub_18404F324((uint64_t)v3, (uint64_t)v4);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  sub_18404F1CC((uint64_t)v8);
  return v6;
}

uint64_t sub_18404ED94()
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  __int128 v6 = xmmword_1840733B0;
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v1 = sub_18404ECDC((uint64_t)&v5, (uint64_t)&v6);
  unint64_t v3 = v2;
  sub_18406FE68();
  sub_18404D0F8(v1, v3);
  return v6;
}

uint64_t sub_18404EE34()
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v0 + 112LL))();
  if (!v1)
  {
    uint64_t v4 = result;
    unint64_t v5 = v3;
    sub_184052F30();
    return sub_18404D0F8(v4, v5);
  }

  return result;
}

uint64_t sub_18404EEBC()
{
  uint64_t v2 = sub_184052C30();
  if (!v0)
  {
    uint64_t v4 = v3;
    if (v3 >> 60 == 15)
    {
      return 0LL;
    }

    else
    {
      uint64_t v5 = v2;
      type metadata accessor for LaunchWarningMark();
      uint64_t v1 = swift_allocObject();
      sub_18404E6C8(v5, v4);
    }
  }

  return v1;
}

uint64_t sub_18404EF5C()
{
  return swift_deallocClassInstance();
}

unint64_t sub_18404EF70()
{
  unint64_t result = qword_18C671238;
  if (!qword_18C671238)
  {
    unint64_t result = MEMORY[0x186E2C0D8](&unk_1840733CC, &type metadata for LaunchWarningMarkError);
    atomic_store(result, (unint64_t *)&qword_18C671238);
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for LaunchWarningMarkError(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchWarningMarkError(unsigned __int8 *a1, unsigned int a2)
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

        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for LaunchWarningMarkError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_18404F0A0 + 4 * byte_1840733C5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18404F0D4 + 4 * byte_1840733C0[v4]))();
}

uint64_t sub_18404F0D4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18404F0DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x18404F0E4LL);
  }
  return result;
}

uint64_t sub_18404F0F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x18404F0F8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_18404F0FC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18404F104(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18404F110(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_18404F118(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningMarkError()
{
  return &type metadata for LaunchWarningMarkError;
}

_BYTE *sub_18404F134@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0LL;
LABEL_4:
    unint64_t v5 = 0xC000000000000000LL;
    goto LABEL_5;
  }

  if (v4 <= 14)
  {
    unint64_t result = (_BYTE *)sub_18404F1EC(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }

  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (_BYTE *)sub_18404F2AC((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000LL;
  }

  else
  {
    unint64_t result = (_BYTE *)sub_18404F324((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000LL;
  }

LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_18404F1A8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_18404F1CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_18404F1EC(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_18404F2AC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0LL;
  }
  sub_18406FDB4();
  swift_allocObject();
  uint64_t result = sub_18406FD78();
  if (v2 < 0)
  {
    __break(1u);
  }

  else
  {
    sub_18406FE38();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = v2;
  }

  return result;
}

uint64_t sub_18404F324(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0LL;
  }
  sub_18406FDB4();
  swift_allocObject();
  uint64_t result = sub_18406FD78();
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

uint64_t sub_18404F3A4()
{
  uint64_t result = sub_18406FF94();
  qword_18C671E70 = result;
  return result;
}

uint64_t *sub_18404F408()
{
  if (qword_18C6714D0 != -1) {
    swift_once();
  }
  return &qword_18C671E70;
}

uint64_t sub_18404F448()
{
  uint64_t result = sub_18406FF94();
  qword_18C499068 = result;
  return result;
}

uint64_t *sub_18404F4B8()
{
  if (qword_18C499040 != -1) {
    swift_once();
  }
  return &qword_18C499068;
}

uint64_t sub_18404F4F8()
{
  return swift_deallocClassInstance();
}

uint64_t sub_18404F508()
{
  return swift_allocObject();
}

uint64_t type metadata accessor for Logger()
{
  return objc_opt_self();
}

unint64_t sub_18404F538()
{
  unint64_t result = qword_18C498D80;
  if (!qword_18C498D80)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C498D80);
  }

  return result;
}

uint64_t sub_18404F574(uint64_t a1)
{
  if (a1 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0LL;
  }
}

void *sub_18404F58C@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1LL) {
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

void sub_18404F5AC(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_18404F5B8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_18404F5C4(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_18404F5CC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_18404F5E0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_18404F5F4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_18404F608(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_18404F638@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_18404F664@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_18404F688(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_18404F69C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_18404F6B0(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_18404F6C4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_18404F6D8(void *a1)
{
  return (*v1 & ~*a1) == 0LL;
}

BOOL sub_18404F6EC(void *a1)
{
  return (*v1 & *a1) == 0LL;
}

BOOL sub_18404F700(void *a1)
{
  return (*a1 & ~*v1) == 0LL;
}

BOOL sub_18404F714()
{
  return *v0 == 0LL;
}

uint64_t sub_18404F724()
{
  return sub_18406FFB8();
}

void *sub_18404F73C(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_18404F750@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_18404F760(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_18404F76C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_18404F780@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_1840504FC(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t type metadata accessor for LaunchWarningDetails()
{
  uint64_t result = qword_18C6718E0;
  if (!qword_18C6718E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_18404F7F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18404D8FC(&qword_18C671240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_18404F840@<X0>( int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(_DWORD *)a8 = a1;
  *(void *)(a8 + 8) = a2;
  *(void *)(a8 + 16) = a3;
  char v12 = a5 & 1;
  uint64_t v13 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v14 = a8 + v13[6];
  uint64_t v15 = sub_18406FE98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32LL))(v14, a4, v15);
  *(_BYTE *)(a8 + v13[7]) = v12;
  *(void *)(a8 + v13[8]) = a6;
  return sub_18404F8DC(a7, a8 + v13[9]);
}

uint64_t sub_18404F8DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18404D8FC(&qword_18C671240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_18404F928()
{
  unint64_t result = qword_18C671248;
  if (!qword_18C671248)
  {
    unint64_t result = MEMORY[0x186E2C0D8](&unk_1840734E0, &type metadata for LaunchWarningReason);
    atomic_store(result, (unint64_t *)&qword_18C671248);
  }

  return result;
}

unint64_t sub_18404F970()
{
  unint64_t result = qword_18C671250;
  if (!qword_18C671250)
  {
    unint64_t result = MEMORY[0x186E2C0D8](&unk_184073680, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_18C671250);
  }

  return result;
}

unint64_t sub_18404F9B8()
{
  unint64_t result = qword_18C671258;
  if (!qword_18C671258)
  {
    unint64_t result = MEMORY[0x186E2C0D8](&unk_1840735B8, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_18C671258);
  }

  return result;
}

unint64_t sub_18404FA00()
{
  unint64_t result = qword_18C671260;
  if (!qword_18C671260)
  {
    unint64_t result = MEMORY[0x186E2C0D8](&unk_1840736B8, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_18C671260);
  }

  return result;
}

unint64_t sub_18404FA48()
{
  unint64_t result = qword_18C671268;
  if (!qword_18C671268)
  {
    unint64_t result = MEMORY[0x186E2C0D8](&unk_1840736E0, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_18C671268);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for LaunchWarningReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_18404FAD8 + 4 * byte_1840734D5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18404FB0C + 4 * asc_1840734D0[v4]))();
}

uint64_t sub_18404FB0C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18404FB14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x18404FB1CLL);
  }
  return result;
}

uint64_t sub_18404FB28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x18404FB30LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_18404FB34(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18404FB3C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningReason()
{
  return &type metadata for LaunchWarningReason;
}

ValueMetadata *type metadata accessor for LaunchWarningFlags()
{
  return &type metadata for LaunchWarningFlags;
}

void *sub_18404FB68(_DWORD *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v20 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    *a1 = *(_DWORD *)a2;
    uint64_t v7 = a2[1];
    unint64_t v8 = a2[2];
    sub_18404D13C(v7, v8);
    v4[1] = v7;
    v4[2] = v8;
    uint64_t v9 = a3[6];
    char v10 = (char *)v4 + v9;
    char v11 = (char *)a2 + v9;
    uint64_t v12 = sub_18406FE98();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v10, v11, v12);
    uint64_t v13 = a3[8];
    *((_BYTE *)v4 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *(void *)((char *)v4 + v13) = *(void *)((char *)a2 + v13);
    uint64_t v14 = a3[9];
    uint64_t v15 = (char *)v4 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = sub_18406FE20();
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1LL, v17))
    {
      uint64_t v19 = sub_18404D8FC(&qword_18C671240);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0LL, 1LL, v17);
    }
  }

  return v4;
}

uint64_t sub_18404FCAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_18406FE98();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 36);
  uint64_t v7 = sub_18406FE20();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  return result;
}

uint64_t sub_18404FD50(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16);
  sub_18404D13C(v6, v7);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_18406FE98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  uint64_t v12 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_18406FE20();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1LL, v16))
  {
    uint64_t v18 = sub_18404D8FC(&qword_18C671240);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0LL, 1LL, v16);
  }

  return a1;
}

uint64_t sub_18404FE68(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16);
  sub_18404D13C(v6, v7);
  uint64_t v8 = *(void *)(a1 + 8);
  unint64_t v9 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  sub_18404D0F8(v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_18406FE98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24LL))(v11, v12, v13);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v14 = a3[9];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = sub_18406FE20();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v12) = v19(v15, 1LL, v17);
  int v20 = v19(v16, 1LL, v17);
  if (!(_DWORD)v12)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 24))(v15, v16, v17);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }

  if (v20)
  {
LABEL_6:
    uint64_t v21 = sub_18404D8FC(&qword_18C671240);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, void *, uint64_t))(v18 + 16))(v15, v16, v17);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0LL, 1LL, v17);
  return a1;
}

uint64_t sub_18404FFD8(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_18406FE98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  uint64_t v11 = a3[9];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = sub_18406FE20();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1LL, v14))
  {
    uint64_t v16 = sub_18404D8FC(&qword_18C671240);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0LL, 1LL, v14);
  }

  return a1;
}

uint64_t sub_1840500E4(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_18404D0F8(v6, v7);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_18406FE98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40LL))(v9, v10, v11);
  uint64_t v12 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = sub_18406FE20();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v10) = v18(v14, 1LL, v16);
  int v19 = v18(v15, 1LL, v16);
  if (!(_DWORD)v10)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
    goto LABEL_6;
  }

  if (v19)
  {
LABEL_6:
    uint64_t v20 = sub_18404D8FC(&qword_18C671240);
    memcpy(v14, v15, *(void *)(*(void *)(v20 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0LL, 1LL, v16);
  return a1;
}

uint64_t sub_184050248()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_184050254(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_18406FE98();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }

  if ((_DWORD)a2 != 254)
  {
    uint64_t v8 = sub_18404D8FC(&qword_18C671240);
    uint64_t v7 = *(void *)(v8 - 8);
    uint64_t v9 = a3[9];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }

  unsigned int v10 = *(unsigned __int8 *)(a1 + a3[7]);
  if (v10 >= 2) {
    return v10 - 1;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1840502F4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_184050300(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_18406FE98();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a4[6];
  }

  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(a1 + a4[7]) = a2 + 1;
      return result;
    }

    uint64_t v10 = sub_18404D8FC(&qword_18C671240);
    uint64_t v9 = *(void *)(v10 - 8);
    uint64_t v11 = a4[9];
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

void sub_1840503A0()
{
  if (v0 <= 0x3F)
  {
    sub_184050454();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }

void sub_184050454()
{
  if (!qword_18C671270)
  {
    sub_18406FE20();
    unint64_t v0 = sub_18406FFA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_18C671270);
    }
  }

void type metadata accessor for SecCSDigestAlgorithm()
{
  if (!qword_18C671278)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_18C671278);
    }
  }

uint64_t sub_1840504FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0LL;
    }
    result |= v5;
    --v1;
  }

  while (v1);
  return result;
}

uint64_t sub_184050538()
{
  return 0LL;
}

uint64_t sub_184050540()
{
  uint64_t v0 = sub_18406FE20();
  sub_18404D0B8(v0, qword_18C671E78);
  sub_18404CC18(v0, (uint64_t)qword_18C671E78);
  return sub_18406FDD8();
}

id sub_1840505A0(char a1)
{
  char v2 = v1;
  id v4 = objc_allocWithZone(v1);
  if (qword_18C6718F0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_18406FE20();
  sub_18404CC18(v5, (uint64_t)qword_18C671E78);
  uint64_t v6 = (void *)sub_18406FDE4();
  v9.receiver = v4;
  v9.super_class = v2;
  id v7 = objc_msgSendSuper2(&v9, sel_initWithDatabaseURL_asReadOnly_, v6, a1 & 1);

  return v7;
}

uint64_t type metadata accessor for LaunchWarningDB()
{
  return objc_opt_self();
}

id sub_1840507F0()
{
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for LaunchWarningDB();
  id v1 = objc_msgSendSuper2(&v16, sel_setupSchema);
  if ((_DWORD)v1)
  {
    id v2 = objc_msgSend(v0, sel_readSetting_, @"databaseSchemaVersion");
    if (v2)
    {
      int v3 = v2;
      uint64_t v4 = sub_18406FF1C();
      unint64_t v6 = v5;
    }

    else
    {
      id v7 = (void *)sub_18406FEF8();
      objc_msgSend(v0, sel_executeQuery_withBind_withResults_, v7, 0, 0);

      uint64_t v8 = @"databaseSchemaVersion";
      uint64_t v4 = 49LL;
      unint64_t v6 = 0xE100000000000000LL;
      objc_super v9 = (void *)sub_18406FEF8();
      objc_msgSend(v0, sel_setSetting_toValue_, v8, v9);
    }

    if (v4 == 49 && v6 == 0xE100000000000000LL)
    {
      swift_bridgeObjectRelease();
    }

    else
    {
      char v11 = sub_18407000C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0) {
        return v1;
      }
    }

    uint64_t v12 = (void *)sub_18406FEF8();
    objc_msgSend(v0, sel_executeQuery_withBind_withResults_, v12, 0, 0);

    uint64_t v13 = @"databaseSchemaVersion";
    uint64_t v14 = (void *)sub_18406FEF8();
    objc_msgSend(v0, sel_setSetting_toValue_, v13, v14);
  }

  return v1;
}

id sub_184050B08()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchWarningDB();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_184050B3C()
{
  return 1LL;
}

uint64_t sub_184050B44()
{
  return sub_184070078();
}

uint64_t sub_184050B84()
{
  return sub_18407006C();
}

uint64_t sub_184050BA8()
{
  return sub_184070078();
}

uint64_t sub_184050BE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  sub_18404D8FC(&qword_18C671240);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  unint64_t v5 = &v36[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v3);
  id v7 = &v36[-v6];
  uint64_t v8 = sub_18406FE98();
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  uint64_t v9 = MEMORY[0x1895F8858](v8);
  char v11 = &v36[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v9);
  uint64_t v13 = &v36[-v12];
  uint64_t v14 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 160LL);
  unint64_t v15 = v14(0LL);
  uint64_t v39 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128LL))(1LL);
  unint64_t v40 = v16;
  uint64_t v17 = v14(2LL);
  uint64_t v18 = v14(3LL);
  (*(void (**)(uint64_t))(*(void *)a1 + 144LL))(4LL);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 192LL))(5LL);
  if ((v15 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }

  if (HIDWORD(v15))
  {
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v21 = v20;
  char v22 = sub_18404F574(v17);
  if (v22 == 2)
  {
    swift_bridgeObjectRelease();
    sub_18406FF7C();
    unint64_t v23 = (void *)*sub_18404F408();
    sub_18404D8FC(qword_18C498E18);
    uint64_t v24 = swift_allocObject();
    uint64_t v25 = MEMORY[0x18961A4C0];
    *(_OWORD *)(v24 + 16) = xmmword_1840737D0;
    uint64_t v26 = MEMORY[0x18961A510];
    *(void *)(v24 + 56) = v25;
    *(void *)(v24 + 64) = v26;
    *(void *)(v24 + 32) = v17;
    id v27 = v23;
    sub_18406FEC8();

    swift_bridgeObjectRelease();
    uint64_t v43 = v17;
    uint64_t v28 = sub_184070000();
    uint64_t v30 = v29;
    sub_184050F5C();
    swift_allocError();
    *(_OWORD *)uint64_t v31 = xmmword_1840737E0;
    *(void *)(v31 + 16) = v28;
    *(void *)(v31 + 24) = v30;
    *(_BYTE *)(v31 + 32) = 1;
    swift_willThrow();
    sub_18404D0F8(v39, v40);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v41 + 8))(v13, v42);
  }

  else
  {
    int v37 = v22 & 1;
    uint64_t v32 = sub_18406FE20();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56LL))(v7, 1LL, 1LL, v32);
    if (v21)
    {
      sub_18406FE14();
      swift_bridgeObjectRelease();
      sub_184051EB0((uint64_t)v7, &qword_18C671240);
      sub_18404F8DC((uint64_t)v5, (uint64_t)v7);
    }

    uint64_t v34 = v41;
    uint64_t v33 = v42;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v41 + 16))(v11, v13, v42);
    uint64_t v35 = nullsub_1(v18);
    sub_184050FDC((uint64_t)v7, (uint64_t)v5, &qword_18C671240);
    sub_18404F840(v15, v39, v40, (uint64_t)v11, v37, v35, (uint64_t)v5, v38);
    sub_184051EB0((uint64_t)v7, &qword_18C671240);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v34 + 8))(v13, v33);
  }

unint64_t sub_184050F5C()
{
  unint64_t result = qword_18C671280;
  if (!qword_18C671280)
  {
    unint64_t result = MEMORY[0x186E2C0D8](&unk_184073C50, &type metadata for DBError);
    atomic_store(result, (unint64_t *)&qword_18C671280);
  }

  return result;
}

uint64_t _s18LaunchWarningEntryVMa()
{
  uint64_t result = qword_18C671A80;
  if (!qword_18C671A80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_184050FDC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_18404D8FC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_184051020@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = swift_allocBox();
  uint64_t v7 = v6;
  uint64_t v8 = _s18LaunchWarningEntryVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v7, 1LL, 1LL, v8);
  sub_18406FFD0();
  sub_18406FF4C();
  sub_18406FF4C();
  sub_18406FF4C();
  swift_retain();
  swift_retain();
  sub_184055DA0(0LL, 0xE000000000000000LL, (uint64_t)sub_1840511CC, a1, (uint64_t)sub_184051380, v5);
  swift_bridgeObjectRelease();
  swift_release();
  if (v2) {
    return swift_release_n();
  }
  swift_release();
  swift_beginAccess();
  sub_184050FDC(v7, a2, &qword_18C671288);
  return swift_release();
}

uint64_t sub_1840511CC(uint64_t a1)
{
  uint64_t result = *(void *)(v1 + 24);
  if ((result & 0x8000000000000000LL) == 0) {
    return (*(uint64_t (**)(void))(*(void *)a1 + 152LL))();
  }
  __break(1u);
  return result;
}

uint64_t sub_184051208(uint64_t a1)
{
  uint64_t v3 = sub_18404D8FC(&qword_18C671288);
  MEMORY[0x1895F8858](v3);
  uint64_t v5 = (uint64_t *)((char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = type metadata accessor for LaunchWarningDetails();
  MEMORY[0x1895F8858](v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = swift_projectBox();
  uint64_t result = sub_184050BE4(a1, (uint64_t)v8);
  if (!v1)
  {
    char v11 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176LL))(6LL);
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 160LL))(7LL);
    if (result < 0)
    {
      __break(1u);
    }

    else
    {
      uint64_t v12 = result;
      uint64_t v13 = _s18LaunchWarningEntryVMa();
      sub_184051398( (uint64_t)v8,  (uint64_t)v5 + *(int *)(v13 + 20),  (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
      *uint64_t v5 = v12;
      *((_BYTE *)v5 + *(int *)(v13 + 24)) = v11 & 1;
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v5, 0LL, 1LL, v13);
      swift_beginAccess();
      return sub_184051EEC((uint64_t)v5, v9);
    }
  }

  return result;
}

uint64_t sub_184051380(uint64_t a1)
{
  return sub_184051208(a1);
}

uint64_t sub_184051398(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

unint64_t sub_1840513E0()
{
  unint64_t result = qword_18C671290;
  if (!qword_18C671290)
  {
    unint64_t result = MEMORY[0x186E2C0D8](&unk_18407380C, &type metadata for LaunchWarningDBError);
    atomic_store(result, (unint64_t *)&qword_18C671290);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for LaunchWarningDBError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for LaunchWarningDBError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1840514B8 + 4 * byte_184073800[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1840514D8 + 4 * byte_184073805[v4]))();
  }
}

_BYTE *sub_1840514B8(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1840514D8(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1840514E0(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1840514E8(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1840514F0(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1840514F8(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningDBError()
{
  return &type metadata for LaunchWarningDBError;
}

void *sub_184051514(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v23 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    *a1 = *a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    *(_DWORD *)((char *)a1 + v7) = *(_DWORD *)((char *)a2 + v7);
    uint64_t v10 = *(void *)((char *)a2 + v7 + 8);
    unint64_t v11 = *(void *)((char *)a2 + v7 + 16);
    sub_18404D13C(v10, v11);
    *((void *)v8 + 1) = v10;
    *((void *)v8 + 2) = v11;
    uint64_t v12 = (int *)type metadata accessor for LaunchWarningDetails();
    uint64_t v13 = v12[6];
    uint64_t v14 = &v8[v13];
    unint64_t v15 = &v9[v13];
    uint64_t v16 = sub_18406FE98();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16LL))(v14, v15, v16);
    v8[v12[7]] = v9[v12[7]];
    *(void *)&v8[v12[8]] = *(void *)&v9[v12[8]];
    uint64_t v17 = v12[9];
    uint64_t v18 = &v8[v17];
    int v19 = &v9[v17];
    uint64_t v20 = sub_18406FE20();
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1LL, v20))
    {
      uint64_t v22 = sub_18404D8FC(&qword_18C671240);
      memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0LL, 1LL, v20);
    }

    *((_BYTE *)v4 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }

  return v4;
}

uint64_t sub_184051690(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  sub_18404D0F8(*(void *)(v2 + 8), *(void *)(v2 + 16));
  uint64_t v3 = type metadata accessor for LaunchWarningDetails();
  uint64_t v4 = v2 + *(int *)(v3 + 24);
  uint64_t v5 = sub_18406FE98();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  uint64_t v6 = v2 + *(int *)(v3 + 36);
  uint64_t v7 = sub_18406FE20();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  return result;
}

void *sub_18405173C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)((char *)a1 + v6) = *(_DWORD *)((char *)a2 + v6);
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  unint64_t v10 = *(void *)((char *)a2 + v6 + 16);
  sub_18404D13C(v9, v10);
  *((void *)v7 + 1) = v9;
  *((void *)v7 + 2) = v10;
  unint64_t v11 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v12 = v11[6];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = sub_18406FE98();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16LL))(v13, v14, v15);
  v7[v11[7]] = v8[v11[7]];
  *(void *)&v7[v11[8]] = *(void *)&v8[v11[8]];
  uint64_t v16 = v11[9];
  uint64_t v17 = &v7[v16];
  uint64_t v18 = &v8[v16];
  uint64_t v19 = sub_18406FE20();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1LL, v19))
  {
    uint64_t v21 = sub_18404D8FC(&qword_18C671240);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0LL, 1LL, v19);
  }

  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_18405188C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)((char *)a1 + v6) = *(_DWORD *)((char *)a2 + v6);
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  unint64_t v10 = *(void *)((char *)a2 + v6 + 16);
  sub_18404D13C(v9, v10);
  uint64_t v11 = *((void *)v7 + 1);
  unint64_t v12 = *((void *)v7 + 2);
  *((void *)v7 + 1) = v9;
  *((void *)v7 + 2) = v10;
  sub_18404D0F8(v11, v12);
  uint64_t v13 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v14 = v13[6];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  uint64_t v17 = sub_18406FE98();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24LL))(v15, v16, v17);
  v7[v13[7]] = v8[v13[7]];
  *(void *)&v7[v13[8]] = *(void *)&v8[v13[8]];
  uint64_t v18 = v13[9];
  uint64_t v19 = &v7[v18];
  uint64_t v20 = &v8[v18];
  uint64_t v21 = sub_18406FE20();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  LODWORD(v7) = v23(v19, 1LL, v21);
  int v24 = v23(v20, 1LL, v21);
  if (!(_DWORD)v7)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 24))(v19, v20, v21);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_6;
  }

  if (v24)
  {
LABEL_6:
    uint64_t v25 = sub_18404D8FC(&qword_18C671240);
    memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0LL, 1LL, v21);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_184051A30(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)uint64_t v7 = *(_DWORD *)((char *)a2 + v6);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)((char *)a2 + v6 + 8);
  uint64_t v9 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v10 = v9[6];
  uint64_t v11 = &v7[v10];
  unint64_t v12 = &v8[v10];
  uint64_t v13 = sub_18406FE98();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32LL))(v11, v12, v13);
  v7[v9[7]] = v8[v9[7]];
  *(void *)&v7[v9[8]] = *(void *)&v8[v9[8]];
  uint64_t v14 = v9[9];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  uint64_t v17 = sub_18406FE20();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1LL, v17))
  {
    uint64_t v19 = sub_18404D8FC(&qword_18C671240);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0LL, 1LL, v17);
  }

  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_184051B74(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)uint64_t v7 = *(_DWORD *)((char *)a2 + v6);
  uint64_t v9 = *(void *)((char *)a1 + v6 + 8);
  unint64_t v10 = *((void *)v7 + 2);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)(v8 + 8);
  sub_18404D0F8(v9, v10);
  uint64_t v11 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v12 = v11[6];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = sub_18406FE98();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40LL))(v13, v14, v15);
  v7[v11[7]] = v8[v11[7]];
  *(void *)&v7[v11[8]] = *(void *)&v8[v11[8]];
  uint64_t v16 = v11[9];
  uint64_t v17 = &v7[v16];
  uint64_t v18 = &v8[v16];
  uint64_t v19 = sub_18406FE20();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  LODWORD(v7) = v21(v17, 1LL, v19);
  int v22 = v21(v18, 1LL, v19);
  if (!(_DWORD)v7)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v17, v18, v19);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_6;
  }

  if (v22)
  {
LABEL_6:
    uint64_t v23 = sub_18404D8FC(&qword_18C671240);
    memcpy(v17, v18, *(void *)(*(void *)(v23 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0LL, 1LL, v19);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_184051D0C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_184051D18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LaunchWarningDetails();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  }
  unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 2) {
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_184051DA8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_184051DB4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for LaunchWarningDetails();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))( a1 + *(int *)(a4 + 20),  a2,  a2,  result);
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  return result;
}

uint64_t sub_184051E30()
{
  uint64_t result = type metadata accessor for LaunchWarningDetails();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t sub_184051EB0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_18404D8FC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_184051EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18404D8FC(&qword_18C671288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_184051F34()
{
  staticCode[1] = *(SecStaticCodeRef *)MEMORY[0x1895F89C0];
  staticCode[0] = 0LL;
  uint64_t v0 = (const __CFURL *)sub_18406FDE4();
  OSStatus v1 = SecStaticCodeCreateWithPath(v0, 0, staticCode);

  if (v1 || !staticCode[0])
  {
    sub_18406FF7C();
    unint64_t v10 = (void *)*sub_18404F4B8();
    sub_18404D8FC(qword_18C498E18);
    uint64_t v11 = swift_allocObject();
    uint64_t v12 = MEMORY[0x18961A458];
    *(_OWORD *)(v11 + 16) = xmmword_184073910;
    uint64_t v13 = MEMORY[0x18961A4A0];
    *(void *)(v11 + 56) = v12;
    *(void *)(v11 + 64) = v13;
    *(_DWORD *)(v11 + 32) = v1;
    uint64_t v14 = v10;
    uint64_t v15 = sub_18406FE08();
    uint64_t v17 = v16;
    *(void *)(v11 + 96) = MEMORY[0x189617FA8];
    *(void *)(v11 + 104) = sub_1840525E0();
    *(void *)(v11 + 72) = v15;
    *(void *)(v11 + 80) = v17;
    sub_18406FEC8();

    swift_bridgeObjectRelease();
    sub_184052624();
    swift_allocError();
    *(_DWORD *)uint64_t v18 = v1;
    *(_BYTE *)(v18 + 4) = 0;
    swift_willThrow();
LABEL_28:

    return v14;
  }

  CFDictionaryRef information = 0LL;
  uint64_t v2 = staticCode[0];
  OSStatus v3 = SecCodeCopySigningInformation(v2, 0x21u, &information);
  if (v3 || (CFDictionaryRef v4 = information) == 0LL)
  {
    sub_18406FF7C();
    uint64_t v19 = (void *)*sub_18404F4B8();
    sub_18404D8FC(qword_18C498E18);
    uint64_t v14 = swift_allocObject();
    uint64_t v20 = MEMORY[0x18961A458];
    *(_OWORD *)(v14 + 16) = xmmword_184073910;
    uint64_t v21 = MEMORY[0x18961A4A0];
    *(void *)(v14 + 56) = v20;
    *(void *)(v14 + 64) = v21;
    *(_DWORD *)(v14 + 32) = v3;
    id v22 = v19;
    uint64_t v23 = sub_18406FE08();
    uint64_t v25 = v24;
    *(void *)(v14 + 96) = MEMORY[0x189617FA8];
    *(void *)(v14 + 104) = sub_1840525E0();
    *(void *)(v14 + 72) = v23;
    *(void *)(v14 + 80) = v25;
    sub_18406FEC8();

    swift_bridgeObjectRelease();
    sub_184052624();
    swift_allocError();
    *(_DWORD *)uint64_t v26 = v3;
    *(_BYTE *)(v26 + 4) = 0;
    swift_willThrow();
LABEL_27:

    goto LABEL_28;
  }

  *(void *)&__int128 v42 = *MEMORY[0x18960BB78];
  id v5 = (id)v42;
  uint64_t v6 = v4;
  id v7 = v5;
  uint64_t v8 = v6;
  sub_18404D8FC(&qword_18C6712A0);
  id v9 = -[__CFDictionary __swift_objectForKeyedSubscript:](v8, sel___swift_objectForKeyedSubscript_, sub_184070018());
  swift_unknownObjectRelease();
  if (v9)
  {
    sub_18406FFAC();
    swift_unknownObjectRelease();
  }

  else
  {
    __int128 v42 = 0u;
    __int128 v43 = 0u;
  }

  sub_184052668((uint64_t)&v42, (uint64_t)v44);
  if (!v45)
  {

    sub_1840526B0((uint64_t)v44);
LABEL_16:
    sub_18406FF7C();
    uint64_t v28 = (void *)*sub_18404F4B8();
    sub_18404D8FC(qword_18C498E18);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1840737D0;
    id v29 = v28;
    uint64_t v30 = sub_18406FE08();
    uint64_t v32 = v31;
    *(void *)(v14 + 56) = MEMORY[0x189617FA8];
    *(void *)(v14 + 64) = sub_1840525E0();
    *(void *)(v14 + 32) = v30;
    *(void *)(v14 + 40) = v32;
LABEL_26:
    sub_18406FEC8();

    swift_bridgeObjectRelease();
    sub_184052624();
    swift_allocError();
    *(_DWORD *)uint64_t v39 = 0;
    *(_BYTE *)(v39 + 4) = 1;
    swift_willThrow();

    goto LABEL_27;
  }

  sub_18404D8FC(&qword_18C6712B0);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_16;
  }

  id v27 = (id)*MEMORY[0x18960BB88];
  if (-[__CFDictionary __swift_objectForKeyedSubscript:](v8, sel___swift_objectForKeyedSubscript_, v27))
  {
    sub_18406FFAC();
    swift_unknownObjectRelease();
  }

  else
  {
    __int128 v42 = 0u;
    __int128 v43 = 0u;
  }

  sub_184052668((uint64_t)&v42, (uint64_t)v44);
  if (!v45)
  {

    swift_bridgeObjectRelease();
    sub_1840526B0((uint64_t)v44);
    goto LABEL_16;
  }

  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_16;
  }

  uint64_t v14 = v41;

  if (!*(void *)(v41 + 16) || (unint64_t v33 = sub_1840526F0(v41), (v34 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    sub_18406FF7C();
    uint64_t v35 = (void *)*sub_18404F4B8();
    sub_18404D8FC(qword_18C498E18);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1840737D0;
    id v29 = v35;
    uint64_t v36 = sub_18406FE08();
    uint64_t v38 = v37;
    *(void *)(v14 + 56) = MEMORY[0x189617FA8];
    *(void *)(v14 + 64) = sub_1840525E0();
    *(void *)(v14 + 32) = v36;
    *(void *)(v14 + 40) = v38;
    goto LABEL_26;
  }

  sub_18404D13C(*(void *)(*(void *)(v41 + 56) + 16 * v33), *(void *)(*(void *)(v41 + 56) + 16 * v33 + 8));

  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_1840525E0()
{
  unint64_t result = qword_18C498EA8;
  if (!qword_18C498EA8)
  {
    unint64_t result = MEMORY[0x186E2C0D8](MEMORY[0x189607190], MEMORY[0x189617FA8]);
    atomic_store(result, (unint64_t *)&qword_18C498EA8);
  }

  return result;
}

unint64_t sub_184052624()
{
  unint64_t result = qword_18C671298;
  if (!qword_18C671298)
  {
    unint64_t result = MEMORY[0x186E2C0D8](&unk_184073920, &type metadata for CodeSignatureError);
    atomic_store(result, (unint64_t *)&qword_18C671298);
  }

  return result;
}

uint64_t sub_184052668(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18404D8FC(&qword_18C6712A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1840526B0(uint64_t a1)
{
  uint64_t v2 = sub_18404D8FC(&qword_18C6712A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_1840526F0(unsigned int a1)
{
  uint64_t v3 = MEMORY[0x186E2B310](*(void *)(v1 + 40), a1, 4LL);
  return sub_1840529D0(a1, v3);
}

uint64_t initializeBufferWithCopyOfBuffer for CodeSignatureError(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CodeSignatureError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for CodeSignatureError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
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

  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_184052784(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1840527A0(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }

  else
  {
    *(_BYTE *)(result + 4) = 0;
  }

  return result;
}

ValueMetadata *type metadata accessor for CodeSignatureError()
{
  return &type metadata for CodeSignatureError;
}

uint64_t destroy for CDHashInfo(uint64_t a1)
{
  return sub_18404D0F8(*(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t _s3mis10CDHashInfoVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_18404D13C(v3, v4);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for CDHashInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_18404D13C(v3, v4);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  sub_18404D0F8(v5, v6);
  return a1;
}

__n128 initializeWithTake for CDHashInfo(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CDHashInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_18404D0F8(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CDHashInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xD && *(_BYTE *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CDHashInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 - 13;
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

ValueMetadata *type metadata accessor for CDHashInfo()
{
  return &type metadata for CDHashInfo;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_18405298C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

unint64_t sub_1840529D0(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }

  return result;
}

id sub_184052A6C()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for UserTrustDB();
  id v1 = objc_msgSendSuper2(&v7, sel_setupSchema);
  if ((_DWORD)v1)
  {
    id v2 = objc_msgSend(v0, sel_readSetting_, @"databaseSchemaVersion");
    if (!v2)
    {
      unsigned int v3 = (void *)sub_18406FEF8();
      objc_msgSend(v0, sel_executeQuery_withBind_withResults_, v3, 0, 0);

      uint64_t v4 = (void *)sub_18406FEF8();
      objc_msgSend(v0, sel_executeQuery_withBind_withResults_, v4, 0, 0);

      uint64_t v5 = @"databaseSchemaVersion";
      id v2 = (id)sub_18406FEF8();
      objc_msgSend(v0, sel_setSetting_toValue_, v5, v2);
    }
  }

  return v1;
}

void type metadata accessor for FileAttributeKey()
{
  if (!qword_18C498CF8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_18C498CF8);
    }
  }

uint64_t sub_184052C30()
{
  uint64_t result = sub_18406FDF0();
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t sub_184052C8C@<X0>(const char *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = sub_18406FD60();
  uint64_t v21 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858]();
  unint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_18406FF34();
  ssize_t v8 = getxattr(a1, (const char *)(v7 + 32), 0LL, 0LL, 0, 0);
  uint64_t v9 = swift_release();
  if (v8 < 0)
  {
    uint64_t result = MEMORY[0x186E2B19C](v9);
    if ((_DWORD)result == 93)
    {
      *a2 = xmmword_184073B90;
    }

    else
    {
      int v16 = result;
      uint64_t v17 = sub_18406FED4();
      if ((v17 & 0x100000000LL) != 0)
      {
        sub_184053AEC();
        swift_allocError();
        *uint64_t v19 = v16;
      }

      else
      {
        LODWORD(v22) = v17;
        sub_184053700(MEMORY[0x18961AFE8]);
        sub_184053B30(&qword_18C6712F0, (uint64_t (*)(uint64_t))MEMORY[0x189605FC8], MEMORY[0x189605FB0]);
        sub_18406FDC0();
        sub_18406FD54();
        (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
      }

      return swift_willThrow();
    }
  }

  else
  {
    *(void *)&__int128 v22 = sub_184053BC8(v8);
    *((void *)&v22 + 1) = v10;
    swift_bridgeObjectRetain();
    sub_184053C64((uint64_t)&v22);
    uint64_t v12 = v11;
    uint64_t result = swift_bridgeObjectRelease();
    if (v12 < 0)
    {
      int v14 = MEMORY[0x186E2B19C](result);
      uint64_t v15 = sub_18406FED4();
      if ((v15 & 0x100000000LL) != 0)
      {
        sub_184053AEC();
        swift_allocError();
        *uint64_t v18 = v14;
      }

      else
      {
        int v23 = v15;
        sub_184053700(MEMORY[0x18961AFE8]);
        sub_184053B30(&qword_18C6712F0, (uint64_t (*)(uint64_t))MEMORY[0x189605FC8], MEMORY[0x189605FB0]);
        sub_18406FDC0();
        sub_18406FD54();
        (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
      }

      swift_willThrow();
      return sub_18404D0F8(v22, *((unint64_t *)&v22 + 1));
    }

    else
    {
      *a2 = v22;
    }
  }

  return result;
}

uint64_t sub_184052F30()
{
  return sub_18406FDF0();
}

void sub_184052F6C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  v6[5] = *MEMORY[0x1895F89C0];
  sub_18406FD60();
  MEMORY[0x1895F8858]();
  uint64_t v5 = (char *)&loc_184052FF8 + dword_184053344[a3 >> 62];
  v6[1] = (char *)v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __asm { BR              X10 }

uint64_t sub_18405300C()
{
  *(void *)(v5 - 104) = v3;
  *(_WORD *)(v5 - 96) = v4;
  *(_BYTE *)(v5 - 94) = BYTE2(v4);
  *(_BYTE *)(v5 - 93) = BYTE3(v4);
  *(_BYTE *)(v5 - 92) = BYTE4(v4);
  *(_BYTE *)(v5 - 91) = BYTE5(v4);
  uint64_t v6 = sub_18406FF34();
  int v7 = setxattr(v2, (const char *)(v6 + 32), (const void *)(v5 - 104), BYTE6(v4), 0, 0);
  uint64_t result = swift_release();
  if (v7 < 0)
  {
    int v9 = MEMORY[0x186E2B19C](result);
    uint64_t v10 = sub_18406FED4();
    if ((v10 & 0x100000000LL) != 0)
    {
      sub_184053AEC();
      swift_allocError();
      *uint64_t v12 = v9;
    }

    else
    {
      *(_DWORD *)(v5 - 104) = v10;
      sub_184053700(MEMORY[0x18961AFE8]);
      sub_184053B30(&qword_18C6712F0, (uint64_t (*)(uint64_t))MEMORY[0x189605FC8], MEMORY[0x189605FB0]);
      uint64_t v11 = *(void *)(v5 - 120);
      sub_18406FDC0();
      sub_18406FD54();
      (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v11, v1);
    }

    return swift_willThrow();
  }

  return result;
}

uint64_t sub_184053354(uint64_t a1, uint64_t a2)
{
  return sub_18405341C(a1, a2, MEMORY[0x189617F88]);
}

uint64_t sub_184053360()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1840533A0()
{
  uint64_t v0 = sub_184070078();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_184053410(uint64_t a1, uint64_t a2)
{
  return sub_18405341C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1896070D8]);
}

uint64_t sub_18405341C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_18406FF1C();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_184053458(uint64_t a1, id *a2)
{
  uint64_t result = sub_18406FF04();
  *a2 = 0LL;
  return result;
}

uint64_t sub_1840534CC(uint64_t a1, id *a2)
{
  char v3 = sub_18406FF10();
  *a2 = 0LL;
  return v3 & 1;
}

uint64_t sub_184053548@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_18406FEF8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_184053588()
{
  uint64_t v0 = sub_18406FF1C();
  uint64_t v2 = v1;
  if (v0 == sub_18406FF1C() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_18407000C();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_184053610@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_18406FEF8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_184053654@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_18406FF1C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_18405367C()
{
  return sub_18406FFF4();
}

unint64_t sub_184053700(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  sub_18404D8FC(&qword_18C6712F8);
  uint64_t v2 = sub_18406FFE8();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }

  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_184053B70(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_184053828(v15, v16);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_184053BB8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1LL);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48LL;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_184053828(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_184070078();
  return sub_18405388C(a1, a2, v4);
}

unint64_t sub_18405388C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_18407000C() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if (((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_18407000C() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if ((sub_18407000C() & 1) != 0) {
              break;
            }
          }
        }
      }
    }
  }

  return i;
}

uint64_t sub_1840539D0@<X0>(const char *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_184052C8C(a1, a2);
}

void sub_1840539E8(uint64_t a1)
{
}

_DWORD *initializeBufferWithCopyOfBuffer for UtilitiesError(_DWORD *result, _DWORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UtilitiesError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for UtilitiesError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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

  *(_BYTE *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for UtilitiesError()
{
  return &type metadata for UtilitiesError;
}

uint64_t sub_184053A68()
{
  return sub_184053B30( &qword_18C6712D0,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_184073A60);
}

uint64_t sub_184053A94()
{
  return sub_184053B30( &qword_18C6712D8,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_184073A34);
}

uint64_t sub_184053AC0()
{
  return sub_184053B30( &qword_18C498CF0,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_184073AD0);
}

unint64_t sub_184053AEC()
{
  unint64_t result = qword_18C6712E8;
  if (!qword_18C6712E8)
  {
    unint64_t result = MEMORY[0x186E2C0D8](&unk_1840739A4, &type metadata for UtilitiesError);
    atomic_store(result, (unint64_t *)&qword_18C6712E8);
  }

  return result;
}

uint64_t sub_184053B30(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = MEMORY[0x186E2C0D8](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_184053B70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18404D8FC(&qword_18C671300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_184053BB8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_184053BC8(uint64_t result)
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
      sub_18406FDB4();
      swift_allocObject();
      sub_18406FD90();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_18406FE38();
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

void sub_184053C64(uint64_t a1)
{
  __asm { BR              X11 }

ssize_t sub_184053CCC@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, size_t size, uint64_t a6, uint64_t value, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  uint64_t v29 = v22;
  LOWORD(v30) = a1;
  BYTE2(v30) = BYTE2(a1);
  HIBYTE(v30) = BYTE3(a1);
  unsigned __int8 v31 = BYTE4(a1);
  unsigned __int8 v32 = BYTE5(a1);
  unsigned __int8 v33 = BYTE6(a1);
  uint64_t v25 = (const char *)(sub_18406FF34() + 32);
  swift_bridgeObjectRetain_n();
  ssize_t v26 = getxattr(v23, v25, &v29, v24, 0, 0);
  swift_bridgeObjectRelease_n();
  swift_release();
  unint64_t v27 = v30 | ((unint64_t)v31 << 32) | ((unint64_t)v32 << 40) | ((unint64_t)v33 << 48);
  *uint64_t v21 = v29;
  v21[1] = v27;
  return v26;
}

void sub_1840540AC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (void *)sub_18406FDE4();
  bundle = (__CFBundle *)_CFBundleCreateUnique();

  if (bundle)
  {
    CFURLRef v5 = CFBundleCopyExecutableURL(bundle);
    if (v5)
    {
      CFURLRef v6 = v5;
      sub_18406FDFC();
      sub_18406FF70();
      uint64_t v7 = (void *)*sub_18404F4B8();
      sub_18404D8FC(qword_18C498E18);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_1840737D0;
      id v9 = v7;
      uint64_t v10 = sub_18406FE08();
      uint64_t v12 = v11;
      *(void *)(v8 + 56) = MEMORY[0x189617FA8];
      *(void *)(v8 + 64) = sub_1840525E0();
      *(void *)(v8 + 32) = v10;
      *(void *)(v8 + 40) = v12;
      sub_18406FEC8();

      swift_bridgeObjectRelease();
      return;
    }
  }

  uint64_t v13 = sub_18406FE20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16LL))(a2, a1, v13);
}

void sub_184054200()
{
}

void *sub_184054320(uint64_t a1)
{
  uint64_t v4 = sub_18406FE20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((sub_184050538() & 1) == 0)
  {
    __int128 v17 = objc_msgSend( objc_allocWithZone((Class)MISLaunchWarningQueryResult),  sel_initWithWarningState_withUserOverridden_withKBURL_,  0,  0,  0);
    uint64_t v16 = v17;
    if (v17) {
      return v16;
    }
    __break(1u);
LABEL_6:
    uint64_t v16 = v17;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v16;
  }

  v19[3] = sub_18406FF70();
  uint64_t v8 = sub_18404F4B8();
  uint64_t v20 = v1;
  id v9 = (void *)*v8;
  sub_18404D8FC(qword_18C498E18);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1840737D0;
  id v11 = v9;
  uint64_t v12 = a1;
  uint64_t v13 = sub_18406FE08();
  uint64_t v15 = v14;
  *(void *)(v10 + 56) = MEMORY[0x189617FA8];
  *(void *)(v10 + 64) = sub_1840525E0();
  *(void *)(v10 + 32) = v13;
  *(void *)(v10 + 40) = v15;
  sub_18406FEC8();

  swift_bridgeObjectRelease();
  sub_1840540AC(v12, (uint64_t)v7);
  uint64_t v16 = v20;
  __int128 v17 = (void *)(*(uint64_t (**)(char *))((*MEMORY[0x18961B398] & *v20) + 0x50LL))(v7);
  if (!v2) {
    goto LABEL_6;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v16;
}

id sub_1840545F0()
{
  return sub_184054C4C();
}

uint64_t sub_184054730(char a1, uint64_t a2)
{
  return sub_184054F18(a1, a2);
}

id sub_184054888()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchWarningClientOperations();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1840548B8()
{
  uint64_t v1 = sub_18404D8FC(&qword_18C671240);
  MEMORY[0x1895F8858](v1);
  char v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_18404D8FC(&qword_18C671288);
  MEMORY[0x1895F8858](v4);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = _s18LaunchWarningEntryVMa();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((sub_184050538() & 1) != 0)
  {
    unsigned int v30 = v3;
    unsigned __int8 v31 = v10;
    sub_18406FF70();
    id v11 = sub_18404F4B8();
    uint64_t v32 = v0;
    uint64_t v12 = (void *)*v11;
    sub_18404D8FC(qword_18C498E18);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1840737D0;
    id v14 = v12;
    uint64_t v15 = sub_18406FE08();
    uint64_t v17 = v16;
    *(void *)(v13 + 56) = MEMORY[0x189617FA8];
    *(void *)(v13 + 64) = sub_1840525E0();
    *(void *)(v13 + 32) = v15;
    *(void *)(v13 + 40) = v17;
    sub_18406FEC8();

    swift_bridgeObjectRelease();
    type metadata accessor for LaunchWarningMark();
    uint64_t v18 = v32;
    uint64_t v19 = sub_18404EEBC();
    if (v18) {
      return;
    }
    uint64_t v20 = v19;
    if (v19)
    {
      type metadata accessor for LaunchWarningDB();
      uint64_t v13 = (uint64_t)sub_1840505A0(1);
      sub_184051020(v20, (uint64_t)v6);
LABEL_10:
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7) == 1)
      {
        sub_184055534((uint64_t)v6);
        if (objc_msgSend( objc_allocWithZone((Class)MISLaunchWarningQueryResult),  sel_initWithWarningState_withUserOverridden_withKBURL_,  0,  0,  0))
        {
LABEL_17:
          swift_release();

          return;
        }

        __break(1u);
      }

      uint64_t v21 = (uint64_t)v31;
      sub_184055574((uint64_t)v6, (uint64_t)v31);
      uint64_t v22 = *(int *)(v7 + 20);
      uint64_t v23 = *(unsigned __int8 *)(v21 + *(int *)(v7 + 24));
      uint64_t v24 = type metadata accessor for LaunchWarningDetails();
      uint64_t v25 = (uint64_t)v30;
      sub_18404F7F8(v21 + v22 + *(int *)(v24 + 36), (uint64_t)v30);
      uint64_t v26 = sub_18406FE20();
      uint64_t v27 = *(void *)(v26 - 8);
      uint64_t v28 = 0LL;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v25, 1LL, v26) != 1)
      {
        uint64_t v28 = (void *)sub_18406FDE4();
        (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
      }

      id v29 = objc_msgSend( objc_allocWithZone((Class)MISLaunchWarningQueryResult),  sel_initWithWarningState_withUserOverridden_withKBURL_,  1,  v23,  v28);

      if (v29)
      {
        sub_1840555B8(v21);
        goto LABEL_17;
      }

LABEL_19:
      __break(1u);
      return;
    }

    if (!objc_msgSend( objc_allocWithZone((Class)MISLaunchWarningQueryResult),  sel_initWithWarningState_withUserOverridden_withKBURL_,  0,  0,  0))
    {
      __break(1u);
      goto LABEL_10;
    }
  }

  else if (!objc_msgSend( objc_allocWithZone((Class)MISLaunchWarningQueryResult),  sel_initWithWarningState_withUserOverridden_withKBURL_,  0,  0,  0))
  {
    __break(1u);
    goto LABEL_19;
  }

    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }

  return v7 == v8 + v9;
}

        uint64_t v2 = -402620413;

LABEL_23:
        return v2;
      }

LABEL_27:
      uint64_t v2 = 0;
      self->_fixedup = 1;
      return v2;
    }

    MISProfileGetValue(self, (uint64_t)@"DeveloperCertificates");
    uint64_t v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    certs = self->certs;
    self->certs = v28;

    MISProfileGetValue(self, (uint64_t)@"Entitlements");
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v30 = CEManagedContextFromCFData();
    unsigned __int8 v31 = (void *)MEMORY[0x1896135D8];
    if (v30 == *MEMORY[0x1896135D8])
    {
      uint64_t v38 = 0LL;
      if (CEQueryContextToCFDictionary() == *v31)
      {
        uint64_t v36 = self->entitlements;
        self->entitlements = (NSDictionary *)v38;

        goto LABEL_27;
      }

      sub_184068378();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v37 = 0;
        unsigned __int8 v33 = v37;
        goto LABEL_31;
      }
    }

    else
    {
      sub_184068378();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v38) = 0;
        unsigned __int8 v33 = (uint8_t *)&v38;
LABEL_31:
        _os_log_error_impl( &dword_18404B000,  v32,  OS_LOG_TYPE_ERROR,  "Invalid entitlements in a provisioning profile",  v33,  2u);
      }
    }

    uint64_t v2 = -402620413;

    goto LABEL_23;
  }

  return 0;
}

  CFRelease(v9);
  if (a4) {
LABEL_20:
  }
    *a4 = v11;
  return cf;
}

id sub_184054C4C()
{
  v19[1] = *(CFDataRef *)MEMORY[0x1895F89C0];
  if ((sub_184050538() & 1) == 0) {
    return 0LL;
  }
  sub_18406FF70();
  uint64_t v1 = (void *)*sub_18404F4B8();
  sub_18404D8FC(qword_18C498E18);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1840737D0;
  id v3 = v1;
  uint64_t v4 = sub_18406FE08();
  uint64_t v6 = v5;
  *(void *)(v2 + 56) = MEMORY[0x189617FA8];
  *(void *)(v2 + 64) = sub_1840525E0();
  *(void *)(v2 + 32) = v4;
  *(void *)(v2 + 40) = v6;
  sub_18406FEC8();

  swift_bridgeObjectRelease();
  unsigned int v7 = sub_184051F34();
  if (!v0)
  {
    unsigned int v10 = v7;
    uint64_t v11 = v8;
    unint64_t v12 = v9;
    v19[0] = 0LL;
    sub_18404D13C(v8, v9);
    uint64_t v13 = (const __CFData *)sub_18406FE50();
    sub_18404D0F8(v11, v12);
    id v3 = (id)sub_18406EFD0(v10, v13, v19);

    if (v3)
    {
      sub_18406FFD0();
      swift_bridgeObjectRelease();
      *(void *)&__int128 v18 = 0xD000000000000011LL;
      *((void *)&v18 + 1) = 0x8000000184071BA0LL;
      sub_184070000();
      sub_18406FF4C();
      swift_bridgeObjectRelease();
      id v3 = (id)0x8000000184071BA0LL;
      sub_1840554F0();
      swift_allocError();
      *id v14 = v18;
    }

    else
    {
      if (v19[0])
      {
        uint64_t v15 = v19[0];
        sub_18406FE5C();
      }

      sub_1840554F0();
      swift_allocError();
      *uint64_t v16 = 0xD000000000000029LL;
      v16[1] = 0x8000000184071BF0LL;
    }

    swift_willThrow();
    sub_18404D0F8(v11, v12);
  }

  return v3;
}

uint64_t sub_184054F18(char a1, uint64_t a2)
{
  uint64_t v4 = sub_18406FE20();
  uint64_t v34 = *(void *)(v4 - 8);
  uint64_t v35 = v4;
  MEMORY[0x1895F8858](v4);
  uint64_t v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1840540AC(a2, (uint64_t)v6);
  sub_18406FF88();
  v33[0] = sub_18404F4B8();
  unsigned int v7 = *(void **)v33[0];
  sub_18404D8FC(qword_18C498E18);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_184073910;
  id v9 = v7;
  uint64_t v10 = sub_18406FE08();
  uint64_t v12 = v11;
  *(void *)(v8 + 56) = MEMORY[0x189617FA8];
  unint64_t v13 = sub_1840525E0();
  *(void *)(v8 + 64) = v13;
  uint64_t v14 = MEMORY[0x1896184C8];
  *(void *)(v8 + 32) = v10;
  *(void *)(v8 + 40) = v12;
  uint64_t v15 = MEMORY[0x1896184F8];
  *(void *)(v8 + 96) = v14;
  *(void *)(v8 + 104) = v15;
  *(_BYTE *)(v8 + 72) = a1;
  sub_18406FEC8();

  swift_bridgeObjectRelease();
  type metadata accessor for LaunchWarningMark();
  uint64_t v16 = v33[1];
  uint64_t v17 = sub_18404EEBC();
  if (!v16)
  {
    unint64_t v18 = v13;
    uint64_t v19 = (void **)v33[0];
    if (v17)
    {
      int64_t v20 = sub_18406EEA4(*(void *)(v17 + 24), a1 & 1);
      if (v20 == 16)
      {
        sub_1840554F0();
        swift_allocError();
        *id v29 = 0LL;
        v29[1] = 0LL;
      }

      else
      {
        int64_t v21 = v20;
        if (v20 == 1024)
        {
          (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v35);
          return swift_release();
        }

        unint64_t v36 = 0LL;
        unint64_t v37 = 0xE000000000000000LL;
        sub_18406FFD0();
        swift_bridgeObjectRelease();
        unint64_t v36 = 0xD000000000000011LL;
        unint64_t v37 = 0x8000000184071BA0LL;
        int64_t v38 = v21;
        sub_184070000();
        sub_18406FF4C();
        swift_bridgeObjectRelease();
        unint64_t v30 = v36;
        unint64_t v31 = v37;
        sub_1840554F0();
        swift_allocError();
        *uint64_t v32 = v30;
        v32[1] = v31;
      }

      swift_willThrow();
      swift_release();
    }

    else
    {
      sub_18406FF7C();
      uint64_t v23 = *v19;
      uint64_t v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_1840737D0;
      id v25 = v23;
      uint64_t v26 = sub_18406FE08();
      *(void *)(v24 + 56) = MEMORY[0x189617FA8];
      *(void *)(v24 + 64) = v18;
      *(void *)(v24 + 32) = v26;
      *(void *)(v24 + 40) = v27;
      sub_18406FEC8();

      swift_bridgeObjectRelease();
      sub_1840554F0();
      swift_allocError();
      *uint64_t v28 = xmmword_184073BB0;
      swift_willThrow();
    }
  }

  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v6, v35);
}

uint64_t type metadata accessor for LaunchWarningClientOperations()
{
  return objc_opt_self();
}

unint64_t destroy for LaunchWarningClientOperationError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s3mis33LaunchWarningClientOperationErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }

  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }

  return a1;
}

void *assignWithCopy for LaunchWarningClientOperationError(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }

__n128 initializeWithTake for LaunchWarningClientOperationError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for LaunchWarningClientOperationError(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }

  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LaunchWarningClientOperationError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for LaunchWarningClientOperationError( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)__n128 result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_DWORD *)__n128 result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }

  return result;
}

uint64_t sub_1840554A8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1840554C0(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0LL;
  }

  else if (a2)
  {
    result[1] = (a2 - 1);
  }

  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningClientOperationError()
{
  return &type metadata for LaunchWarningClientOperationError;
}

unint64_t sub_1840554F0()
{
  unint64_t result = qword_18C671308;
  if (!qword_18C671308)
  {
    unint64_t result = MEMORY[0x186E2C0D8](&unk_184073BC0, &type metadata for LaunchWarningClientOperationError);
    atomic_store(result, (unint64_t *)&qword_18C671308);
  }

  return result;
}

uint64_t sub_184055534(uint64_t a1)
{
  uint64_t v2 = sub_18404D8FC(&qword_18C671288);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_184055574(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s18LaunchWarningEntryVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1840555B8(uint64_t a1)
{
  uint64_t v2 = _s18LaunchWarningEntryVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_1840555F4()
{
  qword_18C671E90 = -1LL;
}

uint64_t sub_184055604()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_184055634(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_184055670())()
{
  return j__swift_endAccess;
}

uint64_t sub_1840556B0(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

void sub_1840556E0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_184055734()
{
  uint64_t v8 = v2;
  __int16 v9 = v3;
  char v10 = BYTE2(v3);
  char v11 = BYTE3(v3);
  char v12 = BYTE4(v3);
  char v13 = BYTE5(v3);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 88LL);
  uint64_t v5 = swift_retain();
  uint64_t v6 = (sqlite3_stmt *)v4(v5);
  if (qword_18C671D98 != -1) {
    swift_once();
  }
  sqlite3_bind_blob(v6, v0, &v8, BYTE6(v3), (void (__cdecl *)(void *))qword_18C671E90);
  return swift_release();
}

_BYTE *sub_1840559B0(int a1)
{
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)v1 + 88LL);
  uint64_t v4 = (sqlite3_stmt *)v3();
  uint64_t result = sqlite3_column_blob(v4, a1);
  if (result)
  {
    uint64_t v6 = result;
    unsigned int v7 = (sqlite3_stmt *)v3();
    int v8 = sqlite3_column_bytes(v7, a1);
    return (_BYTE *)sub_184056198(v6, v8);
  }

  return result;
}

uint64_t sub_184055A10(uint64_t a1, int a2)
{
  uint64_t result = sub_18406FE8C();
  if ((~*(void *)&v5 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (v5 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (v5 < 9.22337204e18)
  {
    sqlite3_int64 v6 = (uint64_t)v5;
    unsigned int v7 = (sqlite3_stmt *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 88LL))(result);
    return sqlite3_bind_int64(v7, a2, v6);
  }

uint64_t sub_184055A9C(int a1)
{
  uint64_t v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88LL))();
  sqlite3_column_int64(v3, a1);
  return sub_18406FE80();
}

uint64_t sub_184055AE0(sqlite3_int64 a1, int a2)
{
  double v5 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v2 + 88LL))();
  return sqlite3_bind_int64(v5, a2, a1);
}

sqlite3_int64 sub_184055B1C(int a1)
{
  uint64_t v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88LL))();
  return sqlite3_column_int64(v3, a1);
}

uint64_t sub_184055B48(char a1, int a2)
{
  double v5 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v2 + 88LL))();
  return sqlite3_bind_int64(v5, a2, a1 & 1);
}

BOOL sub_184055B84(int a1)
{
  uint64_t v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88LL))();
  return sqlite3_column_int64(v3, a1) != 0;
}

uint64_t sub_184055BBC(uint64_t result, uint64_t a2, int a3)
{
  if (a2)
  {
    uint64_t v6 = result;
    swift_retain();
    return sub_184055C14(v6, a2, v3, a3);
  }

  return result;
}

uint64_t sub_184055C14(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((a2 & 0x1000000000000000LL) != 0 || !(a2 & 0x2000000000000000LL | a1 & 0x1000000000000000LL))
  {
    sub_18406FFC4();
    return swift_release();
  }

  if ((a2 & 0x2000000000000000LL) == 0)
  {
    if ((a1 & 0x1000000000000000LL) != 0) {
      double v5 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      double v5 = (const char *)sub_18406FFDC();
    }
    sub_1840566D4(v5);
    return swift_release();
  }

  *(void *)int v8 = a1;
  uint64_t v9 = a2 & 0xFFFFFFFFFFFFFFLL;
  unsigned int v7 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)a3 + 88LL))();
  if (qword_18C671D98 != -1) {
    swift_once();
  }
  sqlite3_bind_text(v7, a4, v8, -1, (void (__cdecl *)(void *))qword_18C671E90);
  return swift_release();
}

const unsigned __int8 *sub_184055D50(int a1)
{
  uint64_t v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88LL))();
  uint64_t result = sqlite3_column_text(v3, a1);
  if (result) {
    return (const unsigned __int8 *)sub_18406FF58();
  }
  return result;
}

uint64_t sub_184055D90()
{
  return swift_deallocClassInstance();
}

uint64_t sub_184055DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0LL;
  char v11 = (void *)sub_18406FEF8();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  uint64_t v26 = sub_184056294;
  uint64_t v27 = (void *)v12;
  uint64_t aBlock = MEMORY[0x1895F87A8];
  uint64_t v23 = 1107296256LL;
  uint64_t v24 = sub_184055FD8;
  id v25 = &unk_189DA9E78;
  char v13 = _Block_copy(&aBlock);
  sub_184056324(a3);
  swift_release();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a5;
  v14[3] = a6;
  v14[4] = v10;
  uint64_t v26 = sub_184056368;
  uint64_t v27 = v14;
  uint64_t aBlock = MEMORY[0x1895F87A8];
  uint64_t v23 = 1107296256LL;
  uint64_t v24 = sub_184056014;
  id v25 = &unk_189DA9EC8;
  uint64_t v15 = _Block_copy(&aBlock);
  sub_184056324(a5);
  swift_retain();
  swift_release();
  unsigned int v16 = objc_msgSend(v21, sel_executeQuery_withBind_withResults_, v11, v13, v15);
  _Block_release(v15);
  _Block_release(v13);

  if (v16)
  {
    sub_184050F5C();
    swift_allocError();
    *(void *)uint64_t v17 = v16;
    *(void *)(v17 + 8) = 0LL;
    *(void *)(v17 + 16) = 0LL;
    *(void *)(v17 + 24) = 0LL;
    *(_BYTE *)(v17 + 32) = 0;
LABEL_5:
    swift_willThrow();
    return swift_release();
  }

  swift_beginAccess();
  unint64_t v18 = *(void **)(v10 + 16);
  if (v18)
  {
    id v19 = v18;
    goto LABEL_5;
  }

  return swift_release();
}

uint64_t sub_184055FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_184056014(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  sub_184056688();
  uint64_t v4 = sub_18406FEEC();
  swift_retain();
  v3(a2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18405608C(uint64_t a1, uint64_t a2, sqlite3_stmt *a3, sqlite3_stmt *a4, int a5)
{
  uint64_t v10 = (char *)sub_18406FD84();
  if (!v10)
  {
LABEL_4:
    BOOL v12 = __OFSUB__(a2, a1);
    uint64_t v13 = a2 - a1;
    if (v12)
    {
      __break(1u);
    }

    else
    {
      uint64_t v14 = sub_18406FD9C();
      if (v14 < v13) {
        uint64_t v13 = v14;
      }
      a3 = a4;
      uint64_t v15 = (*(uint64_t (**)(void))(*(void *)a4 + 88LL))();
      if (!v10) {
        uint64_t v13 = 0LL;
      }
      if (v13 >= (uint64_t)0xFFFFFFFF80000000LL)
      {
        if (v13 <= 0x7FFFFFFF)
        {
          a3 = (sqlite3_stmt *)v15;
          if (qword_18C671D98 == -1)
          {
LABEL_12:
            sqlite3_bind_blob(a3, a5, v10, v13, (void (__cdecl *)(void *))qword_18C671E90);
            return swift_release();
          }

LABEL_16:
          swift_once();
          goto LABEL_12;
        }

    __break(0x5519u);
  }

  return result;
}

        double v5 = 0LL;
LABEL_17:
        if (v12) {
          CFRelease(v12);
        }
        if (v5) {
          goto LABEL_21;
        }
      }
    }

    else
    {
      uint64_t v9 = (os_log_s *)sub_184068378();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_error_impl( &dword_18404B000,  v9,  OS_LOG_TYPE_ERROR,  "CreateMISAuthListWithStream: creating stream failed",  (uint8_t *)&v13,  2u);
        goto LABEL_16;
      }
    }

    double v5 = CFArrayCreate(0LL, 0LL, 0LL, MEMORY[0x189605228]);
LABEL_21:
    CFRelease(a1);
    if (v3) {
      CFRelease(v3);
    }
    return v5;
  }

  int v8 = (os_log_s *)sub_184068378();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v13) = 0;
    _os_log_error_impl( &dword_18404B000,  v8,  OS_LOG_TYPE_ERROR,  "CreateMISAuthListWithFile: url is NULL",  (uint8_t *)&v13,  2u);
  }

  return 0LL;
}

LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }

    __break(1u);
    goto LABEL_15;
  }

  uint64_t result = sub_18406FDA8();
  if (!__OFSUB__(a1, result))
  {
    v10 += a1 - result;
    goto LABEL_4;
  }

  __break(1u);
  return result;
}

  __break(0x5519u);
  return result;
}

LABEL_17:
    unsigned int v7 = -402620403;
    goto LABEL_18;
  }

  uint64 = xpc_dictionary_get_uint64(v10, "Status");
  *a4 = uint64;
  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
LABEL_19:

  return v15;
}

      uint64_t v22 = 3892346881LL;

      goto LABEL_25;
    }

    uint64_t v22 = 3892346902LL;
  }

  else
  {
    uint64_t v22 = 3892346901LL;
  }

LABEL_16:
    uint64_t v3 = 1LL;
LABEL_17:

    return v3;
  }

  uint64_t v3 = 1LL;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  return v3;
}

uint64_t sub_184056198(_BYTE *__src, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 <= 14) {
    return sub_18404F1EC(__src, &__src[a2]);
  }
  sub_18406FDB4();
  swift_allocObject();
  sub_18406FD78();
  sub_18406FE38();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_184056244()
{
  return swift_deallocObject();
}

uint64_t sub_184056268()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_184056294(uint64_t result)
{
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  if (v2)
  {
    uint64_t v3 = result;
    type metadata accessor for SQLStatement();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    swift_retain();
    v2(v4);
    swift_release();
    return sub_1840566C4((uint64_t)v2);
  }

  return result;
}

uint64_t sub_18405630C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_18405631C()
{
  return swift_release();
}

uint64_t sub_184056324(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_184056334()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_184056368(uint64_t result)
{
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  if (v2)
  {
    uint64_t v3 = result;
    type metadata accessor for SQLStatement();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    swift_retain();
    v2(v4);
    swift_release();
    return sub_1840566C4((uint64_t)v2);
  }

  return result;
}

uint64_t sub_184056414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }

  return result;
}

uint64_t destroy for DBError(uint64_t a1)
{
  return sub_184056458( *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(_BYTE *)(a1 + 32));
}

uint64_t sub_184056458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }

  return result;
}

uint64_t initializeWithCopy for DBError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(_BYTE *)(a2 + 32);
  sub_184056414(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for DBError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(_BYTE *)(a2 + 32);
  sub_184056414(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  char v12 = *(_BYTE *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  sub_184056458(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for DBError(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DBError(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(_BYTE *)(a1 + 32);
  __int128 v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 32) = v3;
  sub_184056458(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DBError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DBError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(_BYTE *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 33) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 33) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 32) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_184056644(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_18405664C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DBError()
{
  return &type metadata for DBError;
}

uint64_t type metadata accessor for SQLStatement()
{
  return objc_opt_self();
}

unint64_t sub_184056688()
{
  unint64_t result = qword_18C671310;
  if (!qword_18C671310)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C671310);
  }

  return result;
}

uint64_t sub_1840566C4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1840566D4(const char *a1)
{
  int v3 = *(_DWORD *)(v1 + 24);
  int v4 = (sqlite3_stmt *)(*(uint64_t (**)(void))(**(void **)(v1 + 16) + 88LL))();
  if (qword_18C671D98 != -1) {
    swift_once();
  }
  return sqlite3_bind_text(v4, v3, a1, -1, (void (__cdecl *)(void *))qword_18C671E90);
}

void sub_184056768(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_18404D180(a1, a2);
  if (!v2)
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    uint64_t v9 = v5;
    unint64_t v10 = v6;
    if (v4)
    {
      sub_18404D13C(v5, v6);
      uint64_t v11 = (void *)sub_18406FE50();
      sub_18404D0F8(v9, v10);
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    id v12 = objc_msgSend(objc_allocWithZone((Class)MISUserTrustSignature), sel_initWithSignature_, v11);

    if (v12) {
      sub_18404DCA4(v7, v8, v9, v10);
    }
    else {
      __break(1u);
    }
  }

uint64_t sub_184056990()
{
  return sub_18404D690();
}

uint64_t sub_184056A68()
{
  id v1 = v0;
  uint64_t v2 = sub_18404D8FC(&qword_18C671218);
  MEMORY[0x1895F8858](v2);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_18404D8FC(&qword_18C671228);
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_18406FEBC();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18406FEA4();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    sub_18404D2C0((uint64_t)v11, (uint64_t)v4);
    if (v0)
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }

    else
    {
      uint64_t v13 = type metadata accessor for UserTrustedProfileEntry();
      id v1 = objc_msgSend( objc_allocWithZone(MEMORY[0x189607968]),  sel_initWithBool_,  (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v4, 1, v13) != 1);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      sub_184056C3C((uint64_t)v4);
    }

    return (uint64_t)v1;
  }

  return result;
}

uint64_t sub_184056C3C(uint64_t a1)
{
  uint64_t v2 = sub_18404D8FC(&qword_18C671218);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for UserTrustOperations()
{
  return objc_opt_self();
}

id sub_184056DC0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserTrustOperations();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t amfi_interface_cdhash_in_trustcache(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = 22LL;
  if (a1 && a2 == 20 && a3)
  {
    *a3 = 0LL;
    uint64_t result = __sandbox_ms();
    if ((_DWORD)result) {
      return *__error();
    }
    else {
      *a3 = 0LL;
    }
  }

  return result;
}

uint64_t amfi_interface_query_bootarg_state(void *a1)
{
  if (!a1) {
    return 22LL;
  }
  *a1 = 0LL;
  uint64_t result = __sandbox_ms();
  if ((_DWORD)result) {
    return *__error();
  }
  *a1 = 0LL;
  return result;
}

uint64_t amfi_interface_get_local_signing_private_key(_BYTE *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  char v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1) {
    return 22LL;
  }
  a1[144] = 0;
  *((_OWORD *)a1 + 7) = 0uLL;
  *((_OWORD *)a1 + 8) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 6) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  uint64_t result = __sandbox_ms();
  if (!(_DWORD)result) {
    return 2 * (memcmp(a1, __s2, 0x91uLL) == 0);
  }
  return result;
}

uint64_t amfi_interface_get_local_signing_public_key(_BYTE *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  char v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1) {
    return 22LL;
  }
  a1[96] = 0;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  uint64_t result = __sandbox_ms();
  if (!(_DWORD)result) {
    return 2 * (memcmp(a1, __s2, 0x61uLL) == 0);
  }
  return result;
}

uint64_t amfi_interface_set_local_signing_public_key(const void *a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  char v3 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1 || !memcmp(a1, __s2, 0x61uLL)) {
    return 22LL;
  }
  else {
    return __sandbox_ms();
  }
}

uint64_t amfi_interface_authorize_local_signing()
{
  return __sandbox_ms();
}

BOOL amfi_developer_mode_status()
{
  uint64_t v2 = 0LL;
  size_t v3 = 8LL;
  return !sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v3, 0LL, 0LL) && v2 == 1;
}

BOOL amfi_developer_mode_resolved()
{
  uint64_t v2 = 0LL;
  size_t v3 = 8LL;
  return !sysctlbyname("security.mac.amfi.developer_mode_resolved", &v2, &v3, 0LL, 0LL) && v2 == 1;
}

uint64_t amfi_launch_constraint_set_spawnattr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  else {
    return 22LL;
  }
}

uint64_t amfi_launch_constraint_matches_process(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = (int *)a4;
  v7[128] = *MEMORY[0x1895F89C0];
  if (a2 && a3)
  {
    if (a3 <= 0x4000)
    {
      bzero(v7, 0x400uLL);
      int v6 = 5;
      if (!v4) {
        uint64_t v4 = &v6;
      }
    }

    else if (a4)
    {
      uint64_t result = 0LL;
      *(_DWORD *)a4 = 5;
      strcpy((char *)(a4 + 4), "Constraint too large");
      return result;
    }
  }

  else if (a4)
  {
    uint64_t result = 0LL;
    *(_DWORD *)a4 = 5;
    strcpy((char *)(a4 + 4), "No Constraint provided");
    return result;
  }

  return 0LL;
}

uint64_t amfi_restricted_execution_mode_enable()
{
  return __sandbox_ms();
}

BOOL amfi_restricted_execution_mode_status()
{
  return __sandbox_ms() == 0;
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  v4[2] = *MEMORY[0x1895F89C0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!(_DWORD)result)
  {
    uint64_t result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if ((_DWORD)result)
    {
      uint64_t result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if ((_DWORD)result)
      {
        uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if ((_DWORD)result)
        {
          uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if ((_DWORD)result)
          {
            uint64_t result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if ((_DWORD)result) {
              return result;
            }
            uint64_t v3 = 0x1000000000LL;
          }

          else
          {
            uint64_t v3 = 0x800000000LL;
          }
        }

        else
        {
          uint64_t v3 = 0x400000000LL;
        }
      }

      else
      {
        uint64_t v3 = 8LL;
      }
    }

    else
    {
      uint64_t v3 = 3840LL;
    }

    *(void *)(a1 + 240) |= v3;
  }

  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    time_t v5 = 0LL;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      time_t v3 = timegm(&v4);
      double result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(void *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
      }
    }
  }

  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (*(_BYTE *)(result + 16))
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!(_DWORD)result
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !(_DWORD)result)
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !(_DWORD)result))
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x58E30653FFF8LL;
      goto LABEL_11;
    }
  }

  uint64_t v4 = *(void *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!(_DWORD)result)
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x1000000LL;
      goto LABEL_11;
    }

uint64_t sub_1840577A0(void *a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = 0LL;
  v6[1] = 0LL;
  v5[0] = 0LL;
  v5[1] = 0LL;
  uint64_t result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0LL, v5);
  if (!(_DWORD)result)
  {
    uint64_t result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!(_DWORD)result)
    {
      uint64_t result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!(_DWORD)result) {
        *(void *)(a2 + 240) |= a1[1];
      }
    }
  }

  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!(_DWORD)result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

uint64_t CTEvaluateAMFICodeSignatureCMS_MaxDigestType( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6, void *a7, void *a8, uint64_t *a9, int *a10, _DWORD *a11, void *a12, void *a13)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  memset(&v40[14], 170, 24);
  *(void *)&__int128 v21 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v40[10] = v21;
  *(_OWORD *)&v40[12] = v21;
  *(_OWORD *)&v40[6] = v21;
  *(_OWORD *)&v40[8] = v21;
  *(_OWORD *)&v40[2] = v21;
  *(_OWORD *)&v40[4] = v21;
  *(_OWORD *)unint64_t v40 = v21;
  memset(__b, 170, sizeof(__b));
  *(void *)&__int128 v22 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v39[0] = v22;
  v39[1] = v22;
  __int128 v37 = v22;
  __int128 v38 = v22;
  v35[4] = v22;
  __int128 v36 = v22;
  v35[2] = v22;
  v35[3] = v22;
  v35[0] = v22;
  v35[1] = v22;
  __int128 v34 = v22;
  uint64_t result = sub_184057A84((uint64_t)v40, a1, a2, a3, a4, (uint64_t)__b, 0);
  if ((_DWORD)result) {
    return result;
  }
  uint64_t result = sub_184057B30((uint64_t)v40, (uint64_t)&v34, &v40[15], 0LL, a6);
  if ((_DWORD)result) {
    return result;
  }
  uint64_t v33 = 0LL;
  unint64_t v30 = 0xAAAAAAAA0000AA01LL;
  __int128 v29 = xmmword_184074D30;
  BYTE1(v30) = a5;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  int v24 = X509ChainCheckPathWithOptions(29, (uint64_t *)v39 + 1, (uint64_t)&v29, &v33);
  if (a10)
  {
    digest = find_digest((uint64_t)v35 + 8);
    if (!digest) {
      return 327682LL;
    }
    *a10 = *digest;
  }

  if (!a9 || v24)
  {
    if (!a9) {
      goto LABEL_13;
    }
    uint64_t v26 = 0LL;
  }

  else
  {
    uint64_t v26 = v33;
  }

  *a9 = v26;
LABEL_13:
  if (a8 && a7 && *((void *)&v39[0] + 1))
  {
    uint64_t v27 = *(void *)(*((void *)&v39[0] + 1) + 8LL);
    *a7 = **((void **)&v39[0] + 1);
    *a8 = v27;
  }

  uint64_t result = 0LL;
  if (a11 && a12)
  {
    if (a13)
    {
      uint64_t result = 0LL;
      *a11 = DWORD2(v36);
      uint64_t v28 = *((void *)&v37 + 1);
      *a12 = v37;
      *a13 = v28;
    }
  }

  return result;
}

uint64_t sub_184057A84(uint64_t result, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  *(_OWORD *)(result + 80) = 0u;
  *(_OWORD *)(result + 96) = 0u;
  *(void *)(result + 112) = 0LL;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(void *)(result + 24) = 0LL;
  *(_OWORD *)uint64_t result = 0u;
  *(void *)(result + 32) = result + 24;
  *(void *)uint64_t result = 4LL;
  *(void *)(result + 8) = a6;
  *(_DWORD *)(result + 96) = a7;
  if (a3 < 0)
  {
LABEL_10:
    __break(0x5519u);
    return result;
  }

  uint64_t v9 = result;
  uint64_t result = CMSParseContentInfoSignedData(a2, a3, (unint64_t *)result);
  if (!(_DWORD)result)
  {
    if (!a5) {
      return 0LL;
    }
    uint64_t result = 131091LL;
    if (!*(void *)(v9 + 72) && !*(void *)(v9 + 80))
    {
      if ((a5 & 0x8000000000000000LL) == 0)
      {
        uint64_t result = 0LL;
        *(void *)(v9 + 72) = a4;
        *(void *)(v9 + 80) = a5;
        return result;
      }

      goto LABEL_10;
    }
  }

  return result;
}

uint64_t sub_184057B30(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, int a5)
{
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(void *)(a1 + 56) = a2;
  *(void *)(a1 + 64) = 1LL;
  *a3 = 0LL;
  a3[1] = 0LL;
  *a3 = a4;
  *(_DWORD *)(a2 + 168) = 458753;
  *((_DWORD *)a3 + 2) = a5;
  uint64_t result = CMSParseSignerInfos( a1,  (uint64_t)a3,  (uint64_t (*)(uint64_t, uint64_t, __int128 *))validateSignerInfoAndChain);
  if (!(_DWORD)result) {
    return *(unsigned int *)(a2 + 168);
  }
  return result;
}

uint64_t CTEvaluateAMFICodeSignatureCMS( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7, uint64_t *a8, int *a9, _DWORD *a10, void *a11, void *a12)
{
  return CTEvaluateAMFICodeSignatureCMS_MaxDigestType(a1, a2, a3, a4, a5, 16, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t CTEvaluateAMFICodeSignatureCMSPubKey( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7, _DWORD *a8, void *a9, void *a10)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  memset(&v35[14], 170, 24);
  *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v35[10] = v18;
  *(_OWORD *)&v35[12] = v18;
  *(_OWORD *)&v35[6] = v18;
  *(_OWORD *)&v35[8] = v18;
  *(_OWORD *)&v35[2] = v18;
  *(_OWORD *)&v35[4] = v18;
  *(_OWORD *)uint64_t v35 = v18;
  memset(__b, 170, sizeof(__b));
  *(void *)&__int128 v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v33 = v19;
  __int128 v34 = v19;
  __int128 v31 = v19;
  __int128 v32 = v19;
  v29[4] = v19;
  __int128 v30 = v19;
  v29[3] = v19;
  v29[1] = v19;
  v29[2] = v19;
  __int128 v28 = v19;
  v29[0] = v19;
  uint64_t result = sub_184057A84((uint64_t)v35, a1, a2, a3, a4, (uint64_t)__b, 16);
  if (!(_DWORD)result)
  {
    v27[0] = a5;
    v27[1] = a6;
    __int128 v21 = (__int128 *)oidForPubKeyLength();
    __int128 v22 = &null_octet;
    if (v21) {
      __int128 v22 = v21;
    }
    v26[0] = 1LL;
    v26[1] = 0LL;
    v26[3] = v27;
    v26[2] = 0xAAAAAAAA00000000LL;
    uint64_t v23 = &ecPublicKey;
    if (!v21) {
      uint64_t v23 = &rsaEncryption;
    }
    v26[4] = v23;
    v26[5] = v22;
    v26[6] = 0LL;
    uint64_t result = sub_184057B30((uint64_t)v35, (uint64_t)&v28, &v35[15], (uint64_t)v26, 16);
    if (!(_DWORD)result)
    {
      if (a7)
      {
        digest = find_digest((uint64_t)v29 + 8);
        if (!digest) {
          return 327682LL;
        }
        *a7 = *digest;
      }

      uint64_t result = 0LL;
      if (a8 && a9)
      {
        if (a10)
        {
          uint64_t result = 0LL;
          *a8 = DWORD2(v30);
          uint64_t v25 = *((void *)&v31 + 1);
          *a9 = v31;
          *a10 = v25;
        }
      }
    }
  }

  return result;
}

uint64_t CTEvaluateProvisioningProfile(char *a1, uint64_t a2, char a3, void *a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v10 = -1431655766;
  uint64_t v11 = &null_octet;
  char v7 = 1;
  __int128 v6 = xmmword_184074D40;
  char v8 = a3;
  __int16 v9 = 0;
  id v12 = &null_octet;
  uint64_t v13 = &null_octet;
  uint64_t v14 = &null_octet;
  return CMSVerifyAndReturnSignedData(a1, a2, a4, a5, (uint64_t)&v6);
}

uint64_t CTAmfiInitializeContext(uint64_t a1, uint64_t a2, uint64_t a3, int a4, char a5)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 96) = 0LL;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(_DWORD *)(a1 + 16) = a4;
  *(_BYTE *)(a1 + 20) = a5;
  v21[0] = 0xAAAAAAAAAAAAAAAALL;
  v21[1] = 0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v14 = v6;
  __int128 v15 = v6;
  v13[6] = v6;
  v13[7] = v6;
  v13[4] = v6;
  v13[5] = v6;
  v13[2] = v6;
  v13[3] = v6;
  v13[0] = v6;
  v13[1] = v6;
  __int128 v12 = v6;
  memset(v16, 0, sizeof(v16));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v20 = 0LL;
  uint64_t result = sub_184057F78( (uint64_t)v16,  (uint64_t)&v12,  (uint64_t)v21,  (uint64_t)__b,  a1,  (uint64_t (*)(uint64_t, uint64_t, __int128 *))CMSBuildPath);
  if (!(_DWORD)result)
  {
    digest = find_digest((uint64_t)v13 + 8);
    if (digest)
    {
      *(_DWORD *)(a1 + 80) = *digest;
      if (*((void *)&v17 + 1))
      {
        uint64_t v9 = v18;
        if ((void)v18)
        {
          *(void *)(a1 + 40) = *((void *)&v17 + 1);
          *(void *)(a1 + 48) = v9;
        }
      }

      uint64_t v10 = *((void *)&v14 + 1);
      uint64_t result = 0LL;
      if (*((void *)&v14 + 1))
      {
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL);
        *(void *)(a1 + 24) = **((void **)&v14 + 1);
        *(void *)(a1 + 32) = v11;
        *(void *)(a1 + 88) = *(void *)(v10 + 240);
      }
    }

    else
    {
      return 327682LL;
    }
  }

  return result;
}

uint64_t sub_184057F78( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, __int128 *))
{
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = a1 + 24;
  *(void *)a1 = 4LL;
  *(void *)(a1 + 8) = a4;
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a5 + 16);
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(void *)(a1 + 56) = a2;
  *(void *)(a1 + 64) = 1LL;
  *(_DWORD *)(a2 + 168) = 327681;
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  *(_DWORD *)(a3 + 8) = *(_DWORD *)(a5 + 16);
  *(_BYTE *)(a3 + 12) = *(_BYTE *)(a5 + 84);
  uint64_t result = CMSParseContentInfoSignedData(*(char **)a5, *(void *)(a5 + 8), (unint64_t *)a1);
  if (!(_DWORD)result)
  {
    uint64_t result = CMSParseSignerInfos(a1, a3, a6);
    if (!(_DWORD)result) {
      return *(unsigned int *)(a2 + 168);
    }
  }

  return result;
}

uint64_t CTAmfiVerifyCMS(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v19[0] = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = 0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v13 = v6;
  __int128 v14 = v6;
  __int128 v11 = v6;
  __int128 v12 = v6;
  v9[5] = v6;
  __int128 v10 = v6;
  v9[3] = v6;
  v9[4] = v6;
  v9[1] = v6;
  v9[2] = v6;
  v9[0] = v6;
  memset(v15, 0, sizeof(v15));
  uint64_t v16 = 0LL;
  uint64_t v17 = a2;
  uint64_t v18 = a3;
  uint64_t result = sub_184057F78( (uint64_t)v15,  (uint64_t)v9,  (uint64_t)v19,  (uint64_t)__b,  a1,  (uint64_t (*)(uint64_t, uint64_t, __int128 *))validateSignerInfo);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a1 + 56) = DWORD2(v10);
    uint64_t v8 = *((void *)&v11 + 1);
    *(void *)(a1 + 64) = v11;
    *(void *)(a1 + 72) = v8;
    *(_BYTE *)(a1 + 84) = v13;
  }

  return result;
}

uint64_t CTAmfiVerifyCertificateChain(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v10[0] = v2;
  v10[1] = v2;
  v9[7] = v2;
  v9[8] = v2;
  v9[5] = v2;
  _OWORD v9[6] = v2;
  v9[3] = v2;
  v9[4] = v2;
  v9[1] = v2;
  v9[2] = v2;
  v9[0] = v2;
  memset(v11, 0, sizeof(v11));
  uint64_t v12 = 0LL;
  uint64_t result = sub_184057F78( (uint64_t)v11,  (uint64_t)v9,  (uint64_t)v13,  (uint64_t)__b,  a1,  (uint64_t (*)(uint64_t, uint64_t, __int128 *))sub_184058258);
  if (!(_DWORD)result)
  {
    uint64_t v8 = 0LL;
    unint64_t v5 = 0xAAAAAAAAAAAAAA01LL;
    __int128 v4 = xmmword_184074D30;
    BYTE1(v5) = *(_BYTE *)(a1 + 20);
    WORD1(v5) = 0;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    uint64_t result = X509ChainCheckPathWithOptions(29, (uint64_t *)v10 + 1, (uint64_t)&v4, &v8);
    if ((_DWORD)result)
    {
      *(void *)(a1 + 96) = 0LL;
      return X509ChainCheckPathWithOptions(29, (uint64_t *)v10 + 1, 0LL, 0LL);
    }

    else
    {
      *(void *)(a1 + 96) = v8;
    }
  }

  return result;
}

uint64_t sub_184058258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  else {
    return CMSBuildPath(a1, a2, a3);
  }
}

uint64_t CTAmfiContextGetLeaf(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  *a2 = *(void *)(a1 + 24);
  *a3 = v3;
  return 0LL;
}

uint64_t CTAmfiContextGetContent(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  *a2 = *(void *)(a1 + 40);
  *a3 = v3;
  return 0LL;
}

uint64_t CTAmfiContextGetDigestType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 80);
}

uint64_t CTAmfiContextGetLeafPolicyFlags(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

uint64_t CTAmfiContextGetChainPolicyFlags(uint64_t a1)
{
  return *(void *)(a1 + 96);
}

uint64_t CTAmfiContextGetHashAgility(uint64_t a1, _DWORD *a2, void *a3, void *a4)
{
  *a2 = *(_DWORD *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 72);
  *a3 = *(void *)(a1 + 64);
  *a4 = v4;
  return 0LL;
}

uint64_t CTParseAmfiCMS( uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, void *a6, void *a7, _DWORD *a8, void *a9)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v24 = 0LL;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v19 = 0u;
  v18[0] = a1;
  v18[1] = a2;
  LODWORD(v19) = a3;
  uint64_t result = CTAmfiInitializeContext((uint64_t)v18, a1, a2, a3, 0);
  if ((_DWORD)result) {
    return result;
  }
  if (!a7 || !a6 || (uint64_t v15 = *((void *)&v20 + 1)) == 0 || (v16 = v21) == 0)
  {
    if (!a6 || !a7) {
      goto LABEL_10;
    }
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
  }

  *a6 = v15;
  *a7 = v16;
LABEL_10:
  if (a5)
  {
    if (a4)
    {
      if (*((void *)&v19 + 1))
      {
        uint64_t v17 = v20;
        if ((void)v20)
        {
          *a4 = *((void *)&v19 + 1);
          *a5 = v17;
        }
      }
    }
  }

  if (a9) {
    *a9 = *((void *)&v23 + 1);
  }
  if (a8) {
    *a8 = v23;
  }
  return result;
}

uint64_t CTVerifyAmfiCMS( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _DWORD *a6, void *a7, void *a8)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v14 = 0u;
  v13[0] = a1;
  v13[1] = a2;
  LODWORD(v14) = a5;
  uint64_t result = CTAmfiVerifyCMS((uint64_t)v13, a3, a4);
  if (!(_DWORD)result && a6 && a7)
  {
    if (a8)
    {
      *a6 = DWORD2(v16);
      uint64_t v12 = *((void *)&v17 + 1);
      *a7 = v17;
      *a8 = v12;
    }
  }

  return result;
}

uint64_t CTVerifyAmfiCertificateChain(uint64_t a1, uint64_t a2, char a3, int a4, void *a5)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v13 = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v8 = 0u;
  v7[0] = a1;
  v7[1] = a2;
  LODWORD(v8) = a4;
  BYTE4(v8) = a3;
  uint64_t result = CTAmfiVerifyCertificateChain((uint64_t)v7);
  if (a5)
  {
    if (!(_DWORD)result) {
      *a5 = v13;
    }
  }

  return result;
}

int *find_digest(uint64_t a1)
{
  unint64_t v2 = 0LL;
  while (1)
  {
    uint64_t result = (int *)compare_octet_string_raw( (uint64_t)&dword_189DAB078[v2 / 4 + 2],  *(const void **)a1,  *(void *)(a1 + 8));
    if (!(_DWORD)result) {
      break;
    }
    v2 += 32LL;
    if (v2 == 160) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

int *find_digest_by_type(int *result)
{
  unint64_t v1 = 0LL;
  while (dword_189DAB078[v1 / 4] != (_DWORD)result)
  {
    v1 += 32LL;
    if (v1 == 160) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t find_digestOID_for_signingOID(uint64_t a1, void *a2)
{
  if (!compare_octet_string_raw(a1, &sha1WithRSA_oid, 9uLL)
    || !compare_octet_string_raw(a1, &sha1WithECDSA_oid, 7uLL))
  {
    __int128 v6 = &CTOidSha1;
    uint64_t v4 = 5LL;
    goto LABEL_11;
  }

  uint64_t v4 = 9LL;
  if (!compare_octet_string_raw(a1, &sha256WithRSA_oid, 9uLL))
  {
    __int128 v6 = &CTOidSha256;
    goto LABEL_11;
  }

  if (!compare_octet_string_raw(a1, &sha256WithECDSA_oid, 8uLL))
  {
    __int128 v6 = &CTOidSha256;
LABEL_18:
    uint64_t v4 = 9LL;
    goto LABEL_11;
  }

  uint64_t v4 = 9LL;
  if (!compare_octet_string_raw(a1, &sha384WithRSA_oid, 9uLL))
  {
    __int128 v6 = &CTOidSha384;
    goto LABEL_11;
  }

  if (!compare_octet_string_raw(a1, &sha384WithECDSA_oid, 8uLL))
  {
    __int128 v6 = &CTOidSha384;
    goto LABEL_18;
  }

  uint64_t v4 = 9LL;
  if (compare_octet_string_raw(a1, &sha512WithRSA_oid, 9uLL))
  {
    __int128 v6 = &CTOidSha512;
    goto LABEL_18;
  }

  __int128 v6 = &CTOidSha512;
LABEL_11:
  *a2 = v6;
  a2[1] = v4;
  return 1LL;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t result = 0LL;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  char v23 = 0;
  if (a1)
  {
    if (a2)
    {
      unint64_t result = 0LL;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            unint64_t result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!(_DWORD)result
              || (unint64_t result = sub_184058978((uint64_t)&off_189DAB168, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), (_DWORD)result))
            {
              unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v10 = a5[9];
              uint64_t v9 = a5[10];
              if (__CFADD__(v10, v9)) {
                goto LABEL_31;
              }
              if (v10 > v10 + v9) {
                goto LABEL_32;
              }
              unint64_t v21 = a5[9];
              unint64_t v22 = v10 + v9;
              if (!v9 || (unint64_t result = ccder_blob_check_null(), (_DWORD)result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    unint64_t result = ccder_decode_rsa_pub_n();
                    if (!result) {
                      return result;
                    }
                    unint64_t v11 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }

                    unint64_t v12 = result << 6;
                    if (result << 6 < 0x400) {
                      return 0LL;
                    }
                    unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
                    __int16 v26 = -21846;
                    char v24 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      unint64_t v13 = a5[4];
                      LOBYTE(v25) = v13;
                      if ((unint64_t)&v24 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v13 <= 9)
                        {
                          uint64_t v14 = __memcpy_chk();
                          if (v12 > 0x1068) {
                            return 0LL;
                          }
                          unint64_t result = MEMORY[0x1895F8858](v14);
                          __int128 v16 = (unint64_t *)((char *)&v20 - v15);
                          unint64_t v17 = 0LL;
                          *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
                          *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            uint64_t v19 = &v16[v17 / 8];
                            *(_OWORD *)uint64_t v19 = v18;
                            *((_OWORD *)v19 + 1) = v18;
                            v17 += 32LL;
                          }

                          while (v15 != v17);
                          if (v15 >= 1)
                          {
                            *__int128 v16 = v11;
                            unint64_t result = 0LL;
                            char v23 = 0;
                            return result;
                          }
                        }

                        goto LABEL_32;
                      }
                    }

                    goto LABEL_31;
                  }

LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }

LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

                            __break(0x5513u);
                            return result;
                          }

                          if (ccec_verify()) {
LABEL_24:
                          }
                            HIBYTE(v17) = 0;
                        }

                        return HIBYTE(v17) != 0;
                      }

BOOL sub_184058978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = 0LL;
  BOOL v7 = 1;
  do
  {
    BOOL v7 = v6 < 3;
    a1 += 32LL;
    ++v6;
  }

  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0 = ccec_x963_import_pub_size();
  int is_supported = ccec_keysize_is_supported();
  unint64_t v2 = &CTOidSECP256r1;
  uint64_t v3 = &CTOidSECP521r1;
  uint64_t v4 = &CTOidSECP384r1;
  if (v0 != 384) {
    uint64_t v4 = 0LL;
  }
  if (v0 != 521) {
    uint64_t v3 = v4;
  }
  if (v0 != 256) {
    unint64_t v2 = v3;
  }
  if (is_supported) {
    return v2;
  }
  else {
    return 0LL;
  }
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0LL;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  HIBYTE(v17) = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (uint64_t result = sub_184058978((uint64_t)&off_189DAB1E8, a5 + 24, a5 + 56), (_DWORD)result))
            {
              uint64_t result = sub_184058C54((int **)(a5 + 72));
              if (result)
              {
                uint64_t v8 = *(void *)result;
                if (*(void *)result >> 61 || !is_mul_ok(8 * v8, 3uLL))
                {
                  __break(0x550Cu);
                }

                else
                {
                  uint64_t v9 = 24 * v8;
                  BOOL v10 = __CFADD__(v9, 16LL);
                  unint64_t v11 = v9 + 16;
                  if (!v10 && v11 < 0xFFFFFFFFFFFFFFF0LL)
                  {
                    uint64_t result = MEMORY[0x1895F8858](result);
                    uint64_t v14 = (uint64_t *)((char *)&v17 - v12);
                    unint64_t v15 = 0LL;
                    do
                    {
                      __int128 v16 = &v14[v15 / 8];
                      *__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
                      v16[1] = 0xAAAAAAAAAAAAAAAALL;
                      v15 += 16LL;
                    }

                    while (v12 != v15);
                    if (v13 >= 0x10)
                    {
                      *uint64_t v14 = result;
                      if (v12 >= 1)
                      {
                        if (!MEMORY[0x186E2BA60]())
                        {
                          uint64_t result = ccec_x963_import_pub_size();
                          if (result == 256 && *(void *)(a5 + 96) == 64LL)
                          {
                            if (*(void *)(a5 + 88) < 0xFFFFFFFFFFFFFFE0LL)
                            {
                              goto LABEL_24;
                            }

LABEL_30:
                      __break(0x5519u);
                      goto LABEL_31;
                    }

    __break(0x5519u);
    goto LABEL_31;
  }

LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }

                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_184058C54(int **a1)
{
  if (!a1) {
    return 0LL;
  }
  unint64_t v1 = a1[1];
  if (v1 != (int *)7)
  {
    return 0LL;
  }

  uint64_t v3 = *a1;
  int v5 = *v3;
  int v6 = *(int *)((char *)v3 + 3);
  if (v5 != -2127887098 || v6 != 587203713) {
    return 0LL;
  }
  return ccec_cp_521();
}

uint64_t compressECPublicKey(void *a1, int **a2, uint64_t a3, uint64_t a4)
{
  v19[1] = *MEMORY[0x1895F89C0];
  BOOL v7 = (void *)sub_184058C54(a2);
  if (!v7) {
    return 655366LL;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *v7;
  if (*v7 >> 61 || !is_mul_ok(8 * v9, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }

  uint64_t v10 = 24 * v9;
  BOOL v11 = __CFADD__(v10, 16LL);
  unint64_t v12 = v10 + 16;
  if (v11 || v12 >= 0xFFFFFFFFFFFFFFF0LL) {
LABEL_19:
  }
    __break(0x5500u);
  uint64_t result = MEMORY[0x1895F8858](v7);
  __int128 v16 = (void *)((char *)v19 - v14);
  unint64_t v17 = 0LL;
  do
  {
    uint64_t v18 = &v16[v17 / 8];
    *uint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    v18[1] = 0xAAAAAAAAAAAAAAAALL;
    v17 += 16LL;
  }

  while (v14 != v17);
  if (v15 < 0x10) {
    goto LABEL_21;
  }
  *__int128 v16 = v8;
  if (v14 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }

  uint64_t result = MEMORY[0x186E2BA60](v8, a1[1], *a1, (char *)v19 - v14);
  if (!(_DWORD)result)
  {
    uint64_t result = ccec_compressed_x962_export_pub_size();
    if (result == a4)
    {
      if (!a3 || a4) {
        return ccec_compressed_x962_export_pub();
      }
      goto LABEL_20;
    }

    return 393220LL;
  }

  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  v18[1] = *MEMORY[0x1895F89C0];
  int v6 = (uint64_t *)sub_184058C54(a2);
  if (!v6) {
    return 655366LL;
  }
  uint64_t v7 = *v6;
  if ((unint64_t)*v6 >> 61 || !is_mul_ok(8 * v7, 3uLL)) {
LABEL_22:
  }
    __break(0x550Cu);
  uint64_t v8 = 24 * v7;
  BOOL v9 = __CFADD__(v8, 16LL);
  unint64_t v10 = v8 + 16;
  if (v9 || v10 >= 0xFFFFFFFFFFFFFFF0LL)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }

  unint64_t result = MEMORY[0x1895F8858](v6);
  uint64_t v14 = (void *)((char *)v18 - v12);
  unint64_t v15 = 0LL;
  do
  {
    __int128 v16 = &v14[v15 / 8];
    *__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
    v16[1] = 0xAAAAAAAAAAAAAAAALL;
    v15 += 16LL;
  }

  while (v12 != v15);
  if (v13 < 0x10) {
    goto LABEL_24;
  }
  *uint64_t v14 = result;
  if (v12 >= 1)
  {
    uint64_t v17 = ccec_compressed_x962_import_pub();
    if (!(_DWORD)v17)
    {
      unint64_t result = cczp_bitlen();
      if (result < 0xFFFFFFFFFFFFFFF9LL)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4) {
            uint64_t v17 = 0LL;
          }
          else {
            uint64_t v17 = 393220LL;
          }
          ccec_export_pub();
          return v17;
        }

        goto LABEL_23;
      }

      goto LABEL_21;
    }

    return v17;
  }

LABEL_23:
  __break(0x5519u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t CMSParseContentInfoSignedDataWithOptions(char *a1, uint64_t a2, unint64_t *a3, char a4)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  __int128 v28 = (char *)0xAAAAAAAAAAAAAAAALL;
  __int128 v29 = (char *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_114;
  }
  if (&a1[a2] < a1) {
    goto LABEL_112;
  }
  int v4 = 65537;
  __int128 v28 = a1;
  __int128 v29 = &a1[a2];
  __int16 v27 = 0;
  size_t v26 = 0xAAAAAAAAAAAAAAAALL;
  int v7 = sub_184059690((uint64_t)&v28, 0x2000000000000010LL, (_BYTE *)&v27 + 1, &v26);
  uint64_t result = 65537LL;
  if (v7)
  {
    char v24 = (char *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v25 = (char *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v28, v26)) {
      goto LABEL_114;
    }
    if (v28 > &v28[v26] || &v28[v26] > v29) {
      goto LABEL_112;
    }
    char v24 = v28;
    unint64_t v25 = &v28[v26];
    if (ccder_blob_decode_tl())
    {
      if (v25 < v24 || v26 > v25 - v24) {
        goto LABEL_112;
      }
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      v24 += v26;
      unint64_t v22 = (char *)0xAAAAAAAAAAAAAAAALL;
      char v23 = (char *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      unint64_t v22 = v24;
      char v23 = &v24[v26];
      __int16 v31 = 0;
      memset(v30, 170, sizeof(v30));
      if (__CFADD__(v22, v30[0])) {
        goto LABEL_114;
      }
      uint64_t v9 = 131080LL;
      if (&v22[v30[0]] != v23) {
        return 131082LL;
      }
      unint64_t v10 = a3 + 11;
      uint64_t result = 131092LL;
      if (*v10 <= 4uLL && ((1LL << *v10) & 0x1A) != 0)
      {
        unsigned __int8 v35 = 0;
        size_t v34 = 0LL;
        __int128 v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v22, v34)) {
          goto LABEL_114;
        }
        if (v22 > &v22[v34] || &v22[v34] > v23) {
          goto LABEL_112;
        }
        __int128 v32 = v22;
        unint64_t v33 = (unint64_t)&v22[v34];
        if (__CFADD__(v32, v34)) {
          goto LABEL_114;
        }
        BOOL v11 = &v32[v34];
        v32 += v34;
        int v12 = v35;
        if (v11 != (char *)v33 || v35)
        {
          unsigned __int8 v40 = 0;
          __int128 v38 = (char *)v33;
          unint64_t v39 = 0LL;
          uint64_t v37 = v11;
          if (sub_184059690((uint64_t)&v37, 0xA000000000000000LL, &v40, &v39))
          {
            if (!v12)
            {
              if (__CFADD__(v37, v39)) {
                goto LABEL_114;
              }
            }

            if (v37 > v38) {
              goto LABEL_112;
            }
            __int128 v32 = v37;
            unint64_t v33 = (unint64_t)v38;
            unsigned __int8 v36 = 0;
            int v16 = v40;
            unint64_t v41 = 0LL;
            uint64_t v17 = v32;
            unint64_t v18 = v33;
            unint64_t v19 = v41;
            a3[9] = (unint64_t)v32;
            a3[10] = v19;
            if (__CFADD__(v17, v19))
            {
LABEL_114:
              __break(0x5513u);
              return 0LL;
            }

            uint64_t v20 = &v17[v19];
            __int128 v32 = v20;
          }

          else
          {
            if (!v12) {
              return v9;
            }
            int v16 = v40;
          }

          BOOL v11 = v32;
        }

        if (v11 > v23 || v22 > v11) {
          goto LABEL_112;
        }
        unint64_t v22 = v11;
        uint64_t v37 = (char *)0xAAAAAAAAAAAAAAAALL;
        __int128 v38 = (char *)0xAAAAAAAAAAAAAAAALL;
        if (v22 > v23) {
          goto LABEL_112;
        }
        uint64_t v37 = v22;
        __int128 v38 = v23;
        if ((sub_184059690((uint64_t)&v37, 0xA000000000000000LL, &v31, v30) & 1) == 0)
        {
          unint64_t v13 = v22;
          unint64_t v15 = v23;
          goto LABEL_86;
        }

        __int128 v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
        if (!__CFADD__(v37, v30[0]))
        {
          if (v37 > &v37[v30[0]] || &v37[v30[0]] > v38) {
            goto LABEL_112;
          }
          __int128 v32 = v37;
          unint64_t v33 = (unint64_t)&v37[v30[0]];
          unint64_t v13 = v32;
          if (v32 - v37 >= 0 ? v32 >= v37 : v32 < v37)
          {
            if (v37 > v32) {
              goto LABEL_112;
            }
            unint64_t v15 = v38;
            if (v32 > v38) {
              goto LABEL_112;
            }
            unint64_t v22 = v32;
            char v23 = v38;
LABEL_86:
            if (v13 <= v15)
            {
              uint64_t v37 = v13;
              __int128 v38 = v15;
              if (sub_18405B3C8((unint64_t *)&v37, 0xA000000000000001LL, 0LL, 125))
              {
                if (v37 > v38) {
                  goto LABEL_112;
                }
                unint64_t v22 = v37;
                char v23 = v38;
              }

              if (v30[2] >= v30[1])
              {
                unint64_t v21 = &v22[-v30[1]];
                if ((unint64_t)&v22[-v30[1]] <= v30[2] - v30[1])
                {
                  a3[5] = v30[1];
                  a3[6] = (unint64_t)v21;
                  if (v22 <= v25 && v24 <= v22)
                  {
                    char v24 = v22;
                    if (sub_18405972C((unint64_t *)&v24, HIBYTE(v27)))
                    {
                      if ((a4 & 1) == 0 && v24 != v29) {
                        return 65543LL;
                      }
                      return 0LL;
                    }

                    return (v4 + 5);
                  }
                }
              }
            }

LABEL_112:
            __break(0x5519u);
            return (v4 + 5);
          }
        }

        goto LABEL_114;
      }
    }

    else
    {
      return 65538LL;
    }
  }

  return result;
}

uint64_t sub_184059690(uint64_t a1, uint64_t a2, _BYTE *a3, unint64_t *a4)
{
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0LL;
  if (v8)
  {
    if (a2 == 0xAAAAAAAAAAAAAAAALL) {
      return sub_18405AF74(a1, a3, a4);
    }
  }

  return result;
}

uint64_t sub_18405972C(unint64_t *a1, int a2)
{
  if (!a2) {
    return 1LL;
  }
  uint64_t result = ccder_blob_decode_tl();
  if (!(_DWORD)result) {
    return result;
  }
  unint64_t v4 = *a1;
  if (*a1 >= 0x5555555555555556LL)
  {
    __break(0x5513u);
LABEL_12:
    __break(0x5519u);
    return result;
  }

  unint64_t v5 = v4 - 0x5555555555555556LL;
  if (v4 > v4 - 0x5555555555555556LL || v5 > a1[1]) {
    goto LABEL_12;
  }
  *a1 = v5;
  return 1LL;
}

uint64_t CMSParseContentInfoSignedData(char *a1, uint64_t a2, unint64_t *a3)
{
  return CMSParseContentInfoSignedDataWithOptions(a1, a2, a3, 0);
}

uint64_t CMSParseSignerInfos(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, __int128 *))
{
  uint64_t v86 = *MEMORY[0x1895F89C0];
  unint64_t v84 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v85 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  if (__CFADD__(v4, v3)) {
    goto LABEL_93;
  }
  if (v4 > v4 + v3) {
    goto LABEL_92;
  }
  unint64_t v84 = *(void *)(a1 + 40);
  unint64_t v85 = v4 + v3;
  unint64_t v72 = 0xAAAAAAAAAAAAAAAALL;
  if (v4 >= v4 + v3)
  {
    unsigned int v48 = 0;
    uint64_t result = 0LL;
    if (v3) {
      return (v48 << 8) | 0x30008;
    }
    return result;
  }

  unsigned int v6 = 0;
  unsigned __int8 v60 = 0;
  int v7 = 256;
  while (1)
  {
    unsigned __int8 v71 = 0;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    DWORD2(v83) = 327681;
    LOBYTE(v82) = v6 + 1;
    if ((sub_184059690((uint64_t)&v84, 0x2000000000000010LL, &v71, &v72) & 1) == 0)
    {
      int v49 = 196609;
      return v7 | v49;
    }

    unint64_t v69 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v70 = 0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v84, v72)) {
      goto LABEL_93;
    }
    if (v84 > v84 + v72 || v84 + v72 > v85) {
      goto LABEL_92;
    }
    unint64_t v69 = v84;
    unint64_t v70 = v84 + v72;
    if ((ccder_blob_decode_uint64() & 1) == 0)
    {
      int v49 = 196610;
      return v7 | v49;
    }

    unint64_t v9 = v69;
    unint64_t v8 = v70;
    unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    unint64_t v67 = v69;
    unint64_t v68 = v70;
    unint64_t v65 = v69;
    unint64_t v66 = v70;
    unint64_t v10 = v69;
LABEL_19:
    if (__CFADD__(v72, v10 - v9)) {
      goto LABEL_94;
    }
    if (v72 + v10 - v9 > v8 - v9) {
      goto LABEL_92;
    }
    *((void *)&v73 + 1) = v9;
    *(void *)&__int128 v74 = v72 + v10 - v9;
    if (__CFADD__(v10, v72)) {
      goto LABEL_93;
    }
    if (v10 > v10 + v72 || v10 + v72 > v70) {
      goto LABEL_92;
    }
    unint64_t v69 = v10 + v72;
    if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v74 + 1))
    {
      int v49 = 196612;
      return v7 | v49;
    }

    unint64_t v63 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    unint64_t v63 = v69;
    unint64_t v64 = v70;
    if (ccder_blob_decode_tl())
    {
      if (v64 < v63 || v72 > v64 - v63) {
        goto LABEL_92;
      }
      *((void *)&v75 + 1) = v63;
      *(void *)&__int128 v76 = v72;
      if (__CFADD__(v63, v72)) {
        goto LABEL_93;
      }
      if (v63 > v63 + v72 || v63 + v72 > v64) {
        goto LABEL_92;
      }
      unint64_t v69 = v63 + v72;
      unint64_t v70 = v64;
    }

    else
    {
      *((void *)&v75 + 1) = 0LL;
      *(void *)&__int128 v76 = 0LL;
    }

    if ((ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v76 + 1) & 1) == 0)
    {
      int v49 = 196613;
      return v7 | v49;
    }

    if ((ccder_blob_decode_tl() & 1) == 0)
    {
      int v49 = 196614;
      return v7 | v49;
    }

    if (v70 < v69 || v72 > v70 - v69) {
      goto LABEL_92;
    }
    *((void *)&v78 + 1) = v69;
    *(void *)&__int128 v79 = v72;
    if (__CFADD__(v69, v72)) {
      goto LABEL_93;
    }
    unint64_t v12 = v69 + v72;
    if (v69 > v69 + v72 || v12 > v70) {
      goto LABEL_92;
    }
    v69 += v72;
    unint64_t v63 = v12;
    unint64_t v64 = v70;
    if (sub_18405B3C8(&v63, 0xA000000000000001LL, 0LL, 125))
    {
      if (v63 > v64) {
        goto LABEL_92;
      }
      unint64_t v69 = v63;
      unint64_t v70 = v64;
    }

    if ((sub_18405972C(&v69, v71) & 1) == 0)
    {
      int v49 = 196615;
      return v7 | v49;
    }

    digest = find_digest((uint64_t)&v74 + 8);
    if (digest)
    {
      uint64_t v14 = digest;
      unsigned int v15 = *(_DWORD *)(a1 + 96);
      if (!v15 || *digest <= v15)
      {
        uint64_t result = a3(a2, a1, &v73);
        if ((_DWORD)result != 327710)
        {
          if ((_DWORD)result) {
            return result;
          }
          unint64_t v17 = *(void *)(a1 + 64);
          if (v17 <= v60)
          {
            if (v17)
            {
              int v29 = v60 - 1;
              unint64_t v30 = *(void *)(a1 + 56);
              uint64_t v31 = 176LL * v29;
              if (__CFADD__(v30, v31)) {
                goto LABEL_93;
              }
              unint64_t v32 = v30 + 176LL * v29;
              if (v32 >= v30 + 176 * v17 || v32 < v30) {
                goto LABEL_92;
              }
              unint64_t v33 = find_digest(v30 + 176LL * v29 + 24);
              if (v33)
              {
                if (*v14 > *v33)
                {
                  unsigned int v34 = *(_DWORD *)(a1 + 96);
                  if (!v34 || *v14 <= v34)
                  {
                    unint64_t v35 = *(void *)(a1 + 56);
                    if (__CFADD__(v35, v31)) {
                      goto LABEL_93;
                    }
                    unsigned __int8 v36 = (_OWORD *)(v35 + 176LL * v29);
                    unint64_t v37 = v35 + 176LL * *(void *)(a1 + 64);
                    BOOL v38 = v37 >= (unint64_t)v36;
                    unint64_t v39 = v37 - (void)v36;
                    __int128 v40 = v73;
                    __int128 v41 = v75;
                    v36[1] = v74;
                    v36[2] = v41;
                    *unsigned __int8 v36 = v40;
                    __int128 v42 = v76;
                    __int128 v43 = v77;
                    __int128 v44 = v79;
                    v36[5] = v78;
                    v36[6] = v44;
                    v36[3] = v42;
                    v36[4] = v43;
                    __int128 v45 = v80;
                    __int128 v46 = v81;
                    __int128 v47 = v83;
                    v36[9] = v82;
                    v36[10] = v47;
                    v36[7] = v45;
                    v36[8] = v46;
                  }
                }
              }
            }
          }

          else
          {
            unsigned int v18 = *(_DWORD *)(a1 + 96);
            if (!v18 || *v14 <= v18)
            {
              uint64_t v19 = *(void *)(a1 + 56);
              uint64_t v20 = (_OWORD *)(v19 + 176LL * v60);
              if (176 * v17 - 176LL * v60 < 0xB0) {
                goto LABEL_92;
              }
              __int128 v21 = v73;
              __int128 v22 = v75;
              v20[1] = v74;
              v20[2] = v22;
              *uint64_t v20 = v21;
              __int128 v23 = v76;
              __int128 v24 = v77;
              __int128 v25 = v79;
              v20[5] = v78;
              v20[6] = v25;
              v20[3] = v23;
              v20[4] = v24;
              __int128 v26 = v80;
              __int128 v27 = v81;
              __int128 v28 = v83;
              v20[9] = v82;
              v20[10] = v28;
              v20[7] = v26;
              v20[8] = v27;
              if (v60 == 0xFF)
              {
                __break(0x5507u);
                return result;
              }

              ++v60;
            }
          }
        }
      }
    }

    if (v69 > v85 || v84 > v69) {
      goto LABEL_92;
    }
    unint64_t v84 = v69;
    unsigned int v48 = v6 + 1;
    if (v6 <= 6)
    {
      v7 += 256;
      ++v6;
      if (v69 < v85) {
        continue;
      }
    }

    if (v69 == v85)
    {
      if (v60) {
        return 0LL;
      }
      uint64_t v50 = *(void *)(a1 + 64);
      if (!v50) {
        return 0LL;
      }
      if ((unint64_t)(176 * v50) >= 0xB0)
      {
        uint64_t result = 0LL;
        v51 = *(_OWORD **)(a1 + 56);
        __int128 v52 = v73;
        __int128 v53 = v75;
        v51[1] = v74;
        v51[2] = v53;
        _OWORD *v51 = v52;
        __int128 v54 = v76;
        __int128 v55 = v77;
        __int128 v56 = v79;
        v51[5] = v78;
        v51[6] = v56;
        v51[3] = v54;
        v51[4] = v55;
        __int128 v57 = v80;
        __int128 v58 = v81;
        __int128 v59 = v83;
        v51[9] = v82;
        v51[10] = v59;
        v51[7] = v57;
        v51[8] = v58;
        return result;
      }

LABEL_92:
      __break(0x5519u);
LABEL_93:
      __break(0x5513u);
LABEL_94:
      __break(0x5500u);
    }

    return (v48 << 8) | 0x30008;
  }

  if ((ccder_blob_decode_tl() & 1) != 0)
  {
    unint64_t v10 = v67;
    unint64_t v11 = v68;
LABEL_17:
    if (v10 > v11) {
      goto LABEL_92;
    }
    unint64_t v69 = v10;
    unint64_t v70 = v11;
    goto LABEL_19;
  }

  if (ccder_blob_decode_tl())
  {
    unint64_t v10 = v65;
    unint64_t v11 = v66;
    goto LABEL_17;
  }

  int v49 = 196611;
  return v7 | v49;
}

uint64_t CMSBuildPath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = *(void *)(a3 + 8);
  uint64_t v4 = *(void *)(a3 + 16);
  if (__CFADD__(v3, v4)) {
LABEL_49:
  }
    __break(0x5513u);
  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_48;
  }
  unint64_t v20 = *(void *)(a3 + 8);
  unint64_t v21 = v5;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  if (*(void *)a3 != 3LL)
  {
    if (*(void *)a3 != 1LL) {
      return 524289LL;
    }
    uint64_t v8 = 524293LL;
    if (v21 >= v20 && v19 <= v21 - v20)
    {
      unint64_t v15 = v20;
      unint64_t v16 = v19;
      if (__CFADD__(v20, v19)) {
        goto LABEL_49;
      }
      if (v20 <= v20 + v19 && v20 + v19 <= v21)
      {
        v20 += v19;
        if (v21 >= v20 && v19 <= v21 - v20)
        {
          unint64_t v17 = v20;
          unint64_t v18 = v19;
          if (__CFADD__(v20, v19)) {
            goto LABEL_49;
          }
          if (v20 <= v20 + v19 && v20 + v19 <= v21)
          {
            v20 += v19;
            unint64_t v9 = *(void **)(a2 + 24);
            if (!v9) {
              return v8;
            }
            while (compare_octet_string((uint64_t)&v15, (uint64_t)(v9 + 15))
                 || compare_octet_string((uint64_t)&v17, (uint64_t)(v9 + 17)))
            {
              unint64_t v9 = (void *)v9[34];
              if (!v9) {
                return v8;
              }
            }

            goto LABEL_36;
          }
        }
      }
    }

    goto LABEL_48;
  }

  if (*(void *)(a2 + 88) == 1LL) {
    return 524298LL;
  }
  unint64_t v15 = v3;
  unint64_t v16 = v5;
  if (ccder_blob_decode_tl())
  {
    unint64_t v11 = v20;
    unint64_t v10 = v21;
    goto LABEL_29;
  }

  uint64_t v8 = 524294LL;
  unint64_t v11 = v15;
  unint64_t v10 = v16;
  if (v15 > v16)
  {
LABEL_48:
    __break(0x5519u);
    goto LABEL_49;
  }

  unint64_t v20 = v15;
  unint64_t v21 = v16;
LABEL_29:
  if (v10 < v11 || v19 > v10 - v11) {
    goto LABEL_48;
  }
  unint64_t v17 = v11;
  unint64_t v18 = v19;
  if (__CFADD__(v11, v19)) {
    goto LABEL_49;
  }
  if (v11 > v11 + v19 || v11 + v19 > v10) {
    goto LABEL_48;
  }
  unint64_t v20 = v11 + v19;
  uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier((uint64_t *)(a2 + 24), (uint64_t)&v17);
  if (!CertificateUsingKeyIdentifier) {
    return 524295LL;
  }
  unint64_t v9 = (void *)CertificateUsingKeyIdentifier;
LABEL_36:
  if (v20 != v21) {
    return 524543LL;
  }
  uint64_t v13 = X509ChainBuildPath(v9, (uint64_t *)(a2 + 24), (void *)(a3 + 152));
  uint64_t v8 = v13;
  if (*(_DWORD *)(a3 + 168) == 327681) {
    *(_DWORD *)(a3 + 168) = v13;
  }
  return v8;
}

uint64_t validateSignerInfo(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  unsigned int v6 = (__int128 *)(a3 + 24);
  digest = find_digest(a3 + 24);
  if (!digest) {
    return 327682LL;
  }
  uint64_t v8 = (unint64_t *)(*((uint64_t (**)(void))digest + 3))();
  unint64_t v9 = v8;
  memset(v34, 0, sizeof(v34));
  unint64_t v10 = (_OWORD *)a2[13];
  unint64_t v11 = a2[14];
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (a2[9] && a2[10])
    {
      unint64_t v10 = v34;
      uint64_t v13 = ccdigest();
      unint64_t v11 = *v9;
      if (*v9 >= 0x41) {
        goto LABEL_55;
      }
      goto LABEL_16;
    }

    if (!v10) {
      goto LABEL_31;
    }
  }

  if (*v8 != v11)
  {
LABEL_31:
    *(_DWORD *)(a3 + 168) = 327710;
    return 327710LL;
  }

  if (v11 > 0x40) {
    goto LABEL_55;
  }
  uint64_t v13 = __memcpy_chk();
LABEL_16:
  *(void *)(a3 + 128) = v10;
  *(void *)(a3 + 136) = v11;
  unint64_t v15 = (void *)(a3 + 128);
  uint64_t v16 = *(void *)(a3 + 48);
  if (!v16)
  {
    uint64_t result = CMSBuildPath(v13, (uint64_t)a2, a3);
    switch((int)result)
    {
      case 524293:
      case 524295:
        *(_DWORD *)(a3 + 168) = result;
        return 0LL;
      case 524294:
        goto LABEL_52;
      case 524296:
        if (*(_DWORD *)(a3 + 168) != 458753) {
          goto LABEL_43;
        }
        int v20 = 524296;
LABEL_42:
        *(_DWORD *)(a3 + 168) = v20;
LABEL_43:
        uint64_t v21 = *v9;
        if (*v9 > 0x40) {
          goto LABEL_55;
        }
        v28[0] = (uint64_t)v34;
        v28[1] = v21;
        uint64_t result = X509CertificateCheckSignatureDigest(29, *(void *)(a3 + 152), v28, v6, (__int128 *)(a3 + 88));
        if (!(_DWORD)result || (_DWORD)result == 655648 || (_DWORD)result == 655632)
        {
          int v22 = *(_DWORD *)(a3 + 168);
          if (!v22 || v22 == 458753 || v22 == 327681) {
            *(_DWORD *)(a3 + 168) = result;
          }
          uint64_t result = 0LL;
        }

        break;
      case 524297:
        int v20 = 524297;
        goto LABEL_42;
      default:
        if ((_DWORD)result) {
          goto LABEL_52;
        }
        goto LABEL_43;
    }

    goto LABEL_52;
  }

  uint64_t v25 = a1;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = *(void *)(a3 + 40);
  if (__CFADD__(v17, v16)) {
LABEL_56:
  }
    __break(0x5513u);
  unint64_t v18 = v17 + v16;
  if (v17 > v18) {
    goto LABEL_55;
  }
  unint64_t v32 = *(void *)(a3 + 40);
  unint64_t v33 = v18;
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  if (v17 >= v18)
  {
    uint64_t result = 262156LL;
    goto LABEL_52;
  }

  uint64_t v27 = 0x2000000000000010LL;
  unsigned int v24 = 262146;
  int v26 = 262147;
  int v23 = 458754;
  if (!ccder_blob_decode_tl())
  {
    uint64_t result = 262145LL;
    goto LABEL_52;
  }

  if (__CFADD__(v32, v31)) {
    goto LABEL_56;
  }
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  if (v32 > v32 + v31 || v32 + v31 > v33)
  {
LABEL_55:
    __break(0x5519u);
    goto LABEL_56;
  }

  unint64_t v29 = v32;
  unint64_t v30 = v32 + v31;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v29, v31)) {
      goto LABEL_56;
    }
    if (v29 <= v29 + v31 && v29 + v31 <= v30)
    {
      v29 += v31;
      uint64_t result = 262150LL;
      goto LABEL_52;
    }

    goto LABEL_55;
  }

  uint64_t result = v24;
LABEL_52:
  if ((_OWORD *)*v15 == v34)
  {
    *unint64_t v15 = 0LL;
    *(void *)(a3 + 136) = 0LL;
  }

  return result;
}

uint64_t validateSignerInfoAndChain(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = validateSignerInfo((uint64_t)a1, a2, a3);
  if (!(_DWORD)v5)
  {
    int v7 = X509ChainCheckPath(29, (uint64_t *)(a3 + 152), *a1);
    if (v7)
    {
      if (!*(_DWORD *)(a3 + 168)) {
        *(_DWORD *)(a3 + 168) = v7;
      }
    }
  }

  return v5;
}

uint64_t CMSVerifySignedDataWithLeaf( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  v9[1] = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  v9[0] = 0LL;
  return sub_18405ACE0(a1, a2, a3, a4, a5, a6, a7, &v8, v9);
}

uint64_t sub_18405ACE0( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v29 = 0LL;
  v30[0] = 0LL;
  memset(v28, 0, sizeof(v28));
  uint64_t v26 = 0LL;
  uint64_t v25 = 0LL;
  __int128 v23 = 0u;
  unsigned int v24 = (char *)&v23 + 8;
  v30[1] = 0LL;
  memset(__b, 170, sizeof(__b));
  v22[0] = 4LL;
  v22[1] = (unint64_t)__b;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  memset(v19, 0, sizeof(v19));
  uint64_t v27 = v19;
  *(void *)&v28[0] = 1LL;
  DWORD2(v21) = 327681;
  if (a2 < 0) {
    goto LABEL_19;
  }
  uint64_t result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v22, 0);
  if ((_DWORD)result) {
    return result;
  }
  if (!a4) {
    goto LABEL_7;
  }
  uint64_t result = 131091LL;
  if (a4 < 0) {
LABEL_19:
  }
    __break(0x5519u);
  *((void *)&v28[0] + 1) = a3;
  *(void *)&v28[1] = a4;
LABEL_7:
  v30[0] = a5;
  DWORD2(v21) = 458753;
  uint64_t result = CMSParseSignerInfos( (uint64_t)v22,  (uint64_t)v30,  (uint64_t (*)(uint64_t, uint64_t, __int128 *))validateSignerInfoAndChain);
  if (!(_DWORD)result)
  {
    uint64_t result = DWORD2(v21);
    if (!DWORD2(v21))
    {
      if (a6 && a7) {
        uint64_t result = X509CertificateParseKey(*((uint64_t *)&v20 + 1), a6, a7);
      }
      if (!a4)
      {
        if (a8)
        {
          if (a9)
          {
            uint64_t v18 = *(void *)&v28[1];
            if (*(void *)&v28[1])
            {
              if (*((void *)&v28[0] + 1))
              {
                *a8 = *((void *)&v28[0] + 1);
                *a9 = v18;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t CMSVerifySignedData(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  v9[0] = 0LL;
  uint64_t v8 = 0LL;
  return sub_18405ACE0(a1, a2, a3, a4, a5, &v6, &v7, &v8, v9);
}

uint64_t CMSVerifyAndReturnSignedData(char *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  v7[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = 0LL;
  v7[0] = 0LL;
  return sub_18405ACE0(a1, a2, 0LL, 0LL, a5, &v6, v7, a3, a4);
}

uint64_t sub_18405AF74(uint64_t result, _BYTE *a2, unint64_t *a3)
{
  *a2 = 0;
  unint64_t v3 = *(unsigned __int8 **)result;
  if (!*(void *)result) {
    return 0LL;
  }
  unint64_t v4 = *(void *)(result + 8);
  uint64_t v5 = v3 + 1;
  if (v3 >= v3 + 1 || (unint64_t)v5 > v4)
  {
LABEL_41:
    __break(0x5519u);
LABEL_42:
    __break(0x5513u);
    return result;
  }

  *(void *)uint64_t result = v5;
  unint64_t v7 = *v3;
  if ((char)*v3 < 0)
  {
    switch(*v3)
    {
      case 0x80u:
        unint64_t v7 = v4 - (void)v5;
        *a2 = 1;
        break;
      case 0x81u:
        uint64_t v8 = v3 + 2;
        *(void *)uint64_t result = v8;
        unint64_t v7 = *v5;
        uint64_t v5 = v8;
        break;
      case 0x82u:
        unint64_t v9 = v3 + 3;
        unint64_t v10 = (unint64_t)v3[1] << 8;
        uint64_t v11 = v3[2];
        goto LABEL_40;
      case 0x83u:
        unint64_t v9 = v3 + 4;
        unint64_t v10 = ((unint64_t)v3[1] << 16) | ((unint64_t)v3[2] << 8);
        uint64_t v11 = v3[3];
LABEL_40:
        unint64_t v7 = v10 | v11;
        *(void *)uint64_t result = v9;
        uint64_t v5 = v9;
        break;
      default:
        return 0LL;
    }
  }

  *a3 = v7;
  return 1LL;
}

uint64_t sub_18405B130( unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *a4 = 0LL;
  a4[1] = 0LL;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  if (*a1 > v6)
  {
LABEL_43:
    __break(0x5519u);
LABEL_44:
    __break(0x5513u);
  }

  unint64_t v30 = *a1;
  unint64_t v31 = v6;
  BOOL v7 = v5 >= v6 || a3 == 0;
  if (v7)
  {
    unint64_t v12 = 0LL;
LABEL_8:
    if (a5) {
      *a5 = v12;
    }
    return 1LL;
  }

  else
  {
    unint64_t v12 = 0LL;
    unint64_t v13 = 304 * a3;
    unint64_t v14 = a2 + 304 * a3;
    unint64_t v25 = ~a2;
    uint64_t v27 = (unint64_t **)(a4 + 1);
    __int128 v23 = (unint64_t *)(a2 + 272);
    unint64_t v15 = a2;
    while (1)
    {
      char v29 = 0;
      if (!v32) {
        goto LABEL_8;
      }
      if (v15 > v14) {
        goto LABEL_43;
      }
      if (v15 < a2) {
        goto LABEL_43;
      }
      BOOL v16 = v13 >= 0x130;
      v13 -= 304LL;
      if (!v16) {
        goto LABEL_43;
      }
      *(_OWORD *)(v15 + 272) = 0u;
      *(_OWORD *)(v15 + 288) = 0u;
      *(_OWORD *)(v15 + 240) = 0u;
      *(_OWORD *)(v15 + 256) = 0u;
      *(_OWORD *)(v15 + 208) = 0u;
      *(_OWORD *)(v15 + 224) = 0u;
      *(_OWORD *)(v15 + 176) = 0u;
      *(_OWORD *)(v15 + 192) = 0u;
      *(_OWORD *)(v15 + 144) = 0u;
      *(_OWORD *)(v15 + 160) = 0u;
      *(_OWORD *)(v15 + 112) = 0u;
      *(_OWORD *)(v15 + 128) = 0u;
      *(_OWORD *)(v15 + 80) = 0u;
      *(_OWORD *)(v15 + 96) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)(v15 + 64) = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)unint64_t v15 = 0u;
      if (v12)
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        *(void *)(v15 + 272) = 0LL;
        unint64_t v17 = *v27;
        *(void *)(v15 + 280) = *v27;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }

        *unint64_t v17 = v15;
        *uint64_t v27 = (unint64_t *)(v15 + 272);
      }

      else
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        unint64_t v18 = *a4;
        *__int128 v23 = *a4;
        unint64_t v19 = (unint64_t **)(v18 + 280);
        BOOL v7 = v18 == 0;
        __int128 v20 = v27;
        if (!v7) {
          __int128 v20 = v19;
        }
        *__int128 v20 = v23;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }

        *a4 = v15;
        *(void *)(a2 + 280) = a4;
      }

      if (v6 < v5) {
        goto LABEL_43;
      }
      unint64_t v21 = v30;
      uint64_t v22 = v30 - v5;
      if (v30 - v5 > v6 - v5) {
        goto LABEL_43;
      }
      if (v15 + 304 > v14) {
        goto LABEL_43;
      }
      *(void *)unint64_t v15 = v5;
      *(void *)(v15 + 8) = v22;
      unint64_t v6 = v31;
      if (v21 > v31) {
        goto LABEL_43;
      }
      *a1 = v21;
      a1[1] = v6;
      ++v12;
      if (v21 < v6)
      {
        v15 += 304LL;
        unint64_t v5 = v21;
        if (v12 < a3) {
          continue;
        }
      }

      goto LABEL_8;
    }
  }

uint64_t sub_18405B3C8(unint64_t *a1, uint64_t a2, unint64_t *a3, int a4)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  char v15 = 0;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0LL;
  if (v8 && v14 == a2)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t result = sub_18405AF74((uint64_t)a1, &v15, &v13);
    if ((result & 1) == 0) {
      return 0LL;
    }
    if (a3)
    {
      unint64_t v10 = a1[1];
      if (*a1 > v10) {
        goto LABEL_18;
      }
      *a3 = *a1;
      a3[1] = v10;
    }

    if (v15)
    {
      if (a4 >= 1)
      {
        uint64_t result = sub_18405B3C8(a1, 0LL, 0LL, (char)(a4 - 1));
        if (!(_DWORD)result) {
          return result;
        }
        return (sub_18405972C(a1, 1) & 1) != 0;
      }

      return 0LL;
    }

    unint64_t v11 = *a1;
    if (__CFADD__(*a1, v13))
    {
LABEL_19:
      __break(0x5513u);
      return result;
    }

    unint64_t v12 = v11 + v13;
    if (v11 <= v11 + v13 && v12 <= a1[1])
    {
      *a1 = v12;
      return 1LL;
    }

LABEL_18:
    __break(0x5519u);
    goto LABEL_19;
  }

  return result;
}

          __break(0x5519u);
          return result;
        }

  uint64_t result = 0LL;
LABEL_19:
  if (a3) {
    *a3 = v16;
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1LL;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1LL;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  if (v2 <= *(void *)(a2 + 8)) {
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    if (*a1 > a1[1]) {
      goto LABEL_20;
    }
    unint64_t v5 = *a1;
    unint64_t v6 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (!(_DWORD)result) {
      return result;
    }
    if (a2)
    {
      if (v6 < v5) {
        goto LABEL_20;
      }
      *a2 = v5;
      a2[1] = 0LL;
    }

    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1LL;
      }
    }

    else if (v5 <= v6)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (!(_DWORD)result) {
        return result;
      }
      if (v5 != v6) {
        return 0LL;
      }
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1LL;
      }
    }

LABEL_20:
    __break(0x5519u);
  }

  return result;
}

  if (v30) {
    CFRelease(v30);
  }
  _Block_object_dispose(&v42, 8);
  return v35;
}

uint64_t ccder_blob_decode_Time(void *a1)
{
  if (*a1 > a1[1]) {
    goto LABEL_6;
  }
  if ((ccder_blob_decode_tl() & 1) != 0) {
    return 0LL;
  }
  if (*a1 > a1[1]) {
LABEL_6:
  }
    __break(0x5519u);
  ccder_blob_decode_tl();
  return 0LL;
}

uint64_t ccder_blob_decode_GeneralName(unint64_t *a1, int *a2, unint64_t *a3)
{
  uint64_t result = 0LL;
  if (a2 && a3)
  {
    *a3 = 0LL;
    a3[1] = 0LL;
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      *a2 = 0;
LABEL_6:
      unint64_t v7 = v10;
LABEL_16:
      if (v7 <= a1[1] && *a1 <= v7)
      {
        *a1 = v7;
        return 1LL;
      }

LABEL_42:
      __break(0x5519u);
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v11 = *a1;
    unint64_t v16 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v11;
      if (v16 < v11) {
        goto LABEL_42;
      }
      *a3 = v11;
      a3[1] = 0LL;
      int v8 = 1;
LABEL_15:
      *a2 = v8;
      goto LABEL_16;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v12 = *a1;
    unint64_t v17 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v12;
      if (v17 < v12) {
        goto LABEL_42;
      }
      *a3 = v12;
      a3[1] = 0LL;
      int v8 = 2;
      goto LABEL_15;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      int v9 = 3;
LABEL_23:
      *a2 = v9;
      goto LABEL_6;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v13 = *a1;
    unint64_t v18 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v13;
      if (v18 < v13) {
        goto LABEL_42;
      }
      *a3 = v13;
      a3[1] = 0LL;
      int v8 = 4;
      goto LABEL_15;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      int v9 = 5;
      goto LABEL_23;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v14 = *a1;
    unint64_t v19 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v14;
      if (v19 < v14) {
        goto LABEL_42;
      }
      *a3 = v14;
      a3[1] = 0LL;
      int v8 = 6;
      goto LABEL_15;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v15 = *a1;
    unint64_t v20 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v15;
      if (v20 < v15) {
        goto LABEL_42;
      }
      *a3 = v15;
      a3[1] = 0LL;
      int v8 = 7;
      goto LABEL_15;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      int v9 = 8;
      goto LABEL_23;
    }
  }

  return result;
}

  CFAllocatorDeallocate(0LL, v11);
  unint64_t v39 = v37;
  __int128 v40 = v38;
LABEL_43:
  memset(buf, 0, sizeof(buf));
  __int128 v55 = 0;
  __int128 v56 = a2;
  __int128 v41 = CFDataGetLength(a1);
  if (v41 >= 28) {
    v42.length = 28LL;
  }
  else {
    v42.length = v41;
  }
  v42.location = 0LL;
  CFDataGetBytes(a1, v42, buf);
  __int128 v43 = bsearch_b(buf, v40, *(unsigned int *)(v16 + 12), 0x20uLL, &unk_189DAB5B0);
  if (v43 && v39)
  {
    if (v52) {
      MISBlacklistOverriddenByUser();
    }
    if (v53) {
      *__int128 v53 = *(_DWORD *)&v39[4 * ((v43 - (_BYTE *)v40) >> 5)];
    }
  }

  if ((unint64_t)(v16 + 1) >= 2)
  {
    munmap((void *)v16, v14);
    if (v13 < 0) {
      return 0LL;
    }
    goto LABEL_54;
  }

  if ((v13 & 0x80000000) == 0) {
LABEL_54:
  }
    close(v13);
  return 0LL;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = 0LL;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a1 < a2 && a4)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = a4 - 1;
    unint64_t v10 = a3;
    unint64_t v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      unint64_t v15 = a1;
      unint64_t v16 = a2;
      uint64_t result = X509CertificateParse((unint64_t *)v17, &v15);
      if ((_DWORD)result) {
        break;
      }
      a1 = v15;
      a2 = v16;
      *unint64_t v10 = v17[0];
      uint64_t v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++) {
          continue;
        }
      }

      goto LABEL_11;
    }
  }

  else
  {
LABEL_11:
    uint64_t result = 0LL;
    if (a5) {
      *a5 = v6;
    }
  }

  return result;
}

uint64_t CTParseExtensionValue( unint64_t a1, uint64_t a2, const void *a3, size_t a4, void *a5, void *a6)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_11;
  }
  v10[0] = a1;
  v10[1] = a1 + a2;
  uint64_t result = X509CertificateParseWithExtension((unint64_t *)v11, v10, a3, a4);
  if (!(_DWORD)result)
  {
    uint64_t result = 720914LL;
    if (*((void *)&v12 + 1))
    {
      uint64_t v9 = v13;
      if ((void)v13)
      {
        uint64_t result = 0LL;
        if (a5)
        {
          if (a6)
          {
            uint64_t result = 0LL;
            *a5 = *((void *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }

  return result;
}

uint64_t CTParseKey(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  memset(v8, 0, sizeof(v8));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_7:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_7;
  }
  v7[0] = a1;
  v7[1] = a1 + a2;
  uint64_t result = X509CertificateParse((unint64_t *)v8, v7);
  if (!(_DWORD)result) {
    return X509CertificateParseKey((uint64_t)v8, a3, a4);
  }
  return result;
}

uint64_t CTEvaluateSavageCertsWithUID( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return sub_18405BE8C(a1, a2, a3, a4, a5, a6, a7, a8, 0LL, 0LL, a9, (uint64_t)&unk_189DAB2D8, 2LL);
}

uint64_t sub_18405BE8C( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, _BYTE *a7, uint64_t a8, const void *a9, size_t a10, BOOL *a11, uint64_t a12, uint64_t a13)
{
  __b[152] = *MEMORY[0x1895F89C0];
  uint64_t result = (uint64_t)memset(__b, 170, 0x4C0uLL);
  memset(v33, 170, sizeof(v33));
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = 0LL;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_34;
  }
  if (a1 + a2 < a1) {
    goto LABEL_35;
  }
  unint64_t v30 = a1;
  unint64_t v31 = a1 + a2;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v30, (unint64_t)__b, 4LL, &v33[2], &v32);
  if ((_DWORD)result) {
    return result;
  }
  uint64_t result = 327690LL;
  if (v30 != v31) {
    return result;
  }
  if (v32 != 2) {
    return 327692LL;
  }
  X509ChainResetChain(v33, &v33[2]);
  __b[74] = v33[0];
  uint64_t v22 = v33[0] ? (uint64_t *)(v33[0] + 296) : &v33[1];
  *uint64_t v22 = (uint64_t)&__b[74];
  if ((void *)((char *)&__b[38] + 1) != 0LL && (unint64_t)__b >= 0xFFFFFFFFFFFFFECFLL) {
LABEL_34:
  }
    __break(0x5513u);
  v33[0] = (uint64_t)&__b[38];
  __b[75] = v33;
  __b[36] = 0LL;
  __b[37] = v33[1];
  *(void *)v33[1] = __b;
  v33[1] = (uint64_t)&__b[36];
  uint64_t result = X509ChainCheckPathWithOptions(12, v33, a12, 0LL);
  if ((_DWORD)result) {
    return result;
  }
  uint64_t v23 = **(void **)(v33[1] + 8);
  uint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 0x8000000000000000LL) != 0) {
    goto LABEL_35;
  }
  uint64_t v28 = a3;
  unint64_t v29 = a4;
  unsigned int v24 = (__int128 *)oidForPubKeyLength();
  uint64_t result = X509CertificateCheckSignatureWithPublicKey( &v28,  (uint64_t)&ecPublicKey,  v24,  v23 + 16,  (__int128 *)(v23 + 40),  (__int128 *)(v23 + 56));
  if ((_DWORD)result) {
    return result;
  }
  if (a9 && a10)
  {
    if ((a10 & 0x8000000000000000LL) != 0) {
      goto LABEL_35;
    }
  }

  unint64_t v25 = v33[0];
  LODWORD(result) = X509CertificateParseKey(v33[0], a5, a6);
  int v26 = result;
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 327691LL;
  }
  if (!v25 || v26) {
    return result;
  }
  if (a11) {
    *a11 = (*(void *)(v25 + 240) & a13) != 0;
  }
  if (!a7 || !a8) {
    return 0LL;
  }
  v27[0] = 0LL;
  v27[1] = 0LL;
  if (v25 >= v25 + 304) {
    goto LABEL_35;
  }
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(v25 + 104), v27);
  if ((_DWORD)result) {
    return result;
  }
  if (a8 < 0)
  {
LABEL_35:
    __break(0x5519u);
    return result;
  }

  uint64_t result = sub_18405CD84((uint64_t)v27, a7, a8);
  if (!(_DWORD)result) {
    return 0LL;
  }
  return result;
}

uint64_t CTEvaluateSavageCerts( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, BOOL *a7)
{
  return sub_18405BE8C(a1, a2, a3, a4, a5, a6, 0LL, 0LL, 0LL, 0LL, a7, (uint64_t)&unk_189DAB2D8, 2LL);
}

uint64_t CTEvaluateYonkersCerts( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return sub_18405BE8C(a1, a2, a3, a4, a5, a6, a7, a8, 0LL, 0LL, a9, (uint64_t)&unk_189DAB310, 0x80000LL);
}

uint64_t CTEvaluateSensorCerts( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, const void *a5, size_t a6, void *a7, void *a8, _BYTE *a9, uint64_t a10, BOOL *a11)
{
  return sub_18405BE8C(a1, a2, a3, a4, a7, a8, a9, a10, a5, a6, a11, (uint64_t)&unk_189DAB348, 0x10000000000LL);
}

uint64_t CTEvaluateCertsForPolicy( unint64_t a1, uint64_t a2, char a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, void *a10, __int128 *a11)
{
  v41[116] = *MEMORY[0x1895F89C0];
  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_42;
  }
  uint64_t v36 = a1 + a2;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v35 = a1;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4LL, &v38[2], &v37);
  if ((_DWORD)result) {
    return result;
  }
  if (v35 != v36) {
    return 327690LL;
  }
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    uint64_t v20 = v38[0];
    unint64_t v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0]) {
      unint64_t v21 = &v38[1];
    }
    *unint64_t v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7) {
      BOOL v23 = a8 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    *(void *)&__int128 v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    __int128 v31 = *a11;
    v32[0] = *((_BYTE *)a11 + 16);
    if (v23) {
      char v25 = a3;
    }
    else {
      char v25 = 1;
    }
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(__int128 *)((char *)a11 + 24);
      uint64_t v27 = (_UNKNOWN **)*((void *)a11 + 5);
    }

    else
    {
      uint64_t v26 = *((void *)a11 + 4);
      *(void *)&v32[8] = v34;
      *(void *)&v32[16] = v26;
      uint64_t v27 = oidForPubKeyLength();
    }

    uint64_t v28 = *((void *)a11 + 6);
    *(void *)&v32[24] = v27;
    uint64_t v33 = v28;
    uint64_t result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0LL);
    if (!(_DWORD)result)
    {
      unint64_t v29 = (void *)v38[0];
      if (!a5 || !a6 || !v38[0] || (uint64_t result = X509CertificateParseKey(v38[0], a5, a6), !(_DWORD)result))
      {
        if (a10 && v29)
        {
          uint64_t v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }

        uint64_t result = 0LL;
        if (a9)
        {
          if (v29)
          {
            uint64_t result = 0LL;
            *a9 = v29[30];
          }
        }
      }
    }

    return result;
  }

  if (v39[265])
  {
    if (v38[2])
    {
      uint64_t v22 = (_BYTE *)v38[2];
      while (v22[265])
      {
        uint64_t v22 = (_BYTE *)*((void *)v22 + 34);
        if (!v22)
        {
          uint64_t v22 = (_BYTE *)v38[2];
          break;
        }
      }
    }

    else
    {
      uint64_t v22 = 0LL;
    }
  }

  else
  {
    uint64_t v22 = v39;
  }

  uint64_t result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!(_DWORD)result) {
    goto LABEL_20;
  }
  return result;
}

uint64_t CTEvaluateSatori(unint64_t a1, uint64_t a2, char a3, void *a4, void *a5)
{
  return CTEvaluateCertsForPolicy(a1, a2, a3, 1, a4, a5, 0LL, 0LL, 0LL, 0LL, xmmword_189DAB380);
}

uint64_t CTEvaluateAcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 0, a3, a4, 0LL, 0LL, 0LL, 0LL, xmmword_189DAB3B8);
}

uint64_t CTEvaluateUcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0LL, 0LL, 0LL, 0LL, xmmword_189DAB3F0);
}

uint64_t CTEvaluateUcrtTestRoot( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  return CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, 0LL, 0LL, xmmword_189DAB3F0);
}

uint64_t CTEvaluatePragueSignatureCMS( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unint64_t v9 = 0xAAAAAAAA0000AA01LL;
  __int128 v8 = xmmword_184074E50;
  BYTE1(v9) = a5;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTEvaluateKDLSignatureCMS( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unint64_t v9 = 0xAAAAAAAA0000AA01LL;
  __int128 v8 = xmmword_184074E60;
  BYTE1(v9) = a5;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTVerifyAppleMarkerExtension(void *a1, uint64_t a2)
{
  uint64_t result = 327700LL;
  unint64_t v4 = a1[31];
  unint64_t v5 = a1[32];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 327707LL;
  }
  uint64_t v7 = a1[30];
  if ((v7 & 0x100000000LL) == 0)
  {
    if ((v7 & 0x200000000LL) == 0) {
      return result;
    }
    if (!__CFADD__(v4, v5))
    {
      unint64_t v11 = v4 + v5;
      if (v4 + v5 != -1LL)
      {
        if (v5 > 0x13) {
          return 327704LL;
        }
        uint64_t v16 = (unsigned __int8 *)(v11 - 1);
        if (v11 - 1 >= v4)
        {
          uint64_t v10 = 0LL;
          uint64_t v17 = 0LL;
          while ((unint64_t)v16 < v11)
          {
            int v18 = *v16;
            if (v17 == 20) {
              break;
            }
            if ((v17 & 0x1FFFFFFFFFFFFFFFLL) == 0x14) {
              goto LABEL_39;
            }
            unint64_t v19 = (v18 - 48);
            unint64_t v20 = powersOfTen[v17];
            if (!is_mul_ok(v19, v20)) {
              goto LABEL_40;
            }
            unint64_t v21 = v19 * v20;
            BOOL v15 = __CFADD__(v10, v21);
            v10 += v21;
            if (v15) {
              goto LABEL_38;
            }
            ++v17;
          }

LABEL_37:
          __break(0x5519u);
LABEL_38:
          __break(0x5500u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(0x550Cu);
          goto LABEL_41;
        }

        goto LABEL_13;
      }
    }

LABEL_41:
    __break(0x5513u);
    return result;
  }

  if (__CFADD__(v4, v5)) {
    goto LABEL_41;
  }
  unint64_t v8 = v4 + v5;
  if (v4 + v5 == -1LL) {
    goto LABEL_41;
  }
  unint64_t v9 = (_BYTE *)(v8 - 1);
  if (v8 - 1 >= v4)
  {
    char v12 = 0;
    unint64_t v13 = 0LL;
    uint64_t v10 = 0LL;
    while ((unint64_t)v9 < v8)
    {
      unint64_t v14 = (unint64_t)(*v9 & 0x7F) << v12;
      BOOL v15 = __CFADD__(v10, v14);
      v10 += v14;
      if (v15) {
        goto LABEL_38;
      }
      if (v13 <= 7)
      {
        ++v13;
        --v9;
        v12 += 7;
      }

      goto LABEL_23;
    }

    goto LABEL_37;
  }

uint64_t CTVerifyHostname(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v3 = 327702LL;
  if (*(void *)(a1 + 232) && *(void *)(a1 + 224))
  {
    v7[1] = a3;
    unint64_t v8 = 0xAAAAAAAAAAAAAA00LL;
    v7[0] = a2;
    unsigned int v4 = X509CertificateParseGeneralNamesContent( a1,  (uint64_t (*)(void, int *, uint64_t))sub_18405C85C,  (uint64_t)v7);
    if ((_BYTE)v8) {
      unsigned int v5 = 0;
    }
    else {
      unsigned int v5 = 327706;
    }
    if (v4) {
      return v4;
    }
    else {
      return v5;
    }
  }

  return v3;
}

uint64_t sub_18405C85C(uint64_t result, void *a2, unint64_t a3)
{
  if ((_DWORD)result != 2) {
    return 1LL;
  }
  unsigned int v4 = *(char **)a3;
  size_t v5 = *(void *)(a3 + 8);
  size_t v6 = ~*(void *)a3;
  if (v5 > v6) {
    goto LABEL_50;
  }
  uint64_t v7 = &v4[v5];
  unint64_t v8 = v7 - 1;
  if (v7) {
    BOOL v9 = v8 >= v4;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9 || a3 + 24 < a3) {
    goto LABEL_49;
  }
  int v11 = *v8;
  uint64_t result = compare_octet_string((uint64_t)a2, a3);
  if (!(_DWORD)result) {
    goto LABEL_48;
  }
  if (v11 != 46) {
    goto LABEL_15;
  }
  size_t v12 = v5 - 1;
  if (v5)
  {
    if (v12 <= v5)
    {
      uint64_t result = compare_octet_string_raw((uint64_t)a2, v4, v12);
      if ((_DWORD)result)
      {
LABEL_15:
        unint64_t v13 = a2[1];
        if (v13 < 3) {
          return 1LL;
        }
        unint64_t v14 = (_BYTE *)*a2;
        if (*(_BYTE *)*a2 != 42) {
          return 1LL;
        }
        if (v14 != (_BYTE *)-1LL)
        {
          BOOL v15 = v14 + 1;
          if (v14[1] == 46)
          {
            uint64_t v16 = -2LL;
            uint64_t v17 = -v16;
            uint64_t v18 = 2LL;
            uint64_t result = 1LL;
            while (v17 != v18)
            {
              if (&v14[v18] < v14) {
                goto LABEL_49;
              }
              if (v14[v18] == 46)
              {
                if (v13 == v18) {
                  return 1LL;
                }
                size_t v19 = 0LL;
                if (v5)
                {
                  while (1)
                  {
                    unint64_t v20 = &v4[v19];
                    if (&v4[v19] >= v7 || v20 < v4) {
                      goto LABEL_49;
                    }
                    if (*v20 == 46) {
                      break;
                    }
                    if (v5 == ++v19)
                    {
                      size_t v19 = v5;
                      break;
                    }
                  }
                }

                size_t v22 = v13 - 1;
                BOOL v9 = v5 >= v19;
                size_t v23 = v5 - v19;
                if (!v9) {
                  goto LABEL_51;
                }
                if (v22 == v23)
                {
                  if (v19 > v6) {
                    goto LABEL_50;
                  }
                  uint64_t result = memcmp(v15, &v4[v19], v13 - 1);
                  if (!(_DWORD)result) {
                    goto LABEL_48;
                  }
                }

                if (v11 != 46) {
                  return 1LL;
                }
                if (!v23) {
                  goto LABEL_51;
                }
                if (v22 != v23 - 1) {
                  return 1LL;
                }
                if (v19 <= v6)
                {
                  if (!memcmp(v15, &v4[v19], v22)) {
                    goto LABEL_48;
                  }
                  return 1LL;
                }

                goto LABEL_50;
              }

              if (v13 == ++v18) {
                return result;
              }
            }

            goto LABEL_50;
          }

          return 1LL;
        }

LABEL_50:
        __break(0x5513u);
        goto LABEL_51;
      }

LABEL_48:
      uint64_t result = 0LL;
      *(_BYTE *)(a3 + 16) = 1;
      return result;
    }

LABEL_49:
    __break(0x5519u);
    goto LABEL_50;
  }

LABEL_51:
  __break(0x5515u);
  return result;
}

uint64_t CTEvaluateAppleSSLWithOptionalTemporalCheck( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  unint64_t v20 = 0xAAAAAAAA00AAAA01LL;
  unint64_t v21 = &null_octet;
  __int128 v19 = xmmword_184074E70;
  BYTE1(v20) = a6;
  BYTE2(v20) = a7;
  size_t v22 = &null_octet;
  size_t v23 = &null_octet;
  __int128 v24 = &CTOctetServerAuthEKU;
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t result = CTEvaluateCertsForPolicy(a1, a2, a6, 1, &v17, &v18, 0LL, 0LL, 0LL, 0LL, &v19);
  if (!(_DWORD)result)
  {
    *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[17] = v13;
    v16[18] = v13;
    v16[15] = v13;
    v16[16] = v13;
    v16[13] = v13;
    v16[14] = v13;
    v16[11] = v13;
    v16[12] = v13;
    v16[9] = v13;
    v16[10] = v13;
    v16[7] = v13;
    v16[8] = v13;
    v16[6] = v13;
    _OWORD v16[4] = v13;
    v16[5] = v13;
    v16[2] = v13;
    v16[3] = v13;
    v16[0] = v13;
    v16[1] = v13;
    memset(v15, 170, sizeof(v15));
    if (__CFADD__(a1, a2))
    {
      __break(0x5513u);
    }

    else
    {
      v14[0] = a1;
      v14[1] = a1 + a2;
      uint64_t result = (uint64_t)X509ChainParseCertificateSet(v14, (unint64_t)v16, 1LL, &v15[1], v15);
      if (!(_DWORD)result)
      {
        uint64_t result = CTVerifyAppleMarkerExtension(v16, a5);
        if (!(_DWORD)result) {
          return CTVerifyHostname((uint64_t)v16, a3, a4);
        }
      }
    }
  }

  return result;
}

uint64_t CTEvaluateAppleSSL(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return CTEvaluateAppleSSLWithOptionalTemporalCheck(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t CTGetSEKType(unint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_10:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_10;
  }
  v3[0] = a1;
  v3[1] = a1 + a2;
  return 2LL;
}

uint64_t CTEvaluateSEK(char a1, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t result = 327712LL;
  if ((a1 & 3) != 0)
  {
    if ((a1 & 1) == 0
      || (uint64_t result = CTEvaluateCertsForPolicy(a2, a3, 0, 1, a4, a5, 0LL, 0LL, 0LL, 0LL, xmmword_189DAB428), (_DWORD)result))
    {
      if ((a1 & 2) != 0) {
        return CTEvaluateCertsForPolicy( a2,  a3,  0,  1,  a4,  a5,  (uint64_t)&unk_184074B54,  97LL,  0LL,  0LL,  xmmword_189DAB428);
      }
    }
  }

  return result;
}

uint64_t sub_18405CD84(uint64_t result, _BYTE *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)result;
  uint64_t v4 = *(void *)(result + 8);
  if (__CFADD__(*(void *)result, v4)) {
    goto LABEL_31;
  }
  unint64_t v6 = v5 + v4;
  uint64_t v7 = *(unsigned __int8 **)result;
  if (v5 < v6)
  {
    while ((unint64_t)v7 >= v5)
    {
      int v3 = *v7;
      goto LABEL_6;
    }

    goto LABEL_34;
  }

LABEL_6:
  unint64_t v8 = v7 + 1;
  int v3 = 327693;
  uint64_t result = 327693LL;
  if (a3 < 0 || v5 > (unint64_t)v8)
  {
LABEL_34:
    __break(0x5519u);
    return result;
  }

  if (__CFADD__(v8, v6 - (void)v8)) {
    goto LABEL_31;
  }
  if (v6 - (void)v8 != 2 * a3) {
    return (v3 + 1);
  }
  if (__CFADD__(a2, a3) || v7 == (unsigned __int8 *)-2LL)
  {
LABEL_31:
    __break(0x5513u);
    return (v3 + 1);
  }

  BOOL v9 = v7 + 2;
  uint64_t v10 = a2;
  while (1)
  {
    uint64_t result = 0LL;
    int v11 = v9 - 1;
    size_t v12 = &asciiNibbleToByte[*v11];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    if (v11 < v7) {
      goto LABEL_34;
    }
    unint64_t v14 = &asciiNibbleToByte[*v9];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    unsigned int v15 = *v12;
    uint64_t result = 327695LL;
    if (v15 > 0xF) {
      return result;
    }
    unsigned int v16 = *v14;
    if (v16 > 0xF) {
      return result;
    }
    if (v10 < a2) {
      goto LABEL_34;
    }
    *v10++ = v16 | (16 * v15);
    v9 += 2;
    if (!v9) {
      goto LABEL_31;
    }
  }

  if (trust) {
    CFRelease(trust);
  }
  CFRelease(a2);
  return v9;
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  unint64_t v68 = 0LL;
  uint64_t v69 = 0LL;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (*a2 > v5) {
    goto LABEL_186;
  }
  uint64_t v10 = 720915LL;
  unint64_t v66 = *a2;
  unint64_t v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  uint64_t result = ccder_blob_decode_tl();
  if (!(_DWORD)result) {
    return v10;
  }
  uint64_t v12 = v69;
  unint64_t v13 = v66;
  unint64_t v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4)) {
    goto LABEL_188;
  }
  if (v14 > v5 - v4) {
    goto LABEL_186;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  unint64_t v15 = v13 + v12;
  if (v13 > v15 || v15 > v67) {
    goto LABEL_186;
  }
  unint64_t v64 = v13;
  unint64_t v65 = v15;
  unint64_t v62 = v13;
  unint64_t v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68)) {
      goto LABEL_187;
    }
    uint64_t v16 = 720916LL;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v64 = v62 + v68;
      unint64_t v65 = v63;
      goto LABEL_14;
    }

    return v16;
  }

LABEL_14:
  unint64_t v18 = v64;
  unint64_t v17 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v19 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 136) = v64;
  *(void *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19)) {
    goto LABEL_187;
  }
  unint64_t v20 = v18 + v19;
  if (v18 > v20 || v20 > v17) {
    goto LABEL_186;
  }
  unint64_t v64 = v20;
  unint64_t v22 = v64;
  unint64_t v21 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v23 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 120) = v64;
  *(void *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23)) {
    goto LABEL_187;
  }
  unint64_t v24 = v22 + v23;
  if (v22 > v24 || v24 > v21) {
    goto LABEL_186;
  }
  unint64_t v64 = v24;
  unint64_t v26 = v64;
  unint64_t v25 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v27 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 72) = v64;
  *(void *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27)) {
    goto LABEL_187;
  }
  unint64_t v28 = v26 + v27;
  if (v26 > v28 || v28 > v25) {
    goto LABEL_186;
  }
  unint64_t v64 = v28;
  unint64_t v29 = v64;
  unint64_t v30 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v31 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 104) = v64;
  *(void *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31)) {
    goto LABEL_187;
  }
  unint64_t v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30) {
    goto LABEL_186;
  }
  unint64_t v64 = v29 + v31;
  uint64_t result = ccder_blob_decode_tl();
  if (!(_DWORD)result) {
    return 720922LL;
  }
  unint64_t v33 = v64;
  unint64_t v34 = v68;
  unint64_t v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32) {
      goto LABEL_186;
    }
    *(void *)(a1 + 88) = v32;
    *(void *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34)) {
      goto LABEL_187;
    }
    unint64_t v36 = v33 + v34;
    if (v33 > v36 || v36 > v65) {
      goto LABEL_186;
    }
    unint64_t v63 = v65;
    unint64_t v64 = v36;
    unint64_t v62 = v36;
    if ((ccder_blob_decode_tl() & 1) != 0) {
      return 720923LL;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if ((ccder_blob_decode_tl() & 1) != 0) {
      return 720924LL;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl())
    {
      unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68)) {
        goto LABEL_187;
      }
      if (v62 > v62 + v68 || v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v60 = v62;
      unint64_t v61 = v62 + v68;
      unint64_t v37 = v60;
      if (__CFADD__(v60, v68)) {
LABEL_187:
      }
        __break(0x5513u);
      unint64_t v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61) {
        goto LABEL_186;
      }
      unint64_t v61 = v60 + v68;
      *(_BYTE *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3) {
        BOOL v39 = a4 == 0;
      }
      else {
        BOOL v39 = 1;
      }
      int v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        unsigned __int8 v53 = 0;
        int v41 = 0;
        do
        {
          unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
          char v57 = 0;
          uint64_t v56 = 0LL;
          if ((ccder_blob_decode_tl() & 1) == 0) {
            return 720926LL;
          }
          unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          if (v60 > v60 + v56 || v60 + v56 > v61) {
            goto LABEL_186;
          }
          unint64_t v54 = v60;
          unint64_t v55 = v60 + v56;
          if (v55 < v54 || v68 > v55 - v54) {
            goto LABEL_186;
          }
          unint64_t v58 = v54;
          unint64_t v59 = v68;
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v55 != v54 + v68) {
            return 720929LL;
          }
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54) {
              goto LABEL_186;
            }
            unint64_t v43 = v68;
            if (v68 > v55 - v54) {
              goto LABEL_186;
            }
            *(void *)(a1 + 248) = v54;
            *(void *)(a1 + 256) = v43;
          }

          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 15)
            {
              uint64_t v16 = 720930LL;
              if ((v41 & 1) != 0 || (sub_18405D9A0() & 1) == 0) {
                return v16;
              }
              v41 |= 1u;
              goto LABEL_155;
            }

            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 19)
            {
              uint64_t v16 = 720931LL;
              if ((v41 & 2) != 0 || (sub_18405DA6C(&v54, (void *)(a1 + 200), (_BYTE *)(a1 + 265)) & 1) == 0) {
                return v16;
              }
              v41 |= 2u;
              goto LABEL_155;
            }

            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 35)
            {
              uint64_t v16 = 720932LL;
              if ((v41 & 4) != 0
                || (sub_18405DB38(&v54, (unint64_t *)(a1 + 168), (void *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }

              v41 |= 4u;
              goto LABEL_155;
            }

            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 14)
            {
              uint64_t v16 = 720933LL;
              if ((v41 & 8) != 0
                || (sub_18405DC5C(&v54, (unint64_t *)(a1 + 184), (void *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }

              v41 |= 8u;
              goto LABEL_155;
            }

            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 37)
            {
              uint64_t v16 = 720934LL;
              if ((v41 & 0x10) != 0
                || (sub_18405DD1C(&v54, (unint64_t *)(a1 + 208), (void *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }

              v41 |= 0x10u;
              goto LABEL_155;
            }

            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 17)
            {
              uint64_t v16 = 720935LL;
              if ((v41 & 0x20) != 0
                || (sub_18405DE28(&v54, (unint64_t *)(a1 + 224), (void *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }

              v41 |= 0x20u;
              goto LABEL_155;
            }
          }

          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            uint64_t v16 = 720936LL;
            uint64_t result = sub_18405DF80((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!(_DWORD)result) {
              return v16;
            }
            if (v53 == 0xFF) {
              goto LABEL_189;
            }
            ++v53;
            goto LABEL_155;
          }

          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (v57) {
            *(_BYTE *)(a1 + 266) = 1;
          }
LABEL_155:
          if (v54 != v55) {
            return 720926LL;
          }
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          unint64_t v37 = v60 + v56;
          if (v60 > v60 + v56) {
            goto LABEL_186;
          }
          unint64_t v38 = v61;
          if (v37 > v61) {
            goto LABEL_186;
          }
          v60 += v56;
        }

        while (v37 < v61);
      }

      if (v37 != v38) {
        return 720925LL;
      }
      if (v37 > v65 || v64 > v37) {
        goto LABEL_186;
      }
      unint64_t v64 = v37;
    }

    if (*(void *)(a1 + 32) < 3uLL)
    {
      uint64_t v16 = 720915LL;
      if (v64 != v65) {
        return v16;
      }
LABEL_170:
      if (__CFADD__(v66, v69)) {
        goto LABEL_187;
      }
      if (v66 > v66 + v69 || v66 + v69 > v67) {
        goto LABEL_186;
      }
      v66 += v69;
      *(void *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v60 = 0LL;
      uint64_t result = ccder_blob_decode_bitstring();
      if (!(_DWORD)result) {
        return 720938LL;
      }
      if (v60 < 0xFFFFFFFFFFFFFFF9LL)
      {
        if (*((void *)&v70[0] + 1) >= *(void *)&v70[0])
        {
          unint64_t v51 = (v60 + 7) >> 3;
          if (v51 <= *((void *)&v70[0] + 1) - *(void *)&v70[0])
          {
            *(void *)(a1 + 56) = *(void *)&v70[0];
            *(void *)(a1 + 64) = v51;
            unint64_t v52 = v67;
            if (v66 <= v67)
            {
              uint64_t v16 = 0LL;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }

        goto LABEL_186;
      }

      goto LABEL_188;
    }

    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }

      return;
    }

    unint64_t v8 = CFGetTypeID(v5);
    if (v8 != CFArrayGetTypeID())
    {
      sub_184068378();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buffer = 136315394;
        unint64_t v19 = "logResourceError";
        unint64_t v20 = 2080;
        unint64_t v21 = a3;
        _os_log_error_impl( &dword_18404B000,  v7,  OS_LOG_TYPE_ERROR,  "%s: unexpected object type processing %s errors",  buffer,  0x16u);
      }

      goto LABEL_14;
    }

    Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      uint64_t v10 = Count;
      for (unint64_t i = 0LL; i != v10; ++i)
      {
        ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v5, i);
        CFURLGetFileSystemRepresentation(ValueAtIndex, 1u, buffer, 1024LL);
        sub_184068378();
        unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          unint64_t v15 = a3;
          uint64_t v16 = 2080;
          unint64_t v17 = buffer;
          _os_log_impl(&dword_18404B000, v13, OS_LOG_TYPE_DEFAULT, "%s: %s", buf, 0x16u);
        }
      }
    }
  }

LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }

LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t sub_18405D88C(void *a1, int a2, _BYTE *a3)
{
  if (*a1 > a1[1]) {
    __break(0x5519u);
  }
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2) {
    return 0LL;
  }
  if (a3) {
    *a3 = 0;
  }
  return 1LL;
}

uint64_t sub_18405D9A0()
{
  uint64_t result = ccder_blob_decode_bitstring();
  if ((_DWORD)result) {
    return 0LL;
  }
  return result;
}

uint64_t sub_18405DA6C(void *a1, void *a2, _BYTE *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    uint64_t result = sub_18405D88C(a1, 1, a3);
    if ((_DWORD)result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3) {
          return 0LL;
        }
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }

      return 1LL;
    }
  }

  return result;
}

uint64_t sub_18405DB38(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556LL) {
      goto LABEL_15;
    }
    if (v7 - 0x5555555555555556LL != a1[1]) {
      return 0LL;
    }
    if (v7 > v7 - 0x5555555555555556LL) {
      goto LABEL_16;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556LL;
    uint64_t result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
        goto LABEL_16;
      }
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }

    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
LABEL_15:
      __break(0x5513u);
    }

    else
    {
      unint64_t v9 = v8 - 0x5555555555555556LL;
      if (v8 <= v8 - 0x5555555555555556LL && v9 <= a1[1])
      {
        *a1 = v9;
        return 1LL;
      }
    }

uint64_t sub_18405DC5C(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v12 = v11 - 0x5555555555555556LL;
    if (v11 > v11 - 0x5555555555555556LL || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }

  return result;
}

uint64_t sub_18405DD1C(unint64_t *a1, unint64_t *a2, void *a3)
{
  int v6 = ccder_blob_decode_tl();
  uint64_t result = 0LL;
  if (v6)
  {
    if (*a1 > a1[1]) {
      goto LABEL_11;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = a1[1];
    uint64_t result = ccder_blob_decode_tl();
    if (!(_DWORD)result) {
      return result;
    }
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_11;
    }
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v9 = v8 - 0x5555555555555556LL;
    if (v8 > v8 - 0x5555555555555556LL || v9 > a1[1]) {
LABEL_11:
    }
      __break(0x5519u);
    *a1 = v9;
  }

  return result;
}

uint64_t sub_18405DE28(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result == 1)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v12 = v11 - 0x5555555555555556LL;
    if (v11 > v11 - 0x5555555555555556LL || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }

  return result;
}

uint64_t sub_18405DEF8(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0LL;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16LL * (char)v6)
  {
    uint64_t result = compare_octet_string((uint64_t)v5, a2 + 16LL * v6);
    if (!(_DWORD)result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16LL * a3);
      *unint64_t v10 = *v5;
      v10[1] = v9;
      return 1LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t sub_18405DF80( uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (a6) {
    a5 = 0LL;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_261;
    }

LABEL_157:
    int v44 = 0;
LABEL_158:
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 27) {
      return sub_184060028(result, a2, a3, a4, a5);
    }
    if (!v44) {
      goto LABEL_232;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 37748736LL;
    }

    else
    {
      if (*(void *)a2 != 0x66463F78648862ALL || *(_WORD *)(a2 + 8) != 4354)
      {
        if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327) {
          return (uint64_t)sub_184060244((unint64_t *)result, a4, a5);
        }
        if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841LL)
        {
          unint64_t v52 = *(void *)result;
          unint64_t v51 = *(void *)(result + 8);
          if (a5)
          {
            if (v52 > v51) {
              goto LABEL_265;
            }
            *a5 = v52;
            a5[1] = v51 - v52;
          }

          *a4 |= 0x80000000uLL;
LABEL_233:
          if (v52 <= v51)
          {
            *(void *)uint64_t result = v51;
            return 1LL;
          }

LABEL_265:
          __break(0x5519u);
          return result;
        }

        goto LABEL_232;
      }

      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 0x8004000000LL;
    }

LABEL_201:
    uint64_t v24 = v54 | v55;
    goto LABEL_261;
  }

  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0LL;
      goto LABEL_201;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_203;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315) {
      return sub_18405FDC0((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304) {
      return sub_18405FEA0();
    }
    int v44 = 1;
    goto LABEL_158;
  }

  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_232;
    }
    goto LABEL_157;
  }

  if (*(void *)a2 == 0xB6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1) {
    return sub_18405FA0C((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 49)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44) {
      return sub_18405FB44((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36) {
      return sub_18405FCD8((unint64_t *)result);
    }
    if (*(void *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 22)
    {
      if (*(void *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
      {
        uint64_t result = ccder_blob_check_null();
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x8000000000LL;
        goto LABEL_261;
      }

      if (*(void *)a2 != 0xA6463F78648862ALL || *(_BYTE *)(a2 + 8) != 1)
      {
        if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
        {
          uint64_t result = ccder_blob_check_null();
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t v24 = *a4 | 0x2000000;
        }

        else
        {
          if (*(void *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
          {
            if (*(void *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3) {
              return sub_1840600F4((unint64_t *)result, a4, a5);
            }
            goto LABEL_232;
          }

          uint64_t result = ccder_blob_check_null();
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t v24 = *a4 | 0x4000000;
        }

LABEL_261:
        *a4 = v24;
        return 1LL;
      }

      *a4 |= 0x1000000uLL;
LABEL_232:
      unint64_t v52 = *(void *)result;
      unint64_t v51 = *(void *)(result + 8);
      goto LABEL_233;
    }

    uint64_t result = ccder_blob_check_null();
    if (!(_DWORD)result) {
      return result;
    }
    uint64_t v54 = *a4;
    uint64_t v55 = 1048584LL;
    goto LABEL_201;
  }

  char v56 = 0;
  uint64_t result = sub_18405D88C((void *)result, 0, &v56);
  if ((_DWORD)result)
  {
    uint64_t v53 = 0x10000080002LL;
    if (!v56) {
      uint64_t v53 = 0x20000040001LL;
    }
    *a4 |= v53;
  }

  return result;
}

uint64_t X509CertificateParseWithExtension( unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939LL;
  unint64_t v9 = *a2;
  unint64_t v10 = a2[1];
  unint64_t v11 = *a2;
  uint64_t result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  uint64_t v8 = result;
  if ((_DWORD)result) {
    return v8;
  }
  if (v11 >= 0x5555555555555556LL)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }

  uint64_t v8 = 720939LL;
  if (*a2 != v11 - 0x5555555555555556LL) {
    return v8;
  }
  unint64_t v13 = v11 - v9 - 0x5555555555555556LL;
  if (v11 - v9 >= 0x5555555555555556LL) {
    goto LABEL_11;
  }
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0LL;
  }

LABEL_12:
  __break(0x5519u);
  return result;
}

  unint64_t v11 = v14 - 0x5555555555555556LL;
  if (v14 > v14 - 0x5555555555555556LL || v11 > v13) {
    goto LABEL_30;
  }
  if (v11 == v13)
  {
    if (a3)
    {
      *a3 = 0LL;
      a3[1] = 0LL;
    }
  }

  else if (a3)
  {
    *a3 = v11;
    a3[1] = v13 - v11;
  }

  if (v13 > v15 || v14 > v13) {
    goto LABEL_30;
  }
  *a4 = 0LL;
  a4[1] = 0LL;
  if (v13 == v15) {
    return 0LL;
  }
  else {
    return 655365LL;
  }
}

    __break(0x5519u);
  }

  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0LL, 0LL);
}

uint64_t X509CertificateParseSPKI( unint64_t *a1, unint64_t *a2, unint64_t *a3, void *a4)
{
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (__CFADD__(*a1, v5)) {
    goto LABEL_31;
  }
  unint64_t v6 = v4 + v5;
  if (v4 > v6) {
    goto LABEL_30;
  }
  uint64_t v10 = 655361LL;
  unint64_t v14 = *a1;
  unint64_t v15 = v6;
  if (v14 >= 0x5555555555555556LL) {
LABEL_31:
  }
    __break(0x5513u);
  if (v14 > v14 - 0x5555555555555556LL || v14 - 0x5555555555555556LL > v15) {
    goto LABEL_30;
  }
  unint64_t v13 = v14 - 0x5555555555555556LL;
  if (a2)
  {
    if (v13 >= v14)
    {
      *a2 = v14;
      a2[1] = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_12;
    }

uint64_t X509CertificateParseKey(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t result = 327691LL;
  if (a1)
  {
    if (*(void *)(a1 + 96))
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      uint64_t result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0LL, 0LL, &v8);
      if (!(_DWORD)result)
      {
        if (a2)
        {
          if (a3)
          {
            uint64_t v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }

  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, uint64_t *a3, __int128 *a4, __int128 *a5)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  __int128 v28 = 0uLL;
  __int128 v27 = 0uLL;
  unint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v24 = 0LL;
  __int128 v23 = 0u;
  __int128 v22 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v9 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v28, (unint64_t *)&v27, &v25);
  if ((_DWORD)v9) {
    return v9;
  }
  uint64_t v9 = 655632LL;
  if (compare_octet_string((uint64_t)&v28, (uint64_t)&rsaEncryption))
  {
    unint64_t v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))validateSignatureEC;
  }

  else
  {
    unint64_t v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))validateSignatureRSA;
  }

  memset(v14, 0, sizeof(v14));
  __int128 v19 = *a5;
  __int128 v15 = *a4;
  __int128 v17 = v28;
  __int128 v18 = v27;
  if (((a1 & 1) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha512, 9uLL)))
  {
    return v9;
  }

  uint64_t result = v25;
  if (v26 || !v25)
  {
    uint64_t v12 = *a3;
    uint64_t v13 = a3[1];
    if (v13 || !v12)
    {
      if (v11(v25, v26, v12, v13, v14)) {
        return 0LL;
      }
      else {
        return 655648LL;
      }
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[2] = v8;
  v12[3] = v8;
  v12[0] = v8;
  v12[1] = v8;
  v11[0] = (uint64_t)v12;
  v11[1] = 64LL;
  __int128 v10 = 0uLL;
  uint64_t result = sub_18405EFA0(a3, a4, (uint64_t)v11, &v10);
  if (!(_DWORD)result) {
    return X509CertificateCheckSignatureDigest(a1, a2, v11, &v10, a5);
  }
  return result;
}

uint64_t sub_18405EFA0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!(_DWORD)result) {
    goto LABEL_8;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9LL;
    if (*(void *)(a3 + 8) < 0x20uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 32LL;
    ccsha256_di();
    goto LABEL_14;
  }

  uint64_t result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!(_DWORD)result) {
    goto LABEL_12;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!(_DWORD)result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5LL;
    if (*(void *)(a3 + 8) < 0x14uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 20LL;
    ccsha1_di();
LABEL_14:
    ccdigest();
    return 0LL;
  }

  uint64_t result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!(_DWORD)result) {
    goto LABEL_10;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if ((_DWORD)result) {
    return 656640LL;
  }
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9LL;
  if (*(void *)(a3 + 8) >= 0x30uLL)
  {
    *(void *)(a3 + 8) = 48LL;
    ccsha384_di();
    goto LABEL_14;
  }

uint64_t X509CertificateCheckSignatureWithPublicKey( uint64_t *a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, __int128 *a6)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[2] = v11;
  v32[3] = v11;
  v32[0] = v11;
  v32[1] = v11;
  unint64_t v30 = v32;
  uint64_t v31 = 64LL;
  __int128 v29 = 0uLL;
  uint64_t v12 = sub_18405EFA0(a4, (uint64_t)a5, (uint64_t)&v30, &v29);
  if ((_DWORD)v12) {
    return v12;
  }
  uint64_t v12 = 655617LL;
  if (compare_octet_string(a2, (uint64_t)&rsaEncryption))
  {
    uint64_t v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))validateSignatureEC;
  }

  else
  {
    uint64_t v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))validateSignatureRSA;
  }

  uint64_t v28 = 0LL;
  __int128 v27 = 0u;
  __int128 v26 = 0u;
  __int128 v25 = 0u;
  __int128 v24 = 0u;
  __int128 v22 = 0u;
  __int128 v20 = 0u;
  __int128 v18 = 0u;
  __int128 v21 = *a5;
  uint64_t v17 = 0LL;
  __int128 v23 = *a6;
  __int128 v19 = v29;
  if (a3) {
    __int128 v14 = *a3;
  }
  else {
    __int128 v14 = null_octet;
  }
  __int128 v22 = v14;
  uint64_t result = *a1;
  uint64_t v16 = a1[1];
  if ((v16 || !result) && (!v30 || v31))
  {
    else {
      return 655648LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParseGeneralNamesContent( uint64_t a1, uint64_t (*a2)(void, int *, uint64_t), uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unint64_t v3 = *(void *)(a1 + 224);
  uint64_t v4 = *(void *)(a1 + 232);
  if (__CFADD__(v3, v4))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }

  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_11;
  }
  unint64_t v10 = *(void *)(a1 + 224);
  unint64_t v11 = v5;
  while (1)
  {
    if (v10 >= v11) {
      return 0LL;
    }
    memset(v9, 170, sizeof(v9));
  }

  return 720912LL;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  unint64_t v20 = v3;
  if (__CFADD__(*a1, v3)) {
    goto LABEL_59;
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_58:
    __break(0x5519u);
    goto LABEL_59;
  }

  uint64_t v6 = 720901LL;
  unint64_t v18 = *a1;
  unint64_t v19 = v4;
  *a2 = 0LL;
  a2[1] = 0LL;
  if (v2 < v4)
  {
    while (1)
    {
      unint64_t v2 = v18;
      if (__CFADD__(v18, v20)) {
        break;
      }
      unint64_t v7 = v18 + v20;
      if (v18 > v18 + v20 || v7 > v19) {
        goto LABEL_58;
      }
      unint64_t v16 = v18;
      unint64_t v17 = v18 + v20;
      while (v2 < v7)
      {
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20 || v16 + v20 > v17) {
          goto LABEL_58;
        }
        unint64_t v15 = v16 + v20;
        unint64_t v2 = v16 + v20;
        if (v16 > v15) {
          goto LABEL_58;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20) {
          goto LABEL_58;
        }
        unint64_t v14 = v16 + v20;
        if (v20 == 3 && *(_WORD *)v16 == 1109 && *(_BYTE *)(v16 + 2) == 3)
        {
          unint64_t v12 = v16 + v20;
          unint64_t v13 = v16 + v20;
          if ((ccder_blob_decode_tl() & 1) == 0)
          {
            if (v14 > v15) {
              goto LABEL_58;
            }
            unint64_t v12 = v16 + v20;
            unint64_t v13 = v16 + v20;
            if ((ccder_blob_decode_tl() & 1) == 0)
            {
              if (v14 > v15) {
                goto LABEL_58;
              }
              unint64_t v12 = v16 + v20;
              unint64_t v13 = v16 + v20;
            }
          }

          if (__CFADD__(v12, v20)) {
            goto LABEL_59;
          }
          unint64_t v2 = v12 + v20;
          if (v15 != v12 + v20) {
            return 720902LL;
          }
          if (v13 < v12 || v20 > v13 - v12) {
            goto LABEL_58;
          }
          *a2 = v12;
          a2[1] = v20;
        }

        unint64_t v7 = v18 + v20;
        if (v2 > v17 || v16 > v2) {
          goto LABEL_58;
        }
        unint64_t v16 = v2;
      }

      if (v2 != v7) {
        return 720903LL;
      }
      unint64_t v4 = v19;
      if (v2 > v19 || v18 > v2) {
        goto LABEL_58;
      }
      unint64_t v18 = v2;
      if (v2 >= v19) {
        goto LABEL_46;
      }
    }

LABEL_59:
    __break(0x5513u);
  }

LABEL_46:
  if (v2 != v4) {
    return 720904LL;
  }
  if (a2[1] && *a2) {
    return 0LL;
  }
  *a2 = 0LL;
  a2[1] = 0LL;
  return 720905LL;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  BOOL result = 0LL;
  v6[1] = *MEMORY[0x1895F89C0];
  time_t v5 = 0LL;
  v6[0] = 0LL;
  if (a1 && a2 != -1) {
    return !X509CertificateGetNotBefore(a1, v6)
  }
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6[0]) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  v4[2] = *(const char **)MEMORY[0x1895F89C0];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result) {
    return sub_18405F8EC(v4, a2);
  }
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  v4[2] = *(const char **)MEMORY[0x1895F89C0];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result) {
    return sub_18405F8EC(v4, a2);
  }
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2 = time(0LL);
  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result)
{
  time_t v6[2] = *MEMORY[0x1895F89C0];
  uint64_t v1 = 720906LL;
  if (!result) {
    return v1;
  }
  unint64_t v2 = *(void *)(result + 72);
  uint64_t v3 = *(void *)(result + 80);
  if (!v2 || v3 == 0) {
    return v1;
  }
  if (__CFADD__(v2, v3))
  {
    __break(0x5513u);
  }

  else
  {
    unint64_t v5 = v2 + v3;
    if (v2 <= v5)
    {
      v6[0] = *(void *)(result + 72);
      v6[1] = v5;
      return 720908LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t sub_18405F8EC(const char **a1, time_t *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = 720909LL;
  if (!a1) {
    return v2;
  }
  unint64_t v4 = a1[1];
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  unint64_t v7 = *a1;
  if (v4 == (const char *)13)
  {
    uint64_t result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150) {
      v11.tm_year -= 100;
    }
  }

  else
  {
    uint64_t result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }

  uint64_t v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    time_t v10 = timegm(&v11);
    if (v10 == -1) {
      return 720911LL;
    }
    uint64_t v2 = 0LL;
    if (a2) {
      *a2 = v10;
    }
    return v2;
  }

  __break(0x5513u);
  return result;
}

BOOL sub_18405FA0C(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  unint64_t v11 = v3 - *a1;
  if ((ccder_blob_decode_tl() & 1) != 0) {
    goto LABEL_5;
  }
  if (*a1 > a1[1]) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    unint64_t v8 = v12;
    unint64_t v7 = v13;
    if (v12 > v13) {
      goto LABEL_19;
    }
    *a1 = v12;
    a1[1] = v13;
    unint64_t v9 = v11;
  }

  else
  {
    unint64_t v8 = *a1;
    unint64_t v7 = a1[1];
    unint64_t v9 = v7 - *a1;
  }

  if (__CFADD__(v8, v9)) {
    goto LABEL_20;
  }
  if (v7 == v8 + v9)
  {
    if (!v9) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }

      goto LABEL_19;
    }

    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }

uint64_t sub_18405FB44(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
      __break(0x5513u);
      goto LABEL_12;
    }

    unint64_t v8 = v7 - 0x5555555555555556LL;
    if (a1[1] != v7 - 0x5555555555555556LL) {
      return 0LL;
    }
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8) {
        goto LABEL_12;
      }
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }

    if (v7 <= v8)
    {
      *a1 = v8;
      return 1LL;
    }

uint64_t sub_18405FCD8(unint64_t *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    unint64_t v3 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
      __break(0x5513u);
    }

    else
    {
      unint64_t v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556LL) {
        return 0LL;
      }
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1LL;
      }
    }

    __break(0x5519u);
  }

  return result;
}

uint64_t sub_18405FDC0(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
      __break(0x5513u);
    }

    else
    {
      unint64_t v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556LL) {
        return 0LL;
      }
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL) {
          goto LABEL_13;
        }
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }

      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1LL;
      }
    }

uint64_t sub_18405FEA0()
{
  return 0LL;
}

uint64_t sub_184060028(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null();
  if ((_DWORD)result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6LL) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1LL) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    unint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0LL;
      }
    }

    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }

    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1LL;
      }

      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }

      goto LABEL_25;
    }

    return 0LL;
  }

  return result;
}

uint64_t sub_1840600F4(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556LL) {
      goto LABEL_17;
    }
    if (a1[1] != v7 - 0x5555555555555556LL) {
      return 0LL;
    }
    if (v7 > v7 - 0x5555555555555556LL) {
      goto LABEL_18;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556LL;
    uint64_t result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      uint64_t result = ccder_blob_decode_tl();
      if ((_DWORD)result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
            goto LABEL_18;
          }
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }

        *a2 |= 0x240000800000uLL;
        unint64_t v8 = *a1;
        if (*a1 < 0x5555555555555556LL)
        {
          unint64_t v9 = v8 - 0x5555555555555556LL;
          if (v8 <= v8 - 0x5555555555555556LL && v9 <= a1[1])
          {
            *a1 = v9;
            return 1LL;
          }

unint64_t *sub_184060244(unint64_t *result, void *a2, unint64_t *a3)
{
  unint64_t v4 = *result;
  unint64_t v3 = result[1];
  unint64_t v5 = v3 - *result;
  if (v5 != 32) {
    return (unint64_t *)(v5 == 32);
  }
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }

    *a3 = v4;
    a3[1] = 32LL;
  }

  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0LL)
  {
    unint64_t v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *uint64_t result = v6;
      return (unint64_t *)(v5 == 32);
    }

    goto LABEL_12;
  }

unint64_t *X509ChainParseCertificateSet( unint64_t *result, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v5 = 0LL;
  *a4 = 0LL;
  a4[1] = 0LL;
  BOOL v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      uint64_t result = 0LL;
      *a5 = v5;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    unint64_t v9 = result;
    uint64_t v10 = 0LL;
    unint64_t v11 = a2 + 304 * a3;
    unint64_t v12 = ~a2;
    BOOL v13 = a4 + 1;
    BOOL v14 = (void *)(a2 + 272);
    uint64_t v15 = a3 - 1;
    unint64_t v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304LL) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      unint64_t v16 = v14 - 34;
      if (v14 != (void *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }

      uint64_t result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if ((_DWORD)result) {
        return result;
      }
      if (v10)
      {
        unint64_t v17 = (void *)*v13;
        *BOOL v14 = 0LL;
        v14[1] = v17;
        *unint64_t v17 = v16;
        *BOOL v13 = (unint64_t)v14;
      }

      else
      {
        uint64_t v18 = *a4;
        *(void *)(a2 + 272) = *a4;
        if (v18) {
          unint64_t v19 = (unint64_t *)(v18 + 280);
        }
        else {
          unint64_t v19 = v13;
        }
        *unint64_t v19 = v21;
        *a4 = v16;
        *(void *)(a2 + 280) = a4;
      }

      uint64_t v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        BOOL v6 = v15 == v10++;
        if (!v6) {
          continue;
        }
      }

      goto LABEL_6;
    }

    __break(0x5513u);
  }

  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  for (uint64_t i = *a1; i; uint64_t i = *(void *)(i + 272))
  {
  }

  return i;
}

void *X509ChainResetChain(void *result, void *a2)
{
  *uint64_t result = 0LL;
  result[1] = result;
  uint64_t v2 = (void *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0LL;
      v2[37] = 0LL;
      uint64_t v2 = (void *)v2[34];
    }

    while (v2);
  }

  return result;
}

uint64_t X509ChainBuildPathPartial(void *a1, uint64_t *a2, void *a3, int a4)
{
  if (!a1) {
    return 327691LL;
  }
  unint64_t v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0LL;
  a1[37] = a3;
  uint64_t v8 = (uint64_t)(a1 + 15);
  uint64_t result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if ((_DWORD)result)
  {
    while (1)
    {
      uint64_t v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (unint64_t v7 = (void *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        unint64_t v7 = (void *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (sub_1840605BC(v10, 1)) {
            return 0LL;
          }
          uint64_t v15 = sub_184060650(v10);
          if (a4) {
            unsigned int v16 = 0;
          }
          else {
            unsigned int v16 = 524296;
          }
          if (v15) {
            return 0LL;
          }
          else {
            return v16;
          }
        }

        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          unint64_t v7 = (void *)v7[34];
          if (!v7) {
            goto LABEL_16;
          }
        }
      }

      unint64_t v12 = (void *)*a3;
      if (*a3) {
        break;
      }
LABEL_13:
      BOOL v13 = (void *)a3[1];
      v7[36] = 0LL;
      v7[37] = v13;
      *BOOL v13 = v7;
      a3[1] = v7 + 36;
      uint64_t v8 = (uint64_t)(v7 + 15);
      int v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      uint64_t result = 0LL;
      if (!v14) {
        return result;
      }
    }

    while (v12 != v7)
    {
      unint64_t v12 = (void *)v12[36];
      if (!v12) {
        goto LABEL_13;
      }
    }

    return 524297LL;
  }

  return result;
}

uint64_t sub_1840605BC(uint64_t result, int a2)
{
  uint64_t v2 = &numAppleRoots;
  if (!a2) {
    uint64_t v2 = &numAppleProdRoots;
  }
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = result;
    for (uint64_t i = (uint64_t *)&AppleRoots; i < (uint64_t *)&UcrtRootPublicKey && i >= (uint64_t *)&AppleRoots; ++i)
    {
      uint64_t v7 = *i;
      uint64_t result = compare_octet_string(v4, *i + 184);
      if (!(_DWORD)result) {
        return v7;
      }
      if (!--v3) {
        return 0LL;
      }
    }

    __break(0x5519u);
  }

  else
  {
    return 0LL;
  }

  return result;
}

uint64_t sub_184060650(uint64_t result)
{
  uint64_t v1 = numBAARoots;
  if (numBAARoots)
  {
    uint64_t v2 = result;
    for (uint64_t i = (uint64_t *)&BAARoots; i < (uint64_t *)&SEKTestRootPublicKey && i >= (uint64_t *)&BAARoots; ++i)
    {
      uint64_t v5 = *i;
      uint64_t result = compare_octet_string(v2, *i + 184);
      if (!(_DWORD)result) {
        return v5;
      }
      if (!--v1) {
        return 0LL;
      }
    }

    __break(0x5519u);
  }

  else
  {
    return 0LL;
  }

  return result;
}

uint64_t X509ChainBuildPath(void *a1, uint64_t *a2, void *a3)
{
  return X509ChainBuildPathPartial(a1, a2, a3, 0);
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  BOOL v6 = a2;
  v35[4] = *MEMORY[0x1895F89C0];
  uint64_t v8 = *a2;
  if (a3)
  {
    uint64_t v9 = *(void *)(a3 + 48);
    if (v9)
    {
      if (*(void *)(v9 + 8))
      {
        uint64_t v8 = *v6;
      }
    }
  }

  if (v8)
  {
    uint64_t v31 = v6;
    unint64_t v32 = a4;
    unint64_t v11 = 0LL;
    int v12 = 0;
    char v33 = 0;
    uint64_t v13 = -1LL;
    while (1)
    {
      unint64_t v14 = *(void *)(v8 + 288);
      unint64_t v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        char v16 = 0;
        goto LABEL_11;
      }

      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        char v16 = 0;
        unint64_t v15 = v8 + 304;
        unint64_t v14 = v8;
        goto LABEL_11;
      }

      if (!a3) {
        return v12 | 0x9000Du;
      }
      if (*(_BYTE *)(a3 + 16))
      {
        uint64_t v20 = sub_1840605BC(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }

      else
      {
        if (!*(void *)(a3 + 24)) {
          goto LABEL_58;
        }
        uint64_t v20 = sub_184060650(v8 + 168);
      }

      unint64_t v14 = v20;
      v33 |= v20 != 0;
      unint64_t v15 = v20 + 304;
      if (v20) {
        goto LABEL_10;
      }
LABEL_58:
      if (!*(_BYTE *)(a3 + 19)) {
        return v12 | 0x9000Du;
      }
      unint64_t v14 = 0LL;
      char v16 = 1;
LABEL_11:
      if (v11 && *(void *)(v8 + 32) >= 2uLL)
      {
        if (!*(_BYTE *)(v8 + 265))
        {
          int v30 = 589825;
          return v12 | v30;
        }

        if ((*(_BYTE *)(v8 + 264) & 4) == 0)
        {
          int v30 = 589826;
          return v12 | v30;
        }
      }

      unint64_t v17 = *(void *)(v8 + 200);
      if (v17) {
        BOOL v18 = v17 >= v11;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18)
      {
        int v30 = 589827;
        return v12 | v30;
      }

      if (*(_BYTE *)(v8 + 266))
      {
        int v30 = 589831;
        return v12 | v30;
      }

      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        int v30 = 589828;
        return v12 | v30;
      }

      if ((v16 & 1) == 0 && *(void *)(v8 + 168) && *(void *)(v8 + 176))
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
      }

      if (a3 && v11 && (*(void *)(v8 + 240) & *(void *)(a3 + 8)) == 0LL) {
        X509PolicySetFlagsForCommonNames(v8);
      }
      if (v14 == v8 && !*(void *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(_BYTE *)(a3 + 18) && !X509CertificateIsValid(v8)) {
            return v12 | 0x90009u;
          }
          uint64_t v19 = *(void *)(a3 + 8);
          if (!v11 && (*(void *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            uint64_t v19 = *(void *)(a3 + 8);
          }

          v13 &= *(void *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            int v30 = 589829;
            return v12 | v30;
          }

          goto LABEL_49;
        }
      }

      else if (a3)
      {
        goto LABEL_34;
      }

      v13 &= *(void *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        uint64_t result = X509CertificateCheckSignature(a1, v14, v8 + 16, v8 + 40, (__int128 *)(v8 + 56));
        if ((_DWORD)result) {
          return result;
        }
      }

      unint64_t v21 = v11 + 1;
      if (v11 == -1LL) {
        goto LABEL_99;
      }
      uint64_t v8 = *(void *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        BOOL v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3) {
          goto LABEL_61;
        }
        goto LABEL_87;
      }
    }
  }

  unint64_t v21 = 0LL;
  uint64_t v13 = -1LL;
  if (!a3) {
    goto LABEL_87;
  }
LABEL_61:
  if (*(void *)a3)
  {
    unint64_t v22 = v21;
    if ((v8 & 1) != 0)
    {
      unint64_t v22 = v21 + 1;
      if (v21 == -1LL)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }

    if (*(void *)a3 != v22) {
      return ((_DWORD)v22 << 8) | 0x90006u;
    }
  }

  uint64_t v23 = *(void *)(a3 + 24);
  if (!v23 || !*(void *)(v23 + 8))
  {
    if (!*(_BYTE *)(a3 + 16)) {
      goto LABEL_87;
    }
    int v24 = (_DWORD)v21 << 8;
    uint64_t v25 = **(void **)(v6[1] + 8);
LABEL_75:
    uint64_t v27 = 184LL;
    if ((v8 & 1) != 0) {
      uint64_t v27 = 168LL;
    }
    uint64_t v28 = sub_1840605BC(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28) {
      return v24 | 0x9000Bu;
    }
    uint64_t v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, v25 + 16, v25 + 40, (__int128 *)(v25 + 56)))
    {
      goto LABEL_87;
    }

    int v26 = 589836;
    return v24 | v26;
  }

  int v24 = (_DWORD)v21 << 8;
  uint64_t v25 = **(void **)(v6[1] + 8);
  if (*(_BYTE *)(a3 + 16)) {
    goto LABEL_75;
  }
  memset(v35, 170, 32);
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    int v26 = 589832;
    return v24 | v26;
  }

  if (compare_octet_string((uint64_t)&v35[2], *(void *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(void *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey( *(uint64_t **)(a3 + 24),  *(void *)(a3 + 32),  *(__int128 **)(a3 + 40),  v25 + 16,  (__int128 *)(v25 + 40),  (__int128 *)(v25 + 56))) {
      goto LABEL_72;
    }
  }

  else if (!compare_octet_string(*(void *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(void *)(a3 + 40));
  }

LABEL_87:
  uint64_t result = 0LL;
  if (a4) {
    *a4 = v13;
  }
  return result;
}

uint64_t X509ChainCheckPath(char a1, uint64_t *a2, uint64_t a3)
{
  return X509ChainCheckPathWithOptions(a1, a2, a3, 0LL);
}

BOOL sub_184060BE8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)"fbe71da1-0834-4d49-9b41-d3fa7f9e4d4f", a4);
  if (!objc_msgSend_caseInsensitiveCompare_(a1, v6, v5, v7)) {
    return 1LL;
  }
  unint64_t v10 = 0LL;
  do
  {
    unint64_t v11 = v10;
    if (v10 == 14) {
      break;
    }
    uint64_t v12 = objc_msgSend_stringWithUTF8String_(NSString, v8, (uint64_t)off_189DAB470[v10 + 1], v9);
    uint64_t v15 = objc_msgSend_caseInsensitiveCompare_(a1, v13, v12, v14);
    unint64_t v10 = v11 + 1;
  }

  while (v15);
  return v11 < 0xE;
}

void sub_184061924( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_184061C00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_184061C90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_184061CA0(uint64_t a1)
{
}

void sub_184061CA8(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (void *)MEMORY[0x189607968];
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 0);
  uint64_t v7 = objc_msgSend_numberWithLongLong_(v3, v5, v4, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

uint64_t sub_184061CF8(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = *(id *)(a1 + 32);
  uint64_t v7 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6);
  return sqlite3_bind_text(a2, 1, v7, -1, 0LL);
}

uint64_t sub_184061D34(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = *(id *)(a1 + 32);
  uint64_t v8 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7);
  sqlite3_bind_text(a2, 1, v8, -1, 0LL);
  id v9 = *(id *)(a1 + 40);
  uint64_t v13 = (const char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
  return sqlite3_bind_text(a2, 2, v13, -1, 0LL);
}

uint64_t sub_184061D98(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = *(id *)(a1 + 32);
  uint64_t v7 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6);
  return sqlite3_bind_text(a2, 1, v7, -1, 0LL);
}

void sub_184061DD4(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (uint64_t)sqlite3_column_text(a2, 0);
  if (v3)
  {
    uint64_t v3 = objc_msgSend_stringWithUTF8String_(NSString, v4, v3, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

uint64_t sub_184061E24(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  return 1LL;
}

void *MISProfileGetValue(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (MISProfileValidateSignature_0(v3)
    || (objc_msgSend_payload(v3, v4, v5, v6), uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    uint64_t v7 = 0LL;
  }

  else
  {
    objc_msgSend_payload(v3, v9, v10, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v12, v13, a2, v14);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t MISProfileValidateSignature_0(void *a1)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  uint64_t v1 = a1;
  objc_msgSend_payload(v1, v2, v3, v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    uint64_t fixed = 3892346883LL;
    uint64_t v8 = (const __CFData *)v1[1];
    if (!v8)
    {
      uint64_t v6 = 3892346884LL;
      goto LABEL_40;
    }

    if (qword_18C671E28 != -1) {
      dispatch_once(&qword_18C671E28, &unk_189DAB748);
    }
    id v9 = (id)qword_18C671E20;
    CFDataRef v12 = sub_1840646E8(v8);
    if (!v12 || !v9)
    {
      sub_184068378();
      unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18404B000, v21, OS_LOG_TYPE_ERROR, "Failure creating profile cache key.", buf, 2u);
      }

      CFDataRef v19 = 0LL;
      uint64_t v6 = 3892346890LL;
      goto LABEL_39;
    }

    objc_msgSend_objectForKey_(v9, v10, (uint64_t)v12, v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v17 = v13;
    if (v13)
    {
      uint64_t OSXProvisioningProfileSigning = objc_msgSend_intValue(v13, v14, v15, v16);
      CFDataRef v19 = sub_184064E74(v8);
      uint64_t v20 = 0LL;
    }

    else
    {
      unint64_t v22 = (const void *)SecPolicyCreateiPhoneProvisioningProfileSigning();
      int v23 = sub_184064F48();
      CFRelease(v22);
      if (v23)
      {
        ApplePinned = (const void *)SecPolicyCreateApplePinned();
        int v25 = sub_184064F48();
        CFRelease(ApplePinned);
        if (v25)
        {
          uint64_t OSXProvisioningProfileSigning = SecPolicyCreateOSXProvisioningProfileSigning();
          uint64_t v6 = sub_184064F48();
          CFRelease((CFTypeRef)OSXProvisioningProfileSigning);
          if ((_DWORD)v6)
          {
            CFDataRef v19 = 0LL;
            goto LABEL_23;
          }

          uint64_t OSXProvisioningProfileSigning = 2LL;
        }

        else
        {
          uint64_t OSXProvisioningProfileSigning = 1LL;
        }
      }

      else
      {
        uint64_t OSXProvisioningProfileSigning = 0LL;
      }

      CFDataRef v19 = sub_184064E74(v8);
      objc_msgSend_numberWithInt_(MEMORY[0x189607968], v26, OSXProvisioningProfileSigning, v27);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v9, v28, (uint64_t)v20, (uint64_t)v12);
    }

    uint64_t v6 = 0LL;
LABEL_23:

    if ((_DWORD)v6)
    {
LABEL_39:

      goto LABEL_40;
    }

    objc_msgSend_setFlavor_(v1, v29, OSXProvisioningProfileSigning, v30);
    if (!v19)
    {
      uint64_t v6 = 3892346906LL;
      goto LABEL_40;
    }

    CFErrorRef error = 0LL;
    if (objc_msgSend_flavor(v1, v31, v32, v33)
      && objc_msgSend_flavor(v1, v34, v35, v36) != 2)
    {
      uint64_t v38 = CFPropertyListCreateWithDERData();
      if (!v38) {
        goto LABEL_38;
      }
      int v41 = (const void *)v38;
      objc_msgSend_dictionaryWithDictionary_(MEMORY[0x189603FC8], v39, v38, v40);
      unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v41);
    }

    else
    {
      unint64_t v37 = (void *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x189604DB0], v19, 2uLL, 0LL, &error);
    }

    if (error)
    {
      if (v37) {
        CFRelease(v37);
      }
      sub_184068378();
      __int128 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v53 = error;
        _os_log_error_impl(&dword_18404B000, v42, OS_LOG_TYPE_ERROR, "Error parsing profile payload: %@", buf, 0xCu);
      }

      CFErrorRef v43 = error;
    }

    else
    {
      if (!v37) {
        goto LABEL_38;
      }
      CFTypeID v45 = CFGetTypeID(v37);
      if (v45 == CFDictionaryGetTypeID())
      {
        objc_msgSend_setPayload_(v1, v46, (uint64_t)v37, v47);

        uint64_t fixed = objc_msgSend_fixUp(v1, v48, v49, v50);
        goto LABEL_38;
      }

      CFErrorRef v43 = (CFErrorRef)v37;
    }

    CFRelease(v43);
LABEL_38:
    uint64_t v6 = fixed;
    goto LABEL_39;
  }

  uint64_t v6 = 0LL;
LABEL_40:

  return v6;
}

MISProfile *MISProfileCreate()
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___MISProfile);
  if (v2)
  {
    objc_msgSend_dictionaryWithCapacity_(MEMORY[0x189603FC8], v0, 0, v1);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPayload_(v2, v4, (uint64_t)v3, v5);
  }

  return v2;
}

MISProfile *MISProfileCreateWithData(uint64_t a1, const void *a2)
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___MISProfile);
  if (v3)
  {
    uint64_t v4 = (NSData *)CFRetain(a2);
    signature = v3->signature;
    v3->signature = v4;

    MISProfileValidateSignature_0(v3);
  }

  return v3;
}

MISProfile *MISProfileCreateWithFile(uint64_t a1, const char *a2)
{
  uint64_t result = (MISProfile *)objc_claimAutoreleasedReturnValue();
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = MISProfileCreateWithData((uint64_t)result, result);
    CFRelease(v3);
    return v4;
  }

  return result;
}

MISProfile *MISProfileCreateMutableCopy(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (MISProfileValidateSignature_0(v2))
  {
    uint64_t v3 = 0LL;
  }

  else
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___MISProfile);
    if (v3)
    {
      objc_msgSend_payload(v2, v4, v5, v6);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        uint64_t v11 = (void *)MEMORY[0x189603FC8];
        objc_msgSend_payload(v2, v8, v9, v10);
        CFDataRef v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dictionaryWithDictionary_(v11, v13, (uint64_t)v12, v14);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPayload_(v3, v16, (uint64_t)v15, v17);
      }
    }
  }

  return v3;
}

BOOL MISProfileIsMutable(uint64_t a1)
{
  return *(void *)(a1 + 8) == 0LL;
}

uint64_t MISProfileSignWithKeyAndCertificates(void *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v1 = 3892346890LL;
  id v2 = a1;
  uint64_t v6 = v2;
  if (v2[1])
  {
    uint64_t v1 = 3892346883LL;
  }

  else
  {
    CFErrorRef error = 0LL;
    uint64_t v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    objc_msgSend_payload(v2, v3, v4, v5);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFDataRef v9 = CFPropertyListCreateData(v7, v8, kCFPropertyListXMLFormat_v1_0, 0LL, &error);

    if (error)
    {
      if (v9) {
        CFRelease(v9);
      }
      sub_184068378();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v15 = error;
        _os_log_error_impl( &dword_18404B000,  v10,  OS_LOG_TYPE_ERROR,  "Failure creating profile payload data: %@",  buf,  0xCu);
      }

      CFRelease(error);
    }

    else if (v9)
    {
      uint64_t v11 = (void *)v6[1];
      v6[1] = 0LL;

      CFRelease(v9);
      uint64_t v1 = 49197LL;
    }
  }

  return v1;
}

uint64_t MISProfileSignWithRSACallBack(void *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v1 = 3892346890LL;
  id v2 = a1;
  uint64_t v6 = v2;
  if (v2[1])
  {
    uint64_t v1 = 3892346883LL;
  }

  else
  {
    CFErrorRef error = 0LL;
    uint64_t v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    objc_msgSend_payload(v2, v3, v4, v5);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFDataRef v9 = CFPropertyListCreateData(v7, v8, kCFPropertyListXMLFormat_v1_0, 0LL, &error);

    if (error)
    {
      if (v9) {
        CFRelease(v9);
      }
      sub_184068378();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v15 = error;
        _os_log_error_impl( &dword_18404B000,  v10,  OS_LOG_TYPE_ERROR,  "Failure creating profile payload data: %@",  buf,  0xCu);
      }

      CFRelease(error);
    }

    else if (v9)
    {
      uint64_t v11 = (void *)v6[1];
      v6[1] = 0LL;

      CFRelease(v9);
      uint64_t v1 = 49197LL;
    }
  }

  return v1;
}

uint64_t MISProfileCopySignerSubjectSummary(uint64_t a1, CFStringRef *a2)
{
  if (!a2) {
    return 49174LL;
  }
  uint64_t v3 = 3892346883LL;
  SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
  int v5 = SecCMSVerify();
  if (v5 == -26275)
  {
LABEL_10:
    CFRelease(BasicX509);
    return v3;
  }

  if (!v5)
  {
    uint64_t v6 = SecTrustCopyCertificateChain(0LL);
    ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v6, 0LL);
    if (ValueAtIndex)
    {
      uint64_t v3 = 0LL;
      *a2 = SecCertificateCopySubjectSummary(ValueAtIndex);
    }

    else
    {
      uint64_t v3 = 3892346884LL;
    }

    CFRelease(v6);
    CFRelease(0LL);
    goto LABEL_10;
  }

  CFRelease(BasicX509);
  return 3892346906LL;
}

void *MISProfileCreateDataRepresentation(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  if (v1) {
    id v2 = v1;
  }
  return v1;
}

uint64_t MISProfileWriteToFile(uint64_t a1, const char *a2)
{
  id v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 3892346884LL;
  }
  objc_msgSend_writeToFile_atomically_(v2, a2, (uint64_t)a2, 0);
  return 0LL;
}

uint64_t MISProfileSetValue(void *a1, uint64_t a2, const void *a3)
{
  uint64_t v5 = 3892346882LL;
  uint64_t v6 = a1;
  uint64_t v10 = v6;
  if (!v6[1])
  {
    objc_msgSend_payload(v6, v7, v8, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      CFDataRef v12 = (void *)CFRetain(a3);
      objc_msgSend_payload(v10, v13, v14, v15);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v12, a2);

      uint64_t v5 = 0LL;
    }

    else
    {
      uint64_t v5 = 3892346883LL;
    }
  }

  return v5;
}

uint64_t MISProfileRemoveValue(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1[1]) {
    return 3892346882LL;
  }
  objc_msgSend_payload(a1, a2, a3, a4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v6, v7, (uint64_t)a2, v8);

  return 0LL;
}

uint64_t MISProfileSetPayload(void *a1, uint64_t a2)
{
  if (a1[1]) {
    return 3892346882LL;
  }
  uint64_t v4 = (void *)MEMORY[0x189603FC8];
  uint64_t v5 = a1;
  objc_msgSend_dictionaryWithDictionary_(v4, v6, a2, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPayload_(v5, v9, (uint64_t)v8, v10);

  return 0LL;
}

CFDictionaryRef MISProfileCopyPayload(void *a1)
{
  id v1 = a1;
  if (MISProfileValidateSignature_0(v1))
  {
    CFDictionaryRef Copy = 0LL;
  }

  else
  {
    uint64_t v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    objc_msgSend_payload(v1, v2, v3, v4);
    uint64_t v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef Copy = CFDictionaryCreateCopy(v6, v7);
  }

  return Copy;
}

uint64_t MISProfileGetTypeID()
{
  uint64_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_fault_impl( &dword_18404B000,  v0,  OS_LOG_TYPE_FAULT,  "MISProfileGetTypeID is not supported, the results this function returns is wrong and should not be relied on",  v2,  2u);
  }

  return 0LL;
}

uint64_t MISProfileValidateSignatureWithAnchors()
{
  uint64_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_fault_impl( &dword_18404B000,  v0,  OS_LOG_TYPE_FAULT,  "This function is not supported, and does not behave as you expect. Use MISProfileValidateSignature.",  v2,  2u);
  }

  return 3892346884LL;
}

uint64_t MISProfileValidateSignatureWithAnchorsAndPolicy()
{
  uint64_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_fault_impl( &dword_18404B000,  v0,  OS_LOG_TYPE_FAULT,  "This function is not supported, and does not behave as you expect. Use MISProfileValidateSignature.",  v2,  2u);
  }

  return 3892346884LL;
}

uint64_t MISProfileIsDEREncoded(void *a1)
{
  id v1 = a1;
  if (MISProfileValidateSignature_0(v1))
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v5 = objc_msgSend_payload(v1, v2, v3, v4);

    if (v5) {
      uint64_t v5 = objc_msgSend_flavor(v1, v6, v7, v8) == 1;
    }
  }

  return v5;
}

uint64_t sub_1840631BC(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = bswap64(*a2);
  unint64_t v4 = bswap64(*a3);
  if (v3 == v4)
  {
    unint64_t v3 = bswap64(a2[1]);
    unint64_t v4 = bswap64(a3[1]);
    if (v3 == v4)
    {
      unint64_t v3 = bswap64(a2[2]);
      unint64_t v4 = bswap64(a3[2]);
      if (v3 == v4)
      {
        unint64_t v3 = bswap64(a2[3]);
        unint64_t v4 = bswap64(a3[3]);
        if (v3 == v4) {
          return 0LL;
        }
      }
    }
  }

  if (v3 < v4) {
    return 0xFFFFFFFFLL;
  }
  return 1LL;
}

MISProfile *MISProfileCreateForProvisioning(const __CFAllocator *a1)
{
  id v2 = MISProfileCreate();
  if (v2) {
    sub_18406326C(a1, v2);
  }
  return v2;
}

void sub_18406326C(const __CFAllocator *a1, void *a2)
{
  unint64_t v4 = CFUUIDCreate(a1);
  CFStringRef v5 = CFUUIDCreateString(a1, v4);
  MISProfileSetValue(a2, (uint64_t)@"UUID", v5);
  CFRelease(v5);
  CFRelease(v4);
  int valuePtr = 1;
  CFNumberRef v6 = CFNumberCreate(a1, kCFNumberIntType, &valuePtr);
  MISProfileSetValue(a2, (uint64_t)@"Version", v6);
  CFRelease(v6);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v8 = CFDateCreate(a1, Current);
  MISProfileSetValue(a2, (uint64_t)@"CreationDate", v8);
  CFRelease(v8);
}

MISProfile *MISProvisioningProfileCreateMutableCopy(const __CFAllocator *a1, void *a2)
{
  MutableCFDictionaryRef Copy = MISProfileCreateMutableCopy((uint64_t)a1, a2);
  if (MutableCopy)
  {
    sub_18406326C(a1, MutableCopy);
    Value = (const __CFNumber *)MISProfileGetValue(MutableCopy, (uint64_t)@"TimeToLive");
    if (Value)
    {
      CFStringRef v5 = Value;
      CFTypeID v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
        if (sub_1840633DC(MutableCopy, valuePtr))
        {
          CFRelease(MutableCopy);
          return 0LL;
        }
      }
    }
  }

  return MutableCopy;
}

uint64_t sub_1840633DC(void *a1, uint64_t a2)
{
  uint64_t v4 = 3892346883LL;
  Value = MISProfileGetValue(a1, (uint64_t)@"CreationDate");
  if (Value)
  {
    CFTypeID v6 = Value;
    uint64_t v7 = CFCalendarCopyCurrent();
    CFAbsoluteTime at = MEMORY[0x186E2B514](v6);
    CFCalendarAddComponents(v7, &at, 0LL, "d", a2);
    CFRelease(v7);
    CFDateRef v8 = CFGetAllocator(a1);
    CFDateRef v9 = CFDateCreate(v8, at);
    if (v9)
    {
      CFDateRef v10 = v9;
      uint64_t v4 = MISProfileSetValue(a1, (uint64_t)@"ExpirationDate", v9);
      CFRelease(v10);
    }

    else
    {
      return 3892346890LL;
    }
  }

  return v4;
}

uint64_t MISProvisioningProfileAddProvisionedDevice(void *a1, const void *a2)
{
  uint64_t v2 = 3892346882LL;
  if (!a1[1])
  {
    Value = (__CFArray *)MISProfileGetValue(a1, (uint64_t)@"ProvisionedDevices");
    if (Value)
    {
      uint64_t v7 = Value;
      CFTypeID v8 = CFGetTypeID(Value);
      if (v8 == CFArrayGetTypeID())
      {
        CFArrayAppendValue(v7, a2);
        return 0LL;
      }

      else
      {
        return 3892346883LL;
      }
    }

    else
    {
      CFDateRef v9 = CFGetAllocator(a1);
      Mutable = CFArrayCreateMutable(v9, 0LL, MEMORY[0x189605228]);
      if (Mutable)
      {
        uint64_t v11 = Mutable;
        CFArrayAppendValue(Mutable, a2);
        uint64_t v2 = MISProfileSetValue(a1, (uint64_t)@"ProvisionedDevices", v11);
        CFRelease(v11);
      }

      else
      {
        return 3892346890LL;
      }
    }
  }

  return v2;
}

uint64_t MISProvisioningProfileAddEntitlement(void *a1, const void *a2, const void *a3)
{
  uint64_t v3 = 3892346882LL;
  if (!a1[1])
  {
    Value = (__CFDictionary *)MISProfileGetValue(a1, (uint64_t)@"Entitlements");
    if (Value)
    {
      CFDateRef v9 = Value;
      CFTypeID v10 = CFGetTypeID(Value);
      if (v10 == CFDictionaryGetTypeID())
      {
        CFDictionarySetValue(v9, a2, a3);
        return 0LL;
      }

      else
      {
        return 3892346883LL;
      }
    }

    else
    {
      uint64_t v11 = CFGetAllocator(a1);
      Mutable = CFDictionaryCreateMutable(v11, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      if (Mutable)
      {
        uint64_t v13 = Mutable;
        CFDictionarySetValue(Mutable, a2, a3);
        uint64_t v3 = MISProfileSetValue(a1, (uint64_t)@"Entitlements", v13);
        CFRelease(v13);
      }

      else
      {
        return 3892346890LL;
      }
    }
  }

  return v3;
}

uint64_t MISProvisioningProfileIsAppleInternalProfile(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

const void *MISProvisioningProfileGetTeamIdentifier(void *a1)
{
  Value = (const __CFArray *)MISProfileGetValue(a1, (uint64_t)@"TeamIdentifier");
  if (Value && (uint64_t v2 = Value, CFArrayGetCount(Value) == 1)) {
    return CFArrayGetValueAtIndex(v2, 0LL);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_18406371C(void *a1, uint64_t a2)
{
  Value = (const __CFBoolean *)MISProfileGetValue(a1, a2);
  if (Value && (v3 = Value, CFTypeID v4 = CFGetTypeID(Value), v4 == CFBooleanGetTypeID())) {
    return CFBooleanGetValue(v3);
  }
  else {
    return 0LL;
  }
}

uint64_t MISProvisioningProfileSetProvisionsAllDevices(void *a1)
{
  return MISProfileSetValue(a1, (uint64_t)@"ProvisionsAllDevices", (const void *)*MEMORY[0x189604DE8]);
}

uint64_t MISProvisioningProfileProvisionsAllDevices(void *a1)
{
  return sub_18406371C(a1, (uint64_t)@"ProvisionsAllDevices");
}

uint64_t MISProvisioningProfileIncludesDevice(void *a1, const __CFString *a2)
{
  Value = (const __CFArray *)MISProfileGetValue(a1, (uint64_t)@"ProvisionedDevices");
  if (!Value) {
    return 0LL;
  }
  CFTypeID v6 = Value;
  CFTypeID v7 = CFGetTypeID(Value);
  if (v7 != CFArrayGetTypeID()) {
    return 0LL;
  }
  CFIndex Count = CFArrayGetCount(v6);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v9 = Count;
  CFIndex v10 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, v10);
    uint64_t v4 = 1LL;
    if (CFStringCompare(ValueAtIndex, a2, 1uLL) == kCFCompareEqualTo) {
      break;
    }
    if (v9 == ++v10) {
      return 0LL;
    }
  }

  return v4;
}

BOOL MISProvisioningProfileIncludesPlatform(void *a1, const __CFString *a2, uint64_t a3)
{
  Value = (const __CFArray *)MISProfileGetValue(a1, (uint64_t)@"Platform");
  if (Value)
  {
    CFTypeID v6 = Value;
    CFTypeID v7 = CFGetTypeID(Value);
    if (v7 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount(v6);
      if (Count < 1)
      {
        return 0;
      }

      else
      {
        CFIndex v9 = Count;
        CFIndex v10 = 0LL;
        BOOL v11 = 1;
        do
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, v10);
          if (ValueAtIndex && (v13 = ValueAtIndex, CFTypeID v14 = CFGetTypeID(ValueAtIndex), v14 == CFStringGetTypeID()))
          {
            if (CFStringCompare(v13, a2, 1uLL) == kCFCompareEqualTo) {
              return v11;
            }
          }

          else
          {
            sub_184068378();
            uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)BOOL v18 = 0;
              _os_log_impl( &dword_18404B000,  v15,  OS_LOG_TYPE_DEFAULT,  "Encountered a null or non-string platform identifier.",  v18,  2u);
            }
          }

          BOOL v11 = ++v10 < v9;
        }

        while (v9 != v10);
      }

      return v11;
    }

    else
    {
      sub_184068378();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_18404B000,  v16,  OS_LOG_TYPE_DEFAULT,  "Encountered a non-array value for 'Platforms'.",  buf,  2u);
      }

      return 0LL;
    }
  }

  return a3;
}

uint64_t MISProvisioningProfileGrantsEntitlement(void *a1, void *a2, void *a3)
{
  v26[1] = *MEMORY[0x1895F89C0];
  Value = MISProfileGetValue(a1, (uint64_t)@"Entitlements");
  if (!Value) {
    return MISProvisioningProfileIsAppleInternalProfile(a1);
  }
  CFTypeID v7 = CFGetTypeID(Value);
  if (v7 != CFDictionaryGetTypeID()) {
    return MISProvisioningProfileIsAppleInternalProfile(a1);
  }
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  id v25 = v9;
  v26[0] = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v11, (uint64_t)v26, (uint64_t)&v25, 1);
  CFDataRef v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v24 = 0LL;
  uint64_t v13 = CESerializeCFDictionary();
  CFTypeID v14 = (void *)MEMORY[0x1896135D8];
  if (v13 != *MEMORY[0x1896135D8])
  {
    sub_184068378();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18404B000,  v15,  OS_LOG_TYPE_ERROR,  "Invalid entitlements in a provisioning profile",  buf,  2u);
    }

LABEL_10:
    BOOL v20 = 0;
    goto LABEL_11;
  }

  uint64_t v15 = v24;
  *(void *)buf = 0LL;
  if (CEManagedContextFromCFData() != *v14)
  {
    sub_184068378();
    CFDataRef v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v22 = 0;
      _os_log_error_impl( &dword_18404B000,  v19,  OS_LOG_TYPE_ERROR,  "Invalid entitlements in a provisioning profile",  v22,  2u);
    }

    goto LABEL_10;
  }

  objc_msgSend_derEntitlements(v8, v16, v17, v18);
  BOOL v20 = CEContextIsSubset() == *v14;
  CEReleaseManagedContext();
LABEL_11:

  if (v20) {
    return 1LL;
  }
  return MISProvisioningProfileIsAppleInternalProfile(a1);
}

    xpc_dictionary_get_value(v10, "Payload");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      uint64_t v13 = 0LL;
      goto LABEL_17;
    }

    uint64_t v13 = v16;
    if (MEMORY[0x186E2C2DC]() == MEMORY[0x1895F9240]
      && (uint64_t v18 = (const __CFAllocator *)*MEMORY[0x189604DB0],
          bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(v13),
          length = xpc_data_get_length(v13),
          (unint64_t v21 = CFDataCreate(v18, bytes_ptr, length)) != 0LL))
    {
      unint64_t v22 = v21;
      uint64_t v15 = MISProfileCreateWithData((uint64_t)v21, v21);
      CFRelease(v22);

      if (v15) {
        goto LABEL_19;
      }
    }

    else
    {
    }

    sub_184068378();
    CFDataRef v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315138;
      int v24 = buffer;
      _os_log_error_impl( &dword_18404B000,  v12,  OS_LOG_TYPE_ERROR,  "error getting profile '%s' from fd",  (uint8_t *)&v23,  0xCu);
    }

  return int64;
}

uint64_t MISProvisioningProfileSetApplicationIdentifierPrefixes(void *a1, const void *a2)
{
  return MISProfileSetValue(a1, (uint64_t)@"ApplicationIdentifierPrefix", a2);
}

CFArrayRef MISProvisioningProfileCopyApplicationIdentifierPrefixes(void *a1)
{
  uint64_t result = (const __CFArray *)MISProfileGetValue(a1, (uint64_t)@"ApplicationIdentifierPrefix");
  if (result) {
    return CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], result);
  }
  return result;
}

uint64_t MISProvisioningProfileSetTimeToLive(void *a1, unsigned int a2)
{
  unsigned int valuePtr = a2;
  uint64_t v3 = CFGetAllocator(a1);
  CFNumberRef v4 = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
  uint64_t v5 = MISProfileSetValue(a1, (uint64_t)@"TimeToLive", v4);
  CFRelease(v4);
  if (!(_DWORD)v5)
  {
    uint64_t v5 = sub_1840633DC(a1, valuePtr);
    if ((_DWORD)v5) {
      MISProfileRemoveValue(a1, @"TimeToLive", v6, v7);
    }
  }

  return v5;
}

BOOL MISProvisioningProfileHasPPQExemption(void *a1)
{
  if (sub_18406371C(a1, (uint64_t)@"ProvisionsAllDevices"))
  {
    MISProfileGetValue(a1, (uint64_t)@"AppAudience");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v3;
    BOOL v2 = v3
      && objc_msgSend_containsObject_(v3, v4, (uint64_t)@"InternalBuild", v5)
      && (uint64_t v7 = (const __CFBoolean *)sub_184063D84(a1)) != 0LL
      && CFBooleanGetValue(v7) == 0;
  }

  else
  {
    id v8 = (const __CFBoolean *)sub_184063D84(a1);
    return !v8 || CFBooleanGetValue(v8) == 0;
  }

  return v2;
}

void *sub_184063D84(void *a1)
{
  Value = MISProfileGetValue(a1, (uint64_t)@"PPQCheck");
  BOOL v2 = Value;
  if (Value)
  {
    CFTypeID v3 = CFGetTypeID(Value);
    if (v3 != CFBooleanGetTypeID())
    {
      sub_184068378();
      CFNumberRef v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 0;
        _os_log_impl( &dword_18404B000,  v4,  OS_LOG_TYPE_DEFAULT,  "Encountered a non-BOOLean value for 'PPQCheck'.",  (uint8_t *)v6,  2u);
      }

      return 0LL;
    }
  }

  return v2;
}

uint64_t MISProvisioningProfileIsForLocalProvisioning(void *a1)
{
  return sub_18406371C(a1, (uint64_t)@"LocalProvision");
}

void *MISProvisioningProfileGetAppAudience(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)@"AppAudience");
}

void *MISProvisioningProfileGetExpirationDate(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)@"ExpirationDate");
}

uint64_t MISProvisioningProfileSetName(void *a1, const void *a2)
{
  return MISProfileSetValue(a1, (uint64_t)@"Name", a2);
}

void *MISProvisioningProfileGetName(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)@"Name");
}

uint64_t MISProvisioningProfileAddDeveloperCertificate(void *a1, const void *a2)
{
  Value = (__CFArray *)MISProfileGetValue(a1, (uint64_t)@"DeveloperCertificates");
  if (Value)
  {
    uint64_t v5 = Value;
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 == CFArrayGetTypeID())
    {
      CFArrayAppendValue(v5, a2);
      return 0LL;
    }

    else
    {
      return 3892346883LL;
    }
  }

  else
  {
    id v8 = CFGetAllocator(a1);
    Mutable = CFArrayCreateMutable(v8, 0LL, MEMORY[0x189605228]);
    if (Mutable)
    {
      id v10 = Mutable;
      CFArrayAppendValue(Mutable, a2);
      uint64_t v11 = MISProfileSetValue(a1, (uint64_t)@"DeveloperCertificates", v10);
      CFRelease(v10);
      return v11;
    }

    else
    {
      return 3892346890LL;
    }
  }

uint64_t MISProvisioningProfileSetDeveloperCertificates(void *a1, const __CFArray *a2)
{
  CFNumberRef v4 = CFGetAllocator(a1);
  MutableCFDictionaryRef Copy = CFArrayCreateMutableCopy(v4, 0LL, a2);
  if (!MutableCopy) {
    return 3892346890LL;
  }
  CFMutableArrayRef v6 = MutableCopy;
  uint64_t v7 = MISProfileSetValue(a1, (uint64_t)@"DeveloperCertificates", MutableCopy);
  CFRelease(v6);
  return v7;
}

void *MISProvisioningProfileGetDeveloperCertificatesHashes(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  CFNumberRef v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void *MISProvisioningProfileGetDeveloperCertificates(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)@"DeveloperCertificates");
}

void *MISXMLProvisioningProfileGetDeveloperCertificates(void *a1)
{
  else {
    return MISProfileGetValue(a1, (uint64_t)@"DeveloperCertificates");
  }
}

void *MISProvisioningProfileGetProvisionedDevices(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)@"ProvisionedDevices");
}

void *MISProvisioningProfileGetUUID(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)@"UUID");
}

uint64_t MISProvisioningProfileGetVersion(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v5 = objc_msgSend_intValue(v1, v2, v3, v4);
  }
  else {
    uint64_t v5 = 0xFFFFFFFFLL;
  }

  return v5;
}

void *MISProvisioningProfileGetCreationDate(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)@"CreationDate");
}

void *MISProvisioningProfileGetEntitlements(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void *MISProvisioningProfileGetRawEntitlements(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)@"Entitlements");
}

uint64_t MISProvisioningProfileCheckValidity(void *a1, const __CFString *a2, const __CFDate *a3)
{
  uint64_t v6 = MISProfileValidateSignature_0(a1);
  if (!(_DWORD)v6)
  {
    uint64_t v6 = 3892346898LL;
    if (MISProvisioningProfileGetVersion(a1) == 1)
    {
      if (!a2 || MISProvisioningProfileIncludesDevice(a1, a2))
      {
        sub_18406848C();
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (sub_1840683F8((uint64_t)v7, a1, @"OSX"))
        {
          sub_18406848C();
          id v8 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18406848C();
          id v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9) {
            id v10 = @"tvOS";
          }
          else {
            id v10 = 0LL;
          }
          uint64_t v11 = v10;
          BOOL v12 = sub_1840683F8((uint64_t)v8, a1, v11);

          if (!v12)
          {
            sub_184068378();
            uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl( &dword_18404B000,  v13,  OS_LOG_TYPE_ERROR,  "Encountered a provisioning profile that does not provision the current platform.",  buf,  2u);
            }

LABEL_24:
            return v6;
          }
        }

        else
        {
        }

        sub_18406848C();
        CFTypeID v14 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18406848C();
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15) {
          uint64_t v16 = @"tvOS";
        }
        else {
          uint64_t v16 = 0LL;
        }
        uint64_t v17 = v16;
        BOOL v18 = sub_1840683F8((uint64_t)v14, a1, v17);

        if (!v18)
        {
          sub_184068378();
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)unint64_t v21 = 0;
            _os_log_impl( &dword_18404B000,  v13,  OS_LOG_TYPE_INFO,  "Encountered a provisioning profile that does not provision the current platform.",  v21,  2u);
          }

          goto LABEL_24;
        }

        if (a3
          && (Value = (const __CFDate *)MISProfileGetValue(a1, (uint64_t)@"ExpirationDate")) != 0LL
          && CFDateCompare(a3, Value, 0LL) != kCFCompareLessThan)
        {
          return 3892346897LL;
        }

        else
        {
          return 0LL;
        }
      }
    }

    else
    {
      return 3892346896LL;
    }
  }

  return v6;
}

void *MISProvisioningProfileGetProvisioningCDHashes(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)@"ProvisioningCDHashes");
}

void *MISProvisioningProfileGetEmbeddedDER(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)@"DER-Encoded-Profile");
}

uint64_t MISProvisioningProfileIsForBetaDeployment(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (CFTypeID v5 = CFGetTypeID(v4), v5 == CFDictionaryGetTypeID())) {
    return MISEntitlementDictionaryAllowsEntitlementValue( (const __CFDictionary *)v4,  @"beta-reports-active",  (const __CFString *)*MEMORY[0x189604DE8]);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_184064364(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_184064370(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  uint64_t v11[2] = sub_184064410;
  v11[3] = &unk_189DAB6C0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v10 = v5;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(a1, v8, (uint64_t)v11, v9);
}

void sub_184064410(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v27 = a2;
  *a4 = 0;
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  objc_msgSend_appendString_(v7, v9, (uint64_t)v27, v10);
  objc_msgSend_appendString_(*(void **)(a1 + 32), v11, (uint64_t)@"\x1F", v12);
  sub_1840644C4(*(void **)(a1 + 32), v8, *(void **)(a1 + 40));

  id v13 = *(void **)(a1 + 32);
  uint64_t v17 = objc_msgSend_length(v13, v14, v15, v16);
  uint64_t v21 = v17 + ~objc_msgSend_length(v27, v18, v19, v20);
  uint64_t v25 = objc_msgSend_length(v27, v22, v23, v24);
  objc_msgSend_deleteCharactersInRange_(v13, v26, v21, v25 + 1);
}

void sub_1840644C4(void *a1, void *a2, void *a3)
{
  id v26 = a1;
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v7 = v26;
      id v8 = v6;
      v27[0] = MEMORY[0x1895F87A8];
      v27[1] = 3221225472LL;
      unint64_t v27[2] = sub_1840646CC;
      v27[3] = &unk_189DAB6E8;
      id v28 = v7;
      id v29 = v8;
      objc_msgSend_enumerateObjectsUsingBlock_(v5, v9, (uint64_t)v27, v10);

      goto LABEL_16;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v12 = (void *)NSString;
      uint64_t v24 = v5;
      id v13 = @"string";
    }

    else
    {
      CFTypeID v14 = CFGetTypeID(v5);
      if (v14 != CFBooleanGetTypeID())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          abort();
        }
        uint64_t v20 = (void *)NSString;
        uint64_t v25 = objc_msgSend_longLongValue(v5, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v20, v21, (uint64_t)@"%@%@%lld", v22, @"number", v26, v25);
        goto LABEL_15;
      }

      int v15 = CFEqual(v5, (CFTypeRef)*MEMORY[0x189604DE8]);
      uint64_t v12 = (void *)NSString;
      if (v15) {
        uint64_t v16 = @"true";
      }
      else {
        uint64_t v16 = @"false";
      }
      uint64_t v24 = v16;
      id v13 = @"BOOL";
    }

    objc_msgSend_stringWithFormat_(v12, (const char *)v26, (uint64_t)@"%@%@%@", v11, v13, v26, v24);
LABEL_15:
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v23);

    goto LABEL_16;
  }

  sub_184064370(v5, v26, v6);
LABEL_16:
}

uint64_t sub_1840646CC(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *a4 = 0;
  return sub_1840644C4(*(void *)(a1 + 32), a2, *(void *)(a1 + 40));
}

uint64_t sub_1840646DC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4);
}

CFDataRef sub_1840646E8(const __CFData *a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  CC_SHA256_Init(&v5);
  BytePtr = CFDataGetBytePtr(a1);
  CC_LONG Length = CFDataGetLength(a1);
  CC_SHA256_Update(&v5, BytePtr, Length);
  CC_SHA256_Final(md, &v5);
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], md, 32LL);
}

void *sub_184064788(int a1, size_t __size)
{
  return malloc(__size);
}

void sub_184064790(int a1, void *a2)
{
}

void sub_184064798()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  os_log_with_args();
}

void sub_1840647F4()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  os_log_with_args();

  abort();
}

__CFString *sub_184064840(const __CFData *a1)
{
  BOOL v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFIndex Length = CFDataGetLength(a1);
  Mutable = CFStringCreateMutable(v2, 2 * Length);
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex v6 = CFDataGetLength(a1);
  if (v6 >= 1)
  {
    CFIndex v7 = v6;
    do
    {
      unsigned int v8 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0LL, @"%02x", v8);
      --v7;
    }

    while (v7);
  }

  return Mutable;
}

uint64_t MISArrayAllowsEntitlementValue(const __CFArray *a1, const __CFString *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    CFIndex v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v7 = 1LL;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v7 - 1);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 != CFStringGetTypeID()) {
        break;
      }
      CFIndex Length = CFStringGetLength(ValueAtIndex);
      CFIndex v11 = Length - 1;
      if (Length < 1)
      {
        uint64_t HasPrefix = 0LL;
      }

      else if (CFStringGetCharacterAtIndex(ValueAtIndex, v11) == 42)
      {
        v15.location = 0LL;
        v15.length = v11;
        uint64_t v12 = CFStringCreateWithSubstring(v6, ValueAtIndex, v15);
        uint64_t HasPrefix = CFStringHasPrefix(a2, v12);
        CFRelease(v12);
      }

      else
      {
        uint64_t HasPrefix = CFStringCompare(ValueAtIndex, a2, 0LL) == kCFCompareEqualTo;
      }

      if (v7 < v5)
      {
        ++v7;
        if (!(_DWORD)HasPrefix) {
          continue;
        }
      }

      return HasPrefix;
    }
  }

  return 0LL;
}

uint64_t MISEntitlementDictionaryAllowsEntitlementValue( const __CFDictionary *a1, const void *a2, const __CFString *a3)
{
  if (!a3) {
    return 0LL;
  }
  Value = (void *)CFDictionaryGetValue(a1, a2);
  values = Value;
  if (!Value) {
    return 0LL;
  }
  CFIndex v5 = Value;
  if (CFEqual(Value, @"*") != 1)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFBooleanGetTypeID()) {
      return CFEqual(v5, a3);
    }
    CFTypeID v9 = CFGetTypeID(v5);
    if (v9 == CFStringGetTypeID())
    {
      CFTypeID v10 = CFGetTypeID(a3);
      if (v10 == CFStringGetTypeID())
      {
        CFIndex v11 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const void **)&values, 1LL, MEMORY[0x189605228]);
        uint64_t v6 = MISArrayAllowsEntitlementValue(v11, a3);
        CFRelease(v11);
        return v6;
      }
    }

    else
    {
      CFTypeID v12 = CFGetTypeID(v5);
      if (v12 == CFArrayGetTypeID())
      {
        CFTypeID v13 = CFGetTypeID(a3);
        if (v13 == CFStringGetTypeID()) {
          return MISArrayAllowsEntitlementValue((const __CFArray *)v5, a3);
        }
        CFTypeID v14 = CFGetTypeID(a3);
        if (v14 == CFArrayGetTypeID())
        {
          CFIndex Count = CFArrayGetCount((CFArrayRef)a3);
          if (Count < 1) {
            return 1LL;
          }
          CFIndex v16 = Count;
          uint64_t v17 = 1LL;
          while (1)
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)a3, v17 - 1);
            CFTypeID v19 = CFGetTypeID(ValueAtIndex);
            if (v19 != CFStringGetTypeID()) {
              break;
            }
            uint64_t v20 = MISArrayAllowsEntitlementValue((const __CFArray *)v5, ValueAtIndex);
            uint64_t v6 = v20;
            if (v17 < v16)
            {
              ++v17;
              if ((_DWORD)v20 == 1) {
                continue;
              }
            }

            return v6;
          }
        }
      }
    }

    return 0LL;
  }

  return 1LL;
}

CFDataRef sub_184064E74(const __CFData *a1)
{
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex v3 = CFDataGetLength(a1);
  if (!CTParseAmfiCMS((uint64_t)BytePtr, v3, 8, 0LL, 0LL, &v8, &length, 0LL, 0LL)) {
    return CFDataCreateWithBytesNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  v8,  length,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
  }
  sub_184068378();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18404B000, v4, OS_LOG_TYPE_ERROR, "Could not decode CMS message.", buf, 2u);
  }

  return 0LL;
}

uint64_t sub_184064F48()
{
  uint64_t v0 = 3892346883LL;
  int v1 = SecCMSVerify();
  if (v1 != -26275)
  {
    if (v1)
    {
      return 3892346889LL;
    }

    else
    {
      BOOL v2 = SecTrustEvaluateWithError(0LL, 0LL);
      CFRelease(0LL);
      if (v2) {
        return 0LL;
      }
      else {
        return 3892346899LL;
      }
    }
  }

  return v0;
}

uint64_t sub_184064FC8()
{
  id v0 = objc_alloc_init(MEMORY[0x189603F30]);
  int v1 = (void *)qword_18C671E20;
  qword_18C671E20 = (uint64_t)v0;

  return MEMORY[0x189616718](qword_18C671E20, sel_setCountLimit_, 100LL, v2);
}

uint64_t MISPing(char **a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  sub_184065194();
  uint64_t v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v3, "MessageType", "Ping");
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(v2, v3);
  if (MEMORY[0x186E2C2DC]() == MEMORY[0x1895F9250])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "Status");
    if (a1)
    {
      string = xpc_dictionary_get_string(v4, "Payload");
      *a1 = strdup(string);
    }
  }

  else
  {
    uint64_t uint64 = 3892346881LL;
    if (MEMORY[0x186E2C2DC](v4) == MEMORY[0x1895F9268])
    {
      uint64_t v6 = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1895F91B0]);
      sub_184068378();
      CFTypeID v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        CFIndex v11 = v6;
        _os_log_impl(&dword_18404B000, v7, OS_LOG_TYPE_DEFAULT, "error sending ping: %s\n", (uint8_t *)&v10, 0xCu);
      }

      uint64_t uint64 = 3892346893LL;
    }
  }

  xpc_connection_cancel(v2);

  return uint64;
}

_xpc_connection_s *sub_184065194()
{
  mach_service = xpc_connection_create_mach_service("com.apple.misagent", 0LL, 0LL);
  xpc_connection_set_event_handler(mach_service, &unk_189DAB800);
  xpc_connection_resume(mach_service);
  return mach_service;
}

void sub_1840651DC(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  xpc_object_t v3 = v2;
  if (v2 != (id)MEMORY[0x1895F91A0])
  {
    if (MEMORY[0x186E2C2DC](v2) == MEMORY[0x1895F9268])
    {
      string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1895F91B0]);
      sub_184068378();
      CFTypeID v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        CFTypeID v9 = string;
        _os_log_impl(&dword_18404B000, v7, OS_LOG_TYPE_DEFAULT, "misagent connection error: %s\n", (uint8_t *)&v8, 0xCu);
      }
    }

    else
    {
      xpc_object_t v4 = (char *)MEMORY[0x186E2C228](v3);
      sub_184068378();
      CFIndex v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        CFTypeID v9 = v4;
        _os_log_impl( &dword_18404B000,  v5,  OS_LOG_TYPE_DEFAULT,  "received unhandled event from misagent: %s\n",  (uint8_t *)&v8,  0xCu);
      }

      free(v4);
    }
  }
}

uint64_t MISInstallProvisioningProfile(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t uint64 = 3892346881LL;
  id v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 3892346884LL;
  }
  xpc_object_t v3 = v2;
  sub_184065194();
  xpc_object_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "MessageType", "Install");
  BytePtr = CFDataGetBytePtr(v3);
  size_t Length = CFDataGetLength(v3);
  xpc_dictionary_set_data(v5, "Profile", BytePtr, Length);
  xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v4, v5);
  if (MEMORY[0x186E2C2DC]() == MEMORY[0x1895F9250])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v8, "Status");
  }

  else if (MEMORY[0x186E2C2DC](v8) == MEMORY[0x1895F9268])
  {
    string = xpc_dictionary_get_string(v8, (const char *)*MEMORY[0x1895F91B0]);
    sub_184068378();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      CFTypeID v13 = string;
      _os_log_impl(&dword_18404B000, v10, OS_LOG_TYPE_DEFAULT, "error installing profile: %s\n", (uint8_t *)&v12, 0xCu);
    }

    uint64_t uint64 = 3892346893LL;
  }

  xpc_connection_cancel(v4);
  CFRelease(v3);

  return uint64;
}

uint64_t MISRemoveProvisioningProfile(const __CFString *a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t uint64 = 3892346881LL;
  xpc_object_t v3 = (void *)MEMORY[0x186E2BC28]();
  if (CFStringGetCString(a1, buffer, 37LL, 0x600u))
  {
    sub_184065194();
    xpc_object_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v5, "MessageType", "Remove");
    xpc_dictionary_set_string(v5, "ProfileID", buffer);
    xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v4, v5);
    if (MEMORY[0x186E2C2DC]() == MEMORY[0x1895F9250])
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v6, "Status");
    }

    else if (MEMORY[0x186E2C2DC](v6) == MEMORY[0x1895F9268])
    {
      string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1895F91B0]);
      sub_184068378();
      xpc_object_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        CFIndex v11 = string;
        _os_log_impl(&dword_18404B000, v8, OS_LOG_TYPE_DEFAULT, "error removing profile: %s\n", (uint8_t *)&v10, 0xCu);
      }

      uint64_t uint64 = 3892346893LL;
    }

    xpc_connection_cancel(v4);
  }

  objc_autoreleasePoolPop(v3);
  return uint64;
}

uint64_t MISCopyInstalledProvisioningProfiles(CFMutableArrayRef *a1)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (Mutable)
  {
    CFMutableArrayRef v3 = Mutable;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    void v7[2] = sub_1840657B0;
    v7[3] = &unk_189DAB768;
    v7[4] = Mutable;
    uint64_t v4 = MISEnumerateInstalledProvisioningProfiles(MISProfileEnumerationFlagLegacy, v7);
    if ((_DWORD)v4) {
      CFRelease(v3);
    }
    else {
      *a1 = v3;
    }
  }

  else
  {
    sub_184068378();
    xpc_object_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18404B000, v5, OS_LOG_TYPE_ERROR, "unable to allocate profiles array", buf, 2u);
    }

    return 3892346890LL;
  }

  return v4;
}

uint64_t sub_1840657B0(uint64_t a1, const void *a2)
{
  return 1LL;
}

uint64_t MISEnumerateInstalledProvisioningProfiles(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = -402620415;
  sub_184065194();
  uint64_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "MessageType", "CopyAll");
  xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v4, v5);
  if (MEMORY[0x186E2C2DC]() == MEMORY[0x1895F9250])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "Status");
    *((_DWORD *)v20 + 6) = uint64;
  }

  else if (MEMORY[0x186E2C2DC](v6) == MEMORY[0x1895F9268])
  {
    string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1895F91B0]);
    sub_184068378();
    xpc_object_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v24 = string;
      _os_log_error_impl(&dword_18404B000, v8, OS_LOG_TYPE_ERROR, "error getting installed profiles: %s\n", buf, 0xCu);
    }

    CFTypeID v9 = v20;
    goto LABEL_9;
  }

  xpc_dictionary_get_value(v6, "Payload");
  CFIndex v11 = (void *)objc_claimAutoreleasedReturnValue();
  CFTypeID v9 = v20;
  if (!v11)
  {
LABEL_9:
    *((_DWORD *)v9 + 6) = -402620403;
    uint64_t uint64 = 3892346893LL;
    goto LABEL_10;
  }

  *((_DWORD *)v20 + 6) = 0;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  unint64_t v14[2] = sub_184065A54;
  void v14[3] = &unk_189DAB790;
  int v12 = v4;
  CFRange v15 = v12;
  uint64_t v17 = &v19;
  uint64_t v18 = a1;
  id v16 = v3;
  xpc_array_apply(v11, v14);
  xpc_connection_cancel(v12);
  uint64_t uint64 = *((unsigned int *)v20 + 6);

LABEL_10:
  _Block_object_dispose(&v19, 8);

  return uint64;
}

void sub_184065A30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_184065A54(uint64_t a1, int a2, xpc_object_t xstring)
{
  uint64_t v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  string_ptr = xpc_string_get_string_ptr(xstring);
  xpc_object_t v6 = CFStringCreateWithCString(v4, string_ptr, 0x600u);
  CFTypeID v7 = sub_184065B20( *(void **)(a1 + 32),  v6,  *(void *)(a1 + 56) == MISProfileEnumerationFlagLegacy,  (int *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
  if (!v7)
  {
    uint64_t v9 = 0LL;
    if (!v6) {
      return v9;
    }
    goto LABEL_8;
  }

  xpc_object_t v8 = v7;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  CFRelease(v8);
  if (v6) {
LABEL_8:
  }
    CFRelease(v6);
  return v9;
}

MISProfile *sub_184065B20(void *a1, const __CFString *a2, BOOL a3, int *a4)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  int v7 = -402620415;
  xpc_object_t v8 = a1;
  *a4 = -402620415;
  if (!CFStringGetCString(a2, buffer, 37LL, 0x600u))
  {
    id v13 = 0LL;
    xpc_object_t v10 = 0LL;
    xpc_object_t v9 = 0LL;
LABEL_18:
    CFRange v15 = 0LL;
    *a4 = v7;
    goto LABEL_19;
  }

  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v9, "MessageType", "CopySingle");
  xpc_dictionary_set_string(v9, "ProfileID", buffer);
  xpc_dictionary_set_BOOL(v9, "ForceXML", a3);
  xpc_object_t v10 = xpc_connection_send_message_with_reply_sync(v8, v9);
  if (MEMORY[0x186E2C2DC]() != MEMORY[0x1895F9250])
  {
    if (MEMORY[0x186E2C2DC](v10) == MEMORY[0x1895F9268])
    {
      string = xpc_dictionary_get_string(v10, (const char *)*MEMORY[0x1895F91B0]);
      sub_184068378();
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315394;
        uint64_t v24 = buffer;
        __int16 v25 = 2080;
        id v26 = string;
        _os_log_impl( &dword_18404B000,  v12,  OS_LOG_TYPE_DEFAULT,  "error getting profile '%s': %s",  (uint8_t *)&v23,  0x16u);
      }

      id v13 = 0LL;
      goto LABEL_15;
    }

uint64_t MISCopyProvisioningProfile(const __CFString *a1, MISProfile **a2)
{
  unsigned int v7 = -402620415;
  sub_184065194();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  *a2 = sub_184065B20(v4, a1, 0, (int *)&v7);
  xpc_connection_cancel((xpc_connection_t)v4);
  uint64_t v5 = v7;

  return v5;
}

uint64_t MISCopyProvisioningProfileWithConnection(const __CFString *a1, MISProfile **a2, void *a3)
{
  unsigned int v4 = -402620415;
  *a2 = sub_184065B20(a3, a1, 0, (int *)&v4);
  return v4;
}

uint64_t MISEnumerateMatchingProfiles(const __CFData *a1, const __CFArray *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v5 = 3892346893LL;
  id v6 = a3;
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  int v37 = -402620415;
  sub_184065194();
  unsigned int v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t empty = xpc_array_create_empty();
  xpc_dictionary_set_string(v8, "MessageType", "CopyMatching");
  if (a1)
  {
    BytePtr = CFDataGetBytePtr(a1);
    size_t Length = CFDataGetLength(a1);
    xpc_dictionary_set_data(v9, "Cert", BytePtr, Length);
  }

  if (a2)
  {
    for (CFIndex i = 0LL; i < CFArrayGetCount(a2); ++i)
    {
      id v14 = CFArrayGetValueAtIndex(a2, i);
      uint64_t v18 = (const char *)objc_msgSend_UTF8String(v14, v15, v16, v17);
      if (!v18)
      {
        sub_184068378();
        CFDataRef v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18404B000, v22, OS_LOG_TYPE_ERROR, "Invalid UTF8 string in predicate", buf, 2u);
        }

        *((_DWORD *)v35 + 6) = -402620415;
        xpc_object_t v19 = 0LL;
        uint64_t v5 = 3892346881LL;
        goto LABEL_26;
      }

      xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, v18);
    }
  }

  xpc_dictionary_set_value(v9, "Predicates", empty);
  xpc_dictionary_set_value(v8, "Payload", v9);
  xpc_object_t v19 = xpc_connection_send_message_with_reply_sync(v7, v8);
  if (MEMORY[0x186E2C2DC]() == MEMORY[0x1895F9250])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v19, "Status");
    *((_DWORD *)v35 + 6) = uint64;
    if ((_DWORD)uint64)
    {
      uint64_t v5 = uint64;
      goto LABEL_26;
    }
  }

  else if (MEMORY[0x186E2C2DC](v19) == MEMORY[0x1895F9268])
  {
    string = xpc_dictionary_get_string(v19, (const char *)*MEMORY[0x1895F91B0]);
    sub_184068378();
    CFDataRef v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v39 = string;
      _os_log_error_impl( &dword_18404B000,  v21,  OS_LOG_TYPE_ERROR,  "error getting unauthoritative profile list: %s\n",  buf,  0xCu);
    }

    *((_DWORD *)v35 + 6) = -402620403;
    goto LABEL_26;
  }

  uint64_t v24 = xpc_dictionary_get_value(v19, "Payload");
  __int16 v25 = (void *)v24;
  if (v24)
  {
    if (MEMORY[0x186E2C2DC](v24) == MEMORY[0x1895F9220])
    {
      applier[0] = MEMORY[0x1895F87A8];
      applier[1] = 3221225472LL;
      applier[2] = sub_184066324;
      applier[3] = &unk_189DAB7B8;
      uint64_t v33 = &v34;
      uint64_t v28 = v7;
      uint64_t v31 = v28;
      id v32 = v6;
      xpc_array_apply(v25, applier);
      xpc_connection_cancel(v28);
      uint64_t v5 = *((unsigned int *)v35 + 6);

      goto LABEL_26;
    }

    id v26 = (char *)MEMORY[0x186E2C228](v25);
  }

  else
  {
    id v26 = 0LL;
  }

  sub_184068378();
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v39 = v26;
    _os_log_error_impl(&dword_18404B000, v27, OS_LOG_TYPE_ERROR, "Payload is not an array: %s", buf, 0xCu);
  }

  free(v26);
  *((_DWORD *)v35 + 6) = -402620403;

LABEL_26:
  _Block_object_dispose(&v34, 8);

  return v5;
}

void sub_1840662F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_184066324(void *a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = (void *)a1[4];
  id v6 = (void *)a1[5];
  id v7 = v4;
  id v8 = v5;
  xpc_object_t v9 = v6;
  CFTypeRef cf = 0LL;
  CFTypeRef v29 = 0LL;
  uint64_t v30 = 0LL;
  id v10 = v8;
  id v31 = v10;
  if (MEMORY[0x186E2C2DC](v7) != MEMORY[0x1895F9220])
  {
    CFIndex v11 = (void *)MEMORY[0x186E2C228](v7);
    sub_184068378();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      size_t count = (size_t)v11;
      _os_log_error_impl(&dword_18404B000, v12, OS_LOG_TYPE_ERROR, "Profile row is not an array: '%s'", buf, 0xCu);
    }

LABEL_4:
    free(v11);
LABEL_15:
    CFStringRef v18 = 0LL;
    xpc_object_t v19 = 0LL;
    CFDataRef v21 = 0LL;
    int v23 = -402620403;
    unsigned int v22 = 1;
    goto LABEL_16;
  }

  if (xpc_array_get_count(v7) != 8)
  {
    sub_184068378();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      size_t count = xpc_array_get_count(v7);
      __int16 v34 = 2048;
      uint64_t v35 = 4LL;
      _os_log_error_impl( &dword_18404B000,  v24,  OS_LOG_TYPE_ERROR,  "Wrong profile row count %ld != expected %ld",  buf,  0x16u);
    }

    goto LABEL_15;
  }

  string = xpc_array_get_string(v7, 0LL);
  id v14 = xpc_array_get_string(v7, 1uLL);
  CFRange v15 = xpc_array_get_string(v7, 2uLL);
  int64_t date = xpc_array_get_date(v7, 3uLL);
  BYTE1(v30) = xpc_array_get_BOOL(v7, 4uLL);
  BYTE3(v30) = xpc_array_get_BOOL(v7, 5uLL);
  BYTE2(v30) = xpc_array_get_BOOL(v7, 6uLL);
  BYTE4(v30) = xpc_array_get_BOOL(v7, 7uLL);
  if (!string)
  {
    xpc_array_get_value(v7, 0LL);
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    CFIndex v11 = (void *)MEMORY[0x186E2C228](v27);

    sub_184068378();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      size_t count = (size_t)v11;
      _os_log_error_impl( &dword_18404B000,  v12,  OS_LOG_TYPE_ERROR,  "Profile row has no (or malformed) UUID: '%s'",  buf,  0xCu);
    }

    goto LABEL_4;
  }

  uint64_t v17 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFTypeRef cf = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], string, 0x8000100u);
  if (v14) {
    CFTypeRef v29 = CFStringCreateWithCString(v17, v14, 0x8000100u);
  }
  CFStringRef v18 = CFStringCreateWithCString(v17, v15, 0x8000100u);
  xpc_object_t v19 = CFDateCreate(v17, (double)date);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDataRef v21 = CFDateCreate(v17, Current);
  LOBYTE(v30) = CFDateCompare(v19, v21, 0LL) == kCFCompareLessThan;
  unsigned int v22 = v9[2](v9, &cf);
  if (cf) {
    CFRelease(cf);
  }
  int v23 = 0;
LABEL_16:
  if (v29) {
    CFRelease(v29);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v21) {
    CFRelease(v21);
  }

  *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL) = v23;
  if (*(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL)) {
    uint64_t v25 = 0LL;
  }
  else {
    uint64_t v25 = v22;
  }

  return v25;
}

void sub_184066704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MISEnumerateMatchingProfilesUnauthoritative(const __CFData *a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  void v7[2] = sub_1840667B4;
  v7[3] = &unk_189DAB7E0;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = MISEnumerateMatchingProfiles(a1, 0LL, v7);

  return v5;
}

uint64_t sub_1840667B4(uint64_t a1, const __CFString **a2)
{
  CFTypeRef cf = 0LL;
  int v3 = MISCopyProvisioningProfile(*a2, (MISProfile **)&cf);
  CFTypeRef v7 = cf;
  if (cf) {
    BOOL v8 = v3 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    objc_msgSend_entitlements((void *)cf, v4, v5, v6);

    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v9 = 1LL;
    if (!cf) {
      return v9;
    }
  }

  CFRelease(v7);
  return v9;
}

uint64_t MISQueryBlacklistForCdHash(const __CFData *a1, int a2, int a3, _DWORD *a4)
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (qword_18C499048 != -1) {
    dispatch_once(&qword_18C499048, &unk_189DAB820);
  }
  BOOL v8 = (const __CFString *)qword_18C499050;
  if (!qword_18C499050)
  {
    sub_184068378();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18404B000,  v17,  OS_LOG_TYPE_ERROR,  "Could not get denylist path (this should not happen).",  buf,  2u);
    }

    return 0LL;
  }

  int v52 = a3;
  CFErrorRef v53 = a4;
  CFIndex Length = CFStringGetLength((CFStringRef)qword_18C499050);
  CFIndex v10 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  CFIndex v11 = (char *)MEMORY[0x186E2B3B8](0LL, v10, 0LL);
  if (!v11)
  {
    CFStringRef v18 = (os_log_s *)sub_184068378();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    xpc_object_t v19 = "Could not allocate buffer for denylist path (this should not happen.";
LABEL_19:
    uint64_t v20 = v18;
    uint32_t v21 = 2;
    goto LABEL_20;
  }

  if (!CFStringGetCString(v8, v11, v10, 0x8000100u))
  {
    CFStringRef v18 = (os_log_s *)sub_184068378();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    xpc_object_t v19 = "Denylist path conversion failed (this should not happen.)";
    goto LABEL_19;
  }

  int v12 = open(v11, 0);
  if (v12 < 0)
  {
    int v22 = *__error();
    int v23 = (os_log_s *)sub_184068378();
    uint64_t v24 = v23;
    if (v22 == 2)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18404B000, v24, OS_LOG_TYPE_DEBUG, "Denylist does not exist.", buf, 2u);
      }

LABEL_38:
      uint64_t v35 = (os_log_s *)sub_184068378();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18404B000, v35, OS_LOG_TYPE_DEBUG, "Using empty denylist.", buf, 2u);
      }

      uint64_t v36 = mmap(0LL, 0x18uLL, 3, 4098, -1, 0LL);
      if (v36 == (void *)-1LL)
      {
        unint64_t v51 = (os_log_s *)sub_184068378();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_18404B000,  v51,  OS_LOG_TYPE_ERROR,  "Failed to mmap fallback denylist header. Giving up.",  buf,  2u);
        }

        abort();
      }

      uint64_t v16 = (uint64_t)v36;
      v36[2] = 0LL;
      *(_OWORD *)uint64_t v36 = xmmword_184075340;
      int64_t v14 = 24LL;
      mprotect(v36, 0x18uLL, 1);
      int v37 = 0LL;
      uint64_t v38 = 0LL;
      BOOL v39 = 0LL;
      uint64_t v40 = 0LL;
      int v13 = -1;
      if (!v11) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }

    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    int v32 = *__error();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v32;
    xpc_object_t v19 = "Could not open denylist, error %{errno}d";
    uint64_t v20 = v24;
    uint32_t v21 = 8;
LABEL_20:
    _os_log_error_impl(&dword_18404B000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    goto LABEL_38;
  }

  int v13 = v12;
  int64_t v14 = lseek(v12, 0LL, 2);
  if (v14 <= 23)
  {
    CFRange v15 = (os_log_s *)sub_184068378();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 24LL;
      _os_log_error_impl( &dword_18404B000,  v15,  OS_LOG_TYPE_ERROR,  "Denylist is too short (%lld bytes) for header (%lu bytes)",  buf,  0x16u);
    }

    if (v14 < 1) {
      goto LABEL_37;
    }
    uint64_t v16 = 0LL;
LABEL_35:
LABEL_37:
    close(v13);
    goto LABEL_38;
  }

  uint64_t v25 = (char *)mmap(0LL, v14, 1, 2, v13, 0LL);
  if (v25 == (char *)-1LL)
  {
    uint64_t v33 = (os_log_s *)sub_184068378();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      int v49 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v49;
      _os_log_error_impl(&dword_18404B000, v33, OS_LOG_TYPE_ERROR, "Could not map denylist, error %{errno}d", buf, 8u);
    }

    uint64_t v16 = -1LL;
    goto LABEL_35;
  }

  uint64_t v16 = (uint64_t)v25;
  if (*(_DWORD *)v25 != 1134124660)
  {
    __int16 v34 = (os_log_s *)sub_184068378();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    int v50 = *(_DWORD *)v16;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v50;
    CFTypeRef v29 = "Wrong denylist magic (0x08%x)";
    uint64_t v30 = v34;
    uint32_t v31 = 8;
    goto LABEL_62;
  }

  unint64_t v26 = *((unsigned int *)v25 + 2);
  if (v14 < v26)
  {
    id v27 = (os_log_s *)sub_184068378();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    int v28 = *(_DWORD *)(v16 + 8);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v28;
    *(_WORD *)&buf[8] = 2048;
    *(void *)&buf[10] = v14;
    CFTypeRef v29 = "Denylist entries offset %u is past denylist size %lld";
    uint64_t v30 = v27;
    uint32_t v31 = 18;
LABEL_62:
    _os_log_error_impl(&dword_18404B000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_35;
  }

  uint64_t v38 = &v25[v26];
  uint64_t v45 = *((unsigned int *)v25 + 3);
  int v37 = &v38[32 * v45];
  __int128 v46 = &v37[4 * v45];
  uint64_t v47 = v46 - &v25[v14];
  if (v46 > &v25[v14])
  {
    unsigned int v48 = (os_log_s *)sub_184068378();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v47;
    CFTypeRef v29 = "Denylist is %td bytes short for entry count";
    uint64_t v30 = v48;
    uint32_t v31 = 12;
    goto LABEL_62;
  }

void MISBlacklistOverriddenByUser()
{
}

BOOL sub_184066EFC( const void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int16 a9, uint64_t a10, uint8_t a11, uint64_t a12, uint8_t buf, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  if (a1)
  {
    CFIndex Length = CFDataGetLength(v20);
    MutableCFDictionaryRef Copy = CFDataCreateMutableCopy(0LL, Length + 4, v20);
    if (MutableCopy)
    {
      uint64_t v25 = MutableCopy;
      CFDataAppendBytes(MutableCopy, (const UInt8 *)(v21 - 36), 4LL);
      unint64_t v26 = sub_184064840(v25);
      if (v26)
      {
        id v27 = v26;
        BOOL v28 = sub_18406FA9C((BOOL)a1, v26);
        CFRelease(v27);
      }

      else
      {
        sub_184068378();
        uint32_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          __int16 v33 = 0;
          _os_log_error_impl( &dword_18404B000,  v31,  OS_LOG_TYPE_ERROR,  "Could not create lookup key for denylist override check.",  (uint8_t *)&v33,  2u);
        }

        BOOL v28 = 0LL;
      }

      CFRelease(v25);
    }

    else
    {
      sub_184068378();
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        __int16 v34 = 0;
        _os_log_error_impl( &dword_18404B000,  v30,  OS_LOG_TYPE_ERROR,  "Could not create cdHash for denylist override check.",  (uint8_t *)&v34,  2u);
      }

      BOOL v28 = 0LL;
    }

    CFRelease(a1);
  }

  else
  {
    sub_184068378();
    CFTypeRef v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      __int16 v35 = 0;
      _os_log_error_impl( &dword_18404B000,  v29,  OS_LOG_TYPE_ERROR,  "Could not open denylist override list.",  (uint8_t *)&v35,  2u);
    }

    return 0LL;
  }

  return v28;
}

void sub_184067070()
{
}

uint64_t sub_184067084(uint64_t result)
{
  qword_18C499050 = result;
  return result;
}

uint64_t MISQueryBlacklistForBundle( const __CFString *a1, uint64_t a2, int a3, _DWORD *a4, CFDataRef *a5, _DWORD *a6)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  int v22 = 0;
  CFIndex v10 = (const __SecCode *)sub_184067428(a1, a2, 0LL, &v22);
  if (v10)
  {
    CFIndex v11 = v10;
    sub_184067B34(v10);
    int v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    int v13 = v12;
    if (v12)
    {
      int64_t v14 = (const __CFData *)sub_184067B8C(v12);
      if (v14)
      {
        CFRange v15 = v14;
      }

      else
      {
        int v22 = -402620415;
        sub_184068378();
        xpc_object_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18404B000, v19, OS_LOG_TYPE_DEFAULT, "Could not copy code directory hash.", buf, 2u);
        }

        CFRange v15 = 0LL;
      }
    }

    else
    {
      CFRange v15 = 0LL;
      int v22 = -402620407;
    }

    int v17 = v22;
    CFRelease(v11);

    BOOL v18 = v15 == 0LL;
    if (!v17 && v15)
    {
      if (a5) {
        *a5 = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v15);
      }
      if (a6) {
        *a6 = 26;
      }
      MISQueryBlacklistForCdHash(v15, 26, a3, a4);
LABEL_22:
      CFRelease(v15);
      return 0LL;
    }
  }

  else
  {
    sub_184068378();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v24 = v22;
      _os_log_impl(&dword_18404B000, v16, OS_LOG_TYPE_DEFAULT, "Could not copy signature, error 0x%x", buf, 8u);
    }

    int v17 = v22;
    CFRange v15 = 0LL;
    BOOL v18 = 1;
  }

  sub_184068378();
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v24 = v17;
    _os_log_impl( &dword_18404B000,  v20,  OS_LOG_TYPE_DEFAULT,  "Could not copy code directory hash (error: 0x%x).",  buf,  8u);
  }

  if (!v18) {
    goto LABEL_22;
  }
  return 0LL;
}

void MISBlacklistSetOverride(const __CFData *a1, unsigned int a2, BOOL a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  CFTypeRef v7 = v6;
  if (v6)
  {
    xpc_dictionary_set_string(v6, "type", "blov");
    BytePtr = CFDataGetBytePtr(a1);
    size_t Length = CFDataGetLength(a1);
    xpc_dictionary_set_data(v7, "cdha", BytePtr, Length);
    xpc_dictionary_set_uint64(v7, "haty", a2);
    xpc_dictionary_set_BOOL(v7, "ovrr", a3);
    uint64_t v10 = sub_18406EA98(v7);
    CFIndex v11 = (void *)v10;
    if (v10 && MEMORY[0x186E2C2DC](v10) != MEMORY[0x1895F9268]) {
      xpc_dictionary_get_int64(v11, "resu");
    }
  }

  else
  {
    sub_184068378();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v13 = 0;
      _os_log_error_impl( &dword_18404B000,  v12,  OS_LOG_TYPE_ERROR,  "Could not create XPC message for setBlacklistOverride",  v13,  2u);
    }

    CFIndex v11 = 0LL;
  }
}

CFTypeRef sub_184067428(CFStringRef filePath, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  values[1] = *(void **)MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  uint64_t valuePtr = a2;
  CFTypeRef v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  BOOL v8 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x189604DB0], filePath, kCFURLPOSIXPathStyle, 0);
  if (!v8)
  {
    LODWORD(v11) = -402620406;
    if (!a4) {
      return cf;
    }
    goto LABEL_20;
  }

  uint64_t v9 = v8;
  if (a2)
  {
    values[0] = CFNumberCreate(v7, kCFNumberLongLongType, &valuePtr);
    uint64_t v10 = CFDictionaryCreate( v7,  MEMORY[0x18960BB68],  (const void **)values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    CFRelease(values[0]);
    uint64_t v11 = SecStaticCodeCreateWithPathAndAttributes(v9, 0, v10, (SecStaticCodeRef *)&cf);
    if (v10) {
      CFRelease(v10);
    }
    if (!(_DWORD)v11)
    {
LABEL_6:
      if (!a3) {
        goto LABEL_19;
      }
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v11 = SecStaticCodeCreateWithPathAndAttributes(v8, 0, 0LL, (SecStaticCodeRef *)&cf);
    if (!(_DWORD)v11) {
      goto LABEL_6;
    }
  }

  sub_184068378();
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(values[0]) = 67109120;
    HIDWORD(values[0]) = v11;
    _os_log_impl(&dword_18404B000, v12, OS_LOG_TYPE_DEFAULT, "Failure creating static code: %d", (uint8_t *)values, 8u);
  }

  LODWORD(v11) = sub_18406765C(v11);
  if (a3)
  {
LABEL_14:
    uint64_t v13 = SecCodeSetDetachedSignature();
    if ((_DWORD)v13)
    {
      int v14 = v13;
      LODWORD(v11) = sub_18406765C(v13);
      if (cf)
      {
        sub_184068378();
        CFRange v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(values[0]) = 67109120;
          HIDWORD(values[0]) = v14;
          _os_log_impl( &dword_18404B000,  v15,  OS_LOG_TYPE_DEFAULT,  "Failure setting detached signature: %d",  (uint8_t *)values,  8u);
        }

        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }
    }
  }

uint64_t sub_18406765C(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if ((int)a1 > -67055)
  {
    switch((_DWORD)a1)
    {
      case 0xFFFEFA12:
        int v2 = 22;
        break;
      case 0xFFFEFA4C:
        int v2 = 18;
        break;
      case 0:
        return v1;
      default:
        goto LABEL_13;
    }

    return v2 | 0xE8008001;
  }

  if ((_DWORD)a1 == -67062) {
    return 3892346908LL;
  }
  if ((_DWORD)a1 == -67061) {
    return 3892346905LL;
  }
LABEL_13:
  sub_184068378();
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5[0] = 67109120;
    v5[1] = v1;
    _os_log_error_impl( &dword_18404B000,  v3,  OS_LOG_TYPE_ERROR,  "unrecognized status %d from codesigning library",  (uint8_t *)v5,  8u);
  }

  uint64_t v1 = 3892346881LL;

  return v1;
}

uint64_t sub_1840677C4(const __SecCode *a1, int a2, int a3, int a4, int a5, void *a6)
{
  id v11 = a6;
  if (a3 == 1) {
    int v12 = 7;
  }
  else {
    int v12 = 8193;
  }
  if (a4) {
    int v13 = 0x20000000;
  }
  else {
    int v13 = 0x10000;
  }
  int v14 = v13 | v12;
  if (a5 == 1) {
    SecCSFlags v15 = v14 | 0x400;
  }
  else {
    SecCSFlags v15 = v14;
  }
  CFErrorRef errors = 0LL;
  uint64_t v16 = (void *)MEMORY[0x186E2BC28]();
  uint64_t v17 = SecStaticCodeCheckValidityWithErrors(a1, v15, 0LL, &errors);
  objc_autoreleasePoolPop(v16);
  if (errors)
  {
    if (a2 == 1)
    {
      BOOL v18 = CFErrorCopyUserInfo(errors);
      if (v18)
      {
        xpc_object_t v19 = v18;
        sub_1840678FC(v18, (const void *)*MEMORY[0x18960BAF0], (uint64_t)"resource added");
        sub_1840678FC(v19, (const void *)*MEMORY[0x18960BB00], (uint64_t)"resource deleted");
        sub_1840678FC(v19, (const void *)*MEMORY[0x18960BAF8], (uint64_t)"resource modified");
        CFRelease(v19);
      }
    }

    CFRelease(errors);
  }

  uint64_t v20 = sub_18406765C(v17);

  return v20;
}

void sub_1840678FC(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  Value = (const __CFURL *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    uint64_t v5 = Value;
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 == CFURLGetTypeID())
    {
      CFURLGetFileSystemRepresentation(v5, 1u, buffer, 1024LL);
      sub_184068378();
      CFTypeRef v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v15 = a3;
        __int16 v16 = 2080;
        uint64_t v17 = buffer;
        _os_log_impl(&dword_18404B000, v7, OS_LOG_TYPE_DEFAULT, "%s: %s", buf, 0x16u);
      }

CFDictionaryRef sub_184067B34(const __SecCode *a1)
{
  CFDictionaryRef information = 0LL;
  int v2 = (void *)MEMORY[0x186E2BC28]();
  LODWORD(a1) = SecCodeCopySigningInformation(a1, 0x23u, &information);
  objc_autoreleasePoolPop(v2);
  if ((_DWORD)a1) {
    return (CFDictionaryRef)0LL;
  }
  else {
    return information;
  }
}

const void *sub_184067B8C(const __CFDictionary *a1)
{
  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x18960BBD8]);
  int v2 = Value;
  if (Value) {
    CFRetain(Value);
  }
  return v2;
}

const void *sub_184067BC8(const __CFDictionary *a1)
{
  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x18960BBC0]);
  int v2 = Value;
  if (Value) {
    CFRetain(Value);
  }
  return v2;
}

uint64_t sub_184067C04(const __CFDictionary *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(v1, v2, *MEMORY[0x18960BBA0], v3);

  return v4;
}

CFArrayRef sub_184067C54(void *a1, int *a2)
{
  int v3 = -402620415;
  uint64_t v4 = a1;
  if (CFDictionaryContainsKey(v4, (const void *)*MEMORY[0x18960BBB8]) != 1)
  {
    CFDictionaryRef Copy = 0LL;
    int v3 = -402620388;
    if (!a2) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  Value = (const __CFArray *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x18960BB80]);
  CFDictionaryRef Copy = Value;
  if (!Value)
  {
    int v3 = -402620396;
    if (!a2) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  CFTypeID v7 = CFGetTypeID(Value);
  if (v7 == CFArrayGetTypeID() && CFArrayGetCount(Copy) >= 1)
  {
    CFDictionaryRef Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], Copy);
    int v3 = 0;
    if (!a2) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  CFDictionaryRef Copy = 0LL;
  if (a2) {
LABEL_10:
  }
    *a2 = v3;
LABEL_11:

  return Copy;
}

const void *sub_184067D40(const __CFDictionary *a1, int *a2)
{
  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x18960BBB8]);
  uint64_t v4 = Value;
  if (!Value)
  {
    int v5 = -402620388;
    if (!a2) {
      return v4;
    }
    goto LABEL_3;
  }

  CFRetain(Value);
  int v5 = 0;
  if (a2) {
LABEL_3:
  }
    *a2 = v5;
  return v4;
}

const void *sub_184067D9C(void *a1, int *a2)
{
  int v3 = a1;
  if (CFDictionaryContainsKey(v3, (const void *)*MEMORY[0x18960BBB8]) != 1)
  {
    int v5 = 0LL;
    int v6 = -402620388;
    if (!a2) {
      goto LABEL_8;
    }
LABEL_7:
    *a2 = v6;
    goto LABEL_8;
  }

  Value = CFDictionaryGetValue(v3, (const void *)*MEMORY[0x18960BBD0]);
  int v5 = Value;
  if (Value) {
    CFRetain(Value);
  }
  int v6 = 0;
  if (a2) {
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

uint64_t sub_184067E2C(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  Value = (void *)CFDictionaryGetValue(a1, (const void *)*MEMORY[0x18960BBA8]);
  if (!Value) {
    return 0LL;
  }
  int v6 = Value;
  uint64_t v7 = 3892346902LL;
  if (a2 && a3)
  {
    id v8 = Value;
    if ((unint64_t)objc_msgSend_length(v8, v9, v10, v11) > 7)
    {
      int v13 = (void *)MEMORY[0x189603F48];
      id v14 = v8;
      uint64_t v18 = objc_msgSend_bytes(v14, v15, v16, v17) + 8;
      uint64_t v22 = objc_msgSend_length(v14, v19, v20, v21);
      objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v13, v23, v18, v22 - 8, 0);
      int v24 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = CEManagedContextFromCFData();
      unint64_t v26 = (void *)MEMORY[0x1896135D8];
      if (v25 == *MEMORY[0x1896135D8])
      {
        if (CEQueryContextToCFDictionary() == *v26) {
          uint64_t v7 = 0LL;
        }
        else {
          CEReleaseManagedContext();
        }
      }
    }

    else
    {
      sub_184068378();
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v2_Block_object_dispose(va, 8) = 0;
        _os_log_error_impl(&dword_18404B000, v12, OS_LOG_TYPE_ERROR, "Blob data too small", (uint8_t *)&v28, 2u);
      }
    }
  }

  else
  {
    sub_184068378();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = 3892346881LL;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      int v28 = 138412802;
      CFTypeRef v29 = v6;
      __int16 v30 = 2048;
      uint64_t v31 = a2;
      __int16 v32 = 2048;
      uint64_t v33 = a3;
      _os_log_error_impl( &dword_18404B000,  (os_log_t)v8,  OS_LOG_TYPE_ERROR,  "MISCreateEntitlementsFromBlobData called with invalid arguments: %@, %p, %p",  (uint8_t *)&v28,  0x20u);
    }
  }

  return v7;
}

const void *sub_18406802C(const __CFDictionary *a1, _DWORD *a2)
{
  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x18960BBC8]);
  uint64_t v4 = Value;
  if (Value)
  {
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 != CFStringGetTypeID())
    {
      uint64_t v4 = 0LL;
      if (!a2) {
        return v4;
      }
      goto LABEL_5;
    }

    CFRetain(v4);
  }

  if (a2) {
LABEL_5:
  }
    *a2 = 0;
  return v4;
}

BOOL sub_1840680A0()
{
  uint64_t IsPresent = SecCodeSpecialSlotIsPresent();
  uint64_t v1 = SecCodeSpecialSlotIsPresent();
  return IsPresent != *MEMORY[0x189604DE8] || v1 == *MEMORY[0x189604DE8];
}

CFURLRef sub_1840680EC()
{
  CFURLRef result = CFURLCreateWithFileSystemPath(0LL, @"/private/var/db/MobileIdentityData", kCFURLPOSIXPathStyle, 1u);
  qword_18C499058 = (uint64_t)result;
  return result;
}

void sub_18406811C()
{
  if (qword_18C499060 != -1) {
    dispatch_once(&qword_18C499060, &unk_189DAB840);
  }
  JUMPOUT(0x186E2B6F4LL);
}

void sub_184068178()
{
}

CFStringRef sub_18406818C( const __CFURL *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int16 a9, uint64_t a10, uint8_t buf, uint64_t a12, __int16 a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (!a1)
  {
    sub_184068378();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = 0;
      uint64_t v22 = "Could not create URL for MIS Data path creation (this should not happen).";
      int v23 = (uint8_t *)&v27;
      goto LABEL_12;
    }

LABEL_9:
    return 0LL;
  }

  xpc_object_t v19 = CFURLCopyAbsoluteURL(a1);
  CFRelease(a1);
  if (!v19)
  {
    sub_184068378();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = 0;
      uint64_t v22 = "Could not create absolute URL for MIS Data path creation (this should not happen).";
      int v23 = (uint8_t *)&v26;
      goto LABEL_12;
    }

    goto LABEL_9;
  }

  CFStringRef v20 = CFURLCopyPath(v19);
  CFRelease(v19);
  if (!v20)
  {
    sub_184068378();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = 0;
      uint64_t v22 = "Could not get path for MIS Data path creation (this should not happen).";
      int v23 = (uint8_t *)&v25;
LABEL_12:
      _os_log_error_impl(&dword_18404B000, v21, OS_LOG_TYPE_ERROR, v22, v23, 2u);
      goto LABEL_9;
    }

    goto LABEL_9;
  }

  return v20;
}

  int v23 = 0LL;
LABEL_24:
  Unique = 0LL;
  uint64_t v33 = 0LL;
  uint64_t v34 = 0LL;
  CFRange v42 = 1;
LABEL_29:
  uint64_t v40 = 1LL;
  if (v4) {
LABEL_30:
  }
    CFRelease(v4);
LABEL_31:
  if (v33) {
    CFRelease(v33);
  }
  if (v34) {
    CFRelease(v34);
  }
  if ((v42 & 1) == 0) {
    CFRelease(v23);
  }
  if (Unique) {
    CFRelease(Unique);
  }
  return v40;
}

void sub_184068288(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_1840682BC(const void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v6 = objc_msgSend_fileExistsAtPath_(v4, a2, (uint64_t)a1, a4);
  if (a1) {
    CFRelease(a1);
  }
  if (v6) {
    sub_184068178();
  }

  return 1LL;
}

id sub_184068378()
{
  if (qword_18C498EB8[0] != -1) {
    dispatch_once(qword_18C498EB8, &unk_189DAB860);
  }
  if (qword_18C498EB0) {
    return (id)qword_18C498EB0;
  }
  else {
    return MEMORY[0x1895F8DA0];
  }
}

void sub_1840683C8()
{
  os_log_t v0 = os_log_create("com.apple.mis", "mis");
  uint64_t v1 = (void *)qword_18C498EB0;
  qword_18C498EB0 = (uint64_t)v0;
}

BOOL sub_1840683F8(uint64_t a1, void *a2, void *a3)
{
  CFTypeID v5 = a3;
  id v8 = v5;
  if (!a1)
  {
    BOOL v11 = 0LL;
    goto LABEL_7;
  }

  int isEqualToString = objc_msgSend_isEqualToString_(v5, v6, (uint64_t)@"xrOS", v7);
  BOOL v10 = MISProvisioningProfileIncludesPlatform(a2, v8, 0LL);
  if (!isEqualToString) {
    goto LABEL_6;
  }
  if (!v10)
  {
    BOOL v10 = MISProvisioningProfileIncludesPlatform(a2, @"visionOS", 0LL);
LABEL_6:
    BOOL v11 = v10;
    goto LABEL_7;
  }

  BOOL v11 = 1LL;
LABEL_7:

  return v11;
}

id sub_18406848C()
{
  if (qword_18C671E30 != -1) {
    dispatch_once(&qword_18C671E30, &unk_189DAB880);
  }
  return (id)qword_18C671E38;
}

MobileIdentityService *sub_1840684CC()
{
  CFURLRef result = objc_alloc_init(&OBJC_CLASS___MobileIdentityService);
  qword_18C671E38 = (uint64_t)result;
  return result;
}

uint64_t MISValidateSignatureAndCopyInfoWithProgress( const __CFString *a1, const __CFDictionary *a2, void *a3, void *a4)
{
  uint64_t v169 = *MEMORY[0x1895F89C0];
  id v139 = a4;
  context = (void *)MEMORY[0x186E2BC28]();
  unsigned int v158 = 0;
  uint64_t v156 = 0LL;
  CFTypeRef v157 = 0LL;
  CFTypeRef cf = 0LL;
  v155 = 0LL;
  uint64_t v152 = 0LL;
  CFTypeRef v153 = 0LL;
  v140 = (const __SecCode *)sub_18406995C(a1, (uint64_t)a2, (int *)&v158);
  if (!v140) {
    goto LABEL_4;
  }
  v137 = a3;
  __int16 v151 = 0;
  __int16 v150 = 0;
  __int16 v149 = 0;
  Boolean v148 = 0;
  uint64_t valuePtr = 0LL;
  __int16 v146 = 0;
  __int16 v145 = 0;
  Boolean v144 = 0;
  unsigned int v7 = sub_184069BBC(a2, @"UnauthoritativeLaunch", (Boolean *)&v151);
  id v8 = 0LL;
  uint64_t v9 = 0LL;
  BOOL v10 = 0LL;
  BOOL v11 = 0LL;
  int v12 = 0LL;
  int v13 = 0LL;
  id v14 = 0LL;
  CFDataRef v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  unsigned int v158 = v7;
  if (v7) {
    goto LABEL_5;
  }
  unsigned int v158 = sub_184069BBC(a2, @"AuthoritativeLaunch", (Boolean *)&v151 + 1);
  if (v158) {
    goto LABEL_4;
  }
  int v22 = v151;
  if ((_BYTE)v151 && HIBYTE(v151))
  {
    sub_184068378();
    int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18404B000,  v23,  OS_LOG_TYPE_ERROR,  "Caller specified both unauthoritative and authoritative launch modes.",  buf,  2u);
    }

    id v8 = 0LL;
    uint64_t v9 = 0LL;
    BOOL v10 = 0LL;
    BOOL v11 = 0LL;
    int v12 = 0LL;
    int v13 = 0LL;
    id v14 = 0LL;
    CFDataRef v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    unsigned int v24 = -402620376;
    goto LABEL_76;
  }

  if (v151)
  {
    HIBYTE(v150) = 1;
    __int16 v149 = 0;
    Boolean v148 = 0;
    __int16 v146 = 257;
    HIBYTE(v145) = 0;
  }

  if (a2)
  {
    Value = (const UInt8 *)CFDictionaryGetValue(a2, @"ExpectedHash");
    BytePtr = Value;
    if (Value)
    {
      CFTypeID v27 = CFGetTypeID(Value);
      if (v27 != CFDataGetTypeID() || CFDataGetLength((CFDataRef)BytePtr) != 20)
      {
        id v8 = 0LL;
        uint64_t v9 = 0LL;
        BOOL v10 = 0LL;
        BOOL v11 = 0LL;
        int v12 = 0LL;
        int v13 = 0LL;
        id v14 = 0LL;
        CFDataRef v15 = 0LL;
        uint64_t v16 = 0LL;
        uint64_t v17 = 0LL;
        unsigned int v24 = 49174;
LABEL_76:
        unsigned int v158 = v24;
        goto LABEL_5;
      }

      BytePtr = CFDataGetBytePtr((CFDataRef)BytePtr);
    }
  }

  else
  {
    BytePtr = 0LL;
  }

  unsigned int v158 = 0;
  unsigned int v158 = sub_184069BBC(a2, @"LogResourceErrors", (Boolean *)&v150);
  if (v158) {
    goto LABEL_4;
  }
  unsigned int v158 = sub_184069BBC(a2, @"AllowAdHocSigning", (Boolean *)&v149 + 1);
  if (v158) {
    goto LABEL_4;
  }
  unsigned int v158 = sub_184069BBC(a2, @"ValidateSignatureOnly", (Boolean *)&v150 + 1);
  if (v158) {
    goto LABEL_4;
  }
  unsigned int v158 = sub_184069BBC(a2, @"UseSoftwareSigningCert", (Boolean *)&v149);
  if (v158) {
    goto LABEL_4;
  }
  unsigned int v158 = sub_184069BBC(a2, @"OnlineAuthorization", &v148);
  if (v158) {
    goto LABEL_4;
  }
  unsigned int v158 = sub_184069BBC(a2, @"SkipProfileIdentifierPolicy", (Boolean *)&v145);
  if (v158) {
    goto LABEL_4;
  }
  int v135 = v22;
  __s2 = BytePtr;
  unsigned int v158 = sub_184069BBC(a2, @"AllowLaunchWarnings", &v144);
  if (v158) {
    goto LABEL_4;
  }
  CFTypeID TypeID = CFStringGetTypeID();
  unsigned int v158 = sub_184069C28(a2, @"MainExecutablePath", TypeID, &v155);
  if (v158) {
    goto LABEL_4;
  }
  BOOL v32 = sub_184069C7C((uint64_t)a1, v29, v30, v31);
  BOOL v33 = v32;
  int v34 = !v32;
  if ((_BYTE)v145) {
    int v34 = 1;
  }
  int v133 = v34;
  LOBYTE(v145) = v34;
  *(void *)buf = 0LL;
  CFTypeID v35 = CFNumberGetTypeID();
  unsigned int v158 = sub_184069C28(a2, @"OnlineCheckType", v35, (const __CFDictionary **)buf);
  if (v158) {
    goto LABEL_4;
  }
  if (*(void *)buf && !CFNumberGetValue(*(CFNumberRef *)buf, kCFNumberCFIndexType, &valuePtr))
  {
    sub_184068378();
    __int128 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v159 = 0;
      _os_log_error_impl( &dword_18404B000,  v46,  OS_LOG_TYPE_ERROR,  "Failure to convert onlineCheckType. (This should not happen.)",  v159,  2u);
    }

    unsigned int v158 = -402620415;
    goto LABEL_4;
  }

  unsigned int v158 = sub_184069BBC(a2, @"RespectUppTrustAndAuthorization", (Boolean *)&v146 + 1);
  if (v158) {
    goto LABEL_4;
  }
  int v132 = HIBYTE(v146);
  if (HIBYTE(v146)) {
    LOBYTE(v146) = 1;
  }
  unsigned int v158 = sub_184069BBC(a2, @"HonorBlocklist", (Boolean *)&v146);
  if (v158 || (unsigned int v158 = sub_184069BBC(a2, @"TrustCacheOnly", (Boolean *)&v145 + 1)) != 0)
  {
LABEL_4:
    id v8 = 0LL;
    uint64_t v9 = 0LL;
    BOOL v10 = 0LL;
    BOOL v11 = 0LL;
    int v12 = 0LL;
    int v13 = 0LL;
    id v14 = 0LL;
    CFDataRef v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    goto LABEL_5;
  }

  if (v22) {
    BOOL v36 = HIBYTE(v150) == 0;
  }
  else {
    BOOL v36 = 1;
  }
  if (v36) {
    int v37 = 0;
  }
  else {
    int v37 = v133;
  }
  int v38 = v149;
  unsigned int v158 = sub_1840677C4(v140, v150, HIBYTE(v150), v37, v149, v139);
  if (!v33)
  {
    sub_184068378();
    BOOL v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_18404B000,  v39,  OS_LOG_TYPE_INFO,  "DER policy skipped as we're not validating a main executable",  buf,  2u);
    }

    goto LABEL_82;
  }

  if (sub_1840680A0()) {
    goto LABEL_83;
  }
  sub_18406F7D8();
  BOOL v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v40 = @"Internal";
  char isEqualToString = objc_msgSend_isEqualToString_(v39, v41, (uint64_t)@"Internal", v42);

  sub_184068378();
  int v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
  if ((isEqualToString & 1) == 0)
  {
    if (v45)
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18404B000,  v44,  OS_LOG_TYPE_ERROR,  "validation failed because of missing DER entitlements",  buf,  2u);
    }

    unsigned int v158 = -402620375;
    goto LABEL_4;
  }

  if (v45)
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( &dword_18404B000,  v44,  OS_LOG_TYPE_ERROR,  "validation would have failed due to missing DER entitlements",  buf,  2u);
  }

LABEL_82:
LABEL_83:
  if (v158 == -402620397)
  {
    uint64_t v127 = 0LL;
    int log = 1;
  }

  else
  {
    id v8 = 0LL;
    uint64_t v9 = 0LL;
    BOOL v10 = 0LL;
    BOOL v11 = 0LL;
    int v12 = 0LL;
    int v13 = 0LL;
    id v14 = 0LL;
    CFDataRef v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    if (v158) {
      goto LABEL_5;
    }
    int log = 0;
    uint64_t v47 = 4LL;
    if (!v38) {
      uint64_t v47 = 2LL;
    }
    uint64_t v127 = v47;
  }

  sub_184067B34(v140);
  v131 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v131)
  {
    id v8 = 0LL;
    uint64_t v9 = 0LL;
    BOOL v10 = 0LL;
    BOOL v11 = 0LL;
    int v12 = 0LL;
    int v13 = 0LL;
    id v14 = 0LL;
    CFDataRef v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    unsigned int v24 = -402620407;
    goto LABEL_76;
  }

  if (v144 && _os_feature_enabled_impl())
  {
    objc_msgSend_fileURLWithPath_(MEMORY[0x189604030], v48, (uint64_t)a1, v49);
    int v50 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v51 = (void *)objc_opt_new();
    id v143 = 0LL;
    objc_msgSend_checkForLaunchWarning_error_(v51, v52, (uint64_t)v50, (uint64_t)&v143);
    CFErrorRef v53 = (void *)objc_claimAutoreleasedReturnValue();
    id v57 = v143;
    if (v53)
    {
      if (objc_msgSend_length(v53, v54, v55, v56))
      {
        sub_184068378();
        unint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = a1;
          _os_log_impl( &dword_18404B000,  v58,  OS_LOG_TYPE_DEFAULT,  "New bundle has outstanding launch warning: %@",  buf,  0xCu);
        }

        id v130 = v53;
        goto LABEL_106;
      }
    }

    else
    {
      sub_184068378();
      unint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v57;
        _os_log_error_impl( &dword_18404B000,  v59,  OS_LOG_TYPE_ERROR,  "Error checking for launch warning: %@, %@",  buf,  0x16u);
      }
    }

    id v130 = 0LL;
LABEL_106:

    goto LABEL_107;
  }

  id v130 = 0LL;
LABEL_107:
  char v60 = v146;
  if (!(_BYTE)v146) {
    goto LABEL_123;
  }
  int v13 = (const __CFData *)sub_184067B8C(v131);
  if (_os_feature_enabled_impl())
  {
    unint64_t v63 = (void *)objc_opt_new();
    if (v155)
    {
      objc_msgSend_fileURLWithPath_(MEMORY[0x189604030], v61, (uint64_t)v155, v62);
      unint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v142 = 0LL;
      unint64_t v65 = (id *)&v142;
      uint64_t v67 = objc_msgSend_queryExecutableURL_error_(v63, v66, (uint64_t)v64, (uint64_t)&v142);
    }

    else
    {
      objc_msgSend_fileURLWithPath_(MEMORY[0x189604030], v61, (uint64_t)a1, v62);
      unint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v141 = 0LL;
      unint64_t v65 = (id *)&v141;
      uint64_t v67 = objc_msgSend_queryAppBundle_error_(v63, v68, (uint64_t)v64, (uint64_t)&v141);
    }

    uint64_t v69 = (void *)v67;
    id v70 = *v65;

    if (v69)
    {
      if (objc_msgSend_warningState(v69, v71, v72, v73) && (objc_msgSend_isUserOverridden(v69, v74, v75, v76) & 1) == 0)
      {
        sub_184068378();
        __int128 v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = a1;
          _os_log_impl( &dword_18404B000,  v77,  OS_LOG_TYPE_DEFAULT,  "Blocking bundle with outstanding launch warning: %@",  buf,  0xCu);
        }

        unsigned int v158 = -402620387;
        uint64_t v9 = 0LL;
        BOOL v10 = 0LL;
        BOOL v11 = 0LL;
        int v12 = 0LL;
        id v14 = 0LL;
        CFDataRef v15 = 0LL;
        uint64_t v16 = 0LL;
        goto LABEL_159;
      }
    }

    else
    {
      sub_184068378();
      __int128 v78 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v70;
        _os_log_error_impl( &dword_18404B000,  v78,  OS_LOG_TYPE_ERROR,  "Error checking for launch warning mark: %@, %@",  buf,  0x16u);
      }
    }
  }

  MISQueryBlacklistForCdHash(v13, 26, 1, 0LL);
  if (!v13) {
LABEL_123:
  }
    int v13 = (const __CFData *)sub_184067B8C(v131);
  __int128 v79 = sub_184067C54(v131, (int *)&v158);
  uint64_t v16 = v79;
  unsigned int v80 = v158;
  if (v158 == -402620396)
  {
    if (HIBYTE(v149))
    {
      CFDataRef v15 = 0LL;
      unsigned int v158 = 0;
      uint64_t v127 = 1LL;
      goto LABEL_148;
    }

    uint64_t v9 = 0LL;
    BOOL v10 = 0LL;
    BOOL v11 = 0LL;
    int v12 = 0LL;
    id v14 = 0LL;
    CFDataRef v15 = 0LL;
    goto LABEL_159;
  }

  if (v79)
  {
    if (CFArrayGetCount(v79))
    {
      ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v16, 0LL);
      if (ValueAtIndex)
      {
        __int128 v82 = ValueAtIndex;
        CFDataRef v15 = SecCertificateCopyData(ValueAtIndex);
        buf[0] = 0;
        if (!SecCertificateIsSelfSigned() && buf[0])
        {
          __int128 v83 = SecCertificateCopyKey(v82);
          unint64_t v84 = SecKeyCopyExternalRepresentation(v83, 0LL);
          v88 = (const __CFData *)sub_18406F540((uint64_t)v84, v85, v86, v87);
          v89 = v88;
          if (v88)
          {
            if (v84)
            {
              CFIndex Length = CFDataGetLength(v88);
              if (Length == CFDataGetLength(v84))
              {
                v91 = CFDataGetBytePtr(v89);
                v92 = CFDataGetBytePtr(v84);
                size_t v93 = CFDataGetLength(v89);
                if (!memcmp(v91, v92, v93))
                {
                  int log = 0;
                  unsigned int v158 = 0;
                  uint64_t v127 = 6LL;
                }
              }
            }
          }

          if (v83) {
            CFRelease(v83);
          }
          if (v84) {
            CFRelease(v84);
          }
          if (v89) {
            CFRelease(v89);
          }
        }

        unsigned int v80 = v158;
        goto LABEL_146;
      }

      sub_184068378();
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v94, OS_LOG_TYPE_ERROR))
      {
LABEL_157:

        uint64_t v9 = 0LL;
        BOOL v10 = 0LL;
        BOOL v11 = 0LL;
        int v12 = 0LL;
        id v14 = 0LL;
        CFDataRef v15 = 0LL;
        unsigned int v96 = -402620415;
        goto LABEL_158;
      }

      *(_WORD *)buf = 0;
      v95 = "First certificate is NULL (this should not happen).";
    }

    else
    {
      sub_184068378();
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v94, OS_LOG_TYPE_ERROR)) {
        goto LABEL_157;
      }
      *(_WORD *)buf = 0;
      v95 = "Signers array is empty (this should not happen).";
    }

    _os_log_error_impl(&dword_18404B000, (os_log_t)v94, OS_LOG_TYPE_ERROR, v95, buf, 2u);
    goto LABEL_157;
  }

  CFDataRef v15 = 0LL;
LABEL_146:
  if (!v80)
  {
LABEL_148:
    id v14 = sub_184067D40(v131, (int *)&v158);
    if (v158)
    {
      uint64_t v9 = 0LL;
      BOOL v10 = 0LL;
LABEL_153:
      BOOL v11 = 0LL;
      int v12 = 0LL;
      goto LABEL_159;
    }

    BOOL v10 = sub_184067D9C(v131, (int *)&v158);
    if (v158 || (unsigned int v158 = sub_184067E2C(v131, (uint64_t)&v157, (uint64_t)&v156)) != 0)
    {
      uint64_t v9 = 0LL;
      goto LABEL_153;
    }

    uint64_t v9 = sub_18406802C(v131, &v158);
    if (v158) {
      goto LABEL_153;
    }
    int v12 = (const __CFNumber *)sub_184067BC8(v131);
    BOOL v11 = (void *)sub_184067C04(v131);
    if (v16 && log)
    {
      if (v135) {
        goto LABEL_164;
      }
      uint64_t v129 = sub_18406A068(v16, (uint64_t)v10, (int *)&v158);
      if (v158) {
        goto LABEL_159;
      }
      if (v129 == 2)
      {
LABEL_164:
        int v128 = v148;
        if (v148 | v132)
        {
          CFTypeRef cf = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
          if (!cf)
          {
            sub_184068378();
            loga = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl( &dword_18404B000,  loga,  OS_LOG_TYPE_ERROR,  "Failed to create list of provisioning profiles",  buf,  2u);
            }
          }
        }

        *(void *)buf = v15;
        *(void *)&buf[8] = v157;
        *(void *)&uint8_t buf[16] = v156;
        v161 = v13;
        v162 = v14;
        v163 = v9;
        char v164 = v135;
        char v165 = v133;
        v166 = v11;
        if (v128) {
          BOOL v97 = 1;
        }
        else {
          BOOL v97 = v132 == 0;
        }
        char v98 = !v97;
        char v167 = v98;
        char v168 = v60;
        sub_18406A318((const __CFData **)buf);
      }

      if (v129 != 3)
      {
        sub_184068378();
        v116 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v129;
          _os_log_impl( &dword_18404B000,  v116,  OS_LOG_TYPE_DEFAULT,  "Not validly signed for app provisioning (type: %ld).",  buf,  0xCu);
        }

        unsigned int v96 = -402620392;
        goto LABEL_158;
      }

      uint64_t v127 = 5LL;
    }

    *(void *)buf = 0LL;
    if (!CFNumberGetValue(v12, kCFNumberLongLongType, buf) || *(uint64_t *)buf <= 132095)
    {
      unsigned int v96 = -402620375;
      goto LABEL_158;
    }

    if (!v13) {
      int v13 = (const __CFData *)sub_184067B8C(v131);
    }
    if (!__s2) {
      goto LABEL_193;
    }
    if (v13)
    {
      v101 = CFDataGetBytePtr(v13);
      size_t v102 = CFDataGetLength(v13);
      if (!memcmp(v101, __s2, v102)) {
        goto LABEL_193;
      }
      unsigned int v103 = -402620401;
    }

    else
    {
      unsigned int v103 = -402620415;
    }

    unsigned int v158 = v103;
LABEL_193:
    if (!(_BYTE)v151) {
      goto LABEL_211;
    }
    if (BYTE3(v152)) {
      BOOL v104 = 1;
    }
    else {
      BOOL v104 = BYTE2(v152) == 0;
    }
    if ((!v104 || BYTE1(v152)) && !amfi_developer_mode_status()) {
      unsigned int v158 = -402620373;
    }
    if (CEContextQuery() != *MEMORY[0x1896135D8] || amfi_developer_mode_status())
    {
LABEL_211:
      if (v158) {
        goto LABEL_159;
      }
      if (HIBYTE(v145))
      {
        unsigned int v158 = sub_18406B704(v13);
        if (v158) {
          goto LABEL_159;
        }
      }

      if (v153)
      {
        sub_184068378();
        v105 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v153;
          _os_log_impl(&dword_18404B000, v105, OS_LOG_TYPE_DEFAULT, "%@ was picked for validation", buf, 0xCu);
        }
      }

      if (!v137) {
        goto LABEL_159;
      }
      objc_msgSend_dictionaryWithCapacity_(MEMORY[0x189603FC8], v99, 0, v100);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      if (v108)
      {
        objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x189607968], v106, v127, v107);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v136)
        {
          sub_184068378();
          v117 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl( &dword_18404B000,  v117,  OS_LOG_TYPE_ERROR,  "Could not create signer type number?",  buf,  2u);
          }

          unsigned int v158 = -402620406;
          goto LABEL_254;
        }

        objc_msgSend_setObject_forKeyedSubscript_(v108, v109, (uint64_t)v136, (uint64_t)@"SignerType");
        uint64_t v110 = MEMORY[0x189604A88];
        objc_msgSend_setObject_forKeyedSubscript_( v108,  v111,  MEMORY[0x189604A80],  (uint64_t)@"ValidatedByProfile",  log);
        if ((_BYTE)v152) {
          objc_msgSend_setObject_forKeyedSubscript_(v108, v112, v110, (uint64_t)@"ValidatedByUniversalProfile");
        }
        else {
          objc_msgSend_setObject_forKeyedSubscript_( v108,  v112,  MEMORY[0x189604A80],  (uint64_t)@"ValidatedByUniversalProfile");
        }
        if (BYTE1(v152)) {
          objc_msgSend_setObject_forKeyedSubscript_(v108, v113, v110, (uint64_t)@"ValidatedByLocalProfile");
        }
        else {
          objc_msgSend_setObject_forKeyedSubscript_( v108,  v113,  MEMORY[0x189604A80],  (uint64_t)@"ValidatedByLocalProfile");
        }
        if (v15) {
          objc_msgSend_setObject_forKeyedSubscript_(v108, v114, (uint64_t)v15, (uint64_t)@"SignerCertificate");
        }
        if (v14) {
          objc_msgSend_setObject_forKeyedSubscript_(v108, v114, (uint64_t)v14, (uint64_t)@"SigningID");
        }
        if (v10) {
          objc_msgSend_setObject_forKeyedSubscript_(v108, v114, (uint64_t)v10, (uint64_t)@"SigningTime");
        }
        if (v157) {
          objc_msgSend_setObject_forKeyedSubscript_(v108, v114, (uint64_t)v157, (uint64_t)@"Entitlements");
        }
        if (v9) {
          objc_msgSend_setObject_forKeyedSubscript_(v108, v114, (uint64_t)v9, (uint64_t)@"TeamID");
        }
        if (v13)
        {
          objc_msgSend_setObject_forKeyedSubscript_(v108, v114, (uint64_t)v13, (uint64_t)@"CdHash");
        }

        else
        {
          sub_184068378();
          v118 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl( &dword_18404B000,  v118,  OS_LOG_TYPE_ERROR,  "cdHash is NULL after successful validation? (This should not happen.)",  buf,  2u);
          }
        }

        if (v153) {
          objc_msgSend_setObject_forKeyedSubscript_(v108, v115, (uint64_t)v153, (uint64_t)@"ProfileUUID");
        }
        if (v130) {
          objc_msgSend_setObject_forKeyedSubscript_(v108, v115, (uint64_t)v130, (uint64_t)@"LaunchWarningData");
        }
        objc_msgSend_setObject_forKeyedSubscript_(v108, v115, (uint64_t)v12, (uint64_t)@"SignatureVersion");
        int v122 = objc_msgSend_unsignedIntValue(v11, v119, v120, v121);
        if (v122 == 8 || v122 == 3) {
          objc_msgSend_setObject_forKeyedSubscript_( v108,  v123,  MEMORY[0x189604A88],  (uint64_t)@"IsNativeForPlatform");
        }
        else {
          objc_msgSend_setObject_forKeyedSubscript_( v108,  v123,  MEMORY[0x189604A80],  (uint64_t)@"IsNativeForPlatform");
        }
      }

      void *v137 = v108;
LABEL_254:

      goto LABEL_159;
    }

    unsigned int v96 = -402620373;
LABEL_158:
    unsigned int v158 = v96;
    goto LABEL_159;
  }

  uint64_t v9 = 0LL;
  BOOL v10 = 0LL;
  BOOL v11 = 0LL;
  int v12 = 0LL;
  id v14 = 0LL;
LABEL_159:
  id v8 = v130;
  uint64_t v17 = v131;
LABEL_5:
  uint64_t v18 = v8;
  xpc_object_t v19 = v17;
  CEReleaseManagedContext();
  if (cf) {
    CFRelease(cf);
  }
  if (v153) {
    CFRelease(v153);
  }
  if (v140) {
    CFRelease(v140);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (v157) {
    CFRelease(v157);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v18) {
    CFRelease(v18);
  }
  uint64_t v20 = v158;

  objc_autoreleasePoolPop(context);
  return v20;
}

CFTypeRef sub_18406995C(CFStringRef filePath, uint64_t a2, int *a3)
{
  uint64_t v4 = (const __CFDictionary *)a2;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t valuePtr = 0LL;
  int v16 = 0;
  if (!a2) {
    goto LABEL_8;
  }
  CFTypeID TypeID = CFNumberGetTypeID();
  Value = (const __CFNumber *)CFDictionaryGetValue(v4, @"UniversalFileOffset");
  if (Value)
  {
    id v8 = Value;
    if (CFGetTypeID(Value) != TypeID)
    {
      int v16 = 49174;
      sub_184068378();
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = 49174;
      int v13 = "error processing kMISValidationOptionUniversalFileOffset (invalid type?), error 0x%x";
      goto LABEL_15;
    }

    CFNumberGetValue(v8, kCFNumberLongLongType, &valuePtr);
    if (valuePtr < 0)
    {
      int v16 = 49174;
      sub_184068378();
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = valuePtr;
      int v13 = "invalid kMISValidationOptionUniversalFileOffset %lld";
      id v14 = v12;
      uint32_t v15 = 12;
      goto LABEL_16;
    }
  }

  CFTypeID v9 = CFDataGetTypeID();
  BOOL v10 = (const __CFDictionary *)CFDictionaryGetValue(v4, @"DetachedSignature");
  uint64_t v4 = v10;
  if (v10 && CFGetTypeID(v10) != v9)
  {
    int v16 = 49174;
    sub_184068378();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = 49174;
    int v13 = "error processing kMISValidationOptionDetachedSignature (invalid type?), error 0x%x";
LABEL_15:
    id v14 = v12;
    uint32_t v15 = 8;
LABEL_16:
    _os_log_error_impl(&dword_18404B000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_18;
  }

  int v16 = 0;
  a2 = valuePtr;
LABEL_8:
  CFTypeRef result = sub_184067428(filePath, a2, (uint64_t)v4, &v16);
  if (result) {
    goto LABEL_19;
  }
  sub_184068378();
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = v16;
    _os_log_impl(&dword_18404B000, v12, OS_LOG_TYPE_DEFAULT, "Could not copy code signature (error 0x%x).", buf, 8u);
  }

CFDictionaryRef sub_184069BBC(const __CFDictionary *a1, const void *a2, Boolean *a3)
{
  CFBooleanRef BOOLean = 0LL;
  CFTypeID TypeID = CFBooleanGetTypeID();
  unsigned int v7 = sub_184069C28(a1, a2, TypeID, &BOOLean);
  if (!(_DWORD)v7 && BOOLean) {
    *a3 = CFBooleanGetValue(BOOLean);
  }
  return v7;
}

CFDictionaryRef sub_184069C28( const __CFDictionary *result, const void *a2, uint64_t a3, const __CFDictionary **a4)
{
  if (result)
  {
    CFTypeRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      int v6 = result;
      if (CFGetTypeID(result) == a3)
      {
        CFTypeRef result = 0LL;
        *a4 = v6;
      }

      else
      {
        return (const __CFDictionary *)49174;
      }
    }
  }

  return result;
}

BOOL sub_184069C7C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  objc_msgSend_fileURLWithPath_(MEMORY[0x189604030], a2, a1, a4);
  uint64_t v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  objc_msgSend_pathComponents(v4, v5, v6, v7, 0);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v44, (uint64_t)buf, 16);
  if (!v10) {
    goto LABEL_9;
  }
  uint64_t v14 = v10;
  uint64_t v15 = 0LL;
  uint64_t v16 = *(void *)v45;
  while (2)
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = v15 + 1;
    v15 += v14;
    do
    {
      if (*(void *)v45 != v16) {
        objc_enumerationMutation(v8);
      }
      objc_msgSend_pathExtension(*(void **)(*((void *)&v44 + 1) + 8 * v17), v11, v12, v13);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      char isEqualToString = objc_msgSend_isEqualToString_(v19, v20, (uint64_t)@"app", v21);

      if ((isEqualToString & 1) != 0)
      {
        unsigned int v24 = (void *)MEMORY[0x189604030];
        objc_msgSend_pathComponents(v4, v11, v12, v13);
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_subarrayWithRange_(v25, v26, 0, v18 + v17);
        CFTypeID v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fileURLWithPathComponents_(v24, v28, (uint64_t)v27, v29);
        int v23 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

        if (!v23) {
          goto LABEL_24;
        }
        if (sub_18406D248((const __CFURL *)v4, v23))
        {
          Unique = (__CFBundle *)_CFBundleCreateUnique();
          if (Unique)
          {
            sub_184068378();
            uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v49 = v4;
              __int16 v50 = 2112;
              unint64_t v51 = v23;
              _os_log_impl(&dword_18404B000, v31, OS_LOG_TYPE_INFO, "Got bundle for %@ -> %@", buf, 0x16u);
            }

            BOOL v32 = CFBundleCopyExecutableURL(Unique);
            BOOL v33 = v32;
            if (v32)
            {
              int v34 = CFURLCopyAbsoluteURL(v32);
              sub_184068378();
              CFTypeID v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                CFStringRef v36 = CFURLGetString((CFURLRef)v4);
                *(_DWORD *)buf = 138412290;
                CFStringRef v49 = v36;
                _os_log_impl(&dword_18404B000, v35, OS_LOG_TYPE_INFO, "Ours: %@", buf, 0xCu);
              }

              sub_184068378();
              int v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                CFStringRef v38 = CFURLGetString(v34);
                *(_DWORD *)buf = 138412290;
                CFStringRef v49 = v38;
                _os_log_impl(&dword_18404B000, v37, OS_LOG_TYPE_INFO, "Bundle: %@", buf, 0xCu);
              }

              CFComparisonResult v39 = sub_18406D248((const __CFURL *)v4, v34);
              BOOL v40 = v39 == kCFCompareEqualTo;
              sub_184068378();
              uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v49) = v39 == kCFCompareEqualTo;
                _os_log_impl(&dword_18404B000, v41, OS_LOG_TYPE_INFO, "Is main executable: %i", buf, 8u);
              }

              char v42 = 0;
              if (v4) {
                goto LABEL_30;
              }
              goto LABEL_31;
            }

            char v42 = 0;
LABEL_28:
            int v34 = 0LL;
            goto LABEL_29;
          }

          char v42 = 0;
        }

        else
        {
          char v42 = 0;
          Unique = 0LL;
        }

        BOOL v33 = 0LL;
        goto LABEL_28;
      }

      ++v17;
    }

    while (v14 != v17);
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v44, (uint64_t)buf, 16);
    if (v14) {
      continue;
    }
    break;
  }

uint64_t sub_18406A068(const __CFArray *a1, uint64_t a2, int *a3)
{
  if (qword_18C671E48 != -1) {
    dispatch_once(&qword_18C671E48, &unk_189DABA60);
  }
  id v6 = (id)qword_18C671E40;
  ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(a1, 0LL);
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = sub_18406D050;
  aBlock[3] = &unk_189DABA20;
  aBlock[4] = a1;
  aBlock[5] = a2;
  id v8 = (unsigned int (**)(void *, uint64_t))_Block_copy(aBlock);
  if (!ValueAtIndex)
  {
    sub_184068378();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v33 = 0;
      _os_log_error_impl( &dword_18404B000,  v21,  OS_LOG_TYPE_ERROR,  "There is no leaf cert (this should not happen).",  v33,  2u);
    }

    uint64_t v20 = 0LL;
    CFTypeID v9 = 0LL;
    CFDataRef v12 = 0LL;
    goto LABEL_16;
  }

  CFTypeID v9 = SecCertificateCopyData(ValueAtIndex);
  CFDataRef v12 = sub_1840646E8(v9);
  if (!v12 || !v6)
  {
    sub_184068378();
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v33 = 0;
      _os_log_error_impl( &dword_18404B000,  v22,  OS_LOG_TYPE_ERROR,  "Failure creating profile cache key. This shouldn't happen.",  v33,  2u);
    }

    uint64_t v20 = 0LL;
LABEL_16:
    uint64_t v17 = 0LL;
    goto LABEL_17;
  }

  objc_msgSend_objectForKey_(v6, v10, (uint64_t)v12, v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = v13;
  if (v13)
  {
    int v18 = objc_msgSend_intValue(v13, v14, v15, v16);
    if (v18)
    {
      int v19 = 0;
      uint64_t v20 = v18;
      if (!a3) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }

    sub_184068378();
    unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v33 = 0;
      _os_log_error_impl( &dword_18404B000,  v24,  OS_LOG_TYPE_ERROR,  "Found in cert cache, but cert type is CertTypeError (this should not happen).",  v33,  2u);
    }
  }

  uint64_t AppleTVOSApplicationSigning = SecPolicyCreateAppleTVOSApplicationSigning();
  if (!v8[2](v8, AppleTVOSApplicationSigning))
  {
    uint64_t v20 = 1LL;
    objc_msgSend_numberWithInt_(MEMORY[0x189607968], v26, 1, v27);
    goto LABEL_28;
  }

  uint64_t v28 = SecPolicyCreateiPhoneProfileApplicationSigning();
  if (!v8[2](v8, v28))
  {
    uint64_t v20 = 2LL;
    objc_msgSend_numberWithInt_(MEMORY[0x189607968], v29, 2, v30);
LABEL_28:
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v32, (uint64_t)v31, (uint64_t)v12);

    int v19 = 0;
    if (!a3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  uint64_t v20 = 0LL;
LABEL_17:
  int v19 = -402620392;
  if (a3) {
LABEL_18:
  }
    *a3 = v19;
LABEL_19:

  return v20;
}

void sub_18406A318(const __CFData **a1)
{
  v14[0] = 0LL;
  v14[1] = v14;
  unint64_t v14[2] = 0x2020000000LL;
  char v15 = 0;
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x2020000000LL;
  char v13 = 0;
  v10[0] = 0LL;
  v10[1] = v10;
  unint64_t v10[2] = 0x2020000000LL;
  char v11 = 0;
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x2020000000LL;
  char v9 = 0;
  v6[0] = 0LL;
  v6[1] = v6;
  time_t v6[2] = 0x2020000000LL;
  char v7 = 0;
  v4[0] = 0LL;
  v4[1] = v4;
  v4[2] = 0x2020000000LL;
  char v5 = 0;
  v2[0] = 0LL;
  v2[1] = v2;
  v2[2] = 0x2020000000LL;
  char v3 = 0;
  v1[0] = 0LL;
  v1[1] = v1;
  v1[2] = 0x2020000000LL;
  sub_18406F87C();
}

uint64_t sub_18406A3E0(uint64_t a1)
{
  v44[3] = a1;
  v41[0] = 0LL;
  v41[1] = v41;
  uint64_t v42 = v8;
  char v43 = 0;
  uint64_t v9 = MEMORY[0x1895F87A8];
  v35[0] = MEMORY[0x1895F87A8];
  v35[1] = 3221225472LL;
  v35[2] = sub_18406BE40;
  v35[3] = &unk_189DABA88;
  v35[4] = v41;
  uint64_t v36 = v6;
  uint64_t v37 = v4;
  uint64_t v38 = v3;
  uint64_t v39 = v2;
  uint64_t v40 = v5;
  uint64_t v10 = _Block_copy(v35);
  char v11 = *(void **)(v5 + 8);
  objc_msgSend_arrayWithCapacity_(MEMORY[0x189603FA8], v12, 20, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)(v7 - 184) = v9;
  *(void *)(v7 - 176) = 3221225472LL;
  *(void *)(v7 - 16_Block_object_dispose(va, 8) = sub_1840646DC;
  *(void *)(v7 - 160) = &unk_189DAB698;
  char v15 = v14;
  *(void *)(v7 - 152) = v15;
  id v16 = (id)(v7 - 184);
  objc_msgSend_stringWithString_(MEMORY[0x189607940], v17, (uint64_t)@"\x1F", v18);
  int v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)(v7 - 144) = v9;
  *(void *)(v7 - 136) = 3221225472LL;
  *(void *)(v7 - 12_Block_object_dispose(va, 8) = sub_184064364;
  *(void *)(v7 - 120) = &unk_189DAB670;
  *(void *)(v7 - 112) = v16;
  id v20 = v16;
  sub_184064370(v11, v19, (void *)(v7 - 144));

  if (*(_BYTE *)(v5 + 48))
  {
    v34[0] = v9;
    v34[1] = 3221225472LL;
    unint64_t v34[2] = sub_18406C2C0;
    v34[3] = &unk_189DABAB0;
    v34[5] = v7 - 216;
    v34[6] = v47;
    uint64_t v21 = v34;
    v34[7] = v49;
    _OWORD v34[4] = v10;
    uint64_t v22 = MISEnumerateMatchingProfiles(v1, v15, v34);
    CFDateRef v23 = 0LL;
    unsigned int v24 = 0LL;
  }

  else
  {
    __int16 v25 = (const void *)MGCopyAnswer();
    unsigned int v24 = v25;
    if (!v25)
    {
      sub_184068378();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)(v7 - 144) = 0;
        _os_log_error_impl( &dword_18404B000,  v29,  OS_LOG_TYPE_ERROR,  "got NULL when querying UDID",  (uint8_t *)(v7 - 144),  2u);
      }

      CFDateRef v23 = 0LL;
      unsigned int v24 = 0LL;
      goto LABEL_15;
    }

    CFTypeID v26 = CFGetTypeID(v25);
    uint64_t v22 = 3892346881LL;
    if (v26 != CFStringGetTypeID())
    {
      sub_184068378();
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)(v7 - 144) = 0;
        _os_log_error_impl( &dword_18404B000,  v30,  OS_LOG_TYPE_ERROR,  "got non-string when querying UDID",  (uint8_t *)(v7 - 144),  2u);
      }

      CFRelease(v24);
      CFDateRef v23 = 0LL;
      unsigned int v24 = 0LL;
      goto LABEL_25;
    }

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFDateRef v23 = CFDateCreate((CFAllocatorRef)*MEMORY[0x189604DB0], Current);
    if (!v23) {
      goto LABEL_25;
    }
    sub_184068378();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)(v7 - 144) = 0;
      _os_log_impl(&dword_18404B000, v28, OS_LOG_TYPE_DEFAULT, "Authoritative", (uint8_t *)(v7 - 144), 2u);
    }

    v33[0] = v9;
    v33[1] = 3221225472LL;
    void v33[2] = sub_18406C31C;
    v33[3] = &unk_189DABAD8;
    v33[11] = v23;
    v33[12] = v1;
    v33[5] = v47;
    v33[6] = v7 - 216;
    v33[13] = v5;
    v33[7] = v46;
    v33[8] = v45;
    uint64_t v21 = v33;
    v33[9] = v49;
    v33[10] = v24;
    uint64_t v33[4] = v10;
    uint64_t v22 = MISEnumerateMatchingProfiles(v1, v15, v33);
  }

  if (*(_BYTE *)(*(void *)(v7 - 240) + 24LL)) {
    goto LABEL_25;
  }
  if (*(_BYTE *)(v47[1] + 24LL))
  {
    uint64_t v22 = 3892346897LL;
    goto LABEL_25;
  }

  if (*(_BYTE *)(v48[1] + 24LL))
  {
    uint64_t v22 = 3892346916LL;
    goto LABEL_25;
  }

  if (*(_BYTE *)(v46[1] + 24LL))
  {
    uint64_t v22 = 3892346922LL;
    goto LABEL_25;
  }

  if (*(_BYTE *)(v45[1] + 24LL))
  {
    uint64_t v22 = 3892346924LL;
    goto LABEL_25;
  }

  if (*(_BYTE *)(*(void *)(v7 - 208) + 24LL))
  {
    if (*(_BYTE *)(v49[1] + 24LL))
    {
      sub_184068378();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)(v7 - 144) = 0;
        _os_log_error_impl( &dword_18404B000,  v29,  OS_LOG_TYPE_ERROR,  "Invalid profile iteration outcome?",  (uint8_t *)(v7 - 144),  2u);
      }

LABEL_25:
  if (v1) {
    CFRelease(v1);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v24) {
    CFRelease(v24);
  }
  uint64_t v31 = *(const void **)(v44[1] + 24LL);
  if (v31) {
    CFRelease(v31);
  }
  if (v15) {
    CFRelease(v15);
  }

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose((const void *)(v7 - 248), 8);
  _Block_object_dispose((const void *)(v7 - 216), 8);
  return v22;
}

  int64 = 4LL;
LABEL_26:
  free(v17);
  free(v19);
  if (v20) {
    free(v20);
  }
LABEL_28:

  return int64;
}

void sub_18406A8B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, char a42, uint64_t a43, uint64_t a44, uint64_t a45, char a46, uint64_t a47, uint64_t a48, uint64_t a49, char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
}

uint64_t sub_18406A930( const __CFData *a1, CFArrayRef theArray, const __CFNumber *a3, void *a4, int64_t a5, CFTypeRef *a6, const __CFString *a7)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 3892346881LL;
  }
  if (!theArray) {
    return 3892346881LL;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count < 1) {
    return 3892346881LL;
  }
  CFIndex v12 = Count;
  CFTypeID v35 = a6;
  CFIndex v13 = 0LL;
  uint64_t v14 = 3892346881LL;
  while (1)
  {
    ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(theArray, v13);
    if (!ValueAtIndex)
    {
      sub_184068378();
      unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      __int16 v25 = v24;
      CFTypeID v26 = "Encountered NULL record!";
      uint32_t v27 = 2;
LABEL_21:
      _os_log_error_impl(&dword_18404B000, v25, OS_LOG_TYPE_ERROR, v26, buf, v27);
      goto LABEL_34;
    }

    id v16 = ValueAtIndex;
    if (CFArrayGetCount(ValueAtIndex) != 4)
    {
      sub_184068378();
      unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      CFIndex v28 = CFArrayGetCount(v16);
      *(_DWORD *)buf = 134218242;
      CFIndex v40 = v28;
      __int16 v41 = 2112;
      uint64_t v42 = v16;
      __int16 v25 = v24;
      CFTypeID v26 = "Encountered record with %ld != 4 entries: %@";
      uint32_t v27 = 22;
      goto LABEL_21;
    }

    uint64_t v17 = (const __CFString *)CFArrayGetValueAtIndex(v16, 0LL);
    uint64_t v18 = (const __CFString *)CFArrayGetValueAtIndex(v16, 1LL);
    if (!v17 || (int v19 = v18) == 0LL)
    {
      sub_184068378();
      unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 138412290;
      CFIndex v40 = (CFIndex)v16;
      __int16 v25 = v24;
      CFTypeID v26 = "Encountered record with no UUID or Team ID: %@";
      uint32_t v27 = 12;
      goto LABEL_21;
    }

    id v20 = (const __CFBoolean *)CFArrayGetValueAtIndex(v16, 2LL);
    uint64_t v21 = (const __CFBoolean *)CFArrayGetValueAtIndex(v16, 3LL);
    sub_184068378();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18404B000, v22, OS_LOG_TYPE_DEFAULT, "Performing online authorization.", buf, 2u);
    }

    int64_t v23 = sub_18406E798(a1, v17, v19, v20, v21, a3, a4, a5, a7);
    if ((v23 & 0x24) != 0)
    {
      sub_184068378();
      unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFIndex v40 = (CFIndex)a1;
        __int16 v41 = 2112;
        uint64_t v42 = (void *)v17;
        _os_log_impl(&dword_18404B000, v24, OS_LOG_TYPE_DEFAULT, "Authorization still pending: %@, %@", buf, 0x16u);
      }

      uint64_t v14 = 0LL;
      goto LABEL_34;
    }

    int64_t v29 = v23;
    if ((v23 & 0x10) != 0) {
      break;
    }
    if ((v23 & 2) != 0)
    {
      sub_184068378();
      unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = 3892346904LL;
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 134218498;
      CFIndex v40 = v29;
      __int16 v41 = 2112;
      uint64_t v42 = a1;
      __int16 v43 = 2112;
      __int128 v44 = v17;
      uint64_t v31 = v24;
      BOOL v32 = "No online authorization (%#llx): %@, %@";
LABEL_33:
      _os_log_impl(&dword_18404B000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0x20u);
      goto LABEL_34;
    }

    if ((v23 & 8) != 0)
    {
      sub_184068378();
      unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = 3892346918LL;
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 134218498;
      CFIndex v40 = v29;
      __int16 v41 = 2112;
      uint64_t v42 = a1;
      __int16 v43 = 2112;
      __int128 v44 = v17;
      uint64_t v31 = v24;
      BOOL v32 = "Online authorization rejected (%#llx), %@, %@";
      goto LABEL_33;
    }

    sub_184068378();
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unsigned int v24 = v30;
    if ((v29 & 1) != 0)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFIndex v40 = (CFIndex)a1;
        __int16 v41 = 2112;
        uint64_t v42 = (void *)v17;
        _os_log_impl(&dword_18404B000, v24, OS_LOG_TYPE_DEFAULT, "Online authorization succeeded: %@, %@", buf, 0x16u);
      }

      if (!v35) {
        return 0LL;
      }
      if (*v35) {
        CFRelease(*v35);
      }
      uint64_t v14 = 0LL;
      *CFTypeID v35 = CFRetain(v17);
      return v14;
    }

    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFIndex v40 = (CFIndex)a1;
      __int16 v41 = 2112;
      uint64_t v42 = (void *)v17;
      _os_log_error_impl(&dword_18404B000, v24, OS_LOG_TYPE_ERROR, "Online authorization ambiguous: %@, %@", buf, 0x16u);
    }

    uint64_t v14 = 3892346881LL;
LABEL_34:

    if (v12 == ++v13) {
      return v14;
    }
  }

  sub_184068378();
  int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    CFIndex v40 = v29 & 0x10;
    _os_log_error_impl( &dword_18404B000,  v34,  OS_LOG_TYPE_ERROR,  "Auth agent contact failure (entitlement status %lld)",  buf,  0xCu);
  }

  return 3892346893LL;
}

void sub_18406AE7C()
{
  uint64_t v0 = objc_opt_new();
  sub_184068288(v0, v1, v2, v3);
}

void sub_18406B6E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_18406B704(const __CFData *a1)
{
  kern_return_t v6;
  kern_return_t v7;
  os_log_s *v8;
  const char *v9;
  os_log_s *v10;
  uint32_t v11;
  uint64_t v12;
  mach_port_t v14;
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t v17;
  io_connect_t connect;
  uint64_t input;
  uint8_t buf[4];
  int v21;
  uint64_t v22;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  connect = 0;
  mach_port_t v2 = *MEMORY[0x1896086A8];
  uint64_t v3 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  io_object_t v5 = MatchingService;
  if (!MatchingService)
  {
    sub_184068378();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "Unable to find AppleMobileFileIntegrity service.";
      uint64_t v10 = v8;
      char v11 = 2;
      goto LABEL_19;
    }

    goto LABEL_7;
  }

  uint64_t v6 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, &connect);
  if (v6)
  {
    uint64_t v7 = v6;
    sub_184068378();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      uint64_t v21 = v7;
      uint64_t v9 = "Unable to open AppleMobileFileIntegrity user client: 0x%x";
LABEL_5:
      uint64_t v10 = v8;
      char v11 = 8;
LABEL_19:
      _os_log_error_impl(&dword_18404B000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      goto LABEL_7;
    }

    goto LABEL_7;
  }

  input = 1LL;
  uint64_t v14 = connect;
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v17 = IOConnectCallMethod(v14, 6u, &input, 1u, BytePtr, Length, 0LL, 0LL, 0LL, 0LL);
  CFIndex v12 = v17;
  if ((_DWORD)v17)
  {
    if ((_DWORD)v17 != -536870160)
    {
      sub_184068378();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        uint64_t v21 = v12;
        uint64_t v9 = "AppleMobileFileIntegrity user client call failed: 0x%x";
        goto LABEL_5;
      }

LABEL_8:
  if (connect) {
    IOServiceClose(connect);
  }
  if (v5) {
    IOObjectRelease(v5);
  }
  return v12;
}

void sub_18406B918()
{
}

void sub_18406B940()
{
}

uint64_t sub_18406B950( const void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int16 a9, uint64_t a10, uint8_t buf, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (v20) {
    MISQueryBlacklistForCdHash(v19, 26, 1, 0LL);
  }
  uint64_t v22 = sub_184064840(v19);
  if (v22)
  {
    int64_t v23 = v22;
    if (sub_18406FA9C((BOOL)a1, v22))
    {
      uint64_t v24 = 3LL;
    }

    else if (sub_18406FA9C((BOOL)v18, v23))
    {
      sub_184068378();
      CFTypeID v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v28 = 0;
        _os_log_impl(&dword_18404B000, v26, OS_LOG_TYPE_DEFAULT, "Previous authorization failed.", (uint8_t *)&v28, 2u);
      }

      uint64_t v24 = 2LL;
    }

    else
    {
      uint64_t v24 = 0LL;
    }

    CFRelease(v23);
    if (v18) {
LABEL_16:
    }
      CFRelease(v18);
  }

  else
  {
    sub_184068378();
    __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = 0;
      _os_log_error_impl( &dword_18404B000,  v25,  OS_LOG_TYPE_ERROR,  "Could not create cdHash hex representation for app approval state (this should not happen).",  (uint8_t *)&v29,  2u);
    }

    uint64_t v24 = 1LL;
    if (v18) {
      goto LABEL_16;
    }
  }

  if (a1) {
    CFRelease(a1);
  }
  return v24;
}

uint64_t sub_18406BA80(uint64_t a1, const __CFString *a2, const __CFString *a3, uint64_t a4, char a5)
{
  uint64_t v8 = 1LL;
  if (CFStringCompare(*(CFStringRef *)(a1 + 40), a2, 1uLL) == kCFCompareEqualTo)
  {
    if ((a5 & 1) != 0 || (uint64_t v8 = 1LL, CFStringCompare(*(CFStringRef *)(a1 + 48), a3, 1uLL) == kCFCompareEqualTo))
    {
      uint64_t v8 = 0LL;
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    }
  }

  return v8;
}

void MISExistsIndeterminateApps_0()
{
}

BOOL sub_18406BB24( const __CFArray *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint8_t buf, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, int a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30)
{
  uint64_t v42 = 0LL;
  __int16 v43 = &v42;
  uint64_t v44 = 0x2020000000LL;
  int v45 = 33;
  if (v30 && (uint64_t v30 = sub_184064840((const __CFData *)v30)) == 0LL)
  {
    sub_184068378();
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v41[0] = 0;
      _os_log_error_impl( &dword_18404B000,  v38,  OS_LOG_TYPE_ERROR,  "Could not create cdHash hex representation for indeterminate app check (this should not happen).",  (uint8_t *)v41,  2u);
    }

    BOOL v35 = 0LL;
    uint64_t v30 = 0LL;
    if (a1) {
      goto LABEL_19;
    }
  }

  else
  {
    v40[0] = MEMORY[0x1895F87A8];
    v40[1] = 3221225472LL;
    v40[2] = sub_18406BCD8;
    v40[3] = &unk_189DABB28;
    v40[5] = v32;
    v40[6] = v30;
    v40[4] = &v42;
    sub_18406FB18(a1, (uint64_t)v40);
    int v34 = *((_DWORD *)v43 + 6);
    BOOL v35 = v34 < 1;
    if (v34 <= 0)
    {
      sub_184068378();
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v41[0] = 0;
        _os_log_impl(&dword_18404B000, v37, OS_LOG_TYPE_DEFAULT, "Authorization is pending.", (uint8_t *)v41, 2u);
      }

      if (!v31)
      {
        BOOL v35 = 1LL;
        if (!a1) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }

      BOOL v36 = 0;
      goto LABEL_10;
    }

    if (v31)
    {
      BOOL v36 = v34 < 6;
LABEL_10:
      *uint64_t v31 = v36;
      if (!a1) {
        goto LABEL_20;
      }
LABEL_19:
      CFRelease(a1);
      goto LABEL_20;
    }

    BOOL v35 = 0LL;
    if (a1) {
      goto LABEL_19;
    }
  }

void sub_18406BCC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

BOOL sub_18406BCD8( void *a1, CFStringRef theString2, __CFString *a3, uint64_t a4, uint64_t a5, const __CFNumber *a6)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v10 = (const __CFString *)a1[5];
  if (v10)
  {
    uint64_t v11 = 1LL;
    if (CFStringCompare(v10, a3, 1uLL)) {
      return v11;
    }
  }

  CFIndex v12 = (const __CFString *)a1[6];
  if (v12)
  {
    uint64_t v11 = 1LL;
    if (CFStringCompare(v12, theString2, 1uLL)) {
      return v11;
    }
  }

  int valuePtr = *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL);
  if (!CFNumberGetValue(a6, kCFNumberIntType, &valuePtr))
  {
    sub_184068378();
    char v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v19 = valuePtr;
      _os_log_error_impl( &dword_18404B000,  v15,  OS_LOG_TYPE_ERROR,  "Failure getting value of graceCount for record. Got %d, ignoring.",  buf,  8u);
    }

    return 1LL;
  }

  uint64_t v13 = *(void *)(a1[4] + 8LL);
  int v14 = *(_DWORD *)(v13 + 24);
  if (v14 >= valuePtr) {
    int v14 = valuePtr;
  }
  *(_DWORD *)(v13 + 24) = v14;
  return *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) > 0;
}

uint64_t sub_18406BE40( void *a1, const __CFString *a2, const __CFString *a3, int a4, int a5, int a6, char a7)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  if (!a2)
  {
    sub_184068378();
    __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18404B000,  v28,  OS_LOG_TYPE_ERROR,  "Skipping universal/local profile with NULL UUID.",  buf,  2u);
    }

    return 1LL;
  }

  char v7 = a6;
  if (*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL)) {
    BOOL v9 = a6 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    return 1LL;
  }
  if (*(void *)(a1[8] + 16LL))
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 4LL, MEMORY[0x189605228]);
    if (!Mutable)
    {
      sub_184068378();
      BOOL v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_18404B000,  v36,  OS_LOG_TYPE_ERROR,  "Profile record creation failed, bailing out!",  buf,  2u);
      }

      return 0LL;
    }

    id v16 = Mutable;
    if (!a3) {
      a3 = &stru_189DAC7E8;
    }
    CFArrayAppendValue(Mutable, a2);
    CFArrayAppendValue(v16, a3);
    uint64_t v17 = (const void *)*MEMORY[0x189604DE8];
    uint64_t v18 = (const void *)*MEMORY[0x189604DE0];
    if (a4) {
      int v19 = (const void *)*MEMORY[0x189604DE8];
    }
    else {
      int v19 = (const void *)*MEMORY[0x189604DE0];
    }
    CFArrayAppendValue(v16, v19);
    if (a5) {
      uint64_t v20 = v17;
    }
    else {
      uint64_t v20 = v18;
    }
    CFArrayAppendValue(v16, v20);
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1[8] + 16LL), v16);
    CFRelease(v16);
  }

  if ((a4 & 1) != 0 || a5)
  {
    __int16 v29 = (char *)a1[8];
    if (*v29) {
      char v30 = 1;
    }
    else {
      char v30 = a4;
    }
    *__int16 v29 = v30;
    if (v29[1]) {
      char v31 = 1;
    }
    else {
      char v31 = a5;
    }
    v29[1] = v31;
    BOOL v32 = sub_18406FA9C(*(void *)(*(void *)(a1[5] + 8LL) + 24LL), a2);
    sub_184068378();
    BOOL v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v34 = v33;
    if (v32)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v47 = a2;
        _os_log_impl( &dword_18404B000,  v34,  OS_LOG_TYPE_DEFAULT,  "Universal/Local Provisioning Profile '%@' is not viable for validation.",  buf,  0xCu);
      }

      *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    }

    else
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v47 = a2;
        _os_log_impl( &dword_18404B000,  v34,  OS_LOG_TYPE_INFO,  "Accepting Universal/Local Provisioning Profile '%@'.",  buf,  0xCu);
      }
    }

    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = !v32;
    if (*(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL))
    {
      uint64_t v37 = *(void *)(a1[4] + 8LL);
      if (*(_BYTE *)(v37 + 24)) {
        char v38 = 1;
      }
      else {
        char v38 = v7;
      }
      *(_BYTE *)(v37 + 24) = v38;
      uint64_t v39 = *(const void **)(a1[8] + 8LL);
      if (v39) {
        CFRelease(v39);
      }
      *(void *)(a1[8] + 8LL) = CFRetain(a2);
    }

    if (*(_BYTE *)(a1[9] + 64LL))
    {
      v44[0] = a2;
      v44[1] = a3;
      uint64_t v40 = MEMORY[0x189604A80];
      if (a4) {
        uint64_t v41 = MEMORY[0x189604A88];
      }
      else {
        uint64_t v41 = MEMORY[0x189604A80];
      }
      if (a5) {
        uint64_t v40 = MEMORY[0x189604A88];
      }
      v44[2] = v41;
      v44[3] = v40;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v35, (uint64_t)v44, 4);
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      int v45 = v42;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v43, (uint64_t)&v45, 1);
      objc_claimAutoreleasedReturnValue();

      sub_18406AE7C();
    }

    return 1LL;
  }

  sub_184068378();
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v47 = a2;
    _os_log_impl(&dword_18404B000, v21, OS_LOG_TYPE_INFO, "Using Provisioning Profile '%@'.", buf, 0xCu);
  }

  uint64_t v22 = a1[8];
  *(_BYTE *)(v22 + 2) = 1;
  *(_BYTE *)(v22 + 3) = a7;
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 1;
  if (!*(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL)) {
    return 0LL;
  }
  uint64_t v23 = *(void *)(a1[4] + 8LL);
  if (*(_BYTE *)(v23 + 24)) {
    char v24 = 1;
  }
  else {
    char v24 = v7;
  }
  *(_BYTE *)(v23 + 24) = v24;
  __int16 v25 = *(const void **)(v22 + 8);
  if (v25) {
    CFRelease(v25);
  }
  CFTypeRef v26 = CFRetain(a2);
  uint64_t result = 0LL;
  *(void *)(a1[8] + 8LL) = v26;
  return result;
}

uint64_t sub_18406C2C0(void *a1, uint64_t a2)
{
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  if (*(_BYTE *)(a2 + 16))
  {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    return 1LL;
  }

  else
  {
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 1;
    return (*(uint64_t (**)(void))(a1[4] + 16LL))();
  }

uint64_t sub_18406C31C(uint64_t a1, uint64_t a2)
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  if (!*(_BYTE *)(a2 + 16))
  {
    io_object_t v5 = *(const __CFString **)a2;
    uint64_t v6 = *(void **)(a2 + 24);
    *(_DWORD *)buf = -402620415;
    char v7 = sub_184065B20(v6, v5, 0, (int *)buf);
    uint64_t v8 = v7;
    if (v7) {
      BOOL v9 = *(_DWORD *)buf == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      int v15 = MISProvisioningProfileCheckValidity(v7, *(const __CFString **)(a1 + 80), *(const __CFDate **)(a1 + 88));
      if (v15)
      {
        int v19 = v15;
        if (v15 == -402620399) {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
        }
        sub_184068378();
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v93) = v19;
        CFIndex v12 = "Skipping a profile because of error %#x.\n";
        uint64_t v13 = v10;
        uint32_t v14 = 8;
        goto LABEL_14;
      }

      objc_msgSend_certs(v8, v16, v17, v18);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v99.size_t length = CFArrayGetCount((CFArrayRef)v21);
        v99.location = 0LL;
        int v22 = CFArrayContainsValue((CFArrayRef)v21, v99, *(const void **)(a1 + 96));
        uint64_t v3 = 1LL;
        if (!v22) {
          goto LABEL_17;
        }
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      }

      Value = MISProfileGetValue(v8, (uint64_t)@"UUID");
      objc_msgSend_entitlements(v8, v24, v25, v26);
      uint32_t v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        if (MISProvisioningProfileIsForBetaDeployment(v8, v28, v29, v30))
        {
          char v31 = *(const __CFDictionary **)(*(void *)(a1 + 104) + 8LL);
          if (v31)
          {
            if (CFDictionaryContainsKey(v31, @"application-identifier")
              && !sub_18406CB48( v8,  *(const __CFData **)(*(void *)(a1 + 104) + 24LL),  *(void **)(*(void *)(a1 + 104) + 56LL)))
            {
              uint64_t v80 = *(void *)(a1 + 56);
LABEL_61:
              uint64_t v3 = 1LL;
              *(_BYTE *)(*(void *)(v80 + 8) + 24LL) = 1;
              goto LABEL_17;
            }
          }
        }

        uint64_t v83 = (uint64_t)Value;
        unint64_t v84 = (void *)a1;
        CFTypeRef cf = v27;
        MISProfileGetValue(v8, (uint64_t)@"AppAudience");
        BOOL v32 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v85 = v8;
        MISProfileGetValue(v8, (uint64_t)@"UUID");
        BOOL v33 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v88 = 0u;
        __int128 v89 = 0u;
        __int128 v90 = 0u;
        __int128 v91 = 0u;
        id obj = v32;
        uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v88, (uint64_t)buf, 16);
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v89;
          char v38 = @"InternalBuild";
          while (2)
          {
            for (uint64_t i = 0LL; i != v36; ++i)
            {
              if (*(void *)v89 != v37) {
                objc_enumerationMutation(obj);
              }
              id v40 = *(id *)(*((void *)&v88 + 1) + 8 * i);
              id v41 = v33;
              if (objc_msgSend_isEqual_(v40, v42, (uint64_t)v38, v43, cf))
              {
                id v87 = v41;
                uint64_t v46 = v36;
                __int128 v47 = v38;
                sub_18406F7D8();
                uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
                CFStringRef v49 = @"Internal";
                int isEqualToString = objc_msgSend_isEqualToString_(v48, v50, (uint64_t)@"Internal", v51);

                int v53 = MGGetBoolAnswer();
                sub_184068378();
                uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                int v55 = v53 ^ 1;
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v94 = 138543874;
                  id v95 = v40;
                  __int16 v96 = 1024;
                  *(_DWORD *)BOOL v97 = isEqualToString;
                  *(_WORD *)&v97[4] = 1024;
                  *(_DWORD *)&v97[6] = v55;
                  _os_log_impl( &dword_18404B000,  v54,  OS_LOG_TYPE_DEFAULT,  "Checking %{public}@ App Audience, %d, %d",  v94,  0x18u);
                }

                if (((v55 | isEqualToString) & 1) == 0)
                {
                  sub_184068378();
                  __int128 v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v94 = 138543618;
                    id v95 = v40;
                    __int16 v96 = 2114;
                    *(void *)BOOL v97 = v33;
                    _os_log_error_impl( &dword_18404B000,  v77,  OS_LOG_TYPE_ERROR,  "Denying profile %{public}@ due to %{public}@ App Audience",  v94,  0x16u);
                  }

                  __int128 v78 = v84;
                  uint64_t v8 = v85;
                  id v41 = v87;
LABEL_58:

                  sub_184068378();
                  __int128 v79 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v94 = 138543618;
                    id v95 = v40;
                    __int16 v96 = 2114;
                    *(void *)BOOL v97 = v33;
                    _os_log_error_impl( &dword_18404B000,  v79,  OS_LOG_TYPE_ERROR,  "App audience %{public}@ from profile %{public}@ not matched",  v94,  0x16u);
                  }

                  uint64_t v80 = v78[8];
                  goto LABEL_61;
                }

                char v38 = v47;
                uint64_t v36 = v46;
                id v41 = v87;
              }

              else
              {
                int isEqual = objc_msgSend_isEqual_(v40, v44, (uint64_t)@"NoExecute", v45);
                sub_184068378();
                id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                uint64_t v48 = v57;
                if (isEqual)
                {
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v94 = 138543618;
                    id v95 = v40;
                    __int16 v96 = 2114;
                    *(void *)BOOL v97 = v33;
                    _os_log_error_impl( &dword_18404B000,  (os_log_t)v48,  OS_LOG_TYPE_ERROR,  "Denying profile %{public}@ due to %{public}@ App Audience",  v94,  0x16u);
                  }

                  __int128 v78 = v84;
                  uint64_t v8 = v85;
                  goto LABEL_58;
                }

                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v94 = 138543618;
                  id v95 = v40;
                  __int16 v96 = 2114;
                  *(void *)BOOL v97 = v33;
                  _os_log_impl( &dword_18404B000,  (os_log_t)v48,  OS_LOG_TYPE_DEFAULT,  "Ignoring unenforced App Audience: %{public}@ from profile %{public}@",  v94,  0x16u);
                }
              }
            }

            uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v58, (uint64_t)&v88, (uint64_t)buf, 16);
            if (v36) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v85;
        if (!*(void *)(v84[13] + 8LL)
          || (uint64_t v62 = objc_msgSend_derEntitlements(v85, v59, v60, v61),
              uint64_t v63 = *(void *)(v84[13] + 16LL),
              BOOL v64 = MISProvisioningProfileIsAppleInternalProfile(v85) != 0,
              (sub_18406CE44(v62, v63, v83, v64) & 1) != 0))
        {
          if (!sub_18406371C(v85, (uint64_t)@"LocalProvision")
            || (uint64_t v65 = v84[13], *(_BYTE *)(v65 + 49))
            || sub_18406CF20(*(void *)(v65 + 32), *(void *)(v65 + 40), cf, v83))
          {
            *(_BYTE *)(*(void *)(v84[9] + 8LL) + 24LL) = 1;
            sub_184068378();
            uint64_t v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v93 = v83;
              _os_log_impl(&dword_18404B000, v66, OS_LOG_TYPE_DEFAULT, "Keep going %@", buf, 0xCu);
            }

            uint64_t v67 = v84[4];
            unint64_t v68 = MISProfileGetValue(v85, (uint64_t)@"UUID");
            TeamIdentifier = MISProvisioningProfileGetTeamIdentifier(v85);
            BOOL v70 = sub_18406371C(v85, (uint64_t)@"ProvisionsAllDevices") != 0;
            BOOL v71 = sub_18406371C(v85, (uint64_t)@"LocalProvision") != 0;
            BOOL v72 = MISProfileIsDEREncoded(v85) != 0;
            BOOL v76 = MISProvisioningProfileIsForBetaDeployment(v85, v73, v74, v75) != 0;
            uint64_t v3 = (*(uint64_t (**)(uint64_t, void *, const void *, BOOL, BOOL, BOOL, BOOL))(v67 + 16))( v67,  v68,  TeamIdentifier,  v70,  v71,  v72,  v76);
            goto LABEL_17;
          }

          sub_184068378();
          __int128 v81 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v93 = v83;
            _os_log_impl( &dword_18404B000,  v81,  OS_LOG_TYPE_DEFAULT,  "Local Profile '%@' has non-matching application-identifier.",  buf,  0xCu);
          }
        }

        *(_BYTE *)(*(void *)(v84[9] + 8LL) + 24LL) = 0;
        goto LABEL_16;
      }

      sub_184068378();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v93 = (uint64_t)Value;
        _os_log_error_impl( &dword_18404B000,  v10,  OS_LOG_TYPE_ERROR,  "Skipping profile '%@' because it has no entitlement match list?",  buf,  0xCu);
      }
    }

    else
    {
      sub_184068378();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(const __CFString **)a2;
        *(_DWORD *)buf = 138412290;
        uint64_t v93 = (uint64_t)v11;
        CFIndex v12 = "Skipping a profile %@";
        uint64_t v13 = v10;
        uint32_t v14 = 12;
LABEL_14:
        _os_log_impl(&dword_18404B000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }

BOOL sub_18406CB48(MISProfile *a1, const __CFData *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  __int16 v28 = a1;
  if (a1)
  {
    io_object_t v5 = a1;
    CFRetain(a1);
  }

  else
  {
    io_object_t v5 = v28;
  }

  int v9 = objc_msgSend_unsignedIntValue(a3, v6, v7, v8);
  uint64_t v10 = @"OSX";
  switch(v9)
  {
    case 1:
      break;
    case 2:
      uint64_t v10 = @"iOS";
      break;
    case 3:
      uint64_t v10 = @"tvOS";
      break;
    case 4:
      uint64_t v10 = @"watchOS";
      break;
    case 10:
      sub_18406848C();
      CFIndex v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = @"tvOS";
      if (!v12) {
        uint64_t v13 = 0LL;
      }
      uint64_t v10 = v13;

      break;
    case 11:
      uint64_t v10 = @"xrOS";
      break;
    default:
      sub_184068378();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v9;
        _os_log_error_impl(&dword_18404B000, v11, OS_LOG_TYPE_ERROR, "Invalid platform: %du", buf, 8u);
      }

      uint64_t v10 = @"invalid";
      break;
  }

  sub_18406848C();
  uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v15 = sub_1840683F8((uint64_t)v14, v5, v10);

  sub_18406F7D8();
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = @"Internal";
  int isEqualToString = objc_msgSend_isEqualToString_(v16, v18, (uint64_t)@"Internal", v19);

  if (!v15 && isEqualToString)
  {
    sub_184068378();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v10;
      _os_log_error_impl( &dword_18404B000,  v21,  OS_LOG_TYPE_ERROR,  "TestFlight platform policy failed, the profile did not include the expected platform %@, this would have been a critical failure on a customer build",  buf,  0xCu);
    }

    goto LABEL_22;
  }

  if (!v15)
  {
    sub_184068378();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v10;
      _os_log_error_impl( &dword_18404B000,  v26,  OS_LOG_TYPE_ERROR,  "TestFlight platform policy failed, the profile did not include the expected platform %@",  buf,  0xCu);
    }

    return 0LL;
  }

LABEL_22:
  int v22 = sub_184064840(a2);
  if (!v22)
  {
    BOOL v25 = 1LL;
    if (!v5) {
      return v25;
    }
    goto LABEL_33;
  }

  uint64_t v23 = v22;
  Value = (const __CFArray *)MISProfileGetValue(v5, (uint64_t)@"ProvisioningCDHashes");
  if (Value) {
    BOOL v25 = MISArrayAllowsEntitlementValue(Value, v23) != 0;
  }
  else {
    BOOL v25 = 1LL;
  }
  CFRelease(v23);
  if (v5) {
LABEL_33:
  }
    CFRelease(v5);
  return v25;
}

uint64_t sub_18406CE44(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  LODWORD(v4) = a4;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (CEContextIsSubset() == *MEMORY[0x1896135D8]) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = v4;
  }
  if ((v4 & 1) == 0)
  {
    sub_184068378();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      uint64_t v9 = a3;
      _os_log_error_impl( &dword_18404B000,  v6,  OS_LOG_TYPE_ERROR,  "Profile %@ failed to validate entitlements",  (uint8_t *)&v8,  0xCu);
    }
  }

  return v4;
}

BOOL sub_18406CF20(uint64_t a1, uint64_t a2, CFTypeRef cf, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  CFTypeID v8 = CFGetTypeID(cf);
  if (v8 == CFDictionaryGetTypeID())
  {
    objc_msgSend_stringWithFormat_(NSString, v9, (uint64_t)@"%@.%@", v10, a2, a1);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = MISEntitlementDictionaryAllowsEntitlementValue( (const __CFDictionary *)cf,  @"application-identifier",  v11) != 0;
  }

  else
  {
    sub_184068378();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = a4;
      __int16 v17 = 2112;
      CFTypeRef v18 = cf;
      _os_log_error_impl( &dword_18404B000,  v13,  OS_LOG_TYPE_ERROR,  "Local Profile '%@' entitlement match list is not a dictionary, but '%@'.",  buf,  0x16u);
    }

    return 0LL;
  }

  return v12;
}

uint64_t sub_18406D050(uint64_t a1, const void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(const void **)(a1 + 32);
  uint64_t v4 = *(const __CFDate **)(a1 + 40);
  SecTrustRef trust = 0LL;
  OSStatus v5 = SecTrustCreateWithCertificates(v3, a2, &trust);
  if (v5)
  {
    OSStatus v6 = v5;
    sub_184068378();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:
      uint64_t v9 = 3892346904LL;

      goto LABEL_6;
    }

    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v6;
    CFTypeID v8 = "SecTrustCreateWithCertificates failed: %d";
LABEL_4:
    _os_log_impl(&dword_18404B000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, v8, buf, 8u);
    goto LABEL_5;
  }

  if (v4)
  {
    OSStatus v11 = SecTrustSetVerifyDate(trust, v4);
    if (v11)
    {
      OSStatus v12 = v11;
      sub_184068378();
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_5;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v12;
      CFTypeID v8 = "SecTrustSetVerifyDate failed: %d";
      goto LABEL_4;
    }
  }

  CFTypeRef cf = 0LL;
  if (SecTrustEvaluateWithError(trust, (CFErrorRef *)&cf))
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    sub_184068378();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v17 = cf;
      _os_log_impl(&dword_18404B000, v13, OS_LOG_TYPE_INFO, "SecTrustEvaluateWithError failed: %@", buf, 0xCu);
    }

    uint64_t v9 = 3892346904LL;

    CFRelease(cf);
  }

uint64_t sub_18406D20C()
{
  id v0 = objc_alloc_init(MEMORY[0x189603F30]);
  uint64_t v1 = (void *)qword_18C671E40;
  qword_18C671E40 = (uint64_t)v0;

  return MEMORY[0x189616718](qword_18C671E40, sel_setCountLimit_, 100LL, v2);
}

CFComparisonResult sub_18406D248(const __CFURL *a1, const __CFURL *a2)
{
  uint64_t v3 = CFURLGetString(a1);
  uint64_t v4 = CFURLGetString(a2);
  return CFStringCompare(v3, v4, 0LL);
}

uint64_t MISValidateSignatureAndCopyInfo(const __CFString *a1, const __CFDictionary *a2, void *a3)
{
  return MISValidateSignatureAndCopyInfoWithProgress(a1, a2, a3, 0LL);
}

uint64_t MISValidateSignature(const __CFString *a1, const __CFDictionary *a2)
{
  return MISValidateSignatureAndCopyInfoWithProgress(a1, a2, 0LL, 0LL);
}

uint64_t MISAppApprovalState(const __CFString *a1, const __CFDictionary *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  Boolean v14 = 1;
  Boolean v13 = 0;
  if (sub_184069BBC(a2, @"HonorBlocklist", &v14))
  {
    sub_184068378();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18404B000,  v4,  OS_LOG_TYPE_ERROR,  "MISAppAprovalState failed to check kMISValidationOptionHonorBlocklist option.",  buf,  2u);
    }

    Boolean v14 = 1;
  }

  unsigned int v12 = sub_184069BBC(a2, @"ReportIndeterminateSoon", &v13);
  if (v12)
  {
    sub_184068378();
    OSStatus v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18404B000,  v5,  OS_LOG_TYPE_ERROR,  "MISAppAprovalState failed to check kMISAppApprovalStateReportIndeterminateSoon option.",  buf,  2u);
    }

    Boolean v13 = 0;
  }

  OSStatus v6 = (const __SecCode *)sub_18406995C(a1, (uint64_t)a2, (int *)&v12);
  if (v6)
  {
    uint64_t v7 = v6;
    sub_184067B34(v6);
    CFTypeID v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v8;
    if (v8)
    {
      if (sub_184067B8C(v8)) {
        sub_18406B918();
      }
      sub_184068378();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = v12;
        _os_log_impl(&dword_18404B000, v10, OS_LOG_TYPE_DEFAULT, "Could not extract cdhash: 0x%x", buf, 8u);
      }
    }

    CFRelease(v7);
  }

  else
  {
    sub_184068378();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v12;
      _os_log_impl(&dword_18404B000, v9, OS_LOG_TYPE_DEFAULT, "Could not copy signature: 0x%x", buf, 8u);
    }
  }

  return 1LL;
}

void MISExistsIndeterminateAppsByUPP()
{
}

void MISValidateUPP(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  OSStatus v6 = a3;
  if (!sub_184060BE8(a1, v7, v8, v9)) {
    sub_18406F87C();
  }
  v6[2](v6, 3LL, 0LL);
}

void sub_18406DAB0()
{
  v1[0] = 0LL;
  v1[1] = v1;
  v1[2] = 0x2020000000LL;
  v1[3] = 0LL;
  v0[0] = 0LL;
  v0[1] = v0;
  v0[2] = 0x2020000000LL;
  v0[3] = 0LL;
  sub_18406F87C();
}

void sub_18406DAFC(const __CFArray *a1)
{
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  void v7[2] = sub_18406DBB8;
  v7[3] = &unk_189DAB9B0;
  uint64_t v6 = *(void *)(v1 + 40);
  uint64_t v9 = v3;
  uint64_t v10 = v6;
  uint64_t v8 = v2;
  sub_18406FB18(a1, (uint64_t)v7);
  if (a1) {
    CFRelease(a1);
  }
  (*(void (**)(void))(*(void *)(v1 + 32) + 16LL))();
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose((const void *)(v4 - 64), 8);
}

void sub_18406DB94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_18406DBB8(uint64_t a1, const __CFString *a2, CFStringRef theString2, const __CFString *a4)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  if (CFStringCompare(*(CFStringRef *)(a1 + 48), theString2, 1uLL)) {
    return 1LL;
  }
  CFIndex Length = CFStringGetLength(a2);
  uint64_t v8 = Length;
  if ((Length & 1) != 0)
  {
LABEL_46:
    sub_184068378();
    id v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
    {
LABEL_47:

      return 1LL;
    }

    *(_DWORD *)buf = 136315138;
    CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
    uint64_t v45 = "MISValidateUPP: could not process cdhash '%s'";
LABEL_54:
    _os_log_error_impl(&dword_18404B000, (os_log_t)v41, OS_LOG_TYPE_ERROR, v45, buf, 0xCu);
    goto LABEL_47;
  }

  if (Length >= 0) {
    uint64_t v9 = Length;
  }
  else {
    uint64_t v9 = Length + 1;
  }
  uint64_t v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v11 = (char *)MEMORY[0x186E2B3B8](*MEMORY[0x189604DB0], v9 | 1, 0LL);
  if (!CFStringGetCString(a2, v11, v9 | 1, 0x600u)) {
    goto LABEL_37;
  }
  CFIndex v12 = v9 >> 1;
  uint64_t v13 = MEMORY[0x186E2B3B8](v10, v12, 0LL);
  Boolean v14 = (UInt8 *)v13;
  if (v8 >= 2)
  {
    BOOL v15 = (unsigned __int8 *)(v11 + 1);
    uint64_t v16 = (_BYTE *)v13;
    CFIndex v17 = v12;
    do
    {
      int v18 = *(v15 - 1);
      unsigned int v19 = v18 - 48;
      unsigned int v20 = v18 - 97;
      char v21 = v18 - 55;
      BOOL v22 = (v18 - 65) < 6;
      char v23 = v18 - 87;
      BOOL v24 = v20 > 5;
      int v25 = v20 <= 5 || v22;
      if (v24) {
        char v23 = v21;
      }
      if (v19 < 0xA)
      {
        int v25 = 1;
        char v23 = v19;
      }

      char v26 = 16 * v23;
      int v27 = *v15;
      unsigned int v28 = v27 - 48;
      unsigned int v29 = v27 - 97;
      char v30 = v27 - 55;
      BOOL v31 = (v27 - 65) < 6;
      char v32 = v27 - 87;
      BOOL v33 = v29 > 5;
      char v34 = v29 <= 5 || v31;
      if (v33) {
        char v35 = v30;
      }
      else {
        char v35 = v32;
      }
      if (v28 >= 0xA) {
        char v36 = v34;
      }
      else {
        char v36 = 1;
      }
      if (v28 >= 0xA) {
        LOBYTE(v2_Block_object_dispose((const void *)(v9 - 64), 8) = v35;
      }
      *uint64_t v16 = v28 | v26;
      if (!v25 || (v36 & 1) == 0) {
        goto LABEL_36;
      }
      ++v16;
      v15 += 2;
    }

    while (--v17);
  }

  uint64_t v37 = CFDataCreateWithBytesNoCopy(v10, v14, v12, v10);
  if (!v37 && v14)
  {
LABEL_36:
    CFAllocatorDeallocate(v10, v14);
LABEL_37:
    uint64_t v37 = 0LL;
  }

  if (v11) {
    CFAllocatorDeallocate(v10, v11);
  }
  if (!v37) {
    goto LABEL_46;
  }
  int64_t v38 = sub_18406E798(v37, *(const __CFString **)(a1 + 48), a4, 0LL, 0LL, 0LL, 0LL, 2LL, 0LL);
  CFRelease(v37);
  if ((v38 & 1) == 0)
  {
    if ((v38 & 2) != 0)
    {
      sub_184068378();
      uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = *(const char **)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        CStringPtr = v44;
        _os_log_impl(&dword_18404B000, v43, OS_LOG_TYPE_DEFAULT, "Provisioning profile '%@' is banned.", buf, 0xCu);
      }

      uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v40 = 2LL;
      goto LABEL_52;
    }

    if ((v38 & 8) == 0)
    {
      if ((v38 & 0x34) != 0)
      {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= v38 & 0x34;
        uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 8LL);
        uint64_t v40 = 1LL;
LABEL_52:
        *(void *)(v39 + 24) = v40;
        return 1LL;
      }

      sub_184068378();
      id v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      *(_DWORD *)buf = 134217984;
      CStringPtr = (const char *)v38;
      uint64_t v45 = "MISValidateUPP: weird answer 0x%llx encountered.";
      goto LABEL_54;
    }

    sub_184068378();
    uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v47 = *(const char **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      CStringPtr = v47;
      _os_log_impl(&dword_18404B000, v46, OS_LOG_TYPE_DEFAULT, "Profile '%@' has a rejected app.", buf, 0xCu);
    }
  }

  return 1LL;
}

void MISUPPTrusted(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_18406DFA4(int a1)
{
  if (!a1) {
    sub_18406F87C();
  }
  uint64_t v2 = (void *)objc_opt_new();
  id v12 = 0LL;
  objc_msgSend_profileEntryExistsWithUuidString_error_(v2, v3, v1, (uint64_t)&v12);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v12;
  if (v8)
  {
    sub_184068378();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412546;
      uint64_t v14 = v1;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_error_impl( &dword_18404B000,  v9,  OS_LOG_TYPE_ERROR,  "could not retrieve profile entry for UUID %@: %@",  (uint8_t *)&v13,  0x16u);
    }

    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v10 = objc_msgSend_BOOLValue(v4, v5, v6, v7);
  }

  return v10;
}

uint64_t MISCopyAuxiliarySignature(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)objc_opt_new();
  id v12 = 0LL;
  objc_msgSend_getAuxiliarySignatureWithTeamId_error_(v2, v3, a1, (uint64_t)&v12);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v12;
  if (v8)
  {
    sub_184068378();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = a1;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_error_impl( &dword_18404B000,  v9,  OS_LOG_TYPE_ERROR,  "encountered error when retrieving auxiliary signature for teamId %@: %@",  buf,  0x16u);
    }

    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v10 = objc_msgSend_signature(v4, v5, v6, v7);
  }

  return v10;
}

uint64_t MISProfileSupportsAuxiliarySignature(void *a1)
{
  Value = MISProfileGetValue(a1, (uint64_t)@"UUID");
  uint64_t result = sub_18406371C(a1, (uint64_t)@"ProvisionsAllDevices");
  if ((_DWORD)result) {
    return !sub_184060BE8(Value, v4, v5, v6);
  }
  return result;
}

void MISSetUPPTrust(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
}

void sub_18406E260(int a1)
{
  if (a1)
  {
    uint64_t v3 = v1;
    if (v2)
    {
      MISSetProfileTrust(v1, 0LL);
      return;
    }

    int v4 = 0;
    int v5 = 1;
  }

  else
  {
    uint64_t v3 = v1;
    int v4 = v2;
    int v5 = 0;
  }

  sub_18406EC8C(v3, v4, v5, 0LL, 0LL);
}

void MISSetProfileTrust(const __CFString *a1, const __CFData *a2)
{
  int v4 = MISCopyProvisioningProfile(a1, (MISProfile **)&cf);
  CFTypeRef v5 = cf;
  if (v4)
  {
    if (!cf) {
      return;
    }
    goto LABEL_3;
  }

  TeamIdentifier = (__CFString *)MISProvisioningProfileGetTeamIdentifier((void *)cf);
  sub_18406EC8C(a1, 1, 1, TeamIdentifier, a2);
  if (v5) {
LABEL_3:
  }
    CFRelease(v5);
}

void MISRemoveProfileTrust(const __CFString *a1)
{
}

void MISEnumerateTrustedUPPs(void *a1)
{
  id v1 = a1;
  sub_184068288((uint64_t)v1, v2, v3, v4);
}

uint64_t sub_18406E5E0(uint64_t a1)
{
  return 1LL;
}

uint64_t MISValidationCopySignatureVersion(const __CFString *a1, const void **a2)
{
  unsigned int v9 = 0;
  uint64_t v3 = (const __SecCode *)sub_18406995C(a1, 0LL, (int *)&v9);
  if (!v3) {
    return 3892346908LL;
  }
  uint64_t v4 = v3;
  sub_184067B34(v3);
  CFTypeRef v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5)
  {
    if (a2) {
      *a2 = sub_184067BC8(v5);
    }
  }

  else
  {
    unsigned int v9 = -402620407;
  }

  CFRelease(v4);
  uint64_t v7 = v9;

  return v7;
}

void MISDataMigrate(const __CFNumber *a1)
{
  uint64_t v1 = valuePtr;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_string(v2, "type", "rqup");
    xpc_dictionary_set_uint64(v3, "phas", v1);
    uint64_t v4 = sub_18406EA98(v3);
    CFTypeRef v5 = (void *)v4;
    if (v4 && MEMORY[0x186E2C2DC](v4) != MEMORY[0x1895F9268]) {
      xpc_dictionary_get_int64(v5, "resu");
    }
  }

  else
  {
    sub_184068378();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18404B000,  v6,  OS_LOG_TYPE_ERROR,  "Could not create XPC message for requestUpgrade",  buf,  2u);
    }

    CFTypeRef v5 = 0LL;
  }
}

int64_t sub_18406E798( const __CFData *a1, const __CFString *a2, const __CFString *a3, const __CFBoolean *a4, const __CFBoolean *a5, const __CFNumber *a6, void *a7, int64_t a8, const __CFString *a9)
{
  id v16 = sub_18406EA24(a2);
  if (!v16) {
    goto LABEL_7;
  }
  uint64_t v17 = v16;
  int v18 = (char *)sub_18406EA24(a3);
  if (!v18)
  {
    free(v17);
LABEL_7:
    BOOL v22 = 0LL;
    char v21 = 0LL;
    int64_t int64 = 4LL;
    goto LABEL_28;
  }

  unsigned int v19 = v18;
  if (a9)
  {
    unsigned int v20 = (char *)sub_18406EA24(a9);
    if (!v20)
    {
      char v21 = 0LL;
LABEL_24:
      BOOL v22 = 0LL;
      goto LABEL_25;
    }
  }

  else
  {
    unsigned int v20 = 0LL;
  }

  xpc_object_t v24 = xpc_dictionary_create(0LL, 0LL, 0LL);
  char v21 = v24;
  if (!v24) {
    goto LABEL_24;
  }
  uint64_t v37 = a7;
  xpc_dictionary_set_string(v24, "type", "auth");
  int v25 = v20;
  BytePtr = CFDataGetBytePtr(a1);
  size_t Length = CFDataGetLength(a1);
  unsigned int v28 = BytePtr;
  unsigned int v20 = (char *)v25;
  xpc_dictionary_set_data(v21, "cdha", v28, Length);
  xpc_dictionary_set_string(v21, "uuid", (const char *)v17);
  xpc_dictionary_set_string(v21, "team", v19);
  xpc_dictionary_set_int64(v21, "ckty", a8);
  if (v25) {
    xpc_dictionary_set_string(v21, "apppath", v25);
  }
  if (a4)
  {
    BOOL v32 = CFBooleanGetValue(a4) != 0;
    xpc_dictionary_set_BOOL(v21, "univ", v32);
  }

  if (a5)
  {
    BOOL v33 = CFBooleanGetValue(a5) != 0;
    xpc_dictionary_set_BOOL(v21, "locl", v33);
  }

  if (a6)
  {
    uint64_t valuePtr = 0LL;
    if (CFNumberGetValue(a6, kCFNumberLongLongType, &valuePtr)) {
      xpc_dictionary_set_uint64(v21, "cdvr", valuePtr);
    }
  }

  if (v37)
  {
    objc_msgSend_timeIntervalSince1970(v37, v29, v30, v31);
    xpc_dictionary_set_int64(v21, "sgnt", (uint64_t)(v34 * 1000.0));
  }

  uint64_t v35 = sub_18406EA98(v21);
  BOOL v22 = (void *)v35;
  if (v35 && MEMORY[0x186E2C2DC](v35) != MEMORY[0x1895F9268])
  {
    int64_t int64 = xpc_dictionary_get_int64(v22, "resu");
    goto LABEL_26;
  }

void *sub_18406EA24(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v3 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  uint64_t v4 = malloc(v3);
  if (v4 && !CFStringGetCString(a1, (char *)v4, v3, 0x8000100u))
  {
    free(v4);
    return 0LL;
  }

  return v4;
}

id sub_18406EA98(void *a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  dispatch_get_global_queue(0LL, 0LL);
  xpc_object_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  mach_service = xpc_connection_create_mach_service("com.apple.online-auth-agent.xpc", v2, 0LL);

  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &unk_189DABB68);
    xpc_connection_resume(mach_service);
    xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(mach_service, v1);
  }

  else
  {
    sub_184068378();
    CFTypeRef v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "com.apple.online-auth-agent.xpc";
      _os_log_error_impl( &dword_18404B000,  v5,  OS_LOG_TYPE_ERROR,  "error, could not lookup %s service",  (uint8_t *)&v7,  0xCu);
    }

    xpc_object_t v4 = 0LL;
  }

  return v4;
}

void sub_18406EBBC(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x186E2C2DC](a2) != MEMORY[0x1895F9268])
  {
    sub_184068378();
    CFIndex v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      __int16 v7 = 0;
      xpc_object_t v4 = "unexpected event in handler for referenced item service\n";
      CFTypeRef v5 = (uint8_t *)&v7;
LABEL_10:
      _os_log_error_impl(&dword_18404B000, v3, OS_LOG_TYPE_ERROR, v4, v5, 2u);
      goto LABEL_11;
    }

    goto LABEL_11;
  }

  if (a2 != MEMORY[0x1895F9198] && a2 != MEMORY[0x1895F91A0])
  {
    sub_184068378();
    CFIndex v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      xpc_object_t v4 = "unexpected error with online-auth-agent connection\n";
      CFTypeRef v5 = buf;
      goto LABEL_10;
    }

void sub_18406EC8C(const __CFString *a1, int a2, int a3, __CFString *a4, const __CFData *a5)
{
  uint64_t v9 = sub_18406EA24(a1);
  if (!v9)
  {
    sub_184068378();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18404B000,  v17,  OS_LOG_TYPE_ERROR,  "Could not convert UPP UUID for setUppTrust",  buf,  2u);
    }

    goto LABEL_18;
  }

  uint64_t v10 = v9;
  xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v11)
  {
    sub_184068378();
    int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned int v19 = 0;
      _os_log_error_impl( &dword_18404B000,  v18,  OS_LOG_TYPE_ERROR,  "Could not create XPC message for setUppTrust",  v19,  2u);
    }

    free(v10);
LABEL_18:
    id v16 = 0LL;
    id v12 = 0LL;
    goto LABEL_19;
  }

  id v12 = v11;
  xpc_dictionary_set_string(v11, "type", "trst");
  xpc_dictionary_set_string(v12, "uuid", (const char *)v10);
  xpc_dictionary_set_BOOL(v12, "trst", a2 != 0);
  xpc_dictionary_set_BOOL(v12, "usdb", a3 != 0);
  if (a4)
  {
    a4 = (__CFString *)sub_18406EA24(a4);
    xpc_dictionary_set_string(v12, "team", (const char *)a4);
  }

  if (a5)
  {
    BytePtr = CFDataGetBytePtr(a5);
    size_t Length = CFDataGetLength(a5);
    xpc_dictionary_set_data(v12, "xsig", BytePtr, Length);
  }

  uint64_t v15 = sub_18406EA98(v12);
  id v16 = (void *)v15;
  if (v15 && MEMORY[0x186E2C2DC](v15) != MEMORY[0x1895F9268]) {
    xpc_dictionary_get_int64(v16, "resu");
  }
  free(v10);
  if (a4) {
    free(a4);
  }
LABEL_19:
}

int64_t sub_18406EEA4(uint64_t a1, int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  CFTypeRef v5 = v4;
  if (!v4)
  {
    sub_184068378();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)xpc_object_t v11 = 0;
      _os_log_error_impl( &dword_18404B000,  v9,  OS_LOG_TYPE_ERROR,  "Could not create XPC message for setBlacklistOverride",  v11,  2u);
    }

    __int16 v7 = 0LL;
    goto LABEL_8;
  }

  xpc_dictionary_set_string(v4, "type", "lwov");
  xpc_dictionary_set_uint64(v5, "lwid", a1);
  xpc_dictionary_set_BOOL(v5, "ovrr", a2 != 0);
  uint64_t v6 = sub_18406EA98(v5);
  __int16 v7 = (void *)v6;
  if (!v6 || MEMORY[0x186E2C2DC](v6) == MEMORY[0x1895F9268])
  {
LABEL_8:
    int64_t int64 = 4LL;
    goto LABEL_9;
  }

  int64_t int64 = xpc_dictionary_get_int64(v7, "resu");
LABEL_9:

  return int64;
}

int64_t sub_18406EFD0(unsigned int a1, const __CFData *a2, CFDataRef *a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  __int16 v7 = v6;
  if (!v6)
  {
    sub_184068378();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18404B000,  v14,  OS_LOG_TYPE_ERROR,  "Could not create XPC message for checkLaunchWarning",  buf,  2u);
    }

    xpc_object_t v11 = 0LL;
    goto LABEL_9;
  }

  xpc_dictionary_set_string(v6, "type", "chlw");
  xpc_dictionary_set_int64(v7, "cdht", a1);
  BytePtr = CFDataGetBytePtr(a2);
  size_t v9 = CFDataGetLength(a2);
  xpc_dictionary_set_data(v7, "cdhd", BytePtr, v9);
  uint64_t v10 = sub_18406EA98(v7);
  xpc_object_t v11 = (void *)v10;
  if (!v10 || MEMORY[0x186E2C2DC](v10) == MEMORY[0x1895F9268])
  {
LABEL_9:
    int64_t int64 = 4LL;
    goto LABEL_10;
  }

  int64_t int64 = xpc_dictionary_get_int64(v11, "resu");
  if (a3)
  {
    size_t length = 0LL;
    data = (const UInt8 *)xpc_dictionary_get_data(v11, "warndata", &length);
    *a3 = CFDataCreate(0LL, data, length);
  }

CFStringRef MISCopyErrorStringForErrorCodeUnlocalized(uint64_t a1)
{
  switch(a1)
  {
    case 0xE8008001:
      CFStringRef result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], @"An unknown error has occurred.");
      break;
    case 0xE8008002:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"Attempted to modify an immutable provisioning profile.");
      break;
    case 0xE8008003:
    case 0xE8008005:
    case 0xE8008006:
    case 0xE8008007:
    case 0xE8008008:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"This provisioning profile is malformed.");
      break;
    case 0xE8008004:
    case 0xE800800E:
    case 0xE8008013:
    case 0xE800801A:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"This provisioning profile does not have a valid signature (or it has a valid, but untrusted signature).");
      break;
    case 0xE8008009:
      CFStringRef result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], @"The signature was not valid.");
      break;
    case 0xE800800A:
      CFStringRef result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], @"Unable to allocate memory.");
      break;
    case 0xE800800B:
      CFStringRef result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], @"A file operation failed.");
      break;
    case 0xE800800C:
    case 0xE800800D:
    case 0xE800801B:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"There was an error communicating with your device.");
      break;
    case 0xE800800F:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"The application's signature is valid but it does not match the expected hash.");
      break;
    case 0xE8008010:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"This provisioning profile is unsupported.");
      break;
    case 0xE8008011:
      CFStringRef result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], @"This provisioning profile has expired.");
      break;
    case 0xE8008012:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"This provisioning profile cannot be installed on this device.");
      break;
    case 0xE8008014:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"The executable contains an invalid signature.");
      break;
    case 0xE8008015:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"A valid provisioning profile for this executable was not found.");
      break;
    case 0xE8008016:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"The executable was signed with invalid entitlements.");
      break;
    case 0xE8008017:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"A signed resource has been added, modified, or deleted.");
      break;
    case 0xE8008018:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"The identity used to sign the executable is no longer valid.");
      break;
    case 0xE8008019:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"The application does not have a valid signature.");
      break;
    case 0xE800801C:
      CFStringRef result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], @"No code signature found.");
      break;
    case 0xE800801D:
      CFStringRef result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], @"Rejected by policy.");
      break;
    case 0xE800801E:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"The requested profile does not exist (it may have been removed).");
      break;
    case 0xE800801F:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"Attempted to install a Beta profile without the proper entitlement.");
      break;
    case 0xE8008020:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"Attempted to install a Beta profile over lockdown connection.");
      break;
    case 0xE8008021:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"The maximum number of apps for free development profiles has been reached.");
      break;
    case 0xE8008022:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"An error occured while accessing the profile database.");
      break;
    case 0xE8008023:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"An error occured while communicating with the agent.");
      break;
    case 0xE8008024:
      CFStringRef result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], @"The provisioning profile is banned.");
      break;
    case 0xE8008025:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"The user did not explicitly trust the provisioning profile.");
      break;
    case 0xE8008026:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"The provisioning profile requires online authorization.");
      break;
    case 0xE8008027:
      CFStringRef result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], @"The cdhash is not in the trust cache.");
      break;
    case 0xE8008028:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"Invalid arguments or option combination.");
      break;
    case 0xE8008029:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"The code signature version is no longer supported.");
      break;
    case 0xE800802A:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"The application's signature is valid, but a provisioning profile can not be found that matches this version.");
      break;
    case 0xE800802B:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"Running this application requires Developer Mode to be enabled.");
      break;
    case 0xE800802C:
      CFStringRef result = CFStringCreateCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"The provisioning profile's App Audience is not suitable for this device.");
      break;
    default:
      CFStringRef result = CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"An unexpected error was encountered (0x%X)",  a1);
      break;
  }

  return result;
}

CFStringRef MISCopyErrorStringForErrorCode(uint64_t a1)
{
  id v1 = MISCopyErrorStringForErrorCodeUnlocalized(a1);
  MainBundle = CFBundleGetMainBundle();
  CFStringRef v3 = CFBundleCopyLocalizedString(MainBundle, v1, v1, 0LL);
  CFRelease(v1);
  return v3;
}

id sub_18406F540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  xpc_object_t v4 = (void *)qword_18C671E50;
  if (qword_18C671E50) {
    return v4;
  }
  uint64_t v6 = objc_msgSend_dataWithLength_(MEMORY[0x189603FB8], 0, 97, a4);
  __int16 v7 = (void *)qword_18C671E50;
  qword_18C671E50 = v6;

  xpc_object_t v11 = (_BYTE *)objc_msgSend_mutableBytes((void *)qword_18C671E50, v8, v9, v10);
  int local_signing_public_key = amfi_interface_get_local_signing_public_key(v11);
  xpc_object_t v4 = (void *)qword_18C671E50;
  if (!local_signing_public_key) {
    return v4;
  }
  qword_18C671E50 = 0LL;

  return 0LL;
}

uint64_t sub_18406F5B0(const char *a1, int a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1) {
    __assert_rtn("setDatabasePermissionsInternal", "db_utils.m", 121, "path != NULL");
  }
  int v4 = open(a1, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (v4 == -1)
  {
    sub_184068378();
    __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = *__error();
      *(_DWORD *)buf = 67109378;
      int v16 = v13;
      __int16 v17 = 2080;
      int v18 = a1;
      _os_log_error_impl( &dword_18404B000,  v7,  OS_LOG_TYPE_ERROR,  "unable to open file to update permissions: %d, %s",  buf,  0x12u);
    }

    return 0LL;
  }

  int v5 = v4;
  if (fstat(v4, &v14) < 0)
  {
    sub_184068378();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    int v9 = *__error();
    *(_DWORD *)buf = 67109378;
    int v16 = v9;
    __int16 v17 = 2080;
    int v18 = a1;
    uint64_t v10 = "unable to check filesystem permissions on db: %d, %s";
  }

  else
  {
    if ((v14.st_mode & 0x1FF) == a2 || (fchmod(v5, a2) & 0x80000000) == 0)
    {
      uint64_t v6 = 1LL;
      if (v5 < 0) {
        return v6;
      }
      goto LABEL_17;
    }

    sub_184068378();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    int v11 = *__error();
    *(_DWORD *)buf = 67109378;
    int v16 = v11;
    __int16 v17 = 2080;
    int v18 = a1;
    uint64_t v10 = "unable to set filesystem permissions on db: %d, %s";
  }

  _os_log_error_impl(&dword_18404B000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
LABEL_16:

  uint64_t v6 = 0LL;
  if ((v5 & 0x80000000) == 0) {
LABEL_17:
  }
    close(v5);
  return v6;
}

uint64_t sub_18406F7D0(const char *a1)
{
  return sub_18406F5B0(a1, 420);
}

id sub_18406F7D8()
{
  return (id)MGCopyAnswer();
}

void sub_18406F87C()
{
}

CFArrayRef sub_18406F8A4(const __CFURL *a1)
{
  if (a1)
  {
    xpc_object_t v2 = CFReadStreamCreateWithFile(0LL, a1);
    CFStringRef v3 = v2;
    CFErrorRef v12 = 0LL;
    if (v2)
    {
      if (CFReadStreamOpen(v2))
      {
        int v4 = (const __CFArray *)CFPropertyListCreateWithStream(0LL, v3, 0LL, 0LL, 0LL, &v12);
        if (v4)
        {
          CFArrayRef v5 = v4;
          CFTypeID v6 = CFGetTypeID(v4);
          if (v6 == CFArrayGetTypeID()) {
            goto LABEL_17;
          }
          __int16 v7 = (os_log_s *)sub_184068378();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v13) = 0;
            _os_log_impl( &dword_18404B000,  v7,  OS_LOG_TYPE_DEFAULT,  "CreateMISAuthListWithStream: plist root has wrong type",  (uint8_t *)&v13,  2u);
          }

          CFRelease(v5);
        }

        else
        {
          uint64_t v10 = (os_log_s *)sub_184068378();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 138412290;
            CFErrorRef v14 = v12;
            _os_log_impl( &dword_18404B000,  v10,  OS_LOG_TYPE_DEFAULT,  "CreateMISAuthListWithStream: authList parse failed (malformed?), error %@",  (uint8_t *)&v13,  0xCu);
          }
        }

BOOL sub_18406FA9C(BOOL result, const __CFString *a2)
{
  if (result)
  {
    CFStringRef v3 = (const __CFArray *)result;
    CFIndex Count = CFArrayGetCount((CFArrayRef)result);
    CFIndex v5 = Count - 1;
    if (Count < 1)
    {
      return 0LL;
    }

    else
    {
      CFIndex v6 = 0LL;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, v6);
        CFComparisonResult v8 = CFStringCompare(ValueAtIndex, a2, 1uLL);
        CFStringRef result = v8 == kCFCompareEqualTo;
        if (v8 == kCFCompareEqualTo) {
          break;
        }
      }

      while (v5 != v6++);
    }
  }

  return result;
}

void sub_18406FB18(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    CFIndex v4 = Count;
    for (CFIndex i = 0LL; i != v4; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      CFTypeID v7 = CFGetTypeID(ValueAtIndex);
      if (v7 == CFDictionaryGetTypeID())
      {
        CFComparisonResult v8 = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, i);
        Value = CFDictionaryGetValue(v8, @"cdhash");
        uint64_t v10 = CFDictionaryGetValue(v8, @"upp-uuid");
        int v11 = CFDictionaryGetValue(v8, @"teamid");
        CFErrorRef v12 = CFDictionaryGetValue(v8, @"type");
        int v13 = (const __CFNumber *)CFDictionaryGetValue(v8, @"grace");
        if (Value
          && (CFNumberRef v14 = v13, v15 = CFGetTypeID(Value), v15 == CFStringGetTypeID())
          && v10
          && (CFTypeID v16 = CFGetTypeID(v10), v16 == CFStringGetTypeID())
          && v11
          && (CFTypeID v17 = CFGetTypeID(v11), v17 == CFStringGetTypeID())
          && v12
          && (CFTypeID v18 = CFGetTypeID(v12), v18 == CFNumberGetTypeID()))
        {
          if (!v14 || (CFTypeID v19 = CFGetTypeID(v14), v19 != CFNumberGetTypeID()))
          {
            int valuePtr = 0;
            CFNumberRef v14 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
          }

          if (!(*(unsigned int (**)(uint64_t, const void *, const void *, const void *, const void *, CFNumberRef))(a2 + 16))( a2,  Value,  v10,  v11,  v12,  v14)) {
            return;
          }
        }

        else
        {
          xpc_object_t v24 = (os_log_s *)sub_184068378();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            char v21 = buf;
            BOOL v22 = v24;
            char v23 = "indeterminateListIterate: malformed row";
            goto LABEL_21;
          }
        }
      }

      else
      {
        unsigned int v20 = (os_log_s *)sub_184068378();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v28 = 0;
          char v21 = (uint8_t *)&v28;
          BOOL v22 = v20;
          char v23 = "indeterminateListIterate: row with unknown type";
LABEL_21:
          _os_log_impl(&dword_18404B000, v22, OS_LOG_TYPE_DEFAULT, v23, v21, 2u);
        }
      }
    }
  }

uint64_t sub_18406FD54()
{
  return MEMORY[0x189605FA0]();
}

uint64_t sub_18406FD60()
{
  return MEMORY[0x189605FC8]();
}

uint64_t sub_18406FD6C()
{
  return MEMORY[0x1896061F0]();
}

uint64_t sub_18406FD78()
{
  return MEMORY[0x189606200]();
}

uint64_t sub_18406FD84()
{
  return MEMORY[0x189606208]();
}

uint64_t sub_18406FD90()
{
  return MEMORY[0x189606218]();
}

uint64_t sub_18406FD9C()
{
  return MEMORY[0x189606230]();
}

uint64_t sub_18406FDA8()
{
  return MEMORY[0x189606240]();
}

uint64_t sub_18406FDB4()
{
  return MEMORY[0x189606260]();
}

uint64_t sub_18406FDC0()
{
  return MEMORY[0x189606910]();
}

uint64_t sub_18406FDCC()
{
  return MEMORY[0x189606928]();
}

uint64_t sub_18406FDD8()
{
  return MEMORY[0x1896069D8]();
}

uint64_t sub_18406FDE4()
{
  return MEMORY[0x1896069E8]();
}

uint64_t sub_18406FDF0()
{
  return MEMORY[0x189606A30]();
}

uint64_t sub_18406FDFC()
{
  return MEMORY[0x189606A48]();
}

uint64_t sub_18406FE08()
{
  return MEMORY[0x189606A60]();
}

uint64_t sub_18406FE14()
{
  return MEMORY[0x189606A68]();
}

uint64_t sub_18406FE20()
{
  return MEMORY[0x189606A90]();
}

uint64_t sub_18406FE2C()
{
  return MEMORY[0x189606AF8]();
}

uint64_t sub_18406FE38()
{
  return MEMORY[0x189606BA8]();
}

uint64_t sub_18406FE44()
{
  return MEMORY[0x189606C18]();
}

uint64_t sub_18406FE50()
{
  return MEMORY[0x189606C58]();
}

uint64_t sub_18406FE5C()
{
  return MEMORY[0x189606C90]();
}

uint64_t sub_18406FE68()
{
  return MEMORY[0x189606CF8]();
}

uint64_t sub_18406FE74()
{
  return MEMORY[0x189606DC0]();
}

uint64_t sub_18406FE80()
{
  return MEMORY[0x189606E20]();
}

uint64_t sub_18406FE8C()
{
  return MEMORY[0x189606E30]();
}

uint64_t sub_18406FE98()
{
  return MEMORY[0x189606E60]();
}

uint64_t sub_18406FEA4()
{
  return MEMORY[0x189606EB8]();
}

uint64_t sub_18406FEB0()
{
  return MEMORY[0x189606EC8]();
}

uint64_t sub_18406FEBC()
{
  return MEMORY[0x189606F20]();
}

uint64_t sub_18406FEC8()
{
  return MEMORY[0x18961D150]();
}

uint64_t sub_18406FED4()
{
  return MEMORY[0x18961D0F0]();
}

uint64_t sub_18406FEE0()
{
  return MEMORY[0x18961D120]();
}

uint64_t sub_18406FEEC()
{
  return MEMORY[0x189607078]();
}

uint64_t sub_18406FEF8()
{
  return MEMORY[0x1896070D8]();
}

uint64_t sub_18406FF04()
{
  return MEMORY[0x1896070E8]();
}

uint64_t sub_18406FF10()
{
  return MEMORY[0x1896070F8]();
}

uint64_t sub_18406FF1C()
{
  return MEMORY[0x189607100]();
}

uint64_t sub_18406FF28()
{
  return MEMORY[0x189617C98]();
}

uint64_t sub_18406FF34()
{
  return MEMORY[0x189617CB0]();
}

uint64_t sub_18406FF40()
{
  return MEMORY[0x189617DD8]();
}

uint64_t sub_18406FF4C()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_18406FF58()
{
  return MEMORY[0x189617E98]();
}

uint64_t sub_18406FF64()
{
  return MEMORY[0x1896071D0]();
}

uint64_t sub_18406FF70()
{
  return MEMORY[0x18961D210]();
}

uint64_t sub_18406FF7C()
{
  return MEMORY[0x18961D228]();
}

uint64_t sub_18406FF88()
{
  return MEMORY[0x18961D248]();
}

uint64_t sub_18406FF94()
{
  return MEMORY[0x18961D280]();
}

uint64_t sub_18406FFA0()
{
  return MEMORY[0x189618AC0]();
}

uint64_t sub_18406FFAC()
{
  return MEMORY[0x189618EE0]();
}

uint64_t sub_18406FFB8()
{
  return MEMORY[0x189619010]();
}

uint64_t sub_18406FFC4()
{
  return MEMORY[0x1896191C0]();
}

uint64_t sub_18406FFD0()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_18406FFDC()
{
  return MEMORY[0x189619440]();
}

uint64_t sub_18406FFE8()
{
  return MEMORY[0x189619960]();
}

uint64_t sub_18406FFF4()
{
  return MEMORY[0x189619A08]();
}

uint64_t sub_184070000()
{
  return MEMORY[0x189619CC8]();
}

uint64_t sub_18407000C()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_184070018()
{
  return MEMORY[0x18961A318]();
}

uint64_t sub_184070024()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_184070030()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t sub_18407003C()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t sub_184070048()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_184070054()
{
  return MEMORY[0x18961A670]();
}

uint64_t sub_184070060()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_18407006C()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_184070078()
{
  return MEMORY[0x18961A6C0]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

uint64_t CEContextIsSubset()
{
  return MEMORY[0x1896134E8]();
}

uint64_t CEContextQuery()
{
  return MEMORY[0x1896134F0]();
}

uint64_t CEManagedContextFromCFData()
{
  return MEMORY[0x189613500]();
}

uint64_t CEQueryContextToCFDictionary()
{
  return MEMORY[0x189613510]();
}

uint64_t CEReleaseManagedContext()
{
  return MEMORY[0x189613518]();
}

uint64_t CESerializeCFDictionary()
{
  return MEMORY[0x189613530]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602630](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x189602640](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x189602658](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x189602800](bundle);
}

CFStringRef CFBundleCopyLocalizedString( CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x189602828](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1896028F0]();
}

Boolean CFCalendarAddComponents( CFCalendarRef calendar, CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...)
{
  return MEMORY[0x189602938](calendar, at, options, componentDesc);
}

CFCalendarRef CFCalendarCopyCurrent(void)
{
  return (CFCalendarRef)MEMORY[0x189602948]();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x189602A60](allocator, theData);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x189602A78](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy( CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x189602A80](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x189602AE8](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x189602AF0](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return result;
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x189602B90](theDict, key);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x189602BB0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x189602C58](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x189602D18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x189602FD0](allocator, propertyList, format, options, error);
}

uint64_t CFPropertyListCreateWithDERData()
{
  return MEMORY[0x18960AF68]();
}

CFPropertyListRef CFPropertyListCreateWithData( CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189602FF0](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream( CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189603000](allocator, stream, streamLength, options, format, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x189603060](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x189603098](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x189603418](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1896034A8](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x189603510](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1896035A0](theString, prefix);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1896036B0](relativeURL);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1896036F0](anURL);
}

CFURLRef CFURLCreateWithFileSystemPath( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1896037C0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1896037C8](allocator, filePath, pathStyle, isDirectory, baseURL);
}

Boolean CFURLGetFileSystemRepresentation( CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603818](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x189603828](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x189603830]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x189603870](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x189613710]();
}

uint64_t SecCMSVerify()
{
  return MEMORY[0x18960B230]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x18960B260](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x18960B290](certificate);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x18960B2D0](certificate);
}

uint64_t SecCertificateIsSelfSigned()
{
  return MEMORY[0x18960B328]();
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return MEMORY[0x18960B358](code, *(void *)&flags, information);
}

uint64_t SecCodeSetDetachedSignature()
{
  return MEMORY[0x18960B360]();
}

uint64_t SecCodeSpecialSlotIsPresent()
{
  return MEMORY[0x18960B368]();
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B430](key, error);
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x18960B560]();
}

uint64_t SecPolicyCreateAppleTVOSApplicationSigning()
{
  return MEMORY[0x18960B568]();
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x18960B570]();
}

uint64_t SecPolicyCreateOSXProvisioningProfileSigning()
{
  return MEMORY[0x18960B578]();
}

uint64_t SecPolicyCreateiPhoneProfileApplicationSigning()
{
  return MEMORY[0x18960B5B0]();
}

uint64_t SecPolicyCreateiPhoneProvisioningProfileSigning()
{
  return MEMORY[0x18960B5B8]();
}

OSStatus SecStaticCodeCheckValidityWithErrors( SecStaticCodeRef staticCode, SecCSFlags flags, SecRequirementRef requirement, CFErrorRef *errors)
{
  return MEMORY[0x18960B618](staticCode, *(void *)&flags, requirement, errors);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x18960B620](path, *(void *)&flags, staticCode);
}

OSStatus SecStaticCodeCreateWithPathAndAttributes( CFURLRef path, SecCSFlags flags, CFDictionaryRef attributes, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x18960B628](path, *(void *)&flags, attributes, staticCode);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x18960B680](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x18960B6B8](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x18960B6E0](trust, error);
}

OSStatus SecTrustSetVerifyDate(SecTrustRef trust, CFDateRef verifyDate)
{
  return MEMORY[0x18960B748](trust, verifyDate);
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

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x189604168]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x1895F8978]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x18961B058]();
}

void abort(void)
{
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1895F9658](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x1895F98B8]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x1895F98E0]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1895F98E8]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x1895F98F0]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x1895F9918]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x1895F9950]();
}

uint64_t ccder_sizeof_len()
{
  return MEMORY[0x1895F99F0]();
}

uint64_t ccder_sizeof_tag()
{
  return MEMORY[0x1895F9A08]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1895F9A90]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1895F9A98]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1895F9AA0]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x1895F9AE0]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x1895F9AE8]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x1895F9AF0]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1895F9B10]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1895F9B18]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1895F9B20]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x1895F9B68]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1895F9BA8]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x1895F9BB0]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1895F9C40]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x1895F9C48]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1895F9C70]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x1895FA1C8]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x1895FA218]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1895FA268]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FA278]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1895FA280]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1895FA4B8]();
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

double difftime(time_t a1, time_t a2)
{
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FB1E0](*(void *)&a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB708](path, name, value, size, *(void *)&position, *(void *)&options);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1895FBF80](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
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

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x189616718])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x1895FC480]();
}

uint64_t posix_spawnattr_setmacpolicyinfo_np()
{
  return MEMORY[0x1895FC848]();
}

int setxattr( const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FCEE0](path, name, value, size, *(void *)&position, *(void *)&options);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1896170C0](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1896170E8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1896170F8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x189617108](a1, *(void *)&ms);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x189617120](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x189617130](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617138](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617140](pStmt);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617158](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x189617160](a1, *(void *)&N);
}

const char *__cdecl sqlite3_column_origin_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x189617168](a1, *(void *)&a2);
}

const char *__cdecl sqlite3_column_table_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x189617170](a1, *(void *)&a2);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x189617178](a1, *(void *)&iCol);
}

int sqlite3_db_readonly(sqlite3 *db, const char *zDbName)
{
  return MEMORY[0x1896171B0](db, zDbName);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1896171C0](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1896171C8](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617200](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x189617238](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x189617260](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x189617270](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x189617300](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x189617380](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1895FD118](a1, a2, a3);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x18961B258]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x18961B2D0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x18961B438]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1895FD408](a1);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1895FD7C8](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1895FD7E8]();
}

BOOL xpc_array_get_BOOL(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1895FD7F8](xarray, index);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

int64_t xpc_array_get_date(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1895FD818](xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1895FD840](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1895FD860](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

uint64_t objc_msgSend_executeQuery_withBind_withCancellableResults_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_executeQuery_withBind_withCancellableResults_, a3, a4);
}

uint64_t objc_msgSend_initWithWarningState_withUserOverridden_withKBURL_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithWarningState_withUserOverridden_withKBURL_, a3, a4);
}
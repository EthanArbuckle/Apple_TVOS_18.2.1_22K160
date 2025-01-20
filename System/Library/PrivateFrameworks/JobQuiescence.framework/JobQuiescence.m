uint64_t PostQuiesceActions.rawValue.getter()
{
  uint64_t v0;
  return *(void *)v0;
}

JobQuiescence::PostQuiesceActions __swiftcall PostQuiesceActions.init(rawValue:)( JobQuiescence::PostQuiesceActions rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void *sub_1891DB2EC()
{
  return &unk_1891F6458;
}

void static PostQuiesceActions.shutdown.getter(void *a1@<X8>)
{
  *a1 = 1LL;
}

void *sub_1891DB304@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1891DB310()
{
  return sub_1891F5AF0();
}

uint64_t sub_1891DB36C()
{
  return sub_1891F5AE4();
}

void sub_1891DB3B8(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_1891DB3C0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1891DB3D4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1891DB3E8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1891DB3FC(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1891DB42C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1891DB458@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1891DB47C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1891DB490(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1891DB4A4(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_1891DB4B8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1891DB4CC(void *a1)
{
  return (*v1 & ~*a1) == 0LL;
}

BOOL sub_1891DB4E0(void *a1)
{
  return (*v1 & *a1) == 0LL;
}

BOOL sub_1891DB4F4(void *a1)
{
  return (*a1 & ~*v1) == 0LL;
}

BOOL sub_1891DB508()
{
  return *v0 == 0LL;
}

uint64_t sub_1891DB518()
{
  return sub_1891F5BBC();
}

void *sub_1891DB530(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_1891DB544@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1891DB554(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_1891DB560(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1891DB578@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t JQRequestInitiateQuiescence.timeout.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t JQRequestInitiateQuiescence.requesterName.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

void JQRequestInitiateQuiescence.postQuiesceActions.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 40);
}

uint64_t JQRequestInitiateQuiescence.jobGroup.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

const char *sub_1891DB638()
{
  uint64_t result = getprogname();
  if (result) {
    return (const char *)sub_1891F5ACC();
  }
  __break(1u);
  return result;
}

void *JQRequestInitiateQuiescence.__allocating_init(timeout:requesterName:postQuiesceActions:jobGroup:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = (void *)swift_allocObject();
  uint64_t v13 = *a4;
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = v13;
  result[6] = a5;
  result[7] = a6;
  return result;
}

void *JQRequestInitiateQuiescence.init(timeout:requesterName:postQuiesceActions:jobGroup:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *a4;
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  v6[5] = v7;
  v6[6] = a5;
  v6[7] = a6;
  return v6;
}

uint64_t sub_1891DB6D4@<X0>(void *a1@<X8>)
{
  *a1 = v1;
  return swift_retain();
}

uint64_t static JQRequestInitiateQuiescence.allowedConnectionTypes.getter()
{
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1891F6420;
  uint64_t v1 = type metadata accessor for JQXPCConnection();
  uint64_t v2 = sub_1891DD428( (unint64_t *)&unk_18C7813E0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for JQXPCConnection,  (uint64_t)&protocol conformance descriptor for JQXPCConnection);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  uint64_t v3 = type metadata accessor for JQRemoteXPCConnection();
  uint64_t v4 = sub_1891DD428( &qword_18C7813F0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for JQRemoteXPCConnection,  (uint64_t)&protocol conformance descriptor for JQRemoteXPCConnection);
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v4;
  return v0;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E32FC]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

BOOL sub_1891DB7D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1891DB7E8()
{
  return sub_1891F5D6C();
}

uint64_t sub_1891DB82C()
{
  return sub_1891F5D60();
}

uint64_t sub_1891DB854()
{
  return sub_1891F5D6C();
}

uint64_t sub_1891DB894()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1891DB8C4 + 4 * byte_1891F6430[*v0]))( 0x74756F656D6974LL,  0xE700000000000000LL);
}

uint64_t sub_1891DB8C4()
{
  return 0x6574736575716572LL;
}

unint64_t sub_1891DB8E8()
{
  return 0xD000000000000012LL;
}

uint64_t sub_1891DB904()
{
  return 0x70756F7247626F6ALL;
}

uint64_t sub_1891DB91C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1891DDF70(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1891DB940()
{
  return 0LL;
}

void sub_1891DB94C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1891DB958()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891DB980()
{
  return sub_1891F5DCC();
}

uint64_t JQRequestInitiateQuiescence.deinit()
{
  return v0;
}

uint64_t JQRequestInitiateQuiescence.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891DB9F8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C780EF0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891DBB98();
  sub_1891F5D90();
  char v13 = 0;
  sub_1891F5CE8();
  if (!v2)
  {
    char v12 = 1;
    sub_1891F5CDC();
    uint64_t v11 = *(void *)(v3 + 40);
    v10[15] = 2;
    sub_1891DBBDC();
    sub_1891F5CF4();
    v10[14] = 3;
    sub_1891F5CC4();
  }

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_1891DBB98()
{
  unint64_t result = qword_18C7820B0;
  if (!qword_18C7820B0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F6DAC, &type metadata for JQRequestInitiateQuiescence.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7820B0);
  }

  return result;
}

unint64_t sub_1891DBBDC()
{
  unint64_t result = qword_18C781A20;
  if (!qword_18C781A20)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for PostQuiesceActions,  &type metadata for PostQuiesceActions);
    atomic_store(result, (unint64_t *)&qword_18C781A20);
  }

  return result;
}

uint64_t JQRequestInitiateQuiescence.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  JQRequestInitiateQuiescence.init(from:)(a1);
  return v2;
}

void *JQRequestInitiateQuiescence.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C780EF8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858]();
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891DBB98();
  sub_1891F5D84();
  if (v2)
  {
    type metadata accessor for JQRequestInitiateQuiescence();
    swift_deallocPartialClassInstance();
  }

  else
  {
    char v18 = 0;
    v1[2] = sub_1891F5C88();
    char v17 = 1;
    v1[3] = sub_1891F5C7C();
    v1[4] = v10;
    char v16 = 2;
    sub_1891DBEA0();
    sub_1891F5C94();
    v1[5] = v14[1];
    char v15 = 3;
    uint64_t v11 = sub_1891F5C64();
    uint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v3[6] = v11;
    v3[7] = v13;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t type metadata accessor for JQRequestInitiateQuiescence()
{
  return objc_opt_self();
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

unint64_t sub_1891DBEA0()
{
  unint64_t result = qword_18C780F00;
  if (!qword_18C780F00)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for PostQuiesceActions,  &type metadata for PostQuiesceActions);
    atomic_store(result, (unint64_t *)&qword_18C780F00);
  }

  return result;
}

uint64_t sub_1891DBEE4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120LL))();
}

uint64_t sub_1891DBF0C()
{
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1891F6420;
  uint64_t v1 = type metadata accessor for JQXPCConnection();
  uint64_t v2 = sub_1891DD428( (unint64_t *)&unk_18C7813E0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for JQXPCConnection,  (uint64_t)&protocol conformance descriptor for JQXPCConnection);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  uint64_t v3 = type metadata accessor for JQRemoteXPCConnection();
  uint64_t v4 = sub_1891DD428( &qword_18C7813F0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for JQRemoteXPCConnection,  (uint64_t)&protocol conformance descriptor for JQRemoteXPCConnection);
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v4;
  return v0;
}

xpc_object_t sub_1891DBFB0(uint64_t a1, uint64_t a2)
{
  return JQRequest.asXPC()(a1, a2);
}

uint64_t sub_1891DBFC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 136))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_1891DBFF0()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128LL))();
}

uint64_t sub_1891DC018(uint64_t a1)
{
  return JQRequest.description.getter();
}

uint64_t sub_1891DC054()
{
  if (*v0) {
    return 0x74754F64656D6974LL;
  }
  else {
    return 0x6465637365697571LL;
  }
}

uint64_t sub_1891DC088@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1891DE144(a1, a2);
  *a3 = result;
  return result;
}

void sub_1891DC0AC(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1891DC0B8()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891DC0E0()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891DC108()
{
  return 1LL;
}

uint64_t sub_1891DC114()
{
  return sub_1891F5D60();
}

uint64_t sub_1891DC13C()
{
  return 12383LL;
}

void sub_1891DC14C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1891DC158()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891DC180()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891DC1A8()
{
  return sub_1891F5D6C();
}

uint64_t sub_1891DC1E8()
{
  return sub_1891F5D6C();
}

uint64_t sub_1891DC224@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000LL)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }

  else
  {
    char v5 = sub_1891F5D18();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }

  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1891DC2A0()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891DC2C8()
{
  return sub_1891F5DCC();
}

uint64_t JQResponseInitiateQuiescence.QuiesceResult.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C780F08);
  uint64_t v18 = *(void *)(v4 - 8);
  uint64_t v19 = v4;
  MEMORY[0x1895F8858]();
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C780F10);
  uint64_t v17 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C780F18);
  uint64_t v21 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = *v2;
  int v13 = *((unsigned __int8 *)v2 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891DC550();
  sub_1891F5D90();
  if (v13 == 1)
  {
    char v24 = 1;
    sub_1891DC594();
    sub_1891F5CB8();
    uint64_t v22 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C780F20);
    sub_1891DCA94(&qword_18C780F28, (uint64_t (*)(void))sub_1891DC61C, MEMORY[0x189618448]);
    uint64_t v14 = v19;
    sub_1891F5CF4();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v14);
  }

  else
  {
    char v23 = 0;
    sub_1891DC660();
    sub_1891F5CB8();
    sub_1891F5CE8();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v9, v7);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v12, v10);
}

unint64_t sub_1891DC550()
{
  unint64_t result = qword_18C7820B8;
  if (!qword_18C7820B8)
  {
    unint64_t result = MEMORY[0x1895E3314]( &unk_1891F6D5C,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7820B8);
  }

  return result;
}

unint64_t sub_1891DC594()
{
  unint64_t result = qword_18C7820C0;
  if (!qword_18C7820C0)
  {
    unint64_t result = MEMORY[0x1895E3314]( &unk_1891F6D0C,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult.TimedOutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7820C0);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E3308](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_1891DC61C()
{
  unint64_t result = qword_18C780F30;
  if (!qword_18C780F30)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for JQTaskDescriptor,  &type metadata for JQTaskDescriptor);
    atomic_store(result, (unint64_t *)&qword_18C780F30);
  }

  return result;
}

unint64_t sub_1891DC660()
{
  unint64_t result = qword_18C7820C8;
  if (!qword_18C7820C8)
  {
    unint64_t result = MEMORY[0x1895E3314]( &unk_1891F6CBC,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult.QuiescedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7820C8);
  }

  return result;
}

uint64_t JQResponseInitiateQuiescence.QuiesceResult.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  v32 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C780F38);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  uint64_t v34 = v4;
  MEMORY[0x1895F8858]();
  v35 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C780F40);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858]();
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C780F48);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858]();
  int v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = a1[3];
  v36 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_1891DC550();
  uint64_t v15 = v37;
  sub_1891F5D84();
  if (v15) {
    goto LABEL_6;
  }
  uint64_t v16 = v7;
  uint64_t v17 = v6;
  uint64_t v18 = v35;
  uint64_t v37 = v11;
  uint64_t v19 = sub_1891F5CAC();
  uint64_t v20 = v10;
  if (*(void *)(v19 + 16) != 1LL)
  {
    uint64_t v22 = sub_1891F5C04();
    swift_allocError();
    char v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C7816D0);
    *char v24 = &type metadata for JQResponseInitiateQuiescence.QuiesceResult;
    sub_1891F5C58();
    sub_1891F5BF8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104LL))( v24,  *MEMORY[0x189619358],  v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v10);
LABEL_6:
    uint64_t v29 = (uint64_t)v36;
    return __swift_destroy_boxed_opaque_existential_1(v29);
  }

  int v21 = *(unsigned __int8 *)(v19 + 32);
  if ((v21 & 1) != 0)
  {
    char v41 = 1;
    sub_1891DC594();
    sub_1891F5C4C();
    int v39 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C780F20);
    sub_1891DCA94(&qword_18C780F50, (uint64_t (*)(void))sub_1891DCAFC, MEMORY[0x189618478]);
    uint64_t v27 = v33;
    sub_1891F5C94();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v20);
    uint64_t v28 = v38;
    uint64_t v29 = (uint64_t)v36;
    LOBYTE(v21) = v39;
  }

  else
  {
    char v40 = 0;
    sub_1891DC660();
    uint64_t v26 = v20;
    sub_1891F5C4C();
    uint64_t v28 = sub_1891F5C88();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v17);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v26);
    uint64_t v29 = (uint64_t)v36;
  }

  v30 = v32;
  uint64_t *v32 = v28;
  *((_BYTE *)v30 + 8) = v21;
  return __swift_destroy_boxed_opaque_existential_1(v29);
}

uint64_t sub_1891DCA94(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C780F20);
    uint64_t v8 = a2();
    uint64_t result = MEMORY[0x1895E3314](a3, v7, &v8);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_1891DCAFC()
{
  unint64_t result = qword_18C781880;
  if (!qword_18C781880)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for JQTaskDescriptor,  &type metadata for JQTaskDescriptor);
    atomic_store(result, (unint64_t *)&qword_18C781880);
  }

  return result;
}

uint64_t sub_1891DCB40@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return JQResponseInitiateQuiescence.QuiesceResult.init(from:)(a1, a2);
}

uint64_t sub_1891DCB54(void *a1)
{
  return JQResponseInitiateQuiescence.QuiesceResult.encode(to:)(a1);
}

uint64_t JQResponseInitiateQuiescence.result.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  char v3 = *(_BYTE *)(v1 + 24);
  *(void *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3;
  return sub_1891DCB7C(v2, v3);
}

uint64_t sub_1891DCB7C(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t JQResponseInitiateQuiescence.secondsElapsed.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t JQResponseInitiateQuiescence.__allocating_init(result:secondsElapsed:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  char v5 = *(_BYTE *)(a1 + 8);
  *(void *)(result + 16) = *(void *)a1;
  *(_BYTE *)(result + 24) = v5;
  *(void *)(result + 32) = a2;
  return result;
}

uint64_t JQResponseInitiateQuiescence.init(result:secondsElapsed:)(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a1 + 8);
  *(void *)(v2 + 16) = *(void *)a1;
  *(_BYTE *)(v2 + 24) = v3;
  *(void *)(v2 + 32) = a2;
  return v2;
}

uint64_t sub_1891DCBF8()
{
  return 0LL;
}

BOOL sub_1891DCCA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1891DCCBC()
{
  if (*v0) {
    return 0x4573646E6F636573LL;
  }
  else {
    return 0x746C75736572LL;
  }
}

uint64_t sub_1891DCD00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1891DE234(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1891DCD24()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891DCD4C()
{
  return sub_1891F5DCC();
}

uint64_t JQResponseInitiateQuiescence.deinit()
{
  return v0;
}

uint64_t sub_1891DCD94(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t JQResponseInitiateQuiescence.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891DCDC8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C780F58);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891DCEFC();
  sub_1891F5D90();
  char v9 = *(_BYTE *)(v3 + 24);
  uint64_t v12 = *(void *)(v3 + 16);
  char v13 = v9;
  v11[15] = 0;
  sub_1891DCF40();
  sub_1891F5CF4();
  if (!v2)
  {
    v11[14] = 1;
    sub_1891F5CE8();
  }

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1891DCEFC()
{
  unint64_t result = qword_18C7820D0[0];
  if (!qword_18C7820D0[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F6C6C, &type metadata for JQResponseInitiateQuiescence.CodingKeys);
    atomic_store(result, qword_18C7820D0);
  }

  return result;
}

unint64_t sub_1891DCF40()
{
  unint64_t result = qword_18C780F60;
  if (!qword_18C780F60)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for JQResponseInitiateQuiescence.QuiesceResult,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult);
    atomic_store(result, (unint64_t *)&qword_18C780F60);
  }

  return result;
}

uint64_t JQResponseInitiateQuiescence.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  JQResponseInitiateQuiescence.init(from:)(a1);
  return v2;
}

uint64_t JQResponseInitiateQuiescence.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C780F68);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891DCEFC();
  sub_1891F5D84();
  if (v2)
  {
    type metadata accessor for JQResponseInitiateQuiescence();
    swift_deallocPartialClassInstance();
  }

  else
  {
    char v15 = 0;
    sub_1891DD19C();
    sub_1891F5C94();
    char v9 = v13;
    *(void *)(v1 + 16) = v12;
    *(_BYTE *)(v1 + 24) = v9;
    char v14 = 1;
    uint64_t v11 = sub_1891F5C88();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(void *)(v3 + 32) = v11;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t type metadata accessor for JQResponseInitiateQuiescence()
{
  return objc_opt_self();
}

unint64_t sub_1891DD19C()
{
  unint64_t result = qword_18C780F70;
  if (!qword_18C780F70)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for JQResponseInitiateQuiescence.QuiesceResult,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult);
    atomic_store(result, (unint64_t *)&qword_18C780F70);
  }

  return result;
}

unint64_t sub_1891DD1E4()
{
  unint64_t result = qword_18C780F78;
  if (!qword_18C780F78)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for PostQuiesceActions,  &type metadata for PostQuiesceActions);
    atomic_store(result, (unint64_t *)&qword_18C780F78);
  }

  return result;
}

unint64_t sub_1891DD22C()
{
  unint64_t result = qword_18C780F80;
  if (!qword_18C780F80)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for PostQuiesceActions,  &type metadata for PostQuiesceActions);
    atomic_store(result, (unint64_t *)&qword_18C780F80);
  }

  return result;
}

unint64_t sub_1891DD274()
{
  unint64_t result = qword_18C780F88;
  if (!qword_18C780F88)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for PostQuiesceActions,  &type metadata for PostQuiesceActions);
    atomic_store(result, (unint64_t *)&qword_18C780F88);
  }

  return result;
}

unint64_t sub_1891DD2BC()
{
  unint64_t result = qword_18C780F90;
  if (!qword_18C780F90)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for PostQuiesceActions,  &type metadata for PostQuiesceActions);
    atomic_store(result, (unint64_t *)&qword_18C780F90);
  }

  return result;
}

uint64_t sub_1891DD300(uint64_t a1, uint64_t a2)
{
  return sub_1891DD428( &qword_18C780F98,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for JQResponseInitiateQuiescence,  (uint64_t)&protocol conformance descriptor for JQResponseInitiateQuiescence);
}

uint64_t sub_1891DD32C(void *a1, uint64_t a2)
{
  a1[1] = sub_1891DD428( &qword_18C780FE8,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestInitiateQuiescence,  (uint64_t)&protocol conformance descriptor for JQRequestInitiateQuiescence);
  a1[2] = sub_1891DD428( &qword_18C780FF0,  v3,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestInitiateQuiescence,  (uint64_t)&protocol conformance descriptor for JQRequestInitiateQuiescence);
  uint64_t result = sub_1891DD428( &qword_18C780FF8,  v4,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestInitiateQuiescence,  (uint64_t)&protocol conformance descriptor for JQRequestInitiateQuiescence);
  a1[3] = result;
  return result;
}

uint64_t sub_1891DD3A4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 104LL))();
}

uint64_t sub_1891DD3CC(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = sub_1891DD428( &qword_18C781000,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for JQResponseInitiateQuiescence,  (uint64_t)&protocol conformance descriptor for JQResponseInitiateQuiescence);
  uint64_t result = sub_1891DD428( &qword_18C781008,  v3,  (uint64_t (*)(uint64_t))type metadata accessor for JQResponseInitiateQuiescence,  (uint64_t)&protocol conformance descriptor for JQResponseInitiateQuiescence);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1891DD428(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = a3(a2);
    uint64_t result = MEMORY[0x1895E3314](a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1891DD468@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 120))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_1891DD494()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 112LL))();
}

ValueMetadata *type metadata accessor for PostQuiesceActions()
{
  return &type metadata for PostQuiesceActions;
}

uint64_t method lookup function for JQRequestInitiateQuiescence()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQRequestInitiateQuiescence.__allocating_init(timeout:requesterName:postQuiesceActions:jobGroup:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of JQRequestInitiateQuiescence.asCodable()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120LL))();
}

uint64_t dispatch thunk of JQRequestInitiateQuiescence.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128LL))();
}

uint64_t dispatch thunk of JQRequestInitiateQuiescence.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t method lookup function for JQResponseInitiateQuiescence()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQResponseInitiateQuiescence.__allocating_init(result:secondsElapsed:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of JQResponseInitiateQuiescence.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104LL))();
}

uint64_t dispatch thunk of JQResponseInitiateQuiescence.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112LL))();
}

uint64_t dispatch thunk of JQResponseInitiateQuiescence.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t initializeBufferWithCopyOfBuffer for JQResponseInitiateQuiescence.QuiesceResult( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  sub_1891DCB7C(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for JQResponseInitiateQuiescence.QuiesceResult(uint64_t a1)
{
  return sub_1891DCD94(*(void *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for JQResponseInitiateQuiescence.QuiesceResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  sub_1891DCB7C(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  char v6 = *(_BYTE *)(a1 + 8);
  *(void *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_1891DCD94(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for JQResponseInitiateQuiescence.QuiesceResult(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((_BYTE *)a2 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = *(_BYTE *)(a1 + 8);
  *(void *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_1891DCD94(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for JQResponseInitiateQuiescence.QuiesceResult(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for JQResponseInitiateQuiescence.QuiesceResult( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 9) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 9) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 8) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_1891DD704(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1891DD710(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for JQResponseInitiateQuiescence.QuiesceResult()
{
  return &type metadata for JQResponseInitiateQuiescence.QuiesceResult;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_1891DD744(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1891DD74C(_BYTE *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for JQResponseInitiateQuiescence.CodingKeys()
{
  return &type metadata for JQResponseInitiateQuiescence.CodingKeys;
}

uint64_t getEnumTagSinglePayload for JQRequestRegisterTask.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t _s13JobQuiescence28JQResponseInitiateQuiescenceC10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1891DD844 + 4 * byte_1891F6439[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1891DD878 + 4 * byte_1891F6434[v4]))();
}

uint64_t sub_1891DD878(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891DD880(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891DD888LL);
  }
  return result;
}

uint64_t sub_1891DD894(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891DD89CLL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1891DD8A0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891DD8A8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JQResponseInitiateQuiescence.QuiesceResult.CodingKeys()
{
  return &type metadata for JQResponseInitiateQuiescence.QuiesceResult.CodingKeys;
}

uint64_t sub_1891DD8D0()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for JQResponseInitiateQuiescence.QuiesceResult.QuiescedCodingKeys()
{
  return &type metadata for JQResponseInitiateQuiescence.QuiesceResult.QuiescedCodingKeys;
}

uint64_t getEnumTagSinglePayload for JQResponseProgress.CodingKeys(unsigned int *a1, int a2)
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

uint64_t _s13JobQuiescence28JQResponseInitiateQuiescenceC13QuiesceResultO18QuiescedCodingKeysOwst_0( uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1891DD978 + 4 * byte_1891F643E[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1891DD998 + 4 * byte_1891F6443[v4]))();
  }
}

_BYTE *sub_1891DD978(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_1891DD998(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1891DD9A0(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_1891DD9A8(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_1891DD9B0(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1891DD9B8(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for JQResponseInitiateQuiescence.QuiesceResult.TimedOutCodingKeys()
{
  return &type metadata for JQResponseInitiateQuiescence.QuiesceResult.TimedOutCodingKeys;
}

uint64_t getEnumTagSinglePayload for JQRequestInitiateQuiescence.CodingKeys( unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for JQRequestInitiateQuiescence.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1891DDAB0 + 4 * byte_1891F644D[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1891DDAE4 + 4 * byte_1891F6448[v4]))();
}

uint64_t sub_1891DDAE4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891DDAEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891DDAF4LL);
  }
  return result;
}

uint64_t sub_1891DDB00(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891DDB08LL);
  }
  *(_BYTE *)uint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1891DDB0C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891DDB14(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1891DDB20(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for JQRequestInitiateQuiescence.CodingKeys()
{
  return &type metadata for JQRequestInitiateQuiescence.CodingKeys;
}

unint64_t sub_1891DDB3C()
{
  unint64_t result = qword_18C7829E0[0];
  if (!qword_18C7829E0[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F6964, &type metadata for JQRequestInitiateQuiescence.CodingKeys);
    atomic_store(result, qword_18C7829E0);
  }

  return result;
}

unint64_t sub_1891DDB84()
{
  unint64_t result = qword_18C782BF0[0];
  if (!qword_18C782BF0[0])
  {
    unint64_t result = MEMORY[0x1895E3314]( &unk_1891F6A1C,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult.TimedOutCodingKeys);
    atomic_store(result, qword_18C782BF0);
  }

  return result;
}

unint64_t sub_1891DDBCC()
{
  unint64_t result = qword_18C782E00[0];
  if (!qword_18C782E00[0])
  {
    unint64_t result = MEMORY[0x1895E3314]( &unk_1891F6AD4,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult.QuiescedCodingKeys);
    atomic_store(result, qword_18C782E00);
  }

  return result;
}

unint64_t sub_1891DDC14()
{
  unint64_t result = qword_18C783010[0];
  if (!qword_18C783010[0])
  {
    unint64_t result = MEMORY[0x1895E3314]( &unk_1891F6B8C,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult.CodingKeys);
    atomic_store(result, qword_18C783010);
  }

  return result;
}

unint64_t sub_1891DDC5C()
{
  unint64_t result = qword_18C783220[0];
  if (!qword_18C783220[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F6C44, &type metadata for JQResponseInitiateQuiescence.CodingKeys);
    atomic_store(result, qword_18C783220);
  }

  return result;
}

unint64_t sub_1891DDCA4()
{
  unint64_t result = qword_18C783330;
  if (!qword_18C783330)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F6BB4, &type metadata for JQResponseInitiateQuiescence.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C783330);
  }

  return result;
}

unint64_t sub_1891DDCEC()
{
  unint64_t result = qword_18C783338[0];
  if (!qword_18C783338[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F6BDC, &type metadata for JQResponseInitiateQuiescence.CodingKeys);
    atomic_store(result, qword_18C783338);
  }

  return result;
}

unint64_t sub_1891DDD34()
{
  unint64_t result = qword_18C7833C0;
  if (!qword_18C7833C0)
  {
    unint64_t result = MEMORY[0x1895E3314]( &unk_1891F6A44,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult.QuiescedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7833C0);
  }

  return result;
}

unint64_t sub_1891DDD7C()
{
  unint64_t result = qword_18C7833C8[0];
  if (!qword_18C7833C8[0])
  {
    unint64_t result = MEMORY[0x1895E3314]( &unk_1891F6A6C,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult.QuiescedCodingKeys);
    atomic_store(result, qword_18C7833C8);
  }

  return result;
}

unint64_t sub_1891DDDC4()
{
  unint64_t result = qword_18C783450;
  if (!qword_18C783450)
  {
    unint64_t result = MEMORY[0x1895E3314]( &unk_1891F698C,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult.TimedOutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C783450);
  }

  return result;
}

unint64_t sub_1891DDE0C()
{
  unint64_t result = qword_18C783458[0];
  if (!qword_18C783458[0])
  {
    unint64_t result = MEMORY[0x1895E3314]( &unk_1891F69B4,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult.TimedOutCodingKeys);
    atomic_store(result, qword_18C783458);
  }

  return result;
}

unint64_t sub_1891DDE54()
{
  unint64_t result = qword_18C7834E0;
  if (!qword_18C7834E0)
  {
    unint64_t result = MEMORY[0x1895E3314]( &unk_1891F6AFC,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7834E0);
  }

  return result;
}

unint64_t sub_1891DDE9C()
{
  unint64_t result = qword_18C7834E8[0];
  if (!qword_18C7834E8[0])
  {
    unint64_t result = MEMORY[0x1895E3314]( &unk_1891F6B24,  &type metadata for JQResponseInitiateQuiescence.QuiesceResult.CodingKeys);
    atomic_store(result, qword_18C7834E8);
  }

  return result;
}

unint64_t sub_1891DDEE4()
{
  unint64_t result = qword_18C783570;
  if (!qword_18C783570)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F68D4, &type metadata for JQRequestInitiateQuiescence.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C783570);
  }

  return result;
}

unint64_t sub_1891DDF2C()
{
  unint64_t result = qword_18C783578;
  if (!qword_18C783578)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F68FC, &type metadata for JQRequestInitiateQuiescence.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C783578);
  }

  return result;
}

uint64_t sub_1891DDF70(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x74756F656D6974LL && a2 == 0xE700000000000000LL;
  if (v2 || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x6574736575716572LL && a2 == 0xED0000656D614E72LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else if (a1 == 0xD000000000000012LL && a2 == 0x80000001891FA9A0LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2LL;
  }

  else if (a1 == 0x70756F7247626F6ALL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease();
    return 3LL;
  }

  else
  {
    char v6 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }
}

uint64_t sub_1891DE144(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6465637365697571LL && a2 == 0xE800000000000000LL;
  if (v2 || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x74754F64656D6974LL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1891DE234(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746C75736572LL && a2 == 0xE600000000000000LL;
  if (v2 || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x4573646E6F636573LL && a2 == 0xEE0064657370616CLL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t JQRequestProgress.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t JQRequestProgress.init()()
{
  return v0;
}

uint64_t sub_1891DE374@<X0>(uint64_t *a1@<X8>)
{
  *a1 = v1 | 0x2000000000000000LL;
  return swift_retain();
}

uint64_t static JQRequestProgress.allowedConnectionTypes.getter()
{
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1891F6420;
  uint64_t v1 = type metadata accessor for JQXPCConnection();
  uint64_t v2 = sub_1891DD428( (unint64_t *)&unk_18C7813E0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for JQXPCConnection,  (uint64_t)&protocol conformance descriptor for JQXPCConnection);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  uint64_t v3 = type metadata accessor for JQRemoteXPCConnection();
  uint64_t v4 = sub_1891DD428( &qword_18C7813F0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for JQRemoteXPCConnection,  (uint64_t)&protocol conformance descriptor for JQRemoteXPCConnection);
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v4;
  return v0;
}

uint64_t sub_1891DE438()
{
  return 0LL;
}

uint64_t sub_1891DE444@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1891DE470()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891DE498()
{
  return sub_1891F5DCC();
}

uint64_t JQRequestProgress.deinit()
{
  return v0;
}

uint64_t JQRequestProgress.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891DE4D8(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7811A0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891DE59C();
  sub_1891F5D90();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_1891DE59C()
{
  unint64_t result = qword_18C783600;
  if (!qword_18C783600)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F742C, &type metadata for JQRequestProgress.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C783600);
  }

  return result;
}

uint64_t JQRequestProgress.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

uint64_t JQRequestProgress.init(from:)(uint64_t a1)
{
  return v1;
}

uint64_t sub_1891DE654()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88LL))();
}

uint64_t sub_1891DE67C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 104))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_1891DE6A8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 96LL))();
}

uint64_t sub_1891DE6D0(uint64_t a1)
{
  return JQRequest.description.getter();
}

uint64_t sub_1891DE704()
{
  if (*v0) {
    return 0x6E69637365697571LL;
  }
  else {
    return 1701602409LL;
  }
}

uint64_t sub_1891DE73C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1891DFF6C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1891DE760()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891DE788()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891DE7B0()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891DE7D8()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891DE800()
{
  if (*v0) {
    return 0x4573646E6F636573LL;
  }
  else {
    return 0x6E696E69616D6572LL;
  }
}

uint64_t sub_1891DE854@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1891E0058(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1891DE878()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891DE8A0()
{
  return sub_1891F5DCC();
}

uint64_t JQResponseProgress.JQState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7811A8);
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  MEMORY[0x1895F8858]();
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7811B0);
  uint64_t v19 = *(void *)(v6 - 8);
  uint64_t v20 = v6;
  MEMORY[0x1895F8858]();
  int v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7811B8);
  uint64_t v9 = *(void *)(v23 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = *v1;
  uint64_t v18 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891DEB3C();
  sub_1891F5D90();
  if (v12)
  {
    char v29 = 1;
    sub_1891DEB80();
    uint64_t v13 = v23;
    sub_1891F5CB8();
    uint64_t v25 = v12;
    char v28 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C780F20);
    sub_1891DCA94(&qword_18C780F28, (uint64_t (*)(void))sub_1891DC61C, MEMORY[0x189618448]);
    uint64_t v14 = v22;
    uint64_t v15 = v24;
    sub_1891F5CF4();
    if (!v15)
    {
      char v27 = 1;
      sub_1891F5CE8();
    }

    (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v14);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v13);
  }

  else
  {
    char v26 = 0;
    sub_1891DEBC4();
    uint64_t v17 = v23;
    sub_1891F5CB8();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v17);
  }

unint64_t sub_1891DEB3C()
{
  unint64_t result = qword_18C783608;
  if (!qword_18C783608)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F73DC, &type metadata for JQResponseProgress.JQState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C783608);
  }

  return result;
}

unint64_t sub_1891DEB80()
{
  unint64_t result = qword_18C783610;
  if (!qword_18C783610)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F738C, &type metadata for JQResponseProgress.JQState.QuiescingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C783610);
  }

  return result;
}

unint64_t sub_1891DEBC4()
{
  unint64_t result = qword_18C783618;
  if (!qword_18C783618)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F733C, &type metadata for JQResponseProgress.JQState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C783618);
  }

  return result;
}

uint64_t JQResponseProgress.JQState.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7811C0);
  uint64_t v31 = *(void *)(v3 - 8);
  uint64_t v32 = v3;
  MEMORY[0x1895F8858]();
  uint64_t v34 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7811C8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858]();
  int v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7811D0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = a1[3];
  v35 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_1891DEB3C();
  uint64_t v14 = v36;
  sub_1891F5D84();
  if (!v14)
  {
    uint64_t v15 = v5;
    uint64_t v16 = v34;
    uint64_t v36 = v10;
    uint64_t v17 = sub_1891F5CAC();
    uint64_t v18 = v9;
    if (*(void *)(v17 + 16) == 1LL)
    {
      if ((*(_BYTE *)(v17 + 32) & 1) != 0)
      {
        char v41 = 1;
        sub_1891DEB80();
        uint64_t v19 = v16;
        sub_1891F5C4C();
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C780F20);
        char v40 = 0;
        sub_1891DCA94(&qword_18C780F50, (uint64_t (*)(void))sub_1891DCAFC, MEMORY[0x189618478]);
        uint64_t v20 = v32;
        sub_1891F5C94();
        uint64_t v30 = v18;
        uint64_t v26 = v37;
        char v39 = 1;
        uint64_t v27 = sub_1891F5C88();
        uint64_t v28 = v36;
        uint64_t v29 = v27;
        (*(void (**)(char *, uint64_t))(v31 + 8))(v19, v20);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v30);
      }

      else
      {
        char v38 = 0;
        sub_1891DEBC4();
        sub_1891F5C4C();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v9);
        uint64_t v26 = 0LL;
        uint64_t v29 = 0LL;
      }

      uint64_t v25 = v33;
      *uint64_t v33 = v26;
      v25[1] = v29;
    }

    else
    {
      uint64_t v21 = sub_1891F5C04();
      swift_allocError();
      uint64_t v23 = v22;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C7816D0);
      *uint64_t v23 = &type metadata for JQResponseProgress.JQState;
      sub_1891F5C58();
      sub_1891F5BF8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104LL))( v23,  *MEMORY[0x189619358],  v21);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v9);
    }
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
}

uint64_t sub_1891DF04C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return JQResponseProgress.JQState.init(from:)(a1, a2);
}

uint64_t sub_1891DF060(void *a1)
{
  return JQResponseProgress.JQState.encode(to:)(a1);
}

uint64_t JQResponseProgress.state.getter@<X0>(_OWORD *a1@<X8>)
{
  *a1 = *(_OWORD *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

__n128 JQResponseProgress.__allocating_init(state:)(__n128 *a1)
{
  uint64_t v2 = swift_allocObject();
  __n128 result = *a1;
  *(__n128 *)(v2 + 16) = *a1;
  return result;
}

uint64_t JQResponseProgress.init(state:)(_OWORD *a1)
{
  *(_OWORD *)(v1 + 16) = *a1;
  return v1;
}

uint64_t sub_1891DF0C8()
{
  return 0LL;
}

uint64_t sub_1891DF16C()
{
  return 0x6574617473LL;
}

uint64_t sub_1891DF180@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  if (a1 == 0x6574617473LL && a2 == 0xE500000000000000LL)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }

  else
  {
    char v5 = sub_1891F5D18();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }

  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1891DF20C()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891DF234()
{
  return sub_1891F5DCC();
}

uint64_t JQResponseProgress.deinit()
{
  return v0;
}

uint64_t JQResponseProgress.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891DF29C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7811D8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858]();
  char v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891DF398();
  sub_1891F5D90();
  __int128 v9 = *(_OWORD *)(v2 + 16);
  sub_1891DF3DC();
  sub_1891F5CF4();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1891DF398()
{
  unint64_t result = qword_18C783620[0];
  if (!qword_18C783620[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F72EC, &type metadata for JQResponseProgress.CodingKeys);
    atomic_store(result, qword_18C783620);
  }

  return result;
}

unint64_t sub_1891DF3DC()
{
  unint64_t result = qword_18C7811E0;
  if (!qword_18C7811E0)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for JQResponseProgress.JQState,  &type metadata for JQResponseProgress.JQState);
    atomic_store(result, (unint64_t *)&qword_18C7811E0);
  }

  return result;
}

uint64_t JQResponseProgress.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  JQResponseProgress.init(from:)(a1);
  return v2;
}

uint64_t JQResponseProgress.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7811E8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858]();
  char v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891DF398();
  sub_1891F5D84();
  if (v2)
  {
    type metadata accessor for JQResponseProgress();
    swift_deallocPartialClassInstance();
  }

  else
  {
    sub_1891DF5DC();
    sub_1891F5C94();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_OWORD *)(v1 + 16) = v9;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t type metadata accessor for JQResponseProgress()
{
  return objc_opt_self();
}

unint64_t sub_1891DF5DC()
{
  unint64_t result = qword_18C7811F0;
  if (!qword_18C7811F0)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for JQResponseProgress.JQState,  &type metadata for JQResponseProgress.JQState);
    atomic_store(result, (unint64_t *)&qword_18C7811F0);
  }

  return result;
}

uint64_t sub_1891DF620(uint64_t a1, uint64_t a2)
{
  return sub_1891DD428( &qword_18C7811F8,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for JQResponseProgress,  (uint64_t)&protocol conformance descriptor for JQResponseProgress);
}

uint64_t sub_1891DF64C(void *a1, uint64_t a2)
{
  a1[1] = sub_1891DD428( &qword_18C781248,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestProgress,  (uint64_t)&protocol conformance descriptor for JQRequestProgress);
  a1[2] = sub_1891DD428( &qword_18C781250,  v3,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestProgress,  (uint64_t)&protocol conformance descriptor for JQRequestProgress);
  uint64_t result = sub_1891DD428( &qword_18C781258,  v4,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestProgress,  (uint64_t)&protocol conformance descriptor for JQRequestProgress);
  a1[3] = result;
  return result;
}

uint64_t type metadata accessor for JQRequestProgress()
{
  return objc_opt_self();
}

uint64_t sub_1891DF6E4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 96LL))();
}

uint64_t sub_1891DF70C(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = sub_1891DD428( &qword_18C781260,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for JQResponseProgress,  (uint64_t)&protocol conformance descriptor for JQResponseProgress);
  uint64_t result = sub_1891DD428( &qword_18C781268,  v3,  (uint64_t (*)(uint64_t))type metadata accessor for JQResponseProgress,  (uint64_t)&protocol conformance descriptor for JQResponseProgress);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1891DF768@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 112))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_1891DF794()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 104LL))();
}

uint64_t method lookup function for JQRequestProgress()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQRequestProgress.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of JQRequestProgress.asCodable()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88LL))();
}

uint64_t dispatch thunk of JQRequestProgress.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96LL))();
}

uint64_t dispatch thunk of JQRequestProgress.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for JQResponseProgress()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQResponseProgress.__allocating_init(state:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of JQResponseProgress.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96LL))();
}

uint64_t dispatch thunk of JQResponseProgress.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104LL))();
}

uint64_t dispatch thunk of JQResponseProgress.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void *initializeBufferWithCopyOfBuffer for JQResponseProgress.JQState(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for JQResponseProgress.JQState()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for JQResponseProgress.JQState(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for JQResponseProgress.JQState(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for JQResponseProgress.JQState(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for JQResponseProgress.JQState( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
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
      *(void *)__n128 result = a2;
    }
  }

  return result;
}

uint64_t sub_1891DF9E0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  return (v1 + 1);
}

void *sub_1891DF9F8(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0LL;
  }

  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }

  *__n128 result = v2;
  return result;
}

ValueMetadata *type metadata accessor for JQResponseProgress.JQState()
{
  return &type metadata for JQResponseProgress.JQState;
}

uint64_t storeEnumTagSinglePayload for JQResponseProgress.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1891DFA68 + 4 * byte_1891F6E00[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1891DFA88 + 4 * byte_1891F6E05[v4]))();
  }
}

_BYTE *sub_1891DFA68(_BYTE *result, char a2)
{
  *__n128 result = a2;
  return result;
}

_BYTE *sub_1891DFA88(_BYTE *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_1891DFA90(_DWORD *result, int a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_1891DFA98(_WORD *result, __int16 a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_1891DFAA0(_WORD *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_1891DFAA8(_DWORD *result)
{
  *__n128 result = 0;
  return result;
}

ValueMetadata *type metadata accessor for JQResponseProgress.CodingKeys()
{
  return &type metadata for JQResponseProgress.CodingKeys;
}

ValueMetadata *type metadata accessor for JQResponseProgress.JQState.CodingKeys()
{
  return &type metadata for JQResponseProgress.JQState.CodingKeys;
}

ValueMetadata *type metadata accessor for JQResponseProgress.JQState.IdleCodingKeys()
{
  return &type metadata for JQResponseProgress.JQState.IdleCodingKeys;
}

uint64_t _s13JobQuiescence18JQResponseProgressC7JQStateO10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1891DFB34 + 4 * byte_1891F6E0F[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1891DFB68 + 4 * byte_1891F6E0A[v4]))();
}

uint64_t sub_1891DFB68(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891DFB70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891DFB78LL);
  }
  return result;
}

uint64_t sub_1891DFB84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891DFB8CLL);
  }
  *(_BYTE *)__n128 result = a2 + 1;
  return result;
}

uint64_t sub_1891DFB90(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891DFB98(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JQResponseProgress.JQState.QuiescingCodingKeys()
{
  return &type metadata for JQResponseProgress.JQState.QuiescingCodingKeys;
}

ValueMetadata *type metadata accessor for JQRequestProgress.CodingKeys()
{
  return &type metadata for JQRequestProgress.CodingKeys;
}

unint64_t sub_1891DFBC8()
{
  unint64_t result = qword_18C783CB0[0];
  if (!qword_18C783CB0[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7104, &type metadata for JQResponseProgress.JQState.QuiescingCodingKeys);
    atomic_store(result, qword_18C783CB0);
  }

  return result;
}

unint64_t sub_1891DFC10()
{
  unint64_t result = qword_18C783FC0[0];
  if (!qword_18C783FC0[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F720C, &type metadata for JQResponseProgress.JQState.CodingKeys);
    atomic_store(result, qword_18C783FC0);
  }

  return result;
}

unint64_t sub_1891DFC58()
{
  unint64_t result = qword_18C7841D0[0];
  if (!qword_18C7841D0[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F72C4, &type metadata for JQResponseProgress.CodingKeys);
    atomic_store(result, qword_18C7841D0);
  }

  return result;
}

unint64_t sub_1891DFCA0()
{
  unint64_t result = qword_18C7842E0;
  if (!qword_18C7842E0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7234, &type metadata for JQResponseProgress.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7842E0);
  }

  return result;
}

unint64_t sub_1891DFCE8()
{
  unint64_t result = qword_18C7842E8[0];
  if (!qword_18C7842E8[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F725C, &type metadata for JQResponseProgress.CodingKeys);
    atomic_store(result, qword_18C7842E8);
  }

  return result;
}

unint64_t sub_1891DFD30()
{
  unint64_t result = qword_18C784370;
  if (!qword_18C784370)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F712C, &type metadata for JQResponseProgress.JQState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C784370);
  }

  return result;
}

unint64_t sub_1891DFD78()
{
  unint64_t result = qword_18C784378;
  if (!qword_18C784378)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7154, &type metadata for JQResponseProgress.JQState.IdleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C784378);
  }

  return result;
}

unint64_t sub_1891DFDC0()
{
  unint64_t result = qword_18C784400;
  if (!qword_18C784400)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7074, &type metadata for JQResponseProgress.JQState.QuiescingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C784400);
  }

  return result;
}

unint64_t sub_1891DFE08()
{
  unint64_t result = qword_18C784408[0];
  if (!qword_18C784408[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F709C, &type metadata for JQResponseProgress.JQState.QuiescingCodingKeys);
    atomic_store(result, qword_18C784408);
  }

  return result;
}

unint64_t sub_1891DFE50()
{
  unint64_t result = qword_18C784490;
  if (!qword_18C784490)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F717C, &type metadata for JQResponseProgress.JQState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C784490);
  }

  return result;
}

unint64_t sub_1891DFE98()
{
  unint64_t result = qword_18C784498[0];
  if (!qword_18C784498[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F71A4, &type metadata for JQResponseProgress.JQState.CodingKeys);
    atomic_store(result, qword_18C784498);
  }

  return result;
}

unint64_t sub_1891DFEE0()
{
  unint64_t result = qword_18C784520;
  if (!qword_18C784520)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7024, &type metadata for JQRequestProgress.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C784520);
  }

  return result;
}

unint64_t sub_1891DFF28()
{
  unint64_t result = qword_18C784528[0];
  if (!qword_18C784528[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F704C, &type metadata for JQRequestProgress.CodingKeys);
    atomic_store(result, qword_18C784528);
  }

  return result;
}

uint64_t sub_1891DFF6C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701602409 && a2 == 0xE400000000000000LL;
  if (v2 || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x6E69637365697571LL && a2 == 0xE900000000000067LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1891E0058(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E696E69616D6572LL && a2 == 0xEE00736B73615467LL;
  if (v2 || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x4573646E6F636573LL && a2 == 0xEE0064657370616CLL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1891E0198()
{
  return swift_unknownObjectRetain();
}

uint64_t JQXPCConnection.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  JQXPCConnection.init()();
  return v0;
}

uint64_t JQXPCConnection.init()()
{
  uint64_t v1 = v0;
  aBlock[9] = *MEMORY[0x1895F89C0];
  uint64_t v2 = sub_1891F5A0C();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1891F4D6C();
  uint64_t v6 = sub_1891F5AB4();
  xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)(v6 + 32), 0LL, 0LL);
  swift_release();
  *(void *)(v1 + 16) = mach_service;
  if (xpc_user_sessions_enabled() && xpc_is_system_session())
  {
    LODWORD(aBlock[0]) = 0;
    xpc_user_sessions_get_foreground_uid();
    if (LODWORD(aBlock[0]))
    {
      uint64_t v8 = sub_1891EEAC8();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
      __int128 v9 = (os_log_s *)sub_1891F59F4();
      os_log_type_t v10 = sub_1891F5B44();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v11 = 67109120;
        swift_beginAccess();
        v15[3] = aBlock[0];
        sub_1891F5BA4();
        _os_log_impl( &dword_1891D9000,  v9,  v10,  "Cannot set target user session for remoted connection because we failed to get the foreground user's uid: %d",  v11,  8u);
        MEMORY[0x1895E33A4](v11, -1LL, -1LL);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }

    else
    {
      xpc_connection_set_target_user_session_uid();
    }
  }

  uint64_t v12 = *(_xpc_connection_s **)(v1 + 16);
  aBlock[4] = sub_1891E0588;
  aBlock[5] = 0LL;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1891E0910;
  aBlock[3] = &block_descriptor;
  uint64_t v13 = _Block_copy(aBlock);
  xpc_connection_set_event_handler(v12, v13);
  _Block_release(v13);
  xpc_connection_activate(v12);
  return v1;
}

uint64_t JQXPCConnection.__allocating_init(withEndpoint:)(_xpc_endpoint_s *a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = xpc_connection_create_from_endpoint(a1);
  *(void *)(v2 + 16) = v3;
  v6[4] = sub_1891E0588;
  v6[5] = 0LL;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 1107296256LL;
  v6[2] = sub_1891E0910;
  v6[3] = &block_descriptor_3;
  uint64_t v4 = _Block_copy(v6);
  xpc_connection_set_event_handler(v3, v4);
  _Block_release(v4);
  xpc_connection_activate(v3);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t JQXPCConnection.init(withEndpoint:)(_xpc_endpoint_s *a1)
{
  uint64_t v2 = xpc_connection_create_from_endpoint(a1);
  *(void *)(v1 + 16) = v2;
  v5[4] = sub_1891E0588;
  v5[5] = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 1107296256LL;
  v5[2] = sub_1891E0910;
  v5[3] = &block_descriptor_6;
  uint64_t v3 = _Block_copy(v5);
  xpc_connection_set_event_handler(v2, v3);
  _Block_release(v3);
  xpc_connection_activate(v2);
  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_1891E0588(uint64_t a1)
{
  uint64_t v2 = sub_1891F5A0C();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v4);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = MEMORY[0x1895E3530](a1);
  uint64_t v10 = sub_1891F5A18();
  uint64_t v11 = sub_1891EEAC8();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  if (v9 == v10)
  {
    v12(v6, v11, v2);
    swift_unknownObjectRetain_n();
    uint64_t v21 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v22 = sub_1891F5B44();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v31 = v2;
      uint64_t v32 = a1;
      uint64_t v25 = v24;
      uint64_t v33 = v24;
      *(_DWORD *)uint64_t v23 = 136446210;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
      uint64_t v26 = sub_1891F5AA8();
      uint64_t v32 = sub_1891E24FC(v26, v27, &v33);
      sub_1891F5BA4();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1891D9000, v21, v22, "XPC error: %{public}s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v25, -1LL, -1LL);
      MEMORY[0x1895E33A4](v23, -1LL, -1LL);

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v31);
    }

    swift_unknownObjectRelease_n();
    uint64_t v28 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
    uint64_t v29 = v6;
  }

  else
  {
    v12(v8, v11, v2);
    swift_unknownObjectRetain_n();
    uint64_t v13 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v14 = sub_1891F5B44();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v31 = v2;
      uint64_t v32 = a1;
      uint64_t v17 = v16;
      uint64_t v33 = v16;
      *(_DWORD *)uint64_t v15 = 136446210;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
      uint64_t v18 = sub_1891F5AA8();
      uint64_t v32 = sub_1891E24FC(v18, v19, &v33);
      sub_1891F5BA4();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1891D9000, v13, v14, "Unexpected XPC: %{public}s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v17, -1LL, -1LL);
      MEMORY[0x1895E33A4](v15, -1LL, -1LL);

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v31);
    }

    swift_unknownObjectRelease_n();
    uint64_t v28 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
    uint64_t v29 = v8;
  }

  return v28(v29, v2);
}

uint64_t sub_1891E0910(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1891E0974( uint64_t a1, dispatch_queue_s *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6)
{
  dispatch_queue_t v31 = a2;
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C781E20);
  uint64_t v12 = sub_1891F5D78();
  uint64_t v32 = *(void *)(v12 - 8);
  MEMORY[0x1895F8858](v12);
  os_log_type_t v14 = (uint64_t *)((char *)&v29 - v13);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a5;
  v15[3] = a6;
  uint64_t v33 = a3;
  _DWORD v15[4] = a3;
  v15[5] = a4;
  uint64_t v30 = v6;
  aBlock[0] = v6;
  uint64_t v16 = type metadata accessor for JQXPCConnection();
  uint64_t v17 = sub_1891E26E8( (unint64_t *)&unk_18C7813E0,  type metadata accessor for JQXPCConnection,  (uint64_t)&protocol conformance descriptor for JQXPCConnection);
  swift_retain_n();
  sub_1891EDB3C(a1, v16, a5, v17, a6, &v36);
  char v18 = v36;
  if (v36 == 12)
  {
    uint64_t v19 = v34;
    uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 64))(a5, a6);
    if (v19)
    {
      swift_release();
      return swift_release();
    }

    else
    {
      uint64_t v24 = (void *)v20;
      uint64_t v25 = v30;
      uint64_t v26 = *(_xpc_connection_s **)(v30 + 16);
      unint64_t v27 = (void *)swift_allocObject();
      v27[2] = a5;
      v27[3] = a6;
      v27[4] = sub_1891E245C;
      v27[5] = v15;
      v27[6] = v25;
      aBlock[4] = sub_1891E249C;
      aBlock[5] = v27;
      aBlock[0] = MEMORY[0x1895F87A8];
      aBlock[1] = 1107296256LL;
      aBlock[2] = sub_1891E0910;
      aBlock[3] = &block_descriptor_12;
      uint64_t v28 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      xpc_connection_send_message_with_reply(v26, v24, v31, v28);
      _Block_release(v28);
      swift_release();
      swift_release();
      return swift_unknownObjectRelease();
    }
  }

  else
  {
    sub_1891E24B8();
    uint64_t v22 = swift_allocError();
    *uint64_t v23 = v18;
    *os_log_type_t v14 = v22;
    swift_storeEnumTagMultiPayload();
    sub_1891E19D8((uint64_t)v14, v33, a4);
    swift_release();
    swift_release();
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v32 + 8))(v14, v12);
  }

void *sub_1891E0C4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v50 = a4;
  uint64_t v8 = sub_1891F5A0C();
  uint64_t v47 = *(void *)(v8 - 8);
  uint64_t v48 = v8;
  MEMORY[0x1895F8858](v8);
  v46 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C781E20);
  uint64_t v44 = AssociatedTypeWitness;
  uint64_t v11 = sub_1891F5D78();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  v49 = (void **)((char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  MEMORY[0x1895F8858](v13);
  uint64_t v16 = (uint64_t *)((char *)&v41 - v15);
  uint64_t v45 = v4;
  uint64_t v53 = v4;
  uint64_t v17 = type metadata accessor for JQXPCConnection();
  uint64_t v18 = sub_1891E26E8( (unint64_t *)&unk_18C7813E0,  type metadata accessor for JQXPCConnection,  (uint64_t)&protocol conformance descriptor for JQXPCConnection);
  sub_1891EDB3C(a1, v17, a2, v18, a3, (char *)&v52);
  char v19 = v52;
  if (v52 == 12)
  {
    uint64_t v42 = v12;
    uint64_t v20 = v51;
    unint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 64))(a2, a3);
    if (v20) {
      return result;
    }
    uint64_t v51 = 0LL;
    uint64_t v22 = v45;
    xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(v45 + 16), result);
    uint64_t v53 = v22;
    swift_getAssociatedConformanceWitness();
    uint64_t v23 = v50;
    sub_1891EE0B4(v50);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v12 = v42;
  }

  else
  {
    sub_1891E24B8();
    uint64_t v24 = swift_allocError();
    *uint64_t v25 = v19;
    *uint64_t v16 = v24;
    swift_storeEnumTagMultiPayload();
    uint64_t v23 = v50;
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v12 + 32))(v50, v16, v11);
  }

  uint64_t v26 = v49;
  (*(void (**)(void **, uint64_t, uint64_t))(v12 + 16))(v49, v23, v11);
  unint64_t v27 = *v26;
  uint64_t v28 = sub_1891EEAC8();
  uint64_t v30 = v46;
  uint64_t v29 = v47;
  uint64_t v31 = v48;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v46, v28, v48);
  id v32 = v27;
  id v33 = v27;
  uint64_t v34 = (os_log_s *)sub_1891F59F4();
  os_log_type_t v35 = sub_1891F5B44();
  if (os_log_type_enabled(v34, v35))
  {
    char v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    uint64_t v53 = v37;
    *(_DWORD *)char v36 = 136446210;
    uint64_t v52 = (uint64_t)v27;
    id v38 = v27;
    uint64_t v39 = sub_1891F5AA8();
    uint64_t v52 = sub_1891E24FC(v39, v40, &v53);
    sub_1891F5BA4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1891D9000, v34, v35, "Error in response: %{public}s", v36, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E33A4](v37, -1LL, -1LL);
    MEMORY[0x1895E33A4](v36, -1LL, -1LL);

    return (void *)(*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v46, v48);
  }

  else
  {

    return (void *)(*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  }

void sub_1891E1098()
{
}

uint64_t JQXPCConnection.deinit()
{
  return v0;
}

uint64_t JQXPCConnection.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891E10F8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128LL))();
}

uint64_t sub_1891E1120(uint64_t a1)
{
  return JQConnection.description.getter();
}

void *sub_1891E1154()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

id sub_1891E1178()
{
  return *(id *)(v0 + 24);
}

uint64_t JQRemoteXPCConnection.__allocating_init(remoteDevice:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  JQRemoteXPCConnection.init(remoteDevice:)(a1);
  return v2;
}

uint64_t JQRemoteXPCConnection.init(remoteDevice:)(void *a1)
{
  *(void *)(v1 + 16) = a1;
  id v2 = a1;
  sub_1891F4D6C();
  sub_1891F5AB4();
  uint64_t v3 = (void *)remote_device_copy_service();
  swift_release();
  if (v3)
  {
    *(void *)(v1 + 24) = xpc_remote_connection_create_with_remote_service();
    v7[4] = sub_1891E1464;
    v7[5] = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 1107296256LL;
    v7[2] = sub_1891E0910;
    v7[3] = &block_descriptor_15;
    uint64_t v4 = _Block_copy(v7);
    xpc_remote_connection_set_event_handler();
    _Block_release(v4);
    xpc_remote_connection_activate();
  }

  else
  {
    sub_1891E24B8();
    swift_allocError();
    *uint64_t v5 = 0;
    swift_willThrow();

    type metadata accessor for JQRemoteXPCConnection();
    swift_deallocPartialClassInstance();
  }

  return v1;
}

uint64_t JQRemoteXPCConnection.__allocating_init(rxpcConn:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0LL;
  *(void *)(v2 + 24) = a1;
  v6[4] = sub_1891E1464;
  v6[5] = 0LL;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 1107296256LL;
  v6[2] = sub_1891E0910;
  v6[3] = &block_descriptor_18;
  uint64_t v3 = _Block_copy(v6);
  id v4 = a1;
  xpc_remote_connection_set_event_handler();
  _Block_release(v3);
  xpc_remote_connection_activate();

  return v2;
}

uint64_t JQRemoteXPCConnection.init(rxpcConn:)(void *a1)
{
  *(void *)(v1 + 16) = 0LL;
  *(void *)(v1 + 24) = a1;
  v6[4] = sub_1891E1464;
  v6[5] = 0LL;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 1107296256LL;
  v6[2] = sub_1891E0910;
  v6[3] = &block_descriptor_21;
  uint64_t v3 = _Block_copy(v6);
  id v4 = a1;
  xpc_remote_connection_set_event_handler();
  _Block_release(v3);
  xpc_remote_connection_activate();

  return v1;
}

uint64_t sub_1891E1464(uint64_t a1)
{
  uint64_t v2 = sub_1891F5A0C();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = MEMORY[0x1895E3530](a1);
  uint64_t result = sub_1891F5A18();
  if (v6 != result)
  {
    uint64_t v8 = sub_1891EEAC8();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    swift_unknownObjectRetain_n();
    uint64_t v9 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v10 = sub_1891F5B44();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v16 = a1;
      uint64_t v17 = v12;
      *(_DWORD *)uint64_t v11 = 136446210;
      v15[1] = v11 + 4;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
      uint64_t v13 = sub_1891F5AA8();
      uint64_t v16 = sub_1891E24FC(v13, v14, &v17);
      sub_1891F5BA4();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1891D9000, v9, v10, "Unexpected XPC: %{public}s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v12, -1LL, -1LL);
      MEMORY[0x1895E33A4](v11, -1LL, -1LL);
    }

    else
    {

      swift_unknownObjectRelease_n();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  return result;
}

uint64_t sub_1891E165C()
{
  uint64_t v0 = sub_1891F5A78();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1891E23FC();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x18961B6D0], v0);
  uint64_t v4 = sub_1891F5B8C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t sub_1891E1700( uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v28 = a2;
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C781E20);
  uint64_t v12 = sub_1891F5D78();
  uint64_t v29 = *(void *)(v12 - 8);
  MEMORY[0x1895F8858](v12);
  unint64_t v14 = (uint64_t *)((char *)&v26 - v13);
  uint64_t v15 = (void *)swift_allocObject();
  void v15[2] = a5;
  v15[3] = a6;
  uint64_t v30 = a3;
  _DWORD v15[4] = a3;
  v15[5] = a4;
  uint64_t v27 = v6;
  aBlock[0] = v6;
  uint64_t v16 = type metadata accessor for JQRemoteXPCConnection();
  uint64_t v17 = sub_1891E26E8( &qword_18C7813F0,  type metadata accessor for JQRemoteXPCConnection,  (uint64_t)&protocol conformance descriptor for JQRemoteXPCConnection);
  swift_retain_n();
  sub_1891EDB3C(a1, v16, a5, v17, a6, &v33);
  char v18 = v33;
  if (v33 == 12)
  {
    uint64_t v19 = v31;
    (*(void (**)(uint64_t, uint64_t))(a6 + 64))(a5, a6);
    if (v19)
    {
      swift_release();
      return swift_release();
    }

    else
    {
      uint64_t v23 = v27;
      uint64_t v24 = (void *)swift_allocObject();
      v24[2] = a5;
      v24[3] = a6;
      v24[4] = sub_1891E2DF8;
      v24[5] = v15;
      v24[6] = v23;
      aBlock[4] = sub_1891E261C;
      aBlock[5] = v24;
      aBlock[0] = MEMORY[0x1895F87A8];
      aBlock[1] = 1107296256LL;
      aBlock[2] = sub_1891E0910;
      aBlock[3] = &block_descriptor_30;
      uint64_t v25 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      xpc_remote_connection_send_message_with_reply();
      _Block_release(v25);
      swift_release();
      swift_release();
      return swift_unknownObjectRelease();
    }
  }

  else
  {
    sub_1891E24B8();
    uint64_t v21 = swift_allocError();
    *uint64_t v22 = v18;
    *unint64_t v14 = v21;
    swift_storeEnumTagMultiPayload();
    sub_1891E19D8((uint64_t)v14, v30, a4);
    swift_release();
    swift_release();
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v29 + 8))(v14, v12);
  }

uint64_t sub_1891E19D8(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v6 = sub_1891F5A0C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C781E20);
  uint64_t v10 = sub_1891F5D78();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](v10);
  uint64_t v13 = (void **)((char *)&v26 - v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v26 - v12, a1, v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v28 = a1;
    uint64_t v29 = a3;
    unint64_t v14 = *v13;
    uint64_t v15 = sub_1891EEAC8();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v15, v6);
    id v16 = v14;
    id v17 = v14;
    char v18 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v19 = sub_1891F5B44();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v30 = (uint64_t)v14;
      uint64_t v31 = v21;
      uint64_t v27 = a2;
      *(_DWORD *)uint64_t v20 = 136446210;
      uint64_t v26 = v20 + 4;
      id v22 = v14;
      uint64_t v23 = sub_1891F5AA8();
      uint64_t v30 = sub_1891E24FC(v23, v24, &v31);
      a2 = v27;
      sub_1891F5BA4();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1891D9000, v18, v19, "Error in response: %{public}s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v21, -1LL, -1LL);
      MEMORY[0x1895E33A4](v20, -1LL, -1LL);
    }

    else
    {
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    a1 = v28;
  }

  else
  {
    (*(void (**)(void **, uint64_t))(v11 + 8))(v13, v10);
  }

  return a2(a1);
}

uint64_t sub_1891E1CA8( uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void), unint64_t *a8, uint64_t a9)
{
  os_log_type_t v19 = a2;
  uint64_t v20 = a3;
  uint64_t v18 = a1;
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C781E20);
  uint64_t v12 = sub_1891F5D78();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  id v16 = (char *)&v18 - v15;
  uint64_t v21 = a4;
  ((void (*)(uint64_t))a7)(v14);
  sub_1891E26E8(a8, a7, a9);
  swift_getAssociatedConformanceWitness();
  sub_1891EE0B4((uint64_t)v16);
  v19(v16);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v12);
}

uint64_t sub_1891E1DFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v50 = a4;
  uint64_t v8 = sub_1891F5A0C();
  uint64_t v47 = *(void *)(v8 - 8);
  uint64_t v48 = v8;
  MEMORY[0x1895F8858](v8);
  v46 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C781E20);
  uint64_t v44 = AssociatedTypeWitness;
  uint64_t v11 = sub_1891F5D78();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  v49 = (void **)((char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  MEMORY[0x1895F8858](v13);
  id v16 = (uint64_t *)((char *)&v41 - v15);
  uint64_t v45 = v4;
  uint64_t v53 = v4;
  uint64_t v17 = type metadata accessor for JQRemoteXPCConnection();
  uint64_t v18 = sub_1891E26E8( &qword_18C7813F0,  type metadata accessor for JQRemoteXPCConnection,  (uint64_t)&protocol conformance descriptor for JQRemoteXPCConnection);
  sub_1891EDB3C(a1, v17, a2, v18, a3, (char *)&v52);
  char v19 = v52;
  if (v52 == 12)
  {
    uint64_t v42 = v12;
    uint64_t v20 = v51;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 64))(a2, a3);
    if (v20) {
      return result;
    }
    uint64_t v51 = 0LL;
    uint64_t v22 = v45;
    xpc_remote_connection_send_message_with_reply_sync();
    uint64_t v53 = v22;
    swift_getAssociatedConformanceWitness();
    uint64_t v23 = v50;
    sub_1891EE0B4(v50);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v12 = v42;
  }

  else
  {
    sub_1891E24B8();
    uint64_t v24 = swift_allocError();
    *uint64_t v25 = v19;
    *id v16 = v24;
    swift_storeEnumTagMultiPayload();
    uint64_t v23 = v50;
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v12 + 32))(v50, v16, v11);
  }

  uint64_t v26 = v49;
  (*(void (**)(void **, uint64_t, uint64_t))(v12 + 16))(v49, v23, v11);
  uint64_t v27 = *v26;
  uint64_t v28 = sub_1891EEAC8();
  uint64_t v30 = v46;
  uint64_t v29 = v47;
  uint64_t v31 = v48;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v46, v28, v48);
  id v32 = v27;
  id v33 = v27;
  uint64_t v34 = (os_log_s *)sub_1891F59F4();
  os_log_type_t v35 = sub_1891F5B44();
  if (os_log_type_enabled(v34, v35))
  {
    char v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    uint64_t v53 = v37;
    *(_DWORD *)char v36 = 136446210;
    uint64_t v52 = (uint64_t)v27;
    id v38 = v27;
    uint64_t v39 = sub_1891F5AA8();
    uint64_t v52 = sub_1891E24FC(v39, v40, &v53);
    sub_1891F5BA4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1891D9000, v34, v35, "Error in response: %{public}s", v36, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E33A4](v37, -1LL, -1LL);
    MEMORY[0x1895E33A4](v36, -1LL, -1LL);

    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v46, v48);
  }

  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  }

uint64_t sub_1891E2248()
{
  return xpc_remote_connection_cancel();
}

id *JQRemoteXPCConnection.deinit()
{
  return v0;
}

uint64_t JQRemoteXPCConnection.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891E22B8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (!v1) {
    return sub_1891F5DD8();
  }
  id v2 = v1;
  uint64_t v4 = sub_1891F5DD8();
  sub_1891F5AC0();
  remote_device_get_name();
  sub_1891F5ACC();
  sub_1891F5AC0();
  swift_bridgeObjectRelease();
  sub_1891F5AC0();

  return v4;
}

uint64_t sub_1891E235C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120LL))();
}

uint64_t sub_1891E2384()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128LL))();
}

uint64_t sub_1891E23AC()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136LL))();
}

uint64_t sub_1891E23D4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144LL))();
}

unint64_t sub_1891E23FC()
{
  unint64_t result = qword_18C4FF2B0;
  if (!qword_18C4FF2B0)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C4FF2B0);
  }

  return result;
}

uint64_t sub_1891E2438()
{
  return swift_deallocObject();
}

uint64_t sub_1891E245C(uint64_t a1)
{
  return sub_1891E19D8(a1, *(uint64_t (**)(void))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t type metadata accessor for JQXPCConnection()
{
  return objc_opt_self();
}

uint64_t sub_1891E249C(uint64_t a1)
{
  return sub_1891E2638( a1,  type metadata accessor for JQXPCConnection,  (unint64_t *)&unk_18C7813E0,  (uint64_t)&protocol conformance descriptor for JQXPCConnection);
}

unint64_t sub_1891E24B8()
{
  unint64_t result = qword_18C7816E0;
  if (!qword_18C7816E0)
  {
    unint64_t result = MEMORY[0x1895E3314](&protocol conformance descriptor for JQError, &type metadata for JQError);
    atomic_store(result, (unint64_t *)&qword_18C7816E0);
  }

  return result;
}

uint64_t sub_1891E24FC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1891E2838(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1891E29F0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = MEMORY[0x1896191F8];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1891E29F0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain();
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t type metadata accessor for JQRemoteXPCConnection()
{
  return objc_opt_self();
}

uint64_t objectdestroy_8Tm()
{
  return swift_deallocObject();
}

uint64_t sub_1891E261C(uint64_t a1)
{
  return sub_1891E2638( a1,  type metadata accessor for JQRemoteXPCConnection,  &qword_18C7813F0,  (uint64_t)&protocol conformance descriptor for JQRemoteXPCConnection);
}

uint64_t sub_1891E2638(uint64_t a1, uint64_t (*a2)(void), unint64_t *a3, uint64_t a4)
{
  return sub_1891E1CA8( a1,  *(void (**)(char *))(v4 + 32),  *(void *)(v4 + 40),  *(void *)(v4 + 48),  *(void *)(v4 + 16),  *(void *)(v4 + 24),  a2,  a3,  a4);
}

uint64_t sub_1891E2670(uint64_t a1)
{
  uint64_t result = sub_1891E26E8( &qword_18C7813F8,  type metadata accessor for JQXPCConnection,  (uint64_t)&protocol conformance descriptor for JQXPCConnection);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1891E26AC(uint64_t a1)
{
  uint64_t result = sub_1891E26E8( (unint64_t *)&unk_18C781400,  type metadata accessor for JQRemoteXPCConnection,  (uint64_t)&protocol conformance descriptor for JQRemoteXPCConnection);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1891E26E8(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2();
    uint64_t result = MEMORY[0x1895E3314](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t dispatch thunk of JQConnection.send<A>(request:on:completion:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 16))();
}

uint64_t dispatch thunk of JQConnection.sendSync<A>(request:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of JQConnection.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t method lookup function for JQXPCConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQXPCConnection.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of JQXPCConnection.__allocating_init(withEndpoint:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of JQXPCConnection.send<A>(request:on:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112LL))();
}

uint64_t dispatch thunk of JQXPCConnection.sendSync<A>(request:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120LL))();
}

uint64_t dispatch thunk of JQXPCConnection.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128LL))();
}

uint64_t method lookup function for JQRemoteXPCConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQRemoteXPCConnection.__allocating_init(remoteDevice:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of JQRemoteXPCConnection.__allocating_init(rxpcConn:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of JQRemoteXPCConnection.send<A>(request:on:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120LL))();
}

uint64_t dispatch thunk of JQRemoteXPCConnection.sendSync<A>(request:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128LL))();
}

uint64_t dispatch thunk of JQRemoteXPCConnection.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t dispatch thunk of JQRemoteXPCConnection.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144LL))();
}

uint64_t sub_1891E2838(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1891F5BB0();
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_1891E2A2C(a5, a6);
    *a1 = v12;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = sub_1891F5C10();
  if (!v8)
  {
    sub_1891F5C28();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1891F5C40();
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1891E29F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1891E2A2C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1891E2AC0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1891E2C98(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1891E2C98(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1891E2AC0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
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
      unint64_t v3 = sub_1891E2C34(v2, 0LL);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1891F5BD4();
      if ((v6 & 1) != 0) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1891F5C28();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1891F5AD8();
      if (!v2) {
        return MEMORY[0x18961AFE8];
      }
    }

    sub_1891F5C40();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1891F5C28();
    __break(1u);
  }

  else
  {
    return MEMORY[0x18961AFE8];
  }

  return result;
}

void *sub_1891E2C34(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C781550);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1891E2C98(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C781550);
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
  uint64_t v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }

LABEL_30:
  uint64_t result = sub_1891F5C40();
  __break(1u);
  return result;
}

void sub_1891E2DE8()
{
}

BOOL static JQError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t JQError.hash(into:)()
{
  return sub_1891F5D60();
}

uint64_t sub_1891E2E74(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1891E2EB4 + 4 * byte_1891F75C0[a1]))( 0x4E65636976726573LL,  0xEF646E756F46746FLL);
}

uint64_t sub_1891E2EB4()
{
  return 0x4D64696C61766E69LL;
}

uint64_t sub_1891E2ED8()
{
  return 0x456E776F6E6B6E75LL;
}

uint64_t sub_1891E2EF8()
{
  return 0x696D726550746F6ELL;
}

uint64_t sub_1891E2F18()
{
  return 0x656C706D49746F6ELL;
}

unint64_t sub_1891E2F3C()
{
  return 0xD000000000000012LL;
}

unint64_t sub_1891E2F80()
{
  return 0xD000000000000015LL;
}

uint64_t sub_1891E2F8C()
{
  return 0x5364696C61766E69LL;
}

uint64_t sub_1891E2FAC()
{
  return 0x74754F64656D6974LL;
}

uint64_t sub_1891E2FE0()
{
  return sub_1891E2E74(*v0);
}

uint64_t sub_1891E2FE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1891E54C8(a1, a2);
  *a3 = result;
  return result;
}

void sub_1891E300C(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_1891E3018()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E3040()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E3068()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E3090()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E30B8()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E30E0()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E3108()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E3130()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E3158()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E3180()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E31A8()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E31D0()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E31F8()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E3220()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E3248()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E3270()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E3298()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E32C0()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E32E8()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E3310()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E3338()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E3360()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E3388()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E33B0()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E33D8()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E3400()
{
  return sub_1891F5DCC();
}

void JQError.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7815C0);
  uint64_t v52 = *(void *)(v3 - 8);
  uint64_t v53 = v3;
  MEMORY[0x1895F8858](v3);
  uint64_t v51 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7815C8);
  uint64_t v49 = *(void *)(v5 - 8);
  uint64_t v50 = v5;
  MEMORY[0x1895F8858](v5);
  uint64_t v48 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7815D0);
  uint64_t v46 = *(void *)(v7 - 8);
  uint64_t v47 = v7;
  MEMORY[0x1895F8858](v7);
  uint64_t v45 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7815D8);
  uint64_t v43 = *(void *)(v9 - 8);
  uint64_t v44 = v9;
  MEMORY[0x1895F8858](v9);
  uint64_t v42 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7815E0);
  uint64_t v40 = *(void *)(v11 - 8);
  uint64_t v41 = v11;
  MEMORY[0x1895F8858](v11);
  uint64_t v39 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7815E8);
  uint64_t v37 = *(void *)(v38 - 8);
  MEMORY[0x1895F8858](v38);
  char v36 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7815F0);
  uint64_t v34 = *(void *)(v35 - 8);
  MEMORY[0x1895F8858](v35);
  id v33 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7815F8);
  uint64_t v31 = *(void *)(v32 - 8);
  MEMORY[0x1895F8858](v32);
  uint64_t v30 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781600);
  uint64_t v28 = *(void *)(v29 - 8);
  MEMORY[0x1895F8858](v29);
  uint64_t v27 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781608);
  uint64_t v25 = *(void *)(v26 - 8);
  MEMORY[0x1895F8858](v26);
  uint64_t v24 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781610);
  uint64_t v22 = *(void *)(v23 - 8);
  MEMORY[0x1895F8858](v23);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781618);
  MEMORY[0x1895F8858](v18);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781620);
  uint64_t v54 = *(void *)(v56 - 8);
  MEMORY[0x1895F8858](v56);
  uint64_t v20 = (char *)&v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891E3BCC();
  v55 = v20;
  sub_1891F5D90();
  __asm { BR              X9 }

uint64_t sub_1891E3838()
{
  *(_BYTE *)(v3 - 92) = 0;
  sub_1891E3EFC();
  uint64_t v5 = *(void *)(v3 - 112);
  uint64_t v4 = *(void *)(v3 - 104);
  sub_1891F5CB8();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 120) + 8LL))(v5, v4);
}

unint64_t sub_1891E3BCC()
{
  unint64_t result = qword_18C7847B0;
  if (!qword_18C7847B0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8108, &type metadata for JQError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7847B0);
  }

  return result;
}

unint64_t sub_1891E3C10()
{
  unint64_t result = qword_18C7847B8;
  if (!qword_18C7847B8)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F80B8, &type metadata for JQError.TaskRegisteredTooLateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7847B8);
  }

  return result;
}

unint64_t sub_1891E3C54()
{
  unint64_t result = qword_18C7847C0;
  if (!qword_18C7847C0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8068, &type metadata for JQError.TimedOutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7847C0);
  }

  return result;
}

unint64_t sub_1891E3C98()
{
  unint64_t result = qword_18C7847C8;
  if (!qword_18C7847C8)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8018, &type metadata for JQError.InvalidStateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7847C8);
  }

  return result;
}

unint64_t sub_1891E3CDC()
{
  unint64_t result = qword_18C7847D0;
  if (!qword_18C7847D0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7FC8, &type metadata for JQError.ConnectionTerminatingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7847D0);
  }

  return result;
}

unint64_t sub_1891E3D20()
{
  unint64_t result = qword_18C7847D8;
  if (!qword_18C7847D8)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7F78, &type metadata for JQError.ConnectionInvalidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7847D8);
  }

  return result;
}

unint64_t sub_1891E3D64()
{
  unint64_t result = qword_18C7847E0;
  if (!qword_18C7847E0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7F28, &type metadata for JQError.ConnectionInterruptedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7847E0);
  }

  return result;
}

unint64_t sub_1891E3DA8()
{
  unint64_t result = qword_18C7847E8;
  if (!qword_18C7847E8)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7ED8, &type metadata for JQError.SubscriptionFailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7847E8);
  }

  return result;
}

unint64_t sub_1891E3DEC()
{
  unint64_t result = qword_18C7847F0;
  if (!qword_18C7847F0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7E88, &type metadata for JQError.NotImplementedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7847F0);
  }

  return result;
}

unint64_t sub_1891E3E30()
{
  unint64_t result = qword_18C7847F8;
  if (!qword_18C7847F8)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7E38, &type metadata for JQError.NotPermittedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7847F8);
  }

  return result;
}

unint64_t sub_1891E3E74()
{
  unint64_t result = qword_18C784800;
  if (!qword_18C784800)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7DE8, &type metadata for JQError.UnknownErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C784800);
  }

  return result;
}

unint64_t sub_1891E3EB8()
{
  unint64_t result = qword_18C784808;
  if (!qword_18C784808)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7D98, &type metadata for JQError.InvalidMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C784808);
  }

  return result;
}

unint64_t sub_1891E3EFC()
{
  unint64_t result = qword_18C784810[0];
  if (!qword_18C784810[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7D48, &type metadata for JQError.ServiceNotFoundCodingKeys);
    atomic_store(result, qword_18C784810);
  }

  return result;
}

uint64_t JQError.hashValue.getter()
{
  return sub_1891F5D6C();
}

uint64_t JQError.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v65 = a2;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781628);
  uint64_t v56 = *(void *)(v69 - 8);
  MEMORY[0x1895F8858](v69);
  v64 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781630);
  uint64_t v54 = *(void *)(v4 - 8);
  uint64_t v55 = v4;
  MEMORY[0x1895F8858](v4);
  v63 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781638);
  uint64_t v52 = *(void *)(v6 - 8);
  uint64_t v53 = v6;
  MEMORY[0x1895F8858](v6);
  v62 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781640);
  uint64_t v36 = *(void *)(v37 - 8);
  MEMORY[0x1895F8858](v37);
  v61 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781648);
  uint64_t v49 = *(void *)(v51 - 8);
  MEMORY[0x1895F8858](v51);
  v68 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781650);
  uint64_t v46 = *(void *)(v50 - 8);
  MEMORY[0x1895F8858](v50);
  v59 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781658);
  uint64_t v47 = *(void *)(v48 - 8);
  MEMORY[0x1895F8858](v48);
  v67 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781660);
  uint64_t v44 = *(void *)(v45 - 8);
  MEMORY[0x1895F8858](v45);
  v60 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781668);
  uint64_t v42 = *(void *)(v43 - 8);
  MEMORY[0x1895F8858](v43);
  v66 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781670);
  uint64_t v40 = *(void *)(v41 - 8);
  MEMORY[0x1895F8858](v41);
  v58 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781678);
  uint64_t v38 = *(void *)(v39 - 8);
  MEMORY[0x1895F8858](v39);
  v57 = (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781680);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1895F8858](v16);
  uint64_t v19 = (char *)v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781688);
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x1895F8858](v20);
  uint64_t v23 = (char *)v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = a1[3];
  v70 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v24);
  sub_1891E3BCC();
  uint64_t v25 = v71;
  sub_1891F5D84();
  if (!v25)
  {
    v33[3] = v19;
    v33[1] = v17;
    v33[2] = v16;
    uint64_t v71 = v21;
    uint64_t v34 = v20;
    uint64_t v35 = v23;
    uint64_t v26 = sub_1891F5CAC();
    if (*(void *)(v26 + 16) == 1LL) {
      __asm { BR              X9 }
    }

    uint64_t v27 = sub_1891F5C04();
    swift_allocError();
    uint64_t v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C7816D0);
    *uint64_t v29 = &type metadata for JQError;
    uint64_t v30 = v34;
    uint64_t v31 = v35;
    sub_1891F5C58();
    sub_1891F5BF8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v27 - 8) + 104LL))( v29,  *MEMORY[0x189619358],  v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v31, v30);
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v70);
}

unint64_t sub_1891E4A80()
{
  unint64_t result = qword_18C781690;
  if (!qword_18C781690)
  {
    unint64_t result = MEMORY[0x1895E3314](&protocol conformance descriptor for JQError, &type metadata for JQError);
    atomic_store(result, (unint64_t *)&qword_18C781690);
  }

  return result;
}

uint64_t sub_1891E4AD4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return JQError.init(from:)(a1, a2);
}

void sub_1891E4AE8(void *a1)
{
}

ValueMetadata *type metadata accessor for JQError()
{
  return &type metadata for JQError;
}

uint64_t _s13JobQuiescence7JQErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }

uint64_t _s13JobQuiescence7JQErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF4) {
    return ((uint64_t (*)(void))((char *)&loc_1891E4BF0 + 4 * byte_1891F75F5[v4]))();
  }
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_1891E4C24 + 4 * byte_1891F75F0[v4]))();
}

uint64_t sub_1891E4C24(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891E4C2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891E4C34LL);
  }
  return result;
}

uint64_t sub_1891E4C40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891E4C48LL);
  }
  *(_BYTE *)unint64_t result = a2 + 11;
  return result;
}

uint64_t sub_1891E4C4C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891E4C54(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JQError.CodingKeys()
{
  return &type metadata for JQError.CodingKeys;
}

ValueMetadata *type metadata accessor for JQError.ServiceNotFoundCodingKeys()
{
  return &type metadata for JQError.ServiceNotFoundCodingKeys;
}

ValueMetadata *type metadata accessor for JQError.InvalidMessageCodingKeys()
{
  return &type metadata for JQError.InvalidMessageCodingKeys;
}

ValueMetadata *type metadata accessor for JQError.UnknownErrorCodingKeys()
{
  return &type metadata for JQError.UnknownErrorCodingKeys;
}

ValueMetadata *type metadata accessor for JQError.NotPermittedCodingKeys()
{
  return &type metadata for JQError.NotPermittedCodingKeys;
}

ValueMetadata *type metadata accessor for JQError.NotImplementedCodingKeys()
{
  return &type metadata for JQError.NotImplementedCodingKeys;
}

ValueMetadata *type metadata accessor for JQError.SubscriptionFailedCodingKeys()
{
  return &type metadata for JQError.SubscriptionFailedCodingKeys;
}

ValueMetadata *type metadata accessor for JQError.ConnectionInterruptedCodingKeys()
{
  return &type metadata for JQError.ConnectionInterruptedCodingKeys;
}

ValueMetadata *type metadata accessor for JQError.ConnectionInvalidCodingKeys()
{
  return &type metadata for JQError.ConnectionInvalidCodingKeys;
}

ValueMetadata *type metadata accessor for JQError.ConnectionTerminatingCodingKeys()
{
  return &type metadata for JQError.ConnectionTerminatingCodingKeys;
}

ValueMetadata *type metadata accessor for JQError.InvalidStateCodingKeys()
{
  return &type metadata for JQError.InvalidStateCodingKeys;
}

ValueMetadata *type metadata accessor for JQError.TimedOutCodingKeys()
{
  return &type metadata for JQError.TimedOutCodingKeys;
}

ValueMetadata *type metadata accessor for JQError.TaskRegisteredTooLateCodingKeys()
{
  return &type metadata for JQError.TaskRegisteredTooLateCodingKeys;
}

unint64_t sub_1891E4D34()
{
  unint64_t result = qword_18C7857A0[0];
  if (!qword_18C7857A0[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7D20, &type metadata for JQError.CodingKeys);
    atomic_store(result, qword_18C7857A0);
  }

  return result;
}

unint64_t sub_1891E4D7C()
{
  unint64_t result = qword_18C7858B0;
  if (!qword_18C7858B0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7C40, &type metadata for JQError.ServiceNotFoundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7858B0);
  }

  return result;
}

unint64_t sub_1891E4DC4()
{
  unint64_t result = qword_18C7858B8[0];
  if (!qword_18C7858B8[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7C68, &type metadata for JQError.ServiceNotFoundCodingKeys);
    atomic_store(result, qword_18C7858B8);
  }

  return result;
}

unint64_t sub_1891E4E0C()
{
  unint64_t result = qword_18C785940;
  if (!qword_18C785940)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7BF0, &type metadata for JQError.InvalidMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C785940);
  }

  return result;
}

unint64_t sub_1891E4E54()
{
  unint64_t result = qword_18C785948[0];
  if (!qword_18C785948[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7C18, &type metadata for JQError.InvalidMessageCodingKeys);
    atomic_store(result, qword_18C785948);
  }

  return result;
}

unint64_t sub_1891E4E9C()
{
  unint64_t result = qword_18C7859D0;
  if (!qword_18C7859D0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7BA0, &type metadata for JQError.UnknownErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7859D0);
  }

  return result;
}

unint64_t sub_1891E4EE4()
{
  unint64_t result = qword_18C7859D8[0];
  if (!qword_18C7859D8[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7BC8, &type metadata for JQError.UnknownErrorCodingKeys);
    atomic_store(result, qword_18C7859D8);
  }

  return result;
}

unint64_t sub_1891E4F2C()
{
  unint64_t result = qword_18C785A60;
  if (!qword_18C785A60)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7B50, &type metadata for JQError.NotPermittedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C785A60);
  }

  return result;
}

unint64_t sub_1891E4F74()
{
  unint64_t result = qword_18C785A68[0];
  if (!qword_18C785A68[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7B78, &type metadata for JQError.NotPermittedCodingKeys);
    atomic_store(result, qword_18C785A68);
  }

  return result;
}

unint64_t sub_1891E4FBC()
{
  unint64_t result = qword_18C785AF0;
  if (!qword_18C785AF0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7B00, &type metadata for JQError.NotImplementedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C785AF0);
  }

  return result;
}

unint64_t sub_1891E5004()
{
  unint64_t result = qword_18C785AF8[0];
  if (!qword_18C785AF8[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7B28, &type metadata for JQError.NotImplementedCodingKeys);
    atomic_store(result, qword_18C785AF8);
  }

  return result;
}

unint64_t sub_1891E504C()
{
  unint64_t result = qword_18C785B80;
  if (!qword_18C785B80)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7AB0, &type metadata for JQError.SubscriptionFailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C785B80);
  }

  return result;
}

unint64_t sub_1891E5094()
{
  unint64_t result = qword_18C785B88[0];
  if (!qword_18C785B88[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7AD8, &type metadata for JQError.SubscriptionFailedCodingKeys);
    atomic_store(result, qword_18C785B88);
  }

  return result;
}

unint64_t sub_1891E50DC()
{
  unint64_t result = qword_18C785C10;
  if (!qword_18C785C10)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7A60, &type metadata for JQError.ConnectionInterruptedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C785C10);
  }

  return result;
}

unint64_t sub_1891E5124()
{
  unint64_t result = qword_18C785C18[0];
  if (!qword_18C785C18[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7A88, &type metadata for JQError.ConnectionInterruptedCodingKeys);
    atomic_store(result, qword_18C785C18);
  }

  return result;
}

unint64_t sub_1891E516C()
{
  unint64_t result = qword_18C785CA0;
  if (!qword_18C785CA0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7A10, &type metadata for JQError.ConnectionInvalidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C785CA0);
  }

  return result;
}

unint64_t sub_1891E51B4()
{
  unint64_t result = qword_18C785CA8[0];
  if (!qword_18C785CA8[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7A38, &type metadata for JQError.ConnectionInvalidCodingKeys);
    atomic_store(result, qword_18C785CA8);
  }

  return result;
}

unint64_t sub_1891E51FC()
{
  unint64_t result = qword_18C785D30;
  if (!qword_18C785D30)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F79C0, &type metadata for JQError.ConnectionTerminatingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C785D30);
  }

  return result;
}

unint64_t sub_1891E5244()
{
  unint64_t result = qword_18C785D38[0];
  if (!qword_18C785D38[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F79E8, &type metadata for JQError.ConnectionTerminatingCodingKeys);
    atomic_store(result, qword_18C785D38);
  }

  return result;
}

unint64_t sub_1891E528C()
{
  unint64_t result = qword_18C785DC0;
  if (!qword_18C785DC0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7970, &type metadata for JQError.InvalidStateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C785DC0);
  }

  return result;
}

unint64_t sub_1891E52D4()
{
  unint64_t result = qword_18C785DC8[0];
  if (!qword_18C785DC8[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7998, &type metadata for JQError.InvalidStateCodingKeys);
    atomic_store(result, qword_18C785DC8);
  }

  return result;
}

unint64_t sub_1891E531C()
{
  unint64_t result = qword_18C785E50;
  if (!qword_18C785E50)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7920, &type metadata for JQError.TimedOutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C785E50);
  }

  return result;
}

unint64_t sub_1891E5364()
{
  unint64_t result = qword_18C785E58[0];
  if (!qword_18C785E58[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7948, &type metadata for JQError.TimedOutCodingKeys);
    atomic_store(result, qword_18C785E58);
  }

  return result;
}

unint64_t sub_1891E53AC()
{
  unint64_t result = qword_18C785EE0;
  if (!qword_18C785EE0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F78D0, &type metadata for JQError.TaskRegisteredTooLateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C785EE0);
  }

  return result;
}

unint64_t sub_1891E53F4()
{
  unint64_t result = qword_18C785EE8[0];
  if (!qword_18C785EE8[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F78F8, &type metadata for JQError.TaskRegisteredTooLateCodingKeys);
    atomic_store(result, qword_18C785EE8);
  }

  return result;
}

unint64_t sub_1891E543C()
{
  unint64_t result = qword_18C785F70;
  if (!qword_18C785F70)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7C90, &type metadata for JQError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C785F70);
  }

  return result;
}

unint64_t sub_1891E5484()
{
  unint64_t result = qword_18C785F78;
  if (!qword_18C785F78)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F7CB8, &type metadata for JQError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C785F78);
  }

  return result;
}

uint64_t sub_1891E54C8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4E65636976726573LL && a2 == 0xEF646E756F46746FLL;
  if (v2 || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x4D64696C61766E69LL && a2 == 0xEE00656761737365LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else if (a1 == 0x456E776F6E6B6E75LL && a2 == 0xEC000000726F7272LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2LL;
  }

  else if (a1 == 0x696D726550746F6ELL && a2 == 0xEC00000064657474LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3LL;
  }

  else if (a1 == 0x656C706D49746F6ELL && a2 == 0xEE006465746E656DLL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4LL;
  }

  else if (a1 == 0xD000000000000012LL && a2 == 0x80000001891FAD50LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5LL;
  }

  else if (a1 == 0xD000000000000015LL && a2 == 0x80000001891FAD70LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6LL;
  }

  else if (a1 == 0xD000000000000011LL && a2 == 0x80000001891FAD90LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7LL;
  }

  else if (a1 == 0xD000000000000015LL && a2 == 0x80000001891FADB0LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8LL;
  }

  else if (a1 == 0x5364696C61766E69LL && a2 == 0xEC00000065746174LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9LL;
  }

  else if (a1 == 0x74754F64656D6974LL && a2 == 0xE800000000000000LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10LL;
  }

  else if (a1 == 0xD000000000000015LL && a2 == 0x80000001891FADD0LL)
  {
    swift_bridgeObjectRelease();
    return 11LL;
  }

  else
  {
    char v6 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 11LL;
    }
    else {
      return 12LL;
    }
  }

BOOL static JQNotificationType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t JQNotificationType.hash(into:)()
{
  return sub_1891F5D60();
}

unint64_t sub_1891E5A64()
{
  if (*v0) {
    return 0xD000000000000012LL;
  }
  else {
    return 0xD000000000000011LL;
  }
}

uint64_t sub_1891E5AA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1891E996C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1891E5AC4()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E5AEC()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E5B14()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E5B3C()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891E5B64()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891E5B8C()
{
  return sub_1891F5DCC();
}

uint64_t JQNotificationType.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7816A0);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x1895F8858](v3);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7816A8);
  uint64_t v14 = *(void *)(v6 - 8);
  uint64_t v15 = v6;
  MEMORY[0x1895F8858](v6);
  int v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7816B0);
  uint64_t v18 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891E5D88();
  sub_1891F5D90();
  if ((v12 & 1) != 0)
  {
    char v20 = 1;
    sub_1891E5DCC();
    sub_1891F5CB8();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }

  else
  {
    char v19 = 0;
    sub_1891E5E10();
    sub_1891F5CB8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_1891E5D88()
{
  unint64_t result = qword_18C786000;
  if (!qword_18C786000)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8558, &type metadata for JQNotificationType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C786000);
  }

  return result;
}

unint64_t sub_1891E5DCC()
{
  unint64_t result = qword_18C786008;
  if (!qword_18C786008)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8508, &type metadata for JQNotificationType.QuiesceImmediatelyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C786008);
  }

  return result;
}

unint64_t sub_1891E5E10()
{
  unint64_t result = qword_18C786010[0];
  if (!qword_18C786010[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F84B8, &type metadata for JQNotificationType.QuiesceEventuallyCodingKeys);
    atomic_store(result, qword_18C786010);
  }

  return result;
}

uint64_t JQNotificationType.hashValue.getter()
{
  return sub_1891F5D6C();
}

uint64_t JQNotificationType.init(from:)@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7816B8);
  uint64_t v32 = *(void *)(v29 - 8);
  MEMORY[0x1895F8858](v29);
  uint64_t v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7816C0);
  uint64_t v4 = *(void *)(v28 - 8);
  MEMORY[0x1895F8858](v28);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7816C8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891E5D88();
  uint64_t v11 = v33;
  sub_1891F5D84();
  if (v11) {
    goto LABEL_7;
  }
  uint64_t v26 = v4;
  uint64_t v27 = a1;
  char v12 = v31;
  uint64_t v13 = v32;
  uint64_t v33 = v8;
  uint64_t v14 = sub_1891F5CAC();
  uint64_t v15 = v7;
  if (*(void *)(v14 + 16) != 1LL)
  {
    uint64_t v19 = sub_1891F5C04();
    swift_allocError();
    uint64_t v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C7816D0);
    *uint64_t v21 = &type metadata for JQNotificationType;
    sub_1891F5C58();
    sub_1891F5BF8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104LL))( v21,  *MEMORY[0x189619358],  v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    uint64_t v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }

  char v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    char v35 = 1;
    sub_1891E5DCC();
    sub_1891F5C4C();
    uint64_t v17 = v33;
    uint64_t v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    char v16 = v28;
  }

  else
  {
    char v34 = 0;
    sub_1891E5E10();
    uint64_t v22 = v6;
    sub_1891F5C4C();
    uint64_t v23 = v33;
    uint64_t v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }

  *uint64_t v18 = v16;
  uint64_t v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

uint64_t sub_1891E61F0@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  return JQNotificationType.init(from:)(a1, a2);
}

uint64_t sub_1891E6204(void *a1)
{
  return JQNotificationType.encode(to:)(a1);
}

uint64_t sub_1891E6218(void *a1, void (*a2)(uint64_t *, unint64_t *))
{
  uint64_t v48 = sub_1891F5A0C();
  uint64_t v4 = *(void *)(v48 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](v48);
  uint64_t v6 = MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)v43 - v7;
  uint64_t v9 = MEMORY[0x1895F8858](v6);
  uint64_t v11 = (char *)v43 - v10;
  MEMORY[0x1895F8858](v9);
  uint64_t v13 = (char *)v43 - v12;
  static JQRequestCodable.from(xpc:)(a1);
  uint64_t v47 = 0LL;
  unint64_t v14 = v50;
  if (v50 >> 61 == 5)
  {
    swift_retain();
    uint64_t v25 = sub_1891EEAC8();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v11, v25, v48);
    uint64_t v26 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v27 = sub_1891F5B2C();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_1891D9000, v26, v27, "Subscriber got HELLO from server.", v28, 2u);
      MEMORY[0x1895E33A4](v28, -1LL, -1LL);
    }

    swift_release();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v11, v48);
    return swift_release();
  }

  if (v50 >> 61 != 4)
  {
    uint64_t v29 = sub_1891EEAC8();
    uint64_t v30 = v4;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v8, v29, v48);
    swift_unknownObjectRetain_n();
    uint64_t v31 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v32 = sub_1891F5B44();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      unint64_t v50 = v34;
      *(_DWORD *)uint64_t v33 = 136446210;
      uint64_t v46 = (uint64_t)(v33 + 4);
      uint64_t v49 = (uint64_t)a1;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
      uint64_t v35 = sub_1891F5AA8();
      uint64_t v49 = sub_1891E24FC(v35, v36, (uint64_t *)&v50);
      sub_1891F5BA4();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1891D9000, v31, v32, "Subscriber received invalid notification: %{public}s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v34, -1LL, -1LL);
      MEMORY[0x1895E33A4](v33, -1LL, -1LL);
    }

    else
    {

      swift_unknownObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v48);
    LOBYTE(v50) = 1;
    uint64_t v39 = v47;
    xpc_object_t v40 = JQError.asXPC(replyingTo:)(a1);
    if (v39) {
      goto LABEL_21;
    }
    xpc_object_t v38 = v40;
    goto LABEL_16;
  }

  swift_retain_n();
  uint64_t v15 = sub_1891EEAC8();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v13, v15, v48);
  swift_retain_n();
  char v16 = (os_log_s *)sub_1891F59F4();
  os_log_type_t v17 = sub_1891F5B2C();
  int v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v19 = swift_slowAlloc();
    int v45 = v18;
    char v20 = (uint8_t *)v19;
    uint64_t v46 = swift_slowAlloc();
    unint64_t v50 = v46;
    uint64_t v44 = v20;
    *(_DWORD *)char v20 = 136446210;
    v43[1] = v20 + 4;
    LOBYTE(v49) = *(_BYTE *)((v14 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
    uint64_t v21 = sub_1891F5AA8();
    uint64_t v49 = sub_1891E24FC(v21, v22, (uint64_t *)&v50);
    sub_1891F5BA4();
    swift_release_n();
    swift_bridgeObjectRelease();
    uint64_t v23 = v44;
    _os_log_impl( &dword_1891D9000,  v16,  (os_log_type_t)v45,  "Subscriber got quiesce notification '%{public}s' from server.",  v44,  0xCu);
    uint64_t v24 = v46;
    swift_arrayDestroy();
    MEMORY[0x1895E33A4](v24, -1LL, -1LL);
    MEMORY[0x1895E33A4](v23, -1LL, -1LL);
  }

  else
  {

    swift_release_n();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v13, v48);
  LOBYTE(v49) = *(_BYTE *)((v14 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
  unint64_t v50 = *(void *)((v14 & 0x1FFFFFFFFFFFFFFFLL) + 0x18);
  a2(&v49, &v50);
  type metadata accessor for JQResponseEmpty();
  unint64_t v50 = JQResponseEmpty.__allocating_init()();
  sub_1891EA280( (unint64_t *)&unk_18C781820,  (uint64_t (*)(uint64_t))type metadata accessor for JQResponseEmpty,  (uint64_t)&protocol conformance descriptor for JQResponseEmpty);
  uint64_t v37 = v47;
  xpc_object_t v38 = JQResponse.asXPC(replyingTo:)(a1);
  swift_release();
  swift_release();
  if (!v37)
  {
    swift_release();
LABEL_16:
    swift_unknownObjectRetain();
    uint64_t v41 = xpc_dictionary_get_remote_connection(a1);
    if (v41)
    {
      xpc_connection_send_message(v41, v38);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease_n();
      return swift_release();
    }

    swift_unknownObjectRelease();
    swift_release();
    __break(1u);
    swift_unexpectedError();
    __break(1u);
  }

  swift_unexpectedError();
  __break(1u);
LABEL_21:
  swift_release();
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1891E6A24()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1891E6A50()
{
  return swift_retain();
}

uint64_t sub_1891E6A58()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1891E6A60()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t sub_1891E6A90(char a1)
{
  uint64_t result = swift_beginAccess();
  *(_BYTE *)(v1 + 48) = a1;
  return result;
}

uint64_t (*sub_1891E6ACC())()
{
  return j__swift_endAccess;
}

uint64_t sub_1891E6B0C(dispatch_queue_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = sub_1891F5A0C();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_1891EEAC8();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v16, v11);
  os_log_type_t v17 = (os_log_s *)sub_1891F59F4();
  os_log_type_t v18 = sub_1891F5B50();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_1891D9000, v17, v18, "BUG IN JOBQUIESCENCE CLIENT: called register more than once", v19, 2u);
    MEMORY[0x1895E33A4](v19, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  sub_1891E24B8();
  swift_allocError();
  *char v20 = 9;
  return swift_willThrow();
}

uint64_t sub_1891E6C98(dispatch_queue_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v25)(id *__return_ptr, uint64_t *, uint64_t, uint64_t);
  uint64_t v26;
  os_log_s *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  os_log_s *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  os_log_s *v42;
  void *v43;
  char v44;
  _BYTE *v45;
  uint64_t v47;
  char *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  os_log_s *v52;
  id aBlock;
  uint64_t v54;
  uint64_t (*v55)(uint64_t);
  void *v56;
  uint64_t (*v57)(uint64_t);
  void *v58;
  uint64_t v59;
  uint64_t v6 = (void *)v5;
  uint64_t v12 = sub_1891F5A0C();
  unint64_t v50 = *(void *)(v12 - 8);
  uint64_t v51 = v12;
  MEMORY[0x1895F8858](v12);
  uint64_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = *(_xpc_connection_s **)(v5 + 40);
  xpc_connection_set_target_queue(v15, a1);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a1;
  v16[3] = v6;
  v16[4] = a2;
  v16[5] = a3;
  v16[6] = a4;
  v16[7] = a5;
  v57 = sub_1891EA274;
  v58 = v16;
  aBlock = (id)MEMORY[0x1895F87A8];
  uint64_t v54 = 1107296256LL;
  uint64_t v55 = sub_1891E0910;
  uint64_t v56 = &block_descriptor_38;
  os_log_type_t v17 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  os_log_type_t v18 = a1;
  swift_retain();
  swift_release();
  xpc_connection_set_event_handler(v15, v17);
  _Block_release(v17);
  xpc_connection_activate(v15);
  uint64_t v19 = type metadata accessor for JQRequestSubscribe();
  xpc_endpoint_t v20 = xpc_endpoint_create(v15);
  uint64_t v22 = v6[2];
  unint64_t v21 = v6[3];
  swift_bridgeObjectRetain();
  uint64_t v23 = JQRequestSubscribe.__allocating_init(endpoint:subscriberName:)((uint64_t)v20, v22, v21);
  uint64_t v24 = v6[4];
  v59 = (uint64_t)v23;
  uint64_t v25 = *(void (**)(id *__return_ptr, uint64_t *, uint64_t, uint64_t))(*(void *)v24 + 120LL);
  uint64_t v26 = sub_1891EA280( (unint64_t *)&unk_18C781A40,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestSubscribe,  (uint64_t)&protocol conformance descriptor for JQRequestSubscribe);
  os_log_type_t v27 = v52;
  v25(&aBlock, &v59, v19, v26);
  if (!v27)
  {
    uint64_t v28 = v14;
    uint64_t v29 = v50;
    uint64_t v30 = v51;
    uint64_t v31 = aBlock;
    if (v54 == 1)
    {
      os_log_type_t v32 = aBlock;
      uint64_t v33 = sub_1891EEAC8();
      (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v28, v33, v30);
      swift_retain();
      sub_1891EA2CC(v31, 1);
      swift_retain();
      sub_1891EA2CC(v31, 1);
      uint64_t v34 = (os_log_s *)sub_1891F59F4();
      uint64_t v35 = sub_1891F5B44();
      uint64_t v52 = v34;
      uint64_t v49 = v35;
      if (os_log_type_enabled(v34, v35))
      {
        unint64_t v36 = swift_slowAlloc();
        uint64_t v48 = v28;
        uint64_t v37 = v36;
        xpc_object_t v38 = (void *)swift_slowAlloc();
        uint64_t v39 = (void *)swift_slowAlloc();
        aBlock = v39;
        *(_DWORD *)uint64_t v37 = 136446466;
        swift_bridgeObjectRetain();
        v59 = sub_1891E24FC(v22, v21, (uint64_t *)&aBlock);
        sub_1891F5BA4();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2112;
        xpc_object_t v40 = v31;
        uint64_t v41 = _swift_stdlib_bridgeErrorToNSError();
        v59 = v41;
        sub_1891F5BA4();
        *xpc_object_t v38 = v41;
        sub_1891EA2C0(v31, 1);
        sub_1891EA2C0(v31, 1);
        uint64_t v42 = v52;
        _os_log_impl( &dword_1891D9000,  v52,  (os_log_type_t)v49,  "Subscriber %{public}s failed to subscribe: %@",  (uint8_t *)v37,  0x16u);
        __swift_instantiateConcreteTypeFromMangledName(qword_18C781830);
        swift_arrayDestroy();
        MEMORY[0x1895E33A4](v38, -1LL, -1LL);
        swift_arrayDestroy();
        MEMORY[0x1895E33A4](v39, -1LL, -1LL);
        MEMORY[0x1895E33A4](v37, -1LL, -1LL);

        (*(void (**)(char *, uint64_t))(v50 + 8))(v48, v51);
      }

      else
      {
        swift_release_n();
        sub_1891EA2C0(v31, 1);
        sub_1891EA2C0(v31, 1);

        (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v51);
      }

      sub_1891E24B8();
      swift_allocError();
      *int v45 = 5;
      swift_willThrow();
      sub_1891EA2C0(v31, 1);
      uint64_t v43 = v31;
      uint64_t v44 = 1;
    }

    else
    {
      (*(void (**)(uint64_t))(*v6 + 120LL))(1LL);
      uint64_t v43 = v31;
      uint64_t v44 = 0;
    }

    sub_1891EA2C0(v43, v44);
  }

  return swift_release();
}

void sub_1891E712C( _xpc_connection_s *a1, dispatch_queue_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v53 = a7;
  uint64_t v54 = a3;
  uint64_t v12 = sub_1891F5A0C();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v14);
  os_log_type_t v18 = (char *)&v48 - v17;
  uint64_t v19 = MEMORY[0x1895E3530](a1);
  if (v19 == sub_1891F5A30())
  {
    uint64_t v51 = a4;
    uint64_t v52 = a5;
    uint64_t v34 = sub_1891EEAC8();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v34, v12);
    swift_unknownObjectRetain_n();
    uint64_t v35 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v36 = sub_1891F5B2C();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v49 = a2;
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v50 = v12;
      uint64_t v39 = v38;
      aBlock[0] = v38;
      *(_DWORD *)uint64_t v37 = 136446210;
      uint64_t v48 = v37 + 4;
      uint64_t v56 = (uint64_t)a1;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
      uint64_t v40 = sub_1891F5AA8();
      uint64_t v56 = sub_1891E24FC(v40, v41, aBlock);
      sub_1891F5BA4();
      swift_unknownObjectRelease_n();
      a2 = v49;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1891D9000, v35, v36, "Got connection from jobquiesced: %{public}s", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v39, -1LL, -1LL);
      MEMORY[0x1895E33A4](v37, -1LL, -1LL);

      (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v50);
    }

    else
    {

      swift_unknownObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    }

    uint64_t v42 = v51;
    uint64_t v43 = v52;
    xpc_connection_set_target_queue(a1, a2);
    uint64_t v44 = (void *)swift_allocObject();
    uint64_t v45 = v53;
    v44[2] = v54;
    v44[3] = a2;
    v44[4] = v42;
    v44[5] = v43;
    v44[6] = a6;
    v44[7] = v45;
    aBlock[4] = (uint64_t)sub_1891EA314;
    aBlock[5] = (uint64_t)v44;
    aBlock[0] = MEMORY[0x1895F87A8];
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)sub_1891E0910;
    aBlock[3] = (uint64_t)&block_descriptor_44;
    uint64_t v46 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v47 = a2;
    swift_release();
    xpc_connection_set_event_handler(a1, v46);
    _Block_release(v46);
    xpc_connection_activate(a1);
  }

  else
  {
    uint64_t v20 = MEMORY[0x1895E3530](a1);
    if (v20 == sub_1891F5A18())
    {
      uint64_t v21 = sub_1891EEAC8();
      uint64_t v22 = v13;
      uint64_t v23 = v12;
      (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v21, v12);
      swift_unknownObjectRetain_n();
      swift_retain();
      uint64_t v24 = (os_log_s *)sub_1891F59F4();
      os_log_type_t v25 = sub_1891F5B44();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = swift_slowAlloc();
        uint64_t v27 = v54;
        uint64_t v28 = v26;
        uint64_t v53 = swift_slowAlloc();
        aBlock[0] = v53;
        *(_DWORD *)uint64_t v28 = 136446466;
        uint64_t v50 = v23;
        uint64_t v29 = *(void *)(v27 + 16);
        unint64_t v30 = *(void *)(v27 + 24);
        swift_bridgeObjectRetain();
        uint64_t v56 = sub_1891E24FC(v29, v30, aBlock);
        sub_1891F5BA4();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 12) = 2082;
        uint64_t v56 = (uint64_t)a1;
        swift_unknownObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
        uint64_t v31 = sub_1891F5AA8();
        uint64_t v56 = sub_1891E24FC(v31, v32, aBlock);
        sub_1891F5BA4();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl( &dword_1891D9000,  v24,  v25,  "Subscriber %{public}s listener error: %{public}s",  (uint8_t *)v28,  0x16u);
        uint64_t v33 = v53;
        swift_arrayDestroy();
        MEMORY[0x1895E33A4](v33, -1LL, -1LL);
        MEMORY[0x1895E33A4](v28, -1LL, -1LL);

        (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v50);
      }

      else
      {

        swift_unknownObjectRelease_n();
        swift_release();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v23);
      }
    }
  }

uint64_t sub_1891E763C( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t *, unint64_t *), uint64_t a7)
{
  uint64_t v51 = a6;
  uint64_t v52 = a7;
  uint64_t v12 = sub_1891F5A0C();
  uint64_t v50 = *(void **)(v12 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v12);
  uint64_t v15 = (char *)v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = MEMORY[0x1895F8858](v13);
  os_log_type_t v18 = (char *)v43 - v17;
  MEMORY[0x1895F8858](v16);
  uint64_t v20 = (char *)v43 - v19;
  uint64_t v21 = MEMORY[0x1895E3530](a1);
  if (v21 != sub_1891F5A18()) {
    return sub_1891E6218(a1, v51);
  }
  uint64_t v44 = v18;
  uint64_t v47 = a4;
  uint64_t v48 = a3;
  uint64_t v49 = a5;
  uint64_t v23 = sub_1891EEAC8();
  uint64_t v24 = (void (*)(char *, uint64_t, uint64_t))v50[2];
  uint64_t v45 = v23;
  uint64_t v46 = v24;
  ((void (*)(char *))v24)(v20);
  swift_retain_n();
  swift_unknownObjectRetain_n();
  os_log_type_t v25 = (os_log_s *)sub_1891F59F4();
  os_log_type_t v26 = sub_1891F5B44();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    v43[1] = v15;
    uint64_t v28 = v27;
    v43[0] = swift_slowAlloc();
    v54[0] = v43[0];
    *(_DWORD *)uint64_t v28 = 136446466;
    uint64_t v30 = a2[2];
    unint64_t v29 = a2[3];
    swift_bridgeObjectRetain();
    uint64_t v53 = sub_1891E24FC(v30, v29, v54);
    sub_1891F5BA4();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2082;
    uint64_t v53 = (uint64_t)a1;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
    uint64_t v31 = sub_1891F5AA8();
    uint64_t v53 = sub_1891E24FC(v31, v32, v54);
    sub_1891F5BA4();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl( &dword_1891D9000,  v25,  v26,  "Subscriber %{public}s error from server: %{public}s",  (uint8_t *)v28,  0x16u);
    uint64_t v33 = v43[0];
    swift_arrayDestroy();
    MEMORY[0x1895E33A4](v33, -1LL, -1LL);
    MEMORY[0x1895E33A4](v28, -1LL, -1LL);
  }

  else
  {

    swift_unknownObjectRelease_n();
    swift_release_n();
  }

  uint64_t v34 = (uint64_t (*)(char *, uint64_t))v50[1];
  uint64_t v35 = v34(v20, v12);
  uint64_t v37 = v48;
  uint64_t v36 = v49;
  uint64_t v38 = v47;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*a2 + 112LL))(v35);
  if ((result & 1) != 0)
  {
    uint64_t v50 = a2;
    uint64_t v39 = v44;
    v46(v44, v45, v12);
    uint64_t v40 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v41 = sub_1891F5B2C();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_1891D9000, v40, v41, "Subscription interrupted. Re-registering.", v42, 2u);
      uint64_t v36 = v49;
      MEMORY[0x1895E33A4](v42, -1LL, -1LL);
    }

    v34(v39, v12);
    return sub_1891E6C98(v37, v38, v36, v51, v52);
  }

  return result;
}

uint64_t sub_1891E7AA4()
{
  return JQXPCConnection.__allocating_init()();
}

uint64_t JQSubscription.__allocating_init(conn:name:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  JQSubscription.init(conn:name:)(a1, a2, a3);
  return v6;
}

uint64_t JQSubscription.init(conn:name:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(v3 + 48) = 0;
  *(void *)(v3 + 24) = a3;
  *(void *)(v3 + 32) = a1;
  *(void *)(v3 + 16) = a2;
  swift_retain();
  uint64_t v4 = xpc_connection_create(0LL, 0LL);
  *(void *)(v3 + 40) = v4;
  v7[4] = sub_1891E92B8;
  uint64_t v8 = v3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 1107296256LL;
  v7[2] = sub_1891E0910;
  v7[3] = &block_descriptor_0;
  uint64_t v5 = _Block_copy(v7);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  xpc_connection_set_event_handler(v4, v5);
  swift_release();
  _Block_release(v5);
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_1891E7C04(uint64_t a1)
{
  uint64_t v2 = sub_1891F5A0C();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1891EEAC8();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_retain();
  uint64_t v7 = (os_log_s *)sub_1891F59F4();
  os_log_type_t v8 = sub_1891F5B44();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v16 = v2;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    uint64_t v15 = v10 + 4;
    uint64_t v13 = *(void *)(a1 + 16);
    unint64_t v12 = *(void *)(a1 + 24);
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1891E24FC(v13, v12, &v18);
    sub_1891F5BA4();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1891D9000, v7, v8, "Subscriber %{public}s received unexpected XPC.", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E33A4](v11, -1LL, -1LL);
    MEMORY[0x1895E33A4](v10, -1LL, -1LL);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v16);
  }

  else
  {

    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

uint64_t sub_1891E7DD8()
{
  return (*(uint64_t (**)(void))(**(void **)(v0 + 32) + 128LL))();
}

uint64_t JQSubscription.deinit()
{
  return v0;
}

uint64_t JQSubscription.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891E7E90(uint64_t a1)
{
  uint64_t v2 = sub_1891F5A0C();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = MEMORY[0x1895F8858](v2);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((*(_BYTE *)(a1 + 32) & 1) == 0)
  {
    sub_1891F4D6C();
    uint64_t v7 = *(dispatch_queue_s **)(a1 + 24);
    aBlock[4] = sub_1891EA14C;
    aBlock[5] = a1;
    aBlock[0] = MEMORY[0x1895F87A8];
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1891E0910;
    aBlock[3] = &block_descriptor_26;
    os_log_type_t v8 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    uint64_t v9 = sub_1891F5AB4();
    swift_bridgeObjectRelease();
    xpc_set_event_stream_handler((const char *)(v9 + 32), v7, v8);
    swift_release();
    _Block_release(v8);
    uint64_t v10 = sub_1891EEAC8();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v10, v2);
    uint64_t v11 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v12 = sub_1891F5B2C();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1891D9000, v11, v12, "Activated XPC event stream handler.", v13, 2u);
      MEMORY[0x1895E33A4](v13, -1LL, -1LL);
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    *(_BYTE *)(a1 + 32) = 1;
  }

  return result;
}

const char *sub_1891E8054(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1891F5A6C();
  uint64_t v34 = *(void *)(v4 - 8);
  uint64_t v35 = v4;
  MEMORY[0x1895F8858](v4);
  uint64_t v33 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1891F5A90();
  uint64_t v31 = *(void *)(v6 - 8);
  uint64_t v32 = v6;
  MEMORY[0x1895F8858](v6);
  uint64_t v30 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_beginAccess();
  unint64_t v8 = *(void *)(a2 + 16);
  if (v8 >> 62)
  {
LABEL_21:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1891F5C34();
    if (v9) {
      goto LABEL_3;
    }
    return (const char *)swift_bridgeObjectRelease();
  }

  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9) {
    return (const char *)swift_bridgeObjectRelease();
  }
LABEL_3:
  unint64_t v36 = v8 & 0xC000000000000001LL;
  uint64_t v10 = 4LL;
  uint64_t v29 = v9;
  uint64_t v11 = v30;
  while (1)
  {
    if (v36) {
      os_log_type_t v12 = (void *)MEMORY[0x1895E2DB0](v10 - 4, v8);
    }
    else {
      os_log_type_t v12 = *(id *)(v8 + 8 * v10);
    }
    uint64_t v13 = v12;
    uint64_t v14 = v10 - 3;
    if (__OFADD__(v10 - 4, 1LL))
    {
      __break(1u);
      goto LABEL_21;
    }

    uint64_t v15 = (const char *)sub_1891F5A24();
    uint64_t result = xpc_dictionary_get_string(a1, v15);
    if (!result) {
      break;
    }
    if (sub_1891F5ACC() == *(void *)((char *)v13
                                      + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_subscriptionName)
      && v17 == *(void *)((char *)v13 + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_subscriptionName
                                        + 8))
    {
      uint64_t v20 = swift_bridgeObjectRelease();
    }

    else
    {
      char v19 = sub_1891F5D18();
      uint64_t v20 = swift_bridgeObjectRelease();
      if ((v19 & 1) == 0)
      {

        goto LABEL_5;
      }
    }

    uint64_t v38 = v10 - 3;
    uint64_t result = (const char *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x18961B398] & *v13) + 0xA8LL))(v20);
    if (!result) {
      goto LABEL_24;
    }
    uint64_t v21 = (char *)result;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = a1;
    *(void *)(v22 + 24) = v13;
    aBlock[4] = sub_1891EA190;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x1895F87A8];
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1891E83C8;
    aBlock[3] = &block_descriptor_32;
    uint64_t v23 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    uint64_t v37 = v13;
    sub_1891F5A84();
    uint64_t v39 = MEMORY[0x18961AFE8];
    sub_1891EA280(&qword_18C781800, (uint64_t (*)(uint64_t))MEMORY[0x18961B6A0], MEMORY[0x18961B6B8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C781808);
    sub_1891EA1F8((unint64_t *)&unk_18C781810, &qword_18C781808);
    uint64_t v24 = a1;
    os_log_type_t v25 = v33;
    uint64_t v26 = v35;
    sub_1891F5BC8();
    MEMORY[0x1895E2D44](0LL, v11, v25, v23);
    _Block_release(v23);

    uint64_t v27 = v25;
    a1 = v24;
    (*(void (**)(char *, uint64_t))(v34 + 8))(v27, v26);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v32);
    swift_release();
    uint64_t v9 = v29;
    uint64_t v14 = v38;
LABEL_5:
    ++v10;
    if (v14 == v9) {
      return (const char *)swift_bridgeObjectRelease();
    }
  }

  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_1891E83C8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1891E83F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1891E8414()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891E8440()
{
  uint64_t v1 = sub_1891F5B68();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1895F8858](v1);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_1891F5B5C();
  uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x18961B8A8];
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = sub_1891F5A90();
  MEMORY[0x1895F8858](v7);
  uint64_t v8 = MEMORY[0x18961AFE8];
  *(void *)(v0 + 16) = MEMORY[0x18961AFE8];
  v10[0] = sub_1891E23FC();
  sub_1891F5A84();
  v10[1] = v8;
  sub_1891EA280(&qword_18C4FF4A0, v6, MEMORY[0x18961B8C0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4A8);
  sub_1891EA1F8((unint64_t *)&unk_18C4FF4B0, &qword_18C4FF4A8);
  sub_1891F5BC8();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x18961B900], v1);
  *(void *)(v0 + 24) = sub_1891F5B80();
  *(_BYTE *)(v0 + 32) = 0;
  return v0;
}

uint64_t sub_1891E8608()
{
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_1891E8440();
  qword_18C4FF598 = v0;
  return result;
}

uint64_t sub_1891E8640()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_subscriptionName);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1891E8678()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_subscriberName);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1891E86B0()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_active);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1891E86F4(char a1)
{
  uint64_t v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_active);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_1891E873C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1891E8780()
{
  return 0LL;
}

uint64_t sub_1891E878C()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_notification);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_1891E92D8(*v1);
  return v2;
}

uint64_t sub_1891E87E4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_notification);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_1891E92E8(v6);
}

uint64_t (*sub_1891E8840())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1891E8884()
{
  return 0LL;
}

void *sub_1891E888C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_notificationQueue);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1891E88D8(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_notificationQueue);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_1891E8928())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1891E896C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v40[0] = a2;
  uint64_t v10 = sub_1891F5A0C();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  uint64_t v14 = (char *)v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = (void *)MEMORY[0x18961B398];
  if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x18961B398] & *v5) + 0x78LL))(v12) & 1) == 0)
  {
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))((*v15 & *v5) + 0x98LL);
    swift_retain();
    v22(a4, a5);
    uint64_t v23 = *(void (**)(void *))((*v15 & *v5) + 0xB0LL);
    id v24 = a1;
    v23(a1);
    if (qword_18C4FF590 != -1) {
      swift_once();
    }
    uint64_t v25 = qword_18C4FF598;
    uint64_t v26 = *(dispatch_queue_s **)(qword_18C4FF598 + 24);
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v25;
    *(void *)(v27 + 24) = v5;
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = sub_1891E9304;
    *(void *)(v28 + 24) = v27;
    uint64_t v45 = sub_1891E93A8;
    uint64_t v46 = v28;
    uint64_t aBlock = MEMORY[0x1895F87A8];
    uint64_t v42 = 1107296256LL;
    uint64_t v43 = sub_1891E83F4;
    uint64_t v44 = &block_descriptor_6_0;
    uint64_t v29 = _Block_copy(&aBlock);
    swift_retain();
    uint64_t v30 = v5;
    swift_retain();
    swift_release();
    dispatch_sync(v26, v29);
    _Block_release(v29);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
    {
      __break(1u);
    }

    else
    {
      uint64_t v32 = qword_18C4FF598;
      uint64_t v33 = *(dispatch_queue_s **)(qword_18C4FF598 + 24);
      uint64_t v34 = swift_allocObject();
      *(void *)(v34 + 16) = sub_1891E93C8;
      *(void *)(v34 + 24) = v32;
      uint64_t v45 = sub_1891EA334;
      uint64_t v46 = v34;
      uint64_t aBlock = MEMORY[0x1895F87A8];
      uint64_t v42 = 1107296256LL;
      uint64_t v43 = sub_1891E83F4;
      uint64_t v44 = &block_descriptor_13;
      uint64_t v35 = _Block_copy(&aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      dispatch_sync(v33, v35);
      _Block_release(v35);
      LOBYTE(v33) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      uint64_t result = swift_release();
      if ((v33 & 1) == 0)
      {
        type metadata accessor for JQRequestLaunchEventSubscribe();
        uint64_t v37 = *(void *)((char *)v30 + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_subscriberName);
        uint64_t v36 = *(void *)((char *)v30 + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_subscriberName + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v38 = JQRequestLaunchEventSubscribe.__allocating_init(subscriberName:jobGroup:)(v37, v36, v40[0], a3);
        uint64_t v39 = v40[1];
        (*(void (**)(void))(*v38 + 96LL))();
        if (v39) {
          return swift_release();
        }
        sub_1891F4D6C();
        sub_1891F5AB4();
        sub_1891F5AB4();
        swift_unknownObjectRetain();
        xpc_set_event();
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
        (*(void (**)(uint64_t))((*MEMORY[0x18961B398] & *v30) + 0x80LL))(1LL);
        swift_release();
        return swift_unknownObjectRelease();
      }
    }

    __break(1u);
    return result;
  }

  uint64_t v16 = sub_1891EEAC8();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v16, v10);
  uint64_t v17 = (os_log_s *)sub_1891F59F4();
  os_log_type_t v18 = sub_1891F5B50();
  if (os_log_type_enabled(v17, v18))
  {
    char v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v19 = 0;
    _os_log_impl(&dword_1891D9000, v17, v18, "BUG IN JOBQUIESCENCE CLIENT: called register more than once", v19, 2u);
    MEMORY[0x1895E33A4](v19, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  sub_1891E24B8();
  swift_allocError();
  *uint64_t v20 = 9;
  return swift_willThrow();
}

id JQLaunchEventSubscription.__allocating_init(subscriptionName:subscriberName:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = objc_allocWithZone(v4);
  v9[OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_active] = 0;
  uint64_t v10 = &v9[OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_notification];
  *uint64_t v10 = 0LL;
  v10[1] = 0LL;
  *(void *)&v9[OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_notificationQueue] = 0LL;
  uint64_t v11 = &v9[OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_subscriptionName];
  *uint64_t v11 = a1;
  v11[1] = a2;
  uint64_t v12 = &v9[OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_subscriberName];
  *uint64_t v12 = a3;
  v12[1] = a4;
  v14.receiver = v9;
  v14.super_class = v4;
  return objc_msgSendSuper2(&v14, sel_init);
}

id JQLaunchEventSubscription.init(subscriptionName:subscriberName:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_active] = 0;
  uint64_t v5 = &v4[OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_notification];
  *uint64_t v5 = 0LL;
  v5[1] = 0LL;
  *(void *)&v4[OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_notificationQueue] = 0LL;
  uint64_t v6 = &v4[OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_subscriptionName];
  *uint64_t v6 = a1;
  v6[1] = a2;
  uint64_t v7 = &v4[OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_subscriberName];
  *uint64_t v7 = a3;
  v7[1] = a4;
  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for JQLaunchEventSubscription();
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t sub_1891E8F58()
{
  if (qword_18C4FF590 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_18C4FF598;
  uint64_t v2 = *(dispatch_queue_s **)(qword_18C4FF598 + 24);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v0;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_1891E940C;
  *(void *)(v4 + 24) = v3;
  v7[4] = sub_1891EA334;
  void v7[5] = v4;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 1107296256LL;
  v7[2] = sub_1891E83F4;
  v7[3] = &block_descriptor_23;
  uint64_t v5 = _Block_copy(v7);
  swift_retain();
  v0;
  swift_retain();
  swift_release();
  dispatch_sync(v2, v5);
  _Block_release(v5);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v2 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    sub_1891F4D6C();
    sub_1891F5AB4();
    sub_1891F5AB4();
    xpc_set_event();
    swift_release();
    return swift_release();
  }

  return result;
}

id JQLaunchEventSubscription.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JQLaunchEventSubscription();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id JQLaunchEventSubscription.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void JQLaunchEventSubscription.init()()
{
}

uint64_t sub_1891E92B8()
{
  return sub_1891E7C04(v0);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1891E92D8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1891E92E8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1891E92F8()
{
  return objectdestroyTm((void (*)(void))MEMORY[0x18961B3C8]);
}

uint64_t sub_1891E9304()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  swift_beginAccess();
  id v3 = v1;
  MEMORY[0x1895E2CCC]();
  if (*(void *)((*(void *)(v2 + 16) & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*(void *)(v2 + 16) & 0xFFFFFFFFFFFFFF8LL)
                                                                                     + 0x18) >> 1)
    sub_1891F5B14();
  sub_1891F5B20();
  sub_1891F5B08();
  return swift_endAccess();
}

uint64_t sub_1891E9398()
{
  return swift_deallocObject();
}

uint64_t sub_1891E93A8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1891E93C8()
{
  return sub_1891E7E90(v0);
}

uint64_t sub_1891E93D0()
{
  return swift_deallocObject();
}

uint64_t type metadata accessor for JQLaunchEventSubscription()
{
  return objc_opt_self();
}

uint64_t sub_1891E9400()
{
  return objectdestroyTm((void (*)(void))MEMORY[0x18961B3C8]);
}

void sub_1891E940C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  swift_beginAccess();
  id v3 = v1;
  uint64_t v4 = sub_1891E9B40((unint64_t *)(v2 + 16), (uint64_t)v3);

  unint64_t v5 = *(void *)(v2 + 16);
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1891F5C34();
    swift_bridgeObjectRelease();
    if (v6 >= v4) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v6 >= v4)
    {
LABEL_3:
      sub_1891E9E58(v4, v6);
      swift_endAccess();
      return;
    }
  }

  __break(1u);
}

uint64_t sub_1891E94DC()
{
  return swift_deallocObject();
}

unint64_t sub_1891E94F0()
{
  unint64_t result = qword_18C781710;
  if (!qword_18C781710)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for JQNotificationType,  &type metadata for JQNotificationType);
    atomic_store(result, (unint64_t *)&qword_18C781710);
  }

  return result;
}

ValueMetadata *type metadata accessor for JQNotificationType()
{
  return &type metadata for JQNotificationType;
}

uint64_t type metadata accessor for JQSubscription()
{
  return objc_opt_self();
}

uint64_t method lookup function for JQSubscription()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQSubscription.register(on:for:notification:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t dispatch thunk of JQSubscription.__allocating_init(conn:name:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of JQSubscription.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160LL))();
}

uint64_t type metadata accessor for JQLaunchEventSubMultiplexer()
{
  return objc_opt_self();
}

uint64_t method lookup function for JQLaunchEventSubscription()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQLaunchEventSubscription.register(on:for:notification:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xC0LL))();
}

uint64_t dispatch thunk of JQLaunchEventSubscription.__allocating_init(subscriptionName:subscriberName:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of JQLaunchEventSubscription.cancel()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xD0LL))();
}

uint64_t _s13JobQuiescence18JQNotificationTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1891E966C + 4 * byte_1891F8165[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1891E96A0 + 4 * byte_1891F8160[v4]))();
}

uint64_t sub_1891E96A0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891E96A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891E96B0LL);
  }
  return result;
}

uint64_t sub_1891E96BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891E96C4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1891E96C8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891E96D0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JQNotificationType.CodingKeys()
{
  return &type metadata for JQNotificationType.CodingKeys;
}

ValueMetadata *type metadata accessor for JQNotificationType.QuiesceEventuallyCodingKeys()
{
  return &type metadata for JQNotificationType.QuiesceEventuallyCodingKeys;
}

ValueMetadata *type metadata accessor for JQNotificationType.QuiesceImmediatelyCodingKeys()
{
  return &type metadata for JQNotificationType.QuiesceImmediatelyCodingKeys;
}

unint64_t sub_1891E9710()
{
  unint64_t result = qword_18C786520[0];
  if (!qword_18C786520[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8490, &type metadata for JQNotificationType.CodingKeys);
    atomic_store(result, qword_18C786520);
  }

  return result;
}

unint64_t sub_1891E9758()
{
  unint64_t result = qword_18C786630;
  if (!qword_18C786630)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F83B0, &type metadata for JQNotificationType.QuiesceEventuallyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C786630);
  }

  return result;
}

unint64_t sub_1891E97A0()
{
  unint64_t result = qword_18C786638[0];
  if (!qword_18C786638[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F83D8, &type metadata for JQNotificationType.QuiesceEventuallyCodingKeys);
    atomic_store(result, qword_18C786638);
  }

  return result;
}

unint64_t sub_1891E97E8()
{
  unint64_t result = qword_18C7866C0;
  if (!qword_18C7866C0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8360, &type metadata for JQNotificationType.QuiesceImmediatelyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7866C0);
  }

  return result;
}

unint64_t sub_1891E9830()
{
  unint64_t result = qword_18C7866C8[0];
  if (!qword_18C7866C8[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8388, &type metadata for JQNotificationType.QuiesceImmediatelyCodingKeys);
    atomic_store(result, qword_18C7866C8);
  }

  return result;
}

unint64_t sub_1891E9878()
{
  unint64_t result = qword_18C786750;
  if (!qword_18C786750)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8400, &type metadata for JQNotificationType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C786750);
  }

  return result;
}

unint64_t sub_1891E98C0()
{
  unint64_t result = qword_18C786758[0];
  if (!qword_18C786758[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8428, &type metadata for JQNotificationType.CodingKeys);
    atomic_store(result, qword_18C786758);
  }

  return result;
}

void sub_1891E9904(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1891F5C34();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x1895E2DBCLL);
}

uint64_t sub_1891E996C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011LL && a2 == 0x80000001891FAF70LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0xD000000000000012LL && a2 == 0x80000001891FAF90LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v5 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1891E9A54(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (v4)
  {
    uint64_t v5 = 0LL;
    while (1)
    {
      if ((a1 & 0xC000000000000001LL) != 0)
      {
        uint64_t v6 = MEMORY[0x1895E2DB0](v5, a1);
        swift_unknownObjectRelease();
        if (v6 == a2) {
          return v5;
        }
      }

      else if (*(void *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }

      if (__OFADD__(v5, 1LL)) {
        break;
      }
      if (++v5 == v4) {
        return 0LL;
      }
    }

    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1891F5C34();
    swift_bridgeObjectRelease();
  }

  return 0LL;
}

uint64_t sub_1891E9B40(unint64_t *a1, uint64_t a2)
{
  unint64_t v5 = swift_bridgeObjectRetain();
  unint64_t v6 = sub_1891E9A54(v5, a2);
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v2) {
    return v6;
  }
  if ((v8 & 1) == 0)
  {
    unint64_t v9 = v6 + 1;
    if (__OFADD__(v6, 1LL)) {
      goto LABEL_54;
    }
    if (*a1 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_1891F5C34();
      swift_bridgeObjectRelease();
      if (v9 != v25) {
        goto LABEL_6;
      }
    }

    else if (v9 != *(void *)((*a1 & 0xFFFFFFFFFFFFF8LL) + 0x10))
    {
LABEL_6:
      for (unint64_t i = v6 + 5; ; ++i)
      {
        unint64_t v11 = i - 4;
        unint64_t v12 = *a1;
        if ((*a1 & 0xC000000000000001LL) != 0) {
          break;
        }
        if ((v11 & 0x8000000000000000LL) != 0)
        {
          __break(1u);
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
          goto LABEL_55;
        }

        if (v11 >= *(void *)((v12 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
          goto LABEL_45;
        }
        if (*(void *)(v12 + 8 * i) != a2) {
          goto LABEL_11;
        }
LABEL_31:
        unint64_t v9 = i - 3;
        if (__OFADD__(v11, 1LL)) {
          goto LABEL_46;
        }
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v21 = sub_1891F5C34();
          swift_bridgeObjectRelease();
        }

        else
        {
          uint64_t v21 = *(void *)((*a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
        }

        if (v9 == v21) {
          return v6;
        }
      }

      uint64_t v22 = MEMORY[0x1895E2DB0](i - 4);
      swift_unknownObjectRelease();
      if (v22 == a2) {
        goto LABEL_31;
      }
LABEL_11:
      if (v11 == v6)
      {
LABEL_30:
        if (__OFADD__(v6++, 1LL)) {
          goto LABEL_47;
        }
        goto LABEL_31;
      }

      unint64_t v9 = *a1;
      if ((*a1 & 0xC000000000000001LL) != 0)
      {
        id v13 = (id)MEMORY[0x1895E2DB0](v6, *a1);
        unint64_t v9 = *a1;
        if ((*a1 & 0xC000000000000001LL) == 0)
        {
LABEL_16:
          if ((v11 & 0x8000000000000000LL) != 0) {
            goto LABEL_50;
          }
          if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
            goto LABEL_51;
          }
          id v14 = *(id *)(v9 + 8 * i);
          goto LABEL_19;
        }
      }

      else
      {
        if ((v6 & 0x8000000000000000LL) != 0) {
          goto LABEL_48;
        }
        if (v6 >= *(void *)((v9 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
          goto LABEL_49;
        }
        id v13 = *(id *)(v9 + 8 * v6 + 32);
        if ((v9 & 0xC000000000000001LL) == 0) {
          goto LABEL_16;
        }
      }

      id v14 = (id)MEMORY[0x1895E2DB0](i - 4, v9);
      unint64_t v9 = *a1;
LABEL_19:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v9 & 0x8000000000000000LL) != 0
        || (v9 & 0x4000000000000000LL) != 0)
      {
        sub_1891E9904(v9);
      }

      uint64_t v16 = *(void **)((v9 & 0xFFFFFFFFFFFFFF8LL) + 8 * v6 + 0x20);
      *(void *)((v9 & 0xFFFFFFFFFFFFFF8LL) + 8 * v6 + 0x20) = v14;

      sub_1891F5B08();
      unint64_t v9 = *a1;
      int v17 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!v17 || (v9 & 0x8000000000000000LL) != 0 || (v9 & 0x4000000000000000LL) != 0) {
        sub_1891E9904(v9);
      }
      if ((v11 & 0x8000000000000000LL) != 0) {
        goto LABEL_52;
      }
      uint64_t v18 = v9 & 0xFFFFFFFFFFFFFF8LL;
      if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8LL) + 0x10)) {
        goto LABEL_53;
      }
      char v19 = *(void **)(v18 + 8 * i);
      *(void *)(v18 + 8 * i) = v13;

      sub_1891F5B08();
      goto LABEL_30;
    }

    return v6;
  }

  unint64_t v23 = *a1;
  if (!(v23 >> 62)) {
    return *(void *)((v23 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_1891F5C34();
  swift_bridgeObjectRelease();
  return v26;
}

uint64_t sub_1891E9E58(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFF8LL) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }

  swift_bridgeObjectRetain();
  uint64_t v21 = sub_1891F5C34();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_31;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }

  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0LL, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1891F5C34();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1891F5C34();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }

  if (*v3 >> 62) {
    goto LABEL_34;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_36;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *int v3 = v9;
  uint64_t v7 = 0LL;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000LL) == 0 && (v9 & 0x4000000000000000LL) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8LL;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1LL;
  }

  if (v9 >> 62) {
    goto LABEL_37;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFF8LL) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *int v3 = MEMORY[0x1895E2DBC](v7, v12, 1LL, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8LL;
LABEL_18:
  uint64_t v13 = v11 + 32;
  id v14 = (char *)(v11 + 32 + 8 * v4);
  type metadata accessor for JQLaunchEventSubscription();
  swift_arrayDestroy();
  if (!v5) {
    return sub_1891F5B08();
  }
  if (!(*v3 >> 62))
  {
    uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t v16 = v15 - v2;
    if (!__OFSUB__(v15, v2)) {
      goto LABEL_21;
    }
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  swift_bridgeObjectRetain();
  uint64_t v22 = sub_1891F5C34();
  swift_bridgeObjectRelease();
  uint64_t v16 = v22 - v2;
  if (__OFSUB__(v22, v2)) {
    goto LABEL_40;
  }
LABEL_21:
  if ((v16 & 0x8000000000000000LL) == 0)
  {
    int v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16]) {
      memmove(v14, v17, 8 * v16);
    }
    if (!(*v3 >> 62))
    {
      uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      uint64_t v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(void *)((*v3 & 0xFFFFFFFFFFFFF8LL) + 0x10) = v19;
        return sub_1891F5B08();
      }

      goto LABEL_43;
    }

LABEL_41:
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_1891F5C34();
    swift_bridgeObjectRelease();
    uint64_t v19 = v23 + v5;
    if (!__OFADD__(v23, v5)) {
      goto LABEL_27;
    }
LABEL_43:
    __break(1u);
  }

  uint64_t result = sub_1891F5C40();
  __break(1u);
  return result;
}

const char *sub_1891EA14C(void *a1)
{
  return sub_1891E8054(a1, v1);
}

uint64_t sub_1891EA154()
{
  return objectdestroyTm((void (*)(void))MEMORY[0x18961B458]);
}

uint64_t objectdestroyTm(void (*a1)(void))
{
  return swift_deallocObject();
}

void (*sub_1891EA190())(uint64_t *, unint64_t *)
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    sub_1891E6218(v1, result);
    return (void (*)(uint64_t *, unint64_t *))sub_1891E92E8(v3);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_1891EA1F8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = MEMORY[0x1895E3314](MEMORY[0x189618470], v4);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1891EA238()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1891EA274(uint64_t a1)
{
  return sub_1891EA320( a1,  (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_1891E712C);
}

uint64_t sub_1891EA280(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = MEMORY[0x1895E3314](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

void sub_1891EA2C0(id a1, char a2)
{
  if ((a2 & 1) != 0) {

  }
  else {
    swift_release();
  }
}

id sub_1891EA2CC(id a1, char a2)
{
  if ((a2 & 1) != 0) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

uint64_t sub_1891EA2D8()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1891EA314(uint64_t a1)
{
  return sub_1891EA320( a1,  (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_1891E763C);
}

uint64_t sub_1891EA320( uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t JQRequestRegisterTask.description.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  int v3 = *(_DWORD *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  char v5 = *(_BYTE *)(v1 + 48);
  uint64_t v7 = *(void *)(v1 + 56);
  uint64_t v6 = *(void *)(v1 + 64);
  *(void *)a1 = *(void *)(v1 + 16);
  *(void *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1891EA3BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
  return NotCoded.init(wrappedValue:)((uint64_t)&v5, v3, a2);
}

uint64_t sub_1891EA400@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 96LL))();
  *a2 = result;
  return result;
}

uint64_t sub_1891EA430(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 104LL);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t sub_1891EA460()
{
  return v1;
}

uint64_t sub_1891EA4B8(uint64_t a1)
{
  uint64_t v2 = a1;
  swift_beginAccess();
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C781848);
  NotCoded.wrappedValue.setter((uint64_t)&v2);
  swift_endAccess();
  return swift_unknownObjectRelease();
}

void (*sub_1891EA528(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v3[4] = *(void *)(v1 + 72);
  v3 += 4;
  v3[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781848);
  NotCoded.wrappedValue.getter((uint64_t)(v3 - 1));
  return sub_1891EA5A8;
}

void sub_1891EA5A8(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)(*(void *)a1 + 32LL) = *(void *)(*(void *)a1 + 24LL);
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRetain();
    NotCoded.wrappedValue.setter((uint64_t)v2 + 32);
    swift_unknownObjectRelease();
  }

  else
  {
    NotCoded.wrappedValue.setter((uint64_t)v2 + 32);
  }

  swift_endAccess();
  free(v2);
}

uint64_t sub_1891EA61C@<X0>(uint64_t *a1@<X8>)
{
  *a1 = v1 | 0x6000000000000000LL;
  return swift_retain();
}

uint64_t static JQRequestRegisterTask.allowedConnectionTypes.getter()
{
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1891F85B0;
  uint64_t v1 = type metadata accessor for JQXPCConnection();
  uint64_t v2 = sub_1891DD428( (unint64_t *)&unk_18C7813E0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for JQXPCConnection,  (uint64_t)&protocol conformance descriptor for JQXPCConnection);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  return v0;
}

uint64_t JQRequestRegisterTask.__allocating_init(endpoint:description:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_1891EAE4C(a1, a2);
  swift_unknownObjectRelease();
  return v4;
}

uint64_t JQRequestRegisterTask.init(endpoint:description:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = sub_1891EAE4C(a1, a2);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_1891EA738()
{
  if (*v0) {
    return 0x746E696F70646E65LL;
  }
  else {
    return 0x7470697263736564LL;
  }
}

uint64_t sub_1891EA77C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1891EB2E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1891EA7A0()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891EA7C8()
{
  return sub_1891F5DCC();
}

uint64_t JQRequestRegisterTask.deinit()
{
  return v0;
}

uint64_t JQRequestRegisterTask.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891EA868(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C781860);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891EAF30();
  sub_1891F5D90();
  uint64_t v9 = *(void *)(v3 + 24);
  int v10 = *(_DWORD *)(v3 + 32);
  uint64_t v11 = *(void *)(v3 + 40);
  char v12 = *(_BYTE *)(v3 + 48);
  uint64_t v16 = *(void *)(v3 + 16);
  uint64_t v17 = v9;
  int v18 = v10;
  uint64_t v19 = v11;
  char v20 = v12;
  __int128 v21 = *(_OWORD *)(v3 + 56);
  LOBYTE(v15) = 0;
  sub_1891DC61C();
  sub_1891F5CF4();
  if (!v2)
  {
    swift_beginAccess();
    uint64_t v15 = *(void *)(v3 + 72);
    v14[15] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C781848);
    sub_1891EAF94(&qword_18C781870, (uint64_t)&protocol conformance descriptor for NotCoded<A>);
    sub_1891F5CF4();
  }

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t JQRequestRegisterTask.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  JQRequestRegisterTask.init(from:)(a1);
  return v2;
}

uint64_t JQRequestRegisterTask.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781878);
  uint64_t v5 = *(void *)(v18 - 8);
  MEMORY[0x1895F8858](v18);
  uint64_t v7 = (char *)&v19[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = 0LL;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
  NotCoded.init(wrappedValue:)((uint64_t)&v24, v8, (uint64_t)v19);
  *(void *)(v1 + 72) = v19[0];
  uint64_t v9 = (void *)(v1 + 72);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891EAF30();
  sub_1891F5D84();
  if (v2)
  {
    swift_unknownObjectRelease();
    type metadata accessor for JQRequestRegisterTask();
    swift_deallocPartialClassInstance();
  }

  else
  {
    uint64_t v10 = v5;
    LOBYTE(v24) = 0;
    sub_1891DCAFC();
    uint64_t v11 = v18;
    sub_1891F5C94();
    uint64_t v13 = v19[1];
    int v14 = v20;
    uint64_t v15 = v21;
    char v16 = v22;
    *(void *)(v1 + 16) = v19[0];
    *(void *)(v1 + 24) = v13;
    *(_DWORD *)(v1 + 32) = v14;
    *(void *)(v1 + 40) = v15;
    *(_BYTE *)(v1 + 48) = v16;
    *(_OWORD *)(v1 + 56) = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C781848);
    LOBYTE(v19[0]) = 1;
    sub_1891EAF94(&qword_18C781888, (uint64_t)&protocol conformance descriptor for NotCoded<A>);
    sub_1891F5C94();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v11);
    uint64_t v17 = v24;
    swift_beginAccess();
    void *v9 = v17;
    swift_unknownObjectRelease();
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

void (*sub_1891EAC94(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))(**(void **)v1 + 112LL))();
  return sub_1891EACE4;
}

void sub_1891EACE4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

uint64_t _s13JobQuiescence18JQRequestSubscribeC22allowedConnectionTypesSayAA12JQConnection_pXpGvgZ_0()
{
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1891F85B0;
  uint64_t v1 = type metadata accessor for JQXPCConnection();
  uint64_t v2 = sub_1891DD428( (unint64_t *)&unk_18C7813E0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for JQXPCConnection,  (uint64_t)&protocol conformance descriptor for JQXPCConnection);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  return v0;
}

xpc_object_t sub_1891EAD84(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1895E3314](&protocol conformance descriptor for JQRequestRegisterTask, a1);
  return JQRequestWithEndpoint.asXPC()(a1, v2);
}

uint64_t sub_1891EADC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 144))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_1891EADF0()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136LL))();
}

uint64_t sub_1891EAE18(uint64_t a1)
{
  return JQRequest.description.getter();
}

uint64_t sub_1891EAE4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  int v7 = *((_DWORD *)a2 + 4);
  uint64_t v8 = a2[3];
  char v9 = *((_BYTE *)a2 + 32);
  uint64_t v10 = a2[5];
  uint64_t v11 = a2[6];
  uint64_t v15 = 0LL;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
  NotCoded.init(wrappedValue:)((uint64_t)&v15, v12, (uint64_t)v14);
  *(void *)(v3 + 72) = v14[0];
  *(void *)(v3 + 16) = v5;
  *(void *)(v3 + 24) = v6;
  *(_DWORD *)(v3 + 32) = v7;
  *(void *)(v3 + 40) = v8;
  *(_BYTE *)(v3 + 48) = v9;
  *(void *)(v3 + 56) = v10;
  *(void *)(v3 + 64) = v11;
  uint64_t v15 = a1;
  swift_beginAccess();
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C781848);
  NotCoded.wrappedValue.setter((uint64_t)&v15);
  swift_endAccess();
  return v3;
}

unint64_t sub_1891EAF30()
{
  unint64_t result = qword_18C7867E0[0];
  if (!qword_18C7867E0[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F879C, &type metadata for JQRequestRegisterTask.CodingKeys);
    atomic_store(result, qword_18C7867E0);
  }

  return result;
}

uint64_t type metadata accessor for JQRequestRegisterTask()
{
  return objc_opt_self();
}

uint64_t sub_1891EAF94(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C781848);
    uint64_t result = MEMORY[0x1895E3314](a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1891EAFD8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1891DD428( (unint64_t *)&qword_18C781890,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestRegisterTask,  (uint64_t)&protocol conformance descriptor for JQRequestRegisterTask);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1891EB014()
{
  return sub_1891DD428( (unint64_t *)&unk_18C781820,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for JQResponseEmpty,  (uint64_t)&protocol conformance descriptor for JQResponseEmpty);
}

uint64_t sub_1891EB044(void *a1, uint64_t a2)
{
  a1[1] = sub_1891DD428( &qword_18C7818E8,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestRegisterTask,  (uint64_t)&protocol conformance descriptor for JQRequestRegisterTask);
  a1[2] = sub_1891DD428( &qword_18C7818F0,  v3,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestRegisterTask,  (uint64_t)&protocol conformance descriptor for JQRequestRegisterTask);
  uint64_t result = sub_1891DD428( &qword_18C7818F8,  v4,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestRegisterTask,  (uint64_t)&protocol conformance descriptor for JQRequestRegisterTask);
  a1[3] = result;
  return result;
}

uint64_t method lookup function for JQRequestRegisterTask()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQRequestRegisterTask.endpoint.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96LL))();
}

uint64_t dispatch thunk of JQRequestRegisterTask.endpoint.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104LL))();
}

uint64_t dispatch thunk of JQRequestRegisterTask.endpoint.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112LL))();
}

uint64_t dispatch thunk of JQRequestRegisterTask.asCodable()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120LL))();
}

uint64_t dispatch thunk of JQRequestRegisterTask.__allocating_init(endpoint:description:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of JQRequestRegisterTask.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t dispatch thunk of JQRequestRegisterTask.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t storeEnumTagSinglePayload for JQRequestRegisterTask.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1891EB190 + 4 * byte_1891F85C5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1891EB1C4 + 4 * byte_1891F85C0[v4]))();
}

uint64_t sub_1891EB1C4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891EB1CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891EB1D4LL);
  }
  return result;
}

uint64_t sub_1891EB1E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891EB1E8LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1891EB1EC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891EB1F4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JQRequestRegisterTask.CodingKeys()
{
  return &type metadata for JQRequestRegisterTask.CodingKeys;
}

unint64_t sub_1891EB214()
{
  unint64_t result = qword_18C786B70[0];
  if (!qword_18C786B70[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8774, &type metadata for JQRequestRegisterTask.CodingKeys);
    atomic_store(result, qword_18C786B70);
  }

  return result;
}

unint64_t sub_1891EB25C()
{
  unint64_t result = qword_18C786C80;
  if (!qword_18C786C80)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F86E4, &type metadata for JQRequestRegisterTask.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C786C80);
  }

  return result;
}

unint64_t sub_1891EB2A4()
{
  unint64_t result = qword_18C786C88[0];
  if (!qword_18C786C88[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F870C, &type metadata for JQRequestRegisterTask.CodingKeys);
    atomic_store(result, qword_18C786C88);
  }

  return result;
}

uint64_t sub_1891EB2E8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7470697263736564LL && a2 == 0xEB000000006E6F69LL;
  if (v2 || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x746E696F70646E65LL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t JQRequestSubscribe.subscriberName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1891EB41C()
{
  return v1;
}

uint64_t sub_1891EB474(uint64_t a1)
{
  uint64_t v2 = a1;
  swift_beginAccess();
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C781848);
  NotCoded.wrappedValue.setter((uint64_t)&v2);
  swift_endAccess();
  return swift_unknownObjectRelease();
}

void (*sub_1891EB4E4(void *a1))(uint64_t a1, char a2)
{
  int v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v3[4] = *(void *)(v1 + 32);
  v3 += 4;
  v3[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781848);
  NotCoded.wrappedValue.getter((uint64_t)(v3 - 1));
  return sub_1891EB564;
}

void sub_1891EB564(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)(*(void *)a1 + 32LL) = *(void *)(*(void *)a1 + 24LL);
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRetain();
    NotCoded.wrappedValue.setter((uint64_t)v2 + 32);
    swift_unknownObjectRelease();
  }

  else
  {
    NotCoded.wrappedValue.setter((uint64_t)v2 + 32);
  }

  swift_endAccess();
  free(v2);
}

uint64_t sub_1891EB5D8@<X0>(uint64_t *a1@<X8>)
{
  *a1 = v1 | 0x4000000000000000LL;
  return swift_retain();
}

void *JQRequestSubscribe.__allocating_init(endpoint:subscriberName:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = sub_1891ECD94(a1, a2, a3);
  swift_unknownObjectRelease();
  return v6;
}

void *JQRequestSubscribe.init(endpoint:subscriberName:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = sub_1891ECD94(a1, a2, a3);
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_1891EB68C(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x746E696F70646E65LL;
  }
  else {
    return 0x6269726373627573LL;
  }
}

uint64_t sub_1891EB6D0()
{
  return sub_1891EB68C(*v0);
}

uint64_t sub_1891EB6D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1891ED864(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1891EB6FC()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891EB724()
{
  return sub_1891F5DCC();
}

uint64_t JQRequestSubscribe.deinit()
{
  return v0;
}

uint64_t JQRequestSubscribe.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891EB79C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C7819E0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891ECE4C();
  sub_1891F5D90();
  char v12 = 0;
  sub_1891F5CDC();
  if (!v2)
  {
    swift_beginAccess();
    uint64_t v11 = *(void *)(v3 + 32);
    v10[15] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C781848);
    sub_1891EAF94(&qword_18C781870, (uint64_t)&protocol conformance descriptor for NotCoded<A>);
    sub_1891F5CF4();
  }

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t JQRequestSubscribe.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  JQRequestSubscribe.init(from:)(a1);
  return v2;
}

void *JQRequestSubscribe.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7819F0);
  uint64_t v5 = *(void *)(v15 - 8);
  MEMORY[0x1895F8858](v15);
  uint64_t v7 = (char *)&v16[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = 0LL;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
  NotCoded.init(wrappedValue:)((uint64_t)&v17, v8, (uint64_t)v16);
  v1[4] = v16[0];
  char v9 = v1 + 4;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891ECE4C();
  sub_1891F5D84();
  if (v2)
  {
    swift_unknownObjectRelease();
    type metadata accessor for JQRequestSubscribe();
    swift_deallocPartialClassInstance();
  }

  else
  {
    uint64_t v10 = v5;
    LOBYTE(v16[0]) = 0;
    uint64_t v11 = v15;
    v1[2] = sub_1891F5C7C();
    v1[3] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C781848);
    LOBYTE(v16[0]) = 1;
    sub_1891EAF94(&qword_18C781888, (uint64_t)&protocol conformance descriptor for NotCoded<A>);
    sub_1891F5C94();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v11);
    uint64_t v14 = v17;
    swift_beginAccess();
    void *v9 = v14;
    swift_unknownObjectRelease();
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

xpc_object_t sub_1891EBB58(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1895E3314](&protocol conformance descriptor for JQRequestSubscribe, a1);
  return JQRequestWithEndpoint.asXPC()(a1, v2);
}

uint64_t sub_1891EBB98(uint64_t a1)
{
  return JQRequest.description.getter();
}

void sub_1891EBBCC()
{
  unk_18C4FF5C7 = -18;
}

uint64_t *sub_1891EBBFC()
{
  if (qword_18C4FF5A0 != -1) {
    swift_once();
  }
  return &qword_18C4FF5B8;
}

uint64_t sub_1891EBC3C()
{
  return sub_1891EBCE0(&qword_18C4FF5A0, &qword_18C4FF5B8);
}

void sub_1891EBC5C()
{
  qword_18C4FF5C8 = 0x70756F7247626F4ALL;
  unk_18C4FF5D0 = 0xE800000000000000LL;
}

uint64_t *sub_1891EBC80()
{
  if (qword_18C4FF5A8 != -1) {
    swift_once();
  }
  return &qword_18C4FF5C8;
}

uint64_t sub_1891EBCC0()
{
  return sub_1891EBCE0(&qword_18C4FF5A8, &qword_18C4FF5C8);
}

uint64_t sub_1891EBCE0(void *a1, uint64_t *a2)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t JQRequestLaunchEventSubscribe.jobGroup.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

xpc_object_t sub_1891EBD5C()
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (qword_18C4FF5A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1891F5AB4();
  xpc_dictionary_set_string(empty, "SubscriberName", (const char *)(v2 + 32));
  swift_release();
  if (*(void *)(v0 + 40))
  {
    if (qword_18C4FF5A8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_1891F5AB4();
    xpc_dictionary_set_string(empty, "JobGroup", (const char *)(v3 + 32));
    swift_release();
  }

  return empty;
}

uint64_t sub_1891EBE40(void *a1)
{
  uint64_t v3 = sub_1891F5A0C();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](v3);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v5);
  char v9 = (char *)v25 - v8;
  uint64_t v10 = MEMORY[0x1895E3530](a1);
  if (v10 != sub_1891F5A3C())
  {
    uint64_t v11 = sub_1891EEAC8();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v11, v3);
    char v12 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v13 = sub_1891F5B44();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1891D9000, v12, v13, "Event subscription is not a dictionary.", v14, 2u);
      MEMORY[0x1895E33A4](v14, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
LABEL_5:
    sub_1891E24B8();
    swift_allocError();
    *uint64_t v15 = 1;
    return swift_willThrow();
  }

  if (qword_18C4FF5A0 != -1) {
    swift_once();
  }
  if (!xpc_dictionary_get_string(a1, "SubscriberName"))
  {
    uint64_t v17 = sub_1891EEAC8();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v17, v3);
    uint64_t v18 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v19 = sub_1891F5B44();
    if (os_log_type_enabled(v18, v19))
    {
      int v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)int v20 = 136315138;
      uint64_t v26 = v21;
      v25[0] = v20 + 4;
      uint64_t v22 = qword_18C4FF5B8;
      unint64_t v23 = unk_18C4FF5C0;
      swift_bridgeObjectRetain();
      v25[1] = sub_1891E24FC(v22, v23, &v26);
      sub_1891F5BA4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1891D9000, v18, v19, "Event subscription is missing required key %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v21, -1LL, -1LL);
      MEMORY[0x1895E33A4](v20, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    goto LABEL_5;
  }

  if (qword_18C4FF5A8 != -1) {
    swift_once();
  }
  if (xpc_dictionary_get_string(a1, "JobGroup")) {
    sub_1891F5ACC();
  }
  uint64_t v24 = sub_1891F5ACC();
  return (*(uint64_t (**)(uint64_t))(v1 + 112))(v24);
}

void *JQRequestLaunchEventSubscribe.__allocating_init(subscriberName:jobGroup:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

void *JQRequestLaunchEventSubscribe.init(subscriberName:jobGroup:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = a4;
  return v4;
}

uint64_t sub_1891EC204(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x70756F7247626F6ALL;
  }
  else {
    return 0x6269726373627573LL;
  }
}

uint64_t sub_1891EC248()
{
  return sub_1891EC204(*v0);
}

uint64_t sub_1891EC250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1891ED964(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1891EC274()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891EC29C()
{
  return sub_1891F5DCC();
}

uint64_t JQRequestLaunchEventSubscribe.deinit()
{
  return v0;
}

uint64_t JQRequestLaunchEventSubscribe.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891EC314(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7819F8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891ECEB0();
  sub_1891F5D90();
  v8[15] = 0;
  sub_1891F5CDC();
  if (!v1)
  {
    v8[14] = 1;
    sub_1891F5CC4();
  }

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t JQRequestLaunchEventSubscribe.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  JQRequestLaunchEventSubscribe.init(from:)(a1);
  return v2;
}

uint64_t JQRequestLaunchEventSubscribe.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781A00);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891ECEB0();
  sub_1891F5D84();
  if (v2)
  {
    type metadata accessor for JQRequestLaunchEventSubscribe();
    swift_deallocPartialClassInstance();
  }

  else
  {
    char v16 = 0;
    *(void *)(v1 + 16) = sub_1891F5C7C();
    *(void *)(v1 + 24) = v9;
    char v15 = 1;
    uint64_t v11 = sub_1891F5C64();
    uint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(void *)(v3 + 32) = v11;
    *(void *)(v3 + 40) = v13;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_1891EC5F8(uint64_t a1)
{
  return JQRequest.asCodable()(a1);
}

uint64_t sub_1891EC610@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 128))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_1891EC63C(uint64_t a1)
{
  return JQRequest.description.getter();
}

uint64_t sub_1891EC670@<X0>(unint64_t *a1@<X8>)
{
  *a1 = v1 | 0xA000000000000000LL;
  return swift_retain();
}

uint64_t JQRequestHelloSubscriber.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t JQRequestHelloSubscriber.init()()
{
  return v0;
}

uint64_t sub_1891EC6AC()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891EC6D4()
{
  return sub_1891F5DCC();
}

uint64_t JQRequestHelloSubscriber.deinit()
{
  return v0;
}

uint64_t JQRequestHelloSubscriber.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891EC714(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781A08);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891ECF14();
  sub_1891F5D90();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t JQRequestHelloSubscriber.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

uint64_t JQRequestHelloSubscriber.init(from:)(uint64_t a1)
{
  return v1;
}

uint64_t sub_1891EC84C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 80LL))();
}

uint64_t sub_1891EC874(uint64_t a1)
{
  return JQRequest.description.getter();
}

void JQRequestQuiesceSubscriber.type.getter(_BYTE *a1@<X8>)
{
  *a1 = *(_BYTE *)(v1 + 16);
}

void JQRequestQuiesceSubscriber.postQuiesceActions.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 24);
}

uint64_t sub_1891EC8C0@<X0>(unint64_t *a1@<X8>)
{
  *a1 = v1 | 0x8000000000000000LL;
  return swift_retain();
}

uint64_t JQRequestQuiesceSubscriber.__allocating_init(type:postQuiesceActions:)(_BYTE *a1, uint64_t *a2)
{
  uint64_t result = swift_allocObject();
  uint64_t v5 = *a2;
  *(_BYTE *)(result + 16) = *a1;
  *(void *)(result + 24) = v5;
  return result;
}

uint64_t JQRequestQuiesceSubscriber.init(type:postQuiesceActions:)(_BYTE *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(_BYTE *)(v2 + 16) = *a1;
  *(void *)(v2 + 24) = v3;
  return v2;
}

uint64_t sub_1891EC944(char a1)
{
  if ((a1 & 1) != 0) {
    return 0xD000000000000012LL;
  }
  else {
    return 1701869940LL;
  }
}

uint64_t sub_1891EC978()
{
  return sub_1891EC944(*v0);
}

uint64_t sub_1891EC980@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1891EDA64(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1891EC9A4()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891EC9CC()
{
  return sub_1891F5DCC();
}

uint64_t JQRequestQuiesceSubscriber.deinit()
{
  return v0;
}

uint64_t JQRequestQuiesceSubscriber.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891ECA0C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781A10);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891ECF58();
  sub_1891F5D90();
  char v13 = *(_BYTE *)(v3 + 16);
  char v12 = 0;
  sub_1891ECF9C();
  sub_1891F5CF4();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + 24);
    v10[15] = 1;
    sub_1891DBBDC();
    sub_1891F5CF4();
  }

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t JQRequestQuiesceSubscriber.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  JQRequestQuiesceSubscriber.init(from:)(a1);
  return v2;
}

uint64_t JQRequestQuiesceSubscriber.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781A28);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891ECF58();
  sub_1891F5D84();
  if (v2)
  {
    type metadata accessor for JQRequestQuiesceSubscriber();
    swift_deallocPartialClassInstance();
  }

  else
  {
    char v11 = 0;
    sub_1891ED000();
    sub_1891F5C94();
    *(_BYTE *)(v1 + 16) = v12;
    char v10 = 1;
    sub_1891DBEA0();
    sub_1891F5C94();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(void *)(v1 + 24) = v9[1];
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t sub_1891ECD38()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 96LL))();
}

uint64_t sub_1891ECD60(uint64_t a1)
{
  return JQRequest.description.getter();
}

void *sub_1891ECD94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v11 = 0LL;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
  NotCoded.init(wrappedValue:)((uint64_t)&v11, v8, (uint64_t)v10);
  v4[4] = v10[0];
  v4[2] = a2;
  v4[3] = a3;
  uint64_t v11 = a1;
  swift_beginAccess();
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C781848);
  NotCoded.wrappedValue.setter((uint64_t)&v11);
  swift_endAccess();
  return v4;
}

unint64_t sub_1891ECE4C()
{
  unint64_t result = qword_18C786D10;
  if (!qword_18C786D10)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8F14, &type metadata for JQRequestSubscribe.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C786D10);
  }

  return result;
}

uint64_t type metadata accessor for JQRequestSubscribe()
{
  return objc_opt_self();
}

unint64_t sub_1891ECEB0()
{
  unint64_t result = qword_18C786D18;
  if (!qword_18C786D18)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8EC4, &type metadata for JQRequestLaunchEventSubscribe.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C786D18);
  }

  return result;
}

uint64_t type metadata accessor for JQRequestLaunchEventSubscribe()
{
  return objc_opt_self();
}

unint64_t sub_1891ECF14()
{
  unint64_t result = qword_18C786D20;
  if (!qword_18C786D20)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8E74, &type metadata for JQRequestHelloSubscriber.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C786D20);
  }

  return result;
}

unint64_t sub_1891ECF58()
{
  unint64_t result = qword_18C786D28[0];
  if (!qword_18C786D28[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8E24, &type metadata for JQRequestQuiesceSubscriber.CodingKeys);
    atomic_store(result, qword_18C786D28);
  }

  return result;
}

unint64_t sub_1891ECF9C()
{
  unint64_t result = qword_18C781A18;
  if (!qword_18C781A18)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for JQNotificationType,  &type metadata for JQNotificationType);
    atomic_store(result, (unint64_t *)&qword_18C781A18);
  }

  return result;
}

uint64_t type metadata accessor for JQRequestQuiesceSubscriber()
{
  return objc_opt_self();
}

unint64_t sub_1891ED000()
{
  unint64_t result = qword_18C781A30;
  if (!qword_18C781A30)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for JQNotificationType,  &type metadata for JQNotificationType);
    atomic_store(result, (unint64_t *)&qword_18C781A30);
  }

  return result;
}

uint64_t sub_1891ED044(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1891DD428( (unint64_t *)&unk_18C781A40,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestSubscribe,  (uint64_t)&protocol conformance descriptor for JQRequestSubscribe);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1891ED080(void *a1, uint64_t a2)
{
  a1[1] = sub_1891DD428( &qword_18C781A98,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestSubscribe,  (uint64_t)&protocol conformance descriptor for JQRequestSubscribe);
  a1[2] = sub_1891DD428( &qword_18C781AA0,  v3,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestSubscribe,  (uint64_t)&protocol conformance descriptor for JQRequestSubscribe);
  uint64_t result = sub_1891DD428( &qword_18C781AA8,  v4,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestSubscribe,  (uint64_t)&protocol conformance descriptor for JQRequestSubscribe);
  a1[3] = result;
  return result;
}

uint64_t sub_1891ED0F8(void *a1, uint64_t a2)
{
  a1[1] = sub_1891DD428( &qword_18C781AF8,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestLaunchEventSubscribe,  (uint64_t)&protocol conformance descriptor for JQRequestLaunchEventSubscribe);
  a1[2] = sub_1891DD428( &qword_18C781B00,  v3,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestLaunchEventSubscribe,  (uint64_t)&protocol conformance descriptor for JQRequestLaunchEventSubscribe);
  uint64_t result = sub_1891DD428( &qword_18C781B08,  v4,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestLaunchEventSubscribe,  (uint64_t)&protocol conformance descriptor for JQRequestLaunchEventSubscribe);
  a1[3] = result;
  return result;
}

uint64_t sub_1891ED170(void *a1, uint64_t a2)
{
  a1[1] = sub_1891DD428( &qword_18C781B58,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestHelloSubscriber,  (uint64_t)&protocol conformance descriptor for JQRequestHelloSubscriber);
  a1[2] = sub_1891DD428( &qword_18C781B60,  v3,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestHelloSubscriber,  (uint64_t)&protocol conformance descriptor for JQRequestHelloSubscriber);
  uint64_t result = sub_1891DD428( &qword_18C781B68,  v4,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestHelloSubscriber,  (uint64_t)&protocol conformance descriptor for JQRequestHelloSubscriber);
  a1[3] = result;
  return result;
}

uint64_t type metadata accessor for JQRequestHelloSubscriber()
{
  return objc_opt_self();
}

uint64_t sub_1891ED208(void *a1, uint64_t a2)
{
  a1[1] = sub_1891DD428( &qword_18C781BB8,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestQuiesceSubscriber,  (uint64_t)&protocol conformance descriptor for JQRequestQuiesceSubscriber);
  a1[2] = sub_1891DD428( &qword_18C781BC0,  v3,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestQuiesceSubscriber,  (uint64_t)&protocol conformance descriptor for JQRequestQuiesceSubscriber);
  uint64_t result = sub_1891DD428( &qword_18C781BC8,  v4,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestQuiesceSubscriber,  (uint64_t)&protocol conformance descriptor for JQRequestQuiesceSubscriber);
  a1[3] = result;
  return result;
}

uint64_t method lookup function for JQRequestSubscribe()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQRequestSubscribe.endpoint.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96LL))();
}

uint64_t dispatch thunk of JQRequestSubscribe.endpoint.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104LL))();
}

uint64_t dispatch thunk of JQRequestSubscribe.endpoint.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112LL))();
}

uint64_t dispatch thunk of JQRequestSubscribe.asCodable()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120LL))();
}

uint64_t dispatch thunk of JQRequestSubscribe.__allocating_init(endpoint:subscriberName:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of JQRequestSubscribe.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t dispatch thunk of JQRequestSubscribe.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t method lookup function for JQRequestLaunchEventSubscribe()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQRequestLaunchEventSubscribe.asXPC()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96LL))();
}

uint64_t dispatch thunk of static JQRequestLaunchEventSubscribe.from(xpc:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of JQRequestLaunchEventSubscribe.__allocating_init(subscriberName:jobGroup:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of JQRequestLaunchEventSubscribe.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120LL))();
}

uint64_t dispatch thunk of JQRequestLaunchEventSubscribe.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t method lookup function for JQRequestHelloSubscriber()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQRequestHelloSubscriber.asCodable()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 80LL))();
}

uint64_t dispatch thunk of JQRequestHelloSubscriber.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of JQRequestHelloSubscriber.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96LL))();
}

uint64_t dispatch thunk of JQRequestHelloSubscriber.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for JQRequestQuiesceSubscriber()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQRequestQuiesceSubscriber.asCodable()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96LL))();
}

uint64_t dispatch thunk of JQRequestQuiesceSubscriber.__allocating_init(type:postQuiesceActions:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of JQRequestQuiesceSubscriber.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112LL))();
}

uint64_t dispatch thunk of JQRequestQuiesceSubscriber.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

ValueMetadata *type metadata accessor for JQRequestQuiesceSubscriber.CodingKeys()
{
  return &type metadata for JQRequestQuiesceSubscriber.CodingKeys;
}

ValueMetadata *type metadata accessor for JQRequestHelloSubscriber.CodingKeys()
{
  return &type metadata for JQRequestHelloSubscriber.CodingKeys;
}

ValueMetadata *type metadata accessor for JQRequestLaunchEventSubscribe.CodingKeys()
{
  return &type metadata for JQRequestLaunchEventSubscribe.CodingKeys;
}

uint64_t _s13JobQuiescence26JQRequestQuiesceSubscriberC10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1891ED4CC + 4 * byte_1891F8805[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1891ED500 + 4 * byte_1891F8800[v4]))();
}

uint64_t sub_1891ED500(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891ED508(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891ED510LL);
  }
  return result;
}

uint64_t sub_1891ED51C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891ED524LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1891ED528(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891ED530(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JQRequestSubscribe.CodingKeys()
{
  return &type metadata for JQRequestSubscribe.CodingKeys;
}

unint64_t sub_1891ED550()
{
  unint64_t result = qword_18C7876B0[0];
  if (!qword_18C7876B0[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8C3C, &type metadata for JQRequestSubscribe.CodingKeys);
    atomic_store(result, qword_18C7876B0);
  }

  return result;
}

unint64_t sub_1891ED598()
{
  unint64_t result = qword_18C7878C0[0];
  if (!qword_18C7878C0[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8CF4, &type metadata for JQRequestLaunchEventSubscribe.CodingKeys);
    atomic_store(result, qword_18C7878C0);
  }

  return result;
}

unint64_t sub_1891ED5E0()
{
  unint64_t result = qword_18C787BD0[0];
  if (!qword_18C787BD0[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8DFC, &type metadata for JQRequestQuiesceSubscriber.CodingKeys);
    atomic_store(result, qword_18C787BD0);
  }

  return result;
}

unint64_t sub_1891ED628()
{
  unint64_t result = qword_18C787CE0;
  if (!qword_18C787CE0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8D6C, &type metadata for JQRequestQuiesceSubscriber.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C787CE0);
  }

  return result;
}

unint64_t sub_1891ED670()
{
  unint64_t result = qword_18C787CE8[0];
  if (!qword_18C787CE8[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8D94, &type metadata for JQRequestQuiesceSubscriber.CodingKeys);
    atomic_store(result, qword_18C787CE8);
  }

  return result;
}

unint64_t sub_1891ED6B8()
{
  unint64_t result = qword_18C787D70;
  if (!qword_18C787D70)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8D1C, &type metadata for JQRequestHelloSubscriber.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C787D70);
  }

  return result;
}

unint64_t sub_1891ED700()
{
  unint64_t result = qword_18C787D78;
  if (!qword_18C787D78)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8D44, &type metadata for JQRequestHelloSubscriber.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C787D78);
  }

  return result;
}

unint64_t sub_1891ED748()
{
  unint64_t result = qword_18C787E00;
  if (!qword_18C787E00)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8C64, &type metadata for JQRequestLaunchEventSubscribe.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C787E00);
  }

  return result;
}

unint64_t sub_1891ED790()
{
  unint64_t result = qword_18C787E08[0];
  if (!qword_18C787E08[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8C8C, &type metadata for JQRequestLaunchEventSubscribe.CodingKeys);
    atomic_store(result, qword_18C787E08);
  }

  return result;
}

unint64_t sub_1891ED7D8()
{
  unint64_t result = qword_18C787E90;
  if (!qword_18C787E90)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8BAC, &type metadata for JQRequestSubscribe.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C787E90);
  }

  return result;
}

unint64_t sub_1891ED820()
{
  unint64_t result = qword_18C787E98[0];
  if (!qword_18C787E98[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F8BD4, &type metadata for JQRequestSubscribe.CodingKeys);
    atomic_store(result, qword_18C787E98);
  }

  return result;
}

uint64_t sub_1891ED864(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6269726373627573LL && a2 == 0xEE00656D614E7265LL;
  if (v3 || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x746E696F70646E65LL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1891ED964(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6269726373627573LL && a2 == 0xEE00656D614E7265LL;
  if (v3 || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x70756F7247626F6ALL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1891EDA64(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701869940 && a2 == 0xE400000000000000LL;
  if (v3 || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0xD000000000000012LL && a2 == 0x80000001891FA9A0LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1891EDB3C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v68 = a1;
  uint64_t v67 = a4;
  v70 = a6;
  uint64_t v65 = *(void *)(a3 - 8);
  uint64_t v9 = MEMORY[0x1895F8858](a1);
  v66 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v9);
  char v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v13);
  v64 = (char *)&v59 - v16;
  uint64_t v17 = sub_1891F5A0C();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x1895F8858](v17);
  uint64_t v21 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v19);
  unint64_t v23 = (char *)&v59 - v22;
  uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(a5 + 56);
  uint64_t v63 = a5;
  uint64_t v25 = v24(a3, a5);
  uint64_t v26 = *(void *)(v25 + 16);
  if (v26)
  {
    uint64_t v27 = 32LL;
    while (*(void *)(v25 + v27) != a2)
    {
      v27 += 16LL;
      if (!--v26) {
        goto LABEL_5;
      }
    }

    swift_bridgeObjectRelease();
    uint64_t v40 = sub_1891EEAC8();
    os_log_type_t v41 = v23;
    uint64_t v42 = v17;
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v23, v40, v17);
    uint64_t v43 = v12;
    uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    uint64_t v45 = v64;
    v44(v64, v69, a2);
    uint64_t v46 = v65;
    uint64_t v47 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v66, v68, a3);
    uint64_t v48 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v49 = sub_1891F5B2C();
    LODWORD(v69) = v49;
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = v45;
      uint64_t v51 = swift_slowAlloc();
      uint64_t v61 = swift_slowAlloc();
      uint64_t v72 = v61;
      *(_DWORD *)uint64_t v51 = 136446466;
      v62 = v41;
      os_log_t v60 = v48;
      uint64_t v52 = sub_1891F5D0C();
      uint64_t v71 = sub_1891E24FC(v52, v53, &v72);
      uint64_t v68 = v18;
      sub_1891F5BA4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v50, a2);
      *(_WORD *)(v51 + 12) = 2082;
      uint64_t v54 = v66;
      uint64_t v55 = sub_1891F5D0C();
      uint64_t v71 = sub_1891E24FC(v55, v56, &v72);
      sub_1891F5BA4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v54, a3);
      os_log_t v57 = v60;
      _os_log_impl(&dword_1891D9000, v60, (os_log_type_t)v69, "%{public}s: sending %{public}s", (uint8_t *)v51, 0x16u);
      uint64_t v58 = v61;
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v58, -1LL, -1LL);
      MEMORY[0x1895E33A4](v51, -1LL, -1LL);

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v62, v42);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v43 + 8))(v45, a2);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v47, a3);

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v41, v42);
    }

    char v39 = 12;
  }

  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    uint64_t v28 = sub_1891EEAC8();
    uint64_t v68 = v18;
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, v28, v17);
    uint64_t v29 = v12;
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v69, a2);
    uint64_t v30 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v31 = sub_1891F5B44();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      uint64_t v72 = v69;
      *(_DWORD *)uint64_t v32 = 136446466;
      uint64_t v33 = sub_1891F5DD8();
      uint64_t v71 = sub_1891E24FC(v33, v34, &v72);
      v66 = (char *)v17;
      sub_1891F5BA4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2082;
      uint64_t v35 = sub_1891F5D0C();
      uint64_t v71 = sub_1891E24FC(v35, v36, &v72);
      sub_1891F5BA4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v15, a2);
      _os_log_impl( &dword_1891D9000,  v30,  v31,  "Request type %{public}s not permitted on connection %{public}s",  (uint8_t *)v32,  0x16u);
      uint64_t v37 = v69;
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v37, -1LL, -1LL);
      MEMORY[0x1895E33A4](v32, -1LL, -1LL);

      uint64_t result = (*(uint64_t (**)(char *, char *))(v68 + 8))(v21, v66);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, a2);

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v21, v17);
    }

    char v39 = 3;
  }

  char *v70 = v39;
  return result;
}

uint64_t sub_1891EE0B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1891EE904((void (*)(_BYTE *))sub_1891EEA28, a1);
}

void sub_1891EE120( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v70 = a7;
  v66[1] = a5;
  uint64_t v73 = *(void *)(a4 - 8);
  uint64_t v74 = a2;
  uint64_t v14 = MEMORY[0x1895F8858](a1);
  uint64_t v71 = (char *)v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x1895F8858](v14);
  v66[0] = (char *)v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v18);
  uint64_t v68 = (char *)v66 - v20;
  uint64_t v75 = sub_1891F5A0C();
  uint64_t v21 = *(void *)(v75 - 8);
  uint64_t v22 = MEMORY[0x1895F8858](v75);
  uint64_t v69 = (char *)v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = MEMORY[0x1895F8858](v22);
  os_log_t v67 = (os_log_t)((char *)v66 - v25);
  MEMORY[0x1895F8858](v24);
  uint64_t v72 = (char *)v66 - v26;
  sub_1891F2FC8(a1);
  if (v8)
  {
    uint64_t v27 = v74;
    uint64_t v28 = v75;
    static JQError.from(xpc:)(a1, &v77);
    uint64_t v73 = v8;
    int v43 = v77;
    uint64_t v44 = sub_1891EEAC8();
    uint64_t v45 = v21;
    os_log_t v46 = v67;
    (*(void (**)(os_log_t, uint64_t, uint64_t))(v21 + 16))(v67, v44, v28);
    uint64_t v47 = v17;
    uint64_t v48 = *(void (**)(void, uint64_t, uint64_t))(v17 + 16);
    uint64_t v49 = v66[0];
    v48(v66[0], v27, a3);
    uint64_t v50 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v51 = sub_1891F5B44();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v53 = swift_slowAlloc();
      LODWORD(v72) = v43;
      uint64_t v54 = v53;
      uint64_t v55 = swift_slowAlloc();
      v77 = (char *)v55;
      *(_DWORD *)uint64_t v54 = 136446466;
      uint64_t v74 = v45;
      uint64_t v56 = sub_1891F5D0C();
      uint64_t v76 = sub_1891E24FC(v56, v57, (uint64_t *)&v77);
      sub_1891F5BA4();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v49, a3);
      *(_WORD *)(v54 + 12) = 2082;
      char v58 = (char)v72;
      LOBYTE(v76) = (_BYTE)v72;
      uint64_t v59 = sub_1891F5AA8();
      uint64_t v76 = sub_1891E24FC(v59, v60, (uint64_t *)&v77);
      sub_1891F5BA4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1891D9000, v50, v51, "%{public}s: error %{public}s", (uint8_t *)v54, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v55, -1LL, -1LL);
      MEMORY[0x1895E33A4](v54, -1LL, -1LL);

      (*(void (**)(os_log_t, uint64_t))(v74 + 8))(v67, v75);
      uint64_t v61 = (void *)v73;
      char v62 = v58;
    }

    else
    {
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v49, a3);

      (*(void (**)(os_log_t, uint64_t))(v45 + 8))(v46, v28);
      uint64_t v61 = (void *)v73;
      char v62 = v43;
    }

    sub_1891E24B8();
    uint64_t v63 = swift_allocError();
    _BYTE *v64 = v62;
    swift_willThrow();
    uint64_t v65 = (uint64_t *)v70;

    *uint64_t v65 = v63;
  }

  else
  {
    uint64_t v70 = a6;
    uint64_t v29 = sub_1891EEAC8();
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v72, v29, v75);
    uint64_t v30 = v68;
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v68, v74, a3);
    (*(void (**)(char *, uint64_t, uint64_t))(v73 + 16))(v71, a8, a4);
    os_log_type_t v31 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v32 = sub_1891F5B2C();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      v66[0] = v17;
      os_log_t v67 = v31;
      uint64_t v34 = a3;
      uint64_t v35 = v33;
      uint64_t v69 = (char *)swift_slowAlloc();
      v77 = v69;
      *(_DWORD *)uint64_t v35 = 136446466;
      uint64_t v74 = v21;
      uint64_t v36 = sub_1891F5D0C();
      uint64_t v76 = sub_1891E24FC(v36, v37, (uint64_t *)&v77);
      sub_1891F5BA4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v66[0] + 8LL))(v30, v34);
      *(_WORD *)(v35 + 12) = 2082;
      uint64_t v38 = v71;
      uint64_t v39 = (*(uint64_t (**)(uint64_t))(v70 + 24))(a4);
      uint64_t v76 = sub_1891E24FC(v39, v40, (uint64_t *)&v77);
      sub_1891F5BA4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v38, a4);
      os_log_t v41 = v67;
      _os_log_impl(&dword_1891D9000, v67, v32, "%{public}s: received %{public}s", (uint8_t *)v35, 0x16u);
      uint64_t v42 = v69;
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v42, -1LL, -1LL);
      MEMORY[0x1895E33A4](v35, -1LL, -1LL);

      (*(void (**)(char *, uint64_t))(v74 + 8))(v72, v75);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v30, a3);
      (*(void (**)(char *, uint64_t))(v73 + 8))(v71, a4);

      (*(void (**)(char *, uint64_t))(v21 + 8))(v72, v75);
    }
  }

uint64_t sub_1891EE904@<X0>(void (*a1)(_BYTE *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v6 = sub_1891F5D78();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v9 = &v11[-v8];
  a1(v5);
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v7 + 32))(a2, v9, v6);
}

uint64_t JQConnection.description.getter()
{
  return sub_1891F5DD8();
}

void sub_1891EEA28(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_1891EEA4C()
{
  uint64_t v0 = sub_1891F5A0C();
  __swift_allocate_value_buffer(v0, qword_18C4FF5D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_18C4FF5D8);
  sub_1891F4D44();
  swift_bridgeObjectRetain();
  return sub_1891F5A00();
}

uint64_t sub_1891EEAC8()
{
  if (qword_18C4FF5B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1891F5A0C();
  return __swift_project_value_buffer(v0, (uint64_t)qword_18C4FF5D8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }

  return a2;
}

uint64_t dispatch thunk of JQRequest.asCodable()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static JQRequest.allowedConnectionTypes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of JQRequest.asXPC()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of JQResponse.description.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t (*sub_1891EEBAC())()
{
  return sub_1891DC108;
}

uint64_t (*sub_1891EEBBC())()
{
  return nullsub_1;
}

unint64_t sub_1891EEBCC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t))
{
  if (a1 <= 1) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = a1;
  }
  unint64_t result = a6(1LL);
  if (v6)
  {
    if (v9 == 1)
    {
      return swift_willThrow();
    }

    else
    {
      sub_1891EED00();
      uint64_t v11 = sub_1891F5DA8();
      MEMORY[0x1895E2F84](a2, a3, v11, v12);
      if (sub_1891F5D9C() < 1)
      {
LABEL_6:

        return a6(2LL);
      }

      unint64_t result = sub_1891F5D9C();
      if ((result & 0x8000000000000000LL) != 0)
      {
        __break(1u);
      }

      else if (!HIDWORD(result))
      {
        sleep(result);
        goto LABEL_6;
      }

      __break(1u);
    }
  }

  return result;
}

unint64_t sub_1891EED00()
{
  unint64_t result = qword_18C781E28;
  if (!qword_18C781E28)
  {
    unint64_t result = MEMORY[0x1895E3314](MEMORY[0x18961A888], MEMORY[0x18961A860]);
    atomic_store(result, (unint64_t *)&qword_18C781E28);
  }

  return result;
}

uint64_t JQTaskDescriptor.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JQTaskDescriptor.pid.getter()
{
  return *(unsigned int *)(v0 + 16);
}

uint64_t JQTaskDescriptor.duration.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t JQTaskDescriptor.jobGroup.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JQTaskDescriptor.init(name:pid:duration:jobGroup:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(void *)a8 = result;
  *(void *)(a8 + 8) = a2;
  *(_DWORD *)(a8 + 16) = a3;
  *(void *)(a8 + 24) = a4;
  *(_BYTE *)(a8 + 32) = a5 & 1;
  *(void *)(a8 + 40) = a6;
  *(void *)(a8 + 48) = a7;
  return result;
}

uint64_t sub_1891EEDD0(char a1)
{
  return *(void *)&aName_2[8 * a1];
}

uint64_t sub_1891EEDF0()
{
  return sub_1891EEDD0(*v0);
}

uint64_t sub_1891EEDF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1891F127C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1891EEE1C()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891EEE44()
{
  return sub_1891F5DCC();
}

uint64_t JQTaskDescriptor.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781E30);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int v17 = *(_DWORD *)(v1 + 16);
  uint64_t v16 = *(void *)(v1 + 24);
  int v15 = *(unsigned __int8 *)(v1 + 32);
  uint64_t v8 = *(void *)(v1 + 40);
  v14[0] = *(void *)(v1 + 48);
  v14[1] = v8;
  uint64_t v9 = a1[3];
  uint64_t v10 = a1;
  uint64_t v12 = v11;
  __swift_project_boxed_opaque_existential_1(v10, v9);
  sub_1891EF018();
  sub_1891F5D90();
  char v21 = 0;
  sub_1891F5CDC();
  if (!v2)
  {
    char v20 = 1;
    sub_1891F5D00();
    char v19 = 2;
    sub_1891F5CD0();
    char v18 = 3;
    sub_1891F5CC4();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v12);
}

unint64_t sub_1891EF018()
{
  unint64_t result = qword_18C787F20[0];
  if (!qword_18C787F20[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F91C8, &type metadata for JQTaskDescriptor.CodingKeys);
    atomic_store(result, qword_18C787F20);
  }

  return result;
}

uint64_t JQTaskDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C781E38);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891EF018();
  sub_1891F5D84();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v26 = 0;
  uint64_t v9 = sub_1891F5C7C();
  uint64_t v11 = v10;
  char v25 = 1;
  swift_bridgeObjectRetain();
  int v22 = sub_1891F5CA0();
  char v24 = 2;
  uint64_t v12 = sub_1891F5C70();
  HIDWORD(v20) = v13;
  uint64_t v21 = v12;
  char v23 = 3;
  uint64_t v14 = sub_1891F5C64();
  uint64_t v17 = v16;
  char v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v19 = v14;
  v18(v8, v5);
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(_DWORD *)(a2 + 16) = v22;
  *(void *)(a2 + 24) = v21;
  *(_BYTE *)(a2 + 32) = BYTE4(v20) & 1;
  *(void *)(a2 + 40) = v19;
  *(void *)(a2 + 48) = v17;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1891EF270@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return JQTaskDescriptor.init(from:)(a1, a2);
}

uint64_t sub_1891EF284(void *a1)
{
  return JQTaskDescriptor.encode(to:)(a1);
}

BOOL sub_1891EF298(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1891EF2A8()
{
  return sub_1891F5D60();
}

uint64_t sub_1891EF2CC()
{
  return sub_1891F5D6C();
}

uint64_t JQTask.description.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  int v3 = *(_DWORD *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  char v5 = *(_BYTE *)(v1 + 48);
  uint64_t v7 = *(void *)(v1 + 56);
  uint64_t v6 = *(void *)(v1 + 64);
  *(void *)a1 = *(void *)(v1 + 16);
  *(void *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1891EF358()
{
  return swift_retain();
}

uint64_t sub_1891EF360()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1891EF368()
{
  return *(unsigned __int8 *)(v0 + 88);
}

uint64_t sub_1891EF398(char a1)
{
  uint64_t result = swift_beginAccess();
  *(_BYTE *)(v1 + 88) = a1;
  return result;
}

uint64_t (*sub_1891EF3D4())()
{
  return j__swift_endAccess;
}

uint64_t sub_1891EF410()
{
  if ((*(unsigned __int8 (**)(void))(*v0 + 112LL))())
  {
    sub_1891E24B8();
    swift_allocError();
    _BYTE *v1 = 9;
    return swift_willThrow();
  }

  else
  {
    int v3 = (_xpc_connection_s *)v0[10];
    uint64_t v4 = swift_allocObject();
    swift_weakInit();
    v6[4] = sub_1891EFA34;
    v6[5] = v4;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 1107296256LL;
    v6[2] = sub_1891E0910;
    v6[3] = &block_descriptor_1;
    char v5 = _Block_copy(v6);
    swift_release();
    xpc_connection_set_event_handler(v3, v5);
    _Block_release(v5);
    xpc_connection_activate(v3);
    return sub_1891F010C();
  }

uint64_t sub_1891EF524()
{
  return swift_deallocObject();
}

uint64_t sub_1891EF548(_xpc_connection_s *a1)
{
  uint64_t v2 = sub_1891F5A0C();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1895F8858](v2);
  uint64_t v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v4);
  uint64_t v8 = (char *)v32 - v7;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = (void *)result;
    uint64_t v11 = MEMORY[0x1895E3530](a1);
    if (v11 == sub_1891F5A30())
    {
      uint64_t v23 = sub_1891EEAC8();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v23, v2);
      swift_retain();
      char v24 = (os_log_s *)sub_1891F59F4();
      os_log_type_t v25 = sub_1891F5B38();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v34 = v2;
        char v26 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        aBlock[0] = v33;
        *(_DWORD *)char v26 = 136446210;
        v32[1] = v26 + 4;
        uint64_t v28 = v10[2];
        unint64_t v27 = v10[3];
        swift_bridgeObjectRetain();
        uint64_t v36 = sub_1891E24FC(v28, v27, aBlock);
        sub_1891F5BA4();
        swift_release();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1891D9000, v24, v25, "Server connected to task %{public}s", v26, 0xCu);
        uint64_t v29 = v33;
        swift_arrayDestroy();
        MEMORY[0x1895E33A4](v29, -1LL, -1LL);
        MEMORY[0x1895E33A4](v26, -1LL, -1LL);

        (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v34);
      }

      else
      {

        swift_release();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      }

      uint64_t v30 = swift_allocObject();
      swift_weakInit();
      aBlock[4] = (uint64_t)sub_1891F1444;
      aBlock[5] = v30;
      aBlock[0] = MEMORY[0x1895F87A8];
      aBlock[1] = 1107296256LL;
      aBlock[2] = (uint64_t)sub_1891E0910;
      aBlock[3] = (uint64_t)&block_descriptor_7;
      os_log_type_t v31 = _Block_copy(aBlock);
      swift_release();
      xpc_connection_set_event_handler(a1, v31);
      _Block_release(v31);
      xpc_connection_activate(a1);
    }

    else
    {
      uint64_t v12 = MEMORY[0x1895E3530](a1);
      if (v12 == sub_1891F5A18() && (*(unsigned __int8 (**)(void))(*v10 + 112LL))() != 2)
      {
        uint64_t v13 = sub_1891EEAC8();
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v13, v2);
        swift_retain_n();
        swift_unknownObjectRetain_n();
        uint64_t v14 = (os_log_s *)sub_1891F59F4();
        os_log_type_t v15 = sub_1891F5B44();
        if (os_log_type_enabled(v14, v15))
        {
          uint64_t v16 = swift_slowAlloc();
          uint64_t v17 = swift_slowAlloc();
          uint64_t v33 = v17;
          *(_DWORD *)uint64_t v16 = 136446466;
          uint64_t v34 = v2;
          aBlock[0] = v17;
          uint64_t v19 = v10[2];
          unint64_t v18 = v10[3];
          swift_bridgeObjectRetain();
          uint64_t v36 = sub_1891E24FC(v19, v18, aBlock);
          sub_1891F5BA4();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v16 + 12) = 2080;
          uint64_t v36 = (uint64_t)a1;
          swift_unknownObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
          uint64_t v20 = sub_1891F5AA8();
          uint64_t v36 = sub_1891E24FC(v20, v21, aBlock);
          sub_1891F5BA4();
          swift_unknownObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1891D9000, v14, v15, "Task %{public}s listener error: %s", (uint8_t *)v16, 0x16u);
          uint64_t v22 = v33;
          swift_arrayDestroy();
          MEMORY[0x1895E33A4](v22, -1LL, -1LL);
          MEMORY[0x1895E33A4](v16, -1LL, -1LL);
          swift_release();

          return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v34);
        }

        else
        {

          swift_unknownObjectRelease_n();
          swift_release_n();
          return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        }
      }
    }

    return swift_release();
  }

  return result;
}

uint64_t sub_1891EFA34(_xpc_connection_s *a1)
{
  return sub_1891EF548(a1);
}

uint64_t sub_1891EFA3C(uint64_t a1)
{
  uint64_t v2 = sub_1891F5A0C();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1895F8858](v2);
  MEMORY[0x1895F8858](v4);
  uint64_t v6 = (char *)&v24 - v5;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v8 = (void *)result;
    uint64_t v9 = MEMORY[0x1895E3530](a1);
    if (v9 == sub_1891F5A18())
    {
      uint64_t v10 = sub_1891EEAC8();
      uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
      v11(v6, v10, v2);
      swift_retain_n();
      swift_unknownObjectRetain_n();
      uint64_t v12 = (os_log_s *)sub_1891F59F4();
      os_log_type_t v13 = sub_1891F5B44();
      int v14 = v13;
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v15 = swift_slowAlloc();
        os_log_t v26 = v12;
        uint64_t v16 = v15;
        uint64_t v27 = swift_slowAlloc();
        v31[0] = v27;
        *(_DWORD *)uint64_t v16 = 136446466;
        uint64_t v28 = v10;
        uint64_t v29 = v11;
        int v25 = v14;
        uint64_t v18 = v8[2];
        unint64_t v17 = v8[3];
        swift_bridgeObjectRetain();
        uint64_t v30 = sub_1891E24FC(v18, v17, v31);
        sub_1891F5BA4();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 12) = 2080;
        uint64_t v30 = a1;
        swift_unknownObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF4C0);
        uint64_t v19 = sub_1891F5AA8();
        uint64_t v30 = sub_1891E24FC(v19, v20, v31);
        sub_1891F5BA4();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        os_log_t v21 = v26;
        _os_log_impl( &dword_1891D9000,  v26,  (os_log_type_t)v25,  "Task %{public}s error from server: %s",  (uint8_t *)v16,  0x16u);
        uint64_t v22 = v27;
        swift_arrayDestroy();
        MEMORY[0x1895E33A4](v22, -1LL, -1LL);
        MEMORY[0x1895E33A4](v16, -1LL, -1LL);
      }

      else
      {

        swift_unknownObjectRelease_n();
        swift_release_n();
      }

      uint64_t v23 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      if ((*(unsigned __int8 (**)(uint64_t))(*v8 + 112LL))(v23) == 1)
      {
        swift_allocObject();
        swift_weakInit();
        sub_1891EEBBC();
        sub_1891EEBCC(2LL, 0LL, 0LL, 0LL, 0LL, (uint64_t (*)(uint64_t))sub_1891F144C);
        swift_release();
        swift_release();
      }
    }

    return swift_release();
  }

  return result;
}

uint64_t sub_1891EFE78()
{
  uint64_t v0 = sub_1891F5A0C();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858](v0);
  uint64_t v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = sub_1891EEAC8();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v6, v0);
    swift_retain();
    uint64_t v7 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v8 = sub_1891F5B2C();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v19 = v17;
      uint64_t v16 = v9;
      *(_DWORD *)uint64_t v9 = 136446210;
      v15[1] = v9 + 4;
      uint64_t v10 = *(void *)(v5 + 16);
      unint64_t v11 = *(void *)(v5 + 24);
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_1891E24FC(v10, v11, &v19);
      sub_1891F5BA4();
      swift_release();
      swift_bridgeObjectRelease();
      os_log_type_t v12 = v8;
      os_log_type_t v13 = v16;
      _os_log_impl(&dword_1891D9000, v7, v12, "Task %{public}s  interrupted. Re-registering.", v16, 0xCu);
      uint64_t v14 = v17;
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v14, -1LL, -1LL);
      MEMORY[0x1895E33A4](v13, -1LL, -1LL);
    }

    else
    {

      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1891F010C();
    return swift_release();
  }

  return result;
}

BOOL sub_1891F0090(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C781E20);
  return swift_dynamicCast() && v3 == 6;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_1891F010C()
{
  void (*v28)(id *__return_ptr, uint64_t *, uint64_t, unint64_t);
  unint64_t v29;
  id v30;
  id v31;
  id v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  os_log_s *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  os_log_s *v46;
  os_log_type_t v47;
  uint8_t *v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  os_log_s *v52;
  os_log_type_t v53;
  uint64_t v54;
  id v55;
  unint64_t v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint8_t *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  id v70;
  unint64_t v71;
  int v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = sub_1891F5A0C();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](v4);
  os_log_type_t v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = MEMORY[0x1895F8858](v6);
  unint64_t v11 = (char *)&v61 - v10;
  uint64_t v12 = MEMORY[0x1895F8858](v9);
  uint64_t v14 = (char *)&v61 - v13;
  if ((*(unsigned __int8 (**)(uint64_t))(*(void *)v0 + 112LL))(v12) == 2)
  {
    sub_1891E24B8();
    swift_allocError();
    *uint64_t v15 = 9;
    return swift_willThrow();
  }

  uint64_t v65 = v8;
  v66 = v11;
  os_log_t v67 = v4;
  uint64_t v68 = v5;
  uint64_t v17 = type metadata accessor for JQRequestRegisterTask();
  xpc_endpoint_t v18 = xpc_endpoint_create(*(xpc_connection_t *)(v0 + 80));
  unint64_t v20 = *(void **)(v0 + 16);
  unint64_t v19 = *(void *)(v0 + 24);
  int v21 = *(_DWORD *)(v0 + 32);
  uint64_t v22 = *(void *)(v0 + 40);
  char v23 = *(_BYTE *)(v0 + 48);
  uint64_t v25 = *(void *)(v0 + 56);
  uint64_t v24 = *(void *)(v0 + 64);
  uint64_t v70 = v20;
  uint64_t v71 = v19;
  uint64_t v72 = v21;
  uint64_t v73 = v22;
  uint64_t v74 = v23;
  uint64_t v75 = v25;
  uint64_t v76 = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v26 = JQRequestRegisterTask.__allocating_init(endpoint:description:)((uint64_t)v18, (uint64_t *)&v70);
  uint64_t v27 = *(void *)(v0 + 72);
  v77 = v26;
  uint64_t v28 = *(void (**)(id *__return_ptr, uint64_t *, uint64_t, unint64_t))(*(void *)v27 + 120LL);
  uint64_t v29 = sub_1891F13FC();
  v28(&v70, &v77, v17, v29);
  if (v2) {
    return swift_release();
  }
  char v62 = (uint64_t)v20;
  uint64_t v63 = v19;
  v64 = v26;
  uint64_t v30 = v70;
  if ((v71 & 1) == 0)
  {
    uint64_t v42 = sub_1891EEAC8();
    int v43 = v67;
    uint64_t v44 = v68;
    uint64_t v45 = v65;
    (*(void (**)(void *, uint64_t, uint64_t))(v68 + 16))(v65, v42, v67);
    swift_retain();
    os_log_t v46 = (os_log_s *)sub_1891F59F4();
    uint64_t v47 = sub_1891F5B2C();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      v66 = (void *)swift_slowAlloc();
      uint64_t v70 = v66;
      *(_DWORD *)uint64_t v48 = 136446210;
      uint64_t v61 = v48 + 4;
      uint64_t v49 = v63;
      swift_bridgeObjectRetain();
      v77 = sub_1891E24FC(v62, v49, (uint64_t *)&v70);
      sub_1891F5BA4();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1891D9000, v46, v47, "Server acknowledged task %{public}s", v48, 0xCu);
      uint64_t v50 = v66;
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v50, -1LL, -1LL);
      MEMORY[0x1895E33A4](v48, -1LL, -1LL);

      (*(void (**)(void *, uint64_t))(v68 + 8))(v45, v67);
    }

    else
    {

      swift_release();
      (*(void (**)(void *, uint64_t))(v44 + 8))(v45, v43);
    }

    (*(void (**)(uint64_t))(*(void *)v3 + 120LL))(1LL);
    sub_1891EA2C0(v30, 0);
    return swift_release();
  }

  os_log_type_t v31 = v70;
  os_log_type_t v32 = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C781E20);
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v69 = 11;
    sub_1891E4A80();
    uint64_t v33 = sub_1891F5A9C();
    uint64_t v34 = v67;
    uint64_t v35 = v68;
    uint64_t v36 = v66;
    if ((v33 & 1) != 0)
    {
      unint64_t v37 = sub_1891EEAC8();
      (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v14, v37, v34);
      uint64_t v38 = (os_log_s *)sub_1891F59F4();
      uint64_t v39 = sub_1891F5B50();
      if (os_log_type_enabled(v38, v39))
      {
        unint64_t v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v40 = 0;
        _os_log_impl( &dword_1891D9000,  v38,  v39,  "BUG IN CLIENT OF JOBQUIESCENCE: Task registered too late and was not acknowledged.\n Make sure you subscribe for quiescence notifications and that you begin()\n your task before your quiescence callback returns.",  v40,  2u);
        os_log_t v41 = v40;
        uint64_t v35 = v68;
        MEMORY[0x1895E33A4](v41, -1LL, -1LL);
      }

      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v34);
    }
  }

  else
  {
    uint64_t v34 = v67;
    uint64_t v35 = v68;
    uint64_t v36 = v66;
  }

  os_log_type_t v51 = sub_1891EEAC8();
  (*(void (**)(void *, uint64_t, uint64_t))(v35 + 16))(v36, v51, v34);
  sub_1891EA2CC(v30, 1);
  sub_1891EA2CC(v30, 1);
  swift_retain();
  uint64_t v52 = (os_log_s *)sub_1891F59F4();
  uint64_t v53 = sub_1891F5B44();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = swift_slowAlloc();
    uint64_t v65 = (void *)swift_slowAlloc();
    uint64_t v70 = (id)swift_slowAlloc();
    uint64_t v55 = v70;
    *(_DWORD *)uint64_t v54 = 136446466;
    uint64_t v56 = v63;
    swift_bridgeObjectRetain();
    v77 = sub_1891E24FC(v62, v56, (uint64_t *)&v70);
    sub_1891F5BA4();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v54 + 12) = 2114;
    unint64_t v57 = v30;
    char v58 = v30;
    uint64_t v59 = _swift_stdlib_bridgeErrorToNSError();
    v77 = v59;
    sub_1891F5BA4();
    unint64_t v60 = v65;
    *uint64_t v65 = v59;
    uint64_t v30 = v58;
    sub_1891EA2C0(v58, 1);
    sub_1891EA2C0(v58, 1);
    _os_log_impl( &dword_1891D9000,  v52,  v53,  "Server rejected task %{public}s with error: %{public}@",  (uint8_t *)v54,  0x16u);
    __swift_instantiateConcreteTypeFromMangledName(qword_18C781830);
    swift_arrayDestroy();
    MEMORY[0x1895E33A4](v60, -1LL, -1LL);
    swift_arrayDestroy();
    MEMORY[0x1895E33A4](v55, -1LL, -1LL);
    MEMORY[0x1895E33A4](v54, -1LL, -1LL);

    (*(void (**)(void *, uint64_t))(v68 + 8))(v66, v67);
  }

  else
  {
    swift_release();
    sub_1891EA2C0(v30, 1);
    sub_1891EA2C0(v30, 1);

    (*(void (**)(void *, uint64_t))(v35 + 8))(v36, v34);
  }

  swift_willThrow();
  sub_1891EA2C0(v30, 1);
  return swift_release();
}

void sub_1891F07C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1891F5A0C();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1895F8858](v2);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((*(unsigned __int8 (**)(uint64_t))(*(void *)v0 + 112LL))(v4) != 2)
  {
    uint64_t v7 = sub_1891EEAC8();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
    swift_retain();
    os_log_type_t v8 = (os_log_s *)sub_1891F59F4();
    os_log_type_t v9 = sub_1891F5B2C();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = v15;
      *(_DWORD *)uint64_t v10 = 136446210;
      uint64_t v14 = v10 + 4;
      uint64_t v12 = *(void *)(v1 + 16);
      unint64_t v11 = *(void *)(v1 + 24);
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_1891E24FC(v12, v11, &v17);
      sub_1891F5BA4();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1891D9000, v8, v9, "Ending task %{public}s", v10, 0xCu);
      uint64_t v13 = v15;
      swift_arrayDestroy();
      MEMORY[0x1895E33A4](v13, -1LL, -1LL);
      MEMORY[0x1895E33A4](v10, -1LL, -1LL);
    }

    else
    {

      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    (*(void (**)(uint64_t))(*(void *)v1 + 120LL))(2LL);
    xpc_connection_cancel(*(xpc_connection_t *)(v1 + 80));
  }

uint64_t JQTask.deinit()
{
  return v0;
}

uint64_t JQTask.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t JQTask.__allocating_init(conn:description:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = swift_allocObject();
  JQTask.init(conn:description:)(a1, a2);
  return v4;
}

uint64_t JQTask.init(conn:description:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  int v5 = *((_DWORD *)a2 + 4);
  uint64_t v6 = a2[3];
  char v7 = *((_BYTE *)a2 + 32);
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 16) = v3;
  *(void *)(v2 + 24) = v4;
  *(_DWORD *)(v2 + 32) = v5;
  *(void *)(v2 + 40) = v6;
  *(_BYTE *)(v2 + 48) = v7;
  *(_OWORD *)(v2 + 56) = *(_OWORD *)(a2 + 5);
  *(_BYTE *)(v2 + 88) = 0;
  swift_retain();
  *(void *)(v2 + 80) = xpc_connection_create(0LL, 0LL);
  v11[4] = sub_1891F0B94;
  v11[5] = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 1107296256LL;
  v11[2] = sub_1891E0910;
  v11[3] = &block_descriptor_3_0;
  os_log_type_t v8 = _Block_copy(v11);
  os_log_type_t v9 = (_xpc_connection_s *)swift_unknownObjectRetain();
  xpc_connection_set_event_handler(v9, v8);
  swift_release();
  _Block_release(v8);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_1891F0B94()
{
  uint64_t v0 = sub_1891F5A0C();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_1891EEAC8();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  int v5 = (os_log_s *)sub_1891F59F4();
  os_log_type_t v6 = sub_1891F5B44();
  if (os_log_type_enabled(v5, v6))
  {
    char v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v7 = 0;
    _os_log_impl(&dword_1891D9000, v5, v6, "Task listener received unexpected XPC.", v7, 2u);
    MEMORY[0x1895E33A4](v7, -1LL, -1LL);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

unint64_t sub_1891F0C90()
{
  unint64_t result = qword_18C781E48;
  if (!qword_18C781E48)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9014, &type metadata for JQTask.TaskState);
    atomic_store(result, (unint64_t *)&qword_18C781E48);
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for JQTaskDescriptor(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for JQTaskDescriptor()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for JQTaskDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for JQTaskDescriptor(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for JQTaskDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JQTaskDescriptor(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JQTaskDescriptor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 56) = 1;
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

    *(_BYTE *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for JQTaskDescriptor()
{
  return &type metadata for JQTaskDescriptor;
}

uint64_t type metadata accessor for JQTask()
{
  return objc_opt_self();
}

uint64_t method lookup function for JQTask()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQTask.begin()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t dispatch thunk of JQTask.end()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152LL))();
}

uint64_t dispatch thunk of JQTask.__allocating_init(conn:description:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t getEnumTagSinglePayload for JQTask.TaskState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
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
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

uint64_t storeEnumTagSinglePayload for JQTask.TaskState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1891F1058 + 4 * byte_1891F8FB5[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1891F108C + 4 * asc_1891F8FB0[v4]))();
}

uint64_t sub_1891F108C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891F1094(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891F109CLL);
  }
  return result;
}

uint64_t sub_1891F10A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891F10B0LL);
  }
  *(_BYTE *)__n128 result = a2 + 2;
  return result;
}

uint64_t sub_1891F10B4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891F10BC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JQTask.TaskState()
{
  return &type metadata for JQTask.TaskState;
}

uint64_t storeEnumTagSinglePayload for JQTaskDescriptor.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1891F1124 + 4 * byte_1891F8FBF[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1891F1158 + 4 * byte_1891F8FBA[v4]))();
}

uint64_t sub_1891F1158(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891F1160(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891F1168LL);
  }
  return result;
}

uint64_t sub_1891F1174(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891F117CLL);
  }
  *(_BYTE *)__n128 result = a2 + 3;
  return result;
}

uint64_t sub_1891F1180(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891F1188(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JQTaskDescriptor.CodingKeys()
{
  return &type metadata for JQTaskDescriptor.CodingKeys;
}

unint64_t sub_1891F11A8()
{
  unint64_t result = qword_18C788230[0];
  if (!qword_18C788230[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F91A0, &type metadata for JQTaskDescriptor.CodingKeys);
    atomic_store(result, qword_18C788230);
  }

  return result;
}

unint64_t sub_1891F11F0()
{
  unint64_t result = qword_18C788340;
  if (!qword_18C788340)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9110, &type metadata for JQTaskDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C788340);
  }

  return result;
}

unint64_t sub_1891F1238()
{
  unint64_t result = qword_18C788348[0];
  if (!qword_18C788348[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9138, &type metadata for JQTaskDescriptor.CodingKeys);
    atomic_store(result, qword_18C788348);
  }

  return result;
}

uint64_t sub_1891F127C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701667182 && a2 == 0xE400000000000000LL;
  if (v3 || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 6580592 && a2 == 0xE300000000000000LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else if (a1 == 0x6E6F697461727564LL && a2 == 0xE800000000000000LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2LL;
  }

  else if (a1 == 0x70756F7247626F6ALL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease();
    return 3LL;
  }

  else
  {
    char v6 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

unint64_t sub_1891F13FC()
{
  unint64_t result = qword_18C781890;
  if (!qword_18C781890)
  {
    uint64_t v1 = type metadata accessor for JQRequestRegisterTask();
    unint64_t result = MEMORY[0x1895E3314](&protocol conformance descriptor for JQRequestRegisterTask, v1);
    atomic_store(result, (unint64_t *)&qword_18C781890);
  }

  return result;
}

uint64_t sub_1891F1444(uint64_t a1)
{
  return sub_1891EFA3C(a1);
}

uint64_t sub_1891F144C()
{
  return sub_1891EFE78();
}

void OS_dispatch_group.with(_:)(void (*a1)(void))
{
}

void JQRequestCodable.genericRequest.getter()
{
  __asm { BR              X10 }

uint64_t sub_1891F14E4()
{
  v0[3] = type metadata accessor for JQRequestInitiateQuiescence();
  v0[4] = sub_1891EA280( &qword_18C781F50,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestInitiateQuiescence,  (uint64_t)&protocol conformance descriptor for JQRequestInitiateQuiescence);
  void *v0 = v1;
  return swift_retain();
}

void sub_1891F1610()
{
  qword_18C789C10 = 0x54534555514552LL;
  *(void *)algn_18C789C18 = 0xE700000000000000LL;
}

uint64_t *sub_1891F1634()
{
  if (qword_18C7883D0 != -1) {
    swift_once();
  }
  return &qword_18C789C10;
}

uint64_t sub_1891F1674()
{
  if (qword_18C7883D0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_18C789C10;
  swift_bridgeObjectRetain();
  return v0;
}

xpc_object_t static JQRequestCodable.from(xpc:)(void *a1)
{
  if (qword_18C7883D0 != -1) {
    swift_once();
  }
  xpc_object_t result = xpc_dictionary_get_value(a1, "REQUEST");
  if (result)
  {
    BOOL v3 = result;
    xpc_object_t result = (xpc_object_t)xpc_data_get_bytes_ptr(result);
    if (result)
    {
      uint64_t v4 = result;
      size_t length = xpc_data_get_length(v3);
      uint64_t v6 = sub_1891F35DC(v4, length);
      unint64_t v8 = v7;
      sub_1891F3688();
      sub_1891F5988();
      sub_1891F36CC(v6, v8);
      swift_release();
      return (xpc_object_t)swift_unknownObjectRelease();
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_1891F17E8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1891F1820 + 4 * byte_1891F9266[a1]))( 0xD000000000000011LL,  0x80000001891FB1E0LL);
}

uint64_t sub_1891F1820()
{
  return 0x4A65637365697571LL;
}

uint64_t sub_1891F1840()
{
  return 0x73736572676F7270LL;
}

uint64_t sub_1891F1858()
{
  return 0x6269726373627573LL;
}

uint64_t sub_1891F1874()
{
  return 1802723700LL;
}

uint64_t sub_1891F1884()
{
  return 0x6275536F6C6C6568LL;
}

uint64_t sub_1891F18A8()
{
  return sub_1891F17E8(*v0);
}

uint64_t sub_1891F18B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1891F4648(a1, a2);
  *a3 = result;
  return result;
}

void sub_1891F18D4(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_1891F18E0()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891F1908()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891F1934()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891F195C()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891F1984()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891F19AC()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891F19D4()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891F19FC()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891F1A24()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891F1A4C()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891F1A74()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891F1A9C()
{
  return sub_1891F5DCC();
}

uint64_t sub_1891F1AC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result = sub_1891F48C0(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_1891F1AF0()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891F1B18()
{
  return sub_1891F5DCC();
}

void JQRequestCodable.encode(to:)(void *a1)
{
  int v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781F60);
  v17[12] = *(void *)(v4 - 8);
  v17[13] = v4;
  MEMORY[0x1895F8858](v4);
  v17[11] = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781F68);
  v17[9] = *(void *)(v6 - 8);
  v17[10] = v6;
  MEMORY[0x1895F8858](v6);
  v17[8] = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781F70);
  v17[6] = *(void *)(v8 - 8);
  v17[7] = v8;
  MEMORY[0x1895F8858](v8);
  v17[5] = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781F78);
  v17[3] = *(void *)(v10 - 8);
  v17[4] = v10;
  MEMORY[0x1895F8858](v10);
  v17[2] = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781F80);
  v17[0] = *(void *)(v12 - 8);
  v17[1] = v12;
  MEMORY[0x1895F8858](v12);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781F88);
  MEMORY[0x1895F8858](v13);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781F90);
  v17[14] = *(void *)(v18 - 8);
  MEMORY[0x1895F8858](v18);
  uint64_t v15 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891F3710();
  v17[15] = v15;
  sub_1891F5D90();
  __asm { BR              X10 }

uint64_t sub_1891F1D80()
{
  *(_BYTE *)(v4 - 72) = 0;
  sub_1891F38A8();
  swift_retain();
  uint64_t v5 = *(void *)(v4 - 88);
  uint64_t v6 = *(void *)(v4 - 104);
  sub_1891F5CB8();
  *(void *)(v4 - 72) = v0;
  type metadata accessor for JQRequestInitiateQuiescence();
  sub_1891EA280( &qword_18C780FF8,  (uint64_t (*)(uint64_t))type metadata accessor for JQRequestInitiateQuiescence,  (uint64_t)&protocol conformance descriptor for JQRequestInitiateQuiescence);
  sub_1891F5CF4();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 112) + 8LL))(v6, v5);
  return swift_release();
}

uint64_t JQRequestCodable.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  v28[18] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781F98);
  v28[16] = *(void *)(v3 - 8);
  v28[17] = v3;
  MEMORY[0x1895F8858](v3);
  v28[15] = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781FA0);
  v28[9] = *(void *)(v5 - 8);
  v28[10] = v5;
  MEMORY[0x1895F8858](v5);
  v28[14] = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781FA8);
  v28[7] = *(void *)(v7 - 8);
  v28[8] = v7;
  MEMORY[0x1895F8858](v7);
  v28[13] = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781FB0);
  v28[5] = *(void *)(v9 - 8);
  v28[6] = v9;
  MEMORY[0x1895F8858](v9);
  v28[12] = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781FB8);
  v28[3] = *(void *)(v11 - 8);
  v28[4] = v11;
  MEMORY[0x1895F8858](v11);
  v28[11] = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781FC0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1895F8858](v13);
  uint64_t v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781FC8);
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1895F8858](v17);
  unint64_t v20 = (char *)v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = a1[3];
  uint64_t v29 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  sub_1891F3710();
  uint64_t v22 = v30;
  sub_1891F5D84();
  if (!v22)
  {
    v28[1] = v13;
    v28[2] = v16;
    v28[0] = v14;
    uint64_t v30 = v18;
    uint64_t v23 = sub_1891F5CAC();
    if (*(void *)(v23 + 16) == 1LL) {
      __asm { BR              X10 }
    }

    uint64_t v24 = sub_1891F5C04();
    swift_allocError();
    uint64_t v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C7816D0);
    *uint64_t v26 = &type metadata for JQRequestCodable;
    sub_1891F5C58();
    sub_1891F5BF8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v24 - 8) + 104LL))( v26,  *MEMORY[0x189619358],  v24);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v20, v17);
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
}

uint64_t sub_1891F2AC8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return JQRequestCodable.init(from:)(a1, a2);
}

void sub_1891F2ADC(void *a1)
{
}

xpc_object_t sub_1891F2AF0(void *a1)
{
  xpc_object_t empty = (xpc_object_t)a1[3];
  uint64_t v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, (uint64_t)empty);
  (*(void (**)(uint64_t *__return_ptr, xpc_object_t, uint64_t))(v3 + 48))(&v9, empty, v3);
  if (!v1)
  {
    uint64_t v4 = v9;
    xpc_object_t empty = xpc_dictionary_create_empty();
    sub_1891F59D0();
    swift_allocObject();
    sub_1891F59C4();
    sub_1891F59AC();
    uint64_t v9 = v4;
    sub_1891F38EC();
    uint64_t v5 = sub_1891F59B8();
    unint64_t v7 = v6;
    MEMORY[0x1895F8858]();
    sub_1891F59E8();
    swift_release();
    swift_release();
    sub_1891F36CC(v5, v7);
  }

  return empty;
}

uint64_t JQRequest.asCodable()(uint64_t a1)
{
  uint64_t v2 = sub_1891F5A0C();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1891EEAC8();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  unint64_t v7 = (os_log_s *)sub_1891F59F4();
  os_log_type_t v8 = sub_1891F5B50();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v15 = v9 + 4;
    uint64_t v16 = a1;
    swift_getMetatypeMetadata();
    uint64_t v11 = sub_1891F5AA8();
    uint64_t v16 = sub_1891E24FC(v11, v12, &v17);
    sub_1891F5BA4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1891D9000, v7, v8, "%s does not implement asCodable", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E33A4](v10, -1LL, -1LL);
    MEMORY[0x1895E33A4](v9, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1891E24B8();
  swift_allocError();
  *uint64_t v13 = 1;
  return swift_willThrow();
}

uint64_t static JQRequest.allowedConnectionTypes.getter()
{
  return MEMORY[0x18961AFE8];
}

xpc_object_t JQRequest.asXPC()(uint64_t a1, uint64_t a2)
{
  v7[4] = a2;
  v7[3] = a1;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16LL))(boxed_opaque_existential_1, v2, a1);
  xpc_object_t v5 = sub_1891F2AF0(v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

uint64_t static JQRequestWithEndpoint.endpointXpcKey.getter()
{
  return 0x544E494F50444E45LL;
}

xpc_object_t JQRequestWithEndpoint.asXPC()(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v12[3] = a1;
  v12[4] = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16LL))(boxed_opaque_existential_1, v2, a1);
  xpc_object_t v8 = sub_1891F2AF0(v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  if (!v3)
  {
    uint64_t v9 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
    uint64_t v10 = sub_1891F5AB4();
    swift_bridgeObjectRelease();
    xpc_dictionary_set_value(v8, (const char *)(v10 + 32), v9);
    swift_unknownObjectRelease();
    swift_release();
  }

  return v8;
}

uint64_t sub_1891F2FB0()
{
  return 0x45534E4F50534552LL;
}

_BYTE *sub_1891F2FC8(void *a1)
{
  uint64_t v2 = sub_1891F5AB4();
  swift_bridgeObjectRelease();
  xpc_object_t v3 = xpc_dictionary_get_value(a1, (const char *)(v2 + 32));
  swift_release();
  if (v3)
  {
    uint64_t result = xpc_data_get_bytes_ptr(v3);
    if (result)
    {
      xpc_object_t v5 = result;
      size_t length = xpc_data_get_length(v3);
      uint64_t v7 = sub_1891F35DC(v5, length);
      unint64_t v9 = v8;
      sub_1891F5988();
      sub_1891F36CC(v7, v9);
      swift_release();
      return (_BYTE *)swift_unknownObjectRelease();
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    sub_1891E24B8();
    swift_allocError();
    *uint64_t v10 = 1;
    swift_willThrow();
    return (_BYTE *)swift_release();
  }

  return result;
}

xpc_object_t JQResponse.asXPC(replyingTo:)(void *a1)
{
  xpc_object_t result = xpc_dictionary_create_reply(a1);
  if (result)
  {
    xpc_object_t v3 = result;
    sub_1891F59D0();
    swift_allocObject();
    sub_1891F59C4();
    sub_1891F59AC();
    uint64_t v4 = sub_1891F59B8();
    if (v1)
    {
      swift_unknownObjectRelease();
      swift_release();
    }

    else
    {
      uint64_t v6 = v4;
      unint64_t v7 = v5;
      MEMORY[0x1895F8858](v4);
      sub_1891F59E8();
      swift_release();
      sub_1891F36CC(v6, v7);
    }

    return v3;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t static JQError.xpcKey.getter()
{
  return 0x524F525245LL;
}

uint64_t static JQError.from(xpc:)@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v4 = sub_1891F5A48();
  uint64_t result = swift_unknownObjectRelease();
  if ((void *)v4 == a1)
  {
    *a2 = 7;
  }

  else
  {
    uint64_t v6 = sub_1891F5A60();
    uint64_t result = swift_unknownObjectRelease();
    if ((void *)v6 == a1)
    {
      *a2 = 6;
    }

    else
    {
      uint64_t v7 = sub_1891F5A54();
      uint64_t result = swift_unknownObjectRelease();
      if ((void *)v7 == a1)
      {
        *a2 = 8;
      }

      else
      {
        sub_1891F59A0();
        swift_allocObject();
        sub_1891F5994();
        xpc_object_t v8 = xpc_dictionary_get_value(a1, "ERROR");
        if (v8)
        {
          unint64_t v9 = v8;
          uint64_t result = (uint64_t)xpc_data_get_bytes_ptr(v8);
          if (result)
          {
            uint64_t v10 = (_BYTE *)result;
            size_t length = xpc_data_get_length(v9);
            uint64_t v12 = sub_1891F35DC(v10, length);
            unint64_t v14 = v13;
            sub_1891F3B30();
            sub_1891F5988();
            sub_1891F36CC(v12, v14);
            swift_release();
            return swift_unknownObjectRelease();
          }

          else
          {
            __break(1u);
          }
        }

        else
        {
          sub_1891E24B8();
          swift_allocError();
          *uint64_t v15 = 1;
          swift_willThrow();
          return swift_release();
        }
      }
    }
  }

  return result;
}

xpc_object_t JQError.asXPC(replyingTo:)(void *a1)
{
  xpc_object_t result = xpc_dictionary_create_reply(a1);
  if (result)
  {
    xpc_object_t v3 = result;
    sub_1891F59D0();
    swift_allocObject();
    sub_1891F59C4();
    sub_1891F59AC();
    sub_1891F3B74();
    uint64_t v4 = sub_1891F59B8();
    if (v1)
    {
      swift_unknownObjectRelease();
      swift_release();
    }

    else
    {
      uint64_t v6 = v4;
      unint64_t v7 = v5;
      MEMORY[0x1895F8858](v4);
      sub_1891F59E8();
      swift_release();
      sub_1891F36CC(v6, v7);
    }

    return v3;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_1891F351C(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_1891F35DC(_BYTE *__src, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 <= 14) {
    return sub_1891F351C(__src, &__src[a2]);
  }
  sub_1891F597C();
  swift_allocObject();
  sub_1891F5970();
  sub_1891F59DC();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = a2;
  return result;
}

unint64_t sub_1891F3688()
{
  unint64_t result = qword_18C781F58;
  if (!qword_18C781F58)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for JQRequestCodable,  &type metadata for JQRequestCodable);
    atomic_store(result, (unint64_t *)&qword_18C781F58);
  }

  return result;
}

uint64_t sub_1891F36CC(uint64_t a1, unint64_t a2)
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

unint64_t sub_1891F3710()
{
  unint64_t result = qword_18C7883D8;
  if (!qword_18C7883D8)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9AD4, &type metadata for JQRequestCodable.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7883D8);
  }

  return result;
}

unint64_t sub_1891F3754()
{
  unint64_t result = qword_18C7883E0;
  if (!qword_18C7883E0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9A84, &type metadata for JQRequestCodable.HelloSubscriberCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7883E0);
  }

  return result;
}

unint64_t sub_1891F3798()
{
  unint64_t result = qword_18C7883E8;
  if (!qword_18C7883E8)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9A34, &type metadata for JQRequestCodable.QuiesceSubscriberCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7883E8);
  }

  return result;
}

unint64_t sub_1891F37DC()
{
  unint64_t result = qword_18C7883F0;
  if (!qword_18C7883F0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F99E4, &type metadata for JQRequestCodable.TaskCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7883F0);
  }

  return result;
}

unint64_t sub_1891F3820()
{
  unint64_t result = qword_18C7883F8;
  if (!qword_18C7883F8)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9994, &type metadata for JQRequestCodable.SubscribeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7883F8);
  }

  return result;
}

unint64_t sub_1891F3864()
{
  unint64_t result = qword_18C788400;
  if (!qword_18C788400)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9944, &type metadata for JQRequestCodable.ProgressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C788400);
  }

  return result;
}

unint64_t sub_1891F38A8()
{
  unint64_t result = qword_18C788408[0];
  if (!qword_18C788408[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F98F4, &type metadata for JQRequestCodable.QuiesceJobsCodingKeys);
    atomic_store(result, qword_18C788408);
  }

  return result;
}

unint64_t sub_1891F38EC()
{
  unint64_t result = qword_18C781FD0;
  if (!qword_18C781FD0)
  {
    unint64_t result = MEMORY[0x1895E3314]( &protocol conformance descriptor for JQRequestCodable,  &type metadata for JQRequestCodable);
    atomic_store(result, (unint64_t *)&qword_18C781FD0);
  }

  return result;
}

void sub_1891F3930()
{
  __asm { BR              X12 }

uint64_t sub_1891F396C(const void *a1)
{
  xpc_object_t v3 = xpc_data_create(a1, BYTE6(v1));
  if (qword_18C7883D0 != -1) {
    swift_once();
  }
  xpc_dictionary_set_value(v2, "REQUEST", v3);
  return swift_unknownObjectRelease();
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

void sub_1891F3A48()
{
  __asm { BR              X12 }

uint64_t sub_1891F3A84(const void *a1)
{
  xpc_object_t v3 = xpc_data_create(a1, BYTE6(v1));
  uint64_t v4 = sub_1891F5AB4();
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  xpc_dictionary_set_value(v2, (const char *)(v4 + 32), v3);
  swift_release();
  return swift_unknownObjectRelease_n();
}

unint64_t sub_1891F3B30()
{
  unint64_t result = qword_18C781FD8;
  if (!qword_18C781FD8)
  {
    unint64_t result = MEMORY[0x1895E3314](&protocol conformance descriptor for JQError, &type metadata for JQError);
    atomic_store(result, (unint64_t *)&qword_18C781FD8);
  }

  return result;
}

unint64_t sub_1891F3B74()
{
  unint64_t result = qword_18C781FE0;
  if (!qword_18C781FE0)
  {
    unint64_t result = MEMORY[0x1895E3314](&protocol conformance descriptor for JQError, &type metadata for JQError);
    atomic_store(result, (unint64_t *)&qword_18C781FE0);
  }

  return result;
}

void sub_1891F3BB8()
{
  __asm { BR              X12 }

uint64_t sub_1891F3BF4(const void *a1)
{
  xpc_object_t v3 = xpc_data_create(a1, BYTE6(v1));
  xpc_dictionary_set_value(v2, "ERROR", v3);
  return swift_unknownObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for JQRequestCodable(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for JQRequestCodable()
{
  return swift_release();
}

void *assignWithCopy for JQRequestCodable(void *a1, void *a2)
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

void *assignWithTake for JQRequestCodable(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for JQRequestCodable(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7B && *(_BYTE *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 123);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 4) | (8 * ((*(void *)a1 >> 57) & 8 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7A) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for JQRequestCodable(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7A)
  {
    *(void *)unint64_t result = a2 - 123;
    if (a3 >= 0x7B) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7B) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 3) & 0xF | (16 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007LL;
    }
  }

  return result;
}

uint64_t sub_1891F3DD4(void *a1)
{
  return *a1 >> 61;
}

void *sub_1891F3DE0(void *result)
{
  *result &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *sub_1891F3DF0(uint64_t *result, uint64_t a2)
{
  *unint64_t result = *result & 0xFFFFFFFFFFFFFF8LL | (a2 << 61);
  return result;
}

ValueMetadata *type metadata accessor for JQRequestCodable()
{
  return &type metadata for JQRequestCodable;
}

uint64_t getEnumTagSinglePayload for JQRequestCodable.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for JQRequestCodable.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1891F3EF0 + 4 * byte_1891F9283[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1891F3F24 + 4 * byte_1891F927E[v4]))();
}

uint64_t sub_1891F3F24(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891F3F2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891F3F34LL);
  }
  return result;
}

uint64_t sub_1891F3F40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891F3F48LL);
  }
  *(_BYTE *)unint64_t result = a2 + 5;
  return result;
}

uint64_t sub_1891F3F4C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891F3F54(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JQRequestCodable.CodingKeys()
{
  return &type metadata for JQRequestCodable.CodingKeys;
}

ValueMetadata *type metadata accessor for JQRequestCodable.QuiesceJobsCodingKeys()
{
  return &type metadata for JQRequestCodable.QuiesceJobsCodingKeys;
}

ValueMetadata *type metadata accessor for JQRequestCodable.ProgressCodingKeys()
{
  return &type metadata for JQRequestCodable.ProgressCodingKeys;
}

ValueMetadata *type metadata accessor for JQRequestCodable.SubscribeCodingKeys()
{
  return &type metadata for JQRequestCodable.SubscribeCodingKeys;
}

ValueMetadata *type metadata accessor for JQRequestCodable.TaskCodingKeys()
{
  return &type metadata for JQRequestCodable.TaskCodingKeys;
}

ValueMetadata *type metadata accessor for JQRequestCodable.QuiesceSubscriberCodingKeys()
{
  return &type metadata for JQRequestCodable.QuiesceSubscriberCodingKeys;
}

uint64_t _s13JobQuiescence16JQRequestCodableO21QuiesceJobsCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1891F4004 + 4 * byte_1891F9288[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1891F4024 + 4 * byte_1891F928D[v4]))();
  }
}

_BYTE *sub_1891F4004(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1891F4024(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1891F402C(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1891F4034(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1891F403C(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1891F4044(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for JQRequestCodable.HelloSubscriberCodingKeys()
{
  return &type metadata for JQRequestCodable.HelloSubscriberCodingKeys;
}

unint64_t sub_1891F4064()
{
  unint64_t result = qword_18C788610[0];
  if (!qword_18C788610[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F947C, &type metadata for JQRequestCodable.HelloSubscriberCodingKeys);
    atomic_store(result, qword_18C788610);
  }

  return result;
}

unint64_t sub_1891F40AC()
{
  unint64_t result = qword_18C788820[0];
  if (!qword_18C788820[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9534, &type metadata for JQRequestCodable.QuiesceSubscriberCodingKeys);
    atomic_store(result, qword_18C788820);
  }

  return result;
}

unint64_t sub_1891F40F4()
{
  unint64_t result = qword_18C788A30[0];
  if (!qword_18C788A30[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F95EC, &type metadata for JQRequestCodable.TaskCodingKeys);
    atomic_store(result, qword_18C788A30);
  }

  return result;
}

unint64_t sub_1891F413C()
{
  unint64_t result = qword_18C788C40[0];
  if (!qword_18C788C40[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F96A4, &type metadata for JQRequestCodable.SubscribeCodingKeys);
    atomic_store(result, qword_18C788C40);
  }

  return result;
}

unint64_t sub_1891F4184()
{
  unint64_t result = qword_18C788E50[0];
  if (!qword_18C788E50[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F975C, &type metadata for JQRequestCodable.ProgressCodingKeys);
    atomic_store(result, qword_18C788E50);
  }

  return result;
}

unint64_t sub_1891F41CC()
{
  unint64_t result = qword_18C789060[0];
  if (!qword_18C789060[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9814, &type metadata for JQRequestCodable.QuiesceJobsCodingKeys);
    atomic_store(result, qword_18C789060);
  }

  return result;
}

unint64_t sub_1891F4214()
{
  unint64_t result = qword_18C789270[0];
  if (!qword_18C789270[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F98CC, &type metadata for JQRequestCodable.CodingKeys);
    atomic_store(result, qword_18C789270);
  }

  return result;
}

unint64_t sub_1891F425C()
{
  unint64_t result = qword_18C789380;
  if (!qword_18C789380)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9784, &type metadata for JQRequestCodable.QuiesceJobsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C789380);
  }

  return result;
}

unint64_t sub_1891F42A4()
{
  unint64_t result = qword_18C789388[0];
  if (!qword_18C789388[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F97AC, &type metadata for JQRequestCodable.QuiesceJobsCodingKeys);
    atomic_store(result, qword_18C789388);
  }

  return result;
}

unint64_t sub_1891F42EC()
{
  unint64_t result = qword_18C789410;
  if (!qword_18C789410)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F96CC, &type metadata for JQRequestCodable.ProgressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C789410);
  }

  return result;
}

unint64_t sub_1891F4334()
{
  unint64_t result = qword_18C789418[0];
  if (!qword_18C789418[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F96F4, &type metadata for JQRequestCodable.ProgressCodingKeys);
    atomic_store(result, qword_18C789418);
  }

  return result;
}

unint64_t sub_1891F437C()
{
  unint64_t result = qword_18C7894A0;
  if (!qword_18C7894A0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9614, &type metadata for JQRequestCodable.SubscribeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7894A0);
  }

  return result;
}

unint64_t sub_1891F43C4()
{
  unint64_t result = qword_18C7894A8[0];
  if (!qword_18C7894A8[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F963C, &type metadata for JQRequestCodable.SubscribeCodingKeys);
    atomic_store(result, qword_18C7894A8);
  }

  return result;
}

unint64_t sub_1891F440C()
{
  unint64_t result = qword_18C789530;
  if (!qword_18C789530)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F955C, &type metadata for JQRequestCodable.TaskCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C789530);
  }

  return result;
}

unint64_t sub_1891F4454()
{
  unint64_t result = qword_18C789538[0];
  if (!qword_18C789538[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9584, &type metadata for JQRequestCodable.TaskCodingKeys);
    atomic_store(result, qword_18C789538);
  }

  return result;
}

unint64_t sub_1891F449C()
{
  unint64_t result = qword_18C7895C0;
  if (!qword_18C7895C0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F94A4, &type metadata for JQRequestCodable.QuiesceSubscriberCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7895C0);
  }

  return result;
}

unint64_t sub_1891F44E4()
{
  unint64_t result = qword_18C7895C8[0];
  if (!qword_18C7895C8[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F94CC, &type metadata for JQRequestCodable.QuiesceSubscriberCodingKeys);
    atomic_store(result, qword_18C7895C8);
  }

  return result;
}

unint64_t sub_1891F452C()
{
  unint64_t result = qword_18C789650;
  if (!qword_18C789650)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F93EC, &type metadata for JQRequestCodable.HelloSubscriberCodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C789650);
  }

  return result;
}

unint64_t sub_1891F4574()
{
  unint64_t result = qword_18C789658[0];
  if (!qword_18C789658[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9414, &type metadata for JQRequestCodable.HelloSubscriberCodingKeys);
    atomic_store(result, qword_18C789658);
  }

  return result;
}

unint64_t sub_1891F45BC()
{
  unint64_t result = qword_18C7896E0;
  if (!qword_18C7896E0)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F983C, &type metadata for JQRequestCodable.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7896E0);
  }

  return result;
}

unint64_t sub_1891F4604()
{
  unint64_t result = qword_18C7896E8[0];
  if (!qword_18C7896E8[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9864, &type metadata for JQRequestCodable.CodingKeys);
    atomic_store(result, qword_18C7896E8);
  }

  return result;
}

uint64_t sub_1891F4648(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x4A65637365697571LL && a2 == 0xEB0000000073626FLL;
  if (v3 || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x73736572676F7270LL && a2 == 0xE800000000000000LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else if (a1 == 0x6269726373627573LL && a2 == 0xE900000000000065LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2LL;
  }

  else if (a1 == 1802723700 && a2 == 0xE400000000000000LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3LL;
  }

  else if (a1 == 0xD000000000000011LL && a2 == 0x80000001891FB1E0LL || (sub_1891F5D18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4LL;
  }

  else if (a1 == 0x6275536F6C6C6568LL && a2 == 0xEF72656269726373LL)
  {
    swift_bridgeObjectRelease();
    return 5LL;
  }

  else
  {
    char v6 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 5LL;
    }
    else {
      return 6LL;
    }
  }

uint64_t sub_1891F48C0(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000LL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }

  else
  {
    char v3 = sub_1891F5D18();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }

  return v4 & 1;
}

uint64_t JQRequest.description.getter()
{
  return sub_1891F5DD8();
}

uint64_t JQResponseEmpty.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t JQResponseEmpty.init()()
{
  return v0;
}

uint64_t sub_1891F4958()
{
  return sub_1891F5DC0();
}

uint64_t sub_1891F4980()
{
  return sub_1891F5DCC();
}

uint64_t JQResponseEmpty.deinit()
{
  return v0;
}

uint64_t JQResponseEmpty.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891F49C0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C781FE8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891F4B58();
  sub_1891F5D90();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t JQResponseEmpty.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

uint64_t JQResponseEmpty.init(from:)(uint64_t a1)
{
  return v1;
}

uint64_t sub_1891F4AFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 96))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_1891F4B28()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88LL))();
}

uint64_t _s13JobQuiescence10JQResponsePAAE11descriptionSSvg_0()
{
  return sub_1891F5DD8();
}

unint64_t sub_1891F4B58()
{
  unint64_t result = qword_18C789770[0];
  if (!qword_18C789770[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9C44, &type metadata for JQResponseEmpty.CodingKeys);
    atomic_store(result, qword_18C789770);
  }

  return result;
}

uint64_t sub_1891F4B9C(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1891F4C08(&qword_18C781FF0, (uint64_t)&protocol conformance descriptor for JQResponseEmpty);
  uint64_t result = sub_1891F4C08(&qword_18C781FF8, (uint64_t)&protocol conformance descriptor for JQResponseEmpty);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t type metadata accessor for JQResponseEmpty()
{
  return objc_opt_self();
}

uint64_t sub_1891F4C08(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for JQResponseEmpty();
    uint64_t result = MEMORY[0x1895E3314](a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t dispatch thunk of JQRequestWithEndpoint.endpoint.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of JQRequestWithEndpoint.endpoint.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of JQRequestWithEndpoint.endpoint.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t method lookup function for JQResponseEmpty()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JQResponseEmpty.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of JQResponseEmpty.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88LL))();
}

uint64_t dispatch thunk of JQResponseEmpty.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

ValueMetadata *type metadata accessor for JQResponseEmpty.CodingKeys()
{
  return &type metadata for JQResponseEmpty.CodingKeys;
}

unint64_t sub_1891F4CB8()
{
  unint64_t result = qword_18C789A00;
  if (!qword_18C789A00)
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9BF4, &type metadata for JQResponseEmpty.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C789A00);
  }

  return result;
}

unint64_t sub_1891F4D00()
{
  unint64_t result = qword_18C789A08[0];
  if (!qword_18C789A08[0])
  {
    unint64_t result = MEMORY[0x1895E3314](&unk_1891F9C1C, &type metadata for JQResponseEmpty.CodingKeys);
    atomic_store(result, qword_18C789A08);
  }

  return result;
}

void *sub_1891F4D44()
{
  return &unk_18A362160;
}

unint64_t JQDLogSubsystem.getter()
{
  return 0xD000000000000017LL;
}

void *sub_1891F4D6C()
{
  return &unk_18A362170;
}

unint64_t JQDServiceName.getter()
{
  return 0xD000000000000017LL;
}

void *sub_1891F4D94()
{
  return &unk_1891F9C98;
}

uint64_t JQDServiceVersion.getter()
{
  return 1LL;
}

uint64_t sub_1891F4DA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56LL))(a2, 1LL, 1LL);
}

uint64_t NotCoded.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = sub_1891F5B98();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40LL))(a3, a1, v5);
}

uint64_t NotCoded.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1891F5B98();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a1, v1, v3);
}

uint64_t sub_1891F4E68@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return NotCoded.wrappedValue.getter(a4);
}

uint64_t sub_1891F4EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + a3 - 8);
  uint64_t v6 = sub_1891F5B98();
  MEMORY[0x1895F8858](v6);
  int v8 = (char *)&v13 - v7;
  (*(void (**)(char *, uint64_t))(v9 + 16))((char *)&v13 - v7, a1);
  type metadata accessor for NotCoded(0LL, v5, v10, v11);
  return NotCoded.wrappedValue.setter((uint64_t)v8);
}

uint64_t NotCoded.wrappedValue.setter(uint64_t a1)
{
  uint64_t v3 = sub_1891F5B98();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40LL))(v1, a1, v3);
}

void (*NotCoded.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  uint64_t v6 = *(void *)(a2 + 16);
  *uint64_t v5 = v2;
  v5[1] = v6;
  uint64_t v7 = sub_1891F5B98();
  v5[2] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[3] = v8;
  size_t v9 = *(void *)(v8 + 64);
  v5[4] = malloc(v9);
  v5[5] = malloc(v9);
  (*(void (**)(void))(v8 + 16))();
  return sub_1891F500C;
}

void sub_1891F500C(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[4];
  uint64_t v4 = (void *)(*a1)[5];
  if ((a2 & 1) != 0)
  {
    uint64_t v5 = v2[2];
    uint64_t v6 = v2[3];
    uint64_t v7 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[4], v4, v5);
    uint64_t v8 = sub_1891F5B98();
    (*(void (**)(uint64_t, void *, uint64_t))(*(void *)(v8 - 8) + 40LL))(v7, v3, v8);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }

  else
  {
    uint64_t v9 = *v2;
    uint64_t v10 = sub_1891F5B98();
    (*(void (**)(uint64_t, void *, uint64_t))(*(void *)(v10 - 8) + 40LL))(v9, v4, v10);
  }

  free(v4);
  free(v3);
  free(v2);
}

uint64_t NotCoded.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56LL);
  v5(a3, 1LL, 1LL, a2);
  uint64_t v6 = sub_1891F5B98();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a3, v6);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v5)(a3, 1LL, 1LL, a2);
}

uint64_t sub_1891F515C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return NotCoded.init(from:)(a1, *(void *)(a2 + 16), a3);
}

uint64_t sub_1891F5174()
{
  return 8LL;
}

void *sub_1891F5180(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1891F518C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1891F5194()
{
  uint64_t result = sub_1891F5B98();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *sub_1891F5200(uint64_t *a1, uint64_t *a2, uint64_t a3)
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

uint64_t sub_1891F52D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1LL, v3);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return result;
}

void *sub_1891F5334(void *a1, const void *a2, uint64_t a3)
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

void *sub_1891F53CC(void *a1, void *a2, uint64_t a3)
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

void *sub_1891F54AC(void *a1, const void *a2, uint64_t a3)
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

void *sub_1891F5544(void *a1, void *a2, uint64_t a3)
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

uint64_t sub_1891F5624(uint64_t a1, unsigned int a2, uint64_t a3)
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

void sub_1891F5764(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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

void sub_1891F590C()
{
  *(_BYTE *)(v0 + v1) = v2;
}

void sub_1891F5914()
{
  *(_WORD *)(v0 + v1) = v2;
}

uint64_t type metadata accessor for NotCoded(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NotCoded);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1895E32CC](a1, v6, a5);
}

uint64_t sub_1891F5970()
{
  return MEMORY[0x189606200]();
}

uint64_t sub_1891F597C()
{
  return MEMORY[0x189606260]();
}

uint64_t sub_1891F5988()
{
  return MEMORY[0x1896063B8]();
}

uint64_t sub_1891F5994()
{
  return MEMORY[0x1896063C0]();
}

uint64_t sub_1891F59A0()
{
  return MEMORY[0x1896063C8]();
}

uint64_t sub_1891F59AC()
{
  return MEMORY[0x1896063D0]();
}

uint64_t sub_1891F59B8()
{
  return MEMORY[0x1896063D8]();
}

uint64_t sub_1891F59C4()
{
  return MEMORY[0x1896063E0]();
}

uint64_t sub_1891F59D0()
{
  return MEMORY[0x1896063E8]();
}

uint64_t sub_1891F59DC()
{
  return MEMORY[0x189606BA8]();
}

uint64_t sub_1891F59E8()
{
  return MEMORY[0x189606C38]();
}

uint64_t sub_1891F59F4()
{
  return MEMORY[0x18961D1D8]();
}

uint64_t sub_1891F5A00()
{
  return MEMORY[0x18961D1E0]();
}

uint64_t sub_1891F5A0C()
{
  return MEMORY[0x18961D1F0]();
}

uint64_t sub_1891F5A18()
{
  return MEMORY[0x18961BC20]();
}

uint64_t sub_1891F5A24()
{
  return MEMORY[0x18961BC28]();
}

uint64_t sub_1891F5A30()
{
  return MEMORY[0x18961BC30]();
}

uint64_t sub_1891F5A3C()
{
  return MEMORY[0x18961BC38]();
}

uint64_t sub_1891F5A48()
{
  return MEMORY[0x18961BC40]();
}

uint64_t sub_1891F5A54()
{
  return MEMORY[0x18961BC48]();
}

uint64_t sub_1891F5A60()
{
  return MEMORY[0x18961BC50]();
}

uint64_t sub_1891F5A6C()
{
  return MEMORY[0x18961B6A0]();
}

uint64_t sub_1891F5A78()
{
  return MEMORY[0x18961B6E0]();
}

uint64_t sub_1891F5A84()
{
  return MEMORY[0x18961B6E8]();
}

uint64_t sub_1891F5A90()
{
  return MEMORY[0x18961B708]();
}

uint64_t sub_1891F5A9C()
{
  return MEMORY[0x189617C20]();
}

uint64_t sub_1891F5AA8()
{
  return MEMORY[0x189617C90]();
}

uint64_t sub_1891F5AB4()
{
  return MEMORY[0x189617CB0]();
}

uint64_t sub_1891F5AC0()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_1891F5ACC()
{
  return MEMORY[0x189617E90]();
}

uint64_t sub_1891F5AD8()
{
  return MEMORY[0x189617EB0]();
}

uint64_t sub_1891F5AE4()
{
  return MEMORY[0x189618250]();
}

uint64_t sub_1891F5AF0()
{
  return MEMORY[0x1896182B0]();
}

uint64_t sub_1891F5AFC()
{
  return MEMORY[0x189618308]();
}

uint64_t sub_1891F5B08()
{
  return MEMORY[0x189618320]();
}

uint64_t sub_1891F5B14()
{
  return MEMORY[0x189618358]();
}

uint64_t sub_1891F5B20()
{
  return MEMORY[0x1896183C8]();
}

uint64_t sub_1891F5B2C()
{
  return MEMORY[0x18961D210]();
}

uint64_t sub_1891F5B38()
{
  return MEMORY[0x18961D220]();
}

uint64_t sub_1891F5B44()
{
  return MEMORY[0x18961D228]();
}

uint64_t sub_1891F5B50()
{
  return MEMORY[0x18961D238]();
}

uint64_t sub_1891F5B5C()
{
  return MEMORY[0x18961B8A8]();
}

uint64_t sub_1891F5B68()
{
  return MEMORY[0x18961B920]();
}

uint64_t sub_1891F5B74()
{
  return MEMORY[0x18961B948]();
}

uint64_t sub_1891F5B80()
{
  return MEMORY[0x18961B958]();
}

uint64_t sub_1891F5B8C()
{
  return MEMORY[0x18961B970]();
}

uint64_t sub_1891F5B98()
{
  return MEMORY[0x189618AC0]();
}

uint64_t sub_1891F5BA4()
{
  return MEMORY[0x189618D30]();
}

uint64_t sub_1891F5BB0()
{
  return MEMORY[0x189618D50]();
}

uint64_t sub_1891F5BBC()
{
  return MEMORY[0x189619010]();
}

uint64_t sub_1891F5BC8()
{
  return MEMORY[0x189619018]();
}

uint64_t sub_1891F5BD4()
{
  return MEMORY[0x1896191F0]();
}

uint64_t sub_1891F5BE0()
{
  return MEMORY[0x189619300]();
}

uint64_t sub_1891F5BEC()
{
  return MEMORY[0x189619308]();
}

uint64_t sub_1891F5BF8()
{
  return MEMORY[0x189619378]();
}

uint64_t sub_1891F5C04()
{
  return MEMORY[0x1896193A0]();
}

uint64_t sub_1891F5C10()
{
  return MEMORY[0x189619440]();
}

uint64_t sub_1891F5C1C()
{
  return MEMORY[0x189619660]();
}

uint64_t sub_1891F5C28()
{
  return MEMORY[0x1896198A0]();
}

uint64_t sub_1891F5C34()
{
  return MEMORY[0x189619930]();
}

uint64_t sub_1891F5C40()
{
  return MEMORY[0x189619978]();
}

uint64_t sub_1891F5C4C()
{
  return MEMORY[0x189619A68]();
}

uint64_t sub_1891F5C58()
{
  return MEMORY[0x189619A70]();
}

uint64_t sub_1891F5C64()
{
  return MEMORY[0x189619A80]();
}

uint64_t sub_1891F5C70()
{
  return MEMORY[0x189619AA8]();
}

uint64_t sub_1891F5C7C()
{
  return MEMORY[0x189619AF8]();
}

uint64_t sub_1891F5C88()
{
  return MEMORY[0x189619B20]();
}

uint64_t sub_1891F5C94()
{
  return MEMORY[0x189619B28]();
}

uint64_t sub_1891F5CA0()
{
  return MEMORY[0x189619B30]();
}

uint64_t sub_1891F5CAC()
{
  return MEMORY[0x189619B58]();
}

uint64_t sub_1891F5CB8()
{
  return MEMORY[0x189619B98]();
}

uint64_t sub_1891F5CC4()
{
  return MEMORY[0x189619BB0]();
}

uint64_t sub_1891F5CD0()
{
  return MEMORY[0x189619BD0]();
}

uint64_t sub_1891F5CDC()
{
  return MEMORY[0x189619BF0]();
}

uint64_t sub_1891F5CE8()
{
  return MEMORY[0x189619C18]();
}

uint64_t sub_1891F5CF4()
{
  return MEMORY[0x189619C20]();
}

uint64_t sub_1891F5D00()
{
  return MEMORY[0x189619C38]();
}

uint64_t sub_1891F5D0C()
{
  return MEMORY[0x189619CC8]();
}

uint64_t sub_1891F5D18()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_1891F5D24()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_1891F5D30()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t sub_1891F5D3C()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t sub_1891F5D48()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_1891F5D54()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_1891F5D60()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_1891F5D6C()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t sub_1891F5D78()
{
  return MEMORY[0x18961A788]();
}

uint64_t sub_1891F5D84()
{
  return MEMORY[0x18961A950]();
}

uint64_t sub_1891F5D90()
{
  return MEMORY[0x18961A978]();
}

uint64_t sub_1891F5D9C()
{
  return MEMORY[0x18961AE58]();
}

uint64_t sub_1891F5DA8()
{
  return MEMORY[0x18961AE88]();
}

uint64_t sub_1891F5DB4()
{
  return MEMORY[0x18961AE90]();
}

uint64_t sub_1891F5DC0()
{
  return MEMORY[0x18961AF60]();
}

uint64_t sub_1891F5DCC()
{
  return MEMORY[0x18961AF68]();
}

uint64_t sub_1891F5DD8()
{
  return MEMORY[0x18961AF88]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_release(const void *aBlock)
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

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t remote_device_copy_service()
{
  return MEMORY[0x189611EE0]();
}

uint64_t remote_device_get_name()
{
  return MEMORY[0x189611F18]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x18961B0C0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x18961B0D8]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x18961B160]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x18961B170]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x18961B2A0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x18961B2C0]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x18961B368]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x18961B388]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x18961B3A0]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x18961B430]();
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

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1895FD948](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1895FD950](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1895FDA60]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FDB00](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1895FDBA0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1895FDD70](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

uint64_t xpc_is_system_session()
{
  return MEMORY[0x1895FDED0]();
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x189612008]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x189612020]();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return MEMORY[0x189612048]();
}

uint64_t xpc_remote_connection_send_message_with_reply()
{
  return MEMORY[0x189612088]();
}

uint64_t xpc_remote_connection_send_message_with_reply_sync()
{
  return MEMORY[0x189612098]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x1896120A8]();
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1895FE008]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1895FE0E8]();
}